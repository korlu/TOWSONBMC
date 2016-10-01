	TITLE	ipobj.cpp
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
;	COMDAT ??0TCPObj@@QAE@XZ
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT ??0UDPObj@@QAE@XZ
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT ??0HTTPList@@QAE@XZ
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT ??0TcphashIndex@@QAE@XZ
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT ??0WList@@QAE@XZ
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT ??0WTTrace@@QAE@XZ
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
FLAT	GROUP _DATA, CONST, _BSS
	ASSUME	CS: FLAT, DS: FLAT, SS: FLAT
endif
PUBLIC	?msourceMAC@IPObj@@0PADA			; IPObj::msourceMAC
PUBLIC	?mTimeLive@IPObj@@0DA				; IPObj::mTimeLive
PUBLIC	?mServiceType@IPObj@@0DA			; IPObj::mServiceType
PUBLIC	?noippacksr@IPObj@@0KA				; IPObj::noippacksr
PUBLIC	?noippackss@IPObj@@0KA				; IPObj::noippackss
PUBLIC	?noippacksps@IPObj@@0KA				; IPObj::noippacksps
PUBLIC	?msourceIP@IPObj@@2PADA				; IPObj::msourceIP
_BSS	SEGMENT
?msourceMAC@IPObj@@0PADA DB 07H DUP (?)			; IPObj::msourceMAC
	ALIGN	4

?mServiceType@IPObj@@0DA DB 01H DUP (?)			; IPObj::mServiceType
	ALIGN	4

?noippacksr@IPObj@@0KA DD 01H DUP (?)			; IPObj::noippacksr
?noippackss@IPObj@@0KA DD 01H DUP (?)			; IPObj::noippackss
?noippacksps@IPObj@@0KA DD 01H DUP (?)			; IPObj::noippacksps
?msourceIP@IPObj@@2PADA DB 04H DUP (?)			; IPObj::msourceIP
_BSS	ENDS
_DATA	SEGMENT
?mTimeLive@IPObj@@0DA DB 080H				; IPObj::mTimeLive
_DATA	ENDS
PUBLIC	??0IPObj@@QAE@XZ				; IPObj::IPObj
EXTRN	??0EtherObj@@QAE@XZ:NEAR			; EtherObj::EtherObj
EXTRN	??0AOAProtected@@QAE@XZ:NEAR			; AOAProtected::AOAProtected
_TEXT	SEGMENT
_this$ = -4
??0IPObj@@QAE@XZ PROC NEAR				; IPObj::IPObj
; File ipobj.cpp
; Line 35
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 4
	call	??0EtherObj@@QAE@XZ			; EtherObj::EtherObj
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 12					; 0000000cH
	call	??0AOAProtected@@QAE@XZ			; AOAProtected::AOAProtected
; Line 37
	mov	eax, DWORD PTR _this$[ebp]
	mov	BYTE PTR [eax], 69			; 00000045H
; Line 40
	mov	ecx, DWORD PTR _this$[ebp]
	mov	WORD PTR [ecx+2], 16384			; 00004000H
; Line 41
	mov	eax, DWORD PTR _this$[ebp]
	mov	esp, ebp
	pop	ebp
	ret	0
??0IPObj@@QAE@XZ ENDP					; IPObj::IPObj
_TEXT	ENDS
PUBLIC	?init@IPObj@@QAEXPAD@Z				; IPObj::init
EXTRN	?getMAC@EtherObj@@QAEXPAD@Z:NEAR		; EtherObj::getMAC
EXTRN	?AOAgetTimer@AOAProtected@@QAEJXZ:NEAR		; AOAProtected::AOAgetTimer
EXTRN	??0random@@QAE@H@Z:NEAR				; random::random
_TEXT	SEGMENT
_SrcIP$ = 8
_this$ = -16
_i$ = -12
_r$ = -8
?init@IPObj@@QAEXPAD@Z PROC NEAR			; IPObj::init
; Line 46
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	mov	DWORD PTR _this$[ebp], ecx
; Line 48
	push	OFFSET FLAT:?msourceMAC@IPObj@@0PADA	; IPObj::msourceMAC
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 4
	call	?getMAC@EtherObj@@QAEXPAD@Z		; EtherObj::getMAC
; Line 50
	mov	DWORD PTR ?noippackss@IPObj@@0KA, 0	; IPObj::noippackss
; Line 51
	mov	DWORD PTR ?noippacksr@IPObj@@0KA, 0	; IPObj::noippacksr
; Line 53
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L2007
$L2008:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L2007:
	cmp	DWORD PTR _i$[ebp], 4
	jge	SHORT $L2009
; Line 54
	mov	ecx, DWORD PTR _SrcIP$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	mov	al, BYTE PTR [ecx]
	mov	BYTE PTR ?msourceIP@IPObj@@2PADA[edx], al
	jmp	SHORT $L2008
$L2009:
; Line 57
	mov	BYTE PTR ?mTimeLive@IPObj@@0DA, -128	; IPObj::mTimeLive, ffffff80H
; Line 59
	mov	BYTE PTR ?mServiceType@IPObj@@0DA, 0	; IPObj::mServiceType
; Line 62
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx], 69			; 00000045H
; Line 64
	mov	edx, DWORD PTR _this$[ebp]
	mov	WORD PTR [edx+2], 16384			; 00004000H
; Line 65
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 12					; 0000000cH
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	push	eax
	lea	ecx, DWORD PTR _r$[ebp]
	call	??0random@@QAE@H@Z			; random::random
; Line 66
	mov	esp, ebp
	pop	ebp
	ret	4
