import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
from cicsim import command as cm
from cicsim import ngraw
import sys
import math
import re






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
        
    if rmFirst:
        x = x[65:].reset_index(drop=True)
        y = y[65:].reset_index(drop=True)
    
    
    if label == "":
        # Apply regex transformations to standardize the label
        label = re.sub(r"^v\(xdut\.x\d+\)", "", yname)  # Remove 'v(xdut.x<number>)'
        label = re.sub(r"^v\(xdut\.(.*?)\)$", r"\1", label)  # Remove 'v(xdut.<anything>)'
        label = re.sub(r"^v\((.*)\)$", r"\1", label)  # Remove 'v(<anything>)'
        
        # Capitalize the first letter if the label starts with 'v'
        if label[0] == 'v':  # Check if the first character is 'v'
            label = label[0].upper() + label[1:]  # Capitalize it


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

    ax.legend()

    if(ptype == ""):
        ax.set_ylabel(yname)
    ax.grid()
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
            f,axes = plt.subplots(1,1)
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
        f,axes = plt.subplots(1,1)
        plot(df,xname,yname,ptype,axes,label=" %s" %fraw)

    if(xname == "time"):    
        plt.xlabel("Time [s]")
    elif(xname == "frequency"):
        plt.xlabel("Frequency [Hz]")
    elif(xname == "temperature"):
        plt.xlabel("Temperature [K]")

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


  fig,ax = plt.subplots(figsize=(10,5))
  ax.set_xlabel("Temperature [C]")
  ax.set_ylabel("Voltage [V]")
  ax.plot(sorted_temp,sorted_vref,label="Vref")
  ax.grid()
  ax.legend()
  ax.set_title("Vref vs Temperature")
  plt.tight_layout()
  plt.show()

  # Save new yaml file
  # with open(yamlfile,"w") as fo:
  #   yaml.dump(obj,fo)


#rawplot("tran_SchGtKttTtVt.raw","time", "v(vin),v(vip),v(vout)", ptype="same",fname="tran_SchGtKttTtVt.pdf")

