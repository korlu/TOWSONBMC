	TITLE	AFTP.c
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
PUBLIC	_fileNumber
PUBLIC	_nextSeq
PUBLIC	_totalFiles
PUBLIC	_IP
PUBLIC	_TPACK
PUBLIC	_LPACK
_DATA	SEGMENT
COMM	_File:BYTE:014820H
_DATA	ENDS
_BSS	SEGMENT
_fileNumber DD	01H DUP (?)
_nextSeq DD	01H DUP (?)
_totalFiles DD	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
COMM	_rdFile:DWORD
_DATA	ENDS
_BSS	SEGMENT
_IP	DB	014H DUP (?)
_TPACK	DD	01H DUP (?)
_LPACK	DD	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
COMM	_startTime:DWORD
COMM	_endTime:DWORD
COMM	_dif:QWORD
COMM	_min:DWORD
COMM	_sec:DWORD
_DATA	ENDS
PUBLIC	_main
PUBLIC	_Init
PUBLIC	_Protocol
PUBLIC	_Create102
PUBLIC	_Create201
PUBLIC	__real@8@4004f000000000000000
EXTRN	_exit:NEAR
EXTRN	__iob:BYTE
EXTRN	_fclose:NEAR
EXTRN	_getch:NEAR
EXTRN	_fopen:NEAR
EXTRN	_fprintf:NEAR
EXTRN	_fread:NEAR
EXTRN	_fseek:NEAR
EXTRN	_printf:NEAR
EXTRN	__imp__bind@12:NEAR
EXTRN	__imp__closesocket@4:NEAR
EXTRN	__imp__ioctlsocket@12:NEAR
EXTRN	__imp__Sleep@4:NEAR
EXTRN	__ftol:NEAR
EXTRN	__fltused:NEAR
EXTRN	__imp__htons@4:NEAR
EXTRN	__imp__inet_addr@4:NEAR
EXTRN	__imp__inet_ntoa@4:NEAR
EXTRN	__imp__recvfrom@24:NEAR
EXTRN	_difftime:NEAR
EXTRN	_time:NEAR
EXTRN	__imp__sendto@24:NEAR
EXTRN	__imp__socket@12:NEAR
EXTRN	_strcpy:NEAR
EXTRN	_strcat:NEAR
EXTRN	__imp__WSAStartup@8:NEAR
EXTRN	__imp__WSACleanup@0:NEAR
EXTRN	__imp__WSAGetLastError@0:NEAR
_DATA	SEGMENT
$SG18767 DB	'D:\disk\reu\', 00H
	ORG $+3
$SG18788 DB	'WSAStartup failed with error %d', 0aH, 00H
	ORG $+3
$SG18792 DB	'socket() failed with error %d', 0aH, 00H
	ORG $+1
$SG18795 DB	'bind() failed with error %d', 0aH, 00H
	ORG $+3
$SG18801 DB	'A: recv() failed: error %d', 0aH, 00H
$SG18803 DB	0aH, 'Error::Client closed connection', 0aH, 00H
	ORG $+2
$SG18813 DB	'B: recv() failed: error %d', 0aH, 00H
$SG18816 DB	0aH, 'Total Packets Sent: %ld ', 00H
	ORG $+2
$SG18818 DB	0aH, 'TransferTime %ld.%2ld', 0aH, 00H
$SG18819 DB	0aH, 'End of file Transfer, Press any key to exit....', 00H
	ORG $+3
$SG18826 DB	'send() failed: error %d', 0aH, 00H
	ORG $+3
$SG18828 DB	'rb', 00H
	ORG $+1
$SG18831 DB	0aH, 'Error:A Cannot open File: %s', 00H
	ORG $+2
$SG18833 DB	0aH, 'Error:B Cannot open File: %s', 00H
	ORG $+2
$SG18836 DB	0aH, 'Total Packets Sent: %ld ', 00H
	ORG $+2
$SG18839 DB	'send() failed: error %d', 0aH, 00H
	ORG $+3
$SG18845 DB	'Error:Could put Socket in non-Blocking mode', 00H
$SG18846 DB	'Press any key to exit..........', 00H
$SG18849 DB	'B: recv() failed: error %d', 0aH, 00H
$SG18857 DB	'Client Not ready to accept.Press any key to exit......', 00H
	ORG $+1
$SG18862 DB	'rb', 00H
	ORG $+1
$SG18865 DB	0aH, 'Error:C Cannot open File: %s', 00H
	ORG $+2
$SG18879 DB	'send() failed: error %d', 0aH, 00H
	ORG $+3
$SG18885 DB	'Error:Could put Socket in non-Blocking mode', 00H
$SG18886 DB	'Press any key to exit..........', 00H
$SG18893 DB	'Error:Could put Socket in Blocking mode', 00H
$SG18894 DB	'Press any key to exit..........', 00H
$SG18897 DB	'send() failed: error %d', 0aH, 00H
	ORG $+3
$SG18903 DB	'Error:Could put Socket in Blocking mode', 00H
$SG18904 DB	'Press any key to exit..........', 00H
$SG18908 DB	'D: recv() failed: error %d', 0aH, 00H
$SG18915 DB	0aH, 'Retransmission %d', 00H
_DATA	ENDS
;	COMDAT __real@8@4004f000000000000000
; File AFTP.c
CONST	SEGMENT
__real@8@4004f000000000000000 DQ 0404e000000000000r ; 60
CONST	ENDS
_TEXT	SEGMENT
_Buffer$ = -312
_sendBuffer$ = -1872
_interface$ = -1908
_Path$ = -416
_Path2$ = -184
_port$ = -1916
_retval$ = -1900
_fromlen$ = -1896
_i$ = -852
_statusCode$ = -1912
_Size$ = -4
_ack$ = -1904
_conv$ = -828
_seq$ = -420
_iMode$ = -824
_block$ = -1920
_socket_type$ = -1892
_local$ = -848
_from$ = -1888
_wsaData$ = -820
_listen_socket$ = -316
_msgsock$ = -832
_main	PROC NEAR
; File AFTP.c
; Line 37
	push	ebp
	mov	ebp, esp
	sub	esp, 1924				; 00000784H
	push	edi
; Line 43
	mov	DWORD PTR _interface$[ebp], 0
; Line 44
	mov	eax, DWORD PTR $SG18767
	mov	DWORD PTR _Path$[ebp], eax
	mov	ecx, DWORD PTR $SG18767+4
	mov	DWORD PTR _Path$[ebp+4], ecx
	mov	edx, DWORD PTR $SG18767+8
	mov	DWORD PTR _Path$[ebp+8], edx
	mov	al, BYTE PTR $SG18767+12
	mov	BYTE PTR _Path$[ebp+12], al
	mov	ecx, 21					; 00000015H
	xor	eax, eax
	lea	edi, DWORD PTR _Path$[ebp+13]
	rep stosd
	stosw
	stosb
; Line 46
	mov	WORD PTR _port$[ebp], 5008		; 00001390H
; Line 50
	mov	DWORD PTR _statusCode$[ebp], 0
; Line 51
	mov	DWORD PTR _Size$[ebp], 0
; Line 55
	mov	DWORD PTR _iMode$[ebp], 0
; Line 57
	mov	DWORD PTR _socket_type$[ebp], 2
; Line 67
	call	_Init
; Line 71
	lea	ecx, DWORD PTR _wsaData$[ebp]
	push	ecx
	push	514					; 00000202H
	call	DWORD PTR __imp__WSAStartup@8
	mov	DWORD PTR _retval$[ebp], eax
	cmp	DWORD PTR _retval$[ebp], 0
	je	SHORT $L18787
; Line 73
	mov	edx, DWORD PTR _retval$[ebp]
	push	edx
	push	OFFSET FLAT:$SG18788
	push	OFFSET FLAT:__iob+64
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 74
	call	DWORD PTR __imp__WSACleanup@0
$L18787:
; Line 78
	mov	WORD PTR _local$[ebp], 2
; Line 79
	cmp	DWORD PTR _interface$[ebp], 0
	jne	SHORT $L19050
	mov	DWORD PTR -1924+[ebp], 0
	jmp	SHORT $L19051
$L19050:
	mov	eax, DWORD PTR _interface$[ebp]
	push	eax
	call	DWORD PTR __imp__inet_addr@4
	mov	DWORD PTR -1924+[ebp], eax
$L19051:
	mov	ecx, DWORD PTR -1924+[ebp]
	mov	DWORD PTR _local$[ebp+4], ecx