?init@IPObj@@QAEXPAD@Z ENDP				; IPObj::init
_TEXT	ENDS
PUBLIC	?sendData@IPObj@@QAEHPADHQAD1HH@Z		; IPObj::sendData
PUBLIC	?checksum@IPObj@@AAEGPAD@Z			; IPObj::checksum
EXTRN	?IPInsertPkt@EtherObj@@QAEHPADHH0H@Z:NEAR	; EtherObj::IPInsertPkt
EXTRN	?AOAgetSharedMem@AOAProtected@@QAEJH@Z:NEAR	; AOAProtected::AOAgetSharedMem
EXTRN	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z:NEAR	; AOAProtected::AOAsetSharedMem
EXTRN	?getRandomAoA@random@@QAEHH@Z:NEAR		; random::getRandomAoA
_TEXT	SEGMENT
_data$ = 8
_len$ = 12
_DestIP$ = 16
_DestMAC$ = 20
_protocol$ = 24
_currenttask$ = 28
_this$ = -36
_sizeOfPacket$ = -24
_retcode$ = -4
_count1$ = -20
_r$ = -16
_randomnumber$ = -28
_i$ = -32
_cksum$ = -8
?sendData@IPObj@@QAEHPADHQAD1HH@Z PROC NEAR		; IPObj::sendData
; Line 73
	push	ebp
	mov	ebp, esp
	sub	esp, 36					; 00000024H
	mov	DWORD PTR _this$[ebp], ecx
; Line 74
	mov	DWORD PTR _sizeOfPacket$[ebp], 0
; Line 75
	mov	DWORD PTR _retcode$[ebp], 0
; Line 76
	mov	DWORD PTR _count1$[ebp], 0
; Line 78
	mov	eax, DWORD PTR _len$[ebp]
	add	eax, 20					; 00000014H
	mov	DWORD PTR _sizeOfPacket$[ebp], eax
; Line 79
	mov	ecx, DWORD PTR _data$[ebp]
	sub	ecx, 20					; 00000014H
	mov	DWORD PTR _data$[ebp], ecx
; Line 82
	cmp	DWORD PTR _len$[ebp], 1
	jge	SHORT $L2024
; Line 83
	mov	eax, -10				; fffffff6H
	jmp	$L2020
$L2024:
; Line 84
	cmp	DWORD PTR _len$[ebp], 1500		; 000005dcH
	jle	SHORT $L2025
; Line 85
	mov	eax, -11				; fffffff5H
	jmp	$L2020
$L2025:
; Line 87
	mov	edx, DWORD PTR _data$[ebp]
	mov	BYTE PTR [edx], 69			; 00000045H
; Line 89
	mov	eax, DWORD PTR _data$[ebp]
	mov	cl, BYTE PTR ?mServiceType@IPObj@@0DA	; IPObj::mServiceType
	mov	BYTE PTR [eax+1], cl
; Line 92
	mov	edx, DWORD PTR _sizeOfPacket$[ebp]
	sar	edx, 8
	and	edx, 255				; 000000ffH
	mov	eax, DWORD PTR _data$[ebp]
	mov	BYTE PTR [eax+2], dl
; Line 93
	mov	ecx, DWORD PTR _sizeOfPacket$[ebp]
	and	ecx, 255				; 000000ffH
	mov	edx, DWORD PTR _data$[ebp]
	mov	BYTE PTR [edx+3], cl
; Line 96
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 12					; 0000000cH
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	push	eax
	lea	ecx, DWORD PTR _r$[ebp]
	call	??0random@@QAE@H@Z			; random::random
; Line 97
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 12					; 0000000cH
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	push	eax
	lea	ecx, DWORD PTR _r$[ebp]
	call	?getRandomAoA@random@@QAEHH@Z		; random::getRandomAoA
	mov	DWORD PTR _randomnumber$[ebp], eax
; Line 98
	mov	eax, DWORD PTR _randomnumber$[ebp]
	shr	eax, 8
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _data$[ebp]
	mov	BYTE PTR [ecx+4], al
; Line 99
	mov	edx, DWORD PTR _randomnumber$[ebp]
	and	edx, 255				; 000000ffH
	mov	eax, DWORD PTR _data$[ebp]
	mov	BYTE PTR [eax+5], dl
; Line 102
	mov	ecx, DWORD PTR _this$[ebp]
	movsx	edx, WORD PTR [ecx+2]
	sar	edx, 8
	and	edx, 255				; 000000ffH
	mov	eax, DWORD PTR _data$[ebp]
	mov	BYTE PTR [eax+6], dl
; Line 103
	mov	ecx, DWORD PTR _this$[ebp]
	movsx	edx, WORD PTR [ecx+2]
	and	edx, 255				; 000000ffH
	mov	eax, DWORD PTR _data$[ebp]
	mov	BYTE PTR [eax+7], dl
; Line 106
	mov	ecx, DWORD PTR _data$[ebp]
	mov	dl, BYTE PTR ?mTimeLive@IPObj@@0DA	; IPObj::mTimeLive
	mov	BYTE PTR [ecx+8], dl
; Line 108
	mov	eax, DWORD PTR _protocol$[ebp]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _data$[ebp]
	mov	BYTE PTR [ecx+9], al
; Line 111
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L2032
$L2033:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L2032:
	cmp	DWORD PTR _i$[ebp], 4
	jge	SHORT $L2034
; Line 113
	mov	eax, DWORD PTR _data$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	dl, BYTE PTR ?msourceIP@IPObj@@2PADA[ecx]
	mov	BYTE PTR [eax+12], dl
; Line 114
	mov	eax, DWORD PTR _data$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _DestIP$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	dl, BYTE PTR [ecx]
	mov	BYTE PTR [eax+16], dl
; Line 116
	jmp	SHORT $L2033
$L2034:
; Line 119
	mov	eax, DWORD PTR _data$[ebp]
	mov	BYTE PTR [eax+10], 0
; Line 120
	mov	ecx, DWORD PTR _data$[ebp]
	mov	BYTE PTR [ecx+11], 0
; Line 122
	mov	edx, DWORD PTR _data$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?checksum@IPObj@@AAEGPAD@Z		; IPObj::checksum
	and	eax, 65535				; 0000ffffH
	mov	DWORD PTR _cksum$[ebp], eax
; Line 124
	mov	eax, DWORD PTR _cksum$[ebp]
	sar	eax, 8
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _data$[ebp]
	mov	BYTE PTR [ecx+10], al
