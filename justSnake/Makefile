MCU=attiny84
LFUSE=0xFD
HFUSE=0xDF
F_CPU=4000000
PROGRAMMER=usbtiny

NAME=main

all:
	avra ${NAME}.asm

run:
	simavr -m ${MCU} -f ${F_CPU} ${NAME}.hex -g &
	avr-gdb ${NAME}.hex -ex "target remote localhost:1234"
	pkill simavr

flash:
	avrdude -p ${MCU} -c ${PROGRAMMER} -U flash:w:${NAME}.hex:i -P usb

fuse:
	avrdude -p ${MCU} -c ${PROGRAMMER} -U hfuse:w:${HFUSE}:m -U lfuse:w${LFUSE}:m
