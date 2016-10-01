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
PUBLIC	?ExitTimer@apptask@@2KA				; apptask::ExitTimer
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
_BSS	SEGMENT
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
?ExitTimer@apptask@@2KA DD 01H DUP (?)			; apptask::ExitTimer
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
_BSS	ENDS
_DATA	SEGMENT
?Current_Task@apptask@@2HA DD 03H			; apptask::Current_Task
?Current_Tcbrno@apptask@@2HA DD 0ffffffffH		; apptask::Current_Tcbrno
_DATA	ENDS
PUBLIC	??0WTTrace@@QAE@XZ				; WTTrace::WTTrace
PUBLIC	??0TCPObj@@QAE@XZ				; TCPObj::TCPObj
PUBLIC	??0FTOPObj@@QAE@XZ				; FTOPObj::FTOPObj
PUBLIC	??0WStack@@QAE@XZ				; WStack::WStack
PUBLIC	??0WCirList@@QAE@XZ				; WCirList::WCirList
PUBLIC	??0apptask@@QAE@XZ				; apptask::apptask
EXTRN	??0AOAProtected@@QAE@XZ:NEAR			; AOAProtected::AOAProtected
EXTRN	??0EtherObj@@QAE@XZ:NEAR			; EtherObj::EtherObj
_TEXT	SEGMENT
_this$ = -4
??0apptask@@QAE@XZ PROC NEAR				; apptask::apptask
; File apptask.cpp
; Line 88
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
; Line 90
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
; Line 96
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
; Line 97
	mov	DWORD PTR ?Current_Task@apptask@@2HA, 3	; apptask::Current_Task
; Line 98
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L2875
$L2876:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L2875:
	cmp	DWORD PTR _i$[ebp], 8000		; 00001f40H
	jge	SHORT $L2877
; Line 100
	mov	ecx, DWORD PTR _i$[ebp]
	mov	DWORD PTR ?Task_Status@apptask@@2PAHA[ecx*4], 0
; Line 101
	mov	edx, DWORD PTR _i$[ebp]
	mov	DWORD PTR ?TaskNextPtr@apptask@@2PAHA[edx*4], 0
; Line 102
	jmp	SHORT $L2876
$L2877:
; Line 103
	mov	DWORD PTR ?packts@apptask@@2JA, 0	; apptask::packts
; Line 104
	mov	DWORD PTR ?svalue@apptask@@2JA, 0	; apptask::svalue
; Line 105
	mov	DWORD PTR ?WSStartTaskNo@apptask@@2HA, 0 ; apptask::WSStartTaskNo
; Line 106
	mov	DWORD PTR ?WSEndTaskNo@apptask@@2HA, 0	; apptask::WSEndTaskNo
; Line 107
	mov	DWORD PTR ?WSFreeTask@apptask@@2HA, 0	; apptask::WSFreeTask
; Line 108
	mov	DWORD PTR ?Application_Status@AOAProtected@@2HA, 1 ; AOAProtected::Application_Status
; Line 109
	mov	DWORD PTR ?rcvstarttime@apptask@@2JA, 0	; apptask::rcvstarttime
; Line 110
	mov	DWORD PTR ?rcvcurtime@apptask@@2JA, 0	; apptask::rcvcurtime
; Line 111
	mov	DWORD PTR ?httpstarttime@apptask@@2JA, 0 ; apptask::httpstarttime
; Line 112
	mov	DWORD PTR ?httpcurtime@apptask@@2JA, 0	; apptask::httpcurtime
; Line 113
	mov	DWORD PTR ?totalstarttime@apptask@@2JA, 0 ; apptask::totalstarttime
; Line 114
	mov	DWORD PTR ?totalcurtime@apptask@@2JA, 0	; apptask::totalcurtime
; Line 115
	mov	DWORD PTR ?Current_Tcbrno@apptask@@2HA, -1 ; apptask::Current_Tcbrno
; Line 133
	mov	DWORD PTR ?ScheduleArray@apptask@@2PAHA, 0
; Line 134
	mov	DWORD PTR ?ScheduleArray@apptask@@2PAHA+4, 0
; Line 135
	mov	DWORD PTR ?ScheduleArray@apptask@@2PAHA+8, 7
; Line 136
	mov	DWORD PTR ?ScheduleArray@apptask@@2PAHA+12, 7
; Line 137
	mov	DWORD PTR ?ScheduleArray@apptask@@2PAHA+16, 4
; Line 138
	mov	DWORD PTR ?ScheduleArray@apptask@@2PAHA+20, 4
; Line 139
	mov	DWORD PTR ?ScheduleArray@apptask@@2PAHA+24, 4
; Line 140
	mov	DWORD PTR ?ScheduleArray@apptask@@2PAHA+28, 4
; Line 142
	mov	DWORD PTR ?MaxTaskId@apptask@@2JA, 0	; apptask::MaxTaskId
; Line 143
	mov	DWORD PTR ?MinTaskId@apptask@@2JA, 0	; apptask::MinTaskId
; Line 144
	mov	DWORD PTR ?ExitTimer@apptask@@2KA, 0	; apptask::ExitTimer
; Line 146
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
$SG2884	DB	' FTOPTimeOut       ', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -16
_time$ = -4
_TraceString$ = -8
_i$ = -12
?FTOPTimeOut@apptask@@QAEXJ@Z PROC NEAR			; apptask::FTOPTimeOut
; Line 151
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	mov	DWORD PTR _this$[ebp], ecx
; Line 152
	mov	DWORD PTR _time$[ebp], 150		; 00000096H
; Line 153
	mov	DWORD PTR _TraceString$[ebp], OFFSET FLAT:$SG2884
; Line 154
	mov	DWORD PTR _i$[ebp], 0
; Line 156
	mov	eax, DWORD PTR _TraceString$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMemTraceString@AOAProtected@@QAEXPAD@Z ; AOAProtected::AOAsetSharedMemTraceString
$L2887:
; Line 157
	cmp	DWORD PTR ?Application_Status@AOAProtected@@2HA, 2 ; AOAProtected::Application_Status
	je	SHORT $L2888
; Line 159
	mov	ecx, DWORD PTR ?Current_Task@apptask@@2HA ; apptask::Current_Task
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 372				; 00000174H
	call	?SendFTOP@FTOPObj@@QAEHH@Z		; FTOPObj::SendFTOP
; Line 161
	jmp	SHORT $L2887
$L2888:
; Line 162
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAExit@AOAProtected@@QAEXXZ		; AOAProtected::AOAExit
; Line 163
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
EXTRN	??0AOATask@@QAE@XZ:NEAR				; AOATask::AOATask
EXTRN	?AOAcompleteTask@AOATask@@QAEXHH@Z:NEAR		; AOATask::AOAcompleteTask
_DATA	SEGMENT
$SG2911	DB	'Message is empty ParserObj: -1', 00H
	ORG $+1
$SG2913	DB	'Method not supported (POST, HEAD) ParserObj: -2', 00H
$SG2915	DB	'Response header does not start with ''/'' ParserObj: -3', 00H
	ORG $+2
$SG2917	DB	'Version number does not start with '' '' ParserObj: -4', 00H
	ORG $+3
$SG2919	DB	'No line break after version number ParserObj: -5', 00H
	ORG $+3
$SG2921	DB	'Version number is not 1.0 or 1.1 ParserObj: -6', 00H
	ORG $+1
$SG2923	DB	'Send flag cannot be set TCPObj: -7', 00H
	ORG $+1
$SG2925	DB	'Connection timeout TCPObj: -8', 00H
	ORG $+2
$SG2927	DB	'TCB Segment size is greater than the maximum acceptable '
	DB	'send size TCPObj: -9', 00H
	ORG $+3
$SG2929	DB	'State is not established or finwait TCPObj: -11', 00H
$SG2931	DB	'TDL pointer is out of range TCPObj: -12', 00H
$SG2933	DB	'Data buffer is out of range TCPObj: -13', 00H
$SG2935	DB	'Length of data to send is less than 1 byte IP: -24', 00H
	ORG $+1
$SG2937	DB	'Length of data to send is greater than max send size IP:'
	DB	' -25', 00H
	ORG $+3
$SG2939	DB	'TDL pointer is out of range EO: -26', 00H
$SG2941	DB	'Data buffer is out of range EO: -27', 00H
$SG2943	DB	'TCB is not available TCP: -28', 00H
	ORG $+2
$SG2945	DB	'TDL is FULL TCP:SendN: -29', 00H
	ORG $+1
$SG2947	DB	'TDL is FULL TCP:SendMisc: -30', 00H
	ORG $+2
$SG2949	DB	'Task do not match in tcb TCP:setFileParam: -31', 00H
	ORG $+1
$SG2951	DB	'Request is not GET TCP:OtherHandler: -32', 00H
	ORG $+3
$SG2953	DB	'Tcb number do not match in tcb TCP:tcpSendN: -33', 00H
	ORG $+3
$SG2955	DB	'Tcb number do not match in tcb (first suspend) TCP:tcpSe'
	DB	'ndN: -34', 00H
	ORG $+3
$SG2957	DB	'Tcb number do not match in tcb (second suspend) TCP:tcpS'
	DB	'endN: -35', 00H
	ORG $+2
$SG2959	DB	'Tcb number do not match in tcb TCP:SendN: -36', 00H
	ORG $+2
$SG2961	DB	'tcb->avail = 0 TCP:SendN: -37', 00H
	ORG $+2
$SG2963	DB	'tcb->avail = 0 TCP:tcpSendN: -38', 00H
	ORG $+3
$SG2965	DB	'tcb->avail = 0 (first suspend) TCP:SendN: -39', 00H
	ORG $+2
$SG2967	DB	'tcb->avail = 0 (second suspend) TCP:tcpSendN: -40', 00H
	ORG $+2
$SG2969	DB	'apptask:httptask tcb is used another task', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -844
_task$ = -484
_p$ = -428
_tcp$ = -840
_i$ = -436
_retcode$ = -432
?HttpTask@apptask@@QAEXJ@Z PROC NEAR			; apptask::HttpTask
; Line 169
	push	ebp
	mov	ebp, esp
	sub	esp, 848				; 00000350H
	mov	DWORD PTR _this$[ebp], ecx
; Line 170
	lea	ecx, DWORD PTR _task$[ebp]
	call	??0AOATask@@QAE@XZ			; AOATask::AOATask
; Line 171
	lea	ecx, DWORD PTR _p$[ebp]
	call	??0parserObj@@QAE@XZ			; parserObj::parserObj
; Line 172
	lea	ecx, DWORD PTR _tcp$[ebp]
	call	??0TCPObj@@QAE@XZ			; TCPObj::TCPObj
; Line 173
	mov	DWORD PTR _i$[ebp], 0
; Line 174
	mov	DWORD PTR _retcode$[ebp], 0
; Line 176
	xor	eax, eax
	test	eax, eax
	je	SHORT $L2898
; Line 177
	push	1900					; 0000076cH
	mov	ecx, DWORD PTR ?Current_Task@apptask@@2HA ; apptask::Current_Task
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
$L2898:
; Line 179
	cmp	DWORD PTR ?HttpRequests@TCPObj@@2KA, 1	; TCPObj::HttpRequests
	jne	SHORT $L2899
; Line 180
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	mov	DWORD PTR ?systemstarttime@apptask@@2JA, eax ; apptask::systemstarttime
$L2899:
; Line 182
	cmp	DWORD PTR ?Application_Status@AOAProtected@@2HA, 2 ; AOAProtected::Application_Status
	je	$L2902
; Line 184
	mov	DWORD PTR ?Current_State@apptask@@2HA, 0 ; apptask::Current_State
; Line 186
	mov	edx, DWORD PTR ?Current_Tcbrno@apptask@@2HA ; apptask::Current_Tcbrno
	push	edx
	lea	ecx, DWORD PTR _tcp$[ebp]
	call	?getTaskID@TCPObj@@QAEHH@Z		; TCPObj::getTaskID
	mov	DWORD PTR _retcode$[ebp], eax
; Line 187
	cmp	DWORD PTR _retcode$[ebp], 0
	jge	$L2903
; Line 192
	mov	eax, DWORD PTR ?Current_Task@apptask@@2HA ; apptask::Current_Task
	push	eax
	mov	ecx, DWORD PTR ?Current_Tcbrno@apptask@@2HA ; apptask::Current_Tcbrno
	push	ecx
	lea	ecx, DWORD PTR _tcp$[ebp]
	call	?setTaskID@TCPObj@@QAEHHH@Z		; TCPObj::setTaskID
; Line 194
	xor	edx, edx
	test	edx, edx
	je	SHORT $L2904
; Line 195
	push	2
	mov	eax, DWORD PTR ?Current_Task@apptask@@2HA ; apptask::Current_Task
	sub	eax, DWORD PTR ?MinTaskId@apptask@@2JA	; apptask::MinTaskId
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 404				; 00000194H
	call	?insert@WTTrace@@QAEHHG@Z		; WTTrace::insert
$L2904:
; Line 197
	mov	ecx, DWORD PTR ?Current_Task@apptask@@2HA ; apptask::Current_Task
	push	ecx
	mov	edx, DWORD PTR ?Current_Tcbrno@apptask@@2HA ; apptask::Current_Tcbrno
	push	edx
	lea	ecx, DWORD PTR _p$[ebp]
	call	?processRequest@parserObj@@QAEHHH@Z	; parserObj::processRequest
	mov	DWORD PTR _retcode$[ebp], eax
; Line 199
	xor	eax, eax
	test	eax, eax
	je	SHORT $L2905
; Line 201
	push	1800					; 00000708H
	mov	ecx, DWORD PTR _retcode$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 202
	push	1900					; 0000076cH
	mov	edx, DWORD PTR ?Current_Task@apptask@@2HA ; apptask::Current_Task
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
$L2905:
; Line 206
	mov	eax, DWORD PTR _retcode$[ebp]
	mov	DWORD PTR -848+[ebp], eax
	mov	ecx, DWORD PTR -848+[ebp]
	add	ecx, 40					; 00000028H
	mov	DWORD PTR -848+[ebp], ecx
	cmp	DWORD PTR -848+[ebp], 39		; 00000027H
	ja	$L2907
	mov	edx, DWORD PTR -848+[ebp]
	jmp	DWORD PTR $L3540[edx*4]
$L2910:
; Line 208
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG2911
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 209
	jmp	$L2907
$L2912:
; Line 211
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG2913
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 212
	jmp	$L2907
$L2914:
; Line 214
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG2915
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 215
	jmp	$L2907
$L2916:
; Line 217
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG2917
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 218
	jmp	$L2907
$L2918:
; Line 220
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG2919
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 221
	jmp	$L2907
$L2920:
; Line 223
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG2921
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 224
	jmp	$L2907
$L2922:
; Line 226
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG2923
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 227
	jmp	$L2907
$L2924:
; Line 229
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG2925
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 230
	jmp	$L2907
$L2926:
; Line 233
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG2927
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 234
	jmp	$L2907
$L2928:
; Line 236
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG2929
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 237
	jmp	$L2907
$L2930:
; Line 239
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG2931
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 240
	jmp	$L2907
$L2932:
; Line 242
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG2933
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 243
	jmp	$L2907
$L2934:
; Line 245
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG2935
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 246
	jmp	$L2907
$L2936:
; Line 248
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG2937
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 249
	jmp	$L2907
$L2938:
; Line 251
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG2939
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 252
	jmp	$L2907
$L2940:
; Line 254
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG2941
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 255
	jmp	$L2907
$L2942:
; Line 257
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG2943
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 258
	jmp	$L2907
$L2944:
; Line 260
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG2945
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 261
	jmp	$L2907
$L2946:
; Line 263
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG2947
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 264
	jmp	$L2907
$L2948:
; Line 266
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG2949
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 267
	jmp	$L2907
$L2950:
; Line 269
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG2951
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 270
	jmp	$L2907
$L2952:
; Line 272
	push	160					; 000000a0H
	push	OFFSET FLAT:$SG2953
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 273
	jmp	$L2907
$L2954:
; Line 275
	push	320					; 00000140H
	push	OFFSET FLAT:$SG2955
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 276
	jmp	$L2907
$L2956:
; Line 278
	push	480					; 000001e0H
	push	OFFSET FLAT:$SG2957
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 279
	jmp	$L2907
$L2958:
; Line 281
	push	640					; 00000280H
	push	OFFSET FLAT:$SG2959
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 282
	jmp	$L2907
$L2960:
; Line 284
	push	3540					; 00000dd4H
	push	OFFSET FLAT:$SG2961
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 285
	jmp	SHORT $L2907
$L2962:
; Line 287
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2963
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 288
	jmp	SHORT $L2907
$L2964:
; Line 290
	push	1120					; 00000460H
	push	OFFSET FLAT:$SG2965
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 291
	push	1260					; 000004ecH
	mov	eax, DWORD PTR ?Current_Task@apptask@@2HA ; apptask::Current_Task
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 292
	jmp	SHORT $L2907
