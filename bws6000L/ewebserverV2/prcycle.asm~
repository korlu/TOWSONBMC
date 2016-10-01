;**********************************************************************************************************CK/
;prcycle.asm
;Copyright 2002 Dept of Computer Science, Towson University
;Coded by: Dr.R.K Karne, Rajvardhan Gattu, Xubo Zhang and Ramesh Dandu
;  Luyin Sun, Karthick Venkatasamy
;Date: 02/08/02
;Date: 03/22/04
;Date: 07/01/04
;***************************************************************************
;Conventions: 
;X: When X is displayed, we are at the point of jump to prcycle in aoaboot.
;Y: When Y is displayed, we sucessfully jumped from aoaboot to the prcycle.
;P: When P is displayed, we have entered/re-entered PMode.
;R: When R is displayed, we have entered/re-entered RMode.
;Z: When Z is displayed, we have sucessfully exited from the program in RMode.
INCLUDE         386SCD.INC
INCLUDE         DCYCLE.INC
INCLUDE 	SHARMEM.INC	
PUBLIC          HexTable, IndexCnt, PrintData,RunFlag
PUBLIC		MemoryOffset,MemFlag
;******************************************************
; MemoryOffset is used for printing memory or dump 
;******************************************************
EXTRN		LoaderSize1:word,LoaderSize2:word,StartLogicalSecNum1:word,StartLogicalSecNum2:word
EXTRN		LoadOffset1:dword,LoadOffset2:dword,ApplNum:byte,JumpOffset1:word,JumpOffset2:word
EXTRN          	BxPointer1:dword,LoadFlag:byte,LoaderSize1m:word,StartLogicalSecNum1m:word 
EXTRN           AOADisp:NEAR
;EXTRN           AOADisp:far
EXTRN           aoaminil1:NEAR
EXTRN           aoaminiw1:NEAR
EXTRN           Other_Begin0:NEAR,Other_Begin1:NEAR,Other_Begin2:NEAR, Other_Begin3, Other_Begin4, Other_Begin5
EXTRN           Other_Begin6:NEAR,Other_Begin7:NEAR,Other_Begin10:NEAR, Other_Begin11, Other_Begin12, Other_Begin13
EXTRN           Other_Begin219:NEAR,Other_Begin246:NEAR
;---------------------------------------------------------------------------
EOICOM       	=       20h     ; not used                        
ICREGP          =       20h     ; not used                   
IMREGP          =       21h     ; mask register  
RELOCATE1       =       80h     ;Program reloaction in BootMode
APPL1RELOCATE   =       000h   ;Program reloaction in ApplicationMode
BaseOfCode	=	0000h	;Base of code from PE
;RELOCATE1: The code is loaded at '600' in BootMode includes PSP
;So, the executable code is at '800' which is '80h' for segment adresses 
;and we need to relocate accordingly.
;***************************************************************************
;  Interupts in Protection Mode 
;  ;IDT Segment 
;  16 bit segment 
; whenever, interrupts are added or deleted to this segment 
;  make sure they add up to 256 
; otherwise, LIDT instruction will fail 
;***************************************************************************

IDTSeg          SEGMENT PARA USE16                
IDT             LABEL   BYTE                      
		REPT 	8
		Gate    <IntException,IntException_Sel,,AT386TGate,>	; IntException Selector 0 -7 
		ENDM
		Gate	<HTimerBegin, Puthex32I_Sel,,AT386TGate,>	;08h: hardware timer interrupt
		Gate	<Keyboard_Int, PCode_Sel,,AT386TGate,>		;09h: get a key
		Gate    <IntException,IntException_Sel,,AT386TGate,>	; IntException Selector 10 
		Gate    <IntException,IntException_Sel,,AT386TGate,>	; IntException Selector 11
		Gate    <IntException,IntException_Sel,,AT386TGate,>	; IntException Selector 12 
		Gate    <OtherBegin13,Other_Sel,,AT386TGate,>		; Use this interrupt in PRCYCLE 
		Gate	<FDC_int, Puthex32I_Sel,,AT386TGate,>		;0eh: floppy interrupt 14 
		; another print char exist so we can change
		Gate    <DisplayBegin,Puthex32I_Sel,,AT386TGate,>   	;0fh: display a character interrupt 15

		REPT 	99	
		Gate    <IntException,IntException_Sel,,AT386TGate,>	; IntException Selector 16 - 114
		ENDM
		Gate    <OtherBegin73,Other_Sel,,AT386TGate,>		; 115 IRQ11 0x73

		REPT 	3	
		Gate    <IntException,IntException_Sel,,AT386TGate,>	; IntException Selector 116-118
		ENDM

		;Ethernet Interrupt IRQ15 i.e. 0x77 0r 119
		; using Interrupt Gate for Ethernet Interrupt ISR 
		Gate    <test2,EthernetReceive_Sel,,AT386IGate,>	; Ether Receive Interrupt 119 
		;in the application, we need to change the EtherReceive address 
		;Gate    <OtherBegin0,Other_Sel,,AT386TGate,>		; not used 1	

		REPT 	115
		Gate    <IntException,IntException_Sel,,AT386TGate,>	; IntException Selector 120 - 234 
		ENDM
		
		Gate    <,App1TSSS_Sel,,ATTaskGate,>			;0ebh: Scheduler Task 235 	
                ;RKK0205
		;Gate    <,App1TSSE_Sel,,ATTaskGate,>			;0ech: Error Recovery Task 236 	
		Gate    <test1,Puthex32I_Sel,,AT386TGate,>		;0ech: Error Recovery Task 236 	

		;Gate	<MEMFetch, Puthex32I_Sel,,AT386TGate,>		;0ech: free to use 236
		Gate	<MEMFree, Puthex32I_Sel,,AT386TGate,>		;0edh: free to use 237 
		Gate	<MEMMalloc, Puthex32I_Sel,,AT386TGate,>		;0eeh: malloc new memory 238
		Gate    <,App1TSSC_Sel,,ATTaskGate,>			;0efh: Application 1 Child 239	
		Gate 	<scroll,Puthex32I_Sel,,AT386TGate,>		;0f0h: scroll up one line 240
		Gate 	<CLScreen,Puthex32I_Sel,,AT386TGate,>		;0f1h: clean screen 241
		Gate 	<GetCursor,Puthex32I_Sel,,AT386TGate,>		;0f2h: get the cursor postition 242 
		Gate 	<SetCursor,Puthex32I_Sel,,AT386TGate,>		;0f3h: set the cursor postion 243 
		Gate    <,WriteSecTSS_Sel,,ATTaskGate,>   		;0f4h: write one sector at a time 244
		Gate 	<Getchar32,Puthex32I_Sel,,AT386TGate,>		;0f5h: get a character in protect mode 245
		Gate 	<Getchar32Buff,Puthex32I_Sel,,AT386TGate,>	;0f6h: get a character from the buffer	
		Gate    <DisplayBegin,Puthex32I_Sel,,AT386TGate,>   	;0f7h: display a character interrupt 247       
		Gate	<,SearchTSS_Sel,,ATTaskGate,>			;0f8h: Search memory for given value 248
              	Gate    <,App2TSS_Sel,,ATTaskGate,>			;0f9h: Application 2 249		
		Gate    <,GetSecTSS_Sel,,ATTaskGate,>   		;0fah: read one sector at a time 250
		Gate    <,GetDecTSS_Sel,,ATTaskGate,>   		;0fbh: get decimal 251 
		Gate    <,GetCharTSS_Sel,,ATTaskGate,>   		;0fch: get character 252
		Gate    <PUTHEX32P,Puthex32I_Sel,,AT386TGate,>		;0fdh: Puthex32P 253 
              	Gate    <,App1TSS_Sel,,ATTaskGate,>			;0feh: Application 1 254		
		Gate    <,GKeyTSS_Sel,,ATTaskGate,>   			;0ffh: AOA display 255 
;-------------------------------------------------------------------------
IDTLen          =       $-IDT
IDTSeg          ENDS                            
;***************************************************************************
;  GDT Segment 
;  16 bit segment 
;***************************************************************************
GKeyLDTSeg      SEGMENT PARA USE16

GLDT            LABEL   BYTE
		
GKeyCode        Desc    <0ffffh,RCodeSeg+RELOCATE1,,ATCE,,>   
GKeyCode_Sel    =       GKeyCode-GLDT+TIL
GKeyStack       Desc    <DemoStack3Len-1,DemoStack3Seg+RELOCATE1,,ATDWA,,>
GKeyStack_Sel   =       GKeyStack-GLDT+TIL
;--------------------------------------------------------------------------
GKeyLDNum       =       ($-GLDT)/(SIZE Desc)    ;THE NUMBER OF INITIAL BASE
GKeyLDTLen      =       $                        
;--------------------------------------------------------------------------
GKeyLDTSeg      ENDS
;***************************************************************************
;  GDT Segment 
;for general keyboard interrupt
;  16 bit segment 
;***************************************************************************
GetCharLDTSeg      SEGMENT PARA USE16

CLDT            LABEL   BYTE
		
GetCharCode        Desc    <0ffffh,RCodeSeg+RELOCATE1,,ATCE,,>   
GetCharCode_Sel    =       GetCharCode-CLDT+TIL
GetCharStack       Desc    <GetCharStackLen-1,GetCharStackSeg+RELOCATE1,,ATDWA,,>
GetCharStack_Sel   =       GetCharStack-CLDT+TIL
;--------------------------------------------------------------------------
GetCharLDNum       =       ($-CLDT)/(SIZE Desc)    ;THE NUMBER OF INITIAL BASE
GetCharLDTLen      =       $                        
;--------------------------------------------------------------------------
GetCharLDTSeg      ENDS
;***************************************************************************
;  SearchLDTSeg Segment
;  16 bit segment 
;***************************************************************************
SearchLDTSeg      SEGMENT PARA USE16

SEARCHLDTS            LABEL   BYTE
		
SearchCode        Desc    <0ffffh,PCodeSeg+RELOCATE1,,ATCE,,>   
SearchCode_Sel    =       SearchCode-SEARCHLDTS+TIL
SearchData  	  Desc 	  <GlobalDataLen-1,GlobalDataSeg+RELOCATE1,,ATDW,,0h>
SearchData_Sel	  = 	  SearchData-SEARCHLDTS+TIL
SearchForData	  Desc    <0ffffh,0,0,93h,0cfh,0>
SearchForData_Sel =	  SearchForData-SEARCHLDTS+TIL
SearchStack       Desc    <SearchStackLen-1,SearchStackSeg+RELOCATE1,,ATDWA,,>
SearchStack_Sel   =       SearchStack-SEARCHLDTS+TIL
;--------------------------------------------------------------------------
SearchLDNum       =       ($-SEARCHLDTS)/(SIZE Desc)    ;THE NUMBER OF INITIAL BASE
SearchLDTLen      =       $                        
;--------------------------------------------------------------------------
SearchLDTSeg      ENDS

;***************************************************************************
GetDecLDTSeg      SEGMENT PARA USE16

DLDT            LABEL   BYTE
		
GetDecCode        Desc    <0ffffh,RCodeSeg+RELOCATE1,,ATCE,,>   
GetDecCode_Sel    =       GetDecCode-DLDT+TIL
GetDecStack       Desc    <GetDecStackLen-1,GetDecStackSeg+RELOCATE1,,ATDWA,,>
GetDecStack_Sel   =       GetDecStack-DLDT+TIL
;--------------------------------------------------------------------------
GetDecLDNum       =       ($-DLDT)/(SIZE Desc)    ;THE NUMBER OF INITIAL BASE
GetDecLDTLen      =       $                        
;--------------------------------------------------------------------------
GetDecLDTSeg      ENDS
;***************************************************************************
;get sector LDT segment
;***************************************************************************
GetSecLDTSeg      SEGMENT PARA USE16

KLDT            LABEL   BYTE
		
GetSecCode        Desc    <0ffffh,RCodeSeg+RELOCATE1,,ATCE,,>   
GetSecCode_Sel    =       GetSecCode-KLDT+TIL
GetSecStack       Desc    <GetDecStackLen-1,GetDecStackSeg+RELOCATE1,,ATDWA,,>
GetSecStack_Sel   =       GetSecStack-KLDT+TIL
;--------------------------------------------------------------------------
GetSecLDNum       =       ($-KLDT)/(SIZE Desc)    ;THE NUMBER OF INITIAL BASE
GetSecLDTLen      =       $                        
;--------------------------------------------------------------------------
GetSecLDTSeg      ENDS
;***************************************************************************
;Write sector LDT segment
;***************************************************************************
WriteSecLDTSeg      SEGMENT PARA USE16

WLDT            LABEL   BYTE
		
WriteSecCode        Desc    <0ffffh,RCodeSeg+RELOCATE1,,ATCE,,>   
WriteSecCode_Sel    =       WriteSecCode-WLDT+TIL
WriteSecStack       Desc    <WriteSecStackLen-1,WriteSecStackSeg+RELOCATE1,,ATDWA,,>
WriteSecStack_Sel   =       WriteSecStack-WLDT+TIL
;--------------------------------------------------------------------------
WriteSecLDNum       =       ($-WLDT)/(SIZE Desc)    ;THE NUMBER OF INITIAL BASE
WriteSecLDTLen      =       $                        
;--------------------------------------------------------------------------
WriteSecLDTSeg      ENDS
;***************************************************************************
App1LDTSeg      SEGMENT PARA USE16
;----------------------------------------------------------------------------
ALDT            LABEL   BYTE
                
;IApp1Code16     Desc   	<IApp1CodeLen16-1,IApp1CodeSeg16+RELOCATE1,,ATCE,,>   
;IApp1Code16_Sel =      	IApp1Code16-ALDT+TIL
;IApp1Code32     Desc   	<IApp1CodeLen32-1,IApp1CodeSeg32+RELOCATE1,,ATCE,D32,>   
;IApp1Code32_Sel =      	IApp1Code32-ALDT+TIL
;-----------------------------------------------------------------------------
;  SET APPLICATION 1 SEGMENT DESCRIPTORS 
;App1Stack       Desc  	<0ffffh,400h+APPL1RELOCATE,10h,ATDWA,,>  ;740h
;App1Stack       Desc  	<0ffffh,40h+APPL1RELOCATE,10h,ATDWA,,>  ;740h
;App1Stack       Desc  	<0a00h,00h+APPL1RELOCATE,11h,ATSWA,,>  ;
;App1Stack       Desc  	<0ffffh,00h+APPL1RELOCATE,11h,ATSWA,,>  ;
;App1Stack       Desc  	<0fffh,00h+APPL1RELOCATE,23h,093h,0c0h,01h>  ;
;App1Stack       Desc  	<0ffffh,00h+APPL1RELOCATE,11h,ATSWA,,>  ;
;App1Stack       Desc  	<0ffffh,00h+APPL1RELOCATE,0h,093h,0c0h,02h>  ;
;*************************************************
; The following stack segment will enable stack to 
;  start at 01230000h RKK/LSUN 11-07-2003 working for 
;  teststack example
; also change ESP value to 00ffefffh in two places LARGESTACK 
;  ---start of stack 01230000h 
;  --- value in ESP + start of stack --> top of stack 
;  --- Top of Stack is 01230000+00ffefff = 0222EFFFh
;  --  this is good for 16M stack 
;*************************************************
;App1Stack       Desc  	<0ffffh,00h+APPL1RELOCATE,23h,093h,0cfh,01h>  ; last working
App1Stack       Desc  	<0ffffh,00h+APPL1RELOCATE,11h,093h,0cfh,00h>  ; last working
App1Stack_Sel   =     	App1Stack-ALDT+TIL
;------------------------------------------------------------------------------
;descriptor format 
; Segment Limit (2 bytes LSB); Base Address (2 bytes 15-0);Base Address (3rd byte 23-16); 
;   P/DPL/S byte 5 1 00 1 0011;
;   G/B/00: 1100 byte 6; 0000 upper digit of limit byte 7 
;   Base address is 01230000
;   Limit is 00fff*4k is 00fff000/
;   ESP shoud be initialized to 00ffefffh
;------------------------------------------------------------------------------
; App1Data 
; App1Stack 
; load  0033; 0021; 0000; 0001; 1000 as parameters in the menu:
; point all ds, cs, ss base values to 11
;------------------------------------------------------------------------------
;App1Data        Desc   <0ffffh,00h+APPL1RELOCATE,11h,ATDW,D32,>
App1Data        Desc   <0ffffh,00h+APPL1RELOCATE,11h,ATDW,0cfh,0h> ; global bit set
App1Data_Sel	=	App1Data-ALDT+TIL
App1Code        Desc   	<0ffffh,BaseOfCode+APPL1RELOCATE,11h,ATCE,0cfh,0h>
;App1Code        Desc   	<0ffffh,BaseOfCode+APPL1RELOCATE,20h,ATCE,0cfh,0h>  ; global bit set
App1Code_Sel    =      	App1Code-ALDT+TIL
App1_Sch_Gate     Gate    <292Bh,App1Code_Sel,,AT386CGate+DPL3,>

App1_Sch_Sel            =       App1_Sch_Gate-ALDT+TIL

;App1_Code        Desc   	<0ffffh,292bh,11h,ATCE,0cfh,0h>
;App1Code        Desc   	<0ffffh,BaseOfCode+APPL1RELOCATE,20h,ATCE,0cfh,0h>  ; global bit set
;App1_Code_Sel    =     	App1_Code-ALDT+TIL

;--------------------------------------------------------------------------------
;App1Stack0       Desc  	<400h,0h+APPL1RELOCATE,11h,ATSWA+DPL0,,>
App1Stack0       Desc  	<0ffffh,00h+APPL1RELOCATE,0h,093h,0c0h,03h>  ;
App1Stack0_Sel   =     	App1Stack0-ALDT+TIL
;App1Stack1       Desc  	<400h,0h+APPL1RELOCATE,11h,ATSWA+DPL1,,>
App1Stack1       Desc  	<0ffffh,00h+APPL1RELOCATE,0h,093h,0c0h,04h>  ;
App1Stack1_Sel   =     	App1Stack1-ALDT+TIL
;App1Stack2       Desc  	<400h,0h+APPL1RELOCATE,11h,ATSWA+DPL3,,>
App1Stack2       Desc  	<0ffffh,00h+APPL1RELOCATE,0h,093h,0c0h,05h>  ;
App1Stack2_Sel   =     	App1Stack2-ALDT+TIL
;----------------------------------------------------------------------------
App1LDNum       =       ($-ALDT)/(SIZE Desc)   	;THE NUMBER OF INITIAL BASE
App1LDTLen      =       $                        
;----------------------------------------------------------------------------
App1LDTSeg      ENDS
;--------------------------------------------------------------------------
;***************************************************************************
App2LDTSeg      SEGMENT PARA USE16
;----------------------------------------------------------------------------
A2LDT            LABEL   BYTE

App2Stack       Desc  	<0a00h,0h+APPL1RELOCATE,41h,ATSWA,,>  ;740h
App2Stack_Sel   =     	App2Stack-A2LDT+TIL
App2Data        Desc   <0ffffh,APPL1RELOCATE,41h,ATDW,D32,>
;App2Data        Desc   <0ffffh,00h+APPL1RELOCATE,11h,ATDW,0cfh,0h> ; global bit set

