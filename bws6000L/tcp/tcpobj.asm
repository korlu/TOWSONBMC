	TITLE	tcpobj.cpp
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
;	COMDAT ??0WCirList@@QAE@XZ
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
FLAT	GROUP _DATA, CONST, _BSS
	ASSUME	CS: FLAT, DS: FLAT, SS: FLAT
endif
PUBLIC	?logptr@@3PQTCPObj@@HQ1@			; logptr
PUBLIC	?s@@3KA						; s
PUBLIC	?min@@3KA					; min
PUBLIC	?max@@3KA					; max
PUBLIC	?HostIP@TCPObj@@0PADA				; TCPObj::HostIP
PUBLIC	?HostSubnetMask@TCPObj@@0PADA			; TCPObj::HostSubnetMask
PUBLIC	?GateWayIP@TCPObj@@0PADA			; TCPObj::GateWayIP
PUBLIC	?GateWayMAC@TCPObj@@0PADA			; TCPObj::GateWayMAC
PUBLIC	?SourcePort@TCPObj@@0GA				; TCPObj::SourcePort
PUBLIC	?TCBCount@TCPObj@@0JA				; TCPObj::TCBCount
PUBLIC	?TCBRecords@TCPObj@@0JA				; TCPObj::TCBRecords
PUBLIC	?TCBBase@TCPObj@@0KA				; TCPObj::TCBBase
PUBLIC	?FreeList@TCPObj@@0JA				; TCPObj::FreeList
PUBLIC	?lcounter@TCPObj@@0HA				; TCPObj::lcounter
PUBLIC	?logcount@TCPObj@@0HA				; TCPObj::logcount
PUBLIC	?averageconntime@TCPObj@@0KA			; TCPObj::averageconntime
PUBLIC	?sizeOfTCBRecord@TCPObj@@2HA			; TCPObj::sizeOfTCBRecord
PUBLIC	?traceGlobalIndex@TCPObj@@2HA			; TCPObj::traceGlobalIndex
PUBLIC	?HttpCount@TCPObj@@2KA				; TCPObj::HttpCount
PUBLIC	?HttpRequests@TCPObj@@2KA			; TCPObj::HttpRequests
PUBLIC	?GetCount@TCPObj@@2KA				; TCPObj::GetCount
PUBLIC	?SynCount@TCPObj@@2KA				; TCPObj::SynCount
PUBLIC	?SynAckCount@TCPObj@@2KA			; TCPObj::SynAckCount
PUBLIC	?MaxSynGetTime@TCPObj@@2KA			; TCPObj::MaxSynGetTime
PUBLIC	?TotalSynGetTime@TCPObj@@2KA			; TCPObj::TotalSynGetTime
PUBLIC	?MaxConnectionTime@TCPObj@@2KA			; TCPObj::MaxConnectionTime
PUBLIC	?MaxNoOfTasksUsed@TCPObj@@2KA			; TCPObj::MaxNoOfTasksUsed
PUBLIC	?MaxNoOfTCBsUsed@TCPObj@@2KA			; TCPObj::MaxNoOfTCBsUsed
PUBLIC	?MaxSynGetThreshCount@TCPObj@@2KA		; TCPObj::MaxSynGetThreshCount
PUBLIC	?NoOfRetransmissions@TCPObj@@2KA		; TCPObj::NoOfRetransmissions
PUBLIC	?NoOfResets@TCPObj@@2HA				; TCPObj::NoOfResets
PUBLIC	?UnMatchedRequests@TCPObj@@2HA			; TCPObj::UnMatchedRequests
PUBLIC	?TotalDelCount@TCPObj@@2KA			; TCPObj::TotalDelCount
PUBLIC	?trace1Count@TCPObj@@2JA			; TCPObj::trace1Count
PUBLIC	?trace2Count@TCPObj@@2JA			; TCPObj::trace2Count
PUBLIC	?SendCountTotal@TCPObj@@2HA			; TCPObj::SendCountTotal
_BSS	SEGMENT
?s@@3KA	DD	01H DUP (?)				; s
?max@@3KA DD	01H DUP (?)				; max
?HostIP@TCPObj@@0PADA DB 04H DUP (?)			; TCPObj::HostIP
?HostSubnetMask@TCPObj@@0PADA DB 04H DUP (?)		; TCPObj::HostSubnetMask
?GateWayIP@TCPObj@@0PADA DB 04H DUP (?)			; TCPObj::GateWayIP
?GateWayMAC@TCPObj@@0PADA DB 06H DUP (?)		; TCPObj::GateWayMAC
	ALIGN	4

?TCBCount@TCPObj@@0JA DD 01H DUP (?)			; TCPObj::TCBCount
?TCBRecords@TCPObj@@0JA DD 01H DUP (?)			; TCPObj::TCBRecords
?TCBBase@TCPObj@@0KA DD 01H DUP (?)			; TCPObj::TCBBase
?FreeList@TCPObj@@0JA DD 01H DUP (?)			; TCPObj::FreeList
?lcounter@TCPObj@@0HA DD 01H DUP (?)			; TCPObj::lcounter
?logcount@TCPObj@@0HA DD 01H DUP (?)			; TCPObj::logcount
?averageconntime@TCPObj@@0KA DD 01H DUP (?)		; TCPObj::averageconntime
?sizeOfTCBRecord@TCPObj@@2HA DD 01H DUP (?)		; TCPObj::sizeOfTCBRecord
?traceGlobalIndex@TCPObj@@2HA DD 01H DUP (?)		; TCPObj::traceGlobalIndex
?HttpCount@TCPObj@@2KA DD 01H DUP (?)			; TCPObj::HttpCount
?HttpRequests@TCPObj@@2KA DD 01H DUP (?)		; TCPObj::HttpRequests
?GetCount@TCPObj@@2KA DD 01H DUP (?)			; TCPObj::GetCount
?SynCount@TCPObj@@2KA DD 01H DUP (?)			; TCPObj::SynCount
?SynAckCount@TCPObj@@2KA DD 01H DUP (?)			; TCPObj::SynAckCount
?MaxSynGetTime@TCPObj@@2KA DD 01H DUP (?)		; TCPObj::MaxSynGetTime
?TotalSynGetTime@TCPObj@@2KA DD 01H DUP (?)		; TCPObj::TotalSynGetTime
?MaxConnectionTime@TCPObj@@2KA DD 01H DUP (?)		; TCPObj::MaxConnectionTime
?MaxNoOfTasksUsed@TCPObj@@2KA DD 01H DUP (?)		; TCPObj::MaxNoOfTasksUsed
?MaxNoOfTCBsUsed@TCPObj@@2KA DD 01H DUP (?)		; TCPObj::MaxNoOfTCBsUsed
?MaxSynGetThreshCount@TCPObj@@2KA DD 01H DUP (?)	; TCPObj::MaxSynGetThreshCount
?NoOfRetransmissions@TCPObj@@2KA DD 01H DUP (?)		; TCPObj::NoOfRetransmissions
?NoOfResets@TCPObj@@2HA DD 01H DUP (?)			; TCPObj::NoOfResets
?UnMatchedRequests@TCPObj@@2HA DD 01H DUP (?)		; TCPObj::UnMatchedRequests
?TotalDelCount@TCPObj@@2KA DD 01H DUP (?)		; TCPObj::TotalDelCount
?trace1Count@TCPObj@@2JA DD 01H DUP (?)			; TCPObj::trace1Count
?trace2Count@TCPObj@@2JA DD 01H DUP (?)			; TCPObj::trace2Count
?SendCountTotal@TCPObj@@2HA DD 01H DUP (?)		; TCPObj::SendCountTotal
_BSS	ENDS
_DATA	SEGMENT
?SourcePort@TCPObj@@0GA DW 050H				; TCPObj::SourcePort
	ORG $+2
?logptr@@3PQTCPObj@@HQ1@ DD 0ffffffffH			; logptr
?min@@3KA DD	0aH					; min
_DATA	ENDS
PUBLIC	?initRecord@TCPObj@@QAEHXZ			; TCPObj::initRecord
_TEXT	SEGMENT
_this$ = -4
?initRecord@TCPObj@@QAEHXZ PROC NEAR			; TCPObj::initRecord
; File tcpobj.cpp
; Line 68
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 69
	mov	DWORD PTR ?sizeOfTCBRecord@TCPObj@@2HA, 288 ; TCPObj::sizeOfTCBRecord, 00000120H
; Line 70
	mov	eax, DWORD PTR ?sizeOfTCBRecord@TCPObj@@2HA ; TCPObj::sizeOfTCBRecord
; Line 71
	mov	esp, ebp
	pop	ebp
	ret	0
?initRecord@TCPObj@@QAEHXZ ENDP				; TCPObj::initRecord
_TEXT	ENDS
PUBLIC	?init@TCPObj@@QAEHQAD0000GJJJJ@Z		; TCPObj::init
EXTRN	?init@TcphashIndex@@QAEHJK@Z:NEAR		; TcphashIndex::init
EXTRN	?Application_Status@AOAProtected@@2HA:DWORD	; AOAProtected::Application_Status
EXTRN	?AOAprintHex@AOAProtected@@QAEHJH@Z:NEAR	; AOAProtected::AOAprintHex
EXTRN	?AOAgetTimer@AOAProtected@@QAEJXZ:NEAR		; AOAProtected::AOAgetTimer
EXTRN	?AOAExit@AOAProtected@@QAEXXZ:NEAR		; AOAProtected::AOAExit
EXTRN	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z:NEAR	; AOAProtected::AOAsetSharedMem
EXTRN	??0random@@QAE@H@Z:NEAR				; random::random
_TEXT	SEGMENT
_SrcIP$ = 8
_SubnetMask$ = 16
_GwayIP$ = 20
_GwayMAC$ = 24
_SrcPort$ = 28
_TCPBuffBase$ = 32
_TCBBufferSize$ = 36
_NoTCBRecords$ = 40
_NoHashRecords$ = 44
_this$ = -24
_hashSize$ = -20
_i$ = -16
_TCBPointer$ = -12
_r$ = -8
?init@TCPObj@@QAEHQAD0000GJJJJ@Z PROC NEAR		; TCPObj::init
; Line 81
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 82
	mov	DWORD PTR _hashSize$[ebp], 0
; Line 83
	mov	DWORD PTR ?SendCountTotal@TCPObj@@2HA, 0 ; TCPObj::SendCountTotal
; Line 84
	mov	DWORD PTR ?TCBCount@TCPObj@@0JA, 0	; TCPObj::TCBCount
; Line 85
	mov	DWORD PTR ?trace1Count@TCPObj@@2JA, 0	; TCPObj::trace1Count
; Line 86
	mov	DWORD PTR ?trace2Count@TCPObj@@2JA, 0	; TCPObj::trace2Count
; Line 89
	mov	eax, DWORD PTR _TCPBuffBase$[ebp]
	sub	eax, 1114112				; 00110000H
	mov	DWORD PTR _TCPBuffBase$[ebp], eax
; Line 90
	mov	ecx, DWORD PTR _TCPBuffBase$[ebp]
	push	ecx
	mov	edx, DWORD PTR _NoHashRecords$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 328				; 00000148H
	call	?init@TcphashIndex@@QAEHJK@Z		; TcphashIndex::init
	mov	DWORD PTR _hashSize$[ebp], eax
; Line 94
	mov	eax, DWORD PTR _NoTCBRecords$[ebp]
	mov	DWORD PTR ?TCBRecords@TCPObj@@0JA, eax	; TCPObj::TCBRecords
; Line 96
	push	0
	push	180					; 000000b4H
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 97
	push	0
	push	256					; 00000100H
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 98
	push	0
	push	260					; 00000104H
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 99
	push	0
	push	264					; 00000108H
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 100
	push	0
	push	268					; 0000010cH
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 101
	push	0
	push	272					; 00000110H
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 102
	push	0
	push	276					; 00000114H
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 103
	push	0
	push	280					; 00000118H
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 105
	push	0
	push	184					; 000000b8H
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 106
	push	0
	push	188					; 000000bcH
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 107
	push	0
	push	192					; 000000c0H
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 108
	push	0
	push	196					; 000000c4H
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 109
	push	0
	push	200					; 000000c8H
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 110
	push	0
	push	204					; 000000ccH
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 111
	push	0
	push	208					; 000000d0H
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 112
	mov	DWORD PTR ?SendCountTotal@TCPObj@@2HA, 0 ; TCPObj::SendCountTotal
; Line 115
	mov	ecx, DWORD PTR _NoTCBRecords$[ebp]
	imul	ecx, 288				; 00000120H
	mov	edx, DWORD PTR _hashSize$[ebp]
	add	edx, ecx
	cmp	DWORD PTR _TCBBufferSize$[ebp], edx
	jae	SHORT $L2232
; Line 118
	push	3960					; 00000f78H
	push	288					; 00000120H
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 119
	mov	DWORD PTR ?Application_Status@AOAProtected@@2HA, 2 ; AOAProtected::Application_Status
; Line 120
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAExit@AOAProtected@@QAEXXZ		; AOAProtected::AOAExit
; Line 121
	int	-11					; fffffff5H
; Line 122
	or	eax, -1
	jmp	$L2229
$L2232:
; Line 125
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L2235
$L2236:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L2235:
	cmp	DWORD PTR _i$[ebp], 4
	jge	SHORT $L2237
; Line 127
	mov	ecx, DWORD PTR _SrcIP$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	mov	al, BYTE PTR [ecx]
	mov	BYTE PTR ?HostIP@TCPObj@@0PADA[edx], al
; Line 128
	mov	ecx, DWORD PTR _GwayIP$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	mov	al, BYTE PTR [ecx]
	mov	BYTE PTR ?GateWayIP@TCPObj@@0PADA[edx], al
; Line 129
	mov	ecx, DWORD PTR _SubnetMask$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	mov	al, BYTE PTR [ecx]
	mov	BYTE PTR ?HostSubnetMask@TCPObj@@0PADA[edx], al
; Line 130
	jmp	SHORT $L2236
$L2237:
; Line 133
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L2238
$L2239:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L2238:
	cmp	DWORD PTR _i$[ebp], 6
	jge	SHORT $L2240
; Line 135
	mov	edx, DWORD PTR _GwayMAC$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	mov	cl, BYTE PTR [edx]
	mov	BYTE PTR ?GateWayMAC@TCPObj@@0PADA[eax], cl
; Line 136
	jmp	SHORT $L2239
$L2240:
; Line 140
	mov	dx, WORD PTR _SrcPort$[ebp]
	mov	WORD PTR ?SourcePort@TCPObj@@0GA, dx	; TCPObj::SourcePort
; Line 145
	mov	eax, DWORD PTR _TCPBuffBase$[ebp]
	add	eax, DWORD PTR _hashSize$[ebp]
	mov	DWORD PTR ?TCBBase@TCPObj@@0KA, eax	; TCPObj::TCBBase
; Line 149
	mov	ecx, DWORD PTR ?TCBBase@TCPObj@@0KA	; TCPObj::TCBBase
	mov	DWORD PTR _TCBPointer$[ebp], ecx
; Line 151
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L2243
$L2244:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L2243:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _NoTCBRecords$[ebp]
	jge	$L2245
; Line 153
	cmp	DWORD PTR _i$[ebp], 0
	jne	SHORT $L2246
; Line 155
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 288				; 00000120H
	mov	edx, DWORD PTR _TCBPointer$[ebp]
	mov	DWORD PTR [edx+ecx], 0
; Line 156
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 288				; 00000120H
	mov	ecx, DWORD PTR _TCBPointer$[ebp]
	mov	DWORD PTR [ecx+eax+256], -1
; Line 157
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 288				; 00000120H
	mov	ecx, DWORD PTR _TCBPointer$[ebp]
	mov	DWORD PTR [ecx+eax+260], edx
; Line 158
	mov	DWORD PTR ?FreeList@TCPObj@@0JA, 0	; TCPObj::FreeList
; Line 160
	jmp	$L2249
$L2246:
	mov	edx, DWORD PTR _NoTCBRecords$[ebp]
	sub	edx, 1
	cmp	DWORD PTR _i$[ebp], edx
	jne	SHORT $L2248
; Line 162
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 288				; 00000120H
	mov	ecx, DWORD PTR _TCBPointer$[ebp]
	mov	DWORD PTR [ecx+eax], 0
; Line 163
	mov	edx, DWORD PTR _i$[ebp]
	sub	edx, 1
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 288				; 00000120H
	mov	ecx, DWORD PTR _TCBPointer$[ebp]
	mov	DWORD PTR [ecx+eax+256], edx
; Line 164
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 288				; 00000120H
	mov	eax, DWORD PTR _TCBPointer$[ebp]
	mov	DWORD PTR [eax+edx+260], -1
; Line 166
	jmp	SHORT $L2249
$L2248:
; Line 168
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 288				; 00000120H
	mov	edx, DWORD PTR _TCBPointer$[ebp]
	mov	DWORD PTR [edx+ecx], 0
; Line 169
	mov	eax, DWORD PTR _i$[ebp]
	sub	eax, 1
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 288				; 00000120H
	mov	edx, DWORD PTR _TCBPointer$[ebp]
	mov	DWORD PTR [edx+ecx+256], eax
; Line 170
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 288				; 00000120H
	mov	edx, DWORD PTR _TCBPointer$[ebp]
	mov	DWORD PTR [edx+ecx+260], eax
$L2249:
; Line 172
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 288				; 00000120H
	mov	ecx, DWORD PTR _TCBPointer$[ebp]
	mov	DWORD PTR [ecx+eax+24], 1
; Line 173
	jmp	$L2244
$L2245:
; Line 175
	mov	DWORD PTR ?HttpCount@TCPObj@@2KA, 0	; TCPObj::HttpCount
; Line 176
	mov	DWORD PTR ?HttpRequests@TCPObj@@2KA, 0	; TCPObj::HttpRequests
; Line 177
	mov	DWORD PTR ?SynCount@TCPObj@@2KA, 0	; TCPObj::SynCount
; Line 178
	mov	DWORD PTR ?SynAckCount@TCPObj@@2KA, 0	; TCPObj::SynAckCount
; Line 179
	mov	DWORD PTR ?GetCount@TCPObj@@2KA, 0	; TCPObj::GetCount
; Line 180
	mov	DWORD PTR ?MaxSynGetTime@TCPObj@@2KA, 0	; TCPObj::MaxSynGetTime
; Line 181
	mov	DWORD PTR ?TotalSynGetTime@TCPObj@@2KA, 0 ; TCPObj::TotalSynGetTime
; Line 182
	mov	DWORD PTR ?MaxConnectionTime@TCPObj@@2KA, 0 ; TCPObj::MaxConnectionTime
; Line 183
	mov	DWORD PTR ?MaxNoOfTasksUsed@TCPObj@@2KA, 0 ; TCPObj::MaxNoOfTasksUsed
; Line 184
	mov	DWORD PTR ?MaxNoOfTCBsUsed@TCPObj@@2KA, 0 ; TCPObj::MaxNoOfTCBsUsed
; Line 185
	mov	DWORD PTR ?MaxSynGetThreshCount@TCPObj@@2KA, 0 ; TCPObj::MaxSynGetThreshCount
; Line 186
	mov	DWORD PTR ?NoOfRetransmissions@TCPObj@@2KA, 0 ; TCPObj::NoOfRetransmissions
; Line 188
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	push	eax
	lea	ecx, DWORD PTR _r$[ebp]
	call	??0random@@QAE@H@Z			; random::random
; Line 189
	xor	eax, eax
$L2229:
; Line 190
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	40					; 00000028H
?init@TCPObj@@QAEHQAD0000GJJJJ@Z ENDP			; TCPObj::init
_TEXT	ENDS
PUBLIC	?InsertTCB@TCPObj@@AAEHPAUTCBRecord@1@@Z	; TCPObj::InsertTCB
EXTRN	?hashfun@TcphashIndex@@QAEJPAD0@Z:NEAR		; TcphashIndex::hashfun
EXTRN	?setIndex@TcphashIndex@@QAEJJJ@Z:NEAR		; TcphashIndex::setIndex
EXTRN	?getIndex@TcphashIndex@@QAEJJ@Z:NEAR		; TcphashIndex::getIndex
_TEXT	SEGMENT
_tcb$ = 8
_this$ = -28
_TCBPointer$ = -20
_FreeTCB$ = -16
_FreeTCBIndex$ = -12
_hashvalue$ = -8
_hashIndexVal$ = -4
_j$ = -24
?InsertTCB@TCPObj@@AAEHPAUTCBRecord@1@@Z PROC NEAR	; TCPObj::InsertTCB
; Line 198
	push	ebp
	mov	ebp, esp
	sub	esp, 28					; 0000001cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 200
	mov	eax, DWORD PTR ?TCBBase@TCPObj@@0KA	; TCPObj::TCBBase
	mov	DWORD PTR _TCBPointer$[ebp], eax
; Line 202
	mov	ecx, DWORD PTR ?FreeList@TCPObj@@0JA	; TCPObj::FreeList
	imul	ecx, 288				; 00000120H
	mov	edx, DWORD PTR _TCBPointer$[ebp]
	add	edx, ecx
	mov	DWORD PTR _FreeTCB$[ebp], edx
; Line 203
	mov	DWORD PTR _FreeTCBIndex$[ebp], 0
; Line 204
	mov	DWORD PTR _hashvalue$[ebp], 0
; Line 205
	mov	DWORD PTR _hashIndexVal$[ebp], 0
; Line 208
	cmp	DWORD PTR ?FreeList@TCPObj@@0JA, -1	; TCPObj::FreeList
	jne	SHORT $L2262
; Line 210
	or	eax, -1
	jmp	$L2255
$L2262:
; Line 214
	mov	eax, DWORD PTR ?FreeList@TCPObj@@0JA	; TCPObj::FreeList
	mov	DWORD PTR _FreeTCBIndex$[ebp], eax
; Line 216
	mov	ecx, DWORD PTR _FreeTCB$[ebp]
	mov	edx, DWORD PTR [ecx+260]
	mov	DWORD PTR ?FreeList@TCPObj@@0JA, edx	; TCPObj::FreeList
; Line 218
	mov	eax, DWORD PTR _FreeTCB$[ebp]
	mov	DWORD PTR [eax], 1
; Line 220
	cmp	DWORD PTR ?FreeList@TCPObj@@0JA, -1	; TCPObj::FreeList
	je	SHORT $L2263
; Line 222
	mov	ecx, DWORD PTR ?FreeList@TCPObj@@0JA	; TCPObj::FreeList
	imul	ecx, 288				; 00000120H
	mov	edx, DWORD PTR _TCBPointer$[ebp]
	mov	DWORD PTR [edx+ecx+256], -1
$L2263:
; Line 226
	mov	eax, DWORD PTR _FreeTCB$[ebp]
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	dl, BYTE PTR [ecx+18]
	mov	BYTE PTR [eax+18], dl
; Line 227
	mov	eax, DWORD PTR _FreeTCB$[ebp]
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	dl, BYTE PTR [ecx+19]
	mov	BYTE PTR [eax+19], dl
; Line 229
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L2265
$L2266:
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	DWORD PTR _j$[ebp], eax
$L2265:
	cmp	DWORD PTR _j$[ebp], 4
	jge	SHORT $L2267
; Line 231
	mov	ecx, DWORD PTR _FreeTCB$[ebp]
	add	ecx, DWORD PTR _j$[ebp]
	mov	edx, DWORD PTR _tcb$[ebp]
	add	edx, DWORD PTR _j$[ebp]
	mov	al, BYTE PTR [edx+20]
	mov	BYTE PTR [ecx+20], al
; Line 232
	jmp	SHORT $L2266
$L2267:
; Line 234
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L2268
$L2269:
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
$L2268:
	cmp	DWORD PTR _j$[ebp], 6
	jge	SHORT $L2270
; Line 236
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	add	edx, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	add	eax, DWORD PTR _j$[ebp]
	mov	cl, BYTE PTR [eax+12]
	mov	BYTE PTR [edx+12], cl
; Line 237
	jmp	SHORT $L2269
$L2270:
; Line 240
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+24]
	mov	DWORD PTR [edx+24], ecx
; Line 242
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+96]
	mov	DWORD PTR [edx+96], ecx
; Line 244
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+100]
	mov	DWORD PTR [edx+100], ecx
; Line 246
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+104]
	mov	DWORD PTR [edx+104], ecx
; Line 248
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+128]
	mov	DWORD PTR [edx+128], ecx
; Line 250
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+132]
	mov	DWORD PTR [edx+132], ecx
; Line 252
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+136]
	mov	DWORD PTR [edx+136], ecx
; Line 254
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+112]
	mov	DWORD PTR [edx+112], ecx
; Line 256
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+140]
	mov	DWORD PTR [edx+140], ecx
; Line 258
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+144]
	mov	DWORD PTR [edx+144], ecx
; Line 260
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+28]
	mov	DWORD PTR [edx+28], ecx
; Line 262
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+108]
	mov	DWORD PTR [edx+108], ecx
; Line 264
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+120]
	mov	DWORD PTR [edx+120], ecx
; Line 265
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	mov	DWORD PTR [edx+4], ecx
; Line 266
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	mov	DWORD PTR [edx+8], ecx
; Line 267
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+148]
	mov	DWORD PTR [edx+148], ecx
; Line 268
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+84]
	mov	DWORD PTR [edx+84], ecx
; Line 269
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+88]
	mov	DWORD PTR [edx+88], ecx
; Line 270
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+152]
	mov	DWORD PTR [edx+152], ecx
; Line 271
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+160]
	mov	DWORD PTR [edx+160], ecx
; Line 272
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+164]
	mov	DWORD PTR [edx+164], ecx
; Line 273
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+168]
	mov	DWORD PTR [edx+168], ecx
; Line 274
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+172]
	mov	DWORD PTR [edx+172], ecx
; Line 275
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+176]
	mov	DWORD PTR [edx+176], ecx
; Line 276
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+152]
	mov	DWORD PTR [edx+152], ecx
; Line 277
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+248]
	mov	DWORD PTR [edx+248], ecx
; Line 278
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+180]
	mov	DWORD PTR [edx+180], ecx
; Line 279
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR [edx+80], ecx
; Line 280
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+252]
	mov	DWORD PTR [edx+252], ecx
; Line 281
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+156]
	mov	DWORD PTR [edx+156], ecx
; Line 282
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+124]
	mov	DWORD PTR [edx+124], ecx
; Line 284
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+200]
	mov	DWORD PTR [edx+200], ecx
; Line 285
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+204]
	mov	DWORD PTR [edx+204], ecx
; Line 286
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+208]
	mov	DWORD PTR [edx+208], ecx
; Line 287
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+212]
	mov	DWORD PTR [edx+212], ecx
; Line 288
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+216]
	mov	DWORD PTR [edx+216], ecx
; Line 289
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+220]
	mov	DWORD PTR [edx+220], ecx
; Line 290
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+224]
	mov	DWORD PTR [edx+224], ecx
; Line 292
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+272]
	mov	DWORD PTR [edx+272], ecx
; Line 293
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+276]
	mov	DWORD PTR [edx+276], ecx
; Line 294
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+284]
	mov	DWORD PTR [edx+284], ecx
; Line 295
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+228]
	mov	DWORD PTR [edx+228], ecx
; Line 296
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	mov	DWORD PTR [edx+232], ecx
; Line 297
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+68]
	mov	DWORD PTR [edx+68], ecx
; Line 298
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+72]
	mov	DWORD PTR [edx+72], ecx
; Line 299
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+64]
	mov	DWORD PTR [edx+64], ecx
; Line 300
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+236]
	mov	DWORD PTR [edx+236], ecx
; Line 301
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+76]
	mov	DWORD PTR [edx+76], ecx
; Line 302
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+32]
	mov	DWORD PTR [edx+32], ecx
; Line 303
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+36]
	mov	DWORD PTR [edx+36], ecx
; Line 304
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+40]
	mov	DWORD PTR [edx+40], ecx
; Line 305
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+44]
	mov	DWORD PTR [edx+44], ecx
; Line 306
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+48]
	mov	DWORD PTR [edx+48], ecx
; Line 307
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+52]
	mov	DWORD PTR [edx+52], ecx
; Line 308
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+56]
	mov	DWORD PTR [edx+56], ecx
; Line 309
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+60]
	mov	DWORD PTR [edx+60], ecx
; Line 311
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	add	edx, 18					; 00000012H
	push	edx
	mov	eax, DWORD PTR _FreeTCB$[ebp]
	add	eax, 20					; 00000014H
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 328				; 00000148H
	call	?hashfun@TcphashIndex@@QAEJPAD0@Z	; TcphashIndex::hashfun
	mov	DWORD PTR _hashvalue$[ebp], eax
; Line 312
	mov	ecx, DWORD PTR _hashvalue$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 328				; 00000148H
	call	?getIndex@TcphashIndex@@QAEJJ@Z		; TcphashIndex::getIndex
	mov	DWORD PTR _hashIndexVal$[ebp], eax
; Line 313
	cmp	DWORD PTR _hashIndexVal$[ebp], -1
	jne	SHORT $L2271
; Line 315
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	DWORD PTR [edx+260], -1
; Line 316
	mov	eax, DWORD PTR _FreeTCB$[ebp]
	mov	DWORD PTR [eax+256], -1
; Line 317
	mov	ecx, DWORD PTR _FreeTCBIndex$[ebp]
	push	ecx
	mov	edx, DWORD PTR _hashvalue$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 328				; 00000148H
	call	?setIndex@TcphashIndex@@QAEJJJ@Z	; TcphashIndex::setIndex
; Line 319
	jmp	SHORT $L2272
$L2271:
; Line 321
	mov	eax, DWORD PTR _FreeTCB$[ebp]
	mov	DWORD PTR [eax+256], -1
; Line 322
	mov	ecx, DWORD PTR _FreeTCB$[ebp]
	mov	edx, DWORD PTR _hashIndexVal$[ebp]
	mov	DWORD PTR [ecx+260], edx
; Line 323
	mov	eax, DWORD PTR _hashIndexVal$[ebp]
	imul	eax, 288				; 00000120H
	mov	ecx, DWORD PTR _TCBPointer$[ebp]
	mov	edx, DWORD PTR _FreeTCBIndex$[ebp]
	mov	DWORD PTR [ecx+eax+256], edx
; Line 324
	mov	eax, DWORD PTR _FreeTCBIndex$[ebp]
	push	eax
	mov	ecx, DWORD PTR _hashvalue$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 328				; 00000148H
	call	?setIndex@TcphashIndex@@QAEJJJ@Z	; TcphashIndex::setIndex
$L2272:
; Line 328
	mov	eax, DWORD PTR _FreeTCBIndex$[ebp]
$L2255:
; Line 329
	mov	esp, ebp
	pop	ebp
	ret	4
?InsertTCB@TCPObj@@AAEHPAUTCBRecord@1@@Z ENDP		; TCPObj::InsertTCB
_TEXT	ENDS
PUBLIC	?DeleteTCB@TCPObj@@QAEHHH@Z			; TCPObj::DeleteTCB
PUBLIC	?storeTraceDword@TCPObj@@QAEHHHH@Z		; TCPObj::storeTraceDword
_TEXT	SEGMENT
_TCBRecordNum$ = 8
_retpoint$ = 12
_this$ = -32
_prev$ = -20
_next$ = -28
_hashValue$ = -12
_gettime$ = -8
_retcode$ = -4
_TCBPointer$ = -16
_tcb$ = -24
?DeleteTCB@TCPObj@@QAEHHH@Z PROC NEAR			; TCPObj::DeleteTCB
; Line 333
	push	ebp
	mov	ebp, esp
	sub	esp, 32					; 00000020H
	mov	DWORD PTR _this$[ebp], ecx
; Line 336
	mov	DWORD PTR _hashValue$[ebp], 0
; Line 337
	mov	DWORD PTR _gettime$[ebp], 0
; Line 338
	mov	DWORD PTR _retcode$[ebp], 0
; Line 342
	mov	eax, DWORD PTR _TCBRecordNum$[ebp]
	imul	eax, 288				; 00000120H
	mov	ecx, DWORD PTR ?TCBBase@TCPObj@@0KA	; TCPObj::TCBBase
	add	ecx, eax
	mov	DWORD PTR _tcb$[ebp], ecx
; Line 344
	mov	edx, 1
	test	edx, edx
	je	$L2287
; Line 346
	push	7
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+124]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	mov	edx, DWORD PTR _tcb$[ebp]
	sub	eax, DWORD PTR [edx+32]
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
; Line 347
	push	15					; 0000000fH
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+124]
	push	ecx
	push	-572662307				; ddddddddH
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
; Line 348
	push	4
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+124]
	push	eax
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+24]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
; Line 349
	push	17					; 00000011H
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+124]
	push	ecx
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+272]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
; Line 350
	push	14					; 0000000eH
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+124]
	push	edx
	mov	eax, DWORD PTR _retpoint$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
$L2287:
; Line 353
	push	3860					; 00000f14H
	mov	ecx, DWORD PTR ?traceGlobalIndex@TCPObj@@2HA ; TCPObj::traceGlobalIndex
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 354
	mov	edx, DWORD PTR ?TotalDelCount@TCPObj@@2KA ; TCPObj::TotalDelCount
	add	edx, 1
	mov	DWORD PTR ?TotalDelCount@TCPObj@@2KA, edx ; TCPObj::TotalDelCount
; Line 356
	mov	eax, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [eax+64], 0
	jne	SHORT $L2288
; Line 358
	mov	ecx, DWORD PTR ?UnMatchedRequests@TCPObj@@2HA ; TCPObj::UnMatchedRequests
	add	ecx, 1
	mov	DWORD PTR ?UnMatchedRequests@TCPObj@@2HA, ecx ; TCPObj::UnMatchedRequests
$L2288:
; Line 367
	mov	edx, 1
	test	edx, edx
	je	SHORT $L2291
; Line 369
	push	1860					; 00000744H
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+24]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 370
	push	2200					; 00000898H
	mov	edx, DWORD PTR ?UnMatchedRequests@TCPObj@@2HA ; TCPObj::UnMatchedRequests
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
$L2291:
; Line 374
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [eax+60]
	sub	edx, DWORD PTR [ecx+32]
	mov	DWORD PTR _gettime$[ebp], edx
; Line 375
	mov	eax, DWORD PTR _gettime$[ebp]
	cmp	eax, DWORD PTR ?MaxConnectionTime@TCPObj@@2KA ; TCPObj::MaxConnectionTime
	jbe	SHORT $L2292
	cmp	DWORD PTR _gettime$[ebp], 0
	jl	SHORT $L2292
; Line 376
	mov	ecx, DWORD PTR _gettime$[ebp]
	mov	DWORD PTR ?MaxConnectionTime@TCPObj@@2KA, ecx ; TCPObj::MaxConnectionTime
$L2292:
; Line 378
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [edx+44]
	sub	ecx, DWORD PTR [eax+32]
	mov	DWORD PTR _gettime$[ebp], ecx
; Line 379
	mov	edx, DWORD PTR ?TotalSynGetTime@TCPObj@@2KA ; TCPObj::TotalSynGetTime
	add	edx, DWORD PTR _gettime$[ebp]
	mov	DWORD PTR ?TotalSynGetTime@TCPObj@@2KA, edx ; TCPObj::TotalSynGetTime
; Line 380
	mov	eax, DWORD PTR _gettime$[ebp]
	cmp	eax, DWORD PTR ?MaxSynGetTime@TCPObj@@2KA ; TCPObj::MaxSynGetTime
	jbe	SHORT $L2294
	cmp	DWORD PTR _gettime$[ebp], 0
	jl	SHORT $L2294
; Line 382
	mov	ecx, DWORD PTR _gettime$[ebp]
	mov	DWORD PTR ?MaxSynGetTime@TCPObj@@2KA, ecx ; TCPObj::MaxSynGetTime
; Line 383
	cmp	DWORD PTR ?MaxSynGetTime@TCPObj@@2KA, 20000 ; TCPObj::MaxSynGetTime, 00004e20H
	jbe	SHORT $L2294
; Line 385
	mov	edx, DWORD PTR ?MaxSynGetThreshCount@TCPObj@@2KA ; TCPObj::MaxSynGetThreshCount
	add	edx, 1
	mov	DWORD PTR ?MaxSynGetThreshCount@TCPObj@@2KA, edx ; TCPObj::MaxSynGetThreshCount
$L2294:
; Line 392
	mov	eax, DWORD PTR ?TCBBase@TCPObj@@0KA	; TCPObj::TCBBase
	mov	DWORD PTR _TCBPointer$[ebp], eax
; Line 394
	mov	ecx, DWORD PTR _TCBRecordNum$[ebp]
	imul	ecx, 288				; 00000120H
	mov	edx, DWORD PTR _TCBPointer$[ebp]
	cmp	DWORD PTR [edx+ecx+24], 1
	jne	SHORT $L2296
; Line 396
	xor	eax, eax
	jmp	$L2277
$L2296:
; Line 398
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	mov	ecx, DWORD PTR _TCBRecordNum$[ebp]
	imul	ecx, 288				; 00000120H
	mov	edx, DWORD PTR _TCBPointer$[ebp]
	sub	eax, DWORD PTR [edx+ecx+264]
	mov	ecx, DWORD PTR ?averageconntime@TCPObj@@0KA ; TCPObj::averageconntime
	add	ecx, eax
	mov	DWORD PTR ?averageconntime@TCPObj@@0KA, ecx ; TCPObj::averageconntime
; Line 399
	mov	edx, DWORD PTR _TCBRecordNum$[ebp]
	imul	edx, 288				; 00000120H
	mov	eax, DWORD PTR _TCBPointer$[ebp]
	mov	DWORD PTR [eax+edx+24], 1
; Line 401
	mov	ecx, DWORD PTR _TCBRecordNum$[ebp]
	imul	ecx, 288				; 00000120H
	mov	edx, DWORD PTR _TCBPointer$[ebp]
	mov	DWORD PTR [edx+ecx], 0
; Line 402
	mov	eax, DWORD PTR _TCBRecordNum$[ebp]
	imul	eax, 288				; 00000120H
	mov	ecx, DWORD PTR _TCBPointer$[ebp]
	mov	DWORD PTR [ecx+eax+8], -1
; Line 403
	mov	edx, DWORD PTR _TCBRecordNum$[ebp]
	imul	edx, 288				; 00000120H
	mov	eax, DWORD PTR _TCBPointer$[ebp]
	mov	DWORD PTR [eax+edx+4], -1
; Line 404
	mov	ecx, DWORD PTR _TCBRecordNum$[ebp]
	imul	ecx, 288				; 00000120H
	mov	edx, DWORD PTR _TCBPointer$[ebp]
	mov	DWORD PTR [edx+ecx+64], 0
; Line 409
	mov	eax, DWORD PTR _TCBRecordNum$[ebp]
	imul	eax, 288				; 00000120H
	mov	ecx, DWORD PTR _TCBPointer$[ebp]
	mov	edx, DWORD PTR [ecx+eax+256]
	mov	DWORD PTR _prev$[ebp], edx
; Line 410
	mov	eax, DWORD PTR _TCBRecordNum$[ebp]
	imul	eax, 288				; 00000120H
	mov	ecx, DWORD PTR _TCBPointer$[ebp]
	mov	edx, DWORD PTR [ecx+eax+260]
	mov	DWORD PTR _next$[ebp], edx
; Line 411
	mov	eax, DWORD PTR _TCBRecordNum$[ebp]
	imul	eax, 288				; 00000120H
	mov	ecx, DWORD PTR _TCBPointer$[ebp]
	lea	edx, DWORD PTR [ecx+eax+18]
	push	edx
	mov	eax, DWORD PTR _TCBRecordNum$[ebp]
	imul	eax, 288				; 00000120H
	mov	ecx, DWORD PTR _TCBPointer$[ebp]
	lea	edx, DWORD PTR [ecx+eax+20]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 328				; 00000148H
	call	?hashfun@TcphashIndex@@QAEJPAD0@Z	; TcphashIndex::hashfun
	mov	DWORD PTR _hashValue$[ebp], eax
; Line 412
	cmp	DWORD PTR _next$[ebp], -1
	jne	SHORT $L2298
	cmp	DWORD PTR _prev$[ebp], -1
	jne	SHORT $L2298
; Line 415
	push	-1
	mov	eax, DWORD PTR _hashValue$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 328				; 00000148H
	call	?setIndex@TcphashIndex@@QAEJJJ@Z	; TcphashIndex::setIndex
$L2298:
; Line 417
	cmp	DWORD PTR _next$[ebp], -1
	jne	SHORT $L2299
	cmp	DWORD PTR _prev$[ebp], -1
	jle	SHORT $L2299
; Line 420
	mov	ecx, DWORD PTR _prev$[ebp]
	imul	ecx, 288				; 00000120H
	mov	edx, DWORD PTR _TCBPointer$[ebp]
	mov	DWORD PTR [edx+ecx+260], -1
$L2299:
; Line 422
	cmp	DWORD PTR _next$[ebp], -1
	jle	SHORT $L2300
	cmp	DWORD PTR _prev$[ebp], -1
	jne	SHORT $L2300
; Line 425
	mov	eax, DWORD PTR _next$[ebp]
	push	eax
	mov	ecx, DWORD PTR _hashValue$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 328				; 00000148H
	call	?setIndex@TcphashIndex@@QAEJJJ@Z	; TcphashIndex::setIndex
; Line 426
	mov	edx, DWORD PTR _next$[ebp]
	imul	edx, 288				; 00000120H
	mov	eax, DWORD PTR _TCBPointer$[ebp]
	mov	DWORD PTR [eax+edx+256], -1
$L2300:
; Line 429
	cmp	DWORD PTR _next$[ebp], -1
	jle	SHORT $L2301
	cmp	DWORD PTR _prev$[ebp], -1
	jle	SHORT $L2301
; Line 431
	mov	ecx, DWORD PTR _next$[ebp]
	imul	ecx, 288				; 00000120H
	mov	edx, DWORD PTR _TCBPointer$[ebp]
	mov	eax, DWORD PTR _prev$[ebp]
	mov	DWORD PTR [edx+ecx+256], eax
; Line 432
	mov	ecx, DWORD PTR _prev$[ebp]
	imul	ecx, 288				; 00000120H
	mov	edx, DWORD PTR _TCBPointer$[ebp]
	mov	eax, DWORD PTR _next$[ebp]
	mov	DWORD PTR [edx+ecx+260], eax
$L2301:
; Line 434
	cmp	DWORD PTR ?FreeList@TCPObj@@0JA, -1	; TCPObj::FreeList
	je	SHORT $L2302
; Line 436
	mov	ecx, DWORD PTR ?FreeList@TCPObj@@0JA	; TCPObj::FreeList
	imul	ecx, 288				; 00000120H
	mov	edx, DWORD PTR _TCBPointer$[ebp]
	mov	eax, DWORD PTR _TCBRecordNum$[ebp]
	mov	DWORD PTR [edx+ecx+256], eax
; Line 437
	mov	ecx, DWORD PTR _TCBRecordNum$[ebp]
	imul	ecx, 288				; 00000120H
	mov	edx, DWORD PTR _TCBPointer$[ebp]
	mov	eax, DWORD PTR ?FreeList@TCPObj@@0JA	; TCPObj::FreeList
	mov	DWORD PTR [edx+ecx+260], eax
; Line 439
	jmp	SHORT $L2303
$L2302:
; Line 441
	mov	ecx, DWORD PTR _TCBRecordNum$[ebp]
	imul	ecx, 288				; 00000120H
	mov	edx, DWORD PTR _TCBPointer$[ebp]
	mov	DWORD PTR [edx+ecx+260], -1
$L2303:
; Line 443
	mov	eax, DWORD PTR _TCBRecordNum$[ebp]
	imul	eax, 288				; 00000120H
	mov	ecx, DWORD PTR _TCBPointer$[ebp]
	mov	DWORD PTR [ecx+eax+256], -1
; Line 444
	mov	edx, DWORD PTR _TCBRecordNum$[ebp]
	mov	DWORD PTR ?FreeList@TCPObj@@0JA, edx	; TCPObj::FreeList
; Line 446
	mov	eax, DWORD PTR ?TCBCount@TCPObj@@0JA	; TCPObj::TCBCount
	sub	eax, 1
	mov	DWORD PTR ?TCBCount@TCPObj@@0JA, eax	; TCPObj::TCBCount
; Line 448
	xor	eax, eax
$L2277:
; Line 449
	mov	esp, ebp
	pop	ebp
	ret	8
?DeleteTCB@TCPObj@@QAEHHH@Z ENDP			; TCPObj::DeleteTCB
_TEXT	ENDS
PUBLIC	?GetTCB@TCPObj@@AAEHHPAJ@Z			; TCPObj::GetTCB
_TEXT	SEGMENT
_TCBRecordNum$ = 8
_tcb$ = 12
_this$ = -296
_TCBPointer$ = -4
?GetTCB@TCPObj@@AAEHHPAJ@Z PROC NEAR			; TCPObj::GetTCB
; Line 454
	push	ebp
	mov	ebp, esp
	sub	esp, 296				; 00000128H
	mov	DWORD PTR _this$[ebp], ecx
; Line 456
	mov	eax, DWORD PTR _TCBRecordNum$[ebp]
	imul	eax, 288				; 00000120H
	mov	ecx, DWORD PTR ?TCBBase@TCPObj@@0KA	; TCPObj::TCBBase
	add	ecx, eax
	mov	DWORD PTR _TCBPointer$[ebp], ecx
; Line 458
	mov	edx, DWORD PTR _TCBPointer$[ebp]
	cmp	DWORD PTR [edx], 1
	jne	SHORT $L2313
; Line 460
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR _TCBPointer$[ebp]
	mov	DWORD PTR [eax], ecx
; Line 461
	xor	eax, eax
	jmp	SHORT $L2308
$L2313:
; Line 463
	or	eax, -1
$L2308:
; Line 464
	mov	esp, ebp
	pop	ebp
	ret	8
?GetTCB@TCPObj@@AAEHHPAJ@Z ENDP				; TCPObj::GetTCB
_TEXT	ENDS
PUBLIC	?greaterEqualto@TCPObj@@AAEHKK@Z		; TCPObj::greaterEqualto
_TEXT	SEGMENT
_x$ = 8
_y$ = 12
_this$ = -4
?greaterEqualto@TCPObj@@AAEHKK@Z PROC NEAR		; TCPObj::greaterEqualto
; Line 474
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 475
	mov	eax, DWORD PTR _x$[ebp]
	cmp	eax, DWORD PTR _y$[ebp]
	jne	SHORT $L2320
; Line 477
	xor	eax, eax
	jmp	SHORT $L2319
$L2320:
; Line 479
	mov	ecx, DWORD PTR _x$[ebp]
	cmp	ecx, DWORD PTR _y$[ebp]
	jbe	SHORT $L2322
; Line 481
	mov	eax, DWORD PTR _x$[ebp]
	sub	eax, DWORD PTR _y$[ebp]
	jmp	SHORT $L2319
$L2322:
; Line 483
	mov	edx, DWORD PTR _x$[ebp]
	cmp	edx, DWORD PTR _y$[ebp]
	jae	SHORT $L2324
; Line 486
	or	eax, -1
	jmp	SHORT $L2319
$L2324:
; Line 488
	or	eax, -1
$L2319:
; Line 490
	mov	esp, ebp
	pop	ebp
	ret	8
?greaterEqualto@TCPObj@@AAEHKK@Z ENDP			; TCPObj::greaterEqualto
_TEXT	ENDS
PUBLIC	?TCPHandler@TCPObj@@QAEHPADH00H0JH@Z		; TCPObj::TCPHandler
PUBLIC	?SearchTCB@TCPObj@@AAEHQAD0@Z			; TCPObj::SearchTCB
PUBLIC	?OtherHandler@TCPObj@@AAEHPADHHJH@Z		; TCPObj::OtherHandler
PUBLIC	?FormatHeader@TCPObj@@AAEXPAD0@Z		; TCPObj::FormatHeader
PUBLIC	?ListenHandler@TCPObj@@AAEHPADH000JH@Z		; TCPObj::ListenHandler
PUBLIC	?TCPChecksum@TCPObj@@AAEGPADJ00I@Z		; TCPObj::TCPChecksum
EXTRN	?AOAPrintText@AOAProtected@@QAEXPADH@Z:NEAR	; AOAProtected::AOAPrintText
_DATA	SEGMENT
$SG2359	DB	'Reset here new code 1', 00H
	ORG $+2
$SG2362	DB	'Reset here new code 2', 00H
_DATA	ENDS
_TEXT	SEGMENT
_TCPPack$ = 8
_size$ = 12
_SourceIP$ = 16
_TargetIP$ = 20
_Protocol$ = 24
_macaddr$ = 28
_timer$ = 32
_currenttask$ = 36
_this$ = -548
_chsum1$ = -544
_chsum2$ = -12
_checksum$ = -8
_SrcPortNum$ = -540
_TCBRecordNum$ = -16
_Header$ = -528
_tcp$ = -532
_tcb$ = -536
_retcode$ = -4
?TCPHandler@TCPObj@@QAEHPADH00H0JH@Z PROC NEAR		; TCPObj::TCPHandler
; Line 500
	push	ebp
	mov	ebp, esp
	sub	esp, 548				; 00000224H
	mov	DWORD PTR _this$[ebp], ecx
; Line 503
	mov	DWORD PTR _checksum$[ebp], 0
; Line 508
	lea	eax, DWORD PTR _Header$[ebp]
	mov	DWORD PTR _tcp$[ebp], eax
; Line 509
	mov	ecx, DWORD PTR _TCPPack$[ebp]
	push	ecx
	lea	edx, DWORD PTR _Header$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?FormatHeader@TCPObj@@AAEXPAD0@Z	; TCPObj::FormatHeader
; Line 511
	mov	DWORD PTR _retcode$[ebp], 0
; Line 513
	cmp	DWORD PTR _size$[ebp], 20		; 00000014H
	jge	SHORT $L2346
; Line 515
	mov	eax, -17				; ffffffefH
	jmp	$L2335
$L2346:
; Line 519
	mov	eax, DWORD PTR _TCPPack$[ebp]
	movsx	ecx, BYTE PTR [eax+2]
	test	ecx, ecx
	jne	SHORT $L2348
	mov	edx, DWORD PTR _TCPPack$[ebp]
	movsx	eax, BYTE PTR [edx+3]
	cmp	eax, 80					; 00000050H
	je	SHORT $L2347
$L2348:
; Line 521
	mov	eax, -18				; ffffffeeH
	jmp	$L2335
$L2347:
; Line 525
	mov	ecx, DWORD PTR _TCPPack$[ebp]
	mov	dl, BYTE PTR [ecx+16]
	mov	BYTE PTR _chsum1$[ebp], dl
; Line 526
	mov	eax, DWORD PTR _TCPPack$[ebp]
	mov	cl, BYTE PTR [eax+17]
	mov	BYTE PTR _chsum1$[ebp+1], cl
; Line 529
	mov	edx, DWORD PTR _Protocol$[ebp]
	push	edx
	mov	eax, DWORD PTR _TargetIP$[ebp]
	push	eax
	mov	ecx, DWORD PTR _SourceIP$[ebp]
	push	ecx
	mov	edx, DWORD PTR _size$[ebp]
	push	edx
	mov	eax, DWORD PTR _TCPPack$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?TCPChecksum@TCPObj@@AAEGPADJ00I@Z	; TCPObj::TCPChecksum
	and	eax, 65535				; 0000ffffH
	mov	DWORD PTR _checksum$[ebp], eax
; Line 531
	mov	ecx, DWORD PTR _checksum$[ebp]
	sar	ecx, 8
	and	ecx, 255				; 000000ffH
	mov	BYTE PTR _chsum2$[ebp], cl
; Line 532
	mov	edx, DWORD PTR _checksum$[ebp]
	and	edx, 255				; 000000ffH
	mov	BYTE PTR _chsum2$[ebp+1], dl
; Line 535
	movsx	eax, BYTE PTR _chsum1$[ebp]
	movsx	ecx, BYTE PTR _chsum2$[ebp]
	cmp	eax, ecx
	jne	SHORT $L2352
	movsx	edx, BYTE PTR _chsum1$[ebp+1]
	movsx	eax, BYTE PTR _chsum2$[ebp+1]
	cmp	edx, eax
	je	SHORT $L2351
$L2352:
; Line 537
	mov	eax, -19				; ffffffedH
	jmp	$L2335
$L2351:
; Line 541
	mov	ecx, DWORD PTR _TCPPack$[ebp]
	mov	dl, BYTE PTR [ecx]
	mov	BYTE PTR _SrcPortNum$[ebp], dl
; Line 542
	mov	eax, DWORD PTR _TCPPack$[ebp]
	mov	cl, BYTE PTR [eax+1]
	mov	BYTE PTR _SrcPortNum$[ebp+1], cl
; Line 545
	lea	edx, DWORD PTR _SrcPortNum$[ebp]
	push	edx
	mov	eax, DWORD PTR _SourceIP$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?SearchTCB@TCPObj@@AAEHQAD0@Z		; TCPObj::SearchTCB
	mov	DWORD PTR _TCBRecordNum$[ebp], eax
; Line 547
	cmp	DWORD PTR _TCBRecordNum$[ebp], -1
	je	$L2356
; Line 549
	mov	ecx, DWORD PTR _TCBRecordNum$[ebp]
	imul	ecx, 288				; 00000120H
	mov	edx, DWORD PTR ?TCBBase@TCPObj@@0KA	; TCPObj::TCBBase
	add	edx, ecx
	mov	DWORD PTR _tcb$[ebp], edx
; Line 550
	mov	eax, DWORD PTR _tcp$[ebp]
	movsx	ecx, BYTE PTR [eax+13]
	and	ecx, 4
	cmp	ecx, 4
	jne	$L2356
; Line 553
	mov	edx, 1
	test	edx, edx
	je	SHORT $L2357
; Line 554
	push	72					; 00000048H
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+124]
	push	ecx
	push	-1073741823				; c0000001H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
$L2357:
; Line 556
	mov	edx, DWORD PTR ?NoOfResets@TCPObj@@2HA	; TCPObj::NoOfResets
	add	edx, 1
	mov	DWORD PTR ?NoOfResets@TCPObj@@2HA, edx	; TCPObj::NoOfResets
; Line 557
	mov	eax, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [eax+64], 0
	jne	SHORT $L2358
; Line 559
	push	3860					; 00000f14H
	push	OFFSET FLAT:$SG2359
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 560
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+76], 1
; Line 561
	mov	eax, -45				; ffffffd3H
	jmp	$L2335
$L2358:
; Line 568
	mov	edx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [edx+68], 1
	jne	SHORT $L2361
; Line 570
	push	3860					; 00000f14H
	push	OFFSET FLAT:$SG2362
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 571
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+72], 1
; Line 572
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+76], 1
; Line 573
	mov	eax, -49				; ffffffcfH
	jmp	$L2335
$L2361:
; Line 576
	push	1
	mov	edx, DWORD PTR _TCBRecordNum$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DeleteTCB@TCPObj@@QAEHHH@Z		; TCPObj::DeleteTCB
; Line 578
	mov	DWORD PTR _TCBRecordNum$[ebp], -1
; Line 579
	mov	eax, -48				; ffffffd0H
	jmp	SHORT $L2335
$L2356:
; Line 587
	cmp	DWORD PTR _TCBRecordNum$[ebp], -1
	jne	SHORT $L2364
; Line 592
	mov	eax, DWORD PTR _currenttask$[ebp]
	push	eax
	mov	ecx, DWORD PTR _timer$[ebp]
	push	ecx
	mov	edx, DWORD PTR _macaddr$[ebp]
	push	edx
	mov	eax, DWORD PTR _TargetIP$[ebp]
	push	eax
	mov	ecx, DWORD PTR _SourceIP$[ebp]
	push	ecx
	mov	edx, DWORD PTR _size$[ebp]
	push	edx
	mov	eax, DWORD PTR _TCPPack$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?ListenHandler@TCPObj@@AAEHPADH000JH@Z	; TCPObj::ListenHandler
	mov	DWORD PTR _retcode$[ebp], eax
; Line 593
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	SHORT $L2335
$L2364:
; Line 600
	lea	ecx, DWORD PTR _tcb$[ebp]
	push	ecx
	mov	edx, DWORD PTR _TCBRecordNum$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?GetTCB@TCPObj@@AAEHHPAJ@Z		; TCPObj::GetTCB
	test	eax, eax
	je	SHORT $L2367
; Line 602
	mov	eax, -20				; ffffffecH
	jmp	SHORT $L2335
$L2367:
; Line 605
	mov	eax, DWORD PTR _currenttask$[ebp]
	push	eax
	mov	ecx, DWORD PTR _timer$[ebp]
	push	ecx
	mov	edx, DWORD PTR _TCBRecordNum$[ebp]
	push	edx
	mov	eax, DWORD PTR _size$[ebp]
	push	eax
	mov	ecx, DWORD PTR _TCPPack$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?OtherHandler@TCPObj@@AAEHPADHHJH@Z	; TCPObj::OtherHandler
	mov	DWORD PTR _retcode$[ebp], eax
; Line 606
	mov	eax, DWORD PTR _retcode$[ebp]
$L2335:
; Line 610
	mov	esp, ebp
	pop	ebp
	ret	32					; 00000020H
?TCPHandler@TCPObj@@QAEHPADH00H0JH@Z ENDP		; TCPObj::TCPHandler
_TEXT	ENDS
PUBLIC	?charToseqnum@TCPObj@@AAEKPAD@Z			; TCPObj::charToseqnum
PUBLIC	?charToWindow@TCPObj@@AAEGPAD@Z			; TCPObj::charToWindow
PUBLIC	?SendMisc@TCPObj@@AAEHPAD0D0HH@Z		; TCPObj::SendMisc
PUBLIC	?SendMisc@TCPObj@@AAEHPAD0KD0HH@Z		; TCPObj::SendMisc
PUBLIC	?SendMisc@TCPObj@@AAEHPAD00H@Z			; TCPObj::SendMisc
EXTRN	?getRandomAoA@random@@QAEHH@Z:NEAR		; random::getRandomAoA
EXTRN	??0EtherObj@@QAE@XZ:NEAR			; EtherObj::EtherObj
EXTRN	??0AOATask@@QAE@XZ:NEAR				; AOATask::AOATask
EXTRN	??0apptask@@QAE@XZ:NEAR				; apptask::apptask
_DATA	SEGMENT
	ORG $+2
$SG2396	DB	'TCBObj:TCB is full', 00H
_DATA	ENDS
_TEXT	SEGMENT
_TCPPack$ = 8
_SourceIP$ = 16
_TargetIP$ = 20
_macaddr$ = 24
_timer$ = 28
_currenttask$ = 32
_this$ = -800
_tcb$ = -496
_tsk$ = -436
_task$ = -484
_EO$ = -24
_SrcPortNum$ = -492
_status$ = -488
_temptcb$ = -784
_retcode$ = -8
_TCBRecordNum$ = -16
_tempseq$ = -4
_r$2390 = -792
_tcb$2397 = -796
?ListenHandler@TCPObj@@AAEHPADH000JH@Z PROC NEAR	; TCPObj::ListenHandler
; Line 617
	push	ebp
	mov	ebp, esp
	sub	esp, 800				; 00000320H
	mov	DWORD PTR _this$[ebp], ecx
; Line 620
	lea	ecx, DWORD PTR _tsk$[ebp]
	call	??0apptask@@QAE@XZ			; apptask::apptask
; Line 621
	lea	ecx, DWORD PTR _task$[ebp]
	call	??0AOATask@@QAE@XZ			; AOATask::AOATask
; Line 622
	lea	ecx, DWORD PTR _EO$[ebp]
	call	??0EtherObj@@QAE@XZ			; EtherObj::EtherObj
; Line 628
	mov	DWORD PTR _retcode$[ebp], 0
; Line 629
	mov	DWORD PTR _TCBRecordNum$[ebp], 0
; Line 630
	mov	DWORD PTR _tempseq$[ebp], 0
; Line 634
	mov	eax, DWORD PTR _TCPPack$[ebp]
	movsx	ecx, BYTE PTR [eax+13]
	and	ecx, 2
	cmp	ecx, 2
	jne	$L2393
; Line 636
	mov	edx, DWORD PTR ?SynCount@TCPObj@@2KA	; TCPObj::SynCount
	add	edx, 1
	mov	DWORD PTR ?SynCount@TCPObj@@2KA, edx	; TCPObj::SynCount
; Line 639
	mov	eax, DWORD PTR _TCPPack$[ebp]
	mov	cl, BYTE PTR [eax]
	mov	BYTE PTR _SrcPortNum$[ebp], cl
; Line 640
	mov	edx, DWORD PTR _TCPPack$[ebp]
	mov	al, BYTE PTR [edx+1]
	mov	BYTE PTR _SrcPortNum$[ebp+1], al
; Line 643
	mov	DWORD PTR _temptcb$[ebp], 1
; Line 646
	mov	ecx, DWORD PTR _TCPPack$[ebp]
	mov	dl, BYTE PTR [ecx]
	mov	BYTE PTR _temptcb$[ebp+18], dl
; Line 647
	mov	eax, DWORD PTR _TCPPack$[ebp]
	mov	cl, BYTE PTR [eax+1]
	mov	BYTE PTR _temptcb$[ebp+19], cl
; Line 648
	mov	edx, DWORD PTR _SourceIP$[ebp]
	mov	al, BYTE PTR [edx]
	mov	BYTE PTR _temptcb$[ebp+20], al
; Line 649
	mov	ecx, DWORD PTR _SourceIP$[ebp]
	mov	dl, BYTE PTR [ecx+1]
	mov	BYTE PTR _temptcb$[ebp+21], dl
; Line 650
	mov	eax, DWORD PTR _SourceIP$[ebp]
	mov	cl, BYTE PTR [eax+2]
	mov	BYTE PTR _temptcb$[ebp+22], cl
; Line 651
	mov	edx, DWORD PTR _SourceIP$[ebp]
	mov	al, BYTE PTR [edx+3]
	mov	BYTE PTR _temptcb$[ebp+23], al
; Line 654
	mov	ecx, DWORD PTR _macaddr$[ebp]
	mov	dl, BYTE PTR [ecx]
	mov	BYTE PTR _temptcb$[ebp+12], dl
; Line 655
	mov	eax, DWORD PTR _macaddr$[ebp]
	mov	cl, BYTE PTR [eax+1]
	mov	BYTE PTR _temptcb$[ebp+13], cl
; Line 656
	mov	edx, DWORD PTR _macaddr$[ebp]
	mov	al, BYTE PTR [edx+2]
	mov	BYTE PTR _temptcb$[ebp+14], al
; Line 657
	mov	ecx, DWORD PTR _macaddr$[ebp]
	mov	dl, BYTE PTR [ecx+3]
	mov	BYTE PTR _temptcb$[ebp+15], dl
; Line 658
	mov	eax, DWORD PTR _macaddr$[ebp]
	mov	cl, BYTE PTR [eax+4]
	mov	BYTE PTR _temptcb$[ebp+16], cl
; Line 659
	mov	edx, DWORD PTR _macaddr$[ebp]
	mov	al, BYTE PTR [edx+5]
	mov	BYTE PTR _temptcb$[ebp+17], al
; Line 661
	mov	DWORD PTR _temptcb$[ebp+24], 3
; Line 662
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	mov	DWORD PTR _temptcb$[ebp+264], eax
; Line 663
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	push	eax
	lea	ecx, DWORD PTR _r$2390[ebp]
	call	??0random@@QAE@H@Z			; random::random
; Line 664
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	push	eax
	lea	ecx, DWORD PTR _r$2390[ebp]
	call	?getRandomAoA@random@@QAEHH@Z		; random::getRandomAoA
	mov	DWORD PTR _temptcb$[ebp+136], eax
; Line 665
	mov	ecx, DWORD PTR _temptcb$[ebp+136]
	mov	DWORD PTR _temptcb$[ebp+96], ecx
; Line 666
	mov	edx, DWORD PTR _temptcb$[ebp+96]
	add	edx, 1
	mov	DWORD PTR _temptcb$[ebp+100], edx
; Line 668
	mov	eax, DWORD PTR _TCPPack$[ebp]
	add	eax, 14					; 0000000eH
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?charToWindow@TCPObj@@AAEGPAD@Z		; TCPObj::charToWindow
	and	eax, 65535				; 0000ffffH
	mov	DWORD PTR _temptcb$[ebp+104], eax
; Line 669
	mov	DWORD PTR _temptcb$[ebp+148], 0
; Line 672
	mov	DWORD PTR _temptcb$[ebp+128], 0
; Line 673
	mov	DWORD PTR _temptcb$[ebp+132], -1
; Line 675
	mov	ecx, DWORD PTR _TCPPack$[ebp]
	add	ecx, 4
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?charToseqnum@TCPObj@@AAEKPAD@Z		; TCPObj::charToseqnum
	mov	DWORD PTR _temptcb$[ebp+144], eax
; Line 677
	mov	edx, DWORD PTR _temptcb$[ebp+144]
	add	edx, 1
	mov	DWORD PTR _temptcb$[ebp+112], edx
; Line 678
	mov	DWORD PTR _temptcb$[ebp+140], 1500	; 000005dcH
; Line 679
	mov	DWORD PTR _temptcb$[ebp+28], 0
; Line 680
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	mov	DWORD PTR _temptcb$[ebp+108], eax
; Line 681
	mov	DWORD PTR _temptcb$[ebp+80], 0
; Line 682
	mov	DWORD PTR _temptcb$[ebp+156], 0
; Line 683
	mov	DWORD PTR _temptcb$[ebp+120], 0
; Line 684
	mov	DWORD PTR _temptcb$[ebp+84], 0
; Line 685
	mov	DWORD PTR _temptcb$[ebp+88], 0
; Line 686
	mov	DWORD PTR _temptcb$[ebp+160], 0
; Line 687
	mov	DWORD PTR _temptcb$[ebp+164], 0
; Line 688
	mov	DWORD PTR _temptcb$[ebp+168], 0
; Line 689
	mov	DWORD PTR _temptcb$[ebp+172], 0
; Line 690
	mov	DWORD PTR _temptcb$[ebp+176], 0
; Line 691
	mov	DWORD PTR _temptcb$[ebp+180], 0
; Line 692
	mov	DWORD PTR _temptcb$[ebp+152], 0
; Line 693
	mov	DWORD PTR _temptcb$[ebp+248], 0
; Line 694
	mov	DWORD PTR _temptcb$[ebp+80], 0
; Line 695
	mov	DWORD PTR _temptcb$[ebp+252], 0
; Line 696
	mov	DWORD PTR _temptcb$[ebp+4], -1
; Line 697
	mov	DWORD PTR _temptcb$[ebp+8], -1
; Line 698
	mov	DWORD PTR _temptcb$[ebp+188], 0
; Line 699
	mov	DWORD PTR _temptcb$[ebp+192], 0
; Line 700
	mov	DWORD PTR _temptcb$[ebp+196], 0
; Line 702
	mov	DWORD PTR _temptcb$[ebp+200], 0
; Line 703
	mov	DWORD PTR _temptcb$[ebp+204], 0
; Line 704
	mov	DWORD PTR _temptcb$[ebp+208], 0
; Line 705
	mov	DWORD PTR _temptcb$[ebp+212], 0
; Line 706
	mov	DWORD PTR _temptcb$[ebp+216], 0
; Line 707
	mov	DWORD PTR _temptcb$[ebp+220], 0
; Line 708
	mov	DWORD PTR _temptcb$[ebp+224], 0
; Line 709
	mov	DWORD PTR _temptcb$[ebp+284], 0
; Line 710
	mov	DWORD PTR _temptcb$[ebp+276], 0
; Line 711
	mov	DWORD PTR _temptcb$[ebp+272], 0
; Line 712
	mov	DWORD PTR _temptcb$[ebp+228], 0
; Line 713
	mov	DWORD PTR _temptcb$[ebp+232], 0
; Line 714
	mov	DWORD PTR _temptcb$[ebp+236], 0
; Line 715
	mov	DWORD PTR _temptcb$[ebp+76], 0
; Line 716
	mov	DWORD PTR _temptcb$[ebp+68], 0
; Line 717
	mov	DWORD PTR _temptcb$[ebp+72], 0
; Line 718
	mov	DWORD PTR _temptcb$[ebp+64], 0
; Line 719
	mov	DWORD PTR _temptcb$[ebp+92], 0
; Line 720
	mov	DWORD PTR _temptcb$[ebp+92], 0
; Line 721
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	mov	DWORD PTR _temptcb$[ebp+32], eax
; Line 722
	mov	DWORD PTR _temptcb$[ebp+36], 0
; Line 723
	mov	DWORD PTR _temptcb$[ebp+40], 0
; Line 724
	mov	DWORD PTR _temptcb$[ebp+44], 0
; Line 725
	mov	DWORD PTR _temptcb$[ebp+48], 0
; Line 726
	mov	DWORD PTR _temptcb$[ebp+52], 0
; Line 727
	mov	DWORD PTR _temptcb$[ebp+56], 0
; Line 728
	mov	DWORD PTR _temptcb$[ebp+60], 0
; Line 729
	mov	eax, DWORD PTR ?traceGlobalIndex@TCPObj@@2HA ; TCPObj::traceGlobalIndex
	add	eax, 1
	mov	DWORD PTR ?traceGlobalIndex@TCPObj@@2HA, eax ; TCPObj::traceGlobalIndex
; Line 730
	mov	ecx, DWORD PTR ?traceGlobalIndex@TCPObj@@2HA ; TCPObj::traceGlobalIndex
	mov	DWORD PTR _temptcb$[ebp+124], ecx
; Line 732
	lea	edx, DWORD PTR _temptcb$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?InsertTCB@TCPObj@@AAEHPAUTCBRecord@1@@Z ; TCPObj::InsertTCB
	mov	DWORD PTR _status$[ebp], eax
; Line 735
	cmp	DWORD PTR _status$[ebp], -1
	jne	SHORT $L2392
; Line 742
	mov	eax, DWORD PTR _TCPPack$[ebp]
	add	eax, 8
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?charToseqnum@TCPObj@@AAEKPAD@Z		; TCPObj::charToseqnum
	mov	DWORD PTR _tempseq$[ebp], eax
; Line 743
	mov	ecx, DWORD PTR _currenttask$[ebp]
	push	ecx
	push	6
	mov	edx, DWORD PTR _macaddr$[ebp]
	push	edx
	push	4
	mov	eax, DWORD PTR _tempseq$[ebp]
	push	eax
	mov	ecx, DWORD PTR _TCPPack$[ebp]
	push	ecx
	mov	edx, DWORD PTR _SourceIP$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?SendMisc@TCPObj@@AAEHPAD0KD0HH@Z	; TCPObj::SendMisc
	mov	DWORD PTR _retcode$[ebp], eax
; Line 744
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L2377
$L2392:
; Line 754
	mov	eax, DWORD PTR _currenttask$[ebp]
	push	eax
	push	1
	mov	ecx, DWORD PTR _macaddr$[ebp]
	push	ecx
	push	18					; 00000012H
	mov	edx, DWORD PTR _TCPPack$[ebp]
	push	edx
	mov	eax, DWORD PTR _SourceIP$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?SendMisc@TCPObj@@AAEHPAD0D0HH@Z	; TCPObj::SendMisc
	mov	DWORD PTR _retcode$[ebp], eax
; Line 760
	mov	ecx, DWORD PTR ?TCBCount@TCPObj@@0JA	; TCPObj::TCBCount
	add	ecx, 1
	mov	DWORD PTR ?TCBCount@TCPObj@@0JA, ecx	; TCPObj::TCBCount
; Line 761
	mov	edx, DWORD PTR ?SynAckCount@TCPObj@@2KA	; TCPObj::SynAckCount
	add	edx, 1
	mov	DWORD PTR ?SynAckCount@TCPObj@@2KA, edx	; TCPObj::SynAckCount
; Line 762
	mov	eax, DWORD PTR ?TCBCount@TCPObj@@0JA	; TCPObj::TCBCount
	cmp	eax, DWORD PTR ?MaxNoOfTCBsUsed@TCPObj@@2KA ; TCPObj::MaxNoOfTCBsUsed
	jbe	SHORT $L2394
; Line 763
	mov	ecx, DWORD PTR ?TCBCount@TCPObj@@0JA	; TCPObj::TCBCount
	mov	DWORD PTR ?MaxNoOfTCBsUsed@TCPObj@@2KA, ecx ; TCPObj::MaxNoOfTCBsUsed
$L2394:
; Line 765
	mov	edx, DWORD PTR ?TCBCount@TCPObj@@0JA	; TCPObj::TCBCount
	cmp	edx, DWORD PTR ?TCBRecords@TCPObj@@0JA	; TCPObj::TCBRecords
	jl	SHORT $L2395
; Line 767
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG2396
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 768
	push	3760					; 00000eb0H
	mov	eax, DWORD PTR ?TCBCount@TCPObj@@0JA	; TCPObj::TCBCount
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
$L2395:
; Line 771
	lea	ecx, DWORD PTR _SrcPortNum$[ebp]
	push	ecx
	mov	edx, DWORD PTR _SourceIP$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?SearchTCB@TCPObj@@AAEHQAD0@Z		; TCPObj::SearchTCB
	mov	DWORD PTR _TCBRecordNum$[ebp], eax
; Line 774
	mov	eax, DWORD PTR _TCBRecordNum$[ebp]
	imul	eax, 288				; 00000120H
	mov	ecx, DWORD PTR ?TCBBase@TCPObj@@0KA	; TCPObj::TCBBase
	add	ecx, eax
	mov	DWORD PTR _tcb$2397[ebp], ecx
; Line 778
	mov	edx, DWORD PTR _tcb$2397[ebp]
	mov	eax, DWORD PTR [edx+100]
	add	eax, 1
	mov	ecx, DWORD PTR _tcb$2397[ebp]
	mov	DWORD PTR [ecx+100], eax
; Line 779
	mov	edx, DWORD PTR _tcb$2397[ebp]
	mov	eax, DWORD PTR _timer$[ebp]
	mov	DWORD PTR [edx+32], eax
; Line 780
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	mov	ecx, DWORD PTR _tcb$2397[ebp]
	mov	DWORD PTR [ecx+36], eax
; Line 781
	mov	edx, DWORD PTR _TCPPack$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?charToseqnum@TCPObj@@AAEKPAD@Z		; TCPObj::charToseqnum
	mov	DWORD PTR _tempseq$[ebp], eax
; Line 782
	mov	eax, 1
	test	eax, eax
	je	SHORT $L2400
; Line 784
	push	48					; 00000030H
	mov	ecx, DWORD PTR _tcb$2397[ebp]
	mov	edx, DWORD PTR [ecx+124]
	push	edx
	push	-1610612735				; a0000001H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
; Line 785
	push	0
	mov	eax, DWORD PTR _tcb$2397[ebp]
	mov	ecx, DWORD PTR [eax+124]
	push	ecx
	mov	edx, DWORD PTR _TCBRecordNum$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
; Line 786
	push	5
	mov	eax, DWORD PTR _tcb$2397[ebp]
	mov	ecx, DWORD PTR [eax+124]
	push	ecx
	mov	edx, DWORD PTR _tempseq$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
$L2400:
; Line 788
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L2377
$L2393:
; Line 797
	mov	eax, DWORD PTR _TCPPack$[ebp]
	movsx	ecx, BYTE PTR [eax+13]
	and	ecx, 17					; 00000011H
	cmp	ecx, 17					; 00000011H
	jne	SHORT $L2404
; Line 799
	mov	edx, DWORD PTR _TCBRecordNum$[ebp]
	imul	edx, 288				; 00000120H
	mov	eax, DWORD PTR ?TCBBase@TCPObj@@0KA	; TCPObj::TCBBase
	add	eax, edx
	mov	DWORD PTR _tcb$[ebp], eax
; Line 800
	mov	ecx, DWORD PTR _TCPPack$[ebp]
	add	ecx, 8
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?charToseqnum@TCPObj@@AAEKPAD@Z		; TCPObj::charToseqnum
	mov	DWORD PTR _tempseq$[ebp], eax
; Line 802
	mov	edx, DWORD PTR _currenttask$[ebp]
	push	edx
	mov	eax, DWORD PTR _macaddr$[ebp]
	push	eax
	mov	ecx, DWORD PTR _TargetIP$[ebp]
	push	ecx
	mov	edx, DWORD PTR _TCPPack$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?SendMisc@TCPObj@@AAEHPAD00H@Z		; TCPObj::SendMisc
	mov	DWORD PTR _retcode$[ebp], eax
; Line 803
	mov	eax, 1
	test	eax, eax
	je	SHORT $L2404
; Line 805
	push	40					; 00000028H
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+124]
	push	edx
	push	-1
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
$L2404:
; Line 827
	mov	edx, DWORD PTR _TCPPack$[ebp]
	movsx	eax, BYTE PTR [edx+13]
	and	eax, 1
	cmp	eax, 1
	jne	SHORT $L2409
; Line 838
	mov	ecx, DWORD PTR _TCBRecordNum$[ebp]
	imul	ecx, 288				; 00000120H
	mov	edx, DWORD PTR ?TCBBase@TCPObj@@0KA	; TCPObj::TCBBase
	add	edx, ecx
	mov	DWORD PTR _tcb$[ebp], edx
; Line 839
	mov	eax, DWORD PTR _currenttask$[ebp]
	push	eax
	push	6
	mov	ecx, DWORD PTR _macaddr$[ebp]
	push	ecx
	push	4
	mov	edx, DWORD PTR _TCPPack$[ebp]
	push	edx
	mov	eax, DWORD PTR _SourceIP$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?SendMisc@TCPObj@@AAEHPAD0D0HH@Z	; TCPObj::SendMisc
	mov	DWORD PTR _retcode$[ebp], eax
; Line 840
	mov	ecx, 1
	test	ecx, ecx
	je	SHORT $L2409
; Line 841
	push	73					; 00000049H
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+124]
	push	eax
	push	-536870910				; e0000002H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
$L2409:
; Line 845
	xor	eax, eax
$L2377:
; Line 846
	mov	esp, ebp
	pop	ebp
	ret	28					; 0000001cH
?ListenHandler@TCPObj@@AAEHPADH000JH@Z ENDP		; TCPObj::ListenHandler
_TEXT	ENDS
PUBLIC	?mod32cmp@TCPObj@@AAEKKK@Z			; TCPObj::mod32cmp
PUBLIC	?SendMiscKA@TCPObj@@AAEHPAD0D0HKH@Z		; TCPObj::SendMiscKA
PUBLIC	??0WCirList@@QAE@XZ				; WCirList::WCirList
EXTRN	?MinTaskId@apptask@@2JA:DWORD			; apptask::MinTaskId
EXTRN	?insertHttpTask@apptask@@QAEHHJ@Z:NEAR		; apptask::insertHttpTask
EXTRN	?insert@WTTrace@@QAEHHG@Z:NEAR			; WTTrace::insert
EXTRN	??0AOAProtected@@QAE@XZ:NEAR			; AOAProtected::AOAProtected
EXTRN	?AOAMaskRunRegister@AOAProtected@@QAEHHH@Z:NEAR	; AOAProtected::AOAMaskRunRegister
_DATA	SEGMENT
	ORG $+1
$SG2602	DB	'DD', 00H
_DATA	ENDS
_TEXT	SEGMENT
_TCPPack$ = 8
_size$ = 12
_TCBRecordNumber$ = 16
_timerEth$ = 20
_currenttask$ = 24
_this$ = -1072
_task$ = -1036
_tsk$ = -964
_EO$ = -552
_cir$ = -1064
_io$ = -980
_retcode$ = -16
_SrcPortNum$ = -1056
_Acceptable_Flag$ = -32
_currtime$ = -1048
_Header$ = -544
_len$ = -1044
_i$ = -972
_ack1$ = -968
_tcp$ = -1040
_tcb$ = -1052
_i$2471 = -1068
?OtherHandler@TCPObj@@AAEHPADHHJH@Z PROC NEAR		; TCPObj::OtherHandler
; Line 852
	push	ebp
	mov	ebp, esp
	sub	esp, 1072				; 00000430H
	mov	DWORD PTR _this$[ebp], ecx
; Line 853
	lea	ecx, DWORD PTR _task$[ebp]
	call	??0AOATask@@QAE@XZ			; AOATask::AOATask
; Line 854
	lea	ecx, DWORD PTR _tsk$[ebp]
	call	??0apptask@@QAE@XZ			; apptask::apptask
; Line 855
	lea	ecx, DWORD PTR _EO$[ebp]
	call	??0EtherObj@@QAE@XZ			; EtherObj::EtherObj
; Line 856
	lea	ecx, DWORD PTR _cir$[ebp]
	call	??0WCirList@@QAE@XZ			; WCirList::WCirList
; Line 857
	lea	ecx, DWORD PTR _io$[ebp]
	call	??0AOAProtected@@QAE@XZ			; AOAProtected::AOAProtected
; Line 859
	mov	DWORD PTR _retcode$[ebp], 0
; Line 864
	mov	DWORD PTR _Acceptable_Flag$[ebp], 1
; Line 865
	mov	DWORD PTR _currtime$[ebp], 0
; Line 867
	mov	DWORD PTR _len$[ebp], 0
; Line 868
	mov	DWORD PTR _i$[ebp], 0
; Line 869
	mov	DWORD PTR _ack1$[ebp], 0
; Line 873
	lea	eax, DWORD PTR _Header$[ebp]
	mov	DWORD PTR _tcp$[ebp], eax
; Line 874
	mov	ecx, DWORD PTR _TCPPack$[ebp]
	push	ecx
	lea	edx, DWORD PTR _Header$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?FormatHeader@TCPObj@@AAEXPAD0@Z	; TCPObj::FormatHeader
; Line 878
	mov	eax, DWORD PTR _TCBRecordNumber$[ebp]
	imul	eax, 288				; 00000120H
	mov	ecx, DWORD PTR ?TCBBase@TCPObj@@0KA	; TCPObj::TCBBase
	add	ecx, eax
	mov	DWORD PTR _tcb$[ebp], ecx
; Line 879
	mov	BYTE PTR _SrcPortNum$[ebp], 0
; Line 880
	mov	BYTE PTR _SrcPortNum$[ebp+1], 80	; 00000050H
; Line 882
	mov	edx, DWORD PTR _tcp$[ebp]
	movsx	eax, BYTE PTR [edx+12]
	shl	eax, 2
	mov	ecx, DWORD PTR _size$[ebp]
	sub	ecx, eax
	mov	edx, DWORD PTR _tcb$[ebp]
	cmp	ecx, DWORD PTR [edx+140]
	jbe	SHORT $L2439
; Line 884
	mov	DWORD PTR _Acceptable_Flag$[ebp], 0
$L2439:
; Line 888
	cmp	DWORD PTR _Acceptable_Flag$[ebp], 0
	jne	$L2440
; Line 891
	mov	eax, DWORD PTR _tcp$[ebp]
	movsx	ecx, BYTE PTR [eax+13]
	and	ecx, 4
	cmp	ecx, 4
	jne	SHORT $L2441
; Line 896
	mov	edx, 1
	test	edx, edx
	je	SHORT $L2442
; Line 897
	push	72					; 00000048H
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+124]
	push	ecx
	push	-1073741822				; c0000002H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
$L2442:
; Line 898
	mov	edx, DWORD PTR ?NoOfResets@TCPObj@@2HA	; TCPObj::NoOfResets
	add	edx, 1
	mov	DWORD PTR ?NoOfResets@TCPObj@@2HA, edx	; TCPObj::NoOfResets
; Line 899
	mov	eax, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [eax+64], 1
	jne	SHORT $L2443
; Line 901
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+76], 1
; Line 903
	jmp	SHORT $L2445
$L2443:
; Line 905
	mov	edx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [edx+64], 0
	jne	SHORT $L2445
; Line 906
	push	2
	mov	eax, DWORD PTR _TCBRecordNumber$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DeleteTCB@TCPObj@@QAEHHH@Z		; TCPObj::DeleteTCB
$L2445:
; Line 908
	xor	eax, eax
	jmp	$L2417
$L2441:
; Line 919
	mov	ecx, DWORD PTR _currenttask$[ebp]
	push	ecx
	push	6
	mov	edx, DWORD PTR _tcb$[ebp]
	add	edx, 12					; 0000000cH
	push	edx
	push	20					; 00000014H
	mov	eax, DWORD PTR _tcb$[ebp]
	add	eax, 18					; 00000012H
	push	eax
	mov	ecx, DWORD PTR _tcb$[ebp]
	add	ecx, 20					; 00000014H
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?SendMisc@TCPObj@@AAEHPAD0D0HH@Z	; TCPObj::SendMisc
	mov	DWORD PTR _retcode$[ebp], eax
; Line 920
	mov	edx, 1
	test	edx, edx
	je	SHORT $L2447
; Line 921
	push	73					; 00000049H
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+124]
	push	ecx
	push	-536870909				; e0000003H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
$L2447:
; Line 924
	mov	edx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [edx+64], 1
	jne	SHORT $L2448
; Line 926
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+76], 1
; Line 928
	jmp	SHORT $L2449
$L2448:
; Line 930
	push	3
	mov	ecx, DWORD PTR _TCBRecordNumber$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DeleteTCB@TCPObj@@QAEHHH@Z		; TCPObj::DeleteTCB
$L2449:
; Line 933
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L2417
$L2440:
; Line 940
	mov	edx, DWORD PTR _tcp$[ebp]
	movsx	eax, BYTE PTR [edx+13]
	and	eax, 4
	cmp	eax, 4
	jne	SHORT $L2451
; Line 944
	mov	ecx, 1
	test	ecx, ecx
	je	SHORT $L2452
; Line 945
	push	72					; 00000048H
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+124]
	push	eax
	push	-1073741821				; c0000003H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
$L2452:
; Line 946
	mov	ecx, DWORD PTR ?NoOfResets@TCPObj@@2HA	; TCPObj::NoOfResets
	add	ecx, 1
	mov	DWORD PTR ?NoOfResets@TCPObj@@2HA, ecx	; TCPObj::NoOfResets
; Line 948
	mov	edx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [edx+64], 1
	jne	SHORT $L2453
; Line 950
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+76], 1
; Line 952
	jmp	SHORT $L2455
$L2453:
; Line 954
	mov	ecx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [ecx+64], 0
	jne	SHORT $L2455
; Line 955
	push	4
	mov	edx, DWORD PTR _TCBRecordNumber$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DeleteTCB@TCPObj@@QAEHHH@Z		; TCPObj::DeleteTCB
$L2455:
; Line 957
	xor	eax, eax
	jmp	$L2417
$L2451:
; Line 961
	mov	eax, DWORD PTR _tcp$[ebp]
	movsx	ecx, BYTE PTR [eax+13]
	and	ecx, 2
	cmp	ecx, 2
	jne	SHORT $L2457
; Line 970
	mov	edx, DWORD PTR _currenttask$[ebp]
	push	edx
	push	1
	mov	eax, DWORD PTR _tcb$[ebp]
	add	eax, 12					; 0000000cH
	push	eax
	push	18					; 00000012H
	mov	ecx, DWORD PTR _tcb$[ebp]
	add	ecx, 18					; 00000012H
	push	ecx
	mov	edx, DWORD PTR _tcb$[ebp]
	add	edx, 20					; 00000014H
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?SendMisc@TCPObj@@AAEHPAD0D0HH@Z	; TCPObj::SendMisc
	mov	DWORD PTR _retcode$[ebp], eax
; Line 971
	mov	eax, 1
	test	eax, eax
	je	SHORT $L2457
; Line 972
	push	49					; 00000031H
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+124]
	push	edx
	push	-1610612734				; a0000002H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
$L2457:
; Line 977
	mov	eax, DWORD PTR _tcp$[ebp]
	movsx	ecx, BYTE PTR [eax+13]
	and	ecx, 16					; 00000010H
	cmp	ecx, 16					; 00000010H
	jne	$L2569
; Line 979
	mov	edx, DWORD PTR _tcp$[ebp]
	xor	eax, eax
	mov	ax, WORD PTR [edx+14]
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+104], eax
; Line 980
	mov	edx, 1
	test	edx, edx
	je	SHORT $L2459
; Line 981
	push	23					; 00000017H
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+124]
	push	ecx
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+104]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
$L2459:
; Line 983
	mov	ecx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [ecx+24], 3
	jne	$L2477
; Line 989
	mov	edx, 1
	test	edx, edx
	je	SHORT $L2461
; Line 990
	push	1
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+124]
	push	ecx
	push	4277067					; 0041434bH
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
$L2461:
; Line 992
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+96]
	push	eax
	mov	ecx, DWORD PTR _tcp$[ebp]
	mov	edx, DWORD PTR [ecx+8]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?greaterEqualto@TCPObj@@AAEHKK@Z	; TCPObj::greaterEqualto
	test	eax, eax
	jl	$L2462
	mov	eax, DWORD PTR _tcp$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	push	ecx
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+100]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?greaterEqualto@TCPObj@@AAEHKK@Z	; TCPObj::greaterEqualto
	test	eax, eax
	jl	$L2462
; Line 998
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+24], 5
; Line 999
	mov	edx, 1
	test	edx, edx
	je	SHORT $L2463
; Line 1000
	push	2
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+124]
	push	ecx
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+24]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
$L2463:
; Line 1001
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	mov	ecx, DWORD PTR _tcb$[ebp]
	sub	eax, DWORD PTR [ecx+108]
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+28], eax
; Line 1002
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR _timerEth$[ebp]
	mov	DWORD PTR [eax+40], ecx
; Line 1003
	mov	edx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [edx+28], 0
	jne	SHORT $L2464
; Line 1004
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+28], 1
$L2464:
; Line 1006
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+28]
	imul	edx, 400				; 00000190H
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+28], edx
; Line 1008
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+28]
	cmp	edx, DWORD PTR ?min@@3KA		; min
	jae	SHORT $L2465
; Line 1010
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+28]
	mov	DWORD PTR ?min@@3KA, ecx		; min
$L2465:
; Line 1014
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+28]
	cmp	eax, DWORD PTR ?max@@3KA		; max
	jbe	SHORT $L2466
; Line 1016
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+28]
	mov	DWORD PTR ?max@@3KA, edx		; max
$L2466:
; Line 1020
	mov	eax, DWORD PTR _tcp$[ebp]
	movsx	ecx, BYTE PTR [eax+12]
	shl	ecx, 2
	mov	edx, DWORD PTR _size$[ebp]
	sub	edx, ecx
	mov	DWORD PTR _len$[ebp], edx
; Line 1021
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR _len$[ebp]
	mov	DWORD PTR [eax+180], ecx
; Line 1022
	cmp	DWORD PTR _len$[ebp], 0
	je	$L2468
; Line 1024
	mov	edx, DWORD PTR _TCPPack$[ebp]
	movsx	eax, BYTE PTR [edx+20]
	cmp	eax, 71					; 00000047H
	jne	$L2468
	mov	ecx, DWORD PTR _TCPPack$[ebp]
	movsx	edx, BYTE PTR [ecx+21]
	cmp	edx, 69					; 00000045H
	jne	$L2468
	mov	eax, DWORD PTR _TCPPack$[ebp]
	movsx	ecx, BYTE PTR [eax+22]
	cmp	ecx, 84					; 00000054H
	jne	$L2468
; Line 1027
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+112]
	add	eax, DWORD PTR _len$[ebp]
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+112], eax
; Line 1028
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+140]
	sub	eax, DWORD PTR _len$[ebp]
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+140], eax
; Line 1029
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR _timerEth$[ebp]
	mov	DWORD PTR [edx+44], eax
; Line 1030
	mov	ecx, DWORD PTR ?GetCount@TCPObj@@2KA	; TCPObj::GetCount
	add	ecx, 1
	mov	DWORD PTR ?GetCount@TCPObj@@2KA, ecx	; TCPObj::GetCount
; Line 1032
	mov	edx, 1
	test	edx, edx
	je	SHORT $L2469
; Line 1033
	push	3
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+124]
	push	ecx
	push	4670804					; 00474554H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
$L2469:
; Line 1038
	mov	edx, DWORD PTR _TCBRecordNumber$[ebp]
	imul	edx, 1500				; 000005dcH
	add	edx, 68515904				; 04157840H
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+248], edx
; Line 1045
	mov	DWORD PTR _i$2471[ebp], 0
	jmp	SHORT $L2472
$L2473:
	mov	ecx, DWORD PTR _i$2471[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$2471[ebp], ecx
$L2472:
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR _i$2471[ebp]
	cmp	eax, DWORD PTR [edx+180]
	jae	SHORT $L2474
; Line 1047
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+248]
	mov	eax, DWORD PTR _TCPPack$[ebp]
	add	eax, DWORD PTR _i$2471[ebp]
	mov	ecx, DWORD PTR _i$2471[ebp]
	mov	al, BYTE PTR [eax+20]
	mov	BYTE PTR [edx+ecx], al
; Line 1048
	jmp	SHORT $L2473
$L2474:
; Line 1054
	mov	ecx, DWORD PTR _currenttask$[ebp]
	push	ecx
	push	2
	mov	edx, DWORD PTR _tcb$[ebp]
	add	edx, 12					; 0000000cH
	push	edx
	push	16					; 00000010H
	mov	eax, DWORD PTR _tcb$[ebp]
	add	eax, 18					; 00000012H
	push	eax
	mov	ecx, DWORD PTR _tcb$[ebp]
	add	ecx, 20					; 00000014H
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?SendMisc@TCPObj@@AAEHPAD0D0HH@Z	; TCPObj::SendMisc
	mov	DWORD PTR _retcode$[ebp], eax
; Line 1055
	mov	edx, 1
	test	edx, edx
	je	SHORT $L2475
; Line 1056
	push	50					; 00000032H
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+124]
	push	ecx
	push	-1610612733				; a0000003H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
$L2475:
; Line 1057
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+48], eax
; Line 1058
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+84], 1
; Line 1059
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L2476
; Line 1063
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L2417
$L2476:
; Line 1069
	mov	ecx, DWORD PTR ?HttpCount@TCPObj@@2KA	; TCPObj::HttpCount
	add	ecx, 1
	mov	DWORD PTR ?HttpCount@TCPObj@@2KA, ecx	; TCPObj::HttpCount
; Line 1070
	mov	edx, DWORD PTR ?HttpRequests@TCPObj@@2KA ; TCPObj::HttpRequests
	add	edx, 1
	mov	DWORD PTR ?HttpRequests@TCPObj@@2KA, edx ; TCPObj::HttpRequests
; Line 1071
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+64], 1
; Line 1072
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	push	eax
	mov	ecx, DWORD PTR _TCBRecordNumber$[ebp]
	push	ecx
	lea	ecx, DWORD PTR _tsk$[ebp]
	call	?insertHttpTask@apptask@@QAEHHJ@Z	; apptask::insertHttpTask
; Line 1073
	push	1
	push	7
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAMaskRunRegister@AOAProtected@@QAEHHH@Z ; AOAProtected::AOAMaskRunRegister
$L2468:
; Line 1077
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR _TCBRecordNumber$[ebp]
	mov	DWORD PTR [edx+8], eax
; Line 1085
	xor	eax, eax
	jmp	$L2417
$L2462:
; Line 1098
	mov	ecx, DWORD PTR _currenttask$[ebp]
	push	ecx
	push	6
	mov	edx, DWORD PTR _tcb$[ebp]
	add	edx, 12					; 0000000cH
	push	edx
	push	4
	mov	eax, DWORD PTR _tcb$[ebp]
	add	eax, 18					; 00000012H
	push	eax
	mov	ecx, DWORD PTR _tcb$[ebp]
	add	ecx, 20					; 00000014H
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?SendMisc@TCPObj@@AAEHPAD0D0HH@Z	; TCPObj::SendMisc
	mov	DWORD PTR _retcode$[ebp], eax
; Line 1099
	mov	edx, 1
	test	edx, edx
	je	SHORT $L2478
; Line 1100
	push	73					; 00000049H
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+124]
	push	ecx
	push	-536870908				; e0000004H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
$L2478:
; Line 1104
	mov	edx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [edx+64], 1
	jne	SHORT $L2479
; Line 1106
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+76], 1
; Line 1109
	jmp	SHORT $L2480
$L2479:
; Line 1111
	push	5
	mov	ecx, DWORD PTR _TCBRecordNumber$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DeleteTCB@TCPObj@@QAEHHH@Z		; TCPObj::DeleteTCB
$L2480:
; Line 1113
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L2417
$L2477:
; Line 1118
	mov	edx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [edx+24], 5
	jne	$L2536
; Line 1126
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR _tcp$[ebp]
	mov	edx, DWORD PTR [ecx+8]
	mov	DWORD PTR [eax+96], edx
; Line 1128
	mov	eax, 1
	test	eax, eax
	je	$L2482
; Line 1130
	push	16					; 00000010H
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+124]
	push	edx
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+24]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
; Line 1131
	push	17					; 00000011H
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+124]
	push	eax
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+272]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
; Line 1132
	push	18					; 00000012H
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+124]
	push	ecx
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+100]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
; Line 1133
	push	19					; 00000013H
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+124]
	push	edx
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+96]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
; Line 1134
	push	20					; 00000014H
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+124]
	push	eax
	mov	ecx, DWORD PTR _tcp$[ebp]
	mov	edx, DWORD PTR [ecx+8]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
; Line 1135
	push	21					; 00000015H
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+124]
	push	ecx
	mov	edx, DWORD PTR _tcp$[ebp]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
$L2482:
; Line 1139
	mov	ecx, DWORD PTR _TCPPack$[ebp]
	movsx	edx, BYTE PTR [ecx+13]
	and	edx, 17					; 00000011H
	cmp	edx, 17					; 00000011H
	jne	SHORT $L2484
; Line 1142
	mov	eax, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [eax+68], 0
	jne	SHORT $L2484
	mov	ecx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [ecx+64], 0
	jne	SHORT $L2484
; Line 1144
	mov	edx, DWORD PTR _currenttask$[ebp]
	push	edx
	mov	eax, DWORD PTR _tcb$[ebp]
	add	eax, 12					; 0000000cH
	push	eax
	mov	ecx, DWORD PTR _tcb$[ebp]
	add	ecx, 20					; 00000014H
	push	ecx
	mov	edx, DWORD PTR _TCPPack$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?SendMisc@TCPObj@@AAEHPAD00H@Z		; TCPObj::SendMisc
	mov	DWORD PTR _retcode$[ebp], eax
; Line 1145
	mov	eax, 1
	test	eax, eax
	je	SHORT $L2485
; Line 1146
	push	40					; 00000028H
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+124]
	push	edx
	push	98544641				; 05dfac01H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
$L2485:
; Line 1147
	push	6
	mov	eax, DWORD PTR _TCBRecordNumber$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DeleteTCB@TCPObj@@QAEHHH@Z		; TCPObj::DeleteTCB
; Line 1148
	xor	eax, eax
	jmp	$L2417
$L2484:
; Line 1158
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+96]
	push	edx
	mov	eax, DWORD PTR _tcp$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?greaterEqualto@TCPObj@@AAEHKK@Z	; TCPObj::greaterEqualto
	test	eax, eax
	jl	$L2486
	mov	edx, DWORD PTR _tcp$[ebp]
	mov	eax, DWORD PTR [edx+8]
	push	eax
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+100]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?greaterEqualto@TCPObj@@AAEHKK@Z	; TCPObj::greaterEqualto
	test	eax, eax
	jl	$L2486
; Line 1160
	mov	eax, 1
	test	eax, eax
	je	SHORT $L2487
; Line 1162
	push	9
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+124]
	push	edx
	push	97177089				; 05cace01H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
; Line 1163
	push	4
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+124]
	push	ecx
	push	5
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
$L2487:
; Line 1168
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+128]
	push	eax
	mov	ecx, DWORD PTR _tcp$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?greaterEqualto@TCPObj@@AAEHKK@Z	; TCPObj::greaterEqualto
	test	eax, eax
	jg	SHORT $L2489
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR _tcp$[ebp]
	mov	edx, DWORD PTR [eax+128]
	cmp	edx, DWORD PTR [ecx+4]
	jne	SHORT $L2488
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+132]
	push	ecx
	mov	edx, DWORD PTR _tcp$[ebp]
	mov	eax, DWORD PTR [edx+8]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?greaterEqualto@TCPObj@@AAEHKK@Z	; TCPObj::greaterEqualto
	test	eax, eax
	jl	SHORT $L2488
$L2489:
; Line 1170
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR _tcp$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR [ecx+128], eax
; Line 1171
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR _tcp$[ebp]
	mov	eax, DWORD PTR [edx+8]
	mov	DWORD PTR [ecx+132], eax
$L2488:
; Line 1174
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR _tcp$[ebp]
	mov	eax, DWORD PTR [edx+8]
	mov	DWORD PTR [ecx+96], eax
; Line 1180
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [ecx+100]
	cmp	eax, DWORD PTR [edx+96]
	jne	$L2493
; Line 1182
	mov	ecx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [ecx+68], 1
	jne	$L2493
; Line 1184
	mov	edx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [edx+72], 1
	jne	SHORT $L2492
; Line 1185
	mov	eax, -1717986919			; 99999999H
	jmp	$L2417
$L2492:
; Line 1186
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+72], 1
; Line 1187
	mov	ecx, 1
	test	ecx, ecx
	je	$L2493
; Line 1189
	push	10					; 0000000aH
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+124]
	push	eax
	push	98426333				; 05ddddddH
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
; Line 1190
	push	4
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+124]
	push	edx
	push	5
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
; Line 1191
	push	11					; 0000000bH
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+124]
	push	ecx
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+68]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
; Line 1192
	push	12					; 0000000cH
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+124]
	push	edx
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+72]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
; Line 1193
	push	31					; 0000001fH
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+124]
	push	eax
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
$L2493:
; Line 1200
	mov	eax, DWORD PTR _tcp$[ebp]
	movsx	ecx, BYTE PTR [eax+13]
	and	ecx, 1
	cmp	ecx, 1
	jne	$L2494
; Line 1203
	mov	edx, 1
	test	edx, edx
	je	SHORT $L2495
; Line 1205
	push	41					; 00000029H
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+124]
	push	ecx
	push	83886081				; 05000001H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
; Line 1206
	push	4
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+124]
	push	eax
	push	5
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
$L2495:
; Line 1209
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+24], 16			; 00000010H
; Line 1210
	mov	edx, 1
	test	edx, edx
	je	SHORT $L2496
; Line 1211
	push	4
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+124]
	push	ecx
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+24]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
$L2496:
; Line 1213
	mov	ecx, DWORD PTR _currenttask$[ebp]
	push	ecx
	push	10					; 0000000aH
	mov	edx, DWORD PTR _tcb$[ebp]
	add	edx, 12					; 0000000cH
	push	edx
	push	10					; 0000000aH
	mov	eax, DWORD PTR _tcb$[ebp]
	add	eax, 18					; 00000012H
	push	eax
	mov	ecx, DWORD PTR _tcb$[ebp]
	add	ecx, 20					; 00000014H
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?SendMisc@TCPObj@@AAEHPAD0D0HH@Z	; TCPObj::SendMisc
	mov	DWORD PTR _retcode$[ebp], eax
; Line 1214
	mov	edx, 1
	test	edx, edx
	je	SHORT $L2497
; Line 1215
	push	51					; 00000033H
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+124]
	push	ecx
	push	100319236				; 05fac004H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
$L2497:
; Line 1218
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L2498
; Line 1219
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L2417
$L2498:
; Line 1221
	mov	edx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [edx+64], 1
	jne	SHORT $L2499
; Line 1223
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+76], 1
; Line 1226
	jmp	SHORT $L2500
$L2499:
; Line 1228
	push	7
	mov	ecx, DWORD PTR _TCBRecordNumber$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DeleteTCB@TCPObj@@QAEHHH@Z		; TCPObj::DeleteTCB
$L2500:
; Line 1230
	xor	eax, eax
	jmp	$L2417
$L2494:
; Line 1235
	mov	edx, DWORD PTR _tcp$[ebp]
	movsx	eax, BYTE PTR [edx+12]
	shl	eax, 2
	mov	ecx, DWORD PTR _size$[ebp]
	sub	ecx, eax
	mov	DWORD PTR _len$[ebp], ecx
; Line 1244
	cmp	DWORD PTR _len$[ebp], 0
	je	$L2525
; Line 1246
	mov	edx, DWORD PTR _TCPPack$[ebp]
	movsx	eax, BYTE PTR [edx+20]
	cmp	eax, 71					; 00000047H
	jne	$L2502
	mov	ecx, DWORD PTR _TCPPack$[ebp]
	movsx	edx, BYTE PTR [ecx+21]
	cmp	edx, 69					; 00000045H
	jne	$L2502
	mov	eax, DWORD PTR _TCPPack$[ebp]
	movsx	ecx, BYTE PTR [eax+22]
	cmp	ecx, 84					; 00000054H
	jne	$L2502
; Line 1248
	mov	edx, 1
	test	edx, edx
	je	SHORT $L2503
; Line 1249
	push	3
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+124]
	push	ecx
	push	4670804					; 00474554H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
$L2503:
; Line 1250
	mov	edx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [edx+84], 1
	jne	SHORT $L2504
; Line 1253
	mov	eax, DWORD PTR _currenttask$[ebp]
	push	eax
	push	2
	mov	ecx, DWORD PTR _tcb$[ebp]
	add	ecx, 12					; 0000000cH
	push	ecx
	push	16					; 00000010H
	mov	edx, DWORD PTR _tcb$[ebp]
	add	edx, 18					; 00000012H
	push	edx
	mov	eax, DWORD PTR _tcb$[ebp]
	add	eax, 20					; 00000014H
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?SendMisc@TCPObj@@AAEHPAD0D0HH@Z	; TCPObj::SendMisc
	mov	DWORD PTR _retcode$[ebp], eax
; Line 1254
	mov	ecx, 1
	test	ecx, ecx
	je	SHORT $L2505
; Line 1255
	push	52					; 00000034H
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+124]
	push	eax
	push	-1610612731				; a0000005H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
$L2505:
; Line 1256
	xor	eax, eax
	jmp	$L2417
$L2504:
; Line 1258
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR _len$[ebp]
	mov	DWORD PTR [ecx+180], edx
; Line 1260
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+112]
	add	ecx, DWORD PTR _len$[ebp]
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+112], ecx
; Line 1261
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+140]
	sub	ecx, DWORD PTR _len$[ebp]
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+140], ecx
; Line 1262
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR _timerEth$[ebp]
	mov	DWORD PTR [eax+44], ecx
; Line 1263
	mov	edx, DWORD PTR ?GetCount@TCPObj@@2KA	; TCPObj::GetCount
	add	edx, 1
	mov	DWORD PTR ?GetCount@TCPObj@@2KA, edx	; TCPObj::GetCount
; Line 1268
	mov	eax, DWORD PTR _TCBRecordNumber$[ebp]
	imul	eax, 1500				; 000005dcH
	add	eax, 68515904				; 04157840H
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+248], eax
; Line 1275
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L2507
$L2508:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L2507:
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR [eax+180]
	jae	SHORT $L2509
; Line 1277
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+248]
	mov	ecx, DWORD PTR _TCPPack$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	mov	cl, BYTE PTR [ecx+20]
	mov	BYTE PTR [eax+edx], cl
; Line 1279
	jmp	SHORT $L2508
$L2509:
; Line 1281
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+248]
	mov	ecx, DWORD PTR _i$[ebp]
	movsx	edx, BYTE PTR [eax+ecx-1]
	cmp	edx, 10					; 0000000aH
	jne	SHORT $L2510
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+248]
	mov	edx, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR [ecx+edx-2]
	cmp	eax, 13					; 0000000dH
	jne	SHORT $L2510
; Line 1282
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+92], 0
; Line 1283
	jmp	SHORT $L2511
$L2510:
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+92], 1
$L2511:
; Line 1289
	mov	eax, DWORD PTR _currenttask$[ebp]
	push	eax
	push	2
	mov	ecx, DWORD PTR _tcb$[ebp]
	add	ecx, 12					; 0000000cH
	push	ecx
	push	16					; 00000010H
	mov	edx, DWORD PTR _tcb$[ebp]
	add	edx, 18					; 00000012H
	push	edx
	mov	eax, DWORD PTR _tcb$[ebp]
	add	eax, 20					; 00000014H
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?SendMisc@TCPObj@@AAEHPAD0D0HH@Z	; TCPObj::SendMisc
	mov	DWORD PTR _retcode$[ebp], eax
; Line 1290
	mov	ecx, 1
	test	ecx, ecx
	je	SHORT $L2512
; Line 1291
	push	53					; 00000035H
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+124]
	push	eax
	push	-1610612730				; a0000006H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
$L2512:
; Line 1292
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+48], eax
; Line 1293
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+84], 1
; Line 1294
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L2513
; Line 1298
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L2417
$L2513:
; Line 1305
	mov	eax, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [eax+92], 0
	jne	SHORT $L2514
; Line 1307
	mov	ecx, DWORD PTR ?HttpCount@TCPObj@@2KA	; TCPObj::HttpCount
	add	ecx, 1
	mov	DWORD PTR ?HttpCount@TCPObj@@2KA, ecx	; TCPObj::HttpCount
; Line 1308
	mov	edx, DWORD PTR ?HttpRequests@TCPObj@@2KA ; TCPObj::HttpRequests
	add	edx, 1
	mov	DWORD PTR ?HttpRequests@TCPObj@@2KA, edx ; TCPObj::HttpRequests
; Line 1309
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+64], 1
; Line 1311
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	push	eax
	mov	ecx, DWORD PTR _TCBRecordNumber$[ebp]
	push	ecx
	lea	ecx, DWORD PTR _tsk$[ebp]
	call	?insertHttpTask@apptask@@QAEHHJ@Z	; apptask::insertHttpTask
; Line 1312
	push	1
	push	7
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAMaskRunRegister@AOAProtected@@QAEHHH@Z ; AOAProtected::AOAMaskRunRegister
$L2514:
; Line 1315
	jmp	$L2525
$L2502:
	mov	edx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [edx+92], 1
	jne	$L2516
; Line 1317
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+112]
	add	ecx, DWORD PTR _len$[ebp]
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+112], ecx
; Line 1318
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+140]
	sub	ecx, DWORD PTR _len$[ebp]
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+140], ecx
; Line 1319
	mov	eax, DWORD PTR _TCBRecordNumber$[ebp]
	imul	eax, 1500				; 000005dcH
	add	eax, 68515904				; 04157840H
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+248], eax
; Line 1320
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L2518
$L2519:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L2518:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _len$[ebp]
	jge	SHORT $L2520
; Line 1321
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, DWORD PTR [ecx+180]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+248]
	mov	eax, DWORD PTR _TCPPack$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	mov	al, BYTE PTR [eax+20]
	mov	BYTE PTR [ecx+edx], al
	jmp	SHORT $L2519
$L2520:
; Line 1322
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+180]
	add	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+248]
	movsx	edx, BYTE PTR [ecx+edx-1]
	cmp	edx, 10					; 0000000aH
	jne	SHORT $L2521
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+180]
	add	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+248]
	movsx	ecx, BYTE PTR [eax+ecx-2]
	cmp	ecx, 13					; 0000000dH
	jne	SHORT $L2521
; Line 1323
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+92], 0
; Line 1324
	jmp	SHORT $L2522
$L2521:
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+92], 1
$L2522:
; Line 1325
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+180]
	add	edx, DWORD PTR _len$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+180], edx
; Line 1329
	mov	ecx, DWORD PTR _currenttask$[ebp]
	push	ecx
	push	2
	mov	edx, DWORD PTR _tcb$[ebp]
	add	edx, 12					; 0000000cH
	push	edx
	push	16					; 00000010H
	mov	eax, DWORD PTR _tcb$[ebp]
	add	eax, 18					; 00000012H
	push	eax
	mov	ecx, DWORD PTR _tcb$[ebp]
	add	ecx, 20					; 00000014H
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?SendMisc@TCPObj@@AAEHPAD0D0HH@Z	; TCPObj::SendMisc
	mov	DWORD PTR _retcode$[ebp], eax
; Line 1330
	mov	edx, 1
	test	edx, edx
	je	SHORT $L2523
; Line 1331
	push	54					; 00000036H
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+124]
	push	ecx
	push	-1610612729				; a0000007H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
$L2523:
; Line 1332
	mov	edx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [edx+92], 0
	jne	SHORT $L2524
; Line 1334
	mov	eax, DWORD PTR ?HttpCount@TCPObj@@2KA	; TCPObj::HttpCount
	add	eax, 1
	mov	DWORD PTR ?HttpCount@TCPObj@@2KA, eax	; TCPObj::HttpCount
; Line 1335
	mov	ecx, DWORD PTR ?HttpRequests@TCPObj@@2KA ; TCPObj::HttpRequests
	add	ecx, 1
	mov	DWORD PTR ?HttpRequests@TCPObj@@2KA, ecx ; TCPObj::HttpRequests
; Line 1336
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+64], 1
; Line 1337
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	push	eax
	mov	eax, DWORD PTR _TCBRecordNumber$[ebp]
	push	eax
	lea	ecx, DWORD PTR _tsk$[ebp]
	call	?insertHttpTask@apptask@@QAEHHJ@Z	; apptask::insertHttpTask
; Line 1338
	push	1
	push	7
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAMaskRunRegister@AOAProtected@@QAEHHH@Z ; AOAProtected::AOAMaskRunRegister
$L2524:
; Line 1341
	jmp	SHORT $L2525
$L2516:
; Line 1343
	mov	eax, -32				; ffffffe0H
	jmp	$L2417
$L2525:
; Line 1349
	xor	eax, eax
	jmp	$L2417
$L2486:
; Line 1356
	mov	ecx, DWORD PTR _tcp$[ebp]
	mov	edx, DWORD PTR [ecx+8]
	push	edx
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+96]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?greaterEqualto@TCPObj@@AAEHKK@Z	; TCPObj::greaterEqualto
	test	eax, eax
	jle	SHORT $L2527
; Line 1366
	mov	edx, 1
	test	edx, edx
	je	SHORT $L2528
; Line 1368
	push	9
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+124]
	push	ecx
	push	97177090				; 05cace02H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
; Line 1369
	push	4
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+124]
	push	eax
	push	5
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
$L2528:
; Line 1371
	xor	eax, eax
	jmp	$L2417
$L2527:
; Line 1377
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+100]
	push	edx
	mov	eax, DWORD PTR _tcp$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?greaterEqualto@TCPObj@@AAEHKK@Z	; TCPObj::greaterEqualto
	test	eax, eax
	jle	$L2530
; Line 1383
	mov	edx, 1
	test	edx, edx
	je	SHORT $L2531
; Line 1385
	push	9
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+124]
	push	ecx
	push	97177091				; 05cace03H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
; Line 1386
	push	4
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+124]
	push	eax
	push	5
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
$L2531:
; Line 1389
	mov	ecx, DWORD PTR _currenttask$[ebp]
	push	ecx
	push	6
	mov	edx, DWORD PTR _tcb$[ebp]
	add	edx, 12					; 0000000cH
	push	edx
	push	4
	mov	eax, DWORD PTR _tcb$[ebp]
	add	eax, 18					; 00000012H
	push	eax
	mov	ecx, DWORD PTR _tcb$[ebp]
	add	ecx, 20					; 00000014H
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?SendMisc@TCPObj@@AAEHPAD0D0HH@Z	; TCPObj::SendMisc
	mov	DWORD PTR _retcode$[ebp], eax
; Line 1390
	mov	edx, 1
	test	edx, edx
	je	SHORT $L2532
; Line 1391
	push	73					; 00000049H
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+124]
	push	ecx
	push	-536870907				; e0000005H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
$L2532:
; Line 1395
	mov	edx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [edx+64], 1
	jne	SHORT $L2533
; Line 1397
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+76], 1
; Line 1400
	jmp	SHORT $L2534
$L2533:
; Line 1402
	push	8
	mov	ecx, DWORD PTR _TCBRecordNumber$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DeleteTCB@TCPObj@@QAEHHH@Z		; TCPObj::DeleteTCB
$L2534:
; Line 1405
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L2417
$L2530:
; Line 1411
	mov	edx, 1
	test	edx, edx
	je	SHORT $L2536
; Line 1413
	push	9
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+124]
	push	ecx
	push	97177092				; 05cace04H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
; Line 1414
	push	4
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+124]
	push	eax
	push	5
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
$L2536:
; Line 1420
	mov	ecx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [ecx+24], 6
	jne	$L2564
; Line 1423
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+164]
	add	eax, 1
	mov	ecx, DWORD PTR _tcb$[ebp]
	cmp	eax, DWORD PTR [ecx+100]
	jne	$L2540
; Line 1427
	mov	edx, 1
	test	edx, edx
	je	SHORT $L2539
; Line 1428
	push	16					; 00000010H
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	sub	ecx, DWORD PTR ?MinTaskId@apptask@@2JA	; apptask::MinTaskId
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 348				; 0000015cH
	call	?insert@WTTrace@@QAEHHG@Z		; WTTrace::insert
$L2539:
; Line 1429
	mov	edx, 1
	test	edx, edx
	je	$L2540
; Line 1431
	push	24					; 00000018H
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+124]
	push	ecx
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+24]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
; Line 1432
	push	25					; 00000019H
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+124]
	push	edx
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+272]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
; Line 1433
	push	26					; 0000001aH
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+124]
	push	eax
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+100]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
; Line 1434
	push	27					; 0000001bH
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+124]
	push	ecx
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+96]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
; Line 1435
	push	28					; 0000001cH
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+124]
	push	edx
	mov	eax, DWORD PTR _tcp$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
; Line 1436
	push	29					; 0000001dH
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+124]
	push	eax
	mov	ecx, DWORD PTR _tcp$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
; Line 1437
	push	30					; 0000001eH
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+124]
	push	ecx
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+164]
	add	eax, 1
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
$L2540:
; Line 1444
	mov	ecx, DWORD PTR _tcp$[ebp]
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [ecx+8]
	cmp	eax, DWORD PTR [edx+100]
	jne	$L2541
; Line 1446
	push	32					; 00000020H
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+124]
	push	edx
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+24]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
; Line 1447
	push	33					; 00000021H
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+124]
	push	eax
	mov	ecx, DWORD PTR _tcp$[ebp]
	mov	edx, DWORD PTR [ecx+8]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
; Line 1448
	push	34					; 00000022H
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+124]
	push	ecx
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+100]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
; Line 1449
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR _tcp$[ebp]
	mov	eax, DWORD PTR [edx+8]
	mov	DWORD PTR [ecx+96], eax
; Line 1457
	mov	ecx, DWORD PTR _tcp$[ebp]
	movsx	edx, BYTE PTR [ecx+13]
	and	edx, 1
	cmp	edx, 1
	jne	$L2542
; Line 1459
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+112]
	add	ecx, 1
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+112], ecx
; Line 1460
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR _timerEth$[ebp]
	mov	DWORD PTR [eax+56], ecx
; Line 1461
	mov	edx, 1
	test	edx, edx
	je	SHORT $L2543
; Line 1462
	push	41					; 00000029H
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+124]
	push	ecx
	push	100663298				; 06000002H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
$L2543:
; Line 1463
	mov	edx, DWORD PTR _currenttask$[ebp]
	push	edx
	push	5
	mov	eax, DWORD PTR _tcb$[ebp]
	add	eax, 12					; 0000000cH
	push	eax
	push	16					; 00000010H
	mov	ecx, DWORD PTR _tcb$[ebp]
	add	ecx, 18					; 00000012H
	push	ecx
	mov	edx, DWORD PTR _tcb$[ebp]
	add	edx, 20					; 00000014H
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?SendMisc@TCPObj@@AAEHPAD0D0HH@Z	; TCPObj::SendMisc
	mov	DWORD PTR _retcode$[ebp], eax
; Line 1464
	mov	eax, 1
	test	eax, eax
	je	SHORT $L2544
; Line 1465
	push	55					; 00000037H
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+124]
	push	edx
	push	117096456				; 06fac008H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
$L2544:
; Line 1466
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+60], eax
; Line 1467
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L2545
; Line 1468
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L2417
$L2545:
; Line 1471
	mov	edx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [edx+68], 1
	jne	SHORT $L2546
; Line 1473
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+80], 1
; Line 1474
	mov	ecx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [ecx+72], 1
	jne	SHORT $L2547
; Line 1475
	mov	eax, -1717986919			; 99999999H
	jmp	$L2417
$L2547:
; Line 1476
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+72], 1
$L2546:
; Line 1478
	xor	eax, eax
	jmp	$L2417
$L2542:
; Line 1483
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+24], 9
; Line 1484
	mov	ecx, 1
	test	ecx, ecx
	je	$L2549
; Line 1486
	push	4
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+124]
	push	eax
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+24]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
; Line 1487
	push	31					; 0000001fH
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+124]
	push	ecx
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+80]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
; Line 1488
	push	11					; 0000000bH
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+124]
	push	edx
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+68]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
; Line 1489
	push	12					; 0000000cH
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+124]
	push	eax
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+72]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
$L2549:
; Line 1491
	xor	eax, eax
	jmp	$L2417
$L2541:
; Line 1496
	mov	eax, DWORD PTR _tcp$[ebp]
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [eax+8]
	cmp	edx, DWORD PTR [ecx+96]
	jbe	$L2551
	mov	eax, DWORD PTR _tcp$[ebp]
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [eax+8]
	cmp	edx, DWORD PTR [ecx+100]
	jae	$L2551
; Line 1500
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR _tcp$[ebp]
	mov	edx, DWORD PTR [ecx+8]
	mov	DWORD PTR [eax+96], edx
; Line 1505
	mov	eax, DWORD PTR _tcp$[ebp]
	movsx	ecx, BYTE PTR [eax+13]
	and	ecx, 1
	cmp	ecx, 1
	jne	$L2552
; Line 1507
	mov	edx, DWORD PTR _currenttask$[ebp]
	push	edx
	push	6
	mov	eax, DWORD PTR _tcb$[ebp]
	add	eax, 12					; 0000000cH
	push	eax
	push	16					; 00000010H
	mov	ecx, DWORD PTR _tcb$[ebp]
	add	ecx, 18					; 00000012H
	push	ecx
	mov	edx, DWORD PTR _tcb$[ebp]
	add	edx, 20					; 00000014H
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?SendMisc@TCPObj@@AAEHPAD0D0HH@Z	; TCPObj::SendMisc
	mov	DWORD PTR _retcode$[ebp], eax
; Line 1508
	mov	eax, 1
	test	eax, eax
	je	SHORT $L2553
; Line 1509
	push	56					; 00000038H
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+124]
	push	edx
	push	117099017				; 06faca09H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
$L2553:
; Line 1511
	mov	eax, 1
	test	eax, eax
	je	SHORT $L2554
; Line 1512
	push	41					; 00000029H
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+124]
	push	edx
	push	117096451				; 06fac003H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
$L2554:
; Line 1513
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L2555
; Line 1514
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L2417
$L2555:
; Line 1517
	mov	eax, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [eax+68], 1
	jne	SHORT $L2556
; Line 1519
	mov	ecx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [ecx+72], 1
	jne	SHORT $L2557
; Line 1520
	mov	eax, -1717986919			; 99999999H
	jmp	$L2417
$L2557:
; Line 1521
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+72], 1
; Line 1523
	jmp	SHORT $L2558
$L2556:
; Line 1524
	push	9
	mov	eax, DWORD PTR _TCBRecordNumber$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DeleteTCB@TCPObj@@QAEHHH@Z		; TCPObj::DeleteTCB
$L2558:
; Line 1527
	xor	eax, eax
	jmp	$L2417
$L2552:
; Line 1531
	xor	eax, eax
	jmp	$L2417
$L2551:
; Line 1536
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+108]
	push	edx
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?mod32cmp@TCPObj@@AAEKKK@Z		; TCPObj::mod32cmp
	cmp	eax, 262020				; 0003ff84H
	jbe	SHORT $L2560
; Line 1539
	mov	eax, 1
	test	eax, eax
	je	SHORT $L2561
; Line 1540
	push	2048					; 00000800H
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	sub	edx, DWORD PTR ?MinTaskId@apptask@@2JA	; apptask::MinTaskId
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 348				; 0000015cH
	call	?insert@WTTrace@@QAEHHG@Z		; WTTrace::insert
$L2561:
; Line 1541
	mov	eax, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [eax+64], 1
	jne	SHORT $L2562
; Line 1543
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+76], 1
; Line 1546
	jmp	SHORT $L2563
$L2562:
; Line 1548
	push	16					; 00000010H
	mov	edx, DWORD PTR _TCBRecordNumber$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DeleteTCB@TCPObj@@QAEHHH@Z		; TCPObj::DeleteTCB
$L2563:
; Line 1550
	xor	eax, eax
	jmp	$L2417
$L2560:
; Line 1554
	cmp	DWORD PTR _size$[ebp], 21		; 00000015H
	jne	$L2565
; Line 1556
	push	3220					; 00000c94H
	mov	eax, DWORD PTR _TCPPack$[ebp]
	push	eax
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1557
	push	3240					; 00000ca8H
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+68]
	push	edx
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1558
	push	3260					; 00000cbcH
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+96]
	push	ecx
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1559
	push	3280					; 00000cd0H
	mov	edx, DWORD PTR _tcp$[ebp]
	mov	eax, DWORD PTR [edx+8]
	push	eax
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1560
	push	3300					; 00000ce4H
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+164]
	push	edx
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1561
	push	3320					; 00000cf8H
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+100]
	push	ecx
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1562
	push	3340					; 00000d0cH
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+272]
	push	eax
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1564
	mov	ecx, DWORD PTR _currenttask$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tcp$[ebp]
	mov	eax, DWORD PTR [edx+8]
	push	eax
	push	9
	mov	ecx, DWORD PTR _tcb$[ebp]
	add	ecx, 12					; 0000000cH
	push	ecx
	push	16					; 00000010H
	mov	edx, DWORD PTR _tcb$[ebp]
	add	edx, 18					; 00000012H
	push	edx
	mov	eax, DWORD PTR _tcb$[ebp]
	add	eax, 20					; 00000014H
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?SendMiscKA@TCPObj@@AAEHPAD0D0HKH@Z	; TCPObj::SendMiscKA
	mov	DWORD PTR _retcode$[ebp], eax
; Line 1565
	mov	ecx, 1
	test	ecx, ecx
	je	SHORT $L2567
; Line 1566
	push	57					; 00000039H
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+124]
	push	eax
	push	553648144				; 21000010H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
$L2567:
$L2565:
; Line 1581
	xor	eax, eax
	jmp	$L2417
$L2564:
; Line 1600
	mov	ecx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [ecx+24], 9
	jne	$L2569
; Line 1602
	mov	edx, DWORD PTR _tcp$[ebp]
	movsx	eax, BYTE PTR [edx+13]
	and	eax, 1
	cmp	eax, 1
	jne	$L2570
; Line 1604
	mov	ecx, 1
	test	ecx, ecx
	je	SHORT $L2571
; Line 1605
	push	64					; 00000040H
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+4]
	sub	eax, DWORD PTR ?MinTaskId@apptask@@2JA	; apptask::MinTaskId
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 348				; 0000015cH
	call	?insert@WTTrace@@QAEHHG@Z		; WTTrace::insert
$L2571:
; Line 1606
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+112]
	add	edx, 1
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+112], edx
; Line 1608
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR _timerEth$[ebp]
	mov	DWORD PTR [ecx+56], edx
; Line 1609
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+60], eax
; Line 1610
	mov	edx, DWORD PTR _currenttask$[ebp]
	push	edx
	push	5
	mov	eax, DWORD PTR _tcb$[ebp]
	add	eax, 12					; 0000000cH
	push	eax
	push	16					; 00000010H
	mov	ecx, DWORD PTR _tcb$[ebp]
	add	ecx, 18					; 00000012H
	push	ecx
	mov	edx, DWORD PTR _tcb$[ebp]
	add	edx, 20					; 00000014H
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?SendMisc@TCPObj@@AAEHPAD0D0HH@Z	; TCPObj::SendMisc
	mov	DWORD PTR _retcode$[ebp], eax
; Line 1611
	mov	eax, 1
	test	eax, eax
	je	SHORT $L2572
; Line 1612
	push	59					; 0000003bH
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+124]
	push	edx
	push	167428114				; 09fac012H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
$L2572:
; Line 1613
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+24], 16			; 00000010H
; Line 1614
	mov	ecx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [ecx+68], 1
	jne	SHORT $L2573
; Line 1616
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+80], 1
; Line 1617
	mov	eax, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [eax+72], 1
	jne	SHORT $L2574
; Line 1618
	mov	eax, -1717986919			; 99999999H
	jmp	$L2417
$L2574:
; Line 1619
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+72], 1
$L2573:
; Line 1621
	xor	eax, eax
	jmp	$L2417
$L2570:
; Line 1623
	mov	edx, DWORD PTR _tcp$[ebp]
	movsx	eax, BYTE PTR [edx+13]
	and	eax, 4
	cmp	eax, 4
	jne	SHORT $L2576
; Line 1625
	mov	ecx, 1
	test	ecx, ecx
	je	SHORT $L2577
; Line 1626
	push	72					; 00000048H
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+124]
	push	eax
	push	-1073741820				; c0000004H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
$L2577:
; Line 1627
	mov	ecx, DWORD PTR ?NoOfResets@TCPObj@@2HA	; TCPObj::NoOfResets
	add	ecx, 1
	mov	DWORD PTR ?NoOfResets@TCPObj@@2HA, ecx	; TCPObj::NoOfResets
; Line 1628
	mov	edx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [edx+64], 1
	jne	SHORT $L2578
; Line 1630
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+76], 1
; Line 1632
	jmp	SHORT $L2580
$L2578:
; Line 1634
	mov	ecx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [ecx+64], 0
	jne	SHORT $L2580
; Line 1635
	push	18					; 00000012H
	mov	edx, DWORD PTR _TCBRecordNumber$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DeleteTCB@TCPObj@@QAEHHH@Z		; TCPObj::DeleteTCB
$L2580:
; Line 1637
	xor	eax, eax
	jmp	$L2417
$L2576:
; Line 1639
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+108]
	push	ecx
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?mod32cmp@TCPObj@@AAEKKK@Z		; TCPObj::mod32cmp
	cmp	eax, 262020				; 0003ff84H
	jbe	SHORT $L2582
; Line 1642
	mov	edx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [edx+64], 1
	jne	SHORT $L2583
; Line 1644
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+76], 1
; Line 1647
	jmp	SHORT $L2584
$L2583:
; Line 1649
	push	19					; 00000013H
	mov	ecx, DWORD PTR _TCBRecordNumber$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DeleteTCB@TCPObj@@QAEHHH@Z		; TCPObj::DeleteTCB
$L2584:
; Line 1651
	xor	eax, eax
	jmp	$L2417
$L2582:
; Line 1655
	xor	eax, eax
	jmp	$L2417
$L2569:
; Line 1675
	mov	edx, DWORD PTR _tcp$[ebp]
	movsx	eax, BYTE PTR [edx+13]
	and	eax, 1
	cmp	eax, 1
	jne	$L2598
; Line 1678
	mov	ecx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [ecx+24], 5
	jne	$L2587
; Line 1681
	mov	edx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [edx+68], 1
	jne	SHORT $L2588
; Line 1683
	mov	eax, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [eax+72], 1
	jne	SHORT $L2589
; Line 1684
	mov	eax, -1717986919			; 99999999H
	jmp	$L2417
$L2589:
; Line 1685
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+72], 1
$L2588:
; Line 1687
	mov	edx, DWORD PTR _currenttask$[ebp]
	push	edx
	push	5
	mov	eax, DWORD PTR _tcb$[ebp]
	add	eax, 12					; 0000000cH
	push	eax
	push	16					; 00000010H
	mov	ecx, DWORD PTR _tcb$[ebp]
	add	ecx, 18					; 00000012H
	push	ecx
	mov	edx, DWORD PTR _tcb$[ebp]
	add	edx, 20					; 00000014H
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?SendMisc@TCPObj@@AAEHPAD0D0HH@Z	; TCPObj::SendMisc
	mov	DWORD PTR _retcode$[ebp], eax
; Line 1688
	mov	eax, 1
	test	eax, eax
	je	SHORT $L2590
; Line 1689
	push	41					; 00000029H
	mov	ecx, DWORD PTR _TCBRecordNumber$[ebp]
	push	ecx
	push	-1610612717				; a0000013H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
$L2590:
; Line 1690
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+24], 16			; 00000010H
; Line 1691
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L2417
$L2587:
; Line 1694
	mov	eax, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [eax+24], 6
	jne	$L2591
; Line 1697
	mov	ecx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [ecx+68], 1
	jne	SHORT $L2592
; Line 1699
	mov	edx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [edx+72], 1
	jne	SHORT $L2593
; Line 1700
	mov	eax, -1717986919			; 99999999H
	jmp	$L2417
$L2593:
; Line 1701
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+72], 1
$L2592:
; Line 1703
	mov	ecx, DWORD PTR _currenttask$[ebp]
	push	ecx
	push	5
	mov	edx, DWORD PTR _tcb$[ebp]
	add	edx, 12					; 0000000cH
	push	edx
	push	16					; 00000010H
	mov	eax, DWORD PTR _tcb$[ebp]
	add	eax, 18					; 00000012H
	push	eax
	mov	ecx, DWORD PTR _tcb$[ebp]
	add	ecx, 20					; 00000014H
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?SendMisc@TCPObj@@AAEHPAD0D0HH@Z	; TCPObj::SendMisc
	mov	DWORD PTR _retcode$[ebp], eax
; Line 1704
	mov	edx, 1
	test	edx, edx
	je	SHORT $L2594
; Line 1705
	push	61					; 0000003dH
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+124]
	push	ecx
	push	-1610612716				; a0000014H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
$L2594:
; Line 1707
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L2595
; Line 1708
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L2417
$L2595:
; Line 1710
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+24], 9
; Line 1713
	mov	eax, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [eax+64], 1
	jne	SHORT $L2596
; Line 1715
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+76], 1
; Line 1718
	jmp	SHORT $L2597
$L2596:
; Line 1719
	push	21					; 00000015H
	mov	edx, DWORD PTR _TCBRecordNumber$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DeleteTCB@TCPObj@@QAEHHH@Z		; TCPObj::DeleteTCB
$L2597:
; Line 1721
	xor	eax, eax
	jmp	$L2417
$L2591:
; Line 1724
	mov	eax, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [eax+24], 7
	jne	$L2598
; Line 1727
	mov	ecx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [ecx+68], 1
	jne	SHORT $L2599
; Line 1729
	mov	edx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [edx+72], 1
	jne	SHORT $L2600
; Line 1730
	mov	eax, -1717986919			; 99999999H
	jmp	$L2417
$L2600:
; Line 1731
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+72], 1
$L2599:
; Line 1733
	mov	ecx, DWORD PTR _currenttask$[ebp]
	push	ecx
	push	5
	mov	edx, DWORD PTR _tcb$[ebp]
	add	edx, 12					; 0000000cH
	push	edx
	push	16					; 00000010H
	mov	eax, DWORD PTR _tcb$[ebp]
	add	eax, 18					; 00000012H
	push	eax
	mov	ecx, DWORD PTR _tcb$[ebp]
	add	ecx, 20					; 00000014H
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?SendMisc@TCPObj@@AAEHPAD0D0HH@Z	; TCPObj::SendMisc
	mov	DWORD PTR _retcode$[ebp], eax
; Line 1734
	mov	edx, 1
	test	edx, edx
	je	SHORT $L2601
; Line 1735
	push	62					; 0000003eH
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+124]
	push	ecx
	push	-1610612715				; a0000015H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
$L2601:
; Line 1736
	push	372					; 00000174H
	push	OFFSET FLAT:$SG2602
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1737
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+24], 8
; Line 1739
	mov	eax, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [eax+68], 1
	jne	SHORT $L2603
; Line 1741
	mov	ecx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [ecx+72], 1
	jne	SHORT $L2604
; Line 1742
	mov	eax, -1717986919			; 99999999H
	jmp	SHORT $L2417
$L2604:
; Line 1743
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+72], 1
; Line 1746
	jmp	SHORT $L2605
$L2603:
; Line 1747
	push	22					; 00000016H
	mov	eax, DWORD PTR _TCBRecordNumber$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DeleteTCB@TCPObj@@QAEHHH@Z		; TCPObj::DeleteTCB
$L2605:
; Line 1749
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	SHORT $L2417
$L2598:
; Line 1797
	xor	eax, eax
$L2417:
; Line 1798
	mov	esp, ebp
	pop	ebp
	ret	20					; 00000014H
?OtherHandler@TCPObj@@AAEHPADHHJH@Z ENDP		; TCPObj::OtherHandler
_TEXT	ENDS
;	COMDAT ??0WCirList@@QAE@XZ
_TEXT	SEGMENT
_this$ = -4
??0WCirList@@QAE@XZ PROC NEAR				; WCirList::WCirList, COMDAT
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
??0WCirList@@QAE@XZ ENDP				; WCirList::WCirList
_TEXT	ENDS
_TEXT	SEGMENT
_Header$ = 8
_TCPPack$ = 12
_this$ = -20
_dataoffset$ = -12
_temp$ = -16
_Options$ = -8
_temp1$ = -4
?FormatHeader@TCPObj@@AAEXPAD0@Z PROC NEAR		; TCPObj::FormatHeader
; Line 1807
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	mov	DWORD PTR _this$[ebp], ecx
; Line 1808
	mov	eax, DWORD PTR _Header$[ebp]
	mov	ecx, DWORD PTR _TCPPack$[ebp]
	mov	dl, BYTE PTR [ecx+1]
	mov	BYTE PTR [eax], dl
; Line 1809
	mov	eax, DWORD PTR _Header$[ebp]
	mov	ecx, DWORD PTR _TCPPack$[ebp]
	mov	dl, BYTE PTR [ecx]
	mov	BYTE PTR [eax+1], dl
; Line 1810
	mov	eax, DWORD PTR _Header$[ebp]
	mov	ecx, DWORD PTR _TCPPack$[ebp]
	mov	dl, BYTE PTR [ecx+3]
	mov	BYTE PTR [eax+2], dl
; Line 1811
	mov	eax, DWORD PTR _Header$[ebp]
	mov	ecx, DWORD PTR _TCPPack$[ebp]
	mov	dl, BYTE PTR [ecx+2]
	mov	BYTE PTR [eax+3], dl
; Line 1813
	mov	eax, DWORD PTR _Header$[ebp]
	mov	ecx, DWORD PTR _TCPPack$[ebp]
	mov	dl, BYTE PTR [ecx+7]
	mov	BYTE PTR [eax+4], dl
; Line 1814
	mov	eax, DWORD PTR _Header$[ebp]
	mov	ecx, DWORD PTR _TCPPack$[ebp]
	mov	dl, BYTE PTR [ecx+6]
	mov	BYTE PTR [eax+5], dl
; Line 1815
	mov	eax, DWORD PTR _Header$[ebp]
	mov	ecx, DWORD PTR _TCPPack$[ebp]
	mov	dl, BYTE PTR [ecx+5]
	mov	BYTE PTR [eax+6], dl
; Line 1816
	mov	eax, DWORD PTR _Header$[ebp]
	mov	ecx, DWORD PTR _TCPPack$[ebp]
	mov	dl, BYTE PTR [ecx+4]
	mov	BYTE PTR [eax+7], dl
; Line 1818
	mov	eax, DWORD PTR _Header$[ebp]
	mov	ecx, DWORD PTR _TCPPack$[ebp]
	mov	dl, BYTE PTR [ecx+11]
	mov	BYTE PTR [eax+8], dl
; Line 1819
	mov	eax, DWORD PTR _Header$[ebp]
	mov	ecx, DWORD PTR _TCPPack$[ebp]
	mov	dl, BYTE PTR [ecx+10]
	mov	BYTE PTR [eax+9], dl
; Line 1820
	mov	eax, DWORD PTR _Header$[ebp]
	mov	ecx, DWORD PTR _TCPPack$[ebp]
	mov	dl, BYTE PTR [ecx+9]
	mov	BYTE PTR [eax+10], dl
; Line 1821
	mov	eax, DWORD PTR _Header$[ebp]
	mov	ecx, DWORD PTR _TCPPack$[ebp]
	mov	dl, BYTE PTR [ecx+8]
	mov	BYTE PTR [eax+11], dl
; Line 1823
	mov	eax, DWORD PTR _Header$[ebp]
	mov	ecx, DWORD PTR _TCPPack$[ebp]
	mov	dl, BYTE PTR [ecx+12]
	mov	BYTE PTR [eax+12], dl
; Line 1824
	mov	eax, DWORD PTR _Header$[ebp]
	movsx	ecx, BYTE PTR [eax+12]
	sar	ecx, 4
	mov	edx, DWORD PTR _Header$[ebp]
	mov	BYTE PTR [edx+12], cl
; Line 1825
	mov	eax, DWORD PTR _Header$[ebp]
	mov	ecx, DWORD PTR _TCPPack$[ebp]
	mov	dl, BYTE PTR [ecx+13]
	mov	BYTE PTR [eax+13], dl
; Line 1827
	mov	eax, DWORD PTR _Header$[ebp]
	mov	ecx, DWORD PTR _TCPPack$[ebp]
	mov	dl, BYTE PTR [ecx+15]
	mov	BYTE PTR [eax+14], dl
; Line 1828
	mov	eax, DWORD PTR _Header$[ebp]
	mov	ecx, DWORD PTR _TCPPack$[ebp]
	mov	dl, BYTE PTR [ecx+14]
	mov	BYTE PTR [eax+15], dl
; Line 1830
	mov	eax, DWORD PTR _Header$[ebp]
	mov	ecx, DWORD PTR _TCPPack$[ebp]
	mov	dl, BYTE PTR [ecx+17]
	mov	BYTE PTR [eax+16], dl
; Line 1831
	mov	eax, DWORD PTR _Header$[ebp]
	mov	ecx, DWORD PTR _TCPPack$[ebp]
	mov	dl, BYTE PTR [ecx+16]
	mov	BYTE PTR [eax+17], dl
; Line 1833
	mov	eax, DWORD PTR _Header$[ebp]
	mov	ecx, DWORD PTR _TCPPack$[ebp]
	mov	dl, BYTE PTR [ecx+19]
	mov	BYTE PTR [eax+18], dl
; Line 1834
	mov	eax, DWORD PTR _Header$[ebp]
	mov	ecx, DWORD PTR _TCPPack$[ebp]
	mov	dl, BYTE PTR [ecx+18]
	mov	BYTE PTR [eax+19], dl
; Line 1837
	mov	eax, DWORD PTR _Header$[ebp]
	movsx	ecx, BYTE PTR [eax+12]
	mov	edx, DWORD PTR _TCPPack$[ebp]
	lea	eax, DWORD PTR [edx+ecx*4]
	mov	DWORD PTR _dataoffset$[ebp], eax
; Line 1838
	lea	ecx, DWORD PTR _dataoffset$[ebp]
	mov	DWORD PTR _temp$[ebp], ecx
; Line 1841
	mov	edx, DWORD PTR _TCPPack$[ebp]
	add	edx, 20					; 00000014H
	mov	DWORD PTR _Options$[ebp], edx
; Line 1842
	lea	eax, DWORD PTR _Options$[ebp]
	mov	DWORD PTR _temp1$[ebp], eax
; Line 1844
	mov	ecx, DWORD PTR _Header$[ebp]
	mov	edx, DWORD PTR _temp$[ebp]
	mov	al, BYTE PTR [edx]
	mov	BYTE PTR [ecx+20], al
; Line 1845
	mov	ecx, DWORD PTR _Header$[ebp]
	mov	edx, DWORD PTR _temp$[ebp]
	mov	al, BYTE PTR [edx+1]
	mov	BYTE PTR [ecx+21], al
; Line 1846
	mov	ecx, DWORD PTR _Header$[ebp]
	mov	edx, DWORD PTR _temp$[ebp]
	mov	al, BYTE PTR [edx+2]
	mov	BYTE PTR [ecx+22], al
; Line 1847
	mov	ecx, DWORD PTR _Header$[ebp]
	mov	edx, DWORD PTR _temp$[ebp]
	mov	al, BYTE PTR [edx+3]
	mov	BYTE PTR [ecx+23], al
; Line 1849
	mov	ecx, DWORD PTR _Header$[ebp]
	mov	edx, DWORD PTR _temp1$[ebp]
	mov	al, BYTE PTR [edx]
	mov	BYTE PTR [ecx+24], al
; Line 1850
	mov	ecx, DWORD PTR _Header$[ebp]
	mov	edx, DWORD PTR _temp1$[ebp]
	mov	al, BYTE PTR [edx+1]
	mov	BYTE PTR [ecx+25], al
; Line 1851
	mov	ecx, DWORD PTR _Header$[ebp]
	mov	edx, DWORD PTR _temp1$[ebp]
	mov	al, BYTE PTR [edx+2]
	mov	BYTE PTR [ecx+26], al
; Line 1852
	mov	ecx, DWORD PTR _Header$[ebp]
	mov	edx, DWORD PTR _temp1$[ebp]
	mov	al, BYTE PTR [edx+3]
	mov	BYTE PTR [ecx+27], al
; Line 1853
	mov	esp, ebp
	pop	ebp
	ret	8
?FormatHeader@TCPObj@@AAEXPAD0@Z ENDP			; TCPObj::FormatHeader
_tdatagram$ = 8
_TSLength$ = 12
_sourceIP$ = 16
_targetIP$ = 20
_protocol$ = 24
_this$ = -32
_padd$ = -28
_word16$ = -20
_sum$ = -12
_temp1$ = -8
_temp2$ = -16
_checksum$ = -4
_i$ = -24
?TCPChecksum@TCPObj@@AAEGPADJ00I@Z PROC NEAR		; TCPObj::TCPChecksum
; Line 1859
	push	ebp
	mov	ebp, esp
	sub	esp, 32					; 00000020H
	mov	DWORD PTR _this$[ebp], ecx
; Line 1862
	mov	WORD PTR _padd$[ebp], 0
; Line 1863
	mov	DWORD PTR _word16$[ebp], 0
; Line 1864
	mov	DWORD PTR _sum$[ebp], 0
; Line 1865
	mov	DWORD PTR _temp1$[ebp], 0
; Line 1866
	mov	DWORD PTR _temp2$[ebp], 0
; Line 1867
	mov	WORD PTR _checksum$[ebp], 0
; Line 1868
	mov	eax, DWORD PTR _tdatagram$[ebp]
	mov	BYTE PTR [eax+16], 0
; Line 1869
	mov	ecx, DWORD PTR _tdatagram$[ebp]
	mov	BYTE PTR [ecx+17], 0
; Line 1875
	mov	edx, DWORD PTR _TSLength$[ebp]
	and	edx, 1
	test	edx, edx
	je	SHORT $L2635
; Line 1877
	mov	WORD PTR _padd$[ebp], 1
; Line 1878
	mov	eax, DWORD PTR _tdatagram$[ebp]
	add	eax, DWORD PTR _TSLength$[ebp]
	mov	BYTE PTR [eax], 0
$L2635:
; Line 1885
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L2637
$L2638:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 2
	mov	DWORD PTR _i$[ebp], ecx
$L2637:
	mov	edx, DWORD PTR _padd$[ebp]
	and	edx, 65535				; 0000ffffH
	mov	eax, DWORD PTR _TSLength$[ebp]
	add	eax, edx
	cmp	DWORD PTR _i$[ebp], eax
	jge	SHORT $L2639
; Line 1887
	mov	ecx, DWORD PTR _tdatagram$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	movsx	edx, BYTE PTR [ecx]
	mov	DWORD PTR _temp1$[ebp], edx
; Line 1888
	mov	eax, DWORD PTR _tdatagram$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	movsx	ecx, BYTE PTR [eax+1]
	mov	DWORD PTR _temp2$[ebp], ecx
; Line 1889
	mov	edx, DWORD PTR _temp1$[ebp]
	shl	edx, 8
	and	edx, 65280				; 0000ff00H
	mov	eax, DWORD PTR _temp2$[ebp]
	and	eax, 255				; 000000ffH
	add	edx, eax
	mov	DWORD PTR _word16$[ebp], edx
; Line 1890
	mov	ecx, DWORD PTR _word16$[ebp]
	and	ecx, 65535				; 0000ffffH
	mov	edx, DWORD PTR _sum$[ebp]
	add	edx, ecx
	mov	DWORD PTR _sum$[ebp], edx
; Line 1891
	jmp	SHORT $L2638
$L2639:
; Line 1895
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L2640
$L2641:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 2
	mov	DWORD PTR _i$[ebp], eax
$L2640:
	cmp	DWORD PTR _i$[ebp], 4
	jge	SHORT $L2642
; Line 1897
	mov	ecx, DWORD PTR _sourceIP$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	movsx	edx, BYTE PTR [ecx]
	mov	DWORD PTR _temp1$[ebp], edx
; Line 1898
	mov	eax, DWORD PTR _sourceIP$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	movsx	ecx, BYTE PTR [eax+1]
	mov	DWORD PTR _temp2$[ebp], ecx
; Line 1899
	mov	edx, DWORD PTR _temp1$[ebp]
	shl	edx, 8
	and	edx, 65280				; 0000ff00H
	mov	eax, DWORD PTR _temp2$[ebp]
	and	eax, 255				; 000000ffH
	add	edx, eax
	mov	DWORD PTR _word16$[ebp], edx
; Line 1900
	mov	ecx, DWORD PTR _word16$[ebp]
	and	ecx, 65535				; 0000ffffH
	mov	edx, DWORD PTR _sum$[ebp]
	add	edx, ecx
	mov	DWORD PTR _sum$[ebp], edx
; Line 1901
	jmp	SHORT $L2641
$L2642:
; Line 1903
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L2643
$L2644:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 2
	mov	DWORD PTR _i$[ebp], eax
$L2643:
	cmp	DWORD PTR _i$[ebp], 4
	jge	SHORT $L2645
; Line 1905
	mov	ecx, DWORD PTR _targetIP$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	movsx	edx, BYTE PTR [ecx]
	mov	DWORD PTR _temp1$[ebp], edx
; Line 1906
	mov	eax, DWORD PTR _targetIP$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	movsx	ecx, BYTE PTR [eax+1]
	mov	DWORD PTR _temp2$[ebp], ecx
; Line 1907
	mov	edx, DWORD PTR _temp1$[ebp]
	shl	edx, 8
	and	edx, 65280				; 0000ff00H
	mov	eax, DWORD PTR _temp2$[ebp]
	and	eax, 255				; 000000ffH
	add	edx, eax
	mov	DWORD PTR _word16$[ebp], edx
; Line 1908
	mov	ecx, DWORD PTR _word16$[ebp]
	and	ecx, 65535				; 0000ffffH
	mov	edx, DWORD PTR _sum$[ebp]
	add	edx, ecx
	mov	DWORD PTR _sum$[ebp], edx
; Line 1909
	jmp	SHORT $L2644
$L2645:
; Line 1911
	mov	eax, DWORD PTR _protocol$[ebp]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _word16$[ebp], eax
; Line 1912
	mov	ecx, DWORD PTR _word16$[ebp]
	and	ecx, 65535				; 0000ffffH
	mov	edx, DWORD PTR _sum$[ebp]
	add	edx, ecx
	mov	DWORD PTR _sum$[ebp], edx
; Line 1914
	mov	eax, DWORD PTR _TSLength$[ebp]
	and	eax, 65535				; 0000ffffH
	mov	DWORD PTR _word16$[ebp], eax
; Line 1915
	mov	ecx, DWORD PTR _word16$[ebp]
	and	ecx, 65535				; 0000ffffH
	mov	edx, DWORD PTR _sum$[ebp]
	add	edx, ecx
	mov	DWORD PTR _sum$[ebp], edx
$L2647:
; Line 1918
	mov	eax, DWORD PTR _sum$[ebp]
	shr	eax, 16					; 00000010H
	test	eax, eax
	je	SHORT $L2648
; Line 1919
	mov	ecx, DWORD PTR _sum$[ebp]
	and	ecx, 65535				; 0000ffffH
	mov	edx, DWORD PTR _sum$[ebp]
	shr	edx, 16					; 00000010H
	add	ecx, edx
	mov	DWORD PTR _sum$[ebp], ecx
	jmp	SHORT $L2647
$L2648:
; Line 1922
	mov	eax, DWORD PTR _sum$[ebp]
	not	eax
	mov	DWORD PTR _sum$[ebp], eax
; Line 1924
	mov	cx, WORD PTR _sum$[ebp]
	mov	WORD PTR _checksum$[ebp], cx
; Line 1926
	mov	ax, WORD PTR _checksum$[ebp]
; Line 1927
	mov	esp, ebp
	pop	ebp
	ret	20					; 00000014H
?TCPChecksum@TCPObj@@AAEGPADJ00I@Z ENDP			; TCPObj::TCPChecksum
_IPAdd$ = 8
_SrcPortNum$ = 12
_this$ = -16
_TCBPointer$ = -8
_hashval$ = -4
_next$ = -12
?SearchTCB@TCPObj@@AAEHQAD0@Z PROC NEAR			; TCPObj::SearchTCB
; Line 1937
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	mov	DWORD PTR _this$[ebp], ecx
; Line 1939
	mov	eax, DWORD PTR ?TCBBase@TCPObj@@0KA	; TCPObj::TCBBase
	mov	DWORD PTR _TCBPointer$[ebp], eax
; Line 1943
	mov	ecx, DWORD PTR _SrcPortNum$[ebp]
	push	ecx
	mov	edx, DWORD PTR _IPAdd$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 328				; 00000148H
	call	?hashfun@TcphashIndex@@QAEJPAD0@Z	; TcphashIndex::hashfun
	mov	DWORD PTR _hashval$[ebp], eax
; Line 1944
	mov	eax, DWORD PTR _hashval$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 328				; 00000148H
	call	?getIndex@TcphashIndex@@QAEJJ@Z		; TcphashIndex::getIndex
	mov	DWORD PTR _next$[ebp], eax
$L2660:
; Line 1946
	cmp	DWORD PTR _next$[ebp], -1
	je	$L2661
; Line 1951
	mov	ecx, DWORD PTR _next$[ebp]
	imul	ecx, 288				; 00000120H
	mov	edx, DWORD PTR _TCBPointer$[ebp]
	cmp	DWORD PTR [edx+ecx], 1
	jne	$L2662
	mov	eax, DWORD PTR _next$[ebp]
	imul	eax, 288				; 00000120H
	mov	ecx, DWORD PTR _TCBPointer$[ebp]
	movsx	edx, BYTE PTR [ecx+eax+20]
	mov	eax, DWORD PTR _IPAdd$[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	edx, ecx
	jne	$L2662
	mov	edx, DWORD PTR _next$[ebp]
	imul	edx, 288				; 00000120H
	mov	eax, DWORD PTR _TCBPointer$[ebp]
	movsx	ecx, BYTE PTR [eax+edx+21]
	mov	edx, DWORD PTR _IPAdd$[ebp]
	movsx	eax, BYTE PTR [edx+1]
	cmp	ecx, eax
	jne	SHORT $L2662
	mov	ecx, DWORD PTR _next$[ebp]
	imul	ecx, 288				; 00000120H
	mov	edx, DWORD PTR _TCBPointer$[ebp]
	movsx	eax, BYTE PTR [edx+ecx+22]
	mov	ecx, DWORD PTR _IPAdd$[ebp]
	movsx	edx, BYTE PTR [ecx+2]
	cmp	eax, edx
	jne	SHORT $L2662
	mov	eax, DWORD PTR _next$[ebp]
	imul	eax, 288				; 00000120H
	mov	ecx, DWORD PTR _TCBPointer$[ebp]
	movsx	edx, BYTE PTR [ecx+eax+23]
	mov	eax, DWORD PTR _IPAdd$[ebp]
	movsx	ecx, BYTE PTR [eax+3]
	cmp	edx, ecx
	jne	SHORT $L2662
	mov	edx, DWORD PTR _next$[ebp]
	imul	edx, 288				; 00000120H
	mov	eax, DWORD PTR _TCBPointer$[ebp]
	movsx	ecx, BYTE PTR [eax+edx+18]
	mov	edx, DWORD PTR _SrcPortNum$[ebp]
	movsx	eax, BYTE PTR [edx]
	cmp	ecx, eax
	jne	SHORT $L2662
	mov	ecx, DWORD PTR _next$[ebp]
	imul	ecx, 288				; 00000120H
	mov	edx, DWORD PTR _TCBPointer$[ebp]
	movsx	eax, BYTE PTR [edx+ecx+19]
	mov	ecx, DWORD PTR _SrcPortNum$[ebp]
	movsx	edx, BYTE PTR [ecx+1]
	cmp	eax, edx
	jne	SHORT $L2662
; Line 1954
	mov	eax, DWORD PTR _next$[ebp]
	jmp	SHORT $L2654
$L2662:
; Line 1959
	mov	eax, DWORD PTR _next$[ebp]
	imul	eax, 288				; 00000120H
	mov	ecx, DWORD PTR _TCBPointer$[ebp]
	mov	edx, DWORD PTR _next$[ebp]
	cmp	edx, DWORD PTR [ecx+eax+260]
	jne	SHORT $L2663
; Line 1961
	mov	eax, DWORD PTR _next$[ebp]
	imul	eax, 288				; 00000120H
	mov	ecx, DWORD PTR _TCBPointer$[ebp]
	mov	DWORD PTR [ecx+eax+260], -1
$L2663:
; Line 1965
	mov	edx, DWORD PTR _next$[ebp]
	imul	edx, 288				; 00000120H
	mov	eax, DWORD PTR _TCBPointer$[ebp]
	mov	ecx, DWORD PTR [eax+edx+260]
	mov	DWORD PTR _next$[ebp], ecx
; Line 1966
	jmp	$L2660
$L2661:
; Line 1967
	or	eax, -1
$L2654:
; Line 1969
	mov	esp, ebp
	pop	ebp
	ret	8
?SearchTCB@TCPObj@@AAEHQAD0@Z ENDP			; TCPObj::SearchTCB
_TCPPack$ = 8
_this$ = -8
_seqnum$ = -4
?charToseqnum@TCPObj@@AAEKPAD@Z PROC NEAR		; TCPObj::charToseqnum
; Line 1974
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 1976
	mov	eax, DWORD PTR _TCPPack$[ebp]
	mov	cl, BYTE PTR [eax+3]
	mov	BYTE PTR _seqnum$[ebp], cl
; Line 1977
	mov	edx, DWORD PTR _TCPPack$[ebp]
	mov	al, BYTE PTR [edx+2]
	mov	BYTE PTR _seqnum$[ebp+1], al
; Line 1978
	mov	ecx, DWORD PTR _TCPPack$[ebp]
	mov	dl, BYTE PTR [ecx+1]
	mov	BYTE PTR _seqnum$[ebp+2], dl
; Line 1979
	mov	eax, DWORD PTR _TCPPack$[ebp]
	mov	cl, BYTE PTR [eax]
	mov	BYTE PTR _seqnum$[ebp+3], cl
; Line 1980
	mov	eax, DWORD PTR _seqnum$[ebp]
; Line 1981
	mov	esp, ebp
	pop	ebp
	ret	4
?charToseqnum@TCPObj@@AAEKPAD@Z ENDP			; TCPObj::charToseqnum
_TCPPack$ = 8
_this$ = -8
_seqnum$ = -4
?charToWindow@TCPObj@@AAEGPAD@Z PROC NEAR		; TCPObj::charToWindow
; Line 1984
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 1986
	mov	eax, DWORD PTR _TCPPack$[ebp]
	mov	cl, BYTE PTR [eax+1]
	mov	BYTE PTR _seqnum$[ebp], cl
; Line 1987
	mov	edx, DWORD PTR _TCPPack$[ebp]
	mov	al, BYTE PTR [edx]
	mov	BYTE PTR _seqnum$[ebp+1], al
; Line 1989
	mov	ax, WORD PTR _seqnum$[ebp]
; Line 1990
	mov	esp, ebp
	pop	ebp
	ret	4
?charToWindow@TCPObj@@AAEGPAD@Z ENDP			; TCPObj::charToWindow
_TEXT	ENDS
PUBLIC	?FormatTCPPacket@TCPObj@@AAEHPAD00DGKK0HHH@Z	; TCPObj::FormatTCPPacket
EXTRN	?TDLFull@EtherObj@@QAEHXZ:NEAR			; EtherObj::TDLFull
EXTRN	?FormatEthPacket@EtherObj@@QAEHPADHH0JHH@Z:NEAR	; EtherObj::FormatEthPacket
EXTRN	?FormatIPPacket@IPObj@@QAEHPADHQAD1HH@Z:NEAR	; IPObj::FormatIPPacket
EXTRN	?TDLPointer@EtherObj@@2JA:DWORD			; EtherObj::TDLPointer
EXTRN	?TDLDataPointer@EtherObj@@2JA:DWORD		; EtherObj::TDLDataPointer
EXTRN	?SendInPtr@EtherObj@@2JA:DWORD			; EtherObj::SendInPtr
_TEXT	SEGMENT
_destIP$ = 8
_destPort$ = 12
_tempseq$ = 16
_Flags$ = 20
_TargetMAC$ = 24
_sendtype$ = 28
_currenttask$ = 32
_this$ = -68
_EO$ = -40
_send_buffer$ = -56
_p1$ = -48
_c3$ = -28
_c4$ = -32
_x$ = -44
_retcode$ = -8
_data$ = -20
_TCPPack_size$ = -64
_InPtr$ = -4
_TCBRecordNum$ = -24
_tcb$ = -60
?SendMisc@TCPObj@@AAEHPAD0KD0HH@Z PROC NEAR		; TCPObj::SendMisc
; Line 1998
	push	ebp
	mov	ebp, esp
	sub	esp, 68					; 00000044H
	mov	DWORD PTR _this$[ebp], ecx
; Line 2000
	lea	ecx, DWORD PTR _EO$[ebp]
	call	??0EtherObj@@QAE@XZ			; EtherObj::EtherObj
; Line 2005
	mov	DWORD PTR _x$[ebp], 0
; Line 2007
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2009
	mov	DWORD PTR _TCPPack_size$[ebp], 0
; Line 2010
	mov	DWORD PTR _InPtr$[ebp], 0
; Line 2012
	mov	eax, DWORD PTR _destPort$[ebp]
	push	eax
	mov	ecx, DWORD PTR _destIP$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?SearchTCB@TCPObj@@AAEHQAD0@Z		; TCPObj::SearchTCB
	mov	DWORD PTR _TCBRecordNum$[ebp], eax
; Line 2015
	lea	edx, DWORD PTR _c3$[ebp]
	mov	DWORD PTR _p1$[ebp], edx
; Line 2016
	lea	eax, DWORD PTR _c4$[ebp]
	mov	DWORD PTR _send_buffer$[ebp], eax
; Line 2018
	lea	ecx, DWORD PTR _EO$[ebp]
	call	?TDLFull@EtherObj@@QAEHXZ		; EtherObj::TDLFull
	cmp	eax, 1
	jne	SHORT $L2699
; Line 2020
	mov	eax, -30				; ffffffe2H
	jmp	$L2685
$L2699:
; Line 2024
	mov	ecx, DWORD PTR ?SendInPtr@EtherObj@@2JA	; EtherObj::SendInPtr
	shl	ecx, 4
	mov	edx, DWORD PTR ?TDLPointer@EtherObj@@2JA ; EtherObj::TDLPointer
	lea	eax, DWORD PTR [edx+ecx-1114112]
	mov	DWORD PTR _x$[ebp], eax
; Line 2027
	mov	ecx, DWORD PTR _x$[ebp]
	add	ecx, 1114112				; 00110000H
	mov	edx, DWORD PTR ?TDLPointer@EtherObj@@2JA ; EtherObj::TDLPointer
	add	edx, 65520				; 0000fff0H
	cmp	ecx, edx
	jle	SHORT $L2700
; Line 2029
	mov	eax, -22				; ffffffeaH
	jmp	$L2685
$L2700:
; Line 2032
	mov	eax, DWORD PTR _x$[ebp]
	mov	DWORD PTR _p1$[ebp], eax
; Line 2035
	mov	ecx, DWORD PTR ?TDLDataPointer@EtherObj@@2JA ; EtherObj::TDLDataPointer
	add	ecx, 6553600				; 00640000H
	mov	edx, DWORD PTR _p1$[ebp]
	cmp	DWORD PTR [edx], ecx
	jl	SHORT $L2702
; Line 2037
	mov	eax, -23				; ffffffe9H
	jmp	$L2685
$L2702:
; Line 2040
	mov	eax, DWORD PTR _p1$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _send_buffer$[ebp], ecx
; Line 2042
	mov	edx, DWORD PTR ?SendInPtr@EtherObj@@2JA	; EtherObj::SendInPtr
	mov	DWORD PTR _InPtr$[ebp], edx
; Line 2044
	mov	eax, DWORD PTR ?SendInPtr@EtherObj@@2JA	; EtherObj::SendInPtr
	add	eax, 1
	mov	DWORD PTR ?SendInPtr@EtherObj@@2JA, eax	; EtherObj::SendInPtr
; Line 2046
	cmp	DWORD PTR ?SendInPtr@EtherObj@@2JA, 4096 ; EtherObj::SendInPtr, 00001000H
	jne	SHORT $L2704
; Line 2048
	mov	DWORD PTR ?SendInPtr@EtherObj@@2JA, 0	; EtherObj::SendInPtr
$L2704:
; Line 2052
	mov	ecx, DWORD PTR _send_buffer$[ebp]
	sub	ecx, 1114078				; 0010ffdeH
	mov	DWORD PTR _send_buffer$[ebp], ecx
; Line 2053
	cmp	DWORD PTR _TCBRecordNum$[ebp], -1
	jne	SHORT $L2705
; Line 2054
	mov	edx, DWORD PTR _currenttask$[ebp]
	push	edx
	push	0
	push	0
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	push	0
	mov	ecx, DWORD PTR _tempseq$[ebp]
	push	ecx
	push	0
	mov	dl, BYTE PTR _Flags$[ebp]
	push	edx
	mov	eax, DWORD PTR _destPort$[ebp]
	push	eax
	mov	ecx, DWORD PTR _destIP$[ebp]
	push	ecx
	mov	edx, DWORD PTR _send_buffer$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?FormatTCPPacket@TCPObj@@AAEHPAD00DGKK0HHH@Z ; TCPObj::FormatTCPPacket
	mov	DWORD PTR _TCPPack_size$[ebp], eax
	jmp	SHORT $L2706
$L2705:
; Line 2056
	mov	eax, DWORD PTR _TCBRecordNum$[ebp]
	imul	eax, 288				; 00000120H
	mov	ecx, DWORD PTR ?TCBBase@TCPObj@@0KA	; TCPObj::TCBBase
	add	ecx, eax
	mov	DWORD PTR _tcb$[ebp], ecx
; Line 2058
	mov	edx, DWORD PTR _currenttask$[ebp]
	push	edx
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+112]
	push	ecx
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+100]
	push	eax
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	dx, WORD PTR [ecx+140]
	push	edx
	mov	al, BYTE PTR _Flags$[ebp]
	push	eax
	mov	ecx, DWORD PTR _tcb$[ebp]
	add	ecx, 18					; 00000012H
	push	ecx
	mov	edx, DWORD PTR _tcb$[ebp]
	add	edx, 20					; 00000014H
	push	edx
	mov	eax, DWORD PTR _send_buffer$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?FormatTCPPacket@TCPObj@@AAEHPAD00DGKK0HHH@Z ; TCPObj::FormatTCPPacket
	mov	DWORD PTR _TCPPack_size$[ebp], eax
$L2706:
; Line 2064
	mov	ecx, DWORD PTR _send_buffer$[ebp]
	sub	ecx, 20					; 00000014H
	mov	DWORD PTR _send_buffer$[ebp], ecx
; Line 2069
	mov	edx, DWORD PTR _currenttask$[ebp]
	push	edx
	push	6
	mov	eax, DWORD PTR _TargetMAC$[ebp]
	push	eax
	mov	ecx, DWORD PTR _destIP$[ebp]
	push	ecx
	mov	edx, DWORD PTR _TCPPack_size$[ebp]
	push	edx
	mov	eax, DWORD PTR _send_buffer$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 288				; 00000120H
	call	?FormatIPPacket@IPObj@@QAEHPADHQAD1HH@Z	; IPObj::FormatIPPacket
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2070
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L2709
; Line 2071
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	SHORT $L2685
$L2709:
; Line 2073
	mov	ecx, DWORD PTR _send_buffer$[ebp]
	sub	ecx, 14					; 0000000eH
	mov	DWORD PTR _send_buffer$[ebp], ecx
; Line 2075
	mov	edx, DWORD PTR ?SendCountTotal@TCPObj@@2HA ; TCPObj::SendCountTotal
	add	edx, 1
	mov	DWORD PTR ?SendCountTotal@TCPObj@@2HA, edx ; TCPObj::SendCountTotal
; Line 2110
	mov	eax, DWORD PTR _currenttask$[ebp]
	push	eax
	mov	ecx, DWORD PTR _sendtype$[ebp]
	push	ecx
	mov	edx, DWORD PTR _InPtr$[ebp]
	push	edx
	mov	eax, DWORD PTR _TargetMAC$[ebp]
	push	eax
	push	2048					; 00000800H
	mov	ecx, DWORD PTR _TCPPack_size$[ebp]
	add	ecx, 20					; 00000014H
	push	ecx
	mov	edx, DWORD PTR _send_buffer$[ebp]
	push	edx
	lea	ecx, DWORD PTR _EO$[ebp]
	call	?FormatEthPacket@EtherObj@@QAEHPADHH0JHH@Z ; EtherObj::FormatEthPacket
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2111
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L2710
; Line 2118
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	SHORT $L2685
$L2710:
; Line 2122
	xor	eax, eax
$L2685:
; Line 2123
	mov	esp, ebp
	pop	ebp
	ret	28					; 0000001cH
?SendMisc@TCPObj@@AAEHPAD0KD0HH@Z ENDP			; TCPObj::SendMisc
_packet$ = 8
_destIP$ = 12
_TargetMAC$ = 16
_currenttask$ = 20
_this$ = -72
_EO$ = -40
_send_buffer$ = -60
_p1$ = -48
_c3$ = -28
_c4$ = -32
_x$ = -44
_i$ = -52
_retcode$ = -12
_TCPPack_size$ = -68
_InPtr$ = -4
_checksum$ = -8
_j$ = -56
_k$ = -64
?SendMisc@TCPObj@@AAEHPAD00H@Z PROC NEAR		; TCPObj::SendMisc
; Line 2131
	push	ebp
	mov	ebp, esp
	sub	esp, 72					; 00000048H
	mov	DWORD PTR _this$[ebp], ecx
; Line 2132
	lea	ecx, DWORD PTR _EO$[ebp]
	call	??0EtherObj@@QAE@XZ			; EtherObj::EtherObj
; Line 2137
	mov	DWORD PTR _x$[ebp], 0
; Line 2138
	mov	DWORD PTR _i$[ebp], 0
; Line 2139
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2141
	mov	DWORD PTR _TCPPack_size$[ebp], 20	; 00000014H
; Line 2142
	mov	DWORD PTR _InPtr$[ebp], 0
; Line 2143
	mov	DWORD PTR _checksum$[ebp], 0
; Line 2144
	mov	DWORD PTR _j$[ebp], 0
; Line 2145
	mov	DWORD PTR _k$[ebp], 0
; Line 2147
	lea	eax, DWORD PTR _c3$[ebp]
	mov	DWORD PTR _p1$[ebp], eax
; Line 2148
	lea	ecx, DWORD PTR _c4$[ebp]
	mov	DWORD PTR _send_buffer$[ebp], ecx
; Line 2150
	lea	ecx, DWORD PTR _EO$[ebp]
	call	?TDLFull@EtherObj@@QAEHXZ		; EtherObj::TDLFull
	cmp	eax, 1
	jne	SHORT $L2732
; Line 2152
	mov	eax, -30				; ffffffe2H
	jmp	$L2717
$L2732:
; Line 2156
	mov	edx, DWORD PTR ?SendInPtr@EtherObj@@2JA	; EtherObj::SendInPtr
	shl	edx, 4
	mov	eax, DWORD PTR ?TDLPointer@EtherObj@@2JA ; EtherObj::TDLPointer
	lea	ecx, DWORD PTR [eax+edx-1114112]
	mov	DWORD PTR _x$[ebp], ecx
; Line 2159
	mov	edx, DWORD PTR _x$[ebp]
	add	edx, 1114112				; 00110000H
	mov	eax, DWORD PTR ?TDLPointer@EtherObj@@2JA ; EtherObj::TDLPointer
	add	eax, 65520				; 0000fff0H
	cmp	edx, eax
	jle	SHORT $L2733
; Line 2161
	mov	eax, -22				; ffffffeaH
	jmp	$L2717
$L2733:
; Line 2164
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR _p1$[ebp], ecx
; Line 2167
	mov	edx, DWORD PTR ?TDLDataPointer@EtherObj@@2JA ; EtherObj::TDLDataPointer
	add	edx, 6553600				; 00640000H
	mov	eax, DWORD PTR _p1$[ebp]
	cmp	DWORD PTR [eax], edx
	jl	SHORT $L2735
; Line 2169
	mov	eax, -23				; ffffffe9H
	jmp	$L2717
$L2735:
; Line 2172
	mov	ecx, DWORD PTR _p1$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR _send_buffer$[ebp], edx
; Line 2174
	mov	eax, DWORD PTR ?SendInPtr@EtherObj@@2JA	; EtherObj::SendInPtr
	mov	DWORD PTR _InPtr$[ebp], eax
; Line 2176
	mov	ecx, DWORD PTR ?SendInPtr@EtherObj@@2JA	; EtherObj::SendInPtr
	add	ecx, 1
	mov	DWORD PTR ?SendInPtr@EtherObj@@2JA, ecx	; EtherObj::SendInPtr
; Line 2178
	cmp	DWORD PTR ?SendInPtr@EtherObj@@2JA, 4096 ; EtherObj::SendInPtr, 00001000H
	jne	SHORT $L2737
; Line 2180
	mov	DWORD PTR ?SendInPtr@EtherObj@@2JA, 0	; EtherObj::SendInPtr
$L2737:
; Line 2184
	mov	edx, DWORD PTR _send_buffer$[ebp]
	sub	edx, 1114078				; 0010ffdeH
	mov	DWORD PTR _send_buffer$[ebp], edx
; Line 2186
	mov	eax, DWORD PTR _send_buffer$[ebp]
	mov	ecx, DWORD PTR _packet$[ebp]
	mov	dl, BYTE PTR [ecx+2]
	mov	BYTE PTR [eax], dl
; Line 2187
	mov	eax, DWORD PTR _send_buffer$[ebp]
	mov	ecx, DWORD PTR _packet$[ebp]
	mov	dl, BYTE PTR [ecx+3]
	mov	BYTE PTR [eax+1], dl
; Line 2188
	mov	eax, DWORD PTR _send_buffer$[ebp]
	mov	ecx, DWORD PTR _packet$[ebp]
	mov	dl, BYTE PTR [ecx]
	mov	BYTE PTR [eax+2], dl
; Line 2189
	mov	eax, DWORD PTR _send_buffer$[ebp]
	mov	ecx, DWORD PTR _packet$[ebp]
	mov	dl, BYTE PTR [ecx+1]
	mov	BYTE PTR [eax+3], dl
; Line 2190
	push	3220					; 00000c94H
	mov	eax, DWORD PTR _packet$[ebp]
	movsx	ecx, BYTE PTR [eax]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 2191
	push	3240					; 00000ca8H
	mov	edx, DWORD PTR _packet$[ebp]
	movsx	eax, BYTE PTR [edx+1]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 2192
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L2740
$L2741:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L2740:
	cmp	DWORD PTR _i$[ebp], 4
	jge	SHORT $L2742
; Line 2193
	mov	edx, DWORD PTR _send_buffer$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _packet$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	mov	cl, BYTE PTR [eax+8]
	mov	BYTE PTR [edx+4], cl
	jmp	SHORT $L2741
$L2742:
; Line 2194
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L2743
$L2744:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L2743:
	cmp	DWORD PTR _i$[ebp], 4
	jge	SHORT $L2745
; Line 2195
	mov	eax, DWORD PTR _send_buffer$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _packet$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	dl, BYTE PTR [ecx+4]
	mov	BYTE PTR [eax+8], dl
	jmp	SHORT $L2744
$L2745:
; Line 2196
	mov	DWORD PTR _j$[ebp], 0
; Line 2197
	mov	DWORD PTR _k$[ebp], 0
; Line 2198
	mov	eax, DWORD PTR _send_buffer$[ebp]
	movsx	ecx, BYTE PTR [eax+8]
	mov	DWORD PTR _j$[ebp], ecx
; Line 2199
	mov	edx, DWORD PTR _j$[ebp]
	shl	edx, 24					; 00000018H
	mov	DWORD PTR _j$[ebp], edx
; Line 2200
	mov	eax, DWORD PTR _j$[ebp]
	and	eax, -16777216				; ff000000H
	mov	DWORD PTR _j$[ebp], eax
; Line 2202
	mov	ecx, DWORD PTR _send_buffer$[ebp]
	movsx	edx, BYTE PTR [ecx+9]
	mov	DWORD PTR _k$[ebp], edx
; Line 2203
	mov	eax, DWORD PTR _k$[ebp]
	shl	eax, 16					; 00000010H
	mov	DWORD PTR _k$[ebp], eax
; Line 2204
	mov	ecx, DWORD PTR _k$[ebp]
	and	ecx, 16711680				; 00ff0000H
	mov	DWORD PTR _k$[ebp], ecx
; Line 2205
	mov	edx, DWORD PTR _j$[ebp]
	add	edx, DWORD PTR _k$[ebp]
	mov	DWORD PTR _j$[ebp], edx
; Line 2207
	mov	eax, DWORD PTR _send_buffer$[ebp]
	movsx	ecx, BYTE PTR [eax+10]
	mov	DWORD PTR _k$[ebp], ecx
; Line 2208
	mov	edx, DWORD PTR _k$[ebp]
	shl	edx, 8
	mov	DWORD PTR _k$[ebp], edx
; Line 2209
	mov	eax, DWORD PTR _k$[ebp]
	and	eax, 65280				; 0000ff00H
	mov	DWORD PTR _k$[ebp], eax
; Line 2210
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, DWORD PTR _k$[ebp]
	mov	DWORD PTR _j$[ebp], ecx
; Line 2212
	mov	edx, DWORD PTR _send_buffer$[ebp]
	movsx	eax, BYTE PTR [edx+11]
	mov	DWORD PTR _k$[ebp], eax
; Line 2213
	mov	ecx, DWORD PTR _k$[ebp]
	and	ecx, 255				; 000000ffH
	mov	DWORD PTR _k$[ebp], ecx
; Line 2214
	mov	edx, DWORD PTR _j$[ebp]
	add	edx, DWORD PTR _k$[ebp]
	mov	DWORD PTR _j$[ebp], edx
; Line 2216
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	DWORD PTR _j$[ebp], eax
; Line 2221
	mov	ecx, DWORD PTR _j$[ebp]
	shr	ecx, 24					; 00000018H
	and	ecx, 255				; 000000ffH
	mov	edx, DWORD PTR _send_buffer$[ebp]
	mov	BYTE PTR [edx+8], cl
; Line 2222
	mov	eax, DWORD PTR _j$[ebp]
	shr	eax, 16					; 00000010H
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _send_buffer$[ebp]
	mov	BYTE PTR [ecx+9], al
; Line 2223
	mov	edx, DWORD PTR _j$[ebp]
	shr	edx, 8
	and	edx, 255				; 000000ffH
	mov	eax, DWORD PTR _send_buffer$[ebp]
	mov	BYTE PTR [eax+10], dl
; Line 2224
	mov	ecx, DWORD PTR _j$[ebp]
	and	ecx, 255				; 000000ffH
	mov	edx, DWORD PTR _send_buffer$[ebp]
	mov	BYTE PTR [edx+11], cl
; Line 2226
	mov	eax, DWORD PTR _send_buffer$[ebp]
	mov	ecx, DWORD PTR _packet$[ebp]
	mov	dl, BYTE PTR [ecx+12]
	mov	BYTE PTR [eax+12], dl
; Line 2227
	mov	eax, DWORD PTR _send_buffer$[ebp]
	mov	BYTE PTR [eax+13], 16			; 00000010H
; Line 2228
	mov	ecx, DWORD PTR _send_buffer$[ebp]
	mov	BYTE PTR [ecx+14], 6
; Line 2229
	mov	edx, DWORD PTR _send_buffer$[ebp]
	mov	BYTE PTR [edx+15], 64			; 00000040H
; Line 2230
	mov	eax, DWORD PTR _send_buffer$[ebp]
	mov	BYTE PTR [eax+18], 0
; Line 2231
	mov	ecx, DWORD PTR _send_buffer$[ebp]
	mov	BYTE PTR [ecx+19], 0
; Line 2233
	push	6
	mov	edx, DWORD PTR _destIP$[ebp]
	push	edx
	push	OFFSET FLAT:?HostIP@TCPObj@@0PADA	; TCPObj::HostIP
	push	20					; 00000014H
	mov	eax, DWORD PTR _send_buffer$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?TCPChecksum@TCPObj@@AAEGPADJ00I@Z	; TCPObj::TCPChecksum
	and	eax, 65535				; 0000ffffH
	mov	DWORD PTR _checksum$[ebp], eax
; Line 2234
	mov	ecx, DWORD PTR _checksum$[ebp]
	sar	ecx, 8
	and	ecx, 255				; 000000ffH
	mov	edx, DWORD PTR _send_buffer$[ebp]
	mov	BYTE PTR [edx+16], cl
; Line 2235
	mov	eax, DWORD PTR _checksum$[ebp]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _send_buffer$[ebp]
	mov	BYTE PTR [ecx+17], al
; Line 2239
	mov	edx, DWORD PTR _send_buffer$[ebp]
	sub	edx, 20					; 00000014H
	mov	DWORD PTR _send_buffer$[ebp], edx
; Line 2244
	mov	eax, DWORD PTR _currenttask$[ebp]
	push	eax
	push	6
	mov	ecx, DWORD PTR _TargetMAC$[ebp]
	push	ecx
	mov	edx, DWORD PTR _destIP$[ebp]
	push	edx
	mov	eax, DWORD PTR _TCPPack_size$[ebp]
	push	eax
	mov	ecx, DWORD PTR _send_buffer$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 288				; 00000120H
	call	?FormatIPPacket@IPObj@@QAEHPADHQAD1HH@Z	; IPObj::FormatIPPacket
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2245
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L2748
; Line 2246
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	SHORT $L2717
$L2748:
; Line 2248
	mov	edx, DWORD PTR _send_buffer$[ebp]
	sub	edx, 14					; 0000000eH
	mov	DWORD PTR _send_buffer$[ebp], edx
; Line 2250
	mov	eax, DWORD PTR ?SendCountTotal@TCPObj@@2HA ; TCPObj::SendCountTotal
	add	eax, 1
	mov	DWORD PTR ?SendCountTotal@TCPObj@@2HA, eax ; TCPObj::SendCountTotal
; Line 2253
	mov	ecx, DWORD PTR _currenttask$[ebp]
	push	ecx
	push	0
	mov	edx, DWORD PTR _InPtr$[ebp]
	push	edx
	mov	eax, DWORD PTR _TargetMAC$[ebp]
	push	eax
	push	2048					; 00000800H
	mov	ecx, DWORD PTR _TCPPack_size$[ebp]
	add	ecx, 20					; 00000014H
	push	ecx
	mov	edx, DWORD PTR _send_buffer$[ebp]
	push	edx
	lea	ecx, DWORD PTR _EO$[ebp]
	call	?FormatEthPacket@EtherObj@@QAEHPADHH0JHH@Z ; EtherObj::FormatEthPacket
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2254
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L2749
; Line 2261
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	SHORT $L2717
$L2749:
; Line 2265
	xor	eax, eax
$L2717:
; Line 2266
	mov	esp, ebp
	pop	ebp
	ret	16					; 00000010H
?SendMisc@TCPObj@@AAEHPAD00H@Z ENDP			; TCPObj::SendMisc
_destIP$ = 8
_destPort$ = 12
_Flags$ = 16
_TargetMAC$ = 20
_sendtype$ = 24
_currenttask$ = 28
_this$ = -68
_EO$ = -40
_send_buffer$ = -56
_p1$ = -48
_c3$ = -28
_c4$ = -32
_x$ = -44
_retcode$ = -8
_data$ = -20
_TCPPack_size$ = -64
_InPtr$ = -4
_TCBRecordNum$ = -24
_tcb$ = -60
?SendMisc@TCPObj@@AAEHPAD0D0HH@Z PROC NEAR		; TCPObj::SendMisc
; Line 2272
	push	ebp
	mov	ebp, esp
	sub	esp, 68					; 00000044H
	mov	DWORD PTR _this$[ebp], ecx
; Line 2274
	lea	ecx, DWORD PTR _EO$[ebp]
	call	??0EtherObj@@QAE@XZ			; EtherObj::EtherObj
; Line 2279
	mov	DWORD PTR _x$[ebp], 0
; Line 2281
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2283
	mov	DWORD PTR _TCPPack_size$[ebp], 0
; Line 2284
	mov	DWORD PTR _InPtr$[ebp], 0
; Line 2286
	mov	eax, DWORD PTR _destPort$[ebp]
	push	eax
	mov	ecx, DWORD PTR _destIP$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?SearchTCB@TCPObj@@AAEHQAD0@Z		; TCPObj::SearchTCB
	mov	DWORD PTR _TCBRecordNum$[ebp], eax
; Line 2289
	lea	edx, DWORD PTR _c3$[ebp]
	mov	DWORD PTR _p1$[ebp], edx
; Line 2290
	lea	eax, DWORD PTR _c4$[ebp]
	mov	DWORD PTR _send_buffer$[ebp], eax
; Line 2292
	lea	ecx, DWORD PTR _EO$[ebp]
	call	?TDLFull@EtherObj@@QAEHXZ		; EtherObj::TDLFull
	cmp	eax, 1
	jne	SHORT $L2772
; Line 2294
	mov	eax, -30				; ffffffe2H
	jmp	$L2758
$L2772:
; Line 2298
	mov	ecx, DWORD PTR ?SendInPtr@EtherObj@@2JA	; EtherObj::SendInPtr
	shl	ecx, 4
	mov	edx, DWORD PTR ?TDLPointer@EtherObj@@2JA ; EtherObj::TDLPointer
	lea	eax, DWORD PTR [edx+ecx-1114112]
	mov	DWORD PTR _x$[ebp], eax
; Line 2301
	mov	ecx, DWORD PTR _x$[ebp]
	add	ecx, 1114112				; 00110000H
	mov	edx, DWORD PTR ?TDLPointer@EtherObj@@2JA ; EtherObj::TDLPointer
	add	edx, 65520				; 0000fff0H
	cmp	ecx, edx
	jle	SHORT $L2773
; Line 2303
	mov	eax, -22				; ffffffeaH
	jmp	$L2758
$L2773:
; Line 2306
	mov	eax, DWORD PTR _x$[ebp]
	mov	DWORD PTR _p1$[ebp], eax
; Line 2309
	mov	ecx, DWORD PTR ?TDLDataPointer@EtherObj@@2JA ; EtherObj::TDLDataPointer
	add	ecx, 6553600				; 00640000H
	mov	edx, DWORD PTR _p1$[ebp]
	cmp	DWORD PTR [edx], ecx
	jl	SHORT $L2775
; Line 2311
	mov	eax, -23				; ffffffe9H
	jmp	$L2758
$L2775:
; Line 2314
	mov	eax, DWORD PTR _p1$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _send_buffer$[ebp], ecx
; Line 2316
	mov	edx, DWORD PTR ?SendInPtr@EtherObj@@2JA	; EtherObj::SendInPtr
	mov	DWORD PTR _InPtr$[ebp], edx
; Line 2318
	mov	eax, DWORD PTR ?SendInPtr@EtherObj@@2JA	; EtherObj::SendInPtr
	add	eax, 1
	mov	DWORD PTR ?SendInPtr@EtherObj@@2JA, eax	; EtherObj::SendInPtr
; Line 2320
	cmp	DWORD PTR ?SendInPtr@EtherObj@@2JA, 4096 ; EtherObj::SendInPtr, 00001000H
	jne	SHORT $L2777
; Line 2322
	mov	DWORD PTR ?SendInPtr@EtherObj@@2JA, 0	; EtherObj::SendInPtr
$L2777:
; Line 2326
	mov	ecx, DWORD PTR _send_buffer$[ebp]
	sub	ecx, 1114078				; 0010ffdeH
	mov	DWORD PTR _send_buffer$[ebp], ecx
; Line 2327
	cmp	DWORD PTR _TCBRecordNum$[ebp], -1
	jne	SHORT $L2778
; Line 2328
	mov	edx, DWORD PTR _currenttask$[ebp]
	push	edx
	push	0
	push	0
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	push	0
	push	0
	push	0
	mov	cl, BYTE PTR _Flags$[ebp]
	push	ecx
	mov	edx, DWORD PTR _destPort$[ebp]
	push	edx
	mov	eax, DWORD PTR _destIP$[ebp]
	push	eax
	mov	ecx, DWORD PTR _send_buffer$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?FormatTCPPacket@TCPObj@@AAEHPAD00DGKK0HHH@Z ; TCPObj::FormatTCPPacket
	mov	DWORD PTR _TCPPack_size$[ebp], eax
; Line 2329
	jmp	SHORT $L2779
$L2778:
; Line 2332
	mov	edx, DWORD PTR _TCBRecordNum$[ebp]
	imul	edx, 288				; 00000120H
	mov	eax, DWORD PTR ?TCBBase@TCPObj@@0KA	; TCPObj::TCBBase
	add	eax, edx
	mov	DWORD PTR _tcb$[ebp], eax
; Line 2334
	mov	ecx, DWORD PTR _currenttask$[ebp]
	push	ecx
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+112]
	push	eax
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+100]
	push	edx
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	cx, WORD PTR [eax+140]
	push	ecx
	mov	dl, BYTE PTR _Flags$[ebp]
	push	edx
	mov	eax, DWORD PTR _tcb$[ebp]
	add	eax, 18					; 00000012H
	push	eax
	mov	ecx, DWORD PTR _tcb$[ebp]
	add	ecx, 20					; 00000014H
	push	ecx
	mov	edx, DWORD PTR _send_buffer$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?FormatTCPPacket@TCPObj@@AAEHPAD00DGKK0HHH@Z ; TCPObj::FormatTCPPacket
	mov	DWORD PTR _TCPPack_size$[ebp], eax
$L2779:
; Line 2340
	mov	eax, DWORD PTR _send_buffer$[ebp]
	sub	eax, 20					; 00000014H
	mov	DWORD PTR _send_buffer$[ebp], eax
; Line 2345
	mov	ecx, DWORD PTR _currenttask$[ebp]
	push	ecx
	push	6
	mov	edx, DWORD PTR _TargetMAC$[ebp]
	push	edx
	mov	eax, DWORD PTR _destIP$[ebp]
	push	eax
	mov	ecx, DWORD PTR _TCPPack_size$[ebp]
	push	ecx
	mov	edx, DWORD PTR _send_buffer$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 288				; 00000120H
	call	?FormatIPPacket@IPObj@@QAEHPADHQAD1HH@Z	; IPObj::FormatIPPacket
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2346
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L2782
; Line 2347
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	SHORT $L2758
$L2782:
; Line 2349
	mov	eax, DWORD PTR _send_buffer$[ebp]
	sub	eax, 14					; 0000000eH
	mov	DWORD PTR _send_buffer$[ebp], eax
; Line 2351
	mov	ecx, DWORD PTR ?SendCountTotal@TCPObj@@2HA ; TCPObj::SendCountTotal
	add	ecx, 1
	mov	DWORD PTR ?SendCountTotal@TCPObj@@2HA, ecx ; TCPObj::SendCountTotal
; Line 2387
	mov	edx, DWORD PTR _currenttask$[ebp]
	push	edx
	mov	eax, DWORD PTR _sendtype$[ebp]
	push	eax
	mov	ecx, DWORD PTR _InPtr$[ebp]
	push	ecx
	mov	edx, DWORD PTR _TargetMAC$[ebp]
	push	edx
	push	2048					; 00000800H
	mov	eax, DWORD PTR _TCPPack_size$[ebp]
	add	eax, 20					; 00000014H
	push	eax
	mov	ecx, DWORD PTR _send_buffer$[ebp]
	push	ecx
	lea	ecx, DWORD PTR _EO$[ebp]
	call	?FormatEthPacket@EtherObj@@QAEHPADHH0JHH@Z ; EtherObj::FormatEthPacket
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2388
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L2783
; Line 2397
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	SHORT $L2758
$L2783:
; Line 2401
	xor	eax, eax
$L2758:
; Line 2402
	mov	esp, ebp
	pop	ebp
	ret	24					; 00000018H
?SendMisc@TCPObj@@AAEHPAD0D0HH@Z ENDP			; TCPObj::SendMisc
_destIP$ = 8
_destPort$ = 12
_Flags$ = 16
_TargetMAC$ = 20
_sendtype$ = 24
_acknumber$ = 28
_currenttask$ = 32
_this$ = -68
_EO$ = -40
_send_buffer$ = -56
_p1$ = -48
_c3$ = -28
_c4$ = -32
_x$ = -44
_retcode$ = -8
_data$ = -20
_TCPPack_size$ = -64
_InPtr$ = -4
_TCBRecordNum$ = -24
_tcb$ = -60
?SendMiscKA@TCPObj@@AAEHPAD0D0HKH@Z PROC NEAR		; TCPObj::SendMiscKA
; Line 2409
	push	ebp
	mov	ebp, esp
	sub	esp, 68					; 00000044H
	mov	DWORD PTR _this$[ebp], ecx
; Line 2411
	lea	ecx, DWORD PTR _EO$[ebp]
	call	??0EtherObj@@QAE@XZ			; EtherObj::EtherObj
; Line 2416
	mov	DWORD PTR _x$[ebp], 0
; Line 2418
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2420
	mov	DWORD PTR _TCPPack_size$[ebp], 0
; Line 2421
	mov	DWORD PTR _InPtr$[ebp], 0
; Line 2423
	mov	eax, DWORD PTR _destPort$[ebp]
	push	eax
	mov	ecx, DWORD PTR _destIP$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?SearchTCB@TCPObj@@AAEHQAD0@Z		; TCPObj::SearchTCB
	mov	DWORD PTR _TCBRecordNum$[ebp], eax
; Line 2426
	lea	edx, DWORD PTR _c3$[ebp]
	mov	DWORD PTR _p1$[ebp], edx
; Line 2427
	lea	eax, DWORD PTR _c4$[ebp]
	mov	DWORD PTR _send_buffer$[ebp], eax
; Line 2429
	lea	ecx, DWORD PTR _EO$[ebp]
	call	?TDLFull@EtherObj@@QAEHXZ		; EtherObj::TDLFull
	cmp	eax, 1
	jne	SHORT $L2807
; Line 2431
	mov	eax, -30				; ffffffe2H
	jmp	$L2793
$L2807:
; Line 2435
	mov	ecx, DWORD PTR ?SendInPtr@EtherObj@@2JA	; EtherObj::SendInPtr
	shl	ecx, 4
	mov	edx, DWORD PTR ?TDLPointer@EtherObj@@2JA ; EtherObj::TDLPointer
	lea	eax, DWORD PTR [edx+ecx-1114112]
	mov	DWORD PTR _x$[ebp], eax
; Line 2438
	mov	ecx, DWORD PTR _x$[ebp]
	add	ecx, 1114112				; 00110000H
	mov	edx, DWORD PTR ?TDLPointer@EtherObj@@2JA ; EtherObj::TDLPointer
	add	edx, 65520				; 0000fff0H
	cmp	ecx, edx
	jle	SHORT $L2808
; Line 2440
	mov	eax, -22				; ffffffeaH
	jmp	$L2793
$L2808:
; Line 2443
	mov	eax, DWORD PTR _x$[ebp]
	mov	DWORD PTR _p1$[ebp], eax
; Line 2446
	mov	ecx, DWORD PTR ?TDLDataPointer@EtherObj@@2JA ; EtherObj::TDLDataPointer
	add	ecx, 6553600				; 00640000H
	mov	edx, DWORD PTR _p1$[ebp]
	cmp	DWORD PTR [edx], ecx
	jl	SHORT $L2810
; Line 2448
	mov	eax, -23				; ffffffe9H
	jmp	$L2793
$L2810:
; Line 2451
	mov	eax, DWORD PTR _p1$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _send_buffer$[ebp], ecx
; Line 2453
	mov	edx, DWORD PTR ?SendInPtr@EtherObj@@2JA	; EtherObj::SendInPtr
	mov	DWORD PTR _InPtr$[ebp], edx
; Line 2455
	mov	eax, DWORD PTR ?SendInPtr@EtherObj@@2JA	; EtherObj::SendInPtr
	add	eax, 1
	mov	DWORD PTR ?SendInPtr@EtherObj@@2JA, eax	; EtherObj::SendInPtr
; Line 2457
	cmp	DWORD PTR ?SendInPtr@EtherObj@@2JA, 4096 ; EtherObj::SendInPtr, 00001000H
	jne	SHORT $L2812
; Line 2459
	mov	DWORD PTR ?SendInPtr@EtherObj@@2JA, 0	; EtherObj::SendInPtr
$L2812:
; Line 2463
	mov	ecx, DWORD PTR _send_buffer$[ebp]
	sub	ecx, 1114078				; 0010ffdeH
	mov	DWORD PTR _send_buffer$[ebp], ecx
; Line 2464
	cmp	DWORD PTR _TCBRecordNum$[ebp], -1
	jne	SHORT $L2813
; Line 2465
	mov	edx, DWORD PTR _currenttask$[ebp]
	push	edx
	push	0
	push	0
	lea	eax, DWORD PTR _data$[ebp]
	push	eax
	push	0
	push	0
	push	0
	mov	cl, BYTE PTR _Flags$[ebp]
	push	ecx
	mov	edx, DWORD PTR _destPort$[ebp]
	push	edx
	mov	eax, DWORD PTR _destIP$[ebp]
	push	eax
	mov	ecx, DWORD PTR _send_buffer$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?FormatTCPPacket@TCPObj@@AAEHPAD00DGKK0HHH@Z ; TCPObj::FormatTCPPacket
	mov	DWORD PTR _TCPPack_size$[ebp], eax
; Line 2466
	jmp	SHORT $L2814
$L2813:
; Line 2469
	mov	edx, DWORD PTR _TCBRecordNum$[ebp]
	imul	edx, 288				; 00000120H
	mov	eax, DWORD PTR ?TCBBase@TCPObj@@0KA	; TCPObj::TCBBase
	add	eax, edx
	mov	DWORD PTR _tcb$[ebp], eax
; Line 2475
	mov	ecx, DWORD PTR _currenttask$[ebp]
	push	ecx
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+112]
	push	eax
	mov	ecx, DWORD PTR _acknumber$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	ax, WORD PTR [edx+140]
	push	eax
	mov	cl, BYTE PTR _Flags$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tcb$[ebp]
	add	edx, 18					; 00000012H
	push	edx
	mov	eax, DWORD PTR _tcb$[ebp]
	add	eax, 20					; 00000014H
	push	eax
	mov	ecx, DWORD PTR _send_buffer$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?FormatTCPPacket@TCPObj@@AAEHPAD00DGKK0HHH@Z ; TCPObj::FormatTCPPacket
	mov	DWORD PTR _TCPPack_size$[ebp], eax
$L2814:
; Line 2481
	mov	edx, DWORD PTR _send_buffer$[ebp]
	sub	edx, 20					; 00000014H
	mov	DWORD PTR _send_buffer$[ebp], edx
; Line 2486
	mov	eax, DWORD PTR _currenttask$[ebp]
	push	eax
	push	6
	mov	ecx, DWORD PTR _TargetMAC$[ebp]
	push	ecx
	mov	edx, DWORD PTR _destIP$[ebp]
	push	edx
	mov	eax, DWORD PTR _TCPPack_size$[ebp]
	push	eax
	mov	ecx, DWORD PTR _send_buffer$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 288				; 00000120H
	call	?FormatIPPacket@IPObj@@QAEHPADHQAD1HH@Z	; IPObj::FormatIPPacket
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2487
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L2817
; Line 2488
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	SHORT $L2793
$L2817:
; Line 2490
	mov	edx, DWORD PTR _send_buffer$[ebp]
	sub	edx, 14					; 0000000eH
	mov	DWORD PTR _send_buffer$[ebp], edx
; Line 2492
	mov	eax, DWORD PTR ?SendCountTotal@TCPObj@@2HA ; TCPObj::SendCountTotal
	add	eax, 1
	mov	DWORD PTR ?SendCountTotal@TCPObj@@2HA, eax ; TCPObj::SendCountTotal
; Line 2528
	mov	ecx, DWORD PTR _currenttask$[ebp]
	push	ecx
	mov	edx, DWORD PTR _sendtype$[ebp]
	push	edx
	mov	eax, DWORD PTR _InPtr$[ebp]
	push	eax
	mov	ecx, DWORD PTR _TargetMAC$[ebp]
	push	ecx
	push	2048					; 00000800H
	mov	edx, DWORD PTR _TCPPack_size$[ebp]
	add	edx, 20					; 00000014H
	push	edx
	mov	eax, DWORD PTR _send_buffer$[ebp]
	push	eax
	lea	ecx, DWORD PTR _EO$[ebp]
	call	?FormatEthPacket@EtherObj@@QAEHPADHH0JHH@Z ; EtherObj::FormatEthPacket
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2529
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L2818
; Line 2538
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	SHORT $L2793
$L2818:
; Line 2542
	xor	eax, eax
$L2793:
; Line 2543
	mov	esp, ebp
	pop	ebp
	ret	28					; 0000001cH
?SendMiscKA@TCPObj@@AAEHPAD0D0HKH@Z ENDP		; TCPObj::SendMiscKA
_TCPPack$ = 8
_destIP$ = 12
_destPort$ = 16
_Flags$ = 20
_Window$ = 24
_seqnum$ = 28
_acknum$ = 32
_data$ = 36
_datasize$ = 40
_rIndex$ = 44
_this$ = -40
_i$ = -32
_k$ = -36
_retcode$ = -16
_checksum$ = -12
_options$ = -8
_c$ = -24
_numbytesoptions$ = -28
_HeaderLength$ = -20
_StartofData$ = -4
?FormatTCPPacket@TCPObj@@AAEHPAD00DGKK0HHH@Z PROC NEAR	; TCPObj::FormatTCPPacket
; Line 2549
	push	ebp
	mov	ebp, esp
	sub	esp, 40					; 00000028H
	push	esi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2550
	mov	DWORD PTR _i$[ebp], 0
	mov	DWORD PTR _k$[ebp], 0
; Line 2551
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2552
	mov	DWORD PTR _checksum$[ebp], 0
; Line 2555
	lea	eax, DWORD PTR _c$[ebp]
	mov	DWORD PTR _options$[ebp], eax
; Line 2557
	mov	DWORD PTR _numbytesoptions$[ebp], 0
; Line 2558
	mov	eax, DWORD PTR _numbytesoptions$[ebp]
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	add	eax, 5
	mov	BYTE PTR _HeaderLength$[ebp], al
; Line 2559
	mov	DWORD PTR _StartofData$[ebp], 0
; Line 2562
	mov	ecx, DWORD PTR _TCPPack$[ebp]
	mov	BYTE PTR [ecx], 0
; Line 2563
	mov	edx, DWORD PTR _TCPPack$[ebp]
	mov	BYTE PTR [edx+1], 80			; 00000050H
; Line 2564
	mov	eax, DWORD PTR _TCPPack$[ebp]
	mov	ecx, DWORD PTR _destPort$[ebp]
	mov	dl, BYTE PTR [ecx]
	mov	BYTE PTR [eax+2], dl
; Line 2565
	mov	eax, DWORD PTR _TCPPack$[ebp]
	mov	ecx, DWORD PTR _destPort$[ebp]
	mov	dl, BYTE PTR [ecx+1]
	mov	BYTE PTR [eax+3], dl
; Line 2568
	mov	eax, DWORD PTR _seqnum$[ebp]
	shr	eax, 24					; 00000018H
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _TCPPack$[ebp]
	mov	BYTE PTR [ecx+4], al
; Line 2569
	mov	edx, DWORD PTR _seqnum$[ebp]
	shr	edx, 16					; 00000010H
	and	edx, 255				; 000000ffH
	mov	eax, DWORD PTR _TCPPack$[ebp]
	mov	BYTE PTR [eax+5], dl
; Line 2570
	mov	ecx, DWORD PTR _seqnum$[ebp]
	shr	ecx, 8
	and	ecx, 255				; 000000ffH
	mov	edx, DWORD PTR _TCPPack$[ebp]
	mov	BYTE PTR [edx+6], cl
; Line 2571
	mov	eax, DWORD PTR _seqnum$[ebp]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _TCPPack$[ebp]
	mov	BYTE PTR [ecx+7], al
; Line 2575
	mov	edx, DWORD PTR _acknum$[ebp]
	shr	edx, 24					; 00000018H
	and	edx, 255				; 000000ffH
	mov	eax, DWORD PTR _TCPPack$[ebp]
	mov	BYTE PTR [eax+8], dl
; Line 2576
	mov	ecx, DWORD PTR _acknum$[ebp]
	shr	ecx, 16					; 00000010H
	and	ecx, 255				; 000000ffH
	mov	edx, DWORD PTR _TCPPack$[ebp]
	mov	BYTE PTR [edx+9], cl
; Line 2577
	mov	eax, DWORD PTR _acknum$[ebp]
	shr	eax, 8
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _TCPPack$[ebp]
	mov	BYTE PTR [ecx+10], al
; Line 2578
	mov	edx, DWORD PTR _acknum$[ebp]
	and	edx, 255				; 000000ffH
	mov	eax, DWORD PTR _TCPPack$[ebp]
	mov	BYTE PTR [eax+11], dl
; Line 2582
	mov	ecx, DWORD PTR _numbytesoptions$[ebp]
	and	ecx, -2147483645			; 80000003H
	jns	SHORT $L3328
	dec	ecx
	or	ecx, -4					; fffffffcH
	inc	ecx
$L3328:
	test	ecx, ecx
	jle	SHORT $L2843
; Line 2583
	movsx	edx, BYTE PTR _HeaderLength$[ebp]
	add	edx, 1
	mov	BYTE PTR _HeaderLength$[ebp], dl
$L2843:
; Line 2584
	movsx	eax, BYTE PTR _HeaderLength$[ebp]
	shl	eax, 4
	and	eax, 240				; 000000f0H
	mov	ecx, DWORD PTR _TCPPack$[ebp]
	mov	BYTE PTR [ecx+12], al
; Line 2587
	movsx	edx, BYTE PTR _Flags$[ebp]
	and	edx, 63					; 0000003fH
	mov	eax, DWORD PTR _TCPPack$[ebp]
	mov	BYTE PTR [eax+13], dl
; Line 2588
	mov	ecx, DWORD PTR _Window$[ebp]
	and	ecx, 65535				; 0000ffffH
	sar	ecx, 8
	and	ecx, 255				; 000000ffH
	mov	edx, DWORD PTR _TCPPack$[ebp]
	mov	BYTE PTR [edx+14], cl
; Line 2589
	mov	eax, DWORD PTR _Window$[ebp]
	and	eax, 65535				; 0000ffffH
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _TCPPack$[ebp]
	mov	BYTE PTR [ecx+15], al
; Line 2592
	mov	edx, DWORD PTR _TCPPack$[ebp]
	mov	BYTE PTR [edx+18], 0
; Line 2593
	mov	eax, DWORD PTR _TCPPack$[ebp]
	mov	BYTE PTR [eax+19], 0
; Line 2596
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L2844
$L2845:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L2844:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _numbytesoptions$[ebp]
	jge	SHORT $L2846
; Line 2598
	mov	eax, DWORD PTR _TCPPack$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _options$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	dl, BYTE PTR [ecx]
	mov	BYTE PTR [eax+20], dl
; Line 2599
	jmp	SHORT $L2845
$L2846:
; Line 2601
	mov	DWORD PTR _k$[ebp], 0
	jmp	SHORT $L2847
$L2848:
	mov	eax, DWORD PTR _k$[ebp]
	add	eax, 1
	mov	DWORD PTR _k$[ebp], eax
$L2847:
	mov	ecx, DWORD PTR _numbytesoptions$[ebp]
	and	ecx, -2147483645			; 80000003H
	jns	SHORT $L3329
	dec	ecx
	or	ecx, -4					; fffffffcH
	inc	ecx
$L3329:
	mov	edx, 4
	sub	edx, ecx
	cmp	DWORD PTR _k$[ebp], edx
	jge	SHORT $L2849
; Line 2603
	mov	eax, DWORD PTR _TCPPack$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	mov	BYTE PTR [eax+20], 0
; Line 2604
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
; Line 2605
	jmp	SHORT $L2848
$L2849:
; Line 2607
	movsx	edx, BYTE PTR _HeaderLength$[ebp]
	shl	edx, 2
	mov	DWORD PTR _StartofData$[ebp], edx
; Line 2610
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L2850
$L2851:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L2850:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _datasize$[ebp]
	jge	SHORT $L2852
; Line 2612
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, DWORD PTR _rIndex$[ebp]
	mov	eax, DWORD PTR _StartofData$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _TCPPack$[ebp]
	mov	esi, DWORD PTR _data$[ebp]
	mov	dl, BYTE PTR [esi+edx]
	mov	BYTE PTR [ecx+eax], dl
; Line 2613
	jmp	SHORT $L2851
$L2852:
; Line 2615
	push	6
	mov	eax, DWORD PTR _destIP$[ebp]
	push	eax
	push	OFFSET FLAT:?HostIP@TCPObj@@0PADA	; TCPObj::HostIP
	mov	ecx, DWORD PTR _StartofData$[ebp]
	add	ecx, DWORD PTR _datasize$[ebp]
	push	ecx
	mov	edx, DWORD PTR _TCPPack$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?TCPChecksum@TCPObj@@AAEGPADJ00I@Z	; TCPObj::TCPChecksum
	and	eax, 65535				; 0000ffffH
	mov	DWORD PTR _checksum$[ebp], eax
; Line 2617
	mov	eax, DWORD PTR _checksum$[ebp]
	sar	eax, 8
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _TCPPack$[ebp]
	mov	BYTE PTR [ecx+16], al
; Line 2618
	mov	edx, DWORD PTR _checksum$[ebp]
	and	edx, 255				; 000000ffH
	mov	eax, DWORD PTR _TCPPack$[ebp]
	mov	BYTE PTR [eax+17], dl
; Line 2620
	mov	eax, DWORD PTR _StartofData$[ebp]
	add	eax, DWORD PTR _datasize$[ebp]
; Line 2621
	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	44					; 0000002cH
?FormatTCPPacket@TCPObj@@AAEHPAD00DGKK0HHH@Z ENDP	; TCPObj::FormatTCPPacket
_TEXT	ENDS
PUBLIC	?SendN@TCPObj@@AAEHHH@Z				; TCPObj::SendN
EXTRN	?FormatEthPacketN@EtherObj@@QAEHPADHH0JHHH@Z:NEAR ; EtherObj::FormatEthPacketN
_BSS	SEGMENT
$SG2874	DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2894	DB	'TDL is FULL SendN', 00H
_DATA	ENDS
_TEXT	SEGMENT
_TCBRecordNum$ = 8
_currenttask$ = 12
_this$ = -532
_task$ = -516
_tsk$ = -448
_EO$ = -36
_c3$ = -20
_c4$ = -28
_send_buffer$ = -468
_p1$ = -456
_x$ = -452
_i$ = -460
_j$ = -464
_retcode$ = -12
_SrcPortNum$ = -528
_TCPPack_size$ = -524
_options$ = -8
_InPtr$ = -4
_sendbuffer$ = -24
_c1$ = -16
_tcb$ = -520
?SendN@TCPObj@@AAEHHH@Z PROC NEAR			; TCPObj::SendN
; Line 2626
	push	ebp
	mov	ebp, esp
	sub	esp, 532				; 00000214H
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2627
	lea	ecx, DWORD PTR _task$[ebp]
	call	??0AOATask@@QAE@XZ			; AOATask::AOATask
; Line 2628
	lea	ecx, DWORD PTR _tsk$[ebp]
	call	??0apptask@@QAE@XZ			; apptask::apptask
; Line 2629
	lea	ecx, DWORD PTR _EO$[ebp]
	call	??0EtherObj@@QAE@XZ			; EtherObj::EtherObj
; Line 2635
	lea	eax, DWORD PTR _c3$[ebp]
	mov	DWORD PTR _p1$[ebp], eax
; Line 2636
	lea	ecx, DWORD PTR _c4$[ebp]
	mov	DWORD PTR _send_buffer$[ebp], ecx
; Line 2638
	mov	DWORD PTR _x$[ebp], 0
; Line 2639
	mov	DWORD PTR _i$[ebp], 0
	mov	DWORD PTR _j$[ebp], 0
; Line 2640
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2643
	mov	DWORD PTR _TCPPack_size$[ebp], 0
; Line 2644
	mov	dl, BYTE PTR $SG2874
	mov	BYTE PTR _options$[ebp], dl
; Line 2645
	mov	DWORD PTR _InPtr$[ebp], 0
; Line 2648
	lea	eax, DWORD PTR _c1$[ebp]
	mov	DWORD PTR _sendbuffer$[ebp], eax
; Line 2651
	mov	ecx, DWORD PTR _TCBRecordNum$[ebp]
	imul	ecx, 288				; 00000120H
	mov	edx, DWORD PTR ?TCBBase@TCPObj@@0KA	; TCPObj::TCBBase
	add	edx, ecx
	mov	DWORD PTR _tcb$[ebp], edx
; Line 2652
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+52], eax
; Line 2653
	mov	edx, 1
	test	edx, edx
	je	SHORT $L2881
; Line 2654
	push	1860					; 00000744H
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+24]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
$L2881:
; Line 2657
	mov	edx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [edx], 0
	jne	SHORT $L2882
; Line 2659
	mov	eax, -37				; ffffffdbH
	jmp	$L2859
$L2882:
; Line 2662
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR _TCBRecordNum$[ebp]
	cmp	ecx, DWORD PTR [eax+8]
	je	$L2883
; Line 2665
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	push	6
	mov	ecx, DWORD PTR _tcb$[ebp]
	add	ecx, 12					; 0000000cH
	push	ecx
	push	4
	mov	edx, DWORD PTR _tcb$[ebp]
	add	edx, 18					; 00000012H
	push	edx
	mov	eax, DWORD PTR _tcb$[ebp]
	add	eax, 20					; 00000014H
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?SendMisc@TCPObj@@AAEHPAD0D0HH@Z	; TCPObj::SendMisc
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2666
	mov	ecx, 1
	test	ecx, ecx
	je	SHORT $L2884
; Line 2667
	push	73					; 00000049H
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+124]
	push	eax
	push	-536870906				; e0000006H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
$L2884:
; Line 2668
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L2885
; Line 2669
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L2859
$L2885:
; Line 2672
	push	24					; 00000018H
	mov	ecx, DWORD PTR _TCBRecordNum$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DeleteTCB@TCPObj@@QAEHHH@Z		; TCPObj::DeleteTCB
; Line 2674
	mov	eax, -36				; ffffffdcH
	jmp	$L2859
$L2883:
; Line 2678
	mov	edx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [edx+200], 0
	jne	SHORT $L2886
; Line 2680
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+240]
	mov	DWORD PTR _sendbuffer$[ebp], ecx
; Line 2682
	jmp	SHORT $L2888
$L2886:
	mov	edx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [edx+200], 1
	jne	SHORT $L2888
; Line 2684
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+244]
	mov	DWORD PTR _sendbuffer$[ebp], ecx
$L2888:
; Line 2687
	mov	edx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [edx+216], 0
	jne	SHORT $L2889
; Line 2689
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+212]
	mov	DWORD PTR [eax+284], edx
; Line 2691
	jmp	SHORT $L2890
$L2889:
; Line 2693
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+212]
	add	ecx, 1
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+284], ecx
$L2890:
; Line 2696
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+204]
	mov	DWORD PTR [eax+228], edx
; Line 2697
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+208]
	mov	DWORD PTR [eax+232], edx
; Line 2698
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+236], 16			; 00000010H
; Line 2701
	mov	ecx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [ecx+24], 5
	je	SHORT $L2892
	mov	edx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [edx+24], 6
	jne	$L2891
$L2892:
; Line 2704
	mov	BYTE PTR _SrcPortNum$[ebp], 0
; Line 2705
	mov	BYTE PTR _SrcPortNum$[ebp+1], 80	; 00000050H
; Line 2706
	lea	ecx, DWORD PTR _EO$[ebp]
	call	?TDLFull@EtherObj@@QAEHXZ		; EtherObj::TDLFull
	cmp	eax, 1
	jne	SHORT $L2893
; Line 2708
	push	3540					; 00000dd4H
	push	OFFSET FLAT:$SG2894
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 2709
	mov	eax, -29				; ffffffe3H
	jmp	$L2859
$L2893:
; Line 2711
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L2895
$L2896:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L2895:
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx+212]
	jae	$L2897
; Line 2714
	mov	eax, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [eax+200], 1
	jne	SHORT $L2898
	mov	ecx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [ecx+88], 1
	je	SHORT $L2898
; Line 2725
	int	-11					; fffffff5H
$L2898:
; Line 2728
	mov	edx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [edx+220], 1
	jne	SHORT $L2899
	mov	eax, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [eax+216], 0
	jne	SHORT $L2899
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+212]
	sub	edx, 1
	cmp	DWORD PTR _i$[ebp], edx
	jne	SHORT $L2899
; Line 2729
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+236]
	or	ecx, 1
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+236], ecx
$L2899:
; Line 2731
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	imul	eax, 1300				; 00000514H
	cmp	eax, 5000				; 00001388H
	jle	SHORT $L2900
; Line 2732
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+236]
	or	edx, 8
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+236], edx
$L2900:
; Line 2734
	mov	ecx, DWORD PTR ?SendInPtr@EtherObj@@2JA	; EtherObj::SendInPtr
	shl	ecx, 4
	mov	edx, DWORD PTR ?TDLPointer@EtherObj@@2JA ; EtherObj::TDLPointer
	lea	eax, DWORD PTR [edx+ecx-1114112]
	mov	DWORD PTR _x$[ebp], eax
; Line 2737
	mov	ecx, DWORD PTR _x$[ebp]
	add	ecx, 1114112				; 00110000H
	mov	edx, DWORD PTR ?TDLPointer@EtherObj@@2JA ; EtherObj::TDLPointer
	add	edx, 65520				; 0000fff0H
	cmp	ecx, edx
	jle	SHORT $L2901
; Line 2739
	mov	eax, -12				; fffffff4H
	jmp	$L2859
$L2901:
; Line 2742
	mov	eax, DWORD PTR _x$[ebp]
	mov	DWORD PTR _p1$[ebp], eax
; Line 2745
	mov	ecx, DWORD PTR ?TDLDataPointer@EtherObj@@2JA ; EtherObj::TDLDataPointer
	add	ecx, 6553600				; 00640000H
	mov	edx, DWORD PTR _p1$[ebp]
	cmp	DWORD PTR [edx], ecx
	jl	SHORT $L2903
; Line 2747
	mov	eax, -13				; fffffff3H
	jmp	$L2859
$L2903:
; Line 2750
	mov	eax, DWORD PTR _p1$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _send_buffer$[ebp], ecx
; Line 2752
	mov	edx, DWORD PTR ?SendInPtr@EtherObj@@2JA	; EtherObj::SendInPtr
	mov	DWORD PTR _InPtr$[ebp], edx
; Line 2754
	mov	eax, DWORD PTR ?SendInPtr@EtherObj@@2JA	; EtherObj::SendInPtr
	add	eax, 1
	mov	DWORD PTR ?SendInPtr@EtherObj@@2JA, eax	; EtherObj::SendInPtr
; Line 2756
	cmp	DWORD PTR ?SendInPtr@EtherObj@@2JA, 4096 ; EtherObj::SendInPtr, 00001000H
	jne	SHORT $L2905
; Line 2758
	mov	DWORD PTR ?SendInPtr@EtherObj@@2JA, 0	; EtherObj::SendInPtr
$L2905:
; Line 2762
	mov	ecx, DWORD PTR _send_buffer$[ebp]
	sub	ecx, 1114078				; 0010ffdeH
	mov	DWORD PTR _send_buffer$[ebp], ecx
; Line 2765
	mov	edx, DWORD PTR _currenttask$[ebp]
	push	edx
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+228]
	push	ecx
	push	1300					; 00000514H
	mov	edx, DWORD PTR _sendbuffer$[ebp]
	push	edx
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+112]
	push	ecx
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	dx, WORD PTR [ecx+140]
	push	edx
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	cl, BYTE PTR [eax+236]
	push	ecx
	mov	edx, DWORD PTR _tcb$[ebp]
	add	edx, 18					; 00000012H
	push	edx
	mov	eax, DWORD PTR _tcb$[ebp]
	add	eax, 20					; 00000014H
	push	eax
	mov	ecx, DWORD PTR _send_buffer$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?FormatTCPPacket@TCPObj@@AAEHPAD00DGKK0HHH@Z ; TCPObj::FormatTCPPacket
	mov	DWORD PTR _TCPPack_size$[ebp], eax
; Line 2769
	mov	edx, DWORD PTR _send_buffer$[ebp]
	sub	edx, 20					; 00000014H
	mov	DWORD PTR _send_buffer$[ebp], edx
; Line 2774
	mov	eax, DWORD PTR _currenttask$[ebp]
	push	eax
	push	6
	mov	ecx, DWORD PTR _tcb$[ebp]
	add	ecx, 12					; 0000000cH
	push	ecx
	mov	edx, DWORD PTR _tcb$[ebp]
	add	edx, 20					; 00000014H
	push	edx
	mov	eax, DWORD PTR _TCPPack_size$[ebp]
	push	eax
	mov	ecx, DWORD PTR _send_buffer$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 288				; 00000120H
	call	?FormatIPPacket@IPObj@@QAEHPADHQAD1HH@Z	; IPObj::FormatIPPacket
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2775
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L2906
; Line 2776
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L2859
$L2906:
; Line 2778
	mov	edx, DWORD PTR _send_buffer$[ebp]
	sub	edx, 14					; 0000000eH
	mov	DWORD PTR _send_buffer$[ebp], edx
; Line 2781
	mov	eax, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [eax+216], 0
	jne	SHORT $L2907
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+212]
	sub	edx, 1
	cmp	DWORD PTR _i$[ebp], edx
	jne	SHORT $L2907
; Line 2784
	mov	eax, DWORD PTR _currenttask$[ebp]
	push	eax
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+224]
	push	edx
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+284]
	push	ecx
	mov	edx, DWORD PTR _InPtr$[ebp]
	push	edx
	mov	eax, DWORD PTR _tcb$[ebp]
	add	eax, 12					; 0000000cH
	push	eax
	push	2048					; 00000800H
	mov	ecx, DWORD PTR _TCPPack_size$[ebp]
	add	ecx, 20					; 00000014H
	push	ecx
	mov	edx, DWORD PTR _send_buffer$[ebp]
	push	edx
	lea	ecx, DWORD PTR _EO$[ebp]
	call	?FormatEthPacketN@EtherObj@@QAEHPADHH0JHHH@Z ; EtherObj::FormatEthPacketN
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2785
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L2908
; Line 2786
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L2859
$L2908:
; Line 2788
	jmp	SHORT $L2913
$L2907:
; Line 2791
	mov	eax, DWORD PTR ?SendCountTotal@TCPObj@@2HA ; TCPObj::SendCountTotal
	add	eax, 1
	mov	DWORD PTR ?SendCountTotal@TCPObj@@2HA, eax ; TCPObj::SendCountTotal
; Line 2816
	mov	eax, DWORD PTR _currenttask$[ebp]
	push	eax
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+224]
	push	edx
	push	0
	mov	eax, DWORD PTR _InPtr$[ebp]
	push	eax
	mov	ecx, DWORD PTR _tcb$[ebp]
	add	ecx, 12					; 0000000cH
	push	ecx
	push	2048					; 00000800H
	mov	edx, DWORD PTR _TCPPack_size$[ebp]
	add	edx, 20					; 00000014H
	push	edx
	mov	eax, DWORD PTR _send_buffer$[ebp]
	push	eax
	lea	ecx, DWORD PTR _EO$[ebp]
	call	?FormatEthPacketN@EtherObj@@QAEHPADHH0JHHH@Z ; EtherObj::FormatEthPacketN
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2817
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L2913
; Line 2824
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L2859
$L2913:
; Line 2828
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+228]
	add	edx, 1300				; 00000514H
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+228], edx
; Line 2829
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	add	edx, 1300				; 00000514H
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+232], edx
; Line 2832
	jmp	$L2896
$L2897:
; Line 2834
	mov	ecx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [ecx+216], 0
	je	$L2923
; Line 2836
	mov	edx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [edx+220], 1
	jne	SHORT $L2915
; Line 2837
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+236]
	or	ecx, 1
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+236], ecx
$L2915:
; Line 2839
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 1300				; 00000514H
	mov	ecx, DWORD PTR _tcb$[ebp]
	add	eax, DWORD PTR [ecx+216]
	cmp	eax, 5000				; 00001388H
	jbe	SHORT $L2916
; Line 2840
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+236]
	or	al, 8
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+236], eax
$L2916:
; Line 2842
	mov	edx, DWORD PTR ?SendInPtr@EtherObj@@2JA	; EtherObj::SendInPtr
	shl	edx, 4
	mov	eax, DWORD PTR ?TDLPointer@EtherObj@@2JA ; EtherObj::TDLPointer
	lea	ecx, DWORD PTR [eax+edx-1114112]
	mov	DWORD PTR _x$[ebp], ecx
; Line 2845
	mov	edx, DWORD PTR _x$[ebp]
	add	edx, 1114112				; 00110000H
	mov	eax, DWORD PTR ?TDLPointer@EtherObj@@2JA ; EtherObj::TDLPointer
	add	eax, 65520				; 0000fff0H
	cmp	edx, eax
	jle	SHORT $L2917
; Line 2847
	mov	eax, -12				; fffffff4H
	jmp	$L2859
$L2917:
; Line 2850
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR _p1$[ebp], ecx
; Line 2853
	mov	edx, DWORD PTR ?TDLDataPointer@EtherObj@@2JA ; EtherObj::TDLDataPointer
	add	edx, 6553600				; 00640000H
	mov	eax, DWORD PTR _p1$[ebp]
	cmp	DWORD PTR [eax], edx
	jl	SHORT $L2919
; Line 2855
	mov	eax, -13				; fffffff3H
	jmp	$L2859
$L2919:
; Line 2858
	mov	ecx, DWORD PTR _p1$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR _send_buffer$[ebp], edx
; Line 2860
	mov	eax, DWORD PTR ?SendInPtr@EtherObj@@2JA	; EtherObj::SendInPtr
	mov	DWORD PTR _InPtr$[ebp], eax
; Line 2862
	mov	ecx, DWORD PTR ?SendInPtr@EtherObj@@2JA	; EtherObj::SendInPtr
	add	ecx, 1
	mov	DWORD PTR ?SendInPtr@EtherObj@@2JA, ecx	; EtherObj::SendInPtr
; Line 2864
	cmp	DWORD PTR ?SendInPtr@EtherObj@@2JA, 4096 ; EtherObj::SendInPtr, 00001000H
	jne	SHORT $L2921
; Line 2866
	mov	DWORD PTR ?SendInPtr@EtherObj@@2JA, 0	; EtherObj::SendInPtr
$L2921:
; Line 2870
	mov	edx, DWORD PTR _send_buffer$[ebp]
	sub	edx, 1114078				; 0010ffdeH
	mov	DWORD PTR _send_buffer$[ebp], edx
; Line 2873
	mov	eax, DWORD PTR _currenttask$[ebp]
	push	eax
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+228]
	push	edx
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+216]
	push	ecx
	mov	edx, DWORD PTR _sendbuffer$[ebp]
	push	edx
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+112]
	push	ecx
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+232]
	push	eax
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	dx, WORD PTR [ecx+140]
	push	edx
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	cl, BYTE PTR [eax+236]
	push	ecx
	mov	edx, DWORD PTR _tcb$[ebp]
	add	edx, 18					; 00000012H
	push	edx
	mov	eax, DWORD PTR _tcb$[ebp]
	add	eax, 20					; 00000014H
	push	eax
	mov	ecx, DWORD PTR _send_buffer$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?FormatTCPPacket@TCPObj@@AAEHPAD00DGKK0HHH@Z ; TCPObj::FormatTCPPacket
	mov	DWORD PTR _TCPPack_size$[ebp], eax
; Line 2877
	mov	edx, DWORD PTR _send_buffer$[ebp]
	sub	edx, 20					; 00000014H
	mov	DWORD PTR _send_buffer$[ebp], edx
; Line 2882
	mov	eax, DWORD PTR _currenttask$[ebp]
	push	eax
	push	6
	mov	ecx, DWORD PTR _tcb$[ebp]
	add	ecx, 12					; 0000000cH
	push	ecx
	mov	edx, DWORD PTR _tcb$[ebp]
	add	edx, 20					; 00000014H
	push	edx
	mov	eax, DWORD PTR _TCPPack_size$[ebp]
	push	eax
	mov	ecx, DWORD PTR _send_buffer$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 288				; 00000120H
	call	?FormatIPPacket@IPObj@@QAEHPADHQAD1HH@Z	; IPObj::FormatIPPacket
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2883
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L2922
; Line 2884
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	SHORT $L2859
$L2922:
; Line 2886
	mov	edx, DWORD PTR _send_buffer$[ebp]
	sub	edx, 14					; 0000000eH
	mov	DWORD PTR _send_buffer$[ebp], edx
; Line 2888
	mov	eax, DWORD PTR ?SendCountTotal@TCPObj@@2HA ; TCPObj::SendCountTotal
	add	eax, 1
	mov	DWORD PTR ?SendCountTotal@TCPObj@@2HA, eax ; TCPObj::SendCountTotal
; Line 2912
	mov	ecx, DWORD PTR _currenttask$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+224]
	push	eax
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+284]
	push	edx
	mov	eax, DWORD PTR _InPtr$[ebp]
	push	eax
	mov	ecx, DWORD PTR _tcb$[ebp]
	add	ecx, 12					; 0000000cH
	push	ecx
	push	2048					; 00000800H
	mov	edx, DWORD PTR _TCPPack_size$[ebp]
	add	edx, 20					; 00000014H
	push	edx
	mov	eax, DWORD PTR _send_buffer$[ebp]
	push	eax
	lea	ecx, DWORD PTR _EO$[ebp]
	call	?FormatEthPacketN@EtherObj@@QAEHPADHH0JHHH@Z ; EtherObj::FormatEthPacketN
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2913
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L2923
; Line 2920
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	SHORT $L2859
$L2923:
; Line 2925
	xor	eax, eax
	jmp	SHORT $L2859
$L2891:
; Line 2928
	xor	eax, eax
$L2859:
; Line 2929
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	8
?SendN@TCPObj@@AAEHHH@Z ENDP				; TCPObj::SendN
_TEXT	ENDS
PUBLIC	?getRtt@TCPObj@@AAEHH@Z				; TCPObj::getRtt
_TEXT	SEGMENT
_TCBRecordNum$ = 8
_this$ = -8
_tcb$ = -4
?getRtt@TCPObj@@AAEHH@Z PROC NEAR			; TCPObj::getRtt
; Line 2935
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2937
	mov	eax, DWORD PTR _TCBRecordNum$[ebp]
	imul	eax, 288				; 00000120H
	mov	ecx, DWORD PTR ?TCBBase@TCPObj@@0KA	; TCPObj::TCBBase
	add	ecx, eax
	mov	DWORD PTR _tcb$[ebp], ecx
; Line 2938
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+28]
; Line 2939
	mov	esp, ebp
	pop	ebp
	ret	4
?getRtt@TCPObj@@AAEHH@Z ENDP				; TCPObj::getRtt
_seq1$ = 8
_seq2$ = 12
_this$ = -16
_MAXVal$ = -4
_MIDVal$ = -12
_LeastVal$ = -8
?mod32cmp@TCPObj@@AAEKKK@Z PROC NEAR			; TCPObj::mod32cmp
; Line 2951
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	mov	DWORD PTR _this$[ebp], ecx
; Line 2952
	mov	DWORD PTR _MAXVal$[ebp], -1
; Line 2953
	mov	DWORD PTR _MIDVal$[ebp], 2147483647	; 7fffffffH
; Line 2954
	mov	DWORD PTR _LeastVal$[ebp], 0
; Line 2957
	mov	eax, DWORD PTR _seq1$[ebp]
	cmp	eax, DWORD PTR _seq2$[ebp]
	jne	SHORT $L2939
; Line 2958
	xor	eax, eax
	jmp	$L2935
$L2939:
; Line 2960
	mov	ecx, DWORD PTR _seq1$[ebp]
	cmp	ecx, DWORD PTR _MIDVal$[ebp]
	ja	SHORT $L2940
	mov	edx, DWORD PTR _seq1$[ebp]
	cmp	edx, DWORD PTR _LeastVal$[ebp]
	jb	SHORT $L2940
	mov	eax, DWORD PTR _seq2$[ebp]
	cmp	eax, DWORD PTR _MIDVal$[ebp]
	ja	SHORT $L2940
	mov	ecx, DWORD PTR _seq2$[ebp]
	cmp	ecx, DWORD PTR _LeastVal$[ebp]
	jb	SHORT $L2940
; Line 2962
	mov	edx, DWORD PTR _seq1$[ebp]
	cmp	edx, DWORD PTR _seq2$[ebp]
	jae	SHORT $L2941
; Line 2964
	or	eax, -1
	jmp	$L2935
$L2941:
; Line 2966
	mov	eax, DWORD PTR _seq1$[ebp]
	sub	eax, DWORD PTR _seq2$[ebp]
	jmp	$L2935
$L2940:
; Line 2968
	mov	eax, DWORD PTR _seq1$[ebp]
	cmp	eax, DWORD PTR _MIDVal$[ebp]
	jbe	SHORT $L2943
	mov	ecx, DWORD PTR _seq1$[ebp]
	cmp	ecx, DWORD PTR _MAXVal$[ebp]
	ja	SHORT $L2943
	mov	edx, DWORD PTR _seq2$[ebp]
	cmp	edx, DWORD PTR _MIDVal$[ebp]
	jbe	SHORT $L2943
	mov	eax, DWORD PTR _seq2$[ebp]
	cmp	eax, DWORD PTR _MAXVal$[ebp]
	ja	SHORT $L2943
; Line 2970
	mov	ecx, DWORD PTR _seq1$[ebp]
	cmp	ecx, DWORD PTR _seq2$[ebp]
	jae	SHORT $L2944
; Line 2972
	or	eax, -1
	jmp	SHORT $L2935
$L2944:
; Line 2976
	jmp	SHORT $L2948
$L2943:
	mov	edx, DWORD PTR _MIDVal$[ebp]
	shr	edx, 1
	cmp	DWORD PTR _seq2$[ebp], edx
	jb	SHORT $L2946
	mov	eax, DWORD PTR _seq2$[ebp]
	cmp	eax, DWORD PTR _MIDVal$[ebp]
	ja	SHORT $L2946
	mov	ecx, DWORD PTR _seq1$[ebp]
	cmp	ecx, DWORD PTR _MIDVal$[ebp]
	jb	SHORT $L2946
	mov	edx, DWORD PTR _MIDVal$[ebp]
	imul	edx, 3
	shr	edx, 1
	cmp	DWORD PTR _seq1$[ebp], edx
	ja	SHORT $L2946
; Line 2978
	mov	eax, DWORD PTR _seq1$[ebp]
	sub	eax, DWORD PTR _seq2$[ebp]
	jmp	SHORT $L2935
$L2946:
; Line 2980
	mov	eax, DWORD PTR _seq1$[ebp]
	cmp	eax, DWORD PTR _LeastVal$[ebp]
	jb	SHORT $L2948
	mov	ecx, DWORD PTR _MIDVal$[ebp]
	shr	ecx, 1
	cmp	DWORD PTR _seq1$[ebp], ecx
	ja	SHORT $L2948
	mov	edx, DWORD PTR _seq2$[ebp]
	cmp	edx, DWORD PTR _MAXVal$[ebp]
	ja	SHORT $L2948
	mov	eax, DWORD PTR _MIDVal$[ebp]
	imul	eax, 3
	shr	eax, 1
	cmp	DWORD PTR _seq2$[ebp], eax
	jb	SHORT $L2948
; Line 2982
	mov	eax, DWORD PTR _MAXVal$[ebp]
	sub	eax, DWORD PTR _seq2$[ebp]
	mov	ecx, DWORD PTR _seq1$[ebp]
	sub	ecx, DWORD PTR _LeastVal$[ebp]
	add	eax, ecx
	jmp	SHORT $L2935
$L2948:
; Line 2984
	or	eax, -1
$L2935:
; Line 2985
	mov	esp, ebp
	pop	ebp
	ret	8
?mod32cmp@TCPObj@@AAEKKK@Z ENDP				; TCPObj::mod32cmp
_TEXT	ENDS
PUBLIC	?getSlidingWindow@TCPObj@@AAEJH@Z		; TCPObj::getSlidingWindow
_TEXT	SEGMENT
_TCBRecordNum$ = 8
_this$ = -8
_tcb$ = -4
?getSlidingWindow@TCPObj@@AAEJH@Z PROC NEAR		; TCPObj::getSlidingWindow
; Line 2992
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2994
	mov	eax, DWORD PTR _TCBRecordNum$[ebp]
	imul	eax, 288				; 00000120H
	mov	ecx, DWORD PTR ?TCBBase@TCPObj@@0KA	; TCPObj::TCBBase
	add	ecx, eax
	mov	DWORD PTR _tcb$[ebp], ecx
; Line 2995
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+104]
; Line 2996
	mov	esp, ebp
	pop	ebp
	ret	4
?getSlidingWindow@TCPObj@@AAEJH@Z ENDP			; TCPObj::getSlidingWindow
_TEXT	ENDS
PUBLIC	?CalcRTT@TCPObj@@AAEKKK@Z			; TCPObj::CalcRTT
_TEXT	SEGMENT
_LST$ = 8
_this$ = -8
_RTT$ = -4
?CalcRTT@TCPObj@@AAEKKK@Z PROC NEAR			; TCPObj::CalcRTT
; Line 3004
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 3009
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	sub	eax, DWORD PTR _LST$[ebp]
	mov	DWORD PTR _RTT$[ebp], eax
; Line 3010
	mov	eax, DWORD PTR _RTT$[ebp]
; Line 3011
	mov	esp, ebp
	pop	ebp
	ret	8
?CalcRTT@TCPObj@@AAEKKK@Z ENDP				; TCPObj::CalcRTT
_TEXT	ENDS
PUBLIC	?CalcDiff@TCPObj@@AAEKKKK@Z			; TCPObj::CalcDiff
_TEXT	SEGMENT
_LST$ = 8
_SRTT$ = 12
_DIFF$ = 16
_this$ = -12
_Diff$ = -8
_a$ = -4
?CalcDiff@TCPObj@@AAEKKKK@Z PROC NEAR			; TCPObj::CalcDiff
; Line 3017
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 3023
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	sub	eax, DWORD PTR _LST$[ebp]
	sub	eax, DWORD PTR _SRTT$[ebp]
	mov	DWORD PTR _a$[ebp], eax
; Line 3024
	cmp	DWORD PTR _a$[ebp], 0
	jb	SHORT $L2972
; Line 3025
	mov	eax, DWORD PTR _DIFF$[ebp]
	add	eax, DWORD PTR _a$[ebp]
	mov	DWORD PTR _Diff$[ebp], eax
; Line 3026
	jmp	SHORT $L2973
$L2972:
; Line 3027
	mov	ecx, DWORD PTR _DIFF$[ebp]
	sub	ecx, DWORD PTR _a$[ebp]
	mov	DWORD PTR _Diff$[ebp], ecx
$L2973:
; Line 3028
	mov	eax, DWORD PTR _Diff$[ebp]
; Line 3029
	mov	esp, ebp
	pop	ebp
	ret	12					; 0000000cH
?CalcDiff@TCPObj@@AAEKKKK@Z ENDP			; TCPObj::CalcDiff
_TEXT	ENDS
PUBLIC	?tcpSendN@TCPObj@@QAEHHH@Z			; TCPObj::tcpSendN
PUBLIC	?sendPayload4@TCPObj@@AAEHHKH@Z			; TCPObj::sendPayload4
PUBLIC	?sendPayload3@TCPObj@@AAEHHKH@Z			; TCPObj::sendPayload3
PUBLIC	?sendHeader1@TCPObj@@AAEHHKKH@Z			; TCPObj::sendHeader1
EXTRN	?TotalSuspendCount@apptask@@2JA:DWORD		; apptask::TotalSuspendCount
EXTRN	?Current_Tcbrno@apptask@@2HA:DWORD		; apptask::Current_Tcbrno
EXTRN	?AOAsuspendHTask@AOATask@@QAEXKJHH@Z:NEAR	; AOATask::AOAsuspendHTask
_DATA	SEGMENT
	ORG $+2
$SG2995	DB	'tcpSendN Avail = 0', 00H
_DATA	ENDS
_TEXT	SEGMENT
_TCBRecordNum$ = 8
_currenttask$ = 12
_this$ = -520
_task$ = -504
_tsk$ = -456
_tcb$ = -516
_tcbrno$ = -512
_retcode$ = -20
_k$ = -508
_tempvalue$ = -44
_q$ = -16
_s1$ = -40
_r$ = -24
?tcpSendN@TCPObj@@QAEHHH@Z PROC NEAR			; TCPObj::tcpSendN
; Line 3055
	push	ebp
	mov	ebp, esp
	sub	esp, 524				; 0000020cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 3056
	lea	ecx, DWORD PTR _task$[ebp]
	call	??0AOATask@@QAE@XZ			; AOATask::AOATask
; Line 3057
	lea	ecx, DWORD PTR _tsk$[ebp]
	call	??0apptask@@QAE@XZ			; apptask::apptask
; Line 3060
	mov	DWORD PTR _tcbrno$[ebp], 0
; Line 3061
	mov	eax, DWORD PTR _TCBRecordNum$[ebp]
	mov	DWORD PTR _tcbrno$[ebp], eax
; Line 3062
	mov	DWORD PTR _retcode$[ebp], 0
; Line 3063
	mov	DWORD PTR _k$[ebp], 0
; Line 3064
	mov	DWORD PTR _tempvalue$[ebp], 0
; Line 3065
	mov	DWORD PTR _q$[ebp], 0
; Line 3066
	mov	DWORD PTR _s1$[ebp], 0
; Line 3067
	mov	DWORD PTR _r$[ebp], 0
; Line 3072
	mov	ecx, DWORD PTR _tcbrno$[ebp]
	imul	ecx, 288				; 00000120H
	mov	edx, DWORD PTR ?TCBBase@TCPObj@@0KA	; TCPObj::TCBBase
	add	edx, ecx
	mov	DWORD PTR _tcb$[ebp], edx
; Line 3073
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+272], 0
; Line 3075
	mov	ecx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [ecx], 0
	jne	$L2993
; Line 3077
	push	3220					; 00000c94H
	mov	edx, DWORD PTR _TCBRecordNum$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 3078
	push	3240					; 00000ca8H
	mov	eax, DWORD PTR _tcb$[ebp]
	movsx	ecx, BYTE PTR [eax+18]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 3079
	push	3260					; 00000cbcH
	mov	edx, DWORD PTR _tcb$[ebp]
	movsx	eax, BYTE PTR [edx+19]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 3080
	push	3280					; 00000cd0H
	mov	ecx, DWORD PTR _tcb$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 3081
	push	3300					; 00000ce4H
	push	OFFSET FLAT:$SG2995
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 3082
	mov	eax, -38				; ffffffdaH
	jmp	$L2978
$L2993:
; Line 3086
	mov	edx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [edx+76], 1
	jne	SHORT $L2996
; Line 3088
	push	25					; 00000019H
	mov	eax, DWORD PTR _tcbrno$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DeleteTCB@TCPObj@@QAEHHH@Z		; TCPObj::DeleteTCB
; Line 3089
	xor	eax, eax
	jmp	$L2978
$L2996:
; Line 3092
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR _tcbrno$[ebp]
	cmp	edx, DWORD PTR [ecx+8]
	je	SHORT $L2997
; Line 3096
	mov	eax, -33				; ffffffdfH
	jmp	$L2978
$L2997:
; Line 3099
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+80], 0
; Line 3100
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+252], 1
; Line 3101
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+168], 0
; Line 3102
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+188], 0
; Line 3103
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+192], 0
; Line 3104
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+196], 0
; Line 3107
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+116], eax
; Line 3108
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+100]
	mov	DWORD PTR [edx+148], ecx
; Line 3109
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+148]
	mov	ecx, DWORD PTR _tcb$[ebp]
	add	eax, DWORD PTR [ecx+184]
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+152], eax
; Line 3110
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+148]
	mov	edx, DWORD PTR _tcb$[ebp]
	add	ecx, DWORD PTR [edx+184]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+160], ecx
; Line 3111
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+152]
	mov	eax, DWORD PTR _tcb$[ebp]
	add	edx, DWORD PTR [eax+268]
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+164], edx
; Line 3116
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+276], 0
; Line 3117
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+272], 1
; Line 3118
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+280], 0
; Line 3119
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+116], eax
$L2999:
; Line 3120
	mov	eax, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [eax+276], 0
	jne	$L3000
; Line 3125
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+272]
	mov	DWORD PTR -524+[ebp], edx
	cmp	DWORD PTR -524+[ebp], 1
	je	SHORT $L3005
	cmp	DWORD PTR -524+[ebp], 2
	je	$L3048
	jmp	$L3002
$L3005:
; Line 3127
	mov	eax, 1
	test	eax, eax
	je	SHORT $L3006
; Line 3128
	push	1860					; 00000744H
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+272]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
$L3006:
; Line 3140
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+184]
	mov	edx, DWORD PTR _tcb$[ebp]
	add	ecx, DWORD PTR [edx+268]
	mov	eax, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [eax+104], ecx
	jb	$L3007
	mov	ecx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [ecx+280], 0
	jne	$L3007
; Line 3142
	mov	edx, 1
	test	edx, edx
	je	SHORT $L3008
; Line 3143
	push	80					; 00000050H
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+124]
	push	ecx
	push	-892469247				; cace0001H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
$L3008:
; Line 3144
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+156], 1
; Line 3145
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+280], 1
; Line 3146
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+160]
	push	ecx
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+148]
	push	eax
	mov	ecx, DWORD PTR _tcbrno$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?sendHeader1@TCPObj@@AAEHHKKH@Z		; TCPObj::sendHeader1
	mov	DWORD PTR _retcode$[ebp], eax
; Line 3147
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L3009
; Line 3149
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+272], 4
; Line 3150
	push	32					; 00000020H
	mov	eax, DWORD PTR _tcbrno$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DeleteTCB@TCPObj@@QAEHHH@Z		; TCPObj::DeleteTCB
; Line 3151
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L2978
$L3009:
; Line 3153
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+152]
	push	ecx
	mov	edx, DWORD PTR _tcbrno$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?sendPayload4@TCPObj@@AAEHHKH@Z		; TCPObj::sendPayload4
	mov	DWORD PTR _retcode$[ebp], eax
; Line 3154
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L3010
; Line 3156
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+272], 4
; Line 3157
	push	33					; 00000021H
	mov	ecx, DWORD PTR _tcbrno$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DeleteTCB@TCPObj@@QAEHHH@Z		; TCPObj::DeleteTCB
; Line 3158
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L2978
$L3010:
; Line 3170
	jmp	$L3047
$L3007:
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [edx+104]
	cmp	ecx, DWORD PTR [eax+184]
	jae	$L3012
	mov	edx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [edx+280], 0
	jne	$L3012
; Line 3172
	mov	eax, 1
	test	eax, eax
	je	SHORT $L3013
; Line 3173
	push	81					; 00000051H
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+124]
	push	edx
	push	-892469246				; cace0002H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
$L3013:
; Line 3174
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+156], 2
; Line 3175
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+280], 1
; Line 3176
	mov	edx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [edx+104], 0
	jne	SHORT $L3014
; Line 3190
	jmp	$L3016
$L3014:
; Line 3192
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+148]
	mov	edx, DWORD PTR _tcb$[ebp]
	add	ecx, DWORD PTR [edx+104]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+196], ecx
; Line 3193
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+196]
	push	ecx
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+148]
	push	eax
	mov	ecx, DWORD PTR _tcbrno$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?sendHeader1@TCPObj@@AAEHHKKH@Z		; TCPObj::sendHeader1
	mov	DWORD PTR _retcode$[ebp], eax
; Line 3194
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L3016
; Line 3196
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+272], 4
; Line 3197
	push	35					; 00000023H
	mov	eax, DWORD PTR _tcbrno$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DeleteTCB@TCPObj@@QAEHHH@Z		; TCPObj::DeleteTCB
; Line 3198
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L2978
$L3016:
; Line 3212
	jmp	$L3047
$L3012:
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [ecx+104]
	cmp	eax, DWORD PTR [edx+184]
	jbe	$L3018
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+184]
	mov	eax, DWORD PTR _tcb$[ebp]
	add	edx, DWORD PTR [eax+268]
	mov	ecx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [ecx+104], edx
	jae	$L3018
	mov	edx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [edx+280], 0
	jne	$L3018
; Line 3214
	mov	eax, 1
	test	eax, eax
	je	SHORT $L3019
; Line 3215
	push	82					; 00000052H
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+124]
	push	edx
	push	-892469245				; cace0003H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
$L3019:
; Line 3216
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+156], 3
; Line 3217
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+280], 1
; Line 3218
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+160]
	push	edx
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+148]
	push	ecx
	mov	edx, DWORD PTR _tcbrno$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?sendHeader1@TCPObj@@AAEHHKKH@Z		; TCPObj::sendHeader1
	mov	DWORD PTR _retcode$[ebp], eax
; Line 3219
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L3020
; Line 3221
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+272], 4
; Line 3222
	push	36					; 00000024H
	mov	ecx, DWORD PTR _tcbrno$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DeleteTCB@TCPObj@@QAEHHH@Z		; TCPObj::DeleteTCB
; Line 3223
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L2978
$L3020:
; Line 3225
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+148]
	mov	ecx, DWORD PTR _tcb$[ebp]
	add	eax, DWORD PTR [ecx+104]
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+196], eax
; Line 3226
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+152]
	push	eax
	mov	ecx, DWORD PTR _tcbrno$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?sendPayload3@TCPObj@@AAEHHKH@Z		; TCPObj::sendPayload3
	mov	DWORD PTR _retcode$[ebp], eax
; Line 3227
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L3021
; Line 3229
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+272], 4
; Line 3230
	push	37					; 00000025H
	mov	eax, DWORD PTR _tcbrno$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DeleteTCB@TCPObj@@QAEHHH@Z		; TCPObj::DeleteTCB
; Line 3231
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L2978
$L3021:
; Line 3240
	jmp	$L3047
$L3018:
; Line 3241
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+188]
	mov	eax, DWORD PTR _tcb$[ebp]
	add	edx, DWORD PTR [eax+104]
	mov	ecx, DWORD PTR _tcb$[ebp]
	cmp	edx, DWORD PTR [ecx+184]
	jae	$L3023
	mov	edx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [edx+172], -1
	jne	$L3023
	mov	eax, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [eax+280], 1
	jne	$L3023
; Line 3243
	mov	ecx, 1
	test	ecx, ecx
	je	SHORT $L3024
; Line 3244
	push	83					; 00000053H
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+124]
	push	eax
	push	-892469244				; cace0004H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
$L3024:
; Line 3245
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+156], 4
; Line 3246
	mov	edx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [edx+104], 0
	jne	SHORT $L3025
; Line 3260
	jmp	$L3027
$L3025:
; Line 3262
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+148]
	mov	edx, DWORD PTR _tcb$[ebp]
	add	ecx, DWORD PTR [edx+188]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+192], ecx
; Line 3263
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+192]
	mov	eax, DWORD PTR _tcb$[ebp]
	add	edx, DWORD PTR [eax+104]
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+196], edx
; Line 3264
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+196]
	push	edx
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+192]
	push	ecx
	mov	edx, DWORD PTR _tcbrno$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?sendHeader1@TCPObj@@AAEHHKKH@Z		; TCPObj::sendHeader1
	mov	DWORD PTR _retcode$[ebp], eax
; Line 3265
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L3027
; Line 3267
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+272], 4
; Line 3268
	push	39					; 00000027H
	mov	ecx, DWORD PTR _tcbrno$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DeleteTCB@TCPObj@@QAEHHH@Z		; TCPObj::DeleteTCB
; Line 3269
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L2978
$L3027:
; Line 3278
	jmp	$L3047
$L3023:
; Line 3279
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+188]
	mov	ecx, DWORD PTR _tcb$[ebp]
	add	eax, DWORD PTR [ecx+104]
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [edx+184]
	mov	edx, DWORD PTR _tcb$[ebp]
	add	ecx, DWORD PTR [edx+268]
	cmp	eax, ecx
	jb	$L3029
	mov	eax, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [eax+172], -1
	jne	$L3029
	mov	ecx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [ecx+280], 1
	jne	$L3029
; Line 3281
	mov	edx, 1
	test	edx, edx
	je	SHORT $L3030
; Line 3282
	push	84					; 00000054H
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+124]
	push	ecx
	push	-892469243				; cace0005H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
$L3030:
; Line 3283
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+156], 5
; Line 3284
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+148]
	mov	edx, DWORD PTR _tcb$[ebp]
	add	ecx, DWORD PTR [edx+188]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+192], ecx
; Line 3285
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+160]
	push	ecx
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+192]
	push	eax
	mov	ecx, DWORD PTR _tcbrno$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?sendHeader1@TCPObj@@AAEHHKKH@Z		; TCPObj::sendHeader1
	mov	DWORD PTR _retcode$[ebp], eax
; Line 3286
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L3031
; Line 3288
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+272], 4
; Line 3289
	push	40					; 00000028H
	mov	eax, DWORD PTR _tcbrno$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DeleteTCB@TCPObj@@QAEHHH@Z		; TCPObj::DeleteTCB
; Line 3290
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L2978
$L3031:
; Line 3292
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+152]
	push	ecx
	mov	edx, DWORD PTR _tcbrno$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?sendPayload4@TCPObj@@AAEHHKH@Z		; TCPObj::sendPayload4
	mov	DWORD PTR _retcode$[ebp], eax
; Line 3293
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L3032
; Line 3295
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+272], 4
; Line 3296
	push	41					; 00000029H
	mov	ecx, DWORD PTR _tcbrno$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DeleteTCB@TCPObj@@QAEHHH@Z		; TCPObj::DeleteTCB
; Line 3297
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L2978
$L3032:
; Line 3305
	jmp	$L3047
$L3029:
; Line 3306
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+188]
	mov	ecx, DWORD PTR _tcb$[ebp]
	add	eax, DWORD PTR [ecx+104]
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [edx+184]
	mov	edx, DWORD PTR _tcb$[ebp]
	add	ecx, DWORD PTR [edx+268]
	cmp	eax, ecx
	jae	$L3034
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+188]
	mov	edx, DWORD PTR _tcb$[ebp]
	add	ecx, DWORD PTR [edx+104]
	mov	eax, DWORD PTR _tcb$[ebp]
	cmp	ecx, DWORD PTR [eax+184]
	jbe	$L3034
	mov	ecx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [ecx+172], -1
	jne	$L3034
	mov	edx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [edx+280], 1
	jne	$L3034
; Line 3308
	mov	eax, 1
	test	eax, eax
	je	SHORT $L3035
; Line 3309
	push	85					; 00000055H
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+124]
	push	edx
	push	-892469242				; cace0006H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
$L3035:
; Line 3310
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+156], 6
; Line 3311
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+148]
	mov	eax, DWORD PTR _tcb$[ebp]
	add	edx, DWORD PTR [eax+188]
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+192], edx
; Line 3312
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+160]
	push	edx
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+192]
	push	ecx
	mov	edx, DWORD PTR _tcbrno$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?sendHeader1@TCPObj@@AAEHHKKH@Z		; TCPObj::sendHeader1
	mov	DWORD PTR _retcode$[ebp], eax
; Line 3313
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L3036
; Line 3315
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+272], 4
; Line 3316
	push	48					; 00000030H
	mov	ecx, DWORD PTR _tcbrno$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DeleteTCB@TCPObj@@QAEHHH@Z		; TCPObj::DeleteTCB
; Line 3317
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L2978
$L3036:
; Line 3319
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+192]
	mov	ecx, DWORD PTR _tcb$[ebp]
	add	eax, DWORD PTR [ecx+104]
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+196], eax
; Line 3320
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+152]
	push	eax
	mov	ecx, DWORD PTR _tcbrno$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?sendPayload3@TCPObj@@AAEHHKH@Z		; TCPObj::sendPayload3
	mov	DWORD PTR _retcode$[ebp], eax
; Line 3321
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L3037
; Line 3323
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+272], 4
; Line 3324
	push	49					; 00000031H
	mov	eax, DWORD PTR _tcbrno$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DeleteTCB@TCPObj@@QAEHHH@Z		; TCPObj::DeleteTCB
; Line 3325
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L2978
$L3037:
; Line 3333
	jmp	$L3047
$L3034:
; Line 3334
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+188]
	mov	eax, DWORD PTR _tcb$[ebp]
	add	edx, DWORD PTR [eax+104]
	mov	ecx, DWORD PTR _tcb$[ebp]
	cmp	edx, DWORD PTR [ecx+268]
	jb	$L3039
	mov	edx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [edx+176], -1
	jne	$L3039
	mov	eax, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [eax+172], -1
	je	$L3039
	mov	ecx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [ecx+280], 1
	jne	$L3039
; Line 3336
	mov	edx, 1
	test	edx, edx
	je	SHORT $L3040
; Line 3337
	push	86					; 00000056H
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+124]
	push	ecx
	push	-892469241				; cace0007H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
$L3040:
; Line 3338
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+156], 7
; Line 3339
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+152]
	mov	edx, DWORD PTR _tcb$[ebp]
	add	ecx, DWORD PTR [edx+188]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+192], ecx
; Line 3340
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+192]
	push	ecx
	mov	edx, DWORD PTR _tcbrno$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?sendPayload4@TCPObj@@AAEHHKH@Z		; TCPObj::sendPayload4
	mov	DWORD PTR _retcode$[ebp], eax
; Line 3341
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L3041
; Line 3343
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+272], 4
; Line 3344
	push	50					; 00000032H
	mov	ecx, DWORD PTR _tcbrno$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DeleteTCB@TCPObj@@QAEHHH@Z		; TCPObj::DeleteTCB
; Line 3345
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L2978
$L3041:
; Line 3355
	jmp	$L3047
$L3039:
; Line 3356
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+188]
	mov	ecx, DWORD PTR _tcb$[ebp]
	add	eax, DWORD PTR [ecx+104]
	mov	edx, DWORD PTR _tcb$[ebp]
	cmp	eax, DWORD PTR [edx+268]
	jae	$L3047
	mov	eax, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [eax+176], -1
	jne	$L3047
	mov	ecx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [ecx+172], -1
	je	$L3047
	mov	edx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [edx+280], 1
	jne	$L3047
; Line 3358
	mov	eax, 1
	test	eax, eax
	je	$L3044
; Line 3360
	push	87					; 00000057H
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+124]
	push	edx
	push	-892469240				; cace0008H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
; Line 3361
	push	4
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+124]
	push	ecx
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+24]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
; Line 3362
	push	16					; 00000010H
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+124]
	push	edx
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+24]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
; Line 3363
	push	17					; 00000011H
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+124]
	push	eax
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+272]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
$L3044:
; Line 3365
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+156], 8
; Line 3367
	mov	ecx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [ecx+104], 0
	jne	SHORT $L3045
; Line 3381
	jmp	$L3047
$L3045:
; Line 3383
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+152]
	mov	ecx, DWORD PTR _tcb$[ebp]
	add	eax, DWORD PTR [ecx+188]
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+192], eax
; Line 3384
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+192]
	mov	edx, DWORD PTR _tcb$[ebp]
	add	ecx, DWORD PTR [edx+104]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+196], ecx
; Line 3385
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+192]
	push	ecx
	mov	edx, DWORD PTR _tcbrno$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?sendPayload3@TCPObj@@AAEHHKH@Z		; TCPObj::sendPayload3
	mov	DWORD PTR _retcode$[ebp], eax
; Line 3386
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L3047
; Line 3388
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+272], 4
; Line 3389
	push	52					; 00000034H
	mov	ecx, DWORD PTR _tcbrno$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DeleteTCB@TCPObj@@QAEHHH@Z		; TCPObj::DeleteTCB
; Line 3390
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L2978
$L3047:
; Line 3395
	jmp	$L3002
$L3048:
; Line 3397
	mov	edx, DWORD PTR ?NoOfRetransmissions@TCPObj@@2KA ; TCPObj::NoOfRetransmissions
	add	edx, 1
	mov	DWORD PTR ?NoOfRetransmissions@TCPObj@@2KA, edx ; TCPObj::NoOfRetransmissions
; Line 3398
	cmp	DWORD PTR ?NoOfRetransmissions@TCPObj@@2KA, 20 ; TCPObj::NoOfRetransmissions, 00000014H
	jbe	SHORT $L3049
; Line 3399
	or	eax, -1
	jmp	$L2978
$L3049:
; Line 3400
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+28], 175			; 000000afH
; Line 3402
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+116]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?mod32cmp@TCPObj@@AAEKKK@Z		; TCPObj::mod32cmp
	cmp	eax, 240020				; 0003a994H
	jbe	$L3050
; Line 3404
	mov	eax, DWORD PTR _currenttask$[ebp]
	push	eax
	push	6
	mov	ecx, DWORD PTR _tcb$[ebp]
	add	ecx, 12					; 0000000cH
	push	ecx
	push	4
	mov	edx, DWORD PTR _tcb$[ebp]
	add	edx, 18					; 00000012H
	push	edx
	mov	eax, DWORD PTR _tcb$[ebp]
	add	eax, 20					; 00000014H
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?SendMisc@TCPObj@@AAEHPAD0D0HH@Z	; TCPObj::SendMisc
	mov	DWORD PTR _retcode$[ebp], eax
; Line 3405
	mov	ecx, 1
	test	ecx, ecx
	je	SHORT $L3051
; Line 3406
	push	73					; 00000049H
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+124]
	push	eax
	push	-536870905				; e0000007H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
$L3051:
; Line 3407
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+272], 4
; Line 3408
	push	53					; 00000035H
	mov	edx, DWORD PTR _tcbrno$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DeleteTCB@TCPObj@@QAEHHH@Z		; TCPObj::DeleteTCB
; Line 3409
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L2978
$L3050:
; Line 3418
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+188]
	mov	edx, DWORD PTR _tcb$[ebp]
	add	ecx, DWORD PTR [edx+104]
	mov	eax, DWORD PTR _tcb$[ebp]
	cmp	ecx, DWORD PTR [eax+184]
	jae	$L3052
	mov	ecx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [ecx+172], -1
	jne	$L3052
; Line 3420
	mov	edx, 1
	test	edx, edx
	je	SHORT $L3053
; Line 3421
	push	74					; 0000004aH
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+124]
	push	ecx
	push	-892411903				; cacee001H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
$L3053:
; Line 3422
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+156], 17			; 00000011H
; Line 3423
	mov	eax, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [eax+104], 0
	jne	$L3054
; Line 3425
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	push	8
	mov	eax, DWORD PTR _tcb$[ebp]
	add	eax, 12					; 0000000cH
	push	eax
	push	16					; 00000010H
	mov	ecx, DWORD PTR _tcb$[ebp]
	add	ecx, 18					; 00000012H
	push	ecx
	mov	edx, DWORD PTR _tcb$[ebp]
	add	edx, 20					; 00000014H
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?SendMisc@TCPObj@@AAEHPAD0D0HH@Z	; TCPObj::SendMisc
	mov	DWORD PTR _retcode$[ebp], eax
; Line 3426
	mov	eax, 1
	test	eax, eax
	je	SHORT $L3055
; Line 3427
	push	64					; 00000040H
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+124]
	push	edx
	push	-1610612711				; a0000019H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
$L3055:
; Line 3428
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L3056
; Line 3430
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+272], 4
; Line 3431
	push	54					; 00000036H
	mov	ecx, DWORD PTR _tcbrno$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DeleteTCB@TCPObj@@QAEHHH@Z		; TCPObj::DeleteTCB
; Line 3432
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L2978
$L3056:
; Line 3435
	jmp	$L3058
$L3054:
; Line 3437
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+148]
	mov	ecx, DWORD PTR _tcb$[ebp]
	add	eax, DWORD PTR [ecx+188]
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+192], eax
; Line 3438
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+192]
	mov	edx, DWORD PTR _tcb$[ebp]
	add	ecx, DWORD PTR [edx+104]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+196], ecx
; Line 3439
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+196]
	push	ecx
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+192]
	push	eax
	mov	ecx, DWORD PTR _tcbrno$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?sendHeader1@TCPObj@@AAEHHKKH@Z		; TCPObj::sendHeader1
	mov	DWORD PTR _retcode$[ebp], eax
; Line 3440
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L3058
; Line 3442
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+272], 4
; Line 3443
	push	55					; 00000037H
	mov	eax, DWORD PTR _tcbrno$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DeleteTCB@TCPObj@@QAEHHH@Z		; TCPObj::DeleteTCB
; Line 3444
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L2978
$L3058:
; Line 3453
	jmp	$L3074
$L3052:
; Line 3454
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+188]
	mov	eax, DWORD PTR _tcb$[ebp]
	add	edx, DWORD PTR [eax+104]
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [ecx+184]
	mov	ecx, DWORD PTR _tcb$[ebp]
	add	eax, DWORD PTR [ecx+268]
	cmp	edx, eax
	jb	$L3060
	mov	edx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [edx+172], -1
	jne	$L3060
; Line 3456
	mov	eax, 1
	test	eax, eax
	je	SHORT $L3061
; Line 3457
	push	75					; 0000004bH
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+124]
	push	edx
	push	-892411902				; cacee002H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
$L3061:
; Line 3458
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+156], 18			; 00000012H
; Line 3459
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+148]
	mov	eax, DWORD PTR _tcb$[ebp]
	add	edx, DWORD PTR [eax+188]
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+192], edx
; Line 3460
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+160]
	push	edx
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+192]
	push	ecx
	mov	edx, DWORD PTR _tcbrno$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?sendHeader1@TCPObj@@AAEHHKKH@Z		; TCPObj::sendHeader1
	mov	DWORD PTR _retcode$[ebp], eax
; Line 3461
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L3062
; Line 3463
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+272], 4
; Line 3464
	push	56					; 00000038H
	mov	ecx, DWORD PTR _tcbrno$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DeleteTCB@TCPObj@@QAEHHH@Z		; TCPObj::DeleteTCB
; Line 3465
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L2978
$L3062:
; Line 3467
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+152]
	push	edx
	mov	eax, DWORD PTR _tcbrno$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?sendPayload4@TCPObj@@AAEHHKH@Z		; TCPObj::sendPayload4
	mov	DWORD PTR _retcode$[ebp], eax
; Line 3468
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L3063
; Line 3470
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+272], 4
; Line 3471
	push	57					; 00000039H
	mov	edx, DWORD PTR _tcbrno$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DeleteTCB@TCPObj@@QAEHHH@Z		; TCPObj::DeleteTCB
; Line 3472
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L2978
$L3063:
; Line 3480
	jmp	$L3074
$L3060:
; Line 3481
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+188]
	mov	edx, DWORD PTR _tcb$[ebp]
	add	ecx, DWORD PTR [edx+104]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [eax+184]
	mov	eax, DWORD PTR _tcb$[ebp]
	add	edx, DWORD PTR [eax+268]
	cmp	ecx, edx
	jae	$L3065
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+188]
	mov	eax, DWORD PTR _tcb$[ebp]
	add	edx, DWORD PTR [eax+104]
	mov	ecx, DWORD PTR _tcb$[ebp]
	cmp	edx, DWORD PTR [ecx+184]
	jbe	$L3065
	mov	edx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [edx+172], -1
	jne	$L3065
; Line 3483
	mov	eax, 1
	test	eax, eax
	je	SHORT $L3066
; Line 3484
	push	76					; 0000004cH
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+124]
	push	edx
	push	-892411901				; cacee003H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
$L3066:
; Line 3485
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+156], 19			; 00000013H
; Line 3486
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+148]
	mov	eax, DWORD PTR _tcb$[ebp]
	add	edx, DWORD PTR [eax+188]
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+192], edx
; Line 3487
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+160]
	push	edx
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+192]
	push	ecx
	mov	edx, DWORD PTR _tcbrno$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?sendHeader1@TCPObj@@AAEHHKKH@Z		; TCPObj::sendHeader1
	mov	DWORD PTR _retcode$[ebp], eax
; Line 3488
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L3067
; Line 3490
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+272], 4
; Line 3491
	push	64					; 00000040H
	mov	ecx, DWORD PTR _tcbrno$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DeleteTCB@TCPObj@@QAEHHH@Z		; TCPObj::DeleteTCB
; Line 3492
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L2978
$L3067:
; Line 3494
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+192]
	mov	ecx, DWORD PTR _tcb$[ebp]
	add	eax, DWORD PTR [ecx+104]
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+196], eax
; Line 3495
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+152]
	push	eax
	mov	ecx, DWORD PTR _tcbrno$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?sendPayload3@TCPObj@@AAEHHKH@Z		; TCPObj::sendPayload3
	mov	DWORD PTR _retcode$[ebp], eax
; Line 3496
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L3068
; Line 3498
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+272], 4
; Line 3499
	push	65					; 00000041H
	mov	eax, DWORD PTR _tcbrno$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DeleteTCB@TCPObj@@QAEHHH@Z		; TCPObj::DeleteTCB
; Line 3500
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L2978
$L3068:
; Line 3508
	jmp	$L3074
$L3065:
; Line 3509
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+188]
	mov	eax, DWORD PTR _tcb$[ebp]
	add	edx, DWORD PTR [eax+104]
	mov	ecx, DWORD PTR _tcb$[ebp]
	cmp	edx, DWORD PTR [ecx+268]
	jb	$L3070
	mov	edx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [edx+176], -1
	jne	$L3070
	mov	eax, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [eax+172], -1
	je	$L3070
; Line 3511
	mov	ecx, 1
	test	ecx, ecx
	je	SHORT $L3071
; Line 3512
	push	77					; 0000004dH
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+124]
	push	eax
	push	-892411900				; cacee004H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
$L3071:
; Line 3513
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+156], 20			; 00000014H
; Line 3514
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+152]
	mov	ecx, DWORD PTR _tcb$[ebp]
	add	eax, DWORD PTR [ecx+188]
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+192], eax
; Line 3515
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+192]
	push	eax
	mov	ecx, DWORD PTR _tcbrno$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?sendPayload4@TCPObj@@AAEHHKH@Z		; TCPObj::sendPayload4
	mov	DWORD PTR _retcode$[ebp], eax
; Line 3516
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L3072
; Line 3518
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+272], 4
; Line 3519
	push	66					; 00000042H
	mov	eax, DWORD PTR _tcbrno$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DeleteTCB@TCPObj@@QAEHHH@Z		; TCPObj::DeleteTCB
; Line 3520
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L2978
$L3072:
; Line 3529
	jmp	$L3074
$L3070:
; Line 3530
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+188]
	mov	eax, DWORD PTR _tcb$[ebp]
	add	edx, DWORD PTR [eax+104]
	mov	ecx, DWORD PTR _tcb$[ebp]
	cmp	edx, DWORD PTR [ecx+268]
	jae	$L3074
	mov	edx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [edx+176], -1
	jne	$L3074
	mov	eax, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [eax+172], -1
	je	$L3074
; Line 3532
	mov	ecx, 1
	test	ecx, ecx
	je	SHORT $L3075
; Line 3533
	push	78					; 0000004eH
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+124]
	push	eax
	push	-892411899				; cacee005H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
$L3075:
; Line 3534
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+156], 21			; 00000015H
; Line 3535
	mov	edx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [edx+104], 0
	jne	$L3076
; Line 3537
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	push	8
	mov	edx, DWORD PTR _tcb$[ebp]
	add	edx, 12					; 0000000cH
	push	edx
	push	16					; 00000010H
	mov	eax, DWORD PTR _tcb$[ebp]
	add	eax, 18					; 00000012H
	push	eax
	mov	ecx, DWORD PTR _tcb$[ebp]
	add	ecx, 20					; 00000014H
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?SendMisc@TCPObj@@AAEHPAD0D0HH@Z	; TCPObj::SendMisc
	mov	DWORD PTR _retcode$[ebp], eax
; Line 3538
	mov	edx, 1
	test	edx, edx
	je	SHORT $L3077
; Line 3539
	push	65					; 00000041H
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+124]
	push	ecx
	push	-1610612704				; a0000020H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
$L3077:
; Line 3540
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L3078
; Line 3542
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+272], 4
; Line 3543
	push	67					; 00000043H
	mov	eax, DWORD PTR _tcbrno$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DeleteTCB@TCPObj@@QAEHHH@Z		; TCPObj::DeleteTCB
; Line 3544
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L2978
$L3078:
; Line 3547
	jmp	$L3080
$L3076:
; Line 3549
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+152]
	mov	eax, DWORD PTR _tcb$[ebp]
	add	edx, DWORD PTR [eax+188]
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+192], edx
; Line 3550
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+192]
	mov	ecx, DWORD PTR _tcb$[ebp]
	add	eax, DWORD PTR [ecx+104]
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+196], eax
; Line 3551
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+192]
	push	eax
	mov	ecx, DWORD PTR _tcbrno$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?sendPayload3@TCPObj@@AAEHHKH@Z		; TCPObj::sendPayload3
	mov	DWORD PTR _retcode$[ebp], eax
; Line 3552
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L3080
; Line 3554
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+272], 4
; Line 3555
	push	68					; 00000044H
	mov	eax, DWORD PTR _tcbrno$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DeleteTCB@TCPObj@@QAEHHH@Z		; TCPObj::DeleteTCB
; Line 3556
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L2978
$L3080:
$L3074:
$L3002:
; Line 3566
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+68], 1
; Line 3567
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+272], 3
; Line 3568
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+72], 0
; Line 3569
	mov	ecx, 1
	test	ecx, ecx
	je	SHORT $L3082
; Line 3570
	push	1860					; 00000744H
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+24]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
$L3082:
; Line 3573
	mov	ecx, DWORD PTR ?TotalSuspendCount@apptask@@2JA ; apptask::TotalSuspendCount
	add	ecx, 1
	mov	DWORD PTR ?TotalSuspendCount@apptask@@2JA, ecx ; apptask::TotalSuspendCount
; Line 3575
	mov	edx, DWORD PTR _currenttask$[ebp]
	push	edx
	mov	eax, DWORD PTR ?Current_Tcbrno@apptask@@2HA ; apptask::Current_Tcbrno
	push	eax
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+24]
	push	edx
	push	100000					; 000186a0H
	lea	ecx, DWORD PTR _task$[ebp]
	call	?AOAsuspendHTask@AOATask@@QAEXKJHH@Z	; AOATask::AOAsuspendHTask
; Line 3578
	mov	eax, DWORD PTR ?Current_Tcbrno@apptask@@2HA ; apptask::Current_Tcbrno
	mov	DWORD PTR _tcbrno$[ebp], eax
; Line 3579
	mov	ecx, DWORD PTR _tcbrno$[ebp]
	imul	ecx, 288				; 00000120H
	mov	edx, DWORD PTR ?TCBBase@TCPObj@@0KA	; TCPObj::TCBBase
	add	edx, ecx
	mov	DWORD PTR _tcb$[ebp], edx
; Line 3580
	mov	eax, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [eax+272], 3
	je	SHORT $L3085
; Line 3582
	mov	eax, -46				; ffffffd2H
	jmp	$L2978
$L3085:
; Line 3585
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR _tcbrno$[ebp]
	cmp	edx, DWORD PTR [ecx+8]
	je	SHORT $L3086
; Line 3587
	mov	eax, -41				; ffffffd7H
	jmp	$L2978
$L3086:
; Line 3589
	mov	eax, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [eax+68], 1
	jne	$L3087
	mov	ecx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [ecx+76], 1
	jne	$L3087
; Line 3593
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	push	6
	mov	ecx, DWORD PTR _tcb$[ebp]
	add	ecx, 12					; 0000000cH
	push	ecx
	push	4
	mov	edx, DWORD PTR _tcb$[ebp]
	add	edx, 18					; 00000012H
	push	edx
	mov	eax, DWORD PTR _tcb$[ebp]
	add	eax, 20					; 00000014H
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?SendMisc@TCPObj@@AAEHPAD0D0HH@Z	; TCPObj::SendMisc
	mov	DWORD PTR _retcode$[ebp], eax
; Line 3594
	mov	ecx, 1
	test	ecx, ecx
	je	SHORT $L3088
; Line 3595
	push	73					; 00000049H
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+124]
	push	eax
	push	-536870904				; e0000008H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
$L3088:
; Line 3596
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+272], 4
; Line 3597
	push	69					; 00000045H
	mov	edx, DWORD PTR _tcbrno$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DeleteTCB@TCPObj@@QAEHHH@Z		; TCPObj::DeleteTCB
; Line 3598
	mov	eax, -39				; ffffffd9H
	jmp	$L2978
$L3087:
; Line 3600
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+68], 0
; Line 3602
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+96]
	mov	DWORD PTR [ecx+168], eax
; Line 3603
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+148]
	mov	eax, DWORD PTR _tcb$[ebp]
	add	edx, DWORD PTR [eax+184]
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+152], edx
; Line 3604
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+148]
	mov	ecx, DWORD PTR _tcb$[ebp]
	add	eax, DWORD PTR [ecx+184]
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+160], eax
; Line 3605
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+152]
	mov	edx, DWORD PTR _tcb$[ebp]
	add	ecx, DWORD PTR [edx+268]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+164], ecx
; Line 3606
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+160]
	push	edx
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+168]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?mod32cmp@TCPObj@@AAEKKK@Z		; TCPObj::mod32cmp
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+172], eax
; Line 3607
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+164]
	add	ecx, 1
	push	ecx
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+168]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?mod32cmp@TCPObj@@AAEKKK@Z		; TCPObj::mod32cmp
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+176], eax
; Line 3608
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+252], 1
; Line 3610
	mov	eax, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [eax+176], -1
	je	SHORT $L3090
; Line 3612
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+80], 1
; Line 3613
	mov	edx, 1
	test	edx, edx
	je	SHORT $L3090
; Line 3614
	push	31					; 0000001fH
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+124]
	push	ecx
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+80]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
$L3090:
; Line 3617
	mov	ecx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [ecx+172], -1
	jne	SHORT $L3091
; Line 3619
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+168]
	push	eax
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+160]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?mod32cmp@TCPObj@@AAEKKK@Z		; TCPObj::mod32cmp
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+184]
	sub	edx, eax
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+188], edx
; Line 3620
	mov	ecx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [ecx+188], 0
	jae	SHORT $L3093
; Line 3621
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+188], 0
$L3093:
; Line 3623
	jmp	SHORT $L3095
$L3091:
	mov	eax, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [eax+172], -1
	je	SHORT $L3095
	mov	ecx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [ecx+176], -1
	jne	SHORT $L3095
; Line 3625
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+168]
	push	eax
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+164]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?mod32cmp@TCPObj@@AAEKKK@Z		; TCPObj::mod32cmp
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+268]
	sub	edx, eax
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+188], edx
$L3095:
; Line 3627
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [ecx+100]
	cmp	eax, DWORD PTR [edx+96]
	jne	$L3097
	mov	ecx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [ecx+80], 1
	jne	$L3097
; Line 3629
	mov	edx, 1
	test	edx, edx
	je	$L3098
; Line 3631
	push	31					; 0000001fH
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+124]
	push	ecx
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+80]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
; Line 3632
	push	34					; 00000022H
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+124]
	push	edx
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+100]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
; Line 3633
	push	35					; 00000023H
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+124]
	push	eax
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+96]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
; Line 3634
	push	32					; 00000020H
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+124]
	push	ecx
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+24]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
; Line 3635
	push	25					; 00000019H
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+124]
	push	edx
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+272]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
$L3098:
; Line 3637
	mov	edx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [edx+24], 9
	jne	SHORT $L3099
; Line 3639
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+80], 0
; Line 3640
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+272], 2
; Line 3642
	jmp	$L3101
$L3099:
; Line 3644
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+272], 4
; Line 3645
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+276], 1
; Line 3646
	mov	ecx, 1
	test	ecx, ecx
	je	$L3101
; Line 3648
	push	31					; 0000001fH
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+124]
	push	eax
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
; Line 3649
	push	34					; 00000022H
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+124]
	push	ecx
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+100]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
; Line 3650
	push	35					; 00000023H
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+124]
	push	edx
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+96]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
; Line 3651
	push	32					; 00000020H
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+124]
	push	eax
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+24]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
; Line 3652
	push	25					; 00000019H
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+124]
	push	ecx
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+272]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
$L3101:
; Line 3657
	jmp	$L3108
$L3097:
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [ecx+100]
	cmp	eax, DWORD PTR [edx+96]
	jne	$L3103
	mov	ecx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [ecx+80], 0
	jne	$L3103
; Line 3659
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+272], 1
; Line 3660
	mov	eax, 1
	test	eax, eax
	je	$L3104
; Line 3662
	push	31					; 0000001fH
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+124]
	push	edx
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
; Line 3663
	push	34					; 00000022H
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+124]
	push	eax
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+100]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
; Line 3664
	push	35					; 00000023H
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+124]
	push	ecx
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+96]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
; Line 3665
	push	32					; 00000020H
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+124]
	push	edx
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+24]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
; Line 3666
	push	25					; 00000019H
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+124]
	push	eax
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+272]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
$L3104:
; Line 3670
	jmp	$L3108
$L3103:
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [eax+100]
	cmp	edx, DWORD PTR [ecx+96]
	jbe	$L3106
; Line 3672
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+272], 2
; Line 3674
	mov	ecx, 1
	test	ecx, ecx
	je	$L3107
; Line 3676
	push	31					; 0000001fH
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+124]
	push	eax
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
; Line 3677
	push	34					; 00000022H
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+124]
	push	ecx
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+100]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
; Line 3678
	push	35					; 00000023H
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+124]
	push	edx
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+96]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
; Line 3679
	push	32					; 00000020H
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+124]
	push	eax
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+24]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
; Line 3680
	push	25					; 00000019H
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+124]
	push	ecx
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+272]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
$L3107:
; Line 3683
	jmp	$L3108
$L3106:
; Line 3686
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	push	6
	mov	eax, DWORD PTR _tcb$[ebp]
	add	eax, 12					; 0000000cH
	push	eax
	push	4
	mov	ecx, DWORD PTR _tcb$[ebp]
	add	ecx, 18					; 00000012H
	push	ecx
	mov	edx, DWORD PTR _tcb$[ebp]
	add	edx, 20					; 00000014H
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?SendMisc@TCPObj@@AAEHPAD0D0HH@Z	; TCPObj::SendMisc
	mov	DWORD PTR _retcode$[ebp], eax
; Line 3687
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+272], 4
; Line 3688
	mov	ecx, 1
	test	ecx, ecx
	je	$L3109
; Line 3690
	push	73					; 00000049H
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+124]
	push	eax
	push	-536870903				; e0000009H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
; Line 3691
	push	23					; 00000017H
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+124]
	push	edx
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+104]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
; Line 3692
	push	25					; 00000019H
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+124]
	push	eax
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+272]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
; Line 3693
	push	26					; 0000001aH
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+124]
	push	ecx
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+100]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
; Line 3694
	push	27					; 0000001bH
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+124]
	push	edx
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+96]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
; Line 3695
	push	31					; 0000001fH
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+124]
	push	eax
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
; Line 3696
	push	4
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+124]
	push	ecx
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+24]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
$L3109:
; Line 3698
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+276], 1
$L3108:
; Line 3703
	jmp	$L2999
$L3000:
; Line 3705
	push	70					; 00000046H
	mov	edx, DWORD PTR _tcbrno$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DeleteTCB@TCPObj@@QAEHHH@Z		; TCPObj::DeleteTCB
; Line 3706
	mov	eax, 1
	test	eax, eax
	je	SHORT $L3110
; Line 3708
	push	36					; 00000024H
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+124]
	push	edx
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+276]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
$L3110:
; Line 3711
	xor	eax, eax
$L2978:
; Line 3712
	mov	esp, ebp
	pop	ebp
	ret	8
?tcpSendN@TCPObj@@QAEHHH@Z ENDP				; TCPObj::tcpSendN
_TEXT	ENDS
PUBLIC	?printStatistics@TCPObj@@QAEXH@Z		; TCPObj::printStatistics
_TEXT	SEGMENT
_this$ = -4
?printStatistics@TCPObj@@QAEXH@Z PROC NEAR		; TCPObj::printStatistics
; Line 3717
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 3718
	mov	esp, ebp
	pop	ebp
	ret	4
?printStatistics@TCPObj@@QAEXH@Z ENDP			; TCPObj::printStatistics
_TCBRecordNum$ = 8
_seqnum$ = 12
_k3$ = 16
_currenttask$ = 20
_this$ = -424
_tsk$ = -416
_retcode$ = -4
_tcb$ = -420
?sendHeader1@TCPObj@@AAEHHKKH@Z PROC NEAR		; TCPObj::sendHeader1
; Line 3724
	push	ebp
	mov	ebp, esp
	sub	esp, 424				; 000001a8H
	mov	DWORD PTR _this$[ebp], ecx
; Line 3725
	lea	ecx, DWORD PTR _tsk$[ebp]
	call	??0apptask@@QAE@XZ			; apptask::apptask
; Line 3735
	mov	DWORD PTR _retcode$[ebp], 0
; Line 3738
	mov	eax, DWORD PTR _TCBRecordNum$[ebp]
	imul	eax, 288				; 00000120H
	mov	ecx, DWORD PTR ?TCBBase@TCPObj@@0KA	; TCPObj::TCBBase
	add	ecx, eax
	mov	DWORD PTR _tcb$[ebp], ecx
; Line 3740
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+200], 0
; Line 3741
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR _seqnum$[ebp]
	sub	ecx, DWORD PTR [eax+148]
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+204], ecx
; Line 3742
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR _seqnum$[ebp]
	mov	DWORD PTR [eax+208], ecx
; Line 3743
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+212], 0
; Line 3744
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR _k3$[ebp]
	sub	ecx, DWORD PTR [eax+148]
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+216], ecx
; Line 3745
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+220], 0
; Line 3746
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+224], 3
; Line 3748
	mov	edx, DWORD PTR _currenttask$[ebp]
	push	edx
	mov	eax, DWORD PTR _TCBRecordNum$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?SendN@TCPObj@@AAEHHH@Z			; TCPObj::SendN
	mov	DWORD PTR _retcode$[ebp], eax
; Line 3749
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L3127
; Line 3751
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	SHORT $L3121
$L3127:
; Line 3754
	mov	ecx, 1
	test	ecx, ecx
	je	SHORT $L3128
; Line 3755
	push	4
	mov	edx, DWORD PTR _currenttask$[ebp]
	sub	edx, DWORD PTR ?MinTaskId@apptask@@2JA	; apptask::MinTaskId
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 348				; 0000015cH
	call	?insert@WTTrace@@QAEHHG@Z		; WTTrace::insert
$L3128:
; Line 3757
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+88], 1
; Line 3759
	mov	ecx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [ecx+252], 1
	jne	SHORT $L3129
; Line 3761
	mov	edx, DWORD PTR _k3$[ebp]
	add	edx, 1
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+100], edx
$L3129:
; Line 3764
	xor	eax, eax
$L3121:
; Line 3765
	mov	esp, ebp
	pop	ebp
	ret	16					; 00000010H
?sendHeader1@TCPObj@@AAEHHKKH@Z ENDP			; TCPObj::sendHeader1
_TCBRecordNum$ = 8
_seqnum$ = 12
_currenttask$ = 16
_this$ = -12
_retcode$ = -4
_tcb$ = -8
?sendPayload3@TCPObj@@AAEHHKH@Z PROC NEAR		; TCPObj::sendPayload3
; Line 3771
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 3772
	mov	DWORD PTR _retcode$[ebp], 0
; Line 3775
	mov	eax, DWORD PTR _TCBRecordNum$[ebp]
	imul	eax, 288				; 00000120H
	mov	ecx, DWORD PTR ?TCBBase@TCPObj@@0KA	; TCPObj::TCBBase
	add	ecx, eax
	mov	DWORD PTR _tcb$[ebp], ecx
; Line 3777
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+200], 1
; Line 3778
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR _seqnum$[ebp]
	sub	ecx, DWORD PTR [eax+152]
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+204], ecx
; Line 3779
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR _seqnum$[ebp]
	mov	DWORD PTR [eax+208], ecx
; Line 3780
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+196]
	sub	eax, DWORD PTR _seqnum$[ebp]
	xor	edx, edx
	mov	ecx, 1300				; 00000514H
	div	ecx
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+212], eax
; Line 3781
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+196]
	sub	ecx, DWORD PTR _seqnum$[ebp]
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+212]
	imul	eax, 1300				; 00000514H
	sub	ecx, eax
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+216], ecx
; Line 3782
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+220], 0
; Line 3783
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+224], 4
; Line 3785
	mov	edx, 1
	test	edx, edx
	je	SHORT $L3140
; Line 3787
	push	4
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+124]
	push	ecx
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+24]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
; Line 3788
	push	42					; 0000002aH
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+124]
	push	edx
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+212]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
; Line 3789
	push	43					; 0000002bH
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+124]
	push	eax
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+216]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
$L3140:
; Line 3792
	mov	eax, DWORD PTR _currenttask$[ebp]
	push	eax
	mov	ecx, DWORD PTR _TCBRecordNum$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?SendN@TCPObj@@AAEHHH@Z			; TCPObj::SendN
	mov	DWORD PTR _retcode$[ebp], eax
; Line 3794
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L3141
; Line 3796
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	SHORT $L3135
$L3141:
; Line 3799
	mov	edx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [edx+252], 1
	jne	SHORT $L3142
; Line 3801
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+196]
	mov	DWORD PTR [eax+100], edx
; Line 3802
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+252], 0
$L3142:
; Line 3806
	xor	eax, eax
$L3135:
; Line 3807
	mov	esp, ebp
	pop	ebp
	ret	12					; 0000000cH
?sendPayload3@TCPObj@@AAEHHKH@Z ENDP			; TCPObj::sendPayload3
_TCBRecordNum$ = 8
_seqnum$ = 12
_currenttask$ = 16
_this$ = -424
_retcode$ = -4
_tsk$ = -416
_tcb$ = -420
?sendPayload4@TCPObj@@AAEHHKH@Z PROC NEAR		; TCPObj::sendPayload4
; Line 3814
	push	ebp
	mov	ebp, esp
	sub	esp, 424				; 000001a8H
	mov	DWORD PTR _this$[ebp], ecx
; Line 3815
	mov	DWORD PTR _retcode$[ebp], 0
; Line 3816
	lea	ecx, DWORD PTR _tsk$[ebp]
	call	??0apptask@@QAE@XZ			; apptask::apptask
; Line 3819
	mov	eax, DWORD PTR _TCBRecordNum$[ebp]
	imul	eax, 288				; 00000120H
	mov	ecx, DWORD PTR ?TCBBase@TCPObj@@0KA	; TCPObj::TCBBase
	add	ecx, eax
	mov	DWORD PTR _tcb$[ebp], ecx
; Line 3821
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+200], 1
; Line 3822
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR _seqnum$[ebp]
	sub	ecx, DWORD PTR [eax+152]
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+204], ecx
; Line 3823
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR _seqnum$[ebp]
	mov	DWORD PTR [eax+208], ecx
; Line 3824
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+164]
	sub	eax, DWORD PTR _seqnum$[ebp]
	xor	edx, edx
	mov	ecx, 1300				; 00000514H
	div	ecx
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+212], eax
; Line 3825
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+164]
	sub	ecx, DWORD PTR _seqnum$[ebp]
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+212]
	imul	eax, 1300				; 00000514H
	sub	ecx, eax
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+216], ecx
; Line 3826
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+220], 1
; Line 3827
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+224], 4
; Line 3829
	mov	edx, 1
	test	edx, edx
	je	SHORT $L3154
; Line 3831
	push	4
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+124]
	push	ecx
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+24]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
; Line 3832
	push	44					; 0000002cH
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+124]
	push	edx
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+212]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
; Line 3833
	push	45					; 0000002dH
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+124]
	push	eax
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+216]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
$L3154:
; Line 3836
	mov	eax, DWORD PTR _currenttask$[ebp]
	push	eax
	mov	ecx, DWORD PTR _TCBRecordNum$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?SendN@TCPObj@@AAEHHH@Z			; TCPObj::SendN
	mov	DWORD PTR _retcode$[ebp], eax
; Line 3838
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L3155
; Line 3840
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L3148
$L3155:
; Line 3843
	mov	edx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [edx+252], 1
	jne	SHORT $L3156
; Line 3845
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+164]
	add	ecx, 1
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+100], ecx
; Line 3846
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+252], 0
$L3156:
; Line 3849
	mov	ecx, 1
	test	ecx, ecx
	je	SHORT $L3157
; Line 3850
	push	8
	mov	edx, DWORD PTR _currenttask$[ebp]
	sub	edx, DWORD PTR ?MinTaskId@apptask@@2JA	; apptask::MinTaskId
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 348				; 0000015cH
	call	?insert@WTTrace@@QAEHHG@Z		; WTTrace::insert
$L3157:
; Line 3851
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+24], 6
; Line 3852
	mov	ecx, 1
	test	ecx, ecx
	je	SHORT $L3158
; Line 3853
	push	4
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+124]
	push	eax
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+24]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
$L3158:
; Line 3857
	xor	eax, eax
$L3148:
; Line 3858
	mov	esp, ebp
	pop	ebp
	ret	12					; 0000000cH
?sendPayload4@TCPObj@@AAEHHKH@Z ENDP			; TCPObj::sendPayload4
_TEXT	ENDS
PUBLIC	?getSuspendFlag@TCPObj@@QAEHH@Z			; TCPObj::getSuspendFlag
_TEXT	SEGMENT
_tcbrno$ = 8
_this$ = -12
_tcb$ = -4
_flag1$ = -8
?getSuspendFlag@TCPObj@@QAEHH@Z PROC NEAR		; TCPObj::getSuspendFlag
; Line 3864
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 3868
	mov	eax, DWORD PTR _tcbrno$[ebp]
	imul	eax, 288				; 00000120H
	mov	ecx, DWORD PTR ?TCBBase@TCPObj@@0KA	; TCPObj::TCBBase
	add	ecx, eax
	mov	DWORD PTR _tcb$[ebp], ecx
; Line 3871
	mov	edx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [edx], 1
	jne	SHORT $L3167
; Line 3872
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+68]
	mov	DWORD PTR _flag1$[ebp], ecx
; Line 3873
	jmp	SHORT $L3168
$L3167:
	mov	DWORD PTR _flag1$[ebp], 0
$L3168:
; Line 3874
	mov	eax, DWORD PTR _flag1$[ebp]
; Line 3875
	mov	esp, ebp
	pop	ebp
	ret	4
?getSuspendFlag@TCPObj@@QAEHH@Z ENDP			; TCPObj::getSuspendFlag
_TEXT	ENDS
PUBLIC	?getResumeFlag@TCPObj@@QAEHH@Z			; TCPObj::getResumeFlag
_TEXT	SEGMENT
_tcbrno$ = 8
_this$ = -12
_tcb$ = -4
_flag1$ = -8
?getResumeFlag@TCPObj@@QAEHH@Z PROC NEAR		; TCPObj::getResumeFlag
; Line 3881
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 3885
	mov	eax, DWORD PTR _tcbrno$[ebp]
	imul	eax, 288				; 00000120H
	mov	ecx, DWORD PTR ?TCBBase@TCPObj@@0KA	; TCPObj::TCBBase
	add	ecx, eax
	mov	DWORD PTR _tcb$[ebp], ecx
; Line 3888
	mov	edx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [edx], 1
	jne	SHORT $L3177
; Line 3889
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+72]
	mov	DWORD PTR _flag1$[ebp], ecx
; Line 3890
	jmp	SHORT $L3178
$L3177:
	mov	DWORD PTR _flag1$[ebp], 0
$L3178:
; Line 3891
	mov	eax, DWORD PTR _flag1$[ebp]
; Line 3892
	mov	esp, ebp
	pop	ebp
	ret	4
?getResumeFlag@TCPObj@@QAEHH@Z ENDP			; TCPObj::getResumeFlag
_TEXT	ENDS
PUBLIC	?getResetFlag@TCPObj@@QAEHH@Z			; TCPObj::getResetFlag
_TEXT	SEGMENT
_tcbrno$ = 8
_this$ = -12
_tcb$ = -4
_flag1$ = -8
?getResetFlag@TCPObj@@QAEHH@Z PROC NEAR			; TCPObj::getResetFlag
; Line 3897
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 3901
	mov	eax, DWORD PTR _tcbrno$[ebp]
	imul	eax, 288				; 00000120H
	mov	ecx, DWORD PTR ?TCBBase@TCPObj@@0KA	; TCPObj::TCBBase
	add	ecx, eax
	mov	DWORD PTR _tcb$[ebp], ecx
; Line 3904
	mov	edx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [edx], 1
	jne	SHORT $L3187
; Line 3905
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+76]
	mov	DWORD PTR _flag1$[ebp], ecx
; Line 3906
	jmp	SHORT $L3188
$L3187:
	mov	DWORD PTR _flag1$[ebp], 0
$L3188:
; Line 3907
	mov	eax, DWORD PTR _flag1$[ebp]
; Line 3908
	mov	esp, ebp
	pop	ebp
	ret	4
?getResetFlag@TCPObj@@QAEHH@Z ENDP			; TCPObj::getResetFlag
_TEXT	ENDS
PUBLIC	?resetResumeFlag@TCPObj@@QAEHH@Z		; TCPObj::resetResumeFlag
_TEXT	SEGMENT
_tcbrno$ = 8
_this$ = -12
_tcb$ = -4
?resetResumeFlag@TCPObj@@QAEHH@Z PROC NEAR		; TCPObj::resetResumeFlag
; Line 3913
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 3917
	mov	eax, DWORD PTR _tcbrno$[ebp]
	imul	eax, 288				; 00000120H
	mov	ecx, DWORD PTR ?TCBBase@TCPObj@@0KA	; TCPObj::TCBBase
	add	ecx, eax
	mov	DWORD PTR _tcb$[ebp], ecx
; Line 3918
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+72], 0
; Line 3919
	xor	eax, eax
; Line 3920
	mov	esp, ebp
	pop	ebp
	ret	4
?resetResumeFlag@TCPObj@@QAEHH@Z ENDP			; TCPObj::resetResumeFlag
_TEXT	ENDS
PUBLIC	?setTaskID@TCPObj@@QAEHHH@Z			; TCPObj::setTaskID
_TEXT	SEGMENT
_tcbrno$ = 8
_currenttask$ = 12
_this$ = -4
?setTaskID@TCPObj@@QAEHHH@Z PROC NEAR			; TCPObj::setTaskID
; Line 3926
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 3927
	mov	eax, DWORD PTR _tcbrno$[ebp]
	imul	eax, 288				; 00000120H
	mov	ecx, DWORD PTR ?TCBBase@TCPObj@@0KA	; TCPObj::TCBBase
	add	ecx, eax
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+336], ecx
; Line 3928
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+336]
	mov	edx, DWORD PTR _currenttask$[ebp]
	mov	DWORD PTR [ecx+4], edx
; Line 3929
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+336]
	mov	edx, DWORD PTR _tcbrno$[ebp]
	mov	DWORD PTR [ecx+8], edx
; Line 3931
	xor	eax, eax
; Line 3932
	mov	esp, ebp
	pop	ebp
	ret	8
?setTaskID@TCPObj@@QAEHHH@Z ENDP			; TCPObj::setTaskID
_TEXT	ENDS
PUBLIC	?getTaskID@TCPObj@@QAEHH@Z			; TCPObj::getTaskID
_TEXT	SEGMENT
_tcbrno$ = 8
_this$ = -8
_retcode$ = -4
?getTaskID@TCPObj@@QAEHH@Z PROC NEAR			; TCPObj::getTaskID
; Line 3938
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 3939
	mov	DWORD PTR _retcode$[ebp], 0
; Line 3941
	mov	eax, DWORD PTR _tcbrno$[ebp]
	imul	eax, 288				; 00000120H
	mov	ecx, DWORD PTR ?TCBBase@TCPObj@@0KA	; TCPObj::TCBBase
	add	ecx, eax
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+336], ecx
; Line 3942
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+336]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR _retcode$[ebp], edx
; Line 3944
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 3945
	mov	esp, ebp
	pop	ebp
	ret	4
?getTaskID@TCPObj@@QAEHH@Z ENDP				; TCPObj::getTaskID
_TEXT	ENDS
PUBLIC	?getMsgPtr@TCPObj@@QAEPADHPAH@Z			; TCPObj::getMsgPtr
_TEXT	SEGMENT
_tcbrno$ = 8
_length$ = 12
_this$ = -12
_p1$ = -8
_c1$ = -4
?getMsgPtr@TCPObj@@QAEPADHPAH@Z PROC NEAR		; TCPObj::getMsgPtr
; Line 3951
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 3954
	lea	eax, DWORD PTR _c1$[ebp]
	mov	DWORD PTR _p1$[ebp], eax
; Line 3956
	mov	ecx, DWORD PTR _tcbrno$[ebp]
	imul	ecx, 288				; 00000120H
	mov	edx, DWORD PTR ?TCBBase@TCPObj@@0KA	; TCPObj::TCBBase
	add	edx, ecx
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+336], edx
; Line 3957
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+336]
	mov	eax, DWORD PTR _length$[ebp]
	mov	ecx, DWORD PTR [edx+180]
	mov	DWORD PTR [eax], ecx
; Line 3958
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+336]
	mov	ecx, DWORD PTR [eax+248]
	mov	DWORD PTR _p1$[ebp], ecx
; Line 3960
	mov	eax, DWORD PTR _p1$[ebp]
; Line 3961
	mov	esp, ebp
	pop	ebp
	ret	8
?getMsgPtr@TCPObj@@QAEPADHPAH@Z ENDP			; TCPObj::getMsgPtr
_TEXT	ENDS
PUBLIC	?setFileParam@TCPObj@@QAEHHPADJKJH@Z		; TCPObj::setFileParam
_TEXT	SEGMENT
_tcbrno$ = 8
_responseHeader$ = 12
_hSize$ = 16
_resourceAddress$ = 20
_fileSize$ = 24
_currenttask$ = 28
_this$ = -4
?setFileParam@TCPObj@@QAEHHPADJKJH@Z PROC NEAR		; TCPObj::setFileParam
; Line 3968
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 3970
	mov	eax, DWORD PTR _tcbrno$[ebp]
	imul	eax, 288				; 00000120H
	mov	ecx, DWORD PTR ?TCBBase@TCPObj@@0KA	; TCPObj::TCBBase
	add	ecx, eax
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+336], ecx
; Line 3973
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+336]
	mov	edx, DWORD PTR _currenttask$[ebp]
	cmp	edx, DWORD PTR [ecx+4]
	jne	SHORT $L3231
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+336]
	mov	edx, DWORD PTR _tcbrno$[ebp]
	cmp	edx, DWORD PTR [ecx+8]
	jne	SHORT $L3231
; Line 3977
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+336]
	mov	edx, DWORD PTR _responseHeader$[ebp]
	mov	DWORD PTR [ecx+240], edx
; Line 3978
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+336]
	mov	edx, DWORD PTR _hSize$[ebp]
	mov	DWORD PTR [ecx+184], edx
; Line 3979
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+336]
	mov	edx, DWORD PTR _resourceAddress$[ebp]
	mov	DWORD PTR [ecx+244], edx
; Line 3980
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+336]
	mov	edx, DWORD PTR _fileSize$[ebp]
	mov	DWORD PTR [ecx+268], edx
; Line 3983
	jmp	$L3233
$L3231:
; Line 3985
	push	2900					; 00000b54H
	mov	eax, DWORD PTR _tcbrno$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 3986
	push	2920					; 00000b68H
	mov	ecx, DWORD PTR _currenttask$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 3987
	push	2940					; 00000b7cH
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+336]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 3988
	push	2960					; 00000b90H
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+336]
	mov	ecx, DWORD PTR [eax+8]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 3989
	mov	DWORD PTR ?Application_Status@AOAProtected@@2HA, 2 ; AOAProtected::Application_Status
; Line 3990
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAExit@AOAProtected@@QAEXXZ		; AOAProtected::AOAExit
; Line 3991
	mov	eax, -31				; ffffffe1H
	jmp	SHORT $L3228
$L3233:
; Line 3993
	xor	eax, eax
$L3228:
; Line 3994
	mov	esp, ebp
	pop	ebp
	ret	24					; 00000018H
?setFileParam@TCPObj@@QAEHHPADJKJH@Z ENDP		; TCPObj::setFileParam
_TEXT	ENDS
PUBLIC	?getHttpCount@TCPObj@@QAEHXZ			; TCPObj::getHttpCount
_TEXT	SEGMENT
_this$ = -4
?getHttpCount@TCPObj@@QAEHXZ PROC NEAR			; TCPObj::getHttpCount
; Line 4000
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 4001
	mov	eax, DWORD PTR ?HttpCount@TCPObj@@2KA	; TCPObj::HttpCount
; Line 4002
	mov	esp, ebp
	pop	ebp
	ret	0
?getHttpCount@TCPObj@@QAEHXZ ENDP			; TCPObj::getHttpCount
_TEXT	ENDS
PUBLIC	?PrintTCB@TCPObj@@AAEHHH@Z			; TCPObj::PrintTCB
_TEXT	SEGMENT
_tcbrno$ = 8
_lineno$ = 12
_this$ = -8
_tcb$ = -4
?PrintTCB@TCPObj@@AAEHHH@Z PROC NEAR			; TCPObj::PrintTCB
; Line 4008
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 4010
	mov	eax, DWORD PTR _tcbrno$[ebp]
	imul	eax, 288				; 00000120H
	mov	ecx, DWORD PTR ?TCBBase@TCPObj@@0KA	; TCPObj::TCBBase
	add	ecx, eax
	mov	DWORD PTR _tcb$[ebp], ecx
; Line 4012
	mov	edx, DWORD PTR _lineno$[ebp]
	push	edx
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 4013
	mov	edx, DWORD PTR _lineno$[ebp]
	add	edx, 20					; 00000014H
	push	edx
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 4014
	mov	edx, DWORD PTR _lineno$[ebp]
	add	edx, 40					; 00000028H
	push	edx
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+96]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 4015
	mov	edx, DWORD PTR _lineno$[ebp]
	add	edx, 60					; 0000003cH
	push	edx
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+100]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 4016
	mov	edx, DWORD PTR _lineno$[ebp]
	add	edx, 80					; 00000050H
	push	edx
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 4017
	mov	edx, DWORD PTR _lineno$[ebp]
	add	edx, 100				; 00000064H
	push	edx
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+24]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 4018
	mov	edx, DWORD PTR _lineno$[ebp]
	add	edx, 120				; 00000078H
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 4020
	xor	eax, eax
; Line 4021
	mov	esp, ebp
	pop	ebp
	ret	8
?PrintTCB@TCPObj@@AAEHHH@Z ENDP				; TCPObj::PrintTCB
_TEXT	ENDS
PUBLIC	?getAvail@TCPObj@@QAEHH@Z			; TCPObj::getAvail
_TEXT	SEGMENT
_tcbrno$ = 8
_this$ = -8
_tcb$ = -4
?getAvail@TCPObj@@QAEHH@Z PROC NEAR			; TCPObj::getAvail
; Line 4027
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 4029
	mov	eax, DWORD PTR _tcbrno$[ebp]
	imul	eax, 288				; 00000120H
	mov	ecx, DWORD PTR ?TCBBase@TCPObj@@0KA	; TCPObj::TCBBase
	add	ecx, eax
	mov	DWORD PTR _tcb$[ebp], ecx
; Line 4031
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx]
; Line 4032
	mov	esp, ebp
	pop	ebp
	ret	4
?getAvail@TCPObj@@QAEHH@Z ENDP				; TCPObj::getAvail
_TEXT	ENDS
PUBLIC	?StoreTrace3@TCPObj@@AAEXPADH@Z			; TCPObj::StoreTrace3
_TEXT	SEGMENT
_ptr$ = 8
_size$ = 12
_this$ = -12
_i$ = -4
_tptr$ = -8
?StoreTrace3@TCPObj@@AAEXPADH@Z PROC NEAR		; TCPObj::StoreTrace3
; Line 4036
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 4039
	mov	DWORD PTR _tptr$[ebp], 166658048	; 09ef0000H
; Line 4041
	mov	eax, DWORD PTR _tptr$[ebp]
	add	eax, DWORD PTR ?logcount@TCPObj@@0HA	; TCPObj::logcount
	mov	cl, BYTE PTR _size$[ebp]
	mov	BYTE PTR [eax], cl
; Line 4042
	mov	edx, DWORD PTR _tptr$[ebp]
	add	edx, DWORD PTR ?logcount@TCPObj@@0HA	; TCPObj::logcount
	mov	BYTE PTR [edx+4], 120			; 00000078H
; Line 4043
	mov	eax, DWORD PTR _tptr$[ebp]
	add	eax, DWORD PTR ?logcount@TCPObj@@0HA	; TCPObj::logcount
	mov	BYTE PTR [eax+5], 86			; 00000056H
; Line 4044
	mov	ecx, DWORD PTR _tptr$[ebp]
	add	ecx, DWORD PTR ?logcount@TCPObj@@0HA	; TCPObj::logcount
	mov	BYTE PTR [ecx+6], 52			; 00000034H
; Line 4045
	mov	edx, DWORD PTR _tptr$[ebp]
	add	edx, DWORD PTR ?logcount@TCPObj@@0HA	; TCPObj::logcount
	mov	BYTE PTR [edx+7], 18			; 00000012H
; Line 4047
	cmp	DWORD PTR ?logcount@TCPObj@@0HA, 40000	; TCPObj::logcount, 00009c40H
	jge	SHORT $L3261
; Line 4049
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L3262
$L3263:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L3262:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _size$[ebp]
	jge	SHORT $L3264
; Line 4050
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, DWORD PTR ?logcount@TCPObj@@0HA	; TCPObj::logcount
	mov	eax, DWORD PTR _ptr$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _tptr$[ebp]
	mov	al, BYTE PTR [eax]
	mov	BYTE PTR [ecx+edx+8], al
	jmp	SHORT $L3263
$L3264:
; Line 4051
	mov	ecx, DWORD PTR _size$[ebp]
	mov	edx, DWORD PTR ?logcount@TCPObj@@0HA	; TCPObj::logcount
	lea	eax, DWORD PTR [edx+ecx+32]
	mov	DWORD PTR ?logcount@TCPObj@@0HA, eax	; TCPObj::logcount
$L3261:
; Line 4053
	mov	esp, ebp
	pop	ebp
	ret	8
?StoreTrace3@TCPObj@@AAEXPADH@Z ENDP			; TCPObj::StoreTrace3
_TEXT	ENDS
PUBLIC	?storeTraceTCBRecord@TCPObj@@QAEHH@Z		; TCPObj::storeTraceTCBRecord
_TEXT	SEGMENT
_tcbrno$ = 8
_this$ = -36
_noOfBytes$ = -4
_i$ = -24
_tcb$ = -32
_p1$ = -16
_p2$ = -20
_c1$ = -8
_c2$ = -12
_addr$ = -28
?storeTraceTCBRecord@TCPObj@@QAEHH@Z PROC NEAR		; TCPObj::storeTraceTCBRecord
; Line 4060
	push	ebp
	mov	ebp, esp
	sub	esp, 36					; 00000024H
	mov	DWORD PTR _this$[ebp], ecx
; Line 4061
	mov	DWORD PTR _noOfBytes$[ebp], 0
; Line 4062
	mov	DWORD PTR _i$[ebp], 0
; Line 4068
	lea	eax, DWORD PTR _c1$[ebp]
	mov	DWORD PTR _p1$[ebp], eax
; Line 4069
	lea	ecx, DWORD PTR _c2$[ebp]
	mov	DWORD PTR _p2$[ebp], ecx
; Line 4070
	mov	DWORD PTR _addr$[ebp], 0
; Line 4072
	mov	edx, DWORD PTR _tcbrno$[ebp]
	imul	edx, 288				; 00000120H
	mov	eax, DWORD PTR ?TCBBase@TCPObj@@0KA	; TCPObj::TCBBase
	add	eax, edx
	mov	DWORD PTR _tcb$[ebp], eax
; Line 4073
	mov	DWORD PTR _noOfBytes$[ebp], 288		; 00000120H
; Line 4074
	mov	DWORD PTR _addr$[ebp], 166658048	; 09ef0000H
; Line 4075
	mov	ecx, DWORD PTR _addr$[ebp]
	mov	DWORD PTR _p1$[ebp], ecx
; Line 4076
	mov	edx, DWORD PTR ?trace1Count@TCPObj@@2JA	; TCPObj::trace1Count
	imul	edx, DWORD PTR _noOfBytes$[ebp]
	mov	eax, DWORD PTR _p1$[ebp]
	add	eax, edx
	mov	DWORD PTR _p1$[ebp], eax
; Line 4077
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR _p2$[ebp], ecx
; Line 4079
	cmp	DWORD PTR ?trace1Count@TCPObj@@2JA, 10000 ; TCPObj::trace1Count, 00002710H
	jge	SHORT $L3282
; Line 4081
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L3283
$L3284:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L3283:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _noOfBytes$[ebp]
	jge	SHORT $L3285
; Line 4083
	mov	ecx, DWORD PTR _p1$[ebp]
	mov	edx, DWORD PTR _p2$[ebp]
	mov	al, BYTE PTR [edx]
	mov	BYTE PTR [ecx], al
; Line 4084
	mov	ecx, DWORD PTR _p1$[ebp]
	add	ecx, 1
	mov	DWORD PTR _p1$[ebp], ecx
; Line 4085
	mov	edx, DWORD PTR _p2$[ebp]
	add	edx, 1
	mov	DWORD PTR _p2$[ebp], edx
; Line 4086
	jmp	SHORT $L3284
$L3285:
; Line 4087
	mov	eax, DWORD PTR ?trace1Count@TCPObj@@2JA	; TCPObj::trace1Count
	add	eax, 1
	mov	DWORD PTR ?trace1Count@TCPObj@@2JA, eax	; TCPObj::trace1Count
$L3282:
; Line 4089
	xor	eax, eax
; Line 4090
	mov	esp, ebp
	pop	ebp
	ret	4
?storeTraceTCBRecord@TCPObj@@QAEHH@Z ENDP		; TCPObj::storeTraceTCBRecord
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG3304	DB	'Trace Global Index Exceeded!', 00H
_DATA	ENDS
_TEXT	SEGMENT
_dataw$ = 8
_base$ = 12
_index$ = 16
_this$ = -20
_i$ = -12
_p1$ = -8
_c1$ = -4
_addr$ = -16
?storeTraceDword@TCPObj@@QAEHHHH@Z PROC NEAR		; TCPObj::storeTraceDword
; Line 4101
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	mov	DWORD PTR _this$[ebp], ecx
; Line 4102
	mov	DWORD PTR _i$[ebp], 0
; Line 4105
	lea	eax, DWORD PTR _c1$[ebp]
	mov	DWORD PTR _p1$[ebp], eax
; Line 4106
	mov	DWORD PTR _addr$[ebp], 0
; Line 4107
	mov	DWORD PTR _addr$[ebp], 166658048	; 09ef0000H
; Line 4109
	cmp	DWORD PTR _dataw$[ebp], -1717986919	; 99999999H
	jne	SHORT $L3296
; Line 4111
	mov	ecx, DWORD PTR _base$[ebp]
	shl	ecx, 9
	mov	edx, DWORD PTR _addr$[ebp]
	add	edx, ecx
	mov	eax, DWORD PTR _index$[ebp]
	lea	ecx, DWORD PTR [edx+eax*4]
	mov	DWORD PTR _addr$[ebp], ecx
; Line 4112
	mov	edx, DWORD PTR _addr$[ebp]
	mov	DWORD PTR _p1$[ebp], edx
; Line 4113
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L3298
$L3299:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L3298:
	cmp	DWORD PTR _i$[ebp], 127			; 0000007fH
	jge	SHORT $L3300
; Line 4115
	mov	ecx, DWORD PTR _p1$[ebp]
	mov	DWORD PTR [ecx], 0
; Line 4116
	mov	edx, DWORD PTR _p1$[ebp]
	add	edx, 4
	mov	DWORD PTR _p1$[ebp], edx
; Line 4117
	jmp	SHORT $L3299
$L3300:
; Line 4118
	mov	eax, DWORD PTR _p1$[ebp]
	mov	DWORD PTR [eax], -1717986919		; 99999999H
; Line 4119
	xor	eax, eax
	jmp	SHORT $L3291
$L3296:
; Line 4121
	cmp	DWORD PTR ?traceGlobalIndex@TCPObj@@2HA, 10000 ; TCPObj::traceGlobalIndex, 00002710H
	jge	SHORT $L3301
; Line 4123
	mov	ecx, DWORD PTR _base$[ebp]
	shl	ecx, 9
	mov	edx, DWORD PTR _addr$[ebp]
	add	edx, ecx
	mov	eax, DWORD PTR _index$[ebp]
	lea	ecx, DWORD PTR [edx+eax*4]
	mov	DWORD PTR _addr$[ebp], ecx
; Line 4124
	mov	edx, DWORD PTR _addr$[ebp]
	mov	DWORD PTR _p1$[ebp], edx
; Line 4125
	mov	eax, DWORD PTR _p1$[ebp]
	mov	ecx, DWORD PTR _dataw$[ebp]
	mov	DWORD PTR [eax], ecx
; Line 4127
	jmp	SHORT $L3303
$L3301:
; Line 4129
	push	3860					; 00000f14H
	push	OFFSET FLAT:$SG3304
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
$L3303:
; Line 4131
	xor	eax, eax
$L3291:
; Line 4132
	mov	esp, ebp
	pop	ebp
	ret	12					; 0000000cH
?storeTraceDword@TCPObj@@QAEHHHH@Z ENDP			; TCPObj::storeTraceDword
_TEXT	ENDS
END
