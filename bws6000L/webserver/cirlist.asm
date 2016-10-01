	TITLE	cirlist.cpp
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
PUBLIC	?base@CirList@@0JA				; CirList::base
PUBLIC	?size@CirList@@0JA				; CirList::size
PUBLIC	?InPtr@CirList@@0JA				; CirList::InPtr
PUBLIC	?OutPtr@CirList@@0JA				; CirList::OutPtr
PUBLIC	?InRecord@CirList@@2PAUESRecord@1@A		; CirList::InRecord
PUBLIC	?OutRecord@CirList@@2PAUESRecord@1@A		; CirList::OutRecord
_BSS	SEGMENT
?base@CirList@@0JA DD 01H DUP (?)			; CirList::base
?size@CirList@@0JA DD 01H DUP (?)			; CirList::size
?InPtr@CirList@@0JA DD 01H DUP (?)			; CirList::InPtr
?OutPtr@CirList@@0JA DD 01H DUP (?)			; CirList::OutPtr
?InRecord@CirList@@2PAUESRecord@1@A DD 01H DUP (?)	; CirList::InRecord
?OutRecord@CirList@@2PAUESRecord@1@A DD 01H DUP (?)	; CirList::OutRecord
_BSS	ENDS
PUBLIC	?init@CirList@@QAEHJH@Z				; CirList::init
EXTRN	?AOAgetTimer@AOAProtected@@QAEJXZ:NEAR		; AOAProtected::AOAgetTimer
_TEXT	SEGMENT
_inpbase$ = 8
_inpsize$ = 12
_this$ = -12
_ESRecordPtr$ = -4
_i$ = -8
?init@CirList@@QAEHJH@Z PROC NEAR			; CirList::init
; File cirlist.cpp
; Line 23
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 24
	mov	DWORD PTR ?InPtr@CirList@@0JA, 0	; CirList::InPtr
; Line 25
	mov	DWORD PTR ?OutPtr@CirList@@0JA, 0	; CirList::OutPtr
; Line 27
	mov	eax, DWORD PTR _inpbase$[ebp]
	mov	DWORD PTR ?base@CirList@@0JA, eax	; CirList::base
; Line 28
	mov	ecx, DWORD PTR _inpsize$[ebp]
	mov	DWORD PTR ?size@CirList@@0JA, ecx	; CirList::size
; Line 34
	mov	edx, DWORD PTR ?base@CirList@@0JA	; CirList::base
	mov	DWORD PTR ?InRecord@CirList@@2PAUESRecord@1@A, edx ; CirList::InRecord
; Line 35
	mov	eax, DWORD PTR ?base@CirList@@0JA	; CirList::base
	mov	DWORD PTR ?OutRecord@CirList@@2PAUESRecord@1@A, eax ; CirList::OutRecord
; Line 40
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L686
$L687:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L686:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR ?size@CirList@@0JA	; CirList::size
	jge	SHORT $L688
; Line 42
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 4
	mov	ecx, DWORD PTR ?base@CirList@@0JA	; CirList::base
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
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	mov	edx, DWORD PTR _ESRecordPtr$[ebp]
	mov	DWORD PTR [edx+12], eax
; Line 47
	jmp	SHORT $L687
$L688:
; Line 48
	xor	eax, eax
; Line 49
	mov	esp, ebp
	pop	ebp
	ret	8
?init@CirList@@QAEHJH@Z ENDP				; CirList::init
_TEXT	ENDS
PUBLIC	?insert@CirList@@QAEHHHJ@Z			; CirList::insert
EXTRN	?AOAprintHex@AOAProtected@@QAEHJH@Z:NEAR	; AOAProtected::AOAprintHex
EXTRN	?AOAPrintText@AOAProtected@@QAEXPADH@Z:NEAR	; AOAProtected::AOAPrintText
_DATA	SEGMENT
$SG706	DB	'ERROR:Cirlist:Insert: Valit Bit is Set:', 00H
_DATA	ENDS
_TEXT	SEGMENT
_id$ = 8
_delay1$ = 12
_timer1$ = 16
_this$ = -20
_t1$ = -8
_t2$ = -12
_tempCurrentRecord$ = -16
_ESRecordPtr$ = -4
?insert@CirList@@QAEHHHJ@Z PROC NEAR			; CirList::insert
; Line 58
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	mov	DWORD PTR _this$[ebp], ecx
; Line 61
	mov	DWORD PTR _t1$[ebp], 0
; Line 62
	mov	DWORD PTR _t2$[ebp], 0
; Line 66
	mov	eax, DWORD PTR ?InRecord@CirList@@2PAUESRecord@1@A ; CirList::InRecord
	mov	DWORD PTR _tempCurrentRecord$[ebp], eax
; Line 68
	mov	ecx, DWORD PTR _tempCurrentRecord$[ebp]
	cmp	DWORD PTR [ecx], 0
	jne	SHORT $L701
; Line 70
	mov	edx, DWORD PTR _tempCurrentRecord$[ebp]
	mov	DWORD PTR [edx], 1
