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
PUBLIC	?init@ARPObj@@QAEXPAD000@Z			; ARPObj::init
_TEXT	SEGMENT
_senderIP$ = 8
_SubNetMask$ = 12
_GwayIP$ = 16
_srcmac$ = 20
_this$ = -8
_i$ = -4
?init@ARPObj@@QAEXPAD000@Z PROC NEAR			; ARPObj::init
; Line 61
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 62
	mov	DWORD PTR _i$[ebp], 0
; Line 65
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1227
$L1228:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L1227:
	cmp	DWORD PTR _i$[ebp], 6
	jge	SHORT $L1229
; Line 66
	mov	ecx, DWORD PTR _srcmac$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	mov	al, BYTE PTR [ecx]
	mov	BYTE PTR ?mSenderHA@ARPObj@@0PADA[edx], al
	jmp	SHORT $L1228
$L1229:
; Line 68
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+16], 1
; Line 70
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+20], 2048		; 00000800H
; Line 72
	mov	eax, DWORD PTR _this$[ebp]
	mov	BYTE PTR [eax+28], 6
; Line 75
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+29], 4
; Line 79
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+24], 2054		; 00000806H
; Line 83
	push	OFFSET FLAT:?mSenderHA@ARPObj@@0PADA	; ARPObj::mSenderHA
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getMAC@EtherObj@@QAEXPAD@Z		; EtherObj::getMAC
; Line 85
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1230
$L1231:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L1230:
	cmp	DWORD PTR _i$[ebp], 4
	jge	SHORT $L1232
; Line 86
	mov	ecx, DWORD PTR _GwayIP$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	mov	al, BYTE PTR [ecx]
	mov	BYTE PTR ?GateWayIP@ARPObj@@0PADA[edx], al
	jmp	SHORT $L1231
$L1232:
; Line 87
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1233
$L1234:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L1233:
	cmp	DWORD PTR _i$[ebp], 4
	jge	SHORT $L1235
; Line 88
	mov	edx, DWORD PTR _SubNetMask$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	mov	cl, BYTE PTR [edx]
	mov	BYTE PTR ?SUBNETMASK@ARPObj@@0PADA[eax], cl
	jmp	SHORT $L1234
$L1235:
; Line 90
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1236
$L1237:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L1236:
	cmp	DWORD PTR _i$[ebp], 4
	jge	SHORT $L1238
; Line 91
	mov	eax, DWORD PTR _senderIP$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	dl, BYTE PTR [eax]
	mov	BYTE PTR ?mSenderIP@ARPObj@@0PADA[ecx], dl
	jmp	SHORT $L1237
$L1238:
; Line 95
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1239
$L1240:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L1239:
	cmp	DWORD PTR _i$[ebp], 100			; 00000064H
	jge	SHORT $L1241
; Line 97
	mov	ecx, DWORD PTR _i$[ebp]
	shl	ecx, 4
	mov	BYTE PTR ?ARPTABLE@ARPObj@@0PAUarprecord@@A[ecx], 0
; Line 98
	mov	edx, DWORD PTR _i$[ebp]
	shl	edx, 4
	mov	BYTE PTR ?ARPTABLE@ARPObj@@0PAUarprecord@@A[edx+4], 0
; Line 99
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	ecx, DWORD PTR _i$[ebp]
	shl	ecx, 4
	mov	DWORD PTR ?ARPTABLE@ARPObj@@0PAUarprecord@@A[ecx+12], eax
; Line 100
	jmp	SHORT $L1240
$L1241:
; Line 103
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1242
$L1243:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L1242:
	cmp	DWORD PTR _i$[ebp], 4
	jge	SHORT $L1244
; Line 105
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 10					; 0000000aH
	mov	BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[eax], 0
; Line 106
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 10					; 0000000aH
	mov	BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[ecx+4], 0
; Line 107
	jmp	SHORT $L1243
$L1244:
; Line 109
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1245
$L1246:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L1245:
	cmp	DWORD PTR _i$[ebp], 100			; 00000064H
	jge	SHORT $L1247
; Line 111
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR ?hashind@ARPObj@@0PAHA[eax*4], -1
; Line 112
	jmp	SHORT $L1246
$L1247:
; Line 113
	mov	DWORD PTR ?ARPTABLE@ARPObj@@0PAUarprecord@@A+1596, -1
; Line 114
	mov	DWORD PTR ?FreePtr@ARPObj@@0HA, 0	; ARPObj::FreePtr
; Line 116
	mov	esp, ebp
	pop	ebp
	ret	16					; 00000010H
?init@ARPObj@@QAEXPAD000@Z ENDP				; ARPObj::init
_TEXT	ENDS
PUBLIC	?Resolve@ARPObj@@QAEHPAD0H@Z			; ARPObj::Resolve
EXTRN	?ARPInsertPkt@EtherObj@@QAEHPADHH00HH@Z:NEAR	; EtherObj::ARPInsertPkt
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
_m$1263 = -136
_m$1268 = -140
_k$1278 = -144
?Resolve@ARPObj@@QAEHPAD0H@Z PROC NEAR			; ARPObj::Resolve
; Line 127
	push	ebp
	mov	ebp, esp
	sub	esp, 148				; 00000094H
	mov	DWORD PTR _this$[ebp], ecx
; Line 128
	mov	DWORD PTR _retcode$[ebp], 0
; Line 131
	mov	BYTE PTR _targetHA$[ebp], -1
	mov	BYTE PTR _targetHA$[ebp+1], -1
	mov	BYTE PTR _targetHA$[ebp+2], -1
	mov	BYTE PTR _targetHA$[ebp+3], -1
	mov	BYTE PTR _targetHA$[ebp+4], -1
	mov	BYTE PTR _targetHA$[ebp+5], -1
; Line 132
	mov	DWORD PTR _ARP_Found_Flag$[ebp], -1
; Line 133
	mov	DWORD PTR _i$[ebp], 0
; Line 134
	mov	DWORD PTR _j$[ebp], 0
; Line 135
	mov	DWORD PTR _count1$[ebp], 0
