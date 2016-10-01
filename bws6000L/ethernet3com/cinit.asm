	TITLE	cinit.c
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
PUBLIC	_cinitEther
EXTRN	_initasm:NEAR
_TEXT	SEGMENT
_p$ = 8
_m$ = 12
_cinitEther PROC NEAR
; File cinit.c
; Line 12
	push	ebp
	mov	ebp, esp
; Line 13
	mov	eax, DWORD PTR _m$[ebp]
	push	eax
	mov	cx, WORD PTR _p$[ebp]
	push	ecx
	call	_initasm
	add	esp, 8
; Line 14
	pop	ebp
	ret	0
_cinitEther ENDP
_TEXT	ENDS
PUBLIC	_ccreateDS
EXTRN	_createDSasm:NEAR
_TEXT	SEGMENT
_NoRcvBuf$ = 8
_RcvStat$ = 12
_UpLstPtr$ = 16
_RcvFragAddr$ = 20
_RcvFragLen$ = 24
_NoSndBuf$ = 28
_SndStat$ = 32
_DnLstPtr$ = 36
_SndFragAddr$ = 40
_SndFragLen$ = 44
_iobase$ = 48
_ccreateDS PROC NEAR
; Line 22
	push	ebp
	mov	ebp, esp
; Line 24
	mov	ax, WORD PTR _iobase$[ebp]
	push	eax
	mov	ecx, DWORD PTR _SndFragLen$[ebp]
	push	ecx
	mov	edx, DWORD PTR _SndFragAddr$[ebp]
	push	edx
	mov	eax, DWORD PTR _DnLstPtr$[ebp]
	push	eax
	mov	ecx, DWORD PTR _SndStat$[ebp]
	push	ecx
	mov	edx, DWORD PTR _NoSndBuf$[ebp]
	push	edx
	mov	eax, DWORD PTR _RcvFragLen$[ebp]
	push	eax
	mov	ecx, DWORD PTR _RcvFragAddr$[ebp]
	push	ecx
	mov	edx, DWORD PTR _UpLstPtr$[ebp]
	push	edx
	mov	eax, DWORD PTR _RcvStat$[ebp]
	push	eax
	mov	ecx, DWORD PTR _NoRcvBuf$[ebp]
	push	ecx
	call	_createDSasm
	add	esp, 44					; 0000002cH
; Line 25
	pop	ebp
	ret	0
_ccreateDS ENDP
_TEXT	ENDS
END
