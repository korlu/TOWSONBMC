	TITLE	runTask.c
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
PUBLIC	_runTask
EXTRN	_runTaskasm32:NEAR
_TEXT	SEGMENT
_Task_ID$ = 8
_runTask PROC NEAR
; File runTask.c
; Line 2
	push	ebp
	mov	ebp, esp
; Line 3
	mov	eax, DWORD PTR _Task_ID$[ebp]
	push	eax
	call	_runTaskasm32
	add	esp, 4
; Line 4
	pop	ebp
	ret	0
_runTask ENDP
_TEXT	ENDS
PUBLIC	_runTaskMain
EXTRN	_runTaskMainasm32:NEAR
_TEXT	SEGMENT
_runTaskMain PROC NEAR
; Line 6
	push	ebp
	mov	ebp, esp
; Line 7
	call	_runTaskMainasm32
; Line 8
	pop	ebp
	ret	0
_runTaskMain ENDP
_TEXT	ENDS
END
