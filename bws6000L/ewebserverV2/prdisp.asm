;----------------------------------------------------------------------------
;prdisp.asm
;----------------------------------------------------------------------------
PUBLIC 	AOADisp	
EXTRN		aoaminil:near
EXTRN		ASCII2HEX:near  ; ASCII characters are read and converted into hex values in atoh.asm
public	LoadOffset1,LoadOffset2,LoaderSize1,LoaderSize2,StartLogicalSecNum1,StartLogicalSecNum2
public	ApplNum,JumpOffset1,JumpOffset2,LoadFlag
EXTRN		SelectionArray:BYTE,LoadArray:BYTE,RunArray:BYTE
EXTRN		LoaderSize:word,StartLogicalSecNum:word,BxPointer1:dword
EXTRN		Temp:byte,MemoryOffset:dword,MemFlag:byte
EXTRN		RunFlag:byte
;The offset read from the keyboard lower and higher 16 bits in hex 
; are converted into hex and stored in 4 byte MemoryOffset 
;  and used for memory dump
;----------------------------------------------------------------------------
INCLUDE 	386SCD.INC
INCLUDE 	DCYCLE.INC
;----------------------------------------------------------------------------
RDataSeg        SEGMENT PARA public USE16 'REALDATA'

prompt1 DB	13,10,'Press any key to continue: ',13,10,0
;----------------------------------------------------------------------------
;----------------------------------------------------------------------------
;===============================================================================
MenuMsg db 13,10,'                         AOA INTERFACE MENU ',13,10,0
UnivMsg	db 13,10,'                   Dept Of COSC, TOWSON UNIVERESITY',13,10,0
ApplMsg db '                     1. Choose an Application',13,10,0
LoadMsg	db '                     2. Load the Application ',13,10,0
RunMsg	db '                     3. Run the Application  ',13,10,0
CpuMsg	db '                     4. Run Editor',13,10,0
MemMsg	db '                     5. Search for string        ',13,10,0
A1Msg	db '                     6. For Future usage     ',13,10,0
A2Msg	db '                     7. For Future usage     ',13,10,0
A3Msg	db '                     8. For Future usage     ',13,10,0
A4Msg	db '                     9. Memory Dump          ',13,10,0
ExitMsg	db '                     0. Exit from AOA        ',13,10,0
;----------------------------------------------------------------------------
;==============================================================================
MenuMsg1 db 13,10,'                       AOA APPLICATION MENU ',13,10,0
UnivMsg1 db 13,10,'                 Dept Of COSC, TOWSON UNIVERESITY',13,10,0
App1Msg db '                    1. Application 1    ',13,10,0
App2Msg db '                    2. Application 2    ',13,10,0
App0Msg db '                    0. Exit from this menu        ',13,10,0
;==============================================================================
;User prompt messeges

Prmt1Msg  db 13,10,'         Select from the above menu:  ',0
Prmt2Msg  db 13,10,'              This service is not yet available !',13,10,0
Prmt3Msg  db 13,10,'         Enter the number of Sectors to load :',0
Prmt31Msg  db 13,10,'         Enter the starting Sector Number to load :',0
Prmt4Msg  db 13,10,'         Exiting from AOA...!!!',0
Prmt5Msg  db 13,10,'                            ',0
Prmt6Msg  db 13,10,'         Your parameters r saved u can now load the program',13,10,0
Prmt7Msg  db 13,10,'         You have loaded the program sucessfully ',13,10,0
Prmt8Msg  db 13,10,'         Ur now ready to run the program       ',13,10,0
Prmt9Msg  db 13,10,'         Enter 2 to load the application '
Prmt10Msg db 13,10,'                          ',13,10,0
Prmt11Msg db 13,10,'          Insert the Hello world application disk',13,10,0
Prmt12Msg db 13,10,'          Insert the Bubble sort application disk',13,10,0
Prmt20Msg db 13,10,'          U have selected to exit from this menu',13,10,0
Prmt21Msg db 13,10,'          Which application you want to load?',13,10,0
Prmt22Msg db 13,10,'          1. Application 1',13,10,0
Prmt23Msg db 13,10,'          2. Application 2',13,10,0
PrmtLBMsg db 13,10,'          Enter the Load Offset address:',13,10,0
PrmtLA1Msg db 13,10,'          Enter the lower 16 bit offset:',0
PrmtLA2Msg db 13,10,'          Enter the higher 16 bit offset:',0
PrmtSAMsg db 13,10,'          Enter the code segment offset:',0
PrmtRunMsg db 13,10,'          Which application you want to run?',13,10,0

