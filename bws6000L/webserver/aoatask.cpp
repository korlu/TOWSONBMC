/*
 * AOATask.cpp
 * Implimentation file of class AOATask
 */
//--------------------------------------------------------------------------------------------------------------

#include "../INTERFACES/aoaprotected.h"
#include "aoatask.h"

int AOATask::TaskId = 0;
long AOATask::App1TSSPtr=0;	//Prototype TSS in memory to be copied by the create task
long AOATask::TSSBase=0;	//Base of TSS Segments in Memory
long AOATask::StackBase=0;	//Base of TSS Segments in Memory
int AOATask::TSSSize=0;	// Size of TSS Refer value of App1TSSLen in PRCYCLE.LST
long AOATask::SchBase=0;	// Base of scheduler initialized in InitTasks
long AOATask::SchStack=0;	// Stack of scheduler initialized in InitTasks
long AOATask::TimerBase=0;	// Base of the Timer inititlized in init timer
long AOATask::TimerStack=0;// Stack of Timer initialized in runTimer
int AOATask::TSSFlag=0;   // Timer TSS flag 0 or 1  
int AOATask::RunSch_Flag = 0; // This flag is used to start the scheduler

//-----------------------------------------------
AOATask::AOATask(){
	version = 1;
	//App1TSSPtr has the address 02000000 which has the TSS in mempry
	//02000000 - 00110000 = 01EF0000
	App1TSSPtr = 0x01EF0000; //when 0011 0000 is added,it is 0200 0000h
	TSSSize    = TSS_SIZE;       //8 bytes for descriptor and 112 bytes for TSS 
	SchedulerPeriod = 0;     //how frequently the scheduler is invoked in Timer Task 
	IDTEntry08H     = 0x0098015B;     //IDT HTimer Entry values 
	IDTEntry08L     = 0x00008F00;     // Save them here before they are changed to Timer Task  

}
//------------------------------------------------------------------------------
//  Swap TSS for Timer Task 
//  We use two TSS for timer, these are toggled each time a timer inteerupt 
//   comes and invokes the routine
//   The Timer code is in the application in C++ program 
//   Thus, two taskids are used 1 and 2 for timer which occupies two TSSs 
//  Flip the TSS flag 
//  set the GDT pointer pointing to next TSS 
//  Recreate the TSS for the TASK_ID corresponding to the flag 
//  when next time timer comes, it will use the alternate TSS 
//  no changes in the prcycle routine for this trick 
//  - flip the flag 
//  - if flag is 0 then select TSS 0 else TSS 1
//-----------------------------------------------------------------------------
int AOATask::AOAswapTSS(){

	char temp1, temp2;
	long *tempTSSPtr;
	tempTSSPtr=(long*) &temp1;
	long desch, descl;	
	long TSS_Ptr = 0;	//Temp pointer to calculate the Address of TSS
	long	Task_ID =0;
	long   *tempcp_ptr=0;	
	char *temp_TaskTSSPtr;//Temp Destination TSS Pointer pointing to the USer defined task space	
 if (TSSFlag == 0)
	{
	TSSFlag =1;
	Task_ID =2;

	temp_TaskTSSPtr = &temp2;	
	
	AOAcreateTask(TimerBase,TimerStack, Task_ID, 0);
	
	TSS_Ptr=0;
	TSS_Ptr = TSSBase + (Task_ID * TSSSize); 
	//Temp Destination TSS Pointer pointing to the USer defined task space
	temp_TaskTSSPtr = &temp2;
	temp_TaskTSSPtr =(char*)TSS_Ptr;
	tempTSSPtr =(long*)temp_TaskTSSPtr;
	desch = *tempTSSPtr++;
	descl=*tempTSSPtr;

	//GDT entry App1TSSS (29) is changed to point to a given task 
	//  by the setGDTEntry call 
	long GDTIndex = 30;
	long status =io.AOAsetGDTEntry(&desch,&descl,GDTIndex);
	}	
 else{
     	TSSFlag = 0;
	Task_ID =1;
	temp_TaskTSSPtr = &temp2;	

	AOAcreateTask(TimerBase,TimerStack, Task_ID, 0);

	TSS_Ptr=0;
	TSS_Ptr = TSSBase + (Task_ID * TSSSize); 
	//Temp Destination TSS Pointer pointing to the USer defined task space
	temp_TaskTSSPtr = &temp2;
	temp_TaskTSSPtr =(char*)TSS_Ptr;
	tempTSSPtr =(long*)temp_TaskTSSPtr;
	desch = *tempTSSPtr++;
	descl=*tempTSSPtr;

	//GDT entry App1TSSS (29) is changed to point to a given task 
	//  by the setGDTEntry call 
	long GDTIndex = 30;
	long status = io.AOAsetGDTEntry(&desch,&descl,GDTIndex); 
   }

 return 0; 

}
//--------------------------------------------------------------------------------------------------------
//This function will reinitialize the timer Task State Segment and GDT Descriptor 30 for the timer
//  not used at this point....
//--------------------------------------------------------------------------------------------------------
void AOATask::reinitializeTimer()
{
	char temp1, temp2;
	long *tempTSSPtr;
	tempTSSPtr=(long*) &temp1;
	long desch, descl;	
	long TSS_Ptr = 0;	//Temp pointer to calculate the Address of TSS
	long	Task_ID =1;
	long   *tempcp_ptr=0;	
	char *temp_TaskTSSPtr;//Temp Destination TSS Pointer pointing to the USer defined task space	

	Task_ID =0;

	temp_TaskTSSPtr = &temp2;	
	
	AOAcreateTask(TimerBase,TimerStack, Task_ID, 0);
	
	TSS_Ptr=0;
	TSS_Ptr = TSSBase + (Task_ID * TSSSize); 
	//Temp Destination TSS Pointer pointing to the USer defined task space
	temp_TaskTSSPtr = &temp2;
	temp_TaskTSSPtr =(char*)TSS_Ptr;
	tempTSSPtr =(long*)temp_TaskTSSPtr;
	desch = *tempTSSPtr++;
	descl=*tempTSSPtr;

	//GDT entry App1TSSS (30) is changed to point to a given task 
	//  by the setGDTEntry call 
	long GDTIndex = 30;
	long status = io.AOAsetGDTEntry(&desch,&descl,GDTIndex);
}
//---------------------------------------------------------------------------------------------------------
//This function will reinitialize the Scheduler Task State Segment and GDT Descriptor 29 for the Scheduler
//---------------------------------------------------------------------------------------------------------
void AOATask::reinitializeScheduler()
{	
	char temp1, temp2;
	long *tempTSSPtr;
	tempTSSPtr=(long*) &temp1;
	long desch, descl;	
	long TSS_Ptr = 0;	//Temp pointer to calculate the Address of TSS
	long	Task_ID =0;
	long   *tempcp_ptr=0;	
	char *temp_TaskTSSPtr;//Temp Destination TSS Pointer pointing to the USer defined task space	

	Task_ID =0;

	temp_TaskTSSPtr = &temp2;	
	
	AOAcreateTask(SchBase,SchStack, Task_ID, 0);
	
	TSS_Ptr=0;
	TSS_Ptr = TSSBase + (Task_ID * TSSSize); 
	
	//Temp Destination TSS Pointer pointing to the USer defined task space
	temp_TaskTSSPtr = &temp2;
	temp_TaskTSSPtr =(char*)TSS_Ptr;
	tempTSSPtr =(long*)temp_TaskTSSPtr;
	desch = *tempTSSPtr++;
	descl=*tempTSSPtr;

	//GDT entry App1TSSS (29) is changed to point to a given task 
	//  by the setGDTEntry call 
	long GDTIndex = 29;
	long status = io.AOAsetGDTEntry(&desch,&descl,GDTIndex);
}	
//------------------------------------------------
//calculates the TSS address in user memory 
// automatically based on taskid 
//------------------------------------------------
//
int AOATask::createTSSDescriptor(int Task_ID, int ehflag)
{

AOAProtected io; 
long status = 0; 
long desch=0;
long descl=0;

long TSS_Ptr;
TSS_Ptr = TSSBase + (Task_ID * TSSSize); 
long Base_Address = TSS_Ptr + 8 + 0x00110000;
long G_AVL_DPL_Attr = 0x0089;
long Seg_Limit_L  = 0x868;

long temp = Base_Address;

// 
//Formating Lower 4 bytes of the descriptor
descl = Base_Address & 0x00FF0000;
descl = descl>>16;
temp =0;
temp =	G_AVL_DPL_Attr;
temp = temp <<8;
descl = descl | temp;
temp =0;
temp = Base_Address & 0xFF000000;
descl = descl | (temp);
//AOAprintHex(descl,200);
//Formating the higher four bytes of the descriptor
desch = Seg_Limit_L;

temp =0;
temp = Base_Address & 0x0000FFFF;

desch = desch | (temp<<16);

char temp2,temp1;
long *tempTSSPtr;
tempTSSPtr=(long*) &temp1;
char *temp_TaskTSSPtr;

//Temp Destination TSS Pointer pointing to the USer defined task space
temp_TaskTSSPtr = &temp2;
temp_TaskTSSPtr =(char*)TSS_Ptr;
tempTSSPtr =(long*)temp_TaskTSSPtr;
*tempTSSPtr++=desch;
*tempTSSPtr=descl;
if (ehflag == 1)  //error handler task
  {
   //io.AOAprintHex(desch,320);
   //io.AOAprintHex(descl,340);
   //io.AOAprintHex(Task_ID,360);
   //io.AOAgetCharacter();
   // set the GDT entry witht he ErrorHandler function address to run as a task 
   //  TSS was already set for this 
   //  This task is disabled during normal operation by putting 0 in the Task_Status entry 
   //  INT 03ch is used to invoke this error handler as a task when error occurs 
   status = io.AOAsetGDTEntry(&desch,&descl,31); //GDTIndex = 31 (F8/8) App1TSSE
  }
return 0;
}
//------------------------------------------------
// RUN TASK 
//  uses the descriptor created and stored in user space 
//  it changes the GDT entry to point it to this task 
//  invokes APP1TSSC child task interrrupt 
//------------------------------------------------
int AOATask::AOArunTask(int Task_ID)
{
AOAProtected io;

char temp2,temp1;
long *tempTSSPtr;
tempTSSPtr=(long*) &temp1;
char *temp_TaskTSSPtr;

long desch, descl;

long TSS_Ptr;
TSS_Ptr = TSSBase + (Task_ID * TSSSize);

//Temp Destination TSS Pointer pointing to the USer defined task space
temp_TaskTSSPtr = &temp2;
temp_TaskTSSPtr =(char*)TSS_Ptr;
tempTSSPtr =(long*)temp_TaskTSSPtr;
//io.AOAprintHex((long)temp_TaskTSSPtr, 3900);	
desch = *tempTSSPtr++;
descl=*tempTSSPtr;

//GDT entry App1TSSC (28) is changed to point to a given task 
//  by the setGDTEntry call 

//io.AOAprintHex (desch, 2720);
//io.AOAprintHex (descl, 2740);

long GDTIndex = 0;
if(Task_ID == 0)  //scheduler 
{
GDTIndex = 29;
}
else             //APP1C 
{
GDTIndex = 28;
}

long status = io.AOAsetGDTEntry(&desch,&descl,GDTIndex);
TaskId = Task_ID;  //set Task ID in the io object  

TSS_Ptr = TSSBase + (Task_ID * TSSSize+36);
temp_TaskTSSPtr =(char*)TSS_Ptr;
tempTSSPtr =(long*)temp_TaskTSSPtr;
//io.AOAprintHex((long)temp_TaskTSSPtr, 3900);	
//desch = *tempTSSPtr; //Change the EFLAGS in the TSS
//desch = desch & 0xFFFFBFFF; // reset the NT Flag in the TSS
//*tempTSSPtr = desch ;

runTask(Task_ID);
return 0;	
}

