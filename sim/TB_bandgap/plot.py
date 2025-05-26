import matplotlib
# matplotlib.use("pgf")
# matplotlib.rcParams.update({
#     "pgf.texsystem": "pdflatex",
#     "font.family": "serif",
#     # "font.serif": ["Computer Modern"],
#     "text.usetex": True,
#     "pgf.rcfonts": False,
# })
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
from cicsim import command as cm
from cicsim import ngraw
import yaml
import sys
import math
import re
import os
from matplotlib.ticker import MaxNLocator


k = 1.380649e-23  # Boltzmann constant in J/K
q = 1.602176634e-19  # Elementary charge in C
R1 = 7535
Rout = 8*7535
Tclk = 50e-9  # Clock period in seconds
vref = 1.08        # Do i use the calculated or the simulated vref?
Cosc = 53.8e-15*4*9
Nclk = 1001


def calcIptat(temp):
    return (k * (temp + 273.15) * np.log(8)) / (R1 * q) 

# print("Iptat at 125C:", calcIptat(125))

# print((15e-6 * 100e-9 / (1.1))/53.8e-15)

def calcCount(temp):
    return (Tclk * Nclk)/((Cosc * vref)/calcIptat(temp)) 

# for temp in [-40, -20, 0, 20, 40, 60, 80, 100, 125]:
#     # print("Iptat at", temp, "C:", calcIptat(temp))
#     print("Count at", temp, "C:", calcCount(temp))

def countToTemp(count):
    A = (k * np.log(8)) / (R1 * q)
    temp = (count * (Cosc * vref) / (Tclk * Nclk * A)) - 273.15
    return temp


    

def calcPpm(yamlfile):
    # Read result yaml file
    with open(yamlfile + ".yaml") as fi:
        obj = yaml.safe_load(fi)

    vref = np.array([])
    temp = np.array([])

    for key in obj:
        if key.startswith("vref"):
            vref = np.append(vref, obj[key])
            temp = np.append(temp, int(key.split("_")[1]))

    ppm = round(((np.max(vref) - np.min(vref))/(np.mean(vref)*(np.max(temp)-np.min(temp)))) * 1e6, 2)
    return ppm


def getVref(yamlfile, temp=None):
    with open(yamlfile + ".yaml") as fi:
        obj = yaml.safe_load(fi)

    vref = np.array([])

    if temp is None:
        for key in obj:
            if key.startswith("vref"):
                vref = np.append(vref, obj[key])
        mean = round((np.mean(vref))*1000, 1)
    else:
        for key in obj:
            if key.startswith("vref") and key.split("_")[1] == temp:
                vref = np.append(vref, obj[key])
                break
        mean = round(vref[0]*1000, 1)
    return mean


def calcVrefMaxMinDelta(yamlfile):
    with open(yamlfile + ".yaml") as fi:
        obj = yaml.safe_load(fi)

    vref = np.array([])

    for key in obj:
        if key.startswith("vref"):
            vref = np.append(vref, obj[key])
  
    maxVref = np.max(vref)
    minVref = np.min(vref)
    delta = round(maxVref - minVref, 5)
    return maxVref, minVref, delta


def plot(df, xname, yname, ptype=None, ax=None, label="", color=None):
    cmd = cm.Command()
    if(xname not in df.columns):
        cmd.error("Could not find name %s in %s" %(xname,",".join(df.columns)))
        exit()
    if(yname not in df.columns):
        cmd.error("Could not find name %s in %s" %(xname,",".join(df.columns)))
        exit()
    x = df[xname]
    y = df[yname]

    # --- COUNTER SCALING HERE ---
    if yname in ["v(dec_tmpcount_out1)", "v(dec_tmpcount_out2)"]:
        y = y * 1000

    if label == "":
        label = label_dict.get(yname, yname) 

    if("logy" in ptype):
        ax.semilogy(x, y, label=label, color=color)
    elif("ln2" in ptype):
        ax.plot(x, np.log(y) / np.log(2), label=label, color=color)
    elif("logx" in ptype):
        ax.semilogx(x, y, label, color=color)
    elif("db20" in ptype):
        ax.semilogx(x, 20 * np.log10(y), label="dB20("+label+")", color=color)
    else:
        ax.plot(x, y, label=label, color=color)

    ax.legend()

    if(ptype == ""):
        ax.set_ylabel(yname)
    return (x, y)


