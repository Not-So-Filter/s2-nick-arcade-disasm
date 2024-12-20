

;
; +-------------------------------------------------------------------------+
; |	This file is generated by The Interactive Disassembler (IDA)	    |
; |	Copyright (c) 2007 by DataRescue sa/nv,	<ida@datarescue.com>	    |
; |	    Licensed to: GVU, Gerhard Uphoff, 1	user, adv, 10/2007	    |
; +-------------------------------------------------------------------------+
;
; Input	MD5   :	2BB628529063CA95985C8F32ED4A1E2D

; ---------------------------------------------------------------------------
; File Name   :	Z:\emu\gen\s2a\sym\copies\code_59304
; Format      :	Binary file
; Base Address:	0000h Range: 0000h - 08D4h Loaded length: 08D4h

; Processor:	    68000
; Target Assembler: 680x0 Assembler in MRI compatible mode
; This file should be compiled with "as	-M"

; ===========================================================================

; Segment type:	Pure code
; segment "ROM"

bossdriller:
		moveq	#0,d0
		move.b	$25(a0),d0
		move.w	bossdrillmove_tbl(pc,d0.w),d1
		jmp	bossdrillmove_tbl(pc,d1.w)
; ---------------------------------------------------------------------------
bossdrillmove_tbl:dc.w moveonscreen-bossdrillmove_tbl ;	DATA XREF: ROM:bossdrillmove_tblo
					; ROM:00000010o ...
		dc.w joincar-bossdrillmove_tbl
		dc.w movecar-bossdrillmove_tbl
		dc.w deathstart-bossdrillmove_tbl
		dc.w deathdrop-bossdrillmove_tbl
		dc.w flyaway-bossdrillmove_tbl
; ---------------------------------------------------------------------------

moveonscreen:				; DATA XREF: ROM:bossdrillmove_tblo
		move.b	#0,$20(a0)
		cmp.w	#$29B0,8(a0)
		ble.s	_done$oeba
		sub.w	#1,8(a0)
		bra.w	$8D4		; XREF:	actionsub
; ---------------------------------------------------------------------------

_done$oeba:				; CODE XREF: ROM:00000026j
		move.w	#$29B0,8(a0)
		addq.b	#2,$25(a0)
		bra.w	$8D4		; XREF:	actionsub
; ---------------------------------------------------------------------------

joincar:				; DATA XREF: ROM:00000010o
		moveq	#0,d0
		move.b	$2C(a0),d0
		move.w	join_tbl(pc,d0.w),d1
		jmp	join_tbl(pc,d1.w)
; ---------------------------------------------------------------------------
join_tbl:	dc.w joinland-join_tbl	; DATA XREF: ROM:join_tblo
					; ROM:00000050o
		dc.w joinadjust-join_tbl
; ---------------------------------------------------------------------------

joinland:				; DATA XREF: ROM:join_tblo
		cmp.w	#$3DE,$C(a0)
		bge.s	_joined$reba
		add.w	#1,$C(a0)
		bra.w	$8D4		; XREF:	actionsub
; ---------------------------------------------------------------------------

_joined$reba:				; CODE XREF: ROM:00000058j
		addq.b	#2,$2C(a0)
		bset	#0,$2D(a0)
		move.w	#$3C,$2A(a0) ; '<'
		bra.w	$8D4		; XREF:	actionsub
; ---------------------------------------------------------------------------

joinadjust:				; DATA XREF: ROM:00000050o
		sub.w	#1,$2A(a0)
		bpl.w	$8D4		; XREF:	actionsub
		move.w	#$FE00,$10(a0)
		addq.b	#2,$25(a0)
		move.b	#$F,$20(a0)
		bset	#1,$2D(a0)
		bra.w	$8D4		; XREF:	actionsub
; ---------------------------------------------------------------------------

movecar:				; DATA XREF: ROM:00000012o
		bsr.w	checkhit
		bsr.w	checkflip
		move.l	8(a0),d1
		move.w	$10(a0),d0
		ext.l	d0
		asl.l	#8,d0
		add.l	d0,d1
		move.l	d1,8(a0)
		move.b	($FFFFFE0F).w,d0
		and.b	#$F,d0
		bne.w	$8D4		; XREF:	actionsub
		bsr.w	$8F2		; XREF:	random
		and.w	#3,d0
		move.b	tbl(pc,d0.w),d0
		ext.w	d0
		add.w	$38(a0),d0
		move.w	d0,$C(a0)
		bra.w	$8D4		; XREF:	actionsub
