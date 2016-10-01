	TITLE	cfiles.c
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
PUBLIC	_CprintStr32
EXTRN	_printstrasm32:NEAR
_TEXT	SEGMENT
_p$ = 8
_len$ = 12
_start$ = 16
_CprintStr32 PROC NEAR
; File cfiles.c
; Line 6
	push	ebp
	mov	ebp, esp
; Line 7
	mov	eax, DWORD PTR _start$[ebp]
	push	eax
	mov	ecx, DWORD PTR _len$[ebp]
	push	ecx
	mov	edx, DWORD PTR _p$[ebp]
	push	edx
	call	_printstrasm32
	add	esp, 12					; 0000000cH
; Line 8
	xor	eax, eax
; Line 9
	pop	ebp
	ret	0
_CprintStr32 ENDP
_TEXT	ENDS
PUBLIC	_CreadRTC
EXTRN	_readrtcasm32:NEAR
_TEXT	SEGMENT
_CreadRTC PROC NEAR
; Line 15
	push	ebp
	mov	ebp, esp
; Line 16
	call	_readrtcasm32
; Line 17
	pop	ebp
	ret	0
_CreadRTC ENDP
_TEXT	ENDS
PUBLIC	_CreadDATE
EXTRN	_readdateasm32:NEAR
_TEXT	SEGMENT
_CreadDATE PROC NEAR
; Line 23
	push	ebp
	mov	ebp, esp
; Line 24
	call	_readdateasm32
; Line 25
	pop	ebp
	ret	0
_CreadDATE ENDP
_TEXT	ENDS
PUBLIC	_CsetIDTEntry32
EXTRN	_setIDTEntryasm32:NEAR
_TEXT	SEGMENT
_desch$ = 8
_descl$ = 12
_appno$ = 16
_CsetIDTEntry32 PROC NEAR
; Line 33
	push	ebp
	mov	ebp, esp
; Line 35
	mov	eax, DWORD PTR _appno$[ebp]
	push	eax
	mov	ecx, DWORD PTR _descl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _desch$[ebp]
	push	edx
	call	_setIDTEntryasm32
	add	esp, 12					; 0000000cH
; Line 36
	pop	ebp
	ret	0
_CsetIDTEntry32 ENDP
_TEXT	ENDS
PUBLIC	_CgetIDTEntry32
EXTRN	_getIDTEntryasm32:NEAR
_TEXT	SEGMENT
_desch$ = 8
_descl$ = 12
_appno$ = 16
_CgetIDTEntry32 PROC NEAR
; Line 43
	push	ebp
	mov	ebp, esp
; Line 44
	mov	eax, DWORD PTR _appno$[ebp]
	push	eax
	mov	ecx, DWORD PTR _descl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _desch$[ebp]
	push	edx
	call	_getIDTEntryasm32
	add	esp, 12					; 0000000cH
; Line 45
	pop	ebp
	ret	0
_CgetIDTEntry32 ENDP
_TEXT	ENDS
PUBLIC	_CsetGDTEntry32
EXTRN	_setGDTEntryasm32:NEAR
_TEXT	SEGMENT
_desch$ = 8
_descl$ = 12
_appno$ = 16
_CsetGDTEntry32 PROC NEAR
; Line 52
	push	ebp
	mov	ebp, esp
; Line 53
	mov	eax, DWORD PTR _appno$[ebp]
	push	eax
	mov	ecx, DWORD PTR _descl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _desch$[ebp]
	push	edx
	call	_setGDTEntryasm32
	add	esp, 12					; 0000000cH
; Line 54
	pop	ebp
	ret	0
_CsetGDTEntry32 ENDP
_TEXT	ENDS
PUBLIC	_CgetGDTEntry32
EXTRN	_getGDTEntryasm32:NEAR
_TEXT	SEGMENT
_desch$ = 8
_descl$ = 12
_appno$ = 16
_CgetGDTEntry32 PROC NEAR
; Line 61
	push	ebp
	mov	ebp, esp
