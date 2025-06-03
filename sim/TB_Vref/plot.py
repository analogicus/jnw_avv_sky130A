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
import glob
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


def plotVrefTempDependence(path, plot_title=None, show_legend=True, fname=None, mode=None, legend_lut=None):
    """
    Plot temperature dependence of Vref from yaml file or all yaml files in a directory.

    Parameters:
        path: filename (.yaml) or folder path containing yaml files.
        plot_title: (optional) custom string for plot title.
        show_legend: (optional) boolean to enable/disable legend. (ignored in mode="ETC" or mode="MC")
        fname: if not None, saves plot as PGF to plots/fname
        mode: None (default legacy), "ETC" (Extreme Test Cases, legend made from lookup), "MC" (Monte Carlo, no legend)
        legend_lut: dict mapping base filename to legend string for ETC mode
    """
    if fname is not None:
        import matplotlib
        matplotlib.use("pgf")
        matplotlib.rcParams.update({
            "pgf.texsystem": "pdflatex",
            "font.family": "serif",
            "text.usetex": True,
            "pgf.rcfonts": False,
        })

    def process_yaml(yamlfile):
        if not yamlfile.endswith(".yaml"):
            if os.path.exists(yamlfile + ".yaml"):
                yamlfile = yamlfile + ".yaml"
        if not os.path.isfile(yamlfile):
            print(f"File not found: {yamlfile}")
            return None, None
        with open(yamlfile) as fi:
            obj = yaml.safe_load(fi)
        vref = []
        temp = []
        for key in obj:
            if key.startswith("vref_"):
                try:
                    t = int(key.split("_")[1])
                    temp.append(t)
                    vref.append(obj[key])
                except Exception as e:
                    print(f"Warning: Could not parse temperature in key '{key}': {e}")
        if not vref or not temp:
            print(f"No vref entries found in {yamlfile}!")
            return None, None
        temp = np.array(temp)
        vref = np.array(vref)
        sorted_inds = np.argsort(temp)
        sorted_temp = temp[sorted_inds]
        sorted_vref = vref[sorted_inds]
        centered_vref = (sorted_vref - np.mean(sorted_vref)) * 1000
        return sorted_temp, centered_vref

    files_to_plot = []
    if os.path.isdir(path):
        files_to_plot = sorted(glob.glob(os.path.join(path, "*.yaml")))
        if not files_to_plot:
            print("No .yaml files found in folder!")
            return
    elif os.path.isfile(path) or os.path.isfile(path + ".yaml"):
        if path.endswith(".yaml"):
            files_to_plot = [path]
        else:
            files_to_plot = [path + ".yaml"]
    else:
        print(f"Path not found: {path}")
        return

    # --- MC MODE: special plot style ---
    if mode == "MC":
        all_temp_vrefs = []
        all_ppms = []
        all_temp_raw = []
        temp_set = set()
        for yamlfile in files_to_plot:
            tvals, vcentered = process_yaml(yamlfile)
            if tvals is not None and vcentered is not None:
                all_temp_vrefs.append((tvals, vcentered))
            # for violin: raw vref
            with open(yamlfile) as fi:
                obj = yaml.safe_load(fi)
            vref = []
            temp = []
            for key in obj:
                if key.startswith("vref_"):
                    try:
                        t = int(key.split("_")[1])
                        temp.append(t)
                        vref.append(obj[key])
                        temp_set.add(t)
                    except Exception:
                        continue
            if vref and temp:
                temp = np.array(temp)
                vref = np.array(vref)
                sorted_inds = np.argsort(temp)
                sorted_temp = temp[sorted_inds]
                sorted_vref = vref[sorted_inds]
                all_temp_raw.append(dict(zip(sorted_temp, sorted_vref*1000)))  # to mV
            base = yamlfile[:-5] if yamlfile.endswith('.yaml') else yamlfile
            all_ppms.append(calcPpm(base))
        temp_x = sorted(temp_set)

        centered_temp_to_vals = {t: [] for t in temp_x}
        for yamlfile in files_to_plot:
            # Get ALL sorted temps and vrefs
            with open(yamlfile) as fi:
                obj = yaml.safe_load(fi)
            vref = []
            temp = []
            for key in obj:
                if key.startswith("vref_"):
                    try:
                        t = int(key.split("_")[1])
                        temp.append(t)
                        vref.append(obj[key])
                    except Exception:
                        continue
            if not temp or not vref:
                continue
            temp = np.array(temp)
            vref = np.array(vref)
            sorted_inds = np.argsort(temp)
            sorted_temp = temp[sorted_inds]
            sorted_vref = vref[sorted_inds]
            mean_vref = np.mean(sorted_vref)
            # Distribute (centered) values into bins for each temperature
            for t, v in zip(sorted_temp, sorted_vref):
                centered_temp_to_vals[t].append((v - mean_vref) * 1000) # to mV

        data_for_violin = [centered_temp_to_vals[t] for t in temp_x]
        std_devs = [np.std(arr) if len(arr) > 1 else 0 for arr in data_for_violin]
        mean_ppm = round(np.mean(all_ppms), 2) if all_ppms else 0


        # --- MC overlay + mean/stdev plot, violin below ---
        height_ratio = [1.2, 1]  # Overlay plot a little taller
        figwidth = 6
        figheight = figwidth * (sum(height_ratio)/2.5)  # 2.5 is an aesthetic fudge factor
        fig, (ax1, ax2) = plt.subplots(2, 1, sharex=True, figsize=(figwidth, figheight), gridspec_kw={'height_ratios': height_ratio})

        # 1. Proper MC overlay: mean & std on top of faint overlay
        arrs = []
        for tvals, vcentered in all_temp_vrefs:
            arrs.append((tvals, vcentered))
            ax1.plot(tvals, vcentered, color="C0", alpha=1, lw=0.8, zorder=1)
        # For mean/std, we need each sample interpolated to common temp_x:
        all_samples_interp = np.full((len(files_to_plot), len(temp_x)), np.nan)
        for i, (t, v) in enumerate(zip([a[0] for a in arrs], [a[1] for a in arrs])):
            tidx = {tt: k for k, tt in enumerate(t)}
            for j, tx in enumerate(temp_x):
                if tx in tidx: all_samples_interp[i, j] = v[tidx[tx]]
        mean_curve = np.nanmean(all_samples_interp, axis=0)
        std_curve = np.nanstd(all_samples_interp, axis=0)
        ax1.plot(temp_x, mean_curve, marker='o', color="C1", lw=2, label=r"$V_{ref}$ mean", zorder=3)
        ax1.fill_between(temp_x, mean_curve-std_curve, mean_curve+std_curve, 
                         color="C1", alpha=0.3, lw=0, zorder=2, label=r"$V_{ref}$ $\pm 1\sigma$")
        ax1.set_ylabel("Voltage [mV]")
        if plot_title is not None:
            ax1.set_title(plot_title, pad=10)
        ax1.grid()
        ax1.legend(loc='center', frameon=True, bbox_to_anchor=(0.5, 0.25))
        ax1.set_xticks(temp_x)
        

        # 2. Violin plot (style as requested)
        parts = ax2.violinplot(data_for_violin, positions=temp_x, showmedians=True, widths=4)
        for pc in parts['bodies']:
            pc.set_facecolor('C0')
            pc.set_alpha(0.4)
            pc.set_edgecolor("black")
            pc.set_linewidth(1)
        if 'cmedians' in parts:
            parts['cmedians'].set_color("black")

        # axis/label layout
        flat = [y for arr in data_for_violin for y in arr]
        ymin = min(flat) if flat else 0
        ymax = max(flat) if flat else 1
        spread = ymax - ymin
        lower_lim = ymin - 0.1*spread
        upper_lim = ymax + 0.1*spread

        for xi, std in zip(temp_x, std_devs):
            topy = upper_lim - 0.05*spread
            ax2.annotate(f'$\sigma$={std:.2f}', xy=(xi, topy), ha='center', va='bottom',
                         fontsize=9,
                         bbox=dict(boxstyle="round,pad=0.22", fc="white", ec="black", lw=0.7, alpha=1))
        ax2.annotate(
            f"Mean TC = {mean_ppm} ppm/$^\circ$C\nN = " + str(len(files_to_plot)), xy=(0.5, 0.3), xycoords='axes fraction',
            ha="center", va="top", fontsize=10,
            bbox=dict(facecolor='white', edgecolor='black', boxstyle='round,pad=0.5', lw=1.0)
        )
        ax2.set_xlabel("Temperature [C]")
        ax2.set_ylabel("Voltage [mV]")
        ax2.set_xticks(temp_x)
        ax2.set_xlim(temp_x[0]-10, temp_x[-1]+10)
        ax2.set_ylim(lower_lim, upper_lim)
        ax2.grid(True, alpha=0.6)

        plt.tight_layout()
        if fname is not None:
            plt.savefig("plots/" + fname)
        else:
            plt.show()
        return

    # --- ETC, default, or single-file mode ---
    figwidth = 6
    figheight = figwidth * .5
    fig, ax = plt.subplots(figsize=(figwidth, figheight))
    any_plotted = False
    for yamlfile in files_to_plot:
        temp, centered_vref = process_yaml(yamlfile)
        if temp is None or centered_vref is None:
            continue
        label = None
        if mode == "ETC":
            base = os.path.basename(yamlfile)
            base = base[:-5] if base.endswith(".yaml") else base
            label = legend_lut.get(base, base)
        elif mode == "MC":
            label = None   # MC: no legend
        else:
            label = os.path.basename(yamlfile) if len(files_to_plot) > 1 else r'$V_{ref}$'
        ax.plot(temp, centered_vref, marker='o', label=label, zorder=1)
        ax.set_xticks(temp)
        any_plotted = True

    if not any_plotted:
        print("No data was plotted.")
        return

    ax.set_xlabel("Temperature [C]")
    ax.set_ylabel("Voltage [mV]")
    if plot_title:
        ax.set_title(plot_title)
    ax.grid()

    if mode == "ETC":
        handles, labels = ax.get_legend_handles_labels()
        ncol = len(handles)
        if ncol > 0:
            ax.legend(
                loc='center',
                bbox_to_anchor=(0.5, 0.25),
                ncol=3,
                frameon=True
            )
    elif mode == "MC":
        pass
    elif show_legend and (len(files_to_plot) > 1 or plot_title):
        ax.legend(loc='upper left')

    annotate_ppm = False
    if mode is None and (os.path.isfile(path) or os.path.isfile(path + ".yaml")):
        annotate_ppm = True
    if annotate_ppm:
        ax.annotate(
            r'TC = ' + str(calcPpm(path)) + r' ppm/$^\circ$C',
            xy=(0.5, 0.05), xycoords='axes fraction',
            ha='center', va='bottom',
            bbox=dict(facecolor='white', edgecolor='black', boxstyle='round,pad=0.5')
        )

    plt.tight_layout()
    if fname is not None:
        plt.savefig("plots/" + fname)
    else:
        plt.show()



