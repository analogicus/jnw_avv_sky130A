v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 580 -740 610 -740 {
lab=vref}
N 580 -630 730 -630 {
lab=vn}
N 580 -790 730 -790 {
lab=vp}
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
N 1330 -590 1330 -560 {
lab=vss}
N 450 -950 450 -940 {
lab=vss}
N 420 -940 450 -940 {
lab=vss}
N 450 -520 450 -510 {
lab=vss}
N 420 -510 450 -510 {
lab=vss}
N 1400 -630 1400 -590 {
lab=pbias}
N 1400 -590 1450 -590 {
lab=pbias}
N 1330 -820 1330 -790 {
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
N 1300 -560 1330 -560 {
lab=vss}
N 1290 -820 1330 -820 {
lab=vdd}
N 290 -810 320 -810 {
lab=preChrg}
N 1420 -780 1420 -750 {
lab=vss}
N 1420 -780 1510 -780 {
lab=vss}
N 1480 -690 1540 -690 {
lab=cmp}
N 1190 -720 1220 -720 {lab=vip}
N 1190 -660 1220 -660 {lab=vin}
N 830 -630 880 -630 {lab=vin}
N 830 -790 880 -790 {lab=vip}
N 300 -1100 350 -1100 {lab=cmp}
N 300 -1150 350 -1150 {lab=src_n}
N 300 -1180 350 -1180 {lab=preChrg}
N 300 -1050 350 -1050 {lab=snk}
N 300 -1020 350 -1020 {lab=s_BgCtrl}
N 300 -990 350 -990 {lab=s_PtatCtrl}
N 290 -570 320 -570 {lab=s_Rdiscon_N}
N 290 -590 320 -590 {lab=s_PtatOut}
N 580 -680 610 -680 {lab=Iptat}
N 1210 -250 1250 -250 {lab=s_CapRst}
N 1210 -330 1250 -330 {lab=cmp}
N 1330 -330 1380 -330 {lab=#net1}
N 1380 -330 1380 -300 {lab=#net1}
N 1380 -300 1410 -300 {lab=#net1}
N 1330 -250 1380 -250 {lab=#net2}
N 1380 -280 1380 -250 {lab=#net2}
N 1380 -280 1410 -280 {lab=#net2}
N 1500 -290 1570 -290 {lab=tmpPulse}
N 1360 -610 1360 -560 {lab=nbias}
N 1360 -560 1390 -560 {lab=nbias}
N 820 -240 860 -240 {lab=vip}
N 820 -400 860 -400 {lab=vin}
N 680 -400 720 -400 {lab=vref}
N 680 -240 720 -240 {lab=Vcap}
N 1370 -890 1370 -770 {lab=vdd}
N 1510 -810 1510 -780 {lab=vss}
C {devices/lab_wire.sym} 310 -790 0 0 {name=p2 sig_type=std_logic lab=vctrl}
C {devices/lab_wire.sym} 610 -1100 0 0 {name=p3 sig_type=std_logic lab=vctrl}
C {devices/ipin.sym} 140 -1190 0 0 {name=p4 lab=vdd}
C {devices/ipin.sym} 140 -1170 0 0 {name=p5 lab=vss}
C {devices/lab_wire.sym} 450 -870 0 0 {name=p6 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 1320 -820 0 0 {name=p7 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 450 -1220 0 0 {name=p8 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 1320 -560 0 0 {name=p9 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 450 -940 0 0 {name=p10 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 450 -510 0 0 {name=p11 sig_type=std_logic lab=vss}
C {devices/opin.sym} 1480 -1180 0 0 {name=p19 lab=vref}
C {devices/ipin.sym} 140 -1130 0 0 {name=p1 lab=src_n}
C {devices/ipin.sym} 140 -1110 0 0 {name=p20 lab=snk}
C {devices/ipin.sym} 290 -770 0 0 {name=p21 lab=PA}
C {devices/ipin.sym} 290 -750 0 0 {name=p22 lab=PB}
C {devices/ipin.sym} 290 -730 0 0 {name=p23 lab=PC}
C {devices/ipin.sym} 290 -710 0 0 {name=p24 lab=PD}
C {devices/ipin.sym} 290 -690 0 0 {name=p25 lab=PI1}
C {devices/ipin.sym} 290 -670 0 0 {name=p26 lab=PI2}
C {devices/ipin.sym} 290 -650 0 0 {name=p28 lab=PII1}
C {devices/opin.sym} 1480 -1160 0 0 {name=p29 lab=cmp}
C {devices/lab_wire.sym} 670 -790 0 0 {name=p30 sig_type=std_logic lab=vp}
C {devices/lab_wire.sym} 670 -630 0 0 {name=p31 sig_type=std_logic lab=vn}
C {devices/lab_wire.sym} 1450 -590 0 0 {name=p33 sig_type=std_logic lab=pbias}
C {devices/ipin.sym} 140 -1150 0 0 {name=p15 lab=preChrg}
C {JNW_AVV_SKY130A/charge_pump.sym} 280 -960 0 0 {name=x3}
C {devices/ipin.sym} 290 -630 0 0 {name=p16 lab=dummy}
C {devices/ipin.sym} 290 -610 0 0 {name=p27 lab=PII2}
C {JNW_AVV_SKY130A/JNW_AVV.sym} 450 -710 0 0 {name=x2}
C {devices/lab_wire.sym} 310 -810 0 0 {name=p36 sig_type=std_logic lab=preChrg}
C {JNW_AVV_SKY130A/bias.sym} 1060 -1040 0 0 {name=x4}
C {devices/lab_wire.sym} 1140 -1080 0 1 {name=p32 sig_type=std_logic lab=nbias}
C {devices/lab_wire.sym} 1140 -1160 0 1 {name=p34 sig_type=std_logic lab=pbias}
C {devices/ipin.sym} 140 -1250 0 0 {name=p14 lab=setupBias}
C {devices/ipin.sym} 140 -1230 0 0 {name=p38 lab=cmp_p1}
C {devices/ipin.sym} 140 -1210 0 0 {name=p39 lab=cmp_p2}
C {devices/lab_wire.sym} 980 -1160 0 0 {name=p42 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 980 -1080 0 0 {name=p43 sig_type=std_logic lab=vss}
C {JNW_AVV_SKY130A/CMP_v2.sym} 1210 -570 0 0 {name=x1}
C {JNW_TR_SKY130A/JNWTR_TGX2_CV.sym} 720 -790 0 0 {name=x5 }
C {JNW_TR_SKY130A/JNWTR_TGX2_CV.sym} 720 -630 0 0 {name=x6 }
C {devices/lab_wire.sym} 810 -830 0 1 {name=p12 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 810 -670 0 1 {name=p13 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 810 -740 0 1 {name=p41 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 810 -580 0 1 {name=p44 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 780 -830 0 0 {name=p45 sig_type=std_logic lab=s_BG2CMP}
C {devices/lab_wire.sym} 780 -670 0 0 {name=p46 sig_type=std_logic lab=s_BG2CMP}
C {devices/ipin.sym} 140 -1090 0 0 {name=p47 lab=s_BG2CMP}
C {devices/lab_wire.sym} 1210 -720 0 0 {name=p40 sig_type=std_logic lab=vip}
C {devices/lab_wire.sym} 1210 -660 0 0 {name=p48 sig_type=std_logic lab=vin}
C {devices/lab_wire.sym} 850 -790 0 1 {name=p49 sig_type=std_logic lab=vip}
C {devices/lab_wire.sym} 850 -630 0 1 {name=p50 sig_type=std_logic lab=vin}
C {devices/lab_wire.sym} 330 -1100 0 0 {name=p18 sig_type=std_logic lab=cmp}
C {devices/lab_wire.sym} 330 -1150 0 0 {name=p51 sig_type=std_logic lab=src_n}
C {devices/lab_wire.sym} 330 -1180 0 0 {name=p52 sig_type=std_logic lab=preChrg}
C {devices/lab_wire.sym} 330 -1050 0 0 {name=p53 sig_type=std_logic lab=snk}
C {devices/lab_wire.sym} 330 -1020 0 0 {name=p54 sig_type=std_logic lab=s_BgCtrl}
C {devices/lab_wire.sym} 330 -990 0 0 {name=p55 sig_type=std_logic lab=s_PtatCtrl}
C {devices/ipin.sym} 140 -1070 0 0 {name=p56 lab=s_BgCtrl}
C {devices/ipin.sym} 140 -1050 0 0 {name=p57 lab=s_PtatCtrl}
C {devices/ipin.sym} 140 -1030 0 0 {name=p59 lab=s_CapRst}
C {devices/lab_wire.sym} 980 -1120 0 0 {name=p60 sig_type=std_logic lab=setupBias}
C {devices/lab_wire.sym} 600 -740 0 1 {name=p61 sig_type=std_logic lab=vref}
C {devices/lab_wire.sym} 1510 -690 0 1 {name=p62 sig_type=std_logic lab=cmp}
C {devices/ipin.sym} 290 -570 0 0 {name=p76 lab=s_Rdiscon_N}
C {devices/ipin.sym} 290 -590 0 0 {name=p77 lab=s_PtatOut}
C {devices/lab_wire.sym} 600 -680 0 1 {name=p78 sig_type=std_logic lab=Iptat}
C {devices/ipin.sym} 140 -1010 0 0 {name=p79 lab=s_Ref2CMP}
C {devices/ipin.sym} 140 -990 0 0 {name=p80 lab=s_Cap2CMP}
C {JNW_TR_SKY130A/JNWTR_TGX2_CV.sym} 710 -240 0 0 {name=x9 }
C {devices/lab_wire.sym} 800 -190 0 1 {name=p66 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 800 -280 0 1 {name=p67 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 860 -240 0 1 {name=p69 sig_type=std_logic lab=vip}
C {JNW_TR_SKY130A/JNWTR_TGX2_CV.sym} 710 -400 0 0 {name=x10 }
C {devices/lab_wire.sym} 800 -350 0 1 {name=p68 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 800 -440 0 1 {name=p70 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 680 -400 0 0 {name=p71 sig_type=std_logic lab=vref}
C {devices/lab_wire.sym} 860 -400 0 1 {name=p72 sig_type=std_logic lab=vin}
C {devices/lab_wire.sym} 770 -440 0 0 {name=p73 sig_type=std_logic lab=s_Ref2CMP}
C {devices/lab_wire.sym} 770 -280 0 0 {name=p74 sig_type=std_logic lab=s_Cap2CMP}
C {devices/lab_wire.sym} 680 -240 0 0 {name=p81 sig_type=std_logic lab=Vcap}
C {JNW_TR_SKY130A/JNWTR_ANX1_CV.sym} 1410 -280 0 0 {name=x11 }
C {JNW_TR_SKY130A/JNWTR_IVX1_CV.sym} 1250 -250 0 0 {name=x12 }
C {devices/lab_wire.sym} 1210 -250 0 0 {name=p82 sig_type=std_logic lab=s_CapRst}
C {JNW_TR_SKY130A/JNWTR_IVX1_CV.sym} 1250 -330 2 1 {name=x13 }
C {devices/lab_wire.sym} 1290 -370 0 0 {name=p83 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 1290 -210 0 0 {name=p84 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 1450 -250 0 0 {name=p85 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 1450 -330 0 0 {name=p86 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 1210 -330 0 0 {name=p87 sig_type=std_logic lab=cmp}
C {devices/lab_wire.sym} 1290 -290 0 0 {name=p88 sig_type=std_logic lab=vdd}
C {devices/opin.sym} 1570 -290 0 0 {name=p89 lab=tmpPulse}
C {devices/lab_wire.sym} 1370 -560 0 1 {name=p17 sig_type=std_logic lab=nbias}
C {JNW_AVV_SKY130A/tmpCore.sym} 430 -240 0 0 {name=x7}
C {devices/lab_wire.sym} 280 -290 0 0 {name=p58 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 280 -270 0 0 {name=p63 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 280 -210 0 0 {name=p64 sig_type=std_logic lab=cmp_p1}
C {devices/lab_wire.sym} 280 -230 0 0 {name=p65 sig_type=std_logic lab=cmp_p2}
C {devices/lab_wire.sym} 280 -250 0 0 {name=p75 sig_type=std_logic lab=Iptat}
C {devices/lab_wire.sym} 280 -190 0 0 {name=p90 sig_type=std_logic lab=s_CapRst}
C {devices/lab_wire.sym} 580 -290 0 1 {name=p91 sig_type=std_logic lab=Vcap}
C {devices/lab_wire.sym} 1370 -840 1 0 {name=p93 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 1470 -780 1 0 {name=p96 sig_type=std_logic lab=vss}
