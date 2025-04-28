#!/usr/bin/env python3
import pandas as pd
import yaml
import matplotlib.pyplot as plt
import numpy as np

from plot import plotTempDependence, rawplot, calcPpm, getVref, calcVrefMaxMinDelta, plotVrefDistribution



def main(name):

  # rawplot(name + ".raw",'time',"v(vref),v(xdut.vn),v(xdut.vp)",ptype="same",fname=name + ".pdf", removeFirstSamples=True)
  # plotTempDependence(name + "SchGtKttTtVt")
  plotVrefDistribution(["sim_results/MC_tempSweep_0427"], Temp="20")

  if (0):  # Print TC of etc and typical corners
    print("SchGtKffTtVl ppm and mean: ", calcPpm(name + "SchGtKffTtVl"), getVref(name + "SchGtKffTtVl"))
    print("SchGtKffTtVh ppm and mean: ", calcPpm(name + "SchGtKffTtVh"), getVref(name + "SchGtKffTtVh"))  
    print("SchGtKssTtVl ppm and mean: ", calcPpm(name + "SchGtKssTtVl"), getVref(name + "SchGtKssTtVl"))  
    print("SchGtKssTtVh ppm and mean: ", calcPpm(name + "SchGtKssTtVh"), getVref(name + "SchGtKssTtVh"))  
    print("SchGtKfsTtVl ppm and mean: ", calcPpm(name + "SchGtKfsTtVl"), getVref(name + "SchGtKfsTtVl"))  
    print("SchGtKfsTtVh ppm and mean: ", calcPpm(name + "SchGtKfsTtVh"), getVref(name + "SchGtKfsTtVh"))  
    print("SchGtKsfTtVl ppm and mean: ", calcPpm(name + "SchGtKsfTtVl"), getVref(name + "SchGtKsfTtVl"))  
    print("SchGtKsfTtVh ppm and mean: ", calcPpm(name + "SchGtKsfTtVh"), getVref(name + "SchGtKsfTtVh"))
    print("SchGtKttTtVt ppm and mean: ", calcPpm(name + "SchGtKttTtVt"), getVref(name + "SchGtKttTtVt"))
    print("SchGtKttmmTtVt ppm and mean: ", calcPpm(name + "SchGtKttmmTtVt"), getVref(name + "SchGtKttmmTtVt"))
    print("SchGtKttmmTtVt_1 ppm and mean: ", calcPpm(name + "SchGtKttmmTtVt_1"), getVref(name + "SchGtKttmmTtVt_1"))  
    print("SchGtKttmmTtVt_2 ppm and mean: ", calcPpm(name + "SchGtKttmmTtVt_2"), getVref(name + "SchGtKttmmTtVt_2"))
    print("SchGtKttmmTtVt_3 ppm and mean: ", calcPpm(name + "SchGtKttmmTtVt_3"), getVref(name + "SchGtKttmmTtVt_3"))
    print("SchGtKttmmTtVt_4 ppm and mean: ", calcPpm(name + "SchGtKttmmTtVt_4"), getVref(name + "SchGtKttmmTtVt_4"))
    print("SchGtKttmmTtVt_5 ppm and mean: ", calcPpm(name + "SchGtKttmmTtVt_5"), getVref(name + "SchGtKttmmTtVt_5"))  
    print("SchGtKttmmTtVt_6 ppm and mean: ", calcPpm(name + "SchGtKttmmTtVt_6"), getVref(name + "SchGtKttmmTtVt_6"))
    print("SchGtKttmmTtVt_7 ppm and mean: ", calcPpm(name + "SchGtKttmmTtVt_7"), getVref(name + "SchGtKttmmTtVt_7"))
    print("SchGtKttmmTtVt_8 ppm and mean: ", calcPpm(name + "SchGtKttmmTtVt_8"), getVref(name + "SchGtKttmmTtVt_8"))
    print("SchGtKttmmTtVt_9 ppm and mean: ", calcPpm(name + "SchGtKttmmTtVt_9"), getVref(name + "SchGtKttmmTtVt_9"))
    print("SchGtKttmmTtVt_10 ppm and mean: ", calcPpm(name + "SchGtKttmmTtVt_10"), getVref(name + "SchGtKttmmTtVt_10"))
    print("SchGtKttmmTtVt_11 ppm and mean: ", calcPpm(name + "SchGtKttmmTtVt_11"), getVref(name + "SchGtKttmmTtVt_11"))
    print("SchGtKttmmTtVt_12 ppm and mean: ", calcPpm(name + "SchGtKttmmTtVt_12"), getVref(name + "SchGtKttmmTtVt_12"))
    print("SchGtKttmmTtVt_13 ppm and mean: ", calcPpm(name + "SchGtKttmmTtVt_13"), getVref(name + "SchGtKttmmTtVt_13"))
    print("SchGtKttmmTtVt_14 ppm and mean: ", calcPpm(name + "SchGtKttmmTtVt_14"), getVref(name + "SchGtKttmmTtVt_14"))
    print("SchGtKttmmTtVt_15 ppm and mean: ", calcPpm(name + "SchGtKttmmTtVt_15"), getVref(name + "SchGtKttmmTtVt_15"))
    print("SchGtKttmmTtVt_16 ppm and mean: ", calcPpm(name + "SchGtKttmmTtVt_16"), getVref(name + "SchGtKttmmTtVt_16"))
    print("SchGtKttmmTtVt_17 ppm and mean: ", calcPpm(name + "SchGtKttmmTtVt_17"), getVref(name + "SchGtKttmmTtVt_17"))
    print("SchGtKttmmTtVt_18 ppm and mean: ", calcPpm(name + "SchGtKttmmTtVt_18"), getVref(name + "SchGtKttmmTtVt_18"))
    print("SchGtKttmmTtVt_19 ppm and mean: ", calcPpm(name + "SchGtKttmmTtVt_19"), getVref(name + "SchGtKttmmTtVt_19"))
    print("SchGtKttmmTtVt_20 ppm and mean: ", calcPpm(name + "SchGtKttmmTtVt_20"), getVref(name + "SchGtKttmmTtVt_20"))
    print("SchGtKttmmTtVt_21 ppm and mean: ", calcPpm(name + "SchGtKttmmTtVt_21"), getVref(name + "SchGtKttmmTtVt_21"))
    print("SchGtKttmmTtVt_22 ppm and mean: ", calcPpm(name + "SchGtKttmmTtVt_22"), getVref(name + "SchGtKttmmTtVt_22"))
    print("SchGtKttmmTtVt_23 ppm and mean: ", calcPpm(name + "SchGtKttmmTtVt_23"), getVref(name + "SchGtKttmmTtVt_23"))
    print("SchGtKttmmTtVt_24 ppm and mean: ", calcPpm(name + "SchGtKttmmTtVt_24"), getVref(name + "SchGtKttmmTtVt_24"))
    print("SchGtKttmmTtVt_25 ppm and mean: ", calcPpm(name + "SchGtKttmmTtVt_25"), getVref(name + "SchGtKttmmTtVt_25"))
    print("SchGtKttmmTtVt_26 ppm and mean: ", calcPpm(name + "SchGtKttmmTtVt_26"), getVref(name + "SchGtKttmmTtVt_26"))
    print("SchGtKttmmTtVt_27 ppm and mean: ", calcPpm(name + "SchGtKttmmTtVt_27"), getVref(name + "SchGtKttmmTtVt_27"))
    print("SchGtKttmmTtVt_28 ppm and mean: ", calcPpm(name + "SchGtKttmmTtVt_28"), getVref(name + "SchGtKttmmTtVt_28"))
    print("SchGtKttmmTtVt_29 ppm and mean: ", calcPpm(name + "SchGtKttmmTtVt_29"), getVref(name + "SchGtKttmmTtVt_29"))
  return


main("output_tran/tran_")