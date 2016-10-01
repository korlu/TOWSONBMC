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
PUBLIC	?IOADDR@EtherObj@@0KA				; EtherObj::IOADDR
PUBLIC	?IODATA@EtherObj@@0KA				; EtherObj::IODATA
PUBLIC	?mac@EtherObj@@2PADA				; EtherObj::mac
PUBLIC	?TotalRcvCount@EtherObj@@2JA			; EtherObj::TotalRcvCount
PUBLIC	?TDLPointer@EtherObj@@2JA			; EtherObj::TDLPointer
PUBLIC	?TDLDataPointer@EtherObj@@2JA			; EtherObj::TDLDataPointer
PUBLIC	?RDLPointer@EtherObj@@2JA			; EtherObj::RDLPointer
PUBLIC	?RDLDataPointer@EtherObj@@2JA			; EtherObj::RDLDataPointer
PUBLIC	?ReceiveInPtr@EtherObj@@2JA			; EtherObj::ReceiveInPtr
PUBLIC	?ReceiveOutPtr@EtherObj@@2JA			; EtherObj::ReceiveOutPtr
PUBLIC	?SendInPtr@EtherObj@@2JA			; EtherObj::SendInPtr
PUBLIC	?SendOutPtr@EtherObj@@2JA			; EtherObj::SendOutPtr
PUBLIC	?TotalDataSent@EtherObj@@2JA			; EtherObj::TotalDataSent
_BSS	SEGMENT
?IO_BASE@EtherObj@@0FA DW 01H DUP (?)			; EtherObj::IO_BASE
	ALIGN	4

?IOADDR@EtherObj@@0KA DD 01H DUP (?)			; EtherObj::IOADDR
?IODATA@EtherObj@@0KA DD 01H DUP (?)			; EtherObj::IODATA
?mac@EtherObj@@2PADA DB 06H DUP (?)			; EtherObj::mac
	ALIGN	4

?TotalRcvCount@EtherObj@@2JA DD 01H DUP (?)		; EtherObj::TotalRcvCount
?TDLPointer@EtherObj@@2JA DD 01H DUP (?)		; EtherObj::TDLPointer
?TDLDataPointer@EtherObj@@2JA DD 01H DUP (?)		; EtherObj::TDLDataPointer
?RDLPointer@EtherObj@@2JA DD 01H DUP (?)		; EtherObj::RDLPointer
?RDLDataPointer@EtherObj@@2JA DD 01H DUP (?)		; EtherObj::RDLDataPointer
?ReceiveInPtr@EtherObj@@2JA DD 01H DUP (?)		; EtherObj::ReceiveInPtr
?ReceiveOutPtr@EtherObj@@2JA DD 01H DUP (?)		; EtherObj::ReceiveOutPtr
?SendInPtr@EtherObj@@2JA DD 01H DUP (?)			; EtherObj::SendInPtr
?SendOutPtr@EtherObj@@2JA DD 01H DUP (?)		; EtherObj::SendOutPtr
?TotalDataSent@EtherObj@@2JA DD 01H DUP (?)		; EtherObj::TotalDataSent
_BSS	ENDS
PUBLIC	??0EtherObj@@QAE@XZ				; EtherObj::EtherObj
EXTRN	??0AOAProtected@@QAE@XZ:NEAR			; AOAProtected::AOAProtected
_TEXT	SEGMENT
_this$ = -4
??0EtherObj@@QAE@XZ PROC NEAR				; EtherObj::EtherObj
; File EtherObj.cpp
; Line 34
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	??0AOAProtected@@QAE@XZ			; AOAProtected::AOAProtected
; Line 35
	mov	eax, DWORD PTR _this$[ebp]
	mov	esp, ebp
	pop	ebp
	ret	0
??0EtherObj@@QAE@XZ ENDP				; EtherObj::EtherObj
_TEXT	ENDS
PUBLIC	?printDiag@EtherObj@@QAEHH@Z			; EtherObj::printDiag
PUBLIC	?inittest@EtherObj@@QAEHJJJJPAD@Z		; EtherObj::inittest
PUBLIC	?createTDL@EtherObj@@QAEHXZ			; EtherObj::createTDL
PUBLIC	?createRDL@EtherObj@@QAEHXZ			; EtherObj::createRDL
PUBLIC	?initTDL@EtherObj@@QAEHHHH@Z			; EtherObj::initTDL
PUBLIC	?initRDL@EtherObj@@QAEHHHH@Z			; EtherObj::initRDL
_TEXT	SEGMENT
_tbaseAddress$ = 8
_tbufferPointer$ = 12
_rbaseAddress$ = 16
_rbufferPointer$ = 20
_srcmac$ = 24
_this$ = -20
_retcode$ = -4
_tdtail$ = -12
_rdtail$ = -16
_i$ = -8
?inittest@EtherObj@@QAEHJJJJPAD@Z PROC NEAR		; EtherObj::inittest
; Line 41
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	mov	DWORD PTR _this$[ebp], ecx
; Line 42
	mov	DWORD PTR _retcode$[ebp], 0
; Line 43
	mov	DWORD PTR _tdtail$[ebp], 0
; Line 44
	mov	DWORD PTR _rdtail$[ebp], 0
; Line 47
	mov	DWORD PTR ?SendInPtr@EtherObj@@2JA, 0	; EtherObj::SendInPtr
; Line 48
	mov	DWORD PTR ?SendOutPtr@EtherObj@@2JA, 0	; EtherObj::SendOutPtr
; Line 49
	mov	DWORD PTR ?ReceiveInPtr@EtherObj@@2JA, 0 ; EtherObj::ReceiveInPtr
; Line 50
	mov	DWORD PTR ?ReceiveOutPtr@EtherObj@@2JA, 0 ; EtherObj::ReceiveOutPtr
; Line 53
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1106
$L1107:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L1106:
	cmp	DWORD PTR _i$[ebp], 6
	jge	SHORT $L1108
; Line 54
	mov	ecx, DWORD PTR _srcmac$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	mov	al, BYTE PTR [ecx]
	mov	BYTE PTR ?mac@EtherObj@@2PADA[edx], al
	jmp	SHORT $L1107
$L1108:
; Line 57
	mov	DWORD PTR _tdtail$[ebp], 0
; Line 58
	mov	DWORD PTR _rdtail$[ebp], 4094		; 00000ffeH
; Line 60
	mov	ecx, DWORD PTR _tbaseAddress$[ebp]
	mov	DWORD PTR ?TDLPointer@EtherObj@@2JA, ecx ; EtherObj::TDLPointer
; Line 61
	mov	edx, DWORD PTR _tbufferPointer$[ebp]
	mov	DWORD PTR ?TDLDataPointer@EtherObj@@2JA, edx ; EtherObj::TDLDataPointer
; Line 62
	mov	eax, DWORD PTR _rbaseAddress$[ebp]
	mov	DWORD PTR ?RDLPointer@EtherObj@@2JA, eax ; EtherObj::RDLPointer
; Line 63
	mov	ecx, DWORD PTR _rbufferPointer$[ebp]
	mov	DWORD PTR ?RDLDataPointer@EtherObj@@2JA, ecx ; EtherObj::RDLDataPointer
; Line 65
	push	480					; 000001e0H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?printDiag@EtherObj@@QAEHH@Z		; EtherObj::printDiag
; Line 67
	mov	ecx, DWORD PTR _this$[ebp]
	call	?createTDL@EtherObj@@QAEHXZ		; EtherObj::createTDL
	mov	DWORD PTR _retcode$[ebp], eax
; Line 68
	mov	ecx, DWORD PTR _this$[ebp]
	call	?createRDL@EtherObj@@QAEHXZ		; EtherObj::createRDL
	mov	DWORD PTR _retcode$[ebp], eax
; Line 71
	mov	edx, DWORD PTR _tdtail$[ebp]
	push	edx
	push	0
	push	512					; 00000200H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?initTDL@EtherObj@@QAEHHHH@Z		; EtherObj::initTDL
	mov	DWORD PTR _retcode$[ebp], eax
; Line 74
	mov	eax, DWORD PTR _rdtail$[ebp]
	push	eax
	push	0
	push	512					; 00000200H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?initRDL@EtherObj@@QAEHHHH@Z		; EtherObj::initRDL
	mov	DWORD PTR _retcode$[ebp], eax
; Line 75
	xor	eax, eax
; Line 76
	mov	esp, ebp
	pop	ebp
	ret	20					; 00000014H
?inittest@EtherObj@@QAEHJJJJPAD@Z ENDP			; EtherObj::inittest
_TEXT	ENDS
PUBLIC	?setTDBALow@EtherObj@@QAEHH@Z			; EtherObj::setTDBALow
PUBLIC	?setTDBAHigh@EtherObj@@QAEHH@Z			; EtherObj::setTDBAHigh
PUBLIC	?setTDLen@EtherObj@@QAEHH@Z			; EtherObj::setTDLen
PUBLIC	?setTDHead@EtherObj@@QAEHH@Z			; EtherObj::setTDHead
PUBLIC	?setTDTail@EtherObj@@QAEHH@Z			; EtherObj::setTDTail
_TEXT	SEGMENT
_len$ = 8
_head$ = 12
_tail$ = 16
_this$ = -8
_retcode$ = -4
?initTDL@EtherObj@@QAEHHHH@Z PROC NEAR			; EtherObj::initTDL
; Line 82
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 83
	mov	DWORD PTR _retcode$[ebp], 0
; Line 85
	mov	eax, DWORD PTR ?TDLPointer@EtherObj@@2JA ; EtherObj::TDLPointer
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setTDBALow@EtherObj@@QAEHH@Z		; EtherObj::setTDBALow
	mov	DWORD PTR _retcode$[ebp], eax
; Line 86
	push	0
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setTDBAHigh@EtherObj@@QAEHH@Z		; EtherObj::setTDBAHigh
	mov	DWORD PTR _retcode$[ebp], eax
; Line 87
	mov	ecx, DWORD PTR _len$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setTDLen@EtherObj@@QAEHH@Z		; EtherObj::setTDLen
	mov	DWORD PTR _retcode$[ebp], eax
; Line 88
	mov	edx, DWORD PTR _head$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setTDHead@EtherObj@@QAEHH@Z		; EtherObj::setTDHead
	mov	DWORD PTR _retcode$[ebp], eax
; Line 89
	mov	eax, DWORD PTR _tail$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setTDTail@EtherObj@@QAEHH@Z		; EtherObj::setTDTail
	mov	DWORD PTR _retcode$[ebp], eax
; Line 91
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 92
	mov	esp, ebp
	pop	ebp
	ret	12					; 0000000cH
?initTDL@EtherObj@@QAEHHHH@Z ENDP			; EtherObj::initTDL
_TEXT	ENDS
PUBLIC	?setRDBALow@EtherObj@@QAEHH@Z			; EtherObj::setRDBALow
PUBLIC	?setRDBAHigh@EtherObj@@QAEHH@Z			; EtherObj::setRDBAHigh
PUBLIC	?setRDLen@EtherObj@@QAEHH@Z			; EtherObj::setRDLen
PUBLIC	?setRDHead@EtherObj@@QAEHH@Z			; EtherObj::setRDHead
PUBLIC	?setRDTail@EtherObj@@QAEHH@Z			; EtherObj::setRDTail
_TEXT	SEGMENT
_len$ = 8
_head$ = 12
_tail$ = 16
_this$ = -8
_retcode$ = -4
?initRDL@EtherObj@@QAEHHHH@Z PROC NEAR			; EtherObj::initRDL
; Line 98
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 99
	mov	DWORD PTR _retcode$[ebp], 0
; Line 101
	mov	eax, DWORD PTR ?RDLPointer@EtherObj@@2JA ; EtherObj::RDLPointer
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRDBALow@EtherObj@@QAEHH@Z		; EtherObj::setRDBALow
	mov	DWORD PTR _retcode$[ebp], eax
; Line 102
	push	0
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRDBAHigh@EtherObj@@QAEHH@Z		; EtherObj::setRDBAHigh
	mov	DWORD PTR _retcode$[ebp], eax
; Line 103
	mov	ecx, DWORD PTR _len$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRDLen@EtherObj@@QAEHH@Z		; EtherObj::setRDLen
	mov	DWORD PTR _retcode$[ebp], eax
; Line 104
	mov	edx, DWORD PTR _head$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRDHead@EtherObj@@QAEHH@Z		; EtherObj::setRDHead
	mov	DWORD PTR _retcode$[ebp], eax
; Line 105
	mov	eax, DWORD PTR _tail$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRDTail@EtherObj@@QAEHH@Z		; EtherObj::setRDTail
	mov	DWORD PTR _retcode$[ebp], eax
; Line 107
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 108
	mov	esp, ebp
	pop	ebp
	ret	12					; 0000000cH
?initRDL@EtherObj@@QAEHHHH@Z ENDP			; EtherObj::initRDL
_this$ = -16
_i$ = -4
_lptr$ = -12
_l$ = -8
?createTDL@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::createTDL
; Line 116
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	mov	DWORD PTR _this$[ebp], ecx
; Line 120
	lea	eax, DWORD PTR _l$[ebp]
	mov	DWORD PTR _lptr$[ebp], eax
; Line 128
	mov	ecx, DWORD PTR ?TDLPointer@EtherObj@@2JA ; EtherObj::TDLPointer
	sub	ecx, 1114112				; 00110000H
	mov	DWORD PTR _lptr$[ebp], ecx
; Line 130
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1130
$L1131:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L1130:
	cmp	DWORD PTR _i$[ebp], 4096		; 00001000H
	jge	SHORT $L1132
; Line 132
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 1600				; 00000640H
	mov	ecx, DWORD PTR ?TDLDataPointer@EtherObj@@2JA ; EtherObj::TDLDataPointer
	add	ecx, eax
	mov	edx, DWORD PTR _lptr$[ebp]
	mov	DWORD PTR [edx], ecx
; Line 133
	mov	eax, DWORD PTR _lptr$[ebp]
	add	eax, 4
	mov	DWORD PTR _lptr$[ebp], eax
; Line 134
	mov	ecx, DWORD PTR _lptr$[ebp]
	mov	DWORD PTR [ecx], 0
; Line 135
	mov	edx, DWORD PTR _lptr$[ebp]
	add	edx, 4
	mov	DWORD PTR _lptr$[ebp], edx
; Line 136
	mov	eax, DWORD PTR _lptr$[ebp]
	mov	DWORD PTR [eax], 184549376		; 0b000000H
; Line 141
	mov	ecx, DWORD PTR _lptr$[ebp]
	add	ecx, 4
	mov	DWORD PTR _lptr$[ebp], ecx
; Line 142
	mov	edx, DWORD PTR _lptr$[ebp]
	mov	DWORD PTR [edx], 0
; Line 143
	mov	eax, DWORD PTR _lptr$[ebp]
	add	eax, 4
	mov	DWORD PTR _lptr$[ebp], eax
; Line 144
	jmp	SHORT $L1131
$L1132:
; Line 146
	xor	eax, eax
; Line 147
	mov	esp, ebp
	pop	ebp
	ret	0
?createTDL@EtherObj@@QAEHXZ ENDP			; EtherObj::createTDL
_this$ = -16
_i$ = -4
_lptr$ = -12
_l$ = -8
?createRDL@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::createRDL
; Line 155
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	mov	DWORD PTR _this$[ebp], ecx
; Line 159
	lea	eax, DWORD PTR _l$[ebp]
	mov	DWORD PTR _lptr$[ebp], eax
; Line 169
	mov	ecx, DWORD PTR ?RDLPointer@EtherObj@@2JA ; EtherObj::RDLPointer
	sub	ecx, 1114112				; 00110000H
	mov	DWORD PTR _lptr$[ebp], ecx
; Line 171
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1140
$L1141:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L1140:
	cmp	DWORD PTR _i$[ebp], 4096		; 00001000H
	jge	SHORT $L1142
; Line 173
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 11					; 0000000bH
	mov	ecx, DWORD PTR ?RDLDataPointer@EtherObj@@2JA ; EtherObj::RDLDataPointer
	add	ecx, eax
	mov	edx, DWORD PTR _lptr$[ebp]
	mov	DWORD PTR [edx], ecx
; Line 174
	mov	eax, DWORD PTR _lptr$[ebp]
	add	eax, 4
	mov	DWORD PTR _lptr$[ebp], eax
; Line 175
	mov	ecx, DWORD PTR _lptr$[ebp]
	mov	DWORD PTR [ecx], 0
; Line 176
	mov	edx, DWORD PTR _lptr$[ebp]
	add	edx, 4
	mov	DWORD PTR _lptr$[ebp], edx
; Line 177
	mov	eax, DWORD PTR _lptr$[ebp]
	mov	DWORD PTR [eax], 0
; Line 178
	mov	ecx, DWORD PTR _lptr$[ebp]
	add	ecx, 4
	mov	DWORD PTR _lptr$[ebp], ecx
; Line 179
	mov	edx, DWORD PTR _lptr$[ebp]
	mov	DWORD PTR [edx], 0
; Line 180
	mov	eax, DWORD PTR _lptr$[ebp]
	add	eax, 4
	mov	DWORD PTR _lptr$[ebp], eax
; Line 181
	jmp	SHORT $L1141
$L1142:
; Line 183
	xor	eax, eax
; Line 184
	mov	esp, ebp
	pop	ebp
	ret	0
?createRDL@EtherObj@@QAEHXZ ENDP			; EtherObj::createRDL
_TEXT	ENDS
PUBLIC	?getBaseAddress@EtherObj@@QAEHXZ		; EtherObj::getBaseAddress
_TEXT	SEGMENT
_this$ = -4
?getBaseAddress@EtherObj@@QAEHXZ PROC NEAR		; EtherObj::getBaseAddress
; Line 190
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 191
	movsx	eax, WORD PTR ?IO_BASE@EtherObj@@0FA	; EtherObj::IO_BASE
; Line 192
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
; Line 197
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 198
	mov	ax, WORD PTR _addr$[ebp]
	mov	WORD PTR ?IO_BASE@EtherObj@@0FA, ax	; EtherObj::IO_BASE
; Line 199
	mov	ecx, DWORD PTR _addr$[ebp]
	mov	DWORD PTR ?IOADDR@EtherObj@@0KA, ecx	; EtherObj::IOADDR
; Line 200
	mov	edx, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	add	edx, 4
	mov	DWORD PTR ?IODATA@EtherObj@@0KA, edx	; EtherObj::IODATA
; Line 201
	mov	esp, ebp
	pop	ebp
	ret	4
?setBaseAddress@EtherObj@@QAEXH@Z ENDP			; EtherObj::setBaseAddress
_TEXT	ENDS
PUBLIC	?getECompatibility@EtherObj@@QAEHXZ		; EtherObj::getECompatibility
PUBLIC	?getEDeviceId@EtherObj@@QAEHXZ			; EtherObj::getEDeviceId
PUBLIC	?getEVendorId@EtherObj@@QAEHXZ			; EtherObj::getEVendorId
PUBLIC	?getEInitCtrl1@EtherObj@@QAEHXZ			; EtherObj::getEInitCtrl1
PUBLIC	?getEInitCtrl2@EtherObj@@QAEHXZ			; EtherObj::getEInitCtrl2
PUBLIC	?getEInitCtrl3@EtherObj@@QAEHXZ			; EtherObj::getEInitCtrl3
PUBLIC	?getEMgmtCtrl@EtherObj@@QAEHXZ			; EtherObj::getEMgmtCtrl
PUBLIC	?getEIPv4Byte01@EtherObj@@QAEHXZ		; EtherObj::getEIPv4Byte01
PUBLIC	?getEIPv4Byte23@EtherObj@@QAEHXZ		; EtherObj::getEIPv4Byte23
PUBLIC	?getControl@EtherObj@@QAEHXZ			; EtherObj::getControl
PUBLIC	?getStatus@EtherObj@@QAEHXZ			; EtherObj::getStatus
PUBLIC	?getMdicPhyCtrl@EtherObj@@QAEHXZ		; EtherObj::getMdicPhyCtrl
PUBLIC	?getMdicPhyStat@EtherObj@@QAEHXZ		; EtherObj::getMdicPhyStat
PUBLIC	?getInterruptMaskSet@EtherObj@@QAEHXZ		; EtherObj::getInterruptMaskSet
PUBLIC	?getInterruptMaskClear@EtherObj@@QAEHXZ		; EtherObj::getInterruptMaskClear
PUBLIC	?getTDBALow@EtherObj@@QAEHXZ			; EtherObj::getTDBALow
PUBLIC	?getTDBAHigh@EtherObj@@QAEHXZ			; EtherObj::getTDBAHigh
PUBLIC	?getTDLen@EtherObj@@QAEHXZ			; EtherObj::getTDLen
PUBLIC	?getTDHead@EtherObj@@QAEHXZ			; EtherObj::getTDHead
PUBLIC	?getTDTail@EtherObj@@QAEHXZ			; EtherObj::getTDTail
PUBLIC	?getTCtrl@EtherObj@@QAEHXZ			; EtherObj::getTCtrl
PUBLIC	?getRAL0@EtherObj@@QAEHXZ			; EtherObj::getRAL0
PUBLIC	?getRAH0@EtherObj@@QAEHXZ			; EtherObj::getRAH0
PUBLIC	?getRAL1@EtherObj@@QAEHXZ			; EtherObj::getRAL1
PUBLIC	?getRAH1@EtherObj@@QAEHXZ			; EtherObj::getRAH1
PUBLIC	?printRegisters@EtherObj@@QAEHH@Z		; EtherObj::printRegisters
EXTRN	?AOAprintHex@AOAProtected@@QAEHJH@Z:NEAR	; AOAProtected::AOAprintHex
_TEXT	SEGMENT
_line$ = 8
_this$ = -8
_retcode$ = -4
?printRegisters@EtherObj@@QAEHH@Z PROC NEAR		; EtherObj::printRegisters
; Line 207
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 208
	mov	DWORD PTR _retcode$[ebp], 0
; Line 210
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getECompatibility@EtherObj@@QAEHXZ	; EtherObj::getECompatibility
	mov	DWORD PTR _retcode$[ebp], eax
; Line 211
	mov	eax, DWORD PTR _line$[ebp]
	push	eax
	mov	ecx, DWORD PTR _retcode$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 213
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getEDeviceId@EtherObj@@QAEHXZ		; EtherObj::getEDeviceId
	mov	DWORD PTR _retcode$[ebp], eax
; Line 214
	mov	edx, DWORD PTR _line$[ebp]
	add	edx, 20					; 00000014H
	push	edx
	mov	eax, DWORD PTR _retcode$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 216
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getEVendorId@EtherObj@@QAEHXZ		; EtherObj::getEVendorId
	mov	DWORD PTR _retcode$[ebp], eax
