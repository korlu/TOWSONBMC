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
	jmp	SHORT $L1214
$L1215:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L1214:
	cmp	DWORD PTR _i$[ebp], 4
	jge	SHORT $L1216
; Line 82
	mov	eax, DWORD PTR _GwayIP$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	dl, BYTE PTR [eax]
	mov	BYTE PTR ?GateWayIP@ARPObj@@0PADA[ecx], dl
	jmp	SHORT $L1215
$L1216:
; Line 83
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1217
$L1218:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L1217:
	cmp	DWORD PTR _i$[ebp], 4
	jge	SHORT $L1219
; Line 84
	mov	ecx, DWORD PTR _SubNetMask$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	mov	al, BYTE PTR [ecx]
	mov	BYTE PTR ?SUBNETMASK@ARPObj@@0PADA[edx], al
	jmp	SHORT $L1218
$L1219:
; Line 86
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1220
$L1221:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L1220:
	cmp	DWORD PTR _i$[ebp], 4
	jge	SHORT $L1222
; Line 87
	mov	edx, DWORD PTR _senderIP$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	mov	cl, BYTE PTR [edx]
	mov	BYTE PTR ?mSenderIP@ARPObj@@0PADA[eax], cl
	jmp	SHORT $L1221
$L1222:
; Line 91
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1223
$L1224:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L1223:
	cmp	DWORD PTR _i$[ebp], 100			; 00000064H
	jge	SHORT $L1225
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
	jmp	SHORT $L1224
$L1225:
; Line 99
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1226
$L1227:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L1226:
	cmp	DWORD PTR _i$[ebp], 4
	jge	SHORT $L1228
; Line 101
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 10					; 0000000aH
	mov	BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[edx], 0
; Line 102
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 10					; 0000000aH
	mov	BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[eax+4], 0
; Line 103
	jmp	SHORT $L1227
$L1228:
; Line 105
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1229
$L1230:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L1229:
	cmp	DWORD PTR _i$[ebp], 100			; 00000064H
	jge	SHORT $L1231
; Line 107
	mov	edx, DWORD PTR _i$[ebp]
	mov	DWORD PTR ?hashind@ARPObj@@0PAHA[edx*4], -1
; Line 108
	jmp	SHORT $L1230
$L1231:
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
_m$1247 = -136
_m$1252 = -140
_k$1262 = -144
?Resolve@ARPObj@@QAEHPAD0H@Z PROC NEAR			; ARPObj::Resolve
; Line 123
	push	ebp
	mov	ebp, esp
	sub	esp, 148				; 00000094H
	mov	DWORD PTR _this$[ebp], ecx
; Line 124
	mov	DWORD PTR _retcode$[ebp], 0
; Line 127
	mov	BYTE PTR _targetHA$[ebp], -1
	mov	BYTE PTR _targetHA$[ebp+1], -1
	mov	BYTE PTR _targetHA$[ebp+2], -1
	mov	BYTE PTR _targetHA$[ebp+3], -1
	mov	BYTE PTR _targetHA$[ebp+4], -1
	mov	BYTE PTR _targetHA$[ebp+5], -1
; Line 128
	mov	DWORD PTR _ARP_Found_Flag$[ebp], -1
; Line 129
	mov	DWORD PTR _i$[ebp], 0
; Line 130
	mov	DWORD PTR _j$[ebp], 0
; Line 131
	mov	DWORD PTR _count1$[ebp], 0
; Line 138
	mov	eax, DWORD PTR _stargetIP$[ebp]
	movsx	ecx, BYTE PTR [eax]
	movsx	edx, BYTE PTR ?SUBNETMASK@ARPObj@@0PADA
	and	ecx, edx
	movsx	eax, BYTE PTR ?mSenderIP@ARPObj@@0PADA
	movsx	edx, BYTE PTR ?SUBNETMASK@ARPObj@@0PADA
	and	eax, edx
	cmp	ecx, eax
	jne	$L1246
	mov	eax, DWORD PTR _stargetIP$[ebp]
	movsx	ecx, BYTE PTR [eax+1]
	movsx	edx, BYTE PTR ?SUBNETMASK@ARPObj@@0PADA+1
	and	ecx, edx
	movsx	eax, BYTE PTR ?mSenderIP@ARPObj@@0PADA+1
	movsx	edx, BYTE PTR ?SUBNETMASK@ARPObj@@0PADA+1
	and	eax, edx
	cmp	ecx, eax
	jne	$L1246
	mov	eax, DWORD PTR _stargetIP$[ebp]
	movsx	ecx, BYTE PTR [eax+2]
	movsx	edx, BYTE PTR ?SUBNETMASK@ARPObj@@0PADA+2
	and	ecx, edx
	movsx	eax, BYTE PTR ?mSenderIP@ARPObj@@0PADA+2
	movsx	edx, BYTE PTR ?SUBNETMASK@ARPObj@@0PADA+2
	and	eax, edx
	cmp	ecx, eax
	jne	SHORT $L1246
	mov	eax, DWORD PTR _stargetIP$[ebp]
	movsx	ecx, BYTE PTR [eax+3]
	movsx	edx, BYTE PTR ?SUBNETMASK@ARPObj@@0PADA+3
	and	ecx, edx
	movsx	eax, BYTE PTR ?mSenderIP@ARPObj@@0PADA+3
	movsx	edx, BYTE PTR ?SUBNETMASK@ARPObj@@0PADA+3
	and	eax, edx
	cmp	ecx, eax
	jne	SHORT $L1246
; Line 140
	mov	DWORD PTR _m$1247[ebp], 0
	jmp	SHORT $L1248
$L1249:
	mov	eax, DWORD PTR _m$1247[ebp]
	add	eax, 1
	mov	DWORD PTR _m$1247[ebp], eax
$L1248:
	cmp	DWORD PTR _m$1247[ebp], 4
	jge	SHORT $L1250