; Line 142
	mov	eax, DWORD PTR _stargetIP$[ebp]
	movsx	ecx, BYTE PTR [eax]
	movsx	edx, BYTE PTR ?SUBNETMASK@ARPObj@@0PADA
	and	ecx, edx
	movsx	eax, BYTE PTR ?mSenderIP@ARPObj@@0PADA
	movsx	edx, BYTE PTR ?SUBNETMASK@ARPObj@@0PADA
	and	eax, edx
	cmp	ecx, eax
	jne	$L1262
	mov	eax, DWORD PTR _stargetIP$[ebp]
	movsx	ecx, BYTE PTR [eax+1]
	movsx	edx, BYTE PTR ?SUBNETMASK@ARPObj@@0PADA+1
	and	ecx, edx
	movsx	eax, BYTE PTR ?mSenderIP@ARPObj@@0PADA+1
	movsx	edx, BYTE PTR ?SUBNETMASK@ARPObj@@0PADA+1
	and	eax, edx
	cmp	ecx, eax
	jne	$L1262
	mov	eax, DWORD PTR _stargetIP$[ebp]
	movsx	ecx, BYTE PTR [eax+2]
	movsx	edx, BYTE PTR ?SUBNETMASK@ARPObj@@0PADA+2
	and	ecx, edx
	movsx	eax, BYTE PTR ?mSenderIP@ARPObj@@0PADA+2
	movsx	edx, BYTE PTR ?SUBNETMASK@ARPObj@@0PADA+2
	and	eax, edx
	cmp	ecx, eax
	jne	SHORT $L1262
	mov	eax, DWORD PTR _stargetIP$[ebp]
	movsx	ecx, BYTE PTR [eax+3]
	movsx	edx, BYTE PTR ?SUBNETMASK@ARPObj@@0PADA+3
	and	ecx, edx
	movsx	eax, BYTE PTR ?mSenderIP@ARPObj@@0PADA+3
	movsx	edx, BYTE PTR ?SUBNETMASK@ARPObj@@0PADA+3
	and	eax, edx
	cmp	ecx, eax
	jne	SHORT $L1262
; Line 144
	mov	DWORD PTR _m$1263[ebp], 0
	jmp	SHORT $L1264
$L1265:
	mov	eax, DWORD PTR _m$1263[ebp]
	add	eax, 1
	mov	DWORD PTR _m$1263[ebp], eax
$L1264:
	cmp	DWORD PTR _m$1263[ebp], 4
	jge	SHORT $L1266
; Line 146
	mov	ecx, DWORD PTR _stargetIP$[ebp]
	add	ecx, DWORD PTR _m$1263[ebp]
	mov	edx, DWORD PTR _m$1263[ebp]
	mov	al, BYTE PTR [ecx]
	mov	BYTE PTR _targetIP$[ebp+edx], al
; Line 147
	jmp	SHORT $L1265
$L1266:
; Line 149
	jmp	SHORT $L1271
$L1262:
; Line 151
	mov	DWORD PTR _m$1268[ebp], 0
	jmp	SHORT $L1269
$L1270:
	mov	ecx, DWORD PTR _m$1268[ebp]
	add	ecx, 1
	mov	DWORD PTR _m$1268[ebp], ecx
$L1269:
	cmp	DWORD PTR _m$1268[ebp], 4
	jge	SHORT $L1271
; Line 153
	mov	edx, DWORD PTR _m$1268[ebp]
	mov	eax, DWORD PTR _m$1268[ebp]
	mov	cl, BYTE PTR ?GateWayIP@ARPObj@@0PADA[eax]
	mov	BYTE PTR _targetIP$[ebp+edx], cl
; Line 154
	jmp	SHORT $L1270
$L1271:
; Line 158
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1272
$L1273:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L1272:
	cmp	DWORD PTR _i$[ebp], 4
	jge	SHORT $L1274
; Line 161
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 10					; 0000000aH
	movsx	ecx, BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[eax]
	movsx	edx, BYTE PTR _targetIP$[ebp]
	cmp	ecx, edx
	jne	SHORT $L1275
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 10					; 0000000aH
	movsx	ecx, BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[eax+1]
	movsx	edx, BYTE PTR _targetIP$[ebp+1]
	cmp	ecx, edx
	jne	SHORT $L1275
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 10					; 0000000aH
	movsx	ecx, BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[eax+2]
	movsx	edx, BYTE PTR _targetIP$[ebp+2]
	cmp	ecx, edx
	jne	SHORT $L1275
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 10					; 0000000aH
	movsx	ecx, BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[eax+3]
	movsx	edx, BYTE PTR _targetIP$[ebp+3]
	cmp	ecx, edx
	jne	SHORT $L1275
; Line 163
	mov	DWORD PTR _ARP_Found_Flag$[ebp], 0
; Line 164
	jmp	SHORT $L1274
$L1275:
; Line 168
	mov	DWORD PTR _ARP_Found_Flag$[ebp], -1
; Line 170
	jmp	$L1273
$L1274:
; Line 189
	cmp	DWORD PTR _ARP_Found_Flag$[ebp], 0
	jne	SHORT $L1277
; Line 191
	mov	DWORD PTR _k$1278[ebp], 0
	jmp	SHORT $L1279
$L1280:
	mov	eax, DWORD PTR _k$1278[ebp]
	add	eax, 1
	mov	DWORD PTR _k$1278[ebp], eax
$L1279:
	cmp	DWORD PTR _k$1278[ebp], 6
	jge	SHORT $L1281
; Line 192
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 10					; 0000000aH
	mov	edx, DWORD PTR _targetMAC$[ebp]
	add	edx, DWORD PTR _k$1278[ebp]
	mov	eax, DWORD PTR _k$1278[ebp]
	mov	cl, BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[ecx+eax+4]
	mov	BYTE PTR [edx], cl
	jmp	SHORT $L1280
$L1281:
; Line 193
	mov	eax, DWORD PTR _ARP_Found_Flag$[ebp]
	jmp	$L1253
$L1277:
; Line 199
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+16]
	sar	eax, 8
	and	eax, 255				; 000000ffH
	mov	BYTE PTR _ARP_PACK$[ebp], al
; Line 200
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+16]
	and	edx, 255				; 000000ffH
	mov	BYTE PTR _ARP_PACK$[ebp+1], dl
; Line 203
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+20]
	sar	ecx, 8
	and	ecx, 255				; 000000ffH
	mov	BYTE PTR _ARP_PACK$[ebp+2], cl
; Line 204
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+20]
	and	eax, 255				; 000000ffH
	mov	BYTE PTR _ARP_PACK$[ebp+3], al
; Line 207
	mov	ecx, DWORD PTR _this$[ebp]
	movsx	edx, BYTE PTR [ecx+28]
	and	edx, 255				; 000000ffH
	mov	BYTE PTR _ARP_PACK$[ebp+4], dl
; Line 209
	mov	eax, DWORD PTR _this$[ebp]
	movsx	ecx, BYTE PTR [eax+29]
	and	ecx, 255				; 000000ffH
	mov	BYTE PTR _ARP_PACK$[ebp+5], cl
; Line 212
	mov	BYTE PTR _ARP_PACK$[ebp+6], 0
