	TITLE	crcv.c
	.386P
include listing.inc
if @Version gt 510
.model FLAT
else
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
CONST	SEGMENT DWORD USE32 PUBLIC 'CONST'
CONST	ENDS
_BSS	SEGMENT DWORD USE32 PUBLIC 'BSS'
_BSS	ENDS
_TLS	SEGMENT DWORD USE32 PUBLIC 'TLS'
_TLS	ENDS
FLAT	GROUP _DATA, CONST, _BSS
	ASSUME	CS: FLAT, DS: FLAT, SS: FLAT
endif
PUBLIC	_cenableReceive
EXTRN	_enableReceive:NEAR
_TEXT	SEGMENT
_iobase$ = 8
_cenableReceive PROC NEAR
; File crcv.c
; Line 14
	push	ebp
	mov	ebp, esp
; Line 15
	mov	eax, DWORD PTR _iobase$[ebp]
	push	eax
	call	_enableReceive
	add	esp, 4
; Line 16
	pop	ebp
	ret	0
_cenableReceive ENDP
_TEXT	ENDS
PUBLIC	_cdisableReceive
EXTRN	_disableReceive:NEAR
_TEXT	SEGMENT
_iobase$ = 8
_cdisableReceive PROC NEAR
; Line 22
	push	ebp
	mov	ebp, esp
; Line 23
	mov	eax, DWORD PTR _iobase$[ebp]
	push	eax
	call	_disableReceive
	add	esp, 4
; Line 24
	pop	ebp
	ret	0
_cdisableReceive ENDP
_TEXT	ENDS
PUBLIC	_cgetCurrentReceivePtr
EXTRN	_getCurrentReceivePtr:NEAR
_TEXT	SEGMENT
_iobase$ = 8
_cgetCurrentReceivePtr PROC NEAR
; Line 30
	push	ebp
	mov	ebp, esp
; Line 31
	mov	ax, WORD PTR _iobase$[ebp]
	push	eax
	call	_getCurrentReceivePtr
	add	esp, 4
; Line 32
	pop	ebp
	ret	0
_cgetCurrentReceivePtr ENDP
_TEXT	ENDS
PUBLIC	_cupStall
EXTRN	_upStall:NEAR
_TEXT	SEGMENT
_iobase$ = 8
_cupStall PROC NEAR
; Line 37
	push	ebp
	mov	ebp, esp
; Line 38
	mov	eax, DWORD PTR _iobase$[ebp]
	push	eax
	call	_upStall
	add	esp, 4
; Line 39
	pop	ebp
	ret	0
_cupStall ENDP
_TEXT	ENDS
PUBLIC	_cupUnStall
EXTRN	_upUnStall:NEAR
_TEXT	SEGMENT
_iobase$ = 8
_cupUnStall PROC NEAR
; Line 44
	push	ebp
	mov	ebp, esp
; Line 45
	mov	eax, DWORD PTR _iobase$[ebp]
	push	eax
	call	_upUnStall
	add	esp, 4
; Line 46
	pop	ebp
	ret	0
_cupUnStall ENDP
_TEXT	ENDS
END
