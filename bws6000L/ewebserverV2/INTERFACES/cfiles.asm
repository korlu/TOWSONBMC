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
; Line 53
	push	ebp
	mov	ebp, esp
; Line 54
	mov	eax, DWORD PTR _appno$[ebp]
	push	eax
	mov	ecx, DWORD PTR _descl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _desch$[ebp]
	push	edx
	call	_setGDTEntryasm32
	add	esp, 12					; 0000000cH
; Line 55
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
; Line 62
	push	ebp
	mov	ebp, esp
; Line 63
	mov	eax, DWORD PTR _appno$[ebp]
	push	eax
	mov	ecx, DWORD PTR _descl$[ebp]
	push	ecx
	mov	edx, DWORD PTR _desch$[ebp]
	push	edx
	call	_getGDTEntryasm32
	add	esp, 12					; 0000000cH
; Line 64
	pop	ebp
	ret	0
_CgetGDTEntry32 ENDP
_TEXT	ENDS
PUBLIC	_CShortDelay32
EXTRN	_ShortDelay:NEAR
_TEXT	SEGMENT
_Delay$ = 8
_CShortDelay32 PROC NEAR
; Line 71
	push	ebp
	mov	ebp, esp
; Line 72
	mov	eax, DWORD PTR _Delay$[ebp]
	push	eax
	call	_ShortDelay
	add	esp, 4
; Line 73
	pop	ebp
	ret	0
_CShortDelay32 ENDP
_TEXT	ENDS
PUBLIC	_CgetChar32
EXTRN	_getcharasm32:NEAR
_TEXT	SEGMENT
_pos$ = 8
_CgetChar32 PROC NEAR
; Line 80
	push	ebp
	mov	ebp, esp
; Line 81
	mov	eax, DWORD PTR _pos$[ebp]
	push	eax
	call	_getcharasm32
	add	esp, 4
; Line 82
	pop	ebp
	ret	0
_CgetChar32 ENDP
_TEXT	ENDS
PUBLIC	_CprintRegs32
EXTRN	_printregsasm32:NEAR
_TEXT	SEGMENT
_pos$ = 8
_CprintRegs32 PROC NEAR
; Line 89
	push	ebp
	mov	ebp, esp
; Line 90
	mov	eax, DWORD PTR _pos$[ebp]
	push	eax
	call	_printregsasm32
	add	esp, 4
; Line 91
	pop	ebp
	ret	0
_CprintRegs32 ENDP
_TEXT	ENDS
PUBLIC	_CprintStackRegs32
EXTRN	_printstackregsasm32:NEAR
_TEXT	SEGMENT
_pos$ = 8
_CprintStackRegs32 PROC NEAR
; Line 98
	push	ebp
	mov	ebp, esp
; Line 99
	mov	eax, DWORD PTR _pos$[ebp]
	push	eax
	call	_printstackregsasm32
	add	esp, 4
; Line 100
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
; Line 107
	push	ebp
	mov	ebp, esp
; Line 108
	mov	eax, DWORD PTR _val$[ebp]
	push	eax
	mov	ecx, DWORD PTR _index$[ebp]
	push	ecx
	call	_setsharedmemasm32
	add	esp, 8
; Line 109
	pop	ebp
	ret	0
_CsetSharedMem32 ENDP
_TEXT	ENDS
PUBLIC	_CgetSharedMem32
EXTRN	_getsharedmemasm32:NEAR
_TEXT	SEGMENT
_index$ = 8
_CgetSharedMem32 PROC NEAR
; Line 116
	push	ebp
	mov	ebp, esp
; Line 117
	mov	eax, DWORD PTR _index$[ebp]
	push	eax
	call	_getsharedmemasm32
	add	esp, 4
; Line 118
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
; Line 123
	push	ebp
	mov	ebp, esp
; Line 124
	mov	eax, DWORD PTR _start$[ebp]
	push	eax
	mov	cl, BYTE PTR _value$[ebp]
	push	ecx
	call	_printcharasm32
	add	esp, 8