$L2966:
; Line 294
	push	1280					; 00000500H
	push	OFFSET FLAT:$SG2967
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 295
	push	1420					; 0000058cH
	mov	ecx, DWORD PTR ?Current_Task@apptask@@2HA ; apptask::Current_Task
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
$L2907:
; Line 299
	jmp	SHORT $L2968
$L2903:
; Line 301
	push	3380					; 00000d34H
	push	OFFSET FLAT:$SG2969
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 302
	push	3480					; 00000d98H
	mov	edx, DWORD PTR _retcode$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 303
	mov	DWORD PTR ?Application_Status@AOAProtected@@2HA, 2 ; AOAProtected::Application_Status
; Line 304
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAExit@AOAProtected@@QAEXXZ		; AOAProtected::AOAExit
$L2968:
; Line 309
	mov	eax, DWORD PTR ?Current_Tcbrno@apptask@@2HA ; apptask::Current_Tcbrno
	push	eax
	lea	ecx, DWORD PTR _tcp$[ebp]
	call	?getAvail@TCPObj@@QAEHH@Z		; TCPObj::getAvail
	mov	DWORD PTR _retcode$[ebp], eax
; Line 311
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L2971
; Line 313
	mov	ecx, DWORD PTR ?Current_Tcbrno@apptask@@2HA ; apptask::Current_Tcbrno
	push	ecx
	lea	ecx, DWORD PTR _tcp$[ebp]
	call	?getTaskID@TCPObj@@QAEHH@Z		; TCPObj::getTaskID
	mov	DWORD PTR _retcode$[ebp], eax
$L2971:
; Line 333
	mov	eax, DWORD PTR ?HttpCount@TCPObj@@2KA	; TCPObj::HttpCount
	sub	eax, 1
	mov	DWORD PTR ?HttpCount@TCPObj@@2KA, eax	; TCPObj::HttpCount
; Line 334
	xor	ecx, ecx
	test	ecx, ecx
	je	SHORT $L2972
; Line 335
	push	1820					; 0000071cH
	mov	edx, DWORD PTR ?HttpCount@TCPObj@@2KA	; TCPObj::HttpCount
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
$L2972:
; Line 336
	xor	eax, eax
	test	eax, eax
	je	SHORT $L2973
; Line 337
	push	1840					; 00000730H
	mov	ecx, DWORD PTR ?HttpRequests@TCPObj@@2KA ; TCPObj::HttpRequests
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
$L2973:
; Line 338
	xor	edx, edx
	test	edx, edx
	je	SHORT $L2974
; Line 339
	push	128					; 00000080H
	mov	eax, DWORD PTR ?Current_Task@apptask@@2HA ; apptask::Current_Task
	sub	eax, DWORD PTR ?MinTaskId@apptask@@2JA	; apptask::MinTaskId
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 404				; 00000194H
	call	?insert@WTTrace@@QAEHHG@Z		; WTTrace::insert
$L2974:
; Line 340
	mov	ecx, DWORD PTR ?Current_State@apptask@@2HA ; apptask::Current_State
	push	ecx
	mov	edx, DWORD PTR ?Current_Task@apptask@@2HA ; apptask::Current_Task
	push	edx
	lea	ecx, DWORD PTR _task$[ebp]
	call	?AOAcompleteTask@AOATask@@QAEXHH@Z	; AOATask::AOAcompleteTask
; Line 341
	jmp	$L2899
$L2902:
; Line 342
	mov	esp, ebp
	pop	ebp
	ret	4
$L3540:
	DD	$L2966
	DD	$L2964
	DD	$L2962
	DD	$L2960
	DD	$L2958
	DD	$L2956
	DD	$L2954
	DD	$L2952
	DD	$L2950
	DD	$L2948
	DD	$L2946
	DD	$L2944
	DD	$L2942
	DD	$L2940
	DD	$L2938
	DD	$L2936
	DD	$L2934
	DD	$L2907
	DD	$L2907
	DD	$L2907
	DD	$L2907
	DD	$L2907
	DD	$L2907
	DD	$L2907
	DD	$L2907
	DD	$L2907
	DD	$L2907
	DD	$L2932
	DD	$L2930
	DD	$L2928
	DD	$L2907
	DD	$L2926
	DD	$L2924
	DD	$L2922
	DD	$L2920
	DD	$L2918
	DD	$L2916
	DD	$L2914
	DD	$L2912
	DD	$L2910
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
$SG2985	DB	'FileTransferTask:', 00H
	ORG $+2
$SG2989	DB	'Left while loop FileTransferTask', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -380
_ftp$ = -328
_task$ = -376
_i$ = -8
_retcode$ = -4
?FileTransferTask@apptask@@QAEXJ@Z PROC NEAR		; apptask::FileTransferTask
; Line 347
	push	ebp
	mov	ebp, esp
	sub	esp, 380				; 0000017cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 348
	lea	ecx, DWORD PTR _ftp$[ebp]
	call	??0FTPObj@@QAE@XZ			; FTPObj::FTPObj
; Line 349
	lea	ecx, DWORD PTR _task$[ebp]
	call	??0AOATask@@QAE@XZ			; AOATask::AOATask
; Line 350
	mov	DWORD PTR _i$[ebp], 0
; Line 351
	mov	DWORD PTR _retcode$[ebp], 0
; Line 354
	push	1920					; 00000780H
	push	OFFSET FLAT:$SG2985
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 355
	push	2060					; 0000080cH
	mov	eax, DWORD PTR ?Current_Task@apptask@@2HA ; apptask::Current_Task
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 358
	push	1
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 372				; 00000174H
	call	?setMode@FTOPObj@@QAEXH@Z		; FTOPObj::setMode
; Line 359
	push	0
	mov	cx, WORD PTR ?port@FTPObj@@2GA		; FTPObj::port
	push	ecx
	push	OFFSET FLAT:?IP@FTPObj@@2PADA		; FTPObj::IP
	lea	ecx, DWORD PTR _ftp$[ebp]
	call	?StartTransfer@FTPObj@@QAEHPADGH@Z	; FTPObj::StartTransfer
	mov	DWORD PTR _retcode$[ebp], eax
$L2987:
; Line 361
	cmp	DWORD PTR ?Application_Status@AOAProtected@@2HA, 2 ; AOAProtected::Application_Status
	je	SHORT $L2988
; Line 363
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
; Line 364
	push	2040					; 000007f8H
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 365
	lea	ecx, DWORD PTR _task$[ebp]
	call	?AOAsuspendTask@AOATask@@QAEXXZ		; AOATask::AOAsuspendTask
; Line 366
	jmp	SHORT $L2987
$L2988:
; Line 368
	push	3260					; 00000cbcH
	push	OFFSET FLAT:$SG2989
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 370
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAExit@AOAProtected@@QAEXXZ		; AOAProtected::AOAExit
; Line 371
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
$SG3002	DB	'InterfaceTask:', 00H
	ORG $+1
$SG3007	DB	'GUIT Done', 00H
	ORG $+2
$SG3009	DB	'Left while loop InterfaceTask', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -64
_task$ = -60
_i$ = -12
_retcode$ = -8
_a$ = -4
?InterfaceTask@apptask@@QAEXJ@Z PROC NEAR		; apptask::InterfaceTask
; Line 377
	push	ebp
	mov	ebp, esp
	sub	esp, 64					; 00000040H
	mov	DWORD PTR _this$[ebp], ecx
; Line 378
	lea	ecx, DWORD PTR _task$[ebp]
	call	??0AOATask@@QAE@XZ			; AOATask::AOATask
; Line 379
	mov	DWORD PTR _i$[ebp], 0
; Line 380
	mov	DWORD PTR _retcode$[ebp], 0
; Line 381
	mov	BYTE PTR _a$[ebp], 78			; 0000004eH
; Line 383
	push	2080					; 00000820H
	push	OFFSET FLAT:$SG3002
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 384
	push	2220					; 000008acH
	mov	eax, DWORD PTR ?Current_Task@apptask@@2HA ; apptask::Current_Task
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
$L3004:
; Line 386
	cmp	DWORD PTR ?Application_Status@AOAProtected@@2HA, 2 ; AOAProtected::Application_Status
	je	SHORT $L3005
; Line 388
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacterBuff@AOAProtected@@QAEDXZ ; AOAProtected::AOAgetCharacterBuff
	mov	BYTE PTR _a$[ebp], al
; Line 389
	movsx	ecx, BYTE PTR _a$[ebp]
	cmp	ecx, 101				; 00000065H
	jne	SHORT $L3006
; Line 391
	mov	DWORD PTR ?Application_Status@AOAProtected@@2HA, 2 ; AOAProtected::Application_Status
; Line 392
	push	3300					; 00000ce4H
	push	OFFSET FLAT:$SG3007
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 393
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAExit@AOAProtected@@QAEXXZ		; AOAProtected::AOAExit
$L3006:
; Line 395
	xor	edx, edx
	test	edx, edx
	je	SHORT $L3008
; Line 396
	push	2200					; 00000898H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
$L3008:
; Line 397
	lea	ecx, DWORD PTR _task$[ebp]
	call	?AOAsuspendTask@AOATask@@QAEXXZ		; AOATask::AOAsuspendTask
; Line 398
	jmp	SHORT $L3004
$L3005:
; Line 400
	push	3260					; 00000cbcH
	push	OFFSET FLAT:$SG3009
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 401
	mov	DWORD PTR ?Application_Status@AOAProtected@@2HA, 2 ; AOAProtected::Application_Status
; Line 403
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAExit@AOAProtected@@QAEXXZ		; AOAProtected::AOAExit
; Line 404
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
EXTRN	?fileTransferFinished@FTPObj@@2HA:DWORD		; FTPObj::fileTransferFinished
EXTRN	?reset@WTTrace@@QAEHHG@Z:NEAR			; WTTrace::reset
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
EXTRN	?DeleteTCB@TCPObj@@QAEHH@Z:NEAR			; TCPObj::DeleteTCB
EXTRN	?AOAackPICCntlr@AOAProtected@@QAEHH@Z:NEAR	; AOAProtected::AOAackPICCntlr
EXTRN	?AOAMaskRunRegister@AOAProtected@@QAEHHH@Z:NEAR	; AOAProtected::AOAMaskRunRegister
EXTRN	?insert@WCirList@@QAEHJJJHJ@Z:NEAR		; WCirList::insert
EXTRN	?get@WCirList@@QAEHPAJPAI0PAH0@Z:NEAR		; WCirList::get
EXTRN	?empty@WCirList@@QAEHXZ:NEAR			; WCirList::empty
EXTRN	?full@WCirList@@QAEHXZ:NEAR			; WCirList::full
EXTRN	?getCount@WCirList@@QAEHXZ:NEAR			; WCirList::getCount
EXTRN	?ReceiveInPtr@EtherObj@@2JA:DWORD		; EtherObj::ReceiveInPtr
EXTRN	?AOAapplink32@AOATask@@QAEHXZ:NEAR		; AOATask::AOAapplink32
EXTRN	?ReceiveOutPtr@EtherObj@@2JA:DWORD		; EtherObj::ReceiveOutPtr
EXTRN	?SendInPtr@EtherObj@@2JA:DWORD			; EtherObj::SendInPtr
EXTRN	?SendOutPtr@EtherObj@@2JA:DWORD			; EtherObj::SendOutPtr
EXTRN	?TotalDataSent@EtherObj@@2JA:DWORD		; EtherObj::TotalDataSent
EXTRN	?AOArunTask@AOATask@@QAEHH@Z:NEAR		; AOATask::AOArunTask
EXTRN	?isRDescDone@EtherObj@@QAEHH@Z:NEAR		; EtherObj::isRDescDone
_DATA	SEGMENT
	ORG $+2
$SG3069	DB	'FTC', 00H
$SG3070	DB	'MAIN:', 00H
	ORG $+2
$SG3071	DB	'runTsk', 00H
	ORG $+1
$SG3072	DB	'CirCnt', 00H
	ORG $+1
$SG3073	DB	'resCnt', 00H
	ORG $+1
$SG3074	DB	'delCnt', 00H
	ORG $+1
$SG3075	DB	'State', 00H
	ORG $+2
$SG3076	DB	'TOTDATRCV', 00H
	ORG $+2
$SG3077	DB	'TOTDATSND', 00H
	ORG $+2
$SG3078	DB	'TOTTIME', 00H
$SG3079	DB	'RCVTIME', 00H
$SG3080	DB	'HTTPTIME', 00H
	ORG $+3
$SG3081	DB	'TIME   ', 00H
$SG3102	DB	'apptask:MainTask circular list is empty', 00H
$SG3112	DB	'apptask:MainTask circular list is full', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -1188
_task$ = -488
_EO$ = -88
_arp$ = -1184
_ftp$ = -432
_tcp$ = -860
_retcode$ = -28
_printstarttimer$ = -60
_ticks$ = -8
_n$ = -884
_i$ = -112
_j$ = -440
_taskid$ = -872
_delay100$ = -80
_statec$ = -896
_timerc$ = -504
_httpMax$ = -56
_tcbrnoc$ = -892
_ch$ = -436
_disfavor$ = -24
_temp$ = -92
_currenttime$ = -52
_idFound$ = -888
_tpktssentNIC$ = -68
_tpktssentAPP$ = -108
_priorcount$ = -4
_k$ = -500
_noOfElements$ = -64
_counter$ = -868
_httpflag$ = -104
_rcvflag$ = -864
_dpdstatus$ = -20
_prevTask$ = -16
_prevTaskID$ = -100
_rcvcount$ = -496
_avgRTT1$ = -72
_avgRTT2$ = -96
_ttrace$ = -48
_resulth$ = -76
_resultl$ = -492
_result1h$ = -876
_result1l$ = -44
_t1starthigh$ = -40
_t1startlow$ = -36
_t2starthigh$ = -32
_t2startlow$ = -12
?MainTask@apptask@@QAEXJ@Z PROC NEAR			; apptask::MainTask
; Line 416
	push	ebp
	mov	ebp, esp
	sub	esp, 1188				; 000004a4H
	mov	DWORD PTR _this$[ebp], ecx
; Line 417
	lea	ecx, DWORD PTR _task$[ebp]
	call	??0AOATask@@QAE@XZ			; AOATask::AOATask
; Line 418
	lea	ecx, DWORD PTR _EO$[ebp]
	call	??0EtherObj@@QAE@XZ			; EtherObj::EtherObj
; Line 419
	lea	ecx, DWORD PTR _arp$[ebp]
	call	??0ARPObj@@QAE@XZ			; ARPObj::ARPObj
; Line 420
	lea	ecx, DWORD PTR _ftp$[ebp]
	call	??0FTPObj@@QAE@XZ			; FTPObj::FTPObj
; Line 421
	lea	ecx, DWORD PTR _tcp$[ebp]
	call	??0TCPObj@@QAE@XZ			; TCPObj::TCPObj
; Line 423
	mov	DWORD PTR _retcode$[ebp], 0
; Line 425
	mov	DWORD PTR _ticks$[ebp], 0
; Line 426
	mov	DWORD PTR _n$[ebp], 0
; Line 427
	mov	DWORD PTR _i$[ebp], 0
	mov	DWORD PTR _j$[ebp], 0
; Line 433
	mov	DWORD PTR _httpMax$[ebp], 0
; Line 434
	mov	DWORD PTR _tcbrnoc$[ebp], -1
; Line 435
	mov	BYTE PTR _ch$[ebp], 0
; Line 436
	mov	DWORD PTR _disfavor$[ebp], 0
; Line 437
	mov	DWORD PTR _temp$[ebp], 0
; Line 438
	mov	DWORD PTR _currenttime$[ebp], 0
; Line 439
	mov	DWORD PTR _idFound$[ebp], 0
; Line 440
	mov	DWORD PTR _tpktssentNIC$[ebp], 0
; Line 441
	mov	DWORD PTR _tpktssentAPP$[ebp], 0
; Line 442
	mov	DWORD PTR _priorcount$[ebp], 0
; Line 443
	mov	DWORD PTR _k$[ebp], 0
; Line 444
	mov	DWORD PTR _noOfElements$[ebp], 0
; Line 445
	mov	DWORD PTR _counter$[ebp], 0
; Line 446
	mov	DWORD PTR _httpflag$[ebp], 0
; Line 447
	mov	DWORD PTR _rcvflag$[ebp], 0
; Line 448
	mov	DWORD PTR _dpdstatus$[ebp], 0
; Line 449
	mov	DWORD PTR _prevTask$[ebp], 0
; Line 450
	mov	DWORD PTR _prevTaskID$[ebp], 0
; Line 451
	mov	DWORD PTR _rcvcount$[ebp], 0
; Line 452
	mov	DWORD PTR _avgRTT1$[ebp], 0
; Line 453
	mov	DWORD PTR _avgRTT2$[ebp], 0
; Line 454
	mov	WORD PTR _ttrace$[ebp], 0
; Line 455
	mov	DWORD PTR _resulth$[ebp], 0
; Line 456
	mov	DWORD PTR _resultl$[ebp], 0
; Line 457
	mov	DWORD PTR _result1h$[ebp], 0
; Line 458
	mov	DWORD PTR _result1l$[ebp], 0
