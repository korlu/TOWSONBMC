	TITLE	EtherObj.cpp
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
PUBLIC	?IO_BASE@EtherObj@@0FA				; EtherObj::IO_BASE
PUBLIC	?mac@EtherObj@@2PADA				; EtherObj::mac
PUBLIC	?DownListPointer@EtherObj@@2JA			; EtherObj::DownListPointer
PUBLIC	?DownListDataPointer@EtherObj@@2JA		; EtherObj::DownListDataPointer
PUBLIC	?UpListPointer@EtherObj@@2JA			; EtherObj::UpListPointer
PUBLIC	?SndLstSize@EtherObj@@2JA			; EtherObj::SndLstSize
PUBLIC	?RcvLstSize@EtherObj@@2JA			; EtherObj::RcvLstSize
PUBLIC	?PacketSize@EtherObj@@2JA			; EtherObj::PacketSize
PUBLIC	?SendInPtr@EtherObj@@2JA			; EtherObj::SendInPtr
PUBLIC	?SendOutPtr@EtherObj@@2JA			; EtherObj::SendOutPtr
PUBLIC	?ReceiveInPtr@EtherObj@@2JA			; EtherObj::ReceiveInPtr
PUBLIC	?ReceiveOutPtr@EtherObj@@2JA			; EtherObj::ReceiveOutPtr
PUBLIC	?NoofPackets@EtherObj@@2JA			; EtherObj::NoofPackets
_BSS	SEGMENT
?IO_BASE@EtherObj@@0FA DW 01H DUP (?)			; EtherObj::IO_BASE
	ALIGN	4

?mac@EtherObj@@2PADA DB 06H DUP (?)			; EtherObj::mac
	ALIGN	4

?DownListPointer@EtherObj@@2JA DD 01H DUP (?)		; EtherObj::DownListPointer
?DownListDataPointer@EtherObj@@2JA DD 01H DUP (?)	; EtherObj::DownListDataPointer
?UpListPointer@EtherObj@@2JA DD 01H DUP (?)		; EtherObj::UpListPointer
?SndLstSize@EtherObj@@2JA DD 01H DUP (?)		; EtherObj::SndLstSize
?RcvLstSize@EtherObj@@2JA DD 01H DUP (?)		; EtherObj::RcvLstSize
?PacketSize@EtherObj@@2JA DD 01H DUP (?)		; EtherObj::PacketSize
?ReceiveInPtr@EtherObj@@2JA DD 01H DUP (?)		; EtherObj::ReceiveInPtr
?ReceiveOutPtr@EtherObj@@2JA DD 01H DUP (?)		; EtherObj::ReceiveOutPtr
?NoofPackets@EtherObj@@2JA DD 01H DUP (?)		; EtherObj::NoofPackets
_BSS	ENDS
_DATA	SEGMENT
?SendInPtr@EtherObj@@2JA DD 01H				; EtherObj::SendInPtr
?SendOutPtr@EtherObj@@2JA DD 01H			; EtherObj::SendOutPtr
_DATA	ENDS
PUBLIC	??0EtherObj@@QAE@XZ				; EtherObj::EtherObj
EXTRN	??0AOAProtected@@QAE@XZ:NEAR			; AOAProtected::AOAProtected
EXTRN	??0AOATask@@QAE@XZ:NEAR				; AOATask::AOATask
_TEXT	SEGMENT
_this$ = -4
??0EtherObj@@QAE@XZ PROC NEAR				; EtherObj::EtherObj
; File EtherObj.cpp
; Line 82
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	??0AOAProtected@@QAE@XZ			; AOAProtected::AOAProtected
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	??0AOATask@@QAE@XZ			; AOATask::AOATask
; Line 83
	mov	eax, DWORD PTR _this$[ebp]
	mov	esp, ebp
	pop	ebp
	ret	0
??0EtherObj@@QAE@XZ ENDP				; EtherObj::EtherObj
_TEXT	ENDS
PUBLIC	?getBaseAddress@EtherObj@@QAEHXZ		; EtherObj::getBaseAddress
_TEXT	SEGMENT
_this$ = -4
?getBaseAddress@EtherObj@@QAEHXZ PROC NEAR		; EtherObj::getBaseAddress
; Line 89
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 90
	movsx	eax, WORD PTR ?IO_BASE@EtherObj@@0FA	; EtherObj::IO_BASE
; Line 91
	mov	esp, ebp
	pop	ebp
	ret	0
?getBaseAddress@EtherObj@@QAEHXZ ENDP			; EtherObj::getBaseAddress
_TEXT	ENDS
PUBLIC	?setBaseAddress@EtherObj@@QAEXH@Z		; EtherObj::setBaseAddress
_TEXT	SEGMENT
_addr$ = 8
_this$ = -4
?setBaseAddress@EtherObj@@QAEXH@Z PROC NEAR		; EtherObj::setBaseAddress
; Line 96
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 97
	mov	ax, WORD PTR _addr$[ebp]
	mov	WORD PTR ?IO_BASE@EtherObj@@0FA, ax	; EtherObj::IO_BASE
; Line 98
	mov	esp, ebp
	pop	ebp
	ret	4
?setBaseAddress@EtherObj@@QAEXH@Z ENDP			; EtherObj::setBaseAddress
_TEXT	ENDS
PUBLIC	?createDataStructure@EtherObj@@QAEHHHHHHHHHHH@Z	; EtherObj::createDataStructure
EXTRN	_ccreateDS:NEAR
_TEXT	SEGMENT
_p1$ = 8
_p2$ = 12
_p3$ = 16
_p4$ = 20
_p5$ = 24
_p6$ = 28
_p7$ = 32
_p8$ = 36
_p9$ = 40
_p10$ = 44
_this$ = -4
?createDataStructure@EtherObj@@QAEHHHHHHHHHHH@Z PROC NEAR ; EtherObj::createDataStructure
; Line 106
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 107
	mov	eax, DWORD PTR _p8$[ebp]
	mov	DWORD PTR ?DownListPointer@EtherObj@@2JA, eax ; EtherObj::DownListPointer
; Line 108
	mov	ecx, DWORD PTR _p9$[ebp]
	mov	DWORD PTR ?DownListDataPointer@EtherObj@@2JA, ecx ; EtherObj::DownListDataPointer
; Line 110
	mov	edx, DWORD PTR _p3$[ebp]
	mov	DWORD PTR ?UpListPointer@EtherObj@@2JA, edx ; EtherObj::UpListPointer
; Line 111
	mov	eax, DWORD PTR _p6$[ebp]
	mov	DWORD PTR ?SndLstSize@EtherObj@@2JA, eax ; EtherObj::SndLstSize
; Line 112
	mov	ecx, DWORD PTR _p1$[ebp]
	mov	DWORD PTR ?RcvLstSize@EtherObj@@2JA, ecx ; EtherObj::RcvLstSize
; Line 113
	mov	edx, DWORD PTR _p10$[ebp]
	and	edx, 8191				; 00001fffH
	mov	DWORD PTR ?PacketSize@EtherObj@@2JA, edx ; EtherObj::PacketSize
; Line 115
	mov	ax, WORD PTR ?IO_BASE@EtherObj@@0FA	; EtherObj::IO_BASE
	push	eax
	mov	ecx, DWORD PTR _p10$[ebp]
	push	ecx
	mov	edx, DWORD PTR _p9$[ebp]
	push	edx
	mov	eax, DWORD PTR _p8$[ebp]
	push	eax
	mov	ecx, DWORD PTR _p7$[ebp]
	push	ecx
	mov	edx, DWORD PTR _p6$[ebp]
	push	edx
	mov	eax, DWORD PTR _p5$[ebp]
	push	eax
	mov	ecx, DWORD PTR _p4$[ebp]
	push	ecx
	mov	edx, DWORD PTR _p3$[ebp]
	push	edx
	mov	eax, DWORD PTR _p2$[ebp]
	push	eax
	mov	ecx, DWORD PTR _p1$[ebp]
	push	ecx
	call	_ccreateDS
	add	esp, 44					; 0000002cH
; Line 116
	mov	esp, ebp
	pop	ebp
	ret	40					; 00000028H
?createDataStructure@EtherObj@@QAEHHHHHHHHHHH@Z ENDP	; EtherObj::createDataStructure
_TEXT	ENDS
PUBLIC	?enableTransmit@EtherObj@@QAEHXZ		; EtherObj::enableTransmit
EXTRN	_cenableTransmit:NEAR
_TEXT	SEGMENT
_this$ = -4
?enableTransmit@EtherObj@@QAEHXZ PROC NEAR		; EtherObj::enableTransmit
; Line 122
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 123
	mov	eax, DWORD PTR ?DownListPointer@EtherObj@@2JA ; EtherObj::DownListPointer
	push	eax
	movsx	ecx, WORD PTR ?IO_BASE@EtherObj@@0FA	; EtherObj::IO_BASE
	push	ecx
	call	_cenableTransmit
	add	esp, 8
; Line 124
	mov	esp, ebp
	pop	ebp
	ret	0
?enableTransmit@EtherObj@@QAEHXZ ENDP			; EtherObj::enableTransmit
_TEXT	ENDS
PUBLIC	?enableReceive@EtherObj@@QAEHXZ			; EtherObj::enableReceive
EXTRN	_cenableReceive:NEAR
_TEXT	SEGMENT
_this$ = -4
?enableReceive@EtherObj@@QAEHXZ PROC NEAR		; EtherObj::enableReceive
; Line 129
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 130
	movsx	eax, WORD PTR ?IO_BASE@EtherObj@@0FA	; EtherObj::IO_BASE
	push	eax
	call	_cenableReceive
	add	esp, 4
; Line 131
	mov	esp, ebp
	pop	ebp
	ret	0
?enableReceive@EtherObj@@QAEHXZ ENDP			; EtherObj::enableReceive
_TEXT	ENDS
PUBLIC	?disableReceive@EtherObj@@QAEHXZ		; EtherObj::disableReceive
EXTRN	_cdisableReceive:NEAR
_TEXT	SEGMENT
_this$ = -4
?disableReceive@EtherObj@@QAEHXZ PROC NEAR		; EtherObj::disableReceive
; Line 136
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 137
	movsx	eax, WORD PTR ?IO_BASE@EtherObj@@0FA	; EtherObj::IO_BASE
	push	eax
	call	_cdisableReceive
	add	esp, 4
; Line 138
	mov	esp, ebp
	pop	ebp
	ret	0
?disableReceive@EtherObj@@QAEHXZ ENDP			; EtherObj::disableReceive
_TEXT	ENDS
PUBLIC	?disableTransmit@EtherObj@@QAEHXZ		; EtherObj::disableTransmit
EXTRN	_cdisableTransmit:NEAR
_TEXT	SEGMENT
_this$ = -4
?disableTransmit@EtherObj@@QAEHXZ PROC NEAR		; EtherObj::disableTransmit
; Line 143
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 144
	movsx	eax, WORD PTR ?IO_BASE@EtherObj@@0FA	; EtherObj::IO_BASE
	push	eax
	call	_cdisableTransmit
	add	esp, 4
; Line 145
	mov	esp, ebp
	pop	ebp
	ret	0
?disableTransmit@EtherObj@@QAEHXZ ENDP			; EtherObj::disableTransmit
_TEXT	ENDS
PUBLIC	?ackNICInt@EtherObj@@QAEHH@Z			; EtherObj::ackNICInt
EXTRN	_cackNICInt:NEAR
_TEXT	SEGMENT
_num$ = 8
_this$ = -4
?ackNICInt@EtherObj@@QAEHH@Z PROC NEAR			; EtherObj::ackNICInt
; Line 151
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 152
	mov	eax, DWORD PTR _num$[ebp]
	push	eax
	movsx	ecx, WORD PTR ?IO_BASE@EtherObj@@0FA	; EtherObj::IO_BASE
	push	ecx
	call	_cackNICInt
	add	esp, 8
; Line 153
	mov	esp, ebp
	pop	ebp
	ret	4
?ackNICInt@EtherObj@@QAEHH@Z ENDP			; EtherObj::ackNICInt
_TEXT	ENDS
PUBLIC	?getCurrentReceivePtr@EtherObj@@QAEHXZ		; EtherObj::getCurrentReceivePtr
EXTRN	_cgetCurrentReceivePtr:NEAR
_TEXT	SEGMENT
_this$ = -12
_value$ = -4
_index$ = -8
?getCurrentReceivePtr@EtherObj@@QAEHXZ PROC NEAR	; EtherObj::getCurrentReceivePtr
; Line 160
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 161
	mov	DWORD PTR _value$[ebp], 0
; Line 162
	mov	DWORD PTR _index$[ebp], 0
; Line 163
	mov	ax, WORD PTR ?IO_BASE@EtherObj@@0FA	; EtherObj::IO_BASE
	push	eax
	call	_cgetCurrentReceivePtr
	add	esp, 4
	mov	DWORD PTR _value$[ebp], eax
; Line 164
	mov	eax, DWORD PTR _value$[ebp]
	sub	eax, DWORD PTR ?UpListPointer@EtherObj@@2JA ; EtherObj::UpListPointer
	cdq
	and	edx, 31					; 0000001fH
	add	eax, edx
	sar	eax, 5
	mov	DWORD PTR _index$[ebp], eax
; Line 165
	mov	eax, DWORD PTR _index$[ebp]
; Line 166
	mov	esp, ebp
	pop	ebp
	ret	0
?getCurrentReceivePtr@EtherObj@@QAEHXZ ENDP		; EtherObj::getCurrentReceivePtr
_TEXT	ENDS
PUBLIC	?StopTransmitAt@EtherObj@@QAEHH@Z		; EtherObj::StopTransmitAt
EXTRN	_cstopTransmitAt:NEAR
_TEXT	SEGMENT
_ptr$ = 8
_this$ = -4
?StopTransmitAt@EtherObj@@QAEHH@Z PROC NEAR		; EtherObj::StopTransmitAt
; Line 169
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 170
	mov	eax, DWORD PTR ?DownListPointer@EtherObj@@2JA ; EtherObj::DownListPointer
	push	eax
	mov	ecx, DWORD PTR _ptr$[ebp]
	push	ecx
	call	_cstopTransmitAt
	add	esp, 8
; Line 171
	mov	esp, ebp
	pop	ebp
	ret	4
?StopTransmitAt@EtherObj@@QAEHH@Z ENDP			; EtherObj::StopTransmitAt
_TEXT	ENDS
PUBLIC	?getCurrentSendPtr@EtherObj@@QAEHXZ		; EtherObj::getCurrentSendPtr
EXTRN	_cgetCurrentSendPtr:NEAR
_TEXT	SEGMENT
_this$ = -4
?getCurrentSendPtr@EtherObj@@QAEHXZ PROC NEAR		; EtherObj::getCurrentSendPtr
; Line 178
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 179
	mov	ax, WORD PTR ?IO_BASE@EtherObj@@0FA	; EtherObj::IO_BASE
	push	eax
	call	_cgetCurrentSendPtr
	add	esp, 4
; Line 180
	mov	esp, ebp
	pop	ebp
	ret	0
