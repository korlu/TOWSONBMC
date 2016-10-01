//****************************************************
// EtherObj.cpp 
// Implementation file for EtherObj 
// Coded by Karthick Venkatasamy Jaganathan
// Dated 09/09/04
// Towson University, Copyright 2004 
// ***************************************************

#include "EtherObj.h"

//int EtherObj::TimerCount=0;
char EtherObj::mac[6];
short EtherObj::IO_BASE=0;
long  EtherObj::DownListPointer = 0;  //send 
long  EtherObj::DownListDataPointer = 0;
long  EtherObj::UpListPointer = 0;    //receieve 
long  EtherObj::SndLstSize = 0;    //size
long  EtherObj::RcvLstSize = 0;    //size
long  EtherObj::PacketSize = 0; // packet size

long  EtherObj::SendInPtr  = 1;   //InPtr for Send 
long  EtherObj::SendOutPtr = 1;    // OutPtr for Send 
long  EtherObj::ReceiveInPtr  = 0;   //InPtr for receive 
long  EtherObj::ReceiveOutPtr = 0;    // OutPtr for receive 
long  EtherObj::NoofPackets=0;

//-----------------------------------------------
//                        DPD
//-----------------------------------------------
// Offset    Entry
//	-------------------
//  28	|    Send Flag (0 or 1)
//	-------------------
//  24	|    Tx Status (usually 0xC0 if packet is txmitted successfully)
//      |   1 2 3 4 bytes   
//      |         4 th byte is TxStatus 
//      |       3 rd byte is for setting type of send by application 
//      |       1, 2 bytes are not used at this point 
//	-------------------
//  20	|   Previous DPD Ptr (address)
//	-------------------
//  16	|    Packet Id (0..(SndLstSize-1))
//	-------------------
//  12	|  Data Buffer Length (default at EO.createDataStrucutre() is 0x80000640; bit31=1 (last frame))
//	-------------------
//   8	|  Data Buffer Address
//	-------------------
//   4	|   Frame Start Header (default at EO.createDataStructure() is 0x1e008000  bit15=1 (enable tx intr))
//	-------------------
//   0	|    Next DPD Ptr (address)
//	-------------------
//
//-----------------------------------------------
//                        UPD
//-----------------------------------------------
// Offset    Entry
//	-------------------
//  28	|    Not used (default at init.asm is 0)
//	-------------------
//  24	|    Not used (default at init.asm is 0)
//	-------------------
//  20	|    Not used (default at init.asm is 0)
//	-------------------
//  16	|    Packet Id (0..(RcvLstSize-1))
//	-------------------
//  12	|  Data Buffer Length (default at EO.createDataStrucutre() is 0x80000640; bit31=1 (last frame))
//	-------------------
//   8	|  Data Buffer Address
//	-------------------
//   4	|   Frame Start Header (default at EO.createDataStructure() is 0)
//	-------------------
//   0	|    Next UPD Ptr (address)
//	-------------------
//
//****************************************************
// default does not change any member functions or data
//  use init() method to initialize EO only once 
//   so that EO can be instantiated many times 
//   without resetting the card over and over again 
//****************************************************
EtherObj::EtherObj()
{ 
}

//------------------------------------------
// get base address from the object 
//------------------------------------------
int EtherObj::getBaseAddress() 
  {
   return IO_BASE;  
  }
//------------------------------------------
// set base address in the object 
//------------------------------------------
void EtherObj::setBaseAddress(int addr) 
  {
    IO_BASE = addr; 
  }


//------------------------------------------
// create data structure for NIC card
//------------------------------------------
int EtherObj::createDataStructure(int p1, int p2, int p3, int p4, int p5,
				   int p6, int p7, int p8, int p9, int p10) 
  {
    DownListPointer = p8; //saved in the object for future reference  
    DownListDataPointer = p9; //saved in the object for future reference  
    // which is a dummy packet 
    UpListPointer   = p3; 
    SndLstSize = p6; 
    RcvLstSize = p1; 
    PacketSize = p10 & 0x1fff; // and with bits 0-12 to get length

    return ccreateDS(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, IO_BASE);
  }

//------------------------------------------
// enable transmitter  
//------------------------------------------
int EtherObj::enableTransmit() 
  {
   return cenableTransmit(IO_BASE,DownListPointer); 
  }
//------------------------------------------
// enable receiver 
//------------------------------------------
int EtherObj::enableReceive() 
  {
   return cenableReceive(IO_BASE); 
  }
//------------------------------------------
// disable receiver 
//------------------------------------------
int EtherObj::disableReceive() 
  {
   return cdisableReceive(IO_BASE); 
  }
//------------------------------------------
// disable transmit 
//------------------------------------------
int EtherObj::disableTransmit() 
  {
   return cdisableTransmit(IO_BASE); 
  }

//------------------------------------------
//  acknowledge interrupt
//------------------------------------------
int EtherObj::ackNICInt(int num) 
  {
   return cackNICInt(IO_BASE,num); 
  }
//------------------------------------------
// get current rcv ptr which indicates where the 
//  current pointer is for the rcv linked list 
//   this is similar to InPtr in a circular list 
//------------------------------------------
int EtherObj::getCurrentReceivePtr() 
  {
   int value = 0;
   int index = 0; 
   value = cgetCurrentReceivePtr(IO_BASE); 
   index =  (value - UpListPointer)/32; 
   return index; 
  }
