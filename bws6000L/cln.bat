del *.*~
del prcycle.exe
del *.obj
del *.lst
del *.map
del aoaboot.com

cd dosclib
del *.obj

cd ..
cd interfaces
call cln.bat

cd ..
cd arp 
call cln.bat

cd ..
cd ip
call cln.bat

cd ..
cd tcp
call cln.bat

cd ..
cd udp 
call cln.bat

cd ..
cd ftp 
call cln.bat

cd ..
cd httpparser 
call cln.bat

cd ..
cd httpindex 
call cln.bat

cd ..
cd httptable 
call cln.bat

cd ..
cd ftop 
call cln.bat

cd ..
cd ethernet 
call cln.bat

cd ..
cd webserver
call cln.bat
cd .. 
