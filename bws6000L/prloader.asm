;*******************************************************************************
;prloader.asm
;*******************************************************************************
PUBLIC 		aoaminil	
public		LoaderSize, StartLogicalSecNum,LoadOffset

INCLUDE 	386SCD.INC
INCLUDE 	DCYCLE.INC
;*******************************************************************************

RDataSeg        SEGMENT PARA public USE16 'REALDATA'


DiskDrive		db	0h	;initialize the number of disk drive.
					;later we can get this number from 
					;keyboard!!!!!!!!!!!!!!!!!!!!!!!!!!!

LoopCount       	dd      3	;try three times

LoadOffset       	dw      0800h	

BxPointer       	dw      0000h  	;to keep offset for next

LoaderSize   		dw      0	;initialize the LoaderSize, how many
					;sectors we want to load. later 
					;we can get this number from 
					;keyboard!!!!!!!!!!!!!!!!!!!!!!!!!!!
					
StartLogicalSecNum	dw	0	;initialize the StartLogicalSecNum.
					;later we can get this number from 
					;keyboard!!!!!!!!!!!!!!!!!!!!!!!!!!!

					;now start from 33-2879 
					;(could be 0-2879)
					
					;StartPhysicalSecNum start from 1-18
					;StartTrack start from 0-79
					;StartHead 0 or 1
					
					;once we have this value, we can get 
					;the value of cl, ch and dh.


SS_cl			db	0	;Start sector number in cl
T_ch			db	0	;track in ch
H_dh			db	0	;head in dh

					
RDataSeg	Ends

;*******************************************************************************

RCodeSeg        SEGMENT PARA public USE16 'CODE'
		ASSUME  DS:RDataSeg, CS:RCodeSeg
;===============================================================================
aoaminil        proc 

	;sti 
	cli
	;mov     ax,LoadOffset	;set up es for the es:bx reader buffer.
	mov     ax,0800h
mov     es,ax
	mov	ebx, 0

RWStart:

	call 	StartSec_cl		;use current StartLogicalSecNum to get 
					;current StartPhysicalSecNum.

	call 	Head_dh  		;use current StartLogicalSecNum to get 
					;current head number.
					
	call 	Track_ch		;use current StartLogicalSecNum to get 
					;current track number.
	clc

 	mov     bx, BxPointer        	;set up bx for the es:bx reader buffer.

	MOV     dl, DiskDrive		;load from floppy disk.
	mov	dh, H_dh
	mov	cl, SS_cl	
	mov	ch, T_ch		

	mov     ah, 02h       		;Read one sector at a time
	mov     al, 01h
	int     13H		

        jnc     NextSector		;if not carry, go to load next sector.
	dec     LoopCount  		;otherwise, try until three times.
	mov     eax, LoopCount
	cmp     EAX, 0 
	jnz     RWStart
	jmp     @@Boot_Failure

NextSector:

	add    	BxPointer, 200H
	inc	StartLogicalSecNum
	dec	LoaderSize
	jnz     RWStart			;Load sectors for LocalLoaderSize times.
	JMP     LoadFinish
	
@@Boot_Failure:

	mov	ah, 14  
	mov 	al, 'F'
	int    	10h
	
LoadFinish:
	mov	[BxPointer],0000h
	mov	[LoopCount],3
	sti
       	ret
aoaminil endp

;=================================================================================

StartSec_cl	proc			;this proc make StartPhysicalSecNum into
					;cl.
				
	mov	ax, StartLogicalSecNum	;start to calculate StartPhysicalSecNum 
	mov	bl, 18			;SPSN=(SLSN mod 18)+1
	div	bl			;'and cl, n-1' to implement 'mod cl, n'
	xor	cx, cx 			;18-1=17
	mov	cl, ah			;now we get the starting physical sector
	add	cl, 1			;number in the local track into cl.						
	mov	SS_cl, cl
	ret
	
StartSec_cl	endp

;===============================================================================

Head_dh		proc
	
					;calcute StartHead=(SLSN/18) mod 2
	mov	ax, StartLogicalSecNum
	mov	bl, 18
	div	bl
	and	ah, 0
	mov	bl, 2
	div	bl
	mov	dh, ah
	
	mov	H_dh, dh
	ret
	
Head_dh		endp

;===============================================================================

Track_ch	proc

	xor	ax, ax				;calcute StartTrack=SLSN/(18*2)
	mov	ax, StartLogicalSecNum
	mov	bl, 36
	div	bl
	mov	ch, al

	mov	T_ch, ch
	ret
Track_ch	endp

RCodeSeg        ENDS
;===============================================================================
		END 