//------------------------------------------
 int EtherObj::StopTransmitAt(int ptr) 
  {
   return cstopTransmitAt(ptr, DownListPointer); 
  }
//------------------------------------------
// get current snd ptr which indicates where the 
//  current pointer is for the send linked list 
//   this is similar to OutPtr in a circular list 
//------------------------------------------
 int EtherObj::getCurrentSendPtr() 
  {
   return cgetCurrentSendPtr(IO_BASE); 
  }
//------------------------------------------
// get transmit status
//------------------------------------------
int EtherObj::getTransmitStatus() 
  {
   return cgetTransmitStatus(IO_BASE); 
  }
//------------------------------------------
// get int status
//------------------------------------------
int EtherObj::getIntStatus() 
  {
   return cgetIntStatus(IO_BASE); 
  }
//------------------------------------------
// get transmit free
//------------------------------------------
int EtherObj::getTransmitFree() 
  {
   return cgetTransmitFree(IO_BASE); 
  }
//------------------------------------------
// get pkt id transmitted  
//------------------------------------------
int EtherObj::getTransmitPacketId() 
  {
   return cgetTransmitPacketId(IO_BASE); 
  }
//------------------------------------------
// get media status 
//------------------------------------------
int EtherObj::getMediaStatus() 
  {
   return cgetMediaStatus(IO_BASE); 
  }
//------------------------------------------
// get fifo diagnostic
//------------------------------------------
int EtherObj::getFifoDiag() 
  {
   return cgetFifoDiag(IO_BASE); 
  }
//****************************************************
int EtherObj::dnStall()
{
   cdnStall(IO_BASE); 
   return 0; 
}
//****************************************************
int EtherObj::dnUnStall()
{
   cdnUnStall(IO_BASE); 
   return 0; 
}
//****************************************************
int EtherObj::upStall()
{
   cupStall(IO_BASE); 
   return 0; 
}
//****************************************************
int EtherObj::upUnStall()
{
   cupUnStall(IO_BASE); 
   return 0; 
}

//****************************************************
int EtherObj::setDnLstPtr(int ptr)
{
   csetDnLstPtr(IO_BASE, ptr); 
   return 0; 
}
//------------------------------------------
// discard the packet read 
//  at this point, no one needs this packet data
//  this is not same as reading a packet 
//------------------------------------------
int EtherObj::discardPacket() 
  {
   long *pktStatLocation;  //absolute address of the pkt status  
   long l1;
   pktStatLocation = &l1;
   
   //we need to subtract 0x00110000 to compensate for the base 
   // address which will be added by the selector in protected mode 

   pktStatLocation = (long*)(UpListPointer + ReceiveOutPtr * 32 + 4 - ADDR_OFFSET); 

   *pktStatLocation = 0; //bit 15 is one indicating 0x8000 
   //reset UpComplete Bit p105
   ReceiveOutPtr++; 

   if (ReceiveOutPtr == RcvLstSize)
     {
      ReceiveOutPtr = 0; 
     }

   return 0; 
  }

//------------------------------------------
// get status of the received packet given a pktno
//  this pktno is related to a circular list slot 
//  user supplies pktno which he maintains in his program 
//  this routine returns status, packet address in memory, and 
//    packet length 
//    status, pktaddress, and pktlength are passed by reference 
//------------------------------------------
int EtherObj::readPacket(long pktno, long *status, long *pktaddress, long *pktlength) 
  {
   long pktlen = 0; 
   int retcode; 
   long a1, a2; 
   long s1; 
   long *p1;
   long *p2; 

   p1 = &a1;  //dummy address to hold 
   p2 = &a2;  //dummy address to hold 

   //we need to subtract 0x00110000 to compensate for the base 
   // address which will be added by the selector in protected mode 
   p1 = (long*)(UpListPointer + pktno * 32 + 4 - ADDR_OFFSET);  //status 
   p2 = (long*) (UpListPointer + pktno * 32 + 8 - ADDR_OFFSET); //address  

   *status     = *p1; 
   *pktaddress = *p2;    //absolute address will be passed to the caller 
                         //contents of p2 is absolute address for ex 05200000

   pktlen      = *p1;   //get the status into pktlen variable 
   pktlen      = pktlen & 0x00001FFF; //extract paket length 
   *pktlength  = pktlen;              //save it now  

   s1 = *p1;   			//get the status local 
   s1 = s1 & 0x00008000; 	//logical AND check for bit 15
   if (s1 == 0) 
      {
	retcode = -1; // bit 15 is zero 
      }
   else 
      {
       retcode = 0;  //bit 15 is set, the packet is ready to read 
      } 
   //  which is indicated by Up Complete Bit in the status 

   return retcode; 
  }

