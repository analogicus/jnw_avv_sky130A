v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
B 2 690 -610 1490 -210 {flags=graph
y1=-0.30833332
y2=1.6916666
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=9.0689977e-06
x2=1.4268999e-05
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
N 230 -600 260 -600 {
lab=setupBias}
N 230 -580 260 -580 {
lab=cmp_p1}
N 230 -320 260 -320 {
lab=PII1}
N 230 -340 260 -340 {
lab=PI2}
N 230 -360 260 -360 {
lab=PI1}
N 230 -380 260 -380 {
lab=PD}
N 230 -400 260 -400 {
lab=PC}
N 230 -420 260 -420 {
lab=PB}
N 230 -440 260 -440 {
lab=PA}
N 230 -460 260 -460 {
lab=snk}
N 230 -480 260 -480 {
lab=src_n}
N 230 -500 260 -500 {
lab=preChrg}
N 230 -540 260 -540 {
lab=vdd}
N 230 -520 260 -520 {
lab=vss}
N 230 -560 260 -560 {
lab=cmp_p2}
N 560 -600 590 -600 {
lab=vref}
N 560 -580 590 -580 {
lab=cmp}
N 230 -300 260 -300 {
lab=dummy}
N 230 -280 260 -280 {
lab=PII2}
C {devices/launcher.sym} 770 -110 0 0 {name=h5
descr="load waves" 
tclcommand="xschem raw_read $netlist_dir/../../sim/TB_Vref/output_tran/tran_SchGtKttTtVt_-40.raw tran"
}
C {devices/lab_wire.sym} 230 -600 0 0 {name=p8 sig_type=std_logic lab=setupBias}
C {devices/lab_wire.sym} 230 -520 0 0 {name=p1 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 230 -500 0 0 {name=p2 sig_type=std_logic lab=preChrg}
C {devices/lab_wire.sym} 230 -480 0 0 {name=p3 sig_type=std_logic lab=src_n}
C {devices/lab_wire.sym} 230 -460 0 0 {name=p4 sig_type=std_logic lab=snk}
C {devices/lab_wire.sym} 230 -440 0 0 {name=p5 sig_type=std_logic lab=PA}
C {devices/lab_wire.sym} 230 -420 0 0 {name=p6 sig_type=std_logic lab=PB}
C {devices/lab_wire.sym} 230 -400 0 0 {name=p7 sig_type=std_logic lab=PC}
C {devices/lab_wire.sym} 230 -360 0 0 {name=p9 sig_type=std_logic lab=PI1}
C {devices/lab_wire.sym} 230 -380 0 0 {name=p10 sig_type=std_logic lab=PD}
C {devices/lab_wire.sym} 230 -340 0 0 {name=p11 sig_type=std_logic lab=PI2}
C {devices/lab_wire.sym} 230 -320 0 0 {name=p12 sig_type=std_logic lab=PII1}
C {devices/lab_wire.sym} 230 -300 0 0 {name=p13 sig_type=std_logic lab=dummy}
C {devices/lab_wire.sym} 230 -280 0 0 {name=p14 sig_type=std_logic lab=PII2}
C {devices/lab_wire.sym} 230 -540 0 0 {name=p15 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 590 -600 0 1 {name=p16 sig_type=std_logic lab=vref}
C {devices/lab_wire.sym} 590 -580 0 1 {name=p17 sig_type=std_logic lab=cmp}
C {devices/lab_wire.sym} 230 -580 0 0 {name=p19 sig_type=std_logic lab=cmp_p1}
C {devices/lab_wire.sym} 230 -560 0 0 {name=p20 sig_type=std_logic lab=cmp_p2}
C {JNW_AVV_SKY130A/TB_Vref.sym} 410 -440 0 0 {name=x1}
