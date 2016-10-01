	TITLE	httplist.cpp
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
;	COMDAT ??0WList@@QAE@XZ
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
FLAT	GROUP _DATA, CONST, _BSS
	ASSUME	CS: FLAT, DS: FLAT, SS: FLAT
endif
PUBLIC	?HTTPTableBase@HTTPList@@0JA			; HTTPList::HTTPTableBase
PUBLIC	?HTTPBufferBase@HTTPList@@0JA			; HTTPList::HTTPBufferBase
PUBLIC	?HTTPBufferSize@HTTPList@@0JA			; HTTPList::HTTPBufferSize
PUBLIC	?HTTPBufferRecordSize@HTTPList@@0JA		; HTTPList::HTTPBufferRecordSize
PUBLIC	?HTTPTableSize@HTTPList@@0JA			; HTTPList::HTTPTableSize
PUBLIC	?HTTPInPtr@HTTPList@@0HA			; HTTPList::HTTPInPtr
PUBLIC	?HTTPOutPtr@HTTPList@@0HA			; HTTPList::HTTPOutPtr
PUBLIC	?HTTPSize@HTTPList@@0HA				; HTTPList::HTTPSize
PUBLIC	?HTTPInRecord@HTTPList@@0PAUHTTPRecord@1@A	; HTTPList::HTTPInRecord
PUBLIC	?HTTPOutRecord@HTTPList@@0PAUHTTPRecord@1@A	; HTTPList::HTTPOutRecord
PUBLIC	?HTTPInCount@HTTPList@@2JA			; HTTPList::HTTPInCount
PUBLIC	?HTTPInCountStored@HTTPList@@2JA		; HTTPList::HTTPInCountStored
PUBLIC	?HTTPOutCount@HTTPList@@2JA			; HTTPList::HTTPOutCount
_BSS	SEGMENT
?HTTPTableBase@HTTPList@@0JA DD 01H DUP (?)		; HTTPList::HTTPTableBase
?HTTPBufferBase@HTTPList@@0JA DD 01H DUP (?)		; HTTPList::HTTPBufferBase
?HTTPBufferSize@HTTPList@@0JA DD 01H DUP (?)		; HTTPList::HTTPBufferSize
?HTTPBufferRecordSize@HTTPList@@0JA DD 01H DUP (?)	; HTTPList::HTTPBufferRecordSize
?HTTPTableSize@HTTPList@@0JA DD 01H DUP (?)		; HTTPList::HTTPTableSize
?HTTPInPtr@HTTPList@@0HA DD 01H DUP (?)			; HTTPList::HTTPInPtr
?HTTPOutPtr@HTTPList@@0HA DD 01H DUP (?)		; HTTPList::HTTPOutPtr
?HTTPSize@HTTPList@@0HA DD 01H DUP (?)			; HTTPList::HTTPSize
?HTTPInRecord@HTTPList@@0PAUHTTPRecord@1@A DD 01H DUP (?) ; HTTPList::HTTPInRecord
?HTTPOutRecord@HTTPList@@0PAUHTTPRecord@1@A DD 01H DUP (?) ; HTTPList::HTTPOutRecord
?HTTPInCount@HTTPList@@2JA DD 01H DUP (?)		; HTTPList::HTTPInCount
?HTTPInCountStored@HTTPList@@2JA DD 01H DUP (?)		; HTTPList::HTTPInCountStored
?HTTPOutCount@HTTPList@@2JA DD 01H DUP (?)		; HTTPList::HTTPOutCount
_BSS	ENDS
PUBLIC	?init@HTTPList@@QAEHJJHHHHPAH@Z			; HTTPList::init
EXTRN	?AOAPrintText@AOAProtected@@QAEXPADH@Z:NEAR	; AOAProtected::AOAPrintText
_DATA	SEGMENT
$SG2205	DB	'HTTPList:init:1 Insufficient space for allocating http r'
	DB	'ecords', 00H
	ORG $+1
$SG2208	DB	'HTTPList:init:1 Insufficient space for allocating http r'
	DB	'ecord buffers', 00H
