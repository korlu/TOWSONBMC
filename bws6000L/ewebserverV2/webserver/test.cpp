//-------------------------------------------------
//test.cpp file 
//-------------------------------------------------
//this program demonstrates the interfaces built to AO user 
// these interfaces are tested 
#include "../Interfaces/aoaprotected.h"
#include "apptask.h"
#include "aoatask.h"

//-------------------------------------------------
// Function address or Task address related Types  
//-------------------------------------------------
typedef void (apptask::*pmfd)(long);  //typedef for a member ptr 	

long *getFunctionPtr(pmfd);
			
//-------------------------------------------------
void main()
{
	AOAProtected io;
	apptask      first (4);	   // application task object 0, 1, 2 are reserved  
				   // starting task id is 4 
	AOATask      task;          // aoa task object  
	long Function_Address_Array[2];
    long descht, desclt;
	long Task_ID;
    int i=0; 

	//-------------------------------------------------------------
	// Function address or Task address related pointers   
    //-------------------------------------------------------------
    pmfd Function_Ptr_X = 0;          //pmfd type  
    //has pointer addresses to all functions or tasks  
	int GDT_Index=0;

	// Change the time interrupt interval
	io.AOAsetTimerPeriod(TIMER_PERIOD); // set timer period 1=55msec 2=55/2 msec 

	io.AOAdisableIRQCntlr(2,0x01);  //disable Real Time Clock Interrupts IRQ8 
	io.AOAdisableIRQCntlr(1,0x01);  //disable System Timer Interrupts IRQ0 Hardware Timer INT 08h 	

	// Get the IDT Table entry for the timer and store it so that later it can be restored
	io.AOAgetIDTEntry(&descht,&desclt, 8);

	//Main Task  
	Function_Ptr_X = &apptask::MainTask;     //initialize the ptr with a function main task  
	Function_Address_Array[0] = (long)getFunctionPtr(Function_Ptr_X); // store funtion ptr in an array
	//initialize task structures 	
	task.AOAinitTasks((long*)(TSS_ADDR - ADDR_OFFSET), STACK_ADDR, (long)Function_Address_Array[0]); 

	task.AOArunTask(0);
	
	io.AOAPrintText("Returned from main task, now in test.cpp", Line14+40); 	

	long time1 = io.AOAgetTimer();
	long desch, descl;
	//---------------------------------------------------------------------------
    //get IDT entry for timer interrupt and store it in local memory 	
	io.AOAgetIDTEntry(&desch,&descl, 8);
// 	You can change IDT entry and test it as follows 
//	io.AOAprintHex(desch, 1440);
//	io.AOAprintHex(descl, 1460);	
//	desch = 0x00F00000;
//	descl = 0x00008500;
//	task.AOAsetIDTEntry(&desch,&descl, 8);	
//	task.AOAgetIDTEntry(&desch,&descl, 8);
//	io.AOAprintHex(desch, 1480);
//	io.AOAprintHex(descl, 1500);		
    while (i++<100000) 
	{
	      io.AOAprintDecimal(i,Line14+20);
    }
	
	long time2 = io.AOAgetTimer();
	//io.AOAprintHex((time2-time1), 2800);
	//io.AOAprintString  ("End of Tasks: ",14, 2720);	
	// Restore IDT Entry for the timer so that it will use HTimer method in prcycle 
	io.AOAsetIDTEntry(&descht,&desclt, 8);
	
	io.AOAExit();
}

//-------------------------------------------------
long *getFunctionPtr(pmfd abc2)
{
//this approach uses xyz as a stack pointer to locate where the 
//  address of the function is stored 
AOAProtected io;
long v2;
long *ab1;
long *xyz;
pmfd abc1;                            //instance of a member ptr 
apptask first;                        //instance of a class 
xyz = (long *)&first;
abc1 = abc2;                  //initialize the ptr with a function 
xyz--;
ab1= (long*)*xyz;
return (long *)ab1;
}