def plotVrefDistribution(groups, Temp=None, names=None, bins=10, KDE=None, fname=None, title=None):
    import pandas as pd
    import numpy as np
    import matplotlib.pyplot as plt

    if fname is not None:
        import matplotlib
        matplotlib.use("pgf")
        matplotlib.rcParams.update({
            "pgf.texsystem": "pdflatex",
            "font.family": "serif",
            # "font.serif": ["Computer Modern"],
            "text.usetex": True,
            "pgf.rcfonts": False,
        })

    if names is None:
        names = [f"Group {i+1}" for i in range(len(groups))]
    else:
        assert len(names) == len(groups), "Length of names must match number of groups."

    colors = plt.rcParams['axes.prop_cycle'].by_key()['color']
    fig, ax = plt.subplots(sharey=True, tight_layout=True, figsize=(6,3.5))
    ax2 = ax.twinx()  # for density

    per_group_vrefs = []    # Will be a list of np.arrays, one per group

    for gidx, group in enumerate(groups):
        folders = group if isinstance(group, (list, tuple)) else [group]
        group_vrefs = []
        for folder in folders:
            for file in os.scandir(folder):
                if file.name.endswith(".yaml"):
                    mean_vref = getVref(os.path.join(folder, file.name[:-5]), temp=Temp)
                    group_vrefs.append(mean_vref)
        group_vrefs = np.array(group_vrefs)
        per_group_vrefs.append(group_vrefs)

    # Axis x-limits over all data for consistent overlaying
    valid_vrefs = np.concatenate(per_group_vrefs) if per_group_vrefs else np.array([0])
    xmin = np.min(valid_vrefs) if len(valid_vrefs) > 0 else 0
    xmax = np.max(valid_vrefs) if len(valid_vrefs) > 0 else 1
    xrange_pad = (xmax-xmin)*0.04 + 4
    xlim = (xmin-xrange_pad, xmax+xrange_pad)

    # Now plot and annotate per group
    for gidx, group_vrefs in enumerate(per_group_vrefs):
        n_points = len(group_vrefs)
        if n_points == 0:
            continue
        group_mean = round(np.mean(group_vrefs), 1)
        group_std  = round(np.std(group_vrefs), 2)
        color = colors[gidx % len(colors)]
        # Filled histogram
        ax.hist(
            group_vrefs, bins=bins, density=False, alpha=0.35,
            edgecolor=None, color=color, linewidth=2
        )
        # Outline
        ax.hist(
            group_vrefs, bins=bins, density=False, histtype='step', label=names[gidx],
            fill=False, edgecolor=color, linewidth=2, alpha=1
        )
        # KDE (density, on right y-axis)
        if KDE:
            pd.Series(group_vrefs).plot(
                kind="kde", ax=ax2, color=color, linewidth=1, label="_nolegend_")
        # Annotation for this group
        textstr = (f'$\overline{{V_{{ref}}}}$={group_mean} mV'
                   f'\n$\sigma$={group_std} mV'
                   f"\nN={n_points}")
        ax.annotate(
            textstr, xy=(0.98, 0.96-0.28*gidx),
            xycoords='axes fraction', ha="right", va='top',
            bbox=dict(facecolor='white', alpha=1, edgecolor=color, boxstyle='round,pad=0.6', linewidth=2)
        )

    ax.set_xlabel("Voltage [mV]")
    ax.set_ylabel("Frequency")
    ax.set_xlim(*xlim)
    ax.legend(loc='upper left')
    ax.yaxis.grid(True, linestyle='--', alpha=0.7)
    if title is not None:
        ax.set_title(title)

    from matplotlib.ticker import MaxNLocator
    ax.yaxis.set_major_locator(MaxNLocator(integer=True))
    ax2.set_yticks([])       # Hides number labels
    ax2.set_ylabel("")       # Removes axis text (label)
    ax2.spines['right'].set_visible(False)
    ax2.set_ylim(bottom=0, top=ax.get_ylim()[1]*0.01)
    ax2.set_yticks([])
    plt.tight_layout()
    if fname is not None:
        plt.savefig("plots/" + fname)
    else:
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


    # Setup ETC mode: legend_lut must be given or defined


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


