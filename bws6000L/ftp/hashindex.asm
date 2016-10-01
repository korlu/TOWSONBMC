	TITLE	hashindex.cpp
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
PUBLIC	?HttpnoIndexRecords@HttphashIndex@@0JA		; HttphashIndex::HttpnoIndexRecords
PUBLIC	?HttphashBaseAddress@HttphashIndex@@0KA		; HttphashIndex::HttphashBaseAddress
_BSS	SEGMENT
?HttpnoIndexRecords@HttphashIndex@@0JA DD 01H DUP (?)	; HttphashIndex::HttpnoIndexRecords
?HttphashBaseAddress@HttphashIndex@@0KA DD 01H DUP (?)	; HttphashIndex::HttphashBaseAddress
_BSS	ENDS
PUBLIC	?init@HttphashIndex@@QAEHJK@Z			; HttphashIndex::init
_TEXT	SEGMENT
_noRecords$ = 8
_baseAddress$ = 12
_this$ = -4
?init@HttphashIndex@@QAEHJK@Z PROC NEAR			; HttphashIndex::init
; File hashindex.cpp
; Line 7
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 9
	mov	eax, DWORD PTR _noRecords$[ebp]
	mov	DWORD PTR ?HttpnoIndexRecords@HttphashIndex@@0JA, eax ; HttphashIndex::HttpnoIndexRecords
; Line 10
	mov	ecx, DWORD PTR _baseAddress$[ebp]
	mov	DWORD PTR ?HttphashBaseAddress@HttphashIndex@@0KA, ecx ; HttphashIndex::HttphashBaseAddress
; Line 11
	mov	eax, DWORD PTR _noRecords$[ebp]
	shl	eax, 2
; Line 13
	mov	esp, ebp
	pop	ebp
	ret	8
?init@HttphashIndex@@QAEHJK@Z ENDP			; HttphashIndex::init
_TEXT	ENDS
PUBLIC	?hashfun@HttphashIndex@@QAEJPADH@Z		; HttphashIndex::hashfun
_TEXT	SEGMENT
_name$ = 8
_size$ = 12
_this$ = -16
_hashValue$ = -8
_temp$ = -4
_i$ = -12
?hashfun@HttphashIndex@@QAEJPADH@Z PROC NEAR		; HttphashIndex::hashfun
; Line 16
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	mov	DWORD PTR _this$[ebp], ecx
; Line 17
	mov	DWORD PTR _hashValue$[ebp], 0
; Line 19
	cmp	DWORD PTR _size$[ebp], 1
	jge	SHORT $L885
; Line 21
	or	eax, -1
	jmp	SHORT $L882
$L885:
; Line 23
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L887
$L888:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L887:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _size$[ebp]
	jge	SHORT $L889
; Line 25
	mov	edx, DWORD PTR _name$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	mov	al, BYTE PTR [edx]
	mov	BYTE PTR _temp$[ebp], al
; Line 27
	movsx	ecx, BYTE PTR _temp$[ebp]
	cmp	ecx, 90					; 0000005aH
	jle	SHORT $L890
; Line 29
	movsx	edx, BYTE PTR _temp$[ebp]
	sub	edx, 90					; 0000005aH
	mov	BYTE PTR _temp$[ebp], dl
$L890:
; Line 32
	movsx	eax, BYTE PTR _temp$[ebp]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _hashValue$[ebp]
	add	ecx, eax
	mov	DWORD PTR _hashValue$[ebp], ecx
; Line 33
	jmp	SHORT $L888
$L889:
; Line 34
	mov	eax, DWORD PTR _hashValue$[ebp]
	cdq
	idiv	DWORD PTR ?HttpnoIndexRecords@HttphashIndex@@0JA ; HttphashIndex::HttpnoIndexRecords
	mov	eax, edx
$L882:
; Line 35
	mov	esp, ebp
	pop	ebp
	ret	8
