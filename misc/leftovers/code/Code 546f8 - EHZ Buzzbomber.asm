

;
; +-------------------------------------------------------------------------+
; |	This file is generated by The Interactive Disassembler (IDA)	    |
; |	Copyright (c) 2007 by DataRescue sa/nv,	<ida@datarescue.com>	    |
; |	    Licensed to: GVU, Gerhard Uphoff, 1	user, adv, 10/2007	    |
; +-------------------------------------------------------------------------+
;
; Input	MD5   :	B70093F8B585351711F2D0293B5E4B6F

; ---------------------------------------------------------------------------
; File Name   :	Z:\emu\gen\s2a\sym\copies\code_546f8
; Format      :	Binary file
; Base Address:	0000h Range: 0000h - 02D0h Loaded length: 02D0h

; Processor:	    68000
; Target Assembler: 680x0 Assembler in MRI compatible mode
; This file should be compiled with "as	-M"

; ===========================================================================

; Segment type:	Pure code
; segment "ROM"

wasp:					; XREF:	frameout
		bra.w	$2D0
; ---------------------------------------------------------------------------
		moveq	#0,d0
		move.b	$24(a0),d0
		move.w	wasp_move_tbl(pc,d0.w),d1
		jmp	wasp_move_tbl(pc,d1.w)
; ---------------------------------------------------------------------------
wasp_move_tbl:	dc.w loc_64-wasp_move_tbl ; DATA XREF: ROM:wasp_move_tblo
					; ROM:00000014o ...
		dc.w loc_108-wasp_move_tbl
		dc.w waspafterb-wasp_move_tbl
		dc.w waspshot-wasp_move_tbl
; ---------------------------------------------------------------------------

waspshot:				; DATA XREF: ROM:00000018o
		bsr.w	$2E2		; XREF:	speedset2
		lea	($15A18).l,a1
		bsr.w	$2D6		; XREF:	patchg
		bra.w	$2DC		; XREF:	frameoutchkd
; ---------------------------------------------------------------------------

waspafterb:				; DATA XREF: ROM:00000016o
		move.l	$2A(a0),a1
		tst.b	(a1)
		beq.w	$2D0		; XREF:	frameout
		tst.w	$30(a1)
		bmi.s	_cnt$feba
		rts
; ---------------------------------------------------------------------------

_cnt$feba:				; CODE XREF: ROM:0000003Aj
		move.w	8(a1),8(a0)
		move.w	$C(a1),$C(a0)
		move.b	$22(a1),$22(a0)
		move.b	1(a1),1(a0)
		lea	($15A18).l,a1
		bsr.w	$2D6		; XREF:	patchg
		bra.w	$2DC		; XREF:	frameoutchkd
; ---------------------------------------------------------------------------

loc_64:					; DATA XREF: ROM:wasp_move_tblo
		move.l	#$15A34,4(a0)
		move.w	#$3E6,2(a0)
		or.b	#4,1(a0)
		move.b	#$A,$20(a0)
		move.b	#4,$18(a0)
		move.b	#$10,$19(a0)
		move.b	#$10,$16(a0)
		move.b	#$18,$17(a0)
		move.b	#3,$18(a0)
		addq.b	#2,$24(a0)
		bsr.w	$FFFF82D8	; XREF:	actwkchk2
		bne.s	return_106
		move.b	#$4B,0(a1) ; 'K'
		move.b	#4,$24(a1)
		move.l	#$15A34,4(a1)
		move.w	#$3E6,2(a1)
		move.b	#4,$18(a1)
		move.b	#$10,$19(a1)
		move.b	$22(a0),$22(a1)
		move.b	1(a0),1(a1)
		move.b	#1,$1C(a1)
		move.l	a0,$2A(a1)
		move.w	8(a0),8(a1)
		move.w	$C(a0),$C(a1)
		move.w	#$100,$2E(a0)
		move.w	#$FF00,$10(a0)
		btst	#0,1(a0)
		beq.s	return_106
		neg.w	$10(a0)

return_106:				; CODE XREF: ROM:000000A4j
					; ROM:00000100j
		rts
; ---------------------------------------------------------------------------

loc_108:				; DATA XREF: ROM:00000014o
		moveq	#0,d0
		move.b	$25(a0),d0
		move.w	waspmove_tbl(pc,d0.w),d1
		jsr	waspmove_tbl(pc,d1.w)
		lea	($15A18).l,a1
		bsr.w	$2D6		; XREF:	patchg
		bra.w	$2DC		; XREF:	frameoutchkd
; ---------------------------------------------------------------------------
waspmove_tbl:	dc.w waspfly-waspmove_tbl ; DATA XREF: ROM:waspmove_tblo
					; ROM:00000126o
		dc.w waspshoot-waspmove_tbl
; ---------------------------------------------------------------------------

waspfly:				; DATA XREF: ROM:waspmove_tblo
		bsr.w	sub_16A
		subq.w	#1,$30(a0)
		move.w	$30(a0),d0
		cmp.w	#$F,d0
		beq.s	_here2$jeba
		tst.w	d0
		bpl.s	_end$jeba
		subq.w	#1,$2E(a0)
		bgt.w	$2E2		; XREF:	speedset2

_here$jeba:
		move.w	#$1E,$30(a0)

_end$jeba:				; CODE XREF: ROM:0000013Cj
		rts
; ---------------------------------------------------------------------------

