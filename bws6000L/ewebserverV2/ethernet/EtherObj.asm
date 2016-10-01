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
PUBLIC	?inittest@EtherObj@@QAEHJJJJ@Z			; EtherObj::inittest
PUBLIC	?createTDL@EtherObj@@QAEHXZ			; EtherObj::createTDL
PUBLIC	?createRDL@EtherObj@@QAEHXZ			; EtherObj::createRDL
PUBLIC	?initTDL@EtherObj@@QAEHHHH@Z			; EtherObj::initTDL
PUBLIC	?initRDL@EtherObj@@QAEHHHH@Z			; EtherObj::initRDL
_TEXT	SEGMENT
_tbaseAddress$ = 8
_tbufferPointer$ = 12
_rbaseAddress$ = 16
_rbufferPointer$ = 20
_this$ = -16
_retcode$ = -4
_tdtail$ = -8
_rdtail$ = -12
?inittest@EtherObj@@QAEHJJJJ@Z PROC NEAR		; EtherObj::inittest
; Line 41
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	mov	DWORD PTR _this$[ebp], ecx
; Line 42
	mov	DWORD PTR _retcode$[ebp], 0
; Line 43
	mov	DWORD PTR _tdtail$[ebp], 0
; Line 44
	mov	DWORD PTR _rdtail$[ebp], 0
; Line 46
	mov	DWORD PTR ?SendInPtr@EtherObj@@2JA, 0	; EtherObj::SendInPtr
; Line 47
	mov	DWORD PTR ?SendOutPtr@EtherObj@@2JA, 0	; EtherObj::SendOutPtr
; Line 48
	mov	DWORD PTR ?ReceiveInPtr@EtherObj@@2JA, 0 ; EtherObj::ReceiveInPtr
; Line 49
	mov	DWORD PTR ?ReceiveOutPtr@EtherObj@@2JA, 0 ; EtherObj::ReceiveOutPtr
; Line 53
	mov	DWORD PTR _tdtail$[ebp], 0
; Line 54
	mov	DWORD PTR _rdtail$[ebp], 4094		; 00000ffeH
; Line 56
	mov	eax, DWORD PTR _tbaseAddress$[ebp]
	mov	DWORD PTR ?TDLPointer@EtherObj@@2JA, eax ; EtherObj::TDLPointer
; Line 57
	mov	ecx, DWORD PTR _tbufferPointer$[ebp]
	mov	DWORD PTR ?TDLDataPointer@EtherObj@@2JA, ecx ; EtherObj::TDLDataPointer
; Line 58
	mov	edx, DWORD PTR _rbaseAddress$[ebp]
	mov	DWORD PTR ?RDLPointer@EtherObj@@2JA, edx ; EtherObj::RDLPointer
; Line 59
	mov	eax, DWORD PTR _rbufferPointer$[ebp]
	mov	DWORD PTR ?RDLDataPointer@EtherObj@@2JA, eax ; EtherObj::RDLDataPointer
; Line 61
	push	480					; 000001e0H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?printDiag@EtherObj@@QAEHH@Z		; EtherObj::printDiag
; Line 63
	mov	ecx, DWORD PTR _this$[ebp]
	call	?createTDL@EtherObj@@QAEHXZ		; EtherObj::createTDL
	mov	DWORD PTR _retcode$[ebp], eax
; Line 64
	mov	ecx, DWORD PTR _this$[ebp]
	call	?createRDL@EtherObj@@QAEHXZ		; EtherObj::createRDL
	mov	DWORD PTR _retcode$[ebp], eax
; Line 67
	mov	ecx, DWORD PTR _tdtail$[ebp]
	push	ecx
	push	0
	push	512					; 00000200H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?initTDL@EtherObj@@QAEHHHH@Z		; EtherObj::initTDL
	mov	DWORD PTR _retcode$[ebp], eax
; Line 70
	mov	edx, DWORD PTR _rdtail$[ebp]
	push	edx
	push	0
	push	512					; 00000200H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?initRDL@EtherObj@@QAEHHHH@Z		; EtherObj::initRDL
	mov	DWORD PTR _retcode$[ebp], eax
; Line 71
	xor	eax, eax
; Line 72
	mov	esp, ebp
	pop	ebp
	ret	16					; 00000010H
?inittest@EtherObj@@QAEHJJJJ@Z ENDP			; EtherObj::inittest
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
; Line 78
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 79
	mov	DWORD PTR _retcode$[ebp], 0
; Line 81
	mov	eax, DWORD PTR ?TDLPointer@EtherObj@@2JA ; EtherObj::TDLPointer
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setTDBALow@EtherObj@@QAEHH@Z		; EtherObj::setTDBALow
	mov	DWORD PTR _retcode$[ebp], eax
; Line 82
	push	0
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setTDBAHigh@EtherObj@@QAEHH@Z		; EtherObj::setTDBAHigh
	mov	DWORD PTR _retcode$[ebp], eax
; Line 83
	mov	ecx, DWORD PTR _len$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setTDLen@EtherObj@@QAEHH@Z		; EtherObj::setTDLen
	mov	DWORD PTR _retcode$[ebp], eax
; Line 84
	mov	edx, DWORD PTR _head$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setTDHead@EtherObj@@QAEHH@Z		; EtherObj::setTDHead
	mov	DWORD PTR _retcode$[ebp], eax
; Line 85
	mov	eax, DWORD PTR _tail$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setTDTail@EtherObj@@QAEHH@Z		; EtherObj::setTDTail
	mov	DWORD PTR _retcode$[ebp], eax
; Line 87
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 88
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
; Line 94
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 95
	mov	DWORD PTR _retcode$[ebp], 0
; Line 97
	mov	eax, DWORD PTR ?RDLPointer@EtherObj@@2JA ; EtherObj::RDLPointer
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRDBALow@EtherObj@@QAEHH@Z		; EtherObj::setRDBALow
	mov	DWORD PTR _retcode$[ebp], eax
; Line 98
	push	0
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRDBAHigh@EtherObj@@QAEHH@Z		; EtherObj::setRDBAHigh
	mov	DWORD PTR _retcode$[ebp], eax
; Line 99
	mov	ecx, DWORD PTR _len$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRDLen@EtherObj@@QAEHH@Z		; EtherObj::setRDLen
	mov	DWORD PTR _retcode$[ebp], eax
; Line 100
	mov	edx, DWORD PTR _head$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRDHead@EtherObj@@QAEHH@Z		; EtherObj::setRDHead
	mov	DWORD PTR _retcode$[ebp], eax
; Line 101
	mov	eax, DWORD PTR _tail$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRDTail@EtherObj@@QAEHH@Z		; EtherObj::setRDTail
	mov	DWORD PTR _retcode$[ebp], eax
; Line 103
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 104
	mov	esp, ebp
	pop	ebp
	ret	12					; 0000000cH
?initRDL@EtherObj@@QAEHHHH@Z ENDP			; EtherObj::initRDL
_this$ = -16
_i$ = -4
_lptr$ = -12
_l$ = -8
?createTDL@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::createTDL
; Line 112
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	mov	DWORD PTR _this$[ebp], ecx
; Line 116
	lea	eax, DWORD PTR _l$[ebp]
	mov	DWORD PTR _lptr$[ebp], eax
; Line 124
	mov	ecx, DWORD PTR ?TDLPointer@EtherObj@@2JA ; EtherObj::TDLPointer
	sub	ecx, 1114112				; 00110000H
	mov	DWORD PTR _lptr$[ebp], ecx
; Line 126
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1118
$L1119:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L1118:
	cmp	DWORD PTR _i$[ebp], 4096		; 00001000H
	jge	SHORT $L1120
; Line 128
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 1600				; 00000640H
	mov	ecx, DWORD PTR ?TDLDataPointer@EtherObj@@2JA ; EtherObj::TDLDataPointer
	add	ecx, eax
	mov	edx, DWORD PTR _lptr$[ebp]
	mov	DWORD PTR [edx], ecx
; Line 129
	mov	eax, DWORD PTR _lptr$[ebp]
	add	eax, 4
	mov	DWORD PTR _lptr$[ebp], eax
; Line 130
	mov	ecx, DWORD PTR _lptr$[ebp]
	mov	DWORD PTR [ecx], 0
; Line 131
	mov	edx, DWORD PTR _lptr$[ebp]
	add	edx, 4
	mov	DWORD PTR _lptr$[ebp], edx
; Line 132
	mov	eax, DWORD PTR _lptr$[ebp]
	mov	DWORD PTR [eax], 184549376		; 0b000000H
; Line 137
	mov	ecx, DWORD PTR _lptr$[ebp]
	add	ecx, 4
	mov	DWORD PTR _lptr$[ebp], ecx
; Line 138
	mov	edx, DWORD PTR _lptr$[ebp]
	mov	DWORD PTR [edx], 0
; Line 139
	mov	eax, DWORD PTR _lptr$[ebp]
	add	eax, 4
	mov	DWORD PTR _lptr$[ebp], eax
; Line 140
	jmp	SHORT $L1119
$L1120:
; Line 142
	xor	eax, eax
; Line 143
	mov	esp, ebp
	pop	ebp
	ret	0
?createTDL@EtherObj@@QAEHXZ ENDP			; EtherObj::createTDL
_this$ = -16
_i$ = -4
_lptr$ = -12
_l$ = -8
?createRDL@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::createRDL
; Line 151
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	mov	DWORD PTR _this$[ebp], ecx
; Line 155
	lea	eax, DWORD PTR _l$[ebp]
	mov	DWORD PTR _lptr$[ebp], eax
; Line 165
	mov	ecx, DWORD PTR ?RDLPointer@EtherObj@@2JA ; EtherObj::RDLPointer
	sub	ecx, 1114112				; 00110000H
	mov	DWORD PTR _lptr$[ebp], ecx
; Line 167
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1128
$L1129:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L1128:
	cmp	DWORD PTR _i$[ebp], 4096		; 00001000H
	jge	SHORT $L1130
; Line 169
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 11					; 0000000bH
	mov	ecx, DWORD PTR ?RDLDataPointer@EtherObj@@2JA ; EtherObj::RDLDataPointer
	add	ecx, eax
	mov	edx, DWORD PTR _lptr$[ebp]
	mov	DWORD PTR [edx], ecx
; Line 170
	mov	eax, DWORD PTR _lptr$[ebp]
	add	eax, 4
	mov	DWORD PTR _lptr$[ebp], eax
; Line 171
	mov	ecx, DWORD PTR _lptr$[ebp]
	mov	DWORD PTR [ecx], 0
; Line 172
	mov	edx, DWORD PTR _lptr$[ebp]
	add	edx, 4
	mov	DWORD PTR _lptr$[ebp], edx
; Line 173
	mov	eax, DWORD PTR _lptr$[ebp]
	mov	DWORD PTR [eax], 0
; Line 174
	mov	ecx, DWORD PTR _lptr$[ebp]
	add	ecx, 4
	mov	DWORD PTR _lptr$[ebp], ecx
; Line 175
	mov	edx, DWORD PTR _lptr$[ebp]
	mov	DWORD PTR [edx], 0
; Line 176
	mov	eax, DWORD PTR _lptr$[ebp]
	add	eax, 4
	mov	DWORD PTR _lptr$[ebp], eax
; Line 177
	jmp	SHORT $L1129
$L1130:
; Line 179
	xor	eax, eax
; Line 180
	mov	esp, ebp
	pop	ebp
	ret	0
?createRDL@EtherObj@@QAEHXZ ENDP			; EtherObj::createRDL
_TEXT	ENDS
PUBLIC	?getBaseAddress@EtherObj@@QAEHXZ		; EtherObj::getBaseAddress
_TEXT	SEGMENT
_this$ = -4
?getBaseAddress@EtherObj@@QAEHXZ PROC NEAR		; EtherObj::getBaseAddress
; Line 186
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 187
	movsx	eax, WORD PTR ?IO_BASE@EtherObj@@0FA	; EtherObj::IO_BASE
; Line 188
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
; Line 193
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 194
	mov	ax, WORD PTR _addr$[ebp]
	mov	WORD PTR ?IO_BASE@EtherObj@@0FA, ax	; EtherObj::IO_BASE
; Line 195
	mov	ecx, DWORD PTR _addr$[ebp]
	mov	DWORD PTR ?IOADDR@EtherObj@@0KA, ecx	; EtherObj::IOADDR
; Line 196
	mov	edx, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	add	edx, 4
	mov	DWORD PTR ?IODATA@EtherObj@@0KA, edx	; EtherObj::IODATA
; Line 197
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
; Line 203
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 204
	mov	DWORD PTR _retcode$[ebp], 0
; Line 206
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getECompatibility@EtherObj@@QAEHXZ	; EtherObj::getECompatibility
	mov	DWORD PTR _retcode$[ebp], eax
; Line 207
	mov	eax, DWORD PTR _line$[ebp]
	push	eax
	mov	ecx, DWORD PTR _retcode$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 209
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getEDeviceId@EtherObj@@QAEHXZ		; EtherObj::getEDeviceId
	mov	DWORD PTR _retcode$[ebp], eax
; Line 210
	mov	edx, DWORD PTR _line$[ebp]
	add	edx, 20					; 00000014H
	push	edx
	mov	eax, DWORD PTR _retcode$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 212
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getEVendorId@EtherObj@@QAEHXZ		; EtherObj::getEVendorId
	mov	DWORD PTR _retcode$[ebp], eax
; Line 213
	mov	ecx, DWORD PTR _line$[ebp]
	add	ecx, 40					; 00000028H
	push	ecx
	mov	edx, DWORD PTR _retcode$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 215
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getEInitCtrl1@EtherObj@@QAEHXZ		; EtherObj::getEInitCtrl1
	mov	DWORD PTR _retcode$[ebp], eax
; Line 216
	mov	eax, DWORD PTR _line$[ebp]
	add	eax, 60					; 0000003cH
	push	eax
	mov	ecx, DWORD PTR _retcode$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 218
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getEInitCtrl2@EtherObj@@QAEHXZ		; EtherObj::getEInitCtrl2
	mov	DWORD PTR _retcode$[ebp], eax
; Line 219
	mov	edx, DWORD PTR _line$[ebp]
	add	edx, 80					; 00000050H
	push	edx
	mov	eax, DWORD PTR _retcode$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 221
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getEInitCtrl3@EtherObj@@QAEHXZ		; EtherObj::getEInitCtrl3
	mov	DWORD PTR _retcode$[ebp], eax
; Line 222
	mov	ecx, DWORD PTR _line$[ebp]
	add	ecx, 100				; 00000064H
	push	ecx
	mov	edx, DWORD PTR _retcode$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 224
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getEMgmtCtrl@EtherObj@@QAEHXZ		; EtherObj::getEMgmtCtrl
	mov	DWORD PTR _retcode$[ebp], eax
; Line 225
	mov	eax, DWORD PTR _line$[ebp]
	add	eax, 120				; 00000078H
	push	eax
	mov	ecx, DWORD PTR _retcode$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 227
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getEIPv4Byte01@EtherObj@@QAEHXZ	; EtherObj::getEIPv4Byte01
	mov	DWORD PTR _retcode$[ebp], eax
; Line 228
	mov	edx, DWORD PTR _line$[ebp]
	add	edx, 160				; 000000a0H
	push	edx
	mov	eax, DWORD PTR _retcode$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 230
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getEIPv4Byte23@EtherObj@@QAEHXZ	; EtherObj::getEIPv4Byte23
	mov	DWORD PTR _retcode$[ebp], eax
; Line 231
	mov	ecx, DWORD PTR _line$[ebp]
	add	ecx, 180				; 000000b4H
	push	ecx
	mov	edx, DWORD PTR _retcode$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 233
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getControl@EtherObj@@QAEHXZ		; EtherObj::getControl
	mov	DWORD PTR _retcode$[ebp], eax
; Line 234
	mov	eax, DWORD PTR _line$[ebp]
	add	eax, 200				; 000000c8H
	push	eax
	mov	ecx, DWORD PTR _retcode$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 236
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getStatus@EtherObj@@QAEHXZ		; EtherObj::getStatus
	mov	DWORD PTR _retcode$[ebp], eax
; Line 237
	mov	edx, DWORD PTR _line$[ebp]
	add	edx, 220				; 000000dcH
	push	edx
	mov	eax, DWORD PTR _retcode$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 239
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getMdicPhyCtrl@EtherObj@@QAEHXZ	; EtherObj::getMdicPhyCtrl
	mov	DWORD PTR _retcode$[ebp], eax
; Line 240
	mov	ecx, DWORD PTR _line$[ebp]
	add	ecx, 240				; 000000f0H
	push	ecx
	mov	edx, DWORD PTR _retcode$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 242
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getMdicPhyStat@EtherObj@@QAEHXZ	; EtherObj::getMdicPhyStat
	mov	DWORD PTR _retcode$[ebp], eax
; Line 243
	mov	eax, DWORD PTR _line$[ebp]
	add	eax, 260				; 00000104H
	push	eax
	mov	ecx, DWORD PTR _retcode$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 245
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getInterruptMaskSet@EtherObj@@QAEHXZ	; EtherObj::getInterruptMaskSet
	mov	DWORD PTR _retcode$[ebp], eax