; Line 459
	mov	DWORD PTR _t1starthigh$[ebp], 0
; Line 460
	mov	DWORD PTR _t1startlow$[ebp], 0
; Line 461
	mov	DWORD PTR _t2starthigh$[ebp], 0
; Line 462
	mov	DWORD PTR _t2startlow$[ebp], 0
; Line 464
	mov	DWORD PTR ?taskDeletes@apptask@@2HA, 0	; apptask::taskDeletes
; Line 465
	mov	DWORD PTR ?cvalue@apptask@@2JA, 0	; apptask::cvalue
; Line 473
	mov	DWORD PTR _n$[ebp], 4
; Line 474
	mov	DWORD PTR ?iddlecount@apptask@@2JA, 0	; apptask::iddlecount
; Line 475
	push	1
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAackPICCntlr@AOAProtected@@QAEHH@Z	; AOAProtected::AOAackPICCntlr
; Line 476
	push	2
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAackPICCntlr@AOAProtected@@QAEHH@Z	; AOAProtected::AOAackPICCntlr
; Line 478
	mov	ecx, DWORD PTR _this$[ebp]
	call	?createOtherTasks@apptask@@QAEXXZ	; apptask::createOtherTasks
$L3061:
; Line 481
	mov	eax, 1
	test	eax, eax
	je	$L3062
; Line 483
	push	1620					; 00000654H
	mov	ecx, DWORD PTR _n$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 484
	lea	ecx, DWORD PTR _EO$[ebp]
	call	?IncSendOutPtr@EtherObj@@QAEHXZ		; EtherObj::IncSendOutPtr
	mov	DWORD PTR _retcode$[ebp], eax
; Line 486
	cmp	DWORD PTR _n$[ebp], 4
	jne	SHORT $L3063
	cmp	DWORD PTR ?resolveFlagForFileTransfer@ARPObj@@2HA, 0 ; ARPObj::resolveFlagForFileTransfer
	jne	SHORT $L3063
; Line 488
	mov	DWORD PTR _n$[ebp], 6
; Line 490
	jmp	SHORT $L3067
$L3063:
	cmp	DWORD PTR _n$[ebp], 4
	jne	SHORT $L3065
	cmp	DWORD PTR ?resolveFlagForFileTransfer@ARPObj@@2HA, 1 ; ARPObj::resolveFlagForFileTransfer
	jne	SHORT $L3065
; Line 492
	mov	DWORD PTR _n$[ebp], 4
; Line 494
	jmp	SHORT $L3067
$L3065:
	cmp	DWORD PTR _n$[ebp], 6
	jne	SHORT $L3067
; Line 496
	mov	DWORD PTR _n$[ebp], 4
$L3067:
; Line 499
	mov	edx, DWORD PTR _n$[ebp]
	mov	DWORD PTR ?Current_Task@apptask@@2HA, edx ; apptask::Current_Task
; Line 501
	mov	eax, DWORD PTR _n$[ebp]
	push	eax
	lea	ecx, DWORD PTR _task$[ebp]
	call	?AOArunTask@AOATask@@QAEHH@Z		; AOATask::AOArunTask
; Line 503
	cmp	DWORD PTR ?fileTransferFinished@FTPObj@@2HA, 1 ; FTPObj::fileTransferFinished
	jne	SHORT $L3068
; Line 505
	mov	DWORD PTR ?upCompleteNotSetCount@apptask@@2JA, 0 ; apptask::upCompleteNotSetCount
; Line 506
	push	326					; 00000146H
	push	OFFSET FLAT:$SG3069
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 508
	push	164					; 000000a4H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetSharedMem@AOAProtected@@QAEJH@Z	; AOAProtected::AOAgetSharedMem
	mov	DWORD PTR _retcode$[ebp], eax
; Line 509
	mov	ecx, DWORD PTR _retcode$[ebp]
	mov	DWORD PTR _priorcount$[ebp], ecx
; Line 510
	jmp	SHORT $L3062
$L3068:
; Line 512
	jmp	$L3061
$L3062:
; Line 514
	push	0
	push	4
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAMaskRunRegister@AOAProtected@@QAEHHH@Z ; AOAProtected::AOAMaskRunRegister
; Line 515
	push	0
	push	7
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAMaskRunRegister@AOAProtected@@QAEHHH@Z ; AOAProtected::AOAMaskRunRegister
; Line 516
	push	0
	push	5
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAMaskRunRegister@AOAProtected@@QAEHHH@Z ; AOAProtected::AOAMaskRunRegister
; Line 518
	mov	ecx, DWORD PTR _this$[ebp]
	call	?printScreenLayout@apptask@@QAEXXZ	; apptask::printScreenLayout
; Line 519
	mov	ecx, DWORD PTR _this$[ebp]
	call	?printScreenTags@apptask@@QAEXXZ	; apptask::printScreenTags
; Line 520
	push	1446					; 000005a6H
	push	OFFSET FLAT:$SG3070
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 521
	push	1300					; 00000514H
	push	OFFSET FLAT:$SG3071
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 522
	push	1320					; 00000528H
	push	OFFSET FLAT:$SG3072
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 523
	push	1340					; 0000053cH
	push	OFFSET FLAT:$SG3073
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 524
	push	1360					; 00000550H
	push	OFFSET FLAT:$SG3074
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 525
	push	1380					; 00000564H
	push	OFFSET FLAT:$SG3075
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 526
	push	840					; 00000348H
	push	OFFSET FLAT:$SG3076
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 527
	push	860					; 0000035cH
	push	OFFSET FLAT:$SG3077
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 528
	push	2260					; 000008d4H
	push	OFFSET FLAT:$SG3078
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 529
	push	2280					; 000008e8H
	push	OFFSET FLAT:$SG3079
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 530
	push	2300					; 000008fcH
	push	OFFSET FLAT:$SG3080
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 531
	push	2330					; 0000091aH
	push	OFFSET FLAT:$SG3081
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 534
	mov	DWORD PTR _k$[ebp], 0
; Line 535
	mov	DWORD PTR ?totalcurtime@apptask@@2JA, 0	; apptask::totalcurtime
; Line 536
	mov	DWORD PTR ?rcvcurtime@apptask@@2JA, 0	; apptask::rcvcurtime
; Line 537
	mov	DWORD PTR ?httpcurtime@apptask@@2JA, 0	; apptask::httpcurtime
; Line 538
	mov	DWORD PTR _rcvcount$[ebp], 0
; Line 540
	mov	DWORD PTR ?trace1Count@TCPObj@@2JA, 0	; TCPObj::trace1Count
; Line 541
	mov	DWORD PTR ?runFlag@apptask@@2HA, 0	; apptask::runFlag
; Line 543
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	mov	DWORD PTR _printstarttimer$[ebp], eax
; Line 545
	mov	DWORD PTR ?cvalue@apptask@@2JA, 0	; apptask::cvalue
$L3083:
; Line 546
	cmp	DWORD PTR ?Application_Status@AOAProtected@@2HA, 2 ; AOAProtected::Application_Status
	je	$L3084
; Line 548
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	mov	DWORD PTR ?totalstarttime@apptask@@2JA, eax ; apptask::totalstarttime
; Line 551
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	sub	eax, DWORD PTR _printstarttimer$[ebp]
	cmp	eax, 2400000				; 00249f00H
	jb	$L3085
; Line 553
	mov	edx, DWORD PTR ?cvalue@apptask@@2JA	; apptask::cvalue
	add	edx, 600				; 00000258H
	mov	DWORD PTR ?cvalue@apptask@@2JA, edx	; apptask::cvalue
; Line 554
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacterBuff@AOAProtected@@QAEDXZ ; AOAProtected::AOAgetCharacterBuff
	mov	BYTE PTR _ch$[ebp], al
; Line 555
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	mov	DWORD PTR _printstarttimer$[ebp], eax
; Line 556
	push	2100					; 00000834H
	mov	eax, DWORD PTR ?MaxNoOfTasksUsed@TCPObj@@2KA ; TCPObj::MaxNoOfTasksUsed
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 559
	push	2420					; 00000974H
	mov	ecx, DWORD PTR ?totalcurtime@apptask@@2JA ; apptask::totalcurtime
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 560
	push	2440					; 00000988H
	mov	edx, DWORD PTR ?rcvcurtime@apptask@@2JA	; apptask::rcvcurtime
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 561
	push	2460					; 0000099cH
	mov	eax, DWORD PTR ?httpcurtime@apptask@@2JA ; apptask::httpcurtime
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 562
	push	2480					; 000009b0H
	mov	ecx, DWORD PTR ?cvalue@apptask@@2JA	; apptask::cvalue
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
$L3085:
; Line 565
	mov	edx, DWORD PTR _ch$[ebp]
	and	edx, 255				; 000000ffH
	cmp	edx, 81					; 00000051H
	jne	SHORT $L3086
; Line 583
	mov	DWORD PTR ?Application_Status@AOAProtected@@2HA, 2 ; AOAProtected::Application_Status
; Line 584
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAExit@AOAProtected@@QAEXXZ		; AOAProtected::AOAExit
$L3086:
; Line 587
	lea	ecx, DWORD PTR _EO$[ebp]
	call	?IncSendOutPtr@EtherObj@@QAEHXZ		; EtherObj::IncSendOutPtr
	mov	DWORD PTR _retcode$[ebp], eax
; Line 589
	mov	DWORD PTR _tcbrnoc$[ebp], -1
; Line 591
	mov	eax, DWORD PTR ?ReceiveOutPtr@EtherObj@@2JA ; EtherObj::ReceiveOutPtr
	push	eax
	lea	ecx, DWORD PTR _EO$[ebp]
	call	?isRDescDone@EtherObj@@QAEHH@Z		; EtherObj::isRDescDone
	test	eax, eax
	je	SHORT $L3087
; Line 593
	push	1
	push	4
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAMaskRunRegister@AOAProtected@@QAEHHH@Z ; AOAProtected::AOAMaskRunRegister
; Line 594
	mov	DWORD PTR _rcvflag$[ebp], 1
; Line 596
	jmp	SHORT $L3088
$L3087:
; Line 598
	push	0
	push	4
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAMaskRunRegister@AOAProtected@@QAEHHH@Z ; AOAProtected::AOAMaskRunRegister
$L3088:
; Line 617
	lea	ecx, DWORD PTR _tcp$[ebp]
	call	?getHttpCount@TCPObj@@QAEHXZ		; TCPObj::getHttpCount
	test	eax, eax
	jle	SHORT $L3089
; Line 619
	lea	ecx, DWORD PTR _tcp$[ebp]
	call	?getHttpCount@TCPObj@@QAEHXZ		; TCPObj::getHttpCount
	cmp	eax, DWORD PTR _httpMax$[ebp]
	jle	SHORT $L3090
; Line 620
	lea	ecx, DWORD PTR _tcp$[ebp]
	call	?getHttpCount@TCPObj@@QAEHXZ		; TCPObj::getHttpCount
	mov	DWORD PTR _httpMax$[ebp], eax
$L3090:
; Line 621
	push	1
	push	7
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAMaskRunRegister@AOAProtected@@QAEHHH@Z ; AOAProtected::AOAMaskRunRegister
$L3089:
; Line 624
	cmp	DWORD PTR ?RunRegister@AOAProtected@@2JA, 0 ; AOAProtected::RunRegister
	je	$L3123
; Line 627
	mov	ecx, DWORD PTR _this$[ebp]
	call	?Scheduler_Algorithm_1@apptask@@QAEHXZ	; apptask::Scheduler_Algorithm_1
	mov	DWORD PTR _n$[ebp], eax
; Line 628
	mov	DWORD PTR _idFound$[ebp], 0
; Line 630
	cmp	DWORD PTR _n$[ebp], 7
	jne	SHORT $L3092
; Line 631
	mov	DWORD PTR _httpflag$[ebp], 1
; Line 632
	jmp	SHORT $L3093
$L3092:
	mov	DWORD PTR _httpflag$[ebp], 0
$L3093:
; Line 633
	mov	DWORD PTR _counter$[ebp], 0
; Line 635
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 396				; 0000018cH
	call	?getCount@WCirList@@QAEHXZ		; WCirList::getCount
	mov	DWORD PTR _noOfElements$[ebp], eax
; Line 636
	xor	ecx, ecx
	test	ecx, ecx
	je	SHORT $L3094
; Line 637
	push	1480					; 000005c8H
	mov	edx, DWORD PTR _noOfElements$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
$L3094:
; Line 639
	cmp	DWORD PTR _httpflag$[ebp], 1
	jne	$L3113
$L3097:
; Line 641
	mov	eax, DWORD PTR _counter$[ebp]
	cmp	eax, DWORD PTR _noOfElements$[ebp]
	jge	$L3098
	cmp	DWORD PTR _idFound$[ebp], 0
	jne	$L3098
; Line 643
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 396				; 0000018cH
	call	?getCount@WCirList@@QAEHXZ		; WCirList::getCount
	mov	DWORD PTR _retcode$[ebp], eax
; Line 644
	mov	ecx, DWORD PTR _retcode$[ebp]
	cmp	ecx, DWORD PTR ?MaxNoOfTasksUsed@TCPObj@@2KA ; TCPObj::MaxNoOfTasksUsed
	jbe	SHORT $L3099
; Line 645
	mov	edx, DWORD PTR _retcode$[ebp]
	mov	DWORD PTR ?MaxNoOfTasksUsed@TCPObj@@2KA, edx ; TCPObj::MaxNoOfTasksUsed
$L3099:
; Line 647
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 396				; 0000018cH
	call	?empty@WCirList@@QAEHXZ			; WCirList::empty
	test	eax, eax
	jne	SHORT $L3100
; Line 649
	lea	eax, DWORD PTR _timerc$[ebp]
	push	eax
	lea	ecx, DWORD PTR _tcbrnoc$[ebp]
	push	ecx
	lea	edx, DWORD PTR _statec$[ebp]
	push	edx
	lea	eax, DWORD PTR _delay100$[ebp]
	push	eax
	lea	ecx, DWORD PTR _taskid$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 396				; 0000018cH
	call	?get@WCirList@@QAEHPAJPAI0PAH0@Z	; WCirList::get
; Line 651
	jmp	SHORT $L3101
$L3100:
; Line 652
	push	3840					; 00000f00H
	push	OFFSET FLAT:$SG3102
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
$L3101:
; Line 653
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	mov	DWORD PTR _currenttime$[ebp], eax
; Line 657
	mov	edx, DWORD PTR _tcbrnoc$[ebp]
	push	edx
	lea	ecx, DWORD PTR _tcp$[ebp]
	call	?getResetFlag@TCPObj@@QAEHH@Z		; TCPObj::getResetFlag
	cmp	eax, 1
	jne	SHORT $L3103
; Line 659
	mov	DWORD PTR _n$[ebp], 0
; Line 660
	mov	DWORD PTR _idFound$[ebp], 0
; Line 661
	mov	eax, DWORD PTR ?taskDeletes@apptask@@2HA ; apptask::taskDeletes
	add	eax, 1
	mov	DWORD PTR ?taskDeletes@apptask@@2HA, eax ; apptask::taskDeletes
; Line 662
	xor	ecx, ecx
	test	ecx, ecx
	je	SHORT $L3104
; Line 663
	push	2220					; 000008acH
	mov	edx, DWORD PTR ?taskDeletes@apptask@@2HA ; apptask::taskDeletes
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
$L3104:
; Line 664
	mov	eax, DWORD PTR _tcbrnoc$[ebp]
	push	eax
	lea	ecx, DWORD PTR _tcp$[ebp]
	call	?DeleteTCB@TCPObj@@QAEHH@Z		; TCPObj::DeleteTCB
; Line 665
	jmp	$L3097
$L3103:
; Line 667
	mov	ecx, DWORD PTR _tcbrnoc$[ebp]
	push	ecx
	lea	ecx, DWORD PTR _tcp$[ebp]
	call	?getSuspendFlag@TCPObj@@QAEHH@Z		; TCPObj::getSuspendFlag
	cmp	eax, 1
	jne	SHORT $L3106
	mov	edx, DWORD PTR _tcbrnoc$[ebp]
	push	edx
	lea	ecx, DWORD PTR _tcp$[ebp]
	call	?getResumeFlag@TCPObj@@QAEHH@Z		; TCPObj::getResumeFlag
	cmp	eax, 1
	jne	SHORT $L3106
; Line 669
	mov	eax, DWORD PTR _taskid$[ebp]
	mov	DWORD PTR _n$[ebp], eax
; Line 670
	mov	DWORD PTR _idFound$[ebp], 1
; Line 671
	mov	ecx, DWORD PTR _tcbrnoc$[ebp]
	push	ecx
	lea	ecx, DWORD PTR _tcp$[ebp]
	call	?resetResumeFlag@TCPObj@@QAEHH@Z	; TCPObj::resetResumeFlag
; Line 672
	mov	edx, DWORD PTR ?resumeCount@apptask@@2HA ; apptask::resumeCount
	add	edx, 1
	mov	DWORD PTR ?resumeCount@apptask@@2HA, edx ; apptask::resumeCount
