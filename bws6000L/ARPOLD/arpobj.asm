	TITLE	arpobj.cpp
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
_BSS	SEGMENT PARA USE32 PUBLIC 'BSS'
_BSS	ENDS
_TLS	SEGMENT DWORD USE32 PUBLIC 'TLS'
_TLS	ENDS
;	COMDAT ??0FTOPObj@@QAE@XZ
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
FLAT	GROUP _DATA, CONST, _BSS
	ASSUME	CS: FLAT, DS: FLAT, SS: FLAT
endif
PUBLIC	?ARPTABLE@ARPObj@@0PAUarprecord@@A		; ARPObj::ARPTABLE
PUBLIC	?ARPT@ARPObj@@0PAUarprecordT@@A			; ARPObj::ARPT
PUBLIC	?hashind@ARPObj@@0PAHA				; ARPObj::hashind
PUBLIC	?FreePtr@ARPObj@@0HA				; ARPObj::FreePtr
PUBLIC	?mSenderHA@ARPObj@@0PADA			; ARPObj::mSenderHA
PUBLIC	?mSenderIP@ARPObj@@0PADA			; ARPObj::mSenderIP
PUBLIC	?GateWayIP@ARPObj@@0PADA			; ARPObj::GateWayIP
PUBLIC	?SUBNETMASK@ARPObj@@0PADA			; ARPObj::SUBNETMASK
PUBLIC	?noArpresolves@ARPObj@@0KA			; ARPObj::noArpresolves
PUBLIC	?noArpresolvef@ARPObj@@0KA			; ARPObj::noArpresolvef
PUBLIC	?noArprequestp@ARPObj@@0KA			; ARPObj::noArprequestp
PUBLIC	?noArppackp@ARPObj@@0KA				; ARPObj::noArppackp
PUBLIC	?resolveFlagForFileTransfer@ARPObj@@2HA		; ARPObj::resolveFlagForFileTransfer
PUBLIC	?ARPT_Index@ARPObj@@2HA				; ARPObj::ARPT_Index
_BSS	SEGMENT
?ARPTABLE@ARPObj@@0PAUarprecord@@A DB 0640H DUP (?)	; ARPObj::ARPTABLE
?ARPT@ARPObj@@0PAUarprecordT@@A DT 04H DUP (?)		; ARPObj::ARPT
?hashind@ARPObj@@0PAHA DD 064H DUP (?)			; ARPObj::hashind
?mSenderHA@ARPObj@@0PADA DB 06H DUP (?)			; ARPObj::mSenderHA
	ALIGN	4

?mSenderIP@ARPObj@@0PADA DB 04H DUP (?)			; ARPObj::mSenderIP
?GateWayIP@ARPObj@@0PADA DB 04H DUP (?)			; ARPObj::GateWayIP
?SUBNETMASK@ARPObj@@0PADA DB 04H DUP (?)		; ARPObj::SUBNETMASK
?noArpresolves@ARPObj@@0KA DD 01H DUP (?)		; ARPObj::noArpresolves
?noArpresolvef@ARPObj@@0KA DD 01H DUP (?)		; ARPObj::noArpresolvef
?noArprequestp@ARPObj@@0KA DD 01H DUP (?)		; ARPObj::noArprequestp
?noArppackp@ARPObj@@0KA DD 01H DUP (?)			; ARPObj::noArppackp
?resolveFlagForFileTransfer@ARPObj@@2HA DD 01H DUP (?)	; ARPObj::resolveFlagForFileTransfer
?ARPT_Index@ARPObj@@2HA DD 01H DUP (?)			; ARPObj::ARPT_Index
_BSS	ENDS
_DATA	SEGMENT
?FreePtr@ARPObj@@0HA DD 0ffffffffH			; ARPObj::FreePtr
_DATA	ENDS
PUBLIC	??0ARPObj@@QAE@XZ				; ARPObj::ARPObj
EXTRN	??0AOAProtected@@QAE@XZ:NEAR			; AOAProtected::AOAProtected
EXTRN	??0EtherObj@@QAE@XZ:NEAR			; EtherObj::EtherObj
EXTRN	?getMAC@EtherObj@@QAEXPAD@Z:NEAR		; EtherObj::getMAC
_TEXT	SEGMENT
_this$ = -4
??0ARPObj@@QAE@XZ PROC NEAR				; ARPObj::ARPObj
; File arpobj.cpp
; Line 35
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	??0EtherObj@@QAE@XZ			; EtherObj::EtherObj
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	??0AOAProtected@@QAE@XZ			; AOAProtected::AOAProtected
; Line 36
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+16], 1
; Line 38
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+20], 2048		; 00000800H
; Line 40
	mov	edx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [edx+28], 6
; Line 43
	mov	eax, DWORD PTR _this$[ebp]
	mov	BYTE PTR [eax+29], 4
; Line 46
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+24], 2054		; 00000806H
; Line 49
	push	OFFSET FLAT:?mSenderHA@ARPObj@@0PADA	; ARPObj::mSenderHA
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getMAC@EtherObj@@QAEXPAD@Z		; EtherObj::getMAC
; Line 51
	mov	eax, DWORD PTR _this$[ebp]
	mov	esp, ebp
	pop	ebp
	ret	0
??0ARPObj@@QAE@XZ ENDP					; ARPObj::ARPObj
_TEXT	ENDS
PUBLIC	?init@ARPObj@@QAEHPAD00@Z			; ARPObj::init
_TEXT	SEGMENT
_senderIP$ = 8
_SubNetMask$ = 12
_GwayIP$ = 16
_this$ = -8
_i$ = -4
?init@ARPObj@@QAEHPAD00@Z PROC NEAR			; ARPObj::init
; Line 61
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 63
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+16], 1
; Line 65
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+20], 2048		; 00000800H
; Line 67
	mov	edx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [edx+28], 6
; Line 70
	mov	eax, DWORD PTR _this$[ebp]
	mov	BYTE PTR [eax+29], 4
; Line 74
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+24], 2054		; 00000806H
; Line 78
	push	OFFSET FLAT:?mSenderHA@ARPObj@@0PADA	; ARPObj::mSenderHA
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getMAC@EtherObj@@QAEXPAD@Z		; EtherObj::getMAC
; Line 81
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1218
$L1219:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L1218:
	cmp	DWORD PTR _i$[ebp], 4
	jge	SHORT $L1220
; Line 82
	mov	eax, DWORD PTR _GwayIP$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	dl, BYTE PTR [eax]
	mov	BYTE PTR ?GateWayIP@ARPObj@@0PADA[ecx], dl
	jmp	SHORT $L1219
$L1220:
; Line 83
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1221
$L1222:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L1221:
	cmp	DWORD PTR _i$[ebp], 4
	jge	SHORT $L1223
; Line 84
	mov	ecx, DWORD PTR _SubNetMask$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	mov	al, BYTE PTR [ecx]
	mov	BYTE PTR ?SUBNETMASK@ARPObj@@0PADA[edx], al
	jmp	SHORT $L1222
$L1223:
; Line 86
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1224
$L1225:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L1224:
	cmp	DWORD PTR _i$[ebp], 4
	jge	SHORT $L1226
; Line 87
	mov	edx, DWORD PTR _senderIP$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	mov	cl, BYTE PTR [edx]
	mov	BYTE PTR ?mSenderIP@ARPObj@@0PADA[eax], cl
	jmp	SHORT $L1225
$L1226:
; Line 91
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1227
$L1228:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L1227:
	cmp	DWORD PTR _i$[ebp], 100			; 00000064H
	jge	SHORT $L1229
; Line 93
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 4
	mov	BYTE PTR ?ARPTABLE@ARPObj@@0PAUarprecord@@A[eax], 0
; Line 94
	mov	ecx, DWORD PTR _i$[ebp]
	shl	ecx, 4
	mov	BYTE PTR ?ARPTABLE@ARPObj@@0PAUarprecord@@A[ecx+4], 0
; Line 95
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 4
	mov	DWORD PTR ?ARPTABLE@ARPObj@@0PAUarprecord@@A[eax+12], edx
; Line 96
	jmp	SHORT $L1228
$L1229:
; Line 99
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1230
$L1231:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L1230:
	cmp	DWORD PTR _i$[ebp], 4
	jge	SHORT $L1232
; Line 101
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 10					; 0000000aH
	mov	BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[edx], 0
; Line 102
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 10					; 0000000aH
	mov	BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[eax+4], 0
; Line 103
	jmp	SHORT $L1231
$L1232:
; Line 105
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1233
$L1234:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L1233:
	cmp	DWORD PTR _i$[ebp], 100			; 00000064H
	jge	SHORT $L1235
