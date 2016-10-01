	TITLE	httpindex.cpp
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
PUBLIC	?ResourceIndexBase@HttpIndex@@0KA		; HttpIndex::ResourceIndexBase
PUBLIC	?ResourceBufferBase@HttpIndex@@0KA		; HttpIndex::ResourceBufferBase
PUBLIC	?ResourceIndexCount@HttpIndex@@0IA		; HttpIndex::ResourceIndexCount
PUBLIC	?ResourceBufferSize@HttpIndex@@0KA		; HttpIndex::ResourceBufferSize
PUBLIC	?ResourceIndexSize@HttpIndex@@0KA		; HttpIndex::ResourceIndexSize
PUBLIC	?ResourcePtr@HttpIndex@@0KA			; HttpIndex::ResourcePtr
PUBLIC	?ResourceIndexPtr@HttpIndex@@0KA		; HttpIndex::ResourceIndexPtr
PUBLIC	?DiskNo@HttpIndex@@0HA				; HttpIndex::DiskNo
_BSS	SEGMENT
?ResourceIndexBase@HttpIndex@@0KA DD 01H DUP (?)	; HttpIndex::ResourceIndexBase
?ResourceBufferBase@HttpIndex@@0KA DD 01H DUP (?)	; HttpIndex::ResourceBufferBase
?ResourceIndexCount@HttpIndex@@0IA DD 01H DUP (?)	; HttpIndex::ResourceIndexCount
?ResourceBufferSize@HttpIndex@@0KA DD 01H DUP (?)	; HttpIndex::ResourceBufferSize
?ResourceIndexSize@HttpIndex@@0KA DD 01H DUP (?)	; HttpIndex::ResourceIndexSize
?ResourcePtr@HttpIndex@@0KA DD 01H DUP (?)		; HttpIndex::ResourcePtr
?ResourceIndexPtr@HttpIndex@@0KA DD 01H DUP (?)		; HttpIndex::ResourceIndexPtr
?DiskNo@HttpIndex@@0HA DD 01H DUP (?)			; HttpIndex::DiskNo
_BSS	ENDS
PUBLIC	?init@HttpIndex@@QAEHKKHH@Z			; HttpIndex::init
EXTRN	??0AOAProtected@@QAE@XZ:NEAR			; AOAProtected::AOAProtected
EXTRN	?init@HttphashIndex@@QAEHJK@Z:NEAR		; HttphashIndex::init
_TEXT	SEGMENT
_BufferBase$ = 8
_BufferSize$ = 12
_BufferIndexCount$ = 16
_hashIndexCount$ = 20
_this$ = -16
_io$ = -12
_HashIndexSize$ = -4
?init@HttpIndex@@QAEHKKHH@Z PROC NEAR			; HttpIndex::init
; File httpindex.cpp
; Line 30
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	mov	DWORD PTR _this$[ebp], ecx
; Line 32
	lea	ecx, DWORD PTR _io$[ebp]
	call	??0AOAProtected@@QAE@XZ			; AOAProtected::AOAProtected
; Line 33
	mov	DWORD PTR _HashIndexSize$[ebp], 0
; Line 34
	mov	eax, DWORD PTR _BufferBase$[ebp]
	push	eax
	mov	ecx, DWORD PTR _hashIndexCount$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?init@HttphashIndex@@QAEHJK@Z		; HttphashIndex::init
	mov	DWORD PTR _HashIndexSize$[ebp], eax
; Line 36
	mov	edx, DWORD PTR _BufferIndexCount$[ebp]
	imul	edx, 92					; 0000005cH
	imul	edx, 10					; 0000000aH
	add	edx, DWORD PTR _HashIndexSize$[ebp]
	cmp	DWORD PTR _BufferSize$[ebp], edx
	jae	SHORT $L947
; Line 38
	or	eax, -1
	jmp	SHORT $L943
$L947:
; Line 41
	mov	eax, DWORD PTR _BufferBase$[ebp]
	add	eax, DWORD PTR _HashIndexSize$[ebp]
	mov	DWORD PTR ?ResourceIndexBase@HttpIndex@@0KA, eax ; HttpIndex::ResourceIndexBase
; Line 43
	mov	ecx, DWORD PTR _BufferIndexCount$[ebp]
	imul	ecx, 92					; 0000005cH
	mov	edx, DWORD PTR _BufferBase$[ebp]
	add	edx, ecx
	add	edx, DWORD PTR _HashIndexSize$[ebp]
	mov	DWORD PTR ?ResourceBufferBase@HttpIndex@@0KA, edx ; HttpIndex::ResourceBufferBase
; Line 45
	mov	eax, DWORD PTR _BufferIndexCount$[ebp]
	mov	DWORD PTR ?ResourceIndexCount@HttpIndex@@0IA, eax ; HttpIndex::ResourceIndexCount
; Line 47
	mov	ecx, DWORD PTR _BufferIndexCount$[ebp]
	imul	ecx, 92					; 0000005cH
	mov	DWORD PTR ?ResourceIndexSize@HttpIndex@@0KA, ecx ; HttpIndex::ResourceIndexSize
