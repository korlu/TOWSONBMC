	TITLE	aoaprotected.cpp
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
PUBLIC	?Application_Status@AOAProtected@@2HA		; AOAProtected::Application_Status
PUBLIC	?PosCount@AOAProtected@@2HA			; AOAProtected::PosCount
PUBLIC	?LineNumber@AOAProtected@@2HA			; AOAProtected::LineNumber
PUBLIC	?RunRegister@AOAProtected@@2JA			; AOAProtected::RunRegister
PUBLIC	?RcvCounter@AOAProtected@@2JA			; AOAProtected::RcvCounter
PUBLIC	?SndCounter@AOAProtected@@2JA			; AOAProtected::SndCounter
PUBLIC	?HttpCounter@AOAProtected@@2JA			; AOAProtected::HttpCounter
PUBLIC	?IntCounter@AOAProtected@@2JA			; AOAProtected::IntCounter
PUBLIC	?tDWCounter@AOAProtected@@2HA			; AOAProtected::tDWCounter
PUBLIC	?AUTHSYN_SPORT@AOAProtected@@2PADA		; AOAProtected::AUTHSYN_SPORT
PUBLIC	?DomainName@AOAProtected@@2PADA			; AOAProtected::DomainName
PUBLIC	?phpparseflag@AOAProtected@@2HA			; AOAProtected::phpparseflag
PUBLIC	?phpparseflagread@AOAProtected@@2HA		; AOAProtected::phpparseflagread
_BSS	SEGMENT
?Application_Status@AOAProtected@@2HA DD 01H DUP (?)	; AOAProtected::Application_Status
?PosCount@AOAProtected@@2HA DD 01H DUP (?)		; AOAProtected::PosCount
?LineNumber@AOAProtected@@2HA DD 01H DUP (?)		; AOAProtected::LineNumber
?RunRegister@AOAProtected@@2JA DD 01H DUP (?)		; AOAProtected::RunRegister
?RcvCounter@AOAProtected@@2JA DD 01H DUP (?)		; AOAProtected::RcvCounter
?SndCounter@AOAProtected@@2JA DD 01H DUP (?)		; AOAProtected::SndCounter
?HttpCounter@AOAProtected@@2JA DD 01H DUP (?)		; AOAProtected::HttpCounter
?IntCounter@AOAProtected@@2JA DD 01H DUP (?)		; AOAProtected::IntCounter
?tDWCounter@AOAProtected@@2HA DD 01H DUP (?)		; AOAProtected::tDWCounter
?phpparseflag@AOAProtected@@2HA DD 01H DUP (?)		; AOAProtected::phpparseflag
?phpparseflagread@AOAProtected@@2HA DD 01H DUP (?)	; AOAProtected::phpparseflagread
_BSS	ENDS
_DATA	SEGMENT
?AUTHSYN_SPORT@AOAProtected@@2PADA DB 0c0H		; AOAProtected::AUTHSYN_SPORT
	DB	020H
	ORG $+2
?DomainName@AOAProtected@@2PADA DB 'baremachine.towson.edu', 00H ; AOAProtected::DomainName
	ORG $+2
_DATA	ENDS
PUBLIC	??0AOAProtected@@QAE@XZ				; AOAProtected::AOAProtected
_TEXT	SEGMENT
_this$ = -4
??0AOAProtected@@QAE@XZ PROC NEAR			; AOAProtected::AOAProtected
; File aoaprotected.cpp
; Line 31
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 32
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax], 1
; Line 34
	mov	eax, DWORD PTR _this$[ebp]
	mov	esp, ebp
	pop	ebp
	ret	0
??0AOAProtected@@QAE@XZ ENDP				; AOAProtected::AOAProtected
_TEXT	ENDS
PUBLIC	?test@AOAProtected@@QAEJJ@Z			; AOAProtected::test
EXTRN	_Ctest32:NEAR
_TEXT	SEGMENT
_testcase$ = 8
_this$ = -4
?test@AOAProtected@@QAEJJ@Z PROC NEAR			; AOAProtected::test
; Line 37
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 38
	mov	eax, DWORD PTR _testcase$[ebp]
	push	eax
	call	_Ctest32
	add	esp, 4
; Line 39
	mov	esp, ebp
	pop	ebp
	ret	4
?test@AOAProtected@@QAEJJ@Z ENDP			; AOAProtected::test
_TEXT	ENDS
PUBLIC	?AOAcli@AOAProtected@@QAEXXZ			; AOAProtected::AOAcli
EXTRN	_Ccli32:NEAR
_TEXT	SEGMENT
_this$ = -4
?AOAcli@AOAProtected@@QAEXXZ PROC NEAR			; AOAProtected::AOAcli
; Line 42
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 44
	call	_Ccli32
; Line 45
	mov	esp, ebp
	pop	ebp
	ret	0
?AOAcli@AOAProtected@@QAEXXZ ENDP			; AOAProtected::AOAcli
_TEXT	ENDS
PUBLIC	?AOAenableIRQCntlr@AOAProtected@@QAEHHG@Z	; AOAProtected::AOAenableIRQCntlr
EXTRN	_CenableIRQCntlr32:NEAR
_TEXT	SEGMENT
_picno$ = 8
_mask$ = 12
_this$ = -4
?AOAenableIRQCntlr@AOAProtected@@QAEHHG@Z PROC NEAR	; AOAProtected::AOAenableIRQCntlr
; Line 48
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 49
	mov	ax, WORD PTR _mask$[ebp]
	push	eax
	mov	ecx, DWORD PTR _picno$[ebp]
	push	ecx
	call	_CenableIRQCntlr32
	add	esp, 8
; Line 51
	mov	esp, ebp
	pop	ebp
	ret	8
?AOAenableIRQCntlr@AOAProtected@@QAEHHG@Z ENDP		; AOAProtected::AOAenableIRQCntlr
_TEXT	ENDS
PUBLIC	?AOAdisableIRQCntlr@AOAProtected@@QAEHHG@Z	; AOAProtected::AOAdisableIRQCntlr
EXTRN	_CdisableIRQCntlr32:NEAR
_TEXT	SEGMENT
_picno$ = 8
_mask$ = 12
_this$ = -4
?AOAdisableIRQCntlr@AOAProtected@@QAEHHG@Z PROC NEAR	; AOAProtected::AOAdisableIRQCntlr
; Line 54
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 55
	mov	ax, WORD PTR _mask$[ebp]
	push	eax
	mov	ecx, DWORD PTR _picno$[ebp]
	push	ecx
	call	_CdisableIRQCntlr32
	add	esp, 8
; Line 56
	mov	esp, ebp
	pop	ebp
	ret	8
?AOAdisableIRQCntlr@AOAProtected@@QAEHHG@Z ENDP		; AOAProtected::AOAdisableIRQCntlr
_TEXT	ENDS
PUBLIC	?AOAackPICCntlr@AOAProtected@@QAEHH@Z		; AOAProtected::AOAackPICCntlr
EXTRN	_CackPICCntlr32:NEAR
_TEXT	SEGMENT
_picno$ = 8
_this$ = -4
?AOAackPICCntlr@AOAProtected@@QAEHH@Z PROC NEAR		; AOAProtected::AOAackPICCntlr
; Line 59
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 60
	mov	eax, DWORD PTR _picno$[ebp]
	push	eax
	call	_CackPICCntlr32
	add	esp, 4
; Line 61
	mov	esp, ebp
	pop	ebp
	ret	4
?AOAackPICCntlr@AOAProtected@@QAEHH@Z ENDP		; AOAProtected::AOAackPICCntlr
_TEXT	ENDS
PUBLIC	?AOAintTimer@AOAProtected@@QAEXXZ		; AOAProtected::AOAintTimer
EXTRN	_CintTimer32:NEAR
_TEXT	SEGMENT
_this$ = -4
?AOAintTimer@AOAProtected@@QAEXXZ PROC NEAR		; AOAProtected::AOAintTimer
; Line 64
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 65
	call	_CintTimer32
; Line 66
	mov	esp, ebp
	pop	ebp
	ret	0
?AOAintTimer@AOAProtected@@QAEXXZ ENDP			; AOAProtected::AOAintTimer
_TEXT	ENDS
PUBLIC	?AOAsti@AOAProtected@@QAEXXZ			; AOAProtected::AOAsti
EXTRN	_Csti32:NEAR
_TEXT	SEGMENT
_this$ = -4
?AOAsti@AOAProtected@@QAEXXZ PROC NEAR			; AOAProtected::AOAsti
; Line 69
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 70
	call	_Csti32
; Line 71
	mov	esp, ebp
	pop	ebp
	ret	0
?AOAsti@AOAProtected@@QAEXXZ ENDP			; AOAProtected::AOAsti
_TEXT	ENDS
PUBLIC	?AOAstiTimer@AOAProtected@@QAEXXZ		; AOAProtected::AOAstiTimer
EXTRN	_CstiTimer32:NEAR
_TEXT	SEGMENT
_this$ = -8
_i$ = -4
?AOAstiTimer@AOAProtected@@QAEXXZ PROC NEAR		; AOAProtected::AOAstiTimer
; Line 74
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
	mov	DWORD PTR _i$[ebp], 0
; Line 75
	call	_CstiTimer32
; Line 76
	mov	esp, ebp
	pop	ebp
	ret	0
?AOAstiTimer@AOAProtected@@QAEXXZ ENDP			; AOAProtected::AOAstiTimer
_TEXT	ENDS
PUBLIC	?AOAcliTimer@AOAProtected@@QAEXXZ		; AOAProtected::AOAcliTimer
EXTRN	_CcliTimer32:NEAR
_TEXT	SEGMENT
_this$ = -4
?AOAcliTimer@AOAProtected@@QAEXXZ PROC NEAR		; AOAProtected::AOAcliTimer
; Line 79
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 80
	call	_CcliTimer32
; Line 81
	mov	esp, ebp
	pop	ebp
	ret	0
?AOAcliTimer@AOAProtected@@QAEXXZ ENDP			; AOAProtected::AOAcliTimer
_TEXT	ENDS
PUBLIC	?AOAgetString@AOAProtected@@QAEHPAD@Z		; AOAProtected::AOAgetString
EXTRN	_CgetStr32:NEAR
_TEXT	SEGMENT
_buffer$ = 8
_this$ = -4
?AOAgetString@AOAProtected@@QAEHPAD@Z PROC NEAR		; AOAProtected::AOAgetString
; Line 84
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 85
	mov	eax, DWORD PTR _buffer$[ebp]
	push	eax
	call	_CgetStr32
	add	esp, 4
; Line 86
	mov	esp, ebp
	pop	ebp
	ret	4
?AOAgetString@AOAProtected@@QAEHPAD@Z ENDP		; AOAProtected::AOAgetString
_TEXT	ENDS
PUBLIC	?AOAprintMemory@AOAProtected@@QAEHJHHH@Z	; AOAProtected::AOAprintMemory
PUBLIC	?AOAprintCharacter@AOAProtected@@QAEHDH@Z	; AOAProtected::AOAprintCharacter
PUBLIC	?AOAprintHex@AOAProtected@@QAEHJH@Z		; AOAProtected::AOAprintHex
EXTRN	_CgetRealMemory:NEAR
_TEXT	SEGMENT
_addr$ = 8
_count$ = 12
_location$ = 16
_mode$ = 20
_this$ = -28
_ptr$ = -8
_p1$ = -12
_value$ = -4
_i$ = -16
_i$886 = -20
_i$893 = -24
?AOAprintMemory@AOAProtected@@QAEHJHHH@Z PROC NEAR	; AOAProtected::AOAprintMemory
; Line 94
	push	ebp
	mov	ebp, esp
	sub	esp, 28					; 0000001cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 95
	mov	DWORD PTR _ptr$[ebp], 0
; Line 97
	lea	eax, DWORD PTR _p1$[ebp]
	mov	DWORD PTR _ptr$[ebp], eax
; Line 98
	mov	DWORD PTR _value$[ebp], 0
; Line 101
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L882
$L883:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L882:
	mov	edx, DWORD PTR _count$[ebp]
	shl	edx, 2
	cmp	DWORD PTR _i$[ebp], edx
	jge	SHORT $L884
; Line 103
	mov	DWORD PTR _value$[ebp], 32		; 00000020H
; Line 104
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _location$[ebp]
	lea	edx, DWORD PTR [ecx+eax*2]
	push	edx
	mov	al, BYTE PTR _value$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintCharacter@AOAProtected@@QAEHDH@Z ; AOAProtected::AOAprintCharacter
; Line 105
	mov	ecx, DWORD PTR _ptr$[ebp]
	add	ecx, 4
	mov	DWORD PTR _ptr$[ebp], ecx
; Line 106
	jmp	SHORT $L883
$L884:
; Line 108
	cmp	DWORD PTR _mode$[ebp], 0
	jne	SHORT $L885
; Line 110
	mov	DWORD PTR _i$886[ebp], 0
	jmp	SHORT $L887
$L888:
	mov	edx, DWORD PTR _i$886[ebp]
	add	edx, 1
	mov	DWORD PTR _i$886[ebp], edx
$L887:
	mov	eax, DWORD PTR _i$886[ebp]
	cmp	eax, DWORD PTR _count$[ebp]
	jge	SHORT $L889
; Line 112
	mov	ecx, DWORD PTR _addr$[ebp]
	push	ecx
	call	_CgetRealMemory
	add	esp, 4
	mov	DWORD PTR _value$[ebp], eax
; Line 113
	mov	edx, DWORD PTR _i$886[ebp]
	imul	edx, 20					; 00000014H
	mov	eax, DWORD PTR _location$[ebp]
	add	eax, edx
	push	eax
	mov	ecx, DWORD PTR _value$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 114
	mov	edx, DWORD PTR _addr$[ebp]
	add	edx, 4
	mov	DWORD PTR _addr$[ebp], edx
; Line 115
	jmp	SHORT $L888
$L889:
; Line 118
	jmp	SHORT $L896
$L885:
	cmp	DWORD PTR _mode$[ebp], 1
	jne	SHORT $L896
; Line 120
	mov	eax, DWORD PTR _addr$[ebp]
	sub	eax, 1114112				; 00110000H
	mov	DWORD PTR _addr$[ebp], eax
; Line 121
	mov	ecx, DWORD PTR _addr$[ebp]
	mov	DWORD PTR _ptr$[ebp], ecx
; Line 123
	mov	DWORD PTR _i$893[ebp], 0
	jmp	SHORT $L894
$L895:
	mov	edx, DWORD PTR _i$893[ebp]
	add	edx, 1
	mov	DWORD PTR _i$893[ebp], edx
$L894:
	mov	eax, DWORD PTR _i$893[ebp]
	cmp	eax, DWORD PTR _count$[ebp]
	jge	SHORT $L896
; Line 125
	mov	ecx, DWORD PTR _ptr$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR _value$[ebp], edx
; Line 126
	mov	eax, DWORD PTR _i$893[ebp]
	imul	eax, 20					; 00000014H
	mov	ecx, DWORD PTR _location$[ebp]
	add	ecx, eax
	push	ecx
	mov	edx, DWORD PTR _value$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 127
	mov	eax, DWORD PTR _ptr$[ebp]
	add	eax, 4
	mov	DWORD PTR _ptr$[ebp], eax
; Line 128
	jmp	SHORT $L895
$L896:
; Line 131
	xor	eax, eax
; Line 132
	mov	esp, ebp
	pop	ebp
	ret	16					; 00000010H
?AOAprintMemory@AOAProtected@@QAEHJHHH@Z ENDP		; AOAProtected::AOAprintMemory
_TEXT	ENDS
PUBLIC	?AOAprintString@AOAProtected@@QAEHPADHH@Z	; AOAProtected::AOAprintString
EXTRN	_CprintStr32:NEAR
_TEXT	SEGMENT
_buffer$ = 8
_len$ = 12
_pos$ = 16
_this$ = -4
?AOAprintString@AOAProtected@@QAEHPADHH@Z PROC NEAR	; AOAProtected::AOAprintString
; Line 136
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 137
	mov	eax, DWORD PTR _pos$[ebp]
	push	eax
	mov	ecx, DWORD PTR _len$[ebp]
	push	ecx
	mov	edx, DWORD PTR _buffer$[ebp]
	push	edx
	call	_CprintStr32
	add	esp, 12					; 0000000cH
; Line 138
	mov	esp, ebp
	pop	ebp
	ret	12					; 0000000cH
?AOAprintString@AOAProtected@@QAEHPADHH@Z ENDP		; AOAProtected::AOAprintString
_TEXT	ENDS
PUBLIC	?AOAprintString@AOAProtected@@QAEHPADH@Z	; AOAProtected::AOAprintString
PUBLIC	?AOAgetCursor@AOAProtected@@QAEHXZ		; AOAProtected::AOAgetCursor
_TEXT	SEGMENT
_buffer$ = 8
_len$ = 12
_this$ = -8
_pos$ = -4
?AOAprintString@AOAProtected@@QAEHPADH@Z PROC NEAR	; AOAProtected::AOAprintString
; Line 140
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 143
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCursor@AOAProtected@@QAEHXZ	; AOAProtected::AOAgetCursor
	mov	DWORD PTR _pos$[ebp], eax
; Line 144
	mov	eax, DWORD PTR _pos$[ebp]
	push	eax
	mov	ecx, DWORD PTR _len$[ebp]
	push	ecx
	mov	edx, DWORD PTR _buffer$[ebp]
	push	edx
	call	_CprintStr32
	add	esp, 12					; 0000000cH
; Line 145
	mov	esp, ebp
	pop	ebp
	ret	8
?AOAprintString@AOAProtected@@QAEHPADH@Z ENDP		; AOAProtected::AOAprintString
_TEXT	ENDS
EXTRN	_CgetCursor32:NEAR
_TEXT	SEGMENT
_this$ = -4
?AOAgetCursor@AOAProtected@@QAEHXZ PROC NEAR		; AOAProtected::AOAgetCursor
; Line 148
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 149
	call	_CgetCursor32
; Line 150
	mov	esp, ebp
	pop	ebp
	ret	0
?AOAgetCursor@AOAProtected@@QAEHXZ ENDP			; AOAProtected::AOAgetCursor
_TEXT	ENDS
PUBLIC	?AOAgetClockTicks@AOAProtected@@QAEHPAI0@Z	; AOAProtected::AOAgetClockTicks
_TEXT	SEGMENT
_hword1$ = 8
_lword1$ = 12
_this$ = -12
_lowword$ = -4
_highword$ = -8
?AOAgetClockTicks@AOAProtected@@QAEHPAI0@Z PROC NEAR	; AOAProtected::AOAgetClockTicks
; Line 155
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 156
	mov	DWORD PTR _lowword$[ebp], 0
; Line 157
	mov	DWORD PTR _highword$[ebp], 0
; Line 160
	push	edx
; Line 161
	push	eax
; Line 162
	rdtsc
; Line 163
	mov	DWORD PTR _lowword$[ebp], eax
; Line 164
	mov	DWORD PTR _highword$[ebp], edx
; Line 165
	pop	eax
; Line 166
	pop	edx
; Line 168
	mov	eax, DWORD PTR _hword1$[ebp]
	mov	ecx, DWORD PTR _highword$[ebp]
	mov	DWORD PTR [eax], ecx
; Line 169
	mov	edx, DWORD PTR _lword1$[ebp]
	mov	eax, DWORD PTR _lowword$[ebp]
	mov	DWORD PTR [edx], eax
; Line 170
	xor	eax, eax
; Line 171
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	8
?AOAgetClockTicks@AOAProtected@@QAEHPAI0@Z ENDP		; AOAProtected::AOAgetClockTicks
_TEXT	ENDS
PUBLIC	?AOAClockTicksSubtract@AOAProtected@@QAEIIIIIPAI0@Z ; AOAProtected::AOAClockTicksSubtract
_TEXT	SEGMENT
_hword1$ = 8
_lword1$ = 12
_hword2$ = 16
_lword2$ = 20
_resulthigh$ = 24
_resultlow$ = 28
_this$ = -296
_retcode$ = -68
_i$ = -152
_j$ = -220
_k$ = -288
_index$ = -292
_ary1$ = -148
_ary2$ = -216
_result$ = -64
_imask$ = -72
_t1$ = -80
_t2$ = -84
_flag$ = -76
?AOAClockTicksSubtract@AOAProtected@@QAEIIIIIPAI0@Z PROC NEAR ; AOAProtected::AOAClockTicksSubtract
; Line 179
	push	ebp
	mov	ebp, esp
	sub	esp, 296				; 00000128H
	mov	DWORD PTR _this$[ebp], ecx
; Line 180
	mov	DWORD PTR _retcode$[ebp], 0
; Line 181
	mov	DWORD PTR _i$[ebp], 0
; Line 182
	mov	DWORD PTR _j$[ebp], 0
; Line 183
	mov	DWORD PTR _k$[ebp], 0
; Line 184
	mov	DWORD PTR _index$[ebp], 0
; Line 189
	mov	DWORD PTR _imask$[ebp], 0
; Line 190
	mov	DWORD PTR _t1$[ebp], 0
; Line 191
	mov	DWORD PTR _t2$[ebp], 0
; Line 192
	mov	DWORD PTR _flag$[ebp], 0
; Line 194
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L941
$L942:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L941:
	cmp	DWORD PTR _i$[ebp], 32			; 00000020H
	jge	SHORT $L943
; Line 196
	mov	ecx, DWORD PTR _i$[ebp]
	mov	BYTE PTR _ary1$[ebp+ecx], 48		; 00000030H
; Line 197
	mov	edx, DWORD PTR _i$[ebp]
	mov	BYTE PTR _ary2$[ebp+edx], 48		; 00000030H
; Line 198
	mov	eax, DWORD PTR _i$[ebp]
	mov	BYTE PTR _result$[ebp+eax], 48		; 00000030H
; Line 199
	mov	DWORD PTR _imask$[ebp], 0
; Line 200
	jmp	SHORT $L942
$L943:
; Line 203
	cmp	DWORD PTR _hword2$[ebp], 0
	jne	SHORT $L944
	cmp	DWORD PTR _hword1$[ebp], 0
	jne	SHORT $L944
; Line 206
	mov	ecx, DWORD PTR _resulthigh$[ebp]
	mov	DWORD PTR [ecx], 0
; Line 207
	mov	edx, DWORD PTR _lword2$[ebp]
	sub	edx, DWORD PTR _lword1$[ebp]
	mov	eax, DWORD PTR _resultlow$[ebp]
	mov	DWORD PTR [eax], edx
; Line 208
	xor	eax, eax
	jmp	$L927
$L944:
; Line 210
	mov	ecx, DWORD PTR _hword2$[ebp]
	cmp	ecx, DWORD PTR _hword1$[ebp]
	jne	SHORT $L946
; Line 213
	mov	edx, DWORD PTR _resulthigh$[ebp]
	mov	DWORD PTR [edx], 0
; Line 214
	mov	eax, DWORD PTR _lword2$[ebp]
	sub	eax, DWORD PTR _lword1$[ebp]
	mov	ecx, DWORD PTR _resultlow$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 215
	xor	eax, eax
	jmp	$L927
$L946:
; Line 217
	cmp	DWORD PTR _hword2$[ebp], 0
	jne	SHORT $L948
	cmp	DWORD PTR _hword1$[ebp], 0
	jbe	SHORT $L948
; Line 218
	or	eax, -1
	jmp	$L927
$L948:
; Line 223
	mov	DWORD PTR _imask$[ebp], -2147483648	; 80000000H
; Line 224
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L950
$L951:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L950:
	cmp	DWORD PTR _i$[ebp], 32			; 00000020H
	jge	SHORT $L952
; Line 226
	mov	eax, DWORD PTR _hword1$[ebp]
	and	eax, DWORD PTR _imask$[ebp]
	mov	DWORD PTR _t1$[ebp], eax
; Line 227
	mov	ecx, DWORD PTR _t1$[ebp]
	cmp	ecx, DWORD PTR _imask$[ebp]
	jne	SHORT $L953
; Line 228
	mov	edx, DWORD PTR _i$[ebp]
	mov	BYTE PTR _ary1$[ebp+edx], 49		; 00000031H
; Line 229
	jmp	SHORT $L954
$L953:
	mov	eax, DWORD PTR _i$[ebp]
	mov	BYTE PTR _ary1$[ebp+eax], 48		; 00000030H
$L954:
; Line 231
	mov	ecx, DWORD PTR _hword2$[ebp]
	and	ecx, DWORD PTR _imask$[ebp]
	mov	DWORD PTR _t2$[ebp], ecx
; Line 232
	mov	edx, DWORD PTR _t2$[ebp]
	cmp	edx, DWORD PTR _imask$[ebp]
	jne	SHORT $L955
; Line 233
	mov	eax, DWORD PTR _i$[ebp]
	mov	BYTE PTR _ary2$[ebp+eax], 49		; 00000031H
; Line 234
	jmp	SHORT $L956
$L955:
	mov	ecx, DWORD PTR _i$[ebp]
	mov	BYTE PTR _ary2$[ebp+ecx], 48		; 00000030H
$L956:
; Line 236
	mov	edx, DWORD PTR _imask$[ebp]
	shr	edx, 1
	mov	DWORD PTR _imask$[ebp], edx
; Line 237
	jmp	SHORT $L951
$L952:
; Line 238
	mov	DWORD PTR _imask$[ebp], -2147483648	; 80000000H
; Line 239
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L957
$L958:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L957:
	cmp	DWORD PTR _i$[ebp], 32			; 00000020H
	jge	SHORT $L959
; Line 241
	mov	ecx, DWORD PTR _lword1$[ebp]
	and	ecx, DWORD PTR _imask$[ebp]
	mov	DWORD PTR _t1$[ebp], ecx
; Line 242
	mov	edx, DWORD PTR _t1$[ebp]
	cmp	edx, DWORD PTR _imask$[ebp]
	jne	SHORT $L960
; Line 243
	mov	eax, DWORD PTR _i$[ebp]
	mov	BYTE PTR _ary1$[ebp+eax+32], 49		; 00000031H
; Line 244
	jmp	SHORT $L961
$L960:
	mov	ecx, DWORD PTR _i$[ebp]
	mov	BYTE PTR _ary1$[ebp+ecx+32], 48		; 00000030H
$L961:
; Line 246
	mov	edx, DWORD PTR _lword2$[ebp]
	and	edx, DWORD PTR _imask$[ebp]
	mov	DWORD PTR _t2$[ebp], edx
; Line 247
	mov	eax, DWORD PTR _t2$[ebp]
	cmp	eax, DWORD PTR _imask$[ebp]
	jne	SHORT $L962
; Line 248
	mov	ecx, DWORD PTR _i$[ebp]
	mov	BYTE PTR _ary2$[ebp+ecx+32], 49		; 00000031H
; Line 249
	jmp	SHORT $L963
$L962:
	mov	edx, DWORD PTR _i$[ebp]
	mov	BYTE PTR _ary2$[ebp+edx+32], 48		; 00000030H
$L963:
; Line 251
	mov	eax, DWORD PTR _imask$[ebp]
	shr	eax, 1
	mov	DWORD PTR _imask$[ebp], eax
; Line 252
	jmp	SHORT $L958
$L959:
; Line 263
	mov	DWORD PTR _index$[ebp], 63		; 0000003fH
; Line 264
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L964
$L965:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L964:
	cmp	DWORD PTR _i$[ebp], 64			; 00000040H
	jge	$L966
; Line 267
	mov	edx, DWORD PTR _index$[ebp]
	xor	eax, eax
	mov	al, BYTE PTR _ary2$[ebp+edx]
	cmp	eax, 48					; 00000030H
	jne	SHORT $L967
	mov	ecx, DWORD PTR _index$[ebp]
	xor	edx, edx
	mov	dl, BYTE PTR _ary1$[ebp+ecx]
	cmp	edx, 48					; 00000030H
	jne	SHORT $L967
; Line 268
	mov	eax, DWORD PTR _index$[ebp]
	mov	BYTE PTR _result$[ebp+eax], 48		; 00000030H
; Line 269
	jmp	$L976