//************************************************************************************************
// Packets are already received and stored in the data buffers 
//  This program just reads packets from the buffers 
//   There is only one buffer used which will be available through Data pointer 
//   We just reduce the count by 14 and point the Data to right point in the buffer 
//   There is no need to copy data at all
//   returns -1 if UpCompleteBit is not set in the UPD 
//   returns -2 if the packet is not for this node 
//   returns -3 if packet type is not arp or ip
//   returns packet length in normal case 
// ***********************************************************************************************
int EtherObj::ReadData(char** Data, int* Type, char*ipaddr, char*macaddr)
{
   // This is for Ethernet II Type
   int PROTOCOL_TYPE =0;
   long pktlen = 0; 
    	
   long *p1;
   long *p3;
   long a1; 
   long a3; 
   p1 = &a1;  //dummy address to hold 
   p3 = &a3; 
   long s1; 

   //we need to subtract 0x00110000 to compensate for the base 
   // address which will be added by the selector in protected mode 
   p1 = (long*) (UpListPointer + ReceiveOutPtr * 32 + 4 - ADDR_OFFSET);  //status 
   p3 = (long*) (UpListPointer + ReceiveOutPtr * 32 + 8 - ADDR_OFFSET); //address  

   s1 = *p3;  //you can not print *p values in AOAprintHex 

   *Data      =   (char*)s1 -ADDR_OFFSET;   //buffer is pointing to Memory Location same as pointed by DPD
   //*Data address is 0x00110000 less than the absolute address 
   //when you use Data[], system will add 0x00110000 from the selector or base address 

   pktlen      = *p1;   //get the status into pktlen variable 
   pktlen      = pktlen & 0x00001FFF; //extract paket length 
   //return pktlen after the end of procedure 

   s1 = *p1;   			//get the status local 
   s1 = s1 & 0x00008000; 	//logical AND check for bit 15
   if (s1 == 0) 
      {
	// bit 15 is zero 
	return -1;
      }
   else 
      {
	// this macaddr is used in TCPObj
	// TCPObj does not call arp.Resolve(), it uses this mac address
	macaddr[0] = *(*Data+6);
	macaddr[1] = *(*Data+7);
	macaddr[2] = *(*Data+8);
	macaddr[3] = *(*Data+9);
	macaddr[4] = *(*Data+10);
	macaddr[5] = *(*Data+11);

        //--------------------------------------------
        // if the packet arrived is not intended for this node (IP address) 
        //   we simply discard the packet here. 
        // instead of doing it in IPOBJ, we do it here so that 
        //   we do not have to postpone to discard the packet 
        // 24, 25, 26, 27 are IP address bytes when ethernet header is removed 
        // before that, we add 14 to the above locations (24+14) 
        //--------------------------------------------

	// Get the Protocol Type and Palce it in the Application's Type Buffer
        //if you use *DATA[x], it will not work in our system 
	// you must use the following format 
	PROTOCOL_TYPE = (*(*Data+12) & 0x00FF);
	PROTOCOL_TYPE = (PROTOCOL_TYPE <<8);
	PROTOCOL_TYPE = (PROTOCOL_TYPE |  (*(*Data+13) & 0x00FF)); 
	*Type = PROTOCOL_TYPE;	

	if(*Type == ARP_TYPE)
	{
         if (*(*Data+38) != ipaddr[0] || *(*Data+39) != ipaddr[1] ||  
           *(*Data+40) != ipaddr[2] || *(*Data+41) != ipaddr[3])
	 {
	   //this is not our packet 
	   //discard it and return with -2 
	   discardPacket(); 
	   return -2; 
	 }
        }
	else if(*Type == IP_TYPE)
	{
         if (*(*Data+30) != ipaddr[0] || *(*Data+31) != ipaddr[1] ||  
           *(*Data+32) != ipaddr[2] || *(*Data+33) != ipaddr[3])
	 {
	   //this is not our packet 
	   //discard it and return with -2 
	   discardPacket(); 
	   return -2; 
	 }
        }
        else 
	{
	   // we do not handle packets other than arp and ip packets
	   discardPacket();
	   return -3;
	}

	*Data = *Data + 14; //point it to data instead of header
	pktlen = pktlen - 14; //reduce the length of the packet by 14 bytes header size 
      }

   NoofPackets++;

   return pktlen;	
} //end of Receive()


//****************************************************

long EtherObj::Init()
{
	SendInPtr = 1; 
	SendOutPtr = 1; 
	ReceiveInPtr = 0; 
	ReceiveOutPtr = 0; 
	NoofPackets=0;
	io.AOAPrintText("EthernetCard Init() is Called", Line22); 
	return cinitEther(IO_BASE, mac);
	
	// pass all these parameters to initialization 

} //end of Init()
//****************************************************
//0 - for IP
//1- for ARP
//2 - for other messages
// Check for the type field in the ethernet packet 
// if type field = 0806 it is arp(12th and 13 th byte of the buffer
// if type field = 0800 it is ip
// else it is other field  


int EtherObj::testArpIP(char *buff)
{
 int type = (int)((buff[12]<<8 & 0xff00) | (buff[13] & 0xff));
		if(type == 0x0806)
		{
			return 1;
		}
		else if(type == 0x0800)
		{
			return 0;
		}
		else
		{
			return 2;
		}
}

//****************************************************
void EtherObj::Close()
{
	closeasm(IO_BASE);
	AOAProtected io;
	//io.AOAPrintText("                   ",3640);	
}

////****************************************************
void EtherObj::getMAC(char *dMAC)
{
	for(int i=0; i<6; i++)
		dMAC[i] = mac[i];
}

//**********************************************************************************************
// This function formats an ethernet packet and inserts the packet into the DPD 
// This function takes the Sender Hardware Address, Target Hardware Address, 
// The Higher Level Protocol Type of the Packet and the PACKET and its size
//   This is used send ARP packets 
//   This procedure inserts a send flag in the DPD and leaves 
//  BUFFER is same as the data link pointed by the DPD entry for a given slot 
// *********************************************************************************************
int EtherObj::ARPInsertPkt(char* PACK,int PACK_Size, int PROTOCOL, char* Sender_HAdd, 
				char* Target_HAdd, int sendtype, int CurrentTask)

