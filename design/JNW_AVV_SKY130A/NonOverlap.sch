v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 170 -220 170 -150 {
lab=#net1}
N 170 -150 330 -150 {
lab=#net1}
N 170 -370 320 -370 {
lab=in}
N 170 -370 170 -300 {
lab=in}
N 80 -370 170 -370 {
lab=in}
N 320 -250 2520 -250 {
lab=out1}
N 320 -350 320 -250 {
lab=out1}
N 330 -220 330 -170 {
lab=#net2}
N 2560 -320 2560 -290 {
lab=vss}
N 2520 -250 2520 -160 {
lab=out1}
N 2510 -360 2510 -220 {
lab=#net2}
N 2520 -160 2700 -160 {
lab=out1}
N 2510 -360 2520 -360 {
lab=#net2}
N 330 -220 2510 -220 {
lab=#net2}
N 1110 -640 1110 -590 {
lab=vss}
N 1110 -590 1260 -590 {
lab=vss}
N 2660 -120 2660 -90 {
lab=vss}
N 2700 -160 2780 -170 {
lab=out1}
N 580 -320 580 -290 {
lab=vss}
N 660 -320 660 -290 {
lab=vss}
N 580 -120 580 -90 {
lab=vss}
N 660 -120 660 -90 {
lab=vss}
N 420 -160 540 -160 {
lab=#net3}
N 410 -360 540 -360 {
lab=#net4}
N 2600 -360 2730 -360 {
lab=out2}
N 740 -320 740 -290 {
lab=vss}
N 820 -320 820 -290 {
lab=vss}
N 740 -120 740 -90 {
lab=vss}
N 820 -120 820 -90 {
lab=vss}
N 900 -320 900 -290 {
lab=vss}
N 980 -320 980 -290 {
lab=vss}
N 1060 -320 1060 -290 {
lab=vss}
N 1140 -320 1140 -290 {
lab=vss}
N 900 -120 900 -90 {
lab=vss}
N 980 -120 980 -90 {
lab=vss}
N 1060 -120 1060 -90 {
lab=vss}
N 1140 -120 1140 -90 {
lab=vss}
N 1220 -320 1220 -290 {
lab=vss}
N 1300 -320 1300 -290 {
lab=vss}
N 1380 -320 1380 -290 {
lab=vss}
N 1460 -320 1460 -290 {
lab=vss}
N 1540 -320 1540 -290 {
lab=vss}
N 1620 -320 1620 -290 {
lab=vss}
N 1700 -320 1700 -290 {
lab=vss}
N 1780 -320 1780 -290 {
lab=vss}
N 1220 -120 1220 -90 {
lab=vss}
N 1300 -120 1300 -90 {
lab=vss}
N 1380 -120 1380 -90 {
lab=vss}
N 1460 -120 1460 -90 {
lab=vss}
N 1540 -120 1540 -90 {
lab=vss}
N 1620 -120 1620 -90 {
lab=vss}
N 1700 -120 1700 -90 {
lab=vss}
N 1780 -120 1780 -90 {
lab=vss}
N 1820 -160 2520 -160 {
lab=out1}
N 1820 -360 2510 -360 {
lab=#net2}
C {JNW_TR_SKY130A/JNWTR_NDX1_CV.sym} 330 -150 0 0 {name=x13 }
C {devices/lab_wire.sym} 370 -200 0 0 {name=p26 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 370 -120 0 0 {name=p27 sig_type=std_logic lab=vss
}
C {JNW_TR_SKY130A/JNWTR_NDX1_CV.sym} 320 -350 0 0 {name=x15 }
C {devices/lab_wire.sym} 360 -400 0 0 {name=p28 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 360 -320 0 0 {name=p30 sig_type=std_logic lab=vss
}
C {JNW_TR_SKY130A/JNWTR_IVX1_CV.sym} 170 -300 1 0 {name=x17 }
C {devices/lab_wire.sym} 130 -260 0 0 {name=p31 sig_type=std_logic lab=vss
}
C {devices/lab_wire.sym} 210 -260 0 0 {name=p33 sig_type=std_logic lab=vdd}
C {devices/ipin.sym} 80 -370 0 0 {name=p35 lab=in}
C {devices/lab_wire.sym} 2560 -320 3 0 {name=p51 sig_type=std_logic lab=vss
}
C {devices/lab_wire.sym} 2560 -400 3 0 {name=p52 sig_type=std_logic lab=vdd}
C {devices/opin.sym} 2780 -170 0 0 {name=p1 lab=out1}
C {devices/opin.sym} 2730 -360 0 0 {name=p2 lab=out2}
C {devices/ipin.sym} 80 -470 0 0 {name=p3 lab=vss}
C {devices/ipin.sym} 80 -490 0 0 {name=p4 lab=vdd}
C {JNW_TR_SKY130A/JNWTR_CAPX1.sym} 1260 -600 0 0 {name=x1[3:0]}
C {devices/lab_wire.sym} 1160 -590 3 0 {name=p45 sig_type=std_logic lab=vss
}
C {JNW_TR_SKY130A/JNWTR_RPPO4.sym} 1070 -660 0 0 {name=x31 }
C {devices/lab_wire.sym} 2660 -120 3 0 {name=p8 sig_type=std_logic lab=vss
}
C {devices/lab_wire.sym} 2660 -200 3 0 {name=p9 sig_type=std_logic lab=vdd}
C {JNW_TR_SKY130A/JNWTR_IVX1_CV.sym} 540 -360 0 0 {name=x1 }
C {devices/lab_wire.sym} 580 -320 3 0 {name=p5 sig_type=std_logic lab=vss
}
C {devices/lab_wire.sym} 580 -400 3 0 {name=p10 sig_type=std_logic lab=vdd}
C {JNW_TR_SKY130A/JNWTR_IVX1_CV.sym} 620 -360 0 0 {name=x4 }
C {devices/lab_wire.sym} 660 -320 3 0 {name=p11 sig_type=std_logic lab=vss
}
C {devices/lab_wire.sym} 660 -400 3 0 {name=p12 sig_type=std_logic lab=vdd}
C {JNW_TR_SKY130A/JNWTR_IVX1_CV.sym} 540 -160 0 0 {name=x22 }
C {devices/lab_wire.sym} 580 -120 3 0 {name=p49 sig_type=std_logic lab=vss
}
C {devices/lab_wire.sym} 580 -200 3 0 {name=p50 sig_type=std_logic lab=vdd}
C {JNW_TR_SKY130A/JNWTR_IVX1_CV.sym} 620 -160 0 0 {name=x23 }
C {devices/lab_wire.sym} 660 -120 3 0 {name=p53 sig_type=std_logic lab=vss
}
C {devices/lab_wire.sym} 660 -200 3 0 {name=p54 sig_type=std_logic lab=vdd}
C {JNW_TR_SKY130A/JNWTR_IVX1_CV.sym} 700 -360 0 0 {name=x2 }
C {devices/lab_wire.sym} 740 -320 3 0 {name=p6 sig_type=std_logic lab=vss
}
C {devices/lab_wire.sym} 740 -400 3 0 {name=p7 sig_type=std_logic lab=vdd}
C {JNW_TR_SKY130A/JNWTR_IVX1_CV.sym} 780 -360 0 0 {name=x3 }
C {devices/lab_wire.sym} 820 -320 3 0 {name=p13 sig_type=std_logic lab=vss
}
C {devices/lab_wire.sym} 820 -400 3 0 {name=p14 sig_type=std_logic lab=vdd}
C {JNW_TR_SKY130A/JNWTR_IVX1_CV.sym} 700 -160 0 0 {name=x5 }
C {devices/lab_wire.sym} 740 -120 3 0 {name=p15 sig_type=std_logic lab=vss
}
C {devices/lab_wire.sym} 740 -200 3 0 {name=p16 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 820 -120 3 0 {name=p17 sig_type=std_logic lab=vss
}
C {devices/lab_wire.sym} 820 -200 3 0 {name=p18 sig_type=std_logic lab=vdd}
C {JNW_TR_SKY130A/JNWTR_IVX4_CV.sym} 2520 -360 0 0 {name=x7 }
C {JNW_TR_SKY130A/JNWTR_IVX1_CV.sym} 780 -160 0 0 {name=x6 }
C {JNW_TR_SKY130A/JNWTR_IVX1_CV.sym} 860 -360 0 0 {name=x8 }
C {devices/lab_wire.sym} 900 -320 3 0 {name=p19 sig_type=std_logic lab=vss
}
C {devices/lab_wire.sym} 900 -400 3 0 {name=p20 sig_type=std_logic lab=vdd}
C {JNW_TR_SKY130A/JNWTR_IVX1_CV.sym} 940 -360 0 0 {name=x9 }
C {devices/lab_wire.sym} 980 -320 3 0 {name=p21 sig_type=std_logic lab=vss
}
C {devices/lab_wire.sym} 980 -400 3 0 {name=p22 sig_type=std_logic lab=vdd}
C {JNW_TR_SKY130A/JNWTR_IVX1_CV.sym} 1020 -360 0 0 {name=x10 }
C {devices/lab_wire.sym} 1060 -320 3 0 {name=p23 sig_type=std_logic lab=vss
}
C {devices/lab_wire.sym} 1060 -400 3 0 {name=p24 sig_type=std_logic lab=vdd}
C {JNW_TR_SKY130A/JNWTR_IVX1_CV.sym} 1100 -360 0 0 {name=x11 }
C {devices/lab_wire.sym} 1140 -320 3 0 {name=p25 sig_type=std_logic lab=vss
}
C {devices/lab_wire.sym} 1140 -400 3 0 {name=p29 sig_type=std_logic lab=vdd}
C {JNW_TR_SKY130A/JNWTR_IVX1_CV.sym} 860 -160 0 0 {name=x12 }
C {devices/lab_wire.sym} 900 -120 3 0 {name=p32 sig_type=std_logic lab=vss
}
C {devices/lab_wire.sym} 900 -200 3 0 {name=p34 sig_type=std_logic lab=vdd}
C {JNW_TR_SKY130A/JNWTR_IVX1_CV.sym} 940 -160 0 0 {name=x14 }
C {devices/lab_wire.sym} 980 -120 3 0 {name=p36 sig_type=std_logic lab=vss
}
C {devices/lab_wire.sym} 980 -200 3 0 {name=p37 sig_type=std_logic lab=vdd}
C {JNW_TR_SKY130A/JNWTR_IVX1_CV.sym} 1020 -160 0 0 {name=x16 }
C {devices/lab_wire.sym} 1060 -120 3 0 {name=p38 sig_type=std_logic lab=vss
}
C {devices/lab_wire.sym} 1060 -200 3 0 {name=p39 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 1140 -120 3 0 {name=p40 sig_type=std_logic lab=vss
}
C {devices/lab_wire.sym} 1140 -200 3 0 {name=p41 sig_type=std_logic lab=vdd}
C {JNW_TR_SKY130A/JNWTR_IVX1_CV.sym} 1180 -360 0 0 {name=x19 }
C {devices/lab_wire.sym} 1220 -320 3 0 {name=p42 sig_type=std_logic lab=vss
}
C {devices/lab_wire.sym} 1220 -400 3 0 {name=p43 sig_type=std_logic lab=vdd}
C {JNW_TR_SKY130A/JNWTR_IVX1_CV.sym} 1260 -360 0 0 {name=x20 }
C {devices/lab_wire.sym} 1300 -320 3 0 {name=p44 sig_type=std_logic lab=vss
}
C {devices/lab_wire.sym} 1300 -400 3 0 {name=p46 sig_type=std_logic lab=vdd}
C {JNW_TR_SKY130A/JNWTR_IVX1_CV.sym} 1340 -360 0 0 {name=x21 }
C {devices/lab_wire.sym} 1380 -320 3 0 {name=p47 sig_type=std_logic lab=vss
}
C {devices/lab_wire.sym} 1380 -400 3 0 {name=p48 sig_type=std_logic lab=vdd}
C {JNW_TR_SKY130A/JNWTR_IVX1_CV.sym} 1420 -360 0 0 {name=x24 }
C {devices/lab_wire.sym} 1460 -320 3 0 {name=p55 sig_type=std_logic lab=vss
}
C {devices/lab_wire.sym} 1460 -400 3 0 {name=p56 sig_type=std_logic lab=vdd}
C {JNW_TR_SKY130A/JNWTR_IVX1_CV.sym} 1500 -360 0 0 {name=x25 }
C {devices/lab_wire.sym} 1540 -320 3 0 {name=p57 sig_type=std_logic lab=vss
}
C {devices/lab_wire.sym} 1540 -400 3 0 {name=p58 sig_type=std_logic lab=vdd}
C {JNW_TR_SKY130A/JNWTR_IVX1_CV.sym} 1580 -360 0 0 {name=x26 }
C {devices/lab_wire.sym} 1620 -320 3 0 {name=p59 sig_type=std_logic lab=vss
}
C {devices/lab_wire.sym} 1620 -400 3 0 {name=p60 sig_type=std_logic lab=vdd}
C {JNW_TR_SKY130A/JNWTR_IVX1_CV.sym} 1660 -360 0 0 {name=x27 }
C {devices/lab_wire.sym} 1700 -320 3 0 {name=p61 sig_type=std_logic lab=vss
}
C {devices/lab_wire.sym} 1700 -400 3 0 {name=p62 sig_type=std_logic lab=vdd}
C {JNW_TR_SKY130A/JNWTR_IVX1_CV.sym} 1740 -360 0 0 {name=x28 }
C {devices/lab_wire.sym} 1780 -320 3 0 {name=p63 sig_type=std_logic lab=vss
}
C {devices/lab_wire.sym} 1780 -400 3 0 {name=p64 sig_type=std_logic lab=vdd}
C {JNW_TR_SKY130A/JNWTR_IVX1_CV.sym} 1180 -160 0 0 {name=x29 }
C {devices/lab_wire.sym} 1220 -120 3 0 {name=p65 sig_type=std_logic lab=vss
}
C {devices/lab_wire.sym} 1220 -200 3 0 {name=p66 sig_type=std_logic lab=vdd}
C {JNW_TR_SKY130A/JNWTR_IVX1_CV.sym} 1260 -160 0 0 {name=x30 }
C {devices/lab_wire.sym} 1300 -120 3 0 {name=p67 sig_type=std_logic lab=vss
}
C {devices/lab_wire.sym} 1300 -200 3 0 {name=p68 sig_type=std_logic lab=vdd}
C {JNW_TR_SKY130A/JNWTR_IVX1_CV.sym} 1340 -160 0 0 {name=x32 }
C {devices/lab_wire.sym} 1380 -120 3 0 {name=p69 sig_type=std_logic lab=vss
}
C {devices/lab_wire.sym} 1380 -200 3 0 {name=p70 sig_type=std_logic lab=vdd}
C {JNW_TR_SKY130A/JNWTR_IVX1_CV.sym} 1420 -160 0 0 {name=x33 }
C {devices/lab_wire.sym} 1460 -120 3 0 {name=p71 sig_type=std_logic lab=vss
}
C {devices/lab_wire.sym} 1460 -200 3 0 {name=p72 sig_type=std_logic lab=vdd}
C {JNW_TR_SKY130A/JNWTR_IVX1_CV.sym} 1500 -160 0 0 {name=x34 }
C {devices/lab_wire.sym} 1540 -120 3 0 {name=p73 sig_type=std_logic lab=vss
}
C {devices/lab_wire.sym} 1540 -200 3 0 {name=p74 sig_type=std_logic lab=vdd}
C {JNW_TR_SKY130A/JNWTR_IVX1_CV.sym} 1580 -160 0 0 {name=x35 }
C {devices/lab_wire.sym} 1620 -120 3 0 {name=p75 sig_type=std_logic lab=vss
}
C {devices/lab_wire.sym} 1620 -200 3 0 {name=p76 sig_type=std_logic lab=vdd}
C {JNW_TR_SKY130A/JNWTR_IVX1_CV.sym} 1660 -160 0 0 {name=x36 }
C {devices/lab_wire.sym} 1700 -120 3 0 {name=p77 sig_type=std_logic lab=vss
}
C {devices/lab_wire.sym} 1700 -200 3 0 {name=p78 sig_type=std_logic lab=vdd}
C {JNW_TR_SKY130A/JNWTR_IVX1_CV.sym} 1100 -160 0 0 {name=x37 }
C {devices/lab_wire.sym} 1780 -120 3 0 {name=p79 sig_type=std_logic lab=vss
}
C {devices/lab_wire.sym} 1780 -200 3 0 {name=p80 sig_type=std_logic lab=vdd}
C {JNW_TR_SKY130A/JNWTR_IVX4_CV.sym} 1740 -160 0 0 {name=x38 }
