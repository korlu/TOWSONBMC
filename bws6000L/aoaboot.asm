;****************************************************************
; aoaboot.asm file name 
; modified at Towson University Dated 8-1-01 
; by Dr. Karne, Gattu, Ankam, Dandu, Xubo, Xi
; compile with MASM 6.11
; ml /AT Flaoaboot.lst Feaoaboot.com Foaoaboot.com /Fm /Zi
; aoaboot.asm /link /CODEVIEW

; usage:
; place a formatted disk in a: drive and aoaboot 0
; this will install boot record (512) bytes on disk
; copy any DOS files on disk before installing boot record
; after installing boot record DOS copy will not work
; In order to boot insert a diskette in a: drive and start 
;****************************************************************
; BOOT - This code contains:
;             - AOA boot record which installs boot on a diskette
;             - Code that runs after boot whoch loads a lader
;             (this code must be less than 512 bytes) 
;              
; Original code was from Web which needed fixes and modifications
; to suit to AOA application: www.cs.vsb.cz                                
;****************************************************************
; The code has been modified at Towson University to make it run
; with MASM 6.1. Other changes also made to make it run 
;    - 3 byte offset was needed to print messages correctly 
;    - calc_sec routine works fine but stores the results in  
;      registers that messes up the loading of the loader program 
;***************************************************************
.model TINY, BASIC 

.386

.DATA
; 0:7C00h = address where BIOS loads boot record
	STACK_TOP       = 7C00H
	SHIFT           = 7C00H - 103H
	; PSP = 100H bytes, JMP BOOT_BEGIN = 3 bytes
       ; LOADER_MODULE     = 0700H
	LOADER_MODULE     = 0000H

	; Segment address of Loader where it will be loaded 
	; Address where to load the loader module
	; Booter loader the loader into memory
	; Loader in turn will load other modules 
;***************************************************************
;  Keep the data and code in code segment for 512 byte
;  boot record as the booter has only code segment to run
;***************************************************************
.CODE 

ASSUME DS:DGROUP,ES:DGROUP,SS:DGROUP

.startup

;start the code at 100h for .com file
org 100h
;***************************************************************
;BOOTER PROCESS 
;***************************************************************
BOOTER  PROC
	push bp
	mov bp,sp
	; jump to prepare and install a boot record
	; this code does not get invoked during boot

	JMP     BOOT_BEGIN  ; to install boot record

; Boot record begins here
; Some code is the same as MS-DOS (version 4.0 or higher)
; boot record
; Every value named in sectors is relative to boot sector
; Boot sector relative number is 0.
; Boot_Start label is the point where it starts loading into 
; the boot sector. The boot sector which has 512 bytes gets 
; loaded starting at this point 
; When a boot sector gets loaded, it loads program and as well as 
; data it is very important that all the program and data must fit 
; in this one sector (512 bytes) 
; Make sure that the code you want to carry with the boot disk 
; in the boot sector fits in that sector
;***************************************************************
; Starting point of the boot code 
;***************************************************************

Boot_Start:
	JMP     SHORT @@Start   ; Jump over data
	NOP                     ; Near jump 
				; so we need one extra byte here

VersionID       db      'AOATU1.0',0     ; Company and version
BytesPerSec     dw      512     ; 512B per sector
		db      ?       ; Unused
StartImageSecs  dw      ?       ; First available sect for image
LoaderSize      db      50      ; Size of LOADER in sectors 58 is the max number of sectors it can load 
				; Mini Loader Has a problem
SizeImageSec    dw      ?       ; Image size in sectors
TotalSectors    dw      2880    ; Total sector number on disk
FormatID        db      0F0H    ; F0 = floppy, F8 = harddisk
LoaderDataSec   dw      33      ; First sector of LOADER
; use filesys a: /S:n to check for the code in exe file 
; find where the PSP starts in the exe file the sector say is n 
; find also where the code ends in the exe file, total no of sectors p 
; put n in LoaderDataSec data word 
; put p+1 in the LoaderSize data word 
; filesys a: /s:33 will show PSP track to read 
SectorsPerCyl   dw      18      ; Sectors per track (cylinder)
Sides           dw      2       ; Number of sides (heads) 
		dw      ?       ; Unused
		dw      ?       ; Unused
		dd      ?       ; Unused
