//****************************************************
// ARPObj.cpp 
// Implementation file for ARPObj 
// Coded by Karthick Venkatasamy Jaganathan
// Dated 09/18/04
// Towson University, Copyright 2004 
// ***************************************************
#include "arpobj.h"
#include "../Interfaces/aoaprotected.h"
#include "../FTOP/FTOPObj.h"
// ftpobj.h is for fault tolerance, two servers running 
//  if one fails, the other will take over, they have same
//  IP address 
// ***************************************************
arprecord ARPObj::ARPTABLE[ARPTABLE_COUNT];
arprecordT ARPObj::ARPT[ARPT_COUNT];
int ARPObj::hashind[100];
char ARPObj::mSenderHA[6];
char ARPObj::mSenderIP[4];
char ARPObj::GateWayIP[4];
int ARPObj::FreePtr=-1;
char ARPObj::SUBNETMASK[4];	
unsigned long ARPObj::noArpresolves = 0;	// Number of successful ARP resoultion
unsigned long ARPObj::noArpresolvef = 0;	// Number of failed ARP Resolution
unsigned long ARPObj::noArprequestp = 0;	// Number of incomming request processed
unsigned long ARPObj::noArppackp = 0;	// Total number of ARP Request processed processed 
int ARPObj::resolveFlagForFileTransfer = 0;

int ARPObj::ARPT_Index=0;
// ***************************************************
// Default constructor is not used 
// use the init function instead 
// ***************************************************
ARPObj::ARPObj()
{
	mHardwareType = 0x01;
	// 0x01 for Ethernet
	mProtocol = 0x0800;
	// 0x0806 for IP which goes into ARP Packet
	mHlen = 0x06;
	// HArdware Address Length 6 for Ethernet
	
	mPLen = 0x04;
	// Protocol Address Length 4 bytes for Protocol

	PROTOCOL_TYPE = 0x0806;

	// Assign the MAC Address for the senderHA
	EO.getMAC(mSenderHA);	
	
}
//*************************************************************************************************************
// This function should be used only once in an application to initialize the ARPObject
//   The ARP object is instantiated once in test.cpp
//   senderIP: this machine or source 
//   subNetMask of the current network 
//   Gateway IP 
//   >ipconfig /all will show you the above paramters 
//*************************************************************************************************************
ARPObj::init(char* senderIP, char * SubNetMask, char* GwayIP)
{
	
	mHardwareType = 0x01;
	// 0x01 for Ethernet
	mProtocol = 0x0800;
	// 0x0806 for IP which goes into ARP Packet
	mHlen = 0x06;
	// HArdware Address Length 6 for Ethernet
	
	mPLen = 0x04;
	// Protocol Address Length 4 bytes for Protocol

	
	PROTOCOL_TYPE = 0x0806;
	// Initialize the PROTOCOL_TYPE for Arp

	// Assign the MAC Address for the senderHA
	EO.getMAC(mSenderHA); //EO	
	
	int i;	
	for(i=0; i< 4; i++)
	    GateWayIP[i] = GwayIP[i];
	for(i=0; i< 4; i++)
	    SUBNETMASK[i] = SubNetMask[i];	
	
	for(i=0; i<4; i++)
		mSenderIP[i] = senderIP[i];
	// Initialize the Senders IP Address to the Address Obtained from the Application
	
	// Clear the contents of the ARP Table
	for(i=0; i<ARPTABLE_COUNT; i++)
	{
	    ARPTABLE[i].ip[0]= '\0';
	    ARPTABLE[i].mac[0]= '\0'; 
	    ARPTABLE[i].next = i+1;
	}

	// Clear the contents of the ARP Table
	for(i=0; i<ARPT_COUNT; i++)
	{
	    ARPT[i].ip[0]= '\0';
	    ARPT[i].mac[0]= '\0'; 
	}
	//clear hash index table 
	for(i=0;i<100;i++)
	{
	    hashind[i]=-1; //null values 
	}
	ARPTABLE[ARPTABLE_COUNT-1].next = -1;
	FreePtr = 0;	
	// Initialize the ARP Table Loop Count
}
//**********************************************************************************************************************
//ARP Broadcast
// this method is used to change the ip-mac pair entry in the switch 
//**********************************************************************************************************************
int ARPObj::ARPBroadcast(char* targetIP, char *srcip, char *srcmac)
{
    int retcode=0;
	char ARP_PACK[70];
	char targetHA[6] = {0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF}; //broadcast address ;
	int i=0;

	// Assign the mHardware Address Type i.e Ethernet to the first twobytes of the packet
	ARP_PACK[0] = ((mHardwareType >> 8) & 0x00FF);
	ARP_PACK[1] = (mHardwareType & 0x00FF);

	// Assign the mProtocol Address Type i.e Ethernet to the 3rd and fourth bytes of the packet
	ARP_PACK[2] = ((mProtocol >> 8) & 0x00FF);
	ARP_PACK[3] = (mProtocol & 0x00FF);
	
	// Assign the Hardware Address size i.e 6 bytes for Ethernet
	ARP_PACK[4] = (mHlen & 0x00FF);
	// Assign the mProtocol Address size i.e 4 bytes for Ethernet
	ARP_PACK[5] = (mPLen & 0x00FF);

	// Assign the OPCODE 
	ARP_PACK[6] = ( (REQUEST >> 8) & 0x00FF);
	ARP_PACK[7] = ( REQUEST  & 0x00FF);
	
	// Assign the sender MAC Address and the target MAC Address in the packet
	for(i=0; i<6; i++)
	{
		ARP_PACK[i+8] = srcmac[i];
		ARP_PACK[i+18] = 0x00;
	}
	// Copy the source and target IP Address into the Packet
	for(i=0; i<4; i++)
	{
		ARP_PACK[14+i] = srcip[i];
		ARP_PACK[24+i] = targetIP[i];
	}

	retcode = EO.ARPInsertPkt(ARP_PACK, 28, PROTOCOL_TYPE, srcmac,
			(char*)&targetHA, 0x7, 0);


return 0;  
};

