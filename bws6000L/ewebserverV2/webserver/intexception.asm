	TITLE	intexception.cpp
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
PUBLIC	??0IntException@@QAE@XZ				; IntException::IntException
EXTRN	??0AOAProtected@@QAE@XZ:NEAR			; AOAProtected::AOAProtected
_TEXT	SEGMENT
_this$ = -4
??0IntException@@QAE@XZ PROC NEAR			; IntException::IntException
; File intexception.cpp
; Line 10
	push	ebp
	mov	ebp, esp
	push	ecx
	mov	DWORD PTR _this$[ebp], ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	??0AOAProtected@@QAE@XZ			; AOAProtected::AOAProtected
; Line 11
	mov	eax, DWORD PTR _this$[ebp]
	mov	esp, ebp
	pop	ebp
	ret	0
??0IntException@@QAE@XZ ENDP				; IntException::IntException
_TEXT	ENDS
PUBLIC	?IntException095@IntException@@QAEXJ@Z		; IntException::IntException095
PUBLIC	?IntException096@IntException@@QAEXJ@Z		; IntException::IntException096
PUBLIC	?IntException097@IntException@@QAEXJ@Z		; IntException::IntException097
PUBLIC	?IntException098@IntException@@QAEXJ@Z		; IntException::IntException098
PUBLIC	?IntException099@IntException@@QAEXJ@Z		; IntException::IntException099
PUBLIC	?IntException100@IntException@@QAEXJ@Z		; IntException::IntException100
PUBLIC	?IntException101@IntException@@QAEXJ@Z		; IntException::IntException101
PUBLIC	?IntException102@IntException@@QAEXJ@Z		; IntException::IntException102
PUBLIC	?IntException103@IntException@@QAEXJ@Z		; IntException::IntException103
PUBLIC	?IntException104@IntException@@QAEXJ@Z		; IntException::IntException104
PUBLIC	?IntException105@IntException@@QAEXJ@Z		; IntException::IntException105
PUBLIC	?IntException106@IntException@@QAEXJ@Z		; IntException::IntException106
PUBLIC	?IntException107@IntException@@QAEXJ@Z		; IntException::IntException107
PUBLIC	?IntException108@IntException@@QAEXJ@Z		; IntException::IntException108
PUBLIC	?IntException109@IntException@@QAEXJ@Z		; IntException::IntException109
PUBLIC	?IntException110@IntException@@QAEXJ@Z		; IntException::IntException110
PUBLIC	?IntException111@IntException@@QAEXJ@Z		; IntException::IntException111
PUBLIC	?IntException112@IntException@@QAEXJ@Z		; IntException::IntException112
PUBLIC	?IntException113@IntException@@QAEXJ@Z		; IntException::IntException113
PUBLIC	?IntException114@IntException@@QAEXJ@Z		; IntException::IntException114
PUBLIC	?IntException115@IntException@@QAEXJ@Z		; IntException::IntException115
PUBLIC	?IntException116@IntException@@QAEXJ@Z		; IntException::IntException116
PUBLIC	?IntException117@IntException@@QAEXJ@Z		; IntException::IntException117
PUBLIC	?IntException118@IntException@@QAEXJ@Z		; IntException::IntException118
PUBLIC	?IntException120@IntException@@QAEXJ@Z		; IntException::IntException120
PUBLIC	?IntException121@IntException@@QAEXJ@Z		; IntException::IntException121
PUBLIC	?IntException122@IntException@@QAEXJ@Z		; IntException::IntException122
PUBLIC	?IntException123@IntException@@QAEXJ@Z		; IntException::IntException123
PUBLIC	?IntException124@IntException@@QAEXJ@Z		; IntException::IntException124
PUBLIC	?IntException125@IntException@@QAEXJ@Z		; IntException::IntException125
PUBLIC	?IntException126@IntException@@QAEXJ@Z		; IntException::IntException126
PUBLIC	?IntException127@IntException@@QAEXJ@Z		; IntException::IntException127
PUBLIC	?IntException128@IntException@@QAEXJ@Z		; IntException::IntException128
PUBLIC	?IntException129@IntException@@QAEXJ@Z		; IntException::IntException129
PUBLIC	?IntException130@IntException@@QAEXJ@Z		; IntException::IntException130
PUBLIC	?IntException131@IntException@@QAEXJ@Z		; IntException::IntException131
PUBLIC	?IntException132@IntException@@QAEXJ@Z		; IntException::IntException132
PUBLIC	?IntException133@IntException@@QAEXJ@Z		; IntException::IntException133
PUBLIC	?IntException134@IntException@@QAEXJ@Z		; IntException::IntException134
PUBLIC	?IntException135@IntException@@QAEXJ@Z		; IntException::IntException135
PUBLIC	?IntException136@IntException@@QAEXJ@Z		; IntException::IntException136
PUBLIC	?IntException137@IntException@@QAEXJ@Z		; IntException::IntException137
PUBLIC	?IntException138@IntException@@QAEXJ@Z		; IntException::IntException138
PUBLIC	?IntException139@IntException@@QAEXJ@Z		; IntException::IntException139
PUBLIC	?IntException140@IntException@@QAEXJ@Z		; IntException::IntException140
PUBLIC	?IntException141@IntException@@QAEXJ@Z		; IntException::IntException141
PUBLIC	?IntException142@IntException@@QAEXJ@Z		; IntException::IntException142
PUBLIC	?IntException143@IntException@@QAEXJ@Z		; IntException::IntException143
PUBLIC	?IntException144@IntException@@QAEXJ@Z		; IntException::IntException144
PUBLIC	?IntException145@IntException@@QAEXJ@Z		; IntException::IntException145
PUBLIC	?IntException146@IntException@@QAEXJ@Z		; IntException::IntException146
PUBLIC	?IntException147@IntException@@QAEXJ@Z		; IntException::IntException147
PUBLIC	?IntException148@IntException@@QAEXJ@Z		; IntException::IntException148
PUBLIC	?IntException149@IntException@@QAEXJ@Z		; IntException::IntException149
PUBLIC	?IntException150@IntException@@QAEXJ@Z		; IntException::IntException150
PUBLIC	?IntException151@IntException@@QAEXJ@Z		; IntException::IntException151
PUBLIC	?IntException152@IntException@@QAEXJ@Z		; IntException::IntException152
PUBLIC	?IntException153@IntException@@QAEXJ@Z		; IntException::IntException153
PUBLIC	?IntException154@IntException@@QAEXJ@Z		; IntException::IntException154
PUBLIC	?IntException155@IntException@@QAEXJ@Z		; IntException::IntException155
PUBLIC	?IntException156@IntException@@QAEXJ@Z		; IntException::IntException156
PUBLIC	?IntException157@IntException@@QAEXJ@Z		; IntException::IntException157
PUBLIC	?IntException158@IntException@@QAEXJ@Z		; IntException::IntException158
PUBLIC	?IntException159@IntException@@QAEXJ@Z		; IntException::IntException159
PUBLIC	?IntException160@IntException@@QAEXJ@Z		; IntException::IntException160
PUBLIC	?IntException161@IntException@@QAEXJ@Z		; IntException::IntException161
PUBLIC	?IntException162@IntException@@QAEXJ@Z		; IntException::IntException162
PUBLIC	?IntException163@IntException@@QAEXJ@Z		; IntException::IntException163
PUBLIC	?IntException164@IntException@@QAEXJ@Z		; IntException::IntException164
PUBLIC	?IntException165@IntException@@QAEXJ@Z		; IntException::IntException165
PUBLIC	?IntException166@IntException@@QAEXJ@Z		; IntException::IntException166
PUBLIC	?IntException167@IntException@@QAEXJ@Z		; IntException::IntException167
PUBLIC	?IntException168@IntException@@QAEXJ@Z		; IntException::IntException168
PUBLIC	?IntException169@IntException@@QAEXJ@Z		; IntException::IntException169
PUBLIC	?IntException170@IntException@@QAEXJ@Z		; IntException::IntException170
PUBLIC	?IntException171@IntException@@QAEXJ@Z		; IntException::IntException171
PUBLIC	?IntException172@IntException@@QAEXJ@Z		; IntException::IntException172
PUBLIC	?IntException173@IntException@@QAEXJ@Z		; IntException::IntException173
PUBLIC	?IntException174@IntException@@QAEXJ@Z		; IntException::IntException174
PUBLIC	?IntException175@IntException@@QAEXJ@Z		; IntException::IntException175
PUBLIC	?IntException176@IntException@@QAEXJ@Z		; IntException::IntException176
PUBLIC	?IntException177@IntException@@QAEXJ@Z		; IntException::IntException177
PUBLIC	?IntException178@IntException@@QAEXJ@Z		; IntException::IntException178
PUBLIC	?IntException179@IntException@@QAEXJ@Z		; IntException::IntException179
PUBLIC	?IntException180@IntException@@QAEXJ@Z		; IntException::IntException180
PUBLIC	?IntException181@IntException@@QAEXJ@Z		; IntException::IntException181
PUBLIC	?IntException182@IntException@@QAEXJ@Z		; IntException::IntException182
PUBLIC	?IntException183@IntException@@QAEXJ@Z		; IntException::IntException183
PUBLIC	?IntException184@IntException@@QAEXJ@Z		; IntException::IntException184
PUBLIC	?IntException185@IntException@@QAEXJ@Z		; IntException::IntException185
PUBLIC	?IntException186@IntException@@QAEXJ@Z		; IntException::IntException186
PUBLIC	?IntException187@IntException@@QAEXJ@Z		; IntException::IntException187
PUBLIC	?IntException188@IntException@@QAEXJ@Z		; IntException::IntException188
PUBLIC	?IntException189@IntException@@QAEXJ@Z		; IntException::IntException189
PUBLIC	?IntException190@IntException@@QAEXJ@Z		; IntException::IntException190
PUBLIC	?IntException191@IntException@@QAEXJ@Z		; IntException::IntException191
PUBLIC	?IntException192@IntException@@QAEXJ@Z		; IntException::IntException192
PUBLIC	?IntException193@IntException@@QAEXJ@Z		; IntException::IntException193
PUBLIC	?IntException194@IntException@@QAEXJ@Z		; IntException::IntException194
PUBLIC	?IntException195@IntException@@QAEXJ@Z		; IntException::IntException195
PUBLIC	?IntException196@IntException@@QAEXJ@Z		; IntException::IntException196
PUBLIC	?IntException197@IntException@@QAEXJ@Z		; IntException::IntException197
PUBLIC	?IntException198@IntException@@QAEXJ@Z		; IntException::IntException198
PUBLIC	?IntException199@IntException@@QAEXJ@Z		; IntException::IntException199
PUBLIC	?IntException200@IntException@@QAEXJ@Z		; IntException::IntException200
PUBLIC	?IntException201@IntException@@QAEXJ@Z		; IntException::IntException201
PUBLIC	?IntException202@IntException@@QAEXJ@Z		; IntException::IntException202
PUBLIC	?IntException203@IntException@@QAEXJ@Z		; IntException::IntException203
PUBLIC	?IntException204@IntException@@QAEXJ@Z		; IntException::IntException204
PUBLIC	?IntException205@IntException@@QAEXJ@Z		; IntException::IntException205
PUBLIC	?IntException206@IntException@@QAEXJ@Z		; IntException::IntException206
PUBLIC	?IntException207@IntException@@QAEXJ@Z		; IntException::IntException207
PUBLIC	?IntException208@IntException@@QAEXJ@Z		; IntException::IntException208
PUBLIC	?IntException209@IntException@@QAEXJ@Z		; IntException::IntException209
PUBLIC	?IntException210@IntException@@QAEXJ@Z		; IntException::IntException210
PUBLIC	?IntException211@IntException@@QAEXJ@Z		; IntException::IntException211
PUBLIC	?IntException212@IntException@@QAEXJ@Z		; IntException::IntException212
PUBLIC	?IntException213@IntException@@QAEXJ@Z		; IntException::IntException213
PUBLIC	?IntException214@IntException@@QAEXJ@Z		; IntException::IntException214
PUBLIC	?IntException215@IntException@@QAEXJ@Z		; IntException::IntException215
PUBLIC	?IntException216@IntException@@QAEXJ@Z		; IntException::IntException216
PUBLIC	?IntException217@IntException@@QAEXJ@Z		; IntException::IntException217
PUBLIC	?IntException218@IntException@@QAEXJ@Z		; IntException::IntException218
PUBLIC	?IntException219@IntException@@QAEXJ@Z		; IntException::IntException219
PUBLIC	?IntException220@IntException@@QAEXJ@Z		; IntException::IntException220
PUBLIC	?IntException221@IntException@@QAEXJ@Z		; IntException::IntException221
PUBLIC	?IntException222@IntException@@QAEXJ@Z		; IntException::IntException222
PUBLIC	?IntException223@IntException@@QAEXJ@Z		; IntException::IntException223
PUBLIC	?IntException224@IntException@@QAEXJ@Z		; IntException::IntException224
PUBLIC	?IntException225@IntException@@QAEXJ@Z		; IntException::IntException225
PUBLIC	?IntException226@IntException@@QAEXJ@Z		; IntException::IntException226
PUBLIC	?IntException227@IntException@@QAEXJ@Z		; IntException::IntException227
PUBLIC	?IntException228@IntException@@QAEXJ@Z		; IntException::IntException228
PUBLIC	?IntException229@IntException@@QAEXJ@Z		; IntException::IntException229
PUBLIC	?IntException230@IntException@@QAEXJ@Z		; IntException::IntException230
PUBLIC	?IntException231@IntException@@QAEXJ@Z		; IntException::IntException231
PUBLIC	?IntException232@IntException@@QAEXJ@Z		; IntException::IntException232
PUBLIC	?IntException233@IntException@@QAEXJ@Z		; IntException::IntException233
PUBLIC	?IntException234@IntException@@QAEXJ@Z		; IntException::IntException234
PUBLIC	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
PUBLIC	?IntExceptionInit@IntException@@QAEXXZ		; IntException::IntExceptionInit
PUBLIC	?IntException000@IntException@@QAEXJ@Z		; IntException::IntException000
PUBLIC	?IntException001@IntException@@QAEXJ@Z		; IntException::IntException001
PUBLIC	?IntException002@IntException@@QAEXJ@Z		; IntException::IntException002
PUBLIC	?IntException003@IntException@@QAEXJ@Z		; IntException::IntException003
PUBLIC	?IntException004@IntException@@QAEXJ@Z		; IntException::IntException004
PUBLIC	?IntException005@IntException@@QAEXJ@Z		; IntException::IntException005
PUBLIC	?IntException006@IntException@@QAEXJ@Z		; IntException::IntException006
PUBLIC	?IntException007@IntException@@QAEXJ@Z		; IntException::IntException007
PUBLIC	?IntException010@IntException@@QAEXJ@Z		; IntException::IntException010
PUBLIC	?IntException011@IntException@@QAEXJ@Z		; IntException::IntException011
PUBLIC	?IntException012@IntException@@QAEXJ@Z		; IntException::IntException012
PUBLIC	?IntException013@IntException@@QAEXJ@Z		; IntException::IntException013
PUBLIC	?IntException016@IntException@@QAEXJ@Z		; IntException::IntException016
PUBLIC	?IntException017@IntException@@QAEXJ@Z		; IntException::IntException017
PUBLIC	?IntException018@IntException@@QAEXJ@Z		; IntException::IntException018
PUBLIC	?IntException019@IntException@@QAEXJ@Z		; IntException::IntException019
PUBLIC	?IntException020@IntException@@QAEXJ@Z		; IntException::IntException020
PUBLIC	?IntException021@IntException@@QAEXJ@Z		; IntException::IntException021
PUBLIC	?IntException022@IntException@@QAEXJ@Z		; IntException::IntException022
PUBLIC	?IntException023@IntException@@QAEXJ@Z		; IntException::IntException023
PUBLIC	?IntException024@IntException@@QAEXJ@Z		; IntException::IntException024
PUBLIC	?IntException025@IntException@@QAEXJ@Z		; IntException::IntException025
PUBLIC	?IntException026@IntException@@QAEXJ@Z		; IntException::IntException026
PUBLIC	?IntException027@IntException@@QAEXJ@Z		; IntException::IntException027
PUBLIC	?IntException028@IntException@@QAEXJ@Z		; IntException::IntException028
PUBLIC	?IntException029@IntException@@QAEXJ@Z		; IntException::IntException029
PUBLIC	?IntException030@IntException@@QAEXJ@Z		; IntException::IntException030
PUBLIC	?IntException031@IntException@@QAEXJ@Z		; IntException::IntException031
PUBLIC	?IntException032@IntException@@QAEXJ@Z		; IntException::IntException032
PUBLIC	?IntException033@IntException@@QAEXJ@Z		; IntException::IntException033
PUBLIC	?IntException034@IntException@@QAEXJ@Z		; IntException::IntException034
PUBLIC	?IntException035@IntException@@QAEXJ@Z		; IntException::IntException035
PUBLIC	?IntException036@IntException@@QAEXJ@Z		; IntException::IntException036
PUBLIC	?IntException037@IntException@@QAEXJ@Z		; IntException::IntException037
PUBLIC	?IntException038@IntException@@QAEXJ@Z		; IntException::IntException038
PUBLIC	?IntException039@IntException@@QAEXJ@Z		; IntException::IntException039
PUBLIC	?IntException040@IntException@@QAEXJ@Z		; IntException::IntException040
PUBLIC	?IntException041@IntException@@QAEXJ@Z		; IntException::IntException041
PUBLIC	?IntException042@IntException@@QAEXJ@Z		; IntException::IntException042
PUBLIC	?IntException043@IntException@@QAEXJ@Z		; IntException::IntException043
PUBLIC	?IntException044@IntException@@QAEXJ@Z		; IntException::IntException044
PUBLIC	?IntException045@IntException@@QAEXJ@Z		; IntException::IntException045
PUBLIC	?IntException046@IntException@@QAEXJ@Z		; IntException::IntException046
PUBLIC	?IntException047@IntException@@QAEXJ@Z		; IntException::IntException047
PUBLIC	?IntException048@IntException@@QAEXJ@Z		; IntException::IntException048
PUBLIC	?IntException049@IntException@@QAEXJ@Z		; IntException::IntException049
PUBLIC	?IntException050@IntException@@QAEXJ@Z		; IntException::IntException050
PUBLIC	?IntException051@IntException@@QAEXJ@Z		; IntException::IntException051
PUBLIC	?IntException052@IntException@@QAEXJ@Z		; IntException::IntException052
PUBLIC	?IntException053@IntException@@QAEXJ@Z		; IntException::IntException053
PUBLIC	?IntException054@IntException@@QAEXJ@Z		; IntException::IntException054
PUBLIC	?IntException055@IntException@@QAEXJ@Z		; IntException::IntException055
PUBLIC	?IntException056@IntException@@QAEXJ@Z		; IntException::IntException056
PUBLIC	?IntException057@IntException@@QAEXJ@Z		; IntException::IntException057
PUBLIC	?IntException058@IntException@@QAEXJ@Z		; IntException::IntException058
PUBLIC	?IntException059@IntException@@QAEXJ@Z		; IntException::IntException059
PUBLIC	?IntException060@IntException@@QAEXJ@Z		; IntException::IntException060
PUBLIC	?IntException061@IntException@@QAEXJ@Z		; IntException::IntException061
PUBLIC	?IntException062@IntException@@QAEXJ@Z		; IntException::IntException062
PUBLIC	?IntException063@IntException@@QAEXJ@Z		; IntException::IntException063
PUBLIC	?IntException064@IntException@@QAEXJ@Z		; IntException::IntException064
PUBLIC	?IntException065@IntException@@QAEXJ@Z		; IntException::IntException065
PUBLIC	?IntException066@IntException@@QAEXJ@Z		; IntException::IntException066
PUBLIC	?IntException067@IntException@@QAEXJ@Z		; IntException::IntException067
PUBLIC	?IntException068@IntException@@QAEXJ@Z		; IntException::IntException068
PUBLIC	?IntException069@IntException@@QAEXJ@Z		; IntException::IntException069
PUBLIC	?IntException070@IntException@@QAEXJ@Z		; IntException::IntException070
PUBLIC	?IntException071@IntException@@QAEXJ@Z		; IntException::IntException071
PUBLIC	?IntException072@IntException@@QAEXJ@Z		; IntException::IntException072
PUBLIC	?IntException073@IntException@@QAEXJ@Z		; IntException::IntException073
PUBLIC	?IntException074@IntException@@QAEXJ@Z		; IntException::IntException074
PUBLIC	?IntException075@IntException@@QAEXJ@Z		; IntException::IntException075
PUBLIC	?IntException076@IntException@@QAEXJ@Z		; IntException::IntException076
PUBLIC	?IntException077@IntException@@QAEXJ@Z		; IntException::IntException077
PUBLIC	?IntException078@IntException@@QAEXJ@Z		; IntException::IntException078
PUBLIC	?IntException079@IntException@@QAEXJ@Z		; IntException::IntException079
PUBLIC	?IntException080@IntException@@QAEXJ@Z		; IntException::IntException080
PUBLIC	?IntException081@IntException@@QAEXJ@Z		; IntException::IntException081
PUBLIC	?IntException082@IntException@@QAEXJ@Z		; IntException::IntException082
PUBLIC	?IntException083@IntException@@QAEXJ@Z		; IntException::IntException083
PUBLIC	?IntException084@IntException@@QAEXJ@Z		; IntException::IntException084
PUBLIC	?IntException085@IntException@@QAEXJ@Z		; IntException::IntException085
PUBLIC	?IntException086@IntException@@QAEXJ@Z		; IntException::IntException086
PUBLIC	?IntException087@IntException@@QAEXJ@Z		; IntException::IntException087
PUBLIC	?IntException088@IntException@@QAEXJ@Z		; IntException::IntException088
PUBLIC	?IntException089@IntException@@QAEXJ@Z		; IntException::IntException089
PUBLIC	?IntException090@IntException@@QAEXJ@Z		; IntException::IntException090
PUBLIC	?IntException091@IntException@@QAEXJ@Z		; IntException::IntException091
PUBLIC	?IntException092@IntException@@QAEXJ@Z		; IntException::IntException092
PUBLIC	?IntException093@IntException@@QAEXJ@Z		; IntException::IntException093
PUBLIC	?IntException094@IntException@@QAEXJ@Z		; IntException::IntException094
EXTRN	?AOAsetISR@AOAProtected@@QAEHJJK@Z:NEAR		; AOAProtected::AOAsetISR
_TEXT	SEGMENT
_this$ = -16
_i$ = -8
_Function_Ptr_X1$ = -12
_INTSELBASE$ = -4
?IntExceptionInit@IntException@@QAEXXZ PROC NEAR	; IntException::IntExceptionInit
; Line 19
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	mov	DWORD PTR _this$[ebp], ecx
; Line 21
	mov	DWORD PTR _Function_Ptr_X1$[ebp], 0