; Line 142
	mov	ecx, DWORD PTR _stargetIP$[ebp]
	add	ecx, DWORD PTR _m$1247[ebp]
	mov	edx, DWORD PTR _m$1247[ebp]
	mov	al, BYTE PTR [ecx]
	mov	BYTE PTR _targetIP$[ebp+edx], al
; Line 143
	jmp	SHORT $L1249
$L1250:
; Line 145
	jmp	SHORT $L1255
$L1246:
; Line 147
	mov	DWORD PTR _m$1252[ebp], 0
	jmp	SHORT $L1253
$L1254:
	mov	ecx, DWORD PTR _m$1252[ebp]
	add	ecx, 1
	mov	DWORD PTR _m$1252[ebp], ecx
$L1253:
	cmp	DWORD PTR _m$1252[ebp], 4
	jge	SHORT $L1255
; Line 149
	mov	edx, DWORD PTR _m$1252[ebp]
	mov	eax, DWORD PTR _m$1252[ebp]
	mov	cl, BYTE PTR ?GateWayIP@ARPObj@@0PADA[eax]
	mov	BYTE PTR _targetIP$[ebp+edx], cl
; Line 150
	jmp	SHORT $L1254
$L1255:
; Line 154
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1256
$L1257:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L1256:
	cmp	DWORD PTR _i$[ebp], 4
	jge	SHORT $L1258
; Line 157
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 10					; 0000000aH
	movsx	ecx, BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[eax]
	movsx	edx, BYTE PTR _targetIP$[ebp]
	cmp	ecx, edx
	jne	SHORT $L1259
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 10					; 0000000aH
	movsx	ecx, BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[eax+1]
	movsx	edx, BYTE PTR _targetIP$[ebp+1]
	cmp	ecx, edx
	jne	SHORT $L1259
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 10					; 0000000aH
	movsx	ecx, BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[eax+2]
	movsx	edx, BYTE PTR _targetIP$[ebp+2]
	cmp	ecx, edx
	jne	SHORT $L1259
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 10					; 0000000aH
	movsx	ecx, BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[eax+3]
	movsx	edx, BYTE PTR _targetIP$[ebp+3]
	cmp	ecx, edx
	jne	SHORT $L1259
; Line 159
	mov	DWORD PTR _ARP_Found_Flag$[ebp], 0
; Line 160
	jmp	SHORT $L1258
$L1259:
; Line 164
	mov	DWORD PTR _ARP_Found_Flag$[ebp], -1
; Line 166
	jmp	$L1257
$L1258:
; Line 185
	cmp	DWORD PTR _ARP_Found_Flag$[ebp], 0
	jne	SHORT $L1261
; Line 187
	mov	DWORD PTR _k$1262[ebp], 0
	jmp	SHORT $L1263
$L1264:
	mov	eax, DWORD PTR _k$1262[ebp]
	add	eax, 1
	mov	DWORD PTR _k$1262[ebp], eax
$L1263:
	cmp	DWORD PTR _k$1262[ebp], 6
	jge	SHORT $L1265
; Line 188
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 10					; 0000000aH
	mov	edx, DWORD PTR _targetMAC$[ebp]
	add	edx, DWORD PTR _k$1262[ebp]
	mov	eax, DWORD PTR _k$1262[ebp]
	mov	cl, BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[ecx+eax+4]
	mov	BYTE PTR [edx], cl
	jmp	SHORT $L1264
$L1265:
; Line 189
	mov	eax, DWORD PTR _ARP_Found_Flag$[ebp]
	jmp	$L1237
$L1261:
; Line 195
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+16]
	sar	eax, 8
	and	eax, 255				; 000000ffH
	mov	BYTE PTR _ARP_PACK$[ebp], al
; Line 196
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+16]
	and	edx, 255				; 000000ffH
	mov	BYTE PTR _ARP_PACK$[ebp+1], dl
; Line 199
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+20]
	sar	ecx, 8
	and	ecx, 255				; 000000ffH
	mov	BYTE PTR _ARP_PACK$[ebp+2], cl
; Line 200
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+20]
	and	eax, 255				; 000000ffH
	mov	BYTE PTR _ARP_PACK$[ebp+3], al
; Line 203
	mov	ecx, DWORD PTR _this$[ebp]
	movsx	edx, BYTE PTR [ecx+28]
	and	edx, 255				; 000000ffH
	mov	BYTE PTR _ARP_PACK$[ebp+4], dl
; Line 205
	mov	eax, DWORD PTR _this$[ebp]
	movsx	ecx, BYTE PTR [eax+29]
	and	ecx, 255				; 000000ffH
	mov	BYTE PTR _ARP_PACK$[ebp+5], cl
; Line 208
	mov	BYTE PTR _ARP_PACK$[ebp+6], 0
; Line 209
	mov	BYTE PTR _ARP_PACK$[ebp+7], 1
; Line 212
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1267
$L1268:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L1267:
	cmp	DWORD PTR _i$[ebp], 6
	jge	SHORT $L1269
; Line 214
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	dl, BYTE PTR ?mSenderHA@ARPObj@@0PADA[ecx]
	mov	BYTE PTR _ARP_PACK$[ebp+eax+8], dl
; Line 215
	mov	eax, DWORD PTR _i$[ebp]
	mov	BYTE PTR _ARP_PACK$[ebp+eax+18], 0
; Line 216
	jmp	SHORT $L1268
$L1269:
; Line 218
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1270
$L1271:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L1270:
	cmp	DWORD PTR _i$[ebp], 4
	jge	SHORT $L1272
; Line 220
	mov	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	mov	cl, BYTE PTR ?mSenderIP@ARPObj@@0PADA[eax]
	mov	BYTE PTR _ARP_PACK$[ebp+edx+14], cl
; Line 221
	mov	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	mov	cl, BYTE PTR _targetIP$[ebp+eax]
	mov	BYTE PTR _ARP_PACK$[ebp+edx+24], cl
; Line 222
	jmp	SHORT $L1271
