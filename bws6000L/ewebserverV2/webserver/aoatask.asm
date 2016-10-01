	TITLE	aoatask.cpp
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
;	COMDAT ??0WCirList@@QAE@XZ
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT ??0WStack@@QAE@XZ
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT ??0WList@@QAE@XZ
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
FLAT	GROUP _DATA, CONST, _BSS
	ASSUME	CS: FLAT, DS: FLAT, SS: FLAT
endif
PUBLIC	?App1TSSPtr@AOATask@@0JA			; AOATask::App1TSSPtr
PUBLIC	?TSSBase@AOATask@@0JA				; AOATask::TSSBase
PUBLIC	?TSSSize@AOATask@@0HA				; AOATask::TSSSize
PUBLIC	?SchBase@AOATask@@0JA				; AOATask::SchBase
PUBLIC	?TimerBase@AOATask@@0JA				; AOATask::TimerBase
PUBLIC	?TimerStack@AOATask@@0JA			; AOATask::TimerStack
PUBLIC	?SchStack@AOATask@@2JA				; AOATask::SchStack
PUBLIC	?StackBase@AOATask@@2JA				; AOATask::StackBase
PUBLIC	?RunSch_Flag@AOATask@@2HA			; AOATask::RunSch_Flag
PUBLIC	?TaskId@AOATask@@2HA				; AOATask::TaskId
PUBLIC	?TSSFlag@AOATask@@2HA				; AOATask::TSSFlag
_BSS	SEGMENT
?App1TSSPtr@AOATask@@0JA DD 01H DUP (?)			; AOATask::App1TSSPtr
?TSSBase@AOATask@@0JA DD 01H DUP (?)			; AOATask::TSSBase
?TSSSize@AOATask@@0HA DD 01H DUP (?)			; AOATask::TSSSize
?SchBase@AOATask@@0JA DD 01H DUP (?)			; AOATask::SchBase
?TimerBase@AOATask@@0JA DD 01H DUP (?)			; AOATask::TimerBase
?TimerStack@AOATask@@0JA DD 01H DUP (?)			; AOATask::TimerStack
?SchStack@AOATask@@2JA DD 01H DUP (?)			; AOATask::SchStack
?StackBase@AOATask@@2JA DD 01H DUP (?)			; AOATask::StackBase
?RunSch_Flag@AOATask@@2HA DD 01H DUP (?)		; AOATask::RunSch_Flag
?TaskId@AOATask@@2HA DD 01H DUP (?)			; AOATask::TaskId
?TSSFlag@AOATask@@2HA DD 01H DUP (?)			; AOATask::TSSFlag
_BSS	ENDS
PUBLIC	??0WCirList@@QAE@XZ				; WCirList::WCirList
PUBLIC	??0WStack@@QAE@XZ				; WStack::WStack
PUBLIC	??0WList@@QAE@XZ				; WList::WList
PUBLIC	??0AOATask@@QAE@XZ				; AOATask::AOATask
EXTRN	??0AOAProtected@@QAE@XZ:NEAR			; AOAProtected::AOAProtected
_TEXT	SEGMENT
_this$ = -4
??0AOATask@@QAE@XZ PROC NEAR				; AOATask::AOATask
; File aoatask.cpp
; Line 23
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	??0AOAProtected@@QAE@XZ			; AOAProtected::AOAProtected
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 16					; 00000010H
	call	??0WCirList@@QAE@XZ			; WCirList::WCirList
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 24					; 00000018H
	call	??0WStack@@QAE@XZ			; WStack::WStack
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 32					; 00000020H
	call	??0WList@@QAE@XZ			; WList::WList
; Line 24
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax], 1
; Line 27
	mov	DWORD PTR ?App1TSSPtr@AOATask@@0JA, 32440320 ; AOATask::App1TSSPtr, 01ef0000H
; Line 28
	mov	DWORD PTR ?TSSSize@AOATask@@0HA, 120	; AOATask::TSSSize, 00000078H
; Line 29
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+4], 0
; Line 30
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+40], 9961819		; 0098015bH
; Line 31
	mov	eax, DWORD PTR _this$[ebp]
	mov	DWORD PTR [eax+44], 36608		; 00008f00H
; Line 33
	mov	eax, DWORD PTR _this$[ebp]
	mov	esp, ebp
	pop	ebp
	ret	0
??0AOATask@@QAE@XZ ENDP					; AOATask::AOATask
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
PUBLIC	?AOAcreateTask@AOATask@@QAEHJJHH@Z		; AOATask::AOAcreateTask
PUBLIC	?AOAswapTSS@AOATask@@QAEHXZ			; AOATask::AOAswapTSS
EXTRN	?AOAsetGDTEntry@AOAProtected@@QAEHPAJ0H@Z:NEAR	; AOAProtected::AOAsetGDTEntry
_TEXT	SEGMENT
_this$ = -56
_temp1$ = -8
_temp2$ = -20
_tempTSSPtr$ = -32
_desch$ = -36
_descl$ = -16
_TSS_Ptr$ = -28
_Task_ID$ = -24
_tempcp_ptr$ = -12
_temp_TaskTSSPtr$ = -4
_GDTIndex$1078 = -40
_status$1079 = -44
_GDTIndex$1083 = -48
_status$1084 = -52
?AOAswapTSS@AOATask@@QAEHXZ PROC NEAR			; AOATask::AOAswapTSS
; Line 48
	push	ebp
	mov	ebp, esp
	sub	esp, 56					; 00000038H
	mov	DWORD PTR _this$[ebp], ecx
; Line 52
	lea	eax, DWORD PTR _temp1$[ebp]
	mov	DWORD PTR _tempTSSPtr$[ebp], eax
; Line 54
	mov	DWORD PTR _TSS_Ptr$[ebp], 0
; Line 55
	mov	DWORD PTR _Task_ID$[ebp], 0
; Line 56
	mov	DWORD PTR _tempcp_ptr$[ebp], 0
; Line 58
	cmp	DWORD PTR ?TSSFlag@AOATask@@2HA, 0	; AOATask::TSSFlag
	jne	$L1075
; Line 60
	mov	DWORD PTR ?TSSFlag@AOATask@@2HA, 1	; AOATask::TSSFlag
; Line 61
	mov	DWORD PTR _Task_ID$[ebp], 2
; Line 63
	lea	ecx, DWORD PTR _temp2$[ebp]
	mov	DWORD PTR _temp_TaskTSSPtr$[ebp], ecx
; Line 65
	push	0
	mov	edx, DWORD PTR _Task_ID$[ebp]
	push	edx
	mov	eax, DWORD PTR ?TimerStack@AOATask@@0JA	; AOATask::TimerStack
	push	eax
	mov	ecx, DWORD PTR ?TimerBase@AOATask@@0JA	; AOATask::TimerBase
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcreateTask@AOATask@@QAEHJJHH@Z	; AOATask::AOAcreateTask
; Line 67
	mov	DWORD PTR _TSS_Ptr$[ebp], 0
; Line 68
	mov	edx, DWORD PTR _Task_ID$[ebp]
	imul	edx, DWORD PTR ?TSSSize@AOATask@@0HA	; AOATask::TSSSize
	mov	eax, DWORD PTR ?TSSBase@AOATask@@0JA	; AOATask::TSSBase
	add	eax, edx
	mov	DWORD PTR _TSS_Ptr$[ebp], eax
; Line 70
	lea	ecx, DWORD PTR _temp2$[ebp]
	mov	DWORD PTR _temp_TaskTSSPtr$[ebp], ecx