//------------------------------------------------
// suspend task (for receive, send and interface tasks)
//------------------------------------------------
void AOATask::AOAsuspendTask()
{
  runTaskMain();
}

//------------------------------------------------
// suspend delay task (for http tasks only) 
//------------------------------------------------
void AOATask::AOAsuspendHTask(unsigned long delayw, long statec, int tcbrnoc, int currenttask)
{
  long sum=0; 
  
  if(delayw != 0)
  {
      sum = io.AOAgetTimer() + delayw; 
  }
  else
      sum = 0;

  if(cir.full() == 0)
  {
     cir.insert(currenttask, sum, statec, tcbrnoc, io.AOAgetTimer());
  }
  else
     io.AOAPrintText("aoatask:aoasuspendtask circular list is full", Line24);

     //stk.printstack(Line4, 16); 
     //cir.printlist(Line20); 
  
  runTaskMain();
}

//------------------------------------------------
// complete task 
//------------------------------------------------
void AOATask::AOAcompleteTask(int currenttask, int statec)
{

  if(stk.full() == 0)
  {
     stk.push(currenttask);
  }
  else
     io.AOAPrintText("aoatask:aoacompletetask stack is full", Line24);

     //stk.printstack(Line4, 16); 
     //cir.printlist(Line7); 
     //io.AOAprintHex(currenttask, Line19); 
     //io.AOAprintHex(statec, Line19+20); 
     //wlst.printlist(Line3);
  runTaskMain();
}

