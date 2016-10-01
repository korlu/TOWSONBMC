//******************************************************
// This is WStack.cpp file 
//
// Stacks starts at a lower address and grows towards higher address
//   ------------  
//top|          |  0x00000000
//   ------------
//   |          |
//   ------------
//   |          |
//   ------------
//   |          |  0xffffffff
//   ------------
//******************************************************
#include "wstack.h"
// The Static Variable definition starts here

long WStack::base = 0; //base 

long WStack::size = 0;  //no of entries in the list  

long WStack::count = 0;  //no of entries in the list  

WStack::ESRecord* WStack::top = 0;
//****************************************************************************************
// This function initializes the object Globally
// This function must be called only once for a program
// This function Returns Error Details
//****************************************************************************************
int WStack::init(long inpbase, int inpsize)
{
					
	base = inpbase; //x0220BF40 - 00110000
	size = inpsize; //1000 maximum 
	ESRecord *ESRecordPtr;

	top = (ESRecord*)base;

        //all the records are initialized with appropriate buffer address 
	// and all other fields are initialized to zero 
	// the buffer address will be never modified again 
	for(int i=0; i < size; i++)
	{
	    ESRecordPtr = (ESRecord*)(base + ( i * sizeof(ESRecord)));
	    ESRecordPtr->TaskId = 0;
	 }
	count = 0; //initial, maintain a count in the stack  
	return 0;
}

//**************************************************************************************
// push
//**************************************************************************************
int WStack::push(int id)
{

    ESRecord *tempCurrentRecord;

    tempCurrentRecord = top;

    //tempCurrentRecord->Timer = timer;
    tempCurrentRecord->TaskId = id;

    top = top + 1; 
    count = count + 1; //increment  

    return 0;  //good return 
};

//**************************************************************************************
// pop
//**************************************************************************************
int WStack::pop(int *id)
{

    ESRecord *tempCurrentRecord;

    tempCurrentRecord = top - 1;

    *id = tempCurrentRecord->TaskId;

    top = tempCurrentRecord; 

    count = count - 1; //decrement count  
    return 0;  //good return 
};

//*********************************************************************************************
//return 1 if it is empty 
//*********************************************************************************************
int WStack::empty()
 {
  int retcode = 0; 
  ESRecord *t1;
  t1 = top;
  ESRecord *t2;
  t2 = (ESRecord*)(base);
  
  if (t1 == t2) 
  {
    retcode = 1;    //empty 
  }
  else retcode = 0; //not empty   

  return retcode;  
 };
//*********************************************************************************************
//return 1 if it is full 
//*********************************************************************************************
int WStack::full()
 {
  int retcode = 0; 
  ESRecord *t1;
  t1 = top;
  ESRecord *t2;
  t2 = (ESRecord*)(base + size * sizeof(ESRecord));

  if (t1 == t2) 
    retcode = 1; //full  
  else retcode = 0; //not full  

  return retcode; 
 };
//*********************************************************************************************
//print stack
//*********************************************************************************************
int WStack::printstack(int lineno, int count)
 {
 int i = 0; 
 ESRecord *t1;
 int id = 0; 
 
 t1 = top;

 
  for(i=lineno; i < lineno+320; i++) 
    {
     io.AOAprintCharacter(' ', i);
     i++;
    }
  
 for (i = 0; i < count; i++)
   {
    id = t1->TaskId;
    io.AOAprintHex(id,lineno+i*20);  
    t1 = t1 - 1 ; 
   }

  return 0; 
 };
