

all: typical etc mc summary

include ../../tech/make/sim.make

TB=tran
VIEW=Sch
#VIEW=Lay
CELL=TB_charge_pump
LIB =JNW_AVV_130A
OPT=


netlist1:
	make netlist
	-rm chargePump.so
	-rm -rf chargePump_obj_dir
	ngspice vlnggen ../../rtl/chargePump.v
	perl ../../tech/script/gensvinst ../../rtl/chargePump.v chargePump


test:
	${MAKE} typical OPT="Debug"

typical: netlist1
	cicsim run --name ${VIEW}_typical ${TB} ${OPT} ${VIEW} Gt Ktt Tt Vt

single: netlist1
	cicsim run --name ${VIEW}_typical ${TB} ${OPT} ${VIEW} Gt Kff Tt Vt

slow: netlist
	cicsim run --name ${VIEW}_slow ${TB} ${OPT} ${VIEW} Gt Kss "Th,Tl" Vl

fast: netlist
	cicsim run --name ${VIEW}_fast ${TB} ${OPT} ${VIEW} Gt Kff "Th,Tl" Vh

tfs: netlist
	cicsim run --name ${VIEW}_tfs ${TB} ${OPT} ${VIEW} Gt "Ktt,Kss,Kff" "Tt,Th,Tl" "Vt,Vl,Vh"

etc: netlist
	cicsim run --name ${VIEW}_etc ${TB} ${OPT} ${VIEW} Gt "Kss,Kff,Ksf,Kfs" "Th,Tl" "Vl,Vh"

mc: netlist
	cicsim run --name ${VIEW}_mc --count 30 ${TB} ${OPT} ${VIEW} Gt "Kttmm" "Tt" "Vt"

ntc: netlist
	cicsim run --name ${VIEW}_ntc ${TB} ${OPT} ${VIEW} Gt "Ktt,Kss,Kff" "Tt" Vt

temp: netlist
	cicsim run --name ${VIEW}_temp ${TB} ${OPT} ${VIEW} Gt "Ktt" "Tt,Th,Tl" Vt

summary:
	cicsim summary --output "README.md"

slide:
	pandoc -s  -t slidy README.md -o README.html


clean:
	-rm -rf output_*
	-rm -rf __pycache__
	-rm *.run
	-rm *.pdf
	-rm *.csv
