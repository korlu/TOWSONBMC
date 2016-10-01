	TITLE	wlist.cpp
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
PUBLIC	?base@WList@@0JA				; WList::base
PUBLIC	?size@WList@@0JA				; WList::size
_BSS	SEGMENT
?base@WList@@0JA DD 01H DUP (?)				; WList::base
?size@WList@@0JA DD 01H DUP (?)				; WList::size
_BSS	ENDS
PUBLIC	?init@WList@@QAEHJJ@Z				; WList::init
_TEXT	SEGMENT
_inpbase$ = 8
_inpsize$ = 12
_this$ = -12
_TRecordPtr$ = -8
_i$ = -4
?init@WList@@QAEHJJ@Z PROC NEAR				; WList::init
; File wlist.cpp
; Line 17
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 18
	mov	eax, DWORD PTR _inpbase$[ebp]
	mov	DWORD PTR ?base@WList@@0JA, eax		; WList::base
; Line 19
	mov	ecx, DWORD PTR _inpsize$[ebp]
	mov	DWORD PTR ?size@WList@@0JA, ecx		; WList::size
; Line 23
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L894
$L895:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L894:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR ?size@WList@@0JA		; WList::size
	jge	SHORT $L896
; Line 25
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 36					; 00000024H
	mov	edx, DWORD PTR ?base@WList@@0JA		; WList::base
	add	edx, ecx
	mov	DWORD PTR _TRecordPtr$[ebp], edx
; Line 26
	mov	eax, DWORD PTR _TRecordPtr$[ebp]
	mov	DWORD PTR [eax], 0
; Line 27
	mov	ecx, DWORD PTR _TRecordPtr$[ebp]
	mov	DWORD PTR [ecx+4], 0
; Line 28
	mov	edx, DWORD PTR _TRecordPtr$[ebp]
	mov	DWORD PTR [edx+8], 0
; Line 29
	mov	eax, DWORD PTR _TRecordPtr$[ebp]
	mov	DWORD PTR [eax+12], 0
; Line 30
	mov	ecx, DWORD PTR _TRecordPtr$[ebp]
	mov	DWORD PTR [ecx+24], 0
; Line 31
	mov	edx, DWORD PTR _TRecordPtr$[ebp]
	mov	DWORD PTR [edx+28], 0
; Line 32
	mov	eax, DWORD PTR _TRecordPtr$[ebp]
	mov	DWORD PTR [eax+32], 0
; Line 33
	jmp	SHORT $L895
$L896:
; Line 34
	xor	eax, eax
; Line 35
	mov	esp, ebp
	pop	ebp
	ret	8
?init@WList@@QAEHJJ@Z ENDP				; WList::init
_TEXT	ENDS
PUBLIC	?reset@WList@@QAEHJ@Z				; WList::reset
EXTRN	?AOAgetTimer@AOAProtected@@QAEJXZ:NEAR		; AOAProtected::AOAgetTimer
_TEXT	SEGMENT
_id$ = 8
_this$ = -8
_TRecordPtr$ = -4
?reset@WList@@QAEHJ@Z PROC NEAR				; WList::reset
; Line 41
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 43
	mov	eax, DWORD PTR _id$[ebp]
	imul	eax, 36					; 00000024H
	mov	ecx, DWORD PTR ?base@WList@@0JA		; WList::base
	add	ecx, eax
	mov	DWORD PTR _TRecordPtr$[ebp], ecx
; Line 45
	mov	edx, DWORD PTR _TRecordPtr$[ebp]
	mov	DWORD PTR [edx], 0
; Line 46
	mov	eax, DWORD PTR _TRecordPtr$[ebp]
	mov	DWORD PTR [eax+4], 0
; Line 47
	mov	ecx, DWORD PTR _TRecordPtr$[ebp]
	mov	DWORD PTR [ecx+8], 0
; Line 48
	mov	edx, DWORD PTR _TRecordPtr$[ebp]
	mov	DWORD PTR [edx+12], 0
; Line 49
	mov	eax, DWORD PTR _TRecordPtr$[ebp]
	mov	DWORD PTR [eax+24], 0
