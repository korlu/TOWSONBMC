	.386p
	.387
	.model flat,c

	include ethernetinc.inc

.CODE

closeasm proc c public uses edx, IO_BASE:word
	push	edx
	
	mov	ax, IO_BASE
	mov	dx, ax

	add     dx, 0eh
	mov     ax, Command_SelectWindow+1
	out     dx, ax
	call    Wait_Command_Finish
	
	mov	ax, Command_StatsDisable
	out	dx, ax
	call	Wait_Command_Finish

	mov	ax, Command_RXDisable
	out	dx, ax
	call	Wait_Command_Finish

	mov	ax, Command_TXDisable
	out	dx, ax
	call	Wait_Command_Finish
	
	pop	edx
	ret
;=================================================================================      
closeasm endp
;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
end