; Line 71
	mov	eax, DWORD PTR _tempCurrentRecord$[ebp]
	mov	ecx, DWORD PTR _timer1$[ebp]
	mov	DWORD PTR [eax+12], ecx
; Line 72
	mov	edx, DWORD PTR _tempCurrentRecord$[ebp]
	mov	eax, DWORD PTR _id$[ebp]
	mov	DWORD PTR [edx+4], eax
; Line 73
	mov	ecx, DWORD PTR _tempCurrentRecord$[ebp]
	mov	edx, DWORD PTR _delay1$[ebp]
	mov	DWORD PTR [ecx+8], edx
; Line 75
	mov	eax, DWORD PTR ?InPtr@CirList@@0JA	; CirList::InPtr
	add	eax, 1
	mov	DWORD PTR ?InPtr@CirList@@0JA, eax	; CirList::InPtr
; Line 76
	mov	ecx, DWORD PTR ?InPtr@CirList@@0JA	; CirList::InPtr
	cmp	ecx, DWORD PTR ?size@CirList@@0JA	; CirList::size
	jl	SHORT $L702
; Line 78
	mov	DWORD PTR ?InPtr@CirList@@0JA, 0	; CirList::InPtr
$L702:
; Line 81
	mov	edx, DWORD PTR ?InPtr@CirList@@0JA	; CirList::InPtr
	shl	edx, 4
	mov	eax, DWORD PTR ?base@CirList@@0JA	; CirList::base
	add	eax, edx
	mov	DWORD PTR _ESRecordPtr$[ebp], eax
; Line 83
	mov	ecx, DWORD PTR _ESRecordPtr$[ebp]
	mov	DWORD PTR ?InRecord@CirList@@2PAUESRecord@1@A, ecx ; CirList::InRecord
; Line 86
	jmp	SHORT $L705
