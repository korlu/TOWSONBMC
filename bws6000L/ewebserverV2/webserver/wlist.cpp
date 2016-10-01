//******************************************************
// This is WList.cpp file 
//******************************************************
#include"wlist.h"
// The Static Variable definition starts here

long WList::base = 0; //base 

long WList::size = 0;  //no of entries in the list  

//****************************************************************************************
// This function initializes the object Globally
// This function must be called only once for a program
// This function Returns Error Details
//****************************************************************************************
int WList::init(long inpbase, long inpsize)
{
	base = inpbase; //x0220BF40 - 00110000
	size = inpsize; //1000

	TraceRecord *TRecordPtr;

	for(int i=0; i < size; i++)
	{
	    TRecordPtr = (TraceRecord*)(base + ( i * sizeof(TraceRecord)));
	    TRecordPtr->Valid = 0;
	    TRecordPtr->TaskId =0; 
	    TRecordPtr->WState =0; 
	    TRecordPtr->WTCBRNo =0; 
	    TRecordPtr->WPMaxTime =0; 
  	    TRecordPtr->WSCount =0; 
  	    TRecordPtr->WTimer =0; 
	 }
	return 0;
}

//****************************************************************************************
// reset
//****************************************************************************************
int WList::reset(long id)
{
  TraceRecord *TRecordPtr;
  TRecordPtr = (TraceRecord*)(base + id * sizeof(TraceRecord));
 
  TRecordPtr->Valid = 0;
  TRecordPtr->TaskId =0; 
  TRecordPtr->WState =0; 
  TRecordPtr->WTCBRNo =0; 
  TRecordPtr->WPMaxTime =0; 
  TRecordPtr->WSCount =0; 
  TRecordPtr->WSTime = io.AOAgetTimer(); 
  TRecordPtr->WTimer = 0;

  return 0;
}

//**************************************************************************************
// insert
//**************************************************************************************
int WList::insert(long id, int tcbrno, int value, int maskindex)
{
    int cstate=0;
    TraceRecord *TRecordPtr;

    TRecordPtr = (TraceRecord*)(base + id * sizeof(TraceRecord));

    TRecordPtr->Valid = 1;
    TRecordPtr->TaskId = id;
    TRecordPtr->WTCBRNo = tcbrno;
    TRecordPtr->WPTime = io.AOAgetTimer() - TRecordPtr->WSTime;
    if (TRecordPtr->WPTime > TRecordPtr->WPMaxTime)
       {
        TRecordPtr->WPMaxTime = TRecordPtr->WPTime; 
       }
    
    switch(maskindex)
    {
	case 1:
		cstate = (TRecordPtr->WState & 0x0fffffff) | value;
		break;
	case 2:
		cstate = (TRecordPtr->WState & 0xf0ffffff) | value;
		break;
	case 3:
		cstate = (TRecordPtr->WState & 0xff0fffff) | value;
		break;
	case 4:
		cstate = (TRecordPtr->WState & 0xfff0ffff) | value;
		break;
	case 5:
		cstate = (TRecordPtr->WState & 0xffff0fff) | value;
		break;
	case 6:
		cstate = (TRecordPtr->WState & 0xfffff0ff) | value;
		break;
	case 7:
		cstate = (TRecordPtr->WState & 0xffffff0f) | value;
		break;
	case 8:
		cstate = (TRecordPtr->WState & 0xfffffff0) | value;
		break;
    }

    TRecordPtr->WState = cstate;
		
    return 0;  //good return 
};

//**************************************************************************************
// insert (dummy function for debugging)
//**************************************************************************************
int WList::insert(long id, int value)
{
    int tempval=0;
    TraceRecord *TRecordPtr;
    TRecordPtr = (TraceRecord*)(base + id * sizeof(TraceRecord));

    if(value == 1)
    {
       TRecordPtr->WTimer = io.AOAgetTimer();
    }
    if(value == 2)
    {
       tempval = TRecordPtr->WTimer;
       TRecordPtr->WTimer = io.AOAgetTimer() - tempval;
    }
    if(value == 0)
    {
    tempval = TRecordPtr->WSCount;
    tempval++;
    TRecordPtr->WSCount = tempval;
    }		
    return 0;  //good return 
};

//****************************************************************************************
// get 
//****************************************************************************************
int WList::get(long *taskid, long *statec, int *tcbrnoc)
{
    TraceRecord *TRecordPtr;

    TRecordPtr = (TraceRecord*)(base + *taskid * sizeof(TraceRecord));

    TRecordPtr->Valid = 0;
    *taskid = TRecordPtr->TaskId;
    *statec = TRecordPtr->WState;
    *tcbrnoc = TRecordPtr->WTCBRNo;

   return 0;   //good return 
};
//-----------------------------------------------------------------------------------------------------------
// print list 	
//-----------------------------------------------------------------------------------------------------------
int WList::printlist(int lineno)
{   
  int count1; 
  TraceRecord *TRecordPtr;
  int taskid = 0; 
  int statec = 0;
  int tcbrnoc = 0;
  int i=0, j=0, k=0;

  for(i=lineno; i < lineno+320; i++) 
    {
     io.AOAprintCharacter(' ', i);
     i++;
    }

  for(i=9,k=0; i <109; i++) 
    {
     TRecordPtr = (TraceRecord*)(base + i * sizeof(TraceRecord));			    
     
     if(TRecordPtr->Valid == 1)
     {
       taskid = TRecordPtr->TaskId;
       statec = TRecordPtr->WState;
       tcbrnoc = TRecordPtr->WTCBRNo;

       io.AOAprintHex(taskid, lineno+k*160+j*20); 
       io.AOAprintHex(statec, lineno+k*160+(j+1)*20); 
       io.AOAprintHex(TRecordPtr->WPTime, lineno+k*160+(j+2)*20); 
       io.AOAprintHex(TRecordPtr->WSCount, lineno+k*160+(j+3)*20); 
       io.AOAprintHex(TRecordPtr->WTimer, lineno+k*160+(j+4)*20); 
       //j = j + 5; 
       j = 0; 
       k++;
     }
    }

  return 0; 
}; 