; Line 71
	mov	edx, DWORD PTR _TSS_Ptr$[ebp]
	mov	DWORD PTR _temp_TaskTSSPtr$[ebp], edx
; Line 72
	mov	eax, DWORD PTR _temp_TaskTSSPtr$[ebp]
	mov	DWORD PTR _tempTSSPtr$[ebp], eax
; Line 73
	mov	ecx, DWORD PTR _tempTSSPtr$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR _desch$[ebp], edx
	mov	eax, DWORD PTR _tempTSSPtr$[ebp]
	add	eax, 4
	mov	DWORD PTR _tempTSSPtr$[ebp], eax
; Line 74
	mov	ecx, DWORD PTR _tempTSSPtr$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR _descl$[ebp], edx
; Line 78
	mov	DWORD PTR _GDTIndex$1078[ebp], 30	; 0000001eH
; Line 79
	mov	eax, DWORD PTR _GDTIndex$1078[ebp]
	push	eax
	lea	ecx, DWORD PTR _descl$[ebp]
	push	ecx
	lea	edx, DWORD PTR _desch$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?AOAsetGDTEntry@AOAProtected@@QAEHPAJ0H@Z ; AOAProtected::AOAsetGDTEntry
	mov	DWORD PTR _status$1079[ebp], eax
; Line 81
	jmp	$L1080
$L1075:
; Line 82
	mov	DWORD PTR ?TSSFlag@AOATask@@2HA, 0	; AOATask::TSSFlag
; Line 83
	mov	DWORD PTR _Task_ID$[ebp], 1
; Line 84
	lea	eax, DWORD PTR _temp2$[ebp]
	mov	DWORD PTR _temp_TaskTSSPtr$[ebp], eax
; Line 86
	push	0
	mov	ecx, DWORD PTR _Task_ID$[ebp]
	push	ecx
	mov	edx, DWORD PTR ?TimerStack@AOATask@@0JA	; AOATask::TimerStack
	push	edx
	mov	eax, DWORD PTR ?TimerBase@AOATask@@0JA	; AOATask::TimerBase
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcreateTask@AOATask@@QAEHJJHH@Z	; AOATask::AOAcreateTask
; Line 88
	mov	DWORD PTR _TSS_Ptr$[ebp], 0
; Line 89
	mov	ecx, DWORD PTR _Task_ID$[ebp]
	imul	ecx, DWORD PTR ?TSSSize@AOATask@@0HA	; AOATask::TSSSize
	mov	edx, DWORD PTR ?TSSBase@AOATask@@0JA	; AOATask::TSSBase
	add	edx, ecx
	mov	DWORD PTR _TSS_Ptr$[ebp], edx
; Line 91
	lea	eax, DWORD PTR _temp2$[ebp]
	mov	DWORD PTR _temp_TaskTSSPtr$[ebp], eax
; Line 92
	mov	ecx, DWORD PTR _TSS_Ptr$[ebp]
	mov	DWORD PTR _temp_TaskTSSPtr$[ebp], ecx
; Line 93
	mov	edx, DWORD PTR _temp_TaskTSSPtr$[ebp]
	mov	DWORD PTR _tempTSSPtr$[ebp], edx
; Line 94
	mov	eax, DWORD PTR _tempTSSPtr$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _desch$[ebp], ecx
	mov	edx, DWORD PTR _tempTSSPtr$[ebp]
	add	edx, 4
	mov	DWORD PTR _tempTSSPtr$[ebp], edx
; Line 95
	mov	eax, DWORD PTR _tempTSSPtr$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _descl$[ebp], ecx
; Line 99
	mov	DWORD PTR _GDTIndex$1083[ebp], 30	; 0000001eH
; Line 100
	mov	edx, DWORD PTR _GDTIndex$1083[ebp]
	push	edx
	lea	eax, DWORD PTR _descl$[ebp]
	push	eax
	lea	ecx, DWORD PTR _desch$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?AOAsetGDTEntry@AOAProtected@@QAEHPAJ0H@Z ; AOAProtected::AOAsetGDTEntry
	mov	DWORD PTR _status$1084[ebp], eax
$L1080:
; Line 103
	xor	eax, eax
; Line 105
	mov	esp, ebp
	pop	ebp
	ret	0
?AOAswapTSS@AOATask@@QAEHXZ ENDP			; AOATask::AOAswapTSS
_TEXT	ENDS
PUBLIC	?reinitializeTimer@AOATask@@QAEXXZ		; AOATask::reinitializeTimer
_TEXT	SEGMENT
_this$ = -48
_temp1$ = -12
_temp2$ = -24
_tempTSSPtr$ = -36
_desch$ = -44
_descl$ = -20
_TSS_Ptr$ = -32
_Task_ID$ = -28
_tempcp_ptr$ = -16
_temp_TaskTSSPtr$ = -8
_GDTIndex$ = -4
_status$ = -40
?reinitializeTimer@AOATask@@QAEXXZ PROC NEAR		; AOATask::reinitializeTimer
; Line 111
	push	ebp
	mov	ebp, esp
	sub	esp, 48					; 00000030H
	mov	DWORD PTR _this$[ebp], ecx
; Line 114
	lea	eax, DWORD PTR _temp1$[ebp]
	mov	DWORD PTR _tempTSSPtr$[ebp], eax
; Line 116
	mov	DWORD PTR _TSS_Ptr$[ebp], 0
; Line 117
	mov	DWORD PTR _Task_ID$[ebp], 1
; Line 118
	mov	DWORD PTR _tempcp_ptr$[ebp], 0
; Line 121
	mov	DWORD PTR _Task_ID$[ebp], 0
; Line 123
	lea	ecx, DWORD PTR _temp2$[ebp]
	mov	DWORD PTR _temp_TaskTSSPtr$[ebp], ecx
; Line 125
	push	0
	mov	edx, DWORD PTR _Task_ID$[ebp]
	push	edx
	mov	eax, DWORD PTR ?TimerStack@AOATask@@0JA	; AOATask::TimerStack
	push	eax
	mov	ecx, DWORD PTR ?TimerBase@AOATask@@0JA	; AOATask::TimerBase
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcreateTask@AOATask@@QAEHJJHH@Z	; AOATask::AOAcreateTask
; Line 127
	mov	DWORD PTR _TSS_Ptr$[ebp], 0
; Line 128
	mov	edx, DWORD PTR _Task_ID$[ebp]
	imul	edx, DWORD PTR ?TSSSize@AOATask@@0HA	; AOATask::TSSSize
	mov	eax, DWORD PTR ?TSSBase@AOATask@@0JA	; AOATask::TSSBase
	add	eax, edx
	mov	DWORD PTR _TSS_Ptr$[ebp], eax
; Line 130
	lea	ecx, DWORD PTR _temp2$[ebp]
	mov	DWORD PTR _temp_TaskTSSPtr$[ebp], ecx
; Line 131
	mov	edx, DWORD PTR _TSS_Ptr$[ebp]
	mov	DWORD PTR _temp_TaskTSSPtr$[ebp], edx
; Line 132
	mov	eax, DWORD PTR _temp_TaskTSSPtr$[ebp]
	mov	DWORD PTR _tempTSSPtr$[ebp], eax
; Line 133
	mov	ecx, DWORD PTR _tempTSSPtr$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR _desch$[ebp], edx
	mov	eax, DWORD PTR _tempTSSPtr$[ebp]
	add	eax, 4
	mov	DWORD PTR _tempTSSPtr$[ebp], eax
; Line 134
	mov	ecx, DWORD PTR _tempTSSPtr$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR _descl$[ebp], edx