; Line 125
	xor	eax, eax
; Line 126
	pop	ebp
	ret	0
_CprintChar32 ENDP
_TEXT	ENDS
PUBLIC	_CcleanScreen32
EXTRN	_cleanscreenasm32:NEAR
_TEXT	SEGMENT
_CcleanScreen32 PROC NEAR
; Line 133
	push	ebp
	mov	ebp, esp
; Line 134
	call	_cleanscreenasm32
; Line 135
	xor	eax, eax
; Line 136
	pop	ebp
	ret	0
_CcleanScreen32 ENDP
_TEXT	ENDS
PUBLIC	_Csti32
EXTRN	_stiasm32:NEAR
_TEXT	SEGMENT
_Csti32	PROC NEAR
; Line 143
	push	ebp
	mov	ebp, esp
; Line 144
	call	_stiasm32
; Line 145
	pop	ebp
	ret	0
_Csti32	ENDP
_TEXT	ENDS
PUBLIC	_Ctest32
EXTRN	_testasm32:NEAR
_TEXT	SEGMENT
_testcase$ = 8
_Ctest32 PROC NEAR
; Line 153
	push	ebp
	mov	ebp, esp
; Line 154
	mov	eax, DWORD PTR _testcase$[ebp]
	push	eax
	call	_testasm32
	add	esp, 4
; Line 155
	pop	ebp
	ret	0
_Ctest32 ENDP
_TEXT	ENDS
PUBLIC	_Ccli32
EXTRN	_cliasm32:NEAR
_TEXT	SEGMENT
_Ccli32	PROC NEAR
; Line 162
	push	ebp
	mov	ebp, esp
; Line 163
	call	_cliasm32
; Line 164
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
; Line 171
	push	ebp
	mov	ebp, esp
; Line 172
	cmp	DWORD PTR _port$[ebp], 1
	jne	SHORT $L608
; Line 174
	mov	ax, WORD PTR _mask$[ebp]
	push	eax
	push	33					; 00000021H
	call	_enableIRQCntlrasm32
	add	esp, 8
	jmp	SHORT $L611
$L608:
; Line 176
	cmp	DWORD PTR _port$[ebp], 2
	jne	SHORT $L610
; Line 178
	mov	cx, WORD PTR _mask$[ebp]
	push	ecx
	push	161					; 000000a1H
	call	_enableIRQCntlrasm32
	add	esp, 8
	jmp	SHORT $L611
$L610:
; Line 181
	or	eax, -1
$L611:
; Line 182
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
; Line 189
	push	ebp
	mov	ebp, esp
; Line 190
	cmp	DWORD PTR _port$[ebp], 1
	jne	SHORT $L623
; Line 192
	mov	ax, WORD PTR _mask$[ebp]
	push	eax
	push	33					; 00000021H
	call	_disableIRQCntlrasm32
	add	esp, 8
	jmp	SHORT $L626
$L623:
; Line 194
	cmp	DWORD PTR _port$[ebp], 2
	jne	SHORT $L625
; Line 196
	mov	cx, WORD PTR _mask$[ebp]
	push	ecx
	push	161					; 000000a1H
	call	_disableIRQCntlrasm32
	add	esp, 8
	jmp	SHORT $L626
$L625:
; Line 199
	or	eax, -1
$L626:
; Line 200
	pop	ebp
	ret	0
_CdisableIRQCntlr32 ENDP
_TEXT	ENDS
PUBLIC	_CackPICCntlr32
EXTRN	_ackPICCntlrasm32:NEAR
_TEXT	SEGMENT
_port$ = 8
_CackPICCntlr32 PROC NEAR
; Line 207
	push	ebp
	mov	ebp, esp
; Line 208
	cmp	DWORD PTR _port$[ebp], 1
	jne	SHORT $L636
; Line 210
	push	32					; 00000020H
	push	32					; 00000020H
	call	_ackPICCntlrasm32
	add	esp, 8
	jmp	SHORT $L639
