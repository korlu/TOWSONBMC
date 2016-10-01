
option expr32
option casemap:none

; Begin of file aoainc.h

;---------------------------------------------------
;Shared Memory Constants between appilication and aoa
S_Timer			EQU		000000000h 
S_SectorNo		EQU		000000004h 

;----------------------------------------------------

; Base of Shared memory between aoa and application
;----------------------------------------------------
S_Base			EQU		000008600h
;----------------------------------------------------

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
; This is the Zero selector in GDT for addressing Real mode memory such as 8600
; This is used to address Shared memory in protected mode

; when PRCYCLE changes, the offset for Timer memory 
;  location will change. Make sure you keep the 
; following value upto date 
; RKK use prcycle.lst to get this offset 
Timer		EQU		00000020Dh
AppGDTPtr	EQU		0000001BDh	;Store the GDT starting address

StoreCharOffset		EQU		11t
StoreDecOffset		EQU		12t



@proto_0		TYPEDEF		PROTO C :PTR BYTE, :DWORD, :DWORD
printstrasm32		PROTO		@proto_0

@proto_1		TYPEDEF		PROTO C :PTR BYTE
getstrasm32		PROTO		@proto_1

@proto_2		TYPEDEF		PROTO C :DWORD
setcursorasm32		PROTO		@proto_2

@proto_3		TYPEDEF		PROTO C :BYTE, :DWORD
printcharasm32		PROTO		@proto_3

@proto_4		TYPEDEF		PROTO C :DWORD, :DWORD
printhexasm32		PROTO		@proto_4

@proto_5		TYPEDEF		PROTO C :PTR BYTE, :DWORD
writefloppyasm32	PROTO		@proto_5

@proto_6		TYPEDEF		PROTO C 
getcursorasm32		PROTO		@proto_6

@proto_7		TYPEDEF		PROTO C :DWORD 
getcharasm32		PROTO		@proto_7

@proto_8		TYPEDEF		PROTO C 
gettimerasm32		PROTO		@proto_8

@proto_9		TYPEDEF		PROTO C 
getdecasm32		PROTO		@proto_9

@proto_10		TYPEDEF		PROTO C 
cleanscreenasm32	PROTO		@proto_10

@proto_11		TYPEDEF		PROTO C 
scrollasm32		PROTO		@proto_11

@proto_12		typedef		proto c :PTR DWORD
mallocasm32		proto		@proto_12


@proto_13		typedef		proto c :DWORD
freeasm32		proto		@proto_13

@proto_14		typedef		proto c 
getTaskPtrasm32		proto		@proto_14

@proto_15		typedef		proto c :PTR DWORD, :PTR BYTE, :DWORD
fetchasm32		proto		@proto_15

@proto_16		typedef		proto c :PTR DWORD, :PTR DWORD, :WORD
getGDTEntryasm32	proto		@proto_16

@proto_17		typedef		proto c :PTR DWORD, :PTR DWORD, :WORD
setGDTEntryasm32	proto		@proto_17

@proto_18		typedef		proto c :PTR BYTE, :DWORD
readfloppyasm32		proto		@proto_18

@proto_19		typedef		proto c :DWORD, :DWORD, :WORD 
initschedulerasm32	proto		@proto_19
@proto_20		typedef		proto c :DWORD 
inittimerasm32	proto		@proto_20
@proto_21		typedef proto c 
stiasm32	proto		@proto_21
@proto_22		typedef proto c
ctiasm32	proto		@proto_22
@proto_23		typedef		proto c :DWORD 
printflagsasm32	proto		@proto_23
@proto_24		typedef		proto c :DWORD 
getsharedmemasm32	proto		@proto_24
@proto_25		typedef		proto c :DWORD 
getstackpopasm32	proto		@proto_25
@proto_26		typedef		proto c :DWORD 
printregsasm32		proto		@proto_26
@proto_27		typedef		proto c :DWORD, :DWORD 
getsharedmemcharasm32			proto		@proto_27
@proto_28		typedef		proto c :DWORD, :BYTE, :DWORD
setsharedmemcharasm32			proto		@proto_28
@proto_29		typedef		proto c
intttimerasm32			proto		@proto_29
@proto_30		typedef		proto c :DWORD, :DWORD
testandsetasm32			proto		@proto_30
@proto_31		typedef		proto c :DWORD,  :DWORD
resetlockasm32			proto		@proto_31
@proto_32		typedef		proto c :DWORD, :DWORD 
setsharedmemasm32	proto		@proto_32
; End of file aoainc.h
