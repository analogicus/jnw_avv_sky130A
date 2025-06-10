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
vref = 1.045        
Cosc = 5.38e-14*4*2
Nclk = 227



def calcIptat(temp):
    return (k * (temp + 273.15) * np.log(8)) / (R1 * q) 

# print("Iptat at 125C:", calcIptat(125))

# print((15e-6 * 100e-9 / (1.1))/53.8e-15)

def calcCount(temp):
    return (Tclk * Nclk)/((Cosc * vref)/calcIptat(temp)) 

def calcResolution():
    return (calcCount(125) - calcCount(-40))/(125 - (-40))

# print("Resolution:", calcResolution())

# for temp in [-40, -20, 0, 20, 40, 60, 80, 100, 125]:
#     # print("Iptat at", temp, "C:", calcIptat(temp))
#     print("Count at", temp, "C:", calcCount(temp))

# def countToTemp(count):
#     A = (k * np.log(8)) / (R1 * q)
#     temp = (count * (Cosc * vref) / (Tclk * Nclk * A)) - 273.15
#     return temp


def countToTemp(count):
    return (Cosc * vref * R1 * q * count)/(Tclk * k * Nclk * np.log(8)) - 273.15

# print("Count to Temp at 180:", countToTemp(180))


legend_lut = {
    "tran_SchGtKttTtVt": r"$\mathrm{ttVt}$",
    "tran_SchGtKssTtVh": r"$\mathrm{ssVh}$",
    "tran_SchGtKssTtVl": r"$\mathrm{ssVl}$",
    "tran_SchGtKffTtVh": r"$\mathrm{ffVh}$",
    "tran_SchGtKffTtVl": r"$\mathrm{ffVl}$",
    "tran_SchGtKsfTtVh": r"$\mathrm{sfVh}$",
    "tran_SchGtKsfTtVl": r"$\mathrm{sfVl}$",
    "tran_SchGtKfsTtVh": r"$\mathrm{fsVh}$",
    "tran_SchGtKfsTtVl": r"$\mathrm{fsVl}$",
}


def getSamplingPeriod(yamlfile, temp):
    CLK_FREQ = 20e6  # 20 MHz

    # Load yaml
    with open(yamlfile + ".yaml") as fi:
        obj = yaml.safe_load(fi)

    # Helper function to get time value from yaml
    def get_val(edge, order, temp):
        key = f"caprst_{edge}_{order}_{temp}"
        if key not in obj and isinstance(temp, int):
            key = f"caprst_{edge}_{order}_{str(temp)}"
        if key not in obj:
            raise ValueError(f"{key} not in YAML!")
        return obj[key]

    # Get values (in seconds)
    fall_first  = get_val("fall",  "first",  temp)
    rise_first  = get_val("rise",  "first",  temp)
    fall_second = get_val("fall",  "second", temp)
    rise_second = get_val("rise",  "second", temp)

    # Calculate differences (in seconds)
    diff_first  = abs(rise_first  - fall_first)
    diff_second = abs(rise_second - fall_second)

    # Convert to integer clock cycles (rounded)
    cycles_first  = round(diff_first  * CLK_FREQ)
    cycles_second = round(diff_second * CLK_FREQ)
    
    print(f"Sampling period for {temp}C: {cycles_first} cycles (first), {cycles_second} cycles (second)")

    return cycles_first, cycles_second
    

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
    plot_height=2,  # now can be list or float
    colors=None,
    backend=None,  # "default" or "pgf"
):
    import matplotlib
    import matplotlib.pyplot as plt

    if backend == "pgf":
        matplotlib.use("pgf")
        matplotlib.rcParams.update({
            "pgf.texsystem": "pdflatex",
            "font.family": "serif",
            "text.usetex": True,
            "pgf.rcfonts": False,
        })

    dfs = ngraw.toDataFrames(ngraw.ngRawRead(fraw))
    if len(dfs) > 0:
        df = dfs[0]
    else:
        raise Exception("You have multiple plots in .raw file, that's not supported")

    plot_xname = xname
    if xname == "time":
        df = df.copy()
        df["time"] = df["time"] * 1e6

    if signal_groups is None:
        raise Exception("signal_groups must be specified!")

    n_subplots = len(signal_groups)

    # ----- Main change: plot_height as list or float -----
    if isinstance(plot_height, (list, tuple, np.ndarray)):
        if len(plot_height) != n_subplots:
            raise ValueError("If plot_height is a list or tuple, its length must match the number of subplots")
        total_height = sum(plot_height)
        height_ratios = plot_height
    else:
        # old behavior: each subplot gets plot_height units high
        total_height = plot_height * n_subplots
        height_ratios = None

    fig, axes = plt.subplots(
        n_subplots, 1, sharex=True,
        figsize=(6.1, total_height),
        gridspec_kw={'height_ratios': height_ratios} if height_ratios is not None else None
    )
    fig.subplots_adjust(hspace=0.1)
    if n_subplots == 1:
        axes = [axes]

    # Robust legend location handling
    def _validate_legloc(legend_loc, n):
        if legend_loc is None:
            return ["best"] * n
        if isinstance(legend_loc, str):
            return [("right" if n > 1 else "best")] * n
        if isinstance(legend_loc, (list, tuple)):
            out = []
            for idx in range(n):
                try:
                    loc = legend_loc[idx]
                    out.append("right" if str(loc).lower() == "right" else loc)
                except IndexError:
                    out.append("best")
            return out
        return ["best"] * n

    legend_loc = _validate_legloc(legend_loc, n_subplots)

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
        if ylims is not None and len(ylims) > i and ylims[i] is not None:
            ax.set_ylim(*ylims[i])
        if xlim is not None:
            ax.set_xlim(*xlim)
        first_signal = signals[0]
        if first_signal in ["v(dec_tmpcount_out1)", "v(dec_tmpcount_out2)"]:
            ax.set_ylabel("Counter")
        else:
            ax.set_ylabel("Voltage [V]")
        try:
            ax.legend(loc=legend_loc[i])
        except Exception:
            ax.legend(loc="best")
        ax.grid()

    if xname == "time":
        axes[-1].set_xlabel(r'Time [$\mu$s]')
    elif xname == "frequency":
        axes[-1].set_xlabel("Frequency [Hz]")
    elif xname == "temperature":
        axes[-1].set_xlabel("Temperature [K]")
    plt.tight_layout()

    if backend is not None:
        plt.savefig("plots/" + fname)
    else:
        plt.show()  

  
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

  fig,ax = plt.subplots(figsize=(6,3.5))
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
    iptat = np.asarray(iptat)
    return (iptat * R1 * q) / (k * np.log(8)) - 273.15


