	TITLE	aoaparam.cpp
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
PUBLIC	??0aoaparam@@QAE@XZ				; aoaparam::aoaparam
_TEXT	SEGMENT
_this$ = -4
??0aoaparam@@QAE@XZ PROC NEAR				; aoaparam::aoaparam
; File aoaparam.cpp
; Line 8
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 9
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax], 0
; Line 10
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+4], 0
; Line 11
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+8], 0
; Line 12
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+12], 0
; Line 13
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+16], 0
; Line 14
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+20], 0
; Line 15
	mov	eax, DWORD PTR _this$[ebp]
	mov	BYTE PTR [eax+24], 65			; 00000041H
; Line 16
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+25], 66			; 00000042H
; Line 17
	mov	edx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [edx+26], 67			; 00000043H
; Line 18
	mov	eax, DWORD PTR _this$[ebp]
	mov	BYTE PTR [eax+27], 68			; 00000044H
; Line 19
	mov	eax, DWORD PTR _this$[ebp]
	mov	esp, ebp
	pop	ebp
	ret	0
??0aoaparam@@QAE@XZ ENDP				; aoaparam::aoaparam
_TEXT	ENDS
END
