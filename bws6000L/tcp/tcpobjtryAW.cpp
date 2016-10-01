#include "tcpobj.h"
#include "..\ip\rand.h"
#include "..\Ethernet\EtherObj.h"
#include "..\interfaces\aoaprotected.h"
#include "..\webserver\apptask.h"

//***********************************************************************************************
// Static Variable Definitions


// Variables used to Addess the Host
char TCPObj::HostIP[4];					// Specifies the host IP Address
char TCPObj::HostSubnetMask[4];				// Specifies the Hosts Subnet Mask

char TCPObj::GateWayMAC[6];				// Specifies the Gateways MAC Address
unsigned short TCPObj::SourcePort = 80;			// Port Number of the HTTP TO listen u can change the port 
char TCPObj::GateWayIP[4];	
// Variables used to Track the TCP Buffer
unsigned long TCPObj::TCBBase = 0;			// Base of TCB Table
int TCPObj::logcount = 0;				// pointer to the Free TCB Linked List 
long TCPObj::FreeList =0;				// pointer to the Free TCB Linked List 
int TCPObj::lcounter =0;				// pointer to the Free TCB Linked List 
int TCPObj::trace3Count =0;				// pointer to the Free TCB Linked List 
int TCPObj::*logptr =0;				// pointer to the Free TCB Linked List 
int TCPObj::SendCountTotal=0;				// Send Count   
unsigned long TCPObj::HttpCount=0;							
unsigned long TCPObj::HttpRequests=0;							
unsigned long TCPObj::SynCount=0;							
unsigned long TCPObj::SynAckCount=0;							
unsigned long TCPObj::GetCount=0;							
unsigned long TCPObj::MaxSynGetTime=0;							
unsigned long TCPObj::TotalSynGetTime=0;							
unsigned long TCPObj::MaxConnectionTime=0;							
unsigned long TCPObj::MaxNoOfTasksUsed=0;							
unsigned long TCPObj::MaxNoOfTCBsUsed=0;							
unsigned long TCPObj::TotalDelCount=0;							
unsigned long TCPObj::MaxSynGetThreshCount=0;							
unsigned long TCPObj::NoOfRetransmissions=0;							
int TCPObj::sizeOfTCBRecord=0;							
int TCPObj::NoOfResets=0;							
int TCPObj::UnMatchedRequests=0;							

long TCPObj::TCBCount=0;							
long TCPObj::trace2Count=0; //test trace counter for storing dwords in memory
long TCPObj::trace1Count=0; //no of trace records stored in the trace memory  
long TCPObj::TCBRecords=0;							

//RKK change the following value to change the pkt size 
const int TCPSegSize = 1300;				
//const int TCPSegSize = 512;				
// The Maximum amount of Data that could be accomodated in a 
							// single 
//----------------------
// eth   ip   tcp   data
// ---------------------
// 14    20    20   1460 
//      <--------------->
//            1500 
unsigned long TCPObj::averageconntime = 0;		// Average time of a connection from the starting to end

unsigned long s = 0;
unsigned long min = 10;
unsigned long max = 0;
//*******************************************************************************************
// Function Definitions begins here
//*******************************************************************************************
int TCPObj::initRecord()
{
    sizeOfTCBRecord = sizeof(TCBRecord);  //capture the size 
    return sizeOfTCBRecord; 
}; 
//*******************************************************************************************
// This is the init function this function must be called only once in a Application
// The input parameters: are the IP Address of the HOST, Port number of the HOST Application, GateWay IP, GatewayMac of the Host, 
// Base address of the TCP Buffer, Size of the TCP Buffer, Count of number of Entries in the Connection Request Queue, 
// Count of Number of entries in the connection Established Queue, Count of number of entries in the Connection close queue
// Return Values:
//  0 - if initialized successfully
// -1 if the TCP Buffer Space is not sufficient 
int TCPObj::init(char SrcIP[4], char SourceMAC[6],char SubnetMask[4], char GwayIP[4],char GwayMAC[6], unsigned short SrcPort, long TCPBuffBase, long TCBBufferSize, long NoTCBRecords, long NoHashRecords)
{
	long hashSize=0;
	SendCountTotal = 0; 
	TCBCount = 0;
	trace1Count = 0;
	trace2Count = 0;


	TCPBuffBase = TCPBuffBase - ADDR_OFFSET;
	hashSize = t.init(NoHashRecords, TCPBuffBase);		
    //io.AOAprintHex(sizeof(TCBRecord), Line10+20);
	//_asm{ int 0f5h}

	TCBRecords = NoTCBRecords; 

	io.AOAsetSharedMem(0xb4, 0); 
	io.AOAsetSharedMem(0x100, 0); //used by prcycle when INT comes 
	io.AOAsetSharedMem(0x104, 0); 
	io.AOAsetSharedMem(0x108, 0); 
	io.AOAsetSharedMem(0x10c, 0); 
	io.AOAsetSharedMem(0x110, 0); 
	io.AOAsetSharedMem(0x114, 0); 
	io.AOAsetSharedMem(0x118, 0); 

	io.AOAsetSharedMem(0xb8, 0);  //used by application when a msg is sent  
	io.AOAsetSharedMem(0xbc, 0); 
	io.AOAsetSharedMem(0xc0, 0); 
	io.AOAsetSharedMem(0xc4, 0); 
	io.AOAsetSharedMem(0xc8, 0); 
	io.AOAsetSharedMem(0xcc, 0); 
	io.AOAsetSharedMem(0xd0, 0); 
	SendCountTotal = 0; 

	// Check for the size of availablable memory space for the table and return error if it is not enough
	if(TCBBufferSize < (hashSize+(NoTCBRecords*sizeof(TCBRecord))))
	{
       //BHARAT
	   io.AOAprintHex(sizeof(TCBRecord), Line24+120); 
       io.Application_Status = 2; 
       io.AOAExit(); 
	   _asm{int 0f5h}
	    return -1;
	}
	
    for(int i=0;i<4;i++)
	{
	    	HostIP[i] = SrcIP[i];			// Assign the Source IP
		GateWayIP[i] = GwayIP[i]; 		// Assign the Gateway IP
		HostSubnetMask[i] = SubnetMask[i]; 	// Assign the Host Subnet Mask
	}
	
	
	for(i =0; i< 6 ;i++)
	{
	 	GateWayMAC[i] = GwayMAC[i];
	}
	
	
	// Initialize the source port	
	SourcePort = SrcPort;			



	// Initialize the base address of the TCP Memory Space 
	TCBBase = TCPBuffBase + hashSize;	
	
	
	// Initialise the TCB Table
	TCBRecord *TCBPointer = (TCBRecord*)TCBBase;
		
	for(i =0; i<NoTCBRecords;i++)
	{
	    	if(i==0)
		{
		    	TCBPointer[i].Avail =0;
			TCBPointer[i].prev = -1;
			TCBPointer[i].next = i+1;
			FreeList = 0;
		}
		else if(i==(NoTCBRecords-1))
		{
			TCBPointer[i].Avail =0;
			TCBPointer[i].prev = i-1;
			TCBPointer[i].next = -1;
		}
		else
		{
			TCBPointer[i].Avail =0;
			TCBPointer[i].prev = i-1;
			TCBPointer[i].next = i+1;
		}
		TCBPointer[i].state = CLOSED;
	}

	HttpCount = 0;
	HttpRequests = 0;
	SynCount=0;							
	SynAckCount=0;							
	GetCount=0;							
	MaxSynGetTime=0;							
	TotalSynGetTime=0;							
	MaxConnectionTime=0;							
	MaxNoOfTasksUsed=0;							
	MaxNoOfTCBsUsed=0;							
	MaxSynGetThreshCount=0;							
	NoOfRetransmissions=0;							

	random r = random(io.AOAgetTimer());	
	return 0;
}
//************************************************************************************************
// These are functions to manipulate the TCB Data Structure
// Insert a row in TCB
// It returns the Record Number if Successful
// It Returns -1 if the The TCB Table is full
 	
int TCPObj::InsertTCB(TCBRecord *tcb)
{
   TCBRecord *TCBPointer, *FreeTCB;
   TCBPointer = (TCBRecord*)TCBBase;
   // Get the address of the free tcb record at the head of the FreeList
   FreeTCB = &TCBPointer[FreeList];   
   long FreeTCBIndex=0; 
   int hashvalue=0;
   long hashIndexVal=0;

   // if TCB table is full
   if(FreeList == -1)
   {
       return -1;
   }

   // Assign the index of the free TCB to return the 
   FreeTCBIndex = FreeList;
   //Update the head of free list to the next free record
   FreeList = FreeTCB->next;
   // Update teh Avail bit to 1
   FreeTCB->Avail = 1; 
   // Update the previous pointer of the free list to -1
   if(FreeList != -1)
   {
   TCBPointer[FreeList].prev = -1;
   }

   // Destinsiton Port Number
   FreeTCB->PORT[0] = tcb->PORT[0];
   FreeTCB->PORT[1] = tcb->PORT[1];	
   // Destination IP Address
   for(int j=0;j<4;j++)
   {
      FreeTCB->IP[j] = tcb->IP[j];
   }

   for( j=0; j<6;j++)
   {
      FreeTCB->destmac[j] = tcb->destmac[j];
   }

   // The State of the connection
   FreeTCB->state = tcb->state;
   // Last Unacknowledged Sequence number
   FreeTCB->SNDUNA = tcb->SNDUNA;
   // Next Send Sequence number
   FreeTCB->SNDNXT = tcb->SNDNXT;	
   // Sender Window size available
   FreeTCB->SNDWND =tcb->SNDWND;	
   // Segment Sequence of last window update
   FreeTCB->SNDWL1 = tcb->SNDWL1;
   // Segment sequence of last acknowledged segment
   FreeTCB->SNDWL2 = tcb->SNDWL2;
   // Initial Send Sequence Number
   FreeTCB->ISS = tcb->ISS;
   // Next Sequence number to acceot by the receiver
   FreeTCB->RCVNXT=tcb->RCVNXT;
   // Window size of the receiver
   FreeTCB->RCVWND=tcb->RCVWND;
   // Initial receive Sequence number
   FreeTCB->IRS = tcb->IRS;
   // Sender Round Trip Time
   FreeTCB->SRTT = tcb->SRTT;
   // Last packet sent time 
   FreeTCB->LST = tcb->LST; 
   // Last Packet Sent Timer or in case of a connection establishment its the SYNC Received Time
   FreeTCB->DIFF = tcb->DIFF;
   FreeTCB->CURRENTTASK=tcb->CURRENTTASK;
   FreeTCB->CURRENTTCBRNO=tcb->CURRENTTCBRNO;
   FreeTCB->SEQ = tcb->SEQ;
   FreeTCB->getackflag = tcb->getackflag;
   FreeTCB->hdrflag = tcb->hdrflag;
   FreeTCB->STARTRESSEQ=tcb->STARTRESSEQ;
   FreeTCB->EXPHEADACK=tcb->EXPHEADACK;
   FreeTCB->EXPRESACK=tcb->EXPRESACK;
   FreeTCB->LASTACK=tcb->LASTACK;
   FreeTCB->CMPVAL=tcb->CMPVAL;
   FreeTCB->CMPVAL1=tcb->CMPVAL1;
   FreeTCB->STARTRESSEQ=tcb->STARTRESSEQ;
   FreeTCB->MSGPTR=tcb->MSGPTR;
   FreeTCB->MSGLEN=tcb->MSGLEN;
   FreeTCB->Sent_Flag=tcb->Sent_Flag;
   FreeTCB->sendf=tcb->sendf;
   FreeTCB->http_case=tcb->http_case;
   FreeTCB->dummy100=tcb->dummy100;

   FreeTCB->resourceType=tcb->resourceType;
   FreeTCB->rIndex=tcb->rIndex;
   FreeTCB->startSeq=tcb->startSeq;
   FreeTCB->noOfPackets=tcb->noOfPackets;
   FreeTCB->leftOverBytes=tcb->leftOverBytes;
   FreeTCB->lastSet=tcb->lastSet;
   FreeTCB->sendtype=tcb->sendtype;

   FreeTCB->http_state=tcb->http_state;
   FreeTCB->http_complete=tcb->http_complete;
   FreeTCB->count1=tcb->count1;
   FreeTCB->temprIndex=tcb->temprIndex;
   FreeTCB->tempSeqNum=tcb->tempSeqNum;
   FreeTCB->suspendFlag=tcb->suspendFlag;
   FreeTCB->resumeFlag=tcb->resumeFlag;
   FreeTCB->taskExists=tcb->taskExists;
   FreeTCB->tempflags=tcb->tempflags;
   FreeTCB->resetFlag=tcb->resetFlag;
   FreeTCB->Rsyn=tcb->Rsyn;
   FreeTCB->Rsyna=tcb->Rsyna;
   FreeTCB->Rack=tcb->Rack;
   FreeTCB->Rget=tcb->Rget;
   FreeTCB->Rgeta=tcb->Rgeta;
   FreeTCB->Rdata=tcb->Rdata;
   FreeTCB->Rfina=tcb->Rfina;
   FreeTCB->Rfinaa=tcb->Rfinaa;

   hashvalue = t.hashfun(FreeTCB->IP, FreeTCB->PORT);
   hashIndexVal = t.getIndex(hashvalue);  
   if(hashIndexVal == -1)
   {
       FreeTCB->next = -1;
       FreeTCB->prev = -1; 
       t.setIndex(hashvalue,FreeTCBIndex);
   }
   else
   {
       FreeTCB->prev=-1;
       FreeTCB->next = hashIndexVal;
       TCBPointer[hashIndexVal].prev = FreeTCBIndex;
       t.setIndex(hashvalue,FreeTCBIndex);
   }
   
 //  io.AOAprintHex(FreeTCBIndex, Line18+20); 
   return FreeTCBIndex;
}
//****************************************************************************
// Delete a Row in TCB
int TCPObj::DeleteTCB(int TCBRecordNum)
{
   TCBRecord *TCBPointer;
   TCBRecord *tcb;
   long prev;
   long next;
   long hashValue =0;
   long gettime = 0; 
   int retcode = 0; 

   tcb=(TCBRecord*)(TCBBase + (TCBRecordNum * sizeof(TCBRecord) ));
   return 0; 


   TotalDelCount++; 

   if (tcb->taskExists == 0)
   {
       UnMatchedRequests++; 
   }

   if ((tcb->Rsyn == 0 || tcb->Rsyna == 0 || tcb->Rack==0 || tcb->Rget==0 || tcb->Rdata == 0 || tcb->Rfinaa == 0 
           || tcb->Rfinaa == 0 || tcb->Rgeta==0) && (tcb->taskExists != 0)) 
   {
 
   }

   if (PRINT) 
   {
   io.AOAprintHex(tcb->state, Line11+100); 
   io.AOAprintHex(UnMatchedRequests, Line13+120); 
   }
    
   // statistics data 
   gettime = tcb->Rfinaa - tcb->Rsyn;
   if (gettime > MaxConnectionTime && gettime >= 0) 
     MaxConnectionTime = gettime; 

   gettime = tcb->Rget - tcb->Rsyn;
   TotalSynGetTime = TotalSynGetTime + gettime;
   if (gettime > MaxSynGetTime && gettime >= 0) 
     {
       MaxSynGetTime = gettime; 
       if (MaxSynGetTime > 20000)
          {
           MaxSynGetThreshCount++; 
          }
     }

   //This prints 8 fields in the TRACE2 
   //always use 8 fields to make it one line in the output 


   /* 
   if (gettime > 0x0bb8) 
     {
       retcode = storeTraceTCBRecord(TCBRecordNum); 
     }
     */

   TCBPointer = (TCBRecord*)TCBBase;   
 
   if(TCBPointer[TCBRecordNum].state == CLOSED)
   {
       return 0;
   }
   averageconntime = ((averageconntime + ((unsigned long)io.AOAgetTimer() - TCBPointer[TCBRecordNum].connstarttime)));  
   TCBPointer[TCBRecordNum].state = CLOSED; 	

   TCBPointer[TCBRecordNum].Avail = 0;
   TCBPointer[TCBRecordNum].CURRENTTCBRNO = -1; 
   TCBPointer[TCBRecordNum].CURRENTTASK = -1; 
   TCBPointer[TCBRecordNum].taskExists = 0;   //now the task exists flag is reset  

   //TCBPointer[TCBRecordNum].Sent_Flag = 0; 
   //TCBPointer[TCBRecordNum].MSGPTR = 0; 
   //TCBPointer[TCBRecordNum].MSGLEN = 0; 
   prev = TCBPointer[TCBRecordNum].prev;
   next = TCBPointer[TCBRecordNum].next;
   hashValue = t.hashfun(TCBPointer[TCBRecordNum].IP,TCBPointer[TCBRecordNum].PORT); 	
   if(next == -1 && prev ==-1)
   {
       // update the hash ndex to -1
       t.setIndex(hashValue, -1);
   }
   if(next == -1 && prev >-1)
   {
      // Update the free list
      TCBPointer[prev].next =-1;
   } 
   if(next > -1 && prev == -1)
   {
       // update the free list
       t.setIndex(hashValue, next);	
       TCBPointer[next].prev=-1;
       
   }  
   if(next > -1 && prev > -1)
   {
       TCBPointer[next].prev=prev;
       TCBPointer[prev].next=next; 
   } 
   if(FreeList != -1)
   {
   TCBPointer[FreeList].prev = TCBRecordNum;
   TCBPointer[TCBRecordNum].next = FreeList; 
   }
   else
   {
   TCBPointer[TCBRecordNum].next = -1;  
   }
   TCBPointer[TCBRecordNum].prev =-1;
   FreeList = TCBRecordNum;
    
   TCBCount--; 

   return 0;
}

