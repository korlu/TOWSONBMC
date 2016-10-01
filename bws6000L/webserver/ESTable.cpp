//******************************************************
// This is ESTable.cpp
//******************************************************
#include"EStable.h"
// The Static Variable definition starts here

long ESTable::ESTableBase = 0;
// This variable holds the base address of the ESTable Base

long ESTable::BufferBase  = 0;
// This variable holds the base address of the buffer Base to store ethernet frame data

long ESTable::BufferSize  = 0;
// The size of total buffer allocated to the store ethernet packet
	
long ESTable::BufferRecordSize=0;	
// The size size of the buffer to get the data in a single Ethernet Packet

long ESTable::ESTableSize = 0;
// The size of the buffer allocated to the ESTable to store the Ethernet Statistics

int ESTable::NoEsTableRecords = 0;
// Denotes the Number of Table Records;

int ESTable::CurrentRecordNumber = 0;
	// This denotes the Record Last Referenced

ESTable::ESRecord* ESTable::CurrentRecord = 0;
	// This points to the Record Last Referenced		

//******************************************************
// This function initializes the object Globally
// This function must be called only once for a program
// This function Returns Error Details
// -1 if the ESTable Buffer is less
// ErrorDet will have the Size of buffer required
// -2 if the Buffer to stopre the Ethernet Packet is less
// ErrorDet will have the the size of buffer required to store the Ethernet Packet Data
//******************************************************

int ESTable::init(long ESBasePtr, long BufferPtr, int ESSizeVal,int NoEsRecordsVal, int BufferSizeVal,int BufferRecordVal, int *ErrorDet)
{
	if((ESSizeVal/ sizeof(ESRecord)) < NoEsRecordsVal)
	{
	    *ErrorDet = NoEsRecordsVal * sizeof(ESRecord);
	    return -1;
	}
	if((BufferSizeVal/ BufferRecordVal) < NoEsRecordsVal)
	{
	    *ErrorDet = NoEsRecordsVal * sizeof(ESRecord);
	    return -2;
	}

	ESTableBase = ESBasePtr;
	BufferBase  = BufferPtr;
	BufferSize  = BufferSizeVal;
	BufferRecordSize=BufferRecordVal;	
	ESTableSize = ESSizeVal;
	NoEsTableRecords = NoEsRecordsVal;
	// Initialize the ESTable 
	// Set Valid to 0
	// Set the Buffer pinters
	// Temporary Variables to 

	ESRecord *ESRecordPtr;
	// Pointer to ES Record to manipulate ESTable
	long ESTableBasePtr = ESTableBase;
	long BufferBasePtr = BufferBase;
	CurrentRecord = (ESRecord*)ESTableBase;
	CurrentRecordNumber =0;

	for(int i=0; i < NoEsTableRecords; i++)
	{
	    ESRecordPtr = (ESRecord*)(ESTableBasePtr + ( i * sizeof(ESRecord)));
	    ESRecordPtr->Valid =0;
	    ESRecordPtr->ArrivalTime =0;
	    ESRecordPtr->PktSize = 0;
	    ESRecordPtr->PktType = 0; 
	    ESRecordPtr->BufferAddress = (BufferBasePtr +(i*BufferRecordVal)); 
	 }
	*ErrorDet =0;
	return 0;
}
//**************************************************************************************
// Insert inserts the Record into the ESTable and returns the Record number in the Table 
// returns -1 if the packet size is bigger than the buffer 
//**************************************************************************************
int ESTable::insert(char *ETData, int PkSize,int Pktype, long Time)
{
    if(PkSize > BufferRecordSize)
    {
	io.AOAPrintText ("estable.cpp: insert: RkSize is larger than BufferRecord Size", Line2);
	return -1;
    }
    ESRecord *tempCurrentRecord;
    char *temp = 0;
    int tempRecordNo = CurrentRecordNumber;
    tempCurrentRecord = CurrentRecord;
    int RecordFoundFlag =0;// 1 - Means Record not found
    int lockStatus = 0; 

    while(RecordFoundFlag !=1)
    {
//	io.AOAcliTimer();
    	if(tempCurrentRecord->Valid == 0)
	{
		tempCurrentRecord->Valid = 1;  //slot available, insert the record 
		//io.AOAstiTimer();              // enable timer interrupt		
		tempCurrentRecord->ArrivalTime = Time;
		tempCurrentRecord->PktSize = PkSize;
		tempCurrentRecord->PktType = Pktype;
		temp =(char*)tempCurrentRecord->BufferAddress;
		for(int i=0; i<PkSize ; i++)
		{
        	  temp[i] = ETData[i]; //store packet in memory 		    
		}
	   
        
            return tempRecordNo;
     	}
	else
    	{
//	    io.AOAstiTimer();	 
	    tempRecordNo++;
	    tempCurrentRecord++;
	    if(tempRecordNo >= NoEsTableRecords)
	    {
		tempRecordNo =0;  //circular list
		tempCurrentRecord = (ESRecord*)ESTableBase;
	    }
	    if(tempRecordNo == CurrentRecordNumber)
	    {
		RecordFoundFlag =1;//table is full 	
	//	io.AOAPrintText("End   Insert",960);  	
	io.AOAPrintText ("estable:insert: TempRecodNo is same as CurrentRecordNumber", Line2);
		return -3;	
	    }
	}//end of else
    } //End of while
           // should never come here! 
    	  //  io.AOAPrintText("End   Insert",960);  	 
	io.AOAPrintText ("End of While Error", Line2);
	    return -2; 
};
	