{   
    int addr; 
    long temp1; 
    char *BUFFER; 
    char *buf; 
    long temp = 0; 
    char c1; 
    char c2; 
    int i = 0; 
    int retcode=0;
    int stype = 0; 
   
    long x = 0; 
    long *p1; 
    long *p3; 
    long c3; 
    long c5; 
    p1 = &c3 ; 
    p3 = &c5 ; 
    
  x = DownListPointer + SendInPtr * 32 + 8 - ADDR_OFFSET; 
      //DPD address is absolute 
      // when ever you have an absolute address in a pointer, 
      //  make sure you substract 0x00110000
  //check if the DPD pointer in the range 
    if ((x-8+ADDR_OFFSET) > (DownListPointer + (SndLstSize-1) * 32))
     {
      return -8; 
     }    

  p1 = (long*)x;

  //now check if this data buffer is within the limits of DPD data buffers 
    if ((*p1) >= (DownListDataPointer + SndLstSize * PacketSize))
     {
      return -9; 
     }      

  BUFFER = (char*)*p1;

  BUFFER = BUFFER - ADDR_OFFSET; //it is an absolute address  
    
  SendInPtr++;    //this is like an InPtr which inserts packets

  if (SendInPtr == SndLstSize) 
    {
	SendInPtr = 0; //circular list 
    }

    x  = x + 4;  //point to length location  
    p1 = (long*)x;  //long pointer to manipupate  
    *p1 = 0x8000003C; //save length value in DPD  

    //-------------------------------------------
    // we add send type to bits 4-7 in the DPD location 24 where TXStatus will be there in first 4 bits  
    x  = x + 12;  //point to  TxStatus location  
    p3 = (long*)x;  //long pointer to manipupate  DPD enttry
    stype = 0; 
    stype = sendtype<<8 & 0x0000ff00;  //all other bits are zeros 
    *p3 = stype; 
    //-------------------------------------------
    //
    x  = x + 4;  //point to send flag location offset at 28 
    p1 = (long*)x;  //long pointer to manipupate  
    *p1 = 1;     //send flag is set for this slot   
			   
    for(i=0; i< 6; i++)
    {
       BUFFER[i] = Target_HAdd[i];    // Copy the destination mac to the pack
       BUFFER[i+6] =  Sender_HAdd[i]; // copy the source mac address to the pack
    }
       BUFFER[12] = ((PROTOCOL>>8) & 0x00FF); 	
       BUFFER[13] = ((PROTOCOL) & 0x00FF); 	
    // Copy the higher Level Packet into the FRAME
    for( i=0; i<PACK_Size; i++)
    {
	BUFFER[14+i] = PACK[i];											
    }

    int FRAME_SIZE = 14 + PACK_Size; // Size of the Ethernet Frame to Send
    // Check if the Packet is less than 60 bytes of so PAdd the Buffer with 0 for the rest of the 60 bytes
    if(FRAME_SIZE < 60)
    {
	int k = (60 - (PACK_Size + 14));
	for( i =0; i < k; i++) 
	{
		BUFFER[14 + PACK_Size + i] = 0;				    
	}
	FRAME_SIZE = 60;
    }
   
    retcode = sndCall();

    return 0;  //normal return 
}

//-----------------------------------------------------------------------------------------------------------
// this procedure actually sends a single packet 
//-----------------------------------------------------------------------------------------------------------
int EtherObj::SendPacket(long delay, int ctask)
{   
    int addr; 
    int i=0, x=0; 
    long *p1; 
    long c3; 
    p1 = &c3 ; 				
    int retcode; 

    addr = DownListPointer + SendOutPtr * 32; 
    x = addr + 28 - ADDR_OFFSET; //it is absolute address  
    p1 = (long*)x;  //long pointer to manipulate  

    // csend() always returns 0
    retcode = csend(IO_BASE, addr, delay);	
    
    *p1 = 0;  //reset the send flag 

    return retcode; 
}

//-----------------------------------------------------------------------------------------------------------
// this procedure actually sends n packets 
//-----------------------------------------------------------------------------------------------------------
int EtherObj::SendPacketN(int count)
{   
    int addr; 
    int i=0, x=0; 
    long *p1; 
    long c3; 
    p1 = &c3 ; 				
    int retcode; 
    int tempsendoutptr=0;

  if(count != 0)
  {
    tempsendoutptr = SendOutPtr;
    
    for(i=0; i<count; i++)
    {
     addr = DownListPointer + SendOutPtr * 32; 
     x = addr + 28 - ADDR_OFFSET; //it is absolute address  
     p1 = (long*)x;
     *p1 = 0; // reset send flag;

     if(i == count-1)
     {
       x = addr - ADDR_OFFSET; //it is absolute address  
       p1 = (long*)x;
       *p1 = 0; // reset DnNxtPtr;
     }
       IncSendPtr(0);
    }

    addr = DownListPointer + tempsendoutptr * 32; 
    // csend() always returns 0
    retcode = csendN(IO_BASE, addr, count);	
  }
  else
    io.AOAPrintText("EtherObj:SendPacketN() Count is zero", Line24);

    return retcode; 
}

