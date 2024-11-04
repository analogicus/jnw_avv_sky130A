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
lab=src}
N 380 -180 420 -180 {
lab=vctrl}
N 260 -320 260 -290 {
lab=vdd}
N 260 -70 260 -40 {
lab=vss}
N 560 -100 650 -100 {
lab=nbias}
N 650 -100 650 -80 {
lab=nbias}
N 870 -160 870 -80 {
lab=pbias}
N 870 -190 870 -160 {
lab=pbias}
N 780 -160 870 -160 {
lab=pbias}
N 780 -220 780 -160 {
lab=pbias}
N 780 -220 830 -220 {
lab=pbias}
N 870 -280 870 -220 {
lab=vdd}
N 650 -50 650 0 {
lab=vss}
N 620 -430 650 -430 {
lab=vdd}
N 710 -200 710 0 {
lab=vss}
N 650 0 710 0 {
lab=vss}
N 650 -160 650 -100 {
lab=nbias}
N 670 -200 710 -200 {
lab=vss}
N 710 -280 710 -200 {
lab=vss}
N 670 -280 710 -280 {
lab=vss}
N 710 -360 710 -280 {
lab=vss}
N 670 -360 710 -360 {
lab=vss}
N 650 -430 650 -400 {
lab=vdd}
N 780 -50 830 -50 {
lab=nbias}
N 710 0 870 0 {
lab=vss}
N 840 -280 870 -280 {
lab=vdd}
N 560 -100 560 -50 {
lab=nbias}
N 560 -50 610 -50 {
lab=nbias}
N 870 -50 870 0 {
lab=vss}
C {JNW_AVV_SKY130A/charge_pump.sym} 90 -40 0 0 {name=x1}
C {devices/lab_wire.sym} 150 -200 0 0 {name=p1 sig_type=std_logic lab=pbias}
C {devices/lab_wire.sym} 150 -160 0 0 {name=p2 sig_type=std_logic lab=nbias}
C {devices/ipin.sym} 110 -230 0 0 {name=p3 lab=src}
C {devices/ipin.sym} 110 -130 0 0 {name=p4 lab=snk}
C {devices/ipin.sym} 420 -180 2 0 {name=p5 lab=vctrl}
C {devices/ipin.sym} 260 -320 0 0 {name=p6 lab=vdd}
C {devices/ipin.sym} 260 -40 0 0 {name=p7 lab=vss}
C {devices/lab_wire.sym} 830 -160 0 0 {name=p32 sig_type=std_logic lab=pbias}
C {devices/lab_wire.sym} 650 -430 0 0 {name=p34 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 700 0 0 0 {name=p35 sig_type=std_logic lab=vss}
C {JNW_ATR_SKY130A/JNWATR_NCH_2C5F0.sym} 610 -50 0 0 {name=x28 }
C {devices/lab_wire.sym} 620 -100 0 0 {name=p12 sig_type=std_logic lab=nbias}
C {devices/lab_wire.sym} 870 -280 0 0 {name=p13 sig_type=std_logic lab=vdd}
C {JNW_ATR_SKY130A/JNWATR_NCH_2C5F0.sym} 830 -50 0 0 {name=x4 }
C {devices/lab_wire.sym} 820 -50 0 0 {name=p14 sig_type=std_logic lab=nbias}
C {JNW_ATR_SKY130A/JNWATR_PCH_2C5F0.sym} 830 -220 0 0 {name=x2 }
C {JNW_TR_SKY130A/JNWTR_RPPO16.sym} 650 -160 3 0 {name=x26 }
C {JNW_TR_SKY130A/JNWTR_RPPO16.sym} 650 -240 3 0 {name=x27 }
C {JNW_TR_SKY130A/JNWTR_RPPO8.sym} 650 -320 3 0 {name=x11 }