def rawplot(
    fraw,
    xname,
    signal_groups=None,        
    ptype=None,
    fname=None,
    xlim=None,
    ylims=None,
    legend_loc=None,
    plot_height=2, 
    colors=None,
):
    """
    signal_groups: List of lists, each list is a group of signals to plot in one subplot.
    ylims:         List of y-limits, one per subplot (or None)
    legend_loc:    List of legend locations, one per subplot (or None/"best")
    """
    dfs = ngraw.toDataFrames(ngraw.ngRawRead(fraw))
    if len(dfs) > 0:
        df = dfs[0]
    else:
        raise Exception("You have multiple plots in .raw file, that's not supported")

    # Convert time to microseconds if xname is "time"
    plot_xname = xname
    if xname == "time":
        df = df.copy()
        df["time"] = df["time"] * 1e6  # now in us

    # Temporary backward compatible handling: if signal_groups is None, build from yname
    if signal_groups is None:
        raise Exception("signal_groups must be specified!")
    n_subplots = len(signal_groups)
    fig, axes = plt.subplots(n_subplots, 1, sharex=True, figsize=(6.1, plot_height*n_subplots))
    fig.subplots_adjust(hspace=0.1)
    if n_subplots == 1:
        axes = [axes]
        
    # Default legend location ("best") if not passed
    if legend_loc is None:
        legend_loc = ["best"] * n_subplots
    elif isinstance(legend_loc, str):
        legend_loc = [legend_loc] * n_subplots
    assert len(legend_loc) == n_subplots, "legend_loc must be a list with length equal to number of subplots"
    
    for i, (signals, ax) in enumerate(zip(signal_groups, axes)):
        subplot_colors = None
        if colors is not None and i < len(colors):
            subplot_colors = colors[i]
        for j, sig in enumerate(signals):
            color = None
            if subplot_colors is not None and j < len(subplot_colors):
                color = subplot_colors[j]
            plot(
                df,
                plot_xname,
                sig,
                ptype,
                ax=ax,
                label="",
                color=color
            )
        if ylims is not None and ylims[i] is not None:
            ax.set_ylim(*ylims[i])
        if xlim is not None:
            ax.set_xlim(*xlim)
        # --- COUNTER LABEL LOGIC HERE ---
        first_signal = signals[0]
        if first_signal in ["v(dec_tmpcount_out1)", "v(dec_tmpcount_out2)"]:
            ax.set_ylabel("Counter")
        else:
            ax.set_ylabel("Voltage [V]")   
        ax.legend(loc=legend_loc[i])
        ax.grid()

    if xname == "time":
        axes[-1].set_xlabel(r'Time [$\mu$s]')
    elif xname == "frequency":
        axes[-1].set_xlabel("Frequency [Hz]")
    elif xname == "temperature":
        axes[-1].set_xlabel("Temperature [K]")
    plt.tight_layout()
    plt.show()
    # plt.savefig("plots/" + fname) 
    
    
def plotVrefTempDependence(yamlfile):
  # Read result yaml file
  with open(yamlfile + ".yaml") as fi:
    obj = yaml.safe_load(fi)

  vref = np.array([])
  temp = np.array([])

  for key in obj:
    if key.startswith("vref"):
      vref = np.append(vref, obj[key])
      temp = np.append(temp, int(key.split("_")[1]))

  sorted_keys = np.argsort(temp)
  sorted_temp = temp[sorted_keys]
  sorted_vref = vref[sorted_keys]

  sorted_vref = (sorted_vref - np.mean(sorted_vref))*1000

  fig,ax = plt.subplots(figsize=(10,5))
  ax.set_xlabel("Temperature [C]")
  ax.set_ylabel("Voltage [mV]")
  ax.plot(sorted_temp,sorted_vref,label="Vref")
  ax.grid()
  ax.legend()
  ax.set_title("Temperature dependence of Vref")
  plt.tight_layout()
  plt.show()


def iptatToTemp(iptat):
    """Inverse of calcIptat: Given a current, estimate the temperature in Celsius."""
    # I = (k * (T+273.15) * ln(8)) / (R1 * q)
    # => T = [I * (R1*q)] / [k * ln(8)] - 273.15
    return (iptat * R1 * q) / (k * np.log(8)) - 273.15