def plotSensTempDependenceMC(
    path,
    POC=None,
    y_estimate_temp=False,
    curent_or_counter="counter",
    show_ideal=False,
    show_inaccuracy=False,
    violin=False,
    fname=None,
    figsize=(6, 3.3),              # NEW
    height_ratio=None              # NEW
):
    cal_t1 = 40
    cal_t2 = 0
    cal_t3 = 80

    if fname is not None:
        matplotlib.use("pgf")
        matplotlib.rcParams.update({
            "pgf.texsystem": "pdflatex",
            "font.family": "serif",
            "text.usetex": True,
            "pgf.rcfonts": False,
        })

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
            ideal_func = calcCount
        elif mode == "current":
            pat1 = r"iptat_first_(\-?\d+)"
            pat2 = r"iptat_second_(\-?\d+)"
            scale = 1.0
            ideal_func = calcIptat
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
                temps[t] = avg

        # Calibration
        def calibrate(dict_, ideal_func):
            if POC is None:
                return dict_
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

        temps = calibrate(temps, ideal_func)
        return temps

    def prepare_plot_data(mode):
        all_xvals = []
        all_yvals = []
        all_errors = []
        labels = []

        files = []
        if os.path.isdir(path):
            files = [os.path.join(path, f) for f in sorted(os.listdir(path)) if f.endswith(".yaml")]
        else:
            files = [path]
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
            labels.append(os.path.basename(file))
        return all_xvals, all_yvals, all_errors, labels, files

    do_both = (curent_or_counter == "both")
    plot_modes = []
    if do_both:
        plot_modes = ["counter", "current"]
    elif curent_or_counter in ("current", True):
        plot_modes = ["current"]
    else:
        plot_modes = ["counter"]

    for mode in plot_modes:
        counter = (mode == "counter")
        xvals, yvals, errors, labels, files = prepare_plot_data(mode)
        n_mcsim = len(files)

        # ========== Prepare violin data if needed ==========
        if violin:
            temp_to_violin = {t: [] for t in sorted({t for xv in xvals for t in xv})}
            all_temps = sorted(temp_to_violin.keys())
            for file in files:
                temps_dict = parse_and_calibrate(file, mode)
                for t in all_temps:
                    v_meas = temps_dict.get(t, None)
                    if v_meas is not None:
                        # Estimated temp on y axis
                        if y_estimate_temp:
                            if mode == "current":
                                temp_est = iptatToTemp(v_meas)
                            elif mode == "counter":
                                temp_est = countToTemp(v_meas)
                            else:
                                temp_est = v_meas
                            if POC is not None:
                                y_value = temp_est - t
                            else:
                                y_value = temp_est
                        else:
                            if POC is not None:
                                ideal = calcCount(t) if mode == "counter" else calcIptat(t)
                                y_value = v_meas - ideal
                            else:
                                y_value = v_meas
                        temp_to_violin[t].append(y_value)
            data_for_violin = [temp_to_violin[t] for t in all_temps]
            std_devs = [np.std(arr) if len(arr) > 1 else 0 for arr in data_for_violin]

            if height_ratio is None:
                height_ratio = [1.4, 1]
            figwidth = figsize[0]
            total_height = figsize[1]
            fig, (ax1, ax2) = plt.subplots(
                2, 1, sharex=True, figsize=(figwidth, total_height),
                gridspec_kw={'height_ratios': height_ratio}
            )
        else:
            fig, ax1 = plt.subplots(figsize=figsize)
            ax2 = None

        # === Main curve plot ===
        for xv, yv in zip(xvals, yvals):
            ax1.plot(xv, yv, marker='o', color="C0", alpha=0.65, lw=1)

        # Ideal (reference) line
        temp_range = sorted({x for xv in xvals for x in xv})
        if show_ideal and temp_range:
            temp_range = np.array(temp_range)
            if y_estimate_temp:
                ax1.plot(temp_range, temp_range, 'k--', linewidth=2, label="Ideal")
            else:
                if counter:
                    ax1.plot(temp_range, [calcCount(t) for t in temp_range], 'k--', linewidth=2, label="Ideal")
                else:
                    ax1.plot(temp_range, [calcIptat(t) for t in temp_range], 'k--', linewidth=2, label="Ideal")
        if show_inaccuracy and errors:
            inaccuracy = max(errors)
            unit = "°C" if y_estimate_temp else ("counts" if counter else "A")
            ax1.annotate(
                f"Inaccuracy = ±{inaccuracy:.2g} {unit}",
                xy=(0.8, 0.1), xycoords='axes fraction', ha='center', va='center',
                bbox=dict(boxstyle="round,pad=0.7", fc="white", ec="black", lw=1.2))

        # MC simulation count
        ax1.annotate(
            f"N = {n_mcsim}",
            xy=(0.12, 0.8), xycoords='axes fraction', ha='center', va='center',
            bbox=dict(boxstyle="round,pad=0.7", fc="white", ec="black", lw=1.2))

        # Ylabel etc
        ylabel = ("Estimated temperature [°C]" if y_estimate_temp
                  else "Average counter value" if counter
                  else "PTAT current [A]")
        ax1.set_ylabel(ylabel)
        desired_ticks = [-40, -20, 0, 20, 40, 60, 80, 100, 125]
        lower_lim = desired_ticks[0] - 10
        upper_lim = desired_ticks[-1] + 10
        ax1.set_xticks(desired_ticks)

        if curent_or_counter == "current":
            if (POC == 0 or POC is None):
                ax1.set_title("Temperature dependence of PTAT current with no calibration")
            elif POC == 1:
                ax1.set_title("Temperature dependence of PTAT current with 1-point calibration")
                ax1.set_yticks(desired_ticks)
                ax1.set_ylim(lower_lim, upper_lim)
                ax1.set_xlim(lower_lim, upper_lim)
            elif POC == 2:
                ax1.set_title("Temperature dependence of PTAT current with 2-point calibration")
                ax1.set_yticks(desired_ticks)
                ax1.set_ylim(lower_lim, upper_lim)
                ax1.set_xlim(lower_lim, upper_lim)
        if curent_or_counter == "counter":
            if (POC == 0 or POC is None):
                ax1.set_title("Temperature dependence of temperature sensor with no calibration")
            elif POC == 1:
                ax1.set_title("Temperature dependence of temperature sensor with 1-point calibration")
                ax1.set_yticks(desired_ticks)
                ax1.set_ylim(lower_lim, upper_lim)
                ax1.set_xlim(lower_lim, upper_lim)
            elif POC == 2:
                ax1.set_title("Temperature dependence of temperature sensor with 2-point calibration")
                ax1.set_yticks(desired_ticks)
                ax1.set_ylim(lower_lim, upper_lim)
                ax1.set_xlim(lower_lim, upper_lim)
        ax1.grid()

        # Violin plot
        if violin:
            parts = ax2.violinplot(data_for_violin, positions=all_temps, showmedians=True, widths=4)
            for pc in parts['bodies']:
                pc.set_facecolor('C0')
                pc.set_alpha(0.4)
                pc.set_edgecolor("black")
                pc.set_linewidth(1)
            if 'cmedians' in parts:
                parts['cmedians'].set_color("black")
            flat = [y for arr in data_for_violin for y in arr]
            ymin = min(flat) if flat else 0
            ymax = max(flat) if flat else 1
            spread = ymax - ymin
            violin_lower_lim = ymin - 0.1*spread if spread else ymin - 1
            violin_upper_lim = ymax + 0.1*spread if spread else ymax + 1

            for xi, std in zip(all_temps, std_devs):
                topy = violin_upper_lim - 0.05*spread
                ax2.annotate(f'$\sigma$={std:.2f}', xy=(xi, topy), ha='center', va='bottom',
                             fontsize=9,
                             bbox=dict(boxstyle="round,pad=0.22", fc="white", ec="black", lw=0.7, alpha=1))
            ax2.set_xlabel("Temperature [C]")
            vlabel = ("Error [°C]" if y_estimate_temp
                      else "Error [counts]" if counter
                      else "Error [A]")
            ax2.set_ylabel(vlabel)
            ax2.set_xticks(all_temps)
            ax2.set_xlim(all_temps[0]-10, all_temps[-1]+10)
            ax2.set_ylim(violin_lower_lim, violin_upper_lim)
            ax2.grid(True, alpha=0.6)
        else:
            ax1.set_xlabel("Temperature [C]")

        plt.tight_layout()
        if fname is not None:
            # To avoid overwriting in "both" mode
            if do_both:
                plt.savefig("plots/" + fname.replace(".pgf", f"_{mode}.pgf"))
            else:
                plt.savefig("plots/" + fname)
        else:
            plt.show()