; Line 138
	mov	DWORD PTR _GDTIndex$[ebp], 30		; 0000001eH
; Line 139
	mov	eax, DWORD PTR _GDTIndex$[ebp]
	push	eax
	lea	ecx, DWORD PTR _descl$[ebp]
	push	ecx
	lea	edx, DWORD PTR _desch$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?AOAsetGDTEntry@AOAProtected@@QAEHPAJ0H@Z ; AOAProtected::AOAsetGDTEntry
	mov	DWORD PTR _status$[ebp], eax
; Line 140
	mov	esp, ebp
	pop	ebp
	ret	0
?reinitializeTimer@AOATask@@QAEXXZ ENDP			; AOATask::reinitializeTimer
_TEXT	ENDS
PUBLIC	?reinitializeScheduler@AOATask@@QAEXXZ		; AOATask::reinitializeScheduler
_TEXT	SEGMENT
_this$ = -48
_temp1$ = -12
_temp2$ = -24
_tempTSSPtr$ = -36
_desch$ = -44
_descl$ = -20
_TSS_Ptr$ = -32
_Task_ID$ = -28
_tempcp_ptr$ = -16
_temp_TaskTSSPtr$ = -8
_GDTIndex$ = -4
_status$ = -40
?reinitializeScheduler@AOATask@@QAEXXZ PROC NEAR	; AOATask::reinitializeScheduler
; Line 145
	push	ebp
	mov	ebp, esp
	sub	esp, 48					; 00000030H
	mov	DWORD PTR _this$[ebp], ecx
; Line 148
	lea	eax, DWORD PTR _temp1$[ebp]
	mov	DWORD PTR _tempTSSPtr$[ebp], eax
; Line 150
	mov	DWORD PTR _TSS_Ptr$[ebp], 0
; Line 151
	mov	DWORD PTR _Task_ID$[ebp], 0
; Line 152
	mov	DWORD PTR _tempcp_ptr$[ebp], 0
; Line 155
	mov	DWORD PTR _Task_ID$[ebp], 0
; Line 157
	lea	ecx, DWORD PTR _temp2$[ebp]
	mov	DWORD PTR _temp_TaskTSSPtr$[ebp], ecx
; Line 159
	push	0
	mov	edx, DWORD PTR _Task_ID$[ebp]
	push	edx
	mov	eax, DWORD PTR ?SchStack@AOATask@@2JA	; AOATask::SchStack
	push	eax
	mov	ecx, DWORD PTR ?SchBase@AOATask@@0JA	; AOATask::SchBase
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcreateTask@AOATask@@QAEHJJHH@Z	; AOATask::AOAcreateTask
; Line 161
	mov	DWORD PTR _TSS_Ptr$[ebp], 0
; Line 162
	mov	edx, DWORD PTR _Task_ID$[ebp]
	imul	edx, DWORD PTR ?TSSSize@AOATask@@0HA	; AOATask::TSSSize
	mov	eax, DWORD PTR ?TSSBase@AOATask@@0JA	; AOATask::TSSBase
	add	eax, edx
	mov	DWORD PTR _TSS_Ptr$[ebp], eax
; Line 165
	lea	ecx, DWORD PTR _temp2$[ebp]
	mov	DWORD PTR _temp_TaskTSSPtr$[ebp], ecx
; Line 166
	mov	edx, DWORD PTR _TSS_Ptr$[ebp]
	mov	DWORD PTR _temp_TaskTSSPtr$[ebp], edx
; Line 167
	mov	eax, DWORD PTR _temp_TaskTSSPtr$[ebp]
	mov	DWORD PTR _tempTSSPtr$[ebp], eax
; Line 168
	mov	ecx, DWORD PTR _tempTSSPtr$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR _desch$[ebp], edx
	mov	eax, DWORD PTR _tempTSSPtr$[ebp]
	add	eax, 4
	mov	DWORD PTR _tempTSSPtr$[ebp], eax
; Line 169
	mov	ecx, DWORD PTR _tempTSSPtr$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR _descl$[ebp], edx
; Line 173
	mov	DWORD PTR _GDTIndex$[ebp], 29		; 0000001dH
; Line 174
	mov	eax, DWORD PTR _GDTIndex$[ebp]
	push	eax
	lea	ecx, DWORD PTR _descl$[ebp]
	push	ecx
	lea	edx, DWORD PTR _desch$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?AOAsetGDTEntry@AOAProtected@@QAEHPAJ0H@Z ; AOAProtected::AOAsetGDTEntry
	mov	DWORD PTR _status$[ebp], eax
; Line 175
	mov	esp, ebp
	pop	ebp
	ret	0
?reinitializeScheduler@AOATask@@QAEXXZ ENDP		; AOATask::reinitializeScheduler
_TEXT	ENDS
PUBLIC	?createTSSDescriptor@AOATask@@AAEHHH@Z		; AOATask::createTSSDescriptor
_TEXT	SEGMENT
_Task_ID$ = 8
_ehflag$ = 12
_this$ = -60
_io$ = -44
_status$ = -48
_desch$ = -56
_descl$ = -20
_TSS_Ptr$ = -24
_Base_Address$ = -4
_G_AVL_DPL_Attr$ = -32
_Seg_Limit_L$ = -52
_temp$ = -36
_temp2$ = -16
_temp1$ = -12
_tempTSSPtr$ = -28
_temp_TaskTSSPtr$ = -8
?createTSSDescriptor@AOATask@@AAEHHH@Z PROC NEAR	; AOATask::createTSSDescriptor
; Line 182
	push	ebp
	mov	ebp, esp
	sub	esp, 60					; 0000003cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 184
	lea	ecx, DWORD PTR _io$[ebp]
	call	??0AOAProtected@@QAE@XZ			; AOAProtected::AOAProtected
; Line 185
	mov	DWORD PTR _status$[ebp], 0
; Line 186
	mov	DWORD PTR _desch$[ebp], 0
; Line 187
	mov	DWORD PTR _descl$[ebp], 0
; Line 190
	mov	eax, DWORD PTR _Task_ID$[ebp]
	imul	eax, DWORD PTR ?TSSSize@AOATask@@0HA	; AOATask::TSSSize
	mov	ecx, DWORD PTR ?TSSBase@AOATask@@0JA	; AOATask::TSSBase
	add	ecx, eax
	mov	DWORD PTR _TSS_Ptr$[ebp], ecx
; Line 191
	mov	edx, DWORD PTR _TSS_Ptr$[ebp]
	add	edx, 1114120				; 00110008H
	mov	DWORD PTR _Base_Address$[ebp], edx
; Line 192
	mov	DWORD PTR _G_AVL_DPL_Attr$[ebp], 137	; 00000089H
; Line 193
	mov	DWORD PTR _Seg_Limit_L$[ebp], 2152	; 00000868H
; Line 195
	mov	eax, DWORD PTR _Base_Address$[ebp]
	mov	DWORD PTR _temp$[ebp], eax
; Line 199
	mov	ecx, DWORD PTR _Base_Address$[ebp]
	and	ecx, 16711680				; 00ff0000H
	mov	DWORD PTR _descl$[ebp], ecx
; Line 200
	mov	edx, DWORD PTR _descl$[ebp]
	sar	edx, 16					; 00000010H
	mov	DWORD PTR _descl$[ebp], edx
; Line 201
	mov	DWORD PTR _temp$[ebp], 0
; Line 202
	mov	eax, DWORD PTR _G_AVL_DPL_Attr$[ebp]
	mov	DWORD PTR _temp$[ebp], eax