def plotSensTempDependence(
    path,
    POC=None,
    y_estimate_temp=False,
    curent_or_counter="counter",
    show_ideal=False,
    show_inaccuracy=False,
):
    cal_t1 = 40
    cal_t2 = 0
    cal_t3 = 80

    def parse_and_calibrate(filepath, mode="counter"):
        with open(filepath) as fi:
            obj = yaml.safe_load(fi)
        d1 = {}
        d2 = {}
        temps = {}

        if mode == "counter":
            pat1 = r"tmpcount1_(\-?\d+)"
            pat2 = r"tmpcount2_(\-?\d+)"
            scale = 1000.0
        elif mode == "current":
            pat1 = r"iptat_first_(\-?\d+)"
            pat2 = r"iptat_second_(\-?\d+)"
            scale = 1.0
        else:
            raise ValueError("mode must be either 'counter' or 'current'")

        for o in obj:
            m1 = re.match(pat1, o)
            m2 = re.match(pat2, o)
            if m1:
                temp = int(m1.group(1))
                d1[temp] = float(obj[o]) * scale
            elif m2:
                temp = int(m2.group(1))
                d2[temp] = float(obj[o]) * scale

        all_temps = sorted(set(d1.keys()).union(d2.keys()))
        for t in all_temps:
            vals = []
            if t in d1:
                vals.append(d1[t])
            if t in d2:
                vals.append(d2[t])
            if vals:
                avg = sum(vals) / len(vals)
                if len(vals) != 2:
                    print(f"Warning: Only one of {pat1} or {pat2} present for T={t}C in {os.path.basename(filepath)}")
                temps[t] = avg

        # Calibration
        def calibrate(dict_, ideal_func):
            if POC == 1:
                if cal_t1 not in dict_:
                    print(f"{os.path.basename(filepath)}: missing {cal_t1}C for 1pt calibration")
                else:
                    delta = ideal_func(cal_t1) - dict_[cal_t1]
                    dict_ = {k: v + delta for k, v in dict_.items()}
            elif POC == 2:
                if cal_t2 not in dict_ or cal_t3 not in dict_:
                    print(f"{os.path.basename(filepath)}: missing {cal_t2}C or {cal_t3}C for 2pt calibration")
                else:
                    meas1, meas2 = dict_[cal_t2], dict_[cal_t3]
                    ref1, ref2 = ideal_func(cal_t2), ideal_func(cal_t3)
                    m = (ref2 - ref1) / (meas2 - meas1)
                    b = ref1 - m * meas1
                    dict_ = {k: m*v + b for k,v in dict_.items()}
            return dict_

        if mode == "counter":
            temps = calibrate(temps, calcCount)
        elif mode == "current":
            temps = calibrate(temps, calcIptat)

        return temps

    def prepare_plot_data(mode):
        # Collect all files/data
        all_xvals = []
        all_yvals = []
        all_errors = []
        labels = []
        if os.path.isdir(path):
            files = [os.path.join(path, f) for f in sorted(os.listdir(path)) if f.endswith(".yaml")]
            for file in files:
                temps = parse_and_calibrate(file, mode)
                xvals = list(temps.keys())
                if mode == "counter":
                    if y_estimate_temp:
                        yvals = [countToTemp(v) for v in temps.values()]
                        ideal_y = xvals
                    else:
                        yvals = list(temps.values())
                        ideal_y = [calcCount(x) for x in xvals]
                elif mode == "current":
                    if y_estimate_temp:
                        yvals = [iptatToTemp(v) for v in temps.values()]
                        ideal_y = xvals
                    else:
                        yvals = list(temps.values())
                        ideal_y = [calcIptat(x) for x in xvals]
                errors = [abs(y-y_ideal) for y,y_ideal in zip(yvals, ideal_y)]
                all_xvals.append(xvals)
                all_yvals.append(yvals)
                all_errors.extend(errors)
                labels.append(os.path.basename(file)[10:-5])
        else:
            temps = parse_and_calibrate(path, mode)
            xvals = list(temps.keys())
            if mode == "counter":
                if y_estimate_temp:
                    yvals = [countToTemp(v) for v in temps.values()]
                    ideal_y = xvals
                else:
                    yvals = list(temps.values())
                    ideal_y = [calcCount(x) for x in xvals]
            elif mode == "current":
                if y_estimate_temp:
                    yvals = [iptatToTemp(v) for v in temps.values()]
                    ideal_y = xvals
                else:
                    yvals = list(temps.values())
                    ideal_y = [calcIptat(x) for x in xvals]
            errors = [abs(y-y_ideal) for y,y_ideal in zip(yvals, ideal_y)]
            all_xvals.append(xvals)
            all_yvals.append(yvals)
            all_errors.extend(errors)
            labels = [None]
        return all_xvals, all_yvals, all_errors, labels

    if curent_or_counter == "both":
        # Prepare both datasets
        cnt_x, cnt_y, cnt_err, cnt_labels = prepare_plot_data("counter")
        cur_x, cur_y, cur_err, cur_labels = prepare_plot_data("current")
        fig, (ax1, ax2) = plt.subplots(nrows=2, sharex=True, figsize=(10,9), gridspec_kw={"height_ratios":[1,1]})

        # --- Counter plot
        for xvals, yvals, label in zip(cnt_x, cnt_y, cnt_labels):
            ax1.plot(xvals, yvals, marker='o', label=label)
        temp_range = sorted({x for xl in cnt_x for x in xl})
        if show_ideal and temp_range:
            temp_range = np.array(temp_range)
            if y_estimate_temp:
                ax1.plot(temp_range, temp_range, 'k--', linewidth=2, label="Ideal")
            else:
                ax1.plot(temp_range, [calcCount(t) for t in temp_range], 'k--', linewidth=2, label="Ideal")
        if show_inaccuracy:
            inaccuracy = max(cnt_err) if cnt_err else 0.0
            unit = "°C" if y_estimate_temp else "counts"
            ax1.annotate(f"Inaccuracy = ±{inaccuracy:.2f} {unit}",
                        xy=(0.99, 0.02), xycoords='axes fraction', ha='right', va='bottom',
                        fontsize=11,
                        bbox=dict(boxstyle="round,pad=0.4", fc="white", ec="black", lw=1.2))
        if y_estimate_temp:
            ax1.set_ylabel("Estimated temperature [°C]")
        else:
            ax1.set_ylabel("Average counter value")
        ax1.set_title("Temperature dependence of tempertaure sensor")
        ax1.legend()
        ax1.grid()

        # --- Current plot
        for xvals, yvals, label in zip(cur_x, cur_y, cur_labels):
            ax2.plot(xvals, yvals, marker='o', label=label)
        temp_range = sorted({x for xl in cur_x for x in xl})
        if show_ideal and temp_range:
            temp_range = np.array(temp_range)
            if y_estimate_temp:
                ax2.plot(temp_range, temp_range, 'k--', linewidth=2, label="Ideal")
            else:
                ax2.plot(temp_range, [calcIptat(t) for t in temp_range], 'k--', linewidth=2, label="Ideal")
        if show_inaccuracy:
            inaccuracy = max(cur_err) if cur_err else 0.0
            unit = "°C" if y_estimate_temp else "A"
            ax2.annotate(f"Inaccuracy = ±{inaccuracy:.2e} {unit}",
                        xy=(0.99, 0.02), xycoords='axes fraction', ha='right', va='bottom',
                        fontsize=11,
                        bbox=dict(boxstyle="round,pad=0.4", fc="white", ec="black", lw=1.2))
        if y_estimate_temp:
            ax2.set_ylabel("Estimated temperature [°C]")
        else:
            ax2.set_ylabel("PTAT current [A]")
        ax2.set_title("Temperature dependence of PTAT current")
        ax2.legend()
        ax2.grid()

        desired_ticks = [-40, -20, 0, 20, 40, 60, 80, 100, 125]
        lower_lim = desired_ticks[0] - 10
        upper_lim = desired_ticks[-1] + 10
        ax2.set_xlabel("Temperature [C]")
        ax2.set_xticks(desired_ticks)
        ax2.set_xlim(lower_lim, upper_lim)
        for ax in (ax1, ax2):
            ax.set_xticks(desired_ticks)
            ax.set_xlim(lower_lim, upper_lim)
            if y_estimate_temp:
                ax.set_yticks(desired_ticks)
                ax.set_ylim(lower_lim, upper_lim)
        plt.tight_layout()
        plt.show()
    elif curent_or_counter in (True, "current"):
        # Just PTAT current
        cur_x, cur_y, cur_err, cur_labels = prepare_plot_data("current")
        fig, ax = plt.subplots(figsize=(10,5))
        for xvals, yvals, label in zip(cur_x, cur_y, cur_labels):
            ax.plot(xvals, yvals, marker='o', label=label)
        temp_range = sorted({x for xl in cur_x for x in xl})
        if show_ideal and temp_range:
            temp_range = np.array(temp_range)
            if y_estimate_temp:
                ax.plot(temp_range, temp_range, 'k--', linewidth=2, label="Ideal")
            else:
                ax.plot(temp_range, [calcIptat(t) for t in temp_range], 'k--', linewidth=2, label="Ideal")
        if show_inaccuracy:
            inaccuracy = max(cur_err) if cur_err else 0.0
            unit = "°C" if y_estimate_temp else "A"
            ax.annotate(f"Inaccuracy = ±{inaccuracy:.2e} {unit}",
                    xy=(0.99, 0.02), xycoords='axes fraction', ha='right', va='bottom',
                    fontsize=11,
                    bbox=dict(boxstyle="round,pad=0.4", fc="white", ec="black", lw=1.2))
        if y_estimate_temp:
            ax.set_ylabel("Estimated temperature [°C]")
        else:
            ax.set_ylabel("PTAT current [A]")
        ax.set_title("Temperature dependence of PTAT current")
        ax.legend()
        ax.grid()
        desired_ticks = [-40, -20, 0, 20, 40, 60, 80, 100, 125]
        lower_lim = desired_ticks[0] - 10
        upper_lim = desired_ticks[-1] + 10
        ax.set_xticks(desired_ticks)
        ax.set_xlim(lower_lim, upper_lim)
        if y_estimate_temp:
            ax.set_yticks(desired_ticks)
            ax.set_ylim(lower_lim, upper_lim)
        plt.tight_layout()
        plt.show()
    elif curent_or_counter in (False, "counter"):
        cnt_x, cnt_y, cnt_err, cnt_labels = prepare_plot_data("counter")
        fig, ax = plt.subplots(figsize=(10,5))
        for xvals, yvals, label in zip(cnt_x, cnt_y, cnt_labels):
            ax.plot(xvals, yvals, marker='o', label=label)
        temp_range = sorted({x for xl in cnt_x for x in xl})
        if show_ideal and temp_range:
            temp_range = np.array(temp_range)
            if y_estimate_temp:
                ax.plot(temp_range, temp_range, 'k--', linewidth=2, label="Ideal")
            else:
                ax.plot(temp_range, [calcCount(t) for t in temp_range], 'k--', linewidth=2, label="Ideal")
        if show_inaccuracy:
            inaccuracy = max(cnt_err) if cnt_err else 0.0
            unit = "°C" if y_estimate_temp else "counts"
            ax.annotate(f"Inaccuracy = ±{inaccuracy:.2f} {unit}",
                    xy=(0.99, 0.02), xycoords='axes fraction', ha='right', va='bottom',
                    fontsize=11,
                    bbox=dict(boxstyle="round,pad=0.4", fc="white", ec="black", lw=1.2))
        if y_estimate_temp:
            ax.set_ylabel("Estimated temperature [°C]")
        else:
            ax.set_ylabel("Average counter value")
        ax.set_title("Temperature dependence of Temperature sensor (Counter)")
        ax.legend()
        ax.grid()
        desired_ticks = [-40, -20, 0, 20, 40, 60, 80, 100, 125]
        lower_lim = desired_ticks[0] - 10
        upper_lim = desired_ticks[-1] + 10
        ax.set_xticks(desired_ticks)
        ax.set_xlim(lower_lim, upper_lim)
        if y_estimate_temp:
            ax.set_yticks(desired_ticks)
            ax.set_ylim(lower_lim, upper_lim)
        plt.tight_layout()
        plt.show()
    else:
        raise ValueError("curent_or_counter should be 'counter', 'current', or 'both'.")


