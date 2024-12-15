#!/usr/bin/env python3
import pandas as pd
import yaml
import matplotlib.pyplot as plt
import numpy as np

from plot import *

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
  
  print(vref)
  print(temp)

  ppm = round(((np.max(vref) - np.min(vref))/(np.mean(vref)*(np.max(temp)-np.min(temp)))) * 1e6, 2)
  print(yamlfile + " Temperature constant: ",ppm, "ppm/C")
  return ppm


def main(name):

  rawplot(name + ".raw",'time',"v(vref),v(xdut.vn),v(xdut.vp)",ptype="same",fname=name + ".pdf", removeFirstSamples=True)
  #plotTempDependence(name)
  #calcPpm(name)
  
  
  return


main("tran_etc_temp/tran_SchGtKsfTtVh_20")