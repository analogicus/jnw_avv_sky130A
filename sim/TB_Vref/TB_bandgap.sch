v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 1230 -400 1260 -400 {
lab=vref}
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
N 1100 -620 1100 -610 {
lab=vss}
N 1070 -610 1100 -610 {
lab=vss}
N 1100 -250 1100 -240 {
lab=vss}
N 1070 -240 1100 -240 {
lab=vss}
N 950 -750 1000 -750 {
lab=cmp}
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
N 940 -500 970 -500 {
lab=preChrg}
N 1460 -660 1490 -660 {
lab=setupBias}
N 1550 -360 1550 -320 {lab=vin}
N 1550 -360 1700 -360 {lab=vin}
N 1550 -480 1550 -420 {lab=vip}
N 1550 -420 1700 -420 {lab=vip}
N 1230 -320 1390 -320 {lab=vn}
N 1490 -320 1550 -320 {lab=vin}
N 1440 -380 1440 -360 {lab=s_BG2CMP}
N 1490 -480 1550 -480 {lab=vip}
N 1230 -480 1390 -480 {lab=vp}
N 1440 -540 1440 -520 {lab=s_BG2CMP}
N 1960 -390 2020 -390 {lab=cmp}
C {devices/lab_wire.sym} 960 -480 0 0 {name=p2 sig_type=std_logic lab=vctrl}
C {devices/lab_wire.sym} 1260 -730 0 0 {name=p3 sig_type=std_logic lab=vctrl}
C {devices/ipin.sym} 840 -810 0 0 {name=p4 lab=vdd}
C {devices/ipin.sym} 840 -790 0 0 {name=p5 lab=vss}
C {devices/lab_wire.sym} 1100 -560 0 0 {name=p6 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 1100 -850 0 0 {name=p8 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 1100 -610 0 0 {name=p10 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 1100 -240 0 0 {name=p11 sig_type=std_logic lab=vss}
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
C {devices/opin.sym} 2020 -390 0 0 {name=p29 lab=cmp}
C {devices/lab_wire.sym} 1320 -480 0 0 {name=p30 sig_type=std_logic lab=vp}
C {devices/lab_wire.sym} 1320 -320 0 0 {name=p31 sig_type=std_logic lab=vn}
C {devices/ipin.sym} 1240 -790 2 0 {name=p15 lab=preChrg}
C {JNW_AVV_SKY130A/charge_pump.sym} 930 -590 0 0 {name=x3}
C {devices/ipin.sym} 940 -320 0 0 {name=p16 lab=dummy}
C {devices/ipin.sym} 940 -300 0 0 {name=p27 lab=PII2}
C {JNW_AVV_SKY130A/JNW_AVV.sym} 1100 -400 0 0 {name=x2}
C {devices/lab_wire.sym} 960 -500 0 0 {name=p36 sig_type=std_logic lab=preChrg}
C {JNW_AVV_SKY130A/bias.sym} 1570 -580 0 0 {name=x4}
C {devices/lab_wire.sym} 1650 -620 0 1 {name=p32 sig_type=std_logic lab=nbias}
C {devices/lab_wire.sym} 1650 -700 0 1 {name=p34 sig_type=std_logic lab=pbias}
C {devices/ipin.sym} 1460 -660 0 0 {name=p14 lab=setupBias}
C {devices/lab_wire.sym} 1630 -420 0 1 {name=p35 sig_type=std_logic lab=vip}
C {devices/lab_wire.sym} 1850 -470 0 1 {name=p37 sig_type=std_logic lab=cmp_p1}
C {devices/ipin.sym} 840 -850 0 0 {name=p38 lab=cmp_p1}
C {devices/ipin.sym} 840 -830 0 0 {name=p39 lab=cmp_p2}
C {devices/lab_wire.sym} 1490 -700 0 0 {name=p42 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 1490 -620 0 0 {name=p43 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 1440 -540 0 1 {name=p45 sig_type=std_logic lab=s_BG2CMP}
C {devices/ipin.sym} 840 -770 0 0 {name=p47 lab=s_BG2CMP}
C {devices/lab_wire.sym} 990 -750 0 0 {name=p17 sig_type=std_logic lab=cmp}
C {devices/lab_wire.sym} 1440 -380 0 1 {name=p40 sig_type=std_logic lab=s_BG2CMP}
C {devices/lab_wire.sym} 1470 -270 0 0 {name=p12 sig_type=std_logic lab=vss
}
C {devices/lab_wire.sym} 1470 -360 0 1 {name=p13 sig_type=std_logic lab=vdd

}
C {JNW_TR_SKY130A/JNWTR_TGX2_CV.sym} 1380 -320 0 0 {name=x5 }
C {devices/lab_wire.sym} 1470 -430 0 0 {name=p41 sig_type=std_logic lab=vss
}
C {devices/lab_wire.sym} 1470 -520 0 1 {name=p44 sig_type=std_logic lab=vdd

}
C {JNW_TR_SKY130A/JNWTR_TGX2_CV.sym} 1380 -480 0 0 {name=x6 }
C {devices/lab_wire.sym} 1630 -360 0 1 {name=p33 sig_type=std_logic lab=vin}
C {JNW_AVV_SKY130A/CMP_v2.sym} 1690 -270 0 0 {name=x1}
C {devices/lab_wire.sym} 1900 -450 0 1 {name=p7 sig_type=std_logic lab=cmp_p2}
C {devices/lab_wire.sym} 1810 -490 0 0 {name=p9 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 1810 -290 0 0 {name=p18 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 1840 -310 2 0 {name=p46 sig_type=std_logic lab=nbias}
C {devices/lab_wire.sym} 1880 -330 2 0 {name=p48 sig_type=std_logic lab=pbias}
