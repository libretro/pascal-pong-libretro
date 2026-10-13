.PHONY: clean

pong_libretro.so: pong.pas
	$${FPC:-fpc} -o$@ pong.pas

clean:
	rm -f pong_libretro.so
