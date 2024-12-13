v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 410 -410 460 -410 {
lab=vdd}
N 460 -410 460 -380 {
lab=vdd}
N 460 -180 460 -160 {
lab=vss}
N 420 -160 460 -160 {
lab=vss}
N 300 -310 350 -310 {
lab=vip}
N 300 -250 350 -250 {
lab=vin}
N 610 -280 650 -280 {
lab=cmp}
N 670 -520 760 -520 {
lab=nbias}
N 670 -520 670 -500 {
lab=nbias}
N 880 -660 880 -630 {
lab=pbias}
N 790 -630 880 -630 {
lab=pbias}
N 790 -690 790 -630 {
lab=pbias}
N 790 -690 840 -690 {
lab=pbias}
N 880 -750 880 -690 {
lab=vdd}
N 670 -470 670 -420 {
lab=vss}
N 610 -670 610 -420 {
lab=vss}
N 610 -420 670 -420 {
lab=vss}
N 610 -670 650 -670 {
lab=vss}
N 760 -520 760 -470 {
lab=nbias}
N 710 -470 760 -470 {
lab=nbias}
N 880 -470 880 -420 {
lab=vss}
N 760 -470 840 -470 {
lab=nbias}
N 670 -550 670 -520 {
lab=nbias}
N 880 -630 880 -600 {
lab=pbias}
N 880 -540 880 -500 {
lab=#net1}
N 610 -830 650 -830 {
lab=vss}
N 610 -750 610 -670 {
lab=vss}
N 670 -1070 670 -1030 {
lab=vdd}
N 850 -750 880 -750 {
lab=vdd}
N 610 -910 610 -830 {
lab=vss}
N 610 -750 650 -750 {
lab=vss}
N 610 -830 610 -750 {
lab=vss}
N 670 -420 880 -420 {
lab=vss}
N 670 -630 670 -610 {
lab=#net2}
N 610 -910 650 -910 {
lab=vss}
N 610 -990 650 -990 {
lab=vss}
N 610 -990 610 -910 {
lab=vss}
N 530 -220 530 -170 {
lab=pbias}
C {devices/lab_wire.sym} 450 -410 0 0 {name=p1 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 450 -160 0 0 {name=p4 sig_type=std_logic lab=vss}
C {JNW_AVV_SKY130A/CMP.sym} 280 -140 0 0 {name=x1}
C {devices/lab_wire.sym} 840 -630 0 0 {name=p32 sig_type=std_logic lab=pbias}
C {devices/lab_wire.sym} 670 -1070 0 1 {name=p34 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 760 -420 0 1 {name=p35 sig_type=std_logic lab=vss}
C {JNW_ATR_SKY130A/JNWATR_NCH_2C5F0.sym} 710 -470 0 1 {name=x28 }
C {devices/lab_wire.sym} 880 -750 0 0 {name=p13 sig_type=std_logic lab=vdd}
C {JNW_ATR_SKY130A/JNWATR_NCH_2C5F0.sym} 840 -470 0 0 {name=x4 }
C {devices/lab_wire.sym} 820 -470 0 0 {name=p14 sig_type=std_logic lab=nbias}
C {JNW_TR_SKY130A/JNWTR_RPPO16.sym} 670 -630 1 1 {name=x26 }
C {devices/vsource.sym} 670 -580 0 0 {name=v_nbias value=0 savecurrent=true}
C {devices/vsource.sym} 880 -570 0 0 {name=v_pbias value=0 savecurrent=true}
C {JNW_TR_SKY130A/JNWTR_RPPO16.sym} 670 -710 1 1 {name=x5 }
C {JNW_TR_SKY130A/JNWTR_RPPO16.sym} 670 -790 1 1 {name=x6 }
C {JNW_TR_SKY130A/JNWTR_RPPO16.sym} 670 -870 1 1 {name=x8 }
C {JNW_TR_SKY130A/JNWTR_RPPO16.sym} 670 -950 1 1 {name=x9 }
C {JNW_ATR_SKY130A/JNWATR_PCH_2C5F0.sym} 840 -690 0 0 {name=x10 }
C {devices/lab_wire.sym} 530 -170 0 1 {name=p2 sig_type=std_logic lab=pbias}
C {devices/ipin.sym} 340 -570 0 0 {name=p3 lab=vdd}
C {devices/ipin.sym} 340 -550 0 0 {name=p7 lab=vss}
C {devices/ipin.sym} 300 -310 0 0 {name=p5 lab=vip}
C {devices/ipin.sym} 300 -250 0 0 {name=p6 lab=vin}
C {devices/opin.sym} 650 -280 0 0 {name=p8 lab=cmp}
