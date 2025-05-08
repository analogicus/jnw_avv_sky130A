v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 930 -780 930 -730 {lab=vdd}
N 450 -440 490 -440 {lab=PwrUp}
N 570 -440 630 -440 {lab=PwrUp_N}
N 1080 -310 1130 -310 {lab=nbias}
N 1330 -450 1330 -380 {lab=#net1}
N 1170 -380 1330 -380 {lab=#net1}
N 1030 -450 1030 -380 {lab=#net1}
N 1030 -480 1330 -480 {lab=vss}
N 940 -480 990 -480 {lab=vin}
N 1370 -480 1430 -480 {lab=vip}
N 950 -640 1030 -640 {lab=#net2}
N 950 -690 950 -640 {lab=#net2}
N 1030 -660 1030 -640 {lab=#net2}
N 950 -690 990 -690 {lab=#net2}
N 930 -690 950 -690 {lab=#net2}
N 820 -780 820 -690 {lab=vdd}
N 1330 -640 1410 -640 {lab=#net3}
N 1410 -690 1410 -640 {lab=#net3}
N 1330 -660 1330 -640 {lab=#net3}
N 1540 -780 1540 -690 {lab=vdd}
N 1330 -780 1330 -690 {lab=vdd}
N 1460 -780 1540 -780 {lab=vdd}
N 1030 -780 1330 -780 {lab=vdd}
N 1030 -780 1030 -690 {lab=vdd}
N 930 -780 1030 -780 {lab=vdd}
N 1010 -260 1500 -260 {lab=#net4}
N 920 -330 920 -260 {lab=#net4}
N 820 -330 920 -330 {lab=#net4}
N 820 -330 820 -290 {lab=#net4}
N 860 -260 920 -260 {lab=#net4}
N 820 -260 820 -170 {lab=vss}
N 1170 -170 1540 -170 {lab=vss}
N 1540 -260 1540 -170 {lab=vss}
N 1540 -460 1540 -290 {lab=vout}
N 1170 -380 1170 -340 {lab=#net1}
N 1030 -380 1170 -380 {lab=#net1}
N 750 -780 820 -780 {lab=vdd}
N 770 -170 820 -170 {lab=vss}
N 1010 -260 1010 -240 {lab=#net4}
N 920 -260 1010 -260 {lab=#net4}
N 1010 -210 1010 -170 {lab=vss}
N 820 -170 1010 -170 {lab=vss}
N 1460 -690 1500 -690 {lab=#net3}
N 1370 -690 1410 -690 {lab=#net3}
N 1460 -780 1460 -730 {lab=vdd}
N 1330 -780 1460 -780 {lab=vdd}
N 820 -780 930 -780 {lab=vdd}
N 930 -700 930 -690 {lab=#net2}
N 860 -690 930 -690 {lab=#net2}
N 1460 -700 1460 -690 {lab=#net3}
N 1410 -690 1460 -690 {lab=#net3}
N 1650 -460 1690 -460 {lab=vout}
N 1170 -310 1170 -240 {lab=#net5}
N 1170 -180 1170 -170 {lab=vss}
N 1010 -170 1170 -170 {lab=vss}
N 1540 -660 1540 -600 {lab=#net6}
N 1540 -540 1540 -460 {lab=vout}
N 820 -660 820 -600 {lab=#net7}
N 820 -540 820 -330 {lab=#net4}
N 1330 -640 1330 -600 {lab=#net3}
N 1030 -640 1030 -600 {lab=#net2}
N 1030 -540 1030 -510 {lab=#net8}
N 1330 -540 1330 -510 {lab=#net9}
N 1650 -460 1650 -410 {lab=vout}
N 1540 -460 1650 -460 {lab=vout}
N 1650 -340 1650 -170 {lab=vss}
N 1540 -170 1650 -170 {lab=vss}
C {devices/ipin.sym} 750 -780 0 0 {name=p3 lab=vdd
}
C {devices/ipin.sym} 940 -480 0 0 {name=p5 lab=vin
}
C {devices/ipin.sym} 1430 -480 2 0 {name=p6 lab=vip
}
C {devices/ipin.sym} 770 -170 0 0 {name=p4 lab=vss
}
C {JNW_ATR_SKY130A/JNWATR_PCH_2C5F0.sym} 890 -730 0 0 {name=x23 }
C {devices/lab_wire.sym} 890 -730 0 0 {name=p58 sig_type=std_logic lab=PwrUp}
C {JNW_ATR_SKY130A/JNWATR_NCH_2C5F0.sym} 970 -210 0 0 {name=x25 }
C {devices/lab_wire.sym} 970 -210 0 0 {name=p60 sig_type=std_logic lab=PwrUp_N}
C {devices/ipin.sym} 450 -440 0 0 {name=p2 lab=PwrUp
}
C {JNW_TR_SKY130A/JNWTR_IVX1_CV.sym} 490 -440 0 0 {name=x22 }
C {devices/lab_wire.sym} 630 -440 0 0 {name=p55 sig_type=std_logic lab=PwrUp_N}
C {devices/lab_wire.sym} 530 -400 0 0 {name=p56 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 530 -480 0 0 {name=p57 sig_type=std_logic lab=vdd}
C {JNW_ATR_SKY130A/JNWATR_NCH_2C5F0.sym} 1130 -310 0 0 {name=x1[9:0]}
C {devices/ipin.sym} 1080 -310 0 0 {name=p8 lab=nbias
}
C {JNW_ATR_SKY130A/JNWATR_NCH_2C1F2.sym} 990 -480 0 0 {name=x3 }
C {JNW_ATR_SKY130A/JNWATR_NCH_2C1F2.sym} 1370 -480 0 1 {name=x4 }
C {JNW_ATR_SKY130A/JNWATR_PCH_2C5F0.sym} 990 -690 0 0 {name=x10 }
C {JNW_ATR_SKY130A/JNWATR_PCH_2C5F0.sym} 860 -690 0 1 {name=x11[1:0]}
C {JNW_ATR_SKY130A/JNWATR_PCH_2C5F0.sym} 1370 -690 0 1 {name=x12 }
C {JNW_ATR_SKY130A/JNWATR_PCH_2C5F0.sym} 1500 -690 0 0 {name=x13[1:0]}
C {JNW_ATR_SKY130A/JNWATR_NCH_4C5F0.sym} 860 -260 0 1 {name=x14 }
C {JNW_ATR_SKY130A/JNWATR_NCH_4C5F0.sym} 1500 -260 0 0 {name=x17 }
C {devices/lab_wire.sym} 1160 -480 0 1 {name=p9 sig_type=std_logic lab=vss}
C {JNW_ATR_SKY130A/JNWATR_PCH_2C5F0.sym} 1420 -730 0 0 {name=x1 }
C {devices/lab_wire.sym} 1420 -730 0 0 {name=p10 sig_type=std_logic lab=PwrUp}
C {devices/opin.sym} 1690 -460 0 0 {name=p1 lab=vout
}
C {devices/vsource.sym} 1170 -210 0 0 {name=v_otaTail value=0 savecurrent=true}
C {devices/vsource.sym} 1540 -570 0 0 {name=v_otaOut value=0 savecurrent=true}
C {devices/vsource.sym} 820 -570 0 0 {name=v_otaMirror value=0 savecurrent=true}
C {devices/vsource.sym} 1330 -570 0 0 {name=v_otaVip value=0 savecurrent=true}
C {devices/vsource.sym} 1030 -570 0 0 {name=v_otaVin value=0 savecurrent=true}
C {JNW_TR_SKY130A/JNWTR_CAPX1.sym} 1650 -350 0 0 {name=x2[3:0]}
