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
N 1180 -450 1180 -410 {lab=Vcap1}
N 1180 -450 1260 -450 {lab=Vcap1}
N 1260 -450 1260 -415 {lab=Vcap1}
N 1510 -450 1510 -410 {lab=Vcap2}
N 1430 -450 1510 -450 {lab=Vcap2}
N 1430 -450 1430 -415 {lab=Vcap2}
N 1430 -300 1510 -300 {lab=vss}
N 1510 -380 1510 -300 {lab=vss}
N 1180 -380 1180 -300 {lab=vss}
N 850 -390 890 -390 {lab=s_CapRst}
N 850 -370 890 -370 {lab=s_CCOcap1}
N 1740 -390 1780 -390 {lab=s_CapRst}
N 1740 -370 1780 -370 {lab=s_CCOcap2}
N 1170 -540 1220 -540 {lab=s_CCOcap2}
N 1470 -540 1520 -540 {lab=s_CCOcap1}
N 1350 -610 1430 -610 {lab=Vcap}
N 1270 -680 1310 -680 {lab=s_CapRst}
N 1350 -650 1350 -610 {lab=Vcap}
N 1260 -610 1350 -610 {lab=Vcap}
N 1350 -820 1350 -790 {lab=Iptat}
N 1350 -730 1350 -710 {lab=#net1}
N 1550 -380 1650 -380 {lab=rstCap1}
N 1260 -610 1260 -590 {lab=Vcap}
N 1260 -490 1260 -450 {lab=Vcap1}
N 1310 -510 1380 -510 {lab=vss}
N 1430 -490 1430 -450 {lab=Vcap2}
N 1430 -610 1430 -590 {lab=Vcap}
N 980 -380 1140 -380 {lab=rstCap2}
C {devices/opin.sym} 1590 -780 0 0 {name=p19 lab=Vcap}
C {devices/ipin.sym} 1110 -780 0 0 {name=p59 lab=vdd}
C {devices/ipin.sym} 1110 -700 0 0 {name=p79 lab=s_CCOcap2}
C {devices/ipin.sym} 1110 -720 0 0 {name=p80 lab=s_CCOcap1}
C {devices/ipin.sym} 1110 -760 0 0 {name=p1 lab=vss}
C {devices/ipin.sym} 1110 -740 0 0 {name=p2 lab=Iptat}
C {JNW_TR_SKY130A/JNWTR_CAPX4.sym} 1430 -355 0 1 {name=x1[1:0]}
C {JNW_TR_SKY130A/JNWTR_CAPX4.sym} 1260 -355 0 0 {name=x2[1:0]}
C {JNW_ATR_SKY130A/JNWATR_NCH_2C1F2.sym} 1140 -380 0 0 {name=x1 }
C {JNW_ATR_SKY130A/JNWATR_NCH_2C1F2.sym} 1550 -380 0 1 {name=x2 }
C {devices/ipin.sym} 1110 -680 0 0 {name=p3 lab=s_CapRst}
C {devices/lab_wire.sym} 1350 -820 0 0 {name=p4 sig_type=std_logic lab=Iptat}
C {devices/lab_wire.sym} 1270 -680 0 0 {name=p5 sig_type=std_logic lab=s_CapRst}
C {JNW_TR_SKY130A/JNWTR_ORX1_CV.sym} 890 -370 0 0 {name=x6 }
C {devices/lab_wire.sym} 850 -390 0 0 {name=p7 sig_type=std_logic lab=s_CapRst}
C {devices/lab_wire.sym} 850 -370 0 0 {name=p8 sig_type=std_logic lab=s_CCOcap1}
C {devices/lab_wire.sym} 930 -420 0 1 {name=p9 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 1340 -300 0 1 {name=p10 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 930 -340 0 1 {name=p11 sig_type=std_logic lab=vss}
C {JNW_TR_SKY130A/JNWTR_ORX1_CV.sym} 1740 -370 0 1 {name=x9 }
C {devices/lab_wire.sym} 1700 -420 0 0 {name=p12 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 1700 -340 0 0 {name=p13 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 1780 -390 0 1 {name=p14 sig_type=std_logic lab=s_CapRst}
C {devices/lab_wire.sym} 1210 -540 0 0 {name=p24 sig_type=std_logic lab=s_CCOcap2}
C {JNW_ATR_SKY130A/JNWATR_PCH_2C1F2.sym} 1310 -680 0 0 {name=x5 }
C {devices/lab_wire.sym} 1350 -680 0 1 {name=p20 sig_type=std_logic lab=vdd}
C {devices/vsource.sym} 1350 -760 0 0 {name=vIptat1 value=0 savecurrent=true}
C {devices/lab_wire.sym} 1390 -610 0 1 {name=p16 sig_type=std_logic lab=Vcap}
C {devices/lab_wire.sym} 1450 -450 0 1 {name=p18 sig_type=std_logic lab=Vcap2}
C {devices/lab_wire.sym} 1210 -450 0 1 {name=p21 sig_type=std_logic lab=Vcap1}
C {JNW_TR_SKY130A/JNWTR_TGX2_CV.sym} 1430 -600 1 0 {name=x3 }
C {JNW_TR_SKY130A/JNWTR_TGX2_CV.sym} 1260 -600 3 1 {name=x4 }
C {devices/lab_wire.sym} 1360 -510 0 0 {name=p26 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 1470 -510 0 1 {name=p27 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 1220 -510 0 0 {name=p28 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 1570 -380 0 1 {name=p6 sig_type=std_logic lab=rstCap1}
C {devices/lab_wire.sym} 1130 -380 0 0 {name=p22 sig_type=std_logic lab=rstCap2}
C {devices/lab_wire.sym} 1490 -540 0 1 {name=p17 sig_type=std_logic lab=s_CCOcap1}
C {devices/lab_wire.sym} 1780 -370 0 1 {name=p15 sig_type=std_logic lab=s_CCOcap2}