; Line 62
	mov	eax, DWORD PTR _appno$[ebp]
	push	eax
	mov	ecx, DWORD PTR _descl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _desch$[ebp]
	push	edx
	call	_getGDTEntryasm32
	add	esp, 12					; 0000000cH
; Line 63
	pop	ebp
	ret	0
_CgetGDTEntry32 ENDP
_TEXT	ENDS
PUBLIC	_CShortDelay32
EXTRN	_ShortDelay:NEAR
_TEXT	SEGMENT
_Delay$ = 8
_CShortDelay32 PROC NEAR
; Line 70
	push	ebp
	mov	ebp, esp
; Line 71
	mov	eax, DWORD PTR _Delay$[ebp]
	push	eax
	call	_ShortDelay
	add	esp, 4
; Line 72
	pop	ebp
	ret	0
_CShortDelay32 ENDP
_TEXT	ENDS
PUBLIC	_CgetChar32
EXTRN	_getcharasm32:NEAR
_TEXT	SEGMENT
_pos$ = 8
_CgetChar32 PROC NEAR
; Line 79
	push	ebp
	mov	ebp, esp
; Line 80
	mov	eax, DWORD PTR _pos$[ebp]
	push	eax
	call	_getcharasm32
	add	esp, 4
; Line 81
	pop	ebp
	ret	0
_CgetChar32 ENDP
_TEXT	ENDS
PUBLIC	_CprintRegs32
EXTRN	_printregsasm32:NEAR
_TEXT	SEGMENT
_pos$ = 8
_CprintRegs32 PROC NEAR
; Line 88
	push	ebp
	mov	ebp, esp
; Line 89
	mov	eax, DWORD PTR _pos$[ebp]
	push	eax
	call	_printregsasm32
	add	esp, 4
; Line 90
	pop	ebp
	ret	0
_CprintRegs32 ENDP
_TEXT	ENDS
PUBLIC	_CprintStackRegs32
EXTRN	_printstackregsasm32:NEAR
_TEXT	SEGMENT
_pos$ = 8
_CprintStackRegs32 PROC NEAR
; Line 97
	push	ebp
	mov	ebp, esp
; Line 98
	mov	eax, DWORD PTR _pos$[ebp]
	push	eax
	call	_printstackregsasm32
	add	esp, 4
; Line 99
	pop	ebp
	ret	0
_CprintStackRegs32 ENDP
_TEXT	ENDS
PUBLIC	_CsetSharedMem32
EXTRN	_setsharedmemasm32:NEAR
_TEXT	SEGMENT
_index$ = 8
_val$ = 12
_CsetSharedMem32 PROC NEAR
; Line 106
	push	ebp
	mov	ebp, esp
; Line 107
	mov	eax, DWORD PTR _val$[ebp]
	push	eax
	mov	ecx, DWORD PTR _index$[ebp]
	push	ecx
	call	_setsharedmemasm32
	add	esp, 8
; Line 108
	pop	ebp
	ret	0
_CsetSharedMem32 ENDP
_TEXT	ENDS
PUBLIC	_CgetSharedMem32
EXTRN	_getsharedmemasm32:NEAR
_TEXT	SEGMENT
_index$ = 8
_CgetSharedMem32 PROC NEAR
; Line 115
	push	ebp
	mov	ebp, esp
; Line 116
	mov	eax, DWORD PTR _index$[ebp]
	push	eax
	call	_getsharedmemasm32
	add	esp, 4
; Line 117
	pop	ebp
	ret	0
_CgetSharedMem32 ENDP
_TEXT	ENDS
PUBLIC	_CprintChar32
EXTRN	_printcharasm32:NEAR
_TEXT	SEGMENT
_value$ = 8
_start$ = 12
_CprintChar32 PROC NEAR
; Line 122
	push	ebp
	mov	ebp, esp
; Line 123
	mov	eax, DWORD PTR _start$[ebp]
	push	eax
	mov	cl, BYTE PTR _value$[ebp]
	push	ecx
	call	_printcharasm32
	add	esp, 8
; Line 124
	xor	eax, eax
; Line 125
	pop	ebp
	ret	0
