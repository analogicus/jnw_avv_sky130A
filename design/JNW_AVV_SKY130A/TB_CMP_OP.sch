v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
B 2 600 -620 1400 -220 {flags=graph
y1=-0.23888888
y2=1.761111
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=4e-06
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node="vip

vin

cmp"
color="4 6 8"
dataset=-1
unitx=1
logx=0
logy=0
rainbow=0
rawfile=/pri/alve/aicex/ip/jnw_avv_sky130A/sim/TB_bandgap/output_tran/tran_SchGtKttTtVt.raw
autoload=0}
C {devices/launcher.sym} 460 -100 0 0 {name=h5
descr="load waves" 
tclcommand="xschem raw_read $netlist_dir/../../sim/TB_CMP/output_tran/tran_SchGtKttTtVt.raw tran"
}
C {devices/lab_wire.sym} 160 -480 0 0 {name=p1 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 160 -420 0 0 {name=p2 sig_type=std_logic lab=cmp_p2}
C {devices/lab_wire.sym} 160 -460 0 0 {name=p3 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 160 -440 0 0 {name=p4 sig_type=std_logic lab=cmp_p1}
C {devices/lab_wire.sym} 160 -400 0 0 {name=p5 sig_type=std_logic lab=vip}
C {devices/lab_wire.sym} 160 -380 0 0 {name=p6 sig_type=std_logic lab=vin}
C {devices/lab_wire.sym} 460 -480 0 1 {name=p7 sig_type=std_logic lab=cmp}
C {JNW_AVV_SKY130A/TB_CMP.sym} 310 -430 0 0 {name=x1}
C {devices/lab_wire.sym} 160 -360 0 0 {name=p8 sig_type=std_logic lab=sample}
C {devices/lab_wire.sym} 160 -340 0 0 {name=p9 sig_type=std_logic lab=clk}
C {devices/lab_wire.sym} 160 -320 0 0 {name=p10 sig_type=std_logic lab=zero}
