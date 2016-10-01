;****************************************************************************
; ShortDelay.asm 
; modified by RKK and Karthick on 3-23-2004 
; passing by reference or pointers need special attention 
; passing return value from asm to c will done automatically if the results 
; are placed in eax 
; passing reference values must be done explicitly in asm code 
; as shown in the malloc example 
; ShortDelay can be used by prcycle code and as well as AOAShortDelay in C++
;*****************************************************************************
		
;===============-=============================================================
; this assembly function can be called from C 
; 32 bit model and C type call settings 
; Modified by L Sun, date 01-14-2003 (to be used for communication program)
;=============================================================================
	.386p	
	.MODEL	FLAT, c
;=============================================================================
; the following header definition is created 
; by H2INC program and added here 
; It can take a C header file and generate 
; a .INC file which can be included in the 
; asm code as below 
	include ethernetinc.inc 
	
;=============================================================================
; The Dealy is in micro seconds
; Donot use this for more that 1 sec delays
; Formulae to Calculate the delay
; C- Loop Count
; N- Number of cycles in the loop
; D- Delay Required in Micor Seconds
; F- Clock Frequency in MHZ, the processor speed
; C- (F*D)/N

.CODE
ShortDelay PROC C public uses ebx ecx edx, Delay:dword
	push	ebx
	push	ecx
	push	edx
	
	mov	eax, Processor_Speed		; Get the speed of the processor
	mov	edx, Delay			; Get the delay in micro seconds
	mul	edx				; multiply the processor speed with the delay
	mov	ecx, NoOfCycles_Delay		; Get the no of cycles for the loop instruction
	div	ecx; The result of div is in eax; divide the multiplied result with the No of cycles	
	mov	ecx, eax
DELAYLOOP:
	loop	DELAYLOOP			; Wait in a loop untill the time is done
	mov	eax, 0

	pop	edx
	pop	ecx
	pop	ebx
	ret
ShortDelay ENDP 	
;=========================================================================
END
