    ; 2.ASM
    ; Print "Hello Cyberspace!" on the screen and hang

    ; Tell the compiler that this is offset 0.
    ; It isn't offset 0, but it will be after the jump.
    [ORG 0]

            jmp 07C0h:start     ; Goto segment 07C0

    OEM_ID                db "QUASI-OS"
    BytesPerSector        dw 0x0200
    SectorsPerCluster     db 0x01
    ReservedSectors       dw 0x0001
    TotalFATs             db 0x02
    MaxRootEntries        dw 0x00E0
    TotalSectorsSmall     dw 0x0B40
    MediaDescriptor       db 0xF0
    SectorsPerFAT         dw 0x0009
    SectorsPerTrack       dw 0x0012
    NumHeads              dw 0x0002
    HiddenSectors         dd 0x00000000
    TotalSectorsLarge     dd 0x00000000
    DriveNumber           db 0x00
    Flags                 db 0x00
    Signature             db 0x29
    VolumeID              dd 0xFFFFFFFF
    VolumeLabel           db "QUASI  BOOT"
    SystemID              db "FAT12   "

    ; Declare the string that will be printed
    msg     db  'Frederick Ackers'
    two     db  '- COSC519 - '
    thr     db  '1112 Gleneagle Road, Apt.1,'
    four    db  ' Baltimore, MD 21239!'

    start:
            ; Update the segment registers
            mov ax, cs
            mov ds, ax
            mov es, ax


            mov si, msg     ; Print msg
	    call print
	    mov si, two
            call print
	    mov si, thr
	    call print
	    mov si, four
	    call print
	    jmp hang
    print:
            lodsb           ; AL=memory contents at DS:SI

            cmp al, 0       ; If AL=0 then hang
            je  .DONE

            mov ah, 0Eh     ; Print AL
            mov bx, 7
            int 10h

            jmp print       ; Print next character
    .DONE:
	    ret

    hang:                   ; Hang!
            jmp hang


    times 510-($-$$) db 0
    dw 0AA55h