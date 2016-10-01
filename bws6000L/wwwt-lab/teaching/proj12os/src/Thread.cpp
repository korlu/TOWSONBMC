//**********************************************************
//	FileName:	Thread.cpp
//	Date:		07/21/03
//	Purpose:	This class encapsulates information for a
//			thread. It contains information such as
//			the thread id, the thread's parent id,
//			the thread's name and the thread's
//			current state.
//
//			This Thread class was designed such that
//			it is managed by a parent application. 
//			Therefore the parent application should
//			provide their own convention to assign
//			the Id of a thread.
//
//**********************************************************

// System include files
#include <iostream>
#include <signal.h>	/* kill() */
#include <unistd.h>	/* fork() */

// User defined include files
#include "Thread.h"


//**********************************************************
//   Method:   Constructor
//   Purpose:  Initializes a new thread class
//   Inputs:
//     id	the id of this thread
//     parent	the id of the parent thread
//     name	name of this thread
//   Returns
//     Thread	A new thread class
//**********************************************************
Thread::Thread(int id, int parent, std::string name)
:threadId(id), parentId(parent), threadName(name)
{
   // Initial state of a thread is READY
   threadState = READY;

   // Simulate a new thread by forking
   processId = fork();

   // Put in a dummy program into the child process
   // In furture release, this can be improved to actually
   // do something useful. Maybe the user can pass in an 
   // executable to use.
   if (processId == 0)
   {
      execlp("./DummyProgram", "DummyProgram", NULL);
   }
}

//**********************************************************
//   Method:   Destructor
//   Purpose:  Cleans up before thread is destroyed
//   Inputs:
//      None
//   Returns
//      None
//**********************************************************
Thread::~Thread()
{
}

//**********************************************************
//   Method:   ReceiveMessage
//   Purpose:  Receives a message sent from another thread.
//	 	This method will also print a message with
//		this thread's id, the sending thread's
//		id and the message sent.
//   Inputs:
//      sendingThread	the id of the sending thread
//      message		the message being sent
//   Returns
//      None
//**********************************************************
void Thread::ReceiveMessage(int sendingThread, std::string message)
{
   // Indicate to the user which thread received a message and
   // which thread sent this message.
   std::cout << "Thread #" << threadId << " received message from Thread #";
   std::cout << sendingThread << ":" << std::endl;
   std::cout << "\t" << message << std::endl;
}

//**********************************************************
//   Method:   SetThreadState
//   Purpose:  Sets the thread to a particular state.
//   Inputs:
//      newState	type StateEnum
//			indicates the new state of the thread
//   Returns
//      None
//**********************************************************
void Thread::SetThreadState(StateEnum newState)
{
   threadState = newState;
}

//**********************************************************
//   Method:   GetThreadState
//   Purpose:  Returns the current state of this thread.
//   Inputs:
//      None
//   Returns
//      StateEnum	the current state of this thread
//**********************************************************
StateEnum Thread::GetThreadState()
{
   return threadState;
}

//**********************************************************
//   Method:   GetThreadName
//   Purpose:  Returns the name of this thread.
//   Inputs:
//      None
//   Returns
//      std::string	the name of this thread
//**********************************************************
std::string Thread::GetThreadName()
{
   return threadName;
}

//**********************************************************
//   Method:   GetThreadId
//   Purpose:  Returns the id of this thread.
//   Inputs:
//      None
//   Returns
//      int	the id of this thread
//**********************************************************
int Thread::GetThreadId()
{
   return threadId;
}

//**********************************************************
//   Method:   GetParentId
//   Purpose:  Returns the parent id of this thread.
//   Inputs:
//      None
//   Returns
//      int	the parent id of this thread
//**********************************************************
int Thread::GetParentId()
{
   return parentId;
}

//**********************************************************
//   Method:   TerminateThread
//   Purpose:  Kills the thread and sets the appropriate state 
//   Inputs:
//      None
//   Returns
//      None
//**********************************************************
void Thread::TerminateThread ()
{
   // Kill this thread using the kill command
   kill(processId,SIGTERM);

   // Change the state of this thread
   threadState = TERMINATED;
}

//**********************************************************
//   Method:   PauseThread
//   Purpose:  Pauses a thread and sets the appropriate state 
//   Inputs:
//      None
//   Returns
//      None
//**********************************************************
void Thread::PauseThread()
{
   // We are only simulating the pausing of the thread,
   // not actually pausing any work associated with a thread
   // This could be an enhancement in the future.
   threadState = WAITING;
}

//**********************************************************
//   Method:   ResumeThread
//   Purpose:  Resumes the work of a paused thread 
//   Inputs:
//      None
//   Returns
//      None
//**********************************************************
void Thread::ResumeThread()
{
   // Simulating the resumption of the thread
   // This could be an enhancement in the future.
   threadState = READY;
}

//**********************************************************
//   Method:   GetThreadStateString
//   Purpose:  Returns the state of a thread in the
//		form of a string.
//   Inputs:
//      None
//   Returns
//      std::string	the state of this thread
//**********************************************************
std::string Thread::GetThreadStateString()
{
   std::string state;

   // Determine which state this thread is in and return
   // an appropriate string.
   switch(threadState)
   {
      case READY:
        state = "READY";        
        break;
      case RUNNING:
        state = "RUNNING";        
        break;
      case WAITING:
        state = "WAITING";        
        break;
      case TERMINATED:
        state = "TERMINATED";  
        break;
      default:
        state = "INVALID";
	break;
   }

   // Return the string
   return state;
}
