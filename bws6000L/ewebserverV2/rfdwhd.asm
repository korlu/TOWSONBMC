;*******************************************************************************
;readFDwriteHD.asm
; This program can read from floppy to write into any sector of harddisk.
;
;*******************************************************************************
PUBLIC 		aoaminilRF, aoaminilWH	
public		LoaderSizeWH,StartLogicalSecNumRF,StartLogicalSecNumWH,LoadOffsetWH

INCLUDE 	386SCD.INC
INCLUDE 	DCYCLE.INC
;*******************************************************************************

RDataSeg        SEGMENT PARA public USE16 'REALDATA'

DiskDriveRF		db	0h	;Load from floppydisk
	
StartLogicalSecNumRF	dw	33	;initialize the StartReadLogicalSecNum.


SS_clRF			db	0	;Start sector number in certain track in cl
T_chRF			db	0	;track in ch
H_dhRF			db	0	;head in dh

;===============================================================================

DiskDriveWH		db	080h	;Load from harddisk
LoopCount       	dw      3	;!!!Same with the read floppy disk.

LoadOffsetWH       	dw      ?	;!!!Must be same with the read floppy disk.

BxPointer       	dw      0000h  	;!!!Same with the read floppy disk.

LoaderSizeWH   		dw      0	;!!!Same with the read floppy disk.

StartLogicalSecNumWH	dw	0	


SS_clWH			db	0	;Start sector number in cl
T_chWH			db	0	;track in ch
H_dhWH			db	0	;head in dh

					
RDataSeg	Ends

;*******************************************************************************

RCodeSeg        SEGMENT PARA public USE16 'CODE'
		ASSUME  DS:RDataSeg, CS:RCodeSeg
;===============================================================================

aoaminilRF	proc 
        
	push 	ax
	push	es	; save registers 	
	push	bx
	push	dx
	push	cx 

	sti 
	mov     ax,[LoadOffsetWH]	;set up es for the es:bx reader buffer.
					;for example: 0800h	
	mov     es,ax
	mov	bx, 0

RWStartRF:

	call 	StartSec_clRF		;use current StartReadLogicalSecNum to get 
					;current StartPhysicalSecNum.

	call 	Head_dhRF  		;use current StartReadLogicalSecNum to get 
					;current head number.
					
	call 	Track_chRF		;use current StartReadLogicalSecNum to get 
					;current track number.
	clc

 	mov     bx, [BxPointer]        	;set up bx for the es:bx reader buffer.

	MOV     dl, [DiskDriveRF]		;load from floppy disk if 0.
	mov	dh, [H_dhRF]
	mov	cl, [SS_clRF]	
	mov	ch, [T_chRF]		

	mov     ah, 02h       		;Read one sector at a time
	mov     al, 01h
	int     13H		

        jnc     NextSectorRF		;if not carry, go to load next sector.
	dec     [LoopCount]  		;otherwise, try until three times.
	mov     ax, [LoopCount]
	cmp     ax, 0 
	jnz     RWStartRF
	jmp     Boot_FailureRF

NextSectorRF:

	add    	[BxPointer], 200H
	inc	[StartLogicalSecNumRF]
	dec	[LoaderSizeWH]
	jnz     RWStartRF		;Load sectors for LocalLoaderSize times.
	JMP     LoadFinishRF
	
Boot_FailureRF:

	mov	ah, 14  
	mov 	al, 'F'
	int    	10h
	
LoadFinishRF:
	mov	[BxPointer],0000h
	mov	[LoopCount],3

	pop	cx	; restore registers 
	pop	dx
	pop	bx
	pop	es
	pop 	ax

	ret 
aoaminilRF	endp	
;***********************************************************************
; StartSec_cl procedure  
;***********************************************************************
StartSec_clRF	proc
	mov	ax, [StartLogicalSecNumRF] ;start to calculate StartPhysicalSecNum 
	mov	bl, 18			;SPSN=(SLSN mod 18)+1
	div	bl			;'and cl, n-1' to implement 'mod cl, n'
	xor	cx, cx 			;18-1=17
	mov	cl, ah			;now we get the starting physical sector
	add	cl, 1			;number in the local track into cl.						
	mov	[SS_clRF], cl
	ret
