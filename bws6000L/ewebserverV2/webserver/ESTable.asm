	TITLE	ESTable.cpp
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
PUBLIC	?ESTableBase@ESTable@@0JA			; ESTable::ESTableBase
PUBLIC	?BufferBase@ESTable@@0JA			; ESTable::BufferBase
PUBLIC	?BufferSize@ESTable@@0JA			; ESTable::BufferSize
PUBLIC	?BufferRecordSize@ESTable@@0JA			; ESTable::BufferRecordSize
PUBLIC	?ESTableSize@ESTable@@0JA			; ESTable::ESTableSize
PUBLIC	?NoEsTableRecords@ESTable@@0HA			; ESTable::NoEsTableRecords
PUBLIC	?CurrentRecordNumber@ESTable@@0HA		; ESTable::CurrentRecordNumber
PUBLIC	?CurrentRecord@ESTable@@0PAUESRecord@1@A	; ESTable::CurrentRecord
_BSS	SEGMENT
?ESTableBase@ESTable@@0JA DD 01H DUP (?)		; ESTable::ESTableBase
?BufferBase@ESTable@@0JA DD 01H DUP (?)			; ESTable::BufferBase
?BufferSize@ESTable@@0JA DD 01H DUP (?)			; ESTable::BufferSize
?BufferRecordSize@ESTable@@0JA DD 01H DUP (?)		; ESTable::BufferRecordSize
?ESTableSize@ESTable@@0JA DD 01H DUP (?)		; ESTable::ESTableSize
?NoEsTableRecords@ESTable@@0HA DD 01H DUP (?)		; ESTable::NoEsTableRecords
?CurrentRecordNumber@ESTable@@0HA DD 01H DUP (?)	; ESTable::CurrentRecordNumber
?CurrentRecord@ESTable@@0PAUESRecord@1@A DD 01H DUP (?)	; ESTable::CurrentRecord
_BSS	ENDS
PUBLIC	?init@ESTable@@QAEHJJHHHHPAH@Z			; ESTable::init
_TEXT	SEGMENT
_ESBasePtr$ = 8
_BufferPtr$ = 12
_ESSizeVal$ = 16
_NoEsRecordsVal$ = 20
_BufferSizeVal$ = 24
_BufferRecordVal$ = 28
_ErrorDet$ = 32
_this$ = -20
_ESRecordPtr$ = -8
_ESTableBasePtr$ = -4
_BufferBasePtr$ = -16
_i$ = -12
?init@ESTable@@QAEHJJHHHHPAH@Z PROC NEAR		; ESTable::init
; File ESTable.cpp
; Line 42
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	mov	DWORD PTR _this$[ebp], ecx
; Line 43
	mov	eax, DWORD PTR _ESSizeVal$[ebp]
	xor	edx, edx
	mov	ecx, 20					; 00000014H
	div	ecx
	cmp	eax, DWORD PTR _NoEsRecordsVal$[ebp]
	jae	SHORT $L681
; Line 45
	mov	edx, DWORD PTR _NoEsRecordsVal$[ebp]
	imul	edx, 20					; 00000014H
	mov	eax, DWORD PTR _ErrorDet$[ebp]
	mov	DWORD PTR [eax], edx
; Line 46
	or	eax, -1
	jmp	$L679
$L681:
; Line 48
	mov	eax, DWORD PTR _BufferSizeVal$[ebp]
	cdq
	idiv	DWORD PTR _BufferRecordVal$[ebp]
	cmp	eax, DWORD PTR _NoEsRecordsVal$[ebp]
	jge	SHORT $L683
; Line 50
	mov	ecx, DWORD PTR _NoEsRecordsVal$[ebp]
	imul	ecx, 20					; 00000014H
	mov	edx, DWORD PTR _ErrorDet$[ebp]
	mov	DWORD PTR [edx], ecx
; Line 51
	mov	eax, -2					; fffffffeH
	jmp	$L679
$L683:
; Line 54
	mov	eax, DWORD PTR _ESBasePtr$[ebp]
	mov	DWORD PTR ?ESTableBase@ESTable@@0JA, eax ; ESTable::ESTableBase
; Line 55
	mov	ecx, DWORD PTR _BufferPtr$[ebp]
	mov	DWORD PTR ?BufferBase@ESTable@@0JA, ecx	; ESTable::BufferBase