//-----------------------------------------------------------------------------------------------------------
// get TxStatus from the DPD entry 
//  DPDCount indicates the exact index value for DPD entry where an interrupt occured for 
//   that entry, however, this value is 1 higher than the actual index, thus we need to 
//   substract 1 from the count 
//-----------------------------------------------------------------------------------------------------------
int EtherObj::getDPDStatus(int dpdcount)
{   
    int addr; 
    long x = 0; 
    long *p1; 
    long c3; 
    p1 = &c3 ; 				
    int retcode; 

    if (dpdcount == 0)
       addr = DownListPointer + dpdcount * 32; 
    else 
       addr = DownListPointer + (dpdcount-1) * 32; 
 
    x = addr + 24 - ADDR_OFFSET; //it is absolute address  
    p1 = (long*)x;  //long pointer to manipulate  

    retcode = *p1;   // txstatus in the DPD entry  

    return retcode; 
}

//-----------------------------------------------------------------------------------------------------------
// increment the SendOutPtr 
//-----------------------------------------------------------------------------------------------------------
int EtherObj::IncSendPtr(int ctask )
{   
    if (SendOutPtr == SndLstSize - 1) 
       SendOutPtr = 0;//Circular list
    else 
       SendOutPtr++; 

    return 0; 
}
//-----------------------------------------------------------------------------------------------------------
// Check if DPD is full 
//-----------------------------------------------------------------------------------------------------------
int EtherObj::full( )
{   
  int retcode = 0; 

  if ((SendInPtr + 1) % SndLstSize == SendOutPtr) 
    retcode = 1; //full  
  else retcode = 0; //not full  
			
    return retcode; 
}
//-----------------------------------------------------------------------------------------------------------
// This procedure only checks the send flag for testing if there is a send pending 
//-----------------------------------------------------------------------------------------------------------
int EtherObj::CheckSendFlag()
{   
    int flag = 0; 
    long addr; 
    long x = 0; 
    long *p1; 
    long c3; 
    p1 = &c3 ; 				
    int retcode; 

    addr = DownListPointer + SendOutPtr * 32; 
    x = addr + 28 - ADDR_OFFSET; //it is absolute address  
    p1 = (long*)x;  //long pointer to manipupate  
    flag = *p1; 

    if (flag == 1) 
       retcode = 1; //it is set  
    else 
       retcode = 0;  //it is not set 

    return retcode; 
}
//-----------------------------------------------------------------------------------------------------------
// This procedure only checks the down complete flag for testing if there is a send pending 
//-----------------------------------------------------------------------------------------------------------
int EtherObj::CheckDownComplete()
{   
    long addr; 
    long x=0; 
    long *p1; 
    long c3; 
    p1 = &c3 ; 				
    int retcode; 
    int downComplete = 0; 
    int temp = 0;

    addr = DownListPointer + SendOutPtr * 32; 
    x = addr + 4 - ADDR_OFFSET; //it is absolute address  
    p1 = (long*)x;  //long pointer to manipupate  
    downComplete = *p1; 
    temp = downComplete & 0x00010000;
	   
    if (temp == 0x00010000) 
       retcode = 1; //it is set  
    else 
       retcode = 0;  //it is not set 

    return retcode; 
}

