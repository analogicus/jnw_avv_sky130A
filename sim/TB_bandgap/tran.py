#!/usr/bin/env python3
import pandas as pd
import yaml
import matplotlib.pyplot as plt
import numpy as np

from plot import plotTempDependence, rawplot

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
  
  # print(vref)
  # print(temp)

  ppm = round(((np.max(vref) - np.min(vref))/(np.mean(vref)*(np.max(temp)-np.min(temp)))) * 1e6, 2)
  # print(yamlfile + " Temperature constant: ",ppm, "ppm/C")
  return ppm


def main(name):

  # rawplot(name + ".raw",'time',"v(vref),v(xdut.vn),v(xdut.vp)",ptype="same",fname=name + ".pdf", removeFirstSamples=True)
  # plotTempDependence(name + "SchGtKttTtVt")

  if (0):  # Print TC of etc and typical corners
    # print("SchGtKffTtVl ppm: ", calcPpm(name + "SchGtKffTtVl"))  
    # print("SchGtKffTtVh ppm: ", calcPpm(name + "SchGtKffTtVh"))  
    # print("SchGtKssTtVl ppm: ", calcPpm(name + "SchGtKssTtVl"))  
    # print("SchGtKssTtVh ppm: ", calcPpm(name + "SchGtKssTtVh"))  
    # print("SchGtKfsTtVl ppm: ", calcPpm(name + "SchGtKfsTtVl"))  
    # print("SchGtKfsTtVh ppm: ", calcPpm(name + "SchGtKfsTtVh"))  
    # print("SchGtKsfTtVl ppm: ", calcPpm(name + "SchGtKsfTtVl"))  
    # print("SchGtKsfTtVh ppm: ", calcPpm(name + "SchGtKsfTtVh"))
    print("SchGtKttTtVt ppm: ", calcPpm(name + "SchGtKttTtVt"))
    # print("SchGtKttmmTtVt ppm: ", calcPpm(name + "SchGtKttmmTtVt"))  
    # print("SchGtKttmmTtVt_1 ppm: ", calcPpm(name + "SchGtKttmmTtVt_1"))  
    # print("SchGtKttmmTtVt_2 ppm: ", calcPpm(name + "SchGtKttmmTtVt_2"))
    # print("SchGtKttmmTtVt_3 ppm: ", calcPpm(name + "SchGtKttmmTtVt_3"))

  return


main("output_tran/tran_")