; Line 673
	xor	eax, eax
	test	eax, eax
	je	SHORT $L3107
; Line 674
	push	512					; 00000200H
	mov	ecx, DWORD PTR _taskid$[ebp]
	sub	ecx, DWORD PTR ?MinTaskId@apptask@@2JA	; apptask::MinTaskId
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 404				; 00000194H
	call	?reset@WTTrace@@QAEHHG@Z		; WTTrace::reset
$L3107:
; Line 675
	jmp	$L3097
$L3106:
; Line 678
	mov	edx, DWORD PTR _currenttime$[ebp]
	cmp	edx, DWORD PTR _delay100$[ebp]
	jb	SHORT $L3108
; Line 680
	mov	eax, DWORD PTR _taskid$[ebp]
	mov	DWORD PTR _n$[ebp], eax
; Line 681
	mov	DWORD PTR _idFound$[ebp], 1
; Line 683
	jmp	SHORT $L3111
$L3108:
; Line 685
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 396				; 0000018cH
	call	?full@WCirList@@QAEHXZ			; WCirList::full
	test	eax, eax
	jne	SHORT $L3110
; Line 687
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
; Line 689
	jmp	SHORT $L3111
$L3110:
; Line 691
	push	3840					; 00000f00H
	push	OFFSET FLAT:$SG3112
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
$L3111:
; Line 695
	mov	eax, DWORD PTR _counter$[ebp]
	add	eax, 1
	mov	DWORD PTR _counter$[ebp], eax
; Line 703
	jmp	$L3097
$L3098:
; Line 705
	cmp	DWORD PTR _idFound$[ebp], 0
	jne	SHORT $L3113
; Line 706
	mov	DWORD PTR _n$[ebp], 0
$L3113:
; Line 710
	cmp	DWORD PTR _n$[ebp], 4
	jl	$L3122
	mov	ecx, DWORD PTR _n$[ebp]
	cmp	ecx, DWORD PTR ?MaxTaskId@apptask@@2JA	; apptask::MaxTaskId
	jg	$L3122
; Line 712
	mov	edx, DWORD PTR _n$[ebp]
	mov	DWORD PTR ?Current_Task@apptask@@2HA, edx ; apptask::Current_Task
; Line 713
	cmp	DWORD PTR _n$[ebp], 8
	jle	SHORT $L3115
; Line 714
	mov	eax, DWORD PTR _tcbrnoc$[ebp]
	mov	DWORD PTR ?Current_Tcbrno@apptask@@2HA, eax ; apptask::Current_Tcbrno
$L3115:
; Line 716
	cmp	DWORD PTR _n$[ebp], 4
	jne	SHORT $L3116
; Line 718
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	mov	DWORD PTR ?rcvstarttime@apptask@@2JA, eax ; apptask::rcvstarttime
$L3116:
; Line 720
	cmp	DWORD PTR _httpflag$[ebp], 1
	jne	$L3117
; Line 722
	cmp	DWORD PTR ?runFlag@apptask@@2HA, 0	; apptask::runFlag
	jne	SHORT $L3118
; Line 724
	mov	DWORD PTR ?runFlag@apptask@@2HA, 1	; apptask::runFlag
; Line 725
	mov	DWORD PTR ?totalcurtime@apptask@@2JA, 0	; apptask::totalcurtime
; Line 726
	mov	DWORD PTR ?rcvcurtime@apptask@@2JA, 0	; apptask::rcvcurtime
; Line 727
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	mov	DWORD PTR ?totalstarttime@apptask@@2JA, eax ; apptask::totalstarttime
; Line 728
	mov	DWORD PTR ?TotalDataRcvd@apptask@@2JA, 0 ; apptask::TotalDataRcvd
; Line 729
	mov	DWORD PTR ?TotalDataSent@EtherObj@@2JA, 0 ; EtherObj::TotalDataSent
; Line 730
	mov	DWORD PTR ?totaltickshigh@apptask@@2IA, 0 ; apptask::totaltickshigh
; Line 731
	mov	DWORD PTR ?totaltickslow@apptask@@2IA, 0 ; apptask::totaltickslow
; Line 732
	mov	DWORD PTR ?rcvtickshigh@apptask@@2IA, 0	; apptask::rcvtickshigh
; Line 733
	mov	DWORD PTR ?rcvtickslow@apptask@@2IA, 0	; apptask::rcvtickslow
; Line 734
	mov	DWORD PTR ?httptickshigh@apptask@@2IA, 0 ; apptask::httptickshigh
; Line 735
	mov	DWORD PTR ?httptickslow@apptask@@2IA, 0	; apptask::httptickslow
$L3118:
; Line 739
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	mov	DWORD PTR ?httpstarttime@apptask@@2JA, eax ; apptask::httpstarttime
$L3117:
; Line 743
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	mov	DWORD PTR ?ExitTimer@apptask@@2KA, eax	; apptask::ExitTimer
; Line 746
	mov	ecx, DWORD PTR _n$[ebp]
	push	ecx
	lea	ecx, DWORD PTR _task$[ebp]
	call	?AOArunTask@AOATask@@QAEHH@Z		; AOATask::AOArunTask
; Line 749
	xor	edx, edx
	test	edx, edx
	je	SHORT $L3119
; Line 750
	push	1460					; 000005b4H
	mov	eax, DWORD PTR _n$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
$L3119:
; Line 752
	cmp	DWORD PTR _n$[ebp], 4
	jne	SHORT $L3120
; Line 754
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	sub	eax, DWORD PTR ?rcvstarttime@apptask@@2JA ; apptask::rcvstarttime
	mov	ecx, DWORD PTR ?rcvcurtime@apptask@@2JA	; apptask::rcvcurtime
	add	ecx, eax
	mov	DWORD PTR ?rcvcurtime@apptask@@2JA, ecx	; apptask::rcvcurtime
; Line 761
	push	0
	push	4
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAMaskRunRegister@AOAProtected@@QAEHHH@Z ; AOAProtected::AOAMaskRunRegister
; Line 763
	jmp	SHORT $L3122
$L3120:
	cmp	DWORD PTR _n$[ebp], 7
	jl	SHORT $L3122
; Line 765
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	sub	eax, DWORD PTR ?httpstarttime@apptask@@2JA ; apptask::httpstarttime
	mov	edx, DWORD PTR ?httpcurtime@apptask@@2JA ; apptask::httpcurtime
	add	edx, eax
	mov	DWORD PTR ?httpcurtime@apptask@@2JA, edx ; apptask::httpcurtime
; Line 772
	push	0
	push	7
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAMaskRunRegister@AOAProtected@@QAEHHH@Z ; AOAProtected::AOAMaskRunRegister
$L3122:
; Line 777
	xor	eax, eax
	test	eax, eax
	je	$L3123
; Line 779
	push	2100					; 00000834H
	mov	ecx, DWORD PTR ?MaxNoOfTasksUsed@TCPObj@@2KA ; TCPObj::MaxNoOfTasksUsed
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 780
	push	2120					; 00000848H
	mov	edx, DWORD PTR ?MaxNoOfTCBsUsed@TCPObj@@2KA ; TCPObj::MaxNoOfTCBsUsed
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 781
	push	2140					; 0000085cH
	mov	eax, DWORD PTR ?trace2Count@TCPObj@@2JA	; TCPObj::trace2Count
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 782
	push	2160					; 00000870H
	mov	ecx, DWORD PTR ?TotalDelCount@TCPObj@@2KA ; TCPObj::TotalDelCount
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 783
	push	2180					; 00000884H
	mov	edx, DWORD PTR ?NoOfResets@TCPObj@@2HA	; TCPObj::NoOfResets
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 784
	push	520					; 00000208H
	mov	eax, DWORD PTR ?ReceiveInPtr@EtherObj@@2JA ; EtherObj::ReceiveInPtr
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 785
	push	540					; 0000021cH
	mov	ecx, DWORD PTR ?ReceiveOutPtr@EtherObj@@2JA ; EtherObj::ReceiveOutPtr
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 786
	push	880					; 00000370H
	mov	edx, DWORD PTR ?SendInPtr@EtherObj@@2JA	; EtherObj::SendInPtr
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 787
	push	900					; 00000384H
	mov	eax, DWORD PTR ?SendOutPtr@EtherObj@@2JA ; EtherObj::SendOutPtr
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
$L3123:
; Line 792
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	sub	eax, DWORD PTR ?totalstarttime@apptask@@2JA ; apptask::totalstarttime
	mov	ecx, DWORD PTR ?totalcurtime@apptask@@2JA ; apptask::totalcurtime
	add	ecx, eax
	mov	DWORD PTR ?totalcurtime@apptask@@2JA, ecx ; apptask::totalcurtime
; Line 794
	jmp	$L3083
$L3084:
; Line 796
	lea	ecx, DWORD PTR _task$[ebp]
	call	?AOAapplink32@AOATask@@QAEHXZ		; AOATask::AOAapplink32
; Line 797
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAExit@AOAProtected@@QAEXXZ		; AOAProtected::AOAExit
; Line 798
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
$SG3145	DB	'RCV:', 00H
	ORG $+3
$SG3159	DB	'RCV Task: Receive Overrun!', 00H
	ORG $+1
$SG3163	DB	'TDL IS FULL!', 00H
	ORG $+3
$SG3173	DB	'Hardware Type Mismatch in ARP: -1', 00H
	ORG $+2
$SG3175	DB	'Protocol Mismatch in ARP: -2', 00H
	ORG $+3
$SG3177	DB	'Length of Hardware Address Mismatch in ARP: -3', 00H
	ORG $+1
$SG3179	DB	'Protocol Address Length Mismatch in ARP: -4', 00H
$SG3181	DB	'Not a Request or Reply, can''t handle it!: -5', 00H
	ORG $+3
$SG3183	DB	'Should never happen in ARP, Catastrophic: -6', 00H
	ORG $+3
$SG3185	DB	'IP No Match!Not An Error: It is a broadcast : -7', 00H
	ORG $+3
$SG3187	DB	'TDL Slot or Memory Error Catastrophic - 8!', 00H
	ORG $+1
$SG3189	DB	'TDL Slot or Memory Error Catastrophic! - 9', 00H
	ORG $+1
$SG3199	DB	'Packet Size is less than the header IP: -1', 00H
	ORG $+1
$SG3201	DB	'Packet Size is large! IP: -2', 00H
	ORG $+3
$SG3203	DB	'Not our packet, Throw it out! IP: -3', 00H
	ORG $+3
$SG3205	DB	'Fragmented Data IP: -4', 00H
	ORG $+1
$SG3207	DB	'No Data in the Datagram! IP: -5', 00H
$SG3209	DB	'IP Destination do not Match! IP: -6', 00H
$SG3211	DB	'Other Packets IP: -7', 00H
	ORG $+3
$SG3213	DB	'Checksum Error! IP: -8', 00H
	ORG $+1
$SG3215	DB	'Discard the packet! IP: -9', 00H
	ORG $+1
$SG3217	DB	'Length of data to send is less than 1 byte IP: -10', 00H
	ORG $+1
$SG3219	DB	'Length of data to send is greater than max send size IP:'
	DB	' -11', 00H
	ORG $+3
$SG3221	DB	'TDL pointer is out of range EO: -12', 00H
$SG3223	DB	'Data buffer is out of range EO: -13', 00H
$SG3225	DB	'Packet size is less header size UDP: -14', 00H
	ORG $+3
$SG3227	DB	'Packet is not for our port UDP: -15', 00H
$SG3229	DB	'Packet size is less than 3 FTP: -16', 00H
$SG3231	DB	'Packet is less than minimum length TCP: -17', 00H
$SG3233	DB	'Packet is not for HTTP Port TCP: -18', 00H
	ORG $+3
$SG3235	DB	'Packet does not have correct checksum TCP: -19', 00H
	ORG $+1
$SG3237	DB	'Retrieving TCB Record Failed TCP: -20', 00H
	ORG $+2
$SG3239	DB	'Dpd pointer is out of range TCP: -22', 00H
	ORG $+3
$SG3241	DB	'Data buffer is out of range TCP: -23', 00H
	ORG $+3
$SG3243	DB	'Length of data to send is less than 1 byte IP: -24', 00H
	ORG $+1
$SG3245	DB	'Length of data to send is greater than max send size IP:'
	DB	' -25', 00H
	ORG $+3
$SG3247	DB	'TDL pointer is out of range EO: -26', 00H
$SG3249	DB	'Data buffer is out of range EO: -27', 00H
$SG3251	DB	'packet size is larger than record size HTTPList: -28', 00H
	ORG $+3
$SG3253	DB	'http buffer is full HTTPList: -29', 00H
	ORG $+2
$SG3255	DB	'valid bit is not set HTTPList: -30', 00H
	ORG $+1
$SG3257	DB	'TCPObj:OtherHandler Not a GET request -31', 00H
	ORG $+2
$SG3259	DB	'RcvTask is Ending', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -416
_ar$ = -408
_ip$ = -108
_task$ = -88
_Data$ = -20
_abc$ = -8
_macaddr$ = -32
_i$ = -36
_j$ = -40
_loopcount1$ = -16
_retcode$ = -4
_empty$ = -112
_RXSize$ = -412
_lcount$ = -12
_vcount$ = -24
_PacketType$ = -120
_starttime$ = -116
?RcvTask@apptask@@QAEXJ@Z PROC NEAR			; apptask::RcvTask
; Line 806
	push	ebp
	mov	ebp, esp
	sub	esp, 424				; 000001a8H
	mov	DWORD PTR _this$[ebp], ecx
; Line 807
	lea	ecx, DWORD PTR _ar$[ebp]
	call	??0ARPObj@@QAE@XZ			; ARPObj::ARPObj
; Line 808
	lea	ecx, DWORD PTR _ip$[ebp]
	call	??0IPObj@@QAE@XZ			; IPObj::IPObj
; Line 809
	lea	ecx, DWORD PTR _task$[ebp]
	call	??0AOATask@@QAE@XZ			; AOATask::AOATask
; Line 813
	lea	eax, DWORD PTR _abc$[ebp]
	mov	DWORD PTR _Data$[ebp], eax
; Line 816
	mov	DWORD PTR _i$[ebp], 0
	mov	DWORD PTR _j$[ebp], 0
; Line 817
	mov	DWORD PTR _loopcount1$[ebp], 0
; Line 818
	mov	DWORD PTR _retcode$[ebp], 0
; Line 819
	mov	DWORD PTR _empty$[ebp], 0
; Line 820
	mov	DWORD PTR _RXSize$[ebp], 0
; Line 821
	mov	DWORD PTR _lcount$[ebp], 0
	mov	DWORD PTR _vcount$[ebp], 0
; Line 822
	mov	DWORD PTR _PacketType$[ebp], 0
; Line 823
	mov	DWORD PTR _starttime$[ebp], 0
; Line 825
	mov	DWORD PTR ?ippackcount@apptask@@2JA, 0	; apptask::ippackcount
; Line 826
	mov	DWORD PTR ?arppackcount@apptask@@2JA, 0	; apptask::arppackcount
; Line 827
	mov	DWORD PTR ?upCompleteNotSetCount@apptask@@2JA, 0 ; apptask::upCompleteNotSetCount
; Line 828
	mov	DWORD PTR ?notForThisNodeCount@apptask@@2JA, 0 ; apptask::notForThisNodeCount
; Line 829
	mov	DWORD PTR ?notArpOrIpCount@apptask@@2JA, 0 ; apptask::notArpOrIpCount
; Line 831
	xor	ecx, ecx
	test	ecx, ecx
	je	SHORT $L3144
; Line 833
	push	486					; 000001e6H
	push	OFFSET FLAT:$SG3145
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 834
	push	620					; 0000026cH
	mov	edx, DWORD PTR ?Current_Task@apptask@@2HA ; apptask::Current_Task
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
$L3144:
; Line 837
	cmp	DWORD PTR ?Application_Status@AOAProtected@@2HA, 2 ; AOAProtected::Application_Status
	je	$L3148
; Line 839
	xor	eax, eax
	test	eax, eax
	je	SHORT $L3149
; Line 840
	push	620					; 0000026cH
	mov	ecx, DWORD PTR ?Current_Task@apptask@@2HA ; apptask::Current_Task
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
$L3149:
; Line 843
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
; Line 844
	mov	edx, DWORD PTR ?TotalDataRcvd@apptask@@2JA ; apptask::TotalDataRcvd
	add	edx, DWORD PTR _RXSize$[ebp]
	mov	DWORD PTR ?TotalDataRcvd@apptask@@2JA, edx ; apptask::TotalDataRcvd
; Line 845
	xor	eax, eax
	test	eax, eax
	je	SHORT $L3150
; Line 846
	push	560					; 00000230H
	mov	ecx, DWORD PTR _RXSize$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
$L3150:
; Line 847
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	mov	DWORD PTR _starttime$[ebp], eax
; Line 848
	cmp	DWORD PTR _RXSize$[ebp], -1
	jne	SHORT $L3151
