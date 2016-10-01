//******************************************************
// This is FTPObj.cpp file 
//******************************************************
#include"FTPObj.h"
#include"../Interfaces/AOAProtected.h"
#include"../webserver/aoatask.h"

// The Static Variable definition starts here
unsigned long FTPObj::ResourceIndexBase=0;		// Base address of the HTTP Resource Index
	
unsigned long FTPObj::ResourceBufferBase=0;		// Base address of the HTTP Resource Buffer

unsigned int FTPObj::ResourceIndexCount=0;		// Max Index count of the HTTP Resource
	
unsigned long FTPObj::ResourceBufferSize=0;		// Maximum Size of the Buffer allocated fo the HTTP Resource
	
unsigned long FTPObj::ResourceIndexSize=0;		// Maximum Index size of the of the Resource

unsigned long FTPObj::ResourcePtr=0; 			// Points to the current buffer address to store the next file;
	
unsigned long FTPObj::ResourceIndexPtr=0;		// Points to the current index to store the next file

unsigned int FTPObj::nextseq=0;				// Disk Number is initially 1

unsigned int FTPObj::LostPkts[4000];			// Array to keep track of lost pkts

unsigned int FTPObj::TotalFilePkts=0;			// Total number of pkts per file

unsigned int FTPObj::TotalLostPkts=0;			// Total number of pkts lost per file transfer
	
unsigned int FTPObj::MaxPktSize= 1000;			// Maximum number of bytes the packet has
unsigned long FTPObj::TFileSize= 0;			// The File Size 

int FTPObj::fileTransferFinished = 0;

// Destingation DOSC FTP servers IP address
char FTPObj::IP[4];
char FTPObj::DestMac[6];
	
// Destination FTP servers Port Number
unsigned short FTPObj::port;
	
// Status
int FTPObj::state;

// current Resource Address
char* FTPObj::curraddress;
unsigned long FTPObj::tftppkts;

// Function Definition Starts Here
// ***************************************************************************
// This is the method called globally to initialize the object all the static values will be initialized in this method
// This methosd must be called only onec per program
// Returns -1 if the buffer size is much less 
int FTPObj::init(unsigned long BufferBase, unsigned long BufferSize, int BufferIndexCount, int hashIndexCount,
		 char *ftpDestIP, unsigned short ftpDestPort)
{
	// Local variable declarations

	long HashIndexSize =0;
	int i=0;

	ResourceIndex *tmpresourceindex;	
	HashIndexSize = h.init(hashIndexCount,BufferBase);
		
	ResourceIndexBase = BufferBase+HashIndexSize;		

	ResourceBufferBase=(BufferBase + (sizeof(ResourceIndex)*BufferIndexCount) + HashIndexSize);

	curraddress =(char*)ResourceBufferBase;
	
	ResourceIndexCount=BufferIndexCount;		
	
	ResourceIndexSize=sizeof(ResourceIndex)*BufferIndexCount;

	ResourceBufferSize=BufferSize - (ResourceIndexSize + HashIndexSize);	
	
	ResourcePtr=ResourceBufferBase; 		
	
	ResourceIndexPtr=0;
	
	nextseq=0;

	IP[0] = ftpDestIP[0]; 
	IP[1] = ftpDestIP[1]; 
	IP[2] = ftpDestIP[2]; 
	IP[3] = ftpDestIP[3]; 

	for(i=0; i<6; i++)
	{
	   DestMac[0] = 0;
	}

	port = ftpDestPort;
	tmpresourceindex = (ResourceIndex*)ResourceIndexBase;
	for(i=0;i<hashIndexCount;i++)
	{
	   tmpresourceindex[i].NextPtr =0x00; 
	}
	for(i=0;i<4000;i++)
	{
	    LostPkts[i]=0;
	}
	// This it the total number of lost packts for a file this is reinitialized to zero at start of file transfer
	// Then updated whenever there is a packet loss
	TotalLostPkts =0;	
	// This is the total number of packts for a file this is calculated when a 201 message isreceived 
	TotalFilePkts =0;
	
	// We assume the maximum packet size is 1000 bytes in a UDP packet
	// The server must also have the same size
	MaxPktSize =1000;
	
	state = ACTIVE_OPEN;
	
	fileTransferFinished = 0;

	return 0;
}

