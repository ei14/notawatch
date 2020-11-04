; NotAWatch Firmware
; 2020 edition
; Created by Thomas Kaldahl

.nolist
.include "tn84Adef.inc"
.list

.equ ser_a = pa0
.equ ser_b = pa1
.equ rfsh = pa2
.equ shft = pa3
.equ btn_a = pb2
.equ btn_b = pa7

.def ns = r20
.def us = r21
.def ms = r22
.def sc = r23
.def mn = r24
.def dy = r25

.org 0
	sbi ddra, ser_a
	sbi ddra, ser_b
	sbi ddra, shft
	sbi ddra, rfsh

sleep:

time:
	
	ldi r19, 6
	rcall inc_time
	rjmp time

inc_time: ; r19: amount to be added. This function needs 3 extra to the amount.
	add ns, r19
	brcc return
	ldi r19, 4
	add ns, r19
	inc us
	brne return
	ldi r19, 4
	add ns, r19
	inc ms
	brne return
	ldi r19, 4
	add ns, r19
	inc sc
	brne return
	ldi r19, 4
	add ns, r19
	inc mn
	brne return
	ldi r19, 3
	add ns, r19
	
	ret

return:
	ret

date:

time_loading_set:

time_loading_stop:

time_loading_game:

set_cs:

set_sc:

set_mn:

set_hr:

set_dy:

set_mo:

stop_paused:

stop_run:

stop_lap_run:

stop_lap_paused:

game_menu:

game_snek:

game_snek_over:

game_con4:

game_con4_won:

game_con4_load_sleep:
