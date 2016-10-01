	TITLE	wstack.cpp
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
PUBLIC	?base@WStack@@0JA				; WStack::base
PUBLIC	?size@WStack@@0JA				; WStack::size
PUBLIC	?count@WStack@@2JA				; WStack::count
PUBLIC	?top@WStack@@2PAUESRecord@1@A			; WStack::top
_BSS	SEGMENT
?base@WStack@@0JA DD 01H DUP (?)			; WStack::base
?size@WStack@@0JA DD 01H DUP (?)			; WStack::size
?count@WStack@@2JA DD 01H DUP (?)			; WStack::count
?top@WStack@@2PAUESRecord@1@A DD 01H DUP (?)		; WStack::top
_BSS	ENDS
PUBLIC	?init@WStack@@QAEHJH@Z				; WStack::init
_TEXT	SEGMENT
_inpbase$ = 8
_inpsize$ = 12
_this$ = -12
_ESRecordPtr$ = -4
_i$ = -8
?init@WStack@@QAEHJH@Z PROC NEAR			; WStack::init
; File wstack.cpp
; Line 31
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 33
	mov	eax, DWORD PTR _inpbase$[ebp]
	mov	DWORD PTR ?base@WStack@@0JA, eax	; WStack::base
; Line 34
	mov	ecx, DWORD PTR _inpsize$[ebp]
	mov	DWORD PTR ?size@WStack@@0JA, ecx	; WStack::size
; Line 37
	mov	edx, DWORD PTR ?base@WStack@@0JA	; WStack::base
	mov	DWORD PTR ?top@WStack@@2PAUESRecord@1@A, edx ; WStack::top
; Line 42
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L883
$L884:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L883:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR ?size@WStack@@0JA	; WStack::size
	jge	SHORT $L885
; Line 44
	mov	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR ?base@WStack@@0JA	; WStack::base
	lea	ecx, DWORD PTR [eax+edx*4]
	mov	DWORD PTR _ESRecordPtr$[ebp], ecx
; Line 45
	mov	edx, DWORD PTR _ESRecordPtr$[ebp]
	mov	DWORD PTR [edx], 0
; Line 46
	jmp	SHORT $L884
$L885:
; Line 47
	mov	DWORD PTR ?count@WStack@@2JA, 0		; WStack::count
; Line 48
	xor	eax, eax
; Line 49
	mov	esp, ebp
	pop	ebp
	ret	8
?init@WStack@@QAEHJH@Z ENDP				; WStack::init
_TEXT	ENDS
PUBLIC	?push@WStack@@QAEHH@Z				; WStack::push
_TEXT	SEGMENT
_id$ = 8
_this$ = -8
_tempCurrentRecord$ = -4
?push@WStack@@QAEHH@Z PROC NEAR				; WStack::push
; Line 55
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 59
	mov	eax, DWORD PTR ?top@WStack@@2PAUESRecord@1@A ; WStack::top
	mov	DWORD PTR _tempCurrentRecord$[ebp], eax
; Line 62
	mov	ecx, DWORD PTR _tempCurrentRecord$[ebp]
	mov	edx, DWORD PTR _id$[ebp]
	mov	DWORD PTR [ecx], edx
; Line 64
	mov	eax, DWORD PTR ?top@WStack@@2PAUESRecord@1@A ; WStack::top
	add	eax, 4
	mov	DWORD PTR ?top@WStack@@2PAUESRecord@1@A, eax ; WStack::top
; Line 65
	mov	ecx, DWORD PTR ?count@WStack@@2JA	; WStack::count
	add	ecx, 1
	mov	DWORD PTR ?count@WStack@@2JA, ecx	; WStack::count
; Line 67
	xor	eax, eax
; Line 68
	mov	esp, ebp
	pop	ebp
	ret	4
?push@WStack@@QAEHH@Z ENDP				; WStack::push
_TEXT	ENDS
PUBLIC	?pop@WStack@@QAEHPAH@Z				; WStack::pop
_TEXT	SEGMENT
_id$ = 8
_this$ = -8
_tempCurrentRecord$ = -4
?pop@WStack@@QAEHPAH@Z PROC NEAR			; WStack::pop
; Line 74
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 78
	mov	eax, DWORD PTR ?top@WStack@@2PAUESRecord@1@A ; WStack::top
	sub	eax, 4
	mov	DWORD PTR _tempCurrentRecord$[ebp], eax
; Line 80
	mov	ecx, DWORD PTR _id$[ebp]
	mov	edx, DWORD PTR _tempCurrentRecord$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR [ecx], eax
; Line 82
	mov	ecx, DWORD PTR _tempCurrentRecord$[ebp]
	mov	DWORD PTR ?top@WStack@@2PAUESRecord@1@A, ecx ; WStack::top
; Line 84
	mov	edx, DWORD PTR ?count@WStack@@2JA	; WStack::count
	sub	edx, 1
	mov	DWORD PTR ?count@WStack@@2JA, edx	; WStack::count
; Line 85
	xor	eax, eax
; Line 86
	mov	esp, ebp
	pop	ebp
	ret	4
