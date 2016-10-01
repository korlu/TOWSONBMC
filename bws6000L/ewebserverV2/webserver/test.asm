	TITLE	test.cpp
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
FLAT	GROUP _DATA, CONST, _BSS
	ASSUME	CS: FLAT, DS: FLAT, SS: FLAT
endif
PUBLIC	?getFunctionPtr@@YAPAJP8apptask@@AEXJ@Z@Z	; getFunctionPtr
PUBLIC	_main
EXTRN	?MainTask@apptask@@QAEXJ@Z:NEAR			; apptask::MainTask
EXTRN	??0AOAProtected@@QAE@XZ:NEAR			; AOAProtected::AOAProtected
EXTRN	?AOAsetTimerPeriod@AOAProtected@@QAEXH@Z:NEAR	; AOAProtected::AOAsetTimerPeriod
EXTRN	?AOAprintDecimal@AOAProtected@@QAEHHH@Z:NEAR	; AOAProtected::AOAprintDecimal
EXTRN	?AOAgetTimer@AOAProtected@@QAEJXZ:NEAR		; AOAProtected::AOAgetTimer
EXTRN	?AOAExit@AOAProtected@@QAEXXZ:NEAR		; AOAProtected::AOAExit
EXTRN	?AOAPrintText@AOAProtected@@QAEXPADH@Z:NEAR	; AOAProtected::AOAPrintText
EXTRN	?AOAgetIDTEntry@AOAProtected@@QAEHPAJ0H@Z:NEAR	; AOAProtected::AOAgetIDTEntry
EXTRN	?AOAsetIDTEntry@AOAProtected@@QAEHPAJ0H@Z:NEAR	; AOAProtected::AOAsetIDTEntry
EXTRN	?AOAdisableIRQCntlr@AOAProtected@@QAEHHG@Z:NEAR	; AOAProtected::AOAdisableIRQCntlr
EXTRN	??0AOATask@@QAE@XZ:NEAR				; AOATask::AOATask
EXTRN	?AOAinitTasks@AOATask@@QAEHPAJJJ@Z:NEAR		; AOATask::AOAinitTasks
EXTRN	?AOArunTask@AOATask@@QAEHH@Z:NEAR		; AOATask::AOArunTask
EXTRN	??0apptask@@QAE@H@Z:NEAR			; apptask::apptask
_DATA	SEGMENT
$SG2155	DB	'Returned from main task, now in test.cpp', 00H
_DATA	ENDS
_TEXT	SEGMENT
_io$ = -440
_first$ = -428
_task$ = -492
_Function_Address_Array$ = -8
_descht$ = -516
_desclt$ = -496
_i$ = -432
_Function_Ptr_X$ = -512
_GDT_Index$ = -444
_time1$ = -500
_desch$ = -508
_descl$ = -12
_time2$ = -504
_main	PROC NEAR
; File test.cpp
; Line 19
	push	ebp
	mov	ebp, esp
	sub	esp, 516				; 00000204H
; Line 20
	lea	ecx, DWORD PTR _io$[ebp]
	call	??0AOAProtected@@QAE@XZ			; AOAProtected::AOAProtected
; Line 21
	push	4
	lea	ecx, DWORD PTR _first$[ebp]
	call	??0apptask@@QAE@H@Z			; apptask::apptask
; Line 23
	lea	ecx, DWORD PTR _task$[ebp]
	call	??0AOATask@@QAE@XZ			; AOATask::AOATask
; Line 27
	mov	DWORD PTR _i$[ebp], 0
; Line 32
	mov	DWORD PTR _Function_Ptr_X$[ebp], 0
; Line 34
	mov	DWORD PTR _GDT_Index$[ebp], 0
; Line 37
	push	220					; 000000dcH
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAsetTimerPeriod@AOAProtected@@QAEXH@Z ; AOAProtected::AOAsetTimerPeriod
; Line 39
	push	1
	push	2
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAdisableIRQCntlr@AOAProtected@@QAEHHG@Z ; AOAProtected::AOAdisableIRQCntlr
; Line 40
	push	1
	push	1
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAdisableIRQCntlr@AOAProtected@@QAEHHG@Z ; AOAProtected::AOAdisableIRQCntlr
; Line 43
	push	8
	lea	eax, DWORD PTR _desclt$[ebp]
	push	eax
	lea	ecx, DWORD PTR _descht$[ebp]
	push	ecx
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAgetIDTEntry@AOAProtected@@QAEHPAJ0H@Z ; AOAProtected::AOAgetIDTEntry
; Line 46
	mov	DWORD PTR _Function_Ptr_X$[ebp], OFFSET FLAT:?MainTask@apptask@@QAEXJ@Z ; apptask::MainTask
