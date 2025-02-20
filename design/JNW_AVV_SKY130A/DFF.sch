v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 830 -190 910 -190 {
lab=#net1}
N 830 -380 910 -380 {
lab=#net2}
N 1120 -300 1160 -260 {
lab=QN}
N 910 -260 1120 -260 {
lab=Q}
N 910 -260 910 -210 {
lab=Q}
N 910 -300 1120 -300 {
lab=QN}
N 910 -360 910 -300 {
lab=QN}
N 590 -390 590 -320 {
lab=D}
N 590 -240 590 -180 {
lab=#net3}
N 590 -390 740 -390 {
lab=D}
N 1230 -200 1260 -200 {
lab=QN}
N 1230 -370 1260 -370 {
lab=Q}
N 560 -390 590 -390 {
lab=D}
N 590 -180 740 -180 {
lab=#net3}
N 710 -370 740 -370 {
lab=clk}
N 710 -370 710 -200 {
lab=clk}
N 710 -200 740 -200 {
lab=clk}
N 1160 -260 1230 -260 {
lab=QN}
N 1230 -260 1230 -200 {
lab=QN}
N 1000 -200 1230 -200 {
lab=QN}
N 1120 -260 1160 -300 {
lab=Q}
N 1160 -300 1230 -300 {
lab=Q}
N 1230 -370 1230 -300 {
lab=Q}
N 1000 -370 1230 -370 {
lab=Q}
C {devices/ipin.sym} 460 -340 0 0 {name=p3 lab=vdd}
C {devices/ipin.sym} 460 -320 0 0 {name=p7 lab=vss}
C {devices/ipin.sym} 710 -280 0 0 {name=p17 lab=clk}
C {devices/opin.sym} 1260 -370 0 0 {name=p1 lab=Q}
C {devices/ipin.sym} 560 -390 0 0 {name=p2 lab=D}
C {JNW_TR_SKY130A/JNWTR_IVX1_CV.sym} 590 -320 1 0 {name=x1 }
C {JNW_TR_SKY130A/JNWTR_NDX1_CV.sym} 740 -370 0 0 {name=x2 }
C {JNW_TR_SKY130A/JNWTR_NDX1_CV.sym} 910 -360 0 0 {name=x3 }
C {JNW_TR_SKY130A/JNWTR_NDX1_CV.sym} 740 -180 0 0 {name=x4 }
C {JNW_TR_SKY130A/JNWTR_NDX1_CV.sym} 910 -190 0 0 {name=x5 }
C {devices/lab_wire.sym} 780 -420 0 0 {name=p10 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 950 -410 0 0 {name=p4 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 780 -230 0 0 {name=p5 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 950 -240 0 0 {name=p6 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 950 -160 0 0 {name=p8 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 780 -150 0 0 {name=p9 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 780 -340 0 0 {name=p11 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 950 -330 0 0 {name=p12 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 550 -280 0 0 {name=p13 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 630 -280 0 1 {name=p14 sig_type=std_logic lab=vdd}
C {devices/opin.sym} 1260 -200 0 0 {name=p15 lab=QN}