?getCurrentSendPtr@EtherObj@@QAEHXZ ENDP		; EtherObj::getCurrentSendPtr
_TEXT	ENDS
PUBLIC	?getTransmitStatus@EtherObj@@QAEHXZ		; EtherObj::getTransmitStatus
EXTRN	_cgetTransmitStatus:NEAR
_TEXT	SEGMENT
_this$ = -4
?getTransmitStatus@EtherObj@@QAEHXZ PROC NEAR		; EtherObj::getTransmitStatus
; Line 185
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 186
	movsx	eax, WORD PTR ?IO_BASE@EtherObj@@0FA	; EtherObj::IO_BASE
	push	eax
	call	_cgetTransmitStatus
	add	esp, 4
; Line 187
	mov	esp, ebp
	pop	ebp
	ret	0
?getTransmitStatus@EtherObj@@QAEHXZ ENDP		; EtherObj::getTransmitStatus
_TEXT	ENDS
PUBLIC	?getIntStatus@EtherObj@@QAEHXZ			; EtherObj::getIntStatus
EXTRN	_cgetIntStatus:NEAR
_TEXT	SEGMENT
_this$ = -4
?getIntStatus@EtherObj@@QAEHXZ PROC NEAR		; EtherObj::getIntStatus
; Line 192
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 193
	movsx	eax, WORD PTR ?IO_BASE@EtherObj@@0FA	; EtherObj::IO_BASE
	push	eax
	call	_cgetIntStatus
	add	esp, 4
; Line 194
	mov	esp, ebp
	pop	ebp
	ret	0
?getIntStatus@EtherObj@@QAEHXZ ENDP			; EtherObj::getIntStatus
_TEXT	ENDS
PUBLIC	?getTransmitFree@EtherObj@@QAEHXZ		; EtherObj::getTransmitFree
EXTRN	_cgetTransmitFree:NEAR
_TEXT	SEGMENT
_this$ = -4
?getTransmitFree@EtherObj@@QAEHXZ PROC NEAR		; EtherObj::getTransmitFree
; Line 199
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 200
	movsx	eax, WORD PTR ?IO_BASE@EtherObj@@0FA	; EtherObj::IO_BASE
	push	eax
	call	_cgetTransmitFree
	add	esp, 4
; Line 201
	mov	esp, ebp
	pop	ebp
	ret	0
?getTransmitFree@EtherObj@@QAEHXZ ENDP			; EtherObj::getTransmitFree
_TEXT	ENDS
PUBLIC	?getTransmitPacketId@EtherObj@@QAEHXZ		; EtherObj::getTransmitPacketId
EXTRN	_cgetTransmitPacketId:NEAR
_TEXT	SEGMENT
_this$ = -4
?getTransmitPacketId@EtherObj@@QAEHXZ PROC NEAR		; EtherObj::getTransmitPacketId
; Line 206
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 207
	movsx	eax, WORD PTR ?IO_BASE@EtherObj@@0FA	; EtherObj::IO_BASE
	push	eax
	call	_cgetTransmitPacketId
	add	esp, 4
; Line 208
	mov	esp, ebp
	pop	ebp
	ret	0
?getTransmitPacketId@EtherObj@@QAEHXZ ENDP		; EtherObj::getTransmitPacketId
_TEXT	ENDS
PUBLIC	?getMediaStatus@EtherObj@@QAEHXZ		; EtherObj::getMediaStatus
EXTRN	_cgetMediaStatus:NEAR
_TEXT	SEGMENT
_this$ = -4
?getMediaStatus@EtherObj@@QAEHXZ PROC NEAR		; EtherObj::getMediaStatus
; Line 213
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 214
	movsx	eax, WORD PTR ?IO_BASE@EtherObj@@0FA	; EtherObj::IO_BASE
	push	eax
	call	_cgetMediaStatus
	add	esp, 4
; Line 215
	mov	esp, ebp
	pop	ebp
	ret	0
?getMediaStatus@EtherObj@@QAEHXZ ENDP			; EtherObj::getMediaStatus
_TEXT	ENDS
PUBLIC	?getFifoDiag@EtherObj@@QAEHXZ			; EtherObj::getFifoDiag
EXTRN	_cgetFifoDiag:NEAR
_TEXT	SEGMENT
_this$ = -4
?getFifoDiag@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::getFifoDiag
; Line 220
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 221
	movsx	eax, WORD PTR ?IO_BASE@EtherObj@@0FA	; EtherObj::IO_BASE
	push	eax
	call	_cgetFifoDiag
	add	esp, 4
; Line 222
	mov	esp, ebp
	pop	ebp
	ret	0
?getFifoDiag@EtherObj@@QAEHXZ ENDP			; EtherObj::getFifoDiag
_TEXT	ENDS
PUBLIC	?dnStall@EtherObj@@QAEHXZ			; EtherObj::dnStall
EXTRN	_cdnStall:NEAR
_TEXT	SEGMENT
_this$ = -4
?dnStall@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::dnStall
; Line 225
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 226
	movsx	eax, WORD PTR ?IO_BASE@EtherObj@@0FA	; EtherObj::IO_BASE
	push	eax
	call	_cdnStall
	add	esp, 4
; Line 227
	xor	eax, eax
; Line 228
	mov	esp, ebp
	pop	ebp
	ret	0
?dnStall@EtherObj@@QAEHXZ ENDP				; EtherObj::dnStall
_TEXT	ENDS
PUBLIC	?dnUnStall@EtherObj@@QAEHXZ			; EtherObj::dnUnStall
EXTRN	_cdnUnStall:NEAR
_TEXT	SEGMENT
_this$ = -4
?dnUnStall@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::dnUnStall
; Line 231
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 232
	movsx	eax, WORD PTR ?IO_BASE@EtherObj@@0FA	; EtherObj::IO_BASE
	push	eax
	call	_cdnUnStall
	add	esp, 4
; Line 233
	xor	eax, eax
; Line 234
	mov	esp, ebp
	pop	ebp
	ret	0
?dnUnStall@EtherObj@@QAEHXZ ENDP			; EtherObj::dnUnStall
_TEXT	ENDS
PUBLIC	?upStall@EtherObj@@QAEHXZ			; EtherObj::upStall
EXTRN	_cupStall:NEAR
_TEXT	SEGMENT
_this$ = -4
?upStall@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::upStall
; Line 237
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 238
	movsx	eax, WORD PTR ?IO_BASE@EtherObj@@0FA	; EtherObj::IO_BASE
	push	eax
	call	_cupStall
	add	esp, 4
; Line 239
	xor	eax, eax
; Line 240
	mov	esp, ebp
	pop	ebp
	ret	0
?upStall@EtherObj@@QAEHXZ ENDP				; EtherObj::upStall
_TEXT	ENDS
PUBLIC	?upUnStall@EtherObj@@QAEHXZ			; EtherObj::upUnStall
EXTRN	_cupUnStall:NEAR
_TEXT	SEGMENT
_this$ = -4
?upUnStall@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::upUnStall
; Line 243
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 244
	movsx	eax, WORD PTR ?IO_BASE@EtherObj@@0FA	; EtherObj::IO_BASE
	push	eax
	call	_cupUnStall
	add	esp, 4
; Line 245
	xor	eax, eax
; Line 246
	mov	esp, ebp
	pop	ebp
	ret	0
?upUnStall@EtherObj@@QAEHXZ ENDP			; EtherObj::upUnStall
_TEXT	ENDS
PUBLIC	?setDnLstPtr@EtherObj@@QAEHH@Z			; EtherObj::setDnLstPtr
EXTRN	_csetDnLstPtr:NEAR
_TEXT	SEGMENT
_ptr$ = 8
_this$ = -4
?setDnLstPtr@EtherObj@@QAEHH@Z PROC NEAR		; EtherObj::setDnLstPtr
; Line 250
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 251
	mov	eax, DWORD PTR _ptr$[ebp]
	push	eax
	movsx	ecx, WORD PTR ?IO_BASE@EtherObj@@0FA	; EtherObj::IO_BASE
	push	ecx
	call	_csetDnLstPtr
	add	esp, 8
; Line 252
	xor	eax, eax
; Line 253
	mov	esp, ebp
	pop	ebp
	ret	4
?setDnLstPtr@EtherObj@@QAEHH@Z ENDP			; EtherObj::setDnLstPtr
_TEXT	ENDS
PUBLIC	?discardPacket@EtherObj@@QAEHXZ			; EtherObj::discardPacket
_TEXT	SEGMENT
_this$ = -12
_pktStatLocation$ = -4
_l1$ = -8
?discardPacket@EtherObj@@QAEHXZ PROC NEAR		; EtherObj::discardPacket
; Line 260
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 263
	lea	eax, DWORD PTR _l1$[ebp]
	mov	DWORD PTR _pktStatLocation$[ebp], eax
; Line 268
	mov	ecx, DWORD PTR ?ReceiveOutPtr@EtherObj@@2JA ; EtherObj::ReceiveOutPtr
	shl	ecx, 5
	mov	edx, DWORD PTR ?UpListPointer@EtherObj@@2JA ; EtherObj::UpListPointer
	lea	eax, DWORD PTR [edx+ecx-1114108]
	mov	DWORD PTR _pktStatLocation$[ebp], eax
; Line 270
	mov	ecx, DWORD PTR _pktStatLocation$[ebp]
	mov	DWORD PTR [ecx], 0
; Line 272
	mov	edx, DWORD PTR ?ReceiveOutPtr@EtherObj@@2JA ; EtherObj::ReceiveOutPtr
	add	edx, 1
	mov	DWORD PTR ?ReceiveOutPtr@EtherObj@@2JA, edx ; EtherObj::ReceiveOutPtr
; Line 274
	mov	eax, DWORD PTR ?ReceiveOutPtr@EtherObj@@2JA ; EtherObj::ReceiveOutPtr
	cmp	eax, DWORD PTR ?RcvLstSize@EtherObj@@2JA ; EtherObj::RcvLstSize
	jne	SHORT $L1180
; Line 276
	mov	DWORD PTR ?ReceiveOutPtr@EtherObj@@2JA, 0 ; EtherObj::ReceiveOutPtr
$L1180:
; Line 279
	xor	eax, eax
; Line 280
	mov	esp, ebp
	pop	ebp
	ret	0
?discardPacket@EtherObj@@QAEHXZ ENDP			; EtherObj::discardPacket
_TEXT	ENDS
PUBLIC	?readPacket@EtherObj@@QAEHJPAJ00@Z		; EtherObj::readPacket
_TEXT	SEGMENT
_pktno$ = 8
_status$ = 12
_pktaddress$ = 16
_pktlength$ = 20
_this$ = -32
_pktlen$ = -16
_retcode$ = -4
_a1$ = -24
_a2$ = -28
_s1$ = -8
_p1$ = -12
_p2$ = -20
?readPacket@EtherObj@@QAEHJPAJ00@Z PROC NEAR		; EtherObj::readPacket
; Line 291
	push	ebp
	mov	ebp, esp
	sub	esp, 32					; 00000020H
	mov	DWORD PTR _this$[ebp], ecx
; Line 292
	mov	DWORD PTR _pktlen$[ebp], 0
; Line 299
	lea	eax, DWORD PTR _a1$[ebp]
	mov	DWORD PTR _p1$[ebp], eax
; Line 300
	lea	ecx, DWORD PTR _a2$[ebp]
	mov	DWORD PTR _p2$[ebp], ecx
; Line 304
	mov	edx, DWORD PTR _pktno$[ebp]
	shl	edx, 5
	mov	eax, DWORD PTR ?UpListPointer@EtherObj@@2JA ; EtherObj::UpListPointer
	lea	ecx, DWORD PTR [eax+edx-1114108]
	mov	DWORD PTR _p1$[ebp], ecx
; Line 305
	mov	edx, DWORD PTR _pktno$[ebp]
	shl	edx, 5
	mov	eax, DWORD PTR ?UpListPointer@EtherObj@@2JA ; EtherObj::UpListPointer
	lea	ecx, DWORD PTR [eax+edx-1114104]
	mov	DWORD PTR _p2$[ebp], ecx
; Line 307
	mov	edx, DWORD PTR _status$[ebp]
	mov	eax, DWORD PTR _p1$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR [edx], ecx
; Line 308
	mov	edx, DWORD PTR _pktaddress$[ebp]
	mov	eax, DWORD PTR _p2$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR [edx], ecx
; Line 311
	mov	edx, DWORD PTR _p1$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR _pktlen$[ebp], eax
; Line 312
	mov	ecx, DWORD PTR _pktlen$[ebp]
	and	ecx, 8191				; 00001fffH
	mov	DWORD PTR _pktlen$[ebp], ecx
; Line 313
	mov	edx, DWORD PTR _pktlength$[ebp]
	mov	eax, DWORD PTR _pktlen$[ebp]
	mov	DWORD PTR [edx], eax
; Line 315
	mov	ecx, DWORD PTR _p1$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR _s1$[ebp], edx
; Line 316
	mov	eax, DWORD PTR _s1$[ebp]
	and	eax, 32768				; 00008000H
	mov	DWORD PTR _s1$[ebp], eax
; Line 317
	cmp	DWORD PTR _s1$[ebp], 0
	jne	SHORT $L1197
; Line 319
	mov	DWORD PTR _retcode$[ebp], -1
; Line 321
	jmp	SHORT $L1198
$L1197:
; Line 323
	mov	DWORD PTR _retcode$[ebp], 0
$L1198:
; Line 327
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 328
	mov	esp, ebp
	pop	ebp
	ret	16					; 00000010H
?readPacket@EtherObj@@QAEHJPAJ00@Z ENDP			; EtherObj::readPacket
_TEXT	ENDS
PUBLIC	?ReadData@EtherObj@@QAEHPAPADPAHPAD2@Z		; EtherObj::ReadData
_TEXT	SEGMENT
_Data$ = 8
_Type$ = 12
_ipaddr$ = 16
_macaddr$ = 20
_this$ = -32
_PROTOCOL_TYPE$ = -4
_pktlen$ = -16
_p1$ = -12
_p3$ = -20
_a1$ = -24
_a3$ = -28
_s1$ = -8
?ReadData@EtherObj@@QAEHPAPADPAHPAD2@Z PROC NEAR	; EtherObj::ReadData
; Line 342
	push	ebp
	mov	ebp, esp
	sub	esp, 32					; 00000020H
	mov	DWORD PTR _this$[ebp], ecx
; Line 344
	mov	DWORD PTR _PROTOCOL_TYPE$[ebp], 0
; Line 345
	mov	DWORD PTR _pktlen$[ebp], 0
; Line 351
	lea	eax, DWORD PTR _a1$[ebp]
	mov	DWORD PTR _p1$[ebp], eax
; Line 352
	lea	ecx, DWORD PTR _a3$[ebp]
	mov	DWORD PTR _p3$[ebp], ecx
; Line 357
	mov	edx, DWORD PTR ?ReceiveOutPtr@EtherObj@@2JA ; EtherObj::ReceiveOutPtr
	shl	edx, 5
	mov	eax, DWORD PTR ?UpListPointer@EtherObj@@2JA ; EtherObj::UpListPointer
	lea	ecx, DWORD PTR [eax+edx-1114108]
	mov	DWORD PTR _p1$[ebp], ecx