$L1272:
; Line 227
	push	180					; 000000b4H
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?AOAgetSharedMem@AOAProtected@@QAEJH@Z	; AOAProtected::AOAgetSharedMem
	mov	DWORD PTR _retcode$[ebp], eax
; Line 228
	mov	edx, DWORD PTR _retcode$[ebp]
	add	edx, 1
	mov	DWORD PTR _retcode$[ebp], edx
; Line 229
	mov	eax, DWORD PTR _retcode$[ebp]
	push	eax
	push	180					; 000000b4H
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 231
	push	208					; 000000d0H
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?AOAgetSharedMem@AOAProtected@@QAEJH@Z	; AOAProtected::AOAgetSharedMem
	mov	DWORD PTR _retcode$[ebp], eax
; Line 232
	mov	ecx, DWORD PTR _retcode$[ebp]
	add	ecx, 1
	mov	DWORD PTR _retcode$[ebp], ecx
; Line 233
	mov	edx, DWORD PTR _retcode$[ebp]
	push	edx
	push	208					; 000000d0H
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 235
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
; Line 238
	push	184					; 000000b8H
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?AOAgetSharedMem@AOAProtected@@QAEJH@Z	; AOAProtected::AOAgetSharedMem
	mov	DWORD PTR _count1$[ebp], eax
; Line 239
	mov	edx, DWORD PTR _count1$[ebp]
	add	edx, 1
	mov	DWORD PTR _count1$[ebp], edx
; Line 240
	mov	eax, DWORD PTR _count1$[ebp]
	push	eax
	push	240					; 000000f0H
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 350
	mov	ecx, DWORD PTR ?noArpresolvef@ARPObj@@0KA ; ARPObj::noArpresolvef
	add	ecx, 1
	mov	DWORD PTR ?noArpresolvef@ARPObj@@0KA, ecx ; ARPObj::noArpresolvef
; Line 351
	mov	eax, DWORD PTR _ARP_Found_Flag$[ebp]
$L1237:
; Line 352
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
; Line 371
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 373
	mov	DWORD PTR _temp$[ebp], 0
; Line 374
	mov	DWORD PTR _retcode$[ebp], 0
; Line 375
	mov	eax, DWORD PTR ?noArppackp@ARPObj@@0KA	; ARPObj::noArppackp
	add	eax, 1
	mov	DWORD PTR ?noArppackp@ARPObj@@0KA, eax	; ARPObj::noArppackp
; Line 377
	mov	ecx, DWORD PTR _ARPPack$[ebp]
	movsx	edx, BYTE PTR [ecx]
	and	edx, 255				; 000000ffH
	mov	DWORD PTR _temp$[ebp], edx
; Line 378
	mov	eax, DWORD PTR _temp$[ebp]
	shl	eax, 8
	mov	DWORD PTR _temp$[ebp], eax
; Line 379
	mov	ecx, DWORD PTR _ARPPack$[ebp]
	movsx	edx, BYTE PTR [ecx+1]
	and	edx, 255				; 000000ffH
	mov	eax, DWORD PTR _temp$[ebp]
	or	eax, edx
	mov	DWORD PTR _temp$[ebp], eax
; Line 381
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR _temp$[ebp]
	cmp	edx, DWORD PTR [ecx+16]
	je	SHORT $L1283
; Line 383
	or	eax, -1
	jmp	$L1280
$L1283:
; Line 387
	mov	DWORD PTR _temp$[ebp], 0
; Line 388
	mov	eax, DWORD PTR _ARPPack$[ebp]
	movsx	ecx, BYTE PTR [eax+2]
	and	ecx, 255				; 000000ffH
	mov	DWORD PTR _temp$[ebp], ecx
; Line 389
	mov	edx, DWORD PTR _temp$[ebp]
	shl	edx, 8
	mov	DWORD PTR _temp$[ebp], edx
; Line 390
	mov	eax, DWORD PTR _ARPPack$[ebp]
	movsx	ecx, BYTE PTR [eax+3]
	and	ecx, 255				; 000000ffH
	mov	edx, DWORD PTR _temp$[ebp]
	or	edx, ecx
	mov	DWORD PTR _temp$[ebp], edx
; Line 391
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR _temp$[ebp]
	cmp	ecx, DWORD PTR [eax+20]
	je	SHORT $L1284
; Line 392
	mov	eax, -2					; fffffffeH
	jmp	$L1280
$L1284:
; Line 395
	mov	DWORD PTR _temp$[ebp], 0
; Line 396
	mov	edx, DWORD PTR _ARPPack$[ebp]
	movsx	eax, BYTE PTR [edx+4]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _temp$[ebp], eax
; Line 397
	mov	ecx, DWORD PTR _this$[ebp]
	movsx	edx, BYTE PTR [ecx+28]
	cmp	DWORD PTR _temp$[ebp], edx
	je	SHORT $L1285
; Line 398
	mov	eax, -3					; fffffffdH
	jmp	$L1280
$L1285:
; Line 401
	mov	DWORD PTR _temp$[ebp], 0
; Line 402
	mov	eax, DWORD PTR _ARPPack$[ebp]
	movsx	ecx, BYTE PTR [eax+5]
	and	ecx, 255				; 000000ffH
	mov	DWORD PTR _temp$[ebp], ecx
; Line 403
	mov	edx, DWORD PTR _this$[ebp]
	movsx	eax, BYTE PTR [edx+29]
	cmp	DWORD PTR _temp$[ebp], eax
	je	SHORT $L1286
; Line 404
	mov	eax, -4					; fffffffcH
	jmp	SHORT $L1280
$L1286:
; Line 407
	mov	DWORD PTR _temp$[ebp], 0
; Line 408
	mov	ecx, DWORD PTR _ARPPack$[ebp]
	movsx	edx, BYTE PTR [ecx+6]
	and	edx, 255				; 000000ffH
	mov	DWORD PTR _temp$[ebp], edx
; Line 409
	mov	eax, DWORD PTR _temp$[ebp]
	shl	eax, 8
	mov	DWORD PTR _temp$[ebp], eax