; ---------------------------------------------------------------------------
tbl:		dc.w $FF02
		dc.w $FE01
; ---------------------------------------------------------------------------

deathstart:				; DATA XREF: ROM:00000014o
		subq.w	#1,$3C(a0)
		bpl.w	$1596		; XREF:	bossbomb

_jump$veba:
		bset	#0,$22(a0)
		bclr	#7,$22(a0)
		clr.w	$10(a0)
		addq.b	#2,$25(a0)
		move.w	#$FFDA,$3C(a0)
		move.w	#$C,$2A(a0)
		tst.b	($FFFFF7A7).w
		bne.s	_end$veba
		move.b	#1,($FFFFF7A7).w

_end$veba:				; CODE XREF: ROM:0000010Cj
		rts
; ---------------------------------------------------------------------------

deathdrop:				; DATA XREF: ROM:00000016o
		addq.w	#1,$C(a0)
		subq.w	#1,$2A(a0)
		bpl.w	$8D4		; XREF:	actionsub
		addq.b	#2,$25(a0)
		move.b	#0,$2C(a0)
		bra.w	$8D4		; XREF:	actionsub
; ---------------------------------------------------------------------------

flyaway:				; DATA XREF: ROM:00000018o
		moveq	#0,d0
		move.b	$2C(a0),d0
		move.w	flyaway_tbl(pc,d0.w),d1
		jsr	flyaway_tbl(pc,d1.w)
		bra.w	$8D4		; XREF:	actionsub
; ---------------------------------------------------------------------------
flyaway_tbl:	dc.w initrotors-flyaway_tbl ; DATA XREF: ROM:flyaway_tblo
					; ROM:00000144o ...
		dc.w takeoff-flyaway_tbl
		dc.w runaway-flyaway_tbl
; ---------------------------------------------------------------------------

initrotors:				; DATA XREF: ROM:flyaway_tblo
		bclr	#0,$2D(a0)
		bsr.w	$8E6		; XREF:	actwkchk2
		bne.w	$8D4		; XREF:	actionsub
		move.b	#$58,0(a1) ; 'X'
		move.l	a0,$34(a1)
		move.l	#$1700C,4(a1)
		move.w	#$2540,2(a1)
		move.b	#4,1(a1)
		move.b	#$20,$19(a1) ; ' '
		move.b	#4,$18(a1)
		move.l	8(a0),8(a1)
		move.l	$C(a0),$C(a1)
		add.w	#$C,$C(a1)
		move.b	$22(a0),$22(a1)
		move.b	1(a0),1(a1)
		move.b	#8,$24(a1)
		move.b	#2,$1C(a1)
		move.w	#$10,$2A(a1)
		move.w	#$32,$2A(a0) ; '2'
		addq.b	#2,$2C(a0)
		rts
; ---------------------------------------------------------------------------

takeoff:				; DATA XREF: ROM:00000144o
		sub.w	#1,$2A(a0)
		bpl.s	_end$afba
		bset	#2,$2D(a0)
		move.w	#$30,$2A(a0) ; '0'
		addq.b	#2,$2C(a0)

_end$afba:				; CODE XREF: ROM:000001C2j
		rts
; ---------------------------------------------------------------------------

runaway:				; DATA XREF: ROM:00000146o
		subq.w	#1,$C(a0)
		sub.w	#1,$2A(a0)
		bpl.s	_out$bfba
		addq.w	#1,$C(a0)
		addq.w	#2,8(a0)

_out$bfba:				; CODE XREF: ROM:000001E0j
		rts

; =============== S U B	R O U T	I N E =======================================


checkflip:				; CODE XREF: ROM:000000A0p
					; ROM:_cnt$ufbap
		move.w	8(a0),d0
		cmp.w	#$2780,d0
		ble.s	_off$cfba
		cmp.w	#$2A08,d0
		blt.s	_done$cfba

_off$cfba:				; CODE XREF: checkflip+8j
		bchg	#0,$22(a0)
		bchg	#0,1(a0)
		neg.w	$10(a0)

_done$cfba:				; CODE XREF: checkflip+Ej
		rts
; End of function checkflip


; =============== S U B	R O U T	I N E =======================================