//***********************************************************************************************************
// Get a Row in TCB
int TCPObj::GetTCB(int TCBRecordNum, long *tcb)
{
   TCBRecord *TCBPointer, tcbrecord;
   TCBPointer = (TCBRecord*)(TCBBase + ( TCBRecordNum * sizeof(TCBRecord) ));
	
   if(TCBPointer->Avail == 1) 
   {
       *tcb = (long)TCBPointer;	
       return 0;
   }
   return -1;
}
//**********************************************************************************************************
// This function does a modulo 32 comparision
// z Totaal Receive Window Size
// x is the value which is assumed to be greater
// y is the value whic is assumed to be small 
// Returns 0 if the values are equal
// Returns > 0 if x is > y i.e. x-y
// Returns a value -1 if y is less than x
int TCPObj::greaterEqualto(unsigned long x,unsigned long y)
{
	if(x == y)
	{
		return 0;
	}
	else if(x > y)
	{
			return (x-y);
	}
	else if(x < y)
	{
	        
			return -1;
	}
	return -1;

}
//*************************************************************************************************
// TCPHandler
//*************************************************************************************************
// Returns -17 if the packet is less than minimum length
// Returns -18 if the packet is not for HTTP Port
// Returns -19 if the packet does not have correct checksum
// Returns -20 if Retrieving TCB Record Failed
int TCPObj::TCPHandler(char* TCPPack,int size,char* SourceIP, char* TargetIP,
		       int Protocol, char *macaddr, long timer, int currenttask)
{
char chsum1[2];
char chsum2[2];
int checksum=0;
char SrcPortNum[2];
long TCBRecordNum;
char Header[512];
TCPHeader *tcp;
tcp = (TCPHeader*)Header;
FormatHeader(Header, TCPPack);
TCBRecord *tcb;
int retcode=0;
// check the size if the size is less than the minimum header size return error
if(size < MIN_TSLength)
{
    return -17;
}

// Check the destination port of the packet to be the HTTP Port if so accept it or discard it
if(TCPPack[2] != HTTPPort_H || TCPPack[3] != HTTPPort_L)
{
    return -18;
}

// get the checksum from the packet
chsum1[0] = TCPPack[16];
chsum1[1] = TCPPack[17];

//calculate the checksum of the packet
checksum = TCPChecksum(TCPPack, size, SourceIP, TargetIP, Protocol);

chsum2[0] =(char)((checksum>>8) & 0xFF);
chsum2[1] =(char)(checksum & 0xFF);	

//compare checksum in packet and calculated checksum
if(chsum1[0] != chsum2[0] || chsum1[1] != chsum2[1])
{
    return -19;
}

// Check if a TCB Record is already available
SrcPortNum[0]= TCPPack[0];
SrcPortNum[1]= TCPPack[1];

// search tcb
TCBRecordNum = SearchTCB(SourceIP,SrcPortNum);

if( TCBRecordNum != -1 )
{
   tcb=(TCBRecord*)(TCBBase + (TCBRecordNum * sizeof(TCBRecord) ));
   if((tcp->Flags & TRST) == TRST)
   {        

	  if (TRACE_RECORD_FLAG) 
        storeTraceDword(0xC0000001, TCBRecordNum, 73); //client reset  

       NoOfResets++; 
      if (tcb->taskExists == 0) //RKK & BHARAT  
         DeleteTCB(TCBRecordNum);
      TCBRecordNum = -1; 
      return -45;   //RKK & BHARAT 
   }
}
//io.AOAprintHex(TCBRecordNum, Line2+20); 
//io.AOAprintHex(sizeof(TCBRecord), Line2+40); 
//io.AOAprintHex((long)tcb, Line2+60); 

// Check if TCB Record is available
if(TCBRecordNum == -1)
{
	////io.AOAprintCharacter('!', Line19);
   	// IF the TCB dosent Exist It is assumed to be in Listen State or it is in closed state 
	//  it is a new request, connection does not exist 
	retcode = ListenHandler(TCPPack, size, SourceIP, TargetIP, macaddr, timer, currenttask);
	return retcode;			
}
else
{
        //connection already exists 
	////io.AOAprintCharacter('@', Line19+4);
	// Get the TCB record if available
	if(GetTCB(TCBRecordNum,(long*)&tcb)!=0)
	{
	 	return -20;   
	}

	retcode = OtherHandler(TCPPack, size, TCBRecordNum, timer, currenttask);
	return retcode;
}

return 0;	
}

//************************************************************************************************
// ListenHandler
//************************************************************************************************
int TCPObj::ListenHandler(char* TCPPack,int size, char* SourceIP, char* TargetIP, 
				char *macaddr, long timer, int currenttask)
{
	//RKK Buffer Definitions 
    apptask tsk; 
	AOATask task;
	EtherObj EO;

	char SrcPortNum[2];
	int status;
	char sourceIP[4];
	TCBRecord temptcb;
	int retcode = 0;
	int TCBRecordNum = 0;
	unsigned long tempseq=0;
      	// In this case the TCB Dosenot Exist so assume the state of that connection is in LISTEN State

        // 1. Check for TSYN.
        if( (TCPPack[13] & TSYN) == TSYN)
        {
	    SynCount++; 

		//io.AOAprintCharacter('a', Line20);
		SrcPortNum[0]= TCPPack[0];
		SrcPortNum[1]= TCPPack[1];

		// IF the packet is a syn packet
		temptcb.Avail = 1;
		
		// Error Check these things Here
		temptcb.PORT[0] = TCPPack[0];
		temptcb.PORT[1] = TCPPack[1]; 
		temptcb.IP[0] = SourceIP[0]; 	
		temptcb.IP[1] = SourceIP[1]; 		
		temptcb.IP[2] = SourceIP[2]; 		
		temptcb.IP[3] = SourceIP[3]; 			

		// macaddr is passed from EtherObj
		temptcb.destmac[0] = macaddr[0];
		temptcb.destmac[1] = macaddr[1];
		temptcb.destmac[2] = macaddr[2];
		temptcb.destmac[3] = macaddr[3];
		temptcb.destmac[4] = macaddr[4];
		temptcb.destmac[5] = macaddr[5];

		temptcb.state	= SYNRCVD;
		temptcb.connstarttime = io.AOAgetTimer();
		random r = random(io.AOAgetTimer());	
		temptcb.ISS	= r.getRandomAoA(io.AOAgetTimer());	  
		temptcb.SNDUNA	= temptcb.ISS;
		temptcb.SNDNXT  = temptcb.SNDUNA + 1;   
		
		temptcb.SNDWND 	= charToWindow(&TCPPack[14]);
		temptcb.SEQ = 0;

		// Error: Check These Two Statements
		temptcb.SNDWL1	= 0;
		temptcb.SNDWL2 	= 0xFFFFFFFF;
	
		temptcb.IRS	= charToseqnum(&TCPPack[4]); 
	
		temptcb.RCVNXT  = temptcb.IRS + 1;
		temptcb.RCVWND  = MAXTCPDATASIZE; 
		temptcb.SRTT 	= 0;
		temptcb.LST 	= io.AOAgetTimer();
		temptcb.Sent_Flag=0;
   		temptcb.http_case=0;
   		temptcb.dummy100=0;
		temptcb.DIFF=0;
		temptcb.getackflag=0;
		temptcb.hdrflag=0;
	        temptcb.EXPHEADACK=0;
		temptcb.EXPRESACK=0;
		temptcb.LASTACK=0;
		temptcb.CMPVAL=0;
		temptcb.CMPVAL1=0;
		temptcb.MSGLEN=0;
		temptcb.STARTRESSEQ=0;
		temptcb.MSGPTR=0;
		temptcb.Sent_Flag=0;
		temptcb.sendf=0;
		temptcb.CURRENTTASK=-1;
		temptcb.CURRENTTCBRNO=-1;
		temptcb.k=0;
		temptcb.k1=0;
		temptcb.p=0;
		
		temptcb.resourceType=0;
		temptcb.rIndex=0;
		temptcb.startSeq=0;
		temptcb.noOfPackets=0;
		temptcb.leftOverBytes=0;
		temptcb.lastSet=0;
		temptcb.sendtype=0;

		temptcb.count1=0;
		temptcb.http_complete=0;
		temptcb.http_state=0;
		temptcb.temprIndex=0;
		temptcb.tempSeqNum=0;
		temptcb.tempflags=0;
                temptcb.resetFlag=0;
                temptcb.suspendFlag=0;
		temptcb.resumeFlag=0;
		temptcb.taskExists=0;
		temptcb.partialFlag=0;
		temptcb.partialFlag=0;
		temptcb.Rsyn=0;
		temptcb.Rsyna=0;
		temptcb.Rack=0;
		temptcb.Rget=0;
		temptcb.Rgeta=0;
		temptcb.Rdata=0;
		temptcb.Rfina=0;
		temptcb.Rfinaa=0;
		// Insert Record into TCB
		status = InsertTCB(&temptcb);
        if (TRACE_RECORD_FLAG) 
        {
          storeTraceDword(status, status ,0); //store SYN in the first entry 
		  tempseq = charToseqnum(SrcPortNum);
          storeTraceDword(tempseq, status, 5); //store portno  
        }

		// IF TCB table is full
		if(status == -1)
		{
			//io.AOAprintCharacter('b', Line20+4);
			//SrcPortNum[0]= HTTPPort_H;
	 		//SrcPortNum[1]= HTTPPort_L; 
	 	 	//seqnum = 0x00;
			//seqnum = charToseqnum(&TCPPack[4]);
			tempseq=charToseqnum(&TCPPack[8]);
	  		retcode =  SendMisc(SourceIP, &TCPPack[0], tempseq, TRST, macaddr, RESETTYPE, currenttask);
	        if (TRACE_RECORD_FLAG) 
              storeTraceDword(0xE0000001, status, 74); //server reset  
            return retcode;
		}		
		else
		{
			//io.AOAprintCharacter('c', Line20+8);
	 	
			//Send SYN ACK Back
			//SrcPortNum[0]= HTTPPort_H;
			//SrcPortNum[1]= HTTPPort_L; 	
                        
			retcode =  SendMisc(SourceIP, &TCPPack[0],TSYN|TACK, macaddr, SYNACKTYPE, currenttask);
	        if (TRACE_RECORD_FLAG) 
               storeTraceDword(0xA0000001, status, 48); //send ack 
			//sourceIP[0]=10,
			//sourceIP[1]=55;
			//sourceIP[2]=11;
			//sourceIP[3]=50;
			//retcode =  SendMisc(sourceIP, &TCPPack[0],TSYN|TACK, macaddr, SYNACKTYPE, currenttask);
		    TCBCount++;	
			SynAckCount++; 
			if (TCBCount > MaxNoOfTCBsUsed)
			  MaxNoOfTCBsUsed = TCBCount;  //statistics data 
			
			if(TCBCount>=TCBRecords)
			    {
			    io.AOAPrintText("TCBObj:TCB is full", Line23);			
			    io.AOAprintHex(TCBCount, Line23+80); 
			    }
			TCBRecordNum = SearchTCB(SourceIP,SrcPortNum);
                        TCBRecord *tcb;
			
                        tcb=(TCBRecord*)(TCBBase + (TCBRecordNum * sizeof(TCBRecord) ));
		        //io.AOAprintHex(tcb->SNDNXT, Line5);
			//io.AOAprintHex(tcb->RCVNXT, Line5+20);	
			tcb->SNDNXT++;
			tcb->Rsyn = timer;
			tcb->Rsyna = io.AOAgetTimer(); 
			return retcode;
	        }
	  }// End of SYN 
  
        //if we get finack, we assume that client would like to close the connection, we just send ack back to 
        //agree the client's action
	//RKK At this point, there is no connection, we need to take FINACK and turn it into ACK properly 
	//When a FIN-ACK ACK is not reached or delayed on the network, client sends another finack 
	//  we already closed the connection at the server 
	if((TCPPack[13] & FINACK) == FINACK) 
	{
	     tempseq=charToseqnum(&TCPPack[8]);
         //DUMMY-FINACK
         retcode = SendMisc(&TCPPack[0], TargetIP, macaddr, currenttask);
	     if (TRACE_RECORD_FLAG) 
           storeTraceDword(0xFFFFFFFF, TCBRecordNum, 40); //dummy finack came 
	}
        
	// 2. Check for TACK
      	if((TCPPack[13] & TACK) == TACK) 
      	{
	  //io.AOAprintCharacter('d', Line20+12);
	  // Why TRST Here   
	  // check if it is an acknowledgement if so send a reset	
	  //SrcPortNum[0]= HTTPPort_H;
	  //SrcPortNum[1]= HTTPPort_L; 
	  //seqnum = 0x00;
	  //seqnum = charToseqnum(&TCPPack[8]);

	  //io.AOAPrintText("TCPObj:ListenHandler 2. check for tack", Line20);
	  //retcode = SendMisc(SourceIP, &TCPPack[0], TRST, macaddr, RESETTYPE, currenttask);

          //return retcode;
        }

	 // 3. Check for TFIN
      	if((TCPPack[13] & TFIN) == TFIN) 
      	{
	      //io.AOAprintCharacter('d', Line20+12);
	      // Why TRST Here   
	      // check if it is an acknowledgement if so send a reset	
	      //SrcPortNum[0]= HTTPPort_H;
	      //SrcPortNum[1]= HTTPPort_L; 
	      //seqnum = 0x00;
	      //seqnum = charToseqnum(&TCPPack[8]);

	      //io.AOAPrintText("TCPObj:ListenHandler 3. check for tfin", Line23);
	      retcode = SendMisc(SourceIP, &TCPPack[0], TRST, macaddr, RESETTYPE, currenttask);
	      if (TRACE_RECORD_FLAG) 
              storeTraceDword(0xE0000002, TCBRecordNum, 74); //server reset  
          //return retcode;
        }
	
      return 0; 
}