; Line 852
	mov	edx, DWORD PTR ?upCompleteNotSetCount@apptask@@2JA ; apptask::upCompleteNotSetCount
	add	edx, 1
	mov	DWORD PTR ?upCompleteNotSetCount@apptask@@2JA, edx ; apptask::upCompleteNotSetCount
; Line 853
	lea	ecx, DWORD PTR _task$[ebp]
	call	?AOAsuspendTask@AOATask@@QAEXXZ		; AOATask::AOAsuspendTask
; Line 854
	xor	eax, eax
	test	eax, eax
	je	SHORT $L3152
; Line 855
	push	580					; 00000244H
	mov	ecx, DWORD PTR ?upCompleteNotSetCount@apptask@@2JA ; apptask::upCompleteNotSetCount
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
$L3152:
; Line 856
	jmp	$L3144
$L3151:
; Line 858
	cmp	DWORD PTR _RXSize$[ebp], -2		; fffffffeH
	jne	SHORT $L3153
; Line 861
	mov	edx, DWORD PTR ?notForThisNodeCount@apptask@@2JA ; apptask::notForThisNodeCount
	add	edx, 1
	mov	DWORD PTR ?notForThisNodeCount@apptask@@2JA, edx ; apptask::notForThisNodeCount
; Line 862
	lea	ecx, DWORD PTR _task$[ebp]
	call	?AOAsuspendTask@AOATask@@QAEXXZ		; AOATask::AOAsuspendTask
; Line 863
	xor	eax, eax
	test	eax, eax
	je	SHORT $L3154
; Line 864
	push	600					; 00000258H
	mov	ecx, DWORD PTR ?notForThisNodeCount@apptask@@2JA ; apptask::notForThisNodeCount
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
$L3154:
; Line 865
	jmp	$L3144
$L3153:
; Line 867
	cmp	DWORD PTR _RXSize$[ebp], -3		; fffffffdH
	jne	SHORT $L3155
; Line 871
	mov	edx, DWORD PTR ?notArpOrIpCount@apptask@@2JA ; apptask::notArpOrIpCount
	add	edx, 1
	mov	DWORD PTR ?notArpOrIpCount@apptask@@2JA, edx ; apptask::notArpOrIpCount
; Line 872
	lea	ecx, DWORD PTR _task$[ebp]
	call	?AOAsuspendTask@AOATask@@QAEXXZ		; AOATask::AOAsuspendTask
; Line 873
	xor	eax, eax
	test	eax, eax
	je	SHORT $L3156
; Line 874
	push	820					; 00000334H
	mov	ecx, DWORD PTR ?notArpOrIpCount@apptask@@2JA ; apptask::notArpOrIpCount
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
$L3156:
; Line 875
	jmp	$L3144
$L3155:
; Line 877
	cmp	DWORD PTR _RXSize$[ebp], -4		; fffffffcH
	jne	SHORT $L3157
; Line 880
	lea	ecx, DWORD PTR _task$[ebp]
	call	?AOAsuspendTask@AOATask@@QAEXXZ		; AOATask::AOAsuspendTask
; Line 881
	xor	edx, edx
	test	edx, edx
	je	SHORT $L3158
; Line 882
	push	880					; 00000370H
	push	OFFSET FLAT:$SG3159
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
$L3158:
; Line 883
	jmp	$L3144
$L3157:
; Line 887
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?TDLFull@EtherObj@@QAEHXZ		; EtherObj::TDLFull
	test	eax, eax
	je	SHORT $L3162
; Line 892
	push	3700					; 00000e74H
	mov	eax, DWORD PTR ?SendInPtr@EtherObj@@2JA	; EtherObj::SendInPtr
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 893
	push	3720					; 00000e88H
	mov	ecx, DWORD PTR ?SendOutPtr@EtherObj@@2JA ; EtherObj::SendOutPtr
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 894
	push	3740					; 00000e9cH
	push	OFFSET FLAT:$SG3163
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 895
	lea	ecx, DWORD PTR _task$[ebp]
	call	?AOAsuspendTask@AOATask@@QAEXXZ		; AOATask::AOAsuspendTask
; Line 896
	jmp	SHORT $L3157
$L3162:
; Line 898
	cmp	DWORD PTR _RXSize$[ebp], 0
	jl	$L3191
; Line 900
	cmp	DWORD PTR _PacketType$[ebp], 2054	; 00000806H
	jne	$L3165
; Line 902
	mov	edx, DWORD PTR ?arppackcount@apptask@@2JA ; apptask::arppackcount
	add	edx, 1
	mov	DWORD PTR ?arppackcount@apptask@@2JA, edx ; apptask::arppackcount
; Line 903
	xor	eax, eax
	test	eax, eax
	je	SHORT $L3166
; Line 904
	push	840					; 00000348H
	mov	ecx, DWORD PTR ?arppackcount@apptask@@2JA ; apptask::arppackcount
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
$L3166:
; Line 906
	mov	edx, DWORD PTR ?Current_Task@apptask@@2HA ; apptask::Current_Task
	push	edx
	mov	eax, DWORD PTR _RXSize$[ebp]
	push	eax
	mov	ecx, DWORD PTR _Data$[ebp]
	push	ecx
	lea	ecx, DWORD PTR _ar$[ebp]
	call	?ARPHandler@ARPObj@@QAEHPADHH@Z		; ARPObj::ARPHandler
	mov	DWORD PTR _retcode$[ebp], eax
; Line 908
	mov	edx, DWORD PTR _retcode$[ebp]
	mov	DWORD PTR -420+[ebp], edx
	mov	eax, DWORD PTR -420+[ebp]
	add	eax, 9
	mov	DWORD PTR -420+[ebp], eax
	cmp	DWORD PTR -420+[ebp], 8
	ja	$L3169
	mov	ecx, DWORD PTR -420+[ebp]
	jmp	DWORD PTR $L3548[ecx*4]
$L3172:
; Line 910
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG3173
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 911
	jmp	$L3169
$L3174:
; Line 913
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG3175
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 914
	jmp	$L3169
$L3176:
; Line 916
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG3177
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 917
	jmp	$L3169
$L3178:
; Line 919
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG3179
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 920
	jmp	$L3169
$L3180:
; Line 922
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG3181
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 923
	jmp	SHORT $L3169
$L3182:
; Line 925
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG3183
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 926
	jmp	SHORT $L3169
$L3184:
; Line 928
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG3185
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 929
	mov	edx, DWORD PTR _j$[ebp]
	add	edx, 1
	mov	DWORD PTR _j$[ebp], edx
; Line 930
	push	3780					; 00000ec4H
	mov	eax, DWORD PTR _j$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 931
	jmp	SHORT $L3169
$L3186:
; Line 933
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG3187
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 934
	jmp	SHORT $L3169
$L3188:
; Line 936
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG3189
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
$L3169:
; Line 940
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?discardPacket@EtherObj@@QAEHXZ		; EtherObj::discardPacket
	mov	DWORD PTR _retcode$[ebp], eax
; Line 941
	lea	ecx, DWORD PTR _task$[ebp]
	call	?AOAsuspendTask@AOATask@@QAEXXZ		; AOATask::AOAsuspendTask
; Line 944
	jmp	$L3191
$L3165:
	cmp	DWORD PTR _PacketType$[ebp], 2048	; 00000800H
	jne	$L3191
; Line 947
	mov	ecx, DWORD PTR ?ippackcount@apptask@@2JA ; apptask::ippackcount
	add	ecx, 1
	mov	DWORD PTR ?ippackcount@apptask@@2JA, ecx ; apptask::ippackcount
; Line 948
	xor	edx, edx
	test	edx, edx
	je	SHORT $L3192
; Line 949
	push	860					; 0000035cH
	mov	eax, DWORD PTR ?ippackcount@apptask@@2JA ; apptask::ippackcount
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
$L3192:
; Line 950
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
; Line 952
	mov	eax, DWORD PTR _retcode$[ebp]
	mov	DWORD PTR -424+[ebp], eax
	mov	ecx, DWORD PTR -424+[ebp]
	add	ecx, 31					; 0000001fH
	mov	DWORD PTR -424+[ebp], ecx
	cmp	DWORD PTR -424+[ebp], 30		; 0000001eH
	ja	$L3195
	mov	edx, DWORD PTR -424+[ebp]
	jmp	DWORD PTR $L3549[edx*4]
$L3198:
; Line 954
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG3199
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 955
	jmp	$L3195
$L3200:
; Line 957
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG3201
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 958
	jmp	$L3195
$L3202:
; Line 960
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG3203
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 961
	jmp	$L3195
$L3204:
; Line 963
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG3205
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 964
	jmp	$L3195
$L3206:
; Line 966
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG3207
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 967
	jmp	$L3195
$L3208:
; Line 969
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG3209
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 970
	jmp	$L3195
$L3210:
; Line 972
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG3211
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 973
	jmp	$L3195
$L3212:
; Line 975
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG3213
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 976
	jmp	$L3195
$L3214:
; Line 978
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG3215
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 979
	jmp	$L3195
$L3216:
; Line 981
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG3217
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 982
	jmp	$L3195
$L3218:
; Line 984
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG3219
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 985
	jmp	$L3195
$L3220:
; Line 987
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG3221
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 988
	jmp	$L3195
$L3222:
; Line 990
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG3223
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 991
	jmp	$L3195
$L3224:
; Line 993
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG3225
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 994
	jmp	$L3195
$L3226:
; Line 996
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG3227
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 997
	jmp	$L3195
$L3228:
; Line 999
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG3229
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1000
	jmp	$L3195
$L3230:
; Line 1002
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG3231
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1003
	jmp	$L3195
$L3232:
; Line 1005
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG3233
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1006
	jmp	$L3195
$L3234:
; Line 1008
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG3235
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1009
	jmp	$L3195
$L3236:
; Line 1011
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG3237
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1012
	jmp	$L3195
$L3238:
; Line 1014
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG3239
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1015
	jmp	$L3195
$L3240:
; Line 1017
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG3241
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1018
	jmp	$L3195
$L3242:
; Line 1020
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG3243
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1021
	jmp	$L3195
$L3244:
; Line 1023
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG3245
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1024
	jmp	$L3195
$L3246:
; Line 1026
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG3247
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1027
	jmp	SHORT $L3195
$L3248:
; Line 1029
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG3249
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1030
	jmp	SHORT $L3195
$L3250:
; Line 1032
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG3251
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1033
	jmp	SHORT $L3195
$L3252:
; Line 1035
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG3253
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1036
	jmp	SHORT $L3195
$L3254:
; Line 1038
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG3255
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1039
	jmp	SHORT $L3195
$L3256:
; Line 1041
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG3257
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
$L3195:
; Line 1046
	cmp	DWORD PTR _retcode$[ebp], -1717986919	; 99999999H
	je	SHORT $L3258
; Line 1047
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?discardPacket@EtherObj@@QAEHXZ		; EtherObj::discardPacket
	mov	DWORD PTR _retcode$[ebp], eax
$L3258:
; Line 1048
	lea	ecx, DWORD PTR _task$[ebp]
	call	?AOAsuspendTask@AOATask@@QAEXXZ		; AOATask::AOAsuspendTask
$L3191:
; Line 1053
	jmp	$L3144
$L3148:
; Line 1055
	push	3520					; 00000dc0H
	push	OFFSET FLAT:$SG3259
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1056
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAExit@AOAProtected@@QAEXXZ		; AOAProtected::AOAExit
; Line 1057
	mov	esp, ebp
	pop	ebp
	ret	4
$L3548:
	DD	$L3188
	DD	$L3186
	DD	$L3184
	DD	$L3182
	DD	$L3180
	DD	$L3178
	DD	$L3176
	DD	$L3174
	DD	$L3172
$L3549:
	DD	$L3256
	DD	$L3254
	DD	$L3252
	DD	$L3250
	DD	$L3248
	DD	$L3246
	DD	$L3244
	DD	$L3242
	DD	$L3240
	DD	$L3238
	DD	$L3195
	DD	$L3236
	DD	$L3234
	DD	$L3232
	DD	$L3230
	DD	$L3228
	DD	$L3226
	DD	$L3224
	DD	$L3222
	DD	$L3220
	DD	$L3218
	DD	$L3216
	DD	$L3214
	DD	$L3212
	DD	$L3210
	DD	$L3208
	DD	$L3206
	DD	$L3204
	DD	$L3202
	DD	$L3200
	DD	$L3198
?RcvTask@apptask@@QAEXJ@Z ENDP				; apptask::RcvTask
_TEXT	ENDS
PUBLIC	?getCurrentTask@apptask@@QAEHXZ			; apptask::getCurrentTask
_TEXT	SEGMENT
_this$ = -4
?getCurrentTask@apptask@@QAEHXZ PROC NEAR		; apptask::getCurrentTask
; Line 1063
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 1064
	mov	eax, DWORD PTR ?Current_Task@apptask@@2HA ; apptask::Current_Task
; Line 1065
	mov	esp, ebp
	pop	ebp
	ret	0
?getCurrentTask@apptask@@QAEHXZ ENDP			; apptask::getCurrentTask
_this$ = -12
_n$ = -8
_r$ = -4
?Scheduler_Algorithm_1@apptask@@QAEHXZ PROC NEAR	; apptask::Scheduler_Algorithm_1
; Line 1070
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 1071
	mov	DWORD PTR _n$[ebp], 0
	mov	DWORD PTR _r$[ebp], 0
; Line 1073
	mov	eax, DWORD PTR ?RunRegister@AOAProtected@@2JA ; AOAProtected::RunRegister
	mov	DWORD PTR _r$[ebp], eax
; Line 1074
	mov	ecx, DWORD PTR _r$[ebp]
	mov	edx, DWORD PTR ?ScheduleArray@apptask@@2PAHA[ecx*4]
	mov	DWORD PTR _n$[ebp], edx
; Line 1076
	mov	eax, DWORD PTR _n$[ebp]
; Line 1078
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
; Line 1085
	push	ebp
	mov	ebp, esp
	sub	esp, 60					; 0000003cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 1086
	lea	ecx, DWORD PTR _task$[ebp]
	call	??0AOATask@@QAE@XZ			; AOATask::AOATask
; Line 1087
	mov	DWORD PTR _Task_ID$[ebp], 4
$L3277:
; Line 1090
	mov	eax, DWORD PTR _Task_ID$[ebp]
	cmp	DWORD PTR ?Task_Status@apptask@@2PAHA[eax*4], 0
	je	SHORT $L3278
	cmp	DWORD PTR _Task_ID$[ebp], 8000		; 00001f40H
	jge	SHORT $L3278
; Line 1091
	mov	ecx, DWORD PTR _Task_ID$[ebp]
	add	ecx, 1
	mov	DWORD PTR _Task_ID$[ebp], ecx
	jmp	SHORT $L3277
$L3278:
; Line 1092
	cmp	DWORD PTR _Task_ID$[ebp], 8000		; 00001f40H
	jne	SHORT $L3279
; Line 1094
	or	eax, -1
	jmp	SHORT $L3272
$L3279:
; Line 1097
	mov	edx, DWORD PTR _Task_ID$[ebp]
	shl	edx, 14					; 0000000eH
	mov	eax, DWORD PTR ?StackBase@AOATask@@2JA	; AOATask::StackBase
	sub	eax, edx
	mov	DWORD PTR _Task_Stack$[ebp], eax
; Line 1099
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
; Line 1100
	cmp	DWORD PTR _flag$[ebp], 1
	jne	SHORT $L3280
; Line 1101
	mov	edx, DWORD PTR _Task_ID$[ebp]
	mov	DWORD PTR ?Task_Status@apptask@@2PAHA[edx*4], 0
; Line 1102
	jmp	SHORT $L3281
$L3280:
	mov	eax, DWORD PTR _Task_ID$[ebp]
	mov	DWORD PTR ?Task_Status@apptask@@2PAHA[eax*4], 1
$L3281:
; Line 1104
	mov	eax, DWORD PTR _Task_ID$[ebp]
$L3272:
; Line 1105
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
$SG3293	DB	'TaskID is out of range', 00H
	ORG $+1
$SG3297	DB	'apptask:insertHttpTask circular list is full', 00H
	ORG $+3
$SG3299	DB	'apptask:insertHttpTask stack is empty', 00H
_DATA	ENDS
_TEXT	SEGMENT
_tcbrno$ = 8
_timerc$ = 12
_this$ = -12
_taskid$ = -4
?insertHttpTask@apptask@@QAEHHJ@Z PROC NEAR		; apptask::insertHttpTask
; Line 1112
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 1116
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 396				; 0000018cH
	call	?getCount@WCirList@@QAEHXZ		; WCirList::getCount
	cmp	eax, 5000				; 00001388H
	jle	SHORT $L3289
; Line 1118
	push	3940					; 00000f64H
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 396				; 0000018cH
	call	?getCount@WCirList@@QAEHXZ		; WCirList::getCount
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1119
	mov	DWORD PTR ?Application_Status@AOAProtected@@2HA, 2 ; AOAProtected::Application_Status
; Line 1120
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAExit@AOAProtected@@QAEXXZ		; AOAProtected::AOAExit
$L3289:
; Line 1123
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 388				; 00000184H
	call	?empty@WStack@@QAEHXZ			; WStack::empty
	test	eax, eax
	jne	$L3290
