v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 220 -170 220 -150 {
lab=B}
N 220 -170 240 -170 {
lab=B}
N 90 -70 110 -70 {
lab=vss}
N 110 -90 110 -70 {
lab=vss}
N 90 -170 110 -170 {
lab=ctrl}
N 110 -170 110 -150 {
lab=ctrl}
N 200 -70 220 -70 {
lab=A}
N 220 -90 220 -70 {
lab=A}
C {devices/bsource.sym} 220 -120 0 0 {name=B1 VAR=I FUNC="V(ctrl)*V(A,B)/1k
"}
C {devices/ipin.sym} 90 -170 0 0 {name=p1 lab=ctrl
}
C {devices/iopin.sym} 200 -70 2 0 {name=p2 lab=A
}
C {devices/iopin.sym} 240 -170 2 1 {name=p3 lab=B
}
C {devices/ipin.sym} 90 -70 0 0 {name=p4 lab=vss
}
C {devices/res.sym} 110 -120 0 0 {name=R1
value=100M
footprint=1206
device=resistor
m=1}