//-----------------------------------------------------------------------
// Initialize the TSSBase with the value ex. 0200 0000
// Create the TSS for the scheduler task at Task_ID 0
// Then change the GDT entry for the scheduler task
// Scheduler id is 0, Timer is 1, 2
//   3 is not used 
//-----------------------------------------------------------------------
int AOATask::AOAinitTasks(long* TSSBasePtr, long Stack_Ptr, long schfnaddr)
{
    int Task_ID = 0; 
	long desch, descl; 

  	TSSBase = (long)TSSBasePtr;   //store it in the task object, this is the base address for TSSs 
	StackBase = (long)Stack_Ptr; 

	//Create a TSS for the Main Task
	AOAcreateTask(schfnaddr,Stack_Ptr, 0, 0);
	
 	//Change the GDT Entry for the Scheduler int 0ebh
	char temp2,temp1;
	long *tempTSSPtr;
	tempTSSPtr=(long*) &temp1;
	char *temp_TaskTSSPtr;

	long TSS_Ptr;
	TSS_Ptr = TSSBase + (Task_ID * TSSSize); 

	//Temp Destination TSS Pointer pointing to the USer defined task space
	temp_TaskTSSPtr = &temp2;
	temp_TaskTSSPtr =(char*)TSS_Ptr;
	tempTSSPtr =(long*)temp_TaskTSSPtr;
	desch = *tempTSSPtr++;
	descl=*tempTSSPtr;

	//GDT entry App1TSSS (29) is changed to point to a given task 
	//  by the setGDTEntry call 
	long GDTIndex = 29;  //used for the scheduler
	long status = io.AOAsetGDTEntry(&desch,&descl,GDTIndex);
	
	// Initialize scheduler parameters in the static variables
	SchBase = schfnaddr;
	SchStack = Stack_Ptr;    // This will give both the base address of the scheduler 
				             // and the base address of the starting point of the stacks
	
	return 0;
}
//----------------------------------------------------------
//Start Tasks
//This function sets the RunSch_Flag to run the scheduler, the timer module in the application should check 
//this flag to run the scheduler
//It also sets the descriptors for IDT which points to F0 GDT entry, The GDT entry is written by the CreateTask
//Then this function will write the IDT entry in 08 in IDT Table position to start the timer module, which is
//written in the application.
//This also calls the int 08h to start the timer
//----------------------------------------------------------
void AOATask::AOArunTasks()
{
	
	RunSch_Flag =1; // Turn on the RunSch_Flag to start the scheduler
	// this will suspend the APP1Tss and invoke the tasks by starting timer interrupts
	long desch, descl; 
	desch = 0x00F00000; //Timer Task Entry in IDT  
	descl = 0x00008500;  //get this value from prcycle.lst 

	io.AOAgetIDTEntry (&IDTEntry08H, &IDTEntry08L, 8); //get the Timer Interrupt IDT entry 
	//  store the IDT entry values in the object for HTimer 
	io.AOAsetIDTEntry (&desch, &descl, 8);             //set the Timer Interrupt IDT entry 
	
	_asm
	{
		int 08h
	}
}