; Line 410
	mov	ecx, DWORD PTR _ARPPack$[ebp]
	movsx	edx, BYTE PTR [ecx+7]
	and	edx, 255				; 000000ffH
	mov	eax, DWORD PTR _temp$[ebp]
	or	eax, edx
	mov	DWORD PTR _temp$[ebp], eax
; Line 412
	cmp	DWORD PTR _temp$[ebp], 1
	jne	SHORT $L1287
; Line 415
	mov	ecx, DWORD PTR _currenttask$[ebp]
	push	ecx
	mov	edx, DWORD PTR _size$[ebp]
	push	edx
	mov	eax, DWORD PTR _ARPPack$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?ProcessRequest@ARPObj@@QAEHPADHH@Z	; ARPObj::ProcessRequest
	mov	DWORD PTR _retcode$[ebp], eax
; Line 416
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	SHORT $L1280
$L1287:
; Line 419
	cmp	DWORD PTR _temp$[ebp], 2
	jne	SHORT $L1289
; Line 422
	mov	ecx, DWORD PTR _size$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ARPPack$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?ProcessReplies@ARPObj@@QAEHPADH@Z	; ARPObj::ProcessReplies
	mov	DWORD PTR _retcode$[ebp], eax
; Line 423
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	SHORT $L1280
$L1289:
; Line 428
	mov	eax, -5					; fffffffbH
$L1280:
; Line 432
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
; Line 441
	push	ebp
	mov	ebp, esp
	sub	esp, 136				; 00000088H
	mov	DWORD PTR _this$[ebp], ecx
; Line 442
	lea	ecx, DWORD PTR _fto$[ebp]
	call	??0FTOPObj@@QAE@XZ			; FTOPObj::FTOPObj
; Line 443
	mov	DWORD PTR _i$[ebp], 0
; Line 446
	mov	eax, DWORD PTR ?noArprequestp@ARPObj@@0KA ; ARPObj::noArprequestp
	add	eax, 1
	mov	DWORD PTR ?noArprequestp@ARPObj@@0KA, eax ; ARPObj::noArprequestp
; Line 447
	mov	DWORD PTR _ARPFound$[ebp], 0
; Line 448
	mov	DWORD PTR _count1$[ebp], 0
$L1304:
; Line 450
	mov	ecx, 1
	test	ecx, ecx
	je	SHORT $L1305
	jmp	SHORT $L1304
$L1305:
; Line 452
	mov	edx, DWORD PTR _ARPPack$[ebp]
	movsx	eax, BYTE PTR [edx+24]
	movsx	ecx, BYTE PTR ?mSenderIP@ARPObj@@0PADA
	cmp	eax, ecx
	jne	$L1321
	mov	edx, DWORD PTR _ARPPack$[ebp]
	movsx	eax, BYTE PTR [edx+25]
	movsx	ecx, BYTE PTR ?mSenderIP@ARPObj@@0PADA+1
	cmp	eax, ecx
	jne	$L1321
	mov	edx, DWORD PTR _ARPPack$[ebp]
	movsx	eax, BYTE PTR [edx+26]
	movsx	ecx, BYTE PTR ?mSenderIP@ARPObj@@0PADA+2
	cmp	eax, ecx
	jne	$L1321
	mov	edx, DWORD PTR _ARPPack$[ebp]
	movsx	eax, BYTE PTR [edx+27]
	movsx	ecx, BYTE PTR ?mSenderIP@ARPObj@@0PADA+3
	cmp	eax, ecx
	jne	$L1321
; Line 456
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+16]
	sar	eax, 8
	and	eax, 255				; 000000ffH
	mov	BYTE PTR _ARP_PACK$[ebp], al
; Line 457
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+16]
	and	edx, 255				; 000000ffH
	mov	BYTE PTR _ARP_PACK$[ebp+1], dl
; Line 460
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+20]
	sar	ecx, 8
	and	ecx, 255				; 000000ffH
	mov	BYTE PTR _ARP_PACK$[ebp+2], cl
; Line 461
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+20]
	and	eax, 255				; 000000ffH
	mov	BYTE PTR _ARP_PACK$[ebp+3], al
; Line 464
	mov	ecx, DWORD PTR _this$[ebp]
	movsx	edx, BYTE PTR [ecx+28]
	and	edx, 255				; 000000ffH
	mov	BYTE PTR _ARP_PACK$[ebp+4], dl
; Line 467
	mov	eax, DWORD PTR _this$[ebp]
	movsx	ecx, BYTE PTR [eax+29]
	and	ecx, 255				; 000000ffH
	mov	BYTE PTR _ARP_PACK$[ebp+5], cl
; Line 470
	mov	BYTE PTR _ARP_PACK$[ebp+6], 0
; Line 471
	mov	BYTE PTR _ARP_PACK$[ebp+7], 2
; Line 474
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1307
$L1308:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L1307:
	cmp	DWORD PTR _i$[ebp], 6
	jge	SHORT $L1309
; Line 476
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	dl, BYTE PTR ?mSenderHA@ARPObj@@0PADA[ecx]
	mov	BYTE PTR _ARP_PACK$[ebp+eax+8], dl
; Line 477
	mov	eax, DWORD PTR _ARPPack$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	dl, BYTE PTR [eax+8]
	mov	BYTE PTR _ARP_PACK$[ebp+ecx+18], dl
; Line 478
	jmp	SHORT $L1308
$L1309:
; Line 481
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1310
$L1311:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L1310:
	cmp	DWORD PTR _i$[ebp], 4
	jge	SHORT $L1312
; Line 483
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	mov	al, BYTE PTR ?mSenderIP@ARPObj@@0PADA[edx]
	mov	BYTE PTR _ARP_PACK$[ebp+ecx+14], al
; Line 484
	mov	ecx, DWORD PTR _ARPPack$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	mov	al, BYTE PTR [ecx+14]
	mov	BYTE PTR _ARP_PACK$[ebp+edx+24], al