; Line 217
	mov	ecx, DWORD PTR _line$[ebp]
	add	ecx, 40					; 00000028H
	push	ecx
	mov	edx, DWORD PTR _retcode$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 219
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getEInitCtrl1@EtherObj@@QAEHXZ		; EtherObj::getEInitCtrl1
	mov	DWORD PTR _retcode$[ebp], eax
; Line 220
	mov	eax, DWORD PTR _line$[ebp]
	add	eax, 60					; 0000003cH
	push	eax
	mov	ecx, DWORD PTR _retcode$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 222
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getEInitCtrl2@EtherObj@@QAEHXZ		; EtherObj::getEInitCtrl2
	mov	DWORD PTR _retcode$[ebp], eax
; Line 223
	mov	edx, DWORD PTR _line$[ebp]
	add	edx, 80					; 00000050H
	push	edx
	mov	eax, DWORD PTR _retcode$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 225
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getEInitCtrl3@EtherObj@@QAEHXZ		; EtherObj::getEInitCtrl3
	mov	DWORD PTR _retcode$[ebp], eax
; Line 226
	mov	ecx, DWORD PTR _line$[ebp]
	add	ecx, 100				; 00000064H
	push	ecx
	mov	edx, DWORD PTR _retcode$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 228
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getEMgmtCtrl@EtherObj@@QAEHXZ		; EtherObj::getEMgmtCtrl
	mov	DWORD PTR _retcode$[ebp], eax
; Line 229
	mov	eax, DWORD PTR _line$[ebp]
	add	eax, 120				; 00000078H
	push	eax
	mov	ecx, DWORD PTR _retcode$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 231
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getEIPv4Byte01@EtherObj@@QAEHXZ	; EtherObj::getEIPv4Byte01
	mov	DWORD PTR _retcode$[ebp], eax
; Line 232
	mov	edx, DWORD PTR _line$[ebp]
	add	edx, 160				; 000000a0H
	push	edx
	mov	eax, DWORD PTR _retcode$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 234
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getEIPv4Byte23@EtherObj@@QAEHXZ	; EtherObj::getEIPv4Byte23
	mov	DWORD PTR _retcode$[ebp], eax
; Line 235
	mov	ecx, DWORD PTR _line$[ebp]
	add	ecx, 180				; 000000b4H
	push	ecx
	mov	edx, DWORD PTR _retcode$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 237
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getControl@EtherObj@@QAEHXZ		; EtherObj::getControl
	mov	DWORD PTR _retcode$[ebp], eax
; Line 238
	mov	eax, DWORD PTR _line$[ebp]
	add	eax, 200				; 000000c8H
	push	eax
	mov	ecx, DWORD PTR _retcode$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 240
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getStatus@EtherObj@@QAEHXZ		; EtherObj::getStatus
	mov	DWORD PTR _retcode$[ebp], eax
; Line 241
	mov	edx, DWORD PTR _line$[ebp]
	add	edx, 220				; 000000dcH
	push	edx
	mov	eax, DWORD PTR _retcode$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 243
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getMdicPhyCtrl@EtherObj@@QAEHXZ	; EtherObj::getMdicPhyCtrl
	mov	DWORD PTR _retcode$[ebp], eax
; Line 244
	mov	ecx, DWORD PTR _line$[ebp]
	add	ecx, 240				; 000000f0H
	push	ecx
	mov	edx, DWORD PTR _retcode$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 246
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getMdicPhyStat@EtherObj@@QAEHXZ	; EtherObj::getMdicPhyStat
	mov	DWORD PTR _retcode$[ebp], eax
; Line 247
	mov	eax, DWORD PTR _line$[ebp]
	add	eax, 260				; 00000104H
	push	eax
	mov	ecx, DWORD PTR _retcode$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 249
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getInterruptMaskSet@EtherObj@@QAEHXZ	; EtherObj::getInterruptMaskSet
	mov	DWORD PTR _retcode$[ebp], eax
; Line 250
	mov	edx, DWORD PTR _line$[ebp]
	add	edx, 280				; 00000118H
	push	edx
	mov	eax, DWORD PTR _retcode$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 252
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getInterruptMaskClear@EtherObj@@QAEHXZ	; EtherObj::getInterruptMaskClear
	mov	DWORD PTR _retcode$[ebp], eax
; Line 253
	mov	ecx, DWORD PTR _line$[ebp]
	add	ecx, 320				; 00000140H
	push	ecx
	mov	edx, DWORD PTR _retcode$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 255
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getTDBALow@EtherObj@@QAEHXZ		; EtherObj::getTDBALow
	mov	DWORD PTR _retcode$[ebp], eax
; Line 256
	mov	eax, DWORD PTR _line$[ebp]
	add	eax, 340				; 00000154H
	push	eax
	mov	ecx, DWORD PTR _retcode$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 258
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getTDBAHigh@EtherObj@@QAEHXZ		; EtherObj::getTDBAHigh
	mov	DWORD PTR _retcode$[ebp], eax
; Line 259
	mov	edx, DWORD PTR _line$[ebp]
	add	edx, 360				; 00000168H
	push	edx
	mov	eax, DWORD PTR _retcode$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 261
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getTDLen@EtherObj@@QAEHXZ		; EtherObj::getTDLen
	mov	DWORD PTR _retcode$[ebp], eax
; Line 262
	mov	ecx, DWORD PTR _line$[ebp]
	add	ecx, 380				; 0000017cH
	push	ecx
	mov	edx, DWORD PTR _retcode$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 264
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getTDHead@EtherObj@@QAEHXZ		; EtherObj::getTDHead
	mov	DWORD PTR _retcode$[ebp], eax
; Line 265
	mov	eax, DWORD PTR _line$[ebp]
	add	eax, 400				; 00000190H
	push	eax
	mov	ecx, DWORD PTR _retcode$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 267
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getTDTail@EtherObj@@QAEHXZ		; EtherObj::getTDTail
	mov	DWORD PTR _retcode$[ebp], eax
; Line 268
	mov	edx, DWORD PTR _line$[ebp]
	add	edx, 420				; 000001a4H
	push	edx
	mov	eax, DWORD PTR _retcode$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 270
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getTCtrl@EtherObj@@QAEHXZ		; EtherObj::getTCtrl
	mov	DWORD PTR _retcode$[ebp], eax
; Line 271
	mov	ecx, DWORD PTR _line$[ebp]
	add	ecx, 440				; 000001b8H
	push	ecx
	mov	edx, DWORD PTR _retcode$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 273
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRAL0@EtherObj@@QAEHXZ		; EtherObj::getRAL0
	mov	DWORD PTR _retcode$[ebp], eax
; Line 274
	mov	eax, DWORD PTR _line$[ebp]
	add	eax, 480				; 000001e0H
	push	eax
	mov	ecx, DWORD PTR _retcode$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 276
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRAH0@EtherObj@@QAEHXZ		; EtherObj::getRAH0
	mov	DWORD PTR _retcode$[ebp], eax
; Line 277
	mov	edx, DWORD PTR _line$[ebp]
	add	edx, 500				; 000001f4H
	push	edx
	mov	eax, DWORD PTR _retcode$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 279
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRAL1@EtherObj@@QAEHXZ		; EtherObj::getRAL1
	mov	DWORD PTR _retcode$[ebp], eax
; Line 280
	mov	ecx, DWORD PTR _line$[ebp]
	add	ecx, 520				; 00000208H
	push	ecx
	mov	edx, DWORD PTR _retcode$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 282
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRAH1@EtherObj@@QAEHXZ		; EtherObj::getRAH1
	mov	DWORD PTR _retcode$[ebp], eax
; Line 283
	mov	eax, DWORD PTR _line$[ebp]
	add	eax, 540				; 0000021cH
	push	eax
	mov	ecx, DWORD PTR _retcode$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 285
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 286
	mov	esp, ebp
	pop	ebp
	ret	4
?printRegisters@EtherObj@@QAEHH@Z ENDP			; EtherObj::printRegisters
_TEXT	ENDS
PUBLIC	?getMAC@EtherObj@@QAEXPAD@Z			; EtherObj::getMAC
_TEXT	SEGMENT
_dMAC$ = 8
_this$ = -8
_i$ = -4
?getMAC@EtherObj@@QAEXPAD@Z PROC NEAR			; EtherObj::getMAC
; Line 293
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 294
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1160
$L1161:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L1160:
	cmp	DWORD PTR _i$[ebp], 6
	jge	SHORT $L1162
; Line 295
	mov	ecx, DWORD PTR _dMAC$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	mov	al, BYTE PTR ?mac@EtherObj@@2PADA[edx]
	mov	BYTE PTR [ecx], al
	jmp	SHORT $L1161
$L1162:
; Line 296
	mov	esp, ebp
	pop	ebp
	ret	4
?getMAC@EtherObj@@QAEXPAD@Z ENDP			; EtherObj::getMAC
_TEXT	ENDS
PUBLIC	?getMACEPROM@EtherObj@@QAEXPAD@Z		; EtherObj::getMACEPROM
PUBLIC	?getRegister32@EtherObj@@QAEHK@Z		; EtherObj::getRegister32
PUBLIC	?setRegister32@EtherObj@@QAEXHK@Z		; EtherObj::setRegister32
_TEXT	SEGMENT
_dMAC$ = 8
_this$ = -16
_retcode$ = -4
_i$ = -12
_temp$ = -8
?getMACEPROM@EtherObj@@QAEXPAD@Z PROC NEAR		; EtherObj::getMACEPROM
; Line 307
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	mov	DWORD PTR _this$[ebp], ecx
; Line 308
	mov	DWORD PTR _retcode$[ebp], 0
; Line 309
	mov	DWORD PTR _i$[ebp], 0
; Line 310
	mov	DWORD PTR _temp$[ebp], 0
; Line 326
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	20					; 00000014H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 332
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	push	1
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
$L1170:
; Line 336
	mov	edx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 337
	mov	eax, DWORD PTR _retcode$[ebp]
	and	eax, 16					; 00000010H
	test	eax, eax
	je	SHORT $L1170
; Line 339
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 341
	mov	edx, DWORD PTR _retcode$[ebp]
	and	edx, 16711680				; 00ff0000H
	sar	edx, 16					; 00000010H
	mov	BYTE PTR ?mac@EtherObj@@2PADA, dl
; Line 342
	mov	eax, DWORD PTR _retcode$[ebp]
	and	eax, -16777216				; ff000000H
	shr	eax, 24					; 00000018H
	mov	BYTE PTR ?mac@EtherObj@@2PADA+1, al
; Line 348
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	push	257					; 00000101H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
$L1173:
; Line 352
	mov	edx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 353
	mov	eax, DWORD PTR _retcode$[ebp]
	and	eax, 16					; 00000010H
	test	eax, eax
	je	SHORT $L1173
; Line 355
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 357
	mov	edx, DWORD PTR _retcode$[ebp]
	and	edx, 16711680				; 00ff0000H
	sar	edx, 16					; 00000010H
	mov	BYTE PTR ?mac@EtherObj@@2PADA+2, dl
; Line 358
	mov	eax, DWORD PTR _retcode$[ebp]
	and	eax, -16777216				; ff000000H
	shr	eax, 24					; 00000018H
	mov	BYTE PTR ?mac@EtherObj@@2PADA+3, al
; Line 364
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	push	513					; 00000201H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
$L1176:
; Line 368
	mov	edx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 369
	mov	eax, DWORD PTR _retcode$[ebp]
	and	eax, 16					; 00000010H
	test	eax, eax
	je	SHORT $L1176
; Line 371
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 373
	mov	edx, DWORD PTR _retcode$[ebp]
	and	edx, 16711680				; 00ff0000H
	sar	edx, 16					; 00000010H
	mov	BYTE PTR ?mac@EtherObj@@2PADA+4, dl
; Line 374
	mov	eax, DWORD PTR _retcode$[ebp]
	and	eax, -16777216				; ff000000H
	shr	eax, 24					; 00000018H
	mov	BYTE PTR ?mac@EtherObj@@2PADA+5, al
; Line 377
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1179
$L1180:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L1179:
	cmp	DWORD PTR _i$[ebp], 6
	jge	SHORT $L1181
; Line 378
	mov	edx, DWORD PTR _dMAC$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	mov	cl, BYTE PTR ?mac@EtherObj@@2PADA[eax]
	mov	BYTE PTR [edx], cl
	jmp	SHORT $L1180
$L1181:
; Line 380
	mov	DWORD PTR _temp$[ebp], 0
; Line 382
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1182
$L1183:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L1182:
	cmp	DWORD PTR _i$[ebp], 4
	jge	SHORT $L1184
; Line 384
	mov	eax, DWORD PTR _i$[ebp]
	movsx	ecx, BYTE PTR ?mac@EtherObj@@2PADA[eax]
	and	ecx, 255				; 000000ffH
	mov	edx, DWORD PTR _temp$[ebp]
	or	edx, ecx
	mov	DWORD PTR _temp$[ebp], edx
; Line 385
	cmp	DWORD PTR _i$[ebp], 3
	jge	SHORT $L1185
; Line 387
	mov	eax, DWORD PTR _temp$[ebp]
	shl	eax, 8
	mov	DWORD PTR _temp$[ebp], eax
$L1185:
; Line 389
	jmp	SHORT $L1183
$L1184:
; Line 390
	push	3900					; 00000f3cH
	mov	ecx, DWORD PTR _temp$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 392
	mov	DWORD PTR _temp$[ebp], 0
; Line 394
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1186
$L1187:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L1186:
	cmp	DWORD PTR _i$[ebp], 2
	jge	SHORT $L1188
; Line 396
	mov	eax, DWORD PTR _i$[ebp]
	movsx	ecx, BYTE PTR ?mac@EtherObj@@2PADA[eax+4]
	and	ecx, 255				; 000000ffH
	mov	edx, DWORD PTR _temp$[ebp]
	or	edx, ecx
	mov	DWORD PTR _temp$[ebp], edx
; Line 397
	mov	eax, DWORD PTR _temp$[ebp]
	shl	eax, 8
	mov	DWORD PTR _temp$[ebp], eax
; Line 398
	jmp	SHORT $L1187
$L1188:
; Line 400
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1189
$L1190:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L1189:
	cmp	DWORD PTR _i$[ebp], 2
	jge	SHORT $L1191
; Line 402
	mov	edx, DWORD PTR _temp$[ebp]
	or	dl, -1
	mov	DWORD PTR _temp$[ebp], edx
; Line 403
	cmp	DWORD PTR _i$[ebp], 1
	jge	SHORT $L1192
; Line 405
	mov	eax, DWORD PTR _temp$[ebp]
	shl	eax, 8
	mov	DWORD PTR _temp$[ebp], eax
$L1192:
; Line 407
	jmp	SHORT $L1190
$L1191:
; Line 409
	push	3920					; 00000f50H
	mov	ecx, DWORD PTR _temp$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 410
	mov	esp, ebp
	pop	ebp
	ret	4
?getMACEPROM@EtherObj@@QAEXPAD@Z ENDP			; EtherObj::getMACEPROM
_TEXT	ENDS
EXTRN	_cigetRegister32:NEAR
_TEXT	SEGMENT
_iobase$ = 8
_this$ = -4
?getRegister32@EtherObj@@QAEHK@Z PROC NEAR		; EtherObj::getRegister32
; Line 416
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 417
	mov	eax, DWORD PTR _iobase$[ebp]
	push	eax
	call	_cigetRegister32
	add	esp, 4
; Line 418
	mov	esp, ebp
	pop	ebp
	ret	4
?getRegister32@EtherObj@@QAEHK@Z ENDP			; EtherObj::getRegister32
_TEXT	ENDS
EXTRN	_cisetRegister32:NEAR
_TEXT	SEGMENT
_value$ = 8
_iobase$ = 12
_this$ = -4
?setRegister32@EtherObj@@QAEXHK@Z PROC NEAR		; EtherObj::setRegister32
; Line 424
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 425
	mov	eax, DWORD PTR _iobase$[ebp]
	push	eax
	mov	ecx, DWORD PTR _value$[ebp]
	push	ecx
	call	_cisetRegister32
	add	esp, 8
; Line 426
	mov	esp, ebp
	pop	ebp
	ret	8
?setRegister32@EtherObj@@QAEXHK@Z ENDP			; EtherObj::setRegister32
_this$ = -8
_retcode$ = -4
?getECompatibility@EtherObj@@QAEHXZ PROC NEAR		; EtherObj::getECompatibility
; Line 433
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 434
	mov	DWORD PTR _retcode$[ebp], 0
; Line 438
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	20					; 00000014H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 442
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	push	769					; 00000301H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
$L1206:
; Line 446
	mov	edx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 447
	mov	eax, DWORD PTR _retcode$[ebp]
	and	eax, 16					; 00000010H
	test	eax, eax
	je	SHORT $L1206
; Line 449
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 451
	mov	edx, DWORD PTR _retcode$[ebp]
	and	edx, -65536				; ffff0000H
	mov	DWORD PTR _retcode$[ebp], edx
; Line 452
	mov	eax, DWORD PTR _retcode$[ebp]
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _retcode$[ebp], eax
; Line 454
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 455
	mov	esp, ebp
	pop	ebp
	ret	0
?getECompatibility@EtherObj@@QAEHXZ ENDP		; EtherObj::getECompatibility
_this$ = -8
_retcode$ = -4
?getEDeviceId@EtherObj@@QAEHXZ PROC NEAR		; EtherObj::getEDeviceId
; Line 462
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 463
	mov	DWORD PTR _retcode$[ebp], 0
; Line 467
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	20					; 00000014H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 472
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	push	3329					; 00000d01H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
$L1213:
; Line 476
	mov	edx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 477
	mov	eax, DWORD PTR _retcode$[ebp]
	and	eax, 16					; 00000010H
	test	eax, eax
	je	SHORT $L1213
; Line 479
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 481
	mov	edx, DWORD PTR _retcode$[ebp]
	and	edx, -65536				; ffff0000H
	mov	DWORD PTR _retcode$[ebp], edx
; Line 482
	mov	eax, DWORD PTR _retcode$[ebp]
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _retcode$[ebp], eax
; Line 484
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 485
	mov	esp, ebp
	pop	ebp
	ret	0
?getEDeviceId@EtherObj@@QAEHXZ ENDP			; EtherObj::getEDeviceId
_this$ = -8
_retcode$ = -4
?getEVendorId@EtherObj@@QAEHXZ PROC NEAR		; EtherObj::getEVendorId
; Line 492
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 493
	mov	DWORD PTR _retcode$[ebp], 0
; Line 497
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	20					; 00000014H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 502
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	push	3585					; 00000e01H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
$L1220:
; Line 506
	mov	edx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 507
	mov	eax, DWORD PTR _retcode$[ebp]
	and	eax, 16					; 00000010H
	test	eax, eax
	je	SHORT $L1220
; Line 509
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 511
	mov	edx, DWORD PTR _retcode$[ebp]
	and	edx, -65536				; ffff0000H
	mov	DWORD PTR _retcode$[ebp], edx
; Line 512
	mov	eax, DWORD PTR _retcode$[ebp]
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _retcode$[ebp], eax
; Line 514
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 515
	mov	esp, ebp
	pop	ebp
	ret	0
?getEVendorId@EtherObj@@QAEHXZ ENDP			; EtherObj::getEVendorId
_this$ = -8
_retcode$ = -4
?getEInitCtrl1@EtherObj@@QAEHXZ PROC NEAR		; EtherObj::getEInitCtrl1
; Line 523
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 524
	mov	DWORD PTR _retcode$[ebp], 0
; Line 528
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	20					; 00000014H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 533
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	push	2561					; 00000a01H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
$L1227:
; Line 537
	mov	edx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 538
	mov	eax, DWORD PTR _retcode$[ebp]
	and	eax, 16					; 00000010H
	test	eax, eax
	je	SHORT $L1227
; Line 540
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 542
	mov	edx, DWORD PTR _retcode$[ebp]
	and	edx, -65536				; ffff0000H
	mov	DWORD PTR _retcode$[ebp], edx
; Line 543
	mov	eax, DWORD PTR _retcode$[ebp]
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _retcode$[ebp], eax
; Line 545
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 546
	mov	esp, ebp
	pop	ebp
	ret	0
?getEInitCtrl1@EtherObj@@QAEHXZ ENDP			; EtherObj::getEInitCtrl1
_this$ = -8
_retcode$ = -4
?getEInitCtrl2@EtherObj@@QAEHXZ PROC NEAR		; EtherObj::getEInitCtrl2
; Line 553
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 554
	mov	DWORD PTR _retcode$[ebp], 0
; Line 558
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	20					; 00000014H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 563
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	push	3841					; 00000f01H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
$L1234:
; Line 567
	mov	edx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 568
	mov	eax, DWORD PTR _retcode$[ebp]
	and	eax, 16					; 00000010H
	test	eax, eax
	je	SHORT $L1234
; Line 570
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 572
	mov	edx, DWORD PTR _retcode$[ebp]
	and	edx, -65536				; ffff0000H
	mov	DWORD PTR _retcode$[ebp], edx
; Line 573
	mov	eax, DWORD PTR _retcode$[ebp]
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _retcode$[ebp], eax
; Line 575
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 576
	mov	esp, ebp
	pop	ebp
	ret	0
?getEInitCtrl2@EtherObj@@QAEHXZ ENDP			; EtherObj::getEInitCtrl2
_this$ = -8
_retcode$ = -4
?getEMgmtCtrl@EtherObj@@QAEHXZ PROC NEAR		; EtherObj::getEMgmtCtrl
; Line 583
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 584
	mov	DWORD PTR _retcode$[ebp], 0
; Line 588
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	20					; 00000014H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 593
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	push	8961					; 00002301H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
$L1241:
; Line 597
	mov	edx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 598
	mov	eax, DWORD PTR _retcode$[ebp]
	and	eax, 16					; 00000010H
	test	eax, eax
	je	SHORT $L1241
; Line 600
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 602
	mov	edx, DWORD PTR _retcode$[ebp]
	and	edx, -65536				; ffff0000H
	mov	DWORD PTR _retcode$[ebp], edx
; Line 603
	mov	eax, DWORD PTR _retcode$[ebp]
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _retcode$[ebp], eax
; Line 605
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 606
	mov	esp, ebp
	pop	ebp
	ret	0
?getEMgmtCtrl@EtherObj@@QAEHXZ ENDP			; EtherObj::getEMgmtCtrl
_this$ = -8
_retcode$ = -4
?getEInitCtrl3@EtherObj@@QAEHXZ PROC NEAR		; EtherObj::getEInitCtrl3
; Line 613
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 614
	mov	DWORD PTR _retcode$[ebp], 0
; Line 618
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	20					; 00000014H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 623
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	push	9217					; 00002401H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
$L1248:
; Line 627
	mov	edx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 628
	mov	eax, DWORD PTR _retcode$[ebp]
	and	eax, 16					; 00000010H
	test	eax, eax
	je	SHORT $L1248