//********************************************************************************************************
// OtherHandler 
//********************************************************************************************************
int TCPObj::OtherHandler(char* TCPPack,int size, int TCBRecordNumber, long timerEth, int currenttask)
{
    AOATask task;
    apptask tsk;
    EtherObj EO; 
    WCirList cir; 
    AOAProtected io;
    
    int retcode=0;
    char SrcPortNum[2];
    char options[10];
    char data[10];
    char TargetMAC[6]; 	
    int Acceptable_Flag = 1;
    int currtime = 0;
    char Header[512];
    int len = 0;
    int i=0; 
    int ack1=0; 

    TCPHeader *tcp;

    tcp = (TCPHeader*)Header;
    FormatHeader(Header, TCPPack);


    TCBRecord *tcb;
    tcb = (TCBRecord*)(TCBBase + ( TCBRecordNumber * sizeof(TCBRecord) )); 
     SrcPortNum[0]= HTTPPort_H;
     SrcPortNum[1]= HTTPPort_L;
     
    if((size - (tcp->Dataoffset*4)) > tcb->RCVWND)	
    {
        Acceptable_Flag = 0;
    }
		
    // If the Incomming segment is not acceptable 
    if(Acceptable_Flag == 0)
    {	
	    //io.AOAprintCharacter('e', Line20+16);
	    if((tcp->Flags & TRST) == TRST)
	    {
		//io.AOAprintCharacter('f', Line20+20);
		// If the segment has a RST flag on. Drop the segment, delete tcb and return
		//if(tcb->suspendFlag == 1)
	    if (TRACE_RECORD_FLAG) 
          storeTraceDword(0xC0000002, TCBRecordNumber, 73); //client reset  
        NoOfResets++; 
		if(tcb->taskExists == 1)
		{
		    tcb->resetFlag=1;
		}
		else
        {
            if (tcb->taskExists == 0)   //RKK & BHARAT
		       DeleteTCB(TCBRecordNumber); 
        }
		return 0;	
	    }
	    else
	    {
			//io.AOAprintCharacter('g', Line20+24);
               		// Error is here check it
			// send an Acknowledgement drop the segment and return 
			// Form an ACK and Send it 
//			io.AOAPrintText("TCPObj:OtherHandler in TACK|TRST", Line22);
//			io.AOAprintHex(TCBRecordNumber, Line22+140);
//			io.AOAprintHex((long)tcb->PORT, Line22+120);
	  		retcode =  SendMisc(tcb->IP, tcb->PORT, TACK|TRST, tcb->destmac, RESETTYPE, currenttask);
	        if (TRACE_RECORD_FLAG) 
              storeTraceDword(0xE0000003, TCBRecordNumber, 74); //server reset  
//	         io.AOAPrintText("ii",Line19);
			//if(tcb->suspendFlag == 1)
			if(tcb->taskExists == 1)
			{
		            tcb->resetFlag=1;
			}
		    else
                {
		            DeleteTCB(TCBRecordNumber); 	
                }
			
			return retcode;
	    }
    }  
    else //If the Incomming segment is acceptable
    {
	//io.AOAprintCharacter('h', Line20+28);
	// 2. Check if the RST bit is set 
      if((tcp->Flags & TRST) == TRST)
	    {
	      //io.AOAprintCharacter('i', Line20+32);
	      //if(tcb->suspendFlag == 1)
	      if (TRACE_RECORD_FLAG) 
             storeTraceDword(0xC0000003, TCBRecordNumber, 73); //client reset  
          NoOfResets++; 

	      if(tcb->taskExists == 1)
		    {
		    tcb->resetFlag=1;
            }
		  else
          {
            if (tcb->taskExists == 0) 
		      DeleteTCB(TCBRecordNumber); 
          }
	     return 0;
	    }

	// 3. Check the SYN bit
	if((tcp->Flags & TSYN) == TSYN)
	{
	    //io.AOAprintCharacter('j', Line20+36);
   	    // Form an ACK and Send it 
			
	    // Format a TCP Packet
	    // Error: The reset Sequence number might change
	    // Why TRST Here
	
	    retcode =  SendMisc(tcb->IP, tcb->PORT, TSYN|TACK,tcb->destmac, SYNACKTYPE, currenttask);
	    if (TRACE_RECORD_FLAG) 
           storeTraceDword(0xA0000002, TCBRecordNumber, 49); //send ack 
//	    io.AOAPrintText("jj",Line19);
	}

	// 4. Check the ACK Field
	if((tcp->Flags & TACK) == TACK)
	{
	    tcb->SNDWND = tcp->window;
	    //io.AOAprintCharacter('k', Line20+40);
	   if(tcb->state == SYNRCVD)
	    {
		//io.AOAprintHex(tcb->SNDNXT, Line5+40);
		//io.AOAprintHex(tcp->acknumber, Line5+60);
		//io.AOAprintCharacter('l', Line20+44);
	    // if we get correct ack for syn/ack, change state to established
        if (TRACE_RECORD_FLAG)
          storeTraceDword(0x0041434b, TCBRecordNumber, 1); //store SYN ACK in the first entry 
		if((greaterEqualto(tcp->acknumber, tcb->SNDUNA) >= 0) && 
		   (greaterEqualto(tcb->SNDNXT, tcp->acknumber) >= 0) )
		{
		    //io.AOAprintCharacter('m', Line20+48);
		    // The Ack is acceptable 
		    // Our SYN has been ACKED 
		    // Enter Established State
		    tcb->state= ESTAB;
           if (TRACE_RECORD_FLAG)
            storeTraceDword(tcb->state, TCBRecordNumber, 2); //ESTAB state
		    tcb->SRTT = io.AOAgetTimer() - tcb->LST;
            tcb->Rack=timerEth;
		    if( tcb->SRTT == 0 )
			tcb->SRTT = 1;
                    //tcb->SRTT = tcb->SRTT*85;
                    tcb->SRTT = tcb->SRTT*400;
                    //tcb->SRTT = tcb->SRTT*85;
		    if(tcb->SRTT<min)
		    {
			min = tcb->SRTT;
//			io.AOAprintHex(min, Line2+140);
		    }

		    if(tcb->SRTT>max)
		    {
		        max = tcb->SRTT;
//			io.AOAprintHex(max, Line3+140);

		    }
		    len = size - (tcp->Dataoffset*4);
		    tcb->MSGLEN = len;
		    if(len !=0)
		    {
			   if(TCPPack[20] == 'G' && TCPPack[21] == 'E' && TCPPack[22] == 'T')
			   {
			      //io.AOAprintCharacter('s', Line20+72);
	 		      tcb->RCVNXT = tcb->RCVNXT + len;
			      tcb->RCVWND = tcb->RCVWND - len;
                  tcb->Rget=timerEth;
			      GetCount++; 

                if (TRACE_RECORD_FLAG)
                  storeTraceDword(0x00474554, TCBRecordNumber, 3); //GET 

//			      retcode = h.insert(&(TCPPack[(tcp->Dataoffset*4)]), len,TCBRecordNumber,
//						tcb->IP, tcb->PORT);

			      tcb->MSGPTR = (char*)(TCP_MSG_ADDR + TCBRecordNumber * TCP_MSG_MAXSIZE - ADDR_OFFSET);				      
			      //io.AOAprintHex((long)tcb->MSGPTR, Line20);
			      //io.AOAprintHex((long)TCP_MSG_ADDR, Line20+20);
			      //io.AOAprintHex((long)TCBRecordNumber, Line20+40);
			      //io.AOAprintHex((long)TCP_MSG_MAXSIZE, Line20+60);
			      //io.AOAprintHex((long)tcb->MSGLEN, Line20+80);
			      
		 	      for(int i=0; i < tcb->MSGLEN ; i++)
		              {
       		                 tcb->MSGPTR[i] = TCPPack[20+i]; //store packet in memory 		    
		              }
			      //for(i=0; i<16; i++)
			      //{
			      // io.AOAprintHex((long)tcb->MSGPTR[i], Line5+i*20);
			      //}			      

	                      retcode =  SendMisc(tcb->IP, tcb->PORT, TACK, tcb->destmac, GETACKTYPE, currenttask);
	                      if (TRACE_RECORD_FLAG) 
                             storeTraceDword(0xA0000003, TCBRecordNumber, 50); //send ack 
                              tcb->Rgeta=io.AOAgetTimer();
                              tcb->getackflag=1;
			      if(retcode != 0)
			       {
//				io.AOAPrintText("Sending Ack for GET failed", Line23); 
//				io.AOAprintHex(retcode, Line23+80); 
			       return retcode;
			       }

			    //sdp schedul 
			    // a task from iddle list will be inserted into a run list
		//	      tcb->CURRENTTCBRNO = TCBRecordNumber; //tcb record number is also stored in tcb table
			      HttpCount++; //increment the http count  
			      HttpRequests++;  //total no of HTTP requests 
                  tcb->taskExists = 1;   //remember that from now on, this task exists 
	    		  tsk.insertHttpTask(TCBRecordNumber, io.AOAgetTimer());
			      io.AOAMaskRunRegister(HTTP_PID, 1);

			    } // end of if
		    }
		    tcb->CURRENTTCBRNO = TCBRecordNumber; //tcb record number is also stored in tcb table
//		    tcb->RCVNXT++;
		  //sdp  tcb->SNDUNA = tcp->acknumber;
		  //sdp  tcb->LST = io.AOAgetTimer();

//		    tcb->SRTT =CalcRTT(tcb->LST,tcb->SRTT);
                    //firstrtt
		    //  tcb->LST = io.AOAgetTimer();
		    return 0;
		}
		else
		{
			//io.AOAprintCharacter('n', Line20+52);
			// Error : Might Have Error Check it 
		    	// The Ack is not acceptable so send a RST and send it
			// Format a TCP Packet
			// Why TRST Here
//                        io.AOAPrintText("kk",Line19);
//	                io.AOAprintHex(tcb->SNDUNA,Line19+100);
//	                io.AOAprintHex(tcb->SNDNXT,Line19+120);
//	                io.AOAprintHex(tcp->acknumber,Line19+140);
	  		retcode =  SendMisc(tcb->IP, tcb->PORT, TRST, tcb->destmac, RESETTYPE, currenttask);
	        if (TRACE_RECORD_FLAG) 
              storeTraceDword(0xE0000004, TCBRecordNumber, 74); //server reset  
	         
			//if(tcb->suspendFlag == 1)
			//if(tcb->suspendFlag == 1)
			if(tcb->taskExists == 1)
			{
		        tcb->resetFlag=1;
//			    io.AOAPrintText("EE", Line19+100);
			}
		    else
                {
		            DeleteTCB(TCBRecordNumber); 
                }
			return retcode;
		}
	    } // end of if SYNRCVD

	    // Start of ESTAB State checking 
	    if(tcb->state == ESTAB)
	    {
        if (TRACE_RECORD_FLAG) 
         {
          storeTraceDword(tcb->state, TCBRecordNumber, 16); //ESTAB state parameters  
          storeTraceDword(tcb->http_state, TCBRecordNumber, 17); 
          storeTraceDword(tcb->SNDNXT, TCBRecordNumber, 18); 
          storeTraceDword(tcb->SNDUNA, TCBRecordNumber, 19); 
          storeTraceDword(tcp->acknumber, TCBRecordNumber, 20); 
          storeTraceDword(tcp->seqnumber, TCBRecordNumber, 21); 
         }

	    //		    io.AOAprintCharacter('A', Line9);
		//io.AOAprintCharacter('o', Line20+56);
		// Case 1:		    
		//  |----------|-------|-------|-----------|
		//  0	      UNA     ack    SNDNXT     MAXTCPDATASIZE
		if((greaterEqualto(tcp->acknumber, tcb->SNDUNA) >= 0) && 
		   (greaterEqualto(tcb->SNDNXT, tcp->acknumber) >= 0))	
		{
			//io.AOAprintCharacter('p', Line20+60);
			if((greaterEqualto(tcp->seqnumber, tcb->SNDWL1) > 0) ||
			  ((tcb->SNDWL1 == tcp->seqnumber) && (greaterEqualto(tcp->acknumber, 
			    tcb->SNDWL2) >= 0)))
			{
			    tcb->SNDWL1 = tcp->seqnumber;
			    tcb->SNDWL2 = tcp->acknumber;
			}
			//PrintTCB(TCBRecordNumber,Line17);
	        tcb->SNDUNA=tcp->acknumber;
	//		tcb->SRTT = CalcRTT(tcb->LST,tcb->SRTT);
	//		tcb->DIFF = CalcDiff(tcb->LST,tcb->SRTT,tcb->DIFF);
	//		tcb->SRTT = tcb->SRTT + 2*(tcb->DIFF);
//	                io.AOAprintHex(tcb->EXPHEADACK, Line5);	

			//*****************************
			//AW-try Sept 25, 2014
			//AW commented out code Sept 25, 2014
			/*start of commented out code Sept 25, 2014
			if(tcb->SNDNXT == tcb->SNDUNA)
			{
				if(tcb->suspendFlag==1)        //let the task get out of delay
                {
                    if (tcb->resumeFlag == 1) 
                        return DONOTDISCARD; 
					tcb->resumeFlag=1;
                }

			}
			*/
            //AW end of commented out code Sept 25, 2014 */

			//AW-try added code block to update window Sept 25,2014
			// We have to update the send window here RKK-ALW	
            //  and resume the task 
            //  SNDNXT indicates expected ACK, already sent upto here 
            //  acknumber indicates what client rcvd upto now 
            tcb->SNDWND = tcp->window - (tcb->SNDNXT - tcp->acknumber); 
            if (tcb->suspendFlag == 1) 
                tcb->resumeFlag = 1; //resume the suspended task 
			//AW end of added code Sept 25, 2014
			//AW-try end Sept 25, 2014

			//********************************

                       // tcb->LST = io.AOAgetTimer();
			
			if((tcp->Flags & TFIN) == TFIN)
			{
			    //io.AOAprintCharacter('r', Line20+68);
			    if (TRACE_RECORD_FLAG) 
                   storeTraceDword(0x05000001, TCBRecordNumber, 41); //finack came 

			    tcb->state = CLOSEWAIT;
			    if (TRACE_RECORD_FLAG) 
                   storeTraceDword(tcb->state, TCBRecordNumber, 4); //state 
	  	 	    //RKK-AW retcode =  SendMisc(tcb->IP, tcb->PORT, TRST, tcb->destmac, RESETTYPE, currenttask);
	  	 	    retcode =  SendMisc(tcb->IP, tcb->PORT, ACKTYPE, tcb->destmac, ACKTYPE, currenttask);
	            if (TRACE_RECORD_FLAG) 
                   storeTraceDword(0xA0000004, TCBRecordNumber, 51); //ack 
                //Send Ack for FINACK and close the connection 
			    //io.AOAPrintText("aa", Line23+100);
			    if(retcode!=0)
				  return retcode;		    
			    //if(tcb->suspendFlag == 1)
			    if(tcb->taskExists == 1)
			    {
		          tcb->resetFlag=1; //wait until the task comes out of the queue
                  // do not delete TCB now 
			    }
		        else
			    {
		          DeleteTCB(TCBRecordNumber); 
			    }
                            return 0;
			}

			// payload
		    //  if the packet size is greater than 60 bytes, it is perhaps GET command 
			len = size - (tcp->Dataoffset*4);
			// in future
            // RKKGET 
            // when a client makes a GET request with connection keep-alive 
            //  then it may send this information in the GET packet 
            //  The GET packet itself can be broken into one or more pieces 
            //  Thus, it is absolutely necessary to parse the GET packet and 
            //  make sure all the necessary fields are there and the packet is coomplete 
            //  the continuation GET packets do not have GET in the message! 
			if(len !=0)
			{
			   if(TCPPack[20] == 'G' && TCPPack[21] == 'E' && TCPPack[22] == 'T')
			   {
                  if (TRACE_RECORD_FLAG)
                    storeTraceDword(0x00474554, TCBRecordNumber, 3); //GET 
			      if (tcb->getackflag == 1)  //RKKAW Duplicate GET came in 
                               {
                                 //send ACK NEWCODE 
                                 retcode =  SendMisc(tcb->IP, tcb->PORT, TACK, tcb->destmac, GETACKTYPE, currenttask);
	                             if (TRACE_RECORD_FLAG) 
                                   storeTraceDword(0xA0000005, TCBRecordNumber, 52); //ack 
                                 return 0; 
                               }
			      tcb->MSGLEN = len;    //store the packet length of GET 
			      //io.AOAprintCharacter('s', Line20+72);
	 		      tcb->RCVNXT = tcb->RCVNXT + len;
			      tcb->RCVWND = tcb->RCVWND - len;
                              tcb->Rget=timerEth;
			      GetCount++; 

//			      retcode = h.insert(&(TCPPack[(tcp->Dataoffset*4)]), len,TCBRecordNumber,
//						tcb->IP, tcb->PORT);

			      tcb->MSGPTR = (char*)(TCP_MSG_ADDR + TCBRecordNumber * TCP_MSG_MAXSIZE - ADDR_OFFSET);				      
			      //io.AOAprintHex((long)tcb->MSGPTR, Line20);
			      //io.AOAprintHex((long)TCP_MSG_ADDR, Line20+20);
			      //io.AOAprintHex((long)TCBRecordNumber, Line20+40);
			      //io.AOAprintHex((long)TCP_MSG_MAXSIZE, Line20+60);
			      //io.AOAprintHex((long)tcb->MSGLEN, Line20+80);
			      
		 	      for(i=0; i < tcb->MSGLEN ; i++)
		              {
       		            tcb->MSGPTR[i] = TCPPack[20+i]; //store packet in memory 		    
                        //if the last two bytes are not 0x0d and 0x0a then this is a partial packet 
		              }
                  //RKK change for keep-alive and multiple packets for a GET 
                  if ((tcb->MSGPTR[i-1] == 0x0a) && (tcb->MSGPTR[i-2] == 0x0d))
                      tcb->partialFlag = 0; 
                  else tcb->partialFlag = 1;  //set the partial flag  
			      //for(i=0; i<16; i++)
			      //{
			      // io.AOAprintHex((long)tcb->MSGPTR[i], Line5+i*20);
			      //}			      

	              retcode =  SendMisc(tcb->IP, tcb->PORT, TACK, tcb->destmac, GETACKTYPE, currenttask);
	              if (TRACE_RECORD_FLAG) 
                     storeTraceDword(0xA0000006, TCBRecordNumber, 53); //ack GET ACK  
                  tcb->Rgeta=io.AOAgetTimer();
                  tcb->getackflag=1;
			      if(retcode != 0)
			       {
//				     io.AOAPrintText("Sending Ack for GET failed", Line23); 
//				     io.AOAprintHex(retcode, Line23+80); 
			         return retcode;
			       }

			    //sdp schedul 
			    // a task from iddle list will be inserted into a run list
		//	      tcb->CURRENTTCBRNO = TCBRecordNumber; //tcb record number is also stored in tcb table
        //
                if (tcb->partialFlag == 0) //this is a complete packet, start the task to process GET 
                  {
			         HttpCount++; //increment the http count  
			         HttpRequests++;  //total no of HTTP requests 
                     tcb->taskExists = 1;   //remember that from now on, this task exists 

	    		     tsk.insertHttpTask(TCBRecordNumber, io.AOAgetTimer());
			         io.AOAMaskRunRegister(HTTP_PID, 1);
                  }
			    } // end of if for GET in the packet 
               else if (tcb->partialFlag == 1) //No GET in this packet  
                {
	 		      tcb->RCVNXT = tcb->RCVNXT + len;
			      tcb->RCVWND = tcb->RCVWND - len;
			      tcb->MSGPTR = (char*)(TCP_MSG_ADDR + TCBRecordNumber * TCP_MSG_MAXSIZE - ADDR_OFFSET);
		 	      for(i=0; i < len ; i++)
       		         tcb->MSGPTR[i+tcb->MSGLEN] = TCPPack[20+i]; //add this packet to previous data 		    
                  if ((tcb->MSGPTR[tcb->MSGLEN + i-1] == 0x0a) && (tcb->MSGPTR[tcb->MSGLEN + i-2] == 0x0d))
                      tcb->partialFlag = 0; 
                  else tcb->partialFlag = 1;  //set the partial flag  
			      tcb->MSGLEN = tcb->MSGLEN + len;    //update the packet length   
                  //io.AOAprintHex(tcb->MSGLEN, Line20+20); 
                  //io.AOAprintHex((long)tcb->MSGPTR, Line20+40); 

	              retcode =  SendMisc(tcb->IP, tcb->PORT, TACK, tcb->destmac, GETACKTYPE, currenttask);
	              if (TRACE_RECORD_FLAG) 
                     storeTraceDword(0xA0000007, TCBRecordNumber, 54); //ack 
                  if (tcb->partialFlag == 0) //this is a complete packet, start the task to process GET 
                     {
			           HttpCount++; //increment the http count  
			           HttpRequests++;  //total no of HTTP requests 
                       tcb->taskExists = 1;   //remember that from now on, this task exists 
	    		       tsk.insertHttpTask(TCBRecordNumber, io.AOAgetTimer());
			           io.AOAMaskRunRegister(HTTP_PID, 1);
                     }
                }
			    else
			    {
				return -32;
			    }
			}
			
  		        // We may have to set up the send window here	
		        // Send an Acknowledgement 
			return 0;
		}

		
		// Case 2:		    
		//  |----------|-------|-------|-----------|
		//  0	      ack     UNA    SNDNXT     MAXTCPDATASIZE
		else if(greaterEqualto(tcb->SNDUNA, tcp->acknumber) > 0)
		{
		//io.AOAprintCharacter('C', Line9+8);			
//		io.AOAprintHex(tcp->acknumber,Line9+100);
//		PrintTCB(TCBRecordNumber, Line18);
			//io.AOAprintCharacter('u', Line20+80);
	                // ignore it  
			//
		//	tcb->SRTT = CalcRTT(tcb->LST,tcb->SRTT);
		//	tcb->LST = io.AOAgetTimer();
			return 0;
		}

		// Case 3:		    
		//  |----------|-------|-------|-----------|
		//  0	      UNA     SNDNXT  ack     MAXTCPDATASIZE
		else if(greaterEqualto(tcp->acknumber,tcb->SNDNXT) > 0)
		{
			//io.AOAprintCharacter('v', Line20+84);
		//	io.AOAprintHex(tcp->acknumber,Line9+120);
		//	io.AOAprintCharacter('D', Line9+12);
//			PrintTCB(TCBRecordNumber,Line19);

	  		retcode =  SendMisc(tcb->IP, tcb->PORT, TRST, tcb->destmac, RESETTYPE, currenttask);
	        if (TRACE_RECORD_FLAG) 
              storeTraceDword(0xE0000005, TCBRecordNumber, 74); //server reset  
//			io.AOAPrintText("bb", Line19);
			
			//if(tcb->suspendFlag == 1)
			if(tcb->taskExists == 1)
			{
		           tcb->resetFlag=1;
//			   		    io.AOAPrintText("FF", Line19+100);
			}
		    else
                {
		           DeleteTCB(TCBRecordNumber); 
                }
			
			return retcode;	
		}
		else
		{
		//	io.AOAprintHex(tcp->acknumber,Line9+140);
        //			PrintTCB(TCBRecordNumber,Line20);
		}
		

		
	    }// End of ESTAB State Checking

	    if(tcb->state == FINWAIT1)
	    {
          //RKK DATA CHECK received by the client 
          if (((tcb->EXPRESACK + 1) == tcb->SNDNXT)) 
             {
                 //The data sent so far has been acknowledged 
                 // there is no need to retransmit data 
                 if (TRACE_RECORD_FLAG == 1) 
                   wttr.insert((tcb->CURRENTTASK - tsk.MinTaskId), TASK_MASK_DATA);  
                 if (TRACE_RECORD_FLAG) 
                   {
                     storeTraceDword(tcb->state, TCBRecordNumber, 24); //FINWAIT state parameters  
                     storeTraceDword(tcb->http_state, TCBRecordNumber, 25); 
                     storeTraceDword(tcb->SNDNXT, TCBRecordNumber, 26); 
                     storeTraceDword(tcb->SNDUNA, TCBRecordNumber, 27); 
                     storeTraceDword(tcp->acknumber, TCBRecordNumber, 28); 
                     storeTraceDword(tcp->seqnumber, TCBRecordNumber, 29); 
                     storeTraceDword(tcb->EXPRESACK+1, TCBRecordNumber, 30); 
                   }
             }

		     //io.AOAprintCharacter('w', Line20+88);
            //io.AOAprintHex(tcp->acknumber,Line24);
	        //io.AOAprintHex(tcb->SNDNXT,Line24+20);	
		if(tcp->acknumber == (tcb->SNDNXT))
		{
            storeTraceDword(tcb->state, TCBRecordNumber, 32);//acknumber is equal sndnxt  
            storeTraceDword(tcp->acknumber, TCBRecordNumber, 33);//acknumber  
            storeTraceDword(tcb->SNDNXT, TCBRecordNumber, 34);//sndnxt  
			tcb->SNDUNA = tcp->acknumber;
                      //tcb->LST = io.AOAgetTimer();
	                   //		tcb->SRTT = CalcRTT(tcb->LST,tcb->SRTT);
                       // tcb->LST = io.AOAgetTimer();
		              // do not set resumeflag at this point 
	                //if(tcb->suspendFlag == 1)         //if we get the ack as we required, restart resume flag
			        //    tcb->resumeFlag = 1;         //to go back to the tcpSendN

           if((tcp->Flags & TFIN) == TFIN)
			{
			    tcb->RCVNXT++;
			    tcb->Rfina=timerEth;
			    if (TRACE_RECORD_FLAG) 
                   storeTraceDword(0x06000002, TCBRecordNumber, 41); //finack came 
                // io.AOAPrintText("AA", Line2+40);
	         	retcode =  SendMisc(tcb->IP, tcb->PORT, TACK, tcb->destmac, FINACKTYPE, currenttask); 
	            if (TRACE_RECORD_FLAG) 
                     storeTraceDword(0xA0000008, TCBRecordNumber, 55); //ack 

			    if (TRACE_RECORD_FLAG == 1) 
                   wttr.insert((tcb->CURRENTTASK - tsk.MinTaskId), TASK_MASK_FINACK1);   

			    tcb->Rfinaa=io.AOAgetTimer();
			    if(retcode!=0)
	              return retcode;					    
			   // tcb->LST=io.AOAgetTimer()
		           // tcb->state = FINWAIT2; 
			   if(tcb->suspendFlag == 1)
			   {
				tcb->Sent_Flag = 1;
                if (tcb->resumeFlag == 1) 
                   return DONOTDISCARD; 
				tcb->resumeFlag=1;
			   }
		             
			    return 0;
			}
			else
			{
			    //tcb->LST=io.AOAgetTimer();
			    tcb->state = CLOSING;
			    if (TRACE_RECORD_FLAG) 
                  storeTraceDword(tcb->state, TCBRecordNumber, 4); //state   
			    if (TRACE_RECORD_FLAG == 1) 
                   wttr.insert((tcb->CURRENTTASK - tsk.MinTaskId), TASK_MASK_CLOSING);   
			    return 0;
			}
		        //if(tcb->suspendFlag==1)        //let the task get out of delay
			//   tcb->resumeFlag=1;
		}
		else if(tcp->acknumber > tcb->SNDUNA && tcp->acknumber < (tcb->SNDNXT))
		{
//			io.AOAprintHex(tcb->EXPHEADACK, Line6);	
			//io.AOAprintCharacter('y', Line20+96);
			tcb->SNDUNA = tcp->acknumber;
			//
//			tcb->SRTT = CalcRTT(tcb->LST,tcb->SRTT);
		//	tcb->LST = io.AOAgetTimer();
			
           if((tcp->Flags & TFIN) == TFIN)
			{
	         	retcode =  SendMisc(tcb->IP, tcb->PORT, TACK, tcb->destmac, RESETTYPE, currenttask); 
	            if (TRACE_RECORD_FLAG) 
                     storeTraceDword(0xA0000009, TCBRecordNumber, 56); //ack 

			    if (TRACE_RECORD_FLAG) 
                   storeTraceDword(0x06000003, TCBRecordNumber, 41); //finack  
			    if(retcode!=0)
			        return retcode;			    
//			io.AOAPrintText("cc", Line19);
			    
			    if(tcb->suspendFlag == 1)
			    {
                        if (tcb->resumeFlag == 1) 
                           return DONOTDISCARD; 
		                tcb->resumeFlag=1;
			    }
		            else
		                DeleteTCB(TCBRecordNumber); 

		            //tcb->state = CLOSING; 
			    return 0;
			}
//	                if(tcb->suspendFlag == 1)     //new code need to process Dr.Karne's no rtt process
//			     tcb->resumeFlag = 1;
		        return 0;	
		}
		else
		{
                //Time Out
		      	if(mod32cmp(io.AOAgetTimer(), tcb->LST) > TIMER_PERIOD*1191 )
		        {
		         //if(tcb->suspendFlag == 1)
			     if (TRACE_RECORD_FLAG == 1) 
                   wttr.insert((tcb->CURRENTTASK - tsk.MinTaskId), TASK_MASK_TIMEOUT);   
		         if(tcb->taskExists == 1)
			     {
		            tcb->resetFlag=1;
//				    io.AOAPrintText("II", Line21+80);
			     }
		         else
                     {
		                DeleteTCB(TCBRecordNumber); 
                     }
	                     return 0;	
		        }
                else 
                    {
                      if (size == 21) //keep-alive packet  
                        {
                          io.AOAprintHex((long)TCPPack, Line20+20); 
                          io.AOAprintHex(tcb->suspendFlag, Line20+40); 
                          io.AOAprintHex(tcb->SNDUNA, Line20+60); 
                          io.AOAprintHex(tcp->acknumber, Line20+80); 
                          io.AOAprintHex(tcb->EXPRESACK, Line20+100); 
                          io.AOAprintHex(tcb->SNDNXT, Line20+120); 
                          io.AOAprintHex(tcb->http_state, Line20+140); 
	                      retcode =  SendMiscKA(tcb->IP, tcb->PORT, TACK, tcb->destmac, 
                                  KALIVETYPE, tcp->acknumber, currenttask);
	                      if (TRACE_RECORD_FLAG) 
                             storeTraceDword(0x21000010, TCBRecordNumber, 57); //ack 
                        }
                       else      
                       {
                           //RKK-AW no need to do send anything 
                           //send regular ack  
                           /*
	                       retcode =  SendMisc(tcb->IP, tcb->PORT, TACK, tcb->destmac, KALIVETYPE, currenttask);  
	                       if (TRACE_RECORD_FLAG) 
                             storeTraceDword(0xA0000011, TCBRecordNumber, 58); //ack 
                             */

	                      //if(tcb->suspendFlag == 1)     //new code need to process Dr.Karne's no rtt process
			              //tcb->resumeFlag = 1;
                    }
			        return 0;
		          }
        }	
	    } //end of FINWAIT1
/*	    
       if(tcb->state == FINWAIT2)
	   {	
	        retcode =  SendMisc(HostIP, SourceIP, SrcPortNum, &TCPPack[0],TACK,tcb->RCVWND,
		        	       tcb->SNDNXT,tcb->RCVNXT + 1, options, 0, data, 0, 
				       tcb->destmac, 0, currenttask);
		if(mod32cmp(io.AOAgetTimer(), tcb->LST) > TIMER_PERIOD*36 )
		{
		   DeleteTCB(TCBRecordNumber); 
	           return 0;	
		}
	        return 0;
	   }
*/

	   if(tcb->state == CLOSING)
	   {	
		if((tcp->Flags & TFIN) == TFIN)
		{
			if (TRACE_RECORD_FLAG == 1) 
               wttr.insert((tcb->CURRENTTASK - tsk.MinTaskId), TASK_MASK_FINACK2);   
	        tcb->RCVNXT++;
			if (TRACE_RECORD_FLAG) 
              storeTraceDword(0x09000004, TCBRecordNumber, 41); //finack in closing state   
		    //io.AOAPrintText("BB", Line2+44);			
		    tcb->Rfina=timerEth;
		    tcb->Rfinaa=io.AOAgetTimer();
	        retcode =  SendMisc(tcb->IP, tcb->PORT, TACK, tcb->destmac, FINACKTYPE, currenttask);  
	        if (TRACE_RECORD_FLAG) 
              storeTraceDword(0xA0000012, TCBRecordNumber, 59); //ack in closing  
		    tcb->state = CLOSEWAIT; 
		    if(tcb->suspendFlag == 1)
		    {
		       tcb->Sent_Flag = 1;
               if (tcb->resumeFlag == 1) 
                   return DONOTDISCARD; 
               tcb->resumeFlag = 1;
		    }
		    return 0;
		}//io.AOAprintCharacter('z', Line20+100);
        else if((tcp->Flags & TRST) == TRST)
	       {
	         if (TRACE_RECORD_FLAG) 
               storeTraceDword(0xC0000004, TCBRecordNumber, 73); //client reset  
             NoOfResets++; 
		     if(tcb->taskExists == 1)
		       {
		         tcb->resetFlag=1;
		       }
		     else
               {
                  if (tcb->taskExists == 0)   //RKK & BHARAT
		          DeleteTCB(TCBRecordNumber); 
               }
		     return 0;	
	       }
		else if(mod32cmp(io.AOAgetTimer(), tcb->LST) > TIMER_PERIOD*1191 )
		{
		   //if(tcb->suspendFlag == 1)
		   if(tcb->taskExists == 1)
		   {
		      tcb->resetFlag=1;
//		   //	    io.AOAPrintText("KK", Line20+80);
		   }
		  else
		     {
		     DeleteTCB(TCBRecordNumber); 
		     }
	           return 0;	
		}
		else
		{
                 return 0;
		}
	        return 0;
	   }

/*	   if(tcb->state == LASTACK)
	   {
		//io.AOAprintCharacter('B', Line20+108);
		if(tcp->acknumber == tcb->SNDNXT)
		{
			//io.AOAprintCharacter('C', Line20+112);
			DeleteTCB(TCBRecordNumber);
			tcb->state = CLOSED;
		}
	        return 0;	
	   }
*/
	} // end of ACK

	// 5. Check the FIN Field
	if((tcp->Flags & TFIN) == TFIN)
	{
	   //io.AOAprintCharacter('D', Line20+116);
	   if(tcb->state == ESTAB)
	   {
		//io.AOAprintCharacter('E', Line20+120);
                if(tcb->suspendFlag==1)        //let the task get out of delay
                {
                     if (tcb->resumeFlag == 1) 
                        return DONOTDISCARD; 
		             tcb->resumeFlag=1;
                }
	  	retcode =  SendMisc(tcb->IP, tcb->PORT, TACK, tcb->destmac, FINACKTYPE, currenttask);
	    if (TRACE_RECORD_FLAG) 
          storeTraceDword(0xA0000013, TCBRecordNumber, 60); //ack 
		tcb->state = CLOSEWAIT;
		return retcode;
	   }

	   if(tcb->state == FINWAIT1)
	   {
		//io.AOAprintCharacter('F', Line20+124);
        if(tcb->suspendFlag==1)        //let the task get out of delay
        {
             if (tcb->resumeFlag == 1) 
                 return DONOTDISCARD; 
		     tcb->resumeFlag=1;
        }
	  	retcode =  SendMisc(tcb->IP, tcb->PORT, TACK, tcb->destmac, FINACKTYPE, currenttask);
	    if (TRACE_RECORD_FLAG) 
          storeTraceDword(0xA0000014, TCBRecordNumber, 61); //ack 

		if(retcode!=0)
		   return retcode;

		tcb->state = CLOSING;

		//if(tcb->suspendFlag == 1)
		if(tcb->taskExists == 1)
		{
		    tcb->resetFlag=1;
//		    		    io.AOAPrintText("LL", Line19+100);
		}
		else
		    DeleteTCB(TCBRecordNumber); 

		return 0;
	   }

	   if(tcb->state == FINWAIT2)
	   {
		//io.AOAprintCharacter('G', Line20+128);
        if(tcb->suspendFlag==1)        //let the task get out of delay
        {
           if (tcb->resumeFlag == 1) 
              return DONOTDISCARD; 
		   tcb->resumeFlag=1;
        }
	  	retcode =  SendMisc(tcb->IP, tcb->PORT, TACK, tcb->destmac, FINACKTYPE, currenttask);
	    if (TRACE_RECORD_FLAG) 
          storeTraceDword(0xA0000015, TCBRecordNumber, 62); //ack 
			    io.AOAPrintText("DD", Line2+52);			
		tcb->state = TIMEWAIT; 
  	        //tcb->LST = io.AOAgetTimer(); 
		if(tcb->suspendFlag == 1)
		{
            if (tcb->resumeFlag == 1) 
              return DONOTDISCARD; 
		    tcb->resumeFlag=1;
//		    		    io.AOAPrintText("MM", Line19+100);
		}
		else
		    DeleteTCB(TCBRecordNumber); 
	
		return retcode;
	   }
        } // end of if FIN

/*	
	//5. Process the Incomming segment text
	if((tcb->state == ESTAB) || (tcb->state == FINWAIT1) || (tcb->state == FINWAIT2))
	{
		//io.AOAprintCharacter('H', Line20+132);
		if( tcp->acknumber > tcb->SNDUNA )
		   tcb->SNDUNA = tcp->acknumber;		
	        
		tcb->SRTT = CalcRTT(tcb->LST,tcb->SRTT);
		tcb->DIFF = CalcDiff(tcb->LST,tcb->SRTT,tcb->DIFF);
		tcb->SRTT = tcb->SRTT + 2*(tcb->DIFF);
	

		int len = size - (tcp->Dataoffset*4);					
		// payload
		//  if the packet size is greater than 60 bytes, it is perhaps GET command 
		if(len !=0)
		{
			    //io.AOAprintCharacter('I', Line20+136);
	 		    tcb->RCVNXT = tcb->RCVNXT + len;
			    tcb->RCVWND = tcb->RCVWND - len;
			    retcode = h.insert(&(TCPPack[(tcp->Dataoffset*4)]), len,TCBRecordNumber,
						tcb->IP, tcb->PORT);
			    tempretcode = retcode;
		
			    // if insert fails
			    if(retcode != 0)
			    {
				//io.AOAprintCharacter('J', Line20+140);
	  	 		retcode =  SendMisc(HostIP, SourceIP, SrcPortNum, &TCPPack[0],TRST,tcb->RCVWND,
					tcb->SNDNXT,tcb->RCVNXT, options, 0, data, 0, tcb->destmac, currenttask);
				DeleteTCB(TCBRecordNumber);

				return tempretcode; 
			    }
			    //sdp scheduler 
			    tsk.insertHttpTask();
			    io.AOAMaskRunRegister(HTTP_PID, 1);			    
		}
		return 0;
	} // end of if
*/
	
    } // end of else
    return 0;	
}


