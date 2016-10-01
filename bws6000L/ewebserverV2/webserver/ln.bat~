cls
rem Needs Microsoft Incremental Linker (Microsoft Visual C++ Linker)
rem To link in 32-bit we need to use the above said linker 
rem Run the Batch file MSDN.BAT

erase ..\dosclib\*.obj
call cplib.bat 

..\bin\link /MAP /BASE:0000 /NODEFAULTLIB /LIBPATH:"..\doscLIB" /ENTRY:main test.obj aoatask.obj apptask.obj aoaprotected.obj runTask.obj runTaskasm32.obj etherobj.obj cisupport.obj isupport.obj chkstk.obj wcirlist.obj wstack.obj wttrace.obj wlist.obj ARPObj.obj IPObj.obj rand.obj tcpobj.obj parserobj.obj httpindex.obj hashindex.obj udpobj.obj ftpobj.obj ftopobj.obj intexception.obj cfiles.obj asmfiles.obj thashindex.obj
