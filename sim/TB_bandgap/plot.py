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


def calcVrefMean(yamlfile):
    with open(yamlfile + ".yaml") as fi:
        obj = yaml.safe_load(fi)

    vref = np.array([])

    for key in obj:
        if key.startswith("vref"):
            vref = np.append(vref, obj[key])
  
    mean = round((np.mean(vref))*1000, 1)
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


def plotVrefDistribution(folder):
    # Read result yaml file
    vrefMean = np.array([])
    total_points = 0
    for file in os.scandir(folder):
        if file.name.endswith(".yaml"):
            mean = calcVrefMean(folder + "/" + file.name[:-5])
            print(file.name, mean)
            vrefMean = np.append(vrefMean, mean)
            total_points += 1

    std = round(np.std(vrefMean), 2)

    fig,ax = plt.subplots(sharey=True,tight_layout=True,figsize=(7,5))
    ax.hist(vrefMean, bins=10, edgecolor='black')
    ax.set_title("Vref distribution")
    ax.set_xlabel("Voltage [mV]")
    ax.set_ylabel("Frequency")
    ax.annotate(r'$\sigma$ = ' + str(std) + "mV", xy=(0.8, 0.9), xycoords='axes fraction',
                bbox=dict(facecolor='white', edgecolor='black', boxstyle='round,pad=0.5'))
    ax.annotate("Points: " + str(total_points), xy=(0.8, 0.8), xycoords='axes fraction',
                bbox=dict(facecolor='white', edgecolor='black', boxstyle='round,pad=0.5'))
    # ax.yaxis.grid(True)  
    # ax.xaxis.grid(False) 
    ax.yaxis.set_major_locator(MaxNLocator(integer=True))
    plt.show()


def plotPpmDistribution(folder):
    # Read result yaml file
    ppmValues = np.array([])
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


# plotVrefDistribution("sim_results/")  
# plotPpmDistribution("sim_results/MC_21_feb_tempSweep")  


# name = "output_tran/tran_SchGtKttTtVt_21"

# rawplot(name + ".raw",'time',"v(xdut.vn),v(xdut.vp),v(xdut.vctrl),v(vref)",ptype="same",fname=name + ".pdf", removeFirstSamples=True)

# plotTempDependence("sim_results/MC_18_feb_tempSweep/tran_SchGtKttmmTtVt_6")
# plotTempDependence("output_tran/tran_SchGtKttmmTtVt_6")
# plotTempDependence("output_tran/tran_SchGtKttmmTtVt_5")
# plotTempDependence("output_tran/tran_SchGtKttmmTtVt_4")
# plotTempDependence("output_tran/tran_SchGtKttmmTtVt_3")
# plotTempDependence("output_tran/tran_SchGtKttmmTtVt_2")
# plotTempDependence("output_tran/tran_SchGtKttmmTtVt_1")
# plotTempDependence("output_tran/tran_SchGtKttmmTtVt_7")
# plotTempDependence("output_tran/tran_SchGtKttmmTtVt_8")