//**********************************************************************************************************************
// This function resolves the targets MAC for the Target IP Address
// It returns 0 if successful
// It returns -1 if unsuccessful
// Target MAC Address is placed back in targetMAC
// Input for this function is targetIP
//**********************************************************************************************************************
int ARPObj::Resolve(char* stargetIP, char* targetMAC, int currenttask)
{
        int retcode=0;
    	char targetIP[4];
	char ARP_PACK[100];
	char targetHA[6] = {0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF}; //broadcast address ;
	int ARP_Found_Flag=-1; // not found
	int i=0;
        int j=0;	
	int count1 = 0; 

	//if the IP address is in the local network, resolve the MAC for that address 
	// else resolve the MAC address for the gateway 
	if((stargetIP[0] & SUBNETMASK[0]) == (mSenderIP[0] & SUBNETMASK[0]) &&   
		(stargetIP[1] & SUBNETMASK[1]) == (mSenderIP[1] & SUBNETMASK[1]) &&
		(stargetIP[2] & SUBNETMASK[2]) == (mSenderIP[2] & SUBNETMASK[2]) &&
		(stargetIP[3] & SUBNETMASK[3]) == (mSenderIP[3] & SUBNETMASK[3])) //test for local network 
		{
		    for(int m=0;m<4;m++)
		    {
			targetIP[m] = stargetIP[m]; //local IP 
		    }
		}
	else
	{
	    	    for(int m=0;m<4;m++)
		    {
			targetIP[m] = GateWayIP[m]; //gateway IP 
		    } 
	}
	
	//search through the list to find the MAC address 
	for(i=0; i<ARPT_COUNT; i++)
	{
	if(ARPT[i].ip[0]== targetIP[0] && ARPT[i].ip[1]== targetIP[1] &&
	   ARPT[i].ip[2]== targetIP[2] && ARPT[i].ip[3]== targetIP[3])	
		{
		    ARP_Found_Flag = 0; //found 
		    break;
		}
		else
		{
		    ARP_Found_Flag = -1; // not found 
		}
	}
/*
	for(j=0; j<ARPT_COUNT; j++)
	{
  	  io.AOAprintHex(ARPT[j].ip[0], Line1+j*320);
  	  io.AOAprintHex(ARPT[j].ip[1], Line1+20+j*320);
  	  io.AOAprintHex(ARPT[j].ip[2], Line1+40+j*320);
  	  io.AOAprintHex(ARPT[j].ip[3], Line1+60+j*320);
  	  
	  io.AOAprintHex(ARPT[j].mac[0], Line2+j*320);
  	  io.AOAprintHex(ARPT[j].mac[1], Line2+20+j*320);
  	  io.AOAprintHex(ARPT[j].mac[2], Line2+40+j*320);
  	  io.AOAprintHex(ARPT[j].mac[3], Line2+60+j*320);
  	  io.AOAprintHex(ARPT[j].mac[4], Line2+80+j*320);
  	  io.AOAprintHex(ARPT[j].mac[5], Line2+100+j*320);
	}
*/
	
	//set the target MAC from the table 
	if(ARP_Found_Flag == 0)
	{
	    for(int k=0; k <6; k++)	
		targetMAC[k] = ARPT[i].mac[k];
	    return ARP_Found_Flag;
	}
	else
	{
	//if the target MAC is not found in the table, comes here.....
	// Assign the mHardware Address Type i.e Ethernet to the first twobytes of the packet
	ARP_PACK[0] = ((mHardwareType >> 8) & 0x00FF);
	ARP_PACK[1] = (mHardwareType & 0x00FF);

	// Assign the mProtocol Address Type i.e Ethernet to the 3rd and fourth bytes of the packet
	ARP_PACK[2] = ((mProtocol >> 8) & 0x00FF);
	ARP_PACK[3] = (mProtocol & 0x00FF);
	
	// Assign the Hardware Address size i.e 6 bytes for Ethernet
	ARP_PACK[4] = (mHlen & 0x00FF);
	// Assign the mProtocol Address size i.e 4 bytes for Ethernet
	ARP_PACK[5] = (mPLen & 0x00FF);

	// Assign the OPCODE 
	ARP_PACK[6] = ( (REQUEST >> 8) & 0x00FF);
	ARP_PACK[7] = ( REQUEST  & 0x00FF);
	
	// Assign the sender MAC Address and the target MAC Address in the packet
	for(i=0; i<6; i++)
	{
		ARP_PACK[i+8] = mSenderHA[i];
		ARP_PACK[i+18] = 0x00;
	}
	// Copy the source and target IP Address into the Packet
	for(i=0; i<4; i++)
	{
		ARP_PACK[14+i] = mSenderIP[i];
		ARP_PACK[24+i] = targetIP[i];
	}

	//send the request to resolve the MAC address 
	//RKKW
	//update total count as well 
	retcode = io.AOAgetSharedMem(0xb4); 
	retcode++; 
	io.AOAsetSharedMem(0xb4,retcode); 
	//update counters 
       retcode = io.AOAgetSharedMem(0xd0); 
       retcode++; 
       io.AOAsetSharedMem(0xd0,retcode); 
	retcode = EO.ARPInsertPkt(ARP_PACK,28,PROTOCOL_TYPE,(char*)&mSenderHA,
			(char*)&targetHA, 0x7, currenttask);
	//ARPTYPE hard coded, values are named in tcpobj.h file 

	count1 = io.AOAgetSharedMem(0xb8); 
	count1++; 
	io.AOAsetSharedMem(0xf0, count1); 

	}

/* sdp	  
 	int retcode; 
    	char targetIP[4];
	char ARP_PACK[100];
	char targetHA[6] = {0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF}; //broadcast address 
	int ARP_Found_Flag=-1; // not found
	// 0 - Denotes ARP Entry is found in the ARP TABLE
	// 1 - Denotes ARP Entry is not Found in the ARP TABLE
	// Buffer to send an ARP Reply 
	
	int i =-1 ; // Loop Count Variable
        int j=0;	
	// check if the MAC entry is there in the ARP Table if so return the mac address 
	// apptask task;
	int hashValue = hashFun(stargetIP);
	int next = hashind[hashValue];

	//if the IP address is in the local network, resolve the MAC for that address 
	// else resolve the MAC address for the gateway 
	if((stargetIP[0] & SUBNETMASK[0]) == (mSenderIP[0] & SUBNETMASK[0]) &&   
		(stargetIP[1] & SUBNETMASK[1]) == (mSenderIP[1] & SUBNETMASK[1]) &&
		(stargetIP[2] & SUBNETMASK[2]) == (mSenderIP[2] & SUBNETMASK[2]) &&
		(stargetIP[3] & SUBNETMASK[3]) == (mSenderIP[3] & SUBNETMASK[3])) //test for local network 
		{
		    for(int m=0;m<4;m++)
		    {
			targetIP[m] = stargetIP[m]; //local IP 
		    }
		}
	else
	{
	    	    for(int m=0;m<4;m++)
		    {
			targetIP[m] = GateWayIP[m]; //gateway IP 
		    } 
	}
	//search through the list to find the MAC address 
	while(next != -1)
	{
	if(ARPTABLE[next].ip[0]== targetIP[0] && ARPTABLE[next].ip[1]== targetIP[1] && ARPTABLE[next].ip[2]== targetIP[2] && ARPTABLE[next].ip[3]== targetIP[3])	
		{
		    ARP_Found_Flag = 0; //found 
		    break;
		}
		else
		{
		    ARP_Found_Flag = -1; // not found 
		    next = ARPTABLE[next].next; //not found 
		}
	}

	//set the target MAC from the table 
	if(ARP_Found_Flag == 0)
	{
	    for(int k=0; k <6; k++)	
		targetMAC[k] = ARPTABLE[next].mac[k];
	    return ARP_Found_Flag;
	}
	else
	{
	//if the target MAC is not found in the table, comes here.....
	// Assign the mHardware Address Type i.e Ethernet to the first twobytes of the packet
	ARP_PACK[0] = ((mHardwareType >> 8) & 0x00FF);
	ARP_PACK[1] = (mHardwareType & 0x00FF);

	// Assign the mProtocol Address Type i.e Ethernet to the 3rd and fourth bytes of the packet
	ARP_PACK[2] = ((mProtocol >> 8) & 0x00FF);
	ARP_PACK[3] = (mProtocol & 0x00FF);
	
	// Assign the Hardware Address size i.e 6 bytes for Ethernet
	ARP_PACK[4] = (mHlen & 0x00FF);
	// Assign the mProtocol Address size i.e 4 bytes for Ethernet
	ARP_PACK[5] = (mPLen & 0x00FF);

	// Assign the OPCODE 
	ARP_PACK[6] = ( (REQUEST >> 8) & 0x00FF);
	ARP_PACK[7] = ( REQUEST  & 0x00FF);
	
	// Assign the sender MAC Address and the target MAC Address in the packet
	for(i=0; i<6; i++)
	{
		ARP_PACK[i+8] = mSenderHA[i];
		ARP_PACK[i+18] = 0x00;
	}
	// Copy the source and target IP Address into the Packet
	for(i=0; i<4; i++)
	{
		ARP_PACK[14+i] = mSenderIP[i];
		ARP_PACK[24+i] = targetIP[i];
	}

	//send the request to resolve the MAC address 
	//RKKW
	//update total count as well 
	retcode = io.AOAgetSharedMem(0xb4); 
	retcode++; 
	io.AOAsetSharedMem(0xb4,retcode); 	
	//update counters 
       retcode = io.AOAgetSharedMem(0xd0); 
       retcode++; 
       io.AOAsetSharedMem(0xd0,retcode); 
	retcode = EO.ARPInsertPkt(ARP_PACK,28,PROTOCOL_TYPE,(char*)&mSenderHA,
				(char*)&targetHA, 0x07, currenttask);
	}
*/
	
noArpresolvef++;
return ARP_Found_Flag;  
}
//***************************************************************************************************************
// This function Handles all the ARP Messages in the network
// The input is a char pointer to the buffer of the packet and the size of the packet
// This function gets the packet finds out the type of packet and takes response based on the type of the packet
// This function must be invoked by the Ethernet Module to handle the arp packets for processing and this Ethernet
// invoked from RcvTask 
// return codes 
//    -1 hardware type mismatch 
//    -2 protocol mismatch 
//    -3 length of hardware address mismatch 
//    -4 protocol address length mismatch 
//    -5 not a reply or request, can't be handled 
//    -6 should never happen 
//    -7 IP no match (ProcessRequest) 
//    -8, -9 DPD slot or memory errors catastrophic!
//    Reply and Request error codes are returned to the caller directly 
//**************************************************************************************************************
int ARPObj::ARPHandler(char* ARPPack,int size, int currenttask)
{

int temp =0;
int retcode = 0; 
noArppackp++;	//Increment if for statistics 
// Check for the HArdware MAC Address Type in the ARP Protocol Header
temp = ARPPack[0] & 0x00FF;
temp = temp << 8;
temp = temp | (ARPPack[1] & 0x00FF);

if(temp != mHardwareType)	
{	
    return -1;
}

// Check for the Protocol Address Type in the ARP Protocol Header
temp =0;
temp = ARPPack[2] & 0x00FF;
temp = temp << 8;
temp = temp | (ARPPack[3] & 0x00FF);
if(temp != mProtocol)
    return -2;

// Check for the   the Length of hardware address
temp =0;
temp = ARPPack[4] & 0x00FF;
if(temp != mHlen)
    return -3;

// Check for the Protocol Address Length of the  ARP PAcket
temp =0;
temp = ARPPack[5] & 0x00FF;
if(temp != mPLen)
    return -4;

// Check for the Opcode if the Opcode is Procesable process it or else discard it
temp =0;
temp = ARPPack[6] & 0x00FF;
temp = temp << 8;
temp = temp | (ARPPack[7] & 0x00FF);

if(temp == REQUEST)  //01
	{
	   	// Process the Request ARP Message 
		retcode = ProcessRequest(ARPPack, size, currenttask);	
		return retcode; 
	}

else if(temp == REPLY)  //02 
	{
		// Process ARP Replies	    
		retcode = ProcessReplies(ARPPack,size);	
		return retcode; 

	}
else 
	{
	    return -5;
	}
  
return -6;
}

