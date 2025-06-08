v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 660 -480 660 -450 {lab=vss}
N 660 -530 660 -500 {lab=vdd}
N 820 -530 850 -530 {lab=pbias}
N 820 -450 850 -450 {lab=nbias}
N 290 -240 340 -240 {lab=vip}
N 290 -180 340 -180 {lab=vout}
N 620 -210 660 -210 {lab=vout}
N 290 -180 290 -60 {lab=vout}
N 290 -60 620 -60 {lab=vout}
N 620 -210 620 -60 {lab=vout}
N 600 -210 620 -210 {lab=vout}
C {JNW_AVV_SKY130A/OTA.sym} 450 -210 0 0 {name=x1}
C {JNW_AVV_SKY130A/bias.sym} 740 -410 0 0 {name=x2}
C {devices/lab_wire.sym} 490 -130 0 1 {name=p195 sig_type=std_logic lab=nbias}
C {devices/lab_wire.sym} 450 -310 0 1 {name=p1 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 490 -290 0 1 {name=p2 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 450 -110 0 1 {name=p3 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 660 -530 0 0 {name=p4 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 660 -450 0 0 {name=p5 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 830 -530 0 1 {name=p6 sig_type=std_logic lab=pbias}
C {devices/lab_wire.sym} 830 -450 0 1 {name=p7 sig_type=std_logic lab=nbias}
C {devices/ipin.sym} 290 -240 0 0 {name=p17 lab=vip}
C {devices/ipin.sym} 290 -480 0 0 {name=p8 lab=vss}
C {devices/ipin.sym} 290 -510 0 0 {name=p9 lab=vdd}
C {devices/opin.sym} 660 -210 0 0 {name=p10 lab=vout}
