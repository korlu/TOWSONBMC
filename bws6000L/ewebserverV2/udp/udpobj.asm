	TITLE	udpobj.cpp
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
;	COMDAT ??0FTPObj@@QAE@XZ
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT ??0UDPObj@@QAE@XZ
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
FLAT	GROUP _DATA, CONST, _BSS
	ASSUME	CS: FLAT, DS: FLAT, SS: FLAT
endif
PUBLIC	?sourceIP@UDPObj@@0PADA				; UDPObj::sourceIP
PUBLIC	?sourcePort@UDPObj@@0GA				; UDPObj::sourcePort
_BSS	SEGMENT
?sourceIP@UDPObj@@0PADA DB 04H DUP (?)			; UDPObj::sourceIP
?sourcePort@UDPObj@@0GA DW 01H DUP (?)			; UDPObj::sourcePort
_BSS	ENDS
PUBLIC	?init@UDPObj@@QAEXPADG@Z			; UDPObj::init
_TEXT	SEGMENT
_IP$ = 8
_port$ = 12
_this$ = -8
_i$ = -4
?init@UDPObj@@QAEXPADG@Z PROC NEAR			; UDPObj::init
; File udpobj.cpp
; Line 17
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 18
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1625
$L1626:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L1625:
	cmp	DWORD PTR _i$[ebp], 4
	jge	SHORT $L1627
; Line 19
	mov	ecx, DWORD PTR _IP$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	mov	al, BYTE PTR [ecx]
	mov	BYTE PTR ?sourceIP@UDPObj@@0PADA[edx], al
	jmp	SHORT $L1626
$L1627:
; Line 20
	mov	cx, WORD PTR _port$[ebp]
	mov	WORD PTR ?sourcePort@UDPObj@@0GA, cx	; UDPObj::sourcePort
; Line 21
	mov	esp, ebp
	pop	ebp
	ret	8
?init@UDPObj@@QAEXPADG@Z ENDP				; UDPObj::init
_TEXT	ENDS
PUBLIC	?sendData@UDPObj@@QAEHPADG0H0H@Z		; UDPObj::sendData
EXTRN	?sendData@IPObj@@QAEHPADHQAD1HH@Z:NEAR		; IPObj::sendData
EXTRN	?resolveFlagForFileTransfer@ARPObj@@2HA:DWORD	; ARPObj::resolveFlagForFileTransfer
EXTRN	??0ARPObj@@QAE@XZ:NEAR				; ARPObj::ARPObj
EXTRN	??0AOAProtected@@QAE@XZ:NEAR			; AOAProtected::AOAProtected
EXTRN	??0AOATask@@QAE@XZ:NEAR				; AOATask::AOATask
_TEXT	SEGMENT
_tIP$ = 8
_tPort$ = 12
_Data$ = 16
_Datasize$ = 20
_DestMac$ = 24
_currenttask$ = 28
_this$ = -364
_io$ = -24
_task$ = -72
_arp$ = -360
_sizeOfPacket$ = -8
_temp$ = -12
_retcode$ = -4
?sendData@UDPObj@@QAEHPADG0H0H@Z PROC NEAR		; UDPObj::sendData
; Line 27
	push	ebp
	mov	ebp, esp
	sub	esp, 364				; 0000016cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 28
	lea	ecx, DWORD PTR _io$[ebp]
	call	??0AOAProtected@@QAE@XZ			; AOAProtected::AOAProtected
; Line 29
	lea	ecx, DWORD PTR _task$[ebp]
	call	??0AOATask@@QAE@XZ			; AOATask::AOATask
; Line 30
	lea	ecx, DWORD PTR _arp$[ebp]
	call	??0ARPObj@@QAE@XZ			; ARPObj::ARPObj
; Line 31
	mov	DWORD PTR _sizeOfPacket$[ebp], 0
; Line 34
	mov	DWORD PTR _retcode$[ebp], 0
; Line 36
	mov	eax, DWORD PTR _Datasize$[ebp]
	add	eax, 8
	mov	DWORD PTR _sizeOfPacket$[ebp], eax
; Line 37
	mov	ecx, DWORD PTR _Data$[ebp]
	sub	ecx, 8
	mov	DWORD PTR _Data$[ebp], ecx
; Line 40
	xor	edx, edx
	mov	dx, WORD PTR ?sourcePort@UDPObj@@0GA	; UDPObj::sourcePort
	sar	edx, 8
	and	edx, 255				; 000000ffH
	mov	eax, DWORD PTR _Data$[ebp]
	mov	BYTE PTR [eax], dl
