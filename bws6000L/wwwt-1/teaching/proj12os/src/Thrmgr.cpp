//**********************************************************
//      FileName:       ThreadManager.cpp
//      Date:           07/21/03
//      Purpose:        This class is a manager for the Thread
//			class. It provides an interface to 
//			individual threads as well as returns
//			information about the collection of
//			all the threads in this class.
//
//**********************************************************

// System include files
#include <iomanip>
#include <iostream>
#include <string>

// User include files
#include "ThreadManager.h"

// Local global variables
const int chunk = 80;	/* number of allocated Threads at a time */

//**********************************************************
//   Method:   Constructor
//   Purpose:  Initializes a new thread manager class
//   Inputs:
//     None
//   Returns
//     ThreadManager	A new thread manager class
//**********************************************************
ThreadManager::ThreadManager()
{
   threads.reserve(chunk);
}

//**********************************************************
//   Method:   Destructor
//   Purpose:  Cleans up before thread manager is destroyed
//   Inputs:
//      None
//   Returns
//      None
//**********************************************************
ThreadManager::~ThreadManager()
{
}

//**********************************************************
//   Method:   IdInRange 
//   Purpose:  Determines if id is a valid thread id
//             by checking it against a range.
//   Inputs:
//      id		a thread id
//   Returns
//      bool		true, if the id is valid
//			false, if the id is not valid
//**********************************************************
bool ThreadManager::IdInRange(int id)
{
   // Id is only valid if it is in the range of 0
   // to number of threads - 1
   if((id < -1) || (id > threads.size()))
      return false;
   return true;
}

//**********************************************************
//   Method:   IdIsActive
//   Purpose:  Determines if thread is active or not.
//             Thread is active if not in TERMINATED state.
//   Inputs:
//      id		a thread id
//   Returns
//      bool		true, if the thread is active
//			false, if the thread is not active
//**********************************************************
bool ThreadManager::IdIsActive(int id)
{
   // Thread is not active if in TERMINATED state
   if (threads[id].GetThreadState() == TERMINATED)
      return false;
   return true;
}

//**********************************************************
//   Method:   CreateRootThread
//   Purpose:  Creates the root thread for the manager
//             class. This is the parent for all other
//             threads created.	 
//   Inputs:
//      name		name for the root thread
//   Returns
//      int		-1 on failure, else the thread id
//**********************************************************
int ThreadManager::CreateRootThread(std::string name)
{
   if (name == "")
      return -1;

   return CreateThread(-1, name);
}

//**********************************************************
//   Method:   CreateThread
//   Purpose:  Creates a new thread. The thread must have a valid
//             parent id and a valid name.
//   Inputs:
//      parentid        thread id which will serve as the parent
//      name		name for the thread
//   Returns
//      int		-1 on failure, else the thread id
//**********************************************************
int ThreadManager::CreateThread(int parentId, std::string name)
{
   // Do some checks to make sure we can create a thread
   if (name == "")
   {
      // Don't allow a thread with no name
      return -1;
   }
   else if ((threads.size() == 0) && (parentId != -1))
   {
      // User had called CreateThread without calling CreateRootThread first
      return -1;
   }
   else if ((threads.size() > 0) && (parentId == -1))
   {
      // User has called CreateRootThread Twice
      return -1;
   }
   else if ((parentId != -1) && !IdInRange(parentId))
   {
      // User has sent in a parent that doesn't exist
      return -1;
   }
   else if (((threads.size() % chunk) == 0) && (parentId != -1))
   {
      // We have reached the capacity of the threads vector,
      // we need to allocate another chunk
      threads.reserve(threads.capacity() + chunk);
   }

   // Create a new thread and place it in the vector
   Thread thread(threads.size(), parentId, name);
   threads.push_back(thread);    	 

   // The thread id is the one less than the total number of threads
   return (threads.size() - 1);
}

//**********************************************************
//   Method:   TerminateThread
//   Purpose:  Terminates a thread. 
//   Inputs:
//      id		a thread id
//   Returns
//      int		-1 on failure, 0 on success
//**********************************************************
int ThreadManager::TerminateThread(int threadId)
{
   // Make sure threadId is in the proper range
   if (!IdInRange(threadId))
      return -1;

   // Terminate the thread
   threads[threadId].TerminateThread();
   return 0;
}