_CprintChar32 ENDP
_TEXT	ENDS
PUBLIC	_CcleanScreen32
EXTRN	_cleanscreenasm32:NEAR
_TEXT	SEGMENT
_CcleanScreen32 PROC NEAR
; Line 132
	push	ebp
	mov	ebp, esp
; Line 133
	call	_cleanscreenasm32
; Line 134
	xor	eax, eax
; Line 135
	pop	ebp
	ret	0
_CcleanScreen32 ENDP
_TEXT	ENDS
PUBLIC	_Csti32
EXTRN	_stiasm32:NEAR
_TEXT	SEGMENT
_Csti32	PROC NEAR
; Line 142
	push	ebp
	mov	ebp, esp
; Line 143
	call	_stiasm32
; Line 144
	pop	ebp
	ret	0
_Csti32	ENDP
_TEXT	ENDS
PUBLIC	_Ctest32
EXTRN	_testasm32:NEAR
_TEXT	SEGMENT
_testcase$ = 8
_Ctest32 PROC NEAR
; Line 152
	push	ebp
	mov	ebp, esp
; Line 153
	mov	eax, DWORD PTR _testcase$[ebp]
	push	eax
	call	_testasm32
	add	esp, 4
; Line 154
	pop	ebp
	ret	0
_Ctest32 ENDP
_TEXT	ENDS
PUBLIC	_Ccli32
EXTRN	_cliasm32:NEAR
_TEXT	SEGMENT
_Ccli32	PROC NEAR
; Line 161
	push	ebp
	mov	ebp, esp
; Line 162
	call	_cliasm32
; Line 163
	pop	ebp
	ret	0
_Ccli32	ENDP
_TEXT	ENDS
PUBLIC	_CenableIRQCntlr32
EXTRN	_enableIRQCntlrasm32:NEAR
_TEXT	SEGMENT
_port$ = 8
_mask$ = 12
_CenableIRQCntlr32 PROC NEAR
; Line 170
	push	ebp
	mov	ebp, esp
; Line 171
	cmp	DWORD PTR _port$[ebp], 1
	jne	SHORT $L608
; Line 173
	mov	ax, WORD PTR _mask$[ebp]
	push	eax
	push	33					; 00000021H
	call	_enableIRQCntlrasm32
	add	esp, 8
	jmp	SHORT $L611
$L608:
; Line 175
	cmp	DWORD PTR _port$[ebp], 2
	jne	SHORT $L610
; Line 177
	mov	cx, WORD PTR _mask$[ebp]
	push	ecx
	push	161					; 000000a1H
	call	_enableIRQCntlrasm32
	add	esp, 8
	jmp	SHORT $L611
$L610:
; Line 180
	or	eax, -1
$L611:
; Line 181
	pop	ebp
	ret	0
_CenableIRQCntlr32 ENDP
_TEXT	ENDS
PUBLIC	_CdisableIRQCntlr32
EXTRN	_disableIRQCntlrasm32:NEAR
_TEXT	SEGMENT
_port$ = 8
_mask$ = 12
_CdisableIRQCntlr32 PROC NEAR
; Line 188
	push	ebp
	mov	ebp, esp
; Line 189
	cmp	DWORD PTR _port$[ebp], 1
	jne	SHORT $L623
; Line 191
	mov	ax, WORD PTR _mask$[ebp]
	push	eax
	push	33					; 00000021H
	call	_disableIRQCntlrasm32
	add	esp, 8
	jmp	SHORT $L626
$L623:
; Line 193
	cmp	DWORD PTR _port$[ebp], 2
	jne	SHORT $L625
; Line 195
	mov	cx, WORD PTR _mask$[ebp]
	push	ecx
	push	161					; 000000a1H
	call	_disableIRQCntlrasm32
	add	esp, 8
	jmp	SHORT $L626
$L625:
; Line 198
	or	eax, -1
$L626:
; Line 199
	pop	ebp
	ret	0
