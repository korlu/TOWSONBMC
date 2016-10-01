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
PUBLIC	?averageconntime@TCPObj@@0KA			; TCPObj::averageconntime
PUBLIC	?sizeOfTCBRecord@TCPObj@@2HA			; TCPObj::sizeOfTCBRecord
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
?averageconntime@TCPObj@@0KA DD 01H DUP (?)		; TCPObj::averageconntime
?sizeOfTCBRecord@TCPObj@@2HA DD 01H DUP (?)		; TCPObj::sizeOfTCBRecord
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
?min@@3KA DD	0aH					; min
_DATA	ENDS
PUBLIC	?initRecord@TCPObj@@QAEHXZ			; TCPObj::initRecord
_TEXT	SEGMENT
_this$ = -4
?initRecord@TCPObj@@QAEHXZ PROC NEAR			; TCPObj::initRecord
; File tcpobj.cpp
; Line 65
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 66
	mov	DWORD PTR ?sizeOfTCBRecord@TCPObj@@2HA, 288 ; TCPObj::sizeOfTCBRecord, 00000120H
; Line 67
	mov	eax, DWORD PTR ?sizeOfTCBRecord@TCPObj@@2HA ; TCPObj::sizeOfTCBRecord
; Line 68
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
EXTRN	??0random@@QAE@H@Z:NEAR				; random::random
EXTRN	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z:NEAR	; AOAProtected::AOAsetSharedMem
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
; Line 78
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 79
	mov	DWORD PTR _hashSize$[ebp], 0
; Line 80
	mov	DWORD PTR ?SendCountTotal@TCPObj@@2HA, 0 ; TCPObj::SendCountTotal
; Line 81
	mov	DWORD PTR ?TCBCount@TCPObj@@0JA, 0	; TCPObj::TCBCount
; Line 82
	mov	DWORD PTR ?trace1Count@TCPObj@@2JA, 0	; TCPObj::trace1Count
; Line 83
	mov	DWORD PTR ?trace2Count@TCPObj@@2JA, 0	; TCPObj::trace2Count
; Line 86
	mov	eax, DWORD PTR _TCPBuffBase$[ebp]
	sub	eax, 1114112				; 00110000H
	mov	DWORD PTR _TCPBuffBase$[ebp], eax
; Line 87
	mov	ecx, DWORD PTR _TCPBuffBase$[ebp]
	push	ecx
	mov	edx, DWORD PTR _NoHashRecords$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 328				; 00000148H
	call	?init@TcphashIndex@@QAEHJK@Z		; TcphashIndex::init
	mov	DWORD PTR _hashSize$[ebp], eax
; Line 91
	mov	eax, DWORD PTR _NoTCBRecords$[ebp]
	mov	DWORD PTR ?TCBRecords@TCPObj@@0JA, eax	; TCPObj::TCBRecords
; Line 93
	push	0
	push	180					; 000000b4H
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 94
	push	0
	push	256					; 00000100H
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 95
	push	0
	push	260					; 00000104H
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 96
	push	0
	push	264					; 00000108H
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 97
	push	0
	push	268					; 0000010cH
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 98
	push	0
	push	272					; 00000110H
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 99
	push	0
	push	276					; 00000114H
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 100
	push	0
	push	280					; 00000118H
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 102
	push	0
	push	184					; 000000b8H
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 103
	push	0
	push	188					; 000000bcH
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 104
	push	0
	push	192					; 000000c0H
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 105
	push	0
	push	196					; 000000c4H
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 106
	push	0
	push	200					; 000000c8H
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 107
	push	0
	push	204					; 000000ccH
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 108
	push	0
	push	208					; 000000d0H
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 109
	mov	DWORD PTR ?SendCountTotal@TCPObj@@2HA, 0 ; TCPObj::SendCountTotal
; Line 112
	mov	ecx, DWORD PTR _NoTCBRecords$[ebp]
	imul	ecx, 288				; 00000120H
	mov	edx, DWORD PTR _hashSize$[ebp]
	add	edx, ecx
	cmp	DWORD PTR _TCBBufferSize$[ebp], edx
	jae	SHORT $L2175
; Line 115
	push	3960					; 00000f78H
	push	288					; 00000120H
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 116
	mov	DWORD PTR ?Application_Status@AOAProtected@@2HA, 2 ; AOAProtected::Application_Status
; Line 117
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAExit@AOAProtected@@QAEXXZ		; AOAProtected::AOAExit
; Line 118
	int	-11					; fffffff5H
; Line 119
	or	eax, -1
	jmp	$L2172
$L2175:
; Line 122
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L2178
$L2179:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L2178:
	cmp	DWORD PTR _i$[ebp], 4
	jge	SHORT $L2180
; Line 124
	mov	ecx, DWORD PTR _SrcIP$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	mov	al, BYTE PTR [ecx]
	mov	BYTE PTR ?HostIP@TCPObj@@0PADA[edx], al
; Line 125
	mov	ecx, DWORD PTR _GwayIP$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	mov	al, BYTE PTR [ecx]
	mov	BYTE PTR ?GateWayIP@TCPObj@@0PADA[edx], al
; Line 126
	mov	ecx, DWORD PTR _SubnetMask$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	mov	al, BYTE PTR [ecx]
	mov	BYTE PTR ?HostSubnetMask@TCPObj@@0PADA[edx], al
; Line 127
	jmp	SHORT $L2179
$L2180:
; Line 130
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L2181
$L2182:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L2181:
	cmp	DWORD PTR _i$[ebp], 6
	jge	SHORT $L2183
; Line 132
	mov	edx, DWORD PTR _GwayMAC$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	mov	cl, BYTE PTR [edx]
	mov	BYTE PTR ?GateWayMAC@TCPObj@@0PADA[eax], cl
; Line 133
	jmp	SHORT $L2182
$L2183:
; Line 137
	mov	dx, WORD PTR _SrcPort$[ebp]
	mov	WORD PTR ?SourcePort@TCPObj@@0GA, dx	; TCPObj::SourcePort
; Line 142
	mov	eax, DWORD PTR _TCPBuffBase$[ebp]
	add	eax, DWORD PTR _hashSize$[ebp]
	mov	DWORD PTR ?TCBBase@TCPObj@@0KA, eax	; TCPObj::TCBBase
; Line 146
	mov	ecx, DWORD PTR ?TCBBase@TCPObj@@0KA	; TCPObj::TCBBase
	mov	DWORD PTR _TCBPointer$[ebp], ecx
; Line 148
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L2186
$L2187:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L2186:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _NoTCBRecords$[ebp]
	jge	$L2188
; Line 150
	cmp	DWORD PTR _i$[ebp], 0
	jne	SHORT $L2189
; Line 152
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 288				; 00000120H
	mov	edx, DWORD PTR _TCBPointer$[ebp]
	mov	DWORD PTR [edx+ecx], 0
; Line 153
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 288				; 00000120H
	mov	ecx, DWORD PTR _TCBPointer$[ebp]
	mov	DWORD PTR [ecx+eax+256], -1
; Line 154
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 288				; 00000120H
	mov	ecx, DWORD PTR _TCBPointer$[ebp]
	mov	DWORD PTR [ecx+eax+260], edx
; Line 155
	mov	DWORD PTR ?FreeList@TCPObj@@0JA, 0	; TCPObj::FreeList
; Line 157
	jmp	$L2192
$L2189:
	mov	edx, DWORD PTR _NoTCBRecords$[ebp]
	sub	edx, 1
	cmp	DWORD PTR _i$[ebp], edx
	jne	SHORT $L2191
; Line 159
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 288				; 00000120H
	mov	ecx, DWORD PTR _TCBPointer$[ebp]
	mov	DWORD PTR [ecx+eax], 0
; Line 160
	mov	edx, DWORD PTR _i$[ebp]
	sub	edx, 1
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 288				; 00000120H
	mov	ecx, DWORD PTR _TCBPointer$[ebp]
	mov	DWORD PTR [ecx+eax+256], edx
; Line 161
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 288				; 00000120H
	mov	eax, DWORD PTR _TCBPointer$[ebp]
	mov	DWORD PTR [eax+edx+260], -1
; Line 163
	jmp	SHORT $L2192
$L2191:
; Line 165
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 288				; 00000120H
	mov	edx, DWORD PTR _TCBPointer$[ebp]
	mov	DWORD PTR [edx+ecx], 0
; Line 166
	mov	eax, DWORD PTR _i$[ebp]
	sub	eax, 1
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 288				; 00000120H
	mov	edx, DWORD PTR _TCBPointer$[ebp]
	mov	DWORD PTR [edx+ecx+256], eax
; Line 167
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 288				; 00000120H
	mov	edx, DWORD PTR _TCBPointer$[ebp]
	mov	DWORD PTR [edx+ecx+260], eax
$L2192:
; Line 169
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 288				; 00000120H
	mov	ecx, DWORD PTR _TCBPointer$[ebp]
	mov	DWORD PTR [ecx+eax+24], 1
; Line 170
	jmp	$L2187
$L2188:
; Line 172
	mov	DWORD PTR ?HttpCount@TCPObj@@2KA, 0	; TCPObj::HttpCount
; Line 173
	mov	DWORD PTR ?HttpRequests@TCPObj@@2KA, 0	; TCPObj::HttpRequests
; Line 174
	mov	DWORD PTR ?SynCount@TCPObj@@2KA, 0	; TCPObj::SynCount
; Line 175
	mov	DWORD PTR ?SynAckCount@TCPObj@@2KA, 0	; TCPObj::SynAckCount
; Line 176
	mov	DWORD PTR ?GetCount@TCPObj@@2KA, 0	; TCPObj::GetCount
; Line 177
	mov	DWORD PTR ?MaxSynGetTime@TCPObj@@2KA, 0	; TCPObj::MaxSynGetTime
; Line 178
	mov	DWORD PTR ?TotalSynGetTime@TCPObj@@2KA, 0 ; TCPObj::TotalSynGetTime
; Line 179
	mov	DWORD PTR ?MaxConnectionTime@TCPObj@@2KA, 0 ; TCPObj::MaxConnectionTime
; Line 180
	mov	DWORD PTR ?MaxNoOfTasksUsed@TCPObj@@2KA, 0 ; TCPObj::MaxNoOfTasksUsed
; Line 181
	mov	DWORD PTR ?MaxNoOfTCBsUsed@TCPObj@@2KA, 0 ; TCPObj::MaxNoOfTCBsUsed
; Line 182
	mov	DWORD PTR ?MaxSynGetThreshCount@TCPObj@@2KA, 0 ; TCPObj::MaxSynGetThreshCount
; Line 183
	mov	DWORD PTR ?NoOfRetransmissions@TCPObj@@2KA, 0 ; TCPObj::NoOfRetransmissions
; Line 185
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	push	eax
	lea	ecx, DWORD PTR _r$[ebp]
	call	??0random@@QAE@H@Z			; random::random
; Line 186
	xor	eax, eax
$L2172:
; Line 187
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
; Line 195
	push	ebp
	mov	ebp, esp
	sub	esp, 28					; 0000001cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 197
	mov	eax, DWORD PTR ?TCBBase@TCPObj@@0KA	; TCPObj::TCBBase
	mov	DWORD PTR _TCBPointer$[ebp], eax
; Line 199
	mov	ecx, DWORD PTR ?FreeList@TCPObj@@0JA	; TCPObj::FreeList
	imul	ecx, 288				; 00000120H
	mov	edx, DWORD PTR _TCBPointer$[ebp]
	add	edx, ecx
	mov	DWORD PTR _FreeTCB$[ebp], edx
; Line 200
	mov	DWORD PTR _FreeTCBIndex$[ebp], 0
; Line 201
	mov	DWORD PTR _hashvalue$[ebp], 0
; Line 202
	mov	DWORD PTR _hashIndexVal$[ebp], 0
; Line 205
	cmp	DWORD PTR ?FreeList@TCPObj@@0JA, -1	; TCPObj::FreeList
	jne	SHORT $L2205
; Line 207
	or	eax, -1
	jmp	$L2198
$L2205:
; Line 211
	mov	eax, DWORD PTR ?FreeList@TCPObj@@0JA	; TCPObj::FreeList
	mov	DWORD PTR _FreeTCBIndex$[ebp], eax
; Line 213
	mov	ecx, DWORD PTR _FreeTCB$[ebp]
	mov	edx, DWORD PTR [ecx+260]
	mov	DWORD PTR ?FreeList@TCPObj@@0JA, edx	; TCPObj::FreeList
; Line 215
	mov	eax, DWORD PTR _FreeTCB$[ebp]
	mov	DWORD PTR [eax], 1
; Line 217
	cmp	DWORD PTR ?FreeList@TCPObj@@0JA, -1	; TCPObj::FreeList
	je	SHORT $L2206
; Line 219
	mov	ecx, DWORD PTR ?FreeList@TCPObj@@0JA	; TCPObj::FreeList
	imul	ecx, 288				; 00000120H
	mov	edx, DWORD PTR _TCBPointer$[ebp]
	mov	DWORD PTR [edx+ecx+256], -1
$L2206:
; Line 223
	mov	eax, DWORD PTR _FreeTCB$[ebp]
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	dl, BYTE PTR [ecx+18]
	mov	BYTE PTR [eax+18], dl
; Line 224
	mov	eax, DWORD PTR _FreeTCB$[ebp]
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	dl, BYTE PTR [ecx+19]
	mov	BYTE PTR [eax+19], dl
; Line 226
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L2208
$L2209:
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	DWORD PTR _j$[ebp], eax
$L2208:
	cmp	DWORD PTR _j$[ebp], 4
	jge	SHORT $L2210
; Line 228
	mov	ecx, DWORD PTR _FreeTCB$[ebp]
	add	ecx, DWORD PTR _j$[ebp]
	mov	edx, DWORD PTR _tcb$[ebp]
	add	edx, DWORD PTR _j$[ebp]
	mov	al, BYTE PTR [edx+20]
	mov	BYTE PTR [ecx+20], al
; Line 229
	jmp	SHORT $L2209
$L2210:
; Line 231
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L2211
$L2212:
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
$L2211:
	cmp	DWORD PTR _j$[ebp], 6
	jge	SHORT $L2213
; Line 233
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	add	edx, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	add	eax, DWORD PTR _j$[ebp]
	mov	cl, BYTE PTR [eax+12]
	mov	BYTE PTR [edx+12], cl
; Line 234
	jmp	SHORT $L2212
$L2213:
; Line 237
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+24]
	mov	DWORD PTR [edx+24], ecx
; Line 239
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+96]
	mov	DWORD PTR [edx+96], ecx
; Line 241
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+100]
	mov	DWORD PTR [edx+100], ecx
; Line 243
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+104]
	mov	DWORD PTR [edx+104], ecx
; Line 245
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+128]
	mov	DWORD PTR [edx+128], ecx
; Line 247
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+132]
	mov	DWORD PTR [edx+132], ecx
; Line 249
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+136]
	mov	DWORD PTR [edx+136], ecx
; Line 251
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+112]
	mov	DWORD PTR [edx+112], ecx
; Line 253
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+140]
	mov	DWORD PTR [edx+140], ecx
; Line 255
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+144]
	mov	DWORD PTR [edx+144], ecx
; Line 257
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+28]
	mov	DWORD PTR [edx+28], ecx
; Line 259
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+108]
	mov	DWORD PTR [edx+108], ecx
; Line 261
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+120]
	mov	DWORD PTR [edx+120], ecx
; Line 262
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	mov	DWORD PTR [edx+4], ecx
; Line 263
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	mov	DWORD PTR [edx+8], ecx
; Line 264
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+148]
	mov	DWORD PTR [edx+148], ecx
; Line 265
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+84]
	mov	DWORD PTR [edx+84], ecx
; Line 266
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+88]
	mov	DWORD PTR [edx+88], ecx
; Line 267
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+152]
	mov	DWORD PTR [edx+152], ecx
; Line 268
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+160]
	mov	DWORD PTR [edx+160], ecx
; Line 269
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+164]
	mov	DWORD PTR [edx+164], ecx
; Line 270
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+168]
	mov	DWORD PTR [edx+168], ecx
; Line 271
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+172]
	mov	DWORD PTR [edx+172], ecx
; Line 272
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+176]
	mov	DWORD PTR [edx+176], ecx
; Line 273
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+152]
	mov	DWORD PTR [edx+152], ecx
; Line 274
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+248]
	mov	DWORD PTR [edx+248], ecx
; Line 275
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+180]
	mov	DWORD PTR [edx+180], ecx
; Line 276
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+80]
	mov	DWORD PTR [edx+80], ecx
; Line 277
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+252]
	mov	DWORD PTR [edx+252], ecx
; Line 278
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+156]
	mov	DWORD PTR [edx+156], ecx
; Line 279
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+124]
	mov	DWORD PTR [edx+124], ecx
; Line 281
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+200]
	mov	DWORD PTR [edx+200], ecx
; Line 282
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+204]
	mov	DWORD PTR [edx+204], ecx
; Line 283
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+208]
	mov	DWORD PTR [edx+208], ecx
; Line 284
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+212]
	mov	DWORD PTR [edx+212], ecx
; Line 285
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+216]
	mov	DWORD PTR [edx+216], ecx
; Line 286
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+220]
	mov	DWORD PTR [edx+220], ecx
; Line 287
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+224]
	mov	DWORD PTR [edx+224], ecx
; Line 289
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+272]
	mov	DWORD PTR [edx+272], ecx
; Line 290
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+276]
	mov	DWORD PTR [edx+276], ecx
; Line 291
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+284]
	mov	DWORD PTR [edx+284], ecx
; Line 292
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+228]
	mov	DWORD PTR [edx+228], ecx
; Line 293
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+232]
	mov	DWORD PTR [edx+232], ecx
; Line 294
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+68]
	mov	DWORD PTR [edx+68], ecx
; Line 295
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+72]
	mov	DWORD PTR [edx+72], ecx
; Line 296
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+64]
	mov	DWORD PTR [edx+64], ecx
; Line 297
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+236]
	mov	DWORD PTR [edx+236], ecx
; Line 298
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+76]
	mov	DWORD PTR [edx+76], ecx
; Line 299
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+32]
	mov	DWORD PTR [edx+32], ecx
; Line 300
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+36]
	mov	DWORD PTR [edx+36], ecx
; Line 301
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+40]
	mov	DWORD PTR [edx+40], ecx
; Line 302
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+44]
	mov	DWORD PTR [edx+44], ecx
; Line 303
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+48]
	mov	DWORD PTR [edx+48], ecx
; Line 304
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+52]
	mov	DWORD PTR [edx+52], ecx
; Line 305
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+56]
	mov	DWORD PTR [edx+56], ecx
; Line 306
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+60]
	mov	DWORD PTR [edx+60], ecx
; Line 308
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
; Line 309
	mov	ecx, DWORD PTR _hashvalue$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 328				; 00000148H
	call	?getIndex@TcphashIndex@@QAEJJ@Z		; TcphashIndex::getIndex
	mov	DWORD PTR _hashIndexVal$[ebp], eax
; Line 310
	cmp	DWORD PTR _hashIndexVal$[ebp], -1
	jne	SHORT $L2214
; Line 312
	mov	edx, DWORD PTR _FreeTCB$[ebp]
	mov	DWORD PTR [edx+260], -1
; Line 313
	mov	eax, DWORD PTR _FreeTCB$[ebp]
	mov	DWORD PTR [eax+256], -1
; Line 314
	mov	ecx, DWORD PTR _FreeTCBIndex$[ebp]
	push	ecx
	mov	edx, DWORD PTR _hashvalue$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 328				; 00000148H
	call	?setIndex@TcphashIndex@@QAEJJJ@Z	; TcphashIndex::setIndex
; Line 316
	jmp	SHORT $L2215
$L2214:
; Line 318
	mov	eax, DWORD PTR _FreeTCB$[ebp]
	mov	DWORD PTR [eax+256], -1
; Line 319
	mov	ecx, DWORD PTR _FreeTCB$[ebp]
	mov	edx, DWORD PTR _hashIndexVal$[ebp]
	mov	DWORD PTR [ecx+260], edx
; Line 320
	mov	eax, DWORD PTR _hashIndexVal$[ebp]
	imul	eax, 288				; 00000120H
	mov	ecx, DWORD PTR _TCBPointer$[ebp]
	mov	edx, DWORD PTR _FreeTCBIndex$[ebp]
	mov	DWORD PTR [ecx+eax+256], edx
; Line 321
	mov	eax, DWORD PTR _FreeTCBIndex$[ebp]
	push	eax
	mov	ecx, DWORD PTR _hashvalue$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 328				; 00000148H
	call	?setIndex@TcphashIndex@@QAEJJJ@Z	; TcphashIndex::setIndex
$L2215:
; Line 325
	mov	eax, DWORD PTR _FreeTCBIndex$[ebp]
$L2198:
; Line 326
	mov	esp, ebp
	pop	ebp
	ret	4
?InsertTCB@TCPObj@@AAEHPAUTCBRecord@1@@Z ENDP		; TCPObj::InsertTCB
_TEXT	ENDS
PUBLIC	?DeleteTCB@TCPObj@@QAEHH@Z			; TCPObj::DeleteTCB
_TEXT	SEGMENT
_TCBRecordNum$ = 8
_this$ = -32
_TCBPointer$ = -16
_tcb$ = -24
_prev$ = -20
_next$ = -28
_hashValue$ = -12
_gettime$ = -8
_retcode$ = -4
?DeleteTCB@TCPObj@@QAEHH@Z PROC NEAR			; TCPObj::DeleteTCB
; Line 330
	push	ebp
	mov	ebp, esp
	sub	esp, 32					; 00000020H
	mov	DWORD PTR _this$[ebp], ecx
; Line 335
	mov	DWORD PTR _hashValue$[ebp], 0
; Line 336
	mov	DWORD PTR _gettime$[ebp], 0
; Line 337
	mov	DWORD PTR _retcode$[ebp], 0
; Line 339
	mov	eax, DWORD PTR _TCBRecordNum$[ebp]
	imul	eax, 288				; 00000120H
	mov	ecx, DWORD PTR ?TCBBase@TCPObj@@0KA	; TCPObj::TCBBase
	add	ecx, eax
	mov	DWORD PTR _tcb$[ebp], ecx
; Line 342
	mov	edx, DWORD PTR ?TotalDelCount@TCPObj@@2KA ; TCPObj::TotalDelCount
	add	edx, 1
	mov	DWORD PTR ?TotalDelCount@TCPObj@@2KA, edx ; TCPObj::TotalDelCount
; Line 344
	mov	eax, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [eax+64], 0
	jne	SHORT $L2229
; Line 350
	mov	ecx, DWORD PTR ?UnMatchedRequests@TCPObj@@2HA ; TCPObj::UnMatchedRequests
	add	ecx, 1
	mov	DWORD PTR ?UnMatchedRequests@TCPObj@@2HA, ecx ; TCPObj::UnMatchedRequests
$L2229:
; Line 380
	xor	eax, eax
	test	eax, eax
	je	SHORT $L2233
; Line 382
	push	1860					; 00000744H
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+24]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 383
	push	2200					; 00000898H
	mov	eax, DWORD PTR ?UnMatchedRequests@TCPObj@@2HA ; TCPObj::UnMatchedRequests
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
$L2233:
; Line 387
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [ecx+60]
	sub	eax, DWORD PTR [edx+32]
	mov	DWORD PTR _gettime$[ebp], eax
; Line 388
	mov	ecx, DWORD PTR _gettime$[ebp]
	cmp	ecx, DWORD PTR ?MaxConnectionTime@TCPObj@@2KA ; TCPObj::MaxConnectionTime
	jbe	SHORT $L2234
	cmp	DWORD PTR _gettime$[ebp], 0
	jl	SHORT $L2234
; Line 389
	mov	edx, DWORD PTR _gettime$[ebp]
	mov	DWORD PTR ?MaxConnectionTime@TCPObj@@2KA, edx ; TCPObj::MaxConnectionTime
$L2234:
; Line 391
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [eax+44]
	sub	edx, DWORD PTR [ecx+32]
	mov	DWORD PTR _gettime$[ebp], edx
; Line 392
	mov	eax, DWORD PTR ?TotalSynGetTime@TCPObj@@2KA ; TCPObj::TotalSynGetTime
	add	eax, DWORD PTR _gettime$[ebp]
	mov	DWORD PTR ?TotalSynGetTime@TCPObj@@2KA, eax ; TCPObj::TotalSynGetTime
; Line 393
	mov	ecx, DWORD PTR _gettime$[ebp]
	cmp	ecx, DWORD PTR ?MaxSynGetTime@TCPObj@@2KA ; TCPObj::MaxSynGetTime
	jbe	SHORT $L2236
	cmp	DWORD PTR _gettime$[ebp], 0
	jl	SHORT $L2236
; Line 395
	mov	edx, DWORD PTR _gettime$[ebp]
	mov	DWORD PTR ?MaxSynGetTime@TCPObj@@2KA, edx ; TCPObj::MaxSynGetTime
; Line 396
	cmp	DWORD PTR ?MaxSynGetTime@TCPObj@@2KA, 20000 ; TCPObj::MaxSynGetTime, 00004e20H
	jbe	SHORT $L2236
; Line 398
	mov	eax, DWORD PTR ?MaxSynGetThreshCount@TCPObj@@2KA ; TCPObj::MaxSynGetThreshCount
	add	eax, 1
	mov	DWORD PTR ?MaxSynGetThreshCount@TCPObj@@2KA, eax ; TCPObj::MaxSynGetThreshCount
$L2236:
; Line 429
	mov	edx, DWORD PTR ?TCBBase@TCPObj@@0KA	; TCPObj::TCBBase
	mov	DWORD PTR _TCBPointer$[ebp], edx
; Line 431
	mov	eax, DWORD PTR _TCBRecordNum$[ebp]
	imul	eax, 288				; 00000120H
	mov	ecx, DWORD PTR _TCBPointer$[ebp]
	cmp	DWORD PTR [ecx+eax+24], 1
	jne	SHORT $L2239
; Line 433
	xor	eax, eax
	jmp	$L2219
$L2239:
; Line 435
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	mov	edx, DWORD PTR _TCBRecordNum$[ebp]
	imul	edx, 288				; 00000120H
	mov	ecx, DWORD PTR _TCBPointer$[ebp]
	sub	eax, DWORD PTR [ecx+edx+264]
	mov	edx, DWORD PTR ?averageconntime@TCPObj@@0KA ; TCPObj::averageconntime
	add	edx, eax
	mov	DWORD PTR ?averageconntime@TCPObj@@0KA, edx ; TCPObj::averageconntime