checkhit:				; CODE XREF: ROM:movecarp
		cmp.b	#6,$25(a0)
		bcc.s	_jump2$dfba
		tst.b	$22(a0)
		bmi.s	_die$dfba
		tst.b	$20(a0)
		bne.s	_jump2$dfba
		tst.b	$3E(a0)
		bne.s	_jump$dfba
		move.b	#$20,$3E(a0) ; ' '
		move.w	#$AC,d0	; '�'
		jsr	($12FC).l	; XREF:	soundset

_jump$dfba:				; CODE XREF: checkhit+18j
		lea	($FFFFFB22).w,a1
		moveq	#0,d0
		tst.w	(a1)
		bne.s	_jump1$dfba
		move.w	#$EEE,d0

_jump1$dfba:				; CODE XREF: checkhit+32j
		move.w	d0,(a1)
		subq.b	#1,$3E(a0)
		bne.s	_jump2$dfba
		move.b	#$F,$20(a0)

_jump2$dfba:				; CODE XREF: checkhit+6j checkhit+12j	...
		rts
; ---------------------------------------------------------------------------

_die$dfba:				; CODE XREF: checkhit+Cj
		moveq	#$64,d0	; 'd'
		bsr.w	$39B8		; XREF:	scoreup
		move.b	#6,$25(a0)
		move.w	#$B3,$3C(a0) ; '�'
		bset	#3,$2D(a0)
		rts
; End of function checkhit

; ---------------------------------------------------------------------------

driller:
		moveq	#0,d0
		move.b	$24(a0),d0
		move.w	driller_tbl(pc,d0.w),d1
		jmp	driller_tbl(pc,d1.w)
; ---------------------------------------------------------------------------
driller_tbl:	dc.w sticktoboss-driller_tbl ; DATA XREF: ROM:driller_tblo
					; ROM:00000280o ...
		dc.w carbody-driller_tbl
		dc.w tiremove-driller_tbl
		dc.w drill-driller_tbl
		dc.w growrotors-driller_tbl
; ---------------------------------------------------------------------------

growrotors:				; DATA XREF: ROM:00000286o
		sub.w	#1,$C(a0)
		sub.w	#1,$2A(a0)
		bpl.w	$8D4		; XREF:	actionsub
		move.b	#0,$24(a0)
		lea	($16FD2).l,a1
		bsr.w	$8EC		; XREF:	patchg
		bra.w	$8D4		; XREF:	actionsub
; ---------------------------------------------------------------------------

sticktoboss:				; DATA XREF: ROM:driller_tblo
		moveq	#0,d0
		move.b	$25(a0),d0
		move.w	stick_tbl(pc,d0.w),d1
		jmp	stick_tbl(pc,d1.w)
; ---------------------------------------------------------------------------
stick_tbl:	dc.w normal-stick_tbl	; DATA XREF: ROM:stick_tblo
					; ROM:000002BCo
		dc.w retract-stick_tbl
; ---------------------------------------------------------------------------

normal:					; DATA XREF: ROM:stick_tblo
		move.l	$34(a0),a1
		cmp.b	#$55,(a1) ; 'U'
		bne.w	$8DA		; XREF:	frameout
		btst	#0,$2D(a1)
		beq.s	_cnt$ofba
		move.b	#1,$1C(a0)
		move.w	#$18,$2A(a0)
		addq.b	#2,$25(a0)

_cnt$ofba:				; CODE XREF: ROM:000002D0j
		move.w	8(a1),8(a0)
		move.w	$C(a1),$C(a0)
		move.b	$22(a1),$22(a0)
		move.b	1(a1),1(a0)
		lea	($16FD2).l,a1
		bsr.w	$8EC		; XREF:	patchg
		bra.w	$8D4		; XREF:	actionsub
; ---------------------------------------------------------------------------

retract:				; DATA XREF: ROM:000002BCo
		sub.w	#1,$2A(a0)
		bpl.s	_done$pfba
		cmp.w	#$FFF0,$2A(a0)
		ble.w	$8DA		; XREF:	frameout
		add.w	#1,$C(a0)
		bra.w	$8D4		; XREF:	actionsub
; ---------------------------------------------------------------------------

_done$pfba:				; CODE XREF: ROM:0000030Ej
		lea	($16FD2).l,a1
		bsr.w	$8EC		; XREF:	patchg
		bra.w	$8D4		; XREF:	actionsub
; ---------------------------------------------------------------------------