_here2$jeba:				; CODE XREF: ROM:00000138j
		sf	$32(a0)
		neg.w	$10(a0)
		bchg	#0,1(a0)
		bchg	#0,$22(a0)
		move.w	#$100,$2E(a0)
		rts

; =============== S U B	R O U T	I N E =======================================


sub_16A:				; CODE XREF: ROM:waspflyp
		tst.b	$32(a0)
		bne.w	_out$keba
		move.w	8(a0),d0
		sub.w	($FFFFB008).w,d0
		move.w	d0,d1
		bpl.s	_cnt$keba
		neg.w	d0

_cnt$keba:				; CODE XREF: sub_16A+12j
		cmp.w	#$28,d0	; '('
		blt.s	_out$keba
		cmp.w	#$30,d0	; '0'
		bgt.s	_out$keba
		tst.w	d1
		bpl.s	_toleft$keba
		btst	#0,1(a0)
		beq.s	_out$keba
		bra.s	_sht$keba
; ---------------------------------------------------------------------------

_toleft$keba:				; CODE XREF: sub_16A+24j
		btst	#0,1(a0)
		bne.s	_out$keba

_sht$keba:				; CODE XREF: sub_16A+2Ej
		st	$32(a0)
		addq.b	#2,$25(a0)
		move.b	#3,$1C(a0)
		move.w	#$32,$34(a0) ; '2'

_out$keba:				; CODE XREF: sub_16A+4j sub_16A+1Aj ...
		rts
; End of function sub_16A

; ---------------------------------------------------------------------------

waspshoot:				; DATA XREF: ROM:00000126o
		move.w	$34(a0),d0
		subq.w	#1,d0
		blt.s	loc_1CC
		move.w	d0,$34(a0)
		cmp.w	#$14,d0
		beq.s	_here$leba
		rts
; ---------------------------------------------------------------------------

loc_1CC:				; CODE XREF: ROM:000001BEj
		subq.b	#2,$25(a0)
		rts
; ---------------------------------------------------------------------------

_here$leba:				; CODE XREF: ROM:000001C8j
		jsr	$DAB8		; XREF:	actwkchk2
		bne.s	_out$leba
		move.b	#$4B,0(a1) ; 'K'
		move.b	#6,$24(a1)
		move.l	#$15A34,4(a1)
		move.w	#$3E6,2(a1)
		move.b	#4,$18(a1)
		move.b	#$10,$19(a1)
		move.b	$22(a0),$22(a1)
		move.b	1(a0),1(a1)
		move.b	#2,$1C(a1)
		move.w	8(a0),8(a1)
		move.w	$C(a0),$C(a1)
		move.w	#$180,$12(a1)
		move.w	#$FE80,$10(a1)
		btst	#0,1(a1)
		beq.s	_out$leba
		neg.w	$10(a1)

_out$leba:				; CODE XREF: ROM:000001D8j
					; ROM:00000230j
		rts
; ---------------------------------------------------------------------------
off_238:	dc.w byte_240-off_238	; DATA XREF: ROM:off_238o
					; ROM:0000023Ao ...
		dc.w byte_243-off_238
		dc.w byte_247-off_238
		dc.w byte_24B-off_238
byte_240:	dc.b  $F,  0,$FF	; 0 ; DATA XREF: ROM:off_238o
byte_243:	dc.b   2,  3,  4,$FF	; 0 ; DATA XREF: ROM:0000023Ao
byte_247:	dc.b   3,  5,  6,$FF	; 0 ; DATA XREF: ROM:0000023Co
byte_24B:	dc.b   9,  1,  1,  1	; 0 ; DATA XREF: ROM:0000023Eo
		dc.b   1,  1,$FD,  0	; 4
		dc.b   0		; 8
wasppat:	dc.w waspsp00-wasppat	; DATA XREF: ROM:wasppato
					; ROM:00000256o ...
		dc.w waspsp01-wasppat
		dc.w waspsp02-wasppat
		dc.w waspsp03-wasppat
		dc.w waspsp04-wasppat
		dc.w waspsp05-wasppat
		dc.w waspsp06-wasppat
waspsp00:	dc.w 2			; DATA XREF: ROM:wasppato
		dc.w $F809,    0,    0,$FFE8; 0
		dc.w $F809,    6,    3,	   0; 4
waspsp01:	dc.w 3			; DATA XREF: ROM:00000256o
		dc.w $F809,    0,    0,$FFE8; 0
		dc.w $F805,   $C,    6,	   0; 4
		dc.w  $805,  $10,    8,	   2; 8
waspsp02:	dc.w 3			; DATA XREF: ROM:00000258o
		dc.w $F809,    0,    0,$FFE8; 0
		dc.w $F805,   $C,    6,	   0; 4
		dc.w  $805,  $14,   $A,	   2; 8
waspsp03:	dc.w 1			; DATA XREF: ROM:0000025Ao
		dc.w $F001,  $14,   $A,	   4; 0
waspsp04:	dc.w 1			; DATA XREF: ROM:0000025Co
		dc.w $F001,  $16,   $B,	   4; 0
waspsp05:	dc.w 1			; DATA XREF: ROM:0000025Eo
		dc.w $1001,  $18,   $C,	   9; 0
waspsp06:	dc.w 1			; DATA XREF: ROM:00000260o
		dc.w $1001,  $1A,   $D,	   9; 0
; end of 'ROM'


		END