; Line 358
	mov	edx, DWORD PTR ?ReceiveOutPtr@EtherObj@@2JA ; EtherObj::ReceiveOutPtr
	shl	edx, 5
	mov	eax, DWORD PTR ?UpListPointer@EtherObj@@2JA ; EtherObj::UpListPointer
	lea	ecx, DWORD PTR [eax+edx-1114104]
	mov	DWORD PTR _p3$[ebp], ecx
; Line 360
	mov	edx, DWORD PTR _p3$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR _s1$[ebp], eax
; Line 362
	mov	ecx, DWORD PTR _s1$[ebp]
	sub	ecx, 1114112				; 00110000H
	mov	edx, DWORD PTR _Data$[ebp]
	mov	DWORD PTR [edx], ecx
; Line 366
	mov	eax, DWORD PTR _p1$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _pktlen$[ebp], ecx
; Line 367
	mov	edx, DWORD PTR _pktlen$[ebp]
	and	edx, 8191				; 00001fffH
	mov	DWORD PTR _pktlen$[ebp], edx
; Line 370
	mov	eax, DWORD PTR _p1$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _s1$[ebp], ecx
; Line 371
	mov	edx, DWORD PTR _s1$[ebp]
	and	edx, 32768				; 00008000H
	mov	DWORD PTR _s1$[ebp], edx
; Line 372
	cmp	DWORD PTR _s1$[ebp], 0
	jne	SHORT $L1216
; Line 375
	or	eax, -1
	jmp	$L1205
$L1216:
; Line 381
	mov	eax, DWORD PTR _Data$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	edx, DWORD PTR _macaddr$[ebp]
	mov	al, BYTE PTR [ecx+6]
	mov	BYTE PTR [edx], al
; Line 382
	mov	ecx, DWORD PTR _Data$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	eax, DWORD PTR _macaddr$[ebp]
	mov	cl, BYTE PTR [edx+7]
	mov	BYTE PTR [eax+1], cl
; Line 383
	mov	edx, DWORD PTR _Data$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR _macaddr$[ebp]
	mov	dl, BYTE PTR [eax+8]
	mov	BYTE PTR [ecx+2], dl
; Line 384
	mov	eax, DWORD PTR _Data$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	edx, DWORD PTR _macaddr$[ebp]
	mov	al, BYTE PTR [ecx+9]
	mov	BYTE PTR [edx+3], al
; Line 385
	mov	ecx, DWORD PTR _Data$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	eax, DWORD PTR _macaddr$[ebp]
	mov	cl, BYTE PTR [edx+10]
	mov	BYTE PTR [eax+4], cl
; Line 386
	mov	edx, DWORD PTR _Data$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR _macaddr$[ebp]
	mov	dl, BYTE PTR [eax+11]
	mov	BYTE PTR [ecx+5], dl
; Line 400
	mov	eax, DWORD PTR _Data$[ebp]
	mov	ecx, DWORD PTR [eax]
	movsx	edx, BYTE PTR [ecx+12]
	and	edx, 255				; 000000ffH
	mov	DWORD PTR _PROTOCOL_TYPE$[ebp], edx
; Line 401
	mov	eax, DWORD PTR _PROTOCOL_TYPE$[ebp]
	shl	eax, 8
	mov	DWORD PTR _PROTOCOL_TYPE$[ebp], eax
; Line 402
	mov	ecx, DWORD PTR _Data$[ebp]
	mov	edx, DWORD PTR [ecx]
	movsx	eax, BYTE PTR [edx+13]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _PROTOCOL_TYPE$[ebp]
	or	ecx, eax
	mov	DWORD PTR _PROTOCOL_TYPE$[ebp], ecx
; Line 403
	mov	edx, DWORD PTR _Type$[ebp]
	mov	eax, DWORD PTR _PROTOCOL_TYPE$[ebp]
	mov	DWORD PTR [edx], eax
; Line 405
	mov	ecx, DWORD PTR _Type$[ebp]
	cmp	DWORD PTR [ecx], 2054			; 00000806H
	jne	SHORT $L1218
; Line 408
	mov	edx, DWORD PTR _Data$[ebp]
	mov	eax, DWORD PTR [edx]
	movsx	ecx, BYTE PTR [eax+38]
	mov	edx, DWORD PTR _ipaddr$[ebp]
	movsx	eax, BYTE PTR [edx]
	cmp	ecx, eax
	jne	SHORT $L1220
	mov	ecx, DWORD PTR _Data$[ebp]
	mov	edx, DWORD PTR [ecx]
	movsx	eax, BYTE PTR [edx+39]
	mov	ecx, DWORD PTR _ipaddr$[ebp]
	movsx	edx, BYTE PTR [ecx+1]
	cmp	eax, edx
	jne	SHORT $L1220
	mov	eax, DWORD PTR _Data$[ebp]
	mov	ecx, DWORD PTR [eax]
	movsx	edx, BYTE PTR [ecx+40]
	mov	eax, DWORD PTR _ipaddr$[ebp]
	movsx	ecx, BYTE PTR [eax+2]
	cmp	edx, ecx
	jne	SHORT $L1220
	mov	edx, DWORD PTR _Data$[ebp]
	mov	eax, DWORD PTR [edx]
	movsx	ecx, BYTE PTR [eax+41]
	mov	edx, DWORD PTR _ipaddr$[ebp]
	movsx	eax, BYTE PTR [edx+3]
	cmp	ecx, eax
	je	SHORT $L1219
$L1220:
; Line 412
	mov	ecx, DWORD PTR _this$[ebp]
	call	?discardPacket@EtherObj@@QAEHXZ		; EtherObj::discardPacket
; Line 413
	mov	eax, -2					; fffffffeH
	jmp	$L1205
$L1219:
; Line 416
	jmp	SHORT $L1225
$L1218:
	mov	ecx, DWORD PTR _Type$[ebp]
	cmp	DWORD PTR [ecx], 2048			; 00000800H
	jne	SHORT $L1222
; Line 419
	mov	edx, DWORD PTR _Data$[ebp]
	mov	eax, DWORD PTR [edx]
	movsx	ecx, BYTE PTR [eax+30]
	mov	edx, DWORD PTR _ipaddr$[ebp]
	movsx	eax, BYTE PTR [edx]
	cmp	ecx, eax
	jne	SHORT $L1224
	mov	ecx, DWORD PTR _Data$[ebp]
	mov	edx, DWORD PTR [ecx]
	movsx	eax, BYTE PTR [edx+31]
	mov	ecx, DWORD PTR _ipaddr$[ebp]
	movsx	edx, BYTE PTR [ecx+1]
	cmp	eax, edx
	jne	SHORT $L1224
	mov	eax, DWORD PTR _Data$[ebp]
	mov	ecx, DWORD PTR [eax]
	movsx	edx, BYTE PTR [ecx+32]
	mov	eax, DWORD PTR _ipaddr$[ebp]
	movsx	ecx, BYTE PTR [eax+2]
	cmp	edx, ecx
	jne	SHORT $L1224
	mov	edx, DWORD PTR _Data$[ebp]
	mov	eax, DWORD PTR [edx]
	movsx	ecx, BYTE PTR [eax+33]
	mov	edx, DWORD PTR _ipaddr$[ebp]
	movsx	eax, BYTE PTR [edx+3]
	cmp	ecx, eax
	je	SHORT $L1223
$L1224:
; Line 423
	mov	ecx, DWORD PTR _this$[ebp]
	call	?discardPacket@EtherObj@@QAEHXZ		; EtherObj::discardPacket
; Line 424
	mov	eax, -2					; fffffffeH
	jmp	SHORT $L1205
$L1223:
; Line 427
	jmp	SHORT $L1225
$L1222:
; Line 430
	mov	ecx, DWORD PTR _this$[ebp]
	call	?discardPacket@EtherObj@@QAEHXZ		; EtherObj::discardPacket
; Line 431
	mov	eax, -3					; fffffffdH
	jmp	SHORT $L1205
$L1225:
; Line 434
	mov	ecx, DWORD PTR _Data$[ebp]
	mov	edx, DWORD PTR [ecx]
	add	edx, 14					; 0000000eH
	mov	eax, DWORD PTR _Data$[ebp]
	mov	DWORD PTR [eax], edx
; Line 435
	mov	ecx, DWORD PTR _pktlen$[ebp]
	sub	ecx, 14					; 0000000eH
	mov	DWORD PTR _pktlen$[ebp], ecx
; Line 438
	mov	edx, DWORD PTR ?NoofPackets@EtherObj@@2JA ; EtherObj::NoofPackets
	add	edx, 1
	mov	DWORD PTR ?NoofPackets@EtherObj@@2JA, edx ; EtherObj::NoofPackets
; Line 440
	mov	eax, DWORD PTR _pktlen$[ebp]
$L1205:
; Line 441
	mov	esp, ebp
	pop	ebp
	ret	16					; 00000010H
?ReadData@EtherObj@@QAEHPAPADPAHPAD2@Z ENDP		; EtherObj::ReadData
_TEXT	ENDS
PUBLIC	?Init@EtherObj@@QAEJXZ				; EtherObj::Init
EXTRN	?AOAPrintText@AOAProtected@@QAEXPADH@Z:NEAR	; AOAProtected::AOAPrintText
EXTRN	_cinitEther:NEAR
_DATA	SEGMENT
$SG1229	DB	'EthernetCard Init() is Called', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?Init@EtherObj@@QAEJXZ PROC NEAR			; EtherObj::Init
; Line 447
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 448
	mov	DWORD PTR ?SendInPtr@EtherObj@@2JA, 1	; EtherObj::SendInPtr
; Line 449
	mov	DWORD PTR ?SendOutPtr@EtherObj@@2JA, 1	; EtherObj::SendOutPtr
; Line 450
	mov	DWORD PTR ?ReceiveInPtr@EtherObj@@2JA, 0 ; EtherObj::ReceiveInPtr
; Line 451
	mov	DWORD PTR ?ReceiveOutPtr@EtherObj@@2JA, 0 ; EtherObj::ReceiveOutPtr
; Line 452
	mov	DWORD PTR ?NoofPackets@EtherObj@@2JA, 0	; EtherObj::NoofPackets
; Line 453
	push	3520					; 00000dc0H
	push	OFFSET FLAT:$SG1229
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 454
	push	OFFSET FLAT:?mac@EtherObj@@2PADA	; EtherObj::mac
	mov	ax, WORD PTR ?IO_BASE@EtherObj@@0FA	; EtherObj::IO_BASE
	push	eax
	call	_cinitEther
	add	esp, 8
; Line 458
	mov	esp, ebp
	pop	ebp
	ret	0
?Init@EtherObj@@QAEJXZ ENDP				; EtherObj::Init
_TEXT	ENDS
PUBLIC	?testArpIP@EtherObj@@QAEHPAD@Z			; EtherObj::testArpIP
_TEXT	SEGMENT
_buff$ = 8
_this$ = -8
_type$ = -4
?testArpIP@EtherObj@@QAEHPAD@Z PROC NEAR		; EtherObj::testArpIP
; Line 470
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 471
	mov	eax, DWORD PTR _buff$[ebp]
	movsx	ecx, BYTE PTR [eax+12]
	shl	ecx, 8
	and	ecx, 65280				; 0000ff00H
	mov	edx, DWORD PTR _buff$[ebp]
	movsx	eax, BYTE PTR [edx+13]
	and	eax, 255				; 000000ffH
	or	ecx, eax
	mov	DWORD PTR _type$[ebp], ecx
; Line 472
	cmp	DWORD PTR _type$[ebp], 2054		; 00000806H
	jne	SHORT $L1236
; Line 474
	mov	eax, 1
	jmp	SHORT $L1239
$L1236:
; Line 476
	cmp	DWORD PTR _type$[ebp], 2048		; 00000800H
	jne	SHORT $L1238
; Line 478
	xor	eax, eax
	jmp	SHORT $L1239
$L1238:
; Line 482
	mov	eax, 2
$L1239:
; Line 484
	mov	esp, ebp
	pop	ebp
	ret	4
?testArpIP@EtherObj@@QAEHPAD@Z ENDP			; EtherObj::testArpIP
_TEXT	ENDS
PUBLIC	?Close@EtherObj@@QAEXXZ				; EtherObj::Close
EXTRN	_closeasm:NEAR
_TEXT	SEGMENT
_this$ = -12
_io$ = -8
?Close@EtherObj@@QAEXXZ PROC NEAR			; EtherObj::Close
; Line 488
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 489
	mov	ax, WORD PTR ?IO_BASE@EtherObj@@0FA	; EtherObj::IO_BASE
	push	eax
	call	_closeasm
	add	esp, 4
; Line 490
	lea	ecx, DWORD PTR _io$[ebp]
	call	??0AOAProtected@@QAE@XZ			; AOAProtected::AOAProtected
; Line 492
	mov	esp, ebp
	pop	ebp
	ret	0
?Close@EtherObj@@QAEXXZ ENDP				; EtherObj::Close
_TEXT	ENDS
PUBLIC	?getMAC@EtherObj@@QAEXPAD@Z			; EtherObj::getMAC
_TEXT	SEGMENT
_dMAC$ = 8
_this$ = -8
_i$ = -4
?getMAC@EtherObj@@QAEXPAD@Z PROC NEAR			; EtherObj::getMAC
; Line 496
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 497
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1249
$L1250:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L1249:
	cmp	DWORD PTR _i$[ebp], 6
	jge	SHORT $L1251
; Line 498
	mov	ecx, DWORD PTR _dMAC$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	mov	al, BYTE PTR ?mac@EtherObj@@2PADA[edx]
	mov	BYTE PTR [ecx], al
	jmp	SHORT $L1250
$L1251:
; Line 499
	mov	esp, ebp
	pop	ebp
	ret	4
?getMAC@EtherObj@@QAEXPAD@Z ENDP			; EtherObj::getMAC
_TEXT	ENDS
PUBLIC	?ARPInsertPkt@EtherObj@@QAEHPADHH00HH@Z		; EtherObj::ARPInsertPkt
PUBLIC	?sndCall@EtherObj@@QAEHXZ			; EtherObj::sndCall
_TEXT	SEGMENT
_PACK$ = 8
_PACK_Size$ = 12
_PROTOCOL$ = 16
_Sender_HAdd$ = 20
_Target_HAdd$ = 24
_sendtype$ = 28
_this$ = -72
_BUFFER$ = -16
_temp$ = -44
_i$ = -48
_retcode$ = -4
_stype$ = -64
_x$ = -40
_p1$ = -36
_p3$ = -52
_c3$ = -28
_c5$ = -32
_FRAME_SIZE$ = -60
_k$1293 = -68
?ARPInsertPkt@EtherObj@@QAEHPADHH00HH@Z PROC NEAR	; EtherObj::ARPInsertPkt
; Line 512
	push	ebp
	mov	ebp, esp
	sub	esp, 72					; 00000048H
	mov	DWORD PTR _this$[ebp], ecx
; Line 517
	mov	DWORD PTR _temp$[ebp], 0