; Line 203
	mov	ecx, DWORD PTR _temp$[ebp]
	shl	ecx, 8
	mov	DWORD PTR _temp$[ebp], ecx
; Line 204
	mov	edx, DWORD PTR _descl$[ebp]
	or	edx, DWORD PTR _temp$[ebp]
	mov	DWORD PTR _descl$[ebp], edx
; Line 205
	mov	DWORD PTR _temp$[ebp], 0
; Line 206
	mov	eax, DWORD PTR _Base_Address$[ebp]
	and	eax, -16777216				; ff000000H
	mov	DWORD PTR _temp$[ebp], eax
; Line 207
	mov	ecx, DWORD PTR _descl$[ebp]
	or	ecx, DWORD PTR _temp$[ebp]
	mov	DWORD PTR _descl$[ebp], ecx
; Line 210
	mov	edx, DWORD PTR _Seg_Limit_L$[ebp]
	mov	DWORD PTR _desch$[ebp], edx
; Line 212
	mov	DWORD PTR _temp$[ebp], 0
; Line 213
	mov	eax, DWORD PTR _Base_Address$[ebp]
	and	eax, 65535				; 0000ffffH
	mov	DWORD PTR _temp$[ebp], eax
; Line 215
	mov	ecx, DWORD PTR _temp$[ebp]
	shl	ecx, 16					; 00000010H
	mov	edx, DWORD PTR _desch$[ebp]
	or	edx, ecx
	mov	DWORD PTR _desch$[ebp], edx
; Line 219
	lea	eax, DWORD PTR _temp1$[ebp]
	mov	DWORD PTR _tempTSSPtr$[ebp], eax
; Line 223
	lea	ecx, DWORD PTR _temp2$[ebp]
	mov	DWORD PTR _temp_TaskTSSPtr$[ebp], ecx
; Line 224
	mov	edx, DWORD PTR _TSS_Ptr$[ebp]
	mov	DWORD PTR _temp_TaskTSSPtr$[ebp], edx
; Line 225
	mov	eax, DWORD PTR _temp_TaskTSSPtr$[ebp]
	mov	DWORD PTR _tempTSSPtr$[ebp], eax
; Line 226
	mov	ecx, DWORD PTR _tempTSSPtr$[ebp]
	mov	edx, DWORD PTR _desch$[ebp]
	mov	DWORD PTR [ecx], edx
	mov	eax, DWORD PTR _tempTSSPtr$[ebp]
	add	eax, 4
	mov	DWORD PTR _tempTSSPtr$[ebp], eax
; Line 227
	mov	ecx, DWORD PTR _tempTSSPtr$[ebp]
	mov	edx, DWORD PTR _descl$[ebp]
	mov	DWORD PTR [ecx], edx
; Line 228
	cmp	DWORD PTR _ehflag$[ebp], 1
	jne	SHORT $L1140
; Line 238
	push	31					; 0000001fH
	lea	eax, DWORD PTR _descl$[ebp]
	push	eax
	lea	ecx, DWORD PTR _desch$[ebp]
	push	ecx
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAsetGDTEntry@AOAProtected@@QAEHPAJ0H@Z ; AOAProtected::AOAsetGDTEntry
	mov	DWORD PTR _status$[ebp], eax
$L1140:
; Line 240
	xor	eax, eax
; Line 241
	mov	esp, ebp
	pop	ebp
	ret	8
?createTSSDescriptor@AOATask@@AAEHHH@Z ENDP		; AOATask::createTSSDescriptor
_TEXT	ENDS
PUBLIC	?AOArunTask@AOATask@@QAEHH@Z			; AOATask::AOArunTask
EXTRN	_runTask:NEAR
_TEXT	SEGMENT
_Task_ID$ = 8
_this$ = -48
_io$ = -36
_temp2$ = -20
_temp1$ = -12
_tempTSSPtr$ = -28
_temp_TaskTSSPtr$ = -8
_desch$ = -44
_descl$ = -16
_TSS_Ptr$ = -24
_GDTIndex$ = -4
_status$ = -40
?AOArunTask@AOATask@@QAEHH@Z PROC NEAR			; AOATask::AOArunTask
; Line 249
	push	ebp
	mov	ebp, esp
	sub	esp, 48					; 00000030H
	mov	DWORD PTR _this$[ebp], ecx
; Line 250
	lea	ecx, DWORD PTR _io$[ebp]
	call	??0AOAProtected@@QAE@XZ			; AOAProtected::AOAProtected
; Line 254
	lea	eax, DWORD PTR _temp1$[ebp]
	mov	DWORD PTR _tempTSSPtr$[ebp], eax
; Line 260
	mov	ecx, DWORD PTR _Task_ID$[ebp]
	imul	ecx, DWORD PTR ?TSSSize@AOATask@@0HA	; AOATask::TSSSize
	mov	edx, DWORD PTR ?TSSBase@AOATask@@0JA	; AOATask::TSSBase
	add	edx, ecx
	mov	DWORD PTR _TSS_Ptr$[ebp], edx
; Line 263
	lea	eax, DWORD PTR _temp2$[ebp]
	mov	DWORD PTR _temp_TaskTSSPtr$[ebp], eax
; Line 264
	mov	ecx, DWORD PTR _TSS_Ptr$[ebp]
	mov	DWORD PTR _temp_TaskTSSPtr$[ebp], ecx
; Line 265
	mov	edx, DWORD PTR _temp_TaskTSSPtr$[ebp]
	mov	DWORD PTR _tempTSSPtr$[ebp], edx
; Line 267
	mov	eax, DWORD PTR _tempTSSPtr$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _desch$[ebp], ecx
	mov	edx, DWORD PTR _tempTSSPtr$[ebp]
	add	edx, 4
	mov	DWORD PTR _tempTSSPtr$[ebp], edx
; Line 268
	mov	eax, DWORD PTR _tempTSSPtr$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _descl$[ebp], ecx
; Line 276
	mov	DWORD PTR _GDTIndex$[ebp], 0
; Line 277
	cmp	DWORD PTR _Task_ID$[ebp], 0
	jne	SHORT $L1157
; Line 279
	mov	DWORD PTR _GDTIndex$[ebp], 29		; 0000001dH
; Line 281
	jmp	SHORT $L1158
$L1157:
; Line 283
	mov	DWORD PTR _GDTIndex$[ebp], 28		; 0000001cH
$L1158:
; Line 286
	mov	edx, DWORD PTR _GDTIndex$[ebp]
	push	edx
	lea	eax, DWORD PTR _descl$[ebp]
	push	eax
	lea	ecx, DWORD PTR _desch$[ebp]
	push	ecx
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAsetGDTEntry@AOAProtected@@QAEHPAJ0H@Z ; AOAProtected::AOAsetGDTEntry
	mov	DWORD PTR _status$[ebp], eax
; Line 287
	mov	edx, DWORD PTR _Task_ID$[ebp]
	mov	DWORD PTR ?TaskId@AOATask@@2HA, edx	; AOATask::TaskId
; Line 289
	mov	eax, DWORD PTR _Task_ID$[ebp]
	imul	eax, DWORD PTR ?TSSSize@AOATask@@0HA	; AOATask::TSSSize
	mov	ecx, DWORD PTR ?TSSBase@AOATask@@0JA	; AOATask::TSSBase
	lea	edx, DWORD PTR [ecx+eax+36]
	mov	DWORD PTR _TSS_Ptr$[ebp], edx
