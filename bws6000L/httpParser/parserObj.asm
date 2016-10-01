	TITLE	parserObj.cpp
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
;	COMDAT ??0FTPObj@@QAE@XZ
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT ??0UDPObj@@QAE@XZ
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
FLAT	GROUP _DATA, CONST, _BSS
	ASSUME	CS: FLAT, DS: FLAT, SS: FLAT
endif
PUBLIC	?httpHeader@@3PADA				; httpHeader
PUBLIC	?contentType@@3PADA				; contentType
PUBLIC	?defaultFile@@3PADA				; defaultFile
PUBLIC	?acceptRange@@3PADA				; acceptRange
CONST	SEGMENT
_pageFound DB	'200 OK', 00H
	ORG $+1
_OK	DB	'200 OK', 00H
CONST	ENDS
_DATA	SEGMENT
?httpHeader@@3PADA DB 'HTTP/1.1 ', 00H			; httpHeader
	ORG $+2
?contentType@@3PADA DB 'Content-Type: text/html;', 00H	; contentType
	ORG $+20
	ORG $+3
?defaultFile@@3PADA DB '/index.htm', 00H		; defaultFile
	ORG $+1
?acceptRange@@3PADA DB 'Accept-Ranges: bytes', 00H	; acceptRange
	ORG $+4
_DATA	ENDS
PUBLIC	?processRequest@parserObj@@QAEHHH@Z		; parserObj::processRequest
PUBLIC	?methodGET@parserObj@@AAEHPADHH@Z		; parserObj::methodGET
PUBLIC	??0TCPObj@@QAE@XZ				; TCPObj::TCPObj
EXTRN	?Application_Status@AOAProtected@@2HA:DWORD	; AOAProtected::Application_Status
EXTRN	?AOAprintHex@AOAProtected@@QAEHJH@Z:NEAR	; AOAProtected::AOAprintHex
EXTRN	?AOAExit@AOAProtected@@QAEXXZ:NEAR		; AOAProtected::AOAExit
EXTRN	?AOAPrintText@AOAProtected@@QAEXPADH@Z:NEAR	; AOAProtected::AOAPrintText
EXTRN	?getMsgPtr@TCPObj@@QAEPADHPAH@Z:NEAR		; TCPObj::getMsgPtr
_DATA	SEGMENT
	ORG $+3
$SG2459	DB	' eroor in parserobj', 00H
_DATA	ENDS
_TEXT	SEGMENT
_currenttcbrno$ = 8
_currenttask$ = 12
_this$ = -380
_tcp$ = -376
_retcode$ = -4
_requestMsg$ = -8
_c1$ = -12
_len$ = -20
_i$ = -16
?processRequest@parserObj@@QAEHHH@Z PROC NEAR		; parserObj::processRequest
; File parserObj.cpp
; Line 50
	push	ebp
	mov	ebp, esp
	sub	esp, 380				; 0000017cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 51
	lea	ecx, DWORD PTR _tcp$[ebp]
	call	??0TCPObj@@QAE@XZ			; TCPObj::TCPObj
; Line 52
	mov	DWORD PTR _retcode$[ebp], 0
; Line 55
	mov	DWORD PTR _i$[ebp], 0
; Line 56
	lea	eax, DWORD PTR _c1$[ebp]
	mov	DWORD PTR _requestMsg$[ebp], eax
; Line 58
	lea	ecx, DWORD PTR _len$[ebp]
	push	ecx
	mov	edx, DWORD PTR _currenttcbrno$[ebp]
	push	edx
	lea	ecx, DWORD PTR _tcp$[ebp]
	call	?getMsgPtr@TCPObj@@QAEPADHPAH@Z		; TCPObj::getMsgPtr
	mov	DWORD PTR _requestMsg$[ebp], eax
; Line 64
	mov	eax, DWORD PTR _requestMsg$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	jne	SHORT $L2450
; Line 66
	push	3380					; 00000d34H
	mov	edx, DWORD PTR _requestMsg$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 67
	mov	DWORD PTR ?Application_Status@AOAProtected@@2HA, 2 ; AOAProtected::Application_Status
; Line 68
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAExit@AOAProtected@@QAEXXZ		; AOAProtected::AOAExit
; Line 69
	or	eax, -1
	jmp	$L2442