//******************************************************************************************************
// This function Processes the incomming ARP Request Messages
// The input is a char pointer to the buffer of the packet and the size of the packet
// The Function Gets the Request Packet Check if the ARP Request is for itself, then replies the request
// Returns 0 if the Packet is successfully processed 
// ****************************************************************************************************
int ARPObj::ProcessRequest(char* ARPPack, int size, int currenttask)
{
    FTOPObj fto; 
    int i=0;
    char ARP_PACK[100];
    int retcode; 
    noArprequestp++;	// Number of incomming request processed 
    int ARPFound=0;
    int count1 = 0; 

    while(1); 
	if((ARPPack[24] == mSenderIP[0]) && (ARPPack[25] == mSenderIP[1]) 
		&& (ARPPack[26] == mSenderIP[2]) && (ARPPack[27] == mSenderIP[3]))  //big if 
	  {

	     	// Format A Reply Packet and send it back
		ARP_PACK[0] = ((mHardwareType >> 8) & 0x00FF);
		ARP_PACK[1] = (mHardwareType & 0x00FF);

		// Assign the mProtocol Address Type i.e Ethernet to the 3rd and fourth bytes of the packet
		ARP_PACK[2] = ((mProtocol >> 8) & 0x00FF);
		ARP_PACK[3] = (mProtocol & 0x00FF);
	
		// Assign the Hardware Address size i.e 6 bytes for Ethernet
		ARP_PACK[4] = (mHlen & 0x00FF);
		
		// Assign the mProtocol Address size i.e 4 bytes for Ethernet
		ARP_PACK[5] = (mPLen & 0x00FF);

		// Assign the OPCODE 
		ARP_PACK[6] = ( (REPLY >> 8) & 0x00FF);
		ARP_PACK[7] = ( REPLY  & 0x00FF);
	
		// Assign the sender MAC Address and the target MAC Address in the packet
		for(i=0; i<6; i++)
		{
		ARP_PACK[i+8] = mSenderHA[i];
		ARP_PACK[i+18] = ARPPack[8+i];
		}
		
		// Copy the source and target IP Address into the Packet
		for(i=0; i<4; i++)
		{
		ARP_PACK[14+i] = mSenderIP[i];
		ARP_PACK[24+i] = ARPPack[14+i];
		}

		if(fto.getMode() == 1)
		{
	       //RKKW
	      
	       //update counters 
	       retcode = io.AOAgetSharedMem(0xd0); 
	       retcode++; 
	       io.AOAsetSharedMem(0xd0,retcode); 
	//update total count as well 
	retcode = io.AOAgetSharedMem(0xb4); 
	retcode++; 
	io.AOAsetSharedMem(0xb4,retcode); 
	//update counters 
       retcode = io.AOAgetSharedMem(0xd0); 
       retcode++; 
       io.AOAsetSharedMem(0xd0,retcode); 
	retcode = EO.ARPInsertPkt(ARP_PACK,28,PROTOCOL_TYPE,(char*)&mSenderHA,
							(char*)&(ARPPack[8]), 0x07, currenttask);
	        if (retcode != 0) 
		  {
		    return retcode;  //DPD slot or memory error 
		  }
		}

		ARPFound = 0;
		for(i=0; i<ARPT_Index; i++)
		{
	 	if(ARPT[i].ip[0] == ARPPack[14] && ARPT[i].ip[1] == ARPPack[15] &&
	 	   ARPT[i].ip[2] == ARPPack[16] && ARPT[i].ip[3] == ARPPack[17])
		   {
		    ARPFound = 1;
		    break;
		   }
		}
		// Update the ARP Table Entries
		//  To insert client's IP and Ethernet address in the ARP Table 
	        if(ARPFound == 0)
		{
		  ARPT[ARPT_Index].ip[0] = ARPPack[14];
		  ARPT[ARPT_Index].ip[1] = ARPPack[15]; 
		  ARPT[ARPT_Index].ip[2] = ARPPack[16]; 
		  ARPT[ARPT_Index].ip[3] = ARPPack[17]; 
 		  ARPT[ARPT_Index].mac[0] = ARPPack[8];
		  ARPT[ARPT_Index].mac[1] = ARPPack[9]; 
		  ARPT[ARPT_Index].mac[2] = ARPPack[10]; 
		  ARPT[ARPT_Index].mac[3] = ARPPack[11]; 
		  ARPT[ARPT_Index].mac[4] = ARPPack[12]; 
		  ARPT[ARPT_Index].mac[5] = ARPPack[13];  
		
		  ARPT_Index++;
		}
	}
    
/* sdp
	if((ARPPack[24] == mSenderIP[0]) && (ARPPack[25] == mSenderIP[1]) 
		&& (ARPPack[26] == mSenderIP[2]) && (ARPPack[27] == mSenderIP[3]))  //big if 
	  {

	     	// Format A Reply Packet and send it back
		ARP_PACK[0] = ((mHardwareType >> 8) & 0x00FF);
		ARP_PACK[1] = (mHardwareType & 0x00FF);

		// Assign the mProtocol Address Type i.e Ethernet to the 3rd and fourth bytes of the packet
		ARP_PACK[2] = ((mProtocol >> 8) & 0x00FF);
		ARP_PACK[3] = (mProtocol & 0x00FF);
	
		// Assign the Hardware Address size i.e 6 bytes for Ethernet
		ARP_PACK[4] = (mHlen & 0x00FF);
		
		// Assign the mProtocol Address size i.e 4 bytes for Ethernet
		ARP_PACK[5] = (mPLen & 0x00FF);

		// Assign the OPCODE 
		ARP_PACK[6] = ( (REPLY >> 8) & 0x00FF);
		ARP_PACK[7] = ( REPLY  & 0x00FF);
	
		// Assign the sender MAC Address and the target MAC Address in the packet
		for(i=0; i<6; i++)
		{
		ARP_PACK[i+8] = mSenderHA[i];
		ARP_PACK[i+18] = ARPPack[8+i];
		}
		
		// Copy the source and target IP Address into the Packet
		for(i=0; i<4; i++)
		{
		ARP_PACK[14+i] = mSenderIP[i];
		ARP_PACK[24+i] = ARPPack[14+i];
		}

		if(fto.getMode() == 1)
		{
	       //RKKW
	      //update counters 
	       retcode = io.AOAgetSharedMem(0xd0); 
	       retcode++; 
	       io.AOAsetSharedMem(0xd0,retcode); 
	//update total count as well 
	retcode = io.AOAgetSharedMem(0xb4); 
	retcode++; 
	io.AOAsetSharedMem(0xb4,retcode); 
	//update counters 
       retcode = io.AOAgetSharedMem(0xd0); 
       retcode++; 
       io.AOAsetSharedMem(0xd0,retcode); 
	retcode = EO.ARPInsertPkt(ARP_PACK,28,PROTOCOL_TYPE,(char*)&mSenderHA,
                 (char*)&(ARPPack[8]), 0x07, currenttask);
	        if (retcode != 0) 
		  {
		    return retcode;  //DPD slot or memory error 
		  }
		}
		
		// Update the ARP Table Entries
		//  To insert client's IP and Ethernet address in the ARP Table 

		i =0;
		// Flag used to check if a mac address is in the ARP Table
		int ARPFound =0;
		// Flag used to check for an empty entry in the ARP Table
		int ARPEmpty =0;
		// Check if the Entry is found in the ARP Table
		int hashValue = hashFun(&ARPPack[14]);
		int nextval;
		int next;
		
		if(hashind[hashValue]==-1)
		{
		  ARPTABLE[FreePtr].ip[0] = ARPPack[14];
		  ARPTABLE[FreePtr].ip[1] = ARPPack[15]; 
		  ARPTABLE[FreePtr].ip[2] = ARPPack[16]; 
		  ARPTABLE[FreePtr].ip[3] = ARPPack[17]; 
 		  ARPTABLE[FreePtr].mac[0] = ARPPack[8];
		  ARPTABLE[FreePtr].mac[1] = ARPPack[9]; 
		  ARPTABLE[FreePtr].mac[2] = ARPPack[10]; 
		  ARPTABLE[FreePtr].mac[3] = ARPPack[11]; 
		  ARPTABLE[FreePtr].mac[4] = ARPPack[12]; 
		  ARPTABLE[FreePtr].mac[5] = ARPPack[13];  
		  nextval = FreePtr;
 		  FreePtr = ARPTABLE[FreePtr].next;  
		  ARPTABLE[nextval].next=-1;  
		  hashind[hashValue] = nextval;
		}
		else
		{
		   next = hashind[hashValue];
		   ARPFound = -1;
		   //search the used list until end of used list for that hash value 
		   while(next !=-1)
		   {
		      	if(ARPTABLE[next].mac[0] == ARPPack[8] && ARPTABLE[next].mac[1] == ARPPack[9] && ARPTABLE[next].mac[2] == ARPPack[10] && ARPTABLE[next].mac[3] == ARPPack[11] && ARPTABLE[next].mac[4] == ARPPack[12] && ARPTABLE[next].mac[5] == ARPPack[13])
			{
			    //found an entry for the corresponding hash key 
			    ARPFound = 1;
			    break;
			}
			next = ARPTABLE[next].next;
		   } //end of while 
		    
		} //end of else 
	// Update the ARP Table Entries
		if(ARPFound ==1)
    		{
			//update the IP address in the table for that hash key 
			ARPTABLE[next].ip[0] = ARPPack[14];
			ARPTABLE[next].ip[1] = ARPPack[15];
			ARPTABLE[next].ip[2] = ARPPack[16];
			ARPTABLE[next].ip[3] = ARPPack[17];
		}
		else
		{
			//update both IP and MAC address 
		  	ARPTABLE[FreePtr].ip[0] = ARPPack[14];
		  	ARPTABLE[FreePtr].ip[1] = ARPPack[15]; 
		  	ARPTABLE[FreePtr].ip[2] = ARPPack[16]; 
		  	ARPTABLE[FreePtr].ip[3] = ARPPack[17]; 
 		  	ARPTABLE[FreePtr].mac[0] = ARPPack[8];
		  	ARPTABLE[FreePtr].mac[1] = ARPPack[9]; 
		  	ARPTABLE[FreePtr].mac[2] = ARPPack[10]; 
		  	ARPTABLE[FreePtr].mac[3] = ARPPack[11]; 
		  	ARPTABLE[FreePtr].mac[4] = ARPPack[12]; 
		  	ARPTABLE[FreePtr].mac[5] = ARPPack[13];  
		  	nextval = FreePtr;
 		  	FreePtr = ARPTABLE[FreePtr].next;  
		  	ARPTABLE[nextval].next=hashind[hashValue];  
			hashind[hashValue] = nextval; 
		} //end of else 
	return 0;  	
	}   //end of big if 
	else
	{
	return -7;  // IP no match 
	}
*/
	return 0;   //never comes here 
}

