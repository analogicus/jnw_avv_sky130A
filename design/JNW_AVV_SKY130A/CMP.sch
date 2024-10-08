v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 680 -540 820 -540 {
lab=#net1}
N 540 -540 540 -460 {
lab=#net1}
N 820 -540 820 -460 {
lab=#net1}
N 680 -570 680 -540 {
lab=#net1}
N 540 -540 680 -540 {
lab=#net1}
N 680 -660 680 -600 {
lab=itail}
N 590 -600 640 -600 {
lab=vss}
N 460 -460 500 -460 {
lab=vip}
N 860 -460 900 -460 {
lab=vip}
N 540 -430 540 -340 {
lab=#net2}
N 460 -340 460 -300 {
lab=#net2}
N 460 -340 540 -340 {
lab=#net2}
N 540 -340 600 -340 {
lab=#net2}
N 600 -340 600 -300 {
lab=#net2}
N 820 -430 820 -340 {
lab=#net3}
N 760 -340 760 -300 {
lab=#net3}
N 760 -340 820 -340 {
lab=#net3}
N 820 -340 900 -340 {
lab=#net3}
N 900 -300 900 -280 {
lab=#net3}
N 640 -270 660 -270 {
lab=#net3}
N 660 -270 730 -340 {
lab=#net3}
N 700 -270 720 -270 {
lab=#net2}
N 630 -340 700 -270 {
lab=#net2}
N 600 -340 630 -340 {
lab=#net2}
N 730 -340 760 -340 {
lab=#net3}
N 600 -270 600 -160 {
lab=vss}
N 760 -270 760 -160 {
lab=vss}
N 900 -160 1080 -160 {
lab=vss}
N 460 -160 600 -160 {
lab=vss}
N 600 -160 760 -160 {
lab=vss}
N 760 -160 900 -160 {
lab=vss}
N 900 -250 900 -160 {
lab=vss}
N 460 -250 460 -160 {
lab=vss}
N 380 -250 420 -250 {
lab=#net2}
N 380 -300 460 -300 {
lab=#net2}
N 380 -300 380 -250 {
lab=#net2}
N 320 -250 380 -250 {
lab=#net2}
N 460 -300 460 -280 {
lab=#net2}
N 980 -300 980 -250 {
lab=#net3}
N 900 -300 980 -300 {
lab=#net3}
N 900 -340 900 -300 {
lab=#net3}
N 940 -250 980 -250 {
lab=#net3}
N 280 -250 280 -160 {
lab=vss}
N 1080 -250 1080 -160 {
lab=vss}
N 280 -690 280 -280 {
lab=#net4}
N 1080 -480 1080 -280 {
lab=vout}
N 980 -250 1040 -250 {
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
N 280 -820 1080 -820 {
lab=vdd}
N 1080 -820 1080 -750 {
lab=vdd}
N 240 -820 280 -820 {
lab=vdd}
N 280 -160 460 -160 {
lab=vss}
N 240 -160 280 -160 {
lab=vss}
N 1080 -720 1080 -480 {
lab=vout}
N 1080 -480 1150 -480 {
lab=vout}
C {devices/ipin.sym} 240 -160 0 0 {name=p2 lab=vss
}
C {devices/ipin.sym} 240 -820 0 0 {name=p3 lab=vdd
}
C {JNW_ATR_SKY130A/JNWATR_PCH_12C1F2.sym} 500 -460 0 0 {name=x1[3:0]}
C {JNW_ATR_SKY130A/JNWATR_PCH_12C1F2.sym} 860 -460 0 1 {name=x2[3:0]}
C {devices/ipin.sym} 680 -660 1 0 {name=p1 lab=itail
}
C {JNW_ATR_SKY130A/JNWATR_PCH_2C1F2.sym} 640 -600 0 0 {name=x1 }
C {devices/lab_wire.sym} 620 -600 0 0 {name=p4 sig_type=std_logic lab=vss}
C {devices/ipin.sym} 460 -460 0 0 {name=p5 lab=vin
}
C {devices/ipin.sym} 900 -460 2 0 {name=p6 lab=vip
}
C {JNW_ATR_SKY130A/JNWATR_NCH_2C5F0.sym} 420 -250 0 0 {name=x2 }
C {JNW_ATR_SKY130A/JNWATR_NCH_2C5F0.sym} 640 -270 0 1 {name=x3 }
C {JNW_ATR_SKY130A/JNWATR_NCH_2C5F0.sym} 720 -270 0 0 {name=x4 }
C {JNW_ATR_SKY130A/JNWATR_NCH_2C5F0.sym} 940 -250 0 1 {name=x5 }
C {JNW_ATR_SKY130A/JNWATR_NCH_2C5F0.sym} 320 -250 0 1 {name=x6 }
C {JNW_ATR_SKY130A/JNWATR_NCH_2C5F0.sym} 1040 -250 0 0 {name=x7 }
C {JNW_ATR_SKY130A/JNWATR_PCH_4C5F0.sym} 1040 -750 0 0 {name=x8 }
C {JNW_ATR_SKY130A/JNWATR_PCH_4C5F0.sym} 320 -750 0 1 {name=x9 }
C {devices/opin.sym} 1150 -480 0 0 {name=p7 lab=vout}
