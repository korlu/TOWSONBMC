	TITLE	apptask.cpp
	.386P
include listing.inc
if @Version gt 510
.model FLAT
else
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
CONST	SEGMENT DWORD USE32 PUBLIC 'CONST'
CONST	ENDS
_BSS	SEGMENT DWORD USE32 PUBLIC 'BSS'
_BSS	ENDS
_TLS	SEGMENT DWORD USE32 PUBLIC 'TLS'
_TLS	ENDS
;	COMDAT ??0TCPObj@@QAE@XZ
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT ??0FTOPObj@@QAE@XZ
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT ??0WStack@@QAE@XZ
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT ??0WCirList@@QAE@XZ
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT ??0WTTrace@@QAE@XZ
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT ??0HTTPList@@QAE@XZ
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT ??0TcphashIndex@@QAE@XZ
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT ??0WList@@QAE@XZ
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT ??0parserObj@@QAE@XZ
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT ??0FTPObj@@QAE@XZ
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT ??0UDPObj@@QAE@XZ
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
FLAT	GROUP _DATA, CONST, _BSS
	ASSUME	CS: FLAT, DS: FLAT, SS: FLAT
endif
PUBLIC	?ExitTimer@apptask@@2KA				; apptask::ExitTimer
PUBLIC	?TotalHttpCount@apptask@@2JA			; apptask::TotalHttpCount
PUBLIC	?TotalRcvCount@apptask@@2JA			; apptask::TotalRcvCount
PUBLIC	?TotalSuspendCount@apptask@@2JA			; apptask::TotalSuspendCount
PUBLIC	?rcvstarttime@apptask@@2JA			; apptask::rcvstarttime
PUBLIC	?httpstarttime@apptask@@2JA			; apptask::httpstarttime
PUBLIC	?totalstarttime@apptask@@2JA			; apptask::totalstarttime
PUBLIC	?rcvcurtime@apptask@@2JA			; apptask::rcvcurtime
PUBLIC	?httpcurtime@apptask@@2JA			; apptask::httpcurtime
PUBLIC	?totalcurtime@apptask@@2JA			; apptask::totalcurtime
PUBLIC	?systemstarttime@apptask@@2JA			; apptask::systemstarttime
PUBLIC	?TotalDataRcvd@apptask@@2JA			; apptask::TotalDataRcvd
PUBLIC	?t1high@apptask@@2IA				; apptask::t1high
PUBLIC	?t1low@apptask@@2IA				; apptask::t1low
PUBLIC	?t2high@apptask@@2IA				; apptask::t2high
PUBLIC	?t2low@apptask@@2IA				; apptask::t2low
PUBLIC	?rcvtickshigh@apptask@@2IA			; apptask::rcvtickshigh
PUBLIC	?rcvtickslow@apptask@@2IA			; apptask::rcvtickslow
PUBLIC	?httptickshigh@apptask@@2IA			; apptask::httptickshigh
PUBLIC	?httptickslow@apptask@@2IA			; apptask::httptickslow
PUBLIC	?totaltickshigh@apptask@@2IA			; apptask::totaltickshigh
PUBLIC	?totaltickslow@apptask@@2IA			; apptask::totaltickslow
PUBLIC	?Scheduler_Flag@apptask@@2JA			; apptask::Scheduler_Flag
PUBLIC	?Task_Status@apptask@@2PAHA			; apptask::Task_Status
PUBLIC	?Task_Delay@apptask@@2PAHA			; apptask::Task_Delay
PUBLIC	?Current_Task@apptask@@2HA			; apptask::Current_Task
PUBLIC	?Current_Tcbrno@apptask@@2HA			; apptask::Current_Tcbrno
PUBLIC	?Current_State@apptask@@2HA			; apptask::Current_State
PUBLIC	?ftpFlag@apptask@@2HA				; apptask::ftpFlag
PUBLIC	?packts@apptask@@2JA				; apptask::packts
PUBLIC	?ippackcount@apptask@@2JA			; apptask::ippackcount
PUBLIC	?arppackcount@apptask@@2JA			; apptask::arppackcount
PUBLIC	?otherpackcount@apptask@@2JA			; apptask::otherpackcount
PUBLIC	?upCompleteNotSetCount@apptask@@2JA		; apptask::upCompleteNotSetCount
PUBLIC	?notForThisNodeCount@apptask@@2JA		; apptask::notForThisNodeCount
PUBLIC	?notArpOrIpCount@apptask@@2JA			; apptask::notArpOrIpCount
PUBLIC	?schedulerCount@apptask@@2JA			; apptask::schedulerCount
PUBLIC	?WSFreeTask@apptask@@2HA			; apptask::WSFreeTask
PUBLIC	?WSStartTaskNo@apptask@@2HA			; apptask::WSStartTaskNo
PUBLIC	?WSEndTaskNo@apptask@@2HA			; apptask::WSEndTaskNo
PUBLIC	?TaskNextPtr@apptask@@2PAHA			; apptask::TaskNextPtr
PUBLIC	?noethpacksp@apptask@@2KA			; apptask::noethpacksp
PUBLIC	?noetherrors@apptask@@2KA			; apptask::noetherrors
PUBLIC	?SrcIP@apptask@@2PADA				; apptask::SrcIP
PUBLIC	?FTPServerIP@apptask@@2PADA			; apptask::FTPServerIP
PUBLIC	?GateWayIP@apptask@@2PADA			; apptask::GateWayIP
PUBLIC	?GateWayMAC@apptask@@2PADA			; apptask::GateWayMAC
PUBLIC	?SrcMAC@apptask@@2PADA				; apptask::SrcMAC
PUBLIC	?arptimer@apptask@@2HA				; apptask::arptimer
PUBLIC	?ScheduleArray@apptask@@2PAHA			; apptask::ScheduleArray
PUBLIC	?taskDeletes@apptask@@2HA			; apptask::taskDeletes
PUBLIC	?resumeCount@apptask@@2HA			; apptask::resumeCount
PUBLIC	?cvalue@apptask@@2JA				; apptask::cvalue
PUBLIC	?svalue@apptask@@2JA				; apptask::svalue
PUBLIC	?gvalue@apptask@@2JA				; apptask::gvalue
PUBLIC	?tvalue@apptask@@2JA				; apptask::tvalue
PUBLIC	?runFlag@apptask@@2HA				; apptask::runFlag
PUBLIC	?iddlecount@apptask@@2JA			; apptask::iddlecount
PUBLIC	?MaxTaskId@apptask@@2JA				; apptask::MaxTaskId
PUBLIC	?MinTaskId@apptask@@2JA				; apptask::MinTaskId
_BSS	SEGMENT
?ExitTimer@apptask@@2KA DD 01H DUP (?)			; apptask::ExitTimer
?TotalHttpCount@apptask@@2JA DD 01H DUP (?)		; apptask::TotalHttpCount
?TotalRcvCount@apptask@@2JA DD 01H DUP (?)		; apptask::TotalRcvCount
?TotalSuspendCount@apptask@@2JA DD 01H DUP (?)		; apptask::TotalSuspendCount
?rcvstarttime@apptask@@2JA DD 01H DUP (?)		; apptask::rcvstarttime
?httpstarttime@apptask@@2JA DD 01H DUP (?)		; apptask::httpstarttime
?totalstarttime@apptask@@2JA DD 01H DUP (?)		; apptask::totalstarttime
?rcvcurtime@apptask@@2JA DD 01H DUP (?)			; apptask::rcvcurtime
?httpcurtime@apptask@@2JA DD 01H DUP (?)		; apptask::httpcurtime
?totalcurtime@apptask@@2JA DD 01H DUP (?)		; apptask::totalcurtime
?systemstarttime@apptask@@2JA DD 01H DUP (?)		; apptask::systemstarttime
?TotalDataRcvd@apptask@@2JA DD 01H DUP (?)		; apptask::TotalDataRcvd
?t1high@apptask@@2IA DD 01H DUP (?)			; apptask::t1high
?t1low@apptask@@2IA DD 01H DUP (?)			; apptask::t1low
?t2high@apptask@@2IA DD 01H DUP (?)			; apptask::t2high
?t2low@apptask@@2IA DD 01H DUP (?)			; apptask::t2low
?rcvtickshigh@apptask@@2IA DD 01H DUP (?)		; apptask::rcvtickshigh
?rcvtickslow@apptask@@2IA DD 01H DUP (?)		; apptask::rcvtickslow
?httptickshigh@apptask@@2IA DD 01H DUP (?)		; apptask::httptickshigh
?httptickslow@apptask@@2IA DD 01H DUP (?)		; apptask::httptickslow
?totaltickshigh@apptask@@2IA DD 01H DUP (?)		; apptask::totaltickshigh
?totaltickslow@apptask@@2IA DD 01H DUP (?)		; apptask::totaltickslow
?Scheduler_Flag@apptask@@2JA DD 01H DUP (?)		; apptask::Scheduler_Flag
?Task_Status@apptask@@2PAHA DD 01f40H DUP (?)		; apptask::Task_Status
?Task_Delay@apptask@@2PAHA DD 01f40H DUP (?)		; apptask::Task_Delay
?Current_State@apptask@@2HA DD 01H DUP (?)		; apptask::Current_State
?ftpFlag@apptask@@2HA DD 01H DUP (?)			; apptask::ftpFlag
?packts@apptask@@2JA DD 01H DUP (?)			; apptask::packts
?ippackcount@apptask@@2JA DD 01H DUP (?)		; apptask::ippackcount
?arppackcount@apptask@@2JA DD 01H DUP (?)		; apptask::arppackcount
?otherpackcount@apptask@@2JA DD 01H DUP (?)		; apptask::otherpackcount
?upCompleteNotSetCount@apptask@@2JA DD 01H DUP (?)	; apptask::upCompleteNotSetCount
?notForThisNodeCount@apptask@@2JA DD 01H DUP (?)	; apptask::notForThisNodeCount
?notArpOrIpCount@apptask@@2JA DD 01H DUP (?)		; apptask::notArpOrIpCount
?schedulerCount@apptask@@2JA DD 01H DUP (?)		; apptask::schedulerCount
?WSFreeTask@apptask@@2HA DD 01H DUP (?)			; apptask::WSFreeTask
?WSStartTaskNo@apptask@@2HA DD 01H DUP (?)		; apptask::WSStartTaskNo
?WSEndTaskNo@apptask@@2HA DD 01H DUP (?)		; apptask::WSEndTaskNo
?TaskNextPtr@apptask@@2PAHA DD 01f40H DUP (?)		; apptask::TaskNextPtr
?noethpacksp@apptask@@2KA DD 01H DUP (?)		; apptask::noethpacksp
?noetherrors@apptask@@2KA DD 01H DUP (?)		; apptask::noetherrors
?arptimer@apptask@@2HA DD 01H DUP (?)			; apptask::arptimer
?ScheduleArray@apptask@@2PAHA DD 010H DUP (?)		; apptask::ScheduleArray
?taskDeletes@apptask@@2HA DD 01H DUP (?)		; apptask::taskDeletes
?resumeCount@apptask@@2HA DD 01H DUP (?)		; apptask::resumeCount
?cvalue@apptask@@2JA DD 01H DUP (?)			; apptask::cvalue
?svalue@apptask@@2JA DD 01H DUP (?)			; apptask::svalue
?gvalue@apptask@@2JA DD 01H DUP (?)			; apptask::gvalue
?tvalue@apptask@@2JA DD 01H DUP (?)			; apptask::tvalue
?runFlag@apptask@@2HA DD 01H DUP (?)			; apptask::runFlag
?iddlecount@apptask@@2JA DD 01H DUP (?)			; apptask::iddlecount
?MaxTaskId@apptask@@2JA DD 01H DUP (?)			; apptask::MaxTaskId
?MinTaskId@apptask@@2JA DD 01H DUP (?)			; apptask::MinTaskId
_BSS	ENDS
_DATA	SEGMENT
?SrcIP@apptask@@2PADA DB 0aH				; apptask::SrcIP
	DB	037H
	DB	041H
	DB	0eH
?GateWayIP@apptask@@2PADA DB 0aH			; apptask::GateWayIP
	DB	037H
	DB	041H
	DB	0feH
?FTPServerIP@apptask@@2PADA DB 0aH			; apptask::FTPServerIP
	DB	037H
	DB	041H
	DB	073H
?GateWayMAC@apptask@@2PADA DB 00H			; apptask::GateWayMAC
	DB	025H
	DB	045H
	DB	059H
	DB	098H
	DB	0bfH
	ORG $+2
?SrcMAC@apptask@@2PADA DB 00H				; apptask::SrcMAC
	DB	08H
	DB	074H
	DB	0deH
	DB	089H
	DB	040H
	ORG $+2
?Current_Task@apptask@@2HA DD 03H			; apptask::Current_Task
?Current_Tcbrno@apptask@@2HA DD 0ffffffffH		; apptask::Current_Tcbrno
_DATA	ENDS
PUBLIC	??0WTTrace@@QAE@XZ				; WTTrace::WTTrace
PUBLIC	??0TCPObj@@QAE@XZ				; TCPObj::TCPObj
PUBLIC	??0FTOPObj@@QAE@XZ				; FTOPObj::FTOPObj
PUBLIC	??0WCirList@@QAE@XZ				; WCirList::WCirList
PUBLIC	??0WStack@@QAE@XZ				; WStack::WStack
PUBLIC	??0apptask@@QAE@XZ				; apptask::apptask
EXTRN	??0AOAProtected@@QAE@XZ:NEAR			; AOAProtected::AOAProtected
EXTRN	??0EtherObj@@QAE@XZ:NEAR			; EtherObj::EtherObj
_TEXT	SEGMENT
_this$ = -4
??0apptask@@QAE@XZ PROC NEAR				; apptask::apptask
; File apptask.cpp
; Line 109
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	??0AOAProtected@@QAE@XZ			; AOAProtected::AOAProtected
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	??0EtherObj@@QAE@XZ			; EtherObj::EtherObj
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 16					; 00000010H
	call	??0TCPObj@@QAE@XZ			; TCPObj::TCPObj
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 372				; 00000174H
	call	??0FTOPObj@@QAE@XZ			; FTOPObj::FTOPObj
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 388				; 00000184H
	call	??0WStack@@QAE@XZ			; WStack::WStack
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 396				; 0000018cH
	call	??0WCirList@@QAE@XZ			; WCirList::WCirList
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 404				; 00000194H
	call	??0WTTrace@@QAE@XZ			; WTTrace::WTTrace
; Line 111
	mov	eax, DWORD PTR _this$[ebp]
	mov	esp, ebp
	pop	ebp
	ret	0
??0apptask@@QAE@XZ ENDP					; apptask::apptask
_TEXT	ENDS
PUBLIC	??0HTTPList@@QAE@XZ				; HTTPList::HTTPList
PUBLIC	??0WList@@QAE@XZ				; WList::WList
PUBLIC	??0TcphashIndex@@QAE@XZ				; TcphashIndex::TcphashIndex
EXTRN	??0ARPObj@@QAE@XZ:NEAR				; ARPObj::ARPObj
EXTRN	??0IPObj@@QAE@XZ:NEAR				; IPObj::IPObj
;	COMDAT ??0TCPObj@@QAE@XZ
_TEXT	SEGMENT
_this$ = -4
??0TCPObj@@QAE@XZ PROC NEAR				; TCPObj::TCPObj, COMDAT
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	??0ARPObj@@QAE@XZ			; ARPObj::ARPObj
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 288				; 00000120H
	call	??0IPObj@@QAE@XZ			; IPObj::IPObj
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 308				; 00000134H
	call	??0AOAProtected@@QAE@XZ			; AOAProtected::AOAProtected
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 316				; 0000013cH
	call	??0HTTPList@@QAE@XZ			; HTTPList::HTTPList
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 328				; 00000148H
	call	??0TcphashIndex@@QAE@XZ			; TcphashIndex::TcphashIndex
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 340				; 00000154H
	call	??0WList@@QAE@XZ			; WList::WList
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 348				; 0000015cH
	call	??0WTTrace@@QAE@XZ			; WTTrace::WTTrace
	mov	eax, DWORD PTR _this$[ebp]
	mov	esp, ebp
	pop	ebp
	ret	0
??0TCPObj@@QAE@XZ ENDP					; TCPObj::TCPObj
_TEXT	ENDS
;	COMDAT ??0FTOPObj@@QAE@XZ
_TEXT	SEGMENT
_this$ = -4
??0FTOPObj@@QAE@XZ PROC NEAR				; FTOPObj::FTOPObj, COMDAT
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	??0EtherObj@@QAE@XZ			; EtherObj::EtherObj
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	??0AOAProtected@@QAE@XZ			; AOAProtected::AOAProtected
	mov	eax, DWORD PTR _this$[ebp]
	mov	esp, ebp
	pop	ebp
	ret	0
??0FTOPObj@@QAE@XZ ENDP					; FTOPObj::FTOPObj
_TEXT	ENDS
;	COMDAT ??0WStack@@QAE@XZ
_TEXT	SEGMENT
_this$ = -4
??0WStack@@QAE@XZ PROC NEAR				; WStack::WStack, COMDAT
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	??0AOAProtected@@QAE@XZ			; AOAProtected::AOAProtected
	mov	eax, DWORD PTR _this$[ebp]
	mov	esp, ebp
	pop	ebp
	ret	0
??0WStack@@QAE@XZ ENDP					; WStack::WStack
_TEXT	ENDS
;	COMDAT ??0WCirList@@QAE@XZ
_TEXT	SEGMENT
_this$ = -4
??0WCirList@@QAE@XZ PROC NEAR				; WCirList::WCirList, COMDAT
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	??0AOAProtected@@QAE@XZ			; AOAProtected::AOAProtected
	mov	eax, DWORD PTR _this$[ebp]
	mov	esp, ebp
	pop	ebp
	ret	0
??0WCirList@@QAE@XZ ENDP				; WCirList::WCirList
_TEXT	ENDS
;	COMDAT ??0WTTrace@@QAE@XZ
_TEXT	SEGMENT
_this$ = -4
??0WTTrace@@QAE@XZ PROC NEAR				; WTTrace::WTTrace, COMDAT
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	??0AOAProtected@@QAE@XZ			; AOAProtected::AOAProtected
	mov	eax, DWORD PTR _this$[ebp]
	mov	esp, ebp
	pop	ebp
	ret	0
??0WTTrace@@QAE@XZ ENDP					; WTTrace::WTTrace
_TEXT	ENDS
;	COMDAT ??0HTTPList@@QAE@XZ
_TEXT	SEGMENT
_this$ = -4
??0HTTPList@@QAE@XZ PROC NEAR				; HTTPList::HTTPList, COMDAT
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	??0AOAProtected@@QAE@XZ			; AOAProtected::AOAProtected
	mov	eax, DWORD PTR _this$[ebp]
	mov	esp, ebp
	pop	ebp
	ret	0
??0HTTPList@@QAE@XZ ENDP				; HTTPList::HTTPList
_TEXT	ENDS
;	COMDAT ??0TcphashIndex@@QAE@XZ
_TEXT	SEGMENT
_this$ = -4
??0TcphashIndex@@QAE@XZ PROC NEAR			; TcphashIndex::TcphashIndex, COMDAT
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	??0AOAProtected@@QAE@XZ			; AOAProtected::AOAProtected
	mov	eax, DWORD PTR _this$[ebp]
	mov	esp, ebp
	pop	ebp
	ret	0
??0TcphashIndex@@QAE@XZ ENDP				; TcphashIndex::TcphashIndex
_TEXT	ENDS
;	COMDAT ??0WList@@QAE@XZ
_TEXT	SEGMENT
_this$ = -4
??0WList@@QAE@XZ PROC NEAR				; WList::WList, COMDAT
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	??0AOAProtected@@QAE@XZ			; AOAProtected::AOAProtected
	mov	eax, DWORD PTR _this$[ebp]
	mov	esp, ebp
	pop	ebp
	ret	0
??0WList@@QAE@XZ ENDP					; WList::WList
_TEXT	ENDS
PUBLIC	??0apptask@@QAE@H@Z				; apptask::apptask
EXTRN	?Application_Status@AOAProtected@@2HA:DWORD	; AOAProtected::Application_Status
_TEXT	SEGMENT
_this$ = -8
_i$ = -4
??0apptask@@QAE@H@Z PROC NEAR				; apptask::apptask
; Line 117
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	??0AOAProtected@@QAE@XZ			; AOAProtected::AOAProtected
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	??0EtherObj@@QAE@XZ			; EtherObj::EtherObj
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 16					; 00000010H
	call	??0TCPObj@@QAE@XZ			; TCPObj::TCPObj
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 372				; 00000174H
	call	??0FTOPObj@@QAE@XZ			; FTOPObj::FTOPObj
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 388				; 00000184H
	call	??0WStack@@QAE@XZ			; WStack::WStack
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 396				; 0000018cH
	call	??0WCirList@@QAE@XZ			; WCirList::WCirList
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 404				; 00000194H
	call	??0WTTrace@@QAE@XZ			; WTTrace::WTTrace
; Line 118
	mov	DWORD PTR ?Current_Task@apptask@@2HA, 3	; apptask::Current_Task
; Line 119
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L2935
$L2936:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L2935:
	cmp	DWORD PTR _i$[ebp], 8000		; 00001f40H
	jge	SHORT $L2937
; Line 121
	mov	ecx, DWORD PTR _i$[ebp]
	mov	DWORD PTR ?Task_Status@apptask@@2PAHA[ecx*4], 0
; Line 122
	mov	edx, DWORD PTR _i$[ebp]
	mov	DWORD PTR ?TaskNextPtr@apptask@@2PAHA[edx*4], 0
; Line 123
	jmp	SHORT $L2936
$L2937:
; Line 124
	mov	DWORD PTR ?packts@apptask@@2JA, 0	; apptask::packts
; Line 125
	mov	DWORD PTR ?svalue@apptask@@2JA, 0	; apptask::svalue
; Line 126
	mov	DWORD PTR ?WSStartTaskNo@apptask@@2HA, 0 ; apptask::WSStartTaskNo
; Line 127
	mov	DWORD PTR ?WSEndTaskNo@apptask@@2HA, 0	; apptask::WSEndTaskNo