; Line 436
	mov	eax, DWORD PTR _TCBRecordNum$[ebp]
	imul	eax, 288				; 00000120H
	mov	ecx, DWORD PTR _TCBPointer$[ebp]
	mov	DWORD PTR [ecx+eax+24], 1
; Line 438
	mov	edx, DWORD PTR _TCBRecordNum$[ebp]
	imul	edx, 288				; 00000120H
	mov	eax, DWORD PTR _TCBPointer$[ebp]
	mov	DWORD PTR [eax+edx], 0
; Line 439
	mov	ecx, DWORD PTR _TCBRecordNum$[ebp]
	imul	ecx, 288				; 00000120H
	mov	edx, DWORD PTR _TCBPointer$[ebp]
	mov	DWORD PTR [edx+ecx+8], -1
; Line 440
	mov	eax, DWORD PTR _TCBRecordNum$[ebp]
	imul	eax, 288				; 00000120H
	mov	ecx, DWORD PTR _TCBPointer$[ebp]
	mov	DWORD PTR [ecx+eax+4], -1
; Line 441
	mov	edx, DWORD PTR _TCBRecordNum$[ebp]
	imul	edx, 288				; 00000120H
	mov	eax, DWORD PTR _TCBPointer$[ebp]
	mov	DWORD PTR [eax+edx+64], 0
; Line 446
	mov	ecx, DWORD PTR _TCBRecordNum$[ebp]
	imul	ecx, 288				; 00000120H
	mov	edx, DWORD PTR _TCBPointer$[ebp]
	mov	eax, DWORD PTR [edx+ecx+256]
	mov	DWORD PTR _prev$[ebp], eax
; Line 447
	mov	ecx, DWORD PTR _TCBRecordNum$[ebp]
	imul	ecx, 288				; 00000120H
	mov	edx, DWORD PTR _TCBPointer$[ebp]
	mov	eax, DWORD PTR [edx+ecx+260]
	mov	DWORD PTR _next$[ebp], eax
; Line 448
	mov	ecx, DWORD PTR _TCBRecordNum$[ebp]
	imul	ecx, 288				; 00000120H
	mov	edx, DWORD PTR _TCBPointer$[ebp]
	lea	eax, DWORD PTR [edx+ecx+18]
	push	eax
	mov	ecx, DWORD PTR _TCBRecordNum$[ebp]
	imul	ecx, 288				; 00000120H
	mov	edx, DWORD PTR _TCBPointer$[ebp]
	lea	eax, DWORD PTR [edx+ecx+20]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 328				; 00000148H
	call	?hashfun@TcphashIndex@@QAEJPAD0@Z	; TcphashIndex::hashfun
	mov	DWORD PTR _hashValue$[ebp], eax
; Line 449
	cmp	DWORD PTR _next$[ebp], -1
	jne	SHORT $L2241
	cmp	DWORD PTR _prev$[ebp], -1
	jne	SHORT $L2241
; Line 452
	push	-1
	mov	ecx, DWORD PTR _hashValue$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 328				; 00000148H
	call	?setIndex@TcphashIndex@@QAEJJJ@Z	; TcphashIndex::setIndex
$L2241:
; Line 454
	cmp	DWORD PTR _next$[ebp], -1
	jne	SHORT $L2242
	cmp	DWORD PTR _prev$[ebp], -1
	jle	SHORT $L2242
; Line 457
	mov	edx, DWORD PTR _prev$[ebp]
	imul	edx, 288				; 00000120H
	mov	eax, DWORD PTR _TCBPointer$[ebp]
	mov	DWORD PTR [eax+edx+260], -1
$L2242:
; Line 459
	cmp	DWORD PTR _next$[ebp], -1
	jle	SHORT $L2243
	cmp	DWORD PTR _prev$[ebp], -1
	jne	SHORT $L2243
; Line 462
	mov	ecx, DWORD PTR _next$[ebp]
	push	ecx
	mov	edx, DWORD PTR _hashValue$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 328				; 00000148H
	call	?setIndex@TcphashIndex@@QAEJJJ@Z	; TcphashIndex::setIndex
; Line 463
	mov	eax, DWORD PTR _next$[ebp]
	imul	eax, 288				; 00000120H
	mov	ecx, DWORD PTR _TCBPointer$[ebp]
	mov	DWORD PTR [ecx+eax+256], -1
$L2243:
; Line 466
	cmp	DWORD PTR _next$[ebp], -1
	jle	SHORT $L2244
	cmp	DWORD PTR _prev$[ebp], -1
	jle	SHORT $L2244
; Line 468
	mov	edx, DWORD PTR _next$[ebp]
	imul	edx, 288				; 00000120H
	mov	eax, DWORD PTR _TCBPointer$[ebp]
	mov	ecx, DWORD PTR _prev$[ebp]
	mov	DWORD PTR [eax+edx+256], ecx
; Line 469
	mov	edx, DWORD PTR _prev$[ebp]
	imul	edx, 288				; 00000120H
	mov	eax, DWORD PTR _TCBPointer$[ebp]
	mov	ecx, DWORD PTR _next$[ebp]
	mov	DWORD PTR [eax+edx+260], ecx
$L2244:
; Line 471
	cmp	DWORD PTR ?FreeList@TCPObj@@0JA, -1	; TCPObj::FreeList
	je	SHORT $L2245
; Line 473
	mov	edx, DWORD PTR ?FreeList@TCPObj@@0JA	; TCPObj::FreeList
	imul	edx, 288				; 00000120H
	mov	eax, DWORD PTR _TCBPointer$[ebp]
	mov	ecx, DWORD PTR _TCBRecordNum$[ebp]
	mov	DWORD PTR [eax+edx+256], ecx
; Line 474
	mov	edx, DWORD PTR _TCBRecordNum$[ebp]
	imul	edx, 288				; 00000120H
	mov	eax, DWORD PTR _TCBPointer$[ebp]
	mov	ecx, DWORD PTR ?FreeList@TCPObj@@0JA	; TCPObj::FreeList
	mov	DWORD PTR [eax+edx+260], ecx
; Line 476
	jmp	SHORT $L2246
$L2245:
; Line 478
	mov	edx, DWORD PTR _TCBRecordNum$[ebp]
	imul	edx, 288				; 00000120H
	mov	eax, DWORD PTR _TCBPointer$[ebp]
	mov	DWORD PTR [eax+edx+260], -1
$L2246:
; Line 480
	mov	ecx, DWORD PTR _TCBRecordNum$[ebp]
	imul	ecx, 288				; 00000120H
	mov	edx, DWORD PTR _TCBPointer$[ebp]
	mov	DWORD PTR [edx+ecx+256], -1
; Line 481
	mov	eax, DWORD PTR _TCBRecordNum$[ebp]
	mov	DWORD PTR ?FreeList@TCPObj@@0JA, eax	; TCPObj::FreeList
; Line 483
	mov	ecx, DWORD PTR ?TCBCount@TCPObj@@0JA	; TCPObj::TCBCount
	sub	ecx, 1
	mov	DWORD PTR ?TCBCount@TCPObj@@0JA, ecx	; TCPObj::TCBCount
; Line 485
	xor	eax, eax
$L2219:
; Line 486
	mov	esp, ebp
	pop	ebp
	ret	4
?DeleteTCB@TCPObj@@QAEHH@Z ENDP				; TCPObj::DeleteTCB
_TEXT	ENDS
PUBLIC	?GetTCB@TCPObj@@AAEHHPAJ@Z			; TCPObj::GetTCB
_TEXT	SEGMENT
_TCBRecordNum$ = 8
_tcb$ = 12
_this$ = -296
_TCBPointer$ = -4
?GetTCB@TCPObj@@AAEHHPAJ@Z PROC NEAR			; TCPObj::GetTCB
; Line 491
	push	ebp
	mov	ebp, esp
	sub	esp, 296				; 00000128H
	mov	DWORD PTR _this$[ebp], ecx
; Line 493
	mov	eax, DWORD PTR _TCBRecordNum$[ebp]
	imul	eax, 288				; 00000120H
	mov	ecx, DWORD PTR ?TCBBase@TCPObj@@0KA	; TCPObj::TCBBase
	add	ecx, eax
	mov	DWORD PTR _TCBPointer$[ebp], ecx
; Line 495
	mov	edx, DWORD PTR _TCBPointer$[ebp]
	cmp	DWORD PTR [edx], 1
	jne	SHORT $L2256
; Line 497
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR _TCBPointer$[ebp]
	mov	DWORD PTR [eax], ecx
; Line 498
	xor	eax, eax
	jmp	SHORT $L2251
$L2256:
; Line 500
	or	eax, -1
$L2251:
; Line 501
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
; Line 511
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 512
	mov	eax, DWORD PTR _x$[ebp]
	cmp	eax, DWORD PTR _y$[ebp]
	jne	SHORT $L2263
; Line 514
	xor	eax, eax
	jmp	SHORT $L2262
$L2263:
; Line 516
	mov	ecx, DWORD PTR _x$[ebp]
	cmp	ecx, DWORD PTR _y$[ebp]
	jbe	SHORT $L2265
; Line 518
	mov	eax, DWORD PTR _x$[ebp]
	sub	eax, DWORD PTR _y$[ebp]
	jmp	SHORT $L2262
$L2265:
; Line 520
	mov	edx, DWORD PTR _x$[ebp]
	cmp	edx, DWORD PTR _y$[ebp]
	jae	SHORT $L2267
; Line 523
	or	eax, -1
	jmp	SHORT $L2262
$L2267:
; Line 525
	or	eax, -1
$L2262:
; Line 527
	mov	esp, ebp
	pop	ebp
	ret	8
?greaterEqualto@TCPObj@@AAEHKK@Z ENDP			; TCPObj::greaterEqualto
_TEXT	ENDS
PUBLIC	?storeTraceDword@TCPObj@@QAEHH@Z		; TCPObj::storeTraceDword
PUBLIC	?TCPHandler@TCPObj@@QAEHPADH00H0JH@Z		; TCPObj::TCPHandler
PUBLIC	?SearchTCB@TCPObj@@AAEHQAD0@Z			; TCPObj::SearchTCB
PUBLIC	?OtherHandler@TCPObj@@AAEHPADHHJH@Z		; TCPObj::OtherHandler
PUBLIC	?FormatHeader@TCPObj@@AAEXPAD0@Z		; TCPObj::FormatHeader
PUBLIC	?ListenHandler@TCPObj@@AAEHPADH000JH@Z		; TCPObj::ListenHandler
PUBLIC	?TCPChecksum@TCPObj@@AAEGPADJ00I@Z		; TCPObj::TCPChecksum
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
; Line 537
	push	ebp
	mov	ebp, esp
	sub	esp, 548				; 00000224H
	mov	DWORD PTR _this$[ebp], ecx
; Line 540
	mov	DWORD PTR _checksum$[ebp], 0
; Line 545
	lea	eax, DWORD PTR _Header$[ebp]
	mov	DWORD PTR _tcp$[ebp], eax
; Line 546
	mov	ecx, DWORD PTR _TCPPack$[ebp]
	push	ecx
	lea	edx, DWORD PTR _Header$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?FormatHeader@TCPObj@@AAEXPAD0@Z	; TCPObj::FormatHeader
; Line 548
	mov	DWORD PTR _retcode$[ebp], 0
; Line 550
	cmp	DWORD PTR _size$[ebp], 20		; 00000014H
	jge	SHORT $L2289
; Line 552
	mov	eax, -17				; ffffffefH
	jmp	$L2278
$L2289:
; Line 556
	mov	eax, DWORD PTR _TCPPack$[ebp]
	movsx	ecx, BYTE PTR [eax+2]
	test	ecx, ecx
	jne	SHORT $L2291
	mov	edx, DWORD PTR _TCPPack$[ebp]
	movsx	eax, BYTE PTR [edx+3]
	cmp	eax, 80					; 00000050H
	je	SHORT $L2290
$L2291:
; Line 558
	mov	eax, -18				; ffffffeeH
	jmp	$L2278
$L2290:
; Line 562
	mov	ecx, DWORD PTR _TCPPack$[ebp]
	mov	dl, BYTE PTR [ecx+16]
	mov	BYTE PTR _chsum1$[ebp], dl
; Line 563
	mov	eax, DWORD PTR _TCPPack$[ebp]
	mov	cl, BYTE PTR [eax+17]
	mov	BYTE PTR _chsum1$[ebp+1], cl
; Line 566
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
; Line 568
	mov	ecx, DWORD PTR _checksum$[ebp]
	sar	ecx, 8
	and	ecx, 255				; 000000ffH
	mov	BYTE PTR _chsum2$[ebp], cl
; Line 569
	mov	edx, DWORD PTR _checksum$[ebp]
	and	edx, 255				; 000000ffH
	mov	BYTE PTR _chsum2$[ebp+1], dl
; Line 572
	movsx	eax, BYTE PTR _chsum1$[ebp]
	movsx	ecx, BYTE PTR _chsum2$[ebp]
	cmp	eax, ecx
	jne	SHORT $L2295
	movsx	edx, BYTE PTR _chsum1$[ebp+1]
	movsx	eax, BYTE PTR _chsum2$[ebp+1]
	cmp	edx, eax
	je	SHORT $L2294
$L2295:
; Line 574
	mov	eax, -19				; ffffffedH
	jmp	$L2278
$L2294:
; Line 578
	mov	ecx, DWORD PTR _TCPPack$[ebp]
	mov	dl, BYTE PTR [ecx]
	mov	BYTE PTR _SrcPortNum$[ebp], dl
; Line 579
	mov	eax, DWORD PTR _TCPPack$[ebp]
	mov	cl, BYTE PTR [eax+1]
	mov	BYTE PTR _SrcPortNum$[ebp+1], cl
; Line 582
	lea	edx, DWORD PTR _SrcPortNum$[ebp]
	push	edx
	mov	eax, DWORD PTR _SourceIP$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?SearchTCB@TCPObj@@AAEHQAD0@Z		; TCPObj::SearchTCB
	mov	DWORD PTR _TCBRecordNum$[ebp], eax
; Line 584
	cmp	DWORD PTR _TCBRecordNum$[ebp], -1
	je	$L2299
; Line 586
	mov	ecx, DWORD PTR _TCBRecordNum$[ebp]
	imul	ecx, 288				; 00000120H
	mov	edx, DWORD PTR ?TCBBase@TCPObj@@0KA	; TCPObj::TCBBase
	add	edx, ecx
	mov	DWORD PTR _tcb$[ebp], edx
; Line 587
	mov	eax, DWORD PTR _tcp$[ebp]
	movsx	ecx, BYTE PTR [eax+13]
	and	ecx, 4
	cmp	ecx, 4
	jne	$L2299
; Line 599
	mov	edx, DWORD PTR ?NoOfResets@TCPObj@@2HA	; TCPObj::NoOfResets
	add	edx, 1
	mov	DWORD PTR ?NoOfResets@TCPObj@@2HA, edx	; TCPObj::NoOfResets
; Line 601
	xor	eax, eax
	test	eax, eax
	je	$L2300
; Line 603
	mov	ecx, DWORD PTR _TCBRecordNum$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHH@Z	; TCPObj::storeTraceDword
; Line 604
	mov	edx, DWORD PTR _tcb$[ebp]
	movsx	eax, BYTE PTR [edx+18]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHH@Z	; TCPObj::storeTraceDword
; Line 605
	mov	ecx, DWORD PTR _tcb$[ebp]
	movsx	edx, BYTE PTR [ecx+19]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHH@Z	; TCPObj::storeTraceDword
; Line 606
	mov	eax, DWORD PTR ?NoOfResets@TCPObj@@2HA	; TCPObj::NoOfResets
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHH@Z	; TCPObj::storeTraceDword
; Line 607
	push	0
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHH@Z	; TCPObj::storeTraceDword
; Line 608
	push	0
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHH@Z	; TCPObj::storeTraceDword
; Line 609
	push	0
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHH@Z	; TCPObj::storeTraceDword
; Line 610
	push	-1717986919				; 99999999H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHH@Z	; TCPObj::storeTraceDword
$L2300:
; Line 613
	mov	ecx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [ecx+64], 0
	jne	SHORT $L2301
; Line 614
	mov	edx, DWORD PTR _TCBRecordNum$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DeleteTCB@TCPObj@@QAEHH@Z		; TCPObj::DeleteTCB
$L2301:
; Line 615
	mov	DWORD PTR _TCBRecordNum$[ebp], -1
; Line 616
	mov	eax, -45				; ffffffd3H
	jmp	SHORT $L2278
$L2299:
; Line 624
	cmp	DWORD PTR _TCBRecordNum$[ebp], -1
	jne	SHORT $L2302
; Line 629
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
; Line 630
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	SHORT $L2278
$L2302:
; Line 637
	lea	ecx, DWORD PTR _tcb$[ebp]
	push	ecx
	mov	edx, DWORD PTR _TCBRecordNum$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?GetTCB@TCPObj@@AAEHHPAJ@Z		; TCPObj::GetTCB
	test	eax, eax
	je	SHORT $L2305
; Line 639
	mov	eax, -20				; ffffffecH
	jmp	SHORT $L2278
$L2305:
; Line 642
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
; Line 643
	mov	eax, DWORD PTR _retcode$[ebp]
$L2278:
; Line 647
	mov	esp, ebp
	pop	ebp
	ret	32					; 00000020H
?TCPHandler@TCPObj@@QAEHPADH00H0JH@Z ENDP		; TCPObj::TCPHandler
_TEXT	ENDS
PUBLIC	?charToseqnum@TCPObj@@AAEKPAD@Z			; TCPObj::charToseqnum
PUBLIC	?charToWindow@TCPObj@@AAEGPAD@Z			; TCPObj::charToWindow
PUBLIC	?SendMisc@TCPObj@@AAEHPAD0D0HH@Z		; TCPObj::SendMisc
PUBLIC	?SendMisc@TCPObj@@AAEHPAD0KD0HH@Z		; TCPObj::SendMisc
EXTRN	?AOAPrintText@AOAProtected@@QAEXPADH@Z:NEAR	; AOAProtected::AOAPrintText
EXTRN	?getRandomAoA@random@@QAEHH@Z:NEAR		; random::getRandomAoA
EXTRN	??0EtherObj@@QAE@XZ:NEAR			; EtherObj::EtherObj
EXTRN	??0AOATask@@QAE@XZ:NEAR				; AOATask::AOATask
EXTRN	??0apptask@@QAE@XZ:NEAR				; apptask::apptask
_DATA	SEGMENT
$SG2333	DB	'TCBObj:TCB is full', 00H
_DATA	ENDS
_TEXT	SEGMENT
_TCPPack$ = 8
_SourceIP$ = 16
_macaddr$ = 24
_timer$ = 28
_currenttask$ = 32
_this$ = -796
_tsk$ = -436
_task$ = -484
_EO$ = -24
_SrcPortNum$ = -492
_status$ = -488
_temptcb$ = -780
_retcode$ = -8
_TCBRecordNum$ = -16
_tempseq$ = -4
_r$2327 = -788
_tcb$2334 = -792
?ListenHandler@TCPObj@@AAEHPADH000JH@Z PROC NEAR	; TCPObj::ListenHandler
; Line 654
	push	ebp
	mov	ebp, esp
	sub	esp, 796				; 0000031cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 656
	lea	ecx, DWORD PTR _tsk$[ebp]
	call	??0apptask@@QAE@XZ			; apptask::apptask
; Line 657
	lea	ecx, DWORD PTR _task$[ebp]
	call	??0AOATask@@QAE@XZ			; AOATask::AOATask
; Line 658
	lea	ecx, DWORD PTR _EO$[ebp]
	call	??0EtherObj@@QAE@XZ			; EtherObj::EtherObj
; Line 664
	mov	DWORD PTR _retcode$[ebp], 0
; Line 665
	mov	DWORD PTR _TCBRecordNum$[ebp], 0
; Line 666
	mov	DWORD PTR _tempseq$[ebp], 0
; Line 670
	mov	eax, DWORD PTR _TCPPack$[ebp]
	movsx	ecx, BYTE PTR [eax+13]
	and	ecx, 2
	cmp	ecx, 2
	jne	$L2330
; Line 672
	mov	edx, DWORD PTR ?SynCount@TCPObj@@2KA	; TCPObj::SynCount
	add	edx, 1
	mov	DWORD PTR ?SynCount@TCPObj@@2KA, edx	; TCPObj::SynCount
; Line 674
	mov	eax, DWORD PTR _TCPPack$[ebp]
	mov	cl, BYTE PTR [eax]
	mov	BYTE PTR _SrcPortNum$[ebp], cl
; Line 675
	mov	edx, DWORD PTR _TCPPack$[ebp]
	mov	al, BYTE PTR [edx+1]
	mov	BYTE PTR _SrcPortNum$[ebp+1], al
; Line 678
	mov	DWORD PTR _temptcb$[ebp], 1
; Line 681
	mov	ecx, DWORD PTR _TCPPack$[ebp]
	mov	dl, BYTE PTR [ecx]
	mov	BYTE PTR _temptcb$[ebp+18], dl
; Line 682
	mov	eax, DWORD PTR _TCPPack$[ebp]
	mov	cl, BYTE PTR [eax+1]
	mov	BYTE PTR _temptcb$[ebp+19], cl
; Line 683
	mov	edx, DWORD PTR _SourceIP$[ebp]
	mov	al, BYTE PTR [edx]
	mov	BYTE PTR _temptcb$[ebp+20], al
; Line 684
	mov	ecx, DWORD PTR _SourceIP$[ebp]
	mov	dl, BYTE PTR [ecx+1]
	mov	BYTE PTR _temptcb$[ebp+21], dl
; Line 685
	mov	eax, DWORD PTR _SourceIP$[ebp]
	mov	cl, BYTE PTR [eax+2]
	mov	BYTE PTR _temptcb$[ebp+22], cl
; Line 686
	mov	edx, DWORD PTR _SourceIP$[ebp]
	mov	al, BYTE PTR [edx+3]
	mov	BYTE PTR _temptcb$[ebp+23], al
; Line 689
	mov	ecx, DWORD PTR _macaddr$[ebp]
	mov	dl, BYTE PTR [ecx]
	mov	BYTE PTR _temptcb$[ebp+12], dl
; Line 690
	mov	eax, DWORD PTR _macaddr$[ebp]
	mov	cl, BYTE PTR [eax+1]
	mov	BYTE PTR _temptcb$[ebp+13], cl
; Line 691
	mov	edx, DWORD PTR _macaddr$[ebp]
	mov	al, BYTE PTR [edx+2]
	mov	BYTE PTR _temptcb$[ebp+14], al
; Line 692
	mov	ecx, DWORD PTR _macaddr$[ebp]
	mov	dl, BYTE PTR [ecx+3]
	mov	BYTE PTR _temptcb$[ebp+15], dl
; Line 693
	mov	eax, DWORD PTR _macaddr$[ebp]
	mov	cl, BYTE PTR [eax+4]
	mov	BYTE PTR _temptcb$[ebp+16], cl
; Line 694
	mov	edx, DWORD PTR _macaddr$[ebp]
	mov	al, BYTE PTR [edx+5]
	mov	BYTE PTR _temptcb$[ebp+17], al
; Line 696
	mov	DWORD PTR _temptcb$[ebp+24], 3
; Line 697
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	mov	DWORD PTR _temptcb$[ebp+264], eax
; Line 698
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	push	eax
	lea	ecx, DWORD PTR _r$2327[ebp]
	call	??0random@@QAE@H@Z			; random::random
; Line 699
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	push	eax
	lea	ecx, DWORD PTR _r$2327[ebp]
	call	?getRandomAoA@random@@QAEHH@Z		; random::getRandomAoA
	mov	DWORD PTR _temptcb$[ebp+136], eax
; Line 700
	mov	ecx, DWORD PTR _temptcb$[ebp+136]
	mov	DWORD PTR _temptcb$[ebp+96], ecx
; Line 701
	mov	edx, DWORD PTR _temptcb$[ebp+96]
	add	edx, 1
	mov	DWORD PTR _temptcb$[ebp+100], edx
; Line 703
	mov	eax, DWORD PTR _TCPPack$[ebp]
	add	eax, 14					; 0000000eH
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?charToWindow@TCPObj@@AAEGPAD@Z		; TCPObj::charToWindow
	and	eax, 65535				; 0000ffffH
	mov	DWORD PTR _temptcb$[ebp+104], eax
; Line 704
	mov	DWORD PTR _temptcb$[ebp+148], 0
; Line 707
	mov	DWORD PTR _temptcb$[ebp+128], 0
; Line 708
	mov	DWORD PTR _temptcb$[ebp+132], -1
; Line 710
	mov	ecx, DWORD PTR _TCPPack$[ebp]
	add	ecx, 4
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?charToseqnum@TCPObj@@AAEKPAD@Z		; TCPObj::charToseqnum
	mov	DWORD PTR _temptcb$[ebp+144], eax
; Line 712
	mov	edx, DWORD PTR _temptcb$[ebp+144]
	add	edx, 1
	mov	DWORD PTR _temptcb$[ebp+112], edx
; Line 713
	mov	DWORD PTR _temptcb$[ebp+140], 1500	; 000005dcH
; Line 714
	mov	DWORD PTR _temptcb$[ebp+28], 0
; Line 715
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	mov	DWORD PTR _temptcb$[ebp+108], eax
; Line 716
	mov	DWORD PTR _temptcb$[ebp+80], 0
; Line 717
	mov	DWORD PTR _temptcb$[ebp+156], 0
; Line 718
	mov	DWORD PTR _temptcb$[ebp+124], 0
; Line 719
	mov	DWORD PTR _temptcb$[ebp+120], 0
; Line 720
	mov	DWORD PTR _temptcb$[ebp+84], 0
; Line 721
	mov	DWORD PTR _temptcb$[ebp+88], 0
; Line 722
	mov	DWORD PTR _temptcb$[ebp+160], 0
; Line 723
	mov	DWORD PTR _temptcb$[ebp+164], 0
; Line 724
	mov	DWORD PTR _temptcb$[ebp+168], 0
; Line 725
	mov	DWORD PTR _temptcb$[ebp+172], 0
; Line 726
	mov	DWORD PTR _temptcb$[ebp+176], 0
