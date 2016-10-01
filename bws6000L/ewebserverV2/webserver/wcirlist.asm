	TITLE	wcirlist.cpp
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
PUBLIC	?base@WCirList@@0JA				; WCirList::base
PUBLIC	?size@WCirList@@0JA				; WCirList::size
PUBLIC	?InPtr@WCirList@@0HA				; WCirList::InPtr
PUBLIC	?OutPtr@WCirList@@0HA				; WCirList::OutPtr
PUBLIC	?InRecord@WCirList@@2PAUESRecord@1@A		; WCirList::InRecord
PUBLIC	?OutRecord@WCirList@@2PAUESRecord@1@A		; WCirList::OutRecord
_BSS	SEGMENT
?base@WCirList@@0JA DD 01H DUP (?)			; WCirList::base
?size@WCirList@@0JA DD 01H DUP (?)			; WCirList::size
?InPtr@WCirList@@0HA DD 01H DUP (?)			; WCirList::InPtr
?OutPtr@WCirList@@0HA DD 01H DUP (?)			; WCirList::OutPtr
?InRecord@WCirList@@2PAUESRecord@1@A DD 01H DUP (?)	; WCirList::InRecord
?OutRecord@WCirList@@2PAUESRecord@1@A DD 01H DUP (?)	; WCirList::OutRecord
_BSS	ENDS
PUBLIC	?init@WCirList@@QAEHJJ@Z			; WCirList::init
_TEXT	SEGMENT
_inpbase$ = 8
_inpsize$ = 12
_this$ = -12
_ESRecordPtr$ = -4
_i$ = -8
?init@WCirList@@QAEHJJ@Z PROC NEAR			; WCirList::init
; File wcirlist.cpp
; Line 23
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 24
	mov	DWORD PTR ?InPtr@WCirList@@0HA, 0	; WCirList::InPtr
; Line 25
	mov	DWORD PTR ?OutPtr@WCirList@@0HA, 0	; WCirList::OutPtr
; Line 27
	mov	eax, DWORD PTR _inpbase$[ebp]
	mov	DWORD PTR ?base@WCirList@@0JA, eax	; WCirList::base
; Line 28
	mov	ecx, DWORD PTR _inpsize$[ebp]
	mov	DWORD PTR ?size@WCirList@@0JA, ecx	; WCirList::size
; Line 34
	mov	edx, DWORD PTR ?base@WCirList@@0JA	; WCirList::base
	mov	DWORD PTR ?InRecord@WCirList@@2PAUESRecord@1@A, edx ; WCirList::InRecord
; Line 35
	mov	eax, DWORD PTR ?base@WCirList@@0JA	; WCirList::base
	mov	DWORD PTR ?OutRecord@WCirList@@2PAUESRecord@1@A, eax ; WCirList::OutRecord
; Line 40
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L895
$L896:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L895:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR ?size@WCirList@@0JA	; WCirList::size
	jge	SHORT $L897
; Line 42
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 24					; 00000018H
	mov	ecx, DWORD PTR ?base@WCirList@@0JA	; WCirList::base
	add	ecx, eax
	mov	DWORD PTR _ESRecordPtr$[ebp], ecx
; Line 43
	mov	edx, DWORD PTR _ESRecordPtr$[ebp]
	mov	DWORD PTR [edx], 0
; Line 44
	mov	eax, DWORD PTR _ESRecordPtr$[ebp]
	mov	DWORD PTR [eax+4], 0
; Line 45
	mov	ecx, DWORD PTR _ESRecordPtr$[ebp]
	mov	DWORD PTR [ecx+8], 0
; Line 46
	mov	edx, DWORD PTR _ESRecordPtr$[ebp]
	mov	DWORD PTR [edx+12], 0
; Line 47
	mov	eax, DWORD PTR _ESRecordPtr$[ebp]
	mov	DWORD PTR [eax+16], 0
; Line 48
	mov	ecx, DWORD PTR _ESRecordPtr$[ebp]
	mov	DWORD PTR [ecx+20], 0
; Line 49
	jmp	SHORT $L896
$L897:
; Line 50
	xor	eax, eax
; Line 51
	mov	esp, ebp
	pop	ebp
	ret	8