def plotSensTempDependenceETC(
    path,
    POC=None,
    y_estimate_temp=False,
    curent_or_counter="counter",
    show_ideal=False,
    show_inaccuracy=False,
    fname=None,
    plot_error=False,
    figsize=(6, 3.3),           # NEW
    height_ratio=None           # NEW
):
    cal_t1 = 40
    cal_t2 = 0
    cal_t3 = 80

    if fname is not None:
        matplotlib.use("pgf")
        matplotlib.rcParams.update({
            "pgf.texsystem": "pdflatex",
            "font.family": "serif",
            "text.usetex": True,
            "pgf.rcfonts": False,
        })

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
                errors = [y-y_ideal for y,y_ideal in zip(yvals, ideal_y)]
                all_xvals.append(xvals)
                all_yvals.append(yvals)
                all_errors.append(errors)
                base = os.path.splitext(os.path.basename(file))[0]
                label = legend_lut.get(base, base)
                labels.append(label)
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
            errors = [y-y_ideal for y,y_ideal in zip(yvals, ideal_y)]
            all_xvals.append(xvals)
            all_yvals.append(yvals)
            all_errors.append(errors)
            base = os.path.splitext(os.path.basename(path))[0]
            label = legend_lut.get(base, base)
            labels = [label]
        return all_xvals, all_yvals, all_errors, labels

    desired_ticks = [-40, -20, 0, 20, 40, 60, 80, 100, 125]
    lower_lim = desired_ticks[0] - 10
    upper_lim = desired_ticks[-1] + 10

    if curent_or_counter == "both":
        cnt_x, cnt_y, cnt_err, cnt_labels = prepare_plot_data("counter")
        cur_x, cur_y, cur_err, cur_labels = prepare_plot_data("current")

        n_panels = 4 if plot_error else 2
        if height_ratio is None:
            height_ratio = [2,1,2,1] if plot_error else [1,1]
        figwidth = figsize[0]
        total_height = figsize[1]
        fig, axs = plt.subplots(
            nrows=n_panels, sharex=True, figsize=(figwidth, total_height),
            gridspec_kw={"height_ratios":height_ratio}
        )
        if plot_error:
            ax1, ax1_err, ax2, ax2_err = axs
        else:
            ax1, ax2 = axs

        # --- Counter plot ---
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
            all_flat_err = [item for sublist in cnt_err for item in sublist]
            # -- Changed here:
            inaccuracy = 0.5 * (max(all_flat_err) - min(all_flat_err)) if all_flat_err else 0.0
            unit = "°C" if y_estimate_temp else "counts"
            ax1.annotate(f"Inaccuracy = ±{inaccuracy:.2f} {unit}",
                        xy=(0.8, 0.1), xycoords='axes fraction', ha='center', va='center',
                        bbox=dict(boxstyle="round,pad=0.7", fc="white", ec="black", lw=1.2))
        if y_estimate_temp:
            ax1.set_ylabel("Estimated temperature [°C]")
        else:
            ax1.set_ylabel("Average counter value")
        if (POC == 0 or None):
            ax1.set_title("Temperature dependence of temperature sensor with no calibration")
        elif POC == 1:
            ax1.set_title("Temperature dependence of temperature sensor with 1-point calibration")
        elif POC == 2:
            ax1.set_title("Temperature dependence of temperature sensor with 2-point calibration")
        ax1.legend(ncol=2)
        ax1.grid()
        ax1.set_xticks(desired_ticks)
        ax1.set_xlim(lower_lim, upper_lim)

        # --- Counter Error subplot ---
        if plot_error:
            for xvals, errors, label in zip(cnt_x, cnt_err, cnt_labels):
                ax1_err.plot(xvals, errors, marker='o', label=label)
            ax1_err.set_ylabel(r"Error [°C]" if y_estimate_temp else "Error [counts]")
            ax1_err.axhline(0, color='k', linestyle='dashed', linewidth=1)
            ax1_err.grid()
            ax1_err.set_xticks(desired_ticks)
            ax1_err.set_xlim(lower_lim, upper_lim)
        else:
            ax1.set_xlabel("Temperature [C]")

        # --- Current plot ---
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
            all_flat_err = [item for sublist in cur_err for item in sublist]
            # -- Changed here:
            inaccuracy = 0.5 * (max(all_flat_err) - min(all_flat_err)) if all_flat_err else 0.0
            unit = "°C" if y_estimate_temp else "A"
            ax2.annotate(f"Inaccuracy = ±{inaccuracy:.2f} {unit}",
                        xy=(0.8, 0.1), xycoords='axes fraction', ha='center', va='center',
                        bbox=dict(boxstyle="round,pad=0.7", fc="white", ec="black", lw=1.2))
        if y_estimate_temp:
            ax2.set_ylabel("Estimated temperature [°C]")
        else:
            ax2.set_ylabel("PTAT current [A]")
        if (POC == 0 or None):
            ax2.set_title("Temperature dependence of PTAT current with no calibration")
        elif POC == 1:
            ax2.set_yticks(desired_ticks)
            ax2.set_ylim(lower_lim, upper_lim)
            ax2.set_title("Temperature dependence of PTAT current with 1-point calibration")
        elif POC == 2:
            ax2.set_yticks(desired_ticks)
            ax2.set_ylim(lower_lim, upper_lim)
            ax2.set_title("Temperature dependence of PTAT current with 2-point calibration")
        ax2.legend(ncol=2)
        ax2.grid()
        ax2.set_xticks(desired_ticks)
        ax2.set_xlim(lower_lim, upper_lim)

        # --- Current Error subplot ---
        if plot_error:
            for xvals, errors, label in zip(cur_x, cur_err, cur_labels):
                ax2_err.plot(xvals, errors, marker='o', label=label)
            ax2_err.set_ylabel("Error [°C]" if y_estimate_temp else "Error [A]")
            ax2_err.axhline(0, color='k', linestyle='dashed', linewidth=1)
            ax2_err.grid()
            ax2_err.set_xticks(desired_ticks)
            ax2_err.set_xlim(lower_lim, upper_lim)
        else:
            ax2.set_xlabel("Temperature [C]")

        plt.tight_layout()
        plt.show()

    elif curent_or_counter in (True, "current"):
        # Just PTAT current
        cur_x, cur_y, cur_err, cur_labels = prepare_plot_data("current")
        n_panels = 2 if plot_error else 1
        if plot_error:
            if height_ratio is None:
                height_ratio = [2,1.2]
            figwidth = figsize[0]
            total_height = figsize[1]
            fig, (ax, ax_err) = plt.subplots(
                nrows=2, sharex=True, figsize=(figwidth, total_height),
                gridspec_kw={"height_ratios":height_ratio}
            )
        else:
            fig, ax = plt.subplots(figsize=figsize)
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
            all_flat_err = [item for sublist in cur_err for item in sublist]
            inaccuracy = 0.5 * (max(all_flat_err) - min(all_flat_err)) if all_flat_err else 0.0
            unit = "°C" if y_estimate_temp else "A"
            ax.annotate(f"Inaccuracy = ±{inaccuracy:.2f} {unit}",
                        xy=(0.8, 0.1), xycoords='axes fraction', ha='center', va='center',
                        bbox=dict(boxstyle="round,pad=0.7", fc="white", ec="black", lw=1.2))
        if y_estimate_temp:
            ax.set_ylabel("Estimated temperature [°C]")
        else:
            ax.set_ylabel("PTAT current [A]")
        if (POC == 0 or None):
            ax.set_title("Temperature dependence of PTAT current with no calibration")
        elif POC == 1:
            ax.set_yticks(desired_ticks)
            ax.set_ylim(lower_lim, upper_lim)
            ax.set_title("Temperature dependence of PTAT current with 1-point calibration")
        elif POC == 2:
            ax.set_yticks(desired_ticks)
            ax.set_ylim(lower_lim, upper_lim)
            ax.set_title("Temperature dependence of PTAT current with 2-point calibration")
        ax.legend(ncol=2)
        ax.grid()
        ax.set_xticks(desired_ticks)
        ax.set_xlim(lower_lim, upper_lim)

        if plot_error:
            for xvals, errors, label in zip(cur_x, cur_err, cur_labels):
                ax_err.plot(xvals, errors, marker='o', label=label)
            ax_err.set_ylabel("Error [°C]" if y_estimate_temp else "Error [A]")
            ax_err.set_xlabel("Temperature [C]")
            ax_err.axhline(0, color='k', linestyle='dashed', linewidth=1)
            ax_err.grid()
            ax_err.set_xticks(desired_ticks)
            ax_err.set_xlim(lower_lim, upper_lim)
        else:
            ax.set_xlabel("Temperature [C]")

        plt.tight_layout()
        if fname is not None:
            plt.savefig("plots/" + fname)
        else:
            plt.show()
    elif curent_or_counter in (False, "counter"):
        cnt_x, cnt_y, cnt_err, cnt_labels = prepare_plot_data("counter")
        n_panels = 2 if plot_error else 1
        if plot_error:
            if height_ratio is None:
                height_ratio = [2,1.2]
            figwidth = figsize[0]
            total_height = figsize[1]
            fig, (ax, ax_err) = plt.subplots(
                nrows=2, sharex=True, figsize=(figwidth, total_height),
                gridspec_kw={"height_ratios":height_ratio}
            )
        else:
            fig, ax = plt.subplots(figsize=figsize)
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
            all_flat_err = [item for sublist in cnt_err for item in sublist]
            inaccuracy = 0.5 * (max(all_flat_err) - min(all_flat_err)) if all_flat_err else 0.0
            unit = "°C" if y_estimate_temp else "counts"
            ax.annotate(f"Inaccuracy = ±{inaccuracy:.2f} {unit}",
                        xy=(0.8, 0.1), xycoords='axes fraction', ha='center', va='center',
                        bbox=dict(boxstyle="round,pad=0.7", fc="white", ec="black", lw=1.2))
        if y_estimate_temp:
            ax.set_ylabel("Estimated temperature [°C]")
        else:
            ax.set_ylabel("Average counter value")
        if (POC == 0 or None):
            ax.set_title("Temperature dependence of temperature sensor with no calibration")
        elif POC == 1:
            ax.set_yticks(desired_ticks)
            ax.set_ylim(lower_lim, upper_lim)
            ax.set_title("Temperature dependence of temperature sensor with 1-point calibration")
        elif POC == 2:
            ax.set_yticks(desired_ticks)
            ax.set_ylim(lower_lim, upper_lim)
            ax.set_title("Temperature dependence of temperature sensor with 2-point calibration")
        ax.legend(ncol=2)
        ax.grid()
        ax.set_xticks(desired_ticks)
        ax.set_xlim(lower_lim, upper_lim)

        if plot_error:
            for xvals, errors, label in zip(cnt_x, cnt_err, cnt_labels):
                ax_err.plot(xvals, errors, marker='o', label=label)
            ax_err.set_ylabel("Error [°C]" if y_estimate_temp else "Error [counts]")
            ax_err.set_xlabel("Temperature [C]")
            ax_err.axhline(0, color='k', linestyle='dashed', linewidth=1)
            ax_err.grid()
            ax_err.set_xticks(desired_ticks)
            ax_err.set_xlim(lower_lim, upper_lim)
        else:
            ax.set_xlabel("Temperature [C]")

        plt.tight_layout()
        if fname is not None:
            plt.savefig("plots/" + fname)
        else:
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

    fig, ax = plt.subplots(figsize=(6,3.5))
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

    ax.set_title("Temperature dependence of temperature sensor", color=text_color)
    ax.set_xlabel("Temperature [C]", color=text_color)
    ax.set_ylabel(y_label, color=text_color)
    ax.set_xticks(temp_x)
    ax.set_xlim(temp_x[0]-10, temp_x[-1]+10)
    ax.grid(True)

    # if y_estimate_temp:
    #     ax.set_yticks(desired_ticks)
    #     ax.set_ylim(lower_lim, upper_lim)
    # else:
    #     ax.set_ylim(lower_lim, upper_lim)

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

    fig,ax = plt.subplots(sharey=True,tight_layout=True,figsize=(6,3.5))
    ax.hist(vrefMean, bins=10, edgecolor='black')
    ax.set_xlabel("Voltage [mV]")
    ax.set_ylabel("Frequency")
    ax.annotate(r'$\sigma$ = ' + str(std) + "mV", xy=(0.8, 0.9), xycoords='axes fraction',
                bbox=dict(facecolor='white', edgecolor='black', boxstyle='round,pad=0.5'))
    ax.annotate("Points: " + str(total_points), xy=(0.8, 0.8), xycoords='axes fraction',
                bbox=dict(facecolor='white', edgecolor='black', boxstyle='round,pad=0.5'))
    if Temp is None:
        ax.set_title("Distribution of Vref mean")
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

    fig, ax = plt.subplots(sharey=True, tight_layout=True, figsize=(6, 3.5))
    ax.hist(ppmValues, bins=10, edgecolor='black')
    ax.set_title("PPM distribution")
    ax.set_xlabel("PPM")
    ax.set_ylabel("Frequency")
    ax.annotate(r'$\sigma$ = ' + str(std) + " PPM", xy=(0.8, 0.9), xycoords='axes fraction',
                bbox=dict(facecolor='white', edgecolor='black', boxstyle='round,pad=0.5'))
    plt.show()