; Line 128
	mov	DWORD PTR ?WSFreeTask@apptask@@2HA, 0	; apptask::WSFreeTask
; Line 129
	mov	DWORD PTR ?Application_Status@AOAProtected@@2HA, 1 ; AOAProtected::Application_Status
; Line 130
	mov	DWORD PTR ?rcvstarttime@apptask@@2JA, 0	; apptask::rcvstarttime
; Line 131
	mov	DWORD PTR ?rcvcurtime@apptask@@2JA, 0	; apptask::rcvcurtime
; Line 132
	mov	DWORD PTR ?httpstarttime@apptask@@2JA, 0 ; apptask::httpstarttime
; Line 133
	mov	DWORD PTR ?httpcurtime@apptask@@2JA, 0	; apptask::httpcurtime
; Line 134
	mov	DWORD PTR ?totalstarttime@apptask@@2JA, 0 ; apptask::totalstarttime
; Line 135
	mov	DWORD PTR ?totalcurtime@apptask@@2JA, 0	; apptask::totalcurtime
; Line 136
	mov	DWORD PTR ?Current_Tcbrno@apptask@@2HA, -1 ; apptask::Current_Tcbrno
; Line 154
	mov	DWORD PTR ?ScheduleArray@apptask@@2PAHA, 0
; Line 155
	mov	DWORD PTR ?ScheduleArray@apptask@@2PAHA+4, 0
; Line 156
	mov	DWORD PTR ?ScheduleArray@apptask@@2PAHA+8, 7
; Line 157
	mov	DWORD PTR ?ScheduleArray@apptask@@2PAHA+12, 7
; Line 158
	mov	DWORD PTR ?ScheduleArray@apptask@@2PAHA+16, 4
; Line 159
	mov	DWORD PTR ?ScheduleArray@apptask@@2PAHA+20, 4
; Line 160
	mov	DWORD PTR ?ScheduleArray@apptask@@2PAHA+24, 4
; Line 161
	mov	DWORD PTR ?ScheduleArray@apptask@@2PAHA+28, 4
; Line 163
	mov	DWORD PTR ?MaxTaskId@apptask@@2JA, 0	; apptask::MaxTaskId
; Line 164
	mov	DWORD PTR ?MinTaskId@apptask@@2JA, 0	; apptask::MinTaskId
; Line 165
	mov	DWORD PTR ?ExitTimer@apptask@@2KA, 0	; apptask::ExitTimer
; Line 167
	mov	eax, DWORD PTR _this$[ebp]
	mov	esp, ebp
	pop	ebp
	ret	4
??0apptask@@QAE@H@Z ENDP				; apptask::apptask
_TEXT	ENDS
PUBLIC	?FTOPTimeOut@apptask@@QAEXJ@Z			; apptask::FTOPTimeOut
EXTRN	?AOAsetSharedMemTraceString@AOAProtected@@QAEXPAD@Z:NEAR ; AOAProtected::AOAsetSharedMemTraceString
EXTRN	?AOAExit@AOAProtected@@QAEXXZ:NEAR		; AOAProtected::AOAExit
EXTRN	?SendFTOP@FTOPObj@@QAEHH@Z:NEAR			; FTOPObj::SendFTOP
_DATA	SEGMENT
$SG2944	DB	' FTOPTimeOut       ', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -16
_time$ = -4
_TraceString$ = -8
_i$ = -12
?FTOPTimeOut@apptask@@QAEXJ@Z PROC NEAR			; apptask::FTOPTimeOut
; Line 172
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	mov	DWORD PTR _this$[ebp], ecx
; Line 173
	mov	DWORD PTR _time$[ebp], 150		; 00000096H
; Line 174
	mov	DWORD PTR _TraceString$[ebp], OFFSET FLAT:$SG2944
; Line 175
	mov	DWORD PTR _i$[ebp], 0
; Line 177
	mov	eax, DWORD PTR _TraceString$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMemTraceString@AOAProtected@@QAEXPAD@Z ; AOAProtected::AOAsetSharedMemTraceString
$L2947:
; Line 178
	cmp	DWORD PTR ?Application_Status@AOAProtected@@2HA, 2 ; AOAProtected::Application_Status
	je	SHORT $L2948
; Line 180
	mov	ecx, DWORD PTR ?Current_Task@apptask@@2HA ; apptask::Current_Task
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 372				; 00000174H
	call	?SendFTOP@FTOPObj@@QAEHH@Z		; FTOPObj::SendFTOP
; Line 182
	jmp	SHORT $L2947
$L2948:
; Line 183
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAExit@AOAProtected@@QAEXXZ		; AOAProtected::AOAExit
; Line 184
	mov	esp, ebp
	pop	ebp
	ret	4
?FTOPTimeOut@apptask@@QAEXJ@Z ENDP			; apptask::FTOPTimeOut
_TEXT	ENDS
PUBLIC	?HttpTask@apptask@@QAEXJ@Z			; apptask::HttpTask
PUBLIC	??0parserObj@@QAE@XZ				; parserObj::parserObj
EXTRN	?processRequest@parserObj@@QAEHHH@Z:NEAR	; parserObj::processRequest
EXTRN	?insert@WTTrace@@QAEHHG@Z:NEAR			; WTTrace::insert
EXTRN	?AOAprintHex@AOAProtected@@QAEHJH@Z:NEAR	; AOAProtected::AOAprintHex
EXTRN	?HttpCount@TCPObj@@2KA:DWORD			; TCPObj::HttpCount
EXTRN	?HttpRequests@TCPObj@@2KA:DWORD			; TCPObj::HttpRequests
EXTRN	?AOAgetTimer@AOAProtected@@QAEJXZ:NEAR		; AOAProtected::AOAgetTimer
EXTRN	?AOAPrintText@AOAProtected@@QAEXPADH@Z:NEAR	; AOAProtected::AOAPrintText
EXTRN	?setTaskID@TCPObj@@QAEHHH@Z:NEAR		; TCPObj::setTaskID
EXTRN	?getTaskID@TCPObj@@QAEHH@Z:NEAR			; TCPObj::getTaskID
EXTRN	?getAvail@TCPObj@@QAEHH@Z:NEAR			; TCPObj::getAvail
EXTRN	?storeTraceDword@TCPObj@@QAEHHHH@Z:NEAR		; TCPObj::storeTraceDword
EXTRN	??0AOATask@@QAE@XZ:NEAR				; AOATask::AOATask
EXTRN	?AOAcompleteTask@AOATask@@QAEXHH@Z:NEAR		; AOATask::AOAcompleteTask
_DATA	SEGMENT
$SG2972	DB	'Message is empty ParserObj: -1', 00H
	ORG $+1
$SG2974	DB	'Method not supported (POST, HEAD) ParserObj: -2', 00H
$SG2976	DB	'Response header does not start with ''/'' ParserObj: -3', 00H
	ORG $+2
$SG2978	DB	'Version number does not start with '' '' ParserObj: -4', 00H
	ORG $+3
$SG2980	DB	'No line break after version number ParserObj: -5', 00H
	ORG $+3
$SG2982	DB	'Version number is not 1.0 or 1.1 ParserObj: -6', 00H
	ORG $+1
$SG2984	DB	'Send flag cannot be set TCPObj: -7', 00H
	ORG $+1
$SG2986	DB	'Connection timeout TCPObj: -8', 00H
	ORG $+2
$SG2988	DB	'TCB Segment size is greater than the maximum acceptable '
	DB	'send size TCPObj: -9', 00H
	ORG $+3
$SG2990	DB	'State is not established or finwait TCPObj: -11', 00H
$SG2992	DB	'TDL pointer is out of range TCPObj: -12', 00H
$SG2994	DB	'Data buffer is out of range TCPObj: -13', 00H
$SG2996	DB	'Length of data to send is less than 1 byte IP: -24', 00H
	ORG $+1
$SG2998	DB	'Length of data to send is greater than max send size IP:'
	DB	' -25', 00H
	ORG $+3
$SG3000	DB	'TDL pointer is out of range EO: -26', 00H
$SG3002	DB	'Data buffer is out of range EO: -27', 00H
$SG3004	DB	'TCB is not available TCP: -28', 00H
	ORG $+2
$SG3006	DB	'TDL is FULL TCP:SendN: -29', 00H
	ORG $+1
$SG3008	DB	'TDL is FULL TCP:SendMisc: -30', 00H
	ORG $+2
$SG3010	DB	'Task do not match in tcb TCP:setFileParam: -31', 00H
	ORG $+1
$SG3012	DB	'Request is not GET TCP:OtherHandler: -32', 00H
	ORG $+3
$SG3014	DB	'Tcb number do not match in tcb TCP:tcpSendN: -33', 00H
	ORG $+3
$SG3016	DB	'Tcb number do not match in tcb (first suspend) TCP:tcpSe'
	DB	'ndN: -34', 00H
	ORG $+3
$SG3018	DB	'Tcb number do not match in tcb (second suspend) TCP:tcpS'
	DB	'endN: -35', 00H
	ORG $+2
$SG3020	DB	'Tcb number do not match in tcb TCP:SendN: -36', 00H
	ORG $+2
$SG3022	DB	'tcb->avail = 0 TCP:SendN: -37', 00H
	ORG $+2
$SG3024	DB	'tcb->avail = 0 TCP:tcpSendN: -38', 00H
	ORG $+3
$SG3026	DB	'tcb->avail = 0 (first suspend) TCP:SendN: -39', 00H
	ORG $+2
$SG3028	DB	'tcb->avail = 0 (second suspend) TCP:tcpSendN: -40', 00H
	ORG $+2
$SG3030	DB	'apptask:httptask tcb is used another task', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -844
_task$ = -484
_p$ = -428
_tcp$ = -840
_i$ = -436
_retcode$ = -432
?HttpTask@apptask@@QAEXJ@Z PROC NEAR			; apptask::HttpTask
; Line 190
	push	ebp
	mov	ebp, esp
	sub	esp, 848				; 00000350H
	mov	DWORD PTR _this$[ebp], ecx
; Line 191
	lea	ecx, DWORD PTR _task$[ebp]
	call	??0AOATask@@QAE@XZ			; AOATask::AOATask
; Line 192
	lea	ecx, DWORD PTR _p$[ebp]
	call	??0parserObj@@QAE@XZ			; parserObj::parserObj
; Line 193
	lea	ecx, DWORD PTR _tcp$[ebp]
	call	??0TCPObj@@QAE@XZ			; TCPObj::TCPObj
; Line 194
	mov	DWORD PTR _i$[ebp], 0
; Line 195
	mov	DWORD PTR _retcode$[ebp], 0
; Line 197
	mov	eax, 1
	test	eax, eax
	je	SHORT $L2958
; Line 198
	push	1900					; 0000076cH
	mov	ecx, DWORD PTR ?Current_Task@apptask@@2HA ; apptask::Current_Task
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
$L2958:
; Line 200
	cmp	DWORD PTR ?HttpRequests@TCPObj@@2KA, 1	; TCPObj::HttpRequests
	jne	SHORT $L2959
; Line 201
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	mov	DWORD PTR ?systemstarttime@apptask@@2JA, eax ; apptask::systemstarttime
$L2959:
; Line 203
	cmp	DWORD PTR ?Application_Status@AOAProtected@@2HA, 2 ; AOAProtected::Application_Status
	je	$L2962
; Line 205
	mov	DWORD PTR ?Current_State@apptask@@2HA, 0 ; apptask::Current_State
; Line 207
	mov	edx, DWORD PTR ?Current_Tcbrno@apptask@@2HA ; apptask::Current_Tcbrno
	push	edx
	lea	ecx, DWORD PTR _tcp$[ebp]
	call	?getTaskID@TCPObj@@QAEHH@Z		; TCPObj::getTaskID
	mov	DWORD PTR _retcode$[ebp], eax
; Line 208
	cmp	DWORD PTR _retcode$[ebp], 0
	jge	$L2963
; Line 213
	mov	eax, DWORD PTR ?Current_Task@apptask@@2HA ; apptask::Current_Task
	push	eax
	mov	ecx, DWORD PTR ?Current_Tcbrno@apptask@@2HA ; apptask::Current_Tcbrno
	push	ecx
	lea	ecx, DWORD PTR _tcp$[ebp]
	call	?setTaskID@TCPObj@@QAEHHH@Z		; TCPObj::setTaskID
; Line 215
	mov	edx, 1
	test	edx, edx
	je	SHORT $L2964
; Line 216
	push	2
	mov	eax, DWORD PTR ?Current_Task@apptask@@2HA ; apptask::Current_Task
	sub	eax, DWORD PTR ?MinTaskId@apptask@@2JA	; apptask::MinTaskId
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 404				; 00000194H
	call	?insert@WTTrace@@QAEHHG@Z		; WTTrace::insert
$L2964:
; Line 218
	mov	ecx, DWORD PTR ?Current_Task@apptask@@2HA ; apptask::Current_Task
	push	ecx
	mov	edx, DWORD PTR ?Current_Tcbrno@apptask@@2HA ; apptask::Current_Tcbrno
	push	edx
	lea	ecx, DWORD PTR _p$[ebp]
	call	?processRequest@parserObj@@QAEHHH@Z	; parserObj::processRequest
	mov	DWORD PTR _retcode$[ebp], eax
; Line 219
	mov	eax, 1
	test	eax, eax
	je	SHORT $L2965
; Line 220
	push	9
	mov	ecx, DWORD PTR ?Current_Tcbrno@apptask@@2HA ; apptask::Current_Tcbrno
	push	ecx
	mov	edx, DWORD PTR _retcode$[ebp]
	push	edx
	lea	ecx, DWORD PTR _tcp$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
$L2965:
; Line 222
	mov	eax, 1
	test	eax, eax
	je	SHORT $L2966
; Line 224
	push	1800					; 00000708H
	mov	ecx, DWORD PTR _retcode$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 225
	push	1900					; 0000076cH
	mov	edx, DWORD PTR ?Current_Task@apptask@@2HA ; apptask::Current_Task
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
$L2966:
; Line 229
	mov	eax, DWORD PTR _retcode$[ebp]
	mov	DWORD PTR -848+[ebp], eax
	mov	ecx, DWORD PTR -848+[ebp]
	add	ecx, 40					; 00000028H
	mov	DWORD PTR -848+[ebp], ecx
	cmp	DWORD PTR -848+[ebp], 39		; 00000027H
	ja	$L2968
	mov	edx, DWORD PTR -848+[ebp]
	jmp	DWORD PTR $L3609[edx*4]
$L2971:
; Line 231
	push	3686					; 00000e66H
	push	OFFSET FLAT:$SG2972
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 232
	jmp	$L2968
$L2973:
; Line 234
	push	3686					; 00000e66H
	push	OFFSET FLAT:$SG2974
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 235
	jmp	$L2968
$L2975:
; Line 237
	push	3686					; 00000e66H
	push	OFFSET FLAT:$SG2976
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 238
	jmp	$L2968
$L2977:
; Line 240
	push	3686					; 00000e66H
	push	OFFSET FLAT:$SG2978
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 241
	jmp	$L2968
$L2979:
; Line 243
	push	3686					; 00000e66H
	push	OFFSET FLAT:$SG2980
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 244
	jmp	$L2968
$L2981:
; Line 246
	push	3686					; 00000e66H
	push	OFFSET FLAT:$SG2982
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 247
	jmp	$L2968
$L2983:
; Line 249
	push	3686					; 00000e66H
	push	OFFSET FLAT:$SG2984
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 250
	jmp	$L2968
$L2985:
; Line 252
	push	3686					; 00000e66H
	push	OFFSET FLAT:$SG2986
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 253
	jmp	$L2968
$L2987:
; Line 256
	push	3686					; 00000e66H
	push	OFFSET FLAT:$SG2988
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 257
	jmp	$L2968
$L2989:
; Line 259
	push	3686					; 00000e66H
	push	OFFSET FLAT:$SG2990
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 260
	jmp	$L2968
$L2991:
; Line 262
	push	3686					; 00000e66H
	push	OFFSET FLAT:$SG2992
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 263
	jmp	$L2968
$L2993:
; Line 265
	push	3686					; 00000e66H
	push	OFFSET FLAT:$SG2994
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 266
	jmp	$L2968
$L2995:
; Line 268
	push	3686					; 00000e66H
	push	OFFSET FLAT:$SG2996
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 269
	jmp	$L2968
$L2997:
; Line 271
	push	3686					; 00000e66H
	push	OFFSET FLAT:$SG2998
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 272
	jmp	$L2968
$L2999:
; Line 274
	push	3686					; 00000e66H
	push	OFFSET FLAT:$SG3000
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 275
	jmp	$L2968
$L3001:
; Line 277
	push	3686					; 00000e66H
	push	OFFSET FLAT:$SG3002
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 278
	jmp	$L2968
$L3003:
; Line 280
	push	3686					; 00000e66H
	push	OFFSET FLAT:$SG3004
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 281
	jmp	$L2968
$L3005:
; Line 283
	push	3686					; 00000e66H
	push	OFFSET FLAT:$SG3006
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 284
	jmp	$L2968
$L3007:
; Line 286
	push	3686					; 00000e66H
	push	OFFSET FLAT:$SG3008
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 287
	jmp	$L2968
$L3009:
; Line 289
	push	3686					; 00000e66H
	push	OFFSET FLAT:$SG3010
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 290
	jmp	$L2968
$L3011:
; Line 292
	push	3686					; 00000e66H
	push	OFFSET FLAT:$SG3012
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 293
	jmp	$L2968
$L3013:
; Line 295
	push	160					; 000000a0H
	push	OFFSET FLAT:$SG3014
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 296
	jmp	$L2968
$L3015:
; Line 298
	push	320					; 00000140H
	push	OFFSET FLAT:$SG3016
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 299
	jmp	$L2968
$L3017:
; Line 301
	push	480					; 000001e0H
	push	OFFSET FLAT:$SG3018
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 302
	jmp	$L2968
$L3019:
; Line 304
	push	640					; 00000280H
	push	OFFSET FLAT:$SG3020
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 305
	jmp	$L2968
$L3021:
; Line 307
	push	3540					; 00000dd4H
	push	OFFSET FLAT:$SG3022
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 308
	jmp	SHORT $L2968
$L3023:
; Line 310
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG3024
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 311
	jmp	SHORT $L2968
$L3025:
; Line 313
	push	1120					; 00000460H
	push	OFFSET FLAT:$SG3026
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 314
	push	1260					; 000004ecH
	mov	eax, DWORD PTR ?Current_Task@apptask@@2HA ; apptask::Current_Task
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 315
	jmp	SHORT $L2968
$L3027:
; Line 317
	push	1280					; 00000500H
	push	OFFSET FLAT:$SG3028
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 318
	push	1420					; 0000058cH
	mov	ecx, DWORD PTR ?Current_Task@apptask@@2HA ; apptask::Current_Task
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
$L2968:
; Line 322
	jmp	SHORT $L3029
$L2963:
; Line 324
	push	3380					; 00000d34H
	push	OFFSET FLAT:$SG3030
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 325
	push	3480					; 00000d98H
	mov	edx, DWORD PTR _retcode$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 326
	mov	DWORD PTR ?Application_Status@AOAProtected@@2HA, 2 ; AOAProtected::Application_Status
; Line 327
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAExit@AOAProtected@@QAEXXZ		; AOAProtected::AOAExit
$L3029:
; Line 332
	mov	eax, DWORD PTR ?Current_Tcbrno@apptask@@2HA ; apptask::Current_Tcbrno
	push	eax
	lea	ecx, DWORD PTR _tcp$[ebp]
	call	?getAvail@TCPObj@@QAEHH@Z		; TCPObj::getAvail
	mov	DWORD PTR _retcode$[ebp], eax
; Line 334
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L3032
; Line 336
	mov	ecx, DWORD PTR ?Current_Tcbrno@apptask@@2HA ; apptask::Current_Tcbrno
	push	ecx
	lea	ecx, DWORD PTR _tcp$[ebp]
	call	?getTaskID@TCPObj@@QAEHH@Z		; TCPObj::getTaskID
	mov	DWORD PTR _retcode$[ebp], eax
$L3032:
; Line 356
	mov	eax, DWORD PTR ?HttpCount@TCPObj@@2KA	; TCPObj::HttpCount
	sub	eax, 1
	mov	DWORD PTR ?HttpCount@TCPObj@@2KA, eax	; TCPObj::HttpCount
; Line 358
	mov	ecx, 1
	test	ecx, ecx
	je	SHORT $L3033
; Line 359
	push	1820					; 0000071cH
	mov	edx, DWORD PTR ?HttpCount@TCPObj@@2KA	; TCPObj::HttpCount
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
$L3033:
; Line 361
	mov	eax, 1
	test	eax, eax
	je	SHORT $L3034
; Line 362
	push	1840					; 00000730H
	mov	ecx, DWORD PTR ?HttpRequests@TCPObj@@2KA ; TCPObj::HttpRequests
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
$L3034:
; Line 363
	mov	edx, 1
	test	edx, edx
	je	SHORT $L3035
; Line 364
	push	128					; 00000080H
	mov	eax, DWORD PTR ?Current_Task@apptask@@2HA ; apptask::Current_Task
	sub	eax, DWORD PTR ?MinTaskId@apptask@@2JA	; apptask::MinTaskId
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 404				; 00000194H
	call	?insert@WTTrace@@QAEHHG@Z		; WTTrace::insert
$L3035:
; Line 365
	mov	ecx, DWORD PTR ?Current_State@apptask@@2HA ; apptask::Current_State
	push	ecx
	mov	edx, DWORD PTR ?Current_Task@apptask@@2HA ; apptask::Current_Task
	push	edx
	lea	ecx, DWORD PTR _task$[ebp]
	call	?AOAcompleteTask@AOATask@@QAEXHH@Z	; AOATask::AOAcompleteTask
; Line 366
	jmp	$L2959
$L2962:
; Line 367
	mov	esp, ebp
	pop	ebp
	ret	4
