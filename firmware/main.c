#include <avr/io.h>
#include <util/delay.h>

#define F_CPU 4000000

long long px = 0;
long now;

int main(void) {
	int r = 0;
	int c = 0;
	int s = 0;
	int t = 0;

	DDRA |= (1 << PA0);
	DDRA |= (1 << PA1);
	DDRA |= (1 << PA2);
	DDRA |= (1 << PA3);
	while(1) {
		if(s ^ (c & 1) ^ (r & 1)) PORTA |= 1 << PA2;
		else PORTA &= ~(1 << PA2);
		if(c == r) PORTA |= 1 << PA3;
		else PORTA &= ~(1 << PA3);
		PORTA |= 1 << PA0;
		PORTA &= ~(1 << PA0);
		c++;
		if(c == 8) {
			c = 0;
			PORTA |= 1 << PA1;
			PORTA &= ~(1 << PA1);
			r++;
			if(r == 8) {
				r = 0;
			}
		}
		t++;
		if(t == 20000) {
			t = 0;
			s ^= 1;
		}
	}

	return 1;
}
