;*******************************************************************************
;prwrite1.asm
; this call writes only one sector to floppy disk 
;   from the location 8400h 
;*******************************************************************************
PUBLIC 		aoaminiw1	
EXTRN		BxPointer1,LoaderSize1m, StartLogicalSecNum1m

INCLUDE 	386SCD.INC
INCLUDE 	DCYCLE.INC

;*******************************************************************************
RDataSeg        SEGMENT PARA public USE16 'REALDATA'


DiskDrive2		db	0h	;initialize the number of disk drive (floppy/hard).
					;later we can get this number from 
					;keyboard!!!!!!!!!!!!!!!!!!!!!!!!!!!

LoopCount2      	dd      3	;try three times

SS_cl2			db	0	;Start sector number in cl
T_ch2			db	0	;track in ch
H_dh2			db	0	;head in dh
					
RDataSeg	Ends

;*******************************************************************************

RCodeSeg        SEGMENT PARA public USE16 'CODE'
		ASSUME  DS:RDataSeg, CS:RCodeSeg
;===============================================================================
aoaminiw1        proc 

	sti 
	mov     ax,0840h		;set up es for the es:bx reader buffer.
	mov     es,ax
	mov	ebx, 0

WStart2:

	call 	StartSec_cl2		;use current StartLogicalSecNum1m to get 
					;current StartPhysicalSecNum.

	call 	Head_dh2 		;use current StartLogicalSecNum1m to get 
					;current head number.
					
	call 	Track_ch2		;use current StartLogicalSecNum1m to get 
					;current track number.
	clc

 	mov     bx, 0h        	;set up bx for the es:bx reader buffer.

	MOV     dl, DiskDrive2		;load from floppy disk.
	mov	dh, H_dh2
	mov	cl, SS_cl2	
	mov	ch, T_ch2		

	
	mov     ah, 03h       		;write one sector at a time
	mov     al, 01h
	int     13H	                ; BIOS call to write	

        jnc     NextSector2		;if not carry, go to load next sector.
	dec     LoopCount2  		;otherwise, try until three times.
	mov     eax, LoopCount2
	cmp     eax, 0 
	jnz     WStart2
	jmp     @@Boot_Failure2

NextSector2:

	inc	StartLogicalSecNum1m
	dec	LoaderSize1m
	JMP     LoadFinish2
	
@@Boot_Failure2:

	mov	ah, 14  
	mov 	al, 'F'
	int    	10h
	
LoadFinish2:
	mov	[LoopCount2],3
       	ret
aoaminiw1 endp

;=================================================================================

StartSec_cl2	proc			;this proc make StartPhysicalSecNum into
					;cl.
				
	mov	ax, StartLogicalSecNum1m	;start to calculate StartPhysicalSecNum 
	mov	bl, 18			;SPSN=(SLSN mod 18)+1
	div	bl			;'and cl, n-1' to implement 'mod cl, n'
	xor	cx, cx 			;18-1=17
	mov	cl, ah			;now we get the starting physical sector
	add	cl, 1			;number in the local track into cl.						
	mov	SS_cl2, cl
	ret
	
StartSec_cl2	endp

;===============================================================================

Head_dh2	proc
	
					;calcute StartHead=(SLSN/18) mod 2
	mov	ax, StartLogicalSecNum1m
	mov	bl, 18
	div	bl
	and	ah, 0
	mov	bl, 2
	div	bl
	mov	dh, ah
	
	mov	H_dh2, dh
	ret
	
Head_dh2	endp

;===============================================================================

Track_ch2	proc

	xor	ax, ax				;calcute StartTrack=SLSN/(18*2)
	mov	ax, StartLogicalSecNum1m
	mov	bl, 36
	div	bl
	mov	ch, al

	mov	T_ch2, ch
	ret
Track_ch2	endp

RCodeSeg        ENDS
;===============================================================================
		END 