$L3609:
	DD	$L3027
	DD	$L3025
	DD	$L3023
	DD	$L3021
	DD	$L3019
	DD	$L3017
	DD	$L3015
	DD	$L3013
	DD	$L3011
	DD	$L3009
	DD	$L3007
	DD	$L3005
	DD	$L3003
	DD	$L3001
	DD	$L2999
	DD	$L2997
	DD	$L2995
	DD	$L2968
	DD	$L2968
	DD	$L2968
	DD	$L2968
	DD	$L2968
	DD	$L2968
	DD	$L2968
	DD	$L2968
	DD	$L2968
	DD	$L2968
	DD	$L2993
	DD	$L2991
	DD	$L2989
	DD	$L2968
	DD	$L2987
	DD	$L2985
	DD	$L2983
	DD	$L2981
	DD	$L2979
	DD	$L2977
	DD	$L2975
	DD	$L2973
	DD	$L2971
?HttpTask@apptask@@QAEXJ@Z ENDP				; apptask::HttpTask
_TEXT	ENDS
;	COMDAT ??0parserObj@@QAE@XZ
_TEXT	SEGMENT
_this$ = -4
??0parserObj@@QAE@XZ PROC NEAR				; parserObj::parserObj, COMDAT
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	??0AOAProtected@@QAE@XZ			; AOAProtected::AOAProtected
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	??0apptask@@QAE@XZ			; apptask::apptask
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 420				; 000001a4H
	call	??0WList@@QAE@XZ			; WList::WList
	mov	eax, DWORD PTR _this$[ebp]
	mov	esp, ebp
	pop	ebp
	ret	0
??0parserObj@@QAE@XZ ENDP				; parserObj::parserObj
_TEXT	ENDS
PUBLIC	?FileTransferTask@apptask@@QAEXJ@Z		; apptask::FileTransferTask
PUBLIC	??0FTPObj@@QAE@XZ				; FTPObj::FTPObj
EXTRN	?IP@FTPObj@@2PADA:DWORD				; FTPObj::IP
EXTRN	?port@FTPObj@@2GA:WORD				; FTPObj::port
EXTRN	?StartTransfer@FTPObj@@QAEHPADGH@Z:NEAR		; FTPObj::StartTransfer
EXTRN	?setMode@FTOPObj@@QAEXH@Z:NEAR			; FTOPObj::setMode
EXTRN	?AOAsuspendTask@AOATask@@QAEXXZ:NEAR		; AOATask::AOAsuspendTask
_DATA	SEGMENT
	ORG $+2
$SG3046	DB	'FileTransferTask:', 00H
	ORG $+2
$SG3050	DB	'Left while loop FileTransferTask', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -380
_ftp$ = -328
_task$ = -376
_i$ = -8
_retcode$ = -4
?FileTransferTask@apptask@@QAEXJ@Z PROC NEAR		; apptask::FileTransferTask
; Line 372
	push	ebp
	mov	ebp, esp
	sub	esp, 380				; 0000017cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 373
	lea	ecx, DWORD PTR _ftp$[ebp]
	call	??0FTPObj@@QAE@XZ			; FTPObj::FTPObj
; Line 374
	lea	ecx, DWORD PTR _task$[ebp]
	call	??0AOATask@@QAE@XZ			; AOATask::AOATask
; Line 375
	mov	DWORD PTR _i$[ebp], 0
; Line 376
	mov	DWORD PTR _retcode$[ebp], 0
; Line 379
	push	1920					; 00000780H
	push	OFFSET FLAT:$SG3046
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 380
	push	2060					; 0000080cH
	mov	eax, DWORD PTR ?Current_Task@apptask@@2HA ; apptask::Current_Task
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 383
	push	1
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 372				; 00000174H
	call	?setMode@FTOPObj@@QAEXH@Z		; FTOPObj::setMode
; Line 384
	push	0
	mov	cx, WORD PTR ?port@FTPObj@@2GA		; FTPObj::port
	push	ecx
	push	OFFSET FLAT:?IP@FTPObj@@2PADA		; FTPObj::IP
	lea	ecx, DWORD PTR _ftp$[ebp]
	call	?StartTransfer@FTPObj@@QAEHPADGH@Z	; FTPObj::StartTransfer
	mov	DWORD PTR _retcode$[ebp], eax
$L3048:
; Line 386
	cmp	DWORD PTR ?Application_Status@AOAProtected@@2HA, 2 ; AOAProtected::Application_Status
	je	SHORT $L3049
; Line 388
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
; Line 389
	push	2040					; 000007f8H
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 390
	lea	ecx, DWORD PTR _task$[ebp]
	call	?AOAsuspendTask@AOATask@@QAEXXZ		; AOATask::AOAsuspendTask
; Line 391
	jmp	SHORT $L3048
$L3049:
; Line 393
	push	3260					; 00000cbcH
	push	OFFSET FLAT:$SG3050
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 395
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAExit@AOAProtected@@QAEXXZ		; AOAProtected::AOAExit
; Line 396
	mov	esp, ebp
	pop	ebp
	ret	4
?FileTransferTask@apptask@@QAEXJ@Z ENDP			; apptask::FileTransferTask
_TEXT	ENDS
PUBLIC	??0UDPObj@@QAE@XZ				; UDPObj::UDPObj
;	COMDAT ??0FTPObj@@QAE@XZ
_TEXT	SEGMENT
_this$ = -4
??0FTPObj@@QAE@XZ PROC NEAR				; FTPObj::FTPObj, COMDAT
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	??0AOAProtected@@QAE@XZ			; AOAProtected::AOAProtected
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 12					; 0000000cH
	call	??0UDPObj@@QAE@XZ			; UDPObj::UDPObj
	mov	eax, DWORD PTR _this$[ebp]
	mov	esp, ebp
	pop	ebp
	ret	0
??0FTPObj@@QAE@XZ ENDP					; FTPObj::FTPObj
_TEXT	ENDS
;	COMDAT ??0UDPObj@@QAE@XZ
_TEXT	SEGMENT
_this$ = -4
??0UDPObj@@QAE@XZ PROC NEAR				; UDPObj::UDPObj, COMDAT
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	??0IPObj@@QAE@XZ			; IPObj::IPObj
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 20					; 00000014H
	call	??0ARPObj@@QAE@XZ			; ARPObj::ARPObj
	mov	eax, DWORD PTR _this$[ebp]
	mov	esp, ebp
	pop	ebp
	ret	0
??0UDPObj@@QAE@XZ ENDP					; UDPObj::UDPObj
_TEXT	ENDS
PUBLIC	?InterfaceTask@apptask@@QAEXJ@Z			; apptask::InterfaceTask
EXTRN	?AOAgetCharacterBuff@AOAProtected@@QAEDXZ:NEAR	; AOAProtected::AOAgetCharacterBuff
_DATA	SEGMENT
	ORG $+3
$SG3063	DB	'InterfaceTask:', 00H
	ORG $+1
$SG3068	DB	'GUIT Done', 00H
	ORG $+2
$SG3070	DB	'Left while loop InterfaceTask', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -64
_task$ = -60
_i$ = -12
_retcode$ = -8
_a$ = -4
?InterfaceTask@apptask@@QAEXJ@Z PROC NEAR		; apptask::InterfaceTask
; Line 402
	push	ebp
	mov	ebp, esp
	sub	esp, 64					; 00000040H
	mov	DWORD PTR _this$[ebp], ecx
; Line 403
	lea	ecx, DWORD PTR _task$[ebp]
	call	??0AOATask@@QAE@XZ			; AOATask::AOATask
; Line 404
	mov	DWORD PTR _i$[ebp], 0
; Line 405
	mov	DWORD PTR _retcode$[ebp], 0
; Line 406
	mov	BYTE PTR _a$[ebp], 78			; 0000004eH
; Line 408
	push	2080					; 00000820H
	push	OFFSET FLAT:$SG3063
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 409
	push	2220					; 000008acH
	mov	eax, DWORD PTR ?Current_Task@apptask@@2HA ; apptask::Current_Task
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
$L3065:
; Line 411
	cmp	DWORD PTR ?Application_Status@AOAProtected@@2HA, 2 ; AOAProtected::Application_Status
	je	SHORT $L3066
; Line 413
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacterBuff@AOAProtected@@QAEDXZ ; AOAProtected::AOAgetCharacterBuff
	mov	BYTE PTR _a$[ebp], al
; Line 414
	movsx	ecx, BYTE PTR _a$[ebp]
	cmp	ecx, 101				; 00000065H
	jne	SHORT $L3067
; Line 416
	mov	DWORD PTR ?Application_Status@AOAProtected@@2HA, 2 ; AOAProtected::Application_Status
; Line 417
	push	3300					; 00000ce4H
	push	OFFSET FLAT:$SG3068
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 418
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAExit@AOAProtected@@QAEXXZ		; AOAProtected::AOAExit
$L3067:
; Line 420
	mov	edx, 1
	test	edx, edx
	je	SHORT $L3069
; Line 421
	push	2200					; 00000898H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
$L3069:
; Line 422
	lea	ecx, DWORD PTR _task$[ebp]
	call	?AOAsuspendTask@AOATask@@QAEXXZ		; AOATask::AOAsuspendTask
; Line 423
	jmp	SHORT $L3065
$L3066:
; Line 425
	push	3260					; 00000cbcH
	push	OFFSET FLAT:$SG3070
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 426
	mov	DWORD PTR ?Application_Status@AOAProtected@@2HA, 2 ; AOAProtected::Application_Status
; Line 428
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAExit@AOAProtected@@QAEXXZ		; AOAProtected::AOAExit
; Line 429
	mov	esp, ebp
	pop	ebp
	ret	4
?InterfaceTask@apptask@@QAEXJ@Z ENDP			; apptask::InterfaceTask
_TEXT	ENDS
PUBLIC	?MainTask@apptask@@QAEXJ@Z			; apptask::MainTask
PUBLIC	?createOtherTasks@apptask@@QAEXXZ		; apptask::createOtherTasks
PUBLIC	?Scheduler_Algorithm_1@apptask@@QAEHXZ		; apptask::Scheduler_Algorithm_1
PUBLIC	?printScreenLayout@apptask@@QAEXXZ		; apptask::printScreenLayout
PUBLIC	?printScreenTags@apptask@@QAEXXZ		; apptask::printScreenTags
EXTRN	?IncSendOutPtr@EtherObj@@QAEHXZ:NEAR		; EtherObj::IncSendOutPtr
EXTRN	?resolveFlagForFileTransfer@ARPObj@@2HA:DWORD	; ARPObj::resolveFlagForFileTransfer
EXTRN	?ARPBroadcast@ARPObj@@QAEHPAD00@Z:NEAR		; ARPObj::ARPBroadcast
EXTRN	?fileTransferFinished@FTPObj@@2HA:DWORD		; FTPObj::fileTransferFinished
EXTRN	?getFile@FTPObj@@QAEHPADPAK1@Z:NEAR		; FTPObj::getFile
EXTRN	?RunRegister@AOAProtected@@2JA:DWORD		; AOAProtected::RunRegister
EXTRN	?AOAgetSharedMem@AOAProtected@@QAEJH@Z:NEAR	; AOAProtected::AOAgetSharedMem
EXTRN	?MaxNoOfTasksUsed@TCPObj@@2KA:DWORD		; TCPObj::MaxNoOfTasksUsed
EXTRN	?MaxNoOfTCBsUsed@TCPObj@@2KA:DWORD		; TCPObj::MaxNoOfTCBsUsed
EXTRN	?NoOfResets@TCPObj@@2HA:DWORD			; TCPObj::NoOfResets
EXTRN	?TotalDelCount@TCPObj@@2KA:DWORD		; TCPObj::TotalDelCount
EXTRN	?trace1Count@TCPObj@@2JA:DWORD			; TCPObj::trace1Count
EXTRN	?trace2Count@TCPObj@@2JA:DWORD			; TCPObj::trace2Count
EXTRN	?getSuspendFlag@TCPObj@@QAEHH@Z:NEAR		; TCPObj::getSuspendFlag
EXTRN	?getResumeFlag@TCPObj@@QAEHH@Z:NEAR		; TCPObj::getResumeFlag
EXTRN	?getResetFlag@TCPObj@@QAEHH@Z:NEAR		; TCPObj::getResetFlag
EXTRN	?resetResumeFlag@TCPObj@@QAEHH@Z:NEAR		; TCPObj::resetResumeFlag
EXTRN	?getHttpCount@TCPObj@@QAEHXZ:NEAR		; TCPObj::getHttpCount
EXTRN	?DeleteTCB@TCPObj@@QAEHHH@Z:NEAR		; TCPObj::DeleteTCB
EXTRN	?AOAShortDelay@AOAProtected@@QAEHJ@Z:NEAR	; AOAProtected::AOAShortDelay
EXTRN	?AOAackPICCntlr@AOAProtected@@QAEHH@Z:NEAR	; AOAProtected::AOAackPICCntlr
EXTRN	?AOAMaskRunRegister@AOAProtected@@QAEHHH@Z:NEAR	; AOAProtected::AOAMaskRunRegister
EXTRN	?insert@WCirList@@QAEHJJJHJ@Z:NEAR		; WCirList::insert
EXTRN	?get@WCirList@@QAEHPAJPAI0PAH0@Z:NEAR		; WCirList::get
EXTRN	?empty@WCirList@@QAEHXZ:NEAR			; WCirList::empty
EXTRN	?full@WCirList@@QAEHXZ:NEAR			; WCirList::full
EXTRN	?getCount@WCirList@@QAEHXZ:NEAR			; WCirList::getCount
EXTRN	?ReceiveInPtr@EtherObj@@2JA:DWORD		; EtherObj::ReceiveInPtr
EXTRN	?ReceiveOutPtr@EtherObj@@2JA:DWORD		; EtherObj::ReceiveOutPtr
EXTRN	?SendInPtr@EtherObj@@2JA:DWORD			; EtherObj::SendInPtr
EXTRN	?SendOutPtr@EtherObj@@2JA:DWORD			; EtherObj::SendOutPtr
EXTRN	?TotalDataSent@EtherObj@@2JA:DWORD		; EtherObj::TotalDataSent
EXTRN	?AOAapplink32@AOATask@@QAEHXZ:NEAR		; AOATask::AOAapplink32
EXTRN	?AOArunTask@AOATask@@QAEHH@Z:NEAR		; AOATask::AOArunTask
EXTRN	?isRDescDone@EtherObj@@QAEHH@Z:NEAR		; EtherObj::isRDescDone
_DATA	SEGMENT
	ORG $+2
$SG3137	DB	'FTC', 00H
$SG3138	DB	'debugxx.html', 00H
	ORG $+3
$SG3144	DB	'MAIN:', 00H
	ORG $+2
$SG3145	DB	'runTsk', 00H
	ORG $+1
$SG3146	DB	'CirCnt', 00H
	ORG $+1
$SG3147	DB	'resCnt', 00H
	ORG $+1
$SG3148	DB	'delCnt', 00H
	ORG $+1
$SG3149	DB	'State', 00H
	ORG $+2
$SG3155	DB	'THTTP', 00H
	ORG $+2
$SG3156	DB	'TOTDATRCV', 00H
	ORG $+2
$SG3157	DB	'TOTDATSND', 00H
	ORG $+2
$SG3158	DB	'TOTTICKS', 00H
	ORG $+3
$SG3159	DB	'RCVTICS', 00H
$SG3160	DB	'HTTPTICS', 00H
	ORG $+3
$SG3176	DB	'apptask:MainTask circular list is empty', 00H
$SG3185	DB	'apptask:MainTask circular list is full', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -1204
_task$ = -488
_EO$ = -88
_arp$ = -1200
_ftp$ = -432
_tcp$ = -868
_retcode$ = -32
_ticks$ = -8
_n$ = -896
_i$ = -112
_j$ = -440
_taskid$ = -880
_delay100$ = -80
_statec$ = -912
_timerc$ = -512
_httpMax$ = -60
_tcbrnoc$ = -908
_ch$ = -436
_disfavor$ = -28
_temp$ = -92
_currenttime$ = -56
_idFound$ = -904
_tpktssentNIC$ = -68
_tpktssentAPP$ = -108
_priorcount$ = -4
_k$ = -508
_noOfElements$ = -64
_counter$ = -876
_httpflag$ = -104
_rcvflag$ = -872
_dpdstatus$ = -24
_prevTask$ = -20
_prevTaskID$ = -100
_rcvcount$ = -504
_avgRTT1$ = -72
_avgRTT2$ = -96
_loopcount$ = -888
_ttrace$ = -52
_resulth$ = -76
_resultl$ = -500
_result1h$ = -884
_result1l$ = -48
_t1starthigh$ = -44
_t1startlow$ = -40
_t2starthigh$ = -36
_t2startlow$ = -16
_httpfile$ = -900
_httpfsize$ = -496
_httpptr$ = -492
_httpptr1$ = -12
?MainTask@apptask@@QAEXJ@Z PROC NEAR			; apptask::MainTask
; Line 441
	push	ebp
	mov	ebp, esp
	sub	esp, 1204				; 000004b4H
	mov	DWORD PTR _this$[ebp], ecx
; Line 442
	lea	ecx, DWORD PTR _task$[ebp]
	call	??0AOATask@@QAE@XZ			; AOATask::AOATask
; Line 443
	lea	ecx, DWORD PTR _EO$[ebp]
	call	??0EtherObj@@QAE@XZ			; EtherObj::EtherObj
; Line 444
	lea	ecx, DWORD PTR _arp$[ebp]
	call	??0ARPObj@@QAE@XZ			; ARPObj::ARPObj
; Line 445
	lea	ecx, DWORD PTR _ftp$[ebp]
	call	??0FTPObj@@QAE@XZ			; FTPObj::FTPObj
; Line 446
	lea	ecx, DWORD PTR _tcp$[ebp]
	call	??0TCPObj@@QAE@XZ			; TCPObj::TCPObj
; Line 448
	mov	DWORD PTR _retcode$[ebp], 0
; Line 449
	mov	DWORD PTR _ticks$[ebp], 0
; Line 450
	mov	DWORD PTR _n$[ebp], 0
; Line 451
	mov	DWORD PTR _i$[ebp], 0
	mov	DWORD PTR _j$[ebp], 0
; Line 457
	mov	DWORD PTR _httpMax$[ebp], 0
; Line 458
	mov	DWORD PTR _tcbrnoc$[ebp], -1
; Line 459
	mov	BYTE PTR _ch$[ebp], 32			; 00000020H
; Line 460
	mov	DWORD PTR _disfavor$[ebp], 0
; Line 461
	mov	DWORD PTR _temp$[ebp], 0
; Line 462
	mov	DWORD PTR _currenttime$[ebp], 0
; Line 463
	mov	DWORD PTR _idFound$[ebp], 0
; Line 464
	mov	DWORD PTR _tpktssentNIC$[ebp], 0
; Line 465
	mov	DWORD PTR _tpktssentAPP$[ebp], 0
; Line 466
	mov	DWORD PTR _priorcount$[ebp], 0
; Line 467
	mov	DWORD PTR _k$[ebp], 0
; Line 468
	mov	DWORD PTR _noOfElements$[ebp], 0
; Line 469
	mov	DWORD PTR _counter$[ebp], 0
; Line 470
	mov	DWORD PTR _httpflag$[ebp], 0
; Line 471
	mov	DWORD PTR _rcvflag$[ebp], 0
; Line 472
	mov	DWORD PTR _dpdstatus$[ebp], 0
; Line 473
	mov	DWORD PTR _prevTask$[ebp], 0
; Line 474
	mov	DWORD PTR _prevTaskID$[ebp], 0
; Line 475
	mov	DWORD PTR _rcvcount$[ebp], 0
; Line 476
	mov	DWORD PTR _avgRTT1$[ebp], 0
; Line 477
	mov	DWORD PTR _avgRTT2$[ebp], 0
; Line 478
	mov	DWORD PTR _loopcount$[ebp], 0
; Line 479
	mov	WORD PTR _ttrace$[ebp], 0
; Line 480
	mov	DWORD PTR _resulth$[ebp], 0
; Line 481
	mov	DWORD PTR _resultl$[ebp], 0
; Line 482
	mov	DWORD PTR _result1h$[ebp], 0
; Line 483
	mov	DWORD PTR _result1l$[ebp], 0
; Line 484
	mov	DWORD PTR _t1starthigh$[ebp], 0
; Line 485
	mov	DWORD PTR _t1startlow$[ebp], 0
; Line 486
	mov	DWORD PTR _t2starthigh$[ebp], 0
; Line 487
	mov	DWORD PTR _t2startlow$[ebp], 0
; Line 492
	mov	DWORD PTR ?taskDeletes@apptask@@2HA, 0	; apptask::taskDeletes
; Line 493
	mov	DWORD PTR ?cvalue@apptask@@2JA, 0	; apptask::cvalue
; Line 501
	mov	DWORD PTR _n$[ebp], 4
; Line 502
	mov	DWORD PTR ?iddlecount@apptask@@2JA, 0	; apptask::iddlecount
; Line 503
	push	1
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAackPICCntlr@AOAProtected@@QAEHH@Z	; AOAProtected::AOAackPICCntlr
; Line 504
	push	2
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAackPICCntlr@AOAProtected@@QAEHH@Z	; AOAProtected::AOAackPICCntlr
; Line 506
	mov	ecx, DWORD PTR _this$[ebp]
	call	?createOtherTasks@apptask@@QAEXXZ	; apptask::createOtherTasks
; Line 508
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L3125
$L3126:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L3125:
	cmp	DWORD PTR _i$[ebp], 5
	jge	SHORT $L3127
; Line 510
	push	OFFSET FLAT:?SrcMAC@apptask@@2PADA	; apptask::SrcMAC
	push	OFFSET FLAT:?SrcIP@apptask@@2PADA	; apptask::SrcIP
	push	OFFSET FLAT:?GateWayIP@apptask@@2PADA	; apptask::GateWayIP
	lea	ecx, DWORD PTR _arp$[ebp]
	call	?ARPBroadcast@ARPObj@@QAEHPAD00@Z	; ARPObj::ARPBroadcast
	mov	DWORD PTR _retcode$[ebp], eax
