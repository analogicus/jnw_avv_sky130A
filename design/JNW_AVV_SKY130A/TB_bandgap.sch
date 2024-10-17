v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 1230 -400 1270 -400 {
lab=vref}
N 1230 -320 1360 -320 {
lab=#net1}
N 1360 -370 1360 -320 {
lab=#net1}
N 1360 -370 1420 -370 {
lab=#net1}
N 1230 -480 1360 -480 {
lab=#net2}
N 1360 -480 1360 -430 {
lab=#net2}
N 1360 -430 1420 -430 {
lab=#net2}
N 1220 -730 1260 -730 {
lab=vctrl}
N 930 -480 970 -480 {
lab=vctrl}
N 1100 -560 1100 -550 {
lab=vdd}
N 1530 -510 1530 -500 {
lab=vdd}
N 1500 -510 1530 -510 {
lab=vdd}
N 1070 -560 1100 -560 {
lab=vdd}
N 1100 -850 1100 -840 {
lab=vdd}
N 1070 -850 1100 -850 {
lab=vdd}
N 1530 -300 1530 -290 {
lab=vss}
N 1500 -290 1530 -290 {
lab=vss}
N 1100 -620 1100 -610 {
lab=vss}
N 1070 -610 1100 -610 {
lab=vss}
N 1100 -250 1100 -240 {
lab=vss}
N 1070 -240 1100 -240 {
lab=vss}
N 1410 -710 1460 -710 {
lab=nbias}
N 1410 -770 1410 -710 {
lab=nbias}
N 1410 -770 1500 -770 {
lab=nbias}
N 1500 -770 1500 -740 {
lab=nbias}
N 1500 -800 1500 -770 {
lab=nbias}
N 1500 -890 1500 -860 {
lab=pbias}
N 1500 -920 1500 -890 {
lab=pbias}
N 1410 -890 1500 -890 {
lab=pbias}
N 1410 -950 1410 -890 {
lab=pbias}
N 1410 -950 1460 -950 {
lab=pbias}
N 1500 -990 1500 -980 {
lab=vdd}
N 1470 -990 1500 -990 {
lab=vdd}
N 1500 -680 1500 -670 {
lab=vss}
N 1470 -670 1500 -670 {
lab=vss}
N 1480 -550 1480 -510 {
lab=#net3}
N 1400 -550 1480 -550 {
lab=#net3}
N 1400 -550 1400 -530 {
lab=#net3}
N 1400 -480 1400 -470 {
lab=vss}
N 1370 -470 1400 -470 {
lab=vss}
N 950 -750 1000 -750 {
lab=pbias}
N 950 -710 1000 -710 {
lab=nbias}
C {JNW_AVV_SKY130A/CMP.sym} 1350 -260 0 0 {name=x1}
C {JNW_AVV_SKY130A/JNW_AVV.sym} 1100 -400 0 0 {name=x2}
C {JNW_AVV_SKY130A/charge_pump.sym} 930 -590 0 0 {name=x3}
C {devices/lab_wire.sym} 960 -480 0 0 {name=p2 sig_type=std_logic lab=vctrl}
C {devices/lab_wire.sym} 1260 -730 0 0 {name=p3 sig_type=std_logic lab=vctrl}
C {devices/ipin.sym} 750 -680 0 0 {name=p4 lab=vdd}
C {devices/ipin.sym} 750 -660 0 0 {name=p5 lab=vss}
C {devices/lab_wire.sym} 1100 -560 0 0 {name=p6 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 1530 -510 0 0 {name=p7 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 1100 -850 0 0 {name=p8 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 1530 -290 0 0 {name=p9 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 1100 -610 0 0 {name=p10 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 1100 -240 0 0 {name=p11 sig_type=std_logic lab=vss}
C {JNW_ATR_SKY130A/JNWATR_NCH_2C5F0.sym} 1460 -710 0 0 {name=x4 }
C {JNW_ATR_SKY130A/JNWATR_PCH_2C5F0.sym} 1460 -950 0 0 {name=x5 }
C {devices/isource.sym} 1500 -830 0 0 {name=I0 value=10u}
C {devices/lab_wire.sym} 1460 -890 0 0 {name=p12 sig_type=std_logic lab=pbias}
C {devices/lab_wire.sym} 1420 -770 2 0 {name=p13 sig_type=std_logic lab=nbias}
C {devices/lab_wire.sym} 1500 -990 0 0 {name=p14 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 1500 -670 0 0 {name=p15 sig_type=std_logic lab=vss}
C {devices/isource.sym} 1400 -500 0 0 {name=I1 value=12.5u}
C {devices/lab_wire.sym} 1400 -470 0 0 {name=p16 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 990 -710 0 0 {name=p17 sig_type=std_logic lab=nbias}
C {devices/lab_wire.sym} 990 -750 0 0 {name=p18 sig_type=std_logic lab=pbias}
C {devices/opin.sym} 1270 -400 0 0 {name=p19 lab=vref}
C {devices/ipin.sym} 1000 -780 0 0 {name=p1 lab=vss}
C {devices/ipin.sym} 1000 -680 0 0 {name=p20 lab=vss}
C {devices/ipin.sym} 970 -460 0 0 {name=p21 lab=PA}
C {devices/ipin.sym} 970 -440 0 0 {name=p22 lab=PB}
C {devices/ipin.sym} 970 -420 0 0 {name=p23 lab=PC}
C {devices/ipin.sym} 970 -400 0 0 {name=p24 lab=PD}
C {devices/ipin.sym} 970 -380 0 0 {name=p25 lab=PI1}
C {devices/ipin.sym} 970 -360 0 0 {name=p26 lab=PI2}
C {devices/ipin.sym} 970 -320 0 0 {name=p27 lab=PII2}
C {devices/ipin.sym} 970 -340 0 0 {name=p28 lab=PII1}
C {devices/opin.sym} 1680 -400 0 0 {name=p29 lab=cmp}
