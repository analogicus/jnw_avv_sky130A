v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 360 -150 380 -150 {
lab=vout}
N 360 -150 360 -130 {
lab=vout}
N 130 -150 130 -130 {
lab=vip}
N 210 -150 210 -130 {
lab=vdd}
N 280 -150 280 -130 {
lab=vin}
N 130 -70 130 -50 {
lab=vss}
N 90 -50 130 -50 {
lab=vss}
N 210 -70 210 -50 {
lab=vss}
N 130 -50 210 -50 {
lab=vss}
N 280 -50 360 -50 {
lab=vss}
N 280 -70 280 -50 {
lab=vss}
N 210 -50 280 -50 {
lab=vss}
N 360 -70 360 -50 {
lab=vss}
C {devices/ipin.sym} 90 -50 0 0 {name=p2 lab=vss
}
C {devices/ipin.sym} 210 -150 0 0 {name=p3 lab=vdd
}
C {devices/ipin.sym} 280 -150 0 0 {name=p5 lab=vin
}
C {devices/ipin.sym} 130 -150 0 0 {name=p6 lab=vip
}
C {devices/opin.sym} 380 -150 0 0 {name=p7 lab=vout}
C {devices/bsource.sym} 360 -100 0 0 {name=B1 VAR=V FUNC="(1 + tanh(-1000000*(v(vip) -v(vin) )))/2*v(vdd)"}
C {devices/res.sym} 130 -100 0 0 {name=R1
value=100M
footprint=1206
device=resistor
m=1}
C {devices/res.sym} 210 -100 0 0 {name=R2
value=100M
footprint=1206
device=resistor
m=1}
C {devices/res.sym} 280 -100 0 0 {name=R3
value=100M
footprint=1206
device=resistor
m=1}
