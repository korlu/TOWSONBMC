rem This program creates a bootable USB in automatic fashion 
rem  use this for 1.0GB USB ONLY and also FAT16
rem   It runs a Visual Studio program and finds the starting sector locations for 
rem    prcycle.exe and test.exe files and automatically inserts this into the usb 
rem   There is no need to do anything manually
rem   A B C D E F G H   Drive 
rem   1 2 3 4 5 6 7 8   Drive No
call asmb.bat
format f: /FS:FAT /q
rem DOS format does not work, must use format in Windows
rem copy prload1.asm.usb prload1.asm
call c.bat
rem copy ..\rwhdf16\release\rwhd.exe  
copy prcycle.exe f: 
copy .\webserver\test.exe f:
rem copy .\interfaces\test.exe f:
rem start sector for USB is 1 0.51KB (offset) 
rem  Get 0x0FE0 i.e. 4064 from prcycle.map at the begining of DemoStack3Seg or 
rem     at the end of DemoStack1Seg
rwhd -k 6 0 120000 1 temp.bin newboot.bin f:\prcycle.exe 4064 64
rwhd -m 6 newboot.bin