;--------------------------------------------------------
HelloWorld1Msg db 13,10,'          Now invoking application',0
MemoryDump1Msg db 13,10,'         Enter the Memory address to be printed: ',0

;==============================================================================
;Error messeges

Err1Msg db 13,10,'      ERR: U have entered an invalid option ...try again',13,10,0
Err2Msg db 13,'         ERR: U must select an application before u can load it',13,10,0
Err3Msg db 13,'         ERR: U must load an application before u can run it',13,10,0
Err4Msg db 13,10,'                                         ',13,10,0
Err5Msg db 13,10,'                                         ',13,10,0		
temp1		dw	0000h
LoadOffset1	dd	00010000h	
LoadOffset2	dd	5678h	
LoadOffset3	dd	?
ApplNum		db      '1'	
LoaderSize1	dw	130h  ; size of test.exe
;LoaderSize1	dw	38h  ; size of test.exe
LoaderSize2	dw	?
LoaderSize3	dw	?
StartLogicalSecNum1	dw	4eh  ;start of test.exe file 
StartLogicalSecNum2	dw	?
StartLogicalSecNum3	dw	?
JumpOffset1	dw	1000h
JumpOffset2	dw      2222h	
JumpOffset3	dw      3333h	
ParamFlag	db      '1'	
LoadFlag	db      1h	
LoaderAddress	dw	0000h,0820h
LoadingDone	db      0h	

RDataSeg	Ends
;----------------------------------------------------------------------------
RCodeSeg        SEGMENT PARA public USE16 'CODE'
		ASSUME  CS:RCodeSeg,ds:RDataSeg

;----------------------------------------------------------------------------
AOADisp PROC 

	PUSH	eax
	PUSH	esi
	PUSH 	ecx
	PUSH	edi

;=======================================
TRY_A:
	CALL    ClearScreen
LIST_A:
        ;***************************
	CALL    MAIN_MENU               	;Displays AOA Main Menu
        ;***************************
	
	JMP	SUCESS_A

LOADER: 
	call	ClearScreen
	call	ResetPointer
	MOV     ESI, OFFSET Prmt21Msg
	CALL     WRITESTRING
	MOV     ESI, OFFSET Prmt22Msg
	CALL     WRITESTRING
	MOV     ESI, OFFSET Prmt23Msg
	CALL     WRITESTRING
	MOV     ESI, OFFSET Prmt1Msg
	CALL     WRITESTRING

	;CALL	GETKEYFORMENU  ;hard coded RKK
	mov 	al, '1'

	MOV	[ApplNum],al
	cmp	al,[ParamFlag]
	JE	Loading_Ok
	JMP	LIST_A
Loading_Ok:
	;mov	[LoadFlag],1  RKK hard coded 
	;push eax 
	;mov al, 'K'
	;mov ah, 14
	;int 10h
	;mov ah, 10h
	;int 16h
	;pop eax
	JMP	EXIT	

RUNNER:
	cmp	[RunFlag],0
	jne	EXIT
	jmp	LIST_A
	
Search:
	mov	[MemFlag],5
	jmp	EXIT
	JMP	LIST_A

ERROR_A1:                                       ;Gives error messages for invalid
	CALL    ClearScreen            	;user inputs (other than 30h-39h)
	MOV     ESI, OFFSET Err1MSg             ;And takes back to AOA Main Menu
	CALL     WRITESTRING
	CALL     NEWLINE 
	JMP      LIST_A  