; Line 107
	mov	edx, DWORD PTR _i$[ebp]
	mov	DWORD PTR ?hashind@ARPObj@@0PAHA[edx*4], -1
; Line 108
	jmp	SHORT $L1234
$L1235:
; Line 109
	mov	DWORD PTR ?ARPTABLE@ARPObj@@0PAUarprecord@@A+1596, -1
; Line 110
	mov	DWORD PTR ?FreePtr@ARPObj@@0HA, 0	; ARPObj::FreePtr
; Line 112
	mov	esp, ebp
	pop	ebp
	ret	12					; 0000000cH
?init@ARPObj@@QAEHPAD00@Z ENDP				; ARPObj::init
_TEXT	ENDS
PUBLIC	?ARPBroadcast@ARPObj@@QAEHPAD00@Z		; ARPObj::ARPBroadcast
EXTRN	?ARPInsertPkt@EtherObj@@QAEHPADHH00HH@Z:NEAR	; EtherObj::ARPInsertPkt
_TEXT	SEGMENT
_targetIP$ = 8
_srcip$ = 12
_srcmac$ = 16
_this$ = -92
_retcode$ = -4
_ARP_PACK$ = -88
_targetHA$ = -16
_i$ = -8
?ARPBroadcast@ARPObj@@QAEHPAD00@Z PROC NEAR		; ARPObj::ARPBroadcast
; Line 118
	push	ebp
	mov	ebp, esp
	sub	esp, 92					; 0000005cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 119
	mov	DWORD PTR _retcode$[ebp], 0
; Line 121
	mov	BYTE PTR _targetHA$[ebp], -1
	mov	BYTE PTR _targetHA$[ebp+1], -1
	mov	BYTE PTR _targetHA$[ebp+2], -1
	mov	BYTE PTR _targetHA$[ebp+3], -1
	mov	BYTE PTR _targetHA$[ebp+4], -1
	mov	BYTE PTR _targetHA$[ebp+5], -1
; Line 122
	mov	DWORD PTR _i$[ebp], 0
; Line 125
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+16]
	sar	ecx, 8
	and	ecx, 255				; 000000ffH
	mov	BYTE PTR _ARP_PACK$[ebp], cl
; Line 126
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+16]
	and	eax, 255				; 000000ffH
	mov	BYTE PTR _ARP_PACK$[ebp+1], al
; Line 129
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+20]
	sar	edx, 8
	and	edx, 255				; 000000ffH
	mov	BYTE PTR _ARP_PACK$[ebp+2], dl
; Line 130
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+20]
	and	ecx, 255				; 000000ffH
	mov	BYTE PTR _ARP_PACK$[ebp+3], cl
; Line 133
	mov	edx, DWORD PTR _this$[ebp]
	movsx	eax, BYTE PTR [edx+28]
	and	eax, 255				; 000000ffH
	mov	BYTE PTR _ARP_PACK$[ebp+4], al
; Line 135
	mov	ecx, DWORD PTR _this$[ebp]
	movsx	edx, BYTE PTR [ecx+29]
	and	edx, 255				; 000000ffH
	mov	BYTE PTR _ARP_PACK$[ebp+5], dl
; Line 138
	mov	BYTE PTR _ARP_PACK$[ebp+6], 0
; Line 139
	mov	BYTE PTR _ARP_PACK$[ebp+7], 1
; Line 142
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1246
$L1247:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L1246:
	cmp	DWORD PTR _i$[ebp], 6
	jge	SHORT $L1248
; Line 144
	mov	ecx, DWORD PTR _srcmac$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	mov	al, BYTE PTR [ecx]
	mov	BYTE PTR _ARP_PACK$[ebp+edx+8], al
; Line 145
	mov	ecx, DWORD PTR _i$[ebp]
	mov	BYTE PTR _ARP_PACK$[ebp+ecx+18], 0
; Line 146
	jmp	SHORT $L1247
$L1248:
; Line 148
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1249
$L1250:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L1249:
	cmp	DWORD PTR _i$[ebp], 4
	jge	SHORT $L1251
; Line 150
	mov	eax, DWORD PTR _srcip$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	dl, BYTE PTR [eax]
	mov	BYTE PTR _ARP_PACK$[ebp+ecx+14], dl
; Line 151
	mov	eax, DWORD PTR _targetIP$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	dl, BYTE PTR [eax]
	mov	BYTE PTR _ARP_PACK$[ebp+ecx+24], dl
; Line 152
	jmp	SHORT $L1250
$L1251:
; Line 155
	push	0
	push	7
	lea	eax, DWORD PTR _targetHA$[ebp]
	push	eax
	mov	ecx, DWORD PTR _srcmac$[ebp]
	push	ecx
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+24]
	push	eax
	push	28					; 0000001cH
	lea	ecx, DWORD PTR _ARP_PACK$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?ARPInsertPkt@EtherObj@@QAEHPADHH00HH@Z	; EtherObj::ARPInsertPkt
	mov	DWORD PTR _retcode$[ebp], eax
; Line 158
	xor	eax, eax
; Line 159
	mov	esp, ebp
	pop	ebp
	ret	12					; 0000000cH
?ARPBroadcast@ARPObj@@QAEHPAD00@Z ENDP			; ARPObj::ARPBroadcast
_TEXT	ENDS
PUBLIC	?Resolve@ARPObj@@QAEHPAD0H@Z			; ARPObj::Resolve
EXTRN	?AOAgetSharedMem@AOAProtected@@QAEJH@Z:NEAR	; AOAProtected::AOAgetSharedMem
EXTRN	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z:NEAR	; AOAProtected::AOAsetSharedMem
_TEXT	SEGMENT
_stargetIP$ = 8
_targetMAC$ = 12
_currenttask$ = 16
_this$ = -148
_retcode$ = -8
_targetIP$ = -132
_ARP_PACK$ = -128
_targetHA$ = -28
_ARP_Found_Flag$ = -4
_i$ = -16
_j$ = -20
_count1$ = -12
_m$1268 = -136
_m$1273 = -140
_k$1283 = -144
?Resolve@ARPObj@@QAEHPAD0H@Z PROC NEAR			; ARPObj::Resolve
; Line 169
	push	ebp
	mov	ebp, esp
	sub	esp, 148				; 00000094H
	mov	DWORD PTR _this$[ebp], ecx
; Line 170
	mov	DWORD PTR _retcode$[ebp], 0
; Line 173
	mov	BYTE PTR _targetHA$[ebp], -1
	mov	BYTE PTR _targetHA$[ebp+1], -1
	mov	BYTE PTR _targetHA$[ebp+2], -1
	mov	BYTE PTR _targetHA$[ebp+3], -1
	mov	BYTE PTR _targetHA$[ebp+4], -1
	mov	BYTE PTR _targetHA$[ebp+5], -1
; Line 174
	mov	DWORD PTR _ARP_Found_Flag$[ebp], -1
; Line 175
	mov	DWORD PTR _i$[ebp], 0
; Line 176
	mov	DWORD PTR _j$[ebp], 0
; Line 177
	mov	DWORD PTR _count1$[ebp], 0
; Line 184
	mov	eax, DWORD PTR _stargetIP$[ebp]
	movsx	ecx, BYTE PTR [eax]
	movsx	edx, BYTE PTR ?SUBNETMASK@ARPObj@@0PADA
	and	ecx, edx
	movsx	eax, BYTE PTR ?mSenderIP@ARPObj@@0PADA
	movsx	edx, BYTE PTR ?SUBNETMASK@ARPObj@@0PADA
	and	eax, edx
	cmp	ecx, eax
	jne	$L1267
	mov	eax, DWORD PTR _stargetIP$[ebp]
	movsx	ecx, BYTE PTR [eax+1]
	movsx	edx, BYTE PTR ?SUBNETMASK@ARPObj@@0PADA+1
	and	ecx, edx
	movsx	eax, BYTE PTR ?mSenderIP@ARPObj@@0PADA+1
	movsx	edx, BYTE PTR ?SUBNETMASK@ARPObj@@0PADA+1
	and	eax, edx
	cmp	ecx, eax
	jne	$L1267
	mov	eax, DWORD PTR _stargetIP$[ebp]
	movsx	ecx, BYTE PTR [eax+2]
	movsx	edx, BYTE PTR ?SUBNETMASK@ARPObj@@0PADA+2
	and	ecx, edx
	movsx	eax, BYTE PTR ?mSenderIP@ARPObj@@0PADA+2
	movsx	edx, BYTE PTR ?SUBNETMASK@ARPObj@@0PADA+2
	and	eax, edx
	cmp	ecx, eax
	jne	SHORT $L1267
	mov	eax, DWORD PTR _stargetIP$[ebp]
	movsx	ecx, BYTE PTR [eax+3]
	movsx	edx, BYTE PTR ?SUBNETMASK@ARPObj@@0PADA+3
	and	ecx, edx
	movsx	eax, BYTE PTR ?mSenderIP@ARPObj@@0PADA+3
	movsx	edx, BYTE PTR ?SUBNETMASK@ARPObj@@0PADA+3
	and	eax, edx
	cmp	ecx, eax
	jne	SHORT $L1267