################ Finished plots #############

def plotTypicalVrefTempDependence():
    plotVrefTempDependence(
        "sim_results/finalSims/ETC_finalVref/tran_SchGtKttTtVt",
        plot_title=r'$V_{ref}$ temperature dependence in the typical corner',
        show_legend=True,
        fname="typicalVrefTempDepende.pgf",
        )


def plotETCtempDependence():
    plotVrefTempDependence(
        "sim_results/finalSims/ETC_finalVref",
        # "sim_results/ETC_tempSweep_0601",
        plot_title=r'$V_{ref}$ temperature dependence in the PVT corners',
        show_legend=True,
        legend_lut=legend_lut,
        mode="ETC",
        fname="ETCtempDependence.pgf",
        )


def plotMCtempDependence():
    plotVrefTempDependence(
        "sim_results/MC_tempSweep_0601",
        # "sim_results/finalSims/MC_finalVref",
        plot_title=r'$V_{ref}$ temperature dependence with mismatch',
        show_legend=True,
        mode="MC",
        fname="MCtempDependence.pgf",
        )


def plotMCtempDependenceSmallPMOS():
    plotVrefTempDependence(
        # "sim_results/MC_tempSweep_0601",
        "sim_results/finalSims/MC_finalVref",
        plot_title=r'$V_{ref}$ temperature dependence with mismatch',
        show_legend=True,
        mode="MC",
        fname="MCtempDependenceSmallPMOS.pgf",
        )


