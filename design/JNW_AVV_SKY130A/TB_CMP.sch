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
N 530 -220 530 -170 {
lab=pbias}
N 770 -550 770 -510 {
lab=vss}
N 320 -310 350 -310 {
lab=vip}
N 320 -250 350 -250 {
lab=vin}
N 500 -450 500 -360 {
lab=cmp_p1}
N 450 -450 500 -450 {
lab=cmp_p1}
N 550 -450 550 -340 {
lab=cmp_p2}
N 550 -450 600 -450 {
lab=cmp_p2}
N 610 -280 830 -280 {
lab=#net1}
N 930 -280 1060 -280 {
lab=cmp}
N 880 -200 880 -140 {
lab=vss}
N 840 -140 880 -140 {
lab=vss}
N 800 -240 830 -240 {
lab=sample}
C {devices/lab_wire.sym} 450 -410 0 0 {name=p1 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 450 -160 0 0 {name=p4 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 530 -170 0 1 {name=p2 sig_type=std_logic lab=pbias}
C {devices/ipin.sym} 340 -570 0 0 {name=p3 lab=vdd}
C {devices/ipin.sym} 340 -550 0 0 {name=p7 lab=vss}
C {devices/ipin.sym} 320 -310 0 0 {name=p5 lab=vip}
C {devices/ipin.sym} 320 -250 0 0 {name=p6 lab=vin}
C {devices/opin.sym} 1060 -280 0 0 {name=p8 lab=cmp}
C {JNW_AVV_SKY130A/bias.sym} 850 -470 0 0 {name=x2}
C {devices/lab_wire.sym} 770 -590 0 0 {name=p10 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 770 -510 0 0 {name=p9 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 930 -590 0 1 {name=p11 sig_type=std_logic lab=pbias}
C {devices/lab_wire.sym} 930 -510 0 1 {name=p12 sig_type=std_logic lab=nbias}
C {devices/ipin.sym} 340 -510 0 0 {name=p13 lab=cmp_p1}
C {devices/ipin.sym} 340 -530 0 0 {name=p14 lab=cmp_p2}
C {devices/lab_wire.sym} 880 -320 0 0 {name=p15 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 840 -140 0 0 {name=p16 sig_type=std_logic lab=vss}
C {devices/ipin.sym} 340 -590 0 0 {name=p17 lab=clk}
C {devices/lab_wire.sym} 500 -450 0 0 {name=p28 sig_type=std_logic lab=cmp_p1}
C {devices/lab_wire.sym} 550 -450 0 1 {name=p29 sig_type=std_logic lab=cmp_p2}
C {devices/lab_wire.sym} 800 -240 0 0 {name=p23 sig_type=std_logic lab=sample}
C {JNW_AVV_SKY130A/DFF.sym} 880 -260 0 0 {name=x3}
C {devices/ipin.sym} 340 -490 0 0 {name=p18 lab=sample}
C {JNW_AVV_SKY130A/CMP_v2.sym} 340 -160 0 0 {name=x1}
