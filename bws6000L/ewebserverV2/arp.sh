#!/bin/csh
#c shell script 
while (1) 
arp -d 10.55.10.233 
#sleep 2 
ping 10.55.10.233 -w 2 
echo this is a loop 
end 
EXIT
  