; Line 511
	push	OFFSET FLAT:?SrcMAC@apptask@@2PADA	; apptask::SrcMAC
	push	OFFSET FLAT:?SrcIP@apptask@@2PADA	; apptask::SrcIP
	push	OFFSET FLAT:?FTPServerIP@apptask@@2PADA	; apptask::FTPServerIP
	lea	ecx, DWORD PTR _arp$[ebp]
	call	?ARPBroadcast@ARPObj@@QAEHPAD00@Z	; ARPObj::ARPBroadcast
	mov	DWORD PTR _retcode$[ebp], eax
; Line 512
	push	100000					; 000186a0H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAShortDelay@AOAProtected@@QAEHJ@Z	; AOAProtected::AOAShortDelay
; Line 513
	jmp	SHORT $L3126
$L3127:
; Line 516
	mov	ecx, 1
	test	ecx, ecx
	je	$L3130
; Line 518
	push	1620					; 00000654H
	mov	edx, DWORD PTR _n$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 519
	lea	ecx, DWORD PTR _EO$[ebp]
	call	?IncSendOutPtr@EtherObj@@QAEHXZ		; EtherObj::IncSendOutPtr
	mov	DWORD PTR _retcode$[ebp], eax
; Line 521
	cmp	DWORD PTR _n$[ebp], 4
	jne	SHORT $L3131
	cmp	DWORD PTR ?resolveFlagForFileTransfer@ARPObj@@2HA, 0 ; ARPObj::resolveFlagForFileTransfer
	jne	SHORT $L3131
; Line 523
	mov	DWORD PTR _n$[ebp], 6
; Line 525
	jmp	SHORT $L3135
$L3131:
	cmp	DWORD PTR _n$[ebp], 4
	jne	SHORT $L3133
	cmp	DWORD PTR ?resolveFlagForFileTransfer@ARPObj@@2HA, 1 ; ARPObj::resolveFlagForFileTransfer
	jne	SHORT $L3133
; Line 527
	mov	DWORD PTR _n$[ebp], 4
; Line 529
	jmp	SHORT $L3135
$L3133:
	cmp	DWORD PTR _n$[ebp], 6
	jne	SHORT $L3135
; Line 531
	mov	DWORD PTR _n$[ebp], 4
$L3135:
; Line 534
	mov	eax, DWORD PTR _n$[ebp]
	mov	DWORD PTR ?Current_Task@apptask@@2HA, eax ; apptask::Current_Task
; Line 536
	mov	ecx, DWORD PTR _n$[ebp]
	push	ecx
	lea	ecx, DWORD PTR _task$[ebp]
	call	?AOArunTask@AOATask@@QAEHH@Z		; AOATask::AOArunTask
; Line 538
	cmp	DWORD PTR ?fileTransferFinished@FTPObj@@2HA, 1 ; FTPObj::fileTransferFinished
	jne	SHORT $L3136
; Line 540
	mov	DWORD PTR ?upCompleteNotSetCount@apptask@@2JA, 0 ; apptask::upCompleteNotSetCount
; Line 541
	push	326					; 00000146H
	push	OFFSET FLAT:$SG3137
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 543
	push	164					; 000000a4H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetSharedMem@AOAProtected@@QAEJH@Z	; AOAProtected::AOAgetSharedMem
	mov	DWORD PTR _retcode$[ebp], eax
; Line 544
	mov	edx, DWORD PTR _retcode$[ebp]
	mov	DWORD PTR _priorcount$[ebp], edx
; Line 545
	jmp	SHORT $L3130
$L3136:
; Line 547
	jmp	$L3127
$L3130:
; Line 552
	lea	eax, DWORD PTR _httpfsize$[ebp]
	push	eax
	lea	ecx, DWORD PTR _httpfile$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG3138
	lea	ecx, DWORD PTR _ftp$[ebp]
	call	?getFile@FTPObj@@QAEHPADPAK1@Z		; FTPObj::getFile
	mov	DWORD PTR _retcode$[ebp], eax
; Line 553
	mov	DWORD PTR _httpptr$[ebp], 208601088	; 0c6f0000H
; Line 554
	mov	edx, DWORD PTR _httpfile$[ebp]
	mov	DWORD PTR _httpptr1$[ebp], edx
; Line 555
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L3141
$L3142:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L3141:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _httpfsize$[ebp]
	jae	SHORT $L3143
; Line 556
	mov	edx, DWORD PTR _httpptr$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _httpptr1$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	mov	cl, BYTE PTR [eax]
	mov	BYTE PTR [edx], cl
	jmp	SHORT $L3142
$L3143:
; Line 559
	push	0
	push	4
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAMaskRunRegister@AOAProtected@@QAEHHH@Z ; AOAProtected::AOAMaskRunRegister
; Line 560
	push	0
	push	7
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAMaskRunRegister@AOAProtected@@QAEHHH@Z ; AOAProtected::AOAMaskRunRegister
; Line 561
	push	0
	push	5
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAMaskRunRegister@AOAProtected@@QAEHHH@Z ; AOAProtected::AOAMaskRunRegister
; Line 563
	mov	ecx, DWORD PTR _this$[ebp]
	call	?printScreenLayout@apptask@@QAEXXZ	; apptask::printScreenLayout
; Line 564
	mov	ecx, DWORD PTR _this$[ebp]
	call	?printScreenTags@apptask@@QAEXXZ	; apptask::printScreenTags
; Line 565
	push	1446					; 000005a6H
	push	OFFSET FLAT:$SG3144
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 566
	push	1300					; 00000514H
	push	OFFSET FLAT:$SG3145
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 567
	push	1320					; 00000528H
	push	OFFSET FLAT:$SG3146
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 568
	push	1340					; 0000053cH
	push	OFFSET FLAT:$SG3147
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 569
	push	1360					; 00000550H
	push	OFFSET FLAT:$SG3148
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 570
	push	1380					; 00000564H
	push	OFFSET FLAT:$SG3149
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 573
	mov	DWORD PTR _k$[ebp], 0
; Line 574
	mov	DWORD PTR ?totalcurtime@apptask@@2JA, 0	; apptask::totalcurtime
; Line 575
	mov	DWORD PTR ?rcvcurtime@apptask@@2JA, 0	; apptask::rcvcurtime
; Line 576
	mov	DWORD PTR ?httpcurtime@apptask@@2JA, 0	; apptask::httpcurtime
; Line 577
	mov	DWORD PTR _rcvcount$[ebp], 0
; Line 578
	mov	DWORD PTR _loopcount$[ebp], 0
; Line 580
	mov	DWORD PTR ?trace1Count@TCPObj@@2JA, 0	; TCPObj::trace1Count
; Line 581
	mov	DWORD PTR ?runFlag@apptask@@2HA, 0	; apptask::runFlag
; Line 582
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	mov	DWORD PTR ?arptimer@apptask@@2HA, eax	; apptask::arptimer
$L3151:
; Line 584
	cmp	DWORD PTR ?Application_Status@AOAProtected@@2HA, 2 ; AOAProtected::Application_Status
	je	$L3152
; Line 586
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	sub	eax, DWORD PTR ?arptimer@apptask@@2HA	; apptask::arptimer
	cmp	eax, 30000				; 00007530H
	jle	SHORT $L3153
; Line 589
	push	OFFSET FLAT:?SrcMAC@apptask@@2PADA	; apptask::SrcMAC
	push	OFFSET FLAT:?SrcIP@apptask@@2PADA	; apptask::SrcIP
	push	OFFSET FLAT:?GateWayIP@apptask@@2PADA	; apptask::GateWayIP
	lea	ecx, DWORD PTR _arp$[ebp]
	call	?ARPBroadcast@ARPObj@@QAEHPAD00@Z	; ARPObj::ARPBroadcast
	mov	DWORD PTR _retcode$[ebp], eax
; Line 590
	push	OFFSET FLAT:?SrcMAC@apptask@@2PADA	; apptask::SrcMAC
	push	OFFSET FLAT:?SrcIP@apptask@@2PADA	; apptask::SrcIP
	push	OFFSET FLAT:?FTPServerIP@apptask@@2PADA	; apptask::FTPServerIP
	lea	ecx, DWORD PTR _arp$[ebp]
	call	?ARPBroadcast@ARPObj@@QAEHPAD00@Z	; ARPObj::ARPBroadcast
	mov	DWORD PTR _retcode$[ebp], eax
; Line 591
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	mov	DWORD PTR ?arptimer@apptask@@2HA, eax	; apptask::arptimer
$L3153:
; Line 593
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	mov	DWORD PTR ?totalstarttime@apptask@@2JA, eax ; apptask::totalstarttime
; Line 595
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacterBuff@AOAProtected@@QAEDXZ ; AOAProtected::AOAgetCharacterBuff
	mov	BYTE PTR _ch$[ebp], al
; Line 596
	movsx	edx, BYTE PTR _ch$[ebp]
	cmp	edx, 81					; 00000051H
	jne	$L3154
; Line 604
	push	820					; 00000334H
	push	OFFSET FLAT:$SG3155
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 605
	push	840					; 00000348H
	push	OFFSET FLAT:$SG3156
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 606
	push	860					; 0000035cH
	push	OFFSET FLAT:$SG3157
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 607
	push	980					; 000003d4H
	mov	eax, DWORD PTR ?HttpRequests@TCPObj@@2KA ; TCPObj::HttpRequests
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 608
	push	1000					; 000003e8H
	mov	ecx, DWORD PTR ?TotalDataRcvd@apptask@@2JA ; apptask::TotalDataRcvd
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 609
	push	1020					; 000003fcH
	mov	edx, DWORD PTR ?TotalDataSent@EtherObj@@2JA ; EtherObj::TotalDataSent
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 610
	push	2100					; 00000834H
	mov	eax, DWORD PTR ?MaxNoOfTasksUsed@TCPObj@@2KA ; TCPObj::MaxNoOfTasksUsed
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 611
	push	880					; 00000370H
	push	OFFSET FLAT:$SG3158
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 612
	push	900					; 00000384H
	push	OFFSET FLAT:$SG3159
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 613
	push	920					; 00000398H
	push	OFFSET FLAT:$SG3160
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 614
	push	1040					; 00000410H
	mov	ecx, DWORD PTR ?totaltickslow@apptask@@2IA ; apptask::totaltickslow
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 615
	push	1200					; 000004b0H
	mov	edx, DWORD PTR ?totaltickshigh@apptask@@2IA ; apptask::totaltickshigh
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 616
	push	1060					; 00000424H
	mov	eax, DWORD PTR ?rcvtickslow@apptask@@2IA ; apptask::rcvtickslow
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 617
	push	1220					; 000004c4H
	mov	ecx, DWORD PTR ?rcvtickshigh@apptask@@2IA ; apptask::rcvtickshigh
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 618
	push	1080					; 00000438H
	mov	edx, DWORD PTR ?httptickslow@apptask@@2IA ; apptask::httptickslow
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 619
	push	1240					; 000004d8H
	mov	eax, DWORD PTR ?httptickshigh@apptask@@2IA ; apptask::httptickshigh
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 621
	mov	DWORD PTR ?Application_Status@AOAProtected@@2HA, 2 ; AOAProtected::Application_Status
; Line 622
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAExit@AOAProtected@@QAEXXZ		; AOAProtected::AOAExit
$L3154:
; Line 625
	lea	ecx, DWORD PTR _EO$[ebp]
	call	?IncSendOutPtr@EtherObj@@QAEHXZ		; EtherObj::IncSendOutPtr
	mov	DWORD PTR _retcode$[ebp], eax
; Line 627
	mov	DWORD PTR _tcbrnoc$[ebp], -1
; Line 629
	mov	ecx, DWORD PTR ?ReceiveOutPtr@EtherObj@@2JA ; EtherObj::ReceiveOutPtr
	push	ecx
	lea	ecx, DWORD PTR _EO$[ebp]
	call	?isRDescDone@EtherObj@@QAEHH@Z		; EtherObj::isRDescDone
	test	eax, eax
	je	SHORT $L3161
; Line 631
	push	1
	push	4
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAMaskRunRegister@AOAProtected@@QAEHHH@Z ; AOAProtected::AOAMaskRunRegister
; Line 632
	mov	DWORD PTR _rcvflag$[ebp], 1
; Line 634
	jmp	SHORT $L3162
$L3161:
; Line 636
	push	0
	push	4
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAMaskRunRegister@AOAProtected@@QAEHHH@Z ; AOAProtected::AOAMaskRunRegister
$L3162:
; Line 655
	lea	ecx, DWORD PTR _tcp$[ebp]
	call	?getHttpCount@TCPObj@@QAEHXZ		; TCPObj::getHttpCount
	test	eax, eax
	jle	SHORT $L3163
; Line 657
	lea	ecx, DWORD PTR _tcp$[ebp]
	call	?getHttpCount@TCPObj@@QAEHXZ		; TCPObj::getHttpCount
	cmp	eax, DWORD PTR _httpMax$[ebp]
	jle	SHORT $L3164
; Line 658
	lea	ecx, DWORD PTR _tcp$[ebp]
	call	?getHttpCount@TCPObj@@QAEHXZ		; TCPObj::getHttpCount
	mov	DWORD PTR _httpMax$[ebp], eax
$L3164:
; Line 659
	push	1
	push	7
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAMaskRunRegister@AOAProtected@@QAEHHH@Z ; AOAProtected::AOAMaskRunRegister
$L3163:
; Line 662
	cmp	DWORD PTR ?RunRegister@AOAProtected@@2JA, 0 ; AOAProtected::RunRegister
	je	$L3197
; Line 665
	mov	ecx, DWORD PTR _this$[ebp]
	call	?Scheduler_Algorithm_1@apptask@@QAEHXZ	; apptask::Scheduler_Algorithm_1
	mov	DWORD PTR _n$[ebp], eax
; Line 666
	mov	DWORD PTR _idFound$[ebp], 0
; Line 668
	cmp	DWORD PTR _n$[ebp], 7
	jne	SHORT $L3166
; Line 669
	mov	DWORD PTR _httpflag$[ebp], 1
; Line 670
	jmp	SHORT $L3167
$L3166:
	mov	DWORD PTR _httpflag$[ebp], 0
$L3167:
; Line 671
	mov	DWORD PTR _counter$[ebp], 0
; Line 673
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 396				; 0000018cH
	call	?getCount@WCirList@@QAEHXZ		; WCirList::getCount
	mov	DWORD PTR _noOfElements$[ebp], eax
; Line 674
	mov	edx, 1
	test	edx, edx
	je	SHORT $L3168
; Line 675
	push	1480					; 000005c8H
	mov	eax, DWORD PTR _noOfElements$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
$L3168:
; Line 677
	cmp	DWORD PTR _httpflag$[ebp], 1
	jne	$L3186
$L3171:
; Line 679
	mov	ecx, DWORD PTR _counter$[ebp]
	cmp	ecx, DWORD PTR _noOfElements$[ebp]
	jge	$L3172
	cmp	DWORD PTR _idFound$[ebp], 0
	jne	$L3172
; Line 681
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 396				; 0000018cH
	call	?getCount@WCirList@@QAEHXZ		; WCirList::getCount
	mov	DWORD PTR _retcode$[ebp], eax
; Line 682
	mov	edx, DWORD PTR _retcode$[ebp]
	cmp	edx, DWORD PTR ?MaxNoOfTasksUsed@TCPObj@@2KA ; TCPObj::MaxNoOfTasksUsed
	jbe	SHORT $L3173
; Line 683
	mov	eax, DWORD PTR _retcode$[ebp]
	mov	DWORD PTR ?MaxNoOfTasksUsed@TCPObj@@2KA, eax ; TCPObj::MaxNoOfTasksUsed
$L3173:
; Line 685
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 396				; 0000018cH
	call	?empty@WCirList@@QAEHXZ			; WCirList::empty
	test	eax, eax
	jne	SHORT $L3174
; Line 687
	lea	ecx, DWORD PTR _timerc$[ebp]
	push	ecx
	lea	edx, DWORD PTR _tcbrnoc$[ebp]
	push	edx
	lea	eax, DWORD PTR _statec$[ebp]
	push	eax
	lea	ecx, DWORD PTR _delay100$[ebp]
	push	ecx
	lea	edx, DWORD PTR _taskid$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 396				; 0000018cH
	call	?get@WCirList@@QAEHPAJPAI0PAH0@Z	; WCirList::get
; Line 689
	jmp	SHORT $L3175
$L3174:
; Line 690
	push	3840					; 00000f00H
	push	OFFSET FLAT:$SG3176
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
$L3175:
; Line 691
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	mov	DWORD PTR _currenttime$[ebp], eax
; Line 695
	mov	eax, DWORD PTR _tcbrnoc$[ebp]
	push	eax
	lea	ecx, DWORD PTR _tcp$[ebp]
	call	?getResetFlag@TCPObj@@QAEHH@Z		; TCPObj::getResetFlag
	cmp	eax, 1
	jne	SHORT $L3177
; Line 697
	mov	DWORD PTR _n$[ebp], 0
; Line 698
	mov	DWORD PTR _idFound$[ebp], 0
; Line 699
	mov	ecx, DWORD PTR ?taskDeletes@apptask@@2HA ; apptask::taskDeletes
	add	ecx, 1
	mov	DWORD PTR ?taskDeletes@apptask@@2HA, ecx ; apptask::taskDeletes
; Line 700
	mov	edx, 1
	test	edx, edx
	je	SHORT $L3178
; Line 701
	push	2220					; 000008acH
	mov	eax, DWORD PTR ?taskDeletes@apptask@@2HA ; apptask::taskDeletes
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
$L3178:
; Line 702
	push	96					; 00000060H
	mov	ecx, DWORD PTR _tcbrnoc$[ebp]
	push	ecx
	lea	ecx, DWORD PTR _tcp$[ebp]
	call	?DeleteTCB@TCPObj@@QAEHHH@Z		; TCPObj::DeleteTCB
; Line 703
	jmp	$L3171
$L3177:
; Line 705
	mov	edx, DWORD PTR _tcbrnoc$[ebp]
	push	edx
	lea	ecx, DWORD PTR _tcp$[ebp]
	call	?getSuspendFlag@TCPObj@@QAEHH@Z		; TCPObj::getSuspendFlag
	cmp	eax, 1
	jne	SHORT $L3180
	mov	eax, DWORD PTR _tcbrnoc$[ebp]
	push	eax
	lea	ecx, DWORD PTR _tcp$[ebp]
	call	?getResumeFlag@TCPObj@@QAEHH@Z		; TCPObj::getResumeFlag
	cmp	eax, 1
	jne	SHORT $L3180
; Line 707
	mov	ecx, DWORD PTR _taskid$[ebp]
	mov	DWORD PTR _n$[ebp], ecx
; Line 708
	mov	DWORD PTR _idFound$[ebp], 1
; Line 709
	mov	edx, DWORD PTR _tcbrnoc$[ebp]
	push	edx
	lea	ecx, DWORD PTR _tcp$[ebp]
	call	?resetResumeFlag@TCPObj@@QAEHH@Z	; TCPObj::resetResumeFlag
; Line 710
	mov	eax, DWORD PTR ?resumeCount@apptask@@2HA ; apptask::resumeCount
	add	eax, 1
	mov	DWORD PTR ?resumeCount@apptask@@2HA, eax ; apptask::resumeCount
; Line 711
	jmp	$L3171
$L3180:
; Line 714
	mov	ecx, DWORD PTR _currenttime$[ebp]
	cmp	ecx, DWORD PTR _delay100$[ebp]
	jb	SHORT $L3181
; Line 716
	mov	edx, DWORD PTR _taskid$[ebp]
	mov	DWORD PTR _n$[ebp], edx
; Line 717
	mov	DWORD PTR _idFound$[ebp], 1
; Line 719
	jmp	SHORT $L3184
$L3181:
; Line 721
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 396				; 0000018cH
	call	?full@WCirList@@QAEHXZ			; WCirList::full
	test	eax, eax
	jne	SHORT $L3183
	mov	eax, DWORD PTR _tcbrnoc$[ebp]
	push	eax
	lea	ecx, DWORD PTR _tcp$[ebp]
	call	?getAvail@TCPObj@@QAEHH@Z		; TCPObj::getAvail
	cmp	eax, 1
	jne	SHORT $L3183
; Line 723
	mov	ecx, DWORD PTR _timerc$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tcbrnoc$[ebp]
	push	edx
	mov	eax, DWORD PTR _statec$[ebp]
	push	eax
	mov	ecx, DWORD PTR _delay100$[ebp]
	push	ecx
	mov	edx, DWORD PTR _taskid$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 396				; 0000018cH
	call	?insert@WCirList@@QAEHJJJHJ@Z		; WCirList::insert
; Line 725
	jmp	SHORT $L3184
$L3183:
; Line 727
	push	3840					; 00000f00H
	push	OFFSET FLAT:$SG3185
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
$L3184:
; Line 731
	mov	eax, DWORD PTR _counter$[ebp]
	add	eax, 1
	mov	DWORD PTR _counter$[ebp], eax
; Line 739
	jmp	$L3171
$L3172:
; Line 741
	cmp	DWORD PTR _idFound$[ebp], 0
	jne	SHORT $L3186
; Line 742
	mov	DWORD PTR _n$[ebp], 0
$L3186:
; Line 746
	cmp	DWORD PTR _n$[ebp], 4
	jl	$L3194
	mov	ecx, DWORD PTR _n$[ebp]
	cmp	ecx, DWORD PTR ?MaxTaskId@apptask@@2JA	; apptask::MaxTaskId
	jg	$L3194
; Line 748
	mov	edx, DWORD PTR _n$[ebp]
	mov	DWORD PTR ?Current_Task@apptask@@2HA, edx ; apptask::Current_Task
; Line 749
	cmp	DWORD PTR _n$[ebp], 8
	jle	SHORT $L3188
; Line 750
	mov	eax, DWORD PTR _tcbrnoc$[ebp]
	mov	DWORD PTR ?Current_Tcbrno@apptask@@2HA, eax ; apptask::Current_Tcbrno
$L3188:
; Line 752
	cmp	DWORD PTR _n$[ebp], 4
	jne	SHORT $L3189
; Line 754
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	mov	DWORD PTR ?rcvstarttime@apptask@@2JA, eax ; apptask::rcvstarttime
$L3189:
; Line 756
	cmp	DWORD PTR _httpflag$[ebp], 1
	jne	$L3190