//**************************************************************************************************
// This Function assembles the TCP Packet in the Form of TCP Header Structure
// It takes pointer to the buffer, which the Structure pointer will point to 
// and the TCP Packet buffer

void TCPObj::FormatHeader(char * Header, char * TCPPack)
{
	Header[0] = TCPPack[1];
	Header[1] = TCPPack[0];
	Header[2] = TCPPack[3];
	Header[3] = TCPPack[2];

	Header[4] = TCPPack[7];		
	Header[5] = TCPPack[6];
	Header[6] = TCPPack[5];
	Header[7] = TCPPack[4];

	Header[8] = TCPPack[11];		
	Header[9] = TCPPack[10];
	Header[10] = TCPPack[9];
	Header[11] = TCPPack[8];

	Header[12] = TCPPack[12];
	Header[12] = Header[12] >> 4;
	Header[13] = TCPPack[13];

	Header[14] = TCPPack[15];
	Header[15] = TCPPack[14];

	Header[16] = TCPPack[17];
	Header[17] = TCPPack[16];
	
	Header[18] = TCPPack[19];
	Header[19] = TCPPack[18];
	
	int dataoffset;
	dataoffset = (int)&TCPPack[Header[12]*4];
	char *temp = (char*)&dataoffset;

	
	long Options = (long)&TCPPack[20];
	char *temp1 = (char*)&Options;

	Header[20] = temp[0];
	Header[21] = temp[1];
	Header[22] = temp[2];
	Header[23] = temp[3];

	Header[24] = temp1[0];
	Header[25] = temp1[1];
	Header[26] = temp1[2];
	Header[27] = temp1[3];
}

//*****************************************************************************************************************
//************************************************************************************************************
// Calculate the TCP header checksum
unsigned short TCPObj::TCPChecksum(char *tdatagram, long TSLength,char *sourceIP, char*targetIP,unsigned int protocol)
{
 
	//Compute the Checksum
    	 unsigned short padd=0;
  	 unsigned int   word16=0;
	 unsigned long sum=0;	
	 unsigned int temp1=0;
	 unsigned int temp2=0;
	 unsigned short checksum=0;
	 tdatagram[16]=0x00;
	 tdatagram[17]=0x00;
	 
	// Find out if the length of data is even or odd number. If odd,
	// add a padding byte = 0 at the end of packet
	// here 'len' is the TCP packet len TCP(header + data)
	
	if (TSLength&1==1)
	{
	    	padd=1;
		tdatagram[TSLength]=0x00;
	} //end of IF
	
	// make 16 bit words out of every two adjacent 8 bit words and 
	// calculate the sum of all 16 bit words
	
	//TCP data 
	for (int i=0;i<TSLength+padd;i=i+2)
	{
		temp1 = tdatagram[i]; 
		temp2 = tdatagram[i+1];		
		word16 =((temp1<<8)&0xFF00)+(temp2&0xFF);
		sum += word16 & 0xffff;
	} //end of for
	
	// add  the TCP pseudo header which contains:
	// the IP source and destinationn addresses,
	for (i=0;i<4;i=i+2)
	{
	 	temp1 = sourceIP[i];
		temp2 = sourceIP[i+1];		
		word16 =((temp1<<8)&0xFF00)+(temp2&0xFF);
		sum += word16 & 0xffff;
	} //end of for
	
	for (i=0;i<4;i=i+2)
	{
		temp1 = targetIP[i];
		temp2 = targetIP[i+1];		
		word16 =((temp1<<8)&0xFF00)+(temp2&0xFF);
		sum += word16 & 0xffff;		
	} //end of for

	word16 =((protocol)&0x00FF);
	sum += word16 & 0xffff;

	word16 =((TSLength)&0xFFFF);
	sum += word16 & 0xffff;
		
	// keep only the last 16 bits of the 32 bit calculated sum and add the carries
    	while (sum>>16)
		sum = (sum & 0xFFFF)+(sum >> 16);
		
	// Take the one's complement of sum
	sum = ~sum;

        checksum = (unsigned short) sum;

	return checksum; 
 } 
// End of TCPChecksum