carbody:				; DATA XREF: ROM:00000280o
		move.l	$34(a0),a1
		cmp.b	#$55,(a1) ; 'U'
		bne.w	$8DA		; XREF:	frameout
		btst	#1,$2D(a1)
		beq.w	$8D4		; XREF:	actionsub
		btst	#2,$2D(a1)
		bne.w	$8D4		; XREF:	actionsub
		move.w	8(a1),8(a0)
		move.w	$C(a1),$C(a0)
		add.w	#8,$C(a0)
		move.b	$22(a1),$22(a0)
		move.b	1(a1),1(a0)
		bra.w	$8D4		; XREF:	actionsub
; ---------------------------------------------------------------------------

tiremove:				; DATA XREF: ROM:00000282o
		moveq	#0,d0
		move.b	$25(a0),d0
		move.w	tiremove_tbl(pc,d0.w),d1
		jmp	tiremove_tbl(pc,d1.w)
; ---------------------------------------------------------------------------
tiremove_tbl:	dc.w tiresit-tiremove_tbl ; DATA XREF: ROM:tiremove_tblo
					; ROM:00000384o ...
		dc.w tireroll-tiremove_tbl
		dc.w tireexplode-tiremove_tbl
		dc.w tirebounce-tiremove_tbl
; ---------------------------------------------------------------------------

tiresit:				; DATA XREF: ROM:tiremove_tblo
		move.l	$34(a0),a1
		cmp.b	#$55,(a1) ; 'U'
		bne.w	$8DA		; XREF:	frameout
		btst	#1,$2D(a1)
		beq.w	$8D4		; XREF:	actionsub
		addq.b	#2,$25(a0)
		bra.w	$8D4		; XREF:	actionsub
; ---------------------------------------------------------------------------

tireroll:				; DATA XREF: ROM:00000384o
		move.l	$34(a0),a1
		cmp.b	#$55,(a1) ; 'U'
		bne.w	$8DA		; XREF:	frameout
		move.b	$22(a1),$22(a0)
		move.b	1(a1),1(a0)
		tst.b	$22(a0)
		bpl.s	_cnt$ufba
		addq.b	#2,$25(a0)

_cnt$ufba:				; CODE XREF: ROM:000003C4j
		bsr.w	checkflip
		bsr.w	$8FE		; XREF:	speedset2
		lea	($170E0).l,a1
		bsr.w	$8EC		; XREF:	patchg
		bra.w	$8D4		; XREF:	actionsub
; ---------------------------------------------------------------------------

tireexplode:				; DATA XREF: ROM:00000386o
		sub.w	#1,$2A(a0)
		bpl.w	$8D4		; XREF:	actionsub
		addq.b	#2,$25(a0)
		move.w	#$A,$2A(a0)
		move.w	#$FD00,$12(a0)

loc_3FA:				; CODE XREF: ROM:loc_3FAp
		bsr.w	$3FC		; XREF:	explode
		cmp.b	#1,$18(a0)
		beq.w	$8D4		; XREF:	actionsub
		neg.w	$10(a0)
		bra.w	$8D4		; XREF:	actionsub
; ---------------------------------------------------------------------------

tirebounce:				; DATA XREF: ROM:00000388o
		subq.w	#1,$2A(a0)
		bpl.w	$8D4		; XREF:	actionsub
		bsr.w	$8F8		; XREF:	speedset
		bsr.w	$FFFFC036	; XREF:	emycol_d
		tst.w	d1
		bpl.s	_end$wfba
		move.w	#$FE00,$12(a0)
		add.w	d1,$C(a0)

_end$wfba:				; CODE XREF: ROM:00000422j
		bra.w	$8E0		; XREF:	frameoutchk
; ---------------------------------------------------------------------------

drill:					; DATA XREF: ROM:00000284o
		move.l	$34(a0),a1
		cmp.b	#$55,(a1) ; 'U'
		bne.w	$8DA		; XREF:	frameout
		btst	#3,$2D(a1)
		bne.s	_movedrill$xfba
		bsr.w	checkshoot
		btst	#1,$2D(a1)
		beq.w	$8D4		; XREF:	actionsub
		move.w	8(a1),8(a0)
		move.w	$C(a1),$C(a0)
		move.b	$22(a1),$22(a0)
		move.b	1(a1),1(a0)
		add.w	#$10,$C(a0)
		move.w	#$FFCA,d0
		btst	#0,$22(a0)
		beq.s	_cnt$xfba
		neg.w	d0