; Line 758
	cmp	DWORD PTR ?runFlag@apptask@@2HA, 0	; apptask::runFlag
	jne	SHORT $L3191
; Line 760
	mov	DWORD PTR ?runFlag@apptask@@2HA, 1	; apptask::runFlag
; Line 761
	mov	DWORD PTR ?totalcurtime@apptask@@2JA, 0	; apptask::totalcurtime
; Line 762
	mov	DWORD PTR ?rcvcurtime@apptask@@2JA, 0	; apptask::rcvcurtime
; Line 763
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	mov	DWORD PTR ?totalstarttime@apptask@@2JA, eax ; apptask::totalstarttime
; Line 764
	mov	DWORD PTR ?TotalDataRcvd@apptask@@2JA, 0 ; apptask::TotalDataRcvd
; Line 765
	mov	DWORD PTR ?TotalDataSent@EtherObj@@2JA, 0 ; EtherObj::TotalDataSent
; Line 766
	mov	DWORD PTR ?totaltickshigh@apptask@@2IA, 0 ; apptask::totaltickshigh
; Line 767
	mov	DWORD PTR ?totaltickslow@apptask@@2IA, 0 ; apptask::totaltickslow
; Line 768
	mov	DWORD PTR ?rcvtickshigh@apptask@@2IA, 0	; apptask::rcvtickshigh
; Line 769
	mov	DWORD PTR ?rcvtickslow@apptask@@2IA, 0	; apptask::rcvtickslow
; Line 770
	mov	DWORD PTR ?httptickshigh@apptask@@2IA, 0 ; apptask::httptickshigh
; Line 771
	mov	DWORD PTR ?httptickslow@apptask@@2IA, 0	; apptask::httptickslow
$L3191:
; Line 775
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	mov	DWORD PTR ?httpstarttime@apptask@@2JA, eax ; apptask::httpstarttime
$L3190:
; Line 779
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	mov	DWORD PTR ?ExitTimer@apptask@@2KA, eax	; apptask::ExitTimer
; Line 782
	mov	ecx, DWORD PTR _n$[ebp]
	push	ecx
	lea	ecx, DWORD PTR _task$[ebp]
	call	?AOArunTask@AOATask@@QAEHH@Z		; AOATask::AOArunTask
; Line 785
	mov	edx, 1
	test	edx, edx
	je	SHORT $L3192
; Line 786
	push	1460					; 000005b4H
	mov	eax, DWORD PTR _n$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
$L3192:
; Line 788
	cmp	DWORD PTR _n$[ebp], 4
	jne	SHORT $L3193
; Line 797
	mov	ecx, DWORD PTR ?TotalRcvCount@apptask@@2JA ; apptask::TotalRcvCount
	add	ecx, 1
	mov	DWORD PTR ?TotalRcvCount@apptask@@2JA, ecx ; apptask::TotalRcvCount
$L3193:
; Line 799
	cmp	DWORD PTR _httpflag$[ebp], 1
	jne	SHORT $L3194
; Line 808
	mov	edx, DWORD PTR ?TotalHttpCount@apptask@@2JA ; apptask::TotalHttpCount
	add	edx, 1
	mov	DWORD PTR ?TotalHttpCount@apptask@@2JA, edx ; apptask::TotalHttpCount
$L3194:
; Line 813
	cmp	DWORD PTR _n$[ebp], 4
	jne	SHORT $L3195
; Line 815
	push	0
	push	4
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAMaskRunRegister@AOAProtected@@QAEHHH@Z ; AOAProtected::AOAMaskRunRegister
$L3195:
; Line 818
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 396				; 0000018cH
	call	?getCount@WCirList@@QAEHXZ		; WCirList::getCount
	test	eax, eax
	jne	SHORT $L3196
	cmp	DWORD PTR _n$[ebp], 7
	jl	SHORT $L3196
; Line 820
	push	0
	push	7
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAMaskRunRegister@AOAProtected@@QAEHHH@Z ; AOAProtected::AOAMaskRunRegister
$L3196:
; Line 822
	mov	eax, 1
	test	eax, eax
	je	$L3197
; Line 824
	push	2100					; 00000834H
	mov	ecx, DWORD PTR ?MaxNoOfTasksUsed@TCPObj@@2KA ; TCPObj::MaxNoOfTasksUsed
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 825
	push	2120					; 00000848H
	mov	edx, DWORD PTR ?MaxNoOfTCBsUsed@TCPObj@@2KA ; TCPObj::MaxNoOfTCBsUsed
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 826
	push	2140					; 0000085cH
	mov	eax, DWORD PTR ?trace2Count@TCPObj@@2JA	; TCPObj::trace2Count
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 827
	push	2160					; 00000870H
	mov	ecx, DWORD PTR ?TotalDelCount@TCPObj@@2KA ; TCPObj::TotalDelCount
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 828
	push	2180					; 00000884H
	mov	edx, DWORD PTR ?NoOfResets@TCPObj@@2HA	; TCPObj::NoOfResets
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 829
	push	520					; 00000208H
	mov	eax, DWORD PTR ?ReceiveInPtr@EtherObj@@2JA ; EtherObj::ReceiveInPtr
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 830
	push	540					; 0000021cH
	mov	ecx, DWORD PTR ?ReceiveOutPtr@EtherObj@@2JA ; EtherObj::ReceiveOutPtr
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 831
	push	880					; 00000370H
	mov	edx, DWORD PTR ?SendInPtr@EtherObj@@2JA	; EtherObj::SendInPtr
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 832
	push	900					; 00000384H
	mov	eax, DWORD PTR ?SendOutPtr@EtherObj@@2JA ; EtherObj::SendOutPtr
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
$L3197:
; Line 837
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	sub	eax, DWORD PTR ?totalstarttime@apptask@@2JA ; apptask::totalstarttime
	mov	ecx, DWORD PTR ?totalcurtime@apptask@@2JA ; apptask::totalcurtime
	add	ecx, eax
	mov	DWORD PTR ?totalcurtime@apptask@@2JA, ecx ; apptask::totalcurtime
; Line 839
	jmp	$L3151
$L3152:
; Line 841
	lea	ecx, DWORD PTR _task$[ebp]
	call	?AOAapplink32@AOATask@@QAEHXZ		; AOATask::AOAapplink32
; Line 842
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAExit@AOAProtected@@QAEXXZ		; AOAProtected::AOAExit
; Line 843
	mov	esp, ebp
	pop	ebp
	ret	4
?MainTask@apptask@@QAEXJ@Z ENDP				; apptask::MainTask
_TEXT	ENDS
PUBLIC	?RcvTask@apptask@@QAEXJ@Z			; apptask::RcvTask
EXTRN	?ReadData@EtherObj@@QAEHPAPADPAHPAD2@Z:NEAR	; EtherObj::ReadData
EXTRN	?discardPacket@EtherObj@@QAEHXZ:NEAR		; EtherObj::discardPacket
EXTRN	?TDLFull@EtherObj@@QAEHXZ:NEAR			; EtherObj::TDLFull
EXTRN	?ARPHandler@ARPObj@@QAEHPADHH@Z:NEAR		; ARPObj::ARPHandler
EXTRN	?msourceIP@IPObj@@2PADA:DWORD			; IPObj::msourceIP
EXTRN	?IPHandler@IPObj@@QAEHPADH0JH@Z:NEAR		; IPObj::IPHandler
_DATA	SEGMENT
	ORG $+1
$SG3220	DB	'RCV:', 00H
	ORG $+3
$SG3234	DB	'RCV Task: Receive Overrun!', 00H
	ORG $+1
$SG3238	DB	'TDL IS FULL!', 00H
	ORG $+3
$SG3248	DB	'Hardware Type Mismatch in ARP: -1', 00H
	ORG $+2
$SG3250	DB	'Protocol Mismatch in ARP: -2', 00H
	ORG $+3
$SG3252	DB	'Length of Hardware Address Mismatch in ARP: -3', 00H
	ORG $+1
$SG3254	DB	'Protocol Address Length Mismatch in ARP: -4', 00H
$SG3256	DB	'Not a Request or Reply, can''t handle it!: -5', 00H
	ORG $+3
$SG3258	DB	'Should never happen in ARP, Catastrophic: -6', 00H
	ORG $+3
$SG3260	DB	'IP No Match!Not An Error: It is a broadcast : -7', 00H
	ORG $+3
$SG3262	DB	'TDL Slot or Memory Error Catastrophic - 8!', 00H
	ORG $+1
$SG3264	DB	'TDL Slot or Memory Error Catastrophic! - 9', 00H
	ORG $+1
$SG3275	DB	'Packet Size is less than the header IP: -1', 00H
	ORG $+1
$SG3277	DB	'Packet Size is large! IP: -2', 00H
	ORG $+3
$SG3279	DB	'Not our packet, Throw it out! IP: -3', 00H
	ORG $+3
$SG3281	DB	'Fragmented Data IP: -4', 00H
	ORG $+1
$SG3283	DB	'No Data in the Datagram! IP: -5', 00H
$SG3285	DB	'IP Destination do not Match! IP: -6', 00H
$SG3287	DB	'Other Packets IP: -7', 00H
	ORG $+3
$SG3289	DB	'Checksum Error! IP: -8', 00H
	ORG $+1
$SG3291	DB	'Discard the packet! IP: -9', 00H
	ORG $+1
$SG3293	DB	'Length of data to send is less than 1 byte IP: -10', 00H
	ORG $+1
$SG3295	DB	'Length of data to send is greater than max send size IP:'
	DB	' -11', 00H
	ORG $+3
$SG3297	DB	'TDL pointer is out of range EO: -12', 00H
$SG3299	DB	'Data buffer is out of range EO: -13', 00H
$SG3301	DB	'Packet size is less header size UDP: -14', 00H
	ORG $+3
$SG3303	DB	'Packet is not for our port UDP: -15', 00H
$SG3305	DB	'Packet size is less than 3 FTP: -16', 00H
$SG3307	DB	'Packet is less than minimum length TCP: -17', 00H
$SG3309	DB	'Packet is not for HTTP Port TCP: -18', 00H
	ORG $+3
$SG3311	DB	'Packet does not have correct checksum TCP: -19', 00H
	ORG $+1
$SG3313	DB	'Retrieving TCB Record Failed TCP: -20', 00H
	ORG $+2
$SG3315	DB	'Dpd pointer is out of range TCP: -22', 00H
	ORG $+3
$SG3317	DB	'Data buffer is out of range TCP: -23', 00H
	ORG $+3
$SG3319	DB	'Length of data to send is less than 1 byte IP: -24', 00H
	ORG $+1
$SG3321	DB	'Length of data to send is greater than max send size IP:'
	DB	' -25', 00H
	ORG $+3
$SG3323	DB	'TDL pointer is out of range EO: -26', 00H
$SG3325	DB	'Data buffer is out of range EO: -27', 00H
$SG3327	DB	'packet size is larger than record size HTTPList: -28', 00H
	ORG $+3
$SG3329	DB	'http buffer is full HTTPList: -29', 00H
	ORG $+2
$SG3331	DB	'valid bit is not set HTTPList: -30', 00H
	ORG $+1
$SG3333	DB	'TCPObj:OtherHandler Not a GET request -31', 00H
	ORG $+2
$SG3335	DB	'RcvTask is Ending', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -772
_ar$ = -764
_ip$ = -108
_tcp$ = -468
_task$ = -88
_Data$ = -20
_abc$ = -8
_macaddr$ = -32
_i$ = -36
_j$ = -40
_loopcount1$ = -16
_retcode$ = -4
_empty$ = -112
_RXSize$ = -768
_lcount$ = -12
_vcount$ = -24
_PacketType$ = -476
_starttime$ = -472
?RcvTask@apptask@@QAEXJ@Z PROC NEAR			; apptask::RcvTask
; Line 851
	push	ebp
	mov	ebp, esp
	sub	esp, 780				; 0000030cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 852
	lea	ecx, DWORD PTR _ar$[ebp]
	call	??0ARPObj@@QAE@XZ			; ARPObj::ARPObj
; Line 853
	lea	ecx, DWORD PTR _ip$[ebp]
	call	??0IPObj@@QAE@XZ			; IPObj::IPObj
; Line 854
	lea	ecx, DWORD PTR _tcp$[ebp]
	call	??0TCPObj@@QAE@XZ			; TCPObj::TCPObj
; Line 855
	lea	ecx, DWORD PTR _task$[ebp]
	call	??0AOATask@@QAE@XZ			; AOATask::AOATask
; Line 859
	lea	eax, DWORD PTR _abc$[ebp]
	mov	DWORD PTR _Data$[ebp], eax
; Line 862
	mov	DWORD PTR _i$[ebp], 0
	mov	DWORD PTR _j$[ebp], 0
; Line 863
	mov	DWORD PTR _loopcount1$[ebp], 0
; Line 864
	mov	DWORD PTR _retcode$[ebp], 0
; Line 865
	mov	DWORD PTR _empty$[ebp], 0
; Line 866
	mov	DWORD PTR _RXSize$[ebp], 0
; Line 867
	mov	DWORD PTR _lcount$[ebp], 0
	mov	DWORD PTR _vcount$[ebp], 0
; Line 868
	mov	DWORD PTR _PacketType$[ebp], 0
; Line 869
	mov	DWORD PTR _starttime$[ebp], 0
; Line 871
	mov	DWORD PTR ?ippackcount@apptask@@2JA, 0	; apptask::ippackcount
; Line 872
	mov	DWORD PTR ?arppackcount@apptask@@2JA, 0	; apptask::arppackcount
; Line 873
	mov	DWORD PTR ?upCompleteNotSetCount@apptask@@2JA, 0 ; apptask::upCompleteNotSetCount
; Line 874
	mov	DWORD PTR ?notForThisNodeCount@apptask@@2JA, 0 ; apptask::notForThisNodeCount
; Line 875
	mov	DWORD PTR ?notArpOrIpCount@apptask@@2JA, 0 ; apptask::notArpOrIpCount
; Line 877
	mov	ecx, 1
	test	ecx, ecx
	je	SHORT $L3219
; Line 879
	push	486					; 000001e6H
	push	OFFSET FLAT:$SG3220
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 880
	push	620					; 0000026cH
	mov	edx, DWORD PTR ?Current_Task@apptask@@2HA ; apptask::Current_Task
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
$L3219:
; Line 883
	cmp	DWORD PTR ?Application_Status@AOAProtected@@2HA, 2 ; AOAProtected::Application_Status
	je	$L3223
; Line 885
	mov	eax, 1
	test	eax, eax
	je	SHORT $L3224
; Line 886
	push	620					; 0000026cH
	mov	ecx, DWORD PTR ?Current_Task@apptask@@2HA ; apptask::Current_Task
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
$L3224:
; Line 889
	lea	edx, DWORD PTR _macaddr$[ebp]
	push	edx
	push	OFFSET FLAT:?msourceIP@IPObj@@2PADA	; IPObj::msourceIP
	lea	eax, DWORD PTR _PacketType$[ebp]
	push	eax
	lea	ecx, DWORD PTR _Data$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?ReadData@EtherObj@@QAEHPAPADPAHPAD2@Z	; EtherObj::ReadData
	mov	DWORD PTR _RXSize$[ebp], eax
; Line 890
	mov	edx, DWORD PTR ?TotalDataRcvd@apptask@@2JA ; apptask::TotalDataRcvd
	add	edx, DWORD PTR _RXSize$[ebp]
	mov	DWORD PTR ?TotalDataRcvd@apptask@@2JA, edx ; apptask::TotalDataRcvd
; Line 891
	mov	eax, 1
	test	eax, eax
	je	SHORT $L3225
; Line 892
	push	560					; 00000230H
	mov	ecx, DWORD PTR _RXSize$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
$L3225:
; Line 893
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	mov	DWORD PTR _starttime$[ebp], eax
; Line 894
	cmp	DWORD PTR _RXSize$[ebp], -1
	jne	SHORT $L3226
; Line 898
	mov	edx, DWORD PTR ?upCompleteNotSetCount@apptask@@2JA ; apptask::upCompleteNotSetCount
	add	edx, 1
	mov	DWORD PTR ?upCompleteNotSetCount@apptask@@2JA, edx ; apptask::upCompleteNotSetCount
; Line 899
	lea	ecx, DWORD PTR _task$[ebp]
	call	?AOAsuspendTask@AOATask@@QAEXXZ		; AOATask::AOAsuspendTask
; Line 900
	mov	eax, 1
	test	eax, eax
	je	SHORT $L3227
; Line 901
	push	580					; 00000244H
	mov	ecx, DWORD PTR ?upCompleteNotSetCount@apptask@@2JA ; apptask::upCompleteNotSetCount
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
$L3227:
; Line 902
	jmp	$L3219
$L3226:
; Line 904
	cmp	DWORD PTR _RXSize$[ebp], -2		; fffffffeH
	jne	SHORT $L3228
; Line 907
	mov	edx, DWORD PTR ?notForThisNodeCount@apptask@@2JA ; apptask::notForThisNodeCount
	add	edx, 1
	mov	DWORD PTR ?notForThisNodeCount@apptask@@2JA, edx ; apptask::notForThisNodeCount
; Line 908
	lea	ecx, DWORD PTR _task$[ebp]
	call	?AOAsuspendTask@AOATask@@QAEXXZ		; AOATask::AOAsuspendTask
; Line 909
	mov	eax, 1
	test	eax, eax
	je	SHORT $L3229
; Line 910
	push	600					; 00000258H
	mov	ecx, DWORD PTR ?notForThisNodeCount@apptask@@2JA ; apptask::notForThisNodeCount
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
$L3229:
; Line 911
	jmp	$L3219
$L3228:
; Line 913
	cmp	DWORD PTR _RXSize$[ebp], -3		; fffffffdH
	jne	SHORT $L3230
; Line 917
	mov	edx, DWORD PTR ?notArpOrIpCount@apptask@@2JA ; apptask::notArpOrIpCount
	add	edx, 1
	mov	DWORD PTR ?notArpOrIpCount@apptask@@2JA, edx ; apptask::notArpOrIpCount
; Line 918
	lea	ecx, DWORD PTR _task$[ebp]
	call	?AOAsuspendTask@AOATask@@QAEXXZ		; AOATask::AOAsuspendTask
; Line 919
	mov	eax, 1
	test	eax, eax
	je	SHORT $L3231
; Line 920
	push	820					; 00000334H
	mov	ecx, DWORD PTR ?notArpOrIpCount@apptask@@2JA ; apptask::notArpOrIpCount
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
$L3231:
; Line 921
	jmp	$L3219
$L3230:
; Line 923
	cmp	DWORD PTR _RXSize$[ebp], -4		; fffffffcH
	jne	SHORT $L3232
; Line 926
	lea	ecx, DWORD PTR _task$[ebp]
	call	?AOAsuspendTask@AOATask@@QAEXXZ		; AOATask::AOAsuspendTask
; Line 927
	mov	edx, 1
	test	edx, edx
	je	SHORT $L3233
; Line 928
	push	880					; 00000370H
	push	OFFSET FLAT:$SG3234
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
$L3233:
; Line 929
	jmp	$L3219
$L3232:
; Line 933
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?TDLFull@EtherObj@@QAEHXZ		; EtherObj::TDLFull
	test	eax, eax
	je	SHORT $L3237
; Line 938
	push	3700					; 00000e74H
	mov	eax, DWORD PTR ?SendInPtr@EtherObj@@2JA	; EtherObj::SendInPtr
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 939
	push	3720					; 00000e88H
	mov	ecx, DWORD PTR ?SendOutPtr@EtherObj@@2JA ; EtherObj::SendOutPtr
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 940
	push	3740					; 00000e9cH
	push	OFFSET FLAT:$SG3238
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 941
	lea	ecx, DWORD PTR _task$[ebp]
	call	?AOAsuspendTask@AOATask@@QAEXXZ		; AOATask::AOAsuspendTask
; Line 942
	jmp	SHORT $L3232
$L3237:
; Line 944
	cmp	DWORD PTR _RXSize$[ebp], 0
	jl	$L3266
; Line 946
	cmp	DWORD PTR _PacketType$[ebp], 2054	; 00000806H
	jne	$L3240
; Line 948
	mov	edx, DWORD PTR ?arppackcount@apptask@@2JA ; apptask::arppackcount
	add	edx, 1
	mov	DWORD PTR ?arppackcount@apptask@@2JA, edx ; apptask::arppackcount
; Line 949
	mov	eax, 1
	test	eax, eax
	je	SHORT $L3241
; Line 950
	push	840					; 00000348H
	mov	ecx, DWORD PTR ?arppackcount@apptask@@2JA ; apptask::arppackcount
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
$L3241:
; Line 952
	mov	edx, DWORD PTR ?Current_Task@apptask@@2HA ; apptask::Current_Task
	push	edx
	mov	eax, DWORD PTR _RXSize$[ebp]
	push	eax
	mov	ecx, DWORD PTR _Data$[ebp]
	push	ecx
	lea	ecx, DWORD PTR _ar$[ebp]
	call	?ARPHandler@ARPObj@@QAEHPADHH@Z		; ARPObj::ARPHandler
	mov	DWORD PTR _retcode$[ebp], eax
; Line 954
	mov	edx, DWORD PTR _retcode$[ebp]
	mov	DWORD PTR -776+[ebp], edx
	mov	eax, DWORD PTR -776+[ebp]
	add	eax, 9
	mov	DWORD PTR -776+[ebp], eax
	cmp	DWORD PTR -776+[ebp], 8
	ja	$L3244
	mov	ecx, DWORD PTR -776+[ebp]
	jmp	DWORD PTR $L3617[ecx*4]
$L3247:
; Line 956
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG3248
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 957
	jmp	$L3244
$L3249:
; Line 959
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG3250
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 960
	jmp	$L3244
$L3251:
; Line 962
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG3252
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 963
	jmp	$L3244
$L3253:
; Line 965
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG3254
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 966
	jmp	$L3244
$L3255:
; Line 968
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG3256
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 969
	jmp	SHORT $L3244
$L3257:
; Line 971
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG3258
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 972
	jmp	SHORT $L3244
$L3259:
; Line 974
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG3260
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 975
	mov	edx, DWORD PTR _j$[ebp]
	add	edx, 1
	mov	DWORD PTR _j$[ebp], edx