; Line 50
	mov	ecx, DWORD PTR _TRecordPtr$[ebp]
	mov	DWORD PTR [ecx+28], 0
; Line 51
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	mov	edx, DWORD PTR _TRecordPtr$[ebp]
	mov	DWORD PTR [edx+16], eax
; Line 52
	mov	eax, DWORD PTR _TRecordPtr$[ebp]
	mov	DWORD PTR [eax+32], 0
; Line 54
	xor	eax, eax
; Line 55
	mov	esp, ebp
	pop	ebp
	ret	4
?reset@WList@@QAEHJ@Z ENDP				; WList::reset
_TEXT	ENDS
PUBLIC	?insert@WList@@QAEHJHHH@Z			; WList::insert
_TEXT	SEGMENT
_id$ = 8
_tcbrno$ = 12
_value$ = 16
_maskindex$ = 20
_this$ = -12
_cstate$ = -4
_TRecordPtr$ = -8
?insert@WList@@QAEHJHHH@Z PROC NEAR			; WList::insert
; Line 61
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	mov	DWORD PTR _this$[ebp], ecx
; Line 62
	mov	DWORD PTR _cstate$[ebp], 0
; Line 65
	mov	eax, DWORD PTR _id$[ebp]
	imul	eax, 36					; 00000024H
	mov	ecx, DWORD PTR ?base@WList@@0JA		; WList::base
	add	ecx, eax
	mov	DWORD PTR _TRecordPtr$[ebp], ecx
; Line 67
	mov	edx, DWORD PTR _TRecordPtr$[ebp]
	mov	DWORD PTR [edx], 1
; Line 68
	mov	eax, DWORD PTR _TRecordPtr$[ebp]
	mov	ecx, DWORD PTR _id$[ebp]
	mov	DWORD PTR [eax+4], ecx
; Line 69
	mov	edx, DWORD PTR _TRecordPtr$[ebp]
	mov	eax, DWORD PTR _tcbrno$[ebp]
	mov	DWORD PTR [edx+12], eax
; Line 70
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	mov	ecx, DWORD PTR _TRecordPtr$[ebp]
	sub	eax, DWORD PTR [ecx+16]
	mov	edx, DWORD PTR _TRecordPtr$[ebp]
	mov	DWORD PTR [edx+20], eax
; Line 71
	mov	eax, DWORD PTR _TRecordPtr$[ebp]
	mov	ecx, DWORD PTR _TRecordPtr$[ebp]
	mov	edx, DWORD PTR [eax+20]
	cmp	edx, DWORD PTR [ecx+24]
	jle	SHORT $L917
; Line 73
	mov	eax, DWORD PTR _TRecordPtr$[ebp]
	mov	ecx, DWORD PTR _TRecordPtr$[ebp]
	mov	edx, DWORD PTR [ecx+20]
	mov	DWORD PTR [eax+24], edx
$L917:
; Line 77
	mov	eax, DWORD PTR _maskindex$[ebp]
	mov	DWORD PTR -16+[ebp], eax
	mov	ecx, DWORD PTR -16+[ebp]
	sub	ecx, 1
	mov	DWORD PTR -16+[ebp], ecx
	cmp	DWORD PTR -16+[ebp], 7
	ja	$L919
	mov	edx, DWORD PTR -16+[ebp]
	jmp	DWORD PTR $L977[edx*4]
$L922:
; Line 79
	mov	eax, DWORD PTR _TRecordPtr$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	and	ecx, 268435455				; 0fffffffH
	or	ecx, DWORD PTR _value$[ebp]
	mov	DWORD PTR _cstate$[ebp], ecx
; Line 80
	jmp	SHORT $L919
$L923:
; Line 82
	mov	edx, DWORD PTR _TRecordPtr$[ebp]
	mov	eax, DWORD PTR [edx+8]
	and	eax, -251658241				; f0ffffffH
	or	eax, DWORD PTR _value$[ebp]
	mov	DWORD PTR _cstate$[ebp], eax
; Line 83
	jmp	SHORT $L919