; Line 47
	mov	edx, DWORD PTR _Function_Ptr_X$[ebp]
	push	edx
	call	?getFunctionPtr@@YAPAJP8apptask@@AEXJ@Z@Z ; getFunctionPtr
	add	esp, 4
	mov	DWORD PTR _Function_Address_Array$[ebp], eax
; Line 49
	mov	eax, DWORD PTR _Function_Address_Array$[ebp]
	push	eax
	push	352321536				; 15000000H
	push	33554432				; 02000000H
	lea	ecx, DWORD PTR _task$[ebp]
	call	?AOAinitTasks@AOATask@@QAEHPAJJJ@Z	; AOATask::AOAinitTasks
; Line 51
	push	0
	lea	ecx, DWORD PTR _task$[ebp]
	call	?AOArunTask@AOATask@@QAEHH@Z		; AOATask::AOArunTask
; Line 53
	push	2280					; 000008e8H
	push	OFFSET FLAT:$SG2155
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 55
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	mov	DWORD PTR _time1$[ebp], eax
; Line 59
	push	8
	lea	ecx, DWORD PTR _descl$[ebp]
	push	ecx
	lea	edx, DWORD PTR _desch$[ebp]
	push	edx
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAgetIDTEntry@AOAProtected@@QAEHPAJ0H@Z ; AOAProtected::AOAgetIDTEntry
$L2160:
; Line 69
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
	cmp	eax, 100000				; 000186a0H
	jge	SHORT $L2161
; Line 71
	push	2260					; 000008d4H
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAprintDecimal@AOAProtected@@QAEHHH@Z	; AOAProtected::AOAprintDecimal
; Line 72
	jmp	SHORT $L2160
$L2161:
; Line 74
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	mov	DWORD PTR _time2$[ebp], eax
; Line 78
	push	8
	lea	eax, DWORD PTR _desclt$[ebp]
	push	eax
	lea	ecx, DWORD PTR _descht$[ebp]
	push	ecx
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAsetIDTEntry@AOAProtected@@QAEHPAJ0H@Z ; AOAProtected::AOAsetIDTEntry
; Line 80
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAExit@AOAProtected@@QAEXXZ		; AOAProtected::AOAExit
; Line 81
	mov	esp, ebp
	pop	ebp
	ret	0
_main	ENDP
_TEXT	ENDS
EXTRN	??0apptask@@QAE@XZ:NEAR				; apptask::apptask
_TEXT	SEGMENT
_abc2$ = 8
_io$ = -432
_ab1$ = -436
_xyz$ = -4
_abc1$ = -424
_first$ = -420
?getFunctionPtr@@YAPAJP8apptask@@AEXJ@Z@Z PROC NEAR	; getFunctionPtr
; Line 85
	push	ebp
	mov	ebp, esp
	sub	esp, 436				; 000001b4H
; Line 88
	lea	ecx, DWORD PTR _io$[ebp]
	call	??0AOAProtected@@QAE@XZ			; AOAProtected::AOAProtected
; Line 93
	lea	ecx, DWORD PTR _first$[ebp]
	call	??0apptask@@QAE@XZ			; apptask::apptask
; Line 94
	lea	eax, DWORD PTR _first$[ebp]
	mov	DWORD PTR _xyz$[ebp], eax
; Line 95
	mov	ecx, DWORD PTR _abc2$[ebp]
	mov	DWORD PTR _abc1$[ebp], ecx
; Line 96
	mov	edx, DWORD PTR _xyz$[ebp]
	sub	edx, 4
	mov	DWORD PTR _xyz$[ebp], edx
; Line 97
	mov	eax, DWORD PTR _xyz$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _ab1$[ebp], ecx
; Line 98
	mov	eax, DWORD PTR _ab1$[ebp]
; Line 99
	mov	esp, ebp
	pop	ebp
	ret	0
?getFunctionPtr@@YAPAJP8apptask@@AEXJ@Z@Z ENDP		; getFunctionPtr
_TEXT	ENDS
END
