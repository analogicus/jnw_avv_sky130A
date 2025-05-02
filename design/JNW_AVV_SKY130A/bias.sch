v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -40 310 60 310 {
lab=nbias}
N -40 310 -40 330 {
lab=nbias}
N 170 100 170 130 {
lab=pbias}
N 80 130 170 130 {
lab=pbias}
N 80 70 80 130 {
lab=pbias}
N 80 70 130 70 {
lab=pbias}
N 170 10 170 70 {
lab=vdd}
N -40 360 -40 500 {
lab=vss}
N -100 500 -40 500 {
lab=vss}
N 170 360 170 500 {
lab=vss}
N 170 130 170 160 {
lab=pbias}
N -100 -70 -60 -70 {
lab=vss}
N -40 -310 -40 -270 {
lab=#net1}
N -40 210 -40 230 {
lab=tg_bot}
N 70 10 170 10 {
lab=vdd}
N 70 -20 130 -20 {
lab=setupBias}
N -100 -150 -100 -70 {
lab=vss}
N -100 10 -20 10 {
lab=vss}
N -100 -70 -100 10 {
lab=vss}
N 80 500 170 500 {
lab=vss}
N 30 30 30 210 {
lab=tg_bot}
N -40 210 30 210 {
lab=tg_bot}
N 30 -190 30 -70 {
lab=tg_top}
N -100 -150 -60 -150 {
lab=vss}
N -100 -230 -100 -150 {
lab=vss}
N -40 290 -40 310 {lab=nbias}
N 170 220 170 330 {lab=#net2}
N -100 10 -100 500 {
lab=vss}
N -40 -30 -40 210 {lab=tg_bot}
N -40 -270 30 -270 {lab=#net1}
N -100 -230 10 -230 {lab=vss}
N -480 150 -440 150 {lab=PwrUp}
N -360 150 -300 150 {lab=PwrUp_N}
N 80 360 130 360 {lab=nbias}
N 60 310 60 360 {lab=nbias}
N 0 360 60 360 {lab=nbias}
N 80 360 80 410 {lab=nbias}
N 60 360 80 360 {lab=nbias}
N -40 500 80 500 {
lab=vss}
N 210 10 210 70 {lab=vdd}
N 170 10 210 10 {lab=vdd}
N 210 100 210 130 {lab=pbias}
N 170 130 210 130 {lab=pbias}
N -40 -420 -40 -340 {lab=vdd}
N 80 440 80 500 {lab=vss}
C {devices/lab_wire.sym} 130 130 0 0 {name=p32 sig_type=std_logic lab=pbias}
C {devices/lab_wire.sym} -40 -420 0 1 {name=p34 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 120 500 0 1 {name=p35 sig_type=std_logic lab=vss}
C {JNW_ATR_SKY130A/JNWATR_NCH_2C5F0.sym} 0 360 0 1 {name=x28 }
C {devices/lab_wire.sym} 170 10 0 0 {name=p13 sig_type=std_logic lab=vdd}
C {JNW_ATR_SKY130A/JNWATR_NCH_2C5F0.sym} 130 360 0 0 {name=x4 }
C {devices/lab_wire.sym} 110 360 0 0 {name=p14 sig_type=std_logic lab=nbias}
C {devices/vsource.sym} -40 260 0 0 {name=v_nbias value=0 savecurrent=true}
C {devices/vsource.sym} 170 190 0 0 {name=v_pbias value=0 savecurrent=true}
C {JNW_TR_SKY130A/JNWTR_RPPO16.sym} -40 -110 1 1 {name=x8 }
C {JNW_TR_SKY130A/JNWTR_RPPO16.sym} -40 -190 1 1 {name=x9 }
C {JNW_ATR_SKY130A/JNWATR_PCH_2C5F0.sym} 130 70 0 0 {name=x10 }
C {devices/ipin.sym} 130 -20 2 0 {name=p12 lab=setupBias}
C {JNW_TR_SKY130A/JNWTR_RPPO16.sym} 30 -190 1 1 {name=x13 }
C {JNW_TR_SKY130A/JNWTR_TGX2_CV.sym} 30 -80 1 0 {name=x14 }
C {devices/ipin.sym} -180 -220 0 0 {name=p1 lab=vdd}
C {devices/ipin.sym} -180 -190 0 0 {name=p2 lab=vss}
C {devices/opin.sym} 160 -230 0 0 {name=p3 lab=pbias}
C {devices/opin.sym} 160 -200 0 0 {name=p4 lab=nbias}
C {devices/lab_wire.sym} 30 -100 0 1 {name=p5 sig_type=std_logic lab=tg_top}
C {devices/lab_wire.sym} 30 65 0 1 {name=p6 sig_type=std_logic lab=tg_bot}
C {JNW_TR_SKY130A/JNWTR_RPPO16.sym} -40 -30 1 1 {name=x1 }
C {devices/ipin.sym} -180 -160 0 0 {name=p7 lab=PwrUp}
C {JNW_TR_SKY130A/JNWTR_IVX1_CV.sym} -440 150 0 0 {name=x2 }
C {devices/lab_wire.sym} -460 150 0 0 {name=p8 sig_type=std_logic lab=PwrUp}
C {devices/lab_wire.sym} -300 150 0 0 {name=p9 sig_type=std_logic lab=PwrUp_N}
C {devices/lab_wire.sym} -400 190 0 0 {name=p10 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} -400 110 0 0 {name=p11 sig_type=std_logic lab=vdd}
C {JNW_ATR_SKY130A/JNWATR_NCH_2C5F0.sym} 40 440 0 0 {name=x3 }
C {devices/lab_wire.sym} 40 440 0 0 {name=p15 sig_type=std_logic lab=PwrUp_N}
C {JNW_ATR_SKY130A/JNWATR_PCH_2C5F0.sym} 250 70 0 1 {name=x5 }
C {devices/lab_wire.sym} 250 70 0 1 {name=p16 sig_type=std_logic lab=PwrUp}
C {JNW_ATR_SKY130A/JNWATR_PCH_2C5F0.sym} -80 -340 0 0 {name=x6 }
C {devices/lab_wire.sym} -80 -340 0 0 {name=p17 sig_type=std_logic lab=PwrUp_N}
