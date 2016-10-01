rem This program creates a bootable USB in automatic fashion 
rem   It runs a Visual Studio program and finds the starting sector locations for 
rem    prcycle.exe and test.exe files and automatically inserts this into the usb 
rem   There is no need to do anything manually
call asmb.bat
format e: /FS:FAT /q
rem DOS format does not work, must use format in Windows
copy c:\home\student\rkk\boottestapp\prcycle.exe e: 
copy c:\home\student\rkk\boottestapp\interfaces\test.exe e:
rem drive e is 5 
rem start sector for USB is 1 0.51KB 
rwhd -k 5 0 120000 1 temp.bin newboot.bin e:\prcycle.exe
rwhd -m 5 newboot.bin
