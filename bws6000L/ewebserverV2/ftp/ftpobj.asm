	TITLE	ftpobj.cpp
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
PUBLIC	?nextseq@FTPObj@@0IA				; FTPObj::nextseq
PUBLIC	?ResourceIndexBase@FTPObj@@0KA			; FTPObj::ResourceIndexBase
PUBLIC	?ResourceBufferBase@FTPObj@@0KA			; FTPObj::ResourceBufferBase
PUBLIC	?ResourceIndexCount@FTPObj@@0IA			; FTPObj::ResourceIndexCount
PUBLIC	?ResourceBufferSize@FTPObj@@0KA			; FTPObj::ResourceBufferSize
PUBLIC	?ResourceIndexSize@FTPObj@@0KA			; FTPObj::ResourceIndexSize
PUBLIC	?ResourcePtr@FTPObj@@0KA			; FTPObj::ResourcePtr
PUBLIC	?ResourceIndexPtr@FTPObj@@0KA			; FTPObj::ResourceIndexPtr
PUBLIC	?curraddress@FTPObj@@0PADA			; FTPObj::curraddress
PUBLIC	?tftppkts@FTPObj@@0KA				; FTPObj::tftppkts
PUBLIC	?LostPkts@FTPObj@@0PAIA				; FTPObj::LostPkts
PUBLIC	?TotalFilePkts@FTPObj@@0IA			; FTPObj::TotalFilePkts
PUBLIC	?MaxPktSize@FTPObj@@0IA				; FTPObj::MaxPktSize
PUBLIC	?TotalLostPkts@FTPObj@@0IA			; FTPObj::TotalLostPkts
PUBLIC	?TFileSize@FTPObj@@0KA				; FTPObj::TFileSize
PUBLIC	?IP@FTPObj@@2PADA				; FTPObj::IP
PUBLIC	?DestMac@FTPObj@@2PADA				; FTPObj::DestMac
PUBLIC	?port@FTPObj@@2GA				; FTPObj::port
PUBLIC	?state@FTPObj@@2HA				; FTPObj::state
PUBLIC	?fileTransferFinished@FTPObj@@2HA		; FTPObj::fileTransferFinished
_BSS	SEGMENT
?nextseq@FTPObj@@0IA DD 01H DUP (?)			; FTPObj::nextseq
?ResourceIndexBase@FTPObj@@0KA DD 01H DUP (?)		; FTPObj::ResourceIndexBase
?ResourceBufferBase@FTPObj@@0KA DD 01H DUP (?)		; FTPObj::ResourceBufferBase
?ResourceIndexCount@FTPObj@@0IA DD 01H DUP (?)		; FTPObj::ResourceIndexCount
?ResourceBufferSize@FTPObj@@0KA DD 01H DUP (?)		; FTPObj::ResourceBufferSize
?ResourceIndexSize@FTPObj@@0KA DD 01H DUP (?)		; FTPObj::ResourceIndexSize
?ResourcePtr@FTPObj@@0KA DD 01H DUP (?)			; FTPObj::ResourcePtr
?ResourceIndexPtr@FTPObj@@0KA DD 01H DUP (?)		; FTPObj::ResourceIndexPtr
?curraddress@FTPObj@@0PADA DD 01H DUP (?)		; FTPObj::curraddress
?tftppkts@FTPObj@@0KA DD 01H DUP (?)			; FTPObj::tftppkts
?LostPkts@FTPObj@@0PAIA DD 0fa0H DUP (?)		; FTPObj::LostPkts
?TotalFilePkts@FTPObj@@0IA DD 01H DUP (?)		; FTPObj::TotalFilePkts
?TotalLostPkts@FTPObj@@0IA DD 01H DUP (?)		; FTPObj::TotalLostPkts
?TFileSize@FTPObj@@0KA DD 01H DUP (?)			; FTPObj::TFileSize
?IP@FTPObj@@2PADA DB 04H DUP (?)			; FTPObj::IP
?DestMac@FTPObj@@2PADA DB 06H DUP (?)			; FTPObj::DestMac
	ALIGN	4

?port@FTPObj@@2GA DW 01H DUP (?)			; FTPObj::port
	ALIGN	4

?state@FTPObj@@2HA DD 01H DUP (?)			; FTPObj::state
?fileTransferFinished@FTPObj@@2HA DD 01H DUP (?)	; FTPObj::fileTransferFinished
_BSS	ENDS
_DATA	SEGMENT
?MaxPktSize@FTPObj@@0IA DD 03e8H			; FTPObj::MaxPktSize
_DATA	ENDS
PUBLIC	?init@FTPObj@@QAEHKKHHPADG@Z			; FTPObj::init
EXTRN	?init@HttphashIndex@@QAEHJK@Z:NEAR		; HttphashIndex::init
_TEXT	SEGMENT
_BufferBase$ = 8
_BufferSize$ = 12
_BufferIndexCount$ = 16
_hashIndexCount$ = 20
_ftpDestIP$ = 24
_ftpDestPort$ = 28
_this$ = -16
_HashIndexSize$ = -8
_i$ = -12
_tmpresourceindex$ = -4
?init@FTPObj@@QAEHKKHHPADG@Z PROC NEAR			; FTPObj::init
; File ftpobj.cpp
; Line 57
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	mov	DWORD PTR _this$[ebp], ecx
; Line 60
	mov	DWORD PTR _HashIndexSize$[ebp], 0
; Line 61
	mov	DWORD PTR _i$[ebp], 0
; Line 64
	mov	eax, DWORD PTR _BufferBase$[ebp]
	push	eax
	mov	ecx, DWORD PTR _hashIndexCount$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?init@HttphashIndex@@QAEHJK@Z		; HttphashIndex::init
	mov	DWORD PTR _HashIndexSize$[ebp], eax
; Line 66
	mov	edx, DWORD PTR _BufferBase$[ebp]
	add	edx, DWORD PTR _HashIndexSize$[ebp]
	mov	DWORD PTR ?ResourceIndexBase@FTPObj@@0KA, edx ; FTPObj::ResourceIndexBase
; Line 68
	mov	eax, DWORD PTR _BufferIndexCount$[ebp]
	imul	eax, 92					; 0000005cH
	mov	ecx, DWORD PTR _BufferBase$[ebp]
	add	ecx, eax
	add	ecx, DWORD PTR _HashIndexSize$[ebp]
	mov	DWORD PTR ?ResourceBufferBase@FTPObj@@0KA, ecx ; FTPObj::ResourceBufferBase
; Line 70
	mov	edx, DWORD PTR ?ResourceBufferBase@FTPObj@@0KA ; FTPObj::ResourceBufferBase
	mov	DWORD PTR ?curraddress@FTPObj@@0PADA, edx ; FTPObj::curraddress
; Line 72
	mov	eax, DWORD PTR _BufferIndexCount$[ebp]
	mov	DWORD PTR ?ResourceIndexCount@FTPObj@@0IA, eax ; FTPObj::ResourceIndexCount
; Line 74
	mov	ecx, DWORD PTR _BufferIndexCount$[ebp]
	imul	ecx, 92					; 0000005cH
	mov	DWORD PTR ?ResourceIndexSize@FTPObj@@0KA, ecx ; FTPObj::ResourceIndexSize
; Line 76
	mov	edx, DWORD PTR ?ResourceIndexSize@FTPObj@@0KA ; FTPObj::ResourceIndexSize
	add	edx, DWORD PTR _HashIndexSize$[ebp]
	mov	eax, DWORD PTR _BufferSize$[ebp]
	sub	eax, edx
	mov	DWORD PTR ?ResourceBufferSize@FTPObj@@0KA, eax ; FTPObj::ResourceBufferSize
; Line 78
	mov	ecx, DWORD PTR ?ResourceBufferBase@FTPObj@@0KA ; FTPObj::ResourceBufferBase
	mov	DWORD PTR ?ResourcePtr@FTPObj@@0KA, ecx	; FTPObj::ResourcePtr
; Line 80
	mov	DWORD PTR ?ResourceIndexPtr@FTPObj@@0KA, 0 ; FTPObj::ResourceIndexPtr
; Line 82
	mov	DWORD PTR ?nextseq@FTPObj@@0IA, 0	; FTPObj::nextseq
; Line 84
	mov	edx, DWORD PTR _ftpDestIP$[ebp]
	mov	al, BYTE PTR [edx]
	mov	BYTE PTR ?IP@FTPObj@@2PADA, al
; Line 85
	mov	ecx, DWORD PTR _ftpDestIP$[ebp]
	mov	dl, BYTE PTR [ecx+1]
	mov	BYTE PTR ?IP@FTPObj@@2PADA+1, dl
; Line 86
	mov	eax, DWORD PTR _ftpDestIP$[ebp]
	mov	cl, BYTE PTR [eax+2]
	mov	BYTE PTR ?IP@FTPObj@@2PADA+2, cl
; Line 87
	mov	edx, DWORD PTR _ftpDestIP$[ebp]
	mov	al, BYTE PTR [edx+3]
	mov	BYTE PTR ?IP@FTPObj@@2PADA+3, al
; Line 89
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1634
$L1635:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L1634:
	cmp	DWORD PTR _i$[ebp], 6
	jge	SHORT $L1636
; Line 91
	mov	BYTE PTR ?DestMac@FTPObj@@2PADA, 0
; Line 92
	jmp	SHORT $L1635
$L1636:
; Line 94
	mov	dx, WORD PTR _ftpDestPort$[ebp]
	mov	WORD PTR ?port@FTPObj@@2GA, dx		; FTPObj::port
; Line 95
	mov	eax, DWORD PTR ?ResourceIndexBase@FTPObj@@0KA ; FTPObj::ResourceIndexBase
	mov	DWORD PTR _tmpresourceindex$[ebp], eax
; Line 96
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1638
$L1639:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L1638:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _hashIndexCount$[ebp]
	jge	SHORT $L1640
; Line 98
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 92					; 0000005cH
	mov	ecx, DWORD PTR _tmpresourceindex$[ebp]
	mov	DWORD PTR [ecx+eax+88], 0
; Line 99
	jmp	SHORT $L1639
$L1640:
; Line 100
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1641
$L1642:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L1641:
	cmp	DWORD PTR _i$[ebp], 4000		; 00000fa0H
	jge	SHORT $L1643
; Line 102
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR ?LostPkts@FTPObj@@0PAIA[eax*4], 0
; Line 103
	jmp	SHORT $L1642