App2Data_Sel	=	App2Data-A2LDT+TIL
App2Code        Desc   	<0ffffh,BaseOfCode+APPL1RELOCATE,40h,ATCE,0cfh,0h> 
;App2Code        Desc   	<0ffffh,BaseOfCode+APPL1RELOCATE,11h,ATCE,0cfh,0h>   
App2Code_Sel    =      	App2Code-A2LDT+TIL
;----------------------------------------------------------------------------
App2LDNum       =       ($-A2LDT)/(SIZE Desc)   	;THE NUMBER OF INITIAL BASE
App2LDTLen      =       $                        
;----------------------------------------------------------------------------
App2LDTSeg      ENDS
;--------------------------------------------------------------------------
;***************************************************************************
;   GkeyTSSSeg Segment 
;   16 bit segment 
;   This is a 32 bit TSS format (386 and higher)  
;***************************************************************************
GKeyTSSSeg      SEGMENT PARA USE16
		DD      0                       ;LINK                
		DD      ?                       ;STACK POINTER LEVEL 0
		DW      ?,?                     
		DD      ?                       ;LEVEL 1                      
		DW      ?,?
		DD      ?                       ;LEVEL 2                      
		DW      ?,?
		DD      0                       ;CR3
		DW      GKeyBegin,0             ;EIP
		DD      0                       ;EFLAGS
		DD      0                       ;EAX
		DD      0                       ;ECX
		DD      0                       ;EDX
		DD      0                       ;EBX
		DW      DemoStack3Len,0          ;ESP
		DD      0                       ;EBP
		DD      0                       ;ESI
		DD      0                       ;EDI
		DW      Normal_Sel,0            ;ES
		DW      GKeyCode_Sel,0          ;CS
		DW      GKeyStack_Sel,0         ;SS
		DW      Normal_Sel,0            ;DS
		DW      Normal_Sel,0            ;FS
		DW      Normal_Sel,0            ;GS
		DW      GKeyLDT_Sel,0           ;LDTR
		DW      0                       ;TRAP SIGN                  
		DW      $+2                     ;I/O MAPPING OFFSET
		DB      0ffh                    ;END OF I/O MAPPING
GKeyTSSLen      =       $
;----------------------------------------------------------------------------
GKeyTSSSeg      ENDS
;***************************************************************************
;   SearchTSSSeg Segment 
;   16 bit segment 
;   This is a 32 bit TSS format (386 and higher)  
;***************************************************************************
SearchTSSSeg      SEGMENT PARA USE16
		DD      0                       ;LINK                
		DD      ?                       ;STACK POINTER LEVEL 0
		DW      ?,?                     
		DD      ?                       ;LEVEL 1                      
		DW      ?,?
		DD      ?                       ;LEVEL 2                      
		DW      ?,?
		DD      0                       ;CR3
		DW      SearchBegin,0           ;EIP
		DD      0                       ;EFLAGS
		DD      0                       ;EAX
		DD      0                       ;ECX
		DD      0                       ;EDX
		DD      0                       ;EBX
		DW      SearchStackLen,0        ;ESP
		DD      0                       ;EBP
		DD      0                       ;ESI
		DD      0                       ;EDI
		DW      SearchForData_Sel,0            ;ES
		DW      SearchCode_Sel,0        ;CS
		DW      SearchStack_Sel,0       ;SS
		DW      SearchData_Sel,0            ;DS
		DW      SearchData_Sel,0            ;FS
		DW      Normal_Sel,0            ;GS
		DW      SearchLDT_Sel,0         ;LDTR
		DW      0                       ;TRAP SIGN                  
		DW      $+2                     ;I/O MAPPING OFFSET
		DB      0ffh                    ;END OF I/O MAPPING
SearchTSSLen      =       $
;----------------------------------------------------------------------------
SearchTSSSeg      ENDS

;***************************************************************************
;   GkeyTSSSeg Segment 
;   16 bit segment 
;   This is a 32 bit TSS format (386 and higher)  
;***************************************************************************
GetCharTSSSeg      SEGMENT PARA USE16
		DD      0                       ;LINK                
		DD      ?                       ;STACK POINTER LEVEL 0
		DW      ?,?                     
		DD      ?                       ;LEVEL 1                      
		DW      ?,?
		DD      ?                       ;LEVEL 2                      
		DW      ?,?
		DD      0                       ;CR3
		DW      GetCharBegin,0             ;EIP
		DD      0                       ;EFLAGS
		DD      0                       ;EAX
		DD      0                       ;ECX
		DD      0                       ;EDX
		DD      0                       ;EBX
		DW      GetCharStackLen,0          ;ESP
		DD      0                       ;EBP
		DD      0                       ;ESI
		DD      0                       ;EDI
		DW      Normal_Sel,0            ;ES
		DW      GetCharCode_Sel,0          ;CS
		DW      GetCharStack_Sel,0         ;SS
		DW      Normal_Sel,0            ;DS
		DW      Normal_Sel,0            ;FS
		DW      Normal_Sel,0            ;GS
		DW      GetCharLDT_Sel,0           ;LDTR
		DW      0                       ;TRAP SIGN                  
		DW      $+2                     ;I/O MAPPING OFFSET
		DB      0ffh                    ;END OF I/O MAPPING
GetCharTSSLen      =       $
;----------------------------------------------------------------------------
GetCharTSSSeg      ENDS

;******************************************************************************
;***************************************************************************
;   GetDecTSSSeg Segment 
;   16 bit segment 
;   This is a 32 bit TSS format (386 and higher)  
;***************************************************************************
GetDecTSSSeg      SEGMENT PARA USE16
		DD      0                       ;LINK                
		DD      ?                       ;STACK POINTER LEVEL 0
		DW      ?,?                     
		DD      ?                       ;LEVEL 1                      
		DW      ?,?
		DD      ?                       ;LEVEL 2                      
		DW      ?,?
		DD      0                       ;CR3
		DW      GetDecBegin,0             ;EIP
		DD      0                       ;EFLAGS
		DD      0                       ;EAX
		DD      0                       ;ECX
		DD      0                       ;EDX
		DD      0                       ;EBX
		DW      GetDecStackLen,0        ;ESP
		DD      0                       ;EBP
		DD      0                       ;ESI
		DD      0                       ;EDI
		DW      Normal_Sel,0            ;ES
		DW      GetDecCode_Sel,0          ;CS
		DW      GetDecStack_Sel,0         ;SS
		DW      Normal_Sel,0            ;DS
		DW      Normal_Sel,0            ;FS
		DW      Normal_Sel,0            ;GS
		DW      GetDecLDT_Sel,0           ;LDTR
		DW      0                       ;TRAP SIGN                  
		DW      $+2                     ;I/O MAPPING OFFSET
		DB      0ffh                    ;END OF I/O MAPPING
GetDecTSSLen      =       $
;----------------------------------------------------------------------------
GetDecTSSSeg      ENDS

;******************************************************************************
;   GetSecTSSSeg Segment 
;   16 bit segment 
;   This is a 32 bit TSS format (386 and higher)  
;    Read one sector task 
;***************************************************************************
GetSecTSSSeg      SEGMENT PARA USE16
		DD      0                       ;LINK                
		DD      ?                       ;STACK POINTER LEVEL 0
		DW      ?,?                     
		DD      ?                       ;LEVEL 1                      
		DW      ?,?
		DD      ?                       ;LEVEL 2                      
		DW      ?,?
		DD      0                       ;CR3
		DW      GetSecBegin,0             ;EIP
		DD      0                       ;EFLAGS
		DD      0                       ;EAX
		DD      0                       ;ECX
		DD      0                       ;EDX
		DD      0                       ;EBX
		DW      GetSecStackLen,0        ;ESP
		DD      0                       ;EBP
		DD      0                       ;ESI
		DD      0                       ;EDI
		DW      Normal_Sel,0            ;ES
		DW      GetSecCode_Sel,0        ;CS
		DW      GetSecStack_Sel,0       ;SS
		DW      Normal_Sel,0            ;DS
		DW      Normal_Sel,0            ;FS
		DW      Normal_Sel,0            ;GS
		DW      GetSecLDT_Sel,0         ;LDTR
		DW      0                       ;TRAP SIGN                  
		DW      $+2                     ;I/O MAPPING OFFSET
		DB      0ffh                    ;END OF I/O MAPPING
GetSecTSSLen      =       $
;----------------------------------------------------------------------------
GetSecTSSSeg      ENDS
;******************************************************************************
;******************************************************************************
;   WriteSecTSSSeg Segment 
;   16 bit segment 
;   This is a 32 bit TSS format (386 and higher)  
;    Write one sector task 
;***************************************************************************
WriteSecTSSSeg      SEGMENT PARA USE16
		DD      0                       ;LINK                
		DD      ?                       ;STACK POINTER LEVEL 0
		DW      ?,?                     
		DD      ?                       ;LEVEL 1                      
		DW      ?,?
		DD      ?                       ;LEVEL 2                      
		DW      ?,?
		DD      0                       ;CR3
		DW      WriteSecBegin,0         ;EIP
		DD      0                       ;EFLAGS
		DD      0                       ;EAX
		DD      0                       ;ECX
		DD      0                       ;EDX
		DD      0                       ;EBX
		DW      GetSecStackLen,0          ;ESP
		DD      0                       ;EBP
		DD      0                       ;ESI
		DD      0                       ;EDI
		DW      Normal_Sel,0            ;ES
		DW      GetSecCode_Sel,0        ;CS
		DW      GetSecStack_Sel,0       ;SS
		DW      Normal_Sel,0            ;DS
		DW      Normal_Sel,0            ;FS
		DW      Normal_Sel,0            ;GS
		DW      GetSecLDT_Sel,0         ;LDTR
		DW      0                       ;TRAP SIGN                  
		DW      $+2                     ;I/O MAPPING OFFSET
		DB      0ffh                    ;END OF I/O MAPPING
WriteSecTSSLen      =       $
;----------------------------------------------------------------------------
WriteSecTSSSeg      ENDS
;******************************************************************************
; Application 1 TSS 
; This is a 32 bit TSS format (386 and higher) 
; ALL the Selectors for the Segment registers being initialized in the
; TSS Segment must be located in the App1LDTSeg
;   	If we want to run a 16 bit internal application open up the 
;	two comments 	I. 	DW	IApp1Begin16,0
;			II. 	DW	IApp1Code16_Sel,0
;
;   	If we want to run a 32 bit internal application open up the 
;	two comments 	I. 	DW	IApp1Begin32,0
;			II. 	DW	IApp1Code32_Sel,0
;******************************************************************************
App1TSSSeg      SEGMENT PARA USE32

App1TaskTSS	LABEL	BYTE
                DD      0       		;LINK                
		DD      0ffffh			;stack 0 length            
		DD      App1Stack0_Sel          ;stack selector for 0 level 
		DD      0ffffh           		;stack 1 length
		DD      App1Stack1_Sel        	;stack selector for 1 level
		DD      0ffffh                    ;stack 2 length 
		DD      App1Stack2_Sel          ;stack selector for 2 level            
                DD      0                       ;CR3
                DD      0h 	  	        ;EIP
	;	DD      3202h                     ;EFLAGS
		DD      0202h                     ;EFLAGS
                DD      0                       ;EAX
                DD      0                       ;ECX
                DD      0                       ;EDX
                DD      0                       ;EBX
                ;DW      0ffffh,0		;App1StackLen,0 ;ESP
		;DW      0d00h,0		;App1StackLen,0 ;ESP
		;DW      0ffffh,0013h		;App1StackLen,0 ;ESP
		;dd	01ffffh
		;dd	0fffffh
		;dd	0000ffffh
		;dd	00ffefffh                ;LARGESTACK works for teststack example
		dd	01e84800h                ; 32 M
		;dd	01ff0000h
		;dd	0000ffffh
		; because we use the stack dowside, system will add statck start address by esp
		; this will be the actual start address and stack will go down
		; for ex: if the code starts at 00111000h and PSP is at 00110000h 
		;  we would like to start stack at 00110d00h, in order to achieve this 
		;  we can set esp a value of 0d00h, base value in the selector will be 0h 
		;    and the limit will be 0a00h so that 0200h will be left for PSP 
                DD      0                       ;EBP
                DD      0                       ;ESI
                DD      0                       ;EDI
                DW     	App1Data_Sel,0		;ES
                DW      App1Code_Sel,0       	;CS
                DW      App1Stack_Sel,0         ;SS
                DW     	App1Data_Sel,0		;DS
                DW      0,0         		;FS
                DW      0,0         		;GS
                DW      App1LDT_Sel,0          	;LDTR also there in GDT
                DW      0    			;TRAP SIGN                  
                DW      $+2                 	;I/O MAPPING OFFSET
		DB	7 DUP(0)		;I/O MAPPING Rounding it to 112 bytes in the user memory space
                DB      0ffh                	;END OF I/O MAPPING
App1TSSLen      =       $                       ; Length of the segment a constant 
; this stored in memory at SizeOf_TSS1 as a word 
;----------------------------------------------------------------------------
App1TSSSeg      ENDS

;***************************************************************************
App2TSSSeg      SEGMENT PARA USE16
App2TaskTSS	LABEL	BYTE
                DD      0       		;LINK                
		DD      0h			;stack 0 length            
		DD      0h		        ;stack selector for 0 level 
		DD      0h           		;stack 1 length
		DD      0h	        	;stack selector for 1 level
		DD      0h      	        ;stack 2 length 
		DD      0h	                ;stack selector for 2 level            
                DD      0                       ;CR3
                DD      0h 	        	;EIP
                DD      0202                       ;EFLAGS
                DD      0                       ;EAX
                DD      0                       ;ECX
                DD      0                       ;EDX
                DD      0                       ;EBX
                DW      0d00h,0			;App1StackLen,0 ;ESP
                DD      0                       ;EBP
                DD      0                       ;ESI
                DD      0                       ;EDI
                DW     	App2Data_Sel,0		;ES
                DW      App2Code_Sel,0       	;CS
                DW      App2Stack_Sel,0         ;SS
                DW     	App2Data_Sel,0		;DS
                DW      0,0         		;FS
                DW      0,0         		;GS
                DW      App2LDT_Sel,0          	;LDTR
                DW      0    			;TRAP SIGN                  
                DW      $+2                 	;I/O MAPPING OFFSET
		DB	919 DUP(0)		;I/O MAPPING
                DB      0ffh                	;END OF I/O MAPPING
App2TSSLen      =       $
;----------------------------------------------------------------------------
App2TSSSeg      ENDS

;***************************************************************************
; DemoLDTSeg Segment 
; 16 bit segment 
;***************************************************************************
DemoLDTSeg      SEGMENT PARA USE16              

DemoLDT         LABEL   BYTE                     
DemoStack0              Desc    <DemoStack0Len-1,DemoStack0Seg+RELOCATE1,,ATDW+DPL0,D32,>
DemoStack1              Desc    <DemoStack1Len-1,DemoStack1Seg+RELOCATE1,,ATDW+DPL1,D32,>
DemoStack3              Desc    <DemoStack3Len-1,DemoStack3Seg+RELOCATE1,,ATDW+DPL3,,>
DemoCode                Desc    <DemoCodeLen-1,DemoCodeSeg+RELOCATE1,,ATCE+DPL3,D32,>
T32Code                 Desc    <DemoCodeLen-1,DemoCodeSeg+RELOCATE1,,ATCE,D32,>
ProtCode                Desc <DemoCodeLen-1,DemoCodeSeg+RELOCATE1,,ATCE,D32,>
ProtModeProcData  	Desc <ProtModeProcDataLen-1,ProtModeProcDataSeg+RELOCATE1,,ATDW,D32,0h>
; only BaseL is shifted in InitLDT, so enter the value one digit less or left shifted by one digit 
; for example 8400h offset should be enetered as 840h, InitLDT will shift and make it 8400h 
PrintMemProcData  	Desc    <0ffffh,0h,0h,ATDW,0cfh,0h>          ;for loading fs
StartAddress  		Desc 	<0ffffh,0h,10h,ATDW,0cfh,0h>       ;above 1M descriptor
Buffer  		Desc 	<0ffffh,840h,,ATDW,,>       ;for loading es

; You need to add RDataSeg and RELOCATE1 here so that the base value will be 
; taken care off 
; Do not use DS if you want to address real memory data as DS is already 
; being used for protected mode data using ASSUME 
; Use es instead to solve this problem 
RealData  		Desc 	<0ffffh,RDataSeg+RELOCATE1,,ATDW,,>       ;for loading fs
GotoPCode   		Desc 	<0ffffh,APPL1RELOCATE,,ATCE,D32,>
;------------------------------------------------------------------------
DemoLDNum       =       ($-DemoLDT)/(SIZE Desc)
;------------------------------------------------------------------------
DemoStack0_Sel          =       DemoStack0-DemoLDT+TIL+RPL0
DemoStack1_Sel          =       DemoStack1-DemoLDT+TIL+RPL1
DemoStack3_Sel          =       DemoStack3-DemoLDT+TIL+RPL3
DemoCode_Sel            =       DemoCode-DemoLDT+TIL+RPL3
T32Code_Sel             =       T32Code-DemoLDT+TIL
ProtCode_Sel            =       ProtCode-DemoLDT+TIL
ProtModeProcData_Sel    =       ProtModeProcData-DemoLDT+TIL                
PrintMemProcData_Sel    =       PrintMemProcData-DemoLDT+TIL                
RealData_Sel		=	RealData-DemoLDT+TIL
StartAddress_Sel	=	StartAddress-DemoLDT+TIL
Buffer_Sel		=	Buffer-DemoLDT+TIL

GotoPCode_Sel           =       GotoPCode-DemoLDT+TIL
;------------------------------------------------------------------------
ToT32GateA              Gate    <T32Begin,T32Code_Sel,,AT386CGate+DPL3,>
ToT32GateB              Gate    <T32End,T32Code_Sel,,AT386CGate+DPL3,>
ProtModeProcGate1       Gate    <PUTHEX32P,ProtCode_Sel,,AT386CGate+DPL3,>
App_Scheduler_Gate	Gate    <APPSCHEDULE,ProtCode_Sel,,AT386CGate+DPL3,>
ProtModeProcGate2       Gate    <PRINTMEMP,ProtCode_Sel,,AT386CGate+DPL3,>
ProtModeProcGate3       Gate    <PRINTSTP, ProtCode_Sel,,AT386CGate+DPL3,>
RDWTMemGate	        Gate    <RDWTMEM,  ProtCode_Sel,,AT386CGate+DPL3,>

GotoPGate               Gate    <0h,GotoPCode_Sel,,AT386CGate+DPL3,>
;-----------------------------------------------------------------------
DemoLDTLen              =       $-DemoLDT
;------------------------------------------------------------------------
ToT32A_Sel              =       ToT32GateA-DemoLDT+TIL
ToT32B_Sel              =       ToT32GateB-DemoLDT+TIL
Puthex32PGate_Sel       =       ProtModeProcGate1-DemoLDT+TIL            
App_Scheduler_Sel	=	App_Scheduler_Gate-DemoLDT+TIL
PrintmemPGate_Sel       =       ProtModeProcGate2-DemoLDT+TIL        
PrintStackPGate_Sel     =     ProtModeProcGate3-DemoLDT+TIL      
RDWTMemPGate_Sel	=     RDWTMemGate-DemoLDT+TIL        

GotoPGate_Sel   =       GotoPGate-DemoLDT+TIL       
;----------------------------------------------------------------------------
DemoLDTSeg      ENDS                           
;----------------------------------------------------------------------------

;***************************************************************************
; DemoTSSSeg Segment 
; 16 bit segment 
;***************************************************************************
DemoTSSSeg      SEGMENT PARA USE16                
		DD      0                        
		DD      DemoStack0Len            
		DD      DemoStack0_Sel           
		DD      DemoStack1Len           
		DD      DemoStack1_Sel        
		DD      0                       
		DD      0                      
		DD      0                         ;CR3
		DD      0                         ;EIP
		DD      0                         ;EFLAGS
		DD      0                         ;EAX
		DD      0                         ;ECX
		DD      0                         ;EDX
		DD      0                         ;EBX
		DD      0                         ;ESP
		DD      0                         ;EBP
		DD      0                         ;ESI
		DD      0                         ;EDI
		DD      0                         ;ES
		DD      0                         ;CS
		DD      0                         ;SS
		DD      0                         ;DS
		DD      0                         ;FS
		DD      0                         ;GS
		DD      DemoLDT_Sel               ;LDT
		DW      0                        
		DW      $+2                     
		DW      0ffffh                 
;----------------------------------------------------------------------------
DemoTSSLen      =       $
;----------------------------------------------------------------------------
DemoTSSSeg      ENDS                           
;----------------------------------------------------------------------------

;***************************************************************************
; DemoStack0Seg Segment 
;  32 bit segment 
;***************************************************************************
DemoStack0Seg   SEGMENT DWORD STACK USE32       
DemoStack0Len   =       512
		DB      DemoStack0Len DUP(?)
DemoStack0Seg   ENDS                            
;--------------------------------------------------------------------------
;***************************************************************************
; DemoStack1Seg Segment 
;  32 bit segment 
;***************************************************************************
DemoStack1Seg   SEGMENT DWORD STACK USE32        
DemoStack1Len   =       502
        DB      'T'
        DB      'D'
        DB      'O'
        DB      'S'
        DB      'C'
        DB      '2'
        DB      '0'
        DB      '0'
        DB      '8'
        DB      'T'
		DB      DemoStack1Len DUP('K')
