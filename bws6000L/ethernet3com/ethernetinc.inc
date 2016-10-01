
option expr32
option casemap:none

; Begin of file ethernetinc.h
; all these values were obtained from the 3com manual 
; no need to change them 
SizeOfDpd			EQU		00000020h
SizeOfUpd			EQU	        00000020h

Command_SetIndicationEnable	EQU		00007800h
Command_RXReset			EQU		00002800h
Command_SelectWindow		EQU		00000800h
Command_RXEnable		EQU		00002000h
Command_SetRXFilter		EQU		00008000h
Command_TXReset			EQU		00005800h
Command_TXEnable		EQU		00004800h
Command_TXDisable		EQU		00005000h
Command_ReadEpromCommand	EQU		00000080h
Command_TxStartThresh		EQU		0000983ch 
; 60 bytes = 3ch min threshold which is length of ethernet packet
Command_DnStall			EQU		00003002h 
Command_DnUnStall		EQU		00003003h 
Command_UpStall			EQU		00003000h 
Command_UpUnStall		EQU		00003001h 
Command_StatsEnable		EQU		0000a800h




ID_PORT				EQU		00000110h
PreambleData			EQU		0000820ch
Command_GlobalReset		EQU		00000000h
Command_StartIntXCVR		EQU		00001000h
Command_RXDisable		EQU		00001800h
Command_RXDiscard		EQU		00004000h
Command_RequestInt		EQU		00006000h
Command_AckInt			EQU		00006800h
Command_SetIntMask		EQU		00007000h
;Command_SetRZMask		EQU		00007800h
Command_SetRXEarly		EQU		00008800h
Command_SetTXAvailable		EQU		00009000h
Command_SetTXStart		EQU		00009800h
Command_StatsDisable		EQU		0000b000h
Command_StopCoaxTrans		EQU		0000b800h

;Processor Speed in MHZ. This is used by Short Delay Procedure
;-------------------------------------------------------------
Processor_Speed		EQU		355
NoOfCycles_Delay	EQU		5	
; No of cycles used to calculate the delay loop 
;-------------------------------------------------------------
GlobalDataSel		EQU		000000b8h
RDataSel		EQU		00000018h
GKKQ			EQU		00000308h
GKHead			EQU		00000407h
GKTail			EQU		00000408h
StackSel		EQU		0000000Ch
Puthex32DataSel 	EQU		00000090h
MEMDataSel         	EQU		000000C0h ; G4Data_Sel prcycle 

@proto_0		TYPEDEF		PROTO C :WORD, :PTR BYTE
initasm		PROTO		@proto_0

@proto_1		TYPEDEF		PROTO C :WORD, :PTR BYTE
receasm		PROTO		@proto_1

@proto_2		TYPEDEF		PROTO C :WORD, :PTR BYTE, :DWORD
transasm		PROTO		@proto_2

@proto_7		typedef		proto c :word
closeasm			proto		@proto_7

@proto_3		TYPEDEF		PROTO C 
Wait_Command_Finish		PROTO		@proto_3

@proto_4		TYPEDEF		PROTO C 
Wait_EEPROM_Unbusy		PROTO		@proto_4

@proto_5		TYPEDEF		PROTO C 
Check_Window6_Transmit_Success		PROTO		@proto_5

@proto_6		TYPEDEF		PROTO C 
Check_Window3_FreeTX		PROTO		@proto_6

; End of file ethernetinc.h