; Line 246
	mov	edx, DWORD PTR _line$[ebp]
	add	edx, 280				; 00000118H
	push	edx
	mov	eax, DWORD PTR _retcode$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 248
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getInterruptMaskClear@EtherObj@@QAEHXZ	; EtherObj::getInterruptMaskClear
	mov	DWORD PTR _retcode$[ebp], eax
; Line 249
	mov	ecx, DWORD PTR _line$[ebp]
	add	ecx, 320				; 00000140H
	push	ecx
	mov	edx, DWORD PTR _retcode$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 251
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getTDBALow@EtherObj@@QAEHXZ		; EtherObj::getTDBALow
	mov	DWORD PTR _retcode$[ebp], eax
; Line 252
	mov	eax, DWORD PTR _line$[ebp]
	add	eax, 340				; 00000154H
	push	eax
	mov	ecx, DWORD PTR _retcode$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 254
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getTDBAHigh@EtherObj@@QAEHXZ		; EtherObj::getTDBAHigh
	mov	DWORD PTR _retcode$[ebp], eax
; Line 255
	mov	edx, DWORD PTR _line$[ebp]
	add	edx, 360				; 00000168H
	push	edx
	mov	eax, DWORD PTR _retcode$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 257
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getTDLen@EtherObj@@QAEHXZ		; EtherObj::getTDLen
	mov	DWORD PTR _retcode$[ebp], eax
; Line 258
	mov	ecx, DWORD PTR _line$[ebp]
	add	ecx, 380				; 0000017cH
	push	ecx
	mov	edx, DWORD PTR _retcode$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 260
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getTDHead@EtherObj@@QAEHXZ		; EtherObj::getTDHead
	mov	DWORD PTR _retcode$[ebp], eax
; Line 261
	mov	eax, DWORD PTR _line$[ebp]
	add	eax, 400				; 00000190H
	push	eax
	mov	ecx, DWORD PTR _retcode$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 263
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getTDTail@EtherObj@@QAEHXZ		; EtherObj::getTDTail
	mov	DWORD PTR _retcode$[ebp], eax
; Line 264
	mov	edx, DWORD PTR _line$[ebp]
	add	edx, 420				; 000001a4H
	push	edx
	mov	eax, DWORD PTR _retcode$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 266
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getTCtrl@EtherObj@@QAEHXZ		; EtherObj::getTCtrl
	mov	DWORD PTR _retcode$[ebp], eax
; Line 267
	mov	ecx, DWORD PTR _line$[ebp]
	add	ecx, 440				; 000001b8H
	push	ecx
	mov	edx, DWORD PTR _retcode$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 269
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRAL0@EtherObj@@QAEHXZ		; EtherObj::getRAL0
	mov	DWORD PTR _retcode$[ebp], eax
; Line 270
	mov	eax, DWORD PTR _line$[ebp]
	add	eax, 480				; 000001e0H
	push	eax
	mov	ecx, DWORD PTR _retcode$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 272
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRAH0@EtherObj@@QAEHXZ		; EtherObj::getRAH0
	mov	DWORD PTR _retcode$[ebp], eax
; Line 273
	mov	edx, DWORD PTR _line$[ebp]
	add	edx, 500				; 000001f4H
	push	edx
	mov	eax, DWORD PTR _retcode$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 275
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRAL1@EtherObj@@QAEHXZ		; EtherObj::getRAL1
	mov	DWORD PTR _retcode$[ebp], eax
; Line 276
	mov	ecx, DWORD PTR _line$[ebp]
	add	ecx, 520				; 00000208H
	push	ecx
	mov	edx, DWORD PTR _retcode$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 278
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRAH1@EtherObj@@QAEHXZ		; EtherObj::getRAH1
	mov	DWORD PTR _retcode$[ebp], eax
; Line 279
	mov	eax, DWORD PTR _line$[ebp]
	add	eax, 540				; 0000021cH
	push	eax
	mov	ecx, DWORD PTR _retcode$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 281
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 282
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
; Line 289
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 290
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1148
$L1149:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L1148:
	cmp	DWORD PTR _i$[ebp], 6
	jge	SHORT $L1150
; Line 291
	mov	ecx, DWORD PTR _dMAC$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	mov	al, BYTE PTR ?mac@EtherObj@@2PADA[edx]
	mov	BYTE PTR [ecx], al
	jmp	SHORT $L1149
$L1150:
; Line 292
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
; Line 303
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	mov	DWORD PTR _this$[ebp], ecx
; Line 304
	mov	DWORD PTR _retcode$[ebp], 0
; Line 305
	mov	DWORD PTR _i$[ebp], 0
; Line 306
	mov	DWORD PTR _temp$[ebp], 0
; Line 322
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	20					; 00000014H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 328
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	push	1
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
$L1158:
; Line 332
	mov	edx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 333
	mov	eax, DWORD PTR _retcode$[ebp]
	and	eax, 16					; 00000010H
	test	eax, eax
	je	SHORT $L1158
; Line 335
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 337
	mov	edx, DWORD PTR _retcode$[ebp]
	and	edx, 16711680				; 00ff0000H
	sar	edx, 16					; 00000010H
	mov	BYTE PTR ?mac@EtherObj@@2PADA, dl
; Line 338
	mov	eax, DWORD PTR _retcode$[ebp]
	and	eax, -16777216				; ff000000H
	shr	eax, 24					; 00000018H
	mov	BYTE PTR ?mac@EtherObj@@2PADA+1, al
; Line 344
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	push	257					; 00000101H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
$L1161:
; Line 348
	mov	edx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 349
	mov	eax, DWORD PTR _retcode$[ebp]
	and	eax, 16					; 00000010H
	test	eax, eax
	je	SHORT $L1161
; Line 351
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 353
	mov	edx, DWORD PTR _retcode$[ebp]
	and	edx, 16711680				; 00ff0000H
	sar	edx, 16					; 00000010H
	mov	BYTE PTR ?mac@EtherObj@@2PADA+2, dl
; Line 354
	mov	eax, DWORD PTR _retcode$[ebp]
	and	eax, -16777216				; ff000000H
	shr	eax, 24					; 00000018H
	mov	BYTE PTR ?mac@EtherObj@@2PADA+3, al
; Line 360
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	push	513					; 00000201H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
$L1164:
; Line 364
	mov	edx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 365
	mov	eax, DWORD PTR _retcode$[ebp]
	and	eax, 16					; 00000010H
	test	eax, eax
	je	SHORT $L1164
; Line 367
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 369
	mov	edx, DWORD PTR _retcode$[ebp]
	and	edx, 16711680				; 00ff0000H
	sar	edx, 16					; 00000010H
	mov	BYTE PTR ?mac@EtherObj@@2PADA+4, dl
; Line 370
	mov	eax, DWORD PTR _retcode$[ebp]
	and	eax, -16777216				; ff000000H
	shr	eax, 24					; 00000018H
	mov	BYTE PTR ?mac@EtherObj@@2PADA+5, al
; Line 373
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1167
$L1168:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L1167:
	cmp	DWORD PTR _i$[ebp], 6
	jge	SHORT $L1169
; Line 374
	mov	edx, DWORD PTR _dMAC$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	mov	cl, BYTE PTR ?mac@EtherObj@@2PADA[eax]
	mov	BYTE PTR [edx], cl
	jmp	SHORT $L1168
$L1169:
; Line 376
	mov	DWORD PTR _temp$[ebp], 0
; Line 378
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1170
$L1171:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L1170:
	cmp	DWORD PTR _i$[ebp], 4
	jge	SHORT $L1172
; Line 380
	mov	eax, DWORD PTR _i$[ebp]
	movsx	ecx, BYTE PTR ?mac@EtherObj@@2PADA[eax]
	and	ecx, 255				; 000000ffH
	mov	edx, DWORD PTR _temp$[ebp]
	or	edx, ecx
	mov	DWORD PTR _temp$[ebp], edx
; Line 381
	cmp	DWORD PTR _i$[ebp], 3
	jge	SHORT $L1173
; Line 383
	mov	eax, DWORD PTR _temp$[ebp]
	shl	eax, 8
	mov	DWORD PTR _temp$[ebp], eax
$L1173:
; Line 385
	jmp	SHORT $L1171
$L1172:
; Line 386
	push	3900					; 00000f3cH
	mov	ecx, DWORD PTR _temp$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 388
	mov	DWORD PTR _temp$[ebp], 0
; Line 390
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1174
$L1175:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L1174:
	cmp	DWORD PTR _i$[ebp], 2
	jge	SHORT $L1176
; Line 392
	mov	eax, DWORD PTR _i$[ebp]
	movsx	ecx, BYTE PTR ?mac@EtherObj@@2PADA[eax+4]
	and	ecx, 255				; 000000ffH
	mov	edx, DWORD PTR _temp$[ebp]
	or	edx, ecx
	mov	DWORD PTR _temp$[ebp], edx
; Line 393
	mov	eax, DWORD PTR _temp$[ebp]
	shl	eax, 8
	mov	DWORD PTR _temp$[ebp], eax
; Line 394
	jmp	SHORT $L1175
$L1176:
; Line 396
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1177
$L1178:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L1177:
	cmp	DWORD PTR _i$[ebp], 2
	jge	SHORT $L1179
; Line 398
	mov	edx, DWORD PTR _temp$[ebp]
	or	dl, -1
	mov	DWORD PTR _temp$[ebp], edx
; Line 399
	cmp	DWORD PTR _i$[ebp], 1
	jge	SHORT $L1180
; Line 401
	mov	eax, DWORD PTR _temp$[ebp]
	shl	eax, 8
	mov	DWORD PTR _temp$[ebp], eax
$L1180:
; Line 403
	jmp	SHORT $L1178
$L1179:
; Line 405
	push	3920					; 00000f50H
	mov	ecx, DWORD PTR _temp$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 406
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
; Line 412
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 413
	mov	eax, DWORD PTR _iobase$[ebp]
	push	eax
	call	_cigetRegister32
	add	esp, 4
; Line 414
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
; Line 420
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 421
	mov	eax, DWORD PTR _iobase$[ebp]
	push	eax
	mov	ecx, DWORD PTR _value$[ebp]
	push	ecx
	call	_cisetRegister32
	add	esp, 8
; Line 422
	mov	esp, ebp
	pop	ebp
	ret	8
?setRegister32@EtherObj@@QAEXHK@Z ENDP			; EtherObj::setRegister32
_this$ = -8
_retcode$ = -4
?getECompatibility@EtherObj@@QAEHXZ PROC NEAR		; EtherObj::getECompatibility
; Line 429
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 430
	mov	DWORD PTR _retcode$[ebp], 0
; Line 434
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	20					; 00000014H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 438
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	push	769					; 00000301H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
$L1194:
; Line 442
	mov	edx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 443
	mov	eax, DWORD PTR _retcode$[ebp]
	and	eax, 16					; 00000010H
	test	eax, eax
	je	SHORT $L1194
; Line 445
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 447
	mov	edx, DWORD PTR _retcode$[ebp]
	and	edx, -65536				; ffff0000H
	mov	DWORD PTR _retcode$[ebp], edx
; Line 448
	mov	eax, DWORD PTR _retcode$[ebp]
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _retcode$[ebp], eax
; Line 450
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 451
	mov	esp, ebp
	pop	ebp
	ret	0
?getECompatibility@EtherObj@@QAEHXZ ENDP		; EtherObj::getECompatibility
_this$ = -8
_retcode$ = -4
?getEDeviceId@EtherObj@@QAEHXZ PROC NEAR		; EtherObj::getEDeviceId
; Line 458
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 459
	mov	DWORD PTR _retcode$[ebp], 0
; Line 463
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	20					; 00000014H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 468
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	push	3329					; 00000d01H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
$L1201:
; Line 472
	mov	edx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 473
	mov	eax, DWORD PTR _retcode$[ebp]
	and	eax, 16					; 00000010H
	test	eax, eax
	je	SHORT $L1201
; Line 475
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 477
	mov	edx, DWORD PTR _retcode$[ebp]
	and	edx, -65536				; ffff0000H
	mov	DWORD PTR _retcode$[ebp], edx
; Line 478
	mov	eax, DWORD PTR _retcode$[ebp]
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _retcode$[ebp], eax
; Line 480
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 481
	mov	esp, ebp
	pop	ebp
	ret	0
?getEDeviceId@EtherObj@@QAEHXZ ENDP			; EtherObj::getEDeviceId
_this$ = -8
_retcode$ = -4
?getEVendorId@EtherObj@@QAEHXZ PROC NEAR		; EtherObj::getEVendorId
; Line 488
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 489
	mov	DWORD PTR _retcode$[ebp], 0
; Line 493
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	20					; 00000014H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 498
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	push	3585					; 00000e01H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
$L1208:
; Line 502
	mov	edx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 503
	mov	eax, DWORD PTR _retcode$[ebp]
	and	eax, 16					; 00000010H
	test	eax, eax
	je	SHORT $L1208
; Line 505
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 507
	mov	edx, DWORD PTR _retcode$[ebp]
	and	edx, -65536				; ffff0000H
	mov	DWORD PTR _retcode$[ebp], edx
; Line 508
	mov	eax, DWORD PTR _retcode$[ebp]
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _retcode$[ebp], eax
; Line 510
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 511
	mov	esp, ebp
	pop	ebp
	ret	0
?getEVendorId@EtherObj@@QAEHXZ ENDP			; EtherObj::getEVendorId
_this$ = -8
_retcode$ = -4
?getEInitCtrl1@EtherObj@@QAEHXZ PROC NEAR		; EtherObj::getEInitCtrl1
; Line 519
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 520
	mov	DWORD PTR _retcode$[ebp], 0
; Line 524
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	20					; 00000014H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 529
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	push	2561					; 00000a01H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
$L1215:
; Line 533
	mov	edx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 534
	mov	eax, DWORD PTR _retcode$[ebp]
	and	eax, 16					; 00000010H
	test	eax, eax
	je	SHORT $L1215
; Line 536
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 538
	mov	edx, DWORD PTR _retcode$[ebp]
	and	edx, -65536				; ffff0000H
	mov	DWORD PTR _retcode$[ebp], edx
; Line 539
	mov	eax, DWORD PTR _retcode$[ebp]
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _retcode$[ebp], eax
; Line 541
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 542
	mov	esp, ebp
	pop	ebp
	ret	0
?getEInitCtrl1@EtherObj@@QAEHXZ ENDP			; EtherObj::getEInitCtrl1
_this$ = -8
_retcode$ = -4
?getEInitCtrl2@EtherObj@@QAEHXZ PROC NEAR		; EtherObj::getEInitCtrl2
; Line 549
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 550
	mov	DWORD PTR _retcode$[ebp], 0
; Line 554
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	20					; 00000014H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 559
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	push	3841					; 00000f01H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
$L1222:
; Line 563
	mov	edx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 564
	mov	eax, DWORD PTR _retcode$[ebp]
	and	eax, 16					; 00000010H
	test	eax, eax
	je	SHORT $L1222
; Line 566
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 568
	mov	edx, DWORD PTR _retcode$[ebp]
	and	edx, -65536				; ffff0000H
	mov	DWORD PTR _retcode$[ebp], edx
; Line 569
	mov	eax, DWORD PTR _retcode$[ebp]
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _retcode$[ebp], eax
; Line 571
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 572
	mov	esp, ebp
	pop	ebp
	ret	0
?getEInitCtrl2@EtherObj@@QAEHXZ ENDP			; EtherObj::getEInitCtrl2
_this$ = -8
_retcode$ = -4
?getEMgmtCtrl@EtherObj@@QAEHXZ PROC NEAR		; EtherObj::getEMgmtCtrl
; Line 579
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 580
	mov	DWORD PTR _retcode$[ebp], 0
; Line 584
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	20					; 00000014H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 589
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	push	8961					; 00002301H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
$L1229:
; Line 593
	mov	edx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 594
	mov	eax, DWORD PTR _retcode$[ebp]
	and	eax, 16					; 00000010H
	test	eax, eax
	je	SHORT $L1229
; Line 596
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 598
	mov	edx, DWORD PTR _retcode$[ebp]
	and	edx, -65536				; ffff0000H
	mov	DWORD PTR _retcode$[ebp], edx
; Line 599
	mov	eax, DWORD PTR _retcode$[ebp]
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _retcode$[ebp], eax
; Line 601
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 602
	mov	esp, ebp
	pop	ebp
	ret	0
?getEMgmtCtrl@EtherObj@@QAEHXZ ENDP			; EtherObj::getEMgmtCtrl
_this$ = -8
_retcode$ = -4
?getEInitCtrl3@EtherObj@@QAEHXZ PROC NEAR		; EtherObj::getEInitCtrl3
; Line 609
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 610
	mov	DWORD PTR _retcode$[ebp], 0
; Line 614
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	20					; 00000014H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 619
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	push	9217					; 00002401H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
$L1236:
; Line 623
	mov	edx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 624
	mov	eax, DWORD PTR _retcode$[ebp]
	and	eax, 16					; 00000010H
	test	eax, eax
	je	SHORT $L1236
; Line 626
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 628
	mov	edx, DWORD PTR _retcode$[ebp]
	and	edx, -65536				; ffff0000H
	mov	DWORD PTR _retcode$[ebp], edx