ERROR_A2:                                       ;U cannot run an application before
	CALL    ClearScreen            	;U have selected an application 
	MOV     ESI, OFFSET Err2Msg             ;Displays appropriate Msg and
	CALL     WRITESTRING             	;Display the AOA Main Menu
	CALL     NEWLINE 
	JMP      LIST_A
RealModeLoader:
	MOV     ESI, OFFSET Prmt11Msg
	CALL     WRITESTRING
	MOV     ESI, OFFSET Prmt3Msg
	CALL     WRITESTRING
	;CALL	ASCII2HEX           ;RKK hardcoded 

	;mov	ax,word ptr Temp
	;mov	[LoaderSize],ax
	;0021 is hardcoded
	;MOV     ESI, OFFSET Prmt31Msg
	;CALL     WRITESTRING
	;CALL	ASCII2HEX
	;mov	ax,word ptr Temp
	mov	ax, 0021h
	mov	[StartLogicalSecNum],ax
	
	call	aoaminil

	mov	al,'L'
	mov	ah,14
	int	10h
	mov	ah,10h
	int	16h
	call	ClearScreen
	call	ResetPointer
;_________________________________________________________
; The following instruction jumps to execute EDITOR program 
;  that is loaded at 8200h 
; After the editor runs, it must return to the next instruction 
; after jump 
; make sure you check the offset of this next instruction in 
;  the prdisp.lst file and add that value to starting address 
;  of the aoadisp routine in the exe file 
; for example 
;  starting address of prdisp is 2CF0 
;  offset of the next instruction after this JMP is 00C4
;  then 600h + 00C4 + 2CF0 = 33B4H 
; 33B4 must be initialized in the return address in e.asm file 
;_________________________________________________________
	JMP     DWORD PTR [LoaderAddress] ; JUMP to Editor Program 

;restore the DS to RDataSeg and add 80h so that the offsets will be correct.
	push	eax
	mov	al, 'M'
	mov	ah, 14
	int	10h
	mov	ah,10h
	int 	16h
	pop	eax
	
	mov	ax,RDataSeg
	add	ax,80h
	mov	ds,ax
	
	mov	eax, 0
	mov	ax, 7beeh
	mov	esp, eax

	call	ClearScreen

	MOV     ESI, OFFSET prompt1
	CALL     WRITESTRING
	mov	ah,10h
	int	16h
	
	JMP      LIST_A
	JMP	EXIT
ERROR_A4:                                       ;These services are not yet available in the AOA interface.
	MOV     ESI, OFFSET Prmt2MSg            ;Gives appropriate Msg(For Future Use)
	CALL     WRITESTRING             	;Takes back to AOA Main Menu    
	nop
	MOV     ESI, OFFSET prompt1
	CALL     WRITESTRING
	mov	ah,10h
	int	16h
	
	JMP      LIST_A

QUIT:                                                           
	CALL     NEWLINE                         
	MOV     ESI, OFFSET Prmt4Msg
	CALL     WRITESTRING
	JMP      EXIT                    	;by command interpretter and Quits the AOA interface

SUCESS_A:
	CALL 	GETKEYFORMENU 
	CMP     AL,30H                          ;Compares the validity of user input
	JB       ERROR_A1               	;valid input 0-9 (30h-39h)
	CMP     AL,39H                          ;and drives the control to appropriate 
	JA       ERROR_A1               	;labels in the code
	CMP     AL,30H                          
	JE       QUIT
	CMP     AL,31H
	JE       TRY_B
	CMP     AL,32H
	JE	LOADER
	CMP     AL,33H
	JE      RUNNER 
	CMP     AL,39H
	JAE      MEMORYDUMP1
	CMP     AL,34H
	JE      RealModeLoader
	CMP     AL,35H
	je	Search
	cmp	al,36h
	JAE      ERROR_A4
