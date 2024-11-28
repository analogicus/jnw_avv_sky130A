v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 820 -120 820 -60 {
lab=AVSS}
N 580 -120 580 -60 {
lab=AVSS}
N 580 -200 580 -150 {
lab=#net1}
N 820 -200 820 -150 {
lab=#net2}
N 580 -310 580 -260 {
lab=Y}
N 820 -310 980 -310 {
lab=Y}
N 820 -310 820 -260 {
lab=Y}
N 580 -310 820 -310 {
lab=Y}
N 820 -370 820 -310 {
lab=Y}
N 580 -370 580 -310 {
lab=Y}
N 580 -560 580 -500 {
lab=AVDD}
N 600 -560 820 -560 {
lab=AVDD}
N 820 -560 820 -500 {
lab=AVDD}
N 820 -400 840 -400 {
lab=AVDD}
N 840 -560 840 -400 {
lab=AVDD}
N 820 -560 840 -560 {
lab=AVDD}
N 580 -400 600 -400 {
lab=AVDD}
N 600 -560 600 -400 {
lab=AVDD}
N 580 -560 600 -560 {
lab=AVDD}
N 580 -470 580 -430 {
lab=#net3}
N 820 -230 840 -230 {
lab=AVSS}
N 840 -230 840 -60 {
lab=AVSS}
N 820 -60 840 -60 {
lab=AVSS}
N 580 -230 600 -230 {
lab=AVSS}
N 600 -230 600 -60 {
lab=AVSS}
N 580 -60 600 -60 {
lab=AVSS}
N 590 -640 830 -640 {
lab=AVSS}
N 630 -680 670 -680 {
lab=NA}
N 750 -680 790 -680 {
lab=B}
N 870 -680 920 -680 {
lab=NB}
N 510 -680 550 -680 {
lab=A}
N 590 -720 830 -720 {
lab=AVDD}
N 600 -60 820 -60 {
lab=AVSS}
N 510 -500 540 -500 {
lab=NA}
N 510 -400 540 -400 {
lab=B}
N 510 -230 540 -230 {
lab=A}
N 510 -120 540 -120 {
lab=B}
N 750 -500 780 -500 {
lab=A}
N 750 -400 780 -400 {
lab=NB}
N 750 -230 780 -230 {
lab=NA}
N 750 -120 780 -120 {
lab=NB}
N 820 -470 820 -430 {
lab=#net4}
C {devices/ipin.sym} 430 -720 0 0 {name=p1 lab=AVDD}
C {devices/ipin.sym} 450 -60 0 0 {name=p2 lab=AVSS}
C {JNW_TR_SKY130A/JNWTR_PCHDL.sym} 540 -500 0 0 {name=x1 }
C {JNW_TR_SKY130A/JNWTR_NCHDL.sym} 540 -230 0 0 {name=x2 }
C {devices/ipin.sym} 410 -450 0 0 {name=p3 lab=A}
C {devices/ipin.sym} 410 -250 0 0 {name=p4 lab=B}
C {JNW_TR_SKY130A/JNWTR_PCHDL.sym} 540 -400 0 0 {name=x3 }
C {JNW_TR_SKY130A/JNWTR_PCHDL.sym} 780 -500 0 0 {name=x4 }
C {JNW_TR_SKY130A/JNWTR_PCHDL.sym} 780 -400 0 0 {name=x5 }
C {JNW_TR_SKY130A/JNWTR_NCHDL.sym} 540 -120 0 0 {name=x6 }
C {JNW_TR_SKY130A/JNWTR_NCHDL.sym} 780 -230 0 0 {name=x7 }
C {JNW_TR_SKY130A/JNWTR_NCHDL.sym} 780 -120 0 0 {name=x8 }
C {JNW_TR_SKY130A/JNWTR_IVX1_CV.sym} 550 -680 0 0 {name=x9 }
C {JNW_TR_SKY130A/JNWTR_IVX1_CV.sym} 790 -680 0 0 {name=x10 }
C {devices/lab_wire.sym} 700 -720 0 0 {name=p5 sig_type=std_logic lab=AVDD}
C {devices/lab_wire.sym} 710 -640 0 0 {name=p6 sig_type=std_logic lab=AVSS}
C {devices/lab_wire.sym} 720 -60 0 0 {name=p7 sig_type=std_logic lab=AVSS}
C {devices/lab_wire.sym} 730 -560 0 0 {name=p8 sig_type=std_logic lab=AVDD}
C {devices/lab_wire.sym} 540 -680 0 0 {name=p9 sig_type=std_logic lab=A}
C {devices/lab_wire.sym} 660 -680 0 0 {name=p10 sig_type=std_logic lab=NA}
C {devices/lab_wire.sym} 780 -680 0 0 {name=p11 sig_type=std_logic lab=B}
C {devices/lab_wire.sym} 900 -680 0 0 {name=p12 sig_type=std_logic lab=NB}
C {devices/lab_wire.sym} 770 -500 0 0 {name=p13 sig_type=std_logic lab=A}
C {devices/lab_wire.sym} 530 -230 0 0 {name=p14 sig_type=std_logic lab=A}
C {devices/lab_wire.sym} 530 -500 0 0 {name=p15 sig_type=std_logic lab=NA}
C {devices/lab_wire.sym} 770 -230 0 0 {name=p16 sig_type=std_logic lab=NA}
C {devices/lab_wire.sym} 770 -400 0 0 {name=p17 sig_type=std_logic lab=NB}
C {devices/lab_wire.sym} 770 -120 0 0 {name=p18 sig_type=std_logic lab=NB}
C {devices/lab_wire.sym} 530 -400 0 0 {name=p19 sig_type=std_logic lab=B}
C {devices/lab_wire.sym} 530 -120 0 0 {name=p20 sig_type=std_logic lab=B}
C {devices/opin.sym} 980 -310 0 0 {name=p21 lab=Y}