DriveNo         db      0       ; 0=1st floppy,80h=1st harddisk
		db      ?       ; Unused
		db      ?       ; Unused
VolumeSerialNo  db      1,2,3,4 ; Volume serial number 0102-0304
VolumeLabel     db      'AOAXsysdisk' ;Volume label(max.11 chars)
		db      8 dup (?)       ; 8 bytes
; Boot record end (total 62 bytes including JMP and NOP)
;***************************************************************
; Here come the variables that AOA needs
RAMDiskSize     dw      0FFFFh  ; Size of memory block reserved 
				; in paragraphs (1MB-16B)
;***************************************************************
;Boot main code
;***************************************************************
@@Start:
; init segments except ES
	CLI
	mov     ax, ds  ; DS:SI = actual partition structure
	mov     es, ax
	XOR     AX, AX
	MOV     SS, AX
	MOV     SP, STACK_TOP   ; Stack initiation
	MOV     DS, AX
	STI                     ; ES has old DS value 
				; DS and SS have 0
				; SP at 7C00
;
; When booting from harddisk, DS:SI pointers to actual
; partition structure. We need some parameters from there.
; Else we'll fill this structure with diskette parameters.
	cmp     [BYTE PTR DriveNo + SHIFT -3], 80h
	jnb     savpar
; Fill partition structure buffer with diskette def. parameters
; This is needed for A disk drive bootup 

	; If you run out of space within 512 bytes you can comment
	; the trace instructions 

	; 7th byte in tracerecord
	; Trace record can be used to debug the code 
	mov     di,offset  TraceRec + SHIFT - 3 + 7
	mov     BYTE PTR DS:[DI],'d'    ; 'd' flag
	; PartBuf can be used to send data to load module 
	mov     di, offset PartBuf + SHIFT - 3
	inc     di
	mov     BYTE PTR ds:[di], 0     ; BeginHead = 0
	inc     di
	mov     WORD PTR ds:[di], 1     ; BeginSecCyl = 1
	add     di, 14
	jmp     saveend
	; other 14 bytes of the partition buffer is not 
	; initialized and they are not used in the code now 

; Else save real partition structure to our buffer
savpar:
	; The following code is not tested
	; hence it is commented
	; this should be only used for hard disk boot 
	; mov     cx, 10h
	; 16 bytes of structure
	; This is needed for Hard Disk drive bootup 
	; We do not intend to boot using Hard Disk 
	; 7th byte in tracerecord
	; mov    di,offset  TraceRec + SHIFT - 3 + 7 
	; mov    BYTE PTR DS:[DI],'h'
	; mov     di, offset PartBuf+SHIFT - 3
savparloop:
	; mov     al, BYTE PTR es:[si]    ; let it save
	; ES has old DS value when program started 
	; mov     BYTE PTR ds:[di], al
	; inc     di
	; inc     si
	; loop    savparloop
; Common parameters
saveend:                                ; save added information
	; 16 bits of partition buffer are stored as above
	; the rest of the 3 bytes are stored as below 

	mov     al, [BYTE PTR DriveNo + SHIFT - 3] ;Drive number 
				       ; 0 for diskette drive 
	mov     BYTE PTR ds:[di], al
	add     di, 1
	mov     ax, [WORD PTR RAMDiskSize + SHIFT - 3]
	; RAMDisk size      2 bytes in the partition buffer 
	mov     WORD PTR ds:[di], ax

	xor     ax, ax                  ; init ES
	mov     es, ax                  ; now ES is 0

; Look if LOADER is in disk, checks if there are some sectors
detectloader:
	MOV     AL,[LoaderSize + SHIFT - 3]
	OR      AL, AL
	JZ      @@Boot_Failure

; Loader is there, so init drive & load it
;****************************************************************
;     reset the disk drive
;***************************************************************
	; 6th byte in tracerecord
	; Loader found set L flag 
	mov    di, offset  TraceRec + SHIFT - 3 + 6 
	mov    BYTE PTR DS:[DI],'L' 

	XOR     AX, AX
	MOV     DL, [BYTE PTR DriveNo + SHIFT - 3]
	INT     13H                     ; Device reset (AH = 0)
