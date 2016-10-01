	TITLE	testhttp.cpp
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
PUBLIC	_main
EXTRN	??0AOAProtected@@QAE@XZ:NEAR			; AOAProtected::AOAProtected
EXTRN	?AOAprintHex@AOAProtected@@QAEHHH@Z:NEAR	; AOAProtected::AOAprintHex
EXTRN	?AOAExit@AOAProtected@@QAEXXZ:NEAR		; AOAProtected::AOAExit
EXTRN	?init@HttpIndex@@QAEHKKHH@Z:NEAR		; HttpIndex::init
EXTRN	?readFloppy@HttpIndex@@QAEHXZ:NEAR		; HttpIndex::readFloppy
EXTRN	?getFile@HttpIndex@@QAEHPADPAK1@Z:NEAR		; HttpIndex::getFile
_DATA	SEGMENT
$SG521	DB	'word.txt', 00H
_DATA	ENDS
_TEXT	SEGMENT
_FileStartAddress$ = -8
_FileSize$ = -12
_http$ = -4
_io$ = -16
_main	PROC NEAR
; File testhttp.cpp
; Line 4
	push	ebp
	mov	ebp, esp
	sub	esp, 616				; 00000268H
; Line 12
	lea	ecx, DWORD PTR _io$[ebp]
	call	??0AOAProtected@@QAE@XZ			; AOAProtected::AOAProtected
; Line 13
	push	1000					; 000003e8H
	push	10000					; 00002710H
	push	50331648				; 03000000H
	push	67108864				; 04000000H
	lea	ecx, DWORD PTR _http$[ebp]
	call	?init@HttpIndex@@QAEHKKHH@Z		; HttpIndex::init
; Line 14
	push	2400					; 00000960H
	lea	ecx, DWORD PTR _http$[ebp]
	call	?readFloppy@HttpIndex@@QAEHXZ		; HttpIndex::readFloppy
	push	eax
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHHH@Z	; AOAProtected::AOAprintHex
; Line 15
	lea	eax, DWORD PTR _FileSize$[ebp]
	push	eax
	lea	ecx, DWORD PTR _FileStartAddress$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG521
	lea	ecx, DWORD PTR _http$[ebp]
	call	?getFile@HttpIndex@@QAEHPADPAK1@Z	; HttpIndex::getFile
; Line 16
	push	3040					; 00000be0H
	mov	edx, DWORD PTR _FileStartAddress$[ebp]
	push	edx
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHHH@Z	; AOAProtected::AOAprintHex
; Line 17
	push	3060					; 00000bf4H
	mov	eax, DWORD PTR _FileSize$[ebp]
	push	eax
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHHH@Z	; AOAProtected::AOAprintHex
; Line 18
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAExit@AOAProtected@@QAEXXZ		; AOAProtected::AOAExit
; Line 19
	mov	esp, ebp
	pop	ebp
	ret	0
_main	ENDP
_TEXT	ENDS
END