MEMORYDUMP1:
	CALL    ClearScreen            
	CALL    ResetPointer
	
	NewLineM
	NewLineM
	NewLineM
	
	MOV     ESI, OFFSET PrmtLA1Msg	;read lower 16 bits offset in hex for memory dump
	CALL     WRITESTRING
	CALL	ASCII2HEX ; chars read in ascii and converted into hex and placed in Temp 
	mov	ax,word ptr Temp
	;swap 16 bits
	mov	[temp1],ax
	MOV     ESI, OFFSET PrmtLA2Msg	;read higher 16 bits offset for memory dump 
	CALL    WRITESTRING
	CALL	ASCII2HEX
	mov	eax,0
	mov	ax,word ptr Temp
	rol	eax,16
	mov	ax,temp1
	mov	[MemoryOffset],eax  ; MemoryOffset contains 4 byte offset 
	mov	[MemFlag],1         ; flag is set to indicate that 
	jmp	EXIT
	JMP	LIST_A
;====================================================================================

;The labels suffexed with '_B' like "TRY_B" correspond to the AOA Application Menu

;====================================================================================
ERROR_B1:
	CALL    ClearScreen
	MOV     ESI, OFFSET Err1MSg
	CALL     WRITESTRING
	CALL     NEWLINE
	JMP      LIST_B
TRY_B:                                 ;RKK this is for load application 
	CALL    ClearScreen
	CALL    ResetPointer
LIST_B: 
	CALL     APPL_MENU
	CALL     GETKEYFORMENU
CHECK_B:
	CMP     AL,30H
	JB       ERROR_B1
	CMP     AL,39H
	JA       ERROR_B1
SUCESS_B:                                       ;Compares user input and jmps  
						;to apppropriate labels 
	CMP     AL,31H
	JE       APP_B1
	CMP     AL,32H
	JE       APP_B2
	CMP     AL,30H
	JE       APP_B0

;These comments apply to the labels APP_B1 to APP_B2:
;If the input is between 1-9, the application from the Menu 
;is selected and transfers control to the label PARAMETER_B
APP_B1:                                         
	MOV     ESI, OFFSET Prmt11Msg
	CALL     WRITESTRING
	MOV     ESI, OFFSET Prmt3Msg
	CALL     WRITESTRING
	;CALL	ASCII2HEX
	;mov	ax,word ptr Temp
	;mov	[LoaderSize1],ax  RKK hard coded 

	;0021 is hardcoded
	;MOV     ESI, OFFSET Prmt31Msg
	;CALL     WRITESTRING
	;CALL	ASCII2HEX
	;mov	ax,word ptr Temp
	;mov	ax, 0021h
	;mov	[StartLogicalSecNum1],ax  RKK hardcoded

	;0000 is hardcoded
	;MOV     ESI, OFFSET PrmtLA1Msg	;read lower 16 bits in hex offset address for app1
	;CALL     WRITESTRING
	;CALL	ASCII2HEX
	;mov	ax,word ptr Temp
	mov	ax, 0000h
	;swap 16 bits
	mov	[temp1],ax

	;0001 is hardcoded
	;MOV     ESI, OFFSET PrmtLA2Msg	;read higher 16 bits in hex offset address for app1
	;CALL    WRITESTRING
	;CALL	ASCII2HEX
	mov	eax,0
	;mov	ax,word ptr Temp
	mov	ax, 0001h
	rol	eax,16
	mov	ax,temp1
	;mov	[LoadOffset1],eax          RKK loaded directly
	
	;1000h is hardcoded
	;MOV     ESI, OFFSET PrmtSAMsg
	;CALL     WRITESTRING
	;CALL	ASCII2HEX
	;mov	ax,word ptr Temp
	mov	ax, 1000h
	;mov	[JumpOffset1],ax	  RKK hardcoded 
	mov	ParamFlag,'1'
	jmp	LIST_A
	
