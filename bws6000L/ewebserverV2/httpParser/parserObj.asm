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
$SG2398	DB	' eroor in parserobj', 00H
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
	jne	SHORT $L2390
; Line 65
	or	eax, -1
	jmp	$L2382
$L2390:
; Line 68
	mov	edx, DWORD PTR _requestMsg$[ebp]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, 71					; 00000047H
	jne	SHORT $L2391
	mov	ecx, DWORD PTR _requestMsg$[ebp]
	movsx	edx, BYTE PTR [ecx+1]
	cmp	edx, 69					; 00000045H
	jne	SHORT $L2391
	mov	eax, DWORD PTR _requestMsg$[ebp]
	movsx	ecx, BYTE PTR [eax+2]
	cmp	ecx, 84					; 00000054H
	jne	SHORT $L2391
	mov	edx, DWORD PTR _requestMsg$[ebp]
	movsx	eax, BYTE PTR [edx+3]
	cmp	eax, 32					; 00000020H
	jne	SHORT $L2391
; Line 72
	mov	ecx, DWORD PTR _currenttask$[ebp]
	push	ecx
	mov	edx, DWORD PTR _currenttcbrno$[ebp]
	push	edx
	mov	eax, DWORD PTR _requestMsg$[ebp]
	add	eax, 4
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?methodGET@parserObj@@AAEHPADHH@Z	; parserObj::methodGET
	mov	DWORD PTR _retcode$[ebp], eax
; Line 74
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L2382
$L2391:
; Line 76
	mov	ecx, DWORD PTR _requestMsg$[ebp]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, 80					; 00000050H
	jne	SHORT $L2393
	mov	eax, DWORD PTR _requestMsg$[ebp]
	movsx	ecx, BYTE PTR [eax+1]
	cmp	ecx, 79					; 0000004fH
	jne	SHORT $L2393
	mov	edx, DWORD PTR _requestMsg$[ebp]
	movsx	eax, BYTE PTR [edx+2]
	cmp	eax, 83					; 00000053H
	jne	SHORT $L2393
	mov	ecx, DWORD PTR _requestMsg$[ebp]
	movsx	edx, BYTE PTR [ecx+3]
	cmp	edx, 84					; 00000054H
	jne	SHORT $L2393
; Line 83
	mov	eax, -2					; fffffffeH
	jmp	SHORT $L2382