; Line 727
	mov	DWORD PTR _temptcb$[ebp+180], 0
; Line 728
	mov	DWORD PTR _temptcb$[ebp+152], 0
; Line 729
	mov	DWORD PTR _temptcb$[ebp+248], 0
; Line 730
	mov	DWORD PTR _temptcb$[ebp+80], 0
; Line 731
	mov	DWORD PTR _temptcb$[ebp+252], 0
; Line 732
	mov	DWORD PTR _temptcb$[ebp+4], -1
; Line 733
	mov	DWORD PTR _temptcb$[ebp+8], -1
; Line 734
	mov	DWORD PTR _temptcb$[ebp+188], 0
; Line 735
	mov	DWORD PTR _temptcb$[ebp+192], 0
; Line 736
	mov	DWORD PTR _temptcb$[ebp+196], 0
; Line 738
	mov	DWORD PTR _temptcb$[ebp+200], 0
; Line 739
	mov	DWORD PTR _temptcb$[ebp+204], 0
; Line 740
	mov	DWORD PTR _temptcb$[ebp+208], 0
; Line 741
	mov	DWORD PTR _temptcb$[ebp+212], 0
; Line 742
	mov	DWORD PTR _temptcb$[ebp+216], 0
; Line 743
	mov	DWORD PTR _temptcb$[ebp+220], 0
; Line 744
	mov	DWORD PTR _temptcb$[ebp+224], 0
; Line 746
	mov	DWORD PTR _temptcb$[ebp+284], 0
; Line 747
	mov	DWORD PTR _temptcb$[ebp+276], 0
; Line 748
	mov	DWORD PTR _temptcb$[ebp+272], 0
; Line 749
	mov	DWORD PTR _temptcb$[ebp+228], 0
; Line 750
	mov	DWORD PTR _temptcb$[ebp+232], 0
; Line 751
	mov	DWORD PTR _temptcb$[ebp+236], 0
; Line 752
	mov	DWORD PTR _temptcb$[ebp+76], 0
; Line 753
	mov	DWORD PTR _temptcb$[ebp+68], 0
; Line 754
	mov	DWORD PTR _temptcb$[ebp+72], 0
; Line 755
	mov	DWORD PTR _temptcb$[ebp+64], 0
; Line 756
	mov	DWORD PTR _temptcb$[ebp+92], 0
; Line 757
	mov	DWORD PTR _temptcb$[ebp+92], 0
; Line 758
	mov	DWORD PTR _temptcb$[ebp+32], 0
; Line 759
	mov	DWORD PTR _temptcb$[ebp+36], 0
; Line 760
	mov	DWORD PTR _temptcb$[ebp+40], 0
; Line 761
	mov	DWORD PTR _temptcb$[ebp+44], 0
; Line 762
	mov	DWORD PTR _temptcb$[ebp+48], 0
; Line 763
	mov	DWORD PTR _temptcb$[ebp+52], 0
; Line 764
	mov	DWORD PTR _temptcb$[ebp+56], 0
; Line 765
	mov	DWORD PTR _temptcb$[ebp+60], 0
; Line 767
	lea	eax, DWORD PTR _temptcb$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?InsertTCB@TCPObj@@AAEHPAUTCBRecord@1@@Z ; TCPObj::InsertTCB
	mov	DWORD PTR _status$[ebp], eax
; Line 770
	cmp	DWORD PTR _status$[ebp], -1
	jne	SHORT $L2329
; Line 777
	mov	ecx, DWORD PTR _TCPPack$[ebp]
	add	ecx, 8
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?charToseqnum@TCPObj@@AAEKPAD@Z		; TCPObj::charToseqnum
	mov	DWORD PTR _tempseq$[ebp], eax
; Line 778
	mov	edx, DWORD PTR _currenttask$[ebp]
	push	edx
	push	6
	mov	eax, DWORD PTR _macaddr$[ebp]
	push	eax
	push	4
	mov	ecx, DWORD PTR _tempseq$[ebp]
	push	ecx
	mov	edx, DWORD PTR _TCPPack$[ebp]
	push	edx
	mov	eax, DWORD PTR _SourceIP$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?SendMisc@TCPObj@@AAEHPAD0KD0HH@Z	; TCPObj::SendMisc
	mov	DWORD PTR _retcode$[ebp], eax
; Line 780
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L2315
$L2329:
; Line 791
	mov	ecx, DWORD PTR _currenttask$[ebp]
	push	ecx
	push	1
	mov	edx, DWORD PTR _macaddr$[ebp]
	push	edx
	push	18					; 00000012H
	mov	eax, DWORD PTR _TCPPack$[ebp]
	push	eax
	mov	ecx, DWORD PTR _SourceIP$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?SendMisc@TCPObj@@AAEHPAD0D0HH@Z	; TCPObj::SendMisc
	mov	DWORD PTR _retcode$[ebp], eax
; Line 797
	mov	edx, DWORD PTR ?TCBCount@TCPObj@@0JA	; TCPObj::TCBCount
	add	edx, 1
	mov	DWORD PTR ?TCBCount@TCPObj@@0JA, edx	; TCPObj::TCBCount
; Line 798
	mov	eax, DWORD PTR ?SynAckCount@TCPObj@@2KA	; TCPObj::SynAckCount
	add	eax, 1
	mov	DWORD PTR ?SynAckCount@TCPObj@@2KA, eax	; TCPObj::SynAckCount
; Line 799
	mov	ecx, DWORD PTR ?TCBCount@TCPObj@@0JA	; TCPObj::TCBCount
	cmp	ecx, DWORD PTR ?MaxNoOfTCBsUsed@TCPObj@@2KA ; TCPObj::MaxNoOfTCBsUsed
	jbe	SHORT $L2331
; Line 800
	mov	edx, DWORD PTR ?TCBCount@TCPObj@@0JA	; TCPObj::TCBCount
	mov	DWORD PTR ?MaxNoOfTCBsUsed@TCPObj@@2KA, edx ; TCPObj::MaxNoOfTCBsUsed
$L2331:
; Line 802
	mov	eax, DWORD PTR ?TCBCount@TCPObj@@0JA	; TCPObj::TCBCount
	cmp	eax, DWORD PTR ?TCBRecords@TCPObj@@0JA	; TCPObj::TCBRecords
	jl	SHORT $L2332
; Line 804
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG2333
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 805
	push	3760					; 00000eb0H
	mov	ecx, DWORD PTR ?TCBCount@TCPObj@@0JA	; TCPObj::TCBCount
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
$L2332:
; Line 807
	lea	edx, DWORD PTR _SrcPortNum$[ebp]
	push	edx
	mov	eax, DWORD PTR _SourceIP$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?SearchTCB@TCPObj@@AAEHQAD0@Z		; TCPObj::SearchTCB
	mov	DWORD PTR _TCBRecordNum$[ebp], eax
; Line 810
	mov	ecx, DWORD PTR _TCBRecordNum$[ebp]
	imul	ecx, 288				; 00000120H
	mov	edx, DWORD PTR ?TCBBase@TCPObj@@0KA	; TCPObj::TCBBase
	add	edx, ecx
	mov	DWORD PTR _tcb$2334[ebp], edx
; Line 813
	mov	eax, DWORD PTR _tcb$2334[ebp]
	mov	ecx, DWORD PTR [eax+100]
	add	ecx, 1
	mov	edx, DWORD PTR _tcb$2334[ebp]
	mov	DWORD PTR [edx+100], ecx
; Line 814
	mov	eax, DWORD PTR _tcb$2334[ebp]
	mov	ecx, DWORD PTR _timer$[ebp]
	mov	DWORD PTR [eax+32], ecx
; Line 815
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	mov	edx, DWORD PTR _tcb$2334[ebp]
	mov	DWORD PTR [edx+36], eax
; Line 816
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	SHORT $L2315
$L2330:
; Line 822
	mov	eax, DWORD PTR _TCPPack$[ebp]
	movsx	ecx, BYTE PTR [eax+13]
	and	ecx, 17					; 00000011H
	cmp	ecx, 17					; 00000011H
	jne	SHORT $L2337
; Line 824
	mov	edx, DWORD PTR _TCPPack$[ebp]
	add	edx, 8
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?charToseqnum@TCPObj@@AAEKPAD@Z		; TCPObj::charToseqnum
	mov	DWORD PTR _tempseq$[ebp], eax
; Line 825
	mov	eax, DWORD PTR _currenttask$[ebp]
	push	eax
	push	1
	mov	ecx, DWORD PTR _macaddr$[ebp]
	push	ecx
	push	16					; 00000010H
	mov	edx, DWORD PTR _tempseq$[ebp]
	push	edx
	mov	eax, DWORD PTR _TCPPack$[ebp]
	push	eax
	mov	ecx, DWORD PTR _SourceIP$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?SendMisc@TCPObj@@AAEHPAD0KD0HH@Z	; TCPObj::SendMisc
	mov	DWORD PTR _retcode$[ebp], eax
$L2337:
; Line 846
	mov	ecx, DWORD PTR _TCPPack$[ebp]
	movsx	edx, BYTE PTR [ecx+13]
	and	edx, 1
	cmp	edx, 1
	jne	SHORT $L2339
; Line 857
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
$L2339:
; Line 862
	xor	eax, eax
$L2315:
; Line 863
	mov	esp, ebp
	pop	ebp
	ret	28					; 0000001cH
?ListenHandler@TCPObj@@AAEHPADH000JH@Z ENDP		; TCPObj::ListenHandler
_TEXT	ENDS
PUBLIC	?mod32cmp@TCPObj@@AAEKKK@Z			; TCPObj::mod32cmp
PUBLIC	??0WCirList@@QAE@XZ				; WCirList::WCirList
EXTRN	?insertHttpTask@apptask@@QAEHHJ@Z:NEAR		; apptask::insertHttpTask
EXTRN	?insert@WTTrace@@QAEHHG@Z:NEAR			; WTTrace::insert
EXTRN	??0AOAProtected@@QAE@XZ:NEAR			; AOAProtected::AOAProtected
EXTRN	?AOAMaskRunRegister@AOAProtected@@QAEHHH@Z:NEAR	; AOAProtected::AOAMaskRunRegister
EXTRN	?MinTaskId@apptask@@2JA:DWORD			; apptask::MinTaskId
_DATA	SEGMENT
	ORG $+1
$SG2482	DB	'CC', 00H
	ORG $+1
$SG2489	DB	'DD', 00H
_DATA	ENDS
_TEXT	SEGMENT
_TCPPack$ = 8
_size$ = 12
_TCBRecordNumber$ = 16
_timerEth$ = 20
_currenttask$ = 24
_this$ = -1068
_task$ = -1032
_tsk$ = -964
_EO$ = -552
_cir$ = -1060
_io$ = -976
_retcode$ = -16
_SrcPortNum$ = -1052
_Acceptable_Flag$ = -32
_currtime$ = -1044
_Header$ = -544
_len$ = -1040
_i$ = -968
_tcp$ = -1036
_tcb$ = -1048
_i$2394 = -1064
?OtherHandler@TCPObj@@AAEHPADHHJH@Z PROC NEAR		; TCPObj::OtherHandler
; Line 869
	push	ebp
	mov	ebp, esp
	sub	esp, 1068				; 0000042cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 870
	lea	ecx, DWORD PTR _task$[ebp]
	call	??0AOATask@@QAE@XZ			; AOATask::AOATask
; Line 871
	lea	ecx, DWORD PTR _tsk$[ebp]
	call	??0apptask@@QAE@XZ			; apptask::apptask
; Line 872
	lea	ecx, DWORD PTR _EO$[ebp]
	call	??0EtherObj@@QAE@XZ			; EtherObj::EtherObj
; Line 873
	lea	ecx, DWORD PTR _cir$[ebp]
	call	??0WCirList@@QAE@XZ			; WCirList::WCirList
; Line 874
	lea	ecx, DWORD PTR _io$[ebp]
	call	??0AOAProtected@@QAE@XZ			; AOAProtected::AOAProtected
; Line 876
	mov	DWORD PTR _retcode$[ebp], 0
; Line 881
	mov	DWORD PTR _Acceptable_Flag$[ebp], 1
; Line 882
	mov	DWORD PTR _currtime$[ebp], 0
; Line 884
	mov	DWORD PTR _len$[ebp], 0
; Line 885
	mov	DWORD PTR _i$[ebp], 0
; Line 889
	lea	eax, DWORD PTR _Header$[ebp]
	mov	DWORD PTR _tcp$[ebp], eax
; Line 890
	mov	ecx, DWORD PTR _TCPPack$[ebp]
	push	ecx
	lea	edx, DWORD PTR _Header$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?FormatHeader@TCPObj@@AAEXPAD0@Z	; TCPObj::FormatHeader
; Line 893
	mov	eax, DWORD PTR _TCBRecordNumber$[ebp]
	imul	eax, 288				; 00000120H
	mov	ecx, DWORD PTR ?TCBBase@TCPObj@@0KA	; TCPObj::TCBBase
	add	ecx, eax
	mov	DWORD PTR _tcb$[ebp], ecx
; Line 894
	mov	BYTE PTR _SrcPortNum$[ebp], 0
; Line 895
	mov	BYTE PTR _SrcPortNum$[ebp+1], 80	; 00000050H
; Line 897
	mov	edx, DWORD PTR _tcp$[ebp]
	movsx	eax, BYTE PTR [edx+12]
	shl	eax, 2
	mov	ecx, DWORD PTR _size$[ebp]
	sub	ecx, eax
	mov	edx, DWORD PTR _tcb$[ebp]
	cmp	ecx, DWORD PTR [edx+140]
	jbe	SHORT $L2368
; Line 899
	mov	DWORD PTR _Acceptable_Flag$[ebp], 0
$L2368:
; Line 903
	cmp	DWORD PTR _Acceptable_Flag$[ebp], 0
	jne	$L2369
; Line 906
	mov	eax, DWORD PTR _tcp$[ebp]
	movsx	ecx, BYTE PTR [eax+13]
	and	ecx, 4
	cmp	ecx, 4
	jne	SHORT $L2370
; Line 911
	mov	edx, DWORD PTR ?NoOfResets@TCPObj@@2HA	; TCPObj::NoOfResets
	add	edx, 1
	mov	DWORD PTR ?NoOfResets@TCPObj@@2HA, edx	; TCPObj::NoOfResets
; Line 912
	mov	eax, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [eax+64], 1
	jne	SHORT $L2371
; Line 914
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+76], 1
; Line 916
	jmp	SHORT $L2373
$L2371:
; Line 918
	mov	edx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [edx+64], 0
	jne	SHORT $L2373
; Line 919
	mov	eax, DWORD PTR _TCBRecordNumber$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DeleteTCB@TCPObj@@QAEHH@Z		; TCPObj::DeleteTCB
$L2373:
; Line 921
	xor	eax, eax
	jmp	$L2347
$L2370:
; Line 932
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
; Line 935
	mov	edx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [edx+64], 1
	jne	SHORT $L2375
; Line 937
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+76], 1
; Line 939
	jmp	SHORT $L2376
$L2375:
; Line 941
	mov	ecx, DWORD PTR _TCBRecordNumber$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DeleteTCB@TCPObj@@QAEHH@Z		; TCPObj::DeleteTCB
$L2376:
; Line 944
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L2347
$L2369:
; Line 951
	mov	edx, DWORD PTR _tcp$[ebp]
	movsx	eax, BYTE PTR [edx+13]
	and	eax, 4
	cmp	eax, 4
	jne	SHORT $L2378
; Line 955
	mov	ecx, DWORD PTR ?NoOfResets@TCPObj@@2HA	; TCPObj::NoOfResets
	add	ecx, 1
	mov	DWORD PTR ?NoOfResets@TCPObj@@2HA, ecx	; TCPObj::NoOfResets
; Line 970
	mov	eax, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [eax+64], 1
	jne	SHORT $L2380
; Line 972
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+76], 1
; Line 995
	jmp	SHORT $L2383
$L2380:
; Line 997
	mov	eax, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [eax+64], 0
	jne	SHORT $L2383
; Line 998
	mov	ecx, DWORD PTR _TCBRecordNumber$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DeleteTCB@TCPObj@@QAEHH@Z		; TCPObj::DeleteTCB
$L2383:
; Line 1000
	xor	eax, eax
	jmp	$L2347
$L2378:
; Line 1004
	mov	edx, DWORD PTR _tcp$[ebp]
	movsx	eax, BYTE PTR [edx+13]
	and	eax, 2
	cmp	eax, 2
	jne	SHORT $L2384
; Line 1013
	mov	ecx, DWORD PTR _currenttask$[ebp]
	push	ecx
	push	1
	mov	edx, DWORD PTR _tcb$[ebp]
	add	edx, 12					; 0000000cH
	push	edx
	push	18					; 00000012H
	mov	eax, DWORD PTR _tcb$[ebp]
	add	eax, 18					; 00000012H
	push	eax
	mov	ecx, DWORD PTR _tcb$[ebp]
	add	ecx, 20					; 00000014H
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?SendMisc@TCPObj@@AAEHPAD0D0HH@Z	; TCPObj::SendMisc
	mov	DWORD PTR _retcode$[ebp], eax
$L2384:
; Line 1018
	mov	edx, DWORD PTR _tcp$[ebp]
	movsx	eax, BYTE PTR [edx+13]
	and	eax, 16					; 00000010H
	cmp	eax, 16					; 00000010H
	jne	$L2465
; Line 1020
	mov	ecx, DWORD PTR _tcp$[ebp]
	xor	edx, edx
	mov	dx, WORD PTR [ecx+14]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+104], edx
; Line 1022
	mov	ecx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [ecx+24], 3
	jne	$L2399
; Line 1029
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+96]
	push	eax
	mov	ecx, DWORD PTR _tcp$[ebp]
	mov	edx, DWORD PTR [ecx+8]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?greaterEqualto@TCPObj@@AAEHKK@Z	; TCPObj::greaterEqualto
	test	eax, eax
	jl	$L2387
	mov	eax, DWORD PTR _tcp$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	push	ecx
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+100]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?greaterEqualto@TCPObj@@AAEHKK@Z	; TCPObj::greaterEqualto
	test	eax, eax
	jl	$L2387
; Line 1035
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+24], 5
; Line 1036
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	mov	edx, DWORD PTR _tcb$[ebp]
	sub	eax, DWORD PTR [edx+108]
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+28], eax
; Line 1037
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR _timerEth$[ebp]
	mov	DWORD PTR [edx+40], eax
; Line 1038
	mov	ecx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [ecx+28], 0
	jne	SHORT $L2388
; Line 1039
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+28], 1
$L2388:
; Line 1042
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+28]
	imul	ecx, 85					; 00000055H
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+28], ecx
; Line 1043
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+28]
	cmp	ecx, DWORD PTR ?min@@3KA		; min
	jae	SHORT $L2389
; Line 1045
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+28]
	mov	DWORD PTR ?min@@3KA, eax		; min
$L2389:
; Line 1049
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+28]
	cmp	edx, DWORD PTR ?max@@3KA		; max
	jbe	SHORT $L2390
; Line 1051
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+28]
	mov	DWORD PTR ?max@@3KA, ecx		; max
$L2390:
; Line 1055
	mov	edx, DWORD PTR _tcp$[ebp]
	movsx	eax, BYTE PTR [edx+12]
	shl	eax, 2
	mov	ecx, DWORD PTR _size$[ebp]
	sub	ecx, eax
	mov	DWORD PTR _len$[ebp], ecx
; Line 1056
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR _len$[ebp]
	mov	DWORD PTR [edx+180], eax
; Line 1057
	cmp	DWORD PTR _len$[ebp], 0
	je	$L2392
; Line 1059
	mov	ecx, DWORD PTR _TCPPack$[ebp]
	movsx	edx, BYTE PTR [ecx+20]
	cmp	edx, 71					; 00000047H
	jne	$L2392
	mov	eax, DWORD PTR _TCPPack$[ebp]
	movsx	ecx, BYTE PTR [eax+21]
	cmp	ecx, 69					; 00000045H
	jne	$L2392
	mov	edx, DWORD PTR _TCPPack$[ebp]
	movsx	eax, BYTE PTR [edx+22]
	cmp	eax, 84					; 00000054H
	jne	$L2392
; Line 1062
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+112]
	add	edx, DWORD PTR _len$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+112], edx
; Line 1063
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+140]
	sub	edx, DWORD PTR _len$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+140], edx
; Line 1064
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR _timerEth$[ebp]
	mov	DWORD PTR [ecx+44], edx
; Line 1065
	mov	eax, DWORD PTR ?GetCount@TCPObj@@2KA	; TCPObj::GetCount
	add	eax, 1
	mov	DWORD PTR ?GetCount@TCPObj@@2KA, eax	; TCPObj::GetCount
; Line 1070
	mov	ecx, DWORD PTR _TCBRecordNumber$[ebp]
	imul	ecx, 1500				; 000005dcH
	add	ecx, 68515904				; 04157840H
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+248], ecx
; Line 1077
	mov	DWORD PTR _i$2394[ebp], 0
	jmp	SHORT $L2395
$L2396:
	mov	eax, DWORD PTR _i$2394[ebp]
	add	eax, 1
	mov	DWORD PTR _i$2394[ebp], eax
$L2395:
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR _i$2394[ebp]
	cmp	edx, DWORD PTR [ecx+180]
	jae	SHORT $L2397
; Line 1079
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+248]
	mov	edx, DWORD PTR _TCPPack$[ebp]
	add	edx, DWORD PTR _i$2394[ebp]
	mov	eax, DWORD PTR _i$2394[ebp]
	mov	dl, BYTE PTR [edx+20]
	mov	BYTE PTR [ecx+eax], dl
; Line 1080
	jmp	SHORT $L2396
$L2397:
; Line 1086
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
; Line 1087
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+48], eax
; Line 1088
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+84], 1
; Line 1089
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L2398
; Line 1093
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L2347
$L2398:
; Line 1099
	mov	eax, DWORD PTR ?HttpCount@TCPObj@@2KA	; TCPObj::HttpCount
	add	eax, 1
	mov	DWORD PTR ?HttpCount@TCPObj@@2KA, eax	; TCPObj::HttpCount
; Line 1100
	mov	ecx, DWORD PTR ?HttpRequests@TCPObj@@2KA ; TCPObj::HttpRequests
	add	ecx, 1
	mov	DWORD PTR ?HttpRequests@TCPObj@@2KA, ecx ; TCPObj::HttpRequests
; Line 1101
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+64], 1
; Line 1102
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	push	eax
	mov	eax, DWORD PTR _TCBRecordNumber$[ebp]
	push	eax
	lea	ecx, DWORD PTR _tsk$[ebp]
	call	?insertHttpTask@apptask@@QAEHHJ@Z	; apptask::insertHttpTask
; Line 1104
	push	1
	push	7
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAMaskRunRegister@AOAProtected@@QAEHHH@Z ; AOAProtected::AOAMaskRunRegister
$L2392:
; Line 1108
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR _TCBRecordNumber$[ebp]
	mov	DWORD PTR [ecx+8], edx
; Line 1116
	xor	eax, eax
	jmp	$L2347
$L2387:
; Line 1129
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
; Line 1134
	mov	ecx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [ecx+64], 1
	jne	SHORT $L2400
; Line 1136
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+76], 1
; Line 1139
	jmp	SHORT $L2401
$L2400:
; Line 1141
	mov	eax, DWORD PTR _TCBRecordNumber$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DeleteTCB@TCPObj@@QAEHH@Z		; TCPObj::DeleteTCB
$L2401:
; Line 1143
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L2347
$L2399:
; Line 1148
	mov	ecx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [ecx+24], 5
	jne	$L2438
; Line 1157
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+96]
	push	eax
	mov	ecx, DWORD PTR _tcp$[ebp]
	mov	edx, DWORD PTR [ecx+8]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?greaterEqualto@TCPObj@@AAEHKK@Z	; TCPObj::greaterEqualto
	test	eax, eax
	jl	$L2403
	mov	eax, DWORD PTR _tcp$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	push	ecx
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+100]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?greaterEqualto@TCPObj@@AAEHKK@Z	; TCPObj::greaterEqualto
	test	eax, eax
	jl	$L2403
; Line 1162
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+128]
	push	edx
	mov	eax, DWORD PTR _tcp$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?greaterEqualto@TCPObj@@AAEHKK@Z	; TCPObj::greaterEqualto
	test	eax, eax
	jg	SHORT $L2405
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR _tcp$[ebp]
	mov	ecx, DWORD PTR [edx+128]
	cmp	ecx, DWORD PTR [eax+4]
	jne	SHORT $L2404
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+132]
	push	eax
	mov	ecx, DWORD PTR _tcp$[ebp]
	mov	edx, DWORD PTR [ecx+8]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?greaterEqualto@TCPObj@@AAEHKK@Z	; TCPObj::greaterEqualto
	test	eax, eax
	jl	SHORT $L2404
$L2405:
; Line 1164
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR _tcp$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR [eax+128], edx
; Line 1165
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR _tcp$[ebp]
	mov	edx, DWORD PTR [ecx+8]
	mov	DWORD PTR [eax+132], edx
$L2404:
; Line 1168
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR _tcp$[ebp]
	mov	edx, DWORD PTR [ecx+8]
	mov	DWORD PTR [eax+96], edx
; Line 1174
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [eax+100]
	cmp	edx, DWORD PTR [ecx+96]
	jne	SHORT $L2407
; Line 1176
	mov	eax, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [eax+68], 1
	jne	SHORT $L2407
; Line 1178
	mov	ecx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [ecx+72], 1
	jne	SHORT $L2408
; Line 1179
	mov	eax, -1717986919			; 99999999H
	jmp	$L2347
$L2408:
; Line 1180
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+72], 1
$L2407:
; Line 1186
	mov	eax, DWORD PTR _tcp$[ebp]
	movsx	ecx, BYTE PTR [eax+13]
	and	ecx, 1
	cmp	ecx, 1
	jne	$L2409
; Line 1210
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+24], 16			; 00000010H
; Line 1211
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
; Line 1213
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L2411
; Line 1214
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L2347
$L2411:
; Line 1216
	mov	edx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [edx+64], 1
	jne	SHORT $L2412
; Line 1218
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+76], 1
; Line 1221
	jmp	SHORT $L2413
$L2412:
; Line 1223
	mov	ecx, DWORD PTR _TCBRecordNumber$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DeleteTCB@TCPObj@@QAEHH@Z		; TCPObj::DeleteTCB