; Line 520
	mov	DWORD PTR _i$[ebp], 0
; Line 521
	mov	DWORD PTR _retcode$[ebp], 0
; Line 522
	mov	DWORD PTR _stype$[ebp], 0
; Line 524
	mov	DWORD PTR _x$[ebp], 0
; Line 529
	lea	eax, DWORD PTR _c3$[ebp]
	mov	DWORD PTR _p1$[ebp], eax
; Line 530
	lea	ecx, DWORD PTR _c5$[ebp]
	mov	DWORD PTR _p3$[ebp], ecx
; Line 532
	mov	edx, DWORD PTR ?SendInPtr@EtherObj@@2JA	; EtherObj::SendInPtr
	shl	edx, 5
	mov	eax, DWORD PTR ?DownListPointer@EtherObj@@2JA ; EtherObj::DownListPointer
	lea	ecx, DWORD PTR [eax+edx-1114104]
	mov	DWORD PTR _x$[ebp], ecx
; Line 537
	mov	edx, DWORD PTR _x$[ebp]
	add	edx, 1114104				; 0010fff8H
	mov	eax, DWORD PTR ?SndLstSize@EtherObj@@2JA ; EtherObj::SndLstSize
	sub	eax, 1
	shl	eax, 5
	mov	ecx, DWORD PTR ?DownListPointer@EtherObj@@2JA ; EtherObj::DownListPointer
	add	ecx, eax
	cmp	edx, ecx
	jle	SHORT $L1277
; Line 539
	mov	eax, -8					; fffffff8H
	jmp	$L1261
$L1277:
; Line 542
	mov	edx, DWORD PTR _x$[ebp]
	mov	DWORD PTR _p1$[ebp], edx
; Line 545
	mov	eax, DWORD PTR ?SndLstSize@EtherObj@@2JA ; EtherObj::SndLstSize
	imul	eax, DWORD PTR ?PacketSize@EtherObj@@2JA ; EtherObj::PacketSize
	mov	ecx, DWORD PTR ?DownListDataPointer@EtherObj@@2JA ; EtherObj::DownListDataPointer
	add	ecx, eax
	mov	edx, DWORD PTR _p1$[ebp]
	cmp	DWORD PTR [edx], ecx
	jl	SHORT $L1279
; Line 547
	mov	eax, -9					; fffffff7H
	jmp	$L1261
$L1279:
; Line 550
	mov	eax, DWORD PTR _p1$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _BUFFER$[ebp], ecx
; Line 552
	mov	edx, DWORD PTR _BUFFER$[ebp]
	sub	edx, 1114112				; 00110000H
	mov	DWORD PTR _BUFFER$[ebp], edx
; Line 554
	mov	eax, DWORD PTR ?SendInPtr@EtherObj@@2JA	; EtherObj::SendInPtr
	add	eax, 1
	mov	DWORD PTR ?SendInPtr@EtherObj@@2JA, eax	; EtherObj::SendInPtr
; Line 556
	mov	ecx, DWORD PTR ?SendInPtr@EtherObj@@2JA	; EtherObj::SendInPtr
	cmp	ecx, DWORD PTR ?SndLstSize@EtherObj@@2JA ; EtherObj::SndLstSize
	jne	SHORT $L1281
; Line 558
	mov	DWORD PTR ?SendInPtr@EtherObj@@2JA, 0	; EtherObj::SendInPtr
$L1281:
; Line 561
	mov	edx, DWORD PTR _x$[ebp]
	add	edx, 4
	mov	DWORD PTR _x$[ebp], edx
; Line 562
	mov	eax, DWORD PTR _x$[ebp]
	mov	DWORD PTR _p1$[ebp], eax
; Line 563
	mov	ecx, DWORD PTR _p1$[ebp]
	mov	DWORD PTR [ecx], -2147483588		; 8000003cH
; Line 567
	mov	edx, DWORD PTR _x$[ebp]
	add	edx, 12					; 0000000cH
	mov	DWORD PTR _x$[ebp], edx
; Line 568
	mov	eax, DWORD PTR _x$[ebp]
	mov	DWORD PTR _p3$[ebp], eax
; Line 569
	mov	DWORD PTR _stype$[ebp], 0
; Line 570
	mov	ecx, DWORD PTR _sendtype$[ebp]
	shl	ecx, 8
	and	ecx, 65280				; 0000ff00H
	mov	DWORD PTR _stype$[ebp], ecx
; Line 571
	mov	edx, DWORD PTR _p3$[ebp]
	mov	eax, DWORD PTR _stype$[ebp]
	mov	DWORD PTR [edx], eax
; Line 574
	mov	ecx, DWORD PTR _x$[ebp]
	add	ecx, 4
	mov	DWORD PTR _x$[ebp], ecx
; Line 575
	mov	edx, DWORD PTR _x$[ebp]
	mov	DWORD PTR _p1$[ebp], edx
; Line 576
	mov	eax, DWORD PTR _p1$[ebp]
	mov	DWORD PTR [eax], 1
; Line 578
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1285
$L1286:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L1285:
	cmp	DWORD PTR _i$[ebp], 6
	jge	SHORT $L1287
; Line 580
	mov	edx, DWORD PTR _BUFFER$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _Target_HAdd$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	mov	cl, BYTE PTR [eax]
	mov	BYTE PTR [edx], cl
; Line 581
	mov	edx, DWORD PTR _BUFFER$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _Sender_HAdd$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	mov	cl, BYTE PTR [eax]
	mov	BYTE PTR [edx+6], cl
; Line 582
	jmp	SHORT $L1286
$L1287:
; Line 583
	mov	edx, DWORD PTR _PROTOCOL$[ebp]
	sar	edx, 8
	and	edx, 255				; 000000ffH
	mov	eax, DWORD PTR _BUFFER$[ebp]
	mov	BYTE PTR [eax+12], dl
; Line 584
	mov	ecx, DWORD PTR _PROTOCOL$[ebp]
	and	ecx, 255				; 000000ffH
	mov	edx, DWORD PTR _BUFFER$[ebp]
	mov	BYTE PTR [edx+13], cl
; Line 586
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1288
$L1289:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L1288:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _PACK_Size$[ebp]
	jge	SHORT $L1290
; Line 588
	mov	edx, DWORD PTR _BUFFER$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _PACK$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	mov	cl, BYTE PTR [eax]
	mov	BYTE PTR [edx+14], cl
; Line 589
	jmp	SHORT $L1289
$L1290:
; Line 591
	mov	edx, DWORD PTR _PACK_Size$[ebp]
	add	edx, 14					; 0000000eH
	mov	DWORD PTR _FRAME_SIZE$[ebp], edx
; Line 593
	cmp	DWORD PTR _FRAME_SIZE$[ebp], 60		; 0000003cH
	jge	SHORT $L1292
; Line 595
	mov	eax, DWORD PTR _PACK_Size$[ebp]
	add	eax, 14					; 0000000eH
	mov	ecx, 60					; 0000003cH
	sub	ecx, eax
	mov	DWORD PTR _k$1293[ebp], ecx
; Line 596
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1294
$L1295:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L1294:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _k$1293[ebp]
	jge	SHORT $L1296
; Line 598
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _PACK_Size$[ebp]
	lea	eax, DWORD PTR [edx+ecx+14]
	mov	ecx, DWORD PTR _BUFFER$[ebp]
	mov	BYTE PTR [ecx+eax], 0
; Line 599
	jmp	SHORT $L1295
$L1296:
; Line 600
	mov	DWORD PTR _FRAME_SIZE$[ebp], 60		; 0000003cH
$L1292:
; Line 603
	mov	ecx, DWORD PTR _this$[ebp]
	call	?sndCall@EtherObj@@QAEHXZ		; EtherObj::sndCall
	mov	DWORD PTR _retcode$[ebp], eax
; Line 605
	xor	eax, eax
$L1261:
; Line 606
	mov	esp, ebp
	pop	ebp
	ret	28					; 0000001cH
?ARPInsertPkt@EtherObj@@QAEHPADHH00HH@Z ENDP		; EtherObj::ARPInsertPkt
_TEXT	ENDS
PUBLIC	?SendPacket@EtherObj@@QAEHJH@Z			; EtherObj::SendPacket
EXTRN	_csend:NEAR
_TEXT	SEGMENT
_delay$ = 8
_this$ = -28
_addr$ = -24
_i$ = -20
_x$ = -16
_p1$ = -12
_c3$ = -8
_retcode$ = -4
?SendPacket@EtherObj@@QAEHJH@Z PROC NEAR		; EtherObj::SendPacket
; Line 612
	push	ebp
	mov	ebp, esp
	sub	esp, 28					; 0000001cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 614
	mov	DWORD PTR _i$[ebp], 0
	mov	DWORD PTR _x$[ebp], 0
; Line 617
	lea	eax, DWORD PTR _c3$[ebp]
	mov	DWORD PTR _p1$[ebp], eax
; Line 620
	mov	ecx, DWORD PTR ?SendOutPtr@EtherObj@@2JA ; EtherObj::SendOutPtr
	shl	ecx, 5
	mov	edx, DWORD PTR ?DownListPointer@EtherObj@@2JA ; EtherObj::DownListPointer
	add	edx, ecx
	mov	DWORD PTR _addr$[ebp], edx
; Line 621
	mov	eax, DWORD PTR _addr$[ebp]
	sub	eax, 1114084				; 0010ffe4H
	mov	DWORD PTR _x$[ebp], eax
; Line 622
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR _p1$[ebp], ecx
; Line 625
	mov	edx, DWORD PTR _delay$[ebp]
	push	edx
	mov	eax, DWORD PTR _addr$[ebp]
	push	eax
	mov	cx, WORD PTR ?IO_BASE@EtherObj@@0FA	; EtherObj::IO_BASE
	push	ecx
	call	_csend
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _retcode$[ebp], eax
; Line 627
	mov	edx, DWORD PTR _p1$[ebp]
	mov	DWORD PTR [edx], 0
; Line 629
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 630
	mov	esp, ebp
	pop	ebp
	ret	8
?SendPacket@EtherObj@@QAEHJH@Z ENDP			; EtherObj::SendPacket
_TEXT	ENDS
PUBLIC	?SendPacketN@EtherObj@@QAEHH@Z			; EtherObj::SendPacketN
PUBLIC	?IncSendPtr@EtherObj@@QAEHH@Z			; EtherObj::IncSendPtr
EXTRN	_csendN:NEAR
_DATA	SEGMENT
	ORG $+2
$SG1328	DB	'EtherObj:SendPacketN() Count is zero', 00H
_DATA	ENDS
_TEXT	SEGMENT
_count$ = 8
_this$ = -32
_addr$ = -28
_i$ = -24
_x$ = -16
_p1$ = -12
_c3$ = -8
_retcode$ = -4
_tempsendoutptr$ = -20
?SendPacketN@EtherObj@@QAEHH@Z PROC NEAR		; EtherObj::SendPacketN
; Line 636
	push	ebp
	mov	ebp, esp
	sub	esp, 32					; 00000020H
	mov	DWORD PTR _this$[ebp], ecx
; Line 638
	mov	DWORD PTR _i$[ebp], 0
	mov	DWORD PTR _x$[ebp], 0
; Line 641
	lea	eax, DWORD PTR _c3$[ebp]
	mov	DWORD PTR _p1$[ebp], eax
; Line 643
	mov	DWORD PTR _tempsendoutptr$[ebp], 0
; Line 645
	cmp	DWORD PTR _count$[ebp], 0
	je	$L1320
; Line 647
	mov	ecx, DWORD PTR ?SendOutPtr@EtherObj@@2JA ; EtherObj::SendOutPtr
	mov	DWORD PTR _tempsendoutptr$[ebp], ecx
; Line 649
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1321
$L1322:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L1321:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _count$[ebp]
	jge	SHORT $L1323
; Line 651
	mov	ecx, DWORD PTR ?SendOutPtr@EtherObj@@2JA ; EtherObj::SendOutPtr
	shl	ecx, 5
	mov	edx, DWORD PTR ?DownListPointer@EtherObj@@2JA ; EtherObj::DownListPointer
	add	edx, ecx
	mov	DWORD PTR _addr$[ebp], edx
; Line 652
	mov	eax, DWORD PTR _addr$[ebp]
	sub	eax, 1114084				; 0010ffe4H
	mov	DWORD PTR _x$[ebp], eax
; Line 653
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR _p1$[ebp], ecx
; Line 654
	mov	edx, DWORD PTR _p1$[ebp]
	mov	DWORD PTR [edx], 0
; Line 656
	mov	eax, DWORD PTR _count$[ebp]
	sub	eax, 1
	cmp	DWORD PTR _i$[ebp], eax
	jne	SHORT $L1325
; Line 658
	mov	ecx, DWORD PTR _addr$[ebp]
	sub	ecx, 1114112				; 00110000H
	mov	DWORD PTR _x$[ebp], ecx
; Line 659
	mov	edx, DWORD PTR _x$[ebp]
	mov	DWORD PTR _p1$[ebp], edx
; Line 660
	mov	eax, DWORD PTR _p1$[ebp]
	mov	DWORD PTR [eax], 0
$L1325:
; Line 662
	push	0
	mov	ecx, DWORD PTR _this$[ebp]
	call	?IncSendPtr@EtherObj@@QAEHH@Z		; EtherObj::IncSendPtr
; Line 663
	jmp	SHORT $L1322
$L1323:
; Line 665
	mov	ecx, DWORD PTR _tempsendoutptr$[ebp]
	shl	ecx, 5
	mov	edx, DWORD PTR ?DownListPointer@EtherObj@@2JA ; EtherObj::DownListPointer
	add	edx, ecx
	mov	DWORD PTR _addr$[ebp], edx
; Line 667
	mov	eax, DWORD PTR _count$[ebp]
	push	eax
	mov	ecx, DWORD PTR _addr$[ebp]
	push	ecx
	mov	dx, WORD PTR ?IO_BASE@EtherObj@@0FA	; EtherObj::IO_BASE
	push	edx
	call	_csendN
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _retcode$[ebp], eax
; Line 669
	jmp	SHORT $L1327
$L1320:
; Line 670
	push	3840					; 00000f00H
	push	OFFSET FLAT:$SG1328
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
$L1327:
; Line 672
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 673
	mov	esp, ebp
	pop	ebp
	ret	4
?SendPacketN@EtherObj@@QAEHH@Z ENDP			; EtherObj::SendPacketN
_TEXT	ENDS
PUBLIC	?getDPDStatus@EtherObj@@QAEHH@Z			; EtherObj::getDPDStatus
_TEXT	SEGMENT
_dpdcount$ = 8
_this$ = -24
_addr$ = -20
_x$ = -16
_p1$ = -12
_c3$ = -8
_retcode$ = -4
?getDPDStatus@EtherObj@@QAEHH@Z PROC NEAR		; EtherObj::getDPDStatus
; Line 682
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	mov	DWORD PTR _this$[ebp], ecx
; Line 684
	mov	DWORD PTR _x$[ebp], 0
; Line 687
	lea	eax, DWORD PTR _c3$[ebp]
	mov	DWORD PTR _p1$[ebp], eax
