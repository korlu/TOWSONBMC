;********************************************************************************************
;diskrw1.asm 							   
;1. The program first checks the drive.
;2. If the drive is good,and the sector is good, the message will be written to the sector.
;3. If the sector is bad, It will be formatted and then the write operation
;   will be attempted again.
;4. If written successfully, Then the message will be read into a buffer and 
;   displayed to the screen.						   
;5. If the write operation fails, the program will exit with an appropriate message
;   compiler : masm6.11   		   
;********************************************************************************************

cseg       segment para 'code'
        	assume cs:cseg,ds:cseg,es:cseg
	org 100

begin:	jmp  main
	readin 	db	512   dup('    ')			;input buffer
   	writeout	db	'message to display : This is for 519 project!'       
	
	
;the CHS address we will use in the program, 
 
	curtrack        db       00h
        cursec          db       01h 
        head            db       00h                   ;head 
	diskDriver	db 	 81h			;floppy A(00), Drive C (80) Drive D(81)	

;the value will be added later by 'formatsector' roution

	formatpart	dw	?


;some display message list as follows:

	writemsg 	db	'***write Operation Failed***$'
	readmsg		db	'****read operation failed***$'
	wsucc		db	'****write operation successfull****$'
	rsucc		db	'****read operation successfull****$'	
	errormsg	db	'****bad sector****$'	
	formatsucc	db	'****format successfull****$'
	formaterror	db	'*******format failed*******$'
	gooddriver	db	'****drive is good****$'
	responderror	db	'**drive response error**$'
	correctmsg	db	'****Sector is good****$'
	addnotfound	db	'Address on disk not found$'
	w_protectmsg	db	'**disk write protected**$'
	crlf		db	0dh,0ah,'$'

;two flags for read/write routine

	dgood           db      0   ; Flag for good drive, 0 = drive is good, else bad.
        endcde		db	0		
	w_endcde	db	0

;main procedure begins here 

main	proc	near
	
	mov	ax,cseg			;set cs,ds,es to code segment
	mov 	ds,ax	
	mov 	es,ax
	call 	checkdriver      	;check the diskdrive 
        cmp     dgood,0
        jnz     exit                    ; Drive is not good, so just exit
	call 	writes                  ;write 'writeout' to  diskDriver ,head ,track  ,sector  
	
	cmp	w_endcde,0		;if w_endcde !=0, write opeation failed,exit the program
	jnz	exit                
	mov	ah,40h			;otherwise
					;display the message '****write operation successfull****$'
					;when displaying a message, we should use 'int 21h'
					;ah=40 print messsage  
					;bx= file handle (01 means screen)     
					;cx = number of bytes to write           
					;ds:dx = pointer to buffer 
	mov 	bx,01			
	mov	cx,36		        
	lea	dx,wsucc
	int	21h
	call	inputcrlf		;insert "enter" like c++ '\n'

	call	reads		        ;read from diskDriver  ,head ,track  ,sector  to 'readin'
	cmp	endcde,0		;if endcde!=0, read error ,exit the program
	jnz	exit
					;otherwise
					;display the message '****read operation successfull****$'
	mov	ah,40h	                ; display
	mov 	bx,01                   ;file handle for screen.
	mov	cx,35                   ; 37 characters
	lea	dx,rsucc
	int	21h
	call	inputcrlf	

	call	disps			;display the message read from the buffer 'readin'    
        call    inputcrlf

        add     head,11h                ; incrementing head by 11h
        cmp     head,0ffh               
        je      chnge                   ; Now trying to write to invalid sector after which we will exit.
        jmp     main
exit:  	mov  	ax,4c00h		;End of program. Quit.
	int 	21h
	ret
main 	endp

	; adjust the identifiers such that we now try to write to (last sector+1)
chnge    proc near
      
    mov  al,0ffh     
    mov  cursec,al
    mov  al,10h
    mov  curtrack,al
    jmp main            ; go back to main

chnge endp
			        ;check diskDriver
checkdriver	proc	near
	mov	dl,diskdriver 		;diskdriver
	mov	ah,01h               
	int	13h			

	cmp	ah,00h  		;ah=0, check driverno error
	je	g_driver         

	cmp	ah,80h
	je	r_error
	
g_driver:				;display '****good driver****$'
	mov	ah,40h
	mov 	bx,01
	mov	cx,20
	lea	dx,gooddriver
	int	21h
	call 	inputcrlf
	jmp	exit1

r_error:				;display '**drive response error**$'
	mov	ah,40h
	mov 	bx,01
	mov	cx,24
	lea	dx,responderror
	int	21h
	call 	inputcrlf
        mov     dgood,1           ; set the flad to exit from the program as the drive is unavailable.
	jmp	exit1             ;If the drive has some error then just exit, we need not go further.