def plotSensTempViolin(path, POC=None, y_estimate_temp=False):
    cal_t1 = 40
    cal_t2 = 0
    cal_t3 = 80

    def parse_and_calibrate(filepath):
        with open(filepath) as fi:
            obj = yaml.safe_load(fi)

        tmp1 = {}
        tmp2 = {}
        temps = {}
        for o in obj:
            m1 = re.match(r"tmpcount1_(\-?\d+)", o)
            m2 = re.match(r"tmpcount2_(\-?\d+)", o)
            if m1:
                temp = int(m1.group(1))
                tmp1[temp] = float(obj[o])*1000
            elif m2:
                temp = int(m2.group(1))
                tmp2[temp] = float(obj[o])*1000
        all_temps = sorted(set(tmp1.keys()).union(tmp2.keys()))
        for t in all_temps:
            vals = []
            if t in tmp1:
                vals.append(tmp1[t])
            if t in tmp2:
                vals.append(tmp2[t])
            if vals:
                avg = sum(vals) / len(vals)
                temps[t] = avg
        # Calibration
        if POC == 1:
            if cal_t1 not in temps:
                print(f"{os.path.basename(filepath)}: missing {cal_t1}C for 1pt calibration")
            else:
                c_error = calcCount(cal_t1) - temps[cal_t1]
                temps = {k: v + c_error for k, v in temps.items()}
        elif POC == 2:
            if cal_t1 not in temps or cal_t3 not in temps:
                print(f"{os.path.basename(filepath)}: missing {cal_t2}C or {cal_t3}C for 2pt calibration")
            else:
                meas_1 = temps[cal_t2]
                meas_2 = temps[cal_t3]
                ref_1 = calcCount(cal_t2)
                ref_2 = calcCount(cal_t3)
                m = (ref_2 - ref_1)/(meas_2 - meas_1)
                b = ref_1 - m*meas_1
                temps = {k: m*v + b for k, v in temps.items()}
        return temps

    # --- Gather all readings at each temperature ---
    temp_to_vals = {}
    if os.path.isdir(path):
        files = [os.path.join(path, file) for file in sorted(os.listdir(path)) if file.endswith(".yaml")]
    else:
        files = [path]
    
    n_sweeps = len(files)
    for file in files:
        temps = parse_and_calibrate(file)
        for temp, counter in temps.items():
            yvalue = countToTemp(counter) if y_estimate_temp else counter
            temp_to_vals.setdefault(temp, []).append(yvalue)
    
    temp_x = sorted(temp_to_vals.keys())
    data_for_violin = [temp_to_vals[t] for t in temp_x]

    # Std dev per temp (show 0 if only one sample)
    std_devs = [np.std(arr, ddof=0) if len(arr) > 1 else 0 for arr in data_for_violin]
    
    if y_estimate_temp:
        y_label = "Estimated temperature [°C]"
        desired_ticks = [-40, -20, 0, 20, 40, 60, 80, 100, 125]
        lower_lim = desired_ticks[0] - 10
        upper_lim = desired_ticks[-1] + 10
    else:
        y_label = "Average counter value"
        flat = [y for arr in data_for_violin for y in arr]
        if flat:
            mean = np.mean(flat)
            spread = np.ptp(flat)
            lower_lim = min(flat) - 0.1*spread
            upper_lim = max(flat) + 0.1*spread
        else:
            lower_lim, upper_lim = 0, 1

    fig, ax = plt.subplots(figsize=(10,5))
    parts = ax.violinplot(data_for_violin, positions=temp_x, showmedians=True, widths=4)
    
    # Style violins
    for pc in parts['bodies']:
        pc.set_facecolor('C0')
        pc.set_alpha(0.5)
        pc.set_edgecolor("black")
        pc.set_linewidth(1.5)
    if 'cmedians' in parts:
        parts['cmedians'].set_color("black")

    # Annotate the standard deviation at the top of each violin
    text_color = "black"
    for xi, std, arr in zip(temp_x, std_devs, data_for_violin):
        # 3% down from upper edge for visibility
        top_y = (upper_lim - (upper_lim - lower_lim)*0.03)*0.99
        ax.annotate(f'$\sigma$={std:.2f}', xy=(xi, top_y), ha='center', va='bottom',
                    bbox=dict(boxstyle="round,pad=0.3", fc="white", ec=text_color, lw=1))

    ax.set_title("Temperature dependence of Temperature sensor", color=text_color)
    ax.set_xlabel("Temperature [C]", color=text_color)
    ax.set_ylabel(y_label, color=text_color)
    ax.set_xticks(temp_x)
    ax.set_xlim(temp_x[0]-10, temp_x[-1]+10)
    ax.grid(True)

    if y_estimate_temp:
        ax.set_yticks(desired_ticks)
        ax.set_ylim(lower_lim, upper_lim)
    else:
        ax.set_ylim(lower_lim, upper_lim)

    # Annotate sample count (number of sweeps/files) in black box above the title
    ax.annotate("Number of simulations: " + str(n_sweeps), xy=(0.75, 0.2), xycoords='axes fraction',
            bbox=dict(facecolor='white', edgecolor='black', boxstyle='round,pad=0.5'))

    plt.tight_layout(rect=[0, 0, 1, 0.95])
    plt.show()