$L636:
; Line 212
	cmp	DWORD PTR _port$[ebp], 2
	jne	SHORT $L638
; Line 216
	push	32					; 00000020H
	push	160					; 000000a0H
	call	_ackPICCntlrasm32
	add	esp, 8
; Line 217
	push	32					; 00000020H
	push	32					; 00000020H
	call	_ackPICCntlrasm32
	add	esp, 8
	jmp	SHORT $L639
$L638:
; Line 220
	or	eax, -1
$L639:
; Line 221
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
; Line 230
	push	ebp
	mov	ebp, esp
	push	ecx
; Line 231
	mov	DWORD PTR _addr$[ebp], 0
; Line 233
	cmp	DWORD PTR _port$[ebp], 1
	jne	SHORT $L648
; Line 235
	mov	DWORD PTR _addr$[ebp], 32		; 00000020H
; Line 236
	mov	eax, DWORD PTR _addr$[ebp]
	push	eax
	call	_readintstatusregisterasm32
	add	esp, 4
	jmp	SHORT $L646
$L648:
; Line 239
	cmp	DWORD PTR _port$[ebp], 2
	jne	SHORT $L650
; Line 241
	mov	DWORD PTR _addr$[ebp], 160		; 000000a0H
; Line 242
	mov	ecx, DWORD PTR _addr$[ebp]
	push	ecx
	call	_readintstatusregisterasm32
	add	esp, 4
	jmp	SHORT $L646
$L650:
; Line 244
	or	eax, -1
$L646:
; Line 245
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
; Line 254
	push	ebp
	mov	ebp, esp
	push	ecx
; Line 255
	mov	DWORD PTR _addr$[ebp], 0
; Line 257
	cmp	DWORD PTR _port$[ebp], 1
	jne	SHORT $L659
; Line 259
	mov	DWORD PTR _addr$[ebp], 33		; 00000021H
; Line 260
	mov	eax, DWORD PTR _addr$[ebp]
	push	eax
	call	_readintmaskregisterasm32
	add	esp, 4
	jmp	SHORT $L657
$L659:
; Line 263
	cmp	DWORD PTR _port$[ebp], 2
	jne	SHORT $L661
; Line 265
	mov	DWORD PTR _addr$[ebp], 161		; 000000a1H
; Line 266
	mov	ecx, DWORD PTR _addr$[ebp]
	push	ecx
	call	_readintmaskregisterasm32
	add	esp, 4
	jmp	SHORT $L657
$L661:
; Line 268
	or	eax, -1
$L657:
; Line 269
	mov	esp, ebp
	pop	ebp
	ret	0
_CreadIntMaskRegister32 ENDP
_TEXT	ENDS
PUBLIC	_CintTimer32
EXTRN	_inttimerasm32:NEAR
_TEXT	SEGMENT
_CintTimer32 PROC NEAR
; Line 276
	push	ebp
	mov	ebp, esp
; Line 277
	call	_inttimerasm32
; Line 278
	pop	ebp
	ret	0
_CintTimer32 ENDP
_TEXT	ENDS
PUBLIC	_CstiTimer32
EXTRN	_stiTimerasm32:NEAR
_TEXT	SEGMENT
_CstiTimer32 PROC NEAR
; Line 285
	push	ebp
	mov	ebp, esp
; Line 286
	call	_stiTimerasm32
; Line 287
	pop	ebp
	ret	0
_CstiTimer32 ENDP
_TEXT	ENDS
PUBLIC	_CcliTimer32
EXTRN	_cliTimerasm32:NEAR
_TEXT	SEGMENT
_CcliTimer32 PROC NEAR
; Line 294
	push	ebp
	mov	ebp, esp
; Line 295
	call	_cliTimerasm32
; Line 296
	pop	ebp
	ret	0
_CcliTimer32 ENDP
_TEXT	ENDS
PUBLIC	_CgetStr32
EXTRN	_getstrasm32:NEAR
_TEXT	SEGMENT
_str$ = 8
_CgetStr32 PROC NEAR
; Line 303
	push	ebp
	mov	ebp, esp
