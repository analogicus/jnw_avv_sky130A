v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
B 2 670 -610 1470 -210 {flags=graph
y1=-0.30833332
y2=1.6916666
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=3.615773e-05
x2=4.1357731e-05
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node="vref
xdut"
color="4 12"
dataset=-1
unitx=1
logx=0
logy=0
rainbow=0
rawfile=/pri/alve/aicex/ip/jnw_avv_sky130A/sim/TB_bandgap/output_tran/tran_SchGtKttTtVt.raw
autoload=0}
N 210 -600 240 -600 {
lab=setupBias}
N 210 -580 240 -580 {
lab=vdd}
N 210 -320 240 -320 {
lab=PII2}
N 210 -340 240 -340 {
lab=dummy}
N 210 -360 240 -360 {
lab=PII1}
N 210 -380 240 -380 {
lab=PI2}
N 210 -400 240 -400 {
lab=PI1}
N 210 -420 240 -420 {
lab=PD}
N 210 -440 240 -440 {
lab=PC}
N 210 -460 240 -460 {
lab=PB}
N 210 -480 240 -480 {
lab=PA}
N 210 -500 240 -500 {
lab=snk}
N 210 -540 240 -540 {
lab=preChrg}
N 210 -520 240 -520 {
lab=src_n}
N 210 -560 240 -560 {
lab=vss}
N 540 -600 570 -600 {
lab=vref}
N 540 -580 570 -580 {
lab=cmp}
N 210 -300 240 -300 {
lab=s_BG2CMP}
N 210 -280 240 -280 {
lab=cmp_p1}
N 210 -260 240 -260 {
lab=cmp_p2}
N 210 -200 240 -200 {
lab=s_Cap2CMP}
N 210 -220 240 -220 {
lab=s_PtatCtrl}
N 210 -240 240 -240 {
lab=s_BgCtrl}
N 210 -180 240 -180 {
lab=s_Ref2CMP}
N 210 -160 240 -160 {
lab=s_CapRst}
N 210 -140 240 -140 {
lab=s_PtatOut}
N 210 -120 240 -120 {
lab=s_Rdiscon}
C {devices/launcher.sym} 750 -110 0 0 {name=h5
descr="load waves" 
tclcommand="xschem raw_read $netlist_dir/../../sim/TB_bandgap/output_tran/tran_SchGtKttTtVt_-40.raw tran"
}
C {JNW_AVV_SKY130A/TB_bandgap.sym} 390 -460 0 0 {name=xdut}
C {devices/lab_wire.sym} 210 -600 0 0 {name=p8 sig_type=std_logic lab=setupBias}
C {devices/lab_wire.sym} 210 -560 0 0 {name=p1 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 210 -540 0 0 {name=p2 sig_type=std_logic lab=preChrg}
C {devices/lab_wire.sym} 210 -520 0 0 {name=p3 sig_type=std_logic lab=src_n}
C {devices/lab_wire.sym} 210 -500 0 0 {name=p4 sig_type=std_logic lab=snk}
C {devices/lab_wire.sym} 210 -480 0 0 {name=p5 sig_type=std_logic lab=PA}
C {devices/lab_wire.sym} 210 -460 0 0 {name=p6 sig_type=std_logic lab=PB}
C {devices/lab_wire.sym} 210 -440 0 0 {name=p7 sig_type=std_logic lab=PC}
C {devices/lab_wire.sym} 210 -400 0 0 {name=p9 sig_type=std_logic lab=PI1}
C {devices/lab_wire.sym} 210 -420 0 0 {name=p10 sig_type=std_logic lab=PD}
C {devices/lab_wire.sym} 210 -380 0 0 {name=p11 sig_type=std_logic lab=PI2}
C {devices/lab_wire.sym} 210 -360 0 0 {name=p12 sig_type=std_logic lab=PII1}
C {devices/lab_wire.sym} 210 -340 0 0 {name=p13 sig_type=std_logic lab=dummy}
C {devices/lab_wire.sym} 210 -320 0 0 {name=p14 sig_type=std_logic lab=PII2}
C {devices/lab_wire.sym} 210 -580 0 0 {name=p15 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 570 -600 0 1 {name=p16 sig_type=std_logic lab=vref}
C {devices/lab_wire.sym} 570 -580 0 1 {name=p17 sig_type=std_logic lab=cmp}
C {devices/lab_wire.sym} 210 -300 0 0 {name=p18 sig_type=std_logic lab=s_BG2CMP}
C {devices/lab_wire.sym} 210 -280 0 0 {name=p19 sig_type=std_logic lab=cmp_p1}
C {devices/lab_wire.sym} 210 -260 0 0 {name=p20 sig_type=std_logic lab=cmp_p2}
C {devices/lab_wire.sym} 210 -240 0 0 {name=p21 sig_type=std_logic lab=s_BgCtrl}
C {devices/lab_wire.sym} 210 -220 0 0 {name=p22 sig_type=std_logic lab=s_PtatCtrl}
C {devices/lab_wire.sym} 210 -200 0 0 {name=p23 sig_type=std_logic lab=s_Cap2CMP}
C {devices/lab_wire.sym} 210 -180 0 0 {name=p24 sig_type=std_logic lab=s_Ref2CMP}
C {devices/lab_wire.sym} 210 -160 0 0 {name=p25 sig_type=std_logic lab=s_CapRst}
C {devices/lab_wire.sym} 210 -140 0 0 {name=p26 sig_type=std_logic lab=s_PtatOut}
C {devices/lab_wire.sym} 210 -120 0 0 {name=p27 sig_type=std_logic lab=s_Rdiscon}
