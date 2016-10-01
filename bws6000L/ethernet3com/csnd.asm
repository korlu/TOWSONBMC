	TITLE	csnd.c
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
PUBLIC	_cenableTransmit
EXTRN	_enableTransmit:NEAR
_TEXT	SEGMENT
_iobase$ = 8
_ptr$ = 12
_cenableTransmit PROC NEAR
; File csnd.c
; Line 34
	push	ebp
	mov	ebp, esp
; Line 35
	mov	eax, DWORD PTR _ptr$[ebp]
	push	eax
	mov	ecx, DWORD PTR _iobase$[ebp]
	push	ecx
	call	_enableTransmit
	add	esp, 8
; Line 36
	pop	ebp
	ret	0
_cenableTransmit ENDP
_TEXT	ENDS
PUBLIC	_cdisableTransmit
EXTRN	_disableTransmit:NEAR
_TEXT	SEGMENT
_iobase$ = 8
_cdisableTransmit PROC NEAR
; Line 41
	push	ebp
	mov	ebp, esp
; Line 42
	mov	eax, DWORD PTR _iobase$[ebp]
	push	eax
	call	_disableTransmit
	add	esp, 4
; Line 43
	pop	ebp
	ret	0
_cdisableTransmit ENDP
_TEXT	ENDS
PUBLIC	_cgetCurrentSendPtr
EXTRN	_getCurrentSendPtr:NEAR
_TEXT	SEGMENT
_iobase$ = 8
_cgetCurrentSendPtr PROC NEAR
; Line 48
	push	ebp
	mov	ebp, esp
; Line 49
	mov	ax, WORD PTR _iobase$[ebp]
	push	eax
	call	_getCurrentSendPtr
	add	esp, 4
; Line 50
	pop	ebp
	ret	0
_cgetCurrentSendPtr ENDP
_TEXT	ENDS
PUBLIC	_cgetTransmitStatus
EXTRN	_getTransmitStatus:NEAR
_TEXT	SEGMENT
_iobase$ = 8
_cgetTransmitStatus PROC NEAR
; Line 55
	push	ebp
	mov	ebp, esp
; Line 56
	mov	eax, DWORD PTR _iobase$[ebp]
	push	eax
	call	_getTransmitStatus
	add	esp, 4
; Line 57
	pop	ebp
	ret	0
_cgetTransmitStatus ENDP
_TEXT	ENDS
PUBLIC	_cgetIntStatus
EXTRN	_getIntStatus:NEAR
_TEXT	SEGMENT
_iobase$ = 8
_cgetIntStatus PROC NEAR
; Line 62
	push	ebp
	mov	ebp, esp
; Line 63
	mov	eax, DWORD PTR _iobase$[ebp]
	push	eax
	call	_getIntStatus
	add	esp, 4
; Line 64
	pop	ebp
	ret	0
_cgetIntStatus ENDP
_TEXT	ENDS
PUBLIC	_cgetTransmitFree
EXTRN	_getTransmitFree:NEAR
_TEXT	SEGMENT
_iobase$ = 8
_cgetTransmitFree PROC NEAR
; Line 69
	push	ebp
	mov	ebp, esp
; Line 70
	mov	eax, DWORD PTR _iobase$[ebp]
	push	eax
	call	_getTransmitFree
	add	esp, 4
; Line 71
	pop	ebp
	ret	0
_cgetTransmitFree ENDP
_TEXT	ENDS
PUBLIC	_cgetTransmitPacketId
EXTRN	_getTransmitPacketId:NEAR
_TEXT	SEGMENT
_iobase$ = 8
_cgetTransmitPacketId PROC NEAR
; Line 76
	push	ebp
	mov	ebp, esp
; Line 77
	mov	eax, DWORD PTR _iobase$[ebp]
	push	eax
	call	_getTransmitPacketId
	add	esp, 4
; Line 78
	pop	ebp
	ret	0
_cgetTransmitPacketId ENDP
_TEXT	ENDS
PUBLIC	_cgetMediaStatus
EXTRN	_getMediaStatus:NEAR
_TEXT	SEGMENT
_iobase$ = 8
_cgetMediaStatus PROC NEAR
; Line 83
	push	ebp
	mov	ebp, esp
