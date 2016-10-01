;*********************************************************
;atoh.asm 
; reads four ascii characters and checks for hex character 
;    validation 
; the hex values or binary code of hex value is stored in 
;   Temp (memory location)
;********************************************************
public ASCII2HEX
public	FourBytes2, Temp

INCLUDE 	386SCD.INC
INCLUDE 	DCYCLE.INC
;**********************************************************

RDataSeg	SEGMENT	PARA	public	USE16	'REALDATA'

FourBytes	db	'0000' ; 4 bytes 
FourBytes2	db	'0000' ; 4 bytes 
Temp		db	'00'   ;2 bytes 
counter		db	4

RDataSeg	ends

;**********************************************************

RCodeSeg	SEGMENT	PARA	public	USE16	'CODE'
		ASSUME	DS:RDataSeg, CS:RCodeSeg

;**********************************************************

ASCII2HEX	proc

	push	ax
	push	bp
	mov	bp,3

InputNext:
	
	mov	ah,10h
	int	16h  ;read a character 
	mov	ah,14
	int	10h  ; echo the character to the screen
	
	cmp	al,'0' ; is it below 0 character then it is not valid hex  
	jb	LAB1

	mov	ah,al
	sub	ah,'0'
	cmp	al,'9'
	jbe	LAB2

	cmp	al,'A'
	jb	LAB1
	mov	ah,al
	sub	ah,'A' -10
	cmp	al,'F'
	jbe	LAB2

	cmp	al,'a'
	jb	LAB1
	mov	ah,al
	sub	ah,'a'-10
	cmp	al,'f'
	jbe	LAB2

LAB1:
	
	mov	ah,-1

LAB2:

	mov	FourBytes2[bp],ah
	dec	bp
	dec	counter
	jnz	InputNext

	mov	al,FourBytes2[1]
	shl	al,4
	add	al,FourBytes2[0]
	mov	Temp[0],al

	mov	al,FourBytes2[3]
	shl	al,4
	add	al,FourBytes2[2]
	mov	Temp[1],al

	pop	bp
	pop	ax
	
	mov	counter,4
	ret

ASCII2HEX	endp

RCodeSeg	ends
		end
	