; Line 125
	mov	edx, DWORD PTR _cksum$[ebp]
	and	edx, 255				; 000000ffH
	mov	eax, DWORD PTR _data$[ebp]
	mov	BYTE PTR [eax+11], dl
; Line 129
	mov	ecx, DWORD PTR ?noippackss@IPObj@@0KA	; IPObj::noippackss
	add	ecx, 1
	mov	DWORD PTR ?noippackss@IPObj@@0KA, ecx	; IPObj::noippackss
; Line 131
	mov	edx, DWORD PTR _currenttask$[ebp]
	push	edx
	mov	eax, DWORD PTR _DestMAC$[ebp]
	push	eax
	push	2048					; 00000800H
	mov	ecx, DWORD PTR _sizeOfPacket$[ebp]
	push	ecx
	mov	edx, DWORD PTR _data$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 4
	call	?IPInsertPkt@EtherObj@@QAEHPADHH0H@Z	; EtherObj::IPInsertPkt
	mov	DWORD PTR _retcode$[ebp], eax
; Line 133
	push	184					; 000000b8H
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 12					; 0000000cH
	call	?AOAgetSharedMem@AOAProtected@@QAEJH@Z	; AOAProtected::AOAgetSharedMem
	mov	DWORD PTR _count1$[ebp], eax
; Line 134
	mov	eax, DWORD PTR _count1$[ebp]
	add	eax, 1
	mov	DWORD PTR _count1$[ebp], eax
; Line 135
	mov	ecx, DWORD PTR _count1$[ebp]
	push	ecx
	push	240					; 000000f0H
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 12					; 0000000cH
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 137
	mov	eax, DWORD PTR _retcode$[ebp]
$L2020:
; Line 138
	mov	esp, ebp
	pop	ebp
	ret	24					; 00000018H
?sendData@IPObj@@QAEHPADHQAD1HH@Z ENDP			; IPObj::sendData
_TEXT	ENDS
PUBLIC	?FormatIPPacket@IPObj@@QAEHPADHQAD1HH@Z		; IPObj::FormatIPPacket
_TEXT	SEGMENT
_r$ = -12
_randomnumber$ = -20
_i$ = -24
_cksum$ = -4
_data$ = 8
_len$ = 12
_DestIP$ = 16
_protocol$ = 24
_this$ = -28
_sizeOfPacket$ = -16
?FormatIPPacket@IPObj@@QAEHPADHQAD1HH@Z PROC NEAR	; IPObj::FormatIPPacket
; Line 146
	push	ebp
	mov	ebp, esp
	sub	esp, 28					; 0000001cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 147
	mov	DWORD PTR _sizeOfPacket$[ebp], 0
; Line 149
	mov	eax, DWORD PTR _len$[ebp]
	add	eax, 20					; 00000014H
	mov	DWORD PTR _sizeOfPacket$[ebp], eax
; Line 152
	cmp	DWORD PTR _len$[ebp], 1
	jge	SHORT $L2046
; Line 153
	mov	eax, -24				; ffffffe8H
	jmp	$L2044
$L2046:
; Line 154
	cmp	DWORD PTR _len$[ebp], 1500		; 000005dcH
	jle	SHORT $L2047
; Line 155
	mov	eax, -25				; ffffffe7H
	jmp	$L2044
$L2047:
; Line 157
	mov	ecx, DWORD PTR _data$[ebp]
	mov	BYTE PTR [ecx], 69			; 00000045H
; Line 159
	mov	edx, DWORD PTR _data$[ebp]
	mov	al, BYTE PTR ?mServiceType@IPObj@@0DA	; IPObj::mServiceType
	mov	BYTE PTR [edx+1], al
; Line 162
	mov	ecx, DWORD PTR _sizeOfPacket$[ebp]
	sar	ecx, 8
	and	ecx, 255				; 000000ffH
	mov	edx, DWORD PTR _data$[ebp]
	mov	BYTE PTR [edx+2], cl
; Line 163
	mov	eax, DWORD PTR _sizeOfPacket$[ebp]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _data$[ebp]
	mov	BYTE PTR [ecx+3], al
; Line 166
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 12					; 0000000cH
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	push	eax
	lea	ecx, DWORD PTR _r$[ebp]
	call	??0random@@QAE@H@Z			; random::random
; Line 167
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 12					; 0000000cH
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	push	eax
	lea	ecx, DWORD PTR _r$[ebp]
	call	?getRandomAoA@random@@QAEHH@Z		; random::getRandomAoA
	mov	DWORD PTR _randomnumber$[ebp], eax
; Line 168
	mov	edx, DWORD PTR _randomnumber$[ebp]
	shr	edx, 8
	and	edx, 255				; 000000ffH
	mov	eax, DWORD PTR _data$[ebp]
	mov	BYTE PTR [eax+4], dl
; Line 169
	mov	ecx, DWORD PTR _randomnumber$[ebp]
	and	ecx, 255				; 000000ffH
	mov	edx, DWORD PTR _data$[ebp]
	mov	BYTE PTR [edx+5], cl
; Line 172
	mov	eax, DWORD PTR _this$[ebp]
	movsx	ecx, WORD PTR [eax+2]
	sar	ecx, 8
	and	ecx, 255				; 000000ffH
	mov	edx, DWORD PTR _data$[ebp]
	mov	BYTE PTR [edx+6], cl
; Line 173
	mov	eax, DWORD PTR _this$[ebp]
	movsx	ecx, WORD PTR [eax+2]
	and	ecx, 255				; 000000ffH
	mov	edx, DWORD PTR _data$[ebp]
	mov	BYTE PTR [edx+7], cl
; Line 176
	mov	eax, DWORD PTR _data$[ebp]
	mov	cl, BYTE PTR ?mTimeLive@IPObj@@0DA	; IPObj::mTimeLive
	mov	BYTE PTR [eax+8], cl
; Line 178
	mov	edx, DWORD PTR _protocol$[ebp]
	and	edx, 255				; 000000ffH
	mov	eax, DWORD PTR _data$[ebp]
	mov	BYTE PTR [eax+9], dl
