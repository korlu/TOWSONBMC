//******************************************************
// This is WCirList.cpp file 
//******************************************************
#include"wcirlist.h"
// The Static Variable definition starts here

long WCirList::base = 0; //base 

long WCirList::size = 0;  //no of entries in the list  

int WCirList::InPtr = 0;
int WCirList::OutPtr = 0;

WCirList::ESRecord* WCirList::InRecord = 0;
WCirList::ESRecord* WCirList::OutRecord = 0;

//****************************************************************************************
// This function initializes the object Globally
// This function must be called only once for a program
// This function Returns Error Details
//****************************************************************************************
int WCirList::init(long inpbase, long inpsize)
{
	InPtr = 0; //initialize all static variables 
        OutPtr = 0;

	base = inpbase; //x0220BF40 - 00110000
	size = inpsize; //1000
	ESRecord *ESRecordPtr;

	//initialize in and out ptrs to the base value of record memory 
	//that is, they both pointing to the same record In = Out = 0, empty now 
	//
	InRecord = (ESRecord*)base;
	OutRecord = (ESRecord*)base;

        //all the records are initialized with appropriate buffer address 
	// and all other fields are initialized to zero 
	// the buffer address will be never modified again 
	for(int i=0; i < size; i++)
	{
	    ESRecordPtr = (ESRecord*)(base + ( i * sizeof(ESRecord)));
	    ESRecordPtr->Valid =0; 
	    ESRecordPtr->TaskId =0;
	    ESRecordPtr->WDelay = 0;
	    ESRecordPtr->WState = 0;
	    ESRecordPtr->WTCBRNo = 0;
	    ESRecordPtr->WTimer = 0;
	 }
	return 0;
}
//**************************************************************************************
// Insert inserts the Record into the ESTable and returns the error code 0 if successful 
//  user should check appropriate error conditions 
//   - 1 valid bit set 
//  user should check for this valid bit error 
//  user should check for full condition before insert operation 
//**************************************************************************************
int WCirList::insert(long id, long delay1, long state, int tcbrno, long timerc)
{
    ESRecord *tempCurrentRecord;
    ESRecord *ESRecordPtr;

    tempCurrentRecord = InRecord; //In record  

    	if(tempCurrentRecord->Valid == 0)
	{
         	tempCurrentRecord->Valid = 1;    //insert  
		tempCurrentRecord->TaskId = id;
		tempCurrentRecord->WDelay = delay1;
		tempCurrentRecord->WState = state;
		tempCurrentRecord->WTCBRNo = tcbrno;
		tempCurrentRecord->WTimer = timerc;

		InPtr = InPtr + 1;   //update the pointer
		if(InPtr >= size)
		{
                  InPtr=0;
		}

	        ESRecordPtr = (ESRecord*)(base + InPtr * sizeof(ESRecord));
		//next record 
		InRecord = ESRecordPtr; 

	}
	else
    	{
	io.AOAPrintText("ERROR:Cirlist:Insert: Valit Bit is Set:",Line22);
        io.AOAprintHex((long)tempCurrentRecord, Line23+60); 
        io.AOAprintHex(tempCurrentRecord->Valid, Line23+80); 
        io.AOAprintHex(InPtr, Line24+100); 
        io.AOAprintHex(OutPtr, Line24+120); 
	return -1; //should never happen 	
        }

	return 0;  //good return 
};
	
//****************************************************************************************
// get function 
// The return code will be 0 if successful, otherwise 
//  -1 valid bit is not set error  
//****************************************************************************************
int WCirList::get(long *taskid, unsigned int *delayc, long *statec, int *tcbrnoc, long *timerc)
{
    ESRecord *tempCurrentRecord;
    ESRecord *ESRecordPtr;

     tempCurrentRecord = OutRecord; 

    	if(tempCurrentRecord->Valid == 1)
	{
		tempCurrentRecord->Valid = 0;
		*taskid= tempCurrentRecord->TaskId;
		*delayc = tempCurrentRecord->WDelay;
		*statec= tempCurrentRecord->WState;
		*tcbrnoc = tempCurrentRecord->WTCBRNo;
		*timerc = tempCurrentRecord->WTimer;

		OutPtr = OutPtr + 1;   //update the pointer		
		if(OutPtr >= size)
		{
	           OutPtr=0;
		}
		//next record 
		ESRecordPtr = (ESRecord*)(base + OutPtr * sizeof(ESRecord));
		OutRecord = ESRecordPtr;  

     	}
	else
    	{
	io.AOAPrintText("ERROR:Cirlist:get: Valit Bit is reset:",Line22);
        io.AOAprintHex((long)tempCurrentRecord, Line23+60); 
        io.AOAprintHex(tempCurrentRecord->Valid, Line23+80); 
        io.AOAprintHex(InPtr, Line24+100); 
        io.AOAprintHex(OutPtr, Line24+120); 
	return -1;  
	//valid bit is not set 	
	}

   return 0;   //good return 
};
//*********************************************************************************************
//return 1 if it is empty 
//*********************************************************************************************
int WCirList::empty()
 {
  int retcode = 0; 

  if (InPtr == OutPtr) 
    retcode = 1;    //empty 
  else retcode = 0; //not empty   

  return retcode;  
 };
//*********************************************************************************************
//return 1 if it is full 
//*********************************************************************************************
int WCirList::full()
 {
  int retcode = 0; 

  if ((InPtr + 1) % size == OutPtr) 
    retcode = 1; //full  
  else retcode = 0; //not full  

  return retcode; 
 };

//-----------------------------------------------------------------------------------------------------------
// get circular list count	
//-----------------------------------------------------------------------------------------------------------
int WCirList::getCount()
{   
    if(InPtr >= OutPtr)
	return (InPtr-OutPtr);
   else
        return( size - (OutPtr-InPtr));
};
//-----------------------------------------------------------------------------------------------------------
// print circular list 	
//-----------------------------------------------------------------------------------------------------------
int WCirList::printlist(int lineno)
{   
  int count1; 
  ESRecord *tempCurrentRecord;
  int taskid = 0; 
  int statec = 0;
  int outptr1 = OutPtr;
  int j=0,k=0;

  count1 = getCount(); 
  tempCurrentRecord = OutRecord; 

  for(int i=lineno; i < lineno+320; i++) 
    {
     //io.AOAprintCharacter(' ', i);
     i++;
    }

  io.AOAprintHex(count1, Line3+140); 

  for(i=0; i <count1; i++) 
    {
     tempCurrentRecord = (ESRecord*)(base + outptr1 * sizeof(ESRecord));     
     taskid= tempCurrentRecord->TaskId;     
     statec = tempCurrentRecord->WState;
     io.AOAprintHex(taskid, lineno+j*320+k*20); 
     io.AOAprintHex(statec, lineno+j*320+160+k*20); 
     if(i%7 == 0 && i!= 0) 
     {
	k = 0;		     
        j++;
     }
     k++;
     outptr1++;     
    }
  return 0; 
}; 