int FTPObj::getFile(char *FileName, unsigned long *FileStartAddress, unsigned long *FileSize)
{
    long HashValue=0;
    unsigned long IndexAddress;
    ResourceIndex *tmpres;

    HashValue = h.hashfun(FileName,sstrlen(FileName)); 
    IndexAddress=h.getIndex(HashValue);	
  
    
    while(IndexAddress != 0)
    {
	tmpres =(ResourceIndex*)IndexAddress;	 	
	
	if(sstrcmp(tmpres->FileName,FileName) == 0)
	{
	   //FileFound
	   *FileStartAddress=tmpres->StartAddress;
	   *FileSize=tmpres->FileSize;
	   return 0;
	}
	IndexAddress = tmpres->NextPtr;	
    }
    // File not found
    return -1;			
}

int FTPObj::sstrcmp(char* D_Str,char* S_Str)
{
   int i=0;
   AOAProtected io;

   if(sstrlen(D_Str) != sstrlen(S_Str))
   {
       return -1;
   }
   
   i=0;
   while((D_Str[i]!=0x00 ||  S_Str[i]!=0x00))
   {
	if(D_Str[i]==0x00)
	   break;
	if(i>FNameSize)
	{
	    break;
	}
  	if(S_Str[i]==0x00)
	   break; 
       if(D_Str[i]==S_Str[i])
       {
	   i++;
       }
       else if(D_Str[i] != S_Str[i])
       {
	   return -1;
       }
       
   }
   if(D_Str[i]==0x00 && S_Str[i]==0x00)
   {
       return 0;
   }
   else
   {
       return -1;
   }
}

int FTPObj::sstrcpy(char* D_Str,int D_Size,char* S_Str,int S_Size)
{
int i=0;
int D_Full_flag = 0;
  if(D_Size < 2)
   {
    if(D_Size < 1)
      return -1; 
    if(D_Size == 1)
      {
       D_Str[0] = 0x00;
       return 0;
      }       
   }  
   if(S_Size < 2)
   {
     D_Str[0] = 0x00; 
     return 0; 
   } 
   i=0;
   while((S_Str[i]!=0x00) && (i<=S_Size))
   {
       if(S_Str[i]=='\\')
       {
	   S_Str[i]= '/';

       }
       i++;
   } 
 
 i = 0;  
 while(S_Str[i]!=0x00)
   {
     if(i<D_Size)
     {
          if(i< S_Size) 
            D_Str[i] = S_Str[i];
          else
	   { 
            D_Str[i] = 0x00; 
            return 0; 
           } 
     }
     else
     { 
       D_Str[D_Size-1] = 0x00; 
       return 0; 
     }  
     i++;
   }
   if(i<D_Size)
   {
    D_Str[i] = 0x00;
   }
   else
   {
    D_Str[D_Size-1]=0x00; 
   }
return 0;
} 