; Line 49
	mov	edx, DWORD PTR _BufferSize$[ebp]
	sub	edx, DWORD PTR ?ResourceIndexSize@HttpIndex@@0KA ; HttpIndex::ResourceIndexSize
	mov	DWORD PTR ?ResourceBufferSize@HttpIndex@@0KA, edx ; HttpIndex::ResourceBufferSize
; Line 51
	mov	eax, DWORD PTR ?ResourceBufferBase@HttpIndex@@0KA ; HttpIndex::ResourceBufferBase
	mov	DWORD PTR ?ResourcePtr@HttpIndex@@0KA, eax ; HttpIndex::ResourcePtr
; Line 53
	mov	DWORD PTR ?ResourceIndexPtr@HttpIndex@@0KA, 0 ; HttpIndex::ResourceIndexPtr
; Line 55
	mov	DWORD PTR ?DiskNo@HttpIndex@@0HA, 1	; HttpIndex::DiskNo
; Line 57
	xor	eax, eax
$L943:
; Line 58
	mov	esp, ebp
	pop	ebp
	ret	16					; 00000010H
?init@HttpIndex@@QAEHKKHH@Z ENDP			; HttpIndex::init
_TEXT	ENDS
PUBLIC	?readFloppy@HttpIndex@@QAEHXZ			; HttpIndex::readFloppy
PUBLIC	?sstrcpy@HttpIndex@@AAEHPADH0H@Z		; HttpIndex::sstrcpy
PUBLIC	?sstrcmp@HttpIndex@@AAEHPAD0@Z			; HttpIndex::sstrcmp
PUBLIC	?sstrlen@HttpIndex@@AAEHPAD@Z			; HttpIndex::sstrlen
EXTRN	?AOAgetCharacter@AOAProtected@@QAEDXZ:NEAR	; AOAProtected::AOAgetCharacter
EXTRN	?AOAprintCharacter@AOAProtected@@QAEHDH@Z:NEAR	; AOAProtected::AOAprintCharacter
EXTRN	?AOAprintDecimal@AOAProtected@@QAEHHH@Z:NEAR	; AOAProtected::AOAprintDecimal
EXTRN	?AOAprintHex@AOAProtected@@QAEHJH@Z:NEAR	; AOAProtected::AOAprintHex
EXTRN	?AOAreadFloppy@AOAProtected@@QAEHPADJ@Z:NEAR	; AOAProtected::AOAreadFloppy
EXTRN	?AOAExit@AOAProtected@@QAEXXZ:NEAR		; AOAProtected::AOAExit
EXTRN	?AOAPrintText@AOAProtected@@QAEXPADH@Z:NEAR	; AOAProtected::AOAPrintText
EXTRN	?hashfun@HttphashIndex@@QAEJPADH@Z:NEAR		; HttphashIndex::hashfun
EXTRN	?setIndex@HttphashIndex@@QAEHJK@Z:NEAR		; HttphashIndex::setIndex
EXTRN	?getIndex@HttphashIndex@@QAEKJ@Z:NEAR		; HttphashIndex::getIndex
_DATA	SEGMENT
$SG975	DB	'InsertDisk', 00H
	ORG $+1
$SG976	DB	'and press ENTER when ready...', 00H
	ORG $+2
$SG977	DB	'                               ', 00H
$SG986	DB	'Error:Wrong Disk ', 00H
	ORG $+2
$SG988	DB	'No of files indexed in this sector:', 00H
$SG989	DB	'Index Sector:', 00H
	ORG $+2
$SG995	DB	'Disk Number:', 00H
	ORG $+3
$SG996	DB	'                                                        '
	DB	'                        ', 00H
	ORG $+3
$SG997	DB	'File Name:', 00H
	ORG $+1
$SG998	DB	'File Size:', 00H
	ORG $+1
$SG999	DB	'File Number:', 00H
	ORG $+3
$SG1000	DB	'Index Sector->File Number:', 00H
	ORG $+1
$SG1009	DB	'Error:File exists', 00H
	ORG $+2
$SG1014	DB	'Error:File exists', 00H
	ORG $+2
$SG1026	DB	'DiskWriteComplete:Insufficient Space in the ResourceBuff'
	DB	'er', 00H
	ORG $+1
$SG1028	DB	'DiskWriteComplete:Insufficient Space in the ResourceInde'
	DB	'x', 00H
	ORG $+2
$SG1029	DB	'Status Character:', 00H
	ORG $+2
$SG1032	DB	'Files loaded successfully', 00H
	ORG $+2
$SG1034	DB	'File Loading not Successful', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -1280
_io$ = -552
_a$ = -528
_buffer$ = -1260
_b$ = -532
_buffer1$ = -524
_i$ = -544
_k$ = -560
_NoFilesSectors$ = -8
_TotalFilesRead$ = -4
_tmpindex$ = -540
_tmpresourceindex$ = -12
_tmpres$ = -1268
_filesize$ = -1276
_m$ = -1264
_n$ = -1272
_HashValue$ = -536
_ResourcePtr1$ = -556
?readFloppy@HttpIndex@@QAEHXZ PROC NEAR			; HttpIndex::readFloppy
; Line 62
	push	ebp
	mov	ebp, esp
	sub	esp, 1280				; 00000500H
	mov	DWORD PTR _this$[ebp], ecx