; Line 304
	mov	eax, DWORD PTR _str$[ebp]
	push	eax
	call	_getstrasm32
	add	esp, 4
; Line 305
	pop	ebp
	ret	0
_CgetStr32 ENDP
_TEXT	ENDS
PUBLIC	_CgetCursor32
EXTRN	_getcursorasm32:NEAR
_TEXT	SEGMENT
_CgetCursor32 PROC NEAR
; Line 312
	push	ebp
	mov	ebp, esp
; Line 313
	call	_getcursorasm32
; Line 314
	pop	ebp
	ret	0
_CgetCursor32 ENDP
_TEXT	ENDS
PUBLIC	_CgetTimer32
EXTRN	_gettimerasm32:NEAR
_TEXT	SEGMENT
_CgetTimer32 PROC NEAR
; Line 321
	push	ebp
	mov	ebp, esp
; Line 322
	call	_gettimerasm32
; Line 323
	pop	ebp
	ret	0
_CgetTimer32 ENDP
_TEXT	ENDS
PUBLIC	_CsetCursor32
EXTRN	_setcursorasm32:NEAR
_TEXT	SEGMENT
_pos$ = 8
_CsetCursor32 PROC NEAR
; Line 330
	push	ebp
	mov	ebp, esp
; Line 331
	mov	eax, DWORD PTR _pos$[ebp]
	push	eax
	call	_setcursorasm32
	add	esp, 4
; Line 332
	xor	eax, eax
; Line 333
	pop	ebp
	ret	0
_CsetCursor32 ENDP
_TEXT	ENDS
PUBLIC	_CscrollUp32
EXTRN	_scrollasm32:NEAR
_TEXT	SEGMENT
_CscrollUp32 PROC NEAR
; Line 340
	push	ebp
	mov	ebp, esp
; Line 341
	call	_scrollasm32
; Line 342
	xor	eax, eax
; Line 343
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
; Line 354
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
; Line 358
	call	_CgetCursor32
	mov	DWORD PTR _pos$[ebp], eax
; Line 360
	mov	eax, DWORD PTR _pos$[ebp]
	add	eax, 1
	mov	DWORD PTR _pos$[ebp], eax
; Line 361
	mov	eax, DWORD PTR _pos$[ebp]
	cdq
	mov	ecx, 80					; 00000050H
	idiv	ecx
	mov	DWORD PTR _line$[ebp], eax
; Line 362
	mov	eax, DWORD PTR _pos$[ebp]
	cdq
	mov	ecx, 80					; 00000050H
	idiv	ecx
	mov	DWORD PTR _space$[ebp], edx
; Line 363
	mov	edx, DWORD PTR _line$[ebp]
	add	edx, 1
	mov	DWORD PTR _line$[ebp], edx
; Line 365
	cmp	DWORD PTR _line$[ebp], 50		; 00000032H
	jle	SHORT $L701
; Line 367
	call	_CscrollUp32
; Line 368
	mov	DWORD PTR _pos$[ebp], 3919		; 00000f4fH
; Line 369
	mov	eax, DWORD PTR _pos$[ebp]
	push	eax
	call	_CsetCursor32
	add	esp, 4
	jmp	SHORT $L697
$L701:
; Line 372
	mov	ecx, DWORD PTR _line$[ebp]
	imul	ecx, 80					; 00000050H
	mov	DWORD PTR _line$[ebp], ecx
; Line 373
	mov	edx, DWORD PTR _line$[ebp]
	push	edx
	call	_CsetCursor32
	add	esp, 4
$L697:
; Line 374
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
; Line 378
	push	ebp
	mov	ebp, esp
	sub	esp, 40					; 00000028H
; Line 380
	mov	DWORD PTR _num$[ebp], 1
	mov	DWORD PTR _base$[ebp], 1