def plotFinalVrefDistribution():
    plotVrefDistribution(
        # [["sim_results/finalSims/MC_finalVref"]],
        [["sim_results/MC_tempSweep_0601"]],
        Temp="20",
        names=[r'$V_{ref}$'],
        fname="finalVrefDistribution.pgf",
        title=r'Distrobution of $V_{ref}$ at 20$^\circ$C',
        KDE=True,
    )


def plotVrefVSnoChopping():
    plotVrefDistribution(
        # [["sim_results/finalSims/MC_finalVref"],["sim_results/finalSims/MC_finalNoChopp_20deg"]],
        [["sim_results/MC_tempSweep_0601"],["sim_results/finalSims/MC_finalNoChopp_20deg"]],
        Temp="20",
        names=[r'With chopping',r'Without chopping'],
        fname="vrefVSnoChopping.pgf",
        title=r'Distrobution of $V_{ref}$ with and without chopping at 20$^\circ$C',
    )


def plotVrefVSidealCMP():
    plotVrefDistribution(
        # [["sim_results/finalSims/MC_finalVref"],["sim_results/finalSims/MC_finalVref_IdealOTA"]],
        [["sim_results/MC_tempSweep_0601"],["sim_results/finalSims/MC_finalVref_IdealOTA"]],
        Temp="20",
        names=['Implemented','Ideal comparator'],
        fname="vrefVsidealCMP.pgf",
        title=r'Distribution of $V_{ref}$ with ideal comparator vs implemented design at 20$^\circ$C',
    )


