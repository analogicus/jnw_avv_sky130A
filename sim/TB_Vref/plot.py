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
Rout = 4*7535+7535/3
Tclk = 50e-9  # Clock period in seconds
vref = 1        # Do i use the calculated or the simulated vref?
Cosc = 53.8e-15*4*3
Nclk = 201


def calcIptat(temp):
    return (k * (temp + 273.15) * np.log(8)) / (R1 * q) 

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


def plot(df,xname,yname,ptype=None,ax=None,label="", rmFirst = False):
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
    
    # Adjust the number of samples to remove from plot
    if rmFirst:
        x = x[500:].reset_index(drop=True)
        y = y[500:].reset_index(drop=True)
    
    
    if label == "":
        # Apply regex transformations to standardize the label
        label = re.sub(r"^v\(xdut\.x\d+\)", "", yname)  # Remove 'v(xdut.x<number>)'
        label = re.sub(r"^v\(xdut\.(.*?)\)$", r"\1", label)  # Remove 'v(xdut.<anything>)'
        label = re.sub(r"^v\((.*)\)$", r"\1", label)  # Remove 'v(<anything>)'
        
        # Capitalize the first letter if the label starts with 'v'
        if label[0] == 'v':  # Check if the first character is 'v'
            label = label[0].upper() + label[1:]  # Capitalize it

        # Er nok mulig å få subscrpit i label hvis jeg bruker noe som er brukt lengre nede: r'$\sigma$ = '
        # r-en foran stringen gjør at du kan skrive i latex-format

    #- Plot
    if("logy" in ptype):
        ax.semilogy(x,y,label = label)
    elif("ln2" in ptype):
        ax.plot(x,np.log(y)/np.log(2),label = label)
    elif("logx" in ptype):
        ax.semilogx(x,y,label)
    elif("db20" in ptype):
        ax.semilogx(x,20*np.log10(y),label="dB20("+ label +")")
    else:
        ax.plot(x,y,label = label)

    # ax.grid()
    ax.legend()

    if(ptype == ""):
        ax.set_ylabel(yname)
    return (x,y)


def rawplot(fraw,xname,yname,ptype=None,axes=None,fname=None,removeFirstSamples=False):

    dfs = ngraw.toDataFrames(ngraw.ngRawRead(fraw))

    if(len(dfs)> 0):
        df = dfs[0]

    else:
        raise "You have multiple plots in .raw file, that's not supported"

    if("," in yname):
        names = yname.split(",")
        if("same" in ptype):
            f,axes = plt.subplots(sharex=True, tight_layout=True, figsize=(8, 5))
        else:
            f,axes = plt.subplots(len(names),1,sharex=True)

        for i in range(0,len(names)):
            if("same" in ptype):
                plot(df,xname,names[i],ptype,ax=axes, rmFirst = removeFirstSamples)
            else:
                plot(df,xname,names[i],ptype,ax=axes[i],rmFirst = removeFirstSamples)
    elif(axes is not None):
        plot(df,xname,yname,ptype,axes,label=" %s" %fraw)
    else:
        f,axes = plt.subplots(sharex=True, tight_layout=True, figsize=(8, 5))
        plot(df,xname,yname,ptype,axes,label=" %s" %fraw)

    if(xname == "time"):    
        plt.xlabel("Time [s]")
    elif(xname == "frequency"):
        plt.xlabel("Frequency [Hz]")
    elif(xname == "temperature"):
        plt.xlabel("Temperature [K]")
    plt.grid()
    plt.ylabel("Voltage [V]")
    plt.tight_layout()

    #if("tikz" in ptype):
    #    tikzplotlib.save(fname.replace(".csv",".pgf"))



    # if(fname is not None):
    #     plt.savefig(fname)

    # if("pdf" not in ptype):
    plt.show()


def plotTempDependence(yamlfile):
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


def plotVrefDistribution(groups, Temp=None, names=None, bins=10):
    import pandas as pd
    import numpy as np

    if names is None:
        names = [f"Group {i+1}" for i in range(len(groups))]
    else:
        assert len(names) == len(groups), "Length of names must match number of groups."

    colors = plt.rcParams['axes.prop_cycle'].by_key()['color']
    fig, ax = plt.subplots(sharey=True, tight_layout=True, figsize=(8,5))
    ax2 = ax.twinx()  # for density

    all_vrefMeans = []
    group_vref_data = []
    for i, group in enumerate(groups):
        folders = group if isinstance(group, (list, tuple)) else [group]
        vrefMean = np.array([])
        for folder in folders:
            for file in os.scandir(folder):
                if file.name.endswith(".yaml"):
                    mean = getVref(os.path.join(folder, file.name[:-5]), temp=Temp)
                    vrefMean = np.append(vrefMean, mean)
        group_vref_data.append(vrefMean)
        if len(vrefMean):
            all_vrefMeans.extend(vrefMean)
    xmin = min(all_vrefMeans) if len(all_vrefMeans)>0 else 0
    xmax = max(all_vrefMeans) if len(all_vrefMeans)>0 else 1
    xrange_pad = (xmax-xmin)*0.04 + 4
    xlim = (xmin-xrange_pad, xmax+xrange_pad)

    box_coords = []

    for i, vrefMean in enumerate(group_vref_data):
        total_points = len(vrefMean)
        if total_points == 0:
            continue
        std = round(np.std(vrefMean), 2)
        color = colors[i%len(colors)]
        # Filled histogram (counts)
        ax.hist(
            vrefMean, bins=bins, density=False, alpha=0.35, 
            edgecolor=None, color=color, linewidth=2
        )
        # Outline
        ax.hist(
            vrefMean, bins=bins, density=False, histtype='step', label=names[i], 
            fill=False, edgecolor=color, linewidth=2, alpha=1
        )
        # KDE (density, on right y-axis)
        pd.Series(vrefMean).plot(
            kind="kde", ax=ax2, color=color, linewidth=1, label="_nolegend_")
        box_coords.append((i, color, std, total_points))
    # Info boxes as before
    for i, (idx, color, std, total_points) in enumerate(box_coords):
        textstr = r'$\sigma\!=$' + f"{std} mV\nN={total_points}"
        ax.annotate(
            textstr, xy=(0.96, 0.96-0.13*idx),
            xycoords='axes fraction', ha="right", va='top',
            bbox=dict(facecolor='white', edgecolor=color, boxstyle='round,pad=0.6', linewidth=2))
    ax.set_xlabel("Voltage [mV]")
    ax.set_ylabel("Frequency")
    ax.set_xlim(*xlim)
    ax.legend(loc='upper left')
    if Temp is None:
        ax.set_title("Distribution of Vref mean")
    else:
        ax.set_title(f"Distribution of Vref at {Temp}C")
    from matplotlib.ticker import MaxNLocator
    ax.yaxis.set_major_locator(MaxNLocator(integer=True))
    ax2.set_yticks([])       # Hides number labels
    ax2.set_ylabel("")       # Removes axis text (label)
    ax2.spines['right'].set_visible(False) 
    ax2.set_ylim(bottom=0, top=ax.get_ylim()[1]*0.01)
    ax2.set_yticks([])
    plt.tight_layout()
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


# plotVrefDistribution(
#     [["sim_results/MC_tempSweep_0430"],["sim_results/MC_tempSweep_0427"]], 
#     Temp="20",
#     names=["Temp sweep 1", "Temp sweep 2"]
#     )

# plotVrefDistribution([["a", "b"],"c"], Temp="20")

plotTempDependence("output_tran/tran_SchGtKttmmTtVt_1")