_DATA	ENDS
_TEXT	SEGMENT
_HTTPBasePtr$ = 8
_HTTPBufferPtr$ = 12
_HTTPSizeVal$ = 16
_NoHTTPRecordsVal$ = 20
_HTTPBufferSizeVal$ = 24
_HTTPBufferRecordVal$ = 28
_ErrorDet$ = 32
_this$ = -20
_HTTPRecordPtr$ = -12
_HTTPTableBasePtr$ = -8
_HTTPBufferBasePtr$ = -4
_i$ = -16
?init@HTTPList@@QAEHJJHHHHPAH@Z PROC NEAR		; HTTPList::init
; File httplist.cpp
; Line 48
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	mov	DWORD PTR _this$[ebp], ecx
; Line 49
	mov	eax, DWORD PTR _HTTPSizeVal$[ebp]
	xor	edx, edx
	mov	ecx, 24					; 00000018H
	div	ecx
	cmp	eax, DWORD PTR _NoHTTPRecordsVal$[ebp]
	jae	SHORT $L2203
; Line 51
	mov	edx, DWORD PTR _NoHTTPRecordsVal$[ebp]
	imul	edx, 24					; 00000018H
	mov	eax, DWORD PTR _ErrorDet$[ebp]
	mov	DWORD PTR [eax], edx
; Line 52
	push	3840					; 00000f00H
	push	OFFSET FLAT:$SG2205
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 53
	or	eax, -1
	jmp	$L2201
$L2203:
; Line 55
	mov	eax, DWORD PTR _HTTPBufferSizeVal$[ebp]
	cdq
	idiv	DWORD PTR _HTTPBufferRecordVal$[ebp]
	cmp	eax, DWORD PTR _NoHTTPRecordsVal$[ebp]
	jge	SHORT $L2206
; Line 57
	mov	ecx, DWORD PTR _NoHTTPRecordsVal$[ebp]
	imul	ecx, 24					; 00000018H
	mov	edx, DWORD PTR _ErrorDet$[ebp]
	mov	DWORD PTR [edx], ecx
; Line 58
	push	3840					; 00000f00H
	push	OFFSET FLAT:$SG2208
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 59
	mov	eax, -2					; fffffffeH
	jmp	$L2201
$L2206:
; Line 62
	mov	eax, DWORD PTR _HTTPBasePtr$[ebp]
	mov	DWORD PTR ?HTTPTableBase@HTTPList@@0JA, eax ; HTTPList::HTTPTableBase
; Line 63
	mov	ecx, DWORD PTR _HTTPBufferPtr$[ebp]
	mov	DWORD PTR ?HTTPBufferBase@HTTPList@@0JA, ecx ; HTTPList::HTTPBufferBase
; Line 64
	mov	edx, DWORD PTR _HTTPSizeVal$[ebp]
	mov	DWORD PTR ?HTTPTableSize@HTTPList@@0JA, edx ; HTTPList::HTTPTableSize
; Line 65
	mov	eax, DWORD PTR _NoHTTPRecordsVal$[ebp]
	mov	DWORD PTR ?HTTPSize@HTTPList@@0HA, eax	; HTTPList::HTTPSize
; Line 66
	mov	ecx, DWORD PTR _HTTPBufferSizeVal$[ebp]
	mov	DWORD PTR ?HTTPBufferSize@HTTPList@@0JA, ecx ; HTTPList::HTTPBufferSize
; Line 67
	mov	edx, DWORD PTR _HTTPBufferRecordVal$[ebp]
	mov	DWORD PTR ?HTTPBufferRecordSize@HTTPList@@0JA, edx ; HTTPList::HTTPBufferRecordSize
; Line 73
	mov	eax, DWORD PTR ?HTTPTableBase@HTTPList@@0JA ; HTTPList::HTTPTableBase
	mov	DWORD PTR _HTTPTableBasePtr$[ebp], eax
; Line 74
	mov	ecx, DWORD PTR ?HTTPBufferBase@HTTPList@@0JA ; HTTPList::HTTPBufferBase
	mov	DWORD PTR _HTTPBufferBasePtr$[ebp], ecx
; Line 79
	mov	edx, DWORD PTR _HTTPTableBasePtr$[ebp]
	mov	DWORD PTR ?HTTPInRecord@HTTPList@@0PAUHTTPRecord@1@A, edx ; HTTPList::HTTPInRecord
; Line 80
	mov	eax, DWORD PTR _HTTPTableBasePtr$[ebp]
	mov	DWORD PTR ?HTTPOutRecord@HTTPList@@0PAUHTTPRecord@1@A, eax ; HTTPList::HTTPOutRecord