; Line 84
	mov	dx, WORD PTR _port$[ebp]
	push	edx
	call	DWORD PTR __imp__htons@4
	mov	WORD PTR _local$[ebp+2], ax
; Line 86
	push	0
	mov	eax, DWORD PTR _socket_type$[ebp]
	push	eax
	push	2
	call	DWORD PTR __imp__socket@12
	mov	DWORD PTR _listen_socket$[ebp], eax
; Line 88
	cmp	DWORD PTR _listen_socket$[ebp], -1
	jne	SHORT $L18791
; Line 90
	call	DWORD PTR __imp__WSAGetLastError@0
	push	eax
	push	OFFSET FLAT:$SG18792
	push	OFFSET FLAT:__iob+64
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 91
	call	DWORD PTR __imp__WSACleanup@0
$L18791:
; Line 101
	push	16					; 00000010H
	lea	ecx, DWORD PTR _local$[ebp]
	push	ecx
	mov	edx, DWORD PTR _listen_socket$[ebp]
	push	edx
	call	DWORD PTR __imp__bind@12
	cmp	eax, -1
	jne	SHORT $L18794
; Line 103
	call	DWORD PTR __imp__WSAGetLastError@0
	push	eax
	push	OFFSET FLAT:$SG18795
	push	OFFSET FLAT:__iob+64
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 104
	call	DWORD PTR __imp__WSACleanup@0
$L18794:
; Line 108
	mov	eax, 1
	test	eax, eax
	je	$L18798
; Line 111
	mov	DWORD PTR _fromlen$[ebp], 16		; 00000010H
; Line 112
	mov	ecx, DWORD PTR _listen_socket$[ebp]
	mov	DWORD PTR _msgsock$[ebp], ecx
; Line 117
	lea	edx, DWORD PTR _fromlen$[ebp]
	push	edx
	lea	eax, DWORD PTR _from$[ebp]
	push	eax
	push	0
	push	128					; 00000080H
	lea	ecx, DWORD PTR _Buffer$[ebp]
	push	ecx
	mov	edx, DWORD PTR _msgsock$[ebp]
	push	edx
	call	DWORD PTR __imp__recvfrom@24
	mov	DWORD PTR _retval$[ebp], eax
; Line 120
	mov	eax, DWORD PTR _from$[ebp+4]
	push	eax
	call	DWORD PTR __imp__inet_ntoa@4
	push	eax
	push	OFFSET FLAT:_IP
	call	_strcpy
	add	esp, 8
; Line 122
	cmp	DWORD PTR _retval$[ebp], -1
	jne	SHORT $L18800
; Line 124
	call	DWORD PTR __imp__WSAGetLastError@0
	push	eax
	push	OFFSET FLAT:$SG18801
	push	OFFSET FLAT:__iob+64
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 125
	mov	ecx, DWORD PTR _msgsock$[ebp]
	push	ecx
	call	DWORD PTR __imp__closesocket@4
; Line 126
	jmp	$L18794
$L18800:
; Line 129
	cmp	DWORD PTR _retval$[ebp], 0
	jne	SHORT $L18802
; Line 131
	push	OFFSET FLAT:$SG18803
	call	_printf
	add	esp, 4
; Line 132
	mov	edx, DWORD PTR _msgsock$[ebp]
	push	edx
	call	DWORD PTR __imp__closesocket@4
; Line 133
	jmp	$L18794
$L18802:
; Line 140
	lea	eax, DWORD PTR _Buffer$[ebp]
	push	eax
	call	_Protocol
	add	esp, 4
	mov	DWORD PTR _statusCode$[ebp], eax
; Line 141
	cmp	DWORD PTR _statusCode$[ebp], -1
	jne	SHORT $L18805
; Line 143
	jmp	$L18794
$L18805:
; Line 145
	cmp	DWORD PTR _statusCode$[ebp], 201	; 000000c9H
	jne	$L18807
$EndTransfer$18808:
; Line 148
	mov	ecx, DWORD PTR _fileNumber
	cmp	ecx, DWORD PTR _totalFiles
	jl	$Label102$18822
; Line 151
	mov	BYTE PTR _sendBuffer$[ebp], 49		; 00000031H
; Line 152
	mov	BYTE PTR _sendBuffer$[ebp+1], 48	; 00000030H
; Line 153
	mov	BYTE PTR _sendBuffer$[ebp+2], 51	; 00000033H
; Line 155
	mov	edx, DWORD PTR _fromlen$[ebp]
	push	edx
	lea	eax, DWORD PTR _from$[ebp]
	push	eax
	push	0
	push	1020					; 000003fcH
	lea	ecx, DWORD PTR _sendBuffer$[ebp]
	push	ecx
	mov	edx, DWORD PTR _msgsock$[ebp]
	push	edx
	call	DWORD PTR __imp__sendto@24
	mov	DWORD PTR _retval$[ebp], eax
; Line 156
	push	300					; 0000012cH
	call	DWORD PTR __imp__Sleep@4
; Line 157
	lea	eax, DWORD PTR _fromlen$[ebp]
	push	eax
	lea	ecx, DWORD PTR _from$[ebp]
	push	ecx
	push	0
	push	128					; 00000080H
	lea	edx, DWORD PTR _Buffer$[ebp]
	push	edx
	mov	eax, DWORD PTR _msgsock$[ebp]
	push	eax
	call	DWORD PTR __imp__recvfrom@24
	mov	DWORD PTR _retval$[ebp], eax
; Line 158
	cmp	DWORD PTR _retval$[ebp], -1
	jne	SHORT $L18812
; Line 160
	call	DWORD PTR __imp__WSAGetLastError@0
	push	eax
	push	OFFSET FLAT:$SG18813
	push	OFFSET FLAT:__iob+64
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 162
	jmp	$EndTransfer$18808
$L18812:
; Line 167
	movsx	ecx, BYTE PTR _Buffer$[ebp]
	cmp	ecx, 49					; 00000031H
	jne	$L18815
	movsx	edx, BYTE PTR _Buffer$[ebp+1]
	cmp	edx, 48					; 00000030H
	jne	$L18815
	movsx	eax, BYTE PTR _Buffer$[ebp+2]
	cmp	eax, 52					; 00000034H
	jne	$L18815
; Line 169
	mov	DWORD PTR _fileNumber, 0
; Line 170
	mov	DWORD PTR _totalFiles, 0
; Line 172
	mov	ecx, DWORD PTR _TPACK
	push	ecx
	push	OFFSET FLAT:$SG18816
	call	_printf
	add	esp, 8
; Line 173
	push	OFFSET FLAT:_endTime
	call	_time
	add	esp, 4
; Line 174
	mov	edx, DWORD PTR _startTime
	push	edx
	mov	eax, DWORD PTR _endTime
	push	eax
	call	_difftime
	add	esp, 8
	fst	QWORD PTR _dif
; Line 175
	fdiv	QWORD PTR __real@8@4004f000000000000000
	call	__ftol
	mov	DWORD PTR _min, eax
; Line 176
	fld	QWORD PTR _dif
	call	__ftol
	cdq
	mov	ecx, 60					; 0000003cH
	idiv	ecx
	mov	DWORD PTR _sec, edx
; Line 177
	mov	edx, DWORD PTR _sec
	push	edx
	mov	eax, DWORD PTR _min
	push	eax
	push	OFFSET FLAT:$SG18818
	call	_printf
	add	esp, 12					; 0000000cH
; Line 178
	push	OFFSET FLAT:$SG18819
	call	_printf
	add	esp, 4
; Line 179
	call	_getch
; Line 180
	push	0
	call	_exit
$L18815:
; Line 184
	jmp	$EndTransfer$18808
$Label102$18822:
; Line 193
	lea	ecx, DWORD PTR _sendBuffer$[ebp]
	push	ecx
	call	_Create102
	add	esp, 4
; Line 195
	push	OFFSET FLAT:_startTime
	call	_time
	add	esp, 4
; Line 197
	mov	edx, DWORD PTR _fromlen$[ebp]
	push	edx
	lea	eax, DWORD PTR _from$[ebp]
	push	eax
	push	0
	push	1020					; 000003fcH
	lea	ecx, DWORD PTR _sendBuffer$[ebp]
	push	ecx
	mov	edx, DWORD PTR _msgsock$[ebp]
	push	edx
	call	DWORD PTR __imp__sendto@24
	mov	DWORD PTR _retval$[ebp], eax
; Line 200
	cmp	DWORD PTR _retval$[ebp], -1
	jne	SHORT $L18825
