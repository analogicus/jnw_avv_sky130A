v {xschem version=3.4.6RC file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 410 -410 410 -390 {
lab=#net1}
N 410 -500 410 -470 {
lab=vdd}
N 410 -500 460 -500 {
lab=vdd}
N 460 -500 460 -380 {
lab=vdd}
N 50 -330 50 -310 {
lab=vdd}
N 20 -330 50 -330 {
lab=vdd}
N 50 -250 50 -230 {
lab=gnd}
N 20 -230 50 -230 {
lab=gnd}
N 460 -180 460 -160 {
lab=gnd}
N 420 -160 460 -160 {
lab=gnd}
N 300 -310 350 -310 {
lab=vip}
N 300 -250 350 -250 {
lab=vin}
N 120 -330 120 -310 {
lab=vin}
N 90 -330 120 -330 {
lab=vin}
N 190 -330 190 -310 {
lab=vip}
N 160 -330 190 -330 {
lab=vip}
N 120 -250 120 -230 {
lab=gnd}
N 50 -230 120 -230 {
lab=gnd}
N 190 -250 190 -230 {
lab=gnd}
N 120 -230 190 -230 {
lab=gnd}
N 610 -280 650 -280 {
lab=vout}
C {devices/isource.sym} 410 -440 0 1 {name=I0 value=12.5u}
C {devices/lab_wire.sym} 450 -500 0 0 {name=p1 sig_type=std_logic lab=vdd}
C {devices/vsource.sym} 50 -280 0 0 {name=V1 value=3 savecurrent=false}
C {devices/lab_wire.sym} 50 -330 0 0 {name=p2 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 50 -230 0 0 {name=p3 sig_type=std_logic lab=gnd}
C {devices/lab_wire.sym} 450 -160 0 0 {name=p4 sig_type=std_logic lab=gnd}
C {devices/lab_wire.sym} 330 -310 0 0 {name=p5 sig_type=std_logic lab=vip}
C {devices/lab_wire.sym} 330 -250 0 0 {name=p6 sig_type=std_logic lab=vin}
C {devices/vsource.sym} 190 -280 0 0 {name=V2 value="pwl 0 0 500n 3" savecurrent=false}
C {devices/vsource.sym} 120 -280 0 0 {name=V3 value=1.5 savecurrent=false}
C {devices/lab_wire.sym} 190 -330 0 0 {name=p7 sig_type=std_logic lab=vip}
C {devices/lab_wire.sym} 120 -330 0 0 {name=p8 sig_type=std_logic lab=vin}
C {devices/code_shown.sym} 60 -440 0 0 {name=s1 only_toplevel=false value=".tran 1n 500n"}
C {devices/lab_wire.sym} 650 -280 0 0 {name=p9 sig_type=std_logic lab=vout}
C {JNW_AVV_SKY130A/CMP.sym} 280 -140 0 0 {name=x1}
