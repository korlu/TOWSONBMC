
	.386p
	.387
	.model flat,c

	include ethernetinc.inc

.CODE

;***********************************************************************
; enable receiver 
; enabling and disabling can also be done through a different method 
;  where you put a 0 value or a needed value in the UpLstPtr 
;***********************************************************************
enableReceive 	proc c public uses edx, IOBASE:DWORD  
	push 	edx 

        mov eax, 0  ; will change the window to 0 
        mov eax, IOBASE
 	mov dx, ax            
	add dx, 0eh    
	mov ax, Command_SelectWindow + 0 
	out dx, ax 
	CALL Wait_Command_Finish 

        mov ax, Command_RXEnable ;  enable the receiver  
	out dx, ax 
	CALL Wait_Command_Finish 
	mov     eax, 0

	pop	edx 
	ret
enableReceive 	endp

;***********************************************************************
; disable receiver 
;***********************************************************************
disableReceive 	proc c public uses edx, IOBASE:DWORD  
	push 	edx 

        mov eax, 0  ; will change the window to 0 
        mov eax, IOBASE
 	mov dx, ax            
	add dx, 0eh    
	mov ax, Command_SelectWindow + 0 
	out dx, ax 
	CALL Wait_Command_Finish 

        mov ax, Command_RXDisable ; disable the receiver  
	out dx, ax 
	CALL Wait_Command_Finish 
	mov	eax, 0 ; return code 

	pop	edx 
	ret
disableReceive 	endp

;***********************************************************************
; get the current receive Ptr like InPtr in a circular list 
;  UpListPtr from the NIC can be used to get a pktno in the data structure 
; pktno in the UPD is retrieved and used as InPtr for the circular list 
;***********************************************************************
getCurrentReceivePtr 	proc c public uses edx, IOBASE:WORD  
;	push 	ebx 
	push 	edx 
;	push 	es

        mov 	ax, IOBASE
 	mov 	dx, ax            
	add 	dx, 38h      ;UpListPtr stored in the card  
	in  	eax, dx  
;	push	eax          ; save 
        
;	mov 	ax, MEMDataSel ; zero selector  
;	mov	es, ax 
;	pop	eax
	
;	mov	ebx, eax       ; 0251e700 or appropriate address, pktno is at 10h  
;	add	ebx, 10h       ; InPtr is inferred by the UpListPtr by using the pktno stored in the UPD
;	mov	eax, es:[ebx]  ; get the InPtr from the UPD or rcv ptr in number  
	; pktno in the UPD is retrieved and used as InPtr for the circular list 

;       pop	es
	pop	edx
;	pop	ebx 
	; pass the InPtr to the caller  
	ret
getCurrentReceivePtr 	endp
;***********************************************************************
; upStall  statlls the upload  
; can be used for concurrentcy controlling as host and NIC both access the same list
; p.142 Command: upStall Value: 3000h
;***********************************************************************
upStall 	proc c public uses edx, IOBASE:DWORD 
	push 	edx 

	mov 	eax, IOBASE
	mov	dx, ax 
	add 	dx, 0eh
	mov	ax, Command_UpStall
	out 	dx, ax
	call	Wait_Command_Finish

	pop	edx 

	ret
upStall 	endp

;***********************************************************************
; upUnStall unstalls the upload 
; so that uploading continues now 
; p.142 Command: UpUnStall Value: 3001h
;***********************************************************************
upUnStall 	proc c public uses edx, IOBASE:DWORD 
	push 	edx 

	mov 	eax, IOBASE
	mov	dx, ax 
	add 	dx, 0eh
	mov	ax, Command_UpUnStall
	out 	dx, ax
	call	Wait_Command_Finish

	pop	edx 

	ret
upUnStall 	endp



end