; Line 629
	mov	eax, DWORD PTR _retcode$[ebp]
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _retcode$[ebp], eax
; Line 631
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 632
	mov	esp, ebp
	pop	ebp
	ret	0
?getEInitCtrl3@EtherObj@@QAEHXZ ENDP			; EtherObj::getEInitCtrl3
_this$ = -8
_retcode$ = -4
?getEIPv4Byte01@EtherObj@@QAEHXZ PROC NEAR		; EtherObj::getEIPv4Byte01
; Line 639
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 640
	mov	DWORD PTR _retcode$[ebp], 0
; Line 644
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	20					; 00000014H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 649
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	push	9473					; 00002501H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
$L1243:
; Line 653
	mov	edx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 654
	mov	eax, DWORD PTR _retcode$[ebp]
	and	eax, 16					; 00000010H
	test	eax, eax
	je	SHORT $L1243
; Line 656
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 658
	mov	edx, DWORD PTR _retcode$[ebp]
	and	edx, -65536				; ffff0000H
	mov	DWORD PTR _retcode$[ebp], edx
; Line 659
	mov	eax, DWORD PTR _retcode$[ebp]
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _retcode$[ebp], eax
; Line 661
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 662
	mov	esp, ebp
	pop	ebp
	ret	0
?getEIPv4Byte01@EtherObj@@QAEHXZ ENDP			; EtherObj::getEIPv4Byte01
_this$ = -8
_retcode$ = -4
?getEIPv4Byte23@EtherObj@@QAEHXZ PROC NEAR		; EtherObj::getEIPv4Byte23
; Line 669
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 670
	mov	DWORD PTR _retcode$[ebp], 0
; Line 674
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	20					; 00000014H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 679
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	push	9729					; 00002601H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
$L1250:
; Line 683
	mov	edx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 684
	mov	eax, DWORD PTR _retcode$[ebp]
	and	eax, 16					; 00000010H
	test	eax, eax
	je	SHORT $L1250
; Line 686
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 688
	mov	edx, DWORD PTR _retcode$[ebp]
	and	edx, -65536				; ffff0000H
	mov	DWORD PTR _retcode$[ebp], edx
; Line 689
	mov	eax, DWORD PTR _retcode$[ebp]
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _retcode$[ebp], eax
; Line 691
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 692
	mov	esp, ebp
	pop	ebp
	ret	0
?getEIPv4Byte23@EtherObj@@QAEHXZ ENDP			; EtherObj::getEIPv4Byte23
_this$ = -8
_retcode$ = -4
?getControl@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::getControl
; Line 699
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 700
	mov	DWORD PTR _retcode$[ebp], 0
; Line 703
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	0
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 705
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 707
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 708
	mov	esp, ebp
	pop	ebp
	ret	0
?getControl@EtherObj@@QAEHXZ ENDP			; EtherObj::getControl
_this$ = -8
_retcode$ = -4
?getStatus@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::getStatus
; Line 715
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 716
	mov	DWORD PTR _retcode$[ebp], 0
; Line 719
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	8
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 721
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 723
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 724
	mov	esp, ebp
	pop	ebp
	ret	0
?getStatus@EtherObj@@QAEHXZ ENDP			; EtherObj::getStatus
_this$ = -8
_retcode$ = -4
?getMdicPhyCtrl@EtherObj@@QAEHXZ PROC NEAR		; EtherObj::getMdicPhyCtrl
; Line 731
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 732
	mov	DWORD PTR _retcode$[ebp], 0
; Line 736
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	32					; 00000020H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 749
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	push	136314880				; 08200000H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
$L1265:
; Line 753
	mov	edx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 754
	mov	eax, DWORD PTR _retcode$[ebp]
	and	eax, 268435456				; 10000000H
	test	eax, eax
	je	SHORT $L1265
; Line 756
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 758
	mov	edx, DWORD PTR _retcode$[ebp]
	and	edx, 65535				; 0000ffffH
	mov	DWORD PTR _retcode$[ebp], edx
; Line 760
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 761
	mov	esp, ebp
	pop	ebp
	ret	0
?getMdicPhyCtrl@EtherObj@@QAEHXZ ENDP			; EtherObj::getMdicPhyCtrl
_this$ = -8
_retcode$ = -4
?getMdicPhyStat@EtherObj@@QAEHXZ PROC NEAR		; EtherObj::getMdicPhyStat
; Line 768
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 769
	mov	DWORD PTR _retcode$[ebp], 0
; Line 773
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	32					; 00000020H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 786
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	push	136380416				; 08210000H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
$L1272:
; Line 790
	mov	edx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 791
	mov	eax, DWORD PTR _retcode$[ebp]
	and	eax, 268435456				; 10000000H
	test	eax, eax
	je	SHORT $L1272
; Line 793
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 795
	mov	edx, DWORD PTR _retcode$[ebp]
	and	edx, 65535				; 0000ffffH
	mov	DWORD PTR _retcode$[ebp], edx
; Line 797
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 798
	mov	esp, ebp
	pop	ebp
	ret	0
?getMdicPhyStat@EtherObj@@QAEHXZ ENDP			; EtherObj::getMdicPhyStat
_this$ = -8
_retcode$ = -4
?getInterruptMaskSet@EtherObj@@QAEHXZ PROC NEAR		; EtherObj::getInterruptMaskSet
; Line 805
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 806
	mov	DWORD PTR _retcode$[ebp], 0
; Line 809
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	208					; 000000d0H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 816
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 818
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 819
	mov	esp, ebp
	pop	ebp
	ret	0
?getInterruptMaskSet@EtherObj@@QAEHXZ ENDP		; EtherObj::getInterruptMaskSet
_this$ = -8
_retcode$ = -4
?getInterruptMaskClear@EtherObj@@QAEHXZ PROC NEAR	; EtherObj::getInterruptMaskClear
; Line 826
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 827
	mov	DWORD PTR _retcode$[ebp], 0
; Line 830
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	216					; 000000d8H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 837
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 839
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 840
	mov	esp, ebp
	pop	ebp
	ret	0
?getInterruptMaskClear@EtherObj@@QAEHXZ ENDP		; EtherObj::getInterruptMaskClear
_this$ = -8
_retcode$ = -4
?getTDBALow@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::getTDBALow
; Line 847
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 848
	mov	DWORD PTR _retcode$[ebp], 0
; Line 851
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	14336					; 00003800H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 859
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 861
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 862
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
; Line 869
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 870
	mov	DWORD PTR _retcode$[ebp], 0
; Line 873
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	10240					; 00002800H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 881
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 883
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 884
	mov	esp, ebp
	pop	ebp
	ret	0
?getRDBALow@EtherObj@@QAEHXZ ENDP			; EtherObj::getRDBALow
_addr$ = 8
_this$ = -12
_retcode$ = -4
_temp$ = -8
?setTDBALow@EtherObj@@QAEHH@Z PROC NEAR			; EtherObj::setTDBALow
; Line 891
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 892
	mov	DWORD PTR _retcode$[ebp], 0
; Line 893
	mov	DWORD PTR _temp$[ebp], 0
; Line 896
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	14336					; 00003800H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 905
	mov	ecx, DWORD PTR _addr$[ebp]
	mov	DWORD PTR _temp$[ebp], ecx
; Line 906
	mov	edx, DWORD PTR _temp$[ebp]
	and	edx, -16				; fffffff0H
	mov	DWORD PTR _temp$[ebp], edx
; Line 908
	mov	eax, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	eax
	mov	ecx, DWORD PTR _temp$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 910
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 911
	mov	esp, ebp
	pop	ebp
	ret	4
?setTDBALow@EtherObj@@QAEHH@Z ENDP			; EtherObj::setTDBALow
_addr$ = 8
_this$ = -12
_retcode$ = -4
_temp$ = -8
?setRDBALow@EtherObj@@QAEHH@Z PROC NEAR			; EtherObj::setRDBALow
; Line 918
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 919
	mov	DWORD PTR _retcode$[ebp], 0
; Line 920
	mov	DWORD PTR _temp$[ebp], 0
; Line 923
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	10240					; 00002800H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 932
	mov	ecx, DWORD PTR _addr$[ebp]
	mov	DWORD PTR _temp$[ebp], ecx
; Line 933
	mov	edx, DWORD PTR _temp$[ebp]
	and	edx, -16				; fffffff0H
	mov	DWORD PTR _temp$[ebp], edx
; Line 935
	mov	eax, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	eax
	mov	ecx, DWORD PTR _temp$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 937
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 938
	mov	esp, ebp
	pop	ebp
	ret	4
?setRDBALow@EtherObj@@QAEHH@Z ENDP			; EtherObj::setRDBALow
_this$ = -8
_retcode$ = -4
?getTDBAHigh@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::getTDBAHigh
; Line 945
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 946
	mov	DWORD PTR _retcode$[ebp], 0
; Line 949
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	14340					; 00003804H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 956
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 958
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 959
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
; Line 966
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 967
	mov	DWORD PTR _retcode$[ebp], 0
; Line 970
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	10244					; 00002804H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 977
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 979
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 980
	mov	esp, ebp
	pop	ebp
	ret	0
?getRDBAHigh@EtherObj@@QAEHXZ ENDP			; EtherObj::getRDBAHigh
_addr$ = 8
_this$ = -8
_retcode$ = -4
?setTDBAHigh@EtherObj@@QAEHH@Z PROC NEAR		; EtherObj::setTDBAHigh
; Line 987
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 988
	mov	DWORD PTR _retcode$[ebp], 0
; Line 991
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	14340					; 00003804H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 998
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	edx, DWORD PTR _addr$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 1000
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 1001
	mov	esp, ebp
	pop	ebp
	ret	4
?setTDBAHigh@EtherObj@@QAEHH@Z ENDP			; EtherObj::setTDBAHigh
_addr$ = 8
_this$ = -8
_retcode$ = -4
?setRDBAHigh@EtherObj@@QAEHH@Z PROC NEAR		; EtherObj::setRDBAHigh
; Line 1008
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 1009
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1012
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	10244					; 00002804H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 1019
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	edx, DWORD PTR _addr$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 1021
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 1022
	mov	esp, ebp
	pop	ebp
	ret	4
?setRDBAHigh@EtherObj@@QAEHH@Z ENDP			; EtherObj::setRDBAHigh
_this$ = -8
_retcode$ = -4
?getTDLen@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::getTDLen
; Line 1029
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 1030
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1033
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	14344					; 00003808H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 1044
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 1046
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 1047
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
; Line 1054
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 1055
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1058
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	10248					; 00002808H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 1069
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 1071
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 1072
	mov	esp, ebp
	pop	ebp
	ret	0
?getRDLen@EtherObj@@QAEHXZ ENDP				; EtherObj::getRDLen
_len$ = 8
_this$ = -12
_retcode$ = -4
_temp$ = -8
?setTDLen@EtherObj@@QAEHH@Z PROC NEAR			; EtherObj::setTDLen
; Line 1079
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 1080
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1081
	mov	DWORD PTR _temp$[ebp], 0
; Line 1084
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	14344					; 00003808H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 1098
	mov	ecx, DWORD PTR _len$[ebp]
	mov	DWORD PTR _temp$[ebp], ecx
; Line 1099
	mov	edx, DWORD PTR _temp$[ebp]
	and	edx, 8191				; 00001fffH
	mov	DWORD PTR _temp$[ebp], edx
; Line 1100
	mov	eax, DWORD PTR _temp$[ebp]
	shl	eax, 7
	mov	DWORD PTR _temp$[ebp], eax
; Line 1102
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	edx, DWORD PTR _temp$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 1104
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 1105
	mov	esp, ebp
	pop	ebp
	ret	4
?setTDLen@EtherObj@@QAEHH@Z ENDP			; EtherObj::setTDLen
_len$ = 8
_this$ = -12
_retcode$ = -4
_temp$ = -8
?setRDLen@EtherObj@@QAEHH@Z PROC NEAR			; EtherObj::setRDLen
; Line 1112
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 1113
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1114
	mov	DWORD PTR _temp$[ebp], 0
; Line 1117
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	10248					; 00002808H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 1131
	mov	ecx, DWORD PTR _len$[ebp]
	mov	DWORD PTR _temp$[ebp], ecx
; Line 1132
	mov	edx, DWORD PTR _temp$[ebp]
	and	edx, 8191				; 00001fffH
	mov	DWORD PTR _temp$[ebp], edx
; Line 1133
	mov	eax, DWORD PTR _temp$[ebp]
	shl	eax, 7
	mov	DWORD PTR _temp$[ebp], eax
; Line 1135
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	edx, DWORD PTR _temp$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 1137
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 1138
	mov	esp, ebp
	pop	ebp
	ret	4
?setRDLen@EtherObj@@QAEHH@Z ENDP			; EtherObj::setRDLen
_this$ = -8
_retcode$ = -4
?getTDHead@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::getTDHead
; Line 1145
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 1146
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1149
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	14352					; 00003810H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 1156
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 1158
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 1159
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
; Line 1166
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 1167
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1170
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	10256					; 00002810H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 1177
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 1179
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 1180
	mov	esp, ebp
	pop	ebp
	ret	0
?getRDHead@EtherObj@@QAEHXZ ENDP			; EtherObj::getRDHead
_headindex$ = 8
_this$ = -12
_retcode$ = -4
_temp$ = -8
?setTDHead@EtherObj@@QAEHH@Z PROC NEAR			; EtherObj::setTDHead
; Line 1187
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 1188
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1189
	mov	DWORD PTR _temp$[ebp], 0
; Line 1192
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	14352					; 00003810H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 1200
	mov	ecx, DWORD PTR _headindex$[ebp]
	mov	DWORD PTR _temp$[ebp], ecx
; Line 1201
	mov	edx, DWORD PTR _temp$[ebp]
	and	edx, 65535				; 0000ffffH
	mov	DWORD PTR _temp$[ebp], edx
; Line 1203
	mov	eax, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	eax
	mov	ecx, DWORD PTR _temp$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 1205
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 1206
	mov	esp, ebp
	pop	ebp
	ret	4
?setTDHead@EtherObj@@QAEHH@Z ENDP			; EtherObj::setTDHead
_headindex$ = 8
_this$ = -12
_retcode$ = -4
_temp$ = -8
?setRDHead@EtherObj@@QAEHH@Z PROC NEAR			; EtherObj::setRDHead
; Line 1213
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 1214
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1215
	mov	DWORD PTR _temp$[ebp], 0
; Line 1218
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	10256					; 00002810H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 1226
	mov	ecx, DWORD PTR _headindex$[ebp]
	mov	DWORD PTR _temp$[ebp], ecx
; Line 1227
	mov	edx, DWORD PTR _temp$[ebp]
	and	edx, 65535				; 0000ffffH
	mov	DWORD PTR _temp$[ebp], edx
; Line 1229
	mov	eax, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	eax
	mov	ecx, DWORD PTR _temp$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 1231
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 1232
	mov	esp, ebp
	pop	ebp
	ret	4
?setRDHead@EtherObj@@QAEHH@Z ENDP			; EtherObj::setRDHead
_this$ = -8
_retcode$ = -4
?getTDTail@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::getTDTail
; Line 1239
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 1240
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1243
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	14360					; 00003818H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 1250
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 1252
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 1253
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
; Line 1260
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 1261
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1264
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	10264					; 00002818H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 1271
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 1273
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 1274
	mov	esp, ebp
	pop	ebp
	ret	0
?getRDTail@EtherObj@@QAEHXZ ENDP			; EtherObj::getRDTail
_tailindex$ = 8
_this$ = -12
_retcode$ = -4
_temp$ = -8
?setTDTail@EtherObj@@QAEHH@Z PROC NEAR			; EtherObj::setTDTail
; Line 1281
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 1282
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1283
	mov	DWORD PTR _temp$[ebp], 0
; Line 1286
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	14360					; 00003818H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 1294
	mov	ecx, DWORD PTR _tailindex$[ebp]
	mov	DWORD PTR _temp$[ebp], ecx
; Line 1295
	mov	edx, DWORD PTR _temp$[ebp]
	and	edx, 65535				; 0000ffffH
	mov	DWORD PTR _temp$[ebp], edx
; Line 1297
	mov	eax, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	eax
	mov	ecx, DWORD PTR _temp$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 1299
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 1300
	mov	esp, ebp
	pop	ebp
	ret	4
?setTDTail@EtherObj@@QAEHH@Z ENDP			; EtherObj::setTDTail
_tailindex$ = 8
_this$ = -12
_retcode$ = -4
_temp$ = -8
?setRDTail@EtherObj@@QAEHH@Z PROC NEAR			; EtherObj::setRDTail
; Line 1307
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 1308
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1309
	mov	DWORD PTR _temp$[ebp], 0
; Line 1312
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	10264					; 00002818H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 1320
	mov	ecx, DWORD PTR _tailindex$[ebp]
	mov	DWORD PTR _temp$[ebp], ecx
; Line 1321
	mov	edx, DWORD PTR _temp$[ebp]
	and	edx, 65535				; 0000ffffH
	mov	DWORD PTR _temp$[ebp], edx
; Line 1323
	mov	eax, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	eax
	mov	ecx, DWORD PTR _temp$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 1325
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 1326
	mov	esp, ebp
	pop	ebp
	ret	4