_CdisableIRQCntlr32 ENDP
_TEXT	ENDS
PUBLIC	_CackPICCntlr32
EXTRN	_ackPICCntlrasm32:NEAR
_TEXT	SEGMENT
_port$ = 8
_CackPICCntlr32 PROC NEAR
; Line 206
	push	ebp
	mov	ebp, esp
; Line 207
	cmp	DWORD PTR _port$[ebp], 1
	jne	SHORT $L636
; Line 209
	push	32					; 00000020H
	push	32					; 00000020H
	call	_ackPICCntlrasm32
	add	esp, 8
	jmp	SHORT $L639
$L636:
; Line 211
	cmp	DWORD PTR _port$[ebp], 2
	jne	SHORT $L638
; Line 215
	push	32					; 00000020H
	push	160					; 000000a0H
	call	_ackPICCntlrasm32
	add	esp, 8
; Line 216
	push	32					; 00000020H
	push	32					; 00000020H
	call	_ackPICCntlrasm32
	add	esp, 8
	jmp	SHORT $L639
$L638:
; Line 219
	or	eax, -1
$L639:
; Line 220
	pop	ebp
	ret	0
_CackPICCntlr32 ENDP
_TEXT	ENDS
PUBLIC	_CreadIntStatusRegister32
EXTRN	_readintstatusregisterasm32:NEAR
_TEXT	SEGMENT
_port$ = 8
_addr$ = -4
_CreadIntStatusRegister32 PROC NEAR
; Line 229
	push	ebp
	mov	ebp, esp
	push	ecx
; Line 230
	mov	DWORD PTR _addr$[ebp], 0
; Line 232
	cmp	DWORD PTR _port$[ebp], 1
	jne	SHORT $L648
; Line 234
	mov	DWORD PTR _addr$[ebp], 32		; 00000020H
; Line 235
	mov	eax, DWORD PTR _addr$[ebp]
	push	eax
	call	_readintstatusregisterasm32
	add	esp, 4
	jmp	SHORT $L646
$L648:
; Line 238
	cmp	DWORD PTR _port$[ebp], 2
	jne	SHORT $L650
; Line 240
	mov	DWORD PTR _addr$[ebp], 160		; 000000a0H
; Line 241
	mov	ecx, DWORD PTR _addr$[ebp]
	push	ecx
	call	_readintstatusregisterasm32
	add	esp, 4
	jmp	SHORT $L646
$L650:
; Line 243
	or	eax, -1
$L646:
; Line 244
	mov	esp, ebp
	pop	ebp
	ret	0
_CreadIntStatusRegister32 ENDP
_TEXT	ENDS
PUBLIC	_CreadIntMaskRegister32
EXTRN	_readintmaskregisterasm32:NEAR
_TEXT	SEGMENT
_port$ = 8
_addr$ = -4
_CreadIntMaskRegister32 PROC NEAR
; Line 253
	push	ebp
	mov	ebp, esp
	push	ecx
; Line 254
	mov	DWORD PTR _addr$[ebp], 0
; Line 256
	cmp	DWORD PTR _port$[ebp], 1
	jne	SHORT $L659
; Line 258
	mov	DWORD PTR _addr$[ebp], 33		; 00000021H
; Line 259
	mov	eax, DWORD PTR _addr$[ebp]
	push	eax
	call	_readintmaskregisterasm32
	add	esp, 4
	jmp	SHORT $L657
$L659:
; Line 262
	cmp	DWORD PTR _port$[ebp], 2
	jne	SHORT $L661
; Line 264
	mov	DWORD PTR _addr$[ebp], 161		; 000000a1H
; Line 265
	mov	ecx, DWORD PTR _addr$[ebp]
	push	ecx
	call	_readintmaskregisterasm32
	add	esp, 4
	jmp	SHORT $L657
$L661:
; Line 267
	or	eax, -1
$L657:
; Line 268
	mov	esp, ebp
	pop	ebp
	ret	0
_CreadIntMaskRegister32 ENDP
_TEXT	ENDS
PUBLIC	_CintTimer32
EXTRN	_inttimerasm32:NEAR
_TEXT	SEGMENT
_CintTimer32 PROC NEAR
; Line 275
	push	ebp
	mov	ebp, esp
