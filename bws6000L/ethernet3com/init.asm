	.386p
	.387
	.model flat,c

	include ethernetinc.inc

.CODE

;****************************************************************
;  all initialization of the NIC card is done in the following 
;   call 
;****************************************************************
initasm proc c public uses ebx ecx edx esi edi, IO_BASE:word, MAC:ptr byte
	;----------------------------------------
	; global reset 
	;  all bits are 0's 
	;;----------------------------------------
	pushad                  ; push all registers 

        mov ax, IO_BASE 	;go to default window 0 Command Register
 	mov dx, ax       	;and make global reset    
	add dx, 0eh
	xor ax, ax		;set GlobalReset value as 0
	out dx, ax	  	; read PIC1 mask, enable PIC2 bit and restore the mask
	CALL Wait_Command_Finish 

	; index is the index value in shared memory for a given variable 
	; eax has the data to be retunred 
	
	mov 	eax, 0
        in 	ax, dx 
	mov	ebx, 320	;print intStatus 
	int	0fdh 

  	; read PIC1 mask, enable PIC2 bit and restore the mask
        mov	ax, 021h ; PIC1 
	mov	dx, ax
	in	al, dx   ; read masks for PIC1
	;or	al, 09h  ; enable PIC2 
	mov al, 01h ;---------------------
	out	dx, al 
	mov	al, 0h
	in	al, dx   ; read it again 
	;mov 	ebx, 1120 


	; read PIC2 mask, disable real time clock interrupts and restore the mask
        mov	ax, 0a1h ; PIC2 
	mov	dx, ax
	in	al, dx   ; read masks for PIC2
	;or	al, 03h  ; disable real time clock interrupt bit 
	mov al, 01h ;--------------------
	;and	al, 0f3h ; enable IRQ11, IRQ10 
	out	dx, al 
	mov	al, 0
	in	al, dx   ; read it again  
	;mov 	ebx, 1140 	
	;int	0fdh

	;----------------------------------------
	; set indication enable 
	;  all bits are set to indicate that InStatus regiser bit can be set 
	;----------------------------------------
        mov ax, IO_BASE 	;go to default window 0 Command Register
 	mov dx, ax       	    
	add dx, 0eh
        mov ax, Command_SetIndicationEnable+7ffh  ; indicates sent or not   
	out dx, ax 
	CALL Wait_Command_Finish 

	mov ax, Command_SelectWindow + 5   ; move to window 5
	out dx, ax 
	CALL Wait_Command_Finish 

	sub dx, 2    ; IndicationEnable bit p.24
	mov ax, 0
	in ax, dx 

        mov ebx, 340  	;print window 5 IndicationEnable
        int 0fdh

	; ---------------------------------------
	; internal config register
	; setting xcvr bit
	; ---------------------------------------
;	mov 	ax, IO_BASE
;	mov 	dx, ax            
;	add 	dx, 0eh    
;	mov 	ax, Command_SelectWindow + 3  
;	out 	dx, ax 
;	CALL 	Wait_Command_Finish 
	
;	mov 	ax, IO_BASE
;	mov	dx, ax 
;	add 	dx, 0h
;	mov	eax, 01400000h
;	out  	dx, eax
;	CALL Wait_Command_Finish

	; ---------------------------------------
	; mac control register
	; setting fullDuplexEnable bit
	; ---------------------------------------
;	mov 	ax, IO_BASE
;	mov 	dx, ax            
;	add 	dx, 0eh    
;	mov 	ax, Command_SelectWindow + 3  
;	out 	dx, ax 
;	CALL 	Wait_Command_Finish 
	
