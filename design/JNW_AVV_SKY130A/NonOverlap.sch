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
N 420 -160 450 -160 {
lab=#net2}
N 320 -250 1250 -250 {
lab=out1}
N 320 -350 320 -250 {
lab=out1}
N 330 -220 1240 -220 {
lab=#net3}
N 330 -220 330 -170 {
lab=#net3}
N 1290 -320 1290 -290 {
lab=vss}
N 490 -120 490 -90 {
lab=vss}
N 570 -120 570 -90 {
lab=vss}
N 650 -120 650 -90 {
lab=vss}
N 730 -120 730 -90 {
lab=vss}
N 810 -120 810 -90 {
lab=vss}
N 890 -120 890 -90 {
lab=vss}
N 1250 -250 1250 -160 {
lab=out1}
N 410 -360 440 -360 {
lab=#net4}
N 810 -90 890 -90 {
lab=vss}
N 490 -90 570 -90 {
lab=vss}
N 570 -90 650 -90 {
lab=vss}
N 650 -90 730 -90 {
lab=vss}
N 730 -90 810 -90 {
lab=vss}
N 480 -320 480 -290 {
lab=vss}
N 560 -320 560 -290 {
lab=vss}
N 640 -320 640 -290 {
lab=vss}
N 720 -320 720 -290 {
lab=vss}
N 800 -320 800 -290 {
lab=vss}
N 880 -320 880 -290 {
lab=vss}
N 800 -290 880 -290 {
lab=vss}
N 480 -290 560 -290 {
lab=vss}
N 560 -290 640 -290 {
lab=vss}
N 640 -290 720 -290 {
lab=vss}
N 720 -290 800 -290 {
lab=vss}
N 1240 -360 1240 -220 {
lab=#net3}
N 1250 -160 1350 -160 {
lab=out1}
N 1240 -360 1250 -360 {
lab=#net3}
N 1330 -360 1460 -360 {
lab=out2}
N 960 -320 960 -290 {
lab=vss}
N 1040 -320 1040 -290 {
lab=vss}
N 1040 -290 1120 -290 {
lab=vss}
N 880 -290 960 -290 {
lab=vss}
N 960 -290 1040 -290 {
lab=vss}
N 480 -400 1200 -400 {
lab=vdd}
N 970 -120 970 -90 {
lab=vss}
N 1050 -120 1050 -90 {
lab=vss}
N 1130 -120 1130 -90 {
lab=vss}
N 1050 -90 1130 -90 {
lab=vss}
N 890 -90 970 -90 {
lab=vss}
N 970 -90 1050 -90 {
lab=vss}
N 1210 -120 1210 -90 {
lab=vss}
N 1130 -90 1210 -90 {
lab=vss}
N 490 -200 1210 -200 {
lab=vdd}
N 1120 -290 1200 -290 {
lab=vss}
N 1120 -320 1120 -290 {
lab=vss}
N 1200 -320 1200 -290 {
lab=vss}
N 470 -630 550 -630 {
lab=#net5}
N 590 -610 590 -560 {
lab=vss}
N 630 -630 840 -630 {
lab=#net6}
N 590 -560 740 -560 {
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
C {JNW_TR_SKY130A/JNWTR_IVX1_CV.sym} 1250 -360 0 0 {name=x35 }
C {devices/lab_wire.sym} 1290 -320 3 0 {name=p51 sig_type=std_logic lab=vss
}
C {devices/lab_wire.sym} 1290 -400 3 0 {name=p52 sig_type=std_logic lab=vdd}
C {devices/opin.sym} 1350 -160 0 0 {name=p1 lab=out1}
C {devices/opin.sym} 1460 -360 0 0 {name=p2 lab=out2}
C {devices/ipin.sym} 80 -470 0 0 {name=p3 lab=vss}
C {devices/ipin.sym} 80 -490 0 0 {name=p4 lab=vdd}
C {JNW_TR_SKY130A/JNWTR_IVX1_CV.sym} 450 -160 0 0 {name=x1 }
C {devices/lab_wire.sym} 490 -90 0 0 {name=p5 sig_type=std_logic lab=vss
}
C {devices/lab_wire.sym} 490 -200 0 0 {name=p6 sig_type=std_logic lab=vdd}
C {JNW_TR_SKY130A/JNWTR_IVX1_CV.sym} 530 -160 0 0 {name=x2 }
C {JNW_TR_SKY130A/JNWTR_IVX1_CV.sym} 610 -160 0 0 {name=x3 }
C {JNW_TR_SKY130A/JNWTR_IVX1_CV.sym} 690 -160 0 0 {name=x4 }
C {JNW_TR_SKY130A/JNWTR_IVX1_CV.sym} 770 -160 0 0 {name=x5 }
C {JNW_TR_SKY130A/JNWTR_IVX1_CV.sym} 850 -160 0 0 {name=x6 }
C {JNW_TR_SKY130A/JNWTR_IVX1_CV.sym} 440 -360 0 0 {name=x7 }
C {devices/lab_wire.sym} 480 -290 0 0 {name=p7 sig_type=std_logic lab=vss
}
C {devices/lab_wire.sym} 480 -400 0 0 {name=p8 sig_type=std_logic lab=vdd}
C {JNW_TR_SKY130A/JNWTR_IVX1_CV.sym} 520 -360 0 0 {name=x8 }
C {JNW_TR_SKY130A/JNWTR_IVX1_CV.sym} 600 -360 0 0 {name=x9 }
C {JNW_TR_SKY130A/JNWTR_IVX1_CV.sym} 680 -360 0 0 {name=x10 }
C {JNW_TR_SKY130A/JNWTR_IVX1_CV.sym} 760 -360 0 0 {name=x11 }
C {JNW_TR_SKY130A/JNWTR_IVX1_CV.sym} 840 -360 0 0 {name=x12 }
C {JNW_TR_SKY130A/JNWTR_IVX1_CV.sym} 920 -360 0 0 {name=x14 }
C {JNW_TR_SKY130A/JNWTR_IVX1_CV.sym} 1000 -360 0 0 {name=x16 }
C {JNW_TR_SKY130A/JNWTR_IVX1_CV.sym} 1080 -360 0 0 {name=x18 }
C {JNW_TR_SKY130A/JNWTR_IVX1_CV.sym} 930 -160 0 0 {name=x19 }
C {JNW_TR_SKY130A/JNWTR_IVX1_CV.sym} 1010 -160 0 0 {name=x20 }
C {JNW_TR_SKY130A/JNWTR_IVX1_CV.sym} 1090 -160 0 0 {name=x21 }
C {JNW_TR_SKY130A/JNWTR_IVX1_CV.sym} 1170 -160 0 0 {name=x22 }
C {JNW_TR_SKY130A/JNWTR_IVX1_CV.sym} 1160 -360 0 0 {name=x23 }
C {JNW_TR_SKY130A/JNWTR_CAPX1.sym} 740 -570 0 0 {name=x1[6:0]}
C {devices/lab_wire.sym} 640 -560 3 0 {name=p45 sig_type=std_logic lab=vss
}
C {JNW_TR_SKY130A/JNWTR_RPPO8.sym} 550 -630 0 0 {name=x31 }