; Line 276
	call	_inttimerasm32
; Line 277
	pop	ebp
	ret	0
_CintTimer32 ENDP
_TEXT	ENDS
PUBLIC	_CstiTimer32
EXTRN	_stiTimerasm32:NEAR
_TEXT	SEGMENT
_CstiTimer32 PROC NEAR
; Line 284
	push	ebp
	mov	ebp, esp
; Line 285
	call	_stiTimerasm32
; Line 286
	pop	ebp
	ret	0
_CstiTimer32 ENDP
_TEXT	ENDS
PUBLIC	_CcliTimer32
EXTRN	_cliTimerasm32:NEAR
_TEXT	SEGMENT
_CcliTimer32 PROC NEAR
; Line 293
	push	ebp
	mov	ebp, esp
; Line 294
	call	_cliTimerasm32
; Line 295
	pop	ebp
	ret	0
_CcliTimer32 ENDP
_TEXT	ENDS
PUBLIC	_CgetStr32
EXTRN	_getstrasm32:NEAR
_TEXT	SEGMENT
_str$ = 8
_CgetStr32 PROC NEAR
; Line 302
	push	ebp
	mov	ebp, esp
; Line 303
	mov	eax, DWORD PTR _str$[ebp]
	push	eax
	call	_getstrasm32
	add	esp, 4
; Line 304
	pop	ebp
	ret	0
_CgetStr32 ENDP
_TEXT	ENDS
PUBLIC	_CgetCursor32
EXTRN	_getcursorasm32:NEAR
_TEXT	SEGMENT
_CgetCursor32 PROC NEAR
; Line 311
	push	ebp
	mov	ebp, esp
; Line 312
	call	_getcursorasm32
; Line 313
	pop	ebp
	ret	0
_CgetCursor32 ENDP
_TEXT	ENDS
PUBLIC	_CgetTimer32
EXTRN	_gettimerasm32:NEAR
_TEXT	SEGMENT
_CgetTimer32 PROC NEAR
; Line 320
	push	ebp
	mov	ebp, esp
; Line 321
	call	_gettimerasm32
; Line 322
	pop	ebp
	ret	0
_CgetTimer32 ENDP
_TEXT	ENDS
PUBLIC	_CsetCursor32
EXTRN	_setcursorasm32:NEAR
_TEXT	SEGMENT
_pos$ = 8
_CsetCursor32 PROC NEAR
; Line 329
	push	ebp
	mov	ebp, esp
; Line 330
	mov	eax, DWORD PTR _pos$[ebp]
	push	eax
	call	_setcursorasm32
	add	esp, 4
; Line 331
	xor	eax, eax
; Line 332
	pop	ebp
	ret	0
_CsetCursor32 ENDP
_TEXT	ENDS
PUBLIC	_CscrollUp32
EXTRN	_scrollasm32:NEAR
_TEXT	SEGMENT
_CscrollUp32 PROC NEAR
; Line 339
	push	ebp
	mov	ebp, esp
; Line 340
	call	_scrollasm32
; Line 341
	xor	eax, eax
; Line 342
	pop	ebp
	ret	0
_CscrollUp32 ENDP
_TEXT	ENDS
PUBLIC	_CnewLine32
_TEXT	SEGMENT
_pos$ = -12
_line$ = -4
_space$ = -8
_CnewLine32 PROC NEAR
; Line 353
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
; Line 357
	call	_CgetCursor32
	mov	DWORD PTR _pos$[ebp], eax
; Line 359
	mov	eax, DWORD PTR _pos$[ebp]
	add	eax, 1
	mov	DWORD PTR _pos$[ebp], eax
; Line 360
	mov	eax, DWORD PTR _pos$[ebp]
	cdq
	mov	ecx, 80					; 00000050H
	idiv	ecx
	mov	DWORD PTR _line$[ebp], eax
; Line 361
	mov	eax, DWORD PTR _pos$[ebp]
	cdq
	mov	ecx, 80					; 00000050H
	idiv	ecx
	mov	DWORD PTR _space$[ebp], edx