; Line 202
	call	DWORD PTR __imp__WSAGetLastError@0
	push	eax
	push	OFFSET FLAT:$SG18826
	push	OFFSET FLAT:__iob+64
	call	_fprintf
	add	esp, 12					; 0000000cH
$L18825:
; Line 207
	mov	BYTE PTR _sendBuffer$[ebp], 0
$OpenNext$18827:
; Line 211
	lea	eax, DWORD PTR _Path$[ebp]
	push	eax
	lea	ecx, DWORD PTR _Path2$[ebp]
	push	ecx
	call	_strcpy
	add	esp, 8
; Line 212
	mov	edx, DWORD PTR _fileNumber
	imul	edx, 84					; 00000054H
	add	edx, OFFSET FLAT:_File
	push	edx
	lea	eax, DWORD PTR _Path2$[ebp]
	push	eax
	call	_strcat
	add	esp, 8
; Line 213
	push	OFFSET FLAT:$SG18828
	lea	ecx, DWORD PTR _Path2$[ebp]
	push	ecx
	call	_fopen
	add	esp, 8
	mov	DWORD PTR _rdFile, eax
; Line 214
	cmp	DWORD PTR _rdFile, 0
	jne	SHORT $L18830
; Line 216
	lea	edx, DWORD PTR _Path2$[ebp]
	push	edx
	push	OFFSET FLAT:$SG18831
	call	_printf
	add	esp, 8
; Line 217
	mov	eax, DWORD PTR _rdFile
	push	eax
	call	_fclose
	add	esp, 4
; Line 218
	mov	ecx, DWORD PTR _fileNumber
	cmp	ecx, DWORD PTR _totalFiles
	jl	SHORT $L18832
; Line 220
	lea	edx, DWORD PTR _Path2$[ebp]
	push	edx
	push	OFFSET FLAT:$SG18833
	call	_printf
	add	esp, 8
; Line 221
	jmp	$EndTransfer$18808
$L18832:
; Line 223
	mov	eax, DWORD PTR _fileNumber
	add	eax, 1
	mov	DWORD PTR _fileNumber, eax
; Line 224
	jmp	$OpenNext$18827
$L18830:
; Line 226
	mov	ecx, DWORD PTR _rdFile
	push	ecx
	call	_fclose
	add	esp, 4
$Label201$18834:
; Line 229
	lea	edx, DWORD PTR _sendBuffer$[ebp]
	push	edx
	mov	eax, DWORD PTR _fileNumber
	push	eax
	call	_Create201
	add	esp, 8
; Line 232
	mov	ecx, DWORD PTR _TPACK
	push	ecx
	push	OFFSET FLAT:$SG18836
	call	_printf
	add	esp, 8
; Line 233
	mov	edx, DWORD PTR _fromlen$[ebp]
	push	edx
	lea	eax, DWORD PTR _from$[ebp]
	push	eax
	push	0
	push	1020					; 000003fcH
	lea	ecx, DWORD PTR _sendBuffer$[ebp]
	push	ecx
	mov	edx, DWORD PTR _msgsock$[ebp]
	push	edx
	call	DWORD PTR __imp__sendto@24
	mov	DWORD PTR _retval$[ebp], eax
; Line 235
	cmp	DWORD PTR _retval$[ebp], -1
	jne	SHORT $L18838
; Line 237
	call	DWORD PTR __imp__WSAGetLastError@0
	push	eax
	push	OFFSET FLAT:$SG18839
	push	OFFSET FLAT:__iob+64
	call	_fprintf
	add	esp, 12					; 0000000cH
$L18838:
; Line 241
	mov	BYTE PTR _sendBuffer$[ebp], 0
; Line 247
	cmp	DWORD PTR _iMode$[ebp], 0
	jne	SHORT $L18844
; Line 249
	mov	DWORD PTR _iMode$[ebp], 1
; Line 250
	lea	eax, DWORD PTR _iMode$[ebp]
	push	eax
	push	-2147195266				; 8004667eH
	mov	ecx, DWORD PTR _msgsock$[ebp]
	push	ecx
	call	DWORD PTR __imp__ioctlsocket@12
	mov	DWORD PTR _block$[ebp], eax
; Line 251
	cmp	DWORD PTR _block$[ebp], 0
	je	SHORT $L18844
; Line 253
	push	OFFSET FLAT:$SG18845
	call	_printf
	add	esp, 4
; Line 254
	push	OFFSET FLAT:$SG18846
	call	_printf
	add	esp, 4
; Line 255
	call	_getch
; Line 256
	push	0
	call	_exit
$L18844:
; Line 260
	mov	BYTE PTR _Buffer$[ebp], 0
; Line 261
	mov	BYTE PTR _Buffer$[ebp+1], 0
; Line 262
	mov	BYTE PTR _Buffer$[ebp+2], 0
; Line 263
	push	300					; 0000012cH
	call	DWORD PTR __imp__Sleep@4
; Line 264
	lea	edx, DWORD PTR _fromlen$[ebp]
	push	edx
	lea	eax, DWORD PTR _from$[ebp]
	push	eax
	push	0
	push	128					; 00000080H
	lea	ecx, DWORD PTR _Buffer$[ebp]
	push	ecx
	mov	edx, DWORD PTR _msgsock$[ebp]
	push	edx
	call	DWORD PTR __imp__recvfrom@24
	mov	DWORD PTR _retval$[ebp], eax
; Line 281
	cmp	DWORD PTR _retval$[ebp], -1
	jne	SHORT $L18848
; Line 283
	call	DWORD PTR __imp__WSAGetLastError@0
	push	eax
	push	OFFSET FLAT:$SG18849
	push	OFFSET FLAT:__iob+64
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 285
	jmp	$Label201$18834
$L18848:
; Line 289
	movsx	eax, BYTE PTR _Buffer$[ebp]
	cmp	eax, 50					; 00000032H
	jne	SHORT $L18851
	movsx	ecx, BYTE PTR _Buffer$[ebp+1]
	cmp	ecx, 48					; 00000030H
	jne	SHORT $L18851
	movsx	edx, BYTE PTR _Buffer$[ebp+2]
	cmp	edx, 50					; 00000032H
	jne	SHORT $L18851
; Line 291
	jmp	$Label301$18852
$L18851:
; Line 293
	movsx	eax, BYTE PTR _Buffer$[ebp]
	cmp	eax, 50					; 00000032H
	jne	SHORT $L18854
	movsx	ecx, BYTE PTR _Buffer$[ebp+1]
	cmp	ecx, 48					; 00000030H
	jne	SHORT $L18854
	movsx	edx, BYTE PTR _Buffer$[ebp+2]
	cmp	edx, 52					; 00000034H
	jne	SHORT $L18854
; Line 295
	mov	eax, DWORD PTR _fileNumber
	add	eax, 1
	mov	DWORD PTR _fileNumber, eax
; Line 296
	jmp	$OpenNext$18827
$L18854:
; Line 298
	movsx	ecx, BYTE PTR _Buffer$[ebp]
	cmp	ecx, 50					; 00000032H
	jne	SHORT $L18856
	movsx	edx, BYTE PTR _Buffer$[ebp+1]
	cmp	edx, 48					; 00000030H
	jne	SHORT $L18856
	movsx	eax, BYTE PTR _Buffer$[ebp+2]
	cmp	eax, 51					; 00000033H
	jne	SHORT $L18856
; Line 300
	push	OFFSET FLAT:$SG18857
	call	_printf
	add	esp, 4
; Line 301
	call	_getch
; Line 302
	push	0
	call	_exit
$L18856:
; Line 304
	movsx	ecx, BYTE PTR _Buffer$[ebp]
	cmp	ecx, 49					; 00000031H
	jne	SHORT $L18858
	movsx	edx, BYTE PTR _Buffer$[ebp+1]
	cmp	edx, 48					; 00000030H
	jne	SHORT $L18858
	movsx	eax, BYTE PTR _Buffer$[ebp+2]
	cmp	eax, 49					; 00000031H
	jne	SHORT $L18858
; Line 306
	jmp	$Label102$18822
$L18858:
; Line 310
	jmp	$Label201$18834
$L18807:
; Line 316
	cmp	DWORD PTR _statusCode$[ebp], 301	; 0000012dH
	jne	$L18861
$Label301$18852:
; Line 321
	lea	ecx, DWORD PTR _Path$[ebp]
	push	ecx
	lea	edx, DWORD PTR _Path2$[ebp]
	push	edx
	call	_strcpy
	add	esp, 8
; Line 322
	mov	eax, DWORD PTR _fileNumber
	imul	eax, 84					; 00000054H
	add	eax, OFFSET FLAT:_File
	push	eax
	lea	ecx, DWORD PTR _Path2$[ebp]
	push	ecx
	call	_strcat
	add	esp, 8
