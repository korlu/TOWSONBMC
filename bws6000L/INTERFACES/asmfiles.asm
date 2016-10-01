
;***************************************************
		;testasm32.asm  trace code x119
;***************************************************
		
;===============-=====================================================
;this assembly function can be called from C 
;32 bit model and C type call settings 
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

	include ..\aoainc.inc
	include ..\sharmem.inc

;===================================================================

.CODE
testasm32 PROC C public uses es ebx, Delay:DWORD
	push	ebx
	push	eax
	push	edx
	
	mov	eax, Processor_Speed
	mov	ebx, 1120
	int	0fdh

	mov	edx, Delay
	mul	edx
	mov	ebx, 1160
	int 	0fdh

	mov	ecx, NoOfCycles_Delay
	div	ecx; The result of div is in eax	
	mov	ebx, 1140
	int	0fdh	
	
	mov	ecx, eax

DELAYLOOP:
	loop	DELAYLOOP
	pop	edx
	pop	eax
	pop	ebx

        ;--------trace Code----------------------
	push	es
	push	ebx
	push	eax

	mov	ax, MEMDataSel
	mov	es, ax
	mov	ebx, S_Base
	add	ebx, S_Error_Flag
	mov	eax, DWORD PTR es:[ebx] ;get error flag
	cmp	eax, 0			; check if flag is zero 
	jnz	skipupdate
	mov	eax, 0119h
	mov	ebx, S_Base
	add	ebx, S_IO_Function_Code
	mov	DWORD PTR es:[ebx], eax

        skipupdate:
	pop	eax
	pop	ebx
	pop	es
	;--------end trace code------------------
	ret

testasm32 ENDP 	

cliasm32 PROC C  
	cli	;clear interrupts
	mov eax,0

	ret
cliasm32 ENDP 	


;to enable an interrupt you should have a 0 bit in the position 
;  for example 1111 0111 will enable the 0th bit 
; AND operation 
enableIRQCntlrasm32 PROC C public uses es ebx, port:WORD, msk:WORD
	push	ebx
	push	eax
	push	edx
	mov	ax, port
	mov	dx, ax
	in	al, dx
	and	ax, msk
	out	dx, al
	pop	edx
	pop	eax
	pop	ebx

       ;--------trace Code----------------------
	push	es
	push	ebx
	push	eax

	mov	ax, MEMDataSel
	mov	es, ax
	mov	ebx, S_Base
	add	ebx, S_Error_Flag
	mov	eax, DWORD PTR es:[ebx] ;get error flag
	cmp	eax, 0			; check if flag is zero 
	jnz	skipupdate
	mov	eax, 0138h
	mov	ebx, S_Base
	add	ebx, S_IO_Function_Code
	mov	DWORD PTR es:[ebx], eax

        skipupdate:
	pop	eax
	pop	ebx
	pop	es
	;--------end trace code------------------

	ret
enableIRQCntlrasm32 ENDP 	

;to disable an interrupt you should have a 1 bit in the position 
;  for example 0000 1000 will disable the 1th bit 
;  OR operatin 
disableIRQCntlrasm32 PROC C public uses es ebx, port:WORD, msk:WORD
	push	ebx
	push	eax
	push	edx
	mov	ax, port
	mov	dx, ax
	in	al, dx
	or	ax, msk
	out	dx, al
	pop	edx
	pop	eax
	pop	ebx
	
       ;--------trace Code----------------------
	push	es
	push	ebx
	push	eax

	mov	ax, MEMDataSel
	mov	es, ax
	mov	ebx, S_Base
	add	ebx, S_Error_Flag
	mov	eax, DWORD PTR es:[ebx] ;get error flag
	cmp	eax, 0			; check if flag is zero 
	jnz	skipupdate
	mov	eax, 0139h
	mov	ebx, S_Base
	add	ebx, S_IO_Function_Code
	mov	DWORD PTR es:[ebx], eax

        skipupdate:
	pop	eax
	pop	ebx
	pop	es
	;--------end trace code------------------

	ret
disableIRQCntlrasm32 ENDP 	

ackPICCntlrasm32 PROC C public uses es ebx, port:WORD, msk:WORD
	push	ebx
	push	eax
	push	edx
	mov	ax, port
	mov	dx, ax
	out	dx, al ;acknowledge all interrupts, msk is not used 
	pop	edx
	pop	eax
	pop	ebx

	;--------trace Code----------------------
	push	es
	push	ebx
	push	eax

	mov	ax, MEMDataSel
	mov	es, ax
	mov	ebx, S_Base
	add	ebx, S_Error_Flag
	mov	eax, DWORD PTR es:[ebx] ;get error flag
	cmp	eax, 0			; check if flag is zero 
	jnz	skipupdate
	mov	eax, 0140h
	mov	ebx, S_Base
	add	ebx, S_IO_Function_Code
	mov	DWORD PTR es:[ebx], eax

        skipupdate:
	pop	eax
	pop	ebx
	pop	es
	;--------end trace code------------------

	ret
ackPICCntlrasm32 ENDP 	
;--------------------------------------------------------------------
;read interrupt chip status 
readintstatusregisterasm32 PROC C public uses edx, port:WORD

       push edx 

	mov 	eax, 0
	mov	ax, port
	mov	dx, ax
	in	al, dx   ;read status from chip with port address 1, 2 

       pop	edx
        ; return1 value in eax 
	ret

readintstatusregisterasm32 ENDP 	
;----------------------------------------------------------------
; read real time clock 
; uses the same mechanism as the read floppy one sector 
; uses a S_RTCFLAG as a flag to indicate that it is a RTC command 
;----------------------------------------------------------------
readrtcasm32 PROC C public uses eax ebx ecx

	int	0fah        ; read real time clock 

	push	es
	push	ebx

	mov	ax, MEMDataSel
	mov	es, ax
	mov	ebx, S_Base
	add	ebx, S_RTC
	mov	eax, DWORD PTR es:[ebx] ;get the value 

    pop ebx
    pop es
 
	ret
