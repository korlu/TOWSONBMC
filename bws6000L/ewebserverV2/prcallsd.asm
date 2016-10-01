;----------------------------------------------------------------------------
;prcallsd.asm
;----------------------------------------------------------------------------
;Place all the procedures which have data in this file.
;
;----------------------------------------------------------------------------
; all external declarations for procedures follow 
;----------------------------------------------------------------------------
PUBLIC 		PUTHEX32R
PUBLIC		PRINTMEMR

EXTRN		HexTable:BYTE, IndexCnt:DWORD, PrintData:DWORD

;----------------------------------------------------------------------------
INCLUDE 	386SCD.INC
;----------------------------------------------------------------------------

RCodeSeg        SEGMENT PARA public USE16 'CODE'
		ASSUME  CS:RCodeSeg
;----------------------------------------------------------------------------
;This Procedure prints 32-bit EAX register in hex-format in real mode
;place the binary value in eax and call.
;either one must load the entire EAX with a proper value or 
;one must reset EAX if partial value is loaded before invoking this call 
;----------------------------------------------------------------------------

PUTHEX32R       PROC NEAR

	PUSH    ECX
	PUSH    ESI
	PUSH    EDI	
;-------------------------------
	MOV     DWORD PTR [PrintData+0], eax          	; save data in memory
	MOV     ecx, 8                  		; eight characters
PutHexLoop1:
	MOV     eax, DWORD PTR [PrintData+0]          	; data in eax
	AND     eax, 0F0000000h         		; select first nibble
	ROL     eax,4                   		; get the count on right
	MOV     DWORD PTR [IndexCnt+0], eax           	; store the index 
	ADD     esi, DWORD PTR [IndexCnt+0]	        ; add index to address
	MOV     edi, DWORD PTR [IndexCnt+0] 
	MOV     al, BYTE PTR HexTable[edi+0]  		; get hex character
	mov     ah,14
	int     10h
	MOV     eax, DWORD PTR [PrintData+0]          	; get the stored data
	SHL     eax, 4                  	 	; shift to next nibble
	MOV     DWORD PTR [PrintData+0], eax          	; store remaining data 
	LOOP    PutHexLoop1             		; print all 8 hex characters

;	NewLineM
;-------------------------------	
	POP     EDI
	POP     ESI
	POP     ECX

	RET

PUTHEX32R ENDP
;***************************************************************************
;This Procedure prints the memory in hex-format in Real mode
;place the memory location in EAX and position to display in EBX and call.
;***************************************************************************
PRINTMEMR       PROC    

	PUSH    ECX
	PUSH    ESI
	PUSH    EDI
;	push    ds
	push	ebx
	push	es
	push	eax	
	mov	ax,0h
	mov	es,ax
	pop	eax
	mov	ebx,0

	mov     edi,eax                  ;printing from 1st or 4th line(resp..)
	mov     ecx,128
	
memloop:
	mov     eax,es:[edi]    
	CALL	PUTHEX32R
	push	eax
	mov	al,' '
	mov	ah,14
	int	10h
	pop	eax
	add     edi,4
	inc	ebx
	cmp	ebx,8
	je	NextLine
	loop	memloop
NextLine:
	NewLineM
	mov	ebx,0

	loop    memloop

	pop	es
	pop	ebx
;	pop     ds
	POP     EDI
	POP     ESI
	POP     ECX
	RET

PRINTMEMR       ENDP

;***************************************************************************
;----------------------------------------------------------------------------
RCodeSeg        ENDS
		END 