$L2413:
; Line 1225
	xor	eax, eax
	jmp	$L2347
$L2409:
; Line 1230
	mov	edx, DWORD PTR _tcp$[ebp]
	movsx	eax, BYTE PTR [edx+12]
	shl	eax, 2
	mov	ecx, DWORD PTR _size$[ebp]
	sub	ecx, eax
	mov	DWORD PTR _len$[ebp], ecx
; Line 1239
	cmp	DWORD PTR _len$[ebp], 0
	je	$L2434
; Line 1241
	mov	edx, DWORD PTR _TCPPack$[ebp]
	movsx	eax, BYTE PTR [edx+20]
	cmp	eax, 71					; 00000047H
	jne	$L2415
	mov	ecx, DWORD PTR _TCPPack$[ebp]
	movsx	edx, BYTE PTR [ecx+21]
	cmp	edx, 69					; 00000045H
	jne	$L2415
	mov	eax, DWORD PTR _TCPPack$[ebp]
	movsx	ecx, BYTE PTR [eax+22]
	cmp	ecx, 84					; 00000054H
	jne	$L2415
; Line 1244
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR _len$[ebp]
	mov	DWORD PTR [edx+180], eax
; Line 1246
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+112]
	add	edx, DWORD PTR _len$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+112], edx
; Line 1247
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+140]
	sub	edx, DWORD PTR _len$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+140], edx
; Line 1248
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR _timerEth$[ebp]
	mov	DWORD PTR [ecx+44], edx
; Line 1249
	mov	eax, DWORD PTR ?GetCount@TCPObj@@2KA	; TCPObj::GetCount
	add	eax, 1
	mov	DWORD PTR ?GetCount@TCPObj@@2KA, eax	; TCPObj::GetCount
; Line 1254
	mov	ecx, DWORD PTR _TCBRecordNumber$[ebp]
	imul	ecx, 1500				; 000005dcH
	add	ecx, 68515904				; 04157840H
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+248], ecx
; Line 1261
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L2417
$L2418:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L2417:
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx+180]
	jae	SHORT $L2419
; Line 1263
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+248]
	mov	edx, DWORD PTR _TCPPack$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	mov	dl, BYTE PTR [edx+20]
	mov	BYTE PTR [ecx+eax], dl
; Line 1265
	jmp	SHORT $L2418
$L2419:
; Line 1267
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+248]
	mov	edx, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR [ecx+edx-1]
	cmp	eax, 10					; 0000000aH
	jne	SHORT $L2420
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+248]
	mov	eax, DWORD PTR _i$[ebp]
	movsx	ecx, BYTE PTR [edx+eax-2]
	cmp	ecx, 13					; 0000000dH
	jne	SHORT $L2420
; Line 1268
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+92], 0
; Line 1269
	jmp	SHORT $L2421
$L2420:
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+92], 1
$L2421:
; Line 1275
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
; Line 1276
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+48], eax
; Line 1277
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+84], 1
; Line 1278
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L2422
; Line 1282
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L2347
$L2422:
; Line 1289
	mov	ecx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [ecx+92], 0
	jne	SHORT $L2423
; Line 1291
	mov	edx, DWORD PTR ?HttpCount@TCPObj@@2KA	; TCPObj::HttpCount
	add	edx, 1
	mov	DWORD PTR ?HttpCount@TCPObj@@2KA, edx	; TCPObj::HttpCount
; Line 1292
	mov	eax, DWORD PTR ?HttpRequests@TCPObj@@2KA ; TCPObj::HttpRequests
	add	eax, 1
	mov	DWORD PTR ?HttpRequests@TCPObj@@2KA, eax ; TCPObj::HttpRequests
; Line 1293
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+64], 1
; Line 1307
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	push	eax
	mov	eax, DWORD PTR _TCBRecordNumber$[ebp]
	push	eax
	lea	ecx, DWORD PTR _tsk$[ebp]
	call	?insertHttpTask@apptask@@QAEHHJ@Z	; apptask::insertHttpTask
; Line 1309
	push	1
	push	7
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAMaskRunRegister@AOAProtected@@QAEHHH@Z ; AOAProtected::AOAMaskRunRegister
$L2423:
; Line 1312
	jmp	$L2434
$L2415:
	mov	ecx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [ecx+92], 1
	jne	$L2426
; Line 1314
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+112]
	add	eax, DWORD PTR _len$[ebp]
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+112], eax
; Line 1315
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+140]
	sub	eax, DWORD PTR _len$[ebp]
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+140], eax
; Line 1316
	mov	edx, DWORD PTR _TCBRecordNumber$[ebp]
	imul	edx, 1500				; 000005dcH
	add	edx, 68515904				; 04157840H
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+248], edx
; Line 1317
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L2428
$L2429:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L2428:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _len$[ebp]
	jge	SHORT $L2430
; Line 1318
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, DWORD PTR [eax+180]
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+248]
	mov	edx, DWORD PTR _TCPPack$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	mov	dl, BYTE PTR [edx+20]
	mov	BYTE PTR [eax+ecx], dl
	jmp	SHORT $L2429
$L2430:
; Line 1319
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+180]
	add	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+248]
	movsx	ecx, BYTE PTR [eax+ecx-1]
	cmp	ecx, 10					; 0000000aH
	jne	SHORT $L2431
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+180]
	add	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+248]
	movsx	eax, BYTE PTR [edx+eax-2]
	cmp	eax, 13					; 0000000dH
	jne	SHORT $L2431
; Line 1320
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+92], 0
; Line 1321
	jmp	SHORT $L2432
$L2431:
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+92], 1
$L2432:
; Line 1322
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+180]
	add	ecx, DWORD PTR _len$[ebp]
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+180], ecx
; Line 1326
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
; Line 1327
	mov	ecx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [ecx+92], 0
	jne	SHORT $L2433
; Line 1329
	mov	edx, DWORD PTR ?HttpCount@TCPObj@@2KA	; TCPObj::HttpCount
	add	edx, 1
	mov	DWORD PTR ?HttpCount@TCPObj@@2KA, edx	; TCPObj::HttpCount
; Line 1330
	mov	eax, DWORD PTR ?HttpRequests@TCPObj@@2KA ; TCPObj::HttpRequests
	add	eax, 1
	mov	DWORD PTR ?HttpRequests@TCPObj@@2KA, eax ; TCPObj::HttpRequests
; Line 1331
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+64], 1
; Line 1332
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	push	eax
	mov	edx, DWORD PTR _TCBRecordNumber$[ebp]
	push	edx
	lea	ecx, DWORD PTR _tsk$[ebp]
	call	?insertHttpTask@apptask@@QAEHHJ@Z	; apptask::insertHttpTask
; Line 1334
	push	1
	push	7
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAMaskRunRegister@AOAProtected@@QAEHHH@Z ; AOAProtected::AOAMaskRunRegister
$L2433:
; Line 1337
	jmp	SHORT $L2434
$L2426:
; Line 1339
	mov	eax, -32				; ffffffe0H
	jmp	$L2347
$L2434:
; Line 1345
	xor	eax, eax
	jmp	$L2347
$L2403:
; Line 1352
	mov	eax, DWORD PTR _tcp$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	push	ecx
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+96]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?greaterEqualto@TCPObj@@AAEHKK@Z	; TCPObj::greaterEqualto
	test	eax, eax
	jle	SHORT $L2436
; Line 1362
	xor	eax, eax
	jmp	$L2347
$L2436:
; Line 1368
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+100]
	push	edx
	mov	eax, DWORD PTR _tcp$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?greaterEqualto@TCPObj@@AAEHKK@Z	; TCPObj::greaterEqualto
	test	eax, eax
	jle	SHORT $L2438
; Line 1375
	mov	edx, DWORD PTR _currenttask$[ebp]
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
; Line 1379
	mov	eax, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [eax+64], 1
	jne	SHORT $L2439
; Line 1381
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+76], 1
; Line 1384
	jmp	SHORT $L2440
$L2439:
; Line 1386
	mov	edx, DWORD PTR _TCBRecordNumber$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DeleteTCB@TCPObj@@QAEHH@Z		; TCPObj::DeleteTCB
$L2440:
; Line 1389
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L2347
$L2438:
; Line 1401
	mov	eax, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [eax+24], 6
	jne	$L2460
; Line 1404
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+164]
	add	edx, 1
	mov	eax, DWORD PTR _tcb$[ebp]
	cmp	edx, DWORD PTR [eax+100]
	jne	SHORT $L2444
; Line 1408
	xor	ecx, ecx
	test	ecx, ecx
	je	SHORT $L2444
; Line 1409
	push	16					; 00000010H
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+4]
	sub	eax, DWORD PTR ?MinTaskId@apptask@@2JA	; apptask::MinTaskId
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 348				; 0000015cH
	call	?insert@WTTrace@@QAEHHG@Z		; WTTrace::insert
$L2444:
; Line 1415
	mov	ecx, DWORD PTR _tcp$[ebp]
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [ecx+8]
	cmp	eax, DWORD PTR [edx+100]
	jne	$L2445
; Line 1417
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR _tcp$[ebp]
	mov	eax, DWORD PTR [edx+8]
	mov	DWORD PTR [ecx+96], eax
; Line 1425
	mov	ecx, DWORD PTR _tcp$[ebp]
	movsx	edx, BYTE PTR [ecx+13]
	and	edx, 1
	cmp	edx, 1
	jne	$L2446
; Line 1427
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+112]
	add	ecx, 1
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+112], ecx
; Line 1428
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR _timerEth$[ebp]
	mov	DWORD PTR [eax+56], ecx
; Line 1430
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
; Line 1432
	xor	eax, eax
	test	eax, eax
	je	SHORT $L2447
; Line 1433
	push	32					; 00000020H
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	sub	edx, DWORD PTR ?MinTaskId@apptask@@2JA	; apptask::MinTaskId
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 348				; 0000015cH
	call	?insert@WTTrace@@QAEHHG@Z		; WTTrace::insert
$L2447:
; Line 1435
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+60], eax
; Line 1436
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L2448
; Line 1437
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L2347
$L2448:
; Line 1440
	mov	edx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [edx+68], 1
	jne	SHORT $L2449
; Line 1442
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+80], 1
; Line 1443
	mov	ecx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [ecx+72], 1
	jne	SHORT $L2450
; Line 1444
	mov	eax, -1717986919			; 99999999H
	jmp	$L2347
$L2450:
; Line 1445
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+72], 1
$L2449:
; Line 1448
	xor	eax, eax
	jmp	$L2347
$L2446:
; Line 1453
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+24], 9
; Line 1454
	xor	ecx, ecx
	test	ecx, ecx
	je	SHORT $L2452
; Line 1455
	push	1024					; 00000400H
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+4]
	sub	eax, DWORD PTR ?MinTaskId@apptask@@2JA	; apptask::MinTaskId
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 348				; 0000015cH
	call	?insert@WTTrace@@QAEHHG@Z		; WTTrace::insert
$L2452:
; Line 1456
	xor	eax, eax
	jmp	$L2347
$L2445:
; Line 1461
	mov	ecx, DWORD PTR _tcp$[ebp]
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [ecx+8]
	cmp	eax, DWORD PTR [edx+96]
	jbe	$L2454
	mov	ecx, DWORD PTR _tcp$[ebp]
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [ecx+8]
	cmp	eax, DWORD PTR [edx+100]
	jae	$L2454
; Line 1465
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR _tcp$[ebp]
	mov	eax, DWORD PTR [edx+8]
	mov	DWORD PTR [ecx+96], eax
; Line 1470
	mov	ecx, DWORD PTR _tcp$[ebp]
	movsx	edx, BYTE PTR [ecx+13]
	and	edx, 1
	cmp	edx, 1
	jne	$L2455
; Line 1472
	mov	eax, DWORD PTR _currenttask$[ebp]
	push	eax
	push	6
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
; Line 1473
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L2456
; Line 1474
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L2347
$L2456:
; Line 1477
	mov	ecx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [ecx+68], 1
	jne	SHORT $L2457
; Line 1479
	mov	edx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [edx+72], 1
	jne	SHORT $L2458
; Line 1480
	mov	eax, -1717986919			; 99999999H
	jmp	$L2347
$L2458:
; Line 1481
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+72], 1
; Line 1483
	jmp	SHORT $L2459
$L2457:
; Line 1484
	mov	ecx, DWORD PTR _TCBRecordNumber$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DeleteTCB@TCPObj@@QAEHH@Z		; TCPObj::DeleteTCB
$L2459:
; Line 1487
	xor	eax, eax
	jmp	$L2347
$L2455:
; Line 1491
	xor	eax, eax
	jmp	$L2347
$L2454:
; Line 1495
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+108]
	push	eax
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?mod32cmp@TCPObj@@AAEKKK@Z		; TCPObj::mod32cmp
	cmp	eax, 262020				; 0003ff84H
	jbe	SHORT $L2461
; Line 1498
	xor	ecx, ecx
	test	ecx, ecx
	je	SHORT $L2462
; Line 1499
	push	2048					; 00000800H
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+4]
	sub	eax, DWORD PTR ?MinTaskId@apptask@@2JA	; apptask::MinTaskId
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 348				; 0000015cH
	call	?insert@WTTrace@@QAEHHG@Z		; WTTrace::insert
$L2462:
; Line 1500
	mov	ecx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [ecx+64], 1
	jne	SHORT $L2463
; Line 1502
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+76], 1
; Line 1505
	jmp	SHORT $L2464
$L2463:
; Line 1507
	mov	eax, DWORD PTR _TCBRecordNumber$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DeleteTCB@TCPObj@@QAEHH@Z		; TCPObj::DeleteTCB
$L2464:
; Line 1509
	xor	eax, eax
	jmp	$L2347
$L2461:
; Line 1511
	xor	eax, eax
	jmp	$L2347
$L2460:
; Line 1530
	mov	ecx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [ecx+24], 9
	jne	$L2465
; Line 1532
	mov	edx, DWORD PTR _tcp$[ebp]
	movsx	eax, BYTE PTR [edx+13]
	and	eax, 1
	cmp	eax, 1
	jne	$L2466
; Line 1534
	xor	ecx, ecx
	test	ecx, ecx
	je	SHORT $L2467
; Line 1535
	push	64					; 00000040H
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+4]
	sub	eax, DWORD PTR ?MinTaskId@apptask@@2JA	; apptask::MinTaskId
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 348				; 0000015cH
	call	?insert@WTTrace@@QAEHHG@Z		; WTTrace::insert
$L2467:
; Line 1536
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+112]
	add	edx, 1
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+112], edx
; Line 1538
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR _timerEth$[ebp]
	mov	DWORD PTR [ecx+56], edx
; Line 1539
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+60], eax
; Line 1540
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
; Line 1541
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+24], 16			; 00000010H
; Line 1542
	mov	ecx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [ecx+68], 1
	jne	SHORT $L2468
; Line 1544
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+80], 1
; Line 1545
	mov	eax, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [eax+72], 1
	jne	SHORT $L2469
; Line 1546
	mov	eax, -1717986919			; 99999999H
	jmp	$L2347
$L2469:
; Line 1547
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+72], 1
$L2468:
; Line 1549
	xor	eax, eax
	jmp	$L2347
$L2466:
; Line 1551
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+108]
	push	eax
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?mod32cmp@TCPObj@@AAEKKK@Z		; TCPObj::mod32cmp
	cmp	eax, 262020				; 0003ff84H
	jbe	SHORT $L2471
; Line 1554
	mov	ecx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [ecx+64], 1
	jne	SHORT $L2472
; Line 1556
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+76], 1
; Line 1559
	jmp	SHORT $L2473
$L2472:
; Line 1561
	mov	eax, DWORD PTR _TCBRecordNumber$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DeleteTCB@TCPObj@@QAEHH@Z		; TCPObj::DeleteTCB
$L2473:
; Line 1563
	xor	eax, eax
	jmp	$L2347
$L2471:
; Line 1567
	xor	eax, eax
	jmp	$L2347
$L2465:
; Line 1587
	mov	ecx, DWORD PTR _tcp$[ebp]
	movsx	edx, BYTE PTR [ecx+13]
	and	edx, 1
	cmp	edx, 1
	jne	$L2486
; Line 1590
	mov	eax, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [eax+24], 5
	jne	SHORT $L2476
; Line 1593
	mov	ecx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [ecx+68], 1
	jne	SHORT $L2477
; Line 1595
	mov	edx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [edx+72], 1
	jne	SHORT $L2478
; Line 1596
	mov	eax, -1717986919			; 99999999H
	jmp	$L2347
$L2478:
; Line 1597
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+72], 1
$L2477:
; Line 1599
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
; Line 1600
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+24], 16			; 00000010H
; Line 1601
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L2347
$L2476:
; Line 1604
	mov	eax, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [eax+24], 6
	jne	$L2479
; Line 1607
	mov	ecx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [ecx+68], 1
	jne	SHORT $L2480
; Line 1609
	mov	edx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [edx+72], 1
	jne	SHORT $L2481
; Line 1610
	mov	eax, -1717986919			; 99999999H
	jmp	$L2347
$L2481:
; Line 1611
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+72], 1
$L2480:
; Line 1613
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
; Line 1615
	push	368					; 00000170H
	push	OFFSET FLAT:$SG2482
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1616
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L2483
; Line 1617
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L2347
$L2483:
; Line 1619
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+24], 9
; Line 1622
	mov	eax, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [eax+64], 1
	jne	SHORT $L2484
; Line 1624
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+76], 1
; Line 1627
	jmp	SHORT $L2485
$L2484:
; Line 1628
	mov	edx, DWORD PTR _TCBRecordNumber$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DeleteTCB@TCPObj@@QAEHH@Z		; TCPObj::DeleteTCB
$L2485:
; Line 1630
	xor	eax, eax
	jmp	$L2347
$L2479:
; Line 1633
	mov	eax, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [eax+24], 7
	jne	$L2486
; Line 1636
	mov	ecx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [ecx+68], 1
	jne	SHORT $L2487
; Line 1638
	mov	edx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [edx+72], 1
	jne	SHORT $L2488
; Line 1639
	mov	eax, -1717986919			; 99999999H
	jmp	$L2347
$L2488:
; Line 1640
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+72], 1
$L2487:
; Line 1642
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
; Line 1643
	push	372					; 00000174H
	push	OFFSET FLAT:$SG2489
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1644
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+24], 8
; Line 1646
	mov	eax, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [eax+68], 1
	jne	SHORT $L2490
; Line 1648
	mov	ecx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [ecx+72], 1
	jne	SHORT $L2491
; Line 1649
	mov	eax, -1717986919			; 99999999H
	jmp	SHORT $L2347
$L2491:
; Line 1650
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+72], 1
; Line 1653
	jmp	SHORT $L2492
$L2490:
; Line 1654
	mov	eax, DWORD PTR _TCBRecordNumber$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DeleteTCB@TCPObj@@QAEHH@Z		; TCPObj::DeleteTCB
$L2492:
; Line 1656
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	SHORT $L2347
$L2486:
; Line 1704
	xor	eax, eax
$L2347:
; Line 1705
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
; Line 1714
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	mov	DWORD PTR _this$[ebp], ecx
; Line 1715
	mov	eax, DWORD PTR _Header$[ebp]
	mov	ecx, DWORD PTR _TCPPack$[ebp]
	mov	dl, BYTE PTR [ecx+1]
	mov	BYTE PTR [eax], dl
; Line 1716
	mov	eax, DWORD PTR _Header$[ebp]
	mov	ecx, DWORD PTR _TCPPack$[ebp]
	mov	dl, BYTE PTR [ecx]
	mov	BYTE PTR [eax+1], dl
; Line 1717
	mov	eax, DWORD PTR _Header$[ebp]
	mov	ecx, DWORD PTR _TCPPack$[ebp]
	mov	dl, BYTE PTR [ecx+3]
	mov	BYTE PTR [eax+2], dl
; Line 1718
	mov	eax, DWORD PTR _Header$[ebp]
	mov	ecx, DWORD PTR _TCPPack$[ebp]
	mov	dl, BYTE PTR [ecx+2]
	mov	BYTE PTR [eax+3], dl
; Line 1720
	mov	eax, DWORD PTR _Header$[ebp]
	mov	ecx, DWORD PTR _TCPPack$[ebp]
	mov	dl, BYTE PTR [ecx+7]
	mov	BYTE PTR [eax+4], dl
; Line 1721
	mov	eax, DWORD PTR _Header$[ebp]
	mov	ecx, DWORD PTR _TCPPack$[ebp]
	mov	dl, BYTE PTR [ecx+6]
	mov	BYTE PTR [eax+5], dl
; Line 1722
	mov	eax, DWORD PTR _Header$[ebp]
	mov	ecx, DWORD PTR _TCPPack$[ebp]
	mov	dl, BYTE PTR [ecx+5]
	mov	BYTE PTR [eax+6], dl
; Line 1723
	mov	eax, DWORD PTR _Header$[ebp]
	mov	ecx, DWORD PTR _TCPPack$[ebp]
	mov	dl, BYTE PTR [ecx+4]
	mov	BYTE PTR [eax+7], dl
; Line 1725
	mov	eax, DWORD PTR _Header$[ebp]
	mov	ecx, DWORD PTR _TCPPack$[ebp]
	mov	dl, BYTE PTR [ecx+11]
	mov	BYTE PTR [eax+8], dl
; Line 1726
	mov	eax, DWORD PTR _Header$[ebp]
	mov	ecx, DWORD PTR _TCPPack$[ebp]
	mov	dl, BYTE PTR [ecx+10]
	mov	BYTE PTR [eax+9], dl
; Line 1727
	mov	eax, DWORD PTR _Header$[ebp]
	mov	ecx, DWORD PTR _TCPPack$[ebp]
	mov	dl, BYTE PTR [ecx+9]
	mov	BYTE PTR [eax+10], dl
; Line 1728
	mov	eax, DWORD PTR _Header$[ebp]
	mov	ecx, DWORD PTR _TCPPack$[ebp]
	mov	dl, BYTE PTR [ecx+8]
	mov	BYTE PTR [eax+11], dl
; Line 1730
	mov	eax, DWORD PTR _Header$[ebp]
	mov	ecx, DWORD PTR _TCPPack$[ebp]
	mov	dl, BYTE PTR [ecx+12]
	mov	BYTE PTR [eax+12], dl
; Line 1731
	mov	eax, DWORD PTR _Header$[ebp]
	movsx	ecx, BYTE PTR [eax+12]
	sar	ecx, 4
	mov	edx, DWORD PTR _Header$[ebp]
	mov	BYTE PTR [edx+12], cl
; Line 1732
	mov	eax, DWORD PTR _Header$[ebp]
	mov	ecx, DWORD PTR _TCPPack$[ebp]
	mov	dl, BYTE PTR [ecx+13]
	mov	BYTE PTR [eax+13], dl
; Line 1734
	mov	eax, DWORD PTR _Header$[ebp]
	mov	ecx, DWORD PTR _TCPPack$[ebp]
	mov	dl, BYTE PTR [ecx+15]
	mov	BYTE PTR [eax+14], dl
; Line 1735
	mov	eax, DWORD PTR _Header$[ebp]
	mov	ecx, DWORD PTR _TCPPack$[ebp]
	mov	dl, BYTE PTR [ecx+14]
	mov	BYTE PTR [eax+15], dl
; Line 1737
	mov	eax, DWORD PTR _Header$[ebp]
	mov	ecx, DWORD PTR _TCPPack$[ebp]
	mov	dl, BYTE PTR [ecx+17]
	mov	BYTE PTR [eax+16], dl
; Line 1738
	mov	eax, DWORD PTR _Header$[ebp]
	mov	ecx, DWORD PTR _TCPPack$[ebp]
	mov	dl, BYTE PTR [ecx+16]
	mov	BYTE PTR [eax+17], dl
; Line 1740
	mov	eax, DWORD PTR _Header$[ebp]
	mov	ecx, DWORD PTR _TCPPack$[ebp]
	mov	dl, BYTE PTR [ecx+19]
	mov	BYTE PTR [eax+18], dl
; Line 1741
	mov	eax, DWORD PTR _Header$[ebp]
	mov	ecx, DWORD PTR _TCPPack$[ebp]
	mov	dl, BYTE PTR [ecx+18]
	mov	BYTE PTR [eax+19], dl
; Line 1744
	mov	eax, DWORD PTR _Header$[ebp]
	movsx	ecx, BYTE PTR [eax+12]
	mov	edx, DWORD PTR _TCPPack$[ebp]
	lea	eax, DWORD PTR [edx+ecx*4]
	mov	DWORD PTR _dataoffset$[ebp], eax
; Line 1745
	lea	ecx, DWORD PTR _dataoffset$[ebp]
	mov	DWORD PTR _temp$[ebp], ecx
; Line 1748
	mov	edx, DWORD PTR _TCPPack$[ebp]
	add	edx, 20					; 00000014H
	mov	DWORD PTR _Options$[ebp], edx
; Line 1749
	lea	eax, DWORD PTR _Options$[ebp]
	mov	DWORD PTR _temp1$[ebp], eax
; Line 1751
	mov	ecx, DWORD PTR _Header$[ebp]
	mov	edx, DWORD PTR _temp$[ebp]
	mov	al, BYTE PTR [edx]
	mov	BYTE PTR [ecx+20], al
; Line 1752
	mov	ecx, DWORD PTR _Header$[ebp]
	mov	edx, DWORD PTR _temp$[ebp]
	mov	al, BYTE PTR [edx+1]
	mov	BYTE PTR [ecx+21], al
; Line 1753
	mov	ecx, DWORD PTR _Header$[ebp]
	mov	edx, DWORD PTR _temp$[ebp]
	mov	al, BYTE PTR [edx+2]
	mov	BYTE PTR [ecx+22], al
; Line 1754
	mov	ecx, DWORD PTR _Header$[ebp]
	mov	edx, DWORD PTR _temp$[ebp]
	mov	al, BYTE PTR [edx+3]
	mov	BYTE PTR [ecx+23], al
; Line 1756
	mov	ecx, DWORD PTR _Header$[ebp]
	mov	edx, DWORD PTR _temp1$[ebp]
	mov	al, BYTE PTR [edx]
	mov	BYTE PTR [ecx+24], al
; Line 1757
	mov	ecx, DWORD PTR _Header$[ebp]
	mov	edx, DWORD PTR _temp1$[ebp]
	mov	al, BYTE PTR [edx+1]
	mov	BYTE PTR [ecx+25], al
