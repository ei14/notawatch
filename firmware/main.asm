; NotAWatch Firmware
; 2020 edition
; Created by Thomas Kaldahl

.nolist
.include "tn84Adef.inc"
.list

.equ ser_a = pa0
.equ ser_b = pa1
.equ rfsh = pa2
.equ shft = pa2
.equ btn_a = pb2
.equ btn_b = pa7

.def ns = r26
.def us = r27
.def ms = r28
.def sc = r29
.def mn = r30
.def dy = r31

.org 0
	sbi ddra, ser_a
	sbi ddra, ser_b
	sbi ddra, shft
	sbi ddra, rfsh

sleep:

time:
	ldi r25, 6
	rcall inc_time
	rjmp time

inc_time: ; r25: amount to be added. This function needs 3 extra to the amount.
	add ns, r25
	brcc return
	ldi r25, 4
	add ns, r25
	inc us
	brne return
	ldi r25, 4
	add ns, r25
	inc ms
	brne return
	ldi r25, 4
	add ns, r25
	inc sc
	brne return
	ldi r25, 4
	add ns, r25
	inc mn
	brne return
	ldi r25, 4
	add ns, r25
	inc dy
	brne return

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
