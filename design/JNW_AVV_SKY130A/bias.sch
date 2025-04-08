v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -40 120 50 120 {
lab=nbias}
N -40 120 -40 140 {
lab=nbias}
N 170 -20 170 10 {
lab=pbias}
N 80 10 170 10 {
lab=pbias}
N 80 -50 80 10 {
lab=pbias}
N 80 -50 130 -50 {
lab=pbias}
N 170 -110 170 -50 {
lab=vdd}
N -40 170 -40 220 {
lab=vss}
N -100 -30 -100 220 {
lab=vss}
N -100 220 -40 220 {
lab=vss}
N -100 -30 -60 -30 {
lab=vss}
N 50 120 50 170 {
lab=nbias}
N 0 170 50 170 {
lab=nbias}
N 170 170 170 220 {
lab=vss}
N 50 170 130 170 {
lab=nbias}
N -40 90 -40 120 {
lab=nbias}
N 170 10 170 40 {
lab=pbias}
N 170 100 170 140 {
lab=#net1}
N -100 -190 -60 -190 {
lab=vss}
N -100 -110 -100 -30 {
lab=vss}
N -40 -430 -40 -390 {
lab=vdd}
N -40 20 -40 30 {
lab=tg_bot}
N 70 -110 170 -110 {
lab=vdd}
N 70 -140 130 -140 {
lab=setupBias}
N -100 -350 10 -350 {
lab=vss}
N -100 -270 -100 -190 {
lab=vss}
N -100 -110 -20 -110 {
lab=vss}
N -40 -390 30 -390 {
lab=vdd}
N -100 -190 -100 -110 {
lab=vss}
N -40 220 170 220 {
lab=vss}
N 30 -90 30 20 {
lab=tg_bot}
N -40 20 30 20 {
lab=tg_bot}
N -40 10 -40 20 {
lab=tg_bot}
N 30 -310 30 -190 {
lab=tg_top}
N -100 -270 -60 -270 {
lab=vss}
N -100 -350 -100 -270 {
lab=vss}
C {devices/lab_wire.sym} 130 10 0 0 {name=p32 sig_type=std_logic lab=pbias}
C {devices/lab_wire.sym} -40 -430 0 1 {name=p34 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 50 220 0 1 {name=p35 sig_type=std_logic lab=vss}
C {JNW_ATR_SKY130A/JNWATR_NCH_2C5F0.sym} 0 170 0 1 {name=x28 }
C {devices/lab_wire.sym} 170 -110 0 0 {name=p13 sig_type=std_logic lab=vdd}
C {JNW_ATR_SKY130A/JNWATR_NCH_2C5F0.sym} 130 170 0 0 {name=x4 }
C {devices/lab_wire.sym} 110 170 0 0 {name=p14 sig_type=std_logic lab=nbias}
C {JNW_TR_SKY130A/JNWTR_RPPO16.sym} -40 10 1 1 {name=x26 }
C {devices/vsource.sym} -40 60 0 0 {name=v_nbias value=0 savecurrent=true}
C {devices/vsource.sym} 170 70 0 0 {name=v_pbias value=0 savecurrent=true}
C {JNW_TR_SKY130A/JNWTR_RPPO16.sym} -40 -70 1 1 {name=x5 }
C {JNW_TR_SKY130A/JNWTR_RPPO16.sym} -40 -150 1 1 {name=x6 }
C {JNW_TR_SKY130A/JNWTR_RPPO16.sym} -40 -230 1 1 {name=x8 }
C {JNW_TR_SKY130A/JNWTR_RPPO16.sym} -40 -310 1 1 {name=x9 }
C {JNW_ATR_SKY130A/JNWATR_PCH_2C5F0.sym} 130 -50 0 0 {name=x10 }
C {devices/ipin.sym} 130 -140 2 0 {name=p12 lab=setupBias}
C {JNW_TR_SKY130A/JNWTR_RPPO16.sym} 30 -310 1 1 {name=x13 }
C {JNW_TR_SKY130A/JNWTR_TGX2_CV.sym} 30 -200 1 0 {name=x14 }
C {devices/ipin.sym} -180 -340 0 0 {name=p1 lab=vdd}
C {devices/ipin.sym} -180 -310 0 0 {name=p2 lab=vss}
C {devices/opin.sym} 160 -350 0 0 {name=p3 lab=pbias}
C {devices/opin.sym} 160 -320 0 0 {name=p4 lab=nbias}
C {devices/lab_wire.sym} 30 -220 0 1 {name=p5 sig_type=std_logic lab=tg_top}
C {devices/lab_wire.sym} 30 -55 0 1 {name=p6 sig_type=std_logic lab=tg_bot}