; Line 186
	mov	DWORD PTR _m$1268[ebp], 0
	jmp	SHORT $L1269
$L1270:
	mov	eax, DWORD PTR _m$1268[ebp]
	add	eax, 1
	mov	DWORD PTR _m$1268[ebp], eax
$L1269:
	cmp	DWORD PTR _m$1268[ebp], 4
	jge	SHORT $L1271
; Line 188
	mov	ecx, DWORD PTR _stargetIP$[ebp]
	add	ecx, DWORD PTR _m$1268[ebp]
	mov	edx, DWORD PTR _m$1268[ebp]
	mov	al, BYTE PTR [ecx]
	mov	BYTE PTR _targetIP$[ebp+edx], al
; Line 189
	jmp	SHORT $L1270
$L1271:
; Line 191
	jmp	SHORT $L1276
$L1267:
; Line 193
	mov	DWORD PTR _m$1273[ebp], 0
	jmp	SHORT $L1274
$L1275:
	mov	ecx, DWORD PTR _m$1273[ebp]
	add	ecx, 1
	mov	DWORD PTR _m$1273[ebp], ecx
$L1274:
	cmp	DWORD PTR _m$1273[ebp], 4
	jge	SHORT $L1276
; Line 195
	mov	edx, DWORD PTR _m$1273[ebp]
	mov	eax, DWORD PTR _m$1273[ebp]
	mov	cl, BYTE PTR ?GateWayIP@ARPObj@@0PADA[eax]
	mov	BYTE PTR _targetIP$[ebp+edx], cl
; Line 196
	jmp	SHORT $L1275
$L1276:
; Line 200
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1277
$L1278:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L1277:
	cmp	DWORD PTR _i$[ebp], 4
	jge	SHORT $L1279
; Line 203
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 10					; 0000000aH
	movsx	ecx, BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[eax]
	movsx	edx, BYTE PTR _targetIP$[ebp]
	cmp	ecx, edx
	jne	SHORT $L1280
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 10					; 0000000aH
	movsx	ecx, BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[eax+1]
	movsx	edx, BYTE PTR _targetIP$[ebp+1]
	cmp	ecx, edx
	jne	SHORT $L1280
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 10					; 0000000aH
	movsx	ecx, BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[eax+2]
	movsx	edx, BYTE PTR _targetIP$[ebp+2]
	cmp	ecx, edx
	jne	SHORT $L1280
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 10					; 0000000aH
	movsx	ecx, BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[eax+3]
	movsx	edx, BYTE PTR _targetIP$[ebp+3]
	cmp	ecx, edx
	jne	SHORT $L1280
; Line 205
	mov	DWORD PTR _ARP_Found_Flag$[ebp], 0
; Line 206
	jmp	SHORT $L1279
$L1280:
; Line 210
	mov	DWORD PTR _ARP_Found_Flag$[ebp], -1
; Line 212
	jmp	$L1278
$L1279:
; Line 231
	cmp	DWORD PTR _ARP_Found_Flag$[ebp], 0
	jne	SHORT $L1282
; Line 233
	mov	DWORD PTR _k$1283[ebp], 0
	jmp	SHORT $L1284
$L1285:
	mov	eax, DWORD PTR _k$1283[ebp]
	add	eax, 1
	mov	DWORD PTR _k$1283[ebp], eax
$L1284:
	cmp	DWORD PTR _k$1283[ebp], 6
	jge	SHORT $L1286
; Line 234
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 10					; 0000000aH
	mov	edx, DWORD PTR _targetMAC$[ebp]
	add	edx, DWORD PTR _k$1283[ebp]
	mov	eax, DWORD PTR _k$1283[ebp]
	mov	cl, BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[ecx+eax+4]
	mov	BYTE PTR [edx], cl
	jmp	SHORT $L1285
$L1286:
; Line 235
	mov	eax, DWORD PTR _ARP_Found_Flag$[ebp]
	jmp	$L1258
$L1282:
; Line 241
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+16]
	sar	eax, 8
	and	eax, 255				; 000000ffH
	mov	BYTE PTR _ARP_PACK$[ebp], al
; Line 242
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+16]
	and	edx, 255				; 000000ffH
	mov	BYTE PTR _ARP_PACK$[ebp+1], dl
; Line 245
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+20]
	sar	ecx, 8
	and	ecx, 255				; 000000ffH
	mov	BYTE PTR _ARP_PACK$[ebp+2], cl
; Line 246
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+20]
	and	eax, 255				; 000000ffH
	mov	BYTE PTR _ARP_PACK$[ebp+3], al
; Line 249
	mov	ecx, DWORD PTR _this$[ebp]
	movsx	edx, BYTE PTR [ecx+28]
	and	edx, 255				; 000000ffH
	mov	BYTE PTR _ARP_PACK$[ebp+4], dl
; Line 251
	mov	eax, DWORD PTR _this$[ebp]
	movsx	ecx, BYTE PTR [eax+29]
	and	ecx, 255				; 000000ffH
	mov	BYTE PTR _ARP_PACK$[ebp+5], cl
; Line 254
	mov	BYTE PTR _ARP_PACK$[ebp+6], 0
; Line 255
	mov	BYTE PTR _ARP_PACK$[ebp+7], 1
; Line 258
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1288
$L1289:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L1288:
	cmp	DWORD PTR _i$[ebp], 6
	jge	SHORT $L1290
; Line 260
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	dl, BYTE PTR ?mSenderHA@ARPObj@@0PADA[ecx]
	mov	BYTE PTR _ARP_PACK$[ebp+eax+8], dl
; Line 261
	mov	eax, DWORD PTR _i$[ebp]
	mov	BYTE PTR _ARP_PACK$[ebp+eax+18], 0
; Line 262
	jmp	SHORT $L1289
$L1290:
; Line 264
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1291
$L1292:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L1291:
	cmp	DWORD PTR _i$[ebp], 4
	jge	SHORT $L1293
; Line 266
	mov	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	mov	cl, BYTE PTR ?mSenderIP@ARPObj@@0PADA[eax]
	mov	BYTE PTR _ARP_PACK$[ebp+edx+14], cl
; Line 267
	mov	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	mov	cl, BYTE PTR _targetIP$[ebp+eax]
	mov	BYTE PTR _ARP_PACK$[ebp+edx+24], cl
; Line 268
	jmp	SHORT $L1292
$L1293:
; Line 273
	push	180					; 000000b4H
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?AOAgetSharedMem@AOAProtected@@QAEJH@Z	; AOAProtected::AOAgetSharedMem
	mov	DWORD PTR _retcode$[ebp], eax
; Line 274
	mov	edx, DWORD PTR _retcode$[ebp]
	add	edx, 1
	mov	DWORD PTR _retcode$[ebp], edx
; Line 275
	mov	eax, DWORD PTR _retcode$[ebp]
	push	eax
	push	180					; 000000b4H
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 277
	push	208					; 000000d0H
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?AOAgetSharedMem@AOAProtected@@QAEJH@Z	; AOAProtected::AOAgetSharedMem
	mov	DWORD PTR _retcode$[ebp], eax
; Line 278
	mov	ecx, DWORD PTR _retcode$[ebp]
	add	ecx, 1
	mov	DWORD PTR _retcode$[ebp], ecx
; Line 279
	mov	edx, DWORD PTR _retcode$[ebp]
	push	edx
	push	208					; 000000d0H
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 281
	mov	eax, DWORD PTR _currenttask$[ebp]
	push	eax
	push	7
	lea	ecx, DWORD PTR _targetHA$[ebp]
	push	ecx
	push	OFFSET FLAT:?mSenderHA@ARPObj@@0PADA	; ARPObj::mSenderHA
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+24]
	push	eax
	push	28					; 0000001cH
	lea	ecx, DWORD PTR _ARP_PACK$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?ARPInsertPkt@EtherObj@@QAEHPADHH00HH@Z	; EtherObj::ARPInsertPkt
	mov	DWORD PTR _retcode$[ebp], eax
; Line 284
	push	184					; 000000b8H
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?AOAgetSharedMem@AOAProtected@@QAEJH@Z	; AOAProtected::AOAgetSharedMem
	mov	DWORD PTR _count1$[ebp], eax
; Line 285
	mov	edx, DWORD PTR _count1$[ebp]
	add	edx, 1
	mov	DWORD PTR _count1$[ebp], edx
