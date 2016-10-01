
	.386p
	.387
	.model flat,c

	include ethernetinc.inc

.CODE

;***********************************************************************
; enable transmitter 
; receives IOBASE and DPDPTR i.e.  0dc80, 0220bf40
; When the transmitter is enabled by DnLstPtr, it will transmit the first packet and then wait 
;  as the first DPD has 0 link initialized during the creation of the datastructure 
; After the first packet is transmitted, then our algorithm will set up links 
; to transmit subsequent packets 
; After each packet transmission, it requires some delay to get transmittion going 
;  if there is no delay in between packets, packets will be lost 
; Determining the exact delay is not possible....
; Trial and error may be the only way at this point 
; Once the first packet is transmitted, the transmitter is now ready 
;  transmit subsequent packets when a new link is created 
;***********************************************************************
enableTransmit 	proc c public uses ebx edx, IOBASE:DWORD, dpdptr:DWORD
	push 	ecx 
	push 	edx 
	push	esi
	push	edi
	push	es

	mov	ax, MEMDataSel 
	mov	es, ax 

	mov 	edx, IOBASE
	add	dx,0eh
	mov	ax, Command_TXEnable	;command tx enalbe
	out 	dx, ax
	call	Wait_Command_Finish

	mov 	eax, dpdptr 
	add	eax, 32               ; next pointer will be 32 bytes away, that is DPD1 
	mov	edi, eax              ; initialize edi for pointer 

	call	delayTX1              ;gives a chance for the transmitter to poll this needed!!! 

	mov	edx,IOBASE            ;	initialize DnLstPtr, now Transmitter is going......... 
	add	dx,24h
	mov	eax,dpdptr            ; first DPD0
	out	dx,eax

	pop	es
	pop	edi
	pop	esi
	pop	edx
	pop	ecx 

	ret
enableTransmit 	endp

;=================================================================================      
;  send a single packet 
; pass dpdptr and base 
;=================================================================================      
sendPacket	proc c public uses ebx edx, IOBASE:DWORD, dpdptr:DWORD, sendDelay:DWORD
	push	ebx 
	push	edx
	push	edi
	push	es

	mov	ax, MEMDataSel 
	mov	es, ax 
	
	mov	edi, dpdptr			; DPD pointer 
	
	mov	edx,edi				;edx current ptr
	mov	eax,DWORD PTR es:[edi]		;
	mov	edi,eax				;edi next ptr
	
	mov	eax,0				
	mov	DWORD PTR es:[edx],eax		;current next ptr 0
	mov	ebx,DWORD PTR es:[edx+14h]	;edx+14h to ebx current pre ptr

	mov	eax,edx
	mov	DWORD PTR es:[ebx],eax		;put in current pre next ptr

	mov 	eax, 0
	
	pop	es
	pop	edi
	pop	edx
	pop	ebx
	ret
sendPacket	endp

;=================================================================================      
;  send n packets  
; pass dpdptr and base 
;=================================================================================      
sendPacketN	proc c public uses ebx edx, IOBASE:DWORD, dpdptr:DWORD
	push	ebx 
	push	edx
	push	edi
	push	es

	mov	ax, MEMDataSel 
	mov	es, ax 
	
	mov	edi, dpdptr			; DPD pointer 
	
	mov	edx,edi				;edx current ptr
	mov	eax,DWORD PTR es:[edi]		;
	mov	edi,eax				;edi next ptr
	
	mov	eax,0				
;	mov	DWORD PTR es:[edx],eax		;current next ptr 0
	mov	ebx,DWORD PTR es:[edx+14h]	;edx+14h to ebx current pre ptr

	mov	eax,edx
	mov	DWORD PTR es:[ebx],eax		;put in current pre next ptr

	mov 	eax, 0
	
	pop	es
	pop	edi
	pop	edx
	pop	ebx
	ret
sendPacketN	endp

;***********************************************************************
; disable transmitter 
;***********************************************************************
disableTransmit 	proc c public uses edx, IOBASE:DWORD 
	push 	edx 

	mov 	eax, IOBASE
	mov	dx, ax 
	add 	dx, 0eh
	mov	ax, Command_TXDisable	;command tx disable  
	out 	dx, ax
	call	Wait_Command_Finish

	pop	edx 

	ret