//***************************************************************************************************************
// This function Processes the incomming ARP Reply Messages
// The input is a char pointer to the buffer of the packet and the size of the packet
// The Function Gets the Request Packet Check if the ARP Request is for itself, then replies the request
// Returns 0 if the Packet is successfully processed 
// **************************************************************************************************************
int ARPObj::ProcessReplies(char* ARPPack,int size)
{
	int ARPFound=0;
	int i=0;
	//check IP addresses in the ARP packet 
	// check if it is for this machine 
	if((ARPPack[24] == mSenderIP[0]) && (ARPPack[25] == mSenderIP[1]) && 
		(ARPPack[26] == mSenderIP[2]) && (ARPPack[27] == mSenderIP[3]))   //big if 
	  {
		ARPFound = 0;

		for(i=0; i<ARPT_Index; i++)
		{
	 	if(ARPT[i].ip[0] == ARPPack[14] && ARPT[i].ip[1] == ARPPack[15] &&
	 	   ARPT[i].ip[2] == ARPPack[16] && ARPT[i].ip[3] == ARPPack[17])
		   {
		    ARPFound = 1;
		    break;
		   }
		}

		// Update the ARP Table Entries
		//  To insert client's IP and Ethernet address in the ARP Table 
	        if(ARPFound == 0)
		{
		  ARPT[ARPT_Index].ip[0] = ARPPack[14];
		  ARPT[ARPT_Index].ip[1] = ARPPack[15]; 
		  ARPT[ARPT_Index].ip[2] = ARPPack[16]; 
		  ARPT[ARPT_Index].ip[3] = ARPPack[17]; 
 		  ARPT[ARPT_Index].mac[0] = ARPPack[8];
		  ARPT[ARPT_Index].mac[1] = ARPPack[9]; 
		  ARPT[ARPT_Index].mac[2] = ARPPack[10]; 
		  ARPT[ARPT_Index].mac[3] = ARPPack[11]; 
		  ARPT[ARPT_Index].mac[4] = ARPPack[12]; 
		  ARPT[ARPT_Index].mac[5] = ARPPack[13];  
		  ARPT_Index++;
		}
				  
	}  //end of big if 			
/* sdp			
	//check IP addresses in the ARP packet 
	// check if it is for this machine 
	if((ARPPack[24] == mSenderIP[0]) && (ARPPack[25] == mSenderIP[1]) && (ARPPack[26] == mSenderIP[2]) && (ARPPack[27] == mSenderIP[3]))   //big if 
	  {
		// Flag used to check if a mac address is in the ARP Table
		int ARPFound =0;
		// Flag used to check for an empty entry in the ARP Table
		int ARPEmpty =0;
		int hashValue = hashFun(&ARPPack[14]);
		int nextval;
		int next =0;

		if(hashind[hashValue]==-1)
		{
		  ARPTABLE[FreePtr].ip[0] = ARPPack[14];
		  ARPTABLE[FreePtr].ip[1] = ARPPack[15]; 
		  ARPTABLE[FreePtr].ip[2] = ARPPack[16]; 
		  ARPTABLE[FreePtr].ip[3] = ARPPack[17]; 
 		  ARPTABLE[FreePtr].mac[0] = ARPPack[8];
		  ARPTABLE[FreePtr].mac[1] = ARPPack[9]; 
		  ARPTABLE[FreePtr].mac[2] = ARPPack[10]; 
		  ARPTABLE[FreePtr].mac[3] = ARPPack[11]; 
		  ARPTABLE[FreePtr].mac[4] = ARPPack[12]; 
		  ARPTABLE[FreePtr].mac[5] = ARPPack[13];  
		  nextval = FreePtr;
 		  FreePtr = ARPTABLE[FreePtr].next;  
		  ARPTABLE[nextval].next=-1;  
		  hashind[hashValue] = nextval;
		}
		else //there is already a used list 
		{
		   next = hashind[hashValue];
		   ARPFound = -1;

		   //find the actual entry in the list 
		   while(next !=-1)
		   {
		      	if(ARPTABLE[next].mac[0] == ARPPack[8] && ARPTABLE[next].mac[1] == ARPPack[9] && ARPTABLE[next].mac[2] == ARPPack[10] && ARPTABLE[next].mac[3] == ARPPack[11] && ARPTABLE[next].mac[4] == ARPPack[12] && ARPTABLE[next].mac[5] == ARPPack[13])
			{
			    ARPFound = 1;
			    break;
			}
			next = ARPTABLE[next].next;
		   }
		    
		}
		// If found 
		// Update the ARP Table Entries
		if(ARPFound ==1)
    		{
			ARPTABLE[next].ip[0] = ARPPack[14];
			ARPTABLE[next].ip[1] = ARPPack[15];
			ARPTABLE[next].ip[2] = ARPPack[16];
			ARPTABLE[next].ip[3] = ARPPack[17];
		}
		else
		{
		        //store IP and Ethernet address 
		  	ARPTABLE[FreePtr].ip[0] = ARPPack[14];
		  	ARPTABLE[FreePtr].ip[1] = ARPPack[15]; 
		  	ARPTABLE[FreePtr].ip[2] = ARPPack[16]; 
		  	ARPTABLE[FreePtr].ip[3] = ARPPack[17]; 
 		  	ARPTABLE[FreePtr].mac[0] = ARPPack[8];
		  	ARPTABLE[FreePtr].mac[1] = ARPPack[9]; 
		  	ARPTABLE[FreePtr].mac[2] = ARPPack[10]; 
		  	ARPTABLE[FreePtr].mac[3] = ARPPack[11]; 
		  	ARPTABLE[FreePtr].mac[4] = ARPPack[12]; 
		  	ARPTABLE[FreePtr].mac[5] = ARPPack[13];  
		  	nextval = FreePtr;
 		  	FreePtr = ARPTABLE[FreePtr].next;  
		  	ARPTABLE[nextval].next=hashind[hashValue];  
			hashind[hashValue] = nextval; 
		}	
	}  //end of big if 
*/
	
	return 0;   //normal return 
}
//*******************************************************************************************
//   Hash Function 
//   100 entries;  based on adding 4 bytes of an IP address 
//    this will generate an index to the ARP table 
//*******************************************************************************************
int ARPObj::hashFun(char *ip)
{
int temp=0;
int i=0;
for(i=0;i<4;i++)
{
    temp = temp + ip[i];
}
return (temp%100);
}