; Line 213
	mov	BYTE PTR _ARP_PACK$[ebp+7], 1
; Line 216
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1283
$L1284:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L1283:
	cmp	DWORD PTR _i$[ebp], 6
	jge	SHORT $L1285
; Line 218
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	dl, BYTE PTR ?mSenderHA@ARPObj@@0PADA[ecx]
	mov	BYTE PTR _ARP_PACK$[ebp+eax+8], dl
; Line 219
	mov	eax, DWORD PTR _i$[ebp]
	mov	BYTE PTR _ARP_PACK$[ebp+eax+18], 0
; Line 220
	jmp	SHORT $L1284
$L1285:
; Line 222
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1286
$L1287:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L1286:
	cmp	DWORD PTR _i$[ebp], 4
	jge	SHORT $L1288
; Line 224
	mov	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	mov	cl, BYTE PTR ?mSenderIP@ARPObj@@0PADA[eax]
	mov	BYTE PTR _ARP_PACK$[ebp+edx+14], cl
; Line 225
	mov	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	mov	cl, BYTE PTR _targetIP$[ebp+eax]
	mov	BYTE PTR _ARP_PACK$[ebp+edx+24], cl
; Line 226
	jmp	SHORT $L1287
$L1288:
; Line 231
	push	180					; 000000b4H
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?AOAgetSharedMem@AOAProtected@@QAEJH@Z	; AOAProtected::AOAgetSharedMem
	mov	DWORD PTR _retcode$[ebp], eax
; Line 232
	mov	edx, DWORD PTR _retcode$[ebp]
	add	edx, 1
	mov	DWORD PTR _retcode$[ebp], edx
; Line 233
	mov	eax, DWORD PTR _retcode$[ebp]
	push	eax
	push	180					; 000000b4H
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 235
	push	208					; 000000d0H
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?AOAgetSharedMem@AOAProtected@@QAEJH@Z	; AOAProtected::AOAgetSharedMem
	mov	DWORD PTR _retcode$[ebp], eax
; Line 236
	mov	ecx, DWORD PTR _retcode$[ebp]
	add	ecx, 1
	mov	DWORD PTR _retcode$[ebp], ecx
; Line 237
	mov	edx, DWORD PTR _retcode$[ebp]
	push	edx
	push	208					; 000000d0H
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 239
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
; Line 242
	push	184					; 000000b8H
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?AOAgetSharedMem@AOAProtected@@QAEJH@Z	; AOAProtected::AOAgetSharedMem
	mov	DWORD PTR _count1$[ebp], eax
; Line 243
	mov	edx, DWORD PTR _count1$[ebp]
	add	edx, 1
	mov	DWORD PTR _count1$[ebp], edx
; Line 244
	mov	eax, DWORD PTR _count1$[ebp]
	push	eax
	push	240					; 000000f0H
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 354
	mov	ecx, DWORD PTR ?noArpresolvef@ARPObj@@0KA ; ARPObj::noArpresolvef
	add	ecx, 1
	mov	DWORD PTR ?noArpresolvef@ARPObj@@0KA, ecx ; ARPObj::noArpresolvef
; Line 355
	mov	eax, DWORD PTR _ARP_Found_Flag$[ebp]
$L1253:
; Line 356
	mov	esp, ebp
	pop	ebp
	ret	12					; 0000000cH
?Resolve@ARPObj@@QAEHPAD0H@Z ENDP			; ARPObj::Resolve
_TEXT	ENDS
PUBLIC	?ARPBroadcast@ARPObj@@QAEHPAD00@Z		; ARPObj::ARPBroadcast
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
; Line 362
	push	ebp
	mov	ebp, esp
	sub	esp, 92					; 0000005cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 363
	mov	DWORD PTR _retcode$[ebp], 0
; Line 365
	mov	BYTE PTR _targetHA$[ebp], -1
	mov	BYTE PTR _targetHA$[ebp+1], -1
	mov	BYTE PTR _targetHA$[ebp+2], -1
	mov	BYTE PTR _targetHA$[ebp+3], -1
	mov	BYTE PTR _targetHA$[ebp+4], -1
	mov	BYTE PTR _targetHA$[ebp+5], -1
; Line 366
	mov	DWORD PTR _i$[ebp], 0
; Line 369
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+16]
	sar	ecx, 8
	and	ecx, 255				; 000000ffH
	mov	BYTE PTR _ARP_PACK$[ebp], cl
; Line 370
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+16]
	and	eax, 255				; 000000ffH
	mov	BYTE PTR _ARP_PACK$[ebp+1], al
; Line 373
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+20]
	sar	edx, 8
	and	edx, 255				; 000000ffH
	mov	BYTE PTR _ARP_PACK$[ebp+2], dl
; Line 374
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+20]
	and	ecx, 255				; 000000ffH
	mov	BYTE PTR _ARP_PACK$[ebp+3], cl
; Line 377
	mov	edx, DWORD PTR _this$[ebp]
	movsx	eax, BYTE PTR [edx+28]
	and	eax, 255				; 000000ffH
	mov	BYTE PTR _ARP_PACK$[ebp+4], al
; Line 379
	mov	ecx, DWORD PTR _this$[ebp]
	movsx	edx, BYTE PTR [ecx+29]
	and	edx, 255				; 000000ffH
	mov	BYTE PTR _ARP_PACK$[ebp+5], dl
; Line 382
	mov	BYTE PTR _ARP_PACK$[ebp+6], 0
; Line 383
	mov	BYTE PTR _ARP_PACK$[ebp+7], 1
; Line 386
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1301
$L1302:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L1301:
	cmp	DWORD PTR _i$[ebp], 6
	jge	SHORT $L1303
; Line 388
	mov	ecx, DWORD PTR _srcmac$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	mov	al, BYTE PTR [ecx]
	mov	BYTE PTR _ARP_PACK$[ebp+edx+8], al
; Line 389
	mov	ecx, DWORD PTR _i$[ebp]
	mov	BYTE PTR _ARP_PACK$[ebp+ecx+18], 0
; Line 390
	jmp	SHORT $L1302
$L1303:
; Line 392
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1304
$L1305:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L1304:
	cmp	DWORD PTR _i$[ebp], 4
	jge	SHORT $L1306
; Line 394
	mov	eax, DWORD PTR _srcip$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	dl, BYTE PTR [eax]
	mov	BYTE PTR _ARP_PACK$[ebp+ecx+14], dl
; Line 395
	mov	eax, DWORD PTR _targetIP$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	dl, BYTE PTR [eax]
	mov	BYTE PTR _ARP_PACK$[ebp+ecx+24], dl
; Line 396
	jmp	SHORT $L1305