$L1643:
; Line 106
	mov	DWORD PTR ?TotalLostPkts@FTPObj@@0IA, 0	; FTPObj::TotalLostPkts
; Line 108
	mov	DWORD PTR ?TotalFilePkts@FTPObj@@0IA, 0	; FTPObj::TotalFilePkts
; Line 112
	mov	DWORD PTR ?MaxPktSize@FTPObj@@0IA, 1000	; FTPObj::MaxPktSize, 000003e8H
; Line 114
	mov	DWORD PTR ?state@FTPObj@@2HA, 1		; FTPObj::state
; Line 116
	mov	DWORD PTR ?fileTransferFinished@FTPObj@@2HA, 0 ; FTPObj::fileTransferFinished
; Line 118
	xor	eax, eax
; Line 119
	mov	esp, ebp
	pop	ebp
	ret	24					; 00000018H
?init@FTPObj@@QAEHKKHHPADG@Z ENDP			; FTPObj::init
_TEXT	ENDS
PUBLIC	?sstrcmp@FTPObj@@AAEHPAD0@Z			; FTPObj::sstrcmp
PUBLIC	?sstrlen@FTPObj@@AAEHPAD@Z			; FTPObj::sstrlen
PUBLIC	?getFile@FTPObj@@QAEHPADPAK1@Z			; FTPObj::getFile
EXTRN	?hashfun@HttphashIndex@@QAEJPADH@Z:NEAR		; HttphashIndex::hashfun
EXTRN	?getIndex@HttphashIndex@@QAEKJ@Z:NEAR		; HttphashIndex::getIndex
_TEXT	SEGMENT
_FileName$ = 8
_FileStartAddress$ = 12
_FileSize$ = 16
_this$ = -16
_HashValue$ = -4
_IndexAddress$ = -8
_tmpres$ = -12
?getFile@FTPObj@@QAEHPADPAK1@Z PROC NEAR		; FTPObj::getFile
; Line 122
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	mov	DWORD PTR _this$[ebp], ecx
; Line 123
	mov	DWORD PTR _HashValue$[ebp], 0
; Line 127
	mov	eax, DWORD PTR _FileName$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?sstrlen@FTPObj@@AAEHPAD@Z		; FTPObj::sstrlen
	push	eax
	mov	ecx, DWORD PTR _FileName$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?hashfun@HttphashIndex@@QAEJPADH@Z	; HttphashIndex::hashfun
	mov	DWORD PTR _HashValue$[ebp], eax
; Line 128
	mov	edx, DWORD PTR _HashValue$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?getIndex@HttphashIndex@@QAEKJ@Z	; HttphashIndex::getIndex
	mov	DWORD PTR _IndexAddress$[ebp], eax
$L1654:
; Line 131
	cmp	DWORD PTR _IndexAddress$[ebp], 0
	je	SHORT $L1655
; Line 133
	mov	eax, DWORD PTR _IndexAddress$[ebp]
	mov	DWORD PTR _tmpres$[ebp], eax
; Line 135
	mov	ecx, DWORD PTR _FileName$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tmpres$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?sstrcmp@FTPObj@@AAEHPAD0@Z		; FTPObj::sstrcmp
	test	eax, eax
	jne	SHORT $L1657
; Line 138
	mov	eax, DWORD PTR _FileStartAddress$[ebp]
	mov	ecx, DWORD PTR _tmpres$[ebp]
	mov	edx, DWORD PTR [ecx+80]
	mov	DWORD PTR [eax], edx
; Line 139
	mov	eax, DWORD PTR _FileSize$[ebp]
	mov	ecx, DWORD PTR _tmpres$[ebp]
	mov	edx, DWORD PTR [ecx+84]
	mov	DWORD PTR [eax], edx
; Line 140
	xor	eax, eax
	jmp	SHORT $L1649
$L1657:
; Line 142
	mov	eax, DWORD PTR _tmpres$[ebp]
	mov	ecx, DWORD PTR [eax+88]
	mov	DWORD PTR _IndexAddress$[ebp], ecx
; Line 143
	jmp	SHORT $L1654
$L1655:
; Line 145
	or	eax, -1
$L1649:
; Line 146
	mov	esp, ebp
	pop	ebp
	ret	12					; 0000000cH
?getFile@FTPObj@@QAEHPADPAK1@Z ENDP			; FTPObj::getFile
_TEXT	ENDS
EXTRN	??0AOAProtected@@QAE@XZ:NEAR			; AOAProtected::AOAProtected
_TEXT	SEGMENT
_D_Str$ = 8
_S_Str$ = 12
_this$ = -16
_i$ = -12
_io$ = -8
?sstrcmp@FTPObj@@AAEHPAD0@Z PROC NEAR			; FTPObj::sstrcmp
; Line 149
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	esi
	mov	DWORD PTR _this$[ebp], ecx
; Line 150
	mov	DWORD PTR _i$[ebp], 0
; Line 151
	lea	ecx, DWORD PTR _io$[ebp]
	call	??0AOAProtected@@QAE@XZ			; AOAProtected::AOAProtected
; Line 153
	mov	eax, DWORD PTR _D_Str$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?sstrlen@FTPObj@@AAEHPAD@Z		; FTPObj::sstrlen
	mov	esi, eax
	mov	ecx, DWORD PTR _S_Str$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?sstrlen@FTPObj@@AAEHPAD@Z		; FTPObj::sstrlen
	cmp	esi, eax
	je	SHORT $L1665
; Line 155
	or	eax, -1
	jmp	$L1677
$L1665:
; Line 158
	mov	DWORD PTR _i$[ebp], 0
$L1667:
; Line 159
	mov	edx, DWORD PTR _D_Str$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	jne	SHORT $L1669
	mov	ecx, DWORD PTR _S_Str$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	je	SHORT $L1668
$L1669:
; Line 161
	mov	eax, DWORD PTR _D_Str$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	jne	SHORT $L1670
; Line 162
	jmp	SHORT $L1668
$L1670:
; Line 163
	cmp	DWORD PTR _i$[ebp], 80			; 00000050H
	jle	SHORT $L1671
; Line 165
	jmp	SHORT $L1668
$L1671:
; Line 167
	mov	edx, DWORD PTR _S_Str$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	jne	SHORT $L1672
; Line 168
	jmp	SHORT $L1668
$L1672:
; Line 169
	mov	ecx, DWORD PTR _D_Str$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	movsx	edx, BYTE PTR [ecx]
	mov	eax, DWORD PTR _S_Str$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	edx, ecx
	jne	SHORT $L1673
; Line 171
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
; Line 173
	jmp	SHORT $L1675
$L1673:
	mov	eax, DWORD PTR _D_Str$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	movsx	ecx, BYTE PTR [eax]
	mov	edx, DWORD PTR _S_Str$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR [edx]
	cmp	ecx, eax
	je	SHORT $L1675
; Line 175
	or	eax, -1
	jmp	SHORT $L1677
$L1675:
; Line 178
	jmp	SHORT $L1667
$L1668:
; Line 179
	mov	ecx, DWORD PTR _D_Str$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	movsx	edx, BYTE PTR [ecx]
	test	edx, edx
	jne	SHORT $L1676
	mov	eax, DWORD PTR _S_Str$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	jne	SHORT $L1676
; Line 181
	xor	eax, eax
	jmp	SHORT $L1677
$L1676:
; Line 185
	or	eax, -1
$L1677:
; Line 187
	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	8
?sstrcmp@FTPObj@@AAEHPAD0@Z ENDP			; FTPObj::sstrcmp
_TEXT	ENDS
PUBLIC	?sstrcpy@FTPObj@@AAEHPADH0H@Z			; FTPObj::sstrcpy
_TEXT	SEGMENT
_D_Str$ = 8
_D_Size$ = 12
_S_Str$ = 16
_S_Size$ = 20
_this$ = -12
_i$ = -8
_D_Full_flag$ = -4
?sstrcpy@FTPObj@@AAEHPADH0H@Z PROC NEAR			; FTPObj::sstrcpy
; Line 190
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 191
	mov	DWORD PTR _i$[ebp], 0
; Line 192
	mov	DWORD PTR _D_Full_flag$[ebp], 0
; Line 193
	cmp	DWORD PTR _D_Size$[ebp], 2
	jge	SHORT $L1689
; Line 195
	cmp	DWORD PTR _D_Size$[ebp], 1
	jge	SHORT $L1688
; Line 196
	or	eax, -1
	jmp	$L1684
$L1688:
; Line 197
	cmp	DWORD PTR _D_Size$[ebp], 1
	jne	SHORT $L1689
; Line 199
	mov	eax, DWORD PTR _D_Str$[ebp]
	mov	BYTE PTR [eax], 0
; Line 200
	xor	eax, eax
	jmp	$L1684
$L1689:
; Line 203
	cmp	DWORD PTR _S_Size$[ebp], 2
	jge	SHORT $L1690
; Line 205
	mov	ecx, DWORD PTR _D_Str$[ebp]
	mov	BYTE PTR [ecx], 0
; Line 206
	xor	eax, eax
	jmp	$L1684
$L1690:
; Line 208
	mov	DWORD PTR _i$[ebp], 0
$L1692:
; Line 209
	mov	edx, DWORD PTR _S_Str$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR [edx]
	test	eax, eax
	je	SHORT $L1693
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _S_Size$[ebp]
	jg	SHORT $L1693
; Line 211
	mov	edx, DWORD PTR _S_Str$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, 92					; 0000005cH
	jne	SHORT $L1694
; Line 213
	mov	ecx, DWORD PTR _S_Str$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	BYTE PTR [ecx], 47			; 0000002fH
$L1694:
; Line 216
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
; Line 217
	jmp	SHORT $L1692
$L1693:
; Line 219
	mov	DWORD PTR _i$[ebp], 0
$L1696:
; Line 220
	mov	eax, DWORD PTR _S_Str$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L1697
; Line 222
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _D_Size$[ebp]
	jge	SHORT $L1698
; Line 224
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _S_Size$[ebp]
	jge	SHORT $L1699
; Line 225
	mov	ecx, DWORD PTR _D_Str$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _S_Str$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	mov	al, BYTE PTR [edx]
	mov	BYTE PTR [ecx], al
; Line 226
	jmp	SHORT $L1700