_cnt$xfba:				; CODE XREF: ROM:0000047Cj
		add.w	d0,8(a0)
		lea	($170E0).l,a1
		bsr.w	$8EC		; XREF:	patchg
		bra.w	$8D4		; XREF:	actionsub
; ---------------------------------------------------------------------------

_movedrill$xfba:			; CODE XREF: ROM:00000444j
		move.w	#$FFFD,d0
		btst	#0,$22(a0)
		beq.s	_cnt3$xfba
		neg.w	d0

_cnt3$xfba:				; CODE XREF: ROM:0000049Cj
		add.w	d0,8(a0)
		lea	($170E0).l,a1
		bsr.w	$8EC		; XREF:	patchg
		bra.w	$8D4		; XREF:	actionsub

; =============== S U B	R O U T	I N E =======================================


checkshoot:				; CODE XREF: ROM:00000446p
		cmp.b	#1,$21(a1)
		beq.s	_chkset$yfba
		rts
; ---------------------------------------------------------------------------

_chkset$yfba:				; CODE XREF: checkshoot+6j
		move.w	8(a0),d0
		sub.w	($FFFFB008).w,d0
		bpl.s	_left$yfba

_right$yfba:
		btst	#0,$22(a1)
		bne.s	_set$yfba
		rts
; ---------------------------------------------------------------------------

_left$yfba:				; CODE XREF: checkshoot+12j
		btst	#0,$22(a1)
		beq.s	_set$yfba
		rts
; ---------------------------------------------------------------------------

_set$yfba:				; CODE XREF: checkshoot+1Aj
					; checkshoot+24j
		bset	#3,$2D(a1)
		rts
; End of function checkshoot


; =============== S U B	R O U T	I N E =======================================


makewheels:				; CODE XREF: ROM:_worknai$cgbap
		jsr	$DAB8		; XREF:	actwkchk2
		bne.s	_worknai1$zfba
		move.b	#$58,0(a1) ; 'X'
		move.l	a0,$34(a1)
		move.l	#$170F4,4(a1)
		move.w	#$24C0,2(a1)
		move.b	#4,1(a1)
		move.b	#$10,$19(a1)
		move.b	#1,$18(a1)
		move.b	#$10,$16(a1)
		move.b	#$10,$17(a1)
		move.l	8(a0),8(a1)
		move.l	$C(a0),$C(a1)
		add.w	#$1C,8(a1)
		add.w	#$C,$C(a1)
		move.w	#$FE00,$10(a1)
		move.b	#4,$24(a1)
		move.b	#4,$1A(a1)
		move.b	#1,$1C(a1)
		move.w	#$28,$2A(a1) ; '('

_worknai1$zfba:				; CODE XREF: makewheels+6j
		jsr	$DAB8		; XREF:	actwkchk2
		bne.s	loc_5CA
		move.b	#$58,0(a1) ; 'X'
		move.l	a0,$34(a1)
		move.l	#$170F4,4(a1)
		move.w	#$24C0,2(a1)
		move.b	#4,1(a1)
		move.b	#$10,$19(a1)
		move.b	#1,$18(a1)
		move.b	#$10,$16(a1)
		move.b	#$10,$17(a1)
		move.l	8(a0),8(a1)
		move.l	$C(a0),$C(a1)
		add.w	#-$C,8(a1)
		add.w	#$C,$C(a1)
		move.w	#$FE00,$10(a1)
		move.b	#4,$24(a1)
		move.b	#4,$1A(a1)
		move.b	#1,$1C(a1)
		move.w	#$14,$2A(a1)

loc_5CA:				; CODE XREF: makewheels+7Aj
		jsr	$DAB8		; XREF:	actwkchk2
		bne.s	loc_63E
		move.b	#$58,0(a1) ; 'X'
		move.l	a0,$34(a1)
		move.l	#$170F4,4(a1)
		move.w	#$24C0,2(a1)
		move.b	#4,1(a1)
		move.b	#$10,$19(a1)
		move.b	#2,$18(a1)
		move.b	#$10,$16(a1)
		move.b	#$10,$17(a1)
		move.l	8(a0),8(a1)
		move.l	$C(a0),$C(a1)
		add.w	#-$2C,8(a1)
		add.w	#$C,$C(a1)
		move.w	#$FE00,$10(a1)
		move.b	#4,$24(a1)
		move.b	#6,$1A(a1)
		move.b	#2,$1C(a1)
		move.w	#$1E,$2A(a1)