; Line 362
	mov	edx, DWORD PTR _line$[ebp]
	add	edx, 1
	mov	DWORD PTR _line$[ebp], edx
; Line 364
	cmp	DWORD PTR _line$[ebp], 50		; 00000032H
	jle	SHORT $L701
; Line 366
	call	_CscrollUp32
; Line 367
	mov	DWORD PTR _pos$[ebp], 3919		; 00000f4fH
; Line 368
	mov	eax, DWORD PTR _pos$[ebp]
	push	eax
	call	_CsetCursor32
	add	esp, 4
	jmp	SHORT $L697
$L701:
; Line 371
	mov	ecx, DWORD PTR _line$[ebp]
	imul	ecx, 80					; 00000050H
	mov	DWORD PTR _line$[ebp], ecx
; Line 372
	mov	edx, DWORD PTR _line$[ebp]
	push	edx
	call	_CsetCursor32
	add	esp, 4
$L697:
; Line 373
	mov	esp, ebp
	pop	ebp
	ret	0
_CnewLine32 ENDP
_TEXT	ENDS
PUBLIC	_CprintDec32
_TEXT	SEGMENT
_value$ = 8
_pos$ = 12
_output$ = -36
_k$ = -28
_num$ = -32
_base$ = -40
_temp$ = -24
_disp$ = -4
_CprintDec32 PROC NEAR
; Line 377
	push	ebp
	mov	ebp, esp
	sub	esp, 40					; 00000028H
; Line 379
	mov	DWORD PTR _num$[ebp], 1
	mov	DWORD PTR _base$[ebp], 1
; Line 380
	mov	eax, DWORD PTR _value$[ebp]
	cdq
	mov	ecx, 10					; 0000000aH
	idiv	ecx
	mov	DWORD PTR _temp$[ebp], eax
$L715:
; Line 384
	cmp	DWORD PTR _temp$[ebp], 1
	jl	SHORT $L716
; Line 386
	mov	edx, DWORD PTR _num$[ebp]
	add	edx, 1
	mov	DWORD PTR _num$[ebp], edx
; Line 387
	mov	eax, DWORD PTR _base$[ebp]
	imul	eax, 10					; 0000000aH
	mov	DWORD PTR _base$[ebp], eax
; Line 388
	mov	eax, DWORD PTR _temp$[ebp]
	cdq
	mov	ecx, 10					; 0000000aH
	idiv	ecx
	mov	DWORD PTR _temp$[ebp], eax
; Line 389
	jmp	SHORT $L715
$L716:
; Line 391
	mov	DWORD PTR _k$[ebp], 0
	jmp	SHORT $L717
$L718:
	mov	edx, DWORD PTR _k$[ebp]
	add	edx, 1
	mov	DWORD PTR _k$[ebp], edx
$L717:
	mov	eax, DWORD PTR _k$[ebp]
	cmp	eax, DWORD PTR _num$[ebp]
	jge	SHORT $L719
; Line 393
	mov	eax, DWORD PTR _value$[ebp]
	cdq
	idiv	DWORD PTR _base$[ebp]
	mov	DWORD PTR _output$[ebp], eax
; Line 394
	movsx	ecx, BYTE PTR _output$[ebp]
	add	ecx, 48					; 00000030H
	mov	BYTE PTR _disp$[ebp], cl
; Line 395
	mov	edx, DWORD PTR _pos$[ebp]
	push	edx
	mov	al, BYTE PTR _disp$[ebp]
	push	eax
	call	_printcharasm32
	add	esp, 8
; Line 396
	mov	ecx, DWORD PTR _pos$[ebp]
	add	ecx, 2
	mov	DWORD PTR _pos$[ebp], ecx
; Line 397
	mov	eax, DWORD PTR _value$[ebp]
	cdq
	idiv	DWORD PTR _base$[ebp]
	mov	DWORD PTR _value$[ebp], edx
; Line 398
	mov	eax, DWORD PTR _base$[ebp]
	cdq
	mov	ecx, 10					; 0000000aH
	idiv	ecx
	mov	DWORD PTR _base$[ebp], eax