$L1699:
; Line 228
	mov	ecx, DWORD PTR _D_Str$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	BYTE PTR [ecx], 0
; Line 229
	xor	eax, eax
	jmp	SHORT $L1684
$L1700:
; Line 232
	jmp	SHORT $L1701
$L1698:
; Line 234
	mov	edx, DWORD PTR _D_Str$[ebp]
	add	edx, DWORD PTR _D_Size$[ebp]
	mov	BYTE PTR [edx-1], 0
; Line 235
	xor	eax, eax
	jmp	SHORT $L1684
$L1701:
; Line 237
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
; Line 238
	jmp	SHORT $L1696
$L1697:
; Line 239
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _D_Size$[ebp]
	jge	SHORT $L1702
; Line 241
	mov	edx, DWORD PTR _D_Str$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	mov	BYTE PTR [edx], 0
; Line 243
	jmp	SHORT $L1703
$L1702:
; Line 245
	mov	eax, DWORD PTR _D_Str$[ebp]
	add	eax, DWORD PTR _D_Size$[ebp]
	mov	BYTE PTR [eax-1], 0
$L1703:
; Line 247
	xor	eax, eax
$L1684:
; Line 248
	mov	esp, ebp
	pop	ebp
	ret	16					; 00000010H
?sstrcpy@FTPObj@@AAEHPADH0H@Z ENDP			; FTPObj::sstrcpy
_str$ = 8
_this$ = -8
_len$ = -4
?sstrlen@FTPObj@@AAEHPAD@Z PROC NEAR			; FTPObj::sstrlen
; Line 251
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 253
	mov	DWORD PTR _len$[ebp], 0
$L1710:
; Line 255
	mov	eax, DWORD PTR _str$[ebp]
	add	eax, DWORD PTR _len$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	SHORT $L1711
; Line 257
	mov	edx, DWORD PTR _len$[ebp]
	add	edx, 1
	mov	DWORD PTR _len$[ebp], edx
; Line 258
	jmp	SHORT $L1710
$L1711:
; Line 259
	mov	eax, DWORD PTR _len$[ebp]
; Line 260
	mov	esp, ebp
	pop	ebp
	ret	4
?sstrlen@FTPObj@@AAEHPAD@Z ENDP				; FTPObj::sstrlen
_TEXT	ENDS
PUBLIC	?StartTransfer@FTPObj@@QAEHPADGH@Z		; FTPObj::StartTransfer
EXTRN	??0ARPObj@@QAE@XZ:NEAR				; ARPObj::ARPObj
EXTRN	?Resolve@ARPObj@@QAEHPAD0H@Z:NEAR		; ARPObj::Resolve
EXTRN	?sendData@UDPObj@@QAEHPADG0H0H@Z:NEAR		; UDPObj::sendData
EXTRN	??0AOATask@@QAE@XZ:NEAR				; AOATask::AOATask
EXTRN	?AOAsuspendTask@AOATask@@QAEXXZ:NEAR		; AOATask::AOAsuspendTask
EXTRN	?AOAgetTimer@AOAProtected@@QAEJXZ:NEAR		; AOAProtected::AOAgetTimer
EXTRN	?TDLPointer@EtherObj@@2JA:DWORD			; EtherObj::TDLPointer
EXTRN	?SendInPtr@EtherObj@@2JA:DWORD			; EtherObj::SendInPtr
EXTRN	??0EtherObj@@QAE@XZ:NEAR			; EtherObj::EtherObj
_TEXT	SEGMENT
_tIP$ = 8
_tPort$ = 12
_currenttask$ = 16
_this$ = -384
_io$ = -40
_task$ = -88
_EO$ = -20
_arp$ = -380
_i$ = -32
_retcode$ = -4
_currtime$ = -92
_BUFFER$ = -8
_x$ = -28
_p1$ = -24
_c3$ = -12
?StartTransfer@FTPObj@@QAEHPADGH@Z PROC NEAR		; FTPObj::StartTransfer
; Line 265
	push	ebp
	mov	ebp, esp
	sub	esp, 384				; 00000180H
	mov	DWORD PTR _this$[ebp], ecx
; Line 266
	lea	ecx, DWORD PTR _io$[ebp]
	call	??0AOAProtected@@QAE@XZ			; AOAProtected::AOAProtected
; Line 267
	lea	ecx, DWORD PTR _task$[ebp]
	call	??0AOATask@@QAE@XZ			; AOATask::AOATask
; Line 268
	lea	ecx, DWORD PTR _EO$[ebp]
	call	??0EtherObj@@QAE@XZ			; EtherObj::EtherObj
; Line 269
	lea	ecx, DWORD PTR _arp$[ebp]
	call	??0ARPObj@@QAE@XZ			; ARPObj::ARPObj
; Line 271
	mov	DWORD PTR _i$[ebp], 0
; Line 272
	mov	DWORD PTR _retcode$[ebp], 0
; Line 273
	mov	DWORD PTR _currtime$[ebp], 0
; Line 276
	mov	DWORD PTR _x$[ebp], 0
; Line 279
	lea	eax, DWORD PTR _c3$[ebp]
	mov	DWORD PTR _p1$[ebp], eax
$L1729:
; Line 284
	mov	ecx, DWORD PTR _currenttask$[ebp]
	push	ecx
	push	OFFSET FLAT:?DestMac@FTPObj@@2PADA	; FTPObj::DestMac
	mov	edx, DWORD PTR _tIP$[ebp]
	push	edx
	lea	ecx, DWORD PTR _arp$[ebp]
	call	?Resolve@ARPObj@@QAEHPAD0H@Z		; ARPObj::Resolve
	mov	DWORD PTR _retcode$[ebp], eax
; Line 285
	cmp	DWORD PTR _retcode$[ebp], -1
	jne	SHORT $L1735
; Line 287
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	mov	DWORD PTR _currtime$[ebp], eax
$L1733:
; Line 290
	lea	ecx, DWORD PTR _task$[ebp]
	call	?AOAsuspendTask@AOATask@@QAEXXZ		; AOATask::AOAsuspendTask
; Line 291
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	sub	eax, DWORD PTR _currtime$[ebp]
	cmp	eax, 2000				; 000007d0H
	jle	SHORT $L1733
$L1735:
; Line 293
	cmp	DWORD PTR _retcode$[ebp], -1
	je	SHORT $L1729
; Line 299
	mov	eax, DWORD PTR ?SendInPtr@EtherObj@@2JA	; EtherObj::SendInPtr
	shl	eax, 4
	mov	ecx, DWORD PTR ?TDLPointer@EtherObj@@2JA ; EtherObj::TDLPointer
	lea	edx, DWORD PTR [ecx+eax-1114112]
	mov	DWORD PTR _x$[ebp], edx
; Line 301
	mov	eax, DWORD PTR _x$[ebp]
	mov	DWORD PTR _p1$[ebp], eax
; Line 302
	mov	ecx, DWORD PTR _p1$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR _BUFFER$[ebp], edx
; Line 303
	mov	eax, DWORD PTR _BUFFER$[ebp]
	sub	eax, 1114070				; 0010ffd6H
	mov	DWORD PTR _BUFFER$[ebp], eax
; Line 305
	mov	ecx, DWORD PTR _tIP$[ebp]
	mov	dl, BYTE PTR [ecx]
	mov	BYTE PTR ?IP@FTPObj@@2PADA, dl
; Line 306
	mov	eax, DWORD PTR _tIP$[ebp]
	mov	cl, BYTE PTR [eax+1]
	mov	BYTE PTR ?IP@FTPObj@@2PADA+1, cl
; Line 307
	mov	edx, DWORD PTR _tIP$[ebp]
	mov	al, BYTE PTR [edx+2]
	mov	BYTE PTR ?IP@FTPObj@@2PADA+2, al
; Line 308
	mov	ecx, DWORD PTR _tIP$[ebp]
	mov	dl, BYTE PTR [ecx+3]
	mov	BYTE PTR ?IP@FTPObj@@2PADA+3, dl
; Line 309
	mov	ax, WORD PTR _tPort$[ebp]
	mov	WORD PTR ?port@FTPObj@@2GA, ax		; FTPObj::port
; Line 312
	mov	ecx, DWORD PTR _BUFFER$[ebp]
	mov	BYTE PTR [ecx], 49			; 00000031H
; Line 313
	mov	edx, DWORD PTR _BUFFER$[ebp]
	mov	BYTE PTR [edx+1], 48			; 00000030H
; Line 314
	mov	eax, DWORD PTR _BUFFER$[ebp]
	mov	BYTE PTR [eax+2], 49			; 00000031H
; Line 315
	mov	ecx, DWORD PTR _BUFFER$[ebp]
	mov	BYTE PTR [ecx+3], 16			; 00000010H
; Line 316
	mov	edx, DWORD PTR _BUFFER$[ebp]
	mov	BYTE PTR [edx+4], 19			; 00000013H
; Line 318
	mov	DWORD PTR ?state@FTPObj@@2HA, 1		; FTPObj::state
; Line 321
	mov	eax, DWORD PTR _currenttask$[ebp]
	push	eax
	push	OFFSET FLAT:?DestMac@FTPObj@@2PADA	; FTPObj::DestMac
	push	10					; 0000000aH
	mov	ecx, DWORD PTR _BUFFER$[ebp]
	push	ecx
	mov	dx, WORD PTR ?port@FTPObj@@2GA		; FTPObj::port
	push	edx
	push	OFFSET FLAT:?IP@FTPObj@@2PADA		; FTPObj::IP
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 12					; 0000000cH
	call	?sendData@UDPObj@@QAEHPADG0H0H@Z	; UDPObj::sendData
	mov	DWORD PTR _retcode$[ebp], eax
; Line 323
	xor	eax, eax
; Line 324
	mov	esp, ebp
	pop	ebp
	ret	12					; 0000000cH