;***************************************************************
	; 5th byte in tracerecord
	; disk reset is successful set R flag
	mov    di, offset  TraceRec + SHIFT - 3 + 5 
	mov    BYTE PTR DS:[DI],'R'

	; carry flag is set if there is a reset or read error
	; after return from interrupt 13 
	JC     @@Boot_Failure          ; Reset error
;***************************************************************
;  Now, Print Start message, Version ID and OS msg 
;***************************************************************

	;MOV     SI, OFFSET StartMsg1 + SHIFT - 3
	;CALL    WriteString             ; Print message
	;MOV     SI, OFFSET  VersionID + SHIFT - 3
	;CALL    WriteString             ; Print message
	;MOV     SI, OFFSET StartMsg2 + SHIFT - 3
	;CALL    WriteString             ; Print message
;*********************************************************
; this program will load the aoaload.com file at 0700h
;*********************************************************              
	MOV     [LoopCount+SHIFT-3],3 ;  Try to read 3 times
	MOV     BX, LOADER_MODULE     ; Loader Address  
	MOV     ES, BX                ; setup ES:BX pair
	XOR     BX, BX                ;  to read from disk
	; Loader module begins at 00700h:0000h PSP area

; Now we'll read the loader from reserved sector
;-------------begin reading loader sectors ---------------------
@@Read_Continue:
	
	MOV     AX, [LoaderDataSec + SHIFT - 3]

	CALL    calc_sec

	; relative sector -> physical CHS
	; calc_sec returns DL drive, DH head, CH track, CL sector 
	; make sure that CX and DX registers are not changed below

	; 4th byte in tracerecord
	mov    di,offset  TraceRec + SHIFT - 3 + 4 
	mov    BYTE PTR        DS:[DI],'S'
	; set S flag every time it goes through the loop
	
@@three:
	MOV     BX, [BxPointer + SHIFT - 3];
	; initially it is 0 and increments by 512 bytes
	; for next sector 
	MOV     AX, 0201h       ; Read one sector at a time
	INT     13H
	JNC     @@Continue
	; AX register has number of sectors it read
	; carry flag will be reset if read successfully

	DEC     [LoopCount+SHIFT - 3] ; count down for three attempts  
	MOV     AX, [LoopCount+SHIFT - 3] 
	CMP     AX, 0 
	JNZ     @@three
	; three attempts and go to error 
	JMP     SHORT @@Boot_Failure

@@Continue:
	ADD     [BxPointer + SHIFT - 3], 0200H
	; add one sector equivalent of 512 bytes
	; for next segment to read if any

	; 3rd byte in tracerecord
	PUSH    DI
	mov     di,offset  TraceRec + SHIFT - 3 + 3 
	mov     AX, [LoaderDataSec + SHIFT - 3]
	mov     BYTE PTR DS:[DI], AL
	POP     DI
	; print the trace record   
	mov     si, OFFSET TraceRec + SHIFT - 3
	CALL    WriteString
	; This will print the sector number that just read

	INC     [LoaderDataSec + SHIFT - 3] ;Next sector to read
	DEC     [LoaderSize + SHIFT - 3]    ;count down sectors
	JNZ     @@Read_Continue
;***************************************************************
;End of reading all sectors of the loader program 
;***************************************************************
	MOV     SI, OFFSET OKMsg + SHIFT - 3
	CALL    WriteString
			; Print message
;***************************************************************
; Set ES:DI to pointer to Partiton buffer. Loader can use it
; This can be used to pass data to another program such as loader
; As long as ES:DI is not disturbed, PartBuf can be read in
; the called module 
;***************************************************************
	mov     di, offset PartBuf + SHIFT - 3
	mov     ax, cs
	mov     es, ax
; Now go to Loader from one world to another 
;***************************************************************
; We need a indirect jump that jumps to an address 
; that is in a memory location 4 bytes 
; It must point to a double word so that it replaces
; IR and CS with two words of address
       mov ah, 14  
       mov al, 'X'
       int 10h 

	JMP     DWORD PTR [LoaderAddress + SHIFT -3]
; This is a point of no return, no one should be here!

; Boot failed (read error, loader not found),message & try again
@@Boot_Failure:
	MOV     SI, OFFSET BootFailMsg + SHIFT - 3
	CALL    WriteString     ; Print error message
	XOR     AH, AH          ; BIOS keyboard service
