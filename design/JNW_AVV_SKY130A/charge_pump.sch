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
N 260 -40 260 20 {
lab=vss}
N 350 -590 400 -590 {
lab=pbias}
N 190 -40 220 -40 {
lab=nbias}
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
N 600 -475 600 -300 {
lab=vctrl}
N 600 -700 600 -545 {
lab=vdd}
N 440 -700 600 -700 {
lab=vdd}
N 720 -190 830 -190 {
lab=preChrg}
N -180 -260 -130 -260 {
lab=vdd}
N -70 -440 -10 -440 {
lab=vdd}
N 850 -570 850 -540 {
lab=#net1}
N 720 -160 750 -160 {
lab=vdd}
N 600 -160 630 -160 {
lab=vss}
N 680 -300 680 -240 {
lab=vctrl}
N 680 -300 820 -300 {
lab=vctrl}
N 600 -300 680 -300 {
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
lab=#net2}
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
lab=#net3}
N 850 -460 850 -450 {
lab=Vpre}
N 850 -900 850 -870 {
lab=#net4}
N 870 -1040 870 -560 {
lab=vss}
N 850 -1000 850 -980 {
lab=#net5}
N 850 -1100 850 -1080 {
lab=vdd}
N 740 -390 870 -390 {
lab=vss}
N 720 -430 850 -430 {
lab=Vpre}
N 720 -350 910 -350 {
lab=vss}
N 260 -380 440 -380 {
lab=vdd}
N 260 -460 260 -410 {
lab=#net6}
N 260 -460 440 -460 {
lab=#net6}
N 440 -560 440 -460 {
lab=#net6}
N 260 -350 260 -300 {
lab=vctrl}
N 260 -300 600 -300 {
lab=vctrl}
N 40 -380 220 -380 {
lab=src_n_gate}
N 440 -460 440 -410 {
lab=#net6}
N 440 -350 440 -330 {
lab=vss}
N 440 -330 500 -330 {
lab=vss}
N 480 -380 505 -380 {
lab=srcxor}
N -30 20 260 20 {
lab=vss}
N 260 -110 260 -70 {
lab=#net7}
N 260 -300 260 -230 {
lab=vctrl}
N 260 -200 370 -200 {
lab=vss}
N 370 -170 370 -110 {
lab=#net7}
N 260 -110 370 -110 {
lab=#net7}
N 260 -170 260 -110 {
lab=#net7}
N 370 -250 370 -230 {
lab=vss}
N 370 -250 420 -250 {
lab=vss}
N 410 -200 460 -200 {
lab=snkxor}
N 105 -260 120 -260 {
lab=vss}
N 120 -340 135 -340 {
lab=vdd}
N 40 -380 40 -300 {
lab=src_n_gate}
N 40 -300 80 -300 {
lab=src_n_gate}
N 160 -300 210 -300 {
lab=srcxor}
N -80 -200 10 -200 {
lab=snkxor}
N 90 -200 220 -200 {
lab=snk_gate}
N 10 -240 50 -240 {
lab=vdd}
N 10 -160 50 -160 {
lab=vss}
N -500 -380 -470 -380 {
lab=vdd}
N -590 -340 -540 -340 {
lab=src_n}
N -460 -340 -420 -340 {
lab=#net8}
N -480 -160 -420 -160 {
lab=#net9}
N -610 -160 -560 -160 {
lab=snk}
N -520 -120 -480 -120 {
lab=vss}
N -520 -200 -480 -200 {
lab=vdd}
N -500 -300 -470 -300 {
lab=vss}
C {devices/ipin.sym} 320 -700 0 0 {name=p1 lab=vdd}
C {devices/opin.sym} 820 -300 0 0 {name=p2 lab=vctrl}
C {devices/ipin.sym} -30 20 0 0 {name=p3 lab=vss
}
C {devices/ipin.sym} 190 -40 0 0 {name=p6 lab=nbias
}
C {devices/ipin.sym} 350 -590 0 0 {name=p7 lab=pbias
}
C {JNW_TR_SKY130A/JNWTR_CAPX4.sym} 600 -485 0 0 {name=x5[30:0]}
C {devices/ipin.sym} 830 -190 2 0 {name=p10 lab=preChrg
}
C {devices/ipin.sym} -620 -210 0 0 {name=p9 lab=snk
}
C {devices/ipin.sym} -600 -390 0 0 {name=p11 lab=src_n}
C {devices/lab_wire.sym} -165 -260 0 1 {name=p14 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} -165 -120 0 1 {name=p15 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 195 -380 0 0 {name=p4 sig_type=std_logic lab=src_n_gate}
C {devices/lab_wire.sym} 185 -200 0 0 {name=p5 sig_type=std_logic lab=snk_gate}
C {devices/lab_wire.sym} -45 -300 0 1 {name=p12 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} -55 -440 0 1 {name=p16 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} -75 -370 0 0 {name=p18 sig_type=std_logic lab=xor_in_src}
C {devices/lab_wire.sym} 745 -160 0 0 {name=p8 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 855 -1100 0 1 {name=p19 sig_type=std_logic lab=vdd}
C {JNW_TR_SKY130A/JNWTR_RPPO16.sym} 850 -790 3 0 {name=x14 }
C {JNW_TR_SKY130A/JNWTR_RPPO16.sym} 850 -460 3 0 {name=x15 }
C {JNW_ATR_SKY130A/JNWATR_NCH_2C5F0.sym} 220 -40 0 0 {name=x4 }
C {JNW_TR_SKY130A/JNWTR_RPPO16.sym} 850 -570 3 0 {name=x13 }
C {JNW_TR_SKY130A/JNWTR_RPPO16.sym} 850 -680 3 0 {name=x16 }
C {JNW_TR_SKY130A/JNWTR_CAPX1.sym} -200 -310 0 0 {name=x18[10:0]}
C {JNW_TR_SKY130A/JNWTR_CAPX1.sym} -230 -130 0 0 {name=x1[10:0]}
C {devices/lab_wire.sym} 285 -380 0 1 {name=p22 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} -185 -190 0 0 {name=p24 sig_type=std_logic lab=xor_in_snk}
C {JNW_TR_SKY130A/JNWTR_TGX2_CV.sym} 680 -250 1 0 {name=x2 }
C {devices/lab_wire.sym} 945 -560 0 1 {name=p17 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 625 -160 0 0 {name=p25 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 775 -450 0 0 {name=p13 sig_type=std_logic lab=Vpre}
C {devices/lab_wire.sym} 675 -100 0 0 {name=p20 sig_type=std_logic lab=Vpre}
C {JNW_TR_SKY130A/JNWTR_RPPO2.sym} 850 -350 3 0 {name=x5 }
C {JNW_TR_SKY130A/JNWTR_RPPO2.sym} 800 -350 3 0 {name=x8 }
C {JNW_TR_SKY130A/JNWTR_RPPO16.sym} 850 -900 3 0 {name=x9 }
C {JNW_TR_SKY130A/JNWTR_RPPO16.sym} 850 -1000 3 0 {name=x17 }
C {JNW_ATR_SKY130A/JNWATR_PCH_4C5F0.sym} 400 -590 0 0 {name=x20 }
C {JNW_TR_SKY130A/JNWTR_IVX1_CV.sym} 80 -300 0 0 {name=x3 }
C {JNW_ATR_SKY130A/JNWATR_PCH_2C1F2.sym} 220 -380 0 0 {name=x12 }
C {JNW_ATR_SKY130A/JNWATR_NCH_2C1F2.sym} 220 -200 0 0 {name=x19 }
C {devices/lab_wire.sym} 135 -340 0 1 {name=p21 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 105 -260 0 0 {name=p23 sig_type=std_logic lab=vss}
C {JNW_TR_SKY130A/JNWTR_RPPO8.sym} -420 -160 0 0 {name=x1 }
C {JNW_TR_SKY130A/JNWTR_RPPO8.sym} -420 -340 0 0 {name=x10 }
C {JNW_ATR_SKY130A/JNWATR_PCH_2C1F2.sym} 480 -380 0 1 {name=x21 }
C {devices/lab_wire.sym} 495 -330 0 0 {name=p26 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 205 -300 0 0 {name=p27 sig_type=std_logic lab=srcxor}
C {JNW_TR_SKY130A/JNWTR_IVX1_CV.sym} 10 -200 0 0 {name=x22 }
C {devices/lab_wire.sym} 505 -380 0 1 {name=p28 sig_type=std_logic lab=srcxor}
C {devices/lab_wire.sym} -55 -200 0 1 {name=p30 sig_type=std_logic lab=snkxor}
C {JNW_ATR_SKY130A/JNWATR_NCH_2C1F2.sym} 410 -200 0 1 {name=x23 }
C {devices/lab_wire.sym} 325 -200 0 0 {name=p31 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 405 -250 0 0 {name=p32 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 435 -200 0 1 {name=p33 sig_type=std_logic lab=snkxor}
C {JNW_TR_SKY130A/JNWTR_NDX1_CV.sym} -50 -370 0 0 {name=x6 }
C {JNW_TR_SKY130A/JNWTR_NDX1_CV.sym} -170 -190 0 0 {name=x7 }
C {devices/lab_wire.sym} 35 -160 0 0 {name=p34 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 15 -240 0 1 {name=p35 sig_type=std_logic lab=vdd}
C {JNW_TR_SKY130A/JNWTR_IVX1_CV.sym} -560 -160 0 0 {name=x24 }
C {JNW_TR_SKY130A/JNWTR_IVX1_CV.sym} -540 -340 0 0 {name=x25 }
C {devices/lab_wire.sym} -505 -120 0 1 {name=p29 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} -485 -300 0 1 {name=p36 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} -495 -200 0 1 {name=p37 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} -485 -380 0 1 {name=p38 sig_type=std_logic lab=vdd}