def sigCorr(folders, x, y):
    # Calculate the correlation coefficient
    x_values = np.array([])
    y_values = np.array([])
    
    max = ""
    min = ""
    
    for folder in folders:
        for file in os.scandir(folder):
            if file.name.endswith(".yaml"):
                with open(folder + "/" + file.name) as fi:
                    obj = yaml.safe_load(fi)
                for key in obj:
                    if key.startswith(x):
                        x_values = np.append(x_values, obj[key])
                    elif key.startswith(y):
                        y_values = np.append(y_values, obj[key])
                #     elif key.startswith("vctrlmax_20"):
                #         max = obj[key]
                #     elif key.startswith("vctrlmin_20"):
                #         min = obj[key]
                # if min != "" and max != "":
                #     y_values = np.append(y_values, (max + min)/2)
                #     min = ""
                #     max = ""
        
        # print(file.name, x, y, "x:", x_values, "y:", y_values)
        corr = round(np.corrcoef(x_values, y_values)[0, 1], 3)
        print("Correlation coefficient between", x, "and", y, "is:", corr)


label_dict = {
    "v(xdut.vn)": r'$V_{n}$',
    "v(xdut.vp)": r'$V_{p}$',
    "v(xdut.vctrl)": r'$V_{ctrl}$',
    "v(vref)": r'$V_{ref}$',
    "v(xdut.vout)": r'$V_{out}$',
    "v(xdut.x3.vbgctrl)": r'$V_{ctrlRef}$',
    "v(xdut.x4.vbgctrl)": r'$V_{ctrlRef}$',
    "v(xdut.x3.vptatctrl)": r'$V_{ctrlPTAT}$',
    "v(dec_tmpcount_out1)": r'$tmpCount1$',
    "v(dec_tmpcount_out2)": r'$tmpCount2$',
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
    "v(s_ccocap1)": r'$sCCOcap1$',
    "v(s_ccocap2)": r'$sCCOcap2$',
    "v(s_ptatctrl)": r'$sCtrlPTAT$',
    "v(s_bgctrl)": r'$sCtrlRef$',
    "v(pwrup)": r'$PwrUp$',
    "v(cmp_p1)": r'$sChopp$',
    "v(cmp_p2)": r'$sChoppN$',
    "v(s_ref2cmp)": r'$sRef\&Cco2Cmp$',
    "v(s_bg2cmp)": r'$sBg2Cmp$',
    }



