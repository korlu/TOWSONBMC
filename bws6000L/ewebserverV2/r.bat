@echo off
rem r.bat file 
rem  
set COUNT1=1
:begin
rem ping -t 10.55.11.233 -w 0
ping 10.55.11.233
sleep 1
%COUNT1=%COUNT1+1
echo This is a Loop: %COUNT1%
arp -d 10.55.11.233
GOTO begin

