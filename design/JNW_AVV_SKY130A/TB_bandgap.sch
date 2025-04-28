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
N 730 -1100 770 -1100 {
lab=vctrl}
N 290 -790 320 -790 {
lab=vctrl}
N 450 -870 450 -860 {
lab=vdd}
N 420 -870 450 -870 {
lab=vdd}
N 610 -1220 610 -1210 {
lab=vdd}
N 580 -1220 610 -1220 {
lab=vdd}
N 1720 -600 1720 -570 {
lab=vss}
N 610 -950 610 -940 {
lab=vss}
N 580 -940 610 -940 {
lab=vss}
N 450 -520 450 -510 {
lab=vss}
N 420 -510 450 -510 {
lab=vss}
N 1790 -640 1790 -600 {
lab=pbias}
N 1790 -600 1840 -600 {
lab=pbias}
N 1720 -830 1720 -800 {
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
N 1690 -570 1720 -570 {
lab=vss}
N 1680 -830 1720 -830 {
lab=vdd}
N 290 -810 320 -810 {
lab=preChrg}
N 1760 -830 1760 -780 {
lab=cmp_p1}
N 1760 -830 1840 -830 {
lab=cmp_p1}
N 1810 -790 1810 -760 {
lab=cmp_p2}
N 1810 -790 1880 -790 {
lab=cmp_p2}
N 1870 -700 1930 -700 {
lab=cmp}
N 1580 -730 1610 -730 {lab=vip}
N 1580 -670 1610 -670 {lab=vin}
N 830 -630 880 -630 {lab=vin}
N 830 -790 880 -790 {lab=vip}
N 460 -1080 510 -1080 {lab=nbias}
N 460 -1120 510 -1120 {lab=pbias}
N 460 -1150 510 -1150 {lab=src_n}
N 460 -1180 510 -1180 {lab=preChrg}
N 460 -1050 510 -1050 {lab=snk}
N 460 -1020 510 -1020 {lab=s_BgCtrl}
N 460 -990 510 -990 {lab=s_PtatCtrl}
N 290 -570 320 -570 {lab=s_Rdiscon_N}
N 290 -590 320 -590 {lab=s_PtatOut}
N 580 -680 610 -680 {lab=Iptat}
N 1200 -490 1260 -490 {lab=vss}
N 1260 -525 1260 -490 {lab=vss}
N 1200 -560 1200 -490 {lab=vss}
N 1260 -640 1260 -595 {lab=Vcap}
N 1260 -640 1300 -640 {lab=Vcap}
N 1200 -640 1200 -590 {lab=Vcap}
N 1200 -640 1260 -640 {lab=Vcap}
N 1200 -690 1200 -640 {lab=Vcap}
N 1400 -640 1460 -640 {lab=vip}
N 1380 -910 1430 -910 {lab=vref}
N 1530 -910 1580 -910 {lab=vin}
N 1200 -770 1200 -750 {lab=#net1}
N 1200 -850 1200 -830 {lab=Iptat}
N 1200 -850 1250 -850 {lab=Iptat}
N 1390 -290 1430 -290 {lab=s_CapRst}
N 1390 -370 1430 -370 {lab=cmp}
N 1510 -370 1560 -370 {lab=#net2}
N 1560 -370 1560 -340 {lab=#net2}
N 1560 -340 1590 -340 {lab=#net2}
N 1510 -290 1560 -290 {lab=#net3}
N 1560 -320 1560 -290 {lab=#net3}
N 1560 -320 1590 -320 {lab=#net3}
N 1680 -330 1750 -330 {lab=tmpPulse}
C {devices/lab_wire.sym} 310 -790 0 0 {name=p2 sig_type=std_logic lab=vctrl}
C {devices/lab_wire.sym} 770 -1100 0 0 {name=p3 sig_type=std_logic lab=vctrl}
C {devices/ipin.sym} 350 -1180 0 0 {name=p4 lab=vdd}
C {devices/ipin.sym} 350 -1160 0 0 {name=p5 lab=vss}
C {devices/lab_wire.sym} 450 -870 0 0 {name=p6 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 1710 -830 0 0 {name=p7 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 610 -1220 0 0 {name=p8 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 1710 -570 0 0 {name=p9 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 610 -940 0 0 {name=p10 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 450 -510 0 0 {name=p11 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 490 -1080 0 0 {name=p17 sig_type=std_logic lab=nbias}
C {devices/opin.sym} 1480 -1180 0 0 {name=p19 lab=vref}
C {devices/ipin.sym} 350 -1120 0 0 {name=p1 lab=src_n}
C {devices/ipin.sym} 350 -1100 0 0 {name=p20 lab=snk}
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
C {devices/lab_wire.sym} 1840 -600 0 0 {name=p33 sig_type=std_logic lab=pbias}
C {devices/ipin.sym} 350 -1140 0 0 {name=p15 lab=preChrg}
C {JNW_AVV_SKY130A/charge_pump.sym} 440 -960 0 0 {name=x3}
C {devices/ipin.sym} 290 -630 0 0 {name=p16 lab=dummy}
C {devices/ipin.sym} 290 -610 0 0 {name=p27 lab=PII2}
C {JNW_AVV_SKY130A/JNW_AVV.sym} 450 -710 0 0 {name=x2}
C {devices/lab_wire.sym} 310 -810 0 0 {name=p36 sig_type=std_logic lab=preChrg}
C {JNW_AVV_SKY130A/bias.sym} 1080 -950 0 0 {name=x4}
C {devices/lab_wire.sym} 1160 -990 0 1 {name=p32 sig_type=std_logic lab=nbias}
C {devices/lab_wire.sym} 1160 -1070 0 1 {name=p34 sig_type=std_logic lab=pbias}
C {devices/ipin.sym} 350 -1240 0 0 {name=p14 lab=setupBias}
C {devices/lab_wire.sym} 1820 -790 0 1 {name=p35 sig_type=std_logic lab=cmp_p2}
C {devices/lab_wire.sym} 1780 -830 0 1 {name=p37 sig_type=std_logic lab=cmp_p1}
C {devices/ipin.sym} 350 -1220 0 0 {name=p38 lab=cmp_p1}
C {devices/ipin.sym} 350 -1200 0 0 {name=p39 lab=cmp_p2}
C {devices/lab_wire.sym} 1000 -1070 0 0 {name=p42 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 1000 -990 0 0 {name=p43 sig_type=std_logic lab=vss}
C {JNW_AVV_SKY130A/CMP_v2.sym} 1600 -580 0 0 {name=x1}
C {JNW_TR_SKY130A/JNWTR_TGX2_CV.sym} 720 -790 0 0 {name=x5 }
C {JNW_TR_SKY130A/JNWTR_TGX2_CV.sym} 720 -630 0 0 {name=x6 }
C {devices/lab_wire.sym} 810 -830 0 1 {name=p12 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 810 -670 0 1 {name=p13 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 810 -740 0 1 {name=p41 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 810 -580 0 1 {name=p44 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 780 -830 0 0 {name=p45 sig_type=std_logic lab=s_BG2CMP}
C {devices/lab_wire.sym} 780 -670 0 0 {name=p46 sig_type=std_logic lab=s_BG2CMP}
C {devices/ipin.sym} 350 -1080 0 0 {name=p47 lab=s_BG2CMP}
C {devices/lab_wire.sym} 1600 -730 0 0 {name=p40 sig_type=std_logic lab=vip}
C {devices/lab_wire.sym} 1600 -670 0 0 {name=p48 sig_type=std_logic lab=vin}
C {devices/lab_wire.sym} 850 -790 0 1 {name=p49 sig_type=std_logic lab=vip}
C {devices/lab_wire.sym} 850 -630 0 1 {name=p50 sig_type=std_logic lab=vin}
C {devices/lab_wire.sym} 490 -1120 0 0 {name=p18 sig_type=std_logic lab=pbias}
C {devices/lab_wire.sym} 490 -1150 0 0 {name=p51 sig_type=std_logic lab=src_n}
C {devices/lab_wire.sym} 490 -1180 0 0 {name=p52 sig_type=std_logic lab=preChrg}
C {devices/lab_wire.sym} 490 -1050 0 0 {name=p53 sig_type=std_logic lab=snk}
C {devices/lab_wire.sym} 490 -1020 0 0 {name=p54 sig_type=std_logic lab=s_BgCtrl}
C {devices/lab_wire.sym} 490 -990 0 0 {name=p55 sig_type=std_logic lab=s_PtatCtrl}
C {devices/ipin.sym} 350 -1060 0 0 {name=p56 lab=s_BgCtrl}
C {devices/ipin.sym} 350 -1040 0 0 {name=p57 lab=s_PtatCtrl}
C {devices/ipin.sym} 350 -1020 0 0 {name=p59 lab=s_CapRst}
C {devices/lab_wire.sym} 1000 -1030 0 0 {name=p60 sig_type=std_logic lab=setupBias}
C {devices/lab_wire.sym} 600 -740 0 1 {name=p61 sig_type=std_logic lab=vref}
C {devices/lab_wire.sym} 1900 -700 0 1 {name=p62 sig_type=std_logic lab=cmp}
C {devices/ipin.sym} 290 -570 0 0 {name=p76 lab=s_Rdiscon_N}
C {devices/ipin.sym} 290 -590 0 0 {name=p77 lab=s_PtatOut}
C {devices/lab_wire.sym} 600 -680 0 1 {name=p78 sig_type=std_logic lab=Iptat}
C {devices/ipin.sym} 350 -1000 0 0 {name=p79 lab=s_Ref2CMP}
C {devices/ipin.sym} 350 -980 0 0 {name=p80 lab=s_Cap2CMP}
C {JNW_TR_SKY130A/JNWTR_CAPX4.sym} 1260 -535 0 0 {name=x1[60:0]}
C {JNW_ATR_SKY130A/JNWATR_NCH_2C1F2.sym} 1160 -560 0 0 {name=x7 }
C {devices/lab_wire.sym} 1160 -560 0 0 {name=p58 sig_type=std_logic lab=s_CapRst}
C {JNW_ATR_SKY130A/JNWATR_PCH_2C1F2.sym} 1160 -720 0 0 {name=x8 }
C {devices/lab_wire.sym} 1160 -720 0 0 {name=p63 sig_type=std_logic lab=s_CapRst}
C {devices/lab_wire.sym} 1200 -720 0 1 {name=p64 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 1210 -850 0 1 {name=p65 sig_type=std_logic lab=Iptat}
C {JNW_TR_SKY130A/JNWTR_TGX2_CV.sym} 1290 -640 0 0 {name=x9 }
C {devices/lab_wire.sym} 1380 -590 0 1 {name=p66 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 1380 -680 0 1 {name=p67 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 1450 -640 0 0 {name=p69 sig_type=std_logic lab=vip}
C {JNW_TR_SKY130A/JNWTR_TGX2_CV.sym} 1420 -910 0 0 {name=x10 }
C {devices/lab_wire.sym} 1510 -860 0 1 {name=p68 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 1510 -950 0 1 {name=p70 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 1390 -910 0 1 {name=p71 sig_type=std_logic lab=vref}
C {devices/lab_wire.sym} 1550 -910 0 1 {name=p72 sig_type=std_logic lab=vin}
C {devices/lab_wire.sym} 1480 -950 0 0 {name=p73 sig_type=std_logic lab=s_Ref2CMP}
C {devices/lab_wire.sym} 1350 -680 0 0 {name=p74 sig_type=std_logic lab=s_Cap2CMP}
C {devices/lab_wire.sym} 1220 -490 0 1 {name=p75 sig_type=std_logic lab=vss}
C {devices/vsource.sym} 1200 -800 0 0 {name=vIptat value=0 savecurrent=true}
C {devices/lab_wire.sym} 1280 -640 0 0 {name=p81 sig_type=std_logic lab=Vcap}
C {JNW_TR_SKY130A/JNWTR_ANX1_CV.sym} 1590 -320 0 0 {name=x11 }
C {JNW_TR_SKY130A/JNWTR_IVX1_CV.sym} 1430 -290 0 0 {name=x12 }
C {devices/lab_wire.sym} 1390 -290 0 0 {name=p82 sig_type=std_logic lab=s_CapRst}
C {JNW_TR_SKY130A/JNWTR_IVX1_CV.sym} 1430 -370 2 1 {name=x13 }
C {devices/lab_wire.sym} 1470 -410 0 0 {name=p83 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 1470 -250 0 0 {name=p84 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 1630 -290 0 0 {name=p85 sig_type=std_logic lab=vss}
C {devices/lab_wire.sym} 1630 -370 0 0 {name=p86 sig_type=std_logic lab=vdd}
C {devices/lab_wire.sym} 1390 -370 0 0 {name=p87 sig_type=std_logic lab=cmp}
C {devices/lab_wire.sym} 1470 -330 0 0 {name=p88 sig_type=std_logic lab=vdd}
C {devices/opin.sym} 1750 -330 0 0 {name=p89 lab=tmpPulse}