StartSec_clRF endp	
;***********************************************************************
; Head_dh procedure  
;***********************************************************************
Head_dhRF	proc
					;calcute StartHead=(SLSN/18) mod 2
	mov	ax, [StartLogicalSecNumRF]
	mov	bl, 18
	div	bl
	and	ah, 0
	mov	bl, 2
	div	bl
	mov	dh, ah
	mov	[H_dhRF], dh
	ret
Head_dhRF	endp	
;***********************************************************************
; Track_ch procedure  
;***********************************************************************
Track_chRF	proc
	xor	ax, ax			;calcute StartTrack=SLSN/(18*2)
	mov	ax, [StartLogicalSecNumRF]
	mov	bl, 36
	div	bl
	mov	ch, al
	mov	[T_chRF], ch
	ret
Track_chRF	endp

aoaminilWH        proc 

	sti 
	mov     ax,[LoadOffsetWH]	;set up es for the es:bx reader buffer.
					;for example: 0800h
	mov     es,ax
	mov	ebx, 0

RWStartWH:

	call 	StartSec_clWH		;use current StartLogicalSecNumHD to get 
					;current StartPhysicalSecNum.

	call 	Head_dhWH  		;use current StartLogicalSecNumHD to get 
					;current head number.
					
	call 	Track_chWH		;use current StartLogicalSecNumHD to get 
					;current track number.
	clc

 	mov     bx, BxPointer        	;set up bx for the es:bx reader buffer.

	MOV     dl, DiskDriveWH		;load from harddisk.
	mov	dh, H_dhWH
	mov	cl, SS_clWH	
	mov	ch, T_chWH		

	
	mov     ah, 03h       		;Write one sector at a time
	mov     al, 01h
	int     13H		

        jnc     NextSectorWH		;if not carry, go to load next sector.
	dec     LoopCount  		;otherwise, try until three times.
	mov     ax, LoopCount
	cmp     AX, 0 
	jnz     RWStartWH
	jmp     @@Boot_FailureWH

NextSectorWH:

	add    	BxPointer, 200H
	inc	StartLogicalSecNumWH
	dec	LoaderSizeWH
	jnz     RWStartWH			;Load sectors for LocalLoaderSizeHD times.
	JMP     LoadFinishWH
	
@@Boot_FailureWH:

	mov	ah, 14  
	mov 	al, 'F'
	int    	10h
	
LoadFinishWH:
	mov	[BxPointer],0000h
	mov	[LoopCount],3
       	ret
aoaminilWH endp

;=================================================================================

StartSec_clWH	proc			;this proc make StartPhysicalSecNum into
					;cl.
				
	mov	ax, StartLogicalSecNumWH;start to calculate StartPhysicalSecNum 
	mov	bl, 63			;SPSN=(SLSN mod 63)+1
	div	bl			;'and cl, n-1' to implement 'mod cl, n'
	xor	cx, cx 			;18-1=17
	mov	cl, ah			;now we get the starting physical sector
	add	cl, 1			;number in the local track into cl.						
	mov	SS_clWH, cl
	ret
	
StartSec_clWH	endp

;===============================================================================

Head_dhWH		proc
	
					;calcute StartHead=(SLSN/63) mod 16
	mov	ax, StartLogicalSecNumWH
	mov	bl, 63
	div	bl
	and	ah, 0
	mov	bl, 16
	div	bl
	mov	dh, ah
	
	mov	H_dhWH, dh
	ret
	
Head_dhWH		endp

;===============================================================================

Track_chWH	proc

	xor	ax, ax				;calcute StartTrack=SLSN/(63*16)
	mov	ax, StartLogicalSecNumWH
	mov	bl, 63
	div	bl
	mov	ch, al
	
	xor	ax, ax
	mov	al, ch
	mov	bl, 16
	div	bl
	mov	ch, al

	mov	T_chWH, ch
	ret
Track_chWH	endp

RCodeSeg        ENDS
;===============================================================================
		END 