readrtcasm32 ENDP 	
;----------------------------------------------------------------
; read date
; uses the same mechanism as the read floppy one sector 
; uses a S_RTCFLAG as a flag to indicate that it is a date command 
;----------------------------------------------------------------
readdateasm32 PROC C public uses eax ebx ecx

	int	0fah        ; read date 

	push	es
	push	ebx

	mov	ax, MEMDataSel
	mov	es, ax
	mov	ebx, S_Base
	add	ebx, S_DATE
	mov	eax, DWORD PTR es:[ebx] ;get the value 

    pop ebx
    pop es
 
	ret
readdateasm32 ENDP 	
;--------------------------------------------------------------------
;read interrupt chip mask register 
readintmaskregisterasm32 PROC C public uses edx, port:WORD

       push edx 

	mov 	eax, 0
	mov	ax, port
	mov	dx, ax
	in	al, dx   ;read mask register 

       pop	edx
        ; return1 value in eax 
	ret

readintmaskregisterasm32 ENDP 	


;--------------------------------------------------------------------

inttimerasm32 PROC C

        ;--------trace Code----------------------
	push	es
	push	ebx
	push	eax

	mov	ax, MEMDataSel
	mov	es, ax
	mov	ebx, S_Base
	add	ebx, S_Error_Flag
	mov	eax, DWORD PTR es:[ebx] ;get error flag
	cmp	eax, 0			; check if flag is zero 
	jnz	skipupdate
	mov	eax, 0131h
	mov	ebx, S_Base
	add	ebx, S_IO_Function_Code
	mov	DWORD PTR es:[ebx], eax

        skipupdate:
	pop	eax
	pop	ebx
	pop	es
	;--------end trace code------------------

	int 08h 	; call timer interrupt 
	ret
inttimerasm32 ENDP 	

stiasm32 PROC C public uses ebx  

	mov	ax, MEMDataSel; This is a zero base selector to access shared memory between aoa and application
	mov	es, ax
	mov	ebx, S_Base
	add	ebx, S_ISRSTIFlag  ; ISRFlag  
	mov	eax, DWORD PTR es:[ebx]  ; get the flag value 
	cmp	eax, 1   ; is it set? 
	jz	itisset 
	;yes it is not set, you can do sti   
	sti
        itisset:
	ret

stiasm32 ENDP 	

cliTimerasm32 PROC C public 
	push	edx
	push	eax
	mov	dx,21h ; disable timer interrupt 
	mov	al,01h	
	out	dx,al
	pop	eax
	pop	edx
	ret
cliTimerasm32 ENDP 	

getstrasm32 PROC C public uses ecx ebx edi,buffer:ptr byte

	xor	ecx, ecx
	mov	eax, buffer
	mov	edi, eax

GetChar:
	int	0f5h ; get a character from keyboard
	
	cmp	al, 0dh
	je	Exit

	mov	byte ptr ss:[edi],al

	inc	ecx
	inc	edi

	jmp	GetChar
Exit:
	mov	eax, ecx

        ;--------trace Code----------------------
	push	es
	push	ebx
	push	eax

	mov	ax, MEMDataSel
	mov	es, ax
	mov	ebx, S_Base
	add	ebx, S_Error_Flag
	mov	eax, DWORD PTR es:[ebx] ;get error flag
	cmp	eax, 0			; check if flag is zero 
	jnz	skipupdate
	mov	eax, 0100h
	mov	ebx, S_Base
	add	ebx, S_IO_Function_Code
	mov	DWORD PTR es:[ebx], eax

        skipupdate:
	pop	eax
	pop	ebx
	pop	es
	;--------end trace code------------------

	ret
getstrasm32 ENDP 	

getcursorasm32 PROC C public

		;int	0f2h not used any more 
		push	edx
		push	ebx
		
		xor	eax, eax
		mov	dx, 3d4h
		mov	al, 0fh
		out	dx, al
		mov	dx, 3d5h
		in	al, dx	
		mov	bl, al

		mov	dx, 3d4h
		mov	al, 0eh
		out	dx, al
		mov	dx, 3d5h
		in	al, dx
		mov	ah, al
		mov	al, bl

		pop	ebx
		pop	edx

	ret
getcursorasm32 ENDP 	

gettimerasm32 PROC C public uses ebx es
	mov	ax, MEMDataSel; This is a zero base selector to access shared memory between aoa and application
	mov	es, ax
	mov	ebx, S_Base
	add	ebx, S_Timer
	mov	eax, DWORD PTR es:[ebx]
        ;--------trace Code----------------------
	push	es
	push	ebx
	push	eax

	mov	ax, MEMDataSel
	mov	es, ax
	mov	ebx, S_Base
	add	ebx, S_Error_Flag
	mov	eax, DWORD PTR es:[ebx] ;get error flag
	cmp	eax, 0			; check if flag is zero 
	jnz	skipupdate
	mov	eax, 0106h
	mov	ebx, S_Base
	add	ebx, S_IO_Function_Code
	mov	DWORD PTR es:[ebx], eax

        skipupdate:
	pop	eax
	pop	ebx
	pop	es
	;--------end trace code------------------

	ret
gettimerasm32 ENDP 	

setcursorasm32 PROC C public uses edx , pos:dword

		;int	0f3h not used any more 
		push	edx
		push	ebx
		
		mov	eax, pos

		mov	ebx, eax
		mov	dx, 3d4h
		mov	al, 0fh
		out	dx, al 
		mov	dx, 3d5h
		mov	al, bl
		out	dx, al
		
		mov	dx, 3d4h
		mov	al, 0eh
		out	dx, al 
		mov	dx, 3d5h
		mov	al, bh
		out	dx, al

		pop	ebx
		pop	edx
		ret

setcursorasm32 ENDP 	

