//****************************************************
// IPObj.cpp 
// Implementation file for IPObj 
// Coded by Karthick Venkatasamy Jaganathan
// Dated 10/09/04
// Towson University, Copyright 2004 
// ***************************************************
// Check RFC791 for details of this implementation  
// ***************************************************
#include "../webserver/aoatask.h"
#include "ipobj.h"
#include "../tcp/tcpobj.h"
#include "../Ethernet/etherobj.h"
#include "../Interfaces/aoaprotected.h"
#include "rand.h"
#include "../UDP/udpobj.h"

char 	IPObj::msourceMAC[7]; //store this machines MAC address 

char 	IPObj::msourceIP[4];  //store this machines IP address 	

char 	IPObj::mTimeLive = 128; //max no of hops a packet can travel 	

char 	IPObj::mServiceType= 0;  //QOS

unsigned long IPObj::noippacksr = 0 ;	// Total number of IP Packets received

unsigned long IPObj::noippackss = 0 ;	// Total number of IP Packets Sent

unsigned long IPObj::noippacksps = 0 ;	// Total number of IP Packets successfully processed 
// ***************************************************
//  Needed to initialize values, no logic  
// ***************************************************
IPObj::IPObj()
{
    	// Seth the version to IP Version 4 and the Length of Header to 5
	mVerHlen = 0x45;
	// Set the Flags to Fragment and Make the fragmentation offset to 0
	// 3 bit flags 6 7 8   bit 7 is set 
	mFragment_Flags= 0x4000;
}
// ***************************************************
// Must be initialized, there are global variables  
// ***************************************************
void IPObj::init(char *SrcIP)
{
	// In this case the Ethernet Object Must be initialised before the IP object	
    	EO.getMAC(msourceMAC);

	noippackss = 0; 
	noippacksr = 0; 

    	for(int i=0;i<4;i++)
		msourceIP[i] = SrcIP[i];
    
    	// This can be modified by using overloaded init functions	
	mTimeLive = 128;// IT can Reach a maximum of 128 hops
    	// This can be modified by using overloaded init functions	
	mServiceType = 0; 

	// Seth the version to IP Version 4 and the Length of Header to 5
	mVerHlen = 0x45;  
	// Set the Flags to Fragment and Make the fragmentation offset to 0
	mFragment_Flags= 0x4000; 
	random r = random(io.AOAgetTimer()); //set the random number 
}
//*************************************************************************************************
// 	This function is used to send an IP Datagram
// 	This function returns -10 if the length of data to send is less than 1 byte
// 	This function returns -11 if the data length is greater than maximum send size
//*************************************************************************************************
int IPObj::sendData(char* data, int len, char DestIP[4], char DestMAC[6], int protocol, int currenttask)
{
	int sizeOfPacket=0;
	int retcode = 0;
	int count1 = 0;

	sizeOfPacket = len + 20; // new size of packet ; 20 is for ip header
	data = data - 20;
	
	// return error if there is no data to send	
    	if(len < 1)
	    return -10;
	if(len > MAXSEND_SIZE)
	    return -11;	
	// Set the IP Version and Header Length for the packet
	data[0] = IPVHL;
	// Set the service Type for the packet
	data[1] = mServiceType;
	// Set the total length for the packet
	// 20 - here is the header length of the IP Packet
	data[2] = ((sizeOfPacket>>8)&0xFF);
	data[3] = (sizeOfPacket & 0xFF); 
	
	// Identification a Random Number
	random r = random(io.AOAgetTimer());
	unsigned int randomnumber = r.getRandomAoA(io.AOAgetTimer());	
	data[4] = (char)(((randomnumber>>8) & 0xFF)); 
	data[5] = (char)(((randomnumber) & 0xFF)); 	
	
	// Set the flags and Fragmentation Offset
	data[6] = (mFragment_Flags >> 8) & 0xFF;
        data[7] = mFragment_Flags & 0xFF; 

	// Set hte Time to live for the packet
	data[8] = mTimeLive;
	// Set the protocol for the packet
	data[9] = protocol & 0xFF;

	// Set the Source IP and Destination IP
	for(int i=0; i< 4; i++)
	{
	   data[12+i] = msourceIP[i]; 
      	   data[16+i] = DestIP[i];
	       
	}
	
	//set the check sum fields to zero and calculate the ckecksum
	data[10] = 0x00;
	data[11] = 0x00;	
	
	int cksum = checksum(data);
	
	data[10] = (cksum>>8) & 0xFF;
	data[11] = cksum & 0xFF;
	
	//send the formated IP Datagram 
	// 20 is the length of the IP header
 	noippackss++;	// Total number of IP Packets Sent	

	retcode = EO.IPInsertPkt(data, sizeOfPacket, IP_TYPE , DestMAC, currenttask);	

	count1 = io.AOAgetSharedMem(0xb8); 
	count1++; 
	io.AOAsetSharedMem(0xf0, count1); 

	return retcode;
}