//*****************************************************************************
//Not USED 
//*****************************************************************************
void ARPObj::close(){
	//EO.Close();
}
//*****************************************************************************
// This function is only used for running multiple servers 
//  invoked in ftop 
//  sends a broadcast message to the network, so that new server's MAC 
//    address will be updated in the gateway...
//*****************************************************************************
int ARPObj::Response(char* targetIP, int currenttask)
{
	int retcode; 
	char ARP_PACK[100];
	char targetHA[6] = {0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF}; //braodcast address 
	int count1 = 0; 

	//assemble ARP packet 
	// Assign the mHardware Address Type i.e Ethernet to the first twobytes of the packet
	ARP_PACK[0] = ((mHardwareType >> 8) & 0x00FF);
	ARP_PACK[1] = (mHardwareType & 0x00FF);

	// Assign the mProtocol Address Type i.e Ethernet to the 3rd and fourth bytes of the packet
	ARP_PACK[2] = ((mProtocol >> 8) & 0x00FF);
	ARP_PACK[3] = (mProtocol & 0x00FF);
	
	// Assign the Hardware Address size i.e 6 bytes for Ethernet
	ARP_PACK[4] = (mHlen & 0x00FF);
	// Assign the mProtocol Address size i.e 4 bytes for Ethernet
	ARP_PACK[5] = (mPLen & 0x00FF);

	// Assign the OPCODE 
	ARP_PACK[6] = ( (REPLY >> 8) & 0x00FF);
	ARP_PACK[7] = ( REPLY  & 0x00FF);
	
	// Assign the sender MAC Address and the target MAC Address in the packet
	for(int i=0; i<6; i++)
	{
		ARP_PACK[i+8] = mSenderHA[i];
		ARP_PACK[i+18] = 0xFF;
	}
	// Copy the source and target IP Address into the Packet
	for(i=0; i<4; i++)
	{
		ARP_PACK[14+i] = mSenderIP[i];
		ARP_PACK[24+i] = targetIP[i];
	}
	//send the ARP packet to the network for broadcasting 
	//RKKW
	//update total count as well 
	retcode = io.AOAgetSharedMem(0xb4); 
	retcode++; 
	io.AOAsetSharedMem(0xb4,retcode); 
	//update counters 
       retcode = io.AOAgetSharedMem(0xd0); 
       retcode++; 
       io.AOAsetSharedMem(0xd0,retcode); 
	retcode = EO.ARPInsertPkt(ARP_PACK,28,PROTOCOL_TYPE,(char*)&mSenderHA,
					(char*)&targetHA, 0x07, currenttask);
	//EO.Send(ARP_PACK,28,PROTOCOL_TYPE,(char*)&mSenderHA,(char*)&targetHA);
	return 0;
}