; Line 1758
	mov	ecx, DWORD PTR _Header$[ebp]
	mov	edx, DWORD PTR _temp1$[ebp]
	mov	al, BYTE PTR [edx+2]
	mov	BYTE PTR [ecx+26], al
; Line 1759
	mov	ecx, DWORD PTR _Header$[ebp]
	mov	edx, DWORD PTR _temp1$[ebp]
	mov	al, BYTE PTR [edx+3]
	mov	BYTE PTR [ecx+27], al
; Line 1760
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
; Line 1766
	push	ebp
	mov	ebp, esp
	sub	esp, 32					; 00000020H
	mov	DWORD PTR _this$[ebp], ecx
; Line 1769
	mov	WORD PTR _padd$[ebp], 0
; Line 1770
	mov	DWORD PTR _word16$[ebp], 0
; Line 1771
	mov	DWORD PTR _sum$[ebp], 0
; Line 1772
	mov	DWORD PTR _temp1$[ebp], 0
; Line 1773
	mov	DWORD PTR _temp2$[ebp], 0
; Line 1774
	mov	WORD PTR _checksum$[ebp], 0
; Line 1775
	mov	eax, DWORD PTR _tdatagram$[ebp]
	mov	BYTE PTR [eax+16], 0
; Line 1776
	mov	ecx, DWORD PTR _tdatagram$[ebp]
	mov	BYTE PTR [ecx+17], 0
; Line 1782
	mov	edx, DWORD PTR _TSLength$[ebp]
	and	edx, 1
	test	edx, edx
	je	SHORT $L2522
; Line 1784
	mov	WORD PTR _padd$[ebp], 1
; Line 1785
	mov	eax, DWORD PTR _tdatagram$[ebp]
	add	eax, DWORD PTR _TSLength$[ebp]
	mov	BYTE PTR [eax], 0
$L2522:
; Line 1792
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L2524
$L2525:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 2
	mov	DWORD PTR _i$[ebp], ecx
$L2524:
	mov	edx, DWORD PTR _padd$[ebp]
	and	edx, 65535				; 0000ffffH
	mov	eax, DWORD PTR _TSLength$[ebp]
	add	eax, edx
	cmp	DWORD PTR _i$[ebp], eax
	jge	SHORT $L2526
; Line 1794
	mov	ecx, DWORD PTR _tdatagram$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	movsx	edx, BYTE PTR [ecx]
	mov	DWORD PTR _temp1$[ebp], edx
; Line 1795
	mov	eax, DWORD PTR _tdatagram$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	movsx	ecx, BYTE PTR [eax+1]
	mov	DWORD PTR _temp2$[ebp], ecx
; Line 1796
	mov	edx, DWORD PTR _temp1$[ebp]
	shl	edx, 8
	and	edx, 65280				; 0000ff00H
	mov	eax, DWORD PTR _temp2$[ebp]
	and	eax, 255				; 000000ffH
	add	edx, eax
	mov	DWORD PTR _word16$[ebp], edx
; Line 1797
	mov	ecx, DWORD PTR _word16$[ebp]
	and	ecx, 65535				; 0000ffffH
	mov	edx, DWORD PTR _sum$[ebp]
	add	edx, ecx
	mov	DWORD PTR _sum$[ebp], edx
; Line 1798
	jmp	SHORT $L2525
$L2526:
; Line 1802
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L2527
$L2528:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 2
	mov	DWORD PTR _i$[ebp], eax
$L2527:
	cmp	DWORD PTR _i$[ebp], 4
	jge	SHORT $L2529
; Line 1804
	mov	ecx, DWORD PTR _sourceIP$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	movsx	edx, BYTE PTR [ecx]
	mov	DWORD PTR _temp1$[ebp], edx
; Line 1805
	mov	eax, DWORD PTR _sourceIP$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	movsx	ecx, BYTE PTR [eax+1]
	mov	DWORD PTR _temp2$[ebp], ecx
; Line 1806
	mov	edx, DWORD PTR _temp1$[ebp]
	shl	edx, 8
	and	edx, 65280				; 0000ff00H
	mov	eax, DWORD PTR _temp2$[ebp]
	and	eax, 255				; 000000ffH
	add	edx, eax
	mov	DWORD PTR _word16$[ebp], edx
; Line 1807
	mov	ecx, DWORD PTR _word16$[ebp]
	and	ecx, 65535				; 0000ffffH
	mov	edx, DWORD PTR _sum$[ebp]
	add	edx, ecx
	mov	DWORD PTR _sum$[ebp], edx
; Line 1808
	jmp	SHORT $L2528
$L2529:
; Line 1810
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L2530
$L2531:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 2
	mov	DWORD PTR _i$[ebp], eax
$L2530:
	cmp	DWORD PTR _i$[ebp], 4
	jge	SHORT $L2532
; Line 1812
	mov	ecx, DWORD PTR _targetIP$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	movsx	edx, BYTE PTR [ecx]
	mov	DWORD PTR _temp1$[ebp], edx
; Line 1813
	mov	eax, DWORD PTR _targetIP$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	movsx	ecx, BYTE PTR [eax+1]
	mov	DWORD PTR _temp2$[ebp], ecx
; Line 1814
	mov	edx, DWORD PTR _temp1$[ebp]
	shl	edx, 8
	and	edx, 65280				; 0000ff00H
	mov	eax, DWORD PTR _temp2$[ebp]
	and	eax, 255				; 000000ffH
	add	edx, eax
	mov	DWORD PTR _word16$[ebp], edx
; Line 1815
	mov	ecx, DWORD PTR _word16$[ebp]
	and	ecx, 65535				; 0000ffffH
	mov	edx, DWORD PTR _sum$[ebp]
	add	edx, ecx
	mov	DWORD PTR _sum$[ebp], edx
; Line 1816
	jmp	SHORT $L2531
$L2532:
; Line 1818
	mov	eax, DWORD PTR _protocol$[ebp]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _word16$[ebp], eax
; Line 1819
	mov	ecx, DWORD PTR _word16$[ebp]
	and	ecx, 65535				; 0000ffffH
	mov	edx, DWORD PTR _sum$[ebp]
	add	edx, ecx
	mov	DWORD PTR _sum$[ebp], edx
; Line 1821
	mov	eax, DWORD PTR _TSLength$[ebp]
	and	eax, 65535				; 0000ffffH
	mov	DWORD PTR _word16$[ebp], eax
; Line 1822
	mov	ecx, DWORD PTR _word16$[ebp]
	and	ecx, 65535				; 0000ffffH
	mov	edx, DWORD PTR _sum$[ebp]
	add	edx, ecx
	mov	DWORD PTR _sum$[ebp], edx
$L2534:
; Line 1825
	mov	eax, DWORD PTR _sum$[ebp]
	shr	eax, 16					; 00000010H
	test	eax, eax
	je	SHORT $L2535
; Line 1826
	mov	ecx, DWORD PTR _sum$[ebp]
	and	ecx, 65535				; 0000ffffH
	mov	edx, DWORD PTR _sum$[ebp]
	shr	edx, 16					; 00000010H
	add	ecx, edx
	mov	DWORD PTR _sum$[ebp], ecx
	jmp	SHORT $L2534
$L2535:
; Line 1829
	mov	eax, DWORD PTR _sum$[ebp]
	not	eax
	mov	DWORD PTR _sum$[ebp], eax
; Line 1831
	mov	cx, WORD PTR _sum$[ebp]
	mov	WORD PTR _checksum$[ebp], cx
; Line 1833
	mov	ax, WORD PTR _checksum$[ebp]
; Line 1834
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
; Line 1844
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	mov	DWORD PTR _this$[ebp], ecx
; Line 1846
	mov	eax, DWORD PTR ?TCBBase@TCPObj@@0KA	; TCPObj::TCBBase
	mov	DWORD PTR _TCBPointer$[ebp], eax
; Line 1850
	mov	ecx, DWORD PTR _SrcPortNum$[ebp]
	push	ecx
	mov	edx, DWORD PTR _IPAdd$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 328				; 00000148H
	call	?hashfun@TcphashIndex@@QAEJPAD0@Z	; TcphashIndex::hashfun
	mov	DWORD PTR _hashval$[ebp], eax
; Line 1851
	mov	eax, DWORD PTR _hashval$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 328				; 00000148H
	call	?getIndex@TcphashIndex@@QAEJJ@Z		; TcphashIndex::getIndex
	mov	DWORD PTR _next$[ebp], eax
$L2547:
; Line 1853
	cmp	DWORD PTR _next$[ebp], -1
	je	$L2548
; Line 1858
	mov	ecx, DWORD PTR _next$[ebp]
	imul	ecx, 288				; 00000120H
	mov	edx, DWORD PTR _TCBPointer$[ebp]
	cmp	DWORD PTR [edx+ecx], 1
	jne	$L2549
	mov	eax, DWORD PTR _next$[ebp]
	imul	eax, 288				; 00000120H
	mov	ecx, DWORD PTR _TCBPointer$[ebp]
	movsx	edx, BYTE PTR [ecx+eax+20]
	mov	eax, DWORD PTR _IPAdd$[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	edx, ecx
	jne	$L2549
	mov	edx, DWORD PTR _next$[ebp]
	imul	edx, 288				; 00000120H
	mov	eax, DWORD PTR _TCBPointer$[ebp]
	movsx	ecx, BYTE PTR [eax+edx+21]
	mov	edx, DWORD PTR _IPAdd$[ebp]
	movsx	eax, BYTE PTR [edx+1]
	cmp	ecx, eax
	jne	SHORT $L2549
	mov	ecx, DWORD PTR _next$[ebp]
	imul	ecx, 288				; 00000120H
	mov	edx, DWORD PTR _TCBPointer$[ebp]
	movsx	eax, BYTE PTR [edx+ecx+22]
	mov	ecx, DWORD PTR _IPAdd$[ebp]
	movsx	edx, BYTE PTR [ecx+2]
	cmp	eax, edx
	jne	SHORT $L2549
	mov	eax, DWORD PTR _next$[ebp]
	imul	eax, 288				; 00000120H
	mov	ecx, DWORD PTR _TCBPointer$[ebp]
	movsx	edx, BYTE PTR [ecx+eax+23]
	mov	eax, DWORD PTR _IPAdd$[ebp]
	movsx	ecx, BYTE PTR [eax+3]
	cmp	edx, ecx
	jne	SHORT $L2549
	mov	edx, DWORD PTR _next$[ebp]
	imul	edx, 288				; 00000120H
	mov	eax, DWORD PTR _TCBPointer$[ebp]
	movsx	ecx, BYTE PTR [eax+edx+18]
	mov	edx, DWORD PTR _SrcPortNum$[ebp]
	movsx	eax, BYTE PTR [edx]
	cmp	ecx, eax
	jne	SHORT $L2549
	mov	ecx, DWORD PTR _next$[ebp]
	imul	ecx, 288				; 00000120H
	mov	edx, DWORD PTR _TCBPointer$[ebp]
	movsx	eax, BYTE PTR [edx+ecx+19]
	mov	ecx, DWORD PTR _SrcPortNum$[ebp]
	movsx	edx, BYTE PTR [ecx+1]
	cmp	eax, edx
	jne	SHORT $L2549
; Line 1861
	mov	eax, DWORD PTR _next$[ebp]
	jmp	SHORT $L2541
$L2549:
; Line 1866
	mov	eax, DWORD PTR _next$[ebp]
	imul	eax, 288				; 00000120H
	mov	ecx, DWORD PTR _TCBPointer$[ebp]
	mov	edx, DWORD PTR _next$[ebp]
	cmp	edx, DWORD PTR [ecx+eax+260]
	jne	SHORT $L2550
; Line 1868
	mov	eax, DWORD PTR _next$[ebp]
	imul	eax, 288				; 00000120H
	mov	ecx, DWORD PTR _TCBPointer$[ebp]
	mov	DWORD PTR [ecx+eax+260], -1
$L2550:
; Line 1872
	mov	edx, DWORD PTR _next$[ebp]
	imul	edx, 288				; 00000120H
	mov	eax, DWORD PTR _TCBPointer$[ebp]
	mov	ecx, DWORD PTR [eax+edx+260]
	mov	DWORD PTR _next$[ebp], ecx
; Line 1873
	jmp	$L2547
$L2548:
; Line 1874
	or	eax, -1
$L2541:
; Line 1876
	mov	esp, ebp
	pop	ebp
	ret	8
?SearchTCB@TCPObj@@AAEHQAD0@Z ENDP			; TCPObj::SearchTCB
_TCPPack$ = 8
_this$ = -8
_seqnum$ = -4
?charToseqnum@TCPObj@@AAEKPAD@Z PROC NEAR		; TCPObj::charToseqnum
; Line 1881
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 1883
	mov	eax, DWORD PTR _TCPPack$[ebp]
	mov	cl, BYTE PTR [eax+3]
	mov	BYTE PTR _seqnum$[ebp], cl
; Line 1884
	mov	edx, DWORD PTR _TCPPack$[ebp]
	mov	al, BYTE PTR [edx+2]
	mov	BYTE PTR _seqnum$[ebp+1], al
; Line 1885
	mov	ecx, DWORD PTR _TCPPack$[ebp]
	mov	dl, BYTE PTR [ecx+1]
	mov	BYTE PTR _seqnum$[ebp+2], dl
; Line 1886
	mov	eax, DWORD PTR _TCPPack$[ebp]
	mov	cl, BYTE PTR [eax]
	mov	BYTE PTR _seqnum$[ebp+3], cl
; Line 1887
	mov	eax, DWORD PTR _seqnum$[ebp]
; Line 1888
	mov	esp, ebp
	pop	ebp
	ret	4
?charToseqnum@TCPObj@@AAEKPAD@Z ENDP			; TCPObj::charToseqnum
_TCPPack$ = 8
_this$ = -8
_seqnum$ = -4
?charToWindow@TCPObj@@AAEGPAD@Z PROC NEAR		; TCPObj::charToWindow
; Line 1891
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 1893
	mov	eax, DWORD PTR _TCPPack$[ebp]
	mov	cl, BYTE PTR [eax+1]
	mov	BYTE PTR _seqnum$[ebp], cl
; Line 1894
	mov	edx, DWORD PTR _TCPPack$[ebp]
	mov	al, BYTE PTR [edx]
	mov	BYTE PTR _seqnum$[ebp+1], al
; Line 1896
	mov	ax, WORD PTR _seqnum$[ebp]
; Line 1897
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
; Line 1905
	push	ebp
	mov	ebp, esp
	sub	esp, 68					; 00000044H
	mov	DWORD PTR _this$[ebp], ecx
; Line 1907
	lea	ecx, DWORD PTR _EO$[ebp]
	call	??0EtherObj@@QAE@XZ			; EtherObj::EtherObj
; Line 1912
	mov	DWORD PTR _x$[ebp], 0
; Line 1914
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1916
	mov	DWORD PTR _TCPPack_size$[ebp], 0
; Line 1917
	mov	DWORD PTR _InPtr$[ebp], 0
; Line 1919
	mov	eax, DWORD PTR _destPort$[ebp]
	push	eax
	mov	ecx, DWORD PTR _destIP$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?SearchTCB@TCPObj@@AAEHQAD0@Z		; TCPObj::SearchTCB
	mov	DWORD PTR _TCBRecordNum$[ebp], eax
; Line 1922
	lea	edx, DWORD PTR _c3$[ebp]
	mov	DWORD PTR _p1$[ebp], edx
; Line 1923
	lea	eax, DWORD PTR _c4$[ebp]
	mov	DWORD PTR _send_buffer$[ebp], eax
; Line 1925
	lea	ecx, DWORD PTR _EO$[ebp]
	call	?TDLFull@EtherObj@@QAEHXZ		; EtherObj::TDLFull
	cmp	eax, 1
	jne	SHORT $L2586
; Line 1927
	mov	eax, -30				; ffffffe2H
	jmp	$L2572
$L2586:
; Line 1931
	mov	ecx, DWORD PTR ?SendInPtr@EtherObj@@2JA	; EtherObj::SendInPtr
	shl	ecx, 4
	mov	edx, DWORD PTR ?TDLPointer@EtherObj@@2JA ; EtherObj::TDLPointer
	lea	eax, DWORD PTR [edx+ecx-1114112]
	mov	DWORD PTR _x$[ebp], eax
; Line 1934
	mov	ecx, DWORD PTR _x$[ebp]
	add	ecx, 1114112				; 00110000H
	mov	edx, DWORD PTR ?TDLPointer@EtherObj@@2JA ; EtherObj::TDLPointer
	add	edx, 65520				; 0000fff0H
	cmp	ecx, edx
	jle	SHORT $L2587
; Line 1936
	mov	eax, -22				; ffffffeaH
	jmp	$L2572
$L2587:
; Line 1939
	mov	eax, DWORD PTR _x$[ebp]
	mov	DWORD PTR _p1$[ebp], eax
; Line 1942
	mov	ecx, DWORD PTR ?TDLDataPointer@EtherObj@@2JA ; EtherObj::TDLDataPointer
	add	ecx, 6553600				; 00640000H
	mov	edx, DWORD PTR _p1$[ebp]
	cmp	DWORD PTR [edx], ecx
	jl	SHORT $L2589
; Line 1944
	mov	eax, -23				; ffffffe9H
	jmp	$L2572
$L2589:
; Line 1947
	mov	eax, DWORD PTR _p1$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _send_buffer$[ebp], ecx
; Line 1949
	mov	edx, DWORD PTR ?SendInPtr@EtherObj@@2JA	; EtherObj::SendInPtr
	mov	DWORD PTR _InPtr$[ebp], edx
; Line 1951
	mov	eax, DWORD PTR ?SendInPtr@EtherObj@@2JA	; EtherObj::SendInPtr
	add	eax, 1
	mov	DWORD PTR ?SendInPtr@EtherObj@@2JA, eax	; EtherObj::SendInPtr
; Line 1953
	cmp	DWORD PTR ?SendInPtr@EtherObj@@2JA, 4096 ; EtherObj::SendInPtr, 00001000H
	jne	SHORT $L2591
; Line 1955
	mov	DWORD PTR ?SendInPtr@EtherObj@@2JA, 0	; EtherObj::SendInPtr
$L2591:
; Line 1959
	mov	ecx, DWORD PTR _send_buffer$[ebp]
	sub	ecx, 1114078				; 0010ffdeH
	mov	DWORD PTR _send_buffer$[ebp], ecx
; Line 1960
	cmp	DWORD PTR _TCBRecordNum$[ebp], -1
	jne	SHORT $L2592
; Line 1961
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
	jmp	SHORT $L2593
$L2592:
; Line 1963
	mov	eax, DWORD PTR _TCBRecordNum$[ebp]
	imul	eax, 288				; 00000120H
	mov	ecx, DWORD PTR ?TCBBase@TCPObj@@0KA	; TCPObj::TCBBase
	add	ecx, eax
	mov	DWORD PTR _tcb$[ebp], ecx
; Line 1965
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
$L2593:
; Line 1971
	mov	ecx, DWORD PTR _send_buffer$[ebp]
	sub	ecx, 20					; 00000014H
	mov	DWORD PTR _send_buffer$[ebp], ecx
; Line 1976
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
; Line 1977
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L2596
; Line 1978
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	SHORT $L2572
$L2596:
; Line 1980
	mov	ecx, DWORD PTR _send_buffer$[ebp]
	sub	ecx, 14					; 0000000eH
	mov	DWORD PTR _send_buffer$[ebp], ecx
; Line 1982
	mov	edx, DWORD PTR ?SendCountTotal@TCPObj@@2HA ; TCPObj::SendCountTotal
	add	edx, 1
	mov	DWORD PTR ?SendCountTotal@TCPObj@@2HA, edx ; TCPObj::SendCountTotal
; Line 2017
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
; Line 2018
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L2597
; Line 2025
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	SHORT $L2572
$L2597:
; Line 2029
	xor	eax, eax
$L2572:
; Line 2030
	mov	esp, ebp
	pop	ebp
	ret	28					; 0000001cH
?SendMisc@TCPObj@@AAEHPAD0KD0HH@Z ENDP			; TCPObj::SendMisc
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
; Line 2035
	push	ebp
	mov	ebp, esp
	sub	esp, 68					; 00000044H
	mov	DWORD PTR _this$[ebp], ecx
; Line 2038
	lea	ecx, DWORD PTR _EO$[ebp]
	call	??0EtherObj@@QAE@XZ			; EtherObj::EtherObj
; Line 2043
	mov	DWORD PTR _x$[ebp], 0
; Line 2045
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2047
	mov	DWORD PTR _TCPPack_size$[ebp], 0
; Line 2048
	mov	DWORD PTR _InPtr$[ebp], 0
; Line 2050
	mov	eax, DWORD PTR _destPort$[ebp]
	push	eax
	mov	ecx, DWORD PTR _destIP$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?SearchTCB@TCPObj@@AAEHQAD0@Z		; TCPObj::SearchTCB
	mov	DWORD PTR _TCBRecordNum$[ebp], eax
; Line 2053
	lea	edx, DWORD PTR _c3$[ebp]
	mov	DWORD PTR _p1$[ebp], edx
; Line 2054
	lea	eax, DWORD PTR _c4$[ebp]
	mov	DWORD PTR _send_buffer$[ebp], eax
; Line 2056
	lea	ecx, DWORD PTR _EO$[ebp]
	call	?TDLFull@EtherObj@@QAEHXZ		; EtherObj::TDLFull
	cmp	eax, 1
	jne	SHORT $L2620
; Line 2058
	mov	eax, -30				; ffffffe2H
	jmp	$L2606
$L2620:
; Line 2062
	mov	ecx, DWORD PTR ?SendInPtr@EtherObj@@2JA	; EtherObj::SendInPtr
	shl	ecx, 4
	mov	edx, DWORD PTR ?TDLPointer@EtherObj@@2JA ; EtherObj::TDLPointer
	lea	eax, DWORD PTR [edx+ecx-1114112]
	mov	DWORD PTR _x$[ebp], eax
; Line 2065
	mov	ecx, DWORD PTR _x$[ebp]
	add	ecx, 1114112				; 00110000H
	mov	edx, DWORD PTR ?TDLPointer@EtherObj@@2JA ; EtherObj::TDLPointer
	add	edx, 65520				; 0000fff0H
	cmp	ecx, edx
	jle	SHORT $L2621
; Line 2067
	mov	eax, -22				; ffffffeaH
	jmp	$L2606
$L2621:
; Line 2070
	mov	eax, DWORD PTR _x$[ebp]
	mov	DWORD PTR _p1$[ebp], eax
; Line 2073
	mov	ecx, DWORD PTR ?TDLDataPointer@EtherObj@@2JA ; EtherObj::TDLDataPointer
	add	ecx, 6553600				; 00640000H
	mov	edx, DWORD PTR _p1$[ebp]
	cmp	DWORD PTR [edx], ecx
	jl	SHORT $L2623
; Line 2075
	mov	eax, -23				; ffffffe9H
	jmp	$L2606
$L2623:
; Line 2078
	mov	eax, DWORD PTR _p1$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _send_buffer$[ebp], ecx
; Line 2080
	mov	edx, DWORD PTR ?SendInPtr@EtherObj@@2JA	; EtherObj::SendInPtr
	mov	DWORD PTR _InPtr$[ebp], edx
; Line 2082
	mov	eax, DWORD PTR ?SendInPtr@EtherObj@@2JA	; EtherObj::SendInPtr
	add	eax, 1
	mov	DWORD PTR ?SendInPtr@EtherObj@@2JA, eax	; EtherObj::SendInPtr
; Line 2084
	cmp	DWORD PTR ?SendInPtr@EtherObj@@2JA, 4096 ; EtherObj::SendInPtr, 00001000H
	jne	SHORT $L2625
; Line 2086
	mov	DWORD PTR ?SendInPtr@EtherObj@@2JA, 0	; EtherObj::SendInPtr
$L2625:
; Line 2090
	mov	ecx, DWORD PTR _send_buffer$[ebp]
	sub	ecx, 1114078				; 0010ffdeH
	mov	DWORD PTR _send_buffer$[ebp], ecx
; Line 2091
	cmp	DWORD PTR _TCBRecordNum$[ebp], -1
	jne	SHORT $L2626
; Line 2092
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
	jmp	SHORT $L2627
$L2626:
; Line 2094
	mov	edx, DWORD PTR _TCBRecordNum$[ebp]
	imul	edx, 288				; 00000120H
	mov	eax, DWORD PTR ?TCBBase@TCPObj@@0KA	; TCPObj::TCBBase
	add	eax, edx
	mov	DWORD PTR _tcb$[ebp], eax
; Line 2096
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
$L2627:
; Line 2102
	mov	eax, DWORD PTR _send_buffer$[ebp]
	sub	eax, 20					; 00000014H
	mov	DWORD PTR _send_buffer$[ebp], eax
; Line 2107
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
; Line 2108
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L2630
; Line 2109
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	SHORT $L2606
$L2630:
; Line 2111
	mov	eax, DWORD PTR _send_buffer$[ebp]
	sub	eax, 14					; 0000000eH
	mov	DWORD PTR _send_buffer$[ebp], eax
; Line 2113
	mov	ecx, DWORD PTR ?SendCountTotal@TCPObj@@2HA ; TCPObj::SendCountTotal
	add	ecx, 1
	mov	DWORD PTR ?SendCountTotal@TCPObj@@2HA, ecx ; TCPObj::SendCountTotal
; Line 2149
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
; Line 2150
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L2631
; Line 2159
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	SHORT $L2606
$L2631:
; Line 2163
	xor	eax, eax
$L2606:
; Line 2164
	mov	esp, ebp
	pop	ebp
	ret	24					; 00000018H
?SendMisc@TCPObj@@AAEHPAD0D0HH@Z ENDP			; TCPObj::SendMisc
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
; Line 2171
	push	ebp
	mov	ebp, esp
	sub	esp, 40					; 00000028H
	push	esi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2172
	mov	DWORD PTR _i$[ebp], 0
	mov	DWORD PTR _k$[ebp], 0
; Line 2173
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2174
	mov	DWORD PTR _checksum$[ebp], 0
; Line 2177
	lea	eax, DWORD PTR _c$[ebp]
	mov	DWORD PTR _options$[ebp], eax
; Line 2179
	mov	DWORD PTR _numbytesoptions$[ebp], 0
; Line 2180
	mov	eax, DWORD PTR _numbytesoptions$[ebp]
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	add	eax, 5
	mov	BYTE PTR _HeaderLength$[ebp], al
; Line 2181
	mov	DWORD PTR _StartofData$[ebp], 0
; Line 2185
	mov	ecx, DWORD PTR _TCPPack$[ebp]
	mov	BYTE PTR [ecx], 0
; Line 2186
	mov	edx, DWORD PTR _TCPPack$[ebp]
	mov	BYTE PTR [edx+1], 80			; 00000050H
; Line 2187
	mov	eax, DWORD PTR _TCPPack$[ebp]
	mov	ecx, DWORD PTR _destPort$[ebp]
	mov	dl, BYTE PTR [ecx]
	mov	BYTE PTR [eax+2], dl
; Line 2188
	mov	eax, DWORD PTR _TCPPack$[ebp]
	mov	ecx, DWORD PTR _destPort$[ebp]
	mov	dl, BYTE PTR [ecx+1]
	mov	BYTE PTR [eax+3], dl
; Line 2191
	mov	eax, DWORD PTR _seqnum$[ebp]
	shr	eax, 24					; 00000018H
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _TCPPack$[ebp]
	mov	BYTE PTR [ecx+4], al
; Line 2192
	mov	edx, DWORD PTR _seqnum$[ebp]
	shr	edx, 16					; 00000010H
	and	edx, 255				; 000000ffH
	mov	eax, DWORD PTR _TCPPack$[ebp]
	mov	BYTE PTR [eax+5], dl
; Line 2193
	mov	ecx, DWORD PTR _seqnum$[ebp]
	shr	ecx, 8
	and	ecx, 255				; 000000ffH
	mov	edx, DWORD PTR _TCPPack$[ebp]
	mov	BYTE PTR [edx+6], cl
; Line 2194
	mov	eax, DWORD PTR _seqnum$[ebp]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _TCPPack$[ebp]
	mov	BYTE PTR [ecx+7], al
; Line 2197
	mov	edx, DWORD PTR _acknum$[ebp]
	shr	edx, 24					; 00000018H
	and	edx, 255				; 000000ffH
	mov	eax, DWORD PTR _TCPPack$[ebp]
	mov	BYTE PTR [eax+8], dl
; Line 2198
	mov	ecx, DWORD PTR _acknum$[ebp]
	shr	ecx, 16					; 00000010H
	and	ecx, 255				; 000000ffH
	mov	edx, DWORD PTR _TCPPack$[ebp]
	mov	BYTE PTR [edx+9], cl
; Line 2199
	mov	eax, DWORD PTR _acknum$[ebp]
	shr	eax, 8
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _TCPPack$[ebp]
	mov	BYTE PTR [ecx+10], al
; Line 2200
	mov	edx, DWORD PTR _acknum$[ebp]
	and	edx, 255				; 000000ffH
	mov	eax, DWORD PTR _TCPPack$[ebp]
	mov	BYTE PTR [eax+11], dl
; Line 2204
	mov	ecx, DWORD PTR _numbytesoptions$[ebp]
	and	ecx, -2147483645			; 80000003H
	jns	SHORT $L3084
	dec	ecx
	or	ecx, -4					; fffffffcH
	inc	ecx
$L3084:
	test	ecx, ecx
	jle	SHORT $L2656
; Line 2205
	movsx	edx, BYTE PTR _HeaderLength$[ebp]
	add	edx, 1
	mov	BYTE PTR _HeaderLength$[ebp], dl
$L2656:
; Line 2206
	movsx	eax, BYTE PTR _HeaderLength$[ebp]
	shl	eax, 4
	and	eax, 240				; 000000f0H
	mov	ecx, DWORD PTR _TCPPack$[ebp]
	mov	BYTE PTR [ecx+12], al
; Line 2209
	movsx	edx, BYTE PTR _Flags$[ebp]
	and	edx, 63					; 0000003fH
	mov	eax, DWORD PTR _TCPPack$[ebp]
	mov	BYTE PTR [eax+13], dl
; Line 2210
	mov	ecx, DWORD PTR _Window$[ebp]
	and	ecx, 65535				; 0000ffffH
	sar	ecx, 8
	and	ecx, 255				; 000000ffH
	mov	edx, DWORD PTR _TCPPack$[ebp]
	mov	BYTE PTR [edx+14], cl
; Line 2211
	mov	eax, DWORD PTR _Window$[ebp]
	and	eax, 65535				; 0000ffffH
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _TCPPack$[ebp]
	mov	BYTE PTR [ecx+15], al
; Line 2214
	mov	edx, DWORD PTR _TCPPack$[ebp]
	mov	BYTE PTR [edx+18], 0
; Line 2215
	mov	eax, DWORD PTR _TCPPack$[ebp]
	mov	BYTE PTR [eax+19], 0
; Line 2218
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L2657
$L2658:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L2657:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _numbytesoptions$[ebp]
	jge	SHORT $L2659
; Line 2220
	mov	eax, DWORD PTR _TCPPack$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _options$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	dl, BYTE PTR [ecx]
	mov	BYTE PTR [eax+20], dl
; Line 2221
	jmp	SHORT $L2658
$L2659:
; Line 2223
	mov	DWORD PTR _k$[ebp], 0
	jmp	SHORT $L2660
$L2661:
	mov	eax, DWORD PTR _k$[ebp]
	add	eax, 1
	mov	DWORD PTR _k$[ebp], eax
$L2660:
	mov	ecx, DWORD PTR _numbytesoptions$[ebp]
	and	ecx, -2147483645			; 80000003H
	jns	SHORT $L3085
	dec	ecx
	or	ecx, -4					; fffffffcH
	inc	ecx
$L3085:
	mov	edx, 4
	sub	edx, ecx
	cmp	DWORD PTR _k$[ebp], edx
	jge	SHORT $L2662
; Line 2225
	mov	eax, DWORD PTR _TCPPack$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	mov	BYTE PTR [eax+20], 0
; Line 2226
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
; Line 2227
	jmp	SHORT $L2661
$L2662:
; Line 2229
	movsx	edx, BYTE PTR _HeaderLength$[ebp]
	shl	edx, 2
	mov	DWORD PTR _StartofData$[ebp], edx
; Line 2232
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L2663
$L2664:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L2663:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _datasize$[ebp]
	jge	SHORT $L2665
; Line 2234
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, DWORD PTR _rIndex$[ebp]
	mov	eax, DWORD PTR _StartofData$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _TCPPack$[ebp]
	mov	esi, DWORD PTR _data$[ebp]
	mov	dl, BYTE PTR [esi+edx]
	mov	BYTE PTR [ecx+eax], dl
; Line 2235
	jmp	SHORT $L2664
$L2665:
; Line 2237
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
; Line 2239
	mov	eax, DWORD PTR _checksum$[ebp]
	sar	eax, 8
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _TCPPack$[ebp]
	mov	BYTE PTR [ecx+16], al
; Line 2240
	mov	edx, DWORD PTR _checksum$[ebp]
	and	edx, 255				; 000000ffH
	mov	eax, DWORD PTR _TCPPack$[ebp]
	mov	BYTE PTR [eax+17], dl
; Line 2242
	mov	eax, DWORD PTR _StartofData$[ebp]
	add	eax, DWORD PTR _datasize$[ebp]
; Line 2243
	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	44					; 0000002cH
?FormatTCPPacket@TCPObj@@AAEHPAD00DGKK0HHH@Z ENDP	; TCPObj::FormatTCPPacket
_TEXT	ENDS
PUBLIC	?SendN@TCPObj@@AAEHHH@Z				; TCPObj::SendN
EXTRN	?FormatEthPacketN@EtherObj@@QAEHPADHH0JHHH@Z:NEAR ; EtherObj::FormatEthPacketN
_BSS	SEGMENT
$SG2687	DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2706	DB	'TDL is FULL SendN', 00H
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
; Line 2248
	push	ebp
	mov	ebp, esp
	sub	esp, 532				; 00000214H
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2249
	lea	ecx, DWORD PTR _task$[ebp]
	call	??0AOATask@@QAE@XZ			; AOATask::AOATask
; Line 2250
	lea	ecx, DWORD PTR _tsk$[ebp]
	call	??0apptask@@QAE@XZ			; apptask::apptask
; Line 2251
	lea	ecx, DWORD PTR _EO$[ebp]
	call	??0EtherObj@@QAE@XZ			; EtherObj::EtherObj
; Line 2257
	lea	eax, DWORD PTR _c3$[ebp]
	mov	DWORD PTR _p1$[ebp], eax
; Line 2258
	lea	ecx, DWORD PTR _c4$[ebp]
	mov	DWORD PTR _send_buffer$[ebp], ecx
; Line 2260
	mov	DWORD PTR _x$[ebp], 0
; Line 2261
	mov	DWORD PTR _i$[ebp], 0
	mov	DWORD PTR _j$[ebp], 0
; Line 2262
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2265
	mov	DWORD PTR _TCPPack_size$[ebp], 0
; Line 2266
	mov	dl, BYTE PTR $SG2687
	mov	BYTE PTR _options$[ebp], dl
; Line 2267
	mov	DWORD PTR _InPtr$[ebp], 0
; Line 2270
	lea	eax, DWORD PTR _c1$[ebp]
	mov	DWORD PTR _sendbuffer$[ebp], eax
; Line 2273
	mov	ecx, DWORD PTR _TCBRecordNum$[ebp]
	imul	ecx, 288				; 00000120H
	mov	edx, DWORD PTR ?TCBBase@TCPObj@@0KA	; TCPObj::TCBBase
	add	edx, ecx
	mov	DWORD PTR _tcb$[ebp], edx
; Line 2274
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+52], eax
; Line 2275
	xor	edx, edx
	test	edx, edx
	je	SHORT $L2694
