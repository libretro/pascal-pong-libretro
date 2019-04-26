.PHONY: clean

FPC ?= fpc

pong_libretro.so: pong.pas
	$(FPC) -o$@ $<

clean:
	rm -f pong_libretro.so