//**********************************************************
//   Method:   GetThreadId
//   Purpose:  Returns the name of the thread given an Id. 
//   Inputs:
//      threadName	name of a thread
//   Returns
//      int		-1 on failure, else thread id
//**********************************************************
int ThreadManager::GetThreadId(std::string threadName)
{
   // Iterate through the vector to find the thread
   // with the name given and return it's Id.
   std::vector<Thread>::iterator pos = threads.begin();
   while (pos != threads.end())
   {
      if (threadName == pos->GetThreadName())
         return pos->GetThreadId(); 
      ++pos; 
   } 

   // Could not find a thread with name given
   return -1;
}

//**********************************************************
//   Method:   GetThreadName
//   Purpose:  Returns the thread name given a thread Id.
//   Inputs:
//      int		id of a thread
//   Returns
//      std::string	name of a thread,
//			"" if invalid Id
//**********************************************************
std::string ThreadManager::GetThreadName(int threadId)
{
   // Just make sure threadId is in range. We will let the
   // user retrieve the name of terminated threads 
   if (!IdInRange(threadId))
      return "";

   // Return the thread's name
   return threads[threadId].GetThreadName();
}

//**********************************************************
//   Method:   GetThreadState
//   Purpose:  Returns the state of a thread.
//   Inputs:
//      int		id of a thread
//   Returns
//      StateEnum	enumeration indicating state of thread
//**********************************************************
StateEnum ThreadManager::GetThreadState(int threadId)
{
   // Make sure the threadId is valid. We will allow the user
   // to retrieve the state of a terminated thread.
   if (!IdInRange(threadId))
      return INVALID;

   // Return the thread state
   return threads[threadId].GetThreadState();
}

//**********************************************************
//   Method:   GetThreadStateString
//   Purpose:  Returns the state of a thread in the form
//             of a string.
//   Inputs:
//      int		id of a thread
//   Returns
//      std::string	state of this thread,
//                      "" if invalid thread id
//**********************************************************
std::string ThreadManager::GetThreadStateString(int threadId)
{
   // Make sure the threadId is valid. We will allow the user
   // to retrieve the state of a terminate thread.
   if (!IdInRange(threadId))
      return "";

   return threads[threadId].GetThreadStateString();
}

//**********************************************************
//   Method:   SendMessage
//   Purpose:  Sends a message from one thread to another 
//   Inputs:
//      sendingThread	id of the thread sending a message
//	receivingThread	id of the thread receiving a message
//	std::string	message being sent
//   Returns
//      int		-1 on failure, 0 on success
//**********************************************************
int ThreadManager::SendMessage(int sendingThread, int receivingThread, 
                               std::string message)
{
   // Make sure both the sending and receiving threads are in 
   // valid range and active
   if (!IdIsActive(sendingThread) || !IdIsActive(receivingThread) ||
       !IdInRange(sendingThread) || !IdInRange(receivingThread))
      return -1;

   // Send the message to the receiving thread
   threads[receivingThread].ReceiveMessage(sendingThread, message);
   return 0;
}

//**********************************************************
//   Method:   StartThread
//   Purpose:  Starts a thread's work
//   Inputs:
//      int		id of a thread
//   Returns
//      int		-1 on failure, 0 on success
//**********************************************************
int ThreadManager::StartThread(int threadId)
{
   // To start a thread, threadId must be active and not
   // be in a terminated state. Once terminated, thread cannot
   // be restarted.
   if (!IdIsActive(threadId) || !IdInRange(threadId))
      return -1;

   // For now we will call ResumeThread. In future releases
   // this method should do something more.
   threads[threadId].ResumeThread();
   return 0;
}

//**********************************************************
//   Method:   StopThread
//   Purpose:  Stops a thread's work
//   Inputs:
//      int		id of a thread
//   Returns
//      int		-1 on failure, 0 on success
//**********************************************************
int ThreadManager::StopThread(int threadId)
{
   // Make sure threadId is in range and is active
   if (!IdInRange(threadId) || !IdIsActive(threadId))
      return -1;

   // Right now we call PauseThread. In future releases more can
   // be done like killing any children threads, etc...
   PauseThread(threadId);
   return 0;
}