; Line 1125
	lea	eax, DWORD PTR _taskid$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 388				; 00000184H
	call	?pop@WStack@@QAEHPAH@Z			; WStack::pop
; Line 1127
	mov	ecx, DWORD PTR _taskid$[ebp]
	cmp	ecx, DWORD PTR ?MinTaskId@apptask@@2JA	; apptask::MinTaskId
	jl	SHORT $L3292
	mov	edx, DWORD PTR _taskid$[ebp]
	cmp	edx, DWORD PTR ?MaxTaskId@apptask@@2JA	; apptask::MaxTaskId
	jle	SHORT $L3291
$L3292:
; Line 1129
	push	3540					; 00000dd4H
	push	OFFSET FLAT:$SG3293
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1130
	mov	eax, -1000				; fffffc18H
	jmp	$L3286
$L3291:
; Line 1133
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 396				; 0000018cH
	call	?full@WCirList@@QAEHXZ			; WCirList::full
	test	eax, eax
	jne	SHORT $L3294
; Line 1135
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
; Line 1137
	xor	eax, eax
	test	eax, eax
	je	SHORT $L3295
; Line 1138
	push	1
	mov	ecx, DWORD PTR _taskid$[ebp]
	sub	ecx, DWORD PTR ?MinTaskId@apptask@@2JA	; apptask::MinTaskId
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 404				; 00000194H
	call	?insert@WTTrace@@QAEHHG@Z		; WTTrace::insert
$L3295:
; Line 1140
	jmp	SHORT $L3296
$L3294:
; Line 1141
	push	3840					; 00000f00H
	push	OFFSET FLAT:$SG3297
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
$L3296:
; Line 1143
	jmp	SHORT $L3298
$L3290:
; Line 1146
	push	3540					; 00000dd4H
	push	OFFSET FLAT:$SG3299
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1147
	mov	DWORD PTR ?Application_Status@AOAProtected@@2HA, 2 ; AOAProtected::Application_Status
; Line 1148
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAExit@AOAProtected@@QAEXXZ		; AOAProtected::AOAExit
$L3298:
; Line 1154
	xor	eax, eax
$L3286:
; Line 1155
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
$SG3311	DB	'                ', 00H
	ORG $+3
$SG3313	DB	'ERROR!', 00H
	ORG $+1
$SG3314	DB	'Interrupt Code:', 00H
$SG3315	DB	'Current Task: ', 00H
	ORG $+1
$SG3316	DB	'Fn_Code:', 00H
	ORG $+3
$SG3317	DB	'CalledMethod: ', 00H
	ORG $+1
$SG3318	DB	'STACK: ', 00H
$SG3322	DB	'Registers: ', 00H
$SG3326	DB	'Enter Starting Address of Location: ', 00H
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
; Line 1171
	push	ebp
	mov	ebp, esp
	sub	esp, 84					; 00000054H
	mov	DWORD PTR _this$[ebp], ecx
; Line 1172
	lea	ecx, DWORD PTR _EO$[ebp]
	call	??0EtherObj@@QAE@XZ			; EtherObj::EtherObj
; Line 1173
	mov	DWORD PTR _k$[ebp], 0
; Line 1174
	mov	DWORD PTR _data1$[ebp], 0
; Line 1175
	mov	DWORD PTR _startAddr$[ebp], 0
; Line 1177
	mov	DWORD PTR _errorFlag$[ebp], 0
; Line 1178
	mov	DWORD PTR _TraceStr$[ebp], OFFSET FLAT:$SG3311
; Line 1179
	lea	ecx, DWORD PTR _task$[ebp]
	call	??0AOATask@@QAE@XZ			; AOATask::AOATask
; Line 1181
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsti@AOAProtected@@QAEXXZ		; AOAProtected::AOAsti
; Line 1183
	push	160					; 000000a0H
	push	OFFSET FLAT:$SG3313
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1185
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	BYTE PTR _a$[ebp], al
; Line 1186
	push	4000					; 00000fa0H
	push	0
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAclearScreen@AOAProtected@@QAEXHH@Z	; AOAProtected::AOAclearScreen
; Line 1188
	push	28					; 0000001cH
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetSharedMem@AOAProtected@@QAEJH@Z	; AOAProtected::AOAgetSharedMem
	mov	DWORD PTR _errorFlag$[ebp], eax
; Line 1189
	push	180					; 000000b4H
	push	OFFSET FLAT:$SG3314
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1190
	push	210					; 000000d2H
	mov	eax, DWORD PTR _errorFlag$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1191
	push	232					; 000000e8H
	push	OFFSET FLAT:$SG3315
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1192
	push	258					; 00000102H
	mov	ecx, DWORD PTR ?Current_Task@apptask@@2HA ; apptask::Current_Task
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1193
	push	32					; 00000020H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetSharedMem@AOAProtected@@QAEJH@Z	; AOAProtected::AOAgetSharedMem
	mov	DWORD PTR _errorFlag$[ebp], eax
; Line 1194
	push	280					; 00000118H
	push	OFFSET FLAT:$SG3316
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1195
	push	298					; 0000012aH
	mov	edx, DWORD PTR _errorFlag$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1196
	push	320					; 00000140H
	push	OFFSET FLAT:$SG3317
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1199
	mov	eax, DWORD PTR _TraceStr$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetSharedMemTraceString@AOAProtected@@QAEXPAD@Z ; AOAProtected::AOAgetSharedMemTraceString
; Line 1200
	push	350					; 0000015eH
	mov	ecx, DWORD PTR _TraceStr$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1201
	push	76					; 0000004cH
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetSharedMem@AOAProtected@@QAEJH@Z	; AOAProtected::AOAgetSharedMem
	mov	DWORD PTR _errorFlag$[ebp], eax
; Line 1202
	push	580					; 00000244H
	mov	edx, DWORD PTR _errorFlag$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1203
	push	96					; 00000060H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetSharedMem@AOAProtected@@QAEJH@Z	; AOAProtected::AOAgetSharedMem
	mov	DWORD PTR _errorFlag$[ebp], eax
; Line 1204
	push	600					; 00000258H
	mov	eax, DWORD PTR _errorFlag$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1206
	push	480					; 000001e0H
	push	OFFSET FLAT:$SG3318
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1209
	mov	DWORD PTR _k$[ebp], 0
	jmp	SHORT $L3319
$L3320:
	mov	ecx, DWORD PTR _k$[ebp]
	add	ecx, 1
	mov	DWORD PTR _k$[ebp], ecx
$L3319:
	cmp	DWORD PTR _k$[ebp], 48			; 00000030H
	jge	SHORT $L3321
; Line 1214
	mov	edx, DWORD PTR _k$[ebp]
	shl	edx, 2
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetStackPOP@AOAProtected@@QAEJH@Z	; AOAProtected::AOAgetStackPOP
	mov	DWORD PTR _data1$[ebp], eax
; Line 1215
	mov	eax, DWORD PTR _k$[ebp]
	imul	eax, 20					; 00000014H
	add	eax, 640				; 00000280H
	push	eax
	mov	ecx, DWORD PTR _data1$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1216
	jmp	SHORT $L3320
$L3321:
; Line 1219
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	BYTE PTR _a$[ebp], al
; Line 1221
	push	1120					; 00000460H
	push	OFFSET FLAT:$SG3322
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1227
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	BYTE PTR _a$[ebp], al
; Line 1229
	mov	BYTE PTR _a$[ebp], 0
$L3324:
; Line 1230
	movsx	edx, BYTE PTR _a$[ebp]
	cmp	edx, 27					; 0000001bH
	je	$L3325
; Line 1232
	push	3840					; 00000f00H
	push	OFFSET FLAT:$SG3326
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1233
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetHex@AOAProtected@@QAEHXZ		; AOAProtected::AOAgetHex
	mov	DWORD PTR _startAddr$[ebp], eax
; Line 1234
	push	4000					; 00000fa0H
	push	0
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAclearScreen@AOAProtected@@QAEXHH@Z	; AOAProtected::AOAclearScreen
; Line 1236
	mov	DWORD PTR _k$[ebp], 0
	jmp	SHORT $L3327
$L3328:
	mov	eax, DWORD PTR _k$[ebp]
	add	eax, 1
	mov	DWORD PTR _k$[ebp], eax
$L3327:
	cmp	DWORD PTR _k$[ebp], 128			; 00000080H
	jge	SHORT $L3329
; Line 1238
	mov	ecx, DWORD PTR _k$[ebp]
	mov	edx, DWORD PTR _startAddr$[ebp]
	lea	eax, DWORD PTR [edx+ecx*4]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetMem@AOAProtected@@QAEJJ@Z	; AOAProtected::AOAgetMem
	mov	DWORD PTR _data1$[ebp], eax
; Line 1239
	mov	ecx, DWORD PTR _k$[ebp]
	imul	ecx, 20					; 00000014H
	add	ecx, 320				; 00000140H
	push	ecx
	mov	edx, DWORD PTR _data1$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1240
	jmp	SHORT $L3328
$L3329:
; Line 1241
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacterInt@AOAProtected@@QAEDXZ ; AOAProtected::AOAgetCharacterInt
	mov	BYTE PTR _a$[ebp], al
; Line 1242
	jmp	$L3324
$L3325:
; Line 1244
	lea	ecx, DWORD PTR _task$[ebp]
	call	?AOAapplink32@AOATask@@QAEHXZ		; AOATask::AOAapplink32
; Line 1245
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAExit@AOAProtected@@QAEXXZ		; AOAProtected::AOAExit
; Line 1246
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
$SG3334	DB	'HttpRequests:', 00H
	ORG $+2
$SG3335	DB	'GetCount:', 00H
	ORG $+2
$SG3336	DB	'SynCount:', 00H
	ORG $+2
$SG3337	DB	'SynAckCount:', 00H
	ORG $+3
$SG3338	DB	'MaxSynGetTime:', 00H
	ORG $+1
$SG3339	DB	'MaxConnectionTime:', 00H
	ORG $+1
$SG3340	DB	'MaxNoOfTasksUsed:', 00H
	ORG $+2
$SG3341	DB	'MaxNoOfTCBsUsed:', 00H
	ORG $+3
$SG3342	DB	'UpCNotSetCount:', 00H
$SG3343	DB	'NotForTNoddeCount:', 00H
	ORG $+1
$SG3344	DB	'NotARPIPCount:', 00H
	ORG $+1
$SG3345	DB	'MaxSynGetThresCount:', 00H
	ORG $+3
$SG3346	DB	'NoOfRetransmissions', 00H
$SG3347	DB	'AverageSynGetTime', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -360
_tcp$ = -356
?printStatistics@apptask@@QAEXXZ PROC NEAR		; apptask::printStatistics
; Line 1251
	push	ebp
	mov	ebp, esp
	sub	esp, 360				; 00000168H
	mov	DWORD PTR _this$[ebp], ecx
; Line 1252
	lea	ecx, DWORD PTR _tcp$[ebp]
	call	??0TCPObj@@QAE@XZ			; TCPObj::TCPObj
; Line 1254
	push	1758					; 000006deH
	push	0
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAclearScreen@AOAProtected@@QAEXHH@Z	; AOAProtected::AOAclearScreen
; Line 1256
	push	480					; 000001e0H
	push	OFFSET FLAT:$SG3334
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1257
	push	520					; 00000208H
	mov	eax, DWORD PTR ?HttpRequests@TCPObj@@2KA ; TCPObj::HttpRequests
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1258
	push	560					; 00000230H
	push	OFFSET FLAT:$SG3335
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1259
	push	600					; 00000258H
	mov	ecx, DWORD PTR ?GetCount@TCPObj@@2KA	; TCPObj::GetCount
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1261
	push	640					; 00000280H
	push	OFFSET FLAT:$SG3336
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1262
	push	680					; 000002a8H
	mov	edx, DWORD PTR ?SynCount@TCPObj@@2KA	; TCPObj::SynCount
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1263
	push	720					; 000002d0H
	push	OFFSET FLAT:$SG3337
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1264
	push	760					; 000002f8H
	mov	eax, DWORD PTR ?SynAckCount@TCPObj@@2KA	; TCPObj::SynAckCount
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1266
	push	800					; 00000320H
	push	OFFSET FLAT:$SG3338
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1267
	push	840					; 00000348H
	mov	ecx, DWORD PTR ?MaxSynGetTime@TCPObj@@2KA ; TCPObj::MaxSynGetTime
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1268
	push	880					; 00000370H
	push	OFFSET FLAT:$SG3339
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1269
	push	920					; 00000398H
	mov	edx, DWORD PTR ?MaxConnectionTime@TCPObj@@2KA ; TCPObj::MaxConnectionTime
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1271
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG3340
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1272
	push	1000					; 000003e8H
	mov	eax, DWORD PTR ?MaxNoOfTasksUsed@TCPObj@@2KA ; TCPObj::MaxNoOfTasksUsed
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1273
	push	1040					; 00000410H
	push	OFFSET FLAT:$SG3341
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1274
	push	1080					; 00000438H
	mov	ecx, DWORD PTR ?MaxNoOfTCBsUsed@TCPObj@@2KA ; TCPObj::MaxNoOfTCBsUsed
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1276
	push	1120					; 00000460H
	push	OFFSET FLAT:$SG3342
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1277
	push	1160					; 00000488H
	mov	edx, DWORD PTR ?upCompleteNotSetCount@apptask@@2JA ; apptask::upCompleteNotSetCount
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1278
	push	1200					; 000004b0H
	push	OFFSET FLAT:$SG3343
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1279
	push	1240					; 000004d8H
	mov	eax, DWORD PTR ?notForThisNodeCount@apptask@@2JA ; apptask::notForThisNodeCount
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1281
	push	1280					; 00000500H
	push	OFFSET FLAT:$SG3344
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1282
	push	1320					; 00000528H
	mov	ecx, DWORD PTR ?notArpOrIpCount@apptask@@2JA ; apptask::notArpOrIpCount
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1283
	push	1360					; 00000550H
	push	OFFSET FLAT:$SG3345
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1284
	push	1400					; 00000578H
	mov	edx, DWORD PTR ?MaxSynGetThreshCount@TCPObj@@2KA ; TCPObj::MaxSynGetThreshCount
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1286
	push	1440					; 000005a0H
	push	OFFSET FLAT:$SG3346
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1287
	push	1480					; 000005c8H
	mov	eax, DWORD PTR ?NoOfRetransmissions@TCPObj@@2KA ; TCPObj::NoOfRetransmissions
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1289
	push	1520					; 000005f0H
	push	OFFSET FLAT:$SG3347
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1290
	push	1560					; 00000618H
	mov	ecx, DWORD PTR ?TotalSynGetTime@TCPObj@@2KA ; TCPObj::TotalSynGetTime
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1292
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
$SG3354	DB	'MainTask: Receive Over Run Error Caused an Interrrupt!', 00H
	ORG $+1
$SG3356	DB	'MainTask: RDL Buffer is full!', 00H
	ORG $+2
$SG3358	DB	'MainTask: Problem with RDL descriptors', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -16
_rcvcount$ = -12
_EO$ = -8
?checkErrors@apptask@@QAEXXZ PROC NEAR			; apptask::checkErrors
; Line 1297
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	mov	DWORD PTR _this$[ebp], ecx
; Line 1298
	mov	DWORD PTR _rcvcount$[ebp], 0
; Line 1299
	lea	ecx, DWORD PTR _EO$[ebp]
	call	??0EtherObj@@QAE@XZ			; EtherObj::EtherObj
; Line 1301
	lea	ecx, DWORD PTR _EO$[ebp]
	call	?getICR@EtherObj@@QAEHXZ		; EtherObj::getICR
	mov	DWORD PTR _rcvcount$[ebp], eax
; Line 1302
	mov	eax, DWORD PTR _rcvcount$[ebp]
	and	eax, 64					; 00000040H
	cmp	eax, 1
	jne	SHORT $L3353
; Line 1304
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG3354
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1305
	push	3800					; 00000ed8H
	mov	ecx, DWORD PTR _rcvcount$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
$L3353:
; Line 1308
	lea	ecx, DWORD PTR _EO$[ebp]
	call	?RDLfull@EtherObj@@QAEHXZ		; EtherObj::RDLfull
	test	eax, eax
	je	SHORT $L3355
; Line 1310
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG3356
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1311
	push	3760					; 00000eb0H
	mov	edx, DWORD PTR ?ReceiveOutPtr@EtherObj@@2JA ; EtherObj::ReceiveOutPtr
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1312
	push	3780					; 00000ec4H
	lea	ecx, DWORD PTR _EO$[ebp]
	call	?getRDTail@EtherObj@@QAEHXZ		; EtherObj::getRDTail
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
$L3355:
; Line 1315
	cmp	DWORD PTR ?ReceiveOutPtr@EtherObj@@2JA, 4096 ; EtherObj::ReceiveOutPtr, 00001000H
	jle	SHORT $L3357
; Line 1317
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG3358
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
$L3357:
; Line 1319
	mov	esp, ebp
	pop	ebp
	ret	0