; Line 63
	lea	ecx, DWORD PTR _io$[ebp]
	call	??0AOAProtected@@QAE@XZ			; AOAProtected::AOAProtected
; Line 64
	mov	BYTE PTR _a$[ebp], 67			; 00000043H
	mov	BYTE PTR _b$[ebp], 67			; 00000043H
; Line 65
	mov	DWORD PTR _i$[ebp], 1
; Line 66
	mov	DWORD PTR _k$[ebp], 0
; Line 67
	mov	DWORD PTR _NoFilesSectors$[ebp], 0
; Line 68
	mov	DWORD PTR _TotalFilesRead$[ebp], 0
; Line 69
	mov	DWORD PTR ?DiskNo@HttpIndex@@0HA, 1	; HttpIndex::DiskNo
; Line 72
	mov	eax, DWORD PTR ?ResourceIndexBase@HttpIndex@@0KA ; HttpIndex::ResourceIndexBase
	mov	DWORD PTR _tmpresourceindex$[ebp], eax
; Line 74
	mov	DWORD PTR _filesize$[ebp], 0
; Line 75
	mov	DWORD PTR _m$[ebp], 0
	mov	DWORD PTR _n$[ebp], 0
; Line 78
	mov	BYTE PTR _a$[ebp], 78			; 0000004eH
$L972:
; Line 80
	movsx	ecx, BYTE PTR _a$[ebp]
	cmp	ecx, 78					; 0000004eH
	jne	$L973
$LoopBack$974:
; Line 83
	push	1600					; 00000640H
	push	OFFSET FLAT:$SG975
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 84
	push	1622					; 00000656H
	mov	edx, DWORD PTR ?DiskNo@HttpIndex@@0HA	; HttpIndex::DiskNo
	push	edx
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAprintDecimal@AOAProtected@@QAEHHH@Z	; AOAProtected::AOAprintDecimal
; Line 85
	push	1642					; 0000066aH
	push	OFFSET FLAT:$SG976
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 86
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
; Line 87
	push	1440					; 000005a0H
	push	OFFSET FLAT:$SG977
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 89
	movsx	eax, BYTE PTR _a$[ebp]
	cmp	eax, 78					; 0000004eH
	jne	SHORT $L978
; Line 91
	mov	DWORD PTR _i$[ebp], 1
$L978:
; Line 94
	mov	BYTE PTR _a$[ebp], 67			; 00000043H
; Line 95
	mov	DWORD PTR _m$[ebp], 0
	mov	DWORD PTR _n$[ebp], 0
; Line 96
	mov	ecx, DWORD PTR ?ResourcePtr@HttpIndex@@0KA ; HttpIndex::ResourcePtr
	mov	DWORD PTR _ResourcePtr1$[ebp], ecx
$L981:
; Line 98
	movsx	edx, BYTE PTR _a$[ebp]
	cmp	edx, 67					; 00000043H
	jne	$L982
; Line 104
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	lea	ecx, DWORD PTR _buffer$[ebp]
	push	ecx
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAreadFloppy@AOAProtected@@QAEHPADJ@Z	; AOAProtected::AOAreadFloppy
; Line 105
	lea	edx, DWORD PTR _buffer$[ebp]
	mov	DWORD PTR _tmpindex$[ebp], edx
; Line 106
	movsx	eax, BYTE PTR _buffer$[ebp+484]
	cmp	eax, DWORD PTR ?DiskNo@HttpIndex@@0HA	; HttpIndex::DiskNo
	je	SHORT $L985
; Line 109
	push	1440					; 000005a0H
	push	OFFSET FLAT:$SG986
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 110
	push	1480					; 000005c8H
	movsx	ecx, BYTE PTR _buffer$[ebp+484]
	push	ecx
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAprintDecimal@AOAProtected@@QAEHHH@Z	; AOAProtected::AOAprintDecimal
; Line 111
	jmp	$LoopBack$974
$L985:
; Line 115
	movsx	edx, BYTE PTR _buffer$[ebp+482]
	mov	DWORD PTR _NoFilesSectors$[ebp], edx
; Line 117
	push	1120					; 00000460H
	push	OFFSET FLAT:$SG988
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 118
	push	1192					; 000004a8H
	mov	eax, DWORD PTR _NoFilesSectors$[ebp]
	push	eax
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAprintDecimal@AOAProtected@@QAEHHH@Z	; AOAProtected::AOAprintDecimal
; Line 119
	push	1280					; 00000500H
	push	OFFSET FLAT:$SG989
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 120
	push	1308					; 0000051cH
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 122
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
; Line 123
	cmp	DWORD PTR _NoFilesSectors$[ebp], 5
	jle	SHORT $L990