;	mov 	ax, IO_BASE
;	mov	dx, ax 
;	add 	dx, 6h
;	mov	ax, 0020h
;	out  	dx, ax
;	CALL Wait_Command_Finish


	;----------------------------------------
	; reset receiver   
	;----------------------------------------
	mov 	ax, IO_BASE
	mov	dx, ax
	add	dx, 0eh
	mov	ax, Command_RXReset	;command Rx reset
	out 	dx, ax
	call	Wait_Command_Finish

	mov eax, 0
        in ax, dx 
        mov ebx, 360		;print InStatus we should be in window 5
        int 0fdh 

	;----------------------------------------
	; set RX filter   
	;----------------------------------------
	mov dx, IO_BASE		
	add dx, 0eh    
	; bit0 = receive individual
	; bit1 = receive multicast
	; bit2 = receive broadcast
	; bit3 = receive all frames
	; bit4 = receive multicast hash
	;mov ax, Command_SetRXFilter +01h  ;receieve only individual packets addressed to NIC p112 
	mov ax, Command_SetRXFilter +05h  ;receieve  individual and broadcast packets p112 

	out dx, ax
	call Wait_Command_Finish

	mov eax, 0
	mov dx, IO_BASE		
	add dx, 08h    
	in al, dx
	mov	ebx, 380	;display RxFilter 
	int	0fdh
	
	;----------------------------------------------
	;  Reset Transmitter
	;----------------------------------------------
	mov 	ax, IO_BASE
	mov	dx, ax 
	add	dx, 0eh
	mov	ax, Command_TXReset	;command tx reset
	out 	dx, ax
	call	Wait_Command_Finish

	;----------------------------------------------
	;  Set transmit threshold value p.139 
	;----------------------------------------------
  	mov eax, 0  ; will change the window to 0
        mov ax, IO_BASE
 	mov dx, ax            
	add dx, 0eh    
	mov ax, Command_SelectWindow + 0  
	out dx, ax 
	CALL Wait_Command_Finish 

	mov eax, 0
	mov dx, IO_BASE 
	add dx, 0eh
	;mov ax, Command_TxStartThresh ; 1001 1... .... .... 
	;out dx, ax
	;CALL Wait_Command_Finish
	
  	mov eax, 0  ; will change the window to 5
        mov ax, IO_BASE
 	mov dx, ax            
	add dx, 0eh    
	mov ax, Command_SelectWindow + 5
	out dx, ax 
	CALL Wait_Command_Finish 
	
	;mov eax, 0
	;mov dx, IO_BASE 
	;add dx, 0h   ; read TxStatThresh
	;in  ax, dx
	;mov ebx, 800 
	;int 0fdh

	mov	ax,Command_StatsEnable
	out	dx,ax
	call	Wait_Command_Finish

	mov eax, 0
	mov dx, IO_BASE		
	add dx, 0eh
	in  ax, dx
	mov	ebx, 400	; display instatus  
	int	0fdh

        mov eax, 0  ; will change the window to 3
        mov ax, IO_BASE
 	mov dx, ax            
	add dx, 0eh    
	mov ax, Command_SelectWindow + 3  
	out dx, ax 
	CALL Wait_Command_Finish 

       ;--------------------------------------------
       ; set the polling rate for transmitter 
       ; the NIC card will poll the DPD at this rate p.100 
       ; 320ns * 40H = 20480ns
       ; may need to change if required 
       ;--------------------------------------------
	mov	dx,IO_BASE	;DnPoll
	add	dx,2dh
	mov	al,7fh
	out	dx,al

	mov 	dx, IO_BASE		
	add     dx, 0ch         ; read TxFree
	mov     eax, 0
	in	ax,dx
	mov	ebx,420
	int	0fdh


	;-----------------------------------------
	; set InterruptEnable p.144 p.122 
	; 4 will enable txComplete  
	; currently all interrupts are disabled 
	;-----------------------------------------
	mov	dx,IO_BASE
	add	dx,0eh
	mov	ax,Command_SetIntMask+ 4h ; + 4 ;p.144 p.122 enable txcomplete int
	out	dx,ax
	call	Wait_Command_Finish

	;----------------------------------------------
	;read MAC address and store it in EO 
	; This code is same as 3c509 card except the IO_BASE 
	;we used the same code by using the new IO_BASE 
	; all comments are for the old driver code....
	;----------------------------------------------
        mov eax, 0  ; will change the window to 0
        mov ax, IO_BASE
 	mov dx, ax            
	add dx, 0eh    
	mov ax, Command_SelectWindow + 0  
	out dx, ax 
	CALL Wait_Command_Finish 

	mov	eax, MAC			
	mov	edi, eax
	
	mov	dx,IO_BASE
	call    Wait_EEPROM_Unbusy              ;1=EEPROM busy
	mov     dx, IO_BASE			;Mov IO_Base into da
	add     dx, 0ah                         ; See 7-21, window 0, offset 0ah. from IO_Base 
						; for the EPROM Command Register
	mov     al, 10b shl 6                   ;See 7-22, write the Read Register command.
	add     al, 00h                         ;See 7-, add the offset of 3Com Node Address.
	out     dx, al
	mov	dx,IO_BASE
	call    Wait_EEPROM_Unbusy              ;Read data can be read, after the EEPROM not busy
	
	mov     dx, IO_BASE 
	add     dx, 0ch				; This is the EPROM Data (5-1)
	in      ax, dx		
	mov	ss:[edi], ah                    ;byte 0
	mov	ss:[edi+1], al                  ; byte 1

						;Need to identify the addresses start read
						;from offset 0ah or 00h, you can first get this
						;ethernet card value from windows operating system
						;tools, or through 3c5x9cfg.exe, then compare.
						
	mov     dx, IO_BASE 
	add     dx, 0ah                         ;See 7-21.
	mov     al, 10b shl 6                   ;See 7-22.
	add     al, 01h                         ;See 7-25.
	out     dx, al
	mov	dx, IO_BASE
	call    Wait_EEPROM_Unbusy
	
	mov     dx, IO_BASE 
	add     dx, 0ch
	in      ax, dx
	mov	ss:[edi+2], ah                  ; byte 2 
	mov	ss:[edi+3], al                  ; byte 3

	mov     dx, IO_BASE 
	add     dx, 0ah                         ;See 7-21.
	mov     al, 10b shl 6                   ;See 7-22.
	add     al, 02h                         ;See 7-25.
	out     dx, al
	mov	dx, IO_BASE 
	call    Wait_EEPROM_Unbusy
	
	mov     dx, IO_BASE
	add     dx, 0ch
	in      ax, dx                          ;Save the third address into ax.
	mov	ss:[edi+4], ah                  ; byte 4 
	mov	ss:[edi+5], al		        ; byte 5	
	; 6 bytes are arranged as Byte 0 1 2 3 4 5 
	; example 00 0A 5E 56 61 D5 
	; but when you print 4 bytes and 2 bytes then it is 565E0A00    0000D561
	; after return the six bytes 0 1 2 3 4 5 are stored in array mac[6] in EO 
	; when you read mac read byte 0 1 2 3 4 5 in that order which is same as 
	; the way you see it in Ethereal tool 


	; ---------------------------------------
	; internal config register
	; setting xcvr bit
	; ---------------------------------------