$L924:
; Line 85
	mov	ecx, DWORD PTR _TRecordPtr$[ebp]
	mov	edx, DWORD PTR [ecx+8]
	and	edx, -15728641				; ff0fffffH
	or	edx, DWORD PTR _value$[ebp]
	mov	DWORD PTR _cstate$[ebp], edx
; Line 86
	jmp	SHORT $L919
$L925:
; Line 88
	mov	eax, DWORD PTR _TRecordPtr$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	and	ecx, -983041				; fff0ffffH
	or	ecx, DWORD PTR _value$[ebp]
	mov	DWORD PTR _cstate$[ebp], ecx
; Line 89
	jmp	SHORT $L919
$L926:
; Line 91
	mov	edx, DWORD PTR _TRecordPtr$[ebp]
	mov	eax, DWORD PTR [edx+8]
	and	ah, 15					; 0000000fH
	or	eax, DWORD PTR _value$[ebp]
	mov	DWORD PTR _cstate$[ebp], eax
; Line 92
	jmp	SHORT $L919
$L927:
; Line 94
	mov	ecx, DWORD PTR _TRecordPtr$[ebp]
	mov	edx, DWORD PTR [ecx+8]
	and	dh, -16					; fffffff0H
	or	edx, DWORD PTR _value$[ebp]
	mov	DWORD PTR _cstate$[ebp], edx
; Line 95
	jmp	SHORT $L919
$L928:
; Line 97
	mov	eax, DWORD PTR _TRecordPtr$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	and	cl, 15					; 0000000fH
	or	ecx, DWORD PTR _value$[ebp]
	mov	DWORD PTR _cstate$[ebp], ecx
; Line 98
	jmp	SHORT $L919
$L929:
; Line 100
	mov	edx, DWORD PTR _TRecordPtr$[ebp]
	mov	eax, DWORD PTR [edx+8]
	and	al, -16					; fffffff0H
	or	eax, DWORD PTR _value$[ebp]
	mov	DWORD PTR _cstate$[ebp], eax
$L919:
; Line 104
	mov	ecx, DWORD PTR _TRecordPtr$[ebp]
	mov	edx, DWORD PTR _cstate$[ebp]
	mov	DWORD PTR [ecx+8], edx
; Line 106
	xor	eax, eax
; Line 107
	mov	esp, ebp
	pop	ebp
	ret	16					; 00000010H
$L977:
	DD	$L922
	DD	$L923
	DD	$L924
	DD	$L925
	DD	$L926
	DD	$L927
	DD	$L928
	DD	$L929
?insert@WList@@QAEHJHHH@Z ENDP				; WList::insert
_TEXT	ENDS
PUBLIC	?insert@WList@@QAEHJH@Z				; WList::insert
_TEXT	SEGMENT
_id$ = 8
_value$ = 12
_this$ = -12
_tempval$ = -8
_TRecordPtr$ = -4
?insert@WList@@QAEHJH@Z PROC NEAR			; WList::insert
; Line 113
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 114
	mov	DWORD PTR _tempval$[ebp], 0
; Line 116
	mov	eax, DWORD PTR _id$[ebp]
	imul	eax, 36					; 00000024H
	mov	ecx, DWORD PTR ?base@WList@@0JA		; WList::base
	add	ecx, eax
	mov	DWORD PTR _TRecordPtr$[ebp], ecx
; Line 118
	cmp	DWORD PTR _value$[ebp], 1
	jne	SHORT $L939
; Line 120
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	mov	edx, DWORD PTR _TRecordPtr$[ebp]
	mov	DWORD PTR [edx+32], eax
$L939:
; Line 122
	cmp	DWORD PTR _value$[ebp], 2
	jne	SHORT $L940
; Line 124
	mov	eax, DWORD PTR _TRecordPtr$[ebp]
	mov	ecx, DWORD PTR [eax+32]
	mov	DWORD PTR _tempval$[ebp], ecx
; Line 125
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	sub	eax, DWORD PTR _tempval$[ebp]
	mov	edx, DWORD PTR _TRecordPtr$[ebp]
	mov	DWORD PTR [edx+32], eax
$L940:
; Line 127
	cmp	DWORD PTR _value$[ebp], 0
	jne	SHORT $L941