; Line 85
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L2215
$L2216:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L2215:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR ?HTTPSize@HTTPList@@0HA	; HTTPList::HTTPSize
	jge	SHORT $L2217
; Line 87
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 24					; 00000018H
	mov	ecx, DWORD PTR _HTTPTableBasePtr$[ebp]
	add	ecx, eax
	mov	DWORD PTR _HTTPRecordPtr$[ebp], ecx
; Line 88
	mov	edx, DWORD PTR _HTTPRecordPtr$[ebp]
	mov	DWORD PTR [edx], 0
; Line 89
	mov	eax, DWORD PTR _HTTPRecordPtr$[ebp]
	mov	DWORD PTR [eax+4], 0
; Line 90
	mov	ecx, DWORD PTR _HTTPRecordPtr$[ebp]
	mov	DWORD PTR [ecx+16], 0
; Line 91
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, DWORD PTR _HTTPBufferRecordVal$[ebp]
	mov	eax, DWORD PTR _HTTPBufferBasePtr$[ebp]
	add	eax, edx
	mov	ecx, DWORD PTR _HTTPRecordPtr$[ebp]
	mov	DWORD PTR [ecx+20], eax
; Line 92
	jmp	SHORT $L2216
$L2217:
; Line 93
	mov	DWORD PTR ?HTTPInCount@HTTPList@@2JA, 0	; HTTPList::HTTPInCount
; Line 94
	mov	DWORD PTR ?HTTPOutCount@HTTPList@@2JA, 0 ; HTTPList::HTTPOutCount
; Line 95
	mov	DWORD PTR ?HTTPInCountStored@HTTPList@@2JA, 0 ; HTTPList::HTTPInCountStored
; Line 96
	mov	edx, DWORD PTR _ErrorDet$[ebp]
	mov	DWORD PTR [edx], 0
; Line 97
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+8], 0
; Line 109
	xor	eax, eax
$L2201:
; Line 110
	mov	esp, ebp
	pop	ebp
	ret	28					; 0000001cH
?init@HTTPList@@QAEHJJHHHHPAH@Z ENDP			; HTTPList::init
_TEXT	ENDS
PUBLIC	?insert@HTTPList@@QAEHPADHH00@Z			; HTTPList::insert
PUBLIC	?full@HTTPList@@QAEHXZ				; HTTPList::full
EXTRN	??0AOAProtected@@QAE@XZ:NEAR			; AOAProtected::AOAProtected
_TEXT	SEGMENT
_HTTPData$ = 8
_PkSize$ = 12
_SocketID$ = 16
_ip$ = 20
_port$ = 24
_this$ = -32
_io$ = -20
_tempCurrentRecord$ = -24
_HTTPRecordPtr$ = -8
_temp$ = -12
_retcode$ = -4
_i$2237 = -28
?insert@HTTPList@@QAEHPADHH00@Z PROC NEAR		; HTTPList::insert
; Line 120
	push	ebp
	mov	ebp, esp
	sub	esp, 32					; 00000020H
	mov	DWORD PTR _this$[ebp], ecx
; Line 121
	lea	ecx, DWORD PTR _io$[ebp]
	call	??0AOAProtected@@QAE@XZ			; AOAProtected::AOAProtected
; Line 126
	mov	DWORD PTR _retcode$[ebp], 0
; Line 128
	mov	eax, DWORD PTR ?HTTPInRecord@HTTPList@@0PAUHTTPRecord@1@A ; HTTPList::HTTPInRecord
	mov	DWORD PTR _tempCurrentRecord$[ebp], eax
; Line 130
	mov	ecx, DWORD PTR _PkSize$[ebp]
	cmp	ecx, DWORD PTR ?HTTPBufferRecordSize@HTTPList@@0JA ; HTTPList::HTTPBufferRecordSize
	jle	SHORT $L2233
; Line 133
	mov	eax, -28				; ffffffe4H
	jmp	$L2227
$L2233:
; Line 136
	mov	ecx, DWORD PTR _this$[ebp]
	call	?full@HTTPList@@QAEHXZ			; HTTPList::full
	cmp	eax, 1
	jne	SHORT $L2234
; Line 139
	mov	eax, -29				; ffffffe3H
	jmp	$L2227