; Line 690
	cmp	DWORD PTR _dpdcount$[ebp], 0
	jne	SHORT $L1338
; Line 691
	mov	ecx, DWORD PTR _dpdcount$[ebp]
	shl	ecx, 5
	mov	edx, DWORD PTR ?DownListPointer@EtherObj@@2JA ; EtherObj::DownListPointer
	add	edx, ecx
	mov	DWORD PTR _addr$[ebp], edx
; Line 692
	jmp	SHORT $L1339
$L1338:
; Line 693
	mov	eax, DWORD PTR _dpdcount$[ebp]
	sub	eax, 1
	shl	eax, 5
	mov	ecx, DWORD PTR ?DownListPointer@EtherObj@@2JA ; EtherObj::DownListPointer
	add	ecx, eax
	mov	DWORD PTR _addr$[ebp], ecx
$L1339:
; Line 695
	mov	edx, DWORD PTR _addr$[ebp]
	sub	edx, 1114088				; 0010ffe8H
	mov	DWORD PTR _x$[ebp], edx
; Line 696
	mov	eax, DWORD PTR _x$[ebp]
	mov	DWORD PTR _p1$[ebp], eax
; Line 698
	mov	ecx, DWORD PTR _p1$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR _retcode$[ebp], edx
; Line 700
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 701
	mov	esp, ebp
	pop	ebp
	ret	4
?getDPDStatus@EtherObj@@QAEHH@Z ENDP			; EtherObj::getDPDStatus
_this$ = -4
?IncSendPtr@EtherObj@@QAEHH@Z PROC NEAR			; EtherObj::IncSendPtr
; Line 707
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 708
	mov	eax, DWORD PTR ?SndLstSize@EtherObj@@2JA ; EtherObj::SndLstSize
	sub	eax, 1
	cmp	DWORD PTR ?SendOutPtr@EtherObj@@2JA, eax ; EtherObj::SendOutPtr
	jne	SHORT $L1345
; Line 709
	mov	DWORD PTR ?SendOutPtr@EtherObj@@2JA, 0	; EtherObj::SendOutPtr
; Line 710
	jmp	SHORT $L1346
$L1345:
; Line 711
	mov	ecx, DWORD PTR ?SendOutPtr@EtherObj@@2JA ; EtherObj::SendOutPtr
	add	ecx, 1
	mov	DWORD PTR ?SendOutPtr@EtherObj@@2JA, ecx ; EtherObj::SendOutPtr
$L1346:
; Line 713
	xor	eax, eax
; Line 714
	mov	esp, ebp
	pop	ebp
	ret	4
?IncSendPtr@EtherObj@@QAEHH@Z ENDP			; EtherObj::IncSendPtr
_TEXT	ENDS
PUBLIC	?full@EtherObj@@QAEHXZ				; EtherObj::full
_TEXT	SEGMENT
_this$ = -8
_retcode$ = -4
?full@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::full
; Line 719
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 720
	mov	DWORD PTR _retcode$[ebp], 0
; Line 722
	mov	eax, DWORD PTR ?SendInPtr@EtherObj@@2JA	; EtherObj::SendInPtr
	add	eax, 1
	cdq
	idiv	DWORD PTR ?SndLstSize@EtherObj@@2JA	; EtherObj::SndLstSize
	cmp	edx, DWORD PTR ?SendOutPtr@EtherObj@@2JA ; EtherObj::SendOutPtr
	jne	SHORT $L1351
; Line 723
	mov	DWORD PTR _retcode$[ebp], 1
; Line 724
	jmp	SHORT $L1352
$L1351:
	mov	DWORD PTR _retcode$[ebp], 0
$L1352:
; Line 726
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 727
	mov	esp, ebp
	pop	ebp
	ret	0
?full@EtherObj@@QAEHXZ ENDP				; EtherObj::full
_TEXT	ENDS
PUBLIC	?CheckSendFlag@EtherObj@@QAEHXZ			; EtherObj::CheckSendFlag
_TEXT	SEGMENT
_this$ = -28
_flag$ = -12
_addr$ = -24
_x$ = -20
_p1$ = -16
_c3$ = -8
_retcode$ = -4
?CheckSendFlag@EtherObj@@QAEHXZ PROC NEAR		; EtherObj::CheckSendFlag
; Line 732
	push	ebp
	mov	ebp, esp
	sub	esp, 28					; 0000001cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 733
	mov	DWORD PTR _flag$[ebp], 0
; Line 735
	mov	DWORD PTR _x$[ebp], 0
; Line 738
	lea	eax, DWORD PTR _c3$[ebp]
	mov	DWORD PTR _p1$[ebp], eax
; Line 741
	mov	ecx, DWORD PTR ?SendOutPtr@EtherObj@@2JA ; EtherObj::SendOutPtr
	shl	ecx, 5
	mov	edx, DWORD PTR ?DownListPointer@EtherObj@@2JA ; EtherObj::DownListPointer
	add	edx, ecx
	mov	DWORD PTR _addr$[ebp], edx
; Line 742
	mov	eax, DWORD PTR _addr$[ebp]
	sub	eax, 1114084				; 0010ffe4H
	mov	DWORD PTR _x$[ebp], eax
; Line 743
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR _p1$[ebp], ecx
; Line 744
	mov	edx, DWORD PTR _p1$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR _flag$[ebp], eax
; Line 746
	cmp	DWORD PTR _flag$[ebp], 1
	jne	SHORT $L1363
; Line 747
	mov	DWORD PTR _retcode$[ebp], 1
; Line 748
	jmp	SHORT $L1364
$L1363:
; Line 749
	mov	DWORD PTR _retcode$[ebp], 0
$L1364:
; Line 751
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 752
	mov	esp, ebp
	pop	ebp
	ret	0
?CheckSendFlag@EtherObj@@QAEHXZ ENDP			; EtherObj::CheckSendFlag
_TEXT	ENDS
PUBLIC	?CheckDownComplete@EtherObj@@QAEHXZ		; EtherObj::CheckDownComplete
_TEXT	SEGMENT
_this$ = -32
_addr$ = -28
_x$ = -20
_p1$ = -16
_c3$ = -8
_retcode$ = -4
_downComplete$ = -24
_temp$ = -12
?CheckDownComplete@EtherObj@@QAEHXZ PROC NEAR		; EtherObj::CheckDownComplete
; Line 757
	push	ebp
	mov	ebp, esp
	sub	esp, 32					; 00000020H
	mov	DWORD PTR _this$[ebp], ecx
; Line 759
	mov	DWORD PTR _x$[ebp], 0
; Line 762
	lea	eax, DWORD PTR _c3$[ebp]
	mov	DWORD PTR _p1$[ebp], eax
; Line 764
	mov	DWORD PTR _downComplete$[ebp], 0
; Line 765
	mov	DWORD PTR _temp$[ebp], 0
; Line 767
	mov	ecx, DWORD PTR ?SendOutPtr@EtherObj@@2JA ; EtherObj::SendOutPtr
	shl	ecx, 5
	mov	edx, DWORD PTR ?DownListPointer@EtherObj@@2JA ; EtherObj::DownListPointer
	add	edx, ecx
	mov	DWORD PTR _addr$[ebp], edx
; Line 768
	mov	eax, DWORD PTR _addr$[ebp]
	sub	eax, 1114108				; 0010fffcH
	mov	DWORD PTR _x$[ebp], eax
; Line 769
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR _p1$[ebp], ecx
; Line 770
	mov	edx, DWORD PTR _p1$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR _downComplete$[ebp], eax
; Line 771
	mov	ecx, DWORD PTR _downComplete$[ebp]
	and	ecx, 65536				; 00010000H
	mov	DWORD PTR _temp$[ebp], ecx
; Line 773
	cmp	DWORD PTR _temp$[ebp], 65536		; 00010000H
	jne	SHORT $L1376
; Line 774
	mov	DWORD PTR _retcode$[ebp], 1
; Line 775
	jmp	SHORT $L1377
$L1376:
; Line 776
	mov	DWORD PTR _retcode$[ebp], 0
$L1377:
; Line 778
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 779
	mov	esp, ebp
	pop	ebp
	ret	0
?CheckDownComplete@EtherObj@@QAEHXZ ENDP		; EtherObj::CheckDownComplete
_TEXT	ENDS
PUBLIC	?IPInsertPkt@EtherObj@@QAEHPADHH0H@Z		; EtherObj::IPInsertPkt
_TEXT	SEGMENT
_PACK$ = 8
_PACK_Size$ = 12
_PROTOCOL$ = 16
_Target_HAdd$ = 20
_this$ = -40
_retcode$ = -4
_i$ = -32
_sizeOfPacket$ = -12
_x$ = -24
_p1$ = -20
_p2$ = -28
_c3$ = -8
_c4$ = -16
_k$1404 = -36
?IPInsertPkt@EtherObj@@QAEHPADHH0H@Z PROC NEAR		; EtherObj::IPInsertPkt
; Line 791
	push	ebp
	mov	ebp, esp
	sub	esp, 40					; 00000028H
	mov	DWORD PTR _this$[ebp], ecx
; Line 793
	mov	DWORD PTR _i$[ebp], 0
; Line 794
	mov	DWORD PTR _sizeOfPacket$[ebp], 0
; Line 796
	mov	DWORD PTR _x$[ebp], 0
; Line 801
	lea	eax, DWORD PTR _c3$[ebp]
	mov	DWORD PTR _p1$[ebp], eax
; Line 802
	lea	ecx, DWORD PTR _c4$[ebp]
	mov	DWORD PTR _p2$[ebp], ecx
; Line 807
	mov	edx, DWORD PTR ?SendInPtr@EtherObj@@2JA	; EtherObj::SendInPtr
	shl	edx, 5
	mov	eax, DWORD PTR ?DownListPointer@EtherObj@@2JA ; EtherObj::DownListPointer
	lea	ecx, DWORD PTR [eax+edx-1114104]
	mov	DWORD PTR _x$[ebp], ecx
; Line 813
	mov	edx, DWORD PTR _x$[ebp]
	add	edx, 1114104				; 0010fff8H
	mov	eax, DWORD PTR ?SndLstSize@EtherObj@@2JA ; EtherObj::SndLstSize
	sub	eax, 1
	shl	eax, 5
	mov	ecx, DWORD PTR ?DownListPointer@EtherObj@@2JA ; EtherObj::DownListPointer
	add	ecx, eax
	cmp	edx, ecx
	jle	SHORT $L1394
; Line 815
	mov	eax, -12				; fffffff4H
	jmp	$L1385
$L1394:
; Line 818
	mov	edx, DWORD PTR _PACK$[ebp]
	sub	edx, 14					; 0000000eH
	mov	DWORD PTR _PACK$[ebp], edx
; Line 820
	mov	eax, DWORD PTR _x$[ebp]
	mov	DWORD PTR _p1$[ebp], eax
; Line 823
	mov	ecx, DWORD PTR ?SndLstSize@EtherObj@@2JA ; EtherObj::SndLstSize
	imul	ecx, DWORD PTR ?PacketSize@EtherObj@@2JA ; EtherObj::PacketSize
	mov	edx, DWORD PTR ?DownListDataPointer@EtherObj@@2JA ; EtherObj::DownListDataPointer
	add	edx, ecx
	mov	eax, DWORD PTR _p1$[ebp]
	cmp	DWORD PTR [eax], edx
	jl	SHORT $L1396
; Line 825
	mov	eax, -13				; fffffff3H
	jmp	$L1385
$L1396:
; Line 828
	mov	ecx, DWORD PTR ?SendInPtr@EtherObj@@2JA	; EtherObj::SendInPtr
	add	ecx, 1
	mov	DWORD PTR ?SendInPtr@EtherObj@@2JA, ecx	; EtherObj::SendInPtr
; Line 830
	mov	edx, DWORD PTR ?SendInPtr@EtherObj@@2JA	; EtherObj::SendInPtr
	cmp	edx, DWORD PTR ?SndLstSize@EtherObj@@2JA ; EtherObj::SndLstSize
	jne	SHORT $L1397
; Line 832
	mov	DWORD PTR ?SendInPtr@EtherObj@@2JA, 0	; EtherObj::SendInPtr
$L1397:
; Line 835
	mov	eax, DWORD PTR _x$[ebp]
	add	eax, 4
	mov	DWORD PTR _x$[ebp], eax
; Line 836
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR _p2$[ebp], ecx
; Line 838
	mov	edx, DWORD PTR _x$[ebp]
	add	edx, 16					; 00000010H
	mov	DWORD PTR _x$[ebp], edx
; Line 839
	mov	eax, DWORD PTR _x$[ebp]
	mov	DWORD PTR _p1$[ebp], eax
; Line 840
	mov	ecx, DWORD PTR _p1$[ebp]
	mov	DWORD PTR [ecx], 1
; Line 842
	mov	edx, DWORD PTR _PACK_Size$[ebp]
	add	edx, 14					; 0000000eH
	mov	DWORD PTR _sizeOfPacket$[ebp], edx
; Line 844
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1400
$L1401:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L1400:
	cmp	DWORD PTR _i$[ebp], 6
	jge	SHORT $L1402
; Line 846
	mov	ecx, DWORD PTR _PACK$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _Target_HAdd$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	mov	al, BYTE PTR [edx]
	mov	BYTE PTR [ecx], al
; Line 847
	mov	ecx, DWORD PTR _PACK$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	mov	al, BYTE PTR ?mac@EtherObj@@2PADA[edx]
	mov	BYTE PTR [ecx+6], al
; Line 848
	jmp	SHORT $L1401
$L1402:
; Line 849
	mov	ecx, DWORD PTR _PROTOCOL$[ebp]
	sar	ecx, 8
	and	ecx, 255				; 000000ffH
	mov	edx, DWORD PTR _PACK$[ebp]
	mov	BYTE PTR [edx+12], cl
; Line 850
	mov	eax, DWORD PTR _PROTOCOL$[ebp]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _PACK$[ebp]
	mov	BYTE PTR [ecx+13], al
; Line 853
	cmp	DWORD PTR _sizeOfPacket$[ebp], 60	; 0000003cH
	jge	SHORT $L1403
; Line 855
	mov	edx, 60					; 0000003cH
	sub	edx, DWORD PTR _sizeOfPacket$[ebp]
	mov	DWORD PTR _k$1404[ebp], edx
; Line 856
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1405
$L1406:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L1405:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _k$1404[ebp]
	jge	SHORT $L1407
; Line 858
	mov	edx, DWORD PTR _sizeOfPacket$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _PACK$[ebp]
	mov	BYTE PTR [eax+edx], 0
; Line 859
	jmp	SHORT $L1406
$L1407:
; Line 860
	mov	DWORD PTR _sizeOfPacket$[ebp], 60	; 0000003cH
$L1403:
; Line 863
	mov	ecx, DWORD PTR _sizeOfPacket$[ebp]
	sub	ecx, -2147483648			; 80000000H
	mov	edx, DWORD PTR _p2$[ebp]
	mov	DWORD PTR [edx], ecx
