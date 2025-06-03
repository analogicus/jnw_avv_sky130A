v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 320 -590 320 -310 {lab=vss}
N 320 -270 320 -90 {lab=vss}
N 620 -610 660 -610 {lab=cmp}
N 620 -630 660 -630 {lab=vref}
C {JNW_AVV_SKY130A/TB_bandgap.sym} 470 -490 0 0 {name=x1}
C {devices/lab_wire.sym} 320 -590 0 0 {name=p1 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 320 -610 0 0 {name=p15 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 320 -290 0 0 {name=p16 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 320 -270 0 0 {name=p17 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 320 -630 0 0 {name=p31 sig_type=std_logic lab=vss}
C {devices/ipin.sym} 190 -600 0 0 {name=p4 lab=vss}
C {devices/ipin.sym} 190 -620 0 0 {name=p5 lab=vdd}
C {devices/opin.sym} 660 -610 0 0 {name=p2 lab=cmp}
C {devices/opin.sym} 660 -630 0 0 {name=p3 lab=vref}
