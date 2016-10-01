//******************************************************
// This is WTTrace.cpp file 
//******************************************************
#include"wttrace.h"
// The Static Variable definition starts here

int WTTrace::base = 0; //base 
int WTTrace::size = 0;  //no of entries in the list  

//****************************************************************************************
// This function initializes the object Globally
// This function must be called only once for a program
// This function Returns Error Details
//****************************************************************************************
int WTTrace::init(int inpbase, int inpsize)
{
    TraceRecord *TRecordPtr;
	
    base = inpbase; //x0220BF40 - 00110000
	size = inpsize; //1000

	for(int i=0; i < size; i++)
	{
	    TRecordPtr = (TraceRecord*)(base + ( i * sizeof(TraceRecord)));
	    TRecordPtr->trace = 0;
	 }
	return 0;
};
//**************************************************************************************
// insert
//**************************************************************************************
int WTTrace::insert(int index, unsigned short mask)
{
    unsigned short value = 0; 

    TraceRecord *TRecordPtr;
    TRecordPtr = (TraceRecord*)(base + index * sizeof(TraceRecord));

    if (mask == TASK_MASK_INSERT) 
        value = 0x0000;  //reset the flags   
    else 
        value = TRecordPtr->trace; //original value 
    value = value | mask; //set the bit by using mask  
    TRecordPtr->trace = value; //store the value back 
    
    return 0;  //good return 
};
//**************************************************************************************
// reset
//**************************************************************************************
int WTTrace::reset(int index, unsigned short mask)
{
    unsigned short value = 0; 
    unsigned short mask1 = 0; 

    TraceRecord *TRecordPtr;
    TRecordPtr = (TraceRecord*)(base + index * sizeof(TraceRecord));

    value = TRecordPtr->trace; //original value 
    mask1 = ~mask;    //invert the mask bits   
    value = value & mask1; //set the bit by using mask  
    TRecordPtr->trace = value; //store the value back 
    
    return 0;  //good return 
};
//**************************************************************************************
// get
//**************************************************************************************
unsigned short WTTrace::get(int index)
{
    TraceRecord *TRecordPtr;
    TRecordPtr = (TraceRecord*)(base + index * sizeof(TraceRecord));

    return TRecordPtr->trace; 
    
    return 0;  //good return 

}; 
