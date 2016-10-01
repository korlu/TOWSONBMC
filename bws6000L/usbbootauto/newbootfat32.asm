[BITS 16]
;************************************************************
; Program entry point
; Currently we are at 0:7C00
;************************************************************
[ORG 0]
EntryPoint:
    ; Would have preferred 07C0:0000
    ; Dealing with an offset that starts at 0 is easier
    ; So do a far jump to 07C0:????

    jmp AfterData
    ;nop 
bsOemName               DB      "MSDOS5.0"      ; 0x03

;;;;;;;;;;;;;;;;;;;;;
;; BPB starts here ;;
;;;;;;;;;;;;;;;;;;;;;
bpbBytesPerSector       DW      0x0200               ; 0x0B
bpbSectorsPerCluster    DB      0x08               ; 0x0D
bpbReservedSectors      DW      0x0024               ; 0x0E
bpbNumberOfFATs         DB      0x02               ; 0x10
bpbRootEntries          DW      0x0000               ; 0x11
bpbTotalSectors         DW      0x0000               ; 0x13
bpbMedia                DB      0xF8               ; 0x15
bpbFATSz16		        DB      0x00               ; 0x16
bpbSectorsPerTrack      DW      0x3F00               ; 0x18
bpbHeadsPerCylinder     DW      0x0000               ; 0x1A
bpbHiddenSectors        DD      0xD4722900               ; 0x1C
bpbTotalSectorsBig      DD      0x1E660000               ; 0x20
bpbFATSz32				DD		0x00001280
;;;;;;;;;;;;;;;;;;;
;; FAT 32 EXT    ;;
;;;;;;;;;;;;;;;;;;;
bpbFSVer				DW		0
bpbRootClus				DD		9
bpbFSInfo				DW		1
bpbRes1					DD		0
bpbRes2					DD		0
bpbRes3					DD		0
;;;;;;;;;;;;;;;;;;;
;; BPB ends here ;;
;;;;;;;;;;;;;;;;;;;

bsDriveNumber           DW      0x0080               ; 0x24
bsUnused                DB      0x00               ; 0x25
bsExtBootSignature      DB      0x29               ; 0x26
bsSerialNumber          DD      0x0C7A44E5               ; 0x27
bsVolumeLabel           DB      "NO NAME    "   ; 0x2B
bsFileSystem            DB      "FAT     "      ; 0x36
; Your Data goes here!
    BOOT_MSG db 'Welcome to BOOT SECTOR CODE!',10,13,0
    ACTIVITY db '. ',0
    buffer   db  '                 '            ; buffer to hold chars
	xtable   db  '0123456789ABCDEF'      ; translate table
ImageLoadSeg            equ     60h
;diskAddressPacket db 10h
;   db 0
;   blocksToTransfer db 64
;   db 0
;   transferBuffer dd 0
;   startblock db '      '
;   startblock2 dw 0

; EBIOS disk address packet
;
SHIFT		dw 0x7C00-03h
LoaderAddr	dw 37a0h,0000h

dapa:
		dw 10h				        ; Packet size 16 bytes, this data structure size 
.count:		dw 48				    ; Block count (no of sectors)
.off:		dw 0x0600			    ; Offset of buffer (memory location for destination)
.seg:		dw 0000h				; Segment of buffer (seg:offset)
.lbal:		dd 00000251h			; LBA (LSW) sectors 
.lbam:		dd 0				    ; LBA (MSW)

AfterData:
; update DS to be 7C0 instead of 0
;push CS
;pop DS

; update ES also
;push CS
;pop ES

; create stack
;mov ax, 0x0000
;mov ss, ax
;mov sp, 0xFFFF

        cld

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; How much RAM is there? ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;

        int     12h             ; get conventional memory size (in KBs)
        shl     ax, 6           ; and convert it to paragraphs

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Reserve some memory for the boot sector and the stack ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

        sub     ax, 512 / 16    ; reserve 512 bytes for the boot sector code
        mov     es, ax          ; es:0 -> top - 512

        sub     ax, 2048 / 16   ; reserve 2048 bytes for the stack
        mov     ss, ax          ; ss:0 -> top - 512 - 2048
        mov     sp, 2048        ; 2048 bytes for the stack

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Copy ourself to top of memory ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

        mov     cx, 256
        ;mov		sp, 7C00h
        ;mov     si, sp
        mov		si, 7C00h
        xor     di, di
        mov     ds, di
        rep     movsw
        ;mov		di, 7C00h
        
        ;cli
        ;xor ax,ax
		;mov ds,ax
		;mov es,ax
		;mov ss,ax
		;mov sp,7C00h
		;sti
		;cld
		;mov si,sp		; Start address
		;mov di,7C00h		; Destination address
		;mov cx,256
		;rep movsw

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Jump to relocated code ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;

        push    es
        push    word main
        retf

main:
        push    cs
        pop     ds

        mov		ax, 200h
        mov		bx, 10
        call	WriteInt
        