?init@WCirList@@QAEHJJ@Z ENDP				; WCirList::init
_TEXT	ENDS
PUBLIC	?insert@WCirList@@QAEHJJJHJ@Z			; WCirList::insert
EXTRN	?AOAprintHex@AOAProtected@@QAEHJH@Z:NEAR	; AOAProtected::AOAprintHex
EXTRN	?AOAPrintText@AOAProtected@@QAEXPADH@Z:NEAR	; AOAProtected::AOAPrintText
_DATA	SEGMENT
$SG915	DB	'ERROR:Cirlist:Insert: Valit Bit is Set:', 00H
_DATA	ENDS
_TEXT	SEGMENT
_id$ = 8
_delay1$ = 12
_state$ = 16
_tcbrno$ = 20
_timerc$ = 24
_this$ = -12
_tempCurrentRecord$ = -8
_ESRecordPtr$ = -4
?insert@WCirList@@QAEHJJJHJ@Z PROC NEAR			; WCirList::insert
; Line 60
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 64
	mov	eax, DWORD PTR ?InRecord@WCirList@@2PAUESRecord@1@A ; WCirList::InRecord
	mov	DWORD PTR _tempCurrentRecord$[ebp], eax
; Line 66
	mov	ecx, DWORD PTR _tempCurrentRecord$[ebp]
	cmp	DWORD PTR [ecx], 0
	jne	SHORT $L910
; Line 68
	mov	edx, DWORD PTR _tempCurrentRecord$[ebp]
	mov	DWORD PTR [edx], 1
; Line 69
	mov	eax, DWORD PTR _tempCurrentRecord$[ebp]
	mov	ecx, DWORD PTR _id$[ebp]
	mov	DWORD PTR [eax+4], ecx
; Line 70
	mov	edx, DWORD PTR _tempCurrentRecord$[ebp]
	mov	eax, DWORD PTR _delay1$[ebp]
	mov	DWORD PTR [edx+8], eax
; Line 71
	mov	ecx, DWORD PTR _tempCurrentRecord$[ebp]
	mov	edx, DWORD PTR _state$[ebp]
	mov	DWORD PTR [ecx+12], edx
; Line 72
	mov	eax, DWORD PTR _tempCurrentRecord$[ebp]
	mov	ecx, DWORD PTR _tcbrno$[ebp]
	mov	DWORD PTR [eax+16], ecx
; Line 73
	mov	edx, DWORD PTR _tempCurrentRecord$[ebp]
	mov	eax, DWORD PTR _timerc$[ebp]
	mov	DWORD PTR [edx+20], eax
; Line 75
	mov	ecx, DWORD PTR ?InPtr@WCirList@@0HA	; WCirList::InPtr
	add	ecx, 1
	mov	DWORD PTR ?InPtr@WCirList@@0HA, ecx	; WCirList::InPtr
; Line 76
	mov	edx, DWORD PTR ?InPtr@WCirList@@0HA	; WCirList::InPtr
	cmp	edx, DWORD PTR ?size@WCirList@@0JA	; WCirList::size
	jl	SHORT $L911
; Line 78
	mov	DWORD PTR ?InPtr@WCirList@@0HA, 0	; WCirList::InPtr
$L911:
; Line 81
	mov	eax, DWORD PTR ?InPtr@WCirList@@0HA	; WCirList::InPtr
	imul	eax, 24					; 00000018H
	mov	ecx, DWORD PTR ?base@WCirList@@0JA	; WCirList::base
	add	ecx, eax
	mov	DWORD PTR _ESRecordPtr$[ebp], ecx
; Line 83
	mov	edx, DWORD PTR _ESRecordPtr$[ebp]
	mov	DWORD PTR ?InRecord@WCirList@@2PAUESRecord@1@A, edx ; WCirList::InRecord
; Line 86
	jmp	SHORT $L914