scrollasm32 PROC C public

	int	0f0h
    ;--------trace Code----------------------
	push	es
	push	ebx
	push	eax

	mov	ax, MEMDataSel
	mov	es, ax
	mov	ebx, S_Base
	add	ebx, S_Error_Flag
	mov	eax, DWORD PTR es:[ebx] ;get error flag
	cmp	eax, 0			; check if flag is zero 
	jnz	skipupdate
	mov	eax, 0109h
	mov	ebx, S_Base
	add	ebx, S_IO_Function_Code
	mov	DWORD PTR es:[ebx], eax

        skipupdate:
	pop	eax
	pop	ebx
	pop	es
	;--------end trace code------------------

	ret
scrollasm32 ENDP 	

printcharasm32 PROC C public uses ebx, value: byte, pos: dword
	cli
	push	ebx
	push	es

	mov	ebx, pos
	mov	al, value
	;int	0f7h
	;-----------------------------------------
	; replace f7 interrupt in prcycle with this code 
	;  this is same code as in prcycle, however, it needs Video_Sel 
		mov     ax, Video_Sel_Loc ; Video_Sel selector watch for changes in prcycle 
		mov     es, ax
		mov	al, value 
		;mov     ah,17h
		;mov	ah, 7 
		mov	ah, 1fh 
        mov     WORD PTR es:[ebx], ax
	;-----------------------------------------
	pop	es
	pop	ebx
	sti
	ret
printcharasm32 ENDP 	

clearntflagasm32 PROC C public uses eax ebx
		push	edx
		pushfd ; turn off NT flag in the CPU not in the TSS
		; so that CPU will return to its application during IRETD not to 
		;  exit from the task using link field in the TSS 
		pop	edx;
		AND	edx, 0FFFFBFFFh
		push	edx
		popfd
		pop	edx

		ret
clearntflagasm32 ENDP 	

printflagsasm32 PROC C public uses eax ebx , base:dword
	mov	ebx, base
	pushfd      ; push 32 bit flags onto stack 
	pop	eax
	int 	0fdh
        ;--------trace Code----------------------
	push	es
	push	ebx
	push	eax

	mov	ax, MEMDataSel
	mov	es, ax
	mov	ebx, S_Base
	add	ebx, S_Error_Flag
	mov	eax, DWORD PTR es:[ebx] ;get error flag
	cmp	eax, 0			; check if flag is zero 
	jnz	skipupdate
	mov	eax, 0114h
	mov	ebx, S_Base
	add	ebx, S_IO_Function_Code
	mov	DWORD PTR es:[ebx], eax

        skipupdate:
	pop	eax
	pop	ebx
	pop	es
	;--------end trace code------------------
	ret
printflagsasm32 ENDP 	

resetlockasm32 PROC C public uses ebx edx es, shlock: dword, tid: dword 
        cli                   ; disable interrupts 
	push	es
	push	ebx
	push	edx

	mov	ax, MEMDataSel; This is a zero base selector to access shared memory between aoa and application
	mov	es, ax
	mov	ebx, S_Base
	add	ebx, S_Lock1  ; base location of locks 
	add	ebx, shlock    ; lock number 
	mov	eax, DWORD PTR es:[ebx]  ; get the lock value 
	cmp	eax, 1   ; is it locked? 
	jnz	itisnotlocked 
	; yes,it is locked  
	mov	edx, ebx ; save the pointer 
	mov	ebx, S_Base 
	add	ebx, S_TID1   ; base of TID
	add	ebx, shlock   ; index of TID 
	mov	eax, DWORD PTR es:[ebx]  ; get the TID stored during the set
	cmp	eax, tid                 ; compare the TID 
	jnz     itisnotlocked            ; locked by a wrong thread 
	mov	ebx, edx                 ; get the pointer 
	mov	DWORD PTR es:[ebx], 0 ; reset the lock 
	itisnotlocked: 
	; it will return 1 if it is locked 
	; it will return 0 if it was not locked which is an error 

	; index is the index value in shared memory for a given variable 
	; eax has the data to be retunred 

	pop	edx
	pop	ebx
	pop	es
        sti   ; enable interrupts 
	ret
resetlockasm32 ENDP 	

testandsetasm32 PROC C public uses ebx es, shlock: dword, tid: dword 
	cli		
	push	es
	push	ebx

	mov	ax, MEMDataSel; This is a zero base selector to access shared memory between aoa and application
	mov	es, ax
	mov	ebx, S_Base
	add	ebx, S_Lock1  ; base location of locks 
	add	ebx, shlock    ; lock index 
	mov	eax, DWORD PTR es:[ebx]  ; get the lock value 
	cmp	eax, 0   ; is it zero 
	jnz	itislocked 
	mov 	eax, 1   ; set lock 
	mov	DWORD PTR es:[ebx], eax  ;save the lock 
	mov     ebx, S_Base 
	add 	ebx, S_TID1              ; base location of TID
	add 	ebx, shlock              ; lock index  
	mov	eax, tid
	mov	DWORD PTR es:[ebx], eax  ;save the TID 
	mov	eax, 0              ; return code is success 
	itislocked: 
        ; eax has 1
	pop	ebx
	pop	es
	;-----------------------------------------
	sti
	ret
testandsetasm32 ENDP 	

setsharedmemcharasm32 PROC C public uses ebx es, index: dword, char1:BYTE, base1: dword 
	push	ebx
	push	es

	mov	ax, MEMDataSel; This is a zero base selector to access shared memory between aoa and application
	mov	es, ax
	mov	ebx, S_Base
	add	ebx, base1; add the storage location
	add	ebx, index 
	mov	al, char1
	mov	BYTE PTR es:[ebx], al
	; al is stored in shared memory 
	pop	es
	pop	ebx
	ret
setsharedmemcharasm32 ENDP 	

