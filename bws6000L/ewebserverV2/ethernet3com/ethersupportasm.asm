	.386p
	.387
	.model flat,c

	include ethernetinc.inc

.code

;=================================================================================      
;Check if the bit 12 is set to 1 to indicate the command is processing (6-13).
;This procedure can be used in any window, before and after you use this procedure,
;you don't need to change window.

Wait_Command_Finish   PROC c public uses edx 
	push 	edx

Wait_Command_End:
	in      ax, dx
	and     ax, 1000h                       ;Check status
	jnz     Wait_Command_End
	
	pop	edx
	ret
	
Wait_Command_Finish  ENDP

;=================================================================================      
;This procedure can be used only in window 0, before call it, make sure in window 0.
;Check if EEPROM is busy (7-21).

Wait_EEPROM_Unbusy    PROC c public uses edx 
	push	edx
	
	add     dx, 0ah

Wait_EEPROM_Busy:

	in      ax, dx                          ;Check bit
	and     ax, 8000h
	jnz     Wait_EEPROM_Busy
	
	sub	dx, 0ah

	pop	edx
	ret

Wait_EEPROM_Unbusy    ENDP         

;=================================================================================
;=================================================================================      
;Check total frames transmitted: offset 06h, in window 6; 
;check total bytes transmitted successfully: offset 0ch, in window 6 (6-24).
;This procedure can be used in any window, but any time you use this procedure, 
;don't forget change the window back to the previous window if necessary.


Check_Window6_Transmit_Success    PROC c public uses edx 
	push	edx
	
	mov     ax, Command_SelectWindow+6
	out     dx, ax
	call    Wait_Command_Finish 

	sub     dx, 8                           ;If al=0, no frame is transmitted yet.
	in      al, dx                          ;If al=1, that frame is transmitted OK.
	
	add     dx, 4                         ;If ax=0, no bytes are transmitted yet.
	in      ax, dx                          ;If ax=512 or 200h, all bytes transmitted OK.
	
	pop	edx

	ret
	
Check_Window6_Transmit_Success    ENDP
;=================================================================================     
;Check the actual number of free bytes of transmission (5-3), (6-21).
;This procedure can be used in window 1.

Check_Window3_FreeTX    PROC c public uses edx
	push	edx

	mov     ax, Command_SelectWindow+3
	out     dx, ax
	call    Wait_Command_Finish
	
	sub     dx, 2                         ;Offset 0ch supposed to hold the 
	in      ax, dx                          ;actual number of free bytes remaining in TX FIFO.
	
	add     dx, 2 
	mov     ax, Command_SelectWindow+1
	out     dx, ax
	call    Wait_Command_Finish
	
	pop	edx
	ret
Check_Window3_FreeTX    ENDP

;=================================================================================

end