$L910:
; Line 88
	push	3520					; 00000dc0H
	push	OFFSET FLAT:$SG915
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 89
	push	3740					; 00000e9cH
	mov	eax, DWORD PTR _tempCurrentRecord$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 90
	push	3760					; 00000eb0H
	mov	ecx, DWORD PTR _tempCurrentRecord$[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 91
	push	3940					; 00000f64H
	mov	eax, DWORD PTR ?InPtr@WCirList@@0HA	; WCirList::InPtr
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 92
	push	3960					; 00000f78H
	mov	ecx, DWORD PTR ?OutPtr@WCirList@@0HA	; WCirList::OutPtr
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 93
	or	eax, -1
	jmp	SHORT $L907
$L914:
; Line 96
	xor	eax, eax
$L907:
; Line 97
	mov	esp, ebp
	pop	ebp
	ret	20					; 00000014H
?insert@WCirList@@QAEHJJJHJ@Z ENDP			; WCirList::insert
_TEXT	ENDS
PUBLIC	?get@WCirList@@QAEHPAJPAI0PAH0@Z		; WCirList::get
_DATA	SEGMENT
$SG932	DB	'ERROR:Cirlist:get: Valit Bit is reset:', 00H
_DATA	ENDS
_TEXT	SEGMENT
_taskid$ = 8
_delayc$ = 12
_statec$ = 16
_tcbrnoc$ = 20
_timerc$ = 24
_this$ = -12
_tempCurrentRecord$ = -8
_ESRecordPtr$ = -4
?get@WCirList@@QAEHPAJPAI0PAH0@Z PROC NEAR		; WCirList::get
; Line 105
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 109
	mov	eax, DWORD PTR ?OutRecord@WCirList@@2PAUESRecord@1@A ; WCirList::OutRecord
	mov	DWORD PTR _tempCurrentRecord$[ebp], eax
; Line 111
	mov	ecx, DWORD PTR _tempCurrentRecord$[ebp]
	cmp	DWORD PTR [ecx], 1
	jne	$L927
; Line 113
	mov	edx, DWORD PTR _tempCurrentRecord$[ebp]
	mov	DWORD PTR [edx], 0
; Line 114
	mov	eax, DWORD PTR _taskid$[ebp]
	mov	ecx, DWORD PTR _tempCurrentRecord$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR [eax], edx
; Line 115
	mov	eax, DWORD PTR _delayc$[ebp]
	mov	ecx, DWORD PTR _tempCurrentRecord$[ebp]
	mov	edx, DWORD PTR [ecx+8]
	mov	DWORD PTR [eax], edx
; Line 116
	mov	eax, DWORD PTR _statec$[ebp]
	mov	ecx, DWORD PTR _tempCurrentRecord$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [eax], edx
; Line 117
	mov	eax, DWORD PTR _tcbrnoc$[ebp]
	mov	ecx, DWORD PTR _tempCurrentRecord$[ebp]
	mov	edx, DWORD PTR [ecx+16]
	mov	DWORD PTR [eax], edx
; Line 118
	mov	eax, DWORD PTR _timerc$[ebp]
	mov	ecx, DWORD PTR _tempCurrentRecord$[ebp]
	mov	edx, DWORD PTR [ecx+20]
	mov	DWORD PTR [eax], edx
; Line 120
	mov	eax, DWORD PTR ?OutPtr@WCirList@@0HA	; WCirList::OutPtr
	add	eax, 1
	mov	DWORD PTR ?OutPtr@WCirList@@0HA, eax	; WCirList::OutPtr
; Line 121
	mov	ecx, DWORD PTR ?OutPtr@WCirList@@0HA	; WCirList::OutPtr
	cmp	ecx, DWORD PTR ?size@WCirList@@0JA	; WCirList::size
	jl	SHORT $L928
; Line 123
	mov	DWORD PTR ?OutPtr@WCirList@@0HA, 0	; WCirList::OutPtr
$L928:
; Line 126
	mov	edx, DWORD PTR ?OutPtr@WCirList@@0HA	; WCirList::OutPtr
	imul	edx, 24					; 00000018H
	mov	eax, DWORD PTR ?base@WCirList@@0JA	; WCirList::base
	add	eax, edx
	mov	DWORD PTR _ESRecordPtr$[ebp], eax
; Line 127
	mov	ecx, DWORD PTR _ESRecordPtr$[ebp]
	mov	DWORD PTR ?OutRecord@WCirList@@2PAUESRecord@1@A, ecx ; WCirList::OutRecord
; Line 130
	jmp	SHORT $L931
$L927:
; Line 132
	push	3520					; 00000dc0H
	push	OFFSET FLAT:$SG932
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 133
	push	3740					; 00000e9cH
	mov	edx, DWORD PTR _tempCurrentRecord$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 134
	push	3760					; 00000eb0H
	mov	eax, DWORD PTR _tempCurrentRecord$[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 135
	push	3940					; 00000f64H
	mov	edx, DWORD PTR ?InPtr@WCirList@@0HA	; WCirList::InPtr
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 136
	push	3960					; 00000f78H
	mov	eax, DWORD PTR ?OutPtr@WCirList@@0HA	; WCirList::OutPtr
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 137
	or	eax, -1
	jmp	SHORT $L924
$L931:
; Line 141
	xor	eax, eax
$L924:
; Line 142
	mov	esp, ebp
	pop	ebp
	ret	20					; 00000014H
?get@WCirList@@QAEHPAJPAI0PAH0@Z ENDP			; WCirList::get
_TEXT	ENDS
PUBLIC	?empty@WCirList@@QAEHXZ				; WCirList::empty
_TEXT	SEGMENT
_this$ = -8
_retcode$ = -4
?empty@WCirList@@QAEHXZ PROC NEAR			; WCirList::empty
; Line 147
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 148
	mov	DWORD PTR _retcode$[ebp], 0
; Line 150
	mov	eax, DWORD PTR ?InPtr@WCirList@@0HA	; WCirList::InPtr
	cmp	eax, DWORD PTR ?OutPtr@WCirList@@0HA	; WCirList::OutPtr
	jne	SHORT $L938
; Line 151
	mov	DWORD PTR _retcode$[ebp], 1
; Line 152
	jmp	SHORT $L939
$L938:
	mov	DWORD PTR _retcode$[ebp], 0
$L939:
; Line 154
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 155
	mov	esp, ebp
	pop	ebp
	ret	0
?empty@WCirList@@QAEHXZ ENDP				; WCirList::empty
_TEXT	ENDS
PUBLIC	?full@WCirList@@QAEHXZ				; WCirList::full
_TEXT	SEGMENT
_this$ = -8
_retcode$ = -4
?full@WCirList@@QAEHXZ PROC NEAR			; WCirList::full
; Line 160
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 161
	mov	DWORD PTR _retcode$[ebp], 0
; Line 163
	mov	eax, DWORD PTR ?InPtr@WCirList@@0HA	; WCirList::InPtr
	add	eax, 1
	cdq
	idiv	DWORD PTR ?size@WCirList@@0JA		; WCirList::size
	cmp	edx, DWORD PTR ?OutPtr@WCirList@@0HA	; WCirList::OutPtr
	jne	SHORT $L944
; Line 164
	mov	DWORD PTR _retcode$[ebp], 1
; Line 165
	jmp	SHORT $L945
$L944:
	mov	DWORD PTR _retcode$[ebp], 0
$L945:
; Line 167
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 168
	mov	esp, ebp
	pop	ebp
	ret	0
?full@WCirList@@QAEHXZ ENDP				; WCirList::full
_TEXT	ENDS
PUBLIC	?getCount@WCirList@@QAEHXZ			; WCirList::getCount
_TEXT	SEGMENT
_this$ = -4
?getCount@WCirList@@QAEHXZ PROC NEAR			; WCirList::getCount
; Line 174
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 175
	mov	eax, DWORD PTR ?InPtr@WCirList@@0HA	; WCirList::InPtr
	cmp	eax, DWORD PTR ?OutPtr@WCirList@@0HA	; WCirList::OutPtr
	jl	SHORT $L949
; Line 176
	mov	eax, DWORD PTR ?InPtr@WCirList@@0HA	; WCirList::InPtr
	sub	eax, DWORD PTR ?OutPtr@WCirList@@0HA	; WCirList::OutPtr
	jmp	SHORT $L950
$L949:
; Line 178
	mov	ecx, DWORD PTR ?OutPtr@WCirList@@0HA	; WCirList::OutPtr
	sub	ecx, DWORD PTR ?InPtr@WCirList@@0HA	; WCirList::InPtr
	mov	eax, DWORD PTR ?size@WCirList@@0JA	; WCirList::size
	sub	eax, ecx
$L950:
; Line 179
	mov	esp, ebp
	pop	ebp
	ret	0
?getCount@WCirList@@QAEHXZ ENDP				; WCirList::getCount
_TEXT	ENDS
PUBLIC	?printlist@WCirList@@QAEHH@Z			; WCirList::printlist
_TEXT	SEGMENT
_lineno$ = 8
_this$ = -36
_count1$ = -4
_tempCurrentRecord$ = -16
_taskid$ = -28
_statec$ = -32
_outptr1$ = -24
_j$ = -12
_k$ = -20
_i$ = -8
?printlist@WCirList@@QAEHH@Z PROC NEAR			; WCirList::printlist
; Line 184
	push	ebp
	mov	ebp, esp
	sub	esp, 36					; 00000024H
	mov	DWORD PTR _this$[ebp], ecx
; Line 187
	mov	DWORD PTR _taskid$[ebp], 0
; Line 188
	mov	DWORD PTR _statec$[ebp], 0
; Line 189
	mov	eax, DWORD PTR ?OutPtr@WCirList@@0HA	; WCirList::OutPtr
	mov	DWORD PTR _outptr1$[ebp], eax
; Line 190
	mov	DWORD PTR _j$[ebp], 0
	mov	DWORD PTR _k$[ebp], 0
; Line 192
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getCount@WCirList@@QAEHXZ		; WCirList::getCount
	mov	DWORD PTR _count1$[ebp], eax
; Line 193
	mov	ecx, DWORD PTR ?OutRecord@WCirList@@2PAUESRecord@1@A ; WCirList::OutRecord
	mov	DWORD PTR _tempCurrentRecord$[ebp], ecx
; Line 195
	mov	edx, DWORD PTR _lineno$[ebp]
	mov	DWORD PTR _i$[ebp], edx
	jmp	SHORT $L963
$L964:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L963:
	mov	ecx, DWORD PTR _lineno$[ebp]
	add	ecx, 320				; 00000140H
	cmp	DWORD PTR _i$[ebp], ecx
	jge	SHORT $L965
; Line 198
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
; Line 199
	jmp	SHORT $L964
$L965:
; Line 201
	push	620					; 0000026cH
	mov	eax, DWORD PTR _count1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 203
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L966
$L967:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L966:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _count1$[ebp]
	jge	$L968
; Line 205
	mov	eax, DWORD PTR _outptr1$[ebp]
	imul	eax, 24					; 00000018H
	mov	ecx, DWORD PTR ?base@WCirList@@0JA	; WCirList::base
	add	ecx, eax
	mov	DWORD PTR _tempCurrentRecord$[ebp], ecx
; Line 206
	mov	edx, DWORD PTR _tempCurrentRecord$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR _taskid$[ebp], eax
; Line 207
	mov	ecx, DWORD PTR _tempCurrentRecord$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR _statec$[ebp], edx
; Line 208
	mov	eax, DWORD PTR _j$[ebp]
	imul	eax, 320				; 00000140H
	mov	ecx, DWORD PTR _lineno$[ebp]
	add	ecx, eax
	mov	edx, DWORD PTR _k$[ebp]
	imul	edx, 20					; 00000014H
	add	ecx, edx
	push	ecx
	mov	eax, DWORD PTR _taskid$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 209
	mov	ecx, DWORD PTR _j$[ebp]
	imul	ecx, 320				; 00000140H
	mov	edx, DWORD PTR _lineno$[ebp]
	add	edx, ecx
	mov	eax, DWORD PTR _k$[ebp]
	imul	eax, 20					; 00000014H
	lea	ecx, DWORD PTR [edx+eax+160]
	push	ecx
	mov	edx, DWORD PTR _statec$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 210
	mov	eax, DWORD PTR _i$[ebp]
	cdq
	mov	ecx, 7
	idiv	ecx
	test	edx, edx
	jne	SHORT $L971
	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L971
; Line 212
	mov	DWORD PTR _k$[ebp], 0
; Line 213
	mov	edx, DWORD PTR _j$[ebp]
	add	edx, 1
	mov	DWORD PTR _j$[ebp], edx
$L971:
; Line 215
	mov	eax, DWORD PTR _k$[ebp]
	add	eax, 1
	mov	DWORD PTR _k$[ebp], eax
; Line 216
	mov	ecx, DWORD PTR _outptr1$[ebp]
	add	ecx, 1
	mov	DWORD PTR _outptr1$[ebp], ecx
; Line 217
	jmp	$L967
$L968:
; Line 218
	xor	eax, eax
; Line 219
	mov	esp, ebp
	pop	ebp
	ret	4
?printlist@WCirList@@QAEHH@Z ENDP			; WCirList::printlist
_TEXT	ENDS
END