//*************************************************************************************************
// 	This function is used to send an IP Datagram
// 	This function returns -24 if the length of data to send is less than 1 byte
// 	This function returns -25 if the data length is greater than maximum send size
//*************************************************************************************************
int IPObj::FormatIPPacket(char* data, int len, char DestIP[4], char DestMAC[6], int protocol, int currenttask)
{
	int sizeOfPacket=0;

	sizeOfPacket = len + 20; // new size of packet ; 20 is for ip header
	
	// return error if there is no data to send	
    	if(len < 1)
	    return -24;
	if(len > MAXSEND_SIZE)
	    return -25;	
	// Set the IP Version and Header Length for the packet
	data[0] = IPVHL;
	// Set the service Type for the packet
	data[1] = mServiceType;
	// Set the total length for the packet
	// 20 - here is the header length of the IP Packet
	data[2] = ((sizeOfPacket>>8)&0xFF);
	data[3] = (sizeOfPacket & 0xFF); 
	
	// Identification a Random Number
	random r = random(io.AOAgetTimer());
	unsigned int randomnumber = r.getRandomAoA(io.AOAgetTimer());	
	data[4] = (char)(((randomnumber>>8) & 0xFF)); 
	data[5] = (char)(((randomnumber) & 0xFF)); 	
	
	// Set the flags and Fragmentation Offset
	data[6] = (mFragment_Flags >> 8) & 0xFF;
        data[7] = mFragment_Flags & 0xFF; 

	// Set hte Time to live for the packet
	data[8] = mTimeLive;
	// Set the protocol for the packet
	data[9] = protocol & 0xFF;

	// Set the Source IP and Destination IP
	for(int i=0; i< 4; i++)
	{
	   data[12+i] = msourceIP[i]; 
      	   data[16+i] = DestIP[i];
	}
	
	//set the check sum fields to zero and calculate the ckecksum
	data[10] = 0x00;
	data[11] = 0x00;	
	
	int cksum = checksum(data);
	
	data[10] = (cksum>>8) & 0xFF;
	data[11] = cksum & 0xFF;
	
 	noippackss++;	// Total number of IP Packets Sent	

	return 0; 
}

//*************************************************************************************************
// construct the checksum and returns the value 
//*************************************************************************************************
unsigned short IPObj::checksum(char *packet)
{
	short word16;
	int sum = 0;
	
	for(int i=0; i<20; i=i+2)
	{
		word16 = (short)packet[i]<<8 & 0xff00;		
		word16 += packet[1+i] & 0xff;
		sum += word16 & 0xffff;
	}
	
	while(sum>>16)
		sum = (sum & 0xffff) + (sum >> 16);

	sum = ~sum;

	return (short)sum;
}