; Line 181
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L2054
$L2055:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L2054:
	cmp	DWORD PTR _i$[ebp], 4
	jge	SHORT $L2056
; Line 183
	mov	edx, DWORD PTR _data$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	mov	cl, BYTE PTR ?msourceIP@IPObj@@2PADA[eax]
	mov	BYTE PTR [edx+12], cl
; Line 184
	mov	edx, DWORD PTR _data$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _DestIP$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	mov	cl, BYTE PTR [eax]
	mov	BYTE PTR [edx+16], cl
; Line 185
	jmp	SHORT $L2055
$L2056:
; Line 188
	mov	edx, DWORD PTR _data$[ebp]
	mov	BYTE PTR [edx+10], 0
; Line 189
	mov	eax, DWORD PTR _data$[ebp]
	mov	BYTE PTR [eax+11], 0
; Line 191
	mov	ecx, DWORD PTR _data$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?checksum@IPObj@@AAEGPAD@Z		; IPObj::checksum
	and	eax, 65535				; 0000ffffH
	mov	DWORD PTR _cksum$[ebp], eax
; Line 193
	mov	edx, DWORD PTR _cksum$[ebp]
	sar	edx, 8
	and	edx, 255				; 000000ffH
	mov	eax, DWORD PTR _data$[ebp]
	mov	BYTE PTR [eax+10], dl
; Line 194
	mov	ecx, DWORD PTR _cksum$[ebp]
	and	ecx, 255				; 000000ffH
	mov	edx, DWORD PTR _data$[ebp]
	mov	BYTE PTR [edx+11], cl
; Line 196
	mov	eax, DWORD PTR ?noippackss@IPObj@@0KA	; IPObj::noippackss
	add	eax, 1
	mov	DWORD PTR ?noippackss@IPObj@@0KA, eax	; IPObj::noippackss
; Line 198
	xor	eax, eax
$L2044:
; Line 199
	mov	esp, ebp
	pop	ebp
	ret	24					; 00000018H
?FormatIPPacket@IPObj@@QAEHPADHQAD1HH@Z ENDP		; IPObj::FormatIPPacket
_packet$ = 8
_this$ = -16
_word16$ = -8
_sum$ = -4
_i$ = -12
?checksum@IPObj@@AAEGPAD@Z PROC NEAR			; IPObj::checksum
; Line 205
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	mov	DWORD PTR _this$[ebp], ecx
; Line 207
	mov	DWORD PTR _sum$[ebp], 0
; Line 209
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L2065
$L2066:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 2
	mov	DWORD PTR _i$[ebp], eax
$L2065:
	cmp	DWORD PTR _i$[ebp], 20			; 00000014H
	jge	SHORT $L2067
; Line 211
	mov	ecx, DWORD PTR _packet$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	movsx	edx, BYTE PTR [ecx]
	shl	edx, 8
	and	edx, 65280				; 0000ff00H
	mov	WORD PTR _word16$[ebp], dx
; Line 212
	mov	eax, DWORD PTR _packet$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	movsx	ecx, BYTE PTR [eax+1]
	and	ecx, 255				; 000000ffH
	mov	dx, WORD PTR _word16$[ebp]
	add	dx, cx
	mov	WORD PTR _word16$[ebp], dx
; Line 213
	movsx	eax, WORD PTR _word16$[ebp]
	and	eax, 65535				; 0000ffffH
	mov	ecx, DWORD PTR _sum$[ebp]
	add	ecx, eax
	mov	DWORD PTR _sum$[ebp], ecx
; Line 214
	jmp	SHORT $L2066
$L2067:
; Line 216
	mov	edx, DWORD PTR _sum$[ebp]
	sar	edx, 16					; 00000010H
	test	edx, edx
	je	SHORT $L2071
; Line 217
	mov	eax, DWORD PTR _sum$[ebp]
	and	eax, 65535				; 0000ffffH
	mov	ecx, DWORD PTR _sum$[ebp]
	sar	ecx, 16					; 00000010H
	add	eax, ecx
	mov	DWORD PTR _sum$[ebp], eax
	jmp	SHORT $L2067
$L2071:
; Line 219
	mov	edx, DWORD PTR _sum$[ebp]
	not	edx
	mov	DWORD PTR _sum$[ebp], edx
; Line 221
	mov	ax, WORD PTR _sum$[ebp]
; Line 222
	mov	esp, ebp
	pop	ebp
	ret	4
?checksum@IPObj@@AAEGPAD@Z ENDP				; IPObj::checksum
_TEXT	ENDS
PUBLIC	?IPHandler@IPObj@@QAEHPADH0JH@Z			; IPObj::IPHandler
PUBLIC	??0TCPObj@@QAE@XZ				; TCPObj::TCPObj
PUBLIC	??0UDPObj@@QAE@XZ				; UDPObj::UDPObj
EXTRN	?TDLPointer@EtherObj@@2JA:DWORD			; EtherObj::TDLPointer
EXTRN	?SendInPtr@EtherObj@@2JA:DWORD			; EtherObj::SendInPtr
EXTRN	??0ARPObj@@QAE@XZ:NEAR				; ARPObj::ARPObj
EXTRN	?Application_Status@AOAProtected@@2HA:DWORD	; AOAProtected::Application_Status
EXTRN	?AOAgetMem@AOAProtected@@QAEJJ@Z:NEAR		; AOAProtected::AOAgetMem
EXTRN	?TCPHandler@TCPObj@@QAEHPADH00H0JH@Z:NEAR	; TCPObj::TCPHandler
EXTRN	?UDPHandler@UDPObj@@QAEHPADH00HH@Z:NEAR		; UDPObj::UDPHandler
EXTRN	??0AOATask@@QAE@XZ:NEAR				; AOATask::AOATask
_TEXT	SEGMENT
_IPPack$ = 8
_size$ = 12
_macaddr$ = 16
_starttime$ = 20
_currenttask$ = 24
_this$ = -1092
_arp$ = -1088
_tcp$ = -480
_udp$ = -800
_task$ = -120
_TotalLength1$ = -64
_TotalLength$ = -24
_Flags_FragOffset$ = -4
_protocol$ = -492
_CheckSum$ = -60
_SourceIP$ = -40
_DestIP$ = -72
_HeaderLength$ = -32
_temp$ = -52
_k$ = -124
_x$ = -48
_p1$ = -44
_c3$ = -36
_tempval$ = -488
_Data$ = -12
_c$ = -28
_j$ = -68
_retcode$ = -8
_currtime$ = -484
_i$ = -56
?IPHandler@IPObj@@QAEHPADH0JH@Z PROC NEAR		; IPObj::IPHandler
; Line 243
	push	ebp
	mov	ebp, esp
	sub	esp, 1092				; 00000444H
	mov	DWORD PTR _this$[ebp], ecx