$L1306:
; Line 399
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
; Line 402
	xor	eax, eax
; Line 403
	mov	esp, ebp
	pop	ebp
	ret	12					; 0000000cH
?ARPBroadcast@ARPObj@@QAEHPAD00@Z ENDP			; ARPObj::ARPBroadcast
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
; Line 422
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 424
	mov	DWORD PTR _temp$[ebp], 0
; Line 425
	mov	DWORD PTR _retcode$[ebp], 0
; Line 426
	mov	eax, DWORD PTR ?noArppackp@ARPObj@@0KA	; ARPObj::noArppackp
	add	eax, 1
	mov	DWORD PTR ?noArppackp@ARPObj@@0KA, eax	; ARPObj::noArppackp
; Line 428
	mov	ecx, DWORD PTR _ARPPack$[ebp]
	movsx	edx, BYTE PTR [ecx]
	and	edx, 255				; 000000ffH
	mov	DWORD PTR _temp$[ebp], edx
; Line 429
	mov	eax, DWORD PTR _temp$[ebp]
	shl	eax, 8
	mov	DWORD PTR _temp$[ebp], eax
; Line 430
	mov	ecx, DWORD PTR _ARPPack$[ebp]
	movsx	edx, BYTE PTR [ecx+1]
	and	edx, 255				; 000000ffH
	mov	eax, DWORD PTR _temp$[ebp]
	or	eax, edx
	mov	DWORD PTR _temp$[ebp], eax
; Line 432
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _temp$[ebp]
	cmp	edx, DWORD PTR [ecx+16]
	je	SHORT $L1316
; Line 434
	or	eax, -1
	jmp	$L1313
$L1316:
; Line 438
	mov	DWORD PTR _temp$[ebp], 0
; Line 439
	mov	eax, DWORD PTR _ARPPack$[ebp]
	movsx	ecx, BYTE PTR [eax+2]
	and	ecx, 255				; 000000ffH
	mov	DWORD PTR _temp$[ebp], ecx
; Line 440
	mov	edx, DWORD PTR _temp$[ebp]
	shl	edx, 8
	mov	DWORD PTR _temp$[ebp], edx
; Line 441
	mov	eax, DWORD PTR _ARPPack$[ebp]
	movsx	ecx, BYTE PTR [eax+3]
	and	ecx, 255				; 000000ffH
	mov	edx, DWORD PTR _temp$[ebp]
	or	edx, ecx
	mov	DWORD PTR _temp$[ebp], edx
; Line 442
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _temp$[ebp]
	cmp	ecx, DWORD PTR [eax+20]
	je	SHORT $L1317
; Line 443
	mov	eax, -2					; fffffffeH
	jmp	$L1313
$L1317:
; Line 446
	mov	DWORD PTR _temp$[ebp], 0
; Line 447
	mov	edx, DWORD PTR _ARPPack$[ebp]
	movsx	eax, BYTE PTR [edx+4]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _temp$[ebp], eax
; Line 448
	mov	ecx, DWORD PTR _this$[ebp]
	movsx	edx, BYTE PTR [ecx+28]
	cmp	DWORD PTR _temp$[ebp], edx
	je	SHORT $L1318
; Line 449
	mov	eax, -3					; fffffffdH
	jmp	$L1313
$L1318:
; Line 452
	mov	DWORD PTR _temp$[ebp], 0
; Line 453
	mov	eax, DWORD PTR _ARPPack$[ebp]
	movsx	ecx, BYTE PTR [eax+5]
	and	ecx, 255				; 000000ffH
	mov	DWORD PTR _temp$[ebp], ecx
; Line 454
	mov	edx, DWORD PTR _this$[ebp]
	movsx	eax, BYTE PTR [edx+29]
	cmp	DWORD PTR _temp$[ebp], eax
	je	SHORT $L1319
; Line 455
	mov	eax, -4					; fffffffcH
	jmp	SHORT $L1313
$L1319:
; Line 458
	mov	DWORD PTR _temp$[ebp], 0
; Line 459
	mov	ecx, DWORD PTR _ARPPack$[ebp]
	movsx	edx, BYTE PTR [ecx+6]
	and	edx, 255				; 000000ffH
	mov	DWORD PTR _temp$[ebp], edx
; Line 460
	mov	eax, DWORD PTR _temp$[ebp]
	shl	eax, 8
	mov	DWORD PTR _temp$[ebp], eax
; Line 461
	mov	ecx, DWORD PTR _ARPPack$[ebp]
	movsx	edx, BYTE PTR [ecx+7]
	and	edx, 255				; 000000ffH
	mov	eax, DWORD PTR _temp$[ebp]
	or	eax, edx
	mov	DWORD PTR _temp$[ebp], eax
; Line 463
	cmp	DWORD PTR _temp$[ebp], 1
	jne	SHORT $L1320
; Line 466
	mov	ecx, DWORD PTR _currenttask$[ebp]
	push	ecx
	mov	edx, DWORD PTR _size$[ebp]
	push	edx
	mov	eax, DWORD PTR _ARPPack$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?ProcessRequest@ARPObj@@QAEHPADHH@Z	; ARPObj::ProcessRequest
	mov	DWORD PTR _retcode$[ebp], eax
; Line 467
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	SHORT $L1313
$L1320:
; Line 470
	cmp	DWORD PTR _temp$[ebp], 2
	jne	SHORT $L1322
; Line 473
	mov	ecx, DWORD PTR _size$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ARPPack$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?ProcessReplies@ARPObj@@QAEHPADH@Z	; ARPObj::ProcessReplies
	mov	DWORD PTR _retcode$[ebp], eax
; Line 474
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	SHORT $L1313
$L1322:
; Line 479
	mov	eax, -5					; fffffffbH
$L1313:
; Line 483
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
; Line 492
	push	ebp
	mov	ebp, esp
	sub	esp, 136				; 00000088H
	mov	DWORD PTR _this$[ebp], ecx
; Line 493
	lea	ecx, DWORD PTR _fto$[ebp]
	call	??0FTOPObj@@QAE@XZ			; FTOPObj::FTOPObj
; Line 494
	mov	DWORD PTR _i$[ebp], 0
; Line 497
	mov	eax, DWORD PTR ?noArprequestp@ARPObj@@0KA ; ARPObj::noArprequestp
	add	eax, 1
	mov	DWORD PTR ?noArprequestp@ARPObj@@0KA, eax ; ARPObj::noArprequestp
; Line 498
	mov	DWORD PTR _ARPFound$[ebp], 0
; Line 499
	mov	DWORD PTR _count1$[ebp], 0
