//******************************************************
// This is CirList.cpp file 
//******************************************************
#include"httplist.h"
#include "..\webserver\apptask.h"
#include "..\webserver\wlist.h"

// The Static Variable definition starts here

long HTTPList::HTTPTableBase = 0;
// This variable holds the base address of the ESTable Base

long HTTPList::HTTPBufferBase  = 0;
// This variable holds the base address of the buffer Base to store ethernet frame data

long HTTPList::HTTPBufferSize  = 0;
// The size of total buffer allocated to the store ethernet packet
	
long HTTPList::HTTPBufferRecordSize=0;	
// The size size of the buffer to get the data in a single Ethernet Packet

long HTTPList::HTTPTableSize = 0;
// The size of the buffer allocated to the ESTable to store the Ethernet Statistics

HTTPList::HTTPRecord* HTTPList::HTTPInRecord = 0;
HTTPList::HTTPRecord* HTTPList::HTTPOutRecord = 0;

int HTTPList::HTTPInPtr = 0;
int HTTPList::HTTPOutPtr = 0;
int HTTPList::HTTPSize = 0;

long HTTPList::HTTPInCount = 0; 
long HTTPList::HTTPInCountStored = 0; 
long HTTPList::HTTPOutCount = 0; 
//****************************************************************************************
// This function initializes the object Globally
// This function must be called only once for a program
// This function Returns Error Details
// -1 if the ESTable Buffer is less
// ErrorDet will have the Size of buffer required
// -2 if the Buffer to store the Ethernet Packet is less
// ErrorDet will have the the size of buffer required to store the Ethernet Packet Data
// ...ESTable records are stored in one place in memory starting at 0220BF40 
// and the actual packets are stored at 04000000. The record entry BufferAddress 
// points to the actual packet in memory 
//****************************************************************************************
int HTTPList::init(long HTTPBasePtr,long HTTPBufferPtr,int HTTPSizeVal,int NoHTTPRecordsVal,int HTTPBufferSizeVal,int HTTPBufferRecordVal, int *ErrorDet)
{
	if((HTTPSizeVal/ sizeof(HTTPRecord)) < NoHTTPRecordsVal)
	{
	    *ErrorDet = NoHTTPRecordsVal * sizeof(HTTPRecord);
	    io.AOAPrintText("HTTPList:init:1 Insufficient space for allocating http records", Line24);
	    return -1;
	}
	if((HTTPBufferSizeVal/ HTTPBufferRecordVal) < NoHTTPRecordsVal)
	{
	    *ErrorDet = NoHTTPRecordsVal * sizeof(HTTPRecord);
	    io.AOAPrintText("HTTPList:init:1 Insufficient space for allocating http record buffers", Line24);
	    return -2;
	}

	HTTPTableBase = HTTPBasePtr; //x0220BF40 - 00110000
	HTTPBufferBase  = HTTPBufferPtr; //x04000000 - 00110000
	HTTPTableSize = HTTPSizeVal; //20 * 1000 = 20000 Bytes 
	HTTPSize        = NoHTTPRecordsVal; //1000
	HTTPBufferSize  = HTTPBufferSizeVal;  //Total Buffer Size 2048 * 1000 = x1F4000 
	HTTPBufferRecordSize=HTTPBufferRecordVal; //2048 	
	// Initialize the ESTable 
	// Set Valid to 0

	HTTPRecord *HTTPRecordPtr;
	// Pointer to ES Record to manipulate ESTable
	long HTTPTableBasePtr = HTTPTableBase;
	long HTTPBufferBasePtr = HTTPBufferBase;

	//initialize in and out ptrs to the base value of record memory 
	//that is, they both pointing to the same record In = Out = 0, empty now 
	//
	HTTPInRecord = (HTTPRecord*)HTTPTableBasePtr;
	HTTPOutRecord = (HTTPRecord*)HTTPTableBasePtr;
	
        //all the records are initialized with appropriate buffer address 
	// and all other fields are initialized to zero 
	// the buffer address will be never modified again 
	for(int i=0; i < HTTPSize; i++)
	{
	    HTTPRecordPtr = (HTTPRecord*)(HTTPTableBasePtr + ( i * sizeof(HTTPRecord)));
	    HTTPRecordPtr->Valid =0;  //not used 
	    HTTPRecordPtr->Socket_ID=0;
	    HTTPRecordPtr->HTTPSize = 0;
	    HTTPRecordPtr->BufferAddress = (HTTPBufferBasePtr +(i*HTTPBufferRecordVal)); 
	 }
	HTTPInCount =0;
	HTTPOutCount = 0;
	HTTPInCountStored =0;
	*ErrorDet =0;
	count = 0; 
	//io.AOAprintHex(HTTPTableBase, Line5);
	//io.AOAprintHex(HTTPBufferBase, Line5+20);	
	//io.AOAprintHex(HTTPBufferSize, Line5+40);	
	//io.AOAprintHex(HTTPBufferRecordSize, Line5+60);
	//io.AOAprintHex(HTTPTableSize, Line5+80);	
	//io.AOAprintHex((long)HTTPInRecord, Line5+100);	
	//io.AOAprintHex((long)HTTPOutRecord, Line5+120);
	//io.AOAprintHex((long)HTTPInCount, Line5+140);	
	//io.AOAprintHex((long)HTTPOutCount, Line5+160);	
	//io.AOAprintHex((long)HTTPInCountStored, Line5+180);
	//io.AOAExit();
	return 0;
}
//**************************************************************************************
// Insert inserts the Record into the ESTable and returns the error code 0 if successful 
//  user should check appropriate error conditions 
//   - 28 packet size is larger than record size
//   - 29 http buffer is full 
//   - 30 valid bit is not set
//  user should check for full condition before insert operation 
//**************************************************************************************
int HTTPList::insert(char *HTTPData, int PkSize,int SocketID, char *ip, char *port)
{
	AOAProtected io; 

        HTTPRecord *tempCurrentRecord;
        HTTPRecord *HTTPRecordPtr;
        char *temp;   
        int retcode = 0; 
    
        tempCurrentRecord = HTTPInRecord; //In record

        if(PkSize > HTTPBufferRecordSize)
        {
	        // RkSize is larger than BufferRecord Size
	        return -28;
        }

	if(full() == 1)
	{
		// http buffer is full
		return -29;
	}
    	if(tempCurrentRecord->Valid == 0)
	{
         	tempCurrentRecord->Valid = 1;    //insert  
         	tempCurrentRecord->Socket_ID = SocketID;   
		tempCurrentRecord->ip[0] = ip[0];
		tempCurrentRecord->ip[1] = ip[1];
		tempCurrentRecord->ip[2] = ip[2];
		tempCurrentRecord->ip[3] = ip[3];	
		tempCurrentRecord->port[0] = port[0];	
		tempCurrentRecord->port[1] = port[1];		
		tempCurrentRecord->HTTPSize = PkSize;
		temp =(char*)tempCurrentRecord->BufferAddress;
		++HTTPInCountStored;  //increment the stored count  

		for(int i=0; i < PkSize ; i++)
		{
       		  temp[i] = HTTPData[i]; //store packet in memory 		    
		}

		HTTPInPtr = (HTTPInPtr + 1);   //update the pointer
		if(HTTPInPtr >= HTTPSize)
		{
                  HTTPInPtr=0;
		}	
	        HTTPRecordPtr = (HTTPRecord*)(HTTPTableBase + ( HTTPInPtr * sizeof(HTTPRecord)));
		//next record 
		HTTPInRecord = HTTPRecordPtr;  
	}
	else
    	{
	        //valid bit not set
	        return -30; //should never happen 	
        }

	return 0;
};
	