def plotVrefDistribution(folders, Temp=None):
    # If no temperature is given, the func will plot the mean of Vref across all temperatures
    vrefMean = np.array([])
    total_points = 0

    for folder in folders:
        for file in os.scandir(folder):
            if file.name.endswith(".yaml"):
                mean = getVref(folder + "/" + file.name[:-5], temp=Temp)
                # print(file.name, mean)
                vrefMean = np.append(vrefMean, mean)
                total_points += 1

    std = round(np.std(vrefMean), 2)

    fig,ax = plt.subplots(sharey=True,tight_layout=True,figsize=(7,5))
    ax.hist(vrefMean, bins=10, edgecolor='black')
    ax.set_xlabel("Voltage [mV]")
    ax.set_ylabel("Frequency")
    ax.annotate(r'$\sigma$ = ' + str(std) + "mV", xy=(0.8, 0.9), xycoords='axes fraction',
                bbox=dict(facecolor='white', edgecolor='black', boxstyle='round,pad=0.5'))
    ax.annotate("Points: " + str(total_points), xy=(0.8, 0.8), xycoords='axes fraction',
                bbox=dict(facecolor='white', edgecolor='black', boxstyle='round,pad=0.5'))
    if Temp is None:
        ax.set_title("Distrobutin of Vref mean")
    else:
        ax.set_title("Distribution of Vref at " + Temp + "C")
    # ax.yaxis.grid(True)  
    # ax.xaxis.grid(False) 
    ax.yaxis.set_major_locator(MaxNLocator(integer=True))
    plt.show()