; Line 22
	mov	DWORD PTR _INTSELBASE$[ebp], 42		; 0000002aH
; Line 26
	mov	eax, DWORD PTR _this$[ebp]
	add	eax, 16					; 00000010H
	mov	ecx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+12], eax
; Line 27
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [edx+12], 58246656		; 0378c600H
; Line 31
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException000@IntException@@QAEXJ@Z ; IntException::IntException000
; Line 32
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx], eax
; Line 33
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException001@IntException@@QAEXJ@Z ; IntException::IntException001
; Line 34
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+4], eax
; Line 35
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException002@IntException@@QAEXJ@Z ; IntException::IntException002
; Line 36
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+8], eax
; Line 37
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException003@IntException@@QAEXJ@Z ; IntException::IntException003
; Line 38
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+12], eax
; Line 39
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException004@IntException@@QAEXJ@Z ; IntException::IntException004
; Line 40
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+16], eax
; Line 41
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException005@IntException@@QAEXJ@Z ; IntException::IntException005
; Line 42
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+20], eax
; Line 43
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException006@IntException@@QAEXJ@Z ; IntException::IntException006
; Line 44
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+24], eax
; Line 45
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException007@IntException@@QAEXJ@Z ; IntException::IntException007
; Line 46
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+28], eax
; Line 47
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException010@IntException@@QAEXJ@Z ; IntException::IntException010
; Line 48
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+40], eax
; Line 49
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException011@IntException@@QAEXJ@Z ; IntException::IntException011
; Line 50
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+44], eax
; Line 51
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException012@IntException@@QAEXJ@Z ; IntException::IntException012
; Line 52
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+48], eax
; Line 53
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException013@IntException@@QAEXJ@Z ; IntException::IntException013
; Line 54
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+52], eax
; Line 56
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException016@IntException@@QAEXJ@Z ; IntException::IntException016
; Line 57
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+64], eax
; Line 58
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException017@IntException@@QAEXJ@Z ; IntException::IntException017
; Line 59
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+68], eax
; Line 60
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException018@IntException@@QAEXJ@Z ; IntException::IntException018
; Line 61
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+72], eax
; Line 62
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException019@IntException@@QAEXJ@Z ; IntException::IntException019
; Line 63
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+76], eax
; Line 65
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException020@IntException@@QAEXJ@Z ; IntException::IntException020
; Line 66
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+80], eax
; Line 67
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException021@IntException@@QAEXJ@Z ; IntException::IntException021
; Line 68
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+84], eax
; Line 69
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException022@IntException@@QAEXJ@Z ; IntException::IntException022
; Line 70
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+88], eax
; Line 71
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException023@IntException@@QAEXJ@Z ; IntException::IntException023
; Line 72
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+92], eax
; Line 73
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException024@IntException@@QAEXJ@Z ; IntException::IntException024
; Line 74
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+96], eax
; Line 75
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException025@IntException@@QAEXJ@Z ; IntException::IntException025
; Line 76
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+100], eax
; Line 77
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException026@IntException@@QAEXJ@Z ; IntException::IntException026
; Line 78
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+104], eax
; Line 79
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException027@IntException@@QAEXJ@Z ; IntException::IntException027
; Line 80
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+108], eax
; Line 81
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException028@IntException@@QAEXJ@Z ; IntException::IntException028
; Line 82
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+112], eax
; Line 83
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException029@IntException@@QAEXJ@Z ; IntException::IntException029
; Line 84
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+116], eax
; Line 86
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException030@IntException@@QAEXJ@Z ; IntException::IntException030
; Line 87
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+120], eax
; Line 88
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException031@IntException@@QAEXJ@Z ; IntException::IntException031
; Line 89
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+124], eax
; Line 90
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException032@IntException@@QAEXJ@Z ; IntException::IntException032
; Line 91
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+128], eax
; Line 92
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException033@IntException@@QAEXJ@Z ; IntException::IntException033
; Line 93
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+132], eax
; Line 94
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException034@IntException@@QAEXJ@Z ; IntException::IntException034
; Line 95
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+136], eax
; Line 96
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException035@IntException@@QAEXJ@Z ; IntException::IntException035
; Line 97
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+140], eax
; Line 98
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException036@IntException@@QAEXJ@Z ; IntException::IntException036
; Line 99
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+144], eax
; Line 100
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException037@IntException@@QAEXJ@Z ; IntException::IntException037
; Line 101
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+148], eax
; Line 102
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException038@IntException@@QAEXJ@Z ; IntException::IntException038
; Line 103
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+152], eax
; Line 104
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException039@IntException@@QAEXJ@Z ; IntException::IntException039
; Line 105
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+156], eax
; Line 107
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException040@IntException@@QAEXJ@Z ; IntException::IntException040
; Line 108
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+160], eax
; Line 109
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException041@IntException@@QAEXJ@Z ; IntException::IntException041
; Line 110
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+164], eax
; Line 111
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException042@IntException@@QAEXJ@Z ; IntException::IntException042
; Line 112
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+168], eax
; Line 113
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException043@IntException@@QAEXJ@Z ; IntException::IntException043
; Line 114
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+172], eax
; Line 115
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException044@IntException@@QAEXJ@Z ; IntException::IntException044
; Line 116
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+176], eax
; Line 117
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException045@IntException@@QAEXJ@Z ; IntException::IntException045
; Line 118
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+180], eax
; Line 119
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException046@IntException@@QAEXJ@Z ; IntException::IntException046
; Line 120
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+184], eax
; Line 121
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException047@IntException@@QAEXJ@Z ; IntException::IntException047
; Line 122
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+188], eax
; Line 123
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException048@IntException@@QAEXJ@Z ; IntException::IntException048
; Line 124
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+192], eax
; Line 125
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException049@IntException@@QAEXJ@Z ; IntException::IntException049
; Line 126
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+196], eax
; Line 128
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException050@IntException@@QAEXJ@Z ; IntException::IntException050
; Line 129
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+200], eax
; Line 130
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException051@IntException@@QAEXJ@Z ; IntException::IntException051
; Line 131
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+204], eax
; Line 132
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException052@IntException@@QAEXJ@Z ; IntException::IntException052
; Line 133
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+208], eax
; Line 134
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException053@IntException@@QAEXJ@Z ; IntException::IntException053
; Line 135
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+212], eax
; Line 136
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException054@IntException@@QAEXJ@Z ; IntException::IntException054
; Line 137
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+216], eax
; Line 138
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException055@IntException@@QAEXJ@Z ; IntException::IntException055
; Line 139
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+220], eax
; Line 140
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException056@IntException@@QAEXJ@Z ; IntException::IntException056
; Line 141
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+224], eax
; Line 142
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException057@IntException@@QAEXJ@Z ; IntException::IntException057
; Line 143
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+228], eax
; Line 144
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException058@IntException@@QAEXJ@Z ; IntException::IntException058
; Line 145
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+232], eax
; Line 146
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException059@IntException@@QAEXJ@Z ; IntException::IntException059
; Line 147
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+236], eax
; Line 149
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException060@IntException@@QAEXJ@Z ; IntException::IntException060
; Line 150
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+240], eax
; Line 151
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException061@IntException@@QAEXJ@Z ; IntException::IntException061
; Line 152
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+244], eax
; Line 153
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException062@IntException@@QAEXJ@Z ; IntException::IntException062
; Line 154
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+248], eax
; Line 155
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException063@IntException@@QAEXJ@Z ; IntException::IntException063
; Line 156
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+252], eax
; Line 157
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException064@IntException@@QAEXJ@Z ; IntException::IntException064
; Line 158
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+256], eax
; Line 159
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException065@IntException@@QAEXJ@Z ; IntException::IntException065
; Line 160
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+260], eax
; Line 161
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException066@IntException@@QAEXJ@Z ; IntException::IntException066
; Line 162
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+264], eax
; Line 163
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException067@IntException@@QAEXJ@Z ; IntException::IntException067
; Line 164
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+268], eax
; Line 165
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException068@IntException@@QAEXJ@Z ; IntException::IntException068
; Line 166
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+272], eax
; Line 167
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException069@IntException@@QAEXJ@Z ; IntException::IntException069
; Line 168
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+276], eax
; Line 170
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException070@IntException@@QAEXJ@Z ; IntException::IntException070
; Line 171
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+280], eax
; Line 172
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException071@IntException@@QAEXJ@Z ; IntException::IntException071
; Line 173
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+284], eax
; Line 174
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException072@IntException@@QAEXJ@Z ; IntException::IntException072
; Line 175
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+288], eax
; Line 176
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException073@IntException@@QAEXJ@Z ; IntException::IntException073
; Line 177
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+292], eax
; Line 178
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException074@IntException@@QAEXJ@Z ; IntException::IntException074
; Line 179
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+296], eax
; Line 180
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException075@IntException@@QAEXJ@Z ; IntException::IntException075
; Line 181
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+300], eax
; Line 182
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException076@IntException@@QAEXJ@Z ; IntException::IntException076
; Line 183
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+304], eax
; Line 184
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException077@IntException@@QAEXJ@Z ; IntException::IntException077
; Line 185
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+308], eax
; Line 186
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException078@IntException@@QAEXJ@Z ; IntException::IntException078
; Line 187
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+312], eax
; Line 188
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException079@IntException@@QAEXJ@Z ; IntException::IntException079
; Line 189
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+316], eax
; Line 191
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException080@IntException@@QAEXJ@Z ; IntException::IntException080
; Line 192
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+320], eax
; Line 193
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException081@IntException@@QAEXJ@Z ; IntException::IntException081
; Line 194
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+324], eax
; Line 195
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException082@IntException@@QAEXJ@Z ; IntException::IntException082
; Line 196
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+328], eax
; Line 197
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException083@IntException@@QAEXJ@Z ; IntException::IntException083
; Line 198
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+332], eax
; Line 199
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException084@IntException@@QAEXJ@Z ; IntException::IntException084
; Line 200
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+336], eax
; Line 201
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException085@IntException@@QAEXJ@Z ; IntException::IntException085
; Line 202
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+340], eax
; Line 203
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException086@IntException@@QAEXJ@Z ; IntException::IntException086
; Line 204
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+344], eax
; Line 205
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException087@IntException@@QAEXJ@Z ; IntException::IntException087
; Line 206
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+348], eax
; Line 207
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException088@IntException@@QAEXJ@Z ; IntException::IntException088
; Line 208
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+352], eax
; Line 209
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException089@IntException@@QAEXJ@Z ; IntException::IntException089
; Line 210
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+356], eax
; Line 212
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException090@IntException@@QAEXJ@Z ; IntException::IntException090
; Line 213
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+360], eax
; Line 214
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException091@IntException@@QAEXJ@Z ; IntException::IntException091
; Line 215
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+364], eax
; Line 216
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException092@IntException@@QAEXJ@Z ; IntException::IntException092
; Line 217
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+368], eax
; Line 218
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException093@IntException@@QAEXJ@Z ; IntException::IntException093
; Line 219
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+372], eax
; Line 220
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException094@IntException@@QAEXJ@Z ; IntException::IntException094
; Line 221
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+376], eax
; Line 222
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException095@IntException@@QAEXJ@Z ; IntException::IntException095
; Line 223
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+380], eax
; Line 224
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException096@IntException@@QAEXJ@Z ; IntException::IntException096
; Line 225
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+384], eax
; Line 226
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException097@IntException@@QAEXJ@Z ; IntException::IntException097
; Line 227
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+388], eax
; Line 228
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException098@IntException@@QAEXJ@Z ; IntException::IntException098
; Line 229
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+392], eax
; Line 230
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException099@IntException@@QAEXJ@Z ; IntException::IntException099
; Line 231
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+396], eax
; Line 233
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException100@IntException@@QAEXJ@Z ; IntException::IntException100
; Line 234
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+400], eax
; Line 235
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException101@IntException@@QAEXJ@Z ; IntException::IntException101
; Line 236
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+404], eax
; Line 237
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException102@IntException@@QAEXJ@Z ; IntException::IntException102
; Line 238
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+408], eax
; Line 239
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException103@IntException@@QAEXJ@Z ; IntException::IntException103
; Line 240
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+412], eax
; Line 241
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException104@IntException@@QAEXJ@Z ; IntException::IntException104
; Line 242
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+416], eax
; Line 243
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException105@IntException@@QAEXJ@Z ; IntException::IntException105
; Line 244
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+420], eax
; Line 245
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException106@IntException@@QAEXJ@Z ; IntException::IntException106
; Line 246
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+424], eax
; Line 247
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException107@IntException@@QAEXJ@Z ; IntException::IntException107
; Line 248
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+428], eax
; Line 249
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException108@IntException@@QAEXJ@Z ; IntException::IntException108
; Line 250
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+432], eax
; Line 251
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException109@IntException@@QAEXJ@Z ; IntException::IntException109
; Line 252
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+436], eax
; Line 254
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException110@IntException@@QAEXJ@Z ; IntException::IntException110
; Line 255
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+440], eax
; Line 256
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException111@IntException@@QAEXJ@Z ; IntException::IntException111
; Line 257
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+444], eax
; Line 258
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException112@IntException@@QAEXJ@Z ; IntException::IntException112
; Line 259
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+448], eax
; Line 260
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException113@IntException@@QAEXJ@Z ; IntException::IntException113
; Line 261
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+452], eax
; Line 262
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException114@IntException@@QAEXJ@Z ; IntException::IntException114
; Line 263
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+456], eax
; Line 264
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException115@IntException@@QAEXJ@Z ; IntException::IntException115
; Line 265
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+460], eax
; Line 266
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException116@IntException@@QAEXJ@Z ; IntException::IntException116
; Line 267
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+464], eax
; Line 268
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException117@IntException@@QAEXJ@Z ; IntException::IntException117
; Line 269
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+468], eax
; Line 270
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException118@IntException@@QAEXJ@Z ; IntException::IntException118
; Line 271
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+472], eax
; Line 273
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException120@IntException@@QAEXJ@Z ; IntException::IntException120
; Line 274
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+480], eax
; Line 275
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException121@IntException@@QAEXJ@Z ; IntException::IntException121
; Line 276
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+484], eax
; Line 277
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException122@IntException@@QAEXJ@Z ; IntException::IntException122
; Line 278
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+488], eax
; Line 279
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException123@IntException@@QAEXJ@Z ; IntException::IntException123
; Line 280
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+492], eax
; Line 281
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException124@IntException@@QAEXJ@Z ; IntException::IntException124
; Line 282
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+496], eax
; Line 283
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException125@IntException@@QAEXJ@Z ; IntException::IntException125
; Line 284
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+500], eax
; Line 285
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException126@IntException@@QAEXJ@Z ; IntException::IntException126
; Line 286
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+504], eax
; Line 287
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException127@IntException@@QAEXJ@Z ; IntException::IntException127
; Line 288
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+508], eax
; Line 289
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException128@IntException@@QAEXJ@Z ; IntException::IntException128
; Line 290
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+512], eax
; Line 291
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException129@IntException@@QAEXJ@Z ; IntException::IntException129
; Line 292
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+516], eax
; Line 294
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException130@IntException@@QAEXJ@Z ; IntException::IntException130
; Line 295
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+520], eax
; Line 296
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException131@IntException@@QAEXJ@Z ; IntException::IntException131
; Line 297
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+524], eax
; Line 298
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException132@IntException@@QAEXJ@Z ; IntException::IntException132
; Line 299
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+528], eax
; Line 300
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException133@IntException@@QAEXJ@Z ; IntException::IntException133
; Line 301
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+532], eax
; Line 302
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException134@IntException@@QAEXJ@Z ; IntException::IntException134
; Line 303
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+536], eax
; Line 304
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException135@IntException@@QAEXJ@Z ; IntException::IntException135
; Line 305
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+540], eax
; Line 306
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException136@IntException@@QAEXJ@Z ; IntException::IntException136
; Line 307
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+544], eax
; Line 308
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException137@IntException@@QAEXJ@Z ; IntException::IntException137
; Line 309
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+548], eax
; Line 310
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException138@IntException@@QAEXJ@Z ; IntException::IntException138
; Line 311
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+552], eax
; Line 312
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException139@IntException@@QAEXJ@Z ; IntException::IntException139
; Line 313
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+556], eax
; Line 315
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException140@IntException@@QAEXJ@Z ; IntException::IntException140
; Line 316
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+560], eax
; Line 317
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException141@IntException@@QAEXJ@Z ; IntException::IntException141
; Line 318
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+564], eax
; Line 319
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException142@IntException@@QAEXJ@Z ; IntException::IntException142
; Line 320
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+568], eax
; Line 321
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException143@IntException@@QAEXJ@Z ; IntException::IntException143
; Line 322
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+572], eax
; Line 323
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException144@IntException@@QAEXJ@Z ; IntException::IntException144
; Line 324
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+576], eax
; Line 325
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException145@IntException@@QAEXJ@Z ; IntException::IntException145
; Line 326
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+580], eax
; Line 327
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException146@IntException@@QAEXJ@Z ; IntException::IntException146
; Line 328
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+584], eax
; Line 329
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException147@IntException@@QAEXJ@Z ; IntException::IntException147
; Line 330
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+588], eax
; Line 331
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException148@IntException@@QAEXJ@Z ; IntException::IntException148
; Line 332
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+592], eax
; Line 333
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException149@IntException@@QAEXJ@Z ; IntException::IntException149
; Line 334
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+596], eax
; Line 336
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException150@IntException@@QAEXJ@Z ; IntException::IntException150
; Line 337
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+600], eax
; Line 338
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException151@IntException@@QAEXJ@Z ; IntException::IntException151
; Line 339
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+604], eax
; Line 340
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException152@IntException@@QAEXJ@Z ; IntException::IntException152
; Line 341
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+608], eax
; Line 342
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException153@IntException@@QAEXJ@Z ; IntException::IntException153
; Line 343
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+612], eax
; Line 344
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException154@IntException@@QAEXJ@Z ; IntException::IntException154
; Line 345
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+616], eax
; Line 346
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException155@IntException@@QAEXJ@Z ; IntException::IntException155
; Line 347
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+620], eax
; Line 348
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException156@IntException@@QAEXJ@Z ; IntException::IntException156
; Line 349
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+624], eax
; Line 350
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException157@IntException@@QAEXJ@Z ; IntException::IntException157
; Line 351
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+628], eax
; Line 352
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException158@IntException@@QAEXJ@Z ; IntException::IntException158
; Line 353
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+632], eax
; Line 354
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException159@IntException@@QAEXJ@Z ; IntException::IntException159
; Line 355
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+636], eax
; Line 357
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException160@IntException@@QAEXJ@Z ; IntException::IntException160
; Line 358
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+640], eax
; Line 359
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException161@IntException@@QAEXJ@Z ; IntException::IntException161
; Line 360
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+644], eax
; Line 361
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException162@IntException@@QAEXJ@Z ; IntException::IntException162
; Line 362
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+648], eax
; Line 363
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException163@IntException@@QAEXJ@Z ; IntException::IntException163
; Line 364
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+652], eax
; Line 365
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException164@IntException@@QAEXJ@Z ; IntException::IntException164
; Line 366
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+656], eax
; Line 367
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException165@IntException@@QAEXJ@Z ; IntException::IntException165
; Line 368
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+660], eax
; Line 369
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException166@IntException@@QAEXJ@Z ; IntException::IntException166
; Line 370
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+664], eax
; Line 371
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException167@IntException@@QAEXJ@Z ; IntException::IntException167
; Line 372
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+668], eax
; Line 373
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException168@IntException@@QAEXJ@Z ; IntException::IntException168
; Line 374
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+672], eax
; Line 375
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException169@IntException@@QAEXJ@Z ; IntException::IntException169
; Line 376
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+676], eax
; Line 378
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException170@IntException@@QAEXJ@Z ; IntException::IntException170
; Line 379
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+680], eax
; Line 380
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException171@IntException@@QAEXJ@Z ; IntException::IntException171
; Line 381
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+684], eax
; Line 382
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException172@IntException@@QAEXJ@Z ; IntException::IntException172
; Line 383
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+688], eax
; Line 384
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException173@IntException@@QAEXJ@Z ; IntException::IntException173
; Line 385
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+692], eax
; Line 386
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException174@IntException@@QAEXJ@Z ; IntException::IntException174
; Line 387
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+696], eax
; Line 388
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException175@IntException@@QAEXJ@Z ; IntException::IntException175
; Line 389
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+700], eax
; Line 390
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException176@IntException@@QAEXJ@Z ; IntException::IntException176
; Line 391
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+704], eax
; Line 392
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException177@IntException@@QAEXJ@Z ; IntException::IntException177
; Line 393
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+708], eax
; Line 394
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException178@IntException@@QAEXJ@Z ; IntException::IntException178
; Line 395
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+712], eax
; Line 396
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException179@IntException@@QAEXJ@Z ; IntException::IntException179
; Line 397
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+716], eax
; Line 399
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException180@IntException@@QAEXJ@Z ; IntException::IntException180
; Line 400
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+720], eax
; Line 401
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException181@IntException@@QAEXJ@Z ; IntException::IntException181
; Line 402
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+724], eax
; Line 403
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException182@IntException@@QAEXJ@Z ; IntException::IntException182
; Line 404
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+728], eax
; Line 405
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException183@IntException@@QAEXJ@Z ; IntException::IntException183
; Line 406
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+732], eax
; Line 407
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException184@IntException@@QAEXJ@Z ; IntException::IntException184
; Line 408
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+736], eax
; Line 409
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException185@IntException@@QAEXJ@Z ; IntException::IntException185
; Line 410
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+740], eax
; Line 411
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException186@IntException@@QAEXJ@Z ; IntException::IntException186
; Line 412
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+744], eax
; Line 413
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException187@IntException@@QAEXJ@Z ; IntException::IntException187
; Line 414
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+748], eax
; Line 415
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException188@IntException@@QAEXJ@Z ; IntException::IntException188
; Line 416
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+752], eax
; Line 417
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException189@IntException@@QAEXJ@Z ; IntException::IntException189
; Line 418
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+756], eax
; Line 420
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException190@IntException@@QAEXJ@Z ; IntException::IntException190
; Line 421
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+760], eax
; Line 422
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException191@IntException@@QAEXJ@Z ; IntException::IntException191
; Line 423
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+764], eax
; Line 424
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException192@IntException@@QAEXJ@Z ; IntException::IntException192
; Line 425
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+768], eax
; Line 426
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException193@IntException@@QAEXJ@Z ; IntException::IntException193
; Line 427
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+772], eax
; Line 428
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException194@IntException@@QAEXJ@Z ; IntException::IntException194
; Line 429
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+776], eax
; Line 430
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException195@IntException@@QAEXJ@Z ; IntException::IntException195
; Line 431
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+780], eax
; Line 432
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException196@IntException@@QAEXJ@Z ; IntException::IntException196
; Line 433
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+784], eax
; Line 434
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException197@IntException@@QAEXJ@Z ; IntException::IntException197
; Line 435
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+788], eax
; Line 436
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException198@IntException@@QAEXJ@Z ; IntException::IntException198
; Line 437
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+792], eax
; Line 438
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException199@IntException@@QAEXJ@Z ; IntException::IntException199
; Line 439
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+796], eax
; Line 441
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException200@IntException@@QAEXJ@Z ; IntException::IntException200
; Line 442
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+800], eax
; Line 443
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException201@IntException@@QAEXJ@Z ; IntException::IntException201
; Line 444
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+804], eax
; Line 445
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException202@IntException@@QAEXJ@Z ; IntException::IntException202
; Line 446
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+808], eax
; Line 447
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException203@IntException@@QAEXJ@Z ; IntException::IntException203
; Line 448
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+812], eax
; Line 449
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException204@IntException@@QAEXJ@Z ; IntException::IntException204
; Line 450
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+816], eax
; Line 451
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException205@IntException@@QAEXJ@Z ; IntException::IntException205
; Line 452
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+820], eax
; Line 453
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException206@IntException@@QAEXJ@Z ; IntException::IntException206
; Line 454
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+824], eax
; Line 455
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException207@IntException@@QAEXJ@Z ; IntException::IntException207
; Line 456
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+828], eax
; Line 457
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException208@IntException@@QAEXJ@Z ; IntException::IntException208
; Line 458
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+832], eax
; Line 459
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException209@IntException@@QAEXJ@Z ; IntException::IntException209
; Line 460
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+836], eax
; Line 462
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException210@IntException@@QAEXJ@Z ; IntException::IntException210
; Line 463
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+840], eax
; Line 464
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException211@IntException@@QAEXJ@Z ; IntException::IntException211
; Line 465
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+844], eax
; Line 466
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException212@IntException@@QAEXJ@Z ; IntException::IntException212
; Line 467
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+848], eax
; Line 468
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException213@IntException@@QAEXJ@Z ; IntException::IntException213
; Line 469
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+852], eax
; Line 470
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException214@IntException@@QAEXJ@Z ; IntException::IntException214
; Line 471
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+856], eax
; Line 472
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException215@IntException@@QAEXJ@Z ; IntException::IntException215
; Line 473
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+860], eax
; Line 474
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException216@IntException@@QAEXJ@Z ; IntException::IntException216
; Line 475
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+864], eax
; Line 476
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException217@IntException@@QAEXJ@Z ; IntException::IntException217
; Line 477
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+868], eax
; Line 478
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException218@IntException@@QAEXJ@Z ; IntException::IntException218
; Line 479
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+872], eax
; Line 480
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException219@IntException@@QAEXJ@Z ; IntException::IntException219
; Line 481
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+876], eax
; Line 483
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException220@IntException@@QAEXJ@Z ; IntException::IntException220
; Line 484
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+880], eax
; Line 485
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException221@IntException@@QAEXJ@Z ; IntException::IntException221
; Line 486
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+884], eax
; Line 487
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException222@IntException@@QAEXJ@Z ; IntException::IntException222
; Line 488
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+888], eax
; Line 489
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException223@IntException@@QAEXJ@Z ; IntException::IntException223
; Line 490
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+892], eax
; Line 491
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException224@IntException@@QAEXJ@Z ; IntException::IntException224
; Line 492
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+896], eax
; Line 493
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException225@IntException@@QAEXJ@Z ; IntException::IntException225
; Line 494
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+900], eax
; Line 495
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException226@IntException@@QAEXJ@Z ; IntException::IntException226
; Line 496
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+904], eax
; Line 497
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException227@IntException@@QAEXJ@Z ; IntException::IntException227
; Line 498
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+908], eax
; Line 499
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException228@IntException@@QAEXJ@Z ; IntException::IntException228
; Line 500
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+912], eax
; Line 501
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException229@IntException@@QAEXJ@Z ; IntException::IntException229
; Line 502
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+916], eax
; Line 504
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException230@IntException@@QAEXJ@Z ; IntException::IntException230
; Line 505
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+920], eax
; Line 506
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException231@IntException@@QAEXJ@Z ; IntException::IntException231
; Line 507
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+924], eax
; Line 508
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException232@IntException@@QAEXJ@Z ; IntException::IntException232
; Line 509
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+928], eax
; Line 510
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException233@IntException@@QAEXJ@Z ; IntException::IntException233
; Line 511
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+932], eax
; Line 512
	mov	DWORD PTR _Function_Ptr_X1$[ebp], OFFSET FLAT:?IntException234@IntException@@QAEXJ@Z ; IntException::IntException234