; Line 2276
	push	1860					; 00000744H
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+24]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
$L2694:
; Line 2279
	mov	edx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [edx], 0
	jne	SHORT $L2695
; Line 2281
	mov	eax, -37				; ffffffdbH
	jmp	$L2672
$L2695:
; Line 2284
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR _TCBRecordNum$[ebp]
	cmp	ecx, DWORD PTR [eax+8]
	je	SHORT $L2696
; Line 2287
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
; Line 2288
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L2697
; Line 2289
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L2672
$L2697:
; Line 2292
	mov	ecx, DWORD PTR _TCBRecordNum$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DeleteTCB@TCPObj@@QAEHH@Z		; TCPObj::DeleteTCB
; Line 2294
	mov	eax, -36				; ffffffdcH
	jmp	$L2672
$L2696:
; Line 2298
	mov	edx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [edx+200], 0
	jne	SHORT $L2698
; Line 2300
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+240]
	mov	DWORD PTR _sendbuffer$[ebp], ecx
; Line 2302
	jmp	SHORT $L2700
$L2698:
	mov	edx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [edx+200], 1
	jne	SHORT $L2700
; Line 2304
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+244]
	mov	DWORD PTR _sendbuffer$[ebp], ecx
$L2700:
; Line 2307
	mov	edx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [edx+216], 0
	jne	SHORT $L2701
; Line 2309
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+212]
	mov	DWORD PTR [eax+284], edx
; Line 2311
	jmp	SHORT $L2702
$L2701:
; Line 2313
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+212]
	add	ecx, 1
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+284], ecx
$L2702:
; Line 2316
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+204]
	mov	DWORD PTR [eax+228], edx
; Line 2317
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+208]
	mov	DWORD PTR [eax+232], edx
; Line 2318
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+236], 16			; 00000010H
; Line 2321
	mov	ecx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [ecx+24], 5
	je	SHORT $L2704
	mov	edx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [edx+24], 6
	jne	$L2703
$L2704:
; Line 2324
	mov	BYTE PTR _SrcPortNum$[ebp], 0
; Line 2325
	mov	BYTE PTR _SrcPortNum$[ebp+1], 80	; 00000050H
; Line 2326
	lea	ecx, DWORD PTR _EO$[ebp]
	call	?TDLFull@EtherObj@@QAEHXZ		; EtherObj::TDLFull
	cmp	eax, 1
	jne	SHORT $L2705
; Line 2328
	push	3540					; 00000dd4H
	push	OFFSET FLAT:$SG2706
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 2329
	mov	eax, -29				; ffffffe3H
	jmp	$L2672
$L2705:
; Line 2331
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L2707
$L2708:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L2707:
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR [ecx+212]
	jae	$L2709
; Line 2334
	mov	eax, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [eax+200], 1
	jne	SHORT $L2710
	mov	ecx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [ecx+88], 1
	je	SHORT $L2710
; Line 2345
	int	-11					; fffffff5H
$L2710:
; Line 2348
	mov	edx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [edx+220], 1
	jne	SHORT $L2711
	mov	eax, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [eax+216], 0
	jne	SHORT $L2711
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+212]
	sub	edx, 1
	cmp	DWORD PTR _i$[ebp], edx
	jne	SHORT $L2711
; Line 2349
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+236]
	or	ecx, 1
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+236], ecx
$L2711:
; Line 2351
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	imul	eax, 1460				; 000005b4H
	cmp	eax, 5000				; 00001388H
	jle	SHORT $L2712
; Line 2352
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+236]
	or	edx, 8
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+236], edx
$L2712:
; Line 2354
	mov	ecx, DWORD PTR ?SendInPtr@EtherObj@@2JA	; EtherObj::SendInPtr
	shl	ecx, 4
	mov	edx, DWORD PTR ?TDLPointer@EtherObj@@2JA ; EtherObj::TDLPointer
	lea	eax, DWORD PTR [edx+ecx-1114112]
	mov	DWORD PTR _x$[ebp], eax
; Line 2357
	mov	ecx, DWORD PTR _x$[ebp]
	add	ecx, 1114112				; 00110000H
	mov	edx, DWORD PTR ?TDLPointer@EtherObj@@2JA ; EtherObj::TDLPointer
	add	edx, 65520				; 0000fff0H
	cmp	ecx, edx
	jle	SHORT $L2713
; Line 2359
	mov	eax, -12				; fffffff4H
	jmp	$L2672
$L2713:
; Line 2362
	mov	eax, DWORD PTR _x$[ebp]
	mov	DWORD PTR _p1$[ebp], eax
; Line 2365
	mov	ecx, DWORD PTR ?TDLDataPointer@EtherObj@@2JA ; EtherObj::TDLDataPointer
	add	ecx, 6553600				; 00640000H
	mov	edx, DWORD PTR _p1$[ebp]
	cmp	DWORD PTR [edx], ecx
	jl	SHORT $L2715
; Line 2367
	mov	eax, -13				; fffffff3H
	jmp	$L2672
$L2715:
; Line 2370
	mov	eax, DWORD PTR _p1$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _send_buffer$[ebp], ecx
; Line 2372
	mov	edx, DWORD PTR ?SendInPtr@EtherObj@@2JA	; EtherObj::SendInPtr
	mov	DWORD PTR _InPtr$[ebp], edx
; Line 2374
	mov	eax, DWORD PTR ?SendInPtr@EtherObj@@2JA	; EtherObj::SendInPtr
	add	eax, 1
	mov	DWORD PTR ?SendInPtr@EtherObj@@2JA, eax	; EtherObj::SendInPtr
; Line 2376
	cmp	DWORD PTR ?SendInPtr@EtherObj@@2JA, 4096 ; EtherObj::SendInPtr, 00001000H
	jne	SHORT $L2717
; Line 2378
	mov	DWORD PTR ?SendInPtr@EtherObj@@2JA, 0	; EtherObj::SendInPtr
$L2717:
; Line 2382
	mov	ecx, DWORD PTR _send_buffer$[ebp]
	sub	ecx, 1114078				; 0010ffdeH
	mov	DWORD PTR _send_buffer$[ebp], ecx
; Line 2385
	mov	edx, DWORD PTR _currenttask$[ebp]
	push	edx
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+228]
	push	ecx
	push	1460					; 000005b4H
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
; Line 2389
	mov	edx, DWORD PTR _send_buffer$[ebp]
	sub	edx, 20					; 00000014H
	mov	DWORD PTR _send_buffer$[ebp], edx
; Line 2394
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
; Line 2395
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L2718
; Line 2396
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L2672
$L2718:
; Line 2398
	mov	edx, DWORD PTR _send_buffer$[ebp]
	sub	edx, 14					; 0000000eH
	mov	DWORD PTR _send_buffer$[ebp], edx
; Line 2401
	mov	eax, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [eax+216], 0
	jne	SHORT $L2719
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+212]
	sub	edx, 1
	cmp	DWORD PTR _i$[ebp], edx
	jne	SHORT $L2719
; Line 2404
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
; Line 2405
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L2720
; Line 2406
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L2672
$L2720:
; Line 2408
	jmp	SHORT $L2725
$L2719:
; Line 2411
	mov	eax, DWORD PTR ?SendCountTotal@TCPObj@@2HA ; TCPObj::SendCountTotal
	add	eax, 1
	mov	DWORD PTR ?SendCountTotal@TCPObj@@2HA, eax ; TCPObj::SendCountTotal
; Line 2436
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
; Line 2437
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L2725
; Line 2444
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L2672
$L2725:
; Line 2448
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+228]
	add	edx, 1460				; 000005b4H
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+228], edx
; Line 2449
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+232]
	add	edx, 1460				; 000005b4H
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+232], edx
; Line 2452
	jmp	$L2708
$L2709:
; Line 2454
	mov	ecx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [ecx+216], 0
	je	$L2735
; Line 2456
	mov	edx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [edx+220], 1
	jne	SHORT $L2727
; Line 2457
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+236]
	or	ecx, 1
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+236], ecx
$L2727:
; Line 2459
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 1460				; 000005b4H
	mov	ecx, DWORD PTR _tcb$[ebp]
	add	eax, DWORD PTR [ecx+216]
	cmp	eax, 5000				; 00001388H
	jbe	SHORT $L2728
; Line 2460
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+236]
	or	al, 8
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+236], eax
$L2728:
; Line 2462
	mov	edx, DWORD PTR ?SendInPtr@EtherObj@@2JA	; EtherObj::SendInPtr
	shl	edx, 4
	mov	eax, DWORD PTR ?TDLPointer@EtherObj@@2JA ; EtherObj::TDLPointer
	lea	ecx, DWORD PTR [eax+edx-1114112]
	mov	DWORD PTR _x$[ebp], ecx
; Line 2465
	mov	edx, DWORD PTR _x$[ebp]
	add	edx, 1114112				; 00110000H
	mov	eax, DWORD PTR ?TDLPointer@EtherObj@@2JA ; EtherObj::TDLPointer
	add	eax, 65520				; 0000fff0H
	cmp	edx, eax
	jle	SHORT $L2729
; Line 2467
	mov	eax, -12				; fffffff4H
	jmp	$L2672
$L2729:
; Line 2470
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR _p1$[ebp], ecx
; Line 2473
	mov	edx, DWORD PTR ?TDLDataPointer@EtherObj@@2JA ; EtherObj::TDLDataPointer
	add	edx, 6553600				; 00640000H
	mov	eax, DWORD PTR _p1$[ebp]
	cmp	DWORD PTR [eax], edx
	jl	SHORT $L2731
; Line 2475
	mov	eax, -13				; fffffff3H
	jmp	$L2672
$L2731:
; Line 2478
	mov	ecx, DWORD PTR _p1$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR _send_buffer$[ebp], edx
; Line 2480
	mov	eax, DWORD PTR ?SendInPtr@EtherObj@@2JA	; EtherObj::SendInPtr
	mov	DWORD PTR _InPtr$[ebp], eax
; Line 2482
	mov	ecx, DWORD PTR ?SendInPtr@EtherObj@@2JA	; EtherObj::SendInPtr
	add	ecx, 1
	mov	DWORD PTR ?SendInPtr@EtherObj@@2JA, ecx	; EtherObj::SendInPtr
; Line 2484
	cmp	DWORD PTR ?SendInPtr@EtherObj@@2JA, 4096 ; EtherObj::SendInPtr, 00001000H
	jne	SHORT $L2733
; Line 2486
	mov	DWORD PTR ?SendInPtr@EtherObj@@2JA, 0	; EtherObj::SendInPtr
$L2733:
; Line 2490
	mov	edx, DWORD PTR _send_buffer$[ebp]
	sub	edx, 1114078				; 0010ffdeH
	mov	DWORD PTR _send_buffer$[ebp], edx
; Line 2493
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
; Line 2497
	mov	edx, DWORD PTR _send_buffer$[ebp]
	sub	edx, 20					; 00000014H
	mov	DWORD PTR _send_buffer$[ebp], edx
; Line 2502
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
; Line 2503
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L2734
; Line 2504
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	SHORT $L2672
$L2734:
; Line 2506
	mov	edx, DWORD PTR _send_buffer$[ebp]
	sub	edx, 14					; 0000000eH
	mov	DWORD PTR _send_buffer$[ebp], edx
; Line 2508
	mov	eax, DWORD PTR ?SendCountTotal@TCPObj@@2HA ; TCPObj::SendCountTotal
	add	eax, 1
	mov	DWORD PTR ?SendCountTotal@TCPObj@@2HA, eax ; TCPObj::SendCountTotal
; Line 2532
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
; Line 2533
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L2735
; Line 2540
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	SHORT $L2672
$L2735:
; Line 2545
	xor	eax, eax
	jmp	SHORT $L2672
$L2703:
; Line 2548
	xor	eax, eax
$L2672:
; Line 2549
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
; Line 2555
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2557
	mov	eax, DWORD PTR _TCBRecordNum$[ebp]
	imul	eax, 288				; 00000120H
	mov	ecx, DWORD PTR ?TCBBase@TCPObj@@0KA	; TCPObj::TCBBase
	add	ecx, eax
	mov	DWORD PTR _tcb$[ebp], ecx
; Line 2558
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+28]
; Line 2559
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
; Line 2571
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	mov	DWORD PTR _this$[ebp], ecx
; Line 2572
	mov	DWORD PTR _MAXVal$[ebp], -1
; Line 2573
	mov	DWORD PTR _MIDVal$[ebp], 2147483647	; 7fffffffH
; Line 2574
	mov	DWORD PTR _LeastVal$[ebp], 0
; Line 2577
	mov	eax, DWORD PTR _seq1$[ebp]
	cmp	eax, DWORD PTR _seq2$[ebp]
	jne	SHORT $L2751
; Line 2578
	xor	eax, eax
	jmp	$L2747
$L2751:
; Line 2580
	mov	ecx, DWORD PTR _seq1$[ebp]
	cmp	ecx, DWORD PTR _MIDVal$[ebp]
	ja	SHORT $L2752
	mov	edx, DWORD PTR _seq1$[ebp]
	cmp	edx, DWORD PTR _LeastVal$[ebp]
	jb	SHORT $L2752
	mov	eax, DWORD PTR _seq2$[ebp]
	cmp	eax, DWORD PTR _MIDVal$[ebp]
	ja	SHORT $L2752
	mov	ecx, DWORD PTR _seq2$[ebp]
	cmp	ecx, DWORD PTR _LeastVal$[ebp]
	jb	SHORT $L2752
; Line 2582
	mov	edx, DWORD PTR _seq1$[ebp]
	cmp	edx, DWORD PTR _seq2$[ebp]
	jae	SHORT $L2753
; Line 2584
	or	eax, -1
	jmp	$L2747
$L2753:
; Line 2586
	mov	eax, DWORD PTR _seq1$[ebp]
	sub	eax, DWORD PTR _seq2$[ebp]
	jmp	$L2747
$L2752:
; Line 2588
	mov	eax, DWORD PTR _seq1$[ebp]
	cmp	eax, DWORD PTR _MIDVal$[ebp]
	jbe	SHORT $L2755
	mov	ecx, DWORD PTR _seq1$[ebp]
	cmp	ecx, DWORD PTR _MAXVal$[ebp]
	ja	SHORT $L2755
	mov	edx, DWORD PTR _seq2$[ebp]
	cmp	edx, DWORD PTR _MIDVal$[ebp]
	jbe	SHORT $L2755
	mov	eax, DWORD PTR _seq2$[ebp]
	cmp	eax, DWORD PTR _MAXVal$[ebp]
	ja	SHORT $L2755
; Line 2590
	mov	ecx, DWORD PTR _seq1$[ebp]
	cmp	ecx, DWORD PTR _seq2$[ebp]
	jae	SHORT $L2756
; Line 2592
	or	eax, -1
	jmp	SHORT $L2747
$L2756:
; Line 2596
	jmp	SHORT $L2760
$L2755:
	mov	edx, DWORD PTR _MIDVal$[ebp]
	shr	edx, 1
	cmp	DWORD PTR _seq2$[ebp], edx
	jb	SHORT $L2758
	mov	eax, DWORD PTR _seq2$[ebp]
	cmp	eax, DWORD PTR _MIDVal$[ebp]
	ja	SHORT $L2758
	mov	ecx, DWORD PTR _seq1$[ebp]
	cmp	ecx, DWORD PTR _MIDVal$[ebp]
	jb	SHORT $L2758
	mov	edx, DWORD PTR _MIDVal$[ebp]
	imul	edx, 3
	shr	edx, 1
	cmp	DWORD PTR _seq1$[ebp], edx
	ja	SHORT $L2758
; Line 2598
	mov	eax, DWORD PTR _seq1$[ebp]
	sub	eax, DWORD PTR _seq2$[ebp]
	jmp	SHORT $L2747
$L2758:
; Line 2600
	mov	eax, DWORD PTR _seq1$[ebp]
	cmp	eax, DWORD PTR _LeastVal$[ebp]
	jb	SHORT $L2760
	mov	ecx, DWORD PTR _MIDVal$[ebp]
	shr	ecx, 1
	cmp	DWORD PTR _seq1$[ebp], ecx
	ja	SHORT $L2760
	mov	edx, DWORD PTR _seq2$[ebp]
	cmp	edx, DWORD PTR _MAXVal$[ebp]
	ja	SHORT $L2760
	mov	eax, DWORD PTR _MIDVal$[ebp]
	imul	eax, 3
	shr	eax, 1
	cmp	DWORD PTR _seq2$[ebp], eax
	jb	SHORT $L2760
; Line 2602
	mov	eax, DWORD PTR _MAXVal$[ebp]
	sub	eax, DWORD PTR _seq2$[ebp]
	mov	ecx, DWORD PTR _seq1$[ebp]
	sub	ecx, DWORD PTR _LeastVal$[ebp]
	add	eax, ecx
	jmp	SHORT $L2747
