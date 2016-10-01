
.386P
;----------------------------------------------------------------------------
;application structure for aoa 

typeApplication struc
	noOfSectors	DW	? 
	startingSector	DW	?
	nameApplication	DB 	8 dup(?)	
typeApplication	ends


;allApplications	typeApplication	10 dup(<>) 
; ten application vector 


; command structure 
typeCommand		struc 
	command		db	?	; command 
					; 0 - exit 
					; 1 - no command
					; 2 - load
					; 3 - run 
	appName		db	8 dup(?)

	appIndex	db	?

typeCommand		ends

;appCommand	typeCommand <>
;----------------------------------------------------------------------------
; Setup keyboard LED according to variable NumLock & CapLock
;----------------------------------------------------------------------------
KeyboardLED	MACRO	NumLock, CapLock	; setup keyboard LED
		LOCAL @@NoCap,@@Write_LED,@@Wait1,@@Wait2,@@Wait3
		
		mov bl, 0
		mov al, CapLock
		cmp al, 0
		jz @@NoCap
		or bl, 4
@@NoCap:
		mov al, NumLock
		cmp al, 0
		jz @@Write_LED
		or bl, 2
@@Write_LED:
		mov dx, 64h	; set CapLock LED
@@Wait1:
		in al, dx
		and al, 2
		jnz @@Wait1
		
		mov dx, 60h	; write LED command
		mov al, 0edh
		out dx, al
		
		mov dx, 64h
@@Wait2:
		in al, dx
		and al, 2
		jnz @@Wait2
		
		mov dx, 60h
		mov al, bl
		out dx, al
	
		mov dx, 64h
@@Wait3:
		in al, dx
		and al, 2
		jnz @@Wait3

		ENDM
;----------------------------------------------------------------------------
; Write configuration data to FDC
;----------------------------------------------------------------------------
FDC_out		MACRO	
		local @@loop
		push	edx
		push	eax
		
		mov	dx, 3f4h
@@loop:
		in	al, dx
		test	al, 80h
		jz	@@loop

		inc	dx
		pop	eax
		out	dx, al

		pop	edx
		ENDM
;----------------------------------------------------------------------------
; Read a byte from FDC
; Return data is in AL
;----------------------------------------------------------------------------
FDC_in		MACRO
		local @@loop
		push	edx
		
		mov	dx, 3f4h
@@loop:
		in	al, dx
		test	al, 80h
		jz	@@loop

		inc	dx
		in	al, dx

		pop	edx
		ENDM
;----------------------------------------------------------------------------
; Debug purpose 
;----------------------------------------------------------------------------
FDC_al		MACRO	ps
		push	ebx
		mov	ebx, ps
		int	0fdh
		pop	ebx
		ENDM
;----------------------------------------------------------------------------
; Wait for floppy interrupt
;----------------------------------------------------------------------------
FDC_wait	MACRO
		local @@loop
		push	eax
		push	fs

		mov	ax, RData_Sel
		mov	fs, ax

@@loop:
		mov	al, fs:[FloppyReady]
		cmp	al, 0
		jz	@@loop
		mov	al, 0
		mov	fs:[FloppyReady], al

		pop	fs
		pop	eax
		ENDM
;----------------------------------------------------------------------------
; Delay a while to wait for other stuff
;----------------------------------------------------------------------------
MDelay		MACRO length
		local @@loop
		push	eax
		push	ecx
		
		mov	ecx, length
@@loop:
		xor	ax, ax
		loop @@loop

		pop	ecx
		pop	eax
		ENDM
;----------------------------------------------------------------------------
; Calculate floppy start sector
; Return in AL
;----------------------------------------------------------------------------
FDCSector	MACRO	sec
		push	ebx
		push	ecx

		mov	ax, sec
		mov	bl, 18
		div	bl
		xor	cx, cx
		mov	cl, ah
		add	cl, 1
		xor	eax, eax
		mov	al, cl

		pop	ecx
		pop	ebx
		ENDM
;----------------------------------------------------------------------------
; Calculate floppy Head 
; Return in AL
;----------------------------------------------------------------------------
FDCHead	MACRO	sec
		push	ebx

		xor	eax, eax
		mov	ax, sec
		mov	bl, 18
		div	bl
		and	ah, 0
		mov	bl, 2
		div	bl
		mov	al, ah
		mov	ah, 0
		
		pop	ebx
		ENDM
;----------------------------------------------------------------------------
; Calculate floppy cylinder 
; Return in AL
;----------------------------------------------------------------------------
FDCCyl	MACRO	sec
		push	ebx

		xor	eax, eax
		mov	ax, sec
		mov	bl, 36
		div	bl
		mov	ah, 0
		
		pop	ebx
		ENDM
;----------------------------------------------------------------------------
NewLineM	MACRO		;prints a newline after puthex
		push	eax
		mov	al,0dh
		mov	ah,14
		int	10h
		mov	al,0ah			
		mov	ah,14
		int	10h
		pop	eax
		ENDM

;----------------------------------------------------------------------------
;----------------------------------------------------------------------------
EnableA20       MACRO
                push    ax
                in      al,92h
                or      al,00000010b
                out     92h,al
                pop     ax
                ENDM
;----------------------------------------------------------------------------