;       INT     16H             
; Wait for key stroke
	INT     19H             ; Try to load boot sector again
;***************************************************************
; End of boot program
; Now, the loader should be up and running 
;***************************************************************
; Procedures to follow
; The following procedures should also fit in 512 byte block
;***************************************************************
; WriteString procedure prints a string pointed by SI
; uses BX register
;***************************************************************
WriteString proc near           ;Print an ASCIIZ string at DS:SI
	PUSH    BX
@@Write_Begin:
	LODSB                   ; Next character
	OR      AL, AL
	JZ      @@Write_End     ; AL=0 => end of ASCIIZ string
	MOV     AH, 0EH         ; BIOS service - write character
	MOV     BL, 0FFH        ; Char's attribute
	INT     10H
	JMP     SHORT @@Write_Begin
@@Write_End:
	POP     BX
	RET
WriteString endp 
;***************************************************************
; calc_sec Calculate absolute sector parameters given a
; sector number
; AX register has the logical sector number
; output is in DH, DL, CH, CL registers
;***************************************************************
calc_sec proc near
; Calculates side, track, sector
; Input: AX = relative sector
; Relative sector = Cyl# * SPC * Heads + Head# * SPC + Sec# - 1
;                                                   (zero base)
; Results: prepare register to int 13/[02 or 03] (without AX)
; Modified registers: AX, DX, CX
; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
; We suppose the maximum relative sector equals to 0FFFFh.
; For bootstrap it should be enough.
; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	XOR     DX, DX
	DIV     [WORD PTR SectorsPerCyl + SHIFT - 3]
	PUSH    DX
	XOR     DX, DX
	DIV     [WORD PTR Sides + SHIFT - 3]
	MOV     DH, DL                  ; HEAD
; PartBuf + 1 = BeginHead
	add     dh, [BYTE PTR PartBuf + 1 + SHIFT -3]
				       ; DH = absolute head
; PartBuf + 2 = BeginSecCyl
	mov     cx, [WORD PTR PartBuf + 2 + SHIFT - 3]
	and     cx, 0FFC0h
	rol     cl, 2
	xchg    cl, ch
	add     ax, cx          ; AX = absolute cylinder
	pop     cx              ; CX = calculated sector
	push    ax
	mov     ax, [WORD PTR PartBuf + 2 + SHIFT - 3]
	and     ax, 3Fh
	add     cx, ax          ; CX = absolute sector
	pop     ax

;Head overflow
	cmp     dh, [BYTE PTR Sides + SHIFT - 3]
	jb      @@testsec
	mov     dh, 0
	add     ax, 1
; Sector overflow
@@testsec:
	cmp     cx, [SectorsPerCyl + SHIFT - 3]
	jna     @@dontaddhead
	mov     cx, 1
	add     dh, 1
; Head overflow again
@@dontaddhead:
	cmp     dh, [BYTE PTR  Sides + SHIFT - 3]
	jna     @@dontaddcyl
	mov     dh, 0
	add     ax, 1

@@dontaddcyl:
	xchg    ah, al
	ror     al, 2
	or      al, cl
	mov     cx, ax
	MOV     DL, [DriveNo + SHIFT - 3]       ; DRIVE NUMBER
	RET
calc_sec endp
;***************************************************************
; Partition buffer declaration follow
; This buffer can be sent to loader program through ES:DI
;***************************************************************

PartBuf         db      19 dup(?)
			      ; 16 bytes of partition structure
			      ; + 1 byte for DRIVE identification
			      ; + 2 bytes for RAMdisk size
BootFailMsg     db     'Non-System disk or disk error', 13, 10,0
KeyPressMsg     db     'Press akey toReboot', 13, 10, 0
StartMsg1       db     13,10,'Starting',0
StartMsg2       db     ' OS..', 13,10,0
OKMsg           db     'OK', 13, 10, 0
TraceRec        db     'FFFFFFFF',13,10,0
LoopCount       dw      3

; when you load the segment value for jump,use the value with no 
; shift left (code at 0a200h should be coded as 2200h:800h or 200h:0a00h).
; LoaderAddress   dw      0a200h, 0000h ; offset and segment addr
; BxPointer       dw      0a000h   

; PRCYLE.ASM this code's PSP is loaded at 600h 
; its code starts at 800h, check RCODESEG starting address or  
; add it up.. 3990 + 800h = 4190h
; every time prcycle.asm is compiled, make sure the address is correct 