$L2234:
; Line 141
	mov	edx, DWORD PTR _tempCurrentRecord$[ebp]
	cmp	DWORD PTR [edx], 0
	jne	$L2235
; Line 143
	mov	eax, DWORD PTR _tempCurrentRecord$[ebp]
	mov	DWORD PTR [eax], 1
; Line 144
	mov	ecx, DWORD PTR _tempCurrentRecord$[ebp]
	mov	edx, DWORD PTR _SocketID$[ebp]
	mov	DWORD PTR [ecx+4], edx
; Line 145
	mov	eax, DWORD PTR _tempCurrentRecord$[ebp]
	mov	ecx, DWORD PTR _ip$[ebp]
	mov	dl, BYTE PTR [ecx]
	mov	BYTE PTR [eax+8], dl
; Line 146
	mov	eax, DWORD PTR _tempCurrentRecord$[ebp]
	mov	ecx, DWORD PTR _ip$[ebp]
	mov	dl, BYTE PTR [ecx+1]
	mov	BYTE PTR [eax+9], dl
; Line 147
	mov	eax, DWORD PTR _tempCurrentRecord$[ebp]
	mov	ecx, DWORD PTR _ip$[ebp]
	mov	dl, BYTE PTR [ecx+2]
	mov	BYTE PTR [eax+10], dl
; Line 148
	mov	eax, DWORD PTR _tempCurrentRecord$[ebp]
	mov	ecx, DWORD PTR _ip$[ebp]
	mov	dl, BYTE PTR [ecx+3]
	mov	BYTE PTR [eax+11], dl
; Line 149
	mov	eax, DWORD PTR _tempCurrentRecord$[ebp]
	mov	ecx, DWORD PTR _port$[ebp]
	mov	dl, BYTE PTR [ecx]
	mov	BYTE PTR [eax+12], dl
; Line 150
	mov	eax, DWORD PTR _tempCurrentRecord$[ebp]
	mov	ecx, DWORD PTR _port$[ebp]
	mov	dl, BYTE PTR [ecx+1]
	mov	BYTE PTR [eax+13], dl
; Line 151
	mov	eax, DWORD PTR _tempCurrentRecord$[ebp]
	mov	ecx, DWORD PTR _PkSize$[ebp]
	mov	DWORD PTR [eax+16], ecx
; Line 152
	mov	edx, DWORD PTR _tempCurrentRecord$[ebp]
	mov	eax, DWORD PTR [edx+20]
	mov	DWORD PTR _temp$[ebp], eax
; Line 153
	mov	ecx, DWORD PTR ?HTTPInCountStored@HTTPList@@2JA ; HTTPList::HTTPInCountStored
	add	ecx, 1
	mov	DWORD PTR ?HTTPInCountStored@HTTPList@@2JA, ecx ; HTTPList::HTTPInCountStored
; Line 155
	mov	DWORD PTR _i$2237[ebp], 0
	jmp	SHORT $L2238
$L2239:
	mov	edx, DWORD PTR _i$2237[ebp]
	add	edx, 1
	mov	DWORD PTR _i$2237[ebp], edx
$L2238:
	mov	eax, DWORD PTR _i$2237[ebp]
	cmp	eax, DWORD PTR _PkSize$[ebp]
	jge	SHORT $L2240
; Line 157
	mov	ecx, DWORD PTR _temp$[ebp]
	add	ecx, DWORD PTR _i$2237[ebp]
	mov	edx, DWORD PTR _HTTPData$[ebp]
	add	edx, DWORD PTR _i$2237[ebp]
	mov	al, BYTE PTR [edx]
	mov	BYTE PTR [ecx], al
; Line 158
	jmp	SHORT $L2239
$L2240:
; Line 160
	mov	ecx, DWORD PTR ?HTTPInPtr@HTTPList@@0HA	; HTTPList::HTTPInPtr
	add	ecx, 1
	mov	DWORD PTR ?HTTPInPtr@HTTPList@@0HA, ecx	; HTTPList::HTTPInPtr
; Line 161
	mov	edx, DWORD PTR ?HTTPInPtr@HTTPList@@0HA	; HTTPList::HTTPInPtr
	cmp	edx, DWORD PTR ?HTTPSize@HTTPList@@0HA	; HTTPList::HTTPSize
	jl	SHORT $L2241