?setRDTail@EtherObj@@QAEHH@Z ENDP			; EtherObj::setRDTail
_this$ = -8
_retcode$ = -4
?getTCtrl@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::getTCtrl
; Line 1333
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 1334
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1337
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	1024					; 00000400H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 1344
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 1346
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 1347
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
; Line 1354
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 1355
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1358
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	256					; 00000100H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 1365
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 1367
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 1368
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
; Line 1375
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 1376
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1379
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	1024					; 00000400H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 1386
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	edx, DWORD PTR _value$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 1388
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 1389
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
; Line 1396
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 1397
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1400
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	256					; 00000100H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 1407
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	edx, DWORD PTR _value$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 1409
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 1410
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
; Line 1417
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 1418
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1422
	push	2097394					; 002000f2H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setTCtrl@EtherObj@@QAEHH@Z		; EtherObj::setTCtrl
	mov	DWORD PTR _retcode$[ebp], eax
; Line 1424
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 1425
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
; Line 1432
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 1433
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1443
	push	71335938				; 04408002H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRCtrl@EtherObj@@QAEHH@Z		; EtherObj::setRCtrl
	mov	DWORD PTR _retcode$[ebp], eax
; Line 1445
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 1446
	mov	esp, ebp
	pop	ebp
	ret	0
?REnable@EtherObj@@QAEHXZ ENDP				; EtherObj::REnable
_TEXT	ENDS
PUBLIC	?ColdReset@EtherObj@@QAEHXZ			; EtherObj::ColdReset
EXTRN	?AOAPrintText@AOAProtected@@QAEXPADH@Z:NEAR	; AOAProtected::AOAPrintText
_DATA	SEGMENT
$SG1414	DB	'Cold reset is successful', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -8
_retcode$ = -4
?ColdReset@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::ColdReset
; Line 1453
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 1454
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1460
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	0
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 1462
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	push	67108864				; 04000000H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 1464
	mov	edx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 1466
	mov	eax, DWORD PTR _retcode$[ebp]
	and	eax, 67108864				; 04000000H
	mov	DWORD PTR _retcode$[ebp], eax
$L1412:
; Line 1468
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L1413
; Line 1471
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 1472
	mov	edx, DWORD PTR _retcode$[ebp]
	and	edx, 67108864				; 04000000H
	mov	DWORD PTR _retcode$[ebp], edx
; Line 1473
	jmp	SHORT $L1412
$L1413:
; Line 1474
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG1414
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1476
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 1477
	mov	esp, ebp
	pop	ebp
	ret	0
?ColdReset@EtherObj@@QAEHXZ ENDP			; EtherObj::ColdReset
_TEXT	ENDS
PUBLIC	?HotReset@EtherObj@@QAEHXZ			; EtherObj::HotReset
_DATA	SEGMENT
	ORG $+3
$SG1419	DB	'    Hot reset is successful', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -8
_retcode$ = -4
?HotReset@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::HotReset
; Line 1483
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 1484
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1486
	mov	ecx, DWORD PTR _this$[ebp]
	call	?ColdReset@EtherObj@@QAEHXZ		; EtherObj::ColdReset
	mov	DWORD PTR _retcode$[ebp], eax
; Line 1488
	push	48735744				; 02e7a600H
	push	37987840				; 0243a600H
	push	39233024				; 0256a600H
	push	36742656				; 0230a600H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?inittest@EtherObj@@QAEHJJJJ@Z		; EtherObj::inittest
	mov	DWORD PTR _retcode$[ebp], eax
; Line 1489
	mov	ecx, DWORD PTR _this$[ebp]
	call	?TEnable@EtherObj@@QAEHXZ		; EtherObj::TEnable
	mov	DWORD PTR _retcode$[ebp], eax
; Line 1490
	mov	ecx, DWORD PTR _this$[ebp]
	call	?REnable@EtherObj@@QAEHXZ		; EtherObj::REnable
	mov	DWORD PTR _retcode$[ebp], eax
; Line 1492
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG1419
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1493
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 1494
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
; Line 1501
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 1502
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1506
	push	0
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setTCtrl@EtherObj@@QAEHH@Z		; EtherObj::setTCtrl
	mov	DWORD PTR _retcode$[ebp], eax
; Line 1508
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 1509
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
; Line 1516
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 1517
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1521
	push	0
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRCtrl@EtherObj@@QAEHH@Z		; EtherObj::setRCtrl
	mov	DWORD PTR _retcode$[ebp], eax
; Line 1523
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 1524
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
; Line 1530
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	mov	DWORD PTR _this$[ebp], ecx
; Line 1531
	mov	DWORD PTR _i$[ebp], 0
; Line 1532
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1534
	mov	DWORD PTR _l1$[ebp], 0
; Line 1535
	lea	eax, DWORD PTR _l1$[ebp]
	mov	DWORD PTR _lptr$[ebp], eax
; Line 1537
	mov	DWORD PTR _ldata$[ebp], 0
; Line 1539
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1439
$L1440:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L1439:
	cmp	DWORD PTR _i$[ebp], 4
	jge	SHORT $L1441
; Line 1542
	mov	edx, DWORD PTR _value$[ebp]
	mov	DWORD PTR _ldata$[ebp], edx
; Line 1543
	cmp	DWORD PTR _i$[ebp], 3
	jge	SHORT $L1442
; Line 1545
	mov	eax, DWORD PTR _ldata$[ebp]
	shl	eax, 8
	mov	DWORD PTR _ldata$[ebp], eax
$L1442:
; Line 1547
	jmp	SHORT $L1440
$L1441:
; Line 1550
	mov	ecx, DWORD PTR _index$[ebp]
	imul	ecx, 1600				; 00000640H
	mov	edx, DWORD PTR ?TDLDataPointer@EtherObj@@2JA ; EtherObj::TDLDataPointer
	lea	eax, DWORD PTR [edx+ecx-1114112]
	mov	DWORD PTR _lptr$[ebp], eax
; Line 1552
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1444
$L1445:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L1444:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _noOfBytes$[ebp]
	jge	SHORT $L1446
; Line 1554
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _lptr$[ebp]
	mov	edx, DWORD PTR _ldata$[ebp]
	mov	DWORD PTR [ecx+eax*4], edx
; Line 1555
	jmp	SHORT $L1445
$L1446:
; Line 1557
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 1558
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
; Line 1564
	push	ebp
	mov	ebp, esp
	sub	esp, 420				; 000001a4H
	mov	DWORD PTR _this$[ebp], ecx
; Line 1565
	mov	DWORD PTR _i$[ebp], 0
; Line 1566
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1568
	mov	DWORD PTR _l1$[ebp], 0
; Line 1569
	lea	eax, DWORD PTR _l1$[ebp]
	mov	DWORD PTR _lptr$[ebp], eax
; Line 1572
	mov	ecx, DWORD PTR _index$[ebp]
	shl	ecx, 11					; 0000000bH
	mov	edx, DWORD PTR ?RDLDataPointer@EtherObj@@2JA ; EtherObj::RDLDataPointer
	lea	eax, DWORD PTR [edx+ecx-1114112]
	mov	DWORD PTR _lptr$[ebp], eax
; Line 1574
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1459
$L1460:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L1459:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _noOfBytes$[ebp]
	jge	SHORT $L1461
; Line 1575
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _lptr$[ebp]
	mov	ecx, DWORD PTR [edx+ecx*4]
	mov	DWORD PTR _temp$[ebp+eax*4], ecx
	jmp	SHORT $L1460
$L1461:
; Line 1577
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1462
$L1463:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L1462:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _noOfBytes$[ebp]
	jge	SHORT $L1464
; Line 1578
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
	jmp	SHORT $L1463
$L1464:
; Line 1580
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 1581
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
; Line 1587
	push	ebp
	mov	ebp, esp
	sub	esp, 420				; 000001a4H
	mov	DWORD PTR _this$[ebp], ecx
; Line 1588
	mov	DWORD PTR _i$[ebp], 0
; Line 1589
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1591
	mov	DWORD PTR _l1$[ebp], 0
; Line 1592
	lea	eax, DWORD PTR _l1$[ebp]
	mov	DWORD PTR _lptr$[ebp], eax
; Line 1595
	mov	ecx, DWORD PTR _index$[ebp]
	imul	ecx, 1600				; 00000640H
	mov	edx, DWORD PTR ?TDLDataPointer@EtherObj@@2JA ; EtherObj::TDLDataPointer
	lea	eax, DWORD PTR [edx+ecx-1114112]
	mov	DWORD PTR _lptr$[ebp], eax
; Line 1597
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1478
$L1479:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L1478:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _noOfBytes$[ebp]
	jge	SHORT $L1480
; Line 1598
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _lptr$[ebp]
	mov	ecx, DWORD PTR [edx+ecx*4]
	mov	DWORD PTR _temp$[ebp+eax*4], ecx
	jmp	SHORT $L1479
$L1480:
; Line 1600
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1481
$L1482:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L1481:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _noOfBytes$[ebp]
	jge	SHORT $L1483
; Line 1601
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
	jmp	SHORT $L1482
$L1483:
; Line 1603
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 1604
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
; Line 1611
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	mov	DWORD PTR _this$[ebp], ecx
; Line 1612
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1614
	mov	DWORD PTR _l1$[ebp], 0
; Line 1615
	lea	eax, DWORD PTR _l1$[ebp]
	mov	DWORD PTR _lptr$[ebp], eax
; Line 1616
	mov	DWORD PTR _temp$[ebp], 0
; Line 1619
	mov	ecx, DWORD PTR _index$[ebp]
	shl	ecx, 4
	mov	edx, DWORD PTR ?TDLPointer@EtherObj@@2JA ; EtherObj::TDLPointer
	lea	eax, DWORD PTR [edx+ecx-1114112]
	mov	DWORD PTR _lptr$[ebp], eax
; Line 1621
	mov	ecx, DWORD PTR _lptr$[ebp]
	add	ecx, 4
	mov	DWORD PTR _lptr$[ebp], ecx
; Line 1622
	mov	edx, DWORD PTR _lptr$[ebp]
	add	edx, 4
	mov	DWORD PTR _lptr$[ebp], edx
; Line 1623
	mov	eax, DWORD PTR _lptr$[ebp]
	add	eax, 4
	mov	DWORD PTR _lptr$[ebp], eax
; Line 1625
	mov	ecx, DWORD PTR _lptr$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR _temp$[ebp], edx
; Line 1627
	mov	eax, DWORD PTR _temp$[ebp]
	and	eax, 1
	mov	DWORD PTR _temp$[ebp], eax
; Line 1629
	cmp	DWORD PTR _temp$[ebp], 1
	jne	SHORT $L1494
; Line 1630
	mov	DWORD PTR _retcode$[ebp], 1
; Line 1631
	jmp	SHORT $L1495
$L1494:
; Line 1632
	mov	DWORD PTR _retcode$[ebp], 0
$L1495:
; Line 1634
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 1635
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
; Line 1642
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	mov	DWORD PTR _this$[ebp], ecx
; Line 1643
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1645
	mov	DWORD PTR _l1$[ebp], 0
; Line 1646
	lea	eax, DWORD PTR _l1$[ebp]
	mov	DWORD PTR _lptr$[ebp], eax
; Line 1647
	mov	DWORD PTR _temp$[ebp], 0
; Line 1650
	mov	ecx, DWORD PTR _index$[ebp]
	shl	ecx, 4
	mov	edx, DWORD PTR ?RDLPointer@EtherObj@@2JA ; EtherObj::RDLPointer
	lea	eax, DWORD PTR [edx+ecx-1114112]
	mov	DWORD PTR _lptr$[ebp], eax
; Line 1652
	mov	ecx, DWORD PTR _lptr$[ebp]
	add	ecx, 4
	mov	DWORD PTR _lptr$[ebp], ecx
; Line 1653
	mov	edx, DWORD PTR _lptr$[ebp]
	add	edx, 4
	mov	DWORD PTR _lptr$[ebp], edx
; Line 1654
	mov	eax, DWORD PTR _lptr$[ebp]
	add	eax, 4
	mov	DWORD PTR _lptr$[ebp], eax
; Line 1656
	mov	ecx, DWORD PTR _lptr$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR _temp$[ebp], edx
; Line 1659
	mov	eax, DWORD PTR _temp$[ebp]
	and	eax, 1
	mov	DWORD PTR _temp$[ebp], eax
; Line 1661
	cmp	DWORD PTR _temp$[ebp], 1
	jne	SHORT $L1505
; Line 1662
	mov	DWORD PTR _retcode$[ebp], 1
; Line 1663
	jmp	SHORT $L1506
$L1505:
; Line 1664
	mov	DWORD PTR _retcode$[ebp], 0
$L1506:
; Line 1666
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 1667
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
; Line 1674
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	mov	DWORD PTR _this$[ebp], ecx
; Line 1675
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1677
	mov	DWORD PTR _l1$[ebp], 0
; Line 1678
	lea	eax, DWORD PTR _l1$[ebp]
	mov	DWORD PTR _lptr$[ebp], eax
; Line 1679
	mov	DWORD PTR _temp$[ebp], 0
; Line 1682
	mov	ecx, DWORD PTR _index$[ebp]
	shl	ecx, 4
	mov	edx, DWORD PTR ?TDLPointer@EtherObj@@2JA ; EtherObj::TDLPointer
	lea	eax, DWORD PTR [edx+ecx-1114112]
	mov	DWORD PTR _lptr$[ebp], eax
; Line 1684
	mov	ecx, DWORD PTR _lptr$[ebp]
	add	ecx, 4
	mov	DWORD PTR _lptr$[ebp], ecx
; Line 1685
	mov	edx, DWORD PTR _lptr$[ebp]
	add	edx, 4
	mov	DWORD PTR _lptr$[ebp], edx
; Line 1686
	mov	eax, DWORD PTR _lptr$[ebp]
	add	eax, 4
	mov	DWORD PTR _lptr$[ebp], eax
; Line 1688
	mov	ecx, DWORD PTR _lptr$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR _temp$[ebp], edx
; Line 1690
	mov	eax, DWORD PTR _temp$[ebp]
	and	al, -16					; fffffff0H
	mov	DWORD PTR _temp$[ebp], eax
; Line 1692
	mov	ecx, DWORD PTR _lptr$[ebp]
	mov	edx, DWORD PTR _temp$[ebp]
	mov	DWORD PTR [ecx], edx
; Line 1694
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 1695
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
; Line 1702
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	mov	DWORD PTR _this$[ebp], ecx
; Line 1703
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1705
	mov	DWORD PTR _l1$[ebp], 0
; Line 1706
	lea	eax, DWORD PTR _l1$[ebp]
	mov	DWORD PTR _lptr$[ebp], eax
; Line 1707
	mov	DWORD PTR _temp$[ebp], 0
; Line 1710
	mov	ecx, DWORD PTR _index$[ebp]
	shl	ecx, 4
	mov	edx, DWORD PTR ?RDLPointer@EtherObj@@2JA ; EtherObj::RDLPointer
	lea	eax, DWORD PTR [edx+ecx-1114112]
	mov	DWORD PTR _lptr$[ebp], eax
; Line 1712
	mov	ecx, DWORD PTR _lptr$[ebp]
	add	ecx, 4
	mov	DWORD PTR _lptr$[ebp], ecx
; Line 1713
	mov	edx, DWORD PTR _lptr$[ebp]
	add	edx, 4
	mov	DWORD PTR _lptr$[ebp], edx
; Line 1714
	mov	eax, DWORD PTR _lptr$[ebp]
	add	eax, 4
	mov	DWORD PTR _lptr$[ebp], eax
; Line 1716
	mov	ecx, DWORD PTR _lptr$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR _temp$[ebp], edx
; Line 1718
	mov	eax, DWORD PTR _temp$[ebp]
	and	al, 0
	mov	DWORD PTR _temp$[ebp], eax
; Line 1720
	mov	ecx, DWORD PTR _lptr$[ebp]
	mov	edx, DWORD PTR _temp$[ebp]
	mov	DWORD PTR [ecx], edx
; Line 1722
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 1723
	mov	esp, ebp
	pop	ebp
	ret	4
?resetRDescDone@EtherObj@@QAEHH@Z ENDP			; EtherObj::resetRDescDone
_this$ = -8
_retcode$ = -4
?getRAL0@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::getRAL0
; Line 1730
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 1731
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1734
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	21504					; 00005400H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 1742
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 1744
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 1745
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
; Line 1752
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 1753
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1756
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	21504					; 00005400H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 1764
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	edx, DWORD PTR _value$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 1766
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 1767
	mov	esp, ebp
	pop	ebp
	ret	4
?setRAL0@EtherObj@@QAEHH@Z ENDP				; EtherObj::setRAL0
_this$ = -8
_retcode$ = -4
?getRAH0@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::getRAH0
; Line 1774
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 1775
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1778
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	21508					; 00005404H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 1788
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 1790
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 1791
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
; Line 1798
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 1799
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1800
	mov	DWORD PTR _temp$[ebp], 0
; Line 1802
	mov	eax, DWORD PTR _value$[ebp]
	and	eax, 65535				; 0000ffffH
	mov	DWORD PTR _temp$[ebp], eax
; Line 1803
	mov	ecx, DWORD PTR _temp$[ebp]
	or	ecx, -2147483648			; 80000000H
	mov	DWORD PTR _temp$[ebp], ecx