; Line 513
	mov	eax, DWORD PTR _Function_Ptr_X1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ; IntException::getFunctionPtr
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+936], eax
; Line 518
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L2025
$L2026:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L2025:
	cmp	DWORD PTR _i$[ebp], 7
	jg	SHORT $L2027
; Line 520
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR [edx+eax*4]
	push	ecx
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _INTSELBASE$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetISR@AOAProtected@@QAEHJJK@Z	; AOAProtected::AOAsetISR
; Line 521
	jmp	SHORT $L2026
$L2027:
; Line 522
	mov	DWORD PTR _i$[ebp], 10			; 0000000aH
	jmp	SHORT $L2029
$L2030:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L2029:
	cmp	DWORD PTR _i$[ebp], 12			; 0000000cH
	jg	SHORT $L2031
; Line 524
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+12]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR [eax+ecx*4]
	push	edx
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _INTSELBASE$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetISR@AOAProtected@@QAEHJJK@Z	; AOAProtected::AOAsetISR
; Line 525
	jmp	SHORT $L2030
$L2031:
; Line 527
	mov	DWORD PTR _i$[ebp], 16			; 00000010H
	jmp	SHORT $L2033
$L2034:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L2033:
	cmp	DWORD PTR _i$[ebp], 114			; 00000072H
	jg	SHORT $L2035