APP_B2:
	MOV     ESI, OFFSET Prmt12Msg
	CALL     WRITESTRING
	MOV     ESI, OFFSET Prmt3Msg
	CALL     WRITESTRING
	CALL	ASCII2HEX
	mov	ax,word ptr Temp
	mov	[LoaderSize2],ax
	;0021 is hardcoded
	;MOV     ESI, OFFSET Prmt31Msg
	;CALL     WRITESTRING
	;CALL	ASCII2HEX
	;mov	ax,word ptr Temp
	mov	ax, 0021h
	mov	[StartLogicalSecNum2],ax

	;0000h is hardcoded
	;MOV     ESI, OFFSET PrmtLA1Msg
	;CALL     WRITESTRING
	;CALL	ASCII2HEX
	;mov	ax,word ptr Temp
	mov	ax, 0000h
	mov	[temp1],ax
	
	;0001h is hardcoded
	;MOV     ESI, OFFSET PrmtLA2Msg	;read higher 16 bits
	;CALL    WRITESTRING
	;CALL	ASCII2HEX
	mov	eax,0
	;mov	ax,word ptr Temp
	mov	ax, 0001h
	rol	eax,16
	mov	ax,temp1
	mov	[LoadOffset2],eax

	;1000h is hardcoded
	;MOV     ESI, OFFSET PrmtSAMsg
	;CALL     WRITESTRING
	;CALL	ASCII2HEX
	;mov	ax,word ptr Temp
	mov	ax, 1000h
	mov	[JumpOffset2],ax	
	mov	ParamFlag,'2'
	jmp	LIST_A
	
APP_B0:                                      ;If the iput is 0, takes back to AOA MainMenu
	MOV     ESI, OFFSET Prmt20Msg
	CALL     WRITESTRING
	MOV     ESI, OFFSET Prmt3Msg
	CALL     WRITESTRING
	JMP      TRY_A

;=========================================================================================

;===================================================================================

EXIT:                                           ;exit to AOA
	CALL    ClearScreen
	CALL    ResetPointer
;----------------------------------------	
	pop	edi
	pop	ecx
	pop	esi
	pop	eax
	RET
	
AOADisp ENDP
;----------------------------------------------------------------------------

;----------------------------------------------------------------------------
APPL_MENU       PROC 
	PUSH	ESI
	CALL 	 ClearScreen	
	CALL	 RESETPOINTER
	MOV     ESI, OFFSET MenuMsg1     
	CALL     WRITESTRING
	CALL     NEWLINE
	MOV     ESI, OFFSET UnivMsg1
	CALL     WRITESTRING
	CALL     NEWLINE
	MOV     ESI, OFFSET App1Msg
	CALL     WRITESTRING
	MOV     ESI, OFFSET App2Msg
	CALL     WRITESTRING
	MOV     ESI, OFFSET App0Msg
	CALL     WRITESTRING
	CALL     NEWLINE 
	MOV     ESI, OFFSET Prmt1Msg
	CALL     WRITESTRING

	POP	ESI
	RET



APPL_MENU       ENDP 
;----------------------------------------------------------------------------

;----------------------------------------------------------------------------
;----------------------------------------------------------------------------
MAIN_MENU PROC 
	
	PUSH	ESI
	CALL	ClearScreen
	CALL	RESETPOINTER
	MOV	ESI,OFFSET MenuMsg	
	CALL	WRITESTRING
	CALL	NEWLINE
	MOV	ESI,OFFSET UnivMsg
	CALL	WRITESTRING
	CALL	NEWLINE
	MOV	ESI,OFFSET ApplMsg
	CALL	WRITESTRING
	MOV 	ESI,OFFSET LoadMSg
	CALL	WRITESTRING
	MOV 	ESI,OFFSET RunMSg
	CALL	WRITESTRING
	MOV 	ESI,OFFSET CpuMsg
	CALL	WRITESTRING
	MOV 	ESI,OFFSET MemMSg
	CALL	WRITESTRING
	MOV 	ESI,OFFSET A1MSg
	CALL	WRITESTRING
	MOV 	ESI,OFFSET A2MSg
	CALL	WRITESTRING
	MOV 	ESI,OFFSET A3MSg
	CALL	WRITESTRING
	MOV 	ESI,OFFSET A4MSg
	CALL	WRITESTRING
	MOV 	ESI,OFFSET ExitMSg
	CALL	WRITESTRING
	CALL	NEWLINE	
	MOV	ESI,OFFSET Prmt1Msg
	CALL	WRITESTRING
	POP	ESI	
	
	RET

MAIN_MENU ENDP
;----------------------------------------------------------------------------

;----------------------------------------------------------------------------
RCodeSeg        ENDS
		END 