################### Finished plots ###################

name = "output_tran/TYP_tmpSns_20deg_PLOTTING"
digHeight = 1.3

def plotBGSETUPsequence():
    signal_groups = [
        ["v(pii1)", "v(pi1)", "v(src_n)", "v(snk)"],
        ["v(xdut.vn)", "v(xdut.vp)", "v(xdut.x3.vptatctrl)", "v(xdut.x3.vbgctrl)"],
        ["v(cmp)"],
    ]
    y_lims = [
    (-0.2, 2),  # y-limits for the second group
    (-0.1, 1),  # y-limits for the first group
    (-0.2, 2),  # y-limits for the third group
    ]
    
    colors = [
        [],
        [],
        ["C4"],       
    ]
    
    rawplot(
        name + ".raw",
        'time',
        signal_groups=signal_groups,
        ptype="same",
        fname="startupSequence.pgf",
        xlim=(0, 8),    
        colors=colors,  
        ylims=y_lims,     
        plot_height=[1.2,2.1,1.2],
        legend_loc=["right", "right", "right"],
        backend="pgf",
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
        (0.7385, 0.744),
        (0.432, 0.438),
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
        xlim=(29.2, 33.8),      
        ylims=y_lims,     
        plot_height=[1.5,1.5,1,1,1.2],
        legend_loc=["right", "right", "right", "right", "right"],
        colors=colors,
        backend="pgf",
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

def plotTmpSnsCloseup():
    signal_groups = [
        ["v(vref)","v(xdut.vcap)"],
        ["v(cmp)"],
        ["v(s_ccocap1)", "v(s_ccocap2)"],
        ["v(dec_tmpcount_out1)"],
    ]
    
    
    y_lims = [
        (-0.1, 1.2),
        (-0.2, 2),
        (-0.2, 2),
        (51,63),
    ]

    colors = [
        ["C0", "C1"],
        ["C2"],
        ["C3","C4"],
        ["C5"]
    ]

    rawplot(
        name + ".raw",
        'time',
        signal_groups=signal_groups,
        ptype="same",
        fname="tmpSnsCloseup.pgf",
        xlim=(66.9, 68.6),      
        ylims=y_lims,     
        plot_height=1.4,
        legend_loc=["right", "right", "right", "right"],
        colors=colors,
        backend="pgf",
    )

def plotTmpSnsOverview():
    signal_groups = [
        ["v(xdut.vn)", "v(xdut.vp)", "v(vref)", "v(xdut.x3.vptatctrl)", "v(xdut.x3.vbgctrl)"],
        ["v(s_bgctrl)", "v(s_ptatctrl)"],
        ["v(pwrup)"],
        ["v(dec_tmpcount_out1)", "v(dec_tmpcount_out2)"],
    ]
    
    
    y_lims = [
        (0.1, 1.1),
        (-0.2, 2),
        (-0.2, 2),
        (0,80),
    ]

    colors = [
        ["C0", "C1", "C2", "C3", "C4"],
        ["C5", "C6"],
        ["C9"],       
        ["C7", "C8"],
    ]

    rawplot(
        name + ".raw",
        'time',
        signal_groups=signal_groups,
        ptype="same",
        fname="tmpSnsOverview.pgf",
        xlim=(0, 100),      
        ylims=y_lims,     
        plot_height=[2.5, 0.9, 0.9, 1.2],
        legend_loc=["right", "center left", "center left"],
        colors=colors,
        backend="pgf",
    )

def plotSleepStartup():
    name = "output_tran/TYP_sleep&startup20"
    signal_groups = [
        ["v(vref)"],
        ["v(dec_tmpcount_out1)", "v(dec_tmpcount_out2)"],
        ["v(pwrup)"],
    ]
    
    
    y_lims = [
        (1.03, 1.05),
        (0,200),
        (-0.2, 2),
        (-0.2, 2),
    ]

    colors = [
        ["C0"],
        ["C1", "C2"],
        ["C3"],       
    ]

    rawplot(
        name + ".raw",
        'time',
        signal_groups=signal_groups,
        ptype="same",
        fname="tmpSnsSleepStartup.pgf",
        xlim=(18797, 18880),      
        ylims=y_lims,     
        plot_height=[2, 1.2, 0.9],
        legend_loc=["upper left", "center left", "center"],
        colors=colors,
        backend="pgf",
    )

def plotMCchopping():
    name = "output_tran/MC_20deg_vref"
    signal_groups = [
        ["v(xdut.x3.vbgctrl)"],
        ["v(xdut.vn)", "v(xdut.vp)"],
        ["v(cmp)"],
        ["v(cmp_p1)"],
    ]
    
    
    y_lims = [
        (0.39, 0.475),
        (0.7, 0.79),
        (-0.2, 2),
        (-0.2, 2),
    ]

    colors = [
        ["C2"],
        ["C0", "C1"],
        ["C4"],
        ["C3"],
    ]

    rawplot(
        name + ".raw",
        'time',
        signal_groups=signal_groups,
        ptype="same",
        fname="MCchopping.pgf",
        xlim=(70, 80),      
        ylims=y_lims,     
        plot_height=[1.5, 1.5, 0.9, 0.9],
        legend_loc=["right", "right", "right", "right"],
        colors=colors,
        backend="pgf",
    )

def plotRefProb():
    signal_groups = [
        ["v(vref)"],
        ["v(s_bg2cmp)", "v(s_ref2cmp)"],
        ["v(dec_tmpcount_out1)", "v(dec_tmpcount_out2)"],
    ]
    
    
    y_lims = [
        (1.038, 1.05),
        (-0.2, 2),
        (0, 80),
    ]

    colors = [
        ["C0"],
        ["C2", "C1"],
        ["C4", "C3"],
    ]

    rawplot(
        name + ".raw",
        'time',
        signal_groups=signal_groups,
        ptype="same",
        fname="refProb.pgf",
        xlim=(25, 110),      
        ylims=y_lims,     
        plot_height=[1.8, 0.9,1.2],
        legend_loc=["down left", "center left", "center left", "right"],
        colors=colors,
        backend="pgf",
    )

def plotMCTempDependence():
    plotSensTempDependenceMC(
        "sim_results/MC_tmpSnsSweep_0601_part1",
        POC=0,
        curent_or_counter="current",
        y_estimate_temp=True,
        show_ideal=False,
        show_inaccuracy=False,
        violin=False,
        # fname="MC_TempDependence.pgf",
        )

def plotETCTempDependenceCurrent():
    plotSensTempDependenceETC(
        "sim_results/ETC_tmpSnsSweep_0601",
        POC=0,
        curent_or_counter="current",
        y_estimate_temp=True,
        show_ideal=True,
        # show_inaccuracy=True,
        figsize=(6,3.5),
        height_ratio=[1.6,1],
        fname="ETC_Curent_TempDependence_0poc.pgf",
    )
    plotSensTempDependenceETC(
        "sim_results/ETC_tmpSnsSweep_0601",
        POC=1,
        curent_or_counter="current",
        y_estimate_temp=True,
        show_ideal=True,
        show_inaccuracy=True,
        plot_error=False,
        figsize=(6,3),
        height_ratio=[1.6,1],
        fname="ETC_Curent_TempDependence_1poc.pgf",
    )
    plotSensTempDependenceETC(
        "sim_results/ETC_tmpSnsSweep_0601",
        POC=2,
        curent_or_counter="current",
        y_estimate_temp=True,
        show_ideal=True,
        show_inaccuracy=True,
        plot_error=True,
        figsize=(6,4.3),
        height_ratio=[1.6,1],
        fname="ETC_Curent_TempDependence_2poc.pgf",
    )

def plotMCTempDependenceCurrent():
    plotSensTempDependenceMC(
        "sim_results/MC_tmpSnsSweep_0601_part1",
        POC=0,
        curent_or_counter="current",
        y_estimate_temp=True,
        show_ideal=True,
        # show_inaccuracy=True,
        # violin=True,
        figsize=(6,3),
        height_ratio=[1.6,1],
        fname="MC_Curent_TempDependence_0poc.pgf",
    )
    plotSensTempDependenceMC(
        "sim_results/MC_tmpSnsSweep_0601_part1",
        POC=1,
        curent_or_counter="current",
        y_estimate_temp=True,
        show_ideal=True,
        # show_inaccuracy=True,
        # violin=True,
        figsize=(6,3),
        height_ratio=[1.6,1],
        fname="MC_Curent_TempDependence_1poc.pgf",
    )
    plotSensTempDependenceMC(
        "sim_results/MC_tmpSnsSweep_0601_part1",
        POC=2,
        curent_or_counter="current",
        y_estimate_temp=True,
        show_ideal=True,
        # show_inaccuracy=True,
        violin=True,
        figsize=(6,4.3),
        height_ratio=[1.6,1],
        fname="MC_Curent_TempDependence_2poc.pgf",
    )

def plotETCTempDependenceCounter():
    plotSensTempDependenceETC(
        "sim_results/ETC_tmpSnsSweep_0601",
        POC=0,
        curent_or_counter="counter",
        y_estimate_temp=True,
        show_ideal=True,
        # show_inaccuracy=True,
        figsize=(6,3.5),
        height_ratio=[1.6,1],
        fname="ETC_Counter_TempDependence_0poc.pgf",
    )
    plotSensTempDependenceETC(
        "sim_results/ETC_tmpSnsSweep_0601",
        POC=1,
        curent_or_counter="counter",
        y_estimate_temp=True,
        show_ideal=True,
        # show_inaccuracy=True,
        figsize=(6,3.5),
        height_ratio=[1.6,1],
        fname="ETC_Counter_TempDependence_1poc.pgf",
    )
    plotSensTempDependenceETC(
        "sim_results/ETC_tmpSnsSweep_0601",
        POC=2,
        curent_or_counter="counter",
        y_estimate_temp=True,
        show_ideal=True,
        # show_inaccuracy=True,
        # plot_error=True,
        figsize=(6,3.5),
        height_ratio=[1.6,1],
        fname="ETC_Counter_TempDependence_2poc.pgf",
    )

def plotTYPTempDependenceCounter():
    plotSensTempDependenceETC(
        "sim_results/ETC_tmpSnsSweep_0601/typ",
        POC=2,
        curent_or_counter="counter",
        y_estimate_temp=True,
        show_ideal=True,
        show_inaccuracy=True,
        plot_error=True,
        figsize=(6,3.6),
        height_ratio=[2,1],
        fname="TYP_TempDependenceCounter.pgf",
    )

def plotMCTempDependenceCounter():
    plotSensTempDependenceMC(
        "sim_results/MC_tmpSnsSweep_0601_part1",
        POC=0,
        curent_or_counter="counter",
        y_estimate_temp=True,
        show_ideal=True,
        show_inaccuracy=False,
        violin=True,
        figsize=(6,3.9),
        height_ratio=[1.6,1],
        fname="MC_TempDependenceCounter_0poc.pgf",
    )
    plotSensTempDependenceMC(
        "sim_results/MC_tmpSnsSweep_0601_part1",
        POC=1,
        curent_or_counter="counter",
        y_estimate_temp=True,
        show_ideal=True,
        show_inaccuracy=False,
        violin=True,
        figsize=(6,3.9),
        height_ratio=[1.6,1],
        fname="MC_TempDependenceCounter_1poc.pgf",
    )
    plotSensTempDependenceMC(
        "sim_results/MC_tmpSnsSweep_0601_part1",
        POC=2,
        curent_or_counter="counter",
        y_estimate_temp=True,
        show_ideal=True,
        show_inaccuracy=False,
        violin=True,
        figsize=(6,3.9),
        height_ratio=[1.6,1],
        fname="MC_TempDependenceCounter_2poc.pgf",
    )
        
######################################################


plotETCTempDependenceCurrent()
plotMCTempDependenceCurrent()
plotETCTempDependenceCounter()
plotMCTempDependenceCounter()
plotTYPTempDependenceCounter()

def plotETCTempDependenceCounterNoSlowPMOS():
    plotSensTempDependenceETC(
        "sim_results/ETC_tmpSnsSweep_0601 copy",
        POC=2,
        curent_or_counter="counter",
        y_estimate_temp=True,
        show_ideal=True,
        # show_inaccuracy=True,
        # plot_error=True,
        figsize=(6,3.5),
        height_ratio=[1.6,1],
        fname="ETC_Counter_TempDependence_2poc_NoSlowPMOS.pgf",
    )
    

plotETCTempDependenceCounterNoSlowPMOS()