; Line 399
	jmp	SHORT $L718
$L719:
; Line 401
	xor	eax, eax
; Line 402
	mov	esp, ebp
	pop	ebp
	ret	0
_CprintDec32 ENDP
_TEXT	ENDS
PUBLIC	_CclearNTFlag
EXTRN	_clearntflagasm32:NEAR
_TEXT	SEGMENT
_CclearNTFlag PROC NEAR
; Line 408
	push	ebp
	mov	ebp, esp
; Line 409
	call	_clearntflagasm32
; Line 410
	xor	eax, eax
; Line 411
	pop	ebp
	ret	0
_CclearNTFlag ENDP
_TEXT	ENDS
PUBLIC	_CprintFlags32
EXTRN	_printflagsasm32:NEAR
_TEXT	SEGMENT
_start$ = 8
_CprintFlags32 PROC NEAR
; Line 416
	push	ebp
	mov	ebp, esp
; Line 417
	mov	eax, DWORD PTR _start$[ebp]
	push	eax
	call	_printflagsasm32
	add	esp, 4
; Line 418
	xor	eax, eax
; Line 419
	pop	ebp
	ret	0
_CprintFlags32 ENDP
_TEXT	ENDS
PUBLIC	_CgetSharedMemChar32
EXTRN	_getsharedmemcharasm32:NEAR
_TEXT	SEGMENT
_index$ = 8
_base$ = 12
_CgetSharedMemChar32 PROC NEAR
; Line 426
	push	ebp
	mov	ebp, esp
; Line 427
	mov	eax, DWORD PTR _base$[ebp]
	push	eax
	mov	ecx, DWORD PTR _index$[ebp]
	push	ecx
	call	_getsharedmemcharasm32
	add	esp, 8
; Line 428
	pop	ebp
	ret	0
_CgetSharedMemChar32 ENDP
_TEXT	ENDS
PUBLIC	_CresetLock32
EXTRN	_resetlockasm32:NEAR
_TEXT	SEGMENT
_lock$ = 8
_tid$ = 12
_CresetLock32 PROC NEAR
; Line 435
	push	ebp
	mov	ebp, esp
; Line 436
	mov	eax, DWORD PTR _tid$[ebp]
	push	eax
	mov	ecx, DWORD PTR _lock$[ebp]
	push	ecx
	call	_resetlockasm32
	add	esp, 8
; Line 437
	pop	ebp
	ret	0
_CresetLock32 ENDP
_TEXT	ENDS
PUBLIC	_CtestAndSet32
EXTRN	_testandsetasm32:NEAR
_TEXT	SEGMENT
_lock$ = 8
_tid$ = 12
_CtestAndSet32 PROC NEAR
; Line 444
	push	ebp
	mov	ebp, esp
; Line 445
	mov	eax, DWORD PTR _tid$[ebp]
	push	eax
	mov	ecx, DWORD PTR _lock$[ebp]
	push	ecx
	call	_testandsetasm32
	add	esp, 8
; Line 446
	pop	ebp
	ret	0
_CtestAndSet32 ENDP
_TEXT	ENDS
PUBLIC	_CsetSharedMemChar32
EXTRN	_setsharedmemcharasm32:NEAR
_TEXT	SEGMENT
_index$ = 8
_c$ = 12
_base$ = 16
_CsetSharedMemChar32 PROC NEAR
; Line 453
	push	ebp
	mov	ebp, esp
; Line 454
	mov	eax, DWORD PTR _base$[ebp]
	push	eax
	mov	cl, BYTE PTR _c$[ebp]
	push	ecx
	mov	edx, DWORD PTR _index$[ebp]
	push	edx
	call	_setsharedmemcharasm32
	add	esp, 12					; 0000000cH
; Line 455
	pop	ebp
	ret	0
_CsetSharedMemChar32 ENDP
_TEXT	ENDS
PUBLIC	_CgetMem32
EXTRN	_getmemasm32:NEAR
_TEXT	SEGMENT
_addr$ = 8
_CgetMem32 PROC NEAR
; Line 465
	push	ebp
	mov	ebp, esp
