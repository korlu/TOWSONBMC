;*******************************************************************************
;prload1.asm
; this call loads only one sector from floppy disk 
;   into location 8400h, it also updates all the 
;   parameters needed to load next sector 
;*******************************************************************************
PUBLIC 		aoaminil1	
public		BxPointer1,LoaderSize1m, StartLogicalSecNum1m,SS_cl1,T_ch1,H_dh1
;EXTRN		LoaderSize:word, StartLogicalSecNum:word

INCLUDE 	386SCD.INC
INCLUDE 	DCYCLE.INC
;*******************************************************************************

RDataSeg        SEGMENT PARA public USE16 'REALDATA'


DiskDrive1		db	0h	;initialize the number of disk drive.
					;later we can get this number from 
					;keyboard!!!!!!!!!!!!!!!!!!!!!!!!!!!

LoopCount1      	dd      3	;try three times

BxPointer1      	dd      0000h  	;to keep offset for next

LoaderSize1m   		dw      40 	;initialize the LoaderSize, how many
					;sectors we want to load. later 
					;we can get this number from 
					;keyboard!!!!!!!!!!!!!!!!!!!!!!!!!!!
					
StartLogicalSecNum1m	dw	33	;initialize the StartLogicalSecNum.
					;later we can get this number from 
					;keyboard!!!!!!!!!!!!!!!!!!!!!!!!!!!

					;now start from 33-2879 
					;(could be 0-2879)
					
					;StartPhysicalSecNum start from 1-18
					;StartTrack start from 0-79
					;StartHead 0 or 1
					
					;once we have this value, we can get 
					;the value of cl, ch and dh.


SS_cl1			db	0	;Start sector number in cl
T_ch1			db	0	;track in ch
H_dh1			db	0	;head in dh
dapa struc
			db 00h
            db 00h				        ; Packet size 16 bytes, this data structure size 
count		db 0				    ; Block count (no of sectors)
			db 00h
off			dw 0000h			    ; Offset of buffer (memory location for destination)
segmnt		dw 0000h				; Segment of buffer (seg:offset)
lbal		dd 0000000h			; LBA (LSW) sectors 
lbam		dd 0				    ; LBA (MSW)
dapa ends
db 'F'
db 'A'
db 'C'
db 'K'
db 'E'
db 'R'
db 'S'
;RKK modify the start sector as needed 
dapa1 dapa<10h,00h,1,00h,8400h,0000h,00000240h,0> ;TEST.EXE start sector 
;db 8 dup('H')
db 0
DataAddr dw 37B1h				
RDataSeg	Ends

;*******************************************************************************

RCodeSeg        SEGMENT PARA public USE16 'CODE'
		ASSUME  DS:RDataSeg, CS:RCodeSeg
;===============================================================================
aoaminil1        proc 

	sti 
	mov     ax,0860h		;set up es for shared memory  
    mov     es, ax 
    mov     ebx, 130h 
    mov     eax, DWORD PTR es:[ebx]  
    cmp     eax, 0 
    JE      notRTC
    mov     eax, 0
    mov     edx, 0
    mov     ah, 02h
    int     1ah
    mov     ax, cx 
    shl     eax, 16
    or      eax, edx
    mov     ebx, 120h 
    mov     DWORD PTR es:[ebx], eax 
    mov     eax, 0
    mov     edx, 0
    mov     ah, 04h
    int     1ah
    mov     ax, cx 
    shl     eax, 16
    or      eax, edx
    mov     ebx, 124h 
    mov     DWORD PTR es:[ebx], eax 
    ret
    notRTC: 

	mov     ax,0840h		;set up es for the es:bx reader buffer.
	mov     es,ax
	mov	ebx, 0

