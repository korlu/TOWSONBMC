	TITLE	ftopobj.cpp
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
PUBLIC	?Mode@FTOPObj@@0IA				; FTOPObj::Mode
PUBLIC	?LRT@FTOPObj@@0KA				; FTOPObj::LRT
_BSS	SEGMENT
?Mode@FTOPObj@@0IA DD 01H DUP (?)			; FTOPObj::Mode
?LRT@FTOPObj@@0KA DD 01H DUP (?)			; FTOPObj::LRT
_BSS	ENDS
PUBLIC	?init@FTOPObj@@QAEHXZ				; FTOPObj::init
EXTRN	?AOAgetTimer@AOAProtected@@QAEJXZ:NEAR		; AOAProtected::AOAgetTimer
_TEXT	SEGMENT
_this$ = -4
?init@FTOPObj@@QAEHXZ PROC NEAR				; FTOPObj::init
; File ftopobj.cpp
; Line 16
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 17
	mov	DWORD PTR ?Mode@FTOPObj@@0IA, 2		; FTOPObj::Mode
; Line 18
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	mov	DWORD PTR ?LRT@FTOPObj@@0KA, eax	; FTOPObj::LRT
; Line 19
	xor	eax, eax
; Line 20
	mov	esp, ebp
	pop	ebp
	ret	0
?init@FTOPObj@@QAEHXZ ENDP				; FTOPObj::init
_TEXT	ENDS
PUBLIC	?setMode@FTOPObj@@QAEXH@Z			; FTOPObj::setMode
_TEXT	SEGMENT
_mode$ = 8
_this$ = -4
?setMode@FTOPObj@@QAEXH@Z PROC NEAR			; FTOPObj::setMode
; Line 23
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 24
	mov	eax, DWORD PTR _mode$[ebp]
	mov	DWORD PTR ?Mode@FTOPObj@@0IA, eax	; FTOPObj::Mode
; Line 25
	mov	esp, ebp
	pop	ebp
	ret	4
?setMode@FTOPObj@@QAEXH@Z ENDP				; FTOPObj::setMode
_TEXT	ENDS
PUBLIC	?getMode@FTOPObj@@QAEHXZ			; FTOPObj::getMode
_TEXT	SEGMENT
_this$ = -4
?getMode@FTOPObj@@QAEHXZ PROC NEAR			; FTOPObj::getMode
; Line 28
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 29
	cmp	DWORD PTR ?Mode@FTOPObj@@0IA, 2		; FTOPObj::Mode
	jne	SHORT $L2146
; Line 31
	xor	eax, eax
	jmp	SHORT $L2147
$L2146:
; Line 35
	mov	eax, 1
$L2147:
; Line 38
	mov	esp, ebp
	pop	ebp
	ret	0
?getMode@FTOPObj@@QAEHXZ ENDP				; FTOPObj::getMode
_TEXT	ENDS
PUBLIC	?HandleFTOP@FTOPObj@@QAEHPADHH@Z		; FTOPObj::HandleFTOP
EXTRN	?AOAprintHex@AOAProtected@@QAEHJH@Z:NEAR	; AOAProtected::AOAprintHex
EXTRN	?AOAPrintText@AOAProtected@@QAEXPADH@Z:NEAR	; AOAProtected::AOAPrintText
_DATA	SEGMENT
$SG2156	DB	'HandleFTP', 00H
	ORG $+2
$SG2157	DB	'8', 00H
	ORG $+2
$SG2159	DB	'1', 00H
	ORG $+2
$SG2161	DB	'2', 00H
	ORG $+2
$SG2163	DB	'3', 00H
	ORG $+2
$SG2164	DB	'4', 00H
	ORG $+2
$SG2165	DB	'5', 00H
	ORG $+2
$SG2167	DB	'6', 00H
	ORG $+2
$SG2168	DB	'7', 00H
_DATA	ENDS
_TEXT	SEGMENT
_Data$ = 8
_Size$ = 12
_this$ = -32
_PACK$ = -28
_DestMAC$ = -8
?HandleFTOP@FTOPObj@@QAEHPADHH@Z PROC NEAR		; FTOPObj::HandleFTOP
; Line 41
	push	ebp
	mov	ebp, esp
	sub	esp, 32					; 00000020H
	mov	DWORD PTR _this$[ebp], ecx
; Line 44
	mov	BYTE PTR _DestMAC$[ebp], -1
; Line 45
	mov	BYTE PTR _DestMAC$[ebp+1], -1
; Line 46
	mov	BYTE PTR _DestMAC$[ebp+2], -1
; Line 47
	mov	BYTE PTR _DestMAC$[ebp+3], -1
; Line 48
	mov	BYTE PTR _DestMAC$[ebp+4], -1
; Line 49
	mov	BYTE PTR _DestMAC$[ebp+5], -1
; Line 50
	push	320					; 00000140H
	push	OFFSET FLAT:$SG2156
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 51
	push	380					; 0000017cH
	mov	eax, DWORD PTR _Size$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 52
	push	360					; 00000168H
	mov	ecx, DWORD PTR _Data$[ebp]
	movsx	edx, BYTE PTR [ecx]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 53
	push	480					; 000001e0H
	push	OFFSET FLAT:$SG2157
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 54
	cmp	DWORD PTR _Size$[ebp], 1
	jge	SHORT $L2158
; Line 55
	xor	eax, eax
	jmp	$L2153
