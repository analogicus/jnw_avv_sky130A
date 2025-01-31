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
N 610 -280 650 -280 {
lab=cmp}
N 530 -220 530 -170 {
lab=pbias}
N 740 -430 740 -390 {
lab=vss}
N 320 -310 350 -310 {
lab=vip}
N 320 -250 350 -250 {
lab=vin}
N 500 -450 500 -360 {
lab=cmp_p1}
N 410 -450 500 -450 {
lab=cmp_p1}
N 550 -470 550 -340 {
lab=cmp_p1}
N 410 -470 550 -470 {
lab=cmp_p1}
C {devices/lab_wire.sym} 450 -410 0 0 {name=p1 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 450 -160 0 0 {name=p4 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 530 -170 0 1 {name=p2 sig_type=std_logic lab=pbias}
C {devices/ipin.sym} 340 -570 0 0 {name=p3 lab=vdd}
C {devices/ipin.sym} 340 -550 0 0 {name=p7 lab=vss}
C {devices/ipin.sym} 320 -310 0 0 {name=p5 lab=vip}
C {devices/ipin.sym} 320 -250 0 0 {name=p6 lab=vin}
C {devices/opin.sym} 650 -280 0 0 {name=p8 lab=cmp}
C {JNW_AVV_SKY130A/bias.sym} 820 -350 0 0 {name=x2}
C {devices/lab_wire.sym} 740 -470 0 0 {name=p10 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 740 -390 0 0 {name=p9 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 900 -470 0 1 {name=p11 sig_type=std_logic lab=pbias}
C {devices/lab_wire.sym} 900 -390 0 1 {name=p12 sig_type=std_logic lab=nbias}
C {devices/ipin.sym} 410 -450 0 0 {name=p13 lab=cmp_p1}
C {JNW_AVV_SKY130A/CMP_v2.sym} 340 -160 0 0 {name=x1}
C {devices/ipin.sym} 410 -470 0 0 {name=p14 lab=cmp_p2}
