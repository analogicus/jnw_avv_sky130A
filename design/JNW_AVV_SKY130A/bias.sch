v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 780 -420 880 -420 {
lab=nbias}
N 780 -420 780 -400 {
lab=nbias}
N 990 -630 990 -600 {
lab=pbias}
N 900 -600 990 -600 {
lab=pbias}
N 900 -660 900 -600 {
lab=pbias}
N 900 -660 950 -660 {
lab=pbias}
N 990 -720 990 -660 {
lab=vdd}
N 780 -370 780 -230 {
lab=vss}
N 720 -230 780 -230 {
lab=vss}
N 990 -370 990 -230 {
lab=vss}
N 990 -600 990 -570 {
lab=pbias}
N 720 -680 760 -680 {
lab=vss}
N 780 -920 780 -880 {
lab=#net1}
N 720 -760 720 -680 {
lab=vss}
N 720 -680 720 -230 {
lab=vss}
N 900 -230 990 -230 {
lab=vss}
N 720 -760 760 -760 {
lab=vss}
N 720 -840 720 -760 {
lab=vss}
N 780 -440 780 -420 {lab=nbias}
N 990 -510 990 -400 {lab=#net2}
N 780 -640 780 -500 {lab=#net3}
N 340 -580 380 -580 {lab=PwrUp}
N 460 -580 520 -580 {lab=PwrUp_N}
N 900 -370 950 -370 {lab=nbias}
N 880 -420 880 -370 {lab=nbias}
N 820 -370 880 -370 {lab=nbias}
N 900 -370 900 -320 {lab=nbias}
N 880 -370 900 -370 {lab=nbias}
N 780 -230 900 -230 {
lab=vss}
N 1030 -720 1030 -660 {lab=vdd}
N 990 -720 1030 -720 {lab=vdd}
N 1030 -630 1030 -600 {lab=pbias}
N 990 -600 1030 -600 {lab=pbias}
N 780 -1030 780 -950 {lab=vdd}
N 900 -290 900 -230 {lab=vss}
N 720 -840 760 -840 {lab=vss}
C {devices/lab_wire.sym} 950 -600 0 0 {name=p32 sig_type=std_logic lab=pbias}
C {devices/lab_wire.sym} 780 -1030 0 1 {name=p34 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 940 -230 0 1 {name=p35 sig_type=std_logic lab=vss}
C {JNW_ATR_SKY130A/JNWATR_NCH_2C5F0.sym} 820 -370 0 1 {name=x28 }
C {devices/lab_wire.sym} 1010 -720 0 0 {name=p13 sig_type=std_logic lab=vdd}
C {JNW_ATR_SKY130A/JNWATR_NCH_2C5F0.sym} 950 -370 0 0 {name=x4 }
C {devices/lab_wire.sym} 930 -370 0 0 {name=p14 sig_type=std_logic lab=nbias}
C {devices/vsource.sym} 780 -470 0 0 {name=v_nbias value=0 savecurrent=true}
C {devices/vsource.sym} 990 -540 0 0 {name=v_pbias value=0 savecurrent=true}
C {JNW_TR_SKY130A/JNWTR_RPPO16.sym} 780 -720 1 1 {name=x8 }
C {JNW_TR_SKY130A/JNWTR_RPPO16.sym} 780 -800 1 1 {name=x9 }
C {JNW_ATR_SKY130A/JNWATR_PCH_2C5F0.sym} 950 -660 0 0 {name=x10 }
C {devices/ipin.sym} 640 -730 0 0 {name=p12 lab=setupBias}
C {devices/ipin.sym} 640 -830 0 0 {name=p1 lab=vdd}
C {devices/ipin.sym} 640 -800 0 0 {name=p2 lab=vss}
C {devices/opin.sym} 980 -840 0 0 {name=p3 lab=pbias}
C {devices/opin.sym} 980 -810 0 0 {name=p4 lab=nbias}
C {JNW_TR_SKY130A/JNWTR_RPPO16.sym} 780 -640 1 1 {name=x1 }
C {devices/ipin.sym} 640 -770 0 0 {name=p7 lab=PwrUp}
C {JNW_TR_SKY130A/JNWTR_IVX1_CV.sym} 380 -580 0 0 {name=x2 }
C {devices/lab_wire.sym} 360 -580 0 0 {name=p8 sig_type=std_logic lab=PwrUp}
C {devices/lab_wire.sym} 520 -580 0 0 {name=p9 sig_type=std_logic lab=PwrUp_N}
C {devices/lab_wire.sym} 420 -540 0 0 {name=p10 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 420 -620 0 0 {name=p11 sig_type=std_logic lab=vdd}
C {JNW_ATR_SKY130A/JNWATR_NCH_2C5F0.sym} 860 -290 0 0 {name=x3 }
C {devices/lab_wire.sym} 860 -290 0 0 {name=p15 sig_type=std_logic lab=PwrUp_N}
C {JNW_ATR_SKY130A/JNWATR_PCH_2C5F0.sym} 1070 -660 0 1 {name=x5 }
C {devices/lab_wire.sym} 1070 -660 0 1 {name=p16 sig_type=std_logic lab=PwrUp}
C {JNW_ATR_SKY130A/JNWATR_PCH_2C5F0.sym} 740 -950 0 0 {name=x6 }
C {devices/lab_wire.sym} 740 -950 0 0 {name=p17 sig_type=std_logic lab=PwrUp_N}
C {devices/noconn.sym} 640 -730 0 1 {name=l1}