$L2393:
; Line 86
	mov	eax, DWORD PTR _requestMsg$[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 72					; 00000048H
	jne	SHORT $L2395
	mov	edx, DWORD PTR _requestMsg$[ebp]
	movsx	eax, BYTE PTR [edx+1]
	cmp	eax, 69					; 00000045H
	jne	SHORT $L2395
	mov	ecx, DWORD PTR _requestMsg$[ebp]
	movsx	edx, BYTE PTR [ecx+2]
	cmp	edx, 65					; 00000041H
	jne	SHORT $L2395
	mov	eax, DWORD PTR _requestMsg$[ebp]
	movsx	ecx, BYTE PTR [eax+3]
	cmp	ecx, 68					; 00000044H
	jne	SHORT $L2395
; Line 92
	mov	eax, -3					; fffffffdH
	jmp	SHORT $L2382
$L2395:
; Line 98
	push	980					; 000003d4H
	mov	edx, DWORD PTR _requestMsg$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 99
	push	1140					; 00000474H
	push	OFFSET FLAT:$SG2398
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 100
	mov	DWORD PTR ?Application_Status@AOAProtected@@2HA, 2 ; AOAProtected::Application_Status
; Line 101
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAExit@AOAProtected@@QAEXXZ		; AOAProtected::AOAExit
; Line 102
	mov	eax, -4					; fffffffcH
$L2382:
; Line 106
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
EXTRN	?tcpSendN@TCPObj@@QAEHHH@Z:NEAR			; TCPObj::tcpSendN
EXTRN	?AOAStrLen@AOAProtected@@QAEHPAD@Z:NEAR		; AOAProtected::AOAStrLen
EXTRN	?setFileParam@TCPObj@@QAEHHPADJKJH@Z:NEAR	; TCPObj::setFileParam
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
; Line 113
	push	ebp
	mov	ebp, esp
	sub	esp, 1532				; 000005fcH
	mov	DWORD PTR _this$[ebp], ecx
; Line 114
	lea	ecx, DWORD PTR _task$[ebp]
	call	??0AOATask@@QAE@XZ			; AOATask::AOATask
; Line 116
	lea	ecx, DWORD PTR _tcp$[ebp]
	call	??0TCPObj@@QAE@XZ			; TCPObj::TCPObj
; Line 119
	mov	DWORD PTR _i$[ebp], 0
	mov	DWORD PTR _j$[ebp], 0
	mov	DWORD PTR _k$[ebp], 0
; Line 128
	mov	DWORD PTR _HeaderSize$[ebp], 0
; Line 130
	mov	DWORD PTR _FileSize$[ebp], 0
; Line 133
	mov	DWORD PTR _FileStartAddress$[ebp], 0
; Line 136
	mov	DWORD PTR _fileNameSize$[ebp], 0
; Line 139
	mov	DWORD PTR _fileCheck$[ebp], 0
; Line 144
	mov	DWORD PTR _retcode$[ebp], 0
; Line 147
	mov	BYTE PTR _responseHeader$[ebp], 0
; Line 150
	mov	eax, DWORD PTR _requestMsg$[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 47					; 0000002fH
	je	SHORT $L2429
; Line 153
	mov	eax, -3					; fffffffdH
	jmp	$L2414
$L2429:
; Line 157
	mov	DWORD PTR _i$[ebp], 1
$L2431:
; Line 159
	mov	edx, DWORD PTR _requestMsg$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, 32					; 00000020H
	je	SHORT $L2432
; Line 161
	mov	ecx, DWORD PTR _requestMsg$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _i$[ebp]
	mov	al, BYTE PTR [ecx]
	mov	BYTE PTR _resourceName$[ebp+edx-1], al
; Line 162
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
; Line 163
	jmp	SHORT $L2431
$L2432:
; Line 165
	cmp	DWORD PTR _i$[ebp], 1
	jne	SHORT $L2433
; Line 168
	push	OFFSET FLAT:?defaultFile@@3PADA+1
	lea	edx, DWORD PTR _resourceName$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcpy@parserObj@@AAEPADPAD0@Z		; parserObj::strcpy
; Line 170
	jmp	SHORT $L2435
$L2433:
; Line 175
	mov	eax, DWORD PTR _i$[ebp]
	mov	BYTE PTR _resourceName$[ebp+eax-1], 0
$L2435:
; Line 178
	mov	ecx, DWORD PTR _requestMsg$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?checkVersion@parserObj@@AAEHPAD@Z	; parserObj::checkVersion
	mov	DWORD PTR _retcode$[ebp], eax
; Line 179
	cmp	DWORD PTR _retcode$[ebp], 0
	jne	$L2436
; Line 181
	lea	edx, DWORD PTR _resourceName$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAStrLen@AOAProtected@@QAEHPAD@Z	; AOAProtected::AOAStrLen
	mov	DWORD PTR _fileNameSize$[ebp], eax
; Line 187
	cmp	DWORD PTR _fileNameSize$[ebp], 80	; 00000050H
	jle	SHORT $L2437
; Line 189
	mov	BYTE PTR _resourceName$[ebp+79], 0
$L2437:
; Line 191
	mov	DWORD PTR _j$[ebp], 0
; Line 194
	mov	DWORD PTR _fileCheck$[ebp], 0
$L2439:
; Line 195
	mov	eax, DWORD PTR _j$[ebp]
	movsx	ecx, BYTE PTR _resourceName$[ebp+eax]
	test	ecx, ecx
	je	$L2440
	cmp	DWORD PTR _j$[ebp], 80			; 00000050H
	jge	$L2440
; Line 197
	mov	edx, DWORD PTR _j$[ebp]
	movsx	eax, BYTE PTR _resourceName$[ebp+edx]
	cmp	eax, 46					; 0000002eH
	jne	SHORT $L2441
; Line 200
	mov	DWORD PTR _fileCheck$[ebp], 1
; Line 201
	mov	DWORD PTR _k$[ebp], 0
$L2443:
; Line 202
	mov	ecx, DWORD PTR _j$[ebp]
	movsx	edx, BYTE PTR _resourceName$[ebp+ecx]
	test	edx, edx
	je	SHORT $L2444
	cmp	DWORD PTR _j$[ebp], 80			; 00000050H
	jge	SHORT $L2444
; Line 204
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	DWORD PTR _j$[ebp], eax
	mov	ecx, DWORD PTR _k$[ebp]
	mov	edx, DWORD PTR _j$[ebp]
	mov	al, BYTE PTR _resourceName$[ebp+edx]
	mov	BYTE PTR _cType$[ebp+ecx], al
; Line 205
	mov	ecx, DWORD PTR _k$[ebp]
	add	ecx, 1
	mov	DWORD PTR _k$[ebp], ecx
; Line 206
	jmp	SHORT $L2443
$L2444:
; Line 208
	mov	edx, DWORD PTR _k$[ebp]
	mov	BYTE PTR _cType$[ebp+edx], 0
; Line 209
	jmp	SHORT $L2440
$L2441:
; Line 212
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	DWORD PTR _j$[ebp], eax
; Line 213
	jmp	$L2439
$L2440:
; Line 214
	cmp	DWORD PTR _fileCheck$[ebp], 0
	jne	SHORT $L2447
; Line 217
	push	OFFSET FLAT:?defaultFile@@3PADA
	mov	ecx, DWORD PTR _this$[ebp]
	call	?sstrlen@parserObj@@AAEHPAD@Z		; parserObj::sstrlen
	mov	ecx, 80					; 00000050H
	sub	ecx, eax
	cmp	DWORD PTR _fileNameSize$[ebp], ecx
	jle	SHORT $L2446
; Line 219
	mov	edx, DWORD PTR _fileNameSize$[ebp]
	mov	BYTE PTR _resourceName$[ebp+edx], 0
; Line 221
	jmp	SHORT $L2447
$L2446:
; Line 223
	push	OFFSET FLAT:?defaultFile@@3PADA
	lea	eax, DWORD PTR _resourceName$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
$L2447:
; Line 228
	lea	ecx, DWORD PTR _FileSize$[ebp]
	push	ecx
	lea	edx, DWORD PTR _FileStartAddress$[ebp]
	push	edx
	lea	eax, DWORD PTR _HeaderSize$[ebp]
	push	eax
	lea	ecx, DWORD PTR _responseHeader$[ebp]
	push	ecx
	lea	edx, DWORD PTR _cType$[ebp]
	push	edx
	lea	eax, DWORD PTR _resourceName$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?createResponse@parserObj@@AAEHPAD00PAJPAK2@Z ; parserObj::createResponse
	mov	DWORD PTR _retcode$[ebp], eax
; Line 231
	mov	ecx, DWORD PTR _currenttask$[ebp]
	push	ecx
	mov	edx, DWORD PTR _FileSize$[ebp]
	push	edx
	mov	eax, DWORD PTR _FileStartAddress$[ebp]
	push	eax
	mov	ecx, DWORD PTR _HeaderSize$[ebp]
	push	ecx
	lea	edx, DWORD PTR _responseHeader$[ebp]
	push	edx
	mov	eax, DWORD PTR _currenttcbrno$[ebp]
	push	eax
	lea	ecx, DWORD PTR _tcp$[ebp]
	call	?setFileParam@TCPObj@@QAEHHPADJKJH@Z	; TCPObj::setFileParam
	mov	DWORD PTR _retcode$[ebp], eax
; Line 232
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L2449
; Line 233
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	SHORT $L2414
$L2449:
; Line 237
	mov	ecx, DWORD PTR _currenttask$[ebp]
	push	ecx
	mov	edx, DWORD PTR _currenttcbrno$[ebp]
	push	edx
	lea	ecx, DWORD PTR _tcp$[ebp]
	call	?tcpSendN@TCPObj@@QAEHHH@Z		; TCPObj::tcpSendN
	mov	DWORD PTR _retcode$[ebp], eax
; Line 240
	mov	BYTE PTR _responseHeader$[ebp], 0
; Line 242
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	SHORT $L2414
$L2436:
; Line 248
	mov	eax, DWORD PTR _retcode$[ebp]
$L2414:
; Line 251
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
; Line 256
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 257
	mov	DWORD PTR _retcode$[ebp], 0
; Line 258
	mov	eax, DWORD PTR _requestMsg$[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 32					; 00000020H
	je	SHORT $L2456
; Line 260
	mov	eax, -4					; fffffffcH
	jmp	$L2454
$L2456:
; Line 271
	mov	edx, DWORD PTR _requestMsg$[ebp]
	movsx	eax, BYTE PTR [edx+1]
	cmp	eax, 72					; 00000048H
	jne	$L2457
	mov	ecx, DWORD PTR _requestMsg$[ebp]
	movsx	edx, BYTE PTR [ecx+2]
	cmp	edx, 84					; 00000054H
	jne	SHORT $L2457
	mov	eax, DWORD PTR _requestMsg$[ebp]
	movsx	ecx, BYTE PTR [eax+3]
	cmp	ecx, 84					; 00000054H
	jne	SHORT $L2457
	mov	edx, DWORD PTR _requestMsg$[ebp]
	movsx	eax, BYTE PTR [edx+4]
	cmp	eax, 80					; 00000050H
	jne	SHORT $L2457
	mov	ecx, DWORD PTR _requestMsg$[ebp]
	movsx	edx, BYTE PTR [ecx+5]
	cmp	edx, 47					; 0000002fH
	jne	SHORT $L2457
	mov	eax, DWORD PTR _requestMsg$[ebp]
	movsx	ecx, BYTE PTR [eax+6]
	cmp	ecx, 49					; 00000031H
	jne	SHORT $L2457
	mov	edx, DWORD PTR _requestMsg$[ebp]
	movsx	eax, BYTE PTR [edx+7]
	cmp	eax, 46					; 0000002eH
	jne	SHORT $L2457
	mov	ecx, DWORD PTR _requestMsg$[ebp]
	movsx	edx, BYTE PTR [ecx+8]
	cmp	edx, 48					; 00000030H
	je	SHORT $L2458
	mov	eax, DWORD PTR _requestMsg$[ebp]
	movsx	ecx, BYTE PTR [eax+8]
	cmp	ecx, 49					; 00000031H
	jne	SHORT $L2457
$L2458:
; Line 273
	mov	edx, DWORD PTR _requestMsg$[ebp]
	add	edx, 9
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?checkLineBreak@parserObj@@AAEHPAD@Z	; parserObj::checkLineBreak
	mov	DWORD PTR _retcode$[ebp], eax
; Line 274
	cmp	DWORD PTR _retcode$[ebp], 0
	jne	SHORT $L2459
; Line 276
	xor	eax, eax
	jmp	SHORT $L2454
$L2459:
; Line 281
	mov	eax, -5					; fffffffbH
	jmp	SHORT $L2454
$L2457:
; Line 287
	mov	eax, -6					; fffffffaH
$L2454:
; Line 290
	mov	esp, ebp
	pop	ebp
	ret	4
?checkVersion@parserObj@@AAEHPAD@Z ENDP			; parserObj::checkVersion
_requestMsg$ = 8
_this$ = -4
?checkLineBreak@parserObj@@AAEHPAD@Z PROC NEAR		; parserObj::checkLineBreak
; Line 298
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 299
	mov	eax, DWORD PTR _requestMsg$[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 13					; 0000000dH
	jne	SHORT $L2466
	mov	edx, DWORD PTR _requestMsg$[ebp]
	movsx	eax, BYTE PTR [edx+1]
	cmp	eax, 10					; 0000000aH
	jne	SHORT $L2466
; Line 300
	xor	eax, eax
	jmp	SHORT $L2467
$L2466:
; Line 302
	or	eax, -1
$L2467:
; Line 303
	mov	esp, ebp
	pop	ebp
	ret	4
?checkLineBreak@parserObj@@AAEHPAD@Z ENDP		; parserObj::checkLineBreak
_TEXT	ENDS
PUBLIC	?longToStr@parserObj@@AAEHPAKPAD@Z		; parserObj::longToStr
PUBLIC	??0FTPObj@@QAE@XZ				; FTPObj::FTPObj
EXTRN	?getFile@FTPObj@@QAEHPADPAK1@Z:NEAR		; FTPObj::getFile
EXTRN	?AOAStrLenAll@AOAProtected@@QAEHPAD@Z:NEAR	; AOAProtected::AOAStrLenAll
_BSS	SEGMENT
$SG2490	DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG2479	DB	'Transfer-Encoding: chunked', 00H
	ORG $+1
$SG2481	DB	'Content-Length: ', 00H
	ORG $+3
$SG2483	DB	';charset=iso-8859-1', 00H
$SG2485	DB	'Server: DOSC Web Server Ver: 1.0', 00H
	ORG $+3
$SG2487	DB	'Connection: close', 00H
	ORG $+2
$SG2499	DB	'Content-Type: image/bmp', 00H
$SG2506	DB	'Content-Type: image/png', 00H
$SG2513	DB	'Content-Type: image/gif', 00H
$SG2520	DB	'Content-Type: image/jpeg', 00H
	ORG $+3
$SG2527	DB	'Content-Type: application/msword', 00H
	ORG $+3
$SG2534	DB	'Content-Type: application/pdf', 00H
	ORG $+2
$SG2541	DB	'Content-Type: text/plain', 00H
	ORG $+3
$SG2544	DB	'Content-Type: text/html', 00H
$SG2547	DB	'pagenotfound.html', 00H
	ORG $+2
$SG2548	DB	'Content-Type: text/html', 00H
_DATA	ENDS
_TEXT	SEGMENT
_resourceName$ = 8
_cType$ = 12
_responseHeader$ = 16
_headerSize$ = 20
_fileStartAdress$ = 24
_fileSize$ = 28
_this$ = -468
_h1$ = -340
_TEncoding$ = -444
_contentLength$ = -368
_encoding$ = -416
_Server$ = -404
_conn$ = -464
_statusCode$ = -412
_fileSizeStr$ = -16
_lineBreak$ = -408
_retcode$ = -4
_tempsize$ = -20
?createResponse@parserObj@@AAEHPAD00PAJPAK2@Z PROC NEAR	; parserObj::createResponse
; Line 308
	push	ebp
	mov	ebp, esp
	sub	esp, 468				; 000001d4H
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 309
	lea	ecx, DWORD PTR _h1$[ebp]
	call	??0FTPObj@@QAE@XZ			; FTPObj::FTPObj
; Line 311
	mov	ecx, 6
	mov	esi, OFFSET FLAT:$SG2479
	lea	edi, DWORD PTR _TEncoding$[ebp]
	rep movsd
	movsw
	movsb
; Line 312
	mov	eax, DWORD PTR $SG2481
	mov	DWORD PTR _contentLength$[ebp], eax
	mov	ecx, DWORD PTR $SG2481+4
	mov	DWORD PTR _contentLength$[ebp+4], ecx
	mov	edx, DWORD PTR $SG2481+8
	mov	DWORD PTR _contentLength$[ebp+8], edx
	mov	eax, DWORD PTR $SG2481+12
	mov	DWORD PTR _contentLength$[ebp+12], eax
	mov	cl, BYTE PTR $SG2481+16
	mov	BYTE PTR _contentLength$[ebp+16], cl
	xor	edx, edx
	mov	DWORD PTR _contentLength$[ebp+17], edx
	mov	DWORD PTR _contentLength$[ebp+21], edx
	mov	WORD PTR _contentLength$[ebp+25], dx
	mov	BYTE PTR _contentLength$[ebp+27], dl
; Line 313
	mov	DWORD PTR _encoding$[ebp], OFFSET FLAT:$SG2483
; Line 314
	mov	ecx, 8
	mov	esi, OFFSET FLAT:$SG2485
	lea	edi, DWORD PTR _Server$[ebp]
	rep movsd
	movsb
; Line 315
	mov	eax, DWORD PTR $SG2487
	mov	DWORD PTR _conn$[ebp], eax
	mov	ecx, DWORD PTR $SG2487+4
	mov	DWORD PTR _conn$[ebp+4], ecx
	mov	edx, DWORD PTR $SG2487+8
	mov	DWORD PTR _conn$[ebp+8], edx
	mov	eax, DWORD PTR $SG2487+12
	mov	DWORD PTR _conn$[ebp+12], eax
	mov	cx, WORD PTR $SG2487+16
	mov	WORD PTR _conn$[ebp+16], cx
	xor	edx, edx
	mov	WORD PTR _conn$[ebp+18], dx
; Line 318
	mov	al, BYTE PTR $SG2490
	mov	BYTE PTR _fileSizeStr$[ebp], al
	xor	ecx, ecx
	mov	DWORD PTR _fileSizeStr$[ebp+1], ecx
	mov	DWORD PTR _fileSizeStr$[ebp+5], ecx
	mov	BYTE PTR _fileSizeStr$[ebp+9], cl
; Line 320
	mov	BYTE PTR _lineBreak$[ebp], 13		; 0000000dH
; Line 321
	mov	BYTE PTR _lineBreak$[ebp+1], 10		; 0000000aH
; Line 322
	mov	BYTE PTR _lineBreak$[ebp+2], 0
; Line 324
	mov	DWORD PTR _retcode$[ebp], 0
; Line 325
	mov	DWORD PTR _tempsize$[ebp], 0
; Line 328
	push	OFFSET FLAT:?httpHeader@@3PADA		; httpHeader
	mov	edx, DWORD PTR _responseHeader$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcpy@parserObj@@AAEPADPAD0@Z		; parserObj::strcpy
; Line 330
	mov	eax, DWORD PTR _fileSize$[ebp]
	push	eax
	mov	ecx, DWORD PTR _fileStartAdress$[ebp]
	push	ecx
	mov	edx, DWORD PTR _resourceName$[ebp]
	push	edx
	lea	ecx, DWORD PTR _h1$[ebp]
	call	?getFile@FTPObj@@QAEHPADPAK1@Z		; FTPObj::getFile
	mov	DWORD PTR _retcode$[ebp], eax
; Line 332
	cmp	DWORD PTR _retcode$[ebp], 0
	jne	$L2494
; Line 334
	mov	eax, DWORD PTR _cType$[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 98					; 00000062H
	je	SHORT $L2496
	mov	edx, DWORD PTR _cType$[ebp]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, 66					; 00000042H
	jne	$L2495
$L2496:
	mov	ecx, DWORD PTR _cType$[ebp]
	movsx	edx, BYTE PTR [ecx+1]
	cmp	edx, 109				; 0000006dH
	je	SHORT $L2497
	mov	eax, DWORD PTR _cType$[ebp]
	movsx	ecx, BYTE PTR [eax+1]
	cmp	ecx, 77					; 0000004dH
	jne	$L2495
$L2497:
	mov	edx, DWORD PTR _cType$[ebp]
	movsx	eax, BYTE PTR [edx+2]
	cmp	eax, 112				; 00000070H
	je	SHORT $L2498
	mov	ecx, DWORD PTR _cType$[ebp]
	movsx	edx, BYTE PTR [ecx+2]
	cmp	edx, 80					; 00000050H
	jne	$L2495
$L2498:
; Line 337
	lea	eax, DWORD PTR _fileSizeStr$[ebp]
	push	eax
	mov	ecx, DWORD PTR _fileSize$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?longToStr@parserObj@@AAEHPAKPAD@Z	; parserObj::longToStr
; Line 338
	push	OFFSET FLAT:$SG2499
	push	OFFSET FLAT:?contentType@@3PADA		; contentType
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcpy@parserObj@@AAEPADPAD0@Z		; parserObj::strcpy
; Line 339
	mov	DWORD PTR _statusCode$[ebp], OFFSET FLAT:_OK
; Line 340
	mov	edx, DWORD PTR _statusCode$[ebp]
	push	edx
	mov	eax, DWORD PTR _responseHeader$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 341
	lea	ecx, DWORD PTR _lineBreak$[ebp]
	push	ecx
	mov	edx, DWORD PTR _responseHeader$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 344
	lea	eax, DWORD PTR _conn$[ebp]
	push	eax
	mov	ecx, DWORD PTR _responseHeader$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 345
	lea	edx, DWORD PTR _lineBreak$[ebp]
	push	edx
	mov	eax, DWORD PTR _responseHeader$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 346
	push	OFFSET FLAT:?contentType@@3PADA		; contentType
	mov	ecx, DWORD PTR _responseHeader$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 347
	lea	edx, DWORD PTR _lineBreak$[ebp]
	push	edx
	mov	eax, DWORD PTR _responseHeader$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 348
	lea	ecx, DWORD PTR _fileSizeStr$[ebp]
	push	ecx
	lea	edx, DWORD PTR _contentLength$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 349
	lea	eax, DWORD PTR _contentLength$[ebp]
	push	eax
	mov	ecx, DWORD PTR _responseHeader$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 350
	mov	BYTE PTR _contentLength$[ebp+16], 0
; Line 351
	lea	edx, DWORD PTR _lineBreak$[ebp]
	push	edx
	mov	eax, DWORD PTR _responseHeader$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 352
	push	OFFSET FLAT:?acceptRange@@3PADA		; acceptRange
	mov	ecx, DWORD PTR _responseHeader$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 353
	lea	edx, DWORD PTR _lineBreak$[ebp]
	push	edx
	mov	eax, DWORD PTR _responseHeader$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 354
	lea	ecx, DWORD PTR _lineBreak$[ebp]
	push	ecx
	mov	edx, DWORD PTR _responseHeader$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 356
	jmp	$L2543
$L2495:
	mov	eax, DWORD PTR _cType$[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 112				; 00000070H
	je	SHORT $L2503
	mov	edx, DWORD PTR _cType$[ebp]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, 80					; 00000050H
	jne	$L2502
$L2503:
	mov	ecx, DWORD PTR _cType$[ebp]
	movsx	edx, BYTE PTR [ecx+1]
	cmp	edx, 110				; 0000006eH
	je	SHORT $L2504
	mov	eax, DWORD PTR _cType$[ebp]
	movsx	ecx, BYTE PTR [eax+1]
	cmp	ecx, 78					; 0000004eH
	jne	$L2502
$L2504:
	mov	edx, DWORD PTR _cType$[ebp]
	movsx	eax, BYTE PTR [edx+2]
	cmp	eax, 103				; 00000067H
	je	SHORT $L2505
	mov	ecx, DWORD PTR _cType$[ebp]
	movsx	edx, BYTE PTR [ecx+2]
	cmp	edx, 71					; 00000047H
	jne	$L2502
$L2505:
; Line 358
	lea	eax, DWORD PTR _fileSizeStr$[ebp]
	push	eax
	mov	ecx, DWORD PTR _fileSize$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?longToStr@parserObj@@AAEHPAKPAD@Z	; parserObj::longToStr
; Line 359
	push	OFFSET FLAT:$SG2506
	push	OFFSET FLAT:?contentType@@3PADA		; contentType
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcpy@parserObj@@AAEPADPAD0@Z		; parserObj::strcpy
; Line 360
	mov	DWORD PTR _statusCode$[ebp], OFFSET FLAT:_OK
; Line 361
	mov	edx, DWORD PTR _statusCode$[ebp]
	push	edx
	mov	eax, DWORD PTR _responseHeader$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 362
	lea	ecx, DWORD PTR _lineBreak$[ebp]
	push	ecx
	mov	edx, DWORD PTR _responseHeader$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 365
	lea	eax, DWORD PTR _conn$[ebp]
	push	eax
	mov	ecx, DWORD PTR _responseHeader$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 366
	lea	edx, DWORD PTR _lineBreak$[ebp]
	push	edx
	mov	eax, DWORD PTR _responseHeader$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 367
	push	OFFSET FLAT:?contentType@@3PADA		; contentType
	mov	ecx, DWORD PTR _responseHeader$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 369
	lea	edx, DWORD PTR _lineBreak$[ebp]
	push	edx
	mov	eax, DWORD PTR _responseHeader$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 370
	lea	ecx, DWORD PTR _fileSizeStr$[ebp]
	push	ecx
	lea	edx, DWORD PTR _contentLength$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 371
	lea	eax, DWORD PTR _contentLength$[ebp]
	push	eax
	mov	ecx, DWORD PTR _responseHeader$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 372
	mov	BYTE PTR _contentLength$[ebp+16], 0
; Line 373
	lea	edx, DWORD PTR _lineBreak$[ebp]
	push	edx
	mov	eax, DWORD PTR _responseHeader$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 374
	push	OFFSET FLAT:?acceptRange@@3PADA		; acceptRange
	mov	ecx, DWORD PTR _responseHeader$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 375
	lea	edx, DWORD PTR _lineBreak$[ebp]
	push	edx
	mov	eax, DWORD PTR _responseHeader$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 376
	lea	ecx, DWORD PTR _lineBreak$[ebp]
	push	ecx
	mov	edx, DWORD PTR _responseHeader$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 378
	jmp	$L2543
$L2502:
	mov	eax, DWORD PTR _cType$[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 103				; 00000067H
	je	SHORT $L2510
	mov	edx, DWORD PTR _cType$[ebp]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, 71					; 00000047H
	jne	$L2509
$L2510:
	mov	ecx, DWORD PTR _cType$[ebp]
	movsx	edx, BYTE PTR [ecx+1]
	cmp	edx, 105				; 00000069H
	je	SHORT $L2511
	mov	eax, DWORD PTR _cType$[ebp]
	movsx	ecx, BYTE PTR [eax+1]
	cmp	ecx, 73					; 00000049H
	jne	$L2509
$L2511:
	mov	edx, DWORD PTR _cType$[ebp]
	movsx	eax, BYTE PTR [edx+2]
	cmp	eax, 102				; 00000066H
	je	SHORT $L2512
	mov	ecx, DWORD PTR _cType$[ebp]
	movsx	edx, BYTE PTR [ecx+2]
	cmp	edx, 70					; 00000046H
	jne	$L2509
$L2512:
; Line 380
	lea	eax, DWORD PTR _fileSizeStr$[ebp]
	push	eax
	mov	ecx, DWORD PTR _fileSize$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?longToStr@parserObj@@AAEHPAKPAD@Z	; parserObj::longToStr
; Line 381
	push	OFFSET FLAT:$SG2513
	push	OFFSET FLAT:?contentType@@3PADA		; contentType
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcpy@parserObj@@AAEPADPAD0@Z		; parserObj::strcpy
; Line 382
	mov	DWORD PTR _statusCode$[ebp], OFFSET FLAT:_OK
; Line 383
	mov	edx, DWORD PTR _statusCode$[ebp]
	push	edx
	mov	eax, DWORD PTR _responseHeader$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 384
	lea	ecx, DWORD PTR _lineBreak$[ebp]
	push	ecx
	mov	edx, DWORD PTR _responseHeader$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 387
	lea	eax, DWORD PTR _conn$[ebp]
	push	eax
	mov	ecx, DWORD PTR _responseHeader$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 388
	lea	edx, DWORD PTR _lineBreak$[ebp]
	push	edx
	mov	eax, DWORD PTR _responseHeader$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 389
	push	OFFSET FLAT:?contentType@@3PADA		; contentType
	mov	ecx, DWORD PTR _responseHeader$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 390
	lea	edx, DWORD PTR _lineBreak$[ebp]
	push	edx
	mov	eax, DWORD PTR _responseHeader$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 391
	lea	ecx, DWORD PTR _fileSizeStr$[ebp]
	push	ecx
	lea	edx, DWORD PTR _contentLength$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 392
	lea	eax, DWORD PTR _contentLength$[ebp]
	push	eax
	mov	ecx, DWORD PTR _responseHeader$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 393
	mov	BYTE PTR _contentLength$[ebp+16], 0
; Line 394
	lea	edx, DWORD PTR _lineBreak$[ebp]
	push	edx
	mov	eax, DWORD PTR _responseHeader$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 395
	push	OFFSET FLAT:?acceptRange@@3PADA		; acceptRange
	mov	ecx, DWORD PTR _responseHeader$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 396
	lea	edx, DWORD PTR _lineBreak$[ebp]
	push	edx
	mov	eax, DWORD PTR _responseHeader$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 397
	lea	ecx, DWORD PTR _lineBreak$[ebp]
	push	ecx
	mov	edx, DWORD PTR _responseHeader$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 399
	jmp	$L2543
$L2509:
; Line 400
	mov	eax, DWORD PTR _cType$[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 106				; 0000006aH
	je	SHORT $L2517
	mov	edx, DWORD PTR _cType$[ebp]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, 74					; 0000004aH
	jne	$L2516
$L2517:
	mov	ecx, DWORD PTR _cType$[ebp]
	movsx	edx, BYTE PTR [ecx+1]
	cmp	edx, 112				; 00000070H
	je	SHORT $L2518
	mov	eax, DWORD PTR _cType$[ebp]
	movsx	ecx, BYTE PTR [eax+1]
	cmp	ecx, 80					; 00000050H
	jne	$L2516
$L2518:
	mov	edx, DWORD PTR _cType$[ebp]
	movsx	eax, BYTE PTR [edx+2]
	cmp	eax, 103				; 00000067H
	je	SHORT $L2519
	mov	ecx, DWORD PTR _cType$[ebp]
	movsx	edx, BYTE PTR [ecx+2]
	cmp	edx, 71					; 00000047H
	jne	$L2516
$L2519:
; Line 402
	lea	eax, DWORD PTR _fileSizeStr$[ebp]
	push	eax
	mov	ecx, DWORD PTR _fileSize$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?longToStr@parserObj@@AAEHPAKPAD@Z	; parserObj::longToStr
; Line 403
	push	OFFSET FLAT:$SG2520
	push	OFFSET FLAT:?contentType@@3PADA		; contentType
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcpy@parserObj@@AAEPADPAD0@Z		; parserObj::strcpy
; Line 404
	mov	DWORD PTR _statusCode$[ebp], OFFSET FLAT:_OK
; Line 405
	mov	edx, DWORD PTR _statusCode$[ebp]
	push	edx
	mov	eax, DWORD PTR _responseHeader$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 406
	lea	ecx, DWORD PTR _lineBreak$[ebp]
	push	ecx
	mov	edx, DWORD PTR _responseHeader$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 409
	lea	eax, DWORD PTR _conn$[ebp]
	push	eax
	mov	ecx, DWORD PTR _responseHeader$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 410
	lea	edx, DWORD PTR _lineBreak$[ebp]
	push	edx
	mov	eax, DWORD PTR _responseHeader$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 411
	push	OFFSET FLAT:?contentType@@3PADA		; contentType
	mov	ecx, DWORD PTR _responseHeader$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 412
	lea	edx, DWORD PTR _lineBreak$[ebp]
	push	edx
	mov	eax, DWORD PTR _responseHeader$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 413
	lea	ecx, DWORD PTR _fileSizeStr$[ebp]
	push	ecx
	lea	edx, DWORD PTR _contentLength$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 414
	lea	eax, DWORD PTR _contentLength$[ebp]
	push	eax
	mov	ecx, DWORD PTR _responseHeader$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 415
	mov	BYTE PTR _contentLength$[ebp+16], 0
; Line 416
	lea	edx, DWORD PTR _lineBreak$[ebp]
	push	edx
	mov	eax, DWORD PTR _responseHeader$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 417
	push	OFFSET FLAT:?acceptRange@@3PADA		; acceptRange
	mov	ecx, DWORD PTR _responseHeader$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 418
	lea	edx, DWORD PTR _lineBreak$[ebp]
	push	edx
	mov	eax, DWORD PTR _responseHeader$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 419
	lea	ecx, DWORD PTR _lineBreak$[ebp]
	push	ecx
	mov	edx, DWORD PTR _responseHeader$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 421
	jmp	$L2543
$L2516:
; Line 422
	mov	eax, DWORD PTR _cType$[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 100				; 00000064H
	je	SHORT $L2524
	mov	edx, DWORD PTR _cType$[ebp]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, 68					; 00000044H
	jne	$L2523
$L2524:
	mov	ecx, DWORD PTR _cType$[ebp]
	movsx	edx, BYTE PTR [ecx+1]
	cmp	edx, 111				; 0000006fH
	je	SHORT $L2525
	mov	eax, DWORD PTR _cType$[ebp]
	movsx	ecx, BYTE PTR [eax+1]
	cmp	ecx, 79					; 0000004fH
	jne	$L2523
$L2525:
	mov	edx, DWORD PTR _cType$[ebp]
	movsx	eax, BYTE PTR [edx+2]
	cmp	eax, 99					; 00000063H
	je	SHORT $L2526
	mov	ecx, DWORD PTR _cType$[ebp]
	movsx	edx, BYTE PTR [ecx+2]
	cmp	edx, 67					; 00000043H
	jne	$L2523
$L2526:
; Line 424
	lea	eax, DWORD PTR _fileSizeStr$[ebp]
	push	eax
	mov	ecx, DWORD PTR _fileSize$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?longToStr@parserObj@@AAEHPAKPAD@Z	; parserObj::longToStr
; Line 425
	push	OFFSET FLAT:$SG2527
	push	OFFSET FLAT:?contentType@@3PADA		; contentType
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcpy@parserObj@@AAEPADPAD0@Z		; parserObj::strcpy
; Line 426
	mov	DWORD PTR _statusCode$[ebp], OFFSET FLAT:_OK
; Line 427
	mov	edx, DWORD PTR _statusCode$[ebp]
	push	edx
	mov	eax, DWORD PTR _responseHeader$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 428
	lea	ecx, DWORD PTR _lineBreak$[ebp]
	push	ecx
	mov	edx, DWORD PTR _responseHeader$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 431
	lea	eax, DWORD PTR _conn$[ebp]
	push	eax
	mov	ecx, DWORD PTR _responseHeader$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 432
	lea	edx, DWORD PTR _lineBreak$[ebp]
	push	edx
	mov	eax, DWORD PTR _responseHeader$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 433
	push	OFFSET FLAT:?contentType@@3PADA		; contentType
	mov	ecx, DWORD PTR _responseHeader$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 434
	lea	edx, DWORD PTR _lineBreak$[ebp]
	push	edx
	mov	eax, DWORD PTR _responseHeader$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 435
	lea	ecx, DWORD PTR _fileSizeStr$[ebp]
	push	ecx
	lea	edx, DWORD PTR _contentLength$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 436
	lea	eax, DWORD PTR _contentLength$[ebp]
	push	eax
	mov	ecx, DWORD PTR _responseHeader$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 437
	mov	BYTE PTR _contentLength$[ebp+16], 0
; Line 438
	lea	edx, DWORD PTR _lineBreak$[ebp]
	push	edx
	mov	eax, DWORD PTR _responseHeader$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 439
	push	OFFSET FLAT:?acceptRange@@3PADA		; acceptRange
	mov	ecx, DWORD PTR _responseHeader$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 440
	lea	edx, DWORD PTR _lineBreak$[ebp]
	push	edx
	mov	eax, DWORD PTR _responseHeader$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 441
	lea	ecx, DWORD PTR _lineBreak$[ebp]
	push	ecx
	mov	edx, DWORD PTR _responseHeader$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 443
	jmp	$L2543
$L2523:
	mov	eax, DWORD PTR _cType$[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 112				; 00000070H
	je	SHORT $L2531
	mov	edx, DWORD PTR _cType$[ebp]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, 80					; 00000050H
	jne	$L2530
$L2531:
	mov	ecx, DWORD PTR _cType$[ebp]
	movsx	edx, BYTE PTR [ecx+1]
	cmp	edx, 100				; 00000064H
	je	SHORT $L2532
	mov	eax, DWORD PTR _cType$[ebp]
	movsx	ecx, BYTE PTR [eax+1]
	cmp	ecx, 68					; 00000044H
	jne	$L2530
$L2532:
	mov	edx, DWORD PTR _cType$[ebp]
	movsx	eax, BYTE PTR [edx+2]
	cmp	eax, 102				; 00000066H
	je	SHORT $L2533
	mov	ecx, DWORD PTR _cType$[ebp]
	movsx	edx, BYTE PTR [ecx+2]
	cmp	edx, 70					; 00000046H
	jne	$L2530
$L2533:
; Line 445
	lea	eax, DWORD PTR _fileSizeStr$[ebp]
	push	eax
	mov	ecx, DWORD PTR _fileSize$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?longToStr@parserObj@@AAEHPAKPAD@Z	; parserObj::longToStr
; Line 446
	push	OFFSET FLAT:$SG2534
	push	OFFSET FLAT:?contentType@@3PADA		; contentType
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcpy@parserObj@@AAEPADPAD0@Z		; parserObj::strcpy
; Line 447
	mov	DWORD PTR _statusCode$[ebp], OFFSET FLAT:_OK
; Line 448
	mov	edx, DWORD PTR _statusCode$[ebp]
	push	edx
	mov	eax, DWORD PTR _responseHeader$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 449
	lea	ecx, DWORD PTR _lineBreak$[ebp]
	push	ecx
	mov	edx, DWORD PTR _responseHeader$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 452
	lea	eax, DWORD PTR _conn$[ebp]
	push	eax
	mov	ecx, DWORD PTR _responseHeader$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 453
	lea	edx, DWORD PTR _lineBreak$[ebp]
	push	edx
	mov	eax, DWORD PTR _responseHeader$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 454
	push	OFFSET FLAT:?contentType@@3PADA		; contentType
	mov	ecx, DWORD PTR _responseHeader$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 455
	lea	edx, DWORD PTR _lineBreak$[ebp]
	push	edx
	mov	eax, DWORD PTR _responseHeader$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 456
	lea	ecx, DWORD PTR _fileSizeStr$[ebp]
	push	ecx
	lea	edx, DWORD PTR _contentLength$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 457
	lea	eax, DWORD PTR _contentLength$[ebp]
	push	eax
	mov	ecx, DWORD PTR _responseHeader$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 458
	mov	BYTE PTR _contentLength$[ebp+16], 0
; Line 459
	lea	edx, DWORD PTR _lineBreak$[ebp]
	push	edx
	mov	eax, DWORD PTR _responseHeader$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 460
	push	OFFSET FLAT:?acceptRange@@3PADA		; acceptRange
	mov	ecx, DWORD PTR _responseHeader$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 461
	lea	edx, DWORD PTR _lineBreak$[ebp]
	push	edx
	mov	eax, DWORD PTR _responseHeader$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 462
	lea	ecx, DWORD PTR _lineBreak$[ebp]
	push	ecx
	mov	edx, DWORD PTR _responseHeader$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 464
	jmp	$L2543
$L2530:
	mov	eax, DWORD PTR _cType$[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 116				; 00000074H
	je	SHORT $L2538
	mov	edx, DWORD PTR _cType$[ebp]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, 84					; 00000054H
	jne	$L2537
$L2538:
	mov	ecx, DWORD PTR _cType$[ebp]
	movsx	edx, BYTE PTR [ecx+1]
	cmp	edx, 120				; 00000078H
	je	SHORT $L2539
	mov	eax, DWORD PTR _cType$[ebp]
	movsx	ecx, BYTE PTR [eax+1]
	cmp	ecx, 88					; 00000058H
	jne	$L2537
$L2539:
	mov	edx, DWORD PTR _cType$[ebp]
	movsx	eax, BYTE PTR [edx+2]
	cmp	eax, 116				; 00000074H
	je	SHORT $L2540
	mov	ecx, DWORD PTR _cType$[ebp]
	movsx	edx, BYTE PTR [ecx+2]
	cmp	edx, 84					; 00000054H
	jne	$L2537
$L2540:
; Line 466
	lea	eax, DWORD PTR _fileSizeStr$[ebp]
	push	eax
	mov	ecx, DWORD PTR _fileSize$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?longToStr@parserObj@@AAEHPAKPAD@Z	; parserObj::longToStr
; Line 467
	push	OFFSET FLAT:$SG2541
	push	OFFSET FLAT:?contentType@@3PADA		; contentType
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcpy@parserObj@@AAEPADPAD0@Z		; parserObj::strcpy
; Line 468
	mov	DWORD PTR _statusCode$[ebp], OFFSET FLAT:_OK
; Line 469
	mov	edx, DWORD PTR _statusCode$[ebp]
	push	edx
	mov	eax, DWORD PTR _responseHeader$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 470
	lea	ecx, DWORD PTR _lineBreak$[ebp]
	push	ecx
	mov	edx, DWORD PTR _responseHeader$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 473
	lea	eax, DWORD PTR _conn$[ebp]
	push	eax
	mov	ecx, DWORD PTR _responseHeader$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 474
	lea	edx, DWORD PTR _lineBreak$[ebp]
	push	edx
	mov	eax, DWORD PTR _responseHeader$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 475
	push	OFFSET FLAT:?contentType@@3PADA		; contentType
	mov	ecx, DWORD PTR _responseHeader$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 476
	lea	edx, DWORD PTR _lineBreak$[ebp]
	push	edx
	mov	eax, DWORD PTR _responseHeader$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 477
	lea	ecx, DWORD PTR _fileSizeStr$[ebp]
	push	ecx
	lea	edx, DWORD PTR _contentLength$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 478
	lea	eax, DWORD PTR _contentLength$[ebp]
	push	eax
	mov	ecx, DWORD PTR _responseHeader$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 479
	mov	BYTE PTR _contentLength$[ebp], 0
; Line 480
	lea	edx, DWORD PTR _lineBreak$[ebp]
	push	edx
	mov	eax, DWORD PTR _responseHeader$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 481
	push	OFFSET FLAT:?acceptRange@@3PADA		; acceptRange
	mov	ecx, DWORD PTR _responseHeader$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 482
	lea	edx, DWORD PTR _lineBreak$[ebp]
	push	edx
	mov	eax, DWORD PTR _responseHeader$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 483
	lea	ecx, DWORD PTR _lineBreak$[ebp]
	push	ecx
	mov	edx, DWORD PTR _responseHeader$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 485
	jmp	$L2543
$L2537:
; Line 487
	lea	eax, DWORD PTR _fileSizeStr$[ebp]
	push	eax
	mov	ecx, DWORD PTR _fileSize$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?longToStr@parserObj@@AAEHPAKPAD@Z	; parserObj::longToStr
; Line 488
	push	OFFSET FLAT:$SG2544
	push	OFFSET FLAT:?contentType@@3PADA		; contentType
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcpy@parserObj@@AAEPADPAD0@Z		; parserObj::strcpy
; Line 489
	mov	DWORD PTR _statusCode$[ebp], OFFSET FLAT:_pageFound
; Line 490
	mov	edx, DWORD PTR _statusCode$[ebp]
	push	edx
	mov	eax, DWORD PTR _responseHeader$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 491
	lea	ecx, DWORD PTR _lineBreak$[ebp]
	push	ecx
	mov	edx, DWORD PTR _responseHeader$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 494
	lea	eax, DWORD PTR _Server$[ebp]
	push	eax
	mov	ecx, DWORD PTR _responseHeader$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 495
	lea	edx, DWORD PTR _lineBreak$[ebp]
	push	edx
	mov	eax, DWORD PTR _responseHeader$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 496
	lea	ecx, DWORD PTR _conn$[ebp]
	push	ecx
	mov	edx, DWORD PTR _responseHeader$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 497
	lea	eax, DWORD PTR _lineBreak$[ebp]
	push	eax
	mov	ecx, DWORD PTR _responseHeader$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 498
	mov	edx, DWORD PTR _encoding$[ebp]
	push	edx
	push	OFFSET FLAT:?contentType@@3PADA		; contentType
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 499
	push	OFFSET FLAT:?contentType@@3PADA		; contentType
	mov	eax, DWORD PTR _responseHeader$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 500
	lea	ecx, DWORD PTR _lineBreak$[ebp]
	push	ecx
	mov	edx, DWORD PTR _responseHeader$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 501
	lea	eax, DWORD PTR _fileSizeStr$[ebp]
	push	eax
	lea	ecx, DWORD PTR _contentLength$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 502
	lea	edx, DWORD PTR _contentLength$[ebp]
	push	edx
	mov	eax, DWORD PTR _responseHeader$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 503
	lea	ecx, DWORD PTR _lineBreak$[ebp]
	push	ecx
	mov	edx, DWORD PTR _responseHeader$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 504
	lea	eax, DWORD PTR _lineBreak$[ebp]
	push	eax
	mov	ecx, DWORD PTR _responseHeader$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
$L2543:
; Line 508
	jmp	$L2546
$L2494:
; Line 511
	push	OFFSET FLAT:$SG2547
	mov	edx, DWORD PTR _resourceName$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcpy@parserObj@@AAEPADPAD0@Z		; parserObj::strcpy
; Line 512
	mov	eax, DWORD PTR _resourceName$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAStrLen@AOAProtected@@QAEHPAD@Z	; AOAProtected::AOAStrLen
	mov	DWORD PTR _tempsize$[ebp], eax
; Line 513
	mov	ecx, DWORD PTR _resourceName$[ebp]
	add	ecx, DWORD PTR _tempsize$[ebp]
	mov	BYTE PTR [ecx], 0
; Line 516
	mov	edx, DWORD PTR _fileSize$[ebp]
	push	edx
	mov	eax, DWORD PTR _fileStartAdress$[ebp]
	push	eax
	mov	ecx, DWORD PTR _resourceName$[ebp]
	push	ecx
	lea	ecx, DWORD PTR _h1$[ebp]
	call	?getFile@FTPObj@@QAEHPADPAK1@Z		; FTPObj::getFile
	mov	DWORD PTR _retcode$[ebp], eax
; Line 518
	lea	edx, DWORD PTR _fileSizeStr$[ebp]
	push	edx
	mov	eax, DWORD PTR _fileSize$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?longToStr@parserObj@@AAEHPAKPAD@Z	; parserObj::longToStr
; Line 519
	push	OFFSET FLAT:$SG2548
	push	OFFSET FLAT:?contentType@@3PADA		; contentType
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcpy@parserObj@@AAEPADPAD0@Z		; parserObj::strcpy
; Line 520
	mov	DWORD PTR _statusCode$[ebp], OFFSET FLAT:_pageFound
; Line 521
	mov	ecx, DWORD PTR _statusCode$[ebp]
	push	ecx
	mov	edx, DWORD PTR _responseHeader$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 522
	lea	eax, DWORD PTR _lineBreak$[ebp]
	push	eax
	mov	ecx, DWORD PTR _responseHeader$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 525
	lea	edx, DWORD PTR _Server$[ebp]
	push	edx
	mov	eax, DWORD PTR _responseHeader$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 526
	lea	ecx, DWORD PTR _lineBreak$[ebp]
	push	ecx
	mov	edx, DWORD PTR _responseHeader$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 527
	lea	eax, DWORD PTR _conn$[ebp]
	push	eax
	mov	ecx, DWORD PTR _responseHeader$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 528
	lea	edx, DWORD PTR _lineBreak$[ebp]
	push	edx
	mov	eax, DWORD PTR _responseHeader$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 529
	mov	ecx, DWORD PTR _encoding$[ebp]
	push	ecx
	push	OFFSET FLAT:?contentType@@3PADA		; contentType
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 530
	push	OFFSET FLAT:?contentType@@3PADA		; contentType
	mov	edx, DWORD PTR _responseHeader$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 531
	lea	eax, DWORD PTR _lineBreak$[ebp]
	push	eax
	mov	ecx, DWORD PTR _responseHeader$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 532
	lea	edx, DWORD PTR _fileSizeStr$[ebp]
	push	edx
	lea	eax, DWORD PTR _contentLength$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 533
	lea	ecx, DWORD PTR _contentLength$[ebp]
	push	ecx
	mov	edx, DWORD PTR _responseHeader$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 534
	lea	eax, DWORD PTR _lineBreak$[ebp]
	push	eax
	mov	ecx, DWORD PTR _responseHeader$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
; Line 535
	lea	edx, DWORD PTR _lineBreak$[ebp]
	push	edx
	mov	eax, DWORD PTR _responseHeader$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?strcat@parserObj@@AAEXPAD0@Z		; parserObj::strcat
$L2546:
; Line 538
	mov	ecx, DWORD PTR _responseHeader$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAStrLenAll@AOAProtected@@QAEHPAD@Z	; AOAProtected::AOAStrLenAll
	mov	edx, DWORD PTR _headerSize$[ebp]
	mov	DWORD PTR [edx], eax
; Line 539
	xor	eax, eax
; Line 540
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
; Line 547
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	esi
	mov	DWORD PTR _this$[ebp], ecx
; Line 548
	mov	DWORD PTR _i$[ebp], 0
; Line 549
	lea	ecx, DWORD PTR _io$[ebp]
	call	??0AOAProtected@@QAE@XZ			; AOAProtected::AOAProtected
; Line 550
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
	je	SHORT $L2561
; Line 552
	or	eax, -1
	jmp	$L2558
$L2561:
; Line 555
	mov	edx, DWORD PTR _D_Str$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	jne	SHORT $L2565
	mov	ecx, DWORD PTR _S_Str$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	$L2564
$L2565:
; Line 557
	mov	eax, DWORD PTR _D_Str$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	movsx	ecx, BYTE PTR [eax]
	mov	edx, DWORD PTR _S_Str$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR [edx]
	cmp	ecx, eax
	jne	SHORT $L2566
; Line 559
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
; Line 561
	jmp	SHORT $L2574
$L2566:
	mov	edx, DWORD PTR _D_Str$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, 47					; 0000002fH
	jne	SHORT $L2568
; Line 564
	or	eax, -1
	jmp	SHORT $L2558
$L2568:
; Line 567
	mov	ecx, DWORD PTR _D_Str$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, 92					; 0000005cH
	jne	SHORT $L2571
; Line 569
	mov	eax, DWORD PTR _S_Str$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 47					; 0000002fH
	je	SHORT $L2572
; Line 570
	or	eax, -1
	jmp	SHORT $L2558
$L2572:
; Line 571
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
; Line 574
	jmp	SHORT $L2574
$L2571:
	mov	eax, DWORD PTR _D_Str$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	movsx	ecx, BYTE PTR [eax]
	mov	edx, DWORD PTR _S_Str$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR [edx]
	cmp	ecx, eax
	je	SHORT $L2574
; Line 576
	or	eax, -1
	jmp	SHORT $L2558
$L2574:
; Line 579
	jmp	$L2561
$L2564:
; Line 580
	mov	ecx, DWORD PTR _D_Str$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	jne	SHORT $L2575
	mov	eax, DWORD PTR _S_Str$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	jne	SHORT $L2575
; Line 582
	xor	eax, eax
	jmp	SHORT $L2558
$L2575:
; Line 586
	or	eax, -1
$L2558:
; Line 589
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
; Line 592
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 593
	mov	DWORD PTR _i$[ebp], 0
; Line 594
	mov	DWORD PTR _D_Full_flag$[ebp], 0
; Line 595
	cmp	DWORD PTR _D_Size$[ebp], 2
	jge	SHORT $L2588
; Line 597
	cmp	DWORD PTR _D_Size$[ebp], 1
	jge	SHORT $L2587
; Line 598
	or	eax, -1
	jmp	$L2583
$L2587:
; Line 599
	cmp	DWORD PTR _D_Size$[ebp], 1
	jne	SHORT $L2588
; Line 601
	mov	eax, DWORD PTR _D_Str$[ebp]
	mov	BYTE PTR [eax], 0
; Line 602
	xor	eax, eax
	jmp	$L2583
$L2588:
; Line 605
	cmp	DWORD PTR _S_Size$[ebp], 2
	jge	SHORT $L2589
; Line 607
	mov	ecx, DWORD PTR _D_Str$[ebp]
	mov	BYTE PTR [ecx], 0
; Line 608
	xor	eax, eax
	jmp	SHORT $L2583
$L2589:
; Line 610
	mov	edx, DWORD PTR _S_Str$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L2592
; Line 612
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _D_Size$[ebp]
	jge	SHORT $L2593
; Line 614
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _S_Size$[ebp]
	jge	SHORT $L2594
; Line 615
	mov	eax, DWORD PTR _D_Str$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _S_Str$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	dl, BYTE PTR [ecx]
	mov	BYTE PTR [eax], dl
; Line 616
	jmp	SHORT $L2595
$L2594:
; Line 618
	mov	eax, DWORD PTR _D_Str$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	mov	BYTE PTR [eax], 0
; Line 619
	xor	eax, eax
	jmp	SHORT $L2583
$L2595:
; Line 622
	jmp	SHORT $L2596
$L2593:
; Line 624
	mov	ecx, DWORD PTR _D_Str$[ebp]
	add	ecx, DWORD PTR _D_Size$[ebp]
	mov	BYTE PTR [ecx-1], 0
; Line 625
	xor	eax, eax
	jmp	SHORT $L2583
$L2596:
; Line 627
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
; Line 628
	jmp	SHORT $L2589
$L2592:
; Line 629
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _D_Size$[ebp]
	jge	SHORT $L2597
; Line 631
	mov	ecx, DWORD PTR _D_Str$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	BYTE PTR [ecx], 0
; Line 633
	jmp	SHORT $L2598
$L2597:
; Line 635
	mov	edx, DWORD PTR _D_Str$[ebp]
	add	edx, DWORD PTR _D_Size$[ebp]
	mov	BYTE PTR [edx-1], 0
$L2598:
; Line 637
	xor	eax, eax
$L2583:
; Line 638
	mov	esp, ebp
	pop	ebp
	ret	16					; 00000010H
?sstrcpy@parserObj@@AAEHPADH0H@Z ENDP			; parserObj::sstrcpy
_str$ = 8
_this$ = -8
_len$ = -4
?sstrlen@parserObj@@AAEHPAD@Z PROC NEAR			; parserObj::sstrlen
; Line 641
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 643
	mov	DWORD PTR _len$[ebp], 0
$L2605:
; Line 645
	mov	eax, DWORD PTR _str$[ebp]
	add	eax, DWORD PTR _len$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L2606
; Line 647
	mov	edx, DWORD PTR _len$[ebp]
	add	edx, 1
	mov	DWORD PTR _len$[ebp], edx
; Line 648
	jmp	SHORT $L2605
$L2606:
; Line 649
	mov	eax, DWORD PTR _len$[ebp]
; Line 650
	mov	esp, ebp
	pop	ebp
	ret	4
?sstrlen@parserObj@@AAEHPAD@Z ENDP			; parserObj::sstrlen
_string1$ = 8
_string2$ = 12
_this$ = -8
_i$ = -4
?strcpy@parserObj@@AAEPADPAD0@Z PROC NEAR		; parserObj::strcpy
; Line 652
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 653
	mov	DWORD PTR _i$[ebp], 0
$L2614:
; Line 654
	mov	eax, DWORD PTR _string2$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L2615
; Line 656
	mov	edx, DWORD PTR _string1$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _string2$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	mov	cl, BYTE PTR [eax]
	mov	BYTE PTR [edx], cl
; Line 657
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
; Line 658
	jmp	SHORT $L2614
$L2615:
; Line 659
	mov	eax, DWORD PTR _string1$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	mov	BYTE PTR [eax], 0
; Line 661
	mov	eax, DWORD PTR _string1$[ebp]
; Line 662
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
; Line 665
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 667
	mov	DWORD PTR _i$[ebp], 0
; Line 668
	mov	DWORD PTR _j$[ebp], 0
$L2624:
; Line 669
	mov	eax, DWORD PTR _string1$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L2625
; Line 671
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
; Line 672
	jmp	SHORT $L2624
$L2625:
; Line 675
	mov	eax, DWORD PTR _string2$[ebp]
	add	eax, DWORD PTR _j$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L2628
; Line 677
	mov	edx, DWORD PTR _string1$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _string2$[ebp]
	add	eax, DWORD PTR _j$[ebp]
	mov	cl, BYTE PTR [eax]
	mov	BYTE PTR [edx], cl
; Line 678
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
; Line 679
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	DWORD PTR _j$[ebp], eax
; Line 680
	jmp	SHORT $L2625
$L2628:
; Line 681
	mov	ecx, DWORD PTR _string1$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _string2$[ebp]
	add	edx, DWORD PTR _j$[ebp]
	mov	al, BYTE PTR [edx]
	mov	BYTE PTR [ecx], al
; Line 682
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
; Line 686
	push	ebp
	mov	ebp, esp
	sub	esp, 28					; 0000001cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 689
	mov	eax, DWORD PTR _input$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _temp1$[ebp], ecx
; Line 690
	mov	DWORD PTR _i$[ebp], 0
	mov	DWORD PTR _j$[ebp], 0
$L2639:
; Line 692
	cmp	DWORD PTR _temp1$[ebp], 9
	jbe	SHORT $L2640
; Line 694
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
; Line 696
	mov	eax, DWORD PTR _temp1$[ebp]
	xor	edx, edx
	mov	ecx, 10					; 0000000aH
	div	ecx
	mov	DWORD PTR _temp1$[ebp], eax
; Line 697
	jmp	SHORT $L2639
$L2640:
; Line 698
	mov	edx, DWORD PTR _temp1$[ebp]
	add	edx, 48					; 00000030H
	mov	eax, DWORD PTR _i$[ebp]
	mov	BYTE PTR _temp$[ebp+eax], dl
; Line 700
	mov	DWORD PTR _j$[ebp], 0
$L2642:
; Line 702
	mov	ecx, DWORD PTR _i$[ebp]
	movsx	edx, BYTE PTR _temp$[ebp+ecx]
	mov	eax, DWORD PTR _i$[ebp]
	sub	eax, 1
	mov	DWORD PTR _i$[ebp], eax
	cmp	edx, 48					; 00000030H
	jne	SHORT $L2643
	jmp	SHORT $L2642
$L2643:
; Line 704
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L2645:
; Line 705
	cmp	DWORD PTR _i$[ebp], 0
	jl	SHORT $L2646
; Line 707
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
; Line 708
	jmp	SHORT $L2645
$L2646:
; Line 709
	mov	ecx, DWORD PTR _output$[ebp]
	add	ecx, DWORD PTR _j$[ebp]
	mov	BYTE PTR [ecx], 0
; Line 710
	xor	eax, eax
; Line 711
	mov	esp, ebp
	pop	ebp
	ret	8
?longToStr@parserObj@@AAEHPAKPAD@Z ENDP			; parserObj::longToStr
_TEXT	ENDS
END