; Line 126
	or	eax, -1
	jmp	$L952
$L990:
; Line 129
	mov	DWORD PTR _k$[ebp], 0
	jmp	SHORT $L991
$L992:
	mov	eax, DWORD PTR _k$[ebp]
	add	eax, 1
	mov	DWORD PTR _k$[ebp], eax
$L991:
	mov	ecx, DWORD PTR _k$[ebp]
	cmp	ecx, DWORD PTR _NoFilesSectors$[ebp]
	jge	$L993
; Line 133
	push	80					; 00000050H
	mov	edx, DWORD PTR _tmpindex$[ebp]
	push	edx
	push	80					; 00000050H
	mov	eax, DWORD PTR ?ResourceIndexPtr@HttpIndex@@0KA ; HttpIndex::ResourceIndexPtr
	imul	eax, 92					; 0000005cH
	mov	ecx, DWORD PTR _tmpresourceindex$[ebp]
	add	ecx, eax
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?sstrcpy@HttpIndex@@AAEHPADH0H@Z	; HttpIndex::sstrcpy
; Line 134
	mov	edx, DWORD PTR ?ResourceIndexPtr@HttpIndex@@0KA ; HttpIndex::ResourceIndexPtr
	imul	edx, 92					; 0000005cH
	mov	eax, DWORD PTR _tmpresourceindex$[ebp]
	mov	ecx, DWORD PTR ?ResourcePtr@HttpIndex@@0KA ; HttpIndex::ResourcePtr
	mov	DWORD PTR [eax+edx+80], ecx
; Line 135
	mov	edx, DWORD PTR ?ResourceIndexPtr@HttpIndex@@0KA ; HttpIndex::ResourceIndexPtr
	imul	edx, 92					; 0000005cH
	mov	eax, DWORD PTR _tmpresourceindex$[ebp]
	mov	ecx, DWORD PTR _tmpindex$[ebp]
	mov	ecx, DWORD PTR [ecx+92]
	mov	DWORD PTR [eax+edx+84], ecx
; Line 136
	mov	edx, DWORD PTR ?ResourceIndexPtr@HttpIndex@@0KA ; HttpIndex::ResourceIndexPtr
	imul	edx, 92					; 0000005cH
	mov	eax, DWORD PTR _tmpresourceindex$[ebp]
	mov	DWORD PTR [eax+edx+88], 0
; Line 137
	mov	ecx, DWORD PTR _tmpindex$[ebp]
	mov	edx, DWORD PTR [ecx+92]
	mov	DWORD PTR _filesize$[ebp], edx
; Line 140
	push	800					; 00000320H
	push	OFFSET FLAT:$SG995
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 141
	push	828					; 0000033cH
	mov	eax, DWORD PTR ?DiskNo@HttpIndex@@0HA	; HttpIndex::DiskNo
	push	eax
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAprintDecimal@AOAProtected@@QAEHHH@Z	; AOAProtected::AOAprintDecimal
; Line 142
	push	480					; 000001e0H
	push	OFFSET FLAT:$SG996
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 143
	push	860					; 0000035cH
	push	OFFSET FLAT:$SG997
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 144
	push	880					; 00000370H
	mov	ecx, DWORD PTR ?ResourceIndexPtr@HttpIndex@@0KA ; HttpIndex::ResourceIndexPtr
	imul	ecx, 92					; 0000005cH
	mov	edx, DWORD PTR _tmpresourceindex$[ebp]
	add	edx, ecx
	push	edx
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 145
	push	1020					; 000003fcH
	push	OFFSET FLAT:$SG998
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 146
	push	1040					; 00000410H
	mov	eax, DWORD PTR ?ResourceIndexPtr@HttpIndex@@0KA ; HttpIndex::ResourceIndexPtr
	imul	eax, 92					; 0000005cH
	mov	ecx, DWORD PTR _tmpresourceindex$[ebp]
	mov	edx, DWORD PTR [ecx+eax+84]
	push	edx
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAprintDecimal@AOAProtected@@QAEHHH@Z	; AOAProtected::AOAprintDecimal
; Line 147
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG999
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 148
	push	988					; 000003dcH
	mov	eax, DWORD PTR _i$[ebp]
	sub	eax, 2
	imul	eax, 5
	mov	ecx, DWORD PTR _k$[ebp]
	lea	edx, DWORD PTR [eax+ecx+1]
	push	edx
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 149
	push	1120					; 00000460H
	push	OFFSET FLAT:$SG1000
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 150
	push	1170					; 00000492H
	mov	eax, DWORD PTR _k$[ebp]
	add	eax, 1
	push	eax
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAprintDecimal@AOAProtected@@QAEHHH@Z	; AOAProtected::AOAprintDecimal
; Line 155
	mov	ecx, DWORD PTR ?ResourceIndexPtr@HttpIndex@@0KA ; HttpIndex::ResourceIndexPtr
	imul	ecx, 92					; 0000005cH
	mov	edx, DWORD PTR _tmpresourceindex$[ebp]
	add	edx, ecx
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?sstrlen@HttpIndex@@AAEHPAD@Z		; HttpIndex::sstrlen
	push	eax
	mov	eax, DWORD PTR ?ResourceIndexPtr@HttpIndex@@0KA ; HttpIndex::ResourceIndexPtr
	imul	eax, 92					; 0000005cH
	mov	ecx, DWORD PTR _tmpresourceindex$[ebp]
	add	ecx, eax
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?hashfun@HttphashIndex@@QAEJPADH@Z	; HttphashIndex::hashfun
	mov	DWORD PTR _HashValue$[ebp], eax