; Line 290
	mov	eax, DWORD PTR _TSS_Ptr$[ebp]
	mov	DWORD PTR _temp_TaskTSSPtr$[ebp], eax
; Line 291
	mov	ecx, DWORD PTR _temp_TaskTSSPtr$[ebp]
	mov	DWORD PTR _tempTSSPtr$[ebp], ecx
; Line 297
	mov	edx, DWORD PTR _Task_ID$[ebp]
	push	edx
	call	_runTask
	add	esp, 4
; Line 298
	xor	eax, eax
; Line 299
	mov	esp, ebp
	pop	ebp
	ret	4
?AOArunTask@AOATask@@QAEHH@Z ENDP			; AOATask::AOArunTask
_TEXT	ENDS
PUBLIC	?AOAsuspendTask@AOATask@@QAEXXZ			; AOATask::AOAsuspendTask
EXTRN	_runTaskMain:NEAR
_TEXT	SEGMENT
_this$ = -4
?AOAsuspendTask@AOATask@@QAEXXZ PROC NEAR		; AOATask::AOAsuspendTask
; Line 305
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 306
	call	_runTaskMain
; Line 307
	mov	esp, ebp
	pop	ebp
	ret	0
?AOAsuspendTask@AOATask@@QAEXXZ ENDP			; AOATask::AOAsuspendTask
_TEXT	ENDS
PUBLIC	?AOAsuspendHTask@AOATask@@QAEXKJHH@Z		; AOATask::AOAsuspendHTask
EXTRN	?AOAgetTimer@AOAProtected@@QAEJXZ:NEAR		; AOAProtected::AOAgetTimer
EXTRN	?AOAPrintText@AOAProtected@@QAEXPADH@Z:NEAR	; AOAProtected::AOAPrintText
EXTRN	?insert@WCirList@@QAEHJJJHJ@Z:NEAR		; WCirList::insert
EXTRN	?full@WCirList@@QAEHXZ:NEAR			; WCirList::full
_DATA	SEGMENT
$SG1177	DB	'aoatask:aoasuspendtask circular list is full', 00H
_DATA	ENDS
_TEXT	SEGMENT
_delayw$ = 8
_statec$ = 12
_tcbrnoc$ = 16
_currenttask$ = 20
_this$ = -8
_sum$ = -4
?AOAsuspendHTask@AOATask@@QAEXKJHH@Z PROC NEAR		; AOATask::AOAsuspendHTask
; Line 313
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	DWORD PTR _this$[ebp], ecx
; Line 314
	mov	DWORD PTR _sum$[ebp], 0
; Line 316
	cmp	DWORD PTR _delayw$[ebp], 0
	je	SHORT $L1173
; Line 318
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	add	eax, DWORD PTR _delayw$[ebp]
	mov	DWORD PTR _sum$[ebp], eax
; Line 320
	jmp	SHORT $L1174
$L1173:
; Line 321
	mov	DWORD PTR _sum$[ebp], 0
$L1174:
; Line 323
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 16					; 00000010H
	call	?full@WCirList@@QAEHXZ			; WCirList::full
	test	eax, eax
	jne	SHORT $L1175
; Line 325
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?AOAgetTimer@AOAProtected@@QAEJXZ	; AOAProtected::AOAgetTimer
	push	eax
	mov	eax, DWORD PTR _tcbrnoc$[ebp]
	push	eax
	mov	ecx, DWORD PTR _statec$[ebp]
	push	ecx
	mov	edx, DWORD PTR _sum$[ebp]
	push	edx
	mov	eax, DWORD PTR _currenttask$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 16					; 00000010H
	call	?insert@WCirList@@QAEHJJJHJ@Z		; WCirList::insert
; Line 327
	jmp	SHORT $L1176
$L1175:
; Line 328
	push	3840					; 00000f00H
	push	OFFSET FLAT:$SG1177
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
$L1176:
; Line 333
	call	_runTaskMain
; Line 334
	mov	esp, ebp
	pop	ebp
	ret	16					; 00000010H
?AOAsuspendHTask@AOATask@@QAEXKJHH@Z ENDP		; AOATask::AOAsuspendHTask
_TEXT	ENDS
PUBLIC	?AOAcompleteTask@AOATask@@QAEXHH@Z		; AOATask::AOAcompleteTask
EXTRN	?push@WStack@@QAEHH@Z:NEAR			; WStack::push
EXTRN	?full@WStack@@QAEHXZ:NEAR			; WStack::full
_DATA	SEGMENT
	ORG $+3
$SG1185	DB	'aoatask:aoacompletetask stack is full', 00H
_DATA	ENDS
_TEXT	SEGMENT
_currenttask$ = 8
_this$ = -4
?AOAcompleteTask@AOATask@@QAEXHH@Z PROC NEAR		; AOATask::AOAcompleteTask
; Line 340
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
; Line 342
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 24					; 00000018H
	call	?full@WStack@@QAEHXZ			; WStack::full
	test	eax, eax
	jne	SHORT $L1183
; Line 344
	mov	eax, DWORD PTR _currenttask$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 24					; 00000018H
	call	?push@WStack@@QAEHH@Z			; WStack::push
; Line 346
	jmp	SHORT $L1184
$L1183:
; Line 347
	push	3840					; 00000f00H
	push	OFFSET FLAT:$SG1185
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
$L1184:
; Line 354
	call	_runTaskMain
; Line 355
	mov	esp, ebp
	pop	ebp
	ret	8
?AOAcompleteTask@AOATask@@QAEXHH@Z ENDP			; AOATask::AOAcompleteTask
_TEXT	ENDS
PUBLIC	?AOAinitTasks@AOATask@@QAEHPAJJJ@Z		; AOATask::AOAinitTasks
_TEXT	SEGMENT
_TSSBasePtr$ = 8
_Stack_Ptr$ = 12
_schfnaddr$ = 16
_this$ = -44
_Task_ID$ = -24
_desch$ = -40
_descl$ = -20
_temp2$ = -16
_temp1$ = -12
_tempTSSPtr$ = -32
_temp_TaskTSSPtr$ = -8
_TSS_Ptr$ = -28
_GDTIndex$ = -4
_status$ = -36
?AOAinitTasks@AOATask@@QAEHPAJJJ@Z PROC NEAR		; AOATask::AOAinitTasks
; Line 365
	push	ebp
	mov	ebp, esp
	sub	esp, 44					; 0000002cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 366
	mov	DWORD PTR _Task_ID$[ebp], 0
; Line 369
	mov	eax, DWORD PTR _TSSBasePtr$[ebp]
	mov	DWORD PTR ?TSSBase@AOATask@@0JA, eax	; AOATask::TSSBase
; Line 370
	mov	ecx, DWORD PTR _Stack_Ptr$[ebp]
	mov	DWORD PTR ?StackBase@AOATask@@2JA, ecx	; AOATask::StackBase
; Line 373
	push	0
	push	0
	mov	edx, DWORD PTR _Stack_Ptr$[ebp]
	push	edx
	mov	eax, DWORD PTR _schfnaddr$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcreateTask@AOATask@@QAEHJJHH@Z	; AOATask::AOAcreateTask
; Line 378
	lea	ecx, DWORD PTR _temp1$[ebp]
	mov	DWORD PTR _tempTSSPtr$[ebp], ecx
; Line 382
	mov	edx, DWORD PTR _Task_ID$[ebp]
	imul	edx, DWORD PTR ?TSSSize@AOATask@@0HA	; AOATask::TSSSize
	mov	eax, DWORD PTR ?TSSBase@AOATask@@0JA	; AOATask::TSSBase
	add	eax, edx
	mov	DWORD PTR _TSS_Ptr$[ebp], eax