;PRCYCLE
LoaderAddress   dw      3900h, 0000h ; offset and segment add ;CHANGE if MAP file 
; changes the RCODESEG start value
BxPointer       dw      0600h        ; to keep offset for next sector

 

@@BootCode_End:
;***************************************************************
; End of booter code 
; It must be within 512 bytes from here to Boot_Start  
;***************************************************************
;
;
;
;***************************************************************
; The following code gets executed to install a boot record 
; on a bootable disk 
;***************************************************************
BOOT_BEGIN:
; get command line to buffer 'cmd'
	mov     si, 80h
	movzx   cx, BYTE PTR ds:[si]    ; CX = velikost
	inc     cx

	mov     di, offset cmd
	cld
	rep     movsb

; transmission 'cmd' to big letters
	cld
	mov     ax, offset cmd
	mov     si, ax
	mov     di, ax
	mov     cx, 80h
cik:    lodsb
	cmp     al, 'a'
	jb      neeee
	cmp     al, 'z'
	ja      neeee
	sub     al, 'a'-'A'
neeee:  stosb
	loop    cik

; go to main writing code
	jmp     main


str2num PROC near 
; Transmission of hexadecimal string to real number
; input  : AX = string offset (one or two characters)
; output : BX = wanted number
; CF = 1, if transmission gone wrong
	mov     bx, 0
	cld
	clc
	mov     si, ax
	mov     di, ax
	mov     ax, 0
	mov     cx, 2           ; max 2 characters
cak:    lodsb

	cmp     al,'0'          ; AL must be '0'-'9' or 'A'-'F'
	jb      tr_err
	cmp     al,'9'
	jb      number
	cmp     al,'A'
	jb      tr_err
	cmp     al,'F'
	ja      tr_err

; transmission of characters 'A'-'F' to number
	sub     al,55   ; 'A'=65 => 65-55=10, (10 decimal is A hexadec.)
	shl     bx,4
	add     bx,ax
	loop    cak

	jmp     finish

; transmission of characters '0'-'9' to number
number: sub     al,48   ; '0'=48 => 48-48=0
	shl     bx,4
	add     bx,ax
	loop    cak

	jmp     finish

; wrong input
tr_err: stc
finish: 
	ret
str2num ENDP


main:
; cmd+2 = 1st character of command line
	mov     al, [BYTE PTR cmd + 2]
	mov     si, offset HelpMsg
	cmp     al, 0           ; when no parameters
	je      ParDrvErr
	cmp     al, '?'         ; or given '?', then
	jne     ParDrvOk        ; print help

ParDrvErr:
	call    WriteString
	jmp     main_end
ParDrvOk:
	mov     ax, offset cmd + 2      ; first parameter = drive
	call    str2num
	mov     [BYTE PTR DRIVE], bl

	cmp     bl, 7Fh
	ja      @@ReadMBR               ; Don't read MBR when writing
	mov     [BYTE PTR HEAD], 0              ; to floppy
	mov     [WORD PTR CYLSEC], 1

	jmp     @@ReadBoot

@@ReadMBR:
; cmd+5 = 4th character of command line
	mov     al, [BYTE PTR cmd + 5]
	mov     si, offset HelpMsg
	cmp     al, 0                   ; if partition parameter not
	je      @@Do_Write              ; specified
	cmp     al, '1'                 ; or not in range 1 to 4
	jb      @@Do_Write              ; print help
	cmp     al, '4'
	ja      @@Do_Write

	mov     bx, offset MBRbuffer
	mov     dl, [BYTE PTR  DRIVE]
	mov     dh, 0           ; MBR Head
	mov     cx, 3
@@TryReadMBR:
	push    cx
	mov     cx, 1           ; MBR Cylinder & Sector
	mov     ax, 0201H       ; read MBR to buffer
	int     13h
	pop     cx
	jnc     @@ReadMBROK
	loop    @@TryReadMBR
	mov     si, offset DiskReadErrMBR
	jmp     @@Do_Write

@@ReadMBROK:
	mov     ax, offset cmd + 5
	call    str2num