; Line 485
	jmp	SHORT $L1311
$L1312:
; Line 487
	lea	ecx, DWORD PTR _fto$[ebp]
	call	?getMode@FTOPObj@@QAEHXZ		; FTOPObj::getMode
	cmp	eax, 1
	jne	$L1316
; Line 492
	push	208					; 000000d0H
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?AOAgetSharedMem@AOAProtected@@QAEJH@Z	; AOAProtected::AOAgetSharedMem
	mov	DWORD PTR _retcode$[ebp], eax
; Line 493
	mov	ecx, DWORD PTR _retcode$[ebp]
	add	ecx, 1
	mov	DWORD PTR _retcode$[ebp], ecx
; Line 494
	mov	edx, DWORD PTR _retcode$[ebp]
	push	edx
	push	208					; 000000d0H
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 496
	push	180					; 000000b4H
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?AOAgetSharedMem@AOAProtected@@QAEJH@Z	; AOAProtected::AOAgetSharedMem
	mov	DWORD PTR _retcode$[ebp], eax
; Line 497
	mov	eax, DWORD PTR _retcode$[ebp]
	add	eax, 1
	mov	DWORD PTR _retcode$[ebp], eax
; Line 498
	mov	ecx, DWORD PTR _retcode$[ebp]
	push	ecx
	push	180					; 000000b4H
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 500
	push	208					; 000000d0H
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?AOAgetSharedMem@AOAProtected@@QAEJH@Z	; AOAProtected::AOAgetSharedMem
	mov	DWORD PTR _retcode$[ebp], eax
; Line 501
	mov	edx, DWORD PTR _retcode$[ebp]
	add	edx, 1
	mov	DWORD PTR _retcode$[ebp], edx
; Line 502
	mov	eax, DWORD PTR _retcode$[ebp]
	push	eax
	push	208					; 000000d0H
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 504
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
; Line 505
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L1316
; Line 507
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L1296
$L1316:
; Line 511
	mov	DWORD PTR _ARPFound$[ebp], 0
; Line 512
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1317
$L1318:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L1317:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR ?ARPT_Index@ARPObj@@2HA	; ARPObj::ARPT_Index
	jge	SHORT $L1319
; Line 515
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 10					; 0000000aH
	movsx	eax, BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[edx]
	mov	ecx, DWORD PTR _ARPPack$[ebp]
	movsx	edx, BYTE PTR [ecx+14]
	cmp	eax, edx
	jne	SHORT $L1320
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 10					; 0000000aH
	movsx	ecx, BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[eax+1]
	mov	edx, DWORD PTR _ARPPack$[ebp]
	movsx	eax, BYTE PTR [edx+15]
	cmp	ecx, eax
	jne	SHORT $L1320
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 10					; 0000000aH
	movsx	edx, BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[ecx+2]
	mov	eax, DWORD PTR _ARPPack$[ebp]
	movsx	ecx, BYTE PTR [eax+16]
	cmp	edx, ecx
	jne	SHORT $L1320
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 10					; 0000000aH
	movsx	eax, BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[edx+3]
	mov	ecx, DWORD PTR _ARPPack$[ebp]
	movsx	edx, BYTE PTR [ecx+17]
	cmp	eax, edx
	jne	SHORT $L1320
; Line 517
	mov	DWORD PTR _ARPFound$[ebp], 1
; Line 518
	jmp	SHORT $L1319
$L1320:
; Line 520
	jmp	SHORT $L1318
$L1319:
; Line 523
	cmp	DWORD PTR _ARPFound$[ebp], 0
	jne	$L1321
; Line 525
	mov	eax, DWORD PTR ?ARPT_Index@ARPObj@@2HA	; ARPObj::ARPT_Index
	imul	eax, 10					; 0000000aH
	mov	ecx, DWORD PTR _ARPPack$[ebp]
	mov	dl, BYTE PTR [ecx+14]
	mov	BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[eax], dl
; Line 526
	mov	eax, DWORD PTR ?ARPT_Index@ARPObj@@2HA	; ARPObj::ARPT_Index
	imul	eax, 10					; 0000000aH
	mov	ecx, DWORD PTR _ARPPack$[ebp]
	mov	dl, BYTE PTR [ecx+15]
	mov	BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[eax+1], dl
; Line 527
	mov	eax, DWORD PTR ?ARPT_Index@ARPObj@@2HA	; ARPObj::ARPT_Index
	imul	eax, 10					; 0000000aH
	mov	ecx, DWORD PTR _ARPPack$[ebp]
	mov	dl, BYTE PTR [ecx+16]
	mov	BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[eax+2], dl
; Line 528
	mov	eax, DWORD PTR ?ARPT_Index@ARPObj@@2HA	; ARPObj::ARPT_Index
	imul	eax, 10					; 0000000aH
	mov	ecx, DWORD PTR _ARPPack$[ebp]
	mov	dl, BYTE PTR [ecx+17]
	mov	BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[eax+3], dl
; Line 529
	mov	eax, DWORD PTR ?ARPT_Index@ARPObj@@2HA	; ARPObj::ARPT_Index
	imul	eax, 10					; 0000000aH
	mov	ecx, DWORD PTR _ARPPack$[ebp]
	mov	dl, BYTE PTR [ecx+8]
	mov	BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[eax+4], dl
; Line 530
	mov	eax, DWORD PTR ?ARPT_Index@ARPObj@@2HA	; ARPObj::ARPT_Index
	imul	eax, 10					; 0000000aH
	mov	ecx, DWORD PTR _ARPPack$[ebp]
	mov	dl, BYTE PTR [ecx+9]
	mov	BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[eax+5], dl
; Line 531
	mov	eax, DWORD PTR ?ARPT_Index@ARPObj@@2HA	; ARPObj::ARPT_Index
	imul	eax, 10					; 0000000aH
	mov	ecx, DWORD PTR _ARPPack$[ebp]
	mov	dl, BYTE PTR [ecx+10]
	mov	BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[eax+6], dl
