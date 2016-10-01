	TITLE	test.cpp
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
PUBLIC	_main
EXTRN	??0AOAProtected@@QAE@XZ:NEAR			; AOAProtected::AOAProtected
EXTRN	?AOAconvertCharToShort@AOAProtected@@QAEGPAD@Z:NEAR ; AOAProtected::AOAconvertCharToShort
EXTRN	?AOAconvertBinaryToDecimal@AOAProtected@@QAEHPADH@Z:NEAR ; AOAProtected::AOAconvertBinaryToDecimal
EXTRN	?AOAsetTimerPeriod@AOAProtected@@QAEXH@Z:NEAR	; AOAProtected::AOAsetTimerPeriod
EXTRN	?AOAprintCharacter@AOAProtected@@QAEHDH@Z:NEAR	; AOAProtected::AOAprintCharacter
EXTRN	?AOAprintHex@AOAProtected@@QAEHJH@Z:NEAR	; AOAProtected::AOAprintHex
EXTRN	?AOAgetTimer@AOAProtected@@QAEJXZ:NEAR		; AOAProtected::AOAgetTimer
EXTRN	?AOAgetClockTicks@AOAProtected@@QAEHPAI0@Z:NEAR	; AOAProtected::AOAgetClockTicks
EXTRN	?AOAClockTicksAdd@AOAProtected@@QAEIIIIIPAI0@Z:NEAR ; AOAProtected::AOAClockTicksAdd
EXTRN	?AOAExit@AOAProtected@@QAEXXZ:NEAR		; AOAProtected::AOAExit
EXTRN	?AOAPrintText@AOAProtected@@QAEXPADH@Z:NEAR	; AOAProtected::AOAPrintText
EXTRN	?AOAenableIRQCntlr@AOAProtected@@QAEHHG@Z:NEAR	; AOAProtected::AOAenableIRQCntlr
EXTRN	?AOAdisableIRQCntlr@AOAProtected@@QAEHHG@Z:NEAR	; AOAProtected::AOAdisableIRQCntlr
_DATA	SEGMENT
$SG836	DB	'abcdefgh', 00H
	ORG $+3
$SG869	DB	'I am testing', 00H
	ORG $+3
$SG874	DB	'I am Exiting', 00H
	ORG $+3
$SG875	DB	'I am testing', 00H
_DATA	ENDS
_TEXT	SEGMENT
_io$ = -1096
_buffer$ = -1648
_MemBaseValue$ = -1680
_m$ = -1660
_n$ = -1672
_desch$ = -1668
_descl$ = -1016
_test$ = -1036
_k$ = -1120
_a$ = -8
_b$ = -1012
_c$ = -1024
_ptr2$ = -1664
_ptr3$ = -1676
_j$ = -1108
_c1$ = -1020
_a1$ = -1116
_a10$ = -1076
_value1$ = -1032
_value2$ = -1052
_retcode$ = -4
_hword1$ = -1060
_lword1$ = -1048
_hword2$ = -1064
_lword2$ = -1104
_rhigh$ = -1044
_rlow$ = -1056
_t1high$ = -1028
_t1low$ = -1040
_t2high$ = -1652
_t2low$ = -1100
_t1$ = -1080
_i$ = -1088
_main	PROC NEAR
; File test.cpp
; Line 8
	push	ebp
	mov	ebp, esp
	sub	esp, 1680				; 00000690H
	push	edi
; Line 9
	lea	ecx, DWORD PTR _io$[ebp]
	call	??0AOAProtected@@QAE@XZ			; AOAProtected::AOAProtected
; Line 12
	mov	eax, DWORD PTR $SG836
	mov	DWORD PTR _buffer$[ebp], eax
	mov	ecx, DWORD PTR $SG836+4
	mov	DWORD PTR _buffer$[ebp+4], ecx
	mov	dl, BYTE PTR $SG836+8
	mov	BYTE PTR _buffer$[ebp+8], dl
	mov	ecx, 129				; 00000081H
	xor	eax, eax
	lea	edi, DWORD PTR _buffer$[ebp+9]
	rep stosd
	stosb
; Line 13
	mov	DWORD PTR _MemBaseValue$[ebp], 0
; Line 18
	mov	DWORD PTR _test$[ebp], 0
; Line 22
	mov	DWORD PTR _k$[ebp], 0
