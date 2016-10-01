//cirlist.h filename
#ifndef __HTTPList__
#define __HTTPList__
//*******************************************************************
//Towson University Copyright 2004
//Coded by R.K.Karne, Dated December 10, 2004
// Circular List 
// InPtr points to the insert list 
// OutPtr points to the remove list 
// Size is the size of the list (1000) 
// InPtr = OutPtr, the list is empty 
// (InPtr+1) mod Size = OutPtr, then it is full 
// When Updating the pointers, interrupts are disabled AOAcli()
//   after that interrupts are enabled AOAsti()
// As we do not have locking, we can use interrupts to lock the records
//*******************************************************************
#include "../Interfaces/AOAProtected.h"

class HTTPList
{
    private:
	static long HTTPTableBase;
	// This variable holds the base address for the HTTP table  
	
	static long HTTPBufferBase;
	// This variable holds the base address of the HTTP Requests to be stored in memory
	
	static long HTTPBufferSize;
	// The size of total buffer allocated to the store HTTP Requests
	
	static long HTTPBufferRecordSize;	
	// The memory size of the buffer to get a single HTTP Request

	static long HTTPTableSize;
	// The size of the toal momory space allocated for records 

	static int HTTPInPtr;  //Input Poiter for the Circular List 
	static int HTTPOutPtr; //Output Pointer for the Circular List 
	static int HTTPSize;   //Maximum Size of the Circular List i.e. the number of records

	AOAProtected io;

    public:
	//structure of the ethernet record circular list  
	
	struct HTTPRecord 
	{	
	   int Valid;          //record entry is valid or not
	   int Socket_ID;      // TCP Socket Id to send and receive packets
	   char ip[4];
	   char port[2];
	   int HTTPSize;       // Size of the HTTP Request in the Buffer
	   long BufferAddress; //pointer to memory location where the HTTP REquest is stored 
	};

	struct HTTPGetRecord 
	{	
	   int Valid;          //record entry is valid or not
	   int Socket_ID;      // TCP Socket Id to send and receive packets
	   int HTTPSize;       // Size of the HTTP Request in the Buffer
	   int MAXHTTPSize;    // size of the request the maximum the Buffer can accept 	
	   char *BufferAddress; //pointer to memory location where the HTTP Rquest is stored 
	};
	
    
	int count; 

    private:
	static HTTPRecord *HTTPInRecord;     //points to the current In Record 
	static HTTPRecord *HTTPOutRecord;     //points to the current Out Record 
	// This points to the Record Last Referenced	
    public:

	static long HTTPInCount;                //No of Input Messages Received 
	static long HTTPInCountStored;          //No of Input Messages Stored in the List 
	static long HTTPOutCount;               //No of Messages Retrieved from the List 

	// This function initializes the object Globally
	// This function must be called only once for a program
int init(long HTTPBasePtr, long HTTPBufferPtr, int HTTPSizeVal,int NoHTTPRecordsVal, int HTTPBufferSizeVal,int HTTPBufferRecordVal, int *error);
	
	// Insert inserts the Record into the ESTable and returns the Record number in the Table 
	int insert(char *HTTPData, int PkSize,int SocketID, char *ip, char *port);
	
	// Get will return the record for Processing and it will return the record number
	//  it will also remove the packet from the circular list
	int get(int *SocketID, int *PkSize,char *Data, char *ip, char *port);

	//check if the list is empty 
	int empty(); //returns one if it is empty 

	//check if the list is full 
	int full(); //returns one if it is full 

	int getInPtr(); 
	int getOutPtr(); 
	
};
#endif