getsharedmemcharasm32 PROC C public uses ebx, index: dword, base1: dword 
	push	ebx
	push	es

	mov	ax, MEMDataSel; This is a zero base selector to access shared memory between aoa and application
	mov	es, ax
	mov	ebx, S_Base
	add	ebx, base1 ; add storage location address 
	add	ebx, index 
	mov	al, BYTE PTR es:[ebx]
	;al has the character to be returned  
	pop	es
	pop	ebx
	ret
getsharedmemcharasm32 ENDP 	

getmemasm32 PROC C public uses ebx es, address: dword
	push	ebx
	push	es

	mov	ax, MEMDataSel; This is a zero base selector to access shared memory between aoa and application
	mov	es, ax
	mov	ebx, 0 
	add	ebx, address 
	mov	eax, DWORD PTR es:[ebx]
	; addr is the absolute address in memory 
	; eax has the data to be retunred 
	pop 	es
	pop	ebx
        ;--------trace Code----------------------
;	push	es
;	push	ebx
;	push	eax

;	mov	ax, MEMDataSel
;	mov	es, ax
;	mov	ebx, S_Base
;	add	ebx, S_Error_Flag
;	mov	eax, DWORD PTR es:[ebx] ;get error flag
;	cmp	eax, 0			; check if flag is zero 
;	jnz	skipupdate
;	mov	eax, 0126h
;	mov	ebx, S_Base
;	add	ebx, S_IO_Function_Code
;	mov	DWORD PTR es:[ebx], eax

;       skipupdate:
;	pop	eax
;	pop	ebx
;	pop	es
	;--------end trace code------------------

	ret
getmemasm32 ENDP 	
;------------------------------------------------------------------
; set memory protected 
;------------------------------------------------------------------
setmemasm32 PROC C public uses ebx es, address: dword, data:dword
	push	ebx
	push	es

	mov	ax, MEMDataSel; This is a zero base selector to access shared memory between aoa and application
	mov	es, ax
	mov	ebx, 0 
	add	ebx, address 
	mov 	eax, data
	mov	DWORD PTR es:[ebx], eax
	; addr is the absolute address in memory 
	; eax has the data to be retunred 

	pop	es
	pop	ebx

	ret
setmemasm32 ENDP 	
;-----------------------------------------------------------------
;  get real memory 
;-----------------------------------------------------------------
getrealmemory PROC C public uses ebx es, address:dword
	push	ebx
	push	es

	mov	ax, MEMDataSel
        ; This is a zero base selector to access shared memory between aoa and application
	mov	es, ax
	mov	ebx, 0 
	add	ebx, address 
	mov	eax, DWORD PTR es:[ebx]
	; addr is the absolute address in memory 
	; eax has the data to be retunred 
	pop 	es
	pop	ebx
	ret
getrealmemory ENDP 	

getstackpopasm32 PROC C public uses edx esi, index:DWORD 
	; return the top of the stack value 4 bytes 
	; ESP - index address is used to address stack 
	; eax has the return value 

	mov esi, ebp 
	add esi, index 
	mov eax, DWORD PTR ss:[esi] ;get the stack value 

	ret
getstackpopasm32 ENDP 	

; gets a character using interrupts 
getcharintasm32 PROC C public uses ebx es  
		int	0f5h  ; 
		ret

getcharintasm32 ENDP 	

getcharbuffasm32 PROC C public 

	int	0f6h
        ;--------trace Code----------------------
	push	es
	push	ebx
	push	eax

	mov	ax, MEMDataSel
	mov	es, ax
	mov	ebx, S_Base
	add	ebx, S_Error_Flag
	mov	eax, DWORD PTR es:[ebx] ;get error flag
	cmp	eax, 0			; check if flag is zero 
	jnz	skipupdate
	mov	eax, 0104h
	mov	ebx, S_Base
	add	ebx, S_IO_Function_Code
	mov	DWORD PTR es:[ebx], eax

        skipupdate:
	pop	eax
	pop	ebx
	pop	es
	;--------end trace code------------------
	ret
getcharbuffasm32 ENDP 	

readfloppyasm32 PROC C public uses eax ebx ecx, buffer1:ptr byte, sectorno: dword

        push ebx 
	push es 
	push fs 

        ; setup the sector number in shared memory 
	mov ax, MEMDataSel ; 0 base in protected mode 
	mov es, ax 
	mov ebx, S_Base     ; base value of shared memory 
	add ebx, S_SectorNo ; offset of the sector number in shared mem 
	mov eax, sectorno
	mov DWORD PTR es:[ebx], eax ;store the sector no in shared memory 

        pop fs
        pop es
        pop ebx 

	int	0fah        ; read one sector into 8400h 

	;copy the data in 8400h to user memory specified by the ptr 
	 
	mov ax, MEMDataSel ; 0 base in protected mode 
	mov es, ax 
	mov ebx, 8400h     ; base value of data 
	mov esi, buffer1 
	mov ecx, D_ADDROFFSET ; D_ADDROFFSET is upper 2 bytes 
	; all EQU all 2 bytes in limit 
	shl ecx, 16           ; to top 2 bytes 
	add esi, ecx          ; add the offset  

        push ecx           ; save registers  
	push ebx 
	push fs 
	push es 

	mov ecx, 128 		   ; one sector or 512 bytes 
movonesector1: 
        mov eax, DWORD PTR es:[ebx]  ; 4 bytes at a time, source 
	mov DWORD PTR es:[esi], eax  ; destination 
	add ebx, 4
	add esi, 4
	LOOP movonesector1         ; loop 

	pop es 		; restore registers 
	pop gs 
	pop ebx 
	pop ecx 
        ;--------trace Code----------------------
	push	es
	push	ebx
	push	eax

	mov	ax, MEMDataSel
	mov	es, ax
	mov	ebx, S_Base
	add	ebx, S_Error_Flag
	mov	eax, DWORD PTR es:[ebx] ;get error flag
	cmp	eax, 0			; check if flag is zero 
	jnz	skipupdate
	mov	eax, 0116h
	mov	ebx, S_Base
	add	ebx, S_IO_Function_Code
	mov	DWORD PTR es:[ebx], eax

        skipupdate:
	pop	eax
	pop	ebx
	pop	es
	;--------end trace code------------------
	ret