; Line 385
	lea	ecx, DWORD PTR _temp2$[ebp]
	mov	DWORD PTR _temp_TaskTSSPtr$[ebp], ecx
; Line 386
	mov	edx, DWORD PTR _TSS_Ptr$[ebp]
	mov	DWORD PTR _temp_TaskTSSPtr$[ebp], edx
; Line 387
	mov	eax, DWORD PTR _temp_TaskTSSPtr$[ebp]
	mov	DWORD PTR _tempTSSPtr$[ebp], eax
; Line 388
	mov	ecx, DWORD PTR _tempTSSPtr$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR _desch$[ebp], edx
	mov	eax, DWORD PTR _tempTSSPtr$[ebp]
	add	eax, 4
	mov	DWORD PTR _tempTSSPtr$[ebp], eax
; Line 389
	mov	ecx, DWORD PTR _tempTSSPtr$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR _descl$[ebp], edx
; Line 393
	mov	DWORD PTR _GDTIndex$[ebp], 29		; 0000001dH
; Line 394
	mov	eax, DWORD PTR _GDTIndex$[ebp]
	push	eax
	lea	ecx, DWORD PTR _descl$[ebp]
	push	ecx
	lea	edx, DWORD PTR _desch$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?AOAsetGDTEntry@AOAProtected@@QAEHPAJ0H@Z ; AOAProtected::AOAsetGDTEntry
	mov	DWORD PTR _status$[ebp], eax
; Line 397
	mov	eax, DWORD PTR _schfnaddr$[ebp]
	mov	DWORD PTR ?SchBase@AOATask@@0JA, eax	; AOATask::SchBase
; Line 398
	mov	ecx, DWORD PTR _Stack_Ptr$[ebp]
	mov	DWORD PTR ?SchStack@AOATask@@2JA, ecx	; AOATask::SchStack
; Line 401
	xor	eax, eax
; Line 402
	mov	esp, ebp
	pop	ebp
	ret	12					; 0000000cH
?AOAinitTasks@AOATask@@QAEHPAJJJ@Z ENDP			; AOATask::AOAinitTasks
_TEXT	ENDS
PUBLIC	?AOArunTasks@AOATask@@QAEXXZ			; AOATask::AOArunTasks
EXTRN	?AOAgetIDTEntry@AOAProtected@@QAEHPAJ0H@Z:NEAR	; AOAProtected::AOAgetIDTEntry
EXTRN	?AOAsetIDTEntry@AOAProtected@@QAEHPAJ0H@Z:NEAR	; AOAProtected::AOAsetIDTEntry
_TEXT	SEGMENT
_this$ = -12
_desch$ = -8
_descl$ = -4
?AOArunTasks@AOATask@@QAEXXZ PROC NEAR			; AOATask::AOArunTasks
; Line 413
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 415
	mov	DWORD PTR ?RunSch_Flag@AOATask@@2HA, 1	; AOATask::RunSch_Flag
; Line 418
	mov	DWORD PTR _desch$[ebp], 15728640	; 00f00000H
; Line 419
	mov	DWORD PTR _descl$[ebp], 34048		; 00008500H
; Line 421
	push	8
	mov	eax, DWORD PTR _this$[ebp]
	add	eax, 44					; 0000002cH
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 40					; 00000028H
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?AOAgetIDTEntry@AOAProtected@@QAEHPAJ0H@Z ; AOAProtected::AOAgetIDTEntry
; Line 423
	push	8
	lea	edx, DWORD PTR _descl$[ebp]
	push	edx
	lea	eax, DWORD PTR _desch$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?AOAsetIDTEntry@AOAProtected@@QAEHPAJ0H@Z ; AOAProtected::AOAsetIDTEntry
; Line 427
	int	8
; Line 429
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	0
?AOArunTasks@AOATask@@QAEXXZ ENDP			; AOATask::AOArunTasks
_TEXT	ENDS
PUBLIC	?AOAapplink32@AOATask@@QAEHXZ			; AOATask::AOAapplink32
_TEXT	SEGMENT
_this$ = -28
_Task_ID$ = -16
_temp2$ = -12
_temp1$ = -8
_tempTSSPtr$ = -24
_temp_TaskTSSPtr$ = -4
_TSS_Ptr$ = -20
?AOAapplink32@AOATask@@QAEHXZ PROC NEAR			; AOATask::AOAapplink32
; Line 435
	push	ebp
	mov	ebp, esp
	sub	esp, 28					; 0000001cH
	mov	DWORD PTR _this$[ebp], ecx
; Line 437
	mov	DWORD PTR _Task_ID$[ebp], 1
; Line 441
	lea	eax, DWORD PTR _temp1$[ebp]
	mov	DWORD PTR _tempTSSPtr$[ebp], eax
; Line 445
	mov	ecx, DWORD PTR _Task_ID$[ebp]
	imul	ecx, DWORD PTR ?TSSSize@AOATask@@0HA	; AOATask::TSSSize
	mov	edx, DWORD PTR ?TSSBase@AOATask@@0JA	; AOATask::TSSBase
	lea	eax, DWORD PTR [edx+ecx+8]
	mov	DWORD PTR _TSS_Ptr$[ebp], eax
; Line 448
	lea	ecx, DWORD PTR _temp2$[ebp]
	mov	DWORD PTR _temp_TaskTSSPtr$[ebp], ecx
; Line 449
	mov	edx, DWORD PTR _TSS_Ptr$[ebp]
	mov	DWORD PTR _temp_TaskTSSPtr$[ebp], edx
; Line 450
	mov	eax, DWORD PTR _temp_TaskTSSPtr$[ebp]
	mov	DWORD PTR _tempTSSPtr$[ebp], eax
; Line 451
	mov	ecx, DWORD PTR _tempTSSPtr$[ebp]
	mov	DWORD PTR [ecx], 200			; 000000c8H
; Line 454
	mov	DWORD PTR _Task_ID$[ebp], 2
; Line 455
	mov	edx, DWORD PTR _Task_ID$[ebp]
	imul	edx, DWORD PTR ?TSSSize@AOATask@@0HA	; AOATask::TSSSize
	mov	eax, DWORD PTR ?TSSBase@AOATask@@0JA	; AOATask::TSSBase
	lea	ecx, DWORD PTR [eax+edx+8]
	mov	DWORD PTR _TSS_Ptr$[ebp], ecx
; Line 457
	mov	edx, DWORD PTR _TSS_Ptr$[ebp]
	mov	DWORD PTR _temp_TaskTSSPtr$[ebp], edx
; Line 458
	mov	eax, DWORD PTR _temp_TaskTSSPtr$[ebp]
	mov	DWORD PTR _tempTSSPtr$[ebp], eax
; Line 459
	mov	ecx, DWORD PTR _tempTSSPtr$[ebp]
	mov	DWORD PTR [ecx], 200			; 000000c8H
; Line 461
	mov	DWORD PTR _Task_ID$[ebp], 0
; Line 462
	mov	edx, DWORD PTR _Task_ID$[ebp]
	imul	edx, DWORD PTR ?TSSSize@AOATask@@0HA	; AOATask::TSSSize
	mov	eax, DWORD PTR ?TSSBase@AOATask@@0JA	; AOATask::TSSBase
	lea	ecx, DWORD PTR [eax+edx+8]
	mov	DWORD PTR _TSS_Ptr$[ebp], ecx
; Line 464
	mov	edx, DWORD PTR _TSS_Ptr$[ebp]
	mov	DWORD PTR _temp_TaskTSSPtr$[ebp], edx
