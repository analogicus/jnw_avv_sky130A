v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 400 -300 530 -300 {
lab=nbias}
N 690 -460 690 -430 {
lab=pbias}
N 600 -430 690 -430 {
lab=pbias}
N 600 -490 600 -430 {
lab=pbias}
N 600 -490 650 -490 {
lab=pbias}
N 690 -550 690 -490 {
lab=vdd}
N 400 -80 400 -30 {
lab=vss}
N 340 -30 400 -30 {
lab=vss}
N 340 -470 380 -470 {
lab=vss}
N 530 -300 530 -80 {
lab=nbias}
N 690 -80 690 -30 {
lab=vss}
N 530 -80 650 -80 {
lab=nbias}
N 400 -350 400 -300 {
lab=nbias}
N 690 -430 690 -280 {
lab=pbias}
N 340 -630 380 -630 {
lab=vss}
N 400 -870 400 -830 {
lab=vdd}
N 400 -420 400 -410 {
lab=tg_bot}
N 340 -790 530 -790 {
lab=vss}
N 340 -710 340 -630 {
lab=vss}
N 400 -830 550 -830 {
lab=vdd}
N 340 -550 340 -470 {
lab=vss}
N 400 -30 690 -30 {
lab=vss}
N 550 -530 550 -420 {
lab=tg_bot}
N 400 -420 550 -420 {
lab=tg_bot}
N 400 -430 400 -420 {
lab=tg_bot}
N 550 -750 550 -630 {
lab=tg_top}
N 340 -710 380 -710 {
lab=vss}
N 340 -790 340 -710 {
lab=vss}
N 440 -80 530 -80 {
lab=nbias}
N 590 -550 690 -550 {
lab=vdd}
N 590 -580 650 -580 {
lab=setupBias}
N 340 -550 380 -550 {
lab=vss}
N 340 -630 340 -550 {
lab=vss}
N 340 -470 340 -30 {
lab=vss}
N 690 -220 690 -110 {
lab=#net1}
N 400 -300 400 -110 {
lab=nbias}
C {devices/lab_wire.sym} 650 -430 0 0 {name=p7 sig_type=std_logic lab=pbias}
C {devices/lab_wire.sym} 400 -870 0 1 {name=p8 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 570 -30 0 1 {name=p9 sig_type=std_logic lab=vss}
C {JNW_ATR_SKY130A/JNWATR_NCH_2C5F0.sym} 440 -80 0 1 {name=x1 }
C {devices/lab_wire.sym} 690 -550 0 0 {name=p10 sig_type=std_logic lab=vdd}
C {JNW_ATR_SKY130A/JNWATR_NCH_2C5F0.sym} 650 -80 0 0 {name=x2 }
C {devices/lab_wire.sym} 630 -80 0 0 {name=p11 sig_type=std_logic lab=nbias}
C {JNW_TR_SKY130A/JNWTR_RPPO16.sym} 400 -430 1 1 {name=x3 }
C {devices/vsource.sym} 400 -380 0 0 {name=v_nbias1 value=0 savecurrent=true}
C {devices/vsource.sym} 690 -250 0 0 {name=v_pbias1 value=0 savecurrent=true}
C {JNW_TR_SKY130A/JNWTR_RPPO16.sym} 400 -510 1 1 {name=x7 }
C {JNW_TR_SKY130A/JNWTR_RPPO16.sym} 400 -590 1 1 {name=x11 }
C {JNW_TR_SKY130A/JNWTR_RPPO16.sym} 400 -670 1 1 {name=x12 }
C {JNW_TR_SKY130A/JNWTR_RPPO16.sym} 400 -750 1 1 {name=x15 }
C {JNW_ATR_SKY130A/JNWATR_PCH_2C5F0.sym} 650 -490 0 0 {name=x16 }
C {devices/ipin.sym} 650 -580 2 0 {name=p15 lab=setupBias}
C {JNW_TR_SKY130A/JNWTR_RPPO16.sym} 550 -750 1 1 {name=x17 }
C {JNW_TR_SKY130A/JNWTR_TGX2_CV.sym} 550 -640 1 0 {name=x18 }
C {devices/ipin.sym} 230 -680 0 0 {name=p16 lab=vdd}
C {devices/ipin.sym} 230 -650 0 0 {name=p17 lab=vss}
C {devices/opin.sym} 920 -800 0 1 {name=p18 lab=pbias}
C {devices/opin.sym} 920 -770 0 1 {name=p19 lab=nbias}
C {devices/lab_wire.sym} 550 -660 0 1 {name=p20 sig_type=std_logic lab=tg_top}
C {devices/lab_wire.sym} 550 -495 0 1 {name=p21 sig_type=std_logic lab=tg_bot}
C {devices/lab_wire.sym} 500 -550 0 1 {name=p22 sig_type=std_logic lab=vss}
C {devices/opin.sym} 920 -740 0 1 {name=p1 lab=pcasc}
