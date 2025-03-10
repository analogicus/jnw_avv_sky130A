v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 320 -830 440 -830 {
lab=vdd}
N 440 -830 440 -770 {
lab=vdd}
N 260 140 260 180 {
lab=vss}
N 350 -770 400 -770 {
lab=pbias}
N 190 140 220 140 {
lab=nbias}
N 880 -770 960 -770 {
lab=Vpre}
N 260 -350 260 -300 {
lab=#net1}
N 440 -350 440 -330 {
lab=vss}
N 440 -330 500 -330 {
lab=vss}
N 480 -380 505 -380 {
lab=src}
N 370 -250 370 -230 {
lab=vdd}
N 370 -250 420 -250 {
lab=vdd}
N 410 -200 460 -200 {
lab=snk_gate_n}
N 260 90 260 120 {
lab=#net2}
N 440 -740 440 -700 {
lab=#net3}
N 880 -490 880 -410 {
lab=vss}
N 920 -490 990 -490 {
lab=preChrg}
N 880 -550 880 -520 {
lab=#net4}
N 880 -640 880 -610 {
lab=#net5}
N 880 -410 950 -410 {
lab=vss}
N 860 -410 880 -410 {
lab=vss}
N 880 -1120 880 -1090 {
lab=#net6}
N 880 -1250 880 -1200 {
lab=vdd}
N 880 -1250 940 -1250 {
lab=vdd}
N 860 -1160 860 -410 {
lab=vss}
N 880 -1010 880 -980 {
lab=#net7}
N 880 -770 880 -720 {
lab=Vpre}
N 260 -300 260 -290 {
lab=#net1}
N 260 -600 440 -600 {
lab=#net8}
N 440 -640 440 -600 {
lab=#net8}
N -30 180 260 180 {
lab=vss}
N 440 -830 600 -830 {
lab=vdd}
N 260 -380 440 -380 {
lab=vdd}
N 260 -200 370 -200 {
lab=vss}
N 260 -70 260 30 {
lab=#net9}
N 370 -170 370 -70 {
lab=#net9}
N 260 -70 370 -70 {
lab=#net9}
N 260 -170 260 -70 {
lab=#net9}
N 440 -600 440 -410 {
lab=#net8}
N 600 -605 600 -540 {
lab=#net10}
N 600 -480 600 -300 {
lab=#net1}
N 260 -300 600 -300 {
lab=#net1}
N 670 -300 750 -300 {
lab=#net1}
N 810 -300 900 -300 {
lab=vctrl}
N 880 -900 880 -870 {
lab=#net11}
N 880 -790 880 -770 {
lab=Vpre}
N 600 -710 600 -675 {
lab=#net12}
N 600 -830 600 -770 {
lab=vdd}
N 260 -600 260 -550 {
lab=#net8}
N 260 -490 260 -410 {
lab=#net13}
N 710 -90 800 -90 {
lab=preChrg}
N 655 -90 670 -90 {
lab=vss}
N 670 -60 670 -10 {
lab=Vpre}
N 635 -10 670 -10 {
lab=Vpre}
N 670 -300 670 -180 {
lab=#net1}
N 600 -300 670 -300 {
lab=#net1}
N 0 -200 220 -200 {
lab=snk}
N 0 -110 20 -110 {
lab=snk}
N 0 -200 0 -110 {
lab=snk}
N -20 -200 0 -200 {
lab=snk}
N 100 -110 150 -110 {
lab=snk_gate_n}
N 160 -380 220 -380 {
lab=#net14}
N 10 -380 80 -380 {
lab=src}
C {devices/ipin.sym} 320 -830 0 0 {name=p1 lab=vdd}
C {devices/opin.sym} 900 -300 0 0 {name=p2 lab=vctrl}
C {devices/ipin.sym} -30 180 0 0 {name=p3 lab=vss
}
C {devices/ipin.sym} 190 140 0 0 {name=p6 lab=nbias
}
C {devices/ipin.sym} 350 -770 0 0 {name=p7 lab=pbias
}
C {JNW_TR_SKY130A/JNWTR_CAPX4.sym} 600 -615 0 0 {name=x5[30:0]}
C {devices/ipin.sym} 800 -90 2 0 {name=p10 lab=preChrg
}
C {devices/lab_wire.sym} 895 -1250 0 1 {name=p19 sig_type=std_logic lab=vdd}
C {JNW_ATR_SKY130A/JNWATR_NCH_2C5F0.sym} 220 140 0 0 {name=x4 }
C {devices/lab_wire.sym} 285 -380 0 1 {name=p22 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 915 -410 0 1 {name=p17 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 925 -770 0 1 {name=p13 sig_type=std_logic lab=Vpre}
C {devices/lab_wire.sym} 635 -10 0 0 {name=p20 sig_type=std_logic lab=Vpre}
C {JNW_ATR_SKY130A/JNWATR_PCH_2C1F2.sym} 220 -380 0 0 {name=x12 }
C {JNW_ATR_SKY130A/JNWATR_NCH_2C1F2.sym} 220 -200 0 0 {name=x19 }
C {JNW_ATR_SKY130A/JNWATR_PCH_2C1F2.sym} 480 -380 0 1 {name=x21 }
C {devices/lab_wire.sym} 495 -330 0 0 {name=p26 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 505 -380 0 1 {name=p28 sig_type=std_logic lab=src}
C {JNW_ATR_SKY130A/JNWATR_NCH_2C1F2.sym} 410 -200 0 1 {name=x23 }
C {devices/lab_wire.sym} 325 -200 0 0 {name=p31 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 435 -200 0 1 {name=p33 sig_type=std_logic lab=snk_gate_n}
C {devices/vsource.sym} 440 -670 0 0 {name=V_isrc value=0 savecurrent=true}
C {devices/vsource.sym} 260 60 0 0 {name=V_isnk value=0 savecurrent=true}
C {JNW_ATR_SKY130A/JNWATR_PCH_2C5F0.sym} 400 -770 0 0 {name=x20 }
C {devices/ipin.sym} -20 -200 0 0 {name=p9 lab=snk
}
C {devices/ipin.sym} 10 -380 0 0 {name=p11 lab=src}
C {devices/vsource.sym} 880 -580 0 0 {name=V_iPreCharge value=0 savecurrent=true}
C {JNW_ATR_SKY130A/JNWATR_NCH_2C1F2.sym} 920 -490 0 1 {name=x5 }
C {devices/lab_wire.sym} 935 -490 0 1 {name=p39 sig_type=std_logic lab=preChrg}
C {JNW_TR_SKY130A/JNWTR_RPPO2.sym} 880 -720 1 0 {name=x8 }
C {JNW_TR_SKY130A/JNWTR_RPPO2.sym} 880 -1090 1 0 {name=x9 }
C {JNW_TR_SKY130A/JNWTR_RPPO2.sym} 880 -1200 1 0 {name=x11 }
C {JNW_TR_SKY130A/JNWTR_RPPO2.sym} 880 -980 1 0 {name=x13 }
C {devices/vsource.sym} 260 -260 0 0 {name=V_isnk_drain value=0 savecurrent=true}
C {devices/vsource.sym} 260 -520 0 0 {name=V_isrc_source value=0 savecurrent=true}
C {devices/lab_wire.sym} 405 -250 0 1 {name=p32 sig_type=std_logic lab=vdd}
C {devices/vsource.sym} 600 -510 0 0 {name=V_icap_bot value=0 savecurrent=true}
C {devices/vsource.sym} 670 -150 0 0 {name=V_iprecharge1 value=0 savecurrent=true}
C {devices/vsource.sym} 780 -300 1 0 {name=V_ipmosGate value=0 savecurrent=true}
C {JNW_TR_SKY130A/JNWTR_RPPO2.sym} 880 -870 1 0 {name=x14 }
C {devices/vsource.sym} 600 -740 0 0 {name=V_icap_top value=0 savecurrent=true}
C {JNW_ATR_SKY130A/JNWATR_NCH_2C1F2.sym} 710 -90 0 1 {name=x2 }
C {devices/lab_wire.sym} 655 -90 0 0 {name=p8 sig_type=std_logic lab=vss}
C {JNW_TR_SKY130A/JNWTR_IVX1_CV.sym} 20 -110 0 0 {name=x1 }
C {devices/lab_wire.sym} 115 -110 0 1 {name=p4 sig_type=std_logic lab=snk_gate_n}
C {JNW_TR_SKY130A/JNWTR_IVX1_CV.sym} 80 -380 0 0 {name=x3 }
C {devices/lab_wire.sym} 120 -420 0 0 {name=p5 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 60 -150 0 0 {name=p12 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 120 -340 2 1 {name=p15 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 60 -70 2 1 {name=p16 sig_type=std_logic lab=vss}
