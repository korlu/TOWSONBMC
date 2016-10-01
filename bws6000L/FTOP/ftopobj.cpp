//******************************************************
// This is FTOPObj.cpp file 
//******************************************************
#include"FTOPObj.h"
#include "../webserver/apptask.h"
#include "../ARP/ARPObj.h"
// The Static Variable definition starts here
unsigned int FTOPObj::Mode;
unsigned long FTOPObj::LRT;
	
//This module initilaizes the webser to run in standby mode
//Must check if there is any webserver with Active Mode
//If not must run in MODE ACTIVE
//If their is Active Mode webserver then go to standby and send hello packets
int FTOPObj::init()
{
 	Mode=STANDBY;
	LRT = io.AOAgetTimer();	
	return 0;
}

void FTOPObj::setMode(int mode) 
  {
    Mode = mode; 
  }

int FTOPObj::getMode()
{
 	if(Mode==STANDBY)
	{
	return 0;
	}
	else
	{
	 return 1;
	}
	
}

int FTOPObj::HandleFTOP(char *Data, int Size, int currenttask)
{
    char PACK[20];
    char DestMAC[6];
    DestMAC[0] = 0xFF;
    DestMAC[1] = 0xFF;
    DestMAC[2] = 0xFF;
    DestMAC[3] = 0xFF;
    DestMAC[4] = 0xFF;
    DestMAC[5] = 0xFF;	
    io.AOAPrintText("HandleFTP", 320);
    io.AOAprintHex(Size,380);
    io.AOAprintHex(Data[0],360);
    io.AOAPrintText("8", 480);  
    if(Size<1)
    	return 0;
    io.AOAPrintText("1", 480); 
    if(Data[0]=='1')
    {
	io.AOAPrintText("2", 480); 	
	
	if(Mode == ACTIVE)
	{
	   	   io.AOAPrintText("3", 480); 	 
	    
	    PACK[0] = '2';		
	    //return EO.Send(PACK,20, 0xF0F0 , DestMAC);	   // Reply 2
//sdp	    return EO.IPInsertPkt(PACK,20, 0xF0F0 , DestMAC, currenttask);	
	}
	   	   io.AOAPrintText("4", 480); 	 	
	return 0;
    }
    io.AOAPrintText("5", 480); 	 	 
    if(Data[0]=='2')
    {
	Mode = STANDBY;	
	LRT = io.AOAgetTimer();
	io.AOAPrintText("6", 480); 	 	 	
	return 0;
    }
   io.AOAPrintText("7", 480); 	 	 	 
    return 0;
}
	
int FTOPObj::SendFTOP(int currenttask)
{
    ARPObj arp;
    char DestMAC[6];
    char BIP[4];
    BIP[0] = 0xFF;
    BIP[1] = 0xFF;
    BIP[2] = 0xFF;
    BIP[3] = 0xFF; 
	
    DestMAC[0] = 0xFF;
    DestMAC[1] = 0xFF;
    DestMAC[2] = 0xFF;
    DestMAC[3] = 0xFF;
    DestMAC[4] = 0xFF;
    DestMAC[5] = 0xFF;	 
    unsigned long LRecT = 0;
    int i=0;
    char PACK[20];
    apptask task;
    if(Mode == ACTIVE)
    {
	return 0;
    }
    LRecT = LRT;
    //io.AOAprintHex(LRT,0);
    //io.AOAprintHex(LRecT,20); 
    i = 0;
    while(i<10)
    {
	    PACK[0] = '1';		
	    //EO.Send(PACK,20, 0xF0F0, DestMAC);
	    //return EO.IPInsertPkt(PACK,20, 0xF0F0 , DestMAC, currenttask);	
//sdp	    return EO.IPInsertPkt(PACK,20, 0xF0F0 , DestMAC, currenttask);	
	    //task.TaskSleep(1);
	    if(LRecT < LRT)
	    {
		return 0;
	    }
	    i++;
    }
    Mode = ACTIVE;
    arp.Response(BIP, currenttask);
    //io.AOAPrintText("ACTIVE MODE",40);
    return 0;
}