; Line 1806
	mov	edx, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	edx
	push	21508					; 00005404H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 1816
	mov	eax, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	eax
	mov	ecx, DWORD PTR _temp$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 1818
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 1819
	mov	esp, ebp
	pop	ebp
	ret	4
?setRAH0@EtherObj@@QAEHH@Z ENDP				; EtherObj::setRAH0
_this$ = -8
_retcode$ = -4
?getRAL1@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::getRAL1
; Line 1826
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 1827
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1830
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	21512					; 00005408H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 1838
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 1840
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 1841
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
; Line 1848
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 1849
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1852
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	21512					; 00005408H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 1860
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	edx, DWORD PTR _value$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 1862
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 1863
	mov	esp, ebp
	pop	ebp
	ret	4
?setRAL1@EtherObj@@QAEHH@Z ENDP				; EtherObj::setRAL1
_this$ = -8
_retcode$ = -4
?getRAH1@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::getRAH1
; Line 1870
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 1871
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1874
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	21516					; 0000540cH
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 1884
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 1886
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 1887
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
; Line 1894
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 1895
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1896
	mov	DWORD PTR _temp$[ebp], 0
; Line 1898
	mov	eax, DWORD PTR _value$[ebp]
	and	eax, 65535				; 0000ffffH
	mov	DWORD PTR _temp$[ebp], eax
; Line 1899
	mov	ecx, DWORD PTR _temp$[ebp]
	or	ecx, -2147483648			; 80000000H
	mov	DWORD PTR _temp$[ebp], ecx
; Line 1902
	mov	edx, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	edx
	push	21516					; 0000540cH
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 1912
	mov	eax, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	eax
	mov	ecx, DWORD PTR _temp$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 1914
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 1915
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
; Line 1921
	push	ebp
	mov	ebp, esp
	sub	esp, 28					; 0000001cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 1922
	mov	DWORD PTR _i$[ebp], 0
; Line 1923
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1925
	mov	DWORD PTR _l1$[ebp], 0
; Line 1926
	lea	eax, DWORD PTR _l1$[ebp]
	mov	DWORD PTR _lptr$[ebp], eax
; Line 1927
	mov	DWORD PTR _x$[ebp], 0
; Line 1928
	mov	DWORD PTR _temp$[ebp], 0
; Line 1931
	mov	ecx, DWORD PTR _index$[ebp]
	shl	ecx, 4
	mov	edx, DWORD PTR ?TDLPointer@EtherObj@@2JA ; EtherObj::TDLPointer
	lea	eax, DWORD PTR [edx+ecx-1114112]
	mov	DWORD PTR _x$[ebp], eax
; Line 1933
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR _lptr$[ebp], ecx
; Line 1935
	mov	edx, DWORD PTR _lptr$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR _temp$[ebp], eax
; Line 1936
	mov	ecx, DWORD PTR _line$[ebp]
	push	ecx
	mov	edx, DWORD PTR _temp$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1937
	mov	eax, DWORD PTR _lptr$[ebp]
	add	eax, 4
	mov	DWORD PTR _lptr$[ebp], eax
; Line 1938
	mov	ecx, DWORD PTR _lptr$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR _temp$[ebp], edx
; Line 1939
	mov	eax, DWORD PTR _line$[ebp]
	add	eax, 20					; 00000014H
	push	eax
	mov	ecx, DWORD PTR _temp$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1940
	mov	edx, DWORD PTR _lptr$[ebp]
	add	edx, 4
	mov	DWORD PTR _lptr$[ebp], edx
; Line 1941
	mov	eax, DWORD PTR _lptr$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _temp$[ebp], ecx
; Line 1942
	mov	edx, DWORD PTR _line$[ebp]
	add	edx, 40					; 00000028H
	push	edx
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1943
	mov	ecx, DWORD PTR _lptr$[ebp]
	add	ecx, 4
	mov	DWORD PTR _lptr$[ebp], ecx
; Line 1944
	mov	edx, DWORD PTR _lptr$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR _temp$[ebp], eax
; Line 1945
	mov	ecx, DWORD PTR _line$[ebp]
	add	ecx, 60					; 0000003cH
	push	ecx
	mov	edx, DWORD PTR _temp$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1946
	mov	eax, DWORD PTR _lptr$[ebp]
	add	eax, 4
	mov	DWORD PTR _lptr$[ebp], eax
; Line 1948
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 1949
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
; Line 1955
	push	ebp
	mov	ebp, esp
	sub	esp, 28					; 0000001cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 1956
	mov	DWORD PTR _i$[ebp], 0
; Line 1957
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1959
	mov	DWORD PTR _l1$[ebp], 0
; Line 1960
	lea	eax, DWORD PTR _l1$[ebp]
	mov	DWORD PTR _lptr$[ebp], eax
; Line 1961
	mov	DWORD PTR _x$[ebp], 0
; Line 1962
	mov	DWORD PTR _temp$[ebp], 0
; Line 1965
	mov	ecx, DWORD PTR _index$[ebp]
	shl	ecx, 4
	mov	edx, DWORD PTR ?RDLPointer@EtherObj@@2JA ; EtherObj::RDLPointer
	lea	eax, DWORD PTR [edx+ecx-1114112]
	mov	DWORD PTR _x$[ebp], eax
; Line 1967
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR _lptr$[ebp], ecx
; Line 1969
	mov	edx, DWORD PTR _lptr$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR _temp$[ebp], eax
; Line 1970
	mov	ecx, DWORD PTR _line$[ebp]
	push	ecx
	mov	edx, DWORD PTR _temp$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1971
	mov	eax, DWORD PTR _lptr$[ebp]
	add	eax, 4
	mov	DWORD PTR _lptr$[ebp], eax
; Line 1972
	mov	ecx, DWORD PTR _lptr$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR _temp$[ebp], edx
; Line 1973
	mov	eax, DWORD PTR _line$[ebp]
	add	eax, 20					; 00000014H
	push	eax
	mov	ecx, DWORD PTR _temp$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1974
	mov	edx, DWORD PTR _lptr$[ebp]
	add	edx, 4
	mov	DWORD PTR _lptr$[ebp], edx
; Line 1975
	mov	eax, DWORD PTR _lptr$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _temp$[ebp], ecx
; Line 1976
	mov	edx, DWORD PTR _line$[ebp]
	add	edx, 40					; 00000028H
	push	edx
	mov	eax, DWORD PTR _temp$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1977
	mov	ecx, DWORD PTR _lptr$[ebp]
	add	ecx, 4
	mov	DWORD PTR _lptr$[ebp], ecx
; Line 1978
	mov	edx, DWORD PTR _lptr$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR _temp$[ebp], eax
; Line 1979
	mov	ecx, DWORD PTR _line$[ebp]
	add	ecx, 60					; 0000003cH
	push	ecx
	mov	edx, DWORD PTR _temp$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1980
	mov	eax, DWORD PTR _lptr$[ebp]
	add	eax, 4
	mov	DWORD PTR _lptr$[ebp], eax
; Line 1982
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 1983
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
; Line 1990
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 1991
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1994
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	16476					; 0000405cH
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 2001
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2003
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 2004
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
; Line 2011
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2012
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2015
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	16480					; 00004060H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 2022
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2024
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 2025
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
; Line 2032
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2033
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2036
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	16484					; 00004064H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 2043
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2045
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 2046
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
; Line 2053
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2054
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2057
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	16488					; 00004068H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 2064
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2066
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 2067
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
; Line 2074
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2075
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2078
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	16492					; 0000406cH
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 2085
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2087
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 2088
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
; Line 2095
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2096
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2099
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	16496					; 00004070H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 2106
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2108
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 2109
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
; Line 2116
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2117
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2120
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	16500					; 00004074H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 2127
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2129
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 2130
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
; Line 2136
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2137
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2140
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	192					; 000000c0H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 2156
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2157
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 2158
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
; Line 2164
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2165
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2168
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	16504					; 00004078H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 2175
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2177
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 2178
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
; Line 2185
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2186
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2189
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	16508					; 0000407cH
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 2196
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2198
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 2199
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
; Line 2206
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2207
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2210
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	16512					; 00004080H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 2217
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2219
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 2220
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
; Line 2227
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2228
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2231
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	16544					; 000040a0H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 2238
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2240
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 2241
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
; Line 2248
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2249
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2252
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	16592					; 000040d0H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 2259
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2261
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 2262
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
; Line 2269
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2270
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2273
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	16596					; 000040d4H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 2280
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2282
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 2283
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
; Line 2290
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2291
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2294
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	16600					; 000040d8H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 2301
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2303
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 2304
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
; Line 2311
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2312
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2315
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	16604					; 000040dcH
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 2322
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2324
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 2325
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
; Line 2332
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2333
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2336
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	16608					; 000040e0H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 2343
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2345
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 2346
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
; Line 2353
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2354
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2357
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	16612					; 000040e4H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 2364
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2366
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 2367
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
; Line 2374
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2375
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2378
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	16616					; 000040e8H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 2385
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2387
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 2388
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
; Line 2395
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2396
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2399
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	16620					; 000040ecH
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 2406
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2408
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 2409
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
; Line 2416
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2417
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2420
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	16624					; 000040f0H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 2427
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2429
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 2430
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
; Line 2437
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2438
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2441
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	16628					; 000040f4H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 2448
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2450
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 2451
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
; Line 2458
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2459
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2462
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	16404					; 00004014H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 2469
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2471
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 2472
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
; Line 2479
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2480
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2483
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	16408					; 00004018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 2490
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2492
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 2493
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
; Line 2500
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2501
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2504
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	16412					; 0000401cH
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 2511
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2513
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 2514
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
; Line 2521
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2522
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2525
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	16416					; 00004020H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 2532
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2534
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 2535
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
; Line 2542
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2543
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2546
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	16424					; 00004028H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 2553
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2555
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 2556
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
; Line 2563
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2564
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2567
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	16432					; 00004030H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 2574
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2576
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 2577
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
; Line 2584
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2585
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2588
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	16436					; 00004034H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 2595
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2597
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 2598
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
; Line 2605
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2606
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2609
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	16440					; 00004038H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 2616
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2618
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 2619
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
; Line 2626
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2627
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2630
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	16528					; 00004090H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 2637
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2639
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 2640
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
; Line 2647
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2648
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2651
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	16532					; 00004094H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 2658
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2660
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 2661
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
; Line 2668
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2669
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2672
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	16572					; 000040bcH
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 2679
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2681
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 2682
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
; Line 2689
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2690
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2693
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	16584					; 000040c8H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 2700
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2702
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 2703
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
; Line 2710
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2711
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2714
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	16588					; 000040ccH
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 2721
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2723
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 2724
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
; Line 2731
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2732
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2735
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	14376					; 00003828H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 2742
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2744
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 2745
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
; Line 2752
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2753
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2756
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	10280					; 00002828H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 2763
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2765
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 2766
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
; Line 2773
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2774
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2777
	mov	eax, DWORD PTR ?IOADDR@EtherObj@@0KA	; EtherObj::IOADDR
	push	eax
	push	1040					; 00000410H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRegister32@EtherObj@@QAEXHK@Z	; EtherObj::setRegister32
; Line 2784
	mov	ecx, DWORD PTR ?IODATA@EtherObj@@0KA	; EtherObj::IODATA
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRegister32@EtherObj@@QAEHK@Z	; EtherObj::getRegister32
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2786
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 2787
	mov	esp, ebp
	pop	ebp
	ret	0
?getTIPG@EtherObj@@QAEHXZ ENDP				; EtherObj::getTIPG
_line$ = 8
_this$ = -8
_retcode$ = -4
?printDiag@EtherObj@@QAEHH@Z PROC NEAR			; EtherObj::printDiag
; Line 2793
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2794
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2796
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getPRC64@EtherObj@@QAEHXZ		; EtherObj::getPRC64
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2797
	mov	eax, DWORD PTR _line$[ebp]
	push	eax
	mov	ecx, DWORD PTR _retcode$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 2799
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getPRC127@EtherObj@@QAEHXZ		; EtherObj::getPRC127
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2800
	mov	edx, DWORD PTR _line$[ebp]
	add	edx, 20					; 00000014H
	push	edx
	mov	eax, DWORD PTR _retcode$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 2802
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getPRC255@EtherObj@@QAEHXZ		; EtherObj::getPRC255
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2803
	mov	ecx, DWORD PTR _line$[ebp]
	add	ecx, 40					; 00000028H
	push	ecx
	mov	edx, DWORD PTR _retcode$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 2805
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getPRC1023@EtherObj@@QAEHXZ		; EtherObj::getPRC1023
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2806
	mov	eax, DWORD PTR _line$[ebp]
	add	eax, 60					; 0000003cH
	push	eax
	mov	ecx, DWORD PTR _retcode$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 2808
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getPRC1522@EtherObj@@QAEHXZ		; EtherObj::getPRC1522
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2809
	mov	edx, DWORD PTR _line$[ebp]
	add	edx, 80					; 00000050H
	push	edx
	mov	eax, DWORD PTR _retcode$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 2811
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getGPRC@EtherObj@@QAEHXZ		; EtherObj::getGPRC
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2812
	mov	ecx, DWORD PTR _line$[ebp]
	add	ecx, 100				; 00000064H
	push	ecx
	mov	edx, DWORD PTR _retcode$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 2814
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getBPRC@EtherObj@@QAEHXZ		; EtherObj::getBPRC
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2815
	mov	eax, DWORD PTR _line$[ebp]
	add	eax, 120				; 00000078H
	push	eax
	mov	ecx, DWORD PTR _retcode$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 2817
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getMPRC@EtherObj@@QAEHXZ		; EtherObj::getMPRC
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2818
	mov	edx, DWORD PTR _line$[ebp]
	add	edx, 160				; 000000a0H
	push	edx
	mov	eax, DWORD PTR _retcode$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 2820
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getGPTC@EtherObj@@QAEHXZ		; EtherObj::getGPTC
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2821
	mov	ecx, DWORD PTR _line$[ebp]
	add	ecx, 180				; 000000b4H
	push	ecx
	mov	edx, DWORD PTR _retcode$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 2823
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRNBC@EtherObj@@QAEHXZ		; EtherObj::getRNBC
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2824
	mov	eax, DWORD PTR _line$[ebp]
	add	eax, 200				; 000000c8H
	push	eax
	mov	ecx, DWORD PTR _retcode$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 2826
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getTPR@EtherObj@@QAEHXZ		; EtherObj::getTPR
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2827
	mov	edx, DWORD PTR _line$[ebp]
	add	edx, 220				; 000000dcH
	push	edx
	mov	eax, DWORD PTR _retcode$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 2829
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getTPT@EtherObj@@QAEHXZ		; EtherObj::getTPT
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2830
	mov	ecx, DWORD PTR _line$[ebp]
	add	ecx, 240				; 000000f0H
	push	ecx
	mov	edx, DWORD PTR _retcode$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 2832
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getPTC64@EtherObj@@QAEHXZ		; EtherObj::getPTC64
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2833
	mov	eax, DWORD PTR _line$[ebp]
	add	eax, 260				; 00000104H
	push	eax
	mov	ecx, DWORD PTR _retcode$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 2835
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getPTC127@EtherObj@@QAEHXZ		; EtherObj::getPTC127
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2836
	mov	edx, DWORD PTR _line$[ebp]
	add	edx, 280				; 00000118H
	push	edx
	mov	eax, DWORD PTR _retcode$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 2838
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getPTC255@EtherObj@@QAEHXZ		; EtherObj::getPTC255
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2839
	mov	ecx, DWORD PTR _line$[ebp]
	add	ecx, 320				; 00000140H
	push	ecx
	mov	edx, DWORD PTR _retcode$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 2841
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getPTC1023@EtherObj@@QAEHXZ		; EtherObj::getPTC1023
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2842
	mov	eax, DWORD PTR _line$[ebp]
	add	eax, 340				; 00000154H
	push	eax
	mov	ecx, DWORD PTR _retcode$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 2844
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getPTC1522@EtherObj@@QAEHXZ		; EtherObj::getPTC1522
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2845
	mov	edx, DWORD PTR _line$[ebp]
	add	edx, 360				; 00000168H
	push	edx
	mov	eax, DWORD PTR _retcode$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 2847
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getMPTC@EtherObj@@QAEHXZ		; EtherObj::getMPTC
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2848
	mov	ecx, DWORD PTR _line$[ebp]
	add	ecx, 380				; 0000017cH
	push	ecx
	mov	edx, DWORD PTR _retcode$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 2850
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getBPTC@EtherObj@@QAEHXZ		; EtherObj::getBPTC
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2851
	mov	eax, DWORD PTR _line$[ebp]
	add	eax, 400				; 00000190H
	push	eax
	mov	ecx, DWORD PTR _retcode$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 2853
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 2854
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
; Line 2860
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2861
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2863
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getSCC@EtherObj@@QAEHXZ		; EtherObj::getSCC
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2864
	mov	eax, DWORD PTR _line$[ebp]
	push	eax
	mov	ecx, DWORD PTR _retcode$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 2866
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getECOL@EtherObj@@QAEHXZ		; EtherObj::getECOL
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2867
	mov	edx, DWORD PTR _line$[ebp]
	add	edx, 20					; 00000014H
	push	edx
	mov	eax, DWORD PTR _retcode$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 2869
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getMCC@EtherObj@@QAEHXZ		; EtherObj::getMCC
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2870
	mov	ecx, DWORD PTR _line$[ebp]
	add	ecx, 40					; 00000028H
	push	ecx
	mov	edx, DWORD PTR _retcode$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 2872
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getLATECOL@EtherObj@@QAEHXZ		; EtherObj::getLATECOL
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2873
	mov	eax, DWORD PTR _line$[ebp]
	add	eax, 60					; 0000003cH
	push	eax
	mov	ecx, DWORD PTR _retcode$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 2875
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getCOLC@EtherObj@@QAEHXZ		; EtherObj::getCOLC
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2876
	mov	edx, DWORD PTR _line$[ebp]
	add	edx, 80					; 00000050H
	push	edx
	mov	eax, DWORD PTR _retcode$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 2878
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getDC@EtherObj@@QAEHXZ			; EtherObj::getDC
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2879
	mov	ecx, DWORD PTR _line$[ebp]
	add	ecx, 100				; 00000064H
	push	ecx
	mov	edx, DWORD PTR _retcode$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 2881
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getTNCRS@EtherObj@@QAEHXZ		; EtherObj::getTNCRS
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2882
	mov	eax, DWORD PTR _line$[ebp]
	add	eax, 120				; 00000078H
	push	eax
	mov	ecx, DWORD PTR _retcode$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 2884
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getSEC@EtherObj@@QAEHXZ		; EtherObj::getSEC
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2885
	mov	edx, DWORD PTR _line$[ebp]
	add	edx, 160				; 000000a0H
	push	edx
	mov	eax, DWORD PTR _retcode$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 2887
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getGOTCL@EtherObj@@QAEHXZ		; EtherObj::getGOTCL
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2888
	mov	ecx, DWORD PTR _line$[ebp]
	add	ecx, 180				; 000000b4H
	push	ecx
	mov	edx, DWORD PTR _retcode$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 2890
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getGOTCH@EtherObj@@QAEHXZ		; EtherObj::getGOTCH
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2891
	mov	eax, DWORD PTR _line$[ebp]
	add	eax, 200				; 000000c8H
	push	eax
	mov	ecx, DWORD PTR _retcode$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 2893
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getMGTPTC@EtherObj@@QAEHXZ		; EtherObj::getMGTPTC
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2894
	mov	edx, DWORD PTR _line$[ebp]
	add	edx, 220				; 000000dcH
	push	edx
	mov	eax, DWORD PTR _retcode$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 2896
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getTOTL@EtherObj@@QAEHXZ		; EtherObj::getTOTL
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2897
	mov	ecx, DWORD PTR _line$[ebp]
	add	ecx, 240				; 000000f0H
	push	ecx
	mov	edx, DWORD PTR _retcode$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 2899
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getTOTH@EtherObj@@QAEHXZ		; EtherObj::getTOTH
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2900
	mov	eax, DWORD PTR _line$[ebp]
	add	eax, 260				; 00000104H
	push	eax
	mov	ecx, DWORD PTR _retcode$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 2902
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 2903
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
; Line 2909
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2910
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2914
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRDHead@EtherObj@@QAEHXZ		; EtherObj::getRDHead
	mov	DWORD PTR _retcode$[ebp], eax