;	mov 	ax, IO_BASE
;	mov 	dx, ax            
;	add 	dx, 0eh    
;	mov 	ax, Command_SelectWindow + 3  
;	out 	dx, ax 
;	CALL 	Wait_Command_Finish 
	
;	mov 	ax, IO_BASE
;	mov	dx, ax 
;	add 	dx, 0h
;	mov	eax, 01400000h
;	out  	dx, eax
;	CALL Wait_Command_Finish

	;----------------------------------------
	; reset receiver   
	;----------------------------------------
;	mov 	ax, IO_BASE
;	mov	dx, ax
;	add	dx, 0eh
;	mov	ax, Command_RXReset	;command Rx reset
;	out 	dx, ax
;	call	Wait_Command_Finish

	;----------------------------------------------
	;  Reset Transmitter
	;----------------------------------------------
;	mov 	ax, IO_BASE
;	mov	dx, ax 
;	add	dx, 0eh
;	mov	ax, Command_TXReset	;command tx reset
;	out 	dx, ax
;	call	Wait_Command_Finish	
	
;------------------------------------------------------------------
	push 	eax				;print MAC 4 bytes  
	mov 	eax, ss:[edi]			; get 4 bytes of MAC
	push    ebx                             ;print the IO_BASE 
	mov     ebx, 3902			; AE976000   0000DF21  
	int     0fdh                            ; MAC is 00|60|97|AE|DF|21
	pop     ebx                             ; 4 bytes from here and 2 bytes in the next print
	pop     eax 
