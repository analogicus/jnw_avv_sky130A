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
N 440 -350 440 -300 {
lab=vctrl}
N 440 -300 440 -250 {
lab=vctrl}
N 440 -40 440 20 {
lab=vss}
N 350 -590 400 -590 {
lab=pbias}
N 350 -40 400 -40 {
lab=nbias}
N 630 -300 730 -300 {
lab=vctrl}
N 320 20 440 20 {
lab=vss}
N 440 -220 440 -70 {
lab=#net1}
N 440 -560 440 -380 {
lab=#net2}
N 240 -440 240 -420 {
lab=vdd}
N -340 -390 -340 -340 {
lab=src_n}
N -340 -340 -320 -340 {
lab=src_n}
N -350 -390 -340 -390 {
lab=src_n}
N -280 -440 -280 -380 {
lab=vdd}
N -280 -440 240 -440 {
lab=vdd}
N 200 -240 200 -220 {
lab=vdd}
N 200 -140 200 -100 {
lab=vss}
N -280 -190 -280 -140 {
lab=snk}
N -280 -190 160 -190 {
lab=snk}
N -280 -140 -260 -140 {
lab=snk}
N -290 -190 -280 -190 {
lab=snk}
N -220 -240 -220 -180 {
lab=vdd}
N -220 -240 200 -240 {
lab=vdd}
N 250 -180 290 -180 {
lab=snk_gate}
N 290 -220 290 -180 {
lab=snk_gate}
N -50 -100 200 -100 {
lab=vss}
N 70 -170 70 -140 {
lab=#net3}
N 70 -170 160 -170 {
lab=#net3}
N -180 -140 -90 -140 {
lab=#net4}
N 290 -380 400 -380 {
lab=src_n_gate}
N 290 -220 400 -220 {
lab=snk_gate}
N -10 -370 -10 -340 {
lab=and_input}
N -130 -300 240 -300 {
lab=vss}
N -130 -320 -130 -300 {
lab=vss}
N -280 -300 -130 -300 {
lab=vss}
N -240 -340 -170 -340 {
lab=#net5}
N 240 -340 240 -300 {
lab=vss}
N -340 -390 200 -390 {
lab=src_n}
N -10 -370 200 -370 {
lab=and_input}
N -90 -340 -10 -340 {
lab=and_input}
N 630 -300 630 -205 {
lab=vctrl}
N 590 -300 630 -300 {
lab=vctrl}
N 630 -135 630 20 {
lab=vss}
N 440 20 630 20 {
lab=vss}
N 630 -370 720 -370 {
lab=#net6}
N 800 -370 890 -370 {
lab=preChrg}
N 760 -430 760 -410 {
lab=vdd}
N 760 -430 810 -430 {
lab=vdd}
N 760 -330 760 -320 {
lab=vss}
N 760 -320 820 -320 {
lab=vss}
N -50 -120 -50 -100 {
lab=vss}
N -220 -100 -50 -100 {
lab=vss}
N -10 -140 70 -140 {
lab=#net3}
N 590 -340 590 -300 {
lab=vctrl}
N 440 -300 590 -300 {
lab=vctrl}
N 670 -440 670 -420 {
lab=vss}
N 690 -420 700 -420 {
lab=vss}
N 670 -990 670 -980 {
lab=vdd}
N 670 -990 700 -990 {
lab=vdd}
N 670 -420 690 -420 {
lab=vss}
N 670 -550 670 -520 {
lab=#net7}
N 670 -760 670 -710 {
lab=#net8}
N 590 -760 590 -370 {
lab=#net8}
N 590 -760 670 -760 {
lab=#net8}
N 690 -940 690 -420 {
lab=vss}
N 670 -820 670 -760 {
lab=#net8}
C {devices/ipin.sym} 320 -700 0 0 {name=p1 lab=vdd}
C {devices/opin.sym} 730 -300 0 0 {name=p2 lab=vctrl}
C {devices/ipin.sym} 320 20 0 0 {name=p3 lab=vss
}
C {JNW_ATR_SKY130A/JNWATR_PCH_4C1F2.sym} 400 -380 0 0 {name=x1 }
C {JNW_ATR_SKY130A/JNWATR_NCH_4C1F2.sym} 400 -220 0 0 {name=x3 }
C {devices/ipin.sym} 350 -40 0 0 {name=p6 lab=nbias
}
C {devices/ipin.sym} 350 -590 0 0 {name=p7 lab=pbias
}
C {JNW_TR_SKY130A/JNWTR_CAPX4.sym} 630 -145 0 0 {name=x5[4:0]}
C {devices/ipin.sym} 890 -370 2 0 {name=p10 lab=preChrg
}
C {devices/ipin.sym} -290 -190 0 0 {name=p9 lab=snk
}
C {devices/ipin.sym} -350 -390 0 0 {name=p11 lab=src_n}
C {JNW_TR_SKY130A/JNWTR_NDX1_CV.sym} 200 -370 0 0 {name=x6 }
C {devices/lab_wire.sym} 165 -240 0 1 {name=p14 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 165 -100 0 1 {name=p15 sig_type=std_logic lab=vss}
C {JNW_TR_SKY130A/JNWTR_ANX1_CV.sym} 160 -170 0 0 {name=x7 }
C {devices/lab_wire.sym} 385 -380 0 0 {name=p4 sig_type=std_logic lab=src_n_gate}
C {devices/lab_wire.sym} 385 -220 0 0 {name=p5 sig_type=std_logic lab=snk_gate}
C {JNW_TR_SKY130A/JNWTR_IVX8_CV.sym} -260 -140 0 0 {name=x9 }
C {JNW_TR_SKY130A/JNWTR_CAPX4.sym} 110 -110 0 0 {name=x1[1:0]}
C {devices/lab_wire.sym} 205 -300 0 1 {name=p12 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 195 -440 0 1 {name=p16 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 175 -370 0 0 {name=p18 sig_type=std_logic lab=and_input}
C {JNW_TR_SKY130A/JNWTR_IVX1_CV.sym} -320 -340 0 0 {name=x8 }
C {JNW_TR_SKY130A/JNWTR_CAPX4.sym} 30 -310 0 0 {name=x11[1:0]}
C {JNW_TR_SKY130A/JNWTR_RPPO4.sym} -170 -340 0 0 {name=x10 }
C {JNW_ATR_SKY130A/JNWATR_PCH_4C1F2.sym} 630 -370 0 1 {name=x5 }
C {JNW_TR_SKY130A/JNWTR_IVX1_CV.sym} 800 -370 0 1 {name=x11 }
C {devices/lab_wire.sym} 785 -430 0 1 {name=p8 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 785 -320 0 1 {name=p13 sig_type=std_logic lab=vss}
C {JNW_TR_SKY130A/JNWTR_RPPO4.sym} -90 -140 0 0 {name=x12 }
C {devices/lab_wire.sym} 675 -420 0 1 {name=p17 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 675 -990 0 1 {name=p19 sig_type=std_logic lab=vdd}
C {JNW_TR_SKY130A/JNWTR_RPPO16.sym} 670 -440 3 0 {name=x14 }
C {JNW_TR_SKY130A/JNWTR_RPPO16.sym} 670 -550 3 0 {name=x15 }
C {JNW_ATR_SKY130A/JNWATR_NCH_2C5F0.sym} 400 -40 0 0 {name=x4 }
C {JNW_ATR_SKY130A/JNWATR_PCH_8C5F0.sym} 400 -590 0 0 {name=x2 }
C {JNW_TR_SKY130A/JNWTR_RPPO16.sym} 670 -630 3 0 {name=x13 }
C {JNW_TR_SKY130A/JNWTR_RPPO2.sym} 670 -900 3 0 {name=x16 }
C {JNW_TR_SKY130A/JNWTR_RPPO4.sym} 670 -820 3 0 {name=x17 }