$L967:
	mov	ecx, DWORD PTR _index$[ebp]
	xor	edx, edx
	mov	dl, BYTE PTR _ary2$[ebp+ecx]
	cmp	edx, 49					; 00000031H
	jne	SHORT $L969
	mov	eax, DWORD PTR _index$[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR _ary1$[ebp+eax]
	cmp	ecx, 48					; 00000030H
	jne	SHORT $L969
; Line 270
	mov	edx, DWORD PTR _index$[ebp]
	mov	BYTE PTR _result$[ebp+edx], 49		; 00000031H
; Line 271
	jmp	$L976
$L969:
	mov	eax, DWORD PTR _index$[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR _ary2$[ebp+eax]
	cmp	ecx, 49					; 00000031H
	jne	SHORT $L971
	mov	edx, DWORD PTR _index$[ebp]
	xor	eax, eax
	mov	al, BYTE PTR _ary1$[ebp+edx]
	cmp	eax, 49					; 00000031H
	jne	SHORT $L971
; Line 272
	mov	ecx, DWORD PTR _index$[ebp]
	mov	BYTE PTR _result$[ebp+ecx], 48		; 00000030H
; Line 273
	jmp	$L976
$L971:
	mov	edx, DWORD PTR _index$[ebp]
	xor	eax, eax
	mov	al, BYTE PTR _ary2$[ebp+edx]
	cmp	eax, 48					; 00000030H
	jne	$L976
	mov	ecx, DWORD PTR _index$[ebp]
	xor	edx, edx
	mov	dl, BYTE PTR _ary1$[ebp+ecx]
	cmp	edx, 49					; 00000031H
	jne	$L976
; Line 275
	mov	eax, DWORD PTR _index$[ebp]
	mov	BYTE PTR _result$[ebp+eax], 49		; 00000031H
; Line 276
	mov	DWORD PTR _flag$[ebp], 0
; Line 277
	mov	ecx, DWORD PTR _index$[ebp]
	sub	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
$L975:
; Line 278
	cmp	DWORD PTR _flag$[ebp], 0
	jne	SHORT $L976
; Line 280
	mov	edx, DWORD PTR _j$[ebp]
	xor	eax, eax
	mov	al, BYTE PTR _ary2$[ebp+edx]
	cmp	eax, 48					; 00000030H
	jne	SHORT $L977
; Line 282
	mov	ecx, DWORD PTR _j$[ebp]
	mov	BYTE PTR _ary2$[ebp+ecx], 49		; 00000031H
; Line 284
	jmp	SHORT $L978
$L977:
; Line 287
	mov	edx, DWORD PTR _j$[ebp]
	mov	BYTE PTR _ary2$[ebp+edx], 48		; 00000030H
; Line 288
	mov	DWORD PTR _flag$[ebp], 1
$L978:
; Line 290
	mov	eax, DWORD PTR _j$[ebp]
	sub	eax, 1
	mov	DWORD PTR _j$[ebp], eax
; Line 291
	cmp	DWORD PTR _j$[ebp], 0
	jge	SHORT $L979
; Line 292
	mov	DWORD PTR _flag$[ebp], 1
$L979:
; Line 293
	jmp	SHORT $L975
$L976:
; Line 295
	mov	ecx, DWORD PTR _index$[ebp]
	sub	ecx, 1
	mov	DWORD PTR _index$[ebp], ecx
; Line 296
	jmp	$L965
$L966:
; Line 300
	mov	edx, DWORD PTR _resulthigh$[ebp]
	mov	DWORD PTR [edx], 0
; Line 301
	mov	eax, DWORD PTR _resultlow$[ebp]
	mov	DWORD PTR [eax], 0
; Line 302
	mov	DWORD PTR _imask$[ebp], -2147483648	; 80000000H
; Line 303
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L980
$L981:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L980:
	cmp	DWORD PTR _i$[ebp], 32			; 00000020H
	jge	SHORT $L982
; Line 305
	mov	edx, DWORD PTR _i$[ebp]
	xor	eax, eax
	mov	al, BYTE PTR _result$[ebp+edx]
	cmp	eax, 49					; 00000031H
	jne	SHORT $L983
; Line 306
	mov	ecx, DWORD PTR _resulthigh$[ebp]
	mov	edx, DWORD PTR [ecx]
	or	edx, DWORD PTR _imask$[ebp]
	mov	eax, DWORD PTR _resulthigh$[ebp]
	mov	DWORD PTR [eax], edx
$L983:
; Line 307
	mov	ecx, DWORD PTR _imask$[ebp]
	shr	ecx, 1
	mov	DWORD PTR _imask$[ebp], ecx
; Line 308
	jmp	SHORT $L981
$L982:
; Line 309
	mov	DWORD PTR _imask$[ebp], -2147483648	; 80000000H
; Line 310
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L984
$L985:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L984:
	cmp	DWORD PTR _i$[ebp], 32			; 00000020H
	jge	SHORT $L986
; Line 312
	mov	eax, DWORD PTR _i$[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR _result$[ebp+eax+32]
	cmp	ecx, 49					; 00000031H
	jne	SHORT $L987
; Line 313
	mov	edx, DWORD PTR _resultlow$[ebp]
	mov	eax, DWORD PTR [edx]
	or	eax, DWORD PTR _imask$[ebp]
	mov	ecx, DWORD PTR _resultlow$[ebp]
	mov	DWORD PTR [ecx], eax
$L987:
; Line 314
	mov	edx, DWORD PTR _imask$[ebp]
	shr	edx, 1
	mov	DWORD PTR _imask$[ebp], edx
; Line 315
	jmp	SHORT $L985
$L986:
; Line 326
	xor	eax, eax
$L927:
; Line 327
	mov	esp, ebp
	pop	ebp
	ret	24					; 00000018H
?AOAClockTicksSubtract@AOAProtected@@QAEIIIIIPAI0@Z ENDP ; AOAProtected::AOAClockTicksSubtract
_TEXT	ENDS
PUBLIC	?AOAClockTicksAdd@AOAProtected@@QAEIIIIIPAI0@Z	; AOAProtected::AOAClockTicksAdd
_TEXT	SEGMENT
_hword1$ = 8
_lword1$ = 12
_hword2$ = 16
_lword2$ = 20
_resulthigh$ = 24
_resultlow$ = 28
_this$ = -300
_retcode$ = -68
_i$ = -152
_j$ = -220
_k$ = -292
_index$ = -296
_ary1$ = -148
_ary2$ = -216
_result$ = -64
_imask$ = -72
_t1$ = -80
_t2$ = -84
_flag$ = -76
_carry$ = -224
?AOAClockTicksAdd@AOAProtected@@QAEIIIIIPAI0@Z PROC NEAR ; AOAProtected::AOAClockTicksAdd
; Line 334
	push	ebp
	mov	ebp, esp
	sub	esp, 300				; 0000012cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 335
	mov	DWORD PTR _retcode$[ebp], 0
; Line 336
	mov	DWORD PTR _i$[ebp], 0
; Line 337
	mov	DWORD PTR _j$[ebp], 0
; Line 338
	mov	DWORD PTR _k$[ebp], 0
; Line 339
	mov	DWORD PTR _index$[ebp], 0
; Line 344
	mov	DWORD PTR _imask$[ebp], 0
; Line 345
	mov	DWORD PTR _t1$[ebp], 0
; Line 346
	mov	DWORD PTR _t2$[ebp], 0
; Line 347
	mov	DWORD PTR _flag$[ebp], 0
; Line 348
	mov	BYTE PTR _carry$[ebp], 48		; 00000030H
; Line 350
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1011
$L1012:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L1011:
	cmp	DWORD PTR _i$[ebp], 32			; 00000020H
	jge	SHORT $L1013
; Line 352
	mov	ecx, DWORD PTR _i$[ebp]
	mov	BYTE PTR _ary1$[ebp+ecx], 48		; 00000030H
; Line 353
	mov	edx, DWORD PTR _i$[ebp]
	mov	BYTE PTR _ary2$[ebp+edx], 48		; 00000030H
; Line 354
	mov	eax, DWORD PTR _i$[ebp]
	mov	BYTE PTR _result$[ebp+eax], 48		; 00000030H
; Line 355
	mov	DWORD PTR _imask$[ebp], 0
; Line 356
	jmp	SHORT $L1012
$L1013:
; Line 361
	mov	DWORD PTR _imask$[ebp], -2147483648	; 80000000H
; Line 362
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1014
$L1015:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L1014:
	cmp	DWORD PTR _i$[ebp], 32			; 00000020H
	jge	SHORT $L1016
; Line 364
	mov	edx, DWORD PTR _hword1$[ebp]
	and	edx, DWORD PTR _imask$[ebp]
	mov	DWORD PTR _t1$[ebp], edx
; Line 365
	mov	eax, DWORD PTR _t1$[ebp]
	cmp	eax, DWORD PTR _imask$[ebp]
	jne	SHORT $L1017
; Line 366
	mov	ecx, DWORD PTR _i$[ebp]
	mov	BYTE PTR _ary1$[ebp+ecx], 49		; 00000031H
; Line 367
	jmp	SHORT $L1018
$L1017:
	mov	edx, DWORD PTR _i$[ebp]
	mov	BYTE PTR _ary1$[ebp+edx], 48		; 00000030H
$L1018:
; Line 369
	mov	eax, DWORD PTR _hword2$[ebp]
	and	eax, DWORD PTR _imask$[ebp]
	mov	DWORD PTR _t2$[ebp], eax
; Line 370
	mov	ecx, DWORD PTR _t2$[ebp]
	cmp	ecx, DWORD PTR _imask$[ebp]
	jne	SHORT $L1019
; Line 371
	mov	edx, DWORD PTR _i$[ebp]
	mov	BYTE PTR _ary2$[ebp+edx], 49		; 00000031H
; Line 372
	jmp	SHORT $L1020
$L1019:
	mov	eax, DWORD PTR _i$[ebp]
	mov	BYTE PTR _ary2$[ebp+eax], 48		; 00000030H
$L1020:
; Line 374
	mov	ecx, DWORD PTR _imask$[ebp]
	shr	ecx, 1
	mov	DWORD PTR _imask$[ebp], ecx
; Line 375
	jmp	SHORT $L1015
$L1016:
; Line 376
	mov	DWORD PTR _imask$[ebp], -2147483648	; 80000000H
; Line 377
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1021
$L1022:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L1021:
	cmp	DWORD PTR _i$[ebp], 32			; 00000020H
	jge	SHORT $L1023
; Line 379
	mov	eax, DWORD PTR _lword1$[ebp]
	and	eax, DWORD PTR _imask$[ebp]
	mov	DWORD PTR _t1$[ebp], eax
; Line 380
	mov	ecx, DWORD PTR _t1$[ebp]
	cmp	ecx, DWORD PTR _imask$[ebp]
	jne	SHORT $L1024
; Line 381
	mov	edx, DWORD PTR _i$[ebp]
	mov	BYTE PTR _ary1$[ebp+edx+32], 49		; 00000031H
; Line 382
	jmp	SHORT $L1025
$L1024:
	mov	eax, DWORD PTR _i$[ebp]
	mov	BYTE PTR _ary1$[ebp+eax+32], 48		; 00000030H
$L1025:
; Line 384
	mov	ecx, DWORD PTR _lword2$[ebp]
	and	ecx, DWORD PTR _imask$[ebp]
	mov	DWORD PTR _t2$[ebp], ecx
; Line 385
	mov	edx, DWORD PTR _t2$[ebp]
	cmp	edx, DWORD PTR _imask$[ebp]
	jne	SHORT $L1026
; Line 386
	mov	eax, DWORD PTR _i$[ebp]
	mov	BYTE PTR _ary2$[ebp+eax+32], 49		; 00000031H
; Line 387
	jmp	SHORT $L1027
$L1026:
	mov	ecx, DWORD PTR _i$[ebp]
	mov	BYTE PTR _ary2$[ebp+ecx+32], 48		; 00000030H
$L1027:
; Line 389
	mov	edx, DWORD PTR _imask$[ebp]
	shr	edx, 1
	mov	DWORD PTR _imask$[ebp], edx
; Line 390
	jmp	SHORT $L1022
$L1023:
; Line 401
	mov	DWORD PTR _index$[ebp], 63		; 0000003fH
; Line 402
	mov	BYTE PTR _carry$[ebp], 48		; 00000030H
; Line 403
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1028
$L1029:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L1028:
	cmp	DWORD PTR _i$[ebp], 64			; 00000040H
	jge	$L1030
; Line 406
	mov	ecx, DWORD PTR _index$[ebp]
	xor	edx, edx
	mov	dl, BYTE PTR _ary2$[ebp+ecx]
	cmp	edx, 48					; 00000030H
	jne	SHORT $L1031
	mov	eax, DWORD PTR _index$[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR _ary1$[ebp+eax]
	cmp	ecx, 48					; 00000030H
	jne	SHORT $L1031
	mov	edx, DWORD PTR _carry$[ebp]
	and	edx, 255				; 000000ffH
	cmp	edx, 48					; 00000030H
	jne	SHORT $L1031
; Line 408
	mov	eax, DWORD PTR _index$[ebp]
	mov	BYTE PTR _result$[ebp+eax], 48		; 00000030H
; Line 409
	mov	BYTE PTR _carry$[ebp], 48		; 00000030H
; Line 411
	jmp	$L1045
$L1031:
	mov	ecx, DWORD PTR _index$[ebp]
	xor	edx, edx
	mov	dl, BYTE PTR _ary2$[ebp+ecx]
	cmp	edx, 48					; 00000030H
	jne	SHORT $L1033
	mov	eax, DWORD PTR _index$[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR _ary1$[ebp+eax]
	cmp	ecx, 48					; 00000030H
	jne	SHORT $L1033
	mov	edx, DWORD PTR _carry$[ebp]
	and	edx, 255				; 000000ffH
	cmp	edx, 49					; 00000031H
	jne	SHORT $L1033
; Line 413
	mov	eax, DWORD PTR _index$[ebp]
	mov	BYTE PTR _result$[ebp+eax], 49		; 00000031H
; Line 414
	mov	BYTE PTR _carry$[ebp], 48		; 00000030H
; Line 416
	jmp	$L1045
$L1033:
	mov	ecx, DWORD PTR _index$[ebp]
	xor	edx, edx
	mov	dl, BYTE PTR _ary2$[ebp+ecx]
	cmp	edx, 48					; 00000030H
	jne	SHORT $L1035
	mov	eax, DWORD PTR _index$[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR _ary1$[ebp+eax]
	cmp	ecx, 49					; 00000031H
	jne	SHORT $L1035
	mov	edx, DWORD PTR _carry$[ebp]
	and	edx, 255				; 000000ffH
	cmp	edx, 48					; 00000030H
	jne	SHORT $L1035
; Line 418
	mov	eax, DWORD PTR _index$[ebp]
	mov	BYTE PTR _result$[ebp+eax], 49		; 00000031H
; Line 419
	mov	BYTE PTR _carry$[ebp], 48		; 00000030H
; Line 421
	jmp	$L1045
$L1035:
	mov	ecx, DWORD PTR _index$[ebp]
	xor	edx, edx
	mov	dl, BYTE PTR _ary2$[ebp+ecx]
	cmp	edx, 48					; 00000030H
	jne	SHORT $L1037
	mov	eax, DWORD PTR _index$[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR _ary1$[ebp+eax]
	cmp	ecx, 49					; 00000031H
	jne	SHORT $L1037
	mov	edx, DWORD PTR _carry$[ebp]
	and	edx, 255				; 000000ffH
	cmp	edx, 49					; 00000031H
	jne	SHORT $L1037
; Line 423
	mov	eax, DWORD PTR _index$[ebp]
	mov	BYTE PTR _result$[ebp+eax], 48		; 00000030H
; Line 424
	mov	BYTE PTR _carry$[ebp], 49		; 00000031H
; Line 426
	jmp	$L1045
$L1037:
	mov	ecx, DWORD PTR _index$[ebp]
	xor	edx, edx
	mov	dl, BYTE PTR _ary2$[ebp+ecx]
	cmp	edx, 49					; 00000031H
	jne	SHORT $L1039
	mov	eax, DWORD PTR _index$[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR _ary1$[ebp+eax]
	cmp	ecx, 48					; 00000030H
	jne	SHORT $L1039
	mov	edx, DWORD PTR _carry$[ebp]
	and	edx, 255				; 000000ffH
	cmp	edx, 48					; 00000030H
	jne	SHORT $L1039
; Line 428
	mov	eax, DWORD PTR _index$[ebp]
	mov	BYTE PTR _result$[ebp+eax], 49		; 00000031H
; Line 429
	mov	BYTE PTR _carry$[ebp], 48		; 00000030H
; Line 431
	jmp	$L1045
$L1039:
	mov	ecx, DWORD PTR _index$[ebp]
	xor	edx, edx
	mov	dl, BYTE PTR _ary2$[ebp+ecx]
	cmp	edx, 49					; 00000031H
	jne	SHORT $L1041
	mov	eax, DWORD PTR _index$[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR _ary1$[ebp+eax]
	cmp	ecx, 48					; 00000030H
	jne	SHORT $L1041
	mov	edx, DWORD PTR _carry$[ebp]
	and	edx, 255				; 000000ffH
	cmp	edx, 49					; 00000031H
	jne	SHORT $L1041
; Line 433
	mov	eax, DWORD PTR _index$[ebp]
	mov	BYTE PTR _result$[ebp+eax], 48		; 00000030H
; Line 434
	mov	BYTE PTR _carry$[ebp], 49		; 00000031H
; Line 436
	jmp	$L1045
$L1041:
	mov	ecx, DWORD PTR _index$[ebp]
	xor	edx, edx
	mov	dl, BYTE PTR _ary2$[ebp+ecx]
	cmp	edx, 49					; 00000031H
	jne	SHORT $L1043
	mov	eax, DWORD PTR _index$[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR _ary1$[ebp+eax]
	cmp	ecx, 49					; 00000031H
	jne	SHORT $L1043
	mov	edx, DWORD PTR _carry$[ebp]
	and	edx, 255				; 000000ffH
	cmp	edx, 48					; 00000030H
	jne	SHORT $L1043
; Line 438
	mov	eax, DWORD PTR _index$[ebp]
	mov	BYTE PTR _result$[ebp+eax], 48		; 00000030H
; Line 439
	mov	BYTE PTR _carry$[ebp], 49		; 00000031H
; Line 441
	jmp	SHORT $L1045
$L1043:
	mov	ecx, DWORD PTR _index$[ebp]
	xor	edx, edx
	mov	dl, BYTE PTR _ary2$[ebp+ecx]
	cmp	edx, 49					; 00000031H
	jne	SHORT $L1045
	mov	eax, DWORD PTR _index$[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR _ary1$[ebp+eax]
	cmp	ecx, 49					; 00000031H
	jne	SHORT $L1045
	mov	edx, DWORD PTR _carry$[ebp]
	and	edx, 255				; 000000ffH
	cmp	edx, 49					; 00000031H
	jne	SHORT $L1045
; Line 443
	mov	eax, DWORD PTR _index$[ebp]
	mov	BYTE PTR _result$[ebp+eax], 49		; 00000031H
; Line 444
	mov	BYTE PTR _carry$[ebp], 49		; 00000031H
$L1045:
; Line 447
	mov	ecx, DWORD PTR _index$[ebp]
	sub	ecx, 1
	mov	DWORD PTR _index$[ebp], ecx
; Line 448
	jmp	$L1029
$L1030:
; Line 452
	mov	edx, DWORD PTR _resulthigh$[ebp]
	mov	DWORD PTR [edx], 0
; Line 453
	mov	eax, DWORD PTR _resultlow$[ebp]
	mov	DWORD PTR [eax], 0
; Line 454
	mov	DWORD PTR _imask$[ebp], -2147483648	; 80000000H
; Line 455
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1046
$L1047:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L1046:
	cmp	DWORD PTR _i$[ebp], 32			; 00000020H
	jge	SHORT $L1048
; Line 457
	mov	edx, DWORD PTR _i$[ebp]
	xor	eax, eax
	mov	al, BYTE PTR _result$[ebp+edx]
	cmp	eax, 49					; 00000031H
	jne	SHORT $L1049
; Line 458
	mov	ecx, DWORD PTR _resulthigh$[ebp]
	mov	edx, DWORD PTR [ecx]
	or	edx, DWORD PTR _imask$[ebp]
	mov	eax, DWORD PTR _resulthigh$[ebp]
	mov	DWORD PTR [eax], edx
$L1049:
; Line 459
	mov	ecx, DWORD PTR _imask$[ebp]
	shr	ecx, 1
	mov	DWORD PTR _imask$[ebp], ecx
; Line 460
	jmp	SHORT $L1047
$L1048:
; Line 461
	mov	DWORD PTR _imask$[ebp], -2147483648	; 80000000H
; Line 462
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1050
$L1051:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L1050:
	cmp	DWORD PTR _i$[ebp], 32			; 00000020H
	jge	SHORT $L1052
; Line 464
	mov	eax, DWORD PTR _i$[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR _result$[ebp+eax+32]
	cmp	ecx, 49					; 00000031H
	jne	SHORT $L1053
; Line 465
	mov	edx, DWORD PTR _resultlow$[ebp]
	mov	eax, DWORD PTR [edx]
	or	eax, DWORD PTR _imask$[ebp]
	mov	ecx, DWORD PTR _resultlow$[ebp]
	mov	DWORD PTR [ecx], eax
$L1053:
; Line 466
	mov	edx, DWORD PTR _imask$[ebp]
	shr	edx, 1
	mov	DWORD PTR _imask$[ebp], edx
; Line 467
	jmp	SHORT $L1051
$L1052:
; Line 469
	xor	eax, eax
; Line 470
	mov	esp, ebp
	pop	ebp
	ret	24					; 00000018H
?AOAClockTicksAdd@AOAProtected@@QAEIIIIIPAI0@Z ENDP	; AOAProtected::AOAClockTicksAdd
_TEXT	ENDS
PUBLIC	?AOAgetTimer@AOAProtected@@QAEJXZ		; AOAProtected::AOAgetTimer
EXTRN	_CgetTimer32:NEAR
_TEXT	SEGMENT
_this$ = -4
?AOAgetTimer@AOAProtected@@QAEJXZ PROC NEAR		; AOAProtected::AOAgetTimer
; Line 472
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 473
	call	_CgetTimer32
; Line 475
	mov	esp, ebp
	pop	ebp
	ret	0
?AOAgetTimer@AOAProtected@@QAEJXZ ENDP			; AOAProtected::AOAgetTimer
_TEXT	ENDS
PUBLIC	?AOAsetCursor@AOAProtected@@QAEHH@Z		; AOAProtected::AOAsetCursor
EXTRN	_CsetCursor32:NEAR
_TEXT	SEGMENT
_pos$ = 8
_this$ = -4
?AOAsetCursor@AOAProtected@@QAEHH@Z PROC NEAR		; AOAProtected::AOAsetCursor
; Line 478
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 479
	mov	eax, DWORD PTR _pos$[ebp]
	push	eax
	call	_CsetCursor32
	add	esp, 4
; Line 480
	mov	esp, ebp
	pop	ebp
	ret	4
?AOAsetCursor@AOAProtected@@QAEHH@Z ENDP		; AOAProtected::AOAsetCursor
_TEXT	ENDS
PUBLIC	?AOAcleanScreen@AOAProtected@@QAEHXZ		; AOAProtected::AOAcleanScreen
EXTRN	_CcleanScreen32:NEAR
_TEXT	SEGMENT
_this$ = -4
?AOAcleanScreen@AOAProtected@@QAEHXZ PROC NEAR		; AOAProtected::AOAcleanScreen
; Line 483
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 484
	call	_CcleanScreen32
; Line 485
	mov	esp, ebp
	pop	ebp
	ret	0
?AOAcleanScreen@AOAProtected@@QAEHXZ ENDP		; AOAProtected::AOAcleanScreen
_TEXT	ENDS
PUBLIC	?AOAscrollUp@AOAProtected@@QAEHXZ		; AOAProtected::AOAscrollUp
EXTRN	_CscrollUp32:NEAR
_TEXT	SEGMENT
_this$ = -4
?AOAscrollUp@AOAProtected@@QAEHXZ PROC NEAR		; AOAProtected::AOAscrollUp
; Line 488
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 489
	call	_CscrollUp32
; Line 490
	mov	esp, ebp
	pop	ebp
	ret	0
?AOAscrollUp@AOAProtected@@QAEHXZ ENDP			; AOAProtected::AOAscrollUp
_TEXT	ENDS
PUBLIC	?AOAprintCharacter@AOAProtected@@QAEHDHPAH@Z	; AOAProtected::AOAprintCharacter
EXTRN	_CprintChar32:NEAR
_TEXT	SEGMENT
_value$ = 8
_pos$ = 12
_pindex$ = 16
_this$ = -12
_retcode$ = -8
_pi$ = -4
?AOAprintCharacter@AOAProtected@@QAEHDHPAH@Z PROC NEAR	; AOAProtected::AOAprintCharacter
; Line 498
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 504
	mov	eax, DWORD PTR _pindex$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _pi$[ebp], ecx
; Line 505
	mov	edx, DWORD PTR _pos$[ebp]
	push	edx
	mov	al, BYTE PTR _value$[ebp]
	push	eax
	call	_CprintChar32
	add	esp, 8
	mov	DWORD PTR _retcode$[ebp], eax
; Line 506
	mov	ecx, DWORD PTR _pi$[ebp]
	lea	edx, DWORD PTR [ecx+ecx+480]
	push	edx
	push	80					; 00000050H
	call	_CprintChar32
	add	esp, 8
	mov	DWORD PTR _retcode$[ebp], eax
; Line 507
	mov	eax, DWORD PTR _pindex$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, 1
	mov	edx, DWORD PTR _pindex$[ebp]
	mov	DWORD PTR [edx], ecx
; Line 510
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 511
	mov	esp, ebp
	pop	ebp
	ret	12					; 0000000cH
?AOAprintCharacter@AOAProtected@@QAEHDHPAH@Z ENDP	; AOAProtected::AOAprintCharacter
_value$ = 8
_pos$ = 12
_this$ = -8
_retcode$ = -4
?AOAprintCharacter@AOAProtected@@QAEHDH@Z PROC NEAR	; AOAProtected::AOAprintCharacter
; Line 520
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 523
	cmp	DWORD PTR _pos$[ebp], 0
	jl	SHORT $L1082
	cmp	DWORD PTR _pos$[ebp], 4000		; 00000fa0H
	jl	SHORT $L1081
$L1082:
; Line 525
	or	eax, -1
	jmp	SHORT $L1079
$L1081:
; Line 529
	mov	eax, DWORD PTR _pos$[ebp]
	push	eax
	mov	cl, BYTE PTR _value$[ebp]
	push	ecx
	call	_CprintChar32
	add	esp, 8
	mov	DWORD PTR _retcode$[ebp], eax
; Line 532
	mov	eax, DWORD PTR _retcode$[ebp]
$L1079:
; Line 533
	mov	esp, ebp
	pop	ebp
	ret	8
?AOAprintCharacter@AOAProtected@@QAEHDH@Z ENDP		; AOAProtected::AOAprintCharacter
_TEXT	ENDS
PUBLIC	?AOAprintCharacter@AOAProtected@@QAEHD@Z	; AOAProtected::AOAprintCharacter
_TEXT	SEGMENT
_value$ = 8
_this$ = -12
_pos$ = -8
_retcode$ = -4
?AOAprintCharacter@AOAProtected@@QAEHD@Z PROC NEAR	; AOAProtected::AOAprintCharacter
; Line 537
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 542
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCursor@AOAProtected@@QAEHXZ	; AOAProtected::AOAgetCursor
	mov	DWORD PTR _pos$[ebp], eax
; Line 543
	mov	eax, DWORD PTR _pos$[ebp]
	push	eax
	mov	cl, BYTE PTR _value$[ebp]
	push	ecx
	call	_CprintChar32
	add	esp, 8
	mov	DWORD PTR _retcode$[ebp], eax
; Line 545
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 546
	mov	esp, ebp
	pop	ebp
	ret	4
?AOAprintCharacter@AOAProtected@@QAEHD@Z ENDP		; AOAProtected::AOAprintCharacter
_TEXT	ENDS
PUBLIC	?AOAprintSpace@AOAProtected@@QAEHHH@Z		; AOAProtected::AOAprintSpace
_TEXT	SEGMENT
_count$ = 8
_pos$ = 12
_this$ = -16
_blank$ = -4
_base$ = -12
_i$ = -8
?AOAprintSpace@AOAProtected@@QAEHHH@Z PROC NEAR		; AOAProtected::AOAprintSpace
; Line 548
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	mov	DWORD PTR _this$[ebp], ecx
; Line 549
	mov	BYTE PTR _blank$[ebp], 32		; 00000020H
; Line 552
	mov	eax, DWORD PTR _pos$[ebp]
	mov	DWORD PTR _base$[ebp], eax
; Line 553
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1097
$L1098:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L1097:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _count$[ebp]
	jge	SHORT $L1099
; Line 554
	mov	eax, DWORD PTR _base$[ebp]
	push	eax
	mov	cl, BYTE PTR _blank$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintCharacter@AOAProtected@@QAEHDH@Z ; AOAProtected::AOAprintCharacter
; Line 555
	mov	edx, DWORD PTR _base$[ebp]
	add	edx, 2
	mov	DWORD PTR _base$[ebp], edx
; Line 556
	jmp	SHORT $L1098
$L1099:
; Line 558
	xor	eax, eax
; Line 559
	mov	esp, ebp
	pop	ebp
	ret	8
?AOAprintSpace@AOAProtected@@QAEHHH@Z ENDP		; AOAProtected::AOAprintSpace
_TEXT	ENDS
PUBLIC	?AOAprintSpace@AOAProtected@@QAEHH@Z		; AOAProtected::AOAprintSpace
_TEXT	SEGMENT
_count$ = 8
_this$ = -16
_blank$ = -4
_base$ = -12
_i$ = -8
?AOAprintSpace@AOAProtected@@QAEHH@Z PROC NEAR		; AOAProtected::AOAprintSpace
; Line 561
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	mov	DWORD PTR _this$[ebp], ecx
; Line 562
	mov	BYTE PTR _blank$[ebp], 32		; 00000020H
; Line 565
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCursor@AOAProtected@@QAEHXZ	; AOAProtected::AOAgetCursor
	mov	DWORD PTR _base$[ebp], eax
; Line 566
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1107
$L1108:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L1107:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _count$[ebp]
	jge	SHORT $L1109
; Line 567
	mov	edx, DWORD PTR _base$[ebp]
	push	edx
	mov	al, BYTE PTR _blank$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintCharacter@AOAProtected@@QAEHDH@Z ; AOAProtected::AOAprintCharacter
; Line 568
	mov	ecx, DWORD PTR _base$[ebp]
	add	ecx, 1
	mov	DWORD PTR _base$[ebp], ecx
; Line 569
	jmp	SHORT $L1108
$L1109:
; Line 571
	xor	eax, eax
; Line 572
	mov	esp, ebp
	pop	ebp
	ret	4
?AOAprintSpace@AOAProtected@@QAEHH@Z ENDP		; AOAProtected::AOAprintSpace
_TEXT	ENDS
PUBLIC	?AOAskipLine@AOAProtected@@QAEHH@Z		; AOAProtected::AOAskipLine
EXTRN	_CnewLine32:NEAR
_TEXT	SEGMENT
_lines$ = 8
_this$ = -8
_i$ = -4
?AOAskipLine@AOAProtected@@QAEHH@Z PROC NEAR		; AOAProtected::AOAskipLine
; Line 574
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 575
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1115
$L1116:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L1115:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _lines$[ebp]
	jge	SHORT $L1117
; Line 576
	call	_CnewLine32
	jmp	SHORT $L1116
$L1117:
; Line 578
	xor	eax, eax
; Line 579
	mov	esp, ebp
	pop	ebp
	ret	4
?AOAskipLine@AOAProtected@@QAEHH@Z ENDP			; AOAProtected::AOAskipLine
_TEXT	ENDS
PUBLIC	?AOAprintDecimal@AOAProtected@@QAEHHH@Z		; AOAProtected::AOAprintDecimal
EXTRN	_CprintDec32:NEAR
_TEXT	SEGMENT
_value$ = 8
_pos$ = 12
_this$ = -4
?AOAprintDecimal@AOAProtected@@QAEHHH@Z PROC NEAR	; AOAProtected::AOAprintDecimal
; Line 581
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 582
	mov	eax, DWORD PTR _pos$[ebp]
	push	eax
	mov	ecx, DWORD PTR _value$[ebp]
	push	ecx
	call	_CprintDec32
	add	esp, 8
; Line 583
	mov	esp, ebp
	pop	ebp
	ret	8
?AOAprintDecimal@AOAProtected@@QAEHHH@Z ENDP		; AOAProtected::AOAprintDecimal
_TEXT	ENDS
PUBLIC	?AOAprintDecimal@AOAProtected@@QAEHH@Z		; AOAProtected::AOAprintDecimal
_TEXT	SEGMENT
_value$ = 8
_this$ = -12
_i$ = -4
_pos$ = -8
?AOAprintDecimal@AOAProtected@@QAEHH@Z PROC NEAR	; AOAProtected::AOAprintDecimal
; Line 585
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 586
	mov	DWORD PTR _i$[ebp], 0
; Line 588
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCursor@AOAProtected@@QAEHXZ	; AOAProtected::AOAgetCursor
	mov	DWORD PTR _pos$[ebp], eax
; Line 589
	mov	eax, DWORD PTR _pos$[ebp]
	push	eax
	mov	ecx, DWORD PTR _value$[ebp]
	push	ecx
	call	_CprintDec32
	add	esp, 8
	mov	DWORD PTR _i$[ebp], eax
; Line 591
	mov	eax, DWORD PTR _i$[ebp]
; Line 592
	mov	esp, ebp
	pop	ebp
	ret	4
?AOAprintDecimal@AOAProtected@@QAEHH@Z ENDP		; AOAProtected::AOAprintDecimal
_TEXT	ENDS
PUBLIC	?AOAPrintText@AOAProtected@@QAEXPADH@Z		; AOAProtected::AOAPrintText
_DATA	SEGMENT
	ORG $+3
$SG1144	DB	'line no is beyond the limit (0 to 4000)', 00H
_DATA	ENDS
_TEXT	SEGMENT
_value$ = 8
_pos$ = 12
_this$ = -52
_i$ = -44
_retcode$ = -12
_c$ = -36
_maskv$ = -8
_datav$ = -48
_indexv$ = -4
_positionv$ = -40
_HexTable$ = -32
?AOAprintHex@AOAProtected@@QAEHJH@Z PROC NEAR		; AOAProtected::AOAprintHex
; Line 599
	push	ebp
	mov	ebp, esp
	sub	esp, 52					; 00000034H
	mov	DWORD PTR _this$[ebp], ecx
; Line 600
	mov	DWORD PTR _i$[ebp], 0
; Line 603
	mov	DWORD PTR _maskv$[ebp], -268435456	; f0000000H
; Line 604
	mov	DWORD PTR _datav$[ebp], 0
; Line 605
	mov	DWORD PTR _indexv$[ebp], 0
; Line 606
	mov	DWORD PTR _positionv$[ebp], 0
; Line 607
	mov	BYTE PTR _HexTable$[ebp], 48		; 00000030H
	mov	BYTE PTR _HexTable$[ebp+1], 49		; 00000031H
	mov	BYTE PTR _HexTable$[ebp+2], 50		; 00000032H
	mov	BYTE PTR _HexTable$[ebp+3], 51		; 00000033H
	mov	BYTE PTR _HexTable$[ebp+4], 52		; 00000034H
	mov	BYTE PTR _HexTable$[ebp+5], 53		; 00000035H
	mov	BYTE PTR _HexTable$[ebp+6], 54		; 00000036H
	mov	BYTE PTR _HexTable$[ebp+7], 55		; 00000037H
	mov	BYTE PTR _HexTable$[ebp+8], 56		; 00000038H
	mov	BYTE PTR _HexTable$[ebp+9], 57		; 00000039H
; Line 608
	mov	BYTE PTR _HexTable$[ebp+10], 65		; 00000041H
	mov	BYTE PTR _HexTable$[ebp+11], 66		; 00000042H
	mov	BYTE PTR _HexTable$[ebp+12], 67		; 00000043H
	mov	BYTE PTR _HexTable$[ebp+13], 68		; 00000044H
	mov	BYTE PTR _HexTable$[ebp+14], 69		; 00000045H
	mov	BYTE PTR _HexTable$[ebp+15], 70		; 00000046H
	mov	BYTE PTR _HexTable$[ebp+16], 0
; Line 612
	mov	eax, DWORD PTR _value$[ebp]
	mov	DWORD PTR _datav$[ebp], eax
; Line 613
	mov	ecx, DWORD PTR _pos$[ebp]
	mov	DWORD PTR _positionv$[ebp], ecx
; Line 614
	cmp	DWORD PTR _pos$[ebp], 0
	jl	SHORT $L1143
	cmp	DWORD PTR _pos$[ebp], 4000		; 00000fa0H
	jl	SHORT $L1142
$L1143:
; Line 616
	push	3840					; 00000f00H
	push	OFFSET FLAT:$SG1144
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 617
	or	eax, -1
	jmp	SHORT $L1133
$L1142:
; Line 619
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1145
$L1146:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L1145:
	cmp	DWORD PTR _i$[ebp], 8
	jge	SHORT $L1147
; Line 621
	mov	eax, DWORD PTR _datav$[ebp]
	and	eax, DWORD PTR _maskv$[ebp]
	mov	DWORD PTR _indexv$[ebp], eax
; Line 622
	mov	ecx, DWORD PTR _datav$[ebp]
	shr	ecx, 28					; 0000001cH
	mov	DWORD PTR _indexv$[ebp], ecx
; Line 623
	mov	edx, DWORD PTR _indexv$[ebp]
	mov	al, BYTE PTR _HexTable$[ebp+edx]
	mov	BYTE PTR _c$[ebp], al
; Line 624
	mov	ecx, DWORD PTR _positionv$[ebp]
	push	ecx
	mov	dl, BYTE PTR _c$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintCharacter@AOAProtected@@QAEHDH@Z ; AOAProtected::AOAprintCharacter
	mov	DWORD PTR _retcode$[ebp], eax
; Line 625
	mov	eax, DWORD PTR _positionv$[ebp]
	add	eax, 2
	mov	DWORD PTR _positionv$[ebp], eax
; Line 626
	mov	ecx, DWORD PTR _datav$[ebp]
	shl	ecx, 4
	mov	DWORD PTR _datav$[ebp], ecx
; Line 627
	jmp	SHORT $L1146
$L1147:
; Line 629
	mov	eax, DWORD PTR _retcode$[ebp]
$L1133:
; Line 630
	mov	esp, ebp
	pop	ebp
	ret	8
?AOAprintHex@AOAProtected@@QAEHJH@Z ENDP		; AOAProtected::AOAprintHex
_TEXT	ENDS
PUBLIC	?AOAprintHex@AOAProtected@@QAEHPADH@Z		; AOAProtected::AOAprintHex
_DATA	SEGMENT
$SG1166	DB	'line no is beyond the limit (0 to 4000)', 00H
_DATA	ENDS
_TEXT	SEGMENT
_value$ = 8
_pos$ = 12
_this$ = -60
_i$ = -52
_retcode$ = -12
_c$ = -36
_maskv$ = -8
_datav$ = -56
_p1$ = -44
_p2$ = -48
_indexv$ = -4
_positionv$ = -40
_HexTable$ = -32
?AOAprintHex@AOAProtected@@QAEHPADH@Z PROC NEAR		; AOAProtected::AOAprintHex
; Line 637
	push	ebp
	mov	ebp, esp
	sub	esp, 60					; 0000003cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 638
	mov	DWORD PTR _i$[ebp], 0
; Line 641
	mov	DWORD PTR _maskv$[ebp], -268435456	; f0000000H
; Line 642
	mov	DWORD PTR _datav$[ebp], 0
; Line 645
	mov	DWORD PTR _indexv$[ebp], 0
; Line 646
	mov	DWORD PTR _positionv$[ebp], 0
; Line 647
	mov	BYTE PTR _HexTable$[ebp], 48		; 00000030H
	mov	BYTE PTR _HexTable$[ebp+1], 49		; 00000031H
	mov	BYTE PTR _HexTable$[ebp+2], 50		; 00000032H
	mov	BYTE PTR _HexTable$[ebp+3], 51		; 00000033H
	mov	BYTE PTR _HexTable$[ebp+4], 52		; 00000034H
	mov	BYTE PTR _HexTable$[ebp+5], 53		; 00000035H
	mov	BYTE PTR _HexTable$[ebp+6], 54		; 00000036H
	mov	BYTE PTR _HexTable$[ebp+7], 55		; 00000037H
	mov	BYTE PTR _HexTable$[ebp+8], 56		; 00000038H
	mov	BYTE PTR _HexTable$[ebp+9], 57		; 00000039H
; Line 648
	mov	BYTE PTR _HexTable$[ebp+10], 65		; 00000041H
	mov	BYTE PTR _HexTable$[ebp+11], 66		; 00000042H
	mov	BYTE PTR _HexTable$[ebp+12], 67		; 00000043H
	mov	BYTE PTR _HexTable$[ebp+13], 68		; 00000044H
	mov	BYTE PTR _HexTable$[ebp+14], 69		; 00000045H
	mov	BYTE PTR _HexTable$[ebp+15], 70		; 00000046H
	mov	BYTE PTR _HexTable$[ebp+16], 0
; Line 649
	lea	eax, DWORD PTR _p2$[ebp]
	mov	DWORD PTR _p1$[ebp], eax
; Line 653
	mov	ecx, DWORD PTR _value$[ebp]
	mov	DWORD PTR _p1$[ebp], ecx
; Line 654
	mov	edx, DWORD PTR _p1$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR _datav$[ebp], eax
; Line 656
	mov	ecx, DWORD PTR _pos$[ebp]
	mov	DWORD PTR _positionv$[ebp], ecx
; Line 657
	cmp	DWORD PTR _pos$[ebp], 0
	jl	SHORT $L1165
	cmp	DWORD PTR _pos$[ebp], 4000		; 00000fa0H
	jl	SHORT $L1164
$L1165:
; Line 659
	push	3840					; 00000f00H
	push	OFFSET FLAT:$SG1166
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 660
	or	eax, -1
	jmp	SHORT $L1152
$L1164:
; Line 662
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1167
$L1168:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L1167:
	cmp	DWORD PTR _i$[ebp], 8
	jge	SHORT $L1169
; Line 664
	mov	eax, DWORD PTR _datav$[ebp]
	and	eax, DWORD PTR _maskv$[ebp]
	mov	DWORD PTR _indexv$[ebp], eax
; Line 665
	mov	ecx, DWORD PTR _datav$[ebp]
	shr	ecx, 28					; 0000001cH
	mov	DWORD PTR _indexv$[ebp], ecx
; Line 666
	mov	edx, DWORD PTR _indexv$[ebp]
	mov	al, BYTE PTR _HexTable$[ebp+edx]
	mov	BYTE PTR _c$[ebp], al
; Line 667
	mov	ecx, DWORD PTR _positionv$[ebp]
	push	ecx
	mov	dl, BYTE PTR _c$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintCharacter@AOAProtected@@QAEHDH@Z ; AOAProtected::AOAprintCharacter
	mov	DWORD PTR _retcode$[ebp], eax
; Line 668
	mov	eax, DWORD PTR _positionv$[ebp]
	add	eax, 2
	mov	DWORD PTR _positionv$[ebp], eax
; Line 669
	mov	ecx, DWORD PTR _datav$[ebp]
	shl	ecx, 4
	mov	DWORD PTR _datav$[ebp], ecx
; Line 670
	jmp	SHORT $L1168
$L1169:
; Line 672
	mov	eax, DWORD PTR _retcode$[ebp]
$L1152:
; Line 673
	mov	esp, ebp
	pop	ebp
	ret	8
?AOAprintHex@AOAProtected@@QAEHPADH@Z ENDP		; AOAProtected::AOAprintHex
_TEXT	ENDS
PUBLIC	?AOAclearNTFlag@AOAProtected@@QAEHXZ		; AOAProtected::AOAclearNTFlag
EXTRN	_CclearNTFlag:NEAR
_TEXT	SEGMENT
_this$ = -8
_i$ = -4
?AOAclearNTFlag@AOAProtected@@QAEHXZ PROC NEAR		; AOAProtected::AOAclearNTFlag
; Line 675
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 676
	mov	DWORD PTR _i$[ebp], 0
; Line 677
	call	_CclearNTFlag
	mov	DWORD PTR _i$[ebp], eax
; Line 678
	mov	eax, DWORD PTR _i$[ebp]
; Line 679
	mov	esp, ebp
	pop	ebp
	ret	0
?AOAclearNTFlag@AOAProtected@@QAEHXZ ENDP		; AOAProtected::AOAclearNTFlag
_TEXT	ENDS
PUBLIC	?AOAprintFlags@AOAProtected@@QAEHH@Z		; AOAProtected::AOAprintFlags
EXTRN	_CprintFlags32:NEAR
_TEXT	SEGMENT
_pos$ = 8
_this$ = -8
_i$ = -4
?AOAprintFlags@AOAProtected@@QAEHH@Z PROC NEAR		; AOAProtected::AOAprintFlags
; Line 681
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 682
	mov	DWORD PTR _i$[ebp], 0
; Line 683
	mov	eax, DWORD PTR _pos$[ebp]
	push	eax
	call	_CprintFlags32
	add	esp, 4
	mov	DWORD PTR _i$[ebp], eax
; Line 684
	mov	eax, DWORD PTR _i$[ebp]
; Line 685
	mov	esp, ebp
	pop	ebp
	ret	4
?AOAprintFlags@AOAProtected@@QAEHH@Z ENDP		; AOAProtected::AOAprintFlags
_TEXT	ENDS
PUBLIC	?AOAgetFlags@AOAProtected@@QAEHXZ		; AOAProtected::AOAgetFlags
_TEXT	SEGMENT
_this$ = -8
_i$ = -4
?AOAgetFlags@AOAProtected@@QAEHXZ PROC NEAR		; AOAProtected::AOAgetFlags
; Line 687
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 688
	mov	DWORD PTR _i$[ebp], 0
; Line 690
	cli
; Line 691
	push	eax
; Line 692
	pushfd
; Line 693
	pop	eax
; Line 694
	mov	DWORD PTR _i$[ebp], eax
; Line 695
	pop	eax
; Line 696
	sti
; Line 698
	mov	eax, DWORD PTR _i$[ebp]
; Line 699
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	0
?AOAgetFlags@AOAProtected@@QAEHXZ ENDP			; AOAProtected::AOAgetFlags
_TEXT	ENDS
PUBLIC	?AOAgetSharedMemChar@AOAProtected@@QAEDHH@Z	; AOAProtected::AOAgetSharedMemChar
EXTRN	_CgetSharedMemChar32:NEAR
_TEXT	SEGMENT
_index$ = 8
_base$ = 12
_this$ = -4
?AOAgetSharedMemChar@AOAProtected@@QAEDHH@Z PROC NEAR	; AOAProtected::AOAgetSharedMemChar
; Line 701
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 702
	mov	eax, DWORD PTR _base$[ebp]
	push	eax
	mov	ecx, DWORD PTR _index$[ebp]
	push	ecx
	call	_CgetSharedMemChar32
	add	esp, 8
; Line 703
	mov	esp, ebp
	pop	ebp
	ret	8
?AOAgetSharedMemChar@AOAProtected@@QAEDHH@Z ENDP	; AOAProtected::AOAgetSharedMemChar
_TEXT	ENDS
PUBLIC	?AOAgetSharedMem@AOAProtected@@QAEJH@Z		; AOAProtected::AOAgetSharedMem
PUBLIC	?AOAreadRTC@AOAProtected@@QAEHXZ		; AOAProtected::AOAreadRTC
PUBLIC	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z		; AOAProtected::AOAsetSharedMem
EXTRN	_CreadRTC:NEAR
_TEXT	SEGMENT
_this$ = -8
_retcode$ = -4
?AOAreadRTC@AOAProtected@@QAEHXZ PROC NEAR		; AOAProtected::AOAreadRTC
; Line 707
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 708
	mov	DWORD PTR _retcode$[ebp], 0
; Line 709
	push	0
	push	288					; 00000120H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 710
	push	0
	push	292					; 00000124H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 711
	push	0
	push	296					; 00000128H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 712
	push	1
	push	304					; 00000130H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 713
	call	_CreadRTC
	mov	DWORD PTR _retcode$[ebp], eax
; Line 714
	push	0
	push	304					; 00000130H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 715
	push	288					; 00000120H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetSharedMem@AOAProtected@@QAEJH@Z	; AOAProtected::AOAgetSharedMem
	mov	DWORD PTR _retcode$[ebp], eax
; Line 716
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 717
	mov	esp, ebp
	pop	ebp
	ret	0
?AOAreadRTC@AOAProtected@@QAEHXZ ENDP			; AOAProtected::AOAreadRTC
_TEXT	ENDS
PUBLIC	?AOAreadDATE@AOAProtected@@QAEHXZ		; AOAProtected::AOAreadDATE
EXTRN	_CreadDATE:NEAR
_TEXT	SEGMENT
_this$ = -8
_retcode$ = -4
?AOAreadDATE@AOAProtected@@QAEHXZ PROC NEAR		; AOAProtected::AOAreadDATE
; Line 719
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 720
	mov	DWORD PTR _retcode$[ebp], 0
; Line 721
	push	0
	push	288					; 00000120H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 722
	push	0
	push	292					; 00000124H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 723
	push	0
	push	296					; 00000128H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 724
	push	2
	push	304					; 00000130H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 725
	call	_CreadDATE
	mov	DWORD PTR _retcode$[ebp], eax
; Line 726
	push	0
	push	304					; 00000130H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 727
	push	292					; 00000124H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetSharedMem@AOAProtected@@QAEJH@Z	; AOAProtected::AOAgetSharedMem
	mov	DWORD PTR _retcode$[ebp], eax
; Line 728
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 729
	mov	esp, ebp
	pop	ebp
	ret	0
?AOAreadDATE@AOAProtected@@QAEHXZ ENDP			; AOAProtected::AOAreadDATE
_TEXT	ENDS
PUBLIC	?AOAUnixTime@AOAProtected@@QAEKII@Z		; AOAProtected::AOAUnixTime
PUBLIC	?AOAconvertCharToInt@AOAProtected@@QAEIH@Z	; AOAProtected::AOAconvertCharToInt
_TEXT	SEGMENT
_rtc$ = 8
_date$ = 12
_this$ = -44
_b$ = -8
_day$ = -24
_mon$ = -20
_year$ = -32
_sec$ = -28
_min$ = -40
_hour$ = -36
_v1$ = -4
_c1$ = -12
_c2$ = -16
?AOAUnixTime@AOAProtected@@QAEKII@Z PROC NEAR		; AOAProtected::AOAUnixTime
; Line 731
	push	ebp
	mov	ebp, esp
	sub	esp, 44					; 0000002cH
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 734
	mov	DWORD PTR _b$[ebp], 0
; Line 736
	mov	DWORD PTR _v1$[ebp], 0
; Line 737
	mov	DWORD PTR _c1$[ebp], 0
; Line 738
	mov	DWORD PTR _c2$[ebp], 0
; Line 740
	mov	DWORD PTR _day$[ebp], 0
; Line 741
	mov	DWORD PTR _mon$[ebp], 0
; Line 742
	mov	DWORD PTR _year$[ebp], 0
; Line 743
	mov	DWORD PTR _hour$[ebp], 0
; Line 744
	mov	DWORD PTR _min$[ebp], 0
; Line 745
	mov	DWORD PTR _sec$[ebp], 0
; Line 746
	mov	DWORD PTR _c1$[ebp], 863398800		; 33766b90H
; Line 747
	mov	DWORD PTR _c2$[ebp], 0
; Line 749
	mov	eax, DWORD PTR _date$[ebp]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _day$[ebp], eax
; Line 751
	mov	ecx, DWORD PTR _date$[ebp]
	and	ecx, 65280				; 0000ff00H
	mov	DWORD PTR _b$[ebp], ecx
; Line 752
	mov	edx, DWORD PTR _b$[ebp]
	shr	edx, 8
	mov	DWORD PTR _mon$[ebp], edx
; Line 754
	mov	eax, DWORD PTR _date$[ebp]
	and	eax, -65536				; ffff0000H
	mov	DWORD PTR _b$[ebp], eax
; Line 755
	mov	ecx, DWORD PTR _b$[ebp]
	shr	ecx, 16					; 00000010H
	mov	DWORD PTR _year$[ebp], ecx
; Line 758
	mov	edx, DWORD PTR _rtc$[ebp]
	and	edx, 65280				; 0000ff00H
	mov	DWORD PTR _b$[ebp], edx
; Line 759
	mov	eax, DWORD PTR _b$[ebp]
	shr	eax, 8
	mov	DWORD PTR _sec$[ebp], eax
; Line 761
	mov	ecx, DWORD PTR _rtc$[ebp]
	and	ecx, 16711680				; 00ff0000H
	mov	DWORD PTR _b$[ebp], ecx
; Line 762
	mov	edx, DWORD PTR _b$[ebp]
	shr	edx, 16					; 00000010H
	mov	DWORD PTR _min$[ebp], edx
; Line 764
	mov	eax, DWORD PTR _rtc$[ebp]
	and	eax, -16777216				; ff000000H
	mov	DWORD PTR _b$[ebp], eax
; Line 765
	mov	ecx, DWORD PTR _b$[ebp]
	shr	ecx, 24					; 00000018H
	mov	DWORD PTR _hour$[ebp], ecx
; Line 767
	mov	edx, DWORD PTR _year$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAconvertCharToInt@AOAProtected@@QAEIH@Z ; AOAProtected::AOAconvertCharToInt
	mov	DWORD PTR _year$[ebp], eax
; Line 768
	mov	eax, DWORD PTR _mon$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAconvertCharToInt@AOAProtected@@QAEIH@Z ; AOAProtected::AOAconvertCharToInt
	mov	DWORD PTR _mon$[ebp], eax
; Line 769
	mov	ecx, DWORD PTR _day$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAconvertCharToInt@AOAProtected@@QAEIH@Z ; AOAProtected::AOAconvertCharToInt
	mov	DWORD PTR _day$[ebp], eax
; Line 770
	mov	edx, DWORD PTR _hour$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAconvertCharToInt@AOAProtected@@QAEIH@Z ; AOAProtected::AOAconvertCharToInt
	mov	DWORD PTR _hour$[ebp], eax
; Line 771
	mov	eax, DWORD PTR _min$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAconvertCharToInt@AOAProtected@@QAEIH@Z ; AOAProtected::AOAconvertCharToInt
	mov	DWORD PTR _min$[ebp], eax
; Line 772
	mov	ecx, DWORD PTR _sec$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAconvertCharToInt@AOAProtected@@QAEIH@Z ; AOAProtected::AOAconvertCharToInt
	mov	DWORD PTR _sec$[ebp], eax
; Line 774
	mov	edx, DWORD PTR _mon$[ebp]
	sub	edx, 2
	mov	DWORD PTR _mon$[ebp], edx
	cmp	DWORD PTR _mon$[ebp], 0
	jg	SHORT $L1212
; Line 775
	mov	eax, DWORD PTR _mon$[ebp]
	add	eax, 12					; 0000000cH
	mov	DWORD PTR _mon$[ebp], eax
; Line 776
	mov	ecx, DWORD PTR _year$[ebp]
	sub	ecx, 1
	mov	DWORD PTR _year$[ebp], ecx
$L1212:
; Line 783
	mov	ecx, DWORD PTR _year$[ebp]
	shr	ecx, 2
	mov	eax, DWORD PTR _year$[ebp]
	xor	edx, edx
	mov	esi, 100				; 00000064H
	div	esi
	sub	ecx, eax
	mov	eax, DWORD PTR _year$[ebp]
	xor	edx, edx
	mov	esi, 400				; 00000190H
	div	esi
	mov	esi, eax
	add	esi, DWORD PTR _day$[ebp]
	mov	eax, DWORD PTR _mon$[ebp]
	imul	eax, 367				; 0000016fH
	xor	edx, edx
	mov	edi, 12					; 0000000cH
	div	edi
	add	esi, ecx
	add	eax, esi
	mov	edx, DWORD PTR _year$[ebp]
	imul	edx, 365				; 0000016dH
	lea	eax, DWORD PTR [eax+edx-719499]
	imul	eax, 24					; 00000018H
	add	eax, DWORD PTR _hour$[ebp]
	imul	eax, 60					; 0000003cH
	add	eax, DWORD PTR _min$[ebp]
	imul	eax, 60					; 0000003cH
	add	eax, DWORD PTR _sec$[ebp]
; Line 798
	pop	edi
	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	8
?AOAUnixTime@AOAProtected@@QAEKII@Z ENDP		; AOAProtected::AOAUnixTime
_TEXT	ENDS
PUBLIC	?AOApower10@AOAProtected@@QAEIH@Z		; AOAProtected::AOApower10
_DATA	SEGMENT
$SG1226	DB	'Error:AOAprotected Not a valid character in conversion t'
	DB	'o int value', 00H
_DATA	ENDS
_TEXT	SEGMENT
_chars$ = 8
_this$ = -20
_value$ = -4
_value1$ = -8
_value2$ = -12
_i$ = -16
?AOAconvertCharToInt@AOAProtected@@QAEIH@Z PROC NEAR	; AOAProtected::AOAconvertCharToInt
; Line 804
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	mov	DWORD PTR _this$[ebp], ecx
; Line 805
	mov	DWORD PTR _value$[ebp], 0
; Line 806
	mov	DWORD PTR _value1$[ebp], 0
; Line 807
	mov	DWORD PTR _value2$[ebp], 0
; Line 808
	mov	DWORD PTR _i$[ebp], 0
; Line 810
	mov	eax, DWORD PTR _chars$[ebp]
	mov	DWORD PTR _value1$[ebp], eax
; Line 811
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1221
$L1222:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L1221:
	cmp	DWORD PTR _i$[ebp], 8
	jge	SHORT $L1223
; Line 813
	mov	edx, DWORD PTR _value1$[ebp]
	and	edx, 15					; 0000000fH
	mov	DWORD PTR _value2$[ebp], edx
; Line 814
	cmp	DWORD PTR _value2$[ebp], 0
	jb	SHORT $L1225
	cmp	DWORD PTR _value2$[ebp], 9
	jbe	SHORT $L1224
$L1225:
; Line 816
	push	3700					; 00000e74H
	push	OFFSET FLAT:$SG1226
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 817
	or	eax, -1
	jmp	SHORT $L1216
$L1224:
; Line 821
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOApower10@AOAProtected@@QAEIH@Z	; AOAProtected::AOApower10
	mov	ecx, DWORD PTR _value2$[ebp]
	imul	ecx, eax
	mov	edx, DWORD PTR _value$[ebp]
	add	edx, ecx
	mov	DWORD PTR _value$[ebp], edx
; Line 823
	mov	eax, DWORD PTR _value1$[ebp]
	shr	eax, 4
	mov	DWORD PTR _value1$[ebp], eax
; Line 824
	jmp	SHORT $L1222
$L1223:
; Line 825
	mov	eax, DWORD PTR _value$[ebp]
$L1216:
; Line 826
	mov	esp, ebp
	pop	ebp
	ret	4
?AOAconvertCharToInt@AOAProtected@@QAEIH@Z ENDP		; AOAProtected::AOAconvertCharToInt
_TEXT	ENDS
PUBLIC	?AOAconvertIntToChar@AOAProtected@@QAEHPADI@Z	; AOAProtected::AOAconvertIntToChar
_TEXT	SEGMENT
_chars$ = 8
_value$ = 12
_this$ = -16
_value1$ = -4
_value2$ = -8
_i$ = -12
?AOAconvertIntToChar@AOAProtected@@QAEHPADI@Z PROC NEAR	; AOAProtected::AOAconvertIntToChar
; Line 831
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	mov	DWORD PTR _this$[ebp], ecx
; Line 832
	mov	DWORD PTR _value1$[ebp], 0
; Line 833
	mov	DWORD PTR _value2$[ebp], 0
; Line 834
	mov	DWORD PTR _i$[ebp], 0
; Line 835
	mov	eax, DWORD PTR _value$[ebp]
	mov	DWORD PTR _value2$[ebp], eax
; Line 836
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1236
$L1237:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L1236:
	cmp	DWORD PTR _i$[ebp], 8
	jge	SHORT $L1238
; Line 838
	mov	edx, DWORD PTR _value2$[ebp]
	and	edx, 15					; 0000000fH
	mov	DWORD PTR _value1$[ebp], edx
; Line 839
	mov	eax, DWORD PTR _value1$[ebp]
	add	eax, 48					; 00000030H
	mov	ecx, 7
	sub	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _chars$[ebp]
	mov	BYTE PTR [edx+ecx], al
; Line 840
	mov	eax, DWORD PTR _value2$[ebp]
	shr	eax, 4
	mov	DWORD PTR _value2$[ebp], eax
; Line 841
	jmp	SHORT $L1237
$L1238:
; Line 842
	xor	eax, eax
; Line 843
	mov	esp, ebp
	pop	ebp
	ret	8
?AOAconvertIntToChar@AOAProtected@@QAEHPADI@Z ENDP	; AOAProtected::AOAconvertIntToChar
_tenpower$ = 8
_this$ = -12
_i$ = -8
_value$ = -4
?AOApower10@AOAProtected@@QAEIH@Z PROC NEAR		; AOAProtected::AOApower10
; Line 848
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 849
	mov	DWORD PTR _i$[ebp], 0
; Line 850
	mov	DWORD PTR _value$[ebp], 1
; Line 851
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1245
$L1246:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L1245:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _tenpower$[ebp]
	jge	SHORT $L1247
; Line 853
	mov	edx, DWORD PTR _value$[ebp]
	imul	edx, 10					; 0000000aH
	mov	DWORD PTR _value$[ebp], edx
; Line 854
	jmp	SHORT $L1246
$L1247:
; Line 855
	mov	eax, DWORD PTR _value$[ebp]
; Line 856
	mov	esp, ebp
	pop	ebp
	ret	4
?AOApower10@AOAProtected@@QAEIH@Z ENDP			; AOAProtected::AOApower10
_TEXT	ENDS
PUBLIC	?AOAresetLock@AOAProtected@@QAEHHJ@Z		; AOAProtected::AOAresetLock
EXTRN	_CresetLock32:NEAR
_TEXT	SEGMENT
_lock$ = 8
_tid$ = 12
_this$ = -4
?AOAresetLock@AOAProtected@@QAEHHJ@Z PROC NEAR		; AOAProtected::AOAresetLock
; Line 862
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 863
	mov	eax, DWORD PTR _tid$[ebp]
	push	eax
	mov	ecx, DWORD PTR _lock$[ebp]
	push	ecx
	call	_CresetLock32
	add	esp, 8
; Line 864
	mov	esp, ebp
	pop	ebp
	ret	8
?AOAresetLock@AOAProtected@@QAEHHJ@Z ENDP		; AOAProtected::AOAresetLock
_TEXT	ENDS
PUBLIC	?AOAtestAndSet@AOAProtected@@QAEHHJ@Z		; AOAProtected::AOAtestAndSet
EXTRN	_CtestAndSet32:NEAR
_TEXT	SEGMENT
_lock$ = 8
_tid$ = 12
_this$ = -12
_taskid$ = -8
_storedlock$ = -4
?AOAtestAndSet@AOAProtected@@QAEHHJ@Z PROC NEAR		; AOAProtected::AOAtestAndSet
; Line 871
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 874
	push	76					; 0000004cH
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetSharedMem@AOAProtected@@QAEJH@Z	; AOAProtected::AOAgetSharedMem
	mov	DWORD PTR _storedlock$[ebp], eax
; Line 875
	mov	eax, DWORD PTR _lock$[ebp]
	add	eax, 92					; 0000005cH
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetSharedMem@AOAProtected@@QAEJH@Z	; AOAProtected::AOAgetSharedMem
	mov	DWORD PTR _taskid$[ebp], eax
; Line 877
	cmp	DWORD PTR _storedlock$[ebp], 1
	jne	SHORT $L1260
	mov	ecx, DWORD PTR _taskid$[ebp]
	cmp	ecx, DWORD PTR _tid$[ebp]
	jne	SHORT $L1260
; Line 878
	xor	eax, eax
	jmp	SHORT $L1261
$L1260:
; Line 880
	mov	edx, DWORD PTR _tid$[ebp]
	push	edx
	mov	eax, DWORD PTR _lock$[ebp]
	push	eax
	call	_CtestAndSet32
	add	esp, 8
$L1261:
; Line 881
	mov	esp, ebp
	pop	ebp
	ret	8
?AOAtestAndSet@AOAProtected@@QAEHHJ@Z ENDP		; AOAProtected::AOAtestAndSet
_TEXT	ENDS
PUBLIC	?AOAgetSharedMemTraceString@AOAProtected@@QAEXPAD@Z ; AOAProtected::AOAgetSharedMemTraceString
_TEXT	SEGMENT
_array1$ = 8
_this$ = -8
_i$ = -4
?AOAgetSharedMemTraceString@AOAProtected@@QAEXPAD@Z PROC NEAR ; AOAProtected::AOAgetSharedMemTraceString
; Line 885
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 886
	mov	DWORD PTR _i$[ebp], 0
; Line 887
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1267
$L1268:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L1267:
	cmp	DWORD PTR _i$[ebp], 40			; 00000028H
	jge	SHORT $L1269
; Line 888
	push	36					; 00000024H
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetSharedMemChar@AOAProtected@@QAEDHH@Z ; AOAProtected::AOAgetSharedMemChar
	mov	edx, DWORD PTR _array1$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	mov	BYTE PTR [edx], al
	jmp	SHORT $L1268
$L1269:
; Line 890
	mov	esp, ebp
	pop	ebp
	ret	4
?AOAgetSharedMemTraceString@AOAProtected@@QAEXPAD@Z ENDP ; AOAProtected::AOAgetSharedMemTraceString
_TEXT	ENDS
PUBLIC	?AOAsetSharedMemTraceString@AOAProtected@@QAEXPAD@Z ; AOAProtected::AOAsetSharedMemTraceString
PUBLIC	?AOAsetSharedMemChar@AOAProtected@@QAEXHDH@Z	; AOAProtected::AOAsetSharedMemChar
_TEXT	SEGMENT
_array1$ = 8
_this$ = -8
_i$ = -4
?AOAsetSharedMemTraceString@AOAProtected@@QAEXPAD@Z PROC NEAR ; AOAProtected::AOAsetSharedMemTraceString
; Line 894
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 895
	mov	DWORD PTR _i$[ebp], 0
; Line 896
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1275
$L1276:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L1275:
	cmp	DWORD PTR _i$[ebp], 40			; 00000028H
	jge	SHORT $L1277
; Line 897
	push	36					; 00000024H
	mov	ecx, DWORD PTR _array1$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	dl, BYTE PTR [ecx]
	push	edx
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMemChar@AOAProtected@@QAEXHDH@Z ; AOAProtected::AOAsetSharedMemChar
	jmp	SHORT $L1276
$L1277:
; Line 899
	mov	esp, ebp
	pop	ebp
	ret	4
?AOAsetSharedMemTraceString@AOAProtected@@QAEXPAD@Z ENDP ; AOAProtected::AOAsetSharedMemTraceString
_TEXT	ENDS
EXTRN	_CsetSharedMemChar32:NEAR
_TEXT	SEGMENT
_index$ = 8
_c$ = 12
_base$ = 16
_this$ = -4
?AOAsetSharedMemChar@AOAProtected@@QAEXHDH@Z PROC NEAR	; AOAProtected::AOAsetSharedMemChar
; Line 901
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 902
	mov	eax, DWORD PTR _base$[ebp]
	push	eax
	mov	cl, BYTE PTR _c$[ebp]
	push	ecx
	mov	edx, DWORD PTR _index$[ebp]
	push	edx
	call	_CsetSharedMemChar32
	add	esp, 12					; 0000000cH
; Line 903
	mov	esp, ebp
	pop	ebp
	ret	12					; 0000000cH
?AOAsetSharedMemChar@AOAProtected@@QAEXHDH@Z ENDP	; AOAProtected::AOAsetSharedMemChar
_TEXT	ENDS
EXTRN	_CgetSharedMem32:NEAR
_TEXT	SEGMENT
_index$ = 8
_this$ = -4
?AOAgetSharedMem@AOAProtected@@QAEJH@Z PROC NEAR	; AOAProtected::AOAgetSharedMem
; Line 906
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 907
	mov	eax, DWORD PTR _index$[ebp]
	push	eax
	call	_CgetSharedMem32
	add	esp, 4
; Line 908
	mov	esp, ebp
	pop	ebp
	ret	4
?AOAgetSharedMem@AOAProtected@@QAEJH@Z ENDP		; AOAProtected::AOAgetSharedMem
_TEXT	ENDS
EXTRN	_CsetSharedMem32:NEAR
_TEXT	SEGMENT
_index$ = 8
_val$ = 12
_this$ = -4
?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z PROC NEAR	; AOAProtected::AOAsetSharedMem
; Line 910
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 911
	mov	eax, DWORD PTR _val$[ebp]
	push	eax
	mov	ecx, DWORD PTR _index$[ebp]
	push	ecx
	call	_CsetSharedMem32
	add	esp, 8
; Line 912
	mov	esp, ebp
	pop	ebp
	ret	8
?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z ENDP		; AOAProtected::AOAsetSharedMem
_TEXT	ENDS
PUBLIC	?AOAgetMem@AOAProtected@@QAEJJ@Z		; AOAProtected::AOAgetMem
EXTRN	_CgetMem32:NEAR
_TEXT	SEGMENT
_addr$ = 8
_this$ = -4
?AOAgetMem@AOAProtected@@QAEJJ@Z PROC NEAR		; AOAProtected::AOAgetMem
; Line 916
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 917
	mov	eax, DWORD PTR _addr$[ebp]
	push	eax
	call	_CgetMem32
	add	esp, 4
; Line 918
	mov	esp, ebp
	pop	ebp
	ret	4
?AOAgetMem@AOAProtected@@QAEJJ@Z ENDP			; AOAProtected::AOAgetMem
_TEXT	ENDS
PUBLIC	?AOAsetMem@AOAProtected@@QAEJJJ@Z		; AOAProtected::AOAsetMem
EXTRN	_CsetMem32:NEAR
_TEXT	SEGMENT
_addr$ = 8
_data$ = 12
_this$ = -4
?AOAsetMem@AOAProtected@@QAEJJJ@Z PROC NEAR		; AOAProtected::AOAsetMem
; Line 922
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 923
	mov	eax, DWORD PTR _data$[ebp]
	push	eax
	mov	ecx, DWORD PTR _addr$[ebp]
	push	ecx
	call	_CsetMem32
	add	esp, 8
; Line 924
	mov	esp, ebp
	pop	ebp
	ret	8
?AOAsetMem@AOAProtected@@QAEJJJ@Z ENDP			; AOAProtected::AOAsetMem
_TEXT	ENDS
PUBLIC	?AOAprintRegs@AOAProtected@@QAEXH@Z		; AOAProtected::AOAprintRegs
EXTRN	_CprintRegs32:NEAR
_TEXT	SEGMENT
_pos$ = 8
_this$ = -4
?AOAprintRegs@AOAProtected@@QAEXH@Z PROC NEAR		; AOAProtected::AOAprintRegs
; Line 926
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 927
	mov	eax, DWORD PTR _pos$[ebp]
	push	eax
	call	_CprintRegs32
	add	esp, 4
; Line 928
	mov	esp, ebp
	pop	ebp
	ret	4
?AOAprintRegs@AOAProtected@@QAEXH@Z ENDP		; AOAProtected::AOAprintRegs
_TEXT	ENDS
PUBLIC	?AOAprintStackRegs@AOAProtected@@QAEXH@Z	; AOAProtected::AOAprintStackRegs
EXTRN	_CprintStackRegs32:NEAR
_TEXT	SEGMENT
_pos$ = 8
_this$ = -4
?AOAprintStackRegs@AOAProtected@@QAEXH@Z PROC NEAR	; AOAProtected::AOAprintStackRegs
; Line 930
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 931
	mov	eax, DWORD PTR _pos$[ebp]
	push	eax
	call	_CprintStackRegs32
	add	esp, 4
; Line 932
	mov	esp, ebp
	pop	ebp
	ret	4
?AOAprintStackRegs@AOAProtected@@QAEXH@Z ENDP		; AOAProtected::AOAprintStackRegs
_TEXT	ENDS
PUBLIC	?AOAgetStackPOP@AOAProtected@@QAEJH@Z		; AOAProtected::AOAgetStackPOP
EXTRN	_CgetStackPOP32:NEAR
_TEXT	SEGMENT
_index$ = 8
_this$ = -4
?AOAgetStackPOP@AOAProtected@@QAEJH@Z PROC NEAR		; AOAProtected::AOAgetStackPOP
; Line 934
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 935
	mov	eax, DWORD PTR _index$[ebp]
	push	eax
	call	_CgetStackPOP32
	add	esp, 4
; Line 936
	mov	esp, ebp
	pop	ebp
	ret	4
?AOAgetStackPOP@AOAProtected@@QAEJH@Z ENDP		; AOAProtected::AOAgetStackPOP
_TEXT	ENDS
PUBLIC	?AOAgetCharacter@AOAProtected@@QAEDXZ		; AOAProtected::AOAgetCharacter
PUBLIC	?AOAgetDecimal@AOAProtected@@QAEHXZ		; AOAProtected::AOAgetDecimal
_TEXT	SEGMENT
_this$ = -16
_ch$ = -12
_mul$ = -8
_result$ = -4
?AOAgetDecimal@AOAProtected@@QAEHXZ PROC NEAR		; AOAProtected::AOAgetDecimal
; Line 941
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	mov	DWORD PTR _this$[ebp], ecx
; Line 943
	mov	DWORD PTR _mul$[ebp], 10		; 0000000aH
; Line 944
	mov	DWORD PTR _result$[ebp], 0
; Line 946
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	BYTE PTR _ch$[ebp], al
$L1321:
; Line 947
	movsx	eax, BYTE PTR _ch$[ebp]
	cmp	eax, 48					; 00000030H
	jl	SHORT $L1322
	movsx	ecx, BYTE PTR _ch$[ebp]
	cmp	ecx, 57					; 00000039H
	jg	SHORT $L1322
; Line 948
	mov	edx, DWORD PTR _result$[ebp]
	imul	edx, DWORD PTR _mul$[ebp]
	mov	DWORD PTR _result$[ebp], edx
; Line 949
	movsx	eax, BYTE PTR _ch$[ebp]
	mov	ecx, DWORD PTR _result$[ebp]
	lea	edx, DWORD PTR [ecx+eax-48]
	mov	DWORD PTR _result$[ebp], edx
; Line 950
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	BYTE PTR _ch$[ebp], al
; Line 951
	jmp	SHORT $L1321
$L1322:
; Line 953
	mov	eax, DWORD PTR _result$[ebp]
; Line 954
	mov	esp, ebp
	pop	ebp
	ret	0
?AOAgetDecimal@AOAProtected@@QAEHXZ ENDP		; AOAProtected::AOAgetDecimal
_TEXT	ENDS
PUBLIC	?AOAgetHex@AOAProtected@@QAEHXZ			; AOAProtected::AOAgetHex
_TEXT	SEGMENT
_this$ = -20
_ch$ = -16
_mul$ = -12
_result$ = -4
_tmp$ = -8
?AOAgetHex@AOAProtected@@QAEHXZ PROC NEAR		; AOAProtected::AOAgetHex
; Line 959
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	mov	DWORD PTR _this$[ebp], ecx
; Line 961
	mov	DWORD PTR _mul$[ebp], 16		; 00000010H
; Line 962
	mov	DWORD PTR _result$[ebp], 0
; Line 963
	mov	DWORD PTR _tmp$[ebp], 0
; Line 965
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	BYTE PTR _ch$[ebp], al
$L1331:
; Line 966
	movsx	eax, BYTE PTR _ch$[ebp]
	cmp	eax, 48					; 00000030H
	jl	SHORT $L1334
	movsx	ecx, BYTE PTR _ch$[ebp]
	cmp	ecx, 57					; 00000039H
	jle	SHORT $L1333
$L1334:
	movsx	edx, BYTE PTR _ch$[ebp]
	cmp	edx, 97					; 00000061H
	jl	SHORT $L1335
	movsx	eax, BYTE PTR _ch$[ebp]
	cmp	eax, 102				; 00000066H
	jle	SHORT $L1333
$L1335:
	movsx	ecx, BYTE PTR _ch$[ebp]
	cmp	ecx, 65					; 00000041H
	jl	SHORT $L1332
	movsx	edx, BYTE PTR _ch$[ebp]
	cmp	edx, 70					; 00000046H
	jg	SHORT $L1332
$L1333:
; Line 967
	movsx	eax, BYTE PTR _ch$[ebp]
	cmp	eax, 48					; 00000030H
	jl	SHORT $L1336
	movsx	ecx, BYTE PTR _ch$[ebp]
	cmp	ecx, 57					; 00000039H
	jg	SHORT $L1336
; Line 968
	movsx	edx, BYTE PTR _ch$[ebp]
	sub	edx, 48					; 00000030H
	mov	DWORD PTR _tmp$[ebp], edx
; Line 969
	jmp	SHORT $L1339
$L1336:
	movsx	eax, BYTE PTR _ch$[ebp]
	cmp	eax, 97					; 00000061H
	jl	SHORT $L1338
	movsx	ecx, BYTE PTR _ch$[ebp]
	cmp	ecx, 102				; 00000066H
	jg	SHORT $L1338
; Line 970
	movsx	edx, BYTE PTR _ch$[ebp]
	sub	edx, 87					; 00000057H
	mov	DWORD PTR _tmp$[ebp], edx
; Line 971
	jmp	SHORT $L1339
$L1338:
; Line 972
	movsx	eax, BYTE PTR _ch$[ebp]
	sub	eax, 55					; 00000037H
	mov	DWORD PTR _tmp$[ebp], eax
$L1339:
; Line 975
	mov	ecx, DWORD PTR _result$[ebp]
	imul	ecx, DWORD PTR _mul$[ebp]
	mov	DWORD PTR _result$[ebp], ecx
; Line 976
	mov	edx, DWORD PTR _result$[ebp]
	add	edx, DWORD PTR _tmp$[ebp]
	mov	DWORD PTR _result$[ebp], edx
; Line 977
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	BYTE PTR _ch$[ebp], al
; Line 978
	jmp	$L1331
$L1332:
; Line 980
	mov	eax, DWORD PTR _result$[ebp]
; Line 981
	mov	esp, ebp
	pop	ebp
	ret	0
?AOAgetHex@AOAProtected@@QAEHXZ ENDP			; AOAProtected::AOAgetHex
_TEXT	ENDS
EXTRN	_CgetChar32:NEAR
_TEXT	SEGMENT
_this$ = -12
_cursorp$ = -8
_c$ = -4
?AOAgetCharacter@AOAProtected@@QAEDXZ PROC NEAR		; AOAProtected::AOAgetCharacter
; Line 986
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 990
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCursor@AOAProtected@@QAEHXZ	; AOAProtected::AOAgetCursor
	mov	DWORD PTR _cursorp$[ebp], eax
; Line 991
	mov	eax, DWORD PTR _cursorp$[ebp]
	push	eax
	call	_CgetChar32
	add	esp, 4
	mov	BYTE PTR _c$[ebp], al
; Line 992
	mov	ecx, DWORD PTR _cursorp$[ebp]
	shl	ecx, 1
	push	ecx
	mov	dl, BYTE PTR _c$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintCharacter@AOAProtected@@QAEHDH@Z ; AOAProtected::AOAprintCharacter
; Line 993
	mov	eax, DWORD PTR _cursorp$[ebp]
	add	eax, 1
	mov	DWORD PTR _cursorp$[ebp], eax
; Line 994
	mov	ecx, DWORD PTR _cursorp$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetCursor@AOAProtected@@QAEHH@Z	; AOAProtected::AOAsetCursor
; Line 995
	mov	al, BYTE PTR _c$[ebp]
; Line 996
	mov	esp, ebp
	pop	ebp
	ret	0
?AOAgetCharacter@AOAProtected@@QAEDXZ ENDP		; AOAProtected::AOAgetCharacter
_TEXT	ENDS
PUBLIC	?AOAgetCharacterInt@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacterInt
EXTRN	_CgetCharInt32:NEAR
_TEXT	SEGMENT
_this$ = -4
?AOAgetCharacterInt@AOAProtected@@QAEDXZ PROC NEAR	; AOAProtected::AOAgetCharacterInt
; Line 1001
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 1002
	call	_CgetCharInt32
; Line 1003
	mov	esp, ebp
	pop	ebp
	ret	0
?AOAgetCharacterInt@AOAProtected@@QAEDXZ ENDP		; AOAProtected::AOAgetCharacterInt
_TEXT	ENDS
PUBLIC	?AOAgetCharacterBuff@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacterBuff
EXTRN	_CgetCharBuff32:NEAR
_TEXT	SEGMENT
_this$ = -8
_i$ = -4
?AOAgetCharacterBuff@AOAProtected@@QAEDXZ PROC NEAR	; AOAProtected::AOAgetCharacterBuff
; Line 1007
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 1008
	mov	BYTE PTR _i$[ebp], 0
; Line 1009
	call	_CgetCharBuff32
	mov	BYTE PTR _i$[ebp], al
; Line 1010
	mov	al, BYTE PTR _i$[ebp]
; Line 1011
	mov	esp, ebp
	pop	ebp
	ret	0
?AOAgetCharacterBuff@AOAProtected@@QAEDXZ ENDP		; AOAProtected::AOAgetCharacterBuff
_TEXT	ENDS
PUBLIC	?AOAreadFloppy@AOAProtected@@QAEHPADJ@Z		; AOAProtected::AOAreadFloppy
EXTRN	_CreadFloppy32:NEAR
_TEXT	SEGMENT
_buff$ = 8
_sectorno$ = 12
_this$ = -4
?AOAreadFloppy@AOAProtected@@QAEHPADJ@Z PROC NEAR	; AOAProtected::AOAreadFloppy
; Line 1014
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 1015
	mov	eax, DWORD PTR _sectorno$[ebp]
	push	eax
	mov	ecx, DWORD PTR _buff$[ebp]
	push	ecx
	call	_CreadFloppy32
	add	esp, 8
; Line 1016
	mov	esp, ebp
	pop	ebp
	ret	8
?AOAreadFloppy@AOAProtected@@QAEHPADJ@Z ENDP		; AOAProtected::AOAreadFloppy
_TEXT	ENDS
PUBLIC	?AOAwriteFloppy@AOAProtected@@QAEHPADJ@Z	; AOAProtected::AOAwriteFloppy
EXTRN	_CwriteFloppy32:NEAR
_TEXT	SEGMENT
_buff$ = 8
_sectorno$ = 12
_this$ = -4
?AOAwriteFloppy@AOAProtected@@QAEHPADJ@Z PROC NEAR	; AOAProtected::AOAwriteFloppy
; Line 1019
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 1020
	mov	eax, DWORD PTR _sectorno$[ebp]
	push	eax
	mov	ecx, DWORD PTR _buff$[ebp]
	push	ecx
	call	_CwriteFloppy32
	add	esp, 8
; Line 1021
	mov	esp, ebp
	pop	ebp
	ret	8
?AOAwriteFloppy@AOAProtected@@QAEHPADJ@Z ENDP		; AOAProtected::AOAwriteFloppy
_TEXT	ENDS
PUBLIC	?AOAclearTotalMemory@AOAProtected@@QAEHJPAJ@Z	; AOAProtected::AOAclearTotalMemory
_TEXT	SEGMENT
_MEMBaseValue$ = 8
_MEMSizePtr$ = 12
_this$ = -12
_ptr$ = -4
_i$ = -8
?AOAclearTotalMemory@AOAProtected@@QAEHJPAJ@Z PROC NEAR	; AOAProtected::AOAclearTotalMemory
; Line 1024
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 1025
	mov	eax, DWORD PTR _MEMBaseValue$[ebp]
	mov	DWORD PTR _ptr$[ebp], eax
; Line 1026
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1370
$L1371:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 4
	mov	DWORD PTR _i$[ebp], ecx
$L1370:
	mov	edx, DWORD PTR _MEMSizePtr$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx]
	jge	SHORT $L1372
; Line 1028
	mov	ecx, DWORD PTR _ptr$[ebp]
	mov	DWORD PTR [ecx], 0
; Line 1029
	mov	edx, DWORD PTR _ptr$[ebp]
	add	edx, 4
	mov	DWORD PTR _ptr$[ebp], edx
; Line 1030
	jmp	SHORT $L1371
$L1372:
; Line 1031
	xor	eax, eax
; Line 1032
	mov	esp, ebp
	pop	ebp
	ret	8
?AOAclearTotalMemory@AOAProtected@@QAEHJPAJ@Z ENDP	; AOAProtected::AOAclearTotalMemory
_TEXT	ENDS
PUBLIC	?AOAExit@AOAProtected@@QAEXXZ			; AOAProtected::AOAExit
_TEXT	SEGMENT
_this$ = -4
?AOAExit@AOAProtected@@QAEXXZ PROC NEAR			; AOAProtected::AOAExit
; Line 1040
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1042
	cli
; Line 1043
	pop	edi
; Line 1044
	pop	esi
; Line 1045
	pop	ebx
; Line 1046
	mov	esp, ebp
; Line 1047
	pop	ebp
; Line 1048
	sti
; Line 1049
	iretd
; Line 1051
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	0
?AOAExit@AOAProtected@@QAEXXZ ENDP			; AOAProtected::AOAExit
_TEXT	ENDS
PUBLIC	?AOAISRExit@AOAProtected@@QAEXXZ		; AOAProtected::AOAISRExit
_TEXT	SEGMENT
_this$ = -4
?AOAISRExit@AOAProtected@@QAEXXZ PROC NEAR		; AOAProtected::AOAISRExit
; Line 1069
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1081
	pop	edi
; Line 1082
	pop	esi
; Line 1083
	pop	ebx
; Line 1084
	mov	esp, ebp
; Line 1085
	pop	ebp
; Line 1087
	pop	edi
; Line 1088
	pop	esi
; Line 1089
	pop	ebx
; Line 1090
	mov	esp, ebp
; Line 1091
	pop	ebp
; Line 1095
	push	edx
; Line 1096
	pushfd
; Line 1099
	pop	edx
; Line 1100
	and	edx, -16385				; ffffbfffH
; Line 1101
	push	edx
; Line 1102
	popfd
; Line 1103
	pop	edx
; Line 1106
	sti
; Line 1108
	iretd
; Line 1111
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	0
?AOAISRExit@AOAProtected@@QAEXXZ ENDP			; AOAProtected::AOAISRExit
_str$ = 8
_base$ = 12
_this$ = -12
_temp$ = -4
_i$ = -8
?AOAPrintText@AOAProtected@@QAEXPADH@Z PROC NEAR	; AOAProtected::AOAPrintText
; Line 1116
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 1117
	mov	DWORD PTR _temp$[ebp], 0
; Line 1118
	mov	eax, DWORD PTR _base$[ebp]
	mov	DWORD PTR _temp$[ebp], eax
; Line 1120
	cmp	DWORD PTR _base$[ebp], 0
	jl	SHORT $L1386
	cmp	DWORD PTR _base$[ebp], 4000		; 00000fa0H
	jl	SHORT $L1385
$L1386:
; Line 1122
	jmp	SHORT $L1383
$L1385:
; Line 1125
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1388
$L1389:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L1388:
	mov	edx, DWORD PTR _str$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L1390
	cmp	DWORD PTR _i$[ebp], 80			; 00000050H
	jge	SHORT $L1390
; Line 1127
	mov	ecx, DWORD PTR _temp$[ebp]
	push	ecx
	mov	edx, DWORD PTR _str$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	mov	al, BYTE PTR [edx]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintCharacter@AOAProtected@@QAEHDH@Z ; AOAProtected::AOAprintCharacter
; Line 1128
	mov	ecx, DWORD PTR _temp$[ebp]
	add	ecx, 2
	mov	DWORD PTR _temp$[ebp], ecx
; Line 1129
	jmp	SHORT $L1389
$L1390:
$L1383:
; Line 1132
	mov	esp, ebp
	pop	ebp
	ret	8
?AOAPrintText@AOAProtected@@QAEXPADH@Z ENDP		; AOAProtected::AOAPrintText
_TEXT	ENDS
PUBLIC	?AOAPrintText@AOAProtected@@QAEXPADHH@Z		; AOAProtected::AOAPrintText
_TEXT	SEGMENT
_str$ = 8
_length$ = 12
_base$ = 16
_this$ = -8
_i$ = -4
?AOAPrintText@AOAProtected@@QAEXPADHH@Z PROC NEAR	; AOAProtected::AOAPrintText
; Line 1137
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 1139
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1398
$L1399:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L1398:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _length$[ebp]
	jge	SHORT $L1400
; Line 1141
	mov	edx, DWORD PTR _base$[ebp]
	push	edx
	mov	eax, DWORD PTR _str$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	mov	cl, BYTE PTR [eax]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintCharacter@AOAProtected@@QAEHDH@Z ; AOAProtected::AOAprintCharacter
; Line 1142
	mov	edx, DWORD PTR _base$[ebp]
	add	edx, 2
	mov	DWORD PTR _base$[ebp], edx
; Line 1143
	jmp	SHORT $L1399
$L1400:
; Line 1146
	mov	esp, ebp
	pop	ebp
	ret	12					; 0000000cH
?AOAPrintText@AOAProtected@@QAEXPADHH@Z ENDP		; AOAProtected::AOAPrintText
_TEXT	ENDS
PUBLIC	?AOAPrintText@AOAProtected@@QAEXPAD@Z		; AOAProtected::AOAPrintText
_TEXT	SEGMENT
_str$ = 8
_this$ = -20
_charpos$ = -8
_temp1$ = -4
_base$ = -16
_i$ = -12
?AOAPrintText@AOAProtected@@QAEXPAD@Z PROC NEAR		; AOAProtected::AOAPrintText
; Line 1152
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	mov	DWORD PTR _this$[ebp], ecx
; Line 1154
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCursor@AOAProtected@@QAEHXZ	; AOAProtected::AOAgetCursor
	mov	DWORD PTR _charpos$[ebp], eax
; Line 1155
	mov	eax, DWORD PTR _charpos$[ebp]
	shl	eax, 1
	mov	DWORD PTR _base$[ebp], eax
; Line 1157
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1409
$L1410:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L1409:
	mov	edx, DWORD PTR _str$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L1411
; Line 1159
	mov	ecx, DWORD PTR _str$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, 10					; 0000000aH
	jne	SHORT $L1412
; Line 1161
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCursor@AOAProtected@@QAEHXZ	; AOAProtected::AOAgetCursor
	mov	DWORD PTR _charpos$[ebp], eax
; Line 1162
	mov	eax, DWORD PTR _charpos$[ebp]
	cdq
	mov	ecx, 80					; 00000050H
	idiv	ecx
	mov	DWORD PTR _temp1$[ebp], edx
; Line 1163
	mov	edx, 80					; 00000050H
	sub	edx, DWORD PTR _temp1$[ebp]
	mov	eax, DWORD PTR _charpos$[ebp]
	add	eax, edx
	mov	DWORD PTR _charpos$[ebp], eax
; Line 1164
	mov	ecx, DWORD PTR _charpos$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetCursor@AOAProtected@@QAEHH@Z	; AOAProtected::AOAsetCursor
; Line 1166
	jmp	SHORT $L1413
$L1412:
; Line 1168
	mov	edx, DWORD PTR _base$[ebp]
	push	edx
	mov	eax, DWORD PTR _str$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	mov	cl, BYTE PTR [eax]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintCharacter@AOAProtected@@QAEHDH@Z ; AOAProtected::AOAprintCharacter
; Line 1169
	mov	edx, DWORD PTR _base$[ebp]
	add	edx, 2
	mov	DWORD PTR _base$[ebp], edx
$L1413:
; Line 1171
	jmp	SHORT $L1410
$L1411:
; Line 1172
	mov	eax, DWORD PTR _base$[ebp]
	cdq
	sub	eax, edx
	sar	eax, 1
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetCursor@AOAProtected@@QAEHH@Z	; AOAProtected::AOAsetCursor
; Line 1174
	mov	esp, ebp
	pop	ebp
	ret	4
?AOAPrintText@AOAProtected@@QAEXPAD@Z ENDP		; AOAProtected::AOAPrintText
_TEXT	ENDS
PUBLIC	?AOA2CharTo1CharHex@AOAProtected@@QAEDPAD@Z	; AOAProtected::AOA2CharTo1CharHex
_TEXT	SEGMENT
_ptr$ = 8
_this$ = -16
_t1$ = -12
_c1$ = -4
_c2$ = -8
?AOA2CharTo1CharHex@AOAProtected@@QAEDPAD@Z PROC NEAR	; AOAProtected::AOA2CharTo1CharHex
; Line 1180
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	mov	DWORD PTR _this$[ebp], ecx
; Line 1181
	mov	BYTE PTR _t1$[ebp], 32			; 00000020H
; Line 1182
	mov	BYTE PTR _c1$[ebp], 0
; Line 1183
	mov	BYTE PTR _c2$[ebp], 0
; Line 1186
	mov	eax, DWORD PTR _ptr$[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 48					; 00000030H
	jl	SHORT $L1421
	mov	edx, DWORD PTR _ptr$[ebp]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, 57					; 00000039H
	jg	SHORT $L1421
; Line 1187
	mov	ecx, DWORD PTR _ptr$[ebp]
	movsx	edx, BYTE PTR [ecx]
	sub	edx, 48					; 00000030H
	mov	BYTE PTR _c1$[ebp], dl
; Line 1188
	jmp	SHORT $L1425
$L1421:
; Line 1189
	mov	eax, DWORD PTR _ptr$[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 65					; 00000041H
	jl	SHORT $L1423
	mov	edx, DWORD PTR _ptr$[ebp]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, 70					; 00000046H
	jg	SHORT $L1423
; Line 1190
	mov	ecx, DWORD PTR _ptr$[ebp]
	movsx	edx, BYTE PTR [ecx]
	sub	edx, 55					; 00000037H
	mov	BYTE PTR _c1$[ebp], dl
; Line 1191
	jmp	SHORT $L1425
$L1423:
; Line 1192
	mov	eax, DWORD PTR _ptr$[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 97					; 00000061H
	jl	SHORT $L1425
	mov	edx, DWORD PTR _ptr$[ebp]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, 102				; 00000066H
	jg	SHORT $L1425
; Line 1193
	mov	ecx, DWORD PTR _ptr$[ebp]
	movsx	edx, BYTE PTR [ecx]
	sub	edx, 87					; 00000057H
	mov	BYTE PTR _c1$[ebp], dl
$L1425:
; Line 1195
	movsx	eax, BYTE PTR _c1$[ebp]
	and	eax, 15					; 0000000fH
	mov	BYTE PTR _c1$[ebp], al
; Line 1196
	movsx	ecx, BYTE PTR _c1$[ebp]
	shl	ecx, 4
	mov	BYTE PTR _c1$[ebp], cl
; Line 1198
	mov	edx, DWORD PTR _ptr$[ebp]
	movsx	eax, BYTE PTR [edx+1]
	cmp	eax, 48					; 00000030H
	jl	SHORT $L1426
	mov	ecx, DWORD PTR _ptr$[ebp]
	movsx	edx, BYTE PTR [ecx+1]
	cmp	edx, 57					; 00000039H
	jg	SHORT $L1426
; Line 1199
	mov	eax, DWORD PTR _ptr$[ebp]
	movsx	ecx, BYTE PTR [eax+1]
	sub	ecx, 48					; 00000030H
	mov	BYTE PTR _c2$[ebp], cl
; Line 1200
	jmp	SHORT $L1430
$L1426:
; Line 1201
	mov	edx, DWORD PTR _ptr$[ebp]
	movsx	eax, BYTE PTR [edx+1]
	cmp	eax, 65					; 00000041H
	jl	SHORT $L1428
	mov	ecx, DWORD PTR _ptr$[ebp]
	movsx	edx, BYTE PTR [ecx+1]
	cmp	edx, 70					; 00000046H
	jg	SHORT $L1428
; Line 1202
	mov	eax, DWORD PTR _ptr$[ebp]
	movsx	ecx, BYTE PTR [eax+1]
	sub	ecx, 55					; 00000037H
	mov	BYTE PTR _c2$[ebp], cl
; Line 1203
	jmp	SHORT $L1430
$L1428:
; Line 1204
	mov	edx, DWORD PTR _ptr$[ebp]
	movsx	eax, BYTE PTR [edx+1]
	cmp	eax, 97					; 00000061H
	jl	SHORT $L1430
	mov	ecx, DWORD PTR _ptr$[ebp]
	movsx	edx, BYTE PTR [ecx+1]
	cmp	edx, 102				; 00000066H
	jg	SHORT $L1430
; Line 1205
	mov	eax, DWORD PTR _ptr$[ebp]
	movsx	ecx, BYTE PTR [eax+1]
	sub	ecx, 87					; 00000057H
	mov	BYTE PTR _c2$[ebp], cl
$L1430:
; Line 1207
	movsx	edx, BYTE PTR _c2$[ebp]
	and	edx, 15					; 0000000fH
	mov	BYTE PTR _c2$[ebp], dl
; Line 1208
	movsx	eax, BYTE PTR _c1$[ebp]
	movsx	ecx, BYTE PTR _c2$[ebp]
	or	eax, ecx
	mov	BYTE PTR _c1$[ebp], al
; Line 1210
	movsx	edx, BYTE PTR _c1$[ebp]
	and	edx, 255				; 000000ffH
	mov	BYTE PTR _t1$[ebp], dl
; Line 1212
	mov	al, BYTE PTR _t1$[ebp]
; Line 1213
	mov	esp, ebp
	pop	ebp
	ret	4
?AOA2CharTo1CharHex@AOAProtected@@QAEDPAD@Z ENDP	; AOAProtected::AOA2CharTo1CharHex
_TEXT	ENDS
PUBLIC	?AOACharToDecimal@AOAProtected@@QAEHQAD@Z	; AOAProtected::AOACharToDecimal
_TEXT	SEGMENT
_nom$ = 8
_this$ = -24
_num$ = -16
_charno$ = -12
_h$ = -8
_g$ = -4
_d$1445 = -20
?AOACharToDecimal@AOAProtected@@QAEHQAD@Z PROC NEAR	; AOAProtected::AOACharToDecimal
; Line 1220
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	mov	DWORD PTR _this$[ebp], ecx
; Line 1223
	mov	DWORD PTR _h$[ebp], 0
	jmp	SHORT $L1438
$L1439:
	mov	eax, DWORD PTR _h$[ebp]
	add	eax, 1
	mov	DWORD PTR _h$[ebp], eax
$L1438:
	mov	ecx, DWORD PTR _nom$[ebp]
	add	ecx, DWORD PTR _h$[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	SHORT $L1440
	jmp	SHORT $L1439
$L1440:
; Line 1224
	mov	eax, DWORD PTR _h$[ebp]
	sub	eax, 1
	mov	DWORD PTR _h$[ebp], eax
	mov	ecx, DWORD PTR _nom$[ebp]
	add	ecx, DWORD PTR _h$[ebp]
	movsx	edx, BYTE PTR [ecx]
	sub	edx, 48					; 00000030H
	mov	DWORD PTR _num$[ebp], edx
; Line 1228
	mov	DWORD PTR _g$[ebp], 1
	jmp	SHORT $L1442
$L1443:
	mov	eax, DWORD PTR _h$[ebp]
	sub	eax, 1
	mov	DWORD PTR _h$[ebp], eax
	mov	ecx, DWORD PTR _g$[ebp]
	add	ecx, 1
	mov	DWORD PTR _g$[ebp], ecx
$L1442:
	cmp	DWORD PTR _h$[ebp], 0
	jle	SHORT $L1444
; Line 1230
	mov	edx, DWORD PTR _nom$[ebp]
	add	edx, DWORD PTR _h$[ebp]
	movsx	eax, BYTE PTR [edx-1]
	sub	eax, 48					; 00000030H
	mov	DWORD PTR _charno$[ebp], eax
; Line 1232
	mov	ecx, DWORD PTR _g$[ebp]
	mov	DWORD PTR _d$1445[ebp], ecx
	jmp	SHORT $L1446
$L1447:
	mov	edx, DWORD PTR _d$1445[ebp]
	sub	edx, 1
	mov	DWORD PTR _d$1445[ebp], edx
$L1446:
	cmp	DWORD PTR _d$1445[ebp], 0
	jle	SHORT $L1448
; Line 1234
	mov	eax, DWORD PTR _charno$[ebp]
	imul	eax, 10					; 0000000aH
	mov	DWORD PTR _charno$[ebp], eax
; Line 1236
	jmp	SHORT $L1447
$L1448:
; Line 1238
	mov	ecx, DWORD PTR _num$[ebp]
	add	ecx, DWORD PTR _charno$[ebp]
	mov	DWORD PTR _num$[ebp], ecx
; Line 1239
	jmp	SHORT $L1443
$L1444:
; Line 1240
	mov	eax, DWORD PTR _num$[ebp]
; Line 1241
	mov	esp, ebp
	pop	ebp
	ret	4
?AOACharToDecimal@AOAProtected@@QAEHQAD@Z ENDP		; AOAProtected::AOACharToDecimal
_TEXT	ENDS
PUBLIC	?AOAChartoIP@AOAProtected@@QAEXQAD0@Z		; AOAProtected::AOAChartoIP
_TEXT	SEGMENT
_ip$ = 8
_ipchar$ = 12
_this$ = -32
_temp$ = -4
_i$ = -8
_l$ = -20
_j$1462 = -24
_k$1463 = -28
?AOAChartoIP@AOAProtected@@QAEXQAD0@Z PROC NEAR		; AOAProtected::AOAChartoIP
; Line 1249
	push	ebp
	mov	ebp, esp
	sub	esp, 32					; 00000020H
	mov	DWORD PTR _this$[ebp], ecx
; Line 1252
	mov	DWORD PTR _l$[ebp], 0
; Line 1253
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1459
$L1460:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L1459:
	mov	ecx, DWORD PTR _ip$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	$L1461
; Line 1255
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _j$1462[ebp], eax
	mov	DWORD PTR _k$1463[ebp], 0
	jmp	SHORT $L1464
$L1465:
	mov	ecx, DWORD PTR _j$1462[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$1462[ebp], ecx
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
	mov	eax, DWORD PTR _k$1463[ebp]
	add	eax, 1
	mov	DWORD PTR _k$1463[ebp], eax
$L1464:
	mov	ecx, DWORD PTR _ip$[ebp]
	add	ecx, DWORD PTR _j$1462[ebp]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, 46					; 0000002eH
	je	SHORT $L1466
	mov	eax, DWORD PTR _ip$[ebp]
	add	eax, DWORD PTR _j$1462[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L1466
; Line 1257
	mov	edx, DWORD PTR _ip$[ebp]
	add	edx, DWORD PTR _j$1462[ebp]
	mov	eax, DWORD PTR _k$1463[ebp]
	mov	cl, BYTE PTR [edx]
	mov	BYTE PTR _temp$[ebp+eax], cl
; Line 1258
	jmp	SHORT $L1465
$L1466:
; Line 1259
	mov	edx, DWORD PTR _k$1463[ebp]
	mov	BYTE PTR _temp$[ebp+edx], 0
; Line 1260
	lea	eax, DWORD PTR _temp$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOACharToDecimal@AOAProtected@@QAEHQAD@Z ; AOAProtected::AOACharToDecimal
	mov	ecx, DWORD PTR _ipchar$[ebp]
	add	ecx, DWORD PTR _l$[ebp]
	mov	BYTE PTR [ecx], al
	mov	edx, DWORD PTR _l$[ebp]
	add	edx, 1
	mov	DWORD PTR _l$[ebp], edx
; Line 1261
	jmp	$L1460
$L1461:
; Line 1262
	mov	eax, DWORD PTR _ipchar$[ebp]
	add	eax, DWORD PTR _l$[ebp]
	mov	BYTE PTR [eax], 0
; Line 1263
	mov	esp, ebp
	pop	ebp
	ret	8
?AOAChartoIP@AOAProtected@@QAEXQAD0@Z ENDP		; AOAProtected::AOAChartoIP
_TEXT	ENDS
PUBLIC	?AOAcheckValidLinkChar@AOAProtected@@QAEHD@Z	; AOAProtected::AOAcheckValidLinkChar
_TEXT	SEGMENT
_ch$ = 8
_this$ = -8
_c$ = -4
?AOAcheckValidLinkChar@AOAProtected@@QAEHD@Z PROC NEAR	; AOAProtected::AOAcheckValidLinkChar
; Line 1271
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 1274
	mov	al, BYTE PTR _ch$[ebp]
	mov	BYTE PTR _c$[ebp], al
; Line 1276
	mov	ecx, DWORD PTR _c$[ebp]
	and	ecx, 255				; 000000ffH
	cmp	ecx, 97					; 00000061H
	jl	SHORT $L1474
	mov	edx, DWORD PTR _c$[ebp]
	and	edx, 255				; 000000ffH
	cmp	edx, 122				; 0000007aH
	jle	SHORT $L1473
$L1474:
	mov	eax, DWORD PTR _c$[ebp]
	and	eax, 255				; 000000ffH
	cmp	eax, 65					; 00000041H
	jl	SHORT $L1475
	mov	ecx, DWORD PTR _c$[ebp]
	and	ecx, 255				; 000000ffH
	cmp	ecx, 90					; 0000005aH
	jle	SHORT $L1473
$L1475:
	mov	edx, DWORD PTR _c$[ebp]
	and	edx, 255				; 000000ffH
	cmp	edx, 48					; 00000030H
	jl	SHORT $L1476
	mov	eax, DWORD PTR _c$[ebp]
	and	eax, 255				; 000000ffH
	cmp	eax, 57					; 00000039H
	jle	SHORT $L1473
$L1476:
	mov	ecx, DWORD PTR _c$[ebp]
	and	ecx, 255				; 000000ffH
	cmp	ecx, 46					; 0000002eH
	je	SHORT $L1473
	mov	edx, DWORD PTR _c$[ebp]
	and	edx, 255				; 000000ffH
	cmp	edx, 45					; 0000002dH
	jne	SHORT $L1472
$L1473:
; Line 1277
	xor	eax, eax
	jmp	SHORT $L1477
$L1472:
; Line 1278
	or	eax, -1
$L1477:
; Line 1279
	mov	esp, ebp
	pop	ebp
	ret	4
?AOAcheckValidLinkChar@AOAProtected@@QAEHD@Z ENDP	; AOAProtected::AOAcheckValidLinkChar
_TEXT	ENDS
PUBLIC	?AOAStrLenAll@AOAProtected@@QAEHPAD@Z		; AOAProtected::AOAStrLenAll
_TEXT	SEGMENT
_str$ = 8
_this$ = -8
_len$ = -4
?AOAStrLenAll@AOAProtected@@QAEHPAD@Z PROC NEAR		; AOAProtected::AOAStrLenAll
; Line 1284
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 1286
	mov	DWORD PTR _len$[ebp], 0
$L1484:
; Line 1287
	mov	eax, DWORD PTR _str$[ebp]
	add	eax, DWORD PTR _len$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L1485
; Line 1289
	mov	edx, DWORD PTR _len$[ebp]
	add	edx, 1
	mov	DWORD PTR _len$[ebp], edx
; Line 1290
	jmp	SHORT $L1484
$L1485:
; Line 1291
	mov	eax, DWORD PTR _len$[ebp]
; Line 1292
	mov	esp, ebp
	pop	ebp
	ret	4
?AOAStrLenAll@AOAProtected@@QAEHPAD@Z ENDP		; AOAProtected::AOAStrLenAll
_TEXT	ENDS
PUBLIC	?AOAParseOneLine@AOAProtected@@QAEHPAD@Z	; AOAProtected::AOAParseOneLine
_TEXT	SEGMENT
_str$ = 8
_this$ = -8
_len$ = -4
?AOAParseOneLine@AOAProtected@@QAEHPAD@Z PROC NEAR	; AOAProtected::AOAParseOneLine
; Line 1297
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 1299
	mov	DWORD PTR _len$[ebp], 0
$L1492:
; Line 1300
	mov	eax, DWORD PTR _str$[ebp]
	add	eax, DWORD PTR _len$[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 13					; 0000000dH
	je	SHORT $L1493
	mov	edx, DWORD PTR _str$[ebp]
	add	edx, DWORD PTR _len$[ebp]
	movsx	eax, BYTE PTR [edx+1]
	cmp	eax, 10					; 0000000aH
	je	SHORT $L1493
; Line 1303
	mov	ecx, DWORD PTR _len$[ebp]
	add	ecx, 1
	mov	DWORD PTR _len$[ebp], ecx
; Line 1304
	jmp	SHORT $L1492
$L1493:
; Line 1305
	mov	eax, DWORD PTR _len$[ebp]
; Line 1306
	mov	esp, ebp
	pop	ebp
	ret	4
?AOAParseOneLine@AOAProtected@@QAEHPAD@Z ENDP		; AOAProtected::AOAParseOneLine
_TEXT	ENDS
PUBLIC	?AOAStrLen@AOAProtected@@QAEHPAD@Z		; AOAProtected::AOAStrLen
_TEXT	SEGMENT
_str$ = 8
_this$ = -8
_len$ = -4
?AOAStrLen@AOAProtected@@QAEHPAD@Z PROC NEAR		; AOAProtected::AOAStrLen
; Line 1314
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 1316
	mov	DWORD PTR _len$[ebp], 0
$L1500:
; Line 1319
	mov	eax, DWORD PTR _str$[ebp]
	add	eax, DWORD PTR _len$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L1501
	mov	edx, DWORD PTR _str$[ebp]
	add	edx, DWORD PTR _len$[ebp]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, 10					; 0000000aH
	je	SHORT $L1501
	mov	ecx, DWORD PTR _str$[ebp]
	add	ecx, DWORD PTR _len$[ebp]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, 13					; 0000000dH
	je	SHORT $L1501
; Line 1321
	mov	eax, DWORD PTR _len$[ebp]
	add	eax, 1
	mov	DWORD PTR _len$[ebp], eax
; Line 1322
	jmp	SHORT $L1500
$L1501:
; Line 1323
	mov	eax, DWORD PTR _len$[ebp]
; Line 1324
	mov	esp, ebp
	pop	ebp
	ret	4
?AOAStrLen@AOAProtected@@QAEHPAD@Z ENDP			; AOAProtected::AOAStrLen
_TEXT	ENDS
PUBLIC	?AOAStrRev@AOAProtected@@QAEXPAD@Z		; AOAProtected::AOAStrRev
_TEXT	SEGMENT
_str$ = 8
_this$ = -276
_len$ = -272
_str1$ = -256
_h$ = -260
_i$ = -264
_k$ = -268
?AOAStrRev@AOAProtected@@QAEXPAD@Z PROC NEAR		; AOAProtected::AOAStrRev
; Line 1331
	push	ebp
	mov	ebp, esp
	sub	esp, 276				; 00000114H
	mov	DWORD PTR _this$[ebp], ecx
; Line 1332
	mov	eax, DWORD PTR _str$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAStrLen@AOAProtected@@QAEHPAD@Z	; AOAProtected::AOAStrLen
	mov	DWORD PTR _len$[ebp], eax
; Line 1334
	mov	ecx, DWORD PTR _len$[ebp]
	mov	DWORD PTR _h$[ebp], ecx
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1510
$L1511:
	mov	edx, DWORD PTR _h$[ebp]
	sub	edx, 1
	mov	DWORD PTR _h$[ebp], edx
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L1510:
	cmp	DWORD PTR _h$[ebp], 0
	jle	SHORT $L1512
; Line 1336
	mov	ecx, DWORD PTR _str$[ebp]
	add	ecx, DWORD PTR _h$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	mov	al, BYTE PTR [ecx-1]
	mov	BYTE PTR _str1$[ebp+edx], al
; Line 1337
	jmp	SHORT $L1511
$L1512:
; Line 1338
	mov	ecx, DWORD PTR _i$[ebp]
	mov	BYTE PTR _str1$[ebp+ecx], 0
; Line 1339
	mov	DWORD PTR _k$[ebp], 0
$L1515:
; Line 1340
	mov	edx, DWORD PTR _k$[ebp]
	movsx	eax, BYTE PTR _str1$[ebp+edx]
	test	eax, eax
	je	SHORT $L1516
; Line 1342
	mov	ecx, DWORD PTR _str$[ebp]
	add	ecx, DWORD PTR _k$[ebp]
	mov	edx, DWORD PTR _k$[ebp]
	mov	al, BYTE PTR _str1$[ebp+edx]
	mov	BYTE PTR [ecx], al
; Line 1343
	mov	ecx, DWORD PTR _k$[ebp]
	add	ecx, 1
	mov	DWORD PTR _k$[ebp], ecx
; Line 1344
	jmp	SHORT $L1515
$L1516:
; Line 1345
	mov	edx, DWORD PTR _str$[ebp]
	add	edx, DWORD PTR _k$[ebp]
	mov	BYTE PTR [edx], 0
; Line 1346
	mov	esp, ebp
	pop	ebp
	ret	4
?AOAStrRev@AOAProtected@@QAEXPAD@Z ENDP			; AOAProtected::AOAStrRev
_TEXT	ENDS
PUBLIC	?AOADecimalToChar@AOAProtected@@QAEXHQAD@Z	; AOAProtected::AOADecimalToChar
_TEXT	SEGMENT
_num$ = 8
_nom$ = 12
_this$ = -8
_i$ = -4
?AOADecimalToChar@AOAProtected@@QAEXHQAD@Z PROC NEAR	; AOAProtected::AOADecimalToChar
; Line 1352
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 1353
	mov	DWORD PTR _i$[ebp], 0
$L1524:
; Line 1355
	cmp	DWORD PTR _num$[ebp], 0
	jle	SHORT $L1525
; Line 1357
	mov	eax, DWORD PTR _num$[ebp]
	cdq
	mov	ecx, 10					; 0000000aH
	idiv	ecx
	add	edx, 48					; 00000030H
	mov	eax, DWORD PTR _nom$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	mov	BYTE PTR [eax], dl
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
; Line 1358
	mov	eax, DWORD PTR _num$[ebp]
	cdq
	mov	ecx, 10					; 0000000aH
	idiv	ecx
	mov	DWORD PTR _num$[ebp], eax
; Line 1359
	jmp	SHORT $L1524
$L1525:
; Line 1361
	mov	edx, DWORD PTR _nom$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	mov	BYTE PTR [edx], 0
; Line 1362
	mov	eax, DWORD PTR _nom$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAStrRev@AOAProtected@@QAEXPAD@Z	; AOAProtected::AOAStrRev
; Line 1364
	mov	esp, ebp
	pop	ebp
	ret	8
?AOADecimalToChar@AOAProtected@@QAEXHQAD@Z ENDP		; AOAProtected::AOADecimalToChar
_TEXT	ENDS
PUBLIC	?AOAStrCat@AOAProtected@@QAEXPAD00@Z		; AOAProtected::AOAStrCat
_TEXT	SEGMENT
_str$ = 8
_str1$ = 12
_str2$ = 16
_this$ = -12
_i$ = -4
_j$ = -8
?AOAStrCat@AOAProtected@@QAEXPAD00@Z PROC NEAR		; AOAProtected::AOAStrCat
; Line 1370
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 1373
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1533
$L1534:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L1533:
	mov	ecx, DWORD PTR _str1$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	SHORT $L1535
; Line 1375
	mov	eax, DWORD PTR _str$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _str1$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	dl, BYTE PTR [ecx]
	mov	BYTE PTR [eax], dl
; Line 1376
	jmp	SHORT $L1534
$L1535:
; Line 1379
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L1537
$L1538:
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	DWORD PTR _j$[ebp], eax
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L1537:
	mov	edx, DWORD PTR _str2$[ebp]
	add	edx, DWORD PTR _j$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L1539
; Line 1381
	mov	ecx, DWORD PTR _str$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _str2$[ebp]
	add	edx, DWORD PTR _j$[ebp]
	mov	al, BYTE PTR [edx]
	mov	BYTE PTR [ecx], al
; Line 1382
	jmp	SHORT $L1538
$L1539:
; Line 1383
	mov	ecx, DWORD PTR _str$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	BYTE PTR [ecx], 0
; Line 1384
	mov	esp, ebp
	pop	ebp
	ret	12					; 0000000cH
?AOAStrCat@AOAProtected@@QAEXPAD00@Z ENDP		; AOAProtected::AOAStrCat
_TEXT	ENDS
PUBLIC	?AOAStrCat@AOAProtected@@QAEXPAD0H@Z		; AOAProtected::AOAStrCat
_TEXT	SEGMENT
_str1$ = 8
_str2$ = 12
_l2$ = 16
_this$ = -8
_i$ = -4
?AOAStrCat@AOAProtected@@QAEXPAD0H@Z PROC NEAR		; AOAProtected::AOAStrCat
; Line 1390
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 1391
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1547
$L1548:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L1547:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _l2$[ebp]
	jge	SHORT $L1549
; Line 1392
	mov	edx, DWORD PTR _str1$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _str2$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	mov	cl, BYTE PTR [eax]
	mov	BYTE PTR [edx], cl
	jmp	SHORT $L1548
$L1549:
; Line 1393
	mov	esp, ebp
	pop	ebp
	ret	12					; 0000000cH
?AOAStrCat@AOAProtected@@QAEXPAD0H@Z ENDP		; AOAProtected::AOAStrCat
_TEXT	ENDS
PUBLIC	?AOAUpper@AOAProtected@@QAEHD@Z			; AOAProtected::AOAUpper
_TEXT	SEGMENT
_c$ = 8
_this$ = -8
_u$ = -4
?AOAUpper@AOAProtected@@QAEHD@Z PROC NEAR		; AOAProtected::AOAUpper
; Line 1399
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 1402
	movsx	eax, BYTE PTR _c$[ebp]
	and	eax, 255				; 000000ffH
	mov	WORD PTR _u$[ebp], ax
; Line 1403
	mov	ecx, DWORD PTR _u$[ebp]
	and	ecx, 65535				; 0000ffffH
	cmp	ecx, 65					; 00000041H
	jl	SHORT $L1555
	mov	edx, DWORD PTR _u$[ebp]
	and	edx, 65535				; 0000ffffH
	cmp	edx, 90					; 0000005aH
	jg	SHORT $L1555
; Line 1404
	mov	eax, 1
	jmp	SHORT $L1556
$L1555:
; Line 1405
	xor	eax, eax
$L1556:
; Line 1406
	mov	esp, ebp
	pop	ebp
	ret	4
?AOAUpper@AOAProtected@@QAEHD@Z ENDP			; AOAProtected::AOAUpper
_TEXT	ENDS
PUBLIC	?AOALower@AOAProtected@@QAEHD@Z			; AOAProtected::AOALower
_TEXT	SEGMENT
_c$ = 8
_this$ = -8
_u$ = -4
?AOALower@AOAProtected@@QAEHD@Z PROC NEAR		; AOAProtected::AOALower
; Line 1412
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 1415
	movsx	eax, BYTE PTR _c$[ebp]
	and	eax, 255				; 000000ffH
	mov	WORD PTR _u$[ebp], ax
; Line 1416
	mov	ecx, DWORD PTR _u$[ebp]
	and	ecx, 65535				; 0000ffffH
	cmp	ecx, 97					; 00000061H
	jl	SHORT $L1562
	mov	edx, DWORD PTR _u$[ebp]
	and	edx, 65535				; 0000ffffH
	cmp	edx, 122				; 0000007aH
	jg	SHORT $L1562
; Line 1417
	mov	eax, 1
	jmp	SHORT $L1563
$L1562:
; Line 1418
	xor	eax, eax
$L1563:
; Line 1419
	mov	esp, ebp
	pop	ebp
	ret	4
?AOALower@AOAProtected@@QAEHD@Z ENDP			; AOAProtected::AOALower
_TEXT	ENDS
PUBLIC	?AOAPower@AOAProtected@@QAEKHH@Z		; AOAProtected::AOAPower
_TEXT	SEGMENT
_base$ = 8
_power$ = 12
_this$ = -12
_i$ = -8
_p$ = -4
?AOAPower@AOAProtected@@QAEKHH@Z PROC NEAR		; AOAProtected::AOAPower
; Line 1425
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 1426
	mov	DWORD PTR _i$[ebp], 0
; Line 1427
	mov	DWORD PTR _p$[ebp], 0
; Line 1429
	mov	DWORD PTR _p$[ebp], 1
; Line 1430
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1571
$L1572:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L1571:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _power$[ebp]
	jge	SHORT $L1573
; Line 1432
	mov	edx, DWORD PTR _p$[ebp]
	imul	edx, DWORD PTR _base$[ebp]
	mov	DWORD PTR _p$[ebp], edx
; Line 1433
	jmp	SHORT $L1572
$L1573:
; Line 1434
	mov	eax, DWORD PTR _p$[ebp]
; Line 1435
	mov	esp, ebp
	pop	ebp
	ret	8
?AOAPower@AOAProtected@@QAEKHH@Z ENDP			; AOAProtected::AOAPower
_TEXT	ENDS
PUBLIC	?AOASubStrCopy@AOAProtected@@QAEXPADPBDHHH@Z	; AOAProtected::AOASubStrCopy
_TEXT	SEGMENT
_field$ = 8
_arg1$ = 12
_start$ = 16
_end$ = 20
_outstart$ = 24
_this$ = -8
_j$ = -4
?AOASubStrCopy@AOAProtected@@QAEXPADPBDHHH@Z PROC NEAR	; AOAProtected::AOASubStrCopy
; Line 1440
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	esi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1441
	mov	DWORD PTR _j$[ebp], 0
$L1584:
; Line 1448
	mov	eax, DWORD PTR _start$[ebp]
	add	eax, DWORD PTR _j$[ebp]
	cmp	eax, DWORD PTR _end$[ebp]
	jg	SHORT $L1585
; Line 1450
	mov	ecx, DWORD PTR _start$[ebp]
	add	ecx, DWORD PTR _j$[ebp]
	mov	edx, DWORD PTR _outstart$[ebp]
	add	edx, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR _field$[ebp]
	mov	esi, DWORD PTR _arg1$[ebp]
	mov	cl, BYTE PTR [esi+ecx]
	mov	BYTE PTR [eax+edx], cl
; Line 1451
	mov	edx, DWORD PTR _j$[ebp]
	add	edx, 1
	mov	DWORD PTR _j$[ebp], edx
; Line 1452
	jmp	SHORT $L1584
$L1585:
; Line 1453
	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	20					; 00000014H
?AOASubStrCopy@AOAProtected@@QAEXPADPBDHHH@Z ENDP	; AOAProtected::AOASubStrCopy
_TEXT	ENDS
PUBLIC	?AOAStrCopy@AOAProtected@@QAEXPADPBDH@Z		; AOAProtected::AOAStrCopy
_TEXT	SEGMENT
_s1$ = 8
_s2$ = 12
_len$ = 16
_this$ = -8
_i$ = -4
?AOAStrCopy@AOAProtected@@QAEXPADPBDH@Z PROC NEAR	; AOAProtected::AOAStrCopy
; Line 1458
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 1459
	mov	DWORD PTR _i$[ebp], 0
$L1594:
; Line 1460
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _len$[ebp]
	jge	SHORT $L1595
; Line 1462
	mov	ecx, DWORD PTR _s1$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _s2$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	mov	al, BYTE PTR [edx]
	mov	BYTE PTR [ecx], al
; Line 1463
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
; Line 1464
	jmp	SHORT $L1594
$L1595:
; Line 1465
	mov	edx, DWORD PTR _s1$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	mov	BYTE PTR [edx], 0
; Line 1466
	mov	esp, ebp
	pop	ebp
	ret	12					; 0000000cH
?AOAStrCopy@AOAProtected@@QAEXPADPBDH@Z ENDP		; AOAProtected::AOAStrCopy
_TEXT	ENDS
PUBLIC	?AOAStrTrim@AOAProtected@@QAEXPADPBDH@Z		; AOAProtected::AOAStrTrim
_TEXT	SEGMENT
_s1$ = 8
_s2$ = 12
_len$ = 16
_this$ = -8
_i$ = -4
?AOAStrTrim@AOAProtected@@QAEXPADPBDH@Z PROC NEAR	; AOAProtected::AOAStrTrim
; Line 1471
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 1472
	mov	DWORD PTR _i$[ebp], 0
$L1604:
; Line 1474
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _len$[ebp]
	jge	SHORT $L1605
; Line 1477
	mov	ecx, DWORD PTR _s2$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, 32					; 00000020H
	jle	SHORT $L1606
	mov	eax, DWORD PTR _s2$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 126				; 0000007eH
	jg	SHORT $L1606
; Line 1480
	mov	edx, DWORD PTR _s1$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _s2$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	mov	cl, BYTE PTR [eax]
	mov	BYTE PTR [edx], cl
$L1606:
; Line 1484
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
; Line 1485
	jmp	SHORT $L1604
$L1605:
; Line 1486
	mov	eax, DWORD PTR _s1$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	mov	BYTE PTR [eax], 0
; Line 1487
	mov	esp, ebp
	pop	ebp
	ret	12					; 0000000cH
?AOAStrTrim@AOAProtected@@QAEXPADPBDH@Z ENDP		; AOAProtected::AOAStrTrim
_TEXT	ENDS
PUBLIC	?AOAStrCompare@AOAProtected@@QAEHPAD0HH@Z	; AOAProtected::AOAStrCompare
_TEXT	SEGMENT
_str1$ = 8
_str2$ = 12
_length$ = 16
_mixedcase$ = 20
_this$ = -24
_retcode$ = -4
_j$ = -12
_ch$ = -8
_u1$ = -16
_u2$ = -20
?AOAStrCompare@AOAProtected@@QAEHPAD0HH@Z PROC NEAR	; AOAProtected::AOAStrCompare
; Line 1499
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	mov	DWORD PTR _this$[ebp], ecx
; Line 1500
	mov	DWORD PTR _retcode$[ebp], 0
	mov	DWORD PTR _j$[ebp], 0
; Line 1501
	mov	BYTE PTR _ch$[ebp], 32			; 00000020H
; Line 1502
	mov	WORD PTR _u1$[ebp], 0
	mov	WORD PTR _u2$[ebp], 0
; Line 1504
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1505
	cmp	DWORD PTR _mixedcase$[ebp], 0
	jne	SHORT $L1619
; Line 1507
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L1620
$L1621:
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	DWORD PTR _j$[ebp], eax
$L1620:
	mov	ecx, DWORD PTR _j$[ebp]
	cmp	ecx, DWORD PTR _length$[ebp]
	jge	SHORT $L1622
; Line 1509
	mov	edx, DWORD PTR _str1$[ebp]
	add	edx, DWORD PTR _j$[ebp]
	movsx	eax, BYTE PTR [edx]
	mov	ecx, DWORD PTR _str2$[ebp]
	add	ecx, DWORD PTR _j$[ebp]
	movsx	edx, BYTE PTR [ecx]
	cmp	eax, edx
	jne	SHORT $L1623
; Line 1510
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1511
	jmp	SHORT $L1624
$L1623:
	mov	DWORD PTR _retcode$[ebp], -1
$L1624:
; Line 1512
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L1625
; Line 1513
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L1613
$L1625:
; Line 1514
	jmp	SHORT $L1621
$L1622:
; Line 1517
	jmp	$L1630
$L1619:
	cmp	DWORD PTR _mixedcase$[ebp], 1
	jne	$L1630
; Line 1519
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L1628
$L1629:
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	DWORD PTR _j$[ebp], eax
$L1628:
	mov	ecx, DWORD PTR _j$[ebp]
	cmp	ecx, DWORD PTR _length$[ebp]
	jge	$L1630
; Line 1521
	mov	edx, DWORD PTR _str1$[ebp]
	add	edx, DWORD PTR _j$[ebp]
	movsx	eax, BYTE PTR [edx]
	and	eax, 255				; 000000ffH
	mov	WORD PTR _u1$[ebp], ax
; Line 1522
	mov	ecx, DWORD PTR _str2$[ebp]
	add	ecx, DWORD PTR _j$[ebp]
	movsx	edx, BYTE PTR [ecx]
	and	edx, 255				; 000000ffH
	mov	WORD PTR _u2$[ebp], dx
; Line 1524
	mov	eax, DWORD PTR _str1$[ebp]
	add	eax, DWORD PTR _j$[ebp]
	mov	cl, BYTE PTR [eax]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAUpper@AOAProtected@@QAEHD@Z		; AOAProtected::AOAUpper
	cmp	eax, 1
	jne	SHORT $L1631
	mov	edx, DWORD PTR _str2$[ebp]
	add	edx, DWORD PTR _j$[ebp]
	mov	al, BYTE PTR [edx]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOALower@AOAProtected@@QAEHD@Z		; AOAProtected::AOALower
	cmp	eax, 1
	jne	SHORT $L1631
; Line 1527
	mov	ecx, DWORD PTR _u2$[ebp]
	and	ecx, 65535				; 0000ffffH
	sub	ecx, 32					; 00000020H
	mov	edx, DWORD PTR _u1$[ebp]
	and	edx, 65535				; 0000ffffH
	cmp	ecx, edx
	jne	SHORT $L1632
; Line 1528
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1529
	jmp	SHORT $L1633
$L1632:
	mov	DWORD PTR _retcode$[ebp], -1
$L1633:
; Line 1531
	jmp	SHORT $L1640
$L1631:
	mov	eax, DWORD PTR _str1$[ebp]
	add	eax, DWORD PTR _j$[ebp]
	mov	cl, BYTE PTR [eax]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOALower@AOAProtected@@QAEHD@Z		; AOAProtected::AOALower
	cmp	eax, 1
	jne	SHORT $L1635
	mov	edx, DWORD PTR _str2$[ebp]
	add	edx, DWORD PTR _j$[ebp]
	mov	al, BYTE PTR [edx]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAUpper@AOAProtected@@QAEHD@Z		; AOAProtected::AOAUpper
	cmp	eax, 1
	jne	SHORT $L1635
; Line 1534
	mov	ecx, DWORD PTR _u1$[ebp]
	and	ecx, 65535				; 0000ffffH
	sub	ecx, 32					; 00000020H
	mov	edx, DWORD PTR _u2$[ebp]
	and	edx, 65535				; 0000ffffH
	cmp	ecx, edx
	jne	SHORT $L1636
; Line 1535
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1536
	jmp	SHORT $L1637
$L1636:
	mov	DWORD PTR _retcode$[ebp], -1
$L1637:
; Line 1538
	jmp	SHORT $L1640
$L1635:
; Line 1541
	mov	eax, DWORD PTR _u1$[ebp]
	and	eax, 65535				; 0000ffffH
	mov	ecx, DWORD PTR _u2$[ebp]
	and	ecx, 65535				; 0000ffffH
	cmp	eax, ecx
	jne	SHORT $L1639
; Line 1542
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1543
	jmp	SHORT $L1640
$L1639:
	mov	DWORD PTR _retcode$[ebp], -1
$L1640:
; Line 1545
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L1641
; Line 1546
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	SHORT $L1613
$L1641:
; Line 1548
	jmp	$L1629
$L1630:
; Line 1550
	mov	eax, DWORD PTR _retcode$[ebp]
$L1613:
; Line 1551
	mov	esp, ebp
	pop	ebp
	ret	16					; 00000010H
?AOAStrCompare@AOAProtected@@QAEHPAD0HH@Z ENDP		; AOAProtected::AOAStrCompare
_TEXT	ENDS
PUBLIC	?AOAStrCompare@AOAProtected@@QAEHPAD0HHHHH@Z	; AOAProtected::AOAStrCompare
_TEXT	SEGMENT
_str1$ = 8
_str2$ = 12
_idxstart1$ = 16
_idxstop1$ = 20
_idxstart2$ = 24
_idxstop2$ = 28
_mixedcase$ = 32
_this$ = -36
_retcode$ = -4
_j$ = -24
_ch$ = -20
_u1$ = -28
_u2$ = -32
_length1$ = -16
_length2$ = -12
_length$ = -8
?AOAStrCompare@AOAProtected@@QAEHPAD0HHHHH@Z PROC NEAR	; AOAProtected::AOAStrCompare
; Line 1566
	push	ebp
	mov	ebp, esp
	sub	esp, 36					; 00000024H
	mov	DWORD PTR _this$[ebp], ecx
; Line 1567
	mov	DWORD PTR _retcode$[ebp], 0
	mov	DWORD PTR _j$[ebp], 0
; Line 1568
	mov	BYTE PTR _ch$[ebp], 32			; 00000020H
; Line 1569
	mov	WORD PTR _u1$[ebp], 0
	mov	WORD PTR _u2$[ebp], 0
; Line 1570
	mov	eax, DWORD PTR _idxstop1$[ebp]
	sub	eax, DWORD PTR _idxstart1$[ebp]
	mov	DWORD PTR _length1$[ebp], eax
; Line 1571
	mov	ecx, DWORD PTR _idxstop2$[ebp]
	sub	ecx, DWORD PTR _idxstart2$[ebp]
	mov	DWORD PTR _length2$[ebp], ecx
; Line 1572
	mov	DWORD PTR _length$[ebp], 0
; Line 1575
	mov	edx, DWORD PTR _length1$[ebp]
	cmp	edx, DWORD PTR _length2$[ebp]
	je	SHORT $L1660
	mov	DWORD PTR _retcode$[ebp], -1
; Line 1576
	jmp	SHORT $L1661
$L1660:
	mov	eax, DWORD PTR _length1$[ebp]
	mov	DWORD PTR _length$[ebp], eax
$L1661:
; Line 1578
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1579
	cmp	DWORD PTR _mixedcase$[ebp], 0
	jne	SHORT $L1662
; Line 1581
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L1663
$L1664:
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
$L1663:
	mov	edx, DWORD PTR _j$[ebp]
	cmp	edx, DWORD PTR _length$[ebp]
	jge	SHORT $L1665
; Line 1583
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, DWORD PTR _idxstart1$[ebp]
	mov	ecx, DWORD PTR _str1$[ebp]
	movsx	edx, BYTE PTR [ecx+eax]
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, DWORD PTR _idxstart2$[ebp]
	mov	ecx, DWORD PTR _str2$[ebp]
	movsx	eax, BYTE PTR [ecx+eax]
	cmp	edx, eax
	jne	SHORT $L1666
; Line 1584
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1585
	jmp	SHORT $L1667
$L1666:
	mov	DWORD PTR _retcode$[ebp], -1
$L1667:
; Line 1586
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L1668
; Line 1587
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L1651
$L1668:
; Line 1588
	jmp	SHORT $L1664
$L1665:
; Line 1591
	jmp	$L1673
$L1662:
	cmp	DWORD PTR _mixedcase$[ebp], 1
	jne	$L1673
; Line 1593
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L1671
$L1672:
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
$L1671:
	mov	edx, DWORD PTR _j$[ebp]
	cmp	edx, DWORD PTR _length$[ebp]
	jge	$L1673
; Line 1595
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, DWORD PTR _idxstart1$[ebp]
	mov	ecx, DWORD PTR _str1$[ebp]
	movsx	edx, BYTE PTR [ecx+eax]
	and	edx, 255				; 000000ffH
	mov	WORD PTR _u1$[ebp], dx
; Line 1596
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, DWORD PTR _idxstart2$[ebp]
	mov	ecx, DWORD PTR _str2$[ebp]
	movsx	edx, BYTE PTR [ecx+eax]
	and	edx, 255				; 000000ffH
	mov	WORD PTR _u2$[ebp], dx
; Line 1598
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, DWORD PTR _idxstart1$[ebp]
	mov	ecx, DWORD PTR _str1$[ebp]
	mov	dl, BYTE PTR [ecx+eax]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAUpper@AOAProtected@@QAEHD@Z		; AOAProtected::AOAUpper
	cmp	eax, 1
	jne	SHORT $L1674
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, DWORD PTR _idxstart2$[ebp]
	mov	ecx, DWORD PTR _str2$[ebp]
	mov	dl, BYTE PTR [ecx+eax]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOALower@AOAProtected@@QAEHD@Z		; AOAProtected::AOALower
	cmp	eax, 1
	jne	SHORT $L1674
; Line 1601
	mov	eax, DWORD PTR _u2$[ebp]
	and	eax, 65535				; 0000ffffH
	sub	eax, 32					; 00000020H
	mov	ecx, DWORD PTR _u1$[ebp]
	and	ecx, 65535				; 0000ffffH
	cmp	eax, ecx
	jne	SHORT $L1675
; Line 1602
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1603
	jmp	SHORT $L1676
$L1675:
	mov	DWORD PTR _retcode$[ebp], -1
$L1676:
; Line 1605
	jmp	$L1683
$L1674:
	mov	edx, DWORD PTR _j$[ebp]
	add	edx, DWORD PTR _idxstart1$[ebp]
	mov	eax, DWORD PTR _str1$[ebp]
	mov	cl, BYTE PTR [eax+edx]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOALower@AOAProtected@@QAEHD@Z		; AOAProtected::AOALower
	cmp	eax, 1
	jne	SHORT $L1678
	mov	edx, DWORD PTR _j$[ebp]
	add	edx, DWORD PTR _idxstart2$[ebp]
	mov	eax, DWORD PTR _str2$[ebp]
	mov	cl, BYTE PTR [eax+edx]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAUpper@AOAProtected@@QAEHD@Z		; AOAProtected::AOAUpper
	cmp	eax, 1
	jne	SHORT $L1678
; Line 1608
	mov	edx, DWORD PTR _u1$[ebp]
	and	edx, 65535				; 0000ffffH
	sub	edx, 32					; 00000020H
	mov	eax, DWORD PTR _u2$[ebp]
	and	eax, 65535				; 0000ffffH
	cmp	edx, eax
	jne	SHORT $L1679
; Line 1609
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1610
	jmp	SHORT $L1680
$L1679:
	mov	DWORD PTR _retcode$[ebp], -1
$L1680:
; Line 1612
	jmp	SHORT $L1683
$L1678:
; Line 1615
	mov	ecx, DWORD PTR _u1$[ebp]
	and	ecx, 65535				; 0000ffffH
	mov	edx, DWORD PTR _u2$[ebp]
	and	edx, 65535				; 0000ffffH
	cmp	ecx, edx
	jne	SHORT $L1682
; Line 1616
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1617
	jmp	SHORT $L1683
$L1682:
	mov	DWORD PTR _retcode$[ebp], -1
$L1683:
; Line 1619
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L1684
; Line 1620
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	SHORT $L1651
$L1684:
; Line 1622
	jmp	$L1672
$L1673:
; Line 1624
	mov	eax, DWORD PTR _retcode$[ebp]
$L1651:
; Line 1625
	mov	esp, ebp
	pop	ebp
	ret	28					; 0000001cH
?AOAStrCompare@AOAProtected@@QAEHPAD0HHHHH@Z ENDP	; AOAProtected::AOAStrCompare
_TEXT	ENDS
PUBLIC	?AOAindexOf@AOAProtected@@QAEHPADD@Z		; AOAProtected::AOAindexOf
_TEXT	SEGMENT
_str$ = 8
_c$ = 12
_this$ = -20
_retVal$ = -12
_found$ = -16
_len$ = -8
_ii$ = -4
?AOAindexOf@AOAProtected@@QAEHPADD@Z PROC NEAR		; AOAProtected::AOAindexOf
; Line 1632
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	mov	DWORD PTR _this$[ebp], ecx
; Line 1633
	mov	DWORD PTR _retVal$[ebp], -1
; Line 1634
	mov	DWORD PTR _found$[ebp], 0
; Line 1635
	mov	eax, DWORD PTR _str$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAStrLen@AOAProtected@@QAEHPAD@Z	; AOAProtected::AOAStrLen
	mov	DWORD PTR _len$[ebp], eax
; Line 1637
	mov	DWORD PTR _ii$[ebp], 0
	jmp	SHORT $L1694
$L1695:
	mov	ecx, DWORD PTR _ii$[ebp]
	add	ecx, 1
	mov	DWORD PTR _ii$[ebp], ecx
$L1694:
	mov	edx, DWORD PTR _ii$[ebp]
	cmp	edx, DWORD PTR _len$[ebp]
	jge	SHORT $L1696
; Line 1638
	mov	eax, DWORD PTR _str$[ebp]
	add	eax, DWORD PTR _ii$[ebp]
	movsx	ecx, BYTE PTR [eax]
	movsx	edx, BYTE PTR _c$[ebp]
	cmp	ecx, edx
	jne	SHORT $L1697
	cmp	DWORD PTR _found$[ebp], 1
	je	SHORT $L1697
; Line 1639
	mov	eax, DWORD PTR _ii$[ebp]
	mov	DWORD PTR _retVal$[ebp], eax
	mov	DWORD PTR _found$[ebp], 1
$L1697:
; Line 1640
	cmp	DWORD PTR _found$[ebp], 1
	jne	SHORT $L1698
	jmp	SHORT $L1696
$L1698:
; Line 1641
	jmp	SHORT $L1695
$L1696:
; Line 1643
	mov	eax, DWORD PTR _retVal$[ebp]
; Line 1644
	mov	esp, ebp
	pop	ebp
	ret	8
?AOAindexOf@AOAProtected@@QAEHPADD@Z ENDP		; AOAProtected::AOAindexOf
_TEXT	ENDS
PUBLIC	?AOAsubstring@AOAProtected@@QAEPADPAD0H@Z	; AOAProtected::AOAsubstring
_TEXT	SEGMENT
_str$ = 8
_substr$ = 12
_index$ = 16
_this$ = -16
_len$ = -8
_cntr$ = -4
_ii$1708 = -12
?AOAsubstring@AOAProtected@@QAEPADPAD0H@Z PROC NEAR	; AOAProtected::AOAsubstring
; Line 1649
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	mov	DWORD PTR _this$[ebp], ecx
; Line 1650
	mov	eax, DWORD PTR _str$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAStrLen@AOAProtected@@QAEHPAD@Z	; AOAProtected::AOAStrLen
	mov	DWORD PTR _len$[ebp], eax
; Line 1651
	mov	DWORD PTR _cntr$[ebp], 0
; Line 1653
	mov	ecx, DWORD PTR _len$[ebp]
	cmp	ecx, DWORD PTR _index$[ebp]
	jle	SHORT $L1711
; Line 1654
	mov	edx, DWORD PTR _index$[ebp]
	mov	DWORD PTR _ii$1708[ebp], edx
	jmp	SHORT $L1709
$L1710:
	mov	eax, DWORD PTR _ii$1708[ebp]
	add	eax, 1
	mov	DWORD PTR _ii$1708[ebp], eax
$L1709:
	mov	ecx, DWORD PTR _ii$1708[ebp]
	cmp	ecx, DWORD PTR _len$[ebp]
	jge	SHORT $L1711
; Line 1656
	mov	edx, DWORD PTR _substr$[ebp]
	add	edx, DWORD PTR _cntr$[ebp]
	mov	eax, DWORD PTR _str$[ebp]
	add	eax, DWORD PTR _ii$1708[ebp]
	mov	cl, BYTE PTR [eax]
	mov	BYTE PTR [edx], cl
	mov	edx, DWORD PTR _cntr$[ebp]
	add	edx, 1
	mov	DWORD PTR _cntr$[ebp], edx
; Line 1657
	jmp	SHORT $L1710
$L1711:
; Line 1658
	mov	eax, DWORD PTR _substr$[ebp]
	add	eax, DWORD PTR _cntr$[ebp]
	mov	BYTE PTR [eax], 0
; Line 1660
	mov	eax, DWORD PTR _substr$[ebp]
; Line 1661
	mov	esp, ebp
	pop	ebp
	ret	12					; 0000000cH
?AOAsubstring@AOAProtected@@QAEPADPAD0H@Z ENDP		; AOAProtected::AOAsubstring
_TEXT	ENDS
PUBLIC	?AOAGetText@AOAProtected@@QAEXPAD@Z		; AOAProtected::AOAGetText
_TEXT	SEGMENT
_str$ = 8
_this$ = -24
_i$ = -20
_temp1$ = -8
_a$ = -4
_charpos$ = -16
?AOAGetText@AOAProtected@@QAEXPAD@Z PROC NEAR		; AOAProtected::AOAGetText
; Line 1668
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	mov	DWORD PTR _this$[ebp], ecx
; Line 1669
	mov	DWORD PTR _i$[ebp], 0
; Line 1670
	mov	BYTE PTR _a$[ebp], 0
$L1722:
; Line 1672
	movsx	eax, BYTE PTR _a$[ebp]
	cmp	eax, 27					; 0000001bH
	je	$L1723
; Line 1674
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	BYTE PTR _a$[ebp], al
; Line 1675
	movsx	ecx, BYTE PTR _a$[ebp]
	cmp	ecx, 8
	jne	SHORT $L1724
; Line 1677
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCursor@AOAProtected@@QAEHXZ	; AOAProtected::AOAgetCursor
	mov	DWORD PTR _charpos$[ebp], eax
; Line 1678
	mov	edx, DWORD PTR _charpos$[ebp]
	sub	edx, 1
	mov	DWORD PTR _charpos$[ebp], edx
; Line 1679
	mov	eax, DWORD PTR _charpos$[ebp]
	shl	eax, 1
	push	eax
	push	32					; 00000020H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintCharacter@AOAProtected@@QAEHDH@Z ; AOAProtected::AOAprintCharacter
; Line 1680
	mov	ecx, DWORD PTR _charpos$[ebp]
	sub	ecx, 1
	mov	DWORD PTR _charpos$[ebp], ecx
; Line 1681
	mov	edx, DWORD PTR _charpos$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetCursor@AOAProtected@@QAEHH@Z	; AOAProtected::AOAsetCursor
; Line 1682
	mov	eax, DWORD PTR _charpos$[ebp]
	shl	eax, 1
	push	eax
	push	32					; 00000020H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintCharacter@AOAProtected@@QAEHDH@Z ; AOAProtected::AOAprintCharacter
; Line 1683
	mov	ecx, DWORD PTR _charpos$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetCursor@AOAProtected@@QAEHH@Z	; AOAProtected::AOAsetCursor
; Line 1684
	mov	edx, DWORD PTR _i$[ebp]
	sub	edx, 1
	mov	DWORD PTR _i$[ebp], edx
; Line 1686
	jmp	SHORT $L1727
$L1724:
	movsx	eax, BYTE PTR _a$[ebp]
	cmp	eax, 13					; 0000000dH
	jne	SHORT $L1726
; Line 1688
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCursor@AOAProtected@@QAEHXZ	; AOAProtected::AOAgetCursor
	mov	DWORD PTR _charpos$[ebp], eax
; Line 1689
	mov	eax, DWORD PTR _charpos$[ebp]
	cdq
	mov	ecx, 80					; 00000050H
	idiv	ecx
	mov	DWORD PTR _temp1$[ebp], edx
; Line 1690
	mov	edx, 80					; 00000050H
	sub	edx, DWORD PTR _temp1$[ebp]
	mov	eax, DWORD PTR _charpos$[ebp]
	add	eax, edx
	mov	DWORD PTR _charpos$[ebp], eax
; Line 1691
	mov	ecx, DWORD PTR _charpos$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetCursor@AOAProtected@@QAEHH@Z	; AOAProtected::AOAsetCursor
; Line 1692
	mov	edx, DWORD PTR _str$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	mov	BYTE PTR [edx], 10			; 0000000aH
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
; Line 1694
	jmp	SHORT $L1727
$L1726:
; Line 1697
	mov	ecx, DWORD PTR _str$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	dl, BYTE PTR _a$[ebp]
	mov	BYTE PTR [ecx], dl
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L1727:
; Line 1699
	jmp	$L1722
$L1723:
; Line 1700
	mov	ecx, DWORD PTR _str$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	BYTE PTR [ecx-1], 0
; Line 1701
	mov	esp, ebp
	pop	ebp
	ret	4
?AOAGetText@AOAProtected@@QAEXPAD@Z ENDP		; AOAProtected::AOAGetText
_TEXT	ENDS
PUBLIC	?AOAStrAppend@AOAProtected@@QAEXPAD0@Z		; AOAProtected::AOAStrAppend
_TEXT	SEGMENT
_str1$ = 8
_str2$ = 12
_this$ = -12
_len$ = -8
_j$ = -4
?AOAStrAppend@AOAProtected@@QAEXPAD0@Z PROC NEAR	; AOAProtected::AOAStrAppend
; Line 1706
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 1709
	mov	eax, DWORD PTR _str1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAStrLen@AOAProtected@@QAEHPAD@Z	; AOAProtected::AOAStrLen
	mov	DWORD PTR _len$[ebp], eax
; Line 1712
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L1735
$L1736:
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
$L1735:
	mov	edx, DWORD PTR _str2$[ebp]
	add	edx, DWORD PTR _j$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L1737
; Line 1714
	mov	ecx, DWORD PTR _len$[ebp]
	add	ecx, DWORD PTR _j$[ebp]
	mov	edx, DWORD PTR _str2$[ebp]
	add	edx, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR _str1$[ebp]
	mov	dl, BYTE PTR [edx]
	mov	BYTE PTR [eax+ecx], dl
; Line 1715
	jmp	SHORT $L1736
$L1737:
; Line 1716
	mov	eax, DWORD PTR _len$[ebp]
	add	eax, DWORD PTR _j$[ebp]
	mov	ecx, DWORD PTR _str1$[ebp]
	mov	BYTE PTR [ecx+eax], 0
; Line 1717
	mov	esp, ebp
	pop	ebp
	ret	8
?AOAStrAppend@AOAProtected@@QAEXPAD0@Z ENDP		; AOAProtected::AOAStrAppend
_TEXT	ENDS
PUBLIC	?AOAclearScreen@AOAProtected@@QAEXHH@Z		; AOAProtected::AOAclearScreen
_TEXT	SEGMENT
_sp$ = 8
_ep$ = 12
_this$ = -8
_i$ = -4
?AOAclearScreen@AOAProtected@@QAEXHH@Z PROC NEAR	; AOAProtected::AOAclearScreen
; Line 1722
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 1723
	mov	eax, DWORD PTR _sp$[ebp]
	mov	DWORD PTR _i$[ebp], eax
	jmp	SHORT $L1744
$L1745:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 2
	mov	DWORD PTR _i$[ebp], ecx
$L1744:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _ep$[ebp]
	jge	SHORT $L1746
; Line 1725
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	push	32					; 00000020H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintCharacter@AOAProtected@@QAEHDH@Z ; AOAProtected::AOAprintCharacter
; Line 1726
	jmp	SHORT $L1745
$L1746:
; Line 1727
	mov	esp, ebp
	pop	ebp
	ret	8
?AOAclearScreen@AOAProtected@@QAEXHH@Z ENDP		; AOAProtected::AOAclearScreen
_TEXT	ENDS
PUBLIC	?AOAMemCopy@AOAProtected@@QAEHPAD0H@Z		; AOAProtected::AOAMemCopy
_TEXT	SEGMENT
_dest$ = 8
_src$ = 12
_length$ = 16
_this$ = -8
_i$ = -4
?AOAMemCopy@AOAProtected@@QAEHPAD0H@Z PROC NEAR		; AOAProtected::AOAMemCopy
; Line 1732
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 1733
	mov	DWORD PTR _i$[ebp], 0
; Line 1734
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1754
$L1755:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L1754:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _length$[ebp]
	jge	SHORT $L1756
; Line 1736
	mov	edx, DWORD PTR _dest$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _src$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	mov	cl, BYTE PTR [eax]
	mov	BYTE PTR [edx], cl
; Line 1737
	jmp	SHORT $L1755
$L1756:
; Line 1738
	xor	eax, eax
; Line 1739
	mov	esp, ebp
	pop	ebp
	ret	12					; 0000000cH
?AOAMemCopy@AOAProtected@@QAEHPAD0H@Z ENDP		; AOAProtected::AOAMemCopy
_TEXT	ENDS
PUBLIC	?AOAMsPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAMsPrintText
_DATA	SEGMENT
$SG1769	DB	'press space to next page', 00H
	ORG $+3
$SG1778	DB	'press space to next page', 00H
_DATA	ENDS
_TEXT	SEGMENT
_str$ = 8
_base$ = 12
_this$ = -12
_temp1$ = -4
_i$ = -8
?AOAMsPrintText@AOAProtected@@QAEXPADH@Z PROC NEAR	; AOAProtected::AOAMsPrintText
; Line 1745
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 1747
	push	3360					; 00000d20H
	push	320					; 00000140H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAclearScreen@AOAProtected@@QAEXHH@Z	; AOAProtected::AOAclearScreen
; Line 1748
	mov	eax, DWORD PTR _base$[ebp]
	cdq
	sub	eax, edx
	sar	eax, 1
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetCursor@AOAProtected@@QAEHH@Z	; AOAProtected::AOAsetCursor
; Line 1749
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1764
$L1765:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L1764:
	mov	ecx, DWORD PTR _str$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	$L1766
; Line 1751
	mov	eax, DWORD PTR _str$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 10					; 0000000aH
	jne	SHORT $L1767
; Line 1753
	mov	eax, DWORD PTR _base$[ebp]
	cdq
	mov	ecx, 160				; 000000a0H
	idiv	ecx
	mov	DWORD PTR _temp1$[ebp], edx
; Line 1754
	mov	edx, 160				; 000000a0H
	sub	edx, DWORD PTR _temp1$[ebp]
	mov	eax, DWORD PTR _base$[ebp]
	add	eax, edx
	mov	DWORD PTR _base$[ebp], eax
; Line 1755
	cmp	DWORD PTR _base$[ebp], 3200		; 00000c80H
	jl	SHORT $L1768
; Line 1757
	mov	DWORD PTR _base$[ebp], 320		; 00000140H
; Line 1758
	push	3240					; 00000ca8H
	push	24					; 00000018H
	push	OFFSET FLAT:$SG1769
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintString@AOAProtected@@QAEHPADHH@Z ; AOAProtected::AOAprintString
; Line 1759
	push	1644					; 0000066cH
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetCursor@AOAProtected@@QAEHH@Z	; AOAProtected::AOAsetCursor
$L1771:
; Line 1760
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	movsx	ecx, al
	cmp	ecx, 32					; 00000020H
	je	SHORT $L1772
	jmp	SHORT $L1771
$L1772:
; Line 1761
	push	3360					; 00000d20H
	push	320					; 00000140H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAclearScreen@AOAProtected@@QAEXHH@Z	; AOAProtected::AOAclearScreen
$L1768:
; Line 1764
	jmp	$L1777
$L1767:
	mov	edx, DWORD PTR _str$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, 9
	je	SHORT $L1775
	mov	ecx, DWORD PTR _str$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, 13					; 0000000dH
	jne	SHORT $L1774
$L1775:
; Line 1767
	jmp	SHORT $L1777
$L1774:
; Line 1769
	mov	eax, DWORD PTR _base$[ebp]
	push	eax
	mov	ecx, DWORD PTR _str$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	dl, BYTE PTR [ecx]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintCharacter@AOAProtected@@QAEHDH@Z ; AOAProtected::AOAprintCharacter
; Line 1770
	mov	eax, DWORD PTR _base$[ebp]
	add	eax, 2
	mov	DWORD PTR _base$[ebp], eax
; Line 1771
	cmp	DWORD PTR _base$[ebp], 3200		; 00000c80H
	jl	SHORT $L1777
; Line 1773
	mov	DWORD PTR _base$[ebp], 320		; 00000140H
; Line 1774
	push	3240					; 00000ca8H
	push	24					; 00000018H
	push	OFFSET FLAT:$SG1778
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintString@AOAProtected@@QAEHPADHH@Z ; AOAProtected::AOAprintString
; Line 1775
	push	1644					; 0000066cH
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetCursor@AOAProtected@@QAEHH@Z	; AOAProtected::AOAsetCursor
$L1780:
; Line 1776
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	movsx	ecx, al
	cmp	ecx, 32					; 00000020H
	je	SHORT $L1781
	jmp	SHORT $L1780
$L1781:
; Line 1777
	push	3360					; 00000d20H
	push	320					; 00000140H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAclearScreen@AOAProtected@@QAEXHH@Z	; AOAProtected::AOAclearScreen
$L1777:
; Line 1781
	jmp	$L1765
$L1766:
; Line 1782
	mov	eax, DWORD PTR _base$[ebp]
	cdq
	sub	eax, edx
	sar	eax, 1
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetCursor@AOAProtected@@QAEHH@Z	; AOAProtected::AOAsetCursor
; Line 1783
	mov	esp, ebp
	pop	ebp
	ret	8
?AOAMsPrintText@AOAProtected@@QAEXPADH@Z ENDP		; AOAProtected::AOAMsPrintText
_TEXT	ENDS
PUBLIC	?AOAMsPrintText@AOAProtected@@QAEXPAD@Z		; AOAProtected::AOAMsPrintText
_DATA	SEGMENT
	ORG $+3
$SG1795	DB	'press space to next page', 00H
	ORG $+3
$SG1804	DB	'press space to next page', 00H
_DATA	ENDS
_TEXT	SEGMENT
_str$ = 8
_this$ = -20
_charpos$ = -8
_temp1$ = -4
_base$ = -16
_i$ = -12
?AOAMsPrintText@AOAProtected@@QAEXPAD@Z PROC NEAR	; AOAProtected::AOAMsPrintText
; Line 1788
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	mov	DWORD PTR _this$[ebp], ecx
; Line 1790
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCursor@AOAProtected@@QAEHXZ	; AOAProtected::AOAgetCursor
	mov	DWORD PTR _charpos$[ebp], eax
; Line 1791
	mov	eax, DWORD PTR _charpos$[ebp]
	shl	eax, 1
	mov	DWORD PTR _base$[ebp], eax
; Line 1793
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1790
$L1791:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L1790:
	mov	edx, DWORD PTR _str$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	$L1792
; Line 1795
	mov	ecx, DWORD PTR _str$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, 10					; 0000000aH
	jne	SHORT $L1793
; Line 1797
	mov	eax, DWORD PTR _base$[ebp]
	cdq
	mov	ecx, 160				; 000000a0H
	idiv	ecx
	mov	DWORD PTR _temp1$[ebp], edx
; Line 1798
	mov	edx, 160				; 000000a0H
	sub	edx, DWORD PTR _temp1$[ebp]
	mov	eax, DWORD PTR _base$[ebp]
	add	eax, edx
	mov	DWORD PTR _base$[ebp], eax
; Line 1799
	cmp	DWORD PTR _base$[ebp], 3200		; 00000c80H
	jl	SHORT $L1794
; Line 1801
	mov	DWORD PTR _base$[ebp], 320		; 00000140H
; Line 1802
	push	3240					; 00000ca8H
	push	24					; 00000018H
	push	OFFSET FLAT:$SG1795
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintString@AOAProtected@@QAEHPADHH@Z ; AOAProtected::AOAprintString
; Line 1803
	push	1644					; 0000066cH
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetCursor@AOAProtected@@QAEHH@Z	; AOAProtected::AOAsetCursor
$L1797:
; Line 1804
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	movsx	ecx, al
	cmp	ecx, 32					; 00000020H
	je	SHORT $L1798
	jmp	SHORT $L1797
$L1798:
; Line 1805
	push	3360					; 00000d20H
	push	320					; 00000140H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAclearScreen@AOAProtected@@QAEXHH@Z	; AOAProtected::AOAclearScreen
$L1794:
; Line 1808
	jmp	$L1803
$L1793:
	mov	edx, DWORD PTR _str$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, 9
	je	SHORT $L1801
	mov	ecx, DWORD PTR _str$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, 13					; 0000000dH
	jne	SHORT $L1800
$L1801:
; Line 1811
	jmp	SHORT $L1803
$L1800:
; Line 1813
	mov	eax, DWORD PTR _base$[ebp]
	push	eax
	mov	ecx, DWORD PTR _str$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	dl, BYTE PTR [ecx]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintCharacter@AOAProtected@@QAEHDH@Z ; AOAProtected::AOAprintCharacter
; Line 1814
	mov	eax, DWORD PTR _base$[ebp]
	add	eax, 2
	mov	DWORD PTR _base$[ebp], eax
; Line 1815
	cmp	DWORD PTR _base$[ebp], 3200		; 00000c80H
	jl	SHORT $L1803
; Line 1817
	mov	DWORD PTR _base$[ebp], 320		; 00000140H
; Line 1818
	push	3240					; 00000ca8H
	push	24					; 00000018H
	push	OFFSET FLAT:$SG1804
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintString@AOAProtected@@QAEHPADHH@Z ; AOAProtected::AOAprintString
; Line 1819
	push	1644					; 0000066cH
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetCursor@AOAProtected@@QAEHH@Z	; AOAProtected::AOAsetCursor
$L1806:
; Line 1820
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	movsx	ecx, al
	cmp	ecx, 32					; 00000020H
	je	SHORT $L1807
	jmp	SHORT $L1806
$L1807:
; Line 1821
	push	3360					; 00000d20H
	push	320					; 00000140H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAclearScreen@AOAProtected@@QAEXHH@Z	; AOAProtected::AOAclearScreen
$L1803:
; Line 1824
	jmp	$L1791
$L1792:
; Line 1825
	mov	eax, DWORD PTR _base$[ebp]
	cdq
	sub	eax, edx
	sar	eax, 1
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetCursor@AOAProtected@@QAEHH@Z	; AOAProtected::AOAsetCursor
; Line 1826
	mov	esp, ebp
	pop	ebp
	ret	4
?AOAMsPrintText@AOAProtected@@QAEXPAD@Z ENDP		; AOAProtected::AOAMsPrintText
_TEXT	ENDS
PUBLIC	?AOAShortDelay@AOAProtected@@QAEHJ@Z		; AOAProtected::AOAShortDelay
EXTRN	_CShortDelay32:NEAR
_TEXT	SEGMENT
_Delay$ = 8
_this$ = -4
?AOAShortDelay@AOAProtected@@QAEHJ@Z PROC NEAR		; AOAProtected::AOAShortDelay
; Line 1829
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 1831
	mov	eax, DWORD PTR _Delay$[ebp]
	push	eax
	call	_CShortDelay32
	add	esp, 4
; Line 1833
	mov	esp, ebp
	pop	ebp
	ret	4
?AOAShortDelay@AOAProtected@@QAEHJ@Z ENDP		; AOAProtected::AOAShortDelay
_TEXT	ENDS
PUBLIC	?AOAStrMatch@AOAProtected@@QAEHHPAD0@Z		; AOAProtected::AOAStrMatch
_TEXT	SEGMENT
_start$ = 8
_str1$ = 12
_str2$ = 16
_this$ = -16
_match$ = -4
_i$ = -8
_j$1823 = -12
?AOAStrMatch@AOAProtected@@QAEHHPAD0@Z PROC NEAR	; AOAProtected::AOAStrMatch
; Line 1840
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	mov	DWORD PTR _this$[ebp], ecx
; Line 1841
	mov	BYTE PTR _match$[ebp], 0
; Line 1842
	mov	eax, DWORD PTR _start$[ebp]
	mov	DWORD PTR _i$[ebp], eax
	jmp	SHORT $L1820
$L1821:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L1820:
	mov	edx, DWORD PTR _str1$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L1822
; Line 1844
	mov	DWORD PTR _j$1823[ebp], 0
	jmp	SHORT $L1824
$L1825:
	mov	ecx, DWORD PTR _j$1823[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$1823[ebp], ecx
$L1824:
	mov	edx, DWORD PTR _str2$[ebp]
	add	edx, DWORD PTR _j$1823[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L1826
; Line 1846
	mov	ecx, DWORD PTR _str2$[ebp]
	add	ecx, DWORD PTR _j$1823[ebp]
	movsx	edx, BYTE PTR [ecx]
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, DWORD PTR _j$1823[ebp]
	mov	ecx, DWORD PTR _str1$[ebp]
	movsx	eax, BYTE PTR [ecx+eax]
	cmp	edx, eax
	jne	SHORT $L1827
; Line 1847
	mov	BYTE PTR _match$[ebp], 1
; Line 1848
	jmp	SHORT $L1828
$L1827:
; Line 1850
	mov	BYTE PTR _match$[ebp], 0
; Line 1851
	jmp	SHORT $L1826
$L1828:
; Line 1853
	jmp	SHORT $L1825
$L1826:
; Line 1854
	mov	ecx, DWORD PTR _match$[ebp]
	and	ecx, 255				; 000000ffH
	test	ecx, ecx
	je	SHORT $L1829
; Line 1856
	mov	eax, DWORD PTR _i$[ebp]
	jmp	SHORT $L1817
$L1829:
; Line 1858
	jmp	SHORT $L1821
$L1822:
; Line 1859
	or	eax, -1
$L1817:
; Line 1860
	mov	esp, ebp
	pop	ebp
	ret	12					; 0000000cH
?AOAStrMatch@AOAProtected@@QAEHHPAD0@Z ENDP		; AOAProtected::AOAStrMatch
_TEXT	ENDS
PUBLIC	?AOAgetGDTEntry@AOAProtected@@QAEHPAJ0H@Z	; AOAProtected::AOAgetGDTEntry
EXTRN	_CgetGDTEntry32:NEAR
_TEXT	SEGMENT
_desch$ = 8
_descl$ = 12
_GDTIndex$ = 16
_this$ = -4
?AOAgetGDTEntry@AOAProtected@@QAEHPAJ0H@Z PROC NEAR	; AOAProtected::AOAgetGDTEntry
; Line 1863
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 1864
	mov	eax, DWORD PTR _GDTIndex$[ebp]
	push	eax
	mov	ecx, DWORD PTR _descl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _desch$[ebp]
	push	edx
	call	_CgetGDTEntry32
	add	esp, 12					; 0000000cH
; Line 1865
	mov	esp, ebp
	pop	ebp
	ret	12					; 0000000cH
?AOAgetGDTEntry@AOAProtected@@QAEHPAJ0H@Z ENDP		; AOAProtected::AOAgetGDTEntry
_TEXT	ENDS
PUBLIC	?AOAsetGDTEntry@AOAProtected@@QAEHPAJ0H@Z	; AOAProtected::AOAsetGDTEntry
EXTRN	_CsetGDTEntry32:NEAR
_TEXT	SEGMENT
_desch$ = 8
_descl$ = 12
_GDTIndex$ = 16
_this$ = -4
?AOAsetGDTEntry@AOAProtected@@QAEHPAJ0H@Z PROC NEAR	; AOAProtected::AOAsetGDTEntry
; Line 1868
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 1869
	mov	eax, DWORD PTR _GDTIndex$[ebp]
	push	eax
	mov	ecx, DWORD PTR _descl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _desch$[ebp]
	push	edx
	call	_CsetGDTEntry32
	add	esp, 12					; 0000000cH
; Line 1870
	mov	esp, ebp
	pop	ebp
	ret	12					; 0000000cH
?AOAsetGDTEntry@AOAProtected@@QAEHPAJ0H@Z ENDP		; AOAProtected::AOAsetGDTEntry
_TEXT	ENDS
PUBLIC	?AOAgetIDTEntry@AOAProtected@@QAEHPAJ0H@Z	; AOAProtected::AOAgetIDTEntry
EXTRN	_CgetIDTEntry32:NEAR
_TEXT	SEGMENT
_desch$ = 8
_descl$ = 12
_IDTIndex$ = 16
_this$ = -4
?AOAgetIDTEntry@AOAProtected@@QAEHPAJ0H@Z PROC NEAR	; AOAProtected::AOAgetIDTEntry
; Line 1873
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 1874
	mov	eax, DWORD PTR _IDTIndex$[ebp]
	push	eax
	mov	ecx, DWORD PTR _descl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _desch$[ebp]
	push	edx
	call	_CgetIDTEntry32
	add	esp, 12					; 0000000cH
; Line 1875
	mov	esp, ebp
	pop	ebp
	ret	12					; 0000000cH
?AOAgetIDTEntry@AOAProtected@@QAEHPAJ0H@Z ENDP		; AOAProtected::AOAgetIDTEntry
_TEXT	ENDS
PUBLIC	?AOAsetIDTEntry@AOAProtected@@QAEHPAJ0H@Z	; AOAProtected::AOAsetIDTEntry
EXTRN	_CsetIDTEntry32:NEAR
_TEXT	SEGMENT
_desch$ = 8
_descl$ = 12
_IDTIndex$ = 16
_this$ = -4
?AOAsetIDTEntry@AOAProtected@@QAEHPAJ0H@Z PROC NEAR	; AOAProtected::AOAsetIDTEntry
; Line 1878
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 1879
	mov	eax, DWORD PTR _IDTIndex$[ebp]
	push	eax
	mov	ecx, DWORD PTR _descl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _desch$[ebp]
	push	edx
	call	_CsetIDTEntry32
	add	esp, 12					; 0000000cH
; Line 1880
	mov	esp, ebp
	pop	ebp
	ret	12					; 0000000cH
?AOAsetIDTEntry@AOAProtected@@QAEHPAJ0H@Z ENDP		; AOAProtected::AOAsetIDTEntry
_TEXT	ENDS
PUBLIC	?AOAsetTimerPeriod@AOAProtected@@QAEXH@Z	; AOAProtected::AOAsetTimerPeriod
_TEXT	SEGMENT
_value$ = 8
_this$ = -16
_n$ = -12
_ln$ = -8
_hn$ = -4
?AOAsetTimerPeriod@AOAProtected@@QAEXH@Z PROC NEAR	; AOAProtected::AOAsetTimerPeriod
; Line 1884
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1885
	mov	WORD PTR _n$[ebp], 65535		; 0000ffffH
; Line 1886
	mov	eax, DWORD PTR _n$[ebp]
	and	eax, 65535				; 0000ffffH
	cdq
	idiv	DWORD PTR _value$[ebp]
	mov	WORD PTR _n$[ebp], ax
; Line 1887
	push	800					; 00000320H
	mov	eax, DWORD PTR _n$[ebp]
	and	eax, 65535				; 0000ffffH
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1888
	mov	ecx, DWORD PTR _n$[ebp]
	and	ecx, 65535				; 0000ffffH
	and	ecx, 255				; 000000ffH
	mov	BYTE PTR _ln$[ebp], cl
; Line 1889
	mov	edx, DWORD PTR _n$[ebp]
	and	edx, 65535				; 0000ffffH
	sar	edx, 8
	and	edx, 255				; 000000ffH
	mov	BYTE PTR _hn$[ebp], dl
; Line 1892
	cli
; Line 1893
	push	eax
; Line 1894
	push	edx
; Line 1896
	xor	edx, edx
; Line 1897
	xor	eax, eax
; Line 1899
	mov	dx, 67					; 00000043H
; Line 1900
	mov	al, 60					; 0000003cH
; Line 1901
	out	dx, al
; Line 1902
	mov	dx, 64					; 00000040H
; Line 1903
	mov	al, BYTE PTR _ln$[ebp]
; Line 1904
	out	dx, al
; Line 1905
	mov	al, BYTE PTR _hn$[ebp]
; Line 1906
	out	dx, al
; Line 1908
	pop	edx
; Line 1909
	pop	eax
; Line 1910
	sti
; Line 1913
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?AOAsetTimerPeriod@AOAProtected@@QAEXH@Z ENDP		; AOAProtected::AOAsetTimerPeriod
_TEXT	ENDS
PUBLIC	?AOAInitTrace@AOAProtected@@QAEXH@Z		; AOAProtected::AOAInitTrace
_TEXT	SEGMENT
_lineno$ = 8
_this$ = -4
?AOAInitTrace@AOAProtected@@QAEXH@Z PROC NEAR		; AOAProtected::AOAInitTrace
; Line 1919
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 1920
	mov	eax, DWORD PTR _lineno$[ebp]
	mov	DWORD PTR ?LineNumber@AOAProtected@@2HA, eax ; AOAProtected::LineNumber
; Line 1921
	mov	ecx, DWORD PTR ?LineNumber@AOAProtected@@2HA ; AOAProtected::LineNumber
	imul	ecx, 160				; 000000a0H
	mov	DWORD PTR ?PosCount@AOAProtected@@2HA, ecx ; AOAProtected::PosCount
; Line 1923
	mov	esp, ebp
	pop	ebp
	ret	4
?AOAInitTrace@AOAProtected@@QAEXH@Z ENDP		; AOAProtected::AOAInitTrace
_TEXT	ENDS
PUBLIC	?AOAClearTrace@AOAProtected@@QAEXXZ		; AOAProtected::AOAClearTrace
_TEXT	SEGMENT
_this$ = -8
_i$ = -4
?AOAClearTrace@AOAProtected@@QAEXXZ PROC NEAR		; AOAProtected::AOAClearTrace
; Line 1929
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 1932
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1869
$L1870:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L1869:
	mov	eax, DWORD PTR ?PosCount@AOAProtected@@2HA ; AOAProtected::PosCount
	cdq
	sub	eax, edx
	sar	eax, 1
	cmp	DWORD PTR _i$[ebp], eax
	jge	SHORT $L1871
; Line 1934
	mov	ecx, DWORD PTR ?LineNumber@AOAProtected@@2HA ; AOAProtected::LineNumber
	imul	ecx, 160				; 000000a0H
	mov	edx, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [ecx+edx*2]
	push	eax
	push	32					; 00000020H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintCharacter@AOAProtected@@QAEHDH@Z ; AOAProtected::AOAprintCharacter
; Line 1935
	jmp	SHORT $L1870
$L1871:
; Line 1936
	mov	ecx, DWORD PTR ?LineNumber@AOAProtected@@2HA ; AOAProtected::LineNumber
	imul	ecx, 160				; 000000a0H
	mov	DWORD PTR ?PosCount@AOAProtected@@2HA, ecx ; AOAProtected::PosCount
; Line 1939
	mov	esp, ebp
	pop	ebp
	ret	0
?AOAClearTrace@AOAProtected@@QAEXXZ ENDP		; AOAProtected::AOAClearTrace
_TEXT	ENDS
PUBLIC	?AOAPrintCharacterTrace@AOAProtected@@QAEXD@Z	; AOAProtected::AOAPrintCharacterTrace
_TEXT	SEGMENT
_c$ = 8
_this$ = -4
?AOAPrintCharacterTrace@AOAProtected@@QAEXD@Z PROC NEAR	; AOAProtected::AOAPrintCharacterTrace
; Line 1944
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 1945
	mov	eax, DWORD PTR ?PosCount@AOAProtected@@2HA ; AOAProtected::PosCount
	push	eax
	mov	cl, BYTE PTR _c$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintCharacter@AOAProtected@@QAEHDH@Z ; AOAProtected::AOAprintCharacter
; Line 1946
	mov	edx, DWORD PTR ?PosCount@AOAProtected@@2HA ; AOAProtected::PosCount
	add	edx, 2
	mov	DWORD PTR ?PosCount@AOAProtected@@2HA, edx ; AOAProtected::PosCount
; Line 1948
	mov	esp, ebp
	pop	ebp
	ret	4
?AOAPrintCharacterTrace@AOAProtected@@QAEXD@Z ENDP	; AOAProtected::AOAPrintCharacterTrace
_TEXT	ENDS
PUBLIC	?AOAsetISR@AOAProtected@@QAEHJJK@Z		; AOAProtected::AOAsetISR
_TEXT	SEGMENT
_GDTDescNo$ = 8
_IDTDescNo$ = 12
_FunctionAddress$ = 16
_this$ = -24
_GDTIndex$ = -8
_deschg$ = -12
_desclg$ = -16
_tem$ = -4
_Selector$ = -20
?AOAsetISR@AOAProtected@@QAEHJJK@Z PROC NEAR		; AOAProtected::AOAsetISR
; Line 1955
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	mov	DWORD PTR _this$[ebp], ecx
; Line 1956
	mov	eax, DWORD PTR _GDTDescNo$[ebp]
	mov	DWORD PTR _GDTIndex$[ebp], eax
; Line 1960
	mov	DWORD PTR _tem$[ebp], 0
; Line 1964
	mov	ecx, DWORD PTR _GDTIndex$[ebp]
	push	ecx
	lea	edx, DWORD PTR _desclg$[ebp]
	push	edx
	lea	eax, DWORD PTR _deschg$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetGDTEntry@AOAProtected@@QAEHPAJ0H@Z ; AOAProtected::AOAgetGDTEntry
; Line 1966
	mov	DWORD PTR _deschg$[ebp], 0
; Line 1967
	mov	ecx, DWORD PTR _desclg$[ebp]
	and	ecx, 15793920				; 00f0ff00H
	mov	DWORD PTR _desclg$[ebp], ecx
; Line 1968
	mov	DWORD PTR _tem$[ebp], 0
; Line 1970
	mov	edx, DWORD PTR _tem$[ebp]
	or	edx, 1114112				; 00110000H
	mov	DWORD PTR _tem$[ebp], edx
; Line 1972
	mov	eax, DWORD PTR _tem$[ebp]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, DWORD PTR _deschg$[ebp]
	or	ecx, eax
	mov	DWORD PTR _deschg$[ebp], ecx
; Line 1973
	mov	edx, DWORD PTR _deschg$[ebp]
	or	edx, 65535				; 0000ffffH
	mov	DWORD PTR _deschg$[ebp], edx
; Line 1974
	mov	eax, DWORD PTR _tem$[ebp]
	and	eax, -16777216				; ff000000H
	mov	ecx, DWORD PTR _desclg$[ebp]
	or	ecx, eax
	mov	DWORD PTR _desclg$[ebp], ecx
; Line 1975
	mov	edx, DWORD PTR _desclg$[ebp]
	or	edx, 983040				; 000f0000H
	mov	DWORD PTR _desclg$[ebp], edx
; Line 1976
	mov	eax, DWORD PTR _tem$[ebp]
	shr	eax, 16					; 00000010H
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _desclg$[ebp]
	or	ecx, eax
	mov	DWORD PTR _desclg$[ebp], ecx
; Line 1978
	mov	edx, DWORD PTR _desclg$[ebp]
	or	edx, 8388608				; 00800000H
	mov	DWORD PTR _desclg$[ebp], edx
; Line 1980
	mov	eax, DWORD PTR _GDTIndex$[ebp]
	push	eax
	lea	ecx, DWORD PTR _desclg$[ebp]
	push	ecx
	lea	edx, DWORD PTR _deschg$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetGDTEntry@AOAProtected@@QAEHPAJ0H@Z ; AOAProtected::AOAsetGDTEntry
; Line 1983
	mov	eax, DWORD PTR _GDTIndex$[ebp]
	shl	eax, 3
	mov	DWORD PTR _Selector$[ebp], eax
; Line 1984
	mov	ecx, DWORD PTR _Selector$[ebp]
	shl	ecx, 16					; 00000010H
	and	ecx, -65536				; ffff0000H
	mov	DWORD PTR _Selector$[ebp], ecx
; Line 1985
	mov	DWORD PTR _tem$[ebp], 0
; Line 1986
	mov	edx, DWORD PTR _tem$[ebp]
	or	edx, DWORD PTR _FunctionAddress$[ebp]
	mov	DWORD PTR _tem$[ebp], edx
; Line 1989
	mov	eax, DWORD PTR _IDTDescNo$[ebp]
	push	eax
	lea	ecx, DWORD PTR _desclg$[ebp]
	push	ecx
	lea	edx, DWORD PTR _deschg$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetIDTEntry@AOAProtected@@QAEHPAJ0H@Z ; AOAProtected::AOAgetIDTEntry
; Line 1992
	mov	eax, DWORD PTR _desclg$[ebp]
	and	eax, 65535				; 0000ffffH
	mov	DWORD PTR _desclg$[ebp], eax
; Line 1993
	mov	ecx, DWORD PTR _tem$[ebp]
	and	ecx, -65536				; ffff0000H
	mov	edx, DWORD PTR _desclg$[ebp]
	or	edx, ecx
	mov	DWORD PTR _desclg$[ebp], edx
; Line 1994
	mov	eax, DWORD PTR _deschg$[ebp]
	and	eax, -65536				; ffff0000H
	mov	DWORD PTR _deschg$[ebp], eax
; Line 1995
	mov	ecx, DWORD PTR _tem$[ebp]
	and	ecx, 65535				; 0000ffffH
	mov	edx, DWORD PTR _deschg$[ebp]
	or	edx, ecx
	mov	DWORD PTR _deschg$[ebp], edx
; Line 1998
	mov	eax, DWORD PTR _deschg$[ebp]
	or	eax, DWORD PTR _Selector$[ebp]
	mov	DWORD PTR _deschg$[ebp], eax
; Line 2001
	mov	ecx, DWORD PTR _IDTDescNo$[ebp]
	push	ecx
	lea	edx, DWORD PTR _desclg$[ebp]
	push	edx
	lea	eax, DWORD PTR _deschg$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetIDTEntry@AOAProtected@@QAEHPAJ0H@Z ; AOAProtected::AOAsetIDTEntry
; Line 2002
	xor	eax, eax
; Line 2003
	mov	esp, ebp
	pop	ebp
	ret	12					; 0000000cH
?AOAsetISR@AOAProtected@@QAEHJJK@Z ENDP			; AOAProtected::AOAsetISR
_TEXT	ENDS
PUBLIC	?AOAconvertToPositive@AOAProtected@@QAEIH@Z	; AOAProtected::AOAconvertToPositive
_TEXT	SEGMENT
_number$ = 8
_this$ = -12
_value$ = -4
_mask$ = -8
?AOAconvertToPositive@AOAProtected@@QAEIH@Z PROC NEAR	; AOAProtected::AOAconvertToPositive
; Line 2009
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 2010
	mov	DWORD PTR _value$[ebp], 0
; Line 2011
	mov	DWORD PTR _mask$[ebp], 0
; Line 2013
	mov	eax, DWORD PTR _number$[ebp]
	not	eax
	mov	DWORD PTR _value$[ebp], eax
; Line 2014
	mov	ecx, DWORD PTR _value$[ebp]
	add	ecx, 1
	mov	DWORD PTR _value$[ebp], ecx
; Line 2015
	mov	eax, DWORD PTR _value$[ebp]
; Line 2016
	mov	esp, ebp
	pop	ebp
	ret	4
?AOAconvertToPositive@AOAProtected@@QAEIH@Z ENDP	; AOAProtected::AOAconvertToPositive
_TEXT	ENDS
PUBLIC	?AOAconvertCharToShort@AOAProtected@@QAEGPAD@Z	; AOAProtected::AOAconvertCharToShort
_TEXT	SEGMENT
_twochar$ = 8
_this$ = -12
_value$ = -4
_value1$ = -8
?AOAconvertCharToShort@AOAProtected@@QAEGPAD@Z PROC NEAR ; AOAProtected::AOAconvertCharToShort
; Line 2025
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 2034
	mov	WORD PTR _value$[ebp], 0
; Line 2035
	mov	WORD PTR _value1$[ebp], 0
; Line 2037
	mov	WORD PTR _value$[ebp], 0
; Line 2038
	mov	eax, DWORD PTR _twochar$[ebp]
	movsx	ecx, BYTE PTR [eax]
	and	ecx, 255				; 000000ffH
	mov	WORD PTR _value$[ebp], cx
; Line 2039
	mov	edx, DWORD PTR _value$[ebp]
	and	edx, 65535				; 0000ffffH
	shl	edx, 8
	mov	WORD PTR _value$[ebp], dx
; Line 2040
	mov	WORD PTR _value1$[ebp], 0
; Line 2041
	mov	eax, DWORD PTR _twochar$[ebp]
	movsx	ecx, BYTE PTR [eax+1]
	and	ecx, 255				; 000000ffH
	mov	WORD PTR _value1$[ebp], cx
; Line 2042
	mov	edx, DWORD PTR _value$[ebp]
	and	edx, 65535				; 0000ffffH
	mov	eax, DWORD PTR _value1$[ebp]
	and	eax, 65535				; 0000ffffH
	or	edx, eax
	mov	WORD PTR _value$[ebp], dx
; Line 2043
	mov	ax, WORD PTR _value$[ebp]
; Line 2044
	mov	esp, ebp
	pop	ebp
	ret	4
?AOAconvertCharToShort@AOAProtected@@QAEGPAD@Z ENDP	; AOAProtected::AOAconvertCharToShort
_TEXT	ENDS
PUBLIC	?AOAconvertDecimalCharsToInt@AOAProtected@@QAEIPAD@Z ; AOAProtected::AOAconvertDecimalCharsToInt
PUBLIC	?ValidDecimalDigit@AOAProtected@@QAE_ND@Z	; AOAProtected::ValidDecimalDigit
_TEXT	SEGMENT
_str$ = 8
_this$ = -24
_sum$ = -4
_c1$ = -8
_i$ = -12
_len$ = -16
_n$ = -20
?AOAconvertDecimalCharsToInt@AOAProtected@@QAEIPAD@Z PROC NEAR ; AOAProtected::AOAconvertDecimalCharsToInt
; Line 2067
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	push	esi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2068
	mov	DWORD PTR _sum$[ebp], 0
; Line 2070
	mov	DWORD PTR _i$[ebp], 0
; Line 2071
	mov	DWORD PTR _len$[ebp], 0
; Line 2072
	mov	DWORD PTR _n$[ebp], 0
; Line 2074
	mov	eax, DWORD PTR _str$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAStrLen@AOAProtected@@QAEHPAD@Z	; AOAProtected::AOAStrLen
	mov	DWORD PTR _len$[ebp], eax
; Line 2075
	mov	ecx, DWORD PTR _len$[ebp]
	sub	ecx, 1
	mov	DWORD PTR _n$[ebp], ecx
; Line 2076
	mov	DWORD PTR _sum$[ebp], 0
; Line 2078
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1908
$L1909:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L1908:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _len$[ebp]
	jge	SHORT $L1910
; Line 2080
	mov	ecx, DWORD PTR _str$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	dl, BYTE PTR [ecx]
	mov	BYTE PTR _c1$[ebp], dl
; Line 2081
	mov	al, BYTE PTR _c1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?ValidDecimalDigit@AOAProtected@@QAE_ND@Z ; AOAProtected::ValidDecimalDigit
	and	eax, 255				; 000000ffH
	test	eax, eax
	je	SHORT $L1911
; Line 2083
	mov	ecx, DWORD PTR _c1$[ebp]
	and	ecx, 255				; 000000ffH
	sub	ecx, 48					; 00000030H
	mov	BYTE PTR _c1$[ebp], cl
; Line 2084
	mov	esi, DWORD PTR _c1$[ebp]
	and	esi, 255				; 000000ffH
	mov	edx, DWORD PTR _n$[ebp]
	push	edx
	push	10					; 0000000aH
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPower@AOAProtected@@QAEKHH@Z	; AOAProtected::AOAPower
	imul	esi, eax
	mov	eax, DWORD PTR _sum$[ebp]
	add	eax, esi
	mov	DWORD PTR _sum$[ebp], eax
; Line 2085
	mov	ecx, DWORD PTR _n$[ebp]
	sub	ecx, 1
	mov	DWORD PTR _n$[ebp], ecx
; Line 2087
	jmp	SHORT $L1912
$L1911:
	or	eax, -1
	jmp	SHORT $L1902
$L1912:
; Line 2088
	jmp	SHORT $L1909
$L1910:
; Line 2090
	mov	eax, DWORD PTR _sum$[ebp]
$L1902:
; Line 2091
	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	4
?AOAconvertDecimalCharsToInt@AOAProtected@@QAEIPAD@Z ENDP ; AOAProtected::AOAconvertDecimalCharsToInt
_c1$ = 8
_this$ = -4
?ValidDecimalDigit@AOAProtected@@QAE_ND@Z PROC NEAR	; AOAProtected::ValidDecimalDigit
; Line 2096
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 2097
	movsx	eax, BYTE PTR _c1$[ebp]
	cmp	eax, 48					; 00000030H
	jl	SHORT $L1917
	movsx	ecx, BYTE PTR _c1$[ebp]
	cmp	ecx, 57					; 00000039H
	jg	SHORT $L1917
; Line 2098
	mov	al, 1
	jmp	SHORT $L1918
$L1917:
; Line 2099
	xor	al, al
$L1918:
; Line 2100
	mov	esp, ebp
	pop	ebp
	ret	4
?ValidDecimalDigit@AOAProtected@@QAE_ND@Z ENDP		; AOAProtected::ValidDecimalDigit
_TEXT	ENDS
PUBLIC	?AOAconvertChar4ToLong@AOAProtected@@QAEKPAD@Z	; AOAProtected::AOAconvertChar4ToLong
_TEXT	SEGMENT
_fourchar$ = 8
_this$ = -16
_sum$ = -4
_c1$ = -8
_i$ = -12
?AOAconvertChar4ToLong@AOAProtected@@QAEKPAD@Z PROC NEAR ; AOAProtected::AOAconvertChar4ToLong
; Line 2103
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	mov	DWORD PTR _this$[ebp], ecx
; Line 2104
	mov	DWORD PTR _sum$[ebp], 0
; Line 2106
	mov	DWORD PTR _i$[ebp], 0
; Line 2107
	push	3060					; 00000bf4H
	mov	eax, DWORD PTR _fourchar$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 2108
	mov	ecx, DWORD PTR _fourchar$[ebp]
	movsx	edx, BYTE PTR [ecx+3]
	sub	edx, 48					; 00000030H
	mov	DWORD PTR _sum$[ebp], edx
; Line 2109
	mov	DWORD PTR _i$[ebp], 2
	jmp	SHORT $L1926
$L1927:
	mov	eax, DWORD PTR _i$[ebp]
	sub	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L1926:
	cmp	DWORD PTR _i$[ebp], 0
	jge	SHORT $L1928
; Line 2111
	mov	ecx, DWORD PTR _fourchar$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	movsx	edx, BYTE PTR [ecx]
	sub	edx, 48					; 00000030H
	mov	BYTE PTR _c1$[ebp], dl
; Line 2112
	mov	eax, DWORD PTR _c1$[ebp]
	and	eax, 255				; 000000ffH
	push	eax
	push	10					; 0000000aH
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPower@AOAProtected@@QAEKHH@Z	; AOAProtected::AOAPower
	mov	ecx, DWORD PTR _sum$[ebp]
	add	ecx, eax
	mov	DWORD PTR _sum$[ebp], ecx
; Line 2113
	jmp	SHORT $L1927
$L1928:
; Line 2114
	mov	eax, DWORD PTR _sum$[ebp]
; Line 2115
	mov	esp, ebp
	pop	ebp
	ret	4
?AOAconvertChar4ToLong@AOAProtected@@QAEKPAD@Z ENDP	; AOAProtected::AOAconvertChar4ToLong
_TEXT	ENDS
PUBLIC	?AOAconvertBinaryToDecimal@AOAProtected@@QAEXIPAD@Z ; AOAProtected::AOAconvertBinaryToDecimal
_TEXT	SEGMENT
_value$ = 8
_decimaldigits$ = 12
_this$ = -12
_value1$ = -4
_i$ = -8
?AOAconvertBinaryToDecimal@AOAProtected@@QAEXIPAD@Z PROC NEAR ; AOAProtected::AOAconvertBinaryToDecimal
; Line 2139
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 2140
	mov	DWORD PTR _value1$[ebp], 0
; Line 2141
	mov	DWORD PTR _i$[ebp], 0
; Line 2143
	mov	eax, DWORD PTR _value$[ebp]
	mov	DWORD PTR _value1$[ebp], eax
; Line 2144
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1936
$L1937:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L1936:
	cmp	DWORD PTR _i$[ebp], 10			; 0000000aH
	jge	SHORT $L1938
; Line 2146
	mov	eax, DWORD PTR _value1$[ebp]
	xor	edx, edx
	mov	ecx, 10					; 0000000aH
	div	ecx
	add	edx, 48					; 00000030H
	mov	eax, 9
	sub	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _decimaldigits$[ebp]
	mov	BYTE PTR [ecx+eax], dl
; Line 2147
	mov	eax, DWORD PTR _value1$[ebp]
	xor	edx, edx
	mov	ecx, 10					; 0000000aH
	div	ecx
	mov	DWORD PTR _value1$[ebp], eax
; Line 2148
	jmp	SHORT $L1937
$L1938:
; Line 2150
	mov	edx, DWORD PTR _decimaldigits$[ebp]
	mov	BYTE PTR [edx+10], 0
; Line 2152
	mov	esp, ebp
	pop	ebp
	ret	8
?AOAconvertBinaryToDecimal@AOAProtected@@QAEXIPAD@Z ENDP ; AOAProtected::AOAconvertBinaryToDecimal
_TEXT	ENDS
PUBLIC	?AOAconvertDecimalToInt@AOAProtected@@QAEHPAD@Z	; AOAProtected::AOAconvertDecimalToInt
_TEXT	SEGMENT
_decimaldigits$ = 8
_this$ = -24
_value1$ = -16
_i$ = -20
_size$ = -8
_sum$ = -4
_c1$ = -12
?AOAconvertDecimalToInt@AOAProtected@@QAEHPAD@Z PROC NEAR ; AOAProtected::AOAconvertDecimalToInt
; Line 2158
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	push	ebx
	mov	DWORD PTR _this$[ebp], ecx
; Line 2159
	mov	DWORD PTR _value1$[ebp], 0
; Line 2160
	mov	DWORD PTR _i$[ebp], 0
; Line 2161
	mov	DWORD PTR _size$[ebp], 0
; Line 2162
	mov	DWORD PTR _sum$[ebp], 0
; Line 2163
	mov	BYTE PTR _c1$[ebp], 0
; Line 2164
	mov	eax, DWORD PTR _decimaldigits$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAStrLen@AOAProtected@@QAEHPAD@Z	; AOAProtected::AOAStrLen
	mov	DWORD PTR _size$[ebp], eax
; Line 2165
	mov	DWORD PTR _value1$[ebp], 0
; Line 2166
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1948
$L1949:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L1948:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _size$[ebp]
	jge	SHORT $L1950
; Line 2168
	mov	eax, DWORD PTR _decimaldigits$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	movsx	ecx, BYTE PTR [eax]
	sub	ecx, 48					; 00000030H
	mov	BYTE PTR _c1$[ebp], cl
; Line 2169
	mov	ebx, DWORD PTR _c1$[ebp]
	and	ebx, 255				; 000000ffH
	mov	edx, DWORD PTR _size$[ebp]
	sub	edx, DWORD PTR _i$[ebp]
	sub	edx, 1
	push	edx
	push	10					; 0000000aH
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPower@AOAProtected@@QAEKHH@Z	; AOAProtected::AOAPower
	imul	ebx, eax
	mov	BYTE PTR _c1$[ebp], bl
; Line 2170
	mov	eax, DWORD PTR _c1$[ebp]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _sum$[ebp]
	add	ecx, eax
	mov	DWORD PTR _sum$[ebp], ecx
; Line 2171
	jmp	SHORT $L1949
$L1950:
; Line 2173
	mov	eax, DWORD PTR _sum$[ebp]
; Line 2175
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?AOAconvertDecimalToInt@AOAProtected@@QAEHPAD@Z ENDP	; AOAProtected::AOAconvertDecimalToInt
_TEXT	ENDS
PUBLIC	?AOAconvertBinaryToDecimal@AOAProtected@@QAEHPADH@Z ; AOAProtected::AOAconvertBinaryToDecimal
_TEXT	SEGMENT
_decimaldigits$ = 8
_value$ = 12
_this$ = -16
_value1$ = -4
_i$ = -12
_nodigits$ = -8
?AOAconvertBinaryToDecimal@AOAProtected@@QAEHPADH@Z PROC NEAR ; AOAProtected::AOAconvertBinaryToDecimal
; Line 2181
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	mov	DWORD PTR _this$[ebp], ecx
; Line 2182
	mov	DWORD PTR _value1$[ebp], 0
; Line 2183
	mov	DWORD PTR _i$[ebp], 0
; Line 2184
	mov	DWORD PTR _nodigits$[ebp], 0
; Line 2186
	mov	eax, DWORD PTR _value$[ebp]
	mov	DWORD PTR _value1$[ebp], eax
; Line 2187
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1959
$L1960:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L1959:
	cmp	DWORD PTR _i$[ebp], 10			; 0000000aH
	jge	SHORT $L1961
; Line 2189
	mov	eax, DWORD PTR _value1$[ebp]
	xor	edx, edx
	mov	ecx, 10					; 0000000aH
	div	ecx
	add	edx, 48					; 00000030H
	mov	eax, 9
	sub	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _decimaldigits$[ebp]
	mov	BYTE PTR [ecx+eax], dl
; Line 2190
	mov	eax, DWORD PTR _value1$[ebp]
	xor	edx, edx
	mov	ecx, 10					; 0000000aH
	div	ecx
	mov	DWORD PTR _value1$[ebp], eax
; Line 2191
	cmp	DWORD PTR _value1$[ebp], 0
	jne	SHORT $L1962
; Line 2193
	jmp	SHORT $L1961
$L1962:
; Line 2195
	jmp	SHORT $L1960
$L1961:
; Line 2196
	mov	edx, DWORD PTR _decimaldigits$[ebp]
	mov	BYTE PTR [edx+10], 0
; Line 2197
	mov	eax, 9
	sub	eax, DWORD PTR _i$[ebp]
; Line 2198
	mov	esp, ebp
	pop	ebp
	ret	8
?AOAconvertBinaryToDecimal@AOAProtected@@QAEHPADH@Z ENDP ; AOAProtected::AOAconvertBinaryToDecimal
_TEXT	ENDS
PUBLIC	?AOAconvertIntToHexChars@AOAProtected@@QAEHPADH@Z ; AOAProtected::AOAconvertIntToHexChars
_TEXT	SEGMENT
_fourchar$ = 8
_value$ = 12
_this$ = -8
_value1$ = -4
?AOAconvertIntToHexChars@AOAProtected@@QAEHPADH@Z PROC NEAR ; AOAProtected::AOAconvertIntToHexChars
; Line 2204
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2205
	mov	DWORD PTR _value1$[ebp], 0
; Line 2207
	mov	eax, DWORD PTR _value$[ebp]
	mov	DWORD PTR _value1$[ebp], eax
; Line 2208
	mov	ecx, DWORD PTR _fourchar$[ebp]
	mov	dl, BYTE PTR _value1$[ebp]
	mov	BYTE PTR [ecx], dl
; Line 2209
	mov	eax, DWORD PTR _value1$[ebp]
	shr	eax, 8
	mov	DWORD PTR _value1$[ebp], eax
; Line 2210
	mov	ecx, DWORD PTR _fourchar$[ebp]
	mov	dl, BYTE PTR _value1$[ebp]
	mov	BYTE PTR [ecx+1], dl
; Line 2211
	mov	eax, DWORD PTR _value1$[ebp]
	shr	eax, 8
	mov	DWORD PTR _value1$[ebp], eax
; Line 2212
	mov	ecx, DWORD PTR _fourchar$[ebp]
	mov	dl, BYTE PTR _value1$[ebp]
	mov	BYTE PTR [ecx+2], dl
; Line 2213
	mov	eax, DWORD PTR _value1$[ebp]
	shr	eax, 8
	mov	DWORD PTR _value1$[ebp], eax
; Line 2214
	mov	ecx, DWORD PTR _fourchar$[ebp]
	mov	dl, BYTE PTR _value1$[ebp]
	mov	BYTE PTR [ecx+3], dl
; Line 2215
	xor	eax, eax
; Line 2216
	mov	esp, ebp
	pop	ebp
	ret	8
?AOAconvertIntToHexChars@AOAProtected@@QAEHPADH@Z ENDP	; AOAProtected::AOAconvertIntToHexChars
_TEXT	ENDS
PUBLIC	?AOAconvertHexCharsToInt@AOAProtected@@QAEHPAD@Z ; AOAProtected::AOAconvertHexCharsToInt
_TEXT	SEGMENT
_fourchar$ = 8
_this$ = -16
_value1$ = -4
_mask1$ = -12
_ch$ = -8
?AOAconvertHexCharsToInt@AOAProtected@@QAEHPAD@Z PROC NEAR ; AOAProtected::AOAconvertHexCharsToInt
; Line 2222
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	mov	DWORD PTR _this$[ebp], ecx
; Line 2223
	mov	DWORD PTR _value1$[ebp], 0
; Line 2224
	mov	DWORD PTR _mask1$[ebp], 0
; Line 2227
	mov	eax, DWORD PTR _fourchar$[ebp]
	mov	cl, BYTE PTR [eax+3]
	mov	BYTE PTR _ch$[ebp], cl
; Line 2228
	mov	edx, DWORD PTR _ch$[ebp]
	and	edx, 255				; 000000ffH
	mov	DWORD PTR _value1$[ebp], edx
; Line 2229
	mov	eax, DWORD PTR _value1$[ebp]
	shl	eax, 24					; 00000018H
	mov	DWORD PTR _value1$[ebp], eax
; Line 2231
	mov	ecx, DWORD PTR _fourchar$[ebp]
	mov	dl, BYTE PTR [ecx+2]
	mov	BYTE PTR _ch$[ebp], dl
; Line 2232
	mov	eax, DWORD PTR _ch$[ebp]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _mask1$[ebp], eax
; Line 2233
	mov	ecx, DWORD PTR _mask1$[ebp]
	shl	ecx, 16					; 00000010H
	mov	DWORD PTR _mask1$[ebp], ecx
; Line 2234
	mov	edx, DWORD PTR _value1$[ebp]
	add	edx, DWORD PTR _mask1$[ebp]
	mov	DWORD PTR _value1$[ebp], edx
; Line 2236
	mov	eax, DWORD PTR _fourchar$[ebp]
	mov	cl, BYTE PTR [eax+1]
	mov	BYTE PTR _ch$[ebp], cl
; Line 2237
	mov	edx, DWORD PTR _ch$[ebp]
	and	edx, 255				; 000000ffH
	mov	DWORD PTR _mask1$[ebp], edx
; Line 2238
	mov	eax, DWORD PTR _mask1$[ebp]
	shl	eax, 8
	mov	DWORD PTR _mask1$[ebp], eax
; Line 2239
	mov	ecx, DWORD PTR _value1$[ebp]
	add	ecx, DWORD PTR _mask1$[ebp]
	mov	DWORD PTR _value1$[ebp], ecx
; Line 2241
	mov	edx, DWORD PTR _fourchar$[ebp]
	mov	al, BYTE PTR [edx]
	mov	BYTE PTR _ch$[ebp], al
; Line 2242
	mov	ecx, DWORD PTR _ch$[ebp]
	and	ecx, 255				; 000000ffH
	mov	DWORD PTR _mask1$[ebp], ecx
; Line 2243
	mov	edx, DWORD PTR _value1$[ebp]
	add	edx, DWORD PTR _mask1$[ebp]
	mov	DWORD PTR _value1$[ebp], edx
; Line 2245
	mov	eax, DWORD PTR _value1$[ebp]
; Line 2246
	mov	esp, ebp
	pop	ebp
	ret	4
?AOAconvertHexCharsToInt@AOAProtected@@QAEHPAD@Z ENDP	; AOAProtected::AOAconvertHexCharsToInt
_TEXT	ENDS
PUBLIC	?AOAconvertShortToChar@AOAProtected@@QAEHPADG@Z	; AOAProtected::AOAconvertShortToChar
_TEXT	SEGMENT
_twochar$ = 8
_value$ = 12
_this$ = -8
_value1$ = -4
?AOAconvertShortToChar@AOAProtected@@QAEHPADG@Z PROC NEAR ; AOAProtected::AOAconvertShortToChar
; Line 2252
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2253
	mov	WORD PTR _value1$[ebp], 0
; Line 2255
	mov	eax, DWORD PTR _value$[ebp]
	and	eax, 65535				; 0000ffffH
	and	eax, 65280				; 0000ff00H
	mov	WORD PTR _value1$[ebp], ax
; Line 2256
	mov	ecx, DWORD PTR _value1$[ebp]
	and	ecx, 65535				; 0000ffffH
	sar	ecx, 8
	mov	WORD PTR _value1$[ebp], cx
; Line 2257
	mov	edx, DWORD PTR _twochar$[ebp]
	mov	al, BYTE PTR _value1$[ebp]
	mov	BYTE PTR [edx], al
; Line 2258
	movsx	ecx, BYTE PTR _value$[ebp]
	and	ecx, 255				; 000000ffH
	mov	edx, DWORD PTR _twochar$[ebp]
	mov	BYTE PTR [edx+1], cl
; Line 2259
	xor	eax, eax
; Line 2260
	mov	esp, ebp
	pop	ebp
	ret	8
?AOAconvertShortToChar@AOAProtected@@QAEHPADG@Z ENDP	; AOAProtected::AOAconvertShortToChar
_TEXT	ENDS
PUBLIC	?AOAMaskRunRegister@AOAProtected@@QAEHHH@Z	; AOAProtected::AOAMaskRunRegister
_DATA	SEGMENT
	ORG $+3
$SG2006	DB	'Error: MaskRunRegister invalid pid or function code', 00H
_DATA	ENDS
_TEXT	SEGMENT
_pid$ = 8
_fn$ = 12
_this$ = -8
_mask$ = -4
?AOAMaskRunRegister@AOAProtected@@QAEHHH@Z PROC NEAR	; AOAProtected::AOAMaskRunRegister
; Line 2271
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2272
	mov	DWORD PTR _mask$[ebp], 0
; Line 2273
	cmp	DWORD PTR _pid$[ebp], 4
	jne	SHORT $L1994
	cmp	DWORD PTR _fn$[ebp], 1
	jne	SHORT $L1994
; Line 2275
	mov	DWORD PTR _mask$[ebp], 4
; Line 2276
	mov	eax, DWORD PTR ?RunRegister@AOAProtected@@2JA ; AOAProtected::RunRegister
	or	eax, DWORD PTR _mask$[ebp]
	mov	DWORD PTR ?RunRegister@AOAProtected@@2JA, eax ; AOAProtected::RunRegister
; Line 2278
	jmp	$L2005
$L1994:
	cmp	DWORD PTR _pid$[ebp], 7
	jne	SHORT $L1996
	cmp	DWORD PTR _fn$[ebp], 1
	jne	SHORT $L1996
; Line 2280
	mov	DWORD PTR _mask$[ebp], 2
; Line 2281
	mov	ecx, DWORD PTR ?RunRegister@AOAProtected@@2JA ; AOAProtected::RunRegister
	or	ecx, DWORD PTR _mask$[ebp]
	mov	DWORD PTR ?RunRegister@AOAProtected@@2JA, ecx ; AOAProtected::RunRegister
; Line 2283
	jmp	$L2005
$L1996:
	cmp	DWORD PTR _pid$[ebp], 5
	jne	SHORT $L1998
	cmp	DWORD PTR _fn$[ebp], 1
	jne	SHORT $L1998
; Line 2285
	mov	DWORD PTR _mask$[ebp], 1
; Line 2286
	mov	edx, DWORD PTR ?RunRegister@AOAProtected@@2JA ; AOAProtected::RunRegister
	or	edx, DWORD PTR _mask$[ebp]
	mov	DWORD PTR ?RunRegister@AOAProtected@@2JA, edx ; AOAProtected::RunRegister
; Line 2288
	jmp	$L2005
$L1998:
	cmp	DWORD PTR _pid$[ebp], 4
	jne	SHORT $L2000
	cmp	DWORD PTR _fn$[ebp], 0
	jne	SHORT $L2000
; Line 2290
	mov	DWORD PTR _mask$[ebp], 3
; Line 2291
	mov	eax, DWORD PTR ?RunRegister@AOAProtected@@2JA ; AOAProtected::RunRegister
	and	eax, DWORD PTR _mask$[ebp]
	mov	DWORD PTR ?RunRegister@AOAProtected@@2JA, eax ; AOAProtected::RunRegister
; Line 2293
	jmp	SHORT $L2005
$L2000:
	cmp	DWORD PTR _pid$[ebp], 7
	jne	SHORT $L2002
	cmp	DWORD PTR _fn$[ebp], 0
	jne	SHORT $L2002
; Line 2295
	mov	DWORD PTR _mask$[ebp], 5
; Line 2296
	mov	ecx, DWORD PTR ?RunRegister@AOAProtected@@2JA ; AOAProtected::RunRegister
	and	ecx, DWORD PTR _mask$[ebp]
	mov	DWORD PTR ?RunRegister@AOAProtected@@2JA, ecx ; AOAProtected::RunRegister
; Line 2298
	jmp	SHORT $L2005
$L2002:
	cmp	DWORD PTR _pid$[ebp], 5
	jne	SHORT $L2004
	cmp	DWORD PTR _fn$[ebp], 0
	jne	SHORT $L2004
; Line 2300
	mov	DWORD PTR _mask$[ebp], 6
; Line 2301
	mov	edx, DWORD PTR ?RunRegister@AOAProtected@@2JA ; AOAProtected::RunRegister
	and	edx, DWORD PTR _mask$[ebp]
	mov	DWORD PTR ?RunRegister@AOAProtected@@2JA, edx ; AOAProtected::RunRegister
; Line 2303
	jmp	SHORT $L2005
$L2004:
; Line 2305
	push	3840					; 00000f00H
	push	OFFSET FLAT:$SG2006
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 2306
	or	eax, -1
	jmp	SHORT $L1992
$L2005:
; Line 2308
	xor	eax, eax
$L1992:
; Line 2309
	mov	esp, ebp
	pop	ebp
	ret	8
?AOAMaskRunRegister@AOAProtected@@QAEHHH@Z ENDP		; AOAProtected::AOAMaskRunRegister
_TEXT	ENDS
PUBLIC	?AOAisDigit@AOAProtected@@QAEHD@Z		; AOAProtected::AOAisDigit
_TEXT	SEGMENT
_c$ = 8
_this$ = -8
_retVal$ = -4
?AOAisDigit@AOAProtected@@QAEHD@Z PROC NEAR		; AOAProtected::AOAisDigit
; Line 2315
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2316
	mov	DWORD PTR _retVal$[ebp], 0
; Line 2317
	movsx	eax, BYTE PTR _c$[ebp]
	cmp	eax, 48					; 00000030H
	jl	SHORT $L2012
	movsx	ecx, BYTE PTR _c$[ebp]
	cmp	ecx, 57					; 00000039H
	jg	SHORT $L2012
	mov	DWORD PTR _retVal$[ebp], 1
$L2012:
; Line 2318
	mov	eax, DWORD PTR _retVal$[ebp]
; Line 2319
	mov	esp, ebp
	pop	ebp
	ret	4
?AOAisDigit@AOAProtected@@QAEHD@Z ENDP			; AOAProtected::AOAisDigit
_TEXT	ENDS
PUBLIC	?AOAisAlpha@AOAProtected@@QAEHD@Z		; AOAProtected::AOAisAlpha
PUBLIC	?AOAisLower@AOAProtected@@QAEHD@Z		; AOAProtected::AOAisLower
PUBLIC	?AOAisUpper@AOAProtected@@QAEHD@Z		; AOAProtected::AOAisUpper
_TEXT	SEGMENT
_c$ = 8
_this$ = -8
_retVal$ = -4
?AOAisAlpha@AOAProtected@@QAEHD@Z PROC NEAR		; AOAProtected::AOAisAlpha
; Line 2324
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2325
	mov	DWORD PTR _retVal$[ebp], 0
; Line 2326
	mov	al, BYTE PTR _c$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAisLower@AOAProtected@@QAEHD@Z	; AOAProtected::AOAisLower
	test	eax, eax
	jne	SHORT $L2019
	mov	cl, BYTE PTR _c$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAisUpper@AOAProtected@@QAEHD@Z	; AOAProtected::AOAisUpper
	test	eax, eax
	je	SHORT $L2018
$L2019:
	mov	DWORD PTR _retVal$[ebp], 1
$L2018:
; Line 2327
	mov	eax, DWORD PTR _retVal$[ebp]
; Line 2328
	mov	esp, ebp
	pop	ebp
	ret	4
?AOAisAlpha@AOAProtected@@QAEHD@Z ENDP			; AOAProtected::AOAisAlpha
_c$ = 8
_this$ = -8
_retVal$ = -4
?AOAisLower@AOAProtected@@QAEHD@Z PROC NEAR		; AOAProtected::AOAisLower
; Line 2333
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2334
	mov	DWORD PTR _retVal$[ebp], 0
; Line 2335
	movsx	eax, BYTE PTR _c$[ebp]
	cmp	eax, 97					; 00000061H
	jl	SHORT $L2025
	movsx	ecx, BYTE PTR _c$[ebp]
	cmp	ecx, 122				; 0000007aH
	jg	SHORT $L2025
	mov	DWORD PTR _retVal$[ebp], 1
$L2025:
; Line 2336
	mov	eax, DWORD PTR _retVal$[ebp]
; Line 2337
	mov	esp, ebp
	pop	ebp
	ret	4
?AOAisLower@AOAProtected@@QAEHD@Z ENDP			; AOAProtected::AOAisLower
_c$ = 8
_this$ = -8
_retVal$ = -4
?AOAisUpper@AOAProtected@@QAEHD@Z PROC NEAR		; AOAProtected::AOAisUpper
; Line 2342
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2343
	mov	DWORD PTR _retVal$[ebp], 0
; Line 2344
	movsx	eax, BYTE PTR _c$[ebp]
	cmp	eax, 65					; 00000041H
	jl	SHORT $L2031
	movsx	ecx, BYTE PTR _c$[ebp]
	cmp	ecx, 90					; 0000005aH
	jg	SHORT $L2031
	mov	DWORD PTR _retVal$[ebp], 1
$L2031:
; Line 2345
	mov	eax, DWORD PTR _retVal$[ebp]
; Line 2346
	mov	esp, ebp
	pop	ebp
	ret	4
?AOAisUpper@AOAProtected@@QAEHD@Z ENDP			; AOAProtected::AOAisUpper
_TEXT	ENDS
PUBLIC	?memcpy@AOAProtected@@QAEPAXPAXPBXH@Z		; AOAProtected::memcpy
_TEXT	SEGMENT
_dst$ = 8
_src$ = 12
_n$ = 16
_this$ = -12
_d$ = -8
_s$ = -4
?memcpy@AOAProtected@@QAEPAXPAXPBXH@Z PROC NEAR		; AOAProtected::memcpy
; Line 2350
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 2351
	mov	eax, DWORD PTR _dst$[ebp]
	mov	DWORD PTR _d$[ebp], eax
; Line 2352
	mov	ecx, DWORD PTR _src$[ebp]
	mov	DWORD PTR _s$[ebp], ecx
$L2043:
; Line 2354
	cmp	DWORD PTR _n$[ebp], 0
	jle	SHORT $L2044
; Line 2356
	mov	edx, DWORD PTR _d$[ebp]
	mov	eax, DWORD PTR _s$[ebp]
	mov	cl, BYTE PTR [eax]
	mov	BYTE PTR [edx], cl
	mov	edx, DWORD PTR _d$[ebp]
	add	edx, 1
	mov	DWORD PTR _d$[ebp], edx
	mov	eax, DWORD PTR _s$[ebp]
	add	eax, 1
	mov	DWORD PTR _s$[ebp], eax
; Line 2357
	mov	ecx, DWORD PTR _n$[ebp]
	sub	ecx, 1
	mov	DWORD PTR _n$[ebp], ecx
; Line 2358
	jmp	SHORT $L2043
$L2044:
; Line 2360
	mov	eax, DWORD PTR _dst$[ebp]
; Line 2361
	mov	esp, ebp
	pop	ebp
	ret	12					; 0000000cH
?memcpy@AOAProtected@@QAEPAXPAXPBXH@Z ENDP		; AOAProtected::memcpy
_TEXT	ENDS
PUBLIC	?memset@AOAProtected@@QAEPAXPAXHH@Z		; AOAProtected::memset
_TEXT	SEGMENT
_this$ = -8
_p$ = -4
_s$ = 8
_c$ = 12
_n$ = 16
?memset@AOAProtected@@QAEPAXPAXHH@Z PROC NEAR		; AOAProtected::memset
; Line 2364
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2365
	mov	eax, DWORD PTR _s$[ebp]
	mov	DWORD PTR _p$[ebp], eax
$L2054:
; Line 2367
	cmp	DWORD PTR _n$[ebp], 0
	jle	SHORT $L2055
; Line 2369
	mov	ecx, DWORD PTR _p$[ebp]
	mov	dl, BYTE PTR _c$[ebp]
	mov	BYTE PTR [ecx], dl
	mov	eax, DWORD PTR _p$[ebp]
	add	eax, 1
	mov	DWORD PTR _p$[ebp], eax
; Line 2370
	mov	ecx, DWORD PTR _n$[ebp]
	sub	ecx, 1
	mov	DWORD PTR _n$[ebp], ecx
; Line 2371
	jmp	SHORT $L2054
$L2055:
; Line 2373
	mov	eax, DWORD PTR _s$[ebp]
; Line 2374
	mov	esp, ebp
	pop	ebp
	ret	12					; 0000000cH
?memset@AOAProtected@@QAEPAXPAXHH@Z ENDP		; AOAProtected::memset
_TEXT	ENDS
PUBLIC	?reverseLongByteOrder@AOAProtected@@QAEKK@Z	; AOAProtected::reverseLongByteOrder
_TEXT	SEGMENT
_N$ = 8
_this$ = -20
_B0$ = -4
_B1$ = -8
_B2$ = -12
_B3$ = -16
?reverseLongByteOrder@AOAProtected@@QAEKK@Z PROC NEAR	; AOAProtected::reverseLongByteOrder
; Line 2376
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	mov	DWORD PTR _this$[ebp], ecx
; Line 2378
	mov	eax, DWORD PTR _N$[ebp]
	and	eax, 255				; 000000ffH
	mov	BYTE PTR _B0$[ebp], al
; Line 2379
	mov	ecx, DWORD PTR _N$[ebp]
	and	ecx, 65280				; 0000ff00H
	shr	ecx, 8
	mov	BYTE PTR _B1$[ebp], cl
; Line 2380
	mov	edx, DWORD PTR _N$[ebp]
	and	edx, 16711680				; 00ff0000H
	shr	edx, 16					; 00000010H
	mov	BYTE PTR _B2$[ebp], dl
; Line 2381
	mov	eax, DWORD PTR _N$[ebp]
	and	eax, -16777216				; ff000000H
	shr	eax, 24					; 00000018H
	mov	BYTE PTR _B3$[ebp], al
; Line 2382
	mov	eax, DWORD PTR _B0$[ebp]
	and	eax, 255				; 000000ffH
	shl	eax, 24					; 00000018H
	mov	ecx, DWORD PTR _B1$[ebp]
	and	ecx, 255				; 000000ffH
	shl	ecx, 16					; 00000010H
	or	eax, ecx
	mov	edx, DWORD PTR _B2$[ebp]
	and	edx, 255				; 000000ffH
	shl	edx, 8
	or	eax, edx
	mov	ecx, DWORD PTR _B3$[ebp]
	and	ecx, 255				; 000000ffH
	or	eax, ecx
; Line 2383
	mov	esp, ebp
	pop	ebp
	ret	4
?reverseLongByteOrder@AOAProtected@@QAEKK@Z ENDP	; AOAProtected::reverseLongByteOrder
_TEXT	ENDS
PUBLIC	?reverseShortByteOrder@AOAProtected@@QAEGG@Z	; AOAProtected::reverseShortByteOrder
_TEXT	SEGMENT
_N$ = 8
_this$ = -12
_B0$ = -4
_B1$ = -8
?reverseShortByteOrder@AOAProtected@@QAEGG@Z PROC NEAR	; AOAProtected::reverseShortByteOrder
; Line 2385
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 2387
	mov	eax, DWORD PTR _N$[ebp]
	and	eax, 65535				; 0000ffffH
	and	eax, 255				; 000000ffH
	mov	BYTE PTR _B0$[ebp], al
; Line 2388
	mov	ecx, DWORD PTR _N$[ebp]
	and	ecx, 65535				; 0000ffffH
	and	ecx, 65280				; 0000ff00H
	sar	ecx, 8
	mov	BYTE PTR _B1$[ebp], cl
; Line 2389
	mov	eax, DWORD PTR _B0$[ebp]
	and	eax, 255				; 000000ffH
	shl	eax, 8
	mov	edx, DWORD PTR _B1$[ebp]
	and	edx, 255				; 000000ffH
	or	eax, edx
; Line 2390
	mov	esp, ebp
	pop	ebp
	ret	4
?reverseShortByteOrder@AOAProtected@@QAEGG@Z ENDP	; AOAProtected::reverseShortByteOrder
_TEXT	ENDS
PUBLIC	?CharPairToCharHex@AOAProtected@@QAEDPAD@Z	; AOAProtected::CharPairToCharHex
_TEXT	SEGMENT
_ptr$ = 8
_this$ = -16
_t1$ = -12
_c1$ = -4
_c2$ = -8
?CharPairToCharHex@AOAProtected@@QAEDPAD@Z PROC NEAR	; AOAProtected::CharPairToCharHex
; Line 2392
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	mov	DWORD PTR _this$[ebp], ecx
; Line 2393
	mov	BYTE PTR _t1$[ebp], 32			; 00000020H
; Line 2394
	mov	BYTE PTR _c1$[ebp], 0
; Line 2395
	mov	BYTE PTR _c2$[ebp], 0
; Line 2397
	mov	eax, DWORD PTR _ptr$[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 48					; 00000030H
	jl	SHORT $L2078
	mov	edx, DWORD PTR _ptr$[ebp]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, 57					; 00000039H
	jg	SHORT $L2078
; Line 2398
	mov	ecx, DWORD PTR _ptr$[ebp]
	movsx	edx, BYTE PTR [ecx]
	sub	edx, 48					; 00000030H
	mov	BYTE PTR _c1$[ebp], dl
; Line 2399
	jmp	SHORT $L2082
$L2078:
; Line 2400
	mov	eax, DWORD PTR _ptr$[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 65					; 00000041H
	jl	SHORT $L2080
	mov	edx, DWORD PTR _ptr$[ebp]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, 70					; 00000046H
	jg	SHORT $L2080
; Line 2401
	mov	ecx, DWORD PTR _ptr$[ebp]
	movsx	edx, BYTE PTR [ecx]
	sub	edx, 55					; 00000037H
	mov	BYTE PTR _c1$[ebp], dl
; Line 2402
	jmp	SHORT $L2082
$L2080:
; Line 2403
	mov	eax, DWORD PTR _ptr$[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 97					; 00000061H
	jl	SHORT $L2082
	mov	edx, DWORD PTR _ptr$[ebp]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, 102				; 00000066H
	jg	SHORT $L2082
; Line 2404
	mov	ecx, DWORD PTR _ptr$[ebp]
	movsx	edx, BYTE PTR [ecx]
	sub	edx, 87					; 00000057H
	mov	BYTE PTR _c1$[ebp], dl
$L2082:
; Line 2406
	movsx	eax, BYTE PTR _c1$[ebp]
	and	eax, 15					; 0000000fH
	mov	BYTE PTR _c1$[ebp], al
; Line 2407
	movsx	ecx, BYTE PTR _c1$[ebp]
	shl	ecx, 4
	mov	BYTE PTR _c1$[ebp], cl
; Line 2409
	mov	edx, DWORD PTR _ptr$[ebp]
	movsx	eax, BYTE PTR [edx+1]
	cmp	eax, 48					; 00000030H
	jl	SHORT $L2083
	mov	ecx, DWORD PTR _ptr$[ebp]
	movsx	edx, BYTE PTR [ecx+1]
	cmp	edx, 57					; 00000039H
	jg	SHORT $L2083
; Line 2410
	mov	eax, DWORD PTR _ptr$[ebp]
	movsx	ecx, BYTE PTR [eax+1]
	sub	ecx, 48					; 00000030H
	mov	BYTE PTR _c2$[ebp], cl
; Line 2411
	jmp	SHORT $L2087
$L2083:
; Line 2412
	mov	edx, DWORD PTR _ptr$[ebp]
	movsx	eax, BYTE PTR [edx+1]
	cmp	eax, 65					; 00000041H
	jl	SHORT $L2085
	mov	ecx, DWORD PTR _ptr$[ebp]
	movsx	edx, BYTE PTR [ecx+1]
	cmp	edx, 70					; 00000046H
	jg	SHORT $L2085
; Line 2413
	mov	eax, DWORD PTR _ptr$[ebp]
	movsx	ecx, BYTE PTR [eax+1]
	sub	ecx, 55					; 00000037H
	mov	BYTE PTR _c2$[ebp], cl
; Line 2414
	jmp	SHORT $L2087
$L2085:
; Line 2415
	mov	edx, DWORD PTR _ptr$[ebp]
	movsx	eax, BYTE PTR [edx+1]
	cmp	eax, 97					; 00000061H
	jl	SHORT $L2087
	mov	ecx, DWORD PTR _ptr$[ebp]
	movsx	edx, BYTE PTR [ecx+1]
	cmp	edx, 102				; 00000066H
	jg	SHORT $L2087
; Line 2416
	mov	eax, DWORD PTR _ptr$[ebp]
	movsx	ecx, BYTE PTR [eax+1]
	sub	ecx, 87					; 00000057H
	mov	BYTE PTR _c2$[ebp], cl
$L2087:
; Line 2418
	movsx	edx, BYTE PTR _c2$[ebp]
	and	edx, 15					; 0000000fH
	mov	BYTE PTR _c2$[ebp], dl
; Line 2419
	movsx	eax, BYTE PTR _c1$[ebp]
	movsx	ecx, BYTE PTR _c2$[ebp]
	or	eax, ecx
	mov	BYTE PTR _c1$[ebp], al
; Line 2421
	movsx	edx, BYTE PTR _c1$[ebp]
	and	edx, 255				; 000000ffH
	mov	BYTE PTR _t1$[ebp], dl
; Line 2423
	mov	al, BYTE PTR _t1$[ebp]
; Line 2424
	mov	esp, ebp
	pop	ebp
	ret	4
?CharPairToCharHex@AOAProtected@@QAEDPAD@Z ENDP		; AOAProtected::CharPairToCharHex
_TEXT	ENDS
PUBLIC	?isSame@AOAProtected@@QAE_NPAD0H@Z		; AOAProtected::isSame
_TEXT	SEGMENT
_s1$ = 8
_s2$ = 12
_length$ = 16
_this$ = -12
_areSame$ = -8
_i$ = -4
?isSame@AOAProtected@@QAE_NPAD0H@Z PROC NEAR		; AOAProtected::isSame
; Line 2426
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 2427
	mov	BYTE PTR _areSame$[ebp], 1
; Line 2428
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L2096
$L2097:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L2096:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _length$[ebp]
	jge	SHORT $L2098
; Line 2429
	mov	edx, DWORD PTR _s1$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR [edx]
	mov	ecx, DWORD PTR _s2$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	movsx	edx, BYTE PTR [ecx]
	cmp	eax, edx
	je	SHORT $L2099
; Line 2431
	mov	BYTE PTR _areSame$[ebp], 0
; Line 2432
	jmp	SHORT $L2098
$L2099:
; Line 2434
	jmp	SHORT $L2097
$L2098:
	mov	al, BYTE PTR _areSame$[ebp]
; Line 2435
	mov	esp, ebp
	pop	ebp
	ret	12					; 0000000cH
?isSame@AOAProtected@@QAE_NPAD0H@Z ENDP			; AOAProtected::isSame
_TEXT	ENDS
END
