//cirlist.h filename
#ifndef __WCirList__
#define __WCirList__
//*******************************************************************
//Towson University Copyright 2006
//Coded by R.K.Karne, Sandeep Girumala, Dated Feb 23, 2006  
// Circular List 
// InPtr points to the insert list 
// OutPtr points to the remove list 
// Size is the size of the list (1000) 
// InPtr = OutPtr, the list is empty 
// (InPtr+1) mod Size = OutPtr, then it is full 
//*******************************************************************
#include "../INTERFACES/AOAProtected.h"

class WCirList
{
    private:
	static long base;
	// This variable holds the base address of the records  
	
	static long size;
	// The size of the toal space allocated for records 

	static int InPtr;  //Input Poiter for the Circular List 
	static int OutPtr; //Output Pointer for the Circular List 

	AOAProtected io;

    public:
	
	//structure of the circular list 
	struct ESRecord 
	{	
	   long Valid;    //record entry is valid or not
	   long TaskId;   //TaskId 
	   long WDelay;    //Delay 
	   long WState;   //State of the task 
	   //32 bits total; each 4 bits represent a state 
	   // you could have a total of 8 transitions starting from bit 31 
	   //  01234567 shows 0->1->2->3->4->5->6->7
	   int WTCBRNo;
	   long WTimer;
	};

	static ESRecord *InRecord; 
	static ESRecord *OutRecord; 

    public:

	// This function initializes the object Globally
	// This function must be called only once for a program
        int init(long base, long size);
	
	// Insert inserts the Record into the ESTable and returns the Record number in the Table 
	int insert(long taskid, long delayc, long statec, int tcbrnoc, long timerc);
	
	// Get will return the record for Processing and it will return the record number
	//  it will also remove the packet from the circular list
	int get(long *taskid, unsigned int *delayc, long *statec, int *tcbrnoc, long *timerc);

	//check if the list is empty 
	int empty(); //returns 1 if it is empty 

	//check if the list is full 
	int full(); //returns 1 if it is full 
	
	int getCount(); 	

	int printlist(int lineno); 
};
#endif