;------------------------------------------------------------------
	push 	eax				;print MAC 2 bytes  
	mov	eax,0
	mov 	ah, ss:[edi+5]			; get 4 bytes of MAC
	mov 	al, ss:[edi+4]			; get 4 bytes of MAC
	push    ebx                             ;print the IO_BASE 
	mov     ebx, 3922 
	int     0fdh
	pop     ebx
	pop     eax 

	mov eax, 0
	mov dx, IO_BASE 
	add dx, 24h  ; DnLstPtr  
	in eax, dx 
	mov ebx, 440 
	int 0fdh
	
;------------------------------------------------------------------
	popad

        ret  
initasm endp

;***********************************************************************
; this is a routine which creates send and receive datastructure  
; The parameters passed are self explanatory 
;***********************************************************************

createDSasm proc c public uses ebx ecx edx esi edi, NoRcvBuf:DWORD, RcvStat:DWORD, UpLstPtr:DWORD, 
        RcvFragAddr:DWORD, RcvFragLen:DWORD, NoSndBuf:DWORD, SndStat:DWORD, DnLstPtr:DWORD,
	SndFragAddr:DWORD, SndFragLen:DWORD, IO_BASE:WORD

;**************************** sdp 08/05/05 *************************

	push	ebx
	push	ecx
	push	edx
	push	esi
	push	edi
	push	es

	mov	ax, MEMDataSel; This is a zero base selector to access shared memory between aoa and application
	mov	es, ax

	mov	esi, 0 ; esi = dpd counter
	mov	edi, 0 ; edi = dpd fragment counter

	mov	ecx, NoSndBuf
sndLoop:
	;------ DnLstPtr -----
	; this computes current dpd addresss and stores result in ebx
	mov	eax, esi
	mov	edx, SizeOfDpd
	mul 	edx
	add	eax, DnLstPtr
	mov	ebx, eax ; ebx contains current dpd address
	
	inc	esi ; dpd counter	

	; this checks for last dpd
	mov 	eax, 1
	cmp 	eax, ecx
	je	lastDpd

	;------ DnNextPtr ------
	; this computes next dpd addresss and stores result in eax
	mov	eax, esi
	mov	edx, SizeOfDpd 
	mul 	edx
	add	eax, DnLstPtr ; eax contains next dpd addresss
	mov	DWORD PTR es:[ebx], eax 
	jmp	notLastDpd

	; last dpd, so make nextptr = first dpd address, which is DnLstPtr
lastDpd:
	mov	eax, DnLstPtr
	mov	DWORD PTR es:[ebx], eax

notLastDpd:


	;------ SndStat ------
	add	ebx, 4
	mov	eax, SndStat
	sar	eax, 2
	push	ebx
	mov	ebx, esi 
	dec 	ebx
	or	al, bl
	sal	eax, 2	
	pop 	ebx
	mov	DWORD PTR es:[ebx], eax  
	
	;------ SndFragAddress ----
	add	ebx, 4
	mov	eax, edi
	mov	edx, SndFragLen
	and	edx, 1fffh ; bits 0-12 are length of fragment
	mul 	edx
	add	eax, SndFragAddr
	mov	DWORD PTR es:[ebx], eax 

	inc	edi ; dpd fragment counter
	
	;------ SndFragLen -----
	add	ebx, 4
	mov	eax, SndFragLen 
	mov	DWORD PTR es:[ebx], eax
	
	;------ PktId -------
	add	ebx, 4
	mov	eax, esi ; esi = dpd counter, but, pktid starts from 0, so we copy esi to eax and dec eax
	dec	eax
	mov	DWORD PTR es:[ebx], eax
	
	;************** place for adding code for prev ptr *******************
	; this checks for first dpd
	add	ebx, 4
	mov 	eax, NoSndBuf
	cmp 	eax, ecx
	je	firstDpd

	; not first dpd, 
	mov	eax, esi
	sub	eax, 2 ; from second dpd, normal address starts, but dpdCnt=2, so we subtract 2
		       ; address = DnLstPtr + (dpdCnt-2) * dpdInc
	mov	edx, SizeOfDpd 
	mul	edx
	add	eax, DnLstPtr
	mov	DWORD PTR es:[ebx], eax
	jmp	notFirstDpd

	; first dpd, so make nextptr = last dpd address, which is DnLstPtr + (NoSndBuf-1) * dpdInc 
firstDpd:
	mov	eax, NoSndBuf
	dec	eax
	mov	edx, SizeOfDpd 
	mul 	edx
	add	eax, DnLstPtr
	mov	DWORD PTR es:[ebx], eax
	