$L2760:
; Line 2604
	or	eax, -1
$L2747:
; Line 2605
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
; Line 2612
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2614
	mov	eax, DWORD PTR _TCBRecordNum$[ebp]
	imul	eax, 288				; 00000120H
	mov	ecx, DWORD PTR ?TCBBase@TCPObj@@0KA	; TCPObj::TCBBase
	add	ecx, eax
	mov	DWORD PTR _tcb$[ebp], ecx
; Line 2615
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+104]
; Line 2616
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
; Line 2624
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2629
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	sub	eax, DWORD PTR _LST$[ebp]
	mov	DWORD PTR _RTT$[ebp], eax
; Line 2630
	mov	eax, DWORD PTR _RTT$[ebp]
; Line 2631
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
; Line 2637
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 2643
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	sub	eax, DWORD PTR _LST$[ebp]
	sub	eax, DWORD PTR _SRTT$[ebp]
	mov	DWORD PTR _a$[ebp], eax
; Line 2644
	cmp	DWORD PTR _a$[ebp], 0
	jb	SHORT $L2784
; Line 2645
	mov	eax, DWORD PTR _DIFF$[ebp]
	add	eax, DWORD PTR _a$[ebp]
	mov	DWORD PTR _Diff$[ebp], eax
; Line 2646
	jmp	SHORT $L2785
$L2784:
; Line 2647
	mov	ecx, DWORD PTR _DIFF$[ebp]
	sub	ecx, DWORD PTR _a$[ebp]
	mov	DWORD PTR _Diff$[ebp], ecx
$L2785:
; Line 2648
	mov	eax, DWORD PTR _Diff$[ebp]
; Line 2649
	mov	esp, ebp
	pop	ebp
	ret	12					; 0000000cH
?CalcDiff@TCPObj@@AAEKKKK@Z ENDP			; TCPObj::CalcDiff
_TEXT	ENDS
PUBLIC	?tcpSendN@TCPObj@@QAEHHH@Z			; TCPObj::tcpSendN
PUBLIC	?sendPayload4@TCPObj@@AAEHHKH@Z			; TCPObj::sendPayload4
PUBLIC	?sendPayload3@TCPObj@@AAEHHKH@Z			; TCPObj::sendPayload3
PUBLIC	?sendHeader1@TCPObj@@AAEHHKKH@Z			; TCPObj::sendHeader1
EXTRN	?Current_Tcbrno@apptask@@2HA:DWORD		; apptask::Current_Tcbrno
EXTRN	?AOAsuspendHTask@AOATask@@QAEXKJHH@Z:NEAR	; AOATask::AOAsuspendHTask
_DATA	SEGMENT
	ORG $+2
$SG2807	DB	'tcpSendN Avail = 0', 00H
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
; Line 2675
	push	ebp
	mov	ebp, esp
	sub	esp, 524				; 0000020cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 2676
	lea	ecx, DWORD PTR _task$[ebp]
	call	??0AOATask@@QAE@XZ			; AOATask::AOATask
; Line 2677
	lea	ecx, DWORD PTR _tsk$[ebp]
	call	??0apptask@@QAE@XZ			; apptask::apptask
; Line 2680
	mov	DWORD PTR _tcbrno$[ebp], 0
; Line 2681
	mov	eax, DWORD PTR _TCBRecordNum$[ebp]
	mov	DWORD PTR _tcbrno$[ebp], eax
; Line 2682
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2683
	mov	DWORD PTR _k$[ebp], 0
; Line 2684
	mov	DWORD PTR _tempvalue$[ebp], 0
; Line 2685
	mov	DWORD PTR _q$[ebp], 0
; Line 2686
	mov	DWORD PTR _s1$[ebp], 0
; Line 2687
	mov	DWORD PTR _r$[ebp], 0
; Line 2692
	mov	ecx, DWORD PTR _tcbrno$[ebp]
	imul	ecx, 288				; 00000120H
	mov	edx, DWORD PTR ?TCBBase@TCPObj@@0KA	; TCPObj::TCBBase
	add	edx, ecx
	mov	DWORD PTR _tcb$[ebp], edx
; Line 2693
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+272], 0
; Line 2694
	mov	ecx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [ecx], 0
	jne	$L2805
; Line 2696
	push	3220					; 00000c94H
	mov	edx, DWORD PTR _TCBRecordNum$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 2697
	push	3240					; 00000ca8H
	mov	eax, DWORD PTR _tcb$[ebp]
	movsx	ecx, BYTE PTR [eax+18]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 2698
	push	3260					; 00000cbcH
	mov	edx, DWORD PTR _tcb$[ebp]
	movsx	eax, BYTE PTR [edx+19]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 2699
	push	3280					; 00000cd0H
	mov	ecx, DWORD PTR _tcb$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 2700
	push	3300					; 00000ce4H
	push	OFFSET FLAT:$SG2807
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 2701
	mov	DWORD PTR ?Application_Status@AOAProtected@@2HA, 2 ; AOAProtected::Application_Status
; Line 2702
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAExit@AOAProtected@@QAEXXZ		; AOAProtected::AOAExit
; Line 2703
	mov	eax, -38				; ffffffdaH
	jmp	$L2790
$L2805:
; Line 2706
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR _tcbrno$[ebp]
	cmp	eax, DWORD PTR [edx+8]
	je	SHORT $L2808
; Line 2710
	mov	eax, -33				; ffffffdfH
	jmp	$L2790
$L2808:
; Line 2713
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+80], 0
; Line 2714
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+252], 1
; Line 2715
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+168], 0
; Line 2716
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+188], 0
; Line 2717
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+192], 0
; Line 2718
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+196], 0
; Line 2721
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+116], eax
; Line 2722
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+100]
	mov	DWORD PTR [edx+148], ecx
; Line 2723
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+148]
	mov	ecx, DWORD PTR _tcb$[ebp]
	add	eax, DWORD PTR [ecx+184]
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+152], eax
; Line 2724
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+148]
	mov	edx, DWORD PTR _tcb$[ebp]
	add	ecx, DWORD PTR [edx+184]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+160], ecx
; Line 2725
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+152]
	mov	eax, DWORD PTR _tcb$[ebp]
	add	edx, DWORD PTR [eax+268]
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+164], edx
; Line 2730
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+276], 0
; Line 2731
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+272], 1
; Line 2732
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+280], 0
; Line 2733
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+116], eax
$L2810:
; Line 2734
	mov	eax, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [eax+276], 0
	jne	$L2811
; Line 2739
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+272]
	mov	DWORD PTR -524+[ebp], edx
	cmp	DWORD PTR -524+[ebp], 1
	je	SHORT $L2816
	cmp	DWORD PTR -524+[ebp], 2
	je	$L2854
	jmp	$L2813
$L2816:
; Line 2741
	xor	eax, eax
	test	eax, eax
	je	SHORT $L2817
; Line 2742
	push	1860					; 00000744H
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+272]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
$L2817:
; Line 2753
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+184]
	mov	edx, DWORD PTR _tcb$[ebp]
	add	ecx, DWORD PTR [edx+268]
	mov	eax, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [eax+104], ecx
	jb	$L2818
	mov	ecx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [ecx+280], 0
	jne	$L2818
; Line 2755
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+156], 1
; Line 2756
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+280], 1
; Line 2757
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
; Line 2758
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L2819
; Line 2760
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+272], 4
; Line 2761
	mov	eax, DWORD PTR _tcbrno$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DeleteTCB@TCPObj@@QAEHH@Z		; TCPObj::DeleteTCB
; Line 2762
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L2790
$L2819:
; Line 2764
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
; Line 2765
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L2820
; Line 2767
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+272], 4
; Line 2768
	mov	ecx, DWORD PTR _tcbrno$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DeleteTCB@TCPObj@@QAEHH@Z		; TCPObj::DeleteTCB
; Line 2769
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L2790
$L2820:
; Line 2778
	jmp	$L2853
$L2818:
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [edx+104]
	cmp	ecx, DWORD PTR [eax+184]
	jae	$L2822
	mov	edx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [edx+280], 0
	jne	$L2822
; Line 2780
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+156], 2
; Line 2781
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+280], 1
; Line 2782
	mov	edx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [edx+104], 0
	jne	SHORT $L2823
; Line 2784
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
; Line 2785
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L2824
; Line 2787
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+272], 4
; Line 2788
	mov	eax, DWORD PTR _tcbrno$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DeleteTCB@TCPObj@@QAEHH@Z		; TCPObj::DeleteTCB
; Line 2789
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L2790
$L2824:
; Line 2792
	jmp	$L2826
$L2823:
; Line 2794
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+148]
	mov	eax, DWORD PTR _tcb$[ebp]
	add	edx, DWORD PTR [eax+104]
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+196], edx
; Line 2795
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+196]
	push	edx
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+148]
	push	ecx
	mov	edx, DWORD PTR _tcbrno$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?sendHeader1@TCPObj@@AAEHHKKH@Z		; TCPObj::sendHeader1
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2796
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L2826
; Line 2798
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+272], 4
; Line 2799
	mov	ecx, DWORD PTR _tcbrno$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DeleteTCB@TCPObj@@QAEHH@Z		; TCPObj::DeleteTCB
; Line 2800
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L2790
$L2826:
; Line 2811
	jmp	$L2853
$L2822:
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [edx+104]
	cmp	ecx, DWORD PTR [eax+184]
	jbe	$L2828
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+184]
	mov	ecx, DWORD PTR _tcb$[ebp]
	add	eax, DWORD PTR [ecx+268]
	mov	edx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [edx+104], eax
	jae	$L2828
	mov	eax, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [eax+280], 0
	jne	$L2828
; Line 2813
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+156], 3
; Line 2814
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+280], 1
; Line 2815
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+160]
	push	eax
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+148]
	push	edx
	mov	eax, DWORD PTR _tcbrno$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?sendHeader1@TCPObj@@AAEHHKKH@Z		; TCPObj::sendHeader1
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2816
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L2829
; Line 2818
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+272], 4
; Line 2819
	mov	edx, DWORD PTR _tcbrno$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DeleteTCB@TCPObj@@QAEHH@Z		; TCPObj::DeleteTCB
; Line 2820
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L2790
$L2829:
; Line 2822
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+148]
	mov	edx, DWORD PTR _tcb$[ebp]
	add	ecx, DWORD PTR [edx+104]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+196], ecx
; Line 2823
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+152]
	push	ecx
	mov	edx, DWORD PTR _tcbrno$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?sendPayload3@TCPObj@@AAEHHKH@Z		; TCPObj::sendPayload3
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2824
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L2830
; Line 2826
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+272], 4
; Line 2827
	mov	ecx, DWORD PTR _tcbrno$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DeleteTCB@TCPObj@@QAEHH@Z		; TCPObj::DeleteTCB
; Line 2828
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L2790
$L2830:
; Line 2836
	jmp	$L2853
$L2828:
; Line 2837
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+188]
	mov	ecx, DWORD PTR _tcb$[ebp]
	add	eax, DWORD PTR [ecx+104]
	mov	edx, DWORD PTR _tcb$[ebp]
	cmp	eax, DWORD PTR [edx+184]
	jae	$L2832
	mov	eax, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [eax+172], -1
	jne	$L2832
	mov	ecx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [ecx+280], 1
	jne	$L2832
; Line 2839
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+156], 4
; Line 2840
	mov	eax, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [eax+104], 0
	jne	SHORT $L2833
; Line 2842
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
; Line 2843
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L2834
; Line 2845
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+272], 4
; Line 2846
	mov	ecx, DWORD PTR _tcbrno$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DeleteTCB@TCPObj@@QAEHH@Z		; TCPObj::DeleteTCB
; Line 2847
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L2790
$L2834:
; Line 2850
	jmp	$L2836
$L2833:
; Line 2852
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+148]
	mov	ecx, DWORD PTR _tcb$[ebp]
	add	eax, DWORD PTR [ecx+188]
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+192], eax
; Line 2853
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+192]
	mov	edx, DWORD PTR _tcb$[ebp]
	add	ecx, DWORD PTR [edx+104]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+196], ecx
; Line 2854
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
; Line 2855
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L2836
; Line 2857
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+272], 4
; Line 2858
	mov	eax, DWORD PTR _tcbrno$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DeleteTCB@TCPObj@@QAEHH@Z		; TCPObj::DeleteTCB
; Line 2859
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L2790
$L2836:
; Line 2868
	jmp	$L2853
$L2832:
; Line 2869
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+188]
	mov	eax, DWORD PTR _tcb$[ebp]
	add	edx, DWORD PTR [eax+104]
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [ecx+184]
	mov	ecx, DWORD PTR _tcb$[ebp]
	add	eax, DWORD PTR [ecx+268]
	cmp	edx, eax
	jb	$L2838
	mov	edx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [edx+172], -1
	jne	$L2838
	mov	eax, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [eax+280], 1
	jne	$L2838
; Line 2871
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+156], 5
; Line 2872
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+148]
	mov	ecx, DWORD PTR _tcb$[ebp]
	add	eax, DWORD PTR [ecx+188]
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+192], eax
; Line 2873
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+160]
	push	eax
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+192]
	push	edx
	mov	eax, DWORD PTR _tcbrno$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?sendHeader1@TCPObj@@AAEHHKKH@Z		; TCPObj::sendHeader1
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2874
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L2839
; Line 2876
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+272], 4
; Line 2877
	mov	edx, DWORD PTR _tcbrno$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DeleteTCB@TCPObj@@QAEHH@Z		; TCPObj::DeleteTCB
; Line 2878
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L2790
$L2839:
; Line 2880
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+152]
	push	eax
	mov	ecx, DWORD PTR _tcbrno$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?sendPayload4@TCPObj@@AAEHHKH@Z		; TCPObj::sendPayload4
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2881
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L2840
; Line 2883
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+272], 4
; Line 2884
	mov	eax, DWORD PTR _tcbrno$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DeleteTCB@TCPObj@@QAEHH@Z		; TCPObj::DeleteTCB
; Line 2885
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L2790
$L2840:
; Line 2893
	jmp	$L2853
$L2838:
; Line 2894
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+188]
	mov	eax, DWORD PTR _tcb$[ebp]
	add	edx, DWORD PTR [eax+104]
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [ecx+184]
	mov	ecx, DWORD PTR _tcb$[ebp]
	add	eax, DWORD PTR [ecx+268]
	cmp	edx, eax
	jae	$L2842
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+188]
	mov	ecx, DWORD PTR _tcb$[ebp]
	add	eax, DWORD PTR [ecx+104]
	mov	edx, DWORD PTR _tcb$[ebp]
	cmp	eax, DWORD PTR [edx+184]
	jbe	$L2842
	mov	eax, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [eax+172], -1
	jne	$L2842
	mov	ecx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [ecx+280], 1
	jne	$L2842
; Line 2896
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+156], 6
; Line 2897
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+148]
	mov	edx, DWORD PTR _tcb$[ebp]
	add	ecx, DWORD PTR [edx+188]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+192], ecx
; Line 2898
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
; Line 2899
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L2843
; Line 2901
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+272], 4
; Line 2902
	mov	eax, DWORD PTR _tcbrno$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DeleteTCB@TCPObj@@QAEHH@Z		; TCPObj::DeleteTCB
; Line 2903
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L2790
$L2843:
; Line 2905
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+192]
	mov	eax, DWORD PTR _tcb$[ebp]
	add	edx, DWORD PTR [eax+104]
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+196], edx
; Line 2906
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+152]
	push	edx
	mov	eax, DWORD PTR _tcbrno$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?sendPayload3@TCPObj@@AAEHHKH@Z		; TCPObj::sendPayload3
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2907
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L2844
; Line 2909
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+272], 4
; Line 2910
	mov	edx, DWORD PTR _tcbrno$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DeleteTCB@TCPObj@@QAEHH@Z		; TCPObj::DeleteTCB
; Line 2911
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L2790
$L2844:
; Line 2919
	jmp	$L2853
$L2842:
; Line 2920
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+188]
	mov	edx, DWORD PTR _tcb$[ebp]
	add	ecx, DWORD PTR [edx+104]
	mov	eax, DWORD PTR _tcb$[ebp]
	cmp	ecx, DWORD PTR [eax+268]
	jb	$L2846
	mov	ecx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [ecx+176], -1
	jne	$L2846
	mov	edx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [edx+172], -1
	je	$L2846
	mov	eax, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [eax+280], 1
	jne	$L2846
; Line 2922
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+156], 7
; Line 2923
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+152]
	mov	ecx, DWORD PTR _tcb$[ebp]
	add	eax, DWORD PTR [ecx+188]
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+192], eax
; Line 2924
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
; Line 2925
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L2847
; Line 2927
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+272], 4
; Line 2928
	mov	eax, DWORD PTR _tcbrno$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DeleteTCB@TCPObj@@QAEHH@Z		; TCPObj::DeleteTCB
; Line 2929
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L2790
$L2847:
; Line 2938
	jmp	$L2853
$L2846:
; Line 2939
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+188]
	mov	eax, DWORD PTR _tcb$[ebp]
	add	edx, DWORD PTR [eax+104]
	mov	ecx, DWORD PTR _tcb$[ebp]
	cmp	edx, DWORD PTR [ecx+268]
	jae	$L2853
	mov	edx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [edx+176], -1
	jne	$L2853
	mov	eax, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [eax+172], -1
	je	$L2853
	mov	ecx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [ecx+280], 1
	jne	$L2853
; Line 2941
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+156], 8
; Line 2942
	mov	eax, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [eax+104], 0
	jne	SHORT $L2850
; Line 2944
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
; Line 2945
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L2851
; Line 2947
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+272], 4
; Line 2948
	mov	ecx, DWORD PTR _tcbrno$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DeleteTCB@TCPObj@@QAEHH@Z		; TCPObj::DeleteTCB
; Line 2949
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L2790
$L2851:
; Line 2952
	jmp	$L2853
$L2850:
; Line 2954
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+152]
	mov	ecx, DWORD PTR _tcb$[ebp]
	add	eax, DWORD PTR [ecx+188]
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+192], eax
; Line 2955
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+192]
	mov	edx, DWORD PTR _tcb$[ebp]
	add	ecx, DWORD PTR [edx+104]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+196], ecx
; Line 2956
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
; Line 2957
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L2853
; Line 2959
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+272], 4
; Line 2960
	mov	ecx, DWORD PTR _tcbrno$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DeleteTCB@TCPObj@@QAEHH@Z		; TCPObj::DeleteTCB
; Line 2961
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L2790
$L2853:
; Line 2966
	jmp	$L2813
$L2854:
; Line 2968
	mov	edx, DWORD PTR ?NoOfRetransmissions@TCPObj@@2KA ; TCPObj::NoOfRetransmissions
	add	edx, 1
	mov	DWORD PTR ?NoOfRetransmissions@TCPObj@@2KA, edx ; TCPObj::NoOfRetransmissions
; Line 2969
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+28], 175			; 000000afH
; Line 2971
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
	jbe	SHORT $L2855
; Line 2973
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
; Line 2974
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+272], 4
; Line 2975
	mov	edx, DWORD PTR _tcbrno$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DeleteTCB@TCPObj@@QAEHH@Z		; TCPObj::DeleteTCB
; Line 2976
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L2790
$L2855:
; Line 2985
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+188]
	mov	edx, DWORD PTR _tcb$[ebp]
	add	ecx, DWORD PTR [edx+104]
	mov	eax, DWORD PTR _tcb$[ebp]
	cmp	ecx, DWORD PTR [eax+184]
	jae	$L2856
	mov	ecx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [ecx+172], -1
	jne	$L2856
; Line 2987
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+156], 17			; 00000011H
; Line 2988
	mov	eax, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [eax+104], 0
	jne	SHORT $L2857
; Line 2990
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
; Line 2991
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L2858
; Line 2993
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+272], 4
; Line 2994
	mov	ecx, DWORD PTR _tcbrno$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DeleteTCB@TCPObj@@QAEHH@Z		; TCPObj::DeleteTCB
; Line 2995
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L2790
$L2858:
; Line 2998
	jmp	$L2860
$L2857:
; Line 3000
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+148]
	mov	ecx, DWORD PTR _tcb$[ebp]
	add	eax, DWORD PTR [ecx+188]
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+192], eax
; Line 3001
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+192]
	mov	edx, DWORD PTR _tcb$[ebp]
	add	ecx, DWORD PTR [edx+104]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+196], ecx
; Line 3002
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
; Line 3003
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L2860
; Line 3005
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+272], 4
; Line 3006
	mov	eax, DWORD PTR _tcbrno$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DeleteTCB@TCPObj@@QAEHH@Z		; TCPObj::DeleteTCB
; Line 3007
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L2790
$L2860:
; Line 3016
	jmp	$L2873
$L2856:
; Line 3017
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+188]
	mov	eax, DWORD PTR _tcb$[ebp]
	add	edx, DWORD PTR [eax+104]
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [ecx+184]
	mov	ecx, DWORD PTR _tcb$[ebp]
	add	eax, DWORD PTR [ecx+268]
	cmp	edx, eax
	jb	$L2862
	mov	edx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [edx+172], -1
	jne	$L2862
; Line 3019
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+156], 18			; 00000012H
; Line 3020
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+148]
	mov	eax, DWORD PTR _tcb$[ebp]
	add	edx, DWORD PTR [eax+188]
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+192], edx
; Line 3021
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
; Line 3022
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L2863
; Line 3024
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+272], 4
; Line 3025
	mov	ecx, DWORD PTR _tcbrno$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DeleteTCB@TCPObj@@QAEHH@Z		; TCPObj::DeleteTCB
; Line 3026
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L2790
$L2863:
; Line 3028
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
; Line 3029
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L2864
; Line 3031
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+272], 4
; Line 3032
	mov	edx, DWORD PTR _tcbrno$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DeleteTCB@TCPObj@@QAEHH@Z		; TCPObj::DeleteTCB
; Line 3033
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L2790
$L2864:
; Line 3041
	jmp	$L2873
$L2862:
; Line 3042
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+188]
	mov	edx, DWORD PTR _tcb$[ebp]
	add	ecx, DWORD PTR [edx+104]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [eax+184]
	mov	eax, DWORD PTR _tcb$[ebp]
	add	edx, DWORD PTR [eax+268]
	cmp	ecx, edx
	jae	$L2866
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+188]
	mov	eax, DWORD PTR _tcb$[ebp]
	add	edx, DWORD PTR [eax+104]
	mov	ecx, DWORD PTR _tcb$[ebp]
	cmp	edx, DWORD PTR [ecx+184]
	jbe	$L2866
	mov	edx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [edx+172], -1
	jne	$L2866
; Line 3044
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+156], 19			; 00000013H
; Line 3045
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+148]
	mov	eax, DWORD PTR _tcb$[ebp]
	add	edx, DWORD PTR [eax+188]
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+192], edx
; Line 3046
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
; Line 3047
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L2867
; Line 3049
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+272], 4
; Line 3050
	mov	ecx, DWORD PTR _tcbrno$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DeleteTCB@TCPObj@@QAEHH@Z		; TCPObj::DeleteTCB
; Line 3051
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L2790
$L2867:
; Line 3053
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+192]
	mov	ecx, DWORD PTR _tcb$[ebp]
	add	eax, DWORD PTR [ecx+104]
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+196], eax
; Line 3054
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
; Line 3055
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L2868
; Line 3057
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+272], 4
; Line 3058
	mov	eax, DWORD PTR _tcbrno$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DeleteTCB@TCPObj@@QAEHH@Z		; TCPObj::DeleteTCB
; Line 3059
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L2790
$L2868:
; Line 3067
	jmp	$L2873
$L2866:
; Line 3068
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+188]
	mov	eax, DWORD PTR _tcb$[ebp]
	add	edx, DWORD PTR [eax+104]
	mov	ecx, DWORD PTR _tcb$[ebp]
	cmp	edx, DWORD PTR [ecx+268]
	jb	$L2870
	mov	edx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [edx+176], -1
	jne	$L2870
	mov	eax, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [eax+172], -1
	je	$L2870
; Line 3070
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+156], 20			; 00000014H
; Line 3071
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+152]
	mov	ecx, DWORD PTR _tcb$[ebp]
	add	eax, DWORD PTR [ecx+188]
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+192], eax
; Line 3072
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
; Line 3073
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L2871
; Line 3075
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+272], 4
; Line 3076
	mov	eax, DWORD PTR _tcbrno$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DeleteTCB@TCPObj@@QAEHH@Z		; TCPObj::DeleteTCB
; Line 3077
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L2790
$L2871:
; Line 3086
	jmp	$L2873
$L2870:
; Line 3087
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+188]
	mov	eax, DWORD PTR _tcb$[ebp]
	add	edx, DWORD PTR [eax+104]
	mov	ecx, DWORD PTR _tcb$[ebp]
	cmp	edx, DWORD PTR [ecx+268]
	jae	$L2873
	mov	edx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [edx+176], -1
	jne	$L2873
	mov	eax, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [eax+172], -1
	je	$L2873
; Line 3089
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+156], 21			; 00000015H
; Line 3090
	mov	edx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [edx+104], 0
	jne	SHORT $L2874
; Line 3092
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
; Line 3093
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L2875
; Line 3095
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+272], 4
; Line 3096
	mov	eax, DWORD PTR _tcbrno$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DeleteTCB@TCPObj@@QAEHH@Z		; TCPObj::DeleteTCB
; Line 3097
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L2790
$L2875:
; Line 3100
	jmp	$L2877
$L2874:
; Line 3102
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+152]
	mov	eax, DWORD PTR _tcb$[ebp]
	add	edx, DWORD PTR [eax+188]
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+192], edx
; Line 3103
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+192]
	mov	ecx, DWORD PTR _tcb$[ebp]
	add	eax, DWORD PTR [ecx+104]
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+196], eax
; Line 3104
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
; Line 3105
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L2877
; Line 3107
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+272], 4
; Line 3108
	mov	eax, DWORD PTR _tcbrno$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DeleteTCB@TCPObj@@QAEHH@Z		; TCPObj::DeleteTCB
; Line 3109
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L2790
$L2877:
$L2873:
$L2813:
; Line 3119
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+68], 1
; Line 3120
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+272], 3
; Line 3121
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+72], 0
; Line 3122
	xor	ecx, ecx
	test	ecx, ecx
	je	SHORT $L2879