; Line 244
	lea	ecx, DWORD PTR _arp$[ebp]
	call	??0ARPObj@@QAE@XZ			; ARPObj::ARPObj
; Line 245
	lea	ecx, DWORD PTR _tcp$[ebp]
	call	??0TCPObj@@QAE@XZ			; TCPObj::TCPObj
; Line 246
	lea	ecx, DWORD PTR _udp$[ebp]
	call	??0UDPObj@@QAE@XZ			; UDPObj::UDPObj
; Line 247
	lea	ecx, DWORD PTR _task$[ebp]
	call	??0AOATask@@QAE@XZ			; AOATask::AOATask
; Line 254
	mov	DWORD PTR _HeaderLength$[ebp], 0
; Line 256
	mov	WORD PTR _k$[ebp], 0
; Line 258
	mov	DWORD PTR _x$[ebp], 0
; Line 261
	lea	eax, DWORD PTR _c3$[ebp]
	mov	DWORD PTR _p1$[ebp], eax
; Line 262
	mov	DWORD PTR _tempval$[ebp], 0
; Line 265
	lea	ecx, DWORD PTR _c$[ebp]
	mov	DWORD PTR _Data$[ebp], ecx
; Line 266
	mov	DWORD PTR _j$[ebp], 0
; Line 267
	mov	DWORD PTR _retcode$[ebp], 0
; Line 268
	mov	DWORD PTR _currtime$[ebp], 0
; Line 270
	mov	edx, DWORD PTR ?noippacksr@IPObj@@0KA	; IPObj::noippacksr
	add	edx, 1
	mov	DWORD PTR ?noippacksr@IPObj@@0KA, edx	; IPObj::noippacksr
; Line 272
	cmp	DWORD PTR _size$[ebp], 20		; 00000014H
	jge	SHORT $L2105
; Line 273
	or	eax, -1
	jmp	$L2080
$L2105:
; Line 275
	cmp	DWORD PTR _size$[ebp], 1500		; 000005dcH
	jle	SHORT $L2106
; Line 276
	mov	eax, -2					; fffffffeH
	jmp	$L2080
$L2106:
; Line 280
	mov	eax, DWORD PTR _IPPack$[ebp]
	movsx	ecx, BYTE PTR [eax]
	and	ecx, 240				; 000000f0H
	cmp	ecx, 64					; 00000040H
	je	SHORT $L2107
; Line 283
	mov	eax, -3					; fffffffdH
	jmp	$L2080
$L2107:
; Line 287
	mov	edx, DWORD PTR _IPPack$[ebp]
	movsx	eax, BYTE PTR [edx]
	and	eax, 15					; 0000000fH
	shl	eax, 2
	mov	DWORD PTR _HeaderLength$[ebp], eax
; Line 288
	cmp	DWORD PTR _HeaderLength$[ebp], 20	; 00000014H
	jae	SHORT $L2108
; Line 290
	mov	eax, -9					; fffffff7H
	jmp	$L2080
$L2108:
; Line 294
	mov	ecx, DWORD PTR _IPPack$[ebp]
	movsx	edx, BYTE PTR [ecx+6]
	and	edx, 255				; 000000ffH
	mov	DWORD PTR _Flags_FragOffset$[ebp], edx
; Line 295
	mov	eax, DWORD PTR _Flags_FragOffset$[ebp]
	shl	eax, 8
	and	eax, 65280				; 0000ff00H
	mov	DWORD PTR _Flags_FragOffset$[ebp], eax
; Line 296
	mov	ecx, DWORD PTR _IPPack$[ebp]
	movsx	edx, BYTE PTR [ecx+7]
	and	edx, 255				; 000000ffH
	mov	eax, DWORD PTR _Flags_FragOffset$[ebp]
	or	eax, edx
	mov	DWORD PTR _Flags_FragOffset$[ebp], eax
; Line 299
	mov	ecx, DWORD PTR _Flags_FragOffset$[ebp]
	and	ecx, 8192				; 00002000H
	cmp	ecx, 8192				; 00002000H
	je	SHORT $L2110
	mov	edx, DWORD PTR _Flags_FragOffset$[ebp]
	and	edx, 8191				; 00001fffH
	test	edx, edx
	je	SHORT $L2109
$L2110:
; Line 301
	mov	eax, -4					; fffffffcH
	jmp	$L2080
$L2109:
; Line 306
	mov	eax, DWORD PTR _IPPack$[ebp]
	mov	cl, BYTE PTR [eax+3]
	mov	BYTE PTR _temp$[ebp], cl
; Line 307
	mov	edx, DWORD PTR _IPPack$[ebp]
	mov	al, BYTE PTR [edx+2]
	mov	BYTE PTR _temp$[ebp+1], al
; Line 308
	lea	ecx, DWORD PTR _temp$[ebp]
	mov	DWORD PTR _TotalLength1$[ebp], ecx
; Line 309
	mov	edx, DWORD PTR _TotalLength1$[ebp]
	mov	ax, WORD PTR [edx]
	mov	WORD PTR _TotalLength$[ebp], ax
; Line 312
	mov	ecx, DWORD PTR _TotalLength$[ebp]
	and	ecx, 65535				; 0000ffffH
	cmp	ecx, 1
	jge	SHORT $L2112