; Line 502
	mov	ecx, DWORD PTR _ARPPack$[ebp]
	movsx	edx, BYTE PTR [ecx+24]
	movsx	eax, BYTE PTR ?mSenderIP@ARPObj@@0PADA
	cmp	edx, eax
	jne	$L1351
	mov	ecx, DWORD PTR _ARPPack$[ebp]
	movsx	edx, BYTE PTR [ecx+25]
	movsx	eax, BYTE PTR ?mSenderIP@ARPObj@@0PADA+1
	cmp	edx, eax
	jne	$L1351
	mov	ecx, DWORD PTR _ARPPack$[ebp]
	movsx	edx, BYTE PTR [ecx+26]
	movsx	eax, BYTE PTR ?mSenderIP@ARPObj@@0PADA+2
	cmp	edx, eax
	jne	$L1351
	mov	ecx, DWORD PTR _ARPPack$[ebp]
	movsx	edx, BYTE PTR [ecx+27]
	movsx	eax, BYTE PTR ?mSenderIP@ARPObj@@0PADA+3
	cmp	edx, eax
	jne	$L1351
; Line 506
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+16]
	sar	edx, 8
	and	edx, 255				; 000000ffH
	mov	BYTE PTR _ARP_PACK$[ebp], dl
; Line 507
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+16]
	and	ecx, 255				; 000000ffH
	mov	BYTE PTR _ARP_PACK$[ebp+1], cl
; Line 510
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+20]
	sar	eax, 8
	and	eax, 255				; 000000ffH
	mov	BYTE PTR _ARP_PACK$[ebp+2], al
; Line 511
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+20]
	and	edx, 255				; 000000ffH
	mov	BYTE PTR _ARP_PACK$[ebp+3], dl
; Line 514
	mov	eax, DWORD PTR _this$[ebp]
	movsx	ecx, BYTE PTR [eax+28]
	and	ecx, 255				; 000000ffH
	mov	BYTE PTR _ARP_PACK$[ebp+4], cl
; Line 517
	mov	edx, DWORD PTR _this$[ebp]
	movsx	eax, BYTE PTR [edx+29]
	and	eax, 255				; 000000ffH
	mov	BYTE PTR _ARP_PACK$[ebp+5], al
; Line 520
	mov	BYTE PTR _ARP_PACK$[ebp+6], 0
; Line 521
	mov	BYTE PTR _ARP_PACK$[ebp+7], 2
; Line 524
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1337
$L1338:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L1337:
	cmp	DWORD PTR _i$[ebp], 6
	jge	SHORT $L1339
; Line 526
	mov	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	mov	cl, BYTE PTR ?mSenderHA@ARPObj@@0PADA[eax]
	mov	BYTE PTR _ARP_PACK$[ebp+edx+8], cl
; Line 527
	mov	edx, DWORD PTR _ARPPack$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	mov	cl, BYTE PTR [edx+8]
	mov	BYTE PTR _ARP_PACK$[ebp+eax+18], cl
; Line 528
	jmp	SHORT $L1338
$L1339:
; Line 531
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1340
$L1341:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L1340:
	cmp	DWORD PTR _i$[ebp], 4
	jge	SHORT $L1342
; Line 533
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	dl, BYTE PTR ?mSenderIP@ARPObj@@0PADA[ecx]
	mov	BYTE PTR _ARP_PACK$[ebp+eax+14], dl
; Line 534
	mov	eax, DWORD PTR _ARPPack$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	dl, BYTE PTR [eax+14]
	mov	BYTE PTR _ARP_PACK$[ebp+ecx+24], dl
; Line 535
	jmp	SHORT $L1341
$L1342:
; Line 537
	lea	ecx, DWORD PTR _fto$[ebp]
	call	?getMode@FTOPObj@@QAEHXZ		; FTOPObj::getMode
	cmp	eax, 1
	jne	$L1346
; Line 542
	push	208					; 000000d0H
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
	push	208					; 000000d0H
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 546
	push	180					; 000000b4H
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
	push	180					; 000000b4H
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 550
	push	208					; 000000d0H
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?AOAgetSharedMem@AOAProtected@@QAEJH@Z	; AOAProtected::AOAgetSharedMem
	mov	DWORD PTR _retcode$[ebp], eax
; Line 551
	mov	ecx, DWORD PTR _retcode$[ebp]
	add	ecx, 1
	mov	DWORD PTR _retcode$[ebp], ecx
; Line 552
	mov	edx, DWORD PTR _retcode$[ebp]
	push	edx
	push	208					; 000000d0H
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 554
	mov	eax, DWORD PTR _currenttask$[ebp]
	push	eax
	push	7
	mov	ecx, DWORD PTR _ARPPack$[ebp]
	add	ecx, 8
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
; Line 555
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L1346
; Line 557
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L1329
$L1346:
; Line 561
	mov	DWORD PTR _ARPFound$[ebp], 0
; Line 562
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1347
$L1348:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L1347:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR ?ARPT_Index@ARPObj@@2HA	; ARPObj::ARPT_Index
	jge	SHORT $L1349
; Line 565
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 10					; 0000000aH
	movsx	edx, BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[ecx]
	mov	eax, DWORD PTR _ARPPack$[ebp]
	movsx	ecx, BYTE PTR [eax+14]
	cmp	edx, ecx
	jne	SHORT $L1350
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 10					; 0000000aH
	movsx	eax, BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[edx+1]
	mov	ecx, DWORD PTR _ARPPack$[ebp]
	movsx	edx, BYTE PTR [ecx+15]
	cmp	eax, edx
	jne	SHORT $L1350
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 10					; 0000000aH
	movsx	ecx, BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[eax+2]
	mov	edx, DWORD PTR _ARPPack$[ebp]
	movsx	eax, BYTE PTR [edx+16]
	cmp	ecx, eax
	jne	SHORT $L1350
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 10					; 0000000aH
	movsx	edx, BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[ecx+3]
	mov	eax, DWORD PTR _ARPPack$[ebp]
	movsx	ecx, BYTE PTR [eax+17]
	cmp	edx, ecx
	jne	SHORT $L1350
; Line 567
	mov	DWORD PTR _ARPFound$[ebp], 1
; Line 568
	jmp	SHORT $L1349
$L1350:
; Line 570
	jmp	SHORT $L1348
$L1349:
; Line 573
	cmp	DWORD PTR _ARPFound$[ebp], 0
	jne	$L1351
; Line 575
	mov	edx, DWORD PTR ?ARPT_Index@ARPObj@@2HA	; ARPObj::ARPT_Index
	imul	edx, 10					; 0000000aH
	mov	eax, DWORD PTR _ARPPack$[ebp]
	mov	cl, BYTE PTR [eax+14]
	mov	BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[edx], cl