; Line 976
	push	3780					; 00000ec4H
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 977
	jmp	SHORT $L3244
$L3261:
; Line 979
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG3262
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 980
	jmp	SHORT $L3244
$L3263:
; Line 982
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG3264
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
$L3244:
; Line 986
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?discardPacket@EtherObj@@QAEHXZ		; EtherObj::discardPacket
	mov	DWORD PTR _retcode$[ebp], eax
; Line 987
	lea	ecx, DWORD PTR _task$[ebp]
	call	?AOAsuspendTask@AOATask@@QAEXXZ		; AOATask::AOAsuspendTask
; Line 990
	jmp	$L3266
$L3240:
	cmp	DWORD PTR _PacketType$[ebp], 2048	; 00000800H
	jne	$L3266
; Line 993
	mov	ecx, DWORD PTR ?ippackcount@apptask@@2JA ; apptask::ippackcount
	add	ecx, 1
	mov	DWORD PTR ?ippackcount@apptask@@2JA, ecx ; apptask::ippackcount
; Line 994
	mov	edx, 1
	test	edx, edx
	je	SHORT $L3267
; Line 995
	push	860					; 0000035cH
	mov	eax, DWORD PTR ?ippackcount@apptask@@2JA ; apptask::ippackcount
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
$L3267:
; Line 996
	mov	ecx, DWORD PTR ?Current_Task@apptask@@2HA ; apptask::Current_Task
	push	ecx
	mov	edx, DWORD PTR _starttime$[ebp]
	push	edx
	lea	eax, DWORD PTR _macaddr$[ebp]
	push	eax
	mov	ecx, DWORD PTR _RXSize$[ebp]
	push	ecx
	mov	edx, DWORD PTR _Data$[ebp]
	push	edx
	lea	ecx, DWORD PTR _ip$[ebp]
	call	?IPHandler@IPObj@@QAEHPADH0JH@Z		; IPObj::IPHandler
	mov	DWORD PTR _retcode$[ebp], eax
; Line 998
	mov	eax, 1
	test	eax, eax
	je	SHORT $L3269
; Line 999
	push	13					; 0000000dH
	mov	ecx, DWORD PTR ?Current_Tcbrno@apptask@@2HA ; apptask::Current_Tcbrno
	push	ecx
	mov	edx, DWORD PTR _retcode$[ebp]
	push	edx
	lea	ecx, DWORD PTR _tcp$[ebp]
	call	?storeTraceDword@TCPObj@@QAEHHHH@Z	; TCPObj::storeTraceDword
$L3269:
; Line 1001
	mov	eax, DWORD PTR _retcode$[ebp]
	mov	DWORD PTR -780+[ebp], eax
	mov	ecx, DWORD PTR -780+[ebp]
	add	ecx, 31					; 0000001fH
	mov	DWORD PTR -780+[ebp], ecx
	cmp	DWORD PTR -780+[ebp], 30		; 0000001eH
	ja	$L3271
	mov	edx, DWORD PTR -780+[ebp]
	jmp	DWORD PTR $L3618[edx*4]
$L3274:
; Line 1003
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG3275
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1004
	jmp	$L3271
$L3276:
; Line 1006
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG3277
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1007
	jmp	$L3271
$L3278:
; Line 1009
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG3279
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1010
	jmp	$L3271
$L3280:
; Line 1012
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG3281
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1013
	jmp	$L3271
$L3282:
; Line 1015
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG3283
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1016
	jmp	$L3271
$L3284:
; Line 1018
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG3285
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1019
	jmp	$L3271
$L3286:
; Line 1021
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG3287
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1022
	jmp	$L3271
$L3288:
; Line 1024
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG3289
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1025
	jmp	$L3271
$L3290:
; Line 1027
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG3291
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1028
	jmp	$L3271
$L3292:
; Line 1030
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG3293
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1031
	jmp	$L3271
$L3294:
; Line 1033
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG3295
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1034
	jmp	$L3271
$L3296:
; Line 1036
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG3297
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1037
	jmp	$L3271
$L3298:
; Line 1039
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG3299
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1040
	jmp	$L3271
$L3300:
; Line 1042
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG3301
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1043
	jmp	$L3271
$L3302:
; Line 1045
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG3303
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1046
	jmp	$L3271
$L3304:
; Line 1048
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG3305
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1049
	jmp	$L3271
$L3306:
; Line 1051
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG3307
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1052
	jmp	$L3271
$L3308:
; Line 1054
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG3309
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1055
	jmp	$L3271
$L3310:
; Line 1057
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG3311
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1058
	jmp	$L3271
$L3312:
; Line 1060
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG3313
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1061
	jmp	$L3271
$L3314:
; Line 1063
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG3315
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1064
	jmp	$L3271
$L3316:
; Line 1066
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG3317
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1067
	jmp	$L3271
$L3318:
; Line 1069
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG3319
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1070
	jmp	$L3271
$L3320:
; Line 1072
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG3321
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1073
	jmp	$L3271
$L3322:
; Line 1075
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG3323
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1076
	jmp	SHORT $L3271
$L3324:
; Line 1078
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG3325
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1079
	jmp	SHORT $L3271
$L3326:
; Line 1081
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG3327
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1082
	jmp	SHORT $L3271
$L3328:
; Line 1084
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG3329
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1085
	jmp	SHORT $L3271
$L3330:
; Line 1087
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG3331
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1088
	jmp	SHORT $L3271
$L3332:
; Line 1090
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG3333
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
$L3271:
; Line 1095
	cmp	DWORD PTR _retcode$[ebp], -1717986919	; 99999999H
	je	SHORT $L3334
; Line 1096
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?discardPacket@EtherObj@@QAEHXZ		; EtherObj::discardPacket
	mov	DWORD PTR _retcode$[ebp], eax
$L3334:
; Line 1097
	lea	ecx, DWORD PTR _task$[ebp]
	call	?AOAsuspendTask@AOATask@@QAEXXZ		; AOATask::AOAsuspendTask
$L3266:
; Line 1102
	jmp	$L3219
$L3223:
; Line 1104
	push	3520					; 00000dc0H
	push	OFFSET FLAT:$SG3335
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1105
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAExit@AOAProtected@@QAEXXZ		; AOAProtected::AOAExit
; Line 1106
	mov	esp, ebp
	pop	ebp
	ret	4
$L3617:
	DD	$L3263
	DD	$L3261
	DD	$L3259
	DD	$L3257
	DD	$L3255
	DD	$L3253
	DD	$L3251
	DD	$L3249
	DD	$L3247
$L3618:
	DD	$L3332
	DD	$L3330
	DD	$L3328
	DD	$L3326
	DD	$L3324
	DD	$L3322
	DD	$L3320
	DD	$L3318
	DD	$L3316
	DD	$L3314
	DD	$L3271
	DD	$L3312
	DD	$L3310
	DD	$L3308
	DD	$L3306
	DD	$L3304
	DD	$L3302
	DD	$L3300
	DD	$L3298
	DD	$L3296
	DD	$L3294
	DD	$L3292
	DD	$L3290
	DD	$L3288
	DD	$L3286
	DD	$L3284
	DD	$L3282
	DD	$L3280
	DD	$L3278
	DD	$L3276
	DD	$L3274
?RcvTask@apptask@@QAEXJ@Z ENDP				; apptask::RcvTask
_TEXT	ENDS
PUBLIC	?getCurrentTask@apptask@@QAEHXZ			; apptask::getCurrentTask
_TEXT	SEGMENT
_this$ = -4
?getCurrentTask@apptask@@QAEHXZ PROC NEAR		; apptask::getCurrentTask
; Line 1112
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 1113
	mov	eax, DWORD PTR ?Current_Task@apptask@@2HA ; apptask::Current_Task
; Line 1114
	mov	esp, ebp
	pop	ebp
	ret	0
?getCurrentTask@apptask@@QAEHXZ ENDP			; apptask::getCurrentTask
_this$ = -12
_n$ = -8
_r$ = -4
?Scheduler_Algorithm_1@apptask@@QAEHXZ PROC NEAR	; apptask::Scheduler_Algorithm_1
; Line 1119
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 1120
	mov	DWORD PTR _n$[ebp], 0
	mov	DWORD PTR _r$[ebp], 0
; Line 1122
	mov	eax, DWORD PTR ?RunRegister@AOAProtected@@2JA ; AOAProtected::RunRegister
	mov	DWORD PTR _r$[ebp], eax
; Line 1123
	mov	ecx, DWORD PTR _r$[ebp]
	mov	edx, DWORD PTR ?ScheduleArray@apptask@@2PAHA[ecx*4]
	mov	DWORD PTR _n$[ebp], edx
; Line 1125
	mov	eax, DWORD PTR _n$[ebp]
; Line 1127
	mov	esp, ebp
	pop	ebp
	ret	0
?Scheduler_Algorithm_1@apptask@@QAEHXZ ENDP		; apptask::Scheduler_Algorithm_1
_TEXT	ENDS
PUBLIC	?createTask@apptask@@QAEHJH@Z			; apptask::createTask
EXTRN	?StackBase@AOATask@@2JA:DWORD			; AOATask::StackBase
EXTRN	?AOAcreateTask@AOATask@@QAEHJJHH@Z:NEAR		; AOATask::AOAcreateTask
_TEXT	SEGMENT
_Function_Address$ = 8
_flag$ = 12
_this$ = -60
_task$ = -52
_Task_ID$ = -4
_Task_Stack$ = -56
?createTask@apptask@@QAEHJH@Z PROC NEAR			; apptask::createTask
; Line 1134
	push	ebp
	mov	ebp, esp
	sub	esp, 60					; 0000003cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 1135
	lea	ecx, DWORD PTR _task$[ebp]
	call	??0AOATask@@QAE@XZ			; AOATask::AOATask
; Line 1136
	mov	DWORD PTR _Task_ID$[ebp], 4
$L3353:
; Line 1139
	mov	eax, DWORD PTR _Task_ID$[ebp]
	cmp	DWORD PTR ?Task_Status@apptask@@2PAHA[eax*4], 0
	je	SHORT $L3354
	cmp	DWORD PTR _Task_ID$[ebp], 8000		; 00001f40H
	jge	SHORT $L3354
; Line 1140
	mov	ecx, DWORD PTR _Task_ID$[ebp]
	add	ecx, 1
	mov	DWORD PTR _Task_ID$[ebp], ecx
	jmp	SHORT $L3353
$L3354:
; Line 1141
	cmp	DWORD PTR _Task_ID$[ebp], 8000		; 00001f40H
	jne	SHORT $L3355
; Line 1143
	or	eax, -1
	jmp	SHORT $L3348
$L3355:
; Line 1146
	mov	edx, DWORD PTR _Task_ID$[ebp]
	shl	edx, 14					; 0000000eH
	mov	eax, DWORD PTR ?StackBase@AOATask@@2JA	; AOATask::StackBase
	sub	eax, edx
	mov	DWORD PTR _Task_Stack$[ebp], eax
; Line 1148
	mov	ecx, DWORD PTR _flag$[ebp]
	push	ecx
	mov	edx, DWORD PTR _Task_ID$[ebp]
	push	edx
	mov	eax, DWORD PTR _Task_Stack$[ebp]
	push	eax
	mov	ecx, DWORD PTR _Function_Address$[ebp]
	push	ecx
	lea	ecx, DWORD PTR _task$[ebp]
	call	?AOAcreateTask@AOATask@@QAEHJJHH@Z	; AOATask::AOAcreateTask
; Line 1149
	cmp	DWORD PTR _flag$[ebp], 1
	jne	SHORT $L3356
; Line 1150
	mov	edx, DWORD PTR _Task_ID$[ebp]
	mov	DWORD PTR ?Task_Status@apptask@@2PAHA[edx*4], 0
; Line 1151
	jmp	SHORT $L3357
$L3356:
	mov	eax, DWORD PTR _Task_ID$[ebp]
	mov	DWORD PTR ?Task_Status@apptask@@2PAHA[eax*4], 1
$L3357:
; Line 1153
	mov	eax, DWORD PTR _Task_ID$[ebp]
$L3348:
; Line 1154
	mov	esp, ebp
	pop	ebp
	ret	8
?createTask@apptask@@QAEHJH@Z ENDP			; apptask::createTask
_TEXT	ENDS
PUBLIC	?insertHttpTask@apptask@@QAEHHJ@Z		; apptask::insertHttpTask
EXTRN	?pop@WStack@@QAEHPAH@Z:NEAR			; WStack::pop
EXTRN	?empty@WStack@@QAEHXZ:NEAR			; WStack::empty
_DATA	SEGMENT
	ORG $+2
$SG3369	DB	'TaskID is out of range', 00H
	ORG $+1
$SG3373	DB	'apptask:insertHttpTask circular list is full', 00H
	ORG $+3
$SG3375	DB	'apptask:insertHttpTask stack is empty', 00H
_DATA	ENDS
_TEXT	SEGMENT
_tcbrno$ = 8
_timerc$ = 12
_this$ = -12
_taskid$ = -4
?insertHttpTask@apptask@@QAEHHJ@Z PROC NEAR		; apptask::insertHttpTask
; Line 1161
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 1165
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 396				; 0000018cH
	call	?getCount@WCirList@@QAEHXZ		; WCirList::getCount
	cmp	eax, 5000				; 00001388H
	jle	SHORT $L3365
; Line 1167
	push	3940					; 00000f64H
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 396				; 0000018cH
	call	?getCount@WCirList@@QAEHXZ		; WCirList::getCount
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1168
	mov	DWORD PTR ?Application_Status@AOAProtected@@2HA, 2 ; AOAProtected::Application_Status
; Line 1169
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAExit@AOAProtected@@QAEXXZ		; AOAProtected::AOAExit
$L3365:
; Line 1172
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 388				; 00000184H
	call	?empty@WStack@@QAEHXZ			; WStack::empty
	test	eax, eax
	jne	$L3366
; Line 1174
	lea	eax, DWORD PTR _taskid$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 388				; 00000184H
	call	?pop@WStack@@QAEHPAH@Z			; WStack::pop
; Line 1176
	mov	ecx, DWORD PTR _taskid$[ebp]
	cmp	ecx, DWORD PTR ?MinTaskId@apptask@@2JA	; apptask::MinTaskId
	jl	SHORT $L3368
	mov	edx, DWORD PTR _taskid$[ebp]
	cmp	edx, DWORD PTR ?MaxTaskId@apptask@@2JA	; apptask::MaxTaskId
	jle	SHORT $L3367
$L3368:
; Line 1178
	push	3540					; 00000dd4H
	push	OFFSET FLAT:$SG3369
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1179
	mov	eax, -1000				; fffffc18H
	jmp	$L3362
$L3367:
; Line 1182
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 396				; 0000018cH
	call	?full@WCirList@@QAEHXZ			; WCirList::full
	test	eax, eax
	jne	SHORT $L3370
; Line 1184
	mov	eax, DWORD PTR _timerc$[ebp]
	push	eax
	mov	ecx, DWORD PTR _tcbrno$[ebp]
	push	ecx
	push	5
	push	0
	mov	edx, DWORD PTR _taskid$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 396				; 0000018cH
	call	?insert@WCirList@@QAEHJJJHJ@Z		; WCirList::insert
; Line 1186
	mov	eax, 1
	test	eax, eax
	je	SHORT $L3371
; Line 1187
	push	1
	mov	ecx, DWORD PTR _taskid$[ebp]
	sub	ecx, DWORD PTR ?MinTaskId@apptask@@2JA	; apptask::MinTaskId
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 404				; 00000194H
	call	?insert@WTTrace@@QAEHHG@Z		; WTTrace::insert
$L3371:
; Line 1189
	jmp	SHORT $L3372
$L3370:
; Line 1190
	push	3840					; 00000f00H
	push	OFFSET FLAT:$SG3373
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
$L3372:
; Line 1192
	jmp	SHORT $L3374
$L3366:
; Line 1195
	push	3540					; 00000dd4H
	push	OFFSET FLAT:$SG3375
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1196
	mov	DWORD PTR ?Application_Status@AOAProtected@@2HA, 2 ; AOAProtected::Application_Status
; Line 1197
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAExit@AOAProtected@@QAEXXZ		; AOAProtected::AOAExit
$L3374:
; Line 1203
	xor	eax, eax
$L3362:
; Line 1204
	mov	esp, ebp
	pop	ebp
	ret	8
?insertHttpTask@apptask@@QAEHHJ@Z ENDP			; apptask::insertHttpTask
_TEXT	ENDS
PUBLIC	?ErrorHandler@apptask@@QAEXJ@Z			; apptask::ErrorHandler
EXTRN	?AOAgetSharedMemTraceString@AOAProtected@@QAEXPAD@Z:NEAR ; AOAProtected::AOAgetSharedMemTraceString
EXTRN	?AOAgetMem@AOAProtected@@QAEJJ@Z:NEAR		; AOAProtected::AOAgetMem
EXTRN	?AOAgetStackPOP@AOAProtected@@QAEJH@Z:NEAR	; AOAProtected::AOAgetStackPOP
EXTRN	?AOAgetCharacter@AOAProtected@@QAEDXZ:NEAR	; AOAProtected::AOAgetCharacter
EXTRN	?AOAgetCharacterInt@AOAProtected@@QAEDXZ:NEAR	; AOAProtected::AOAgetCharacterInt
EXTRN	?AOAsti@AOAProtected@@QAEXXZ:NEAR		; AOAProtected::AOAsti
EXTRN	?AOAgetHex@AOAProtected@@QAEHXZ:NEAR		; AOAProtected::AOAgetHex
EXTRN	?AOAclearScreen@AOAProtected@@QAEXHH@Z:NEAR	; AOAProtected::AOAclearScreen
_DATA	SEGMENT
	ORG $+2
$SG3387	DB	'                ', 00H
	ORG $+3
$SG3389	DB	'ERROR!', 00H
	ORG $+1
$SG3390	DB	'Interrupt Code:', 00H
$SG3391	DB	'Current Task: ', 00H
	ORG $+1
$SG3392	DB	'Fn_Code:', 00H
	ORG $+3
$SG3393	DB	'CalledMethod: ', 00H
	ORG $+1
$SG3394	DB	'STACK: ', 00H
$SG3398	DB	'Registers: ', 00H
$SG3402	DB	'Enter Starting Address of Location: ', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -84
_EO$ = -20
_k$ = -72
_data1$ = -12
_startAddr$ = -80
_a$ = -8
_errorFlag$ = -76
_TraceStr$ = -4
_task$ = -68
?ErrorHandler@apptask@@QAEXJ@Z PROC NEAR		; apptask::ErrorHandler
; Line 1220
	push	ebp
	mov	ebp, esp
	sub	esp, 84					; 00000054H
	mov	DWORD PTR _this$[ebp], ecx
; Line 1221
	lea	ecx, DWORD PTR _EO$[ebp]
	call	??0EtherObj@@QAE@XZ			; EtherObj::EtherObj
; Line 1222
	mov	DWORD PTR _k$[ebp], 0
; Line 1223
	mov	DWORD PTR _data1$[ebp], 0
; Line 1224
	mov	DWORD PTR _startAddr$[ebp], 0
; Line 1226
	mov	DWORD PTR _errorFlag$[ebp], 0
; Line 1227
	mov	DWORD PTR _TraceStr$[ebp], OFFSET FLAT:$SG3387
; Line 1228
	lea	ecx, DWORD PTR _task$[ebp]
	call	??0AOATask@@QAE@XZ			; AOATask::AOATask
; Line 1230
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsti@AOAProtected@@QAEXXZ		; AOAProtected::AOAsti
; Line 1232
	push	160					; 000000a0H
	push	OFFSET FLAT:$SG3389
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1234
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	BYTE PTR _a$[ebp], al
; Line 1235
	push	4000					; 00000fa0H
	push	0
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAclearScreen@AOAProtected@@QAEXHH@Z	; AOAProtected::AOAclearScreen
; Line 1237
	push	28					; 0000001cH
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetSharedMem@AOAProtected@@QAEJH@Z	; AOAProtected::AOAgetSharedMem
	mov	DWORD PTR _errorFlag$[ebp], eax
; Line 1238
	push	180					; 000000b4H
	push	OFFSET FLAT:$SG3390
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1239
	push	210					; 000000d2H
	mov	eax, DWORD PTR _errorFlag$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1240
	push	232					; 000000e8H
	push	OFFSET FLAT:$SG3391
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1241
	push	258					; 00000102H
	mov	ecx, DWORD PTR ?Current_Task@apptask@@2HA ; apptask::Current_Task
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1242
	push	32					; 00000020H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetSharedMem@AOAProtected@@QAEJH@Z	; AOAProtected::AOAgetSharedMem
	mov	DWORD PTR _errorFlag$[ebp], eax
; Line 1243
	push	280					; 00000118H
	push	OFFSET FLAT:$SG3392
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1244
	push	298					; 0000012aH
	mov	edx, DWORD PTR _errorFlag$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1245
	push	320					; 00000140H
	push	OFFSET FLAT:$SG3393
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1248
	mov	eax, DWORD PTR _TraceStr$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetSharedMemTraceString@AOAProtected@@QAEXPAD@Z ; AOAProtected::AOAgetSharedMemTraceString
; Line 1249
	push	350					; 0000015eH
	mov	ecx, DWORD PTR _TraceStr$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1250
	push	76					; 0000004cH
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetSharedMem@AOAProtected@@QAEJH@Z	; AOAProtected::AOAgetSharedMem
	mov	DWORD PTR _errorFlag$[ebp], eax
; Line 1251
	push	580					; 00000244H
	mov	edx, DWORD PTR _errorFlag$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1252
	push	96					; 00000060H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetSharedMem@AOAProtected@@QAEJH@Z	; AOAProtected::AOAgetSharedMem
	mov	DWORD PTR _errorFlag$[ebp], eax
; Line 1253
	push	600					; 00000258H
	mov	eax, DWORD PTR _errorFlag$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1255
	push	480					; 000001e0H
	push	OFFSET FLAT:$SG3394
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1258
	mov	DWORD PTR _k$[ebp], 0
	jmp	SHORT $L3395
