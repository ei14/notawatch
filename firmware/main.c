/*
NotAWatch Firmware
2020 edition
Created by Thomas Kaldahl
*/

#include <avr/io.h>
#include <util/delay.h>

#define F_CPU 4000000

long long px = 0; // bitwise storage of screen state
long now; // time in centiseconds
long then; // general purpose timestamp storage
char inc; // number of centiseconds to add at the end of the frame
char i; // general purpose loop iterator
char mode; /* watch mode.
	0 - sleep
	1 - time
	2 - date
	3 - time, loading set time
	4 - set time: centisecond
	5 - set time: second
	6 - set time: minute
	7 - set time: hour
	8 - set time: day
	9 - set time: month
	10 - time, loading stopwatch
	11 - stopwatch: paused
	12 - stopwatch: running
	13 - stopwatch: showing lap, running
	14 - stopwatch: showing lap, paused
	15 - time, loading game menu
	16 - game menu
	17 - snake
	18 - snake game over
	19 - connect 4
	20 - connect 4 won
	21 - connect 4, loading sleep
*/

void redraw(void) {
	for(i = 0; i < 64; i++) {
		// set row bit
		if(px & (1 << i)) PORTA |= 0b0100;
		else PORTA &= 0b1011;

		// set column bit
		if(i%9 == 0) PORTA |= 0b1000;
		else PORTA &= 0b0111;

		// tick shift register clocks
		PORTA |= 0b0001;
		PORTA &= 0b1110;

		if(i%8 == 0) {
			// submit row
			PORTA |= 0b0010;
			PORTA &= 0b1101;
		}
	}
}

int main(void) {
	DDRA = 0b1111;
	while(1) {
		inc = 1;

		switch(mode) {

		}

		redraw();
		now += inc;
	}

	return 1;
}