; Line 314
	mov	eax, -5					; fffffffbH
	jmp	$L2080
$L2112:
; Line 318
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L2114
$L2115:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L2114:
	cmp	DWORD PTR _i$[ebp], 4
	jge	SHORT $L2116
; Line 320
	mov	eax, DWORD PTR _IPPack$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	dl, BYTE PTR [eax+12]
	mov	BYTE PTR _SourceIP$[ebp+ecx], dl
; Line 321
	mov	eax, DWORD PTR _IPPack$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	dl, BYTE PTR [eax+16]
	mov	BYTE PTR _DestIP$[ebp+ecx], dl
; Line 322
	jmp	SHORT $L2115
$L2116:
; Line 325
	movsx	eax, BYTE PTR _DestIP$[ebp]
	movsx	ecx, BYTE PTR ?msourceIP@IPObj@@2PADA
	cmp	eax, ecx
	je	SHORT $L2117
	movsx	edx, BYTE PTR _DestIP$[ebp+1]
	movsx	eax, BYTE PTR ?msourceIP@IPObj@@2PADA+1
	cmp	edx, eax
	je	SHORT $L2117
	movsx	ecx, BYTE PTR _DestIP$[ebp+2]
	movsx	edx, BYTE PTR ?msourceIP@IPObj@@2PADA+2
	cmp	ecx, edx
	je	SHORT $L2117
	movsx	eax, BYTE PTR _DestIP$[ebp+3]
	movsx	ecx, BYTE PTR ?msourceIP@IPObj@@2PADA+3
	cmp	eax, ecx
	je	SHORT $L2117
; Line 327
	mov	eax, -6					; fffffffaH
	jmp	$L2080
$L2117:
; Line 331
	mov	edx, DWORD PTR _IPPack$[ebp]
	movsx	eax, BYTE PTR [edx+10]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _CheckSum$[ebp], eax
; Line 332
	mov	ecx, DWORD PTR _CheckSum$[ebp]
	shl	ecx, 8
	and	ecx, 65280				; 0000ff00H
	mov	DWORD PTR _CheckSum$[ebp], ecx
; Line 333
	mov	edx, DWORD PTR _IPPack$[ebp]
	movsx	eax, BYTE PTR [edx+11]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _CheckSum$[ebp]
	or	ecx, eax
	mov	DWORD PTR _CheckSum$[ebp], ecx
; Line 335
	mov	edx, DWORD PTR _IPPack$[ebp]
	mov	BYTE PTR [edx+10], 0
; Line 336
	mov	eax, DWORD PTR _IPPack$[ebp]
	mov	BYTE PTR [eax+11], 0
; Line 337
	mov	ecx, DWORD PTR _IPPack$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?checksum@IPObj@@AAEGPAD@Z		; IPObj::checksum
	mov	WORD PTR _k$[ebp], ax
; Line 339
	mov	edx, DWORD PTR _k$[ebp]
	and	edx, 65535				; 0000ffffH
	cmp	DWORD PTR _CheckSum$[ebp], edx
	je	SHORT $L2118
; Line 341
	mov	eax, -8					; fffffff8H
	jmp	$L2080
$L2118:
; Line 345
	mov	eax, DWORD PTR _IPPack$[ebp]
	mov	cl, BYTE PTR [eax+9]
	mov	BYTE PTR _protocol$[ebp], cl
; Line 346
	mov	edx, DWORD PTR ?noippacksps@IPObj@@0KA	; IPObj::noippacksps
	add	edx, 1
	mov	DWORD PTR ?noippacksps@IPObj@@0KA, edx	; IPObj::noippacksps
; Line 348
	movsx	eax, BYTE PTR _protocol$[ebp]
	cmp	eax, 1
	jne	$L2120
; Line 350
	mov	ecx, DWORD PTR ?SendInPtr@EtherObj@@2JA	; EtherObj::SendInPtr
	shl	ecx, 4
	mov	edx, DWORD PTR ?TDLPointer@EtherObj@@2JA ; EtherObj::TDLPointer
	lea	eax, DWORD PTR [edx+ecx-1114112]
	mov	DWORD PTR _x$[ebp], eax
; Line 352
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR _p1$[ebp], ecx
; Line 353
	mov	edx, DWORD PTR _p1$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR _Data$[ebp], eax
; Line 355
	mov	ecx, DWORD PTR _Data$[ebp]
	sub	ecx, 1114078				; 0010ffdeH
	mov	DWORD PTR _Data$[ebp], ecx
; Line 359
	mov	edx, DWORD PTR _TotalLength$[ebp]
	and	edx, 65535				; 0000ffffH
	sub	edx, 28					; 0000001cH
	cmp	edx, 901				; 00000385H
	jne	$L2123
; Line 361
	mov	DWORD PTR _i$[ebp], 0
; Line 362
	mov	eax, DWORD PTR _Data$[ebp]
	add	eax, 8
	mov	DWORD PTR _Data$[ebp], eax
$L2125:
; Line 363
	mov	ecx, DWORD PTR _TotalLength$[ebp]
	and	ecx, 65535				; 0000ffffH
	sub	ecx, DWORD PTR _HeaderLength$[ebp]
	cmp	DWORD PTR _i$[ebp], ecx
	jae	SHORT $L2126
; Line 365
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 184549376				; 0b000000H
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 12					; 0000000cH
	call	?AOAgetMem@AOAProtected@@QAEJJ@Z	; AOAProtected::AOAgetMem
	mov	DWORD PTR _tempval$[ebp], eax
; Line 366
	mov	eax, DWORD PTR _tempval$[ebp]
	sar	eax, 24					; 00000018H
	mov	ecx, DWORD PTR _Data$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	BYTE PTR [ecx], al
; Line 367
	mov	edx, DWORD PTR _tempval$[ebp]
	sar	edx, 16					; 00000010H
	mov	eax, DWORD PTR _Data$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	mov	BYTE PTR [eax+1], dl
; Line 368
	mov	ecx, DWORD PTR _tempval$[ebp]
	sar	ecx, 8
	mov	edx, DWORD PTR _Data$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	mov	BYTE PTR [edx+2], cl