; Line 576
	mov	edx, DWORD PTR ?ARPT_Index@ARPObj@@2HA	; ARPObj::ARPT_Index
	imul	edx, 10					; 0000000aH
	mov	eax, DWORD PTR _ARPPack$[ebp]
	mov	cl, BYTE PTR [eax+15]
	mov	BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[edx+1], cl
; Line 577
	mov	edx, DWORD PTR ?ARPT_Index@ARPObj@@2HA	; ARPObj::ARPT_Index
	imul	edx, 10					; 0000000aH
	mov	eax, DWORD PTR _ARPPack$[ebp]
	mov	cl, BYTE PTR [eax+16]
	mov	BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[edx+2], cl
; Line 578
	mov	edx, DWORD PTR ?ARPT_Index@ARPObj@@2HA	; ARPObj::ARPT_Index
	imul	edx, 10					; 0000000aH
	mov	eax, DWORD PTR _ARPPack$[ebp]
	mov	cl, BYTE PTR [eax+17]
	mov	BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[edx+3], cl
; Line 579
	mov	edx, DWORD PTR ?ARPT_Index@ARPObj@@2HA	; ARPObj::ARPT_Index
	imul	edx, 10					; 0000000aH
	mov	eax, DWORD PTR _ARPPack$[ebp]
	mov	cl, BYTE PTR [eax+8]
	mov	BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[edx+4], cl
; Line 580
	mov	edx, DWORD PTR ?ARPT_Index@ARPObj@@2HA	; ARPObj::ARPT_Index
	imul	edx, 10					; 0000000aH
	mov	eax, DWORD PTR _ARPPack$[ebp]
	mov	cl, BYTE PTR [eax+9]
	mov	BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[edx+5], cl
; Line 581
	mov	edx, DWORD PTR ?ARPT_Index@ARPObj@@2HA	; ARPObj::ARPT_Index
	imul	edx, 10					; 0000000aH
	mov	eax, DWORD PTR _ARPPack$[ebp]
	mov	cl, BYTE PTR [eax+10]
	mov	BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[edx+6], cl
; Line 582
	mov	edx, DWORD PTR ?ARPT_Index@ARPObj@@2HA	; ARPObj::ARPT_Index
	imul	edx, 10					; 0000000aH
	mov	eax, DWORD PTR _ARPPack$[ebp]
	mov	cl, BYTE PTR [eax+11]
	mov	BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[edx+7], cl
; Line 583
	mov	edx, DWORD PTR ?ARPT_Index@ARPObj@@2HA	; ARPObj::ARPT_Index
	imul	edx, 10					; 0000000aH
	mov	eax, DWORD PTR _ARPPack$[ebp]
	mov	cl, BYTE PTR [eax+12]
	mov	BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[edx+8], cl
; Line 584
	mov	edx, DWORD PTR ?ARPT_Index@ARPObj@@2HA	; ARPObj::ARPT_Index
	imul	edx, 10					; 0000000aH
	mov	eax, DWORD PTR _ARPPack$[ebp]
	mov	cl, BYTE PTR [eax+13]
	mov	BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[edx+9], cl
; Line 586
	mov	edx, DWORD PTR ?ARPT_Index@ARPObj@@2HA	; ARPObj::ARPT_Index
	add	edx, 1
	mov	DWORD PTR ?ARPT_Index@ARPObj@@2HA, edx	; ARPObj::ARPT_Index
$L1351:
; Line 731
	xor	eax, eax
$L1329:
; Line 732
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
; Line 741
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 742
	mov	DWORD PTR _ARPFound$[ebp], 0
; Line 743
	mov	DWORD PTR _i$[ebp], 0
; Line 747
	mov	eax, DWORD PTR _ARPPack$[ebp]
	movsx	ecx, BYTE PTR [eax+24]
	movsx	edx, BYTE PTR ?mSenderIP@ARPObj@@0PADA
	cmp	ecx, edx
	jne	$L1366
	mov	eax, DWORD PTR _ARPPack$[ebp]
	movsx	ecx, BYTE PTR [eax+25]
	movsx	edx, BYTE PTR ?mSenderIP@ARPObj@@0PADA+1
	cmp	ecx, edx
	jne	$L1366
	mov	eax, DWORD PTR _ARPPack$[ebp]
	movsx	ecx, BYTE PTR [eax+26]
	movsx	edx, BYTE PTR ?mSenderIP@ARPObj@@0PADA+2
	cmp	ecx, edx
	jne	$L1366
	mov	eax, DWORD PTR _ARPPack$[ebp]
	movsx	ecx, BYTE PTR [eax+27]
	movsx	edx, BYTE PTR ?mSenderIP@ARPObj@@0PADA+3
	cmp	ecx, edx
	jne	$L1366
; Line 749
	mov	DWORD PTR _ARPFound$[ebp], 0
; Line 751
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1362
$L1363:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L1362:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR ?ARPT_Index@ARPObj@@2HA	; ARPObj::ARPT_Index
	jge	SHORT $L1364
; Line 754
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 10					; 0000000aH
	movsx	eax, BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[edx]
	mov	ecx, DWORD PTR _ARPPack$[ebp]
	movsx	edx, BYTE PTR [ecx+14]
	cmp	eax, edx
	jne	SHORT $L1365
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 10					; 0000000aH
	movsx	ecx, BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[eax+1]
	mov	edx, DWORD PTR _ARPPack$[ebp]
	movsx	eax, BYTE PTR [edx+15]
	cmp	ecx, eax
	jne	SHORT $L1365
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 10					; 0000000aH
	movsx	edx, BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[ecx+2]
	mov	eax, DWORD PTR _ARPPack$[ebp]
	movsx	ecx, BYTE PTR [eax+16]
	cmp	edx, ecx
	jne	SHORT $L1365
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 10					; 0000000aH
	movsx	eax, BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[edx+3]
	mov	ecx, DWORD PTR _ARPPack$[ebp]
	movsx	edx, BYTE PTR [ecx+17]
	cmp	eax, edx
	jne	SHORT $L1365
; Line 756
	mov	DWORD PTR _ARPFound$[ebp], 1
; Line 757
	jmp	SHORT $L1364
$L1365:
; Line 759
	jmp	SHORT $L1363
$L1364:
; Line 763
	cmp	DWORD PTR _ARPFound$[ebp], 0
	jne	$L1366
; Line 765
	mov	eax, DWORD PTR ?ARPT_Index@ARPObj@@2HA	; ARPObj::ARPT_Index
	imul	eax, 10					; 0000000aH
	mov	ecx, DWORD PTR _ARPPack$[ebp]
	mov	dl, BYTE PTR [ecx+14]
	mov	BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[eax], dl