def plotVrefVSsmallRes():
    plotVrefDistribution(
        # [["sim_results/finalSims/MC_finalVref"],["sim_results/finalSims/MC_finalVref_smallerR"]],
        [["sim_results/MC_tempSweep_0601"],["sim_results/finalSims/MC_finalVref_smallerR"]],
        Temp="20",
        names=[r'Implemented',r'Smaller resistor area'],
        fname="vrefVSsmallRes.pgf",
        title=r'Distrobution $V_{ref}$ with different resistor area at 20$^\circ$C',
    )





##############################################


# plotMCtempDependenceSmallPMOS()
# plotTypicalVrefTempDependence()
# plotETCtempDependence()
# plotMCtempDependence()
# plotFinalVrefDistribution()
# plotVrefVSnoChopping()
# plotVrefVSidealCMP()
# plotVrefVSsmallRes()

# plotVrefDistribution(
#     [["sim_results/MC_tempSweep_0430"],["sim_results/MC_tempSweep_0427"]], 
#     Temp="20",
#     names=["Temp sweep 1", "Temp sweep 2"]
#     )

# name = "sim_results/finalSims/ETC_finalVref/tran_"
# print("SchGtKffTtVl ppm and mean: ", calcPpm(name + "SchGtKffTtVl"), getVref(name + "SchGtKffTtVl"))
# print("SchGtKffTtVh ppm and mean: ", calcPpm(name + "SchGtKffTtVh"), getVref(name + "SchGtKffTtVh"))  
# print("SchGtKssTtVl ppm and mean: ", calcPpm(name + "SchGtKssTtVl"), getVref(name + "SchGtKssTtVl"))  
# print("SchGtKssTtVh ppm and mean: ", calcPpm(name + "SchGtKssTtVh"), getVref(name + "SchGtKssTtVh"))  
# print("SchGtKfsTtVl ppm and mean: ", calcPpm(name + "SchGtKfsTtVl"), getVref(name + "SchGtKfsTtVl"))  
# print("SchGtKfsTtVh ppm and mean: ", calcPpm(name + "SchGtKfsTtVh"), getVref(name + "SchGtKfsTtVh"))  
# print("SchGtKsfTtVl ppm and mean: ", calcPpm(name + "SchGtKsfTtVl"), getVref(name + "SchGtKsfTtVl"))  
# print("SchGtKsfTtVh ppm and mean: ", calcPpm(name + "SchGtKsfTtVh"), getVref(name + "SchGtKsfTtVh"))
# print("SchGtKttTtVt ppm and mean: ", calcPpm(name + "SchGtKttTtVt"), getVref(name + "SchGtKttTtVt"))


name = "output_tran/tran_"
# print(calcPpm("output_tran/tran_SchGtKttTtVt"))
# print("SchGtKttmmTtVt ppm and mean: ", calcPpm(name + "SchGtKttmmTtVt"), getVref(name + "SchGtKttmmTtVt"))
# print("SchGtKttmmTtVt_1 ppm and mean: ", calcPpm(name + "SchGtKttmmTtVt_1"), getVref(name + "SchGtKttmmTtVt_1"))


# plotVrefDistribution(
#     [["sim_results/MC_vref_0527"]],
#     Temp="40",
# )


# print(calcPpm("sim_results/ETC_tempSweep_0531/tran_SchGtKttTtVt"))
# # print(calcPpm("sim_results/ETC_tempSweep_0531/tran_SchGtKssTtVl"))
# print(calcPpm("sim_results/ETC_tempSweep_0531/tran_SchGtKssTtVh"))
# print(calcPpm("sim_results/ETC_tempSweep_0531/tran_SchGtKffTtVl"))
# print(calcPpm("sim_results/ETC_tempSweep_0531/tran_SchGtKffTtVh"))
# print(calcPpm("sim_results/ETC_tempSweep_0531/tran_SchGtKfsTtVl"))
# print(calcPpm("sim_results/ETC_tempSweep_0531/tran_SchGtKfsTtVh"))
# print(calcPpm("sim_results/ETC_tempSweep_0531/tran_SchGtKsfTtVl"))
# print(calcPpm("sim_results/ETC_tempSweep_0531/tran_SchGtKsfTtVh"))