DemoStack1Seg   ENDS                      
                    
;-------------------------------------------------------------------------
;***************************************************************************
; DemoStack3Seg Segment 
;  16 bit segment 
;***************************************************************************
DemoStack3Seg   SEGMENT PARA USE16        
DemoStack3Len   =       512 
		DB      DemoStack3Len DUP(0)
;-------------------------------------------------------------------------              
DemoStack3Seg   ENDS                             
;-------------------------------------------------------------------------              
;***************************************************************************
; GetCharStackSeg Segment 
;  16 bit segment 
;***************************************************************************
GetCharStackSeg   SEGMENT PARA USE16        
GetCharStackLen   =       512 
		DB      GetCharStackLen DUP(0)
;-------------------------------------------------------------------------              
GetCharStackSeg   ENDS                             
;-------------------------------------------------------------------------              
;***************************************************************************
; SearchStackSeg Segment 
;  16 bit segment 
;***************************************************************************
SearchStackSeg   SEGMENT PARA USE16        
SearchStackLen   =       512 
		DB      SearchStackLen DUP(0)
;-------------------------------------------------------------------------              
SearchStackSeg   ENDS                             
;-------------------------------------------------------------------------              
;***************************************************************************
;***************************************************************************
; GetDecStackSeg Segment 
;  16 bit segment 
;***************************************************************************
GetDecStackSeg   SEGMENT PARA USE16        
GetDecStackLen   =       512 
		DB      GetDecStackLen DUP(0)
;-------------------------------------------------------------------------              
GetDecStackSeg   ENDS                             
;***************************************************************************
; GetSecStackSeg Segment 
;  16 bit segment 
;***************************************************************************
GetSecStackSeg   SEGMENT PARA USE16        
GetSecStackLen   =       512 
		DB      GetSecStackLen DUP(0)
;-------------------------------------------------------------------------              
GetSecStackSeg   ENDS                             
;***************************************************************************
; WriteSecStackSeg Segment 
;  16 bit segment 
;***************************************************************************
WriteSecStackSeg   SEGMENT PARA USE16        
WriteSecStackLen   =       512 
		DB      WriteSecStackLen DUP(0)
;-------------------------------------------------------------------------              
WriteSecStackSeg   ENDS                             
;-------------------------------------------------------------------------              
;***************************************************************************
; App1StackSeg Segment 
;  32 bit segment 
;***************************************************************************
App1StackSeg   SEGMENT DWORD STACK USE32        
App1StackLen   =       512
		DB      App1StackLen DUP(?)
App1StackSeg   ENDS                             
;-------------------------------------------------------------------------
;***************************************************************************
; ProtModeProcDataSeg Segment  
; All the protected mode data will go into this segment.
;  32 bit segment 
;***************************************************************************
ProtModeProcDataSeg        SEGMENT public PARA USE32

HexTableP        DB      '0123456789ABCDEF'
IndexCntP        DD      ?
PrintDataP       DD      ? 

ProtModeProcDataLen     =       $

ProtModeProcDataSeg        ENDS
;--------------------------------------------------------------------------             
;***************************************************************************
; GlobalDataSeg Segment  
; All the Global data will be stored in this segment.
;  32 bit segment 
;***************************************************************************
GlobalDataSeg        SEGMENT public PARA USE16 'GlobalData'

Dummydata	DB	'PQRSTUVWXYZ'

StoreChar		DB	?
StoreDec		DD	?
SearchKey		DB	256 dup(0)
SearchLen		dw	0

GlobalDataLen     =       $

GlobalDataSeg        ENDS

;**************************************************************************
;sample test code for otherbegin code to place it in C++ 
;  this code never gets invoked as it will be over ridden by IDT and GDT entries 
;**************************************************************************
IntExceptionSeg    SEGMENT PARA USE32              
IntException    	PROC FAR

	   	iretd
IntException ENDP
IntExceptionCodeLen     =  $
;----------------------------------------------------------------------------
IntExceptionSeg ENDS           

;**************************************************************************
;Sample Test Code Segment
; When C++ application ethernet receive ISR is not setup, this ISR will 
;  run 
;--------------------------------------------------------------------------
EthernetReceive    SEGMENT PARA USE32              
		;ASSUME  CS:EthernetReceive;,ds:ProtModeProcDataSeg;
test2 PROC FAR
		cli
		push	eax
		push	ebx
		push	edx
		push	fs
		
		mov	ax, MEMData_Sel ; zero base in protected mode  
		mov	fs, ax
		mov	ebx,S_Base	;base of shared memory between aoa and application
		add	ebx,S_Timer		;index of timer in shared memory
		mov	eax, fs:[ebx]
		mov	fs:[ebx], eax
		mov	ebx, 660
		int	0fdh

		mov	ax, 'I'
		mov	ebx, 640
		int 	0f7h
		
		;-----------------------------------------
		;print the status of ethernet card
		mov	ax, 300h
		mov	dx, ax
		add	dx, 0Eh
		in 	ax, dx
		mov	ebx, 800
		int 	0fdh
		;-----------------------------------
		; discard the packet in the ethernet buffer

		xor	edx, edx
		xor 	eax, eax
		mov	ax, 300h
		mov	dx, ax ; dx:IO_BASE 
		add     dx, 0Eh
		mov     ax, 800h+1h
		out     dx, ax                  
Wait_Command_End2:
		in      ax, dx
		and     ax, 1000h                       
		;jnz     Wait_Command_End2
		;print the status of ethernet card

		mov	ax, 300h
		mov	dx, ax
		add	dx, 0Eh
		in 	ax, dx
		mov	ebx, 820
		int 	0fdh

		;Discard Data header.
		mov	ax, 4000h
		out	dx, ax
Wait_Command_End1:
		in      ax, dx
		and     ax, 1000h                       
		;jnz     Wait_Command_End1

		;print the status of ethernet card
		mov	ax, 300h
		mov	dx, ax
		add	dx, 0Eh
		in 	ax, dx
		mov	ebx, 840
		int 	0fdh
		mov	ax, 'J'
		mov	ebx, 640
		int 	0f7h
		;-----------------------------------
		; Acknowledge the interrupt with the ethernet card
		mov	dx, 300h
		add     dx, 0eh
		mov     ax, 6811h
		out     dx, ax              
Wait_Command_End:
		in      ax, dx
		and     ax, 1000h                       
		;jnz     Wait_Command_End
		in 	ax, dx
		mov	ebx, 860
		int 	0fdh

		mov	ax, 'K'
		mov	ebx, 640
		int 	0f7h
		;-----------------------------------------------------
		; Acknowledge the interrupt in the PCI 2
		mov	dx, 0A0h
		mov	al, 20h
		out	dx, al
		;--------------------------------------------------------
		; Acknowledge the interrupt in the PCI 1
		; this is because the interupt int PCI 2 is through PCI 1
		mov	dx, 20h
		mov	al, 20h
		out	dx, al
		;--------------------------------------------------------
		; Disable the Ethernet Card Interrupt
		;mov	dx, 0A1h
		;in	al, dx
		;or	al, 80h
		;out	dx, al

		;--------------------------------------------------------
		; Disable the Ethernet Card Interrupt
		;mov	dx, 0A1h
		;in	al, dx
		;and	al, 7Fh
		;out	dx, al
		
		mov	ax, 'L'
		mov	ebx, 640
		int 	0f7h
	
		pop	fs
		pop	edx
		pop	ebx
		pop	eax
		sti
		iretd
test2 ENDP

EthernetReceiveCodeLen     =  $
;----------------------------------------------------------------------------
EthernetReceive ENDS                            
		
;**************************************************************************
;DemoCodeSeg Segment 
;  32 bit segment 
;  In ProtectedMode all the segments are 32bit
;**************************************************************************
DemoCodeSeg     SEGMENT PARA USE32              
		ASSUME  CS:DemoCodeSeg,ds:ProtModeProcDataSeg;, es:RDataSeg
;-------------------------------------------------------------------------
; Do not use 16 bit ds in democodeseg
;***************************************************************************
; DemoBegin Procedure  
;  invoked from T32Begin using a call gate 
;  III. 
;***************************************************************************
DemoBegin       PROC    FAR

		CALL32  ToT32B_Sel,0  ; IV.             
		; using a call gate it will go to T32End
		; 32 bit to 32 bit gate and call 
DemoBegin       ENDP
;-------------------------------------------------------------------------
;***************************************************************************
; T32Begin Procedure 
;  called from a call gate 16 bit to 32 bit segment transfer
;***************************************************************************
T32Begin        PROC    FAR
;-----------------------------------------
		mov     al,'P'
		mov     ebx,3998
		int     0f7h
		
		
;------------------------------------------------
Skip:
;-----------------------------------------
		mov     ax,DemoStack0_Sel        
		mov     ss,ax
		mov     esp,DemoStack0Len
		push    DWORD PTR DemoStack3_Sel
		push    DemoStack3Len
		push    DWORD PTR DemoCode_Sel   
		push    OFFSET DemoBegin
;-------------------------------------------
; III. 
; 32 bit to 32 bit transfer using stack 
; destination address selector and offset is 
; pushed onto stack and using return it will 
; pop the stack to jump to DemoBegin location
;-------------------------------------------
		retf                              
T32Begin        ENDP
;--------------------------------------------------------------------------
;***************************************************************************
; T32End Procedure 
; IV. 
;  invoked from DemoBegin using a call gate 
;***************************************************************************
T32End          PROC    FAR
;--------------------------------------------------------
		JUMP32  TempCode_Sel,<OFFSET ToReal> ; V. 
;--------------------------------------------------------
		; using a descriptor now it will go back 
		; to 16 bit protected mode label ToReal 
		; and it is on its way to real mode 
		; this will be a 32 bit segment to 16 bit 
		; segment transfer using a descriptor 
T32End          ENDP
;***************************************************************************
; PUTHEX32P Procedure 
;***************************************************************************
;This procedure prints the value in EAX in hex-format in PMode.
;Usage in PMode: load eax with a value, load ebx with the position of the screen
;and call this procedure 'CALL32  ProtModeProcGate1_Sel,0'
; This procedure automatically increments ebx value to the next location
;---------------------------------------------------------------------------
PUTHEX32P       PROC    FAR
	PUSH    ECX
	PUSH    EDI
	PUSH	DS
	push	eax

	push 	ebx
	push    eax

	mov     ax,Puthex32Data_Sel
	mov     ds,ax

	pop     eax
	pop	ebx

	MOV     PrintDataP, eax         ; save data in memory
	MOV     ecx, 8                  ; eight characters
PutHexLoopP:
	MOV     eax, PrintDataP         ; data in eax
	AND     eax, 0F0000000h         ; select first nibble
	ROL     eax,4                   ; get the count on right
	MOV     IndexCntP, eax          ; store the index 
	MOV     edi, IndexCntP 
	MOV     al, BYTE PTR HexTableP[edi]  ; get hex character

	add     ebx,2                   ; Next character
	int     0f7h			

	MOV     eax, PrintDataP         ; get the stored data
	SHL     eax, 4                  ; shift to next nibble
	MOV     PrintDataP, eax         ; store remaining data 
	LOOP    PutHexLoopP             ; print all 8 hex characters

	pop	eax
	POP     DS
	POP     EDI
	POP     ECX
;---------------------------------------------------------------------------------
;changed this code on 7-7-2004
	push	edx
	pushfd ; turn off NT flag in the CPU not in the TSS
	; so that CPU will return to its application during IRETD not to 
	;  exit from the task using link field in the TSS 
	pop	edx
	AND	edx, 0FFFFBFFFh
	push	edx
	popfd
	pop	edx
;--------------------------------------------------------------------------------
	IRETD
PUTHEX32P       ENDP
;***************************************************************************
; TEST Procedure 
;***************************************************************************
;This procedure prints the value in EAX in hex-format in PMode.
;Usage in PMode: load eax with a value, load ebx with the position of the screen
;and call this procedure 'CALL32  ProtModeProcGate1_Sel,0'
;---------------------------------------------------------------------------
APPSCHEDULE     PROC    FAR
	push	eax
	push	ebx
	mov	al,'A'
	mov	ebx,1500
	int 	0f7h
	pop	ebx
	pop	eax
		
APPSCHEDULE	ENDP

;***************************************************************************
;This Procedure prints the memory in hex-format in Protected mode
;place the memory location in EAX and position to display in EBX and call.
;***************************************************************************
PRINTMEMP       PROC    FAR

	PUSH    ECX
	PUSH    ESI
	PUSH    EDI
	PUSH    DS
	push	fs
	
	push    eax
	mov     ax,ProtModeProcData_Sel
	mov     ds,ax
	pop     eax

	push    eax
	mov     ax,PrintMemProcData_Sel
	mov     fs,ax
	pop     eax

	mov     ebx,800                  ; use CursorPos = 2 or 800 to start 
	mov     edi,eax                  ; 
	mov     ecx,128

	memloop:
	mov     eax,fs:[edi]    
	int	0fdh

	add     ebx,4
	add     edi,4
	loop    memloop

	pop	fs
	POP     DS
	POP     EDI
	POP     ESI
	POP     ECX
	RETF

PRINTMEMP       ENDP
;***************************************************************************
; Print Stack Procedure 
;  When printing stack, make sure you do not exceed the limit of the stack 
;  ex. when you print DemoStack0 then the limit is DemoStack0Len 
; eax must have number of bytes to print 
; ebx must have the starting point of display to print 
; esp is used as current stack pointer 
; ss  is used as current stack segment 
; the printing is done from current esp to the top of the stack 
; user must make sure that you are not exceeding the limits of the stack 
;-------------------------------
;    |           |
;    |-----------|  SS  Limit 
;    | contents  |
;    |           |
;    |           |  
;    |-----------| <--- ESP
;    | EMPTY     |   
;    |           | 
;    ------------- 0
;    Stack Growing Downward 
; -----------------------------
;   push ebp  do not disturb ebp in a call   
;   mov ebp, esp
;   you must not disturb ESP in a call 
;     if you are using the stack 
;   you must save and restore ESP in a call 
;   pop ebp   resore ebp when you return  
;------------------------------
;***************************************************************************
PRINTSTP PROC FAR 

	push    ebp        ; save bp 
	mov     ebp,esp
	
	push    esi
	push	ecx
	push	edi
	push	edx
;-----------------------------------------------------------
; set DS for accessing protected mode data for PUTHEX32P rtn
;-----------------------------------------------------------
	push	ds

	push    eax      ; save eax on stack 
	mov     ax,ProtModeProcData_Sel
	mov     ds,ax
        pop	eax      ; restore eax value passed 
; starting point of printing on display at ebx 
	mov	edi,eax	 ; no of stack entries or bytes to print	
	mov 	edx, 16  ; next line counter 

	mov	esi, 0	 ; starting point of print
LOOPSTACK1:
	mov     eax,ss:[ebp+esi]
	
	push	eax
	push	ebx
	mov	eax,0	
	str	ax
	mov	ebx,1120
	int	0fdh
	pop	ebx
	pop	eax

	CALL32  Puthex32PGate_Sel, 0

	add	ebx, 2 

        sub	edx, 2  ; line counter 
	cmp 	edx, 0  ; ready to go to next line 
	JNZ	NONEWLINEP
	add	ebx, 16 ; next line pointer 
	mov	edx, 16
    NONEWLINEP: 
	add     esi,4
	cmp     edi,esi
	JNZ     LOOPSTACK1

	pop	ds
        pop	edx 
	pop     edi
	pop	ecx
	pop	esi
	pop     ebp         ; restore reg values 

	RETF    

PRINTSTP ENDP               ; end of procedure 
;***************************************************************************
; This proc copies the data from 0000:[8400] to above 1 meg memmory
; staring from the address given in the descriptor StartAddress_Sel
; and gets the offset from BxPointer1.
; Dont use ds to get the BxPointer1 as BxPointer1 is in 16 bit Dataseg 
; because the default dataseg for this code segment is a 32 bit dataseg
; because of the ASSUME directive
; when user input the offset value for the program to be loaded 
;  it is stored in LoadOffset1 and then it is transferred to BxPointer1
; then BxPointer1 is used to store each sector in the memory 
; LoadOffset1 contains the 32 bit offset entered by the user for app1  
;***************************************************************************

RDWTMEM         PROC    FAR

		mov	ax,RealData_Sel
		mov	gs,ax     	;real data segment 

                ; offset is stored at BxPointer1 in memory prload.asm  
		mov	eax,gs:[BxPointer1]
		mov	ebx,3958        ; print offset at the bottom of screen 
		int	0fdh            ;   puthex32 gate to print  
		
		;int 0f5h 		; wait for the keyboard 
		; real mode interrupts do not work here 

		mov	ax,StartAddress_Sel
		mov	fs,ax        	; start addr above 1M 
		
		mov	ax,Buffer_Sel 	; 8400 buffer location select 
		mov	es,ax
		
		mov	esi,0h    	; pointer for buffer 
		mov	edi,gs:[BxPointer1]  			
		mov     ecx,128  	;one sector 
		; copy all words in the sector to above 1M 
ReadWrite1:
		mov	eax,es:[esi]
		mov	fs:[edi],eax

		add	esi,4
		add	edi,4

		LOOP    ReadWrite1

		RETF
		
RDWTMEM         ENDP
;----------------------------------------------------------------------------
;***************************************************************************
;HTimerBegin Procedure 
; Now it will just display it.
; Whenever a hardware timer 08h arrives, this procedure will be called thu 
;  the interrupt gate 
; we start our timer value with 0 and increment the value in memory each 
; time the interrupt comes, i.e. every 55 milli seconds 
;***************************************************************************
HTimerBegin PROC FAR
		cli
		push	eax
		push	ebx
		push	edx
		push	fs

		mov	eax, 'T'
		mov	ebx, 3996
		int	0f7h	

		mov	ax, MEMData_Sel ; zero base in protected mode  
		mov	fs, ax
		mov	ebx,S_Base	;base of shared memory between aoa and application
		add	ebx,S_Timer		;index of timer in shared memory
		
		mov	eax, fs:[ebx]
		inc	eax
		mov	fs:[ebx], eax

		mov	dx, 20h
		mov	al, 20h
		out	dx, al 
		jmp	$+2

		;mov	ax, 'H'
		;mov	ebx, 3990
		;int 	0f7h

		pop	fs
		pop	edx
		pop	ebx
		pop	eax
		;-----------------------------------------------------------------
		;changed this code on 7-7-2004
		push	edx  ;save edx on the stack 
		pushfd ; turn off NT flag in the CPU not in the TSS
		; so that CPU will return to its application during IRETD not to 
		;  exit from the task using link field in the TSS
		pop	edx ; get the flags into edx 
		AND	edx, 0FFFFBFFFh ; reset NT flag 
		push	edx             ; store in the stack 
		popfd                   ; get the flags into flag register 
		pop	edx ; restore edx 
     		;-----------------------------------------------------------------
		sti

		iretd
HTimerBegin ENDP


test1 PROC FAR
		cli
		push	eax
		push	ebx
		push	edx
		push	fs

		;mov	eax, 'T'
		;mov	ebx, 800
		;int	0f7h	

		mov	ax, MEMData_Sel ; zero base in protected mode  
		mov	fs, ax
		mov	ebx,S_Base	;base of shared memory between aoa and application
		add	ebx,S_Timer		;index of timer in shared memory
		
		mov	eax, fs:[ebx]
		;inc	eax
		mov	fs:[ebx], eax

		mov	ebx, 660
		int	0fdh

		mov	dx, 20h
		mov	al, 20h
		out	dx, al  ; read timer interrupt 
		jmp	$+2

		mov	ax, 'I'
		mov	ebx, 640
		int 	0f7h

		pop	fs
		pop	edx
		pop	ebx
		pop	eax
		sti
		iretd
test1 ENDP





;-----------------------------------------------------------------
; get the current cursor postion
; return it in ax
GetCursor	proc far 
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
		
;---------------------------------------------------------------------------------
;changed this code on 7-7-2004
		;cli
		push	edx
		pushfd ; turn off NT flag in the CPU not in the TSS
		; so that CPU will return to its application during IRETD not to 
		;  exit from the task using link field in the TSS 
		pop	edx;
		AND	edx, 0FFFFBFFFh
		push	edx
		popfd
		pop	edx
		;sti