//****************************************************************************************
// Will return the packet pointer as reference *Data 
// and also PkSize, Pktype and Time as pointes 
// The return code will be 0 if successful, otherwise 
// SocketId the identifier to identify the TCP Packet
// PkSize is the maximum size of data that is accetable and it retrns the size of data returned in the Buffer
// Data is the buffer to store the HTTP Request
//  -1 if pksize is less than 0
//  -2 if the valid bit is not set
//****************************************************************************************
int HTTPList::get(int *SocketID, int *PkSize,char *Data, char *ip, char *port)
{
    AOAProtected io;			
    apptask tsk;
    WList wlst;
    
    HTTPRecord *tempCurrentRecord;
    HTTPRecord *HTTPRecordPtr;    
    char *temp = 0;
    int retcode = 0; 

    tempCurrentRecord = HTTPOutRecord; 
    	if(PkSize<=0)
	{
	    return -1;
	}
    	if(tempCurrentRecord->Valid == 1)
	{

		tempCurrentRecord->Valid = 0;
		
		if(*PkSize > tempCurrentRecord->HTTPSize)
		{
		    *PkSize = tempCurrentRecord->HTTPSize;
		}
		
		*SocketID = tempCurrentRecord->Socket_ID;	
		ip[0] = tempCurrentRecord->ip[0];	
		ip[1] = tempCurrentRecord->ip[1];		
		ip[2] = tempCurrentRecord->ip[2];			
		ip[3] = tempCurrentRecord->ip[3];			
		port[0] = tempCurrentRecord->port[0];				
		port[1] = tempCurrentRecord->port[1];				

		char *DataBuff =(char*)tempCurrentRecord->BufferAddress;
		for(int i=0; i < *PkSize; i++)
		{
			Data[i] = DataBuff[i];
		}
		
		++HTTPOutCount;       //increment the remove count
		
		HTTPOutPtr = (HTTPOutPtr + 1);   //update the pointer
		if(HTTPOutPtr >= HTTPSize)
		{
	           HTTPOutPtr=0;
		}	
	        
		HTTPRecordPtr = (HTTPRecord*)(HTTPTableBase + ( HTTPOutPtr * sizeof(HTTPRecord)));
		//next record 
		HTTPOutRecord = HTTPRecordPtr;  
     	}
	else
    	{
		wlst.insert(tsk.Current_Task, tsk.Current_Tcbrno, 0xf0000000, 1); 				
		//valid bit is not set				
		return -2;   	
	}
		wlst.insert(tsk.Current_Task, tsk.Current_Tcbrno, 0x20000000, 1); 				
   return 0;   
};
//*********************************************************************************************
//return 1 if it is empty 
//*********************************************************************************************
int HTTPList::empty()
 {
  int retcode = 0; 

  if (HTTPInPtr == HTTPOutPtr) 
    retcode = 1;    //empty 
  else retcode = 0; //not empty   

  return retcode;  
 };
//*********************************************************************************************
//return 1 if it is full 
//*********************************************************************************************
int HTTPList::full()
 {
  int retcode = 0; 

  if ((HTTPInPtr + 1) % HTTPSize == HTTPOutPtr) 
    retcode = 1; //full  
  else retcode = 0; //not full  

  return retcode; 
 };
//*********************************************************************************************
//return in ptr 
//*********************************************************************************************
int HTTPList::getInPtr()
 {
   return HTTPInPtr; 
 };
//*********************************************************************************************
//return out ptr 
//*********************************************************************************************
int HTTPList::getOutPtr()
 {
   return HTTPOutPtr; 
 };
//*********************************************************************************************
//return incount 
//*********************************************************************************************
int HTTPList::getInCount()
 {
   return HTTPInCountStored; 
 };
//*********************************************************************************************
//return outcount 
//*********************************************************************************************
int HTTPList::getOutCount()
 {
   return HTTPOutCount; 
 };

int HTTPList::getCount()
{
			
   if(HTTPInPtr >= HTTPOutPtr)
	return (HTTPInPtr-HTTPOutPtr);
   else
        return( HTTPSize - (HTTPOutPtr-HTTPInPtr));

}