; Line 23
	mov	DWORD PTR _a$[ebp], 1633837924		; 61626364H
; Line 28
	lea	eax, DWORD PTR _b$[ebp]
	mov	DWORD PTR _ptr2$[ebp], eax
; Line 29
	lea	ecx, DWORD PTR _c$[ebp]
	mov	DWORD PTR _ptr3$[ebp], ecx
; Line 32
	mov	WORD PTR _a1$[ebp], 0
; Line 36
	mov	DWORD PTR _retcode$[ebp], 0
; Line 37
	mov	DWORD PTR _hword1$[ebp], 0
; Line 38
	mov	DWORD PTR _lword1$[ebp], 0
; Line 39
	mov	DWORD PTR _hword2$[ebp], 0
; Line 40
	mov	DWORD PTR _lword2$[ebp], 0
; Line 41
	mov	DWORD PTR _rhigh$[ebp], 0
; Line 42
	mov	DWORD PTR _rlow$[ebp], 0
; Line 43
	mov	DWORD PTR _t1high$[ebp], 0
; Line 44
	mov	DWORD PTR _t1low$[ebp], 0
; Line 45
	mov	DWORD PTR _t2high$[ebp], 0
; Line 46
	mov	DWORD PTR _t2low$[ebp], 0
; Line 49
	mov	BYTE PTR _c1$[ebp], 1
; Line 50
	mov	BYTE PTR _c1$[ebp+1], -69		; ffffffbbH
; Line 51
	lea	edx, DWORD PTR _c1$[ebp]
	mov	DWORD PTR _t1$[ebp], edx
; Line 52
	lea	eax, DWORD PTR _m$[ebp]
	mov	DWORD PTR _desch$[ebp], eax
; Line 53
	lea	ecx, DWORD PTR _n$[ebp]
	mov	DWORD PTR _descl$[ebp], ecx
; Line 54
	mov	DWORD PTR _hword2$[ebp], -1887169007	; 8f841611H
; Line 55
	mov	DWORD PTR _lword2$[ebp], -1995472639	; 890f8101H
; Line 56
	mov	DWORD PTR _hword1$[ebp], -1895300872	; 8f0800f8H
; Line 57
	mov	DWORD PTR _lword1$[ebp], -2112874473	; 82101817H
; Line 59
	push	1300					; 00000514H
	push	OFFSET FLAT:$SG869
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 60
	push	220					; 000000dcH
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAsetTimerPeriod@AOAProtected@@QAEXH@Z ; AOAProtected::AOAsetTimerPeriod
; Line 61
	push	1
	push	2
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAdisableIRQCntlr@AOAProtected@@QAEHHG@Z ; AOAProtected::AOAdisableIRQCntlr
; Line 62
	push	1
	push	1
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAdisableIRQCntlr@AOAProtected@@QAEHHG@Z ; AOAProtected::AOAdisableIRQCntlr
; Line 63
	push	254					; 000000feH
	push	1
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAenableIRQCntlr@AOAProtected@@QAEHHG@Z ; AOAProtected::AOAenableIRQCntlr
; Line 65
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	mov	DWORD PTR _value1$[ebp], eax
; Line 66
	push	2900					; 00000b54H
	mov	edx, DWORD PTR _value1$[ebp]
	push	edx
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 67
	lea	eax, DWORD PTR _t1low$[ebp]
	push	eax
	lea	ecx, DWORD PTR _t1high$[ebp]
	push	ecx
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAgetClockTicks@AOAProtected@@QAEHPAI0@Z ; AOAProtected::AOAgetClockTicks
	mov	DWORD PTR _retcode$[ebp], eax
; Line 69
	mov	DWORD PTR _k$[ebp], 0
$L871:
; Line 70
	cmp	DWORD PTR _k$[ebp], 0
	jne	SHORT $L872
; Line 72
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	sub	eax, DWORD PTR _value1$[ebp]
	mov	DWORD PTR _value2$[ebp], eax
; Line 73
	push	2920					; 00000b68H
	mov	edx, DWORD PTR _value2$[ebp]
	push	edx
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 74
	push	2940					; 00000b7cH
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	push	eax
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 75
	mov	eax, DWORD PTR _value2$[ebp]
	sub	eax, DWORD PTR _value1$[ebp]
	cmp	eax, 240000				; 0003a980H
	jl	SHORT $L873
