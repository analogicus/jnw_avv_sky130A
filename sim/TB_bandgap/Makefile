

all: typical etc mc summary

include ../../tech/make/sim.make

TB=tran
VIEW=Sch
#VIEW=Lay
CELL=TB_bandgap
LIB =JNW_AVV_130A
OPT=



netlist1:
	make netlist
	-rm inouts.h
	-rm inputs.h
	-rm tmpDig.so
	-rm -rf tmpDig_obj_dir
	ngspice vlnggen ../../rtl/tmpDig.v
	perl ../../tech/script/gensvinst ../../rtl/tmpDig.v tmpDig


test:
	${MAKE} typical OPT="Debug"

typical: netlist1
	cicsim run --ignore --name ${VIEW}_typical ${TB} ${OPT} ${VIEW} Gt Ktt Tt Vt

single: netlist1
	cicsim run --name ${VIEW}_typical ${TB} ${OPT} ${VIEW} Gt "Kff" Tt Vl

slow: netlist
	cicsim run --name ${VIEW}_slow ${TB} ${OPT} ${VIEW} Gt Kss "Th,Tl" Vl

fast: netlist
	cicsim run --name ${VIEW}_fast ${TB} ${OPT} ${VIEW} Gt Kff "Th,Tl" Vh

tfs: netlist
	cicsim run --name ${VIEW}_tfs ${TB} ${OPT} ${VIEW} Gt "Ktt,Kss,Kff" "Tt,Th,Tl" "Vt,Vl,Vh"

etc: netlist1
	cicsim run --ignore --name ${VIEW}_etc ${TB} ${OPT} ${VIEW} Gt "Kss,Kff,Ksf,Kfs" "Tt" "Vl,Vh" 
# Trenger ikke kjøre Th og Tl, fordi jeg sweeper temperatur
# Gt "Kss,Kff,Ksf,Kfs" "Th,Tl" "Vl,Vh"

mc: netlist1
	cicsim run --ignore --name ${VIEW}_mc --count 15 ${TB} ${OPT} ${VIEW} Gt "Kttmm" "Tt" "Vt"

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