; Line 766
	mov	eax, DWORD PTR ?ARPT_Index@ARPObj@@2HA	; ARPObj::ARPT_Index
	imul	eax, 10					; 0000000aH
	mov	ecx, DWORD PTR _ARPPack$[ebp]
	mov	dl, BYTE PTR [ecx+15]
	mov	BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[eax+1], dl
; Line 767
	mov	eax, DWORD PTR ?ARPT_Index@ARPObj@@2HA	; ARPObj::ARPT_Index
	imul	eax, 10					; 0000000aH
	mov	ecx, DWORD PTR _ARPPack$[ebp]
	mov	dl, BYTE PTR [ecx+16]
	mov	BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[eax+2], dl
; Line 768
	mov	eax, DWORD PTR ?ARPT_Index@ARPObj@@2HA	; ARPObj::ARPT_Index
	imul	eax, 10					; 0000000aH
	mov	ecx, DWORD PTR _ARPPack$[ebp]
	mov	dl, BYTE PTR [ecx+17]
	mov	BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[eax+3], dl
; Line 769
	mov	eax, DWORD PTR ?ARPT_Index@ARPObj@@2HA	; ARPObj::ARPT_Index
	imul	eax, 10					; 0000000aH
	mov	ecx, DWORD PTR _ARPPack$[ebp]
	mov	dl, BYTE PTR [ecx+8]
	mov	BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[eax+4], dl
; Line 770
	mov	eax, DWORD PTR ?ARPT_Index@ARPObj@@2HA	; ARPObj::ARPT_Index
	imul	eax, 10					; 0000000aH
	mov	ecx, DWORD PTR _ARPPack$[ebp]
	mov	dl, BYTE PTR [ecx+9]
	mov	BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[eax+5], dl
; Line 771
	mov	eax, DWORD PTR ?ARPT_Index@ARPObj@@2HA	; ARPObj::ARPT_Index
	imul	eax, 10					; 0000000aH
	mov	ecx, DWORD PTR _ARPPack$[ebp]
	mov	dl, BYTE PTR [ecx+10]
	mov	BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[eax+6], dl
; Line 772
	mov	eax, DWORD PTR ?ARPT_Index@ARPObj@@2HA	; ARPObj::ARPT_Index
	imul	eax, 10					; 0000000aH
	mov	ecx, DWORD PTR _ARPPack$[ebp]
	mov	dl, BYTE PTR [ecx+11]
	mov	BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[eax+7], dl
; Line 773
	mov	eax, DWORD PTR ?ARPT_Index@ARPObj@@2HA	; ARPObj::ARPT_Index
	imul	eax, 10					; 0000000aH
	mov	ecx, DWORD PTR _ARPPack$[ebp]
	mov	dl, BYTE PTR [ecx+12]
	mov	BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[eax+8], dl
; Line 774
	mov	eax, DWORD PTR ?ARPT_Index@ARPObj@@2HA	; ARPObj::ARPT_Index
	imul	eax, 10					; 0000000aH
	mov	ecx, DWORD PTR _ARPPack$[ebp]
	mov	dl, BYTE PTR [ecx+13]
	mov	BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[eax+9], dl
; Line 775
	mov	eax, DWORD PTR ?ARPT_Index@ARPObj@@2HA	; ARPObj::ARPT_Index
	add	eax, 1
	mov	DWORD PTR ?ARPT_Index@ARPObj@@2HA, eax	; ARPObj::ARPT_Index
$L1366:
; Line 856
	xor	eax, eax
; Line 857
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
; Line 864
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 865
	mov	DWORD PTR _temp$[ebp], 0
; Line 866
	mov	DWORD PTR _i$[ebp], 0
; Line 867
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1373
$L1374:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L1373:
	cmp	DWORD PTR _i$[ebp], 4
	jge	SHORT $L1375
; Line 869
	mov	ecx, DWORD PTR _ip$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	movsx	edx, BYTE PTR [ecx]
	mov	eax, DWORD PTR _temp$[ebp]
	add	eax, edx
	mov	DWORD PTR _temp$[ebp], eax
; Line 870
	jmp	SHORT $L1374
$L1375:
; Line 871
	mov	eax, DWORD PTR _temp$[ebp]
	cdq
	mov	ecx, 100				; 00000064H
	idiv	ecx
	mov	eax, edx
; Line 872
	mov	esp, ebp
	pop	ebp
	ret	4
?hashFun@ARPObj@@AAEHPAD@Z ENDP				; ARPObj::hashFun
_TEXT	ENDS
PUBLIC	?close@ARPObj@@QAEXXZ				; ARPObj::close
_TEXT	SEGMENT
_this$ = -4
?close@ARPObj@@QAEXXZ PROC NEAR				; ARPObj::close
; Line 877
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 879
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
; Line 887
	push	ebp
	mov	ebp, esp
	sub	esp, 124				; 0000007cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 890
	mov	BYTE PTR _targetHA$[ebp], -1
	mov	BYTE PTR _targetHA$[ebp+1], -1
	mov	BYTE PTR _targetHA$[ebp+2], -1
	mov	BYTE PTR _targetHA$[ebp+3], -1
	mov	BYTE PTR _targetHA$[ebp+4], -1
	mov	BYTE PTR _targetHA$[ebp+5], -1
; Line 891
	mov	DWORD PTR _count1$[ebp], 0
; Line 895
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+16]
	sar	ecx, 8
	and	ecx, 255				; 000000ffH
	mov	BYTE PTR _ARP_PACK$[ebp], cl
; Line 896
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+16]
	and	eax, 255				; 000000ffH
	mov	BYTE PTR _ARP_PACK$[ebp+1], al
; Line 899
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+20]
	sar	edx, 8
	and	edx, 255				; 000000ffH
	mov	BYTE PTR _ARP_PACK$[ebp+2], dl
; Line 900
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+20]
	and	ecx, 255				; 000000ffH
	mov	BYTE PTR _ARP_PACK$[ebp+3], cl
; Line 903
	mov	edx, DWORD PTR _this$[ebp]
	movsx	eax, BYTE PTR [edx+28]
	and	eax, 255				; 000000ffH
	mov	BYTE PTR _ARP_PACK$[ebp+4], al
; Line 905
	mov	ecx, DWORD PTR _this$[ebp]
	movsx	edx, BYTE PTR [ecx+29]
	and	edx, 255				; 000000ffH
	mov	BYTE PTR _ARP_PACK$[ebp+5], dl
