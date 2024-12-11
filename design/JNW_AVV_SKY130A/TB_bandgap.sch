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
N 930 -480 970 -480 {
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
N 1450 -740 1540 -740 {
lab=nbias}
N 1450 -740 1450 -720 {
lab=nbias}
N 1660 -880 1660 -850 {
lab=pbias}
N 1570 -850 1660 -850 {
lab=pbias}
N 1570 -910 1570 -850 {
lab=pbias}
N 1570 -910 1620 -910 {
lab=pbias}
N 1660 -970 1660 -910 {
lab=vdd}
N 1450 -690 1450 -640 {
lab=vss}
N 1390 -890 1390 -640 {
lab=vss}
N 1390 -640 1450 -640 {
lab=vss}
N 1620 -330 1620 -290 {
lab=pbias}
N 1620 -290 1670 -290 {
lab=pbias}
N 1550 -520 1550 -490 {
lab=vdd}
N 1390 -890 1430 -890 {
lab=vss}
N 1540 -740 1540 -690 {
lab=nbias}
N 1490 -690 1540 -690 {
lab=nbias}
N 1660 -690 1660 -640 {
lab=vss}
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
N 1700 -390 1720 -390 {
lab=cmp}
N 940 -300 970 -300 {
lab=PII2}
N 1540 -690 1620 -690 {
lab=nbias}
N 1450 -640 1660 -640 {
lab=vss}
N 1450 -840 1450 -830 {
lab=#net1}
N 1450 -770 1450 -740 {
lab=nbias}
N 1660 -850 1660 -820 {
lab=pbias}
N 1660 -760 1660 -720 {
lab=#net2}
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
N 1390 -1050 1430 -1050 {
lab=vss}
N 1390 -970 1390 -890 {
lab=vss}
N 1450 -1470 1450 -1430 {
lab=vdd}
N 1450 -840 1520 -840 {
lab=#net1}
N 1450 -850 1450 -840 {
lab=#net1}
N 1560 -970 1660 -970 {
lab=vdd}
N 1560 -1000 1620 -1000 {
lab=setupBias}
N 1450 -1270 1450 -1090 {
lab=#net3}
N 1390 -1390 1500 -1390 {
lab=vss}
N 1390 -1310 1500 -1310 {
lab=vss}
N 1390 -1390 1390 -1310 {
lab=vss}
N 1390 -970 1470 -970 {
lab=vss}
N 1450 -1430 1520 -1430 {
lab=vdd}
N 1520 -950 1520 -840 {
lab=#net1}
N 1390 -1050 1390 -970 {
lab=vss}
N 1390 -1150 1390 -1050 {
lab=vss}
N 1390 -1230 1500 -1230 {
lab=vss}
N 1390 -1310 1390 -1230 {
lab=vss}
N 1390 -1150 1500 -1150 {
lab=vss}
N 1390 -1230 1390 -1150 {
lab=vss}
N 1520 -1110 1520 -1050 {
lab=#net4}
C {JNW_AVV_SKY130A/JNW_AVV.sym} 1100 -400 0 0 {name=x2}
C {devices/lab_wire.sym} 960 -480 0 0 {name=p2 sig_type=std_logic lab=vctrl}
C {devices/lab_wire.sym} 1260 -730 0 0 {name=p3 sig_type=std_logic lab=vctrl}
C {devices/ipin.sym} 1000 -950 0 0 {name=p4 lab=vdd}
C {devices/ipin.sym} 1000 -930 0 0 {name=p5 lab=vss}
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
C {devices/opin.sym} 1720 -390 0 0 {name=p29 lab=cmp}
C {devices/lab_wire.sym} 1320 -480 0 0 {name=p30 sig_type=std_logic lab=vp}
C {devices/lab_wire.sym} 1320 -320 0 0 {name=p31 sig_type=std_logic lab=vn}
C {devices/lab_wire.sym} 1620 -850 0 0 {name=p32 sig_type=std_logic lab=pbias}
C {devices/lab_wire.sym} 1670 -290 0 0 {name=p33 sig_type=std_logic lab=pbias}
C {devices/lab_wire.sym} 1450 -1470 0 1 {name=p34 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 1540 -640 0 1 {name=p35 sig_type=std_logic lab=vss}
C {JNW_AVV_SKY130A/CMP.sym} 1370 -250 0 0 {name=x1}
C {JNW_ATR_SKY130A/JNWATR_NCH_2C5F0.sym} 1490 -690 0 1 {name=x28 }
C {devices/lab_wire.sym} 1660 -970 0 0 {name=p13 sig_type=std_logic lab=vdd}
C {JNW_ATR_SKY130A/JNWATR_NCH_2C5F0.sym} 1620 -690 0 0 {name=x4 }
C {devices/lab_wire.sym} 1600 -690 0 0 {name=p14 sig_type=std_logic lab=nbias}
C {JNW_TR_SKY130A/JNWTR_RPPO16.sym} 1450 -850 1 1 {name=x26 }
C {devices/ipin.sym} 1240 -790 2 0 {name=p15 lab=preChrg}
C {JNW_AVV_SKY130A/charge_pump.sym} 930 -590 0 0 {name=x3}
C {devices/ipin.sym} 940 -320 0 0 {name=p16 lab=dummy}
C {devices/ipin.sym} 940 -300 0 0 {name=p27 lab=PII2}
C {devices/vsource.sym} 1450 -800 0 0 {name=v_nbias value=0 savecurrent=true}
C {devices/vsource.sym} 1660 -790 0 0 {name=v_pbias value=0 savecurrent=true}
C {JNW_TR_SKY130A/JNWTR_RPPO16.sym} 1450 -930 1 1 {name=x5 }
C {JNW_TR_SKY130A/JNWTR_RPPO16.sym} 1450 -1010 1 1 {name=x6 }
C {JNW_TR_SKY130A/JNWTR_RPPO16.sym} 1450 -1270 1 1 {name=x8 }
C {JNW_TR_SKY130A/JNWTR_RPPO16.sym} 1450 -1350 1 1 {name=x9 }
C {JNW_ATR_SKY130A/JNWATR_PCH_2C5F0.sym} 1620 -910 0 0 {name=x10 }
C {devices/ipin.sym} 1620 -1000 2 0 {name=p12 lab=setupBias}
C {JNW_TR_SKY130A/JNWTR_RPPO16.sym} 1520 -1270 1 1 {name=x12 }
C {JNW_TR_SKY130A/JNWTR_RPPO16.sym} 1520 -1350 1 1 {name=x13 }
C {JNW_TR_SKY130A/JNWTR_TGX2_CV.sym} 1520 -1060 1 0 {name=x14 }
C {JNW_TR_SKY130A/JNWTR_RPPO16.sym} 1520 -1110 1 1 {name=x7 }
C {JNW_TR_SKY130A/JNWTR_RPPO16.sym} 1520 -1190 1 1 {name=x11 }