?pop@WStack@@QAEHPAH@Z ENDP				; WStack::pop
_TEXT	ENDS
PUBLIC	?empty@WStack@@QAEHXZ				; WStack::empty
_TEXT	SEGMENT
_this$ = -16
_retcode$ = -4
_t1$ = -8
_t2$ = -12
?empty@WStack@@QAEHXZ PROC NEAR				; WStack::empty
; Line 92
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	mov	DWORD PTR _this$[ebp], ecx
; Line 93
	mov	DWORD PTR _retcode$[ebp], 0
; Line 95
	mov	eax, DWORD PTR ?top@WStack@@2PAUESRecord@1@A ; WStack::top
	mov	DWORD PTR _t1$[ebp], eax
; Line 97
	mov	ecx, DWORD PTR ?base@WStack@@0JA	; WStack::base
	mov	DWORD PTR _t2$[ebp], ecx
; Line 99
	mov	edx, DWORD PTR _t1$[ebp]
	cmp	edx, DWORD PTR _t2$[ebp]
	jne	SHORT $L905
; Line 101
	mov	DWORD PTR _retcode$[ebp], 1
; Line 103
	jmp	SHORT $L906
$L905:
	mov	DWORD PTR _retcode$[ebp], 0
$L906:
; Line 105
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 106
	mov	esp, ebp
	pop	ebp
	ret	0
?empty@WStack@@QAEHXZ ENDP				; WStack::empty
_TEXT	ENDS
PUBLIC	?full@WStack@@QAEHXZ				; WStack::full
_TEXT	SEGMENT
_this$ = -16
_retcode$ = -4
_t1$ = -8
_t2$ = -12
?full@WStack@@QAEHXZ PROC NEAR				; WStack::full
; Line 111
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	mov	DWORD PTR _this$[ebp], ecx
; Line 112
	mov	DWORD PTR _retcode$[ebp], 0
; Line 114
	mov	eax, DWORD PTR ?top@WStack@@2PAUESRecord@1@A ; WStack::top
	mov	DWORD PTR _t1$[ebp], eax
; Line 116
	mov	ecx, DWORD PTR ?size@WStack@@0JA	; WStack::size
	mov	edx, DWORD PTR ?base@WStack@@0JA	; WStack::base
	lea	eax, DWORD PTR [edx+ecx*4]
	mov	DWORD PTR _t2$[ebp], eax
; Line 118
	mov	ecx, DWORD PTR _t1$[ebp]
	cmp	ecx, DWORD PTR _t2$[ebp]
	jne	SHORT $L915
; Line 119
	mov	DWORD PTR _retcode$[ebp], 1
; Line 120
	jmp	SHORT $L916
$L915:
	mov	DWORD PTR _retcode$[ebp], 0
$L916:
; Line 122
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 123
	mov	esp, ebp
	pop	ebp
	ret	0
?full@WStack@@QAEHXZ ENDP				; WStack::full
_TEXT	ENDS
PUBLIC	?printstack@WStack@@QAEHHH@Z			; WStack::printstack
EXTRN	?AOAprintCharacter@AOAProtected@@QAEHDH@Z:NEAR	; AOAProtected::AOAprintCharacter
EXTRN	?AOAprintHex@AOAProtected@@QAEHJH@Z:NEAR	; AOAProtected::AOAprintHex
_TEXT	SEGMENT
_lineno$ = 8
_count$ = 12
_this$ = -16
_i$ = -8
_t1$ = -4
_id$ = -12
?printstack@WStack@@QAEHHH@Z PROC NEAR			; WStack::printstack
; Line 128
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	mov	DWORD PTR _this$[ebp], ecx
; Line 129
	mov	DWORD PTR _i$[ebp], 0
; Line 131
	mov	DWORD PTR _id$[ebp], 0
; Line 133
	mov	eax, DWORD PTR ?top@WStack@@2PAUESRecord@1@A ; WStack::top
	mov	DWORD PTR _t1$[ebp], eax
; Line 136
	mov	ecx, DWORD PTR _lineno$[ebp]
	mov	DWORD PTR _i$[ebp], ecx
	jmp	SHORT $L925
$L926:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L925:
	mov	eax, DWORD PTR _lineno$[ebp]
	add	eax, 320				; 00000140H
	cmp	DWORD PTR _i$[ebp], eax
	jge	SHORT $L927
; Line 138
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	push	32					; 00000020H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintCharacter@AOAProtected@@QAEHDH@Z ; AOAProtected::AOAprintCharacter
; Line 139
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
; Line 140
	jmp	SHORT $L926
$L927:
; Line 142
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L928
$L929:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L928:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _count$[ebp]
	jge	SHORT $L930
; Line 144
	mov	edx, DWORD PTR _t1$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR _id$[ebp], eax
; Line 145
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 20					; 00000014H
	mov	edx, DWORD PTR _lineno$[ebp]
	add	edx, ecx
	push	edx
	mov	eax, DWORD PTR _id$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 146
	mov	ecx, DWORD PTR _t1$[ebp]
	sub	ecx, 4
	mov	DWORD PTR _t1$[ebp], ecx
; Line 147
	jmp	SHORT $L929
$L930:
; Line 149
	xor	eax, eax
; Line 150
	mov	esp, ebp
	pop	ebp
	ret	8
?printstack@WStack@@QAEHHH@Z ENDP			; WStack::printstack
_TEXT	ENDS
END
