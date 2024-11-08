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
N 1360 -370 1360 -320 {
lab=vn}
N 1360 -370 1420 -370 {
lab=vn}
N 1230 -480 1360 -480 {
lab=vp}
N 1360 -480 1360 -430 {
lab=vp}
N 1360 -430 1420 -430 {
lab=vp}
N 1220 -730 1260 -730 {
lab=vctrl}
N 930 -480 970 -480 {
lab=vctrl}
N 1100 -560 1100 -550 {
lab=vdd}
N 1490 -530 1530 -530 {
lab=vdd}
N 1070 -560 1100 -560 {
lab=vdd}
N 1100 -850 1100 -840 {
lab=vdd}
N 1070 -850 1100 -850 {
lab=vdd}
N 1530 -300 1530 -270 {
lab=vss}
N 1490 -270 1530 -270 {
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
N 1350 -740 1440 -740 {
lab=nbias}
N 1440 -740 1440 -720 {
lab=nbias}
N 1660 -830 1660 -800 {
lab=pbias}
N 1570 -800 1660 -800 {
lab=pbias}
N 1570 -860 1570 -800 {
lab=pbias}
N 1570 -860 1620 -860 {
lab=pbias}
N 1660 -920 1660 -860 {
lab=vdd}
N 1440 -690 1440 -640 {
lab=vss}
N 1410 -1120 1440 -1120 {
lab=vdd}
N 1500 -890 1500 -640 {
lab=vss}
N 1440 -640 1500 -640 {
lab=vss}
N 1600 -340 1600 -300 {
lab=pbias}
N 1600 -300 1650 -300 {
lab=pbias}
N 1530 -530 1530 -500 {
lab=vdd}
N 1460 -890 1500 -890 {
lab=vss}
N 1500 -970 1500 -890 {
lab=vss}
N 1460 -970 1500 -970 {
lab=vss}
N 1500 -1050 1500 -970 {
lab=vss}
N 1460 -1050 1500 -1050 {
lab=vss}
N 1440 -1120 1440 -1090 {
lab=vdd}
N 1570 -690 1620 -690 {
lab=nbias}
N 1500 -640 1660 -640 {
lab=vss}
N 1630 -920 1660 -920 {
lab=vdd}
N 1350 -740 1350 -690 {
lab=nbias}
N 1350 -690 1400 -690 {
lab=nbias}
N 1660 -690 1660 -640 {
lab=vss}
N 1440 -850 1440 -740 {
lab=nbias}
N 1660 -800 1660 -720 {
lab=pbias}
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
N 1680 -400 1700 -400 {
lab=cmp}
N 940 -300 970 -300 {
lab=PII2}
C {JNW_AVV_SKY130A/JNW_AVV.sym} 1100 -400 0 0 {name=x2}
C {devices/lab_wire.sym} 960 -480 0 0 {name=p2 sig_type=std_logic lab=vctrl}
C {devices/lab_wire.sym} 1260 -730 0 0 {name=p3 sig_type=std_logic lab=vctrl}
C {devices/ipin.sym} 1000 -950 0 0 {name=p4 lab=vdd}
C {devices/ipin.sym} 1000 -930 0 0 {name=p5 lab=vss}
C {devices/lab_wire.sym} 1100 -560 0 0 {name=p6 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 1520 -530 0 0 {name=p7 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 1100 -850 0 0 {name=p8 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 1520 -270 0 0 {name=p9 sig_type=std_logic lab=vss}
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
C {devices/opin.sym} 1700 -400 0 0 {name=p29 lab=cmp}
C {devices/lab_wire.sym} 1320 -480 0 0 {name=p30 sig_type=std_logic lab=vp}
C {devices/lab_wire.sym} 1320 -320 0 0 {name=p31 sig_type=std_logic lab=vn}
C {devices/lab_wire.sym} 1620 -800 0 0 {name=p32 sig_type=std_logic lab=pbias}
C {devices/lab_wire.sym} 1650 -300 0 0 {name=p33 sig_type=std_logic lab=pbias}
C {devices/lab_wire.sym} 1440 -1120 0 0 {name=p34 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 1490 -640 0 0 {name=p35 sig_type=std_logic lab=vss}
C {JNW_ATR_SKY130A/JNWATR_PCH_8C5F0.sym} 1620 -860 0 0 {name=x7 }
C {JNW_AVV_SKY130A/CMP.sym} 1350 -260 0 0 {name=x1}
C {JNW_ATR_SKY130A/JNWATR_NCH_2C5F0.sym} 1400 -690 0 0 {name=x28 }
C {devices/lab_wire.sym} 1410 -740 0 0 {name=p12 sig_type=std_logic lab=nbias}
C {devices/lab_wire.sym} 1660 -920 0 0 {name=p13 sig_type=std_logic lab=vdd}
C {JNW_ATR_SKY130A/JNWATR_NCH_2C5F0.sym} 1620 -690 0 0 {name=x4 }
C {devices/lab_wire.sym} 1610 -690 0 0 {name=p14 sig_type=std_logic lab=nbias}
C {JNW_TR_SKY130A/JNWTR_RPPO16.sym} 1440 -850 3 0 {name=x26 }
C {JNW_TR_SKY130A/JNWTR_RPPO16.sym} 1440 -930 3 0 {name=x27 }
C {JNW_TR_SKY130A/JNWTR_RPPO8.sym} 1440 -1010 3 0 {name=x11 }
C {devices/ipin.sym} 1240 -790 2 0 {name=p15 lab=preChrg}
C {JNW_AVV_SKY130A/charge_pump.sym} 930 -590 0 0 {name=x3}
C {devices/ipin.sym} 940 -320 0 0 {name=p16 lab=dummy}
C {devices/ipin.sym} 940 -300 0 0 {name=p27 lab=PII2}