; Line 323
	push	OFFSET FLAT:$SG18862
	lea	edx, DWORD PTR _Path2$[ebp]
	push	edx
	call	_fopen
	add	esp, 8
	mov	DWORD PTR _rdFile, eax
; Line 324
	cmp	DWORD PTR _rdFile, 0
	jne	SHORT $L18864
; Line 326
	lea	eax, DWORD PTR _Path2$[ebp]
	push	eax
	push	OFFSET FLAT:$SG18865
	call	_printf
	add	esp, 8
; Line 327
	mov	ecx, DWORD PTR _fileNumber
	add	ecx, 1
	mov	DWORD PTR _fileNumber, ecx
; Line 328
	jmp	$OpenNext$18827
$L18864:
; Line 332
	push	0
	push	0
	mov	edx, DWORD PTR _rdFile
	push	edx
	call	_fseek
	add	esp, 12					; 0000000cH
; Line 336
	mov	BYTE PTR _sendBuffer$[ebp], 51		; 00000033H
; Line 337
	mov	BYTE PTR _sendBuffer$[ebp+1], 48	; 00000030H
; Line 338
	mov	BYTE PTR _sendBuffer$[ebp+2], 49	; 00000031H
; Line 341
	mov	BYTE PTR _sendBuffer$[ebp+3], 16	; 00000010H
; Line 342
	mov	BYTE PTR _sendBuffer$[ebp+4], 19	; 00000013H
; Line 344
	mov	BYTE PTR _sendBuffer$[ebp+7], 16	; 00000010H
; Line 345
	mov	BYTE PTR _sendBuffer$[ebp+8], 19	; 00000013H
; Line 347
	mov	BYTE PTR _sendBuffer$[ebp+11], 16	; 00000010H
; Line 348
	mov	BYTE PTR _sendBuffer$[ebp+12], 19	; 00000013H
; Line 354
	mov	DWORD PTR _seq$[ebp], OFFSET FLAT:_nextSeq
$Label2$18870:
; Line 358
	mov	eax, DWORD PTR _seq$[ebp]
	mov	cl, BYTE PTR [eax]
	mov	BYTE PTR _sendBuffer$[ebp+5], cl
; Line 359
	mov	edx, DWORD PTR _seq$[ebp]
	mov	al, BYTE PTR [edx+1]
	mov	BYTE PTR _sendBuffer$[ebp+6], al
; Line 360
	mov	ecx, DWORD PTR _rdFile
	push	ecx
	push	1000					; 000003e8H
	push	1
	lea	edx, DWORD PTR _sendBuffer$[ebp+13]
	push	edx
	call	_fread
	add	esp, 16					; 00000010H
	mov	DWORD PTR _Size$[ebp], eax
; Line 362
	cmp	DWORD PTR _Size$[ebp], 1000		; 000003e8H
	jge	SHORT $L18874
; Line 364
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L18872
$L18873:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L18872:
	mov	ecx, 1000				; 000003e8H
	sub	ecx, DWORD PTR _Size$[ebp]
	cmp	DWORD PTR _i$[ebp], ecx
	jge	SHORT $L18874
; Line 366
	mov	edx, DWORD PTR _Size$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	mov	BYTE PTR _sendBuffer$[ebp+edx+13], 0
; Line 368
	jmp	SHORT $L18873
$L18874:
; Line 371
	lea	eax, DWORD PTR _Size$[ebp]
	mov	DWORD PTR _conv$[ebp], eax
; Line 372
	mov	ecx, DWORD PTR _conv$[ebp]
	mov	dl, BYTE PTR [ecx]
	mov	BYTE PTR _sendBuffer$[ebp+9], dl
; Line 373
	mov	eax, DWORD PTR _conv$[ebp]
	mov	cl, BYTE PTR [eax+1]
	mov	BYTE PTR _sendBuffer$[ebp+10], cl
; Line 375
	mov	edx, DWORD PTR _nextSeq
	add	edx, 1
	mov	DWORD PTR _nextSeq, edx
$Label1$18876:
; Line 377
	push	50					; 00000032H
	call	DWORD PTR __imp__Sleep@4
; Line 378
	mov	eax, DWORD PTR _fromlen$[ebp]
	push	eax
	lea	ecx, DWORD PTR _from$[ebp]
	push	ecx
	push	0
	push	1020					; 000003fcH
	lea	edx, DWORD PTR _sendBuffer$[ebp]
	push	edx
	mov	eax, DWORD PTR _msgsock$[ebp]
	push	eax
	call	DWORD PTR __imp__sendto@24
	mov	DWORD PTR _retval$[ebp], eax
; Line 379
	mov	ecx, DWORD PTR _TPACK
	add	ecx, 1
	mov	DWORD PTR _TPACK, ecx
; Line 380
	cmp	DWORD PTR _retval$[ebp], -1
	jne	SHORT $L18878
; Line 382
	call	DWORD PTR __imp__WSAGetLastError@0
	push	eax
	push	OFFSET FLAT:$SG18879
	push	OFFSET FLAT:__iob+64
	call	_fprintf
	add	esp, 12					; 0000000cH
$L18878:
; Line 391
	cmp	DWORD PTR _iMode$[ebp], 0
	jne	SHORT $L18884
; Line 393
	mov	DWORD PTR _iMode$[ebp], 1
; Line 394
	lea	edx, DWORD PTR _iMode$[ebp]
	push	edx
	push	-2147195266				; 8004667eH
	mov	eax, DWORD PTR _msgsock$[ebp]
	push	eax
	call	DWORD PTR __imp__ioctlsocket@12
	mov	DWORD PTR _block$[ebp], eax
; Line 395
	cmp	DWORD PTR _block$[ebp], 0
	je	SHORT $L18884
; Line 397
	push	OFFSET FLAT:$SG18885
	call	_printf
	add	esp, 4
; Line 398
	push	OFFSET FLAT:$SG18886
	call	_printf
	add	esp, 4
; Line 399
	call	_getch
; Line 400
	push	0
	call	_exit
$L18884:
; Line 403
	mov	BYTE PTR _Buffer$[ebp], 0
; Line 404
	mov	BYTE PTR _Buffer$[ebp+1], 0
; Line 405
	mov	BYTE PTR _Buffer$[ebp+2], 0
; Line 441
	cmp	DWORD PTR _Size$[ebp], 1000		; 000003e8H
	je	$Label2$18870
; Line 449
	mov	DWORD PTR _nextSeq, 0
$Label303$18887:
; Line 453
	mov	BYTE PTR _sendBuffer$[ebp], 51		; 00000033H
; Line 454
	mov	BYTE PTR _sendBuffer$[ebp+1], 48	; 00000030H
; Line 455
	mov	BYTE PTR _sendBuffer$[ebp+2], 51	; 00000033H
; Line 458
	cmp	DWORD PTR _iMode$[ebp], 0
	je	SHORT $L18892
; Line 460
	mov	DWORD PTR _iMode$[ebp], 0
; Line 461
	lea	ecx, DWORD PTR _iMode$[ebp]
	push	ecx
	push	-2147195266				; 8004667eH
	mov	edx, DWORD PTR _msgsock$[ebp]
	push	edx
	call	DWORD PTR __imp__ioctlsocket@12
	mov	DWORD PTR _block$[ebp], eax
; Line 462
	cmp	DWORD PTR _block$[ebp], 0
	je	SHORT $L18892
; Line 464
	push	OFFSET FLAT:$SG18893
	call	_printf
	add	esp, 4
; Line 465
	push	OFFSET FLAT:$SG18894
	call	_printf
	add	esp, 4
; Line 467
	push	0
	call	_exit
$L18892:
; Line 472
	mov	eax, DWORD PTR _fromlen$[ebp]
	push	eax
	lea	ecx, DWORD PTR _from$[ebp]
	push	ecx
	push	0
	push	1020					; 000003fcH
	lea	edx, DWORD PTR _sendBuffer$[ebp]
	push	edx
	mov	eax, DWORD PTR _msgsock$[ebp]
	push	eax
	call	DWORD PTR __imp__sendto@24
	mov	DWORD PTR _retval$[ebp], eax
; Line 473
	cmp	DWORD PTR _retval$[ebp], -1
	jne	SHORT $L18896
; Line 475
	call	DWORD PTR __imp__WSAGetLastError@0
	push	eax
	push	OFFSET FLAT:$SG18897
	push	OFFSET FLAT:__iob+64
	call	_fprintf
	add	esp, 12					; 0000000cH