;--------------------------------------------------------------------------------
	
		iretd
GetCursor	endp

;--------------------------------------------------------------------------------
; set cursor postion
; ax hodes the cursor value
;--------------------------------------------------------------------------------
SetCursor	proc far
		push	eax
		push	edx
		push	ebx
		
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
		pop	eax
;---------------------------------------------------------------------------------
;changed this code on 7-7-2004
		;cli
		push	edx
		pushfd ; turn off NT flag in the CPU not in the TSS
		; so that CPU will return to its application during IRETD not to 
		;  exit from the task using link field in the TSS 
		pop	edx;
		AND	edx, 0FFFFBFFFh
		push	edx
		popfd
		pop	edx
		;sti
;--------------------------------------------------------------------------------	
		iretd
SetCursor	endp

;--------------------------------------------------------------------------------	
; scroll one line up
;--------------------------------------------------------------------------------	
scroll		proc far
		push	ecx
		push	edi
		push	esi
		push	es
		push	ds
		
		mov	ax, Video_Sel
		mov	fs, ax

		mov	cx, 1920
		mov	bx, 0
Movenext:
		mov	ax, fs:[bx+160]
		mov	fs:[bx], ax
		add	bx, 2
		loop	Movenext
		
		mov	cx, 80
		mov	bx, 3839
		mov	ax, 0
Clearnext:
		mov	fs:[bx], ax
		add	bx, 2
		loop	Clearnext
		
		mov	ax, 1920
		int	0f3h

		pop	ds
		pop	es
		pop	esi
		pop	edi
		pop	ecx
;---------------------------------------------------------------------------------
;changed this code on 7-7-2004
		cli
		push	edx
		pushfd ; turn off NT flag in the CPU not in the TSS
		; so that CPU will return to its application during IRETD not to 
		;  exit from the task using link field in the TSS 
		pop	edx
		AND	edx, 0FFFFBFFFh
		push	edx
		popfd
		pop	edx
		sti
;--------------------------------------------------------------------------------
		iretd
scroll		endp

; clean screen
CLScreen 	PROC far
		push 	ebx
		push 	ecx
		push 	eax
		push 	fs
		
		mov 	cx, 2000		
		mov 	ax, Video_Sel		
		mov	fs,ax		
		mov	bx, 0
		mov	ax,0		
	next:	mov	Word ptr fs:[bx], ax
		add	bx,2
		loop    next		
		
		pop	fs
		pop	eax
		pop	ecx
		pop	ebx
;---------------------------------------------------------------------------------
;changed this code on 7-7-2004
		cli
		push	edx
		pushfd ; turn off NT flag in the CPU not in the TSS
		; so that CPU will return to its application during IRETD not to 
		;  exit from the task using link field in the TSS 
		pop	edx
		AND	edx, 0FFFFBFFFh
		push	edx
		popfd
		pop	edx
		sti
;--------------------------------------------------------------------------------
	
		iretd
CLScreen	ENDP

;------------------------------------------------------
; return a character in al
;------------------------------------------------------
Getchar32	PROC FAR
		push	ebx
		push	ecx
		push	edx
		push	esi
		push	fs
		
		mov	ax, RData_Sel 
		mov	fs, ax

		mov	eax, offset KKQ
		mov	esi, eax

		xor	eax, eax
		int	0f2h
		mov	dx, ax
		push	dx
		mov	bx, 2
		mul	bx	
		pop	dx
		mov	ecx, eax

WaitChar:
		mov	bl, fs:[KHead]
		mov	bh, fs:[KTail]
		cmp	bl, bh
		je	WaitChar

		xor	ebx, ebx
		mov	bl, fs:[KTail]
		add	esi, ebx 
		mov	al, byte ptr fs:[esi]

		cmp	bl, 254 
		jz	RoundChar
		inc	bl
		jmp	UpdateChar
RoundChar:
		mov	bl, 0
UpdateChar:
		mov	fs:[KTail], bl

		push	eax
		cmp 	al, 13
		jz	NDisp
		mov	ebx, ecx 
		int	0f7h  ; echo the character 
NDisp:
		inc	dx
		cmp	dx, 2000
		jl	CursorOK
		int	0f0h
		jmp	Charout
CursorOK:
		mov	ax, dx
		int	0f3h
Charout:

		pop	eax
		
		pop	fs
		pop 	esi
		pop	edx
		pop	ecx
		pop	ebx

;---------------------------------------------------------------------------------
;changed this code on 7-7-2004
		;cli
		push	edx
		pushfd ; turn off NT flag in the CPU not in the TSS
		; so that CPU will return to its application during IRETD not to 
		;  exit from the task using link field in the TSS 
		pop	edx
		AND	edx, 0FFFFBFFFh
		push	edx
		popfd
		pop	edx
		;sti
		iretd	
Getchar32	ENDP
;---------------------------------------------------------------------------------------------
; This is there is a char in the Keybord buffer it will return the char else it will return -1
;--------------------------------------------------------------------------------

Getchar32Buff	PROC FAR
		;cli
		push	ebx
		push	ecx
		push	edx
		push	esi
		push	fs
		
		mov	ax, RData_Sel 
		mov	fs, ax

		mov	eax, offset KKQ
		mov	esi, eax

		xor	eax, eax
		int	0f2h
		mov	dx, ax
		push dx
		mov	bx, 2
		mul	bx	
		pop	dx
		mov	ecx, eax

WaitChar1:
		mov	bl, fs:[KHead]
		mov	bh, fs:[KTail]
		cmp	bl, bh
		jne	getc
		mov     ax,0FEh
		push	eax
		jmp     Charout1	

getc:	xor	ebx, ebx
		mov	bl, fs:[KTail]
		add	esi, ebx 
		mov	al, byte ptr fs:[esi]

		cmp	bl, 254 
		jz	RoundChar1
		inc	bl
		jmp	UpdateChar1
RoundChar1:
		mov	bl, 0
UpdateChar1:
		mov	fs:[KTail], bl

		push	eax
		cmp 	al, 13
		jz	NDisp1
		mov	ebx, ecx 
		int	0f7h  
        ; echo the character 
NDisp1:
		inc	dx
		cmp	dx, 2000
		jl	CursorOK1
		int	0f0h
		jmp	Charout1
CursorOK1:
		mov	ax, dx
		int	0f3h
Charout1:
		pop	eax
		
		pop	fs
		pop esi
		pop	edx
		pop	ecx
		pop	ebx
		;sti
;---------------------------------------------------------------------------------
;changed this code on 7-7-2004
		;cli
		push	edx
		pushfd ; turn off NT flag in the CPU not in the TSS
		; so that CPU will return to its application during IRETD not to 
		;  exit from the task using link field in the TSS 
		pop	edx
		AND	edx, 0FFFFBFFFh
		push	edx
		popfd
		pop	edx
		;sti
;--------------------------------------------------------------------------------
		iretd	
Getchar32Buff	ENDP

;-----------------------------------------------------------------
; FDC_int
; Floppy interrupt handler
;-----------------------------------------------------------------
FDC_int		PROC FAR
		push	eax
		push	ebx
		push	edx
		push	fs

		mov	ax, RData_Sel
		mov	fs, ax

		mov	al, 1
		mov	fs:[FloppyReady], al
		
		mov	dx, 20h
		mov	al, 20h
		out	dx, al
		
		pop	fs
		pop	edx
		pop	ebx
		pop	eax
;---------------------------------------------------------------------------------
;changed this code on 7-7-2004
		cli
		push	edx
		pushfd ; turn off NT flag in the CPU not in the TSS
		; so that CPU will return to its application during IRETD not to 
		;  exit from the task using link field in the TSS 
		pop	edx
		AND	edx, 0FFFFBFFFh
		push	edx
		popfd
		pop	edx
		sti
;--------------------------------------------------------------------------------
	
		iretd
FDC_int		ENDP
;-----------------------------------------------------------------
;***************************************************************************
;Memory interface entry
;  This interrupt is not used at this point 
; It can be used for other purposes 
; The procedure is kept to make sure that there 256 interrupts in IDT  
;***************************************************************************
MEMInterface	PROC	FAR

		iretd
MEMInterface	ENDP
;***************************************************************************
;Store a value in memory
;  This interrupt is not used at this point 
; It can be used for other purposes 
; The procedure is kept to make sure that there 256 interrupts in IDT  
;***************************************************************************
getTaskPtr	PROC	FAR;
;
;		push	gs
;		
;		mov	ax, RData_Sel   	; real data segment base 
;		mov	gs, ax          	; gs has real data segment base 
;		
;		mov	eax, gs:[APP1TSSAddr]	;get APP1TSSSeg Address
;		
;		pop 	gs
;		
;		iretd
getTaskPtr	ENDP
;***************************************************************************
;Fetch a value from memory
;  This interrupt is not used at this point 
; It can be used for other purposes 
; The procedure is kept to make sure that there 256 interrupts in IDT  
;***************************************************************************
MEMFetch	PROC	FAR
		
		iretd
MEMFetch	ENDP
;***************************************************************************
; This is a Malloc() type funtion 
;   Unused space in memory outside compiler reachable area in main memory 
;   User manage his own memory, system has base and limit of memory areas 
; return no of bytes of memory available in eax and address ptr as return value
; int AOAmalloc(int*)  using INT 0EEh
; ebx has the no of bytes and eax has the pointer
;***************************************************************************
MEMMalloc	PROC	FAR
		push	ecx            ; save called values
		push	esi
		push	fs
		push	gs
		
	;	mov	ax, MEMData_Sel ;this data selector has 0 base 
	;	mov	fs, ax          ; 0 base 
		mov	ax, RData_Sel   ; real data segment base 
		mov	gs, ax          ; gs has real data segment base 

		mov	eax, gs:[MEMBase] ; get MEMBase value in memory 0200 0000 
		mov	ecx, gs:[MemLimit]; get MEMLimit value in memory 0400 0000
		sub	ecx, eax 	; total no of bytes of memory available 
		mov	ebx, ecx	; Return ebx pointer, which is the size of memory allocated
		
		pop	gs   ; pop all restored values 
		pop	fs
		pop	esi
		pop	ecx
;---------------------------------------------------------------------------------
;changed this code on 7-7-2004
		cli
		push	edx
		pushfd ; turn off NT flag in the CPU not in the TSS
		; so that CPU will return to its application during IRETD not to 
		;  exit from the task using link field in the TSS 
		pop	edx
		AND	edx, 0FFFFBFFFh
		push	edx
		popfd
		pop	edx
		sti
;--------------------------------------------------------------------------------
	
		iretd
MEMMalloc	ENDP
;***************************************************************************
; MEMFree to free memory 
; not used at this point 
; it can be used for other interrupt 
;***************************************************************************
MEMFree	PROC	FAR
		
		iretd
MEMFree		ENDP
;***************************************************************************
; ebx has the position and al has the character to display 
;***************************************************************************
DisplayBegin    PROC    FAR
		cli
		push	es
        push    eax      ;save eax
		push	eax	 

		mov     ax,Video_Sel
		mov     es,ax
		pop	eax
		;mov     ah,17h
		;mov	ah, 7 
        mov	ah, 1fh 
        mov     WORD PTR es:[ebx],ax
		pop     eax
		pop	es
 		
     	;-----------------------------------------------------------------
		;changed this code on 7-7-2004
		push	edx
		pushfd ; turn off NT flag in the CPU not in the TSS
		; so that CPU will return to its application during IRETD not to 
		;  exit from the task using link field in the TSS
		pop	edx
		AND	edx, 0FFFFBFFFh
		push	edx
		popfd
		pop	edx
        ;-----------------------------------------------------------------
		sti
		iretd	
		
DisplayBegin    ENDP

;----------------------------------------------------------------------------
DemoCodeLen     =       $
;----------------------------------------------------------------------------
DemoCodeSeg     ENDS                            
;----------------------------------------------------------------------------
;----------------------------------------------------------------------------
; PCodeSeg
; 16 bit segment for protect mode procedures which have to be in 16 bit segment
;____________________________________________________________________________
PCodeSeg        SEGMENT PARA public USE16 'CODE'
		ASSUME  CS:PCodeSeg,DS:RDataSeg
;***************************************************************************
;Keyboard_Int Procedure 
; OUR Hardware keyboard INTERRUPT
;***************************************************************************
Keyboard_Int PROC FAR
		push 	eax
		push	ebx
		push	ecx
		push	edx
		push	esi
		push	ds
		push	fs
	     
	        MOV 	AX, RData_sel            ;Set up addressing   
	        MOV  	fS, AX
		mov 	ds, ax
		cli	; disable interrupt
		
		mov	dx, 60h ; get a char from keyboard buffer
		in	al, dx
		
		mov	scan, al
		movzx	eax, scan
		JMP L_keybd2
L_keybd3:
		XOR EAX,EAX
		MOV CtrlStat, AL
		JMP L_keybd1
L_keybd4:
		XOR EAX,EAX
		MOV AltStat, AL
		JMP L_keybd1
L_keybd5:
		mov al, 0	; release shift key
		MOV ShiftStat, AL
		JMP L_keybd1
L_keybd6:
		mov al, 0	; release shift key
		MOV ShiftStat, AL
		JMP L_keybd1
L_keybd7:
		MOV EAX,1
		MOV CtrlStat, AL
		JMP L_keybd1
L_keybd8:
		MOV EAX,1
		MOV AltStat, AL
		JMP L_keybd1
L_keybd9:
		MOVSX EAX,ShiftStat
		MOV ECX,2
		OR EAX,ECX
		mov al, 1	; press shift key
		MOV ShiftStat, AL
		JMP L_keybd1
L_keybd10:
		MOVSX EAX,ShiftStat
		MOV ECX,1
		OR EAX,ECX
		mov al, 1	; press shift key
		MOV ShiftStat, AL
		JMP L_keybd1
L_keybd11:
		INC CapLock
		MOVSX EAX,CapLock
		MOV ECX,1
		AND EAX,ECX
		MOV CapLock, AL
		KeyboardLED NumLock, CapLock
		JMP L_keybd1
L_keybd12:
		INC NumLock
		MOVSX EAX,NumLock
		MOV ECX,1
		AND EAX,ECX
		MOV NumLock, AL
		KeyboardLED NumLock, CapLock
		JMP L_keybd1
		
L_keybd13:
		INC ScrLock
		MOVSX EAX,ScrLock
		MOV ECX,1
		AND EAX,ECX
		MOV ScrLock, AL
		JMP L_keybd1
L_keybd14:
		MOVSX EAX,scan
		MOV ECX,128
		AND EAX,ECX
		JNZ L_keybd15
		MOV EAX,OFFSET keyTable1
		MOV ESI, EAX
		MOVSX EAX,scan
		ADD ESI,EAX
		MOVSX EAX,BYTE PTR [ESI]
		MOV ascii, AL
		MOVSX EAX,ascii
		CMP EAX,97
		SETGE AL
		AND AL,AL
		JZ L_keybd20
		MOVSX EAX,ascii
		CMP EAX,122
		SETLE AL
		AND AL,AL
		JZ L_keybd20
		MOVSX EAX,ShiftStat
		AND EAX,EAX
		JZ L_keybd18
		MOVSX EAX,CapLock
		AND EAX,EAX
		SETZ AL
		AND AL,AL
L_keybd18:
		JNZ L_keybd20
		MOVSX EAX,CapLock
		AND EAX,EAX
		JZ L_keybd20
		MOVSX EAX,ShiftStat
		AND EAX,EAX
		SETZ AL
		AND AL,AL
L_keybd20:
		JZ L_keybd21
		MOVSX EAX,ascii
		MOV ECX,32
		SUB EAX,ECX
		MOV ascii, AL
		JMP L_keybd24
L_keybd21:
		MOVSX EAX,ShiftStat
		AND EAX,EAX
		JZ L_keybd23
		MOVSX EAX,ascii
		JMP L_keybd25
L_keybd26:
		MOV EAX,33
		MOV ascii, AL
		JMP L_keybd24
L_keybd27:
		MOV EAX,64
		MOV ascii, AL
		JMP L_keybd24
L_keybd28:
		MOV EAX,35
		MOV ascii, AL
		JMP L_keybd24
L_keybd29:
		MOV EAX,36
		MOV ascii, AL
		JMP L_keybd24
L_keybd30:
		MOV EAX,37
		MOV ascii, AL
		JMP L_keybd24
L_keybd31:
		MOV EAX,94
		MOV ascii, AL
		JMP L_keybd24
L_keybd32:
		MOV EAX,38
		MOV ascii, AL
		JMP L_keybd24
L_keybd33:
		MOV EAX,42
		MOV ascii, AL
		JMP L_keybd24
L_keybd34:
		MOV EAX,40
		MOV ascii, AL
		JMP L_keybd24
L_keybd35:
		MOV EAX,41
		MOV ascii, AL
		JMP L_keybd24
L_keybd36:
		MOV EAX,95
		MOV ascii, AL
		JMP L_keybd24
L_keybd37:
		MOV EAX,43
		MOV ascii, AL
		JMP L_keybd24
L_keybd38:
		MOV EAX,15
		MOV ascii, AL
		JMP L_keybd24
L_keybd39:
		MOV EAX,123
		MOV ascii, AL
		JMP L_keybd24
L_keybd40:
		MOV EAX,125
		MOV ascii, AL
		JMP L_keybd24
L_keybd41:
		MOV EAX,58
		MOV ascii, AL
		JMP L_keybd24
L_keybd42:
		MOV EAX,34
		MOV ascii, AL
		JMP L_keybd24
L_keybd43:
		MOV EAX,126
		MOV ascii, AL
		JMP L_keybd24
L_keybd44:
		MOV EAX,124
		MOV ascii, AL
		JMP L_keybd24
L_keybd45:
		MOV EAX,60
		MOV ascii, AL
		JMP L_keybd24
L_keybd46:
		MOV EAX,62
		MOV ascii, AL
		JMP L_keybd24
L_keybd47:
		MOV EAX,63
		MOV ascii, AL
		JMP L_keybd24
L_keybd25:
		CMP EAX,47
		JE L_keybd47
		CMP EAX,46
		JE L_keybd46
		CMP EAX,44
		JE L_keybd45
		CMP EAX,92
		JE L_keybd44
		CMP EAX,96
		JE L_keybd43
		CMP EAX,39
		JE L_keybd42
		CMP EAX,59
		JE L_keybd41
		CMP EAX,93
		JE L_keybd40
		CMP EAX,91
		JE L_keybd39
		CMP EAX,9
		JE L_keybd38
		CMP EAX,61
		JE L_keybd37
		CMP EAX,45
		JE L_keybd36
		CMP EAX,48
		JE L_keybd35
		CMP EAX,57
		JE L_keybd34
		CMP EAX,56
		JE L_keybd33
		CMP EAX,55
		JE L_keybd32
		CMP EAX,54
		JE L_keybd31
		CMP EAX,53
		JE L_keybd30
		CMP EAX,52
		JE L_keybd29
		CMP EAX,51
		JE L_keybd28
		CMP EAX,50
		JE L_keybd27
		CMP EAX,49
		JE L_keybd26
L_keybd23:
L_keybd24:
		mov eax, offset KKQ
		mov esi, eax
		mov bl, fs:[KHead]
		mov bh, fs:[KTail]

		cmp bl, 254
		jnz Nottail
		mov bl, 0
		jmp Cmpequal
Nottail:
		inc bl
Cmpequal:
		cmp bl, bh
		je L_keybd1 ; keyboard buffer full
		
		xor ebx, ebx
		mov bl, fs:[KHead]
		add esi, ebx
		mov al, ascii
		mov fs:[esi], al

		cmp bl, 254
		jb Nottail2
		
		mov bl, 0
		jmp Cmpequal2
Nottail2:
		inc bl
Cmpequal2:
		mov fs:[KHead], bl
L_keybd15:
		JMP L_keybd1
L_keybd2:
		CMP EAX,70
		JE L_keybd13
		CMP EAX,69
		JE L_keybd12
		CMP EAX,58
		JE L_keybd11
		CMP EAX,54
		JE L_keybd10
		CMP EAX,42
		JE L_keybd9
		CMP EAX,56
		JE L_keybd8
		CMP EAX,29
		JE L_keybd7
		CMP EAX,182
		JE L_keybd6
		CMP EAX,170
		JE L_keybd5
		CMP EAX,184
		JE L_keybd4
		CMP EAX,157
		JE L_keybd3
		JMP L_keybd14