; Line 129
	mov	eax, DWORD PTR _TRecordPtr$[ebp]
	mov	ecx, DWORD PTR [eax+28]
	mov	DWORD PTR _tempval$[ebp], ecx
; Line 130
	mov	edx, DWORD PTR _tempval$[ebp]
	add	edx, 1
	mov	DWORD PTR _tempval$[ebp], edx
; Line 131
	mov	eax, DWORD PTR _TRecordPtr$[ebp]
	mov	ecx, DWORD PTR _tempval$[ebp]
	mov	DWORD PTR [eax+28], ecx
$L941:
; Line 133
	xor	eax, eax
; Line 134
	mov	esp, ebp
	pop	ebp
	ret	8
?insert@WList@@QAEHJH@Z ENDP				; WList::insert
_TEXT	ENDS
PUBLIC	?get@WList@@QAEHPAJ0PAH@Z			; WList::get
_TEXT	SEGMENT
_taskid$ = 8
_statec$ = 12
_tcbrnoc$ = 16
_this$ = -8
_TRecordPtr$ = -4
?get@WList@@QAEHPAJ0PAH@Z PROC NEAR			; WList::get
; Line 140
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 143
	mov	eax, DWORD PTR _taskid$[ebp]
	mov	ecx, DWORD PTR [eax]
	imul	ecx, 36					; 00000024H
	mov	edx, DWORD PTR ?base@WList@@0JA		; WList::base
	add	edx, ecx
	mov	DWORD PTR _TRecordPtr$[ebp], edx
; Line 145
	mov	eax, DWORD PTR _TRecordPtr$[ebp]
	mov	DWORD PTR [eax], 0
; Line 146
	mov	ecx, DWORD PTR _taskid$[ebp]
	mov	edx, DWORD PTR _TRecordPtr$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR [ecx], eax
; Line 147
	mov	ecx, DWORD PTR _statec$[ebp]
	mov	edx, DWORD PTR _TRecordPtr$[ebp]
	mov	eax, DWORD PTR [edx+8]
	mov	DWORD PTR [ecx], eax
; Line 148
	mov	ecx, DWORD PTR _tcbrnoc$[ebp]
	mov	edx, DWORD PTR _TRecordPtr$[ebp]
	mov	eax, DWORD PTR [edx+12]
	mov	DWORD PTR [ecx], eax
; Line 150
	xor	eax, eax
; Line 151
	mov	esp, ebp
	pop	ebp
	ret	12					; 0000000cH
?get@WList@@QAEHPAJ0PAH@Z ENDP				; WList::get
_TEXT	ENDS
PUBLIC	?printlist@WList@@QAEHH@Z			; WList::printlist
EXTRN	?AOAprintCharacter@AOAProtected@@QAEHDH@Z:NEAR	; AOAProtected::AOAprintCharacter
EXTRN	?AOAprintHex@AOAProtected@@QAEHJH@Z:NEAR	; AOAProtected::AOAprintHex
_TEXT	SEGMENT
_lineno$ = 8
_this$ = -36
_TRecordPtr$ = -20
_taskid$ = -24
_statec$ = -32
_tcbrnoc$ = -28
_i$ = -8
_j$ = -12
_k$ = -16
?printlist@WList@@QAEHH@Z PROC NEAR			; WList::printlist
; Line 156
	push	ebp
	mov	ebp, esp
	sub	esp, 36					; 00000024H
	mov	DWORD PTR _this$[ebp], ecx
; Line 159
	mov	DWORD PTR _taskid$[ebp], 0
; Line 160
	mov	DWORD PTR _statec$[ebp], 0
; Line 161
	mov	DWORD PTR _tcbrnoc$[ebp], 0
; Line 162
	mov	DWORD PTR _i$[ebp], 0
	mov	DWORD PTR _j$[ebp], 0
	mov	DWORD PTR _k$[ebp], 0
; Line 164
	mov	eax, DWORD PTR _lineno$[ebp]
	mov	DWORD PTR _i$[ebp], eax
	jmp	SHORT $L963
