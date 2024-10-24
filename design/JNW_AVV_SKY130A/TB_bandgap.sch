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
N 1480 -550 1480 -510 {
lab=#net1}
N 1400 -550 1480 -550 {
lab=#net1}
N 1400 -550 1400 -530 {
lab=#net1}
N 1400 -480 1400 -470 {
lab=vss}
N 1370 -470 1400 -470 {
lab=vss}
N 950 -750 1000 -750 {
lab=pbias}
N 950 -710 1000 -710 {
lab=nbias}
N 1430 -710 1480 -710 {
lab=nbias}
N 1430 -770 1430 -710 {
lab=nbias}
N 1430 -770 1520 -770 {
lab=nbias}
N 1520 -770 1520 -740 {
lab=nbias}
N 1520 -800 1520 -770 {
lab=nbias}
N 1520 -890 1520 -860 {
lab=pbias}
N 1520 -920 1520 -890 {
lab=pbias}
N 1430 -890 1520 -890 {
lab=pbias}
N 1430 -950 1430 -890 {
lab=pbias}
N 1430 -950 1480 -950 {
lab=pbias}
N 1520 -990 1520 -950 {
lab=vdd}
N 1490 -990 1520 -990 {
lab=vdd}
N 1490 -670 1520 -670 {
lab=vss}
N 1520 -710 1520 -670 {
lab=vss}
C {JNW_AVV_SKY130A/CMP.sym} 1350 -260 0 0 {name=x1}
C {JNW_AVV_SKY130A/JNW_AVV.sym} 1100 -400 0 0 {name=x2}
C {JNW_AVV_SKY130A/charge_pump.sym} 930 -590 0 0 {name=x3}
C {devices/lab_wire.sym} 960 -480 0 0 {name=p2 sig_type=std_logic lab=vctrl}
C {devices/lab_wire.sym} 1260 -730 0 0 {name=p3 sig_type=std_logic lab=vctrl}
C {devices/ipin.sym} 1000 -950 0 0 {name=p4 lab=vdd}
C {devices/ipin.sym} 1000 -930 0 0 {name=p5 lab=vss}
C {devices/lab_wire.sym} 1100 -560 0 0 {name=p6 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 1530 -510 0 0 {name=p7 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 1100 -850 0 0 {name=p8 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 1530 -290 0 0 {name=p9 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 1100 -610 0 0 {name=p10 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 1100 -240 0 0 {name=p11 sig_type=std_logic lab=vss}
C {devices/isource.sym} 1400 -500 0 0 {name=I1 value=12.5u}
C {devices/lab_wire.sym} 1400 -470 0 0 {name=p16 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 990 -710 0 0 {name=p17 sig_type=std_logic lab=nbias}
C {devices/lab_wire.sym} 990 -750 0 0 {name=p18 sig_type=std_logic lab=pbias}
C {devices/opin.sym} 1270 -400 0 0 {name=p19 lab=vref}
C {devices/ipin.sym} 1000 -780 0 0 {name=p1 lab=src}
C {devices/ipin.sym} 1000 -680 0 0 {name=p20 lab=snk}
C {devices/ipin.sym} 970 -460 0 0 {name=p21 lab=PA}
C {devices/ipin.sym} 970 -440 0 0 {name=p22 lab=PB}
C {devices/ipin.sym} 970 -420 0 0 {name=p23 lab=PC}
C {devices/ipin.sym} 970 -400 0 0 {name=p24 lab=PD}
C {devices/ipin.sym} 970 -380 0 0 {name=p25 lab=PI1}
C {devices/ipin.sym} 970 -360 0 0 {name=p26 lab=PI2}
C {devices/ipin.sym} 970 -320 0 0 {name=p27 lab=PII2}
C {devices/ipin.sym} 970 -340 0 0 {name=p28 lab=PII1}
C {devices/opin.sym} 1680 -400 0 0 {name=p29 lab=cmp}
C {devices/lab_wire.sym} 1320 -480 0 0 {name=p30 sig_type=std_logic lab=vp}
C {devices/lab_wire.sym} 1320 -320 0 0 {name=p31 sig_type=std_logic lab=vn}
C {devices/isource.sym} 1520 -830 0 0 {name=I2 value=1u}
C {devices/lab_wire.sym} 1480 -890 0 0 {name=p32 sig_type=std_logic lab=pbias}
C {devices/lab_wire.sym} 1440 -770 2 0 {name=p33 sig_type=std_logic lab=nbias}
C {devices/lab_wire.sym} 1520 -990 0 0 {name=p34 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 1520 -670 0 0 {name=p35 sig_type=std_logic lab=vss}
C {JNW_ATR_SKY130A/JNWATR_NCH_8C5F0.sym} 1480 -710 0 0 {name=x6 }
C {JNW_ATR_SKY130A/JNWATR_PCH_8C5F0.sym} 1480 -950 0 0 {name=x7 }