$L3396:
	mov	ecx, DWORD PTR _k$[ebp]
	add	ecx, 1
	mov	DWORD PTR _k$[ebp], ecx
$L3395:
	cmp	DWORD PTR _k$[ebp], 48			; 00000030H
	jge	SHORT $L3397
; Line 1263
	mov	edx, DWORD PTR _k$[ebp]
	shl	edx, 2
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetStackPOP@AOAProtected@@QAEJH@Z	; AOAProtected::AOAgetStackPOP
	mov	DWORD PTR _data1$[ebp], eax
; Line 1264
	mov	eax, DWORD PTR _k$[ebp]
	imul	eax, 20					; 00000014H
	add	eax, 640				; 00000280H
	push	eax
	mov	ecx, DWORD PTR _data1$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1265
	jmp	SHORT $L3396
$L3397:
; Line 1268
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	BYTE PTR _a$[ebp], al
; Line 1270
	push	1120					; 00000460H
	push	OFFSET FLAT:$SG3398
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1276
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	BYTE PTR _a$[ebp], al
; Line 1278
	mov	BYTE PTR _a$[ebp], 0
$L3400:
; Line 1279
	movsx	edx, BYTE PTR _a$[ebp]
	cmp	edx, 27					; 0000001bH
	je	$L3401
; Line 1281
	push	3840					; 00000f00H
	push	OFFSET FLAT:$SG3402
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1282
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetHex@AOAProtected@@QAEHXZ		; AOAProtected::AOAgetHex
	mov	DWORD PTR _startAddr$[ebp], eax
; Line 1283
	push	4000					; 00000fa0H
	push	0
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAclearScreen@AOAProtected@@QAEXHH@Z	; AOAProtected::AOAclearScreen
; Line 1285
	mov	DWORD PTR _k$[ebp], 0
	jmp	SHORT $L3403
$L3404:
	mov	eax, DWORD PTR _k$[ebp]
	add	eax, 1
	mov	DWORD PTR _k$[ebp], eax
$L3403:
	cmp	DWORD PTR _k$[ebp], 128			; 00000080H
	jge	SHORT $L3405
; Line 1287
	mov	ecx, DWORD PTR _k$[ebp]
	mov	edx, DWORD PTR _startAddr$[ebp]
	lea	eax, DWORD PTR [edx+ecx*4]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetMem@AOAProtected@@QAEJJ@Z	; AOAProtected::AOAgetMem
	mov	DWORD PTR _data1$[ebp], eax
; Line 1288
	mov	ecx, DWORD PTR _k$[ebp]
	imul	ecx, 20					; 00000014H
	add	ecx, 320				; 00000140H
	push	ecx
	mov	edx, DWORD PTR _data1$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1289
	jmp	SHORT $L3404
$L3405:
; Line 1290
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacterInt@AOAProtected@@QAEDXZ ; AOAProtected::AOAgetCharacterInt
	mov	BYTE PTR _a$[ebp], al
; Line 1291
	jmp	$L3400
$L3401:
; Line 1293
	lea	ecx, DWORD PTR _task$[ebp]
	call	?AOAapplink32@AOATask@@QAEHXZ		; AOATask::AOAapplink32
; Line 1294
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAExit@AOAProtected@@QAEXXZ		; AOAProtected::AOAExit
; Line 1295
	mov	esp, ebp
	pop	ebp
	ret	4
?ErrorHandler@apptask@@QAEXJ@Z ENDP			; apptask::ErrorHandler
_TEXT	ENDS
PUBLIC	?printStatistics@apptask@@QAEXXZ		; apptask::printStatistics
EXTRN	?GetCount@TCPObj@@2KA:DWORD			; TCPObj::GetCount
EXTRN	?SynCount@TCPObj@@2KA:DWORD			; TCPObj::SynCount
EXTRN	?SynAckCount@TCPObj@@2KA:DWORD			; TCPObj::SynAckCount
EXTRN	?MaxSynGetTime@TCPObj@@2KA:DWORD		; TCPObj::MaxSynGetTime
EXTRN	?TotalSynGetTime@TCPObj@@2KA:DWORD		; TCPObj::TotalSynGetTime
EXTRN	?MaxConnectionTime@TCPObj@@2KA:DWORD		; TCPObj::MaxConnectionTime
EXTRN	?MaxSynGetThreshCount@TCPObj@@2KA:DWORD		; TCPObj::MaxSynGetThreshCount
EXTRN	?NoOfRetransmissions@TCPObj@@2KA:DWORD		; TCPObj::NoOfRetransmissions
_DATA	SEGMENT
	ORG $+3
$SG3410	DB	'HttpRequests:', 00H
	ORG $+2
$SG3411	DB	'GetCount:', 00H
	ORG $+2
$SG3412	DB	'SynCount:', 00H
	ORG $+2
$SG3413	DB	'SynAckCount:', 00H
	ORG $+3
$SG3414	DB	'MaxSynGetTime:', 00H
	ORG $+1
$SG3415	DB	'MaxConnectionTime:', 00H
	ORG $+1
$SG3416	DB	'MaxNoOfTasksUsed:', 00H
	ORG $+2
$SG3417	DB	'MaxNoOfTCBsUsed:', 00H
	ORG $+3
$SG3418	DB	'UpCNotSetCount:', 00H
$SG3419	DB	'NotForTNoddeCount:', 00H
	ORG $+1
$SG3420	DB	'NotARPIPCount:', 00H
	ORG $+1
$SG3421	DB	'MaxSynGetThresCount:', 00H
	ORG $+3
$SG3422	DB	'NoOfRetransmissions', 00H
$SG3423	DB	'AverageSynGetTime', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -360
_tcp$ = -356
?printStatistics@apptask@@QAEXXZ PROC NEAR		; apptask::printStatistics
; Line 1300
	push	ebp
	mov	ebp, esp
	sub	esp, 360				; 00000168H
	mov	DWORD PTR _this$[ebp], ecx
; Line 1301
	lea	ecx, DWORD PTR _tcp$[ebp]
	call	??0TCPObj@@QAE@XZ			; TCPObj::TCPObj
; Line 1303
	push	1758					; 000006deH
	push	0
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAclearScreen@AOAProtected@@QAEXHH@Z	; AOAProtected::AOAclearScreen
; Line 1305
	push	480					; 000001e0H
	push	OFFSET FLAT:$SG3410
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1306
	push	520					; 00000208H
	mov	eax, DWORD PTR ?HttpRequests@TCPObj@@2KA ; TCPObj::HttpRequests
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1307
	push	560					; 00000230H
	push	OFFSET FLAT:$SG3411
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1308
	push	600					; 00000258H
	mov	ecx, DWORD PTR ?GetCount@TCPObj@@2KA	; TCPObj::GetCount
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1310
	push	640					; 00000280H
	push	OFFSET FLAT:$SG3412
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1311
	push	680					; 000002a8H
	mov	edx, DWORD PTR ?SynCount@TCPObj@@2KA	; TCPObj::SynCount
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1312
	push	720					; 000002d0H
	push	OFFSET FLAT:$SG3413
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1313
	push	760					; 000002f8H
	mov	eax, DWORD PTR ?SynAckCount@TCPObj@@2KA	; TCPObj::SynAckCount
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1315
	push	800					; 00000320H
	push	OFFSET FLAT:$SG3414
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1316
	push	840					; 00000348H
	mov	ecx, DWORD PTR ?MaxSynGetTime@TCPObj@@2KA ; TCPObj::MaxSynGetTime
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1317
	push	880					; 00000370H
	push	OFFSET FLAT:$SG3415
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1318
	push	920					; 00000398H
	mov	edx, DWORD PTR ?MaxConnectionTime@TCPObj@@2KA ; TCPObj::MaxConnectionTime
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1320
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG3416
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1321
	push	1000					; 000003e8H
	mov	eax, DWORD PTR ?MaxNoOfTasksUsed@TCPObj@@2KA ; TCPObj::MaxNoOfTasksUsed
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1322
	push	1040					; 00000410H
	push	OFFSET FLAT:$SG3417
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1323
	push	1080					; 00000438H
	mov	ecx, DWORD PTR ?MaxNoOfTCBsUsed@TCPObj@@2KA ; TCPObj::MaxNoOfTCBsUsed
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1325
	push	1120					; 00000460H
	push	OFFSET FLAT:$SG3418
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1326
	push	1160					; 00000488H
	mov	edx, DWORD PTR ?upCompleteNotSetCount@apptask@@2JA ; apptask::upCompleteNotSetCount
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1327
	push	1200					; 000004b0H
	push	OFFSET FLAT:$SG3419
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1328
	push	1240					; 000004d8H
	mov	eax, DWORD PTR ?notForThisNodeCount@apptask@@2JA ; apptask::notForThisNodeCount
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1330
	push	1280					; 00000500H
	push	OFFSET FLAT:$SG3420
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1331
	push	1320					; 00000528H
	mov	ecx, DWORD PTR ?notArpOrIpCount@apptask@@2JA ; apptask::notArpOrIpCount
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1332
	push	1360					; 00000550H
	push	OFFSET FLAT:$SG3421
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1333
	push	1400					; 00000578H
	mov	edx, DWORD PTR ?MaxSynGetThreshCount@TCPObj@@2KA ; TCPObj::MaxSynGetThreshCount
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1335
	push	1440					; 000005a0H
	push	OFFSET FLAT:$SG3422
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1336
	push	1480					; 000005c8H
	mov	eax, DWORD PTR ?NoOfRetransmissions@TCPObj@@2KA ; TCPObj::NoOfRetransmissions
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1338
	push	1520					; 000005f0H
	push	OFFSET FLAT:$SG3423
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1339
	push	1560					; 00000618H
	mov	ecx, DWORD PTR ?TotalSynGetTime@TCPObj@@2KA ; TCPObj::TotalSynGetTime
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1341
	mov	esp, ebp
	pop	ebp
	ret	0
?printStatistics@apptask@@QAEXXZ ENDP			; apptask::printStatistics
_TEXT	ENDS
PUBLIC	?checkErrors@apptask@@QAEXXZ			; apptask::checkErrors
EXTRN	?getICR@EtherObj@@QAEHXZ:NEAR			; EtherObj::getICR
EXTRN	?RDLfull@EtherObj@@QAEHXZ:NEAR			; EtherObj::RDLfull
EXTRN	?getRDTail@EtherObj@@QAEHXZ:NEAR		; EtherObj::getRDTail
_DATA	SEGMENT
	ORG $+2
$SG3430	DB	'MainTask: Receive Over Run Error Caused an Interrrupt!', 00H
	ORG $+1
$SG3432	DB	'MainTask: RDL Buffer is full!', 00H
	ORG $+2
$SG3434	DB	'MainTask: Problem with RDL descriptors', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -16
_rcvcount$ = -12
_EO$ = -8
?checkErrors@apptask@@QAEXXZ PROC NEAR			; apptask::checkErrors
; Line 1346
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	mov	DWORD PTR _this$[ebp], ecx
; Line 1347
	mov	DWORD PTR _rcvcount$[ebp], 0
; Line 1348
	lea	ecx, DWORD PTR _EO$[ebp]
	call	??0EtherObj@@QAE@XZ			; EtherObj::EtherObj
; Line 1350
	lea	ecx, DWORD PTR _EO$[ebp]
	call	?getICR@EtherObj@@QAEHXZ		; EtherObj::getICR
	mov	DWORD PTR _rcvcount$[ebp], eax
; Line 1351
	mov	eax, DWORD PTR _rcvcount$[ebp]
	and	eax, 64					; 00000040H
	cmp	eax, 1
	jne	SHORT $L3429
; Line 1353
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG3430
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1354
	push	3800					; 00000ed8H
	mov	ecx, DWORD PTR _rcvcount$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
$L3429:
; Line 1357
	lea	ecx, DWORD PTR _EO$[ebp]
	call	?RDLfull@EtherObj@@QAEHXZ		; EtherObj::RDLfull
	test	eax, eax
	je	SHORT $L3431
; Line 1359
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG3432
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1360
	push	3760					; 00000eb0H
	mov	edx, DWORD PTR ?ReceiveOutPtr@EtherObj@@2JA ; EtherObj::ReceiveOutPtr
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1361
	push	3780					; 00000ec4H
	lea	ecx, DWORD PTR _EO$[ebp]
	call	?getRDTail@EtherObj@@QAEHXZ		; EtherObj::getRDTail
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
$L3431:
; Line 1364
	cmp	DWORD PTR ?ReceiveOutPtr@EtherObj@@2JA, 4096 ; EtherObj::ReceiveOutPtr, 00001000H
	jle	SHORT $L3433
; Line 1366
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG3434
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
$L3433:
; Line 1368
	mov	esp, ebp
	pop	ebp
	ret	0
?checkErrors@apptask@@QAEXXZ ENDP			; apptask::checkErrors
_TEXT	ENDS
PUBLIC	?getFunctionPtrOthers@@YAPAJP8apptask@@AEXJ@Z@Z	; getFunctionPtrOthers
EXTRN	?init@ARPObj@@QAEXPAD000@Z:NEAR			; ARPObj::init
EXTRN	?init@IPObj@@QAEXPAD@Z:NEAR			; IPObj::init
EXTRN	?init@UDPObj@@QAEXPADG@Z:NEAR			; UDPObj::init
EXTRN	?init@FTPObj@@QAEHKKHHPADG@Z:NEAR		; FTPObj::init
EXTRN	??0IntException@@QAE@XZ:NEAR			; IntException::IntException
EXTRN	?init@WTTrace@@QAEHHH@Z:NEAR			; WTTrace::init
EXTRN	?AOAprintCharacter@AOAProtected@@QAEHDH@Z:NEAR	; AOAProtected::AOAprintCharacter
EXTRN	?sizeOfTCBRecord@TCPObj@@2HA:DWORD		; TCPObj::sizeOfTCBRecord
EXTRN	?initRecord@TCPObj@@QAEHXZ:NEAR			; TCPObj::initRecord
EXTRN	?init@TCPObj@@QAEHQAD0000GJJJJ@Z:NEAR		; TCPObj::init
EXTRN	?AOAenableIRQCntlr@AOAProtected@@QAEHHG@Z:NEAR	; AOAProtected::AOAenableIRQCntlr
EXTRN	?init@FTOPObj@@QAEHXZ:NEAR			; FTOPObj::init
EXTRN	?init@WCirList@@QAEHJJ@Z:NEAR			; WCirList::init
EXTRN	?init@WStack@@QAEHJH@Z:NEAR			; WStack::init
EXTRN	?push@WStack@@QAEHH@Z:NEAR			; WStack::push
EXTRN	?full@WStack@@QAEHXZ:NEAR			; WStack::full
EXTRN	?setBaseAddress@EtherObj@@QAEXH@Z:NEAR		; EtherObj::setBaseAddress
EXTRN	?getBaseAddress@EtherObj@@QAEHXZ:NEAR		; EtherObj::getBaseAddress
EXTRN	?ColdReset@EtherObj@@QAEHXZ:NEAR		; EtherObj::ColdReset
EXTRN	?inittest@EtherObj@@QAEHJJJJPAD@Z:NEAR		; EtherObj::inittest
EXTRN	?TEnable@EtherObj@@QAEHXZ:NEAR			; EtherObj::TEnable
EXTRN	?REnable@EtherObj@@QAEHXZ:NEAR			; EtherObj::REnable
_DATA	SEGMENT
	ORG $+1
$SG3488	DB	'test.cpp stack is full', 00H
	ORG $+1
$SG3490	DB	'Memory is not sufficient for creating tcb records', 00H
	ORG $+2
$SG3491	DB	'Initialized Objects', 00H
$SG3495	DB	'Press ny key to load the Resources...', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -1892
_EO$ = -456
_arp$ = -1888
_tcp$ = -1244
_udp$ = -1600
_ip$ = -876
_ftp$ = -804
_fto$ = -480
_cir$ = -1268
_stk$ = -888
_intex$ = -440
_task$ = -856
_tcbsize$ = -1284
_SubNetMask$ = -1260
_SrcPort$ = -1252
_port$ = -1280
_sport$ = -464
_starthttptaskno$ = -880
_endhttptaskno$ = -808
_HTTPListInitStatus$ = -460
_state$ = -448
_retcode$ = -408
_id$ = -1276
_v2$ = -404
_i$ = -484
_c$ = -420
_Task_ID$ = -416
_serverid$ = -412
_Function_Address_Array$ = -400
_Function_Ptr_X$ = -1288
?createOtherTasks@apptask@@QAEXXZ PROC NEAR		; apptask::createOtherTasks
; Line 1373
	push	ebp
	mov	ebp, esp
	sub	esp, 1892				; 00000764H
	mov	DWORD PTR _this$[ebp], ecx
; Line 1374
	lea	ecx, DWORD PTR _EO$[ebp]
	call	??0EtherObj@@QAE@XZ			; EtherObj::EtherObj
; Line 1375
	lea	ecx, DWORD PTR _arp$[ebp]
	call	??0ARPObj@@QAE@XZ			; ARPObj::ARPObj
; Line 1376
	lea	ecx, DWORD PTR _tcp$[ebp]
	call	??0TCPObj@@QAE@XZ			; TCPObj::TCPObj
; Line 1377
	lea	ecx, DWORD PTR _udp$[ebp]
	call	??0UDPObj@@QAE@XZ			; UDPObj::UDPObj
; Line 1378
	lea	ecx, DWORD PTR _ip$[ebp]
	call	??0IPObj@@QAE@XZ			; IPObj::IPObj
; Line 1380
	lea	ecx, DWORD PTR _ftp$[ebp]
	call	??0FTPObj@@QAE@XZ			; FTPObj::FTPObj
; Line 1381
	lea	ecx, DWORD PTR _fto$[ebp]
	call	??0FTOPObj@@QAE@XZ			; FTOPObj::FTOPObj
; Line 1383
	lea	ecx, DWORD PTR _cir$[ebp]
	call	??0WCirList@@QAE@XZ			; WCirList::WCirList
; Line 1384
	lea	ecx, DWORD PTR _stk$[ebp]
	call	??0WStack@@QAE@XZ			; WStack::WStack
; Line 1386
	lea	ecx, DWORD PTR _intex$[ebp]
	call	??0IntException@@QAE@XZ			; IntException::IntException
; Line 1387
	lea	ecx, DWORD PTR _task$[ebp]
	call	??0AOATask@@QAE@XZ			; AOATask::AOATask
; Line 1388
	mov	DWORD PTR _tcbsize$[ebp], 0
; Line 1394
	mov	BYTE PTR _SubNetMask$[ebp], -1
	mov	BYTE PTR _SubNetMask$[ebp+1], -1
	mov	BYTE PTR _SubNetMask$[ebp+2], -1
	mov	BYTE PTR _SubNetMask$[ebp+3], 0
; Line 1397
	mov	WORD PTR _SrcPort$[ebp], 80		; 00000050H
; Line 1400
	mov	WORD PTR _port$[ebp], 5008		; 00001390H
; Line 1401
	mov	WORD PTR _sport$[ebp], 5000		; 00001388H
; Line 1402
	mov	DWORD PTR _starthttptaskno$[ebp], 0
; Line 1403
	mov	DWORD PTR _endhttptaskno$[ebp], 0
; Line 1404
	mov	DWORD PTR _HTTPListInitStatus$[ebp], 0
; Line 1406
	mov	DWORD PTR _state$[ebp], 0
; Line 1407
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1408
	mov	DWORD PTR _id$[ebp], 0
; Line 1409
	mov	DWORD PTR _v2$[ebp], 0
; Line 1410
	mov	DWORD PTR _i$[ebp], 0
; Line 1420
	mov	DWORD PTR _serverid$[ebp], 0
; Line 1438
	push	4000					; 00000fa0H
	push	110590016				; 06977840H
	lea	ecx, DWORD PTR _stk$[ebp]
	call	?init@WStack@@QAEHJH@Z			; WStack::init
; Line 1440
	push	8000					; 00001f40H
	push	111736128				; 06a8f540H
	lea	ecx, DWORD PTR _cir$[ebp]
	call	?init@WCirList@@QAEHJJ@Z		; WCirList::init
; Line 1442
	push	4000					; 00000fa0H
	push	191823872				; 0b6f0000H
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 404				; 00000194H
	call	?init@WTTrace@@QAEHHH@Z			; WTTrace::init
; Line 1444
	mov	DWORD PTR _Function_Ptr_X$[ebp], 0
; Line 1449
	mov	DWORD PTR _Function_Ptr_X$[ebp], OFFSET FLAT:?RcvTask@apptask@@QAEXJ@Z ; apptask::RcvTask
; Line 1450
	mov	eax, DWORD PTR _Function_Ptr_X$[ebp]
	push	eax
	call	?getFunctionPtrOthers@@YAPAJP8apptask@@AEXJ@Z@Z ; getFunctionPtrOthers
	add	esp, 4
	mov	DWORD PTR _Function_Address_Array$[ebp+16], eax
; Line 1452
	mov	DWORD PTR _Function_Ptr_X$[ebp], OFFSET FLAT:?InterfaceTask@apptask@@QAEXJ@Z ; apptask::InterfaceTask
; Line 1453
	mov	ecx, DWORD PTR _Function_Ptr_X$[ebp]
	push	ecx
	call	?getFunctionPtrOthers@@YAPAJP8apptask@@AEXJ@Z@Z ; getFunctionPtrOthers
	add	esp, 4
	mov	DWORD PTR _Function_Address_Array$[ebp+20], eax
; Line 1455
	mov	DWORD PTR _Function_Ptr_X$[ebp], OFFSET FLAT:?FileTransferTask@apptask@@QAEXJ@Z ; apptask::FileTransferTask
; Line 1456
	mov	edx, DWORD PTR _Function_Ptr_X$[ebp]
	push	edx
	call	?getFunctionPtrOthers@@YAPAJP8apptask@@AEXJ@Z@Z ; getFunctionPtrOthers
	add	esp, 4
	mov	DWORD PTR _Function_Address_Array$[ebp+24], eax
; Line 1458
	mov	DWORD PTR _Function_Ptr_X$[ebp], OFFSET FLAT:?HttpTask@apptask@@QAEXJ@Z ; apptask::HttpTask
