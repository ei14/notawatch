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
.def ns = r16
.def us = r17
.def ms = r18
.def sc = r19
.def mn = r20
.def dy = r21

.org 0
	sbi ddra, ser_a
	sbi ddra, ser_b
	sbi ddra, shft
	sbi ddra, rfsh

sleep:

render_line:

time:
	inc r31

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