def plotPpmDistribution(folders):
    # Read result yaml file
    ppmValues = np.array([])

    for folder in folders:
        for file in os.scandir(folder):
            if file.name.endswith(".yaml"):
                ppm = calcPpm(folder + "/" + file.name[:-5])
                # print(file.name, ppm)
                if ppm < 70:
                    ppmValues = np.append(ppmValues, ppm)
                else:
                    print("PPM value for file", file.name, "is over 70 and is discarded: ", ppm)

    std = round(np.std(ppmValues), 2)
    print("Standard deviation: ", std)

    fig, ax = plt.subplots(sharey=True, tight_layout=True, figsize=(7, 5))
    ax.hist(ppmValues, bins=10, edgecolor='black')
    ax.set_title("PPM distribution")
    ax.set_xlabel("PPM")
    ax.set_ylabel("Frequency")
    ax.annotate(r'$\sigma$ = ' + str(std) + " PPM", xy=(0.8, 0.9), xycoords='axes fraction',
                bbox=dict(facecolor='white', edgecolor='black', boxstyle='round,pad=0.5'))
    plt.show()


label_dict = {
    "v(xdut.vn)": r'$V_{n}$',
    "v(xdut.vp)": r'$V_{p}$',
    "v(xdut.vctrl)": r'$V_{ctrl}$',
    "v(vref)": r'$V_{ref}$',
    "v(xdut.vout)": r'$V_{out}$',
    "v(xdut.x3.vbgctrl)": r'$V_{ctrlRef}$',
    "v(xdut.x4.vbgctrl)": r'$V_{ctrlRef}$',
    "v(xdut.x3.vptatctrl)": r'$V_{ctrlPTAT}$',
    "v(dec_tmpcount_out1)": r'$Count1$',
    "v(dec_tmpcount_out2)": r'$Count2$',
    "v(pa)": r'$sOut$',
    "v(pb)": r'$sAvgCapL$',
    "v(pc)": r'$sAvgCapH$',
    "v(pd)": r'$sRefCap$',
    "v(pi1)": r'$sBD$',
    "v(pi2)": r'$sBDC$',
    "v(pii1)": r'$sSD$',
    "v(pii2)": r'$sSDC$',
    "v(snk)": r'$sSnk$',
    "v(src_n)": r'$sSrc$',
    "v(cmp)": r'$V_{cmp}$',
    "v(clk)": r'$clk$',
    "v(xdut.x2.lcharge)": r'$V_{high}$',
    "v(xdut.x2.hcharge)": r'$V_{low}$',
    "v(xdut.vcap)": r'$V_{cap}$',
    "v(s_cmpoutdisable)": r'$sCmpOutDisable$',
    }