; Line 56
	mov	edx, DWORD PTR _BufferSizeVal$[ebp]
	mov	DWORD PTR ?BufferSize@ESTable@@0JA, edx	; ESTable::BufferSize
; Line 57
	mov	eax, DWORD PTR _BufferRecordVal$[ebp]
	mov	DWORD PTR ?BufferRecordSize@ESTable@@0JA, eax ; ESTable::BufferRecordSize
; Line 58
	mov	ecx, DWORD PTR _ESSizeVal$[ebp]
	mov	DWORD PTR ?ESTableSize@ESTable@@0JA, ecx ; ESTable::ESTableSize
; Line 59
	mov	edx, DWORD PTR _NoEsRecordsVal$[ebp]
	mov	DWORD PTR ?NoEsTableRecords@ESTable@@0HA, edx ; ESTable::NoEsTableRecords
; Line 67
	mov	eax, DWORD PTR ?ESTableBase@ESTable@@0JA ; ESTable::ESTableBase
	mov	DWORD PTR _ESTableBasePtr$[ebp], eax
; Line 68
	mov	ecx, DWORD PTR ?BufferBase@ESTable@@0JA	; ESTable::BufferBase
	mov	DWORD PTR _BufferBasePtr$[ebp], ecx
; Line 69
	mov	edx, DWORD PTR ?ESTableBase@ESTable@@0JA ; ESTable::ESTableBase
	mov	DWORD PTR ?CurrentRecord@ESTable@@0PAUESRecord@1@A, edx ; ESTable::CurrentRecord
; Line 70
	mov	DWORD PTR ?CurrentRecordNumber@ESTable@@0HA, 0 ; ESTable::CurrentRecordNumber
; Line 72
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L690
$L691:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L690:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR ?NoEsTableRecords@ESTable@@0HA ; ESTable::NoEsTableRecords
	jge	SHORT $L692
; Line 74
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 20					; 00000014H
	mov	eax, DWORD PTR _ESTableBasePtr$[ebp]
	add	eax, edx
	mov	DWORD PTR _ESRecordPtr$[ebp], eax
; Line 75
	mov	ecx, DWORD PTR _ESRecordPtr$[ebp]
	mov	DWORD PTR [ecx], 0
; Line 76
	mov	edx, DWORD PTR _ESRecordPtr$[ebp]
	mov	DWORD PTR [edx+12], 0
; Line 77
	mov	eax, DWORD PTR _ESRecordPtr$[ebp]
	mov	DWORD PTR [eax+8], 0
; Line 78
	mov	ecx, DWORD PTR _ESRecordPtr$[ebp]
	mov	DWORD PTR [ecx+4], 0
; Line 79
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, DWORD PTR _BufferRecordVal$[ebp]
	mov	eax, DWORD PTR _BufferBasePtr$[ebp]
	add	eax, edx
	mov	ecx, DWORD PTR _ESRecordPtr$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 80
	jmp	SHORT $L691
$L692:
; Line 81
	mov	edx, DWORD PTR _ErrorDet$[ebp]
	mov	DWORD PTR [edx], 0
; Line 82
	xor	eax, eax
$L679:
; Line 83
	mov	esp, ebp
	pop	ebp
	ret	28					; 0000001cH
?init@ESTable@@QAEHJJHHHHPAH@Z ENDP			; ESTable::init
_TEXT	ENDS
PUBLIC	?insert@ESTable@@QAEHPADHHJ@Z			; ESTable::insert
EXTRN	?AOAPrintText@AOAProtected@@QAEXPADH@Z:NEAR	; AOAProtected::AOAPrintText
_DATA	SEGMENT
$SG703	DB	'estable.cpp: insert: RkSize is larger than BufferRecord '
	DB	'Size', 00H
	ORG $+3
$SG722	DB	'estable:insert: TempRecodNo is same as CurrentRecordNumb'
	DB	'er', 00H
	ORG $+1
$SG723	DB	'End of While Error', 00H
_DATA	ENDS
_TEXT	SEGMENT
_ETData$ = 8
_PkSize$ = 12
_Pktype$ = 16
_Time$ = 20
_this$ = -28
_tempCurrentRecord$ = -20
_temp$ = -12
_tempRecordNo$ = -16
_RecordFoundFlag$ = -4
_lockStatus$ = -8
_i$714 = -24
?insert@ESTable@@QAEHPADHHJ@Z PROC NEAR			; ESTable::insert
; Line 89
	push	ebp
	mov	ebp, esp
	sub	esp, 28					; 0000001cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 90
	mov	eax, DWORD PTR _PkSize$[ebp]
	cmp	eax, DWORD PTR ?BufferRecordSize@ESTable@@0JA ; ESTable::BufferRecordSize
	jle	SHORT $L702