; Line 163
	mov	DWORD PTR ?HTTPInPtr@HTTPList@@0HA, 0	; HTTPList::HTTPInPtr
$L2241:
; Line 165
	mov	eax, DWORD PTR ?HTTPInPtr@HTTPList@@0HA	; HTTPList::HTTPInPtr
	imul	eax, 24					; 00000018H
	mov	ecx, DWORD PTR ?HTTPTableBase@HTTPList@@0JA ; HTTPList::HTTPTableBase
	add	ecx, eax
	mov	DWORD PTR _HTTPRecordPtr$[ebp], ecx
; Line 167
	mov	edx, DWORD PTR _HTTPRecordPtr$[ebp]
	mov	DWORD PTR ?HTTPInRecord@HTTPList@@0PAUHTTPRecord@1@A, edx ; HTTPList::HTTPInRecord
; Line 169
	jmp	SHORT $L2244
$L2235:
; Line 172
	mov	eax, -30				; ffffffe2H
	jmp	SHORT $L2227
$L2244:
; Line 175
	xor	eax, eax
$L2227:
; Line 176
	mov	esp, ebp
	pop	ebp
	ret	20					; 00000014H
?insert@HTTPList@@QAEHPADHH00@Z ENDP			; HTTPList::insert
_TEXT	ENDS
PUBLIC	??0WList@@QAE@XZ				; WList::WList
PUBLIC	?get@HTTPList@@QAEHPAH0PAD11@Z			; HTTPList::get
EXTRN	?Current_Task@apptask@@2HA:DWORD		; apptask::Current_Task
EXTRN	?Current_Tcbrno@apptask@@2HA:DWORD		; apptask::Current_Tcbrno
EXTRN	?insert@WList@@QAEHJHHH@Z:NEAR			; WList::insert
EXTRN	??0apptask@@QAE@XZ:NEAR				; apptask::apptask
_TEXT	SEGMENT
_SocketID$ = 8
_PkSize$ = 12
_Data$ = 16
_ip$ = 20
_port$ = 24
_this$ = -456
_io$ = -432
_tsk$ = -420
_wlst$ = -444
_tempCurrentRecord$ = -436
_HTTPRecordPtr$ = -8
_temp$ = -424
_retcode$ = -4
_DataBuff$2263 = -452
_i$2265 = -448
?get@HTTPList@@QAEHPAH0PAD11@Z PROC NEAR		; HTTPList::get
; Line 189
	push	ebp
	mov	ebp, esp
	sub	esp, 456				; 000001c8H
	mov	DWORD PTR _this$[ebp], ecx
; Line 190
	lea	ecx, DWORD PTR _io$[ebp]
	call	??0AOAProtected@@QAE@XZ			; AOAProtected::AOAProtected
; Line 191
	lea	ecx, DWORD PTR _tsk$[ebp]
	call	??0apptask@@QAE@XZ			; apptask::apptask
; Line 192
	lea	ecx, DWORD PTR _wlst$[ebp]
	call	??0WList@@QAE@XZ			; WList::WList
; Line 196
	mov	DWORD PTR _temp$[ebp], 0
; Line 197
	mov	DWORD PTR _retcode$[ebp], 0
; Line 199
	mov	eax, DWORD PTR ?HTTPOutRecord@HTTPList@@0PAUHTTPRecord@1@A ; HTTPList::HTTPOutRecord
	mov	DWORD PTR _tempCurrentRecord$[ebp], eax
; Line 200
	cmp	DWORD PTR _PkSize$[ebp], 0
	ja	SHORT $L2260
; Line 202
	or	eax, -1
	jmp	$L2252
$L2260:
; Line 204
	mov	ecx, DWORD PTR _tempCurrentRecord$[ebp]
	cmp	DWORD PTR [ecx], 1
	jne	$L2261
; Line 207
	mov	edx, DWORD PTR _tempCurrentRecord$[ebp]
	mov	DWORD PTR [edx], 0
; Line 209
	mov	eax, DWORD PTR _PkSize$[ebp]
	mov	ecx, DWORD PTR _tempCurrentRecord$[ebp]
	mov	edx, DWORD PTR [eax]
	cmp	edx, DWORD PTR [ecx+16]
	jle	SHORT $L2262