?StartTransfer@FTPObj@@QAEHPADGH@Z ENDP			; FTPObj::StartTransfer
_TEXT	ENDS
PUBLIC	?FtpHandler@FTPObj@@QAEHPADJ0GH@Z		; FTPObj::FtpHandler
EXTRN	?setIndex@HttphashIndex@@QAEHJK@Z:NEAR		; HttphashIndex::setIndex
_TEXT	SEGMENT
_UData$ = 8
_Size$ = 12
_currenttask$ = 24
_this$ = -80
_io$ = -60
_EO$ = -36
_seqnumber$ = -24
_seqnum$ = -64
_buffsize$ = -68
_fname$ = -8
_fsize$ = -4
_HashValue$ = -48
_i$ = -52
_retcode$ = -16
_Data$ = -20
_x$ = -44
_p1$ = -40
_c3$ = -28
_tmpresourceindex$ = -12
_tmpres$ = -72
_i$1800 = -76
?FtpHandler@FTPObj@@QAEHPADJ0GH@Z PROC NEAR		; FTPObj::FtpHandler
; Line 331
	push	ebp
	mov	ebp, esp
	sub	esp, 80					; 00000050H
	mov	DWORD PTR _this$[ebp], ecx
; Line 332
	lea	ecx, DWORD PTR _io$[ebp]
	call	??0AOAProtected@@QAE@XZ			; AOAProtected::AOAProtected
; Line 333
	lea	ecx, DWORD PTR _EO$[ebp]
	call	??0EtherObj@@QAE@XZ			; EtherObj::EtherObj
; Line 340
	mov	DWORD PTR _i$[ebp], 0
; Line 341
	mov	DWORD PTR _retcode$[ebp], 0
; Line 344
	mov	DWORD PTR _x$[ebp], 0
; Line 347
	lea	eax, DWORD PTR _c3$[ebp]
	mov	DWORD PTR _p1$[ebp], eax
; Line 350
	mov	ecx, DWORD PTR ?ResourceIndexBase@FTPObj@@0KA ; FTPObj::ResourceIndexBase
	mov	DWORD PTR _tmpresourceindex$[ebp], ecx
; Line 352
	mov	edx, DWORD PTR ?SendInPtr@EtherObj@@2JA	; EtherObj::SendInPtr
	shl	edx, 4
	mov	eax, DWORD PTR ?TDLPointer@EtherObj@@2JA ; EtherObj::TDLPointer
	lea	ecx, DWORD PTR [eax+edx-1114112]
	mov	DWORD PTR _x$[ebp], ecx
; Line 354
	mov	edx, DWORD PTR _x$[ebp]
	mov	DWORD PTR _p1$[ebp], edx
; Line 355
	mov	eax, DWORD PTR _p1$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _Data$[ebp], ecx
; Line 357
	mov	edx, DWORD PTR _Data$[ebp]
	sub	edx, 1114070				; 0010ffd6H
	mov	DWORD PTR _Data$[ebp], edx
; Line 359
	cmp	DWORD PTR _Size$[ebp], 3
	jge	SHORT $L1765
; Line 360
	mov	eax, -16				; fffffff0H
	jmp	$L1745
$L1765:
; Line 362
	cmp	DWORD PTR ?state@FTPObj@@2HA, 1		; FTPObj::state
	jne	$L1766