//*************************************
// This function prints ARP statistics 
void ARPObj::printStatistics(int Line)
{
AOAProtected io;
io.AOAPrintText("ARP Statistics",Line);
io.AOAPrintText("Total Number of ARP Packets Processed    :",Line + 160);
io.AOAprintHex(noArppackp,Line+ 244 + 4); 
io.AOAPrintText("Total Number of ARP resolution successful:",Line+ 320 );
io.AOAprintHex(noArpresolves,Line+ 404 + 4);
io.AOAPrintText("Total Number of ARP resolution failed    :",Line+ 480 );
io.AOAprintHex(noArpresolvef,Line+ 564 + 4);
io.AOAPrintText("Total Number of ARP request processed    :",Line+ 640 );
io.AOAprintHex(noArprequestp,Line+ 724 + 4);
}
//*************************************
// print ARPT table 
// pass a starting line no 
// ************************************
void ARPObj::printARPTable(int Line)
{
AOAProtected io;

	for(int j=0; j < ARPT_COUNT; j++)
	{
  	  io.AOAprintHex(ARPT[j].ip[0], Line+j*320+20);
  	  io.AOAprintHex(ARPT[j].ip[1], Line+j*320+40);
  	  io.AOAprintHex(ARPT[j].ip[2], Line+j*320+60);
  	  io.AOAprintHex(ARPT[j].ip[3], Line+j*320+80);
  	  
	  io.AOAprintHex(ARPT[j].mac[0], Line+j*320+160+20);
  	  io.AOAprintHex(ARPT[j].mac[1], Line+j*320+160+40);
  	  io.AOAprintHex(ARPT[j].mac[2], Line+j*320+160+60);
  	  io.AOAprintHex(ARPT[j].mac[3], Line+j*320+160+80);
  	  io.AOAprintHex(ARPT[j].mac[4], Line+j*320+160+100);
  	  io.AOAprintHex(ARPT[j].mac[5], Line+j*320+160+120);
	}
};