//-----------------------------------------------------------------------------------------------------------
// IPInsertPacket is used to insert packets in the correct slot of DPD entry 
//  It is prepared to be sent by setting a flag in the DPD entry 
//  It is similar to ARPInsertPacket, with few differences 
//  BUFFER is same as the data link pointed by the DPD entry for a given slot 
//  return code
//  -12 if dpdpointer is out of range
//  -13 if data buffer is out of range
// ----------------------------------------------------------------------------------------------------------
int EtherObj::IPInsertPkt(char* PACK, int PACK_Size, int PROTOCOL, char* Target_HAdd, int CurrentTask)
{   
    int retcode; 
    int i = 0; 
    int sizeOfPacket=0;

    long x = 0; 
    long *p1; 
    long *p2; 
    long c3; 
    long c4; 
    p1 = &c3 ; 
    p2 = &c4 ; 
 
  //there could be more than one task trying to insert a packet into the list 
  // when we insert a packet, NIC is not there yet, because insert is ahead of write 

    x = DownListPointer + SendInPtr * 32 + 8 - ADDR_OFFSET; 
      //DPD address is absolute 
      // when ever you have an absolute address in a pointer, 
      //  make sure you substract 0x00110000
    
    //check if the DPD pointer in the range 
    if ((x-8+ADDR_OFFSET) > (DownListPointer + (SndLstSize-1) * 32))
     {
      return -12; 
     }    

    PACK = PACK - 14;
 
    p1 = (long*)x; // p1 is address of dpdPointer at 8  

    //now check if this data buffer is within the limits of DPD data buffers 
    if ((*p1) >= (DownListDataPointer + SndLstSize * PacketSize))
     {
      return -13; 
     }    

    SendInPtr++;    //this is like an InPtr which inserts packets 

    if (SendInPtr == SndLstSize) 
     {
      SendInPtr = 0; //circular list 
     }
  
    x  = x + 4;  //point to length location  
    p2 = (long*)x;  //long pointer to manipupate  DPD enttry

    x  = x + 16;  //point to send flag location offset at 28 
    p1 = (long*)x;  //long pointer to manipupate  
    *p1 = 1;     //send flag is set for this slot   
   
    sizeOfPacket = PACK_Size + 14; // new size of packet  14 is for ethernet header

    for(i=0; i< 6; i++)
    {
       PACK[i] = Target_HAdd[i];    // Copy the destination mac to the pack
       PACK[i+6] =  mac[i]; // copy the source mac address to the pack
    }
       PACK[12] = ((PROTOCOL>>8) & 0x00FF); 	
       PACK[13] = ((PROTOCOL) & 0x00FF); 	

    // Check if the Packet is less than 60 bytes of so PAdd the Buffer with 0 for the rest of the 60 bytes
    if(sizeOfPacket < 60)
    {
	int k = (60 - sizeOfPacket);
	for( i =0; i < k; i++) 
	{
		PACK[sizeOfPacket + i] = 0;				    
	}
	sizeOfPacket = 60;
    }

    *p2 = 0x80000000 + sizeOfPacket;  //DPD entry for length 

    retcode = sndCall();

    return 0;
}
//-----------------------------------------------------------------------------------------------------------
// method to format ethernet packet called by tcp
// return code
//  -26 if dpdpointer is out of range
//  -27 if data buffer is out of range
// ----------------------------------------------------------------------------------------------------------
int EtherObj::FormatEthPacket(char* PACK, int PACK_Size, int PROTOCOL, char* Target_HAdd, 
				long InPtr, int sendtype, int CurrentTask)
{   
   
    int i = 0; 
    int sizeOfPacket=0;
    int retcode=0;

    long x = 0; 
    long *p1; 
    long *p2; 
    long *p3; 
    long c3; 
    long c4; 
    long c5; 
    p1 = &c3 ; 
    p2 = &c4 ; 
    p3 = &c5 ; 
    int stype = 0; 

    
  //there could be more than one task trying to insert a packet into the list 
  // when we insert a packet, NIC is not there yet, because insert is ahead of write 

    x = DownListPointer + InPtr * 32 + 8 - ADDR_OFFSET; 
      //DPD address is absolute 
      // when ever you have an absolute address in a pointer, 
      //  make sure you substract 0x00110000
   //check if the DPD pointer in the range 
    if ((x-8+ADDR_OFFSET) > (DownListPointer + (SndLstSize-1) * 32))
     {
      return -26; 
     }    

    p1 = (long*)x; // p1 is address of dpdPointer at 8  

   //now check if this data buffer is within the limits of DPD data buffers 
    if ((*p1) >= (DownListDataPointer + SndLstSize * PacketSize))
     {
      return -27; 
     }    
    
    x  = x + 4;  //point to length location  
    p2 = (long*)x;  //long pointer to manipupate  DPD enttry

   //-------------------------------------------
    // we add send type to bits 4-7 in the DPD location 24 where TXStatus will be there in first 4 bits  
    x  = x + 12;  //point to  TxStatus location  
    p3 = (long*)x;  //long pointer to manipupate  DPD enttry
    stype = 0; 
    stype = sendtype<<8 & 0x0000ff00;  //all other bits are zeros 
    *p3 = stype; 
    //-------------------------------------------
    //
    x  = x + 4;  //point to send flag location offset at 28 
    p1 = (long*)x;  //long pointer to manipupate  

    *p1 = 1;     //send flag is set for this slot   
    
    sizeOfPacket = PACK_Size + 14; // new size of packet  14 is for ethernet header

    for(i=0; i< 6; i++)
    {
       PACK[i] = Target_HAdd[i];    // Copy the destination mac to the pack
       PACK[i+6] =  mac[i]; // copy the source mac address to the pack
    }
       PACK[12] = ((PROTOCOL>>8) & 0x00FF); 	
       PACK[13] = ((PROTOCOL) & 0x00FF); 	


    // Check if the Packet is less than 60 bytes of so PAdd the Buffer with 0 for the rest of the 60 bytes
    if(sizeOfPacket < 60)
    {
	int k = (60 - sizeOfPacket);
	for( i =0; i < k; i++) 
	{
		PACK[sizeOfPacket + i] = 0;				    
	}
	sizeOfPacket = 60;
    }

    *p2 = 0x80000000 + sizeOfPacket;  //DPD entry for length 
  
    retcode = sndCall();

    return 0;
}