; Line 465
	mov	eax, DWORD PTR _temp_TaskTSSPtr$[ebp]
	mov	DWORD PTR _tempTSSPtr$[ebp], eax
; Line 466
	mov	ecx, DWORD PTR _tempTSSPtr$[ebp]
	mov	DWORD PTR [ecx], 200			; 000000c8H
; Line 468
	xor	eax, eax
; Line 470
	mov	esp, ebp
	pop	ebp
	ret	0
?AOAapplink32@AOATask@@QAEHXZ ENDP			; AOATask::AOAapplink32
_TEXT	ENDS
PUBLIC	?AOArunTimer@AOATask@@QAEHJJ@Z			; AOATask::AOArunTimer
_TEXT	SEGMENT
_schfunaddress$ = 8
_Sch_Stack_Ptr$ = 12
_this$ = -48
_Task_ID$ = -28
_retcode$ = -16
_temp2$ = -24
_temp1$ = -12
_tempTSSPtr$ = -36
_temp_TaskTSSPtr$ = -8
_desch$ = -44
_descl$ = -20
_TSS_Ptr$ = -32
_GDTIndex$ = -4
_status$ = -40
?AOArunTimer@AOATask@@QAEHJJ@Z PROC NEAR		; AOATask::AOArunTimer
; Line 481
	push	ebp
	mov	ebp, esp
	sub	esp, 48					; 00000030H
	mov	DWORD PTR _this$[ebp], ecx
; Line 482
	mov	DWORD PTR _Task_ID$[ebp], 1
; Line 483
	mov	DWORD PTR _retcode$[ebp], 0
; Line 485
	mov	eax, DWORD PTR _schfunaddress$[ebp]
	mov	DWORD PTR ?TimerBase@AOATask@@0JA, eax	; AOATask::TimerBase
; Line 486
	mov	ecx, DWORD PTR _Sch_Stack_Ptr$[ebp]
	mov	DWORD PTR ?TimerStack@AOATask@@0JA, ecx	; AOATask::TimerStack
; Line 489
	push	0
	mov	edx, DWORD PTR _Task_ID$[ebp]
	push	edx
	mov	eax, DWORD PTR _Sch_Stack_Ptr$[ebp]
	push	eax
	mov	ecx, DWORD PTR _schfunaddress$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcreateTask@AOATask@@QAEHJJHH@Z	; AOATask::AOAcreateTask
; Line 494
	lea	edx, DWORD PTR _temp1$[ebp]
	mov	DWORD PTR _tempTSSPtr$[ebp], edx
; Line 500
	mov	eax, DWORD PTR _Task_ID$[ebp]
	imul	eax, DWORD PTR ?TSSSize@AOATask@@0HA	; AOATask::TSSSize
	mov	ecx, DWORD PTR ?TSSBase@AOATask@@0JA	; AOATask::TSSBase
	add	ecx, eax
	mov	DWORD PTR _TSS_Ptr$[ebp], ecx
; Line 503
	lea	edx, DWORD PTR _temp2$[ebp]
	mov	DWORD PTR _temp_TaskTSSPtr$[ebp], edx
; Line 504
	mov	eax, DWORD PTR _TSS_Ptr$[ebp]
	mov	DWORD PTR _temp_TaskTSSPtr$[ebp], eax
; Line 505
	mov	ecx, DWORD PTR _temp_TaskTSSPtr$[ebp]
	mov	DWORD PTR _tempTSSPtr$[ebp], ecx
; Line 506
	mov	edx, DWORD PTR _tempTSSPtr$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR _desch$[ebp], eax
	mov	ecx, DWORD PTR _tempTSSPtr$[ebp]
	add	ecx, 4
	mov	DWORD PTR _tempTSSPtr$[ebp], ecx
; Line 507
	mov	edx, DWORD PTR _tempTSSPtr$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR _descl$[ebp], eax
; Line 511
	mov	DWORD PTR _GDTIndex$[ebp], 30		; 0000001eH
; Line 512
	mov	ecx, DWORD PTR _GDTIndex$[ebp]
	push	ecx
	lea	edx, DWORD PTR _descl$[ebp]
	push	edx
	lea	eax, DWORD PTR _desch$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	add	ecx, 8
	call	?AOAsetGDTEntry@AOAProtected@@QAEHPAJ0H@Z ; AOAProtected::AOAsetGDTEntry
	mov	DWORD PTR _status$[ebp], eax
; Line 515
	mov	DWORD PTR _Task_ID$[ebp], 2
; Line 516
	mov	DWORD PTR _retcode$[ebp], 0
; Line 517
	mov	ecx, DWORD PTR _schfunaddress$[ebp]
	mov	DWORD PTR ?TimerBase@AOATask@@0JA, ecx	; AOATask::TimerBase
; Line 518
	mov	edx, DWORD PTR _Sch_Stack_Ptr$[ebp]
	mov	DWORD PTR ?TimerStack@AOATask@@0JA, edx	; AOATask::TimerStack
; Line 521
	push	0
	mov	eax, DWORD PTR _Task_ID$[ebp]
	push	eax
	mov	ecx, DWORD PTR _Sch_Stack_Ptr$[ebp]
	push	ecx
	mov	edx, DWORD PTR _schfunaddress$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcreateTask@AOATask@@QAEHJJHH@Z	; AOATask::AOAcreateTask
; Line 522
	mov	DWORD PTR ?RunSch_Flag@AOATask@@2HA, 0	; AOATask::RunSch_Flag
; Line 523
	xor	eax, eax
; Line 524
	mov	esp, ebp
	pop	ebp
	ret	8
?AOArunTimer@AOATask@@QAEHJJ@Z ENDP			; AOATask::AOArunTimer
_Function_Address$ = 8
_StackMEM_Ptr$ = 12
_Task_ID$ = 16
_ehflag$ = 20
_this$ = -32
_temp1$ = -12
_temp2$ = -20
_TSS_Ptr$ = -24
_temp_TSSPtr$ = -8
_temp_TaskTSSPtr$ = -4
_i$ = -28
_tempcp_ptr$ = -16
?AOAcreateTask@AOATask@@QAEHJJHH@Z PROC NEAR		; AOATask::AOAcreateTask
; Line 541
	push	ebp
	mov	ebp, esp
	sub	esp, 32					; 00000020H
	mov	DWORD PTR _this$[ebp], ecx
; Line 543
	mov	DWORD PTR _TSS_Ptr$[ebp], 0
; Line 544
	mov	eax, DWORD PTR _Task_ID$[ebp]
	imul	eax, DWORD PTR ?TSSSize@AOATask@@0HA	; AOATask::TSSSize
	mov	ecx, DWORD PTR ?TSSBase@AOATask@@0JA	; AOATask::TSSBase
	add	ecx, eax
	mov	DWORD PTR _TSS_Ptr$[ebp], ecx
; Line 549
	lea	edx, DWORD PTR _temp1$[ebp]
	mov	DWORD PTR _temp_TSSPtr$[ebp], edx
; Line 550
	mov	eax, DWORD PTR ?App1TSSPtr@AOATask@@0JA	; AOATask::App1TSSPtr
	mov	DWORD PTR _temp_TSSPtr$[ebp], eax
; Line 553
	lea	ecx, DWORD PTR _temp2$[ebp]
	mov	DWORD PTR _temp_TaskTSSPtr$[ebp], ecx
; Line 554
	mov	edx, DWORD PTR _TSS_Ptr$[ebp]
	add	edx, 8
	mov	DWORD PTR _TSS_Ptr$[ebp], edx
