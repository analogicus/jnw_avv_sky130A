v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 1230 -400 1260 -400 {
lab=vref}
N 1230 -320 1360 -320 {
lab=vn}
N 1230 -480 1360 -480 {
lab=vp}
N 1220 -730 1260 -730 {
lab=vctrl}
N 940 -480 970 -480 {
lab=vctrl}
N 1100 -560 1100 -550 {
lab=vdd}
N 1070 -560 1100 -560 {
lab=vdd}
N 1100 -850 1100 -840 {
lab=vdd}
N 1070 -850 1100 -850 {
lab=vdd}
N 1550 -290 1550 -260 {
lab=vss}
N 1100 -620 1100 -610 {
lab=vss}
N 1070 -610 1100 -610 {
lab=vss}
N 1100 -250 1100 -240 {
lab=vss}
N 1070 -240 1100 -240 {
lab=vss}
N 950 -750 1000 -750 {
lab=pbias}
N 950 -710 1000 -710 {
lab=nbias}
N 1620 -330 1620 -290 {
lab=pbias}
N 1620 -290 1670 -290 {
lab=pbias}
N 1550 -520 1550 -490 {
lab=vdd}
N 940 -460 970 -460 {
lab=PA}
N 940 -440 970 -440 {
lab=PB}
N 940 -420 970 -420 {
lab=PC}
N 940 -400 970 -400 {
lab=PD}
N 940 -380 970 -380 {
lab=PI1}
N 940 -360 970 -360 {
lab=PI2}
N 940 -340 970 -340 {
lab=PII1}
N 940 -320 970 -320 {
lab=dummy}
N 980 -680 1000 -680 {
lab=snk}
N 980 -780 1000 -780 {
lab=src_n}
N 1220 -790 1240 -790 {
lab=preChrg}
N 940 -300 970 -300 {
lab=PII2}
N 1360 -480 1360 -420 {
lab=vp}
N 1360 -420 1440 -420 {
lab=vp}
N 1360 -360 1360 -320 {
lab=vn}
N 1360 -360 1440 -360 {
lab=vn}
N 1520 -260 1550 -260 {
lab=vss}
N 1510 -520 1550 -520 {
lab=vdd}
N 940 -500 970 -500 {
lab=preChrg}
N 1460 -660 1490 -660 {
lab=setupBias}
N 1590 -520 1590 -470 {
lab=cmp_p1}
N 1590 -520 1670 -520 {
lab=cmp_p1}
N 1640 -480 1640 -450 {
lab=cmp_p2}
N 1640 -480 1710 -480 {
lab=cmp_p2}
N 1770 -350 1820 -350 {
lab=sample}
N 1700 -390 1970 -390 {
lab=cmp}
N 1920 -350 1960 -350 {
lab=#net1}
C {devices/lab_wire.sym} 960 -480 0 0 {name=p2 sig_type=std_logic lab=vctrl}
C {devices/lab_wire.sym} 1260 -730 0 0 {name=p3 sig_type=std_logic lab=vctrl}
C {devices/ipin.sym} 840 -810 0 0 {name=p4 lab=vdd}
C {devices/ipin.sym} 840 -790 0 0 {name=p5 lab=vss}
C {devices/lab_wire.sym} 1100 -560 0 0 {name=p6 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 1540 -520 0 0 {name=p7 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 1100 -850 0 0 {name=p8 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 1540 -260 0 0 {name=p9 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 1100 -610 0 0 {name=p10 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 1100 -240 0 0 {name=p11 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 990 -710 0 0 {name=p17 sig_type=std_logic lab=nbias}
C {devices/lab_wire.sym} 990 -750 0 0 {name=p18 sig_type=std_logic lab=pbias}
C {devices/opin.sym} 1260 -400 0 0 {name=p19 lab=vref}
C {devices/ipin.sym} 980 -780 0 0 {name=p1 lab=src_n}
C {devices/ipin.sym} 980 -680 0 0 {name=p20 lab=snk}
C {devices/ipin.sym} 940 -460 0 0 {name=p21 lab=PA}
C {devices/ipin.sym} 940 -440 0 0 {name=p22 lab=PB}
C {devices/ipin.sym} 940 -420 0 0 {name=p23 lab=PC}
C {devices/ipin.sym} 940 -400 0 0 {name=p24 lab=PD}
C {devices/ipin.sym} 940 -380 0 0 {name=p25 lab=PI1}
C {devices/ipin.sym} 940 -360 0 0 {name=p26 lab=PI2}
C {devices/ipin.sym} 940 -340 0 0 {name=p28 lab=PII1}
C {devices/opin.sym} 1970 -390 0 0 {name=p29 lab=cmp}
C {devices/lab_wire.sym} 1320 -480 0 0 {name=p30 sig_type=std_logic lab=vp}
C {devices/lab_wire.sym} 1320 -320 0 0 {name=p31 sig_type=std_logic lab=vn}
C {devices/lab_wire.sym} 1670 -290 0 0 {name=p33 sig_type=std_logic lab=pbias}
C {devices/ipin.sym} 1240 -790 2 0 {name=p15 lab=preChrg}
C {JNW_AVV_SKY130A/charge_pump.sym} 930 -590 0 0 {name=x3}
C {devices/ipin.sym} 940 -320 0 0 {name=p16 lab=dummy}
C {devices/ipin.sym} 940 -300 0 0 {name=p27 lab=PII2}
C {JNW_AVV_SKY130A/JNW_AVV.sym} 1100 -400 0 0 {name=x2}
C {devices/lab_wire.sym} 960 -500 0 0 {name=p36 sig_type=std_logic lab=preChrg}
C {JNW_AVV_SKY130A/bias.sym} 1570 -580 0 0 {name=x4}
C {devices/lab_wire.sym} 1870 -430 0 0 {name=p12 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 1870 -310 2 1 {name=p13 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 1650 -620 0 1 {name=p32 sig_type=std_logic lab=nbias}
C {devices/lab_wire.sym} 1650 -700 0 1 {name=p34 sig_type=std_logic lab=pbias}
C {devices/ipin.sym} 1460 -660 0 0 {name=p14 lab=setupBias}
C {devices/lab_wire.sym} 1650 -480 0 1 {name=p35 sig_type=std_logic lab=cmp_p2}
C {devices/lab_wire.sym} 1610 -520 0 1 {name=p37 sig_type=std_logic lab=cmp_p1}
C {devices/ipin.sym} 840 -850 0 0 {name=p38 lab=cmp_p1}
C {devices/ipin.sym} 840 -830 0 0 {name=p39 lab=cmp_p2}
C {devices/ipin.sym} 840 -870 0 0 {name=p40 lab=sample}
C {devices/lab_wire.sym} 1820 -350 0 0 {name=p41 sig_type=std_logic lab=sample}
C {devices/lab_wire.sym} 1490 -700 0 0 {name=p42 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 1490 -620 0 0 {name=p43 sig_type=std_logic lab=vss}
C {JNW_AVV_SKY130A/CMP_v2.sym} 1430 -270 0 0 {name=x1}