; Line 41
	movsx	ecx, BYTE PTR ?sourcePort@UDPObj@@0GA
	and	ecx, 255				; 000000ffH
	mov	edx, DWORD PTR _Data$[ebp]
	mov	BYTE PTR [edx+1], cl
; Line 43
	mov	eax, DWORD PTR _tPort$[ebp]
	and	eax, 65535				; 0000ffffH
	sar	eax, 8
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _Data$[ebp]
	mov	BYTE PTR [ecx+2], al
; Line 44
	movsx	edx, BYTE PTR _tPort$[ebp]
	and	edx, 255				; 000000ffH
	mov	eax, DWORD PTR _Data$[ebp]
	mov	BYTE PTR [eax+3], dl
; Line 47
	mov	DWORD PTR _temp$[ebp], 0
; Line 48
	mov	ecx, DWORD PTR _Datasize$[ebp]
	add	ecx, 8
	mov	DWORD PTR _temp$[ebp], ecx
; Line 49
	mov	edx, DWORD PTR _temp$[ebp]
	shr	edx, 8
	and	edx, 255				; 000000ffH
	mov	eax, DWORD PTR _Data$[ebp]
	mov	BYTE PTR [eax+4], dl
; Line 50
	movsx	ecx, BYTE PTR _temp$[ebp]
	and	ecx, 255				; 000000ffH
	mov	edx, DWORD PTR _Data$[ebp]
	mov	BYTE PTR [edx+5], cl
; Line 53
	mov	eax, DWORD PTR _Data$[ebp]
	mov	BYTE PTR [eax+6], 0
; Line 54
	mov	ecx, DWORD PTR _Data$[ebp]
	mov	BYTE PTR [ecx+7], 0
; Line 56
	mov	edx, DWORD PTR _currenttask$[ebp]
	push	edx
	push	17					; 00000011H
	mov	eax, DWORD PTR _DestMac$[ebp]
	push	eax
	mov	ecx, DWORD PTR _tIP$[ebp]
	push	ecx
	mov	edx, DWORD PTR _sizeOfPacket$[ebp]
	push	edx
	mov	eax, DWORD PTR _Data$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?sendData@IPObj@@QAEHPADHQAD1HH@Z	; IPObj::sendData
	mov	DWORD PTR _retcode$[ebp], eax
; Line 58
	mov	DWORD PTR ?resolveFlagForFileTransfer@ARPObj@@2HA, 1 ; ARPObj::resolveFlagForFileTransfer
; Line 60
	mov	eax, DWORD PTR _retcode$[ebp]
; Line 61
	mov	esp, ebp
	pop	ebp
	ret	24					; 00000018H
?sendData@UDPObj@@QAEHPADG0H0H@Z ENDP			; UDPObj::sendData
_TEXT	ENDS
PUBLIC	?UDPHandler@UDPObj@@QAEHPADH00HH@Z		; UDPObj::UDPHandler
PUBLIC	??0FTPObj@@QAE@XZ				; FTPObj::FTPObj
EXTRN	?FtpHandler@FTPObj@@QAEHPADJ0GH@Z:NEAR		; FTPObj::FtpHandler
_TEXT	SEGMENT
_UDPPack$ = 8
_size$ = 12
_TargetIP$ = 20
_currenttask$ = 28
_this$ = -340
_ftp$ = -336
_DestPort$ = -16
_Size$ = -4
_temp$ = -12
_retcode$ = -8
?UDPHandler@UDPObj@@QAEHPADH00HH@Z PROC NEAR		; UDPObj::UDPHandler
; Line 69
	push	ebp
	mov	ebp, esp
	sub	esp, 340				; 00000154H
	mov	DWORD PTR _this$[ebp], ecx
; Line 70
	lea	ecx, DWORD PTR _ftp$[ebp]
	call	??0FTPObj@@QAE@XZ			; FTPObj::FTPObj
; Line 71
	mov	WORD PTR _DestPort$[ebp], 0
; Line 72
	mov	DWORD PTR _Size$[ebp], 0
; Line 73
	mov	DWORD PTR _temp$[ebp], 0
; Line 74
	mov	DWORD PTR _retcode$[ebp], 0
; Line 77
	cmp	DWORD PTR _size$[ebp], 8
	jge	SHORT $L1661