L_keybd1:
		in al, 61h	; acknowledge the key
		mov ah, al
		or al, 80h
		out 61h, al
		mov al, ah
		out 61h, al
		
		MOV AL,20h                       ;Tell interrupt handler we're done
		OUT 20h,AL
		STI                              ;enable interrupts	
		
		pop	fs
		pop	ds
		pop	esi
		pop	edx
		pop	ecx
		pop	ebx
		pop	eax
;---------------------------------------------------------------------------------
;changed this code on 7-7-2004
		cli
		push	edx
		pushfd ; turn off NT flag in the CPU not in the TSS
		; so that CPU will return to its application during IRETD not to 
		;  exit from the task using link field in the TSS 
		pop	edx
		AND	edx, 0FFFFBFFFh
		push	edx
		popfd
		pop	edx
		sti
;--------------------------------------------------------------------------------
iretd
Keyboard_Int ENDP

;***************************************************************************
;SearchBegin Procedure 
; Find a given pattern in memory
; fs has RDataSel 
; es has base 0 descriptor for 4GB limit SearchForData_Sel
; searches memory from 00000000h to 10000000h
;***************************************************************************
SearchBegin	PROC	FAR

		mov	eax, offset SearchKey
		mov	edi, eax
		xor	ecx, ecx
		xor	edx, edx
GtChar:

		int	0fch   ; get a character at a time to read pattern 
		mov	al, fs:[StoreChar] ; store the char temporarily
		cmp	al, 0dh         ; check if it is end of line 
		je	Search  ; if it is end of line then search 
		
		inc	cx      ; get next character 
		mov	byte ptr [edi], al ; move the character to key storage 
		inc	edi     ; next poitner for key 	
		jmp	GtChar  ; loop until end of line 
	
	Search:
		mov	fs:[SearchLen], cx	; Key length

		; Serch between 00000000H and 10000000H	
		mov	edx, 800  ; starting point of printing on the screen
		xor	eax, eax
		mov	edi, eax  ; destination index with 0 value 
		mov     ecx, 0    ; start counter 4 byte with 0 value 

		mov 	eax, offset SearchKey  ; offset only
		mov	esi, eax  ; offset in the source index 
		mov	cx, fs:[SearchLen]  ; 4 byte length 

	Search1:
		
		mov	bl, byte ptr fs:[esi] ; get first byte of the key 
		cmp	bl, byte ptr es:[edi] ; starting from 00000000h
		jz	Search2   ; first char matched go for next char 

		inc	edi  ; next 
		cmp	edi, 10000000h ; max limit  
		jb	Search1 ; go to next location at destination 	
		jmp	retn2   ; limit is done, quit 

	Search2:
		push	esi
		push	edi
	Search3:
		dec	cx	
		jcxz	FindIt
		inc	esi
		inc	edi
		cmp	edi, 10000000h	; search over
		jae	retn1
		mov	bl, byte ptr fs:[esi]
		cmp	bl, byte ptr es:[edi]
		jz	Search3

		pop	edi
		pop	esi
		
		inc	edi
		cmp	edi, 10000000h
		jae	retn2
		mov	cx, fs:[SearchLen]
		jmp	Search1
		
	FindIt:
		mov	eax, edi
		pop	edi
		pop	esi
		mov	edi, eax
		xor	ecx, ecx
		mov	cx, fs:[SearchLen]
		dec	cx
		sub	eax, ecx
	
		mov	ebx, edx
		int	0fdh
		add	edx, 18 
		
		inc	edi
		cmp	edi, 10000000h
		jae	retn2
		jmp	Search1
		
	retn1:
		pop	edi
		pop	esi
	retn2:
	
		;This loop displays the destination address at the end the search
		push 	eax
		push 	ebx
	 	mov	eax,edi ; This prints the destination address of search
		mov	ebx, 2800
		int 	0fdh
		pop	ebx
		pop	eax
	
         	
		iretd
		jmp	SearchBegin
SearchBegin	ENDP
PCodeLen     =       $
PCodeSeg	ends
;***************************************************************************
; DMADataSeg
; 16 bit, aligned on page
; Used for DMA transfer
;***************************************************************************
DMADataSeg	SEGMENT PARA PUBLIC USE16 'DMADATA'
DB	256 DUP(0)
DB	256 DUP(0)
DMADataSeg	ENDS
;***************************************************************************
; MEMStructureSeg
; 16 bit, aligned on page
; Used for memory structure
; every variable is 18 bytes and has such structure:
; DQ, start address
; DQ, size
; DB, variable type
; DB, valid
; program can allocate 2000 variables
;***************************************************************************
;MEMStructureSeg	SEGMENT PARA PUBLIC USE16 'MEMSTRDATA'
;DB	36000 DUP(0)
;MEMStructureSeg	ENDS
;***************************************************************************
;RDataSeg Segment 
;  16 bit segment 
;  all real mode data should be included in this segment 
;***************************************************************************
;
RDataSeg        SEGMENT PARA  public USE16  'REALDATA'
;
;----------------------------------------------------------------------------
;GDT 
;This example has a base of 00100200h
;LimitL         BaseL           BaseM   Attributes      LimitH          BaseH
;----------------------------------------------------------------------------
;FF FF          00 02           10      92              8F              00
;----------------------------------------------------------------------------
;LSB1,2nd       LSB1,2nd                P DPL S Type    G D 0 AVL Limit
;----------------------------------------------------------------------------
;P- Segment Present,S-system(callgate must have 0 for S)
;G-Granularity,D=0 ->16bit segment and addressess and D=1->32 bit
;For CallGate   Type=1100
;-----------------------------------------
; FF|FF|00|02|10|92|8F|00
;      |     |  |  |  |  
;LimitL|BaseL|BaseM|Attributes|GD0AVL,LimitH|BaseH 
; 00 10 02 00 
; BaseH BaseM BaseL2nd BaseL1st 
; BYTE 0  --- BYTE 7 
;-----------------------------------------
;----------------------------------------------------------------------------

GDT             LABEL   BYTE
DUMMY           Desc    <00000h,00000h, 000h, 000h, 000h, 000h> ; dummy characters for reference 
; It changed from RELOCATE1 to 0800h, seems to have no effect 
; prcycle code is starting at 0800h 
Normal          Desc    <0ffffh,0800h,,ATDW,,>
VideoBuf        Desc    <07fffh,8000h,0bh,ATDW+DPL3,,>
EFFGDT          LABEL   BYTE   ; starting point of GDT entry 
;----------------------------------------------------------------------
;RELOCATE1 should be a segment register value not the 32 bit address 
;All base addressess should be initialised like a segment register.
;----------------------------------------------------------------------
RData  		Desc 	<0ffffh,RDataSeg+RELOCATE1,,ATDW,,>       ;for loading fs
DemoTSS         Desc    <DemoTssLen-1,DemoTSSSeg+RELOCATE1,,AT386TSS,,>
DemoLDTD        Desc    <DemoLDTLen-1,DemoLDTSeg+RELOCATE1,,ATLDT,,>
TempCode        Desc    <0ffffh,RCodeSeg+RELOCATE1,,ATCE,,>     ;RCodeSeg
Other           Desc    <RCodeLen-1,RCodeSeg+RELOCATE1,,ATCE,,>
GetCharTSS      Desc    <GetCharTSSLen-1,GetCharTSSSeg+RELOCATE1,,AT386TSS,,>  ;AT386TSS = 89h
GetDecTSS       Desc    <GetDecTSSLen-1,GetDecTSSSeg+RELOCATE1,,AT386TSS,,>  ;AT386TSS = 89h
GetSecTSS       Desc    <GetSecTSSLen-1,GetSecTSSSeg+RELOCATE1,,AT386TSS,,>  ;AT386TSS = 89h
WriteSecTSS     Desc    <WriteSecTSSLen-1,WriteSecTSSSeg+RELOCATE1,,AT386TSS,,>  ;AT386TSS = 89h
GKeyTSS         Desc    <GKeyTSSLen-1,GKeyTSSSeg+RELOCATE1,,AT386TSS,,>  ;AT386TSS = 89h
GKeyLDT         Desc    <GKeyLDTLen-1,GKeyLDTSeg+RELOCATE1,,ATLDT,,>
GetCharLDT      Desc    <GetCharLDTLen-1,GetCharLDTSeg+RELOCATE1,,ATLDT,,>
GetDecLDT       Desc    <GetDecLDTLen-1,GetDecLDTSeg+RELOCATE1,,ATLDT,,>
GetSecLDT       Desc    <GetSecLDTLen-1,GetSecLDTSeg+RELOCATE1,,ATLDT,,>
WriteSecLDT     Desc    <WriteSecLDTLen-1,WriteSecLDTSeg+RELOCATE1,,ATLDT,,>
Puthex32Data  	Desc 	<ProtModeProcDataLen-1,ProtModeProcDataSeg+RELOCATE1,,ATDW,D32,0h>
Puthex32I	Desc    <DemoCodeLen-1,DemoCodeSeg+RELOCATE1,,ATCE,D32,>
SearchLDT	Desc	<SearchLDTLen-1,SearchLDTSeg+RELOCATE1,,ATLDT,,>
SearchTSS	Desc	<SearchTSSLen-1,SearchTSSSeg+RELOCATE1,,AT386TSS,,>
G4Data		Desc	<0ffffh,0,0,92h,0cfh,0>

GlobalData  	Desc 	<GlobalDataLen-1,GlobalDataSeg+RELOCATE1,,ATDW,,0h>
; this descriptor is in GDT, it is not a task, any global program can use this
MEMData		Desc	<0ffffh,0h,0h,ATDW,0cfh,0h>	;Memory interface data segment
; MEMData selector does not have any base address everything is zero 

; App1TSS descriptor must be in GDT as it is a separate Task 

; All the fields can be modified dynamically in the followong desc if App1TSS Address is given to Application
; Currently there can be 4 applications setup in GDT 
; each application 1,2,3,4 are called parent applications 
; all parent applications are fixed in GDT 
; each parent application is given one slot for a child task in GDT 
; multiple children's tasks are managed in the application by using this one slot 
;  and a given API to modify child location in GDT
;App1TSS        Desc    <App1TSSLen-1,0000h,00h,AT386TSS,,02h>  ;AT386TSS = 89h
App1TSS         Desc    <App1TSSLen-1,App1TSSSeg+RELOCATE1,,AT386TSS,,>  ;AT386TSS = 89h Application 
App1TSSRW       Desc    <App1TSSLen-1,App1TSSSeg+RELOCATE1,,ATDW,,>  ;AT386TSS = 89h
App1LDT         Desc    <App1LDTLen-1,App1LDTSeg+RELOCATE1,,ATLDT,,>
App1TSSC        Desc    <App1TSSLen-1,App1TSSSeg+RELOCATE1,,AT386TSS,,> ;AT386TSS = 89h Client 
App1TSSS        Desc    <App1TSSLen-1,App1TSSSeg+RELOCATE1,,AT386TSS,,> ;AT386TSS = 89h Scheduler
App1TSST        Desc    <,,,,,>                                         ;AT386TSS = 89h Timer
App1TSSE        Desc    <,,,,,>                                         ;AT386TSS = 89h Error 

App2TSS         Desc    <App2TSSLen-1,App2TSSSeg+RELOCATE1,,AT386TSS,,>  ;AT386TSS = 89h
App2TSSRW       Desc    <App2TSSLen-1,App2TSSSeg+RELOCATE1,,ATDW,,>  ;AT386TSS = 89h
App2LDT         Desc    <App1LDTLen-1,App1LDTSeg+RELOCATE1,,ATLDT,,>
App2TSSC        Desc    <App2TSSLen-1,0000h,00h,AT386TSS,,02h>  ;AT386TSS = 89h
App2TSSRWC      Desc    <App2TSSLen-1,App2TSSSeg+RELOCATE1,,ATDW,,>  ;AT386TSS = 89h
App2LDTC        Desc    <App1LDTLen-1,App1LDTSeg+RELOCATE1,,ATLDT,,>

DMADATA		Desc	<0ffffh,DMADataSeg+RELOCATE1,,ATDW,,0H>		; for DMA read/write
PCode      	Desc    <PCodeLen-1,PCodeSeg+RELOCATE1,,ATCE,,>     ;PCodeSeg
EtherDesc	Desc    <EthernetReceiveCodeLen-1,EthernetReceive+RELOCATE1,,ATCE,D32,>
DemoTSSRW       Desc    <DemoTSSLen-1,DemoTSSSeg+RELOCATE1,,ATDW,,>  ;AT386TSS = 89h
IntExceptionDesc	Desc    <IntExceptionCodeLen-1,IntExceptionSeg+RELOCATE1,,ATCE,D32,>
;		REPT	100
;	        Desc    <00200h,00200h, 020h, 020h, 020h, 020h>
;		ENDM
;----------------------------------------------------------------------------
GDTLen          =       $-GDT                    ;total no of entries including dummies  
GDNum           =       ($-EFFGDT)/(SIZE Desc)   ; number of entries in GDT ex.. 28 
;----------------------------------------------------------------------------
Normal_Sel      =       Normal-GDT              
Video_Sel       =       VideoBuf-GDT           
;----------------------------------------------------------------------------
DemoTSS_Sel     	=       DemoTSS-GDT         
DemoTSSRW_Sel     	=       DemoTSSRW-GDT         
DemoLDT_Sel     	=       DemoLDTD-GDT             
TempCode_Sel    	=       TempCode-GDT              
Other_Sel       	=       Other-GDT              
RData_Sel		= 	RData-GDT
GKeyTSS_Sel     	=       GKeyTSS-GDT
GetCharTSS_Sel     	=    	GetCharTSS-GDT
GetDecTSS_Sel     	=    	GetDecTSS-GDT
GetSecTSS_Sel     	=    	GetSecTSS-GDT
WriteSecTSS_Sel     	=    	WriteSecTSS-GDT
GKeyLDT_Sel     	=       GKeyLDT-GDT
GetCharLDT_Sel     	=    	GetCharLDT-GDT
GetDecLDT_Sel     	=    	GetDecLDT-GDT
GetSecLDT_Sel     	=    	GetSecLDT-GDT
WriteSecLDT_Sel     	=    	WriteSecLDT-GDT
Puthex32Data_Sel    	=   	Puthex32Data-GDT
Puthex32I_Sel  		=       Puthex32I-GDT
EthernetReceive_Sel	=       EtherDesc-GDT	

GlobalData_Sel    	=   	GlobalData-GDT

MEMData_Sel		=	MEMData-GDT
;MEMStrData_Sel		=	MEMStrData-GDT

SearchLDT_Sel		=	SearchLDT-GDT
SearchTSS_Sel		=	SearchTSS-GDT
G4Data_Sel		=	G4Data-GDT

App1TSS_Sel    		=       App1TSS-GDT
App1TSSC_Sel    	=       App1TSSC-GDT
App1TSSS_Sel    	=       App1TSSS-GDT
App1TSSE_Sel    	=       App1TSSE-GDT
App1TSST_Sel    	=       App1TSST-GDT
App2TSS_Sel    		=       App2TSS-GDT
App1TSSRW_Sel  		=       App1TSSRW-GDT
App2TSSRW_Sel  		=       App2TSSRW-GDT
App1LDT_Sel    		=       App1LDT-GDT
App2LDT_Sel    		=       App2LDT-GDT
DMAData_Sel		= 	DMADATA-GDT		; DMA data segment selector
PCode_Sel    		=       PCode-GDT		; 16 bit segment for protect mode
IntException_Sel	=       IntExceptionDesc-GDT
;----------------------------------------------------------------------------
HexTable        DB      '0123456789ABCDEF'
IndexCnt        DD      ?
PrintData       DD      'ABCD' 
SizeOf_TSS1	DW 	App1TSSLen ; length of the App1TSS seg is stored here 

;offset:segment
RealJumpAddr	dw	0000h,0000h

LoadArray	db	16 dup(0)
;----------------------------------------------------------------------------
VGDTR           PDesc   <GDTLen-1,>  ; lenght of GDT is initialized, 2 bytes             
VIDTR           PDesc   <IDTLen-1,>
NORVIDTR        PDesc   <3FFh,>
IMaskRegV       DB      ?
SPVar           DW      ?                        
SSVar           DW      ?              
RERunFlag	DW	0000h 	    ; This flag remembers that the app1 ran once
				    ; This flag is used to reinitialize the TSS for APP1 in RunAppl Module  
;----------------------------------------------------------------------------
prompt1    DB  13,10,'          Press any key to continue... ',0
;----------------------------------------------------------------------------
; This offset is used to print memory w.r.t base in the desc
; This should be initialised before calling PRINTMEMP call gate
;		mov	eax,ds:[MemPrintOffset]
;		CALL16	PrintmemPGate_Sel,0h
;----------------------------------------------------------------------------

MemPrintOffset  	dd	?
AnyCounter		dd	00000021h ; sector 33 to print sectors 
LoadCounter		db	0
RunFlag			dd	0
MemFlag			db	0
MemoryOffset		dd	1234h  ; actual memory location where the offset is stored  

;----------------------------------------------------------------------------
abdtemp			dd	0
AppGDTPtr		dd	0	; Temp variable declared to test the no of GDT entries changed

;----------------------------------------------------------------------------
FloppyReady		db	0
;----------------------------------------------------------------------------
; Keyboard key map
keyTable1 DB 00,1bh,31h,32h,33h,34h,35h,36h,37h,38h,39h,30h,2dh,3dh,08h,09h
	  DB 'q','w','e','r','t','y','u','i','o','p','[',']',0dh,00
	  DB 'a','s','d','f','g','h','j','k','l',';',27h,'`',00,'\'
	  DB 'z','x','c','v','b','n','m',',','.','/',00,'*',00,' ',00
	  DB  0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2dh,0,0,0,2Bh,0,0,0,0,0
	  DB  200 dup(0)
; The Following Variables are used by the Keyboard handler
ShiftStat       DB 00
CtrlStat        DB 00
AltStat         DB 00
NumLock         DB 00
CapLock         DB 00
ScrLock         DB 00
scan		DB 00
ascii		DB 00
; Kernel keyboard Que, the first byte holds the pointer
KKQ		DB 255 dup(0)
KHead		DB 0	; next byte
KTail		DB 0	; next available byte
; Memory parameters required in AOA
MEMLimit	dd	10000000h  ; Max Limit of memory allocation 64MB  
MEMBase		dd	02000000h  ; Base start of memory for allocation 32MB  
MEMCX           dw	0
APP1TSSAddr	dd	?	   ; This is the address of the task segment 	

SLSecNum1mS	dw	0
LSize1mS	dw	0
BxP1S		dd	0
; user does Malloc() once and gets total size of memory available and mem ptr 
;
;----------------------------------------------------------------------------
RDataSeg        ENDS
;***************************************************************************
;RCodeSeg Segment 
; 16 bit segment 
;  all real code procedures must be placed in this segment 
;***************************************************************************
;
RCodeSeg        SEGMENT PARA public USE16 'CODE'
		ASSUME  CS:RCodeSeg,DS:RDataSeg