//***********************************************************************************************************
// Search for a record in TCB
// This function takes an source ip address an source port and checks if there is already a TCB
// in the TCB table for that connection if so it returns the TCB Value or else it returns -1 
// if it did not find any match in TCB then it will return -1 
//***********************************************************************************************************
int TCPObj::SearchTCB(char IPAdd[4], char SrcPortNum[2])
{	
   TCBRecord *TCBPointer;
   TCBPointer = (TCBRecord*)TCBBase;
   long hashval;
   long next;
   
   hashval = t.hashfun(IPAdd, SrcPortNum); //get an hash value < 1000
   next = t.getIndex(hashval);             //get the contents of hash table, starting TCB entry 
   
   while(next !=-1)
   {       
   if(TCBPointer[next].Avail == 1 && 
      TCBPointer[next].IP[0] == IPAdd[0] && TCBPointer[next].IP[1] == IPAdd[1] &&
      TCBPointer[next].IP[2] == IPAdd[2] && TCBPointer[next].IP[3] == IPAdd[3] && 
      TCBPointer[next].PORT[0] == SrcPortNum[0] && TCBPointer[next].PORT[1] == SrcPortNum[1]) 
     {
         //it found the match in TCB records for a given IP and Port number 
	 return next;  //it returns TCBRecordNumber 
     }
     //-------------------------------------
     //Temporary solution must find out the problem 
     // circular links should never happen  
     if(next == TCBPointer[next].next)
     {
	 TCBPointer[next].next = -1;
//	 io.AOAPrintText("TCPObj:SearchTCB In if(next == TCBPointer[next].next)", Line22);
     }
     //-------------------------------------
     next = TCBPointer[next].next;
   }
   return -1;
    
}
//**********************************************************************************************
// general utility function for implementing TCP 
// This converts a char[] seqnum to unsigned long 
unsigned long TCPObj::charToseqnum(char *TCPPack)
{
	char  seqnum[4];
	seqnum[0] = TCPPack[3];
	seqnum[1] = TCPPack[2];
	seqnum[2] = TCPPack[1];
	seqnum[3] = TCPPack[0];	
	return (*(unsigned long*)seqnum);
}
// This function converts char[] window to unsigned short window 
unsigned short TCPObj::charToWindow(char *TCPPack)
{
	char seqnum[2];
	seqnum[0] = TCPPack[1];
	seqnum[1] = TCPPack[0];	
	
	return (*(unsigned short*)seqnum);
}

//*****************************************************************************************************************
//This function is used to send ListenHandler packets 
//   connection was not established, failure in the protocol 
//*****************************************************************************************************************
int TCPObj::SendMisc(char *destIP, char * destPort, unsigned long tempseq, char Flags, char *TargetMAC, int sendtype, 
		     int currenttask)
{
   //RKK Buffer Definitions 
	EtherObj EO; 
	char *send_buffer; 
	long *p1; 
	long c3; 
	char c4; 
	long x = 0; 
	int i; 
	int retcode = 0;
        char data[10];
   	int TCPPack_size=0;
  	long InPtr=0;
	
	int TCBRecordNum = SearchTCB(destIP, destPort);
	TCBRecord *tcb;

   	p1 = &c3; //dummy address 
   	send_buffer = &c4;  //dummy address 

	if (EO.TDLFull() == 1)
	  {
	   return -30;   //DPD is full 
	  }
	
        //RKK Buffer Initialization 
        x = EO.TDLPointer + EO.SendInPtr * 16 - ADDR_OFFSET;

   	//check if the TDL pointer in the range 
    	if ((x+ADDR_OFFSET) > (EO.TDLPointer + (NO_OF_TDL-1) * 16))
     	{
      		return -22; 
     	}    	

	p1 = (long*)x; 
	
   	//now check if this data buffer is within the limits of TDL data buffers 
    	if ((*p1) >= (EO.TDLDataPointer + NO_OF_TDL * T_BUFFER_SIZE))
     	{
      		return -23; 
     	} 
	
	send_buffer = (char*)*p1; //address from DPD pointing to next available slot 

	InPtr = EO.SendInPtr;

        EO.SendInPtr++;    //this is like an InPtr which inserts packets 

         if (EO.SendInPtr == NO_OF_TDL) 
           {
	    EO.SendInPtr = 0; //circular list 
           }
	 
	//add TCP header in front of the packet 
	send_buffer = send_buffer + 14 + 20 - ADDR_OFFSET;//add header before data  
        if (TCBRecordNum ==-1)
	      TCPPack_size = FormatTCPPacket(send_buffer, destIP, destPort, Flags, 0, tempseq, 0, data, 0, 0, currenttask); 		else
	{			
	      tcb = (TCBRecord*)(TCBBase + ( TCBRecordNum * sizeof(TCBRecord) ));
	      TCPPack_size = FormatTCPPacket(send_buffer, tcb->IP, tcb->PORT, Flags, tcb->RCVWND,
		                             tcb->SNDNXT,tcb->RCVNXT, 0, 0, 0, currenttask);  
	     // tcb->SNDNXT++;
	     // tcb->RCVNXT++;
	}
	// this is to format IP packet 
	// ip and EO object instantiations can be avoided by placing the code in this object
	send_buffer = send_buffer - 20; //20 byte IP header  

	//pass by reference do not work in DOSC 
	// you have to use return value to get the value from call 
	// double indexing need to be done to pass by reference 
	retcode = ip.FormatIPPacket(send_buffer, TCPPack_size, destIP, TargetMAC, TCP_Protocol, currenttask);
	if(retcode != 0)
	   return retcode;
	
	send_buffer = send_buffer - 14; //14  byte ethernet header  

	SendCountTotal++; 

	/*
	//retcode = io.AOAgetSharedMem(0xb4); 
	//retcode++; 
	//io.AOAsetSharedMem(0xb4,retcode); 

        //update counters 
	if (sendtype == SYNACKTYPE) 
	{
	//retcode = io.AOAgetSharedMem(0xb8); 
	//retcode++; 
	//io.AOAsetSharedMem(0xb8,retcode); 
	}
	else if (sendtype == GETACKTYPE)
	  {
	   //retcode = io.AOAgetSharedMem(0xbc); 
	   //retcode++; 
	   //io.AOAsetSharedMem(0xbc,retcode); 
	  }
	else if (sendtype == FINACKTYPE)
	  {
	   retcode = io.AOAgetSharedMem(0xc8); 
	   retcode++; 
	   io.AOAsetSharedMem(0xc8,retcode); 
	  }
	else if (sendtype == RESETTYPE)
	  {
	   retcode = io.AOAgetSharedMem(0xcc); 
	   retcode++; 
	   io.AOAsetSharedMem(0xcc,retcode); 
	  }
         */

	retcode = EO.FormatEthPacket(send_buffer, TCPPack_size+20, IP_TYPE , TargetMAC, 
				 InPtr, sendtype, currenttask);
	if(retcode != 0)
	  {
	   //assume that there is no error in ethernet format 
	   // we did not put all the above counters to decrement in this condition!
	   //retcode = io.AOAgetSharedMem(0xb4); 
	   //retcode--; 
           //io.AOAsetSharedMem(0xb4, retcode); 
	   return retcode;
	  }


        return 0; 
}
//*****************************************************************************************************************
//This function is used to send a dummy ack for fin-ack from a client, when there is no more connection 
// at the server 
// packet is the TCP packet arrived from the client (which is a FIN-ACK)
// RKK new code change
//*****************************************************************************************************************
int TCPObj::SendMisc(char *packet, char *destIP, char *TargetMAC, int currenttask) 
{
	EtherObj EO; 
	char *send_buffer; 
	long *p1; 
	long c3; 
	char c4; 
	long x = 0; 
	int i=0; 
	int retcode = 0;
    char data[10];
   	int TCPPack_size=0;
  	long InPtr=0;
	int checksum = 0;
	
   	p1 = &c3; //dummy address 
   	send_buffer = &c4;  //dummy address 

	if (EO.TDLFull() == 1)
	  {
	   return -30;   //DPD is full 
	  }
	
    //RKK Buffer Initialization 
    x = EO.TDLPointer + EO.SendInPtr * 16 - ADDR_OFFSET;

   	//check if the TDL pointer in the range 
    if ((x+ADDR_OFFSET) > (EO.TDLPointer + (NO_OF_TDL-1) * 16))
     	{
      		return -22; 
     	}    	

	p1 = (long*)x; 
	
   	//now check if this data buffer is within the limits of TDL data buffers 
    if ((*p1) >= (EO.TDLDataPointer + NO_OF_TDL * T_BUFFER_SIZE))
     	{
      		return -23; 
     	} 
	
	send_buffer = (char*)*p1; //address from DPD pointing to next available slot 

	InPtr = EO.SendInPtr;

    EO.SendInPtr++;    //this is like an InPtr which inserts packets 

    if (EO.SendInPtr == NO_OF_TDL) 
        {
	       EO.SendInPtr = 0; //circular list 
        }
	 
	//add TCP header in front of the packet 
	send_buffer = send_buffer + 14 + 20 - ADDR_OFFSET;//add header before data  

    send_buffer[0] = packet[2]; //src port 
    send_buffer[1] = packet[3]; 
    send_buffer[2] = packet[0]; //dest port 
    send_buffer[3] = packet[1]; 
    for (i=0; i<4; i++) 
      send_buffer[4+i] = packet[8+i]; //sequence number 
    for (i=0; i<4; i++) 
      c3 = (long)packet[4]; //client sequence number 
    c3 = c3 + 1;            //increment 
    (*(send_buffer+8)) = c3;  //ack number to send 
    send_buffer[12] = packet[12];  //length 
    send_buffer[13] = TACK;        //ACK   
    send_buffer[14] = 0x06;        //window size 1600 0x0640   
    send_buffer[15] = 0x40;        //window size 1600 0x0640   
    send_buffer[18] = 0x00; 
    send_buffer[19] = 0x00; 

	checksum = TCPChecksum(send_buffer, 20, HostIP, destIP, TCP_Protocol);	
	send_buffer[16] = (char)((checksum>>8) & 0xFF);
	send_buffer[17] = (char)(checksum & 0xFF);	

	// this is to format IP packet 
	// ip and EO object instantiations can be avoided by placing the code in this object
	send_buffer = send_buffer - 20; //20 byte IP header  

	//pass by reference do not work in DOSC 
	// you have to use return value to get the value from call 
	// double indexing need to be done to pass by reference 
	retcode = ip.FormatIPPacket(send_buffer, TCPPack_size, destIP, TargetMAC, TCP_Protocol, currenttask);
	if(retcode != 0)
	   return retcode;
	
	send_buffer = send_buffer - 14; //14  byte ethernet header  

	SendCountTotal++; 

	retcode = EO.FormatEthPacket(send_buffer, TCPPack_size+20, IP_TYPE, TargetMAC, 
				 InPtr, 0, currenttask);
	if(retcode != 0)
	  {
	   //assume that there is no error in ethernet format 
	   // we did not put all the above counters to decrement in this condition!
	   //retcode = io.AOAgetSharedMem(0xb4); 
	   //retcode--; 
           //io.AOAsetSharedMem(0xb4, retcode); 
	   return retcode;
	  }


        return 0; 
}
//*****************************************************************************************************************
//This function is used to send listener and other handler packets
// used for sending ACK 
//*****************************************************************************************************************
int TCPObj::SendMisc(char *destIP, char * destPort, char Flags, char *TargetMAC, int sendtype, int currenttask)
{
   //RKK Buffer Definitions 
	EtherObj EO; 
	char *send_buffer; 
	long *p1; 
	long c3; 
	char c4; 
	long x = 0; 
	int i; 
	int retcode = 0;
        char data[10];
   	int TCPPack_size=0;
  	long InPtr=0;
	
	int TCBRecordNum = SearchTCB(destIP, destPort);
	TCBRecord *tcb;

   	p1 = &c3; //dummy address 
   	send_buffer = &c4;  //dummy address 

	if (EO.TDLFull() == 1)
	  {
	   return -30;   //DPD is full 
	  }
	
        //RKK Buffer Initialization 
        x = EO.TDLPointer + EO.SendInPtr * 16 - ADDR_OFFSET;

   	//check if the TDL pointer in the range 
    	if ((x+ADDR_OFFSET) > (EO.TDLPointer + (NO_OF_TDL-1) * 16))
     	{
      		return -22; 
     	}    	

	p1 = (long*)x; 
	
   	//now check if this data buffer is within the limits of TDL data buffers 
    	if ((*p1) >= (EO.TDLDataPointer + NO_OF_TDL * T_BUFFER_SIZE))
     	{
      		return -23; 
     	} 
	
	send_buffer = (char*)*p1; //address from DPD pointing to next available slot 

	InPtr = EO.SendInPtr;

        EO.SendInPtr++;    //this is like an InPtr which inserts packets 

         if (EO.SendInPtr == NO_OF_TDL) 
           {
	    EO.SendInPtr = 0; //circular list 
           }
	 
	//add TCP header in front of the packet 
	send_buffer = send_buffer + 14 + 20 - ADDR_OFFSET;//add header before data  
        if (TCBRecordNum ==-1)
	      TCPPack_size = FormatTCPPacket(send_buffer, destIP, destPort, Flags, 0, 0, 0, data, 0, 0, currenttask);
        else 

	     {			
	      tcb = (TCBRecord*)(TCBBase + ( TCBRecordNum * sizeof(TCBRecord) ));
	      TCPPack_size = FormatTCPPacket(send_buffer, tcb->IP, tcb->PORT, Flags, tcb->RCVWND,
		                             tcb->SNDNXT, tcb->RCVNXT, 0, 0, 0, currenttask);  
	     // tcb->SNDNXT++;
	     // tcb->RCVNXT++;
	     }
	// this is to format IP packet 
	// ip and EO object instantiations can be avoided by placing the code in this object
	send_buffer = send_buffer - 20; //20 byte IP header  

	//pass by reference do not work in DOSC 
	// you have to use return value to get the value from call 
	// double indexing need to be done to pass by reference 
	retcode = ip.FormatIPPacket(send_buffer, TCPPack_size, destIP, TargetMAC, TCP_Protocol, currenttask);
	if(retcode != 0)
	   return retcode;
	
	send_buffer = send_buffer - 14; //14  byte ethernet header  

	SendCountTotal++; 
	/*
	retcode = io.AOAgetSharedMem(0xb4); 
	retcode++; 
	io.AOAsetSharedMem(0xb4,retcode); 
	*/

	/*
        //update counters 
	if (sendtype == SYNACKTYPE) 
	{
	retcode = io.AOAgetSharedMem(0xb8); 
	retcode++; 
	io.AOAsetSharedMem(0xb8,retcode); 
	}
	else if (sendtype == GETACKTYPE)
	  {
	   retcode = io.AOAgetSharedMem(0xbc); 
	   retcode++; 
	   io.AOAsetSharedMem(0xbc,retcode); 
	  }
	else if (sendtype == FINACKTYPE)
	  {
	   retcode = io.AOAgetSharedMem(0xc8); 
	   retcode++; 
	   io.AOAsetSharedMem(0xc8,retcode); 
	  }
	else if (sendtype == RESETTYPE)
	  {
	   retcode = io.AOAgetSharedMem(0xcc); 
	   retcode++; 
	   io.AOAsetSharedMem(0xcc,retcode); 
	  }
	  */

	retcode = EO.FormatEthPacket(send_buffer, TCPPack_size+20, IP_TYPE , TargetMAC, 
				 InPtr, sendtype, currenttask);
	if(retcode != 0)
	  {
	   //assume that there is no error in ethernet format 
	   // we did not put all the above counters to decrement in this condition!
	   /*
	   retcode = io.AOAgetSharedMem(0xb4); 
	   retcode--; 
           io.AOAsetSharedMem(0xb4, retcode); 
	   */
	   return retcode;
	  }


        return 0; 
}
//*****************************************************************************************************************
//This function is used to send listener and other handler packets
// used for sending ACK for Keep Alive Request ONLY 
//*****************************************************************************************************************
int TCPObj::SendMiscKA(char *destIP, char * destPort, char Flags, char *TargetMAC, 
          int sendtype, unsigned long acknumber, int currenttask)
{
   //RKK Buffer Definitions 
	EtherObj EO; 
	char *send_buffer; 
	long *p1; 
	long c3; 
	char c4; 
	long x = 0; 
	int i; 
	int retcode = 0;
        char data[10];
   	int TCPPack_size=0;
  	long InPtr=0;
	
	int TCBRecordNum = SearchTCB(destIP, destPort);
	TCBRecord *tcb;

   	p1 = &c3; //dummy address 
   	send_buffer = &c4;  //dummy address 

	if (EO.TDLFull() == 1)
	  {
	   return -30;   //DPD is full 
	  }
	
        //RKK Buffer Initialization 
        x = EO.TDLPointer + EO.SendInPtr * 16 - ADDR_OFFSET;

   	//check if the TDL pointer in the range 
    	if ((x+ADDR_OFFSET) > (EO.TDLPointer + (NO_OF_TDL-1) * 16))
     	{
      		return -22; 
     	}    	

	p1 = (long*)x; 
	
   	//now check if this data buffer is within the limits of TDL data buffers 
    	if ((*p1) >= (EO.TDLDataPointer + NO_OF_TDL * T_BUFFER_SIZE))
     	{
      		return -23; 
     	} 
	
	send_buffer = (char*)*p1; //address from DPD pointing to next available slot 

	InPtr = EO.SendInPtr;

        EO.SendInPtr++;    //this is like an InPtr which inserts packets 

         if (EO.SendInPtr == NO_OF_TDL) 
           {
	    EO.SendInPtr = 0; //circular list 
           }
	 
	//add TCP header in front of the packet 
	send_buffer = send_buffer + 14 + 20 - ADDR_OFFSET;//add header before data  
        if (TCBRecordNum ==-1)
	      TCPPack_size = FormatTCPPacket(send_buffer, destIP, destPort, Flags, 0, 0, 0, data, 0, 0, currenttask);
        else 

	     {			
	      tcb = (TCBRecord*)(TCBBase + ( TCBRecordNum * sizeof(TCBRecord) ));
          //send keep alive ack number to respond back  
          //SNDNXT is sequence number  
          //RCVNXT is ack number 
          //They are reversed in sending ack to the receiver 
	      TCPPack_size = FormatTCPPacket(send_buffer, tcb->IP, tcb->PORT, Flags, tcb->RCVWND,
		                             acknumber, tcb->RCVNXT, 0, 0, 0, currenttask);  
	     // tcb->SNDNXT++;
	     // tcb->RCVNXT++;
	     }
	// this is to format IP packet 
	// ip and EO object instantiations can be avoided by placing the code in this object
	send_buffer = send_buffer - 20; //20 byte IP header  

	//pass by reference do not work in DOSC 
	// you have to use return value to get the value from call 
	// double indexing need to be done to pass by reference 
	retcode = ip.FormatIPPacket(send_buffer, TCPPack_size, destIP, TargetMAC, TCP_Protocol, currenttask);
	if(retcode != 0)
	   return retcode;
	
	send_buffer = send_buffer - 14; //14  byte ethernet header  

	SendCountTotal++; 
	/*
	retcode = io.AOAgetSharedMem(0xb4); 
	retcode++; 
	io.AOAsetSharedMem(0xb4,retcode); 
	*/

	/*
        //update counters 
	if (sendtype == SYNACKTYPE) 
	{
	retcode = io.AOAgetSharedMem(0xb8); 
	retcode++; 
	io.AOAsetSharedMem(0xb8,retcode); 
	}
	else if (sendtype == GETACKTYPE)
	  {
	   retcode = io.AOAgetSharedMem(0xbc); 
	   retcode++; 
	   io.AOAsetSharedMem(0xbc,retcode); 
	  }
	else if (sendtype == FINACKTYPE)
	  {
	   retcode = io.AOAgetSharedMem(0xc8); 
	   retcode++; 
	   io.AOAsetSharedMem(0xc8,retcode); 
	  }
	else if (sendtype == RESETTYPE)
	  {
	   retcode = io.AOAgetSharedMem(0xcc); 
	   retcode++; 
	   io.AOAsetSharedMem(0xcc,retcode); 
	  }
	  */

	retcode = EO.FormatEthPacket(send_buffer, TCPPack_size+20, IP_TYPE , TargetMAC, 
				 InPtr, sendtype, currenttask);
	if(retcode != 0)
	  {
	   //assume that there is no error in ethernet format 
	   // we did not put all the above counters to decrement in this condition!
	   /*
	   retcode = io.AOAgetSharedMem(0xb4); 
	   retcode--; 
           io.AOAsetSharedMem(0xb4, retcode); 
	   */
	   return retcode;
	  }


        return 0; 
}
//*****************************************************************************************************************
//This function Format's a TCP Packet
//*****************************************************************************************************************
int TCPObj::FormatTCPPacket(char *TCPPack, char *destIP, char * destPort, char Flags, unsigned short Window,
		unsigned long seqnum, unsigned long acknum, char *data, int datasize, int rIndex, int currenttask)
{
	int i=0, k=0;
	int retcode = 0; 
	int checksum = 0;
	char *options;
	char c;
	options = &c;
	
	int numbytesoptions=0;
	char HeaderLength = 5 + (int)(numbytesoptions/4);
	int StartofData	= 0;


  	TCPPack[0] = HTTPPort_H;
	TCPPack[1] = HTTPPort_L;	
	TCPPack[2] = destPort[0];
	TCPPack[3] = destPort[1];		

	// Assign the sequence numbers	
	TCPPack[4] = (seqnum>>24)&0x000000FF;
	TCPPack[5] = (seqnum>>16)&0x000000FF; 
	TCPPack[6] = (seqnum>>8)&0x000000FF; 
	TCPPack[7] = (seqnum)&0x000000FF; 

	// Assign the acknowledgement numbers
	TCPPack[8] = (acknum>>24)&0x000000FF;
	TCPPack[9] = (acknum>>16)&0x000000FF; 
	TCPPack[10] = (acknum>>8)&0x000000FF; 
	TCPPack[11] = (acknum)&0x000000FF; 
	
	// Calculate the Header Length including Options and assign it to the Header
	// 5 - Minimun TCP Header
	if((numbytesoptions%4) > 0)
	    HeaderLength = HeaderLength +1;
	TCPPack[12] = ((HeaderLength<<4) & 0xF0);

	// Assign the Flags and window to the packet
	TCPPack[13] = (Flags & 0x3F);	
	TCPPack[14] = (Window>>8)&0x00FF;
	TCPPack[15] = Window & 0x00FF;

	// Initialize the urgent pointer to zero not supported
	TCPPack[18] = 0x00;
	TCPPack[19] = 0x00;	
	
	//numbytesoptions is 0 
	for(i=0 ; i < numbytesoptions ; i++)
	{
		TCPPack[20+i] = options[i];
	}
	
	for(k=0; k < (4-(numbytesoptions%4)) ; k++)
	{
		TCPPack[20+i] = 0x00;
		i++;
	}	

	StartofData = HeaderLength * 4;  //5*4 = 20 bytes 

	//RKK only one copy of data from HTTP memory to ETHERNET linked list memory 
	for(i=0; i < datasize; i++)
	{
		TCPPack[StartofData+i] = data[i+rIndex];
	}

	checksum = TCPChecksum(TCPPack, (StartofData+datasize), HostIP, destIP, TCP_Protocol);	

	TCPPack[16] = (char)((checksum>>8) & 0xFF);
	TCPPack[17] = (char)(checksum & 0xFF);	
	
	return StartofData+datasize;	
}
//***********************************************************************************
// send n
//***********************************************************************************
int TCPObj::SendN(int TCBRecordNum, int currenttask)
{
   AOATask task;
   apptask tsk; 
   EtherObj EO; 

   long c3; 
   char c4; 
   char *send_buffer; 
   long *p1; 
   p1 = &c3; //dummy address 
   send_buffer = &c4;  //dummy address 

   long x = 0; 
   int i=0,j=0; 
   int retcode = 0;
   
   char SrcPortNum[2];
   int TCPPack_size=0;
   char options[] = "";
   long InPtr=0;
   char *sendbuffer;
   char c1;
   sendbuffer = &c1;
   
   TCBRecord *tcb;			
   tcb=(TCBRecord*)(TCBBase + (TCBRecordNum * sizeof(TCBRecord) ));
   tcb->Rdata=io.AOAgetTimer();
   if (PRINT) 
     io.AOAprintHex(tcb->state, Line11+100); 


   if( tcb->Avail == 0)
   {
      return -37; 
   }

   if(TCBRecordNum != tcb->CURRENTTCBRNO) //verify that tcb record number passed to httptask is same as the
  	 			    // one stored in tcb table by receive task
   {
       retcode =  SendMisc(tcb->IP, tcb->PORT, TRST, tcb->destmac, RESETTYPE, tcb->CURRENTTASK);
	   if (TRACE_RECORD_FLAG) 
         storeTraceDword(0xE0000006, TCBRecordNum, 74); //server reset  
       if(retcode!=0)
           return retcode;
//	io.AOAPrintText("dd", Line19);
 
       DeleteTCB(TCBRecordNum);		 
//       io.AOAprintHex(io.AOAgetTimer(), Line4+120);
       return -36;
   } 

   //****************************
   if(tcb->resourceType == HEADER)
   {			   
	sendbuffer = tcb->RESPONSEHEADER;
   }
   else if(tcb->resourceType == DATA)
   {			   
	sendbuffer = tcb->RESOURCE;
   }

   if(tcb->leftOverBytes == 0)
   {			   
	tcb->count1 = tcb->noOfPackets;
   }
   else
   {			   
	tcb->count1 = tcb->noOfPackets + 1;
   }

   tcb->temprIndex = tcb->rIndex;
   tcb->tempSeqNum = tcb->startSeq;
   tcb->tempflags = TACK;
   //****************************

   if(tcb->state == ESTAB || tcb->state == FINWAIT1)
   {
        // Assign the source Port number to HTTP Port 
	SrcPortNum[0]= HTTPPort_H;
	SrcPortNum[1]= HTTPPort_L;
   if (EO.TDLFull() == 1) 
     {
	     io.AOAPrintText("TDL is FULL SendN", Line22+20); 
         return -29; //DPD is full 
     }
   for(i=0; i<tcb->noOfPackets; i++)	
   {
//	if ((tcb->sendtype == DATTYPE) && /*(tcb->getflag!=1 || tcb->getackflag!=1 ||*/ tcb->hdrflag!=1)
	if ((tcb->resourceType == DATA) && /*(tcb->getflag!=1 || tcb->getackflag!=1 ||*/ tcb->hdrflag!=1)
	{
//				io.AOAPrintText("Error in get ack", Line22);
//				io.AOAprintHex(tcb->getflag, Line22+40); 
//				io.AOAprintHex(tcb->getackflag, Line22+60); 
//				io.AOAprintHex(tcb->hdrflag, Line22+80); 
//				io.AOAprintHex((long)tcb->PORT[0], Line22+100);
//				io.AOAprintHex((long)tcb->PORT[1], Line22+120);
//				io.AOAprintHex(io.AOAgetTimer(), Line22+140);
				
//    io.AOAprintHex(io.AOAgetFlags(), Line10+140); 
				_asm{int 0f5h};
				
	}
        if(tcb->lastSet == 1 && tcb->leftOverBytes == 0 && i == tcb->noOfPackets-1)
	   tcb->tempflags = tcb->tempflags | TFIN;
	
	if((i+1)*TCPSegSize > 5000)
	   tcb->tempflags = tcb->tempflags | TPUSH;
	
	x = EO.TDLPointer + EO.SendInPtr * 16 - ADDR_OFFSET; 	

        //check if the TDL pointer in the range 
        if ((x+ADDR_OFFSET) > (EO.TDLPointer + (NO_OF_TDL-1) * 16))
        {
          return -12; 
        }    	

	p1 = (long*)x; 

       //now check if this data buffer is within the limits of TDL data buffers 
       if ((*p1) >= (EO.TDLDataPointer + NO_OF_TDL * T_BUFFER_SIZE))
       {
         return -13; 
       }   
	
	send_buffer = (char*)*p1; //address from DPD pointing to next available slot 

	InPtr = EO.SendInPtr;

    EO.SendInPtr++;    //this is like an InPtr which inserts packets 

    if (EO.SendInPtr == NO_OF_TDL) 
      {
	    EO.SendInPtr = 0; //circular list 
      }
	 
	//add TCP header in front of the packet 
	send_buffer = send_buffer + 14 + 20 - ADDR_OFFSET;//add header before data  

	TCPPack_size = FormatTCPPacket(send_buffer, tcb->IP, tcb->PORT, tcb->tempflags,tcb->RCVWND,
			tcb->tempSeqNum,tcb->RCVNXT, sendbuffer, TCPSegSize, tcb->temprIndex, currenttask); 
	// this is to format IP packet 
	// ip and EO object instantiations can be avoided by placing the code in this object

	send_buffer = send_buffer - 20; //20 byte IP header  

	//pass by reference do not work in DOSC 
	// you have to use return value to get the value from call 
	// double indexing need to be done to pass by reference 
	retcode = ip.FormatIPPacket(send_buffer, TCPPack_size, tcb->IP, tcb->destmac, TCP_Protocol, currenttask);
	if(retcode != 0)
	   return retcode;
	
	send_buffer = send_buffer - 14; //14  byte ethernet header  

	// last packet inserted in ethernet buffer
	if(tcb->leftOverBytes == 0 && i == tcb->noOfPackets-1)
	{
	 retcode = EO.FormatEthPacketN(send_buffer, TCPPack_size+20, IP_TYPE , tcb->destmac,InPtr, 
				tcb->count1, tcb->sendtype, currenttask);
	 if(retcode != 0)
	   return retcode;
        }
	else
	{

	SendCountTotal++;
	/*
	retcode = io.AOAgetSharedMem(0xb4); 
	retcode++; 
	io.AOAsetSharedMem(0xb4, retcode); 
	*/

	//update header and data counters
	if (tcb->sendtype == HDRTYPE) 
	{
	/*
	retcode = io.AOAgetSharedMem(0xc0); 
	retcode++; 
	io.AOAsetSharedMem(0xc0,retcode); 
	*/
	}
	else if (tcb->sendtype == DATTYPE)
	  {
	   /*
	   retcode = io.AOAgetSharedMem(0xc4); 
	   retcode++; 
	   io.AOAsetSharedMem(0xc4,retcode); 
	   */
	  }
	 retcode = EO.FormatEthPacketN(send_buffer, TCPPack_size+20, IP_TYPE , tcb->destmac, 
					InPtr, 0, tcb->sendtype, currenttask);
	 if(retcode != 0)
	  {
	   /*
	   retcode = io.AOAgetSharedMem(0xb4); 
	   retcode--; 
	   io.AOAsetSharedMem(0xb4, retcode); 
	   */
	   return retcode;				
	  }

	}
	tcb->temprIndex = tcb->temprIndex + TCPSegSize; 
	tcb->tempSeqNum = tcb->tempSeqNum + TCPSegSize;
	

    } // end of for loop

   if(tcb->leftOverBytes != 0)
   {
        if(tcb->lastSet == 1)
	   tcb->tempflags = tcb->tempflags | TFIN;
	
	if(i*TCPSegSize + tcb->leftOverBytes > 5000)
	   tcb->tempflags = tcb->tempflags | TPUSH;
			   
	x = EO.TDLPointer + EO.SendInPtr * 16 - ADDR_OFFSET; 	

        //check if the TDL pointer in the range 
        if ((x+ADDR_OFFSET) > (EO.TDLPointer + (NO_OF_TDL-1) * 16))
        {
          return -12; 
        }    	

	p1 = (long*)x; 

       //now check if this data buffer is within the limits of TDL data buffers 
       if ((*p1) >= (EO.TDLDataPointer + NO_OF_TDL * T_BUFFER_SIZE))
       {
         return -13; 
       }     
	
	send_buffer = (char*)*p1; //address from DPD pointing to next available slot 

	InPtr = EO.SendInPtr;

        EO.SendInPtr++;    //this is like an InPtr which inserts packets 

         if (EO.SendInPtr == NO_OF_TDL) 
           {
	         EO.SendInPtr = 0; //circular list 
           }
	 
	//add TCP header in front of the packet 
	send_buffer = send_buffer + 14 + 20 - ADDR_OFFSET;//add header before data  

	TCPPack_size = FormatTCPPacket(send_buffer, tcb->IP, tcb->PORT, tcb->tempflags, tcb->RCVWND,
			tcb->tempSeqNum, tcb->RCVNXT, sendbuffer, tcb->leftOverBytes, tcb->temprIndex, currenttask); 
	// this is to format IP packet 
	// ip and EO object instantiations can be avoided by placing the code in this object

	send_buffer = send_buffer - 20; //20 byte IP header  

	//pass by reference do not work in DOSC 
	// you have to use return value to get the value from call 
	// double indexing need to be done to pass by reference 
	retcode = ip.FormatIPPacket(send_buffer, TCPPack_size, tcb->IP, tcb->destmac, TCP_Protocol, currenttask);
	if(retcode != 0)
	   return retcode;
	
	send_buffer = send_buffer - 14; //14  byte ethernet header  

	SendCountTotal++; 
	/*
	retcode = io.AOAgetSharedMem(0xb4); 
	retcode++; 
	io.AOAsetSharedMem(0xb4,retcode); 
	*/

	/*
	//update header and data counters
	if (tcb->sendtype == HDRTYPE) 
	{
	retcode = io.AOAgetSharedMem(0xc0); 
	retcode++; 
	io.AOAsetSharedMem(0xc0,retcode); 
	}
	else if (tcb->sendtype == DATTYPE)
	  {
	   retcode = io.AOAgetSharedMem(0xc4); 
	   retcode++; 
	   io.AOAsetSharedMem(0xc4,retcode); 
	  }
	*/

	retcode = EO.FormatEthPacketN(send_buffer, TCPPack_size+20, IP_TYPE , tcb->destmac, 
					InPtr, tcb->count1, tcb->sendtype, currenttask);
	if(retcode != 0)
	   {
	   /*
	   retcode = io.AOAgetSharedMem(0xb4); 
	   retcode--; 
	   io.AOAsetSharedMem(0xb4,retcode); 
	   */
	   return retcode;
	   }

   }
   
	return 0; 
   } // end of if

return 0; 
}