; Line 865
	mov	ecx, DWORD PTR _this$[ebp]
	call	?sndCall@EtherObj@@QAEHXZ		; EtherObj::sndCall
	mov	DWORD PTR _retcode$[ebp], eax
; Line 867
	xor	eax, eax
$L1385:
; Line 868
	mov	esp, ebp
	pop	ebp
	ret	20					; 00000014H
?IPInsertPkt@EtherObj@@QAEHPADHH0H@Z ENDP		; EtherObj::IPInsertPkt
_TEXT	ENDS
PUBLIC	?FormatEthPacket@EtherObj@@QAEHPADHH0JHH@Z	; EtherObj::FormatEthPacket
_TEXT	SEGMENT
_PACK$ = 8
_PACK_Size$ = 12
_PROTOCOL$ = 16
_Target_HAdd$ = 20
_InPtr$ = 24
_sendtype$ = 28
_this$ = -52
_i$ = -36
_sizeOfPacket$ = -12
_retcode$ = -4
_x$ = -28
_p1$ = -24
_p2$ = -32
_p3$ = -40
_c3$ = -8
_c4$ = -16
_c5$ = -20
_stype$ = -44
_k$1439 = -48
?FormatEthPacket@EtherObj@@QAEHPADHH0JHH@Z PROC NEAR	; EtherObj::FormatEthPacket
; Line 877
	push	ebp
	mov	ebp, esp
	sub	esp, 52					; 00000034H
	mov	DWORD PTR _this$[ebp], ecx
; Line 879
	mov	DWORD PTR _i$[ebp], 0
; Line 880
	mov	DWORD PTR _sizeOfPacket$[ebp], 0
; Line 881
	mov	DWORD PTR _retcode$[ebp], 0
; Line 883
	mov	DWORD PTR _x$[ebp], 0
; Line 890
	lea	eax, DWORD PTR _c3$[ebp]
	mov	DWORD PTR _p1$[ebp], eax
; Line 891
	lea	ecx, DWORD PTR _c4$[ebp]
	mov	DWORD PTR _p2$[ebp], ecx
; Line 892
	lea	edx, DWORD PTR _c5$[ebp]
	mov	DWORD PTR _p3$[ebp], edx
; Line 893
	mov	DWORD PTR _stype$[ebp], 0
; Line 899
	mov	eax, DWORD PTR _InPtr$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR ?DownListPointer@EtherObj@@2JA ; EtherObj::DownListPointer
	lea	edx, DWORD PTR [ecx+eax-1114104]
	mov	DWORD PTR _x$[ebp], edx
; Line 904
	mov	eax, DWORD PTR _x$[ebp]
	add	eax, 1114104				; 0010fff8H
	mov	ecx, DWORD PTR ?SndLstSize@EtherObj@@2JA ; EtherObj::SndLstSize
	sub	ecx, 1
	shl	ecx, 5
	mov	edx, DWORD PTR ?DownListPointer@EtherObj@@2JA ; EtherObj::DownListPointer
	add	edx, ecx
	cmp	eax, edx
	jle	SHORT $L1429
; Line 906
	mov	eax, -26				; ffffffe6H
	jmp	$L1417
$L1429:
; Line 909
	mov	eax, DWORD PTR _x$[ebp]
	mov	DWORD PTR _p1$[ebp], eax
; Line 912
	mov	ecx, DWORD PTR ?SndLstSize@EtherObj@@2JA ; EtherObj::SndLstSize
	imul	ecx, DWORD PTR ?PacketSize@EtherObj@@2JA ; EtherObj::PacketSize
	mov	edx, DWORD PTR ?DownListDataPointer@EtherObj@@2JA ; EtherObj::DownListDataPointer
	add	edx, ecx
	mov	eax, DWORD PTR _p1$[ebp]
	cmp	DWORD PTR [eax], edx
	jl	SHORT $L1431
; Line 914
	mov	eax, -27				; ffffffe5H
	jmp	$L1417
$L1431:
; Line 917
	mov	ecx, DWORD PTR _x$[ebp]
	add	ecx, 4
	mov	DWORD PTR _x$[ebp], ecx
; Line 918
	mov	edx, DWORD PTR _x$[ebp]
	mov	DWORD PTR _p2$[ebp], edx
; Line 922
	mov	eax, DWORD PTR _x$[ebp]
	add	eax, 12					; 0000000cH
	mov	DWORD PTR _x$[ebp], eax
; Line 923
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR _p3$[ebp], ecx
; Line 924
	mov	DWORD PTR _stype$[ebp], 0
; Line 925
	mov	edx, DWORD PTR _sendtype$[ebp]
	shl	edx, 8
	and	edx, 65280				; 0000ff00H
	mov	DWORD PTR _stype$[ebp], edx
; Line 926
	mov	eax, DWORD PTR _p3$[ebp]
	mov	ecx, DWORD PTR _stype$[ebp]
	mov	DWORD PTR [eax], ecx
; Line 929
	mov	edx, DWORD PTR _x$[ebp]
	add	edx, 4
	mov	DWORD PTR _x$[ebp], edx
; Line 930
	mov	eax, DWORD PTR _x$[ebp]
	mov	DWORD PTR _p1$[ebp], eax
; Line 932
	mov	ecx, DWORD PTR _p1$[ebp]
	mov	DWORD PTR [ecx], 1
; Line 934
	mov	edx, DWORD PTR _PACK_Size$[ebp]
	add	edx, 14					; 0000000eH
	mov	DWORD PTR _sizeOfPacket$[ebp], edx
; Line 936
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1435
$L1436:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L1435:
	cmp	DWORD PTR _i$[ebp], 6
	jge	SHORT $L1437
; Line 938
	mov	ecx, DWORD PTR _PACK$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _Target_HAdd$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	mov	al, BYTE PTR [edx]
	mov	BYTE PTR [ecx], al
; Line 939
	mov	ecx, DWORD PTR _PACK$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	mov	al, BYTE PTR ?mac@EtherObj@@2PADA[edx]
	mov	BYTE PTR [ecx+6], al
; Line 940
	jmp	SHORT $L1436
$L1437:
; Line 941
	mov	ecx, DWORD PTR _PROTOCOL$[ebp]
	sar	ecx, 8
	and	ecx, 255				; 000000ffH
	mov	edx, DWORD PTR _PACK$[ebp]
	mov	BYTE PTR [edx+12], cl
; Line 942
	mov	eax, DWORD PTR _PROTOCOL$[ebp]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _PACK$[ebp]
	mov	BYTE PTR [ecx+13], al
; Line 946
	cmp	DWORD PTR _sizeOfPacket$[ebp], 60	; 0000003cH
	jge	SHORT $L1438
; Line 948
	mov	edx, 60					; 0000003cH
	sub	edx, DWORD PTR _sizeOfPacket$[ebp]
	mov	DWORD PTR _k$1439[ebp], edx
; Line 949
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1440
$L1441:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L1440:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _k$1439[ebp]
	jge	SHORT $L1442
; Line 951
	mov	edx, DWORD PTR _sizeOfPacket$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _PACK$[ebp]
	mov	BYTE PTR [eax+edx], 0
; Line 952
	jmp	SHORT $L1441
$L1442:
; Line 953
	mov	DWORD PTR _sizeOfPacket$[ebp], 60	; 0000003cH
$L1438:
; Line 956
	mov	ecx, DWORD PTR _sizeOfPacket$[ebp]
	sub	ecx, -2147483648			; 80000000H
	mov	edx, DWORD PTR _p2$[ebp]
	mov	DWORD PTR [edx], ecx
; Line 958
	mov	ecx, DWORD PTR _this$[ebp]
	call	?sndCall@EtherObj@@QAEHXZ		; EtherObj::sndCall
	mov	DWORD PTR _retcode$[ebp], eax
; Line 960
	xor	eax, eax
$L1417:
; Line 961
	mov	esp, ebp
	pop	ebp
	ret	28					; 0000001cH
?FormatEthPacket@EtherObj@@QAEHPADHH0JHH@Z ENDP		; EtherObj::FormatEthPacket
_TEXT	ENDS
PUBLIC	?FormatEthPacketN@EtherObj@@QAEHPADHH0JHHH@Z	; EtherObj::FormatEthPacketN
PUBLIC	?sndCallN@EtherObj@@QAEHH@Z			; EtherObj::sndCallN
_TEXT	SEGMENT
_PACK$ = 8
_PACK_Size$ = 12
_PROTOCOL$ = 16
_Target_HAdd$ = 20
_InPtr$ = 24
_count$ = 28
_sendtype$ = 32
_this$ = -60
_i$ = -44
_sizeOfPacket$ = -20
_retcode$ = -4
_c1$ = -8
_c2$ = -12
_x$ = -36
_p1$ = -32
_p2$ = -40
_p3$ = -48
_c3$ = -16
_c4$ = -24
_c5$ = -28
_stype$ = -52
_k$1477 = -56
?FormatEthPacketN@EtherObj@@QAEHPADHH0JHHH@Z PROC NEAR	; EtherObj::FormatEthPacketN
; Line 971
	push	ebp
	mov	ebp, esp
	sub	esp, 60					; 0000003cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 973
	mov	DWORD PTR _i$[ebp], 0
; Line 974
	mov	DWORD PTR _sizeOfPacket$[ebp], 0
; Line 975
	mov	DWORD PTR _retcode$[ebp], 0
; Line 976
	mov	DWORD PTR _c1$[ebp], 0
; Line 977
	mov	DWORD PTR _c2$[ebp], 0
; Line 979
	mov	DWORD PTR _x$[ebp], 0
; Line 986
	lea	eax, DWORD PTR _c3$[ebp]
	mov	DWORD PTR _p1$[ebp], eax
; Line 987
	lea	ecx, DWORD PTR _c4$[ebp]
	mov	DWORD PTR _p2$[ebp], ecx
; Line 988
	lea	edx, DWORD PTR _c5$[ebp]
	mov	DWORD PTR _p3$[ebp], edx
; Line 989
	mov	DWORD PTR _stype$[ebp], 0
; Line 994
	mov	eax, DWORD PTR _InPtr$[ebp]
	shl	eax, 5
	mov	ecx, DWORD PTR ?DownListPointer@EtherObj@@2JA ; EtherObj::DownListPointer
	lea	edx, DWORD PTR [ecx+eax-1114104]
	mov	DWORD PTR _x$[ebp], edx
; Line 999
	mov	eax, DWORD PTR _x$[ebp]
	add	eax, 1114104				; 0010fff8H
	mov	ecx, DWORD PTR ?SndLstSize@EtherObj@@2JA ; EtherObj::SndLstSize
	sub	ecx, 1
	shl	ecx, 5
	mov	edx, DWORD PTR ?DownListPointer@EtherObj@@2JA ; EtherObj::DownListPointer
	add	edx, ecx
	cmp	eax, edx
	jle	SHORT $L1467
; Line 1001
	mov	eax, -26				; ffffffe6H
	jmp	$L1453
$L1467:
; Line 1004
	mov	eax, DWORD PTR _x$[ebp]
	mov	DWORD PTR _p1$[ebp], eax
; Line 1007
	mov	ecx, DWORD PTR ?SndLstSize@EtherObj@@2JA ; EtherObj::SndLstSize
	imul	ecx, DWORD PTR ?PacketSize@EtherObj@@2JA ; EtherObj::PacketSize
	mov	edx, DWORD PTR ?DownListDataPointer@EtherObj@@2JA ; EtherObj::DownListDataPointer
	add	edx, ecx
	mov	eax, DWORD PTR _p1$[ebp]
	cmp	DWORD PTR [eax], edx
	jl	SHORT $L1469
; Line 1009
	mov	eax, -27				; ffffffe5H
	jmp	$L1453
$L1469:
; Line 1012
	mov	ecx, DWORD PTR _x$[ebp]
	add	ecx, 4
	mov	DWORD PTR _x$[ebp], ecx
; Line 1013
	mov	edx, DWORD PTR _x$[ebp]
	mov	DWORD PTR _p2$[ebp], edx
; Line 1017
	mov	eax, DWORD PTR _x$[ebp]
	add	eax, 12					; 0000000cH
	mov	DWORD PTR _x$[ebp], eax
; Line 1018
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR _p3$[ebp], ecx
; Line 1019
	mov	DWORD PTR _stype$[ebp], 0
; Line 1020
	mov	edx, DWORD PTR _sendtype$[ebp]
	shl	edx, 8
	and	edx, 65280				; 0000ff00H
	mov	DWORD PTR _stype$[ebp], edx
; Line 1021
	mov	eax, DWORD PTR _p3$[ebp]
	mov	ecx, DWORD PTR _stype$[ebp]
	mov	DWORD PTR [eax], ecx
; Line 1024
	mov	edx, DWORD PTR _x$[ebp]
	add	edx, 4
	mov	DWORD PTR _x$[ebp], edx
; Line 1025
	mov	eax, DWORD PTR _x$[ebp]
	mov	DWORD PTR _p1$[ebp], eax
; Line 1027
	mov	ecx, DWORD PTR _p1$[ebp]
	mov	DWORD PTR [ecx], 1
; Line 1029
	mov	edx, DWORD PTR _PACK_Size$[ebp]
	add	edx, 14					; 0000000eH
	mov	DWORD PTR _sizeOfPacket$[ebp], edx
; Line 1031
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1473
$L1474:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L1473:
	cmp	DWORD PTR _i$[ebp], 6
	jge	SHORT $L1475
; Line 1033
	mov	ecx, DWORD PTR _PACK$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _Target_HAdd$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	mov	al, BYTE PTR [edx]
	mov	BYTE PTR [ecx], al
; Line 1034
	mov	ecx, DWORD PTR _PACK$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	mov	al, BYTE PTR ?mac@EtherObj@@2PADA[edx]
	mov	BYTE PTR [ecx+6], al
; Line 1035
	jmp	SHORT $L1474
$L1475:
; Line 1036
	mov	ecx, DWORD PTR _PROTOCOL$[ebp]
	sar	ecx, 8
	and	ecx, 255				; 000000ffH
	mov	edx, DWORD PTR _PACK$[ebp]
	mov	BYTE PTR [edx+12], cl
; Line 1037
	mov	eax, DWORD PTR _PROTOCOL$[ebp]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _PACK$[ebp]
	mov	BYTE PTR [ecx+13], al
; Line 1041
	cmp	DWORD PTR _sizeOfPacket$[ebp], 60	; 0000003cH
	jge	SHORT $L1476
; Line 1043
	mov	edx, 60					; 0000003cH
	sub	edx, DWORD PTR _sizeOfPacket$[ebp]
	mov	DWORD PTR _k$1477[ebp], edx
; Line 1044
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1478
$L1479:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L1478:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _k$1477[ebp]
	jge	SHORT $L1480
; Line 1046
	mov	edx, DWORD PTR _sizeOfPacket$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _PACK$[ebp]
	mov	BYTE PTR [eax+edx], 0
; Line 1047
	jmp	SHORT $L1479
$L1480:
; Line 1048
	mov	DWORD PTR _sizeOfPacket$[ebp], 60	; 0000003cH