$L18896:
; Line 479
	mov	BYTE PTR _sendBuffer$[ebp], 0
; Line 481
	mov	BYTE PTR _Buffer$[ebp], 0
; Line 482
	mov	BYTE PTR _Buffer$[ebp+1], 0
; Line 483
	mov	BYTE PTR _Buffer$[ebp+2], 0
; Line 485
	cmp	DWORD PTR _iMode$[ebp], 0
	jne	SHORT $Label305$18905
; Line 487
	mov	DWORD PTR _iMode$[ebp], 1
; Line 488
	lea	ecx, DWORD PTR _iMode$[ebp]
	push	ecx
	push	-2147195266				; 8004667eH
	mov	edx, DWORD PTR _msgsock$[ebp]
	push	edx
	call	DWORD PTR __imp__ioctlsocket@12
	mov	DWORD PTR _block$[ebp], eax
; Line 489
	cmp	DWORD PTR _block$[ebp], 0
	je	SHORT $Label305$18905
; Line 491
	push	OFFSET FLAT:$SG18903
	call	_printf
	add	esp, 4
; Line 492
	push	OFFSET FLAT:$SG18904
	call	_printf
	add	esp, 4
; Line 494
	push	0
	call	_exit
$Label305$18905:
; Line 498
	push	300					; 0000012cH
	call	DWORD PTR __imp__Sleep@4
; Line 500
	lea	eax, DWORD PTR _fromlen$[ebp]
	push	eax
	lea	ecx, DWORD PTR _from$[ebp]
	push	ecx
	push	0
	push	128					; 00000080H
	lea	edx, DWORD PTR _Buffer$[ebp]
	push	edx
	mov	eax, DWORD PTR _msgsock$[ebp]
	push	eax
	call	DWORD PTR __imp__recvfrom@24
	mov	DWORD PTR _retval$[ebp], eax
; Line 504
	cmp	DWORD PTR _retval$[ebp], -1
	jne	SHORT $L18907
; Line 506
	call	DWORD PTR __imp__WSAGetLastError@0
	push	eax
	push	OFFSET FLAT:$SG18908
	push	OFFSET FLAT:__iob+64
	call	_fprintf
	add	esp, 12					; 0000000cH
; Line 508
	jmp	$Label303$18887
$L18907:
; Line 512
	movsx	ecx, BYTE PTR _Buffer$[ebp]
	cmp	ecx, 51					; 00000033H
	jne	SHORT $L18910
	movsx	edx, BYTE PTR _Buffer$[ebp+1]
	cmp	edx, 48					; 00000030H
	jne	SHORT $L18910
	movsx	eax, BYTE PTR _Buffer$[ebp+2]
	cmp	eax, 52					; 00000034H
	jne	SHORT $L18910
; Line 514
	mov	ecx, DWORD PTR _rdFile
	push	ecx
	call	_fclose
	add	esp, 4
; Line 515
	mov	edx, DWORD PTR _fileNumber
	add	edx, 1
	mov	DWORD PTR _fileNumber, edx
; Line 516
	mov	eax, DWORD PTR _fileNumber
	cmp	eax, DWORD PTR _totalFiles
	jl	SHORT $L18911
; Line 518
	jmp	$EndTransfer$18808
$L18911:
; Line 523
	jmp	$OpenNext$18827
$L18910:
; Line 526
	movsx	ecx, BYTE PTR _Buffer$[ebp]
	cmp	ecx, 51					; 00000033H
	jne	$L18914
	movsx	edx, BYTE PTR _Buffer$[ebp+1]
	cmp	edx, 48					; 00000030H
	jne	$L18914
	movsx	eax, BYTE PTR _Buffer$[ebp+2]
	cmp	eax, 54					; 00000036H
	jne	$L18914
; Line 529
	movsx	ecx, BYTE PTR _Buffer$[ebp+6]
	and	ecx, 255				; 000000ffH
	mov	DWORD PTR _ack$[ebp], ecx
; Line 530
	mov	edx, DWORD PTR _ack$[ebp]
	shl	edx, 8
	and	edx, 65280				; 0000ff00H
	movsx	eax, BYTE PTR _Buffer$[ebp+5]
	and	eax, 255				; 000000ffH
	or	edx, eax
	mov	DWORD PTR _ack$[ebp], edx
; Line 531
	mov	ecx, DWORD PTR _ack$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG18915
	call	_printf
	add	esp, 8
; Line 533
	push	0
	mov	edx, DWORD PTR _ack$[ebp]
	imul	edx, 1000				; 000003e8H
	push	edx
	mov	eax, DWORD PTR _rdFile
	push	eax
	call	_fseek
	add	esp, 12					; 0000000cH
; Line 535
	lea	ecx, DWORD PTR _ack$[ebp]
	mov	DWORD PTR _seq$[ebp], ecx
; Line 537
	mov	edx, DWORD PTR _seq$[ebp]
	mov	al, BYTE PTR [edx]
	mov	BYTE PTR _sendBuffer$[ebp+5], al
; Line 538
	mov	ecx, DWORD PTR _seq$[ebp]
	mov	dl, BYTE PTR [ecx+1]
	mov	BYTE PTR _sendBuffer$[ebp+6], dl
; Line 539
	mov	eax, DWORD PTR _rdFile
	push	eax
	push	1000					; 000003e8H
	push	1
	lea	ecx, DWORD PTR _sendBuffer$[ebp+13]
	push	ecx
	call	_fread
	add	esp, 16					; 00000010H
	mov	DWORD PTR _Size$[ebp], eax
; Line 541
	cmp	DWORD PTR _Size$[ebp], 1000		; 000003e8H
	jge	SHORT $L18920
; Line 543
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L18918
$L18919:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L18918:
	mov	eax, 1000				; 000003e8H
	sub	eax, DWORD PTR _Size$[ebp]
	cmp	DWORD PTR _i$[ebp], eax
	jge	SHORT $L18920
; Line 545
	mov	ecx, DWORD PTR _Size$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	BYTE PTR _sendBuffer$[ebp+ecx+13], 0
; Line 547
	jmp	SHORT $L18919
$L18920:
; Line 550
	lea	edx, DWORD PTR _Size$[ebp]
	mov	DWORD PTR _conv$[ebp], edx
; Line 551
	mov	eax, DWORD PTR _conv$[ebp]
	mov	cl, BYTE PTR [eax]
	mov	BYTE PTR _sendBuffer$[ebp+9], cl
; Line 552
	mov	edx, DWORD PTR _conv$[ebp]
	mov	al, BYTE PTR [edx+1]
	mov	BYTE PTR _sendBuffer$[ebp+10], al
; Line 556
	mov	BYTE PTR _sendBuffer$[ebp], 51		; 00000033H
; Line 557
	mov	BYTE PTR _sendBuffer$[ebp+1], 48	; 00000030H
; Line 558
	mov	BYTE PTR _sendBuffer$[ebp+2], 53	; 00000035H
; Line 561
	mov	BYTE PTR _sendBuffer$[ebp+3], 16	; 00000010H
; Line 562
	mov	BYTE PTR _sendBuffer$[ebp+4], 19	; 00000013H
; Line 564
	mov	BYTE PTR _sendBuffer$[ebp+7], 16	; 00000010H
; Line 565
	mov	BYTE PTR _sendBuffer$[ebp+8], 19	; 00000013H
; Line 567
	mov	BYTE PTR _sendBuffer$[ebp+11], 16	; 00000010H
; Line 568
	mov	BYTE PTR _sendBuffer$[ebp+12], 19	; 00000013H
; Line 573
	mov	ecx, DWORD PTR _fromlen$[ebp]
	push	ecx
	lea	edx, DWORD PTR _from$[ebp]
	push	edx
	push	0
	push	1020					; 000003fcH
	lea	eax, DWORD PTR _sendBuffer$[ebp]
	push	eax
	mov	ecx, DWORD PTR _msgsock$[ebp]
	push	ecx
	call	DWORD PTR __imp__sendto@24
	mov	DWORD PTR _retval$[ebp], eax
; Line 574
	jmp	$Label305$18905
$L18914:
; Line 578
	jmp	$Label303$18887
$L18861:
; Line 589
	jmp	$L18794
$L18798:
; Line 607
	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_main	ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG18935 DB	0aH, 'Connection requested by %s', 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_bufferAdd$ = 8
_i$ = -8
_bufferPtr$ = -4
_Protocol PROC NEAR
; Line 610
	push	ebp
	mov	ebp, esp
	sub	esp, 8
