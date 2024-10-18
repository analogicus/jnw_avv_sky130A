v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 260 -430 310 -430 {
lab=nbias}
N 260 -490 260 -430 {
lab=nbias}
N 260 -490 350 -490 {
lab=nbias}
N 350 -490 350 -460 {
lab=nbias}
N 350 -520 350 -490 {
lab=nbias}
N 350 -610 350 -580 {
lab=pbias}
N 350 -640 350 -610 {
lab=pbias}
N 260 -610 350 -610 {
lab=pbias}
N 260 -670 260 -610 {
lab=pbias}
N 260 -670 310 -670 {
lab=pbias}
N 350 -710 350 -670 {
lab=vdd}
N 320 -710 350 -710 {
lab=vdd}
N 320 -390 350 -390 {
lab=vss}
N 350 -430 350 -390 {
lab=vss}
N 110 -200 160 -200 {
lab=pbias}
N 110 -160 160 -160 {
lab=nbias}
N 110 -130 160 -130 {
lab=snk}
N 110 -230 160 -230 {
lab=src}
C {JNW_AVV_SKY130A/charge_pump.sym} 90 -40 0 0 {name=x1}
C {JNW_ATR_SKY130A/JNWATR_NCH_2C5F0.sym} 310 -430 0 0 {name=x6 }
C {JNW_ATR_SKY130A/JNWATR_PCH_2C5F0.sym} 310 -670 0 0 {name=x7 }
C {devices/isource.sym} 350 -550 0 0 {name=I0 value=10u}
C {devices/lab_wire.sym} 310 -610 0 0 {name=p12 sig_type=std_logic lab=pbias}
C {devices/lab_wire.sym} 270 -490 2 0 {name=p13 sig_type=std_logic lab=nbias}
C {devices/lab_wire.sym} 350 -710 0 0 {name=p14 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 350 -390 0 0 {name=p15 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 150 -200 0 0 {name=p1 sig_type=std_logic lab=pbias}
C {devices/lab_wire.sym} 150 -160 0 0 {name=p2 sig_type=std_logic lab=nbias}
C {devices/ipin.sym} 110 -230 0 0 {name=p3 lab=src}
C {devices/ipin.sym} 110 -130 0 0 {name=p4 lab=snk}
C {devices/ipin.sym} 380 -180 2 0 {name=p5 lab=vctrl}
C {devices/ipin.sym} 260 -290 0 0 {name=p6 lab=vdd}
C {devices/ipin.sym} 260 -70 0 0 {name=p7 lab=vss}