?hashfun@HttphashIndex@@QAEJPADH@Z ENDP			; HttphashIndex::hashfun
_TEXT	ENDS
PUBLIC	?get@HttphashIndex@@QAEPADPADH@Z		; HttphashIndex::get
_TEXT	SEGMENT
_name$ = 8
_size$ = 12
_this$ = -12
_hashValue$ = -8
_temp$ = -4
?get@HttphashIndex@@QAEPADPADH@Z PROC NEAR		; HttphashIndex::get
; Line 38
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 40
	mov	eax, DWORD PTR _size$[ebp]
	push	eax
	mov	ecx, DWORD PTR _name$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?hashfun@HttphashIndex@@QAEJPADH@Z	; HttphashIndex::hashfun
	mov	DWORD PTR _hashValue$[ebp], eax
; Line 42
	mov	edx, DWORD PTR ?HttphashBaseAddress@HttphashIndex@@0KA ; HttphashIndex::HttphashBaseAddress
	mov	DWORD PTR _temp$[ebp], edx
; Line 44
	mov	eax, DWORD PTR _hashValue$[ebp]
	mov	ecx, DWORD PTR _temp$[ebp]
	mov	eax, DWORD PTR [ecx+eax*4]
; Line 45
	mov	esp, ebp
	pop	ebp
	ret	8
?get@HttphashIndex@@QAEPADPADH@Z ENDP			; HttphashIndex::get
_TEXT	ENDS
PUBLIC	?setIndex@HttphashIndex@@QAEHJK@Z		; HttphashIndex::setIndex
_TEXT	SEGMENT
_hashValue$ = 8
_hashAddress$ = 12
_this$ = -8
_temp$ = -4
?setIndex@HttphashIndex@@QAEHJK@Z PROC NEAR		; HttphashIndex::setIndex
; Line 49
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 51
	mov	eax, DWORD PTR ?HttphashBaseAddress@HttphashIndex@@0KA ; HttphashIndex::HttphashBaseAddress
	mov	DWORD PTR _temp$[ebp], eax
; Line 52
	mov	ecx, DWORD PTR _hashValue$[ebp]
	mov	edx, DWORD PTR _temp$[ebp]
	cmp	DWORD PTR [edx+ecx*4], 0
	jne	SHORT $L908
; Line 54
	mov	eax, DWORD PTR _hashValue$[ebp]
	mov	ecx, DWORD PTR _temp$[ebp]
	mov	edx, DWORD PTR _hashAddress$[ebp]
	mov	DWORD PTR [ecx+eax*4], edx
; Line 55
	xor	eax, eax
	jmp	SHORT $L909
$L908:
; Line 58
	or	eax, -1
$L909:
; Line 60
	mov	esp, ebp
	pop	ebp
	ret	8
?setIndex@HttphashIndex@@QAEHJK@Z ENDP			; HttphashIndex::setIndex
_TEXT	ENDS
PUBLIC	?getIndex@HttphashIndex@@QAEKJ@Z		; HttphashIndex::getIndex
_TEXT	SEGMENT
_hashValue$ = 8
_this$ = -8
_temp$ = -4
?getIndex@HttphashIndex@@QAEKJ@Z PROC NEAR		; HttphashIndex::getIndex
; Line 63
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 65
	mov	eax, DWORD PTR ?HttphashBaseAddress@HttphashIndex@@0KA ; HttphashIndex::HttphashBaseAddress
	mov	DWORD PTR _temp$[ebp], eax
; Line 66
	mov	ecx, DWORD PTR _hashValue$[ebp]
	mov	edx, DWORD PTR _temp$[ebp]
	mov	eax, DWORD PTR [edx+ecx*4]
; Line 67
	mov	esp, ebp
	pop	ebp
	ret	4
?getIndex@HttphashIndex@@QAEKJ@Z ENDP			; HttphashIndex::getIndex
_TEXT	ENDS
END