; Line 156
	mov	edx, DWORD PTR _HashValue$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getIndex@HttphashIndex@@QAEKJ@Z	; HttphashIndex::getIndex
	test	eax, eax
	jne	SHORT $L1001
; Line 159
	mov	eax, DWORD PTR ?ResourceIndexPtr@HttpIndex@@0KA ; HttpIndex::ResourceIndexPtr
	imul	eax, 92					; 0000005cH
	mov	ecx, DWORD PTR _tmpresourceindex$[ebp]
	add	ecx, eax
	push	ecx
	mov	edx, DWORD PTR _HashValue$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?setIndex@HttphashIndex@@QAEHJK@Z	; HttphashIndex::setIndex
; Line 163
	jmp	$L1016
$L1001:
; Line 165
	mov	eax, DWORD PTR _HashValue$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getIndex@HttphashIndex@@QAEKJ@Z	; HttphashIndex::getIndex
	mov	DWORD PTR _tmpres$[ebp], eax
$L1006:
; Line 166
	mov	ecx, DWORD PTR _tmpres$[ebp]
	cmp	DWORD PTR [ecx+88], 0
	je	SHORT $L1007
; Line 168
	mov	edx, DWORD PTR ?ResourceIndexPtr@HttpIndex@@0KA ; HttpIndex::ResourceIndexPtr
	imul	edx, 92					; 0000005cH
	mov	eax, DWORD PTR _tmpresourceindex$[ebp]
	add	eax, edx
	push	eax
	mov	ecx, DWORD PTR _tmpres$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?sstrcmp@HttpIndex@@AAEHPAD0@Z		; HttpIndex::sstrcmp
	test	eax, eax
	jne	SHORT $L1008
; Line 170
	push	1600					; 00000640H
	push	OFFSET FLAT:$SG1009
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 171
	jmp	$L1011
$L1008:
; Line 173
	mov	edx, DWORD PTR _tmpres$[ebp]
	mov	eax, DWORD PTR [edx+88]
	mov	DWORD PTR _tmpres$[ebp], eax
; Line 174
	jmp	SHORT $L1006
$L1007:
; Line 175
	mov	ecx, DWORD PTR ?ResourceIndexPtr@HttpIndex@@0KA ; HttpIndex::ResourceIndexPtr
	imul	ecx, 92					; 0000005cH
	mov	edx, DWORD PTR _tmpresourceindex$[ebp]
	add	edx, ecx
	push	edx
	mov	eax, DWORD PTR _tmpres$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?sstrcmp@HttpIndex@@AAEHPAD0@Z		; HttpIndex::sstrcmp
	test	eax, eax
	jne	SHORT $L1013
; Line 177
	push	1600					; 00000640H
	push	OFFSET FLAT:$SG1014
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 178
	jmp	$L1015
$L1013:
; Line 182
	mov	ecx, DWORD PTR ?ResourceIndexPtr@HttpIndex@@0KA ; HttpIndex::ResourceIndexPtr
	imul	ecx, 92					; 0000005cH
	mov	edx, DWORD PTR _tmpresourceindex$[ebp]
	add	edx, ecx
	mov	eax, DWORD PTR _tmpres$[ebp]
	mov	DWORD PTR [eax+88], edx
$L1016:
; Line 190
	mov	ecx, DWORD PTR _tmpindex$[ebp]
	mov	edx, DWORD PTR [ecx+84]
	mov	DWORD PTR _m$[ebp], edx
	jmp	SHORT $L1018
$L1019:
	mov	eax, DWORD PTR _m$[ebp]
	add	eax, 1
	mov	DWORD PTR _m$[ebp], eax
$L1018:
	mov	ecx, DWORD PTR _tmpindex$[ebp]
	mov	edx, DWORD PTR _m$[ebp]
	cmp	edx, DWORD PTR [ecx+88]
	jg	$L1020
; Line 193
	mov	eax, DWORD PTR _m$[ebp]
	push	eax
	lea	ecx, DWORD PTR _buffer1$[ebp]
	push	ecx
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAreadFloppy@AOAProtected@@QAEHPADJ@Z	; AOAProtected::AOAreadFloppy
; Line 195
	mov	DWORD PTR _n$[ebp], 0
	jmp	SHORT $L1021
$L1022:
	mov	edx, DWORD PTR _n$[ebp]
	add	edx, 1
	mov	DWORD PTR _n$[ebp], edx