; get parameters of given partition
	mov     ax, bx
	mov     bx, 16
	mul     bx
	sub     ax, bx
	add     ax, 1beh
	mov     di, ax
	add     di, 1
	mov     cl, [BYTE PTR MBRbuffer + di]
	mov     [BYTE PTR  HEAD], cl            ; BeginHead
	add     di, 1
	mov     cx, [WORD PTR MBRbuffer + di]
	mov     [WORD PTR CYLSEC], cx           ; BeginCylSec


; Read original boot record before update
@@ReadBoot:
	MOV     BX, OFFSET BootBuffer
	MOV     DL, [BYTE PTR DRIVE]
	MOV     DH, [BYTE PTR HEAD] ;BeginHead = boot sector Head
	MOV     CX, 3
@@TryRead:
	PUSH    CX
	MOV     CX, [WORD PTR CYLSEC]
			; boot sector Cylinder & Sector
	MOV     AX, 0201H         ; read boot to buffer
	INT     13H
	POP     CX
	JNC     @@ReadOK
	LOOP    @@TryRead
	MOV     SI, OFFSET DiskReadErr
	JMP     @@Do_Write
@@ReadOK:
	MOV     SI, OFFSET Boot_Start
	MOV     DI, OFFSET BootBuffer
;       MOV     CX, 11
	MOV     CX,38
	REP     MOVSB           ; write my boot to buffer
;       ADD     SI, 27       
;       ADD     DI, 27
	MOV     CX, 472/2
	REP     MOVSW
	MOV     AX, 0AA55H      ;End of boot sector signature
	STOSW
	MOV     CX, 3
@@TryWrite:
	PUSH    CX
	MOV     DL, [BYTE PTR DRIVE]
	MOV     DH, [BYTE PTR HEAD]
	MOV     CX, [WORD PTR CYLSEC]
	MOV     AX, 0301H
	MOV     BX, OFFSET BootBuffer
	INT     13H             ; Write buffer to boot sector
	POP     CX
	JNC     @@Write_OK
	LOOP    @@TryWrite
	MOV     SI, OFFSET WriteErrorMsg
	JMP     SHORT @@Do_Write
@@Write_OK:
	MOV     SI, OFFSET WriteOKMsg
@@Do_Write:
	CALL    WriteString

main_end:
	;mov    sp,stack_top
	;mov    dl,0
	;int    19h

	;JMP @@Boot_Failure

	;MOV BX, STACK_TOP
	;MOV DL, [BYTE PTR DRIVE]
	;MOV DH, [BYTE PTR HEAD]
	;MOV CX, [WORD PTR CYLSEC]
	;MOV AX, 0201H 
	;INT 13H 
	;JMP Boot_Start 


	pop     bp
	MOV     AH,4Ch
	INT     21H
;EXITCODE

HelpMsg db      'Boot Record Writer by Petr Smidak & friends '
	db      'from TUOX Bootstrap group, 1999', 13,10,13,10
	db      'Boot - Real Boot record Code. IT LOADS TUOX.', 13,10,13,10
	db      'BOOT.COM [? | <DRIVE [PARTITION]>]', 13,10,13,10
	db      'Parameters :',13,10
	db      '  ? - this help message', 13,10
	db      '  DRIVE = hexadecimal number', 13,10
	db      '          (0 = first floppy drive, '
	db      '1 = second floppy drive, ...', 13,10
	db      '           80 = first harddisk, '
	db      '81 = second harddisk, ...)', 13,10
	db      '  PARTITION = partition number on choosed drive (1-4)', 13,10
	db      '      This has no effect, if drive < 80 (hexa)', 13,10,0
WriteErrorMsg   db      'Boot Writing Error.', 13,10,0
DiskReadErr     db      'Boot Reading Error.', 13,10,0
WriteOKMsg      db      'Boot Record Was Successfully Written.', 13,10
		db      'Load System Files Now.', 13,10,0
DiskReadErrMBR  db      'MBR Reading Error.', 13,10,0
DRIVE           db      ?
PARTBEG         dw      ?
HEAD            db      ?
CYLSEC          dw      ?
hex             db      '0123456789ABCDEF'      ; hexa znaky
cmd             db      8 dup(0), 78h dup(?)    ; argumenty z PSP
BootBuffer      db      512 dup(?)
MBRbuffer       db      512 dup(?)


BOOTER ENDP 
end