; Line 369
	mov	eax, DWORD PTR _Data$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	mov	cl, BYTE PTR _tempval$[ebp]
	mov	BYTE PTR [eax+3], cl
; Line 370
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 4
	mov	DWORD PTR _i$[ebp], edx
; Line 371
	jmp	SHORT $L2125
$L2126:
; Line 373
	jmp	$L2135
$L2123:
	mov	eax, DWORD PTR _TotalLength$[ebp]
	and	eax, 65535				; 0000ffffH
	sub	eax, 28					; 0000001cH
	cmp	eax, 902				; 00000386H
	jne	SHORT $L2128
; Line 375
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L2129
$L2130:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L2129:
	mov	edx, DWORD PTR _TotalLength$[ebp]
	and	edx, 65535				; 0000ffffH
	sub	edx, DWORD PTR _HeaderLength$[ebp]
	cmp	DWORD PTR _i$[ebp], edx
	jae	SHORT $L2131
; Line 377
	mov	eax, DWORD PTR _Data$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	mov	BYTE PTR [eax+8], 98			; 00000062H
; Line 378
	mov	DWORD PTR ?Application_Status@AOAProtected@@2HA, 2 ; AOAProtected::Application_Status
; Line 379
	jmp	SHORT $L2130
$L2131:
; Line 381
	jmp	SHORT $L2135
$L2128:
; Line 383
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L2133
$L2134:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L2133:
	mov	edx, DWORD PTR _TotalLength$[ebp]
	and	edx, 65535				; 0000ffffH
	sub	edx, DWORD PTR _HeaderLength$[ebp]
	cmp	DWORD PTR _i$[ebp], edx
	jae	SHORT $L2135
; Line 385
	mov	eax, DWORD PTR _Data$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _IPPack$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	dl, BYTE PTR [ecx+20]
	mov	BYTE PTR [eax], dl
; Line 386
	jmp	SHORT $L2134
$L2135:
; Line 389
	mov	eax, DWORD PTR _Data$[ebp]
	mov	BYTE PTR [eax], 0
; Line 390
	mov	ecx, DWORD PTR _Data$[ebp]
	movsx	edx, BYTE PTR [ecx+2]
	add	edx, 8
	mov	eax, DWORD PTR _Data$[ebp]
	mov	BYTE PTR [eax+2], dl
; Line 392
	mov	ecx, DWORD PTR _currenttask$[ebp]
	push	ecx
	push	1
	mov	edx, DWORD PTR _macaddr$[ebp]
	push	edx
	lea	eax, DWORD PTR _SourceIP$[ebp]
	push	eax
	mov	ecx, DWORD PTR _TotalLength$[ebp]
	and	ecx, 65535				; 0000ffffH
	sub	ecx, DWORD PTR _HeaderLength$[ebp]
	push	ecx
	mov	edx, DWORD PTR _Data$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?sendData@IPObj@@QAEHPADHQAD1HH@Z	; IPObj::sendData
	mov	DWORD PTR _retcode$[ebp], eax
; Line 394
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L2080
$L2120:
; Line 397
	movsx	eax, BYTE PTR _protocol$[ebp]
	cmp	eax, 6
	jne	SHORT $L2137
; Line 403
	mov	ecx, DWORD PTR _currenttask$[ebp]
	push	ecx
	mov	edx, DWORD PTR _starttime$[ebp]
	push	edx
	mov	eax, DWORD PTR _macaddr$[ebp]
	push	eax
	movsx	ecx, BYTE PTR _protocol$[ebp]
	push	ecx
	mov	edx, DWORD PTR _IPPack$[ebp]
	add	edx, 16					; 00000010H
	push	edx
	mov	eax, DWORD PTR _IPPack$[ebp]
	add	eax, 12					; 0000000cH
	push	eax
	mov	ecx, DWORD PTR _TotalLength$[ebp]
	and	ecx, 65535				; 0000ffffH
	sub	ecx, DWORD PTR _HeaderLength$[ebp]
	push	ecx
	mov	edx, DWORD PTR _IPPack$[ebp]
	add	edx, DWORD PTR _HeaderLength$[ebp]
	push	edx
	lea	ecx, DWORD PTR _tcp$[ebp]
	call	?TCPHandler@TCPObj@@QAEHPADH00H0JH@Z	; TCPObj::TCPHandler
	mov	DWORD PTR _retcode$[ebp], eax
; Line 404
	mov	DWORD PTR _retcode$[ebp], 0
; Line 405
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	SHORT $L2080
$L2137:
; Line 407
	movsx	eax, BYTE PTR _protocol$[ebp]
	cmp	eax, 17					; 00000011H
	jne	SHORT $L2139
; Line 411
	mov	ecx, DWORD PTR _currenttask$[ebp]
	push	ecx
	movsx	edx, BYTE PTR _protocol$[ebp]
	push	edx
	mov	eax, DWORD PTR _IPPack$[ebp]
	add	eax, 16					; 00000010H
	push	eax
	mov	ecx, DWORD PTR _IPPack$[ebp]
	add	ecx, 12					; 0000000cH
	push	ecx
	mov	edx, DWORD PTR _TotalLength$[ebp]
	and	edx, 65535				; 0000ffffH
	sub	edx, DWORD PTR _HeaderLength$[ebp]
	push	edx
	mov	eax, DWORD PTR _IPPack$[ebp]
	add	eax, DWORD PTR _HeaderLength$[ebp]
	push	eax
	lea	ecx, DWORD PTR _udp$[ebp]
	call	?UDPHandler@UDPObj@@QAEHPADH00HH@Z	; UDPObj::UDPHandler
	mov	DWORD PTR _retcode$[ebp], eax
; Line 412
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	SHORT $L2080
$L2139:
; Line 416
	mov	eax, -7					; fffffff9H
$L2080:
; Line 419
	mov	esp, ebp
	pop	ebp
	ret	20					; 00000014H