$L1021:
	cmp	DWORD PTR _n$[ebp], 512			; 00000200H
	jge	$L1023
	cmp	DWORD PTR _filesize$[ebp], 0
	jbe	SHORT $L1023
; Line 199
	mov	eax, DWORD PTR _ResourcePtr1$[ebp]
	mov	ecx, DWORD PTR _n$[ebp]
	mov	dl, BYTE PTR _buffer1$[ebp+ecx]
	mov	BYTE PTR [eax], dl
; Line 200
	mov	eax, DWORD PTR _ResourcePtr1$[ebp]
	add	eax, 1
	mov	DWORD PTR _ResourcePtr1$[ebp], eax
; Line 201
	mov	ecx, DWORD PTR ?ResourceBufferBase@HttpIndex@@0KA ; HttpIndex::ResourceBufferBase
	add	ecx, DWORD PTR ?ResourceBufferSize@HttpIndex@@0KA ; HttpIndex::ResourceBufferSize
	cmp	DWORD PTR _ResourcePtr1$[ebp], ecx
	jbe	SHORT $L1025
; Line 204
	push	1760					; 000006e0H
	push	OFFSET FLAT:$SG1026
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 205
	mov	eax, -3					; fffffffdH
	jmp	$L952
$L1025:
; Line 208
	mov	edx, DWORD PTR ?ResourcePtr@HttpIndex@@0KA ; HttpIndex::ResourcePtr
	add	edx, 1
	mov	DWORD PTR ?ResourcePtr@HttpIndex@@0KA, edx ; HttpIndex::ResourcePtr
; Line 209
	mov	eax, DWORD PTR _filesize$[ebp]
	sub	eax, 1
	mov	DWORD PTR _filesize$[ebp], eax
; Line 210
	jmp	$L1022
$L1023:
; Line 211
	jmp	$L1019
$L1020:
; Line 213
	mov	ecx, DWORD PTR ?ResourceIndexPtr@HttpIndex@@0KA ; HttpIndex::ResourceIndexPtr
	add	ecx, 1
	cmp	ecx, DWORD PTR ?ResourceIndexCount@HttpIndex@@0IA ; HttpIndex::ResourceIndexCount
	jbe	SHORT $L1027
; Line 216
	push	1760					; 000006e0H
	push	OFFSET FLAT:$SG1028
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 217
	mov	eax, -2					; fffffffeH
	jmp	$L952
$L1027:
; Line 219
	mov	edx, DWORD PTR ?ResourceIndexPtr@HttpIndex@@0KA ; HttpIndex::ResourceIndexPtr
	add	edx, 1
	mov	DWORD PTR ?ResourceIndexPtr@HttpIndex@@0KA, edx ; HttpIndex::ResourceIndexPtr
$FileExist$1010:
; Line 222
	mov	eax, DWORD PTR _tmpindex$[ebp]
	add	eax, 96					; 00000060H
	mov	DWORD PTR _tmpindex$[ebp], eax
; Line 223
	jmp	$L992
$L993:
; Line 224
	mov	cl, BYTE PTR _buffer$[ebp+483]
	mov	BYTE PTR _a$[ebp], cl
; Line 225
	push	1280					; 00000500H
	push	OFFSET FLAT:$SG1029
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 226
	push	1316					; 00000524H
	mov	dl, BYTE PTR _a$[ebp]
	push	edx
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAprintCharacter@AOAProtected@@QAEHDH@Z ; AOAProtected::AOAprintCharacter
; Line 228
	jmp	$L981
$L982:
; Line 229
	movsx	eax, BYTE PTR _a$[ebp]
	cmp	eax, 78					; 0000004eH
	jne	SHORT $L1030
; Line 231
	mov	ecx, DWORD PTR ?DiskNo@HttpIndex@@0HA	; HttpIndex::DiskNo
	add	ecx, 1
	mov	DWORD PTR ?DiskNo@HttpIndex@@0HA, ecx	; HttpIndex::DiskNo
$L1030:
; Line 235
	jmp	$L972
$L973:
; Line 236
	movsx	edx, BYTE PTR _a$[ebp]
	cmp	edx, 69					; 00000045H
	jne	SHORT $L1031
; Line 238
	push	1760					; 000006e0H
	push	OFFSET FLAT:$SG1032
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 241
	jmp	SHORT $L1033
$L1031:
; Line 243
	push	1760					; 000006e0H
	push	OFFSET FLAT:$SG1034
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 244
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAExit@AOAProtected@@QAEXXZ		; AOAProtected::AOAExit
$L1033:
; Line 246
	xor	eax, eax
	jmp	SHORT $L952
$L1015:
; Line 247
	jmp	$FileExist$1010
$L1011:
	jmp	$FileExist$1010
$L952:
	mov	esp, ebp
	pop	ebp
	ret	0