; Line 630
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 632
	mov	edx, DWORD PTR _retcode$[ebp]
	and	edx, -65536				; ffff0000H
	mov	DWORD PTR _retcode$[ebp], edx
; Line 633
	mov	eax, DWORD PTR _retcode$[ebp]
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _retcode$[ebp], eax
; Line 635
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 636
	mov	esp, ebp
	pop	ebp
	ret	0
?getEInitCtrl3@EtherObj@@QAEHXZ ENDP			; EtherObj::getEInitCtrl3
_this$ = -8
_retcode$ = -4
?getEIPv4Byte01@EtherObj@@QAEHXZ PROC NEAR		; EtherObj::getEIPv4Byte01
; Line 643
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 644
	mov	DWORD PTR _retcode$[ebp], 0
; Line 648
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	20					; 00000014H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 653
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	push	9473					; 00002501H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
$L1255:
; Line 657
	mov	edx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 658
	mov	eax, DWORD PTR _retcode$[ebp]
	and	eax, 16					; 00000010H
	test	eax, eax
	je	SHORT $L1255
; Line 660
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 662
	mov	edx, DWORD PTR _retcode$[ebp]
	and	edx, -65536				; ffff0000H
	mov	DWORD PTR _retcode$[ebp], edx
; Line 663
	mov	eax, DWORD PTR _retcode$[ebp]
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _retcode$[ebp], eax
; Line 665
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 666
	mov	esp, ebp
	pop	ebp
	ret	0
?getEIPv4Byte01@EtherObj@@QAEHXZ ENDP			; EtherObj::getEIPv4Byte01
_this$ = -8
_retcode$ = -4
?getEIPv4Byte23@EtherObj@@QAEHXZ PROC NEAR		; EtherObj::getEIPv4Byte23
; Line 673
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 674
	mov	DWORD PTR _retcode$[ebp], 0
; Line 678
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	20					; 00000014H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 683
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	push	9729					; 00002601H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
$L1262:
; Line 687
	mov	edx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 688
	mov	eax, DWORD PTR _retcode$[ebp]
	and	eax, 16					; 00000010H
	test	eax, eax
	je	SHORT $L1262
; Line 690
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 692
	mov	edx, DWORD PTR _retcode$[ebp]
	and	edx, -65536				; ffff0000H
	mov	DWORD PTR _retcode$[ebp], edx
; Line 693
	mov	eax, DWORD PTR _retcode$[ebp]
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _retcode$[ebp], eax
; Line 695
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 696
	mov	esp, ebp
	pop	ebp
	ret	0
?getEIPv4Byte23@EtherObj@@QAEHXZ ENDP			; EtherObj::getEIPv4Byte23
_this$ = -8
_retcode$ = -4
?getControl@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::getControl
; Line 703
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 704
	mov	DWORD PTR _retcode$[ebp], 0
; Line 707
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	0
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 709
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 711
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 712
	mov	esp, ebp
	pop	ebp
	ret	0
?getControl@EtherObj@@QAEHXZ ENDP			; EtherObj::getControl
_this$ = -8
_retcode$ = -4
?getStatus@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::getStatus
; Line 719
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 720
	mov	DWORD PTR _retcode$[ebp], 0
; Line 723
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	8
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 725
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 727
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 728
	mov	esp, ebp
	pop	ebp
	ret	0
?getStatus@EtherObj@@QAEHXZ ENDP			; EtherObj::getStatus
_this$ = -8
_retcode$ = -4
?getMdicPhyCtrl@EtherObj@@QAEHXZ PROC NEAR		; EtherObj::getMdicPhyCtrl
; Line 735
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 736
	mov	DWORD PTR _retcode$[ebp], 0
; Line 740
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	32					; 00000020H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 753
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	push	136314880				; 08200000H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
$L1277:
; Line 757
	mov	edx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 758
	mov	eax, DWORD PTR _retcode$[ebp]
	and	eax, 268435456				; 10000000H
	test	eax, eax
	je	SHORT $L1277
; Line 760
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 762
	mov	edx, DWORD PTR _retcode$[ebp]
	and	edx, 65535				; 0000ffffH
	mov	DWORD PTR _retcode$[ebp], edx
; Line 764
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 765
	mov	esp, ebp
	pop	ebp
	ret	0
?getMdicPhyCtrl@EtherObj@@QAEHXZ ENDP			; EtherObj::getMdicPhyCtrl
_this$ = -8
_retcode$ = -4
?getMdicPhyStat@EtherObj@@QAEHXZ PROC NEAR		; EtherObj::getMdicPhyStat
; Line 772
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 773
	mov	DWORD PTR _retcode$[ebp], 0
; Line 777
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	32					; 00000020H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 790
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	push	136380416				; 08210000H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
$L1284:
; Line 794
	mov	edx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 795
	mov	eax, DWORD PTR _retcode$[ebp]
	and	eax, 268435456				; 10000000H
	test	eax, eax
	je	SHORT $L1284
; Line 797
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 799
	mov	edx, DWORD PTR _retcode$[ebp]
	and	edx, 65535				; 0000ffffH
	mov	DWORD PTR _retcode$[ebp], edx
; Line 801
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 802
	mov	esp, ebp
	pop	ebp
	ret	0
?getMdicPhyStat@EtherObj@@QAEHXZ ENDP			; EtherObj::getMdicPhyStat
_this$ = -8
_retcode$ = -4
?getInterruptMaskSet@EtherObj@@QAEHXZ PROC NEAR		; EtherObj::getInterruptMaskSet
; Line 809
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 810
	mov	DWORD PTR _retcode$[ebp], 0
; Line 813
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	208					; 000000d0H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 820
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 822
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 823
	mov	esp, ebp
	pop	ebp
	ret	0
?getInterruptMaskSet@EtherObj@@QAEHXZ ENDP		; EtherObj::getInterruptMaskSet
_this$ = -8
_retcode$ = -4
?getInterruptMaskClear@EtherObj@@QAEHXZ PROC NEAR	; EtherObj::getInterruptMaskClear
; Line 830
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 831
	mov	DWORD PTR _retcode$[ebp], 0
; Line 834
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	216					; 000000d8H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 841
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 843
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 844
	mov	esp, ebp
	pop	ebp
	ret	0
?getInterruptMaskClear@EtherObj@@QAEHXZ ENDP		; EtherObj::getInterruptMaskClear
_this$ = -8
_retcode$ = -4
?getTDBALow@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::getTDBALow
; Line 851
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 852
	mov	DWORD PTR _retcode$[ebp], 0
; Line 855
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	14336					; 00003800H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 863
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 865
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 866
	mov	esp, ebp
	pop	ebp
	ret	0
?getTDBALow@EtherObj@@QAEHXZ ENDP			; EtherObj::getTDBALow
_TEXT	ENDS
PUBLIC	?getRDBALow@EtherObj@@QAEHXZ			; EtherObj::getRDBALow
_TEXT	SEGMENT
_this$ = -8
_retcode$ = -4
?getRDBALow@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::getRDBALow
; Line 873
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 874
	mov	DWORD PTR _retcode$[ebp], 0
; Line 877
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	10240					; 00002800H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 885
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 887
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 888
	mov	esp, ebp
	pop	ebp
	ret	0
?getRDBALow@EtherObj@@QAEHXZ ENDP			; EtherObj::getRDBALow
_addr$ = 8
_this$ = -12
_retcode$ = -4
_temp$ = -8
?setTDBALow@EtherObj@@QAEHH@Z PROC NEAR			; EtherObj::setTDBALow
; Line 895
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 896
	mov	DWORD PTR _retcode$[ebp], 0
; Line 897
	mov	DWORD PTR _temp$[ebp], 0
; Line 900
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	14336					; 00003800H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 909
	mov	ecx, DWORD PTR _addr$[ebp]
	mov	DWORD PTR _temp$[ebp], ecx
; Line 910
	mov	edx, DWORD PTR _temp$[ebp]
	and	edx, -16				; fffffff0H
	mov	DWORD PTR _temp$[ebp], edx
; Line 912
	mov	eax, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	eax
	mov	ecx, DWORD PTR _temp$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 914
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 915
	mov	esp, ebp
	pop	ebp
	ret	4
?setTDBALow@EtherObj@@QAEHH@Z ENDP			; EtherObj::setTDBALow
_addr$ = 8
_this$ = -12
_retcode$ = -4
_temp$ = -8
?setRDBALow@EtherObj@@QAEHH@Z PROC NEAR			; EtherObj::setRDBALow
; Line 922
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 923
	mov	DWORD PTR _retcode$[ebp], 0
; Line 924
	mov	DWORD PTR _temp$[ebp], 0
; Line 927
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	10240					; 00002800H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 936
	mov	ecx, DWORD PTR _addr$[ebp]
	mov	DWORD PTR _temp$[ebp], ecx
; Line 937
	mov	edx, DWORD PTR _temp$[ebp]
	and	edx, -16				; fffffff0H
	mov	DWORD PTR _temp$[ebp], edx
; Line 939
	mov	eax, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	eax
	mov	ecx, DWORD PTR _temp$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 941
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 942
	mov	esp, ebp
	pop	ebp
	ret	4
?setRDBALow@EtherObj@@QAEHH@Z ENDP			; EtherObj::setRDBALow
_this$ = -8
_retcode$ = -4
?getTDBAHigh@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::getTDBAHigh
; Line 949
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 950
	mov	DWORD PTR _retcode$[ebp], 0
; Line 953
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	14340					; 00003804H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 960
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 962
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 963
	mov	esp, ebp
	pop	ebp
	ret	0
?getTDBAHigh@EtherObj@@QAEHXZ ENDP			; EtherObj::getTDBAHigh
_TEXT	ENDS
PUBLIC	?getRDBAHigh@EtherObj@@QAEHXZ			; EtherObj::getRDBAHigh
_TEXT	SEGMENT
_this$ = -8
_retcode$ = -4
?getRDBAHigh@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::getRDBAHigh
; Line 970
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 971
	mov	DWORD PTR _retcode$[ebp], 0
; Line 974
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	10244					; 00002804H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 981
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 983
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 984
	mov	esp, ebp
	pop	ebp
	ret	0
?getRDBAHigh@EtherObj@@QAEHXZ ENDP			; EtherObj::getRDBAHigh
_addr$ = 8
_this$ = -8
_retcode$ = -4
?setTDBAHigh@EtherObj@@QAEHH@Z PROC NEAR		; EtherObj::setTDBAHigh
; Line 991
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 992
	mov	DWORD PTR _retcode$[ebp], 0
; Line 995
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	14340					; 00003804H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 1002
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	edx, DWORD PTR _addr$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 1004
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 1005
	mov	esp, ebp
	pop	ebp
	ret	4
?setTDBAHigh@EtherObj@@QAEHH@Z ENDP			; EtherObj::setTDBAHigh
_addr$ = 8
_this$ = -8
_retcode$ = -4
?setRDBAHigh@EtherObj@@QAEHH@Z PROC NEAR		; EtherObj::setRDBAHigh
; Line 1012
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 1013
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1016
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	10244					; 00002804H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 1023
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	edx, DWORD PTR _addr$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 1025
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 1026
	mov	esp, ebp
	pop	ebp
	ret	4
?setRDBAHigh@EtherObj@@QAEHH@Z ENDP			; EtherObj::setRDBAHigh
_this$ = -8
_retcode$ = -4
?getTDLen@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::getTDLen
; Line 1033
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 1034
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1037
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	14344					; 00003808H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 1048
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 1050
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 1051
	mov	esp, ebp
	pop	ebp
	ret	0
?getTDLen@EtherObj@@QAEHXZ ENDP				; EtherObj::getTDLen
_TEXT	ENDS
PUBLIC	?getRDLen@EtherObj@@QAEHXZ			; EtherObj::getRDLen
_TEXT	SEGMENT
_this$ = -8
_retcode$ = -4
?getRDLen@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::getRDLen
; Line 1058
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 1059
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1062
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	10248					; 00002808H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 1073
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 1075
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 1076
	mov	esp, ebp
	pop	ebp
	ret	0
?getRDLen@EtherObj@@QAEHXZ ENDP				; EtherObj::getRDLen
_len$ = 8
_this$ = -12
_retcode$ = -4
_temp$ = -8
?setTDLen@EtherObj@@QAEHH@Z PROC NEAR			; EtherObj::setTDLen
; Line 1083
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 1084
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1085
	mov	DWORD PTR _temp$[ebp], 0
; Line 1088
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	14344					; 00003808H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 1102
	mov	ecx, DWORD PTR _len$[ebp]
	mov	DWORD PTR _temp$[ebp], ecx
; Line 1103
	mov	edx, DWORD PTR _temp$[ebp]
	and	edx, 8191				; 00001fffH
	mov	DWORD PTR _temp$[ebp], edx
; Line 1104
	mov	eax, DWORD PTR _temp$[ebp]
	shl	eax, 7
	mov	DWORD PTR _temp$[ebp], eax
; Line 1106
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	edx, DWORD PTR _temp$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 1108
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 1109
	mov	esp, ebp
	pop	ebp
	ret	4
?setTDLen@EtherObj@@QAEHH@Z ENDP			; EtherObj::setTDLen
_len$ = 8
_this$ = -12
_retcode$ = -4
_temp$ = -8
?setRDLen@EtherObj@@QAEHH@Z PROC NEAR			; EtherObj::setRDLen
; Line 1116
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 1117
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1118
	mov	DWORD PTR _temp$[ebp], 0
; Line 1121
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	10248					; 00002808H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 1135
	mov	ecx, DWORD PTR _len$[ebp]
	mov	DWORD PTR _temp$[ebp], ecx
; Line 1136
	mov	edx, DWORD PTR _temp$[ebp]
	and	edx, 8191				; 00001fffH
	mov	DWORD PTR _temp$[ebp], edx
; Line 1137
	mov	eax, DWORD PTR _temp$[ebp]
	shl	eax, 7
	mov	DWORD PTR _temp$[ebp], eax
; Line 1139
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	edx, DWORD PTR _temp$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 1141
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 1142
	mov	esp, ebp
	pop	ebp
	ret	4
?setRDLen@EtherObj@@QAEHH@Z ENDP			; EtherObj::setRDLen
_this$ = -8
_retcode$ = -4
?getTDHead@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::getTDHead
; Line 1149
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 1150
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1153
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	14352					; 00003810H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 1160
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 1162
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 1163
	mov	esp, ebp
	pop	ebp
	ret	0
?getTDHead@EtherObj@@QAEHXZ ENDP			; EtherObj::getTDHead
_TEXT	ENDS
PUBLIC	?getRDHead@EtherObj@@QAEHXZ			; EtherObj::getRDHead
_TEXT	SEGMENT
_this$ = -8
_retcode$ = -4
?getRDHead@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::getRDHead
; Line 1170
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 1171
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1174
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	10256					; 00002810H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 1181
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 1183
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 1184
	mov	esp, ebp
	pop	ebp
	ret	0
?getRDHead@EtherObj@@QAEHXZ ENDP			; EtherObj::getRDHead
_headindex$ = 8
_this$ = -12
_retcode$ = -4
_temp$ = -8
?setTDHead@EtherObj@@QAEHH@Z PROC NEAR			; EtherObj::setTDHead
; Line 1191
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 1192
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1193
	mov	DWORD PTR _temp$[ebp], 0
; Line 1196
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	14352					; 00003810H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 1204
	mov	ecx, DWORD PTR _headindex$[ebp]
	mov	DWORD PTR _temp$[ebp], ecx
; Line 1205
	mov	edx, DWORD PTR _temp$[ebp]
	and	edx, 65535				; 0000ffffH
	mov	DWORD PTR _temp$[ebp], edx
; Line 1207
	mov	eax, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	eax
	mov	ecx, DWORD PTR _temp$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 1209
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 1210
	mov	esp, ebp
	pop	ebp
	ret	4
?setTDHead@EtherObj@@QAEHH@Z ENDP			; EtherObj::setTDHead
_headindex$ = 8
_this$ = -12
_retcode$ = -4
_temp$ = -8
?setRDHead@EtherObj@@QAEHH@Z PROC NEAR			; EtherObj::setRDHead
; Line 1217
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 1218
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1219
	mov	DWORD PTR _temp$[ebp], 0
; Line 1222
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	10256					; 00002810H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 1230
	mov	ecx, DWORD PTR _headindex$[ebp]
	mov	DWORD PTR _temp$[ebp], ecx
; Line 1231
	mov	edx, DWORD PTR _temp$[ebp]
	and	edx, 65535				; 0000ffffH
	mov	DWORD PTR _temp$[ebp], edx
; Line 1233
	mov	eax, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	eax
	mov	ecx, DWORD PTR _temp$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 1235
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 1236
	mov	esp, ebp
	pop	ebp
	ret	4
?setRDHead@EtherObj@@QAEHH@Z ENDP			; EtherObj::setRDHead
_this$ = -8
_retcode$ = -4
?getTDTail@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::getTDTail
; Line 1243
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 1244
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1247
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	14360					; 00003818H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 1254
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 1256
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 1257
	mov	esp, ebp
	pop	ebp
	ret	0
?getTDTail@EtherObj@@QAEHXZ ENDP			; EtherObj::getTDTail
_TEXT	ENDS
PUBLIC	?getRDTail@EtherObj@@QAEHXZ			; EtherObj::getRDTail
_TEXT	SEGMENT
_this$ = -8
_retcode$ = -4
?getRDTail@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::getRDTail
; Line 1264
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 1265
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1268
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	10264					; 00002818H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 1275
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 1277
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 1278
	mov	esp, ebp
	pop	ebp
	ret	0
?getRDTail@EtherObj@@QAEHXZ ENDP			; EtherObj::getRDTail
_tailindex$ = 8
_this$ = -12
_retcode$ = -4
_temp$ = -8
?setTDTail@EtherObj@@QAEHH@Z PROC NEAR			; EtherObj::setTDTail
; Line 1285
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 1286
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1287
	mov	DWORD PTR _temp$[ebp], 0
; Line 1290
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	14360					; 00003818H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 1298
	mov	ecx, DWORD PTR _tailindex$[ebp]
	mov	DWORD PTR _temp$[ebp], ecx
; Line 1299
	mov	edx, DWORD PTR _temp$[ebp]
	and	edx, 65535				; 0000ffffH
	mov	DWORD PTR _temp$[ebp], edx
; Line 1301
	mov	eax, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	eax
	mov	ecx, DWORD PTR _temp$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 1303
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 1304
	mov	esp, ebp
	pop	ebp
	ret	4
?setTDTail@EtherObj@@QAEHH@Z ENDP			; EtherObj::setTDTail
_tailindex$ = 8
_this$ = -12
_retcode$ = -4
_temp$ = -8
?setRDTail@EtherObj@@QAEHH@Z PROC NEAR			; EtherObj::setRDTail
; Line 1311
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 1312
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1313
	mov	DWORD PTR _temp$[ebp], 0
; Line 1316
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	10264					; 00002818H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 1324
	mov	ecx, DWORD PTR _tailindex$[ebp]
	mov	DWORD PTR _temp$[ebp], ecx
; Line 1325
	mov	edx, DWORD PTR _temp$[ebp]
	and	edx, 65535				; 0000ffffH
	mov	DWORD PTR _temp$[ebp], edx
; Line 1327
	mov	eax, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	eax
	mov	ecx, DWORD PTR _temp$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 1329
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 1330
	mov	esp, ebp
	pop	ebp
	ret	4
?setRDTail@EtherObj@@QAEHH@Z ENDP			; EtherObj::setRDTail
_this$ = -8
_retcode$ = -4
?getTCtrl@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::getTCtrl
; Line 1337
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 1338
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1341
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	1024					; 00000400H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 1348
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 1350
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 1351
	mov	esp, ebp
	pop	ebp
	ret	0
?getTCtrl@EtherObj@@QAEHXZ ENDP				; EtherObj::getTCtrl
_TEXT	ENDS
PUBLIC	?getRCtrl@EtherObj@@QAEHXZ			; EtherObj::getRCtrl
_TEXT	SEGMENT
_this$ = -8
_retcode$ = -4
?getRCtrl@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::getRCtrl
; Line 1358
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 1359
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1362
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	256					; 00000100H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 1369
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 1371
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 1372
	mov	esp, ebp
	pop	ebp
	ret	0
?getRCtrl@EtherObj@@QAEHXZ ENDP				; EtherObj::getRCtrl
_TEXT	ENDS
PUBLIC	?setTCtrl@EtherObj@@QAEHH@Z			; EtherObj::setTCtrl
_TEXT	SEGMENT
_value$ = 8
_this$ = -8
_retcode$ = -4
?setTCtrl@EtherObj@@QAEHH@Z PROC NEAR			; EtherObj::setTCtrl
; Line 1379
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 1380
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1383
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	1024					; 00000400H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 1390
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	edx, DWORD PTR _value$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 1392
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 1393
	mov	esp, ebp
	pop	ebp
	ret	4
?setTCtrl@EtherObj@@QAEHH@Z ENDP			; EtherObj::setTCtrl
_TEXT	ENDS
PUBLIC	?setRCtrl@EtherObj@@QAEHH@Z			; EtherObj::setRCtrl
_TEXT	SEGMENT
_value$ = 8
_this$ = -8
_retcode$ = -4
?setRCtrl@EtherObj@@QAEHH@Z PROC NEAR			; EtherObj::setRCtrl
; Line 1400
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 1401
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1404
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	256					; 00000100H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 1411
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	edx, DWORD PTR _value$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 1413
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 1414
	mov	esp, ebp
	pop	ebp
	ret	4
?setRCtrl@EtherObj@@QAEHH@Z ENDP			; EtherObj::setRCtrl
_TEXT	ENDS
PUBLIC	?TEnable@EtherObj@@QAEHXZ			; EtherObj::TEnable
_TEXT	SEGMENT
_this$ = -8
_retcode$ = -4
?TEnable@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::TEnable
; Line 1421
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 1422
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1426
	push	2097394					; 002000f2H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setTCtrl@EtherObj@@QAEHH@Z		; EtherObj::setTCtrl
	mov	DWORD PTR _retcode$[ebp], eax
; Line 1428
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 1429
	mov	esp, ebp
	pop	ebp
	ret	0
?TEnable@EtherObj@@QAEHXZ ENDP				; EtherObj::TEnable
_TEXT	ENDS
PUBLIC	?REnable@EtherObj@@QAEHXZ			; EtherObj::REnable
_TEXT	SEGMENT
_this$ = -8
_retcode$ = -4
?REnable@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::REnable
; Line 1436
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 1437
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1449
	push	71335946				; 0440800aH
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRCtrl@EtherObj@@QAEHH@Z		; EtherObj::setRCtrl
	mov	DWORD PTR _retcode$[ebp], eax
; Line 1451
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 1452
	mov	esp, ebp
	pop	ebp
	ret	0