?IPHandler@IPObj@@QAEHPADH0JH@Z ENDP			; IPObj::IPHandler
_TEXT	ENDS
PUBLIC	??0HTTPList@@QAE@XZ				; HTTPList::HTTPList
PUBLIC	??0WTTrace@@QAE@XZ				; WTTrace::WTTrace
PUBLIC	??0TcphashIndex@@QAE@XZ				; TcphashIndex::TcphashIndex
PUBLIC	??0WList@@QAE@XZ				; WList::WList
;	COMDAT ??0TCPObj@@QAE@XZ
_TEXT	SEGMENT
_this$ = -4
??0TCPObj@@QAE@XZ PROC NEAR				; TCPObj::TCPObj, COMDAT
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	??0ARPObj@@QAE@XZ			; ARPObj::ARPObj
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 288				; 00000120H
	call	??0IPObj@@QAE@XZ			; IPObj::IPObj
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	??0AOAProtected@@QAE@XZ			; AOAProtected::AOAProtected
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 316				; 0000013cH
	call	??0HTTPList@@QAE@XZ			; HTTPList::HTTPList
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 328				; 00000148H
	call	??0TcphashIndex@@QAE@XZ			; TcphashIndex::TcphashIndex
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 340				; 00000154H
	call	??0WList@@QAE@XZ			; WList::WList
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 348				; 0000015cH
	call	??0WTTrace@@QAE@XZ			; WTTrace::WTTrace
	mov	eax, DWORD PTR _this$[ebp]
	mov	esp, ebp
	pop	ebp
	ret	0
??0TCPObj@@QAE@XZ ENDP					; TCPObj::TCPObj
_TEXT	ENDS
;	COMDAT ??0UDPObj@@QAE@XZ
_TEXT	SEGMENT
_this$ = -4
??0UDPObj@@QAE@XZ PROC NEAR				; UDPObj::UDPObj, COMDAT
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	??0IPObj@@QAE@XZ			; IPObj::IPObj
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 20					; 00000014H
	call	??0ARPObj@@QAE@XZ			; ARPObj::ARPObj
	mov	eax, DWORD PTR _this$[ebp]
	mov	esp, ebp
	pop	ebp
	ret	0
??0UDPObj@@QAE@XZ ENDP					; UDPObj::UDPObj
_TEXT	ENDS
;	COMDAT ??0HTTPList@@QAE@XZ
_TEXT	SEGMENT
_this$ = -4
??0HTTPList@@QAE@XZ PROC NEAR				; HTTPList::HTTPList, COMDAT
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
??0HTTPList@@QAE@XZ ENDP				; HTTPList::HTTPList
_TEXT	ENDS
;	COMDAT ??0TcphashIndex@@QAE@XZ
_TEXT	SEGMENT
_this$ = -4
??0TcphashIndex@@QAE@XZ PROC NEAR			; TcphashIndex::TcphashIndex, COMDAT
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
??0TcphashIndex@@QAE@XZ ENDP				; TcphashIndex::TcphashIndex
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
;	COMDAT ??0WTTrace@@QAE@XZ
_TEXT	SEGMENT
_this$ = -4
??0WTTrace@@QAE@XZ PROC NEAR				; WTTrace::WTTrace, COMDAT
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
??0WTTrace@@QAE@XZ ENDP					; WTTrace::WTTrace
_TEXT	ENDS
PUBLIC	?printStatistics@IPObj@@QAEXH@Z			; IPObj::printStatistics
EXTRN	?AOAprintHex@AOAProtected@@QAEHJH@Z:NEAR	; AOAProtected::AOAprintHex
EXTRN	?AOAPrintText@AOAProtected@@QAEXPADH@Z:NEAR	; AOAProtected::AOAPrintText
_DATA	SEGMENT
	ORG $+3
$SG2158	DB	'IP Statistics', 00H
	ORG $+2
$SG2159	DB	'Total Number of IP Packets Received              :', 00H
	ORG $+1
$SG2160	DB	'Total Number of IP Packets sent                  :', 00H
	ORG $+1
$SG2161	DB	'Total Number of IP Packets Successfully Processed:', 00H
_DATA	ENDS
_TEXT	SEGMENT
_Line$ = 8
_this$ = -12
_io$ = -8
?printStatistics@IPObj@@QAEXH@Z PROC NEAR		; IPObj::printStatistics
; Line 425
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 426
	lea	ecx, DWORD PTR _io$[ebp]
	call	??0AOAProtected@@QAE@XZ			; AOAProtected::AOAProtected
; Line 427
	mov	eax, DWORD PTR _Line$[ebp]
	push	eax
	push	OFFSET FLAT:$SG2158
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 428
	mov	ecx, DWORD PTR _Line$[ebp]
	add	ecx, 160				; 000000a0H
	push	ecx
	push	OFFSET FLAT:$SG2159
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 429
	mov	edx, DWORD PTR _Line$[ebp]
	add	edx, 264				; 00000108H
	push	edx
	mov	eax, DWORD PTR ?noippacksr@IPObj@@0KA	; IPObj::noippacksr
	push	eax
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 430
	mov	ecx, DWORD PTR _Line$[ebp]
	add	ecx, 320				; 00000140H
	push	ecx
	push	OFFSET FLAT:$SG2160
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 431
	mov	edx, DWORD PTR _Line$[ebp]
	add	edx, 424				; 000001a8H
	push	edx
	mov	eax, DWORD PTR ?noippackss@IPObj@@0KA	; IPObj::noippackss
	push	eax
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 432
	mov	ecx, DWORD PTR _Line$[ebp]
	add	ecx, 480				; 000001e0H
	push	ecx
	push	OFFSET FLAT:$SG2161
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 433
	mov	edx, DWORD PTR _Line$[ebp]
	add	edx, 584				; 00000248H
	push	edx
	mov	eax, DWORD PTR ?noippacksps@IPObj@@0KA	; IPObj::noippacksps
	push	eax
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 434
	mov	esp, ebp
	pop	ebp
	ret	4
?printStatistics@IPObj@@QAEXH@Z ENDP			; IPObj::printStatistics
_TEXT	ENDS
END