################### Finished plots ###################

name = "output_tran/TYP_TmpSns_20deg_PLOTTING"
digHeight = 1.3

def plotBGSETUPsequence():
    signal_groups = [
        ["v(pii1)", "v(pi1)", "v(src_n)", "v(snk)"],
        ["v(xdut.vn)", "v(xdut.vp)", "v(xdut.x3.vptatctrl)", "v(xdut.x3.vbgctrl)"],
    ]
    y_lims = [
    (-0.1, 2),  # y-limits for the second group
    (-0.1, 1),  # y-limits for the first group
    ]
    rawplot(
        name + ".raw",
        'time',
        signal_groups=signal_groups,
        ptype="same",
        fname="startupSequence.pgf",
        xlim=(0, 8),      
        ylims=y_lims,     
        plot_height=2.1,
        legend_loc=["right", "right"],

    )

def plotOperationCLoseup():
    signal_groups = [
        ["v(xdut.vn)", "v(xdut.vp)"],
        ["v(xdut.x3.vbgctrl)"],
        ["v(cmp)"],
        ["v(snk)", "v(src_n)"],
        # ["v(vref)", "v(xdut.x2.hcharge)", "v(xdut.x2.lcharge)"],
        ["v(pii1)", "v(pi1)","v(pb)","v(pc)","v(pd)"],
        ]

    y_lims = [
        (0.739, 0.745),
        (0.426, 0.433),
        (-0.1, 2),
        (-0.1, 2),
        # (1.05, 1.1),
        (-0.1, 2),
    ]

    colors = [
        ["C0", "C1"],
        ["C2"],
        ["C3"],
        ["C4", "C5"],
        # [],
    ]

    rawplot(
        name + ".raw",
        'time',
        signal_groups=signal_groups,
        ptype="same",
        fname="operationCloseup.pgf",
        xlim=(27.6, 31.6),      
        ylims=y_lims,     
        plot_height=digHeight,
        legend_loc=["right", "right", "right", "right", "right"],
        colors=colors
    )

