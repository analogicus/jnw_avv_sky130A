import matplotlib.pyplot as plt
import matplotlib
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
  


def plotSensTempDependence(path, POC=None):
    cal_t1 = 0  # First calibration temperature (C)
    cal_t2 = 80  # Second calibration temperature (C)

    def parse_and_calibrate(filepath):
        with open(filepath) as fi:
            obj = yaml.safe_load(fi)
        temps = {}
        for o in obj:
            if re.search("tmpcount", o):
                (dontcare, temp) = o.split("_")
                temps[int(temp)] = float(obj[o])*1000
        temps = dict(sorted(temps.items()))
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
            ax.plot(list(temps.keys()), list(temps.values()), marker='o', label=file[10:-5])
    else:
        temps = parse_and_calibrate(path)
        ax.plot(list(temps.keys()), list(temps.values()), marker='o')
    ax.set_title("Temperature dependence of Temperature sensor")
    ax.set_ylabel("Value of counter")
    ax.set_xlabel("Temperature [C]")
    ax.legend()
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


# plotVrefDistribution(["sim_results/MC_28_feb_tempSweep_nochp"], Temp="20")  
# plotVrefDistribution(["sim_results/MC_20_feb_tempSweep","sim_results/MC_21_feb_tempSweep","sim_results/MC_25_feb_tempSweep"], Temp="20")  

# plotPpmDistribution(["sim_results/MC_20_feb_tempSweep","sim_results/MC_21_feb_tempSweep","sim_results/MC_25_feb_tempSweep"])  

# getVref("sim_results/MC_28_feb_tempSweep_nochp/tran_SchGtKttmmTtVt_1", temp="20")
# name = "output_tran/tran_SchGtKttTtVt_20"

# rawplot(name + ".raw",'time',"v(xdut.vn),v(xdut.vp),v(xdut.vctrl),v(vref)",ptype="same",fname=name + ".pdf", removeFirstSamples=True)

# plotVrefTempDependence("sim_results/MC_18_feb_tempSweep/tran_SchGtKttmmTtVt_6")

# plotTempDependence("output_tran/tran_SchGtKttmmTtVt_6")
# plotSensTempDependence("output_tran/TYP_tmpSns_Sweep_tmpCount")
# plotSensTempDependence("sim_results/ETC_tmpSnsSweep_0905/tran_SchGtKttTtVt")
# plotSensTempDependence("sim_results/ETC_tmpSnsSweep_0509", folder="sim_results/ETC_tmpSnsSweep_0509", POC=1)
plotSensTempDependence("sim_results/MC_tmpSnsSweep_0509", POC=2)
# plotSensTempDependence("sim_results/ETC_tmpSnsSweep_0905", folder="sim_results/MC_tmpSnsSweep_0905")


# def plotSensTempDependence(yamlfile, folder=None, POC=None):
#     fig,ax = plt.subplots(figsize=(10,5))
#     temps = dict()
#     Cerror = 0
#     ROI = (calcCount(60)-calcCount(20))/(60-20)

#     if folder is not None:
#         for file in os.scandir(folder):
#             if not file.name.endswith(".yaml"):
#                 continue
#             with open(file) as fi:
#                 obj = yaml.safe_load(fi)
#             for o in obj:
#                 if (not re.search("tmpcount", o)):
#                     continue
#                 (dontcare, temp) = o.split("_")
#                 temps[int(temp)] = float(obj[o])*1000
#             temps = dict(sorted(temps.items()))
            # if POC == 1:
            #     # print("Count @ 20 deg", temps[20])
            #     Cerror = calcCount(20) - temps[20]
            #     # print("Cerror: ", Cerror)
            #     for key in temps:
            #         temps[key] = temps[key] + Cerror
                # print("Corrected count: ", temps)
#                 if POC == 2:
#                     measured_20 = temps.get(20)
#                     measured_60 = temps.get(60)
#                     if measured_20 is None or measured_60 is None:
#                         print(file.name, "missing temp points for 2-point cal (need 20C,60C), skipping.")
#                         continue
#                     theo_20 = calcCount(20) * 1000  # match scale
#                     theo_60 = calcCount(60) * 1000
#                     # Compute linear fit
#                     m = (theo_60 - theo_20) / (measured_60 - measured_20)
#                     b = theo_20 - m * measured_20
#                     for key in temps:
#                         temps[key] = m * temps[key] + b
                
                
#             ax.plot(list(temps.keys()), list(temps.values()), marker='o', label=file.name[10:-5])
#             temps.clear()
#     else:
#         with open(yamlfile + ".yaml") as fi:
#             obj = yaml.safe_load(fi)     
#         for o in obj:
#             if (not re.search("tmpcount", o)):
#                 continue
#             (dontcare, temp) = o.split("_")
#             temps[int(temp)] = float(obj[o])
    
#     # print(temps)
#     ax.set_title("Temperature dependence of Temperature sensor")
#     ax.set_ylabel("Value of counter")
#     ax.set_xlabel("Temperature [C]")
#     ax.legend()
#     ax.plot(list(temps.keys()), list(temps.values()), marker='o')
#     plt.tight_layout()
#     # import tikzplotlib
#     # tikzplotlib.save("plots/ETCsnsTmpDep.pgf")
#     plt.show()