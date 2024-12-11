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