$L964:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L963:
	mov	edx, DWORD PTR _lineno$[ebp]
	add	edx, 320				; 00000140H
	cmp	DWORD PTR _i$[ebp], edx
	jge	SHORT $L965
; Line 166
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	push	32					; 00000020H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintCharacter@AOAProtected@@QAEHDH@Z ; AOAProtected::AOAprintCharacter
; Line 167
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
; Line 168
	jmp	SHORT $L964
$L965:
; Line 170
	mov	DWORD PTR _i$[ebp], 9
	mov	DWORD PTR _k$[ebp], 0
	jmp	SHORT $L966
$L967:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L966:
	cmp	DWORD PTR _i$[ebp], 109			; 0000006dH
	jge	$L968
; Line 172
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 36					; 00000024H
	mov	ecx, DWORD PTR ?base@WList@@0JA		; WList::base
	add	ecx, eax
	mov	DWORD PTR _TRecordPtr$[ebp], ecx
; Line 174
	mov	edx, DWORD PTR _TRecordPtr$[ebp]
	cmp	DWORD PTR [edx], 1
	jne	$L971
; Line 176
	mov	eax, DWORD PTR _TRecordPtr$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	mov	DWORD PTR _taskid$[ebp], ecx
; Line 177
	mov	edx, DWORD PTR _TRecordPtr$[ebp]
	mov	eax, DWORD PTR [edx+8]
	mov	DWORD PTR _statec$[ebp], eax
; Line 178
	mov	ecx, DWORD PTR _TRecordPtr$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR _tcbrnoc$[ebp], edx
; Line 180
	mov	eax, DWORD PTR _k$[ebp]
	imul	eax, 160				; 000000a0H
	mov	ecx, DWORD PTR _lineno$[ebp]
	add	ecx, eax
	mov	edx, DWORD PTR _j$[ebp]
	imul	edx, 20					; 00000014H
	add	ecx, edx
	push	ecx
	mov	eax, DWORD PTR _taskid$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 181
	mov	ecx, DWORD PTR _k$[ebp]
	imul	ecx, 160				; 000000a0H
	mov	edx, DWORD PTR _lineno$[ebp]
	add	edx, ecx
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	imul	eax, 20					; 00000014H
	add	edx, eax
	push	edx
	mov	ecx, DWORD PTR _statec$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 182
	mov	edx, DWORD PTR _k$[ebp]
	imul	edx, 160				; 000000a0H
	mov	eax, DWORD PTR _lineno$[ebp]
	add	eax, edx
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 2
	imul	ecx, 20					; 00000014H
	add	eax, ecx
	push	eax
	mov	edx, DWORD PTR _TRecordPtr$[ebp]
	mov	eax, DWORD PTR [edx+20]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 183
	mov	ecx, DWORD PTR _k$[ebp]
	imul	ecx, 160				; 000000a0H
	mov	edx, DWORD PTR _lineno$[ebp]
	add	edx, ecx
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 3
	imul	eax, 20					; 00000014H
	add	edx, eax
	push	edx
	mov	ecx, DWORD PTR _TRecordPtr$[ebp]
	mov	edx, DWORD PTR [ecx+28]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 184
	mov	eax, DWORD PTR _k$[ebp]
	imul	eax, 160				; 000000a0H
	mov	ecx, DWORD PTR _lineno$[ebp]
	add	ecx, eax
	mov	edx, DWORD PTR _j$[ebp]
	add	edx, 4
	imul	edx, 20					; 00000014H
	add	ecx, edx
	push	ecx
	mov	eax, DWORD PTR _TRecordPtr$[ebp]
	mov	ecx, DWORD PTR [eax+32]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 186
	mov	DWORD PTR _j$[ebp], 0
; Line 187
	mov	edx, DWORD PTR _k$[ebp]
	add	edx, 1
	mov	DWORD PTR _k$[ebp], edx
$L971:
; Line 189
	jmp	$L967
$L968:
; Line 191
	xor	eax, eax
; Line 192
	mov	esp, ebp
	pop	ebp
	ret	4
?printlist@WList@@QAEHH@Z ENDP				; WList::printlist
_TEXT	ENDS
END