$L1476:
; Line 1051
	mov	ecx, DWORD PTR _sizeOfPacket$[ebp]
	sub	ecx, -2147483648			; 80000000H
	mov	edx, DWORD PTR _p2$[ebp]
	mov	DWORD PTR [edx], ecx
; Line 1053
	cmp	DWORD PTR _count$[ebp], 0
	je	SHORT $L1481
; Line 1054
	mov	eax, DWORD PTR _count$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?sndCallN@EtherObj@@QAEHH@Z		; EtherObj::sndCallN
	mov	DWORD PTR _retcode$[ebp], eax
$L1481:
; Line 1056
	xor	eax, eax
$L1453:
; Line 1057
	mov	esp, ebp
	pop	ebp
	ret	32					; 00000020H
?FormatEthPacketN@EtherObj@@QAEHPADHH0JHHH@Z ENDP	; EtherObj::FormatEthPacketN
_TEXT	ENDS
PUBLIC	?DPDFull@EtherObj@@QAEHXZ			; EtherObj::DPDFull
_TEXT	SEGMENT
_this$ = -8
_retcode$ = -4
?DPDFull@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::DPDFull
; Line 1063
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 1064
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1066
	mov	eax, DWORD PTR ?SendInPtr@EtherObj@@2JA	; EtherObj::SendInPtr
	add	eax, 1
	cdq
	idiv	DWORD PTR ?SndLstSize@EtherObj@@2JA	; EtherObj::SndLstSize
	cmp	edx, DWORD PTR ?SendOutPtr@EtherObj@@2JA ; EtherObj::SendOutPtr
	jne	SHORT $L1486
; Line 1067
	mov	DWORD PTR _retcode$[ebp], 1
; Line 1068
	jmp	SHORT $L1487
$L1486:
; Line 1069
	mov	DWORD PTR _retcode$[ebp], 0
$L1487:
; Line 1071
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 1072
	mov	esp, ebp
	pop	ebp
	ret	0
?DPDFull@EtherObj@@QAEHXZ ENDP				; EtherObj::DPDFull
_TEXT	ENDS
PUBLIC	?printDpd@EtherObj@@QAEHHH@Z			; EtherObj::printDpd
EXTRN	?AOAprintHex@AOAProtected@@QAEHJH@Z:NEAR	; AOAProtected::AOAprintHex
_TEXT	SEGMENT
_index$ = 8
_line$ = 12
_this$ = -104
_nextPtr$ = -80
_header$ = -4
_fragmentAddress$ = -92
_fragmentLength$ = -76
_packetId$ = -28
_prevPtr$ = -12
_reserved$ = -40
_flag$ = -24
_x$ = -52
_p1$ = -48
_p2$ = -60
_p3$ = -68
_p4$ = -72
_p5$ = -84
_p6$ = -88
_p7$ = -96
_p8$ = -100
_c1$ = -8
_c2$ = -16
_c3$ = -20
_c4$ = -32
_c5$ = -36
_c6$ = -44
_c7$ = -56
_c8$ = -64
?printDpd@EtherObj@@QAEHHH@Z PROC NEAR			; EtherObj::printDpd
; Line 1078
	push	ebp
	mov	ebp, esp
	sub	esp, 104				; 00000068H
	mov	DWORD PTR _this$[ebp], ecx
; Line 1079
	mov	DWORD PTR _nextPtr$[ebp], 0
; Line 1080
	mov	DWORD PTR _header$[ebp], 0
; Line 1081
	mov	DWORD PTR _fragmentAddress$[ebp], 0
; Line 1082
	mov	DWORD PTR _fragmentLength$[ebp], 0
; Line 1083
	mov	DWORD PTR _packetId$[ebp], 0
; Line 1084
	mov	DWORD PTR _prevPtr$[ebp], 0
; Line 1085
	mov	DWORD PTR _reserved$[ebp], 0
; Line 1086
	mov	DWORD PTR _flag$[ebp], 0
; Line 1088
	mov	DWORD PTR _x$[ebp], 0
; Line 1091
	lea	eax, DWORD PTR _c1$[ebp]
	mov	DWORD PTR _p1$[ebp], eax
; Line 1092
	lea	ecx, DWORD PTR _c2$[ebp]
	mov	DWORD PTR _p2$[ebp], ecx
; Line 1093
	lea	edx, DWORD PTR _c3$[ebp]
	mov	DWORD PTR _p3$[ebp], edx
; Line 1094
	lea	eax, DWORD PTR _c4$[ebp]
	mov	DWORD PTR _p4$[ebp], eax
; Line 1095
	lea	ecx, DWORD PTR _c5$[ebp]
	mov	DWORD PTR _p5$[ebp], ecx
; Line 1096
	lea	edx, DWORD PTR _c6$[ebp]
	mov	DWORD PTR _p6$[ebp], edx
; Line 1097
	lea	eax, DWORD PTR _c7$[ebp]
	mov	DWORD PTR _p7$[ebp], eax
; Line 1098
	lea	ecx, DWORD PTR _c8$[ebp]
	mov	DWORD PTR _p8$[ebp], ecx
; Line 1100
	mov	edx, DWORD PTR _index$[ebp]
	shl	edx, 5
	mov	eax, DWORD PTR ?DownListPointer@EtherObj@@2JA ; EtherObj::DownListPointer
	lea	ecx, DWORD PTR [eax+edx-1114112]
	mov	DWORD PTR _x$[ebp], ecx
; Line 1101
	mov	edx, DWORD PTR _x$[ebp]
	mov	DWORD PTR _p1$[ebp], edx
; Line 1102
	mov	eax, DWORD PTR _p1$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _nextPtr$[ebp], ecx
; Line 1104
	mov	edx, DWORD PTR _x$[ebp]
	add	edx, 4
	mov	DWORD PTR _x$[ebp], edx
; Line 1105
	mov	eax, DWORD PTR _x$[ebp]
	mov	DWORD PTR _p2$[ebp], eax
; Line 1106
	mov	ecx, DWORD PTR _p2$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR _header$[ebp], edx
; Line 1108
	mov	eax, DWORD PTR _x$[ebp]
	add	eax, 4
	mov	DWORD PTR _x$[ebp], eax
; Line 1109
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR _p3$[ebp], ecx
; Line 1110
	mov	edx, DWORD PTR _p3$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR _fragmentAddress$[ebp], eax
; Line 1112
	mov	ecx, DWORD PTR _x$[ebp]
	add	ecx, 4
	mov	DWORD PTR _x$[ebp], ecx
; Line 1113
	mov	edx, DWORD PTR _x$[ebp]
	mov	DWORD PTR _p4$[ebp], edx
; Line 1114
	mov	eax, DWORD PTR _p4$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _fragmentLength$[ebp], ecx
; Line 1116
	mov	edx, DWORD PTR _x$[ebp]
	add	edx, 4
	mov	DWORD PTR _x$[ebp], edx
; Line 1117
	mov	eax, DWORD PTR _x$[ebp]
	mov	DWORD PTR _p5$[ebp], eax
; Line 1118
	mov	ecx, DWORD PTR _p5$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR _packetId$[ebp], edx
; Line 1120
	mov	eax, DWORD PTR _x$[ebp]
	add	eax, 4
	mov	DWORD PTR _x$[ebp], eax
; Line 1121
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR _p6$[ebp], ecx
; Line 1122
	mov	edx, DWORD PTR _p6$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR _prevPtr$[ebp], eax
; Line 1124
	mov	ecx, DWORD PTR _x$[ebp]
	add	ecx, 4
	mov	DWORD PTR _x$[ebp], ecx
; Line 1125
	mov	edx, DWORD PTR _x$[ebp]
	mov	DWORD PTR _p7$[ebp], edx
; Line 1126
	mov	eax, DWORD PTR _p7$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _reserved$[ebp], ecx
; Line 1128
	mov	edx, DWORD PTR _x$[ebp]
	add	edx, 4
	mov	DWORD PTR _x$[ebp], edx
; Line 1129
	mov	eax, DWORD PTR _x$[ebp]
	mov	DWORD PTR _p8$[ebp], eax
; Line 1130
	mov	ecx, DWORD PTR _p8$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR _flag$[ebp], edx
; Line 1132
	mov	eax, DWORD PTR _line$[ebp]
	push	eax
	mov	ecx, DWORD PTR _nextPtr$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1133
	mov	edx, DWORD PTR _line$[ebp]
	add	edx, 20					; 00000014H
	push	edx
	mov	eax, DWORD PTR _header$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1134
	mov	ecx, DWORD PTR _line$[ebp]
	add	ecx, 40					; 00000028H
	push	ecx
	mov	edx, DWORD PTR _fragmentAddress$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1135
	mov	eax, DWORD PTR _line$[ebp]
	add	eax, 60					; 0000003cH
	push	eax
	mov	ecx, DWORD PTR _fragmentLength$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1136
	mov	edx, DWORD PTR _line$[ebp]
	add	edx, 80					; 00000050H
	push	edx
	mov	eax, DWORD PTR _packetId$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1137
	mov	ecx, DWORD PTR _line$[ebp]
	add	ecx, 100				; 00000064H
	push	ecx
	mov	edx, DWORD PTR _prevPtr$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1138
	mov	eax, DWORD PTR _line$[ebp]
	add	eax, 120				; 00000078H
	push	eax
	mov	ecx, DWORD PTR _reserved$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1139
	mov	edx, DWORD PTR _line$[ebp]
	add	edx, 140				; 0000008cH
	push	edx
	mov	eax, DWORD PTR _flag$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1141
	xor	eax, eax
; Line 1142
	mov	esp, ebp
	pop	ebp
	ret	8
?printDpd@EtherObj@@QAEHHH@Z ENDP			; EtherObj::printDpd
_TEXT	ENDS
PUBLIC	?printUpd@EtherObj@@QAEHHH@Z			; EtherObj::printUpd
_TEXT	SEGMENT
_index$ = 8
_line$ = 12
_this$ = -104
_nextPtr$ = -80
_header$ = -8
_fragmentAddress$ = -92
_fragmentLength$ = -76
_packetId$ = -28
_prevPtr$ = -16
_empty1$ = -4
_empty2$ = -36
_x$ = -52
_p1$ = -48
_p2$ = -60
_p3$ = -68
_p4$ = -72
_p5$ = -84
_p6$ = -88
_p7$ = -96
_p8$ = -100
_c1$ = -12
_c2$ = -20
_c3$ = -24
_c4$ = -32
_c5$ = -40
_c6$ = -44
_c7$ = -56
_c8$ = -64
?printUpd@EtherObj@@QAEHHH@Z PROC NEAR			; EtherObj::printUpd
; Line 1148
	push	ebp
	mov	ebp, esp
	sub	esp, 104				; 00000068H
	mov	DWORD PTR _this$[ebp], ecx
; Line 1149
	mov	DWORD PTR _nextPtr$[ebp], 0
; Line 1150
	mov	DWORD PTR _header$[ebp], 0
; Line 1151
	mov	DWORD PTR _fragmentAddress$[ebp], 0
; Line 1152
	mov	DWORD PTR _fragmentLength$[ebp], 0
; Line 1153
	mov	DWORD PTR _packetId$[ebp], 0
; Line 1154
	mov	DWORD PTR _prevPtr$[ebp], 0
; Line 1155
	mov	DWORD PTR _empty1$[ebp], 0
; Line 1156
	mov	DWORD PTR _empty2$[ebp], 0
; Line 1158
	mov	DWORD PTR _x$[ebp], 0
; Line 1161
	lea	eax, DWORD PTR _c1$[ebp]
	mov	DWORD PTR _p1$[ebp], eax
; Line 1162
	lea	ecx, DWORD PTR _c2$[ebp]
	mov	DWORD PTR _p2$[ebp], ecx
; Line 1163
	lea	edx, DWORD PTR _c3$[ebp]
	mov	DWORD PTR _p3$[ebp], edx
; Line 1164
	lea	eax, DWORD PTR _c4$[ebp]
	mov	DWORD PTR _p4$[ebp], eax
; Line 1165
	lea	ecx, DWORD PTR _c5$[ebp]
	mov	DWORD PTR _p5$[ebp], ecx
; Line 1166
	lea	edx, DWORD PTR _c6$[ebp]
	mov	DWORD PTR _p6$[ebp], edx
; Line 1167
	lea	eax, DWORD PTR _c7$[ebp]
	mov	DWORD PTR _p7$[ebp], eax
; Line 1168
	lea	ecx, DWORD PTR _c8$[ebp]
	mov	DWORD PTR _p8$[ebp], ecx
; Line 1170
	mov	edx, DWORD PTR _index$[ebp]
	shl	edx, 5
	mov	eax, DWORD PTR ?UpListPointer@EtherObj@@2JA ; EtherObj::UpListPointer
	lea	ecx, DWORD PTR [eax+edx-1114112]
	mov	DWORD PTR _x$[ebp], ecx
; Line 1171
	mov	edx, DWORD PTR _x$[ebp]
	mov	DWORD PTR _p1$[ebp], edx
; Line 1172
	mov	eax, DWORD PTR _p1$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _nextPtr$[ebp], ecx
; Line 1174
	mov	edx, DWORD PTR _x$[ebp]
	add	edx, 4
	mov	DWORD PTR _x$[ebp], edx
; Line 1175
	mov	eax, DWORD PTR _x$[ebp]
	mov	DWORD PTR _p2$[ebp], eax
; Line 1176
	mov	ecx, DWORD PTR _p2$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR _header$[ebp], edx
; Line 1178
	mov	eax, DWORD PTR _x$[ebp]
	add	eax, 4
	mov	DWORD PTR _x$[ebp], eax
; Line 1179
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR _p3$[ebp], ecx
; Line 1180
	mov	edx, DWORD PTR _p3$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR _fragmentAddress$[ebp], eax
; Line 1182
	mov	ecx, DWORD PTR _x$[ebp]
	add	ecx, 4
	mov	DWORD PTR _x$[ebp], ecx
; Line 1183
	mov	edx, DWORD PTR _x$[ebp]
	mov	DWORD PTR _p4$[ebp], edx
; Line 1184
	mov	eax, DWORD PTR _p4$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _fragmentLength$[ebp], ecx
; Line 1186
	mov	edx, DWORD PTR _x$[ebp]
	add	edx, 4
	mov	DWORD PTR _x$[ebp], edx
; Line 1187
	mov	eax, DWORD PTR _x$[ebp]
	mov	DWORD PTR _p5$[ebp], eax
; Line 1188
	mov	ecx, DWORD PTR _p5$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR _packetId$[ebp], edx
; Line 1190
	mov	eax, DWORD PTR _x$[ebp]
	add	eax, 4
	mov	DWORD PTR _x$[ebp], eax
; Line 1191
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR _p6$[ebp], ecx
; Line 1192
	mov	edx, DWORD PTR _p6$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR _prevPtr$[ebp], eax
; Line 1194
	mov	ecx, DWORD PTR _x$[ebp]
	add	ecx, 4
	mov	DWORD PTR _x$[ebp], ecx
; Line 1195
	mov	edx, DWORD PTR _x$[ebp]
	mov	DWORD PTR _p7$[ebp], edx
; Line 1196
	mov	eax, DWORD PTR _p7$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _empty1$[ebp], ecx