?checkErrors@apptask@@QAEXXZ ENDP			; apptask::checkErrors
_TEXT	ENDS
PUBLIC	?getFunctionPtrOthers@@YAPAJP8apptask@@AEXJ@Z@Z	; getFunctionPtrOthers
EXTRN	?init@ARPObj@@QAEHPAD00@Z:NEAR			; ARPObj::init
EXTRN	?init@UDPObj@@QAEXPADG@Z:NEAR			; UDPObj::init
EXTRN	?init@IPObj@@QAEXPAD@Z:NEAR			; IPObj::init
EXTRN	?init@FTPObj@@QAEHKKHHPADG@Z:NEAR		; FTPObj::init
EXTRN	??0IntException@@QAE@XZ:NEAR			; IntException::IntException
EXTRN	?init@WTTrace@@QAEHHH@Z:NEAR			; WTTrace::init
EXTRN	?AOAprintCharacter@AOAProtected@@QAEHDH@Z:NEAR	; AOAProtected::AOAprintCharacter
EXTRN	?sizeOfTCBRecord@TCPObj@@2HA:DWORD		; TCPObj::sizeOfTCBRecord
EXTRN	?initRecord@TCPObj@@QAEHXZ:NEAR			; TCPObj::initRecord
EXTRN	?init@TCPObj@@QAEHQAD0000GJJJJ@Z:NEAR		; TCPObj::init
EXTRN	?AOAPrintText@AOAProtected@@QAEXPAD@Z:NEAR	; AOAProtected::AOAPrintText
EXTRN	?AOAenableIRQCntlr@AOAProtected@@QAEHHG@Z:NEAR	; AOAProtected::AOAenableIRQCntlr
EXTRN	?init@FTOPObj@@QAEHXZ:NEAR			; FTOPObj::init
EXTRN	?init@WStack@@QAEHJH@Z:NEAR			; WStack::init
EXTRN	?push@WStack@@QAEHH@Z:NEAR			; WStack::push
EXTRN	?init@WCirList@@QAEHJJ@Z:NEAR			; WCirList::init
EXTRN	?full@WStack@@QAEHXZ:NEAR			; WStack::full
EXTRN	?setBaseAddress@EtherObj@@QAEXH@Z:NEAR		; EtherObj::setBaseAddress
EXTRN	?getBaseAddress@EtherObj@@QAEHXZ:NEAR		; EtherObj::getBaseAddress
EXTRN	?getMACEPROM@EtherObj@@QAEXPAD@Z:NEAR		; EtherObj::getMACEPROM
EXTRN	?ColdReset@EtherObj@@QAEHXZ:NEAR		; EtherObj::ColdReset
EXTRN	?inittest@EtherObj@@QAEHJJJJ@Z:NEAR		; EtherObj::inittest
EXTRN	?TEnable@EtherObj@@QAEHXZ:NEAR			; EtherObj::TEnable
EXTRN	?REnable@EtherObj@@QAEHXZ:NEAR			; EtherObj::REnable
_DATA	SEGMENT
	ORG $+1
$SG3400	DB	'Enter Server ID:', 00H
	ORG $+3
$SG3419	DB	'test.cpp stack is full', 00H
	ORG $+1
$SG3421	DB	'Memory is not sufficient for creating tcb records', 00H
	ORG $+2
$SG3422	DB	'Initialized Objects', 00H
$SG3426	DB	'Press ny key to load the Resources...', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -1920
_EO$ = -484
_arp$ = -1916
_tcp$ = -1272
_udp$ = -1628
_ip$ = -904
_ftp$ = -832
_fto$ = -508
_cir$ = -1296
_stk$ = -916
_intex$ = -464
_task$ = -884
_tcbsize$ = -1312
_SrcMAC$ = -440
_SrcIP$ = -424
_SubNetMask$ = -1288
_GateWayIP$ = -444
_GateWayMAC$ = -408
_SrcPort$ = -1280
_FTPServerIP$ = -472
_port$ = -1308
_sport$ = -492
_starthttptaskno$ = -908
_endhttptaskno$ = -836
_HTTPListInitStatus$ = -488
_state$ = -476
_retcode$ = -416
_id$ = -1304
_v2$ = -412
_i$ = -512
_c$ = -432
_Task_ID$ = -428
_serverid$ = -420
_Function_Address_Array$ = -400
_Function_Ptr_X$ = -1316
?createOtherTasks@apptask@@QAEXXZ PROC NEAR		; apptask::createOtherTasks
; Line 1324
	push	ebp
	mov	ebp, esp
	sub	esp, 1920				; 00000780H
	mov	DWORD PTR _this$[ebp], ecx
; Line 1325
	lea	ecx, DWORD PTR _EO$[ebp]
	call	??0EtherObj@@QAE@XZ			; EtherObj::EtherObj
; Line 1326
	lea	ecx, DWORD PTR _arp$[ebp]
	call	??0ARPObj@@QAE@XZ			; ARPObj::ARPObj
; Line 1327
	lea	ecx, DWORD PTR _tcp$[ebp]
	call	??0TCPObj@@QAE@XZ			; TCPObj::TCPObj
; Line 1328
	lea	ecx, DWORD PTR _udp$[ebp]
	call	??0UDPObj@@QAE@XZ			; UDPObj::UDPObj
; Line 1329
	lea	ecx, DWORD PTR _ip$[ebp]
	call	??0IPObj@@QAE@XZ			; IPObj::IPObj
; Line 1331
	lea	ecx, DWORD PTR _ftp$[ebp]
	call	??0FTPObj@@QAE@XZ			; FTPObj::FTPObj
; Line 1332
	lea	ecx, DWORD PTR _fto$[ebp]
	call	??0FTOPObj@@QAE@XZ			; FTOPObj::FTOPObj
; Line 1334
	lea	ecx, DWORD PTR _cir$[ebp]
	call	??0WCirList@@QAE@XZ			; WCirList::WCirList
; Line 1335
	lea	ecx, DWORD PTR _stk$[ebp]
	call	??0WStack@@QAE@XZ			; WStack::WStack
; Line 1337
	lea	ecx, DWORD PTR _intex$[ebp]
	call	??0IntException@@QAE@XZ			; IntException::IntException
; Line 1338
	lea	ecx, DWORD PTR _task$[ebp]
	call	??0AOATask@@QAE@XZ			; AOATask::AOATask
; Line 1339
	mov	DWORD PTR _tcbsize$[ebp], 0
; Line 1344
	mov	BYTE PTR _SrcIP$[ebp], 10		; 0000000aH
	mov	BYTE PTR _SrcIP$[ebp+1], 55		; 00000037H
	mov	BYTE PTR _SrcIP$[ebp+2], 12		; 0000000cH
	mov	BYTE PTR _SrcIP$[ebp+3], -19		; ffffffedH
; Line 1346
	mov	BYTE PTR _SubNetMask$[ebp], -1
	mov	BYTE PTR _SubNetMask$[ebp+1], -1
	mov	BYTE PTR _SubNetMask$[ebp+2], -1
	mov	BYTE PTR _SubNetMask$[ebp+3], 0
; Line 1347
	mov	BYTE PTR _GateWayIP$[ebp], 10		; 0000000aH
	mov	BYTE PTR _GateWayIP$[ebp+1], 55		; 00000037H
	mov	BYTE PTR _GateWayIP$[ebp+2], 11		; 0000000bH
	mov	BYTE PTR _GateWayIP$[ebp+3], -2		; fffffffeH
; Line 1348
	mov	BYTE PTR _GateWayMAC$[ebp], 0
	mov	BYTE PTR _GateWayMAC$[ebp+1], 15	; 0000000fH
	mov	BYTE PTR _GateWayMAC$[ebp+2], -112	; ffffff90H
	mov	BYTE PTR _GateWayMAC$[ebp+3], 42	; 0000002aH
	mov	BYTE PTR _GateWayMAC$[ebp+4], 109	; 0000006dH
	mov	BYTE PTR _GateWayMAC$[ebp+5], -65	; ffffffbfH
; Line 1349
	mov	WORD PTR _SrcPort$[ebp], 80		; 00000050H
; Line 1351
	mov	BYTE PTR _FTPServerIP$[ebp], 10		; 0000000aH
	mov	BYTE PTR _FTPServerIP$[ebp+1], 55	; 00000037H
	mov	BYTE PTR _FTPServerIP$[ebp+2], 12	; 0000000cH
	mov	BYTE PTR _FTPServerIP$[ebp+3], 24	; 00000018H
; Line 1352
	mov	WORD PTR _port$[ebp], 5008		; 00001390H
; Line 1353
	mov	WORD PTR _sport$[ebp], 5000		; 00001388H
; Line 1354
	mov	DWORD PTR _starthttptaskno$[ebp], 0
; Line 1355
	mov	DWORD PTR _endhttptaskno$[ebp], 0
; Line 1356
	mov	DWORD PTR _HTTPListInitStatus$[ebp], 0
; Line 1358
	mov	DWORD PTR _state$[ebp], 0
; Line 1359
	mov	DWORD PTR _retcode$[ebp], 0
; Line 1360
	mov	DWORD PTR _id$[ebp], 0
; Line 1361
	mov	DWORD PTR _v2$[ebp], 0
; Line 1362
	mov	DWORD PTR _i$[ebp], 0
; Line 1372
	mov	DWORD PTR _serverid$[ebp], 0
; Line 1379
	push	OFFSET FLAT:$SG3400
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPAD@Z	; AOAProtected::AOAPrintText
; Line 1380
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	BYTE PTR _c$[ebp], al
; Line 1381
	movsx	eax, BYTE PTR _c$[ebp]
	cmp	eax, 50					; 00000032H
	jne	SHORT $L3401
; Line 1383
	mov	BYTE PTR _SrcIP$[ebp+3], -18		; ffffffeeH
$L3401:
; Line 1387
	push	4000					; 00000fa0H
	push	110590016				; 06977840H
	lea	ecx, DWORD PTR _stk$[ebp]
	call	?init@WStack@@QAEHJH@Z			; WStack::init
; Line 1389
	push	8000					; 00001f40H
	push	111736128				; 06a8f540H
	lea	ecx, DWORD PTR _cir$[ebp]
	call	?init@WCirList@@QAEHJJ@Z		; WCirList::init
; Line 1391
	push	4000					; 00000fa0H
	push	191823872				; 0b6f0000H
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 404				; 00000194H
	call	?init@WTTrace@@QAEHHH@Z			; WTTrace::init
; Line 1393
	mov	DWORD PTR _Function_Ptr_X$[ebp], 0
; Line 1398
	mov	DWORD PTR _Function_Ptr_X$[ebp], OFFSET FLAT:?RcvTask@apptask@@QAEXJ@Z ; apptask::RcvTask
; Line 1399
	mov	ecx, DWORD PTR _Function_Ptr_X$[ebp]
	push	ecx
	call	?getFunctionPtrOthers@@YAPAJP8apptask@@AEXJ@Z@Z ; getFunctionPtrOthers
	add	esp, 4
	mov	DWORD PTR _Function_Address_Array$[ebp+16], eax
; Line 1401
	mov	DWORD PTR _Function_Ptr_X$[ebp], OFFSET FLAT:?InterfaceTask@apptask@@QAEXJ@Z ; apptask::InterfaceTask
; Line 1402
	mov	edx, DWORD PTR _Function_Ptr_X$[ebp]
	push	edx
	call	?getFunctionPtrOthers@@YAPAJP8apptask@@AEXJ@Z@Z ; getFunctionPtrOthers
	add	esp, 4
	mov	DWORD PTR _Function_Address_Array$[ebp+20], eax
; Line 1404
	mov	DWORD PTR _Function_Ptr_X$[ebp], OFFSET FLAT:?FileTransferTask@apptask@@QAEXJ@Z ; apptask::FileTransferTask
; Line 1405
	mov	eax, DWORD PTR _Function_Ptr_X$[ebp]
	push	eax
	call	?getFunctionPtrOthers@@YAPAJP8apptask@@AEXJ@Z@Z ; getFunctionPtrOthers
	add	esp, 4
	mov	DWORD PTR _Function_Address_Array$[ebp+24], eax
; Line 1407
	mov	DWORD PTR _Function_Ptr_X$[ebp], OFFSET FLAT:?HttpTask@apptask@@QAEXJ@Z ; apptask::HttpTask
; Line 1408
	mov	ecx, DWORD PTR _Function_Ptr_X$[ebp]
	push	ecx
	call	?getFunctionPtrOthers@@YAPAJP8apptask@@AEXJ@Z@Z ; getFunctionPtrOthers
	add	esp, 4
	mov	DWORD PTR _Function_Address_Array$[ebp+28], eax
; Line 1413
	push	0
	mov	edx, DWORD PTR _Function_Address_Array$[ebp+16]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?createTask@apptask@@QAEHJH@Z		; apptask::createTask
	mov	DWORD PTR _Task_ID$[ebp], eax
; Line 1414
	push	0
	mov	eax, DWORD PTR _Function_Address_Array$[ebp+20]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?createTask@apptask@@QAEHJH@Z		; apptask::createTask
	mov	DWORD PTR _Task_ID$[ebp], eax
; Line 1415
	push	0
	mov	ecx, DWORD PTR _Function_Address_Array$[ebp+24]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?createTask@apptask@@QAEHJH@Z		; apptask::createTask
	mov	DWORD PTR _Task_ID$[ebp], eax
; Line 1418
	push	0
	mov	edx, DWORD PTR _Function_Address_Array$[ebp+28]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?createTask@apptask@@QAEHJH@Z		; apptask::createTask
	mov	DWORD PTR _Task_ID$[ebp], eax
; Line 1420
	push	0
	mov	eax, DWORD PTR _Function_Address_Array$[ebp+28]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?createTask@apptask@@QAEHJH@Z		; apptask::createTask
	mov	DWORD PTR _Task_ID$[ebp], eax
; Line 1425
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L3412
$L3413:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L3412:
	cmp	DWORD PTR _i$[ebp], 4000		; 00000fa0H
	jge	SHORT $L3414
; Line 1427
	push	0
	mov	edx, DWORD PTR _Function_Address_Array$[ebp+28]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?createTask@apptask@@QAEHJH@Z		; apptask::createTask
	mov	DWORD PTR _Task_ID$[ebp], eax
; Line 1428
	cmp	DWORD PTR _i$[ebp], 0
	jne	SHORT $L3416
; Line 1429
	mov	eax, DWORD PTR _Task_ID$[ebp]
	mov	DWORD PTR ?MinTaskId@apptask@@2JA, eax	; apptask::MinTaskId
$L3416:
; Line 1430
	lea	ecx, DWORD PTR _stk$[ebp]
	call	?full@WStack@@QAEHXZ			; WStack::full
	test	eax, eax
	jne	SHORT $L3417
; Line 1432
	mov	ecx, DWORD PTR _Task_ID$[ebp]
	push	ecx
	lea	ecx, DWORD PTR _stk$[ebp]
	call	?push@WStack@@QAEHH@Z			; WStack::push
; Line 1434
	jmp	SHORT $L3418
$L3417:
; Line 1435
	push	3840					; 00000f00H
	push	OFFSET FLAT:$SG3419
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
$L3418:
; Line 1436
	jmp	$L3413
$L3414:
; Line 1438
	mov	edx, DWORD PTR _Task_ID$[ebp]
	mov	DWORD PTR ?MaxTaskId@apptask@@2JA, edx	; apptask::MaxTaskId
; Line 1442
	push	156					; 0000009cH
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetSharedMem@AOAProtected@@QAEJH@Z	; AOAProtected::AOAgetSharedMem
	mov	DWORD PTR _id$[ebp], eax
; Line 1443
	mov	eax, DWORD PTR _id$[ebp]
	push	eax
	lea	ecx, DWORD PTR _EO$[ebp]
	call	?setBaseAddress@EtherObj@@QAEXH@Z	; EtherObj::setBaseAddress
; Line 1444
	mov	DWORD PTR _id$[ebp], 0
; Line 1445
	lea	ecx, DWORD PTR _EO$[ebp]
	call	?getBaseAddress@EtherObj@@QAEHXZ	; EtherObj::getBaseAddress
	mov	DWORD PTR _id$[ebp], eax
; Line 1446
	push	3840					; 00000f00H
	mov	ecx, DWORD PTR _id$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 1448
	lea	edx, DWORD PTR _SrcMAC$[ebp]
	push	edx
	lea	ecx, DWORD PTR _EO$[ebp]
	call	?getMACEPROM@EtherObj@@QAEXPAD@Z	; EtherObj::getMACEPROM
; Line 1450
	lea	ecx, DWORD PTR _EO$[ebp]
	call	?ColdReset@EtherObj@@QAEHXZ		; EtherObj::ColdReset
	mov	DWORD PTR _retcode$[ebp], eax
; Line 1452
	push	48735744				; 02e7a600H
	push	37987840				; 0243a600H
	push	39233024				; 0256a600H
	push	36742656				; 0230a600H
	lea	ecx, DWORD PTR _EO$[ebp]
	call	?inittest@EtherObj@@QAEHJJJJ@Z		; EtherObj::inittest
	mov	DWORD PTR _retcode$[ebp], eax
