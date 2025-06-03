v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 80 -370 120 -370 {lab=PA}
N 80 -350 120 -350 {lab=PB}
N 80 -330 120 -330 {lab=PC}
N 80 -310 120 -310 {lab=PD}
N 80 -290 120 -290 {lab=PI1}
N 80 -270 120 -270 {lab=PI2}
N 80 -250 120 -250 {lab=PII1}
N 80 -230 120 -230 {lab=dummy}
N 80 -210 120 -210 {lab=PII2}
N 80 -190 120 -190 {lab=vss}
N 80 -170 120 -170 {lab=vdd}
N 80 -150 120 -150 {lab=vdd}
N 830 -190 838 -197 {lab=vdd}
N 800 -750 800 -720 {lab=vdd}
N 960 -450 960 -370 {lab=cmp_p2}
N 910 -440 910 -390 {lab=cmp_p1}
N 940 -250 940 -210 {lab=pbias}
N 900 -230 900 -190 {lab=nbias}
N 80 -410 120 -410 {lab=preChrg}
N 80 -390 120 -390 {lab=vctrl}
N 380 -230 670 -230 {lab=vn}
N 670 -280 670 -230 {lab=vn}
N 380 -390 670 -390 {lab=vp}
N 670 -390 670 -340 {lab=vp}
N 100 -820 140 -820 {lab=preChrg}
N 100 -790 140 -790 {lab=src_n}
N 100 -760 140 -760 {lab=cmp}
N 100 -690 140 -690 {lab=snk}
N 100 -630 140 -630 {lab=vss}
N 100 -660 140 -660 {lab=vdd}
N 100 -720 140 -720 {lab=vdd}
N 360 -740 380 -740 {lab=vctrl}
N 960 -670 980 -670 {lab=nbias}
N 960 -750 980 -750 {lab=pbias}
N 380 -340 410 -340 {lab=vref}
N 1020 -310 1090 -310 {lab=cmp}
N 670 -340 760 -340 {lab=vp}
N 670 -280 760 -280 {lab=vn}
N 870 -210 870 -170 {lab=vss}
C {JNW_AVV_SKY130A/JNW_AVV.sym} 250 -310 0 0 {name=x2}
C {JNW_AVV_SKY130A/bias.sym} 880 -630 0 0 {name=x4}
C {JNW_AVV_SKY130A/charge_pump.sym} 70 -600 0 0 {name=x3}
C {devices/ipin.sym} -70 -710 0 0 {name=p4 lab=vdd}
C {devices/ipin.sym} -70 -690 0 0 {name=p5 lab=vss}
C {devices/ipin.sym} -70 -650 0 0 {name=p1 lab=src_n}
C {devices/ipin.sym} -70 -630 0 0 {name=p20 lab=snk}
C {devices/ipin.sym} 80 -370 0 0 {name=p21 lab=PA}
C {devices/ipin.sym} 80 -350 0 0 {name=p22 lab=PB}
C {devices/ipin.sym} 80 -330 0 0 {name=p23 lab=PC}
C {devices/ipin.sym} 80 -310 0 0 {name=p24 lab=PD}
C {devices/ipin.sym} 80 -290 0 0 {name=p25 lab=PI1}
C {devices/ipin.sym} 80 -270 0 0 {name=p26 lab=PI2}
C {devices/ipin.sym} 80 -250 0 0 {name=p28 lab=PII1}
C {devices/ipin.sym} -70 -670 0 0 {name=p15 lab=preChrg}
C {devices/ipin.sym} 80 -230 0 0 {name=p16 lab=dummy}
C {devices/ipin.sym} 80 -210 0 0 {name=p27 lab=PII2}
C {devices/ipin.sym} -70 -770 0 0 {name=p14 lab=setupBias}
C {devices/ipin.sym} -70 -750 0 0 {name=p38 lab=cmp_p1}
C {devices/ipin.sym} -70 -730 0 0 {name=p39 lab=cmp_p2}
C {devices/lab_wire.sym} 80 -150 0 0 {name=p100 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 80 -170 0 0 {name=p2 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 80 -190 0 0 {name=p3 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 250 -100 0 0 {name=p6 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 250 -460 0 0 {name=p7 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 870 -410 0 0 {name=p8 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 870 -170 0 0 {name=p9 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 830 -190 0 0 {name=p10 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 800 -750 0 0 {name=p11 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 240 -850 0 0 {name=p12 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 800 -670 0 0 {name=p13 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 240 -590 0 0 {name=p17 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 910 -440 0 0 {name=p18 sig_type=std_logic lab=cmp_p1}
C {devices/lab_wire.sym} 960 -450 0 0 {name=p19 sig_type=std_logic lab=cmp_p2}
C {devices/lab_wire.sym} 980 -670 0 1 {name=p29 sig_type=std_logic lab=nbias}
C {devices/lab_wire.sym} 980 -750 0 1 {name=p30 sig_type=std_logic lab=pbias}
C {devices/lab_wire.sym} 940 -210 0 1 {name=p31 sig_type=std_logic lab=pbias}
C {devices/lab_wire.sym} 900 -190 0 1 {name=p32 sig_type=std_logic lab=nbias}
C {devices/lab_wire.sym} 80 -410 0 0 {name=p33 sig_type=std_logic lab=preChrg}
C {devices/lab_wire.sym} 80 -390 0 0 {name=p34 sig_type=std_logic lab=vctrl}
C {devices/lab_wire.sym} 380 -740 0 1 {name=p35 sig_type=std_logic lab=vctrl}
C {devices/noconn.sym} 380 -280 0 1 {name=l1}
C {devices/lab_wire.sym} 800 -700 0 0 {name=p36 sig_type=std_logic lab=setupBias}
C {devices/lab_wire.sym} 100 -790 0 0 {name=p37 sig_type=std_logic lab=src_n}
C {devices/lab_wire.sym} 100 -760 0 0 {name=p40 sig_type=std_logic lab=cmp}
C {devices/lab_wire.sym} 100 -690 0 0 {name=p42 sig_type=std_logic lab=snk}
C {devices/lab_wire.sym} 100 -630 0 0 {name=p43 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 100 -660 0 0 {name=p44 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 100 -720 0 0 {name=p41 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 100 -820 0 0 {name=p45 sig_type=std_logic lab=preChrg}
C {devices/lab_wire.sym} 1060 -310 0 1 {name=p46 sig_type=std_logic lab=cmp}
C {devices/opin.sym} 890 -860 0 0 {name=p47 lab=vref}
C {devices/opin.sym} 890 -840 0 0 {name=p48 lab=cmp}
C {devices/lab_wire.sym} 410 -340 0 1 {name=p49 sig_type=std_logic lab=vref}
C {devices/lab_wire.sym} 440 -390 0 1 {name=p50 sig_type=std_logic lab=vp}
C {devices/lab_wire.sym} 460 -230 0 1 {name=p51 sig_type=std_logic lab=vn}
C {JNW_AVV_SKY130A/CMP_v2.sym} 750 -190 0 0 {name=x1}
