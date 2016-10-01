	TITLE	wttrace.cpp
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
PUBLIC	?base@WTTrace@@0HA				; WTTrace::base
PUBLIC	?size@WTTrace@@0HA				; WTTrace::size
_BSS	SEGMENT
?base@WTTrace@@0HA DD 01H DUP (?)			; WTTrace::base
?size@WTTrace@@0HA DD 01H DUP (?)			; WTTrace::size
_BSS	ENDS
PUBLIC	?init@WTTrace@@QAEHHH@Z				; WTTrace::init
_TEXT	SEGMENT
_inpbase$ = 8
_inpsize$ = 12
_this$ = -12
_TRecordPtr$ = -8
_i$ = -4
?init@WTTrace@@QAEHHH@Z PROC NEAR			; WTTrace::init
; File wttrace.cpp
; Line 16
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 19
	mov	eax, DWORD PTR _inpbase$[ebp]
	mov	DWORD PTR ?base@WTTrace@@0HA, eax	; WTTrace::base
; Line 20
	mov	ecx, DWORD PTR _inpsize$[ebp]
	mov	DWORD PTR ?size@WTTrace@@0HA, ecx	; WTTrace::size
; Line 22
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L877
$L878:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L877:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR ?size@WTTrace@@0HA	; WTTrace::size
	jge	SHORT $L879
; Line 24
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR ?base@WTTrace@@0HA	; WTTrace::base
	lea	eax, DWORD PTR [edx+ecx*2]
	mov	DWORD PTR _TRecordPtr$[ebp], eax
; Line 25
	mov	ecx, DWORD PTR _TRecordPtr$[ebp]
	mov	WORD PTR [ecx], 0
; Line 26
	jmp	SHORT $L878
$L879:
; Line 27
	xor	eax, eax
; Line 28
	mov	esp, ebp
	pop	ebp
	ret	8
?init@WTTrace@@QAEHHH@Z ENDP				; WTTrace::init
_TEXT	ENDS
PUBLIC	?insert@WTTrace@@QAEHHG@Z			; WTTrace::insert
_TEXT	SEGMENT
_index$ = 8
_mask$ = 12
_this$ = -12
_value$ = -4
_TRecordPtr$ = -8
?insert@WTTrace@@QAEHHG@Z PROC NEAR			; WTTrace::insert
; Line 33
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 34
	mov	WORD PTR _value$[ebp], 0
; Line 37
	mov	eax, DWORD PTR _index$[ebp]
	mov	ecx, DWORD PTR ?base@WTTrace@@0HA	; WTTrace::base
	lea	edx, DWORD PTR [ecx+eax*2]
	mov	DWORD PTR _TRecordPtr$[ebp], edx
; Line 39
	mov	eax, DWORD PTR _mask$[ebp]
	and	eax, 65535				; 0000ffffH
	cmp	eax, 1
	jne	SHORT $L891
; Line 40
	mov	WORD PTR _value$[ebp], 0
; Line 41
	jmp	SHORT $L892
$L891:
; Line 42
	mov	ecx, DWORD PTR _TRecordPtr$[ebp]
	mov	dx, WORD PTR [ecx]
	mov	WORD PTR _value$[ebp], dx
$L892:
; Line 43
	mov	eax, DWORD PTR _value$[ebp]
	and	eax, 65535				; 0000ffffH
	mov	ecx, DWORD PTR _mask$[ebp]
	and	ecx, 65535				; 0000ffffH
	or	eax, ecx
	mov	WORD PTR _value$[ebp], ax
; Line 44
	mov	edx, DWORD PTR _TRecordPtr$[ebp]
	mov	ax, WORD PTR _value$[ebp]
	mov	WORD PTR [edx], ax
; Line 46
	xor	eax, eax
; Line 47
	mov	esp, ebp
	pop	ebp
	ret	8
?insert@WTTrace@@QAEHHG@Z ENDP				; WTTrace::insert
_TEXT	ENDS
PUBLIC	?reset@WTTrace@@QAEHHG@Z			; WTTrace::reset
_TEXT	SEGMENT
_index$ = 8
_mask$ = 12
_this$ = -16
_value$ = -4
_mask1$ = -12
_TRecordPtr$ = -8
?reset@WTTrace@@QAEHHG@Z PROC NEAR			; WTTrace::reset
; Line 52
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	mov	DWORD PTR _this$[ebp], ecx
; Line 53
	mov	WORD PTR _value$[ebp], 0
; Line 54
	mov	WORD PTR _mask1$[ebp], 0
; Line 57
	mov	eax, DWORD PTR _index$[ebp]
	mov	ecx, DWORD PTR ?base@WTTrace@@0HA	; WTTrace::base
	lea	edx, DWORD PTR [ecx+eax*2]
	mov	DWORD PTR _TRecordPtr$[ebp], edx
; Line 59
	mov	eax, DWORD PTR _TRecordPtr$[ebp]
	mov	cx, WORD PTR [eax]
	mov	WORD PTR _value$[ebp], cx
; Line 60
	mov	edx, DWORD PTR _mask$[ebp]
	and	edx, 65535				; 0000ffffH
	not	edx
	mov	WORD PTR _mask1$[ebp], dx
; Line 61
	mov	eax, DWORD PTR _value$[ebp]
	and	eax, 65535				; 0000ffffH
	mov	ecx, DWORD PTR _mask1$[ebp]
	and	ecx, 65535				; 0000ffffH
	and	eax, ecx
	mov	WORD PTR _value$[ebp], ax
; Line 62
	mov	edx, DWORD PTR _TRecordPtr$[ebp]
	mov	ax, WORD PTR _value$[ebp]
	mov	WORD PTR [edx], ax
; Line 64
	xor	eax, eax
; Line 65
	mov	esp, ebp
	pop	ebp
	ret	8
?reset@WTTrace@@QAEHHG@Z ENDP				; WTTrace::reset
_TEXT	ENDS
PUBLIC	?get@WTTrace@@QAEGH@Z				; WTTrace::get
_TEXT	SEGMENT
_index$ = 8
_this$ = -8
_TRecordPtr$ = -4
?get@WTTrace@@QAEGH@Z PROC NEAR				; WTTrace::get
; Line 70
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 72
	mov	eax, DWORD PTR _index$[ebp]
	mov	ecx, DWORD PTR ?base@WTTrace@@0HA	; WTTrace::base
	lea	edx, DWORD PTR [ecx+eax*2]
	mov	DWORD PTR _TRecordPtr$[ebp], edx
; Line 74
	mov	eax, DWORD PTR _TRecordPtr$[ebp]
	mov	ax, WORD PTR [eax]
; Line 78
	mov	esp, ebp
	pop	ebp
	ret	4
?get@WTTrace@@QAEGH@Z ENDP				; WTTrace::get
_TEXT	ENDS
END