$L701:
; Line 88
	push	3520					; 00000dc0H
	push	OFFSET FLAT:$SG706
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 89
	push	3740					; 00000e9cH
	mov	edx, DWORD PTR _tempCurrentRecord$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 90
	push	3760					; 00000eb0H
	mov	eax, DWORD PTR _tempCurrentRecord$[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 91
	push	3940					; 00000f64H
	mov	edx, DWORD PTR ?InPtr@CirList@@0JA	; CirList::InPtr
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 92
	push	3960					; 00000f78H
	mov	eax, DWORD PTR ?OutPtr@CirList@@0JA	; CirList::OutPtr
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 93
	or	eax, -1
	jmp	SHORT $L696
$L705:
; Line 96
	xor	eax, eax
$L696:
; Line 97
	mov	esp, ebp
	pop	ebp
	ret	12					; 0000000cH
?insert@CirList@@QAEHHHJ@Z ENDP				; CirList::insert
_TEXT	ENDS
PUBLIC	?get@CirList@@QAEHPAH0PAJ@Z			; CirList::get
_DATA	SEGMENT
$SG721	DB	'ERROR:Cirlist:get: Valit Bit is reset:', 00H
_DATA	ENDS
_TEXT	SEGMENT
_taskid$ = 8
_delayc$ = 12
_timerc$ = 16
_this$ = -12
_tempCurrentRecord$ = -8
_ESRecordPtr$ = -4
?get@CirList@@QAEHPAH0PAJ@Z PROC NEAR			; CirList::get
; Line 105
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 109
	mov	eax, DWORD PTR ?OutRecord@CirList@@2PAUESRecord@1@A ; CirList::OutRecord
	mov	DWORD PTR _tempCurrentRecord$[ebp], eax
; Line 111
	mov	ecx, DWORD PTR _tempCurrentRecord$[ebp]
	cmp	DWORD PTR [ecx], 1
	jne	SHORT $L716
; Line 113
	mov	edx, DWORD PTR _tempCurrentRecord$[ebp]
	mov	DWORD PTR [edx], 0
; Line 114
	mov	eax, DWORD PTR _timerc$[ebp]
	mov	ecx, DWORD PTR _tempCurrentRecord$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [eax], edx
; Line 115
	mov	eax, DWORD PTR _taskid$[ebp]
	mov	ecx, DWORD PTR _tempCurrentRecord$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR [eax], edx
; Line 116
	mov	eax, DWORD PTR _delayc$[ebp]
	mov	ecx, DWORD PTR _tempCurrentRecord$[ebp]
	mov	edx, DWORD PTR [ecx+8]
	mov	DWORD PTR [eax], edx
; Line 118
	mov	eax, DWORD PTR ?OutPtr@CirList@@0JA	; CirList::OutPtr
	add	eax, 1
	mov	DWORD PTR ?OutPtr@CirList@@0JA, eax	; CirList::OutPtr
; Line 119
	mov	ecx, DWORD PTR ?OutPtr@CirList@@0JA	; CirList::OutPtr
	cmp	ecx, DWORD PTR ?size@CirList@@0JA	; CirList::size
	jl	SHORT $L717
; Line 121
	mov	DWORD PTR ?OutPtr@CirList@@0JA, 0	; CirList::OutPtr
$L717:
; Line 124
	mov	edx, DWORD PTR ?OutPtr@CirList@@0JA	; CirList::OutPtr
	shl	edx, 4
	mov	eax, DWORD PTR ?base@CirList@@0JA	; CirList::base
	add	eax, edx
	mov	DWORD PTR _ESRecordPtr$[ebp], eax
; Line 125
	mov	ecx, DWORD PTR _ESRecordPtr$[ebp]
	mov	DWORD PTR ?OutRecord@CirList@@2PAUESRecord@1@A, ecx ; CirList::OutRecord
; Line 128
	jmp	SHORT $L720
$L716:
; Line 130
	push	3520					; 00000dc0H
	push	OFFSET FLAT:$SG721
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 131
	push	3740					; 00000e9cH
	mov	edx, DWORD PTR _tempCurrentRecord$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 132
	push	3760					; 00000eb0H
	mov	eax, DWORD PTR _tempCurrentRecord$[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 133
	push	3940					; 00000f64H
	mov	edx, DWORD PTR ?InPtr@CirList@@0JA	; CirList::InPtr
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 134
	push	3960					; 00000f78H
	mov	eax, DWORD PTR ?OutPtr@CirList@@0JA	; CirList::OutPtr
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 135
	or	eax, -1
	jmp	SHORT $L713
$L720:
; Line 139
	xor	eax, eax
$L713:
; Line 140
	mov	esp, ebp
	pop	ebp
	ret	12					; 0000000cH
?get@CirList@@QAEHPAH0PAJ@Z ENDP			; CirList::get
_TEXT	ENDS
PUBLIC	?empty@CirList@@QAEHXZ				; CirList::empty
_TEXT	SEGMENT
_this$ = -8
_retcode$ = -4
?empty@CirList@@QAEHXZ PROC NEAR			; CirList::empty
; Line 145
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 146
	mov	DWORD PTR _retcode$[ebp], 0
; Line 148
	mov	eax, DWORD PTR ?InPtr@CirList@@0JA	; CirList::InPtr
	cmp	eax, DWORD PTR ?OutPtr@CirList@@0JA	; CirList::OutPtr
	jne	SHORT $L727
; Line 149
	mov	DWORD PTR _retcode$[ebp], 1
; Line 150
	jmp	SHORT $L728
$L727:
	mov	DWORD PTR _retcode$[ebp], 0
$L728:
; Line 152
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 153
	mov	esp, ebp
	pop	ebp
	ret	0
?empty@CirList@@QAEHXZ ENDP				; CirList::empty
_TEXT	ENDS
PUBLIC	?full@CirList@@QAEHXZ				; CirList::full
_TEXT	SEGMENT
_this$ = -8
_retcode$ = -4
?full@CirList@@QAEHXZ PROC NEAR				; CirList::full
; Line 158
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 159
	mov	DWORD PTR _retcode$[ebp], 0
; Line 161
	mov	eax, DWORD PTR ?InPtr@CirList@@0JA	; CirList::InPtr
	add	eax, 1
	cdq
	idiv	DWORD PTR ?size@CirList@@0JA		; CirList::size
	cmp	edx, DWORD PTR ?OutPtr@CirList@@0JA	; CirList::OutPtr
	jne	SHORT $L733
; Line 162
	mov	DWORD PTR _retcode$[ebp], 1
; Line 163
	jmp	SHORT $L734
$L733:
	mov	DWORD PTR _retcode$[ebp], 0
$L734:
; Line 165
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 166
	mov	esp, ebp
	pop	ebp
	ret	0
?full@CirList@@QAEHXZ ENDP				; CirList::full
_TEXT	ENDS
PUBLIC	?getCount@CirList@@QAEHXZ			; CirList::getCount
_TEXT	SEGMENT
_this$ = -4
?getCount@CirList@@QAEHXZ PROC NEAR			; CirList::getCount
; Line 172
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 173
	mov	eax, DWORD PTR ?InPtr@CirList@@0JA	; CirList::InPtr
	cmp	eax, DWORD PTR ?OutPtr@CirList@@0JA	; CirList::OutPtr
	jl	SHORT $L738
; Line 174
	mov	eax, DWORD PTR ?InPtr@CirList@@0JA	; CirList::InPtr
	sub	eax, DWORD PTR ?OutPtr@CirList@@0JA	; CirList::OutPtr
	jmp	SHORT $L739
$L738:
; Line 176
	mov	ecx, DWORD PTR ?OutPtr@CirList@@0JA	; CirList::OutPtr
	sub	ecx, DWORD PTR ?InPtr@CirList@@0JA	; CirList::InPtr
	mov	eax, DWORD PTR ?size@CirList@@0JA	; CirList::size
	sub	eax, ecx
$L739:
; Line 177
	mov	esp, ebp
	pop	ebp
	ret	0
?getCount@CirList@@QAEHXZ ENDP				; CirList::getCount
_TEXT	ENDS
END
