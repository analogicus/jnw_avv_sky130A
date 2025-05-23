v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 450 -370 450 -280 {lab=#net1}
N 600 -370 650 -370 {lab=vout}
N 450 -370 520 -370 {lab=#net1}
N 560 -310 620 -310 {lab=vss}
N 520 -410 520 -370 {lab=#net1}
N 600 -410 600 -370 {lab=vout}
N 560 -390 560 -310 {lab=vss}
C {devices/ipin.sym} 200 -380 2 1 {name=p2 lab=vip}
C {devices/ipin.sym} 200 -310 2 1 {name=p3 lab=vin}
C {devices/ipin.sym} 250 -220 2 1 {name=p5 lab=vss}
C {devices/opin.sym} 650 -370 2 1 {name=p1 lab=vout}
C {devices/bsource.sym} 450 -250 0 0 {name=B1 VAR=V FUNC="\{OFFSET + AMPLITUDE/2*(tanh(V(ivip,ivin)*GAIN*2/AMPLITUDE))\}"}
C {devices/vsource.sym} 230 -380 1 0 {name=V1 value=0 savecurrent=false}
C {devices/vsource.sym} 230 -310 1 0 {name=V2 value=0 savecurrent=false}
C {devices/lab_pin.sym} 260 -380 0 1 {name=p6 sig_type=std_logic lab=ivip}
C {devices/lab_pin.sym} 260 -310 0 1 {name=p7 sig_type=std_logic lab=ivin}
C {devices/lab_pin.sym} 450 -220 0 0 {name=p8 sig_type=std_logic lab=vss}
C {devices/capa.sym} 620 -340 0 0 {name=C1
m=1
value=\{COUT\}
footprint=1206
device="ceramic capacitor"}
C {devices/lab_pin.sym} 620 -310 0 1 {name=p9 sig_type=std_logic lab=vss}
C {JNW_TR_SKY130A/JNWTR_RPPO2.sym} 520 -370 0 0 {name=x1 }
C {JNW_TR_SKY130A/JNWTR_RPPO2.sym} 520 -410 0 0 {name=x2 }
