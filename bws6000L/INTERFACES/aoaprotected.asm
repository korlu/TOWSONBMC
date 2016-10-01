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
_i$892 = -20
_i$899 = -24
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
	jmp	SHORT $L888
$L889:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L888:
	mov	edx, DWORD PTR _count$[ebp]
	shl	edx, 2
	cmp	DWORD PTR _i$[ebp], edx
	jge	SHORT $L890
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
	jmp	SHORT $L889
$L890:
; Line 108
	cmp	DWORD PTR _mode$[ebp], 0
	jne	SHORT $L891
; Line 110
	mov	DWORD PTR _i$892[ebp], 0
	jmp	SHORT $L893
$L894:
	mov	edx, DWORD PTR _i$892[ebp]
	add	edx, 1
	mov	DWORD PTR _i$892[ebp], edx
$L893:
	mov	eax, DWORD PTR _i$892[ebp]
	cmp	eax, DWORD PTR _count$[ebp]
	jge	SHORT $L895
; Line 112
	mov	ecx, DWORD PTR _addr$[ebp]
	push	ecx
	call	_CgetRealMemory
	add	esp, 4
	mov	DWORD PTR _value$[ebp], eax
; Line 113
	mov	edx, DWORD PTR _i$892[ebp]
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
	jmp	SHORT $L894
$L895:
; Line 118
	jmp	SHORT $L902
$L891:
	cmp	DWORD PTR _mode$[ebp], 1
	jne	SHORT $L902
; Line 120
	mov	eax, DWORD PTR _addr$[ebp]
	sub	eax, 1114112				; 00110000H
	mov	DWORD PTR _addr$[ebp], eax
; Line 121
	mov	ecx, DWORD PTR _addr$[ebp]
	mov	DWORD PTR _ptr$[ebp], ecx
; Line 123
	mov	DWORD PTR _i$899[ebp], 0
	jmp	SHORT $L900
$L901:
	mov	edx, DWORD PTR _i$899[ebp]
	add	edx, 1
	mov	DWORD PTR _i$899[ebp], edx
$L900:
	mov	eax, DWORD PTR _i$899[ebp]
	cmp	eax, DWORD PTR _count$[ebp]
	jge	SHORT $L902
; Line 125
	mov	ecx, DWORD PTR _ptr$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR _value$[ebp], edx
; Line 126
	mov	eax, DWORD PTR _i$899[ebp]
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
	jmp	SHORT $L901
$L902:
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
	rdtsc
; Line 161
	mov	DWORD PTR _lowword$[ebp], eax
; Line 162
	mov	DWORD PTR _highword$[ebp], edx
; Line 164
	mov	eax, DWORD PTR _hword1$[ebp]
	mov	ecx, DWORD PTR _highword$[ebp]
	mov	DWORD PTR [eax], ecx
; Line 165
	mov	edx, DWORD PTR _lword1$[ebp]
	mov	eax, DWORD PTR _lowword$[ebp]
	mov	DWORD PTR [edx], eax
; Line 166
	xor	eax, eax
; Line 167
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
; Line 175
	push	ebp
	mov	ebp, esp
	sub	esp, 296				; 00000128H
	mov	DWORD PTR _this$[ebp], ecx
; Line 176
	mov	DWORD PTR _retcode$[ebp], 0
; Line 177
	mov	DWORD PTR _i$[ebp], 0
; Line 178
	mov	DWORD PTR _j$[ebp], 0
; Line 179
	mov	DWORD PTR _k$[ebp], 0
; Line 180
	mov	DWORD PTR _index$[ebp], 0
; Line 185
	mov	DWORD PTR _imask$[ebp], 0
; Line 186
	mov	DWORD PTR _t1$[ebp], 0
; Line 187
	mov	DWORD PTR _t2$[ebp], 0
; Line 188
	mov	DWORD PTR _flag$[ebp], 0
; Line 190
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L947
$L948:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L947:
	cmp	DWORD PTR _i$[ebp], 32			; 00000020H
	jge	SHORT $L949
; Line 192
	mov	ecx, DWORD PTR _i$[ebp]
	mov	BYTE PTR _ary1$[ebp+ecx], 48		; 00000030H
; Line 193
	mov	edx, DWORD PTR _i$[ebp]
	mov	BYTE PTR _ary2$[ebp+edx], 48		; 00000030H
; Line 194
	mov	eax, DWORD PTR _i$[ebp]
	mov	BYTE PTR _result$[ebp+eax], 48		; 00000030H
; Line 195
	mov	DWORD PTR _imask$[ebp], 0
; Line 196
	jmp	SHORT $L948
$L949:
; Line 199
	cmp	DWORD PTR _hword2$[ebp], 0
	jne	SHORT $L950
	cmp	DWORD PTR _hword1$[ebp], 0
	jne	SHORT $L950
; Line 202
	mov	ecx, DWORD PTR _resulthigh$[ebp]
	mov	DWORD PTR [ecx], 0
; Line 203
	mov	edx, DWORD PTR _lword2$[ebp]
	sub	edx, DWORD PTR _lword1$[ebp]
	mov	eax, DWORD PTR _resultlow$[ebp]
	mov	DWORD PTR [eax], edx
; Line 204
	xor	eax, eax
	jmp	$L933
$L950:
; Line 206
	mov	ecx, DWORD PTR _hword2$[ebp]
	cmp	ecx, DWORD PTR _hword1$[ebp]
	jne	SHORT $L952
; Line 209
	mov	edx, DWORD PTR _resulthigh$[ebp]
	mov	DWORD PTR [edx], 0
; Line 210
	mov	eax, DWORD PTR _lword2$[ebp]
	sub	eax, DWORD PTR _lword1$[ebp]
	mov	ecx, DWORD PTR _resultlow$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 211
	xor	eax, eax
	jmp	$L933
$L952:
; Line 213
	cmp	DWORD PTR _hword2$[ebp], 0
	jne	SHORT $L954
	cmp	DWORD PTR _hword1$[ebp], 0
	jbe	SHORT $L954
; Line 214
	or	eax, -1
	jmp	$L933
$L954:
; Line 219
	mov	DWORD PTR _imask$[ebp], -2147483648	; 80000000H
; Line 220
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L956
$L957:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L956:
	cmp	DWORD PTR _i$[ebp], 32			; 00000020H
	jge	SHORT $L958
; Line 222
	mov	eax, DWORD PTR _hword1$[ebp]
	and	eax, DWORD PTR _imask$[ebp]
	mov	DWORD PTR _t1$[ebp], eax
; Line 223
	mov	ecx, DWORD PTR _t1$[ebp]
	cmp	ecx, DWORD PTR _imask$[ebp]
	jne	SHORT $L959
; Line 224
	mov	edx, DWORD PTR _i$[ebp]
	mov	BYTE PTR _ary1$[ebp+edx], 49		; 00000031H
; Line 225
	jmp	SHORT $L960
$L959:
	mov	eax, DWORD PTR _i$[ebp]
	mov	BYTE PTR _ary1$[ebp+eax], 48		; 00000030H
$L960:
; Line 227
	mov	ecx, DWORD PTR _hword2$[ebp]
	and	ecx, DWORD PTR _imask$[ebp]
	mov	DWORD PTR _t2$[ebp], ecx
; Line 228
	mov	edx, DWORD PTR _t2$[ebp]
	cmp	edx, DWORD PTR _imask$[ebp]
	jne	SHORT $L961
; Line 229
	mov	eax, DWORD PTR _i$[ebp]
	mov	BYTE PTR _ary2$[ebp+eax], 49		; 00000031H
; Line 230
	jmp	SHORT $L962
$L961:
	mov	ecx, DWORD PTR _i$[ebp]
	mov	BYTE PTR _ary2$[ebp+ecx], 48		; 00000030H
$L962:
; Line 232
	mov	edx, DWORD PTR _imask$[ebp]
	shr	edx, 1
	mov	DWORD PTR _imask$[ebp], edx
; Line 233
	jmp	SHORT $L957
$L958:
; Line 234
	mov	DWORD PTR _imask$[ebp], -2147483648	; 80000000H
; Line 235
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L963
$L964:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L963:
	cmp	DWORD PTR _i$[ebp], 32			; 00000020H
	jge	SHORT $L965
; Line 237
	mov	ecx, DWORD PTR _lword1$[ebp]
	and	ecx, DWORD PTR _imask$[ebp]
	mov	DWORD PTR _t1$[ebp], ecx
; Line 238
	mov	edx, DWORD PTR _t1$[ebp]
	cmp	edx, DWORD PTR _imask$[ebp]
	jne	SHORT $L966
; Line 239
	mov	eax, DWORD PTR _i$[ebp]
	mov	BYTE PTR _ary1$[ebp+eax+32], 49		; 00000031H
; Line 240
	jmp	SHORT $L967
$L966:
	mov	ecx, DWORD PTR _i$[ebp]
	mov	BYTE PTR _ary1$[ebp+ecx+32], 48		; 00000030H
$L967:
; Line 242
	mov	edx, DWORD PTR _lword2$[ebp]
	and	edx, DWORD PTR _imask$[ebp]
	mov	DWORD PTR _t2$[ebp], edx
; Line 243
	mov	eax, DWORD PTR _t2$[ebp]
	cmp	eax, DWORD PTR _imask$[ebp]
	jne	SHORT $L968
; Line 244
	mov	ecx, DWORD PTR _i$[ebp]
	mov	BYTE PTR _ary2$[ebp+ecx+32], 49		; 00000031H
; Line 245
	jmp	SHORT $L969
$L968:
	mov	edx, DWORD PTR _i$[ebp]
	mov	BYTE PTR _ary2$[ebp+edx+32], 48		; 00000030H
$L969:
; Line 247
	mov	eax, DWORD PTR _imask$[ebp]
	shr	eax, 1
	mov	DWORD PTR _imask$[ebp], eax
; Line 248
	jmp	SHORT $L964
$L965:
; Line 259
	mov	DWORD PTR _index$[ebp], 63		; 0000003fH
; Line 260
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L970
$L971:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L970:
	cmp	DWORD PTR _i$[ebp], 64			; 00000040H
	jge	$L972
; Line 263
	mov	edx, DWORD PTR _index$[ebp]
	xor	eax, eax
	mov	al, BYTE PTR _ary2$[ebp+edx]
	cmp	eax, 48					; 00000030H
	jne	SHORT $L973
	mov	ecx, DWORD PTR _index$[ebp]
	xor	edx, edx
	mov	dl, BYTE PTR _ary1$[ebp+ecx]
	cmp	edx, 48					; 00000030H
	jne	SHORT $L973
; Line 264
	mov	eax, DWORD PTR _index$[ebp]
	mov	BYTE PTR _result$[ebp+eax], 48		; 00000030H
; Line 265
	jmp	$L982