; Line 466
	mov	eax, DWORD PTR _addr$[ebp]
	push	eax
	call	_getmemasm32
	add	esp, 4
; Line 467
	pop	ebp
	ret	0
_CgetMem32 ENDP
_TEXT	ENDS
PUBLIC	_CsetMem32
EXTRN	_setmemasm32:NEAR
_TEXT	SEGMENT
_addr$ = 8
_data$ = 12
_CsetMem32 PROC NEAR
; Line 470
	push	ebp
	mov	ebp, esp
; Line 471
	mov	eax, DWORD PTR _data$[ebp]
	push	eax
	mov	ecx, DWORD PTR _addr$[ebp]
	push	ecx
	call	_setmemasm32
	add	esp, 8
; Line 472
	pop	ebp
	ret	0
_CsetMem32 ENDP
_TEXT	ENDS
PUBLIC	_CgetRealMemory
EXTRN	_getrealmemory:NEAR
_TEXT	SEGMENT
_addr$ = 8
_CgetRealMemory PROC NEAR
; Line 475
	push	ebp
	mov	ebp, esp
; Line 476
	mov	eax, DWORD PTR _addr$[ebp]
	push	eax
	call	_getrealmemory
	add	esp, 4
; Line 477
	pop	ebp
	ret	0
_CgetRealMemory ENDP
_TEXT	ENDS
PUBLIC	_CgetStackPOP32
EXTRN	_getstackpopasm32:NEAR
_TEXT	SEGMENT
_index$ = 8
_CgetStackPOP32 PROC NEAR
; Line 484
	push	ebp
	mov	ebp, esp
; Line 485
	mov	eax, DWORD PTR _index$[ebp]
	push	eax
	call	_getstackpopasm32
	add	esp, 4
; Line 486
	pop	ebp
	ret	0
_CgetStackPOP32 ENDP
_TEXT	ENDS
PUBLIC	_CgetCharInt32
EXTRN	_getcharintasm32:NEAR
_TEXT	SEGMENT
_CgetCharInt32 PROC NEAR
; Line 493
	push	ebp
	mov	ebp, esp
; Line 494
	call	_getcharintasm32
; Line 495
	pop	ebp
	ret	0
_CgetCharInt32 ENDP
_TEXT	ENDS
PUBLIC	_CgetCharBuff32
EXTRN	_getcharbuffasm32:NEAR
_TEXT	SEGMENT
_CgetCharBuff32 PROC NEAR
; Line 502
	push	ebp
	mov	ebp, esp
; Line 503
	call	_getcharbuffasm32
; Line 504
	pop	ebp
	ret	0
_CgetCharBuff32 ENDP
_TEXT	ENDS
PUBLIC	_CreadFloppy32
EXTRN	_readfloppyasm32:NEAR
_TEXT	SEGMENT
_buff$ = 8
_sectorno$ = 12
_CreadFloppy32 PROC NEAR
; Line 513
	push	ebp
	mov	ebp, esp
; Line 514
	mov	eax, DWORD PTR _sectorno$[ebp]
	push	eax
	mov	ecx, DWORD PTR _buff$[ebp]
	push	ecx
	call	_readfloppyasm32
	add	esp, 8
; Line 515
	xor	eax, eax
; Line 516
	pop	ebp
	ret	0
_CreadFloppy32 ENDP
_TEXT	ENDS
PUBLIC	_CwriteFloppy32
EXTRN	_writefloppyasm32:NEAR
_TEXT	SEGMENT
_buff$ = 8
_sectorno$ = 12
_CwriteFloppy32 PROC NEAR
; Line 525
	push	ebp
	mov	ebp, esp
; Line 526
	mov	eax, DWORD PTR _sectorno$[ebp]
	push	eax
	mov	ecx, DWORD PTR _buff$[ebp]
	push	ecx
	call	_writefloppyasm32
	add	esp, 8
; Line 527
	xor	eax, eax
; Line 528
	pop	ebp
	ret	0
_CwriteFloppy32 ENDP
_TEXT	ENDS
END