//*************************************************************************************************
// get the RTT value
// Just returns the RTT value of the connection instance 
int TCPObj::getRtt(int TCBRecordNum)
{
 TCBRecord *tcb; 
 tcb = (TCBRecord*)(TCBBase + ( TCBRecordNum * sizeof(TCBRecord) )); 
 return tcb->SRTT; 
}

//*************************************************************************************************
// This function is used to do a modulo 32 comparision for the sesuence numbers 
// This function assumes that the seq1 is greater than seq 2 if not it will return 0xFFFFFFFF
// Else if seq1 is greater than seq 2 it will return the difference between seq1 ans seq2
// The logic is self explanatory 
// In a very fast connection there is a possibility the sequence numbers might wrap around causing an error in the program. Not in the current environment  
//  If the packets acknowledgement number is not in the acceptable range in the other handler it is advisable to verify the return values from this function and ckeck the sequence numbers u r self 
//  This error is a very rare case 
//********************************************************************************************
unsigned long TCPObj::mod32cmp(unsigned long seq1, unsigned long seq2)
{
	unsigned long MAXVal = 0xFFFFFFFF;
	unsigned long MIDVal = (0xFFFFFFFF / 2);
    	unsigned long LeastVal = 0x00;
	
	// if both the sesuence numbers are equal return 0 
    	if(seq1 == seq2)
		return 0x00;
    	
	if(seq1 <= MIDVal && seq1 >= LeastVal && seq2 <=MIDVal && seq2 >= LeastVal)
	{
		if( seq1 < seq2)
		{
		return 0xFFFFFFFF;
		}
		return (seq1-seq2);
    	}
	else if(seq1 > MIDVal && seq1 <= MAXVal && seq2 > MIDVal && seq2 <= MAXVal)
    	{
		if( seq1 < seq2)
		{
			return 0xFFFFFFFF;
		}

     	}
	else if(seq2 >= (MIDVal/2) && seq2 <=MIDVal && seq1 >=MIDVal && seq1<=(MIDVal*3/2))
    	{
		return (seq1 - seq2);
    	}
	else if(seq1 >= LeastVal && seq1 <=(MIDVal/2) && seq2 <=MAXVal && seq2 >=(MIDVal*3/2))
    	{
		return ((MAXVal-seq2) + (seq1-LeastVal));
    	}
    	return 0xFFFFFFFF;
}

//***************************************************************
//get sliding window size
//  API 
//***************************************************************
long TCPObj::getSlidingWindow(int TCBRecordNum)
{
    TCBRecord *tcb;
    tcb=(TCBRecord*)(TCBBase + (TCBRecordNum * sizeof(TCBRecord) ));
    return tcb->SNDWND;
}

//***********************************************************************************************
// This function calculates the RTT for the transmission 
// This is based on formula 0.3* RTTPrev + 0.7 * RTTCurrent
// Where RTT is the time from LST to Time the ACK is obtained  	
//***********************************************************************************************
unsigned long TCPObj::CalcRTT(unsigned long LST, unsigned long SRTT)
{
    unsigned long RTT;
    //io.AOAprintHex(LST, Line24+60);
    //io.AOAprintHex(SRTT, Line24+80);
    //RTT = ((long)(SRTT*(3/10))) + ((long)( (7/10) * (io.AOAgetTimer() - LST ))) +1;
    RTT = (long)(io.AOAgetTimer() - LST);
    return RTT;
}

//***********************************************************************************************
// calc difference
//***********************************************************************************************
unsigned long TCPObj::CalcDiff(unsigned long LST, unsigned long SRTT, unsigned long DIFF)
{
    unsigned long Diff;
    unsigned long a;
    //io.AOAprintHex(LST, Line24+60);
    //io.AOAprintHex(SRTT, Line24+80);
    //RTT = ((long)(SRTT*(3/10))) + ((long)( (7/10) * (io.AOAgetTimer() - LST ))) +1;
    a = (long)(io.AOAgetTimer() - LST - SRTT);
    if (a>=0)
       Diff = DIFF + a;
    else
       Diff = DIFF - a;
    return Diff;
}