; Line 529
	mov	eax, DWORD PTR _this$[ebp]
	mov	ecx, DWORD PTR [eax+12]
	mov	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR [ecx+edx*4]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	mov	edx, DWORD PTR _INTSELBASE$[ebp]
	push	edx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetISR@AOAProtected@@QAEHJJK@Z	; AOAProtected::AOAsetISR
; Line 530
	jmp	SHORT $L2034
$L2035:
; Line 531
	mov	DWORD PTR _i$[ebp], 116			; 00000074H
	jmp	SHORT $L2037
$L2038:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L2037:
	cmp	DWORD PTR _i$[ebp], 119			; 00000077H
	jg	SHORT $L2039
; Line 533
	mov	ecx, DWORD PTR _this$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR [edx+eax*4]
	push	ecx
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	mov	eax, DWORD PTR _INTSELBASE$[ebp]
	push	eax
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetISR@AOAProtected@@QAEHJJK@Z	; AOAProtected::AOAsetISR
; Line 534
	jmp	SHORT $L2038
$L2039:
; Line 535
	mov	DWORD PTR _i$[ebp], 120			; 00000078H
	jmp	SHORT $L2041
$L2042:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L2041:
	cmp	DWORD PTR _i$[ebp], 234			; 000000eaH
	jg	SHORT $L2043
; Line 537
	mov	edx, DWORD PTR _this$[ebp]
	mov	eax, DWORD PTR [edx+12]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR [eax+ecx*4]
	push	edx
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	mov	ecx, DWORD PTR _INTSELBASE$[ebp]
	push	ecx
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetISR@AOAProtected@@QAEHJJK@Z	; AOAProtected::AOAsetISR
; Line 538
	jmp	SHORT $L2042
$L2043:
; Line 540
	mov	esp, ebp
	pop	ebp
	ret	0
?IntExceptionInit@IntException@@QAEXXZ ENDP		; IntException::IntExceptionInit
_io$ = -40
_ab1$ = -44
_xyz$ = -4
_abc1$ = -32
_first$ = -28
_abc2$ = 8
_this$ = -48
?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z PROC NEAR ; IntException::getFunctionPtr
; Line 545
	push	ebp
	mov	ebp, esp
	sub	esp, 48					; 00000030H
	mov	DWORD PTR _this$[ebp], ecx
; Line 548
	lea	ecx, DWORD PTR _io$[ebp]
	call	??0AOAProtected@@QAE@XZ			; AOAProtected::AOAProtected
; Line 553
	lea	ecx, DWORD PTR _first$[ebp]
	call	??0IntException@@QAE@XZ			; IntException::IntException
; Line 554
	lea	eax, DWORD PTR _first$[ebp]
	mov	DWORD PTR _xyz$[ebp], eax
; Line 555
	mov	ecx, DWORD PTR _abc2$[ebp]
	mov	DWORD PTR _abc1$[ebp], ecx
; Line 556
	mov	edx, DWORD PTR _xyz$[ebp]
	sub	edx, 4
	mov	DWORD PTR _xyz$[ebp], edx
; Line 557
	mov	eax, DWORD PTR _xyz$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _ab1$[ebp], ecx
; Line 558
	mov	eax, DWORD PTR _ab1$[ebp]
; Line 559
	mov	esp, ebp
	pop	ebp
	ret	4
?getFunctionPtr@IntException@@QAEPAJP81@AEXJ@Z@Z ENDP	; IntException::getFunctionPtr
_TEXT	ENDS
EXTRN	?AOAgetCharacter@AOAProtected@@QAEDXZ:NEAR	; AOAProtected::AOAgetCharacter
EXTRN	?AOAcliTimer@AOAProtected@@QAEXXZ:NEAR		; AOAProtected::AOAcliTimer
EXTRN	?AOAPrintText@AOAProtected@@QAEXPADHH@Z:NEAR	; AOAProtected::AOAPrintText
EXTRN	?AOAISRExit@AOAProtected@@QAEXXZ:NEAR		; AOAProtected::AOAISRExit
EXTRN	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z:NEAR	; AOAProtected::AOAsetSharedMem
_DATA	SEGMENT
$SG2062	DB	'Divide by Zero Exception: 000', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException000@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException000
; Line 562
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 564
	cli
; Line 566
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 568
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2062
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 569
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 570
	int	8
; Line 571
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 572
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 573
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException000@IntException@@QAEXJ@Z ENDP		; IntException::IntException000
_TEXT	ENDS
EXTRN	??0AOATask@@QAE@XZ:NEAR				; AOATask::AOATask
_DATA	SEGMENT
	ORG $+2
$SG2069	DB	'Debug Exception:              001', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -56
_task$ = -52
?IntException001@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException001
; Line 576
	push	ebp
	mov	ebp, esp
	sub	esp, 56					; 00000038H
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 577
	lea	ecx, DWORD PTR _task$[ebp]
	call	??0AOATask@@QAE@XZ			; AOATask::AOATask
; Line 581
	cli
; Line 583
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 585
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2069
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 586
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 588
	int	8
; Line 589
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 590
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 591
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException001@IntException@@QAEXJ@Z ENDP		; IntException::IntException001
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+2
$SG2074	DB	'NMI Interrupt: 002', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException002@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException002
; Line 594
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 596
	cli
; Line 598
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 599
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2074
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 600
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 601
	int	8
; Line 602
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 603
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 604
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException002@IntException@@QAEXJ@Z ENDP		; IntException::IntException002
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2079	DB	'Breakpoint Exception: 003', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException003@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException003
; Line 608
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 610
	cli
; Line 612
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 613
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2079
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 614
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 615
	int	8
; Line 616
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 617
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 618
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException003@IntException@@QAEXJ@Z ENDP		; IntException::IntException003
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+2
$SG2084	DB	'Overflow Exception: 004', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException004@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException004
; Line 621
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 623
	cli
; Line 625
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 626
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2084
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 627
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 628
	int	8
; Line 629
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 630
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 631
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException004@IntException@@QAEXJ@Z ENDP		; IntException::IntException004
_TEXT	ENDS
_DATA	SEGMENT
$SG2089	DB	'Bound Range Exceeded Exception: 005', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException005@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException005
; Line 634
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 637
	cli
; Line 639
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 640
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2089
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 641
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 642
	int	8
; Line 643
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 644
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 645
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException005@IntException@@QAEXJ@Z ENDP		; IntException::IntException005
_TEXT	ENDS
_DATA	SEGMENT
$SG2096	DB	'Invalid Opcode Exception: 006', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -12
?IntException006@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException006
; Line 648
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 652
	cli
; Line 654
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 655
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2096
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 656
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 657
	int	8
; Line 667
	sti
; Line 668
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 669
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 670
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException006@IntException@@QAEXJ@Z ENDP		; IntException::IntException006
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+2
$SG2101	DB	'Divide not available exception: 007', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException007@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException007
; Line 673
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 674
	cli
; Line 675
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 676
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2101
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 677
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 678
	int	8
; Line 679
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 680
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 681
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException007@IntException@@QAEXJ@Z ENDP		; IntException::IntException007
_TEXT	ENDS
_DATA	SEGMENT
$SG2106	DB	'Invalid TSS Exception: 010', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException010@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException010
; Line 684
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 685
	cli
; Line 686
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 687
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2106
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 688
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 689
	int	8
; Line 692
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException010@IntException@@QAEXJ@Z ENDP		; IntException::IntException010
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2111	DB	'Segment Not Present Exception: 011', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException011@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException011
; Line 695
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 696
	cli
; Line 697
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 698
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2111
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 699
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 700
	int	8
; Line 701
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 702
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 703
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException011@IntException@@QAEXJ@Z ENDP		; IntException::IntException011
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2116	DB	'Stack Fault Exception: 012', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException012@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException012
; Line 706
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 707
	cli
; Line 708
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 709
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2116
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 710
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 711
	int	8
; Line 712
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 713
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 714
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException012@IntException@@QAEXJ@Z ENDP		; IntException::IntException012
_TEXT	ENDS
EXTRN	?AOAPrintText@AOAProtected@@QAEXPADH@Z:NEAR	; AOAProtected::AOAPrintText
_DATA	SEGMENT
	ORG $+1
$SG2121	DB	'General Protection Exception: 013', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException013@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException013
; Line 717
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 726
	cli
; Line 727
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 728
	push	3680					; 00000e60H
	push	OFFSET FLAT:$SG2121
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADH@Z	; AOAProtected::AOAPrintText
; Line 729
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 730
	int	8
; Line 731
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 732
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException013@IntException@@QAEXJ@Z ENDP		; IntException::IntException013
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+2
$SG2126	DB	'Floating point Error Exception: 016', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException016@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException016
; Line 735
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 736
	cli
; Line 737
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 738
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2126
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 739
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 740
	int	8
; Line 741
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 742
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 743
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException016@IntException@@QAEXJ@Z ENDP		; IntException::IntException016
_TEXT	ENDS
_DATA	SEGMENT
$SG2131	DB	'Alignment Check Exception: 017', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException017@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException017
; Line 746
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 747
	cli
; Line 748
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 749
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2131
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 750
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 751
	int	8
; Line 752
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 753
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 754
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException017@IntException@@QAEXJ@Z ENDP		; IntException::IntException017
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2136	DB	'Machine Check Exception: 018', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException018@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException018
; Line 757
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 758
	cli
; Line 759
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 760
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2136
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 761
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 762
	int	8
; Line 763
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 764
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 765
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException018@IntException@@QAEXJ@Z ENDP		; IntException::IntException018
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+3
$SG2141	DB	'SIMD Floating Point Exception: 019', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException019@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException019
; Line 768
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 769
	cli
; Line 770
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 771
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2141
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 772
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 773
	int	8
; Line 774
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 775
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 776
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException019@IntException@@QAEXJ@Z ENDP		; IntException::IntException019
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2146	DB	'This is in InterruptException ISR: 020', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException020@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException020
; Line 779
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 780
	cli
; Line 781
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 782
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2146
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 783
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 784
	int	8
; Line 785
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 786
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 787
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException020@IntException@@QAEXJ@Z ENDP		; IntException::IntException020
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2151	DB	'This is in InterruptException ISR: 021', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException021@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException021
; Line 790
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 791
	cli
; Line 792
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 793
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2151
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 794
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 795
	int	8
; Line 796
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 797
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 798
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException021@IntException@@QAEXJ@Z ENDP		; IntException::IntException021
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2156	DB	'This is in InterruptException ISR: 022', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException022@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException022
; Line 801
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 802
	cli
; Line 803
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 804
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2156
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 805
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 806
	int	8
; Line 807
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 808
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 809
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException022@IntException@@QAEXJ@Z ENDP		; IntException::IntException022
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2161	DB	'This is in InterruptException ISR: 023', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException023@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException023
; Line 812
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 813
	cli
; Line 814
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 815
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2161
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 816
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 817
	int	8
; Line 818
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 819
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 820
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException023@IntException@@QAEXJ@Z ENDP		; IntException::IntException023
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2166	DB	'This is in InterruptException ISR: 024', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException024@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException024
; Line 823
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 824
	cli
; Line 825
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 826
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2166
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 827
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 828
	int	8
; Line 829
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 830
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 831
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException024@IntException@@QAEXJ@Z ENDP		; IntException::IntException024
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2171	DB	'This is in InterruptException ISR: 025', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException025@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException025
; Line 834
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 835
	cli
; Line 836
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 837
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2171
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 838
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 839
	int	8
; Line 840
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 841
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 842
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException025@IntException@@QAEXJ@Z ENDP		; IntException::IntException025
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2176	DB	'This is in InterruptException ISR: 026', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException026@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException026
; Line 845
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 846
	cli
; Line 847
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 848
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2176
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 849
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 850
	int	8
; Line 851
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 852
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 853
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException026@IntException@@QAEXJ@Z ENDP		; IntException::IntException026
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2181	DB	'This is in InterruptException ISR: 027', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException027@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException027
; Line 856
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 857
	cli
; Line 858
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 859
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2181
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 860
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 861
	int	8
; Line 862
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 863
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 864
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException027@IntException@@QAEXJ@Z ENDP		; IntException::IntException027
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2186	DB	'This is in InterruptException ISR: 028', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException028@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException028
; Line 867
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 868
	cli
; Line 869
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 870
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2186
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 871
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 872
	int	8
; Line 873
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 874
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 875
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException028@IntException@@QAEXJ@Z ENDP		; IntException::IntException028
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2191	DB	'This is in InterruptException ISR: 029', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException029@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException029
; Line 878
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 879
	cli
; Line 880
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 881
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2191
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 882
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 883
	int	8
; Line 884
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 885
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 886
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException029@IntException@@QAEXJ@Z ENDP		; IntException::IntException029
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2196	DB	'This is in InterruptException ISR: 030', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException030@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException030
; Line 889
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 890
	cli
; Line 891
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 892
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2196
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 893
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 894
	int	8
; Line 895
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 896
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 897
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException030@IntException@@QAEXJ@Z ENDP		; IntException::IntException030
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2201	DB	'This is in InterruptException ISR: 031', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException031@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException031
; Line 900
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 901
	cli
; Line 902
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 903
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2201
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 904
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 905
	int	8
; Line 906
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 907
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 908
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException031@IntException@@QAEXJ@Z ENDP		; IntException::IntException031
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2206	DB	'This is in InterruptException ISR: 032', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException032@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException032
; Line 911
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 912
	cli
; Line 913
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 914
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2206
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 915
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 916
	int	8
; Line 917
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 918
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 919
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException032@IntException@@QAEXJ@Z ENDP		; IntException::IntException032
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2211	DB	'This is in InterruptException ISR: 033', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException033@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException033
; Line 922
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 923
	cli
