	global	small_model
	psect	text,class=CODE
	global	_main
	signat	_main,26
	global	_OPL3ResetChip
	signat	_OPL3ResetChip,24
	global	_OPL3Write
	signat	_OPL3Write,8248
_main:
	push	ix
	ld	ix,0
	add	ix,sp
	dec	sp
;MAIN.C: 29: uint8_t c;
;MAIN.C: 32: OPL3ResetChip();
	call	_OPL3ResetChip
;MAIN.C: 34: while(1)
l8:
;MAIN.C: 35: {
;MAIN.C: 36: c = (*(port unsigned char *)(0));
; _c allocated to d
	ld	bc,0
	in	a,(c)
	ld	d,a
;MAIN.C: 37: if((c & 3) == 1) OPL3Write((c >> 2) & 3, (*(port unsigned char *)(1)));
	and	03h
	cp	01h
	jp	nz,l8
	ld	bc,01h
	in	a,(c)
	ld	(ix+-1),a
	ld	a,d
	srl	a
	srl	a
	and	03h
	ld	e,a
	ld	c,(ix+-1)
	call	_OPL3Write
;MAIN.C: 39: }
	jp	l8
	end