; Line 555
	mov	eax, DWORD PTR _TSS_Ptr$[ebp]
	mov	DWORD PTR _temp_TaskTSSPtr$[ebp], eax
; Line 558
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1262
$L1263:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L1262:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR ?TSSSize@AOATask@@0HA	; AOATask::TSSSize
	jge	SHORT $L1264
; Line 560
	mov	eax, DWORD PTR _temp_TaskTSSPtr$[ebp]
	mov	ecx, DWORD PTR _temp_TSSPtr$[ebp]
	mov	dl, BYTE PTR [ecx]
	mov	BYTE PTR [eax], dl
	mov	eax, DWORD PTR _temp_TaskTSSPtr$[ebp]
	add	eax, 1
	mov	DWORD PTR _temp_TaskTSSPtr$[ebp], eax
	mov	ecx, DWORD PTR _temp_TSSPtr$[ebp]
	add	ecx, 1
	mov	DWORD PTR _temp_TSSPtr$[ebp], ecx
; Line 561
	jmp	SHORT $L1263
$L1264:
; Line 562
	mov	edx, DWORD PTR _temp_TaskTSSPtr$[ebp]
	sub	edx, DWORD PTR ?TSSSize@AOATask@@0HA	; AOATask::TSSSize
	mov	DWORD PTR _temp_TaskTSSPtr$[ebp], edx
; Line 565
	mov	eax, DWORD PTR _temp_TaskTSSPtr$[ebp]
	add	eax, 32					; 00000020H
	mov	DWORD PTR _tempcp_ptr$[ebp], eax
; Line 566
	mov	ecx, DWORD PTR _tempcp_ptr$[ebp]
	mov	edx, DWORD PTR _Function_Address$[ebp]
	mov	DWORD PTR [ecx], edx
; Line 568
	mov	eax, DWORD PTR _temp_TaskTSSPtr$[ebp]
	add	eax, 56					; 00000038H
	mov	DWORD PTR _tempcp_ptr$[ebp], eax
; Line 569
	mov	ecx, DWORD PTR _tempcp_ptr$[ebp]
	mov	edx, DWORD PTR _StackMEM_Ptr$[ebp]
	mov	DWORD PTR [ecx], edx
; Line 574
	mov	eax, DWORD PTR _ehflag$[ebp]
	push	eax
	mov	ecx, DWORD PTR _Task_ID$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?createTSSDescriptor@AOATask@@AAEHHH@Z	; AOATask::createTSSDescriptor
; Line 576
	xor	eax, eax
; Line 577
	mov	esp, ebp
	pop	ebp
	ret	16					; 00000010H
?AOAcreateTask@AOATask@@QAEHJJHH@Z ENDP			; AOATask::AOAcreateTask
_TEXT	ENDS
PUBLIC	?AOAprintTSS@AOATask@@QAEXHH@Z			; AOATask::AOAprintTSS
EXTRN	?AOAprintHex@AOAProtected@@QAEHJH@Z:NEAR	; AOAProtected::AOAprintHex
_TEXT	SEGMENT
_Task_ID$ = 8
_lineno$ = 12
_this$ = -52
_descl$ = -20
_io$ = -40
_i$ = -32
_j$ = -44
_lcount$ = -16
_linex$ = -48
_temp2$ = -12
_temp1$ = -8
_tempTSSPtr$ = -28
_temp_TaskTSSPtr$ = -4
_TSS_Ptr$ = -24
?AOAprintTSS@AOATask@@QAEXHH@Z PROC NEAR		; AOATask::AOAprintTSS
; Line 583
	push	ebp
	mov	ebp, esp
	sub	esp, 52					; 00000034H
	mov	DWORD PTR _this$[ebp], ecx
; Line 585
	lea	ecx, DWORD PTR _io$[ebp]
	call	??0AOAProtected@@QAE@XZ			; AOAProtected::AOAProtected
; Line 587
	mov	DWORD PTR _lcount$[ebp], 0
; Line 588
	mov	DWORD PTR _linex$[ebp], 0
; Line 592
	lea	eax, DWORD PTR _temp1$[ebp]
	mov	DWORD PTR _tempTSSPtr$[ebp], eax
; Line 596
	mov	ecx, DWORD PTR _Task_ID$[ebp]
	imul	ecx, DWORD PTR ?TSSSize@AOATask@@0HA	; AOATask::TSSSize
	mov	edx, DWORD PTR ?TSSBase@AOATask@@0JA	; AOATask::TSSBase
	add	edx, ecx
	mov	DWORD PTR _TSS_Ptr$[ebp], edx
; Line 599
	lea	eax, DWORD PTR _temp2$[ebp]
	mov	DWORD PTR _temp_TaskTSSPtr$[ebp], eax
; Line 600
	mov	ecx, DWORD PTR _TSS_Ptr$[ebp]
	mov	DWORD PTR _temp_TaskTSSPtr$[ebp], ecx
; Line 601
	mov	edx, DWORD PTR _temp_TaskTSSPtr$[ebp]
	mov	DWORD PTR _tempTSSPtr$[ebp], edx
; Line 602
	mov	eax, DWORD PTR _tempTSSPtr$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _descl$[ebp], ecx
; Line 604
	mov	DWORD PTR _i$[ebp], 0
; Line 605
	mov	DWORD PTR _j$[ebp], 0
; Line 606
	mov	DWORD PTR _lcount$[ebp], 0
; Line 607
	mov	edx, DWORD PTR _lineno$[ebp]
	mov	DWORD PTR _linex$[ebp], edx
; Line 608
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L1288
$L1289:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L1288:
	cmp	DWORD PTR _i$[ebp], 32			; 00000020H
	jge	SHORT $L1290
; Line 610
	mov	ecx, DWORD PTR _j$[ebp]
	imul	ecx, 18					; 00000012H
	mov	edx, DWORD PTR _linex$[ebp]
	add	edx, ecx
	push	edx
	mov	eax, DWORD PTR _descl$[ebp]
	push	eax
	lea	ecx, DWORD PTR _io$[ebp]
	call	?AOAprintHex@AOAProtected@@QAEHJH@Z	; AOAProtected::AOAprintHex
; Line 611
	mov	ecx, DWORD PTR _tempTSSPtr$[ebp]
	add	ecx, 4
	mov	DWORD PTR _tempTSSPtr$[ebp], ecx
; Line 612
	mov	edx, DWORD PTR _j$[ebp]
	add	edx, 1
	mov	DWORD PTR _j$[ebp], edx
; Line 613
	mov	eax, DWORD PTR _lcount$[ebp]
	add	eax, 1
	mov	DWORD PTR _lcount$[ebp], eax
; Line 614
	cmp	DWORD PTR _lcount$[ebp], 8
	jne	SHORT $L1291
; Line 616
	mov	DWORD PTR _lcount$[ebp], 0
; Line 617
	mov	DWORD PTR _j$[ebp], 0
; Line 618
	mov	ecx, DWORD PTR _linex$[ebp]
	add	ecx, 160				; 000000a0H
	mov	DWORD PTR _linex$[ebp], ecx
$L1291:
; Line 620
	mov	edx, DWORD PTR _tempTSSPtr$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR _descl$[ebp], eax
; Line 621
	jmp	SHORT $L1289
$L1290:
; Line 622
	mov	esp, ebp
	pop	ebp
	ret	8
?AOAprintTSS@AOATask@@QAEXHH@Z ENDP			; AOATask::AOAprintTSS
_TEXT	ENDS
END