; Line 924
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 925
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2211
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 926
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 927
	int	8
; Line 928
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 929
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 930
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException033@IntException@@QAEXJ@Z ENDP		; IntException::IntException033
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2216	DB	'This is in InterruptException ISR: 034', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException034@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException034
; Line 933
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 934
	cli
; Line 935
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 936
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2216
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 937
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 938
	int	8
; Line 939
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 940
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 941
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException034@IntException@@QAEXJ@Z ENDP		; IntException::IntException034
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2221	DB	'This is in InterruptException ISR: 035', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException035@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException035
; Line 944
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 945
	cli
; Line 946
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 947
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2221
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 948
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 949
	int	8
; Line 950
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 951
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 952
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException035@IntException@@QAEXJ@Z ENDP		; IntException::IntException035
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2226	DB	'This is in InterruptException ISR: 036', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException036@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException036
; Line 955
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 956
	cli
; Line 957
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 958
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2226
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 959
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 960
	int	8
; Line 961
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 962
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 963
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException036@IntException@@QAEXJ@Z ENDP		; IntException::IntException036
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2231	DB	'This is in InterruptException ISR: 037', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException037@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException037
; Line 966
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 967
	cli
; Line 968
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 969
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2231
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 970
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 971
	int	8
; Line 972
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 973
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 974
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException037@IntException@@QAEXJ@Z ENDP		; IntException::IntException037
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2236	DB	'This is in InterruptException ISR: 038', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException038@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException038
; Line 977
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 978
	cli
; Line 979
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 980
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2236
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 981
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 982
	int	8
; Line 983
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 984
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 985
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException038@IntException@@QAEXJ@Z ENDP		; IntException::IntException038
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2241	DB	'This is in InterruptException ISR: 039', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException039@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException039
; Line 988
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 989
	cli
; Line 990
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 991
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2241
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 992
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 993
	int	8
; Line 994
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 995
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 996
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException039@IntException@@QAEXJ@Z ENDP		; IntException::IntException039
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2246	DB	'This is in InterruptException ISR: 040', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException040@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException040
; Line 999
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1000
	cli
; Line 1001
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 1002
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2246
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 1003
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 1004
	int	8
; Line 1005
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 1006
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 1007
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException040@IntException@@QAEXJ@Z ENDP		; IntException::IntException040
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2251	DB	'This is in InterruptException ISR: 041', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException041@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException041
; Line 1010
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1011
	cli
; Line 1012
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 1013
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2251
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 1014
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 1015
	int	8
; Line 1016
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 1017
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 1018
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException041@IntException@@QAEXJ@Z ENDP		; IntException::IntException041
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2256	DB	'This is in InterruptException ISR: 042', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException042@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException042
; Line 1021
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1022
	cli
; Line 1023
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 1024
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2256
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 1025
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 1026
	int	8
; Line 1027
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 1028
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 1029
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException042@IntException@@QAEXJ@Z ENDP		; IntException::IntException042
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2261	DB	'This is in InterruptException ISR: 043', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException043@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException043
; Line 1032
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1033
	cli
; Line 1034
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 1035
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2261
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 1036
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 1037
	int	8
; Line 1038
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 1039
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 1040
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException043@IntException@@QAEXJ@Z ENDP		; IntException::IntException043
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2266	DB	'This is in InterruptException ISR: 044', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException044@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException044
; Line 1043
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1044
	cli
; Line 1045
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 1046
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2266
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 1047
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 1048
	int	8
; Line 1049
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 1050
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 1051
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException044@IntException@@QAEXJ@Z ENDP		; IntException::IntException044
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2271	DB	'This is in InterruptException ISR: 045', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException045@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException045
; Line 1054
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1055
	cli
; Line 1056
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 1057
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2271
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 1058
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 1059
	int	8
; Line 1060
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 1061
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 1062
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException045@IntException@@QAEXJ@Z ENDP		; IntException::IntException045
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2276	DB	'This is in InterruptException ISR: 046', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException046@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException046
; Line 1065
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1066
	cli
; Line 1067
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 1068
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2276
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 1069
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 1070
	int	8
; Line 1071
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 1072
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 1073
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException046@IntException@@QAEXJ@Z ENDP		; IntException::IntException046
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2281	DB	'This is in InterruptException ISR: 047', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException047@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException047
; Line 1076
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1077
	cli
; Line 1078
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 1079
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2281
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 1080
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 1081
	int	8
; Line 1082
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 1083
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 1084
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException047@IntException@@QAEXJ@Z ENDP		; IntException::IntException047
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2286	DB	'This is in InterruptException ISR: 048', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException048@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException048
; Line 1087
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1088
	cli
; Line 1089
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 1090
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2286
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 1091
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 1092
	int	8
; Line 1093
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 1094
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 1095
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException048@IntException@@QAEXJ@Z ENDP		; IntException::IntException048
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2291	DB	'This is in InterruptException ISR: 049', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException049@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException049
; Line 1098
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1099
	cli
; Line 1100
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 1101
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2291
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 1102
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 1103
	int	8
; Line 1104
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 1105
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 1106
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException049@IntException@@QAEXJ@Z ENDP		; IntException::IntException049
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2296	DB	'This is in InterruptException ISR: 050', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException050@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException050
; Line 1109
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1110
	cli
; Line 1111
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 1112
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2296
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 1113
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 1114
	int	8
; Line 1115
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 1116
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 1117
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException050@IntException@@QAEXJ@Z ENDP		; IntException::IntException050
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2301	DB	'This is in InterruptException ISR: 051', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException051@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException051
; Line 1120
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1121
	cli
; Line 1122
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 1123
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2301
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 1124
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 1125
	int	8
; Line 1126
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 1127
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 1128
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException051@IntException@@QAEXJ@Z ENDP		; IntException::IntException051
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2306	DB	'This is in InterruptException ISR: 052', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException052@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException052
; Line 1131
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1132
	cli
; Line 1133
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 1134
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2306
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 1135
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 1136
	int	8
; Line 1137
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 1138
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 1139
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException052@IntException@@QAEXJ@Z ENDP		; IntException::IntException052
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2311	DB	'This is in InterruptException ISR: 053', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException053@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException053
; Line 1142
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1143
	cli
; Line 1144
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 1145
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2311
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 1146
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 1147
	int	8
; Line 1148
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 1149
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 1150
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException053@IntException@@QAEXJ@Z ENDP		; IntException::IntException053
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2316	DB	'This is in InterruptException ISR: 054', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException054@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException054
; Line 1153
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1154
	cli
; Line 1155
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 1156
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2316
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 1157
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 1158
	int	8
; Line 1159
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 1160
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 1161
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException054@IntException@@QAEXJ@Z ENDP		; IntException::IntException054
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2321	DB	'This is in InterruptException ISR: 055', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException055@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException055
; Line 1164
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1165
	cli
; Line 1166
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 1167
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2321
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 1168
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 1169
	int	8
; Line 1170
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 1171
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 1172
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException055@IntException@@QAEXJ@Z ENDP		; IntException::IntException055
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2326	DB	'This is in InterruptException ISR: 056', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException056@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException056
; Line 1175
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1176
	cli
; Line 1177
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 1178
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2326
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 1179
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 1180
	int	8
; Line 1181
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 1182
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 1183
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException056@IntException@@QAEXJ@Z ENDP		; IntException::IntException056
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2331	DB	'This is in InterruptException ISR: 057', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException057@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException057
; Line 1186
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1187
	cli
; Line 1188
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 1189
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2331
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 1190
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 1191
	int	8
; Line 1192
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 1193
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 1194
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException057@IntException@@QAEXJ@Z ENDP		; IntException::IntException057
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2336	DB	'This is in InterruptException ISR: 058', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException058@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException058
; Line 1197
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1198
	cli
; Line 1199
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 1200
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2336
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 1201
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 1202
	int	8
; Line 1203
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 1204
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 1205
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException058@IntException@@QAEXJ@Z ENDP		; IntException::IntException058
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2341	DB	'This is in InterruptException ISR: 059', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException059@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException059
; Line 1208
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1209
	cli
; Line 1210
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 1211
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2341
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 1212
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 1213
	int	8
; Line 1214
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 1215
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 1216
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException059@IntException@@QAEXJ@Z ENDP		; IntException::IntException059
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2346	DB	'This is in InterruptException ISR: 060', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException060@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException060
; Line 1219
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1220
	cli
; Line 1221
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 1222
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2346
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 1223
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 1224
	int	8
; Line 1225
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 1226
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 1227
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException060@IntException@@QAEXJ@Z ENDP		; IntException::IntException060
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2351	DB	'This is in InterruptException ISR: 061', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException061@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException061
; Line 1230
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1231
	cli
; Line 1232
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 1233
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2351
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 1234
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 1235
	int	8
; Line 1236
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 1237
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 1238
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException061@IntException@@QAEXJ@Z ENDP		; IntException::IntException061
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2356	DB	'This is in InterruptException ISR: 062', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException062@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException062
; Line 1241
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1242
	cli
; Line 1243
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 1244
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2356
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 1245
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 1246
	int	8
; Line 1247
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 1248
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 1249
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException062@IntException@@QAEXJ@Z ENDP		; IntException::IntException062
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2361	DB	'This is in InterruptException ISR: 063', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException063@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException063
; Line 1252
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1253
	cli
; Line 1254
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 1255
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2361
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 1256
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 1257
	int	8
; Line 1258
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 1259
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 1260
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException063@IntException@@QAEXJ@Z ENDP		; IntException::IntException063
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2366	DB	'This is in InterruptException ISR: 064', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException064@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException064
; Line 1263
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1264
	cli
; Line 1265
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 1266
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2366
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 1267
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 1268
	int	8
; Line 1269
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 1270
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 1271
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException064@IntException@@QAEXJ@Z ENDP		; IntException::IntException064
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2371	DB	'This is in InterruptException ISR: 065', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException065@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException065
; Line 1274
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1275
	cli
; Line 1276
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 1277
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2371
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 1278
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 1279
	int	8
; Line 1280
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 1281
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 1282
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException065@IntException@@QAEXJ@Z ENDP		; IntException::IntException065
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2376	DB	'This is in InterruptException ISR: 066', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException066@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException066
; Line 1285
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1286
	cli
; Line 1287
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 1288
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2376
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 1289
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 1290
	int	8
; Line 1291
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 1292
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 1293
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException066@IntException@@QAEXJ@Z ENDP		; IntException::IntException066
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2381	DB	'This is in InterruptException ISR: 067', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException067@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException067
; Line 1296
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1297
	cli
; Line 1298
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 1299
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2381
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 1300
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 1301
	int	8
; Line 1302
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 1303
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 1304
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException067@IntException@@QAEXJ@Z ENDP		; IntException::IntException067
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2386	DB	'This is in InterruptException ISR: 068', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException068@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException068
; Line 1307
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1308
	cli
; Line 1309
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 1310
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2386
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 1311
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 1312
	int	8
; Line 1313
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 1314
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 1315
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException068@IntException@@QAEXJ@Z ENDP		; IntException::IntException068
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2391	DB	'This is in InterruptException ISR: 069', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException069@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException069
; Line 1318
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1319
	cli
; Line 1320
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 1321
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2391
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 1322
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 1323
	int	8
; Line 1324
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 1325
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 1326
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException069@IntException@@QAEXJ@Z ENDP		; IntException::IntException069
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2396	DB	'This is in InterruptException ISR: 070', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException070@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException070
; Line 1329
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1330
	cli
; Line 1331
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 1332
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2396
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 1333
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 1334
	int	8
; Line 1335
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 1336
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 1337
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException070@IntException@@QAEXJ@Z ENDP		; IntException::IntException070
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2401	DB	'This is in InterruptException ISR: 071', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException071@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException071
; Line 1340
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1341
	cli
; Line 1342
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 1343
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2401
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 1344
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 1345
	int	8
; Line 1346
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 1347
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 1348
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException071@IntException@@QAEXJ@Z ENDP		; IntException::IntException071
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2406	DB	'This is in InterruptException ISR: 072', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException072@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException072
; Line 1352
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1353
	cli
; Line 1354
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 1355
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2406
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 1356
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 1357
	int	8
; Line 1358
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 1359
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 1360
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException072@IntException@@QAEXJ@Z ENDP		; IntException::IntException072
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2411	DB	'This is in InterruptException ISR: 073', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException073@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException073
; Line 1363
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1364
	cli
; Line 1365
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 1366
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2411
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 1367
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 1368
	int	8
; Line 1369
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 1370
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 1371
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException073@IntException@@QAEXJ@Z ENDP		; IntException::IntException073
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2416	DB	'This is in InterruptException ISR: 074', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException074@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException074
; Line 1374
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1375
	cli
; Line 1376
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 1377
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2416
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 1378
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 1379
	int	8
; Line 1380
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 1381
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 1382
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException074@IntException@@QAEXJ@Z ENDP		; IntException::IntException074
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2421	DB	'This is in InterruptException ISR: 075', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException075@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException075
; Line 1385
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1386
	cli
; Line 1387
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 1388
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2421
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 1389
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 1390
	int	8
; Line 1391
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 1392
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 1393
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException075@IntException@@QAEXJ@Z ENDP		; IntException::IntException075
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2426	DB	'This is in InterruptException ISR: 076', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException076@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException076
; Line 1396
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1397
	cli
; Line 1398
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 1399
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2426
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 1400
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 1401
	int	8
; Line 1402
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 1403
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 1404
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException076@IntException@@QAEXJ@Z ENDP		; IntException::IntException076
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2431	DB	'This is in InterruptException ISR: 077', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException077@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException077
; Line 1407
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1408
	cli
; Line 1409
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 1410
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2431
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 1411
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 1412
	int	8
; Line 1413
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 1414
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 1415
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException077@IntException@@QAEXJ@Z ENDP		; IntException::IntException077
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2436	DB	'This is in InterruptException ISR: 078', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException078@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException078
; Line 1418
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1419
	cli
; Line 1420
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 1421
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2436
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 1422
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 1423
	int	8
; Line 1424
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 1425
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 1426
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException078@IntException@@QAEXJ@Z ENDP		; IntException::IntException078
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2441	DB	'This is in InterruptException ISR: 079', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException079@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException079
; Line 1429
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1430
	cli
; Line 1431
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 1432
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2441
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 1433
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 1434
	int	8
; Line 1435
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 1436
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 1437
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException079@IntException@@QAEXJ@Z ENDP		; IntException::IntException079
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2446	DB	'This is in InterruptException ISR: 080', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException080@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException080
; Line 1440
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1441
	cli
; Line 1442
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 1443
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2446
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 1444
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 1445
	int	8
; Line 1446
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 1447
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 1448
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException080@IntException@@QAEXJ@Z ENDP		; IntException::IntException080
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2451	DB	'This is in InterruptException ISR: 081', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException081@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException081
; Line 1451
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1452
	cli
; Line 1453
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 1454
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2451
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 1455
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 1456
	int	8
; Line 1457
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 1458
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 1459
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException081@IntException@@QAEXJ@Z ENDP		; IntException::IntException081
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2456	DB	'This is in InterruptException ISR: 082', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException082@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException082
; Line 1462
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1463
	cli
; Line 1464
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 1465
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2456
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 1466
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 1467
	int	8
; Line 1468
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 1469
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 1470
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException082@IntException@@QAEXJ@Z ENDP		; IntException::IntException082
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2461	DB	'This is in InterruptException ISR: 083', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException083@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException083
; Line 1473
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1474
	cli
; Line 1475
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 1476
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2461
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 1477
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 1478
	int	8
; Line 1479
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 1480
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 1481
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException083@IntException@@QAEXJ@Z ENDP		; IntException::IntException083
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2466	DB	'This is in InterruptException ISR: 084', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException084@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException084
; Line 1484
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1485
	cli
; Line 1486
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 1487
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2466
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 1488
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 1489
	int	8
; Line 1490
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 1491
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 1492
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException084@IntException@@QAEXJ@Z ENDP		; IntException::IntException084
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2471	DB	'This is in InterruptException ISR: 085', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException085@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException085
; Line 1495
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1496
	cli