; Line 532
	mov	eax, DWORD PTR ?ARPT_Index@ARPObj@@2HA	; ARPObj::ARPT_Index
	imul	eax, 10					; 0000000aH
	mov	ecx, DWORD PTR _ARPPack$[ebp]
	mov	dl, BYTE PTR [ecx+11]
	mov	BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[eax+7], dl
; Line 533
	mov	eax, DWORD PTR ?ARPT_Index@ARPObj@@2HA	; ARPObj::ARPT_Index
	imul	eax, 10					; 0000000aH
	mov	ecx, DWORD PTR _ARPPack$[ebp]
	mov	dl, BYTE PTR [ecx+12]
	mov	BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[eax+8], dl
; Line 534
	mov	eax, DWORD PTR ?ARPT_Index@ARPObj@@2HA	; ARPObj::ARPT_Index
	imul	eax, 10					; 0000000aH
	mov	ecx, DWORD PTR _ARPPack$[ebp]
	mov	dl, BYTE PTR [ecx+13]
	mov	BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[eax+9], dl
; Line 536
	mov	eax, DWORD PTR ?ARPT_Index@ARPObj@@2HA	; ARPObj::ARPT_Index
	add	eax, 1
	mov	DWORD PTR ?ARPT_Index@ARPObj@@2HA, eax	; ARPObj::ARPT_Index
$L1321:
; Line 681
	xor	eax, eax
$L1296:
; Line 682
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
; Line 691
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 692
	mov	DWORD PTR _ARPFound$[ebp], 0
; Line 693
	mov	DWORD PTR _i$[ebp], 0
; Line 697
	mov	eax, DWORD PTR _ARPPack$[ebp]
	movsx	ecx, BYTE PTR [eax+24]
	movsx	edx, BYTE PTR ?mSenderIP@ARPObj@@0PADA
	cmp	ecx, edx
	jne	$L1336
	mov	eax, DWORD PTR _ARPPack$[ebp]
	movsx	ecx, BYTE PTR [eax+25]
	movsx	edx, BYTE PTR ?mSenderIP@ARPObj@@0PADA+1
	cmp	ecx, edx
	jne	$L1336
	mov	eax, DWORD PTR _ARPPack$[ebp]
	movsx	ecx, BYTE PTR [eax+26]
	movsx	edx, BYTE PTR ?mSenderIP@ARPObj@@0PADA+2
	cmp	ecx, edx
	jne	$L1336
	mov	eax, DWORD PTR _ARPPack$[ebp]
	movsx	ecx, BYTE PTR [eax+27]
	movsx	edx, BYTE PTR ?mSenderIP@ARPObj@@0PADA+3
	cmp	ecx, edx
	jne	$L1336
; Line 699
	mov	DWORD PTR _ARPFound$[ebp], 0
; Line 701
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1332
$L1333:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L1332:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR ?ARPT_Index@ARPObj@@2HA	; ARPObj::ARPT_Index
	jge	SHORT $L1334
; Line 704
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 10					; 0000000aH
	movsx	eax, BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[edx]
	mov	ecx, DWORD PTR _ARPPack$[ebp]
	movsx	edx, BYTE PTR [ecx+14]
	cmp	eax, edx
	jne	SHORT $L1335
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 10					; 0000000aH
	movsx	ecx, BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[eax+1]
	mov	edx, DWORD PTR _ARPPack$[ebp]
	movsx	eax, BYTE PTR [edx+15]
	cmp	ecx, eax
	jne	SHORT $L1335
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 10					; 0000000aH
	movsx	edx, BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[ecx+2]
	mov	eax, DWORD PTR _ARPPack$[ebp]
	movsx	ecx, BYTE PTR [eax+16]
	cmp	edx, ecx
	jne	SHORT $L1335
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 10					; 0000000aH
	movsx	eax, BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[edx+3]
	mov	ecx, DWORD PTR _ARPPack$[ebp]
	movsx	edx, BYTE PTR [ecx+17]
	cmp	eax, edx
	jne	SHORT $L1335
; Line 706
	mov	DWORD PTR _ARPFound$[ebp], 1
; Line 707
	jmp	SHORT $L1334
$L1335:
; Line 709
	jmp	SHORT $L1333
$L1334:
; Line 713
	cmp	DWORD PTR _ARPFound$[ebp], 0
	jne	$L1336
; Line 715
	mov	eax, DWORD PTR ?ARPT_Index@ARPObj@@2HA	; ARPObj::ARPT_Index
	imul	eax, 10					; 0000000aH
	mov	ecx, DWORD PTR _ARPPack$[ebp]
	mov	dl, BYTE PTR [ecx+14]
	mov	BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[eax], dl
; Line 716
	mov	eax, DWORD PTR ?ARPT_Index@ARPObj@@2HA	; ARPObj::ARPT_Index
	imul	eax, 10					; 0000000aH
	mov	ecx, DWORD PTR _ARPPack$[ebp]
	mov	dl, BYTE PTR [ecx+15]
	mov	BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[eax+1], dl
; Line 717
	mov	eax, DWORD PTR ?ARPT_Index@ARPObj@@2HA	; ARPObj::ARPT_Index
	imul	eax, 10					; 0000000aH
	mov	ecx, DWORD PTR _ARPPack$[ebp]
	mov	dl, BYTE PTR [ecx+16]
	mov	BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[eax+2], dl
; Line 718
	mov	eax, DWORD PTR ?ARPT_Index@ARPObj@@2HA	; ARPObj::ARPT_Index
	imul	eax, 10					; 0000000aH
	mov	ecx, DWORD PTR _ARPPack$[ebp]
	mov	dl, BYTE PTR [ecx+17]
	mov	BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[eax+3], dl
; Line 719
	mov	eax, DWORD PTR ?ARPT_Index@ARPObj@@2HA	; ARPObj::ARPT_Index
	imul	eax, 10					; 0000000aH
	mov	ecx, DWORD PTR _ARPPack$[ebp]
	mov	dl, BYTE PTR [ecx+8]
	mov	BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[eax+4], dl
