//****************************************************************
// FileName:   Thread.h
// Purpose:    This is the class definition for the Thread Class.
//*****************************************************************
#ifndef THREAD_H
#define THREAD_H

// System include files
#include <string>

// Enumeration for Thread States
typedef enum {
        INVALID = -1,
	READY,
	RUNNING,
	WAITING,
	TERMINATED
} StateEnum;

// Class definiton begins here
class Thread {

public:

   //**********************************************************
   //	Method:   Constructor
   //	Purpose:  Initializes a new thread class
   //	Inputs:
   //	   id		the id of this thread
   //	   parent	the id of the parent thread
   //	   name		name of this thread
   //	Returns
   //	   Thread	A new thread class
   //**********************************************************
   Thread(int id, int parent, std::string name);

   //**********************************************************
   //	Method:   Destructor
   //	Purpose:  Cleans up before thread is destroyed
   //	Inputs:
   //	   None
   //	Returns
   //	   None
   //**********************************************************
   virtual ~Thread();

   //**********************************************************
   //	Method:   ReceiveMessage
   //	Purpose:  Receives a message sent from another thread.
   //		This method will also print a message with
   //		this thread's id, the sending thread's
   //		id and the message sent.
   //	Inputs:
   //	   sendingThread	the id of the sending thread
   //	   message		message being sent
   //	Returns
   //	   None
   //**********************************************************
   void ReceiveMessage(int sendingThread, std::string message);

   //**********************************************************
   //	Method:   SetThreadState
   //	Purpose:  Sets the thread to a particular state.
   //	Inputs:
   //	   newState	type StateEnum
   //			indicates the new state of the thread
   //	Returns
   //	   None
   //**********************************************************
   void SetThreadState(StateEnum newState);
	
   //**********************************************************
   //	Method:   GetThreadState
   //	Purpose:  Returns the current state of this thread.
   //	Inputs:
   //	   None
   //	Returns
   //	   StateEnum	the current state of this thread
   //**********************************************************
   StateEnum GetThreadState(); 

   //**********************************************************
   //	Method:   GetThreadName
   //	Purpose:  Returns the name of this thread.
   //	Inputs:
   //	   None
   //	Returns
   //	   std::string	the name of this thread
   //**********************************************************
   std::string GetThreadName();

   //**********************************************************
   //	Method:   GetThreadId
   //	Purpose:  Returns the id of this thread.
   //	Inputs:
   //	   None
   //	Returns
   //	   int	the id of this thread
   //**********************************************************
   int GetThreadId();

   //**********************************************************
   //	Method:   GetParentId
   //	Purpose:  Returns the parent id of this thread.
   //	Inputs:
   //	   None
   //	Returns
   //	   int	the parent id of this thread
   //**********************************************************
   int GetParentId();

   //**********************************************************
   //	Method:   TerminateThread
   //	Purpose:  Kills the thread
   //	Inputs:
   //	   None
   //	Returns
   //	   None
   //**********************************************************
   void TerminateThread();

   //**********************************************************
   //	Method:   PauseThread
   //	Purpose:  Temporarily stops the thread 
   //	Inputs:
   //	   None
   //	Returns
   //	   None
   //**********************************************************
   void PauseThread();

   //**********************************************************
   //	Method:   ResumeThread
   //	Purpose:  Resumes a paused thread 
   //	Inputs:
   //	   None
   //	Returns
   //	   None
   //**********************************************************
   void ResumeThread();

   //**********************************************************
   //	Method:   GetThreadStateName
   //	Purpose:  Returns the thread state in the form
   //		of a string, suitable for printing.
   //	Inputs:
   //	   None
   //	Returns
   //	   std::string	the state of the thread
   //**********************************************************
   std::string GetThreadStateString();

protected:

private:

   // The id of this thread's parent
   int parentId;

   // The id of this thread
   int threadId;

   // The id of the process
   int processId;

   // This thread's name
   std::string threadName;

   // This thread's current state
   StateEnum threadState;
};

#endif