; Line 211
	mov	eax, DWORD PTR _PkSize$[ebp]
	mov	ecx, DWORD PTR _tempCurrentRecord$[ebp]
	mov	edx, DWORD PTR [ecx+16]
	mov	DWORD PTR [eax], edx
$L2262:
; Line 214
	mov	eax, DWORD PTR _SocketID$[ebp]
	mov	ecx, DWORD PTR _tempCurrentRecord$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR [eax], edx
; Line 215
	mov	eax, DWORD PTR _ip$[ebp]
	mov	ecx, DWORD PTR _tempCurrentRecord$[ebp]
	mov	dl, BYTE PTR [ecx+8]
	mov	BYTE PTR [eax], dl
; Line 216
	mov	eax, DWORD PTR _ip$[ebp]
	mov	ecx, DWORD PTR _tempCurrentRecord$[ebp]
	mov	dl, BYTE PTR [ecx+9]
	mov	BYTE PTR [eax+1], dl
; Line 217
	mov	eax, DWORD PTR _ip$[ebp]
	mov	ecx, DWORD PTR _tempCurrentRecord$[ebp]
	mov	dl, BYTE PTR [ecx+10]
	mov	BYTE PTR [eax+2], dl
; Line 218
	mov	eax, DWORD PTR _ip$[ebp]
	mov	ecx, DWORD PTR _tempCurrentRecord$[ebp]
	mov	dl, BYTE PTR [ecx+11]
	mov	BYTE PTR [eax+3], dl
; Line 219
	mov	eax, DWORD PTR _port$[ebp]
	mov	ecx, DWORD PTR _tempCurrentRecord$[ebp]
	mov	dl, BYTE PTR [ecx+12]
	mov	BYTE PTR [eax], dl
; Line 220
	mov	eax, DWORD PTR _port$[ebp]
	mov	ecx, DWORD PTR _tempCurrentRecord$[ebp]
	mov	dl, BYTE PTR [ecx+13]
	mov	BYTE PTR [eax+1], dl
; Line 222
	mov	eax, DWORD PTR _tempCurrentRecord$[ebp]
	mov	ecx, DWORD PTR [eax+20]
	mov	DWORD PTR _DataBuff$2263[ebp], ecx
; Line 223
	mov	DWORD PTR _i$2265[ebp], 0
	jmp	SHORT $L2266
$L2267:
	mov	edx, DWORD PTR _i$2265[ebp]
	add	edx, 1
	mov	DWORD PTR _i$2265[ebp], edx
$L2266:
	mov	eax, DWORD PTR _PkSize$[ebp]
	mov	ecx, DWORD PTR _i$2265[ebp]
	cmp	ecx, DWORD PTR [eax]
	jge	SHORT $L2268
; Line 225
	mov	edx, DWORD PTR _Data$[ebp]
	add	edx, DWORD PTR _i$2265[ebp]
	mov	eax, DWORD PTR _DataBuff$2263[ebp]
	add	eax, DWORD PTR _i$2265[ebp]
	mov	cl, BYTE PTR [eax]
	mov	BYTE PTR [edx], cl
; Line 226
	jmp	SHORT $L2267
$L2268:
; Line 228
	mov	edx, DWORD PTR ?HTTPOutCount@HTTPList@@2JA ; HTTPList::HTTPOutCount
	add	edx, 1
	mov	DWORD PTR ?HTTPOutCount@HTTPList@@2JA, edx ; HTTPList::HTTPOutCount
; Line 230
	mov	eax, DWORD PTR ?HTTPOutPtr@HTTPList@@0HA ; HTTPList::HTTPOutPtr
	add	eax, 1
	mov	DWORD PTR ?HTTPOutPtr@HTTPList@@0HA, eax ; HTTPList::HTTPOutPtr
; Line 231
	mov	ecx, DWORD PTR ?HTTPOutPtr@HTTPList@@0HA ; HTTPList::HTTPOutPtr
	cmp	ecx, DWORD PTR ?HTTPSize@HTTPList@@0HA	; HTTPList::HTTPSize
	jl	SHORT $L2269
; Line 233
	mov	DWORD PTR ?HTTPOutPtr@HTTPList@@0HA, 0	; HTTPList::HTTPOutPtr