; Line 720
	mov	eax, DWORD PTR ?ARPT_Index@ARPObj@@2HA	; ARPObj::ARPT_Index
	imul	eax, 10					; 0000000aH
	mov	ecx, DWORD PTR _ARPPack$[ebp]
	mov	dl, BYTE PTR [ecx+9]
	mov	BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[eax+5], dl
; Line 721
	mov	eax, DWORD PTR ?ARPT_Index@ARPObj@@2HA	; ARPObj::ARPT_Index
	imul	eax, 10					; 0000000aH
	mov	ecx, DWORD PTR _ARPPack$[ebp]
	mov	dl, BYTE PTR [ecx+10]
	mov	BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[eax+6], dl
; Line 722
	mov	eax, DWORD PTR ?ARPT_Index@ARPObj@@2HA	; ARPObj::ARPT_Index
	imul	eax, 10					; 0000000aH
	mov	ecx, DWORD PTR _ARPPack$[ebp]
	mov	dl, BYTE PTR [ecx+11]
	mov	BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[eax+7], dl
; Line 723
	mov	eax, DWORD PTR ?ARPT_Index@ARPObj@@2HA	; ARPObj::ARPT_Index
	imul	eax, 10					; 0000000aH
	mov	ecx, DWORD PTR _ARPPack$[ebp]
	mov	dl, BYTE PTR [ecx+12]
	mov	BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[eax+8], dl
; Line 724
	mov	eax, DWORD PTR ?ARPT_Index@ARPObj@@2HA	; ARPObj::ARPT_Index
	imul	eax, 10					; 0000000aH
	mov	ecx, DWORD PTR _ARPPack$[ebp]
	mov	dl, BYTE PTR [ecx+13]
	mov	BYTE PTR ?ARPT@ARPObj@@0PAUarprecordT@@A[eax+9], dl
; Line 725
	mov	eax, DWORD PTR ?ARPT_Index@ARPObj@@2HA	; ARPObj::ARPT_Index
	add	eax, 1
	mov	DWORD PTR ?ARPT_Index@ARPObj@@2HA, eax	; ARPObj::ARPT_Index
$L1336:
; Line 806
	xor	eax, eax
; Line 807
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
; Line 814
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 815
	mov	DWORD PTR _temp$[ebp], 0
; Line 816
	mov	DWORD PTR _i$[ebp], 0
; Line 817
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1343
$L1344:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L1343:
	cmp	DWORD PTR _i$[ebp], 4
	jge	SHORT $L1345
; Line 819
	mov	ecx, DWORD PTR _ip$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	movsx	edx, BYTE PTR [ecx]
	mov	eax, DWORD PTR _temp$[ebp]
	add	eax, edx
	mov	DWORD PTR _temp$[ebp], eax
; Line 820
	jmp	SHORT $L1344
$L1345:
; Line 821
	mov	eax, DWORD PTR _temp$[ebp]
	cdq
	mov	ecx, 100				; 00000064H
	idiv	ecx
	mov	eax, edx
; Line 822
	mov	esp, ebp
	pop	ebp
	ret	4
?hashFun@ARPObj@@AAEHPAD@Z ENDP				; ARPObj::hashFun
_TEXT	ENDS
PUBLIC	?close@ARPObj@@QAEXXZ				; ARPObj::close
_TEXT	SEGMENT
_this$ = -4
?close@ARPObj@@QAEXXZ PROC NEAR				; ARPObj::close
; Line 827
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 829
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
; Line 837
	push	ebp
	mov	ebp, esp
	sub	esp, 124				; 0000007cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 840
	mov	BYTE PTR _targetHA$[ebp], -1
	mov	BYTE PTR _targetHA$[ebp+1], -1
	mov	BYTE PTR _targetHA$[ebp+2], -1
	mov	BYTE PTR _targetHA$[ebp+3], -1
	mov	BYTE PTR _targetHA$[ebp+4], -1
	mov	BYTE PTR _targetHA$[ebp+5], -1
; Line 841
	mov	DWORD PTR _count1$[ebp], 0
; Line 845
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+16]
	sar	ecx, 8
	and	ecx, 255				; 000000ffH
	mov	BYTE PTR _ARP_PACK$[ebp], cl
; Line 846
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+16]
	and	eax, 255				; 000000ffH
	mov	BYTE PTR _ARP_PACK$[ebp+1], al
; Line 849
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+20]
	sar	edx, 8
	and	edx, 255				; 000000ffH
	mov	BYTE PTR _ARP_PACK$[ebp+2], dl
; Line 850
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+20]
	and	ecx, 255				; 000000ffH
	mov	BYTE PTR _ARP_PACK$[ebp+3], cl
; Line 853
	mov	edx, DWORD PTR _this$[ebp]
	movsx	eax, BYTE PTR [edx+28]
	and	eax, 255				; 000000ffH
	mov	BYTE PTR _ARP_PACK$[ebp+4], al
; Line 855
	mov	ecx, DWORD PTR _this$[ebp]
	movsx	edx, BYTE PTR [ecx+29]
	and	edx, 255				; 000000ffH
	mov	BYTE PTR _ARP_PACK$[ebp+5], dl
; Line 858
	mov	BYTE PTR _ARP_PACK$[ebp+6], 0
; Line 859
	mov	BYTE PTR _ARP_PACK$[ebp+7], 2
; Line 862
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1359
$L1360:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L1359:
	cmp	DWORD PTR _i$[ebp], 6
	jge	SHORT $L1361
; Line 864
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	mov	al, BYTE PTR ?mSenderHA@ARPObj@@0PADA[edx]
	mov	BYTE PTR _ARP_PACK$[ebp+ecx+8], al
; Line 865
	mov	ecx, DWORD PTR _i$[ebp]
	mov	BYTE PTR _ARP_PACK$[ebp+ecx+18], -1
; Line 866
	jmp	SHORT $L1360
