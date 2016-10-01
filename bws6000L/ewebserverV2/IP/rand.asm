	TITLE	rand.cpp
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
PUBLIC	??0random@@QAE@XZ				; random::random
_TEXT	SEGMENT
_this$ = -4
??0random@@QAE@XZ PROC NEAR				; random::random
; File rand.cpp
; Line 12
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax], 0
; Line 13
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+4], 0
; Line 14
	mov	eax, DWORD PTR _this$[ebp]
	mov	esp, ebp
	pop	ebp
	ret	0
??0random@@QAE@XZ ENDP					; random::random
_TEXT	ENDS
PUBLIC	??0random@@QAE@H@Z				; random::random
_TEXT	SEGMENT
_x$ = 8
_this$ = -4
??0random@@QAE@H@Z PROC NEAR				; random::random
; Line 16
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [eax], ecx
; Line 17
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR [edx+4], ecx
; Line 18
	mov	eax, DWORD PTR _this$[ebp]
	mov	esp, ebp
	pop	ebp
	ret	4
??0random@@QAE@H@Z ENDP					; random::random
_TEXT	ENDS
PUBLIC	?getRandomAoA@random@@QAEHH@Z			; random::getRandomAoA
_TEXT	SEGMENT
_newseed$ = 8
_this$ = -8
_newx$ = -4
?getRandomAoA@random@@QAEHH@Z PROC NEAR			; random::getRandomAoA
; Line 22
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 25
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _newseed$[ebp]
	cmp	ecx, DWORD PTR [eax+4]
	je	SHORT $L858
; Line 26
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR _newseed$[ebp]
	mov	DWORD PTR [edx+4], eax
$L858:
; Line 29
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	imul	edx, 57					; 00000039H
	add	edx, 1
	and	edx, -2147483137			; 800001ffH
	jns	SHORT $L864
	dec	edx
	or	edx, -512				; fffffe00H
	inc	edx
$L864:
	mov	DWORD PTR _newx$[ebp], edx
; Line 30
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _newx$[ebp]
	mov	DWORD PTR [eax+4], ecx
; Line 32
	mov	eax, DWORD PTR _newx$[ebp]
; Line 33
	mov	esp, ebp
	pop	ebp
	ret	4
?getRandomAoA@random@@QAEHH@Z ENDP			; random::getRandomAoA
_TEXT	ENDS
END
