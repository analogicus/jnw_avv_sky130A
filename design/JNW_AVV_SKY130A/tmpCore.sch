v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 1260 -345 1260 -300 {lab=vss}
N 1260 -300 1430 -300 {lab=vss}
N 1430 -345 1430 -300 {lab=vss}
N 1180 -300 1260 -300 {lab=vss}
N 1180 -450 1180 -410 {lab=#net1}
N 1180 -450 1260 -450 {lab=#net1}
N 1260 -450 1260 -415 {lab=#net1}
N 1510 -450 1510 -410 {lab=#net2}
N 1430 -450 1510 -450 {lab=#net2}
N 1430 -450 1430 -415 {lab=#net2}
N 1430 -300 1510 -300 {lab=vss}
N 1510 -380 1510 -300 {lab=vss}
N 1180 -380 1180 -300 {lab=vss}
N 1260 -540 1430 -540 {lab=vdd}
N 1100 -380 1140 -380 {lab=#net3}
N 970 -390 1010 -390 {lab=s_CapRst}
N 970 -370 1010 -370 {lab=cmp_p1}
N 1550 -380 1590 -380 {lab=#net4}
N 1680 -390 1720 -390 {lab=s_CapRst}
N 1680 -370 1720 -370 {lab=cmp_p1}
N 1170 -540 1220 -540 {lab=cmp_p1}
N 1470 -540 1520 -540 {lab=cmp_p2}
N 1430 -510 1430 -450 {lab=#net2}
N 1260 -510 1260 -450 {lab=#net1}
N 1260 -610 1260 -570 {lab=Vcap}
N 1430 -610 1430 -570 {lab=Vcap}
N 1350 -610 1430 -610 {lab=Vcap}
N 1270 -680 1310 -680 {lab=s_CapRst}
N 1350 -650 1350 -610 {lab=Vcap}
N 1260 -610 1350 -610 {lab=Vcap}
N 1350 -820 1350 -790 {lab=Iptat}
N 1350 -730 1350 -710 {lab=#net5}
C {devices/opin.sym} 1590 -780 0 0 {name=p19 lab=Vcap}
C {devices/ipin.sym} 1110 -780 0 0 {name=p59 lab=vdd}
C {devices/ipin.sym} 1110 -700 0 0 {name=p79 lab=cmp_p2}
C {devices/ipin.sym} 1110 -720 0 0 {name=p80 lab=cmp_p1}
C {devices/ipin.sym} 1110 -760 0 0 {name=p1 lab=vss}
C {devices/ipin.sym} 1110 -740 0 0 {name=p2 lab=Iptat}
C {JNW_TR_SKY130A/JNWTR_CAPX4.sym} 1430 -355 0 1 {name=x1[3:0]}
C {JNW_TR_SKY130A/JNWTR_CAPX4.sym} 1260 -355 0 0 {name=x2[3:0]}
C {JNW_ATR_SKY130A/JNWATR_NCH_2C1F2.sym} 1140 -380 0 0 {name=x1 }
C {JNW_ATR_SKY130A/JNWATR_NCH_2C1F2.sym} 1550 -380 0 1 {name=x2 }
C {devices/ipin.sym} 1110 -680 0 0 {name=p3 lab=s_CapRst}
C {JNW_ATR_SKY130A/JNWATR_PCH_2C1F2.sym} 1220 -540 0 0 {name=x3 }
C {JNW_ATR_SKY130A/JNWATR_PCH_2C1F2.sym} 1470 -540 0 1 {name=x4 }
C {devices/lab_wire.sym} 1350 -820 0 0 {name=p4 sig_type=std_logic lab=Iptat}
C {devices/lab_wire.sym} 1270 -680 0 0 {name=p5 sig_type=std_logic lab=s_CapRst}
C {devices/lab_wire.sym} 1340 -540 0 1 {name=p6 sig_type=std_logic lab=vdd}
C {JNW_TR_SKY130A/JNWTR_ORX1_CV.sym} 1010 -370 0 0 {name=x6 }
C {devices/lab_wire.sym} 970 -390 0 0 {name=p7 sig_type=std_logic lab=s_CapRst}
C {devices/lab_wire.sym} 970 -370 0 0 {name=p8 sig_type=std_logic lab=cmp_p1}
C {devices/lab_wire.sym} 1050 -420 0 1 {name=p9 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 1340 -300 0 1 {name=p10 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 1050 -340 0 1 {name=p11 sig_type=std_logic lab=vss}
C {JNW_TR_SKY130A/JNWTR_ORX1_CV.sym} 1680 -370 0 1 {name=x9 }
C {devices/lab_wire.sym} 1640 -420 0 0 {name=p12 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 1640 -340 0 0 {name=p13 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 1720 -390 0 1 {name=p14 sig_type=std_logic lab=s_CapRst}
C {devices/lab_wire.sym} 1720 -370 0 1 {name=p15 sig_type=std_logic lab=cmp_p1}
C {devices/lab_wire.sym} 1200 -540 0 0 {name=p17 sig_type=std_logic lab=cmp_p1}
C {devices/lab_wire.sym} 1490 -540 0 1 {name=p24 sig_type=std_logic lab=cmp_p2}
C {JNW_ATR_SKY130A/JNWATR_PCH_2C1F2.sym} 1310 -680 0 0 {name=x5 }
C {devices/lab_wire.sym} 1350 -680 0 1 {name=p20 sig_type=std_logic lab=vdd}
C {devices/vsource.sym} 1350 -760 0 0 {name=vIptat1 value=0 savecurrent=true}
C {devices/lab_wire.sym} 1390 -610 0 1 {name=p16 sig_type=std_logic lab=Vcap}