//---------------------------------------------------------------------------------
//Replace the APP1TSS pointer to the link field of Timer to return back
//---------------------------------------------------------------------------------
int AOATask::AOAapplink32()
{

	int Task_ID =1;

	char temp2,temp1;
	long *tempTSSPtr;
	tempTSSPtr=(long*) &temp1;
	char *temp_TaskTSSPtr;

	long TSS_Ptr;
	TSS_Ptr = TSSBase + (Task_ID * TSSSize) + 8;//Calculate the address of the TSS for task in memory 

	//Temp Destination TSS Pointer pointing to the USer defined task space
	temp_TaskTSSPtr = &temp2;
	temp_TaskTSSPtr =(char*)TSS_Ptr;
	tempTSSPtr =(long*)temp_TaskTSSPtr;
	*tempTSSPtr=0xC8;// Change the link field to point to the APP1Tss in GDT


	Task_ID = 2;
	TSS_Ptr = TSSBase + (Task_ID * TSSSize) + 8; //Calculate the address of the TSS for task in memory 	
	//Temp Destination TSS Pointer pointing to the USer defined task space
	temp_TaskTSSPtr =(char*)TSS_Ptr;
	tempTSSPtr =(long*)temp_TaskTSSPtr;
	*tempTSSPtr=0xC8; // Change the link field to point to the APP1Tss in GDT	

	Task_ID = 0;  //MainTask
	TSS_Ptr = TSSBase + (Task_ID * TSSSize) + 8; //Calculate the address of the TSS for task in memory 	
	//Temp Destination TSS Pointer pointing to the USer defined task space
	temp_TaskTSSPtr =(char*)TSS_Ptr;
	tempTSSPtr =(long*)temp_TaskTSSPtr;
	*tempTSSPtr=0xC8; // Change the link field to point to the APP1Tss in GDT	

	return 0;
//	return Cpapplink32();	
}