;----------------------------------------------------------------------------
; START of prcycle here 
; Watch out IDT and 256 interrupts, make sure they are coded right in the 
;   segment, otherwise, LIDT will fail 
;----------------------------------------------------------------------------
Start           PROC

		mov     ax,RDataSeg
		add     ax,RELOCATE1   
		mov     ds,ax
		mov	al,'Y'
		mov	ah,14
		int	10h
              
	    ;********************************************************
		; get the NIC device address and store it in shared memory
		; this has to be done only in real mode 
	    ;********************************************************
 		mov ah, 0b1h 	; function  PCI BIOS p23 
		mov al, 02h  	; find PCI device PCI BIOS p23 
		;3com
		;mov cx, 9200h 	; device id p71 
		;mov dx, 10b7h   ; subsystem vendor id p71
		; intel
		mov cx, 100eh
		mov dx, 8086h
        	mov si, 0
		int 1ah   	; calls PCI BIOS interrupt  
		jc carry1       ; error 
		xor cl, cl      ; good 
		jmp next100
		carry1:
		mov cl, 1       ; cl is 1 or 0 
		next100:
		mov eax,ebx;
        	sal eax, 16     ; move to left 
		mov bl, cl
		mov ax, bx
		; eax has the following data 
		;----------------------
		; BH |  BL | AH | CL 
		; bus no | device no in 5 bits | return code | 0 - success 1 -fail
		;----------------------
		sar eax, 16 
		mov ebx, 0 
		mov ebx, eax   ; bh, bl has bus no and device no  

		mov eax, 0 
 		mov ah, 0b1h  ; function  PCI BIOS p23  
		mov al, 0ah   ; read config dword p19 PCI 
		;3com
		;mov di, 10h   ; offset 10h p/65 
		; intel
		mov di, 18h
		int 01ah      ; calls PCI BIOS interrupt
		mov eax, ecx 
		and ecx, 0fffeh        ; make the last bit zero  
		mov eax, ecx           ; this is the device address  

		push ds 
		push eax 
		mov ax, 0 
		mov ds, ax 

		mov ebx, S_Base 
		add ebx, S_IOBASE 
		pop eax 
		mov DWORD PTR ds:[ebx], eax  ; store it in shared memory 
		pop ds 

		;mov eax, 0
		;mov eax, DWORD PTR es:[ebx] 
		;CALL PUTHEX32R ; prints the value in EAX
		;mov al, ' ';    ; print a blank 
		;mov ah, 14 
		;int 10h

		;********************************************************
		; Store Task Segment of Appliation in memory 
		; which can be used by AO for task switching
		mov  	eax,SEG App1TSSSeg	; get the segment addtess of APP1TSSSeg
		add 	eax, RELOCATE1
		shl	eax, 4			; then convert that into a pointer with the lower 16 bit offset
		mov 	ds:[APP1TSSAddr], eax
		;********************************************************

		;KAR_________________________________________________________
		;mov	eax,SEG RDataSeg
		;add	eax,RELOCATE1
		;shl	eax,4
		mov	eax,OFFSET GDT	; Get the offset of GDT starting entry to be used by setand getGDTEntry
		mov	ds:[AppGDTPtr], eax
		;____________________________________________________________		
		EnableA20
		cld
		
		CALL    InitGDT  
		call    InitIDT

		mov     SSVar,ss                
		mov     SPVar,sp
		sidt    QWORD PTR NORVIDTR 
		in      al,IMREGP 
		mov     BYTE PTR IMaskRegV,al

		mov     ax,App1LDTSeg ; APP1 LDT Seg Address
		add	ax, RELOCATE1 ; add relocate	
                mov     fs,ax         ; fs has the LDT Segment 
                mov     cx,App1LDNum  ; no of entries to be loaded in LDT 
                mov     si,OFFSET ALDT; offset of first entry 
		
		CALL    InitLDT       ; load APP1 LDT entries 
;------------------------------------------------------                
; add RELOCATE1 as the booter located this code at 
; a different location, for example at 0800h 
; so the segment value in that case is at 80h
;------------------------------------------------------
		mov     ax,GKeyLDTSeg
		add     ax, RELOCATE1 
		mov     fs,ax
		mov     cx,GKeyLDNum
		mov     si,OFFSET GLDT
		
		CALL    InitLDT
;------------------------------------------------------                
		mov     ax,GetCharLDTSeg
		add     ax, RELOCATE1
		mov     fs,ax
		mov     cx,GetCharLDNum
		mov     si,OFFSET CLDT
		
		CALL    InitLDT
;------------------------------------------------------                
		mov     ax,GetDecLDTSeg
		add     ax, RELOCATE1
		mov     fs,ax
		mov     cx,GetDecLDNum
		mov     si,OFFSET DLDT
		
		CALL    InitLDT
;------------------------------------------------------ 
		mov     ax,GetSecLDTSeg
		add     ax, RELOCATE1
		mov     fs,ax
		mov     cx,GetSecLDNum
		mov     si,OFFSET KLDT
		
		CALL    InitLDT
;------------------------------------------------------ 
		mov     ax,DemoLDTSeg
		add     ax, RELOCATE1
		mov     fs,ax
		mov     si,OFFSET DemoLDT
		mov     cx,DemoLDNum
		CALL    InitLDT                  
;------------------------------------------------------
		mov     ax,SearchLDTSeg
		add     ax, RELOCATE1
		mov     fs,ax
		mov     si,OFFSET SEARCHLDTS
		mov     cx,SearchLDNum
		CALL    InitLDT   
				
;------------------------------------------------------
; GDT table must be located in real memory 
;  we tried to place it at 0200 0000 and we were 
;  not able to change the Base value in GDTR 
; setup all GDT related things before switching to 
;  protected mode 4-9-04 
;------------------------------------------------------
		lgdt    QWORD PTR VGDTR ;load GDT reg    
	
		
; 6 byte VGDTR is loaded into visible part of the GDTR registerr
; The contents of VGDTR was set up by InitGDT call
;------------------------------------------------------
		cli
		lidt    QWORD PTR VIDTR      
		mov     eax,cr0
		or      al,1
		mov     cr0,eax   ; turn on prot mode bit
;----------------------------------------------------------
		JUMP16  <TempCode_Sel>,<OFFSET Virtual> ; I
;----------------------------------------------------------
;This jump is required to switch to protection mode 
; It will load CS and EIP values during this long jump
; It uses TempCode_Sel descriptor to jump
; You will not go below this step until you return from 
; protection mode to exit from the program 
;------------------------------------------------------

Real:           mov     ax,RDataSeg
		add     ax, RELOCATE1
		mov     ds,ax
		lss     sp,DWORD PTR SPVar       
		lidt    QWORD PTR NORVIDTR
		sti

Start           ENDP
;***************************************************************************
;InitGDT Procedure 
;  Initialize all GDT entries 
;***************************************************************************

InitGDT         PROC
		mov     cx,GDNum ; no of entries to be loaded into GDT ex 28         
		mov     si,OFFSET EFFGDT ;starting location of first entry
		
		
		
InitG:          mov	ax,0	
		mov	ah, BYTE PTR[si].BaseH
		mov	al, BYTE PTR[si].BaseM
		cmp	ax,0
		JNZ	SKIPCHANGE
		mov     ax,[si].BaseL
		movzx   eax,ax
		shl     eax,4
		shld    edx,eax,16   ; 0002 --> 0200 8 bytes alltogether 
		mov     WORD PTR [si].BaseL,ax ; 2 bytes
		mov     BYTE PTR [si].BaseM,dl ; 1 byte 
		mov     BYTE PTR [si].BaseH,dh ; 1 byte 
		
		
SKIPCHANGE:	add     si,SIZE Desc
		loop    InitG
				
		mov 	dx,0h
		mov     bx,16
		mov     ax,ds
		mul     bx
		mov     WORD PTR VGDTR.Base,ax ; lower 2 byte GDT base address is stored in VGDTR 4eb0 
		mov     WORD PTR VGDTR.Base+2,dx ; higher 2 byte GDT base address is stored in VGDTR 0000 
		ret
InitGDT         ENDP
;***************************************************************************
;InitLDT Procedure 
;  Initialize all LDT entries 
;  rearraning the BaseL bytes 
; It does not modify BaseH and BaseM 
; It is also rearranging the bytes in the same segment in memory 
; It does not modify BaseH and BaseM 
; It is also rearranging the bytes in the same segment in memory 
;***************************************************************************
InitLDT         PROC
ILDT:           mov     ax,WORD PTR FS:[si].BaseL
		movzx   eax,ax
		shl     eax,4
		shld    edx,eax,16
		mov     WORD PTR fs:[si].BaseL,ax
		;the following two lines insert 0s in BaseM and BaseH 
		;  base L is shifted because we only put one digit less in this field 
		; inorder to use above 1M we should comment the following two lines 
	;	mov     BYTE PTR fs:[si].BaseM,dl
	;	mov     BYTE PTR fs:[si].BaseH,dh
		add     si,SIZE Desc
		loop    ILDT
		ret
InitLDT         ENDP
;***************************************************************************
;InitIDT Procedure 
; Initialize all interrupt descriptor table entries  
;***************************************************************************
InitIDT         PROC
		mov     bx,16
		mov     ax, IDTSeg
		add     ax, RELOCATE1  
		mul     bx
		mov     WORD PTR VIDTR.Base,ax
	 
;----------------------------------------------------------------------------- 
; This part of the code stores the absolute address of IDT in shared memory
	
		push	ebx	
        ;RKK COMMENT EXTRA PUSH 
		;push	es
		push	eax

		mov	ebx,0
		mov	ax, S_Base
		add	ax, S_IDTOffset
		mov	bx ,ax
		mov	ax, 0
		mov 	es, ax
		pop	eax
		mov	WORD PTR es:[ebx], ax
		mov	ax, WORD PTR es:[ebx]
		pop	ebx
;-----------------------------------------------------------------------------
		mov     WORD PTR VIDTR.Base+2,dx
		ret
InitIDT         ENDP
;***************************************************************************
;Virtual Procedure 
;  entry point to protected mode 
;***************************************************************************
;  I.  It is invoked from real mode after mode bit is set as a long jump
;  This is the first stage after protected mode bit is set 
;
Virtual         PROC    FAR
		mov     ax,DemoTSS_Sel           
		ltr     ax  ; load task register 
		mov     ax,DemoLDT_Sel ; load LDTR register            
		lldt    ax
;--------------------------------------------------------------------
		JUMP16  ToT32A_Sel,0    ;II. Jump to Prot Mode Seg
					; T32Code_Sel and T32Begin  
;--------------------------------------------------------------------
; This jump is from 16 bit to 32 bit segments using a call gate 
; once this jump occurs, then you are in 32 bit protected mode 
; The following step will not be reached from here  
;--------------------------------------------------------------------
;  V. The following code will be executed when the program returns 
;    from protected mode on its way to real mode 
;    this is at 16 bit protected mode 
;    application calls can be made 
;--------------------------------------------------------------------
ToReal:    	
loop1:          		 ;interrupt takes us to AoA menu and 
		sti

		int     0ffh     ; go to menu interrupt    
		mov	ebx,3998
		mov     al,'P'
		int     0f7h

		mov	ax,RealData_Sel
		mov	fs,ax
		
		cmp	fs:[MemFlag], 5
		je	GoSearch

		cmp	fs:[MemFlag],1
		je	PrintMemory
		
		cmp	fs:[LoadFlag],1
		jne	RunApplications		

LoadApplications:
		CALL	InitLoad
		;--------------------------------------------------------
		push	es
		; save start sector, number of sectors and address offset
		mov	ax,RealData_Sel
		mov	es,ax	
		
		mov	eax, 0
		mov	ax, es:[StartLogicalSecNum1m] ; start sector
		mov	es:[SLSecNum1mS], ax

		mov	ax, es:[LoaderSize1m] ; number of sectors
		mov	es:[LSize1mS], ax

		mov	eax, es:[BxPointer1] ; address offset
		mov	es:[BxP1S], eax

		pop	es
		;--------------------------------------------------------

		CALL 	ReadSectorsAll ; read all sectors if flag is set 
				       ; loads application disk into memory
		jmp	loop1
RunApplications:
		;---------------------------------------------
		;KAR Sample to test if the GDT can be moved to Data Segment of APP
	        ; APP1TSSAddr location has the address of App1TSS segment 	
		;KAREND
		;---------------------------------------------

		CALL	RunAppl
		jmp	GoBackToLoop
GoSearch:
		int	0f8h
		mov	fs:[MemFlag], 0
		jmp	loop1

PrintMemory:
		mov	eax,0
		mov	eax,fs:[MemoryOffset] ; memory dump option 9 
		CALL16	PrintmemPGate_Sel,0h
		and	fs:[MemFlag],0
GoBackToLoop:
;--------------------------------------------------------------------
	JUMP16  ToT32A_Sel,0    ;  II. Jump to Protected Mode Seg
				; T32Code_Sel and T32Begin 
;--------------------------------------------------------------------
; Steps II and V are our P-R cycle loop 
; Step II takes it to protected mode and when it is done it 
; comes back to step V. 
;--------------------------------------------------------------------
;--------------------------------------------------------------------
;We would never go beyond this point unless we comment P-R cycle loop
;By doing so you would return to real mode and print 'Z'
;--------------------------------------------------------------------
		mov     ax,Normal_Sel        
		mov     ds,ax
		mov     es,ax
		mov     fs,ax
		mov     gs,ax
		mov     ss,ax

		;cli
		mov     eax,cr0
		and     al,11111110b
		mov     cr0,eax
		JUMP16  <SEG Real+RELOCATE1>,<OFFSET Real>

Virtual         ENDP
;***************************************************************************
;GetCharBegin Procedure 
;***************************************************************************
GetCharBegin    PROC    FAR
		
		
		push    ds
		push    es
		push    fs
		push    gs
		mov     ax,Normal_Sel
		mov     ss,ax                    
		mov     eax,cr0
		and     al,11111110b
		mov     cr0,eax     ; set the control register
		JUMP16  <Seg GetChar+RELOCATE1>,<OFFSET GetChar>  ;SWITCH TO REAL MODE

GetChar:        
		mov     ax,RDataSeg               
		add     ax, RELOCATE1  
		mov     ds,ax
		mov     ebp,esp                  
		lss     sp,DWORD PTR SPVar
		lidt    QWORD PTR NORVIDTR
		sti
		
;------------------------------------------------------------------------
;We are returned to RealMode from ProtMode include all RMode code here...
;------------------------------------------------------------------------
		mov	ax,GlobalDataSeg
		add	ax,RELOCATE1
		mov	fs,ax
GetChar1:      

		mov     ah,10h
		int     16h	;bios interrupt to get char from console

;------------------------------------------------------------------------
;To display character at the same position
;------------------------------------------------------------------------
		mov	ah,14
		int	10h	; to display the char at the same position

		mov	fs:[StoreChar],al
		;cli                                     ;SWITCH TO PM

		lidt    QWORD PTR VIDTR
		mov     eax,cr0
		or      al,1
		mov     cr0,eax

		JUMP16  <GetCharCode_Sel>,<OFFSET GetCharV> ;TO PROTECTED MODE
		
GetCharV:       
		mov     ax,GetCharStack_Sel        
		mov     ss,ax
		mov     esp,ebp
		pop     gs
		pop     fs
		pop     es
		pop     ds

		iretd
		jmp     GetCharBegin
GetCharBegin       ENDP
;***************************************************************************
;GetDecBegin Procedure 
;***************************************************************************
GetDecBegin    PROC    FAR
		push    ds
		push    es
		push    fs
		push    gs
		mov     ax,Normal_Sel
		mov     ss,ax                    
		mov     eax,cr0
		and     al,11111110b
		mov     cr0,eax               

		JUMP16  <Seg GetDec+RELOCATE1>,<OFFSET GetDec>  ;SWITCH TO REAL MODE
GetDec:
		
		mov     ax,RDataSeg               
		add     ax, RELOCATE1  
		mov     ds,ax
		mov     ebp,esp                  
		lss     sp,DWORD PTR SPVar
		lidt    QWORD PTR NORVIDTR
		sti
;------------------------------------------------------------------------
;We are returned to RealMode from ProtMode include all RMode code here...
;------------------------------------------------------------------------
		mov	ax,GlobalDataSeg
		add	ax,RELOCATE1
		mov	fs,ax
GetDec1:      
		PUSH 	EBX
		PUSH 	ECX	
		XOR 	EBX,EBX		; EBX=0
		MOV 	ECX,0ah		; ECX=10
GetNextDigit_getint:
		MOV  	AH, 10h    	; function 10h: Waits for keyboard input
		INT  	16h 		; get input from keyboard 

		PUSH	EAX		; displays "char-by-char" 
		mov	ah,14		; the integer being input by user
		int	10h
		POP	EAX	
	
		push 	ebx
		SUB 	AL,'0'		; ASCII[0..9] -> DIGIT[0..9]
		mov	bl, al
		xor	eax,eax
		mov	al, bl
		cmp	al, 0dh
		je	exit_getint32
		pop	ebx
	
	; CL holds integer "10", when encounter either "return" 
	; or other characters all cause mov ax, bx	
	
		CMP 	AL,CL		
		JAE 	NotDigit_getint ; if there is new integer from keyboard, SWAP AX,BX

		xchg	ebx, eax
		MUL 	ECX		; EAX=EAX*10
		add	ebx, eax	
		JMP 	GetNextDigit_getint
NotDigit_getint:	
		mov	eax, ebx 	
		mov	fs:[StoreDec],eax
		; store the read integer value in real memory segment 
		;   where data is stored 

exit_getint32:				
		POP 	ECX
		POP 	EBX

		;cli                                     ;SWITCH TO PM
		lidt    QWORD PTR VIDTR
		mov     eax,cr0
		or      al,1
		mov     cr0,eax

		JUMP16  <GetDecCode_Sel>,<OFFSET GetDecV> ;TO PROTECTED MODE
		
GetDecV:       
		mov     ax,GetDecStack_Sel        
		mov     ss,ax
		mov     esp,ebp
		pop     gs
		pop     fs
		pop     es
		pop     ds
		iretd
		jmp     GetDecBegin
GetDecBegin       ENDP
;***************************************************************************
;GKeyBegin Procedure 
;***************************************************************************
GKeyBegin       PROC    FAR
		
		push    ds
		push    es
		push    fs
		push    gs
;********************************************
;printing in protected mode and getting a charectar in Pmode.
;		mov	eax,0h
;		mov	eax,12345678h
;		mov	ebx,800h	;display position on screen
;		int	0fdh		;PUTHEX32P interrupt gate
;		int	0fch		;get charectar from keyboard interrupt gate
;********************************************		

		mov     ax,Normal_Sel
		mov     ss,ax                    
		mov     eax,cr0
		and     al,11111110b
		mov     cr0,eax  
;************************************************
; when we jump from protected mode to real mode, 
;   we should keep CS value 0000h and place the 
;   offset in the jump, otherwise, in real mode 
; if CS value is not zero, we could have problems 
;   with calls and other stuff
; this assumes that in real mode, we will stay within 
;    one segment that is, 64k code 
;************************************************
	        mov     ax,RDataSeg      ; set up dataseg
		add     ax, RELOCATE1  
		mov     ds,ax
; we do not use this jump as we need to set CS to 0h
;CS and IP will be loaded with the below jump
;		JUMP16  <Seg GetKey+RELOCATE1>,<OFFSET GetKey>  ;SWITCH TO REAL MODE
; compute the address to be jumped in real mode as follows 
;  
		mov	eax,0h
		mov	ax,seg Getkey ; segment value 
		shl	ax,4	      ; shift left 4 bits 
		add	ax,800h       ; start of code for real code 600+200 PSP
		add	ax,offset GetKey ; offset for this label within real code 
		mov	[RealJumpAddr],ax ; store the value in real data segment 
		JMP	dword ptr [RealJumpAddr] ; long jump CS:IP 
GetKey:        
		
		mov     ebp,esp                  
		lss     sp,DWORD PTR SPVar
		lidt    QWORD PTR NORVIDTR
		sti
;------------------------------------------------------------------------
;We are returned to RealMode from ProtMode include all RMode code here...
;------------------------------------------------------------------------
GetKey1:       

		mov     esi,offset prompt1
		call    WriteString
		mov     ah,10h
		int     16h
		
		call    AOADisp 

		;cli                                     ;SWITCH TO PM
		lidt    QWORD PTR VIDTR
		mov     eax,cr0
		or      al,1
		mov     cr0,eax
		JUMP16  <GKeyCode_Sel>,<OFFSET GetKeyV> ;TO PROTECTED MODE
GetKeyV:        mov     ax,GKeyStack_Sel        
		mov     ss,ax
		mov     esp,ebp


		pop     gs
		pop     fs
		pop     es
		pop     ds
		iretd
		jmp     GKeyBegin
