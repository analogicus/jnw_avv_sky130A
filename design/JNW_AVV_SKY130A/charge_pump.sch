v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 320 -610 440 -610 {
lab=vdd}
N 440 -610 440 -500 {
lab=vdd}
N 440 -470 440 -380 {
lab=#net1}
N 320 -380 400 -380 {
lab=src}
N 440 -350 440 -300 {
lab=vctrl}
N 600 -300 730 -300 {
lab=vctrl}
N 320 -220 400 -220 {
lab=snk}
N 440 -300 440 -250 {
lab=vctrl}
N 440 -220 440 -140 {
lab=#net2}
N 440 -110 440 -50 {
lab=vss}
N 320 -50 440 -50 {
lab=vss}
N 350 -500 400 -500 {
lab=pbias}
N 350 -110 400 -110 {
lab=pbias}
N 600 -180 600 -50 {
lab=vss}
N 440 -50 600 -50 {
lab=vss}
N 600 -300 600 -250 {
lab=vctrl}
N 440 -300 600 -300 {
lab=vctrl}
C {devices/ipin.sym} 320 -610 0 0 {name=p1 lab=vdd}
C {devices/opin.sym} 730 -300 0 0 {name=p2 lab=vctrl}
C {devices/ipin.sym} 320 -50 0 0 {name=p3 lab=vss
}
C {devices/ipin.sym} 320 -220 0 0 {name=p4 lab=snk
}
C {devices/ipin.sym} 320 -380 0 0 {name=p5 lab=src}
C {JNW_ATR_SKY130A/JNWATR_PCH_4C1F2.sym} 400 -380 0 0 {name=x1 }
C {JNW_ATR_SKY130A/JNWATR_PCH_2C5F0.sym} 400 -500 0 0 {name=x2 }
C {JNW_ATR_SKY130A/JNWATR_NCH_4C1F2.sym} 400 -220 0 0 {name=x3 }
C {JNW_ATR_SKY130A/JNWATR_NCH_2C5F0.sym} 400 -110 0 0 {name=x4 }
C {JNW_TR_SKY130A/JNWTR_CAPX1.sym} 600 -190 0 0 {name=x5 }
C {devices/ipin.sym} 350 -500 0 0 {name=p6 lab=pbias}
C {devices/ipin.sym} 350 -110 0 0 {name=p7 lab=nbias}
