v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 580 -740 610 -740 {
lab=vref}
N 570 -1100 610 -1100 {
lab=vctrl}
N 290 -790 320 -790 {
lab=vctrl}
N 450 -870 450 -860 {
lab=vdd}
N 420 -870 450 -870 {
lab=vdd}
N 450 -1220 450 -1210 {
lab=vdd}
N 420 -1220 450 -1220 {
lab=vdd}
N 1220 -590 1220 -560 {
lab=vss}
N 450 -950 450 -940 {
lab=vss}
N 420 -940 450 -940 {
lab=vss}
N 1290 -630 1290 -590 {
lab=pbias}
N 1220 -820 1220 -790 {
lab=vdd}
N 290 -770 320 -770 {
lab=PA}
N 290 -750 320 -750 {
lab=PB}
N 290 -730 320 -730 {
lab=PC}
N 290 -710 320 -710 {
lab=PD}
N 290 -690 320 -690 {
lab=PI1}
N 290 -670 320 -670 {
lab=PI2}
N 290 -650 320 -650 {
lab=PII1}
N 290 -630 320 -630 {
lab=dummy}
N 290 -610 320 -610 {
lab=PII2}
N 1190 -560 1220 -560 {
lab=vss}
N 1180 -820 1220 -820 {
lab=vdd}
N 290 -810 320 -810 {
lab=preChrg}
N 1080 -720 1110 -720 {lab=vip}
N 1080 -660 1110 -660 {lab=vin}
N 830 -630 880 -630 {lab=vin}
N 830 -790 880 -790 {lab=vip}
N 300 -1120 350 -1120 {lab=cmp}
N 300 -1150 350 -1150 {lab=src_n}
N 300 -1180 350 -1180 {lab=preChrg}
N 300 -1050 350 -1050 {lab=snk}
N 300 -1020 350 -1020 {lab=s_BgCtrl}
N 300 -990 350 -990 {lab=s_PtatCtrl}
N 290 -570 320 -570 {lab=s_Rdiscon_N}
N 290 -590 320 -590 {lab=s_PtatOut}
N 580 -680 610 -680 {lab=Iptat}
N 1250 -610 1250 -560 {lab=nbias}
N 1250 -560 1280 -560 {lab=nbias}
N 1030 -250 1070 -250 {lab=vip}
N 890 -250 930 -250 {lab=Vcap}
N 1160 -570 1188 -570 {lab=PwrUp}
N 1188 -577 1188 -570 {lab=PwrUp}
N 290 -550 320 -550 {lab=PwrUp}
N 1310 -790 1310 -750 {lab=cmp_p2}
N 1310 -790 1350 -790 {lab=cmp_p2}
N 1260 -820 1260 -770 {lab=cmp_p1}
N 1260 -820 1300 -820 {lab=cmp_p1}
N 450 -480 490 -480 {lab=vss}
N 450 -500 450 -480 {lab=vss}
N 1290 -590 1360 -590 {lab=pbias}
N 890 -430 940 -430 {lab=#net1}
N 780 -430 830 -430 {lab=vref}
N 1040 -430 1080 -430 {lab=vin}
N 710 -630 730 -630 {lab=#net2}
N 580 -630 650 -630 {lab=vn}
N 580 -790 650 -790 {lab=vp}
N 710 -790 730 -790 {lab=#net3}
N 1370 -690 1450 -690 {lab=cmp}
C {devices/lab_wire.sym} 310 -790 0 0 {name=p2 sig_type=std_logic lab=vctrl}
C {devices/lab_wire.sym} 610 -1100 0 0 {name=p3 sig_type=std_logic lab=vctrl}
C {devices/ipin.sym} 140 -1110 0 0 {name=p4 lab=vdd}
C {devices/ipin.sym} 140 -1090 0 0 {name=p5 lab=vss}
C {devices/lab_wire.sym} 450 -870 0 0 {name=p6 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 1210 -820 0 0 {name=p7 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 450 -1220 0 0 {name=p8 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 1210 -560 0 0 {name=p9 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 450 -940 0 0 {name=p10 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 480 -480 0 0 {name=p11 sig_type=std_logic lab=vss}
C {devices/opin.sym} 1360 -1080 0 0 {name=p19 lab=vref}
C {devices/ipin.sym} 140 -1050 0 0 {name=p1 lab=src_n}
C {devices/ipin.sym} 140 -1030 0 0 {name=p20 lab=snk}
C {devices/ipin.sym} 290 -770 0 0 {name=p21 lab=PA}
C {devices/ipin.sym} 290 -750 0 0 {name=p22 lab=PB}
C {devices/ipin.sym} 290 -730 0 0 {name=p23 lab=PC}
C {devices/ipin.sym} 290 -710 0 0 {name=p24 lab=PD}
C {devices/ipin.sym} 290 -690 0 0 {name=p25 lab=PI1}
C {devices/ipin.sym} 290 -670 0 0 {name=p26 lab=PI2}
C {devices/ipin.sym} 290 -650 0 0 {name=p28 lab=PII1}
C {devices/opin.sym} 1360 -1060 0 0 {name=p29 lab=cmp}
C {devices/lab_wire.sym} 620 -790 0 0 {name=p30 sig_type=std_logic lab=vp}
C {devices/lab_wire.sym} 620 -630 0 0 {name=p31 sig_type=std_logic lab=vn}
C {devices/lab_wire.sym} 1340 -590 0 0 {name=p33 sig_type=std_logic lab=pbias}
C {devices/ipin.sym} 140 -1070 0 0 {name=p15 lab=preChrg}
C {JNW_AVV_SKY130A/charge_pump.sym} 280 -960 0 0 {name=x3}
C {devices/ipin.sym} 290 -630 0 0 {name=p16 lab=dummy}
C {devices/ipin.sym} 290 -610 0 0 {name=p27 lab=PII2}
C {devices/lab_wire.sym} 310 -810 0 0 {name=p36 sig_type=std_logic lab=preChrg}
C {JNW_AVV_SKY130A/bias.sym} 1060 -1040 0 0 {name=x4}
C {devices/lab_wire.sym} 1140 -1080 0 1 {name=p32 sig_type=std_logic lab=nbias}
C {devices/lab_wire.sym} 1140 -1160 0 1 {name=p34 sig_type=std_logic lab=pbias}
C {devices/ipin.sym} 140 -1170 0 0 {name=p14 lab=setupBias}
C {devices/ipin.sym} 140 -1150 0 0 {name=p38 lab=cmp_p1}
C {devices/ipin.sym} 140 -1130 0 0 {name=p39 lab=cmp_p2}
C {devices/lab_wire.sym} 980 -1160 0 0 {name=p42 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 980 -1080 0 0 {name=p43 sig_type=std_logic lab=vss}
C {JNW_AVV_SKY130A/CMP_v2.sym} 1100 -570 0 0 {name=x1}
C {JNW_TR_SKY130A/JNWTR_TGX2_CV.sym} 720 -790 0 0 {name=x5 }
C {JNW_TR_SKY130A/JNWTR_TGX2_CV.sym} 720 -630 0 0 {name=x6 }
C {devices/lab_wire.sym} 810 -830 0 1 {name=p12 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 810 -670 0 1 {name=p13 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 810 -740 0 1 {name=p41 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 810 -580 0 1 {name=p44 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 780 -830 0 0 {name=p45 sig_type=std_logic lab=s_BG2CMP}
C {devices/lab_wire.sym} 780 -670 0 0 {name=p46 sig_type=std_logic lab=s_BG2CMP}
C {devices/ipin.sym} 140 -1010 0 0 {name=p47 lab=s_BG2CMP}
C {devices/lab_wire.sym} 1100 -720 0 0 {name=p40 sig_type=std_logic lab=vip}
C {devices/lab_wire.sym} 1100 -660 0 0 {name=p48 sig_type=std_logic lab=vin}
C {devices/lab_wire.sym} 850 -790 0 1 {name=p49 sig_type=std_logic lab=vip}
C {devices/lab_wire.sym} 850 -630 0 1 {name=p50 sig_type=std_logic lab=vin}
C {devices/lab_wire.sym} 330 -1120 0 0 {name=p18 sig_type=std_logic lab=cmp}
C {devices/lab_wire.sym} 330 -1150 0 0 {name=p51 sig_type=std_logic lab=src_n}
C {devices/lab_wire.sym} 330 -1180 0 0 {name=p52 sig_type=std_logic lab=preChrg}
C {devices/lab_wire.sym} 330 -1050 0 0 {name=p53 sig_type=std_logic lab=snk}
C {devices/lab_wire.sym} 330 -1020 0 0 {name=p54 sig_type=std_logic lab=s_BgCtrl}
C {devices/lab_wire.sym} 330 -990 0 0 {name=p55 sig_type=std_logic lab=s_PtatCtrl}
C {devices/ipin.sym} 140 -990 0 0 {name=p56 lab=s_BgCtrl}
C {devices/ipin.sym} 140 -970 0 0 {name=p57 lab=s_PtatCtrl}
C {devices/ipin.sym} 140 -950 0 0 {name=p59 lab=s_CapRst}
C {devices/lab_wire.sym} 980 -1130 0 0 {name=p60 sig_type=std_logic lab=PwrUp}
C {devices/lab_wire.sym} 600 -740 0 1 {name=p61 sig_type=std_logic lab=vref}
C {devices/lab_wire.sym} 1410 -690 0 1 {name=p62 sig_type=std_logic lab=cmp}
C {devices/ipin.sym} 290 -570 0 0 {name=p76 lab=s_Rdiscon_N}
C {devices/ipin.sym} 290 -590 0 0 {name=p77 lab=s_PtatOut}
C {devices/lab_wire.sym} 600 -680 0 1 {name=p78 sig_type=std_logic lab=Iptat}
C {devices/ipin.sym} 140 -930 0 0 {name=p79 lab=s_Ref2CMP}
C {devices/ipin.sym} 140 -910 0 0 {name=p80 lab=s_Cap2CMP}
C {JNW_TR_SKY130A/JNWTR_TGX2_CV.sym} 920 -250 0 0 {name=x9 }
C {devices/lab_wire.sym} 1010 -200 0 1 {name=p66 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 1010 -290 0 1 {name=p67 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 1070 -250 0 1 {name=p69 sig_type=std_logic lab=vip}
C {devices/lab_wire.sym} 980 -290 0 0 {name=p74 sig_type=std_logic lab=s_Cap2CMP}
C {devices/lab_wire.sym} 890 -250 0 0 {name=p81 sig_type=std_logic lab=Vcap}
C {devices/lab_wire.sym} 1260 -560 0 1 {name=p17 sig_type=std_logic lab=nbias}
C {JNW_AVV_SKY130A/tmpCore.sym} 480 -310 0 0 {name=x7}
C {devices/lab_wire.sym} 330 -360 0 0 {name=p58 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 330 -340 0 0 {name=p63 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 330 -280 0 0 {name=p64 sig_type=std_logic lab=s_CCOcap2}
C {devices/lab_wire.sym} 330 -300 0 0 {name=p65 sig_type=std_logic lab=s_CCOcap1}
C {devices/lab_wire.sym} 330 -320 0 0 {name=p75 sig_type=std_logic lab=Iptat}
C {devices/lab_wire.sym} 330 -260 0 0 {name=p90 sig_type=std_logic lab=s_CapRst}
C {devices/lab_wire.sym} 630 -360 0 1 {name=p91 sig_type=std_logic lab=Vcap}
C {devices/lab_wire.sym} 1260 -820 0 1 {name=p93 sig_type=std_logic lab=cmp_p1}
C {devices/lab_wire.sym} 1310 -790 0 1 {name=p96 sig_type=std_logic lab=cmp_p2}
C {devices/ipin.sym} 140 -890 0 0 {name=p94 lab=s_CCOcap1}
C {devices/ipin.sym} 140 -850 0 0 {name=p95 lab=PwrUp}
C {devices/lab_wire.sym} 980 -1110 0 0 {name=p97 sig_type=std_logic lab=setupBias}
C {devices/lab_wire.sym} 1160 -570 0 0 {name=p98 sig_type=std_logic lab=PwrUp}
C {devices/lab_wire.sym} 350 -1080 0 0 {name=p99 sig_type=std_logic lab=PwrUp}
C {devices/lab_wire.sym} 290 -550 0 0 {name=p100 sig_type=std_logic lab=PwrUp}
C {JNW_TR_SKY130A/JNWTR_TGX2_CV.sym} 930 -430 0 0 {name=x45 }
C {devices/lab_wire.sym} 1020 -380 0 1 {name=p68 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 1020 -470 0 1 {name=p70 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 780 -430 0 0 {name=p71 sig_type=std_logic lab=vref}
C {devices/lab_wire.sym} 1080 -430 0 1 {name=p72 sig_type=std_logic lab=vin}
C {devices/lab_wire.sym} 990 -470 0 0 {name=p73 sig_type=std_logic lab=s_Ref2CMP}
C {devices/vsource.sym} 860 -430 1 0 {name=V_intoVref1 value=0 savecurrent=false}
C {devices/vsource.sym} 680 -630 1 0 {name=V_intoVn value=0 savecurrent=true}
C {devices/vsource.sym} 680 -790 1 0 {name=V_intoVp value=0 savecurrent=true}
C {devices/ipin.sym} 140 -870 0 0 {name=p101 lab=s_CCOcap2}
C {JNW_TR_SKY130A/JNWTR_CAPX1.sym} 1450 -630 0 0 {name=x8 }
C {devices/lab_wire.sym} 1450 -620 0 0 {name=p35 sig_type=std_logic lab=vss}
C {JNW_AVV_SKY130A/bandgap_core.sym} 450 -680 0 0 {name=x2}