$L2269:
; Line 236
	mov	edx, DWORD PTR ?HTTPOutPtr@HTTPList@@0HA ; HTTPList::HTTPOutPtr
	imul	edx, 24					; 00000018H
	mov	eax, DWORD PTR ?HTTPTableBase@HTTPList@@0JA ; HTTPList::HTTPTableBase
	add	eax, edx
	mov	DWORD PTR _HTTPRecordPtr$[ebp], eax
; Line 238
	mov	ecx, DWORD PTR _HTTPRecordPtr$[ebp]
	mov	DWORD PTR ?HTTPOutRecord@HTTPList@@0PAUHTTPRecord@1@A, ecx ; HTTPList::HTTPOutRecord
; Line 240
	jmp	SHORT $L2272
$L2261:
; Line 242
	push	1
	push	-268435456				; f0000000H
	mov	edx, DWORD PTR ?Current_Tcbrno@apptask@@2HA ; apptask::Current_Tcbrno
	push	edx
	mov	eax, DWORD PTR ?Current_Task@apptask@@2HA ; apptask::Current_Task
	push	eax
	lea	ecx, DWORD PTR _wlst$[ebp]
	call	?insert@WList@@QAEHJHHH@Z		; WList::insert
; Line 244
	mov	eax, -2					; fffffffeH
	jmp	SHORT $L2252
$L2272:
; Line 246
	push	1
	push	536870912				; 20000000H
	mov	ecx, DWORD PTR ?Current_Tcbrno@apptask@@2HA ; apptask::Current_Tcbrno
	push	ecx
	mov	edx, DWORD PTR ?Current_Task@apptask@@2HA ; apptask::Current_Task
	push	edx
	lea	ecx, DWORD PTR _wlst$[ebp]
	call	?insert@WList@@QAEHJHHH@Z		; WList::insert
; Line 247
	xor	eax, eax
$L2252:
; Line 248
	mov	esp, ebp
	pop	ebp
	ret	20					; 00000014H
?get@HTTPList@@QAEHPAH0PAD11@Z ENDP			; HTTPList::get
_TEXT	ENDS
;	COMDAT ??0WList@@QAE@XZ
_TEXT	SEGMENT
_this$ = -4
??0WList@@QAE@XZ PROC NEAR				; WList::WList, COMDAT
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	??0AOAProtected@@QAE@XZ			; AOAProtected::AOAProtected
	mov	eax, DWORD PTR _this$[ebp]
	mov	esp, ebp
	pop	ebp
	ret	0
??0WList@@QAE@XZ ENDP					; WList::WList
_TEXT	ENDS
PUBLIC	?empty@HTTPList@@QAEHXZ				; HTTPList::empty
_TEXT	SEGMENT
_this$ = -8
_retcode$ = -4
?empty@HTTPList@@QAEHXZ PROC NEAR			; HTTPList::empty
; Line 253
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 254
	mov	DWORD PTR _retcode$[ebp], 0
; Line 256
	mov	eax, DWORD PTR ?HTTPInPtr@HTTPList@@0HA	; HTTPList::HTTPInPtr
	cmp	eax, DWORD PTR ?HTTPOutPtr@HTTPList@@0HA ; HTTPList::HTTPOutPtr
	jne	SHORT $L2279
; Line 257
	mov	DWORD PTR _retcode$[ebp], 1
; Line 258
	jmp	SHORT $L2280
$L2279:
	mov	DWORD PTR _retcode$[ebp], 0
$L2280:
; Line 260
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 261
	mov	esp, ebp
	pop	ebp
	ret	0
?empty@HTTPList@@QAEHXZ ENDP				; HTTPList::empty
_this$ = -8
_retcode$ = -4
?full@HTTPList@@QAEHXZ PROC NEAR			; HTTPList::full
; Line 266
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 267
	mov	DWORD PTR _retcode$[ebp], 0
; Line 269
	mov	eax, DWORD PTR ?HTTPInPtr@HTTPList@@0HA	; HTTPList::HTTPInPtr
	add	eax, 1
	cdq
	idiv	DWORD PTR ?HTTPSize@HTTPList@@0HA	; HTTPList::HTTPSize
	cmp	edx, DWORD PTR ?HTTPOutPtr@HTTPList@@0HA ; HTTPList::HTTPOutPtr
	jne	SHORT $L2285
; Line 270
	mov	DWORD PTR _retcode$[ebp], 1
; Line 271
	jmp	SHORT $L2286
