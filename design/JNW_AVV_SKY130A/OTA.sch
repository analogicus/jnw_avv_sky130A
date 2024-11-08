v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 490 -630 490 -550 {
lab=#net1}
N 630 -660 630 -630 {
lab=#net1}
N 630 -630 770 -630 {
lab=#net1}
N 410 -550 450 -550 {
lab=#net2}
N 810 -550 850 -550 {
lab=vin}
N 490 -420 490 -370 {
lab=#net3}
N 770 -450 770 -370 {
lab=vout}
N 490 -250 770 -250 {
lab=vss}
N 770 -340 770 -250 {
lab=vss}
N 490 -340 490 -250 {
lab=vss}
N 420 -250 490 -250 {
lab=vss}
N 770 -630 770 -550 {
lab=#net1}
N 490 -630 630 -630 {
lab=#net1}
N 670 -690 690 -690 {
lab=pbias}
N 630 -790 630 -690 {
lab=vdd}
N 530 -790 630 -790 {
lab=vdd}
N 620 -340 730 -340 {
lab=#net3}
N 620 -420 620 -340 {
lab=#net3}
N 490 -420 620 -420 {
lab=#net3}
N 490 -520 490 -420 {
lab=#net3}
N 530 -340 620 -340 {
lab=#net3}
N 770 -520 770 -450 {
lab=vout}
N 770 -450 840 -450 {
lab=vout}
C {devices/ipin.sym} 420 -250 0 0 {name=p2 lab=vss
}
C {devices/ipin.sym} 530 -790 0 0 {name=p3 lab=vdd
}
C {JNW_ATR_SKY130A/JNWATR_PCH_12C1F2.sym} 450 -550 0 0 {name=x1[3:0]}
C {JNW_ATR_SKY130A/JNWATR_PCH_12C1F2.sym} 810 -550 0 1 {name=x2[3:0]}
C {devices/ipin.sym} 690 -690 2 0 {name=p1 lab=pbias
}
C {JNW_ATR_SKY130A/JNWATR_PCH_2C1F2.sym} 670 -690 0 1 {name=x1 }
C {devices/ipin.sym} 850 -550 2 0 {name=p5 lab=vin
}
C {devices/ipin.sym} 410 -550 0 0 {name=p6 lab=vip
}
C {JNW_ATR_SKY130A/JNWATR_NCH_2C5F0.sym} 730 -340 0 0 {name=x2 }
C {JNW_ATR_SKY130A/JNWATR_NCH_2C5F0.sym} 530 -340 0 1 {name=x5 }
C {devices/opin.sym} 840 -450 0 0 {name=p7 lab=vout}
