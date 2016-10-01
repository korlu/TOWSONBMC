;Shared Memory Constants between appilication and aoa
S_Timer			EQU		00000000h ; software timer value, incremented by timer interrupt 
S_SectorNo		EQU		00000004h ; 4 byte sector number and another 4 byte spare 
; after this element, the GetSecBegin in prcycle stores another data value 
;  with +2 location, so keep another 4 bytes as spare here 
S_IDTOffset		EQU		0000000Ch ; used by Timer interrupt 
S_Cycle_Count		EQU		00000010h 
; This is the count used by the Htimer to calculate the processor clock speed, which is stored in S_Clock_Hz
S_Clock_Hz		EQU		00000014h ; This shared memory has the clock speed in Giga Hertz
S_Error_Flag		EQU		00000018h ; error flag indicating that error occured in the machine 
S_Error_Code            EQU             0000001Ch ; error code showing the IDT value 
S_IO_Function_Code      EQU             00000020h ; Function Code Indicating the type of function 4 bytes   
;each assembly interface call will put this code in memory 
S_APP_String		EQU		00000024h ; 40 bytes Used for storing a string 
;all C++ programs and functions can store a string here to be used as a trace 
; the string here indicates the last C++ function trace which can help identify 
; the trace code ran before an error 
S_Lock1 		EQU		0000004Ch ; 4 byte lock 0 DISPLAY 
S_Lock2 		EQU		00000050h ; 4 byte lock 1 KBD  
S_Lock3 		EQU		00000054h ; 4 byte lock 2 
S_Lock4 		EQU		00000058h ; 4 byte lock 3 
S_TID1			EQU		0000005ch ; Task ID 1     DISPLAY 
S_TID2			EQU		00000060h ; Task ID 2     KBD 
S_TID3			EQU		00000064h ; Task ID 3
S_TID4			EQU		00000068h ; Task ID 4
S_InCount		EQU		00000070h ; 4 byte the no of interrupt pkts received 
S_OutCount		EQU		00000074h ; 4 byte the no of pkts processed 
S_PID 			EQU		00000078h ; 4 byte task id of the process running 
S_NTFLAG		EQU		0000007ch ; 4 byte CPU NTFLAG 
S_CIRLISTSTATE		EQU		00000080h ; 4 byte cirlist condition
S_InRecord		EQU		00000084h ; 4 byte in record for cirlist 
S_OutRecord		EQU		00000088h ; 4 byte out record for cirlist 
S_ISRCount		EQU		0000008Ch ; 4 byte counter used to communicate betn ISR Rtn and Poll Task
S_ISRSTIFlag		EQU		00000090h ; 4 byte ISR STI flag indicating its execution, no sti now... 
S_DUMMY			EQU		00000094h ; 8 byte dummy data  
S_IOBASE		EQU		0000009Ch ; 4 byte NIC device address
S_EINIT_RET		EQU		000000a0h ; 4 byte Ethernet Init Ret code 
S_Total_Tx_Count	EQU		000000a4h ; 4 byte counter counts total pkts xmitted 
S_DPD_Count		EQU		000000a8h ; 4 byte counter
S_Suspend_Command	EQU		000000ach ; 4 byte value
S_Suspend_Delay		EQU		000000b0h ; 4 byte value
S_TCP_Tx_Count		EQU		000000b4h ; total packets sent by application   

S_TCP_SACK_Count	EQU		000000b8h ; total GET SYN ACK packets sent by application   
S_TCP_GACK_Count	EQU		000000bch ; total GET ACK packets sent by application   
S_TCP_HDR_Count		EQU		000000c0h ; total header packets sent by application   
S_TCP_DAT_Count		EQU		000000c4h ; total data packets sent by application   
S_TCP_FACK_Count	EQU		000000c8h ; total FIN ACK packets sent by application   
S_TCP_RESET_Count	EQU		000000cch ; total GET RESET packets sent by application   
S_TCP_ARP_Count		EQU		000000d0h ; total GET ARP packets sent by application   

S_ITCP_SACK_Count	EQU		00000100h ; total interrupts for SYN ACK packets   
S_ITCP_GACK_Count	EQU		00000104h ; total interrupts for GET ACK packets   
S_ITCP_HDR_Count	EQU		00000108h ; total interrupts for header packets  
S_ITCP_DAT_Count	EQU		0000010ch ; total interrrupts for data packets  
S_ITCP_FACK_Count	EQU		00000110h ; total interrupts for FIN ACK packets   
S_ITCP_RESET_Count	EQU		00000114h ; total interrupts for RESET packets   
S_ITCP_ARP_Count	EQU		00000118h ; total interrupts for ARP packets   
S_ITCP_PRIOR_Count	EQU		0000011ch ; interrupt prior count before TCP transmissions    
;--------------------------------------------------------------------------------
S_RTC	            EQU		00000120h ; real time clock     
S_DATE	            EQU		00000124h ; date     
S_ERR	            EQU		00000128h ; error      
S_RTCFLAG	        EQU		00000130h ; flag     

S_LSError		EQU		00000140h ; Sector Error when reading floppy     
;----------------------------------------------------
S_Trace			EQU		00000160h ; 128 byte trace data 

;----------------------------------------------------

; Base of Shared memory between aoa and application
;--------------------------------------------
S_Base			EQU		00008600h ; base address of shared memory 

;--------------------------------------------
; Some other constants
;change the following value if loading the program changes 
;  most significant 2 bytes 
D_ADDROFFSET		EQU		0011h
Video_Sel_Loc		EQU		10h 