GKeyBegin       ENDP
;***************************************************************************
;GetSecBegin Procedure 
;  comes here from a protected mode through interrupt 0fah 
;  0fah is used to read one sector from disk and store it 
;    in a buffer at 8400h  
; this buffer data in memory can be copied to other locations 
;   above 1M using RDWTMEM routine 
;***************************************************************************
GetSecBegin     PROC    FAR
		
		push    ds
		push    es
		push    fs
		push    gs
		;-----------------------------------------------------------
		;Checks for the StartSecNo in the shared memory if it is -1 its loaded from StartSecNum1m 
		;Else it is loaded from the shared memory location
		;-----------------------------------------------------------
		mov	ax,MEMData_Sel; zero selector 	    
		mov	es,ax         ; es has zero selector 
		mov 	ebx,S_Base    ; 8600h for shared mem
		add	ebx,S_SectorNo ; offset of the sectorno in shared mem
		mov	ax, WORD PTR es:[ebx] ; read shared mem for sectorno 
		cmp	ax,-1         ; check if it is -1, menu loading will set this to -1 
		je 	LoadOneSecForMenu ; yes, it is -1, then goto process   
		; no, this load is for an application, who stores sector no in S_SectorNo
		mov	ax,RData_Sel  ; RDataSeg 
		mov	fs,ax         ; fs has RDAtaSeg to refer to Start...
		mov	ax, WORD PTR fs:[StartLogicalSecNum1m]
		mov	WORD PTR es:[ebx+2], ax ; store this value in shared mem temporarily
		mov	ax, WORD PTR es:[ebx]; read the sectorno placed by the application 
		mov	WORD PTR fs:[StartLogicalSecNum1m],ax ; store this in StartLogicalSecNum1m
		;in both cases the starting sector number is stored in StartLogicalSecNum1m
                ; normal stack pointer 
		
LoadOneSecForMenu:
		;Actual interrupt code starts here	
	        mov     ax,Normal_Sel
		mov     ss,ax                    
		
		;turn off the CR0 bit for protected mode 
		mov     eax,cr0
		and     al,11111110b
		mov     cr0,eax               

		JUMP16  <Seg GetSec+RELOCATE1>,<OFFSET GetSec>  ;SWITCH TO REAL MODE
GetSec:         mov     ax,RDataSeg                             ; in real mode now                
		add     ax, RELOCATE1         ;RdataSeg is located w.r.t 800h or RELOCATE1 
		mov     ds,ax
		mov     ebp,esp                  
		; initialize the real mode interrupt vectors 
		lss     sp,DWORD PTR SPVar
		lidt    QWORD PTR NORVIDTR
		sti
;------------------------------------------------------------------------
;We are returned to RealMode from ProtMode include all RMode code here...
;------------------------------------------------------------------------
GetSec1:       
	        ; call mini loader to load one sector 	
		call    aoaminil1 

		;cli                                     ;SWITCH TO PM
		lidt    QWORD PTR VIDTR
		mov     eax,cr0
		or      al,1
		mov     cr0,eax
		JUMP16  <GetSecCode_Sel>,<OFFSET GetSecV> ;TO PROTECTED MODE
GetSecV:       
		mov     ax,GetSecStack_Sel        
		mov     ss,ax
		mov     esp,ebp
		;Actual code ends here
               ;----------------------------------
	        ;restore the StartSectorNum1... value for the initial sectorno 
		
		mov	ax,MEMData_Sel; zero selector 	    
		mov	es,ax         ; es has zero selector 
		mov 	ebx,S_Base    ; 8600h for shared mem
		add	ebx,S_SectorNo ; offset of the sectorno in shared mem
		mov	ax, WORD PTR es:[ebx] ; read shared mem for sectorno 
		cmp	ax,-1         ; if it is -1 it is not an application read
		je 	LoadOneSecForAppRestore ; else it is an application 
		mov	ax,RData_Sel  ; RDataSeg 
		mov	fs,ax         ; fs has RDAtaSeg to refer to Start...
		
		mov	ax, WORD PTR es:[ebx+2]; read the sectorno placed by the application 
		mov	WORD PTR fs:[StartLogicalSecNum1m],ax ; store this in Start....
		
LoadOneSecForAppRestore:
	       ;---------------------------------
		pop     gs
		pop     fs
		pop     es
		pop     ds
	
		iretd
		jmp     GetSecBegin
GetSecBegin       ENDP
;***************************************************************************
;WriteSecBegin Procedure 
;  comes here from a protected mode through interrupt 0f4h 
;  0f4h is used to write one sector from 8400 h to disk given a sector no 
; this call is always invoked by an application through 0f4h interrupt 
; shared memory has the sector number just like read a sector 
; only read or write at a time can be done by the application 
;***************************************************************************
WriteSecBegin     PROC    FAR
		

		push    ds
		push    es
		push    fs
		push    gs

		;-----------------------------------------------------------
		mov	ax,MEMData_Sel; zero selector 	    
		mov	es,ax         ; es has zero selector 
		mov 	ebx,S_Base    ; 8600h for shared mem
		add	ebx,S_SectorNo ; offset of the sectorno in shared mem
		mov	ax,RData_Sel  ; RDataSeg 
		mov	fs,ax         ; fs has RDAtaSeg to refer to Start...
		
		mov	ax, WORD PTR fs:[StartLogicalSecNum1m]
		mov	WORD PTR es:[ebx+2], ax ; store this value in shared mem temporarily
		
		mov	ax, WORD PTR es:[ebx]; read the sectorno placed by the application 
		mov	WORD PTR fs:[StartLogicalSecNum1m],ax ; store this in Start....
		;-----------------------------------------------------------
		;Actual interrupt code starts here	
	        mov     ax,Normal_Sel
		mov     ss,ax                    
		
		;turn off the CR0 bit for protected mode 
		mov     eax,cr0
		and     al,11111110b
		mov     cr0,eax               

		JUMP16  <Seg WriteSec+RELOCATE1>,<OFFSET WriteSec>  ;SWITCH TO REAL MODE
WriteSec:       mov     ax,RDataSeg                             ; in real mode now                
		add     ax, RELOCATE1         ;RdataSeg is located w.r.t 800h or RELOCATE1 
		mov     ds,ax
		mov     ebp,esp                  
		; initialize the real mode interrupt vectors 
		lss     sp,DWORD PTR SPVar
		lidt    QWORD PTR NORVIDTR
		sti
;------------------------------------------------------------------------
;We are returned to RealMode from ProtMode include all RMode code here...
;------------------------------------------------------------------------
WriteSec1:       
	        ; call mini Writer to load one sector 	
		call    aoaminiw1 

		;cli                                     ;SWITCH TO PM
		lidt    QWORD PTR VIDTR
		mov     eax,cr0
		or      al,1
		mov     cr0,eax
		JUMP16  <WriteSecCode_Sel>,<OFFSET WriteSecV> ;TO PROTECTED MODE
WriteSecV:       
		mov     ax,WriteSecStack_Sel        
		mov     ss,ax
		mov     esp,ebp
		;Actual code ends here
               ;----------------------------------
	        ;restore the StartSectorNum1... value for the initial sectorno 
		
		mov	ax,MEMData_Sel; zero selector 	    
		mov	es,ax         ; es has zero selector 
		mov 	ebx,S_Base    ; 8600h for shared mem
		add	ebx,S_SectorNo ; offset of the sectorno in shared mem
		mov	ax,RData_Sel  ; RDataSeg 
		mov	fs,ax         ; fs has RDAtaSeg to refer to Start...
		
		mov	ax, WORD PTR es:[ebx+2]; read the sectorno placed by the application 
		mov	WORD PTR fs:[StartLogicalSecNum1m],ax ; store this in Start....
	       ;---------------------------------
		pop     gs
		pop     fs
		pop     es
		pop     ds
	
		iretd
		jmp     WriteSecBegin
WriteSecBegin       ENDP

;***************************************************************************
; Read Sectors From Disk 
; this procedure is invoked to read all sectors from the disk starting from 
;  the 
;***************************************************************************
ReadSectorsAll     PROC  C  NEAR USES ds eax ebx 

		;disable timer while reading sectors
		push	edx
		push	eax
		mov	dx,21h ; disable timer interrupt 
		mov	al,01h	
		out	dx,al
		pop	eax
		pop	edx	

		;--------------------------------------------
		; save start sector, number of sectors and address offset
readagain:	
		push	es
		mov	ax,RData_Sel
		mov	es,ax	
		
		mov	eax, 0
		mov	ax, es:[SLSecNum1mS]
		mov	es:[StartLogicalSecNum1m], ax ; start sector

		mov	ax, es:[LSize1mS]
		mov	es:[LoaderSize1m], ax ; number of sectors

		mov	eax, es:[BxP1S]
		mov	es:[BxPointer1], eax ; address offset

                ;-------------------------------
	        mov ax, MEMData_Sel
		; This is a zero base selector to access shared memory between aoa and application
		push	fs
	        mov	fs, ax
	        mov 	ebx, S_Base 
	        add 	ebx, S_LSError 
		mov	eax, 0	
		mov	fs:[ebx], eax     ;reset LSector Error if any 
		pop     fs 
		pop	es
                ;-------------------------------
		
		mov	ax,RData_Sel ; real data seg 
		mov	ds,ax		
readsectors:
		mov	ax,ds:[LoaderSize1m] ; get no of sectors to read 
		cmp	ax,0                ; is all sectors read? 
		jbe	nomoresectors       ; yes, get out of loop
		
		;------------------------------
		; we set a -1 flag in shared memory so that 
		; when menu loads application program, starting 
		; sector is used as defined in StartLogicalSecNum1 
		; otherwise, when an application program needs to read a 
		;  sector, then it will store its sector no in this location 
		;------------------------------
		push 	es
		push	eax
		push	ebx
		mov	ax,MEMData_Sel	    
		mov	es,ax
		mov 	ebx,S_Base
		add	ebx,S_SectorNo
		mov	WORD PTR es:[ebx],-1; To make sure the controll in the shared mem is set to -1
		pop	ebx
		pop	eax		
		pop 	es
		
		int	0fah                ; read one sector 
               ;-------------------------------
	        mov ax, MEMData_Sel         ; this is in protected mode 
		; This is a zero base selector to access shared memory between aoa and application
		push	fs
	        mov	fs, ax
	        mov 	ebx, S_Base 
	        add 	ebx, S_LSError 
		mov	eax, fs:[ebx]    ;check if there is LSector Error  
		pop     fs 
                ;-------------------------------
		cmp	eax, 0
		jz	continueread
		;;reset LSError
		;;-------------
	        mov ax, MEMData_Sel         ; this is in protected mode 
		; This is a zero base selector to access shared memory between aoa and application
		push	fs
	        mov	fs, ax
	        mov 	ebx, S_Base 
	        add 	ebx, S_LSError 
		mov	eax, 0
		mov	fs:[ebx], eax 
		pop     fs 	
		;;-------------
		mov	ds:[AnyCounter], 021h
		mov	ds:[MemPrintOffset], 0
		jmp	readagain 
		;------------------------------------
continueread: 
		CALL16	RDWTMemPGate_Sel,0h ; copy sector to higher memory
		mov	eax,ds:[BxPointer1]
		mov	ds:[MemPrintOffset],eax	
		inc	ds:[AnyCounter]	        ; increment sector counter 	

		mov	eax,ds:[AnyCounter]     ; get the sector counter 
		mov	ebx,3938                ; print the counter at the bottom
		int	0fdh                    ; puthex32 interrupt

		add	ds:[BxPointer1],200h    ; update the BxPointer for next sector 
		add	ds:[MemPrintOffset],200h; update the memory print pointer for next sector
		jmp	readsectors		; loop until all sectors are read 

nomoresectors:		
		mov	ds:[MemPrintOffset],0h  ; reset memory print offset 
		mov	ds:[AnyCounter],21h      ; reset sector counter  
		
		RET

ReadSectorsAll  ENDP
;***************************************************************************
InitLoad        PROC  C  NEAR ;SES ds eax ebx 
		push	fs
		mov	ax,RealData_Sel
		mov	fs,ax

		cmp 	fs:[ApplNum],31h
		jne	LoadApp2
		
		mov	ax,fs:[LoaderSize1]
		mov	fs:[LoaderSize1m],ax
		mov	ax,fs:[StartLogicalSecNum1]
		mov	fs:[StartLogicalSecNum1m],ax
		mov	eax,fs:[LoadOffset1]

		mov	fs:[BxPointer1],eax
		or	fs:[RunFlag],1
		jmp	LoadApp
LoadApp2:
		mov	ax,fs:[LoaderSize2]
		mov	fs:[LoaderSize1m],ax
		mov	ax,fs:[StartLogicalSecNum2]
		mov	fs:[StartLogicalSecNum1m],ax
		mov	eax,0
		mov	eax,fs:[LoadOffset2]
		mov	fs:[BxPointer1],eax
		or	fs:[RunFlag],2
LoadApp:
		mov	fs:[LoadFlag],0
		pop	fs		
		
		RET

InitLoad  ENDP
;***************************************************************************
; Running Application 
;***************************************************************************
RunAppl  PROC  C  NEAR ;SES ds eax ebx 
		push	fs
		push	gs
		push	es

		mov	ax,App1TSSRW_Sel   ; selector for application task segment App1TSSeg 
		mov	gs,ax              ; gs pointing to task segment 	
		mov	ax,RealData_Sel
		mov	fs,ax              ; fs pointing to real data segment RDATASEG 
		mov	eax,fs:[RunFlag]
		and 	eax,01h            ; if the run flag is set then run 
		cmp	eax,1
		jne	RunNext
		mov	ebx, OFFSET App1TaskTSS  ; offset of the TaskTSS for app1 
		mov	eax,0h
		;mov	eax, fs:[LoadOffset1]    ; offset entered by the user during load 
		; we changed all base vlaues to 11 in the prcycle for cs, ds, ss 
		; LoadOffset1 is used to load program in memory
		add	ax,fs:[JumpOffset1]      ; add 16 bit code segment offset entered by user
		mov	DWORD PTR gs:[ebx].TREIP,eax ;load EIP value in the task segment  

		;mov	eax, 0ffffh            ; 64k cache 
		;mov	eax, 0ffefffh            ;LARGESTACK works for teststack example
		mov	eax, 01e84800h           ; for 32 M stack size 
		;mov	eax, 02200000h           ; for 32 M stack size 	
		mov	dword ptr gs:[ebx].TRESP, eax ; load ESP value in the task segment 
		mov	eax, 0
		mov	dword ptr gs:[ebx].TREBP, eax ; load EBP 
		;mov	eax, 3202h
		;mov	dword ptr gs:[ebx].TREFlag, eax ; load eflags
		mov	eax,0202h
		mov	dword ptr gs:[ebx].TREFlag, eax ; load eflags
		;--------------------------------------------------------------------------------------
		;Temp setup for App2
		
		mov	ax,App2TSSRW_Sel   ; selector for application task segment App1TSSeg 
		mov	gs,ax              ; gs pointing to task segment 	
		mov	ax,RealData_Sel
		mov	fs,ax              ; fs pointing to real data segment RDATASEG 
		mov	ebx, OFFSET App2TaskTSS  ; offset of the TaskTSS for app1 
		mov	eax,0h
		mov	eax, fs:[LoadOffset1]    ; offset entered by the user during load 
		add	ax,fs:[JumpOffset1]      ; add 16 bit code segment offset entered by user
		add	ax,015ddh
		mov	DWORD PTR gs:[ebx].TREIP,eax ;load EIP value in the task segment  

		;mov	eax, 0ffffh            ; 64k cache 
		;mov	eax, 0ffefffh            ;LARGESTACK works for teststack example
		mov	eax, 01e84800h           ; for 32 M stack size 
		mov	dword ptr gs:[ebx].TRESP, eax ; load ESP value in the task segment 
		mov	eax, 0
		mov	dword ptr gs:[ebx].TREBP, eax ; load EBP 
		mov	eax,4202h
		mov	dword ptr gs:[ebx].TREFlag, eax ; load eflags
		
		;------------------------------------------------
		push	ds
		; Check for ReRun flag if the flag is not zero reload the App1 TSS from 0200 location
		; else copy App1TSS to 0200 location 
		mov	ax, Rdata_Sel
		mov	ds, ax
		mov	ax, WORD PTR ds:[RERunFlag]
		cmp	ax, 0 
		jnz	CPY0200

		mov	ax, 1
		mov 	WORD PTR ds:[RERunFlag], ax
                pop	ds
		;------------------------------------------------------
		;RKK Transfer a sample TSS to user memory which can be used 
		;  for creating other TSS
		
		push 	fs
		push 	gs
		mov 	ax, App1TSSRW_Sel ; read/write selector for TSS Segment App1
		mov 	gs, ax            ; gs with TSS segment 
		mov 	esi, OFFSET App1TaskTSS ; offset of TSS segment  
		
		mov 	ebx, 02000000h    ; user application memory address 
		mov 	ax,MEMData_Sel    ; 0 base selector for protected mode  
		mov	fs,ax             ; use 0 base selector 
		
		mov 	ecx,0	
		mov     ax, RData_Sel 
		push 	ds                ; get SizeOf_TSS1 
		mov	ds, ax
		mov 	cx, WORD PTR ds:[SizeOf_TSS1]
		pop 	ds

movtssuserapp1:
		mov 	al, BYTE PTR gs:[esi] ; move TSS to user memory
		mov 	BYTE PTR fs:[ebx], al ;    byte at a time  
		inc	esi
		inc 	ebx
		loop	movtssuserapp1         ; loop 
         	pop 	gs
		pop 	fs
;----------------------------------------------------------------
; copy the Demo Code TSS to 02001000
		push 	fs
		push 	gs
		mov 	ax, DemoTSSRW_Sel ; read/write selector for TSS Segment App1
		mov 	gs, ax            ; gs with TSS segment 
		mov 	esi, OFFSET DemoTSSSeg ; offset of TSS segment  
		
		mov 	ebx, 02001000h    ; user application memory address 
		mov 	ax,MEMData_Sel    ; 0 base selector for protected mode  
		mov	fs,ax             ; use 0 base selector 
		
		mov 	ecx,0	
		mov 	cx, 6Ah		; This is the length of DemoTSS got form the List File 
					; it is a hardcoded value 
movtssuserapp3:
		mov 	al, BYTE PTR gs:[esi] ; move TSS to user memory
		mov 	BYTE PTR fs:[ebx], al ;    byte at a time  
		inc	esi
		inc 	ebx
		loop	movtssuserapp3         ; loop 
         	pop 	gs
		pop 	fs
;----------------------------------------------------------------
		JMP	CPY0200SKP		; Skip CPY 0200 to App1 TSS
;---------------------------------------------------------------------------------		
; Copy the TSS in 0200 location to App1 TSS to reinitialize the APP1 TSS to re run the application 
; without rebooting the computer 
CPY0200:
		
		push 	fs
		push 	gs
		mov 	ax, App1TSSRW_Sel ; read/write selector for TSS Segment App1
		mov 	gs, ax            ; gs with TSS segment 
		mov 	esi, OFFSET App1TaskTSS ; offset of TSS segment  
		
		mov 	ebx, 02000000h    ; user application memory address 
		mov 	ax,MEMData_Sel    ; 0 base selector for protected mode  
		mov	fs,ax             ; use 0 base selector 
		
		mov 	ecx,0	
		mov     ax, RData_Sel 
		push 	ds                ; get SizeOf_TSS1 
		mov	ds, ax
		mov 	cx, WORD PTR ds:[SizeOf_TSS1]
		pop 	ds
movtssuserapp2:
	
		mov 	al, BYTE PTR fs:[ebx];    byte at a time  
		mov 	BYTE PTR gs:[esi], al;    move TSS to App1 TSS
		inc	esi
		inc 	ebx
		loop	movtssuserapp2         ; loop 
		pop 	gs
		pop 	fs
;----------------------------------------------------------------------------
		push 	fs
		push 	gs
		mov 	ax, DemoTSSRW_Sel ; read/write selector for TSS Segment App1
		mov 	gs, ax            ; gs with TSS segment 
		mov 	esi, OFFSET DemoTSSSeg ; offset of TSS segment  
		
		mov 	ebx, 02001000h    ; user application memory address 
		mov 	ax,MEMData_Sel    ; 0 base selector for protected mode  
		mov	fs,ax             ; use 0 base selector 
		
		mov 	ecx,0	
		mov 	cx, 6Ah		; This is the length of DemoTSS got form the List File 
					; it is a hardcoded value 
movtssuserapp4:
		mov 	al, BYTE PTR fs:[ebx];    byte at a time  
		mov 	BYTE PTR gs:[esi], al;    move TSS to App1 TSS
		inc	esi
		inc 	ebx
		loop	movtssuserapp4         ; loop 
		pop 	gs
		pop 	fs