; Line 286
	mov	eax, DWORD PTR _count1$[ebp]
	push	eax
	push	240					; 000000f0H
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 396
	mov	ecx, DWORD PTR ?noArpresolvef@ARPObj@@0KA ; ARPObj::noArpresolvef
	add	ecx, 1
	mov	DWORD PTR ?noArpresolvef@ARPObj@@0KA, ecx ; ARPObj::noArpresolvef
; Line 397
	mov	eax, DWORD PTR _ARP_Found_Flag$[ebp]
$L1258:
; Line 398
	mov	esp, ebp
	pop	ebp
	ret	12					; 0000000cH
?Resolve@ARPObj@@QAEHPAD0H@Z ENDP			; ARPObj::Resolve
_TEXT	ENDS
PUBLIC	?ARPHandler@ARPObj@@QAEHPADHH@Z			; ARPObj::ARPHandler
PUBLIC	?ProcessRequest@ARPObj@@QAEHPADHH@Z		; ARPObj::ProcessRequest
PUBLIC	?ProcessReplies@ARPObj@@QAEHPADH@Z		; ARPObj::ProcessReplies
_TEXT	SEGMENT
_ARPPack$ = 8
_size$ = 12
_currenttask$ = 16
_this$ = -12
_temp$ = -8
_retcode$ = -4
?ARPHandler@ARPObj@@QAEHPADHH@Z PROC NEAR		; ARPObj::ARPHandler
; Line 417
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 419
	mov	DWORD PTR _temp$[ebp], 0
; Line 420
	mov	DWORD PTR _retcode$[ebp], 0
; Line 421
	mov	eax, DWORD PTR ?noArppackp@ARPObj@@0KA	; ARPObj::noArppackp
	add	eax, 1
	mov	DWORD PTR ?noArppackp@ARPObj@@0KA, eax	; ARPObj::noArppackp
; Line 423
	mov	ecx, DWORD PTR _ARPPack$[ebp]
	movsx	edx, BYTE PTR [ecx]
	and	edx, 255				; 000000ffH
	mov	DWORD PTR _temp$[ebp], edx
; Line 424
	mov	eax, DWORD PTR _temp$[ebp]
	shl	eax, 8
	mov	DWORD PTR _temp$[ebp], eax
; Line 425
	mov	ecx, DWORD PTR _ARPPack$[ebp]
	movsx	edx, BYTE PTR [ecx+1]
	and	edx, 255				; 000000ffH
	mov	eax, DWORD PTR _temp$[ebp]
	or	eax, edx
	mov	DWORD PTR _temp$[ebp], eax
; Line 427
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _temp$[ebp]
	cmp	edx, DWORD PTR [ecx+16]
	je	SHORT $L1304
; Line 429
	or	eax, -1
	jmp	$L1301
$L1304:
; Line 433
	mov	DWORD PTR _temp$[ebp], 0
; Line 434
	mov	eax, DWORD PTR _ARPPack$[ebp]
	movsx	ecx, BYTE PTR [eax+2]
	and	ecx, 255				; 000000ffH
	mov	DWORD PTR _temp$[ebp], ecx
; Line 435
	mov	edx, DWORD PTR _temp$[ebp]
	shl	edx, 8
	mov	DWORD PTR _temp$[ebp], edx
; Line 436
	mov	eax, DWORD PTR _ARPPack$[ebp]
	movsx	ecx, BYTE PTR [eax+3]
	and	ecx, 255				; 000000ffH
	mov	edx, DWORD PTR _temp$[ebp]
	or	edx, ecx
	mov	DWORD PTR _temp$[ebp], edx
; Line 437
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _temp$[ebp]
	cmp	ecx, DWORD PTR [eax+20]
	je	SHORT $L1305
; Line 438
	mov	eax, -2					; fffffffeH
	jmp	$L1301
$L1305:
; Line 441
	mov	DWORD PTR _temp$[ebp], 0
; Line 442
	mov	edx, DWORD PTR _ARPPack$[ebp]
	movsx	eax, BYTE PTR [edx+4]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _temp$[ebp], eax
; Line 443
	mov	ecx, DWORD PTR _this$[ebp]
	movsx	edx, BYTE PTR [ecx+28]
	cmp	DWORD PTR _temp$[ebp], edx
	je	SHORT $L1306
; Line 444
	mov	eax, -3					; fffffffdH
	jmp	$L1301
$L1306:
; Line 447
	mov	DWORD PTR _temp$[ebp], 0
; Line 448
	mov	eax, DWORD PTR _ARPPack$[ebp]
	movsx	ecx, BYTE PTR [eax+5]
	and	ecx, 255				; 000000ffH
	mov	DWORD PTR _temp$[ebp], ecx
; Line 449
	mov	edx, DWORD PTR _this$[ebp]
	movsx	eax, BYTE PTR [edx+29]
	cmp	DWORD PTR _temp$[ebp], eax
	je	SHORT $L1307
; Line 450
	mov	eax, -4					; fffffffcH
	jmp	SHORT $L1301
$L1307:
; Line 453
	mov	DWORD PTR _temp$[ebp], 0
; Line 454
	mov	ecx, DWORD PTR _ARPPack$[ebp]
	movsx	edx, BYTE PTR [ecx+6]
	and	edx, 255				; 000000ffH
	mov	DWORD PTR _temp$[ebp], edx
; Line 455
	mov	eax, DWORD PTR _temp$[ebp]
	shl	eax, 8
	mov	DWORD PTR _temp$[ebp], eax
; Line 456
	mov	ecx, DWORD PTR _ARPPack$[ebp]
	movsx	edx, BYTE PTR [ecx+7]
	and	edx, 255				; 000000ffH
	mov	eax, DWORD PTR _temp$[ebp]
	or	eax, edx
	mov	DWORD PTR _temp$[ebp], eax
; Line 458
	cmp	DWORD PTR _temp$[ebp], 1
	jne	SHORT $L1308
; Line 461
	mov	ecx, DWORD PTR _currenttask$[ebp]
	push	ecx
	mov	edx, DWORD PTR _size$[ebp]
	push	edx
	mov	eax, DWORD PTR _ARPPack$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?ProcessRequest@ARPObj@@QAEHPADHH@Z	; ARPObj::ProcessRequest
	mov	DWORD PTR _retcode$[ebp], eax
; Line 462
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	SHORT $L1301
$L1308:
; Line 465
	cmp	DWORD PTR _temp$[ebp], 2
	jne	SHORT $L1310
; Line 468
	mov	ecx, DWORD PTR _size$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ARPPack$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?ProcessReplies@ARPObj@@QAEHPADH@Z	; ARPObj::ProcessReplies
	mov	DWORD PTR _retcode$[ebp], eax
; Line 469
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	SHORT $L1301
$L1310:
; Line 474
	mov	eax, -5					; fffffffbH
$L1301:
; Line 478
	mov	esp, ebp
	pop	ebp
	ret	12					; 0000000cH
?ARPHandler@ARPObj@@QAEHPADHH@Z ENDP			; ARPObj::ARPHandler
_TEXT	ENDS
PUBLIC	??0FTOPObj@@QAE@XZ				; FTOPObj::FTOPObj
EXTRN	?getMode@FTOPObj@@QAEHXZ:NEAR			; FTOPObj::getMode
_TEXT	SEGMENT
_ARPPack$ = 8
_currenttask$ = 16
_this$ = -136
_fto$ = -28
_i$ = -32
_ARP_PACK$ = -132
_retcode$ = -8
_ARPFound$ = -4
_count1$ = -12
?ProcessRequest@ARPObj@@QAEHPADHH@Z PROC NEAR		; ARPObj::ProcessRequest
; Line 487
	push	ebp
	mov	ebp, esp
	sub	esp, 136				; 00000088H
	mov	DWORD PTR _this$[ebp], ecx
; Line 488
	lea	ecx, DWORD PTR _fto$[ebp]
	call	??0FTOPObj@@QAE@XZ			; FTOPObj::FTOPObj
; Line 489
	mov	DWORD PTR _i$[ebp], 0
; Line 492
	mov	eax, DWORD PTR ?noArprequestp@ARPObj@@0KA ; ARPObj::noArprequestp
	add	eax, 1
	mov	DWORD PTR ?noArprequestp@ARPObj@@0KA, eax ; ARPObj::noArprequestp
; Line 493
	mov	DWORD PTR _ARPFound$[ebp], 0
; Line 494
	mov	DWORD PTR _count1$[ebp], 0
$L1325:
; Line 496
	mov	ecx, 1
	test	ecx, ecx
	je	SHORT $L1326
	jmp	SHORT $L1325
