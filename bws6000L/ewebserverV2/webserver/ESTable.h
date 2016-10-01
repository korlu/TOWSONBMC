#ifndef __ESTable__
#define __ESTable__

#include "../INTERFACES/AOAProtected.h"

class ESTable
{
    private:
	static long ESTableBase;
	// This variable holds the base address of the ESTable Base
	
	static long BufferBase;
	// This variable holds the base address of the buffer Base to store ethernet frame data
	
	static long BufferSize;
	// The size of total buffer allocated to the store ethernet packet
	
	static long BufferRecordSize;	
	// The size size of the buffer to get the data in a single Ethernet Packet

	static long ESTableSize;
	// The size of the buffer allocated to the ESTable to store the Ethernet Statistics

	static int NoEsTableRecords;
	// Denotes the Number of Table Records;


	static int CurrentRecordNumber;
	// This denotes the Record Last Referenced	
	//

	AOAProtected io;

    public:
	// This Structure is used to manipulate the ESTable Records		
	struct ESRecord 
	{	
     	   int Valid; 
	   int PktType; 
	   int PktSize;  
	   long ArrivalTime;
	   long BufferAddress;
	};

    private:
	static ESRecord *CurrentRecord;
	// This points to the Record Last Referenced	
    public:
	
	// This function initializes the object Globally
	// This function must be called only once for a program
	int init(long ESBasePtr, long BufferPtr, int ESSizeVal,int NoEsRecordsVal, int BufferSizeVal,int BufferRecordVal, int *ErrorDet);
	
	// Insert inserts the Record into the ESTable and returns the Record number in the Table 
	int insert(char *ETData, int PkSize,int Pktype, long Time);
	
	// Get will return the record for Processing and it will return the record number
	int get(long *Data,int *PkSize,int *PkType,long *Time);
	
	
	// This will delete the Record in the ESTable and Make the Record available for another Entry
	int remove(int RecordNumber);


};
#endif