; Line 1497
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 1498
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2471
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 1499
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 1500
	int	8
; Line 1501
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 1502
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 1503
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException085@IntException@@QAEXJ@Z ENDP		; IntException::IntException085
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2476	DB	'This is in InterruptException ISR: 086', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException086@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException086
; Line 1506
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1507
	cli
; Line 1508
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 1509
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2476
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 1510
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 1511
	int	8
; Line 1512
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 1513
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 1514
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException086@IntException@@QAEXJ@Z ENDP		; IntException::IntException086
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2481	DB	'This is in InterruptException ISR: 087', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException087@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException087
; Line 1517
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1518
	cli
; Line 1519
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 1520
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2481
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 1521
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 1522
	int	8
; Line 1523
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 1524
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 1525
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException087@IntException@@QAEXJ@Z ENDP		; IntException::IntException087
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2486	DB	'This is in InterruptException ISR: 088', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException088@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException088
; Line 1528
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1529
	cli
; Line 1530
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 1531
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2486
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 1532
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 1533
	int	8
; Line 1534
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 1535
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 1536
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException088@IntException@@QAEXJ@Z ENDP		; IntException::IntException088
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2491	DB	'This is in InterruptException ISR: 089', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException089@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException089
; Line 1539
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1540
	cli
; Line 1541
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 1542
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2491
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 1543
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 1544
	int	8
; Line 1545
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 1546
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 1547
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException089@IntException@@QAEXJ@Z ENDP		; IntException::IntException089
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2496	DB	'This is in InterruptException ISR: 090', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException090@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException090
; Line 1550
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1551
	cli
; Line 1552
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 1553
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2496
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 1554
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 1555
	int	8
; Line 1556
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 1557
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 1558
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException090@IntException@@QAEXJ@Z ENDP		; IntException::IntException090
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2501	DB	'This is in InterruptException ISR: 091', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException091@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException091
; Line 1561
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1562
	cli
; Line 1563
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 1564
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2501
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 1565
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 1566
	int	8
; Line 1567
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 1568
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 1569
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException091@IntException@@QAEXJ@Z ENDP		; IntException::IntException091
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2506	DB	'This is in InterruptException ISR: 092', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException092@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException092
; Line 1572
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1573
	cli
; Line 1574
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 1575
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2506
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 1576
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 1577
	int	8
; Line 1578
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 1579
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 1580
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException092@IntException@@QAEXJ@Z ENDP		; IntException::IntException092
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2511	DB	'This is in InterruptException ISR: 093', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException093@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException093
; Line 1583
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1584
	cli
; Line 1585
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 1586
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2511
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 1587
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 1588
	int	8
; Line 1589
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 1590
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 1591
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException093@IntException@@QAEXJ@Z ENDP		; IntException::IntException093
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2516	DB	'This is in InterruptException ISR: 0r4', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException094@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException094
; Line 1594
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1595
	cli
; Line 1596
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 1597
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2516
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 1598
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 1599
	int	8
; Line 1600
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 1601
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 1602
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException094@IntException@@QAEXJ@Z ENDP		; IntException::IntException094
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2521	DB	'This is in InterruptException ISR: 095', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException095@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException095
; Line 1605
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1606
	cli
; Line 1607
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 1608
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2521
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 1609
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 1610
	int	8
; Line 1611
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 1612
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 1613
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException095@IntException@@QAEXJ@Z ENDP		; IntException::IntException095
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2526	DB	'This is in InterruptException ISR: 096', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException096@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException096
; Line 1616
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1617
	cli
; Line 1618
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 1619
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2526
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 1620
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 1621
	int	8
; Line 1622
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 1623
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 1624
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException096@IntException@@QAEXJ@Z ENDP		; IntException::IntException096
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2531	DB	'This is in InterruptException ISR: 097', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException097@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException097
; Line 1627
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1628
	cli
; Line 1629
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 1630
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2531
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 1631
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 1632
	int	8
; Line 1633
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 1634
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 1635
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException097@IntException@@QAEXJ@Z ENDP		; IntException::IntException097
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2536	DB	'This is in InterruptException ISR: 098', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException098@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException098
; Line 1638
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1639
	cli
; Line 1640
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 1641
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2536
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 1642
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 1643
	int	8
; Line 1644
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 1645
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 1646
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException098@IntException@@QAEXJ@Z ENDP		; IntException::IntException098
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2541	DB	'This is in InterruptException ISR: 099', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException099@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException099
; Line 1649
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1650
	cli
; Line 1651
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 1652
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2541
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 1653
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 1654
	int	8
; Line 1655
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 1656
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 1657
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException099@IntException@@QAEXJ@Z ENDP		; IntException::IntException099
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2546	DB	'This is in InterruptException ISR: 100', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException100@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException100
; Line 1660
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1661
	cli
; Line 1662
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 1663
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2546
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 1664
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 1665
	int	8
; Line 1666
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 1667
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 1668
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException100@IntException@@QAEXJ@Z ENDP		; IntException::IntException100
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2551	DB	'This is in InterruptException ISR: 101', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException101@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException101
; Line 1671
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1672
	cli
; Line 1673
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 1674
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2551
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 1675
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 1676
	int	8
; Line 1677
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 1678
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 1679
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException101@IntException@@QAEXJ@Z ENDP		; IntException::IntException101
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2556	DB	'This is in InterruptException ISR: 102', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException102@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException102
; Line 1682
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1683
	cli
; Line 1684
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 1685
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2556
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 1686
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 1687
	int	8
; Line 1688
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 1689
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 1690
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException102@IntException@@QAEXJ@Z ENDP		; IntException::IntException102
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2561	DB	'This is in InterruptException ISR: 103', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException103@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException103
; Line 1693
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1694
	cli
; Line 1695
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 1696
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2561
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 1697
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 1698
	int	8
; Line 1699
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 1700
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 1701
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException103@IntException@@QAEXJ@Z ENDP		; IntException::IntException103
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2566	DB	'This is in InterruptException ISR: 104', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException104@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException104
; Line 1704
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1705
	cli
; Line 1706
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 1707
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2566
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 1708
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 1709
	int	8
; Line 1710
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 1711
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 1712
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException104@IntException@@QAEXJ@Z ENDP		; IntException::IntException104
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2571	DB	'This is in InterruptException ISR: 105', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException105@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException105
; Line 1715
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1716
	cli
; Line 1717
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 1718
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2571
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 1719
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 1720
	int	8
; Line 1721
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 1722
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 1723
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException105@IntException@@QAEXJ@Z ENDP		; IntException::IntException105
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2576	DB	'This is in InterruptException ISR: 106', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException106@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException106
; Line 1726
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1727
	cli
; Line 1728
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 1729
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2576
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 1730
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 1731
	int	8
; Line 1732
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 1733
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 1734
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException106@IntException@@QAEXJ@Z ENDP		; IntException::IntException106
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2581	DB	'This is in InterruptException ISR: 107', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException107@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException107
; Line 1737
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1738
	cli
; Line 1739
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 1740
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2581
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 1741
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 1742
	int	8
; Line 1743
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 1744
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 1745
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException107@IntException@@QAEXJ@Z ENDP		; IntException::IntException107
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2586	DB	'This is in InterruptException ISR: 108', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException108@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException108
; Line 1748
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1749
	cli
; Line 1750
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 1751
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2586
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 1752
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 1753
	int	8
; Line 1754
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 1755
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 1756
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException108@IntException@@QAEXJ@Z ENDP		; IntException::IntException108
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2591	DB	'This is in InterruptException ISR: 109', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException109@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException109
; Line 1759
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1760
	cli
; Line 1761
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 1762
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2591
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 1763
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 1764
	int	8
; Line 1765
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 1766
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 1767
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException109@IntException@@QAEXJ@Z ENDP		; IntException::IntException109
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2596	DB	'This is in InterruptException ISR: 110', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException110@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException110
; Line 1770
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1771
	cli
; Line 1772
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 1773
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2596
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 1774
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 1775
	int	8
; Line 1776
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 1777
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 1778
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException110@IntException@@QAEXJ@Z ENDP		; IntException::IntException110
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2601	DB	'This is in InterruptException ISR: 111', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException111@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException111
; Line 1781
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1782
	cli
; Line 1783
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 1784
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2601
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 1785
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 1786
	int	8
; Line 1787
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 1788
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 1789
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException111@IntException@@QAEXJ@Z ENDP		; IntException::IntException111
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2606	DB	'Real Time Clock Interrupt: 112', 00H
	ORG $+1
$SG2607	DB	' OKKKK : 112', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException112@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException112
; Line 1792
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1793
	cli
; Line 1794
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 1795
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2606
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 1796
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 1797
	int	8
; Line 1798
	push	81					; 00000051H
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2607
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 1799
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 1800
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 1801
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException112@IntException@@QAEXJ@Z ENDP		; IntException::IntException112
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+3
$SG2612	DB	'This is in InterruptException ISR: 113', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException113@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException113
; Line 1804
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1805
	cli
; Line 1806
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 1807
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2612
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 1808
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 1809
	int	8
; Line 1810
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 1811
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 1812
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException113@IntException@@QAEXJ@Z ENDP		; IntException::IntException113
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2617	DB	'This is in InterruptException ISR: 114', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException114@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException114
; Line 1815
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1816
	cli
; Line 1817
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 1818
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2617
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 1819
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 1820
	int	8
; Line 1821
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 1822
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 1823
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException114@IntException@@QAEXJ@Z ENDP		; IntException::IntException114
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2622	DB	'This is in InterruptException ISR: 115', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException115@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException115
; Line 1826
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1827
	cli
; Line 1828
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 1829
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2622
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 1830
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 1831
	int	8
; Line 1832
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 1853
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 1854
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException115@IntException@@QAEXJ@Z ENDP		; IntException::IntException115
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2627	DB	'This is in InterruptException ISR: 116', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException116@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException116
; Line 1857
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1858
	cli
; Line 1859
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 1860
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2627
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 1861
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 1862
	int	8
; Line 1863
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 1864
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 1865
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException116@IntException@@QAEXJ@Z ENDP		; IntException::IntException116
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2632	DB	'This is in InterruptException ISR: 117', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException117@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException117
; Line 1868
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1869
	cli
; Line 1870
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 1871
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2632
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 1872
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 1873
	int	8
; Line 1874
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 1875
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 1876
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException117@IntException@@QAEXJ@Z ENDP		; IntException::IntException117
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2637	DB	'This is in InterruptException ISR: 118', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException118@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException118
; Line 1879
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1880
	cli
; Line 1881
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 1882
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2637
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 1883
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 1884
	int	8
; Line 1885
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 1886
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 1887
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException118@IntException@@QAEXJ@Z ENDP		; IntException::IntException118
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2642	DB	'This is in InterruptException ISR: 120', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException120@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException120
; Line 1890
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1891
	cli
; Line 1892
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 1893
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2642
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 1894
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 1895
	int	8
; Line 1896
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 1897
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 1898
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException120@IntException@@QAEXJ@Z ENDP		; IntException::IntException120
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2647	DB	'This is in InterruptException ISR: 121', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException121@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException121
; Line 1901
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1902
	cli
; Line 1903
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 1904
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2647
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 1905
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 1906
	int	8
; Line 1907
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 1908
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 1909
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException121@IntException@@QAEXJ@Z ENDP		; IntException::IntException121
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2652	DB	'This is in InterruptException ISR: 122', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException122@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException122
; Line 1912
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1913
	cli
; Line 1914
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 1915
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2652
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 1916
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 1917
	int	8
; Line 1918
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 1919
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 1920
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException122@IntException@@QAEXJ@Z ENDP		; IntException::IntException122
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2657	DB	'This is in InterruptException ISR: 123', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException123@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException123
; Line 1923
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1924
	cli
; Line 1925
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 1926
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2657
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 1927
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 1928
	int	8
; Line 1929
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 1930
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 1931
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException123@IntException@@QAEXJ@Z ENDP		; IntException::IntException123
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2662	DB	'This is in InterruptException ISR: 124', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException124@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException124
; Line 1934
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1935
	cli
; Line 1936
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 1937
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2662
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 1938
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 1939
	int	8
; Line 1940
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 1941
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 1942
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException124@IntException@@QAEXJ@Z ENDP		; IntException::IntException124
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2667	DB	'This is in InterruptException ISR: 125', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException125@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException125
; Line 1945
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1946
	cli
; Line 1947
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 1948
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2667
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 1949
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 1950
	int	8
; Line 1951
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 1952
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 1953
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException125@IntException@@QAEXJ@Z ENDP		; IntException::IntException125
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2672	DB	'This is in InterruptException ISR: 126', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException126@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException126
; Line 1956
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1957
	cli
; Line 1958
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 1959
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2672
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 1960
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 1961
	int	8
; Line 1962
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 1963
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 1964
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException126@IntException@@QAEXJ@Z ENDP		; IntException::IntException126
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2677	DB	'This is in InterruptException ISR: 127', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException127@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException127
; Line 1967
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1968
	cli
; Line 1969
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 1970
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2677
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 1971
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 1972
	int	8
; Line 1973
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 1974
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 1975
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException127@IntException@@QAEXJ@Z ENDP		; IntException::IntException127
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2682	DB	'This is in InterruptException ISR: 128', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException128@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException128
; Line 1978
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1979
	cli
; Line 1980
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 1981
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2682
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 1982
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 1983
	int	8
; Line 1984
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 1985
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 1986
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException128@IntException@@QAEXJ@Z ENDP		; IntException::IntException128
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2687	DB	'This is in InterruptException ISR: 129', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException129@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException129
; Line 1989
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 1990
	cli
; Line 1991
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 1992
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2687
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 1993
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 1994
	int	8
; Line 1995
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 1996
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 1997
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException129@IntException@@QAEXJ@Z ENDP		; IntException::IntException129
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2692	DB	'This is in InterruptException ISR: 130', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException130@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException130
; Line 2000
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2001
	cli
; Line 2002
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 2003
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2692
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 2004
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 2005
	int	8
; Line 2006
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 2007
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 2008
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException130@IntException@@QAEXJ@Z ENDP		; IntException::IntException130
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2697	DB	'This is in InterruptException ISR: 131', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException131@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException131
; Line 2011
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2012
	cli
; Line 2013
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 2014
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2697
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 2015
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 2016
	int	8
; Line 2017
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 2018
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 2019
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException131@IntException@@QAEXJ@Z ENDP		; IntException::IntException131
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2702	DB	'This is in InterruptException ISR: 132', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException132@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException132
; Line 2022
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2023
	cli
; Line 2024
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 2025
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2702
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 2026
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 2027
	int	8
; Line 2028
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 2029
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 2030
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException132@IntException@@QAEXJ@Z ENDP		; IntException::IntException132
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2707	DB	'This is in InterruptException ISR: 133', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException133@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException133
; Line 2033
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2034
	cli
; Line 2035
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 2036
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2707
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 2037
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 2038
	int	8
; Line 2039
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 2040
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 2041
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException133@IntException@@QAEXJ@Z ENDP		; IntException::IntException133
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2712	DB	'This is in InterruptException ISR: 134', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException134@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException134
; Line 2044
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2045
	cli
; Line 2046
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 2047
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2712
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 2048
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 2049
	int	8
; Line 2050
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 2051
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 2052
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException134@IntException@@QAEXJ@Z ENDP		; IntException::IntException134
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2717	DB	'This is in InterruptException ISR: 135', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException135@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException135
; Line 2055
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2056
	cli
; Line 2057
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 2058
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2717
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 2059
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 2060
	int	8
; Line 2061
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 2062
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 2063
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException135@IntException@@QAEXJ@Z ENDP		; IntException::IntException135
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2722	DB	'This is in InterruptException ISR: 136', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException136@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException136
; Line 2066
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2067
	cli
; Line 2068
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 2069
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2722
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 2070
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 2071
	int	8