; Line 364
	mov	eax, DWORD PTR _UData$[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 49					; 00000031H
	jne	SHORT $L1767
	mov	edx, DWORD PTR _UData$[ebp]
	movsx	eax, BYTE PTR [edx+1]
	cmp	eax, 48					; 00000030H
	jne	SHORT $L1767
	mov	ecx, DWORD PTR _UData$[ebp]
	movsx	edx, BYTE PTR [ecx+2]
	cmp	edx, 50					; 00000032H
	jne	SHORT $L1767
; Line 366
	mov	DWORD PTR ?state@FTPObj@@2HA, 2		; FTPObj::state
; Line 367
	xor	eax, eax
	jmp	$L1745
$L1767:
; Line 372
	mov	eax, DWORD PTR _Data$[ebp]
	mov	BYTE PTR [eax], 49			; 00000031H
; Line 373
	mov	ecx, DWORD PTR _Data$[ebp]
	mov	BYTE PTR [ecx+1], 48			; 00000030H
; Line 374
	mov	edx, DWORD PTR _Data$[ebp]
	mov	BYTE PTR [edx+2], 49			; 00000031H
; Line 375
	mov	eax, DWORD PTR _Data$[ebp]
	mov	BYTE PTR [eax+3], 16			; 00000010H
; Line 376
	mov	ecx, DWORD PTR _Data$[ebp]
	mov	BYTE PTR [ecx+4], 19			; 00000013H
; Line 377
	mov	edx, DWORD PTR _currenttask$[ebp]
	push	edx
	push	OFFSET FLAT:?DestMac@FTPObj@@2PADA	; FTPObj::DestMac
	push	10					; 0000000aH
	mov	eax, DWORD PTR _Data$[ebp]
	push	eax
	mov	cx, WORD PTR ?port@FTPObj@@2GA		; FTPObj::port
	push	ecx
	push	OFFSET FLAT:?IP@FTPObj@@2PADA		; FTPObj::IP
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 12					; 0000000cH
	call	?sendData@UDPObj@@QAEHPADG0H0H@Z	; UDPObj::sendData
	mov	DWORD PTR _retcode$[ebp], eax
; Line 378
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L1745
$L1766:
; Line 381
	cmp	DWORD PTR ?state@FTPObj@@2HA, 2		; FTPObj::state
	jne	$L1770
; Line 383
	mov	edx, DWORD PTR _UData$[ebp]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, 50					; 00000032H
	jne	$L1771
	mov	ecx, DWORD PTR _UData$[ebp]
	movsx	edx, BYTE PTR [ecx+1]
	cmp	edx, 48					; 00000030H
	jne	$L1771
	mov	eax, DWORD PTR _UData$[ebp]
	movsx	ecx, BYTE PTR [eax+2]
	cmp	ecx, 49					; 00000031H
	jne	$L1771
; Line 387
	mov	edx, DWORD PTR _UData$[ebp]
	add	edx, 5
	mov	DWORD PTR _fname$[ebp], edx
; Line 388
	mov	eax, DWORD PTR _UData$[ebp]
	movsx	ecx, BYTE PTR [eax+90]
	and	ecx, 255				; 000000ffH
	mov	DWORD PTR _fsize$[ebp], ecx
; Line 389
	mov	edx, DWORD PTR _fsize$[ebp]
	shl	edx, 8
	and	edx, 65280				; 0000ff00H
	mov	eax, DWORD PTR _UData$[ebp]
	movsx	ecx, BYTE PTR [eax+89]
	and	ecx, 255				; 000000ffH
	or	edx, ecx
	mov	DWORD PTR _fsize$[ebp], edx
; Line 390
	mov	edx, DWORD PTR _fsize$[ebp]
	shl	edx, 8
	and	edx, 16776960				; 00ffff00H
	mov	eax, DWORD PTR _UData$[ebp]
	movsx	ecx, BYTE PTR [eax+88]
	and	ecx, 255				; 000000ffH
	or	edx, ecx
	mov	DWORD PTR _fsize$[ebp], edx
; Line 391
	mov	edx, DWORD PTR _fsize$[ebp]
	shl	edx, 8
	and	dl, 0
	mov	eax, DWORD PTR _UData$[ebp]
	movsx	ecx, BYTE PTR [eax+87]
	and	ecx, 255				; 000000ffH
	or	edx, ecx
	mov	DWORD PTR _fsize$[ebp], edx
; Line 392
	mov	edx, DWORD PTR ?ResourceIndexPtr@FTPObj@@0KA ; FTPObj::ResourceIndexPtr
	cmp	edx, DWORD PTR ?ResourceIndexCount@FTPObj@@0IA ; FTPObj::ResourceIndexCount
	jbe	SHORT $L1772
; Line 395
	mov	eax, DWORD PTR _Data$[ebp]
	mov	BYTE PTR [eax], 50			; 00000032H
; Line 396
	mov	ecx, DWORD PTR _Data$[ebp]
	mov	BYTE PTR [ecx+1], 48			; 00000030H
; Line 397
	mov	edx, DWORD PTR _Data$[ebp]
	mov	BYTE PTR [edx+2], 51			; 00000033H
; Line 398
	mov	eax, DWORD PTR _Data$[ebp]
	mov	BYTE PTR [eax+3], 16			; 00000010H
; Line 399
	mov	ecx, DWORD PTR _Data$[ebp]
	mov	BYTE PTR [ecx+4], 19			; 00000013H
; Line 400
	mov	edx, DWORD PTR _currenttask$[ebp]
	push	edx
	push	OFFSET FLAT:?DestMac@FTPObj@@2PADA	; FTPObj::DestMac
	push	10					; 0000000aH
	mov	eax, DWORD PTR _Data$[ebp]
	push	eax
	mov	cx, WORD PTR ?port@FTPObj@@2GA		; FTPObj::port
	push	ecx
	push	OFFSET FLAT:?IP@FTPObj@@2PADA		; FTPObj::IP
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 12					; 0000000cH
	call	?sendData@UDPObj@@QAEHPADG0H0H@Z	; UDPObj::sendData
	mov	DWORD PTR _retcode$[ebp], eax
; Line 401
	mov	DWORD PTR ?state@FTPObj@@2HA, 7		; FTPObj::state
; Line 402
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L1745
$L1772:
; Line 404
	mov	edx, DWORD PTR ?curraddress@FTPObj@@0PADA ; FTPObj::curraddress
	add	edx, DWORD PTR _fsize$[ebp]
	mov	eax, DWORD PTR ?ResourceBufferBase@FTPObj@@0KA ; FTPObj::ResourceBufferBase
	add	eax, DWORD PTR ?ResourceBufferSize@FTPObj@@0KA ; FTPObj::ResourceBufferSize
	cmp	edx, eax
	jbe	SHORT $L1774
; Line 407
	mov	ecx, DWORD PTR _Data$[ebp]
	mov	BYTE PTR [ecx], 50			; 00000032H
; Line 408
	mov	edx, DWORD PTR _Data$[ebp]
	mov	BYTE PTR [edx+1], 48			; 00000030H
; Line 409
	mov	eax, DWORD PTR _Data$[ebp]
	mov	BYTE PTR [eax+2], 51			; 00000033H
; Line 410
	mov	ecx, DWORD PTR _Data$[ebp]
	mov	BYTE PTR [ecx+3], 16			; 00000010H
; Line 411
	mov	edx, DWORD PTR _Data$[ebp]
	mov	BYTE PTR [edx+4], 19			; 00000013H
; Line 412
	mov	eax, DWORD PTR _currenttask$[ebp]
	push	eax
	push	OFFSET FLAT:?DestMac@FTPObj@@2PADA	; FTPObj::DestMac
	push	10					; 0000000aH
	mov	ecx, DWORD PTR _Data$[ebp]
	push	ecx
	mov	dx, WORD PTR ?port@FTPObj@@2GA		; FTPObj::port
	push	edx
	push	OFFSET FLAT:?IP@FTPObj@@2PADA		; FTPObj::IP
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 12					; 0000000cH
	call	?sendData@UDPObj@@QAEHPADG0H0H@Z	; UDPObj::sendData
	mov	DWORD PTR _retcode$[ebp], eax
; Line 413
	mov	DWORD PTR ?state@FTPObj@@2HA, 7		; FTPObj::state
; Line 414
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L1745
$L1774:
; Line 418
	push	80					; 00000050H
	mov	eax, DWORD PTR _fname$[ebp]
	push	eax
	push	80					; 00000050H
	mov	ecx, DWORD PTR ?ResourceIndexPtr@FTPObj@@0KA ; FTPObj::ResourceIndexPtr
	imul	ecx, 92					; 0000005cH
	mov	edx, DWORD PTR _tmpresourceindex$[ebp]
	add	edx, ecx
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?sstrcpy@FTPObj@@AAEHPADH0H@Z		; FTPObj::sstrcpy
; Line 419
	mov	eax, DWORD PTR ?ResourceIndexPtr@FTPObj@@0KA ; FTPObj::ResourceIndexPtr
	imul	eax, 92					; 0000005cH
	mov	ecx, DWORD PTR _tmpresourceindex$[ebp]
	mov	edx, DWORD PTR ?curraddress@FTPObj@@0PADA ; FTPObj::curraddress
	mov	DWORD PTR [ecx+eax+80], edx
; Line 420
	mov	eax, DWORD PTR ?ResourceIndexPtr@FTPObj@@0KA ; FTPObj::ResourceIndexPtr
	imul	eax, 92					; 0000005cH
	mov	ecx, DWORD PTR _tmpresourceindex$[ebp]
	mov	edx, DWORD PTR _fsize$[ebp]
	mov	DWORD PTR [ecx+eax+84], edx
; Line 421
	mov	eax, DWORD PTR ?ResourceIndexPtr@FTPObj@@0KA ; FTPObj::ResourceIndexPtr
	imul	eax, 92					; 0000005cH
	mov	ecx, DWORD PTR _tmpresourceindex$[ebp]
	mov	DWORD PTR [ecx+eax+88], 0
; Line 423
	mov	edx, DWORD PTR ?ResourceIndexPtr@FTPObj@@0KA ; FTPObj::ResourceIndexPtr
	imul	edx, 92					; 0000005cH
	mov	eax, DWORD PTR _tmpresourceindex$[ebp]
	add	eax, edx
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?sstrlen@FTPObj@@AAEHPAD@Z		; FTPObj::sstrlen
	push	eax
	mov	ecx, DWORD PTR ?ResourceIndexPtr@FTPObj@@0KA ; FTPObj::ResourceIndexPtr
	imul	ecx, 92					; 0000005cH
	mov	edx, DWORD PTR _tmpresourceindex$[ebp]
	add	edx, ecx
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?hashfun@HttphashIndex@@QAEJPADH@Z	; HttphashIndex::hashfun
	mov	DWORD PTR _HashValue$[ebp], eax
; Line 424
	mov	eax, DWORD PTR _HashValue$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?getIndex@HttphashIndex@@QAEKJ@Z	; HttphashIndex::getIndex
	test	eax, eax
	jne	$L1776
; Line 426
	mov	ecx, DWORD PTR ?ResourceIndexPtr@FTPObj@@0KA ; FTPObj::ResourceIndexPtr
	imul	ecx, 92					; 0000005cH
	mov	edx, DWORD PTR _tmpresourceindex$[ebp]
	add	edx, ecx
	push	edx
	mov	eax, DWORD PTR _HashValue$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?setIndex@HttphashIndex@@QAEHJK@Z	; HttphashIndex::setIndex
; Line 427
	mov	ecx, DWORD PTR ?ResourceIndexPtr@FTPObj@@0KA ; FTPObj::ResourceIndexPtr
	add	ecx, 1
	mov	DWORD PTR ?ResourceIndexPtr@FTPObj@@0KA, ecx ; FTPObj::ResourceIndexPtr
; Line 428
	mov	edx, DWORD PTR _Data$[ebp]
	mov	BYTE PTR [edx], 50			; 00000032H
; Line 429
	mov	eax, DWORD PTR _Data$[ebp]
	mov	BYTE PTR [eax+1], 48			; 00000030H
; Line 430
	mov	ecx, DWORD PTR _Data$[ebp]
	mov	BYTE PTR [ecx+2], 50			; 00000032H
; Line 431
	mov	edx, DWORD PTR _Data$[ebp]
	mov	BYTE PTR [edx+3], 16			; 00000010H
; Line 432
	mov	eax, DWORD PTR _Data$[ebp]
	mov	BYTE PTR [eax+4], 19			; 00000013H
; Line 433
	mov	ecx, DWORD PTR _fsize$[ebp]
	mov	DWORD PTR ?TFileSize@FTPObj@@0KA, ecx	; FTPObj::TFileSize
; Line 434
	mov	eax, DWORD PTR _fsize$[ebp]
	xor	edx, edx
	div	DWORD PTR ?MaxPktSize@FTPObj@@0IA	; FTPObj::MaxPktSize
	mov	DWORD PTR ?TotalFilePkts@FTPObj@@0IA, eax ; FTPObj::TotalFilePkts
; Line 435
	mov	eax, DWORD PTR _fsize$[ebp]
	xor	edx, edx
	div	DWORD PTR ?MaxPktSize@FTPObj@@0IA	; FTPObj::MaxPktSize
	test	edx, edx
	je	SHORT $L1778
; Line 437
	mov	edx, DWORD PTR ?TotalFilePkts@FTPObj@@0IA ; FTPObj::TotalFilePkts
	add	edx, 1
	mov	DWORD PTR ?TotalFilePkts@FTPObj@@0IA, edx ; FTPObj::TotalFilePkts
$L1778:
; Line 439
	mov	DWORD PTR ?TotalLostPkts@FTPObj@@0IA, 0	; FTPObj::TotalLostPkts
; Line 440
	mov	eax, DWORD PTR _currenttask$[ebp]
	push	eax
	push	OFFSET FLAT:?DestMac@FTPObj@@2PADA	; FTPObj::DestMac
	push	10					; 0000000aH
	mov	ecx, DWORD PTR _Data$[ebp]
	push	ecx
	mov	dx, WORD PTR ?port@FTPObj@@2GA		; FTPObj::port
	push	edx
	push	OFFSET FLAT:?IP@FTPObj@@2PADA		; FTPObj::IP
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 12					; 0000000cH
	call	?sendData@UDPObj@@QAEHPADG0H0H@Z	; UDPObj::sendData
	mov	DWORD PTR _retcode$[ebp], eax
; Line 441
	mov	DWORD PTR ?nextseq@FTPObj@@0IA, 0	; FTPObj::nextseq
; Line 442
	mov	DWORD PTR ?state@FTPObj@@2HA, 4		; FTPObj::state
; Line 443
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L1745
$L1776:
; Line 447
	mov	eax, DWORD PTR _HashValue$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?getIndex@HttphashIndex@@QAEKJ@Z	; HttphashIndex::getIndex
	mov	DWORD PTR _tmpres$[ebp], eax
$L1782:
; Line 448
	mov	ecx, DWORD PTR _tmpres$[ebp]
	cmp	DWORD PTR [ecx+88], 0
	je	SHORT $L1783
; Line 450
	mov	edx, DWORD PTR ?ResourceIndexPtr@FTPObj@@0KA ; FTPObj::ResourceIndexPtr
	imul	edx, 92					; 0000005cH
	mov	eax, DWORD PTR _tmpresourceindex$[ebp]
	add	eax, edx
	push	eax
	mov	ecx, DWORD PTR _tmpres$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?sstrcmp@FTPObj@@AAEHPAD0@Z		; FTPObj::sstrcmp
	test	eax, eax
	jne	SHORT $L1784
; Line 452
	jmp	$L1786
$L1784:
; Line 454
	mov	edx, DWORD PTR _tmpres$[ebp]
	mov	eax, DWORD PTR [edx+88]
	mov	DWORD PTR _tmpres$[ebp], eax
; Line 455
	jmp	SHORT $L1782
$L1783:
; Line 456
	mov	ecx, DWORD PTR ?ResourceIndexPtr@FTPObj@@0KA ; FTPObj::ResourceIndexPtr
	imul	ecx, 92					; 0000005cH
	mov	edx, DWORD PTR _tmpresourceindex$[ebp]
	add	edx, ecx
	push	edx
	mov	eax, DWORD PTR _tmpres$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?sstrcmp@FTPObj@@AAEHPAD0@Z		; FTPObj::sstrcmp
	test	eax, eax
	jne	SHORT $L1788
; Line 458
	jmp	$L1789
$L1788:
; Line 462
	mov	ecx, DWORD PTR ?ResourceIndexPtr@FTPObj@@0KA ; FTPObj::ResourceIndexPtr
	imul	ecx, 92					; 0000005cH
	mov	edx, DWORD PTR _tmpresourceindex$[ebp]
	add	edx, ecx
	mov	eax, DWORD PTR _tmpres$[ebp]
	mov	DWORD PTR [eax+88], edx
; Line 463
	mov	ecx, DWORD PTR ?ResourceIndexPtr@FTPObj@@0KA ; FTPObj::ResourceIndexPtr
	add	ecx, 1
	mov	DWORD PTR ?ResourceIndexPtr@FTPObj@@0KA, ecx ; FTPObj::ResourceIndexPtr
; Line 464
	mov	edx, DWORD PTR _Data$[ebp]
	mov	BYTE PTR [edx], 50			; 00000032H
; Line 465
	mov	eax, DWORD PTR _Data$[ebp]
	mov	BYTE PTR [eax+1], 48			; 00000030H
; Line 466
	mov	ecx, DWORD PTR _Data$[ebp]
	mov	BYTE PTR [ecx+2], 50			; 00000032H
; Line 467
	mov	edx, DWORD PTR _Data$[ebp]
	mov	BYTE PTR [edx+3], 16			; 00000010H
; Line 468
	mov	eax, DWORD PTR _Data$[ebp]
	mov	BYTE PTR [eax+4], 19			; 00000013H
; Line 469
	mov	ecx, DWORD PTR _fsize$[ebp]
	mov	DWORD PTR ?TFileSize@FTPObj@@0KA, ecx	; FTPObj::TFileSize
; Line 470
	mov	eax, DWORD PTR _fsize$[ebp]
	xor	edx, edx
	div	DWORD PTR ?MaxPktSize@FTPObj@@0IA	; FTPObj::MaxPktSize
	mov	DWORD PTR ?TotalFilePkts@FTPObj@@0IA, eax ; FTPObj::TotalFilePkts
; Line 471
	mov	eax, DWORD PTR _fsize$[ebp]
	xor	edx, edx
	div	DWORD PTR ?MaxPktSize@FTPObj@@0IA	; FTPObj::MaxPktSize
	test	edx, edx
	je	SHORT $L1792
; Line 473
	mov	edx, DWORD PTR ?TotalFilePkts@FTPObj@@0IA ; FTPObj::TotalFilePkts
	add	edx, 1
	mov	DWORD PTR ?TotalFilePkts@FTPObj@@0IA, edx ; FTPObj::TotalFilePkts
$L1792:
; Line 475
	mov	DWORD PTR ?TotalLostPkts@FTPObj@@0IA, 0	; FTPObj::TotalLostPkts
; Line 476
	mov	eax, DWORD PTR _currenttask$[ebp]
	push	eax
	push	OFFSET FLAT:?DestMac@FTPObj@@2PADA	; FTPObj::DestMac
	push	10					; 0000000aH
	mov	ecx, DWORD PTR _Data$[ebp]
	push	ecx
	mov	dx, WORD PTR ?port@FTPObj@@2GA		; FTPObj::port
	push	edx
	push	OFFSET FLAT:?IP@FTPObj@@2PADA		; FTPObj::IP
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 12					; 0000000cH
	call	?sendData@UDPObj@@QAEHPADG0H0H@Z	; UDPObj::sendData
	mov	DWORD PTR _retcode$[ebp], eax
; Line 477
	mov	DWORD PTR ?nextseq@FTPObj@@0IA, 0	; FTPObj::nextseq
; Line 478
	mov	DWORD PTR ?state@FTPObj@@2HA, 4		; FTPObj::state
; Line 479
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L1745
$FileExist$1785:
; Line 484
	mov	eax, DWORD PTR _Data$[ebp]
	mov	BYTE PTR [eax], 50			; 00000032H
; Line 485
	mov	ecx, DWORD PTR _Data$[ebp]
	mov	BYTE PTR [ecx+1], 48			; 00000030H
; Line 486
	mov	edx, DWORD PTR _Data$[ebp]
	mov	BYTE PTR [edx+2], 52			; 00000034H
; Line 487
	mov	eax, DWORD PTR _Data$[ebp]
	mov	BYTE PTR [eax+3], 16			; 00000010H
; Line 488
	mov	ecx, DWORD PTR _Data$[ebp]
	mov	BYTE PTR [ecx+4], 19			; 00000013H
; Line 490
	mov	edx, DWORD PTR _currenttask$[ebp]
	push	edx
	push	OFFSET FLAT:?DestMac@FTPObj@@2PADA	; FTPObj::DestMac
	push	10					; 0000000aH
	mov	eax, DWORD PTR _Data$[ebp]
	push	eax
	mov	cx, WORD PTR ?port@FTPObj@@2GA		; FTPObj::port
	push	ecx
	push	OFFSET FLAT:?IP@FTPObj@@2PADA		; FTPObj::IP
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 12					; 0000000cH
	call	?sendData@UDPObj@@QAEHPADG0H0H@Z	; UDPObj::sendData
	mov	DWORD PTR _retcode$[ebp], eax
; Line 491
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L1745
$L1771:
; Line 494
	mov	edx, DWORD PTR _UData$[ebp]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, 51					; 00000033H
	jne	SHORT $L1793
	mov	ecx, DWORD PTR _UData$[ebp]
	movsx	edx, BYTE PTR [ecx+1]
	cmp	edx, 48					; 00000030H
	jne	SHORT $L1793
	mov	eax, DWORD PTR _UData$[ebp]
	movsx	ecx, BYTE PTR [eax+2]
	cmp	ecx, 51					; 00000033H
	jne	SHORT $L1793
; Line 496
	mov	DWORD PTR ?state@FTPObj@@2HA, 2		; FTPObj::state
; Line 497
	mov	edx, DWORD PTR _Data$[ebp]
	mov	BYTE PTR [edx], 51			; 00000033H
; Line 498
	mov	eax, DWORD PTR _Data$[ebp]
	mov	BYTE PTR [eax+1], 48			; 00000030H
; Line 499
	mov	ecx, DWORD PTR _Data$[ebp]
	mov	BYTE PTR [ecx+2], 52			; 00000034H
; Line 500
	mov	edx, DWORD PTR _Data$[ebp]
	mov	BYTE PTR [edx+3], 16			; 00000010H
; Line 501
	mov	eax, DWORD PTR _Data$[ebp]
	mov	BYTE PTR [eax+4], 19			; 00000013H
; Line 502
	mov	ecx, DWORD PTR _currenttask$[ebp]
	push	ecx
	push	OFFSET FLAT:?DestMac@FTPObj@@2PADA	; FTPObj::DestMac
	push	10					; 0000000aH
	mov	edx, DWORD PTR _Data$[ebp]
	push	edx
	mov	ax, WORD PTR ?port@FTPObj@@2GA		; FTPObj::port
	push	eax
	push	OFFSET FLAT:?IP@FTPObj@@2PADA		; FTPObj::IP
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 12					; 0000000cH
	call	?sendData@UDPObj@@QAEHPADG0H0H@Z	; UDPObj::sendData
	mov	DWORD PTR _retcode$[ebp], eax
; Line 503
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L1745
$L1793:
; Line 505
	mov	ecx, DWORD PTR _UData$[ebp]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, 49					; 00000031H
	jne	$L1794
	mov	eax, DWORD PTR _UData$[ebp]
	movsx	ecx, BYTE PTR [eax+1]
	cmp	ecx, 48					; 00000030H
	jne	SHORT $L1794
	mov	edx, DWORD PTR _UData$[ebp]
	movsx	eax, BYTE PTR [edx+2]
	cmp	eax, 51					; 00000033H
	jne	SHORT $L1794
; Line 507
	mov	DWORD PTR ?state@FTPObj@@2HA, 7		; FTPObj::state
; Line 508
	mov	ecx, DWORD PTR _Data$[ebp]
	mov	BYTE PTR [ecx], 49			; 00000031H
; Line 509
	mov	edx, DWORD PTR _Data$[ebp]
	mov	BYTE PTR [edx+1], 48			; 00000030H
; Line 510
	mov	eax, DWORD PTR _Data$[ebp]
	mov	BYTE PTR [eax+2], 52			; 00000034H
; Line 511
	mov	ecx, DWORD PTR _Data$[ebp]
	mov	BYTE PTR [ecx+3], 16			; 00000010H
; Line 512
	mov	edx, DWORD PTR _Data$[ebp]
	mov	BYTE PTR [edx+4], 19			; 00000013H
; Line 513
	mov	eax, DWORD PTR _currenttask$[ebp]
	push	eax
	push	OFFSET FLAT:?DestMac@FTPObj@@2PADA	; FTPObj::DestMac
	push	10					; 0000000aH
	mov	ecx, DWORD PTR _Data$[ebp]
	push	ecx
	mov	dx, WORD PTR ?port@FTPObj@@2GA		; FTPObj::port
	push	edx
	push	OFFSET FLAT:?IP@FTPObj@@2PADA		; FTPObj::IP
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 12					; 0000000cH
	call	?sendData@UDPObj@@QAEHPADG0H0H@Z	; UDPObj::sendData
	mov	DWORD PTR _retcode$[ebp], eax
; Line 514
	mov	DWORD PTR ?fileTransferFinished@FTPObj@@2HA, 1 ; FTPObj::fileTransferFinished
; Line 515
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L1745
$L1794:
; Line 517
	xor	eax, eax
	jmp	$L1745
$L1770:
; Line 519
	cmp	DWORD PTR ?state@FTPObj@@2HA, 4		; FTPObj::state
	jne	$L1796
; Line 521
	mov	eax, DWORD PTR _UData$[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 51					; 00000033H
	jne	$L1797
	mov	edx, DWORD PTR _UData$[ebp]
	movsx	eax, BYTE PTR [edx+1]
	cmp	eax, 48					; 00000030H
	jne	$L1797
	mov	ecx, DWORD PTR _UData$[ebp]
	movsx	edx, BYTE PTR [ecx+2]
	cmp	edx, 49					; 00000031H
	jne	$L1797
; Line 523
	mov	eax, DWORD PTR _UData$[ebp]
	movsx	ecx, BYTE PTR [eax+6]
	and	ecx, 255				; 000000ffH
	mov	DWORD PTR _seqnumber$[ebp], ecx
; Line 524
	mov	edx, DWORD PTR _seqnumber$[ebp]
	shl	edx, 8
	and	edx, 65280				; 0000ff00H
	mov	eax, DWORD PTR _UData$[ebp]
	movsx	ecx, BYTE PTR [eax+5]
	and	ecx, 255				; 000000ffH
	or	edx, ecx
	mov	DWORD PTR _seqnumber$[ebp], edx
; Line 527
	mov	edx, DWORD PTR _seqnumber$[ebp]
	cmp	edx, DWORD PTR ?nextseq@FTPObj@@0IA	; FTPObj::nextseq
	je	SHORT $L1798
; Line 531
	mov	eax, DWORD PTR _seqnumber$[ebp]
	cmp	eax, DWORD PTR ?nextseq@FTPObj@@0IA	; FTPObj::nextseq
	jbe	SHORT $L1799
; Line 534
	mov	ecx, DWORD PTR ?nextseq@FTPObj@@0IA	; FTPObj::nextseq
	mov	DWORD PTR _i$1800[ebp], ecx
	jmp	SHORT $L1801
$L1802:
	mov	edx, DWORD PTR _i$1800[ebp]
	add	edx, 1
	mov	DWORD PTR _i$1800[ebp], edx
$L1801:
	mov	eax, DWORD PTR _i$1800[ebp]
	cmp	eax, DWORD PTR _seqnumber$[ebp]
	jae	SHORT $L1803
; Line 536
	mov	ecx, DWORD PTR ?TotalLostPkts@FTPObj@@0IA ; FTPObj::TotalLostPkts
	mov	edx, DWORD PTR _i$1800[ebp]
	mov	DWORD PTR ?LostPkts@FTPObj@@0PAIA[ecx*4], edx
; Line 537
	mov	eax, DWORD PTR ?TotalLostPkts@FTPObj@@0IA ; FTPObj::TotalLostPkts
	add	eax, 1
	mov	DWORD PTR ?TotalLostPkts@FTPObj@@0IA, eax ; FTPObj::TotalLostPkts
; Line 538
	jmp	SHORT $L1802
$L1803:
; Line 540
	mov	ecx, DWORD PTR _seqnumber$[ebp]
	mov	DWORD PTR ?nextseq@FTPObj@@0IA, ecx	; FTPObj::nextseq
; Line 542
	jmp	SHORT $L1804
$L1799:
; Line 544
	xor	eax, eax
	jmp	$L1745
$L1804:
; Line 546
	mov	DWORD PTR ?state@FTPObj@@2HA, 4		; FTPObj::state
$L1798:
; Line 549
	mov	edx, DWORD PTR ?nextseq@FTPObj@@0IA	; FTPObj::nextseq
	add	edx, 1
	mov	DWORD PTR ?nextseq@FTPObj@@0IA, edx	; FTPObj::nextseq
; Line 551
	mov	eax, DWORD PTR _UData$[ebp]
	movsx	ecx, BYTE PTR [eax+10]
	and	ecx, 255				; 000000ffH
	mov	DWORD PTR _buffsize$[ebp], ecx
; Line 552
	mov	edx, DWORD PTR _buffsize$[ebp]
	shl	edx, 8
	and	edx, 65280				; 0000ff00H
	mov	eax, DWORD PTR _UData$[ebp]
	movsx	ecx, BYTE PTR [eax+9]
	and	ecx, 255				; 000000ffH
	or	edx, ecx
	mov	DWORD PTR _buffsize$[ebp], edx
; Line 554
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1805
$L1806:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L1805:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _buffsize$[ebp]
	jae	SHORT $L1807
; Line 556
	mov	ecx, DWORD PTR _seqnumber$[ebp]
	imul	ecx, DWORD PTR ?MaxPktSize@FTPObj@@0IA	; FTPObj::MaxPktSize
	add	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _UData$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR ?curraddress@FTPObj@@0PADA ; FTPObj::curraddress
	mov	dl, BYTE PTR [edx+13]
	mov	BYTE PTR [eax+ecx], dl
; Line 557
	jmp	SHORT $L1806
$L1807:
; Line 558
	mov	DWORD PTR ?state@FTPObj@@2HA, 4		; FTPObj::state
; Line 559
	xor	eax, eax
	jmp	$L1745
$L1797:
; Line 562
	mov	eax, DWORD PTR _UData$[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 51					; 00000033H
	jne	$L1814
	mov	edx, DWORD PTR _UData$[ebp]
	movsx	eax, BYTE PTR [edx+1]
	cmp	eax, 48					; 00000030H
	jne	$L1814
	mov	ecx, DWORD PTR _UData$[ebp]
	movsx	edx, BYTE PTR [ecx+2]
	cmp	edx, 51					; 00000033H
	jne	$L1814
; Line 564
	mov	eax, DWORD PTR ?nextseq@FTPObj@@0IA	; FTPObj::nextseq
	cmp	eax, DWORD PTR ?TotalFilePkts@FTPObj@@0IA ; FTPObj::TotalFilePkts
	jae	SHORT $L1809
; Line 566
	mov	ecx, DWORD PTR ?nextseq@FTPObj@@0IA	; FTPObj::nextseq
	mov	DWORD PTR _i$[ebp], ecx
	jmp	SHORT $L1810
$L1811:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L1810:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR ?TotalFilePkts@FTPObj@@0IA ; FTPObj::TotalFilePkts
	jae	SHORT $L1812
; Line 568
	mov	ecx, DWORD PTR ?TotalLostPkts@FTPObj@@0IA ; FTPObj::TotalLostPkts
	mov	edx, DWORD PTR _i$[ebp]
	mov	DWORD PTR ?LostPkts@FTPObj@@0PAIA[ecx*4], edx
; Line 569
	mov	eax, DWORD PTR ?TotalLostPkts@FTPObj@@0IA ; FTPObj::TotalLostPkts
	add	eax, 1
	mov	DWORD PTR ?TotalLostPkts@FTPObj@@0IA, eax ; FTPObj::TotalLostPkts
; Line 570
	jmp	SHORT $L1811
$L1812:
; Line 571
	mov	ecx, DWORD PTR ?TotalFilePkts@FTPObj@@0IA ; FTPObj::TotalFilePkts
	mov	DWORD PTR ?nextseq@FTPObj@@0IA, ecx	; FTPObj::nextseq
$L1809:
; Line 573
	cmp	DWORD PTR ?TotalLostPkts@FTPObj@@0IA, 0	; FTPObj::TotalLostPkts
	jne	$L1813
; Line 575
	mov	DWORD PTR ?state@FTPObj@@2HA, 2		; FTPObj::state
; Line 576
	mov	edx, DWORD PTR _Data$[ebp]
	mov	BYTE PTR [edx], 51			; 00000033H
; Line 577
	mov	eax, DWORD PTR _Data$[ebp]
	mov	BYTE PTR [eax+1], 48			; 00000030H
; Line 578
	mov	ecx, DWORD PTR _Data$[ebp]
	mov	BYTE PTR [ecx+2], 52			; 00000034H
; Line 579
	mov	edx, DWORD PTR _Data$[ebp]
	mov	BYTE PTR [edx+3], 16			; 00000010H
; Line 580
	mov	eax, DWORD PTR _Data$[ebp]
	mov	BYTE PTR [eax+4], 19			; 00000013H
; Line 581
	mov	DWORD PTR ?TotalLostPkts@FTPObj@@0IA, 0	; FTPObj::TotalLostPkts
; Line 582
	mov	DWORD PTR ?TotalFilePkts@FTPObj@@0IA, 0	; FTPObj::TotalFilePkts
; Line 583
	mov	ecx, DWORD PTR ?curraddress@FTPObj@@0PADA ; FTPObj::curraddress
	add	ecx, DWORD PTR ?TFileSize@FTPObj@@0KA	; FTPObj::TFileSize
	mov	DWORD PTR ?curraddress@FTPObj@@0PADA, ecx ; FTPObj::curraddress
; Line 584
	mov	edx, DWORD PTR _currenttask$[ebp]
	push	edx
	push	OFFSET FLAT:?DestMac@FTPObj@@2PADA	; FTPObj::DestMac
	push	10					; 0000000aH
	mov	eax, DWORD PTR _Data$[ebp]
	push	eax
	mov	cx, WORD PTR ?port@FTPObj@@2GA		; FTPObj::port
	push	ecx
	push	OFFSET FLAT:?IP@FTPObj@@2PADA		; FTPObj::IP
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 12					; 0000000cH
	call	?sendData@UDPObj@@QAEHPADG0H0H@Z	; UDPObj::sendData
	mov	DWORD PTR _retcode$[ebp], eax
; Line 585
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L1745
$L1813:
; Line 589
	mov	edx, DWORD PTR _Data$[ebp]
	mov	BYTE PTR [edx], 51			; 00000033H
; Line 590
	mov	eax, DWORD PTR _Data$[ebp]
	mov	BYTE PTR [eax+1], 48			; 00000030H
; Line 591
	mov	ecx, DWORD PTR _Data$[ebp]
	mov	BYTE PTR [ecx+2], 54			; 00000036H
; Line 592
	mov	edx, DWORD PTR _Data$[ebp]
	mov	BYTE PTR [edx+3], 16			; 00000010H
; Line 593
	mov	eax, DWORD PTR _Data$[ebp]
	mov	BYTE PTR [eax+4], 19			; 00000013H
; Line 594
	mov	ecx, DWORD PTR ?TotalLostPkts@FTPObj@@0IA ; FTPObj::TotalLostPkts
	lea	edx, DWORD PTR ?LostPkts@FTPObj@@0PAIA[ecx*4-4]
	mov	DWORD PTR _seqnum$[ebp], edx
; Line 595
	mov	eax, DWORD PTR _Data$[ebp]
	mov	ecx, DWORD PTR _seqnum$[ebp]
	mov	dl, BYTE PTR [ecx]
	mov	BYTE PTR [eax+5], dl
; Line 596
	mov	eax, DWORD PTR _Data$[ebp]
	mov	ecx, DWORD PTR _seqnum$[ebp]
	mov	dl, BYTE PTR [ecx+1]
	mov	BYTE PTR [eax+6], dl
; Line 597
	mov	eax, DWORD PTR _Data$[ebp]
	mov	BYTE PTR [eax+7], 13			; 0000000dH
; Line 598
	mov	ecx, DWORD PTR _Data$[ebp]
	mov	BYTE PTR [ecx+8], 10			; 0000000aH
; Line 599
	mov	DWORD PTR ?state@FTPObj@@2HA, 4		; FTPObj::state
; Line 600
	mov	edx, DWORD PTR _currenttask$[ebp]
	push	edx
	push	OFFSET FLAT:?DestMac@FTPObj@@2PADA	; FTPObj::DestMac
	push	10					; 0000000aH
	mov	eax, DWORD PTR _Data$[ebp]
	push	eax
	mov	cx, WORD PTR ?port@FTPObj@@2GA		; FTPObj::port
	push	ecx
	push	OFFSET FLAT:?IP@FTPObj@@2PADA		; FTPObj::IP
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 12					; 0000000cH
	call	?sendData@UDPObj@@QAEHPADG0H0H@Z	; UDPObj::sendData
	mov	DWORD PTR _retcode$[ebp], eax
; Line 601
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L1745
$L1814:
; Line 604
	mov	edx, DWORD PTR _UData$[ebp]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, 51					; 00000033H
	jne	$L1822
	mov	ecx, DWORD PTR _UData$[ebp]
	movsx	edx, BYTE PTR [ecx+1]
	cmp	edx, 48					; 00000030H
	jne	$L1822
	mov	eax, DWORD PTR _UData$[ebp]
	movsx	ecx, BYTE PTR [eax+2]
	cmp	ecx, 53					; 00000035H
	jne	$L1822
; Line 606
	mov	edx, DWORD PTR _UData$[ebp]
	movsx	eax, BYTE PTR [edx+6]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _seqnumber$[ebp], eax
; Line 607
	mov	ecx, DWORD PTR _seqnumber$[ebp]
	shl	ecx, 8
	and	ecx, 65280				; 0000ff00H
	mov	edx, DWORD PTR _UData$[ebp]
	movsx	eax, BYTE PTR [edx+5]
	and	eax, 255				; 000000ffH
	or	ecx, eax
	mov	DWORD PTR _seqnumber$[ebp], ecx
; Line 608
	mov	ecx, DWORD PTR ?TotalLostPkts@FTPObj@@0IA ; FTPObj::TotalLostPkts
	mov	edx, DWORD PTR _seqnumber$[ebp]
	cmp	edx, DWORD PTR ?LostPkts@FTPObj@@0PAIA[ecx*4-4]
	jne	SHORT $L1817
; Line 610
	mov	eax, DWORD PTR _UData$[ebp]
	movsx	ecx, BYTE PTR [eax+10]
	and	ecx, 255				; 000000ffH
	mov	DWORD PTR _buffsize$[ebp], ecx
; Line 611
	mov	edx, DWORD PTR _buffsize$[ebp]
	shl	edx, 8
	and	edx, 65280				; 0000ff00H
	mov	eax, DWORD PTR _UData$[ebp]
	movsx	ecx, BYTE PTR [eax+9]
	and	ecx, 255				; 000000ffH
	or	edx, ecx
	mov	DWORD PTR _buffsize$[ebp], edx
; Line 612
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1818
$L1819:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L1818:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _buffsize$[ebp]
	jae	SHORT $L1820
; Line 614
	mov	ecx, DWORD PTR _seqnumber$[ebp]
	imul	ecx, DWORD PTR ?MaxPktSize@FTPObj@@0IA	; FTPObj::MaxPktSize
	add	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _UData$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR ?curraddress@FTPObj@@0PADA ; FTPObj::curraddress
	mov	dl, BYTE PTR [edx+13]
	mov	BYTE PTR [eax+ecx], dl
; Line 615
	jmp	SHORT $L1819
$L1820:
; Line 616
	mov	eax, DWORD PTR ?TotalLostPkts@FTPObj@@0IA ; FTPObj::TotalLostPkts
	sub	eax, 1
	mov	DWORD PTR ?TotalLostPkts@FTPObj@@0IA, eax ; FTPObj::TotalLostPkts
$L1817:
; Line 618
	cmp	DWORD PTR ?TotalLostPkts@FTPObj@@0IA, 0	; FTPObj::TotalLostPkts
	jne	$L1821
; Line 620
	mov	DWORD PTR ?state@FTPObj@@2HA, 2		; FTPObj::state
; Line 621
	mov	ecx, DWORD PTR _Data$[ebp]
	mov	BYTE PTR [ecx], 51			; 00000033H
; Line 622
	mov	edx, DWORD PTR _Data$[ebp]
	mov	BYTE PTR [edx+1], 48			; 00000030H
; Line 623
	mov	eax, DWORD PTR _Data$[ebp]
	mov	BYTE PTR [eax+2], 52			; 00000034H
; Line 624
	mov	ecx, DWORD PTR _Data$[ebp]
	mov	BYTE PTR [ecx+3], 16			; 00000010H
; Line 625
	mov	edx, DWORD PTR _Data$[ebp]
	mov	BYTE PTR [edx+4], 19			; 00000013H
; Line 626
	mov	DWORD PTR ?TotalLostPkts@FTPObj@@0IA, 0	; FTPObj::TotalLostPkts
; Line 627
	mov	DWORD PTR ?TotalFilePkts@FTPObj@@0IA, 0	; FTPObj::TotalFilePkts
; Line 628
	mov	eax, DWORD PTR ?curraddress@FTPObj@@0PADA ; FTPObj::curraddress
	add	eax, DWORD PTR ?TFileSize@FTPObj@@0KA	; FTPObj::TFileSize
	mov	DWORD PTR ?curraddress@FTPObj@@0PADA, eax ; FTPObj::curraddress
; Line 629
	mov	ecx, DWORD PTR _currenttask$[ebp]
	push	ecx
	push	OFFSET FLAT:?DestMac@FTPObj@@2PADA	; FTPObj::DestMac
	push	10					; 0000000aH
	mov	edx, DWORD PTR _Data$[ebp]
	push	edx
	mov	ax, WORD PTR ?port@FTPObj@@2GA		; FTPObj::port
	push	eax
	push	OFFSET FLAT:?IP@FTPObj@@2PADA		; FTPObj::IP
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 12					; 0000000cH
	call	?sendData@UDPObj@@QAEHPADG0H0H@Z	; UDPObj::sendData
	mov	DWORD PTR _retcode$[ebp], eax
; Line 630
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L1745
$L1821:
; Line 634
	mov	ecx, DWORD PTR _Data$[ebp]
	mov	BYTE PTR [ecx], 51			; 00000033H
; Line 635
	mov	edx, DWORD PTR _Data$[ebp]
	mov	BYTE PTR [edx+1], 48			; 00000030H
; Line 636
	mov	eax, DWORD PTR _Data$[ebp]
	mov	BYTE PTR [eax+2], 54			; 00000036H
; Line 637
	mov	ecx, DWORD PTR _Data$[ebp]
	mov	BYTE PTR [ecx+3], 16			; 00000010H
; Line 638
	mov	edx, DWORD PTR _Data$[ebp]
	mov	BYTE PTR [edx+4], 19			; 00000013H
; Line 639
	mov	eax, DWORD PTR ?TotalLostPkts@FTPObj@@0IA ; FTPObj::TotalLostPkts
	lea	ecx, DWORD PTR ?LostPkts@FTPObj@@0PAIA[eax*4-4]
	mov	DWORD PTR _seqnum$[ebp], ecx
; Line 640
	mov	edx, DWORD PTR _Data$[ebp]
	mov	eax, DWORD PTR _seqnum$[ebp]
	mov	cl, BYTE PTR [eax]
	mov	BYTE PTR [edx+5], cl
; Line 641
	mov	edx, DWORD PTR _Data$[ebp]
	mov	eax, DWORD PTR _seqnum$[ebp]
	mov	cl, BYTE PTR [eax+1]
	mov	BYTE PTR [edx+6], cl
; Line 642
	mov	edx, DWORD PTR _Data$[ebp]
	mov	BYTE PTR [edx+7], 13			; 0000000dH
; Line 643
	mov	eax, DWORD PTR _Data$[ebp]
	mov	BYTE PTR [eax+8], 10			; 0000000aH
; Line 644
	mov	DWORD PTR ?state@FTPObj@@2HA, 4		; FTPObj::state
; Line 645
	mov	ecx, DWORD PTR _currenttask$[ebp]
	push	ecx
	push	OFFSET FLAT:?DestMac@FTPObj@@2PADA	; FTPObj::DestMac
	push	10					; 0000000aH
	mov	edx, DWORD PTR _Data$[ebp]
	push	edx
	mov	ax, WORD PTR ?port@FTPObj@@2GA		; FTPObj::port
	push	eax
	push	OFFSET FLAT:?IP@FTPObj@@2PADA		; FTPObj::IP
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 12					; 0000000cH
	call	?sendData@UDPObj@@QAEHPADG0H0H@Z	; UDPObj::sendData
	mov	DWORD PTR _retcode$[ebp], eax
; Line 646
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	$L1745
$L1822:
; Line 651
	jmp	$L1826
$L1796:
	cmp	DWORD PTR ?state@FTPObj@@2HA, 7		; FTPObj::state
	jne	SHORT $L1826
; Line 653
	mov	ecx, DWORD PTR _UData$[ebp]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, 49					; 00000031H
	jne	SHORT $L1826
	mov	eax, DWORD PTR _UData$[ebp]
	movsx	ecx, BYTE PTR [eax+1]
	cmp	ecx, 48					; 00000030H
	jne	SHORT $L1826
	mov	edx, DWORD PTR _UData$[ebp]
	movsx	eax, BYTE PTR [edx+2]
	cmp	eax, 51					; 00000033H
	jne	SHORT $L1826
; Line 655
	mov	ecx, DWORD PTR _Data$[ebp]
	mov	BYTE PTR [ecx], 49			; 00000031H
; Line 656
	mov	edx, DWORD PTR _Data$[ebp]
	mov	BYTE PTR [edx+1], 48			; 00000030H
; Line 657
	mov	eax, DWORD PTR _Data$[ebp]
	mov	BYTE PTR [eax+2], 52			; 00000034H
; Line 658
	mov	ecx, DWORD PTR _Data$[ebp]
	mov	BYTE PTR [ecx+3], 16			; 00000010H
; Line 659
	mov	edx, DWORD PTR _Data$[ebp]
	mov	BYTE PTR [edx+4], 19			; 00000013H
; Line 660
	mov	eax, DWORD PTR _currenttask$[ebp]
	push	eax
	push	OFFSET FLAT:?DestMac@FTPObj@@2PADA	; FTPObj::DestMac
	push	10					; 0000000aH
	mov	ecx, DWORD PTR _Data$[ebp]
	push	ecx
	mov	dx, WORD PTR ?port@FTPObj@@2GA		; FTPObj::port
	push	edx
	push	OFFSET FLAT:?IP@FTPObj@@2PADA		; FTPObj::IP
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 12					; 0000000cH
	call	?sendData@UDPObj@@QAEHPADG0H0H@Z	; UDPObj::sendData
	mov	DWORD PTR _retcode$[ebp], eax
; Line 661
	mov	DWORD PTR ?fileTransferFinished@FTPObj@@2HA, 1 ; FTPObj::fileTransferFinished
; Line 662
	mov	eax, DWORD PTR _retcode$[ebp]
	jmp	SHORT $L1745
$L1826:
; Line 666
	xor	eax, eax
	jmp	SHORT $L1745
$L1789:
; Line 667
	jmp	$FileExist$1785
$L1786:
	jmp	$FileExist$1785
$L1745:
	mov	esp, ebp
	pop	ebp
	ret	20					; 00000014H
?FtpHandler@FTPObj@@QAEHPADJ0GH@Z ENDP			; FTPObj::FtpHandler
_TEXT	ENDS
END