;omit other errors

exit1:	ret

checkdriver endp


					;from write buffer to floppy head ,track ,sector
writes	proc	near
					;use "int 13h"
					;function ah=03 means write to an address
					;cx=current track/sector
					;dh= head number
					;dl = disk driver
					;bx point to message address 
	mov	al,01			
	mov	ah,03
	mov     ch,curtrack         ;track 
        mov     cl,cursec           ;sector                      
	mov	dh,head	
	mov	dl,diskDriver
	lea	bx,writeout
	int	13h

	cmp	ah,0			;ah=0 write no error
	je	w_incrt
	mov	w_endcde,01		;set w_endcde=01, write error
		
	cmp	ah,02h			;ah=02h, address error
	je	adderror

	cmp	ah,03h			;ah=03, write protected
	je	w_protect

	cmp	ah,04h            	;ah=04h, sector error
	je	errorsector	


adderror: 		   		 ;display 'Address on disk not found$'
	mov	ah,40h
	mov 	bx,01
	mov	cx,26
	lea	dx,addnotfound
	int	21h
	call 	inputcrlf
	call	errout
	jmp	w_incrt

w_protect:				 ;display '**disk write protected**$'
	mov	ah,40h
	mov 	bx,01
	mov	cx,25
	lea	dx,w_protectmsg
	int	21h
	call 	inputcrlf
	call	errout
	jmp	w_incrt
				
errorsector:				;display '****bad sector****$'
	mov	ah,40h
	mov 	bx,01
	mov	cx,21
	lea	dx,errormsg
	int	21h
	call	inputcrlf
	call	errout
	call 	formatsector		;if the sector bad ,call 'formatsector' roution
	jmp	w_incrt
w_incrt:	
	ret
writes     endp


					;if the sector is damaged,try to format 

;I am not sure if this part is correct or not , because everytime the sector is good when I tried.
					

formatsector	proc	near
					;use 'int 13h' ah=05 function to format the bad address
					;how to set register ,see 'writes' roution
					;wset offset 'formatpart'  as T/H/S/B
					;T=cylinder number
					;H=head number
					;S=sector number
					;B=bytes per sector


;I am not sure this part is correct or not , because everytime the the sector is good when I tried.
					

	mov	dl,diskDriver	
	mov     ch,curtrack         ;track 
        mov     cl,cursec           ;sector                      
	mov	dh,head	

	mov	ax,0102h		;always format one sector, and every sector have 512bytes
	mov	es:[formatpart],ax	
	mov	ah,ch
	and	al,dh
	mov	es:[formatpart+1],ax     
	lea	bx,formatpart

	mov 	ah,05h
	int	13h
	
	cmp	ah,0			;if ah=0 ,format succeed
	je	exit3
	jne	exit4
exit3:	mov	ah,40h			;format succeeded ,display '****format successfull****$'
	mov 	bx,01
	mov	cx,27
	lea	dx,formatsucc
	int	21h
	call	inputcrlf
	mov	w_endcde,00		
	call	writes			;call routine 'writes' again
	ret
exit4:	mov	ah,40h			;format failed ,display '****format failed****$'
	mov 	bx,01
	mov	cx,28
	lea	dx,formaterror
	int	21h
	call	inputcrlf
	ret
formatsector	endp	

                                    	 ;read message from diskDriver ,head ,track  ,sector  to readin buffer
reads	proc 	near
					;use 'int 13h' ah=02h function to read message from address
					;how to set register ,see 'writes' roution
	mov	al,01
	mov	ah,02
	lea	bx,readin
	mov     ch,curtrack         ;track 
        mov     cl,cursec           ;sector                      
	mov	dh,head	
	mov 	dl,diskDriver                     
	int 	13h
	cmp	ah,0
	jz	incrt
	mov	endcde,01		;set endcde=01 ,means read error
	call	errin
incrt:	
	ret
reads	endp

					;display 'readin' buffer 
disps	proc	near
	mov	ah,40h
	mov 	bx,01
	mov	cx,45
	lea	dx,readin
	int	21h
	ret
disps 	endp
			
					;routine for insert cr,lf
inputcrlf	proc	near
	mov	ah,40h
	mov	bx,01
	mov	cx,3
	lea	dx,crlf
	int 	21h
	ret
inputcrlf	endp

					;display '***write operation failed***$' roution
errout 	proc	near
	mov	ah,40h
	mov 	bx,01
	mov	cx,29
	lea	dx,writemsg
	int 	21h
	call	inputcrlf
	ret
errout	endp

					;display '****read operation failed***$'
errin	proc 	near
	mov	ah,40h
	mov 	bx,01
	mov	cx,29
	lea	dx,readmsg
	int 	21h
	call	inputcrlf
	ret
errin	endp
cseg	ends
	end 	begin