; Line 1198
	mov	edx, DWORD PTR _x$[ebp]
	add	edx, 4
	mov	DWORD PTR _x$[ebp], edx
; Line 1199
	mov	eax, DWORD PTR _x$[ebp]
	mov	DWORD PTR _p8$[ebp], eax
; Line 1200
	mov	ecx, DWORD PTR _p8$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR _empty2$[ebp], edx
; Line 1202
	mov	eax, DWORD PTR _line$[ebp]
	push	eax
	mov	ecx, DWORD PTR _nextPtr$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1203
	mov	edx, DWORD PTR _line$[ebp]
	add	edx, 20					; 00000014H
	push	edx
	mov	eax, DWORD PTR _header$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1204
	mov	ecx, DWORD PTR _line$[ebp]
	add	ecx, 40					; 00000028H
	push	ecx
	mov	edx, DWORD PTR _fragmentAddress$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1205
	mov	eax, DWORD PTR _line$[ebp]
	add	eax, 60					; 0000003cH
	push	eax
	mov	ecx, DWORD PTR _fragmentLength$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1206
	mov	edx, DWORD PTR _line$[ebp]
	add	edx, 80					; 00000050H
	push	edx
	mov	eax, DWORD PTR _packetId$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1207
	mov	ecx, DWORD PTR _line$[ebp]
	add	ecx, 100				; 00000064H
	push	ecx
	mov	edx, DWORD PTR _prevPtr$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1208
	mov	eax, DWORD PTR _line$[ebp]
	add	eax, 120				; 00000078H
	push	eax
	mov	ecx, DWORD PTR _empty1$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1209
	mov	edx, DWORD PTR _line$[ebp]
	add	edx, 140				; 0000008cH
	push	edx
	mov	eax, DWORD PTR _empty2$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1211
	xor	eax, eax
; Line 1212
	mov	esp, ebp
	pop	ebp
	ret	8
?printUpd@EtherObj@@QAEHHH@Z ENDP			; EtherObj::printUpd
_TEXT	ENDS
PUBLIC	?getInternalConfig@EtherObj@@QAEHXZ		; EtherObj::getInternalConfig
EXTRN	_cgetInternalConfig:NEAR
_TEXT	SEGMENT
_this$ = -4
?getInternalConfig@EtherObj@@QAEHXZ PROC NEAR		; EtherObj::getInternalConfig
; Line 1218
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 1219
	movsx	eax, WORD PTR ?IO_BASE@EtherObj@@0FA	; EtherObj::IO_BASE
	push	eax
	call	_cgetInternalConfig
	add	esp, 4
; Line 1220
	mov	esp, ebp
	pop	ebp
	ret	0
?getInternalConfig@EtherObj@@QAEHXZ ENDP		; EtherObj::getInternalConfig
_TEXT	ENDS
PUBLIC	?getMacControl@EtherObj@@QAEHXZ			; EtherObj::getMacControl
EXTRN	_cgetMacControl:NEAR
_TEXT	SEGMENT
_this$ = -4
?getMacControl@EtherObj@@QAEHXZ PROC NEAR		; EtherObj::getMacControl
; Line 1226
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 1227
	movsx	eax, WORD PTR ?IO_BASE@EtherObj@@0FA	; EtherObj::IO_BASE
	push	eax
	call	_cgetMacControl
	add	esp, 4
; Line 1228
	mov	esp, ebp
	pop	ebp
	ret	0
?getMacControl@EtherObj@@QAEHXZ ENDP			; EtherObj::getMacControl
_TEXT	ENDS
PUBLIC	?getMediaOptions@EtherObj@@QAEHXZ		; EtherObj::getMediaOptions
EXTRN	_cgetMediaOptions:NEAR
_TEXT	SEGMENT
_this$ = -4
?getMediaOptions@EtherObj@@QAEHXZ PROC NEAR		; EtherObj::getMediaOptions
; Line 1234
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 1235
	movsx	eax, WORD PTR ?IO_BASE@EtherObj@@0FA	; EtherObj::IO_BASE
	push	eax
	call	_cgetMediaOptions
	add	esp, 4
; Line 1236
	mov	esp, ebp
	pop	ebp
	ret	0
?getMediaOptions@EtherObj@@QAEHXZ ENDP			; EtherObj::getMediaOptions
_TEXT	ENDS
PUBLIC	?getConfigData@EtherObj@@QAEHH@Z		; EtherObj::getConfigData
EXTRN	_cgetConfigData:NEAR
_TEXT	SEGMENT
_address$ = 8
_this$ = -4
?getConfigData@EtherObj@@QAEHH@Z PROC NEAR		; EtherObj::getConfigData
; Line 1242
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 1243
	mov	eax, DWORD PTR _address$[ebp]
	push	eax
	movsx	ecx, WORD PTR ?IO_BASE@EtherObj@@0FA	; EtherObj::IO_BASE
	push	ecx
	call	_cgetConfigData
	add	esp, 8
; Line 1244
	mov	esp, ebp
	pop	ebp
	ret	4
?getConfigData@EtherObj@@QAEHH@Z ENDP			; EtherObj::getConfigData
_TEXT	ENDS
PUBLIC	?getNetworkDiag@EtherObj@@QAEHXZ		; EtherObj::getNetworkDiag
EXTRN	_cgetNetworkDiag:NEAR
_TEXT	SEGMENT
_this$ = -4
?getNetworkDiag@EtherObj@@QAEHXZ PROC NEAR		; EtherObj::getNetworkDiag
; Line 1250
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 1251
	movsx	eax, WORD PTR ?IO_BASE@EtherObj@@0FA	; EtherObj::IO_BASE
	push	eax
	call	_cgetNetworkDiag
	add	esp, 4
; Line 1252
	mov	esp, ebp
	pop	ebp
	ret	0
?getNetworkDiag@EtherObj@@QAEHXZ ENDP			; EtherObj::getNetworkDiag
_TEXT	ENDS
PUBLIC	?resetTransmitter@EtherObj@@QAEHXZ		; EtherObj::resetTransmitter
EXTRN	_cresetTransmitter:NEAR
_TEXT	SEGMENT
_this$ = -4
?resetTransmitter@EtherObj@@QAEHXZ PROC NEAR		; EtherObj::resetTransmitter
; Line 1258
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 1259
	movsx	eax, WORD PTR ?IO_BASE@EtherObj@@0FA	; EtherObj::IO_BASE
	push	eax
	call	_cresetTransmitter
	add	esp, 4
; Line 1260
	mov	esp, ebp
	pop	ebp
	ret	0
?resetTransmitter@EtherObj@@QAEHXZ ENDP			; EtherObj::resetTransmitter
_TEXT	ENDS
PUBLIC	?getCount@EtherObj@@QAEHXZ			; EtherObj::getCount
_TEXT	SEGMENT
_this$ = -4
?getCount@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::getCount
; Line 1266
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 1267
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getCurrentReceivePtr@EtherObj@@QAEHXZ	; EtherObj::getCurrentReceivePtr
	mov	DWORD PTR ?ReceiveInPtr@EtherObj@@2JA, eax ; EtherObj::ReceiveInPtr
; Line 1268
	mov	eax, DWORD PTR ?ReceiveInPtr@EtherObj@@2JA ; EtherObj::ReceiveInPtr
	cmp	eax, DWORD PTR ?ReceiveOutPtr@EtherObj@@2JA ; EtherObj::ReceiveOutPtr
	jl	SHORT $L1586
; Line 1269
	mov	eax, DWORD PTR ?ReceiveInPtr@EtherObj@@2JA ; EtherObj::ReceiveInPtr
	sub	eax, DWORD PTR ?ReceiveOutPtr@EtherObj@@2JA ; EtherObj::ReceiveOutPtr
	jmp	SHORT $L1587
$L1586:
; Line 1271
	mov	ecx, DWORD PTR ?ReceiveOutPtr@EtherObj@@2JA ; EtherObj::ReceiveOutPtr
	sub	ecx, DWORD PTR ?ReceiveInPtr@EtherObj@@2JA ; EtherObj::ReceiveInPtr
	mov	eax, DWORD PTR ?RcvLstSize@EtherObj@@2JA ; EtherObj::RcvLstSize
	sub	eax, ecx
$L1587:
; Line 1272
	mov	esp, ebp
	pop	ebp
	ret	0
?getCount@EtherObj@@QAEHXZ ENDP				; EtherObj::getCount
_TEXT	ENDS
PUBLIC	?getNoofPackets@EtherObj@@QAEHXZ		; EtherObj::getNoofPackets
_TEXT	SEGMENT
_this$ = -4
?getNoofPackets@EtherObj@@QAEHXZ PROC NEAR		; EtherObj::getNoofPackets
; Line 1277
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 1278
	mov	eax, DWORD PTR ?NoofPackets@EtherObj@@2JA ; EtherObj::NoofPackets
; Line 1279
	mov	esp, ebp
	pop	ebp
	ret	0
?getNoofPackets@EtherObj@@QAEHXZ ENDP			; EtherObj::getNoofPackets
_TEXT	ENDS
EXTRN	?AOAgetSharedMem@AOAProtected@@QAEJH@Z:NEAR	; AOAProtected::AOAgetSharedMem
EXTRN	?AOAsuspendTask@AOATask@@QAEXXZ:NEAR		; AOATask::AOAsuspendTask
_DATA	SEGMENT
	ORG $+3
$SG1602	DB	'TxStatus Error!', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -24
_retcode$ = -8
_i$ = -12
_dpdcount$ = -20
_dpdstatus$ = -4
_txfirstflag$ = -16
?sndCall@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::sndCall
; Line 1285
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	mov	DWORD PTR _this$[ebp], ecx
; Line 1286
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1287
	mov	DWORD PTR _i$[ebp], 0
; Line 1288
	mov	DWORD PTR _dpdcount$[ebp], 0
; Line 1289
	mov	DWORD PTR _dpdstatus$[ebp], 0
; Line 1290
	mov	DWORD PTR _txfirstflag$[ebp], 0
; Line 1293
	push	168					; 000000a8H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetSharedMem@AOAProtected@@QAEJH@Z	; AOAProtected::AOAgetSharedMem
	mov	DWORD PTR _dpdcount$[ebp], eax
; Line 1294
	mov	eax, DWORD PTR _dpdcount$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getDPDStatus@EtherObj@@QAEHH@Z		; EtherObj::getDPDStatus
	mov	DWORD PTR _dpdstatus$[ebp], eax
$L1600:
; Line 1296
	cmp	DWORD PTR _dpdstatus$[ebp], 192		; 000000c0H
	je	SHORT $L1601
	cmp	DWORD PTR _txfirstflag$[ebp], 0
	je	SHORT $L1601
; Line 1298
	mov	DWORD PTR _txfirstflag$[ebp], 1
; Line 1299
	push	1600					; 00000640H
	mov	ecx, DWORD PTR _dpdstatus$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1300
	push	1620					; 00000654H
	mov	edx, DWORD PTR _dpdcount$[ebp]
	sub	edx, 1
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1301
	push	1640					; 00000668H
	mov	eax, DWORD PTR ?SendOutPtr@EtherObj@@2JA ; EtherObj::SendOutPtr
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1302
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG1602
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1303
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?AOAsuspendTask@AOATask@@QAEXXZ		; AOATask::AOAsuspendTask
; Line 1304
	jmp	SHORT $L1600
$L1601:
; Line 1306
	push	0
	push	0
	mov	ecx, DWORD PTR _this$[ebp]
	call	?SendPacket@EtherObj@@QAEHJH@Z		; EtherObj::SendPacket
	mov	DWORD PTR _retcode$[ebp], eax
$L1604:
; Line 1308
	mov	ecx, DWORD PTR _this$[ebp]
	call	?CheckDownComplete@EtherObj@@QAEHXZ	; EtherObj::CheckDownComplete
	test	eax, eax
	jne	SHORT $L1605
; Line 1313
	jmp	SHORT $L1604
$L1605:
; Line 1315
	push	0
	mov	ecx, DWORD PTR _this$[ebp]
	call	?IncSendPtr@EtherObj@@QAEHH@Z		; EtherObj::IncSendPtr
	mov	DWORD PTR _retcode$[ebp], eax
; Line 1317
	xor	eax, eax
; Line 1318
	mov	esp, ebp
	pop	ebp
	ret	0
?sndCall@EtherObj@@QAEHXZ ENDP				; EtherObj::sndCall
_TEXT	ENDS
_DATA	SEGMENT
$SG1618	DB	'TxStatus Error!', 00H
_DATA	ENDS
_TEXT	SEGMENT
_count$ = 8
_this$ = -24
_retcode$ = -8
_i$ = -12
_dpdcount$ = -20
_dpdstatus$ = -4
_txfirstflag$ = -16
?sndCallN@EtherObj@@QAEHH@Z PROC NEAR			; EtherObj::sndCallN
; Line 1324
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	mov	DWORD PTR _this$[ebp], ecx
; Line 1325
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1326
	mov	DWORD PTR _i$[ebp], 0
; Line 1327
	mov	DWORD PTR _dpdcount$[ebp], 0
; Line 1328
	mov	DWORD PTR _dpdstatus$[ebp], 0
; Line 1329
	mov	DWORD PTR _txfirstflag$[ebp], 0
; Line 1332
	push	168					; 000000a8H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetSharedMem@AOAProtected@@QAEJH@Z	; AOAProtected::AOAgetSharedMem
	mov	DWORD PTR _dpdcount$[ebp], eax
; Line 1333
	mov	eax, DWORD PTR _dpdcount$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getDPDStatus@EtherObj@@QAEHH@Z		; EtherObj::getDPDStatus
	mov	DWORD PTR _dpdstatus$[ebp], eax
$L1616:
; Line 1339
	cmp	DWORD PTR _dpdstatus$[ebp], 192		; 000000c0H
	je	SHORT $L1617
	cmp	DWORD PTR _txfirstflag$[ebp], 0
	je	SHORT $L1617
; Line 1341
	mov	DWORD PTR _txfirstflag$[ebp], 1
; Line 1342
	push	1600					; 00000640H
	mov	ecx, DWORD PTR _dpdstatus$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1343
	push	1620					; 00000654H
	mov	edx, DWORD PTR _dpdcount$[ebp]
	sub	edx, 1
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1344
	push	1640					; 00000668H
	mov	eax, DWORD PTR ?SendOutPtr@EtherObj@@2JA ; EtherObj::SendOutPtr
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1345
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG1618
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1346
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?AOAsuspendTask@AOATask@@QAEXXZ		; AOATask::AOAsuspendTask
; Line 1347
	jmp	SHORT $L1616
$L1617:
; Line 1349
	mov	ecx, DWORD PTR _count$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?SendPacketN@EtherObj@@QAEHH@Z		; EtherObj::SendPacketN
	mov	DWORD PTR _retcode$[ebp], eax
; Line 1351
	xor	eax, eax
; Line 1352
	mov	esp, ebp
	pop	ebp
	ret	4
?sndCallN@EtherObj@@QAEHH@Z ENDP			; EtherObj::sndCallN
_TEXT	ENDS
END
