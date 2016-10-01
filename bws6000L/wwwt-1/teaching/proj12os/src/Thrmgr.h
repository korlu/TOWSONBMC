//****************************************************************
// FileName:   ThreadManager.h
// Purpose:    This is the class definition for the ThreadManager Class.
//*****************************************************************
#ifndef THREADMANAGER_H
#define THREADMANAGER_H

// System include files
#include <vector>

// User include files
#include "Thread.h"

// Class definiton begins here
class ThreadManager {

public:

   //**********************************************************
   //   Method:   Constructor
   //   Purpose:  Creates a new ThreadManager class
   //   Inputs:
   //      None
   //   Returns:
   //      Thread       A new ThreadManager class
   //**********************************************************
   ThreadManager();

   //**********************************************************
   //   Method:   Constructor
   //   Purpose:  Destroys and cleans up a Thread Manager
   //   Inputs:
   //      None
   //   Returns:
   //      None
   //**********************************************************
   virtual ~ThreadManager();

   //**********************************************************
   // Method:	CreateRootThread
   // Purpose:  Creates the parent thread
   // Inputs:
   //    name	name of the parent thread
   // Returns:
   //    int	thread id of the parent thread created
   //**********************************************************
   int CreateRootThread(std::string name);

   //**********************************************************
   // Method:	CreateThread
   // Purpose:  Creates a child thread
   // Inputs:
   //    parentId	id of the parent of the thread to create
   //    name		name of the child thread
   // Returns:
   //    int		thread id of the thread created
   //**********************************************************
   int CreateThread(int parentId, std::string name);

   //**********************************************************
   // Method:	TerminateThread
   // Purpose:  Terminates a thread and cleans up memory
   // Input
   //	threadId	the id of the thread
   // Returns
   //   int		0 on success, -1 on failure
   //**********************************************************
   int TerminateThread(int threadId);
 
   //**********************************************************
   // Method:	GetThreadState
   // Purpose:  Returns enumeration indicating thread state
   // Input
   //	threadId	the id of the thread
   // Returns
   //    StateEnum      an enumeration indicating thread state
   //**********************************************************
   StateEnum GetThreadState(int threadId);

   //**********************************************************
   // Method:	GetThreadStateString
   // Purpose:  Returns a string indicating thread state
   // Input
   //	threadId	the id of the thread
   // Returns
   //    std::string    string indicating thread state
   //			"" will be return on invalid threadId
   //**********************************************************
   std::string GetThreadStateString(int threadId);

   //**********************************************************
   // Method:	GetThreadId
   // Purpose:  Returns thread id of the given named thread
   // Input
   //    name	name of the thread
   // Returns
   //    int    thread id of the thread
   //**********************************************************
   int GetThreadId(std::string name);

   //**********************************************************
   // Method:	GetThreadName
   // Purpose:  Returns the name of a thread
   // Input
   //	threadId	the id of the thread
   // Returns
   //   std::string	name of the thread
   //**********************************************************
   std::string GetThreadName(int threadId);

   //**********************************************************
   // Method:	SendMessage
   // Purpose:  Sends a message from one thread to another
   // Input
   //   sendingThread	thread id of the sending thread
   //   receivingThread	thread id of the receiving thread
   //   message		message to send
   // Returns
   //   int		0 on success, -1 on failure
   //**********************************************************
   int SendMessage(int sendingThread, int receivingThread, std::string message);

   //**********************************************************
   // Method:	StartThread
   // Purpose:  Starts a thread's work
   // Input
   //	threadId	the id of the thread
   // Returns
   //   int		0 on success, -1 on failure
   //**********************************************************
   int StartThread(int threadId);

   //**********************************************************
   // Method:	PauseThread
   // Purpose:  Pauses a thread that is working
   // Input
   //	threadId	the id of the thread
   // Returns
   //   int		0 on success, -1 on failure
   //**********************************************************
   int PauseThread(int threadId);

   //**********************************************************
   // Method:	ResumeThread
   // Purpose:  Resumes a thread's work that was paused
   // Input
   //	threadId	the id of the thread
   // Returns
   //   int		0 on success, -1 on failure
   //**********************************************************
   int ResumeThread(int threadId);

   //**********************************************************
   // Method:	StopThread
   // Purpose:	Stop's a thread's work
   // Input
   //	threadId	the id of the thread
   // Returns
   //   int		0 on success, -1 on failure
   //**********************************************************
   int StopThread(int threadId);
 
   //**********************************************************
   // Method:	ReturnNoOfThreads
   // Purpose:	Returns the current number of threads
   // Input
   //   None
   // Returns
   //	int	the number of threads
   //**********************************************************
   int ReturnNoOfThreads();

   //**********************************************************
   // Method:	PrintAllThreads
   // Purpose:	Prints information about all threads including:
   //		   -thread id
   //		   -thread name	
   //		   -current state
   //		   -parent's id
   // Input
   //   ofstream	the output stream to print to
   // Returns
   //   None
   //**********************************************************
   void PrintAllThreads(std::ostream& out);

   //**********************************************************
   // Method:	PrintThreadInfo
   // Purpose:	Prints information about a thread including:
   //		    -thread id
   //		    -thread name	
   //		    -current state
   //		    -parent's id
   // Input
   //   ofstream	the output stream to print to
   //   threadID	id of the thread to pause
   // Returns
   //   int		0 on success, -1 on failure
   //**********************************************************
   int PrintThreadInfo(std::ostream& out, int threadId);


protected:
   //**********************************************************
   // Method:	PrintThreadHeader
   // Purpose:	Prints a Header for printing Thread info 
   // Input
   //   ofstream	the output stream to print to
   // Returns
   //   None
   //**********************************************************
   void PrintThreadHeader(std::ostream& out);

   //**********************************************************
   // Method:	PrintOneThread
   // Purpose:	Prints the information for one thread 
   // Input
   //   ofstream	the output stream to print to
   //   name		name of the thread
   //	threadId	the id of the thread
   //   parentId        the id of the thread's parent
   //   state		the state of the thread
   // Returns
   //   None
   //**********************************************************
   void PrintOneThread(std::ostream& out, std::string name, int threadId,
                       int parentId, std::string state);

private:

   // Maintain the threads in a vector. The thread id will be the index
   // into the vector. This will allow for constant access time.
   std::vector<Thread> threads;

   //**********************************************************
   // Method:   IdInRange
   // Purpose:  Determines if a thread is in the valid range of
   //		0 to numThreads - 1 
   // Input
   //   id	a thread id
   // Returns
   //	bool	true if in range, false otherwise
   //**********************************************************
   bool IdInRange(int id);

   //**********************************************************
   // Method:   IdIsActive
   // Purpose:  Determines if a thread is active or not.
   //           Active means the state is not TERMINATED.
   // Input
   //   id	a thread id
   // Returns
   //	bool	true if active, false otherwise
   //**********************************************************
   bool IdIsActive(int id);

};

#endif