$L1326:
; Line 498
	mov	edx, DWORD PTR _ARPPack$[ebp]
	movsx	eax, BYTE PTR [edx+24]
	movsx	ecx, BYTE PTR ?mSenderIP@ARPObj@@0PADA
	cmp	eax, ecx
	jne	$L1342
	mov	edx, DWORD PTR _ARPPack$[ebp]
	movsx	eax, BYTE PTR [edx+25]
	movsx	ecx, BYTE PTR ?mSenderIP@ARPObj@@0PADA+1
	cmp	eax, ecx
	jne	$L1342
	mov	edx, DWORD PTR _ARPPack$[ebp]
	movsx	eax, BYTE PTR [edx+26]
	movsx	ecx, BYTE PTR ?mSenderIP@ARPObj@@0PADA+2
	cmp	eax, ecx
	jne	$L1342
	mov	edx, DWORD PTR _ARPPack$[ebp]
	movsx	eax, BYTE PTR [edx+27]
	movsx	ecx, BYTE PTR ?mSenderIP@ARPObj@@0PADA+3
	cmp	eax, ecx
	jne	$L1342
; Line 502
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+16]
	sar	eax, 8
	and	eax, 255				; 000000ffH
	mov	BYTE PTR _ARP_PACK$[ebp], al
; Line 503
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+16]
	and	edx, 255				; 000000ffH
	mov	BYTE PTR _ARP_PACK$[ebp+1], dl
; Line 506
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+20]
	sar	ecx, 8
	and	ecx, 255				; 000000ffH
	mov	BYTE PTR _ARP_PACK$[ebp+2], cl
; Line 507
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+20]
	and	eax, 255				; 000000ffH
	mov	BYTE PTR _ARP_PACK$[ebp+3], al
; Line 510
	mov	ecx, DWORD PTR _this$[ebp]
	movsx	edx, BYTE PTR [ecx+28]
	and	edx, 255				; 000000ffH
	mov	BYTE PTR _ARP_PACK$[ebp+4], dl
; Line 513
	mov	eax, DWORD PTR _this$[ebp]
	movsx	ecx, BYTE PTR [eax+29]
	and	ecx, 255				; 000000ffH
	mov	BYTE PTR _ARP_PACK$[ebp+5], cl
; Line 516
	mov	BYTE PTR _ARP_PACK$[ebp+6], 0
; Line 517
	mov	BYTE PTR _ARP_PACK$[ebp+7], 2
; Line 520
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1328
$L1329:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L1328:
	cmp	DWORD PTR _i$[ebp], 6
	jge	SHORT $L1330
; Line 522
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	dl, BYTE PTR ?mSenderHA@ARPObj@@0PADA[ecx]
	mov	BYTE PTR _ARP_PACK$[ebp+eax+8], dl
; Line 523
	mov	eax, DWORD PTR _ARPPack$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	dl, BYTE PTR [eax+8]
	mov	BYTE PTR _ARP_PACK$[ebp+ecx+18], dl
; Line 524
	jmp	SHORT $L1329
$L1330:
; Line 527
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1331
$L1332:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L1331:
	cmp	DWORD PTR _i$[ebp], 4
	jge	SHORT $L1333
; Line 529
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	mov	al, BYTE PTR ?mSenderIP@ARPObj@@0PADA[edx]
	mov	BYTE PTR _ARP_PACK$[ebp+ecx+14], al
; Line 530
	mov	ecx, DWORD PTR _ARPPack$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	mov	al, BYTE PTR [ecx+14]
	mov	BYTE PTR _ARP_PACK$[ebp+edx+24], al
; Line 531
	jmp	SHORT $L1332
$L1333:
; Line 533
	lea	ecx, DWORD PTR _fto$[ebp]
	call	?getMode@FTOPObj@@QAEHXZ		; FTOPObj::getMode
	cmp	eax, 1
	jne	$L1337
; Line 538
	push	208					; 000000d0H
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?AOAgetSharedMem@AOAProtected@@QAEJH@Z	; AOAProtected::AOAgetSharedMem
	mov	DWORD PTR _retcode$[ebp], eax
; Line 539
	mov	ecx, DWORD PTR _retcode$[ebp]
	add	ecx, 1
	mov	DWORD PTR _retcode$[ebp], ecx
; Line 540
	mov	edx, DWORD PTR _retcode$[ebp]
	push	edx
	push	208					; 000000d0H
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 542
	push	180					; 000000b4H
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?AOAgetSharedMem@AOAProtected@@QAEJH@Z	; AOAProtected::AOAgetSharedMem
	mov	DWORD PTR _retcode$[ebp], eax
; Line 543
	mov	eax, DWORD PTR _retcode$[ebp]
	add	eax, 1
	mov	DWORD PTR _retcode$[ebp], eax
; Line 544
	mov	ecx, DWORD PTR _retcode$[ebp]
	push	ecx
	push	180					; 000000b4H
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 546
	push	208					; 000000d0H
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?AOAgetSharedMem@AOAProtected@@QAEJH@Z	; AOAProtected::AOAgetSharedMem
	mov	DWORD PTR _retcode$[ebp], eax
; Line 547
	mov	edx, DWORD PTR _retcode$[ebp]
	add	edx, 1
	mov	DWORD PTR _retcode$[ebp], edx
; Line 548
	mov	eax, DWORD PTR _retcode$[ebp]
	push	eax
	push	208					; 000000d0H
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 550
	mov	ecx, DWORD PTR _currenttask$[ebp]
	push	ecx
	push	7
	mov	edx, DWORD PTR _ARPPack$[ebp]
	add	edx, 8
	push	edx
	push	OFFSET FLAT:?mSenderHA@ARPObj@@0PADA	; ARPObj::mSenderHA
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+24]
	push	ecx
	push	28					; 0000001cH
	lea	edx, DWORD PTR _ARP_PACK$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?ARPInsertPkt@EtherObj@@QAEHPADHH00HH@Z	; EtherObj::ARPInsertPkt
	mov	DWORD PTR _retcode$[ebp], eax
; Line 551
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L1337
; Line 553
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L1317
$L1337:
; Line 557
	mov	DWORD PTR _ARPFound$[ebp], 0
; Line 558
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1338
$L1339:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L1338:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR ?ARPT_Index@ARPObj@@2HA	; ARPObj::ARPT_Index
	jge	SHORT $L1340
; Line 561
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 10					; 0000000aH
	movsx	eax, BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[edx]
	mov	ecx, DWORD PTR _ARPPack$[ebp]
	movsx	edx, BYTE PTR [ecx+14]
	cmp	eax, edx
	jne	SHORT $L1341
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 10					; 0000000aH
	movsx	ecx, BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[eax+1]
	mov	edx, DWORD PTR _ARPPack$[ebp]
	movsx	eax, BYTE PTR [edx+15]
	cmp	ecx, eax
	jne	SHORT $L1341
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 10					; 0000000aH
	movsx	edx, BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[ecx+2]
	mov	eax, DWORD PTR _ARPPack$[ebp]
	movsx	ecx, BYTE PTR [eax+16]
	cmp	edx, ecx
	jne	SHORT $L1341
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 10					; 0000000aH
	movsx	eax, BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[edx+3]
	mov	ecx, DWORD PTR _ARPPack$[ebp]
	movsx	edx, BYTE PTR [ecx+17]
	cmp	eax, edx
	jne	SHORT $L1341
; Line 563
	mov	DWORD PTR _ARPFound$[ebp], 1
; Line 564
	jmp	SHORT $L1340
$L1341:
; Line 566
	jmp	SHORT $L1339
$L1340:
; Line 569
	cmp	DWORD PTR _ARPFound$[ebp], 0
	jne	$L1342
; Line 571
	mov	eax, DWORD PTR ?ARPT_Index@ARPObj@@2HA	; ARPObj::ARPT_Index
	imul	eax, 10					; 0000000aH
	mov	ecx, DWORD PTR _ARPPack$[ebp]
	mov	dl, BYTE PTR [ecx+14]
	mov	BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[eax], dl
; Line 572
	mov	eax, DWORD PTR ?ARPT_Index@ARPObj@@2HA	; ARPObj::ARPT_Index
	imul	eax, 10					; 0000000aH
	mov	ecx, DWORD PTR _ARPPack$[ebp]
	mov	dl, BYTE PTR [ecx+15]
	mov	BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[eax+1], dl
; Line 573
	mov	eax, DWORD PTR ?ARPT_Index@ARPObj@@2HA	; ARPObj::ARPT_Index
	imul	eax, 10					; 0000000aH
	mov	ecx, DWORD PTR _ARPPack$[ebp]
	mov	dl, BYTE PTR [ecx+16]
	mov	BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[eax+2], dl
