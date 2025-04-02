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
x1=2.9927658e-05
x2=3.5127657e-05
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
N 220 -510 250 -510 {
lab=setupBias}
N 220 -490 250 -490 {
lab=vdd}
N 220 -230 250 -230 {
lab=PII2}
N 220 -250 250 -250 {
lab=dummy}
N 220 -270 250 -270 {
lab=PII1}
N 220 -290 250 -290 {
lab=PI2}
N 220 -310 250 -310 {
lab=PI1}
N 220 -330 250 -330 {
lab=PD}
N 220 -350 250 -350 {
lab=PC}
N 220 -370 250 -370 {
lab=PB}
N 220 -390 250 -390 {
lab=PA}
N 220 -410 250 -410 {
lab=snk}
N 220 -450 250 -450 {
lab=preChrg}
N 220 -430 250 -430 {
lab=src_n}
N 220 -470 250 -470 {
lab=vss}
N 550 -510 580 -510 {
lab=vref}
N 550 -490 580 -490 {
lab=cmp}
N 220 -210 250 -210 {
lab=sample}
N 220 -190 250 -190 {
lab=cmp_p1}
N 220 -170 250 -170 {
lab=cmp_p2}
C {devices/launcher.sym} 520 -100 0 0 {name=h5
descr="load waves" 
tclcommand="xschem raw_read $netlist_dir/../../sim/TB_bandgap/output_tran/tran_SchGtKssTtVl_-40.raw tran"
}
C {JNW_AVV_SKY130A/TB_bandgap.sym} 400 -370 0 0 {name=xdut}
C {devices/lab_wire.sym} 220 -510 0 0 {name=p8 sig_type=std_logic lab=setupBias}
C {devices/lab_wire.sym} 220 -470 0 0 {name=p1 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 220 -450 0 0 {name=p2 sig_type=std_logic lab=preChrg}
C {devices/lab_wire.sym} 220 -430 0 0 {name=p3 sig_type=std_logic lab=src_n}
C {devices/lab_wire.sym} 220 -410 0 0 {name=p4 sig_type=std_logic lab=snk}
C {devices/lab_wire.sym} 220 -390 0 0 {name=p5 sig_type=std_logic lab=PA}
C {devices/lab_wire.sym} 220 -370 0 0 {name=p6 sig_type=std_logic lab=PB}
C {devices/lab_wire.sym} 220 -350 0 0 {name=p7 sig_type=std_logic lab=PC}
C {devices/lab_wire.sym} 220 -310 0 0 {name=p9 sig_type=std_logic lab=PI1}
C {devices/lab_wire.sym} 220 -330 0 0 {name=p10 sig_type=std_logic lab=PD}
C {devices/lab_wire.sym} 220 -290 0 0 {name=p11 sig_type=std_logic lab=PI2}
C {devices/lab_wire.sym} 220 -270 0 0 {name=p12 sig_type=std_logic lab=PII1}
C {devices/lab_wire.sym} 220 -250 0 0 {name=p13 sig_type=std_logic lab=dummy}
C {devices/lab_wire.sym} 220 -230 0 0 {name=p14 sig_type=std_logic lab=PII2}
C {devices/lab_wire.sym} 220 -490 0 0 {name=p15 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 580 -510 0 1 {name=p16 sig_type=std_logic lab=vref}
C {devices/lab_wire.sym} 580 -490 0 1 {name=p17 sig_type=std_logic lab=cmp}
C {devices/lab_wire.sym} 220 -210 0 0 {name=p18 sig_type=std_logic lab=sample}
C {devices/lab_wire.sym} 220 -190 0 0 {name=p19 sig_type=std_logic lab=cmp_p1}
C {devices/lab_wire.sym} 220 -170 0 0 {name=p20 sig_type=std_logic lab=cmp_p2}