; Line 3123
	push	1860					; 00000744H
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+24]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
$L2879:
; Line 3135
	mov	ecx, DWORD PTR _currenttask$[ebp]
	push	ecx
	mov	edx, DWORD PTR ?Current_Tcbrno@apptask@@2HA ; apptask::Current_Tcbrno
	push	edx
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+24]
	push	ecx
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+28]
	push	eax
	lea	ecx, DWORD PTR _task$[ebp]
	call	?AOAsuspendHTask@AOATask@@QAEXKJHH@Z	; AOATask::AOAsuspendHTask
; Line 3138
	mov	ecx, DWORD PTR ?Current_Tcbrno@apptask@@2HA ; apptask::Current_Tcbrno
	mov	DWORD PTR _tcbrno$[ebp], ecx
; Line 3139
	mov	edx, DWORD PTR _tcbrno$[ebp]
	imul	edx, 288				; 00000120H
	mov	eax, DWORD PTR ?TCBBase@TCPObj@@0KA	; TCPObj::TCBBase
	add	eax, edx
	mov	DWORD PTR _tcb$[ebp], eax
; Line 3140
	mov	ecx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [ecx+272], 3
	je	SHORT $L2882
; Line 3142
	mov	eax, -46				; ffffffd2H
	jmp	$L2790
$L2882:
; Line 3145
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR _tcbrno$[ebp]
	cmp	eax, DWORD PTR [edx+8]
	je	SHORT $L2883
; Line 3147
	mov	eax, -41				; ffffffd7H
	jmp	$L2790
$L2883:
; Line 3149
	mov	ecx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [ecx+68], 1
	jne	SHORT $L2884
	mov	edx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [edx+76], 1
	jne	SHORT $L2884
; Line 3153
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+4]
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
; Line 3154
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+272], 4
; Line 3155
	mov	eax, DWORD PTR _tcbrno$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DeleteTCB@TCPObj@@QAEHH@Z		; TCPObj::DeleteTCB
; Line 3156
	mov	eax, -39				; ffffffd9H
	jmp	$L2790
$L2884:
; Line 3158
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+68], 0
; Line 3160
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+96]
	mov	DWORD PTR [edx+168], ecx
; Line 3161
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+148]
	mov	ecx, DWORD PTR _tcb$[ebp]
	add	eax, DWORD PTR [ecx+184]
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+152], eax
; Line 3162
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+148]
	mov	edx, DWORD PTR _tcb$[ebp]
	add	ecx, DWORD PTR [edx+184]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+160], ecx
; Line 3163
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+152]
	mov	eax, DWORD PTR _tcb$[ebp]
	add	edx, DWORD PTR [eax+268]
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+164], edx
; Line 3164
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+160]
	push	eax
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+168]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?mod32cmp@TCPObj@@AAEKKK@Z		; TCPObj::mod32cmp
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+172], eax
; Line 3165
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+164]
	add	eax, 1
	push	eax
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+168]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?mod32cmp@TCPObj@@AAEKKK@Z		; TCPObj::mod32cmp
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+176], eax
; Line 3166
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+252], 1
; Line 3168
	mov	eax, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [eax+176], -1
	je	SHORT $L2885
; Line 3169
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+80], 1
$L2885:
; Line 3171
	mov	edx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [edx+172], -1
	jne	SHORT $L2886
; Line 3173
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+168]
	push	ecx
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+160]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?mod32cmp@TCPObj@@AAEKKK@Z		; TCPObj::mod32cmp
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [ecx+184]
	sub	edx, eax
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+188], edx
; Line 3174
	mov	ecx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [ecx+188], 0
	jae	SHORT $L2888
; Line 3176
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+188], 0
$L2888:
; Line 3179
	jmp	SHORT $L2890
$L2886:
	mov	eax, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [eax+172], -1
	je	SHORT $L2890
	mov	ecx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [ecx+176], -1
	jne	SHORT $L2890
; Line 3182
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
$L2890:
; Line 3185
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [ecx+100]
	cmp	eax, DWORD PTR [edx+96]
	jne	SHORT $L2892
	mov	ecx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [ecx+80], 1
	jne	SHORT $L2892
; Line 3187
	mov	edx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [edx+24], 9
	jne	SHORT $L2893
; Line 3189
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+80], 0
; Line 3190
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+272], 2
; Line 3192
	jmp	SHORT $L2894
$L2893:
; Line 3194
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+272], 4
; Line 3195
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+276], 1
$L2894:
; Line 3199
	jmp	$L2899
$L2892:
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [ecx+100]
	cmp	eax, DWORD PTR [edx+96]
	jne	SHORT $L2896
	mov	ecx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [ecx+80], 0
	jne	SHORT $L2896
; Line 3201
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+272], 1
; Line 3204
	jmp	$L2899
$L2896:
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	edx, DWORD PTR [eax+100]
	cmp	edx, DWORD PTR [ecx+96]
	jbe	SHORT $L2898
; Line 3206
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+272], 2
; Line 3209
	jmp	SHORT $L2899
$L2898:
; Line 3212
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
; Line 3213
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+272], 4
; Line 3214
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+276], 1
$L2899:
; Line 3219
	jmp	$L2810
$L2811:
; Line 3221
	mov	edx, DWORD PTR _tcbrno$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?DeleteTCB@TCPObj@@QAEHH@Z		; TCPObj::DeleteTCB
; Line 3223
	xor	eax, eax
$L2790:
; Line 3224
	mov	esp, ebp
	pop	ebp
	ret	8
?tcpSendN@TCPObj@@QAEHHH@Z ENDP				; TCPObj::tcpSendN
_TEXT	ENDS
PUBLIC	?printStatistics@TCPObj@@QAEXH@Z		; TCPObj::printStatistics
_TEXT	SEGMENT
_this$ = -4
?printStatistics@TCPObj@@QAEXH@Z PROC NEAR		; TCPObj::printStatistics
; Line 3229
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 3230
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
; Line 3236
	push	ebp
	mov	ebp, esp
	sub	esp, 424				; 000001a8H
	mov	DWORD PTR _this$[ebp], ecx
; Line 3237
	lea	ecx, DWORD PTR _tsk$[ebp]
	call	??0apptask@@QAE@XZ			; apptask::apptask
; Line 3247
	mov	DWORD PTR _retcode$[ebp], 0
; Line 3250
	mov	eax, DWORD PTR _TCBRecordNum$[ebp]
	imul	eax, 288				; 00000120H
	mov	ecx, DWORD PTR ?TCBBase@TCPObj@@0KA	; TCPObj::TCBBase
	add	ecx, eax
	mov	DWORD PTR _tcb$[ebp], ecx
; Line 3252
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+200], 0
; Line 3253
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR _seqnum$[ebp]
	sub	ecx, DWORD PTR [eax+148]
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+204], ecx
; Line 3254
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR _seqnum$[ebp]
	mov	DWORD PTR [eax+208], ecx
; Line 3255
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+212], 0
; Line 3256
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR _k3$[ebp]
	sub	ecx, DWORD PTR [eax+148]
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+216], ecx
; Line 3257
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+220], 0
; Line 3258
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+224], 3
; Line 3260
	mov	edx, DWORD PTR _currenttask$[ebp]
	push	edx
	mov	eax, DWORD PTR _TCBRecordNum$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?SendN@TCPObj@@AAEHHH@Z			; TCPObj::SendN
	mov	DWORD PTR _retcode$[ebp], eax
; Line 3261
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L2916
; Line 3263
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	SHORT $L2910
$L2916:
; Line 3266
	xor	ecx, ecx
	test	ecx, ecx
	je	SHORT $L2917
; Line 3267
	push	4
	mov	edx, DWORD PTR _currenttask$[ebp]
	sub	edx, DWORD PTR ?MinTaskId@apptask@@2JA	; apptask::MinTaskId
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 348				; 0000015cH
	call	?insert@WTTrace@@QAEHHG@Z		; WTTrace::insert
$L2917:
; Line 3269
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+88], 1
; Line 3271
	mov	ecx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [ecx+252], 1
	jne	SHORT $L2918
; Line 3273
	mov	edx, DWORD PTR _k3$[ebp]
	add	edx, 1
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+100], edx
$L2918:
; Line 3276
	xor	eax, eax
$L2910:
; Line 3277
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
; Line 3283
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 3284
	mov	DWORD PTR _retcode$[ebp], 0
; Line 3287
	mov	eax, DWORD PTR _TCBRecordNum$[ebp]
	imul	eax, 288				; 00000120H
	mov	ecx, DWORD PTR ?TCBBase@TCPObj@@0KA	; TCPObj::TCBBase
	add	ecx, eax
	mov	DWORD PTR _tcb$[ebp], ecx
; Line 3289
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+200], 1
; Line 3290
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR _seqnum$[ebp]
	sub	ecx, DWORD PTR [eax+152]
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+204], ecx
; Line 3291
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR _seqnum$[ebp]
	mov	DWORD PTR [eax+208], ecx
; Line 3292
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+196]
	sub	eax, DWORD PTR _seqnum$[ebp]
	xor	edx, edx
	mov	ecx, 1460				; 000005b4H
	div	ecx
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+212], eax
; Line 3293
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+196]
	sub	ecx, DWORD PTR _seqnum$[ebp]
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+212]
	imul	eax, 1460				; 000005b4H
	sub	ecx, eax
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+216], ecx
; Line 3294
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+220], 0
; Line 3295
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+224], 4
; Line 3297
	mov	edx, DWORD PTR _currenttask$[ebp]
	push	edx
	mov	eax, DWORD PTR _TCBRecordNum$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?SendN@TCPObj@@AAEHHH@Z			; TCPObj::SendN
	mov	DWORD PTR _retcode$[ebp], eax
; Line 3299
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L2929
; Line 3301
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	SHORT $L2924
$L2929:
; Line 3304
	mov	ecx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [ecx+252], 1
	jne	SHORT $L2930
; Line 3306
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+196]
	mov	DWORD PTR [edx+100], ecx
; Line 3307
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+252], 0
$L2930:
; Line 3311
	xor	eax, eax
$L2924:
; Line 3312
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
; Line 3319
	push	ebp
	mov	ebp, esp
	sub	esp, 424				; 000001a8H
	mov	DWORD PTR _this$[ebp], ecx
; Line 3320
	mov	DWORD PTR _retcode$[ebp], 0
; Line 3321
	lea	ecx, DWORD PTR _tsk$[ebp]
	call	??0apptask@@QAE@XZ			; apptask::apptask
; Line 3324
	mov	eax, DWORD PTR _TCBRecordNum$[ebp]
	imul	eax, 288				; 00000120H
	mov	ecx, DWORD PTR ?TCBBase@TCPObj@@0KA	; TCPObj::TCBBase
	add	ecx, eax
	mov	DWORD PTR _tcb$[ebp], ecx
; Line 3326
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+200], 1
; Line 3327
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR _seqnum$[ebp]
	sub	ecx, DWORD PTR [eax+152]
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+204], ecx
; Line 3328
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR _seqnum$[ebp]
	mov	DWORD PTR [eax+208], ecx
; Line 3329
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+164]
	sub	eax, DWORD PTR _seqnum$[ebp]
	xor	edx, edx
	mov	ecx, 1460				; 000005b4H
	div	ecx
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+212], eax
; Line 3330
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+164]
	sub	ecx, DWORD PTR _seqnum$[ebp]
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+212]
	imul	eax, 1460				; 000005b4H
	sub	ecx, eax
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+216], ecx
; Line 3331
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [eax+220], 1
; Line 3332
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+224], 4
; Line 3334
	mov	edx, DWORD PTR _currenttask$[ebp]
	push	edx
	mov	eax, DWORD PTR _TCBRecordNum$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?SendN@TCPObj@@AAEHHH@Z			; TCPObj::SendN
	mov	DWORD PTR _retcode$[ebp], eax
; Line 3336
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L2942
; Line 3338
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	SHORT $L2936
$L2942:
; Line 3341
	mov	ecx, DWORD PTR _tcb$[ebp]
	cmp	DWORD PTR [ecx+252], 1
	jne	SHORT $L2943
; Line 3343
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+164]
	add	eax, 1
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [ecx+100], eax
; Line 3344
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+252], 0
$L2943:
; Line 3347
	xor	eax, eax
	test	eax, eax
	je	SHORT $L2944
; Line 3348
	push	8
	mov	ecx, DWORD PTR _currenttask$[ebp]
	sub	ecx, DWORD PTR ?MinTaskId@apptask@@2JA	; apptask::MinTaskId
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 348				; 0000015cH
	call	?insert@WTTrace@@QAEHHG@Z		; WTTrace::insert
$L2944:
; Line 3349
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+24], 6
; Line 3353
	xor	eax, eax
$L2936:
; Line 3354
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
; Line 3360
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 3364
	mov	eax, DWORD PTR _tcbrno$[ebp]
	imul	eax, 288				; 00000120H
	mov	ecx, DWORD PTR ?TCBBase@TCPObj@@0KA	; TCPObj::TCBBase
	add	ecx, eax
	mov	DWORD PTR _tcb$[ebp], ecx
; Line 3365
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+68]
	mov	DWORD PTR _flag1$[ebp], eax
; Line 3366
	mov	eax, DWORD PTR _flag1$[ebp]
; Line 3367
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
; Line 3373
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 3377
	mov	eax, DWORD PTR _tcbrno$[ebp]
	imul	eax, 288				; 00000120H
	mov	ecx, DWORD PTR ?TCBBase@TCPObj@@0KA	; TCPObj::TCBBase
	add	ecx, eax
	mov	DWORD PTR _tcb$[ebp], ecx
; Line 3378
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+72]
	mov	DWORD PTR _flag1$[ebp], eax
; Line 3379
	mov	eax, DWORD PTR _flag1$[ebp]
; Line 3380
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
; Line 3385
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 3389
	mov	eax, DWORD PTR _tcbrno$[ebp]
	imul	eax, 288				; 00000120H
	mov	ecx, DWORD PTR ?TCBBase@TCPObj@@0KA	; TCPObj::TCBBase
	add	ecx, eax
	mov	DWORD PTR _tcb$[ebp], ecx
; Line 3390
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx+76]
	mov	DWORD PTR _flag1$[ebp], eax
; Line 3391
	mov	eax, DWORD PTR _flag1$[ebp]
; Line 3392
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
; Line 3397
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 3401
	mov	eax, DWORD PTR _tcbrno$[ebp]
	imul	eax, 288				; 00000120H
	mov	ecx, DWORD PTR ?TCBBase@TCPObj@@0KA	; TCPObj::TCBBase
	add	ecx, eax
	mov	DWORD PTR _tcb$[ebp], ecx
; Line 3402
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR [edx+72], 0
; Line 3403
	xor	eax, eax
; Line 3404
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
; Line 3410
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 3411
	mov	eax, DWORD PTR _tcbrno$[ebp]
	imul	eax, 288				; 00000120H
	mov	ecx, DWORD PTR ?TCBBase@TCPObj@@0KA	; TCPObj::TCBBase
	add	ecx, eax
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+336], ecx
; Line 3412
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+336]
	mov	edx, DWORD PTR _currenttask$[ebp]
	mov	DWORD PTR [ecx+4], edx
; Line 3413
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+336]
	mov	edx, DWORD PTR _tcbrno$[ebp]
	mov	DWORD PTR [ecx+8], edx
; Line 3415
	xor	eax, eax
; Line 3416
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
; Line 3422
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 3423
	mov	DWORD PTR _retcode$[ebp], 0
; Line 3425
	mov	eax, DWORD PTR _tcbrno$[ebp]
	imul	eax, 288				; 00000120H
	mov	ecx, DWORD PTR ?TCBBase@TCPObj@@0KA	; TCPObj::TCBBase
	add	ecx, eax
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+336], ecx
; Line 3426
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+336]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR _retcode$[ebp], edx
; Line 3428
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 3429
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
; Line 3435
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 3438
	lea	eax, DWORD PTR _c1$[ebp]
	mov	DWORD PTR _p1$[ebp], eax
; Line 3440
	mov	ecx, DWORD PTR _tcbrno$[ebp]
	imul	ecx, 288				; 00000120H
	mov	edx, DWORD PTR ?TCBBase@TCPObj@@0KA	; TCPObj::TCBBase
	add	edx, ecx
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+336], edx
; Line 3441
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+336]
	mov	eax, DWORD PTR _length$[ebp]
	mov	ecx, DWORD PTR [edx+180]
	mov	DWORD PTR [eax], ecx
; Line 3442
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+336]
	mov	ecx, DWORD PTR [eax+248]
	mov	DWORD PTR _p1$[ebp], ecx
; Line 3444
	mov	eax, DWORD PTR _p1$[ebp]
; Line 3445
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
; Line 3452
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 3454
	mov	eax, DWORD PTR _tcbrno$[ebp]
	imul	eax, 288				; 00000120H
	mov	ecx, DWORD PTR ?TCBBase@TCPObj@@0KA	; TCPObj::TCBBase
	add	ecx, eax
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+336], ecx
; Line 3457
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+336]
	mov	edx, DWORD PTR _currenttask$[ebp]
	cmp	edx, DWORD PTR [ecx+4]
	jne	SHORT $L3011
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+336]
	mov	edx, DWORD PTR _tcbrno$[ebp]
	cmp	edx, DWORD PTR [ecx+8]
	jne	SHORT $L3011
; Line 3461
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+336]
	mov	edx, DWORD PTR _responseHeader$[ebp]
	mov	DWORD PTR [ecx+240], edx
; Line 3462
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+336]
	mov	edx, DWORD PTR _hSize$[ebp]
	mov	DWORD PTR [ecx+184], edx
; Line 3463
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+336]
	mov	edx, DWORD PTR _resourceAddress$[ebp]
	mov	DWORD PTR [ecx+244], edx
; Line 3464
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+336]
	mov	edx, DWORD PTR _fileSize$[ebp]
	mov	DWORD PTR [ecx+268], edx
; Line 3467
	jmp	$L3013
$L3011:
; Line 3469
	push	2900					; 00000b54H
	mov	eax, DWORD PTR _tcbrno$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 3470
	push	2920					; 00000b68H
	mov	ecx, DWORD PTR _currenttask$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 3471
	push	2940					; 00000b7cH
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+336]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 3472
	push	2960					; 00000b90H
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+336]
	mov	ecx, DWORD PTR [eax+8]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 3473
	mov	DWORD PTR ?Application_Status@AOAProtected@@2HA, 2 ; AOAProtected::Application_Status
; Line 3474
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAExit@AOAProtected@@QAEXXZ		; AOAProtected::AOAExit
; Line 3475
	mov	eax, -31				; ffffffe1H
	jmp	SHORT $L3008
$L3013:
; Line 3477
	xor	eax, eax
$L3008:
; Line 3478
	mov	esp, ebp
	pop	ebp
	ret	24					; 00000018H
?setFileParam@TCPObj@@QAEHHPADJKJH@Z ENDP		; TCPObj::setFileParam
_TEXT	ENDS
PUBLIC	?getHttpCount@TCPObj@@QAEHXZ			; TCPObj::getHttpCount
_TEXT	SEGMENT
_this$ = -4
?getHttpCount@TCPObj@@QAEHXZ PROC NEAR			; TCPObj::getHttpCount
; Line 3484
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 3485
	mov	eax, DWORD PTR ?HttpCount@TCPObj@@2KA	; TCPObj::HttpCount
; Line 3486
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
; Line 3492
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 3494
	mov	eax, DWORD PTR _tcbrno$[ebp]
	imul	eax, 288				; 00000120H
	mov	ecx, DWORD PTR ?TCBBase@TCPObj@@0KA	; TCPObj::TCBBase
	add	ecx, eax
	mov	DWORD PTR _tcb$[ebp], ecx
; Line 3496
	mov	edx, DWORD PTR _lineno$[ebp]
	push	edx
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 3497
	mov	edx, DWORD PTR _lineno$[ebp]
	add	edx, 20					; 00000014H
	push	edx
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 3498
	mov	edx, DWORD PTR _lineno$[ebp]
	add	edx, 40					; 00000028H
	push	edx
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+96]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 3499
	mov	edx, DWORD PTR _lineno$[ebp]
	add	edx, 60					; 0000003cH
	push	edx
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+100]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 3500
	mov	edx, DWORD PTR _lineno$[ebp]
	add	edx, 80					; 00000050H
	push	edx
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 3501
	mov	edx, DWORD PTR _lineno$[ebp]
	add	edx, 100				; 00000064H
	push	edx
	mov	eax, DWORD PTR _tcb$[ebp]
	mov	ecx, DWORD PTR [eax+24]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 3502
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
; Line 3504
	xor	eax, eax
; Line 3505
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
; Line 3511
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 3513
	mov	eax, DWORD PTR _tcbrno$[ebp]
	imul	eax, 288				; 00000120H
	mov	ecx, DWORD PTR ?TCBBase@TCPObj@@0KA	; TCPObj::TCBBase
	add	ecx, eax
	mov	DWORD PTR _tcb$[ebp], ecx
; Line 3515
	mov	edx, DWORD PTR _tcb$[ebp]
	mov	eax, DWORD PTR [edx]
; Line 3516
	mov	esp, ebp
	pop	ebp
	ret	4
?getAvail@TCPObj@@QAEHH@Z ENDP				; TCPObj::getAvail
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
; Line 3523
	push	ebp
	mov	ebp, esp
	sub	esp, 36					; 00000024H
	mov	DWORD PTR _this$[ebp], ecx
; Line 3524
	mov	DWORD PTR _noOfBytes$[ebp], 0
; Line 3525
	mov	DWORD PTR _i$[ebp], 0
; Line 3531
	lea	eax, DWORD PTR _c1$[ebp]
	mov	DWORD PTR _p1$[ebp], eax
; Line 3532
	lea	ecx, DWORD PTR _c2$[ebp]
	mov	DWORD PTR _p2$[ebp], ecx
; Line 3533
	mov	DWORD PTR _addr$[ebp], 0
; Line 3535
	mov	edx, DWORD PTR _tcbrno$[ebp]
	imul	edx, 288				; 00000120H
	mov	eax, DWORD PTR ?TCBBase@TCPObj@@0KA	; TCPObj::TCBBase
	add	eax, edx
	mov	DWORD PTR _tcb$[ebp], eax
; Line 3536
	mov	DWORD PTR _noOfBytes$[ebp], 288		; 00000120H
; Line 3537
	mov	DWORD PTR _addr$[ebp], 166658048	; 09ef0000H
; Line 3538
	mov	ecx, DWORD PTR _addr$[ebp]
	mov	DWORD PTR _p1$[ebp], ecx
; Line 3539
	mov	edx, DWORD PTR ?trace1Count@TCPObj@@2JA	; TCPObj::trace1Count
	imul	edx, DWORD PTR _noOfBytes$[ebp]
	mov	eax, DWORD PTR _p1$[ebp]
	add	eax, edx
	mov	DWORD PTR _p1$[ebp], eax
; Line 3540
	mov	ecx, DWORD PTR _tcb$[ebp]
	mov	DWORD PTR _p2$[ebp], ecx
; Line 3542
	cmp	DWORD PTR ?trace1Count@TCPObj@@2JA, 10000 ; TCPObj::trace1Count, 00002710H
	jge	SHORT $L3049
; Line 3544
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L3050
$L3051:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L3050:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _noOfBytes$[ebp]
	jge	SHORT $L3052
; Line 3546
	mov	ecx, DWORD PTR _p1$[ebp]
	mov	edx, DWORD PTR _p2$[ebp]
	mov	al, BYTE PTR [edx]
	mov	BYTE PTR [ecx], al
; Line 3547
	mov	ecx, DWORD PTR _p1$[ebp]
	add	ecx, 1
	mov	DWORD PTR _p1$[ebp], ecx
; Line 3548
	mov	edx, DWORD PTR _p2$[ebp]
	add	edx, 1
	mov	DWORD PTR _p2$[ebp], edx
; Line 3549
	jmp	SHORT $L3051
$L3052:
; Line 3550
	mov	eax, DWORD PTR ?trace1Count@TCPObj@@2JA	; TCPObj::trace1Count
	add	eax, 1
	mov	DWORD PTR ?trace1Count@TCPObj@@2JA, eax	; TCPObj::trace1Count
$L3049:
; Line 3552
	xor	eax, eax
; Line 3553
	mov	esp, ebp
	pop	ebp
	ret	4
?storeTraceTCBRecord@TCPObj@@QAEHH@Z ENDP		; TCPObj::storeTraceTCBRecord
_dataw$ = 8
_this$ = -20
_i$ = -12
_p1$ = -8
_c1$ = -4
_addr$ = -16
?storeTraceDword@TCPObj@@QAEHH@Z PROC NEAR		; TCPObj::storeTraceDword
; Line 3560
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	mov	DWORD PTR _this$[ebp], ecx
; Line 3561
	mov	DWORD PTR _i$[ebp], 0
; Line 3564
	lea	eax, DWORD PTR _c1$[ebp]
	mov	DWORD PTR _p1$[ebp], eax
; Line 3565
	mov	DWORD PTR _addr$[ebp], 0
; Line 3567
	mov	DWORD PTR _addr$[ebp], 183435264	; 0aef0000H
; Line 3569
	cmp	DWORD PTR ?trace2Count@TCPObj@@2JA, 10000 ; TCPObj::trace2Count, 00002710H
	jge	SHORT $L3061
; Line 3571
	mov	ecx, DWORD PTR ?trace2Count@TCPObj@@2JA	; TCPObj::trace2Count
	mov	edx, DWORD PTR _addr$[ebp]
	lea	eax, DWORD PTR [edx+ecx*4]
	mov	DWORD PTR _addr$[ebp], eax
; Line 3572
	mov	ecx, DWORD PTR _addr$[ebp]
	mov	DWORD PTR _p1$[ebp], ecx
; Line 3573
	mov	edx, DWORD PTR _p1$[ebp]
	mov	eax, DWORD PTR _dataw$[ebp]
	mov	DWORD PTR [edx], eax
; Line 3574
	mov	ecx, DWORD PTR ?trace2Count@TCPObj@@2JA	; TCPObj::trace2Count
	add	ecx, 1
	mov	DWORD PTR ?trace2Count@TCPObj@@2JA, ecx	; TCPObj::trace2Count
$L3061:
; Line 3576
	xor	eax, eax
; Line 3577
	mov	esp, ebp
	pop	ebp
	ret	4
?storeTraceDword@TCPObj@@QAEHH@Z ENDP			; TCPObj::storeTraceDword
_TEXT	ENDS
END