; Line 574
	mov	eax, DWORD PTR ?ARPT_Index@ARPObj@@2HA	; ARPObj::ARPT_Index
	imul	eax, 10					; 0000000aH
	mov	ecx, DWORD PTR _ARPPack$[ebp]
	mov	dl, BYTE PTR [ecx+17]
	mov	BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[eax+3], dl
; Line 575
	mov	eax, DWORD PTR ?ARPT_Index@ARPObj@@2HA	; ARPObj::ARPT_Index
	imul	eax, 10					; 0000000aH
	mov	ecx, DWORD PTR _ARPPack$[ebp]
	mov	dl, BYTE PTR [ecx+8]
	mov	BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[eax+4], dl
; Line 576
	mov	eax, DWORD PTR ?ARPT_Index@ARPObj@@2HA	; ARPObj::ARPT_Index
	imul	eax, 10					; 0000000aH
	mov	ecx, DWORD PTR _ARPPack$[ebp]
	mov	dl, BYTE PTR [ecx+9]
	mov	BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[eax+5], dl
; Line 577
	mov	eax, DWORD PTR ?ARPT_Index@ARPObj@@2HA	; ARPObj::ARPT_Index
	imul	eax, 10					; 0000000aH
	mov	ecx, DWORD PTR _ARPPack$[ebp]
	mov	dl, BYTE PTR [ecx+10]
	mov	BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[eax+6], dl
; Line 578
	mov	eax, DWORD PTR ?ARPT_Index@ARPObj@@2HA	; ARPObj::ARPT_Index
	imul	eax, 10					; 0000000aH
	mov	ecx, DWORD PTR _ARPPack$[ebp]
	mov	dl, BYTE PTR [ecx+11]
	mov	BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[eax+7], dl
; Line 579
	mov	eax, DWORD PTR ?ARPT_Index@ARPObj@@2HA	; ARPObj::ARPT_Index
	imul	eax, 10					; 0000000aH
	mov	ecx, DWORD PTR _ARPPack$[ebp]
	mov	dl, BYTE PTR [ecx+12]
	mov	BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[eax+8], dl
; Line 580
	mov	eax, DWORD PTR ?ARPT_Index@ARPObj@@2HA	; ARPObj::ARPT_Index
	imul	eax, 10					; 0000000aH
	mov	ecx, DWORD PTR _ARPPack$[ebp]
	mov	dl, BYTE PTR [ecx+13]
	mov	BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[eax+9], dl
; Line 582
	mov	eax, DWORD PTR ?ARPT_Index@ARPObj@@2HA	; ARPObj::ARPT_Index
	add	eax, 1
	mov	DWORD PTR ?ARPT_Index@ARPObj@@2HA, eax	; ARPObj::ARPT_Index
$L1342:
; Line 727
	xor	eax, eax
$L1317:
; Line 728
	mov	esp, ebp
	pop	ebp
	ret	12					; 0000000cH
?ProcessRequest@ARPObj@@QAEHPADHH@Z ENDP		; ARPObj::ProcessRequest
_TEXT	ENDS
;	COMDAT ??0FTOPObj@@QAE@XZ
_TEXT	SEGMENT
_this$ = -4
??0FTOPObj@@QAE@XZ PROC NEAR				; FTOPObj::FTOPObj, COMDAT
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	??0EtherObj@@QAE@XZ			; EtherObj::EtherObj
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	??0AOAProtected@@QAE@XZ			; AOAProtected::AOAProtected
	mov	eax, DWORD PTR _this$[ebp]
	mov	esp, ebp
	pop	ebp
	ret	0
??0FTOPObj@@QAE@XZ ENDP					; FTOPObj::FTOPObj
_TEXT	ENDS
_TEXT	SEGMENT
_ARPPack$ = 8
_this$ = -12
_ARPFound$ = -4
_i$ = -8
?ProcessReplies@ARPObj@@QAEHPADH@Z PROC NEAR		; ARPObj::ProcessReplies
; Line 737
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 738
	mov	DWORD PTR _ARPFound$[ebp], 0
; Line 739
	mov	DWORD PTR _i$[ebp], 0
; Line 743
	mov	eax, DWORD PTR _ARPPack$[ebp]
	movsx	ecx, BYTE PTR [eax+24]
	movsx	edx, BYTE PTR ?mSenderIP@ARPObj@@0PADA
	cmp	ecx, edx
	jne	$L1357
	mov	eax, DWORD PTR _ARPPack$[ebp]
	movsx	ecx, BYTE PTR [eax+25]
	movsx	edx, BYTE PTR ?mSenderIP@ARPObj@@0PADA+1
	cmp	ecx, edx
	jne	$L1357
	mov	eax, DWORD PTR _ARPPack$[ebp]
	movsx	ecx, BYTE PTR [eax+26]
	movsx	edx, BYTE PTR ?mSenderIP@ARPObj@@0PADA+2
	cmp	ecx, edx
	jne	$L1357
	mov	eax, DWORD PTR _ARPPack$[ebp]
	movsx	ecx, BYTE PTR [eax+27]
	movsx	edx, BYTE PTR ?mSenderIP@ARPObj@@0PADA+3
	cmp	ecx, edx
	jne	$L1357
; Line 745
	mov	DWORD PTR _ARPFound$[ebp], 0
; Line 747
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1353
$L1354:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L1353:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR ?ARPT_Index@ARPObj@@2HA	; ARPObj::ARPT_Index
	jge	SHORT $L1355
; Line 750
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 10					; 0000000aH
	movsx	eax, BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[edx]
	mov	ecx, DWORD PTR _ARPPack$[ebp]
	movsx	edx, BYTE PTR [ecx+14]
	cmp	eax, edx
	jne	SHORT $L1356
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 10					; 0000000aH
	movsx	ecx, BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[eax+1]
	mov	edx, DWORD PTR _ARPPack$[ebp]
	movsx	eax, BYTE PTR [edx+15]
	cmp	ecx, eax
	jne	SHORT $L1356
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 10					; 0000000aH
	movsx	edx, BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[ecx+2]
	mov	eax, DWORD PTR _ARPPack$[ebp]
	movsx	ecx, BYTE PTR [eax+16]
	cmp	edx, ecx
	jne	SHORT $L1356
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 10					; 0000000aH
	movsx	eax, BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[edx+3]
	mov	ecx, DWORD PTR _ARPPack$[ebp]
	movsx	edx, BYTE PTR [ecx+17]
	cmp	eax, edx
	jne	SHORT $L1356
; Line 752
	mov	DWORD PTR _ARPFound$[ebp], 1
; Line 753
	jmp	SHORT $L1355
$L1356:
; Line 755
	jmp	SHORT $L1354
$L1355:
; Line 759
	cmp	DWORD PTR _ARPFound$[ebp], 0
	jne	$L1357
; Line 761
	mov	eax, DWORD PTR ?ARPT_Index@ARPObj@@2HA	; ARPObj::ARPT_Index
	imul	eax, 10					; 0000000aH
	mov	ecx, DWORD PTR _ARPPack$[ebp]
	mov	dl, BYTE PTR [ecx+14]
	mov	BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[eax], dl
; Line 762
	mov	eax, DWORD PTR ?ARPT_Index@ARPObj@@2HA	; ARPObj::ARPT_Index
	imul	eax, 10					; 0000000aH
	mov	ecx, DWORD PTR _ARPPack$[ebp]
	mov	dl, BYTE PTR [ecx+15]
	mov	BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[eax+1], dl
; Line 763
	mov	eax, DWORD PTR ?ARPT_Index@ARPObj@@2HA	; ARPObj::ARPT_Index
	imul	eax, 10					; 0000000aH
	mov	ecx, DWORD PTR _ARPPack$[ebp]
	mov	dl, BYTE PTR [ecx+16]
	mov	BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[eax+2], dl
; Line 764
	mov	eax, DWORD PTR ?ARPT_Index@ARPObj@@2HA	; ARPObj::ARPT_Index
	imul	eax, 10					; 0000000aH
	mov	ecx, DWORD PTR _ARPPack$[ebp]
	mov	dl, BYTE PTR [ecx+17]
	mov	BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[eax+3], dl
; Line 765
	mov	eax, DWORD PTR ?ARPT_Index@ARPObj@@2HA	; ARPObj::ARPT_Index
	imul	eax, 10					; 0000000aH
	mov	ecx, DWORD PTR _ARPPack$[ebp]
	mov	dl, BYTE PTR [ecx+8]
	mov	BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[eax+4], dl
; Line 766
	mov	eax, DWORD PTR ?ARPT_Index@ARPObj@@2HA	; ARPObj::ARPT_Index
	imul	eax, 10					; 0000000aH
	mov	ecx, DWORD PTR _ARPPack$[ebp]
	mov	dl, BYTE PTR [ecx+9]
	mov	BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[eax+5], dl