//**************************************************************************************************************
// This function handles the incomming packets
// This function only processes TCP Packets the rest of the IP Packets are discarded
// It accepts char pointer to the Starting of IP Packet
// It accepts the size of the IP Packet
// It returns -1 if the size of the IP Packet is less than the header
// It returns -2 if the size of the IP Packet is greater than the largest acceptable size
// It returns -3 if the IP Version and the Header length Dosent Match
// It returns -4 if the IP Packet is fragmented
// It returns -5 if the Length of data in the IP Packet is less than 1 means there is no data in the IP Packet
// It returns -6 if the SourceIP didnt match with the Destination IP of hte Packet
// It returns -7 if the Protocol Dosent Match to TCP
// It returns -8 if the header checksum is not valid
// 
//**************************************************************************************************************
// PollTask invokes this funtion
//**************************************************************************************************************
//
int IPObj::IPHandler(char* IPPack, int size, char *macaddr, long starttime, int currenttask)
{
    ARPObj arp;
    TCPObj tcp;
    UDPObj udp;
    AOATask task;
    unsigned short	*TotalLength1, TotalLength;
    unsigned int 	Flags_FragOffset;
    char	protocol;
    unsigned int		CheckSum;
    char	SourceIP[4];
    char	DestIP[4];
    unsigned int HeaderLength = 0;  
    char temp[2]; 
    unsigned short k = 0;  
    char DestMac[6]; 
    long x = 0; 
    long *p1; 
    long c3; 
    p1 = &c3 ; 
    long tempval=0;
    char *Data;
    char c;
    Data = &c;
    int j=0;
    int retcode=0;
    int currtime=0;

    noippacksr++;	// Total number of IP Packets received 
    //rerun if the packet is less than the header 
    if( size < 20)
	return -1;
    // Return if the Packet Size is greater than maximum Acceptable Size
    if( size > MAXRECEV_SIZE)
	return -2;
    
   //check for IP version, receive only version 4 packets 
   // if it is version 6 packet, discard and return error code -2 
    if( (IPPack[0] & 0xF0 ) != (IPVHL & 0xF0))
      {
        //not version4 
	return -3;
      }

    //calculate the header length 
    HeaderLength = (IPPack[0] & 0x0F) * 4  ;
    if(HeaderLength < 20)
    {
	return -9; //discard it 
    }
	
    // Assemble the Flags and Fragmentation offset in Flags_FragOffset
    Flags_FragOffset = IPPack[6] & 0x00FF;
    Flags_FragOffset = (Flags_FragOffset << 8) & 0xFF00;
    Flags_FragOffset = (Flags_FragOffset | (IPPack[7] & 0x00FF));

    // check for Fragmented IP Datagram and if the datagram is fragmented discard the fragments
    if( (Flags_FragOffset & 0x2000 ) == 0x2000 || (Flags_FragOffset & 0x1FFF) !=0)
    {
	return -4;
    }
    
    // Get the total length in TotalLength and Calculate the Length of Data in the IP Datagram
    
    temp[0] = IPPack[3];
    temp[1] = IPPack[2];
    TotalLength1 = (unsigned short*)&temp[0];
    TotalLength = *TotalLength1;

    // If there is no data in the IP Datagram return 
    if(TotalLength < 1)
    {
	return -5;
    }

    // Get the Source IP and the Destination IP 
    for(int i=0;i<4;i++)
    {
    SourceIP[i] = IPPack[i+12];
    DestIP[i]   = IPPack[i+16];
    }

    //check the destination IP to be this machines IP address, then process it...
    if(DestIP[0] != msourceIP[0] && DestIP[1] != msourceIP[1] &&    DestIP[2] != msourceIP[2] &&    DestIP[3] != msourceIP[3]) 
    {
    	return -6;
    }
   
   // Verify the Checksum of the packet
   CheckSum = IPPack[10] & 0x00FF;
   CheckSum = (CheckSum << 8) & 0xFF00;
   CheckSum = (CheckSum | (IPPack[11] & 0x00FF));

   IPPack[10]= 0x0;
   IPPack[11]= 0x0; 
   k = checksum(IPPack);
   
   if(CheckSum != k)
   {
       return -8; //checksum error  
   }
  
   //check the protocol 
   protocol =(int) IPPack[9];
   noippacksps++;	

   if(protocol == ICMP)
   {
      x = EO.TDLPointer + EO.SendInPtr * 16 - ADDR_OFFSET; 
      
      p1 = (long*)x;  
      Data = (char*)*p1;
      //add header in front of data 
      Data = Data + 14 + 20  - ADDR_OFFSET; //it is an absolute address
   
      //if it is ICMP, some one is doing ping, please send response 

      if(TotalLength - 28 == 901)
      {
         i=0;
         Data = Data + 8;
         while(i< (TotalLength - HeaderLength))
         {
            tempval = io.AOAgetMem(0x0b000000+i);
            Data[i] = tempval >> 24;
            Data[i+1] = tempval >> 16;
            Data[i+2] = tempval >> 8;
            Data[i+3] = tempval;
            i= i+4;
         }			  
      }
      else if(TotalLength - 28 == 902)
      {
         for(i=0;i < (TotalLength - HeaderLength);i++)
         {
            Data[i+8] = 'b';
	    io.Application_Status = 2; 
         }	
      }
      else
      {
         for(i=0;i < (TotalLength - HeaderLength);i++)
         {
            Data[i] = IPPack[i+20];
         }
      }  
    
      Data[0] = 0;   //type 
      Data[2] = Data[2] + 8; //checksum  
    
      retcode = sendData(Data, (TotalLength - HeaderLength), SourceIP, macaddr, ICMP, currenttask);

      return retcode;
   }//end of ICMP if condition

   else if(protocol == TCP)
   {
         //if it is TCP, give it to TCP handler  
	 // IPPack[12] starting point of source IP address 
	 // IPPack[16] starting point of destination IP address 
	retcode = tcp.TCPHandler(&IPPack[HeaderLength],(TotalLength-HeaderLength),&IPPack[12],
				&IPPack[16], protocol, macaddr, starttime, currenttask);	
	return retcode;
   }
   else if(protocol == UDP)
   {
         //if it is UDP, give it to UDP handler  
        retcode = udp.UDPHandler(&IPPack[HeaderLength],(TotalLength-HeaderLength),&IPPack[12],
				&IPPack[16], protocol, currenttask); 
	return retcode;
   }
   else
   {
   	return -7; //other packets, discard them...
   }
	return 0; //should never come here  
}


//*************************************
// This function prints IP statistics 
void IPObj::printStatistics(int Line)
{
AOAProtected io;
io.AOAPrintText("IP Statistics",Line);
io.AOAPrintText("Total Number of IP Packets Received              :",Line + 160);
io.AOAprintHex(noippacksr,Line+ 260 + 4); 
io.AOAPrintText("Total Number of IP Packets sent                  :",Line+ 320 );
io.AOAprintHex(noippackss,Line+ 420 + 4);
io.AOAPrintText("Total Number of IP Packets Successfully Processed:",Line+ 480 );
io.AOAprintHex(noippacksps,Line+ 580 + 4);
}
//*************************************