; Line 613
	mov	eax, DWORD PTR _bufferAdd$[ebp]
	mov	DWORD PTR _bufferPtr$[ebp], eax
; Line 614
	mov	DWORD PTR _i$[ebp], 0
	cmp	DWORD PTR _i$[ebp], 3
	jge	$L18933
; Line 616
	mov	edx, DWORD PTR _bufferPtr$[ebp]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, 49					; 00000031H
	jne	SHORT $L18934
	mov	ecx, DWORD PTR _bufferPtr$[ebp]
	movsx	edx, BYTE PTR [ecx+1]
	cmp	edx, 48					; 00000030H
	jne	SHORT $L18934
	mov	eax, DWORD PTR _bufferPtr$[ebp]
	movsx	ecx, BYTE PTR [eax+2]
	cmp	ecx, 49					; 00000031H
	jne	SHORT $L18934
; Line 619
	push	OFFSET FLAT:_IP
	push	OFFSET FLAT:$SG18935
	call	_printf
	add	esp, 8
; Line 620
	mov	eax, 201				; 000000c9H
	jmp	$L18927
$L18934:
; Line 622
	mov	edx, DWORD PTR _bufferPtr$[ebp]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, 50					; 00000032H
	jne	SHORT $L18937
	mov	ecx, DWORD PTR _bufferPtr$[ebp]
	movsx	edx, BYTE PTR [ecx+1]
	cmp	edx, 48					; 00000030H
	jne	SHORT $L18937
	mov	eax, DWORD PTR _bufferPtr$[ebp]
	movsx	ecx, BYTE PTR [eax+2]
	cmp	ecx, 50					; 00000032H
	jne	SHORT $L18937
; Line 625
	mov	eax, 301				; 0000012dH
	jmp	$L18927
$L18937:
; Line 627
	mov	edx, DWORD PTR _bufferPtr$[ebp]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, 50					; 00000032H
	jne	SHORT $L18939
	mov	ecx, DWORD PTR _bufferPtr$[ebp]
	movsx	edx, BYTE PTR [ecx+1]
	cmp	edx, 48					; 00000030H
	jne	SHORT $L18939
	mov	eax, DWORD PTR _bufferPtr$[ebp]
	movsx	ecx, BYTE PTR [eax+2]
	cmp	ecx, 51					; 00000033H
	jne	SHORT $L18939
; Line 630
	or	eax, -1
	jmp	$L18927
$L18939:
; Line 632
	mov	edx, DWORD PTR _bufferPtr$[ebp]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, 50					; 00000032H
	jne	SHORT $L18941
	mov	ecx, DWORD PTR _bufferPtr$[ebp]
	movsx	edx, BYTE PTR [ecx+1]
	cmp	edx, 48					; 00000030H
	jne	SHORT $L18941
	mov	eax, DWORD PTR _bufferPtr$[ebp]
	movsx	ecx, BYTE PTR [eax+2]
	cmp	ecx, 52					; 00000034H
	jne	SHORT $L18941
; Line 635
	mov	edx, DWORD PTR _fileNumber
	add	edx, 1
	mov	DWORD PTR _fileNumber, edx
; Line 636
	mov	eax, 201				; 000000c9H
	jmp	$L18927
