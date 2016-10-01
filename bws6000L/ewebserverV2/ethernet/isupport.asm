	.386p
	.387
	.model flat,c

.CODE

;***********************************************************************
; get register value
;***********************************************************************
igetRegister32 proc c public uses edx, iobase:DWORD
    	push 	edx
	
	mov	eax, 0
	mov	edx, 0
	
    	mov 	eax, iobase   
 	mov 	dx, ax    
	mov 	eax, 0
	in 	eax, dx 

	pop	edx
	ret
igetRegister32 endp

;***********************************************************************
; set register value
;***********************************************************************
isetRegister32 proc c public uses edx, value:DWORD, iobase:DWORD
   	push 	edx
	
	mov	eax, 0
	mov	edx, 0
	
    	mov 	eax, iobase   
 	mov 	dx, ax    
	mov 	eax, value
	out 	dx, eax 

	pop	edx
	ret
isetRegister32 endp

end