readfloppyasm32 ENDP 	

writefloppyasm32 PROC C public uses eax ebx ecx, buffer1:ptr byte, sectorno: dword

        push ebx 
	push es 
	push fs 
	push ecx 
	push esi 

        ; setup the sector number in shared memory 
	mov ax, MEMDataSel ; 0 base in protected mode 
	mov es, ax 
	mov ebx, S_Base     ; base value of shared memory 
	add ebx, S_SectorNo ; offset of the sector number in shared mem 
	mov eax, sectorno
	mov DWORD PTR es:[ebx], eax ;store the sector no in shared memory 

	;copy the data from user memory to 8400h  
	mov ax, MEMDataSel ; 0 base in protected mode 
	mov es, ax 
	mov ebx, 8400h     ; base value of data 
	mov esi, buffer1 
	mov ecx, D_ADDROFFSET ; EQU is limited to 2 bytes 
	shl ecx,16            ; store only the top 2 bytes in EQU
	add esi, ecx; add data segment offset address to user memory 

	mov ecx, 128 
movuserto8400: 
        mov eax, DWORD PTR es:[esi] ; get 4 bytes from user memory 
	mov DWORD PTR es:[ebx],eax     ; move the 4 bytes to 8400 block  
	add ebx, 4 
	add esi, 4 
  	LOOP movuserto8400        ; move all 128 dwords or 512 bytes         

        pop esi  
        pop ecx  
        pop fs
        pop es
        pop ebx 

	int	0f4h        ; write one sector from 8400h to disk  
        ;--------trace Code----------------------
	push	es
	push	ebx
	push	eax

	mov	ax, MEMDataSel
	mov	es, ax
	mov	ebx, S_Base
	add	ebx, S_Error_Flag
	mov	eax, DWORD PTR es:[ebx] ;get error flag
	cmp	eax, 0			; check if flag is zero 
	jnz	skipupdate
	mov	eax, 0117h
	mov	ebx, S_Base
	add	ebx, S_IO_Function_Code
	mov	DWORD PTR es:[ebx], eax

        skipupdate:
	pop	eax
	pop	ebx
	pop	es
	;--------end trace code------------------
	ret
writefloppyasm32 ENDP 	

;------------------------------------------------------------------
; This procedure sets two long values given by C++ programmer in GDT Entry
;   given one appno which is the GDTIndex value 
; Application programmer must keep track of the GDTIndex to get the given descriptor 
; The two long values will be used to set a total of 8 byte descriptor 
;------------------------------------------------------------------
setGDTEntryasm32 PROC C public uses edi es, descriptorh:PTR DWORD, descriptorl:PTR DWORD,appno:WORD
	mov	ax, RDataSel
	mov	es, ax
	mov 	esi, descriptorh    ; offset of the high ptr
	mov	edi, 0		    ; offset of GDT from the base of RDataSeg
	mov	eax,0
	mov	ax,appno            ; GDTInex value 
	mov	ebx,08h ; 8 byte for each index value 
	mul	bx
	add	edi,eax             ; actual index for a given entry
	mov	eax, DWORD PTR [esi]; the data value for App1TSS 4 bytes 
        mov	DWORD PTR es:[edi], eax ; set higher 4 bytes in value by reference 
	mov 	esi, descriptorl    ; next 4 bytes 	
	mov	eax,DWORD PTR [esi]
	mov	DWORD PTR es:[edi+4], eax ; store the lower 4 bytes in value by reference 
	mov	eax,0               ; return code 0 if successful

	       ;--------trace Code----------------------
	push	es
	push	ebx
	push	eax

	mov	ax, MEMDataSel
	mov	es, ax
	mov	ebx, S_Base
	add	ebx, S_Error_Flag
	mov	eax, DWORD PTR es:[ebx] ;get error flag
	cmp	eax, 0			; check if flag is zero 
	jnz	skipupdate
	mov	eax, 0135h
	mov	ebx, S_Base
	add	ebx, S_IO_Function_Code
	mov	DWORD PTR es:[ebx], eax

        skipupdate:
	pop	eax
	pop	ebx
	pop	es
	;--------end trace code------------------

	ret
setGDTEntryasm32 ENDP 	

;------------------------------------------------------------------
; This procedure returns two long values to C++ programmer 
;   given one appno which is the GDTIndex value 
; Application programmer must keep track of the GDTIndex to get the given descriptor 
; The two long values will return a total of 8 byte descriptor 
;------------------------------------------------------------------
getGDTEntryasm32 PROC C public uses edi es, descriptorh:PTR DWORD, descriptorl:PTR DWORD,appno:WORD
	mov	eax, RDataSel
	mov	es, ax
	mov 	esi, descriptorh    ; offset of the high ptr
	mov	edi,0		    ; offset of GDT from the base of RDataSeg	
	mov	eax,0
	mov	ax,appno            ; GDTInex value 
	mov	ebx,08h ; 8 byte for each index value 
	mul	bx
	add	edi,eax             ; actual index for a given entry
	mov	eax, es:[edi]       ; the data value for App1TSS 4 bytes 
        mov	DWORD PTR [esi], eax ; store higher 4 bytes in value by reference 
	mov 	esi, descriptorl    ; next 4 bytes 	
	mov	eax, es:[edi+4]
	mov	DWORD PTR [esi], eax ; store the lower 4 bytes in value by reference 
	mov	eax,0               ; return code 0 if successful!

       ;--------trace Code----------------------
	push	es
	push	ebx
	push	eax

	mov	ax, MEMDataSel
	mov	es, ax
	mov	ebx, S_Base
	add	ebx, S_Error_Flag
	mov	eax, DWORD PTR es:[ebx] ;get error flag
	cmp	eax, 0			; check if flag is zero 
	jnz	skipupdate
	mov	eax, 0134h
	mov	ebx, S_Base
	add	ebx, S_IO_Function_Code
	mov	DWORD PTR es:[ebx], eax

        skipupdate:
	pop	eax
	pop	ebx
	pop	es
	;--------end trace code------------------

	ret