?REnable@EtherObj@@QAEHXZ ENDP				; EtherObj::REnable
_TEXT	ENDS
PUBLIC	?ColdReset@EtherObj@@QAEHXZ			; EtherObj::ColdReset
EXTRN	?AOAPrintText@AOAProtected@@QAEXPADH@Z:NEAR	; AOAProtected::AOAPrintText
_DATA	SEGMENT
$SG1426	DB	'Cold reset is successful', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -8
_retcode$ = -4
?ColdReset@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::ColdReset
; Line 1459
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 1460
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1466
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	0
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 1468
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	push	67108864				; 04000000H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 1470
	mov	edx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 1472
	mov	eax, DWORD PTR _retcode$[ebp]
	and	eax, 67108864				; 04000000H
	mov	DWORD PTR _retcode$[ebp], eax
$L1424:
; Line 1474
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L1425
; Line 1477
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 1478
	mov	edx, DWORD PTR _retcode$[ebp]
	and	edx, 67108864				; 04000000H
	mov	DWORD PTR _retcode$[ebp], edx
; Line 1479
	jmp	SHORT $L1424
$L1425:
; Line 1480
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG1426
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1482
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 1483
	mov	esp, ebp
	pop	ebp
	ret	0
?ColdReset@EtherObj@@QAEHXZ ENDP			; EtherObj::ColdReset
_TEXT	ENDS
PUBLIC	?HotReset@EtherObj@@QAEHXZ			; EtherObj::HotReset
_DATA	SEGMENT
	ORG $+3
$SG1431	DB	'    Hot reset is successful', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -8
_retcode$ = -4
?HotReset@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::HotReset
; Line 1489
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 1490
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1492
	mov	ecx, DWORD PTR _this$[ebp]
	call	?ColdReset@EtherObj@@QAEHXZ		; EtherObj::ColdReset
	mov	DWORD PTR _retcode$[ebp], eax
; Line 1494
	push	OFFSET FLAT:?mac@EtherObj@@2PADA	; EtherObj::mac
	push	48735744				; 02e7a600H
	push	37987840				; 0243a600H
	push	39233024				; 0256a600H
	push	36742656				; 0230a600H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?inittest@EtherObj@@QAEHJJJJPAD@Z	; EtherObj::inittest
	mov	DWORD PTR _retcode$[ebp], eax
; Line 1495
	mov	ecx, DWORD PTR _this$[ebp]
	call	?TEnable@EtherObj@@QAEHXZ		; EtherObj::TEnable
	mov	DWORD PTR _retcode$[ebp], eax
; Line 1496
	mov	ecx, DWORD PTR _this$[ebp]
	call	?REnable@EtherObj@@QAEHXZ		; EtherObj::REnable
	mov	DWORD PTR _retcode$[ebp], eax
; Line 1498
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG1431
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1499
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 1500
	mov	esp, ebp
	pop	ebp
	ret	0
?HotReset@EtherObj@@QAEHXZ ENDP				; EtherObj::HotReset
_TEXT	ENDS
PUBLIC	?TDisable@EtherObj@@QAEHXZ			; EtherObj::TDisable
_TEXT	SEGMENT
_this$ = -8
_retcode$ = -4
?TDisable@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::TDisable
; Line 1507
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 1508
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1512
	push	0
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setTCtrl@EtherObj@@QAEHH@Z		; EtherObj::setTCtrl
	mov	DWORD PTR _retcode$[ebp], eax
; Line 1514
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 1515
	mov	esp, ebp
	pop	ebp
	ret	0
?TDisable@EtherObj@@QAEHXZ ENDP				; EtherObj::TDisable
_TEXT	ENDS
PUBLIC	?RDisable@EtherObj@@QAEHXZ			; EtherObj::RDisable
_TEXT	SEGMENT
_this$ = -8
_retcode$ = -4
?RDisable@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::RDisable
; Line 1522
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 1523
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1527
	push	0
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRCtrl@EtherObj@@QAEHH@Z		; EtherObj::setRCtrl
	mov	DWORD PTR _retcode$[ebp], eax
; Line 1529
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 1530
	mov	esp, ebp
	pop	ebp
	ret	0
?RDisable@EtherObj@@QAEHXZ ENDP				; EtherObj::RDisable
_TEXT	ENDS
PUBLIC	?setTData@EtherObj@@QAEHHHH@Z			; EtherObj::setTData
_TEXT	SEGMENT
_index$ = 8
_value$ = 12
_noOfBytes$ = 16
_this$ = -24
_i$ = -16
_retcode$ = -4
_lptr$ = -20
_l1$ = -12
_ldata$ = -8
?setTData@EtherObj@@QAEHHHH@Z PROC NEAR			; EtherObj::setTData
; Line 1536
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	mov	DWORD PTR _this$[ebp], ecx
; Line 1537
	mov	DWORD PTR _i$[ebp], 0
; Line 1538
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1540
	mov	DWORD PTR _l1$[ebp], 0
; Line 1541
	lea	eax, DWORD PTR _l1$[ebp]
	mov	DWORD PTR _lptr$[ebp], eax
; Line 1543
	mov	DWORD PTR _ldata$[ebp], 0
; Line 1545
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1451
$L1452:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L1451:
	cmp	DWORD PTR _i$[ebp], 4
	jge	SHORT $L1453
; Line 1548
	mov	edx, DWORD PTR _value$[ebp]
	mov	DWORD PTR _ldata$[ebp], edx
; Line 1549
	cmp	DWORD PTR _i$[ebp], 3
	jge	SHORT $L1454
; Line 1551
	mov	eax, DWORD PTR _ldata$[ebp]
	shl	eax, 8
	mov	DWORD PTR _ldata$[ebp], eax
$L1454:
; Line 1553
	jmp	SHORT $L1452
$L1453:
; Line 1556
	mov	ecx, DWORD PTR _index$[ebp]
	imul	ecx, 1600				; 00000640H
	mov	edx, DWORD PTR ?TDLDataPointer@EtherObj@@2JA ; EtherObj::TDLDataPointer
	lea	eax, DWORD PTR [edx+ecx-1114112]
	mov	DWORD PTR _lptr$[ebp], eax
; Line 1558
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1456
$L1457:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L1456:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _noOfBytes$[ebp]
	jge	SHORT $L1458
; Line 1560
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _lptr$[ebp]
	mov	edx, DWORD PTR _ldata$[ebp]
	mov	DWORD PTR [ecx+eax*4], edx
; Line 1561
	jmp	SHORT $L1457
$L1458:
; Line 1563
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 1564
	mov	esp, ebp
	pop	ebp
	ret	12					; 0000000cH
?setTData@EtherObj@@QAEHHHH@Z ENDP			; EtherObj::setTData
_TEXT	ENDS
PUBLIC	?printRReadData@EtherObj@@QAEHHHH@Z		; EtherObj::printRReadData
_TEXT	SEGMENT
_index$ = 8
_noOfBytes$ = 12
_line$ = 16
_this$ = -420
_i$ = -412
_retcode$ = -4
_lptr$ = -416
_l1$ = -8
_temp$ = -408
?printRReadData@EtherObj@@QAEHHHH@Z PROC NEAR		; EtherObj::printRReadData
; Line 1570
	push	ebp
	mov	ebp, esp
	sub	esp, 420				; 000001a4H
	mov	DWORD PTR _this$[ebp], ecx
; Line 1571
	mov	DWORD PTR _i$[ebp], 0
; Line 1572
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1574
	mov	DWORD PTR _l1$[ebp], 0
; Line 1575
	lea	eax, DWORD PTR _l1$[ebp]
	mov	DWORD PTR _lptr$[ebp], eax
; Line 1578
	mov	ecx, DWORD PTR _index$[ebp]
	shl	ecx, 11					; 0000000bH
	mov	edx, DWORD PTR ?RDLDataPointer@EtherObj@@2JA ; EtherObj::RDLDataPointer
	lea	eax, DWORD PTR [edx+ecx-1114112]
	mov	DWORD PTR _lptr$[ebp], eax
; Line 1580
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1471
$L1472:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L1471:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _noOfBytes$[ebp]
	jge	SHORT $L1473
; Line 1581
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _lptr$[ebp]
	mov	ecx, DWORD PTR [edx+ecx*4]
	mov	DWORD PTR _temp$[ebp+eax*4], ecx
	jmp	SHORT $L1472
$L1473:
; Line 1583
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1474
$L1475:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L1474:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _noOfBytes$[ebp]
	jge	SHORT $L1476
; Line 1584
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 20					; 00000014H
	mov	edx, DWORD PTR _line$[ebp]
	add	edx, ecx
	push	edx
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _temp$[ebp+eax*4]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
	jmp	SHORT $L1475
$L1476:
; Line 1586
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 1587
	mov	esp, ebp
	pop	ebp
	ret	12					; 0000000cH
?printRReadData@EtherObj@@QAEHHHH@Z ENDP		; EtherObj::printRReadData
_TEXT	ENDS
PUBLIC	?printTReadData@EtherObj@@QAEHHHH@Z		; EtherObj::printTReadData
_TEXT	SEGMENT
_index$ = 8
_noOfBytes$ = 12
_line$ = 16
_this$ = -420
_i$ = -412
_retcode$ = -4
_lptr$ = -416
_l1$ = -8
_temp$ = -408
?printTReadData@EtherObj@@QAEHHHH@Z PROC NEAR		; EtherObj::printTReadData
; Line 1593
	push	ebp
	mov	ebp, esp
	sub	esp, 420				; 000001a4H
	mov	DWORD PTR _this$[ebp], ecx
; Line 1594
	mov	DWORD PTR _i$[ebp], 0
; Line 1595
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1597
	mov	DWORD PTR _l1$[ebp], 0
; Line 1598
	lea	eax, DWORD PTR _l1$[ebp]
	mov	DWORD PTR _lptr$[ebp], eax
; Line 1601
	mov	ecx, DWORD PTR _index$[ebp]
	imul	ecx, 1600				; 00000640H
	mov	edx, DWORD PTR ?TDLDataPointer@EtherObj@@2JA ; EtherObj::TDLDataPointer
	lea	eax, DWORD PTR [edx+ecx-1114112]
	mov	DWORD PTR _lptr$[ebp], eax
; Line 1603
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1490
$L1491:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L1490:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _noOfBytes$[ebp]
	jge	SHORT $L1492
; Line 1604
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _lptr$[ebp]
	mov	ecx, DWORD PTR [edx+ecx*4]
	mov	DWORD PTR _temp$[ebp+eax*4], ecx
	jmp	SHORT $L1491
$L1492:
; Line 1606
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1493
$L1494:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L1493:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _noOfBytes$[ebp]
	jge	SHORT $L1495
; Line 1607
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 20					; 00000014H
	mov	edx, DWORD PTR _line$[ebp]
	add	edx, ecx
	push	edx
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _temp$[ebp+eax*4]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
	jmp	SHORT $L1494
$L1495:
; Line 1609
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 1610
	mov	esp, ebp
	pop	ebp
	ret	12					; 0000000cH
?printTReadData@EtherObj@@QAEHHHH@Z ENDP		; EtherObj::printTReadData
_TEXT	ENDS
PUBLIC	?isTDescDone@EtherObj@@QAEHH@Z			; EtherObj::isTDescDone
_TEXT	SEGMENT
_index$ = 8
_this$ = -20
_retcode$ = -4
_lptr$ = -16
_l1$ = -8
_temp$ = -12
?isTDescDone@EtherObj@@QAEHH@Z PROC NEAR		; EtherObj::isTDescDone
; Line 1617
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	mov	DWORD PTR _this$[ebp], ecx
; Line 1618
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1620
	mov	DWORD PTR _l1$[ebp], 0
; Line 1621
	lea	eax, DWORD PTR _l1$[ebp]
	mov	DWORD PTR _lptr$[ebp], eax
; Line 1622
	mov	DWORD PTR _temp$[ebp], 0
; Line 1625
	mov	ecx, DWORD PTR _index$[ebp]
	shl	ecx, 4
	mov	edx, DWORD PTR ?TDLPointer@EtherObj@@2JA ; EtherObj::TDLPointer
	lea	eax, DWORD PTR [edx+ecx-1114112]
	mov	DWORD PTR _lptr$[ebp], eax
; Line 1627
	mov	ecx, DWORD PTR _lptr$[ebp]
	add	ecx, 4
	mov	DWORD PTR _lptr$[ebp], ecx
; Line 1628
	mov	edx, DWORD PTR _lptr$[ebp]
	add	edx, 4
	mov	DWORD PTR _lptr$[ebp], edx
; Line 1629
	mov	eax, DWORD PTR _lptr$[ebp]
	add	eax, 4
	mov	DWORD PTR _lptr$[ebp], eax
; Line 1631
	mov	ecx, DWORD PTR _lptr$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR _temp$[ebp], edx
; Line 1633
	mov	eax, DWORD PTR _temp$[ebp]
	and	eax, 1
	mov	DWORD PTR _temp$[ebp], eax
; Line 1635
	cmp	DWORD PTR _temp$[ebp], 1
	jne	SHORT $L1506
; Line 1636
	mov	DWORD PTR _retcode$[ebp], 1
; Line 1637
	jmp	SHORT $L1507
$L1506:
; Line 1638
	mov	DWORD PTR _retcode$[ebp], 0
$L1507:
; Line 1640
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 1641
	mov	esp, ebp
	pop	ebp
	ret	4
?isTDescDone@EtherObj@@QAEHH@Z ENDP			; EtherObj::isTDescDone
_TEXT	ENDS
PUBLIC	?isRDescDone@EtherObj@@QAEHH@Z			; EtherObj::isRDescDone
_TEXT	SEGMENT
_index$ = 8
_this$ = -20
_retcode$ = -4
_lptr$ = -16
_l1$ = -8
_temp$ = -12
?isRDescDone@EtherObj@@QAEHH@Z PROC NEAR		; EtherObj::isRDescDone
; Line 1648
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	mov	DWORD PTR _this$[ebp], ecx
; Line 1649
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1651
	mov	DWORD PTR _l1$[ebp], 0
; Line 1652
	lea	eax, DWORD PTR _l1$[ebp]
	mov	DWORD PTR _lptr$[ebp], eax
; Line 1653
	mov	DWORD PTR _temp$[ebp], 0
; Line 1656
	mov	ecx, DWORD PTR _index$[ebp]
	shl	ecx, 4
	mov	edx, DWORD PTR ?RDLPointer@EtherObj@@2JA ; EtherObj::RDLPointer
	lea	eax, DWORD PTR [edx+ecx-1114112]
	mov	DWORD PTR _lptr$[ebp], eax
; Line 1658
	mov	ecx, DWORD PTR _lptr$[ebp]
	add	ecx, 4
	mov	DWORD PTR _lptr$[ebp], ecx
; Line 1659
	mov	edx, DWORD PTR _lptr$[ebp]
	add	edx, 4
	mov	DWORD PTR _lptr$[ebp], edx
; Line 1660
	mov	eax, DWORD PTR _lptr$[ebp]
	add	eax, 4
	mov	DWORD PTR _lptr$[ebp], eax
; Line 1662
	mov	ecx, DWORD PTR _lptr$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR _temp$[ebp], edx
; Line 1665
	mov	eax, DWORD PTR _temp$[ebp]
	and	eax, 1
	mov	DWORD PTR _temp$[ebp], eax
; Line 1667
	cmp	DWORD PTR _temp$[ebp], 1
	jne	SHORT $L1517
; Line 1668
	mov	DWORD PTR _retcode$[ebp], 1
; Line 1669
	jmp	SHORT $L1518
$L1517:
; Line 1670
	mov	DWORD PTR _retcode$[ebp], 0
$L1518:
; Line 1672
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 1673
	mov	esp, ebp
	pop	ebp
	ret	4
?isRDescDone@EtherObj@@QAEHH@Z ENDP			; EtherObj::isRDescDone
_TEXT	ENDS
PUBLIC	?resetTDescDone@EtherObj@@QAEHH@Z		; EtherObj::resetTDescDone
_TEXT	SEGMENT
_index$ = 8
_this$ = -20
_retcode$ = -4
_lptr$ = -16
_l1$ = -8
_temp$ = -12
?resetTDescDone@EtherObj@@QAEHH@Z PROC NEAR		; EtherObj::resetTDescDone
; Line 1680
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	mov	DWORD PTR _this$[ebp], ecx
; Line 1681
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1683
	mov	DWORD PTR _l1$[ebp], 0
; Line 1684
	lea	eax, DWORD PTR _l1$[ebp]
	mov	DWORD PTR _lptr$[ebp], eax
; Line 1685
	mov	DWORD PTR _temp$[ebp], 0
; Line 1688
	mov	ecx, DWORD PTR _index$[ebp]
	shl	ecx, 4
	mov	edx, DWORD PTR ?TDLPointer@EtherObj@@2JA ; EtherObj::TDLPointer
	lea	eax, DWORD PTR [edx+ecx-1114112]
	mov	DWORD PTR _lptr$[ebp], eax
; Line 1690
	mov	ecx, DWORD PTR _lptr$[ebp]
	add	ecx, 4
	mov	DWORD PTR _lptr$[ebp], ecx
; Line 1691
	mov	edx, DWORD PTR _lptr$[ebp]
	add	edx, 4
	mov	DWORD PTR _lptr$[ebp], edx
; Line 1692
	mov	eax, DWORD PTR _lptr$[ebp]
	add	eax, 4
	mov	DWORD PTR _lptr$[ebp], eax
; Line 1694
	mov	ecx, DWORD PTR _lptr$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR _temp$[ebp], edx
; Line 1696
	mov	eax, DWORD PTR _temp$[ebp]
	and	al, -16					; fffffff0H
	mov	DWORD PTR _temp$[ebp], eax
; Line 1698
	mov	ecx, DWORD PTR _lptr$[ebp]
	mov	edx, DWORD PTR _temp$[ebp]
	mov	DWORD PTR [ecx], edx
; Line 1700
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 1701
	mov	esp, ebp
	pop	ebp
	ret	4
?resetTDescDone@EtherObj@@QAEHH@Z ENDP			; EtherObj::resetTDescDone
_TEXT	ENDS
PUBLIC	?resetRDescDone@EtherObj@@QAEHH@Z		; EtherObj::resetRDescDone
_TEXT	SEGMENT
_index$ = 8
_this$ = -20
_retcode$ = -4
_lptr$ = -16
_l1$ = -8
_temp$ = -12
?resetRDescDone@EtherObj@@QAEHH@Z PROC NEAR		; EtherObj::resetRDescDone
; Line 1708
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	mov	DWORD PTR _this$[ebp], ecx
; Line 1709
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1711
	mov	DWORD PTR _l1$[ebp], 0
; Line 1712
	lea	eax, DWORD PTR _l1$[ebp]
	mov	DWORD PTR _lptr$[ebp], eax
; Line 1713
	mov	DWORD PTR _temp$[ebp], 0
; Line 1716
	mov	ecx, DWORD PTR _index$[ebp]
	shl	ecx, 4
	mov	edx, DWORD PTR ?RDLPointer@EtherObj@@2JA ; EtherObj::RDLPointer
	lea	eax, DWORD PTR [edx+ecx-1114112]
	mov	DWORD PTR _lptr$[ebp], eax
; Line 1718
	mov	ecx, DWORD PTR _lptr$[ebp]
	add	ecx, 4
	mov	DWORD PTR _lptr$[ebp], ecx
; Line 1719
	mov	edx, DWORD PTR _lptr$[ebp]
	add	edx, 4
	mov	DWORD PTR _lptr$[ebp], edx
; Line 1720
	mov	eax, DWORD PTR _lptr$[ebp]
	add	eax, 4
	mov	DWORD PTR _lptr$[ebp], eax
; Line 1722
	mov	ecx, DWORD PTR _lptr$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR _temp$[ebp], edx
; Line 1724
	mov	eax, DWORD PTR _temp$[ebp]
	and	al, 0
	mov	DWORD PTR _temp$[ebp], eax
; Line 1726
	mov	ecx, DWORD PTR _lptr$[ebp]
	mov	edx, DWORD PTR _temp$[ebp]
	mov	DWORD PTR [ecx], edx
; Line 1728
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 1729
	mov	esp, ebp
	pop	ebp
	ret	4
?resetRDescDone@EtherObj@@QAEHH@Z ENDP			; EtherObj::resetRDescDone
_this$ = -8
_retcode$ = -4
?getRAL0@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::getRAL0
; Line 1736
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 1737
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1740
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	21504					; 00005400H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 1748
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 1750
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 1751
	mov	esp, ebp
	pop	ebp
	ret	0
?getRAL0@EtherObj@@QAEHXZ ENDP				; EtherObj::getRAL0
_TEXT	ENDS
PUBLIC	?setRAL0@EtherObj@@QAEHH@Z			; EtherObj::setRAL0
_TEXT	SEGMENT
_value$ = 8
_this$ = -8
_retcode$ = -4
?setRAL0@EtherObj@@QAEHH@Z PROC NEAR			; EtherObj::setRAL0
; Line 1758
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 1759
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1762
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	21504					; 00005400H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 1770
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	edx, DWORD PTR _value$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 1772
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 1773
	mov	esp, ebp
	pop	ebp
	ret	4
?setRAL0@EtherObj@@QAEHH@Z ENDP				; EtherObj::setRAL0
_this$ = -8
_retcode$ = -4
?getRAH0@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::getRAH0
; Line 1780
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 1781
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1784
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	21508					; 00005404H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 1794
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 1796
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 1797
	mov	esp, ebp
	pop	ebp
	ret	0
?getRAH0@EtherObj@@QAEHXZ ENDP				; EtherObj::getRAH0
_TEXT	ENDS
PUBLIC	?setRAH0@EtherObj@@QAEHH@Z			; EtherObj::setRAH0
_TEXT	SEGMENT
_value$ = 8
_this$ = -12
_retcode$ = -4
_temp$ = -8
?setRAH0@EtherObj@@QAEHH@Z PROC NEAR			; EtherObj::setRAH0
; Line 1804
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 1805
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1806
	mov	DWORD PTR _temp$[ebp], 0
; Line 1808
	mov	eax, DWORD PTR _value$[ebp]
	and	eax, 65535				; 0000ffffH
	mov	DWORD PTR _temp$[ebp], eax
; Line 1809
	mov	ecx, DWORD PTR _temp$[ebp]
	or	ecx, -2147483648			; 80000000H
	mov	DWORD PTR _temp$[ebp], ecx
; Line 1812
	mov	edx, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	edx
	push	21508					; 00005404H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 1822
	mov	eax, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	eax
	mov	ecx, DWORD PTR _temp$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 1824
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 1825
	mov	esp, ebp
	pop	ebp
	ret	4
?setRAH0@EtherObj@@QAEHH@Z ENDP				; EtherObj::setRAH0
_this$ = -8
_retcode$ = -4
?getRAL1@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::getRAL1
; Line 1832
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 1833
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1836
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	21512					; 00005408H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 1844
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 1846
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 1847
	mov	esp, ebp
	pop	ebp
	ret	0
