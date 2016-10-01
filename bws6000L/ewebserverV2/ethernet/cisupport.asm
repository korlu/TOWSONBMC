	TITLE	cisupport.c
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
PUBLIC	_cigetRegister32
EXTRN	_igetRegister32:NEAR
_TEXT	SEGMENT
_iobase$ = 8
_cigetRegister32 PROC NEAR
; File cisupport.c
; Line 14
	push	ebp
	mov	ebp, esp
; Line 15
	mov	eax, DWORD PTR _iobase$[ebp]
	push	eax
	call	_igetRegister32
	add	esp, 4
; Line 16
	pop	ebp
	ret	0
_cigetRegister32 ENDP
_TEXT	ENDS
PUBLIC	_cisetRegister32
EXTRN	_isetRegister32:NEAR
_TEXT	SEGMENT
_value$ = 8
_iobase$ = 12
_cisetRegister32 PROC NEAR
; Line 22
	push	ebp
	mov	ebp, esp
; Line 23
	mov	eax, DWORD PTR _iobase$[ebp]
	push	eax
	mov	ecx, DWORD PTR _value$[ebp]
	push	ecx
	call	_isetRegister32
	add	esp, 8
; Line 24
	pop	ebp
	ret	0
_cisetRegister32 ENDP
_TEXT	ENDS
END