getGDTEntryasm32 ENDP 	


;------------------------------------------------------------------
; This procedure returns two long values to C++ programmer 
;   given one appno which is the GDTIndex value 
; We assume that AppGDTPtr in RDataSeg has the address for the 
;  starting point of App1TSS in GDT 
; Application programmer must keep track of the GDTIndex to get the given descriptor 
; The two long values will return a total of 8 byte descriptor 
;------------------------------------------------------------------
getIDTEntryasm32 PROC C public uses edi es ebx, descriptorh:PTR DWORD, descriptorl:PTR DWORD,appno:WORD

	push	esi
	push	edi
	push	ebx
	mov	ax, MEMDataSel
	mov	es, ax
	mov	ebx, S_Base
	add	ebx, S_IDTOffset
	mov	edi, 0
	mov	di, WORD PTR es:[ebx] ; get the base of IDT from shared memory
		
	mov 	esi, descriptorh    ; offset of the high ptr

	mov	eax,0
	mov	ax,appno            ; IDTInex value 
	mov	ebx,08h ; 8 byte for each index value 
	mul	bx
	add	edi,eax             ; actual index for a given entry
	
	mov	eax, es:[edi]       ; the data value for IDTEntry 4 bytes 
        mov	DWORD PTR [esi], eax ; store higher 4 bytes in value by reference 
	mov 	esi, descriptorl    ; next 4 bytes 	
	mov	eax, es:[edi+4]
	mov	DWORD PTR [esi], eax ; store the lower 4 bytes in value by reference 
	mov	eax,0               ; return code 0 if successful!
	pop	ebx
	pop	edi
	pop	esi

       ;--------trace Code----------------------
	push	es
	push	ebx
	push	eax

	mov	ax, MEMDataSel
	mov	es, ax
	mov	ebx, S_Base
	add	ebx, S_Error_Flag
	mov	eax, DWORD PTR es:[ebx] ;get error flag
	cmp	eax, 0			; check if flag is zero 
	jnz	skipupdate
	mov	eax, 0136h
	mov	ebx, S_Base
	add	ebx, S_IO_Function_Code
	mov	DWORD PTR es:[ebx], eax

        skipupdate:
	pop	eax
	pop	ebx
	pop	es
	;--------end trace code------------------

	ret
getIDTEntryasm32 ENDP 	


setIDTEntryasm32 PROC C public uses edi es ebx, descriptorh:PTR DWORD, descriptorl:PTR DWORD,appno:WORD

	
	;mov	eax, 0ABCDh
	;mov	ebx, 1480h
	;int 	0fdh
	
	cli
	mov	ax, MEMDataSel
	mov	es, ax
	mov	ebx, S_Base
	add	ebx, S_IDTOffset
	mov	edi, 0

	
	mov	di, WORD PTR es:[ebx] ; get the base of IDT from shared memory

	mov 	esi, descriptorh    ; offset of the high ptr
	
	mov	eax,0
	mov	ax,appno            ; IDTInex value 
	mov	ebx,08h ; 8 byte for each index value 
	mul	bx
	add	edi,eax             ; actual index for a given entry
	mov	eax, DWORD PTR [esi]; the data value for App1TSS 4 bytes 
        mov	DWORD PTR es:[edi], eax ; set higher 4 bytes in value by reference 
	mov 	esi, descriptorl    ; next 4 bytes 	
	mov	eax,DWORD PTR [esi]
	mov	DWORD PTR es:[edi+4], eax ; store the lower 4 bytes in value by reference 
	mov	eax,0               ; return code 0 if successful
	sti

       ;--------trace Code----------------------
	push	es
	push	ebx
	push	eax

	mov	ax, MEMDataSel
	mov	es, ax
	mov	ebx, S_Base
	add	ebx, S_Error_Flag
	mov	eax, DWORD PTR es:[ebx] ;get error flag
	cmp	eax, 0			; check if flag is zero 
	jnz	skipupdate
	mov	eax, 0137h
	mov	ebx, S_Base
	add	ebx, S_IO_Function_Code
	mov	DWORD PTR es:[ebx], eax

        skipupdate:
	pop	eax
	pop	ebx
	pop	es
	;--------end trace code------------------

	ret
setIDTEntryasm32 ENDP 	

ShortDelay PROC C public uses ebx, Delay:dword
	push	ebx
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
	pop	ebx

        ;--------trace Code----------------------
	push	es
	push	ebx
	push	eax

	mov	ax, MEMDataSel
	mov	es, ax
	mov	ebx, S_Base
	add	ebx, S_Error_Flag
	mov	eax, DWORD PTR es:[ebx] ;get error flag
	cmp	eax, 0			; check if flag is zero 
	jnz	skipupdate
	mov	eax, 0120h
	mov	ebx, S_Base
	add	ebx, S_IO_Function_Code
	mov	DWORD PTR es:[ebx], eax

        skipupdate:
	pop	eax
	pop	ebx
	pop	es
	;--------end trace code------------------

	ret
ShortDelay ENDP 	