; Line 2072
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 2073
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 2074
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException136@IntException@@QAEXJ@Z ENDP		; IntException::IntException136
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2727	DB	'This is in InterruptException ISR: 137', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException137@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException137
; Line 2077
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2078
	cli
; Line 2079
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 2080
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2727
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 2081
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 2082
	int	8
; Line 2083
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 2084
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 2085
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException137@IntException@@QAEXJ@Z ENDP		; IntException::IntException137
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2732	DB	'This is in InterruptException ISR: 138', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException138@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException138
; Line 2088
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2089
	cli
; Line 2090
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 2091
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2732
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 2092
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 2093
	int	8
; Line 2094
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 2095
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 2096
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException138@IntException@@QAEXJ@Z ENDP		; IntException::IntException138
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2737	DB	'This is in InterruptException ISR: 139', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException139@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException139
; Line 2099
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2100
	cli
; Line 2101
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 2102
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2737
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 2103
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 2104
	int	8
; Line 2105
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 2106
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 2107
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException139@IntException@@QAEXJ@Z ENDP		; IntException::IntException139
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2742	DB	'This is in InterruptException ISR: 140', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException140@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException140
; Line 2110
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2111
	cli
; Line 2112
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 2113
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2742
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 2114
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 2115
	int	8
; Line 2116
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 2117
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 2118
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException140@IntException@@QAEXJ@Z ENDP		; IntException::IntException140
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2747	DB	'This is in InterruptException ISR: 141', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException141@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException141
; Line 2121
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2122
	cli
; Line 2123
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 2124
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2747
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 2125
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 2126
	int	8
; Line 2127
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 2128
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 2129
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException141@IntException@@QAEXJ@Z ENDP		; IntException::IntException141
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2752	DB	'This is in InterruptException ISR: 142', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException142@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException142
; Line 2132
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2133
	cli
; Line 2134
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 2135
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2752
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 2136
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 2137
	int	8
; Line 2138
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 2139
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 2140
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException142@IntException@@QAEXJ@Z ENDP		; IntException::IntException142
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2757	DB	'This is in InterruptException ISR: 143', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException143@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException143
; Line 2143
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2144
	cli
; Line 2145
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 2146
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2757
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 2147
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 2148
	int	8
; Line 2149
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 2150
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 2151
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException143@IntException@@QAEXJ@Z ENDP		; IntException::IntException143
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2762	DB	'This is in InterruptException ISR: 144', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException144@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException144
; Line 2154
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2155
	cli
; Line 2156
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 2157
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2762
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 2158
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 2159
	int	8
; Line 2160
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 2161
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 2162
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException144@IntException@@QAEXJ@Z ENDP		; IntException::IntException144
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2767	DB	'This is in InterruptException ISR: 145', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException145@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException145
; Line 2165
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2166
	cli
; Line 2167
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 2168
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2767
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 2169
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 2170
	int	8
; Line 2171
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 2172
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 2173
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException145@IntException@@QAEXJ@Z ENDP		; IntException::IntException145
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2772	DB	'This is in InterruptException ISR: 146', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException146@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException146
; Line 2176
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2177
	cli
; Line 2178
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 2179
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2772
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 2180
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 2181
	int	8
; Line 2182
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 2183
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 2184
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException146@IntException@@QAEXJ@Z ENDP		; IntException::IntException146
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2777	DB	'This is in InterruptException ISR: 147', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException147@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException147
; Line 2187
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2188
	cli
; Line 2189
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 2190
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2777
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 2191
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 2192
	int	8
; Line 2193
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 2194
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 2195
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException147@IntException@@QAEXJ@Z ENDP		; IntException::IntException147
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2782	DB	'This is in InterruptException ISR: 148', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException148@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException148
; Line 2198
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2199
	cli
; Line 2200
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 2201
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2782
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 2202
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 2203
	int	8
; Line 2204
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 2205
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 2206
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException148@IntException@@QAEXJ@Z ENDP		; IntException::IntException148
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2787	DB	'This is in InterruptException ISR: 149', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException149@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException149
; Line 2209
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2210
	cli
; Line 2211
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 2212
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2787
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 2213
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 2214
	int	8
; Line 2215
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 2216
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 2217
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException149@IntException@@QAEXJ@Z ENDP		; IntException::IntException149
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2792	DB	'This is in InterruptException ISR: 150', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException150@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException150
; Line 2220
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2221
	cli
; Line 2222
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 2223
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2792
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 2224
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 2225
	int	8
; Line 2226
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 2227
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 2228
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException150@IntException@@QAEXJ@Z ENDP		; IntException::IntException150
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2797	DB	'This is in InterruptException ISR: 151', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException151@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException151
; Line 2231
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2232
	cli
; Line 2233
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 2234
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2797
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 2235
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 2236
	int	8
; Line 2237
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 2238
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 2239
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException151@IntException@@QAEXJ@Z ENDP		; IntException::IntException151
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2802	DB	'This is in InterruptException ISR: 152', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException152@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException152
; Line 2242
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2243
	cli
; Line 2244
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 2245
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2802
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 2246
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 2247
	int	8
; Line 2248
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 2249
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 2250
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException152@IntException@@QAEXJ@Z ENDP		; IntException::IntException152
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2807	DB	'This is in InterruptException ISR: 153', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException153@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException153
; Line 2253
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2254
	cli
; Line 2255
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 2256
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2807
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 2257
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 2258
	int	8
; Line 2259
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 2260
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 2261
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException153@IntException@@QAEXJ@Z ENDP		; IntException::IntException153
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2812	DB	'This is in InterruptException ISR: 154', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException154@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException154
; Line 2264
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2265
	cli
; Line 2266
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 2267
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2812
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 2268
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 2269
	int	8
; Line 2270
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 2271
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 2272
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException154@IntException@@QAEXJ@Z ENDP		; IntException::IntException154
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2817	DB	'This is in InterruptException ISR: 155', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException155@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException155
; Line 2275
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2276
	cli
; Line 2277
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 2278
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2817
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 2279
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 2280
	int	8
; Line 2281
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 2282
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 2283
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException155@IntException@@QAEXJ@Z ENDP		; IntException::IntException155
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2822	DB	'This is in InterruptException ISR: 156', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException156@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException156
; Line 2286
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2287
	cli
; Line 2288
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 2289
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2822
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 2290
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 2291
	int	8
; Line 2292
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 2293
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 2294
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException156@IntException@@QAEXJ@Z ENDP		; IntException::IntException156
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2827	DB	'This is in InterruptException ISR: 157', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException157@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException157
; Line 2297
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2298
	cli
; Line 2299
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 2300
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2827
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 2301
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 2302
	int	8
; Line 2303
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 2304
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 2305
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException157@IntException@@QAEXJ@Z ENDP		; IntException::IntException157
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2832	DB	'This is in InterruptException ISR: 158', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException158@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException158
; Line 2308
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2309
	cli
; Line 2310
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 2311
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2832
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 2312
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 2313
	int	8
; Line 2314
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 2315
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 2316
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException158@IntException@@QAEXJ@Z ENDP		; IntException::IntException158
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2837	DB	'This is in InterruptException ISR: 159', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException159@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException159
; Line 2319
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2320
	cli
; Line 2321
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 2322
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2837
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 2323
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 2324
	int	8
; Line 2325
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 2326
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 2327
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException159@IntException@@QAEXJ@Z ENDP		; IntException::IntException159
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2842	DB	'This is in InterruptException ISR: 160', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException160@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException160
; Line 2330
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2331
	cli
; Line 2332
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 2333
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2842
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 2334
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 2335
	int	8
; Line 2336
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 2337
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 2338
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException160@IntException@@QAEXJ@Z ENDP		; IntException::IntException160
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2847	DB	'This is in InterruptException ISR: 161', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException161@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException161
; Line 2341
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2342
	cli
; Line 2343
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 2344
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2847
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 2345
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 2346
	int	8
; Line 2347
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 2348
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 2349
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException161@IntException@@QAEXJ@Z ENDP		; IntException::IntException161
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2852	DB	'This is in InterruptException ISR: 162', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException162@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException162
; Line 2352
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2353
	cli
; Line 2354
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 2355
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2852
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 2356
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 2357
	int	8
; Line 2358
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 2359
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 2360
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException162@IntException@@QAEXJ@Z ENDP		; IntException::IntException162
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2857	DB	'This is in InterruptException ISR: 163', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException163@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException163
; Line 2363
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2364
	cli
; Line 2365
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 2366
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2857
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 2367
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 2368
	int	8
; Line 2369
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 2370
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 2371
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException163@IntException@@QAEXJ@Z ENDP		; IntException::IntException163
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2862	DB	'This is in InterruptException ISR: 164', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException164@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException164
; Line 2374
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2375
	cli
; Line 2376
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 2377
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2862
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 2378
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 2379
	int	8
; Line 2380
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 2381
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 2382
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException164@IntException@@QAEXJ@Z ENDP		; IntException::IntException164
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2867	DB	'This is in InterruptException ISR: 165', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException165@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException165
; Line 2385
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2386
	cli
; Line 2387
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 2388
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2867
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 2389
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 2390
	int	8
; Line 2391
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 2392
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 2393
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException165@IntException@@QAEXJ@Z ENDP		; IntException::IntException165
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2872	DB	'This is in InterruptException ISR: 166', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException166@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException166
; Line 2396
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2397
	cli
; Line 2398
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 2399
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2872
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 2400
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 2401
	int	8
; Line 2402
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 2403
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 2404
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException166@IntException@@QAEXJ@Z ENDP		; IntException::IntException166
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2877	DB	'This is in InterruptException ISR: 167', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException167@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException167
; Line 2407
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2408
	cli
; Line 2409
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 2410
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2877
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 2411
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 2412
	int	8
; Line 2413
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 2414
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 2415
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException167@IntException@@QAEXJ@Z ENDP		; IntException::IntException167
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2882	DB	'This is in InterruptException ISR: 168', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException168@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException168
; Line 2418
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2419
	cli
; Line 2420
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 2421
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2882
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 2422
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 2423
	int	8
; Line 2424
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 2425
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 2426
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException168@IntException@@QAEXJ@Z ENDP		; IntException::IntException168
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2887	DB	'This is in InterruptException ISR: 169', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException169@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException169
; Line 2429
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2430
	cli
; Line 2431
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 2432
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2887
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 2433
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 2434
	int	8
; Line 2435
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 2436
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 2437
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException169@IntException@@QAEXJ@Z ENDP		; IntException::IntException169
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2892	DB	'This is in InterruptException ISR: 170', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException170@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException170
; Line 2440
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2441
	cli
; Line 2442
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 2443
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2892
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 2444
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 2445
	int	8
; Line 2446
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 2447
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 2448
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException170@IntException@@QAEXJ@Z ENDP		; IntException::IntException170
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2897	DB	'This is in InterruptException ISR: 171', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException171@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException171
; Line 2451
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2452
	cli
; Line 2453
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 2454
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2897
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 2455
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 2456
	int	8
; Line 2457
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 2458
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 2459
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException171@IntException@@QAEXJ@Z ENDP		; IntException::IntException171
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2902	DB	'This is in InterruptException ISR: 172', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException172@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException172
; Line 2462
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2463
	cli
; Line 2464
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 2465
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2902
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 2466
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 2467
	int	8
; Line 2468
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 2469
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 2470
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException172@IntException@@QAEXJ@Z ENDP		; IntException::IntException172
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2907	DB	'This is in InterruptException ISR: 173', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException173@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException173
; Line 2473
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2474
	cli
; Line 2475
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 2476
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2907
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 2477
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 2478
	int	8
; Line 2479
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 2480
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 2481
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException173@IntException@@QAEXJ@Z ENDP		; IntException::IntException173
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2912	DB	'This is in InterruptException ISR: 174', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException174@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException174
; Line 2484
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2485
	cli
; Line 2486
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 2487
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2912
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 2488
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 2489
	int	8
; Line 2490
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 2491
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 2492
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException174@IntException@@QAEXJ@Z ENDP		; IntException::IntException174
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2917	DB	'This is in InterruptException ISR: 175', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException175@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException175
; Line 2495
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2496
	cli
; Line 2497
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 2498
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2917
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 2499
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 2500
	int	8
; Line 2501
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 2502
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 2503
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException175@IntException@@QAEXJ@Z ENDP		; IntException::IntException175
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2922	DB	'This is in InterruptException ISR: 176', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException176@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException176
; Line 2506
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2507
	cli
; Line 2508
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 2509
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2922
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 2510
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 2511
	int	8
; Line 2512
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 2513
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 2514
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException176@IntException@@QAEXJ@Z ENDP		; IntException::IntException176
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2927	DB	'This is in InterruptException ISR: 177', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException177@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException177
; Line 2517
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2518
	cli
; Line 2519
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 2520
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2927
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 2521
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 2522
	int	8
; Line 2523
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 2524
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 2525
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException177@IntException@@QAEXJ@Z ENDP		; IntException::IntException177
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2932	DB	'This is in InterruptException ISR: 178', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException178@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException178
; Line 2528
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2529
	cli
; Line 2530
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 2531
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2932
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 2532
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 2533
	int	8
; Line 2534
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 2535
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 2536
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException178@IntException@@QAEXJ@Z ENDP		; IntException::IntException178
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2937	DB	'This is in InterruptException ISR: 179', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException179@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException179
; Line 2539
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2540
	cli
; Line 2541
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 2542
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2937
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 2543
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 2544
	int	8
; Line 2545
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 2546
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 2547
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException179@IntException@@QAEXJ@Z ENDP		; IntException::IntException179
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2942	DB	'This is in InterruptException ISR: 180', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException180@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException180
; Line 2550
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2551
	cli
; Line 2552
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 2553
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2942
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 2554
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 2555
	int	8
; Line 2556
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 2557
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 2558
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException180@IntException@@QAEXJ@Z ENDP		; IntException::IntException180
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2947	DB	'This is in InterruptException ISR: 181', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException181@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException181
; Line 2561
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2562
	cli
; Line 2563
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 2564
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2947
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 2565
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 2566
	int	8
; Line 2567
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 2568
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 2569
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException181@IntException@@QAEXJ@Z ENDP		; IntException::IntException181
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2952	DB	'This is in InterruptException ISR: 182', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException182@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException182
; Line 2572
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2573
	cli
; Line 2574
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 2575
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2952
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 2576
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 2577
	int	8
; Line 2578
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 2579
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 2580
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException182@IntException@@QAEXJ@Z ENDP		; IntException::IntException182
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2957	DB	'This is in InterruptException ISR: 183', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException183@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException183
; Line 2583
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2584
	cli
; Line 2585
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 2586
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2957
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 2587
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 2588
	int	8
; Line 2589
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 2590
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 2591
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException183@IntException@@QAEXJ@Z ENDP		; IntException::IntException183
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2962	DB	'This is in InterruptException ISR: 184', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException184@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException184
; Line 2594
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2595
	cli
; Line 2596
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 2597
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2962
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 2598
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 2599
	int	8
; Line 2600
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 2601
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 2602
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException184@IntException@@QAEXJ@Z ENDP		; IntException::IntException184
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2967	DB	'This is in InterruptException ISR: 185', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException185@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException185
; Line 2605
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2606
	cli
; Line 2607
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 2608
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2967
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 2609
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 2610
	int	8
; Line 2611
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 2612
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 2613
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException185@IntException@@QAEXJ@Z ENDP		; IntException::IntException185
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2972	DB	'This is in InterruptException ISR: 186', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException186@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException186
; Line 2616
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2617
	cli
; Line 2618
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 2619
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2972
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 2620
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 2621
	int	8
; Line 2622
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 2623
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 2624
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException186@IntException@@QAEXJ@Z ENDP		; IntException::IntException186
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2977	DB	'This is in InterruptException ISR: 187', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException187@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException187
; Line 2627
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2628
	cli
; Line 2629
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 2630
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2977
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 2631
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 2632
	int	8
; Line 2633
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 2634
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 2635
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException187@IntException@@QAEXJ@Z ENDP		; IntException::IntException187
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2982	DB	'This is in InterruptException ISR: 188', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException188@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException188
; Line 2638
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2639
	cli
