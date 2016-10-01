#ifndef __aoatask__
#define __aoatask__

/*
 *	aoatask.h                      
 *	all task related interfaces are in this class object 
 *      include this class in aotask class 
*/
#include "../INTERFACES/AOAprotected.h"
#include "wcirlist.h"
#include "wstack.h"
#include "wlist.h"

extern "C"
{
	long runTask(long);// Run a task 
	void  runTaskMain();// Return to main task  
	long Cpapplink32();// link the timer task to APP1 TSS	
}
//External Variable Definitions

/*
 class AOATask
*/
class AOATask
{

private:

	int	version;	
	static long 	App1TSSPtr;	// Prototype TSS in memory to be copied by the create task
	static long	TSSBase;	// Base of TSS Segments in Memory e.g 0211 0000h
	static int	TSSSize;	// Size of TSS Refer value of App1TSSLen in PRCYCLE.LST
	static long	SchBase;	// Base Address of the scheduler

	static long	TimerBase;	// Base address of the Timer
	static long	TimerStack;	// Base address of the Timer	

	int     	createTSSDescriptor(int Task_ID, int flag);		
	long 		SchedulerPeriod; //how often the scheduler is invoked  
	AOAProtected io;
	WCirList cir;
	WStack stk;
	WList wlst;
public:

	static long	SchStack;	// Base Address of the scheduler		
	static long	StackBase;	// Base of Stack for all tasks e.g. 0400 0000h 
	static int 	RunSch_Flag;	
	static int 	TaskId;		// Task ID corresponds to the current task 
	static int	TSSFlag;       //  used to flip GDT entries to point to a different TSS (0,1) for timer
	long		IDTEntry08H;   //IDT Entry for the HTimer 
	long		IDTEntry08L;   //IDT Entry for the HTimer 
	//  interrupts. Task ID, 1 and 2 are used to do this 
	AOATask();					//constructor				
	int AOAapplink32();	
	int AOAinitTasks(long* TSSBasePtr, long Stack_Ptr, long addr);	
	int AOArunTimer (long schfunaddress, long Sch_Stack_Ptr);	
	void AOArunTasks ();		
	void reinitializeScheduler();	
	void reinitializeTimer();	
	int AOAcreateTask(long, long, int, int);     //create a task
	int AOArunTask(int Task_ID);		// Run a tasn	
 	int AOAswapTSS();				//Swap TSS for timer task (alternating)
	void AOAprintTSS(int taskid, int lineno);           //print TSS given a taskid 
	//in order to re-invoke timer task, we need to swap between two TSSs so that it does not 
	// result in an error 
 	void AOAsuspendTask();	
 	void AOAsuspendHTask(unsigned long delay, long statec, int tcbrnoc, int taskid);	
 	void AOAcompleteTask(int taskid, int statec);	
};



#endif
