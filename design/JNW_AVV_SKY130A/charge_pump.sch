v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 320 -700 440 -700 {
lab=vdd}
N 440 -700 440 -590 {
lab=vdd}
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
N 440 -40 440 20 {
lab=vss}
N 320 20 440 20 {
lab=vss}
N 350 -590 400 -590 {
lab=pbias}
N 350 -40 400 -40 {
lab=nbias}
N 440 20 600 20 {
lab=vss}
N 600 -300 600 -250 {
lab=vctrl}
N 440 -300 600 -300 {
lab=vctrl}
N 600 -180 600 20 {
lab=vss}
N 440 -220 440 -160 {
lab=#net1}
N 440 -100 440 -70 {
lab=#net2}
N 440 -460 440 -380 {
lab=#net3}
N 440 -560 440 -520 {
lab=#net4}
C {devices/ipin.sym} 320 -700 0 0 {name=p1 lab=vdd}
C {devices/opin.sym} 730 -300 0 0 {name=p2 lab=vctrl}
C {devices/ipin.sym} 320 20 0 0 {name=p3 lab=vss
}
C {devices/ipin.sym} 320 -220 0 0 {name=p4 lab=snk
}
C {devices/ipin.sym} 320 -380 0 0 {name=p5 lab=src}
C {JNW_ATR_SKY130A/JNWATR_PCH_4C1F2.sym} 400 -380 0 0 {name=x1 }
C {JNW_ATR_SKY130A/JNWATR_PCH_2C5F0.sym} 400 -590 0 0 {name=x2 }
C {JNW_ATR_SKY130A/JNWATR_NCH_4C1F2.sym} 400 -220 0 0 {name=x3 }
C {JNW_ATR_SKY130A/JNWATR_NCH_2C5F0.sym} 400 -40 0 0 {name=x4 }
C {JNW_TR_SKY130A/JNWTR_CAPX1.sym} 600 -190 0 0 {name=x5 }
C {devices/vsource.sym} 440 -130 0 0 {name=V1 value=3 savecurrent=false}
C {devices/vsource.sym} 440 -490 0 0 {name=V2 value=3 savecurrent=false}
C {devices/ipin.sym} 350 -40 0 0 {name=p6 lab=nbias
}
C {devices/ipin.sym} 350 -590 0 0 {name=p7 lab=pbias
}