?readFloppy@HttpIndex@@QAEHXZ ENDP			; HttpIndex::readFloppy
_TEXT	ENDS
PUBLIC	?getFile@HttpIndex@@QAEHPADPAK1@Z		; HttpIndex::getFile
_TEXT	SEGMENT
_FileName$ = 8
_FileStartAddress$ = 12
_FileSize$ = 16
_this$ = -24
_HashValue$ = -4
_IndexAddress$ = -16
_tmpres$ = -20
_io$ = -12
?getFile@HttpIndex@@QAEHPADPAK1@Z PROC NEAR		; HttpIndex::getFile
; Line 251
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	mov	DWORD PTR _this$[ebp], ecx
; Line 252
	mov	DWORD PTR _HashValue$[ebp], 0
; Line 255
	mov	eax, DWORD PTR _FileName$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?sstrlen@HttpIndex@@AAEHPAD@Z		; HttpIndex::sstrlen
	push	eax
	mov	ecx, DWORD PTR _FileName$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?hashfun@HttphashIndex@@QAEJPADH@Z	; HttphashIndex::hashfun
	mov	DWORD PTR _HashValue$[ebp], eax
; Line 256
	mov	edx, DWORD PTR _HashValue$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getIndex@HttphashIndex@@QAEKJ@Z	; HttphashIndex::getIndex
	mov	DWORD PTR _IndexAddress$[ebp], eax
; Line 257
	lea	ecx, DWORD PTR _io$[ebp]
	call	??0AOAProtected@@QAE@XZ			; AOAProtected::AOAProtected
$L1046:
; Line 259
	cmp	DWORD PTR _IndexAddress$[ebp], 0
	je	SHORT $L1047
; Line 261
	mov	eax, DWORD PTR _IndexAddress$[ebp]
	mov	DWORD PTR _tmpres$[ebp], eax
; Line 263
	mov	ecx, DWORD PTR _FileName$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tmpres$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?sstrcmp@HttpIndex@@AAEHPAD0@Z		; HttpIndex::sstrcmp
	test	eax, eax
	jne	SHORT $L1049
; Line 266
	mov	eax, DWORD PTR _FileStartAddress$[ebp]
	mov	ecx, DWORD PTR _tmpres$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	DWORD PTR [eax], edx
; Line 267
	mov	eax, DWORD PTR _FileSize$[ebp]
	mov	ecx, DWORD PTR _tmpres$[ebp]
	mov	edx, DWORD PTR [ecx+84]
	mov	DWORD PTR [eax], edx
; Line 268
	xor	eax, eax
	jmp	SHORT $L1040
$L1049:
; Line 270
	mov	eax, DWORD PTR _tmpres$[ebp]
	mov	ecx, DWORD PTR [eax+88]
	mov	DWORD PTR _IndexAddress$[ebp], ecx
; Line 271
	jmp	SHORT $L1046
$L1047:
; Line 272
	or	eax, -1
$L1040:
; Line 274
	mov	esp, ebp
	pop	ebp
	ret	12					; 0000000cH
?getFile@HttpIndex@@QAEHPADPAK1@Z ENDP			; HttpIndex::getFile
_D_Str$ = 8
_S_Str$ = 12
_this$ = -16
_i$ = -12
_io$ = -8
?sstrcmp@HttpIndex@@AAEHPAD0@Z PROC NEAR		; HttpIndex::sstrcmp
; Line 277
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	esi
	mov	DWORD PTR _this$[ebp], ecx
; Line 278
	mov	DWORD PTR _i$[ebp], 0
; Line 279
	lea	ecx, DWORD PTR _io$[ebp]
	call	??0AOAProtected@@QAE@XZ			; AOAProtected::AOAProtected
; Line 280
	mov	eax, DWORD PTR _D_Str$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?sstrlen@HttpIndex@@AAEHPAD@Z		; HttpIndex::sstrlen
	mov	esi, eax
	mov	ecx, DWORD PTR _S_Str$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?sstrlen@HttpIndex@@AAEHPAD@Z		; HttpIndex::sstrlen
	cmp	esi, eax
	je	SHORT $L1057
; Line 282
	or	eax, -1
	jmp	$L1054
$L1057:
; Line 285
	mov	edx, DWORD PTR _D_Str$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	jne	SHORT $L1061
	mov	ecx, DWORD PTR _S_Str$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	$L1060
$L1061:
; Line 291
	mov	eax, DWORD PTR _D_Str$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	movsx	ecx, BYTE PTR [eax]
	mov	edx, DWORD PTR _S_Str$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR [edx]
	cmp	ecx, eax
	jne	SHORT $L1062
; Line 293
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
; Line 295
	jmp	SHORT $L1070
$L1062:
	mov	edx, DWORD PTR _D_Str$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, 47					; 0000002fH
	jne	SHORT $L1064
; Line 298
	or	eax, -1
	jmp	SHORT $L1054
$L1064:
; Line 301
	mov	ecx, DWORD PTR _D_Str$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, 92					; 0000005cH
	jne	SHORT $L1067
; Line 303
	mov	eax, DWORD PTR _S_Str$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 47					; 0000002fH
	je	SHORT $L1068
; Line 304
	or	eax, -1
	jmp	SHORT $L1054
$L1068:
; Line 305
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
; Line 308
	jmp	SHORT $L1070