; Line 1454
	lea	ecx, DWORD PTR _EO$[ebp]
	call	?TEnable@EtherObj@@QAEHXZ		; EtherObj::TEnable
	mov	DWORD PTR _retcode$[ebp], eax
; Line 1455
	lea	ecx, DWORD PTR _EO$[ebp]
	call	?REnable@EtherObj@@QAEHXZ		; EtherObj::REnable
	mov	DWORD PTR _retcode$[ebp], eax
; Line 1457
	push	254					; 000000feH
	push	1
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAenableIRQCntlr@AOAProtected@@QAEHHG@Z ; AOAProtected::AOAenableIRQCntlr
; Line 1459
	lea	ecx, DWORD PTR _fto$[ebp]
	call	?init@FTOPObj@@QAEHXZ			; FTOPObj::init
; Line 1460
	push	1
	lea	ecx, DWORD PTR _fto$[ebp]
	call	?setMode@FTOPObj@@QAEXH@Z		; FTOPObj::setMode
; Line 1462
	lea	eax, DWORD PTR _GateWayIP$[ebp]
	push	eax
	lea	ecx, DWORD PTR _SubNetMask$[ebp]
	push	ecx
	lea	edx, DWORD PTR _SrcIP$[ebp]
	push	edx
	lea	ecx, DWORD PTR _arp$[ebp]
	call	?init@ARPObj@@QAEHPAD00@Z		; ARPObj::init
; Line 1463
	lea	eax, DWORD PTR _SrcIP$[ebp]
	push	eax
	lea	ecx, DWORD PTR _ip$[ebp]
	call	?init@IPObj@@QAEXPAD@Z			; IPObj::init
; Line 1467
	lea	ecx, DWORD PTR _tcp$[ebp]
	call	?initRecord@TCPObj@@QAEHXZ		; TCPObj::initRecord
	mov	DWORD PTR _retcode$[ebp], eax
; Line 1468
	mov	ecx, DWORD PTR ?sizeOfTCBRecord@TCPObj@@2HA ; TCPObj::sizeOfTCBRecord
	imul	ecx, 20000				; 00004e20H
	add	ecx, 40000				; 00009c40H
	mov	DWORD PTR _tcbsize$[ebp], ecx
; Line 1470
	push	10000					; 00002710H
	push	20000					; 00004e20H
	mov	edx, DWORD PTR _tcbsize$[ebp]
	push	edx
	push	60475904				; 039aca00H
	mov	ax, WORD PTR _SrcPort$[ebp]
	push	eax
	lea	ecx, DWORD PTR _GateWayMAC$[ebp]
	push	ecx
	lea	edx, DWORD PTR _GateWayIP$[ebp]
	push	edx
	lea	eax, DWORD PTR _SubNetMask$[ebp]
	push	eax
	lea	ecx, DWORD PTR _SrcMAC$[ebp]
	push	ecx
	lea	edx, DWORD PTR _SrcIP$[ebp]
	push	edx
	lea	ecx, DWORD PTR _tcp$[ebp]
	call	?init@TCPObj@@QAEHQAD0000GJJJJ@Z	; TCPObj::init
	mov	DWORD PTR _retcode$[ebp], eax
; Line 1471
	cmp	DWORD PTR _retcode$[ebp], 0
	je	SHORT $L3420
; Line 1473
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG3421
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1474
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAExit@AOAProtected@@QAEXXZ		; AOAProtected::AOAExit
$L3420:
; Line 1485
	mov	ax, WORD PTR _port$[ebp]
	push	eax
	lea	ecx, DWORD PTR _FTPServerIP$[ebp]
	push	ecx
	push	1000					; 000003e8H
	push	10000					; 00002710H
	push	67108864				; 04000000H
	push	134217728				; 08000000H
	lea	ecx, DWORD PTR _ftp$[ebp]
	call	?init@FTPObj@@QAEHKKHHPADG@Z		; FTPObj::init
; Line 1491
	mov	dx, WORD PTR _sport$[ebp]
	push	edx
	lea	eax, DWORD PTR _SrcIP$[ebp]
	push	eax
	lea	ecx, DWORD PTR _udp$[ebp]
	call	?init@UDPObj@@QAEXPADG@Z		; UDPObj::init
; Line 1495
	push	1120					; 00000460H
	push	OFFSET FLAT:$SG3422
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1498
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L3423
$L3424:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L3423:
	cmp	DWORD PTR _i$[ebp], 4000		; 00000fa0H
	jge	SHORT $L3425
; Line 1500
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	push	32					; 00000020H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintCharacter@AOAProtected@@QAEHDH@Z ; AOAProtected::AOAprintCharacter
; Line 1502
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
; Line 1503
	jmp	SHORT $L3424
$L3425:
; Line 1505
	push	1600					; 00000640H
	push	OFFSET FLAT:$SG3426
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1506
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	BYTE PTR _c$[ebp], al
; Line 1507
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
; Line 1511
	push	ebp
	mov	ebp, esp
	sub	esp, 428				; 000001acH
; Line 1518
	lea	ecx, DWORD PTR _first$[ebp]
	call	??0apptask@@QAE@XZ			; apptask::apptask
; Line 1519
	lea	eax, DWORD PTR _first$[ebp]
	mov	DWORD PTR _xyz$[ebp], eax
; Line 1520
	mov	ecx, DWORD PTR _abc2$[ebp]
	mov	DWORD PTR _abc1$[ebp], ecx
; Line 1521
	mov	edx, DWORD PTR _xyz$[ebp]
	sub	edx, 4
	mov	DWORD PTR _xyz$[ebp], edx
; Line 1522
	mov	eax, DWORD PTR _xyz$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _ab1$[ebp], ecx
; Line 1523
	mov	eax, DWORD PTR _ab1$[ebp]
; Line 1524
	mov	esp, ebp
	pop	ebp
	ret	0
?getFunctionPtrOthers@@YAPAJP8apptask@@AEXJ@Z@Z ENDP	; getFunctionPtrOthers
_TEXT	ENDS
PUBLIC	?clearScreen@apptask@@QAEXXZ			; apptask::clearScreen
_DATA	SEGMENT
	ORG $+2
$SG3443	DB	'DOSC Web Server, Running on the bare PC, Towson Universi'
	DB	'ty', 00H
	ORG $+1
$SG3444	DB	'01', 00H
	ORG $+1
$SG3445	DB	'02', 00H
	ORG $+1
$SG3446	DB	'03', 00H
	ORG $+1
$SG3447	DB	'04', 00H
	ORG $+1
$SG3448	DB	'05', 00H
	ORG $+1
$SG3449	DB	'06', 00H
	ORG $+1
$SG3450	DB	'07', 00H
	ORG $+1
$SG3451	DB	'08', 00H
	ORG $+1
$SG3452	DB	'09', 00H
	ORG $+1
$SG3453	DB	'10', 00H
	ORG $+1
$SG3454	DB	'11', 00H
	ORG $+1
$SG3455	DB	'12', 00H
	ORG $+1
$SG3456	DB	'13', 00H
	ORG $+1
$SG3457	DB	'14', 00H
	ORG $+1
$SG3458	DB	'15', 00H
	ORG $+1
$SG3459	DB	'16', 00H
	ORG $+1
$SG3460	DB	'17', 00H
	ORG $+1
$SG3461	DB	'18', 00H
	ORG $+1
$SG3462	DB	'19', 00H
	ORG $+1
$SG3463	DB	'20', 00H
	ORG $+1
$SG3464	DB	'21', 00H
	ORG $+1
$SG3465	DB	'22', 00H
	ORG $+1
$SG3466	DB	'23', 00H
	ORG $+1
$SG3467	DB	'24', 00H
	ORG $+1
$SG3468	DB	'1', 00H
	ORG $+2
$SG3469	DB	'2', 00H
	ORG $+2
$SG3470	DB	'3', 00H
	ORG $+2
$SG3471	DB	'4', 00H
	ORG $+2
$SG3472	DB	'5', 00H
	ORG $+2
$SG3473	DB	'6', 00H
	ORG $+2
$SG3474	DB	'7', 00H
	ORG $+2
$SG3475	DB	'8', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -12
_i$ = -4
_ch$ = -8
?printScreenLayout@apptask@@QAEXXZ PROC NEAR		; apptask::printScreenLayout
; Line 1529
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 1530
	mov	DWORD PTR _i$[ebp], 0
; Line 1531
	mov	BYTE PTR _ch$[ebp], 0
; Line 1533
	mov	ecx, DWORD PTR _this$[ebp]
	call	?clearScreen@apptask@@QAEXXZ		; apptask::clearScreen
; Line 1534
	push	20					; 00000014H
	push	OFFSET FLAT:$SG3443
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1535
	push	160					; 000000a0H
	push	OFFSET FLAT:$SG3444
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1536
	push	320					; 00000140H
	push	OFFSET FLAT:$SG3445
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1537
	push	480					; 000001e0H
	push	OFFSET FLAT:$SG3446
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1538
	push	640					; 00000280H
	push	OFFSET FLAT:$SG3447
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1539
	push	800					; 00000320H
	push	OFFSET FLAT:$SG3448
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1540
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG3449
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1541
	push	1120					; 00000460H
	push	OFFSET FLAT:$SG3450
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1542
	push	1280					; 00000500H
	push	OFFSET FLAT:$SG3451
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1543
	push	1440					; 000005a0H
	push	OFFSET FLAT:$SG3452
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1544
	push	1600					; 00000640H
	push	OFFSET FLAT:$SG3453
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1545
	push	1760					; 000006e0H
	push	OFFSET FLAT:$SG3454
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1546
	push	1920					; 00000780H
	push	OFFSET FLAT:$SG3455
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1547
	push	2080					; 00000820H
	push	OFFSET FLAT:$SG3456
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1548
	push	2240					; 000008c0H
	push	OFFSET FLAT:$SG3457
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1549
	push	2400					; 00000960H
	push	OFFSET FLAT:$SG3458
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1550
	push	2560					; 00000a00H
	push	OFFSET FLAT:$SG3459
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1551
	push	2720					; 00000aa0H
	push	OFFSET FLAT:$SG3460
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1552
	push	2880					; 00000b40H
	push	OFFSET FLAT:$SG3461
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1553
	push	3040					; 00000be0H
	push	OFFSET FLAT:$SG3462
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1554
	push	3200					; 00000c80H
	push	OFFSET FLAT:$SG3463
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1555
	push	3360					; 00000d20H
	push	OFFSET FLAT:$SG3464
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1556
	push	3520					; 00000dc0H
	push	OFFSET FLAT:$SG3465
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1557
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG3466
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1558
	push	3840					; 00000f00H
	push	OFFSET FLAT:$SG3467
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1559
	push	166					; 000000a6H
	push	OFFSET FLAT:$SG3468
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1560
	push	186					; 000000baH
	push	OFFSET FLAT:$SG3469
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1561
	push	206					; 000000ceH
	push	OFFSET FLAT:$SG3470
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1562
	push	226					; 000000e2H
	push	OFFSET FLAT:$SG3471
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1563
	push	246					; 000000f6H
	push	OFFSET FLAT:$SG3472
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1564
	push	266					; 0000010aH
	push	OFFSET FLAT:$SG3473
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1565
	push	286					; 0000011eH
	push	OFFSET FLAT:$SG3474
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1566
	push	306					; 00000132H
	push	OFFSET FLAT:$SG3475
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1567
	mov	esp, ebp
	pop	ebp
	ret	0
?printScreenLayout@apptask@@QAEXXZ ENDP			; apptask::printScreenLayout
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+2
$SG3479	DB	'RCV:', 00H
	ORG $+3
$SG3480	DB	'RcvIPtr', 00H
$SG3481	DB	'RcvOPtr', 00H
$SG3482	DB	'RXSize', 00H
	ORG $+1
$SG3483	DB	'upCnSet', 00H
$SG3484	DB	'notFTnd', 00H
$SG3485	DB	'TaskID', 00H
	ORG $+1
$SG3486	DB	'notArIP', 00H
$SG3487	DB	'ARPcnt', 00H
	ORG $+1
$SG3488	DB	'IPcnt', 00H
	ORG $+2
$SG3489	DB	'SndINPtr', 00H
	ORG $+3
$SG3490	DB	'SndOUTtr', 00H
	ORG $+3
$SG3491	DB	'MAIN:', 00H
	ORG $+2
$SG3492	DB	'runTsk', 00H
	ORG $+1
$SG3493	DB	'CirCnt', 00H
	ORG $+1
$SG3494	DB	'HTTP:', 00H
	ORG $+2
$SG3495	DB	'TaskID', 00H
	ORG $+1
$SG3496	DB	'RetCode', 00H
$SG3497	DB	'HttpCnt', 00H
$SG3498	DB	'TotHTTP', 00H
$SG3499	DB	'State', 00H
	ORG $+2
$SG3500	DB	'Retr', 00H
	ORG $+3
$SG3501	DB	'MaxNTasks', 00H
	ORG $+2
$SG3502	DB	'MaxNTcbs', 00H
	ORG $+3
$SG3503	DB	'TraceCnt', 00H
	ORG $+3
$SG3504	DB	'DelCount', 00H
	ORG $+3
$SG3505	DB	'NoOfRsts', 00H
	ORG $+3
$SG3506	DB	'UnMatReq', 00H
	ORG $+3
$SG3507	DB	'taskDel', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?printScreenTags@apptask@@QAEXXZ PROC NEAR		; apptask::printScreenTags
; Line 1573
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 1574
	push	486					; 000001e6H
	push	OFFSET FLAT:$SG3479
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1575
	push	360					; 00000168H
	push	OFFSET FLAT:$SG3480
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1576
	push	380					; 0000017cH
	push	OFFSET FLAT:$SG3481
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1577
	push	400					; 00000190H
	push	OFFSET FLAT:$SG3482
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1578
	push	420					; 000001a4H
	push	OFFSET FLAT:$SG3483
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1579
	push	440					; 000001b8H
	push	OFFSET FLAT:$SG3484
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1580
	push	460					; 000001ccH
	push	OFFSET FLAT:$SG3485
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1582
	push	660					; 00000294H
	push	OFFSET FLAT:$SG3486
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1583
	push	680					; 000002a8H
	push	OFFSET FLAT:$SG3487
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1584
	push	700					; 000002bcH
	push	OFFSET FLAT:$SG3488
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1585
	push	720					; 000002d0H
	push	OFFSET FLAT:$SG3489
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1586
	push	740					; 000002e4H
	push	OFFSET FLAT:$SG3490
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1588
	push	1446					; 000005a6H
	push	OFFSET FLAT:$SG3491
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1589
	push	1300					; 00000514H
	push	OFFSET FLAT:$SG3492
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1590
	push	1320					; 00000528H
	push	OFFSET FLAT:$SG3493
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1592
	push	1766					; 000006e6H
	push	OFFSET FLAT:$SG3494
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1593
	push	1740					; 000006ccH
	push	OFFSET FLAT:$SG3495
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1594
	push	1640					; 00000668H
	push	OFFSET FLAT:$SG3496
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1595
	push	1660					; 0000067cH
	push	OFFSET FLAT:$SG3497
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1596
	push	1680					; 00000690H
	push	OFFSET FLAT:$SG3498
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1597
	push	1700					; 000006a4H
	push	OFFSET FLAT:$SG3499
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1598
	push	1720					; 000006b8H
	push	OFFSET FLAT:$SG3500
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1599
	push	1940					; 00000794H
	push	OFFSET FLAT:$SG3501
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1600
	push	1960					; 000007a8H
	push	OFFSET FLAT:$SG3502
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1601
	push	1980					; 000007bcH
	push	OFFSET FLAT:$SG3503
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1602
	push	2000					; 000007d0H
	push	OFFSET FLAT:$SG3504
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1603
	push	2020					; 000007e4H
	push	OFFSET FLAT:$SG3505
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1604
	push	2040					; 000007f8H
	push	OFFSET FLAT:$SG3506
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1605
	push	2060					; 0000080cH
	push	OFFSET FLAT:$SG3507
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 1606
	mov	esp, ebp
	pop	ebp
	ret	0
?printScreenTags@apptask@@QAEXXZ ENDP			; apptask::printScreenTags
_this$ = -8
_i$ = -4
?clearScreen@apptask@@QAEXXZ PROC NEAR			; apptask::clearScreen
; Line 1611
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 1612
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L3512
$L3513:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L3512:
	cmp	DWORD PTR _i$[ebp], 4000		; 00000fa0H
	jge	SHORT $L3514
; Line 1614
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	push	32					; 00000020H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAprintCharacter@AOAProtected@@QAEHDH@Z ; AOAProtected::AOAprintCharacter
; Line 1615
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
; Line 1616
	jmp	SHORT $L3513
$L3514:
; Line 1617
	mov	esp, ebp
	pop	ebp
	ret	0
?clearScreen@apptask@@QAEXXZ ENDP			; apptask::clearScreen
_TEXT	ENDS
END