; Line 767
	mov	eax, DWORD PTR ?ARPT_Index@ARPObj@@2HA	; ARPObj::ARPT_Index
	imul	eax, 10					; 0000000aH
	mov	ecx, DWORD PTR _ARPPack$[ebp]
	mov	dl, BYTE PTR [ecx+10]
	mov	BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[eax+6], dl
; Line 768
	mov	eax, DWORD PTR ?ARPT_Index@ARPObj@@2HA	; ARPObj::ARPT_Index
	imul	eax, 10					; 0000000aH
	mov	ecx, DWORD PTR _ARPPack$[ebp]
	mov	dl, BYTE PTR [ecx+11]
	mov	BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[eax+7], dl
; Line 769
	mov	eax, DWORD PTR ?ARPT_Index@ARPObj@@2HA	; ARPObj::ARPT_Index
	imul	eax, 10					; 0000000aH
	mov	ecx, DWORD PTR _ARPPack$[ebp]
	mov	dl, BYTE PTR [ecx+12]
	mov	BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[eax+8], dl
; Line 770
	mov	eax, DWORD PTR ?ARPT_Index@ARPObj@@2HA	; ARPObj::ARPT_Index
	imul	eax, 10					; 0000000aH
	mov	ecx, DWORD PTR _ARPPack$[ebp]
	mov	dl, BYTE PTR [ecx+13]
	mov	BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[eax+9], dl
; Line 771
	mov	eax, DWORD PTR ?ARPT_Index@ARPObj@@2HA	; ARPObj::ARPT_Index
	add	eax, 1
	mov	DWORD PTR ?ARPT_Index@ARPObj@@2HA, eax	; ARPObj::ARPT_Index
$L1357:
; Line 852
	xor	eax, eax
; Line 853
	mov	esp, ebp
	pop	ebp
	ret	8
?ProcessReplies@ARPObj@@QAEHPADH@Z ENDP			; ARPObj::ProcessReplies
_TEXT	ENDS
PUBLIC	?hashFun@ARPObj@@AAEHPAD@Z			; ARPObj::hashFun
_TEXT	SEGMENT
_ip$ = 8
_this$ = -12
_temp$ = -4
_i$ = -8
?hashFun@ARPObj@@AAEHPAD@Z PROC NEAR			; ARPObj::hashFun
; Line 860
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 861
	mov	DWORD PTR _temp$[ebp], 0
; Line 862
	mov	DWORD PTR _i$[ebp], 0
; Line 863
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1364
$L1365:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L1364:
	cmp	DWORD PTR _i$[ebp], 4
	jge	SHORT $L1366
; Line 865
	mov	ecx, DWORD PTR _ip$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	movsx	edx, BYTE PTR [ecx]
	mov	eax, DWORD PTR _temp$[ebp]
	add	eax, edx
	mov	DWORD PTR _temp$[ebp], eax
; Line 866
	jmp	SHORT $L1365
$L1366:
; Line 867
	mov	eax, DWORD PTR _temp$[ebp]
	cdq
	mov	ecx, 100				; 00000064H
	idiv	ecx
	mov	eax, edx
; Line 868
	mov	esp, ebp
	pop	ebp
	ret	4
?hashFun@ARPObj@@AAEHPAD@Z ENDP				; ARPObj::hashFun
_TEXT	ENDS
PUBLIC	?close@ARPObj@@QAEXXZ				; ARPObj::close
_TEXT	SEGMENT
_this$ = -4
?close@ARPObj@@QAEXXZ PROC NEAR				; ARPObj::close
; Line 873
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 875
	mov	esp, ebp
	pop	ebp
	ret	0
?close@ARPObj@@QAEXXZ ENDP				; ARPObj::close
_TEXT	ENDS
PUBLIC	?Response@ARPObj@@QAEHPADH@Z			; ARPObj::Response
_TEXT	SEGMENT
_targetIP$ = 8
_currenttask$ = 12
_this$ = -124
_retcode$ = -4
_ARP_PACK$ = -120
_targetHA$ = -20
_count1$ = -8
_i$ = -12
?Response@ARPObj@@QAEHPADH@Z PROC NEAR			; ARPObj::Response
; Line 883
	push	ebp
	mov	ebp, esp
	sub	esp, 124				; 0000007cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 886
	mov	BYTE PTR _targetHA$[ebp], -1
	mov	BYTE PTR _targetHA$[ebp+1], -1
	mov	BYTE PTR _targetHA$[ebp+2], -1
	mov	BYTE PTR _targetHA$[ebp+3], -1
	mov	BYTE PTR _targetHA$[ebp+4], -1
	mov	BYTE PTR _targetHA$[ebp+5], -1
; Line 887
	mov	DWORD PTR _count1$[ebp], 0
; Line 891
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+16]
	sar	ecx, 8
	and	ecx, 255				; 000000ffH
	mov	BYTE PTR _ARP_PACK$[ebp], cl
; Line 892
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+16]
	and	eax, 255				; 000000ffH
	mov	BYTE PTR _ARP_PACK$[ebp+1], al
; Line 895
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+20]
	sar	edx, 8
	and	edx, 255				; 000000ffH
	mov	BYTE PTR _ARP_PACK$[ebp+2], dl
; Line 896
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+20]
	and	ecx, 255				; 000000ffH
	mov	BYTE PTR _ARP_PACK$[ebp+3], cl
; Line 899
	mov	edx, DWORD PTR _this$[ebp]
	movsx	eax, BYTE PTR [edx+28]
	and	eax, 255				; 000000ffH
	mov	BYTE PTR _ARP_PACK$[ebp+4], al
; Line 901
	mov	ecx, DWORD PTR _this$[ebp]
	movsx	edx, BYTE PTR [ecx+29]
	and	edx, 255				; 000000ffH
	mov	BYTE PTR _ARP_PACK$[ebp+5], dl
; Line 904
	mov	BYTE PTR _ARP_PACK$[ebp+6], 0
; Line 905
	mov	BYTE PTR _ARP_PACK$[ebp+7], 2
; Line 908
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1380
$L1381:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L1380:
	cmp	DWORD PTR _i$[ebp], 6
	jge	SHORT $L1382
; Line 910
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	mov	al, BYTE PTR ?mSenderHA@ARPObj@@0PADA[edx]
	mov	BYTE PTR _ARP_PACK$[ebp+ecx+8], al
; Line 911
	mov	ecx, DWORD PTR _i$[ebp]
	mov	BYTE PTR _ARP_PACK$[ebp+ecx+18], -1
; Line 912
	jmp	SHORT $L1381
$L1382:
; Line 914
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1383
$L1384:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L1383:
	cmp	DWORD PTR _i$[ebp], 4
	jge	SHORT $L1385
; Line 916
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	dl, BYTE PTR ?mSenderIP@ARPObj@@0PADA[ecx]
	mov	BYTE PTR _ARP_PACK$[ebp+eax+14], dl
; Line 917
	mov	eax, DWORD PTR _targetIP$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	dl, BYTE PTR [eax]
	mov	BYTE PTR _ARP_PACK$[ebp+ecx+24], dl
; Line 918
	jmp	SHORT $L1384
$L1385:
; Line 922
	push	180					; 000000b4H
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?AOAgetSharedMem@AOAProtected@@QAEJH@Z	; AOAProtected::AOAgetSharedMem
	mov	DWORD PTR _retcode$[ebp], eax
; Line 923
	mov	eax, DWORD PTR _retcode$[ebp]
	add	eax, 1
	mov	DWORD PTR _retcode$[ebp], eax
; Line 924
	mov	ecx, DWORD PTR _retcode$[ebp]
	push	ecx
	push	180					; 000000b4H
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 926
	push	208					; 000000d0H
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?AOAgetSharedMem@AOAProtected@@QAEJH@Z	; AOAProtected::AOAgetSharedMem
	mov	DWORD PTR _retcode$[ebp], eax
; Line 927
	mov	edx, DWORD PTR _retcode$[ebp]
	add	edx, 1
	mov	DWORD PTR _retcode$[ebp], edx
; Line 928
	mov	eax, DWORD PTR _retcode$[ebp]
	push	eax
	push	208					; 000000d0H
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 930
	mov	ecx, DWORD PTR _currenttask$[ebp]
	push	ecx
	push	7
	lea	edx, DWORD PTR _targetHA$[ebp]
	push	edx
	push	OFFSET FLAT:?mSenderHA@ARPObj@@0PADA	; ARPObj::mSenderHA
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+24]
	push	ecx
	push	28					; 0000001cH
	lea	edx, DWORD PTR _ARP_PACK$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?ARPInsertPkt@EtherObj@@QAEHPADHH00HH@Z	; EtherObj::ARPInsertPkt
	mov	DWORD PTR _retcode$[ebp], eax