printregsasm32 PROC C public uses edx esi, pos:DWORD 
 ; print all general purpose registers on the screen 
 ; starting position at pos 
 	push	eax
 	push	edx
	push	esi
	push	ebx
	push	es

 	mov 	edx, pos ; store the start line 

  	mov 	al, 'C'
	mov	ebx, edx 
	add	ebx, 2
	int	0f7h
  	mov 	al, 'S'
	add	ebx, 2 
	call	printchar32  
	;int	0f7h

	add	ebx, 18 
	mov 	al, 'D'
	int	0f7h
	mov	al, 'S'
	add	ebx, 2
	call	printchar32  
	;int	0f7h

	add	ebx, 18 
	mov 	al, 'S'
	int	0f7h
	mov	al, 'S'
	add	ebx, 2
	call	printchar32  
	;int	0f7h

	add	ebx, 18 
	mov 	al, 'E'
	int	0f7h
	mov	al, 'S'
	add	ebx, 2
	call	printchar32  
	;int	0f7h

	add	ebx, 18 
	mov 	al, 'F'
	int	0f7h
	mov	al, 'S'
	add	ebx, 2
	call	printchar32  
	;int	0f7h

	add	ebx, 18 
	mov 	al, 'G'
	int	0f7h
	mov	al, 'S'
	add	ebx, 2
	call	printchar32  
	;int	0f7h

	add	edx, 160 
	mov	ebx, edx 

 	mov 	eax, 0
 	mov	ax, cs 	; CS register 
	int	0fdh
	
	mov 	eax, 0
 	mov	ax, ds 	; DS register 
	add	ebx, 4
	int	0fdh

	mov 	eax, 0
 	mov	ax, ss 	; SS register 
	add	ebx, 4
	int	0fdh
	
	mov 	eax, 0
 	mov	ax, es 	; ES register 
	add	ebx, 4
	int	0fdh

	mov 	eax, 0
 	mov	ax, fs 	; FS register 
	add	ebx, 4
	int	0fdh

	mov 	eax, 0
 	mov	ax, gs 	; GS register 
	add	ebx, 4
	int	0fdh

	;----next line 
	add	edx, 160 
	mov	ebx, edx 

	mov 	al, 'E'
	mov	ebx, edx 
	add	ebx, 2
	call	printchar32  
	;int	0f7h
  	mov 	al, 'S'
	add	ebx, 2 
	int	0f7h
  	mov 	al, 'P'
	add	ebx, 2 
	call	printchar32  
	;int	0f7h

	add	ebx, 16 
	mov 	al, 'E'
	call	printchar32  
	;int	0f7h
	mov	al, 'B'
	add	ebx, 2
	call	printchar32  
	;int	0f7h
	mov	al, 'P'
	add	ebx, 2
	call	printchar32  
	;int	0f7h

	add	ebx, 16 
	mov 	al, 'G'
	call	printchar32  
	;int	0f7h
	mov	al, 'D'
	add	ebx, 2
	call	printchar32  
	;int	0f7h
	mov	al, 'T'
	add	ebx, 2
	int	0f7h

	add	ebx, 16 
	mov 	al, 'L'
	call	printchar32  
	;int	0f7h
	mov	al, 'D'
	add	ebx, 2
	call	printchar32  
	;int	0f7h
	mov	al, 'T'
	add	ebx, 2
	call	printchar32  
	;int	0f7h

	add	ebx, 16 
	mov 	al, 'T'
	call	printchar32  
	;int	0f7h
	mov	al, 'R'
	add	ebx, 2
	call	printchar32  
	;int	0f7h

	add	ebx, 16 
	mov 	al, 'F'
	call	printchar32  
	;int	0f7h
	mov	al, 'L'
	add	ebx, 2
	call	printchar32  
	;int	0f7h
	mov	al, 'A'
	add	ebx, 2
	call	printchar32  
	;int	0f7h
	mov	al, 'G'
	add	ebx, 2
	call	printchar32  
	;int	0f7h
	mov	al, 'S'
	add	ebx, 2
	call	printchar32  
	;int	0f7h
	;----next line 
        add	edx, 160
	mov	ebx, edx  
 	mov	eax, esp ; ESP register 
	int	0fdh

 	mov	eax, ebp ; EBP register 
	add	ebx, 4
	int	0fdh

	mov	ax, MEMDataSel; This is a zero base selector to access shared memory between aoa and application
	mov	es, ax
	mov	ebx, S_Base
	add	ebx, S_DUMMY  ; dummy location for store  
	mov	eax, 0
	sgdt	es:[0]
	mov	eax, es:[2] ;GDT Register base address  
	add	ebx, 4
	int	0fdh

	mov	eax, 0 
	sldt	ax       ;LDT Register 
	add	ebx, 4
	int	0fdh

	mov	eax, 0
	str	ax       ; TR Task Register
	add	ebx, 4
	int	0fdh

	pushfd            ; FLAGS
	pop 	eax      ; flags in eax 
	add 	ebx, 4 
	int 	0fdh

        mov 	eax, 0
	mov	eax, es:[0] ;GDT Register offset  
	add	ebx, 4
	int	0fdh

	pop	es
	pop	ebx
	pop	esi
	pop	edx
	pop	eax

	ret
printregsasm32 ENDP 	

printstackregsasm32 PROC C public uses edx esi, pos:DWORD 
   ; print ESP and EBP 
 	push	eax
 	push	edx
	push	esi
	push	ebx
	push	es

 	mov 	edx, pos ; store the start line 
	mov	    ebx, edx  
 	mov	    eax, esp ; ESP register 
	int	    0fdh

    add     ebx, 20
 	mov	    eax, ebp ; EBP register 
	int	    0fdh

	pop	es
	pop	ebx
	pop	esi
	pop	edx
	pop	eax

	ret
printstackregsasm32 ENDP 	
;--------------------------------------
; al has the char and edx has the position 
;---------------------------------------
printchar32 PROC C public uses eax ebx
	push	eax
	push	ebx

	;-----------------------------------------
	; replace f7 interrupt in prcycle with this code 
	;  this is same code as in prcycle, however, it needs Video_Sel 
		push	es

                push    eax      ;save eax
		mov     ax,Video_Sel_Loc ; Video_Sel selector watch for changes in prcycle 
		mov     es,ax
		pop	eax
		;mov     ah,17h
		mov	ah, 7 
                mov     WORD PTR es:[ebx],ax

		pop	es
	;-----------------------------------------

	pop	ebx
	pop	eax

	ret