RWStart1:

	;call 	StartSec_cl1		;use current StartLogicalSecNum to get 
					;current StartPhysicalSecNum.

	;call 	Head_dh1 		;use current StartLogicalSecNum to get 
					;current head number.
					
	;call 	Track_ch1		;use current StartLogicalSecNum to get 
					;current track number.
	clc

 	mov     bx, 0h        	;set up bx for the es:bx reader buffer.

	;MOV     dl, DiskDrive1		;load from floppy disk.
	;mov	dh, H_dh1
	;mov	cl, SS_cl1	
	;mov	ch, T_ch1		

	
	;mov al, 'R' 
	;mov ah, 14
	;int 10h 
	
	;mov     ah, 02h       		;Read one sector at a time
	;mov     al, 01h
	mov di, offset dapa1
	;mov ax, seg dapa
	mov si,di
	mov dl,80h
	mov ah,42h
	int     13H	
	jc errorReading	
	;jmp PrintMem37B1
	;mov al, 'J'
	;mov ah, 14
	;int 10h
	
	jnc     NextSector		;if not carry, go to load next sector.
	dec     LoopCount1  		;otherwise, try until three times.
	mov     eax, LoopCount1
	cmp     eax, 0 
	jnz     RWStart1
	jmp     @@Boot_Failure
	
errorReading:	
	mov al, 'L' 
	mov ah, 14
	int 10h
	

   ;     jnc     NextSector		;if not carry, go to load next sector.
;	dec     LoopCount1  		;otherwise, try until three times.
;	mov     eax, LoopCount1
;	cmp     eax, 0 
	jnz     RWStart1
	jmp     @@Boot_Failure

NextSector:

	inc	StartLogicalSecNum1m
	inc dapa1.lbal
	dec	LoaderSize1m
	JMP     LoadFinish
PrintMem37b1:
		mov ax, 0
		mov ds, ax
		mov	bx, 8400h
		mov cx, 37B1h
		mov dx, 00h
loop10:
		;mov al, [bx]
		inc dx
		;mov word [bx], word cx
		mov al, byte ptr [bx]
		push bx
		mov bh, 0
		mov bl, 7
		mov ah, 14
		int 10h
		;mov	al, 'F'
        ;mov ah, 14
        ;int 10h
        pop bx
        inc bx
		cmp dx, 512
		jne loop10

PrintMem7C00:
		mov ax, 0
		mov ds, ax
		;mov	dword ptr [bx], 0600h
		mov cx, 7000h
		mov dx, 00h
;mov ax, 0h
;mov es, ax
;mov bx, 9000h
;mov cx, 512 
;loopx: 
;   mov ax, word ptr es:[bx]
;   mov ah, 14
;   int 10h
   ;mov	al, 'Y'
   ;mov ah, 14
   ;int 10h   
 ;  inc bx 
 ;  loop loopx
	mov di, offset DataAddr;9000h
loop1:
		;mov al, [bx]
		inc dx
		inc cx
		;mov word [bx], word cx
		mov bx, dx
		mov ax, word ptr [di]
		push bx
		mov bh, 0
		mov bl, 7
		mov ah, 14
		int 10h
		inc di
		mov	al, 'K'
        mov ah, 14
        int 10h        
        pop bx
		cmp dx, 100
		jne loop1
		mov ah, 10h
		int 16h
hang:
	jmp hang			
@@Boot_Failure:

	mov	ah, 14  
	mov 	al, 'F'
	int    	10h
	
LoadFinish:
	mov	[LoopCount1],3
       	ret
aoaminil1 endp

;=================================================================================

StartSec_cl1	proc			;this proc make StartPhysicalSecNum into
					;cl.
				
	mov	ax, StartLogicalSecNum1m	;start to calculate StartPhysicalSecNum 
	mov	bl, 18			;SPSN=(SLSN mod 18)+1
	div	bl			;'and cl, n-1' to implement 'mod cl, n'
	xor	cx, cx 			;18-1=17
	mov	cl, ah			;now we get the starting physical sector
	add	cl, 1			;number in the local track into cl.						
	mov	SS_cl1, cl
	ret
	
StartSec_cl1	endp

;===============================================================================

Head_dh1	proc
	
					;calcute StartHead=(SLSN/18) mod 2
	mov	ax, StartLogicalSecNum1m
	mov	bl, 18
	div	bl
	and	ah, 0
	mov	bl, 2
	div	bl
	mov	dh, ah
	
	mov	H_dh1, dh
	ret
	
Head_dh1	endp

;===============================================================================

Track_ch1	proc

	xor	ax, ax				;calcute StartTrack=SLSN/(18*2)
	mov	ax, StartLogicalSecNum1m
	mov	bl, 36
	div	bl
	mov	ch, al

	mov	T_ch1, ch
	ret
Track_ch1	endp

RCodeSeg        ENDS
;===============================================================================
		END 
