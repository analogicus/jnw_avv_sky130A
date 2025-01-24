v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 110 -200 160 -200 {
lab=pbias}
N 110 -160 160 -160 {
lab=nbias}
N 110 -130 160 -130 {
lab=snk}
N 110 -230 160 -230 {
lab=src_n}
N 380 -180 410 -180 {
lab=vctrl}
N 260 -320 260 -290 {
lab=vdd}
N 260 -70 260 -40 {
lab=vss}
N 380 -240 410 -240 {
lab=preChrg}
N 640 -130 730 -130 {
lab=nbias}
N 640 -130 640 -110 {
lab=nbias}
N 850 -270 850 -240 {
lab=pbias}
N 760 -240 850 -240 {
lab=pbias}
N 760 -300 760 -240 {
lab=pbias}
N 760 -300 810 -300 {
lab=pbias}
N 850 -360 850 -300 {
lab=vdd}
N 640 -80 640 -30 {
lab=vss}
N 580 -280 580 -30 {
lab=vss}
N 580 -30 640 -30 {
lab=vss}
N 580 -280 620 -280 {
lab=vss}
N 820 -360 850 -360 {
lab=vdd}
N 730 -130 730 -80 {
lab=nbias}
N 680 -80 730 -80 {
lab=nbias}
N 850 -80 850 -30 {
lab=vss}
N 730 -80 810 -80 {
lab=nbias}
N 640 -30 850 -30 {
lab=vss}
N 640 -160 640 -130 {
lab=nbias}
N 850 -240 850 -210 {
lab=pbias}
N 850 -150 850 -110 {
lab=#net1}
N 580 -360 580 -280 {
lab=vss}
N 580 -440 620 -440 {
lab=vss}
N 580 -360 620 -360 {
lab=vss}
N 580 -440 580 -360 {
lab=vss}
N 580 -520 580 -440 {
lab=vss}
N 640 -680 640 -640 {
lab=vdd}
N 640 -240 640 -220 {
lab=#net2}
N 580 -520 620 -520 {
lab=vss}
N 580 -600 580 -520 {
lab=vss}
N 580 -600 620 -600 {
lab=vss}
N 1040 -1020 1040 -960 {
lab=test}
N 1040 -600 1040 -520 {
lab=test}
N 1040 -600 1100 -600 {
lab=test}
N 1040 -1020 1250 -1020 {
lab=test}
N 1040 -960 1100 -960 {
lab=test}
N 1150 -870 1200 -920 {
lab=Pbd}
N 1150 -920 1200 -870 {
lab=#net3}
N 1040 -670 1040 -600 {
lab=test}
N 1040 -960 1040 -670 {
lab=test}
N 930 -670 1040 -670 {
lab=test}
N 1200 -870 1200 -820 {
lab=#net3}
N 1150 -870 1150 -640 {
lab=Pbd}
N 1200 -960 1200 -920 {
lab=Pbd}
N 1040 -520 1230 -520 {
lab=test}
N 1270 -560 1830 -560 {
lab=vdd}
N 1270 -480 1830 -480 {
lab=vss}
N 1290 -1060 1850 -1060 {
lab=vdd}
N 1290 -980 1850 -980 {
lab=vss}
N 1920 -1020 1940 -1020 {
lab=Pbd}
N 1200 -960 1920 -960 {
lab=Pbd}
N 1920 -1020 1920 -960 {
lab=Pbd}
N 1890 -1020 1920 -1020 {
lab=Pbd}
N 1200 -600 1900 -600 {
lab=Pnbd}
N 1900 -600 1900 -520 {
lab=Pnbd}
N 1900 -520 1920 -520 {
lab=Pnbd}
N 1870 -520 1900 -520 {
lab=Pnbd}
N 1200 -740 1200 -600 {
lab=Pnbd}
C {JNW_AVV_SKY130A/charge_pump.sym} 90 -40 0 0 {name=x1}
C {devices/lab_wire.sym} 150 -200 0 0 {name=p1 sig_type=std_logic lab=pbias}
C {devices/lab_wire.sym} 150 -160 0 0 {name=p2 sig_type=std_logic lab=nbias}
C {devices/ipin.sym} 110 -230 0 0 {name=p3 lab=src_n}
C {devices/ipin.sym} 110 -130 0 0 {name=p4 lab=snk}
C {devices/ipin.sym} 260 -320 0 0 {name=p6 lab=vdd}
C {devices/ipin.sym} 260 -40 0 0 {name=p7 lab=vss}
C {devices/ipin.sym} 410 -240 2 0 {name=p8 lab=preChrg}
C {devices/opin.sym} 410 -180 2 1 {name=p5 lab=vctrl}
C {devices/lab_wire.sym} 810 -240 0 0 {name=p32 sig_type=std_logic lab=pbias}
C {devices/lab_wire.sym} 640 -680 0 1 {name=p34 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 730 -30 0 1 {name=p35 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 850 -360 0 0 {name=p13 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 790 -80 0 0 {name=p14 sig_type=std_logic lab=nbias}
C {JNW_TR_SKY130A/JNWTR_RPPO16.sym} 640 -240 1 1 {name=x26 }
C {devices/vsource.sym} 640 -190 0 0 {name=v_nbias value=0 savecurrent=true}
C {devices/vsource.sym} 850 -180 0 0 {name=v_pbias value=0 savecurrent=true}
C {JNW_TR_SKY130A/JNWTR_RPPO16.sym} 640 -320 1 1 {name=x5 }
C {JNW_TR_SKY130A/JNWTR_RPPO16.sym} 640 -400 1 1 {name=x6 }
C {JNW_TR_SKY130A/JNWTR_RPPO16.sym} 640 -480 1 1 {name=x8 }
C {JNW_TR_SKY130A/JNWTR_RPPO16.sym} 640 -560 1 1 {name=x9 }
C {JNW_ATR_SKY130A/JNWATR_NCH_2C5F0.sym} 810 -80 0 0 {name=x2 }
C {JNW_ATR_SKY130A/JNWATR_NCH_2C5F0.sym} 680 -80 0 1 {name=x3 }
C {JNW_ATR_SKY130A/JNWATR_PCH_2C5F0.sym} 810 -300 0 0 {name=x4 }
C {JNW_TR_SKY130A/JNWTR_TGX2_CV.sym} 1210 -960 2 0 {name=x13 }
C {JNW_TR_SKY130A/JNWTR_TGX2_CV.sym} 1090 -600 0 0 {name=x14 }
C {devices/lab_wire.sym} 1180 -550 0 1 {name=p11 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 1120 -1010 2 0 {name=p12 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 1120 -920 0 0 {name=p15 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 1180 -640 0 1 {name=p16 sig_type=std_logic lab=vdd}
C {devices/opin.sym} 1940 -1020 2 1 {name=p18 lab=Pbd}
C {devices/opin.sym} 1920 -520 2 1 {name=p19 lab=Pnbd}
C {JNW_TR_SKY130A/JNWTR_IVX1_CV.sym} 1200 -740 3 0 {name=x15 }
C {devices/lab_wire.sym} 1160 -780 0 0 {name=p20 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 1240 -780 2 0 {name=p21 sig_type=std_logic lab=vss}
C {devices/ipin.sym} 930 -670 0 0 {name=p17 lab=test}
C {JNW_TR_SKY130A/JNWTR_IVX8_CV.sym} 1230 -520 0 0 {name=x7 }
C {JNW_TR_SKY130A/JNWTR_IVX8_CV.sym} 1310 -520 0 0 {name=x10 }
C {JNW_TR_SKY130A/JNWTR_IVX8_CV.sym} 1390 -520 0 0 {name=x11 }
C {JNW_TR_SKY130A/JNWTR_IVX8_CV.sym} 1470 -520 0 0 {name=x12 }
C {JNW_TR_SKY130A/JNWTR_IVX8_CV.sym} 1550 -520 0 0 {name=x16 }
C {JNW_TR_SKY130A/JNWTR_IVX8_CV.sym} 1630 -520 0 0 {name=x17 }
C {JNW_TR_SKY130A/JNWTR_IVX8_CV.sym} 1710 -520 0 0 {name=x18 }
C {JNW_TR_SKY130A/JNWTR_IVX8_CV.sym} 1790 -520 0 0 {name=x19 }
C {devices/lab_wire.sym} 1300 -560 0 1 {name=p9 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 1300 -480 0 1 {name=p10 sig_type=std_logic lab=vss}
C {JNW_TR_SKY130A/JNWTR_IVX8_CV.sym} 1250 -1020 0 0 {name=x20 }
C {JNW_TR_SKY130A/JNWTR_IVX8_CV.sym} 1330 -1020 0 0 {name=x21 }
C {JNW_TR_SKY130A/JNWTR_IVX8_CV.sym} 1410 -1020 0 0 {name=x22 }
C {JNW_TR_SKY130A/JNWTR_IVX8_CV.sym} 1490 -1020 0 0 {name=x23 }
C {JNW_TR_SKY130A/JNWTR_IVX8_CV.sym} 1570 -1020 0 0 {name=x24 }
C {JNW_TR_SKY130A/JNWTR_IVX8_CV.sym} 1650 -1020 0 0 {name=x25 }
C {JNW_TR_SKY130A/JNWTR_IVX8_CV.sym} 1730 -1020 0 0 {name=x27 }
C {JNW_TR_SKY130A/JNWTR_IVX8_CV.sym} 1810 -1020 0 0 {name=x28 }
C {devices/lab_wire.sym} 1320 -1060 0 1 {name=p22 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 1320 -980 0 1 {name=p23 sig_type=std_logic lab=vss}