;----------------------------------------------------------------------------		
CPY0200SKP:

	push	edx
	push	eax
	mov	dx,21h ; disable timer interrupt 
	mov	al,01h	
	out	dx,al
	pop	eax
	pop	edx

		int	0feh              ; run AO as a single interrupt gate APPL1   			
		and	fs:[RunFlag],0feh
		;----------------------------------------------------------------------------
		;TEMP Print EFlags
		mov	ax,App2TSSRW_Sel   ; selector for application task segment App1TSSeg 
		mov	gs,ax              ; gs pointing to task segment 	
		mov	ebx, OFFSET App1TaskTSS  ; offset of the TaskTSS for app1 
		mov	eax, dword ptr gs:[ebx].TREFlag ; load eflags 
		mov	ebx, 1120
		;int	0fdh	; Prints the EFlags
		str	ax
		mov	ebx, 1140
		;int 	0fdh
		;-----------------------------------------------------------------------------

		jmp	GoBackToMenu
RunNext:	
		mov	ax,App2TSSRW_Sel
		mov	gs,ax	
		mov	eax,fs:[RunFlag]
		and 	al,02h
		cmp	al,2
		jne	GoBackToMenu
		mov	ebx, OFFSET App2TaskTSS
		mov	eax,0h
		mov	eax, fs:[LoadOffset2]
		add	ax,fs:[JumpOffset2]

		mov	DWORD PTR gs:[ebx].TREIP,eax
		mov	eax, 0d00h
		mov	dword ptr gs:[ebx].TRESP, eax
		mov	eax, 0
		mov	dword ptr gs:[ebx].TREBP, eax
		mov	eax, 4202h
		mov	dword ptr gs:[ebx].TREFlag, eax

		push    eax
		push    ebx
		mov     al,'Z'
		mov     ebx,1980
		int     0f7h
                pop 	ebx
		pop 	eax
		;---------------------------new
		push   	eax
		push	ebx
		push	fs
		mov 	ebx, 02000000h    ; user application memory address 
		mov 	ax,MEMData_Sel    ; 0 base selector for protected mode  
		mov	fs,ax             ; use 0 base selector
		mov     eax,0000025ABh	  ; Change the EIP for application 2
		add     ebx,32
		;mov	DWORD PTR fs:[ebx],eax	
		pop	fs
		pop     ebx
		pop	eax
		;---------------------------new
		

		int	0f9h
		and	fs:[RunFlag],0fdh
GoBackToMenu:
		pop	es
		pop	gs
		pop	fs
		RET
RunAppl  ENDP
;***************************************************************************
; Once the exception occurs, this call will print the stack values so that 
; the user can see the address and EIP, CS values that caused the exception
;  Other_Sel, RCodeSeg, it is in 16 bit segment while in error 
;  It is still using the TSS for the task which caused error 
;  The contents of the stack printed represent 
;  - error code 
;  - address where it failed 
;  - selector for that address 
;  - flag register 
;***************************************************************************
PrintStackException	PROC	FAR 
	push	ebp   		;save the base pointer
	mov	ebp, esp	; load current SP into BP 
	mov 	ecx, 32		; print ten entries in the stack  
	mov 	ebx, 1120	; start location of print 
label210: 
	mov	eax, ss:[ebp + 0]   ; do not print the top 2 entries (push ebp, and the return address of this call)
	add	ebp, 4          ; print next entry 
     	add 	ebx, 2          ; space between printing hex values 
     	int 	0fdh 		; print 4 bytes  
     	LOOP	label210 	; loop to print ten entries  
	sti
	int 	0f5h 		; wait for a character 
	pop	ebp		; restore the base pointer  

	ret		 	; return back to error rtn  
PrintStackException	ENDP
;***************************************************************************
; Set error flag and error code in the global memory 
;***************************************************************************
SetErrorFlag	PROC	FAR
	push eax ; save registers 
	push ebx 
	push ecx
	push es 

	mov	ebx,400
	int	0f7h
	;------------------------------------
	mov	ax, G4Data_Sel 
	;This is a zero base selector to access shared memory between aoa and application
	mov	es, ax
	mov	ebx, S_Base
	add	ebx, S_Error_Flag
	mov 	eax, 1        ; set the error flag in global memory 
	mov	DWORD PTR es:[ebx], eax	
	mov	ebx, S_Base
	add	ebx, S_Error_Code
	mov 	eax, ecx        ; set the error code in global memory 
	mov	DWORD PTR es:[ebx], eax	
	;---------------------------------------------------------------------------------
	;changed this code on 7-7-2004
		cli
		push	edx
		pushfd ; turn off NT flag in the CPU not in the TSS
		; so that CPU will return to its application during IRETD not to 
		;  exit from the task using link field in the TSS 
		pop	edx;
		AND	edx, 0FFFFBFFFh
		push	edx
		popfd
		pop	edx
		sti
	;--------------------------------------------------------------------------------

	pop es ; restore registers 
	pop ecx
	pop ebx 
	pop eax 
	ret
SetErrorFlag	ENDP
;***************************************************************************
;OtherBegin0 Procedure, 0 interrupt  
;***************************************************************************
OtherBegin0      PROC    FAR
	call	PrintStackException ; print stack entries 
	cli
	mov	ecx, 00h
	mov	al, 'A'
	CALL 	SetErrorFlag	; call the routine
	int 08h 
	iretd
OtherBegin0      ENDP
;***************************************************************************
;OtherBegin1 Procedure, 1 interrupt  
;***************************************************************************
OtherBegin1      PROC    FAR
	call	PrintStackException ; print stack entries 
	cli
	mov	ecx, 01h
	mov	al, 'B'
	CALL 	SetErrorFlag	; call the routine
	int 08h 
	iretd
OtherBegin1      ENDP
;***************************************************************************
;OtherBegin2 Procedure, 2 interrupt  
;***************************************************************************
OtherBegin2      PROC    FAR
	call	PrintStackException ; print stack entries 
	cli
	mov	ecx, 02h
	mov	al, 'C'
	CALL 	SetErrorFlag	; call the routine
	int 08h 
	iretd
OtherBegin2      ENDP
;***************************************************************************
;OtherBegin3 Procedure, 3 interrupt  
;***************************************************************************
OtherBegin3      PROC    FAR
	call	PrintStackException ; print stack entries 
	cli
	mov	ecx, 03h
	mov	al, 'D'
	CALL 	SetErrorFlag	; call the routine
	int 08h 
	iretd

OtherBegin3      ENDP
;***************************************************************************
;OtherBegin4 Procedure, 4 interrupt  
;***************************************************************************
OtherBegin4      PROC    FAR
	call	PrintStackException ; print stack entries 
	cli
	mov	ecx, 04h
	mov	al, 'E'
	CALL 	SetErrorFlag	; call the routine
	int 08h 
	iretd
OtherBegin4      ENDP
;***************************************************************************
;OtherBegin5 Procedure, 5 interrupt  
;***************************************************************************
OtherBegin5      PROC    FAR
	call	PrintStackException ; print stack entries 
	cli
	mov	ecx, 05h
	mov	al, 'F'
	CALL 	SetErrorFlag	; call the routine
	int 08h 
	iretd
OtherBegin5      ENDP
;***************************************************************************
;OtherBegin6 Procedure, 6 interrupt
;***************************************************************************
OtherBegin6      PROC    FAR
	call	PrintStackException ; print stack entries 
	cli
	mov	ecx, 06h
	mov	al, 'G'
	CALL 	SetErrorFlag	; call the routine
	int 08h 
	iretd
OtherBegin6      ENDP
;***************************************************************************
;OtherBegin7 Procedure, 7 interrupt  
;***************************************************************************
OtherBegin7      PROC    FAR
	call	PrintStackException ; print stack entries 
	cli
	mov	ecx, 07h
	mov	al, 'H'
	CALL 	SetErrorFlag	; call the routine
	int 08h 
	iretd
OtherBegin7      ENDP
;***************************************************************************
;OtherBegin10 Procedure, 10 interrupt 
;This exception will be generated when the TSS is invalid
;***************************************************************************
OtherBegin10      PROC    FAR
	call	PrintStackException ; print stack entries 
	cli
	mov	ecx, 10 
	mov	al, 'I'
	CALL 	SetErrorFlag	; call the routine
	int 08h 
	iretd
OtherBegin10      ENDP
;***************************************************************************
;OtherBegina11 Procedure, 11 interrupt  
;***************************************************************************
OtherBegin11      PROC    FAR
	call	PrintStackException ; print stack entries 
	cli
	mov	ecx, 11 
	mov	al, 'J'
	CALL 	SetErrorFlag	; call the routine
	int 08h 
	iretd

OtherBegin11      ENDP
;***************************************************************************
;OtherBegina12 Procedure, 12 interrupt  
;***************************************************************************
OtherBegin12      PROC    FAR
	call	PrintStackException ; print stack entries 
	cli
	mov	ecx, 12 
	mov	al, 'K'
	CALL 	SetErrorFlag	; call the routine
	int 08h 
	iretd
OtherBegin12      ENDP
;***************************************************************************
;OtherBegina13 Procedure, 13 interrupt  
;***************************************************************************
OtherBegin13      PROC    FAR
; cli and sti is needed to prevent timer interrupts 

	cli
	push	eax
	push	ebx
	push	fs
	call	PrintStackException ; print stack entries 
	;cli
	;mov	ecx, 13         ; pass Interrupt code 
	;mov	al, 'L'         ; pass print character 
	;CALL 	SetErrorFlag	; set the error flag and controls  
	;int 08h                 ; call interrrupt to give control to error handler
	mov al, 'L' 
	mov ebx, 3980 
	int 0f7h
	mov eax, 0
	mov ax, cs 
	mov ebx, 820 
	int 0fdh
	mov ax, ss 
	mov ebx, 840 
	int 0fdh
	mov eax, esp 
	mov ebx, 860 
	int 0fdh
	mov eax, ebp 
	mov ebx, 880 
	int 0fdh
	mov eax, 0 
	sldt ax 
	mov ebx, 900 
	int 0fdh 
        mov eax, 0 
	str ax 
	mov ebx, 920 
	int 0fdh
	mov ax, RData_Sel
	mov fs, ax 
	mov eax, 0
	sgdt fs:[168h]
	mov  eax,  fs:[16ah]
	mov  ebx, 940 
	int 0fdh
	mov eax, 0
	mov  eax,  fs:[168h]
	mov  ebx, 960 
	int 0fdh

	int 0f5h
	int 0f5h
	int 0f5h
	int 0f5h




	     	;-----------------------------------------------------------------
		;changed this code on 7-7-2004
		push	edx
		pushfd ; turn off NT flag in the CPU not in the TSS
		; so that CPU will return to its application during IRETD not to 
		;  exit from the task using link field in the TSS
		pop	edx
		AND	edx, 0FFFFBFFFh
		push	edx
		popfd
		pop	edx
     		;-----------------------------------------------------------------
	pop	ds
	pop	ebx
	pop	eax

	sti
	iretd		; after sti, no more instructions before iretd  
OtherBegin13      ENDP

;***************************************************************************
;OtherBegina219 Procedure  , 219 interrupt  
;***************************************************************************
OtherBegin219      PROC    FAR
	;call	PrintStackException ; print stack entries 
	cli
;	mov	ecx, 219
;	mov	al, 'M'
;	CALL 	SetErrorFlag	; call the routine
;	int 08h 
	sti
	iretd
OtherBegin219      ENDP

;***************************************************************************
; OtherBegin73 interrupt routine for NIC 
;***************************************************************************
OtherBegin73      PROC    FAR
	cli         ; no more interrupts 
 push eax
 push edx 
 push ecx
 push ebx
 push edi
 push esi
 push fs
;------------------------------------------------------------------------
; this code only for NIC interrupt and TxComplete interrupt
;  every transmit results in an interrupt 
; we save txstatus in DPD location 24 
;  we write some thing into the txstatus to advance to next level 
;------------------------------------------------------------------------
	xor  eax, eax
	xor  edx, edx

	; first check if TxComplete bit is set 
	;  because IRQ11 is shared by many interrupts 
	mov	ax, MEMData_Sel; This is a zero base selector to access shared memory between aoa and application
	mov	fs, ax
	mov ebx, S_Base 
	add ebx, S_IOBASE 
	mov esi, DWORD PTR fs:[ebx]  ; get IOBASE 

;-------------------------------------------------------------------
	;mov 	eax, esi   ; stall the transmitter
	;mov	dx, ax 
	;add 	dx, 0eh
	;mov	ax, 3002h 
	;out 	dx, ax
;W_End1:
	;in      ax, dx
	;and     ax, 1000h                       ;Check status
	;jnz     W_End1
;-------------------------------------------------------------------
	mov  edx, esi		;check TxStatus if TxComplete
	add  edx, 1bh	
	in   al, dx

	mov	edi, eax ; save the status  


	and  al, 80h  ; check for bit 7
	jz   not_NIC  ; if not set then this is not our interrupt 	


	in   al, dx   ; dx is still same 
	out  dx, al   ;write to status register to advance xmitter 

	mov  edx, esi
	add  edx, 0eh		;Command window
	mov  ax, 68ffh          ; acknowledge all interrupts 
	out  dx, ax

	mov	ebx, S_Base
	add	ebx, S_DPD_Count  ; counter 
	mov	eax, DWORD PTR fs:[ebx]  ; get the counter value  
	mov	ecx, 32         ; results are in edx:eax 
	mul	ecx		; 32 byte for each DPD entry 
	mov	edx, 0230bf40h  ; DPD start address hard coded 
	add	edx, eax 
	add	edx, 18h	; TxStatus location in the DPD 
	
	mov	eax, edi        ; get the txstatus stored in the regiser 

        ;-----------------------------------------------------------------------
	; this change allows to add other control bits in the DPD slot location 24 
        and 	eax, 0ffh      ; mask all other 12 bits, status is in last 4 bits
	mov	ecx, DWORD PTR fs:[edx] ; get current contents 
	or	eax, ecx        ; only store the status in 4 bits 
        ;-----------------------------------------------------------------------
	mov	DWORD PTR fs:[edx], eax   ; store it in the DPD 
	; TxStatus is stored in DPD at 24 for future reference 
	push	eax              ; save the DPD status word 

	;-----------------------------------------------------------------------
	and 	eax, 0ffff00ffh   ; reset the send type byte to 0
	mov	DWORD PTR fs:[edx], eax   ; store it in the DPD, next time no recount of this field 
	;-----------------------------------------------------------------------

	mov	ebx, S_Base
	add	ebx, S_DPD_Count  ; counter 
	mov	eax, DWORD PTR fs:[ebx]  ; get the counter value  
	inc	eax   ; increment the count 
	cmp	eax, 10000	; hardcoded DPD size value 
	jnz	skipreset	; no need to reset the counter 
	mov 	eax, 0		; loop back again circular list 
	skipreset:
	mov	DWORD PTR fs:[ebx],eax  ; store value   

	mov	ebx, S_Base
	add	ebx, S_Total_Tx_Count  ; counts no of interrupts received for Txt  
	mov	eax, DWORD PTR fs:[ebx]  ; get the counter value  
	inc	eax   ; increment the count 
	mov	DWORD PTR fs:[ebx],eax  ; store new value   
	;-----------------------------------------------------------------
	; we also update specific counters for header, data, and ack packets 
	;  to keep track of how many of these were served by NIC card which 
	;  is indicated by received interrupts 
	; so that packets transmitted in the application can be checked 
	;  against the packets transmitted by NIC using interrupt count 

	pop	eax	; this is the DPD status 
	mov	ecx, eax    ; save eax in ecx 
       
        ; count synack  code 01
	and	eax, 0000ff00h 
	cmp	eax, 00000100h 
	jnz	skipsynack
	mov	ebx, S_Base
	add	ebx, S_ITCP_SACK_Count
	mov	eax, DWORD PTR fs:[ebx]  ; get the counter value  
	inc	eax   ; increment the count 
	mov	DWORD PTR fs:[ebx],eax  ; store new value   
	skipsynack:

        ; count getack code 02 
	mov	eax, ecx
	and	eax, 0000ff00h 
	cmp	eax, 00000200h 
	jnz	skipgetack
	mov	ebx, S_Base
	add	ebx, S_ITCP_GACK_Count
	mov	eax, DWORD PTR fs:[ebx]  ; get the counter value  
	inc	eax   ; increment the count 
	mov	DWORD PTR fs:[ebx],eax  ; store new value   
	skipgetack:

	; count header code 03
	mov	eax, ecx 
	and	eax, 0000ff00h 
	cmp	eax, 00000300h 
	jnz	skipheader
	mov	ebx, S_Base
	add	ebx, S_ITCP_HDR_Count
	mov	eax, DWORD PTR fs:[ebx]  ; get the counter value  
	inc	eax   ; increment the count 
	mov	DWORD PTR fs:[ebx],eax  ; store new value   
	skipheader:
	 
	; count data packets code 04 
	mov	eax, ecx    ; restore TxStatus  
	and	eax, 0000ff00h 
	cmp	eax, 00000400h 
	jnz	skipdata
	mov	ebx, S_Base
	add	ebx, S_ITCP_DAT_Count
	mov	eax, DWORD PTR fs:[ebx]  ; get the counter value  
	inc	eax   ; increment the count 
	mov	DWORD PTR fs:[ebx],eax  ; store new value   
	skipdata:

	; count finack code 05 
	mov	eax, ecx
	and	eax, 0000ff00h 
	cmp	eax, 00000500h 
	jnz	skipfinack 
	mov	ebx, S_Base
	add	ebx, S_ITCP_FACK_Count
	mov	eax, DWORD PTR fs:[ebx]  ; get the counter value  
	inc	eax   ; increment the count 
	mov	DWORD PTR fs:[ebx],eax  ; store new value   
	skipfinack:

	; count resets code 06 
	mov	eax, ecx
	and	eax, 0000ff00h 
	cmp	eax, 00000600h 
	jnz	skipresets 
	mov	ebx, S_Base
	add	ebx, S_ITCP_RESET_Count
	mov	eax, DWORD PTR fs:[ebx]  ; get the counter value  
	inc	eax   ; increment the count 
	mov	DWORD PTR fs:[ebx],eax  ; store new value   
	skipresets:

	; count ARP code 07 
	mov	eax, ecx
	and	eax, 0000ff00h 
	cmp	eax, 00000700h 
	jnz	skiparps
	mov	ebx, S_Base
	add	ebx, S_ITCP_ARP_Count
	mov	eax, DWORD PTR fs:[ebx]  ; get the counter value  
	inc	eax   ; increment the count 
	mov	DWORD PTR fs:[ebx],eax  ; store new value   
	skiparps:
	;-----------------------------------------------------------------

	;mov  	ebx, 3200 
	;int  	0fdh

	mov	ebx, S_Base
	add	ebx, S_DPD_Count  ; counter 
	mov	eax, DWORD PTR fs:[ebx]  ; get the counter value  
	;mov  	ebx, 3220 
	;int  	0fdh

not_NIC:
;-------------------------------------------------------------------
	;mov 	eax, esi   ; unstall the transmitter
	;mov	dx, ax 
	;add 	dx, 0eh
	;mov	ax, 3003h 
	;out 	dx, ax
;W_End2:
	;in      ax, dx
	;and     ax, 1000h                       ;Check status
	;jnz     W_End2
;-------------------------------------------------------------------
	mov	ax, 0a0h  ;ack PIC 2
	mov	dx, ax
	mov	al, 020h
	out	dx, al
	mov	ax, 020h  ;ack PIC 1
	mov	dx, ax
	mov	al, 020h
	out	dx, al

pop fs
pop esi
pop edi
pop ebx
pop ecx 
pop edx 
pop eax
	     	;-----------------------------------------------------------------
		;changed this code on 7-7-2004
		push	edx
		pushfd ; turn off NT flag in the CPU not in the TSS
		; so that CPU will return to its application during IRETD not to 
		;  exit from the task using link field in the TSS
		pop	edx
		AND	edx, 0FFFFBFFFh
		push	edx
		popfd
		pop	edx
     		;-----------------------------------------------------------------

		sti	; enable interrupts 
		iretd

OtherBegin73      ENDP

RCodeLen     =       $
;-----------------------------------------------------------------
RCodeSeg        ENDS
		END     Start

	