$L2450:
; Line 73
	mov	eax, DWORD PTR _requestMsg$[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 71					; 00000047H
	jne	SHORT $L2452
	mov	edx, DWORD PTR _requestMsg$[ebp]
	movsx	eax, BYTE PTR [edx+1]
	cmp	eax, 69					; 00000045H
	jne	SHORT $L2452
	mov	ecx, DWORD PTR _requestMsg$[ebp]
	movsx	edx, BYTE PTR [ecx+2]
	cmp	edx, 84					; 00000054H
	jne	SHORT $L2452
	mov	eax, DWORD PTR _requestMsg$[ebp]
	movsx	ecx, BYTE PTR [eax+3]
	cmp	ecx, 32					; 00000020H
	jne	SHORT $L2452
; Line 77
	mov	edx, DWORD PTR _currenttask$[ebp]
	push	edx
	mov	eax, DWORD PTR _currenttcbrno$[ebp]
	push	eax
	mov	ecx, DWORD PTR _requestMsg$[ebp]
	add	ecx, 4
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?methodGET@parserObj@@AAEHPADHH@Z	; parserObj::methodGET
	mov	DWORD PTR _retcode$[ebp], eax
; Line 79
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L2442
$L2452:
; Line 81
	mov	edx, DWORD PTR _requestMsg$[ebp]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, 80					; 00000050H
	jne	SHORT $L2454
	mov	ecx, DWORD PTR _requestMsg$[ebp]
	movsx	edx, BYTE PTR [ecx+1]
	cmp	edx, 79					; 0000004fH
	jne	SHORT $L2454
	mov	eax, DWORD PTR _requestMsg$[ebp]
	movsx	ecx, BYTE PTR [eax+2]
	cmp	ecx, 83					; 00000053H
	jne	SHORT $L2454
	mov	edx, DWORD PTR _requestMsg$[ebp]
	movsx	eax, BYTE PTR [edx+3]
	cmp	eax, 84					; 00000054H
	jne	SHORT $L2454
; Line 88
	mov	eax, -2					; fffffffeH
	jmp	SHORT $L2442
$L2454:
; Line 91
	mov	ecx, DWORD PTR _requestMsg$[ebp]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, 72					; 00000048H
	jne	SHORT $L2456
	mov	eax, DWORD PTR _requestMsg$[ebp]
	movsx	ecx, BYTE PTR [eax+1]
	cmp	ecx, 69					; 00000045H
	jne	SHORT $L2456
	mov	edx, DWORD PTR _requestMsg$[ebp]
	movsx	eax, BYTE PTR [edx+2]
	cmp	eax, 65					; 00000041H
	jne	SHORT $L2456
	mov	ecx, DWORD PTR _requestMsg$[ebp]
	movsx	edx, BYTE PTR [ecx+3]
	cmp	edx, 68					; 00000044H
	jne	SHORT $L2456
; Line 97
	mov	eax, -3					; fffffffdH
	jmp	SHORT $L2442
$L2456:
; Line 103
	push	980					; 000003d4H
	mov	eax, DWORD PTR _requestMsg$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 104
	push	1140					; 00000474H
	push	OFFSET FLAT:$SG2459
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 105
	mov	DWORD PTR ?Application_Status@AOAProtected@@2HA, 2 ; AOAProtected::Application_Status
; Line 106
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAExit@AOAProtected@@QAEXXZ		; AOAProtected::AOAExit
; Line 107
	mov	eax, -4					; fffffffcH
$L2442:
; Line 111
	mov	esp, ebp
	pop	ebp
	ret	8
?processRequest@parserObj@@QAEHHH@Z ENDP		; parserObj::processRequest
_TEXT	ENDS
PUBLIC	??0HTTPList@@QAE@XZ				; HTTPList::HTTPList
PUBLIC	??0WList@@QAE@XZ				; WList::WList
PUBLIC	??0WTTrace@@QAE@XZ				; WTTrace::WTTrace
PUBLIC	??0TcphashIndex@@QAE@XZ				; TcphashIndex::TcphashIndex
EXTRN	??0ARPObj@@QAE@XZ:NEAR				; ARPObj::ARPObj
EXTRN	??0IPObj@@QAE@XZ:NEAR				; IPObj::IPObj
EXTRN	??0AOAProtected@@QAE@XZ:NEAR			; AOAProtected::AOAProtected
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
PUBLIC	?strcpy@parserObj@@AAEPADPAD0@Z			; parserObj::strcpy
PUBLIC	?strcat@parserObj@@AAEXPAD0@Z			; parserObj::strcat
PUBLIC	?sstrlen@parserObj@@AAEHPAD@Z			; parserObj::sstrlen
PUBLIC	?checkVersion@parserObj@@AAEHPAD@Z		; parserObj::checkVersion
PUBLIC	?createResponse@parserObj@@AAEHPAD00PAJPAK2@Z	; parserObj::createResponse
EXTRN	?AOAStrLen@AOAProtected@@QAEHPAD@Z:NEAR		; AOAProtected::AOAStrLen
EXTRN	?tcpSendN@TCPObj@@QAEHHH@Z:NEAR			; TCPObj::tcpSendN
EXTRN	?setFileParam@TCPObj@@QAEHHPADJKJH@Z:NEAR	; TCPObj::setFileParam
EXTRN	?storeTraceDword@TCPObj@@QAEHHHH@Z:NEAR		; TCPObj::storeTraceDword
EXTRN	??0AOATask@@QAE@XZ:NEAR				; AOATask::AOATask
_TEXT	SEGMENT
_requestMsg$ = 8
_currenttcbrno$ = 12
_currenttask$ = 16
_this$ = -1532
_task$ = -1080
_tcp$ = -1440
_i$ = -1028
_j$ = -1032
_k$ = -1084
_resourceName$ = -1528
_responseHeader$ = -1012
_HeaderSize$ = -8
_FileSize$ = -1020
_FileStartAddress$ = -1016
_fileNameSize$ = -12
_fileCheck$ = -1444
_cType$ = -1024
_retcode$ = -4
?methodGET@parserObj@@AAEHPADHH@Z PROC NEAR		; parserObj::methodGET
; Line 118
	push	ebp
	mov	ebp, esp
	sub	esp, 1532				; 000005fcH
	mov	DWORD PTR _this$[ebp], ecx
; Line 119
	lea	ecx, DWORD PTR _task$[ebp]
	call	??0AOATask@@QAE@XZ			; AOATask::AOATask
; Line 121
	lea	ecx, DWORD PTR _tcp$[ebp]
	call	??0TCPObj@@QAE@XZ			; TCPObj::TCPObj
; Line 124
	mov	DWORD PTR _i$[ebp], 0
	mov	DWORD PTR _j$[ebp], 0
	mov	DWORD PTR _k$[ebp], 0
; Line 133
	mov	DWORD PTR _HeaderSize$[ebp], 0
; Line 135
	mov	DWORD PTR _FileSize$[ebp], 0
; Line 138
	mov	DWORD PTR _FileStartAddress$[ebp], 0
; Line 141
	mov	DWORD PTR _fileNameSize$[ebp], 0
; Line 144
	mov	DWORD PTR _fileCheck$[ebp], 0
; Line 149
	mov	DWORD PTR _retcode$[ebp], 0
; Line 152
	mov	BYTE PTR _responseHeader$[ebp], 0
; Line 155
	mov	eax, DWORD PTR _requestMsg$[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 47					; 0000002fH
	je	SHORT $L2490
; Line 158
	push	3220					; 00000c94H
	mov	edx, DWORD PTR _requestMsg$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 159
	mov	eax, -3					; fffffffdH
	jmp	$L2475
$L2490:
; Line 163
	mov	DWORD PTR _i$[ebp], 1
$L2493:
; Line 165
	mov	eax, DWORD PTR _requestMsg$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 32					; 00000020H
	je	SHORT $L2494
; Line 167
	mov	edx, DWORD PTR _requestMsg$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	mov	cl, BYTE PTR [edx]
	mov	BYTE PTR _resourceName$[ebp+eax-1], cl
; Line 168
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
; Line 169
	jmp	SHORT $L2493
$L2494:
; Line 171
	cmp	DWORD PTR _i$[ebp], 1
	jne	SHORT $L2495
; Line 174
	push	OFFSET FLAT:?defaultFile@@3PADA+1
	lea	eax, DWORD PTR _resourceName$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcpy@parserObj@@AAEPADPAD0@Z		; parserObj::strcpy
; Line 176
	jmp	SHORT $L2497
$L2495:
; Line 181
	mov	ecx, DWORD PTR _i$[ebp]
	mov	BYTE PTR _resourceName$[ebp+ecx-1], 0
$L2497:
; Line 184
	mov	edx, DWORD PTR _requestMsg$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?checkVersion@parserObj@@AAEHPAD@Z	; parserObj::checkVersion
	mov	DWORD PTR _retcode$[ebp], eax
; Line 185
	cmp	DWORD PTR _retcode$[ebp], 0
	jne	$L2498
; Line 187
	lea	eax, DWORD PTR _resourceName$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAStrLen@AOAProtected@@QAEHPAD@Z	; AOAProtected::AOAStrLen
	mov	DWORD PTR _fileNameSize$[ebp], eax
; Line 193
	cmp	DWORD PTR _fileNameSize$[ebp], 80	; 00000050H
	jle	SHORT $L2499
; Line 195
	mov	BYTE PTR _resourceName$[ebp+79], 0
$L2499:
; Line 197
	mov	DWORD PTR _j$[ebp], 0
; Line 200
	mov	DWORD PTR _fileCheck$[ebp], 0
$L2501:
; Line 201
	mov	ecx, DWORD PTR _j$[ebp]
	movsx	edx, BYTE PTR _resourceName$[ebp+ecx]
	test	edx, edx
	je	$L2502
	cmp	DWORD PTR _j$[ebp], 80			; 00000050H
	jge	$L2502
; Line 203
	mov	eax, DWORD PTR _j$[ebp]
	movsx	ecx, BYTE PTR _resourceName$[ebp+eax]
	cmp	ecx, 46					; 0000002eH
	jne	SHORT $L2503
; Line 206
	mov	DWORD PTR _fileCheck$[ebp], 1
; Line 207
	mov	DWORD PTR _k$[ebp], 0
$L2505:
; Line 208
	mov	edx, DWORD PTR _j$[ebp]
	movsx	eax, BYTE PTR _resourceName$[ebp+edx]
	test	eax, eax
	je	SHORT $L2506
	cmp	DWORD PTR _j$[ebp], 80			; 00000050H
	jge	SHORT $L2506
; Line 210
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
	mov	edx, DWORD PTR _k$[ebp]
	mov	eax, DWORD PTR _j$[ebp]
	mov	cl, BYTE PTR _resourceName$[ebp+eax]
	mov	BYTE PTR _cType$[ebp+edx], cl
; Line 211
	mov	edx, DWORD PTR _k$[ebp]
	add	edx, 1
	mov	DWORD PTR _k$[ebp], edx
; Line 212
	jmp	SHORT $L2505
$L2506:
; Line 214
	mov	eax, DWORD PTR _k$[ebp]
	mov	BYTE PTR _cType$[ebp+eax], 0
; Line 215
	jmp	SHORT $L2502
$L2503:
; Line 218
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
; Line 219
	jmp	$L2501
$L2502:
; Line 220
	cmp	DWORD PTR _fileCheck$[ebp], 0
	jne	SHORT $L2509
; Line 223
	push	OFFSET FLAT:?defaultFile@@3PADA
	mov	ecx, DWORD PTR _this$[ebp]
	call	?sstrlen@parserObj@@AAEHPAD@Z		; parserObj::sstrlen
	mov	edx, 80					; 00000050H
	sub	edx, eax
	cmp	DWORD PTR _fileNameSize$[ebp], edx
	jle	SHORT $L2508
; Line 225
	mov	eax, DWORD PTR _fileNameSize$[ebp]
	mov	BYTE PTR _resourceName$[ebp+eax], 0
; Line 227
	jmp	SHORT $L2509
$L2508:
; Line 229
	push	OFFSET FLAT:?defaultFile@@3PADA
	lea	ecx, DWORD PTR _resourceName$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
$L2509:
; Line 234
	lea	edx, DWORD PTR _FileSize$[ebp]
	push	edx
	lea	eax, DWORD PTR _FileStartAddress$[ebp]
	push	eax
	lea	ecx, DWORD PTR _HeaderSize$[ebp]
	push	ecx
	lea	edx, DWORD PTR _responseHeader$[ebp]
	push	edx
	lea	eax, DWORD PTR _cType$[ebp]
	push	eax
	lea	ecx, DWORD PTR _resourceName$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?createResponse@parserObj@@AAEHPAD00PAJPAK2@Z ; parserObj::createResponse
	mov	DWORD PTR _retcode$[ebp], eax
; Line 237
	mov	edx, DWORD PTR _currenttask$[ebp]
	push	edx
	mov	eax, DWORD PTR _FileSize$[ebp]
	push	eax
	mov	ecx, DWORD PTR _FileStartAddress$[ebp]
	push	ecx
	mov	edx, DWORD PTR _HeaderSize$[ebp]
	push	edx
	lea	eax, DWORD PTR _responseHeader$[ebp]
	push	eax
	mov	ecx, DWORD PTR _currenttcbrno$[ebp]
	push	ecx
	lea	ecx, DWORD PTR _tcp$[ebp]
	call	?setFileParam@TCPObj@@QAEHHPADJKJH@Z	; TCPObj::setFileParam
	mov	DWORD PTR _retcode$[ebp], eax
; Line 238
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L2511
; Line 239
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	SHORT $L2475
$L2511:
; Line 243
	mov	edx, DWORD PTR _currenttask$[ebp]
	push	edx
	mov	eax, DWORD PTR _currenttcbrno$[ebp]
	push	eax
	lea	ecx, DWORD PTR _tcp$[ebp]
	call	?tcpSendN@TCPObj@@QAEHHH@Z		; TCPObj::tcpSendN
	mov	DWORD PTR _retcode$[ebp], eax
; Line 244
	mov	ecx, 1
	test	ecx, ecx
	je	SHORT $L2512
; Line 245
	push	6
	mov	edx, DWORD PTR _currenttcbrno$[ebp]
	push	edx
	mov	eax, DWORD PTR _retcode$[ebp]
	push	eax
	lea	ecx, DWORD PTR _tcp$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
$L2512:
; Line 248
	mov	BYTE PTR _responseHeader$[ebp], 0
; Line 250
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	SHORT $L2475
$L2498:
; Line 256
	mov	eax, DWORD PTR _retcode$[ebp]
$L2475:
; Line 259
	mov	esp, ebp
	pop	ebp
	ret	12					; 0000000cH
?methodGET@parserObj@@AAEHPADHH@Z ENDP			; parserObj::methodGET
_TEXT	ENDS
PUBLIC	?checkLineBreak@parserObj@@AAEHPAD@Z		; parserObj::checkLineBreak
_TEXT	SEGMENT
_requestMsg$ = 8
_this$ = -8
_retcode$ = -4
?checkVersion@parserObj@@AAEHPAD@Z PROC NEAR		; parserObj::checkVersion
; Line 264
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 265
	mov	DWORD PTR _retcode$[ebp], 0
; Line 266
	mov	eax, DWORD PTR _requestMsg$[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 32					; 00000020H
	je	SHORT $L2519
; Line 268
	mov	eax, -4					; fffffffcH
	jmp	$L2517
$L2519:
; Line 279
	mov	edx, DWORD PTR _requestMsg$[ebp]
	movsx	eax, BYTE PTR [edx+1]
	cmp	eax, 72					; 00000048H
	jne	$L2520
	mov	ecx, DWORD PTR _requestMsg$[ebp]
	movsx	edx, BYTE PTR [ecx+2]
	cmp	edx, 84					; 00000054H
	jne	SHORT $L2520
	mov	eax, DWORD PTR _requestMsg$[ebp]
	movsx	ecx, BYTE PTR [eax+3]
	cmp	ecx, 84					; 00000054H
	jne	SHORT $L2520
	mov	edx, DWORD PTR _requestMsg$[ebp]
	movsx	eax, BYTE PTR [edx+4]
	cmp	eax, 80					; 00000050H
	jne	SHORT $L2520
	mov	ecx, DWORD PTR _requestMsg$[ebp]
	movsx	edx, BYTE PTR [ecx+5]
	cmp	edx, 47					; 0000002fH
	jne	SHORT $L2520
	mov	eax, DWORD PTR _requestMsg$[ebp]
	movsx	ecx, BYTE PTR [eax+6]
	cmp	ecx, 49					; 00000031H
	jne	SHORT $L2520
	mov	edx, DWORD PTR _requestMsg$[ebp]
	movsx	eax, BYTE PTR [edx+7]
	cmp	eax, 46					; 0000002eH
	jne	SHORT $L2520
	mov	ecx, DWORD PTR _requestMsg$[ebp]
	movsx	edx, BYTE PTR [ecx+8]
	cmp	edx, 48					; 00000030H
	je	SHORT $L2521
	mov	eax, DWORD PTR _requestMsg$[ebp]
	movsx	ecx, BYTE PTR [eax+8]
	cmp	ecx, 49					; 00000031H
	jne	SHORT $L2520
$L2521:
; Line 281
	mov	edx, DWORD PTR _requestMsg$[ebp]
	add	edx, 9
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?checkLineBreak@parserObj@@AAEHPAD@Z	; parserObj::checkLineBreak
	mov	DWORD PTR _retcode$[ebp], eax
; Line 282
	cmp	DWORD PTR _retcode$[ebp], 0
	jne	SHORT $L2522
; Line 284
	xor	eax, eax
	jmp	SHORT $L2517
$L2522:
; Line 289
	mov	eax, -5					; fffffffbH
	jmp	SHORT $L2517
$L2520:
; Line 295
	mov	eax, -6					; fffffffaH
$L2517:
; Line 298
	mov	esp, ebp
	pop	ebp
	ret	4
?checkVersion@parserObj@@AAEHPAD@Z ENDP			; parserObj::checkVersion
_requestMsg$ = 8
_this$ = -4
?checkLineBreak@parserObj@@AAEHPAD@Z PROC NEAR		; parserObj::checkLineBreak
; Line 306
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 307
	mov	eax, DWORD PTR _requestMsg$[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 13					; 0000000dH
	jne	SHORT $L2529
	mov	edx, DWORD PTR _requestMsg$[ebp]
	movsx	eax, BYTE PTR [edx+1]
	cmp	eax, 10					; 0000000aH
	jne	SHORT $L2529
; Line 308
	xor	eax, eax
	jmp	SHORT $L2530
$L2529:
; Line 310
	or	eax, -1
$L2530:
; Line 311
	mov	esp, ebp
	pop	ebp
	ret	4
?checkLineBreak@parserObj@@AAEHPAD@Z ENDP		; parserObj::checkLineBreak
_TEXT	ENDS
PUBLIC	?copyTraceHtml@parserObj@@AAEHKKK@Z		; parserObj::copyTraceHtml
PUBLIC	?longToStr@parserObj@@AAEHPAKPAD@Z		; parserObj::longToStr
PUBLIC	??0FTPObj@@QAE@XZ				; FTPObj::FTPObj
EXTRN	?getFile@FTPObj@@QAEHPADPAK1@Z:NEAR		; FTPObj::getFile
EXTRN	?AOAStrLenAll@AOAProtected@@QAEHPAD@Z:NEAR	; AOAProtected::AOAStrLenAll
EXTRN	?AOAconvertChar4ToLong@AOAProtected@@QAEKPAD@Z:NEAR ; AOAProtected::AOAconvertChar4ToLong
_BSS	SEGMENT
$SG2561	DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG2542	DB	'Transfer-Encoding: chunked', 00H
	ORG $+1
$SG2544	DB	'Content-Length: ', 00H
	ORG $+3
$SG2546	DB	';charset=iso-8859-1', 00H
$SG2548	DB	'Server: DOSC Web Server Ver: 1.0', 00H
	ORG $+3
$SG2550	DB	'Connection: close', 00H
	ORG $+2
$SG2566	DB	'debugxx.html', 00H
	ORG $+3
$SG2578	DB	'Content-Type: image/bmp', 00H
$SG2585	DB	'Content-Type: image/png', 00H
$SG2592	DB	'Content-Type: image/gif', 00H
$SG2599	DB	'Content-Type: image/jpeg', 00H
	ORG $+3
$SG2606	DB	'Content-Type: application/msword', 00H
	ORG $+3
$SG2613	DB	'Content-Type: application/pdf', 00H
	ORG $+2
$SG2620	DB	'Content-Type: text/plain', 00H
	ORG $+3
$SG2623	DB	'Content-Type: text/html', 00H
$SG2626	DB	'pagenotfound.html', 00H
	ORG $+2
$SG2627	DB	'Content-Type: text/html', 00H
_DATA	ENDS
_TEXT	SEGMENT
_resourceName$ = 8
_cType$ = 12
_responseHeader$ = 16
_headerSize$ = 20
_fileStartAdress$ = 24
_fileSize$ = 28
_this$ = -504
_h1$ = -344
_TEncoding$ = -476
_contentLength$ = -384
_encoding$ = -448
_Server$ = -428
_conn$ = -500
_statusCode$ = -444
_debugs$ = -356
_debugindex$ = -436
_httpfile$ = -480
_httpfsize$ = -392
_faddr$ = -432
_httpptr$ = -388
_httpptr1$ = -8
_i$ = -348
_fileSizeStr$ = -20
_lineBreak$ = -440
_retcode$ = -4
_tempsize$ = -24
?createResponse@parserObj@@AAEHPAD00PAJPAK2@Z PROC NEAR	; parserObj::createResponse
; Line 316
	push	ebp
	mov	ebp, esp
	sub	esp, 504				; 000001f8H
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 317
	lea	ecx, DWORD PTR _h1$[ebp]
	call	??0FTPObj@@QAE@XZ			; FTPObj::FTPObj
; Line 319
	mov	ecx, 6
	mov	esi, OFFSET FLAT:$SG2542
	lea	edi, DWORD PTR _TEncoding$[ebp]
	rep movsd
	movsw
	movsb
; Line 320
	mov	eax, DWORD PTR $SG2544
	mov	DWORD PTR _contentLength$[ebp], eax
	mov	ecx, DWORD PTR $SG2544+4
	mov	DWORD PTR _contentLength$[ebp+4], ecx
	mov	edx, DWORD PTR $SG2544+8
	mov	DWORD PTR _contentLength$[ebp+8], edx
	mov	eax, DWORD PTR $SG2544+12
	mov	DWORD PTR _contentLength$[ebp+12], eax
	mov	cl, BYTE PTR $SG2544+16
	mov	BYTE PTR _contentLength$[ebp+16], cl
	xor	edx, edx
	mov	DWORD PTR _contentLength$[ebp+17], edx
	mov	DWORD PTR _contentLength$[ebp+21], edx
	mov	WORD PTR _contentLength$[ebp+25], dx
	mov	BYTE PTR _contentLength$[ebp+27], dl
; Line 321
	mov	DWORD PTR _encoding$[ebp], OFFSET FLAT:$SG2546
; Line 322
	mov	ecx, 8
	mov	esi, OFFSET FLAT:$SG2548
	lea	edi, DWORD PTR _Server$[ebp]
	rep movsd
	movsb
; Line 323
	mov	eax, DWORD PTR $SG2550
	mov	DWORD PTR _conn$[ebp], eax
	mov	ecx, DWORD PTR $SG2550+4
	mov	DWORD PTR _conn$[ebp+4], ecx
	mov	edx, DWORD PTR $SG2550+8
	mov	DWORD PTR _conn$[ebp+8], edx
	mov	eax, DWORD PTR $SG2550+12
	mov	DWORD PTR _conn$[ebp+12], eax
	mov	cx, WORD PTR $SG2550+16
	mov	WORD PTR _conn$[ebp+16], cx
	xor	edx, edx
	mov	WORD PTR _conn$[ebp+18], dx
; Line 326
	mov	DWORD PTR _debugindex$[ebp], 0
; Line 332
	mov	DWORD PTR _i$[ebp], 0
; Line 334
	mov	al, BYTE PTR $SG2561
	mov	BYTE PTR _fileSizeStr$[ebp], al
	xor	ecx, ecx
	mov	DWORD PTR _fileSizeStr$[ebp+1], ecx
	mov	DWORD PTR _fileSizeStr$[ebp+5], ecx
	mov	BYTE PTR _fileSizeStr$[ebp+9], cl
; Line 336
	mov	BYTE PTR _lineBreak$[ebp], 13		; 0000000dH
; Line 337
	mov	BYTE PTR _lineBreak$[ebp+1], 10		; 0000000aH
; Line 338
	mov	BYTE PTR _lineBreak$[ebp+2], 0
; Line 340
	mov	DWORD PTR _retcode$[ebp], 0
; Line 341
	mov	DWORD PTR _tempsize$[ebp], 0
; Line 344
	push	OFFSET FLAT:?httpHeader@@3PADA		; httpHeader
	mov	edx, DWORD PTR _responseHeader$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcpy@parserObj@@AAEPADPAD0@Z		; parserObj::strcpy
; Line 347
	mov	eax, DWORD PTR _resourceName$[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 100				; 00000064H
	jne	$L2565
	mov	edx, DWORD PTR _resourceName$[ebp]
	movsx	eax, BYTE PTR [edx+1]
	cmp	eax, 101				; 00000065H
	jne	$L2565
	mov	ecx, DWORD PTR _resourceName$[ebp]
	movsx	edx, BYTE PTR [ecx+2]
	cmp	edx, 98					; 00000062H
	jne	$L2565
	mov	eax, DWORD PTR _resourceName$[ebp]
	movsx	ecx, BYTE PTR [eax+3]
	cmp	ecx, 117				; 00000075H
	jne	$L2565
	mov	edx, DWORD PTR _resourceName$[ebp]
	movsx	eax, BYTE PTR [edx+4]
	cmp	eax, 103				; 00000067H
	jne	$L2565
	mov	ecx, DWORD PTR _resourceName$[ebp]
	movsx	edx, BYTE PTR [ecx+7]
	cmp	edx, 46					; 0000002eH
	jne	$L2565
	mov	eax, DWORD PTR _resourceName$[ebp]
	movsx	ecx, BYTE PTR [eax+8]
	cmp	ecx, 104				; 00000068H
	jne	$L2565
	mov	edx, DWORD PTR _resourceName$[ebp]
	movsx	eax, BYTE PTR [edx+9]
	cmp	eax, 116				; 00000074H
	jne	$L2565
	mov	ecx, DWORD PTR _resourceName$[ebp]
	movsx	edx, BYTE PTR [ecx+10]
	cmp	edx, 109				; 0000006dH
	jne	$L2565
; Line 349
	mov	BYTE PTR _debugs$[ebp], 48		; 00000030H
; Line 350
	mov	BYTE PTR _debugs$[ebp+1], 48		; 00000030H
; Line 351
	mov	eax, DWORD PTR _resourceName$[ebp]
	mov	cl, BYTE PTR [eax+5]
	mov	BYTE PTR _debugs$[ebp+2], cl
; Line 352
	mov	edx, DWORD PTR _resourceName$[ebp]
	mov	al, BYTE PTR [edx+6]
	mov	BYTE PTR _debugs$[ebp+3], al
; Line 353
	mov	BYTE PTR _debugs$[ebp+4], 0
; Line 354
	lea	ecx, DWORD PTR _debugs$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAconvertChar4ToLong@AOAProtected@@QAEKPAD@Z ; AOAProtected::AOAconvertChar4ToLong
	mov	DWORD PTR _debugindex$[ebp], eax
; Line 356
	lea	edx, DWORD PTR _httpfsize$[ebp]
	push	edx
	lea	eax, DWORD PTR _httpfile$[ebp]
	push	eax
	push	OFFSET FLAT:$SG2566
	lea	ecx, DWORD PTR _h1$[ebp]
	call	?getFile@FTPObj@@QAEHPADPAK1@Z		; FTPObj::getFile
	mov	DWORD PTR _retcode$[ebp], eax
; Line 364
	mov	DWORD PTR _httpptr$[ebp], 208601088	; 0c6f0000H
; Line 365
	mov	ecx, DWORD PTR _httpfile$[ebp]
	mov	DWORD PTR _httpptr1$[ebp], ecx
; Line 366
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L2569
$L2570:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L2569:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _httpfsize$[ebp]
	jae	SHORT $L2571
; Line 367
	mov	ecx, DWORD PTR _httpptr1$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _httpptr$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	mov	al, BYTE PTR [edx]
	mov	BYTE PTR [ecx], al
	jmp	SHORT $L2570
$L2571:
; Line 370
	mov	ecx, DWORD PTR _debugindex$[ebp]
	shl	ecx, 9
	add	ecx, 166658048				; 09ef0000H
	mov	DWORD PTR _faddr$[ebp], ecx
; Line 371
	mov	edx, DWORD PTR _httpfsize$[ebp]
	push	edx
	mov	eax, DWORD PTR _httpfile$[ebp]
	push	eax
	mov	ecx, DWORD PTR _faddr$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?copyTraceHtml@parserObj@@AAEHKKK@Z	; parserObj::copyTraceHtml
	mov	DWORD PTR _retcode$[ebp], eax
; Line 372
	mov	edx, DWORD PTR _fileStartAdress$[ebp]
	mov	eax, DWORD PTR _httpfile$[ebp]
	mov	DWORD PTR [edx], eax
; Line 373
	mov	ecx, DWORD PTR _fileSize$[ebp]
	mov	edx, DWORD PTR _httpfsize$[ebp]
	mov	DWORD PTR [ecx], edx
; Line 376
	jmp	SHORT $L2572
$L2565:
; Line 377
	mov	eax, DWORD PTR _fileSize$[ebp]
	push	eax
	mov	ecx, DWORD PTR _fileStartAdress$[ebp]
	push	ecx
	mov	edx, DWORD PTR _resourceName$[ebp]
	push	edx
	lea	ecx, DWORD PTR _h1$[ebp]
	call	?getFile@FTPObj@@QAEHPADPAK1@Z		; FTPObj::getFile
	mov	DWORD PTR _retcode$[ebp], eax
$L2572:
; Line 379
	cmp	DWORD PTR _retcode$[ebp], 0
	jne	$L2573
; Line 381
	mov	eax, DWORD PTR _cType$[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 98					; 00000062H
	je	SHORT $L2575
	mov	edx, DWORD PTR _cType$[ebp]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, 66					; 00000042H
	jne	$L2574
$L2575:
	mov	ecx, DWORD PTR _cType$[ebp]
	movsx	edx, BYTE PTR [ecx+1]
	cmp	edx, 109				; 0000006dH
	je	SHORT $L2576
	mov	eax, DWORD PTR _cType$[ebp]
	movsx	ecx, BYTE PTR [eax+1]
	cmp	ecx, 77					; 0000004dH
	jne	$L2574
$L2576:
	mov	edx, DWORD PTR _cType$[ebp]
	movsx	eax, BYTE PTR [edx+2]
	cmp	eax, 112				; 00000070H
	je	SHORT $L2577
	mov	ecx, DWORD PTR _cType$[ebp]
	movsx	edx, BYTE PTR [ecx+2]
	cmp	edx, 80					; 00000050H
	jne	$L2574
$L2577:
; Line 384
	lea	eax, DWORD PTR _fileSizeStr$[ebp]
	push	eax
	mov	ecx, DWORD PTR _fileSize$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?longToStr@parserObj@@AAEHPAKPAD@Z	; parserObj::longToStr
; Line 385
	push	OFFSET FLAT:$SG2578
	push	OFFSET FLAT:?contentType@@3PADA		; contentType
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcpy@parserObj@@AAEPADPAD0@Z		; parserObj::strcpy
; Line 386
	mov	DWORD PTR _statusCode$[ebp], OFFSET FLAT:_OK
; Line 387
	mov	edx, DWORD PTR _statusCode$[ebp]
	push	edx
	mov	eax, DWORD PTR _responseHeader$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 388
	lea	ecx, DWORD PTR _lineBreak$[ebp]
	push	ecx
	mov	edx, DWORD PTR _responseHeader$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 391
	lea	eax, DWORD PTR _conn$[ebp]
	push	eax
	mov	ecx, DWORD PTR _responseHeader$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 392
	lea	edx, DWORD PTR _lineBreak$[ebp]
	push	edx
	mov	eax, DWORD PTR _responseHeader$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 393
	push	OFFSET FLAT:?contentType@@3PADA		; contentType
	mov	ecx, DWORD PTR _responseHeader$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 394
	lea	edx, DWORD PTR _lineBreak$[ebp]
	push	edx
	mov	eax, DWORD PTR _responseHeader$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 395
	lea	ecx, DWORD PTR _fileSizeStr$[ebp]
	push	ecx
	lea	edx, DWORD PTR _contentLength$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 396
	lea	eax, DWORD PTR _contentLength$[ebp]
	push	eax
	mov	ecx, DWORD PTR _responseHeader$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 397
	mov	BYTE PTR _contentLength$[ebp+16], 0
; Line 398
	lea	edx, DWORD PTR _lineBreak$[ebp]
	push	edx
	mov	eax, DWORD PTR _responseHeader$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 399
	push	OFFSET FLAT:?acceptRange@@3PADA		; acceptRange
	mov	ecx, DWORD PTR _responseHeader$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 400
	lea	edx, DWORD PTR _lineBreak$[ebp]
	push	edx
	mov	eax, DWORD PTR _responseHeader$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 401
	lea	ecx, DWORD PTR _lineBreak$[ebp]
	push	ecx
	mov	edx, DWORD PTR _responseHeader$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 403
	jmp	$L2622
$L2574:
	mov	eax, DWORD PTR _cType$[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 112				; 00000070H
	je	SHORT $L2582
	mov	edx, DWORD PTR _cType$[ebp]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, 80					; 00000050H
	jne	$L2581
$L2582:
	mov	ecx, DWORD PTR _cType$[ebp]
	movsx	edx, BYTE PTR [ecx+1]
	cmp	edx, 110				; 0000006eH
	je	SHORT $L2583
	mov	eax, DWORD PTR _cType$[ebp]
	movsx	ecx, BYTE PTR [eax+1]
	cmp	ecx, 78					; 0000004eH
	jne	$L2581
$L2583:
	mov	edx, DWORD PTR _cType$[ebp]
	movsx	eax, BYTE PTR [edx+2]
	cmp	eax, 103				; 00000067H
	je	SHORT $L2584
	mov	ecx, DWORD PTR _cType$[ebp]
	movsx	edx, BYTE PTR [ecx+2]
	cmp	edx, 71					; 00000047H
	jne	$L2581
$L2584:
; Line 405
	lea	eax, DWORD PTR _fileSizeStr$[ebp]
	push	eax
	mov	ecx, DWORD PTR _fileSize$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?longToStr@parserObj@@AAEHPAKPAD@Z	; parserObj::longToStr
; Line 406
	push	OFFSET FLAT:$SG2585
	push	OFFSET FLAT:?contentType@@3PADA		; contentType
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcpy@parserObj@@AAEPADPAD0@Z		; parserObj::strcpy
; Line 407
	mov	DWORD PTR _statusCode$[ebp], OFFSET FLAT:_OK
; Line 408
	mov	edx, DWORD PTR _statusCode$[ebp]
	push	edx
	mov	eax, DWORD PTR _responseHeader$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 409
	lea	ecx, DWORD PTR _lineBreak$[ebp]
	push	ecx
	mov	edx, DWORD PTR _responseHeader$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 412
	lea	eax, DWORD PTR _conn$[ebp]
	push	eax
	mov	ecx, DWORD PTR _responseHeader$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 413
	lea	edx, DWORD PTR _lineBreak$[ebp]
	push	edx
	mov	eax, DWORD PTR _responseHeader$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 414
	push	OFFSET FLAT:?contentType@@3PADA		; contentType
	mov	ecx, DWORD PTR _responseHeader$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 416
	lea	edx, DWORD PTR _lineBreak$[ebp]
	push	edx
	mov	eax, DWORD PTR _responseHeader$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 417
	lea	ecx, DWORD PTR _fileSizeStr$[ebp]
	push	ecx
	lea	edx, DWORD PTR _contentLength$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 418
	lea	eax, DWORD PTR _contentLength$[ebp]
	push	eax
	mov	ecx, DWORD PTR _responseHeader$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 419
	mov	BYTE PTR _contentLength$[ebp+16], 0
; Line 420
	lea	edx, DWORD PTR _lineBreak$[ebp]
	push	edx
	mov	eax, DWORD PTR _responseHeader$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 421
	push	OFFSET FLAT:?acceptRange@@3PADA		; acceptRange
	mov	ecx, DWORD PTR _responseHeader$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 422
	lea	edx, DWORD PTR _lineBreak$[ebp]
	push	edx
	mov	eax, DWORD PTR _responseHeader$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 423
	lea	ecx, DWORD PTR _lineBreak$[ebp]
	push	ecx
	mov	edx, DWORD PTR _responseHeader$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 425
	jmp	$L2622
$L2581:
	mov	eax, DWORD PTR _cType$[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 103				; 00000067H
	je	SHORT $L2589
	mov	edx, DWORD PTR _cType$[ebp]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, 71					; 00000047H
	jne	$L2588
$L2589:
	mov	ecx, DWORD PTR _cType$[ebp]
	movsx	edx, BYTE PTR [ecx+1]
	cmp	edx, 105				; 00000069H
	je	SHORT $L2590
	mov	eax, DWORD PTR _cType$[ebp]
	movsx	ecx, BYTE PTR [eax+1]
	cmp	ecx, 73					; 00000049H
	jne	$L2588
$L2590:
	mov	edx, DWORD PTR _cType$[ebp]
	movsx	eax, BYTE PTR [edx+2]
	cmp	eax, 102				; 00000066H
	je	SHORT $L2591
	mov	ecx, DWORD PTR _cType$[ebp]
	movsx	edx, BYTE PTR [ecx+2]
	cmp	edx, 70					; 00000046H
	jne	$L2588
$L2591:
; Line 427
	lea	eax, DWORD PTR _fileSizeStr$[ebp]
	push	eax
	mov	ecx, DWORD PTR _fileSize$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?longToStr@parserObj@@AAEHPAKPAD@Z	; parserObj::longToStr
; Line 428
	push	OFFSET FLAT:$SG2592
	push	OFFSET FLAT:?contentType@@3PADA		; contentType
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcpy@parserObj@@AAEPADPAD0@Z		; parserObj::strcpy
; Line 429
	mov	DWORD PTR _statusCode$[ebp], OFFSET FLAT:_OK
; Line 430
	mov	edx, DWORD PTR _statusCode$[ebp]
	push	edx
	mov	eax, DWORD PTR _responseHeader$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 431
	lea	ecx, DWORD PTR _lineBreak$[ebp]
	push	ecx
	mov	edx, DWORD PTR _responseHeader$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 434
	lea	eax, DWORD PTR _conn$[ebp]
	push	eax
	mov	ecx, DWORD PTR _responseHeader$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 435
	lea	edx, DWORD PTR _lineBreak$[ebp]
	push	edx
	mov	eax, DWORD PTR _responseHeader$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 436
	push	OFFSET FLAT:?contentType@@3PADA		; contentType
	mov	ecx, DWORD PTR _responseHeader$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 437
	lea	edx, DWORD PTR _lineBreak$[ebp]
	push	edx
	mov	eax, DWORD PTR _responseHeader$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 438
	lea	ecx, DWORD PTR _fileSizeStr$[ebp]
	push	ecx
	lea	edx, DWORD PTR _contentLength$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 439
	lea	eax, DWORD PTR _contentLength$[ebp]
	push	eax
	mov	ecx, DWORD PTR _responseHeader$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 440
	mov	BYTE PTR _contentLength$[ebp+16], 0
; Line 441
	lea	edx, DWORD PTR _lineBreak$[ebp]
	push	edx
	mov	eax, DWORD PTR _responseHeader$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 442
	push	OFFSET FLAT:?acceptRange@@3PADA		; acceptRange
	mov	ecx, DWORD PTR _responseHeader$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 443
	lea	edx, DWORD PTR _lineBreak$[ebp]
	push	edx
	mov	eax, DWORD PTR _responseHeader$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 444
	lea	ecx, DWORD PTR _lineBreak$[ebp]
	push	ecx
	mov	edx, DWORD PTR _responseHeader$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 446
	jmp	$L2622
$L2588:
; Line 447
	mov	eax, DWORD PTR _cType$[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 106				; 0000006aH
	je	SHORT $L2596
	mov	edx, DWORD PTR _cType$[ebp]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, 74					; 0000004aH
	jne	$L2595
$L2596:
	mov	ecx, DWORD PTR _cType$[ebp]
	movsx	edx, BYTE PTR [ecx+1]
	cmp	edx, 112				; 00000070H
	je	SHORT $L2597
	mov	eax, DWORD PTR _cType$[ebp]
	movsx	ecx, BYTE PTR [eax+1]
	cmp	ecx, 80					; 00000050H
	jne	$L2595
$L2597:
	mov	edx, DWORD PTR _cType$[ebp]
	movsx	eax, BYTE PTR [edx+2]
	cmp	eax, 103				; 00000067H
	je	SHORT $L2598
	mov	ecx, DWORD PTR _cType$[ebp]
	movsx	edx, BYTE PTR [ecx+2]
	cmp	edx, 71					; 00000047H
	jne	$L2595
$L2598:
; Line 449
	lea	eax, DWORD PTR _fileSizeStr$[ebp]
	push	eax
	mov	ecx, DWORD PTR _fileSize$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?longToStr@parserObj@@AAEHPAKPAD@Z	; parserObj::longToStr
; Line 450
	push	OFFSET FLAT:$SG2599
	push	OFFSET FLAT:?contentType@@3PADA		; contentType
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcpy@parserObj@@AAEPADPAD0@Z		; parserObj::strcpy
; Line 451
	mov	DWORD PTR _statusCode$[ebp], OFFSET FLAT:_OK
; Line 452
	mov	edx, DWORD PTR _statusCode$[ebp]
	push	edx
	mov	eax, DWORD PTR _responseHeader$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 453
	lea	ecx, DWORD PTR _lineBreak$[ebp]
	push	ecx
	mov	edx, DWORD PTR _responseHeader$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 456
	lea	eax, DWORD PTR _conn$[ebp]
	push	eax
	mov	ecx, DWORD PTR _responseHeader$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 457
	lea	edx, DWORD PTR _lineBreak$[ebp]
	push	edx
	mov	eax, DWORD PTR _responseHeader$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 458
	push	OFFSET FLAT:?contentType@@3PADA		; contentType
	mov	ecx, DWORD PTR _responseHeader$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 459
	lea	edx, DWORD PTR _lineBreak$[ebp]
	push	edx
	mov	eax, DWORD PTR _responseHeader$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 460
	lea	ecx, DWORD PTR _fileSizeStr$[ebp]
	push	ecx
	lea	edx, DWORD PTR _contentLength$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 461
	lea	eax, DWORD PTR _contentLength$[ebp]
	push	eax
	mov	ecx, DWORD PTR _responseHeader$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 462
	mov	BYTE PTR _contentLength$[ebp+16], 0
; Line 463
	lea	edx, DWORD PTR _lineBreak$[ebp]
	push	edx
	mov	eax, DWORD PTR _responseHeader$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 464
	push	OFFSET FLAT:?acceptRange@@3PADA		; acceptRange
	mov	ecx, DWORD PTR _responseHeader$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 465
	lea	edx, DWORD PTR _lineBreak$[ebp]
	push	edx
	mov	eax, DWORD PTR _responseHeader$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 466
	lea	ecx, DWORD PTR _lineBreak$[ebp]
	push	ecx
	mov	edx, DWORD PTR _responseHeader$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 468
	jmp	$L2622
$L2595:
; Line 469
	mov	eax, DWORD PTR _cType$[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 100				; 00000064H
	je	SHORT $L2603
	mov	edx, DWORD PTR _cType$[ebp]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, 68					; 00000044H
	jne	$L2602
$L2603:
	mov	ecx, DWORD PTR _cType$[ebp]
	movsx	edx, BYTE PTR [ecx+1]
	cmp	edx, 111				; 0000006fH
	je	SHORT $L2604
	mov	eax, DWORD PTR _cType$[ebp]
	movsx	ecx, BYTE PTR [eax+1]
	cmp	ecx, 79					; 0000004fH
	jne	$L2602
$L2604:
	mov	edx, DWORD PTR _cType$[ebp]
	movsx	eax, BYTE PTR [edx+2]
	cmp	eax, 99					; 00000063H
	je	SHORT $L2605
	mov	ecx, DWORD PTR _cType$[ebp]
	movsx	edx, BYTE PTR [ecx+2]
	cmp	edx, 67					; 00000043H
	jne	$L2602
$L2605:
; Line 471
	lea	eax, DWORD PTR _fileSizeStr$[ebp]
	push	eax
	mov	ecx, DWORD PTR _fileSize$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?longToStr@parserObj@@AAEHPAKPAD@Z	; parserObj::longToStr
; Line 472
	push	OFFSET FLAT:$SG2606
	push	OFFSET FLAT:?contentType@@3PADA		; contentType
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcpy@parserObj@@AAEPADPAD0@Z		; parserObj::strcpy
; Line 473
	mov	DWORD PTR _statusCode$[ebp], OFFSET FLAT:_OK
; Line 474
	mov	edx, DWORD PTR _statusCode$[ebp]
	push	edx
	mov	eax, DWORD PTR _responseHeader$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 475
	lea	ecx, DWORD PTR _lineBreak$[ebp]
	push	ecx
	mov	edx, DWORD PTR _responseHeader$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 478
	lea	eax, DWORD PTR _conn$[ebp]
	push	eax
	mov	ecx, DWORD PTR _responseHeader$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 479
	lea	edx, DWORD PTR _lineBreak$[ebp]
	push	edx
	mov	eax, DWORD PTR _responseHeader$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 480
	push	OFFSET FLAT:?contentType@@3PADA		; contentType
	mov	ecx, DWORD PTR _responseHeader$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 481
	lea	edx, DWORD PTR _lineBreak$[ebp]
	push	edx
	mov	eax, DWORD PTR _responseHeader$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 482
	lea	ecx, DWORD PTR _fileSizeStr$[ebp]
	push	ecx
	lea	edx, DWORD PTR _contentLength$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 483
	lea	eax, DWORD PTR _contentLength$[ebp]
	push	eax
	mov	ecx, DWORD PTR _responseHeader$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 484
	mov	BYTE PTR _contentLength$[ebp+16], 0
; Line 485
	lea	edx, DWORD PTR _lineBreak$[ebp]
	push	edx
	mov	eax, DWORD PTR _responseHeader$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 486
	push	OFFSET FLAT:?acceptRange@@3PADA		; acceptRange
	mov	ecx, DWORD PTR _responseHeader$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 487
	lea	edx, DWORD PTR _lineBreak$[ebp]
	push	edx
	mov	eax, DWORD PTR _responseHeader$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 488
	lea	ecx, DWORD PTR _lineBreak$[ebp]
	push	ecx
	mov	edx, DWORD PTR _responseHeader$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 490
	jmp	$L2622
$L2602:
	mov	eax, DWORD PTR _cType$[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 112				; 00000070H
	je	SHORT $L2610
	mov	edx, DWORD PTR _cType$[ebp]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, 80					; 00000050H
	jne	$L2609
$L2610:
	mov	ecx, DWORD PTR _cType$[ebp]
	movsx	edx, BYTE PTR [ecx+1]
	cmp	edx, 100				; 00000064H
	je	SHORT $L2611
	mov	eax, DWORD PTR _cType$[ebp]
	movsx	ecx, BYTE PTR [eax+1]
	cmp	ecx, 68					; 00000044H
	jne	$L2609
$L2611:
	mov	edx, DWORD PTR _cType$[ebp]
	movsx	eax, BYTE PTR [edx+2]
	cmp	eax, 102				; 00000066H
	je	SHORT $L2612
	mov	ecx, DWORD PTR _cType$[ebp]
	movsx	edx, BYTE PTR [ecx+2]
	cmp	edx, 70					; 00000046H
	jne	$L2609
$L2612:
; Line 492
	lea	eax, DWORD PTR _fileSizeStr$[ebp]
	push	eax
	mov	ecx, DWORD PTR _fileSize$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?longToStr@parserObj@@AAEHPAKPAD@Z	; parserObj::longToStr
; Line 493
	push	OFFSET FLAT:$SG2613
	push	OFFSET FLAT:?contentType@@3PADA		; contentType
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcpy@parserObj@@AAEPADPAD0@Z		; parserObj::strcpy
; Line 494
	mov	DWORD PTR _statusCode$[ebp], OFFSET FLAT:_OK
; Line 495
	mov	edx, DWORD PTR _statusCode$[ebp]
	push	edx
	mov	eax, DWORD PTR _responseHeader$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 496
	lea	ecx, DWORD PTR _lineBreak$[ebp]
	push	ecx
	mov	edx, DWORD PTR _responseHeader$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 499
	lea	eax, DWORD PTR _conn$[ebp]
	push	eax
	mov	ecx, DWORD PTR _responseHeader$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 500
	lea	edx, DWORD PTR _lineBreak$[ebp]
	push	edx
	mov	eax, DWORD PTR _responseHeader$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 501
	push	OFFSET FLAT:?contentType@@3PADA		; contentType
	mov	ecx, DWORD PTR _responseHeader$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 502
	lea	edx, DWORD PTR _lineBreak$[ebp]
	push	edx
	mov	eax, DWORD PTR _responseHeader$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 503
	lea	ecx, DWORD PTR _fileSizeStr$[ebp]
	push	ecx
	lea	edx, DWORD PTR _contentLength$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 504
	lea	eax, DWORD PTR _contentLength$[ebp]
	push	eax
	mov	ecx, DWORD PTR _responseHeader$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 505
	mov	BYTE PTR _contentLength$[ebp+16], 0
; Line 506
	lea	edx, DWORD PTR _lineBreak$[ebp]
	push	edx
	mov	eax, DWORD PTR _responseHeader$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 507
	push	OFFSET FLAT:?acceptRange@@3PADA		; acceptRange
	mov	ecx, DWORD PTR _responseHeader$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 508
	lea	edx, DWORD PTR _lineBreak$[ebp]
	push	edx
	mov	eax, DWORD PTR _responseHeader$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 509
	lea	ecx, DWORD PTR _lineBreak$[ebp]
	push	ecx
	mov	edx, DWORD PTR _responseHeader$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 511
	jmp	$L2622
$L2609:
	mov	eax, DWORD PTR _cType$[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 116				; 00000074H
	je	SHORT $L2617
	mov	edx, DWORD PTR _cType$[ebp]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, 84					; 00000054H
	jne	$L2616
$L2617:
	mov	ecx, DWORD PTR _cType$[ebp]
	movsx	edx, BYTE PTR [ecx+1]
	cmp	edx, 120				; 00000078H
	je	SHORT $L2618
	mov	eax, DWORD PTR _cType$[ebp]
	movsx	ecx, BYTE PTR [eax+1]
	cmp	ecx, 88					; 00000058H
	jne	$L2616
$L2618:
	mov	edx, DWORD PTR _cType$[ebp]
	movsx	eax, BYTE PTR [edx+2]
	cmp	eax, 116				; 00000074H
	je	SHORT $L2619
	mov	ecx, DWORD PTR _cType$[ebp]
	movsx	edx, BYTE PTR [ecx+2]
	cmp	edx, 84					; 00000054H
	jne	$L2616
$L2619:
; Line 513
	lea	eax, DWORD PTR _fileSizeStr$[ebp]
	push	eax
	mov	ecx, DWORD PTR _fileSize$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?longToStr@parserObj@@AAEHPAKPAD@Z	; parserObj::longToStr
; Line 514
	push	OFFSET FLAT:$SG2620
	push	OFFSET FLAT:?contentType@@3PADA		; contentType
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcpy@parserObj@@AAEPADPAD0@Z		; parserObj::strcpy
; Line 515
	mov	DWORD PTR _statusCode$[ebp], OFFSET FLAT:_OK
; Line 516
	mov	edx, DWORD PTR _statusCode$[ebp]
	push	edx
	mov	eax, DWORD PTR _responseHeader$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 517
	lea	ecx, DWORD PTR _lineBreak$[ebp]
	push	ecx
	mov	edx, DWORD PTR _responseHeader$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 520
	lea	eax, DWORD PTR _conn$[ebp]
	push	eax
	mov	ecx, DWORD PTR _responseHeader$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 521
	lea	edx, DWORD PTR _lineBreak$[ebp]
	push	edx
	mov	eax, DWORD PTR _responseHeader$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 522
	push	OFFSET FLAT:?contentType@@3PADA		; contentType
	mov	ecx, DWORD PTR _responseHeader$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 523
	lea	edx, DWORD PTR _lineBreak$[ebp]
	push	edx
	mov	eax, DWORD PTR _responseHeader$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 524
	lea	ecx, DWORD PTR _fileSizeStr$[ebp]
	push	ecx
	lea	edx, DWORD PTR _contentLength$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 525
	lea	eax, DWORD PTR _contentLength$[ebp]
	push	eax
	mov	ecx, DWORD PTR _responseHeader$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 526
	mov	BYTE PTR _contentLength$[ebp], 0
; Line 527
	lea	edx, DWORD PTR _lineBreak$[ebp]
	push	edx
	mov	eax, DWORD PTR _responseHeader$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 528
	push	OFFSET FLAT:?acceptRange@@3PADA		; acceptRange
	mov	ecx, DWORD PTR _responseHeader$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 529
	lea	edx, DWORD PTR _lineBreak$[ebp]
	push	edx
	mov	eax, DWORD PTR _responseHeader$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 530
	lea	ecx, DWORD PTR _lineBreak$[ebp]
	push	ecx
	mov	edx, DWORD PTR _responseHeader$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 532
	jmp	$L2622
$L2616:
; Line 534
	lea	eax, DWORD PTR _fileSizeStr$[ebp]
	push	eax
	mov	ecx, DWORD PTR _fileSize$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?longToStr@parserObj@@AAEHPAKPAD@Z	; parserObj::longToStr
; Line 535
	push	OFFSET FLAT:$SG2623
	push	OFFSET FLAT:?contentType@@3PADA		; contentType
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcpy@parserObj@@AAEPADPAD0@Z		; parserObj::strcpy
; Line 536
	mov	DWORD PTR _statusCode$[ebp], OFFSET FLAT:_pageFound
; Line 537
	mov	edx, DWORD PTR _statusCode$[ebp]
	push	edx
	mov	eax, DWORD PTR _responseHeader$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 538
	lea	ecx, DWORD PTR _lineBreak$[ebp]
	push	ecx
	mov	edx, DWORD PTR _responseHeader$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 541
	lea	eax, DWORD PTR _Server$[ebp]
	push	eax
	mov	ecx, DWORD PTR _responseHeader$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 542
	lea	edx, DWORD PTR _lineBreak$[ebp]
	push	edx
	mov	eax, DWORD PTR _responseHeader$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 543
	lea	ecx, DWORD PTR _conn$[ebp]
	push	ecx
	mov	edx, DWORD PTR _responseHeader$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 544
	lea	eax, DWORD PTR _lineBreak$[ebp]
	push	eax
	mov	ecx, DWORD PTR _responseHeader$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 545
	mov	edx, DWORD PTR _encoding$[ebp]
	push	edx
	push	OFFSET FLAT:?contentType@@3PADA		; contentType
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 546
	push	OFFSET FLAT:?contentType@@3PADA		; contentType
	mov	eax, DWORD PTR _responseHeader$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 547
	lea	ecx, DWORD PTR _lineBreak$[ebp]
	push	ecx
	mov	edx, DWORD PTR _responseHeader$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 548
	lea	eax, DWORD PTR _fileSizeStr$[ebp]
	push	eax
	lea	ecx, DWORD PTR _contentLength$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 549
	lea	edx, DWORD PTR _contentLength$[ebp]
	push	edx
	mov	eax, DWORD PTR _responseHeader$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 550
	lea	ecx, DWORD PTR _lineBreak$[ebp]
	push	ecx
	mov	edx, DWORD PTR _responseHeader$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 551
	lea	eax, DWORD PTR _lineBreak$[ebp]
	push	eax
	mov	ecx, DWORD PTR _responseHeader$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
$L2622:
; Line 555
	jmp	$L2625
$L2573:
; Line 558
	push	OFFSET FLAT:$SG2626
	mov	edx, DWORD PTR _resourceName$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcpy@parserObj@@AAEPADPAD0@Z		; parserObj::strcpy
; Line 559
	mov	eax, DWORD PTR _resourceName$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAStrLen@AOAProtected@@QAEHPAD@Z	; AOAProtected::AOAStrLen
	mov	DWORD PTR _tempsize$[ebp], eax
; Line 560
	mov	ecx, DWORD PTR _resourceName$[ebp]
	add	ecx, DWORD PTR _tempsize$[ebp]
	mov	BYTE PTR [ecx], 0
; Line 563
	mov	edx, DWORD PTR _fileSize$[ebp]
	push	edx
	mov	eax, DWORD PTR _fileStartAdress$[ebp]
	push	eax
	mov	ecx, DWORD PTR _resourceName$[ebp]
	push	ecx
	lea	ecx, DWORD PTR _h1$[ebp]
	call	?getFile@FTPObj@@QAEHPADPAK1@Z		; FTPObj::getFile
	mov	DWORD PTR _retcode$[ebp], eax
; Line 565
	lea	edx, DWORD PTR _fileSizeStr$[ebp]
	push	edx
	mov	eax, DWORD PTR _fileSize$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?longToStr@parserObj@@AAEHPAKPAD@Z	; parserObj::longToStr
; Line 566
	push	OFFSET FLAT:$SG2627
	push	OFFSET FLAT:?contentType@@3PADA		; contentType
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcpy@parserObj@@AAEPADPAD0@Z		; parserObj::strcpy
; Line 567
	mov	DWORD PTR _statusCode$[ebp], OFFSET FLAT:_pageFound
; Line 568
	mov	ecx, DWORD PTR _statusCode$[ebp]
	push	ecx
	mov	edx, DWORD PTR _responseHeader$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 569
	lea	eax, DWORD PTR _lineBreak$[ebp]
	push	eax
	mov	ecx, DWORD PTR _responseHeader$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 572
	lea	edx, DWORD PTR _Server$[ebp]
	push	edx
	mov	eax, DWORD PTR _responseHeader$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 573
	lea	ecx, DWORD PTR _lineBreak$[ebp]
	push	ecx
	mov	edx, DWORD PTR _responseHeader$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 574
	lea	eax, DWORD PTR _conn$[ebp]
	push	eax
	mov	ecx, DWORD PTR _responseHeader$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 575
	lea	edx, DWORD PTR _lineBreak$[ebp]
	push	edx
	mov	eax, DWORD PTR _responseHeader$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 576
	mov	ecx, DWORD PTR _encoding$[ebp]
	push	ecx
	push	OFFSET FLAT:?contentType@@3PADA		; contentType
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 577
	push	OFFSET FLAT:?contentType@@3PADA		; contentType
	mov	edx, DWORD PTR _responseHeader$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 578
	lea	eax, DWORD PTR _lineBreak$[ebp]
	push	eax
	mov	ecx, DWORD PTR _responseHeader$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 579
	lea	edx, DWORD PTR _fileSizeStr$[ebp]
	push	edx
	lea	eax, DWORD PTR _contentLength$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 580
	lea	ecx, DWORD PTR _contentLength$[ebp]
	push	ecx
	mov	edx, DWORD PTR _responseHeader$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 581
	lea	eax, DWORD PTR _lineBreak$[ebp]
	push	eax
	mov	ecx, DWORD PTR _responseHeader$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 582
	lea	edx, DWORD PTR _lineBreak$[ebp]
	push	edx
	mov	eax, DWORD PTR _responseHeader$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
$L2625:
; Line 585
	mov	ecx, DWORD PTR _responseHeader$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAStrLenAll@AOAProtected@@QAEHPAD@Z	; AOAProtected::AOAStrLenAll
	mov	edx, DWORD PTR _headerSize$[ebp]
	mov	DWORD PTR [edx], eax
; Line 586
	xor	eax, eax
; Line 587
	pop	edi
	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	24					; 00000018H
?createResponse@parserObj@@AAEHPAD00PAJPAK2@Z ENDP	; parserObj::createResponse
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
PUBLIC	?sstrcmp@parserObj@@AAEHPAD0@Z			; parserObj::sstrcmp
_TEXT	SEGMENT
_D_Str$ = 8
_S_Str$ = 12
_this$ = -16
_i$ = -12
_io$ = -8
?sstrcmp@parserObj@@AAEHPAD0@Z PROC NEAR		; parserObj::sstrcmp
; Line 594
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	esi
	mov	DWORD PTR _this$[ebp], ecx
; Line 595
	mov	DWORD PTR _i$[ebp], 0
; Line 596
	lea	ecx, DWORD PTR _io$[ebp]
	call	??0AOAProtected@@QAE@XZ			; AOAProtected::AOAProtected
; Line 597
	mov	eax, DWORD PTR _D_Str$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?sstrlen@parserObj@@AAEHPAD@Z		; parserObj::sstrlen
	mov	esi, eax
	mov	ecx, DWORD PTR _S_Str$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?sstrlen@parserObj@@AAEHPAD@Z		; parserObj::sstrlen
	cmp	esi, eax
	je	SHORT $L2640
; Line 599
	or	eax, -1
	jmp	$L2637
$L2640:
; Line 602
	mov	edx, DWORD PTR _D_Str$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	jne	SHORT $L2644
	mov	ecx, DWORD PTR _S_Str$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	$L2643
$L2644:
; Line 604
	mov	eax, DWORD PTR _D_Str$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	movsx	ecx, BYTE PTR [eax]
	mov	edx, DWORD PTR _S_Str$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR [edx]
	cmp	ecx, eax
	jne	SHORT $L2645
; Line 606
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
; Line 608
	jmp	SHORT $L2653
$L2645:
	mov	edx, DWORD PTR _D_Str$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, 47					; 0000002fH
	jne	SHORT $L2647
; Line 611
	or	eax, -1
	jmp	SHORT $L2637
$L2647:
; Line 614
	mov	ecx, DWORD PTR _D_Str$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, 92					; 0000005cH
	jne	SHORT $L2650
; Line 616
	mov	eax, DWORD PTR _S_Str$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 47					; 0000002fH
	je	SHORT $L2651
; Line 617
	or	eax, -1
	jmp	SHORT $L2637
$L2651:
; Line 618
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
; Line 621
	jmp	SHORT $L2653
$L2650:
	mov	eax, DWORD PTR _D_Str$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	movsx	ecx, BYTE PTR [eax]
	mov	edx, DWORD PTR _S_Str$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR [edx]
	cmp	ecx, eax
	je	SHORT $L2653
; Line 623
	or	eax, -1
	jmp	SHORT $L2637
$L2653:
; Line 626
	jmp	$L2640
$L2643:
; Line 627
	mov	ecx, DWORD PTR _D_Str$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	jne	SHORT $L2654
	mov	eax, DWORD PTR _S_Str$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	jne	SHORT $L2654
; Line 629
	xor	eax, eax
	jmp	SHORT $L2637
$L2654:
; Line 633
	or	eax, -1
$L2637:
; Line 636
	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	8
?sstrcmp@parserObj@@AAEHPAD0@Z ENDP			; parserObj::sstrcmp
_TEXT	ENDS
PUBLIC	?sstrcpy@parserObj@@AAEHPADH0H@Z		; parserObj::sstrcpy
_TEXT	SEGMENT
_D_Str$ = 8
_D_Size$ = 12
_S_Str$ = 16
_S_Size$ = 20
_this$ = -12
_i$ = -8
_D_Full_flag$ = -4
?sstrcpy@parserObj@@AAEHPADH0H@Z PROC NEAR		; parserObj::sstrcpy
; Line 639
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 640
	mov	DWORD PTR _i$[ebp], 0
; Line 641
	mov	DWORD PTR _D_Full_flag$[ebp], 0
; Line 642
	cmp	DWORD PTR _D_Size$[ebp], 2
	jge	SHORT $L2667
; Line 644
	cmp	DWORD PTR _D_Size$[ebp], 1
	jge	SHORT $L2666
; Line 645
	or	eax, -1
	jmp	$L2662
$L2666:
; Line 646
	cmp	DWORD PTR _D_Size$[ebp], 1
	jne	SHORT $L2667
; Line 648
	mov	eax, DWORD PTR _D_Str$[ebp]
	mov	BYTE PTR [eax], 0
; Line 649
	xor	eax, eax
	jmp	$L2662
$L2667:
; Line 652
	cmp	DWORD PTR _S_Size$[ebp], 2
	jge	SHORT $L2668
; Line 654
	mov	ecx, DWORD PTR _D_Str$[ebp]
	mov	BYTE PTR [ecx], 0
; Line 655
	xor	eax, eax
	jmp	SHORT $L2662
$L2668:
; Line 657
	mov	edx, DWORD PTR _S_Str$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L2671
; Line 659
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _D_Size$[ebp]
	jge	SHORT $L2672
; Line 661
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _S_Size$[ebp]
	jge	SHORT $L2673
; Line 662
	mov	eax, DWORD PTR _D_Str$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _S_Str$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	dl, BYTE PTR [ecx]
	mov	BYTE PTR [eax], dl
; Line 663
	jmp	SHORT $L2674
$L2673:
; Line 665
	mov	eax, DWORD PTR _D_Str$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	mov	BYTE PTR [eax], 0
; Line 666
	xor	eax, eax
	jmp	SHORT $L2662
$L2674:
; Line 669
	jmp	SHORT $L2675
$L2672:
; Line 671
	mov	ecx, DWORD PTR _D_Str$[ebp]
	add	ecx, DWORD PTR _D_Size$[ebp]
	mov	BYTE PTR [ecx-1], 0
; Line 672
	xor	eax, eax
	jmp	SHORT $L2662
$L2675:
; Line 674
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
; Line 675
	jmp	SHORT $L2668
$L2671:
; Line 676
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _D_Size$[ebp]
	jge	SHORT $L2676
; Line 678
	mov	ecx, DWORD PTR _D_Str$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	BYTE PTR [ecx], 0
; Line 680
	jmp	SHORT $L2677
$L2676:
; Line 682
	mov	edx, DWORD PTR _D_Str$[ebp]
	add	edx, DWORD PTR _D_Size$[ebp]
	mov	BYTE PTR [edx-1], 0
$L2677:
; Line 684
	xor	eax, eax
$L2662:
; Line 685
	mov	esp, ebp
	pop	ebp
	ret	16					; 00000010H
?sstrcpy@parserObj@@AAEHPADH0H@Z ENDP			; parserObj::sstrcpy
_str$ = 8
_this$ = -8
_len$ = -4
?sstrlen@parserObj@@AAEHPAD@Z PROC NEAR			; parserObj::sstrlen
; Line 688
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 690
	mov	DWORD PTR _len$[ebp], 0
$L2684:
; Line 692
	mov	eax, DWORD PTR _str$[ebp]
	add	eax, DWORD PTR _len$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L2685
; Line 694
	mov	edx, DWORD PTR _len$[ebp]
	add	edx, 1
	mov	DWORD PTR _len$[ebp], edx
; Line 695
	jmp	SHORT $L2684
$L2685:
; Line 696
	mov	eax, DWORD PTR _len$[ebp]
; Line 697
	mov	esp, ebp
	pop	ebp
	ret	4
?sstrlen@parserObj@@AAEHPAD@Z ENDP			; parserObj::sstrlen
_string1$ = 8
_string2$ = 12
_this$ = -8
_i$ = -4
?strcpy@parserObj@@AAEPADPAD0@Z PROC NEAR		; parserObj::strcpy
; Line 699
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 700
	mov	DWORD PTR _i$[ebp], 0
$L2693:
; Line 701
	mov	eax, DWORD PTR _string2$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L2694
; Line 703
	mov	edx, DWORD PTR _string1$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _string2$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	mov	cl, BYTE PTR [eax]
	mov	BYTE PTR [edx], cl
; Line 704
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
; Line 705
	jmp	SHORT $L2693
$L2694:
; Line 706
	mov	eax, DWORD PTR _string1$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	mov	BYTE PTR [eax], 0
; Line 708
	mov	eax, DWORD PTR _string1$[ebp]
; Line 709
	mov	esp, ebp
	pop	ebp
	ret	8
?strcpy@parserObj@@AAEPADPAD0@Z ENDP			; parserObj::strcpy
_string1$ = 8
_string2$ = 12
_this$ = -12
_i$ = -4
_j$ = -8
?strcat@parserObj@@AAEXPAD0@Z PROC NEAR			; parserObj::strcat
; Line 712
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 714
	mov	DWORD PTR _i$[ebp], 0
; Line 715
	mov	DWORD PTR _j$[ebp], 0
$L2703:
; Line 716
	mov	eax, DWORD PTR _string1$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L2704
; Line 718
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
; Line 719
	jmp	SHORT $L2703
$L2704:
; Line 722
	mov	eax, DWORD PTR _string2$[ebp]
	add	eax, DWORD PTR _j$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L2707
; Line 724
	mov	edx, DWORD PTR _string1$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _string2$[ebp]
	add	eax, DWORD PTR _j$[ebp]
	mov	cl, BYTE PTR [eax]
	mov	BYTE PTR [edx], cl
; Line 725
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
; Line 726
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	DWORD PTR _j$[ebp], eax
; Line 727
	jmp	SHORT $L2704
$L2707:
; Line 728
	mov	ecx, DWORD PTR _string1$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _string2$[ebp]
	add	edx, DWORD PTR _j$[ebp]
	mov	al, BYTE PTR [edx]
	mov	BYTE PTR [ecx], al
; Line 729
	mov	esp, ebp
	pop	ebp
	ret	8
?strcat@parserObj@@AAEXPAD0@Z ENDP			; parserObj::strcat
_input$ = 8
_output$ = 12
_this$ = -28
_temp$ = -16
_temp1$ = -4
_i$ = -20
_j$ = -24
?longToStr@parserObj@@AAEHPAKPAD@Z PROC NEAR		; parserObj::longToStr
; Line 733
	push	ebp
	mov	ebp, esp
	sub	esp, 28					; 0000001cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 736
	mov	eax, DWORD PTR _input$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _temp1$[ebp], ecx
; Line 737
	mov	DWORD PTR _i$[ebp], 0
	mov	DWORD PTR _j$[ebp], 0
$L2718:
; Line 739
	cmp	DWORD PTR _temp1$[ebp], 9
	jbe	SHORT $L2719
; Line 741
	mov	eax, DWORD PTR _temp1$[ebp]
	xor	edx, edx
	mov	ecx, 10					; 0000000aH
	div	ecx
	add	edx, 48					; 00000030H
	mov	eax, DWORD PTR _i$[ebp]
	mov	BYTE PTR _temp$[ebp+eax], dl
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
; Line 743
	mov	eax, DWORD PTR _temp1$[ebp]
	xor	edx, edx
	mov	ecx, 10					; 0000000aH
	div	ecx
	mov	DWORD PTR _temp1$[ebp], eax
; Line 744
	jmp	SHORT $L2718
$L2719:
; Line 745
	mov	edx, DWORD PTR _temp1$[ebp]
	add	edx, 48					; 00000030H
	mov	eax, DWORD PTR _i$[ebp]
	mov	BYTE PTR _temp$[ebp+eax], dl
; Line 747
	mov	DWORD PTR _j$[ebp], 0
$L2721:
; Line 749
	mov	ecx, DWORD PTR _i$[ebp]
	movsx	edx, BYTE PTR _temp$[ebp+ecx]
	mov	eax, DWORD PTR _i$[ebp]
	sub	eax, 1
	mov	DWORD PTR _i$[ebp], eax
	cmp	edx, 48					; 00000030H
	jne	SHORT $L2722
	jmp	SHORT $L2721
$L2722:
; Line 751
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L2724:
; Line 752
	cmp	DWORD PTR _i$[ebp], 0
	jl	SHORT $L2725
; Line 754
	mov	edx, DWORD PTR _output$[ebp]
	add	edx, DWORD PTR _j$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	mov	cl, BYTE PTR _temp$[ebp+eax]
	mov	BYTE PTR [edx], cl
	mov	edx, DWORD PTR _j$[ebp]
	add	edx, 1
	mov	DWORD PTR _j$[ebp], edx
	mov	eax, DWORD PTR _i$[ebp]
	sub	eax, 1
	mov	DWORD PTR _i$[ebp], eax
; Line 755
	jmp	SHORT $L2724
$L2725:
; Line 756
	mov	ecx, DWORD PTR _output$[ebp]
	add	ecx, DWORD PTR _j$[ebp]
	mov	BYTE PTR [ecx], 0
; Line 757
	xor	eax, eax
; Line 758
	mov	esp, ebp
	pop	ebp
	ret	8
?longToStr@parserObj@@AAEHPAKPAD@Z ENDP			; parserObj::longToStr
_TEXT	ENDS
EXTRN	?AOAconvertLongTo8HexChars@AOAProtected@@QAEXKPAD@Z:NEAR ; AOAProtected::AOAconvertLongTo8HexChars
_TEXT	SEGMENT
_f1$ = 8
_f2$ = 12
_len$ = 16
_this$ = -36
_i$ = -24
_inptr$ = -32
_outptr$ = -28
_count$ = -20
_v1$ = -4
?copyTraceHtml@parserObj@@AAEHKKK@Z PROC NEAR		; parserObj::copyTraceHtml
; Line 763
	push	ebp
	mov	ebp, esp
	sub	esp, 36					; 00000024H
	mov	DWORD PTR _this$[ebp], ecx
; Line 764
	mov	DWORD PTR _i$[ebp], 0
; Line 767
	mov	DWORD PTR _count$[ebp], 0
; Line 768
	mov	DWORD PTR _v1$[ebp], 169552957		; 0a1b2c3dH
; Line 771
	mov	eax, DWORD PTR _f1$[ebp]
	mov	DWORD PTR _inptr$[ebp], eax
; Line 772
	mov	ecx, DWORD PTR _f2$[ebp]
	mov	DWORD PTR _outptr$[ebp], ecx
; Line 775
	mov	DWORD PTR _i$[ebp], 0
$L2741:
; Line 776
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _len$[ebp]
	jae	SHORT $L2742
; Line 778
	mov	eax, DWORD PTR _outptr$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR [eax]
	cmp	ecx, 82					; 00000052H
	jne	SHORT $L2743
	mov	edx, DWORD PTR _outptr$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	xor	eax, eax
	mov	al, BYTE PTR [edx+1]
	cmp	eax, 79					; 0000004fH
	jne	SHORT $L2743
	mov	ecx, DWORD PTR _outptr$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	xor	edx, edx
	mov	dl, BYTE PTR [ecx+2]
	cmp	edx, 87					; 00000057H
	jne	SHORT $L2743
	mov	eax, DWORD PTR _outptr$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR [eax+3]
	cmp	ecx, 88					; 00000058H
	jne	SHORT $L2743
; Line 780
	mov	edx, DWORD PTR _outptr$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _count$[ebp]
	mov	ecx, DWORD PTR _inptr$[ebp]
	mov	edx, DWORD PTR [ecx+eax*4]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAconvertLongTo8HexChars@AOAProtected@@QAEXKPAD@Z ; AOAProtected::AOAconvertLongTo8HexChars
; Line 782
	mov	eax, DWORD PTR _count$[ebp]
	add	eax, 1
	mov	DWORD PTR _count$[ebp], eax
; Line 783
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 8
	mov	DWORD PTR _i$[ebp], ecx
; Line 785
	jmp	SHORT $L2745
$L2743:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L2745:
; Line 786
	jmp	SHORT $L2741
$L2742:
; Line 787
	xor	eax, eax
; Line 788
	mov	esp, ebp
	pop	ebp
	ret	12					; 0000000cH
?copyTraceHtml@parserObj@@AAEHKKK@Z ENDP		; parserObj::copyTraceHtml
_TEXT	ENDS
END
