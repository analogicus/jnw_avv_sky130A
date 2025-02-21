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
N 420 -160 500 -160 {
lab=#net2}
N 790 -250 790 -160 {
lab=#net3}
N 320 -250 790 -250 {
lab=#net3}
N 320 -350 320 -250 {
lab=#net3}
N 410 -360 470 -360 {
lab=#net4}
N 780 -360 780 -220 {
lab=#net5}
N 330 -220 780 -220 {
lab=#net5}
N 330 -220 330 -170 {
lab=#net5}
N 780 -360 800 -360 {
lab=#net5}
N 540 -140 540 -90 {
lab=vss}
N 580 -160 790 -160 {
lab=#net3}
N 540 -90 690 -90 {
lab=vss}
N 510 -340 510 -290 {
lab=vss}
N 550 -360 780 -360 {
lab=#net5}
N 510 -290 660 -290 {
lab=vss}
N 790 -160 810 -160 {
lab=#net3}
N 880 -360 1040 -360 {
lab=out2}
N 970 -160 1010 -160 {
lab=out1}
N 930 -120 930 -90 {
lab=vss}
N 930 -90 990 -90 {
lab=vss}
N 840 -320 840 -290 {
lab=vss}
N 840 -290 960 -290 {
lab=vss}
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
C {JNW_TR_SKY130A/JNWTR_IVX1_CV.sym} 800 -360 0 0 {name=x34 }
C {devices/lab_wire.sym} 840 -320 3 0 {name=p19 sig_type=std_logic lab=vss
}
C {devices/lab_wire.sym} 840 -400 3 0 {name=p23 sig_type=std_logic lab=vdd}
C {JNW_TR_SKY130A/JNWTR_CAPX1.sym} 690 -100 0 0 {name=x1[4:0]}
C {devices/lab_wire.sym} 590 -90 3 0 {name=p45 sig_type=std_logic lab=vss
}
C {JNW_TR_SKY130A/JNWTR_CAPX1.sym} 660 -300 0 0 {name=x2[4:0]}
C {devices/lab_wire.sym} 560 -290 3 0 {name=p46 sig_type=std_logic lab=vss
}
C {JNW_TR_SKY130A/JNWTR_IVX1_CV.sym} 810 -160 0 0 {name=x32 }
C {devices/lab_wire.sym} 850 -120 3 0 {name=p47 sig_type=std_logic lab=vss
}
C {devices/lab_wire.sym} 850 -200 3 0 {name=p48 sig_type=std_logic lab=vdd}
C {JNW_TR_SKY130A/JNWTR_IVX1_CV.sym} 890 -160 0 0 {name=x35 }
C {devices/lab_wire.sym} 930 -120 3 0 {name=p51 sig_type=std_logic lab=vss
}
C {devices/lab_wire.sym} 930 -200 3 0 {name=p52 sig_type=std_logic lab=vdd}
C {JNW_TR_SKY130A/JNWTR_CAPX1.sym} 960 -300 0 0 {name=x3[2:0]}
C {JNW_TR_SKY130A/JNWTR_CAPX1.sym} 990 -100 0 0 {name=x4[2:0]}
C {JNW_TR_SKY130A/JNWTR_RPPO8.sym} 500 -160 0 0 {name=x31 }
C {JNW_TR_SKY130A/JNWTR_RPPO8.sym} 470 -360 0 0 {name=x30 }
C {devices/opin.sym} 1010 -160 0 0 {name=p1 lab=out1}
C {devices/opin.sym} 1040 -360 0 0 {name=p2 lab=out2}
C {devices/ipin.sym} 80 -430 0 0 {name=p3 lab=vss}
C {devices/ipin.sym} 80 -450 0 0 {name=p4 lab=vdd}