; Line 92
	push	320					; 00000140H
	push	OFFSET FLAT:$SG703
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 93
	or	eax, -1
	jmp	$L701
$L702:
; Line 96
	mov	DWORD PTR _temp$[ebp], 0
; Line 97
	mov	ecx, DWORD PTR ?CurrentRecordNumber@ESTable@@0HA ; ESTable::CurrentRecordNumber
	mov	DWORD PTR _tempRecordNo$[ebp], ecx
; Line 98
	mov	edx, DWORD PTR ?CurrentRecord@ESTable@@0PAUESRecord@1@A ; ESTable::CurrentRecord
	mov	DWORD PTR _tempCurrentRecord$[ebp], edx
; Line 99
	mov	DWORD PTR _RecordFoundFlag$[ebp], 0
; Line 100
	mov	DWORD PTR _lockStatus$[ebp], 0
$L710:
; Line 102
	cmp	DWORD PTR _RecordFoundFlag$[ebp], 1
	je	$L711
; Line 105
	mov	eax, DWORD PTR _tempCurrentRecord$[ebp]
	cmp	DWORD PTR [eax], 0
	jne	SHORT $L712
; Line 107
	mov	ecx, DWORD PTR _tempCurrentRecord$[ebp]
	mov	DWORD PTR [ecx], 1
; Line 109
	mov	edx, DWORD PTR _tempCurrentRecord$[ebp]
	mov	eax, DWORD PTR _Time$[ebp]
	mov	DWORD PTR [edx+12], eax
; Line 110
	mov	ecx, DWORD PTR _tempCurrentRecord$[ebp]
	mov	edx, DWORD PTR _PkSize$[ebp]
	mov	DWORD PTR [ecx+8], edx
; Line 111
	mov	eax, DWORD PTR _tempCurrentRecord$[ebp]
	mov	ecx, DWORD PTR _Pktype$[ebp]
	mov	DWORD PTR [eax+4], ecx
; Line 112
	mov	edx, DWORD PTR _tempCurrentRecord$[ebp]
	mov	eax, DWORD PTR [edx+16]
	mov	DWORD PTR _temp$[ebp], eax
; Line 113
	mov	DWORD PTR _i$714[ebp], 0
	jmp	SHORT $L715
