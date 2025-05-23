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

# matplotlib.use('pgf')

k = 1.380649e-23  # Boltzmann constant in J/K
q = 1.602176634e-19  # Elementary charge in C
R1 = 7535
Rout = 4*7535+7535/3
Tclk = 50e-9  # Clock period in seconds
vref = 1        # Do i use the calculated or the simulated vref?
Cosc = 53.8e-15*4*7
Nclk = 401


def calcIptat(temp):
    return (k * (temp + 273.15) * np.log(8)) / (R1 * q) 

# print("Iptat at 125C:", calcIptat(125))

# print((15e-6 * 100e-9 / (1.1))/53.8e-15)

def calcCount(temp):
    return (Tclk * Nclk)/((Cosc * vref)/calcIptat(temp)) 

# for temp in [-40, -20, 0, 20, 40, 60, 80, 100, 125]:
#     # print("Iptat at", temp, "C:", calcIptat(temp))
#     print("Count at", temp, "C:", calcCount(temp))



    

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


def plot(df,xname,yname,ptype=None,ax=None,label="", color=None):
    cmd = cm.Command()
    if(xname not in df.columns):
        cmd.error("Could not find name %s in %s" %(xname,",".join(df.columns)))
        exit()
    if(yname not in df.columns):
        cmd.error("Could not find name %s in %s" %(xname,",".join(df.columns)))
        exit()
        #raise Exception("Could not find name %s in %s" %(yname,",".join(df.columns)))

    x = df[xname]
    y = df[yname]
        
    if label == "":
        label = label_dict.get(yname, yname) 

    #- Plot
    if("logy" in ptype):
        ax.semilogy(x,y,label = label, color=color)
    elif("ln2" in ptype):
        ax.plot(x,np.log(y)/np.log(2),label = label, color=color)
    elif("logx" in ptype):
        ax.semilogx(x,y,label, color=color)
    elif("db20" in ptype):
        ax.semilogx(x,20*np.log10(y),label="dB20("+ label +")", color=color)
    else:
        ax.plot(x,y,label = label, color=color)

    # ax.grid()
    ax.legend()

    if(ptype == ""):
        ax.set_ylabel(yname)
    return (x,y)


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
    fig, axes = plt.subplots(n_subplots, 1, sharex=True, figsize=(6.3, plot_height*n_subplots))
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
    # plt.show()
    plt.savefig("plots/operationCloseup.pgf") 
    
    
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
  
def countToTemp(count):
    A = (k * np.log(8)) / (R1 * q)
    temp = (count * (Cosc * vref) / (Tclk * Nclk * A)) - 273.15
    return temp