?getRAL1@EtherObj@@QAEHXZ ENDP				; EtherObj::getRAL1
_TEXT	ENDS
PUBLIC	?setRAL1@EtherObj@@QAEHH@Z			; EtherObj::setRAL1
_TEXT	SEGMENT
_value$ = 8
_this$ = -8
_retcode$ = -4
?setRAL1@EtherObj@@QAEHH@Z PROC NEAR			; EtherObj::setRAL1
; Line 1854
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 1855
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1858
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	21512					; 00005408H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 1866
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	edx, DWORD PTR _value$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 1868
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 1869
	mov	esp, ebp
	pop	ebp
	ret	4
?setRAL1@EtherObj@@QAEHH@Z ENDP				; EtherObj::setRAL1
_this$ = -8
_retcode$ = -4
?getRAH1@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::getRAH1
; Line 1876
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 1877
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1880
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	21516					; 0000540cH
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 1890
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 1892
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 1893
	mov	esp, ebp
	pop	ebp
	ret	0
?getRAH1@EtherObj@@QAEHXZ ENDP				; EtherObj::getRAH1
_TEXT	ENDS
PUBLIC	?setRAH1@EtherObj@@QAEHH@Z			; EtherObj::setRAH1
_TEXT	SEGMENT
_value$ = 8
_this$ = -12
_retcode$ = -4
_temp$ = -8
?setRAH1@EtherObj@@QAEHH@Z PROC NEAR			; EtherObj::setRAH1
; Line 1900
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 1901
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1902
	mov	DWORD PTR _temp$[ebp], 0
; Line 1904
	mov	eax, DWORD PTR _value$[ebp]
	and	eax, 65535				; 0000ffffH
	mov	DWORD PTR _temp$[ebp], eax
; Line 1905
	mov	ecx, DWORD PTR _temp$[ebp]
	or	ecx, -2147483648			; 80000000H
	mov	DWORD PTR _temp$[ebp], ecx
; Line 1908
	mov	edx, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	edx
	push	21516					; 0000540cH
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 1918
	mov	eax, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	eax
	mov	ecx, DWORD PTR _temp$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 1920
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 1921
	mov	esp, ebp
	pop	ebp
	ret	4
?setRAH1@EtherObj@@QAEHH@Z ENDP				; EtherObj::setRAH1
_TEXT	ENDS
PUBLIC	?printTDL@EtherObj@@QAEHHH@Z			; EtherObj::printTDL
_TEXT	SEGMENT
_index$ = 8
_line$ = 12
_this$ = -28
_i$ = -20
_retcode$ = -4
_lptr$ = -24
_l1$ = -8
_x$ = -16
_temp$ = -12
?printTDL@EtherObj@@QAEHHH@Z PROC NEAR			; EtherObj::printTDL
; Line 1927
	push	ebp
	mov	ebp, esp
	sub	esp, 28					; 0000001cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 1928
	mov	DWORD PTR _i$[ebp], 0
; Line 1929
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1931
	mov	DWORD PTR _l1$[ebp], 0
; Line 1932
	lea	eax, DWORD PTR _l1$[ebp]
	mov	DWORD PTR _lptr$[ebp], eax
; Line 1933
	mov	DWORD PTR _x$[ebp], 0
; Line 1934
	mov	DWORD PTR _temp$[ebp], 0
; Line 1937
	mov	ecx, DWORD PTR _index$[ebp]
	shl	ecx, 4
	mov	edx, DWORD PTR ?TDLPointer@EtherObj@@2JA ; EtherObj::TDLPointer
	lea	eax, DWORD PTR [edx+ecx-1114112]
	mov	DWORD PTR _x$[ebp], eax
; Line 1939
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR _lptr$[ebp], ecx
; Line 1941
	mov	edx, DWORD PTR _lptr$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR _temp$[ebp], eax
; Line 1942
	mov	ecx, DWORD PTR _line$[ebp]
	push	ecx
	mov	edx, DWORD PTR _temp$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1943
	mov	eax, DWORD PTR _lptr$[ebp]
	add	eax, 4
	mov	DWORD PTR _lptr$[ebp], eax
; Line 1944
	mov	ecx, DWORD PTR _lptr$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR _temp$[ebp], edx
; Line 1945
	mov	eax, DWORD PTR _line$[ebp]
	add	eax, 20					; 00000014H
	push	eax
	mov	ecx, DWORD PTR _temp$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1946
	mov	edx, DWORD PTR _lptr$[ebp]
	add	edx, 4
	mov	DWORD PTR _lptr$[ebp], edx
; Line 1947
	mov	eax, DWORD PTR _lptr$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _temp$[ebp], ecx
; Line 1948
	mov	edx, DWORD PTR _line$[ebp]
	add	edx, 40					; 00000028H
	push	edx
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1949
	mov	ecx, DWORD PTR _lptr$[ebp]
	add	ecx, 4
	mov	DWORD PTR _lptr$[ebp], ecx
; Line 1950
	mov	edx, DWORD PTR _lptr$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR _temp$[ebp], eax
; Line 1951
	mov	ecx, DWORD PTR _line$[ebp]
	add	ecx, 60					; 0000003cH
	push	ecx
	mov	edx, DWORD PTR _temp$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1952
	mov	eax, DWORD PTR _lptr$[ebp]
	add	eax, 4
	mov	DWORD PTR _lptr$[ebp], eax
; Line 1954
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 1955
	mov	esp, ebp
	pop	ebp
	ret	8
?printTDL@EtherObj@@QAEHHH@Z ENDP			; EtherObj::printTDL
_TEXT	ENDS
PUBLIC	?printRDL@EtherObj@@QAEHHH@Z			; EtherObj::printRDL
_TEXT	SEGMENT
_index$ = 8
_line$ = 12
_this$ = -28
_i$ = -20
_retcode$ = -4
_lptr$ = -24
_l1$ = -8
_x$ = -16
_temp$ = -12
?printRDL@EtherObj@@QAEHHH@Z PROC NEAR			; EtherObj::printRDL
; Line 1961
	push	ebp
	mov	ebp, esp
	sub	esp, 28					; 0000001cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 1962
	mov	DWORD PTR _i$[ebp], 0
; Line 1963
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1965
	mov	DWORD PTR _l1$[ebp], 0
; Line 1966
	lea	eax, DWORD PTR _l1$[ebp]
	mov	DWORD PTR _lptr$[ebp], eax
; Line 1967
	mov	DWORD PTR _x$[ebp], 0
; Line 1968
	mov	DWORD PTR _temp$[ebp], 0
; Line 1971
	mov	ecx, DWORD PTR _index$[ebp]
	shl	ecx, 4
	mov	edx, DWORD PTR ?RDLPointer@EtherObj@@2JA ; EtherObj::RDLPointer
	lea	eax, DWORD PTR [edx+ecx-1114112]
	mov	DWORD PTR _x$[ebp], eax
; Line 1973
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR _lptr$[ebp], ecx
; Line 1975
	mov	edx, DWORD PTR _lptr$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR _temp$[ebp], eax
; Line 1976
	mov	ecx, DWORD PTR _line$[ebp]
	push	ecx
	mov	edx, DWORD PTR _temp$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1977
	mov	eax, DWORD PTR _lptr$[ebp]
	add	eax, 4
	mov	DWORD PTR _lptr$[ebp], eax
; Line 1978
	mov	ecx, DWORD PTR _lptr$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR _temp$[ebp], edx
; Line 1979
	mov	eax, DWORD PTR _line$[ebp]
	add	eax, 20					; 00000014H
	push	eax
	mov	ecx, DWORD PTR _temp$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1980
	mov	edx, DWORD PTR _lptr$[ebp]
	add	edx, 4
	mov	DWORD PTR _lptr$[ebp], edx
; Line 1981
	mov	eax, DWORD PTR _lptr$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _temp$[ebp], ecx
; Line 1982
	mov	edx, DWORD PTR _line$[ebp]
	add	edx, 40					; 00000028H
	push	edx
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1983
	mov	ecx, DWORD PTR _lptr$[ebp]
	add	ecx, 4
	mov	DWORD PTR _lptr$[ebp], ecx
; Line 1984
	mov	edx, DWORD PTR _lptr$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR _temp$[ebp], eax
; Line 1985
	mov	ecx, DWORD PTR _line$[ebp]
	add	ecx, 60					; 0000003cH
	push	ecx
	mov	edx, DWORD PTR _temp$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1986
	mov	eax, DWORD PTR _lptr$[ebp]
	add	eax, 4
	mov	DWORD PTR _lptr$[ebp], eax
; Line 1988
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 1989
	mov	esp, ebp
	pop	ebp
	ret	8
?printRDL@EtherObj@@QAEHHH@Z ENDP			; EtherObj::printRDL
_TEXT	ENDS
PUBLIC	?getPRC64@EtherObj@@QAEHXZ			; EtherObj::getPRC64
_TEXT	SEGMENT
_this$ = -8
_retcode$ = -4
?getPRC64@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::getPRC64
; Line 1996
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 1997
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2000
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	16476					; 0000405cH
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 2007
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2009
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 2010
	mov	esp, ebp
	pop	ebp
	ret	0
?getPRC64@EtherObj@@QAEHXZ ENDP				; EtherObj::getPRC64
_TEXT	ENDS
PUBLIC	?getPRC127@EtherObj@@QAEHXZ			; EtherObj::getPRC127
_TEXT	SEGMENT
_this$ = -8
_retcode$ = -4
?getPRC127@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::getPRC127
; Line 2017
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2018
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2021
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	16480					; 00004060H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 2028
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2030
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 2031
	mov	esp, ebp
	pop	ebp
	ret	0
?getPRC127@EtherObj@@QAEHXZ ENDP			; EtherObj::getPRC127
_TEXT	ENDS
PUBLIC	?getPRC255@EtherObj@@QAEHXZ			; EtherObj::getPRC255
_TEXT	SEGMENT
_this$ = -8
_retcode$ = -4
?getPRC255@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::getPRC255
; Line 2038
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2039
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2042
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	16484					; 00004064H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 2049
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2051
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 2052
	mov	esp, ebp
	pop	ebp
	ret	0
?getPRC255@EtherObj@@QAEHXZ ENDP			; EtherObj::getPRC255
_TEXT	ENDS
PUBLIC	?getPRC511@EtherObj@@QAEHXZ			; EtherObj::getPRC511
_TEXT	SEGMENT
_this$ = -8
_retcode$ = -4
?getPRC511@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::getPRC511
; Line 2059
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2060
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2063
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	16488					; 00004068H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 2070
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2072
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 2073
	mov	esp, ebp
	pop	ebp
	ret	0
?getPRC511@EtherObj@@QAEHXZ ENDP			; EtherObj::getPRC511
_TEXT	ENDS
PUBLIC	?getPRC1023@EtherObj@@QAEHXZ			; EtherObj::getPRC1023
_TEXT	SEGMENT
_this$ = -8
_retcode$ = -4
?getPRC1023@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::getPRC1023
; Line 2080
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2081
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2084
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	16492					; 0000406cH
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 2091
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2093
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 2094
	mov	esp, ebp
	pop	ebp
	ret	0
?getPRC1023@EtherObj@@QAEHXZ ENDP			; EtherObj::getPRC1023
_TEXT	ENDS
PUBLIC	?getPRC1522@EtherObj@@QAEHXZ			; EtherObj::getPRC1522
_TEXT	SEGMENT
_this$ = -8
_retcode$ = -4
?getPRC1522@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::getPRC1522
; Line 2101
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2102
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2105
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	16496					; 00004070H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 2112
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2114
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 2115
	mov	esp, ebp
	pop	ebp
	ret	0
?getPRC1522@EtherObj@@QAEHXZ ENDP			; EtherObj::getPRC1522
_TEXT	ENDS
PUBLIC	?getGPRC@EtherObj@@QAEHXZ			; EtherObj::getGPRC
_TEXT	SEGMENT
_this$ = -8
_retcode$ = -4
?getGPRC@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::getGPRC
; Line 2122
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2123
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2126
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	16500					; 00004074H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 2133
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2135
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 2136
	mov	esp, ebp
	pop	ebp
	ret	0
?getGPRC@EtherObj@@QAEHXZ ENDP				; EtherObj::getGPRC
_TEXT	ENDS
PUBLIC	?getICR@EtherObj@@QAEHXZ			; EtherObj::getICR
_TEXT	SEGMENT
_this$ = -8
_retcode$ = -4
?getICR@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::getICR
; Line 2142
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2143
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2146
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	192					; 000000c0H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 2162
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2163
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 2164
	mov	esp, ebp
	pop	ebp
	ret	0
?getICR@EtherObj@@QAEHXZ ENDP				; EtherObj::getICR
_TEXT	ENDS
PUBLIC	?getBPRC@EtherObj@@QAEHXZ			; EtherObj::getBPRC
_TEXT	SEGMENT
_this$ = -8
_retcode$ = -4
?getBPRC@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::getBPRC
; Line 2170
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2171
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2174
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	16504					; 00004078H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 2181
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2183
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 2184
	mov	esp, ebp
	pop	ebp
	ret	0
?getBPRC@EtherObj@@QAEHXZ ENDP				; EtherObj::getBPRC
_TEXT	ENDS
PUBLIC	?getMPRC@EtherObj@@QAEHXZ			; EtherObj::getMPRC
_TEXT	SEGMENT
_this$ = -8
_retcode$ = -4
?getMPRC@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::getMPRC
; Line 2191
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2192
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2195
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	16508					; 0000407cH
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 2202
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2204
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 2205
	mov	esp, ebp
	pop	ebp
	ret	0
?getMPRC@EtherObj@@QAEHXZ ENDP				; EtherObj::getMPRC
_TEXT	ENDS
PUBLIC	?getGPTC@EtherObj@@QAEHXZ			; EtherObj::getGPTC
_TEXT	SEGMENT
_this$ = -8
_retcode$ = -4
?getGPTC@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::getGPTC
; Line 2212
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2213
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2216
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	16512					; 00004080H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 2223
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2225
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 2226
	mov	esp, ebp
	pop	ebp
	ret	0
?getGPTC@EtherObj@@QAEHXZ ENDP				; EtherObj::getGPTC
_TEXT	ENDS
PUBLIC	?getRNBC@EtherObj@@QAEHXZ			; EtherObj::getRNBC
_TEXT	SEGMENT
_this$ = -8
_retcode$ = -4
?getRNBC@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::getRNBC
; Line 2233
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2234
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2237
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	16544					; 000040a0H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 2244
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2246
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 2247
	mov	esp, ebp
	pop	ebp
	ret	0
?getRNBC@EtherObj@@QAEHXZ ENDP				; EtherObj::getRNBC
_TEXT	ENDS
PUBLIC	?getTPR@EtherObj@@QAEHXZ			; EtherObj::getTPR
_TEXT	SEGMENT
_this$ = -8
_retcode$ = -4
?getTPR@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::getTPR
; Line 2254
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2255
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2258
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	16592					; 000040d0H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 2265
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2267
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 2268
	mov	esp, ebp
	pop	ebp
	ret	0
?getTPR@EtherObj@@QAEHXZ ENDP				; EtherObj::getTPR
_TEXT	ENDS
PUBLIC	?getTPT@EtherObj@@QAEHXZ			; EtherObj::getTPT
_TEXT	SEGMENT
_this$ = -8
_retcode$ = -4
?getTPT@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::getTPT
; Line 2275
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2276
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2279
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	16596					; 000040d4H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 2286
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2288
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 2289
	mov	esp, ebp
	pop	ebp
	ret	0
?getTPT@EtherObj@@QAEHXZ ENDP				; EtherObj::getTPT
_TEXT	ENDS
PUBLIC	?getPTC64@EtherObj@@QAEHXZ			; EtherObj::getPTC64
_TEXT	SEGMENT
_this$ = -8
_retcode$ = -4
?getPTC64@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::getPTC64
; Line 2296
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2297
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2300
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	16600					; 000040d8H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 2307
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2309
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 2310
	mov	esp, ebp
	pop	ebp
	ret	0
?getPTC64@EtherObj@@QAEHXZ ENDP				; EtherObj::getPTC64
_TEXT	ENDS
PUBLIC	?getPTC127@EtherObj@@QAEHXZ			; EtherObj::getPTC127
_TEXT	SEGMENT
_this$ = -8
_retcode$ = -4
?getPTC127@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::getPTC127
; Line 2317
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2318
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2321
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	16604					; 000040dcH
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 2328
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2330
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 2331
	mov	esp, ebp
	pop	ebp
	ret	0
?getPTC127@EtherObj@@QAEHXZ ENDP			; EtherObj::getPTC127
_TEXT	ENDS
PUBLIC	?getPTC255@EtherObj@@QAEHXZ			; EtherObj::getPTC255
_TEXT	SEGMENT
_this$ = -8
_retcode$ = -4
?getPTC255@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::getPTC255
; Line 2338
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2339
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2342
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	16608					; 000040e0H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 2349
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2351
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 2352
	mov	esp, ebp
	pop	ebp
	ret	0
?getPTC255@EtherObj@@QAEHXZ ENDP			; EtherObj::getPTC255
_TEXT	ENDS
PUBLIC	?getPTC511@EtherObj@@QAEHXZ			; EtherObj::getPTC511
_TEXT	SEGMENT
_this$ = -8
_retcode$ = -4
?getPTC511@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::getPTC511
; Line 2359
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2360
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2363
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	16612					; 000040e4H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 2370
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2372
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 2373
	mov	esp, ebp
	pop	ebp
	ret	0
?getPTC511@EtherObj@@QAEHXZ ENDP			; EtherObj::getPTC511
_TEXT	ENDS
PUBLIC	?getPTC1023@EtherObj@@QAEHXZ			; EtherObj::getPTC1023
_TEXT	SEGMENT
_this$ = -8
_retcode$ = -4
?getPTC1023@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::getPTC1023
; Line 2380
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2381
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2384
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	16616					; 000040e8H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 2391
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2393
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 2394
	mov	esp, ebp
	pop	ebp
	ret	0
?getPTC1023@EtherObj@@QAEHXZ ENDP			; EtherObj::getPTC1023
_TEXT	ENDS
PUBLIC	?getPTC1522@EtherObj@@QAEHXZ			; EtherObj::getPTC1522
_TEXT	SEGMENT
_this$ = -8
_retcode$ = -4
?getPTC1522@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::getPTC1522
; Line 2401
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2402
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2405
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	16620					; 000040ecH
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 2412
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2414
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 2415
	mov	esp, ebp
	pop	ebp
	ret	0
?getPTC1522@EtherObj@@QAEHXZ ENDP			; EtherObj::getPTC1522
_TEXT	ENDS
PUBLIC	?getMPTC@EtherObj@@QAEHXZ			; EtherObj::getMPTC
_TEXT	SEGMENT
_this$ = -8
_retcode$ = -4
?getMPTC@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::getMPTC
; Line 2422
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2423
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2426
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	16624					; 000040f0H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 2433
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2435
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 2436
	mov	esp, ebp
	pop	ebp
	ret	0
?getMPTC@EtherObj@@QAEHXZ ENDP				; EtherObj::getMPTC
_TEXT	ENDS
PUBLIC	?getBPTC@EtherObj@@QAEHXZ			; EtherObj::getBPTC
_TEXT	SEGMENT
_this$ = -8
_retcode$ = -4
?getBPTC@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::getBPTC
; Line 2443
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2444
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2447
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	16628					; 000040f4H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 2454
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2456
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 2457
	mov	esp, ebp
	pop	ebp
	ret	0
?getBPTC@EtherObj@@QAEHXZ ENDP				; EtherObj::getBPTC
_TEXT	ENDS
PUBLIC	?getSCC@EtherObj@@QAEHXZ			; EtherObj::getSCC
_TEXT	SEGMENT
_this$ = -8
_retcode$ = -4
?getSCC@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::getSCC
; Line 2464
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2465
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2468
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	16404					; 00004014H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 2475
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2477
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 2478
	mov	esp, ebp
	pop	ebp
	ret	0
?getSCC@EtherObj@@QAEHXZ ENDP				; EtherObj::getSCC
_TEXT	ENDS
PUBLIC	?getECOL@EtherObj@@QAEHXZ			; EtherObj::getECOL
_TEXT	SEGMENT
_this$ = -8
_retcode$ = -4
?getECOL@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::getECOL
; Line 2485
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2486
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2489
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	16408					; 00004018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 2496
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2498
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 2499
	mov	esp, ebp
	pop	ebp
	ret	0
?getECOL@EtherObj@@QAEHXZ ENDP				; EtherObj::getECOL
_TEXT	ENDS
PUBLIC	?getMCC@EtherObj@@QAEHXZ			; EtherObj::getMCC
_TEXT	SEGMENT
_this$ = -8
_retcode$ = -4
?getMCC@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::getMCC
; Line 2506
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2507
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2510
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	16412					; 0000401cH
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 2517
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2519
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 2520
	mov	esp, ebp
	pop	ebp
	ret	0
?getMCC@EtherObj@@QAEHXZ ENDP				; EtherObj::getMCC
_TEXT	ENDS
PUBLIC	?getLATECOL@EtherObj@@QAEHXZ			; EtherObj::getLATECOL
_TEXT	SEGMENT
_this$ = -8
_retcode$ = -4
?getLATECOL@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::getLATECOL
; Line 2527
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2528
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2531
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	16416					; 00004020H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 2538
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2540
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 2541
	mov	esp, ebp
	pop	ebp
	ret	0
?getLATECOL@EtherObj@@QAEHXZ ENDP			; EtherObj::getLATECOL
_TEXT	ENDS
PUBLIC	?getCOLC@EtherObj@@QAEHXZ			; EtherObj::getCOLC
_TEXT	SEGMENT
_this$ = -8
_retcode$ = -4
?getCOLC@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::getCOLC
; Line 2548
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2549
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2552
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	16424					; 00004028H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 2559
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2561
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 2562
	mov	esp, ebp
	pop	ebp
	ret	0
?getCOLC@EtherObj@@QAEHXZ ENDP				; EtherObj::getCOLC
_TEXT	ENDS
PUBLIC	?getDC@EtherObj@@QAEHXZ				; EtherObj::getDC
_TEXT	SEGMENT
_this$ = -8
_retcode$ = -4
?getDC@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::getDC
; Line 2569
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2570
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2573
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	16432					; 00004030H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 2580
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2582
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 2583
	mov	esp, ebp
	pop	ebp
	ret	0
?getDC@EtherObj@@QAEHXZ ENDP				; EtherObj::getDC
_TEXT	ENDS
PUBLIC	?getTNCRS@EtherObj@@QAEHXZ			; EtherObj::getTNCRS
_TEXT	SEGMENT
_this$ = -8
_retcode$ = -4
?getTNCRS@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::getTNCRS
; Line 2590
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2591
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2594
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	16436					; 00004034H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 2601
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2603
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 2604
	mov	esp, ebp
	pop	ebp
	ret	0