; Line 76
	mov	DWORD PTR _k$[ebp], 1
$L873:
; Line 77
	jmp	SHORT $L871
$L872:
; Line 78
	lea	ecx, DWORD PTR _t2low$[ebp]
	push	ecx
	lea	edx, DWORD PTR _t2high$[ebp]
	push	edx
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAgetClockTicks@AOAProtected@@QAEHPAI0@Z ; AOAProtected::AOAgetClockTicks
	mov	DWORD PTR _retcode$[ebp], eax
; Line 79
	lea	eax, DWORD PTR _rlow$[ebp]
	push	eax
	lea	ecx, DWORD PTR _rhigh$[ebp]
	push	ecx
	mov	edx, DWORD PTR _t2low$[ebp]
	push	edx
	mov	eax, DWORD PTR _t2high$[ebp]
	push	eax
	mov	ecx, DWORD PTR _t1low$[ebp]
	push	ecx
	mov	edx, DWORD PTR _t1high$[ebp]
	push	edx
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAClockTicksAdd@AOAProtected@@QAEIIIIIPAI0@Z ; AOAProtected::AOAClockTicksAdd
	mov	DWORD PTR _retcode$[ebp], eax
; Line 81
	push	3220					; 00000c94H
	mov	eax, DWORD PTR _t2high$[ebp]
	push	eax
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 82
	push	3240					; 00000ca8H
	mov	ecx, DWORD PTR _t2low$[ebp]
	push	ecx
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 83
	push	3380					; 00000d34H
	mov	edx, DWORD PTR _t1high$[ebp]
	push	edx
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 84
	push	3400					; 00000d48H
	mov	eax, DWORD PTR _t1low$[ebp]
	push	eax
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 85
	push	3540					; 00000dd4H
	mov	ecx, DWORD PTR _rhigh$[ebp]
	push	ecx
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 86
	push	3560					; 00000de8H
	mov	edx, DWORD PTR _rlow$[ebp]
	push	edx
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 88
	push	3860					; 00000f14H
	push	OFFSET FLAT:$SG874
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 90
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAExit@AOAProtected@@QAEXXZ		; AOAProtected::AOAExit
; Line 92
	push	1300					; 00000514H
	push	OFFSET FLAT:$SG875
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 93
	mov	eax, DWORD PTR _t1$[ebp]
	push	eax
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAconvertCharToShort@AOAProtected@@QAEGPAD@Z ; AOAProtected::AOAconvertCharToShort
	mov	WORD PTR _a1$[ebp], ax
; Line 95
	mov	DWORD PTR _value1$[ebp], 1234		; 000004d2H
; Line 96
	mov	ecx, DWORD PTR _value1$[ebp]
	push	ecx
	lea	edx, DWORD PTR _a10$[ebp]
	push	edx
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAconvertBinaryToDecimal@AOAProtected@@QAEHPADH@Z ; AOAProtected::AOAconvertBinaryToDecimal
	mov	DWORD PTR _j$[ebp], eax
; Line 98
	push	2100					; 00000834H
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 100
	mov	DWORD PTR _j$[ebp], 6
	jmp	SHORT $L876
$L877:
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
$L876:
	cmp	DWORD PTR _j$[ebp], 10			; 0000000aH
	jge	SHORT $L878
; Line 101
	mov	edx, DWORD PTR _j$[ebp]
	lea	eax, DWORD PTR [edx*4+2240]
	push	eax
	mov	ecx, DWORD PTR _j$[ebp]
	mov	dl, BYTE PTR _a10$[ebp+ecx]
	push	edx
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAprintCharacter@AOAProtected@@QAEHDH@Z ; AOAProtected::AOAprintCharacter
	jmp	SHORT $L877
$L878:
; Line 103
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAExit@AOAProtected@@QAEXXZ		; AOAProtected::AOAExit
; Line 228
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L880
$L881:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L880:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	cmp	DWORD PTR _i$[ebp], ecx
	jge	SHORT $L882
; Line 231
	jmp	SHORT $L881
$L882:
; Line 232
	push	1760					; 000006e0H
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 266
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAExit@AOAProtected@@QAEXXZ		; AOAProtected::AOAExit
; Line 267
	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_main	ENDP
_TEXT	ENDS
END
