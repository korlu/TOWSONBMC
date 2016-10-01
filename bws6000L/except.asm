;*******************************************************************************
;excep.asm file 
; has all exceptions routins 
;*******************************************************************************
PUBLIC 		Other_Begin0, Other_Begin1, Other_Begin2, Other_Begin3, Other_Begin4, Other_Begin5, Other_Begin6	
PUBLIC 		Other_Begin7, Other_Begin10, Other_Begin11, Other_Begin12, Other_Begin13, Other_Begin219, Other_Begin246	
PUBLIC		ExceptionData0, ExceptionData1, ExceptionData2, ExceptionData3, ExceptionData4, ExceptionData5
PUBLIC		ExceptionData6, ExceptionData7, ExceptionData10, ExceptionData11, ExceptionData12, ExceptionData13
PUBLIC		ExceptionData219, ExceptionData246
INCLUDE 	386SCD.INC
INCLUDE 	DCYCLE.INC
INCLUDE  	sharmem.inc 	
;*******************************************************************************
RDataSeg        SEGMENT PARA public USE16 'REALDATA'

ExceptionData0 		dd      ?	; exception data to be available to prcycle 
ExceptionData1 		dd      ?	; exception data to be available to prcycle 
ExceptionData2 		dd      ?	; exception data to be available to prcycle 
ExceptionData3 		dd      ?	; exception data to be available to prcycle 
ExceptionData4 		dd      ?	; exception data to be available to prcycle 
ExceptionData5 		dd      ?	; exception data to be available to prcycle 
ExceptionData6 		dd      ?	; exception data to be available to prcycle 
ExceptionData7 		dd      ?	; exception data to be available to prcycle 
ExceptionData10 	dd      ?	; exception data to be available to prcycle 
ExceptionData11 	dd      ?	; exception data to be available to prcycle 
ExceptionData12 	dd      ?	; exception data to be available to prcycle 
ExceptionData13 	dd      ?	; exception data to be available to prcycle 
ExceptionData219 	dd      ?	; exception data to be available to prcycle 
ExceptionData246 	dd      ?	; exception data to be available to prcycle 
					
RDataSeg	Ends

;*******************************************************************************

RCodeSeg        SEGMENT PARA public USE16 'CODE'
		ASSUME  DS:RDataSeg, CS:RCodeSeg
;===============================================================================
;===============================================================================
Other_Begin0        proc 
		mov     ax,Video_Sel_Loc
		mov     es,ax
		mov     al,'A'                    
		mov     WORD PTR es:[0],ax
		call	PrintReg
		int 0f5h
		jmp     $                    
       		ret
Other_Begin0 endp
;===============================================================================

Other_Begin1        proc 
		mov     ax,Video_Sel_Loc
		mov     es,ax
		mov     al,'B'                    
		mov     WORD PTR es:[1],ax
		call	PrintReg
		int 0f5h
		jmp     $                    
       		ret
Other_Begin1 endp

;===============================================================================
Other_Begin2        proc 
		mov     ax,Video_Sel_Loc
		mov     es,ax
		mov     al,'C'                    
		mov     WORD PTR es:[2],ax
		call	PrintReg
		int 0f5h
		jmp     $                    
       		ret
Other_Begin2 endp
;===============================================================================

Other_Begin3        proc 
		mov     ax,Video_Sel_Loc
		mov     es,ax
		mov     al,'D'                    
		mov     WORD PTR es:[3],ax
		call	PrintReg
		int 0f5h
		jmp     $                    
       		ret
Other_Begin3 endp

;===============================================================================

Other_Begin4        proc 
		mov     ax,Video_Sel_Loc
		mov     es,ax
		mov     al,'E'                    
		mov     WORD PTR es:[4],ax
		call	PrintReg
		int 0f5h
		jmp     $                    
       		ret
Other_Begin4 endp

;===============================================================================


Other_Begin5        proc 
		mov     ax,Video_Sel_Loc
		mov     es,ax
		mov     al,'F'                    
		mov     WORD PTR es:[5],ax
		call	PrintReg
		int 0f5h
		jmp     $                    
       		ret
Other_Begin5 endp

;===============================================================================
Other_Begin6        proc 
		mov     ax,Video_Sel_Loc
		mov     es,ax
		mov     al,'G'                    
		mov     WORD PTR es:[6],ax
		call	PrintReg
		int 0f5h
		jmp     $                    
       		ret
Other_Begin6 endp

;===============================================================================
Other_Begin7        proc 
		mov     ax,Video_Sel_Loc
		mov     es,ax
		mov     al,'H'                    
		mov     WORD PTR es:[7],ax
		call	PrintReg
		int 0f5h
		jmp     $                    
       		ret
Other_Begin7 endp

;===============================================================================
Other_Begin10        proc 
		mov     ax,Video_Sel_Loc
		mov     es,ax
		mov     al,'I'                    
		mov     WORD PTR es:[10],ax
		call	PrintReg
		int 0f5h
		jmp     $                    
       		ret
Other_Begin10 endp

;===============================================================================
Other_Begin11        proc 
		mov     ax,Video_Sel_Loc
		mov     es,ax
		mov     al,'J'                    
		mov     WORD PTR es:[11],ax
		call	PrintReg
		int 0f5h
		jmp     $                    
       		ret
Other_Begin11 endp

;===============================================================================
Other_Begin12        proc 
		mov     ax,Video_Sel_Loc
		mov     es,ax
		mov     al,'K'                    
		mov     WORD PTR es:[12],ax
		call	PrintReg
		int 0f5h
		jmp     $                    
       		ret
Other_Begin12 endp

;===============================================================================
Other_Begin13        proc 
		mov     ax,Video_Sel_Loc
		mov     es,ax
		mov     al,'L'                    
		mov     WORD PTR es:[13],ax
		call	PrintReg
		int 0f5h
		jmp     $                    
       		ret
Other_Begin13 endp

;===============================================================================
Other_Begin219        proc 
		mov     ax,Video_Sel_Loc
		mov     es,ax
		mov     al,'M'                    
		mov     WORD PTR es:[16],ax
		call	PrintReg
		int 0f5h
		jmp     $                    
       		ret
Other_Begin219 endp

;===============================================================================
Other_Begin246        proc 
		mov     ax,Video_Sel_Loc
		mov     es,ax
		mov     al,'N'                    
		mov     WORD PTR es:[246],ax
		call	PrintReg
		int 0f5h
		jmp     $                    
       		ret
Other_Begin246 endp
;===============================================================================
PrintReg        proc 
        	mov ebx, 2400  ; print eax  
		int 0fdh
		mov eax, 0
		mov ax, cs 
		mov ebx, 2580  ; print cs    
		int 0fdh
		mov ax, ds 
		mov ebx, 2600  ; print ds    
		int 0fdh
		mov ax, ss 
		mov ebx, 2620  ; print ss    
		int 0fdh
		mov ax, es 
		mov ebx, 2640  ; print es    
		int 0fdh
		mov ax, fs 
		mov ebx, 2660  ; print fs    
		int 0fdh
		mov ax, gs 
		mov ebx, 2680  ; print gs    
		int 0fdh
		mov eax, esp 
		mov ebx, 2720  ; print esp    
		int 0fdh
		mov eax, ebp 
		mov ebx, 2740  ; print ebp    
		int 0fdh
		sgdt es:[20]   ; store SGDT 
		mov eax, es:[22] 
		mov ebx, 2760  ; print GDT     
		int 0fdh
PrintReg endp

;===============================================================================
RCodeSeg        ENDS
;===============================================================================
		END 