; Line 84
	mov	eax, DWORD PTR _iobase$[ebp]
	push	eax
	call	_getMediaStatus
	add	esp, 4
; Line 85
	pop	ebp
	ret	0
_cgetMediaStatus ENDP
_TEXT	ENDS
PUBLIC	_cgetFifoDiag
EXTRN	_getFifoDiag:NEAR
_TEXT	SEGMENT
_iobase$ = 8
_cgetFifoDiag PROC NEAR
; Line 90
	push	ebp
	mov	ebp, esp
; Line 91
	mov	eax, DWORD PTR _iobase$[ebp]
	push	eax
	call	_getFifoDiag
	add	esp, 4
; Line 92
	pop	ebp
	ret	0
_cgetFifoDiag ENDP
_TEXT	ENDS
PUBLIC	_cdnStall
EXTRN	_dnStall:NEAR
_TEXT	SEGMENT
_iobase$ = 8
_cdnStall PROC NEAR
; Line 97
	push	ebp
	mov	ebp, esp
; Line 98
	mov	eax, DWORD PTR _iobase$[ebp]
	push	eax
	call	_dnStall
	add	esp, 4
; Line 99
	pop	ebp
	ret	0
_cdnStall ENDP
_TEXT	ENDS
PUBLIC	_cdnUnStall
EXTRN	_dnUnStall:NEAR
_TEXT	SEGMENT
_iobase$ = 8
_cdnUnStall PROC NEAR
; Line 104
	push	ebp
	mov	ebp, esp
; Line 105
	mov	eax, DWORD PTR _iobase$[ebp]
	push	eax
	call	_dnUnStall
	add	esp, 4
; Line 106
	pop	ebp
	ret	0
_cdnUnStall ENDP
_TEXT	ENDS
PUBLIC	_csetDnLstPtr
EXTRN	_setDnLstPtr:NEAR
_TEXT	SEGMENT
_iobase$ = 8
_ptr$ = 12
_csetDnLstPtr PROC NEAR
; Line 111
	push	ebp
	mov	ebp, esp
; Line 112
	mov	eax, DWORD PTR _ptr$[ebp]
	push	eax
	mov	ecx, DWORD PTR _iobase$[ebp]
	push	ecx
	call	_setDnLstPtr
	add	esp, 8
; Line 113
	pop	ebp
	ret	0
_csetDnLstPtr ENDP
_TEXT	ENDS
PUBLIC	_cackNICInt
EXTRN	_ackNICInt:NEAR
_TEXT	SEGMENT
_iobase$ = 8
_num$ = 12
_cackNICInt PROC NEAR
; Line 118
	push	ebp
	mov	ebp, esp
; Line 119
	mov	eax, DWORD PTR _num$[ebp]
	push	eax
	mov	ecx, DWORD PTR _iobase$[ebp]
	push	ecx
	call	_ackNICInt
	add	esp, 8
; Line 120
	pop	ebp
	ret	0
_cackNICInt ENDP
_TEXT	ENDS
PUBLIC	_csend
EXTRN	_sendPacket:NEAR
_TEXT	SEGMENT
_IO_BASE$ = 8
_addr$ = 12
_delay$ = 16
_retCode$ = -4
_csend	PROC NEAR
; Line 126
	push	ebp
	mov	ebp, esp
	push	ecx
; Line 128
	mov	eax, DWORD PTR _delay$[ebp]
	push	eax
	mov	ecx, DWORD PTR _addr$[ebp]
	push	ecx
	mov	dx, WORD PTR _IO_BASE$[ebp]
	push	edx
	call	_sendPacket
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _retCode$[ebp], eax
; Line 129
	mov	eax, DWORD PTR _retCode$[ebp]
; Line 130
	mov	esp, ebp
	pop	ebp
	ret	0
_csend	ENDP
_TEXT	ENDS
PUBLIC	_csendN
EXTRN	_sendPacketN:NEAR
_TEXT	SEGMENT
_IO_BASE$ = 8
_addr$ = 12
_retCode$ = -4
_csendN	PROC NEAR
; Line 136
	push	ebp
	mov	ebp, esp
	push	ecx
; Line 138
	mov	eax, DWORD PTR _addr$[ebp]
	push	eax
	mov	cx, WORD PTR _IO_BASE$[ebp]
	push	ecx
	call	_sendPacketN
	add	esp, 8
	mov	DWORD PTR _retCode$[ebp], eax