$L973:
	mov	ecx, DWORD PTR _index$[ebp]
	xor	edx, edx
	mov	dl, BYTE PTR _ary2$[ebp+ecx]
	cmp	edx, 49					; 00000031H
	jne	SHORT $L975
	mov	eax, DWORD PTR _index$[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR _ary1$[ebp+eax]
	cmp	ecx, 48					; 00000030H
	jne	SHORT $L975
; Line 266
	mov	edx, DWORD PTR _index$[ebp]
	mov	BYTE PTR _result$[ebp+edx], 49		; 00000031H
; Line 267
	jmp	$L982
$L975:
	mov	eax, DWORD PTR _index$[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR _ary2$[ebp+eax]
	cmp	ecx, 49					; 00000031H
	jne	SHORT $L977
	mov	edx, DWORD PTR _index$[ebp]
	xor	eax, eax
	mov	al, BYTE PTR _ary1$[ebp+edx]
	cmp	eax, 49					; 00000031H
	jne	SHORT $L977
; Line 268
	mov	ecx, DWORD PTR _index$[ebp]
	mov	BYTE PTR _result$[ebp+ecx], 48		; 00000030H
; Line 269
	jmp	$L982
$L977:
	mov	edx, DWORD PTR _index$[ebp]
	xor	eax, eax
	mov	al, BYTE PTR _ary2$[ebp+edx]
	cmp	eax, 48					; 00000030H
	jne	$L982
	mov	ecx, DWORD PTR _index$[ebp]
	xor	edx, edx
	mov	dl, BYTE PTR _ary1$[ebp+ecx]
	cmp	edx, 49					; 00000031H
	jne	$L982
; Line 271
	mov	eax, DWORD PTR _index$[ebp]
	mov	BYTE PTR _result$[ebp+eax], 49		; 00000031H
; Line 272
	mov	DWORD PTR _flag$[ebp], 0
; Line 273
	mov	ecx, DWORD PTR _index$[ebp]
	sub	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
$L981:
; Line 274
	cmp	DWORD PTR _flag$[ebp], 0
	jne	SHORT $L982
; Line 276
	mov	edx, DWORD PTR _j$[ebp]
	xor	eax, eax
	mov	al, BYTE PTR _ary2$[ebp+edx]
	cmp	eax, 48					; 00000030H
	jne	SHORT $L983
; Line 278
	mov	ecx, DWORD PTR _j$[ebp]
	mov	BYTE PTR _ary2$[ebp+ecx], 49		; 00000031H
; Line 280
	jmp	SHORT $L984
$L983:
; Line 283
	mov	edx, DWORD PTR _j$[ebp]
	mov	BYTE PTR _ary2$[ebp+edx], 48		; 00000030H
; Line 284
	mov	DWORD PTR _flag$[ebp], 1
$L984:
; Line 286
	mov	eax, DWORD PTR _j$[ebp]
	sub	eax, 1
	mov	DWORD PTR _j$[ebp], eax
; Line 287
	cmp	DWORD PTR _j$[ebp], 0
	jge	SHORT $L985
; Line 288
	mov	DWORD PTR _flag$[ebp], 1
$L985:
; Line 289
	jmp	SHORT $L981
$L982:
; Line 291
	mov	ecx, DWORD PTR _index$[ebp]
	sub	ecx, 1
	mov	DWORD PTR _index$[ebp], ecx
; Line 292
	jmp	$L971
$L972:
; Line 296
	mov	edx, DWORD PTR _resulthigh$[ebp]
	mov	DWORD PTR [edx], 0
; Line 297
	mov	eax, DWORD PTR _resultlow$[ebp]
	mov	DWORD PTR [eax], 0
; Line 298
	mov	DWORD PTR _imask$[ebp], -2147483648	; 80000000H
; Line 299
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L986
$L987:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L986:
	cmp	DWORD PTR _i$[ebp], 32			; 00000020H
	jge	SHORT $L988
; Line 301
	mov	edx, DWORD PTR _i$[ebp]
	xor	eax, eax
	mov	al, BYTE PTR _result$[ebp+edx]
	cmp	eax, 49					; 00000031H
	jne	SHORT $L989
; Line 302
	mov	ecx, DWORD PTR _resulthigh$[ebp]
	mov	edx, DWORD PTR [ecx]
	or	edx, DWORD PTR _imask$[ebp]
	mov	eax, DWORD PTR _resulthigh$[ebp]
	mov	DWORD PTR [eax], edx
$L989:
; Line 303
	mov	ecx, DWORD PTR _imask$[ebp]
	shr	ecx, 1
	mov	DWORD PTR _imask$[ebp], ecx
; Line 304
	jmp	SHORT $L987
$L988:
; Line 305
	mov	DWORD PTR _imask$[ebp], -2147483648	; 80000000H
; Line 306
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L990
$L991:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L990:
	cmp	DWORD PTR _i$[ebp], 32			; 00000020H
	jge	SHORT $L992
; Line 308
	mov	eax, DWORD PTR _i$[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR _result$[ebp+eax+32]
	cmp	ecx, 49					; 00000031H
	jne	SHORT $L993
; Line 309
	mov	edx, DWORD PTR _resultlow$[ebp]
	mov	eax, DWORD PTR [edx]
	or	eax, DWORD PTR _imask$[ebp]
	mov	ecx, DWORD PTR _resultlow$[ebp]
	mov	DWORD PTR [ecx], eax
$L993:
; Line 310
	mov	edx, DWORD PTR _imask$[ebp]
	shr	edx, 1
	mov	DWORD PTR _imask$[ebp], edx
; Line 311
	jmp	SHORT $L991
$L992:
; Line 322
	xor	eax, eax
$L933:
; Line 323
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
; Line 330
	push	ebp
	mov	ebp, esp
	sub	esp, 300				; 0000012cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 331
	mov	DWORD PTR _retcode$[ebp], 0
; Line 332
	mov	DWORD PTR _i$[ebp], 0
; Line 333
	mov	DWORD PTR _j$[ebp], 0
; Line 334
	mov	DWORD PTR _k$[ebp], 0
; Line 335
	mov	DWORD PTR _index$[ebp], 0
; Line 340
	mov	DWORD PTR _imask$[ebp], 0
; Line 341
	mov	DWORD PTR _t1$[ebp], 0
; Line 342
	mov	DWORD PTR _t2$[ebp], 0
; Line 343
	mov	DWORD PTR _flag$[ebp], 0
; Line 344
	mov	BYTE PTR _carry$[ebp], 48		; 00000030H
; Line 346
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1017
$L1018:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L1017:
	cmp	DWORD PTR _i$[ebp], 32			; 00000020H
	jge	SHORT $L1019
; Line 348
	mov	ecx, DWORD PTR _i$[ebp]
	mov	BYTE PTR _ary1$[ebp+ecx], 48		; 00000030H
; Line 349
	mov	edx, DWORD PTR _i$[ebp]
	mov	BYTE PTR _ary2$[ebp+edx], 48		; 00000030H
; Line 350
	mov	eax, DWORD PTR _i$[ebp]
	mov	BYTE PTR _result$[ebp+eax], 48		; 00000030H
; Line 351
	mov	DWORD PTR _imask$[ebp], 0
; Line 352
	jmp	SHORT $L1018
$L1019:
; Line 357
	mov	DWORD PTR _imask$[ebp], -2147483648	; 80000000H
; Line 358
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1020
$L1021:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L1020:
	cmp	DWORD PTR _i$[ebp], 32			; 00000020H
	jge	SHORT $L1022
; Line 360
	mov	edx, DWORD PTR _hword1$[ebp]
	and	edx, DWORD PTR _imask$[ebp]
	mov	DWORD PTR _t1$[ebp], edx
; Line 361
	mov	eax, DWORD PTR _t1$[ebp]
	cmp	eax, DWORD PTR _imask$[ebp]
	jne	SHORT $L1023
; Line 362
	mov	ecx, DWORD PTR _i$[ebp]
	mov	BYTE PTR _ary1$[ebp+ecx], 49		; 00000031H
; Line 363
	jmp	SHORT $L1024
$L1023:
	mov	edx, DWORD PTR _i$[ebp]
	mov	BYTE PTR _ary1$[ebp+edx], 48		; 00000030H
$L1024:
; Line 365
	mov	eax, DWORD PTR _hword2$[ebp]
	and	eax, DWORD PTR _imask$[ebp]
	mov	DWORD PTR _t2$[ebp], eax
; Line 366
	mov	ecx, DWORD PTR _t2$[ebp]
	cmp	ecx, DWORD PTR _imask$[ebp]
	jne	SHORT $L1025
; Line 367
	mov	edx, DWORD PTR _i$[ebp]
	mov	BYTE PTR _ary2$[ebp+edx], 49		; 00000031H
; Line 368
	jmp	SHORT $L1026
$L1025:
	mov	eax, DWORD PTR _i$[ebp]
	mov	BYTE PTR _ary2$[ebp+eax], 48		; 00000030H
$L1026:
; Line 370
	mov	ecx, DWORD PTR _imask$[ebp]
	shr	ecx, 1
	mov	DWORD PTR _imask$[ebp], ecx
; Line 371
	jmp	SHORT $L1021
$L1022:
; Line 372
	mov	DWORD PTR _imask$[ebp], -2147483648	; 80000000H
; Line 373
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1027
$L1028:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L1027:
	cmp	DWORD PTR _i$[ebp], 32			; 00000020H
	jge	SHORT $L1029
; Line 375
	mov	eax, DWORD PTR _lword1$[ebp]
	and	eax, DWORD PTR _imask$[ebp]
	mov	DWORD PTR _t1$[ebp], eax
; Line 376
	mov	ecx, DWORD PTR _t1$[ebp]
	cmp	ecx, DWORD PTR _imask$[ebp]
	jne	SHORT $L1030
; Line 377
	mov	edx, DWORD PTR _i$[ebp]
	mov	BYTE PTR _ary1$[ebp+edx+32], 49		; 00000031H
; Line 378
	jmp	SHORT $L1031
$L1030:
	mov	eax, DWORD PTR _i$[ebp]
	mov	BYTE PTR _ary1$[ebp+eax+32], 48		; 00000030H
$L1031:
; Line 380
	mov	ecx, DWORD PTR _lword2$[ebp]
	and	ecx, DWORD PTR _imask$[ebp]
	mov	DWORD PTR _t2$[ebp], ecx
; Line 381
	mov	edx, DWORD PTR _t2$[ebp]
	cmp	edx, DWORD PTR _imask$[ebp]
	jne	SHORT $L1032
; Line 382
	mov	eax, DWORD PTR _i$[ebp]
	mov	BYTE PTR _ary2$[ebp+eax+32], 49		; 00000031H
; Line 383
	jmp	SHORT $L1033
$L1032:
	mov	ecx, DWORD PTR _i$[ebp]
	mov	BYTE PTR _ary2$[ebp+ecx+32], 48		; 00000030H
$L1033:
; Line 385
	mov	edx, DWORD PTR _imask$[ebp]
	shr	edx, 1
	mov	DWORD PTR _imask$[ebp], edx
; Line 386
	jmp	SHORT $L1028
$L1029:
; Line 397
	mov	DWORD PTR _index$[ebp], 63		; 0000003fH
; Line 398
	mov	BYTE PTR _carry$[ebp], 48		; 00000030H
; Line 399
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1034
$L1035:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L1034:
	cmp	DWORD PTR _i$[ebp], 64			; 00000040H
	jge	$L1036
; Line 402
	mov	ecx, DWORD PTR _index$[ebp]
	xor	edx, edx
	mov	dl, BYTE PTR _ary2$[ebp+ecx]
	cmp	edx, 48					; 00000030H
	jne	SHORT $L1037
	mov	eax, DWORD PTR _index$[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR _ary1$[ebp+eax]
	cmp	ecx, 48					; 00000030H
	jne	SHORT $L1037
	mov	edx, DWORD PTR _carry$[ebp]
	and	edx, 255				; 000000ffH
	cmp	edx, 48					; 00000030H
	jne	SHORT $L1037
; Line 404
	mov	eax, DWORD PTR _index$[ebp]
	mov	BYTE PTR _result$[ebp+eax], 48		; 00000030H
; Line 405
	mov	BYTE PTR _carry$[ebp], 48		; 00000030H
; Line 407
	jmp	$L1051
$L1037:
	mov	ecx, DWORD PTR _index$[ebp]
	xor	edx, edx
	mov	dl, BYTE PTR _ary2$[ebp+ecx]
	cmp	edx, 48					; 00000030H
	jne	SHORT $L1039
	mov	eax, DWORD PTR _index$[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR _ary1$[ebp+eax]
	cmp	ecx, 48					; 00000030H
	jne	SHORT $L1039
	mov	edx, DWORD PTR _carry$[ebp]
	and	edx, 255				; 000000ffH
	cmp	edx, 49					; 00000031H
	jne	SHORT $L1039
; Line 409
	mov	eax, DWORD PTR _index$[ebp]
	mov	BYTE PTR _result$[ebp+eax], 49		; 00000031H
; Line 410
	mov	BYTE PTR _carry$[ebp], 48		; 00000030H
; Line 412
	jmp	$L1051
$L1039:
	mov	ecx, DWORD PTR _index$[ebp]
	xor	edx, edx
	mov	dl, BYTE PTR _ary2$[ebp+ecx]
	cmp	edx, 48					; 00000030H
	jne	SHORT $L1041
	mov	eax, DWORD PTR _index$[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR _ary1$[ebp+eax]
	cmp	ecx, 49					; 00000031H
	jne	SHORT $L1041
	mov	edx, DWORD PTR _carry$[ebp]
	and	edx, 255				; 000000ffH
	cmp	edx, 48					; 00000030H
	jne	SHORT $L1041
; Line 414
	mov	eax, DWORD PTR _index$[ebp]
	mov	BYTE PTR _result$[ebp+eax], 49		; 00000031H
; Line 415
	mov	BYTE PTR _carry$[ebp], 48		; 00000030H
; Line 417
	jmp	$L1051
$L1041:
	mov	ecx, DWORD PTR _index$[ebp]
	xor	edx, edx
	mov	dl, BYTE PTR _ary2$[ebp+ecx]
	cmp	edx, 48					; 00000030H
	jne	SHORT $L1043
	mov	eax, DWORD PTR _index$[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR _ary1$[ebp+eax]
	cmp	ecx, 49					; 00000031H
	jne	SHORT $L1043
	mov	edx, DWORD PTR _carry$[ebp]
	and	edx, 255				; 000000ffH
	cmp	edx, 49					; 00000031H
	jne	SHORT $L1043
; Line 419
	mov	eax, DWORD PTR _index$[ebp]
	mov	BYTE PTR _result$[ebp+eax], 48		; 00000030H
; Line 420
	mov	BYTE PTR _carry$[ebp], 49		; 00000031H
; Line 422
	jmp	$L1051
$L1043:
	mov	ecx, DWORD PTR _index$[ebp]
	xor	edx, edx
	mov	dl, BYTE PTR _ary2$[ebp+ecx]
	cmp	edx, 49					; 00000031H
	jne	SHORT $L1045
	mov	eax, DWORD PTR _index$[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR _ary1$[ebp+eax]
	cmp	ecx, 48					; 00000030H
	jne	SHORT $L1045
	mov	edx, DWORD PTR _carry$[ebp]
	and	edx, 255				; 000000ffH
	cmp	edx, 48					; 00000030H
	jne	SHORT $L1045
; Line 424
	mov	eax, DWORD PTR _index$[ebp]
	mov	BYTE PTR _result$[ebp+eax], 49		; 00000031H
; Line 425
	mov	BYTE PTR _carry$[ebp], 48		; 00000030H
; Line 427
	jmp	$L1051
$L1045:
	mov	ecx, DWORD PTR _index$[ebp]
	xor	edx, edx
	mov	dl, BYTE PTR _ary2$[ebp+ecx]
	cmp	edx, 49					; 00000031H
	jne	SHORT $L1047
	mov	eax, DWORD PTR _index$[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR _ary1$[ebp+eax]
	cmp	ecx, 48					; 00000030H
	jne	SHORT $L1047
	mov	edx, DWORD PTR _carry$[ebp]
	and	edx, 255				; 000000ffH
	cmp	edx, 49					; 00000031H
	jne	SHORT $L1047
; Line 429
	mov	eax, DWORD PTR _index$[ebp]
	mov	BYTE PTR _result$[ebp+eax], 48		; 00000030H
; Line 430
	mov	BYTE PTR _carry$[ebp], 49		; 00000031H
; Line 432
	jmp	$L1051
$L1047:
	mov	ecx, DWORD PTR _index$[ebp]
	xor	edx, edx
	mov	dl, BYTE PTR _ary2$[ebp+ecx]
	cmp	edx, 49					; 00000031H
	jne	SHORT $L1049
	mov	eax, DWORD PTR _index$[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR _ary1$[ebp+eax]
	cmp	ecx, 49					; 00000031H
	jne	SHORT $L1049
	mov	edx, DWORD PTR _carry$[ebp]
	and	edx, 255				; 000000ffH
	cmp	edx, 48					; 00000030H
	jne	SHORT $L1049
; Line 434
	mov	eax, DWORD PTR _index$[ebp]
	mov	BYTE PTR _result$[ebp+eax], 48		; 00000030H
; Line 435
	mov	BYTE PTR _carry$[ebp], 49		; 00000031H
; Line 437
	jmp	SHORT $L1051
$L1049:
	mov	ecx, DWORD PTR _index$[ebp]
	xor	edx, edx
	mov	dl, BYTE PTR _ary2$[ebp+ecx]
	cmp	edx, 49					; 00000031H
	jne	SHORT $L1051
	mov	eax, DWORD PTR _index$[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR _ary1$[ebp+eax]
	cmp	ecx, 49					; 00000031H
	jne	SHORT $L1051
	mov	edx, DWORD PTR _carry$[ebp]
	and	edx, 255				; 000000ffH
	cmp	edx, 49					; 00000031H
	jne	SHORT $L1051
; Line 439
	mov	eax, DWORD PTR _index$[ebp]
	mov	BYTE PTR _result$[ebp+eax], 49		; 00000031H
; Line 440
	mov	BYTE PTR _carry$[ebp], 49		; 00000031H
$L1051:
; Line 443
	mov	ecx, DWORD PTR _index$[ebp]
	sub	ecx, 1
	mov	DWORD PTR _index$[ebp], ecx
; Line 444
	jmp	$L1035
$L1036:
; Line 448
	mov	edx, DWORD PTR _resulthigh$[ebp]
	mov	DWORD PTR [edx], 0
; Line 449
	mov	eax, DWORD PTR _resultlow$[ebp]
	mov	DWORD PTR [eax], 0
; Line 450
	mov	DWORD PTR _imask$[ebp], -2147483648	; 80000000H
; Line 451
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1052
$L1053:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L1052:
	cmp	DWORD PTR _i$[ebp], 32			; 00000020H
	jge	SHORT $L1054
; Line 453
	mov	edx, DWORD PTR _i$[ebp]
	xor	eax, eax
	mov	al, BYTE PTR _result$[ebp+edx]
	cmp	eax, 49					; 00000031H
	jne	SHORT $L1055
; Line 454
	mov	ecx, DWORD PTR _resulthigh$[ebp]
	mov	edx, DWORD PTR [ecx]
	or	edx, DWORD PTR _imask$[ebp]
	mov	eax, DWORD PTR _resulthigh$[ebp]
	mov	DWORD PTR [eax], edx
$L1055:
; Line 455
	mov	ecx, DWORD PTR _imask$[ebp]
	shr	ecx, 1
	mov	DWORD PTR _imask$[ebp], ecx
; Line 456
	jmp	SHORT $L1053
$L1054:
; Line 457
	mov	DWORD PTR _imask$[ebp], -2147483648	; 80000000H
; Line 458
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1056
$L1057:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L1056:
	cmp	DWORD PTR _i$[ebp], 32			; 00000020H
	jge	SHORT $L1058
; Line 460
	mov	eax, DWORD PTR _i$[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR _result$[ebp+eax+32]
	cmp	ecx, 49					; 00000031H
	jne	SHORT $L1059
; Line 461
	mov	edx, DWORD PTR _resultlow$[ebp]
	mov	eax, DWORD PTR [edx]
	or	eax, DWORD PTR _imask$[ebp]
	mov	ecx, DWORD PTR _resultlow$[ebp]
	mov	DWORD PTR [ecx], eax
$L1059:
; Line 462
	mov	edx, DWORD PTR _imask$[ebp]
	shr	edx, 1
	mov	DWORD PTR _imask$[ebp], edx
; Line 463
	jmp	SHORT $L1057
$L1058:
; Line 465
	xor	eax, eax
; Line 466
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
; Line 468
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 469
	call	_CgetTimer32
; Line 471
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
; Line 474
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 475
	mov	eax, DWORD PTR _pos$[ebp]
	push	eax
	call	_CsetCursor32
	add	esp, 4
; Line 476
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
; Line 479
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 480
	call	_CcleanScreen32
; Line 481
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
; Line 484
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 485
	call	_CscrollUp32
; Line 486
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
; Line 494
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 500
	mov	eax, DWORD PTR _pindex$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _pi$[ebp], ecx
; Line 501
	mov	edx, DWORD PTR _pos$[ebp]
	push	edx
	mov	al, BYTE PTR _value$[ebp]
	push	eax
	call	_CprintChar32
	add	esp, 8
	mov	DWORD PTR _retcode$[ebp], eax
; Line 502
	mov	ecx, DWORD PTR _pi$[ebp]
	lea	edx, DWORD PTR [ecx+ecx+480]
	push	edx
	push	80					; 00000050H
	call	_CprintChar32
	add	esp, 8
	mov	DWORD PTR _retcode$[ebp], eax
; Line 503
	mov	eax, DWORD PTR _pindex$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, 1
	mov	edx, DWORD PTR _pindex$[ebp]
	mov	DWORD PTR [edx], ecx
; Line 506
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 507
	mov	esp, ebp
	pop	ebp
	ret	12					; 0000000cH
?AOAprintCharacter@AOAProtected@@QAEHDHPAH@Z ENDP	; AOAProtected::AOAprintCharacter
_value$ = 8
_pos$ = 12
_this$ = -8
_retcode$ = -4
?AOAprintCharacter@AOAProtected@@QAEHDH@Z PROC NEAR	; AOAProtected::AOAprintCharacter
; Line 516
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 519
	cmp	DWORD PTR _pos$[ebp], 0
	jl	SHORT $L1088
	cmp	DWORD PTR _pos$[ebp], 4000		; 00000fa0H
	jl	SHORT $L1087
$L1088:
; Line 521
	or	eax, -1
	jmp	SHORT $L1085
$L1087:
; Line 525
	mov	eax, DWORD PTR _pos$[ebp]
	push	eax
	mov	cl, BYTE PTR _value$[ebp]
	push	ecx
	call	_CprintChar32
	add	esp, 8
	mov	DWORD PTR _retcode$[ebp], eax
; Line 528
	mov	eax, DWORD PTR _retcode$[ebp]
$L1085:
; Line 529
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
; Line 533
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 538
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCursor@AOAProtected@@QAEHXZ	; AOAProtected::AOAgetCursor
	mov	DWORD PTR _pos$[ebp], eax
; Line 539
	mov	eax, DWORD PTR _pos$[ebp]
	push	eax
	mov	cl, BYTE PTR _value$[ebp]
	push	ecx
	call	_CprintChar32
	add	esp, 8
	mov	DWORD PTR _retcode$[ebp], eax
; Line 541
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 542
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
; Line 544
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	mov	DWORD PTR _this$[ebp], ecx
; Line 545
	mov	BYTE PTR _blank$[ebp], 32		; 00000020H
; Line 548
	mov	eax, DWORD PTR _pos$[ebp]
	mov	DWORD PTR _base$[ebp], eax
; Line 549
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1103
$L1104:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L1103:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _count$[ebp]
	jge	SHORT $L1105
; Line 550
	mov	eax, DWORD PTR _base$[ebp]
	push	eax
	mov	cl, BYTE PTR _blank$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintCharacter@AOAProtected@@QAEHDH@Z ; AOAProtected::AOAprintCharacter
; Line 551
	mov	edx, DWORD PTR _base$[ebp]
	add	edx, 2
	mov	DWORD PTR _base$[ebp], edx
; Line 552
	jmp	SHORT $L1104
$L1105:
; Line 554
	xor	eax, eax
; Line 555
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
; Line 557
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	mov	DWORD PTR _this$[ebp], ecx
; Line 558
	mov	BYTE PTR _blank$[ebp], 32		; 00000020H
; Line 561
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCursor@AOAProtected@@QAEHXZ	; AOAProtected::AOAgetCursor
	mov	DWORD PTR _base$[ebp], eax
; Line 562
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1113
$L1114:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L1113:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _count$[ebp]
	jge	SHORT $L1115
; Line 563
	mov	edx, DWORD PTR _base$[ebp]
	push	edx
	mov	al, BYTE PTR _blank$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintCharacter@AOAProtected@@QAEHDH@Z ; AOAProtected::AOAprintCharacter
; Line 564
	mov	ecx, DWORD PTR _base$[ebp]
	add	ecx, 1
	mov	DWORD PTR _base$[ebp], ecx
; Line 565
	jmp	SHORT $L1114
$L1115:
; Line 567
	xor	eax, eax
; Line 568
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
; Line 570
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 571
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1121
$L1122:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L1121:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _lines$[ebp]
	jge	SHORT $L1123
; Line 572
	call	_CnewLine32
	jmp	SHORT $L1122
$L1123:
; Line 574
	xor	eax, eax
; Line 575
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
; Line 577
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 578
	mov	eax, DWORD PTR _pos$[ebp]
	push	eax
	mov	ecx, DWORD PTR _value$[ebp]
	push	ecx
	call	_CprintDec32
	add	esp, 8
; Line 579
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
; Line 581
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 582
	mov	DWORD PTR _i$[ebp], 0
; Line 584
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCursor@AOAProtected@@QAEHXZ	; AOAProtected::AOAgetCursor
	mov	DWORD PTR _pos$[ebp], eax
; Line 585
	mov	eax, DWORD PTR _pos$[ebp]
	push	eax
	mov	ecx, DWORD PTR _value$[ebp]
	push	ecx
	call	_CprintDec32
	add	esp, 8
	mov	DWORD PTR _i$[ebp], eax
; Line 587
	mov	eax, DWORD PTR _i$[ebp]
; Line 588
	mov	esp, ebp
	pop	ebp
	ret	4
?AOAprintDecimal@AOAProtected@@QAEHH@Z ENDP		; AOAProtected::AOAprintDecimal
_TEXT	ENDS
PUBLIC	?AOAPrintText@AOAProtected@@QAEXPADH@Z		; AOAProtected::AOAPrintText
_DATA	SEGMENT
	ORG $+3
$SG1150	DB	'line no is beyond the limit (0 to 4000)', 00H
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
; Line 595
	push	ebp
	mov	ebp, esp
	sub	esp, 52					; 00000034H
	mov	DWORD PTR _this$[ebp], ecx
; Line 596
	mov	DWORD PTR _i$[ebp], 0
; Line 599
	mov	DWORD PTR _maskv$[ebp], -268435456	; f0000000H
; Line 600
	mov	DWORD PTR _datav$[ebp], 0
; Line 601
	mov	DWORD PTR _indexv$[ebp], 0
; Line 602
	mov	DWORD PTR _positionv$[ebp], 0
; Line 603
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
; Line 604
	mov	BYTE PTR _HexTable$[ebp+10], 65		; 00000041H
	mov	BYTE PTR _HexTable$[ebp+11], 66		; 00000042H
	mov	BYTE PTR _HexTable$[ebp+12], 67		; 00000043H
	mov	BYTE PTR _HexTable$[ebp+13], 68		; 00000044H
	mov	BYTE PTR _HexTable$[ebp+14], 69		; 00000045H
	mov	BYTE PTR _HexTable$[ebp+15], 70		; 00000046H
	mov	BYTE PTR _HexTable$[ebp+16], 0
; Line 608
	mov	eax, DWORD PTR _value$[ebp]
	mov	DWORD PTR _datav$[ebp], eax
; Line 609
	mov	ecx, DWORD PTR _pos$[ebp]
	mov	DWORD PTR _positionv$[ebp], ecx
; Line 610
	cmp	DWORD PTR _pos$[ebp], 0
	jl	SHORT $L1149
	cmp	DWORD PTR _pos$[ebp], 4000		; 00000fa0H
	jl	SHORT $L1148
$L1149:
; Line 612
	push	3840					; 00000f00H
	push	OFFSET FLAT:$SG1150
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 613
	or	eax, -1
	jmp	SHORT $L1139
$L1148:
; Line 615
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1151
$L1152:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L1151:
	cmp	DWORD PTR _i$[ebp], 8
	jge	SHORT $L1153
; Line 617
	mov	eax, DWORD PTR _datav$[ebp]
	and	eax, DWORD PTR _maskv$[ebp]
	mov	DWORD PTR _indexv$[ebp], eax
; Line 618
	mov	ecx, DWORD PTR _datav$[ebp]
	shr	ecx, 28					; 0000001cH
	mov	DWORD PTR _indexv$[ebp], ecx
; Line 619
	mov	edx, DWORD PTR _indexv$[ebp]
	mov	al, BYTE PTR _HexTable$[ebp+edx]
	mov	BYTE PTR _c$[ebp], al
; Line 620
	mov	ecx, DWORD PTR _positionv$[ebp]
	push	ecx
	mov	dl, BYTE PTR _c$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintCharacter@AOAProtected@@QAEHDH@Z ; AOAProtected::AOAprintCharacter
	mov	DWORD PTR _retcode$[ebp], eax
; Line 621
	mov	eax, DWORD PTR _positionv$[ebp]
	add	eax, 2
	mov	DWORD PTR _positionv$[ebp], eax
; Line 622
	mov	ecx, DWORD PTR _datav$[ebp]
	shl	ecx, 4
	mov	DWORD PTR _datav$[ebp], ecx
; Line 623
	jmp	SHORT $L1152
$L1153:
; Line 625
	mov	eax, DWORD PTR _retcode$[ebp]
$L1139:
; Line 626
	mov	esp, ebp
	pop	ebp
	ret	8
?AOAprintHex@AOAProtected@@QAEHJH@Z ENDP		; AOAProtected::AOAprintHex
_TEXT	ENDS
PUBLIC	?AOAprintHex@AOAProtected@@QAEHPADH@Z		; AOAProtected::AOAprintHex
_DATA	SEGMENT
$SG1172	DB	'line no is beyond the limit (0 to 4000)', 00H
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
; Line 633
	push	ebp
	mov	ebp, esp
	sub	esp, 60					; 0000003cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 634
	mov	DWORD PTR _i$[ebp], 0
; Line 637
	mov	DWORD PTR _maskv$[ebp], -268435456	; f0000000H
; Line 638
	mov	DWORD PTR _datav$[ebp], 0
; Line 641
	mov	DWORD PTR _indexv$[ebp], 0
; Line 642
	mov	DWORD PTR _positionv$[ebp], 0
; Line 643
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
; Line 644
	mov	BYTE PTR _HexTable$[ebp+10], 65		; 00000041H
	mov	BYTE PTR _HexTable$[ebp+11], 66		; 00000042H
	mov	BYTE PTR _HexTable$[ebp+12], 67		; 00000043H
	mov	BYTE PTR _HexTable$[ebp+13], 68		; 00000044H
	mov	BYTE PTR _HexTable$[ebp+14], 69		; 00000045H
	mov	BYTE PTR _HexTable$[ebp+15], 70		; 00000046H
	mov	BYTE PTR _HexTable$[ebp+16], 0
; Line 645
	lea	eax, DWORD PTR _p2$[ebp]
	mov	DWORD PTR _p1$[ebp], eax
; Line 649
	mov	ecx, DWORD PTR _value$[ebp]
	mov	DWORD PTR _p1$[ebp], ecx
; Line 650
	mov	edx, DWORD PTR _p1$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR _datav$[ebp], eax
; Line 652
	mov	ecx, DWORD PTR _pos$[ebp]
	mov	DWORD PTR _positionv$[ebp], ecx
; Line 653
	cmp	DWORD PTR _pos$[ebp], 0
	jl	SHORT $L1171
	cmp	DWORD PTR _pos$[ebp], 4000		; 00000fa0H
	jl	SHORT $L1170
$L1171:
; Line 655
	push	3840					; 00000f00H
	push	OFFSET FLAT:$SG1172
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 656
	or	eax, -1
	jmp	SHORT $L1158
$L1170:
; Line 658
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1173
$L1174:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L1173:
	cmp	DWORD PTR _i$[ebp], 8
	jge	SHORT $L1175
; Line 660
	mov	eax, DWORD PTR _datav$[ebp]
	and	eax, DWORD PTR _maskv$[ebp]
	mov	DWORD PTR _indexv$[ebp], eax
; Line 661
	mov	ecx, DWORD PTR _datav$[ebp]
	shr	ecx, 28					; 0000001cH
	mov	DWORD PTR _indexv$[ebp], ecx
; Line 662
	mov	edx, DWORD PTR _indexv$[ebp]
	mov	al, BYTE PTR _HexTable$[ebp+edx]
	mov	BYTE PTR _c$[ebp], al
; Line 663
	mov	ecx, DWORD PTR _positionv$[ebp]
	push	ecx
	mov	dl, BYTE PTR _c$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintCharacter@AOAProtected@@QAEHDH@Z ; AOAProtected::AOAprintCharacter
	mov	DWORD PTR _retcode$[ebp], eax
; Line 664
	mov	eax, DWORD PTR _positionv$[ebp]
	add	eax, 2
	mov	DWORD PTR _positionv$[ebp], eax
; Line 665
	mov	ecx, DWORD PTR _datav$[ebp]
	shl	ecx, 4
	mov	DWORD PTR _datav$[ebp], ecx
; Line 666
	jmp	SHORT $L1174
$L1175:
; Line 668
	mov	eax, DWORD PTR _retcode$[ebp]
$L1158:
; Line 669
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
; Line 671
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 672
	mov	DWORD PTR _i$[ebp], 0
; Line 673
	call	_CclearNTFlag
	mov	DWORD PTR _i$[ebp], eax
; Line 674
	mov	eax, DWORD PTR _i$[ebp]
; Line 675
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
; Line 677
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 678
	mov	DWORD PTR _i$[ebp], 0
; Line 679
	mov	eax, DWORD PTR _pos$[ebp]
	push	eax
	call	_CprintFlags32
	add	esp, 4
	mov	DWORD PTR _i$[ebp], eax
; Line 680
	mov	eax, DWORD PTR _i$[ebp]
; Line 681
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
; Line 683
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 684
	mov	DWORD PTR _i$[ebp], 0
; Line 686
	cli
; Line 687
	push	eax
; Line 688
	pushfd
; Line 689
	pop	eax
; Line 690
	mov	DWORD PTR _i$[ebp], eax
; Line 691
	pop	eax
; Line 692
	sti
; Line 694
	mov	eax, DWORD PTR _i$[ebp]
; Line 695
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
; Line 697
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 698
	mov	eax, DWORD PTR _base$[ebp]
	push	eax
	mov	ecx, DWORD PTR _index$[ebp]
	push	ecx
	call	_CgetSharedMemChar32
	add	esp, 8
; Line 699
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
; Line 703
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 704
	mov	DWORD PTR _retcode$[ebp], 0
; Line 705
	push	0
	push	288					; 00000120H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 706
	push	0
	push	292					; 00000124H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 707
	push	0
	push	296					; 00000128H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 708
	push	1
	push	304					; 00000130H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 709
	call	_CreadRTC
	mov	DWORD PTR _retcode$[ebp], eax
; Line 710
	push	0
	push	304					; 00000130H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 711
	push	288					; 00000120H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetSharedMem@AOAProtected@@QAEJH@Z	; AOAProtected::AOAgetSharedMem
	mov	DWORD PTR _retcode$[ebp], eax
; Line 712
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 713
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
; Line 715
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 716
	mov	DWORD PTR _retcode$[ebp], 0
; Line 717
	push	0
	push	288					; 00000120H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 718
	push	0
	push	292					; 00000124H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 719
	push	0
	push	296					; 00000128H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 720
	push	2
	push	304					; 00000130H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 721
	call	_CreadDATE
	mov	DWORD PTR _retcode$[ebp], eax
; Line 722
	push	0
	push	304					; 00000130H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 723
	push	292					; 00000124H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetSharedMem@AOAProtected@@QAEJH@Z	; AOAProtected::AOAgetSharedMem
	mov	DWORD PTR _retcode$[ebp], eax
; Line 724
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 725
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
; Line 727
	push	ebp
	mov	ebp, esp
	sub	esp, 44					; 0000002cH
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 730
	mov	DWORD PTR _b$[ebp], 0
; Line 732
	mov	DWORD PTR _v1$[ebp], 0
; Line 733
	mov	DWORD PTR _c1$[ebp], 0
; Line 734
	mov	DWORD PTR _c2$[ebp], 0
; Line 736
	mov	DWORD PTR _day$[ebp], 0
; Line 737
	mov	DWORD PTR _mon$[ebp], 0
; Line 738
	mov	DWORD PTR _year$[ebp], 0
; Line 739
	mov	DWORD PTR _hour$[ebp], 0
; Line 740
	mov	DWORD PTR _min$[ebp], 0
; Line 741
	mov	DWORD PTR _sec$[ebp], 0
; Line 742
	mov	DWORD PTR _c1$[ebp], 863398800		; 33766b90H
; Line 743
	mov	DWORD PTR _c2$[ebp], 0
; Line 745
	mov	eax, DWORD PTR _date$[ebp]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _day$[ebp], eax
; Line 747
	mov	ecx, DWORD PTR _date$[ebp]
	and	ecx, 65280				; 0000ff00H
	mov	DWORD PTR _b$[ebp], ecx
; Line 748
	mov	edx, DWORD PTR _b$[ebp]
	shr	edx, 8
	mov	DWORD PTR _mon$[ebp], edx
; Line 750
	mov	eax, DWORD PTR _date$[ebp]
	and	eax, -65536				; ffff0000H
	mov	DWORD PTR _b$[ebp], eax
; Line 751
	mov	ecx, DWORD PTR _b$[ebp]
	shr	ecx, 16					; 00000010H
	mov	DWORD PTR _year$[ebp], ecx
; Line 754
	mov	edx, DWORD PTR _rtc$[ebp]
	and	edx, 65280				; 0000ff00H
	mov	DWORD PTR _b$[ebp], edx
; Line 755
	mov	eax, DWORD PTR _b$[ebp]
	shr	eax, 8
	mov	DWORD PTR _sec$[ebp], eax
; Line 757
	mov	ecx, DWORD PTR _rtc$[ebp]
	and	ecx, 16711680				; 00ff0000H
	mov	DWORD PTR _b$[ebp], ecx
; Line 758
	mov	edx, DWORD PTR _b$[ebp]
	shr	edx, 16					; 00000010H
	mov	DWORD PTR _min$[ebp], edx
; Line 760
	mov	eax, DWORD PTR _rtc$[ebp]
	and	eax, -16777216				; ff000000H
	mov	DWORD PTR _b$[ebp], eax
; Line 761
	mov	ecx, DWORD PTR _b$[ebp]
	shr	ecx, 24					; 00000018H
	mov	DWORD PTR _hour$[ebp], ecx
; Line 763
	mov	edx, DWORD PTR _year$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAconvertCharToInt@AOAProtected@@QAEIH@Z ; AOAProtected::AOAconvertCharToInt
	mov	DWORD PTR _year$[ebp], eax
; Line 764
	mov	eax, DWORD PTR _mon$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAconvertCharToInt@AOAProtected@@QAEIH@Z ; AOAProtected::AOAconvertCharToInt
	mov	DWORD PTR _mon$[ebp], eax
; Line 765
	mov	ecx, DWORD PTR _day$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAconvertCharToInt@AOAProtected@@QAEIH@Z ; AOAProtected::AOAconvertCharToInt
	mov	DWORD PTR _day$[ebp], eax
; Line 766
	mov	edx, DWORD PTR _hour$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAconvertCharToInt@AOAProtected@@QAEIH@Z ; AOAProtected::AOAconvertCharToInt
	mov	DWORD PTR _hour$[ebp], eax
; Line 767
	mov	eax, DWORD PTR _min$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAconvertCharToInt@AOAProtected@@QAEIH@Z ; AOAProtected::AOAconvertCharToInt
	mov	DWORD PTR _min$[ebp], eax
; Line 768
	mov	ecx, DWORD PTR _sec$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAconvertCharToInt@AOAProtected@@QAEIH@Z ; AOAProtected::AOAconvertCharToInt
	mov	DWORD PTR _sec$[ebp], eax
; Line 770
	mov	edx, DWORD PTR _mon$[ebp]
	sub	edx, 2
	mov	DWORD PTR _mon$[ebp], edx
	cmp	DWORD PTR _mon$[ebp], 0
	jg	SHORT $L1218
; Line 771
	mov	eax, DWORD PTR _mon$[ebp]
	add	eax, 12					; 0000000cH
	mov	DWORD PTR _mon$[ebp], eax
; Line 772
	mov	ecx, DWORD PTR _year$[ebp]
	sub	ecx, 1
	mov	DWORD PTR _year$[ebp], ecx
$L1218:
; Line 779
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
; Line 794
	pop	edi
	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	8
?AOAUnixTime@AOAProtected@@QAEKII@Z ENDP		; AOAProtected::AOAUnixTime
_TEXT	ENDS
PUBLIC	?AOApower10@AOAProtected@@QAEIH@Z		; AOAProtected::AOApower10
_DATA	SEGMENT
$SG1232	DB	'Error:AOAprotected Not a valid character in conversion t'
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
; Line 800
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	mov	DWORD PTR _this$[ebp], ecx
; Line 801
	mov	DWORD PTR _value$[ebp], 0
; Line 802
	mov	DWORD PTR _value1$[ebp], 0
; Line 803
	mov	DWORD PTR _value2$[ebp], 0
; Line 804
	mov	DWORD PTR _i$[ebp], 0
; Line 806
	mov	eax, DWORD PTR _chars$[ebp]
	mov	DWORD PTR _value1$[ebp], eax
; Line 807
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1227
$L1228:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L1227:
	cmp	DWORD PTR _i$[ebp], 8
	jge	SHORT $L1229
; Line 809
	mov	edx, DWORD PTR _value1$[ebp]
	and	edx, 15					; 0000000fH
	mov	DWORD PTR _value2$[ebp], edx
; Line 810
	cmp	DWORD PTR _value2$[ebp], 0
	jb	SHORT $L1231
	cmp	DWORD PTR _value2$[ebp], 9
	jbe	SHORT $L1230
$L1231:
; Line 812
	push	3700					; 00000e74H
	push	OFFSET FLAT:$SG1232
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 813
	or	eax, -1
	jmp	SHORT $L1222
$L1230:
; Line 817
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOApower10@AOAProtected@@QAEIH@Z	; AOAProtected::AOApower10
	mov	ecx, DWORD PTR _value2$[ebp]
	imul	ecx, eax
	mov	edx, DWORD PTR _value$[ebp]
	add	edx, ecx
	mov	DWORD PTR _value$[ebp], edx
; Line 819
	mov	eax, DWORD PTR _value1$[ebp]
	shr	eax, 4
	mov	DWORD PTR _value1$[ebp], eax
; Line 820
	jmp	SHORT $L1228
$L1229:
; Line 821
	mov	eax, DWORD PTR _value$[ebp]
$L1222:
; Line 822
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
; Line 827
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	mov	DWORD PTR _this$[ebp], ecx
; Line 828
	mov	DWORD PTR _value1$[ebp], 0
; Line 829
	mov	DWORD PTR _value2$[ebp], 0
; Line 830
	mov	DWORD PTR _i$[ebp], 0
; Line 831
	mov	eax, DWORD PTR _value$[ebp]
	mov	DWORD PTR _value2$[ebp], eax
; Line 832
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1242
$L1243:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L1242:
	cmp	DWORD PTR _i$[ebp], 8
	jge	SHORT $L1244
; Line 834
	mov	edx, DWORD PTR _value2$[ebp]
	and	edx, 15					; 0000000fH
	mov	DWORD PTR _value1$[ebp], edx
; Line 835
	mov	eax, DWORD PTR _value1$[ebp]
	add	eax, 48					; 00000030H
	mov	ecx, 7
	sub	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _chars$[ebp]
	mov	BYTE PTR [edx+ecx], al
; Line 836
	mov	eax, DWORD PTR _value2$[ebp]
	shr	eax, 4
	mov	DWORD PTR _value2$[ebp], eax
; Line 837
	jmp	SHORT $L1243
$L1244:
; Line 838
	xor	eax, eax
; Line 839
	mov	esp, ebp
	pop	ebp
	ret	8
?AOAconvertIntToChar@AOAProtected@@QAEHPADI@Z ENDP	; AOAProtected::AOAconvertIntToChar
_tenpower$ = 8
_this$ = -12
_i$ = -8
_value$ = -4
?AOApower10@AOAProtected@@QAEIH@Z PROC NEAR		; AOAProtected::AOApower10
; Line 844
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 845
	mov	DWORD PTR _i$[ebp], 0
; Line 846
	mov	DWORD PTR _value$[ebp], 1
; Line 847
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1251
$L1252:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L1251:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _tenpower$[ebp]
	jge	SHORT $L1253
; Line 849
	mov	edx, DWORD PTR _value$[ebp]
	imul	edx, 10					; 0000000aH
	mov	DWORD PTR _value$[ebp], edx
; Line 850
	jmp	SHORT $L1252
$L1253:
; Line 851
	mov	eax, DWORD PTR _value$[ebp]
; Line 852
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
; Line 858
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 859
	mov	eax, DWORD PTR _tid$[ebp]
	push	eax
	mov	ecx, DWORD PTR _lock$[ebp]
	push	ecx
	call	_CresetLock32
	add	esp, 8
; Line 860
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
; Line 867
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 870
	push	76					; 0000004cH
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetSharedMem@AOAProtected@@QAEJH@Z	; AOAProtected::AOAgetSharedMem
	mov	DWORD PTR _storedlock$[ebp], eax
; Line 871
	mov	eax, DWORD PTR _lock$[ebp]
	add	eax, 92					; 0000005cH
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetSharedMem@AOAProtected@@QAEJH@Z	; AOAProtected::AOAgetSharedMem
	mov	DWORD PTR _taskid$[ebp], eax
; Line 873
	cmp	DWORD PTR _storedlock$[ebp], 1
	jne	SHORT $L1266
	mov	ecx, DWORD PTR _taskid$[ebp]
	cmp	ecx, DWORD PTR _tid$[ebp]
	jne	SHORT $L1266
; Line 874
	xor	eax, eax
	jmp	SHORT $L1267
$L1266:
; Line 876
	mov	edx, DWORD PTR _tid$[ebp]
	push	edx
	mov	eax, DWORD PTR _lock$[ebp]
	push	eax
	call	_CtestAndSet32
	add	esp, 8
$L1267:
; Line 877
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
; Line 881
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 882
	mov	DWORD PTR _i$[ebp], 0
; Line 883
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1273
$L1274:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L1273:
	cmp	DWORD PTR _i$[ebp], 40			; 00000028H
	jge	SHORT $L1275
; Line 884
	push	36					; 00000024H
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetSharedMemChar@AOAProtected@@QAEDHH@Z ; AOAProtected::AOAgetSharedMemChar
	mov	edx, DWORD PTR _array1$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	mov	BYTE PTR [edx], al
	jmp	SHORT $L1274
$L1275:
; Line 886
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
; Line 890
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 891
	mov	DWORD PTR _i$[ebp], 0
; Line 892
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1281
$L1282:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L1281:
	cmp	DWORD PTR _i$[ebp], 40			; 00000028H
	jge	SHORT $L1283
; Line 893
	push	36					; 00000024H
	mov	ecx, DWORD PTR _array1$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	dl, BYTE PTR [ecx]
	push	edx
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMemChar@AOAProtected@@QAEXHDH@Z ; AOAProtected::AOAsetSharedMemChar
	jmp	SHORT $L1282
$L1283:
; Line 895
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
; Line 897
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 898
	mov	eax, DWORD PTR _base$[ebp]
	push	eax
	mov	cl, BYTE PTR _c$[ebp]
	push	ecx
	mov	edx, DWORD PTR _index$[ebp]
	push	edx
	call	_CsetSharedMemChar32
	add	esp, 12					; 0000000cH
; Line 899
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
; Line 902
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 903
	mov	eax, DWORD PTR _index$[ebp]
	push	eax
	call	_CgetSharedMem32
	add	esp, 4
; Line 904
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
; Line 906
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 907
	mov	eax, DWORD PTR _val$[ebp]
	push	eax
	mov	ecx, DWORD PTR _index$[ebp]
	push	ecx
	call	_CsetSharedMem32
	add	esp, 8
; Line 908
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
; Line 912
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 913
	mov	eax, DWORD PTR _addr$[ebp]
	push	eax
	call	_CgetMem32
	add	esp, 4
; Line 914
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
; Line 918
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 919
	mov	eax, DWORD PTR _data$[ebp]
	push	eax
	mov	ecx, DWORD PTR _addr$[ebp]
	push	ecx
	call	_CsetMem32
	add	esp, 8
; Line 920
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
; Line 922
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 923
	mov	eax, DWORD PTR _pos$[ebp]
	push	eax
	call	_CprintRegs32
	add	esp, 4
; Line 924
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
; Line 926
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 927
	mov	eax, DWORD PTR _pos$[ebp]
	push	eax
	call	_CprintStackRegs32
	add	esp, 4
; Line 928
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
; Line 930
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 931
	mov	eax, DWORD PTR _index$[ebp]
	push	eax
	call	_CgetStackPOP32
	add	esp, 4
; Line 932
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
; Line 937
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	mov	DWORD PTR _this$[ebp], ecx
; Line 939
	mov	DWORD PTR _mul$[ebp], 10		; 0000000aH
; Line 940
	mov	DWORD PTR _result$[ebp], 0
; Line 942
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	BYTE PTR _ch$[ebp], al
$L1327:
; Line 943
	movsx	eax, BYTE PTR _ch$[ebp]
	cmp	eax, 48					; 00000030H
	jl	SHORT $L1328
	movsx	ecx, BYTE PTR _ch$[ebp]
	cmp	ecx, 57					; 00000039H
	jg	SHORT $L1328
; Line 944
	mov	edx, DWORD PTR _result$[ebp]
	imul	edx, DWORD PTR _mul$[ebp]
	mov	DWORD PTR _result$[ebp], edx
; Line 945
	movsx	eax, BYTE PTR _ch$[ebp]
	mov	ecx, DWORD PTR _result$[ebp]
	lea	edx, DWORD PTR [ecx+eax-48]
	mov	DWORD PTR _result$[ebp], edx
; Line 946
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	BYTE PTR _ch$[ebp], al
; Line 947
	jmp	SHORT $L1327
$L1328:
; Line 949
	mov	eax, DWORD PTR _result$[ebp]
; Line 950
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
; Line 955
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	mov	DWORD PTR _this$[ebp], ecx
; Line 957
	mov	DWORD PTR _mul$[ebp], 16		; 00000010H
; Line 958
	mov	DWORD PTR _result$[ebp], 0
; Line 959
	mov	DWORD PTR _tmp$[ebp], 0
; Line 961
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	BYTE PTR _ch$[ebp], al
$L1337:
; Line 962
	movsx	eax, BYTE PTR _ch$[ebp]
	cmp	eax, 48					; 00000030H
	jl	SHORT $L1340
	movsx	ecx, BYTE PTR _ch$[ebp]
	cmp	ecx, 57					; 00000039H
	jle	SHORT $L1339
$L1340:
	movsx	edx, BYTE PTR _ch$[ebp]
	cmp	edx, 97					; 00000061H
	jl	SHORT $L1341
	movsx	eax, BYTE PTR _ch$[ebp]
	cmp	eax, 102				; 00000066H
	jle	SHORT $L1339
$L1341:
	movsx	ecx, BYTE PTR _ch$[ebp]
	cmp	ecx, 65					; 00000041H
	jl	SHORT $L1338
	movsx	edx, BYTE PTR _ch$[ebp]
	cmp	edx, 70					; 00000046H
	jg	SHORT $L1338
$L1339:
; Line 963
	movsx	eax, BYTE PTR _ch$[ebp]
	cmp	eax, 48					; 00000030H
	jl	SHORT $L1342
	movsx	ecx, BYTE PTR _ch$[ebp]
	cmp	ecx, 57					; 00000039H
	jg	SHORT $L1342
; Line 964
	movsx	edx, BYTE PTR _ch$[ebp]
	sub	edx, 48					; 00000030H
	mov	DWORD PTR _tmp$[ebp], edx
; Line 965
	jmp	SHORT $L1345
$L1342:
	movsx	eax, BYTE PTR _ch$[ebp]
	cmp	eax, 97					; 00000061H
	jl	SHORT $L1344
	movsx	ecx, BYTE PTR _ch$[ebp]
	cmp	ecx, 102				; 00000066H
	jg	SHORT $L1344
; Line 966
	movsx	edx, BYTE PTR _ch$[ebp]
	sub	edx, 87					; 00000057H
	mov	DWORD PTR _tmp$[ebp], edx
; Line 967
	jmp	SHORT $L1345
$L1344:
; Line 968
	movsx	eax, BYTE PTR _ch$[ebp]
	sub	eax, 55					; 00000037H
	mov	DWORD PTR _tmp$[ebp], eax
$L1345:
; Line 971
	mov	ecx, DWORD PTR _result$[ebp]
	imul	ecx, DWORD PTR _mul$[ebp]
	mov	DWORD PTR _result$[ebp], ecx
; Line 972
	mov	edx, DWORD PTR _result$[ebp]
	add	edx, DWORD PTR _tmp$[ebp]
	mov	DWORD PTR _result$[ebp], edx
; Line 973
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	BYTE PTR _ch$[ebp], al
; Line 974
	jmp	$L1337
$L1338:
; Line 976
	mov	eax, DWORD PTR _result$[ebp]
; Line 977
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
; Line 982
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 986
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCursor@AOAProtected@@QAEHXZ	; AOAProtected::AOAgetCursor
	mov	DWORD PTR _cursorp$[ebp], eax
; Line 987
	mov	eax, DWORD PTR _cursorp$[ebp]
	push	eax
	call	_CgetChar32
	add	esp, 4
	mov	BYTE PTR _c$[ebp], al
; Line 988
	mov	ecx, DWORD PTR _cursorp$[ebp]
	shl	ecx, 1
	push	ecx
	mov	dl, BYTE PTR _c$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintCharacter@AOAProtected@@QAEHDH@Z ; AOAProtected::AOAprintCharacter
; Line 989
	mov	eax, DWORD PTR _cursorp$[ebp]
	add	eax, 1
	mov	DWORD PTR _cursorp$[ebp], eax
; Line 990
	mov	ecx, DWORD PTR _cursorp$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetCursor@AOAProtected@@QAEHH@Z	; AOAProtected::AOAsetCursor
; Line 991
	mov	al, BYTE PTR _c$[ebp]
; Line 992
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
; Line 997
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 998
	call	_CgetCharInt32
; Line 999
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
; Line 1003
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
	mov	BYTE PTR _i$[ebp], 0
; Line 1004
	call	_CgetCharBuff32
	mov	BYTE PTR _i$[ebp], al
; Line 1005
	mov	al, BYTE PTR _i$[ebp]
; Line 1006
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
; Line 1009
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 1010
	mov	eax, DWORD PTR _sectorno$[ebp]
	push	eax
	mov	ecx, DWORD PTR _buff$[ebp]
	push	ecx
	call	_CreadFloppy32
	add	esp, 8
; Line 1011
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
	call	_CwriteFloppy32
	add	esp, 8
; Line 1016
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
; Line 1019
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 1020
	mov	eax, DWORD PTR _MEMBaseValue$[ebp]
	mov	DWORD PTR _ptr$[ebp], eax
; Line 1021
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1376
$L1377:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 4
	mov	DWORD PTR _i$[ebp], ecx
$L1376:
	mov	edx, DWORD PTR _MEMSizePtr$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx]
	jge	SHORT $L1378
; Line 1023
	mov	ecx, DWORD PTR _ptr$[ebp]
	mov	DWORD PTR [ecx], 0
; Line 1024
	mov	edx, DWORD PTR _ptr$[ebp]
	add	edx, 4
	mov	DWORD PTR _ptr$[ebp], edx
; Line 1025
	jmp	SHORT $L1377
$L1378:
; Line 1026
	xor	eax, eax
; Line 1027
	mov	esp, ebp
	pop	ebp
	ret	8
?AOAclearTotalMemory@AOAProtected@@QAEHJPAJ@Z ENDP	; AOAProtected::AOAclearTotalMemory
_TEXT	ENDS
PUBLIC	?AOAExit@AOAProtected@@QAEXXZ			; AOAProtected::AOAExit
_TEXT	SEGMENT
_this$ = -4
?AOAExit@AOAProtected@@QAEXXZ PROC NEAR			; AOAProtected::AOAExit
; Line 1035
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1037
	cli
; Line 1038
	pop	edi
; Line 1039
	pop	esi
; Line 1040
	pop	ebx
; Line 1041
	mov	esp, ebp
; Line 1042
	pop	ebp
; Line 1043
	sti
; Line 1044
	iretd
; Line 1046
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
; Line 1064
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1076
	pop	edi
; Line 1077
	pop	esi
; Line 1078
	pop	ebx
; Line 1079
	mov	esp, ebp
; Line 1080
	pop	ebp
; Line 1082
	pop	edi
; Line 1083
	pop	esi
; Line 1084
	pop	ebx
; Line 1085
	mov	esp, ebp
; Line 1086
	pop	ebp
; Line 1090
	push	edx
; Line 1091
	pushfd
; Line 1094
	pop	edx
; Line 1095
	and	edx, -16385				; ffffbfffH
; Line 1096
	push	edx
; Line 1097
	popfd
; Line 1098
	pop	edx
; Line 1101
	sti
; Line 1103
	iretd
; Line 1106
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
; Line 1111
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 1112
	mov	DWORD PTR _temp$[ebp], 0
; Line 1113
	mov	eax, DWORD PTR _base$[ebp]
	mov	DWORD PTR _temp$[ebp], eax
; Line 1115
	cmp	DWORD PTR _base$[ebp], 0
	jl	SHORT $L1392
	cmp	DWORD PTR _base$[ebp], 4000		; 00000fa0H
	jl	SHORT $L1391
$L1392:
; Line 1117
	jmp	SHORT $L1389
$L1391:
; Line 1120
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1394
$L1395:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L1394:
	mov	edx, DWORD PTR _str$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L1396
	cmp	DWORD PTR _i$[ebp], 80			; 00000050H
	jge	SHORT $L1396
; Line 1122
	mov	ecx, DWORD PTR _temp$[ebp]
	push	ecx
	mov	edx, DWORD PTR _str$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	mov	al, BYTE PTR [edx]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintCharacter@AOAProtected@@QAEHDH@Z ; AOAProtected::AOAprintCharacter
; Line 1123
	mov	ecx, DWORD PTR _temp$[ebp]
	add	ecx, 2
	mov	DWORD PTR _temp$[ebp], ecx
; Line 1124
	jmp	SHORT $L1395
$L1396:
$L1389:
; Line 1127
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
; Line 1132
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 1134
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1404
$L1405:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L1404:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _length$[ebp]
	jge	SHORT $L1406
; Line 1136
	mov	edx, DWORD PTR _base$[ebp]
	push	edx
	mov	eax, DWORD PTR _str$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	mov	cl, BYTE PTR [eax]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintCharacter@AOAProtected@@QAEHDH@Z ; AOAProtected::AOAprintCharacter
; Line 1137
	mov	edx, DWORD PTR _base$[ebp]
	add	edx, 2
	mov	DWORD PTR _base$[ebp], edx
; Line 1138
	jmp	SHORT $L1405
$L1406:
; Line 1141
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
; Line 1147
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	mov	DWORD PTR _this$[ebp], ecx
; Line 1149
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCursor@AOAProtected@@QAEHXZ	; AOAProtected::AOAgetCursor
	mov	DWORD PTR _charpos$[ebp], eax
; Line 1150
	mov	eax, DWORD PTR _charpos$[ebp]
	shl	eax, 1
	mov	DWORD PTR _base$[ebp], eax
; Line 1152
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1415
$L1416:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L1415:
	mov	edx, DWORD PTR _str$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L1417
; Line 1154
	mov	ecx, DWORD PTR _str$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, 10					; 0000000aH
	jne	SHORT $L1418
; Line 1156
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCursor@AOAProtected@@QAEHXZ	; AOAProtected::AOAgetCursor
	mov	DWORD PTR _charpos$[ebp], eax
; Line 1157
	mov	eax, DWORD PTR _charpos$[ebp]
	cdq
	mov	ecx, 80					; 00000050H
	idiv	ecx
	mov	DWORD PTR _temp1$[ebp], edx
; Line 1158
	mov	edx, 80					; 00000050H
	sub	edx, DWORD PTR _temp1$[ebp]
	mov	eax, DWORD PTR _charpos$[ebp]
	add	eax, edx
	mov	DWORD PTR _charpos$[ebp], eax
; Line 1159
	mov	ecx, DWORD PTR _charpos$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetCursor@AOAProtected@@QAEHH@Z	; AOAProtected::AOAsetCursor
; Line 1161
	jmp	SHORT $L1419
$L1418:
; Line 1163
	mov	edx, DWORD PTR _base$[ebp]
	push	edx
	mov	eax, DWORD PTR _str$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	mov	cl, BYTE PTR [eax]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintCharacter@AOAProtected@@QAEHDH@Z ; AOAProtected::AOAprintCharacter
; Line 1164
	mov	edx, DWORD PTR _base$[ebp]
	add	edx, 2
	mov	DWORD PTR _base$[ebp], edx
$L1419:
; Line 1166
	jmp	SHORT $L1416
$L1417:
; Line 1167
	mov	eax, DWORD PTR _base$[ebp]
	cdq
	sub	eax, edx
	sar	eax, 1
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetCursor@AOAProtected@@QAEHH@Z	; AOAProtected::AOAsetCursor
; Line 1169
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
; Line 1175
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	mov	DWORD PTR _this$[ebp], ecx
; Line 1176
	mov	BYTE PTR _t1$[ebp], 32			; 00000020H
; Line 1177
	mov	BYTE PTR _c1$[ebp], 0
; Line 1178
	mov	BYTE PTR _c2$[ebp], 0
; Line 1181
	mov	eax, DWORD PTR _ptr$[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 48					; 00000030H
	jl	SHORT $L1427
	mov	edx, DWORD PTR _ptr$[ebp]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, 57					; 00000039H
	jg	SHORT $L1427
; Line 1182
	mov	ecx, DWORD PTR _ptr$[ebp]
	movsx	edx, BYTE PTR [ecx]
	sub	edx, 48					; 00000030H
	mov	BYTE PTR _c1$[ebp], dl
; Line 1183
	jmp	SHORT $L1431
$L1427:
; Line 1184
	mov	eax, DWORD PTR _ptr$[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 65					; 00000041H
	jl	SHORT $L1429
	mov	edx, DWORD PTR _ptr$[ebp]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, 70					; 00000046H
	jg	SHORT $L1429
; Line 1185
	mov	ecx, DWORD PTR _ptr$[ebp]
	movsx	edx, BYTE PTR [ecx]
	sub	edx, 55					; 00000037H
	mov	BYTE PTR _c1$[ebp], dl
; Line 1186
	jmp	SHORT $L1431
$L1429:
; Line 1187
	mov	eax, DWORD PTR _ptr$[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 97					; 00000061H
	jl	SHORT $L1431
	mov	edx, DWORD PTR _ptr$[ebp]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, 102				; 00000066H
	jg	SHORT $L1431
; Line 1188
	mov	ecx, DWORD PTR _ptr$[ebp]
	movsx	edx, BYTE PTR [ecx]
	sub	edx, 87					; 00000057H
	mov	BYTE PTR _c1$[ebp], dl
$L1431:
; Line 1190
	movsx	eax, BYTE PTR _c1$[ebp]
	and	eax, 15					; 0000000fH
	mov	BYTE PTR _c1$[ebp], al
; Line 1191
	movsx	ecx, BYTE PTR _c1$[ebp]
	shl	ecx, 4
	mov	BYTE PTR _c1$[ebp], cl
; Line 1193
	mov	edx, DWORD PTR _ptr$[ebp]
	movsx	eax, BYTE PTR [edx+1]
	cmp	eax, 48					; 00000030H
	jl	SHORT $L1432
	mov	ecx, DWORD PTR _ptr$[ebp]
	movsx	edx, BYTE PTR [ecx+1]
	cmp	edx, 57					; 00000039H
	jg	SHORT $L1432
; Line 1194
	mov	eax, DWORD PTR _ptr$[ebp]
	movsx	ecx, BYTE PTR [eax+1]
	sub	ecx, 48					; 00000030H
	mov	BYTE PTR _c2$[ebp], cl
; Line 1195
	jmp	SHORT $L1436
$L1432:
; Line 1196
	mov	edx, DWORD PTR _ptr$[ebp]
	movsx	eax, BYTE PTR [edx+1]
	cmp	eax, 65					; 00000041H
	jl	SHORT $L1434
	mov	ecx, DWORD PTR _ptr$[ebp]
	movsx	edx, BYTE PTR [ecx+1]
	cmp	edx, 70					; 00000046H
	jg	SHORT $L1434
; Line 1197
	mov	eax, DWORD PTR _ptr$[ebp]
	movsx	ecx, BYTE PTR [eax+1]
	sub	ecx, 55					; 00000037H
	mov	BYTE PTR _c2$[ebp], cl
; Line 1198
	jmp	SHORT $L1436
$L1434:
; Line 1199
	mov	edx, DWORD PTR _ptr$[ebp]
	movsx	eax, BYTE PTR [edx+1]
	cmp	eax, 97					; 00000061H
	jl	SHORT $L1436
	mov	ecx, DWORD PTR _ptr$[ebp]
	movsx	edx, BYTE PTR [ecx+1]
	cmp	edx, 102				; 00000066H
	jg	SHORT $L1436
; Line 1200
	mov	eax, DWORD PTR _ptr$[ebp]
	movsx	ecx, BYTE PTR [eax+1]
	sub	ecx, 87					; 00000057H
	mov	BYTE PTR _c2$[ebp], cl
$L1436:
; Line 1202
	movsx	edx, BYTE PTR _c2$[ebp]
	and	edx, 15					; 0000000fH
	mov	BYTE PTR _c2$[ebp], dl
; Line 1203
	movsx	eax, BYTE PTR _c1$[ebp]
	movsx	ecx, BYTE PTR _c2$[ebp]
	or	eax, ecx
	mov	BYTE PTR _c1$[ebp], al
; Line 1205
	movsx	edx, BYTE PTR _c1$[ebp]
	and	edx, 255				; 000000ffH
	mov	BYTE PTR _t1$[ebp], dl
; Line 1207
	mov	al, BYTE PTR _t1$[ebp]
; Line 1208
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
_d$1451 = -20
?AOACharToDecimal@AOAProtected@@QAEHQAD@Z PROC NEAR	; AOAProtected::AOACharToDecimal
; Line 1215
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	mov	DWORD PTR _this$[ebp], ecx
; Line 1218
	mov	DWORD PTR _h$[ebp], 0
	jmp	SHORT $L1444
$L1445:
	mov	eax, DWORD PTR _h$[ebp]
	add	eax, 1
	mov	DWORD PTR _h$[ebp], eax
$L1444:
	mov	ecx, DWORD PTR _nom$[ebp]
	add	ecx, DWORD PTR _h$[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	SHORT $L1446
	jmp	SHORT $L1445
$L1446:
; Line 1219
	mov	eax, DWORD PTR _h$[ebp]
	sub	eax, 1
	mov	DWORD PTR _h$[ebp], eax
	mov	ecx, DWORD PTR _nom$[ebp]
	add	ecx, DWORD PTR _h$[ebp]
	movsx	edx, BYTE PTR [ecx]
	sub	edx, 48					; 00000030H
	mov	DWORD PTR _num$[ebp], edx
; Line 1223
	mov	DWORD PTR _g$[ebp], 1
	jmp	SHORT $L1448
$L1449:
	mov	eax, DWORD PTR _h$[ebp]
	sub	eax, 1
	mov	DWORD PTR _h$[ebp], eax
	mov	ecx, DWORD PTR _g$[ebp]
	add	ecx, 1
	mov	DWORD PTR _g$[ebp], ecx
$L1448:
	cmp	DWORD PTR _h$[ebp], 0
	jle	SHORT $L1450
; Line 1225
	mov	edx, DWORD PTR _nom$[ebp]
	add	edx, DWORD PTR _h$[ebp]
	movsx	eax, BYTE PTR [edx-1]
	sub	eax, 48					; 00000030H
	mov	DWORD PTR _charno$[ebp], eax
; Line 1227
	mov	ecx, DWORD PTR _g$[ebp]
	mov	DWORD PTR _d$1451[ebp], ecx
	jmp	SHORT $L1452
$L1453:
	mov	edx, DWORD PTR _d$1451[ebp]
	sub	edx, 1
	mov	DWORD PTR _d$1451[ebp], edx
$L1452:
	cmp	DWORD PTR _d$1451[ebp], 0
	jle	SHORT $L1454
; Line 1229
	mov	eax, DWORD PTR _charno$[ebp]
	imul	eax, 10					; 0000000aH
	mov	DWORD PTR _charno$[ebp], eax
; Line 1231
	jmp	SHORT $L1453
$L1454:
; Line 1233
	mov	ecx, DWORD PTR _num$[ebp]
	add	ecx, DWORD PTR _charno$[ebp]
	mov	DWORD PTR _num$[ebp], ecx
; Line 1234
	jmp	SHORT $L1449
$L1450:
; Line 1235
	mov	eax, DWORD PTR _num$[ebp]
; Line 1236
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
_j$1468 = -24
_k$1469 = -28
?AOAChartoIP@AOAProtected@@QAEXQAD0@Z PROC NEAR		; AOAProtected::AOAChartoIP
; Line 1244
	push	ebp
	mov	ebp, esp
	sub	esp, 32					; 00000020H
	mov	DWORD PTR _this$[ebp], ecx
; Line 1247
	mov	DWORD PTR _l$[ebp], 0
; Line 1248
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1465
$L1466:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L1465:
	mov	ecx, DWORD PTR _ip$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	$L1467
; Line 1250
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _j$1468[ebp], eax
	mov	DWORD PTR _k$1469[ebp], 0
	jmp	SHORT $L1470
$L1471:
	mov	ecx, DWORD PTR _j$1468[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$1468[ebp], ecx
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
	mov	eax, DWORD PTR _k$1469[ebp]
	add	eax, 1
	mov	DWORD PTR _k$1469[ebp], eax
$L1470:
	mov	ecx, DWORD PTR _ip$[ebp]
	add	ecx, DWORD PTR _j$1468[ebp]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, 46					; 0000002eH
	je	SHORT $L1472
	mov	eax, DWORD PTR _ip$[ebp]
	add	eax, DWORD PTR _j$1468[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L1472
; Line 1252
	mov	edx, DWORD PTR _ip$[ebp]
	add	edx, DWORD PTR _j$1468[ebp]
	mov	eax, DWORD PTR _k$1469[ebp]
	mov	cl, BYTE PTR [edx]
	mov	BYTE PTR _temp$[ebp+eax], cl
; Line 1253
	jmp	SHORT $L1471
$L1472:
; Line 1254
	mov	edx, DWORD PTR _k$1469[ebp]
	mov	BYTE PTR _temp$[ebp+edx], 0
; Line 1255
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
; Line 1256
	jmp	$L1466
$L1467:
; Line 1257
	mov	eax, DWORD PTR _ipchar$[ebp]
	add	eax, DWORD PTR _l$[ebp]
	mov	BYTE PTR [eax], 0
; Line 1258
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
; Line 1266
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 1269
	mov	al, BYTE PTR _ch$[ebp]
	mov	BYTE PTR _c$[ebp], al
; Line 1271
	mov	ecx, DWORD PTR _c$[ebp]
	and	ecx, 255				; 000000ffH
	cmp	ecx, 97					; 00000061H
	jl	SHORT $L1480
	mov	edx, DWORD PTR _c$[ebp]
	and	edx, 255				; 000000ffH
	cmp	edx, 122				; 0000007aH
	jle	SHORT $L1479
$L1480:
	mov	eax, DWORD PTR _c$[ebp]
	and	eax, 255				; 000000ffH
	cmp	eax, 65					; 00000041H
	jl	SHORT $L1481
	mov	ecx, DWORD PTR _c$[ebp]
	and	ecx, 255				; 000000ffH
	cmp	ecx, 90					; 0000005aH
	jle	SHORT $L1479
$L1481:
	mov	edx, DWORD PTR _c$[ebp]
	and	edx, 255				; 000000ffH
	cmp	edx, 48					; 00000030H
	jl	SHORT $L1482
	mov	eax, DWORD PTR _c$[ebp]
	and	eax, 255				; 000000ffH
	cmp	eax, 57					; 00000039H
	jle	SHORT $L1479
$L1482:
	mov	ecx, DWORD PTR _c$[ebp]
	and	ecx, 255				; 000000ffH
	cmp	ecx, 46					; 0000002eH
	je	SHORT $L1479
	mov	edx, DWORD PTR _c$[ebp]
	and	edx, 255				; 000000ffH
	cmp	edx, 45					; 0000002dH
	jne	SHORT $L1478
$L1479:
; Line 1272
	xor	eax, eax
	jmp	SHORT $L1483
$L1478:
; Line 1273
	or	eax, -1
$L1483:
; Line 1274
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
; Line 1279
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 1281
	mov	DWORD PTR _len$[ebp], 0
$L1490:
; Line 1282
	mov	eax, DWORD PTR _str$[ebp]
	add	eax, DWORD PTR _len$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L1491
; Line 1284
	mov	edx, DWORD PTR _len$[ebp]
	add	edx, 1
	mov	DWORD PTR _len$[ebp], edx
; Line 1285
	jmp	SHORT $L1490
$L1491:
; Line 1286
	mov	eax, DWORD PTR _len$[ebp]
; Line 1287
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
; Line 1292
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 1294
	mov	DWORD PTR _len$[ebp], 0
$L1498:
; Line 1295
	mov	eax, DWORD PTR _str$[ebp]
	add	eax, DWORD PTR _len$[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 13					; 0000000dH
	je	SHORT $L1499
	mov	edx, DWORD PTR _str$[ebp]
	add	edx, DWORD PTR _len$[ebp]
	movsx	eax, BYTE PTR [edx+1]
	cmp	eax, 10					; 0000000aH
	je	SHORT $L1499
; Line 1298
	mov	ecx, DWORD PTR _len$[ebp]
	add	ecx, 1
	mov	DWORD PTR _len$[ebp], ecx
; Line 1299
	jmp	SHORT $L1498
$L1499:
; Line 1300
	mov	eax, DWORD PTR _len$[ebp]
; Line 1301
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
; Line 1309
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 1311
	mov	DWORD PTR _len$[ebp], 0
$L1506:
; Line 1314
	mov	eax, DWORD PTR _str$[ebp]
	add	eax, DWORD PTR _len$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L1507
	mov	edx, DWORD PTR _str$[ebp]
	add	edx, DWORD PTR _len$[ebp]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, 10					; 0000000aH
	je	SHORT $L1507
	mov	ecx, DWORD PTR _str$[ebp]
	add	ecx, DWORD PTR _len$[ebp]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, 13					; 0000000dH
	je	SHORT $L1507
; Line 1316
	mov	eax, DWORD PTR _len$[ebp]
	add	eax, 1
	mov	DWORD PTR _len$[ebp], eax
; Line 1317
	jmp	SHORT $L1506
$L1507:
; Line 1318
	mov	eax, DWORD PTR _len$[ebp]
; Line 1319
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
; Line 1326
	push	ebp
	mov	ebp, esp
	sub	esp, 276				; 00000114H
	mov	DWORD PTR _this$[ebp], ecx
; Line 1327
	mov	eax, DWORD PTR _str$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAStrLen@AOAProtected@@QAEHPAD@Z	; AOAProtected::AOAStrLen
	mov	DWORD PTR _len$[ebp], eax
; Line 1329
	mov	ecx, DWORD PTR _len$[ebp]
	mov	DWORD PTR _h$[ebp], ecx
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1516
$L1517:
	mov	edx, DWORD PTR _h$[ebp]
	sub	edx, 1
	mov	DWORD PTR _h$[ebp], edx
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L1516:
	cmp	DWORD PTR _h$[ebp], 0
	jle	SHORT $L1518
; Line 1331
	mov	ecx, DWORD PTR _str$[ebp]
	add	ecx, DWORD PTR _h$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	mov	al, BYTE PTR [ecx-1]
	mov	BYTE PTR _str1$[ebp+edx], al
; Line 1332
	jmp	SHORT $L1517
$L1518:
; Line 1333
	mov	ecx, DWORD PTR _i$[ebp]
	mov	BYTE PTR _str1$[ebp+ecx], 0
; Line 1334
	mov	DWORD PTR _k$[ebp], 0
$L1521:
; Line 1335
	mov	edx, DWORD PTR _k$[ebp]
	movsx	eax, BYTE PTR _str1$[ebp+edx]
	test	eax, eax
	je	SHORT $L1522
; Line 1337
	mov	ecx, DWORD PTR _str$[ebp]
	add	ecx, DWORD PTR _k$[ebp]
	mov	edx, DWORD PTR _k$[ebp]
	mov	al, BYTE PTR _str1$[ebp+edx]
	mov	BYTE PTR [ecx], al
; Line 1338
	mov	ecx, DWORD PTR _k$[ebp]
	add	ecx, 1
	mov	DWORD PTR _k$[ebp], ecx
; Line 1339
	jmp	SHORT $L1521
$L1522:
; Line 1340
	mov	edx, DWORD PTR _str$[ebp]
	add	edx, DWORD PTR _k$[ebp]
	mov	BYTE PTR [edx], 0
; Line 1341
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
; Line 1347
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 1348
	mov	DWORD PTR _i$[ebp], 0
$L1530:
; Line 1350
	cmp	DWORD PTR _num$[ebp], 0
	jle	SHORT $L1531
; Line 1352
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
; Line 1353
	mov	eax, DWORD PTR _num$[ebp]
	cdq
	mov	ecx, 10					; 0000000aH
	idiv	ecx
	mov	DWORD PTR _num$[ebp], eax
; Line 1354
	jmp	SHORT $L1530
$L1531:
; Line 1356
	mov	edx, DWORD PTR _nom$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	mov	BYTE PTR [edx], 0
; Line 1357
	mov	eax, DWORD PTR _nom$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAStrRev@AOAProtected@@QAEXPAD@Z	; AOAProtected::AOAStrRev
; Line 1359
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
; Line 1365
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 1368
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1539
$L1540:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L1539:
	mov	ecx, DWORD PTR _str1$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	SHORT $L1541
; Line 1370
	mov	eax, DWORD PTR _str$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _str1$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	dl, BYTE PTR [ecx]
	mov	BYTE PTR [eax], dl
; Line 1371
	jmp	SHORT $L1540
$L1541:
; Line 1374
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L1543
$L1544:
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	DWORD PTR _j$[ebp], eax
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L1543:
	mov	edx, DWORD PTR _str2$[ebp]
	add	edx, DWORD PTR _j$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L1545
; Line 1376
	mov	ecx, DWORD PTR _str$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _str2$[ebp]
	add	edx, DWORD PTR _j$[ebp]
	mov	al, BYTE PTR [edx]
	mov	BYTE PTR [ecx], al
; Line 1377
	jmp	SHORT $L1544
$L1545:
; Line 1378
	mov	ecx, DWORD PTR _str$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	BYTE PTR [ecx], 0
; Line 1379
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
; Line 1385
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 1386
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1553
$L1554:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L1553:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _l2$[ebp]
	jge	SHORT $L1555
; Line 1387
	mov	edx, DWORD PTR _str1$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _str2$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	mov	cl, BYTE PTR [eax]
	mov	BYTE PTR [edx], cl
	jmp	SHORT $L1554
$L1555:
; Line 1388
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
; Line 1394
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 1397
	movsx	eax, BYTE PTR _c$[ebp]
	and	eax, 255				; 000000ffH
	mov	WORD PTR _u$[ebp], ax
; Line 1398
	mov	ecx, DWORD PTR _u$[ebp]
	and	ecx, 65535				; 0000ffffH
	cmp	ecx, 65					; 00000041H
	jl	SHORT $L1561
	mov	edx, DWORD PTR _u$[ebp]
	and	edx, 65535				; 0000ffffH
	cmp	edx, 90					; 0000005aH
	jg	SHORT $L1561
; Line 1399
	mov	eax, 1
	jmp	SHORT $L1562
$L1561:
; Line 1400
	xor	eax, eax
$L1562:
; Line 1401
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
; Line 1407
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 1410
	movsx	eax, BYTE PTR _c$[ebp]
	and	eax, 255				; 000000ffH
	mov	WORD PTR _u$[ebp], ax
; Line 1411
	mov	ecx, DWORD PTR _u$[ebp]
	and	ecx, 65535				; 0000ffffH
	cmp	ecx, 97					; 00000061H
	jl	SHORT $L1568
	mov	edx, DWORD PTR _u$[ebp]
	and	edx, 65535				; 0000ffffH
	cmp	edx, 122				; 0000007aH
	jg	SHORT $L1568
; Line 1412
	mov	eax, 1
	jmp	SHORT $L1569
$L1568:
; Line 1413
	xor	eax, eax
$L1569:
; Line 1414
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
; Line 1420
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 1421
	mov	DWORD PTR _i$[ebp], 0
; Line 1422
	mov	DWORD PTR _p$[ebp], 0
; Line 1424
	mov	DWORD PTR _p$[ebp], 1
; Line 1425
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1577
$L1578:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L1577:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _power$[ebp]
	jge	SHORT $L1579
; Line 1427
	mov	edx, DWORD PTR _p$[ebp]
	imul	edx, DWORD PTR _base$[ebp]
	mov	DWORD PTR _p$[ebp], edx
; Line 1428
	jmp	SHORT $L1578
$L1579:
; Line 1429
	mov	eax, DWORD PTR _p$[ebp]
; Line 1430
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
; Line 1435
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	esi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1436
	mov	DWORD PTR _j$[ebp], 0
$L1590:
; Line 1443
	mov	eax, DWORD PTR _start$[ebp]
	add	eax, DWORD PTR _j$[ebp]
	cmp	eax, DWORD PTR _end$[ebp]
	jg	SHORT $L1591
; Line 1445
	mov	ecx, DWORD PTR _start$[ebp]
	add	ecx, DWORD PTR _j$[ebp]
	mov	edx, DWORD PTR _outstart$[ebp]
	add	edx, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR _field$[ebp]
	mov	esi, DWORD PTR _arg1$[ebp]
	mov	cl, BYTE PTR [esi+ecx]
	mov	BYTE PTR [eax+edx], cl
; Line 1446
	mov	edx, DWORD PTR _j$[ebp]
	add	edx, 1
	mov	DWORD PTR _j$[ebp], edx
; Line 1447
	jmp	SHORT $L1590
$L1591:
; Line 1448
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
; Line 1453
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 1454
	mov	DWORD PTR _i$[ebp], 0
$L1600:
; Line 1455
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _len$[ebp]
	jge	SHORT $L1601
; Line 1457
	mov	ecx, DWORD PTR _s1$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _s2$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	mov	al, BYTE PTR [edx]
	mov	BYTE PTR [ecx], al
; Line 1458
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
; Line 1459
	jmp	SHORT $L1600
$L1601:
; Line 1460
	mov	edx, DWORD PTR _s1$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	mov	BYTE PTR [edx], 0
; Line 1461
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
; Line 1466
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 1467
	mov	DWORD PTR _i$[ebp], 0
$L1610:
; Line 1469
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _len$[ebp]
	jge	SHORT $L1611
; Line 1472
	mov	ecx, DWORD PTR _s2$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, 32					; 00000020H
	jle	SHORT $L1612
	mov	eax, DWORD PTR _s2$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 126				; 0000007eH
	jg	SHORT $L1612
; Line 1475
	mov	edx, DWORD PTR _s1$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _s2$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	mov	cl, BYTE PTR [eax]
	mov	BYTE PTR [edx], cl
$L1612:
; Line 1479
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
; Line 1480
	jmp	SHORT $L1610
$L1611:
; Line 1481
	mov	eax, DWORD PTR _s1$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	mov	BYTE PTR [eax], 0
; Line 1482
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
; Line 1494
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	mov	DWORD PTR _this$[ebp], ecx
; Line 1495
	mov	DWORD PTR _retcode$[ebp], 0
	mov	DWORD PTR _j$[ebp], 0
; Line 1496
	mov	BYTE PTR _ch$[ebp], 32			; 00000020H
; Line 1497
	mov	WORD PTR _u1$[ebp], 0
	mov	WORD PTR _u2$[ebp], 0
; Line 1499
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1500
	cmp	DWORD PTR _mixedcase$[ebp], 0
	jne	SHORT $L1625
; Line 1502
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L1626
$L1627:
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	DWORD PTR _j$[ebp], eax
$L1626:
	mov	ecx, DWORD PTR _j$[ebp]
	cmp	ecx, DWORD PTR _length$[ebp]
	jge	SHORT $L1628
; Line 1504
	mov	edx, DWORD PTR _str1$[ebp]
	add	edx, DWORD PTR _j$[ebp]
	movsx	eax, BYTE PTR [edx]
	mov	ecx, DWORD PTR _str2$[ebp]
	add	ecx, DWORD PTR _j$[ebp]
	movsx	edx, BYTE PTR [ecx]
	cmp	eax, edx
	jne	SHORT $L1629
; Line 1505
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1506
	jmp	SHORT $L1630
$L1629:
	mov	DWORD PTR _retcode$[ebp], -1
$L1630:
; Line 1507
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L1631
; Line 1508
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L1619
$L1631:
; Line 1509
	jmp	SHORT $L1627
$L1628:
; Line 1512
	jmp	$L1636
$L1625:
	cmp	DWORD PTR _mixedcase$[ebp], 1
	jne	$L1636
; Line 1514
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L1634
$L1635:
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	DWORD PTR _j$[ebp], eax
$L1634:
	mov	ecx, DWORD PTR _j$[ebp]
	cmp	ecx, DWORD PTR _length$[ebp]
	jge	$L1636
; Line 1516
	mov	edx, DWORD PTR _str1$[ebp]
	add	edx, DWORD PTR _j$[ebp]
	movsx	eax, BYTE PTR [edx]
	and	eax, 255				; 000000ffH
	mov	WORD PTR _u1$[ebp], ax
; Line 1517
	mov	ecx, DWORD PTR _str2$[ebp]
	add	ecx, DWORD PTR _j$[ebp]
	movsx	edx, BYTE PTR [ecx]
	and	edx, 255				; 000000ffH
	mov	WORD PTR _u2$[ebp], dx
; Line 1519
	mov	eax, DWORD PTR _str1$[ebp]
	add	eax, DWORD PTR _j$[ebp]
	mov	cl, BYTE PTR [eax]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAUpper@AOAProtected@@QAEHD@Z		; AOAProtected::AOAUpper
	cmp	eax, 1
	jne	SHORT $L1637
	mov	edx, DWORD PTR _str2$[ebp]
	add	edx, DWORD PTR _j$[ebp]
	mov	al, BYTE PTR [edx]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOALower@AOAProtected@@QAEHD@Z		; AOAProtected::AOALower
	cmp	eax, 1
	jne	SHORT $L1637
; Line 1522
	mov	ecx, DWORD PTR _u2$[ebp]
	and	ecx, 65535				; 0000ffffH
	sub	ecx, 32					; 00000020H
	mov	edx, DWORD PTR _u1$[ebp]
	and	edx, 65535				; 0000ffffH
	cmp	ecx, edx
	jne	SHORT $L1638
; Line 1523
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1524
	jmp	SHORT $L1639
$L1638:
	mov	DWORD PTR _retcode$[ebp], -1
$L1639:
; Line 1526
	jmp	SHORT $L1646
$L1637:
	mov	eax, DWORD PTR _str1$[ebp]
	add	eax, DWORD PTR _j$[ebp]
	mov	cl, BYTE PTR [eax]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOALower@AOAProtected@@QAEHD@Z		; AOAProtected::AOALower
	cmp	eax, 1
	jne	SHORT $L1641
	mov	edx, DWORD PTR _str2$[ebp]
	add	edx, DWORD PTR _j$[ebp]
	mov	al, BYTE PTR [edx]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAUpper@AOAProtected@@QAEHD@Z		; AOAProtected::AOAUpper
	cmp	eax, 1
	jne	SHORT $L1641
; Line 1529
	mov	ecx, DWORD PTR _u1$[ebp]
	and	ecx, 65535				; 0000ffffH
	sub	ecx, 32					; 00000020H
	mov	edx, DWORD PTR _u2$[ebp]
	and	edx, 65535				; 0000ffffH
	cmp	ecx, edx
	jne	SHORT $L1642
; Line 1530
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1531
	jmp	SHORT $L1643
$L1642:
	mov	DWORD PTR _retcode$[ebp], -1
$L1643:
; Line 1533
	jmp	SHORT $L1646
$L1641:
; Line 1536
	mov	eax, DWORD PTR _u1$[ebp]
	and	eax, 65535				; 0000ffffH
	mov	ecx, DWORD PTR _u2$[ebp]
	and	ecx, 65535				; 0000ffffH
	cmp	eax, ecx
	jne	SHORT $L1645
; Line 1537
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1538
	jmp	SHORT $L1646
$L1645:
	mov	DWORD PTR _retcode$[ebp], -1
$L1646:
; Line 1540
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L1647
; Line 1541
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	SHORT $L1619
$L1647:
; Line 1543
	jmp	$L1635
$L1636:
; Line 1545
	mov	eax, DWORD PTR _retcode$[ebp]
$L1619:
; Line 1546
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
; Line 1561
	push	ebp
	mov	ebp, esp
	sub	esp, 36					; 00000024H
	mov	DWORD PTR _this$[ebp], ecx
; Line 1562
	mov	DWORD PTR _retcode$[ebp], 0
	mov	DWORD PTR _j$[ebp], 0
; Line 1563
	mov	BYTE PTR _ch$[ebp], 32			; 00000020H
; Line 1564
	mov	WORD PTR _u1$[ebp], 0
	mov	WORD PTR _u2$[ebp], 0
; Line 1565
	mov	eax, DWORD PTR _idxstop1$[ebp]
	sub	eax, DWORD PTR _idxstart1$[ebp]
	mov	DWORD PTR _length1$[ebp], eax
; Line 1566
	mov	ecx, DWORD PTR _idxstop2$[ebp]
	sub	ecx, DWORD PTR _idxstart2$[ebp]
	mov	DWORD PTR _length2$[ebp], ecx
; Line 1567
	mov	DWORD PTR _length$[ebp], 0
; Line 1570
	mov	edx, DWORD PTR _length1$[ebp]
	cmp	edx, DWORD PTR _length2$[ebp]
	je	SHORT $L1666
	mov	DWORD PTR _retcode$[ebp], -1
; Line 1571
	jmp	SHORT $L1667
$L1666:
	mov	eax, DWORD PTR _length1$[ebp]
	mov	DWORD PTR _length$[ebp], eax
$L1667:
; Line 1573
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1574
	cmp	DWORD PTR _mixedcase$[ebp], 0
	jne	SHORT $L1668
; Line 1576
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L1669
$L1670:
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
$L1669:
	mov	edx, DWORD PTR _j$[ebp]
	cmp	edx, DWORD PTR _length$[ebp]
	jge	SHORT $L1671
; Line 1578
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, DWORD PTR _idxstart1$[ebp]
	mov	ecx, DWORD PTR _str1$[ebp]
	movsx	edx, BYTE PTR [ecx+eax]
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, DWORD PTR _idxstart2$[ebp]
	mov	ecx, DWORD PTR _str2$[ebp]
	movsx	eax, BYTE PTR [ecx+eax]
	cmp	edx, eax
	jne	SHORT $L1672
; Line 1579
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1580
	jmp	SHORT $L1673
$L1672:
	mov	DWORD PTR _retcode$[ebp], -1
$L1673:
; Line 1581
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L1674
; Line 1582
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L1657
$L1674:
; Line 1583
	jmp	SHORT $L1670
$L1671:
; Line 1586
	jmp	$L1679
$L1668:
	cmp	DWORD PTR _mixedcase$[ebp], 1
	jne	$L1679
; Line 1588
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L1677
$L1678:
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
$L1677:
	mov	edx, DWORD PTR _j$[ebp]
	cmp	edx, DWORD PTR _length$[ebp]
	jge	$L1679
; Line 1590
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, DWORD PTR _idxstart1$[ebp]
	mov	ecx, DWORD PTR _str1$[ebp]
	movsx	edx, BYTE PTR [ecx+eax]
	and	edx, 255				; 000000ffH
	mov	WORD PTR _u1$[ebp], dx
; Line 1591
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, DWORD PTR _idxstart2$[ebp]
	mov	ecx, DWORD PTR _str2$[ebp]
	movsx	edx, BYTE PTR [ecx+eax]
	and	edx, 255				; 000000ffH
	mov	WORD PTR _u2$[ebp], dx
; Line 1593
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, DWORD PTR _idxstart1$[ebp]
	mov	ecx, DWORD PTR _str1$[ebp]
	mov	dl, BYTE PTR [ecx+eax]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAUpper@AOAProtected@@QAEHD@Z		; AOAProtected::AOAUpper
	cmp	eax, 1
	jne	SHORT $L1680
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, DWORD PTR _idxstart2$[ebp]
	mov	ecx, DWORD PTR _str2$[ebp]
	mov	dl, BYTE PTR [ecx+eax]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOALower@AOAProtected@@QAEHD@Z		; AOAProtected::AOALower
	cmp	eax, 1
	jne	SHORT $L1680
; Line 1596
	mov	eax, DWORD PTR _u2$[ebp]
	and	eax, 65535				; 0000ffffH
	sub	eax, 32					; 00000020H
	mov	ecx, DWORD PTR _u1$[ebp]
	and	ecx, 65535				; 0000ffffH
	cmp	eax, ecx
	jne	SHORT $L1681
; Line 1597
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1598
	jmp	SHORT $L1682
$L1681:
	mov	DWORD PTR _retcode$[ebp], -1
$L1682:
; Line 1600
	jmp	$L1689
$L1680:
	mov	edx, DWORD PTR _j$[ebp]
	add	edx, DWORD PTR _idxstart1$[ebp]
	mov	eax, DWORD PTR _str1$[ebp]
	mov	cl, BYTE PTR [eax+edx]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOALower@AOAProtected@@QAEHD@Z		; AOAProtected::AOALower
	cmp	eax, 1
	jne	SHORT $L1684
	mov	edx, DWORD PTR _j$[ebp]
	add	edx, DWORD PTR _idxstart2$[ebp]
	mov	eax, DWORD PTR _str2$[ebp]
	mov	cl, BYTE PTR [eax+edx]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAUpper@AOAProtected@@QAEHD@Z		; AOAProtected::AOAUpper
	cmp	eax, 1
	jne	SHORT $L1684
; Line 1603
	mov	edx, DWORD PTR _u1$[ebp]
	and	edx, 65535				; 0000ffffH
	sub	edx, 32					; 00000020H
	mov	eax, DWORD PTR _u2$[ebp]
	and	eax, 65535				; 0000ffffH
	cmp	edx, eax
	jne	SHORT $L1685
; Line 1604
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1605
	jmp	SHORT $L1686
$L1685:
	mov	DWORD PTR _retcode$[ebp], -1
$L1686:
; Line 1607
	jmp	SHORT $L1689
$L1684:
; Line 1610
	mov	ecx, DWORD PTR _u1$[ebp]
	and	ecx, 65535				; 0000ffffH
	mov	edx, DWORD PTR _u2$[ebp]
	and	edx, 65535				; 0000ffffH
	cmp	ecx, edx
	jne	SHORT $L1688
; Line 1611
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1612
	jmp	SHORT $L1689
$L1688:
	mov	DWORD PTR _retcode$[ebp], -1
$L1689:
; Line 1614
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L1690
; Line 1615
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	SHORT $L1657
$L1690:
; Line 1617
	jmp	$L1678
$L1679:
; Line 1619
	mov	eax, DWORD PTR _retcode$[ebp]
$L1657:
; Line 1620
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
; Line 1627
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	mov	DWORD PTR _this$[ebp], ecx
; Line 1628
	mov	DWORD PTR _retVal$[ebp], -1
; Line 1629
	mov	DWORD PTR _found$[ebp], 0
; Line 1630
	mov	eax, DWORD PTR _str$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAStrLen@AOAProtected@@QAEHPAD@Z	; AOAProtected::AOAStrLen
	mov	DWORD PTR _len$[ebp], eax
; Line 1632
	mov	DWORD PTR _ii$[ebp], 0
	jmp	SHORT $L1700
$L1701:
	mov	ecx, DWORD PTR _ii$[ebp]
	add	ecx, 1
	mov	DWORD PTR _ii$[ebp], ecx
$L1700:
	mov	edx, DWORD PTR _ii$[ebp]
	cmp	edx, DWORD PTR _len$[ebp]
	jge	SHORT $L1702
; Line 1633
	mov	eax, DWORD PTR _str$[ebp]
	add	eax, DWORD PTR _ii$[ebp]
	movsx	ecx, BYTE PTR [eax]
	movsx	edx, BYTE PTR _c$[ebp]
	cmp	ecx, edx
	jne	SHORT $L1703
	cmp	DWORD PTR _found$[ebp], 1
	je	SHORT $L1703
; Line 1634
	mov	eax, DWORD PTR _ii$[ebp]
	mov	DWORD PTR _retVal$[ebp], eax
	mov	DWORD PTR _found$[ebp], 1
$L1703:
; Line 1635
	cmp	DWORD PTR _found$[ebp], 1
	jne	SHORT $L1704
	jmp	SHORT $L1702
$L1704:
; Line 1636
	jmp	SHORT $L1701
$L1702:
; Line 1638
	mov	eax, DWORD PTR _retVal$[ebp]
; Line 1639
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
_ii$1714 = -12
?AOAsubstring@AOAProtected@@QAEPADPAD0H@Z PROC NEAR	; AOAProtected::AOAsubstring
; Line 1644
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	mov	DWORD PTR _this$[ebp], ecx
; Line 1645
	mov	eax, DWORD PTR _str$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAStrLen@AOAProtected@@QAEHPAD@Z	; AOAProtected::AOAStrLen
	mov	DWORD PTR _len$[ebp], eax
; Line 1646
	mov	DWORD PTR _cntr$[ebp], 0
; Line 1648
	mov	ecx, DWORD PTR _len$[ebp]
	cmp	ecx, DWORD PTR _index$[ebp]
	jle	SHORT $L1717
; Line 1649
	mov	edx, DWORD PTR _index$[ebp]
	mov	DWORD PTR _ii$1714[ebp], edx
	jmp	SHORT $L1715
$L1716:
	mov	eax, DWORD PTR _ii$1714[ebp]
	add	eax, 1
	mov	DWORD PTR _ii$1714[ebp], eax
$L1715:
	mov	ecx, DWORD PTR _ii$1714[ebp]
	cmp	ecx, DWORD PTR _len$[ebp]
	jge	SHORT $L1717
; Line 1651
	mov	edx, DWORD PTR _substr$[ebp]
	add	edx, DWORD PTR _cntr$[ebp]
	mov	eax, DWORD PTR _str$[ebp]
	add	eax, DWORD PTR _ii$1714[ebp]
	mov	cl, BYTE PTR [eax]
	mov	BYTE PTR [edx], cl
	mov	edx, DWORD PTR _cntr$[ebp]
	add	edx, 1
	mov	DWORD PTR _cntr$[ebp], edx
; Line 1652
	jmp	SHORT $L1716
$L1717:
; Line 1653
	mov	eax, DWORD PTR _substr$[ebp]
	add	eax, DWORD PTR _cntr$[ebp]
	mov	BYTE PTR [eax], 0
; Line 1655
	mov	eax, DWORD PTR _substr$[ebp]
; Line 1656
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
; Line 1663
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	mov	DWORD PTR _this$[ebp], ecx
; Line 1664
	mov	DWORD PTR _i$[ebp], 0
; Line 1665
	mov	BYTE PTR _a$[ebp], 0
$L1728:
; Line 1667
	movsx	eax, BYTE PTR _a$[ebp]
	cmp	eax, 27					; 0000001bH
	je	$L1729
; Line 1669
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	BYTE PTR _a$[ebp], al
; Line 1670
	movsx	ecx, BYTE PTR _a$[ebp]
	cmp	ecx, 8
	jne	SHORT $L1730
; Line 1672
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCursor@AOAProtected@@QAEHXZ	; AOAProtected::AOAgetCursor
	mov	DWORD PTR _charpos$[ebp], eax
; Line 1673
	mov	edx, DWORD PTR _charpos$[ebp]
	sub	edx, 1
	mov	DWORD PTR _charpos$[ebp], edx
; Line 1674
	mov	eax, DWORD PTR _charpos$[ebp]
	shl	eax, 1
	push	eax
	push	32					; 00000020H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintCharacter@AOAProtected@@QAEHDH@Z ; AOAProtected::AOAprintCharacter
; Line 1675
	mov	ecx, DWORD PTR _charpos$[ebp]
	sub	ecx, 1
	mov	DWORD PTR _charpos$[ebp], ecx
; Line 1676
	mov	edx, DWORD PTR _charpos$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetCursor@AOAProtected@@QAEHH@Z	; AOAProtected::AOAsetCursor
; Line 1677
	mov	eax, DWORD PTR _charpos$[ebp]
	shl	eax, 1
	push	eax
	push	32					; 00000020H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintCharacter@AOAProtected@@QAEHDH@Z ; AOAProtected::AOAprintCharacter
; Line 1678
	mov	ecx, DWORD PTR _charpos$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetCursor@AOAProtected@@QAEHH@Z	; AOAProtected::AOAsetCursor
; Line 1679
	mov	edx, DWORD PTR _i$[ebp]
	sub	edx, 1
	mov	DWORD PTR _i$[ebp], edx
; Line 1681
	jmp	SHORT $L1733
$L1730:
	movsx	eax, BYTE PTR _a$[ebp]
	cmp	eax, 13					; 0000000dH
	jne	SHORT $L1732
; Line 1683
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCursor@AOAProtected@@QAEHXZ	; AOAProtected::AOAgetCursor
	mov	DWORD PTR _charpos$[ebp], eax
; Line 1684
	mov	eax, DWORD PTR _charpos$[ebp]
	cdq
	mov	ecx, 80					; 00000050H
	idiv	ecx
	mov	DWORD PTR _temp1$[ebp], edx
; Line 1685
	mov	edx, 80					; 00000050H
	sub	edx, DWORD PTR _temp1$[ebp]
	mov	eax, DWORD PTR _charpos$[ebp]
	add	eax, edx
	mov	DWORD PTR _charpos$[ebp], eax
; Line 1686
	mov	ecx, DWORD PTR _charpos$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetCursor@AOAProtected@@QAEHH@Z	; AOAProtected::AOAsetCursor
; Line 1687
	mov	edx, DWORD PTR _str$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	mov	BYTE PTR [edx], 10			; 0000000aH
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
; Line 1689
	jmp	SHORT $L1733
$L1732:
; Line 1692
	mov	ecx, DWORD PTR _str$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	dl, BYTE PTR _a$[ebp]
	mov	BYTE PTR [ecx], dl
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L1733:
; Line 1694
	jmp	$L1728
$L1729:
; Line 1695
	mov	ecx, DWORD PTR _str$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	BYTE PTR [ecx-1], 0
; Line 1696
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
; Line 1701
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 1704
	mov	eax, DWORD PTR _str1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAStrLen@AOAProtected@@QAEHPAD@Z	; AOAProtected::AOAStrLen
	mov	DWORD PTR _len$[ebp], eax
; Line 1707
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L1741
$L1742:
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
$L1741:
	mov	edx, DWORD PTR _str2$[ebp]
	add	edx, DWORD PTR _j$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L1743
; Line 1709
	mov	ecx, DWORD PTR _len$[ebp]
	add	ecx, DWORD PTR _j$[ebp]
	mov	edx, DWORD PTR _str2$[ebp]
	add	edx, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR _str1$[ebp]
	mov	dl, BYTE PTR [edx]
	mov	BYTE PTR [eax+ecx], dl
; Line 1710
	jmp	SHORT $L1742
$L1743:
; Line 1711
	mov	eax, DWORD PTR _len$[ebp]
	add	eax, DWORD PTR _j$[ebp]
	mov	ecx, DWORD PTR _str1$[ebp]
	mov	BYTE PTR [ecx+eax], 0
; Line 1712
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
; Line 1717
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 1718
	mov	eax, DWORD PTR _sp$[ebp]
	mov	DWORD PTR _i$[ebp], eax
	jmp	SHORT $L1750
$L1751:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 2
	mov	DWORD PTR _i$[ebp], ecx
$L1750:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _ep$[ebp]
	jge	SHORT $L1752
; Line 1720
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	push	32					; 00000020H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintCharacter@AOAProtected@@QAEHDH@Z ; AOAProtected::AOAprintCharacter
; Line 1721
	jmp	SHORT $L1751
$L1752:
; Line 1722
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
; Line 1727
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 1728
	mov	DWORD PTR _i$[ebp], 0
; Line 1729
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1760
$L1761:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L1760:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _length$[ebp]
	jge	SHORT $L1762
; Line 1731
	mov	edx, DWORD PTR _dest$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _src$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	mov	cl, BYTE PTR [eax]
	mov	BYTE PTR [edx], cl
; Line 1732
	jmp	SHORT $L1761
$L1762:
; Line 1733
	xor	eax, eax
; Line 1734
	mov	esp, ebp
	pop	ebp
	ret	12					; 0000000cH
?AOAMemCopy@AOAProtected@@QAEHPAD0H@Z ENDP		; AOAProtected::AOAMemCopy
_TEXT	ENDS
PUBLIC	?AOAMsPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAMsPrintText
_DATA	SEGMENT
$SG1775	DB	'press space to next page', 00H
	ORG $+3
$SG1784	DB	'press space to next page', 00H
_DATA	ENDS
_TEXT	SEGMENT
_str$ = 8
_base$ = 12
_this$ = -12
_temp1$ = -4
_i$ = -8
?AOAMsPrintText@AOAProtected@@QAEXPADH@Z PROC NEAR	; AOAProtected::AOAMsPrintText
; Line 1740
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 1742
	push	3360					; 00000d20H
	push	320					; 00000140H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAclearScreen@AOAProtected@@QAEXHH@Z	; AOAProtected::AOAclearScreen
; Line 1743
	mov	eax, DWORD PTR _base$[ebp]
	cdq
	sub	eax, edx
	sar	eax, 1
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetCursor@AOAProtected@@QAEHH@Z	; AOAProtected::AOAsetCursor
; Line 1744
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1770
$L1771:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L1770:
	mov	ecx, DWORD PTR _str$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	$L1772
; Line 1746
	mov	eax, DWORD PTR _str$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 10					; 0000000aH
	jne	SHORT $L1773
; Line 1748
	mov	eax, DWORD PTR _base$[ebp]
	cdq
	mov	ecx, 160				; 000000a0H
	idiv	ecx
	mov	DWORD PTR _temp1$[ebp], edx
; Line 1749
	mov	edx, 160				; 000000a0H
	sub	edx, DWORD PTR _temp1$[ebp]
	mov	eax, DWORD PTR _base$[ebp]
	add	eax, edx
	mov	DWORD PTR _base$[ebp], eax
; Line 1750
	cmp	DWORD PTR _base$[ebp], 3200		; 00000c80H
	jl	SHORT $L1774
; Line 1752
	mov	DWORD PTR _base$[ebp], 320		; 00000140H
; Line 1753
	push	3240					; 00000ca8H
	push	24					; 00000018H
	push	OFFSET FLAT:$SG1775
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintString@AOAProtected@@QAEHPADHH@Z ; AOAProtected::AOAprintString
; Line 1754
	push	1644					; 0000066cH
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetCursor@AOAProtected@@QAEHH@Z	; AOAProtected::AOAsetCursor
$L1777:
; Line 1755
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	movsx	ecx, al
	cmp	ecx, 32					; 00000020H
	je	SHORT $L1778
	jmp	SHORT $L1777
$L1778:
; Line 1756
	push	3360					; 00000d20H
	push	320					; 00000140H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAclearScreen@AOAProtected@@QAEXHH@Z	; AOAProtected::AOAclearScreen
$L1774:
; Line 1759
	jmp	$L1783
$L1773:
	mov	edx, DWORD PTR _str$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, 9
	je	SHORT $L1781
	mov	ecx, DWORD PTR _str$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, 13					; 0000000dH
	jne	SHORT $L1780
$L1781:
; Line 1762
	jmp	SHORT $L1783
$L1780:
; Line 1764
	mov	eax, DWORD PTR _base$[ebp]
	push	eax
	mov	ecx, DWORD PTR _str$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	dl, BYTE PTR [ecx]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintCharacter@AOAProtected@@QAEHDH@Z ; AOAProtected::AOAprintCharacter
; Line 1765
	mov	eax, DWORD PTR _base$[ebp]
	add	eax, 2
	mov	DWORD PTR _base$[ebp], eax
; Line 1766
	cmp	DWORD PTR _base$[ebp], 3200		; 00000c80H
	jl	SHORT $L1783
; Line 1768
	mov	DWORD PTR _base$[ebp], 320		; 00000140H
; Line 1769
	push	3240					; 00000ca8H
	push	24					; 00000018H
	push	OFFSET FLAT:$SG1784
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintString@AOAProtected@@QAEHPADHH@Z ; AOAProtected::AOAprintString
; Line 1770
	push	1644					; 0000066cH
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetCursor@AOAProtected@@QAEHH@Z	; AOAProtected::AOAsetCursor
$L1786:
; Line 1771
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	movsx	ecx, al
	cmp	ecx, 32					; 00000020H
	je	SHORT $L1787
	jmp	SHORT $L1786
$L1787:
; Line 1772
	push	3360					; 00000d20H
	push	320					; 00000140H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAclearScreen@AOAProtected@@QAEXHH@Z	; AOAProtected::AOAclearScreen
$L1783:
; Line 1776
	jmp	$L1771
$L1772:
; Line 1777
	mov	eax, DWORD PTR _base$[ebp]
	cdq
	sub	eax, edx
	sar	eax, 1
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetCursor@AOAProtected@@QAEHH@Z	; AOAProtected::AOAsetCursor
; Line 1778
	mov	esp, ebp
	pop	ebp
	ret	8
?AOAMsPrintText@AOAProtected@@QAEXPADH@Z ENDP		; AOAProtected::AOAMsPrintText
_TEXT	ENDS
PUBLIC	?AOAMsPrintText@AOAProtected@@QAEXPAD@Z		; AOAProtected::AOAMsPrintText
_DATA	SEGMENT
	ORG $+3
$SG1801	DB	'press space to next page', 00H
	ORG $+3
$SG1810	DB	'press space to next page', 00H
_DATA	ENDS
_TEXT	SEGMENT
_str$ = 8
_this$ = -20
_charpos$ = -8
_temp1$ = -4
_base$ = -16
_i$ = -12
?AOAMsPrintText@AOAProtected@@QAEXPAD@Z PROC NEAR	; AOAProtected::AOAMsPrintText
; Line 1783
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	mov	DWORD PTR _this$[ebp], ecx
; Line 1785
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCursor@AOAProtected@@QAEHXZ	; AOAProtected::AOAgetCursor
	mov	DWORD PTR _charpos$[ebp], eax
; Line 1786
	mov	eax, DWORD PTR _charpos$[ebp]
	shl	eax, 1
	mov	DWORD PTR _base$[ebp], eax
; Line 1788
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1796
$L1797:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L1796:
	mov	edx, DWORD PTR _str$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	$L1798
; Line 1790
	mov	ecx, DWORD PTR _str$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, 10					; 0000000aH
	jne	SHORT $L1799
; Line 1792
	mov	eax, DWORD PTR _base$[ebp]
	cdq
	mov	ecx, 160				; 000000a0H
	idiv	ecx
	mov	DWORD PTR _temp1$[ebp], edx
; Line 1793
	mov	edx, 160				; 000000a0H
	sub	edx, DWORD PTR _temp1$[ebp]
	mov	eax, DWORD PTR _base$[ebp]
	add	eax, edx
	mov	DWORD PTR _base$[ebp], eax
; Line 1794
	cmp	DWORD PTR _base$[ebp], 3200		; 00000c80H
	jl	SHORT $L1800
; Line 1796
	mov	DWORD PTR _base$[ebp], 320		; 00000140H
; Line 1797
	push	3240					; 00000ca8H
	push	24					; 00000018H
	push	OFFSET FLAT:$SG1801
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintString@AOAProtected@@QAEHPADHH@Z ; AOAProtected::AOAprintString
; Line 1798
	push	1644					; 0000066cH
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetCursor@AOAProtected@@QAEHH@Z	; AOAProtected::AOAsetCursor
$L1803:
; Line 1799
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	movsx	ecx, al
	cmp	ecx, 32					; 00000020H
	je	SHORT $L1804
	jmp	SHORT $L1803
$L1804:
; Line 1800
	push	3360					; 00000d20H
	push	320					; 00000140H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAclearScreen@AOAProtected@@QAEXHH@Z	; AOAProtected::AOAclearScreen
$L1800:
; Line 1803
	jmp	$L1809
$L1799:
	mov	edx, DWORD PTR _str$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, 9
	je	SHORT $L1807
	mov	ecx, DWORD PTR _str$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, 13					; 0000000dH
	jne	SHORT $L1806
$L1807:
; Line 1806
	jmp	SHORT $L1809
$L1806:
; Line 1808
	mov	eax, DWORD PTR _base$[ebp]
	push	eax
	mov	ecx, DWORD PTR _str$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	dl, BYTE PTR [ecx]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintCharacter@AOAProtected@@QAEHDH@Z ; AOAProtected::AOAprintCharacter
; Line 1809
	mov	eax, DWORD PTR _base$[ebp]
	add	eax, 2
	mov	DWORD PTR _base$[ebp], eax
; Line 1810
	cmp	DWORD PTR _base$[ebp], 3200		; 00000c80H
	jl	SHORT $L1809
; Line 1812
	mov	DWORD PTR _base$[ebp], 320		; 00000140H
; Line 1813
	push	3240					; 00000ca8H
	push	24					; 00000018H
	push	OFFSET FLAT:$SG1810
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintString@AOAProtected@@QAEHPADHH@Z ; AOAProtected::AOAprintString
; Line 1814
	push	1644					; 0000066cH
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetCursor@AOAProtected@@QAEHH@Z	; AOAProtected::AOAsetCursor
$L1812:
; Line 1815
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	movsx	ecx, al
	cmp	ecx, 32					; 00000020H
	je	SHORT $L1813
	jmp	SHORT $L1812
$L1813:
; Line 1816
	push	3360					; 00000d20H
	push	320					; 00000140H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAclearScreen@AOAProtected@@QAEXHH@Z	; AOAProtected::AOAclearScreen
$L1809:
; Line 1819
	jmp	$L1797
$L1798:
; Line 1820
	mov	eax, DWORD PTR _base$[ebp]
	cdq
	sub	eax, edx
	sar	eax, 1
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetCursor@AOAProtected@@QAEHH@Z	; AOAProtected::AOAsetCursor
; Line 1821
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
; Line 1824
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 1826
	mov	eax, DWORD PTR _Delay$[ebp]
	push	eax
	call	_CShortDelay32
	add	esp, 4
; Line 1828
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
_j$1829 = -12
?AOAStrMatch@AOAProtected@@QAEHHPAD0@Z PROC NEAR	; AOAProtected::AOAStrMatch
; Line 1835
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	mov	DWORD PTR _this$[ebp], ecx
; Line 1836
	mov	BYTE PTR _match$[ebp], 0
; Line 1837
	mov	eax, DWORD PTR _start$[ebp]
	mov	DWORD PTR _i$[ebp], eax
	jmp	SHORT $L1826
$L1827:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L1826:
	mov	edx, DWORD PTR _str1$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L1828
; Line 1839
	mov	DWORD PTR _j$1829[ebp], 0
	jmp	SHORT $L1830
$L1831:
	mov	ecx, DWORD PTR _j$1829[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$1829[ebp], ecx
$L1830:
	mov	edx, DWORD PTR _str2$[ebp]
	add	edx, DWORD PTR _j$1829[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L1832
; Line 1841
	mov	ecx, DWORD PTR _str2$[ebp]
	add	ecx, DWORD PTR _j$1829[ebp]
	movsx	edx, BYTE PTR [ecx]
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, DWORD PTR _j$1829[ebp]
	mov	ecx, DWORD PTR _str1$[ebp]
	movsx	eax, BYTE PTR [ecx+eax]
	cmp	edx, eax
	jne	SHORT $L1833
; Line 1842
	mov	BYTE PTR _match$[ebp], 1
; Line 1843
	jmp	SHORT $L1834
$L1833:
; Line 1845
	mov	BYTE PTR _match$[ebp], 0
; Line 1846
	jmp	SHORT $L1832
$L1834:
; Line 1848
	jmp	SHORT $L1831
$L1832:
; Line 1849
	mov	ecx, DWORD PTR _match$[ebp]
	and	ecx, 255				; 000000ffH
	test	ecx, ecx
	je	SHORT $L1835
; Line 1851
	mov	eax, DWORD PTR _i$[ebp]
	jmp	SHORT $L1823
$L1835:
; Line 1853
	jmp	SHORT $L1827
$L1828:
; Line 1854
	or	eax, -1
$L1823:
; Line 1855
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
; Line 1858
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 1859
	mov	eax, DWORD PTR _GDTIndex$[ebp]
	push	eax
	mov	ecx, DWORD PTR _descl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _desch$[ebp]
	push	edx
	call	_CgetGDTEntry32
	add	esp, 12					; 0000000cH
; Line 1860
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
	call	_CsetGDTEntry32
	add	esp, 12					; 0000000cH
; Line 1865
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
; Line 1868
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 1869
	mov	eax, DWORD PTR _IDTIndex$[ebp]
	push	eax
	mov	ecx, DWORD PTR _descl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _desch$[ebp]
	push	edx
	call	_CgetIDTEntry32
	add	esp, 12					; 0000000cH
; Line 1870
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
	call	_CsetIDTEntry32
	add	esp, 12					; 0000000cH
; Line 1875
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
; Line 1879
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1880
	mov	WORD PTR _n$[ebp], 65535		; 0000ffffH
; Line 1881
	mov	eax, DWORD PTR _n$[ebp]
	and	eax, 65535				; 0000ffffH
	cdq
	idiv	DWORD PTR _value$[ebp]
	mov	WORD PTR _n$[ebp], ax
; Line 1882
	push	800					; 00000320H
	mov	eax, DWORD PTR _n$[ebp]
	and	eax, 65535				; 0000ffffH
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1883
	mov	ecx, DWORD PTR _n$[ebp]
	and	ecx, 65535				; 0000ffffH
	and	ecx, 255				; 000000ffH
	mov	BYTE PTR _ln$[ebp], cl
; Line 1884
	mov	edx, DWORD PTR _n$[ebp]
	and	edx, 65535				; 0000ffffH
	sar	edx, 8
	and	edx, 255				; 000000ffH
	mov	BYTE PTR _hn$[ebp], dl
; Line 1887
	cli
; Line 1888
	push	eax
; Line 1889
	push	edx
; Line 1891
	xor	edx, edx
; Line 1892
	xor	eax, eax
; Line 1894
	mov	dx, 67					; 00000043H
; Line 1895
	mov	al, 60					; 0000003cH
; Line 1896
	out	dx, al
; Line 1897
	mov	dx, 64					; 00000040H
; Line 1898
	mov	al, BYTE PTR _ln$[ebp]
; Line 1899
	out	dx, al
; Line 1900
	mov	al, BYTE PTR _hn$[ebp]
; Line 1901
	out	dx, al
; Line 1903
	pop	edx
; Line 1904
	pop	eax
; Line 1905
	sti
; Line 1908
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
; Line 1914
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 1915
	mov	eax, DWORD PTR _lineno$[ebp]
	mov	DWORD PTR ?LineNumber@AOAProtected@@2HA, eax ; AOAProtected::LineNumber
; Line 1916
	mov	ecx, DWORD PTR ?LineNumber@AOAProtected@@2HA ; AOAProtected::LineNumber
	imul	ecx, 160				; 000000a0H
	mov	DWORD PTR ?PosCount@AOAProtected@@2HA, ecx ; AOAProtected::PosCount
; Line 1918
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
; Line 1924
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 1927
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1875
$L1876:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L1875:
	mov	eax, DWORD PTR ?PosCount@AOAProtected@@2HA ; AOAProtected::PosCount
	cdq
	sub	eax, edx
	sar	eax, 1
	cmp	DWORD PTR _i$[ebp], eax
	jge	SHORT $L1877
; Line 1929
	mov	ecx, DWORD PTR ?LineNumber@AOAProtected@@2HA ; AOAProtected::LineNumber
	imul	ecx, 160				; 000000a0H
	mov	edx, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [ecx+edx*2]
	push	eax
	push	32					; 00000020H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintCharacter@AOAProtected@@QAEHDH@Z ; AOAProtected::AOAprintCharacter
; Line 1930
	jmp	SHORT $L1876
$L1877:
; Line 1931
	mov	ecx, DWORD PTR ?LineNumber@AOAProtected@@2HA ; AOAProtected::LineNumber
	imul	ecx, 160				; 000000a0H
	mov	DWORD PTR ?PosCount@AOAProtected@@2HA, ecx ; AOAProtected::PosCount
; Line 1934
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
; Line 1939
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 1940
	mov	eax, DWORD PTR ?PosCount@AOAProtected@@2HA ; AOAProtected::PosCount
	push	eax
	mov	cl, BYTE PTR _c$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintCharacter@AOAProtected@@QAEHDH@Z ; AOAProtected::AOAprintCharacter
; Line 1941
	mov	edx, DWORD PTR ?PosCount@AOAProtected@@2HA ; AOAProtected::PosCount
	add	edx, 2
	mov	DWORD PTR ?PosCount@AOAProtected@@2HA, edx ; AOAProtected::PosCount
; Line 1943
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
; Line 1950
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	mov	DWORD PTR _this$[ebp], ecx
; Line 1951
	mov	eax, DWORD PTR _GDTDescNo$[ebp]
	mov	DWORD PTR _GDTIndex$[ebp], eax
; Line 1955
	mov	DWORD PTR _tem$[ebp], 0
; Line 1959
	mov	ecx, DWORD PTR _GDTIndex$[ebp]
	push	ecx
	lea	edx, DWORD PTR _desclg$[ebp]
	push	edx
	lea	eax, DWORD PTR _deschg$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetGDTEntry@AOAProtected@@QAEHPAJ0H@Z ; AOAProtected::AOAgetGDTEntry
; Line 1961
	mov	DWORD PTR _deschg$[ebp], 0
; Line 1962
	mov	ecx, DWORD PTR _desclg$[ebp]
	and	ecx, 15793920				; 00f0ff00H
	mov	DWORD PTR _desclg$[ebp], ecx
; Line 1963
	mov	DWORD PTR _tem$[ebp], 0
; Line 1965
	mov	edx, DWORD PTR _tem$[ebp]
	or	edx, 1114112				; 00110000H
	mov	DWORD PTR _tem$[ebp], edx
; Line 1967
	mov	eax, DWORD PTR _tem$[ebp]
	shl	eax, 16					; 00000010H
	and	eax, -65536				; ffff0000H
	mov	ecx, DWORD PTR _deschg$[ebp]
	or	ecx, eax
	mov	DWORD PTR _deschg$[ebp], ecx
; Line 1968
	mov	edx, DWORD PTR _deschg$[ebp]
	or	edx, 65535				; 0000ffffH
	mov	DWORD PTR _deschg$[ebp], edx
; Line 1969
	mov	eax, DWORD PTR _tem$[ebp]
	and	eax, -16777216				; ff000000H
	mov	ecx, DWORD PTR _desclg$[ebp]
	or	ecx, eax
	mov	DWORD PTR _desclg$[ebp], ecx
; Line 1970
	mov	edx, DWORD PTR _desclg$[ebp]
	or	edx, 983040				; 000f0000H
	mov	DWORD PTR _desclg$[ebp], edx
; Line 1971
	mov	eax, DWORD PTR _tem$[ebp]
	shr	eax, 16					; 00000010H
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _desclg$[ebp]
	or	ecx, eax
	mov	DWORD PTR _desclg$[ebp], ecx
; Line 1973
	mov	edx, DWORD PTR _desclg$[ebp]
	or	edx, 8388608				; 00800000H
	mov	DWORD PTR _desclg$[ebp], edx
; Line 1975
	mov	eax, DWORD PTR _GDTIndex$[ebp]
	push	eax
	lea	ecx, DWORD PTR _desclg$[ebp]
	push	ecx
	lea	edx, DWORD PTR _deschg$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetGDTEntry@AOAProtected@@QAEHPAJ0H@Z ; AOAProtected::AOAsetGDTEntry
; Line 1978
	mov	eax, DWORD PTR _GDTIndex$[ebp]
	shl	eax, 3
	mov	DWORD PTR _Selector$[ebp], eax
; Line 1979
	mov	ecx, DWORD PTR _Selector$[ebp]
	shl	ecx, 16					; 00000010H
	and	ecx, -65536				; ffff0000H
	mov	DWORD PTR _Selector$[ebp], ecx
; Line 1980
	mov	DWORD PTR _tem$[ebp], 0
; Line 1981
	mov	edx, DWORD PTR _tem$[ebp]
	or	edx, DWORD PTR _FunctionAddress$[ebp]
	mov	DWORD PTR _tem$[ebp], edx
; Line 1984
	mov	eax, DWORD PTR _IDTDescNo$[ebp]
	push	eax
	lea	ecx, DWORD PTR _desclg$[ebp]
	push	ecx
	lea	edx, DWORD PTR _deschg$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetIDTEntry@AOAProtected@@QAEHPAJ0H@Z ; AOAProtected::AOAgetIDTEntry
; Line 1987
	mov	eax, DWORD PTR _desclg$[ebp]
	and	eax, 65535				; 0000ffffH
	mov	DWORD PTR _desclg$[ebp], eax
; Line 1988
	mov	ecx, DWORD PTR _tem$[ebp]
	and	ecx, -65536				; ffff0000H
	mov	edx, DWORD PTR _desclg$[ebp]
	or	edx, ecx
	mov	DWORD PTR _desclg$[ebp], edx
; Line 1989
	mov	eax, DWORD PTR _deschg$[ebp]
	and	eax, -65536				; ffff0000H
	mov	DWORD PTR _deschg$[ebp], eax
; Line 1990
	mov	ecx, DWORD PTR _tem$[ebp]
	and	ecx, 65535				; 0000ffffH
	mov	edx, DWORD PTR _deschg$[ebp]
	or	edx, ecx
	mov	DWORD PTR _deschg$[ebp], edx
; Line 1993
	mov	eax, DWORD PTR _deschg$[ebp]
	or	eax, DWORD PTR _Selector$[ebp]
	mov	DWORD PTR _deschg$[ebp], eax
; Line 1996
	mov	ecx, DWORD PTR _IDTDescNo$[ebp]
	push	ecx
	lea	edx, DWORD PTR _desclg$[ebp]
	push	edx
	lea	eax, DWORD PTR _deschg$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetIDTEntry@AOAProtected@@QAEHPAJ0H@Z ; AOAProtected::AOAsetIDTEntry
; Line 1997
	xor	eax, eax
; Line 1998
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
; Line 2004
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 2005
	mov	DWORD PTR _value$[ebp], 0
; Line 2006
	mov	DWORD PTR _mask$[ebp], 0
; Line 2008
	mov	eax, DWORD PTR _number$[ebp]
	not	eax
	mov	DWORD PTR _value$[ebp], eax
; Line 2009
	mov	ecx, DWORD PTR _value$[ebp]
	add	ecx, 1
	mov	DWORD PTR _value$[ebp], ecx
; Line 2010
	mov	eax, DWORD PTR _value$[ebp]
; Line 2011
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
; Line 2020
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 2029
	mov	WORD PTR _value$[ebp], 0
; Line 2030
	mov	WORD PTR _value1$[ebp], 0
; Line 2032
	mov	WORD PTR _value$[ebp], 0
; Line 2033
	mov	eax, DWORD PTR _twochar$[ebp]
	movsx	ecx, BYTE PTR [eax]
	and	ecx, 255				; 000000ffH
	mov	WORD PTR _value$[ebp], cx
; Line 2034
	mov	edx, DWORD PTR _value$[ebp]
	and	edx, 65535				; 0000ffffH
	shl	edx, 8
	mov	WORD PTR _value$[ebp], dx
; Line 2035
	mov	WORD PTR _value1$[ebp], 0
; Line 2036
	mov	eax, DWORD PTR _twochar$[ebp]
	movsx	ecx, BYTE PTR [eax+1]
	and	ecx, 255				; 000000ffH
	mov	WORD PTR _value1$[ebp], cx
; Line 2037
	mov	edx, DWORD PTR _value$[ebp]
	and	edx, 65535				; 0000ffffH
	mov	eax, DWORD PTR _value1$[ebp]
	and	eax, 65535				; 0000ffffH
	or	edx, eax
	mov	WORD PTR _value$[ebp], dx
; Line 2038
	mov	ax, WORD PTR _value$[ebp]
; Line 2039
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
; Line 2062
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	push	esi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2063
	mov	DWORD PTR _sum$[ebp], 0
; Line 2065
	mov	DWORD PTR _i$[ebp], 0
; Line 2066
	mov	DWORD PTR _len$[ebp], 0
; Line 2067
	mov	DWORD PTR _n$[ebp], 0
; Line 2069
	mov	eax, DWORD PTR _str$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAStrLen@AOAProtected@@QAEHPAD@Z	; AOAProtected::AOAStrLen
	mov	DWORD PTR _len$[ebp], eax
; Line 2070
	mov	ecx, DWORD PTR _len$[ebp]
	sub	ecx, 1
	mov	DWORD PTR _n$[ebp], ecx
; Line 2071
	mov	DWORD PTR _sum$[ebp], 0
; Line 2073
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1914
$L1915:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L1914:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _len$[ebp]
	jge	SHORT $L1916
; Line 2075
	mov	ecx, DWORD PTR _str$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	dl, BYTE PTR [ecx]
	mov	BYTE PTR _c1$[ebp], dl
; Line 2076
	mov	al, BYTE PTR _c1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?ValidDecimalDigit@AOAProtected@@QAE_ND@Z ; AOAProtected::ValidDecimalDigit
	and	eax, 255				; 000000ffH
	test	eax, eax
	je	SHORT $L1917
; Line 2078
	mov	ecx, DWORD PTR _c1$[ebp]
	and	ecx, 255				; 000000ffH
	sub	ecx, 48					; 00000030H
	mov	BYTE PTR _c1$[ebp], cl
; Line 2079
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
; Line 2080
	mov	ecx, DWORD PTR _n$[ebp]
	sub	ecx, 1
	mov	DWORD PTR _n$[ebp], ecx
; Line 2082
	jmp	SHORT $L1918
$L1917:
	or	eax, -1
	jmp	SHORT $L1908
$L1918:
; Line 2083
	jmp	SHORT $L1915
$L1916:
; Line 2085
	mov	eax, DWORD PTR _sum$[ebp]
$L1908:
; Line 2086
	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	4
?AOAconvertDecimalCharsToInt@AOAProtected@@QAEIPAD@Z ENDP ; AOAProtected::AOAconvertDecimalCharsToInt
_c1$ = 8
_this$ = -4
?ValidDecimalDigit@AOAProtected@@QAE_ND@Z PROC NEAR	; AOAProtected::ValidDecimalDigit
; Line 2091
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 2092
	movsx	eax, BYTE PTR _c1$[ebp]
	cmp	eax, 48					; 00000030H
	jl	SHORT $L1923
	movsx	ecx, BYTE PTR _c1$[ebp]
	cmp	ecx, 57					; 00000039H
	jg	SHORT $L1923
; Line 2093
	mov	al, 1
	jmp	SHORT $L1924
$L1923:
; Line 2094
	xor	al, al
$L1924:
; Line 2095
	mov	esp, ebp
	pop	ebp
	ret	4
?ValidDecimalDigit@AOAProtected@@QAE_ND@Z ENDP		; AOAProtected::ValidDecimalDigit
_TEXT	ENDS
PUBLIC	?AOAconvertLongTo8HexChars@AOAProtected@@QAEXKPAD@Z ; AOAProtected::AOAconvertLongTo8HexChars
_TEXT	SEGMENT
_value$ = 8
_str$ = 12
_this$ = -20
_sum$ = -4
_c1$ = -8
_mask$ = -16
_i$ = -12
?AOAconvertLongTo8HexChars@AOAProtected@@QAEXKPAD@Z PROC NEAR ; AOAProtected::AOAconvertLongTo8HexChars
; Line 2101
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	mov	DWORD PTR _this$[ebp], ecx
; Line 2102
	mov	DWORD PTR _sum$[ebp], 0
; Line 2105
	mov	DWORD PTR _i$[ebp], 0
; Line 2107
	mov	eax, DWORD PTR _value$[ebp]
	mov	DWORD PTR _sum$[ebp], eax
; Line 2108
	mov	DWORD PTR _mask$[ebp], -268435456	; f0000000H
; Line 2109
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1934
$L1935:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L1934:
	cmp	DWORD PTR _i$[ebp], 8
	jge	SHORT $L1936
; Line 2111
	mov	edx, DWORD PTR _mask$[ebp]
	and	edx, DWORD PTR _sum$[ebp]
	mov	DWORD PTR _c1$[ebp], edx
; Line 2112
	mov	eax, DWORD PTR _i$[ebp]
	lea	ecx, DWORD PTR [eax*4+4]
	mov	edx, 32					; 00000020H
	sub	edx, ecx
	mov	eax, DWORD PTR _c1$[ebp]
	mov	ecx, edx
	shr	eax, cl
	mov	DWORD PTR _c1$[ebp], eax
; Line 2113
	mov	ecx, DWORD PTR _c1$[ebp]
	and	ecx, 15					; 0000000fH
	mov	DWORD PTR _c1$[ebp], ecx
; Line 2114
	cmp	DWORD PTR _c1$[ebp], 10			; 0000000aH
	jae	SHORT $L1937
; Line 2115
	mov	edx, DWORD PTR _c1$[ebp]
	add	edx, 48					; 00000030H
	mov	DWORD PTR _c1$[ebp], edx
; Line 2116
	jmp	SHORT $L1938
$L1937:
	mov	eax, DWORD PTR _c1$[ebp]
	add	eax, 55					; 00000037H
	mov	DWORD PTR _c1$[ebp], eax
$L1938:
; Line 2117
	mov	ecx, DWORD PTR _str$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	dl, BYTE PTR _c1$[ebp]
	mov	BYTE PTR [ecx], dl
; Line 2118
	mov	eax, DWORD PTR _mask$[ebp]
	shr	eax, 4
	mov	DWORD PTR _mask$[ebp], eax
; Line 2119
	jmp	SHORT $L1935
$L1936:
; Line 2120
	mov	esp, ebp
	pop	ebp
	ret	8
?AOAconvertLongTo8HexChars@AOAProtected@@QAEXKPAD@Z ENDP ; AOAProtected::AOAconvertLongTo8HexChars
_TEXT	ENDS
PUBLIC	?AOAconvertChar4ToLong@AOAProtected@@QAEKPAD@Z	; AOAProtected::AOAconvertChar4ToLong
_TEXT	SEGMENT
_fourchar$ = 8
_this$ = -16
_sum$ = -4
_c1$ = -8
_i$ = -12
?AOAconvertChar4ToLong@AOAProtected@@QAEKPAD@Z PROC NEAR ; AOAProtected::AOAconvertChar4ToLong
; Line 2123
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	mov	DWORD PTR _this$[ebp], ecx
; Line 2124
	mov	DWORD PTR _sum$[ebp], 0
; Line 2126
	mov	DWORD PTR _i$[ebp], 0
; Line 2129
	mov	eax, DWORD PTR _fourchar$[ebp]
	movsx	ecx, BYTE PTR [eax+3]
	sub	ecx, 48					; 00000030H
	mov	DWORD PTR _sum$[ebp], ecx
; Line 2130
	mov	DWORD PTR _i$[ebp], 2
$L1946:
; Line 2133
	mov	edx, DWORD PTR _fourchar$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR [edx]
	sub	eax, 48					; 00000030H
	mov	BYTE PTR _c1$[ebp], al
; Line 2134
	mov	ecx, DWORD PTR _c1$[ebp]
	and	ecx, 255				; 000000ffH
	test	ecx, ecx
	je	SHORT $L1949
; Line 2135
	mov	edx, DWORD PTR _c1$[ebp]
	and	edx, 255				; 000000ffH
	push	edx
	push	10					; 0000000aH
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPower@AOAProtected@@QAEKHH@Z	; AOAProtected::AOAPower
	mov	ecx, DWORD PTR _sum$[ebp]
	add	ecx, eax
	mov	DWORD PTR _sum$[ebp], ecx
$L1949:
; Line 2137
	mov	edx, DWORD PTR _i$[ebp]
	sub	edx, 1
	mov	DWORD PTR _i$[ebp], edx
; Line 2139
	cmp	DWORD PTR _i$[ebp], 0
	jge	SHORT $L1946
; Line 2142
	mov	eax, DWORD PTR _sum$[ebp]
; Line 2143
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
; Line 2167
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 2168
	mov	DWORD PTR _value1$[ebp], 0
; Line 2169
	mov	DWORD PTR _i$[ebp], 0
; Line 2171
	mov	eax, DWORD PTR _value$[ebp]
	mov	DWORD PTR _value1$[ebp], eax
; Line 2172
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1957
$L1958:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L1957:
	cmp	DWORD PTR _i$[ebp], 10			; 0000000aH
	jge	SHORT $L1959
; Line 2174
	mov	eax, DWORD PTR _value1$[ebp]
	xor	edx, edx
	mov	ecx, 10					; 0000000aH
	div	ecx
	add	edx, 48					; 00000030H
	mov	eax, 9
	sub	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _decimaldigits$[ebp]
	mov	BYTE PTR [ecx+eax], dl
; Line 2175
	mov	eax, DWORD PTR _value1$[ebp]
	xor	edx, edx
	mov	ecx, 10					; 0000000aH
	div	ecx
	mov	DWORD PTR _value1$[ebp], eax
; Line 2176
	jmp	SHORT $L1958
$L1959:
; Line 2178
	mov	edx, DWORD PTR _decimaldigits$[ebp]
	mov	BYTE PTR [edx+10], 0
; Line 2180
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
; Line 2186
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	push	ebx
	mov	DWORD PTR _this$[ebp], ecx
; Line 2187
	mov	DWORD PTR _value1$[ebp], 0
; Line 2188
	mov	DWORD PTR _i$[ebp], 0
; Line 2189
	mov	DWORD PTR _size$[ebp], 0
; Line 2190
	mov	DWORD PTR _sum$[ebp], 0
; Line 2191
	mov	BYTE PTR _c1$[ebp], 0
; Line 2192
	mov	eax, DWORD PTR _decimaldigits$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAStrLen@AOAProtected@@QAEHPAD@Z	; AOAProtected::AOAStrLen
	mov	DWORD PTR _size$[ebp], eax
; Line 2193
	mov	DWORD PTR _value1$[ebp], 0
; Line 2194
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1969
$L1970:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L1969:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _size$[ebp]
	jge	SHORT $L1971
; Line 2196
	mov	eax, DWORD PTR _decimaldigits$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	movsx	ecx, BYTE PTR [eax]
	sub	ecx, 48					; 00000030H
	mov	BYTE PTR _c1$[ebp], cl
; Line 2197
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
; Line 2198
	mov	eax, DWORD PTR _c1$[ebp]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _sum$[ebp]
	add	ecx, eax
	mov	DWORD PTR _sum$[ebp], ecx
; Line 2199
	jmp	SHORT $L1970
$L1971:
; Line 2201
	mov	eax, DWORD PTR _sum$[ebp]
; Line 2203
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
; Line 2209
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	mov	DWORD PTR _this$[ebp], ecx
; Line 2210
	mov	DWORD PTR _value1$[ebp], 0
; Line 2211
	mov	DWORD PTR _i$[ebp], 0
; Line 2212
	mov	DWORD PTR _nodigits$[ebp], 0
; Line 2214
	mov	eax, DWORD PTR _value$[ebp]
	mov	DWORD PTR _value1$[ebp], eax
; Line 2215
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1980
$L1981:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L1980:
	cmp	DWORD PTR _i$[ebp], 10			; 0000000aH
	jge	SHORT $L1982
; Line 2217
	mov	eax, DWORD PTR _value1$[ebp]
	xor	edx, edx
	mov	ecx, 10					; 0000000aH
	div	ecx
	add	edx, 48					; 00000030H
	mov	eax, 9
	sub	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _decimaldigits$[ebp]
	mov	BYTE PTR [ecx+eax], dl
; Line 2218
	mov	eax, DWORD PTR _value1$[ebp]
	xor	edx, edx
	mov	ecx, 10					; 0000000aH
	div	ecx
	mov	DWORD PTR _value1$[ebp], eax
; Line 2219
	cmp	DWORD PTR _value1$[ebp], 0
	jne	SHORT $L1983
; Line 2221
	jmp	SHORT $L1982
$L1983:
; Line 2223
	jmp	SHORT $L1981
$L1982:
; Line 2224
	mov	edx, DWORD PTR _decimaldigits$[ebp]
	mov	BYTE PTR [edx+10], 0
; Line 2225
	mov	eax, 9
	sub	eax, DWORD PTR _i$[ebp]
; Line 2226
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
; Line 2232
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2233
	mov	DWORD PTR _value1$[ebp], 0
; Line 2235
	mov	eax, DWORD PTR _value$[ebp]
	mov	DWORD PTR _value1$[ebp], eax
; Line 2236
	mov	ecx, DWORD PTR _fourchar$[ebp]
	mov	dl, BYTE PTR _value1$[ebp]
	mov	BYTE PTR [ecx], dl
; Line 2237
	mov	eax, DWORD PTR _value1$[ebp]
	shr	eax, 8
	mov	DWORD PTR _value1$[ebp], eax
; Line 2238
	mov	ecx, DWORD PTR _fourchar$[ebp]
	mov	dl, BYTE PTR _value1$[ebp]
	mov	BYTE PTR [ecx+1], dl
; Line 2239
	mov	eax, DWORD PTR _value1$[ebp]
	shr	eax, 8
	mov	DWORD PTR _value1$[ebp], eax
; Line 2240
	mov	ecx, DWORD PTR _fourchar$[ebp]
	mov	dl, BYTE PTR _value1$[ebp]
	mov	BYTE PTR [ecx+2], dl
; Line 2241
	mov	eax, DWORD PTR _value1$[ebp]
	shr	eax, 8
	mov	DWORD PTR _value1$[ebp], eax
; Line 2242
	mov	ecx, DWORD PTR _fourchar$[ebp]
	mov	dl, BYTE PTR _value1$[ebp]
	mov	BYTE PTR [ecx+3], dl
; Line 2243
	xor	eax, eax
; Line 2244
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
; Line 2250
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	mov	DWORD PTR _this$[ebp], ecx
; Line 2251
	mov	DWORD PTR _value1$[ebp], 0
; Line 2252
	mov	DWORD PTR _mask1$[ebp], 0
; Line 2255
	mov	eax, DWORD PTR _fourchar$[ebp]
	mov	cl, BYTE PTR [eax+3]
	mov	BYTE PTR _ch$[ebp], cl
; Line 2256
	mov	edx, DWORD PTR _ch$[ebp]
	and	edx, 255				; 000000ffH
	mov	DWORD PTR _value1$[ebp], edx
; Line 2257
	mov	eax, DWORD PTR _value1$[ebp]
	shl	eax, 24					; 00000018H
	mov	DWORD PTR _value1$[ebp], eax
; Line 2259
	mov	ecx, DWORD PTR _fourchar$[ebp]
	mov	dl, BYTE PTR [ecx+2]
	mov	BYTE PTR _ch$[ebp], dl
; Line 2260
	mov	eax, DWORD PTR _ch$[ebp]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _mask1$[ebp], eax
; Line 2261
	mov	ecx, DWORD PTR _mask1$[ebp]
	shl	ecx, 16					; 00000010H
	mov	DWORD PTR _mask1$[ebp], ecx
; Line 2262
	mov	edx, DWORD PTR _value1$[ebp]
	add	edx, DWORD PTR _mask1$[ebp]
	mov	DWORD PTR _value1$[ebp], edx
; Line 2264
	mov	eax, DWORD PTR _fourchar$[ebp]
	mov	cl, BYTE PTR [eax+1]
	mov	BYTE PTR _ch$[ebp], cl
; Line 2265
	mov	edx, DWORD PTR _ch$[ebp]
	and	edx, 255				; 000000ffH
	mov	DWORD PTR _mask1$[ebp], edx
; Line 2266
	mov	eax, DWORD PTR _mask1$[ebp]
	shl	eax, 8
	mov	DWORD PTR _mask1$[ebp], eax
; Line 2267
	mov	ecx, DWORD PTR _value1$[ebp]
	add	ecx, DWORD PTR _mask1$[ebp]
	mov	DWORD PTR _value1$[ebp], ecx
; Line 2269
	mov	edx, DWORD PTR _fourchar$[ebp]
	mov	al, BYTE PTR [edx]
	mov	BYTE PTR _ch$[ebp], al
; Line 2270
	mov	ecx, DWORD PTR _ch$[ebp]
	and	ecx, 255				; 000000ffH
	mov	DWORD PTR _mask1$[ebp], ecx
; Line 2271
	mov	edx, DWORD PTR _value1$[ebp]
	add	edx, DWORD PTR _mask1$[ebp]
	mov	DWORD PTR _value1$[ebp], edx
; Line 2273
	mov	eax, DWORD PTR _value1$[ebp]
; Line 2274
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
; Line 2280
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2281
	mov	WORD PTR _value1$[ebp], 0
; Line 2283
	mov	eax, DWORD PTR _value$[ebp]
	and	eax, 65535				; 0000ffffH
	and	eax, 65280				; 0000ff00H
	mov	WORD PTR _value1$[ebp], ax
; Line 2284
	mov	ecx, DWORD PTR _value1$[ebp]
	and	ecx, 65535				; 0000ffffH
	sar	ecx, 8
	mov	WORD PTR _value1$[ebp], cx
; Line 2285
	mov	edx, DWORD PTR _twochar$[ebp]
	mov	al, BYTE PTR _value1$[ebp]
	mov	BYTE PTR [edx], al
; Line 2286
	movsx	ecx, BYTE PTR _value$[ebp]
	and	ecx, 255				; 000000ffH
	mov	edx, DWORD PTR _twochar$[ebp]
	mov	BYTE PTR [edx+1], cl
; Line 2287
	xor	eax, eax
; Line 2288
	mov	esp, ebp
	pop	ebp
	ret	8
?AOAconvertShortToChar@AOAProtected@@QAEHPADG@Z ENDP	; AOAProtected::AOAconvertShortToChar
_TEXT	ENDS
PUBLIC	?AOAMaskRunRegister@AOAProtected@@QAEHHH@Z	; AOAProtected::AOAMaskRunRegister
_DATA	SEGMENT
	ORG $+3
$SG2027	DB	'Error: MaskRunRegister invalid pid or function code', 00H
_DATA	ENDS
_TEXT	SEGMENT
_pid$ = 8
_fn$ = 12
_this$ = -8
_mask$ = -4
?AOAMaskRunRegister@AOAProtected@@QAEHHH@Z PROC NEAR	; AOAProtected::AOAMaskRunRegister
; Line 2299
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2300
	mov	DWORD PTR _mask$[ebp], 0
; Line 2301
	cmp	DWORD PTR _pid$[ebp], 4
	jne	SHORT $L2015
	cmp	DWORD PTR _fn$[ebp], 1
	jne	SHORT $L2015
; Line 2303
	mov	DWORD PTR _mask$[ebp], 4
; Line 2304
	mov	eax, DWORD PTR ?RunRegister@AOAProtected@@2JA ; AOAProtected::RunRegister
	or	eax, DWORD PTR _mask$[ebp]
	mov	DWORD PTR ?RunRegister@AOAProtected@@2JA, eax ; AOAProtected::RunRegister
; Line 2306
	jmp	$L2026
$L2015:
	cmp	DWORD PTR _pid$[ebp], 7
	jne	SHORT $L2017
	cmp	DWORD PTR _fn$[ebp], 1
	jne	SHORT $L2017
; Line 2308
	mov	DWORD PTR _mask$[ebp], 2
; Line 2309
	mov	ecx, DWORD PTR ?RunRegister@AOAProtected@@2JA ; AOAProtected::RunRegister
	or	ecx, DWORD PTR _mask$[ebp]
	mov	DWORD PTR ?RunRegister@AOAProtected@@2JA, ecx ; AOAProtected::RunRegister
; Line 2311
	jmp	$L2026
$L2017:
	cmp	DWORD PTR _pid$[ebp], 5
	jne	SHORT $L2019
	cmp	DWORD PTR _fn$[ebp], 1
	jne	SHORT $L2019
; Line 2313
	mov	DWORD PTR _mask$[ebp], 1
; Line 2314
	mov	edx, DWORD PTR ?RunRegister@AOAProtected@@2JA ; AOAProtected::RunRegister
	or	edx, DWORD PTR _mask$[ebp]
	mov	DWORD PTR ?RunRegister@AOAProtected@@2JA, edx ; AOAProtected::RunRegister
; Line 2316
	jmp	$L2026
$L2019:
	cmp	DWORD PTR _pid$[ebp], 4
	jne	SHORT $L2021
	cmp	DWORD PTR _fn$[ebp], 0
	jne	SHORT $L2021
; Line 2318
	mov	DWORD PTR _mask$[ebp], 3
; Line 2319
	mov	eax, DWORD PTR ?RunRegister@AOAProtected@@2JA ; AOAProtected::RunRegister
	and	eax, DWORD PTR _mask$[ebp]
	mov	DWORD PTR ?RunRegister@AOAProtected@@2JA, eax ; AOAProtected::RunRegister
; Line 2321
	jmp	SHORT $L2026
$L2021:
	cmp	DWORD PTR _pid$[ebp], 7
	jne	SHORT $L2023
	cmp	DWORD PTR _fn$[ebp], 0
	jne	SHORT $L2023
; Line 2323
	mov	DWORD PTR _mask$[ebp], 5
; Line 2324
	mov	ecx, DWORD PTR ?RunRegister@AOAProtected@@2JA ; AOAProtected::RunRegister
	and	ecx, DWORD PTR _mask$[ebp]
	mov	DWORD PTR ?RunRegister@AOAProtected@@2JA, ecx ; AOAProtected::RunRegister
; Line 2326
	jmp	SHORT $L2026
$L2023:
	cmp	DWORD PTR _pid$[ebp], 5
	jne	SHORT $L2025
	cmp	DWORD PTR _fn$[ebp], 0
	jne	SHORT $L2025
; Line 2328
	mov	DWORD PTR _mask$[ebp], 6
; Line 2329
	mov	edx, DWORD PTR ?RunRegister@AOAProtected@@2JA ; AOAProtected::RunRegister
	and	edx, DWORD PTR _mask$[ebp]
	mov	DWORD PTR ?RunRegister@AOAProtected@@2JA, edx ; AOAProtected::RunRegister
; Line 2331
	jmp	SHORT $L2026
$L2025:
; Line 2333
	push	3840					; 00000f00H
	push	OFFSET FLAT:$SG2027
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 2334
	or	eax, -1
	jmp	SHORT $L2013
$L2026:
; Line 2336
	xor	eax, eax
$L2013:
; Line 2337
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
; Line 2343
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2344
	mov	DWORD PTR _retVal$[ebp], 0
; Line 2345
	movsx	eax, BYTE PTR _c$[ebp]
	cmp	eax, 48					; 00000030H
	jl	SHORT $L2033
	movsx	ecx, BYTE PTR _c$[ebp]
	cmp	ecx, 57					; 00000039H
	jg	SHORT $L2033
	mov	DWORD PTR _retVal$[ebp], 1
$L2033:
; Line 2346
	mov	eax, DWORD PTR _retVal$[ebp]
; Line 2347
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
; Line 2352
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2353
	mov	DWORD PTR _retVal$[ebp], 0
; Line 2354
	mov	al, BYTE PTR _c$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAisLower@AOAProtected@@QAEHD@Z	; AOAProtected::AOAisLower
	test	eax, eax
	jne	SHORT $L2040
	mov	cl, BYTE PTR _c$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAisUpper@AOAProtected@@QAEHD@Z	; AOAProtected::AOAisUpper
	test	eax, eax
	je	SHORT $L2039
$L2040:
	mov	DWORD PTR _retVal$[ebp], 1
$L2039:
; Line 2355
	mov	eax, DWORD PTR _retVal$[ebp]
; Line 2356
	mov	esp, ebp
	pop	ebp
	ret	4
?AOAisAlpha@AOAProtected@@QAEHD@Z ENDP			; AOAProtected::AOAisAlpha
_c$ = 8
_this$ = -8
_retVal$ = -4
?AOAisLower@AOAProtected@@QAEHD@Z PROC NEAR		; AOAProtected::AOAisLower
; Line 2361
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2362
	mov	DWORD PTR _retVal$[ebp], 0
; Line 2363
	movsx	eax, BYTE PTR _c$[ebp]
	cmp	eax, 97					; 00000061H
	jl	SHORT $L2046
	movsx	ecx, BYTE PTR _c$[ebp]
	cmp	ecx, 122				; 0000007aH
	jg	SHORT $L2046
	mov	DWORD PTR _retVal$[ebp], 1
$L2046:
; Line 2364
	mov	eax, DWORD PTR _retVal$[ebp]
; Line 2365
	mov	esp, ebp
	pop	ebp
	ret	4
?AOAisLower@AOAProtected@@QAEHD@Z ENDP			; AOAProtected::AOAisLower
_this$ = -8
_retVal$ = -4
_c$ = 8
?AOAisUpper@AOAProtected@@QAEHD@Z PROC NEAR		; AOAProtected::AOAisUpper
; Line 2370
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2371
	mov	DWORD PTR _retVal$[ebp], 0
; Line 2372
	movsx	eax, BYTE PTR _c$[ebp]
	cmp	eax, 65					; 00000041H
	jl	SHORT $L2052
	movsx	ecx, BYTE PTR _c$[ebp]
	cmp	ecx, 90					; 0000005aH
	jg	SHORT $L2052
	mov	DWORD PTR _retVal$[ebp], 1
$L2052:
; Line 2373
	mov	eax, DWORD PTR _retVal$[ebp]
; Line 2374
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
; Line 2378
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 2379
	mov	eax, DWORD PTR _dst$[ebp]
	mov	DWORD PTR _d$[ebp], eax
; Line 2380
	mov	ecx, DWORD PTR _src$[ebp]
	mov	DWORD PTR _s$[ebp], ecx
$L2064:
; Line 2382
	cmp	DWORD PTR _n$[ebp], 0
	jle	SHORT $L2065
; Line 2384
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
; Line 2385
	mov	ecx, DWORD PTR _n$[ebp]
	sub	ecx, 1
	mov	DWORD PTR _n$[ebp], ecx
; Line 2386
	jmp	SHORT $L2064
$L2065:
; Line 2388
	mov	eax, DWORD PTR _dst$[ebp]
; Line 2389
	mov	esp, ebp
	pop	ebp
	ret	12					; 0000000cH
?memcpy@AOAProtected@@QAEPAXPAXPBXH@Z ENDP		; AOAProtected::memcpy
_TEXT	ENDS
PUBLIC	?memset@AOAProtected@@QAEPAXPAXHH@Z		; AOAProtected::memset
_TEXT	SEGMENT
_s$ = 8
_c$ = 12
_n$ = 16
_this$ = -8
_p$ = -4
?memset@AOAProtected@@QAEPAXPAXHH@Z PROC NEAR		; AOAProtected::memset
; Line 2392
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2393
	mov	eax, DWORD PTR _s$[ebp]
	mov	DWORD PTR _p$[ebp], eax
$L2075:
; Line 2395
	cmp	DWORD PTR _n$[ebp], 0
	jle	SHORT $L2076
; Line 2397
	mov	ecx, DWORD PTR _p$[ebp]
	mov	dl, BYTE PTR _c$[ebp]
	mov	BYTE PTR [ecx], dl
	mov	eax, DWORD PTR _p$[ebp]
	add	eax, 1
	mov	DWORD PTR _p$[ebp], eax
; Line 2398
	mov	ecx, DWORD PTR _n$[ebp]
	sub	ecx, 1
	mov	DWORD PTR _n$[ebp], ecx
; Line 2399
	jmp	SHORT $L2075
$L2076:
; Line 2401
	mov	eax, DWORD PTR _s$[ebp]
; Line 2402
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
; Line 2404
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	mov	DWORD PTR _this$[ebp], ecx
; Line 2406
	mov	eax, DWORD PTR _N$[ebp]
	and	eax, 255				; 000000ffH
	mov	BYTE PTR _B0$[ebp], al
; Line 2407
	mov	ecx, DWORD PTR _N$[ebp]
	and	ecx, 65280				; 0000ff00H
	shr	ecx, 8
	mov	BYTE PTR _B1$[ebp], cl
; Line 2408
	mov	edx, DWORD PTR _N$[ebp]
	and	edx, 16711680				; 00ff0000H
	shr	edx, 16					; 00000010H
	mov	BYTE PTR _B2$[ebp], dl
; Line 2409
	mov	eax, DWORD PTR _N$[ebp]
	and	eax, -16777216				; ff000000H
	shr	eax, 24					; 00000018H
	mov	BYTE PTR _B3$[ebp], al
; Line 2410
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
; Line 2411
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
; Line 2413
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 2415
	mov	eax, DWORD PTR _N$[ebp]
	and	eax, 65535				; 0000ffffH
	and	eax, 255				; 000000ffH
	mov	BYTE PTR _B0$[ebp], al
; Line 2416
	mov	ecx, DWORD PTR _N$[ebp]
	and	ecx, 65535				; 0000ffffH
	and	ecx, 65280				; 0000ff00H
	sar	ecx, 8
	mov	BYTE PTR _B1$[ebp], cl
; Line 2417
	mov	eax, DWORD PTR _B0$[ebp]
	and	eax, 255				; 000000ffH
	shl	eax, 8
	mov	edx, DWORD PTR _B1$[ebp]
	and	edx, 255				; 000000ffH
	or	eax, edx
; Line 2418
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
; Line 2420
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	mov	DWORD PTR _this$[ebp], ecx
; Line 2421
	mov	BYTE PTR _t1$[ebp], 32			; 00000020H
; Line 2422
	mov	BYTE PTR _c1$[ebp], 0
; Line 2423
	mov	BYTE PTR _c2$[ebp], 0
; Line 2425
	mov	eax, DWORD PTR _ptr$[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 48					; 00000030H
	jl	SHORT $L2099
	mov	edx, DWORD PTR _ptr$[ebp]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, 57					; 00000039H
	jg	SHORT $L2099
; Line 2426
	mov	ecx, DWORD PTR _ptr$[ebp]
	movsx	edx, BYTE PTR [ecx]
	sub	edx, 48					; 00000030H
	mov	BYTE PTR _c1$[ebp], dl
; Line 2427
	jmp	SHORT $L2103
$L2099:
; Line 2428
	mov	eax, DWORD PTR _ptr$[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 65					; 00000041H
	jl	SHORT $L2101
	mov	edx, DWORD PTR _ptr$[ebp]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, 70					; 00000046H
	jg	SHORT $L2101
; Line 2429
	mov	ecx, DWORD PTR _ptr$[ebp]
	movsx	edx, BYTE PTR [ecx]
	sub	edx, 55					; 00000037H
	mov	BYTE PTR _c1$[ebp], dl
; Line 2430
	jmp	SHORT $L2103
$L2101:
; Line 2431
	mov	eax, DWORD PTR _ptr$[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 97					; 00000061H
	jl	SHORT $L2103
	mov	edx, DWORD PTR _ptr$[ebp]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, 102				; 00000066H
	jg	SHORT $L2103
; Line 2432
	mov	ecx, DWORD PTR _ptr$[ebp]
	movsx	edx, BYTE PTR [ecx]
	sub	edx, 87					; 00000057H
	mov	BYTE PTR _c1$[ebp], dl
$L2103:
; Line 2434
	movsx	eax, BYTE PTR _c1$[ebp]
	and	eax, 15					; 0000000fH
	mov	BYTE PTR _c1$[ebp], al
; Line 2435
	movsx	ecx, BYTE PTR _c1$[ebp]
	shl	ecx, 4
	mov	BYTE PTR _c1$[ebp], cl
; Line 2437
	mov	edx, DWORD PTR _ptr$[ebp]
	movsx	eax, BYTE PTR [edx+1]
	cmp	eax, 48					; 00000030H
	jl	SHORT $L2104
	mov	ecx, DWORD PTR _ptr$[ebp]
	movsx	edx, BYTE PTR [ecx+1]
	cmp	edx, 57					; 00000039H
	jg	SHORT $L2104
; Line 2438
	mov	eax, DWORD PTR _ptr$[ebp]
	movsx	ecx, BYTE PTR [eax+1]
	sub	ecx, 48					; 00000030H
	mov	BYTE PTR _c2$[ebp], cl
; Line 2439
	jmp	SHORT $L2108
$L2104:
; Line 2440
	mov	edx, DWORD PTR _ptr$[ebp]
	movsx	eax, BYTE PTR [edx+1]
	cmp	eax, 65					; 00000041H
	jl	SHORT $L2106
	mov	ecx, DWORD PTR _ptr$[ebp]
	movsx	edx, BYTE PTR [ecx+1]
	cmp	edx, 70					; 00000046H
	jg	SHORT $L2106
; Line 2441
	mov	eax, DWORD PTR _ptr$[ebp]
	movsx	ecx, BYTE PTR [eax+1]
	sub	ecx, 55					; 00000037H
	mov	BYTE PTR _c2$[ebp], cl
; Line 2442
	jmp	SHORT $L2108
$L2106:
; Line 2443
	mov	edx, DWORD PTR _ptr$[ebp]
	movsx	eax, BYTE PTR [edx+1]
	cmp	eax, 97					; 00000061H
	jl	SHORT $L2108
	mov	ecx, DWORD PTR _ptr$[ebp]
	movsx	edx, BYTE PTR [ecx+1]
	cmp	edx, 102				; 00000066H
	jg	SHORT $L2108
; Line 2444
	mov	eax, DWORD PTR _ptr$[ebp]
	movsx	ecx, BYTE PTR [eax+1]
	sub	ecx, 87					; 00000057H
	mov	BYTE PTR _c2$[ebp], cl
$L2108:
; Line 2446
	movsx	edx, BYTE PTR _c2$[ebp]
	and	edx, 15					; 0000000fH
	mov	BYTE PTR _c2$[ebp], dl
; Line 2447
	movsx	eax, BYTE PTR _c1$[ebp]
	movsx	ecx, BYTE PTR _c2$[ebp]
	or	eax, ecx
	mov	BYTE PTR _c1$[ebp], al
; Line 2449
	movsx	edx, BYTE PTR _c1$[ebp]
	and	edx, 255				; 000000ffH
	mov	BYTE PTR _t1$[ebp], dl
; Line 2451
	mov	al, BYTE PTR _t1$[ebp]
; Line 2452
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
; Line 2454
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 2455
	mov	BYTE PTR _areSame$[ebp], 1
; Line 2456
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L2117
$L2118:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L2117:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _length$[ebp]
	jge	SHORT $L2119
; Line 2457
	mov	edx, DWORD PTR _s1$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR [edx]
	mov	ecx, DWORD PTR _s2$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	movsx	edx, BYTE PTR [ecx]
	cmp	eax, edx
	je	SHORT $L2120
; Line 2459
	mov	BYTE PTR _areSame$[ebp], 0
; Line 2460
	jmp	SHORT $L2119
$L2120:
; Line 2462
	jmp	SHORT $L2118
$L2119:
	mov	al, BYTE PTR _areSame$[ebp]
; Line 2463
	mov	esp, ebp
	pop	ebp
	ret	12					; 0000000cH
?isSame@AOAProtected@@QAE_NPAD0H@Z ENDP			; AOAProtected::isSame
_TEXT	ENDS
END
