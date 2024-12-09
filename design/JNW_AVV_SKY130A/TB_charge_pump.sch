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
N 380 -180 420 -180 {
lab=vctrl}
N 260 -320 260 -290 {
lab=vdd}
N 260 -70 260 -40 {
lab=vss}
N 380 -240 410 -240 {
lab=preChrg}
N 700 -150 790 -150 {
lab=nbias}
N 700 -150 700 -130 {
lab=nbias}
N 910 -290 910 -260 {
lab=pbias}
N 820 -260 910 -260 {
lab=pbias}
N 820 -320 820 -260 {
lab=pbias}
N 820 -320 870 -320 {
lab=pbias}
N 910 -380 910 -320 {
lab=vdd}
N 700 -100 700 -50 {
lab=vss}
N 640 -300 640 -50 {
lab=vss}
N 640 -50 700 -50 {
lab=vss}
N 640 -300 680 -300 {
lab=vss}
N 880 -380 910 -380 {
lab=vdd}
N 790 -150 790 -100 {
lab=nbias}
N 740 -100 790 -100 {
lab=nbias}
N 910 -100 910 -50 {
lab=vss}
N 790 -100 870 -100 {
lab=nbias}
N 700 -50 910 -50 {
lab=vss}
N 700 -260 700 -240 {
lab=#net1}
N 700 -180 700 -150 {
lab=nbias}
N 910 -260 910 -230 {
lab=pbias}
N 910 -170 910 -130 {
lab=#net2}
N 640 -380 640 -300 {
lab=vss}
N 640 -460 680 -460 {
lab=vss}
N 640 -380 680 -380 {
lab=vss}
N 640 -460 640 -380 {
lab=vss}
N 640 -540 640 -460 {
lab=vss}
N 640 -540 680 -540 {
lab=vss}
N 640 -620 640 -540 {
lab=vss}
N 640 -620 680 -620 {
lab=vss}
N 700 -700 700 -660 {
lab=vdd}
C {JNW_AVV_SKY130A/charge_pump.sym} 90 -40 0 0 {name=x1}
C {devices/lab_wire.sym} 150 -200 0 0 {name=p1 sig_type=std_logic lab=pbias}
C {devices/lab_wire.sym} 150 -160 0 0 {name=p2 sig_type=std_logic lab=nbias}
C {devices/ipin.sym} 110 -230 0 0 {name=p3 lab=src_n}
C {devices/ipin.sym} 110 -130 0 0 {name=p4 lab=snk}
C {devices/ipin.sym} 260 -320 0 0 {name=p6 lab=vdd}
C {devices/ipin.sym} 260 -40 0 0 {name=p7 lab=vss}
C {devices/ipin.sym} 410 -240 2 0 {name=p8 lab=preChrg}
C {devices/opin.sym} 420 -180 2 1 {name=p5 lab=vctrl}
C {devices/lab_wire.sym} 870 -260 0 0 {name=p32 sig_type=std_logic lab=pbias}
C {devices/lab_wire.sym} 700 -700 0 1 {name=p34 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 790 -50 0 1 {name=p35 sig_type=std_logic lab=vss}
C {JNW_ATR_SKY130A/JNWATR_PCH_8C5F0.sym} 870 -320 0 0 {name=x7 }
C {JNW_ATR_SKY130A/JNWATR_NCH_2C5F0.sym} 740 -100 0 1 {name=x28 }
C {devices/lab_wire.sym} 910 -380 0 0 {name=p13 sig_type=std_logic lab=vdd}
C {JNW_ATR_SKY130A/JNWATR_NCH_2C5F0.sym} 870 -100 0 0 {name=x4 }
C {devices/lab_wire.sym} 850 -100 0 0 {name=p14 sig_type=std_logic lab=nbias}
C {JNW_TR_SKY130A/JNWTR_RPPO16.sym} 700 -260 1 1 {name=x26 }
C {devices/vsource.sym} 700 -210 0 0 {name=v_nbias value=0 savecurrent=true}
C {devices/vsource.sym} 910 -200 0 0 {name=v_pbias value=0 savecurrent=true}
C {JNW_TR_SKY130A/JNWTR_RPPO16.sym} 700 -340 1 1 {name=x5 }
C {JNW_TR_SKY130A/JNWTR_RPPO16.sym} 700 -420 1 1 {name=x6 }
C {JNW_TR_SKY130A/JNWTR_RPPO16.sym} 700 -500 1 1 {name=x8 }
C {JNW_TR_SKY130A/JNWTR_RPPO16.sym} 700 -580 1 1 {name=x9 }