$L2285:
	mov	DWORD PTR _retcode$[ebp], 0
$L2286:
; Line 273
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 274
	mov	esp, ebp
	pop	ebp
	ret	0
?full@HTTPList@@QAEHXZ ENDP				; HTTPList::full
_TEXT	ENDS
PUBLIC	?getInPtr@HTTPList@@QAEHXZ			; HTTPList::getInPtr
_TEXT	SEGMENT
_this$ = -4
?getInPtr@HTTPList@@QAEHXZ PROC NEAR			; HTTPList::getInPtr
; Line 279
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 280
	mov	eax, DWORD PTR ?HTTPInPtr@HTTPList@@0HA	; HTTPList::HTTPInPtr
; Line 281
	mov	esp, ebp
	pop	ebp
	ret	0
?getInPtr@HTTPList@@QAEHXZ ENDP				; HTTPList::getInPtr
_TEXT	ENDS
PUBLIC	?getOutPtr@HTTPList@@QAEHXZ			; HTTPList::getOutPtr
_TEXT	SEGMENT
_this$ = -4
?getOutPtr@HTTPList@@QAEHXZ PROC NEAR			; HTTPList::getOutPtr
; Line 286
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 287
	mov	eax, DWORD PTR ?HTTPOutPtr@HTTPList@@0HA ; HTTPList::HTTPOutPtr
; Line 288
	mov	esp, ebp
	pop	ebp
	ret	0
?getOutPtr@HTTPList@@QAEHXZ ENDP			; HTTPList::getOutPtr
_TEXT	ENDS
PUBLIC	?getInCount@HTTPList@@QAEHXZ			; HTTPList::getInCount
_TEXT	SEGMENT
_this$ = -4
?getInCount@HTTPList@@QAEHXZ PROC NEAR			; HTTPList::getInCount
; Line 293
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 294
	mov	eax, DWORD PTR ?HTTPInCountStored@HTTPList@@2JA ; HTTPList::HTTPInCountStored
; Line 295
	mov	esp, ebp
	pop	ebp
	ret	0
?getInCount@HTTPList@@QAEHXZ ENDP			; HTTPList::getInCount
_TEXT	ENDS
PUBLIC	?getOutCount@HTTPList@@QAEHXZ			; HTTPList::getOutCount
_TEXT	SEGMENT
_this$ = -4
?getOutCount@HTTPList@@QAEHXZ PROC NEAR			; HTTPList::getOutCount
; Line 300
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 301
	mov	eax, DWORD PTR ?HTTPOutCount@HTTPList@@2JA ; HTTPList::HTTPOutCount
; Line 302
	mov	esp, ebp
	pop	ebp
	ret	0
?getOutCount@HTTPList@@QAEHXZ ENDP			; HTTPList::getOutCount
_TEXT	ENDS
PUBLIC	?getCount@HTTPList@@QAEHXZ			; HTTPList::getCount
_TEXT	SEGMENT
_this$ = -4
?getCount@HTTPList@@QAEHXZ PROC NEAR			; HTTPList::getCount
; Line 305
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 307
	mov	eax, DWORD PTR ?HTTPInPtr@HTTPList@@0HA	; HTTPList::HTTPInPtr
	cmp	eax, DWORD PTR ?HTTPOutPtr@HTTPList@@0HA ; HTTPList::HTTPOutPtr
	jl	SHORT $L2302
; Line 308
	mov	eax, DWORD PTR ?HTTPInPtr@HTTPList@@0HA	; HTTPList::HTTPInPtr
	sub	eax, DWORD PTR ?HTTPOutPtr@HTTPList@@0HA ; HTTPList::HTTPOutPtr
	jmp	SHORT $L2303
$L2302:
; Line 310
	mov	ecx, DWORD PTR ?HTTPOutPtr@HTTPList@@0HA ; HTTPList::HTTPOutPtr
	sub	ecx, DWORD PTR ?HTTPInPtr@HTTPList@@0HA	; HTTPList::HTTPInPtr
	mov	eax, DWORD PTR ?HTTPSize@HTTPList@@0HA	; HTTPList::HTTPSize
	sub	eax, ecx
$L2303:
; Line 312
	mov	esp, ebp
	pop	ebp
	ret	0
?getCount@HTTPList@@QAEHXZ ENDP				; HTTPList::getCount
_TEXT	ENDS
END
