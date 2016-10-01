//wstack.h filename
#ifndef __WStack__
#define __WStack__
//*******************************************************************
//Towson University Copyright 2006
//Coded by R.K.Karne, Sandeep Girumala, Dated Feb 23, 2006  
// Stack 
//*******************************************************************
#include "../INTERFACES/AOAProtected.h"

class WStack 
{
    private:
	static long base;
	// This variable holds the base address of the records  
	
	static long size;
	// The size of the total space allocated for records 

	AOAProtected io;

    public:
	
	static long count;

	//structure of the stack 
	struct ESRecord 
	{	
	   int TaskId;   //TaskId 
	   //long Timer;   //Timer can be stored here 
	};

	static ESRecord *top; 

    public:

	// This function initializes the object Globally
	// This function must be called only once for a program
        int init(long base, int size);
	
	int push(int taskid);
	
	int pop(int *taskid);

	//check if the stack is empty 
	int empty(); //returns 1 if it is empty 

	//check if the stack is full 
	int full(); //returns 1 if it is full 

	int printstack(int lineno, int noOfElements); 

};
#endif