?getTNCRS@EtherObj@@QAEHXZ ENDP				; EtherObj::getTNCRS
_TEXT	ENDS
PUBLIC	?getSEC@EtherObj@@QAEHXZ			; EtherObj::getSEC
_TEXT	SEGMENT
_this$ = -8
_retcode$ = -4
?getSEC@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::getSEC
; Line 2611
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2612
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2615
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	16440					; 00004038H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 2622
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2624
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 2625
	mov	esp, ebp
	pop	ebp
	ret	0
?getSEC@EtherObj@@QAEHXZ ENDP				; EtherObj::getSEC
_TEXT	ENDS
PUBLIC	?getGOTCL@EtherObj@@QAEHXZ			; EtherObj::getGOTCL
_TEXT	SEGMENT
_this$ = -8
_retcode$ = -4
?getGOTCL@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::getGOTCL
; Line 2632
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2633
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2636
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	16528					; 00004090H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 2643
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2645
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 2646
	mov	esp, ebp
	pop	ebp
	ret	0
?getGOTCL@EtherObj@@QAEHXZ ENDP				; EtherObj::getGOTCL
_TEXT	ENDS
PUBLIC	?getGOTCH@EtherObj@@QAEHXZ			; EtherObj::getGOTCH
_TEXT	SEGMENT
_this$ = -8
_retcode$ = -4
?getGOTCH@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::getGOTCH
; Line 2653
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2654
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2657
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	16532					; 00004094H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 2664
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2666
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 2667
	mov	esp, ebp
	pop	ebp
	ret	0
?getGOTCH@EtherObj@@QAEHXZ ENDP				; EtherObj::getGOTCH
_TEXT	ENDS
PUBLIC	?getMGTPTC@EtherObj@@QAEHXZ			; EtherObj::getMGTPTC
_TEXT	SEGMENT
_this$ = -8
_retcode$ = -4
?getMGTPTC@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::getMGTPTC
; Line 2674
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2675
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2678
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	16572					; 000040bcH
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 2685
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2687
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 2688
	mov	esp, ebp
	pop	ebp
	ret	0
?getMGTPTC@EtherObj@@QAEHXZ ENDP			; EtherObj::getMGTPTC
_TEXT	ENDS
PUBLIC	?getTOTL@EtherObj@@QAEHXZ			; EtherObj::getTOTL
_TEXT	SEGMENT
_this$ = -8
_retcode$ = -4
?getTOTL@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::getTOTL
; Line 2695
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2696
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2699
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	16584					; 000040c8H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 2706
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2708
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 2709
	mov	esp, ebp
	pop	ebp
	ret	0
?getTOTL@EtherObj@@QAEHXZ ENDP				; EtherObj::getTOTL
_TEXT	ENDS
PUBLIC	?getTOTH@EtherObj@@QAEHXZ			; EtherObj::getTOTH
_TEXT	SEGMENT
_this$ = -8
_retcode$ = -4
?getTOTH@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::getTOTH
; Line 2716
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2717
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2720
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	16588					; 000040ccH
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 2727
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2729
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 2730
	mov	esp, ebp
	pop	ebp
	ret	0
?getTOTH@EtherObj@@QAEHXZ ENDP				; EtherObj::getTOTH
_TEXT	ENDS
PUBLIC	?getTXDCTL@EtherObj@@QAEHXZ			; EtherObj::getTXDCTL
_TEXT	SEGMENT
_this$ = -8
_retcode$ = -4
?getTXDCTL@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::getTXDCTL
; Line 2737
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2738
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2741
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	14376					; 00003828H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 2748
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2750
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 2751
	mov	esp, ebp
	pop	ebp
	ret	0
?getTXDCTL@EtherObj@@QAEHXZ ENDP			; EtherObj::getTXDCTL
_TEXT	ENDS
PUBLIC	?getRXDCTL@EtherObj@@QAEHXZ			; EtherObj::getRXDCTL
_TEXT	SEGMENT
_this$ = -8
_retcode$ = -4
?getRXDCTL@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::getRXDCTL
; Line 2758
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2759
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2762
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	10280					; 00002828H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 2769
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2771
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 2772
	mov	esp, ebp
	pop	ebp
	ret	0
?getRXDCTL@EtherObj@@QAEHXZ ENDP			; EtherObj::getRXDCTL
_TEXT	ENDS
PUBLIC	?getTIPG@EtherObj@@QAEHXZ			; EtherObj::getTIPG
_TEXT	SEGMENT
_this$ = -8
_retcode$ = -4
?getTIPG@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::getTIPG
; Line 2779
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2780
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2783
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	1040					; 00000410H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 2790
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2792
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 2793
	mov	esp, ebp
	pop	ebp
	ret	0
?getTIPG@EtherObj@@QAEHXZ ENDP				; EtherObj::getTIPG
_line$ = 8
_this$ = -8
_retcode$ = -4
?printDiag@EtherObj@@QAEHH@Z PROC NEAR			; EtherObj::printDiag
; Line 2799
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2800
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2802
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getPRC64@EtherObj@@QAEHXZ		; EtherObj::getPRC64
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2803
	mov	eax, DWORD PTR _line$[ebp]
	push	eax
	mov	ecx, DWORD PTR _retcode$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 2805
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getPRC127@EtherObj@@QAEHXZ		; EtherObj::getPRC127
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2806
	mov	edx, DWORD PTR _line$[ebp]
	add	edx, 20					; 00000014H
	push	edx
	mov	eax, DWORD PTR _retcode$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 2808
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getPRC255@EtherObj@@QAEHXZ		; EtherObj::getPRC255
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2809
	mov	ecx, DWORD PTR _line$[ebp]
	add	ecx, 40					; 00000028H
	push	ecx
	mov	edx, DWORD PTR _retcode$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 2811
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getPRC1023@EtherObj@@QAEHXZ		; EtherObj::getPRC1023
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2812
	mov	eax, DWORD PTR _line$[ebp]
	add	eax, 60					; 0000003cH
	push	eax
	mov	ecx, DWORD PTR _retcode$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 2814
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getPRC1522@EtherObj@@QAEHXZ		; EtherObj::getPRC1522
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2815
	mov	edx, DWORD PTR _line$[ebp]
	add	edx, 80					; 00000050H
	push	edx
	mov	eax, DWORD PTR _retcode$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 2817
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getGPRC@EtherObj@@QAEHXZ		; EtherObj::getGPRC
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2818
	mov	ecx, DWORD PTR _line$[ebp]
	add	ecx, 100				; 00000064H
	push	ecx
	mov	edx, DWORD PTR _retcode$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 2820
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getBPRC@EtherObj@@QAEHXZ		; EtherObj::getBPRC
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2821
	mov	eax, DWORD PTR _line$[ebp]
	add	eax, 120				; 00000078H
	push	eax
	mov	ecx, DWORD PTR _retcode$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 2823
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getMPRC@EtherObj@@QAEHXZ		; EtherObj::getMPRC
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2824
	mov	edx, DWORD PTR _line$[ebp]
	add	edx, 160				; 000000a0H
	push	edx
	mov	eax, DWORD PTR _retcode$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 2826
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getGPTC@EtherObj@@QAEHXZ		; EtherObj::getGPTC
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2827
	mov	ecx, DWORD PTR _line$[ebp]
	add	ecx, 180				; 000000b4H
	push	ecx
	mov	edx, DWORD PTR _retcode$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 2829
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRNBC@EtherObj@@QAEHXZ		; EtherObj::getRNBC
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2830
	mov	eax, DWORD PTR _line$[ebp]
	add	eax, 200				; 000000c8H
	push	eax
	mov	ecx, DWORD PTR _retcode$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 2832
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getTPR@EtherObj@@QAEHXZ		; EtherObj::getTPR
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2833
	mov	edx, DWORD PTR _line$[ebp]
	add	edx, 220				; 000000dcH
	push	edx
	mov	eax, DWORD PTR _retcode$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 2835
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getTPT@EtherObj@@QAEHXZ		; EtherObj::getTPT
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2836
	mov	ecx, DWORD PTR _line$[ebp]
	add	ecx, 240				; 000000f0H
	push	ecx
	mov	edx, DWORD PTR _retcode$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 2838
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getPTC64@EtherObj@@QAEHXZ		; EtherObj::getPTC64
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2839
	mov	eax, DWORD PTR _line$[ebp]
	add	eax, 260				; 00000104H
	push	eax
	mov	ecx, DWORD PTR _retcode$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 2841
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getPTC127@EtherObj@@QAEHXZ		; EtherObj::getPTC127
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2842
	mov	edx, DWORD PTR _line$[ebp]
	add	edx, 280				; 00000118H
	push	edx
	mov	eax, DWORD PTR _retcode$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 2844
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getPTC255@EtherObj@@QAEHXZ		; EtherObj::getPTC255
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2845
	mov	ecx, DWORD PTR _line$[ebp]
	add	ecx, 320				; 00000140H
	push	ecx
	mov	edx, DWORD PTR _retcode$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 2847
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getPTC1023@EtherObj@@QAEHXZ		; EtherObj::getPTC1023
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2848
	mov	eax, DWORD PTR _line$[ebp]
	add	eax, 340				; 00000154H
	push	eax
	mov	ecx, DWORD PTR _retcode$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 2850
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getPTC1522@EtherObj@@QAEHXZ		; EtherObj::getPTC1522
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2851
	mov	edx, DWORD PTR _line$[ebp]
	add	edx, 360				; 00000168H
	push	edx
	mov	eax, DWORD PTR _retcode$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 2853
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getMPTC@EtherObj@@QAEHXZ		; EtherObj::getMPTC
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2854
	mov	ecx, DWORD PTR _line$[ebp]
	add	ecx, 380				; 0000017cH
	push	ecx
	mov	edx, DWORD PTR _retcode$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 2856
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getBPTC@EtherObj@@QAEHXZ		; EtherObj::getBPTC
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2857
	mov	eax, DWORD PTR _line$[ebp]
	add	eax, 400				; 00000190H
	push	eax
	mov	ecx, DWORD PTR _retcode$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 2859
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 2860
	mov	esp, ebp
	pop	ebp
	ret	4
?printDiag@EtherObj@@QAEHH@Z ENDP			; EtherObj::printDiag
_TEXT	ENDS
PUBLIC	?printTStat@EtherObj@@QAEHH@Z			; EtherObj::printTStat
_TEXT	SEGMENT
_line$ = 8
_this$ = -8
_retcode$ = -4
?printTStat@EtherObj@@QAEHH@Z PROC NEAR			; EtherObj::printTStat
; Line 2866
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2867
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2869
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getSCC@EtherObj@@QAEHXZ		; EtherObj::getSCC
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2870
	mov	eax, DWORD PTR _line$[ebp]
	push	eax
	mov	ecx, DWORD PTR _retcode$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 2872
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getECOL@EtherObj@@QAEHXZ		; EtherObj::getECOL
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2873
	mov	edx, DWORD PTR _line$[ebp]
	add	edx, 20					; 00000014H
	push	edx
	mov	eax, DWORD PTR _retcode$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 2875
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getMCC@EtherObj@@QAEHXZ		; EtherObj::getMCC
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2876
	mov	ecx, DWORD PTR _line$[ebp]
	add	ecx, 40					; 00000028H
	push	ecx
	mov	edx, DWORD PTR _retcode$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 2878
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getLATECOL@EtherObj@@QAEHXZ		; EtherObj::getLATECOL
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2879
	mov	eax, DWORD PTR _line$[ebp]
	add	eax, 60					; 0000003cH
	push	eax
	mov	ecx, DWORD PTR _retcode$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 2881
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getCOLC@EtherObj@@QAEHXZ		; EtherObj::getCOLC
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2882
	mov	edx, DWORD PTR _line$[ebp]
	add	edx, 80					; 00000050H
	push	edx
	mov	eax, DWORD PTR _retcode$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 2884
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getDC@EtherObj@@QAEHXZ			; EtherObj::getDC
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2885
	mov	ecx, DWORD PTR _line$[ebp]
	add	ecx, 100				; 00000064H
	push	ecx
	mov	edx, DWORD PTR _retcode$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 2887
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getTNCRS@EtherObj@@QAEHXZ		; EtherObj::getTNCRS
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2888
	mov	eax, DWORD PTR _line$[ebp]
	add	eax, 120				; 00000078H
	push	eax
	mov	ecx, DWORD PTR _retcode$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 2890
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getSEC@EtherObj@@QAEHXZ		; EtherObj::getSEC
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2891
	mov	edx, DWORD PTR _line$[ebp]
	add	edx, 160				; 000000a0H
	push	edx
	mov	eax, DWORD PTR _retcode$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 2893
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getGOTCL@EtherObj@@QAEHXZ		; EtherObj::getGOTCL
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2894
	mov	ecx, DWORD PTR _line$[ebp]
	add	ecx, 180				; 000000b4H
	push	ecx
	mov	edx, DWORD PTR _retcode$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 2896
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getGOTCH@EtherObj@@QAEHXZ		; EtherObj::getGOTCH
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2897
	mov	eax, DWORD PTR _line$[ebp]
	add	eax, 200				; 000000c8H
	push	eax
	mov	ecx, DWORD PTR _retcode$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 2899
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getMGTPTC@EtherObj@@QAEHXZ		; EtherObj::getMGTPTC
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2900
	mov	edx, DWORD PTR _line$[ebp]
	add	edx, 220				; 000000dcH
	push	edx
	mov	eax, DWORD PTR _retcode$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 2902
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getTOTL@EtherObj@@QAEHXZ		; EtherObj::getTOTL
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2903
	mov	ecx, DWORD PTR _line$[ebp]
	add	ecx, 240				; 000000f0H
	push	ecx
	mov	edx, DWORD PTR _retcode$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 2905
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getTOTH@EtherObj@@QAEHXZ		; EtherObj::getTOTH
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2906
	mov	eax, DWORD PTR _line$[ebp]
	add	eax, 260				; 00000104H
	push	eax
	mov	ecx, DWORD PTR _retcode$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 2908
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 2909
	mov	esp, ebp
	pop	ebp
	ret	4
?printTStat@EtherObj@@QAEHH@Z ENDP			; EtherObj::printTStat
_TEXT	ENDS
PUBLIC	?getCurrentReceivePtr@EtherObj@@QAEHXZ		; EtherObj::getCurrentReceivePtr
_TEXT	SEGMENT
_this$ = -8
_retcode$ = -4
?getCurrentReceivePtr@EtherObj@@QAEHXZ PROC NEAR	; EtherObj::getCurrentReceivePtr
; Line 2915
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2916
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2920
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRDHead@EtherObj@@QAEHXZ		; EtherObj::getRDHead
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2922
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 2923
	mov	esp, ebp
	pop	ebp
	ret	0
?getCurrentReceivePtr@EtherObj@@QAEHXZ ENDP		; EtherObj::getCurrentReceivePtr
_TEXT	ENDS
PUBLIC	?getCount@EtherObj@@QAEHXZ			; EtherObj::getCount
_TEXT	SEGMENT
_this$ = -8
_rcvcounter$ = -4
?getCount@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::getCount
; Line 2933
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2934
	mov	DWORD PTR _rcvcounter$[ebp], 0
; Line 2936
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getGPRC@EtherObj@@QAEHXZ		; EtherObj::getGPRC
	mov	DWORD PTR _rcvcounter$[ebp], eax
; Line 2937
	mov	eax, DWORD PTR _rcvcounter$[ebp]
	sub	eax, DWORD PTR ?TotalRcvCount@EtherObj@@2JA ; EtherObj::TotalRcvCount
	mov	DWORD PTR _rcvcounter$[ebp], eax
; Line 2939
	mov	eax, DWORD PTR _rcvcounter$[ebp]
; Line 2940
	mov	esp, ebp
	pop	ebp
	ret	0
?getCount@EtherObj@@QAEHXZ ENDP				; EtherObj::getCount
_TEXT	ENDS
PUBLIC	?RDLfull@EtherObj@@QAEHXZ			; EtherObj::RDLfull
_TEXT	SEGMENT
_this$ = -8
_pkts$ = -4
?RDLfull@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::RDLfull
; Line 2945
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2946
	mov	DWORD PTR _pkts$[ebp], 0
; Line 2948
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRDTail@EtherObj@@QAEHXZ		; EtherObj::getRDTail
	mov	DWORD PTR ?ReceiveInPtr@EtherObj@@2JA, eax ; EtherObj::ReceiveInPtr
; Line 2950
	mov	eax, DWORD PTR ?ReceiveInPtr@EtherObj@@2JA ; EtherObj::ReceiveInPtr
	cmp	eax, DWORD PTR ?ReceiveOutPtr@EtherObj@@2JA ; EtherObj::ReceiveOutPtr
	jl	SHORT $L1773
; Line 2952
	mov	ecx, DWORD PTR ?ReceiveInPtr@EtherObj@@2JA ; EtherObj::ReceiveInPtr
	sub	ecx, DWORD PTR ?ReceiveOutPtr@EtherObj@@2JA ; EtherObj::ReceiveOutPtr
	mov	DWORD PTR _pkts$[ebp], ecx
; Line 2955
	jmp	SHORT $L1774
$L1773:
; Line 2957
	mov	edx, DWORD PTR ?ReceiveOutPtr@EtherObj@@2JA ; EtherObj::ReceiveOutPtr
	sub	edx, DWORD PTR ?ReceiveInPtr@EtherObj@@2JA ; EtherObj::ReceiveInPtr
	mov	eax, 4096				; 00001000H
	sub	eax, edx
	mov	DWORD PTR _pkts$[ebp], eax
$L1774:
; Line 2960
	cmp	DWORD PTR _pkts$[ebp], 4096		; 00001000H
	jl	SHORT $L1775
; Line 2962
	mov	eax, 1
	jmp	SHORT $L1776
$L1775:
; Line 2964
	xor	eax, eax
$L1776:
; Line 2965
	mov	esp, ebp
	pop	ebp
	ret	0
?RDLfull@EtherObj@@QAEHXZ ENDP				; EtherObj::RDLfull
_TEXT	ENDS
PUBLIC	?ReadData@EtherObj@@QAEHPAPADPAHPAD2@Z		; EtherObj::ReadData
PUBLIC	?discardPacket@EtherObj@@QAEHXZ			; EtherObj::discardPacket
_TEXT	SEGMENT
_Data$ = 8
_Type$ = 12
_ipaddr$ = 16
_macaddr$ = 20
_this$ = -44
_PROTOCOL_TYPE$ = -12
_portno$ = -8
_retcode$ = -4
_pktlen$ = -32
_addr$ = -40
_c2$ = -24
_p1$ = -28
_a1$ = -36
_s1$ = -20
?ReadData@EtherObj@@QAEHPAPADPAHPAD2@Z PROC NEAR	; EtherObj::ReadData
; Line 2979
	push	ebp
	mov	ebp, esp
	sub	esp, 44					; 0000002cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 2981
	mov	DWORD PTR _PROTOCOL_TYPE$[ebp], 0
; Line 2982
	mov	DWORD PTR _portno$[ebp], 0
; Line 2983
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2984
	mov	DWORD PTR _pktlen$[ebp], 0
; Line 2988
	lea	eax, DWORD PTR _c2$[ebp]
	mov	DWORD PTR _addr$[ebp], eax
; Line 2992
	lea	ecx, DWORD PTR _a1$[ebp]
	mov	DWORD PTR _p1$[ebp], ecx
; Line 2997
	mov	edx, DWORD PTR ?ReceiveOutPtr@EtherObj@@2JA ; EtherObj::ReceiveOutPtr
	shl	edx, 4
	mov	eax, DWORD PTR ?RDLPointer@EtherObj@@2JA ; EtherObj::RDLPointer
	lea	ecx, DWORD PTR [eax+edx-1114112]
	mov	DWORD PTR _p1$[ebp], ecx
; Line 2999
	mov	edx, DWORD PTR _p1$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR _s1$[ebp], eax
; Line 3001
	mov	ecx, DWORD PTR _s1$[ebp]
	sub	ecx, 1114112				; 00110000H
	mov	edx, DWORD PTR _Data$[ebp]
	mov	DWORD PTR [edx], ecx
; Line 3004
	mov	eax, DWORD PTR _Data$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _addr$[ebp], ecx
; Line 3006
	mov	edx, DWORD PTR _p1$[ebp]
	add	edx, 4
	mov	DWORD PTR _p1$[ebp], edx
; Line 3007
	mov	eax, DWORD PTR _p1$[ebp]
	add	eax, 4
	mov	DWORD PTR _p1$[ebp], eax
; Line 3009
	mov	ecx, DWORD PTR _p1$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR _pktlen$[ebp], edx
; Line 3010
	mov	eax, DWORD PTR _pktlen$[ebp]
	and	eax, 65535				; 0000ffffH
	mov	DWORD PTR _pktlen$[ebp], eax
; Line 3013
	mov	ecx, DWORD PTR _p1$[ebp]
	add	ecx, 4
	mov	DWORD PTR _p1$[ebp], ecx
; Line 3015
	mov	edx, DWORD PTR _p1$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR _s1$[ebp], eax
; Line 3016
	mov	ecx, DWORD PTR _s1$[ebp]
	and	ecx, 1
	mov	DWORD PTR _s1$[ebp], ecx
; Line 3017
	cmp	DWORD PTR _s1$[ebp], 0
	jne	SHORT $L1796
; Line 3020
	or	eax, -1
	jmp	$L1807
$L1796:
; Line 3026
	mov	edx, DWORD PTR _Data$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR _macaddr$[ebp]
	mov	dl, BYTE PTR [eax+6]
	mov	BYTE PTR [ecx], dl
; Line 3027
	mov	eax, DWORD PTR _Data$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	edx, DWORD PTR _macaddr$[ebp]
	mov	al, BYTE PTR [ecx+7]
	mov	BYTE PTR [edx+1], al
; Line 3028
	mov	ecx, DWORD PTR _Data$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	eax, DWORD PTR _macaddr$[ebp]
	mov	cl, BYTE PTR [edx+8]
	mov	BYTE PTR [eax+2], cl
; Line 3029
	mov	edx, DWORD PTR _Data$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR _macaddr$[ebp]
	mov	dl, BYTE PTR [eax+9]
	mov	BYTE PTR [ecx+3], dl
; Line 3030
	mov	eax, DWORD PTR _Data$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	edx, DWORD PTR _macaddr$[ebp]
	mov	al, BYTE PTR [ecx+10]
	mov	BYTE PTR [edx+4], al
; Line 3031
	mov	ecx, DWORD PTR _Data$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	eax, DWORD PTR _macaddr$[ebp]
	mov	cl, BYTE PTR [edx+11]
	mov	BYTE PTR [eax+5], cl