int FTPObj::sstrlen(char* str)
{
	int len;
	len = 0;
	//if the char in string is not '\0' then go on until it reaches the MaxLen
	while(str[len] != 0x00)   
	{
		len++;
	}
	return len;
}
//------------------------------------------------------------------------
//  form data buffer which is similar to DPD link 
//------------------------------------------------------------------------
int FTPObj::StartTransfer(char* tIP, unsigned short tPort, int currenttask)
{
	AOAProtected io;
	AOATask task;
	EtherObj EO; 
	ARPObj arp;

	int i=0;
	int retcode=0;
	int currtime=0;

	char *BUFFER; 
        long x = 0; 
        long *p1; 
        long c3; 
        p1 = &c3; 

        //resolve ARP 
        do
        {
         retcode = arp.Resolve(tIP, DestMac, currenttask);
         if(retcode == -1)
	 {
	       currtime = io.AOAgetTimer();				 
	    do
	    {
               task.AOAsuspendTask();
	    }while(io.AOAgetTimer() - currtime <= ARP_DELAY); 
	 }
        }while(retcode == -1);


	// the reason we use (EO.SendInPtr+1) instead of EO.SendInPtr is
	// arp request goes to the client at EO.SendInPtr, so we must use the next
	// one for sending the ftp request
        x = EO.TDLPointer + EO.SendInPtr * 16 - ADDR_OFFSET;
	
        p1 = (long*)x;  
        BUFFER = (char*)*p1;
        BUFFER = BUFFER  + 14 + 20 + 8 - ADDR_OFFSET; //it is an absolute address 

	IP[0] = tIP[0];
	IP[1] = tIP[1];
	IP[2] = tIP[2];
	IP[3] = tIP[3];
	port = tPort;
	
	// The status character denotes the start of transfer
	BUFFER[0]	= '1';
	BUFFER[1]	= '0';
	BUFFER[2]	= '1';
	BUFFER[3] = 0x10;
	BUFFER[4] = 0x13;
 	
	state = ACTIVE_OPEN;
	
	// this call sends a start transfer (101) packet and returns to MainTask
	retcode = udp.sendData(IP, port, BUFFER, 10, DestMac, currenttask);	
	
	return 0;
}
//------------------------------------------------------------------------
//  ftp handler
//  return code
//  -16 packet size is less than 3
//------------------------------------------------------------------------
int FTPObj::FtpHandler(char *UData, long Size, char* tIP, unsigned short tPort, int currenttask)
{
  AOAProtected io;
  EtherObj EO;
  unsigned int  seqnumber;
  char *seqnum;
  unsigned int buffsize;
  char *fname;
  unsigned long fsize;
  unsigned long HashValue;
  int i=0;
  int retcode=0;

  char *Data; 
  long x = 0; 
  long *p1; 
  long c3; 
  p1 = &c3 ; 
 
  ResourceIndex *tmpresourceindex, *tmpres;
  tmpresourceindex =(ResourceIndex*)ResourceIndexBase;

  x = EO.TDLPointer + EO.SendInPtr * 16 - ADDR_OFFSET;
  
  p1 = (long*)x;  
  Data = (char*)*p1;

  Data = Data + 14 + 20 + 8 - ADDR_OFFSET; //it is an absolute address

  if(Size<3)
	return -16;

  if(state == ACTIVE_OPEN)
  {
	if(UData[0] == '1' && UData[1] == '0' && UData[2] == '2')
	{
		state = ESTABLISHED;			
		return 0;
	}
	else
	{
		// Send the UDP Packet saying starting Data Transfer		
		Data[0]	= '1';
		Data[1]	= '0';
		Data[2]	= '1';
		Data[3] = 0x10;
		Data[4] = 0x13;
 		retcode = udp.sendData(IP, port, Data, 10, DestMac, currenttask);		
		return retcode;
	}
  }
  else if(state == ESTABLISHED)
  {
	if(UData[0] == '2' && UData[1] == '0' && UData[2] == '1')
	{
	
		// Get the file name and size and verify if the file is acceptable 		
		fname = &UData[5];
		fsize = UData[90]&0xFF;
		fsize = ((fsize << 8)&0xFF00)| (UData[89]&0xFF);
		fsize = ((fsize << 8)&0xFFFF00) | UData[88]&0xFF;
		fsize = ((fsize << 8)&0xFFFFFF00) | UData[87]&0xFF;	
		if(ResourceIndexPtr > ResourceIndexCount)
		{
		// Resource buffer Full			
		Data[0]	= '2';
		Data[1]	= '0';
		Data[2]	= '3';
		Data[3] = 0x10;
		Data[4] = 0x13;
 		retcode = udp.sendData(IP, port, Data, 10, DestMac, currenttask);
		state =  fCLOSED;
		return retcode;	
		}
		if(((long)curraddress+fsize) > (ResourceBufferBase+ResourceBufferSize))
		{
		// Resource buffer Full			
		Data[0]	= '2';
		Data[1]	= '0';
		Data[2]	= '3';
		Data[3] = 0x10;
		Data[4] = 0x13;
 		retcode = udp.sendData(IP, port, Data, 10, DestMac, currenttask);
		state =  fCLOSED;
		return retcode;
		}
		{
		sstrcpy(tmpresourceindex[ResourceIndexPtr].FileName, 
			sizeof(tmpresourceindex[ResourceIndexPtr].FileName),fname,FNameSize);
		tmpresourceindex[ResourceIndexPtr].StartAddress = (long)curraddress;
		tmpresourceindex[ResourceIndexPtr].FileSize = fsize;	
		tmpresourceindex[ResourceIndexPtr].NextPtr = 0x0;
		HashValue = h.hashfun((&tmpresourceindex[ResourceIndexPtr].FileName[0]),
				      (sstrlen(tmpresourceindex[ResourceIndexPtr].FileName)));
		if(h.getIndex(HashValue) == 0)
		{
		    h.setIndex(HashValue,(unsigned long)(&tmpresourceindex[ResourceIndexPtr]));
		    ResourceIndexPtr++;
		   	Data[0]	= '2';
			Data[1]	= '0';
			Data[2]	= '2';
			Data[3] = 0x10;
			Data[4] = 0x13;
			TFileSize = fsize;
			TotalFilePkts = fsize / MaxPktSize;
			if((fsize % MaxPktSize)!=0)
			{
			    TotalFilePkts = TotalFilePkts +1;
			}
			TotalLostPkts = 0;
		 	retcode = udp.sendData(IP, port, Data, 10, DestMac, currenttask);		
			nextseq =0;
			state = READY;
			return retcode;		 
		}
		else
		{
		    tmpres =(ResourceIndex*)h.getIndex(HashValue);	
		    while(tmpres->NextPtr != 0x00000000)	
		    {
			if(sstrcmp(tmpres->FileName,tmpresourceindex[ResourceIndexPtr].FileName) == 0)
			{
			    goto FileExist;
			}
			tmpres = (ResourceIndex*)(tmpres->NextPtr);	
		    }
		    if(sstrcmp(tmpres->FileName,tmpresourceindex[ResourceIndexPtr].FileName) == 0)
		    {
		        goto FileExist;
		    }
		    else
		    {
			tmpres->NextPtr = (unsigned long)(&tmpresourceindex[ResourceIndexPtr]);
			ResourceIndexPtr++;
			Data[0]	= '2';
			Data[1]	= '0';
			Data[2]	= '2';
			Data[3] = 0x10;
			Data[4] = 0x13;
			TFileSize = fsize;	
			TotalFilePkts = fsize / MaxPktSize;
			if((fsize % MaxPktSize)!=0)
			{
			    TotalFilePkts = TotalFilePkts +1;
			}
			TotalLostPkts = 0;
			retcode = udp.sendData(IP, port, Data, 10, DestMac, currenttask);		
			nextseq =0;
			state = READY;
			return retcode;		
		    }
				
		}
		FileExist:	
		Data[0]	= '2';
		Data[1]	= '0';
		Data[2]	= '4';
		Data[3] = 0x10;
		Data[4] = 0x13;
	        // File Exist 204 
 		retcode = udp.sendData(IP, port, Data, 10, DestMac, currenttask);		
		return retcode;		
		}
	}
	if(UData[0] == '3' && UData[1] == '0' && UData[2] == '3') 
	{
		state = ESTABLISHED;
		Data[0]	= '3';
		Data[1]	= '0';
		Data[2]	= '4';
		Data[3] = 0x10;
		Data[4] = 0x13;
		retcode = udp.sendData(IP, port, Data, 10, DestMac, currenttask);		
		return retcode;				
	}	
	if(UData[0] == '1' && UData[1] == '0' && UData[2] == '3') 
	{
	        state = fCLOSED;				
		Data[0]	= '1';
		Data[1]	= '0';
		Data[2]	= '4';
		Data[3] = 0x10;
		Data[4] = 0x13;
		retcode = udp.sendData(IP, port, Data, 10, DestMac, currenttask);
		fileTransferFinished = 1;
		return retcode;					
	}
	return 0;
  }
  else  if(state == READY)
  {
 	if(UData[0] == '3' && UData[1] == '0' && UData[2] == '1') 
	{
		seqnumber = UData[6]&0xFF;
		seqnumber = ((seqnumber<<8) & 0xFF00)| (UData[5]&0xFF);

		// Get the data 		
		if(seqnumber != nextseq)
		{

		    //-----------------------------------------
		    if(seqnumber > nextseq)
		    {

			for(int i = nextseq ; i < seqnumber;i++)
			{
			    LostPkts[TotalLostPkts] = i;
			    TotalLostPkts = TotalLostPkts+1;
			}
		  	
		   	nextseq = seqnumber;
		    }
		    else
		    {
			return 0;
		    }
		    state = READY;

		}
		nextseq++;			

		buffsize = UData[10]&0xFF;
		buffsize = ((buffsize << 8) & 0xFF00) | UData[9]&0xFF;
		
		for(i=0;i<buffsize;i++)
		{
			curraddress[(seqnumber * MaxPktSize) + i] = UData[13+i];		
		}
		state = READY;
		return 0;			
	
	}
	if(UData[0] == '3' && UData[1] == '0' && UData[2] == '3') 
	{
		if(nextseq < TotalFilePkts)
		{
		    for(i=nextseq; i < TotalFilePkts ; i++)
		    {
			    LostPkts[TotalLostPkts] = i;
			    TotalLostPkts = TotalLostPkts+1;
		    }
		    nextseq = TotalFilePkts;
		}
	    	if(TotalLostPkts == 0)
		{
		state = ESTABLISHED;
		Data[0]	= '3';
		Data[1]	= '0';
		Data[2]	= '4';
		Data[3] = 0x10;
		Data[4] = 0x13;
		TotalLostPkts = 0;
		TotalFilePkts = 0;
		curraddress = curraddress + TFileSize;
		retcode = udp.sendData(IP, port, Data, 10, DestMac, currenttask);		
		return retcode;				
		}
		else
		{
		Data[0]	= '3';
		Data[1]	= '0';
		Data[2]	= '6';
		Data[3] = 0x10;
		Data[4] = 0x13;	
		seqnum = (char*)(&(LostPkts[TotalLostPkts-1]));
		Data[5] = seqnum[0];
		Data[6] = seqnum[1];
		Data[7] = '\r';
		Data[8] = '\n';	
		state = READY;	
		retcode = udp.sendData(IP, port, Data, 10, DestMac, currenttask);			
		return retcode;
		}
	}
	if(UData[0] == '3' && UData[1] == '0' && UData[2] == '5') 	
	{
		seqnumber = UData[6]&0xFF;
		seqnumber = ((seqnumber<<8) & 0xFF00)| (UData[5]&0xFF); 
		if(seqnumber == LostPkts[TotalLostPkts-1])
		{
			buffsize = UData[10]&0xFF;
			buffsize = ((buffsize << 8) & 0xFF00) | UData[9]&0xFF;
			for(i=0;i<buffsize;i++)
			{
				curraddress[(seqnumber * MaxPktSize) + i] = UData[13+i];		
			}
			TotalLostPkts--;
		}
		if(TotalLostPkts == 0)
		{
			state = ESTABLISHED;
			Data[0]	= '3';
			Data[1]	= '0';
			Data[2]	= '4';
			Data[3] = 0x10;
			Data[4] = 0x13;
			TotalLostPkts = 0;
			TotalFilePkts = 0;
			curraddress = curraddress + TFileSize;	
			retcode = udp.sendData(IP, port, Data, 10, DestMac, currenttask);		
			return retcode;				 
		}
		else
		{
			Data[0]	= '3';
			Data[1]	= '0';
			Data[2]	= '6';
			Data[3] = 0x10;
			Data[4] = 0x13;	
			seqnum = (char*)(&(LostPkts[TotalLostPkts-1]));
			Data[5] = seqnum[0];
			Data[6] = seqnum[1];
			Data[7] = '\r';
			Data[8] = '\n';
			state = READY;	
			retcode = udp.sendData(IP, port, Data, 10, DestMac, currenttask);			
			return retcode;	
		}
	}

  }
  else if(state == fCLOSED)
  	{
	if(UData[0] == '1' && UData[1] == '0' && UData[2] == '3') 
	{
		Data[0]	= '1';
		Data[1]	= '0';
		Data[2]	= '4';
		Data[3] = 0x10;
		Data[4] = 0x13;
		retcode = udp.sendData(IP, port, Data, 10, DestMac, currenttask);			
		fileTransferFinished = 1;
		return retcode;
	}
	}

  return 0;
}