; Line 2916
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 2917
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
; Line 2927
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2928
	mov	DWORD PTR _rcvcounter$[ebp], 0
; Line 2930
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getGPRC@EtherObj@@QAEHXZ		; EtherObj::getGPRC
	mov	DWORD PTR _rcvcounter$[ebp], eax
; Line 2931
	mov	eax, DWORD PTR _rcvcounter$[ebp]
	sub	eax, DWORD PTR ?TotalRcvCount@EtherObj@@2JA ; EtherObj::TotalRcvCount
	mov	DWORD PTR _rcvcounter$[ebp], eax
; Line 2933
	mov	eax, DWORD PTR _rcvcounter$[ebp]
; Line 2934
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
; Line 2939
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 2940
	mov	DWORD PTR _pkts$[ebp], 0
; Line 2942
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRDTail@EtherObj@@QAEHXZ		; EtherObj::getRDTail
	mov	DWORD PTR ?ReceiveInPtr@EtherObj@@2JA, eax ; EtherObj::ReceiveInPtr
; Line 2944
	mov	eax, DWORD PTR ?ReceiveInPtr@EtherObj@@2JA ; EtherObj::ReceiveInPtr
	cmp	eax, DWORD PTR ?ReceiveOutPtr@EtherObj@@2JA ; EtherObj::ReceiveOutPtr
	jl	SHORT $L1761
; Line 2946
	mov	ecx, DWORD PTR ?ReceiveInPtr@EtherObj@@2JA ; EtherObj::ReceiveInPtr
	sub	ecx, DWORD PTR ?ReceiveOutPtr@EtherObj@@2JA ; EtherObj::ReceiveOutPtr
	mov	DWORD PTR _pkts$[ebp], ecx
; Line 2949
	jmp	SHORT $L1762
$L1761:
; Line 2951
	mov	edx, DWORD PTR ?ReceiveOutPtr@EtherObj@@2JA ; EtherObj::ReceiveOutPtr
	sub	edx, DWORD PTR ?ReceiveInPtr@EtherObj@@2JA ; EtherObj::ReceiveInPtr
	mov	eax, 4096				; 00001000H
	sub	eax, edx
	mov	DWORD PTR _pkts$[ebp], eax
$L1762:
; Line 2954
	cmp	DWORD PTR _pkts$[ebp], 4096		; 00001000H
	jl	SHORT $L1763
; Line 2956
	mov	eax, 1
	jmp	SHORT $L1764
$L1763:
; Line 2958
	xor	eax, eax
$L1764:
; Line 2959
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
; Line 2973
	push	ebp
	mov	ebp, esp
	sub	esp, 44					; 0000002cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 2975
	mov	DWORD PTR _PROTOCOL_TYPE$[ebp], 0
; Line 2976
	mov	DWORD PTR _portno$[ebp], 0
; Line 2977
	mov	DWORD PTR _retcode$[ebp], 0
; Line 2978
	mov	DWORD PTR _pktlen$[ebp], 0
; Line 2982
	lea	eax, DWORD PTR _c2$[ebp]
	mov	DWORD PTR _addr$[ebp], eax
; Line 2986
	lea	ecx, DWORD PTR _a1$[ebp]
	mov	DWORD PTR _p1$[ebp], ecx
; Line 2991
	mov	edx, DWORD PTR ?ReceiveOutPtr@EtherObj@@2JA ; EtherObj::ReceiveOutPtr
	shl	edx, 4
	mov	eax, DWORD PTR ?RDLPointer@EtherObj@@2JA ; EtherObj::RDLPointer
	lea	ecx, DWORD PTR [eax+edx-1114112]
	mov	DWORD PTR _p1$[ebp], ecx
; Line 2993
	mov	edx, DWORD PTR _p1$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR _s1$[ebp], eax
; Line 2995
	mov	ecx, DWORD PTR _s1$[ebp]
	sub	ecx, 1114112				; 00110000H
	mov	edx, DWORD PTR _Data$[ebp]
	mov	DWORD PTR [edx], ecx
; Line 2998
	mov	eax, DWORD PTR _Data$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _addr$[ebp], ecx
; Line 3000
	mov	edx, DWORD PTR _p1$[ebp]
	add	edx, 4
	mov	DWORD PTR _p1$[ebp], edx
; Line 3001
	mov	eax, DWORD PTR _p1$[ebp]
	add	eax, 4
	mov	DWORD PTR _p1$[ebp], eax
; Line 3003
	mov	ecx, DWORD PTR _p1$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR _pktlen$[ebp], edx
; Line 3004
	mov	eax, DWORD PTR _pktlen$[ebp]
	and	eax, 65535				; 0000ffffH
	mov	DWORD PTR _pktlen$[ebp], eax
; Line 3007
	mov	ecx, DWORD PTR _p1$[ebp]
	add	ecx, 4
	mov	DWORD PTR _p1$[ebp], ecx
; Line 3009
	mov	edx, DWORD PTR _p1$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR _s1$[ebp], eax
; Line 3010
	mov	ecx, DWORD PTR _s1$[ebp]
	and	ecx, 1
	mov	DWORD PTR _s1$[ebp], ecx
; Line 3011
	cmp	DWORD PTR _s1$[ebp], 0
	jne	SHORT $L1784
; Line 3014
	or	eax, -1
	jmp	$L1795
$L1784:
; Line 3020
	mov	edx, DWORD PTR _Data$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR _macaddr$[ebp]
	mov	dl, BYTE PTR [eax+6]
	mov	BYTE PTR [ecx], dl
; Line 3021
	mov	eax, DWORD PTR _Data$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	edx, DWORD PTR _macaddr$[ebp]
	mov	al, BYTE PTR [ecx+7]
	mov	BYTE PTR [edx+1], al
; Line 3022
	mov	ecx, DWORD PTR _Data$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	eax, DWORD PTR _macaddr$[ebp]
	mov	cl, BYTE PTR [edx+8]
	mov	BYTE PTR [eax+2], cl
; Line 3023
	mov	edx, DWORD PTR _Data$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR _macaddr$[ebp]
	mov	dl, BYTE PTR [eax+9]
	mov	BYTE PTR [ecx+3], dl
; Line 3024
	mov	eax, DWORD PTR _Data$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	edx, DWORD PTR _macaddr$[ebp]
	mov	al, BYTE PTR [ecx+10]
	mov	BYTE PTR [edx+4], al
; Line 3025
	mov	ecx, DWORD PTR _Data$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	eax, DWORD PTR _macaddr$[ebp]
	mov	cl, BYTE PTR [edx+11]
	mov	BYTE PTR [eax+5], cl
; Line 3039
	mov	edx, DWORD PTR _Data$[ebp]
	mov	eax, DWORD PTR [edx]
	movsx	ecx, BYTE PTR [eax+12]
	and	ecx, 255				; 000000ffH
	mov	DWORD PTR _PROTOCOL_TYPE$[ebp], ecx
; Line 3040
	mov	edx, DWORD PTR _PROTOCOL_TYPE$[ebp]
	shl	edx, 8
	mov	DWORD PTR _PROTOCOL_TYPE$[ebp], edx
; Line 3041
	mov	eax, DWORD PTR _Data$[ebp]
	mov	ecx, DWORD PTR [eax]
	movsx	edx, BYTE PTR [ecx+13]
	and	edx, 255				; 000000ffH
	mov	eax, DWORD PTR _PROTOCOL_TYPE$[ebp]
	or	eax, edx
	mov	DWORD PTR _PROTOCOL_TYPE$[ebp], eax
; Line 3042
	mov	ecx, DWORD PTR _Data$[ebp]
	mov	edx, DWORD PTR [ecx]
	movsx	eax, BYTE PTR [edx+34]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _portno$[ebp], eax
; Line 3043
	mov	ecx, DWORD PTR _portno$[ebp]
	shl	ecx, 8
	mov	DWORD PTR _portno$[ebp], ecx
; Line 3044
	mov	edx, DWORD PTR _Data$[ebp]
	mov	eax, DWORD PTR [edx]
	movsx	ecx, BYTE PTR [eax+35]
	and	ecx, 255				; 000000ffH
	mov	edx, DWORD PTR _portno$[ebp]
	or	edx, ecx
	mov	DWORD PTR _portno$[ebp], edx
; Line 3046
	mov	eax, DWORD PTR _Type$[ebp]
	mov	ecx, DWORD PTR _PROTOCOL_TYPE$[ebp]
	mov	DWORD PTR [eax], ecx
; Line 3048
	mov	edx, DWORD PTR _Type$[ebp]
	cmp	DWORD PTR [edx], 2054			; 00000806H
	jne	SHORT $L1786