def plotSensTempDependence(path, POC=None):
    cal_t1 = 0  # First calibration temperature (C)
    cal_t2 = 80  # Second calibration temperature (C)

    def parse_and_calibrate(filepath):
        with open(filepath) as fi:
            obj = yaml.safe_load(fi)
        # Find all entries for tmpcount1 and tmpcount2
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
                if len(vals) == 2:
                    avg = sum(vals)/2
                else:
                    avg = vals[0]
                    print(f"Warning: Only one of tmpcount1 or tmpcount2 present for T={t}C in {os.path.basename(filepath)}")
                temps[t] = avg
        # Calibration
        if POC == 1:
            if cal_t1 not in temps:
                print(f"{os.path.basename(filepath)}: missing {cal_t1}C for 1pt calibration")
            else:
                c_error = calcCount(cal_t1) - temps[cal_t1]
                temps = {k: v + c_error for k, v in temps.items()}
        elif POC == 2:
            if cal_t1 not in temps or cal_t2 not in temps:
                print(f"{os.path.basename(filepath)}: missing {cal_t1}C or {cal_t2}C for 2pt calibration")
            else:
                meas_1 = temps[cal_t1]
                meas_2 = temps[cal_t2]
                ref_1 = calcCount(cal_t1)
                ref_2 = calcCount(cal_t2)
                m = (ref_2 - ref_1)/(meas_2 - meas_1)
                b = ref_1 - m*meas_1
                temps = {k: m*v + b for k, v in temps.items()}
        return temps

    fig, ax = plt.subplots(figsize=(10,5))
    if os.path.isdir(path):
        for file in sorted(os.listdir(path)):
            if not file.endswith(".yaml"):
                continue
            fullfile = os.path.join(path, file)
            temps = parse_and_calibrate(fullfile)
            counters = list(temps.values())
            est_temps = [countToTemp(c) for c in counters]
            ax.plot(list(temps.keys()), est_temps, marker='o', label=file[10:-5])
    else:
        temps = parse_and_calibrate(path)
        counters = list(temps.values())
        est_temps = [countToTemp(c) for c in counters]
        ax.plot(list(temps.keys()), est_temps, marker='o')
    ax.set_title("Temperature dependence of Temperature sensor")
    ax.set_ylabel("Estimated temperature [°C]")
    ax.set_xlabel("Temperature [C]")
    ax.legend()
    ax.grid()

    desired_ticks = [-40, -20, 0, 20, 40, 60, 80, 100, 125]
    lower_lim = desired_ticks[0] - 10
    upper_lim = desired_ticks[-1] + 10
    ax.set_xticks(desired_ticks)
    ax.set_yticks(desired_ticks)
    ax.set_xlim(lower_lim, upper_lim)
    ax.set_ylim(lower_lim, upper_lim)
    plt.tight_layout()
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
    "v(xdut.x3.vptatctrl)": r'$V_{ctrlPTAT}$',
    "v(dec_tmpcount_out1)": r'$V_{count1}$',
    "v(dec_tmpcount_out2)": r'$V_{count2}$',
    "v(pa)": r'$sOut$',
    "v(pb)": r'$sAvgCapH$',
    "v(pc)": r'$sAvgCapL$',
    "v(pd)": r'$sRefCap$',
    "v(pi1)": r'$sBD$',
    "v(pi2)": r'$sBDC$',
    "v(pii1)": r'$sSD$',
    "v(pii2)": r'$sSDC$',
    "v(snk)": r'$sSnk$',
    "v(src_n)": r'$sSrc$',
    "v(cmp)": r'$V_{cmp}$',
    }


# signal_groups = [
#     ["v(pii1)", "v(pi1)", "v(src_n)", "v(snk)"],
#     ["v(xdut.vn)", "v(xdut.vp)", "v(xdut.x3.vptatctrl)", "v(xdut.x3.vbgctrl)"],
# ]

signal_groups = [
    ["v(xdut.vn)", "v(xdut.vp)"],
    ["v(xdut.x3.vbgctrl)"],
    ["v(cmp)"],
    ["v(pii1)", "v(pi1)","v(pb)","v(pc)","v(pd)"]
]

# y_lims = [
#     (-0.1, 2),  # y-limits for the second group
#     (-0.1, 1),  # y-limits for the first group
# ]

y_lims = [
    (0.741, 0.747),
    (0.424, 0.431),
    (-0.1, 2),
    (-0.1, 2),
]

colors = [
    ["C0", "C1"],
    ["C2"],
    ["C3"],
]

name = "output_tran/tran_SchGtKttTtVt_20"
# rawplot(
#     name + ".raw",
#     'time',
#     signal_groups=signal_groups,
#     ptype="same",
#     fname=name + ".pdf",
#     xlim=(27.3, 31.3),      
#     ylims=y_lims,     
#     plot_height=1.6,
#     legend_loc=["right", "right", "right", "right"],
#     colors=colors
# )




# plotVrefTempDependence("sim_results/MC_18_feb_tempSweep/tran_SchGtKttmmTtVt_6")

plotSensTempDependence("sim_results/ETC_tempSweep_0523", POC=None)
plotSensTempDependence("sim_results/ETC_tempSweep_0523", POC=1)
plotSensTempDependence("sim_results/ETC_tempSweep_0523", POC=2)