//****************************************************************************************************
// This code is rewritten again by Dr. Karne and He Long on May 23, 2006 using 
//   state transition diagrams 
// This function is used to send the TCP Data for a http response 
// It gets the TCPRecordNo to identify the connection
// The HTTP Response Header
// The HTTP Header Size
// The HTTP Resource Address
// The HTTP Resource/File Size 
// Then Sends the TCP Data 
// In HTTP Headers the content size must be specified for this function to be successful 
// return code
// ----  tcpSend is used to send an entire file 
// ----  SendN procedure will handle sending n packets
// ----  n will depend upon the window size in TCP 
// ---- in order to send a file, we need to send header, and the file 
// ---- sendHeader1 is sent first  
// ---- sendPayload3 and sendPayload4 are used next 
// ---- if sliding window is big enough to send packets, we only use sendPayload4 
// ---- if sliding window is not big enough then, sendPayload3 is used to send packets except the last window 
// ----  and the last window packets are sent by sendPayload4 
// All records are stored in tcb that are related a connection 
//****************************************************************************************************
int TCPObj::tcpSendN(int TCBRecordNum, int currenttask)
{
	AOATask task;    //task management object, for each task  
	apptask tsk;     //application task object, all tasks are here 
    TCBRecord *tcb;  // TCBRecord pointer 

	int tcbrno = 0;
	tcbrno = TCBRecordNum;  //save it in the local variable 
	int retcode = 0;
	long k = 0;				// Count Variable  
	int tempvalue=0;
	int q=0;
	long s1=0;
	int r=0;
    char data[10];
    char options[10];	
    //----------------------------------------------------------------------
	//compute the tcb record address using the TCBRecordNum passed to the call 
    tcb=(TCBRecord*)(TCBBase + (tcbrno * sizeof(TCBRecord) ));	
	tcb->http_state = HTTP_START; 
    if( tcb->Avail == 0)
    {
        io.AOAprintHex(TCBRecordNum, Line20+20); 
        io.AOAprintHex(tcb->PORT[0], Line20+40); 
        io.AOAprintHex(tcb->PORT[1], Line20+60); 
        io.AOAprintHex((long)tcb, Line20+80); 
        io.AOAPrintText("tcpSendN Avail = 0", Line20+100); 
        io.Application_Status = 2; 
        io.AOAExit(); 
	   return -38;            //not a valid entry in TCB  
    }
	
    if(tcbrno != tcb->CURRENTTCBRNO) 
	//verify that tcb record number passed to httptask is same as the
        // one stored in tcb table by receive task
	{
	    return -33;
	}
    //----------------------------------------------------------------------
	tcb->Sent_Flag = 0;
	tcb->sendf = 1;
	tcb->LASTACK = 0;
	tcb->k = 0;
	tcb->k1 = 0;
	tcb->p = 0;
    //----------------------------------------------------------------------
	//  SAVING PARAMETERS IN TCB
	tcb->LOOPCOUNT = io.AOAgetTimer();  //beginning timer 
	tcb->SEQ = tcb->SNDNXT;             //next packet to be sent  
	tcb->STARTRESSEQ = tcb->SEQ + tcb->HSIZE; //starting sequence number for this run  
	tcb->EXPHEADACK = tcb->SEQ+ tcb->HSIZE;// Assign the expected ack number for header 
	tcb->EXPRESACK = tcb->STARTRESSEQ + tcb->FILESIZE;// assign the expected ack for resource
        
    //----------------------------------------------------------------------
	//main loop 
    //----------------------------------------------------------------------
    tcb->http_complete = 0; //reset the complete flag 	
	tcb->http_state = HTTP_SENDP;   //change the state once 
	tcb->first_send = 0;     //reset the first send flag 
	tcb->LOOPCOUNT = io.AOAgetTimer(); 
	while (tcb->http_complete == 0)
	   {
	    //after every suspension, it will return the begining of this loop 

	   switch (tcb->http_state) 
	      {
		case HTTP_SENDP: 
            if (PRINT)
             io.AOAprintHex(tcb->http_state, Line11+100); 
		   //----------------------------------------------------------------------
	           // First send the HTTP data 
                   //Case1
	           //  |<-------------------sliding window-------------------->|              
	           //  |<---- hSize---------->|<------fileSize---------->|
	           //  |----------------------|--------------------------|
	           //startHeaderSeq     startResourceSeq           expectedResourceAck  
	           //in the case we shall send the header and the whole payload
                   //----------------------------------------------------------------------			

		   if(tcb->SNDWND >= (tcb->HSIZE + tcb->FILESIZE) && tcb->first_send == 0)
	             {
		       tcb->http_case = 0x01; 
		       tcb->first_send = 1; //set the flag so that it necer comes here again  
	           retcode = sendHeader1(tcbrno, tcb->SEQ,tcb->EXPHEADACK, tcb->CURRENTTASK);
	           if(retcode != 0)
		         {
			      tcb->http_state = HTTP_EXIT; 
			      DeleteTCB(tcbrno); 
		          return retcode;
			     }
	           retcode = sendPayload4 (tcbrno, tcb->STARTRESSEQ, tcb->CURRENTTASK);
    	       if(retcode != 0)
			     {
			      tcb->http_state = HTTP_EXIT; 
			      DeleteTCB(tcbrno); 
		          return retcode;
			     }
		       } //end of if first send 
                   //Case2
	           //  |<--sliding window-->|              
	           //  |<------hSize--------->|<------fileSize---------->|
	           //  |----------------------|--------------------------|
	           //startHeaderSeq     startResourceSeq           expectedResourceAck 
  	           //in that case we send part of header until sliding window size is full
		   else if(tcb->SNDWND < tcb->HSIZE && tcb->first_send == 0)
	            {
		      tcb->http_case = 0x02; 
		      tcb->first_send = 1; 
              if(tcb->SNDWND ==0) //RKK-AW window is zero do not send ACK 
	                {
                        /*
	                 retcode=SendMisc(tcb->IP, tcb->PORT, TACK, tcb->destmac, SW0TYPE, tcb->CURRENTTASK);
	                 if (TRACE_RECORD_FLAG) 
                       storeTraceDword(0xA0000018, TCBRecordNum, 63); //ack 
	                 if(retcode !=0)
			          {
			             tcb->http_state = HTTP_EXIT; 
			             DeleteTCB(tcbrno); 
	                     return retcode; 
			          }
                      */
	                }
	              else
	                 {
	                  tcb->p = tcb->SEQ + tcb->SNDWND;
	                  retcode = sendHeader1(tcbrno, tcb->SEQ, tcb->p, tcb->CURRENTTASK); 
	                  if(retcode != 0)
			    {
			       tcb->http_state = HTTP_EXIT; 
			       DeleteTCB(tcbrno); 
	              	       return retcode;
			    }
	    
	                 }
	               }
		   //Case3
	           //  |<--------sliding window------------>|              
	           //  |<--------hSize------->|<-------fileSize--------->|
	           //  |----------------------|--------------------------|
	           //startHeaderSeq     startResourceSeq           expectedResourceAck  
	           //in the case we send the header and part of payload until the sliding window is full
		   else if(tcb->SNDWND > tcb->HSIZE && tcb->SNDWND < (tcb->HSIZE + tcb->FILESIZE) && tcb->first_send == 0)
	            {
		     tcb->http_case = 0x03; 
		     tcb->first_send = 1; 
	             retcode = sendHeader1(tcbrno, tcb->SEQ, tcb->EXPHEADACK, tcb->CURRENTTASK);
	             if(retcode != 0)
			{
			    tcb->http_state = HTTP_EXIT; 
			    DeleteTCB(tcbrno); 
	                    return retcode;
		        }
	            tcb->p = tcb->SEQ + tcb->SNDWND; 
	            retcode = sendPayload3(tcbrno, tcb->STARTRESSEQ, tcb->CURRENTTASK);
	            if(retcode != 0)
			{
			    tcb->http_state = HTTP_EXIT; 
			    DeleteTCB(tcbrno); 
		            return retcode;	    
		        }
	            }
		   //ack is within the header Case 4
		   //                 |<--sliding window-->|      
	           //  |<----------hSize----------------------->|<--------fileSize-------->|
	           //  |--------------|-------------------------|--------------------------|
	           //startHeaderSeq  ack           startResourceSeq           expectedResourceAck 
		       else if( (tcb->k + tcb->SNDWND)< tcb->HSIZE && tcb->CMPVAL == 0xFFFFFFFF && 
							tcb->first_send == 1)
			{
		          tcb->http_case = 0x04; 
	                  if(tcb->SNDWND ==0)
	                  {
	                    retcode=SendMisc(tcb->IP, tcb->PORT, TACK, tcb->destmac, SW0TYPE, tcb->CURRENTTASK);
	                    if (TRACE_RECORD_FLAG) 
                          storeTraceDword(0xA0000017, TCBRecordNum, 64); //ack 
			            if(retcode !=0)
			              {
			               tcb->http_state = HTTP_EXIT; 
			               DeleteTCB(tcbrno); 
			               return retcode; 
			             }
	                  }
			  else
			  {
			    tcb->k1 = tcb->SEQ + tcb->k;
			    tcb->p = tcb->k1 + tcb->SNDWND;
	            retcode = sendHeader1(tcbrno, tcb->k1, tcb->p, tcb->CURRENTTASK); 
			    if(retcode != 0)
			      {
			        tcb->http_state = HTTP_EXIT; 
			        DeleteTCB(tcbrno); 
				    return retcode;
			      }
			  }
			}
           //ack is within the header Case 5
		   //                 |<----------------sliding window----------------------->|    
	           //  |<-----hSize------------------------>|<------fileSize---------->|
	           //  |--------------|---------------------|--------------------------|
	           //startHeaderSeq  ack           startResourceSeq           expectedResourceAck 
		       else if( (tcb->k + tcb->SNDWND) >= (tcb->HSIZE + tcb->FILESIZE) && 
					tcb->CMPVAL == 0xFFFFFFFF && tcb->first_send == 1 )
			{
		            tcb->http_case = 0x05; 
			    tcb->k1 = tcb->SEQ + tcb->k;
			    retcode = sendHeader1(tcbrno, tcb->k1, tcb->EXPHEADACK, tcb->CURRENTTASK);  
			    if(retcode != 0)
			      {
			        tcb->http_state = HTTP_EXIT; 
			        DeleteTCB(tcbrno); 
				return retcode;
			      }
                            retcode = sendPayload4 (tcbrno, tcb->STARTRESSEQ, tcb->CURRENTTASK);
			    if(retcode != 0)
			      {
			        tcb->http_state = HTTP_EXIT; 
			        DeleteTCB(tcbrno); 
				return retcode;
			      }
			}
                  //ack is within the header Case 6
		  //                 |<---------sliding window-------->|    
	          //  |<-----hSize------------------------>|<------fileSize---------->|
	          //  |--------------|---------------------|--------------------------|
	          //startHeaderSeq  ack           startResourceSeq           expectedResourceAck 
		    else if( (tcb->k + tcb->SNDWND) < (tcb->HSIZE + tcb->FILESIZE) && 
			(tcb->k + tcb->SNDWND) > tcb->HSIZE && tcb->CMPVAL == 0xFFFFFFFF && tcb->first_send == 1 )
			{
		           tcb->http_case = 0x06; 
			   tcb->k1 = tcb->SEQ + tcb->k;
			   retcode = sendHeader1(tcbrno, tcb->k1, tcb->EXPHEADACK, tcb->CURRENTTASK);  
			   if(retcode != 0)
			     {
			       tcb->http_state = HTTP_EXIT; 
			       DeleteTCB(tcbrno); 
		   	       return retcode;
			     }
			   tcb->p = tcb->k1 + tcb->SNDWND;
			   retcode = sendPayload3(tcbrno, tcb->STARTRESSEQ, tcb->CURRENTTASK); 
			   if(retcode != 0)
			     {
			       tcb->http_state = HTTP_EXIT; 
			       DeleteTCB(tcbrno); 
		   	       return retcode;
			     }
			}
		   //ack is within the payload Case 7
		   //                                   |<---------sliding window-------->|    
	           //  |<-----hSize------->|<------fileSize----------->|
	           //  |-------------------|------------|--------------|
	           //startHeaderSeq  startResourceSeq  ack         expectedResourceAck 	
		   else if ( ( tcb->k + tcb->SNDWND) >= tcb->FILESIZE && tcb->CMPVAL1 == 0xFFFFFFFF &&
			tcb->CMPVAL != 0xFFFFFFFF && tcb->first_send == 1)
		    {
		        tcb->http_case = 0x07; 
			tcb->k1 = tcb->STARTRESSEQ + tcb->k;
		        retcode = sendPayload4 (tcbrno, tcb->k1, tcb->CURRENTTASK);
			if(retcode != 0)
			  {
			       tcb->http_state = HTTP_EXIT; 
			       DeleteTCB(tcbrno); 
			       return retcode;
			  }
		    }

		   //ack is within the payload Case 8
		   //                                   |<-----sliding window---->|    
	           //  |<-----hSize------->|<-----------------fileSize------------------->|
	           //  |-------------------|------------|---------------------------------|
	           //sutartHeaderSeq  startResourceSeq  ack         expectedResourceAck  
		    else if ( ( tcb->k + tcb->SNDWND) < tcb->FILESIZE && tcb->CMPVAL1 == 0xFFFFFFFF &&
			tcb->CMPVAL != 0xFFFFFFFF && tcb->first_send == 1)
		    { 
		      tcb->http_case = 0x08; 
	              if(tcb->SNDWND ==0)
	              {
	                retcode=SendMisc(tcb->IP, tcb->PORT, TACK, tcb->destmac, SW0TYPE, tcb->CURRENTTASK);	
	                if (TRACE_RECORD_FLAG) 
                        storeTraceDword(0xA0000018, TCBRecordNum, 65); //ack 
		        if(retcode !=0 )
			  {
			    tcb->http_state = HTTP_EXIT; 
			    DeleteTCB(tcbrno); 
		            return retcode; 
			  }
	              }
		      else
		      {
			tcb->k1 = tcb->STARTRESSEQ + tcb->k;
			tcb->p = tcb->k1 + tcb->SNDWND;
		        retcode = sendPayload3(tcbrno, tcb->k1, tcb->CURRENTTASK);
		        if(retcode !=0 )
			  {
			    tcb->http_state = HTTP_EXIT; 
			    DeleteTCB(tcbrno); 
		            return retcode; 
			  }
		      }
		    }

		    break; 
		case HTTP_RETRP: 
		    NoOfRetransmissions++;
            if (NoOfRetransmissions > 20)
               return -1;  
		    tcb->SRTT=175;
                //check if tcp connection is over one minute  
		        if(mod32cmp(io.AOAgetTimer(), tcb->LOOPCOUNT) > TIMER_PERIOD*1091 )
		          {
		            retcode =  SendMisc(tcb->IP, tcb->PORT, TRST, tcb->destmac, RESETTYPE, currenttask);
	                if (TRACE_RECORD_FLAG) 
                      storeTraceDword(0xE0000007, TCBRecordNum, 74); //server reset  
		            tcb->http_state = HTTP_EXIT; 
			    DeleteTCB(tcbrno); 
			    return retcode; 
		          }

		   //ack is within the header Case 1
		   //                 |<--sliding window-->|      
	           //  |<----------hSize----------------------->|<--------fileSize-------->|
	           //  |--------------|-------------------------|--------------------------|
	           //startHeaderSeq  ack           startResourceSeq           expectedResourceAck 

			if( (tcb->k + tcb->SNDWND)< tcb->HSIZE && tcb->CMPVAL == 0xFFFFFFFF)
			{
		          tcb->http_case = 0x11; 
	                  if(tcb->SNDWND ==0)
	                  {
	                    retcode=SendMisc(tcb->IP, tcb->PORT, TACK, tcb->destmac, SW0TYPE, tcb->CURRENTTASK);
	                    if (TRACE_RECORD_FLAG) 
                          storeTraceDword(0xA0000019, TCBRecordNum, 66); //ack 
			    if(retcode !=0)
			       {
			         tcb->http_state = HTTP_EXIT; 
			         DeleteTCB(tcbrno); 
			         return retcode; 
			       }
	                  }
			  else
			  {
			    tcb->k1 = tcb->SEQ + tcb->k;
			    tcb->p = tcb->k1 + tcb->SNDWND;
	                    retcode = sendHeader1(tcbrno, tcb->k1, tcb->p, tcb->CURRENTTASK); 
			    if(retcode != 0)
			      {
			        tcb->http_state = HTTP_EXIT; 
			        DeleteTCB(tcbrno); 
				return retcode;
			      }
			  }
			}
                   //ack is within the header Case 2
		   //                 |<----------------sliding window----------------------->|    
	           //  |<-----hSize------------------------>|<------fileSize---------->|
	           //  |--------------|---------------------|--------------------------|
	           //startHeaderSeq  ack           startResourceSeq           expectedResourceAck 
			else if( (tcb->k + tcb->SNDWND) >= (tcb->HSIZE + tcb->FILESIZE) && 
					tcb->CMPVAL == 0xFFFFFFFF)
			{
		            tcb->http_case = 0x12; 
			    tcb->k1 = tcb->SEQ + tcb->k;
			    retcode = sendHeader1(tcbrno, tcb->k1, tcb->EXPHEADACK, tcb->CURRENTTASK);  
			    if(retcode != 0)
			      {
			        tcb->http_state = HTTP_EXIT; 
			        DeleteTCB(tcbrno); 
				return retcode;
			      }
                            retcode = sendPayload4 (tcbrno, tcb->STARTRESSEQ, tcb->CURRENTTASK);
			    if(retcode != 0)
			      {
			        tcb->http_state = HTTP_EXIT; 
			        DeleteTCB(tcbrno); 
				return retcode;
			      }
			}
                  //ack is within the header Case 3
		  //                 |<---------sliding window-------->|    
	          //  |<-----hSize------------------------>|<------fileSize---------->|
	          //  |--------------|---------------------|--------------------------|
	          //startHeaderSeq  ack           startResourceSeq           expectedResourceAck 
			else if( (tcb->k + tcb->SNDWND) < (tcb->HSIZE + tcb->FILESIZE) && 
			(tcb->k + tcb->SNDWND) > tcb->HSIZE && tcb->CMPVAL == 0xFFFFFFFF)
			{
		           tcb->http_case = 0x13; 
			   tcb->k1 = tcb->SEQ + tcb->k;
			   retcode = sendHeader1(tcbrno, tcb->k1, tcb->EXPHEADACK, tcb->CURRENTTASK);  
			   if(retcode != 0)
			     {
			       tcb->http_state = HTTP_EXIT; 
			       DeleteTCB(tcbrno); 
		   	       return retcode;
			     }
			   tcb->p = tcb->k1 + tcb->SNDWND;
			   retcode = sendPayload3(tcbrno, tcb->STARTRESSEQ, tcb->CURRENTTASK); 
			   if(retcode != 0)
			     {
			       tcb->http_state = HTTP_EXIT; 
			       DeleteTCB(tcbrno); 
		   	       return retcode;
			     }
			}
		   //ack is within the payload Case 4
		   //                                   |<---------sliding window-------->|    
	           //  |<-----hSize------->|<------fileSize----------->|
	           //  |-------------------|------------|--------------|
	           //startHeaderSeq  startResourceSeq  ack         expectedResourceAck 	
			else if ( ( tcb->k + tcb->SNDWND) >= tcb->FILESIZE && tcb->CMPVAL1 == 0xFFFFFFFF &&
			tcb->CMPVAL != 0xFFFFFFFF)
		    {
		        tcb->http_case = 0x14; 
			tcb->k1 = tcb->STARTRESSEQ + tcb->k;
		        retcode = sendPayload4 (tcbrno, tcb->k1, tcb->CURRENTTASK);
			if(retcode != 0)
			  {
			       tcb->http_state = HTTP_EXIT; 
			       DeleteTCB(tcbrno); 
			       return retcode;
			  }
		    }

		   //ack is within the payload Case 5
		   //                                   |<-----sliding window---->|    
	           //  |<-----hSize------->|<-----------------fileSize------------------->|
	           //  |-------------------|------------|---------------------------------|
	           //startHeaderSeq  startResourceSeq  ack         expectedResourceAck  
		   else if ( ( tcb->k + tcb->SNDWND) < tcb->FILESIZE && tcb->CMPVAL1 == 0xFFFFFFFF &&
			tcb->CMPVAL != 0xFFFFFFFF)
		    { 
		      tcb->http_case = 0x15; 
	              if(tcb->SNDWND ==0)
	              {
	                retcode=SendMisc(tcb->IP, tcb->PORT, TACK, tcb->destmac, SW0TYPE, tcb->CURRENTTASK);	
	                if (TRACE_RECORD_FLAG) 
                          storeTraceDword(0xA0000020, TCBRecordNum, 67); //ack 
		        if(retcode !=0 )
			  {
			    tcb->http_state = HTTP_EXIT; 
			    DeleteTCB(tcbrno); 
		            return retcode; 
			  }
	              }
		      else
		      {
			tcb->k1 = tcb->STARTRESSEQ + tcb->k;
			tcb->p = tcb->k1 + tcb->SNDWND;
		        retcode = sendPayload3(tcbrno, tcb->k1, tcb->CURRENTTASK);
		        if(retcode !=0 )
			  {
			    tcb->http_state = HTTP_EXIT; 
			    DeleteTCB(tcbrno); 
		            return retcode; 
			  }
		      }
		    }
		    else
		    {
		    }
		    break; 
	      }

	   tcb->suspendFlag = 1;   //set the suspend flag 
	   tcb->http_state = HTTP_SUSPEND;  //change the state  
	   tcb->resumeFlag = 0;   //reset the resume flag 
       if (PRINT)
          io.AOAprintHex(tcb->state, Line11+100); 
  
	   //task.AOAsuspendHTask(10, tcb->state, tsk.Current_Tcbrno, currenttask);
       tsk.TotalSuspendCount++; 
	   //task.AOAsuspendHTask(tcb->SRTT, tcb->state, tsk.Current_Tcbrno, currenttask);
	   task.AOAsuspendHTask(100000, tcb->state, tsk.Current_Tcbrno, currenttask);

	   //restore TCBRecordNum
	   tcbrno = tsk.Current_Tcbrno; 
           tcb=(TCBRecord*)(TCBBase + (tcbrno * sizeof(TCBRecord) ));	
	   if (tcb->http_state != HTTP_SUSPEND) 
	    {
	       return -46; //something wrong during suspension 
	    }

          if(tcbrno != tcb->CURRENTTCBRNO) 
	      {
	        return -41;  //invalid TCB in the record 
	      }
           if(tcb->suspendFlag==1 && tcb->resetFlag==1)
	      {
		//send reset to client  
		// resetFlag is on, go to exit 
        retcode =  SendMisc(tcb->IP, tcb->PORT, TRST, tcb->destmac, RESETTYPE, tcb->CURRENTTASK);
	    if (TRACE_RECORD_FLAG) 
           storeTraceDword(0xE0000008, TCBRecordNum, 74); //server reset  
		tcb->http_state = HTTP_EXIT; 
	        DeleteTCB(tcbrno); 
	        return -39; 
	      }
	   tcb->suspendFlag = 0;   //reset the flag  
	   //restore some parameters 
       tcb->LASTACK = tcb->SNDUNA; 
	   tcb->STARTRESSEQ = tcb->SEQ + tcb->HSIZE;  	
	   tcb->EXPHEADACK = tcb->SEQ+ tcb->HSIZE; // Assign the expected ack number for header 
	   tcb->EXPRESACK = tcb->STARTRESSEQ + tcb->FILESIZE;// assign the expected ack for resource
	   tcb->CMPVAL = mod32cmp(tcb->LASTACK, tcb->EXPHEADACK);         //comapre last ack with header
           tcb->CMPVAL1 = mod32cmp(tcb->LASTACK, (tcb->EXPRESACK+1) );  //compare last ack with last bit of file
	   tcb->sendf=1;

	   if(tcb->CMPVAL1 != 0xFFFFFFFF) // we get the last bit acknowledgement, transmit is finished
	         tcb->Sent_Flag =1;

	   if(tcb->CMPVAL == 0xFFFFFFFF)  //starting point for next transmission/retransmission 
             {
	       tcb->k = (((unsigned long)tcb->HSIZE) - mod32cmp(tcb->EXPHEADACK, tcb->LASTACK) );
	       if(tcb->k < 0 )
		 {
		    tcb->k = 0; 
  		 }
	     }
	   else if (tcb->CMPVAL != 0xFFFFFFFF && tcb->CMPVAL1 == 0xFFFFFFFF) 
	     //starting point for next transmission/retran
	     {
	      tcb->k = (((unsigned long)tcb->FILESIZE) - mod32cmp(tcb->EXPRESACK, tcb->LASTACK));
	     }

           if (tcb->SNDNXT == tcb->SNDUNA && tcb->Sent_Flag == 1) 
	     {
		if( tcb->state == CLOSING )
		{
		   tcb->Sent_Flag = 0;
		   tcb->http_state = HTTP_RETRP;
		}
        else
		{
        tcb->http_state = HTTP_EXIT; 
		tcb->http_complete = 1; //exit the while loop 
	       // DeleteTCB(tcbrno); 
		}
	     }
	   else if (tcb->SNDNXT == tcb->SNDUNA && tcb->Sent_Flag == 0) 
	     {
                tcb->http_state = HTTP_SENDP; 
		//go to send packets state 
	     }
	   else if (tcb->SNDNXT > tcb->SNDUNA) 
             {
	       tcb->http_state = HTTP_RETRP; 
	       //go to retransmission state  
	     }
	   else 
	     {
		//send reset to client  
                retcode =  SendMisc(tcb->IP, tcb->PORT, TRST, tcb->destmac, RESETTYPE, tcb->CURRENTTASK);
                tcb->http_state = HTTP_EXIT; 
	            if (TRACE_RECORD_FLAG) 
                    storeTraceDword(0xE0000009, TCBRecordNum, 74); //server reset  
		tcb->http_complete = 1; //exit the while loop 
	        //DeleteTCB(tcbrno); 
	     }
	        
       //after coming back from suspension, continue the while loop
	   } //end of main while loop for http 

    DeleteTCB(tcbrno); 

	return 0;
} //end of main program 