//-----------------------------------------------------------------------------------------------------------
// method to format ethernet packet called by tcp
// return code
//  -26 if dpdpointer is out of range
//  -27 if data buffer is out of range
// ----------------------------------------------------------------------------------------------------------
int EtherObj::FormatEthPacketN(char* PACK, int PACK_Size, int PROTOCOL, char* Target_HAdd,
				long InPtr, int count, int sendtype, int CurrentTask)
{   
   
    int i = 0; 
    int sizeOfPacket=0;
    int retcode=0;
    int c1 = 0; 
    int c2 = 0; 

    long x = 0; 
    long *p1; 
    long *p2; 
    long *p3; 
    long c3; 
    long c4; 
    long c5; 
    p1 = &c3 ; 
    p2 = &c4 ; 
    p3 = &c5 ; 
    int stype = 0; 
    
  //there could be more than one task trying to insert a packet into the list 
  // when we insert a packet, NIC is not there yet, because insert is ahead of write 

    x = DownListPointer + InPtr * 32 + 8 - ADDR_OFFSET; 
      //DPD address is absolute 
      // when ever you have an absolute address in a pointer, 
      //  make sure you substract 0x00110000
   //check if the DPD pointer in the range 
    if ((x-8+ADDR_OFFSET) > (DownListPointer + (SndLstSize-1) * 32))
     {
      return -26; 
     }    

    p1 = (long*)x; // p1 is address of dpdPointer at 8  

   //now check if this data buffer is within the limits of DPD data buffers 
    if ((*p1) >= (DownListDataPointer + SndLstSize * PacketSize))
     {
      return -27; 
     }    
    
    x  = x + 4;  //point to length location  
    p2 = (long*)x;  //long pointer to manipupate  DPD enttry

    //-------------------------------------------
    // we add send type to bits 4-7 in the DPD location 24 where TXStatus will be there in first 4 bits  
    x  = x + 12;  //point to  TxStatus location  
    p3 = (long*)x;  //long pointer to manipupate  DPD enttry
    stype = 0; 
    stype = sendtype<<8 & 0x0000ff00;  //all other bits are zeros 
    *p3 = stype; 
    //-------------------------------------------

    x  = x + 4;  //point to send flag location offset at 28 
    p1 = (long*)x;  //long pointer to manipupate  

    *p1 = 1;     //send flag is set for this slot   
    
    sizeOfPacket = PACK_Size + 14; // new size of packet  14 is for ethernet header

    for(i=0; i< 6; i++)
    {
       PACK[i] = Target_HAdd[i];    // Copy the destination mac to the pack
       PACK[i+6] =  mac[i]; // copy the source mac address to the pack
    }
       PACK[12] = ((PROTOCOL>>8) & 0x00FF); 	
       PACK[13] = ((PROTOCOL) & 0x00FF); 	


    // Check if the Packet is less than 60 bytes of so PAdd the Buffer with 0 for the rest of the 60 bytes
    if(sizeOfPacket < 60)
    {
	int k = (60 - sizeOfPacket);
	for( i =0; i < k; i++) 
	{
		PACK[sizeOfPacket + i] = 0;				    
	}
	sizeOfPacket = 60;
    }

    *p2 = 0x80000000 + sizeOfPacket;  //DPD entry for length 

    if(count != 0)
      retcode = sndCallN(count);

    return 0;
}

//*********************************************************************************************
//return 1 if it is full 
//*********************************************************************************************
int EtherObj::DPDFull()
{ 
    int retcode = 0; 

    if ((SendInPtr + 1) % SndLstSize == SendOutPtr) 
       retcode = 1; //full  
    else 
       retcode = 0; //not full  

    return retcode; 
}

//-----------------------------------------------------------------------------------------------------------
// print dpd entry
//-----------------------------------------------------------------------------------------------------------
int EtherObj::printDpd(int index, int line)
{   
    int nextPtr = 0;
    int header = 0;
    int fragmentAddress = 0;
    int fragmentLength = 0;
    int packetId = 0;
    int prevPtr = 0;
    int reserved = 0;
    int flag = 0;
       
    long x = 0; 
    long *p1, *p2, *p3, *p4, *p5, *p6, *p7, *p8; 
    long c1, c2, c3, c4, c5, c6, c7, c8; 
    p1 = &c1;
    p2 = &c2;
    p3 = &c3;
    p4 = &c4;
    p5 = &c5;
    p6 = &c6;
    p7 = &c7;
    p8 = &c8; 
    
    x = DownListPointer + index * 32 - ADDR_OFFSET; 
    p1 = (long*)x;  
    nextPtr = *p1;

    x = x + 4;
    p2 = (long*)x;
    header = *p2;

    x = x + 4;
    p3 = (long*)x;
    fragmentAddress = *p3;

    x = x + 4;
    p4 = (long*)x;
    fragmentLength = *p4;

    x = x + 4;
    p5 = (long*)x;
    packetId = *p5;

    x = x + 4;
    p6 = (long*)x;
    prevPtr = *p6;	    
	 
    x = x + 4;
    p7 = (long*)x;
    reserved = *p7;
	    
    x = x + 4;
    p8 = (long*)x;
    flag = *p8;	    
	   
    io.AOAprintHex(nextPtr, line);
    io.AOAprintHex(header, line + 20);
    io.AOAprintHex(fragmentAddress, line + 40);
    io.AOAprintHex(fragmentLength, line + 60);
    io.AOAprintHex(packetId, line + 80);
    io.AOAprintHex(prevPtr, line + 100);
    io.AOAprintHex(reserved, line + 120);
    io.AOAprintHex(flag, line + 140);

   return 0; 
}

//-----------------------------------------------------------------------------------------------------------
// print upd entry
//-----------------------------------------------------------------------------------------------------------
int EtherObj::printUpd(int index, int line)
{   
    int nextPtr = 0;
    int header = 0;
    int fragmentAddress = 0;
    int fragmentLength = 0;
    int packetId = 0;
    int prevPtr = 0;
    int empty1 = 0;
    int empty2 = 0;
       
    long x = 0; 
    long *p1, *p2, *p3, *p4, *p5, *p6, *p7, *p8; 
    long c1, c2, c3, c4, c5, c6, c7, c8; 
    p1 = &c1;
    p2 = &c2;
    p3 = &c3;
    p4 = &c4;
    p5 = &c5;
    p6 = &c6;
    p7 = &c7;
    p8 = &c8;
    
    x = UpListPointer + index * 32 - ADDR_OFFSET; 
    p1 = (long*)x;  
    nextPtr = *p1;

    x = x + 4;
    p2 = (long*)x;
    header = *p2;

    x = x + 4;
    p3 = (long*)x;
    fragmentAddress = *p3;

    x = x + 4;
    p4 = (long*)x;
    fragmentLength = *p4;

    x = x + 4;
    p5 = (long*)x;
    packetId = *p5;

    x = x + 4;
    p6 = (long*)x;
    prevPtr = *p6;	    
	 
    x = x + 4;
    p7 = (long*)x;
    empty1 = *p7;
	    
    x = x + 4;
    p8 = (long*)x;
    empty2 = *p8;	    

    io.AOAprintHex(nextPtr, line);
    io.AOAprintHex(header, line + 20);
    io.AOAprintHex(fragmentAddress, line + 40);
    io.AOAprintHex(fragmentLength, line + 60);
    io.AOAprintHex(packetId, line + 80);
    io.AOAprintHex(prevPtr, line + 100);
    io.AOAprintHex(empty1, line + 120);
    io.AOAprintHex(empty2, line + 140);

   return 0; 
}

