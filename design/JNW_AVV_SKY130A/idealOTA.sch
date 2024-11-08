v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -40 -30 10 -30 {
lab=vin}
N -40 -70 10 -70 {
lab=vip}
N 50 -120 50 -80 {
lab=vout}
N 50 -120 90 -120 {
lab=vout}
N 50 -20 50 20 {
lab=vss}
N 50 20 90 20 {
lab=vss}
C {devices/opin.sym} 90 -120 0 0 {name=p1 lab=vout}
C {devices/ipin.sym} 90 20 2 0 {name=p2 lab=vss}
C {devices/ipin.sym} -40 -70 0 0 {name=p3 lab=vip}
C {devices/ipin.sym} -40 -30 0 0 {name=p4 lab=vin}
C {devices/vcvs.sym} 50 -50 0 0 {name=E1 value="1000 0 1.8 0"}