; Line 78
	mov	eax, -14				; fffffff2H
	jmp	$L1655
$L1661:
; Line 81
	mov	eax, DWORD PTR _UDPPack$[ebp]
	movsx	ecx, BYTE PTR [eax+2]
	and	ecx, 255				; 000000ffH
	xor	edx, edx
	mov	dx, WORD PTR ?sourcePort@UDPObj@@0GA	; UDPObj::sourcePort
	sar	edx, 8
	and	edx, 255				; 000000ffH
	cmp	ecx, edx
	jne	SHORT $L1663
	mov	eax, DWORD PTR _UDPPack$[ebp]
	movsx	ecx, BYTE PTR [eax+3]
	and	ecx, 255				; 000000ffH
	xor	edx, edx
	mov	dx, WORD PTR ?sourcePort@UDPObj@@0GA	; UDPObj::sourcePort
	and	edx, 255				; 000000ffH
	cmp	ecx, edx
	je	SHORT $L1662
$L1663:
; Line 82
	mov	eax, -15				; fffffff1H
	jmp	$L1655
$L1662:
; Line 84
	mov	eax, DWORD PTR _UDPPack$[ebp]
	movsx	ecx, BYTE PTR [eax]
	and	ecx, 255				; 000000ffH
	mov	WORD PTR _DestPort$[ebp], cx
; Line 85
	mov	edx, DWORD PTR _DestPort$[ebp]
	and	edx, 65535				; 0000ffffH
	shl	edx, 8
	and	edx, 65280				; 0000ff00H
	mov	eax, DWORD PTR _UDPPack$[ebp]
	movsx	ecx, BYTE PTR [eax+1]
	and	ecx, 255				; 000000ffH
	or	edx, ecx
	mov	WORD PTR _DestPort$[ebp], dx
; Line 87
	mov	edx, DWORD PTR _UDPPack$[ebp]
	movsx	eax, BYTE PTR [edx+4]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _temp$[ebp], eax
; Line 88
	mov	ecx, DWORD PTR _temp$[ebp]
	shl	ecx, 8
	and	ecx, 65280				; 0000ff00H
	mov	edx, DWORD PTR _UDPPack$[ebp]
	movsx	eax, BYTE PTR [edx+5]
	and	eax, 255				; 000000ffH
	or	ecx, eax
	mov	DWORD PTR _temp$[ebp], ecx
; Line 90
	mov	ecx, DWORD PTR _temp$[ebp]
	sub	ecx, 8
	mov	DWORD PTR _Size$[ebp], ecx
; Line 93
	mov	edx, DWORD PTR _currenttask$[ebp]
	push	edx
	mov	ax, WORD PTR _DestPort$[ebp]
	push	eax
	mov	ecx, DWORD PTR _TargetIP$[ebp]
	push	ecx
	mov	edx, DWORD PTR _Size$[ebp]
	push	edx
	mov	eax, DWORD PTR _UDPPack$[ebp]
	add	eax, 8
	push	eax
	lea	ecx, DWORD PTR _ftp$[ebp]
	call	?FtpHandler@FTPObj@@QAEHPADJ0GH@Z	; FTPObj::FtpHandler
	mov	DWORD PTR _retcode$[ebp], eax
; Line 95
	mov	eax, DWORD PTR _retcode$[ebp]
$L1655:
; Line 96
	mov	esp, ebp
	pop	ebp
	ret	24					; 00000018H
?UDPHandler@UDPObj@@QAEHPADH00HH@Z ENDP			; UDPObj::UDPHandler
_TEXT	ENDS
PUBLIC	??0UDPObj@@QAE@XZ				; UDPObj::UDPObj
;	COMDAT ??0FTPObj@@QAE@XZ
_TEXT	SEGMENT
_this$ = -4
??0FTPObj@@QAE@XZ PROC NEAR				; FTPObj::FTPObj, COMDAT
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	??0AOAProtected@@QAE@XZ			; AOAProtected::AOAProtected
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 12					; 0000000cH
	call	??0UDPObj@@QAE@XZ			; UDPObj::UDPObj
	mov	eax, DWORD PTR _this$[ebp]
	mov	esp, ebp
	pop	ebp
	ret	0
??0FTPObj@@QAE@XZ ENDP					; FTPObj::FTPObj
_TEXT	ENDS
EXTRN	??0IPObj@@QAE@XZ:NEAR				; IPObj::IPObj
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
END