$L1361:
; Line 868
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1362
$L1363:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L1362:
	cmp	DWORD PTR _i$[ebp], 4
	jge	SHORT $L1364
; Line 870
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	dl, BYTE PTR ?mSenderIP@ARPObj@@0PADA[ecx]
	mov	BYTE PTR _ARP_PACK$[ebp+eax+14], dl
; Line 871
	mov	eax, DWORD PTR _targetIP$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	dl, BYTE PTR [eax]
	mov	BYTE PTR _ARP_PACK$[ebp+ecx+24], dl
; Line 872
	jmp	SHORT $L1363
$L1364:
; Line 876
	push	180					; 000000b4H
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?AOAgetSharedMem@AOAProtected@@QAEJH@Z	; AOAProtected::AOAgetSharedMem
	mov	DWORD PTR _retcode$[ebp], eax
; Line 877
	mov	eax, DWORD PTR _retcode$[ebp]
	add	eax, 1
	mov	DWORD PTR _retcode$[ebp], eax
; Line 878
	mov	ecx, DWORD PTR _retcode$[ebp]
	push	ecx
	push	180					; 000000b4H
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 880
	push	208					; 000000d0H
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?AOAgetSharedMem@AOAProtected@@QAEJH@Z	; AOAProtected::AOAgetSharedMem
	mov	DWORD PTR _retcode$[ebp], eax
; Line 881
	mov	edx, DWORD PTR _retcode$[ebp]
	add	edx, 1
	mov	DWORD PTR _retcode$[ebp], edx
; Line 882
	mov	eax, DWORD PTR _retcode$[ebp]
	push	eax
	push	208					; 000000d0H
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 884
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
; Line 886
	xor	eax, eax
; Line 887
	mov	esp, ebp
	pop	ebp
	ret	8
?Response@ARPObj@@QAEHPADH@Z ENDP			; ARPObj::Response
_TEXT	ENDS
PUBLIC	?printStatistics@ARPObj@@QAEXH@Z		; ARPObj::printStatistics
EXTRN	?AOAprintHex@AOAProtected@@QAEHJH@Z:NEAR	; AOAProtected::AOAprintHex
EXTRN	?AOAPrintText@AOAProtected@@QAEXPADH@Z:NEAR	; AOAProtected::AOAPrintText
_DATA	SEGMENT
$SG1372	DB	'ARP Statistics', 00H
	ORG $+1
$SG1373	DB	'Total Number of ARP Packets Processed    :', 00H
	ORG $+1
$SG1374	DB	'Total Number of ARP resolution successful:', 00H
	ORG $+1
$SG1375	DB	'Total Number of ARP resolution failed    :', 00H
	ORG $+1
$SG1376	DB	'Total Number of ARP request processed    :', 00H
_DATA	ENDS
_TEXT	SEGMENT
_Line$ = 8
_this$ = -12
_io$ = -8
?printStatistics@ARPObj@@QAEXH@Z PROC NEAR		; ARPObj::printStatistics
; Line 892
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 893
	lea	ecx, DWORD PTR _io$[ebp]
	call	??0AOAProtected@@QAE@XZ			; AOAProtected::AOAProtected
; Line 894
	mov	eax, DWORD PTR _Line$[ebp]
	push	eax
	push	OFFSET FLAT:$SG1372
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 895
	mov	ecx, DWORD PTR _Line$[ebp]
	add	ecx, 160				; 000000a0H
	push	ecx
	push	OFFSET FLAT:$SG1373
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 896
	mov	edx, DWORD PTR _Line$[ebp]
	add	edx, 248				; 000000f8H
	push	edx
	mov	eax, DWORD PTR ?noArppackp@ARPObj@@0KA	; ARPObj::noArppackp
	push	eax
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 897
	mov	ecx, DWORD PTR _Line$[ebp]
	add	ecx, 320				; 00000140H
	push	ecx
	push	OFFSET FLAT:$SG1374
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 898
	mov	edx, DWORD PTR _Line$[ebp]
	add	edx, 408				; 00000198H
	push	edx
	mov	eax, DWORD PTR ?noArpresolves@ARPObj@@0KA ; ARPObj::noArpresolves
	push	eax
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 899
	mov	ecx, DWORD PTR _Line$[ebp]
	add	ecx, 480				; 000001e0H
	push	ecx
	push	OFFSET FLAT:$SG1375
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 900
	mov	edx, DWORD PTR _Line$[ebp]
	add	edx, 568				; 00000238H
	push	edx
	mov	eax, DWORD PTR ?noArpresolvef@ARPObj@@0KA ; ARPObj::noArpresolvef
	push	eax
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 901
	mov	ecx, DWORD PTR _Line$[ebp]
	add	ecx, 640				; 00000280H
	push	ecx
	push	OFFSET FLAT:$SG1376
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 902
	mov	edx, DWORD PTR _Line$[ebp]
	add	edx, 728				; 000002d8H
	push	edx
	mov	eax, DWORD PTR ?noArprequestp@ARPObj@@0KA ; ARPObj::noArprequestp
	push	eax
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 903
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
; Line 909
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	mov	DWORD PTR _this$[ebp], ecx
; Line 910
	lea	ecx, DWORD PTR _io$[ebp]
	call	??0AOAProtected@@QAE@XZ			; AOAProtected::AOAProtected
; Line 912
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L1383
$L1384:
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	DWORD PTR _j$[ebp], eax
$L1383:
	cmp	DWORD PTR _j$[ebp], 4
	jge	$L1385
; Line 914
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
; Line 915
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
; Line 916
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
; Line 917
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
; Line 919
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
; Line 920
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
; Line 921
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
; Line 922
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
; Line 923
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
; Line 924
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
; Line 925
	jmp	$L1384
$L1385:
; Line 926
	mov	esp, ebp
	pop	ebp
	ret	4
?printARPTable@ARPObj@@QAEXH@Z ENDP			; ARPObj::printARPTable
_TEXT	ENDS
END
