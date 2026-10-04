ZOS_PATH ?= ../Zeal-8-bit-OS
ZVB_SDK_PATH ?= ../Zeal-VideoBoard-SDK
BIN=bin/lemons.bin
OBJ=obj/main.rel obj/lemons.rel
CC=sdcc
CFLAGS=-mz80 --std-c2x -c -I $(ZOS_PATH)/kernel_headers/sdcc/include/ -I $(ZVB_SDK_PATH)/include --codeseg TEXT --debug
AS=sdasz80 -o -l -s
OBJCOPY=objcopy
LD=sdldz80
LDFLAGS=-n -y -mjwx -i -b _HEADER=0x4000 -k $(ZOS_PATH)/kernel_headers/sdcc/lib -l z80 $(ZOS_LDFLAGS)
ZOS_LIBS=-k $(ZVB_SDK_PATH)/lib -l zvb_sound -l zvb_gfx
all: init $(BIN)

PHONY: init clean reallyclean

init:
	@mkdir -p obj
	@mkdir -p bin

$(BIN): $(OBJ)
	$(LD) $(LDFLAGS) -o $(BIN:.bin=.ihx) \
	../Zeal-8-bit-OS/kernel_headers/sdcc/bin/zos_crt0.rel $(OBJ) $(ZOS_LIBS)
	$(OBJCOPY) --input-target=ihex --output-target binary $(BIN:.bin=.ihx) $(BIN)
	cp $(BIN) s

obj/%.rel: src/%.c
	$(CC) $(CFLAGS) -o $@ $<

obj/%.rel: src/%.asm
	$(AS) $@ $<

obj/lemons.rel: src/lemons.c src/main.h src/game.h
#obj/menu.rel: src/menu.c src/menu.h src/game.h src/sound.h
obj/main.rel: src/main.c
#obj/sound.rel: src/sound.c src/sound.h

clean:
	-rm $(OBJ)
	-rm $(BIN)
	-rm obj/*.lst obj/*.sym obj/*.adb obj/*.asm
	-rm bin/*.ihx bin/*.noi bin/*.map bin/*.cdb
