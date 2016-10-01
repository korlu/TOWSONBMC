rem asmb.bat 
rem this compiles newboot.asm using NASM compiler 
erase newboot.bin
.\nasm\nasm newboot.asm -onewboot.bin