; Line 932
	xor	eax, eax
; Line 933
	mov	esp, ebp
	pop	ebp
	ret	8
?Response@ARPObj@@QAEHPADH@Z ENDP			; ARPObj::Response
_TEXT	ENDS
PUBLIC	?printStatistics@ARPObj@@QAEXH@Z		; ARPObj::printStatistics
EXTRN	?AOAprintHex@AOAProtected@@QAEHJH@Z:NEAR	; AOAProtected::AOAprintHex
EXTRN	?AOAPrintText@AOAProtected@@QAEXPADH@Z:NEAR	; AOAProtected::AOAPrintText
_DATA	SEGMENT
$SG1393	DB	'ARP Statistics', 00H
	ORG $+1
$SG1394	DB	'Total Number of ARP Packets Processed    :', 00H
	ORG $+1
$SG1395	DB	'Total Number of ARP resolution successful:', 00H
	ORG $+1
$SG1396	DB	'Total Number of ARP resolution failed    :', 00H
	ORG $+1
$SG1397	DB	'Total Number of ARP request processed    :', 00H
_DATA	ENDS
_TEXT	SEGMENT
_Line$ = 8
_this$ = -12
_io$ = -8
?printStatistics@ARPObj@@QAEXH@Z PROC NEAR		; ARPObj::printStatistics
; Line 938
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 939
	lea	ecx, DWORD PTR _io$[ebp]
	call	??0AOAProtected@@QAE@XZ			; AOAProtected::AOAProtected
; Line 940
	mov	eax, DWORD PTR _Line$[ebp]
	push	eax
	push	OFFSET FLAT:$SG1393
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 941
	mov	ecx, DWORD PTR _Line$[ebp]
	add	ecx, 160				; 000000a0H
	push	ecx
	push	OFFSET FLAT:$SG1394
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 942
	mov	edx, DWORD PTR _Line$[ebp]
	add	edx, 248				; 000000f8H
	push	edx
	mov	eax, DWORD PTR ?noArppackp@ARPObj@@0KA	; ARPObj::noArppackp
	push	eax
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 943
	mov	ecx, DWORD PTR _Line$[ebp]
	add	ecx, 320				; 00000140H
	push	ecx
	push	OFFSET FLAT:$SG1395
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 944
	mov	edx, DWORD PTR _Line$[ebp]
	add	edx, 408				; 00000198H
	push	edx
	mov	eax, DWORD PTR ?noArpresolves@ARPObj@@0KA ; ARPObj::noArpresolves
	push	eax
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 945
	mov	ecx, DWORD PTR _Line$[ebp]
	add	ecx, 480				; 000001e0H
	push	ecx
	push	OFFSET FLAT:$SG1396
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 946
	mov	edx, DWORD PTR _Line$[ebp]
	add	edx, 568				; 00000238H
	push	edx
	mov	eax, DWORD PTR ?noArpresolvef@ARPObj@@0KA ; ARPObj::noArpresolvef
	push	eax
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 947
	mov	ecx, DWORD PTR _Line$[ebp]
	add	ecx, 640				; 00000280H
	push	ecx
	push	OFFSET FLAT:$SG1397
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 948
	mov	edx, DWORD PTR _Line$[ebp]
	add	edx, 728				; 000002d8H
	push	edx
	mov	eax, DWORD PTR ?noArprequestp@ARPObj@@0KA ; ARPObj::noArprequestp
	push	eax
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 949
	mov	esp, ebp
	pop	ebp
	ret	4
?printStatistics@ARPObj@@QAEXH@Z ENDP			; ARPObj::printStatistics
_TEXT	ENDS
PUBLIC	?printARPTable@ARPObj@@QAEXH@Z			; ARPObj::printARPTable
_TEXT	SEGMENT
_Line$ = 8
_this$ = -16
_io$ = -8
_j$ = -12
?printARPTable@ARPObj@@QAEXH@Z PROC NEAR		; ARPObj::printARPTable
; Line 955
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	mov	DWORD PTR _this$[ebp], ecx
; Line 956
	lea	ecx, DWORD PTR _io$[ebp]
	call	??0AOAProtected@@QAE@XZ			; AOAProtected::AOAProtected
; Line 958
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L1404
$L1405:
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	DWORD PTR _j$[ebp], eax
$L1404:
	cmp	DWORD PTR _j$[ebp], 4
	jge	$L1406
; Line 960
	mov	ecx, DWORD PTR _j$[ebp]
	imul	ecx, 320				; 00000140H
	mov	edx, DWORD PTR _Line$[ebp]
	lea	eax, DWORD PTR [edx+ecx+20]
	push	eax
	mov	ecx, DWORD PTR _j$[ebp]
	imul	ecx, 10					; 0000000aH
	movsx	edx, BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[ecx]
	push	edx
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 961
	mov	eax, DWORD PTR _j$[ebp]
	imul	eax, 320				; 00000140H
	mov	ecx, DWORD PTR _Line$[ebp]
	lea	edx, DWORD PTR [ecx+eax+40]
	push	edx
	mov	eax, DWORD PTR _j$[ebp]
	imul	eax, 10					; 0000000aH
	movsx	ecx, BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[eax+1]
	push	ecx
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 962
	mov	edx, DWORD PTR _j$[ebp]
	imul	edx, 320				; 00000140H
	mov	eax, DWORD PTR _Line$[ebp]
	lea	ecx, DWORD PTR [eax+edx+60]
	push	ecx
	mov	edx, DWORD PTR _j$[ebp]
	imul	edx, 10					; 0000000aH
	movsx	eax, BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[edx+2]
	push	eax
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 963
	mov	ecx, DWORD PTR _j$[ebp]
	imul	ecx, 320				; 00000140H
	mov	edx, DWORD PTR _Line$[ebp]
	lea	eax, DWORD PTR [edx+ecx+80]
	push	eax
	mov	ecx, DWORD PTR _j$[ebp]
	imul	ecx, 10					; 0000000aH
	movsx	edx, BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[ecx+3]
	push	edx
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 965
	mov	eax, DWORD PTR _j$[ebp]
	imul	eax, 320				; 00000140H
	mov	ecx, DWORD PTR _Line$[ebp]
	lea	edx, DWORD PTR [ecx+eax+180]
	push	edx
	mov	eax, DWORD PTR _j$[ebp]
	imul	eax, 10					; 0000000aH
	movsx	ecx, BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[eax+4]
	push	ecx
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 966
	mov	edx, DWORD PTR _j$[ebp]
	imul	edx, 320				; 00000140H
	mov	eax, DWORD PTR _Line$[ebp]
	lea	ecx, DWORD PTR [eax+edx+200]
	push	ecx
	mov	edx, DWORD PTR _j$[ebp]
	imul	edx, 10					; 0000000aH
	movsx	eax, BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[edx+5]
	push	eax
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 967
	mov	ecx, DWORD PTR _j$[ebp]
	imul	ecx, 320				; 00000140H
	mov	edx, DWORD PTR _Line$[ebp]
	lea	eax, DWORD PTR [edx+ecx+220]
	push	eax
	mov	ecx, DWORD PTR _j$[ebp]
	imul	ecx, 10					; 0000000aH
	movsx	edx, BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[ecx+6]
	push	edx
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 968
	mov	eax, DWORD PTR _j$[ebp]
	imul	eax, 320				; 00000140H
	mov	ecx, DWORD PTR _Line$[ebp]
	lea	edx, DWORD PTR [ecx+eax+240]
	push	edx
	mov	eax, DWORD PTR _j$[ebp]
	imul	eax, 10					; 0000000aH
	movsx	ecx, BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[eax+7]
	push	ecx
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 969
	mov	edx, DWORD PTR _j$[ebp]
	imul	edx, 320				; 00000140H
	mov	eax, DWORD PTR _Line$[ebp]
	lea	ecx, DWORD PTR [eax+edx+260]
	push	ecx
	mov	edx, DWORD PTR _j$[ebp]
	imul	edx, 10					; 0000000aH
	movsx	eax, BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[edx+8]
	push	eax
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 970
	mov	ecx, DWORD PTR _j$[ebp]
	imul	ecx, 320				; 00000140H
	mov	edx, DWORD PTR _Line$[ebp]
	lea	eax, DWORD PTR [edx+ecx+280]
	push	eax
	mov	ecx, DWORD PTR _j$[ebp]
	imul	ecx, 10					; 0000000aH
	movsx	edx, BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[ecx+9]
	push	edx
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 971
	jmp	$L1405
$L1406:
; Line 972
	mov	esp, ebp
	pop	ebp
	ret	4
?printARPTable@ARPObj@@QAEXH@Z ENDP			; ARPObj::printARPTable
_TEXT	ENDS
END