; Line 3051
	mov	eax, DWORD PTR _Data$[ebp]
	mov	ecx, DWORD PTR [eax]
	movsx	edx, BYTE PTR [ecx+38]
	mov	eax, DWORD PTR _ipaddr$[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	edx, ecx
	jne	SHORT $L1788
	mov	edx, DWORD PTR _Data$[ebp]
	mov	eax, DWORD PTR [edx]
	movsx	ecx, BYTE PTR [eax+39]
	mov	edx, DWORD PTR _ipaddr$[ebp]
	movsx	eax, BYTE PTR [edx+1]
	cmp	ecx, eax
	jne	SHORT $L1788
	mov	ecx, DWORD PTR _Data$[ebp]
	mov	edx, DWORD PTR [ecx]
	movsx	eax, BYTE PTR [edx+40]
	mov	ecx, DWORD PTR _ipaddr$[ebp]
	movsx	edx, BYTE PTR [ecx+2]
	cmp	eax, edx
	jne	SHORT $L1788
	mov	eax, DWORD PTR _Data$[ebp]
	mov	ecx, DWORD PTR [eax]
	movsx	edx, BYTE PTR [ecx+41]
	mov	eax, DWORD PTR _ipaddr$[ebp]
	movsx	ecx, BYTE PTR [eax+3]
	cmp	edx, ecx
	je	SHORT $L1787
$L1788:
; Line 3055
	mov	ecx, DWORD PTR _this$[ebp]
	call	?discardPacket@EtherObj@@QAEHXZ		; EtherObj::discardPacket
; Line 3056
	mov	eax, -2					; fffffffeH
	jmp	$L1795
$L1787:
; Line 3059
	jmp	SHORT $L1793
$L1786:
	mov	edx, DWORD PTR _Type$[ebp]
	cmp	DWORD PTR [edx], 2048			; 00000800H
	jne	SHORT $L1790
; Line 3062
	mov	eax, DWORD PTR _Data$[ebp]
	mov	ecx, DWORD PTR [eax]
	movsx	edx, BYTE PTR [ecx+30]
	mov	eax, DWORD PTR _ipaddr$[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	edx, ecx
	jne	SHORT $L1792
	mov	edx, DWORD PTR _Data$[ebp]
	mov	eax, DWORD PTR [edx]
	movsx	ecx, BYTE PTR [eax+31]
	mov	edx, DWORD PTR _ipaddr$[ebp]
	movsx	eax, BYTE PTR [edx+1]
	cmp	ecx, eax
	jne	SHORT $L1792
	mov	ecx, DWORD PTR _Data$[ebp]
	mov	edx, DWORD PTR [ecx]
	movsx	eax, BYTE PTR [edx+32]
	mov	ecx, DWORD PTR _ipaddr$[ebp]
	movsx	edx, BYTE PTR [ecx+2]
	cmp	eax, edx
	jne	SHORT $L1792
	mov	eax, DWORD PTR _Data$[ebp]
	mov	ecx, DWORD PTR [eax]
	movsx	edx, BYTE PTR [ecx+33]
	mov	eax, DWORD PTR _ipaddr$[ebp]
	movsx	ecx, BYTE PTR [eax+3]
	cmp	edx, ecx
	je	SHORT $L1791
$L1792:
; Line 3066
	mov	ecx, DWORD PTR _this$[ebp]
	call	?discardPacket@EtherObj@@QAEHXZ		; EtherObj::discardPacket
; Line 3067
	mov	eax, -2					; fffffffeH
	jmp	SHORT $L1795
$L1791:
; Line 3070
	jmp	SHORT $L1793
$L1790:
; Line 3073
	mov	ecx, DWORD PTR _this$[ebp]
	call	?discardPacket@EtherObj@@QAEHXZ		; EtherObj::discardPacket
; Line 3085
	mov	eax, -3					; fffffffdH
	jmp	SHORT $L1795
$L1793:
; Line 3088
	mov	edx, DWORD PTR _Data$[ebp]
	mov	eax, DWORD PTR [edx]
	add	eax, 14					; 0000000eH
	mov	ecx, DWORD PTR _Data$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 3089
	mov	edx, DWORD PTR _pktlen$[ebp]
	sub	edx, 14					; 0000000eH
	mov	DWORD PTR _pktlen$[ebp], edx
; Line 3094
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getICR@EtherObj@@QAEHXZ		; EtherObj::getICR
	mov	DWORD PTR _retcode$[ebp], eax
; Line 3095
	mov	eax, DWORD PTR _retcode$[ebp]
	and	eax, 64					; 00000040H
	cmp	eax, 1
	jne	SHORT $L1794
; Line 3097
	mov	eax, -4					; fffffffcH
	jmp	SHORT $L1795
$L1794:
; Line 3099
	mov	eax, DWORD PTR _pktlen$[ebp]
$L1795:
; Line 3100
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
; Line 3108
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	mov	DWORD PTR _this$[ebp], ecx
; Line 3111
	lea	eax, DWORD PTR _l1$[ebp]
	mov	DWORD PTR _p1$[ebp], eax
; Line 3112
	mov	DWORD PTR _retcode$[ebp], 0
; Line 3113
	mov	DWORD PTR _rtail$[ebp], 0
; Line 3118
	mov	ecx, DWORD PTR ?ReceiveOutPtr@EtherObj@@2JA ; EtherObj::ReceiveOutPtr
	shl	ecx, 4
	mov	edx, DWORD PTR ?RDLPointer@EtherObj@@2JA ; EtherObj::RDLPointer
	lea	eax, DWORD PTR [edx+ecx-1114112]
	mov	DWORD PTR _p1$[ebp], eax
; Line 3120
	mov	ecx, DWORD PTR _p1$[ebp]
	add	ecx, 4
	mov	DWORD PTR _p1$[ebp], ecx
; Line 3121
	mov	edx, DWORD PTR _p1$[ebp]
	add	edx, 4
	mov	DWORD PTR _p1$[ebp], edx
; Line 3122
	mov	eax, DWORD PTR _p1$[ebp]
	add	eax, 4
	mov	DWORD PTR _p1$[ebp], eax
; Line 3124
	mov	ecx, DWORD PTR _p1$[ebp]
	mov	DWORD PTR [ecx], 0
; Line 3126
	mov	edx, DWORD PTR ?ReceiveOutPtr@EtherObj@@2JA ; EtherObj::ReceiveOutPtr
	add	edx, 1
	mov	DWORD PTR ?ReceiveOutPtr@EtherObj@@2JA, edx ; EtherObj::ReceiveOutPtr
; Line 3128
	cmp	DWORD PTR ?ReceiveOutPtr@EtherObj@@2JA, 4096 ; EtherObj::ReceiveOutPtr, 00001000H
	jne	SHORT $L1804
; Line 3130
	mov	DWORD PTR ?ReceiveOutPtr@EtherObj@@2JA, 0 ; EtherObj::ReceiveOutPtr
$L1804:
; Line 3134
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getRDTail@EtherObj@@QAEHXZ		; EtherObj::getRDTail
	mov	DWORD PTR _retcode$[ebp], eax
; Line 3136
	cmp	DWORD PTR _retcode$[ebp], 4095		; 00000fffH
	jne	SHORT $L1805
; Line 3137
	mov	DWORD PTR _rtail$[ebp], 0
; Line 3138
	jmp	SHORT $L1806
$L1805:
; Line 3139
	mov	eax, DWORD PTR _retcode$[ebp]
	add	eax, 1
	mov	DWORD PTR _rtail$[ebp], eax
$L1806:
; Line 3142
	mov	ecx, DWORD PTR _rtail$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setRDTail@EtherObj@@QAEHH@Z		; EtherObj::setRDTail
	mov	DWORD PTR _retcode$[ebp], eax
; Line 3144
	mov	edx, DWORD PTR ?TotalRcvCount@EtherObj@@2JA ; EtherObj::TotalRcvCount
	add	edx, 1
	mov	DWORD PTR ?TotalRcvCount@EtherObj@@2JA, edx ; EtherObj::TotalRcvCount
; Line 3146
	xor	eax, eax
; Line 3147
	mov	esp, ebp
	pop	ebp
	ret	0
?discardPacket@EtherObj@@QAEHXZ ENDP			; EtherObj::discardPacket
_TEXT	ENDS
PUBLIC	?TDLFull@EtherObj@@QAEHXZ			; EtherObj::TDLFull
_DATA	SEGMENT
$SG1812	DB	'TDL is FULL', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -8
_retcode$ = -4
?TDLFull@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::TDLFull
; Line 3153
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 3154
	mov	DWORD PTR _retcode$[ebp], 0
; Line 3156
	mov	eax, DWORD PTR ?SendInPtr@EtherObj@@2JA	; EtherObj::SendInPtr
	add	eax, 1
	and	eax, -2147479553			; 80000fffH
	jns	SHORT $L2090
	dec	eax
	or	eax, -4096				; fffff000H
	inc	eax
$L2090:
	cmp	eax, DWORD PTR ?SendOutPtr@EtherObj@@2JA ; EtherObj::SendOutPtr
	jne	SHORT $L1811
; Line 3158
	mov	DWORD PTR _retcode$[ebp], 1
; Line 3159
	push	3280					; 00000cd0H
	push	OFFSET FLAT:$SG1812
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 3160
	push	3220					; 00000c94H
	mov	ecx, DWORD PTR ?SendInPtr@EtherObj@@2JA	; EtherObj::SendInPtr
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 3161
	push	3240					; 00000ca8H
	mov	edx, DWORD PTR ?SendOutPtr@EtherObj@@2JA ; EtherObj::SendOutPtr
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 3162
	push	3260					; 00000cbcH
	push	4096					; 00001000H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 3164
	jmp	SHORT $L1813
$L1811:
; Line 3165
	mov	DWORD PTR _retcode$[ebp], 0
$L1813:
; Line 3167
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 3168
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
_k$1837 = -32
?IPInsertPkt@EtherObj@@QAEHPADHH0H@Z PROC NEAR		; EtherObj::IPInsertPkt
; Line 3180
	push	ebp
	mov	ebp, esp
	sub	esp, 36					; 00000024H
	mov	DWORD PTR _this$[ebp], ecx
; Line 3182
	mov	DWORD PTR _i$[ebp], 0
; Line 3183
	mov	DWORD PTR _sizeOfPacket$[ebp], 0
; Line 3184
	mov	DWORD PTR _temp$[ebp], 0
; Line 3186
	mov	DWORD PTR _x$[ebp], 0
; Line 3189
	lea	eax, DWORD PTR _c3$[ebp]
	mov	DWORD PTR _p1$[ebp], eax
; Line 3194
	mov	ecx, DWORD PTR ?SendInPtr@EtherObj@@2JA	; EtherObj::SendInPtr
	shl	ecx, 4
	mov	edx, DWORD PTR ?TDLPointer@EtherObj@@2JA ; EtherObj::TDLPointer
	lea	eax, DWORD PTR [edx+ecx-1114112]
	mov	DWORD PTR _x$[ebp], eax
; Line 3200
	mov	ecx, DWORD PTR _x$[ebp]
	add	ecx, 1114112				; 00110000H
	mov	edx, DWORD PTR ?TDLPointer@EtherObj@@2JA ; EtherObj::TDLPointer
	add	edx, 65520				; 0000fff0H
	cmp	ecx, edx
	jle	SHORT $L1829
; Line 3202
	mov	eax, -12				; fffffff4H
	jmp	$L1821
$L1829:
; Line 3205
	mov	eax, DWORD PTR _PACK$[ebp]
	sub	eax, 14					; 0000000eH
	mov	DWORD PTR _PACK$[ebp], eax
; Line 3207
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR _p1$[ebp], ecx
; Line 3210
	mov	edx, DWORD PTR ?TDLDataPointer@EtherObj@@2JA ; EtherObj::TDLDataPointer
	add	edx, 6553600				; 00640000H
	mov	eax, DWORD PTR _p1$[ebp]
	cmp	DWORD PTR [eax], edx
	jl	SHORT $L1831
; Line 3212
	mov	eax, -13				; fffffff3H
	jmp	$L1821
$L1831:
; Line 3215
	mov	ecx, DWORD PTR ?SendInPtr@EtherObj@@2JA	; EtherObj::SendInPtr
	add	ecx, 1
	mov	DWORD PTR ?SendInPtr@EtherObj@@2JA, ecx	; EtherObj::SendInPtr
; Line 3217
	cmp	DWORD PTR ?SendInPtr@EtherObj@@2JA, 4096 ; EtherObj::SendInPtr, 00001000H
	jne	SHORT $L1832
; Line 3219
	mov	DWORD PTR ?SendInPtr@EtherObj@@2JA, 0	; EtherObj::SendInPtr
$L1832:
; Line 3222
	mov	edx, DWORD PTR _p1$[ebp]
	add	edx, 4
	mov	DWORD PTR _p1$[ebp], edx
; Line 3223
	mov	eax, DWORD PTR _p1$[ebp]
	add	eax, 4
	mov	DWORD PTR _p1$[ebp], eax
; Line 3225
	mov	ecx, DWORD PTR _PACK_Size$[ebp]
	add	ecx, 14					; 0000000eH
	mov	DWORD PTR _sizeOfPacket$[ebp], ecx
; Line 3227
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1833
$L1834:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L1833:
	cmp	DWORD PTR _i$[ebp], 6
	jge	SHORT $L1835
; Line 3229
	mov	eax, DWORD PTR _PACK$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _Target_HAdd$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	dl, BYTE PTR [ecx]
	mov	BYTE PTR [eax], dl
; Line 3230
	mov	eax, DWORD PTR _PACK$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	dl, BYTE PTR ?mac@EtherObj@@2PADA[ecx]
	mov	BYTE PTR [eax+6], dl
; Line 3231
	jmp	SHORT $L1834
$L1835:
; Line 3232
	mov	eax, DWORD PTR _PROTOCOL$[ebp]
	sar	eax, 8
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _PACK$[ebp]
	mov	BYTE PTR [ecx+12], al
; Line 3233
	mov	edx, DWORD PTR _PROTOCOL$[ebp]
	and	edx, 255				; 000000ffH
	mov	eax, DWORD PTR _PACK$[ebp]
	mov	BYTE PTR [eax+13], dl
; Line 3236
	cmp	DWORD PTR _sizeOfPacket$[ebp], 60	; 0000003cH
	jge	SHORT $L1836
; Line 3238
	mov	ecx, 60					; 0000003cH
	sub	ecx, DWORD PTR _sizeOfPacket$[ebp]
	mov	DWORD PTR _k$1837[ebp], ecx
; Line 3239
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1838
$L1839:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L1838:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _k$1837[ebp]
	jge	SHORT $L1840
; Line 3241
	mov	ecx, DWORD PTR _sizeOfPacket$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _PACK$[ebp]
	mov	BYTE PTR [edx+ecx], 0
; Line 3242
	jmp	SHORT $L1839
$L1840:
; Line 3243
	mov	DWORD PTR _sizeOfPacket$[ebp], 60	; 0000003cH
$L1836:
; Line 3246
	mov	eax, DWORD PTR _p1$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _temp$[ebp], ecx
; Line 3247
	mov	edx, DWORD PTR _temp$[ebp]
	and	edx, -65536				; ffff0000H
	mov	DWORD PTR _temp$[ebp], edx
; Line 3248
	mov	eax, DWORD PTR _temp$[ebp]
	add	eax, DWORD PTR _sizeOfPacket$[ebp]
	mov	DWORD PTR _temp$[ebp], eax
; Line 3250
	mov	ecx, DWORD PTR _p1$[ebp]
	mov	edx, DWORD PTR _temp$[ebp]
	mov	DWORD PTR [ecx], edx
; Line 3252
	mov	ecx, DWORD PTR _this$[ebp]
	call	?sndCall@EtherObj@@QAEHXZ		; EtherObj::sndCall
	mov	DWORD PTR _retcode$[ebp], eax
; Line 3254
	xor	eax, eax
$L1821:
; Line 3255
	mov	esp, ebp
	pop	ebp
	ret	20					; 00000014H
?IPInsertPkt@EtherObj@@QAEHPADHH0H@Z ENDP		; EtherObj::IPInsertPkt
_this$ = -16
_retcode$ = -4
_ttail$ = -12
_temp$ = -8
?sndCall@EtherObj@@QAEHXZ PROC NEAR			; EtherObj::sndCall
; Line 3261
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	mov	DWORD PTR _this$[ebp], ecx
; Line 3262
	mov	DWORD PTR _retcode$[ebp], 0
; Line 3263
	mov	DWORD PTR _ttail$[ebp], 0
; Line 3264
	mov	DWORD PTR _temp$[ebp], 0
; Line 3268
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getTDTail@EtherObj@@QAEHXZ		; EtherObj::getTDTail
	mov	DWORD PTR _retcode$[ebp], eax
; Line 3270
	cmp	DWORD PTR _retcode$[ebp], 4095		; 00000fffH
	jne	SHORT $L1847
; Line 3271
	mov	DWORD PTR _ttail$[ebp], 0
; Line 3272
	jmp	SHORT $L1848
$L1847:
; Line 3273
	mov	eax, DWORD PTR _retcode$[ebp]
	add	eax, 1
	mov	DWORD PTR _ttail$[ebp], eax
$L1848:
; Line 3276
	mov	ecx, DWORD PTR _ttail$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setTDTail@EtherObj@@QAEHH@Z		; EtherObj::setTDTail
	mov	DWORD PTR _retcode$[ebp], eax
; Line 3278
	xor	eax, eax
; Line 3279
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
; Line 3285
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	mov	DWORD PTR _this$[ebp], ecx
; Line 3286
	mov	DWORD PTR _retcode$[ebp], 0
; Line 3287
	lea	ecx, DWORD PTR _io$[ebp]
	call	??0AOAProtected@@QAE@XZ			; AOAProtected::AOAProtected
$L1855:
; Line 3289
	mov	eax, DWORD PTR ?SendOutPtr@EtherObj@@2JA ; EtherObj::SendOutPtr
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?isTDescDone@EtherObj@@QAEHH@Z		; EtherObj::isTDescDone
	test	eax, eax
	je	SHORT $L1856
; Line 3291
	mov	ecx, DWORD PTR ?SendOutPtr@EtherObj@@2JA ; EtherObj::SendOutPtr
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?resetTDescDone@EtherObj@@QAEHH@Z	; EtherObj::resetTDescDone
	mov	DWORD PTR _retcode$[ebp], eax
; Line 3292
	cmp	DWORD PTR ?SendOutPtr@EtherObj@@2JA, 4095 ; EtherObj::SendOutPtr, 00000fffH
	jne	SHORT $L1857
; Line 3293
	mov	DWORD PTR ?SendOutPtr@EtherObj@@2JA, 0	; EtherObj::SendOutPtr
; Line 3294
	jmp	SHORT $L1858
$L1857:
; Line 3295
	mov	edx, DWORD PTR ?SendOutPtr@EtherObj@@2JA ; EtherObj::SendOutPtr
	add	edx, 1
	mov	DWORD PTR ?SendOutPtr@EtherObj@@2JA, edx ; EtherObj::SendOutPtr
$L1858:
; Line 3296
	jmp	SHORT $L1855
$L1856:
; Line 3298
	xor	eax, eax
; Line 3299
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
_k$1893 = -52
?ARPInsertPkt@EtherObj@@QAEHPADHH00HH@Z PROC NEAR	; EtherObj::ARPInsertPkt
; Line 3311
	push	ebp
	mov	ebp, esp
	sub	esp, 56					; 00000038H
	mov	DWORD PTR _this$[ebp], ecx
; Line 3316
	lea	eax, DWORD PTR _c1$[ebp]
	mov	DWORD PTR _BUFFER$[ebp], eax
; Line 3317
	mov	DWORD PTR _i$[ebp], 0
; Line 3318
	mov	DWORD PTR _retcode$[ebp], 0
; Line 3319
	mov	DWORD PTR _sizeOfPacket$[ebp], 0
; Line 3320
	mov	DWORD PTR _stype$[ebp], 0
; Line 3321
	mov	DWORD PTR _temp$[ebp], 0
; Line 3323
	mov	DWORD PTR _x$[ebp], 0
; Line 3326
	lea	ecx, DWORD PTR _c3$[ebp]
	mov	DWORD PTR _p1$[ebp], ecx
; Line 3328
	mov	edx, DWORD PTR ?SendInPtr@EtherObj@@2JA	; EtherObj::SendInPtr
	shl	edx, 4
	mov	eax, DWORD PTR ?TDLPointer@EtherObj@@2JA ; EtherObj::TDLPointer
	lea	ecx, DWORD PTR [eax+edx-1114112]
	mov	DWORD PTR _x$[ebp], ecx
; Line 3334
	mov	edx, DWORD PTR _x$[ebp]
	add	edx, 1114112				; 00110000H
	mov	eax, DWORD PTR ?TDLPointer@EtherObj@@2JA ; EtherObj::TDLPointer
	add	eax, 65520				; 0000fff0H
	cmp	edx, eax
	jle	SHORT $L1881
; Line 3336
	mov	eax, -8					; fffffff8H
	jmp	$L1868
$L1881:
; Line 3339
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR _p1$[ebp], ecx
; Line 3342
	mov	edx, DWORD PTR ?TDLDataPointer@EtherObj@@2JA ; EtherObj::TDLDataPointer
	add	edx, 6553600				; 00640000H
	mov	eax, DWORD PTR _p1$[ebp]
	cmp	DWORD PTR [eax], edx
	jl	SHORT $L1883
; Line 3344
	mov	eax, -9					; fffffff7H
	jmp	$L1868
$L1883:
; Line 3347
	mov	ecx, DWORD PTR _p1$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR _BUFFER$[ebp], edx
; Line 3349
	mov	eax, DWORD PTR _BUFFER$[ebp]
	sub	eax, 1114112				; 00110000H
	mov	DWORD PTR _BUFFER$[ebp], eax
; Line 3351
	mov	ecx, DWORD PTR ?SendInPtr@EtherObj@@2JA	; EtherObj::SendInPtr
	add	ecx, 1
	mov	DWORD PTR ?SendInPtr@EtherObj@@2JA, ecx	; EtherObj::SendInPtr
; Line 3353
	cmp	DWORD PTR ?SendInPtr@EtherObj@@2JA, 4096 ; EtherObj::SendInPtr, 00001000H
	jne	SHORT $L1885
; Line 3355
	mov	DWORD PTR ?SendInPtr@EtherObj@@2JA, 0	; EtherObj::SendInPtr
$L1885:
; Line 3358
	mov	edx, DWORD PTR _p1$[ebp]
	add	edx, 4
	mov	DWORD PTR _p1$[ebp], edx
; Line 3359
	mov	eax, DWORD PTR _p1$[ebp]
	add	eax, 4
	mov	DWORD PTR _p1$[ebp], eax
; Line 3361
	mov	ecx, DWORD PTR _PACK_Size$[ebp]
	add	ecx, 14					; 0000000eH
	mov	DWORD PTR _sizeOfPacket$[ebp], ecx
; Line 3363
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1886
$L1887:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L1886:
	cmp	DWORD PTR _i$[ebp], 6
	jge	SHORT $L1888
; Line 3365
	mov	eax, DWORD PTR _BUFFER$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _Target_HAdd$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	dl, BYTE PTR [ecx]
	mov	BYTE PTR [eax], dl
; Line 3366
	mov	eax, DWORD PTR _BUFFER$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _Sender_HAdd$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	dl, BYTE PTR [ecx]
	mov	BYTE PTR [eax+6], dl
; Line 3367
	jmp	SHORT $L1887
$L1888:
; Line 3368
	mov	eax, DWORD PTR _PROTOCOL$[ebp]
	sar	eax, 8
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _BUFFER$[ebp]
	mov	BYTE PTR [ecx+12], al
; Line 3369
	mov	edx, DWORD PTR _PROTOCOL$[ebp]
	and	edx, 255				; 000000ffH
	mov	eax, DWORD PTR _BUFFER$[ebp]
	mov	BYTE PTR [eax+13], dl
; Line 3372
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1889
$L1890:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L1889:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _PACK_Size$[ebp]
	jge	SHORT $L1891
; Line 3374
	mov	eax, DWORD PTR _BUFFER$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _PACK$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	dl, BYTE PTR [ecx]
	mov	BYTE PTR [eax+14], dl
; Line 3375
	jmp	SHORT $L1890
$L1891:
; Line 3378
	cmp	DWORD PTR _sizeOfPacket$[ebp], 60	; 0000003cH
	jge	SHORT $L1892
; Line 3380
	mov	eax, 60					; 0000003cH
	sub	eax, DWORD PTR _sizeOfPacket$[ebp]
	mov	DWORD PTR _k$1893[ebp], eax
; Line 3381
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1894
$L1895:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L1894:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _k$1893[ebp]
	jge	SHORT $L1896
; Line 3383
	mov	eax, DWORD PTR _sizeOfPacket$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _BUFFER$[ebp]
	mov	BYTE PTR [ecx+eax], 0
; Line 3384
	jmp	SHORT $L1895
$L1896:
; Line 3385
	mov	DWORD PTR _sizeOfPacket$[ebp], 60	; 0000003cH
$L1892:
; Line 3388
	mov	edx, DWORD PTR _p1$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR _temp$[ebp], eax
; Line 3389
	mov	ecx, DWORD PTR _temp$[ebp]
	and	ecx, -65536				; ffff0000H
	mov	DWORD PTR _temp$[ebp], ecx
; Line 3390
	mov	edx, DWORD PTR _temp$[ebp]
	add	edx, DWORD PTR _sizeOfPacket$[ebp]
	mov	DWORD PTR _temp$[ebp], edx
; Line 3392
	mov	eax, DWORD PTR _p1$[ebp]
	mov	ecx, DWORD PTR _temp$[ebp]
	mov	DWORD PTR [eax], ecx
; Line 3394
	mov	ecx, DWORD PTR _this$[ebp]
	call	?sndCall@EtherObj@@QAEHXZ		; EtherObj::sndCall
	mov	DWORD PTR _retcode$[ebp], eax
; Line 3396
	xor	eax, eax
$L1868:
; Line 3397
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
_k$1922 = -36
?FormatEthPacket@EtherObj@@QAEHPADHH0JHH@Z PROC NEAR	; EtherObj::FormatEthPacket
; Line 3407
	push	ebp
	mov	ebp, esp
	sub	esp, 40					; 00000028H
	mov	DWORD PTR _this$[ebp], ecx
; Line 3409
	mov	DWORD PTR _i$[ebp], 0
; Line 3410
	mov	DWORD PTR _sizeOfPacket$[ebp], 0
; Line 3411
	mov	DWORD PTR _retcode$[ebp], 0
; Line 3413
	mov	DWORD PTR _x$[ebp], 0
; Line 3416
	lea	eax, DWORD PTR _c3$[ebp]
	mov	DWORD PTR _p1$[ebp], eax
; Line 3417
	mov	DWORD PTR _stype$[ebp], 0
; Line 3418
	mov	DWORD PTR _temp$[ebp], 0
; Line 3420
	mov	ecx, DWORD PTR _PACK_Size$[ebp]
	mov	edx, DWORD PTR ?TotalDataSent@EtherObj@@2JA ; EtherObj::TotalDataSent
	lea	eax, DWORD PTR [edx+ecx+14]
	mov	DWORD PTR ?TotalDataSent@EtherObj@@2JA, eax ; EtherObj::TotalDataSent
; Line 3425
	mov	ecx, DWORD PTR _InPtr$[ebp]
	shl	ecx, 4
	mov	edx, DWORD PTR ?TDLPointer@EtherObj@@2JA ; EtherObj::TDLPointer
	lea	eax, DWORD PTR [edx+ecx-1114112]
	mov	DWORD PTR _x$[ebp], eax
; Line 3431
	mov	ecx, DWORD PTR _x$[ebp]
	add	ecx, 1114112				; 00110000H
	mov	edx, DWORD PTR ?TDLPointer@EtherObj@@2JA ; EtherObj::TDLPointer
	add	edx, 65520				; 0000fff0H
	cmp	ecx, edx
	jle	SHORT $L1915
; Line 3433
	mov	eax, -26				; ffffffe6H
	jmp	$L1906
$L1915:
; Line 3436
	mov	eax, DWORD PTR _x$[ebp]
	mov	DWORD PTR _p1$[ebp], eax
; Line 3439
	mov	ecx, DWORD PTR ?TDLDataPointer@EtherObj@@2JA ; EtherObj::TDLDataPointer
	add	ecx, 6553600				; 00640000H
	mov	edx, DWORD PTR _p1$[ebp]
	cmp	DWORD PTR [edx], ecx
	jl	SHORT $L1917
; Line 3441
	mov	eax, -27				; ffffffe5H
	jmp	$L1906
$L1917:
; Line 3444
	mov	eax, DWORD PTR _p1$[ebp]
	add	eax, 4
	mov	DWORD PTR _p1$[ebp], eax
; Line 3445
	mov	ecx, DWORD PTR _p1$[ebp]
	add	ecx, 4
	mov	DWORD PTR _p1$[ebp], ecx
; Line 3447
	mov	edx, DWORD PTR _PACK_Size$[ebp]
	add	edx, 14					; 0000000eH
	mov	DWORD PTR _sizeOfPacket$[ebp], edx
; Line 3449
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1918
$L1919:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L1918:
	cmp	DWORD PTR _i$[ebp], 6
	jge	SHORT $L1920
; Line 3451
	mov	ecx, DWORD PTR _PACK$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _Target_HAdd$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	mov	al, BYTE PTR [edx]
	mov	BYTE PTR [ecx], al
; Line 3452
	mov	ecx, DWORD PTR _PACK$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	mov	al, BYTE PTR ?mac@EtherObj@@2PADA[edx]
	mov	BYTE PTR [ecx+6], al
; Line 3453
	jmp	SHORT $L1919
$L1920:
; Line 3454
	mov	ecx, DWORD PTR _PROTOCOL$[ebp]
	sar	ecx, 8
	and	ecx, 255				; 000000ffH
	mov	edx, DWORD PTR _PACK$[ebp]
	mov	BYTE PTR [edx+12], cl
; Line 3455
	mov	eax, DWORD PTR _PROTOCOL$[ebp]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _PACK$[ebp]
	mov	BYTE PTR [ecx+13], al
; Line 3459
	cmp	DWORD PTR _sizeOfPacket$[ebp], 60	; 0000003cH
	jge	SHORT $L1921
; Line 3461
	mov	edx, 60					; 0000003cH
	sub	edx, DWORD PTR _sizeOfPacket$[ebp]
	mov	DWORD PTR _k$1922[ebp], edx
; Line 3462
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1923
$L1924:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L1923:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _k$1922[ebp]
	jge	SHORT $L1925
; Line 3464
	mov	edx, DWORD PTR _sizeOfPacket$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _PACK$[ebp]
	mov	BYTE PTR [eax+edx], 0
; Line 3465
	jmp	SHORT $L1924
$L1925:
; Line 3466
	mov	DWORD PTR _sizeOfPacket$[ebp], 60	; 0000003cH
$L1921:
; Line 3469
	mov	ecx, DWORD PTR _p1$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR _temp$[ebp], edx
; Line 3470
	mov	eax, DWORD PTR _temp$[ebp]
	and	eax, -65536				; ffff0000H
	mov	DWORD PTR _temp$[ebp], eax
; Line 3471
	mov	ecx, DWORD PTR _temp$[ebp]
	add	ecx, DWORD PTR _sizeOfPacket$[ebp]
	mov	DWORD PTR _temp$[ebp], ecx
; Line 3473
	mov	edx, DWORD PTR _p1$[ebp]
	mov	eax, DWORD PTR _temp$[ebp]
	mov	DWORD PTR [edx], eax
; Line 3475
	mov	ecx, DWORD PTR _this$[ebp]
	call	?sndCall@EtherObj@@QAEHXZ		; EtherObj::sndCall
	mov	DWORD PTR _retcode$[ebp], eax
; Line 3477
	xor	eax, eax
$L1906:
; Line 3478
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
_k$1954 = -44
?FormatEthPacketN@EtherObj@@QAEHPADHH0JHHH@Z PROC NEAR	; EtherObj::FormatEthPacketN
; Line 3488
	push	ebp
	mov	ebp, esp
	sub	esp, 48					; 00000030H
	mov	DWORD PTR _this$[ebp], ecx
; Line 3490
	mov	DWORD PTR _i$[ebp], 0
; Line 3491
	mov	DWORD PTR _sizeOfPacket$[ebp], 0
; Line 3492
	mov	DWORD PTR _retcode$[ebp], 0
; Line 3493
	mov	DWORD PTR _c1$[ebp], 0
; Line 3494
	mov	DWORD PTR _c2$[ebp], 0
; Line 3496
	mov	DWORD PTR _x$[ebp], 0
; Line 3499
	lea	eax, DWORD PTR _c3$[ebp]
	mov	DWORD PTR _p1$[ebp], eax
; Line 3500
	mov	DWORD PTR _stype$[ebp], 0
; Line 3501
	mov	DWORD PTR _temp$[ebp], 0
; Line 3503
	mov	ecx, DWORD PTR _PACK_Size$[ebp]
	mov	edx, DWORD PTR ?TotalDataSent@EtherObj@@2JA ; EtherObj::TotalDataSent
	lea	eax, DWORD PTR [edx+ecx+14]
	mov	DWORD PTR ?TotalDataSent@EtherObj@@2JA, eax ; EtherObj::TotalDataSent
; Line 3508
	mov	ecx, DWORD PTR _InPtr$[ebp]
	shl	ecx, 4
	mov	edx, DWORD PTR ?TDLPointer@EtherObj@@2JA ; EtherObj::TDLPointer
	lea	eax, DWORD PTR [edx+ecx-1114112]
	mov	DWORD PTR _x$[ebp], eax
; Line 3514
	mov	ecx, DWORD PTR _x$[ebp]
	add	ecx, 1114112				; 00110000H
	mov	edx, DWORD PTR ?TDLPointer@EtherObj@@2JA ; EtherObj::TDLPointer
	add	edx, 65520				; 0000fff0H
	cmp	ecx, edx
	jle	SHORT $L1947
; Line 3516
	mov	eax, -26				; ffffffe6H
	jmp	$L1936
$L1947:
; Line 3519
	mov	eax, DWORD PTR _x$[ebp]
	mov	DWORD PTR _p1$[ebp], eax
; Line 3522
	mov	ecx, DWORD PTR ?TDLDataPointer@EtherObj@@2JA ; EtherObj::TDLDataPointer
	add	ecx, 6553600				; 00640000H
	mov	edx, DWORD PTR _p1$[ebp]
	cmp	DWORD PTR [edx], ecx
	jl	SHORT $L1949
; Line 3524
	mov	eax, -27				; ffffffe5H
	jmp	$L1936
$L1949:
; Line 3527
	mov	eax, DWORD PTR _p1$[ebp]
	add	eax, 4
	mov	DWORD PTR _p1$[ebp], eax
; Line 3528
	mov	ecx, DWORD PTR _p1$[ebp]
	add	ecx, 4
	mov	DWORD PTR _p1$[ebp], ecx
; Line 3530
	mov	edx, DWORD PTR _PACK_Size$[ebp]
	add	edx, 14					; 0000000eH
	mov	DWORD PTR _sizeOfPacket$[ebp], edx
; Line 3532
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1950
$L1951:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L1950:
	cmp	DWORD PTR _i$[ebp], 6
	jge	SHORT $L1952
; Line 3534
	mov	ecx, DWORD PTR _PACK$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _Target_HAdd$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	mov	al, BYTE PTR [edx]
	mov	BYTE PTR [ecx], al
; Line 3535
	mov	ecx, DWORD PTR _PACK$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	mov	al, BYTE PTR ?mac@EtherObj@@2PADA[edx]
	mov	BYTE PTR [ecx+6], al
; Line 3536
	jmp	SHORT $L1951
$L1952:
; Line 3537
	mov	ecx, DWORD PTR _PROTOCOL$[ebp]
	sar	ecx, 8
	and	ecx, 255				; 000000ffH
	mov	edx, DWORD PTR _PACK$[ebp]
	mov	BYTE PTR [edx+12], cl
; Line 3538
	mov	eax, DWORD PTR _PROTOCOL$[ebp]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _PACK$[ebp]
	mov	BYTE PTR [ecx+13], al
; Line 3542
	cmp	DWORD PTR _sizeOfPacket$[ebp], 60	; 0000003cH
	jge	SHORT $L1953
; Line 3544
	mov	edx, 60					; 0000003cH
	sub	edx, DWORD PTR _sizeOfPacket$[ebp]
	mov	DWORD PTR _k$1954[ebp], edx
; Line 3545
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1955
$L1956:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L1955:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _k$1954[ebp]
	jge	SHORT $L1957
; Line 3547
	mov	edx, DWORD PTR _sizeOfPacket$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _PACK$[ebp]
	mov	BYTE PTR [eax+edx], 0
; Line 3548
	jmp	SHORT $L1956
$L1957:
; Line 3549
	mov	DWORD PTR _sizeOfPacket$[ebp], 60	; 0000003cH
$L1953:
; Line 3552
	mov	ecx, DWORD PTR _p1$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR _temp$[ebp], edx
; Line 3553
	mov	eax, DWORD PTR _temp$[ebp]
	and	eax, -65536				; ffff0000H
	mov	DWORD PTR _temp$[ebp], eax
; Line 3554
	mov	ecx, DWORD PTR _temp$[ebp]
	add	ecx, DWORD PTR _sizeOfPacket$[ebp]
	mov	DWORD PTR _temp$[ebp], ecx
; Line 3556
	mov	edx, DWORD PTR _p1$[ebp]
	mov	eax, DWORD PTR _temp$[ebp]
	mov	DWORD PTR [edx], eax
; Line 3558
	cmp	DWORD PTR _count$[ebp], 0
	je	SHORT $L1958
; Line 3559
	mov	ecx, DWORD PTR _count$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?sndCallN@EtherObj@@QAEHH@Z		; EtherObj::sndCallN
	mov	DWORD PTR _retcode$[ebp], eax
$L1958:
; Line 3561
	xor	eax, eax
$L1936:
; Line 3562
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
; Line 3568
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	mov	DWORD PTR _this$[ebp], ecx
; Line 3569
	mov	DWORD PTR _retcode$[ebp], 0
; Line 3570
	mov	DWORD PTR _ttail$[ebp], 0
; Line 3571
	mov	DWORD PTR _temp$[ebp], 0
; Line 3574
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getTDTail@EtherObj@@QAEHXZ		; EtherObj::getTDTail
	mov	DWORD PTR _retcode$[ebp], eax
; Line 3576
	mov	eax, DWORD PTR _retcode$[ebp]
	add	eax, DWORD PTR _count$[ebp]
	mov	DWORD PTR _temp$[ebp], eax
; Line 3577
	cmp	DWORD PTR _temp$[ebp], 4095		; 00000fffH
	jle	SHORT $L1966
; Line 3578
	mov	ecx, DWORD PTR _temp$[ebp]
	sub	ecx, 4096				; 00001000H
	mov	DWORD PTR _temp$[ebp], ecx
$L1966:
; Line 3581
	mov	edx, DWORD PTR _temp$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setTDTail@EtherObj@@QAEHH@Z		; EtherObj::setTDTail
	mov	DWORD PTR _retcode$[ebp], eax
; Line 3583
	xor	eax, eax
; Line 3584
	mov	esp, ebp
	pop	ebp
	ret	4
?sndCallN@EtherObj@@QAEHH@Z ENDP			; EtherObj::sndCallN
_TEXT	ENDS
END