disableTransmit 	endp
;***********************************************************************
; get the current send Ptr like OutPtr in a circular list 
;  this is similar to receive where it is an InPtr
;***********************************************************************
getCurrentSendPtr 	proc c public uses edx, IOBASE:WORD  
	push 	edx 
        
	mov 	ax, IOBASE
 	mov 	dx, ax            
	add 	dx, 24h      ;DnListPtr stored in the card  
	in  	eax, dx  
        
	pop	edx 
	; pass the OutPtr caller  
	ret
getCurrentSendPtr 	endp

;***********************************************************************
; get tx status
;***********************************************************************
getTransmitStatus 	proc c public uses edx, IOBASE:DWORD 
	push 	edx 

	mov 	eax, IOBASE
	mov	dx, ax 
	add 	dx, 1bh
	mov	eax, 0
	in	al, dx
	
	pop	edx 

	ret
getTransmitStatus 	endp
;***********************************************************************
; get tx packet id  
;***********************************************************************
getTransmitPacketId 	proc c public uses edx, IOBASE:DWORD 
	push 	edx 

	mov 	eax, IOBASE
	mov	dx, ax 
	add 	dx, 18h
	mov	eax, 0
	in	al, dx
	
	pop	edx 

	ret
getTransmitPacketId 	endp
;***********************************************************************
; get int status
;***********************************************************************
getIntStatus 	proc c public uses edx, IOBASE:DWORD 
	push 	edx 

	mov 	eax, IOBASE
	mov	dx, ax 
	add 	dx, 0eh
	in	ax, dx
	
	pop	edx 

	ret
getIntStatus 	endp
;***********************************************************************
; get tx free
; p.101 Register: TxFree Window: 3 Offset: c Size: 16 bits
;***********************************************************************
getTransmitFree 	proc c public uses edx, IOBASE:DWORD 
	push 	edx 

      	mov eax, 0  ;
        mov eax, IOBASE
 	mov dx, ax            
	add dx, 0eh    
	mov ax, Command_SelectWindow + 3  
	out dx, ax 
	CALL Wait_Command_Finish 

	mov 	eax, IOBASE
	mov	dx, ax 
	add 	dx, 0ch
	in	ax, dx

	pop	edx 

	ret
getTransmitFree 	endp
;***********************************************************************
; get media status
; p.182 Register: MediaStatus Window: 4 Offset: a Size: 16 bits
;***********************************************************************
getMediaStatus 	proc c public uses edx, IOBASE:DWORD 
	push 	edx 

      	mov eax, 0  ; will change the window to 4
        mov eax, IOBASE
 	mov dx, ax            
	add dx, 0eh    
	mov ax, Command_SelectWindow + 4  
	out dx, ax 
	CALL Wait_Command_Finish 

	mov 	eax, IOBASE
	mov	dx, ax 
	add 	dx, 0ah
	in	ax, dx

	pop	edx 

	ret
getMediaStatus 	endp
;***********************************************************************
; get fifo diagnostics
; p.1778 Register: FifoDiagnostic Window: 4 Offset: 4 Size: 16 bits
;***********************************************************************
getFifoDiag	proc c public uses edx, IOBASE:DWORD 
	push 	edx 

      	mov eax, 0  ;
        mov eax, IOBASE
 	mov dx, ax            
	add dx, 0eh    
	mov ax, Command_SelectWindow + 4  
	out dx, ax 
	CALL Wait_Command_Finish 

	mov 	eax, IOBASE
	mov	dx, ax 
	add 	dx, 4h
	in	ax, dx

	pop	edx 

	ret
getFifoDiag 	endp
;***********************************************************************
; dnStall  statlls the download  
; can be used for concurrentcy control as host and NIC both access list
; p.138 Command: DnStall Value: 3002h
;***********************************************************************
dnStall 	proc c public uses edx, IOBASE:DWORD 
	push 	edx 

	mov 	eax, IOBASE
	mov	dx, ax 
	add 	dx, 0eh
	mov	ax, Command_DnStall
	out 	dx, ax

	call	Wait_Command_Finish

	pop	edx 

	ret
dnStall 	endp