loc_63E:				; CODE XREF: makewheels+EEj
		jsr	$DAB8		; XREF:	actwkchk2
		bne.s	return_69A
		move.b	#$58,0(a1) ; 'X'
		move.l	a0,$34(a1)
		move.l	#$170F4,4(a1)
		move.w	#$24C0,2(a1)
		move.b	#4,1(a1)
		move.b	#$10,$19(a1)
		move.b	#1,$18(a1)
		move.l	8(a0),8(a1)
		move.l	$C(a0),$C(a1)
		add.w	#-$36,8(a1)
		add.w	#8,$C(a1)
		move.b	#6,$24(a1)
		move.b	#1,$1A(a1)
		move.b	#0,$1C(a1)

return_69A:				; CODE XREF: makewheels+162j
		rts
; End of function makewheels

; ---------------------------------------------------------------------------

drillerguy:				; XREF:	actwkchk2
		jsr	$DAB8
		bne.s	_worknai$cgba
		move.b	#$58,0(a1) ; 'X'
		move.l	a0,$34(a1)
		move.l	#$170F4,4(a1)
		move.w	#$4C0,2(a1)
		move.b	#4,1(a1)
		move.b	#$20,$19(a1) ; ' '
		move.b	#2,$18(a1)
		move.l	8(a0),8(a1)
		move.l	$C(a0),$C(a1)
		move.b	#2,$24(a1)

_worknai$cgba:				; CODE XREF: ROM:000006A2j
		bsr.w	makewheels
		sub.w	#8,$38(a0)
		move.w	#$2A00,8(a0)
		move.w	#$2C0,$C(a0)
		jsr	$DAB8		; XREF:	actwkchk2
		bne.s	_worknai2$cgba
		move.b	#$58,0(a1) ; 'X'
		move.l	a0,$34(a1)
		move.l	#$1700C,4(a1)
		move.w	#$2540,2(a1)
		move.b	#4,1(a1)
		move.b	#$20,$19(a1) ; ' '
		move.b	#4,$18(a1)
		move.l	8(a0),8(a1)
		move.l	$C(a0),$C(a1)
		move.w	#$1E,$2A(a1)
		move.b	#0,$24(a1)

_worknai2$cgba:				; CODE XREF: ROM:000006FCj
		rts
; ---------------------------------------------------------------------------
bosshelichg:	dc.w bosshelichg0-bosshelichg ;	DATA XREF: ROM:bosshelichgo
					; ROM:00000744o ...
		dc.w bosshelichg1-bosshelichg
		dc.w bosshelichg2-bosshelichg
bosshelichg0:	dc.b   1,  5,  6,$FF	; 0 ; DATA XREF: ROM:bosshelichgo
bosshelichg1:	dc.b   1,  1,  1,  1	; 0 ; DATA XREF: ROM:00000744o
		dc.b   2,  2,  2,  3	; 4
		dc.b   3,  3,  4,  4	; 8
		dc.b   4,  0,  0,  0	; 12
		dc.b   0,  0,  0,  0	; 16
		dc.b   0,$FF		; 20
bosshelichg2:	dc.b   1,  0,  0,  0	; 0 ; DATA XREF: ROM:00000746o
		dc.b   0,  0,  0,  0	; 4
		dc.b   0,  4,  4,  4	; 8
		dc.b   3,  3,  3,  2	; 12
		dc.b   2,  2,  1,  1	; 16
		dc.b   1,  5,  6,$FE	; 20
		dc.b   2,  0		; 24
bosshelipat:	dc.w bosshelisp00-bosshelipat ;	DATA XREF: ROM:bosshelipato
					; ROM:0000077Eo ...
		dc.w bosshelisp01-bosshelipat
		dc.w bosshelisp02-bosshelipat
		dc.w bosshelisp03-bosshelipat
		dc.w bosshelisp04-bosshelipat
		dc.w bosshelisp05-bosshelipat
		dc.w bosshelisp06-bosshelipat
bosshelisp00:	dc.w 1			; DATA XREF: ROM:bosshelipato
		dc.w $D805,    0,    0,	   2; 0