//----------------------------------------------------------
// Create the TSS for the scheduler task at Task_ID 0
// Then change the GDT entry for the scheduler task
// Create Timer Task in TSS Space the Timer Tasks ID is 1 and 2
// This also sets the GDT entry for the timer in the GDT F0
// Then it turns off the RunSch flag to switch off the scheduler
// RunSch flag will be turned on by the runtasks
//----------------------------------------------------------
int AOATask::AOArunTimer(long schfunaddress, long Sch_Stack_Ptr)
{
	int Task_ID = 1; //Timer TaskId = 1
  	int retcode = 0; 
	
	TimerBase = schfunaddress;
	TimerStack = Sch_Stack_Ptr;	
  
	//Create a TSS for the Timer Task
	AOAcreateTask(schfunaddress,Sch_Stack_Ptr, Task_ID, 0);
	
 	//Change the GDT Entry for the Timer int 08h
	char temp2,temp1;
	long *tempTSSPtr;
	tempTSSPtr=(long*) &temp1;
	char *temp_TaskTSSPtr;

	long desch, descl;

	long TSS_Ptr;
	TSS_Ptr = TSSBase + (Task_ID * TSSSize); 

	//Temp Destination TSS Pointer pointing to the USer defined task space
	temp_TaskTSSPtr = &temp2;
	temp_TaskTSSPtr =(char*)TSS_Ptr;
	tempTSSPtr =(long*)temp_TaskTSSPtr;
	desch = *tempTSSPtr++;
	descl=*tempTSSPtr;

	//GDT entry App1TSST (30) is changed to point to a given task 
	//  by the setGDTEntry call 
	long GDTIndex = 30;
	long status = io.AOAsetGDTEntry(&desch,&descl,GDTIndex);
	// Initialize Timer parameters in the Shared memory	 
	
	Task_ID = 2; //Timer TaskId = 1
  	retcode = 0; 
	TimerBase = schfunaddress;
	TimerStack = Sch_Stack_Ptr;	
  
	//Create a TSS for the Timer Task
	AOAcreateTask(schfunaddress,Sch_Stack_Ptr, Task_ID, 0);
	RunSch_Flag = 0;	
 	return 0;
}
//-----------------------------------------------------------------------
//create a task 
//  function address is the function pointer 
//  stackMEM_Ptr is the top of the stack for the task, no limit is set at this point 
//  taskid is the task id passed by the user, who maintains these ids 
//  for a given task, this call setup a TSS space in user memory w.r.t TSSBase 
//  all TSSs are consequently located in user space, user should be aware of this memory space 
//  each TSS is allocated 120 bytes + 8 bytes for the descriptor which is placed before the TSS 
//  a total of 120 bytes are required for each TSS+Desc 
//  first TSS will be at 0211 0000 given TSSBase of 0200 0000
//  second TSS will be at 0211 0408 and the third at 0211 0810 and so on 
//  the 8 byte descriptor is stored here so that when the task is run then it will be used 
//  to change the GDT entry to this descriptor 
//  App1TSSC GDT entry is used as a child entry for all tasks 
//-----------------------------------------------------------------------
int AOATask::AOAcreateTask(long Function_Address, long StackMEM_Ptr, int Task_ID, int ehflag) 
{
	char temp1, temp2;
	long TSS_Ptr = 0;	//Temp pointer to calculate the Address of TSS
	TSS_Ptr = TSSBase + (Task_ID * TSSSize);

	//Copy TSS from 02000000 to The user given TSS Space initialized in Init Tasks
		
	char *temp_TSSPtr;//temporary Source TSS pointer Pointing to 02000000h
	temp_TSSPtr = &temp1;
	temp_TSSPtr =(char*)App1TSSPtr;
	
	char *temp_TaskTSSPtr;//Temp Destination TSS Pointer pointing to the USer defined task space
	temp_TaskTSSPtr = &temp2;
	TSS_Ptr = TSS_Ptr+8;
	temp_TaskTSSPtr =(char*)TSS_Ptr;
	
	//Copying the TSS into the user defined TSS Space, which is initialized in initTasks();
	for(int i=0;i<TSSSize;i++)
	{
	 *temp_TaskTSSPtr++ = *temp_TSSPtr++;
	}
	temp_TaskTSSPtr = temp_TaskTSSPtr - TSSSize;   	
	long *tempcp_ptr;
	
	tempcp_ptr =(long*)(temp_TaskTSSPtr+32);	
	*tempcp_ptr  =Function_Address;	 //set function address in EIP 

	tempcp_ptr =(long*)(temp_TaskTSSPtr+56);		
	*tempcp_ptr  =(long)StackMEM_Ptr; //set stack pointer in ESP 	

	//Create GDT Descriptor Here
	// when ehflag = 1, it will create a descriptor for ErrorHandler 
	//   however, this task will not be run until invoked by an interrrupt 0ech
	createTSSDescriptor(Task_ID, ehflag);
	
	return 0;
} 

