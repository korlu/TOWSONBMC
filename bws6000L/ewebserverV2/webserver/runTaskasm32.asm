;***************************************************
		;runTaskasm32.asm 
;***************************************************
		
;===============-=====================================================
;this assembly function can be called from C 
;32 bit model and C type call settings 
; Modified by L Sun, date 01-14-2003 (to be used for communication program)
;=====================================================================
	.386p	
	.387
	.MODEL	FLAT, c
;=====================================================================
; the following header definition is created 
; by H2INC program and added here 
; It can take a C header file and generate 
; a .INC file which can be included in the 
;  asm code as below 

;	include aoainc.inc

;===================================================================

.CODE
;------------------------------------------------------------------
;RunTask using int 0efh APP1Tssc
;------------------------------------------------------------------
runTaskasm32 PROC C public Task_ID:DWORD
	push eax
	mov  eax, Task_ID
	cmp  eax, 0h
	je   Sch
	sti			; Sti is to enable the interrupts in the processor before starting other tasks	
	int 0efh ;invoke the task
	jmp Schend	
Sch:	int 0ebh		; if it is scheduler task dont enable timer 
Schend:	pop eax
	ret
runTaskasm32 ENDP 	
;------------------------------------------------------------------
; return to main task 
;------------------------------------------------------------------
runTaskMainasm32 PROC C
	        ;--------------------------------------------------
		cli
		push	edx
		pushfd ; turn on NT flag in the CPU not in the TSS
		; so that CPU will return to its application during IRETD
		pop	edx;
		or	edx, 00004000h
		push	edx
		popfd
		pop	edx
		sti
		;--------------------------------------------------
	  iretd
	  nop
	  ret
runTaskMainasm32 ENDP 	
;=========================================================================
END
