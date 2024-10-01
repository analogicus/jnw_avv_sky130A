v {xschem version=3.4.6RC file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -170 -670 -170 -560 {
lab=#net1}
N -170 -560 -60 -560 {
lab=#net1}
N -170 -810 -170 -730 {
lab=#net2}
N -170 -810 20 -810 {
lab=#net2}
N -560 -770 -560 -540 {
lab=VDD_1V8}
N -560 -540 -250 -540 {
lab=VDD_1V8}
N -250 -540 -250 -300 {
lab=VDD_1V8}
C {devices/ipin.sym} -560 -770 0 0 {name=p1 lab=VDD_1V8}
C {devices/ipin.sym} -560 30 0 0 {name=p2 lab=VSS}
C {devices/ipin.sym} -560 -440 0 0 {name=p3 lab=PWRUP_1V8}
C {JNW_TR_SKY130A/JNWTR_TGX2_CV.sym} -70 -560 0 0 {name=x1 }
C {JNW_ATR_SKY130A/JNWATR_PCH_4C5F0.sym} -210 -700 0 0 {name=x2 }