//---------------------------------------------------------------------------
// AOAprintTSS() prints the TSS given a task ID 
//---------------------------------------------------------------------------
void AOATask::AOAprintTSS(int Task_ID, int lineno)
{
	long descl; 
        AOAProtected io;
	int i, j; 
	int lcount = 0; 
	int linex = 0; 
	
	char temp2,temp1;
	long *tempTSSPtr;
	tempTSSPtr=(long*) &temp1;
	char *temp_TaskTSSPtr;

	long TSS_Ptr;
	TSS_Ptr = TSSBase + (Task_ID * TSSSize); 

	//Temp Destination TSS Pointer pointing to the USer defined task space
	temp_TaskTSSPtr = &temp2;
	temp_TaskTSSPtr =(char*)TSS_Ptr;
	tempTSSPtr =(long*)temp_TaskTSSPtr;
	descl=*tempTSSPtr;

	i = 0; 
	j = 0; 
	lcount = 0; 
	linex = lineno; 
	for (i = 0; i < 32; i++)
	  {
	    io.AOAprintHex(descl, linex + j*18); 
	    tempTSSPtr = tempTSSPtr + 1; //4byte long values  
	    j = j + 1; 
	    lcount = lcount + 1; 
	    if (lcount == 8) 
	      {
		lcount = 0; 
		j = 0; 
		linex = linex + 160; 
	      }
	    descl = *tempTSSPtr;
	  }
}
