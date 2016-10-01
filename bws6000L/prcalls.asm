;----------------------------------------------------------------------------
;prcalls.asm
;----------------------------------------------------------------------------
;Place all the procedures in this file which do not have any data.
;----------------------------------------------------------------------------

PUBLIC 		WriteString
PUBLIC 		ClearScreen
PUBLIC		GETKEYFORMENU
PUBLIC		NEWLINE
PUBLIC		GET_PARAMETER
PUBLIC		ResetPointer
PUBLIC		PRINTSTR

EXTRN		PUTHEX32R:near

;----------------------------------------------------------------------------
.386
;----------------------------------------------------------------------------
RCodeSeg        SEGMENT PARA public USE16 'CODE'
		ASSUME  CS:RCodeSeg
;----------------------------------------------------------------------------
; Display string call, works in real mode 
; data at pointer ESI 
;----------------------------------------------------------------------------
WriteString proc 		; Print an ASCIIZ string at DS:ESI
	push	eax
	push	ebx
Write_Begin:
	LODSB			; Next character
	OR      AL, AL
	JZ      Write_End       ; AL=0 => end of ASCIIZ string
	MOV     BL,13           ; Char's attribute
	MOV     AH,0EH          ; BIOS service - write character
	INT     10H
	JMP     SHORT Write_Begin
Write_End:
	pop	ebx
	pop	eax
	RET
WriteString endp 
;----------------------------------------------------------------------------
; In real mode CLEAR_SCREEN clears the screen 
;----------------------------------------------------------------------------
ClearScreen     PROC  

		push	ecx
		push	ebx
		push	eax
		push	edx
		XOR   ECX,ECX
		MOV   DL, 129 

		MOV   DH, 50   
		MOV   BH,7
		XOR   AL,AL
		MOV   AH,6
		INT   10H
		
		pop	edx
		pop	eax
		pop	ebx
		pop	ecx

		RET
ClearScreen     ENDP
;----------------------------------------------------------------------------
;Takes the keyboard input in Realmode
;----------------------------------------------------------------------------
GETKEYFORMENU   PROC   
	
	MOV     AH,10H
	INT     16H
	MOV     AH,14
	INT     10H
	RET

GETKEYFORMENU   ENDP
;----------------------------------------------------------------------------
;Prints a Newline
;----------------------------------------------------------------------------
NEWLINE PROC 
	
	PUSH	EAX
	MOV     AL,0AH
	MOV     AH,14
	INT     10H
	
	MOV     AL,0dH
	MOV     AH,14
	INT     10H
	POP	EAX
	RET

NEWLINE ENDP
;----------------------------------------------------------------------------
;Takes the user input parameters
;----------------------------------------------------------------------------
GET_PARAMETER   PROC 

	PUSH	EAX
	MOV     AH,10H
	INT     16H

	MOV     BH,AL

	MOV     AH,10H
	INT     16H
	MOV     BL,AL   

	MOV     AL,BH
	MOV     AH,14
	INT     10H

	MOV     AL,BL
	MOV     AH,14
	INT     10H

	MOV     AL,' '
	MOV     AH,14
	INT     10H

	POP	EAX
	RET

GET_PARAMETER   ENDP
;----------------------------------------------------------------------------
ResetPointer proc 

	push	eax
	push	edx
	push	ebx

	MOV	AH,2
	MOV	bh,0
	mov	dh,0
	mov	dl,0
	INT	10H	
	
	pop	ebx
	pop	edx
	pop	eax
	RET
ResetPointer endp

;==============================================================================
;this procedure prints stack given SS,ESP
;eax should have the number of words to display
;==============================================================================

PRINTSTR PROC near 

	; eax register has the count for printing stack
	;==================================================
	push    ebp        ; save bp 
	mov     ebp,esp
	
	push	ecx
	push	eax
	push	edi
	push	ebx

	CALL    NEWLINE
	
	mov	edi,eax	
	mov 	ebx, 16
LOOPSTACK1:
	mov	eax,0
	mov     ax,ss:[ebp+edi+0]
	CALL	PUTHEX32R

	mov	al,' '
	mov	ah,14
	int	10h
	
	sub	ebx, 2
	cmp 	ebx, 0
	JNZ	NONEWLINE
	CALL	NEWLINE
	mov	ebx,16
NONEWLINE:
	SUB     edi,2
	cmp     edi,0
	JNZ     LOOPSTACK1

        pop	ebx 
	pop     edi
	pop     eax 
	pop	ecx
	pop     ebp         ; restore reg values 

	RET    

PRINTSTR ENDP               ; end of procedure 

;----------------------------------------------------------------------------

RCodeSeg        ENDS
		END 