$L716:
	mov	ecx, DWORD PTR _i$714[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$714[ebp], ecx
$L715:
	mov	edx, DWORD PTR _i$714[ebp]
	cmp	edx, DWORD PTR _PkSize$[ebp]
	jge	SHORT $L717
; Line 115
	mov	eax, DWORD PTR _temp$[ebp]
	add	eax, DWORD PTR _i$714[ebp]
	mov	ecx, DWORD PTR _ETData$[ebp]
	add	ecx, DWORD PTR _i$714[ebp]
	mov	dl, BYTE PTR [ecx]
	mov	BYTE PTR [eax], dl
; Line 116
	jmp	SHORT $L716
$L717:
; Line 119
	mov	eax, DWORD PTR _tempRecordNo$[ebp]
	jmp	SHORT $L701
$L712:
; Line 124
	mov	eax, DWORD PTR _tempRecordNo$[ebp]
	add	eax, 1
	mov	DWORD PTR _tempRecordNo$[ebp], eax
; Line 125
	mov	ecx, DWORD PTR _tempCurrentRecord$[ebp]
	add	ecx, 20					; 00000014H
	mov	DWORD PTR _tempCurrentRecord$[ebp], ecx
; Line 126
	mov	edx, DWORD PTR _tempRecordNo$[ebp]
	cmp	edx, DWORD PTR ?NoEsTableRecords@ESTable@@0HA ; ESTable::NoEsTableRecords
	jl	SHORT $L719
; Line 128
	mov	DWORD PTR _tempRecordNo$[ebp], 0
; Line 129
	mov	eax, DWORD PTR ?ESTableBase@ESTable@@0JA ; ESTable::ESTableBase
	mov	DWORD PTR _tempCurrentRecord$[ebp], eax
$L719:
; Line 131
	mov	ecx, DWORD PTR _tempRecordNo$[ebp]
	cmp	ecx, DWORD PTR ?CurrentRecordNumber@ESTable@@0HA ; ESTable::CurrentRecordNumber
	jne	SHORT $L721
; Line 133
	mov	DWORD PTR _RecordFoundFlag$[ebp], 1
; Line 135
	push	320					; 00000140H
	push	OFFSET FLAT:$SG722
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 136
	mov	eax, -3					; fffffffdH
	jmp	SHORT $L701
$L721:
; Line 139
	jmp	$L710
$L711:
; Line 142
	push	320					; 00000140H
	push	OFFSET FLAT:$SG723
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 143
	mov	eax, -2					; fffffffeH
$L701:
; Line 144
	mov	esp, ebp
	pop	ebp
	ret	16					; 00000010H
?insert@ESTable@@QAEHPADHHJ@Z ENDP			; ESTable::insert
_TEXT	ENDS
PUBLIC	?get@ESTable@@QAEHPAJPAH10@Z			; ESTable::get
_DATA	SEGMENT
	ORG $+1
$SG741	DB	'estable:get: tempRecodNo is greater than no of records', 00H
	ORG $+1
$SG743	DB	'                                                      ', 00H
_DATA	ENDS
_TEXT	SEGMENT
_Data$ = 8
_PkSize$ = 12
_Pktype$ = 16
_Time$ = 20
_this$ = -20
_tempCurrentRecord$ = -16
_temp$ = -8
_tempRecordNo$ = -12
_RecordFoundFlag$ = -4
?get@ESTable@@QAEHPAJPAH10@Z PROC NEAR			; ESTable::get
; Line 150
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	mov	DWORD PTR _this$[ebp], ecx
; Line 153
	mov	DWORD PTR _temp$[ebp], 0
; Line 154
	mov	eax, DWORD PTR ?CurrentRecordNumber@ESTable@@0HA ; ESTable::CurrentRecordNumber
	mov	DWORD PTR _tempRecordNo$[ebp], eax
; Line 155
	mov	ecx, DWORD PTR ?CurrentRecord@ESTable@@0PAUESRecord@1@A ; ESTable::CurrentRecord
	mov	DWORD PTR _tempCurrentRecord$[ebp], ecx
; Line 156
	mov	DWORD PTR _RecordFoundFlag$[ebp], 0
$L736:
; Line 157
	cmp	DWORD PTR _RecordFoundFlag$[ebp], 1
	je	$L737
; Line 160
	mov	edx, DWORD PTR _tempCurrentRecord$[ebp]
	cmp	DWORD PTR [edx], 1
	jne	$L738
; Line 162
	mov	eax, DWORD PTR _tempCurrentRecord$[ebp]
	mov	DWORD PTR [eax], 2
; Line 166
	mov	ecx, DWORD PTR _Time$[ebp]
	mov	edx, DWORD PTR _tempCurrentRecord$[ebp]
	mov	eax, DWORD PTR [edx+12]
	mov	DWORD PTR [ecx], eax
; Line 167
	mov	ecx, DWORD PTR _PkSize$[ebp]
	mov	edx, DWORD PTR _tempCurrentRecord$[ebp]
	mov	eax, DWORD PTR [edx+8]
	mov	DWORD PTR [ecx], eax
; Line 168
	mov	ecx, DWORD PTR _Pktype$[ebp]
	mov	edx, DWORD PTR _tempCurrentRecord$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR [ecx], eax
; Line 169
	mov	ecx, DWORD PTR _Data$[ebp]
	mov	edx, DWORD PTR _tempCurrentRecord$[ebp]
	mov	eax, DWORD PTR [edx+16]
	mov	DWORD PTR [ecx], eax
; Line 170
	mov	ecx, DWORD PTR _tempRecordNo$[ebp]
	add	ecx, 1
	mov	DWORD PTR _tempRecordNo$[ebp], ecx
	mov	edx, DWORD PTR _tempRecordNo$[ebp]
	mov	DWORD PTR ?CurrentRecordNumber@ESTable@@0HA, edx ; ESTable::CurrentRecordNumber
; Line 171
	mov	eax, DWORD PTR _tempRecordNo$[ebp]
	cmp	eax, DWORD PTR ?NoEsTableRecords@ESTable@@0HA ; ESTable::NoEsTableRecords
	jl	SHORT $L739
; Line 173
	mov	DWORD PTR ?CurrentRecordNumber@ESTable@@0HA, 0 ; ESTable::CurrentRecordNumber
; Line 174
	mov	ecx, DWORD PTR ?ESTableBase@ESTable@@0JA ; ESTable::ESTableBase
	mov	DWORD PTR ?CurrentRecord@ESTable@@0PAUESRecord@1@A, ecx ; ESTable::CurrentRecord
; Line 175
	push	160					; 000000a0H
	push	OFFSET FLAT:$SG741
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 176
	mov	eax, DWORD PTR ?NoEsTableRecords@ESTable@@0HA ; ESTable::NoEsTableRecords
	sub	eax, 1
	jmp	SHORT $L730
$L739:
; Line 178
	mov	edx, DWORD PTR _tempCurrentRecord$[ebp]
	add	edx, 20					; 00000014H
	mov	DWORD PTR _tempCurrentRecord$[ebp], edx
	mov	eax, DWORD PTR _tempCurrentRecord$[ebp]
	mov	DWORD PTR ?CurrentRecord@ESTable@@0PAUESRecord@1@A, eax ; ESTable::CurrentRecord
; Line 179
	push	160					; 000000a0H
	push	OFFSET FLAT:$SG743
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 181
	mov	eax, DWORD PTR _tempRecordNo$[ebp]
	sub	eax, 1
	jmp	SHORT $L730
$L738:
; Line 186
	mov	ecx, DWORD PTR _tempRecordNo$[ebp]
	add	ecx, 1
	mov	DWORD PTR _tempRecordNo$[ebp], ecx
; Line 187
	mov	edx, DWORD PTR _tempCurrentRecord$[ebp]
	add	edx, 20					; 00000014H
	mov	DWORD PTR _tempCurrentRecord$[ebp], edx
; Line 188
	mov	eax, DWORD PTR _tempRecordNo$[ebp]
	cmp	eax, DWORD PTR ?NoEsTableRecords@ESTable@@0HA ; ESTable::NoEsTableRecords
	jl	SHORT $L745
; Line 190
	mov	DWORD PTR _tempRecordNo$[ebp], 0
; Line 191
	mov	ecx, DWORD PTR ?ESTableBase@ESTable@@0JA ; ESTable::ESTableBase
	mov	DWORD PTR _tempCurrentRecord$[ebp], ecx
$L745:
; Line 193
	mov	edx, DWORD PTR _tempRecordNo$[ebp]
	cmp	edx, DWORD PTR ?CurrentRecordNumber@ESTable@@0HA ; ESTable::CurrentRecordNumber
	jne	SHORT $L747
; Line 195
	mov	DWORD PTR _RecordFoundFlag$[ebp], 1
; Line 196
	mov	eax, -2					; fffffffeH
	jmp	SHORT $L730
$L747:
; Line 200
	jmp	$L736
$L737:
; Line 201
	mov	eax, -2					; fffffffeH
$L730:
; Line 203
	mov	esp, ebp
	pop	ebp
	ret	16					; 00000010H
?get@ESTable@@QAEHPAJPAH10@Z ENDP			; ESTable::get
_TEXT	ENDS
PUBLIC	?remove@ESTable@@QAEHH@Z			; ESTable::remove
_TEXT	SEGMENT
_RecordNumber$ = 8
_this$ = -8
_ptr$ = -4
?remove@ESTable@@QAEHH@Z PROC NEAR			; ESTable::remove
; Line 208
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 210
	mov	eax, DWORD PTR _RecordNumber$[ebp]
	imul	eax, 20					; 00000014H
	mov	ecx, DWORD PTR ?ESTableBase@ESTable@@0JA ; ESTable::ESTableBase
	add	ecx, eax
	mov	DWORD PTR _ptr$[ebp], ecx
; Line 211
	mov	edx, DWORD PTR _ptr$[ebp]
	mov	DWORD PTR [edx], 0
; Line 212
	xor	eax, eax
; Line 213
	mov	esp, ebp
	pop	ebp
	ret	4
?remove@ESTable@@QAEHH@Z ENDP				; ESTable::remove
_TEXT	ENDS
END
