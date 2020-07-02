MCU=attiny84
LFUSE=0xFD
HFUSE=0xDF
F_CPU=4096000
PROGRAMMER=usbtiny

TARGET=main
SRC=main.asm

all:
	avra -o ${TARGET} ${SRC}

flash:
	avrdude -p ${MCU} -c ${PROGRAMMER} -U flash:w:${TARGET}.hex:i -P usb

fuse:
	avrdude -p ${MCU} -c ${PROGRAMMER} -U hfuse:w:${HFUSE}:m -U lfuse:w${LFUSE}:m
