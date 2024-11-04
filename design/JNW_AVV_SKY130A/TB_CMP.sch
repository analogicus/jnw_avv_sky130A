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
lab=gnd}
N 420 -160 460 -160 {
lab=gnd}
N 300 -310 350 -310 {
lab=vip}
N 300 -250 350 -250 {
lab=vin}
N 610 -280 650 -280 {
lab=vout}
N 590 -430 680 -430 {
lab=nbias}
N 680 -430 680 -410 {
lab=nbias}
N 680 -380 680 -330 {
lab=vss}
N 650 -760 680 -760 {
lab=vdd}
N 740 -530 740 -330 {
lab=vss}
N 680 -330 740 -330 {
lab=vss}
N 680 -490 680 -430 {
lab=nbias}
N 700 -530 740 -530 {
lab=vss}
N 740 -610 740 -530 {
lab=vss}
N 700 -610 740 -610 {
lab=vss}
N 740 -690 740 -610 {
lab=vss}
N 700 -690 740 -690 {
lab=vss}
N 680 -760 680 -730 {
lab=vdd}
N 590 -430 590 -380 {
lab=nbias}
N 590 -380 640 -380 {
lab=nbias}
C {devices/lab_wire.sym} 450 -410 0 0 {name=p1 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 450 -160 0 0 {name=p4 sig_type=std_logic lab=gnd}
C {devices/lab_wire.sym} 330 -310 0 0 {name=p5 sig_type=std_logic lab=vip}
C {devices/lab_wire.sym} 330 -250 0 0 {name=p6 sig_type=std_logic lab=vin}
C {devices/lab_wire.sym} 650 -280 0 0 {name=p9 sig_type=std_logic lab=vout}
C {JNW_AVV_SKY130A/CMP.sym} 280 -140 0 0 {name=x1}
C {devices/lab_wire.sym} 680 -760 0 0 {name=p34 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 730 -330 0 0 {name=p35 sig_type=std_logic lab=vss}
C {JNW_TR_SKY130A/JNWTR_RPPO4.sym} 680 -490 3 0 {name=x31 }
C {JNW_ATR_SKY130A/JNWATR_NCH_2C5F0.sym} 640 -380 0 0 {name=x28 }
C {devices/lab_wire.sym} 650 -430 0 0 {name=p12 sig_type=std_logic lab=nbias}
C {JNW_TR_SKY130A/JNWTR_RPPO4.sym} 680 -570 3 0 {name=x5 }
C {JNW_TR_SKY130A/JNWTR_RPPO4.sym} 680 -650 3 0 {name=x6 }
