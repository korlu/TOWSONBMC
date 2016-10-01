	TITLE	thashindex.cpp
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
PUBLIC	?TcpnoIndexRecords@TcphashIndex@@0JA		; TcphashIndex::TcpnoIndexRecords
PUBLIC	?TcphashBaseAddress@TcphashIndex@@0KA		; TcphashIndex::TcphashBaseAddress
_BSS	SEGMENT
?TcpnoIndexRecords@TcphashIndex@@0JA DD 01H DUP (?)	; TcphashIndex::TcpnoIndexRecords
?TcphashBaseAddress@TcphashIndex@@0KA DD 01H DUP (?)	; TcphashIndex::TcphashBaseAddress
_BSS	ENDS
PUBLIC	?init@TcphashIndex@@QAEHJK@Z			; TcphashIndex::init
_TEXT	SEGMENT
_noRecords$ = 8
_baseAddress$ = 12
_this$ = -12
_temp$ = -4
_i$ = -8
?init@TcphashIndex@@QAEHJK@Z PROC NEAR			; TcphashIndex::init
; File thashindex.cpp
; Line 12
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 14
	mov	eax, DWORD PTR _noRecords$[ebp]
	mov	DWORD PTR ?TcpnoIndexRecords@TcphashIndex@@0JA, eax ; TcphashIndex::TcpnoIndexRecords
; Line 15
	mov	ecx, DWORD PTR _baseAddress$[ebp]
	mov	DWORD PTR ?TcphashBaseAddress@TcphashIndex@@0KA, ecx ; TcphashIndex::TcphashBaseAddress
; Line 17
	mov	edx, DWORD PTR ?TcphashBaseAddress@TcphashIndex@@0KA ; TcphashIndex::TcphashBaseAddress
	mov	DWORD PTR _temp$[ebp], edx
; Line 19
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L875
$L876:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L875:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _noRecords$[ebp]
	jge	SHORT $L877
; Line 21
	mov	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _temp$[ebp]
	mov	DWORD PTR [eax+edx*4], -1
; Line 22
	jmp	SHORT $L876
$L877:
; Line 24
	mov	eax, DWORD PTR _noRecords$[ebp]
	shl	eax, 2
; Line 26
	mov	esp, ebp
	pop	ebp
	ret	8
?init@TcphashIndex@@QAEHJK@Z ENDP			; TcphashIndex::init
_TEXT	ENDS
PUBLIC	?hashfun@TcphashIndex@@QAEJPAD0@Z		; TcphashIndex::hashfun
_TEXT	SEGMENT
_ip$ = 8
_port$ = 12
_this$ = -8
_hashValue$ = -4
?hashfun@TcphashIndex@@QAEJPAD0@Z PROC NEAR		; TcphashIndex::hashfun
; Line 36
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 37
	mov	DWORD PTR _hashValue$[ebp], 0
; Line 38
	mov	eax, DWORD PTR _ip$[ebp]
	movsx	ecx, BYTE PTR [eax]
	and	ecx, 255				; 000000ffH
	mov	edx, DWORD PTR _hashValue$[ebp]
	add	edx, ecx
	mov	DWORD PTR _hashValue$[ebp], edx
; Line 39
	mov	eax, DWORD PTR _ip$[ebp]
	movsx	ecx, BYTE PTR [eax+1]
	and	ecx, 255				; 000000ffH
	mov	edx, DWORD PTR _hashValue$[ebp]
	add	edx, ecx
	mov	DWORD PTR _hashValue$[ebp], edx
; Line 40
	mov	eax, DWORD PTR _ip$[ebp]
	movsx	ecx, BYTE PTR [eax+2]
	and	ecx, 255				; 000000ffH
	mov	edx, DWORD PTR _hashValue$[ebp]
	add	edx, ecx
	mov	DWORD PTR _hashValue$[ebp], edx
; Line 41
	mov	eax, DWORD PTR _ip$[ebp]
	movsx	ecx, BYTE PTR [eax+3]
	and	ecx, 255				; 000000ffH
	mov	edx, DWORD PTR _hashValue$[ebp]
	add	edx, ecx
	mov	DWORD PTR _hashValue$[ebp], edx