;----------------------------------------------------------------------------
DisableA20      MACRO
                push    ax
                in      al,92h
                and     al,11111101b
                out     92h,al
                pop     ax
                ENDM
;----------------------------------------------------------------------------

;----------------------------------------------------------------------------
JUMP16          MACRO   Selector,Offset
                DB      0eah     
                DW      Offset   
                DW      Selector
                ENDM
;----------------------------------------------------------------------------

JUMP32          MACRO   Selector,Offset
                DB      0eah     
                DW      OFFSET
                DW      0
                DW      Selector 
                ENDM
;----------------------------------------------------------------------------

;----------------------------------------------------------------------------
CALL16          MACRO   Selector,Offset
                DB      9ah      
                DW      Offset   
                DW      Selector 
                ENDM
;----------------------------------------------------------------------------

CALL32          MACRO   Selector,Offset
                DB      9ah      
                DW      Offset
                DW      0
                DW      Selector 
                ENDM
;----------------------------------------------------------------------------
Desc            STRUC
LimitL          DW      0 
BaseL           DW      0 
BaseM           DB      0 
Attributes      DB      0 
LimitH          DB      0 
BaseH           DB      0 
Desc            ENDS
;----------------------------------------------------------------------------

;----------------------------------------------------------------------------
Gate            STRUC
OffsetL         DW      0 
Selector        DW      0 
DCount          DB      0 
GType           DB      0 
OffsetH         DW      0 
Gate            ENDS
;----------------------------------------------------------------------------

;----------------------------------------------------------------------------
PDesc           STRUC
Limit           DW      0 
Base            DD      0 
PDesc           ENDS
;----------------------------------------------------------------------------

;----------------------------------------------------------------------------
TSS             STRUC
TRLink          DW      0     
                DW      0    
TRESP0          DD      0      
TRSS0           DW      0    
                DW      0   
TRESP1          DD      0   
TRSS1           DW      0   
                DW      0   
TRESP2          DD      0   
TRSS2           DW      0 
                DW      0  
TRCR3           DD      0   
TREIP           DD      0      ;EIP
TREFlag         DD      0      ;EFLAGS
TREAX           DD      0      ;EAX
TRECX           DD      0      ;ECX
TREDX           DD      0      ;EDX
TREBX           DD      0      ;EBX
TRESP           DD      0      ;ESP
TREBP           DD      0      ;EBP
TRESI           DD      0      ;ESI
TREDI           DD      0      ;EDI
TRES            DW      0      ;ES
                DW      0     
TRCS            DW      0   
                DW      0     
TRSS            DW      0      ;SS
                DW      0     
TRDS            DW      0      ;DS
                DW      0      
TRFS            DW      0      ;FS
                DW      0    
TRGS            DW      0      ;GS
                DW      0      
TRLDTR          DW      0      
                DW      0      
TRTrip          DW      0      
TRIOMap         DW      $+2  
TSS             ENDS
;----------------------------------------------------------------------------

;----------------------------------------------------------------------------
ATDR            EQU     90h
ATDW            EQU     92h 
ATDWA           EQU     93h 
ATSWA		EQU	96h
ATCE            EQU     98h 
ATCER           EQU     9ah
ATCCO           EQU     9ch 
ATCCOR          EQU     9eh 
;----------------------------------------------------------------------------

;----------------------------------------------------------------------------
ATLDT           EQU     82h 
ATTaskGate      EQU     85h 
AT386TSS        EQU     89h 
AT386CGate      EQU     8ch 
AT386IGate      EQU     8eh 
AT386TGate      EQU     8fh 
;----------------------------------------------------------------------------

;----------------------------------------------------------------------------
DPL0            EQU     00h ;DPL=0
DPL1            EQU     20h ;DPL=1
DPL2            EQU     40h ;DPL=2
DPL3            EQU     60h ;DPL=3
;----------------------------------------------------------------------------

;----------------------------------------------------------------------------
RPL0            EQU     00h ;RPL=0
RPL1            EQU     01h ;RPL=1
RPL2            EQU     02h ;RPL=2
RPL3            EQU     03h ;RPL=3
;----------------------------------------------------------------------------

;----------------------------------------------------------------------------
IOPL0           EQU     0000h ;IOPL=0
IOPL1           EQU     1000h ;IOPL=1
IOPL2           EQU     2000h ;IOPL=2
IOPL3           EQU     3000h ;IOPL=3
;----------------------------------------------------------------------------

;----------------------------------------------------------------------------
D32             EQU     40h       
GL              EQU     80h       
TIL             EQU     04h      
VMFL            EQU     00020000h ;VMF=1
VMFLW           EQU     0002h
IFL             EQU     00000200h ;IF=1
RFL             EQU     00010000h ;
RFLW            EQU     0001h
NTL             EQU     00004000h ;NT=1
;----------------------------------------------------------------------------

;----------------------------------------------------------------------------
PL              EQU     1     
RWR             EQU     0     
RWW             EQU     2    
USS             EQU     0    
USU             EQU     4   
;----------------------------------------------------------------------------
HZ		EQU	100
CLOCK_TICK_RATE	EQU	1193180
LATCH		EQU	((CLOCK_TICK_RATE+HZ/2)/HZ)
;----------------------------------------------------------------------------