def plotNonOverlap():
    signal_groups = [
        ["v(pii1)", "v(pii2)", "v(pi1)", "v(pi2)"],
        ["v(clk)"],
    ]

    y_lims = [
        (-0.2, 2),
        (-0.2, 2),
    ]

    colors = [
        ["C0", "C1", "C2", "C3"],
        ["C4"],
    ]

    rawplot(
        name + ".raw",
        'time',
        signal_groups=signal_groups,
        ptype="same",
        fname= "nonOverlap.pgf",
        xlim=(6.61, 7.55),      
        ylims=y_lims,     
        plot_height=digHeight,
        legend_loc=["right", "right"],
        colors=colors
    )

def plotTmpSns():
    signal_groups = [
        ["v(vref)","v(xdut.vcap)"],
        ["v(cmp)"],
        ["v(s_cmpoutdisable)"],
        ["v(dec_tmpcount_out1)"],
    ]

    y_lims = [
        (-0.1, 1.2),
        (-0.2, 2),
        (-0.2, 2),
        (49,58),
    ]

    colors = [
        ["C0", "C1"],
        ["C2"],
        ["C3"],
        ["C4"],
    ]

    rawplot(
        name + ".raw",
        'time',
        signal_groups=signal_groups,
        ptype="same",
        fname=name + ".pgf",
        xlim=(66.6, 68.6),      
        ylims=y_lims,     
        plot_height=1.4,
        legend_loc=["right", "right", "right", 'right'],
        colors=colors
    )
######################################################

# plotBGSETUPsequence()
# plotVrefTempDependence("sim_results/MC_18_feb_tempSweep/tran_SchGtKttmmTtVt_6")

plotSensTempDependence("sim_results/MC_tmpSnsSweep_0526", POC=2, curent_or_counter="both", y_estimate_temp=False, show_ideal=True, show_inaccuracy=True)
# plotSensTempDependence("sim_results/MC_tmpSnsSweep_0526", POC=None, y_estimate_temp=True)
# plotSensTempDependence("sim_results/MC_tmpSnsSweep_0526", POC=2)

plotSensTempViolin("sim_results/MC_tmpSnsSweep_0526", POC=2, y_estimate_temp=False)
# plotSensTempViolin("sim_results/MC_tmpSnsSweep_0526", POC=1, y_estimate_temp=True)
# plotSensTempViolin("sim_results/MC_tmpSnsSweep_0526", POC=2, y_estimate_temp=True)

