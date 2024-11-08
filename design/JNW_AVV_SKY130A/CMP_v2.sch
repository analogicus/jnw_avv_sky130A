v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 540 -540 540 -460 {
lab=#net1}
N 680 -570 680 -540 {
lab=#net1}
N 680 -540 820 -540 {
lab=#net1}
N 460 -460 500 -460 {
lab=vin}
N 860 -460 900 -460 {
lab=vip}
N 540 -430 540 -300 {
lab=#net2}
N 820 -430 820 -300 {
lab=#net3}
N 820 -300 820 -280 {
lab=#net3}
N 820 -160 1080 -160 {
lab=vss}
N 540 -160 820 -160 {
lab=vss}
N 820 -250 820 -160 {
lab=vss}
N 540 -250 540 -160 {
lab=vss}
N 460 -250 500 -250 {
lab=#net2}
N 460 -300 540 -300 {
lab=#net2}
N 460 -300 460 -250 {
lab=#net2}
N 540 -300 540 -280 {
lab=#net2}
N 900 -300 900 -250 {
lab=#net3}
N 820 -300 900 -300 {
lab=#net3}
N 860 -250 900 -250 {
lab=#net3}
N 280 -250 280 -160 {
lab=vss}
N 1080 -250 1080 -160 {
lab=vss}
N 280 -690 280 -280 {
lab=#net4}
N 1080 -480 1080 -280 {
lab=vout}
N 900 -250 1040 -250 {
lab=#net3}
N 280 -690 340 -690 {
lab=#net4}
N 340 -750 340 -690 {
lab=#net4}
N 280 -720 280 -690 {
lab=#net4}
N 340 -750 1040 -750 {
lab=#net4}
N 320 -750 340 -750 {
lab=#net4}
N 280 -820 280 -750 {
lab=vdd}
N 680 -820 1080 -820 {
lab=vdd}
N 1080 -820 1080 -750 {
lab=vdd}
N 240 -820 280 -820 {
lab=vdd}
N 280 -160 540 -160 {
lab=vss}
N 240 -160 280 -160 {
lab=vss}
N 1080 -720 1080 -480 {
lab=vout}
N 1080 -480 1150 -480 {
lab=vout}
N 820 -540 820 -460 {
lab=#net1}
N 320 -250 460 -250 {
lab=#net2}
N 540 -540 680 -540 {
lab=#net1}
N 720 -600 740 -600 {
lab=itail}
N 680 -820 680 -600 {
lab=vdd}
N 280 -820 680 -820 {
lab=vdd}
C {devices/ipin.sym} 240 -160 0 0 {name=p2 lab=vss
}
C {devices/ipin.sym} 240 -820 0 0 {name=p3 lab=vdd
}
C {JNW_ATR_SKY130A/JNWATR_PCH_12C1F2.sym} 500 -460 0 0 {name=x1[3:0]}
C {JNW_ATR_SKY130A/JNWATR_PCH_12C1F2.sym} 860 -460 0 1 {name=x2[3:0]}
C {devices/ipin.sym} 740 -600 2 0 {name=p1 lab=pbias
}
C {JNW_ATR_SKY130A/JNWATR_PCH_2C1F2.sym} 720 -600 0 1 {name=x1 }
C {devices/ipin.sym} 460 -460 0 0 {name=p5 lab=vin
}
C {devices/ipin.sym} 900 -460 2 0 {name=p6 lab=vip
}
C {JNW_ATR_SKY130A/JNWATR_NCH_2C5F0.sym} 500 -250 0 0 {name=x2 }
C {JNW_ATR_SKY130A/JNWATR_NCH_2C5F0.sym} 860 -250 0 1 {name=x5 }
C {JNW_ATR_SKY130A/JNWATR_NCH_2C5F0.sym} 320 -250 0 1 {name=x6 }
C {JNW_ATR_SKY130A/JNWATR_NCH_2C5F0.sym} 1040 -250 0 0 {name=x7 }
C {JNW_ATR_SKY130A/JNWATR_PCH_4C5F0.sym} 1040 -750 0 0 {name=x8 }
C {JNW_ATR_SKY130A/JNWATR_PCH_4C5F0.sym} 320 -750 0 1 {name=x9 }
C {devices/opin.sym} 1150 -480 0 0 {name=p7 lab=vout}