printchar32 ENDP 	

;--------------------------------------
; eax has the data and ebx has the pointer 
;---------------------------------------
printhex    PROC    FAR
	PUSH    ECX
	PUSH    EDI
	PUSH	DS
	push	eax

	push 	ebx
	push    eax

	;mov     ax,Puthex32DataSel
	mov     ds,ax

	pop     eax
	pop	ebx

	;MOV     PrintDataP, eax         ; save data in memory
	MOV     ecx, 8                  ; eight characters
PutHexLoopP:
	;MOV     eax, PrintDataP         ; data in eax
	AND     eax, 0F0000000h         ; select first nibble
	ROL     eax,4                   ; get the count on right
	;MOV     IndexCntP, eax          ; store the index 
	;MOV     edi, IndexCntP 
	;MOV     al, BYTE PTR HexTableP[edi]  ; get hex character

	add     ebx,2                   ; Next character
	int     0f7h			

	;MOV     eax, PrintDataP         ; get the stored data
	SHL     eax, 4                  ; shift to next nibble
	;MOV     PrintDataP, eax         ; store remaining data 
	;LOOP    PutHexLoopP             ; print all 8 hex characters

	pop	eax
	POP     DS
	POP     EDI
	POP     ECX

	ret

printhex       ENDP



getsharedmemasm32 PROC C public uses ebx es, index: dword
	push    ebx
	push    es
	
	mov	ax, MEMDataSel; This is a zero base selector to access shared memory between aoa and application
	mov	es, ax
	mov	ebx, S_Base
	add	ebx, index 
	mov	eax, DWORD PTR es:[ebx]
	; index is the index value in shared memory for a given variable 
	; eax has the data to be retunred 

	pop 	es
	pop	ebx

	ret
getsharedmemasm32 ENDP 	

setsharedmemasm32 PROC C public uses ebx es, index: dword, val:dword
	push	ebx
	push	es 

	mov	ax, MEMDataSel; This is a zero base selector to access shared memory between aoa and application
	mov	es, ax
	mov	ebx, S_Base
	add	ebx, index 
	mov	eax, val 
	mov	DWORD PTR es:[ebx], eax
	; index is the index value in shared memory for a given variable 
	; eax has the data to be retunred 
	
	pop	es
	pop	ebx

	ret
setsharedmemasm32 ENDP 	


stiTimerasm32 PROC C public 
	push	edx
	push	eax
	mov	dx,21h ;enable timer interrupt 
	mov	al,0h
	out	dx,al
	mov	dx,20h
	mov	al,20h
	out	dx,al
	pop	eax	
	pop	edx
	ret
stiTimerasm32 ENDP 	

cleanscreenasm32 PROC C public

	int	0f1h
        ;--------trace Code----------------------
	push	es
	push	ebx
	push	eax

	mov	ax, MEMDataSel
	mov	es, ax
	mov	ebx, S_Base
	add	ebx, S_Error_Flag
	mov	eax, DWORD PTR es:[ebx] ;get error flag
	cmp	eax, 0			; check if flag is zero 
	jnz	skipupdate
	mov	eax, 0108h
	mov	ebx, S_Base
	add	ebx, S_IO_Function_Code
	mov	DWORD PTR es:[ebx], eax

        skipupdate:
	pop	eax
	pop	ebx
	pop	es
	;--------end trace code------------------

	ret
cleanscreenasm32 ENDP 	

getcharasm32 PROC C public uses ebx, cursorp: dword  

		;int	0f5h  old, not used 
		push	ebx
		push	ecx
		push	edx
		push	esi
		push	es
		
		mov	ax, RDataSel  ;real data segment 
		mov	es, ax

		mov	eax, GKKQ     ;char buffer 
		mov	esi, eax

		xor	eax, eax
		;int	0f2h get cursor is not used 
		mov	eax, cursorp  ; cursor position read before 
		mov	dx, ax
		push	dx
		mov	bx, 2
		mul	bx	
		pop	dx
		mov	ecx, eax

WaitChar:
		mov	bl, BYTE PTR es:[GKHead]
		mov	bh, BYTE PTR es:[GKTail]
		cmp	bl, bh
		je	WaitChar

		xor	ebx, ebx
		mov	bl, BYTE PTR es:[GKTail]
		add	esi, ebx 
		mov	al, byte ptr es:[esi]

		cmp	bl, 254 
		jz	RoundChar
		inc	bl
		jmp	UpdateChar
RoundChar:
		mov	bl, 0
UpdateChar:
		mov	BYTE PTR es:[GKTail], bl

		push	eax
		cmp 	al, 13
		jz	NDisp
		mov	ebx, ecx 
		;int	0f7h  ; echo the character in C code  
NDisp:
		inc	dx
		cmp	dx, 2000   ; cursor check 
		jl	CursorOK
		; int	0f0h       ; scroll is not done if cursor is not ok 
		jmp	Charout
CursorOK:
		mov	ax, dx
		; int	0f3h       ; incrementing is done in C code 
Charout:

		pop	eax
		
		pop	es
		pop 	esi
		pop	edx
		pop	ecx
		pop	ebx
	
	ret
getcharasm32 ENDP 	

printstrasm32 PROC C public uses ebx edi ecx, buffer:ptr byte, len:dword, base:dword
	push	ebx
	push	ecx
	push	edi
	push	ss
	
	mov	ecx, len
	or	cx,cx
	jz	exit
	
	mov	ebx, base
	mov	edi, buffer
	
	mov	ebx, base
	xor	eax,eax
PrintChar:
	mov	al, ss:[edi]	
	cli
	int	0f7h
	sti
	add	ebx,2
	dec	ecx
	inc	edi

	jecxz	exit
	jmp	PrintChar
exit:	
	pop	ss
	pop	edi
	pop	ecx
	pop	ebx

	ret
printstrasm32 ENDP 	

;=========================================================================
END