$L2158:
; Line 56
	push	480					; 000001e0H
	push	OFFSET FLAT:$SG2159
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 57
	mov	eax, DWORD PTR _Data$[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 49					; 00000031H
	jne	SHORT $L2160
; Line 59
	push	480					; 000001e0H
	push	OFFSET FLAT:$SG2161
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 61
	cmp	DWORD PTR ?Mode@FTOPObj@@0IA, 1		; FTOPObj::Mode
	jne	SHORT $L2162
; Line 63
	push	480					; 000001e0H
	push	OFFSET FLAT:$SG2163
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 65
	mov	BYTE PTR _PACK$[ebp], 50		; 00000032H
$L2162:
; Line 69
	push	480					; 000001e0H
	push	OFFSET FLAT:$SG2164
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 70
	xor	eax, eax
	jmp	SHORT $L2153
$L2160:
; Line 72
	push	480					; 000001e0H
	push	OFFSET FLAT:$SG2165
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 73
	mov	edx, DWORD PTR _Data$[ebp]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, 50					; 00000032H
	jne	SHORT $L2166
; Line 75
	mov	DWORD PTR ?Mode@FTOPObj@@0IA, 2		; FTOPObj::Mode
; Line 76
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	mov	DWORD PTR ?LRT@FTOPObj@@0KA, eax	; FTOPObj::LRT
; Line 77
	push	480					; 000001e0H
	push	OFFSET FLAT:$SG2167
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 78
	xor	eax, eax
	jmp	SHORT $L2153
$L2166:
; Line 80
	push	480					; 000001e0H
	push	OFFSET FLAT:$SG2168
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 81
	xor	eax, eax
$L2153:
; Line 82
	mov	esp, ebp
	pop	ebp
	ret	12					; 0000000cH
?HandleFTOP@FTOPObj@@QAEHPADHH@Z ENDP			; FTOPObj::HandleFTOP
_TEXT	ENDS
PUBLIC	?SendFTOP@FTOPObj@@QAEHH@Z			; FTOPObj::SendFTOP
EXTRN	??0ARPObj@@QAE@XZ:NEAR				; ARPObj::ARPObj
EXTRN	?Response@ARPObj@@QAEHPADH@Z:NEAR		; ARPObj::Response
EXTRN	??0apptask@@QAE@XZ:NEAR				; apptask::apptask
_TEXT	SEGMENT
_currenttask$ = 8
_this$ = -744
_arp$ = -740
_DestMAC$ = -8
_BIP$ = -20
_LRecT$ = -12
_i$ = -16
_PACK$ = -452
_task$ = -432
?SendFTOP@FTOPObj@@QAEHH@Z PROC NEAR			; FTOPObj::SendFTOP
; Line 85
	push	ebp
	mov	ebp, esp
	sub	esp, 744				; 000002e8H
	mov	DWORD PTR _this$[ebp], ecx
; Line 86
	lea	ecx, DWORD PTR _arp$[ebp]
	call	??0ARPObj@@QAE@XZ			; ARPObj::ARPObj
; Line 89
	mov	BYTE PTR _BIP$[ebp], -1
; Line 90
	mov	BYTE PTR _BIP$[ebp+1], -1
; Line 91
	mov	BYTE PTR _BIP$[ebp+2], -1
; Line 92
	mov	BYTE PTR _BIP$[ebp+3], -1
; Line 94
	mov	BYTE PTR _DestMAC$[ebp], -1
; Line 95
	mov	BYTE PTR _DestMAC$[ebp+1], -1
; Line 96
	mov	BYTE PTR _DestMAC$[ebp+2], -1
; Line 97
	mov	BYTE PTR _DestMAC$[ebp+3], -1
; Line 98
	mov	BYTE PTR _DestMAC$[ebp+4], -1
; Line 99
	mov	BYTE PTR _DestMAC$[ebp+5], -1
; Line 100
	mov	DWORD PTR _LRecT$[ebp], 0
; Line 101
	mov	DWORD PTR _i$[ebp], 0
; Line 103
	lea	ecx, DWORD PTR _task$[ebp]
	call	??0apptask@@QAE@XZ			; apptask::apptask
; Line 104
	cmp	DWORD PTR ?Mode@FTOPObj@@0IA, 1		; FTOPObj::Mode
	jne	SHORT $L2180
; Line 106
	xor	eax, eax
	jmp	SHORT $L2172
$L2180:
; Line 108
	mov	eax, DWORD PTR ?LRT@FTOPObj@@0KA	; FTOPObj::LRT
	mov	DWORD PTR _LRecT$[ebp], eax
; Line 111
	mov	DWORD PTR _i$[ebp], 0
$L2182:
; Line 112
	cmp	DWORD PTR _i$[ebp], 10			; 0000000aH
	jge	SHORT $L2183
; Line 114
	mov	BYTE PTR _PACK$[ebp], 49		; 00000031H
; Line 119
	mov	ecx, DWORD PTR _LRecT$[ebp]
	cmp	ecx, DWORD PTR ?LRT@FTOPObj@@0KA	; FTOPObj::LRT
	jae	SHORT $L2184
; Line 121
	xor	eax, eax
	jmp	SHORT $L2172
$L2184:
; Line 123
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
; Line 124
	jmp	SHORT $L2182
$L2183:
; Line 125
	mov	DWORD PTR ?Mode@FTOPObj@@0IA, 1		; FTOPObj::Mode
; Line 126
	mov	eax, DWORD PTR _currenttask$[ebp]
	push	eax
	lea	ecx, DWORD PTR _BIP$[ebp]
	push	ecx
	lea	ecx, DWORD PTR _arp$[ebp]
	call	?Response@ARPObj@@QAEHPADH@Z		; ARPObj::Response
; Line 128
	xor	eax, eax
$L2172:
; Line 129
	mov	esp, ebp
	pop	ebp
	ret	4
?SendFTOP@FTOPObj@@QAEHH@Z ENDP				; FTOPObj::SendFTOP
_TEXT	ENDS
END