; Line 1459
	mov	eax, DWORD PTR _Function_Ptr_X$[ebp]
	push	eax
	call	?getFunctionPtrOthers@@YAPAJP8apptask@@AEXJ@Z@Z ; getFunctionPtrOthers
	add	esp, 4
	mov	DWORD PTR _Function_Address_Array$[ebp+28], eax
; Line 1464
	push	0
	mov	ecx, DWORD PTR _Function_Address_Array$[ebp+16]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?createTask@apptask@@QAEHJH@Z		; apptask::createTask
	mov	DWORD PTR _Task_ID$[ebp], eax
; Line 1465
	push	0
	mov	edx, DWORD PTR _Function_Address_Array$[ebp+20]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?createTask@apptask@@QAEHJH@Z		; apptask::createTask
	mov	DWORD PTR _Task_ID$[ebp], eax
; Line 1466
	push	0
	mov	eax, DWORD PTR _Function_Address_Array$[ebp+24]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?createTask@apptask@@QAEHJH@Z		; apptask::createTask
	mov	DWORD PTR _Task_ID$[ebp], eax
; Line 1469
	push	0
	mov	ecx, DWORD PTR _Function_Address_Array$[ebp+28]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?createTask@apptask@@QAEHJH@Z		; apptask::createTask
	mov	DWORD PTR _Task_ID$[ebp], eax
; Line 1471
	push	0
	mov	edx, DWORD PTR _Function_Address_Array$[ebp+28]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?createTask@apptask@@QAEHJH@Z		; apptask::createTask
	mov	DWORD PTR _Task_ID$[ebp], eax
; Line 1476
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L3481
$L3482:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L3481:
	cmp	DWORD PTR _i$[ebp], 4000		; 00000fa0H
	jge	SHORT $L3483
; Line 1478
	push	0
	mov	ecx, DWORD PTR _Function_Address_Array$[ebp+28]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?createTask@apptask@@QAEHJH@Z		; apptask::createTask
	mov	DWORD PTR _Task_ID$[ebp], eax
; Line 1479
	cmp	DWORD PTR _i$[ebp], 0
	jne	SHORT $L3485
; Line 1480
	mov	edx, DWORD PTR _Task_ID$[ebp]
	mov	DWORD PTR ?MinTaskId@apptask@@2JA, edx	; apptask::MinTaskId
$L3485:
; Line 1481
	lea	ecx, DWORD PTR _stk$[ebp]
	call	?full@WStack@@QAEHXZ			; WStack::full
	test	eax, eax
	jne	SHORT $L3486
; Line 1483
	mov	eax, DWORD PTR _Task_ID$[ebp]
	push	eax
	lea	ecx, DWORD PTR _stk$[ebp]
	call	?push@WStack@@QAEHH@Z			; WStack::push
; Line 1485
	jmp	SHORT $L3487
$L3486:
; Line 1486
	push	3840					; 00000f00H
	push	OFFSET FLAT:$SG3488
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
$L3487:
; Line 1487
	jmp	$L3482
$L3483:
; Line 1489
	mov	ecx, DWORD PTR _Task_ID$[ebp]
	mov	DWORD PTR ?MaxTaskId@apptask@@2JA, ecx	; apptask::MaxTaskId
; Line 1493
	push	156					; 0000009cH
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetSharedMem@AOAProtected@@QAEJH@Z	; AOAProtected::AOAgetSharedMem
	mov	DWORD PTR _id$[ebp], eax
; Line 1494
	mov	edx, DWORD PTR _id$[ebp]
	push	edx
	lea	ecx, DWORD PTR _EO$[ebp]
	call	?setBaseAddress@EtherObj@@QAEXH@Z	; EtherObj::setBaseAddress
; Line 1495
	mov	DWORD PTR _id$[ebp], 0
; Line 1496
	lea	ecx, DWORD PTR _EO$[ebp]
	call	?getBaseAddress@EtherObj@@QAEHXZ	; EtherObj::getBaseAddress
	mov	DWORD PTR _id$[ebp], eax
; Line 1497
	push	3840					; 00000f00H
	mov	eax, DWORD PTR _id$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1501
	lea	ecx, DWORD PTR _EO$[ebp]
	call	?ColdReset@EtherObj@@QAEHXZ		; EtherObj::ColdReset
	mov	DWORD PTR _retcode$[ebp], eax
; Line 1503
	push	OFFSET FLAT:?SrcMAC@apptask@@2PADA	; apptask::SrcMAC
	push	48735744				; 02e7a600H
	push	37987840				; 0243a600H
	push	39233024				; 0256a600H
	push	36742656				; 0230a600H
	lea	ecx, DWORD PTR _EO$[ebp]
	call	?inittest@EtherObj@@QAEHJJJJPAD@Z	; EtherObj::inittest
	mov	DWORD PTR _retcode$[ebp], eax
; Line 1505
	lea	ecx, DWORD PTR _EO$[ebp]
	call	?TEnable@EtherObj@@QAEHXZ		; EtherObj::TEnable
	mov	DWORD PTR _retcode$[ebp], eax
; Line 1506
	lea	ecx, DWORD PTR _EO$[ebp]
	call	?REnable@EtherObj@@QAEHXZ		; EtherObj::REnable
	mov	DWORD PTR _retcode$[ebp], eax
; Line 1508
	push	254					; 000000feH
	push	1
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAenableIRQCntlr@AOAProtected@@QAEHHG@Z ; AOAProtected::AOAenableIRQCntlr
; Line 1510
	lea	ecx, DWORD PTR _fto$[ebp]
	call	?init@FTOPObj@@QAEHXZ			; FTOPObj::init
; Line 1511
	push	1
	lea	ecx, DWORD PTR _fto$[ebp]
	call	?setMode@FTOPObj@@QAEXH@Z		; FTOPObj::setMode
; Line 1513
	push	OFFSET FLAT:?SrcMAC@apptask@@2PADA	; apptask::SrcMAC
	push	OFFSET FLAT:?GateWayIP@apptask@@2PADA	; apptask::GateWayIP
	lea	ecx, DWORD PTR _SubNetMask$[ebp]
	push	ecx
	push	OFFSET FLAT:?SrcIP@apptask@@2PADA	; apptask::SrcIP
	lea	ecx, DWORD PTR _arp$[ebp]
	call	?init@ARPObj@@QAEXPAD000@Z		; ARPObj::init
; Line 1514
	push	OFFSET FLAT:?SrcIP@apptask@@2PADA	; apptask::SrcIP
	lea	ecx, DWORD PTR _ip$[ebp]
	call	?init@IPObj@@QAEXPAD@Z			; IPObj::init
; Line 1518
	lea	ecx, DWORD PTR _tcp$[ebp]
	call	?initRecord@TCPObj@@QAEHXZ		; TCPObj::initRecord
	mov	DWORD PTR _retcode$[ebp], eax
; Line 1519
	mov	edx, DWORD PTR ?sizeOfTCBRecord@TCPObj@@2HA ; TCPObj::sizeOfTCBRecord
	imul	edx, 20000				; 00004e20H
	add	edx, 40000				; 00009c40H
	mov	DWORD PTR _tcbsize$[ebp], edx
; Line 1521
	push	10000					; 00002710H
	push	20000					; 00004e20H
	mov	eax, DWORD PTR _tcbsize$[ebp]
	push	eax
	push	60475904				; 039aca00H
	mov	cx, WORD PTR _SrcPort$[ebp]
	push	ecx
	push	OFFSET FLAT:?GateWayMAC@apptask@@2PADA	; apptask::GateWayMAC
	push	OFFSET FLAT:?GateWayIP@apptask@@2PADA	; apptask::GateWayIP
	lea	edx, DWORD PTR _SubNetMask$[ebp]
	push	edx
	push	OFFSET FLAT:?SrcMAC@apptask@@2PADA	; apptask::SrcMAC
	push	OFFSET FLAT:?SrcIP@apptask@@2PADA	; apptask::SrcIP
	lea	ecx, DWORD PTR _tcp$[ebp]
	call	?init@TCPObj@@QAEHQAD0000GJJJJ@Z	; TCPObj::init
	mov	DWORD PTR _retcode$[ebp], eax
; Line 1522
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L3489
; Line 1524
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG3490
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1525
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAExit@AOAProtected@@QAEXXZ		; AOAProtected::AOAExit
$L3489:
; Line 1536
	mov	ax, WORD PTR _port$[ebp]
	push	eax
	push	OFFSET FLAT:?FTPServerIP@apptask@@2PADA	; apptask::FTPServerIP
	push	1000					; 000003e8H
	push	10000					; 00002710H
	push	67108864				; 04000000H
	push	134217728				; 08000000H
	lea	ecx, DWORD PTR _ftp$[ebp]
	call	?init@FTPObj@@QAEHKKHHPADG@Z		; FTPObj::init
; Line 1542
	mov	cx, WORD PTR _sport$[ebp]
	push	ecx
	push	OFFSET FLAT:?SrcIP@apptask@@2PADA	; apptask::SrcIP
	lea	ecx, DWORD PTR _udp$[ebp]
	call	?init@UDPObj@@QAEXPADG@Z		; UDPObj::init
; Line 1546
	push	1120					; 00000460H
	push	OFFSET FLAT:$SG3491
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1549
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L3492
$L3493:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L3492:
	cmp	DWORD PTR _i$[ebp], 4000		; 00000fa0H
	jge	SHORT $L3494
; Line 1551
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	push	32					; 00000020H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintCharacter@AOAProtected@@QAEHDH@Z ; AOAProtected::AOAprintCharacter
; Line 1553
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
; Line 1554
	jmp	SHORT $L3493
$L3494:
; Line 1556
	push	1600					; 00000640H
	push	OFFSET FLAT:$SG3495
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1557
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	BYTE PTR _c$[ebp], al
; Line 1558
	mov	esp, ebp
	pop	ebp
	ret	0
?createOtherTasks@apptask@@QAEXXZ ENDP			; apptask::createOtherTasks
_abc2$ = 8
_ab1$ = -428
_xyz$ = -4
_abc1$ = -424
_first$ = -420
?getFunctionPtrOthers@@YAPAJP8apptask@@AEXJ@Z@Z PROC NEAR ; getFunctionPtrOthers
; Line 1562
	push	ebp
	mov	ebp, esp
	sub	esp, 428				; 000001acH
; Line 1569
	lea	ecx, DWORD PTR _first$[ebp]
	call	??0apptask@@QAE@XZ			; apptask::apptask
; Line 1570
	lea	eax, DWORD PTR _first$[ebp]
	mov	DWORD PTR _xyz$[ebp], eax
; Line 1571
	mov	ecx, DWORD PTR _abc2$[ebp]
	mov	DWORD PTR _abc1$[ebp], ecx
; Line 1572
	mov	edx, DWORD PTR _xyz$[ebp]
	sub	edx, 4
	mov	DWORD PTR _xyz$[ebp], edx
; Line 1573
	mov	eax, DWORD PTR _xyz$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _ab1$[ebp], ecx
; Line 1574
	mov	eax, DWORD PTR _ab1$[ebp]
; Line 1575
	mov	esp, ebp
	pop	ebp
	ret	0
?getFunctionPtrOthers@@YAPAJP8apptask@@AEXJ@Z@Z ENDP	; getFunctionPtrOthers
_TEXT	ENDS
PUBLIC	?clearScreen@apptask@@QAEXXZ			; apptask::clearScreen
_DATA	SEGMENT
	ORG $+2
$SG3512	DB	'DOSC Web Server, Running on the bare PC, Towson Universi'
	DB	'ty', 00H
	ORG $+1
$SG3513	DB	'01', 00H
	ORG $+1
$SG3514	DB	'02', 00H
	ORG $+1
$SG3515	DB	'03', 00H
	ORG $+1
$SG3516	DB	'04', 00H
	ORG $+1
$SG3517	DB	'05', 00H
	ORG $+1
$SG3518	DB	'06', 00H
	ORG $+1
$SG3519	DB	'07', 00H
	ORG $+1
$SG3520	DB	'08', 00H
	ORG $+1
$SG3521	DB	'09', 00H
	ORG $+1
$SG3522	DB	'10', 00H
	ORG $+1
$SG3523	DB	'11', 00H
	ORG $+1
$SG3524	DB	'12', 00H
	ORG $+1
$SG3525	DB	'13', 00H
	ORG $+1
$SG3526	DB	'14', 00H
	ORG $+1
$SG3527	DB	'15', 00H
	ORG $+1
$SG3528	DB	'16', 00H
	ORG $+1
$SG3529	DB	'17', 00H
	ORG $+1
$SG3530	DB	'18', 00H
	ORG $+1
$SG3531	DB	'19', 00H
	ORG $+1
$SG3532	DB	'20', 00H
	ORG $+1
$SG3533	DB	'21', 00H
	ORG $+1
$SG3534	DB	'22', 00H
	ORG $+1
$SG3535	DB	'23', 00H
	ORG $+1
$SG3536	DB	'24', 00H
	ORG $+1
$SG3537	DB	'1', 00H
	ORG $+2
$SG3538	DB	'2', 00H
	ORG $+2
$SG3539	DB	'3', 00H
	ORG $+2
$SG3540	DB	'4', 00H
	ORG $+2
$SG3541	DB	'5', 00H
	ORG $+2
$SG3542	DB	'6', 00H
	ORG $+2
$SG3543	DB	'7', 00H
	ORG $+2
$SG3544	DB	'8', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -12
_i$ = -4
_ch$ = -8
?printScreenLayout@apptask@@QAEXXZ PROC NEAR		; apptask::printScreenLayout
; Line 1580
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 1581
	mov	DWORD PTR _i$[ebp], 0
; Line 1582
	mov	BYTE PTR _ch$[ebp], 0
; Line 1584
	mov	ecx, DWORD PTR _this$[ebp]
	call	?clearScreen@apptask@@QAEXXZ		; apptask::clearScreen
; Line 1585
	push	20					; 00000014H
	push	OFFSET FLAT:$SG3512
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1586
	push	160					; 000000a0H
	push	OFFSET FLAT:$SG3513
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1587
	push	320					; 00000140H
	push	OFFSET FLAT:$SG3514
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1588
	push	480					; 000001e0H
	push	OFFSET FLAT:$SG3515
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1589
	push	640					; 00000280H
	push	OFFSET FLAT:$SG3516
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1590
	push	800					; 00000320H
	push	OFFSET FLAT:$SG3517
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1591
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG3518
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1592
	push	1120					; 00000460H
	push	OFFSET FLAT:$SG3519
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1593
	push	1280					; 00000500H
	push	OFFSET FLAT:$SG3520
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1594
	push	1440					; 000005a0H
	push	OFFSET FLAT:$SG3521
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1595
	push	1600					; 00000640H
	push	OFFSET FLAT:$SG3522
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1596
	push	1760					; 000006e0H
	push	OFFSET FLAT:$SG3523
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1597
	push	1920					; 00000780H
	push	OFFSET FLAT:$SG3524
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1598
	push	2080					; 00000820H
	push	OFFSET FLAT:$SG3525
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1599
	push	2240					; 000008c0H
	push	OFFSET FLAT:$SG3526
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1600
	push	2400					; 00000960H
	push	OFFSET FLAT:$SG3527
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1601
	push	2560					; 00000a00H
	push	OFFSET FLAT:$SG3528
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1602
	push	2720					; 00000aa0H
	push	OFFSET FLAT:$SG3529
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1603
	push	2880					; 00000b40H
	push	OFFSET FLAT:$SG3530
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1604
	push	3040					; 00000be0H
	push	OFFSET FLAT:$SG3531
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1605
	push	3200					; 00000c80H
	push	OFFSET FLAT:$SG3532
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1606
	push	3360					; 00000d20H
	push	OFFSET FLAT:$SG3533
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1607
	push	3520					; 00000dc0H
	push	OFFSET FLAT:$SG3534
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1608
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG3535
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1609
	push	3840					; 00000f00H
	push	OFFSET FLAT:$SG3536
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1610
	push	166					; 000000a6H
	push	OFFSET FLAT:$SG3537
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1611
	push	186					; 000000baH
	push	OFFSET FLAT:$SG3538
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1612
	push	206					; 000000ceH
	push	OFFSET FLAT:$SG3539
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1613
	push	226					; 000000e2H
	push	OFFSET FLAT:$SG3540
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1614
	push	246					; 000000f6H
	push	OFFSET FLAT:$SG3541
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1615
	push	266					; 0000010aH
	push	OFFSET FLAT:$SG3542
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1616
	push	286					; 0000011eH
	push	OFFSET FLAT:$SG3543
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1617
	push	306					; 00000132H
	push	OFFSET FLAT:$SG3544
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1618
	mov	esp, ebp
	pop	ebp
	ret	0
?printScreenLayout@apptask@@QAEXXZ ENDP			; apptask::printScreenLayout
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+2
$SG3548	DB	'RCV:', 00H
	ORG $+3
$SG3549	DB	'RcvIPtr', 00H
$SG3550	DB	'RcvOPtr', 00H
$SG3551	DB	'RXSize', 00H
	ORG $+1
$SG3552	DB	'upCnSet', 00H
$SG3553	DB	'notFTnd', 00H
$SG3554	DB	'TaskID', 00H
	ORG $+1
$SG3555	DB	'notArIP', 00H
$SG3556	DB	'ARPcnt', 00H
	ORG $+1
$SG3557	DB	'IPcnt', 00H
	ORG $+2
$SG3558	DB	'SndINPtr', 00H
	ORG $+3
$SG3559	DB	'SndOUTtr', 00H
	ORG $+3
$SG3560	DB	'MAIN:', 00H
	ORG $+2
$SG3561	DB	'runTsk', 00H
	ORG $+1
$SG3562	DB	'CirCnt', 00H
	ORG $+1
$SG3563	DB	'HTTP:', 00H
	ORG $+2
$SG3564	DB	'TaskID', 00H
	ORG $+1
$SG3565	DB	'RetCode', 00H
$SG3566	DB	'HttpCnt', 00H
$SG3567	DB	'TotHTTP', 00H
$SG3568	DB	'State', 00H
	ORG $+2
$SG3569	DB	'Retr', 00H
	ORG $+3
$SG3570	DB	'MaxNTasks', 00H
	ORG $+2
$SG3571	DB	'MaxNTcbs', 00H
	ORG $+3
$SG3572	DB	'TraceCnt', 00H
	ORG $+3
$SG3573	DB	'DelCount', 00H
	ORG $+3
$SG3574	DB	'NoOfRsts', 00H
	ORG $+3
$SG3575	DB	'UnMatReq', 00H
	ORG $+3
$SG3576	DB	'taskDel', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?printScreenTags@apptask@@QAEXXZ PROC NEAR		; apptask::printScreenTags
; Line 1624
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 1625
	push	486					; 000001e6H
	push	OFFSET FLAT:$SG3548
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1626
	push	360					; 00000168H
	push	OFFSET FLAT:$SG3549
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1627
	push	380					; 0000017cH
	push	OFFSET FLAT:$SG3550
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1628
	push	400					; 00000190H
	push	OFFSET FLAT:$SG3551
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1629
	push	420					; 000001a4H
	push	OFFSET FLAT:$SG3552
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1630
	push	440					; 000001b8H
	push	OFFSET FLAT:$SG3553
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1631
	push	460					; 000001ccH
	push	OFFSET FLAT:$SG3554
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1633
	push	660					; 00000294H
	push	OFFSET FLAT:$SG3555
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1634
	push	680					; 000002a8H
	push	OFFSET FLAT:$SG3556
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1635
	push	700					; 000002bcH
	push	OFFSET FLAT:$SG3557
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1636
	push	720					; 000002d0H
	push	OFFSET FLAT:$SG3558
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1637
	push	740					; 000002e4H
	push	OFFSET FLAT:$SG3559
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1639
	push	1446					; 000005a6H
	push	OFFSET FLAT:$SG3560
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1640
	push	1300					; 00000514H
	push	OFFSET FLAT:$SG3561
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1641
	push	1320					; 00000528H
	push	OFFSET FLAT:$SG3562
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1643
	push	1766					; 000006e6H
	push	OFFSET FLAT:$SG3563
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1644
	push	1740					; 000006ccH
	push	OFFSET FLAT:$SG3564
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1645
	push	1640					; 00000668H
	push	OFFSET FLAT:$SG3565
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1646
	push	1660					; 0000067cH
	push	OFFSET FLAT:$SG3566
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1647
	push	1680					; 00000690H
	push	OFFSET FLAT:$SG3567
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1648
	push	1700					; 000006a4H
	push	OFFSET FLAT:$SG3568
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1649
	push	1720					; 000006b8H
	push	OFFSET FLAT:$SG3569
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1650
	push	1940					; 00000794H
	push	OFFSET FLAT:$SG3570
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1651
	push	1960					; 000007a8H
	push	OFFSET FLAT:$SG3571
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1652
	push	1980					; 000007bcH
	push	OFFSET FLAT:$SG3572
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1653
	push	2000					; 000007d0H
	push	OFFSET FLAT:$SG3573
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1654
	push	2020					; 000007e4H
	push	OFFSET FLAT:$SG3574
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1655
	push	2040					; 000007f8H
	push	OFFSET FLAT:$SG3575
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1656
	push	2060					; 0000080cH
	push	OFFSET FLAT:$SG3576
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1657
	mov	esp, ebp
	pop	ebp
	ret	0
?printScreenTags@apptask@@QAEXXZ ENDP			; apptask::printScreenTags
_this$ = -8
_i$ = -4
?clearScreen@apptask@@QAEXXZ PROC NEAR			; apptask::clearScreen
; Line 1662
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 1663
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L3581
$L3582:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L3581:
	cmp	DWORD PTR _i$[ebp], 4000		; 00000fa0H
	jge	SHORT $L3583
; Line 1665
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	push	32					; 00000020H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintCharacter@AOAProtected@@QAEHDH@Z ; AOAProtected::AOAprintCharacter
; Line 1666
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
; Line 1667
	jmp	SHORT $L3582
$L3583:
; Line 1668
	mov	esp, ebp
	pop	ebp
	ret	0
?clearScreen@apptask@@QAEXXZ ENDP			; apptask::clearScreen
_TEXT	ENDS
END
