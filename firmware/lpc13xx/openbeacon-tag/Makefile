TARGET=openbeacon-tag
ARCH=LPC13
CPU=$(ARCH)43
DEBUG=-g
OPTIM=-O3 -mword-relocations

APP_CFLAGS=-Iinc -std=gnu99 -fgnu89-inline -D__USE_CMSIS
APP_LDFLAGS=-lm

APP_SRC= \
  src/main.c \
  src/pmu.c \
  src/sound.c \
  src/nRF_CMD.c \
  src/nRF_API.c \
  src/3d_acceleration.c

APP_SRC+=$(IMAGES_C)

all: $(TARGET).bin

publish: clean $(TARGET).bin
	rm -f $(TARGET).zip
	../lpc-flash/src/lpc-flash $(TARGET).bin firmware.bin
	zip $(TARGET).zip firmware.bin
	scp $(TARGET).zip firmware.bin meri@bitmanufaktur.net:/home/wwwrun/open.bitmanufaktur.com/web/www/people/milosch/usb2tag/

app_clean:
	rm -f $(TARGET).zip $(TARGET)-firmware.bin
	find src -name '*.o' -exec rm \{\} \;

include ../core/Makefile.rules