; Line 3045
	mov	edx, DWORD PTR _Data$[ebp]
	mov	eax, DWORD PTR [edx]
	movsx	ecx, BYTE PTR [eax+12]
	and	ecx, 255				; 000000ffH
	mov	DWORD PTR _PROTOCOL_TYPE$[ebp], ecx
; Line 3046
	mov	edx, DWORD PTR _PROTOCOL_TYPE$[ebp]
	shl	edx, 8
	mov	DWORD PTR _PROTOCOL_TYPE$[ebp], edx
; Line 3047
	mov	eax, DWORD PTR _Data$[ebp]
	mov	ecx, DWORD PTR [eax]
	movsx	edx, BYTE PTR [ecx+13]
	and	edx, 255				; 000000ffH
	mov	eax, DWORD PTR _PROTOCOL_TYPE$[ebp]
	or	eax, edx
	mov	DWORD PTR _PROTOCOL_TYPE$[ebp], eax
; Line 3048
	mov	ecx, DWORD PTR _Data$[ebp]
	mov	edx, DWORD PTR [ecx]
	movsx	eax, BYTE PTR [edx+34]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _portno$[ebp], eax
; Line 3049
	mov	ecx, DWORD PTR _portno$[ebp]
	shl	ecx, 8
	mov	DWORD PTR _portno$[ebp], ecx
; Line 3050
	mov	edx, DWORD PTR _Data$[ebp]
	mov	eax, DWORD PTR [edx]
	movsx	ecx, BYTE PTR [eax+35]
	and	ecx, 255				; 000000ffH
	mov	edx, DWORD PTR _portno$[ebp]
	or	edx, ecx
	mov	DWORD PTR _portno$[ebp], edx
; Line 3052
	mov	eax, DWORD PTR _Type$[ebp]
	mov	ecx, DWORD PTR _PROTOCOL_TYPE$[ebp]
	mov	DWORD PTR [eax], ecx
; Line 3054
	mov	edx, DWORD PTR _Type$[ebp]
	cmp	DWORD PTR [edx], 2054			; 00000806H
	jne	SHORT $L1798