$L18941:
; Line 638
	mov	eax, DWORD PTR _bufferPtr$[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 51					; 00000033H
	jne	SHORT $L18943
	mov	edx, DWORD PTR _bufferPtr$[ebp]
	movsx	eax, BYTE PTR [edx+1]
	cmp	eax, 48					; 00000030H
	jne	SHORT $L18943
	mov	ecx, DWORD PTR _bufferPtr$[ebp]
	movsx	edx, BYTE PTR [ecx+2]
	cmp	edx, 50					; 00000032H
	jne	SHORT $L18943
; Line 643
	or	eax, -1
	jmp	SHORT $L18927
$L18943:
; Line 646
	mov	eax, DWORD PTR _bufferPtr$[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 51					; 00000033H
	jne	SHORT $L18945
	mov	edx, DWORD PTR _bufferPtr$[ebp]
	movsx	eax, BYTE PTR [edx+1]
	cmp	eax, 48					; 00000030H
	jne	SHORT $L18945
	mov	ecx, DWORD PTR _bufferPtr$[ebp]
	movsx	edx, BYTE PTR [ecx+2]
	cmp	edx, 52					; 00000034H
	jne	SHORT $L18945
; Line 648
	mov	eax, DWORD PTR _fileNumber
	add	eax, 1
	mov	DWORD PTR _fileNumber, eax
; Line 650
	mov	eax, 201				; 000000c9H
	jmp	SHORT $L18927
$L18945:
; Line 652
	mov	ecx, DWORD PTR _bufferPtr$[ebp]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, 49					; 00000031H
	jne	SHORT $L18947
	mov	eax, DWORD PTR _bufferPtr$[ebp]
	movsx	ecx, BYTE PTR [eax+1]
	cmp	ecx, 48					; 00000030H
	jne	SHORT $L18947
	mov	edx, DWORD PTR _bufferPtr$[ebp]
	movsx	eax, BYTE PTR [edx+2]
	cmp	eax, 52					; 00000034H
	jne	SHORT $L18947
; Line 654
	mov	BYTE PTR _IP, 0
; Line 656
	or	eax, -1
	jmp	SHORT $L18927
$L18947:
; Line 659
	or	eax, -1
	jmp	SHORT $L18927
$L18933:
; Line 661
	xor	eax, eax
$L18927:
; Line 662
	mov	esp, ebp
	pop	ebp
	ret	0
_Protocol ENDP
_TEXT	ENDS
EXTRN	_fscanf:NEAR
EXTRN	_strlen:NEAR
_BSS	SEGMENT
$SG18957 DB	02H DUP (?)
	ALIGN	4

$SG18965 DB	02H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
	ORG $+3
$SG18955 DB	'D:\disk\reu\', 00H
	ORG $+3
$SG18959 DB	'index.txt', 00H
	ORG $+2
$SG18966 DB	0aH, '----------------------------------Starting File Tra'
	DB	'nsfer------------------------------', 00H
$SG18967 DB	'rb', 00H
	ORG $+1
$SG18970 DB	0aH, 'Error: No Index File in this path %s', 00H
	ORG $+2
$SG18974 DB	'%s', 00H
	ORG $+1
$SG18977 DB	'D:\disk\reu\', 00H
	ORG $+3
$SG18978 DB	'rb', 00H
	ORG $+1
$SG18981 DB	0aH, 'Error: Cannot open File: %s', 00H
	ORG $+3
$SG18984 DB	0aH, 'Total Files in Index =%d', 00H
	ORG $+2
$SG18985 DB	0aH, 'FileNo.', 09H, 'FileSize', 09H, 09H, 'FileName', 00H
$SG18989 DB	'D:\disk\reu\', 00H
	ORG $+3
$SG18990 DB	'rb', 00H
	ORG $+1
$SG18993 DB	0aH, 'Error: Cannot open File: %s', 00H
	ORG $+3
$SG18997 DB	0aH, '%d .', 00H
	ORG $+2
$SG18998 DB	09H, '%ld', 00H
	ORG $+3
$SG18999 DB	09H, 09H, '%s', 00H
	ORG $+3
$SG19000 DB	0aH, 'Index Created', 00H
	ORG $+1
$SG19001 DB	0aH, 'Ready to accept transfer', 00H
_DATA	ENDS
_TEXT	SEGMENT
_myDisk$ = -884
_myFile$ = -896
_Buffer$ = -776
_Path$ = -880
_Path2$ = -264
_indexFile$ = -892
_Size$ = -84
_i$ = -888
_Index$ = -780
_fSize$ = -900
_fileName$ = -80
_Init	PROC NEAR
; Line 665
	push	ebp
	mov	ebp, esp
	sub	esp, 900				; 00000384H
	push	edi
; Line 669
	mov	eax, DWORD PTR $SG18955
	mov	DWORD PTR _Path$[ebp], eax
	mov	ecx, DWORD PTR $SG18955+4
	mov	DWORD PTR _Path$[ebp+4], ecx
	mov	edx, DWORD PTR $SG18955+8
	mov	DWORD PTR _Path$[ebp+8], edx
	mov	al, BYTE PTR $SG18955+12
	mov	BYTE PTR _Path$[ebp+12], al
	mov	ecx, 21					; 00000015H
	xor	eax, eax
	lea	edi, DWORD PTR _Path$[ebp+13]
	rep stosd
	stosw
	stosb
; Line 670
	mov	cx, WORD PTR $SG18957
	mov	WORD PTR _Path2$[ebp], cx
	mov	ecx, 44					; 0000002cH
	xor	eax, eax
	lea	edi, DWORD PTR _Path2$[ebp+2]
	rep stosd
	stosw
; Line 671
	mov	DWORD PTR _indexFile$[ebp], OFFSET FLAT:$SG18959
; Line 672
	mov	DWORD PTR _Size$[ebp], 0
	mov	DWORD PTR _i$[ebp], 0
	mov	DWORD PTR _Index$[ebp], 0
; Line 673
	mov	DWORD PTR _fSize$[ebp], 0
; Line 674
	mov	dx, WORD PTR $SG18965
	mov	WORD PTR _fileName$[ebp], dx
	mov	ecx, 19					; 00000013H
	xor	eax, eax
	lea	edi, DWORD PTR _fileName$[ebp+2]
	rep stosd
	stosw
; Line 675
	mov	BYTE PTR _Buffer$[ebp], 0
; Line 676
	push	OFFSET FLAT:$SG18966
	call	_printf
	add	esp, 4
; Line 678
	mov	eax, DWORD PTR _indexFile$[ebp]
	push	eax
	lea	ecx, DWORD PTR _Path$[ebp]
	push	ecx
	call	_strcat
	add	esp, 8
; Line 682
	push	OFFSET FLAT:$SG18967
	lea	edx, DWORD PTR _Path$[ebp]
	push	edx
	call	_fopen
	add	esp, 8
	mov	DWORD PTR _myDisk$[ebp], eax
; Line 684
	cmp	DWORD PTR _myDisk$[ebp], 0
	jne	SHORT $L18969
; Line 686
	lea	eax, DWORD PTR _Path$[ebp]
	push	eax
	push	OFFSET FLAT:$SG18970
	call	_printf
	add	esp, 8
; Line 687
	or	eax, -1
	jmp	$L18950
$L18969:
; Line 693
	mov	ecx, 1
	test	ecx, ecx
	je	$L18973
; Line 695
	lea	edx, DWORD PTR _fileName$[ebp]
	push	edx
	push	OFFSET FLAT:$SG18974
	mov	eax, DWORD PTR _myDisk$[ebp]
	push	eax
	call	_fscanf
	add	esp, 12					; 0000000cH
; Line 705
	movsx	ecx, BYTE PTR _fileName$[ebp]
	cmp	ecx, 120				; 00000078H
	jne	SHORT $L18975
	movsx	edx, BYTE PTR _fileName$[ebp+1]
	cmp	edx, 121				; 00000079H
	jne	SHORT $L18975
	movsx	eax, BYTE PTR _fileName$[ebp+2]
	cmp	eax, 122				; 0000007aH
	jne	SHORT $L18975
; Line 707
	jmp	$L18973
$L18975:
; Line 712
	push	OFFSET FLAT:$SG18977
	lea	ecx, DWORD PTR _Path2$[ebp]
	push	ecx
	call	_strcpy
	add	esp, 8
; Line 713
	lea	edx, DWORD PTR _fileName$[ebp]
	push	edx
	lea	eax, DWORD PTR _Path2$[ebp]
	push	eax
	call	_strcat
	add	esp, 8
; Line 714
	push	OFFSET FLAT:$SG18978
	lea	ecx, DWORD PTR _Path2$[ebp]
	push	ecx
	call	_fopen
	add	esp, 8
	mov	DWORD PTR _myFile$[ebp], eax
; Line 715
	cmp	DWORD PTR _myFile$[ebp], 0
	jne	SHORT $L18980
; Line 717
	lea	edx, DWORD PTR _Path2$[ebp]
	push	edx
	push	OFFSET FLAT:$SG18981
	call	_printf
	add	esp, 8
; Line 718
	jmp	$L18969
$L18980:
; Line 722
	lea	eax, DWORD PTR _fileName$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 84					; 00000054H
	add	ecx, OFFSET FLAT:_File
	push	ecx
	call	_strcpy
	add	esp, 8
; Line 723
	mov	edx, DWORD PTR _myFile$[ebp]
	push	edx
	call	_fclose
	add	esp, 4
; Line 724
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
; Line 730
	lea	ecx, DWORD PTR _fileName$[ebp]
	push	ecx
	call	_strlen
	add	esp, 4
	cmp	eax, 80					; 00000050H
	jb	SHORT $L18983
; Line 732
	jmp	$L18969
$L18983:
; Line 736
	jmp	$L18969
$L18973:
; Line 738
	mov	edx, DWORD PTR _myDisk$[ebp]
	push	edx
	call	_fclose
	add	esp, 4
; Line 739
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	push	OFFSET FLAT:$SG18984
	call	_printf
	add	esp, 8
; Line 740
	push	OFFSET FLAT:$SG18985
	call	_printf
	add	esp, 4
$L18987:
; Line 742
	mov	ecx, DWORD PTR _i$[ebp]
	sub	ecx, 1
	cmp	DWORD PTR _Index$[ebp], ecx
	jg	$L18988
; Line 745
	push	OFFSET FLAT:$SG18989
	lea	edx, DWORD PTR _Path2$[ebp]
	push	edx
	call	_strcpy
	add	esp, 8
; Line 747
	mov	eax, DWORD PTR _Index$[ebp]
	imul	eax, 84					; 00000054H
	add	eax, OFFSET FLAT:_File
	push	eax
	lea	ecx, DWORD PTR _Path2$[ebp]
	push	ecx
	call	_strcat
	add	esp, 8
; Line 749
	push	OFFSET FLAT:$SG18990
	lea	edx, DWORD PTR _Path2$[ebp]
	push	edx
	call	_fopen
	add	esp, 8
	mov	DWORD PTR _myFile$[ebp], eax
; Line 751
	cmp	DWORD PTR _myFile$[ebp], 0
	jne	SHORT $L18992
; Line 753
	lea	eax, DWORD PTR _Path2$[ebp]
	push	eax
	push	OFFSET FLAT:$SG18993
	call	_printf
	add	esp, 8
; Line 754
	mov	ecx, DWORD PTR _Index$[ebp]
	add	ecx, 1
	mov	DWORD PTR _Index$[ebp], ecx
; Line 755
	jmp	$L18987
$L18992:
; Line 758
	push	0
	push	0
	mov	edx, DWORD PTR _myFile$[ebp]
	push	edx
	call	_fseek
	add	esp, 12					; 0000000cH
$L18994:
; Line 761
	mov	eax, DWORD PTR _myFile$[ebp]
	push	eax
	push	512					; 00000200H
	push	1
	lea	ecx, DWORD PTR _Buffer$[ebp]
	push	ecx
	call	_fread
	add	esp, 16					; 00000010H
	mov	DWORD PTR _Size$[ebp], eax
; Line 762
	mov	edx, DWORD PTR _fSize$[ebp]
	add	edx, DWORD PTR _Size$[ebp]
	mov	DWORD PTR _fSize$[ebp], edx
; Line 763
	cmp	DWORD PTR _Size$[ebp], 512		; 00000200H
	je	SHORT $L18994
; Line 765
	mov	eax, DWORD PTR _Index$[ebp]
	imul	eax, 84					; 00000054H
	mov	ecx, DWORD PTR _fSize$[ebp]
	mov	DWORD PTR _File[eax+80], ecx
; Line 766
	mov	edx, DWORD PTR _Index$[ebp]
	push	edx
	push	OFFSET FLAT:$SG18997
	call	_printf
	add	esp, 8
; Line 767
	mov	eax, DWORD PTR _Index$[ebp]
	imul	eax, 84					; 00000054H
	mov	ecx, DWORD PTR _File[eax+80]
	push	ecx
	push	OFFSET FLAT:$SG18998
	call	_printf
	add	esp, 8
; Line 768
	mov	edx, DWORD PTR _Index$[ebp]
	imul	edx, 84					; 00000054H
	add	edx, OFFSET FLAT:_File
	push	edx
	push	OFFSET FLAT:$SG18999
	call	_printf
	add	esp, 8
; Line 769
	mov	DWORD PTR _fSize$[ebp], 0
; Line 770
	mov	eax, DWORD PTR _myFile$[ebp]
	push	eax
	call	_fclose
	add	esp, 4
; Line 771
	mov	ecx, DWORD PTR _Index$[ebp]
	add	ecx, 1
	mov	DWORD PTR _Index$[ebp], ecx
; Line 773
	jmp	$L18987
$L18988:
; Line 774
	mov	edx, DWORD PTR _Index$[ebp]
	mov	DWORD PTR _totalFiles, edx
; Line 775
	push	OFFSET FLAT:$SG19000
	call	_printf
	add	esp, 4
; Line 776
	push	OFFSET FLAT:$SG19001
	call	_printf
	add	esp, 4
; Line 779
	xor	eax, eax
$L18950:
; Line 781
	pop	edi
	mov	esp, ebp
	pop	ebp
	ret	0
_Init	ENDP
_sendBuffer$ = 8
_Create102 PROC NEAR
; Line 784
	push	ebp
	mov	ebp, esp
; Line 786
	mov	eax, DWORD PTR _sendBuffer$[ebp]
	mov	BYTE PTR [eax], 49			; 00000031H
; Line 787
	mov	ecx, DWORD PTR _sendBuffer$[ebp]
	mov	BYTE PTR [ecx+1], 48			; 00000030H
; Line 788
	mov	edx, DWORD PTR _sendBuffer$[ebp]
	mov	BYTE PTR [edx+2], 50			; 00000032H
; Line 789
	mov	eax, DWORD PTR _sendBuffer$[ebp]
	mov	BYTE PTR [eax+3], 16			; 00000010H
; Line 790
	mov	ecx, DWORD PTR _sendBuffer$[ebp]
	mov	BYTE PTR [ecx+4], 19			; 00000013H
; Line 791
	xor	eax, eax
; Line 794
	pop	ebp
	ret	0
_Create102 ENDP
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+2
$SG19020 DB	0aH, 'Sending.....', 00H
	ORG $+2
$SG19021 DB	'%d.', 00H
$SG19022 DB	09H, '%ld', 00H
	ORG $+3
$SG19023 DB	09H, 09H, '%s', 00H
_DATA	ENDS
_TEXT	SEGMENT
_fileNumber$ = 8
_sendBuffer$ = 12
_fileNameSize$ = -8
_padLength$ = -28
_j$ = -24
_Padding$ = -16
_padStart$ = -20
_fsize$ = -4
_Create201 PROC NEAR
; Line 797
	push	ebp
	mov	ebp, esp
	sub	esp, 28					; 0000001cH
; Line 798
	mov	DWORD PTR _fileNameSize$[ebp], 0
; Line 799
	mov	DWORD PTR _padLength$[ebp], 0
; Line 801
	mov	BYTE PTR _Padding$[ebp], 0
; Line 802
	mov	DWORD PTR _padStart$[ebp], 0
; Line 807
	mov	eax, DWORD PTR _sendBuffer$[ebp]
	mov	BYTE PTR [eax], 50			; 00000032H
; Line 808
	mov	ecx, DWORD PTR _sendBuffer$[ebp]
	mov	BYTE PTR [ecx+1], 48			; 00000030H
; Line 809
	mov	edx, DWORD PTR _sendBuffer$[ebp]
	mov	BYTE PTR [edx+2], 49			; 00000031H
; Line 812
	mov	eax, DWORD PTR _sendBuffer$[ebp]
	mov	BYTE PTR [eax+3], 16			; 00000010H
; Line 813
	mov	ecx, DWORD PTR _sendBuffer$[ebp]
	mov	BYTE PTR [ecx+4], 19			; 00000013H
; Line 816
	mov	edx, DWORD PTR _fileNumber$[ebp]
	imul	edx, 84					; 00000054H
	add	edx, OFFSET FLAT:_File
	push	edx
	mov	eax, DWORD PTR _sendBuffer$[ebp]
	add	eax, 5
	push	eax
	call	_strcpy
	add	esp, 8
; Line 818
	mov	ecx, DWORD PTR _fileNumber$[ebp]
	imul	ecx, 84					; 00000054H
	add	ecx, OFFSET FLAT:_File
	push	ecx
	call	_strlen
	add	esp, 4
	mov	DWORD PTR _fileNameSize$[ebp], eax
; Line 819
	mov	edx, 80					; 00000050H
	sub	edx, DWORD PTR _fileNameSize$[ebp]
	mov	DWORD PTR _padLength$[ebp], edx
; Line 820
	mov	eax, DWORD PTR _fileNameSize$[ebp]
	add	eax, 6
	mov	DWORD PTR _padStart$[ebp], eax
; Line 821
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L19017
$L19018:
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
$L19017:
	mov	edx, DWORD PTR _j$[ebp]
	cmp	edx, DWORD PTR _padLength$[ebp]
	jg	SHORT $L19019
; Line 823
	mov	eax, DWORD PTR _sendBuffer$[ebp]
	add	eax, DWORD PTR _padStart$[ebp]
	mov	cl, BYTE PTR _Padding$[ebp]
	mov	BYTE PTR [eax], cl
; Line 824
	mov	edx, DWORD PTR _padStart$[ebp]
	add	edx, 1
	mov	DWORD PTR _padStart$[ebp], edx
; Line 825
	jmp	SHORT $L19018
$L19019:
; Line 827
	mov	eax, DWORD PTR _sendBuffer$[ebp]
	mov	BYTE PTR [eax+85], 16			; 00000010H
; Line 828
	mov	ecx, DWORD PTR _sendBuffer$[ebp]
	mov	BYTE PTR [ecx+86], 19			; 00000013H
; Line 832
	push	OFFSET FLAT:$SG19020
	call	_printf
	add	esp, 4
; Line 833
	mov	edx, DWORD PTR _fileNumber$[ebp]
	push	edx
	push	OFFSET FLAT:$SG19021
	call	_printf
	add	esp, 8
; Line 834
	mov	eax, DWORD PTR _fileNumber$[ebp]
	imul	eax, 84					; 00000054H
	mov	ecx, DWORD PTR _File[eax+80]
	push	ecx
	push	OFFSET FLAT:$SG19022
	call	_printf
	add	esp, 8
; Line 835
	mov	edx, DWORD PTR _fileNumber$[ebp]
	imul	edx, 84					; 00000054H
	add	edx, OFFSET FLAT:_File
	push	edx
	push	OFFSET FLAT:$SG19023
	call	_printf
	add	esp, 8
; Line 838
	mov	eax, DWORD PTR _fileNumber$[ebp]
	imul	eax, 84					; 00000054H
	add	eax, OFFSET FLAT:_File+80
	mov	DWORD PTR _fsize$[ebp], eax
; Line 840
	mov	ecx, DWORD PTR _sendBuffer$[ebp]
	mov	edx, DWORD PTR _fsize$[ebp]
	mov	al, BYTE PTR [edx]
	mov	BYTE PTR [ecx+87], al
; Line 841
	mov	ecx, DWORD PTR _sendBuffer$[ebp]
	mov	edx, DWORD PTR _fsize$[ebp]
	mov	al, BYTE PTR [edx+1]
	mov	BYTE PTR [ecx+88], al
; Line 842
	mov	ecx, DWORD PTR _sendBuffer$[ebp]
	mov	edx, DWORD PTR _fsize$[ebp]
	mov	al, BYTE PTR [edx+2]
	mov	BYTE PTR [ecx+89], al
; Line 843
	mov	ecx, DWORD PTR _sendBuffer$[ebp]
	mov	edx, DWORD PTR _fsize$[ebp]
	mov	al, BYTE PTR [edx+3]
	mov	BYTE PTR [ecx+90], al
; Line 844
	xor	eax, eax
; Line 846
	mov	esp, ebp
	pop	ebp
	ret	0
_Create201 ENDP
_TEXT	ENDS
PUBLIC	_Create301
_TEXT	SEGMENT
_sendBuffer$ = 12
_Create301 PROC NEAR
; Line 849
	push	ebp
	mov	ebp, esp
	push	ecx
; Line 855
	mov	eax, DWORD PTR _sendBuffer$[ebp]
	mov	BYTE PTR [eax], 51			; 00000033H
; Line 856
	mov	ecx, DWORD PTR _sendBuffer$[ebp]
	mov	BYTE PTR [ecx+1], 48			; 00000030H
; Line 857
	mov	edx, DWORD PTR _sendBuffer$[ebp]
	mov	BYTE PTR [edx+2], 49			; 00000031H
; Line 860
	mov	eax, DWORD PTR _sendBuffer$[ebp]
	mov	BYTE PTR [eax+3], 16			; 00000010H
; Line 861
	mov	ecx, DWORD PTR _sendBuffer$[ebp]
	mov	BYTE PTR [ecx+4], 19			; 00000013H
; Line 866
	xor	eax, eax
; Line 868
	mov	esp, ebp
	pop	ebp
	ret	0
_Create301 ENDP
_TEXT	ENDS
END