;***********************************************************************
; dnUnStall unstalls the download 
; so that downloading continues now 
; p.138 Command: DnUnStall Value: 3003h
;***********************************************************************
dnUnStall 	proc c public uses edx, IOBASE:DWORD 
	push 	edx 

	mov 	eax, IOBASE
	mov	dx, ax 
	add 	dx, 0eh
	mov	ax, Command_DnUnStall
	out 	dx, ax

	;call	Wait_Command_Finish not needed 

	pop	edx 

	ret
dnUnStall 	endp

;***********************************************************************
; setDnLstPtr set the down list ptr
;***********************************************************************
setDnLstPtr 	proc c public uses edx, IOBASE:DWORD , DnLstPtr:DWORD
	push 	edx 

	mov 	eax, IOBASE
	mov	dx, ax 
	add 	dx, 24h
	mov	eax, DnLstPtr
	out 	dx, eax
	call	Wait_Command_Finish

	pop	edx 

	ret
setDnLstPtr	endp

;***********************************************************************
; acknowledge interrupt
; ; p.138 Command: DnUnStall Value: 3003h
;***********************************************************************
ackNICInt 	proc c public uses ebx edx, IOBASE:DWORD, NUM:DWORD 
	push    ebx
	push 	edx 

	mov eax, 0  ;
        mov eax, IOBASE
 	mov dx, ax            
	add dx, 0eh    
	mov ax, Command_SelectWindow + 6  
	out dx, ax 
	CALL Wait_Command_Finish 

	mov 	eax, IOBASE
	mov	dx, ax 
	add 	dx, 6h ; FramesXmittedOk
	in	ax, dx

	mov	ebx, 3120
	int	0fdh
	
	mov 	eax, IOBASE
	mov	dx, ax 
	add 	dx, 1bh; write to TxStatus 
	in	ax, dx
	out 	dx, ax

	mov 	eax, IOBASE
	mov	dx, ax 
	add 	dx, 0eh
	mov	ax, Command_AckInt+ 7ffh; acknowledge all interrupts
	out 	dx, ax

	mov	ax, 0a0h  ;ack PIC 2
	mov	dx, ax
	mov	al, 020h
	out	dx, al
	mov	ax, 020h  ;ack PIC 1
	mov	dx, ax
	mov	al, 020h
	out	dx, al
	mov ecx, 100000

	loop123: 
	    nop
	loop 	loop123 

        mov 	eax, IOBASE
 	mov 	dx, ax            
	add 	dx, 24h      ;DnListPtr stored in the card  
	in  	eax, dx  

	;mov	ebx, 3140
	;int	0fdh

	pop	edx 
	pop	ebx

	ret
ackNICInt 	endp
;***********************************************************************
; stop transmit at 
;***********************************************************************
stopTransmitAt 	proc c public uses ebx ecx, aptr:DWORD, DnLstPtr:DWORD 
	push	ebx
	push	ecx
	push	es

	mov	ax, MEMDataSel
	mov	es, ax

	mov	ebx, DnLstPtr
	mov	eax, 32
	mov	ecx, aptr
	mul	ecx
	add	ebx, eax
	mov	eax, 0
	mov	DWORD PTR es:[ebx], eax
	
	pop	es
	pop	ecx
	pop	ebx 

	ret
stopTransmitAt	endp

;=================================================================================      
delayTX1 proc uses ecx 
	push 	ecx 
	mov 	ecx, 2400000000
	loopdelayTX1: 
		NOP
	loop loopdelayTX1
	pop ecx 
	ret
