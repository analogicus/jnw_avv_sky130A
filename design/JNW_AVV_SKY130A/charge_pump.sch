v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 320 -700 440 -700 {
lab=vdd}
N 440 -700 440 -590 {
lab=vdd}
N 440 -300 440 -250 {
lab=vctrl}
N 440 -40 440 20 {
lab=vss}
N 350 -590 400 -590 {
lab=pbias}
N 350 -40 400 -40 {
lab=nbias}
N 320 20 440 20 {
lab=vss}
N -10 -440 -10 -420 {
lab=vdd}
N -590 -390 -590 -340 {
lab=src_n}
N -600 -390 -590 -390 {
lab=src_n}
N -130 -260 -130 -240 {
lab=vdd}
N -130 -160 -130 -120 {
lab=vss}
N -610 -210 -610 -160 {
lab=snk}
N -610 -210 -170 -210 {
lab=snk}
N -620 -210 -610 -210 {
lab=snk}
N -380 -120 -130 -120 {
lab=vss}
N -260 -190 -260 -160 {
lab=xor_in_snk}
N -260 -190 -170 -190 {
lab=xor_in_snk}
N -260 -370 -260 -340 {
lab=xor_in_src}
N -380 -300 -10 -300 {
lab=vss}
N -380 -320 -380 -300 {
lab=vss}
N -10 -340 -10 -300 {
lab=vss}
N -590 -390 -50 -390 {
lab=src_n}
N -260 -370 -50 -370 {
lab=xor_in_src}
N -340 -340 -260 -340 {
lab=xor_in_src}
N -380 -140 -380 -120 {
lab=vss}
N -340 -160 -260 -160 {
lab=xor_in_snk}
N 440 -150 440 -70 {
lab=#net1}
N 440 -330 440 -300 {
lab=vctrl}
N 440 -560 440 -430 {
lab=#net2}
N 360 -350 400 -350 {
lab=vdd}
N 490 -170 520 -170 {
lab=vss}
N 520 -170 520 20 {
lab=vss}
N 360 -170 400 -170 {
lab=vdd}
N -590 -340 -420 -340 {
lab=src_n}
N -610 -160 -420 -160 {
lab=snk}
N -80 -200 400 -200 {
lab=snk_gate}
N 40 -380 400 -380 {
lab=src_n_gate}
N 560 -475 560 -300 {
lab=vctrl}
N 440 -300 560 -300 {
lab=vctrl}
N 560 -700 560 -545 {
lab=vdd}
N 440 -700 560 -700 {
lab=vdd}
N 720 -190 830 -190 {
lab=preChrg}
N -180 -260 -130 -260 {
lab=vdd}
N -70 -440 -10 -440 {
lab=vdd}
N 850 -570 850 -540 {
lab=#net3}
N 720 -160 750 -160 {
lab=vdd}
N 490 -350 530 -350 {
lab=vss}
N 600 -160 630 -160 {
lab=vss}
N 440 20 520 20 {
lab=vss}
N 680 -300 680 -240 {
lab=vctrl}
N 680 -300 820 -300 {
lab=vctrl}
N 560 -300 680 -300 {
lab=vctrl}
N 870 -560 870 -390 {
lab=vss}
N 910 -560 945 -560 {
lab=vss}
N 910 -560 910 -350 {
lab=vss}
N 870 -560 910 -560 {
lab=vss}
N 850 -790 850 -760 {
lab=#net4}
N 850 -1100 880 -1100 {
lab=vdd}
N 770 -450 850 -450 {
lab=Vpre}
N 680 -140 680 -100 {
lab=Vpre}
N 650 -100 680 -100 {
lab=Vpre}
N 850 -450 850 -430 {
lab=Vpre}
N 850 -680 850 -650 {
lab=#net5}
N 850 -460 850 -450 {
lab=Vpre}
N 850 -900 850 -870 {
lab=#net6}
N 870 -1040 870 -560 {
lab=vss}
N 850 -1000 850 -980 {
lab=#net7}
N 850 -1100 850 -1080 {
lab=vdd}
N 740 -390 870 -390 {
lab=vss}
N 720 -430 850 -430 {
lab=Vpre}
N 720 -350 910 -350 {
lab=vss}
C {devices/ipin.sym} 320 -700 0 0 {name=p1 lab=vdd}
C {devices/opin.sym} 820 -300 0 0 {name=p2 lab=vctrl}
C {devices/ipin.sym} 320 20 0 0 {name=p3 lab=vss
}
C {devices/ipin.sym} 350 -40 0 0 {name=p6 lab=nbias
}
C {devices/ipin.sym} 350 -590 0 0 {name=p7 lab=pbias
}
C {JNW_TR_SKY130A/JNWTR_CAPX4.sym} 560 -485 0 0 {name=x5[30:0]}
C {devices/ipin.sym} 830 -190 2 0 {name=p10 lab=preChrg
}
C {devices/ipin.sym} -620 -210 0 0 {name=p9 lab=snk
}
C {devices/ipin.sym} -600 -390 0 0 {name=p11 lab=src_n}
C {devices/lab_wire.sym} -165 -260 0 1 {name=p14 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} -165 -120 0 1 {name=p15 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 145 -380 0 0 {name=p4 sig_type=std_logic lab=src_n_gate}
C {devices/lab_wire.sym} 35 -200 0 0 {name=p5 sig_type=std_logic lab=snk_gate}
C {devices/lab_wire.sym} -45 -300 0 1 {name=p12 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} -55 -440 0 1 {name=p16 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} -75 -370 0 0 {name=p18 sig_type=std_logic lab=xor_in_src}
C {JNW_TR_SKY130A/JNWTR_RPPO4.sym} -420 -340 0 0 {name=x10 }
C {devices/lab_wire.sym} 745 -160 0 0 {name=p8 sig_type=std_logic lab=vdd}
C {JNW_TR_SKY130A/JNWTR_RPPO4.sym} -420 -160 0 0 {name=x12 }
C {devices/lab_wire.sym} 855 -1100 0 1 {name=p19 sig_type=std_logic lab=vdd}
C {JNW_TR_SKY130A/JNWTR_RPPO16.sym} 850 -790 3 0 {name=x14 }
C {JNW_TR_SKY130A/JNWTR_RPPO16.sym} 850 -460 3 0 {name=x15 }
C {JNW_ATR_SKY130A/JNWATR_NCH_2C5F0.sym} 400 -40 0 0 {name=x4 }
C {JNW_TR_SKY130A/JNWTR_RPPO16.sym} 850 -570 3 0 {name=x13 }
C {devices/lab_wire.sym} 505 -350 0 1 {name=p21 sig_type=std_logic lab=vss}
C {JNW_TR_SKY130A/JNWTR_RPPO16.sym} 850 -680 3 0 {name=x16 }
C {JNW_TR_SKY130A/JNWTR_CAPX1.sym} -200 -310 0 0 {name=x18[6:0]}
C {JNW_TR_SKY130A/JNWTR_CAPX1.sym} -230 -130 0 0 {name=x1[6:0]}
C {JNW_TR_SKY130A/JNWTR_TGX2_CV.sym} 440 -440 3 1 {name=x3 }
C {JNW_TR_SKY130A/JNWTR_TGX2_CV.sym} 440 -260 3 1 {name=x19 }
C {devices/lab_wire.sym} 375 -350 0 1 {name=p22 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 365 -170 0 1 {name=p23 sig_type=std_logic lab=vdd}
C {JNW_AVV_SKY130A/xor.sym} -10 -380 0 0 {name=x6}
C {JNW_AVV_SKY130A/xor.sym} -130 -200 0 0 {name=x7}
C {devices/lab_wire.sym} -185 -190 0 0 {name=p24 sig_type=std_logic lab=xor_in_snk}
C {JNW_TR_SKY130A/JNWTR_TGX2_CV.sym} 680 -250 1 0 {name=x2 }
C {devices/lab_wire.sym} 945 -560 0 1 {name=p17 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 625 -160 0 0 {name=p25 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 775 -450 0 0 {name=p13 sig_type=std_logic lab=Vpre}
C {devices/lab_wire.sym} 675 -100 0 0 {name=p20 sig_type=std_logic lab=Vpre}
C {JNW_TR_SKY130A/JNWTR_RPPO2.sym} 850 -350 3 0 {name=x5 }
C {JNW_TR_SKY130A/JNWTR_RPPO2.sym} 800 -350 3 0 {name=x8 }
C {JNW_TR_SKY130A/JNWTR_RPPO16.sym} 850 -900 3 0 {name=x9 }
C {JNW_TR_SKY130A/JNWTR_RPPO2.sym} 760 -350 3 0 {name=x11 }
C {JNW_TR_SKY130A/JNWTR_RPPO16.sym} 850 -1000 3 0 {name=x17 }
C {JNW_TR_SKY130A/JNWTR_RPPO2.sym} 720 -350 3 0 {name=x18 }
C {JNW_ATR_SKY130A/JNWATR_PCH_2C5F0.sym} 400 -590 0 0 {name=x1 }