//-----------------------------------------------------------------------------------------------------------
// internal config register for full duplex mode 
//-----------------------------------------------------------------------------------------------------------
int EtherObj::getInternalConfig()
{   
    return cgetInternalConfig(IO_BASE);
}		

//-----------------------------------------------------------------------------------------------------------
// mac control register for full duplex mode 
//-----------------------------------------------------------------------------------------------------------
int EtherObj::getMacControl()
{   
    return cgetMacControl(IO_BASE);
}	

//-----------------------------------------------------------------------------------------------------------
// media options
//-----------------------------------------------------------------------------------------------------------
int EtherObj::getMediaOptions()
{   
    return cgetMediaOptions(IO_BASE);
}

//-----------------------------------------------------------------------------------------------------------
// configuration data for given configuration address
//-----------------------------------------------------------------------------------------------------------
int EtherObj::getConfigData(int address)
{   
    return cgetConfigData(IO_BASE, address);
}

//-----------------------------------------------------------------------------------------------------------
// network diagnostics
//-----------------------------------------------------------------------------------------------------------
int EtherObj::getNetworkDiag()
{   
    return cgetNetworkDiag(IO_BASE);
}

//-----------------------------------------------------------------------------------------------------------
// reset transmitter
//-----------------------------------------------------------------------------------------------------------
int EtherObj::resetTransmitter()
{   
    return cresetTransmitter(IO_BASE);
}

//-----------------------------------------------------------------------------------------------------------
// get ethernet buffer count	
//-----------------------------------------------------------------------------------------------------------
int EtherObj::getCount()
{   
    ReceiveInPtr = getCurrentReceivePtr();
    if(ReceiveInPtr >= ReceiveOutPtr)
	return (ReceiveInPtr-ReceiveOutPtr);
   else
        return( RcvLstSize - (ReceiveOutPtr-ReceiveInPtr));
}
//-----------------------------------------------------------------------------------------------------------
// get ethernet number of packets	
//-----------------------------------------------------------------------------------------------------------
int EtherObj::getNoofPackets()
{   
   return NoofPackets;
}

//-----------------------------------------------------------------------------------------------------------
// send the packet	
//-----------------------------------------------------------------------------------------------------------
int EtherObj::sndCall()
{
    int retcode = 0;
    int i = 0; 
    int dpdcount = 0; 
    int dpdstatus = 0; 
    int txfirstflag = 0;  //first send pkt does not give any interrupt 
    //  it is already transmitted by the time we run this 

    dpdcount = io.AOAgetSharedMem(0xa8);  //get the latest DPD count 
    dpdstatus = getDPDStatus(dpdcount); //get the latest DPD transmit status  

    while(dpdstatus != 0xc0 && txfirstflag != 0) 
      {
       txfirstflag = 1;//first packet trasmit happend automatically in the Xmitter! 
       io.AOAprintHex(dpdstatus, Line10); 
       io.AOAprintHex(dpdcount-1, Line10+20); 
       io.AOAprintHex(SendOutPtr, Line10+40); 
       io.AOAPrintText("TxStatus Error!", Line23); 
       task.AOAsuspendTask();
      }
           
      retcode = SendPacket(0, 0); //delay is implemented here now... 
      
      while (CheckDownComplete() == 0) 
	{
	 //RKK suspend does not help in performance improvement 
	 //  downcomplete may be happening soon 
         //task.AOAsuspendTask();
	}
 
        retcode = IncSendPtr(0);  //increment SendOutPtr 

    return 0;	
}			

//-----------------------------------------------------------------------------------------------------------
// send call N	
//-----------------------------------------------------------------------------------------------------------
int EtherObj::sndCallN(int count)
{
    int retcode = 0;
    int i = 0; 
    int dpdcount = 0; 
    int dpdstatus = 0; 
    int txfirstflag = 0;  //first send pkt does not give any interrupt 
    //  it is already transmitted by the time we run this 

    dpdcount = io.AOAgetSharedMem(0xa8);  //get the latest DPD count 
    dpdstatus = getDPDStatus(dpdcount); //get the latest DPD transmit status  

    //the status of C0 is checked for only the last xmitted packet 
    //  it is possible that we may have xmitted n packets before, but 
    //   we do not come here n times....
    //   We are not checking all xmitted packets for their status 
    while(dpdstatus != 0xc0 && txfirstflag != 0) 
      {
       txfirstflag = 1;//first packet trasmit happend automatically in the Xmitter! 
       io.AOAprintHex(dpdstatus, Line10); 
       io.AOAprintHex(dpdcount-1, Line10+20); 
       io.AOAprintHex(SendOutPtr, Line10+40); 
       io.AOAPrintText("TxStatus Error!", Line23); 
       task.AOAsuspendTask();
      }           
    
    retcode = SendPacketN(count); 
   
    return 0;	
}			