notFirstDpd:
	
	;************** place for adding code for prev ptr *******************

	;------ TxStatus is inserted by prcycle.asm OtherBegin73 procedure-------
	add	ebx, 4
	mov	eax, 0          
	mov	DWORD PTR es:[ebx], eax

	;------ SendFlag in DPD -------
	add	ebx, 4
	mov	eax, 0         
	mov	DWORD PTR es:[ebx], eax

	dec 	ecx

	mov	eax, ecx 
	cmp	eax, 0 
	jne	sndLoop

;-----------------------------------------------------------------------
	mov	esi, 0 ; esi = upd counter
	mov	edi, 0 ; edi = upd fragment counter

	mov	ecx, NoRcvBuf
rcvLoop:
	;------ UpLstPtr ------
	; this computes current upd addresss and stores result in ebx
	mov	eax, esi
	mov	edx, SizeOfUpd
	mul 	edx
	add	eax, UpLstPtr
	mov	ebx, eax ; ebx contains current upd address

	inc	esi ; upd counter

	; this checks for last upd
	mov 	eax, 1
	cmp 	eax, ecx
	je	lastUpd
	
	;------ UpNextPtr -----
	; this computes next upd addresss and stores result in eax
	mov	eax, esi
	mov	edx, SizeOfUpd
	mul 	edx
	add	eax, UpLstPtr ; eax contains next upd addresss
	mov	DWORD PTR es:[ebx], eax
	jmp	notLastUpd
	
	; last upd, so make nextptr = first upd address, which is UpLstPtr
lastUpd:
	mov	eax, UpLstPtr
	mov	DWORD PTR es:[ebx], eax

notLastUpd:
	
	;------ RcvStat ----
	add	ebx, 4
	mov	eax, RcvStat
	mov	DWORD PTR es:[ebx], eax

	;------ RcvFragAddress ----
	add	ebx,4
	mov	eax, edi 
	mov	edx, RcvFragLen
	and	edx, 1fffh ; bits 0-12 are length of fragment
	mul 	edx
	add	eax, RcvFragAddr
	mov	DWORD PTR es:[ebx], eax
	
	inc	edi ; upd fragment counter
	
	;------ RcvFragLen -------
	add	ebx, 4
	mov	eax, RcvFragLen          
	mov	DWORD PTR es:[ebx], eax

	;------ PktId -------
	add	ebx, 4
	mov	eax, esi ; esi = upd counter, but, pktid starts from 0, so we copy esi to eax and dec eax
	dec	eax
	mov	DWORD PTR es:[ebx], eax

	;------ LastButTwoEntry in UPD (Not used)-------
	add	ebx, 4
	mov	eax, 0         
	mov	DWORD PTR es:[ebx], eax
	
	;------ LastButOneEntry in UPD (Not used)-------
	add	ebx, 4
	mov	eax, 0         
	mov	DWORD PTR es:[ebx], eax
	
	;------ LastEntry in UPD (Not used)-------
	add	ebx, 4
	mov	eax, 0         
	mov	DWORD PTR es:[ebx], eax

	dec 	ecx
	mov	eax, ecx 
	cmp	eax, 0 
	jne	rcvLoop
	;----------------------------------------
	; set the UpLstPtr here after creating the data structure  
	;  however, receiver is not yet enabled 
	; it will be enabled through C++ applications 
	;----------------------------------------
	mov	dx,IO_BASE ; initialize UpLstPtr 
	add	dx,38h
	mov	eax, UpLstPtr  
	out	dx,eax     ; store Up List ptr in the card 

	;----- DnNextPtr0 = 0 ----------
	; code for making first dpd's DnNextPtr=0
	mov	eax, 0
	mov	ebx, DnLstPtr 
	mov	DWORD PTR es:[ebx], eax 

	; --- for making first DPD length = 512 bytes ---
	; --- because it is a dummy packet ---
	mov 	eax, 80000200h
	mov 	ebx, DnLstPtr
	add	ebx, 12
	mov	DWORD PTR es:[ebx], eax

	pop 	es
	pop	edi
	pop	esi
	pop	edx
	pop	ecx
	pop	ebx
	ret

createDSasm endp
end