; Line 381
	mov	eax, DWORD PTR _value$[ebp]
	cdq
	mov	ecx, 10					; 0000000aH
	idiv	ecx
	mov	DWORD PTR _temp$[ebp], eax
$L715:
; Line 385
	cmp	DWORD PTR _temp$[ebp], 1
	jl	SHORT $L716
; Line 387
	mov	edx, DWORD PTR _num$[ebp]
	add	edx, 1
	mov	DWORD PTR _num$[ebp], edx
; Line 388
	mov	eax, DWORD PTR _base$[ebp]
	imul	eax, 10					; 0000000aH
	mov	DWORD PTR _base$[ebp], eax
; Line 389
	mov	eax, DWORD PTR _temp$[ebp]
	cdq
	mov	ecx, 10					; 0000000aH
	idiv	ecx
	mov	DWORD PTR _temp$[ebp], eax
; Line 390
	jmp	SHORT $L715
$L716:
; Line 392
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
; Line 394
	mov	eax, DWORD PTR _value$[ebp]
	cdq
	idiv	DWORD PTR _base$[ebp]
	mov	DWORD PTR _output$[ebp], eax
; Line 395
	movsx	ecx, BYTE PTR _output$[ebp]
	add	ecx, 48					; 00000030H
	mov	BYTE PTR _disp$[ebp], cl
; Line 396
	mov	edx, DWORD PTR _pos$[ebp]
	push	edx
	mov	al, BYTE PTR _disp$[ebp]
	push	eax
	call	_printcharasm32
	add	esp, 8
; Line 397
	mov	ecx, DWORD PTR _pos$[ebp]
	add	ecx, 2
	mov	DWORD PTR _pos$[ebp], ecx
; Line 398
	mov	eax, DWORD PTR _value$[ebp]
	cdq
	idiv	DWORD PTR _base$[ebp]
	mov	DWORD PTR _value$[ebp], edx
; Line 399
	mov	eax, DWORD PTR _base$[ebp]
	cdq
	mov	ecx, 10					; 0000000aH
	idiv	ecx
	mov	DWORD PTR _base$[ebp], eax
; Line 400
	jmp	SHORT $L718
$L719:
; Line 402
	xor	eax, eax
; Line 403
	mov	esp, ebp
	pop	ebp
	ret	0
_CprintDec32 ENDP
_TEXT	ENDS
PUBLIC	_CclearNTFlag
EXTRN	_clearntflagasm32:NEAR
_TEXT	SEGMENT
_CclearNTFlag PROC NEAR
; Line 409
	push	ebp
	mov	ebp, esp
; Line 410
	call	_clearntflagasm32
; Line 411
	xor	eax, eax
; Line 412
	pop	ebp
	ret	0
_CclearNTFlag ENDP
_TEXT	ENDS
PUBLIC	_CprintFlags32
EXTRN	_printflagsasm32:NEAR
_TEXT	SEGMENT
_start$ = 8
_CprintFlags32 PROC NEAR
; Line 417
	push	ebp
	mov	ebp, esp
; Line 418
	mov	eax, DWORD PTR _start$[ebp]
	push	eax
	call	_printflagsasm32
	add	esp, 4
; Line 419
	xor	eax, eax
; Line 420
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
; Line 427
	push	ebp
	mov	ebp, esp
; Line 428
	mov	eax, DWORD PTR _base$[ebp]
	push	eax
	mov	ecx, DWORD PTR _index$[ebp]
	push	ecx
	call	_getsharedmemcharasm32
	add	esp, 8
; Line 429
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
; Line 436
	push	ebp
	mov	ebp, esp
; Line 437
	mov	eax, DWORD PTR _tid$[ebp]
	push	eax
	mov	ecx, DWORD PTR _lock$[ebp]
	push	ecx
	call	_resetlockasm32
	add	esp, 8
; Line 438
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
; Line 445
	push	ebp
	mov	ebp, esp
; Line 446
	mov	eax, DWORD PTR _tid$[ebp]
	push	eax
	mov	ecx, DWORD PTR _lock$[ebp]
	push	ecx
	call	_testandsetasm32
	add	esp, 8