; Line 908
	mov	BYTE PTR _ARP_PACK$[ebp+6], 0
; Line 909
	mov	BYTE PTR _ARP_PACK$[ebp+7], 2
; Line 912
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1389
$L1390:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L1389:
	cmp	DWORD PTR _i$[ebp], 6
	jge	SHORT $L1391
; Line 914
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	mov	al, BYTE PTR ?mSenderHA@ARPObj@@0PADA[edx]
	mov	BYTE PTR _ARP_PACK$[ebp+ecx+8], al
; Line 915
	mov	ecx, DWORD PTR _i$[ebp]
	mov	BYTE PTR _ARP_PACK$[ebp+ecx+18], -1
; Line 916
	jmp	SHORT $L1390
$L1391:
; Line 918
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1392
$L1393:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L1392:
	cmp	DWORD PTR _i$[ebp], 4
	jge	SHORT $L1394
; Line 920
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	dl, BYTE PTR ?mSenderIP@ARPObj@@0PADA[ecx]
	mov	BYTE PTR _ARP_PACK$[ebp+eax+14], dl
; Line 921
	mov	eax, DWORD PTR _targetIP$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	dl, BYTE PTR [eax]
	mov	BYTE PTR _ARP_PACK$[ebp+ecx+24], dl
; Line 922
	jmp	SHORT $L1393
$L1394:
; Line 926
	push	180					; 000000b4H
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?AOAgetSharedMem@AOAProtected@@QAEJH@Z	; AOAProtected::AOAgetSharedMem
	mov	DWORD PTR _retcode$[ebp], eax
; Line 927
	mov	eax, DWORD PTR _retcode$[ebp]
	add	eax, 1
	mov	DWORD PTR _retcode$[ebp], eax
; Line 928
	mov	ecx, DWORD PTR _retcode$[ebp]
	push	ecx
	push	180					; 000000b4H
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 930
	push	208					; 000000d0H
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?AOAgetSharedMem@AOAProtected@@QAEJH@Z	; AOAProtected::AOAgetSharedMem
	mov	DWORD PTR _retcode$[ebp], eax
; Line 931
	mov	edx, DWORD PTR _retcode$[ebp]
	add	edx, 1
	mov	DWORD PTR _retcode$[ebp], edx
; Line 932
	mov	eax, DWORD PTR _retcode$[ebp]
	push	eax
	push	208					; 000000d0H
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 934
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
; Line 936
	xor	eax, eax
; Line 937
	mov	esp, ebp
	pop	ebp
	ret	8
?Response@ARPObj@@QAEHPADH@Z ENDP			; ARPObj::Response
_TEXT	ENDS
PUBLIC	?printStatistics@ARPObj@@QAEXH@Z		; ARPObj::printStatistics
EXTRN	?AOAprintHex@AOAProtected@@QAEHJH@Z:NEAR	; AOAProtected::AOAprintHex
EXTRN	?AOAPrintText@AOAProtected@@QAEXPADH@Z:NEAR	; AOAProtected::AOAPrintText
_DATA	SEGMENT
$SG1402	DB	'ARP Statistics', 00H
	ORG $+1
$SG1403	DB	'Total Number of ARP Packets Processed    :', 00H
	ORG $+1
$SG1404	DB	'Total Number of ARP resolution successful:', 00H
	ORG $+1
$SG1405	DB	'Total Number of ARP resolution failed    :', 00H
	ORG $+1
$SG1406	DB	'Total Number of ARP request processed    :', 00H
_DATA	ENDS
_TEXT	SEGMENT
_Line$ = 8
_this$ = -12
_io$ = -8
?printStatistics@ARPObj@@QAEXH@Z PROC NEAR		; ARPObj::printStatistics
; Line 942
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 943
	lea	ecx, DWORD PTR _io$[ebp]
	call	??0AOAProtected@@QAE@XZ			; AOAProtected::AOAProtected
; Line 944
	mov	eax, DWORD PTR _Line$[ebp]
	push	eax
	push	OFFSET FLAT:$SG1402
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 945
	mov	ecx, DWORD PTR _Line$[ebp]
	add	ecx, 160				; 000000a0H
	push	ecx
	push	OFFSET FLAT:$SG1403
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 946
	mov	edx, DWORD PTR _Line$[ebp]
	add	edx, 248				; 000000f8H
	push	edx
	mov	eax, DWORD PTR ?noArppackp@ARPObj@@0KA	; ARPObj::noArppackp
	push	eax
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 947
	mov	ecx, DWORD PTR _Line$[ebp]
	add	ecx, 320				; 00000140H
	push	ecx
	push	OFFSET FLAT:$SG1404
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 948
	mov	edx, DWORD PTR _Line$[ebp]
	add	edx, 408				; 00000198H
	push	edx
	mov	eax, DWORD PTR ?noArpresolves@ARPObj@@0KA ; ARPObj::noArpresolves
	push	eax
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 949
	mov	ecx, DWORD PTR _Line$[ebp]
	add	ecx, 480				; 000001e0H
	push	ecx
	push	OFFSET FLAT:$SG1405
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 950
	mov	edx, DWORD PTR _Line$[ebp]
	add	edx, 568				; 00000238H
	push	edx
	mov	eax, DWORD PTR ?noArpresolvef@ARPObj@@0KA ; ARPObj::noArpresolvef
	push	eax
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 951
	mov	ecx, DWORD PTR _Line$[ebp]
	add	ecx, 640				; 00000280H
	push	ecx
	push	OFFSET FLAT:$SG1406
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 952
	mov	edx, DWORD PTR _Line$[ebp]
	add	edx, 728				; 000002d8H
	push	edx
	mov	eax, DWORD PTR ?noArprequestp@ARPObj@@0KA ; ARPObj::noArprequestp
	push	eax
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 953
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
; Line 959
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	mov	DWORD PTR _this$[ebp], ecx
; Line 960
	lea	ecx, DWORD PTR _io$[ebp]
	call	??0AOAProtected@@QAE@XZ			; AOAProtected::AOAProtected
; Line 962
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L1413
$L1414:
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	DWORD PTR _j$[ebp], eax
$L1413:
	cmp	DWORD PTR _j$[ebp], 4
	jge	$L1415
; Line 964
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
; Line 965
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
; Line 966
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
; Line 967
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
; Line 969
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
; Line 970
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
; Line 971
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
; Line 972
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
; Line 973
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
; Line 974
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
; Line 975
	jmp	$L1414
$L1415:
; Line 976
	mov	esp, ebp
	pop	ebp
	ret	4
?printARPTable@ARPObj@@QAEXH@Z ENDP			; ARPObj::printARPTable
_TEXT	ENDS
END
