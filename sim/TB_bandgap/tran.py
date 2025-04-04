#!/usr/bin/env python3
import pandas as pd
import yaml
import matplotlib.pyplot as plt
import numpy as np

from plot import plotTempDependence, rawplot, calcPpm, getVref, calcVrefMaxMinDelta 



def main(name):

  # rawplot(name + ".raw",'time',"v(vref),v(xdut.vn),v(xdut.vp)",ptype="same",fname=name + ".pdf", removeFirstSamples=True)
  # plotTempDependence(name + "SchGtKttTtVt")

  if (1):  # Print TC of etc and typical corners
    # print("SchGtKffTtVl ppm and mean: ", calcPpm(name + "SchGtKffTtVl"), getVref(name + "SchGtKffTtVl"))
    # print("SchGtKffTtVh ppm and mean: ", calcPpm(name + "SchGtKffTtVh"), getVref(name + "SchGtKffTtVh"))  
    # print("SchGtKssTtVl ppm and mean: ", calcPpm(name + "SchGtKssTtVl"), getVref(name + "SchGtKssTtVl"))  
    # print("SchGtKssTtVh ppm and mean: ", calcPpm(name + "SchGtKssTtVh"), getVref(name + "SchGtKssTtVh"))  
    # print("SchGtKfsTtVl ppm and mean: ", calcPpm(name + "SchGtKfsTtVl"), getVref(name + "SchGtKfsTtVl"))  
    # print("SchGtKfsTtVh ppm and mean: ", calcPpm(name + "SchGtKfsTtVh"), getVref(name + "SchGtKfsTtVh"))  
    # print("SchGtKsfTtVl ppm and mean: ", calcPpm(name + "SchGtKsfTtVl"), getVref(name + "SchGtKsfTtVl"))  
    # print("SchGtKsfTtVh ppm and mean: ", calcPpm(name + "SchGtKsfTtVh"), getVref(name + "SchGtKsfTtVh"))
    print("SchGtKttTtVt ppm and mean: ", calcPpm(name + "SchGtKttTtVt"), getVref(name + "SchGtKttTtVt"))
    # print("SchGtKttmmTtVt ppm and mean: ", calcPpm(name + "SchGtKttmmTtVt"), getVref(name + "SchGtKttmmTtVt"))
    # print("SchGtKttmmTtVt_1 ppm and mean: ", calcPpm(name + "SchGtKttmmTtVt_1"), calcVrefMean(name + "SchGtKttmmTtVt_1"))  
    # print("SchGtKttmmTtVt_2 ppm and mean: ", calcPpm(name + "SchGtKttmmTtVt_2"), calcVrefMean(name + "SchGtKttmmTtVt_2"))
    # print("SchGtKttmmTtVt_3 ppm and mean: ", calcPpm(name + "SchGtKttmmTtVt_3"), calcVrefMean(name + "SchGtKttmmTtVt_3"))
    # print("SchGtKttmmTtVt_4 ppm and mean: ", calcPpm(name + "SchGtKttmmTtVt_4"), calcVrefMean(name + "SchGtKttmmTtVt_4"))
    # print("SchGtKttmmTtVt_5 ppm and mean: ", calcPpm(name + "SchGtKttmmTtVt_5"), calcVrefMean(name + "SchGtKttmmTtVt_5"))  
    # print("SchGtKttmmTtVt_6 ppm and mean: ", calcPpm(name + "SchGtKttmmTtVt_6"), calcVrefMean(name + "SchGtKttmmTtVt_6"))
    # print("SchGtKttmmTtVt_7 ppm and mean: ", calcPpm(name + "SchGtKttmmTtVt_7"), calcVrefMean(name + "SchGtKttmmTtVt_7"))
    # print("SchGtKttmmTtVt_8 ppm and mean: ", calcPpm(name + "SchGtKttmmTtVt_8"), calcVrefMean(name + "SchGtKttmmTtVt_8"))
    # print("SchGtKttmmTtVt_9 ppm and mean: ", calcPpm(name + "SchGtKttmmTtVt_9"), calcVrefMean(name + "SchGtKttmmTtVt_9"))
  return


main("output_tran/tran_")