; Line 447
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
; Line 454
	push	ebp
	mov	ebp, esp
; Line 455
	mov	eax, DWORD PTR _base$[ebp]
	push	eax
	mov	cl, BYTE PTR _c$[ebp]
	push	ecx
	mov	edx, DWORD PTR _index$[ebp]
	push	edx
	call	_setsharedmemcharasm32
	add	esp, 12					; 0000000cH
; Line 456
	pop	ebp
	ret	0
_CsetSharedMemChar32 ENDP
_TEXT	ENDS
PUBLIC	_CgetMem32
EXTRN	_getmemasm32:NEAR
_TEXT	SEGMENT
_addr$ = 8
_CgetMem32 PROC NEAR
; Line 466
	push	ebp
	mov	ebp, esp
; Line 467
	mov	eax, DWORD PTR _addr$[ebp]
	push	eax
	call	_getmemasm32
	add	esp, 4
; Line 468
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
; Line 471
	push	ebp
	mov	ebp, esp
; Line 472
	mov	eax, DWORD PTR _data$[ebp]
	push	eax
	mov	ecx, DWORD PTR _addr$[ebp]
	push	ecx
	call	_setmemasm32
	add	esp, 8
; Line 473
	pop	ebp
	ret	0
_CsetMem32 ENDP
_TEXT	ENDS
PUBLIC	_CgetRealMemory
EXTRN	_getrealmemory:NEAR
_TEXT	SEGMENT
_addr$ = 8
_CgetRealMemory PROC NEAR
; Line 476
	push	ebp
	mov	ebp, esp
; Line 477
	mov	eax, DWORD PTR _addr$[ebp]
	push	eax
	call	_getrealmemory
	add	esp, 4
; Line 478
	pop	ebp
	ret	0
_CgetRealMemory ENDP
_TEXT	ENDS
PUBLIC	_CgetStackPOP32
EXTRN	_getstackpopasm32:NEAR
_TEXT	SEGMENT
_index$ = 8
_CgetStackPOP32 PROC NEAR
; Line 485
	push	ebp
	mov	ebp, esp
; Line 486
	mov	eax, DWORD PTR _index$[ebp]
	push	eax
	call	_getstackpopasm32
	add	esp, 4
; Line 487
	pop	ebp
	ret	0
_CgetStackPOP32 ENDP
_TEXT	ENDS
PUBLIC	_CgetCharInt32
EXTRN	_getcharintasm32:NEAR
_TEXT	SEGMENT
_CgetCharInt32 PROC NEAR
; Line 494
	push	ebp
	mov	ebp, esp
; Line 495
	call	_getcharintasm32
; Line 496
	pop	ebp
	ret	0
_CgetCharInt32 ENDP
_TEXT	ENDS
PUBLIC	_CgetCharBuff32
EXTRN	_getcharbuffasm32:NEAR
_TEXT	SEGMENT
_CgetCharBuff32 PROC NEAR
; Line 503
	push	ebp
	mov	ebp, esp
; Line 504
	call	_getcharbuffasm32
; Line 505
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
; Line 514
	push	ebp
	mov	ebp, esp
; Line 515
	mov	eax, DWORD PTR _sectorno$[ebp]
	push	eax
	mov	ecx, DWORD PTR _buff$[ebp]
	push	ecx
	call	_readfloppyasm32
	add	esp, 8
; Line 516
	xor	eax, eax
; Line 517
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
; Line 526
	push	ebp
	mov	ebp, esp
; Line 527
	mov	eax, DWORD PTR _sectorno$[ebp]
	push	eax
	mov	ecx, DWORD PTR _buff$[ebp]
	push	ecx
	call	_writefloppyasm32
	add	esp, 8
; Line 528
	xor	eax, eax
; Line 529
	pop	ebp
	ret	0
_CwriteFloppy32 ENDP
_TEXT	ENDS
END