bosshelisp01:	dc.w 5			; DATA XREF: ROM:0000077Eo
		dc.w $D805,    4,    2,	   2; 0
		dc.w $D80D,   $C,    6,	 $12; 4
		dc.w $D80D,   $C,    6,	 $32; 8
		dc.w $D80D,   $C,    6,$FFE2; 12
		dc.w $D80D,   $C,    6,$FFC2; 16
bosshelisp02:	dc.w 5			; DATA XREF: ROM:00000780o
		dc.w $D805,    4,    2,	   2; 0
		dc.w $D80D,   $C,    6,	 $12; 4
		dc.w $D805,    8,    4,	 $32; 8
		dc.w $D80D,   $C,    6,$FFE2; 12
		dc.w $D805,    8,    4,$FFD2; 16
bosshelisp03:	dc.w 3			; DATA XREF: ROM:00000782o
		dc.w $D805,    4,    2,	   2; 0
		dc.w $D80D,   $C,    6,	 $12; 4
		dc.w $D80D,   $C,    6,$FFE2; 8
bosshelisp04:	dc.w 3			; DATA XREF: ROM:00000784o
		dc.w $D805,    4,    2,	   2; 0
		dc.w $D805,    8,    4,	 $12; 4
		dc.w $D805,    8,    4,$FFF2; 8
bosshelisp05:	dc.w 3			; DATA XREF: ROM:00000786o
		dc.w $D805,    0,    0,	   2; 0
		dc.w $D80D,   $C,    6,	 $12; 4
		dc.w $D80D,   $C,    6,	 $32; 8
bosshelisp06:	dc.w 3			; DATA XREF: ROM:00000788o
		dc.w $D805,    4,    2,	   2; 0
		dc.w $D80D,   $C,    6,$FFE2; 4
		dc.w $D80D,   $C,    6,$FFC2; 8
bossdrillchg:	dc.w bossdrillchg0-bossdrillchg	; DATA XREF: ROM:bossdrillchgo
					; ROM:00000852o ...
		dc.w bossdrillchg1-bossdrillchg
		dc.w bossdrillchg2-bossdrillchg
bossdrillchg0:	dc.b   5,  1,  2,  3	; 0 ; DATA XREF: ROM:bossdrillchgo
		dc.b $FF		; 4
bossdrillchg1:	dc.b   1,  4,  5,$FF	; 0 ; DATA XREF: ROM:00000852o
bossdrillchg2:	dc.b   1,  6,  7,$FF	; 0 ; DATA XREF: ROM:00000854o
		dc.b   0		; 4
bossdrillpat:	dc.w bossdrillsp0-bossdrillpat ; DATA XREF: ROM:bossdrillpato
					; ROM:00000866o ...
		dc.w bossdrillsp1-bossdrillpat
		dc.w bossdrillsp2-bossdrillpat
		dc.w bossdrillsp3-bossdrillpat
		dc.w bossdrillsp4-bossdrillpat
		dc.w bossdrillsp5-bossdrillpat
		dc.w bossdrillsp6-bossdrillpat
		dc.w bossdrillsp7-bossdrillpat
bossdrillsp0:	dc.w 3			; DATA XREF: ROM:bossdrillpato
		dc.w $F00F,    0,    0,$FFD0; 0
		dc.w $F00F,  $10,    8,$FFF0; 4
		dc.w $F00F,  $20,  $10,	 $10; 8
bossdrillsp1:	dc.w 1			; DATA XREF: ROM:00000866o
		dc.w $F00F,  $30,  $18,$FFF0; 0
bossdrillsp2:	dc.w 1			; DATA XREF: ROM:00000868o
		dc.w $F00F,  $40,  $20,$FFF0; 0
bossdrillsp3:	dc.w 1			; DATA XREF: ROM:0000086Ao
		dc.w $F00F,  $50,  $28,$FFF0; 0
bossdrillsp4:	dc.w 1			; DATA XREF: ROM:0000086Co
		dc.w $F00F,  $60,  $30,$FFF0; 0
bossdrillsp5:	dc.w 1			; DATA XREF: ROM:0000086Eo
		dc.w $F00F,$1060,$1030,$FFF0; 0
bossdrillsp6:	dc.w 1			; DATA XREF: ROM:00000870o
		dc.w $F00F,  $70,  $38,$FFF0; 0
bossdrillsp7:	dc.w 1			; DATA XREF: ROM:00000872o
		dc.w $F00F,$1070,$1038,$FFF0; 0
; end of 'ROM'


		END