delayTX1 endp
;=================================================================================      
printstuff proc uses ebx 
	push ebx 
	push edx
	push es
	
      	mov ebx, 0220bf40h
	mov eax, DWORD PTR es:[ebx]
	mov ebx, 2240 
	int 0fdh 
        mov ebx, 0220bf60h
	mov eax, DWORD PTR es:[ebx]
	mov ebx, 2260 
	int 0fdh 
        mov ebx, 0220bf80h
	mov eax, DWORD PTR es:[ebx]
	mov ebx, 2280 
	int 0fdh 
        mov ebx, 0220bfa0h
	mov eax, DWORD PTR es:[ebx]
	mov ebx, 2300
	int 0fdh 

        mov ebx, 0220bf44h
	mov eax, DWORD PTR es:[ebx]
	mov ebx, 2400 
	int 0fdh 
        mov ebx, 0220bf64h
	mov eax, DWORD PTR es:[ebx]
	mov ebx, 2420 
	int 0fdh 
        mov ebx, 0220bf84h
	mov eax, DWORD PTR es:[ebx]
	mov ebx, 2440 
	int 0fdh 
        mov ebx, 0220bfa4h
	mov eax, DWORD PTR es:[ebx]
	mov ebx, 2460
	int 0fdh 

	mov	edx, 0dc80h 
	add	edx, 24h
	in	eax,dx  ; DnLstPtr
	mov	ebx,2480
	int	0fdh   

	pop es
	pop edx
	pop ebx 
	ret
printstuff endp
;=================================================================================      
;***********************************************************************
; get internal config register for full duplex mode  
;***********************************************************************
getInternalConfig 	proc c public uses edx, IOBASE:DWORD 
	push 	edx 

	mov 	eax, IOBASE
 	mov 	dx, ax            
	add 	dx, 0eh    
	mov 	ax, Command_SelectWindow + 3  
	out 	dx, ax 
	CALL 	Wait_Command_Finish 
	
	mov 	eax, IOBASE
	mov	dx, ax 
	add 	dx, 0h
	in  	eax, dx

	pop	edx 

	ret
getInternalConfig 	endp

;***********************************************************************
; get mac control register for full duplex mode  
;***********************************************************************
getMacControl 	proc c public uses edx, IOBASE:DWORD 
	push 	edx 

	mov 	eax, IOBASE
 	mov 	dx, ax            
	add 	dx, 0eh    
	mov 	ax, Command_SelectWindow + 3  
	out 	dx, ax 
	CALL 	Wait_Command_Finish 
	
	mov 	eax, IOBASE
	mov	dx, ax 
	add 	dx, 6h
	in  	eax, dx

	pop	edx 

	ret
getMacControl 	endp

;***********************************************************************
; get media options  
;***********************************************************************
getMediaOptions 	proc c public uses edx, IOBASE:DWORD 
	push 	edx 

	mov 	eax, IOBASE
 	mov 	dx, ax            
	add 	dx, 0eh    
	mov 	ax, Command_SelectWindow + 3  
	out 	dx, ax 
	CALL 	Wait_Command_Finish 
	
	mov 	eax, IOBASE
	mov	dx, ax 
	add 	dx, 8h
	in  	eax, dx

	pop	edx 

	ret
getMediaOptions endp

;***********************************************************************
; get configuration data for given configuration address  
;***********************************************************************
getConfigData 	proc c public uses edx, IOBASE:DWORD, ADDRESS:DWORD 
	push 	edx 

	mov 	eax, IOBASE
 	mov 	dx, ax            
	add 	dx, 44h  
	mov	eax, ADDRESS 
	out 	dx, ax 
	CALL 	Wait_Command_Finish 
	
	mov 	eax, IOBASE
	mov	dx, ax 
	add 	dx, 48h
	in  	eax, dx

	pop	edx 

	ret
getConfigData endp

;***********************************************************************
; get network diagnostic  
;***********************************************************************
getNetworkDiag 	proc c public uses edx, IOBASE:DWORD 
	push 	edx 

	mov 	eax, IOBASE
 	mov 	dx, ax            
	add 	dx, 0eh    
	mov 	ax, Command_SelectWindow + 4  
	out 	dx, ax 
	CALL 	Wait_Command_Finish 
	
	mov 	eax, IOBASE
	mov	dx, ax 
	add 	dx, 6h 
	in  	ax, dx

	pop	edx 

	ret
getNetworkDiag endp

;***********************************************************************
; reset transmitter
;***********************************************************************
resetTransmitter	proc c public uses edx, IOBASE:DWORD 
	push 	edx 

	mov 	eax, IOBASE
 	mov 	dx, ax            
	add 	dx, 0eh    
	mov 	ax, Command_TXReset  
	out 	dx, ax 
	CALL 	Wait_Command_Finish 
	
	pop	edx 

	ret
resetTransmitter endp

end