//************************************************************
// Get will return the record for Processing and it will return the record number
//************************************************************
int ESTable::get(long *Data,int *PkSize,int *Pktype,long *Time)
{
    
    ESRecord *tempCurrentRecord;
    char *temp = 0;
    int tempRecordNo = CurrentRecordNumber;
    tempCurrentRecord = CurrentRecord;
    int RecordFoundFlag =0;// 1 - Means Record not found
    while(RecordFoundFlag !=1)
    {
	//io.AOAcliTimer();	
    	if(tempCurrentRecord->Valid == 1)
	{
		tempCurrentRecord->Valid = 2;
		
	//	io.AOAstiTimer();
		
		*Time = tempCurrentRecord->ArrivalTime;
		*PkSize= tempCurrentRecord->PktSize;
		*Pktype = tempCurrentRecord->PktType;
		*Data =tempCurrentRecord->BufferAddress;
		CurrentRecordNumber = ++tempRecordNo;	
		if(tempRecordNo >= NoEsTableRecords)
	    	{
			CurrentRecordNumber =0; //circular list 
			CurrentRecord = (ESRecord*)ESTableBase;
			io.AOAPrintText ("estable:get: tempRecodNo is greater than no of records", Line1);
			return NoEsTableRecords -1;
		}
		CurrentRecord = (ESRecord*)(++tempCurrentRecord);
			io.AOAPrintText ("                                                      ", Line1);
	 	
		return tempRecordNo-1;
     	}
	else
    	{
	  //  io.AOAstiTimer();	
	    tempRecordNo++;
	    tempCurrentRecord++;
	    if(tempRecordNo >= NoEsTableRecords)
	    {
		tempRecordNo =0;   //circular list 
		tempCurrentRecord = (ESRecord*)ESTableBase;
	    }
	    if(tempRecordNo == CurrentRecordNumber)
	    {
		RecordFoundFlag =1;//table is empty 	
		return -2;  //empty return code 	
	    }

	}//end of else
    }//End of while
	    return -2;  
    return 0;
};
//*********************************************************************************************
// This will delete the Record in the ESTable and Make the Record available for another Entry
//*********************************************************************************************
int ESTable::remove(int RecordNumber)
{
    ESRecord *ptr;
    ptr = (ESRecord*)(ESTableBase + (RecordNumber * sizeof(ESRecord)));
    ptr->Valid = 0;
    return 0;
};