; display boot message...
lea si, [BOOT_MSG]
call Print

		xor ax, ax
		mov	dl, [bsDriveNumber]
		int 13h ;reset disk
		xor bp, bp ; bp=0 means LBA, bp=1 means CHS 
		mov ah, 41h 
		mov bx, 55aah 
		int 13h 
		jc errorReading
		cmp bx, 0AA55h
		jnz errorReading
		;test cl, 1
		;jz DIE_LOOP
		
ReadDiskExt:		
		push di
		mov di, dapa
		mov si,di
		;mov bx, 020Eh	
		;mov [si+8],bx
		;mov bx, 0000h
		;mov [si+10],bx
		;mov bx,0000h ; [di+8]			; Copy the block address
		;mov [si+12],bx
		;mov bx,0000h ;[di+10]
		;mov [si+14],bx
		mov dl,80h
		mov ah,42h
;		mov si, [es:di]
;		mov	[transferBuffer], si
;		mov bx, 0x0210
;		mov	[startblock2], bx
;		mov	ah, 42h
;		mov	dl, 80h
		int 13h
		jc errorReading
		
		;cli                             ; for stack adjustments

        ;mov     ax, ImageLoadSeg
        ;mov     es, ax

        ;cmp     word [es:0], 04DA5h      ; "MZ" signature?
        ;mov ax, [di+4]
        ;jmp      RelocateEXE             ; yes, it's an EXE
        ;mov ax, 0
        ;mov ds, ax
        ;mov bx, 37A0h
        ;mov al, 0B0h
        ;mov [bx], al
        ;mov al, 59h
        ;mov [bx+1], al
        ;mov al, 0B4h
        ;mov [bx+2], al
        ;mov al, 0Eh
        ;mov [bx+3], al
        ;mov al, 0CDh
        ;mov [bx+4], al
        ;mov al, 10h
        ;mov [bx+5], al
        ;RKK
        ;  comment the JMP to test the memory to make sure that we know the 
        ;     starting point of the code to jump
        jmp word 0x0:0x37A0		;:0x0060				; jump to execute the sector!
PrintMem7C00:
		mov ax, 0
		mov ds, ax
		mov	dword [bx], 0600h
		mov cx, 0600h
		mov dx, 00h
.loop:
		;mov al, [bx]
		inc dx
		inc cx
		;mov word [bx], word cx
		mov ax, [0x37a2]
		push bx
		mov bh, 0
		mov bl, 7
		mov ah, 14
		int 10h
		mov	al, 'Y'
        mov ah, 14
        int 10h
        pop bx
		cmp dx, 100
		jne .loop
		
        
        ;mov	al, 'Y'
        ;mov ah, 14
        ;int 10h
        ;mov bx, 37A0h		; [LoaderAddr+SHIFT-03h]
        
        
   		mov si, [07C03h]
		;mov [ds:si], si
		call Print
		mov ax, 1024
		mov bx, 10
		call WriteInt
		jmp DIE_LOOP
errorReading:
mov bx, 10
call WriteInt
mov si, [bsVolumeLabel]
call Print
jmp errorReading		

; Go into a hang printing dots
DIE_LOOP:
lea si, [ACTIVITY]
call Print
mov cx, 0xffff
delay1:
mov bx, 0xfff
delay2:
dec bx
jnz delay2
dec cx
jnz delay1
jmp DIE_LOOP


;************************************************************
; Procedure print
; prints a zero terminated string pointed to by si
;************************************************************
Print:
push ax
mov ah, 14 ; BIOS code for screen display
cld
print_loop:
lodsb ; moving the character to be displayed to al
or al, al ; checking if the char is NULL
jz printdone
int 10h ; Calling BIOS routine
JMP print_loop

printdone:
pop ax
ret
; End of print procedure...


WriteInt:
; Writes a 16-bit unsigned binary integer to standard 
; output. Input parameters: AX = value, BX = radix.

     pusha

L3:  mov   dx,0         ; clear dividend to zero
     div   bx           ; divide AX by the radix

     xchg  ax,dx       ; exchange quotient, remainder
     push  bx              
     mov   bx,xtable ; translate table
     xlat                  ; look up ASCII digit
     pop   bx              
     dec   di              ; back up in buffer
     mov   [di],al         ; move digit into buffer
     xchg  ax,dx           ; swap quotient into AX

     inc   cx              ; increment digit count
     or    ax,ax           ; quotient = 0?
     jnz   L3              ; no: divide again

     ; Display the buffer using CX as a counter.

L4:  
     ;push	bx
     ;mov	bx, 0h
     ;dec	di
     ;mov	[di],bx
     ;pop	bx     
	 mov   si,di
     call Print

     popa
     ret
;end of WriteInt


data db "hello World!",0
; Make the file 512 bytes long
TIMES 510-($-$$) DB 0 

; Add the boot signature
dw 0AA55h