; Line 139
	mov	eax, DWORD PTR _retCode$[ebp]
; Line 140
	mov	esp, ebp
	pop	ebp
	ret	0
_csendN	ENDP
_TEXT	ENDS
PUBLIC	_cstopTransmitAt
EXTRN	_stopTransmitAt:NEAR
_TEXT	SEGMENT
_ptr$ = 12
_DnLstPtr$ = 16
_retCode$ = -4
_cstopTransmitAt PROC NEAR
; Line 145
	push	ebp
	mov	ebp, esp
	push	ecx
; Line 147
	mov	eax, DWORD PTR _DnLstPtr$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ptr$[ebp]
	push	ecx
	call	_stopTransmitAt
	add	esp, 8
	mov	DWORD PTR _retCode$[ebp], eax
; Line 148
	mov	eax, DWORD PTR _retCode$[ebp]
; Line 149
	mov	esp, ebp
	pop	ebp
	ret	0
_cstopTransmitAt ENDP
_TEXT	ENDS
PUBLIC	_cgetInternalConfig
EXTRN	_getInternalConfig:NEAR
_TEXT	SEGMENT
_iobase$ = 8
_cgetInternalConfig PROC NEAR
; Line 154
	push	ebp
	mov	ebp, esp
; Line 155
	mov	eax, DWORD PTR _iobase$[ebp]
	push	eax
	call	_getInternalConfig
	add	esp, 4
; Line 156
	pop	ebp
	ret	0
_cgetInternalConfig ENDP
_TEXT	ENDS
PUBLIC	_cgetMacControl
EXTRN	_getMacControl:NEAR
_TEXT	SEGMENT
_iobase$ = 8
_cgetMacControl PROC NEAR
; Line 161
	push	ebp
	mov	ebp, esp
; Line 162
	mov	eax, DWORD PTR _iobase$[ebp]
	push	eax
	call	_getMacControl
	add	esp, 4
; Line 163
	pop	ebp
	ret	0
_cgetMacControl ENDP
_TEXT	ENDS
PUBLIC	_cgetMediaOptions
EXTRN	_getMediaOptions:NEAR
_TEXT	SEGMENT
_iobase$ = 8
_cgetMediaOptions PROC NEAR
; Line 168
	push	ebp
	mov	ebp, esp
; Line 169
	mov	eax, DWORD PTR _iobase$[ebp]
	push	eax
	call	_getMediaOptions
	add	esp, 4
; Line 170
	pop	ebp
	ret	0
_cgetMediaOptions ENDP
_TEXT	ENDS
PUBLIC	_cgetConfigData
EXTRN	_getConfigData:NEAR
_TEXT	SEGMENT
_iobase$ = 8
_address$ = 12
_cgetConfigData PROC NEAR
; Line 175
	push	ebp
	mov	ebp, esp
; Line 176
	mov	eax, DWORD PTR _address$[ebp]
	push	eax
	mov	ecx, DWORD PTR _iobase$[ebp]
	push	ecx
	call	_getConfigData
	add	esp, 8
; Line 177
	pop	ebp
	ret	0
_cgetConfigData ENDP
_TEXT	ENDS
PUBLIC	_cgetNetworkDiag
EXTRN	_getNetworkDiag:NEAR
_TEXT	SEGMENT
_iobase$ = 8
_cgetNetworkDiag PROC NEAR
; Line 182
	push	ebp
	mov	ebp, esp
; Line 183
	mov	eax, DWORD PTR _iobase$[ebp]
	push	eax
	call	_getNetworkDiag
	add	esp, 4
; Line 184
	pop	ebp
	ret	0
_cgetNetworkDiag ENDP
_TEXT	ENDS
PUBLIC	_cresetTransmitter
EXTRN	_resetTransmitter:NEAR
_TEXT	SEGMENT
_iobase$ = 8
_cresetTransmitter PROC NEAR
; Line 189
	push	ebp
	mov	ebp, esp
; Line 190
	mov	eax, DWORD PTR _iobase$[ebp]
	push	eax
	call	_resetTransmitter
	add	esp, 4
; Line 191
	pop	ebp
	ret	0
_cresetTransmitter ENDP
_TEXT	ENDS
END