//*************************************
// This function prints IP statistics 
void TCPObj::printStatistics(int Line)
{
}

//****************************************************************************************************
// send header 1
//****************************************************************************************************
int TCPObj::sendHeader1(int TCBRecordNum, unsigned long seqnum, unsigned long k3, int currenttask)
{
    apptask tsk; 
    //DPD Send Type 
    //  0 - no type 
    //  1 - ACK for SYN  
    //  2 - ACK for GET 
    //  3 - Send Header after GET  
    //  4 - Send Data
    //  5 - ACK for FIN
    //  6 - ARP sends 
    //
    int retcode = 0;
    
    TCBRecord *tcb;
    tcb=(TCBRecord*)(TCBBase + (TCBRecordNum * sizeof(TCBRecord)));   

    tcb->resourceType = HEADER;
    tcb->rIndex = seqnum - tcb->SEQ;
    tcb->startSeq = seqnum;
    tcb->noOfPackets = 0;
    tcb->leftOverBytes = k3 - tcb->SEQ;
    tcb->lastSet = 0;
    tcb->sendtype = HDRTYPE;

    retcode = SendN(TCBRecordNum, currenttask); 
    if(retcode != 0)		
      {
	   return retcode;
      } 

    if (TRACE_RECORD_FLAG == 1) 
       wttr.insert((currenttask - tsk.MinTaskId), TASK_MASK_HEADER); 
    
    tcb->hdrflag=1;    

    if(tcb->sendf == 1)
    {
       tcb->SNDNXT = k3 + 1; 
    }

    return 0;
}

//*************************************************************************************************
// send payload 3
//*************************************************************************************************
int TCPObj::sendPayload3 (int TCBRecordNum,  unsigned long seqnum, int currenttask)
{
    int retcode = 0;

    TCBRecord *tcb;
    tcb=(TCBRecord*)(TCBBase + (TCBRecordNum * sizeof(TCBRecord) )); 
  
    tcb->resourceType = DATA;
    tcb->rIndex = seqnum - tcb->STARTRESSEQ;
    tcb->startSeq = seqnum;
    tcb->noOfPackets = (tcb->p - seqnum)/TCPSegSize;
    tcb->leftOverBytes = (tcb->p - seqnum) - (tcb->noOfPackets*TCPSegSize);
    tcb->lastSet = 0;
    tcb->sendtype = DATTYPE;

    retcode = SendN(TCBRecordNum, currenttask); 
  
    if(retcode != 0)
    {
       return retcode;
    } 
    
    if(tcb->sendf == 1)
    {
        tcb->SNDNXT = tcb->p ;
	tcb->sendf = 0; 
    }	    


    return 0;
}

//*************************************************************************************************
//This function manages transfer the payload data 
//The begining point of data is seqnum, until the last bit of data in the payload
//*************************************************************************************************
int TCPObj::sendPayload4 (int TCBRecordNum, unsigned long seqnum, int currenttask)
{
    int retcode = 0;
    apptask tsk; 

    TCBRecord *tcb;
    tcb=(TCBRecord*)(TCBBase + (TCBRecordNum * sizeof(TCBRecord) )); 
    
    tcb->resourceType = DATA;
    tcb->rIndex = seqnum - tcb->STARTRESSEQ;
    tcb->startSeq = seqnum;
    tcb->noOfPackets = (tcb->EXPRESACK - seqnum)/TCPSegSize;
    tcb->leftOverBytes = (tcb->EXPRESACK - seqnum) - (tcb->noOfPackets*TCPSegSize);
    tcb->lastSet = 1;
    tcb->sendtype = DATTYPE;

    retcode = SendN(TCBRecordNum, currenttask); 

    if(retcode != 0)
    {
      return retcode;
    } 
			    
    if(tcb->sendf == 1)
    {
        tcb->SNDNXT = tcb->EXPRESACK + 1; 
	    tcb->sendf = 0; 
    }
    
    if (TRACE_RECORD_FLAG == 1) 
       wttr.insert((currenttask - tsk.MinTaskId), TASK_MASK_PAYLOAD); 
    tcb->state = FINWAIT1;
    if (TRACE_RECORD_FLAG)
      storeTraceDword(tcb->state, TCBRecordNum, 4); //FINWAIT1 

   // tcb->LST=io.AOAgetTimer();

    return 0;
}

//*************************************
// get suspendFlag  
//*************************************
int TCPObj::getSuspendFlag(int tcbrno)
{
   TCBRecord *tcb;
   int flag1; 

   tcb=(TCBRecord*)(TCBBase + (tcbrno * sizeof(TCBRecord) ));
   flag1 = tcb->suspendFlag; 
   return flag1; 
}; 

//*************************************
// get resumeFlag  
//*************************************
int TCPObj::getResumeFlag(int tcbrno)
{
   TCBRecord *tcb;
   int flag1; 

   tcb=(TCBRecord*)(TCBBase + (tcbrno * sizeof(TCBRecord) ));
   flag1 = tcb->resumeFlag; 
   return flag1; 
}; 
//*************************************
// get ressetFlag  
//*************************************
int TCPObj::getResetFlag(int tcbrno)
{
   TCBRecord *tcb;
   int flag1; 

   tcb=(TCBRecord*)(TCBBase + (tcbrno * sizeof(TCBRecord) ));
   flag1 = tcb->resetFlag; 
   return flag1; 
}; 
//*************************************
// reset resumeFlag  
//*************************************
int TCPObj::resetResumeFlag(int tcbrno)
{
   TCBRecord *tcb;
   int flag1; 

   tcb=(TCBRecord*)(TCBBase + (tcbrno * sizeof(TCBRecord) ));
   tcb->resumeFlag = 0; 
   return 0; 
}; 

//*************************************
// set task id  
//*************************************
int TCPObj::setTaskID(int tcbrno, int currenttask)
{
   currentTCB=(TCBRecord*)(TCBBase + (tcbrno * sizeof(TCBRecord) ));
   currentTCB->CURRENTTASK = currenttask; 
   currentTCB->CURRENTTCBRNO = tcbrno; 
   
   return 0; 
}; 

//*************************************
// get task id  
//*************************************
int TCPObj::getTaskID(int tcbrno)
{
   int retcode=0;
   
   currentTCB=(TCBRecord*)(TCBBase + (tcbrno * sizeof(TCBRecord) ));
   retcode = currentTCB->CURRENTTASK; 
   
   return retcode; 
}; 

//*************************************
// get message ptr
//*************************************
char *TCPObj::getMsgPtr(int tcbrno, int *length)
{
   char *p1;
   char c1;
   p1 = &c1;
   
   currentTCB=(TCBRecord*)(TCBBase + (tcbrno * sizeof(TCBRecord) ));
   *length = currentTCB->MSGLEN;
   p1 = currentTCB->MSGPTR; 
   
   return p1; 
}; 

//*************************************
// set file param
//*************************************
int TCPObj::setFileParam(int tcbrno, char *responseHeader, long hSize, unsigned long resourceAddress,
			  long fileSize, int currenttask)
{
   
   currentTCB=(TCBRecord*)(TCBBase + (tcbrno * sizeof(TCBRecord) ));
  
   // check for inserting parameters in the right slot
   if((currenttask == currentTCB->CURRENTTASK) && (tcbrno == currentTCB->CURRENTTCBRNO))
   {			   
	//----------------------------------------------------------------
	//  SAVING PARAMETERS IN TCB
	currentTCB->RESPONSEHEADER = responseHeader;
        currentTCB->HSIZE = hSize;
	currentTCB->RESOURCE = (char*)resourceAddress;
	currentTCB->FILESIZE = fileSize;
	//----------------------------------------------------------------
    }
    else
    {
     io.AOAprintHex(tcbrno, Line18+20); 
     io.AOAprintHex(currenttask, Line18+40); 
     io.AOAprintHex(currentTCB->CURRENTTASK, Line18+60); 
     io.AOAprintHex(currentTCB->CURRENTTCBRNO, Line18+80); 
     io.Application_Status = 2; 
     io.AOAExit(); 
	return -31;
    }
   return 0; 
}; 

//*************************************
// get http count
//*************************************
int TCPObj::getHttpCount()
{
   return HttpCount; 
}; 

//*************************************
// print tcb record
//*************************************
int TCPObj::PrintTCB(int tcbrno, int lineno)
{
   TCBRecord *tcb;			
   tcb=(TCBRecord*)(TCBBase + (tcbrno * sizeof(TCBRecord) ));

   io.AOAprintHex(tcb->CURRENTTCBRNO, lineno);
   io.AOAprintHex(tcb->Avail, lineno+20);
   io.AOAprintHex(tcb->SNDUNA, lineno+40);
   io.AOAprintHex(tcb->SNDNXT, lineno+60);
   io.AOAprintHex(tcb->CURRENTTASK, lineno+80);
   io.AOAprintHex(tcb->state, lineno+100);
   io.AOAprintHex(io.AOAgetTimer(), lineno+120);
   
   return 0; 
}; 

//*************************************
// get tcb avail value
//*************************************
int TCPObj::getAvail(int tcbrno)
{
   TCBRecord *tcb;			
   tcb=(TCBRecord*)(TCBBase + (tcbrno * sizeof(TCBRecord) ));

   return tcb->Avail; 
}; 

//*************************************
void TCPObj::StoreTrace3 (char *ptr, int size)
{
  int i; 
  char *tptr; 
  tptr = (char*)(TRACE3 - ADDR_OFFSET); 
  
  tptr[logcount] = (int)size; 
  tptr[logcount+4] = 0x78; 
  tptr[logcount+5] = 0x56; 
  tptr[logcount+6] = 0x34; 
  tptr[logcount+7] = 0x12; 

  if (logcount < 40000)  //some limit  
  {
  for (i=0; i<size; i++) 
      tptr[i+logcount+8] = ptr[i]; 
  logcount = logcount + size + 32; //next record   
  }
}
//*************************************
// write a TCB trace record into memory  
// it stores at TRACE1 address 
// it will be limited by MAX_TRACE_COUNT 
//*************************************
int TCPObj::storeTraceTCBRecord(int tcbrno)
{
   int noOfBytes = 0; 
   int i = 0; 
   TCBRecord *tcb;			
   char *p1; 
   char *p2; 
   char c1; 
   char c2; 
   p1 = &c1; 
   p2 = &c2; 
   long addr = 0; 

   tcb=(TCBRecord*)(TCBBase + (tcbrno * sizeof(TCBRecord) ));
   noOfBytes = sizeof(TCBRecord); 
   addr = TRACE1 - 0x00110000;  //offset 
   p1 = (char*)addr; 
   p1 = p1 + trace1Count*noOfBytes;   //next trace record 
   p2 = (char*)tcb; 

   if (trace1Count < MAX_TRACE1_COUNT)
    {
      for (i = 0; i < noOfBytes; i++)
        {
  	      *p1 = *p2; 
	      p1++; 
	      p2++; 
        }
      trace1Count++;  
    }
   return 0; 
}; 

//*************************************************
// write a 4 byte record into memory for debugging 
//  writes into TRACE3 address 
//  each SYN request will occupy 512 bytes of memory 
//  base is same as tcbrno 
//  index is 0-127 4 byte values 
//*************************************************
int TCPObj::storeTraceDword(int dataw, int base, int index)

{
   int i = 0; 
   int *p1; 
   int c1; 
   p1 = &c1; 
   long addr = 0; 
   addr = TRACE3 - 0x00110000;  //offset 

   if (dataw == 0x99999999)
   {
        addr = addr + base*512+index*4; 
        p1 = (int*)addr; 
        for (i=0; i<127; i++) 
        {
            *p1 = 0; 
            p1++; 
        } //clear all 128 words when a TCB is deleated 
        *p1 = 0x99999999; //to show it is deleted   
     return 0; 
   }
   if (trace3Count < MAX_TRACE3_COUNT)
	{
        addr = addr + base*512+index*4; 
        p1 = (int*)addr; 
        *p1 = dataw; 
	}
   trace3Count++; 
   return 0; 
}; 
