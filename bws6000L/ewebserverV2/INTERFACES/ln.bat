cls
rem Needs Microsoft Incremental Linker (Microsoft Visual C++ Linker)
rem To link in 32-bit we need to use the above said linker 
rem Run the Batch file MSDN.BAT
..\bin\link /MAP /BASE:0000 /NODEFAULTLIB /ENTRY:main test.obj aoaprotected.obj asmfiles.obj cfiles.obj
