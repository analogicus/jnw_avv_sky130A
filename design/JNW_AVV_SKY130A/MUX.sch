v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 0 0 0 40 {
lab=#net1}
N 30 -120 80 -120 {
lab=Z}
N 80 0 80 80 {
lab=Z}
N 30 -80 80 -80 {
lab=Z}
N 80 -120 80 -80 {
lab=Z}
N 30 80 80 80 {
lab=Z}
N 30 120 80 120 {
lab=Z}
N 80 80 80 120 {
lab=Z}
N 80 0 130 0 {
lab=Z}
N 80 -80 80 0 {
lab=Z}
N -80 0 0 0 {
lab=#net1}
N 0 -40 0 0 {
lab=#net1}
N -30 -100 -30 -80 {
lab=A}
N -200 0 -160 0 {
lab=S}
N -60 -160 0 -160 {
lab=S}
N -60 160 0 160 {
lab=S}
N -30 -120 -30 -100 {
lab=A}
N -160 100 -30 100 {
lab=B}
N -160 -100 -30 -100 {
lab=A}
N -30 100 -30 120 {
lab=A}
N -30 80 -30 100 {
lab=A}
C {JNW_TR_SKY130A/JNWTR_NCHDL.sym} 0 -160 3 1 {name=XMN1b}
C {JNW_TR_SKY130A/JNWTR_PCHDL.sym} 0 -40 3 0 {name=XMP0}
C {devices/lab_wire.sym} 0 -80 3 1 {name=p2 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 0 -120 1 1 {name=p4 sig_type=std_logic lab=vss}
C {JNW_TR_SKY130A/JNWTR_IVX1_CV.sym} -160 0 0 0 {name=x1 }
C {devices/lab_wire.sym} -120 -40 0 1 {name=p5 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} -120 40 0 1 {name=p6 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} -60 160 0 0 {name=p8 sig_type=std_logic lab=S}
C {devices/lab_wire.sym} -60 -160 0 0 {name=p9 sig_type=std_logic lab=S}
C {devices/ipin.sym} -200 0 0 0 {name=p7 lab=S}
C {devices/ipin.sym} -160 -100 0 0 {name=p10 lab=A}
C {devices/ipin.sym} -160 100 0 0 {name=p11 lab=B}
C {devices/opin.sym} 130 0 0 0 {name=p12 lab=Z}
C {devices/ipin.sym} -280 -120 0 0 {name=p13 lab=vdd}
C {devices/ipin.sym} -280 -100 0 0 {name=p14 lab=vss}
C {JNW_TR_SKY130A/JNWTR_NCHDL.sym} 0 40 3 1 {name=XMN1}
C {JNW_TR_SKY130A/JNWTR_PCHDL.sym} 0 160 3 0 {name=XMP1}
C {devices/lab_wire.sym} 0 120 3 1 {name=p1 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 0 80 1 1 {name=p3 sig_type=std_logic lab=vss}