//**********************************************************
//   Method:   PauseThread
//   Purpose:  Pauses a thread's work
//   Inputs:
//      int		id of a thread
//   Returns
//      int		-1 on failure, 0 on success
//**********************************************************
int ThreadManager::PauseThread(int threadId)
{
   // Make sure threadId is in range and is active
   if (!IdInRange(threadId) || !IdIsActive(threadId))
      return -1;

   // Pause the thread
   threads[threadId].PauseThread();
   return 0;
}

//**********************************************************
//   Method:   ResumeThread
//   Purpose:  Resumes thread's work
//   Inputs:
//      int		id of a thread
//   Returns
//      int		-1 on failure, 0 on success
//**********************************************************
int ThreadManager::ResumeThread(int threadId)
{
   // Make sure threadId is in range and not in terminated state.
   // Once terminated, thread cannot be resumed.
   if (!IdInRange(threadId) || !IdIsActive(threadId))
      return -1;

   // Resume the thread
   threads[threadId].ResumeThread();
   return 0;
}

//**********************************************************
//   Method:   ReturnNoOfThread
//   Purpose:  Returns the number of threads in the manager 
//   Inputs:
//      None
//   Returns
//      int	the number of threads in the manager
//**********************************************************
int ThreadManager::ReturnNoOfThreads()
{
   return threads.size();
}

//**********************************************************
//   Method:   PrintThreadHeader
//   Purpose:  Prints a Header for printing out
//             thread information. 
//   Inputs:
//      std::ostream	a valid ostream class (e.g. cout)
//   Returns
//      None
//**********************************************************
void ThreadManager::PrintThreadHeader(std::ostream &out)
{
   out << std::setw(14) << "Thread Name" << std::setw(19) << "Thread Id";
   out << std::setw(14) << "Parent Id" << std::setw(17) << "Thread State";
   out << std::endl;
   out << std::setw(14) << "-----------" << std::setw(19) << "---------";
   out << std::setw(14) << "---------" << std::setw(17) << "------------";
   out << std::endl;
}

//**********************************************************
//   Method:   PrintOneThread
//   Purpose:  Prints thread information in the correct place
//             under the headers created in PrintThreadHeader.
//   Inputs:
//      std::ostream	a valid ostream class (e.g. cout)
//      name		name of this thread
//      threadId	the thred's id
//      parentId	the thread's parent id
//      state		state of the thread as a string
//   Returns
//      None
//**********************************************************
void ThreadManager::PrintOneThread(std::ostream &out,
                                   std::string name, int threadId,
                                   int parentId, std::string state)
{
   out << std::setw(14) << name;
   out << std::setw(16) << threadId;
   out << std::setw(14) << parentId;
   out << std::setw(19) << state;
   out << std::endl;
}

//**********************************************************
//   Method:   PrintAllThreads
//   Purpose:  Prints information about all threads in the manager
//             in a nice format.
//   Inputs:
//      std::ostream	a valid ostream class (e.g. cout)
//   Returns
//      None
//**********************************************************
void ThreadManager::PrintAllThreads(std::ostream &out)
{
   // Get an iterator to the first thread class
   std::vector<Thread>::iterator pos = threads.begin();

   // Print the header
   PrintThreadHeader(out);

   // Loop through all the threads and print out its information
   while (pos != threads.end())
   {
      PrintOneThread(out, pos->GetThreadName(), pos->GetThreadId(),
                     pos->GetParentId(), pos->GetThreadStateString());
      ++pos; 
   } 
}

//**********************************************************
//   Method:   PrintThreadInfo
//   Purpose:  Prints thread information about a single thread
//   Inputs:
//      std::ostream	a valid ostream class (e.g. cout)
//      threadId	the thred's id
//   Returns
//      int		0 on success, -1 on failure
//**********************************************************
int ThreadManager::PrintThreadInfo(std::ostream &out, int threadId)
{
   // Make sure thread is in valid range. We will allow user to
   // print info about a terminated thread.
   if (!IdInRange(threadId))
      return -1;

   // Print a Thread header
   PrintThreadHeader(out);

   // Print the information for this thread
   Thread thread = threads[threadId];
   PrintOneThread(out, thread.GetThreadName(), thread.GetThreadId(),
                  thread.GetParentId(), thread.GetThreadStateString());
   return 0;
}
