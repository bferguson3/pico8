p8:=pico8_64
py:=python3

default:
	@echo Converting script file to data cart...
	$(py) ../tools/script2bin.py script1.scr input.bin
	$(py) ../tools/data2p8cart.py
	@echo Done.

binary: default
	@echo Creating binary...
	rm input.bin
	$(p8) darkthrall.p8 -export "dt.bin data0.p8 data1.p8"
	@echo Done.

run:
	$(p8) darkthrall.p8