; Line 2640
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 2641
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2982
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 2642
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 2643
	int	8
; Line 2644
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 2645
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 2646
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException188@IntException@@QAEXJ@Z ENDP		; IntException::IntException188
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2987	DB	'This is in InterruptException ISR: 189', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException189@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException189
; Line 2649
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2650
	cli
; Line 2651
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 2652
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2987
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 2653
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 2654
	int	8
; Line 2655
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 2656
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 2657
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException189@IntException@@QAEXJ@Z ENDP		; IntException::IntException189
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2992	DB	'This is in InterruptException ISR: 190', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException190@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException190
; Line 2660
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2661
	cli
; Line 2662
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 2663
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2992
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 2664
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 2665
	int	8
; Line 2666
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 2667
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 2668
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException190@IntException@@QAEXJ@Z ENDP		; IntException::IntException190
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG2997	DB	'This is in InterruptException ISR: 191', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException191@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException191
; Line 2671
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2672
	cli
; Line 2673
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 2674
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG2997
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 2675
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 2676
	int	8
; Line 2677
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 2678
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 2679
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException191@IntException@@QAEXJ@Z ENDP		; IntException::IntException191
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG3002	DB	'This is in InterruptException ISR: 192', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException192@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException192
; Line 2682
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2683
	cli
; Line 2684
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 2685
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG3002
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 2686
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 2687
	int	8
; Line 2688
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 2689
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 2690
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException192@IntException@@QAEXJ@Z ENDP		; IntException::IntException192
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG3007	DB	'This is in InterruptException ISR: 193', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException193@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException193
; Line 2693
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2694
	cli
; Line 2695
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 2696
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG3007
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 2697
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 2698
	int	8
; Line 2699
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 2700
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 2701
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException193@IntException@@QAEXJ@Z ENDP		; IntException::IntException193
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG3012	DB	'This is in InterruptException ISR: 194', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException194@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException194
; Line 2704
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2705
	cli
; Line 2706
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 2707
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG3012
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 2708
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 2709
	int	8
; Line 2710
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 2711
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 2712
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException194@IntException@@QAEXJ@Z ENDP		; IntException::IntException194
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG3017	DB	'This is in InterruptException ISR: 195', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException195@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException195
; Line 2715
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2716
	cli
; Line 2717
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 2718
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG3017
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 2719
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 2720
	int	8
; Line 2721
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 2722
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 2723
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException195@IntException@@QAEXJ@Z ENDP		; IntException::IntException195
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG3022	DB	'This is in InterruptException ISR: 196', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException196@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException196
; Line 2726
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2727
	cli
; Line 2728
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 2729
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG3022
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 2730
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 2731
	int	8
; Line 2732
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 2733
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 2734
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException196@IntException@@QAEXJ@Z ENDP		; IntException::IntException196
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG3027	DB	'This is in InterruptException ISR: 197', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException197@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException197
; Line 2737
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2738
	cli
; Line 2739
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 2740
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG3027
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 2741
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 2742
	int	8
; Line 2743
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 2744
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 2745
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException197@IntException@@QAEXJ@Z ENDP		; IntException::IntException197
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG3032	DB	'This is in InterruptException ISR: 198', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException198@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException198
; Line 2748
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2749
	cli
; Line 2750
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 2751
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG3032
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 2752
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 2753
	int	8
; Line 2754
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 2755
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 2756
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException198@IntException@@QAEXJ@Z ENDP		; IntException::IntException198
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG3037	DB	'This is in InterruptException ISR: 199', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException199@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException199
; Line 2759
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2760
	cli
; Line 2761
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 2762
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG3037
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 2763
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 2764
	int	8
; Line 2765
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 2766
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 2767
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException199@IntException@@QAEXJ@Z ENDP		; IntException::IntException199
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG3042	DB	'This is in InterruptException ISR: 200', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException200@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException200
; Line 2770
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2771
	cli
; Line 2772
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 2773
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG3042
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 2774
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 2775
	int	8
; Line 2776
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 2777
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 2778
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException200@IntException@@QAEXJ@Z ENDP		; IntException::IntException200
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG3047	DB	'This is in InterruptException ISR: 201', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException201@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException201
; Line 2781
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2782
	cli
; Line 2783
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 2784
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG3047
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 2785
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 2786
	int	8
; Line 2787
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 2788
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 2789
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException201@IntException@@QAEXJ@Z ENDP		; IntException::IntException201
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG3052	DB	'This is in InterruptException ISR: 202', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException202@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException202
; Line 2792
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2793
	cli
; Line 2794
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 2795
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG3052
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 2796
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 2797
	int	8
; Line 2798
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 2799
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 2800
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException202@IntException@@QAEXJ@Z ENDP		; IntException::IntException202
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG3057	DB	'This is in InterruptException ISR: 203', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException203@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException203
; Line 2803
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2804
	cli
; Line 2805
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 2806
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG3057
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 2807
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 2808
	int	8
; Line 2809
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 2810
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 2811
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException203@IntException@@QAEXJ@Z ENDP		; IntException::IntException203
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG3062	DB	'This is in InterruptException ISR: 204', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException204@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException204
; Line 2814
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2815
	cli
; Line 2816
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 2817
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG3062
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 2818
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 2819
	int	8
; Line 2820
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 2821
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 2822
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException204@IntException@@QAEXJ@Z ENDP		; IntException::IntException204
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG3067	DB	'This is in InterruptException ISR: 205', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException205@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException205
; Line 2825
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2826
	cli
; Line 2827
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 2828
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG3067
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 2829
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 2830
	int	8
; Line 2831
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 2832
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 2833
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException205@IntException@@QAEXJ@Z ENDP		; IntException::IntException205
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG3072	DB	'This is in InterruptException ISR: 206', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException206@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException206
; Line 2836
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2837
	cli
; Line 2838
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 2839
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG3072
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 2840
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 2841
	int	8
; Line 2842
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 2843
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 2844
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException206@IntException@@QAEXJ@Z ENDP		; IntException::IntException206
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG3077	DB	'This is in InterruptException ISR: 207', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException207@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException207
; Line 2847
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2848
	cli
; Line 2849
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 2850
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG3077
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 2851
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 2852
	int	8
; Line 2853
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 2854
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 2855
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException207@IntException@@QAEXJ@Z ENDP		; IntException::IntException207
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG3082	DB	'This is in InterruptException ISR: 208', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException208@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException208
; Line 2858
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2859
	cli
; Line 2860
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 2861
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG3082
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 2862
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 2863
	int	8
; Line 2864
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 2865
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 2866
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException208@IntException@@QAEXJ@Z ENDP		; IntException::IntException208
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG3087	DB	'This is in InterruptException ISR: 209', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException209@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException209
; Line 2869
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2870
	cli
; Line 2871
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 2872
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG3087
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 2873
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 2874
	int	8
; Line 2875
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 2876
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 2877
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException209@IntException@@QAEXJ@Z ENDP		; IntException::IntException209
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG3092	DB	'This is in InterruptException ISR: 210', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException210@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException210
; Line 2880
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2881
	cli
; Line 2882
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 2883
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG3092
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 2884
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 2885
	int	8
; Line 2886
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 2887
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 2888
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException210@IntException@@QAEXJ@Z ENDP		; IntException::IntException210
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG3097	DB	'This is in InterruptException ISR: 211', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException211@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException211
; Line 2891
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2892
	cli
; Line 2893
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 2894
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG3097
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 2895
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 2896
	int	8
; Line 2897
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 2898
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 2899
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException211@IntException@@QAEXJ@Z ENDP		; IntException::IntException211
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG3102	DB	'This is in InterruptException ISR: 212', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException212@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException212
; Line 2902
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2903
	cli
; Line 2904
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 2905
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG3102
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 2906
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 2907
	int	8
; Line 2908
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 2909
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 2910
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException212@IntException@@QAEXJ@Z ENDP		; IntException::IntException212
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG3107	DB	'This is in InterruptException ISR: 213', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException213@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException213
; Line 2913
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2914
	cli
; Line 2915
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 2916
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG3107
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 2917
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 2918
	int	8
; Line 2919
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 2920
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 2921
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException213@IntException@@QAEXJ@Z ENDP		; IntException::IntException213
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG3112	DB	'This is in InterruptException ISR: 214', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException214@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException214
; Line 2924
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2925
	cli
; Line 2926
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 2927
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG3112
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 2928
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 2929
	int	8
; Line 2930
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 2931
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 2932
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException214@IntException@@QAEXJ@Z ENDP		; IntException::IntException214
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG3117	DB	'This is in InterruptException ISR: 215', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException215@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException215
; Line 2935
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2936
	cli
; Line 2937
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 2938
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG3117
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 2939
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 2940
	int	8
; Line 2941
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 2942
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 2943
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException215@IntException@@QAEXJ@Z ENDP		; IntException::IntException215
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG3122	DB	'This is in InterruptException ISR: 216', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException216@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException216
; Line 2946
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2947
	cli
; Line 2948
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 2949
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG3122
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 2950
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 2951
	int	8
; Line 2952
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 2953
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 2954
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException216@IntException@@QAEXJ@Z ENDP		; IntException::IntException216
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG3127	DB	'This is in InterruptException ISR: 217', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException217@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException217
; Line 2957
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2958
	cli
; Line 2959
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 2960
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG3127
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 2961
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 2962
	int	8
; Line 2963
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 2964
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 2965
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException217@IntException@@QAEXJ@Z ENDP		; IntException::IntException217
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG3132	DB	'This is in InterruptException ISR: 218', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException218@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException218
; Line 2968
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2969
	cli
; Line 2970
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 2971
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG3132
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 2972
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 2973
	int	8
; Line 2974
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 2975
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 2976
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException218@IntException@@QAEXJ@Z ENDP		; IntException::IntException218
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG3137	DB	'This is in InterruptException ISR: 219', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException219@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException219
; Line 2979
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2980
	cli
; Line 2981
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 2982
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG3137
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 2983
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 2984
	int	8
; Line 2985
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 2986
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 2987
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException219@IntException@@QAEXJ@Z ENDP		; IntException::IntException219
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG3142	DB	'This is in InterruptException ISR: 220', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException220@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException220
; Line 2990
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 2991
	cli
; Line 2992
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 2993
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG3142
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 2994
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 2995
	int	8
; Line 2996
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 2997
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 2998
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException220@IntException@@QAEXJ@Z ENDP		; IntException::IntException220
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG3147	DB	'This is in InterruptException ISR: 221', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException221@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException221
; Line 3001
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 3002
	cli
; Line 3003
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 3004
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG3147
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 3005
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 3006
	int	8
; Line 3007
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 3008
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 3009
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException221@IntException@@QAEXJ@Z ENDP		; IntException::IntException221
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG3152	DB	'This is in InterruptException ISR: 222', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException222@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException222
; Line 3012
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 3013
	cli
; Line 3014
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 3015
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG3152
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 3016
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 3017
	int	8
; Line 3018
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 3019
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 3020
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException222@IntException@@QAEXJ@Z ENDP		; IntException::IntException222
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG3157	DB	'This is in InterruptException ISR: 223', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException223@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException223
; Line 3023
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 3024
	cli
; Line 3025
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 3026
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG3157
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 3027
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 3028
	int	8
; Line 3029
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 3030
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 3031
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException223@IntException@@QAEXJ@Z ENDP		; IntException::IntException223
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG3162	DB	'This is in InterruptException ISR: 224', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException224@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException224
; Line 3034
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 3035
	cli
; Line 3036
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 3037
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG3162
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 3038
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 3039
	int	8
; Line 3040
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 3041
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 3042
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException224@IntException@@QAEXJ@Z ENDP		; IntException::IntException224
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG3167	DB	'This is in InterruptException ISR: 225', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException225@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException225
; Line 3045
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 3046
	cli
; Line 3047
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 3048
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG3167
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 3049
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 3050
	int	8
; Line 3051
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 3052
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 3053
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException225@IntException@@QAEXJ@Z ENDP		; IntException::IntException225
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG3172	DB	'This is in InterruptException ISR: 226', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException226@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException226
; Line 3056
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 3057
	cli
; Line 3058
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 3059
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG3172
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 3060
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 3061
	int	8
; Line 3062
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 3063
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 3064
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException226@IntException@@QAEXJ@Z ENDP		; IntException::IntException226
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG3177	DB	'This is in InterruptException ISR: 227', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException227@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException227
; Line 3067
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 3068
	cli
; Line 3069
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 3070
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG3177
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 3071
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 3072
	int	8
; Line 3073
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 3074
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 3075
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException227@IntException@@QAEXJ@Z ENDP		; IntException::IntException227
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG3182	DB	'This is in InterruptException ISR: 228', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException228@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException228
; Line 3078
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 3079
	cli
; Line 3080
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 3081
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG3182
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 3082
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 3083
	int	8
; Line 3084
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 3085
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 3086
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException228@IntException@@QAEXJ@Z ENDP		; IntException::IntException228
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG3187	DB	'This is in InterruptException ISR: 229', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException229@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException229
; Line 3089
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 3090
	cli
; Line 3091
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 3092
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG3187
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 3093
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 3094
	int	8
; Line 3095
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 3096
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 3097
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException229@IntException@@QAEXJ@Z ENDP		; IntException::IntException229
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG3192	DB	'This is in InterruptException ISR: 230', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException230@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException230
; Line 3100
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 3101
	cli
; Line 3102
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 3103
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG3192
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 3104
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 3105
	int	8
; Line 3106
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 3107
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 3108
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException230@IntException@@QAEXJ@Z ENDP		; IntException::IntException230
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG3197	DB	'This is in InterruptException ISR: 231', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException231@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException231
; Line 3111
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 3112
	cli
; Line 3113
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 3114
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG3197
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 3115
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 3116
	int	8
; Line 3117
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 3118
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 3119
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException231@IntException@@QAEXJ@Z ENDP		; IntException::IntException231
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG3202	DB	'This is in InterruptException ISR: 232', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException232@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException232
; Line 3122
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 3123
	cli
; Line 3124
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 3125
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG3202
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 3126
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 3127
	int	8
; Line 3128
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 3129
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 3130
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException232@IntException@@QAEXJ@Z ENDP		; IntException::IntException232
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG3207	DB	'This is in InterruptException ISR: 233', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException233@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException233
; Line 3133
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 3134
	cli
; Line 3135
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 3136
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG3207
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 3137
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 3138
	int	8
; Line 3139
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 3140
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 3141
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException233@IntException@@QAEXJ@Z ENDP		; IntException::IntException233
_TEXT	ENDS
_DATA	SEGMENT
	ORG $+1
$SG3212	DB	'This is in InterruptException ISR: 234', 00H
_DATA	ENDS
_TEXT	SEGMENT
_this$ = -4
?IntException234@IntException@@QAEXJ@Z PROC NEAR	; IntException::IntException234
; Line 3144
	push	ebp
	mov	ebp, esp
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	DWORD PTR _this$[ebp], ecx
; Line 3145
	cli
; Line 3146
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAcliTimer@AOAProtected@@QAEXXZ	; AOAProtected::AOAcliTimer
; Line 3147
	push	1
	push	960					; 000003c0H
	push	OFFSET FLAT:$SG3212
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAPrintText@AOAProtected@@QAEXPADHH@Z	; AOAProtected::AOAPrintText
; Line 3148
	push	1
	push	24					; 00000018H
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAsetSharedMem@AOAProtected@@QAEXHJ@Z	; AOAProtected::AOAsetSharedMem
; Line 3149
	int	8
; Line 3150
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAgetCharacter@AOAProtected@@QAEDXZ	; AOAProtected::AOAgetCharacter
	mov	ecx, DWORD PTR _this$[ebp]
	mov	BYTE PTR [ecx+8], al
; Line 3151
	mov	ecx, DWORD PTR _this$[ebp]
	call	?AOAISRExit@AOAProtected@@QAEXXZ	; AOAProtected::AOAISRExit
; Line 3152
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	4
?IntException234@IntException@@QAEXJ@Z ENDP		; IntException::IntException234
_TEXT	ENDS
END