; Line 3057
	mov	eax, DWORD PTR _Data$[ebp]
	mov	ecx, DWORD PTR [eax]
	movsx	edx, BYTE PTR [ecx+38]
	mov	eax, DWORD PTR _ipaddr$[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	edx, ecx
	jne	SHORT $L1800
	mov	edx, DWORD PTR _Data$[ebp]
	mov	eax, DWORD PTR [edx]
	movsx	ecx, BYTE PTR [eax+39]
	mov	edx, DWORD PTR _ipaddr$[ebp]
	movsx	eax, BYTE PTR [edx+1]
	cmp	ecx, eax
	jne	SHORT $L1800
	mov	ecx, DWORD PTR _Data$[ebp]
	mov	edx, DWORD PTR [ecx]
	movsx	eax, BYTE PTR [edx+40]
	mov	ecx, DWORD PTR _ipaddr$[ebp]
	movsx	edx, BYTE PTR [ecx+2]
	cmp	eax, edx
	jne	SHORT $L1800
	mov	eax, DWORD PTR _Data$[ebp]
	mov	ecx, DWORD PTR [eax]
	movsx	edx, BYTE PTR [ecx+41]
	mov	eax, DWORD PTR _ipaddr$[ebp]
	movsx	ecx, BYTE PTR [eax+3]
	cmp	edx, ecx
	je	SHORT $L1799
$L1800:
; Line 3061
	mov	ecx, DWORD PTR _this$[ebp]
	call	?discardPacket@EtherObj@@QAEHXZ		; EtherObj::discardPacket
; Line 3062
	mov	eax, -2					; fffffffeH
	jmp	$L1807
$L1799:
; Line 3065
	jmp	SHORT $L1805
$L1798:
	mov	edx, DWORD PTR _Type$[ebp]
	cmp	DWORD PTR [edx], 2048			; 00000800H
	jne	SHORT $L1802
; Line 3068
	mov	eax, DWORD PTR _Data$[ebp]
	mov	ecx, DWORD PTR [eax]
	movsx	edx, BYTE PTR [ecx+30]
	mov	eax, DWORD PTR _ipaddr$[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	edx, ecx
	jne	SHORT $L1804
	mov	edx, DWORD PTR _Data$[ebp]
	mov	eax, DWORD PTR [edx]
	movsx	ecx, BYTE PTR [eax+31]
	mov	edx, DWORD PTR _ipaddr$[ebp]
	movsx	eax, BYTE PTR [edx+1]
	cmp	ecx, eax
	jne	SHORT $L1804
	mov	ecx, DWORD PTR _Data$[ebp]
	mov	edx, DWORD PTR [ecx]
	movsx	eax, BYTE PTR [edx+32]
	mov	ecx, DWORD PTR _ipaddr$[ebp]
	movsx	edx, BYTE PTR [ecx+2]
	cmp	eax, edx
	jne	SHORT $L1804
	mov	eax, DWORD PTR _Data$[ebp]
	mov	ecx, DWORD PTR [eax]
	movsx	edx, BYTE PTR [ecx+33]
	mov	eax, DWORD PTR _ipaddr$[ebp]
	movsx	ecx, BYTE PTR [eax+3]
	cmp	edx, ecx
	je	SHORT $L1803
$L1804:
; Line 3072
	mov	ecx, DWORD PTR _this$[ebp]
	call	?discardPacket@EtherObj@@QAEHXZ		; EtherObj::discardPacket
; Line 3073
	mov	eax, -2					; fffffffeH
	jmp	SHORT $L1807
$L1803:
; Line 3076
	jmp	SHORT $L1805
$L1802:
; Line 3079
	mov	ecx, DWORD PTR _this$[ebp]
	call	?discardPacket@EtherObj@@QAEHXZ		; EtherObj::discardPacket
; Line 3091
	mov	eax, -3					; fffffffdH
	jmp	SHORT $L1807
$L1805:
; Line 3094
	mov	edx, DWORD PTR _Data$[ebp]
	mov	eax, DWORD PTR [edx]
	add	eax, 14					; 0000000eH
	mov	ecx, DWORD PTR _Data$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 3095
	mov	edx, DWORD PTR _pktlen$[ebp]
	sub	edx, 14					; 0000000eH
	mov	DWORD PTR _pktlen$[ebp], edx
; Line 3100
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getICR@EtherObj@@QAEHXZ		; EtherObj::getICR
	mov	DWORD PTR _retcode$[ebp], eax
; Line 3101
	mov	eax, DWORD PTR _retcode$[ebp]
	and	eax, 64					; 00000040H
	cmp	eax, 1
	jne	SHORT $L1806
; Line 3103
	mov	eax, -4					; fffffffcH
	jmp	SHORT $L1807
$L1806:
; Line 3105
	mov	eax, DWORD PTR _pktlen$[ebp]
$L1807:
; Line 3106
	mov	esp, ebp
	pop	ebp
	ret	16					; 00000010H
?ReadData@EtherObj@@QAEHPAPADPAHPAD2@Z ENDP		; EtherObj::ReadData
_this$ = -20
_p1$ = -16
_l1$ = -8
_retcode$ = -4
_rtail$ = -12
?discardPacket@EtherObj@@QAEHXZ PROC NEAR		; EtherObj::discardPacket
; Line 3114
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	mov	DWORD PTR _this$[ebp], ecx
; Line 3117
	lea	eax, DWORD PTR _l1$[ebp]
	mov	DWORD PTR _p1$[ebp], eax
; Line 3118
	mov	DWORD PTR _retcode$[ebp], 0
; Line 3119
	mov	DWORD PTR _rtail$[ebp], 0
; Line 3124
	mov	ecx, DWORD PTR ?ReceiveOutPtr@EtherObj@@2JA ; EtherObj::ReceiveOutPtr
	shl	ecx, 4
	mov	edx, DWORD PTR ?RDLPointer@EtherObj@@2JA ; EtherObj::RDLPointer
	lea	eax, DWORD PTR [edx+ecx-1114112]
	mov	DWORD PTR _p1$[ebp], eax
; Line 3126
	mov	ecx, DWORD PTR _p1$[ebp]
	add	ecx, 4
	mov	DWORD PTR _p1$[ebp], ecx
; Line 3127
	mov	edx, DWORD PTR _p1$[ebp]
	add	edx, 4
	mov	DWORD PTR _p1$[ebp], edx
; Line 3128
	mov	eax, DWORD PTR _p1$[ebp]
	add	eax, 4
	mov	DWORD PTR _p1$[ebp], eax
; Line 3130
	mov	ecx, DWORD PTR _p1$[ebp]
	mov	DWORD PTR [ecx], 0
; Line 3132
	mov	edx, DWORD PTR ?ReceiveOutPtr@EtherObj@@2JA ; EtherObj::ReceiveOutPtr
	add	edx, 1
	mov	DWORD PTR ?ReceiveOutPtr@EtherObj@@2JA, edx ; EtherObj::ReceiveOutPtr
; Line 3134
	cmp	DWORD PTR ?ReceiveOutPtr@EtherObj@@2JA, 4096 ; EtherObj::ReceiveOutPtr, 00001000H
	jne	SHORT $L1816
; Line 3136
	mov	DWORD PTR ?ReceiveOutPtr@EtherObj@@2JA, 0 ; EtherObj::ReceiveOutPtr
$L1816:
; Line 3140
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRDTail@EtherObj@@QAEHXZ		; EtherObj::getRDTail
	mov	DWORD PTR _retcode$[ebp], eax
; Line 3142
	cmp	DWORD PTR _retcode$[ebp], 4095		; 00000fffH
	jne	SHORT $L1817
; Line 3143
	mov	DWORD PTR _rtail$[ebp], 0
; Line 3144
	jmp	SHORT $L1818
$L1817:
; Line 3145
	mov	eax, DWORD PTR _retcode$[ebp]
	add	eax, 1
	mov	DWORD PTR _rtail$[ebp], eax
$L1818:
; Line 3148
	mov	ecx, DWORD PTR _rtail$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRDTail@EtherObj@@QAEHH@Z		; EtherObj::setRDTail
	mov	DWORD PTR _retcode$[ebp], eax
; Line 3150
	mov	edx, DWORD PTR ?TotalRcvCount@EtherObj@@2JA ; EtherObj::TotalRcvCount
	add	edx, 1
	mov	DWORD PTR ?TotalRcvCount@EtherObj@@2JA, edx ; EtherObj::TotalRcvCount
; Line 3152
	xor	eax, eax
; Line 3153
	mov	esp, ebp
	pop	ebp
	ret	0
?discardPacket@EtherObj@@QAEHXZ ENDP			; EtherObj::discardPacket
_TEXT	ENDS
PUBLIC	?TDLFull@EtherObj@@QAEHXZ			; EtherObj::TDLFull
_DATA	SEGMENT
$SG1824	DB	'TDL is FULL', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -8
_retcode$ = -4
?TDLFull@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::TDLFull
; Line 3159
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 3160
	mov	DWORD PTR _retcode$[ebp], 0
; Line 3162
	mov	eax, DWORD PTR ?SendInPtr@EtherObj@@2JA	; EtherObj::SendInPtr
	add	eax, 1
	and	eax, -2147479553			; 80000fffH
	jns	SHORT $L2102
	dec	eax
	or	eax, -4096				; fffff000H
	inc	eax
$L2102:
	cmp	eax, DWORD PTR ?SendOutPtr@EtherObj@@2JA ; EtherObj::SendOutPtr
	jne	SHORT $L1823
; Line 3164
	mov	DWORD PTR _retcode$[ebp], 1
; Line 3165
	push	3280					; 00000cd0H
	push	OFFSET FLAT:$SG1824
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 3166
	push	3220					; 00000c94H
	mov	ecx, DWORD PTR ?SendInPtr@EtherObj@@2JA	; EtherObj::SendInPtr
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 3167
	push	3240					; 00000ca8H
	mov	edx, DWORD PTR ?SendOutPtr@EtherObj@@2JA ; EtherObj::SendOutPtr
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 3168
	push	3260					; 00000cbcH
	push	4096					; 00001000H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 3170
	jmp	SHORT $L1825
$L1823:
; Line 3171
	mov	DWORD PTR _retcode$[ebp], 0
$L1825:
; Line 3173
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 3174
	mov	esp, ebp
	pop	ebp
	ret	0
?TDLFull@EtherObj@@QAEHXZ ENDP				; EtherObj::TDLFull
_TEXT	ENDS
PUBLIC	?IPInsertPkt@EtherObj@@QAEHPADHH0H@Z		; EtherObj::IPInsertPkt
PUBLIC	?sndCall@EtherObj@@QAEHXZ			; EtherObj::sndCall
_TEXT	SEGMENT
_PACK$ = 8
_PACK_Size$ = 12
_PROTOCOL$ = 16
_Target_HAdd$ = 20
_this$ = -36
_retcode$ = -4
_i$ = -28
_sizeOfPacket$ = -12
_temp$ = -24
_x$ = -20
_p1$ = -16
_c3$ = -8
_k$1849 = -32
?IPInsertPkt@EtherObj@@QAEHPADHH0H@Z PROC NEAR		; EtherObj::IPInsertPkt
; Line 3186
	push	ebp
	mov	ebp, esp
	sub	esp, 36					; 00000024H
	mov	DWORD PTR _this$[ebp], ecx
; Line 3188
	mov	DWORD PTR _i$[ebp], 0
; Line 3189
	mov	DWORD PTR _sizeOfPacket$[ebp], 0
; Line 3190
	mov	DWORD PTR _temp$[ebp], 0
; Line 3192
	mov	DWORD PTR _x$[ebp], 0
; Line 3195
	lea	eax, DWORD PTR _c3$[ebp]
	mov	DWORD PTR _p1$[ebp], eax
; Line 3200
	mov	ecx, DWORD PTR ?SendInPtr@EtherObj@@2JA	; EtherObj::SendInPtr
	shl	ecx, 4
	mov	edx, DWORD PTR ?TDLPointer@EtherObj@@2JA ; EtherObj::TDLPointer
	lea	eax, DWORD PTR [edx+ecx-1114112]
	mov	DWORD PTR _x$[ebp], eax
; Line 3206
	mov	ecx, DWORD PTR _x$[ebp]
	add	ecx, 1114112				; 00110000H
	mov	edx, DWORD PTR ?TDLPointer@EtherObj@@2JA ; EtherObj::TDLPointer
	add	edx, 65520				; 0000fff0H
	cmp	ecx, edx
	jle	SHORT $L1841
; Line 3208
	mov	eax, -12				; fffffff4H
	jmp	$L1833
$L1841:
; Line 3211
	mov	eax, DWORD PTR _PACK$[ebp]
	sub	eax, 14					; 0000000eH
	mov	DWORD PTR _PACK$[ebp], eax
; Line 3213
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR _p1$[ebp], ecx
; Line 3216
	mov	edx, DWORD PTR ?TDLDataPointer@EtherObj@@2JA ; EtherObj::TDLDataPointer
	add	edx, 6553600				; 00640000H
	mov	eax, DWORD PTR _p1$[ebp]
	cmp	DWORD PTR [eax], edx
	jl	SHORT $L1843
; Line 3218
	mov	eax, -13				; fffffff3H
	jmp	$L1833
$L1843:
; Line 3221
	mov	ecx, DWORD PTR ?SendInPtr@EtherObj@@2JA	; EtherObj::SendInPtr
	add	ecx, 1
	mov	DWORD PTR ?SendInPtr@EtherObj@@2JA, ecx	; EtherObj::SendInPtr
; Line 3223
	cmp	DWORD PTR ?SendInPtr@EtherObj@@2JA, 4096 ; EtherObj::SendInPtr, 00001000H
	jne	SHORT $L1844
; Line 3225
	mov	DWORD PTR ?SendInPtr@EtherObj@@2JA, 0	; EtherObj::SendInPtr
$L1844:
; Line 3228
	mov	edx, DWORD PTR _p1$[ebp]
	add	edx, 4
	mov	DWORD PTR _p1$[ebp], edx
; Line 3229
	mov	eax, DWORD PTR _p1$[ebp]
	add	eax, 4
	mov	DWORD PTR _p1$[ebp], eax
; Line 3231
	mov	ecx, DWORD PTR _PACK_Size$[ebp]
	add	ecx, 14					; 0000000eH
	mov	DWORD PTR _sizeOfPacket$[ebp], ecx
; Line 3233
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1845
$L1846:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L1845:
	cmp	DWORD PTR _i$[ebp], 6
	jge	SHORT $L1847
; Line 3235
	mov	eax, DWORD PTR _PACK$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _Target_HAdd$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	dl, BYTE PTR [ecx]
	mov	BYTE PTR [eax], dl
; Line 3236
	mov	eax, DWORD PTR _PACK$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	dl, BYTE PTR ?mac@EtherObj@@2PADA[ecx]
	mov	BYTE PTR [eax+6], dl
; Line 3237
	jmp	SHORT $L1846
$L1847:
; Line 3238
	mov	eax, DWORD PTR _PROTOCOL$[ebp]
	sar	eax, 8
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _PACK$[ebp]
	mov	BYTE PTR [ecx+12], al
; Line 3239
	mov	edx, DWORD PTR _PROTOCOL$[ebp]
	and	edx, 255				; 000000ffH
	mov	eax, DWORD PTR _PACK$[ebp]
	mov	BYTE PTR [eax+13], dl
; Line 3242
	cmp	DWORD PTR _sizeOfPacket$[ebp], 60	; 0000003cH
	jge	SHORT $L1848
; Line 3244
	mov	ecx, 60					; 0000003cH
	sub	ecx, DWORD PTR _sizeOfPacket$[ebp]
	mov	DWORD PTR _k$1849[ebp], ecx
; Line 3245
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1850
$L1851:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L1850:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _k$1849[ebp]
	jge	SHORT $L1852
; Line 3247
	mov	ecx, DWORD PTR _sizeOfPacket$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _PACK$[ebp]
	mov	BYTE PTR [edx+ecx], 0
; Line 3248
	jmp	SHORT $L1851
$L1852:
; Line 3249
	mov	DWORD PTR _sizeOfPacket$[ebp], 60	; 0000003cH
$L1848:
; Line 3252
	mov	eax, DWORD PTR _p1$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _temp$[ebp], ecx
; Line 3253
	mov	edx, DWORD PTR _temp$[ebp]
	and	edx, -65536				; ffff0000H
	mov	DWORD PTR _temp$[ebp], edx
; Line 3254
	mov	eax, DWORD PTR _temp$[ebp]
	add	eax, DWORD PTR _sizeOfPacket$[ebp]
	mov	DWORD PTR _temp$[ebp], eax
; Line 3256
	mov	ecx, DWORD PTR _p1$[ebp]
	mov	edx, DWORD PTR _temp$[ebp]
	mov	DWORD PTR [ecx], edx
; Line 3258
	mov	ecx, DWORD PTR _this$[ebp]
	call	?sndCall@EtherObj@@QAEHXZ		; EtherObj::sndCall
	mov	DWORD PTR _retcode$[ebp], eax
; Line 3260
	xor	eax, eax
$L1833:
; Line 3261
	mov	esp, ebp
	pop	ebp
	ret	20					; 00000014H
?IPInsertPkt@EtherObj@@QAEHPADHH0H@Z ENDP		; EtherObj::IPInsertPkt
_this$ = -16
_retcode$ = -4
_ttail$ = -12
_temp$ = -8
?sndCall@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::sndCall
; Line 3267
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	mov	DWORD PTR _this$[ebp], ecx
; Line 3268
	mov	DWORD PTR _retcode$[ebp], 0
; Line 3269
	mov	DWORD PTR _ttail$[ebp], 0
; Line 3270
	mov	DWORD PTR _temp$[ebp], 0
; Line 3274
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getTDTail@EtherObj@@QAEHXZ		; EtherObj::getTDTail
	mov	DWORD PTR _retcode$[ebp], eax
; Line 3276
	cmp	DWORD PTR _retcode$[ebp], 4095		; 00000fffH
	jne	SHORT $L1859
; Line 3277
	mov	DWORD PTR _ttail$[ebp], 0
; Line 3278
	jmp	SHORT $L1860
$L1859:
; Line 3279
	mov	eax, DWORD PTR _retcode$[ebp]
	add	eax, 1
	mov	DWORD PTR _ttail$[ebp], eax
$L1860:
; Line 3282
	mov	ecx, DWORD PTR _ttail$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setTDTail@EtherObj@@QAEHH@Z		; EtherObj::setTDTail
	mov	DWORD PTR _retcode$[ebp], eax
; Line 3284
	xor	eax, eax
; Line 3285
	mov	esp, ebp
	pop	ebp
	ret	0
?sndCall@EtherObj@@QAEHXZ ENDP				; EtherObj::sndCall
_TEXT	ENDS
PUBLIC	?IncSendOutPtr@EtherObj@@QAEHXZ			; EtherObj::IncSendOutPtr
_TEXT	SEGMENT
_this$ = -16
_retcode$ = -4
_io$ = -12
?IncSendOutPtr@EtherObj@@QAEHXZ PROC NEAR		; EtherObj::IncSendOutPtr
; Line 3291
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	mov	DWORD PTR _this$[ebp], ecx
; Line 3292
	mov	DWORD PTR _retcode$[ebp], 0
; Line 3293
	lea	ecx, DWORD PTR _io$[ebp]
	call	??0AOAProtected@@QAE@XZ			; AOAProtected::AOAProtected
$L1867:
; Line 3295
	mov	eax, DWORD PTR ?SendOutPtr@EtherObj@@2JA ; EtherObj::SendOutPtr
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?isTDescDone@EtherObj@@QAEHH@Z		; EtherObj::isTDescDone
	test	eax, eax
	je	SHORT $L1868
; Line 3297
	mov	ecx, DWORD PTR ?SendOutPtr@EtherObj@@2JA ; EtherObj::SendOutPtr
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?resetTDescDone@EtherObj@@QAEHH@Z	; EtherObj::resetTDescDone
	mov	DWORD PTR _retcode$[ebp], eax
; Line 3298
	cmp	DWORD PTR ?SendOutPtr@EtherObj@@2JA, 4095 ; EtherObj::SendOutPtr, 00000fffH
	jne	SHORT $L1869
; Line 3299
	mov	DWORD PTR ?SendOutPtr@EtherObj@@2JA, 0	; EtherObj::SendOutPtr
; Line 3300
	jmp	SHORT $L1870
$L1869:
; Line 3301
	mov	edx, DWORD PTR ?SendOutPtr@EtherObj@@2JA ; EtherObj::SendOutPtr
	add	edx, 1
	mov	DWORD PTR ?SendOutPtr@EtherObj@@2JA, edx ; EtherObj::SendOutPtr
$L1870:
; Line 3302
	jmp	SHORT $L1867
$L1868:
; Line 3304
	xor	eax, eax
; Line 3305
	mov	esp, ebp
	pop	ebp
	ret	0
?IncSendOutPtr@EtherObj@@QAEHXZ ENDP			; EtherObj::IncSendOutPtr
_TEXT	ENDS
PUBLIC	?ARPInsertPkt@EtherObj@@QAEHPADHH00HH@Z		; EtherObj::ARPInsertPkt
_TEXT	SEGMENT
_PACK$ = 8
_PACK_Size$ = 12
_PROTOCOL$ = 16
_Sender_HAdd$ = 20
_Target_HAdd$ = 24
_this$ = -56
_BUFFER$ = -12
_c1$ = -16
_i$ = -40
_retcode$ = -4
_sizeOfPacket$ = -24
_stype$ = -48
_temp$ = -36
_x$ = -32
_p1$ = -28
_c3$ = -20
_k$1905 = -52
?ARPInsertPkt@EtherObj@@QAEHPADHH00HH@Z PROC NEAR	; EtherObj::ARPInsertPkt
; Line 3317
	push	ebp
	mov	ebp, esp
	sub	esp, 56					; 00000038H
	mov	DWORD PTR _this$[ebp], ecx
; Line 3322
	lea	eax, DWORD PTR _c1$[ebp]
	mov	DWORD PTR _BUFFER$[ebp], eax
; Line 3323
	mov	DWORD PTR _i$[ebp], 0
; Line 3324
	mov	DWORD PTR _retcode$[ebp], 0
; Line 3325
	mov	DWORD PTR _sizeOfPacket$[ebp], 0
; Line 3326
	mov	DWORD PTR _stype$[ebp], 0
; Line 3327
	mov	DWORD PTR _temp$[ebp], 0
; Line 3329
	mov	DWORD PTR _x$[ebp], 0
; Line 3332
	lea	ecx, DWORD PTR _c3$[ebp]
	mov	DWORD PTR _p1$[ebp], ecx
; Line 3334
	mov	edx, DWORD PTR ?SendInPtr@EtherObj@@2JA	; EtherObj::SendInPtr
	shl	edx, 4
	mov	eax, DWORD PTR ?TDLPointer@EtherObj@@2JA ; EtherObj::TDLPointer
	lea	ecx, DWORD PTR [eax+edx-1114112]
	mov	DWORD PTR _x$[ebp], ecx
; Line 3340
	mov	edx, DWORD PTR _x$[ebp]
	add	edx, 1114112				; 00110000H
	mov	eax, DWORD PTR ?TDLPointer@EtherObj@@2JA ; EtherObj::TDLPointer
	add	eax, 65520				; 0000fff0H
	cmp	edx, eax
	jle	SHORT $L1893
; Line 3342
	mov	eax, -8					; fffffff8H
	jmp	$L1880
$L1893:
; Line 3345
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR _p1$[ebp], ecx
; Line 3348
	mov	edx, DWORD PTR ?TDLDataPointer@EtherObj@@2JA ; EtherObj::TDLDataPointer
	add	edx, 6553600				; 00640000H
	mov	eax, DWORD PTR _p1$[ebp]
	cmp	DWORD PTR [eax], edx
	jl	SHORT $L1895
; Line 3350
	mov	eax, -9					; fffffff7H
	jmp	$L1880
$L1895:
; Line 3353
	mov	ecx, DWORD PTR _p1$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR _BUFFER$[ebp], edx
; Line 3355
	mov	eax, DWORD PTR _BUFFER$[ebp]
	sub	eax, 1114112				; 00110000H
	mov	DWORD PTR _BUFFER$[ebp], eax
; Line 3357
	mov	ecx, DWORD PTR ?SendInPtr@EtherObj@@2JA	; EtherObj::SendInPtr
	add	ecx, 1
	mov	DWORD PTR ?SendInPtr@EtherObj@@2JA, ecx	; EtherObj::SendInPtr
; Line 3359
	cmp	DWORD PTR ?SendInPtr@EtherObj@@2JA, 4096 ; EtherObj::SendInPtr, 00001000H
	jne	SHORT $L1897
; Line 3361
	mov	DWORD PTR ?SendInPtr@EtherObj@@2JA, 0	; EtherObj::SendInPtr
$L1897:
; Line 3364
	mov	edx, DWORD PTR _p1$[ebp]
	add	edx, 4
	mov	DWORD PTR _p1$[ebp], edx
; Line 3365
	mov	eax, DWORD PTR _p1$[ebp]
	add	eax, 4
	mov	DWORD PTR _p1$[ebp], eax
; Line 3367
	mov	ecx, DWORD PTR _PACK_Size$[ebp]
	add	ecx, 14					; 0000000eH
	mov	DWORD PTR _sizeOfPacket$[ebp], ecx
; Line 3369
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1898
$L1899:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L1898:
	cmp	DWORD PTR _i$[ebp], 6
	jge	SHORT $L1900
; Line 3371
	mov	eax, DWORD PTR _BUFFER$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _Target_HAdd$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	dl, BYTE PTR [ecx]
	mov	BYTE PTR [eax], dl
; Line 3372
	mov	eax, DWORD PTR _BUFFER$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _Sender_HAdd$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	dl, BYTE PTR [ecx]
	mov	BYTE PTR [eax+6], dl
; Line 3373
	jmp	SHORT $L1899
$L1900:
; Line 3374
	mov	eax, DWORD PTR _PROTOCOL$[ebp]
	sar	eax, 8
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _BUFFER$[ebp]
	mov	BYTE PTR [ecx+12], al
; Line 3375
	mov	edx, DWORD PTR _PROTOCOL$[ebp]
	and	edx, 255				; 000000ffH
	mov	eax, DWORD PTR _BUFFER$[ebp]
	mov	BYTE PTR [eax+13], dl
; Line 3378
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1901
$L1902:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L1901:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _PACK_Size$[ebp]
	jge	SHORT $L1903
; Line 3380
	mov	eax, DWORD PTR _BUFFER$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _PACK$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	dl, BYTE PTR [ecx]
	mov	BYTE PTR [eax+14], dl
; Line 3381
	jmp	SHORT $L1902
$L1903:
; Line 3384
	cmp	DWORD PTR _sizeOfPacket$[ebp], 60	; 0000003cH
	jge	SHORT $L1904
; Line 3386
	mov	eax, 60					; 0000003cH
	sub	eax, DWORD PTR _sizeOfPacket$[ebp]
	mov	DWORD PTR _k$1905[ebp], eax
; Line 3387
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1906
$L1907:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L1906:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _k$1905[ebp]
	jge	SHORT $L1908
; Line 3389
	mov	eax, DWORD PTR _sizeOfPacket$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _BUFFER$[ebp]
	mov	BYTE PTR [ecx+eax], 0
; Line 3390
	jmp	SHORT $L1907
$L1908:
; Line 3391
	mov	DWORD PTR _sizeOfPacket$[ebp], 60	; 0000003cH
$L1904:
; Line 3394
	mov	edx, DWORD PTR _p1$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR _temp$[ebp], eax
; Line 3395
	mov	ecx, DWORD PTR _temp$[ebp]
	and	ecx, -65536				; ffff0000H
	mov	DWORD PTR _temp$[ebp], ecx
; Line 3396
	mov	edx, DWORD PTR _temp$[ebp]
	add	edx, DWORD PTR _sizeOfPacket$[ebp]
	mov	DWORD PTR _temp$[ebp], edx
; Line 3398
	mov	eax, DWORD PTR _p1$[ebp]
	mov	ecx, DWORD PTR _temp$[ebp]
	mov	DWORD PTR [eax], ecx
; Line 3400
	mov	ecx, DWORD PTR _this$[ebp]
	call	?sndCall@EtherObj@@QAEHXZ		; EtherObj::sndCall
	mov	DWORD PTR _retcode$[ebp], eax
; Line 3402
	xor	eax, eax
$L1880:
; Line 3403
	mov	esp, ebp
	pop	ebp
	ret	28					; 0000001cH
?ARPInsertPkt@EtherObj@@QAEHPADHH00HH@Z ENDP		; EtherObj::ARPInsertPkt
_TEXT	ENDS
PUBLIC	?FormatEthPacket@EtherObj@@QAEHPADHH0JHH@Z	; EtherObj::FormatEthPacket
_TEXT	SEGMENT
_PACK$ = 8
_PACK_Size$ = 12
_PROTOCOL$ = 16
_Target_HAdd$ = 20
_InPtr$ = 24
_this$ = -40
_i$ = -28
_sizeOfPacket$ = -12
_retcode$ = -4
_x$ = -24
_p1$ = -20
_c3$ = -8
_stype$ = -32
_temp$ = -16
_k$1934 = -36
?FormatEthPacket@EtherObj@@QAEHPADHH0JHH@Z PROC NEAR	; EtherObj::FormatEthPacket
; Line 3413
	push	ebp
	mov	ebp, esp
	sub	esp, 40					; 00000028H
	mov	DWORD PTR _this$[ebp], ecx
; Line 3415
	mov	DWORD PTR _i$[ebp], 0
; Line 3416
	mov	DWORD PTR _sizeOfPacket$[ebp], 0
; Line 3417
	mov	DWORD PTR _retcode$[ebp], 0
; Line 3419
	mov	DWORD PTR _x$[ebp], 0
; Line 3422
	lea	eax, DWORD PTR _c3$[ebp]
	mov	DWORD PTR _p1$[ebp], eax
; Line 3423
	mov	DWORD PTR _stype$[ebp], 0
; Line 3424
	mov	DWORD PTR _temp$[ebp], 0
; Line 3426
	mov	ecx, DWORD PTR _PACK_Size$[ebp]
	mov	edx, DWORD PTR ?TotalDataSent@EtherObj@@2JA ; EtherObj::TotalDataSent
	lea	eax, DWORD PTR [edx+ecx+14]
	mov	DWORD PTR ?TotalDataSent@EtherObj@@2JA, eax ; EtherObj::TotalDataSent
; Line 3431
	mov	ecx, DWORD PTR _InPtr$[ebp]
	shl	ecx, 4
	mov	edx, DWORD PTR ?TDLPointer@EtherObj@@2JA ; EtherObj::TDLPointer
	lea	eax, DWORD PTR [edx+ecx-1114112]
	mov	DWORD PTR _x$[ebp], eax
; Line 3437
	mov	ecx, DWORD PTR _x$[ebp]
	add	ecx, 1114112				; 00110000H
	mov	edx, DWORD PTR ?TDLPointer@EtherObj@@2JA ; EtherObj::TDLPointer
	add	edx, 65520				; 0000fff0H
	cmp	ecx, edx
	jle	SHORT $L1927
; Line 3439
	mov	eax, -26				; ffffffe6H
	jmp	$L1918
$L1927:
; Line 3442
	mov	eax, DWORD PTR _x$[ebp]
	mov	DWORD PTR _p1$[ebp], eax
; Line 3445
	mov	ecx, DWORD PTR ?TDLDataPointer@EtherObj@@2JA ; EtherObj::TDLDataPointer
	add	ecx, 6553600				; 00640000H
	mov	edx, DWORD PTR _p1$[ebp]
	cmp	DWORD PTR [edx], ecx
	jl	SHORT $L1929
; Line 3447
	mov	eax, -27				; ffffffe5H
	jmp	$L1918
$L1929:
; Line 3450
	mov	eax, DWORD PTR _p1$[ebp]
	add	eax, 4
	mov	DWORD PTR _p1$[ebp], eax
; Line 3451
	mov	ecx, DWORD PTR _p1$[ebp]
	add	ecx, 4
	mov	DWORD PTR _p1$[ebp], ecx
; Line 3453
	mov	edx, DWORD PTR _PACK_Size$[ebp]
	add	edx, 14					; 0000000eH
	mov	DWORD PTR _sizeOfPacket$[ebp], edx
; Line 3455
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1930
$L1931:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L1930:
	cmp	DWORD PTR _i$[ebp], 6
	jge	SHORT $L1932
; Line 3457
	mov	ecx, DWORD PTR _PACK$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _Target_HAdd$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	mov	al, BYTE PTR [edx]
	mov	BYTE PTR [ecx], al
; Line 3458
	mov	ecx, DWORD PTR _PACK$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	mov	al, BYTE PTR ?mac@EtherObj@@2PADA[edx]
	mov	BYTE PTR [ecx+6], al
; Line 3459
	jmp	SHORT $L1931
$L1932:
; Line 3460
	mov	ecx, DWORD PTR _PROTOCOL$[ebp]
	sar	ecx, 8
	and	ecx, 255				; 000000ffH
	mov	edx, DWORD PTR _PACK$[ebp]
	mov	BYTE PTR [edx+12], cl
; Line 3461
	mov	eax, DWORD PTR _PROTOCOL$[ebp]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _PACK$[ebp]
	mov	BYTE PTR [ecx+13], al
; Line 3465
	cmp	DWORD PTR _sizeOfPacket$[ebp], 60	; 0000003cH
	jge	SHORT $L1933
; Line 3467
	mov	edx, 60					; 0000003cH
	sub	edx, DWORD PTR _sizeOfPacket$[ebp]
	mov	DWORD PTR _k$1934[ebp], edx
; Line 3468
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1935
$L1936:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L1935:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _k$1934[ebp]
	jge	SHORT $L1937
; Line 3470
	mov	edx, DWORD PTR _sizeOfPacket$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _PACK$[ebp]
	mov	BYTE PTR [eax+edx], 0
; Line 3471
	jmp	SHORT $L1936
$L1937:
; Line 3472
	mov	DWORD PTR _sizeOfPacket$[ebp], 60	; 0000003cH
$L1933:
; Line 3475
	mov	ecx, DWORD PTR _p1$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR _temp$[ebp], edx
; Line 3476
	mov	eax, DWORD PTR _temp$[ebp]
	and	eax, -65536				; ffff0000H
	mov	DWORD PTR _temp$[ebp], eax
; Line 3477
	mov	ecx, DWORD PTR _temp$[ebp]
	add	ecx, DWORD PTR _sizeOfPacket$[ebp]
	mov	DWORD PTR _temp$[ebp], ecx
; Line 3479
	mov	edx, DWORD PTR _p1$[ebp]
	mov	eax, DWORD PTR _temp$[ebp]
	mov	DWORD PTR [edx], eax
; Line 3481
	mov	ecx, DWORD PTR _this$[ebp]
	call	?sndCall@EtherObj@@QAEHXZ		; EtherObj::sndCall
	mov	DWORD PTR _retcode$[ebp], eax
; Line 3483
	xor	eax, eax
$L1918:
; Line 3484
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
_this$ = -48
_i$ = -36
_sizeOfPacket$ = -20
_retcode$ = -4
_c1$ = -8
_c2$ = -12
_x$ = -32
_p1$ = -28
_c3$ = -16
_stype$ = -40
_temp$ = -24
_k$1966 = -44
?FormatEthPacketN@EtherObj@@QAEHPADHH0JHHH@Z PROC NEAR	; EtherObj::FormatEthPacketN
; Line 3494
	push	ebp
	mov	ebp, esp
	sub	esp, 48					; 00000030H
	mov	DWORD PTR _this$[ebp], ecx
; Line 3496
	mov	DWORD PTR _i$[ebp], 0
; Line 3497
	mov	DWORD PTR _sizeOfPacket$[ebp], 0
; Line 3498
	mov	DWORD PTR _retcode$[ebp], 0
; Line 3499
	mov	DWORD PTR _c1$[ebp], 0
; Line 3500
	mov	DWORD PTR _c2$[ebp], 0
; Line 3502
	mov	DWORD PTR _x$[ebp], 0
; Line 3505
	lea	eax, DWORD PTR _c3$[ebp]
	mov	DWORD PTR _p1$[ebp], eax
; Line 3506
	mov	DWORD PTR _stype$[ebp], 0
; Line 3507
	mov	DWORD PTR _temp$[ebp], 0
; Line 3509
	mov	ecx, DWORD PTR _PACK_Size$[ebp]
	mov	edx, DWORD PTR ?TotalDataSent@EtherObj@@2JA ; EtherObj::TotalDataSent
	lea	eax, DWORD PTR [edx+ecx+14]
	mov	DWORD PTR ?TotalDataSent@EtherObj@@2JA, eax ; EtherObj::TotalDataSent
; Line 3514
	mov	ecx, DWORD PTR _InPtr$[ebp]
	shl	ecx, 4
	mov	edx, DWORD PTR ?TDLPointer@EtherObj@@2JA ; EtherObj::TDLPointer
	lea	eax, DWORD PTR [edx+ecx-1114112]
	mov	DWORD PTR _x$[ebp], eax
; Line 3520
	mov	ecx, DWORD PTR _x$[ebp]
	add	ecx, 1114112				; 00110000H
	mov	edx, DWORD PTR ?TDLPointer@EtherObj@@2JA ; EtherObj::TDLPointer
	add	edx, 65520				; 0000fff0H
	cmp	ecx, edx
	jle	SHORT $L1959
; Line 3522
	mov	eax, -26				; ffffffe6H
	jmp	$L1948
$L1959:
; Line 3525
	mov	eax, DWORD PTR _x$[ebp]
	mov	DWORD PTR _p1$[ebp], eax
; Line 3528
	mov	ecx, DWORD PTR ?TDLDataPointer@EtherObj@@2JA ; EtherObj::TDLDataPointer
	add	ecx, 6553600				; 00640000H
	mov	edx, DWORD PTR _p1$[ebp]
	cmp	DWORD PTR [edx], ecx
	jl	SHORT $L1961
; Line 3530
	mov	eax, -27				; ffffffe5H
	jmp	$L1948
$L1961:
; Line 3533
	mov	eax, DWORD PTR _p1$[ebp]
	add	eax, 4
	mov	DWORD PTR _p1$[ebp], eax
; Line 3534
	mov	ecx, DWORD PTR _p1$[ebp]
	add	ecx, 4
	mov	DWORD PTR _p1$[ebp], ecx
; Line 3536
	mov	edx, DWORD PTR _PACK_Size$[ebp]
	add	edx, 14					; 0000000eH
	mov	DWORD PTR _sizeOfPacket$[ebp], edx
; Line 3538
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1962
$L1963:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L1962:
	cmp	DWORD PTR _i$[ebp], 6
	jge	SHORT $L1964
; Line 3540
	mov	ecx, DWORD PTR _PACK$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _Target_HAdd$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	mov	al, BYTE PTR [edx]
	mov	BYTE PTR [ecx], al
; Line 3541
	mov	ecx, DWORD PTR _PACK$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	mov	al, BYTE PTR ?mac@EtherObj@@2PADA[edx]
	mov	BYTE PTR [ecx+6], al
; Line 3542
	jmp	SHORT $L1963
$L1964:
; Line 3543
	mov	ecx, DWORD PTR _PROTOCOL$[ebp]
	sar	ecx, 8
	and	ecx, 255				; 000000ffH
	mov	edx, DWORD PTR _PACK$[ebp]
	mov	BYTE PTR [edx+12], cl
; Line 3544
	mov	eax, DWORD PTR _PROTOCOL$[ebp]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _PACK$[ebp]
	mov	BYTE PTR [ecx+13], al
; Line 3548
	cmp	DWORD PTR _sizeOfPacket$[ebp], 60	; 0000003cH
	jge	SHORT $L1965
; Line 3550
	mov	edx, 60					; 0000003cH
	sub	edx, DWORD PTR _sizeOfPacket$[ebp]
	mov	DWORD PTR _k$1966[ebp], edx
; Line 3551
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1967
$L1968:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L1967:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _k$1966[ebp]
	jge	SHORT $L1969
; Line 3553
	mov	edx, DWORD PTR _sizeOfPacket$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _PACK$[ebp]
	mov	BYTE PTR [eax+edx], 0
; Line 3554
	jmp	SHORT $L1968
$L1969:
; Line 3555
	mov	DWORD PTR _sizeOfPacket$[ebp], 60	; 0000003cH
$L1965:
; Line 3558
	mov	ecx, DWORD PTR _p1$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR _temp$[ebp], edx
; Line 3559
	mov	eax, DWORD PTR _temp$[ebp]
	and	eax, -65536				; ffff0000H
	mov	DWORD PTR _temp$[ebp], eax
; Line 3560
	mov	ecx, DWORD PTR _temp$[ebp]
	add	ecx, DWORD PTR _sizeOfPacket$[ebp]
	mov	DWORD PTR _temp$[ebp], ecx
; Line 3562
	mov	edx, DWORD PTR _p1$[ebp]
	mov	eax, DWORD PTR _temp$[ebp]
	mov	DWORD PTR [edx], eax
; Line 3564
	cmp	DWORD PTR _count$[ebp], 0
	je	SHORT $L1970
; Line 3565
	mov	ecx, DWORD PTR _count$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?sndCallN@EtherObj@@QAEHH@Z		; EtherObj::sndCallN
	mov	DWORD PTR _retcode$[ebp], eax
$L1970:
; Line 3567
	xor	eax, eax
$L1948:
; Line 3568
	mov	esp, ebp
	pop	ebp
	ret	32					; 00000020H
?FormatEthPacketN@EtherObj@@QAEHPADHH0JHHH@Z ENDP	; EtherObj::FormatEthPacketN
_count$ = 8
_this$ = -16
_retcode$ = -4
_ttail$ = -12
_temp$ = -8
?sndCallN@EtherObj@@QAEHH@Z PROC NEAR			; EtherObj::sndCallN
; Line 3574
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	mov	DWORD PTR _this$[ebp], ecx
; Line 3575
	mov	DWORD PTR _retcode$[ebp], 0
; Line 3576
	mov	DWORD PTR _ttail$[ebp], 0
; Line 3577
	mov	DWORD PTR _temp$[ebp], 0
; Line 3580
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getTDTail@EtherObj@@QAEHXZ		; EtherObj::getTDTail
	mov	DWORD PTR _retcode$[ebp], eax
; Line 3582
	mov	eax, DWORD PTR _retcode$[ebp]
	add	eax, DWORD PTR _count$[ebp]
	mov	DWORD PTR _temp$[ebp], eax
; Line 3583
	cmp	DWORD PTR _temp$[ebp], 4095		; 00000fffH
	jle	SHORT $L1978
; Line 3584
	mov	ecx, DWORD PTR _temp$[ebp]
	sub	ecx, 4096				; 00001000H
	mov	DWORD PTR _temp$[ebp], ecx
$L1978:
; Line 3587
	mov	edx, DWORD PTR _temp$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setTDTail@EtherObj@@QAEHH@Z		; EtherObj::setTDTail
	mov	DWORD PTR _retcode$[ebp], eax
; Line 3589
	xor	eax, eax
; Line 3590
	mov	esp, ebp
	pop	ebp
	ret	4
?sndCallN@EtherObj@@QAEHH@Z ENDP			; EtherObj::sndCallN
_TEXT	ENDS
END