$L1067:
	mov	eax, DWORD PTR _D_Str$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	movsx	ecx, BYTE PTR [eax]
	mov	edx, DWORD PTR _S_Str$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR [edx]
	cmp	ecx, eax
	je	SHORT $L1070
; Line 310
	or	eax, -1
	jmp	SHORT $L1054
$L1070:
; Line 313
	jmp	$L1057
$L1060:
; Line 314
	mov	ecx, DWORD PTR _D_Str$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	jne	SHORT $L1071
	mov	eax, DWORD PTR _S_Str$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	jne	SHORT $L1071
; Line 316
	xor	eax, eax
	jmp	SHORT $L1054
$L1071:
; Line 320
	or	eax, -1
$L1054:
; Line 323
	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	8
?sstrcmp@HttpIndex@@AAEHPAD0@Z ENDP			; HttpIndex::sstrcmp
_D_Str$ = 8
_D_Size$ = 12
_S_Str$ = 16
_S_Size$ = 20
_this$ = -12
_i$ = -8
_D_Full_flag$ = -4
?sstrcpy@HttpIndex@@AAEHPADH0H@Z PROC NEAR		; HttpIndex::sstrcpy
; Line 326
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 327
	mov	DWORD PTR _i$[ebp], 0
; Line 328
	mov	DWORD PTR _D_Full_flag$[ebp], 0
; Line 329
	cmp	DWORD PTR _D_Size$[ebp], 2
	jge	SHORT $L1084
; Line 331
	cmp	DWORD PTR _D_Size$[ebp], 1
	jge	SHORT $L1083
; Line 332
	or	eax, -1
	jmp	$L1079
$L1083:
; Line 333
	cmp	DWORD PTR _D_Size$[ebp], 1
	jne	SHORT $L1084
; Line 335
	mov	eax, DWORD PTR _D_Str$[ebp]
	mov	BYTE PTR [eax], 0
; Line 336
	xor	eax, eax
	jmp	$L1079
$L1084:
; Line 339
	cmp	DWORD PTR _S_Size$[ebp], 2
	jge	SHORT $L1085
; Line 341
	mov	ecx, DWORD PTR _D_Str$[ebp]
	mov	BYTE PTR [ecx], 0
; Line 342
	xor	eax, eax
	jmp	SHORT $L1079
$L1085:
; Line 344
	mov	edx, DWORD PTR _S_Str$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L1088
; Line 346
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _D_Size$[ebp]
	jge	SHORT $L1089
; Line 348
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _S_Size$[ebp]
	jge	SHORT $L1090
; Line 349
	mov	eax, DWORD PTR _D_Str$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _S_Str$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	dl, BYTE PTR [ecx]
	mov	BYTE PTR [eax], dl
; Line 350
	jmp	SHORT $L1091
$L1090:
; Line 352
	mov	eax, DWORD PTR _D_Str$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	mov	BYTE PTR [eax], 0
; Line 353
	xor	eax, eax
	jmp	SHORT $L1079
$L1091:
; Line 356
	jmp	SHORT $L1092
$L1089:
; Line 358
	mov	ecx, DWORD PTR _D_Str$[ebp]
	add	ecx, DWORD PTR _D_Size$[ebp]
	mov	BYTE PTR [ecx-1], 0
; Line 359
	xor	eax, eax
	jmp	SHORT $L1079
$L1092:
; Line 361
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
; Line 362
	jmp	SHORT $L1085
$L1088:
; Line 363
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _D_Size$[ebp]
	jge	SHORT $L1093
; Line 365
	mov	ecx, DWORD PTR _D_Str$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	BYTE PTR [ecx], 0
; Line 367
	jmp	SHORT $L1094
$L1093:
; Line 369
	mov	edx, DWORD PTR _D_Str$[ebp]
	add	edx, DWORD PTR _D_Size$[ebp]
	mov	BYTE PTR [edx-1], 0
$L1094:
; Line 371
	xor	eax, eax
$L1079:
; Line 372
	mov	esp, ebp
	pop	ebp
	ret	16					; 00000010H
?sstrcpy@HttpIndex@@AAEHPADH0H@Z ENDP			; HttpIndex::sstrcpy
_str$ = 8
_this$ = -8
_len$ = -4
?sstrlen@HttpIndex@@AAEHPAD@Z PROC NEAR			; HttpIndex::sstrlen
; Line 375
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 377
	mov	DWORD PTR _len$[ebp], 0
$L1101:
; Line 379
	mov	eax, DWORD PTR _str$[ebp]
	add	eax, DWORD PTR _len$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L1102
; Line 381
	mov	edx, DWORD PTR _len$[ebp]
	add	edx, 1
	mov	DWORD PTR _len$[ebp], edx
; Line 382
	jmp	SHORT $L1101
$L1102:
; Line 383
	mov	eax, DWORD PTR _len$[ebp]
; Line 384
	mov	esp, ebp
	pop	ebp
	ret	4
?sstrlen@HttpIndex@@AAEHPAD@Z ENDP			; HttpIndex::sstrlen
_TEXT	ENDS
END