; Line 42
	mov	eax, DWORD PTR _port$[ebp]
	movsx	ecx, BYTE PTR [eax]
	and	ecx, 255				; 000000ffH
	mov	edx, DWORD PTR _hashValue$[ebp]
	add	edx, ecx
	mov	DWORD PTR _hashValue$[ebp], edx
; Line 43
	mov	eax, DWORD PTR _port$[ebp]
	movsx	ecx, BYTE PTR [eax+1]
	and	ecx, 255				; 000000ffH
	mov	edx, DWORD PTR _hashValue$[ebp]
	add	edx, ecx
	mov	DWORD PTR _hashValue$[ebp], edx
; Line 44
	mov	eax, DWORD PTR _hashValue$[ebp]
	cdq
	idiv	DWORD PTR ?TcpnoIndexRecords@TcphashIndex@@0JA ; TcphashIndex::TcpnoIndexRecords
	mov	eax, edx
; Line 45
	mov	esp, ebp
	pop	ebp
	ret	8
?hashfun@TcphashIndex@@QAEJPAD0@Z ENDP			; TcphashIndex::hashfun
_TEXT	ENDS
PUBLIC	?get@TcphashIndex@@QAEJPAD0@Z			; TcphashIndex::get
_TEXT	SEGMENT
_ip$ = 8
_port$ = 12
_this$ = -12
_hashValue$ = -8
_temp$ = -4
?get@TcphashIndex@@QAEJPAD0@Z PROC NEAR			; TcphashIndex::get
; Line 50
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 51
	mov	eax, DWORD PTR _port$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ip$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?hashfun@TcphashIndex@@QAEJPAD0@Z	; TcphashIndex::hashfun
	mov	DWORD PTR _hashValue$[ebp], eax
; Line 53
	mov	edx, DWORD PTR ?TcphashBaseAddress@TcphashIndex@@0KA ; TcphashIndex::TcphashBaseAddress
	mov	DWORD PTR _temp$[ebp], edx
; Line 54
	mov	eax, DWORD PTR _hashValue$[ebp]
	mov	ecx, DWORD PTR _temp$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
; Line 55
	mov	esp, ebp
	pop	ebp
	ret	8
?get@TcphashIndex@@QAEJPAD0@Z ENDP			; TcphashIndex::get
_TEXT	ENDS
PUBLIC	?setIndex@TcphashIndex@@QAEJJJ@Z		; TcphashIndex::setIndex
_TEXT	SEGMENT
_hashValue$ = 8
_hashAddress$ = 12
_this$ = -8
_temp$ = -4
?setIndex@TcphashIndex@@QAEJJJ@Z PROC NEAR		; TcphashIndex::setIndex
; Line 60
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 62
	mov	eax, DWORD PTR ?TcphashBaseAddress@TcphashIndex@@0KA ; TcphashIndex::TcphashBaseAddress
	mov	DWORD PTR _temp$[ebp], eax
; Line 63
	mov	ecx, DWORD PTR _hashValue$[ebp]
	mov	edx, DWORD PTR _temp$[ebp]
	mov	eax, DWORD PTR _hashAddress$[ebp]
	mov	DWORD PTR [edx+ecx*4], eax
; Line 64
	xor	eax, eax
; Line 65
	mov	esp, ebp
	pop	ebp
	ret	8
?setIndex@TcphashIndex@@QAEJJJ@Z ENDP			; TcphashIndex::setIndex
_TEXT	ENDS
PUBLIC	?getIndex@TcphashIndex@@QAEJJ@Z			; TcphashIndex::getIndex
_TEXT	SEGMENT
_hashValue$ = 8
_this$ = -8
_temp$ = -4
?getIndex@TcphashIndex@@QAEJJ@Z PROC NEAR		; TcphashIndex::getIndex
; Line 72
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 74
	mov	eax, DWORD PTR ?TcphashBaseAddress@TcphashIndex@@0KA ; TcphashIndex::TcphashBaseAddress
	mov	DWORD PTR _temp$[ebp], eax
; Line 75
	mov	ecx, DWORD PTR _hashValue$[ebp]
	mov	edx, DWORD PTR _temp$[ebp]
	mov	eax, DWORD PTR [edx+ecx*4]
; Line 76
	mov	esp, ebp
	pop	ebp
	ret	4
?getIndex@TcphashIndex@@QAEJJ@Z ENDP			; TcphashIndex::getIndex
_TEXT	ENDS
END
