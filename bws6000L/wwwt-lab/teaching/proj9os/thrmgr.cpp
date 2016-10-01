////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////// Thread Implementation (threadMgmt.cpp) /////////////////////////////////

#include "threadMgmt.h"
#include <cstring>			// For strlen(), strcpy()



//-----------------------------------------------------------------------------
//
// Construction / Destruction
//
//-----------------------------------------------------------------------------

Thread::Thread ()
{
	m_hThread = NULL;
	m_ThreadID = 0;
	m_bTerminate = true;
	m_bSuspend = true;
	m_bIsRunning = false;
	m_hEvent = ::CreateEvent(NULL,FALSE,FALSE,NULL);  
	m_count = 0;
	head = NULL;
}



Thread::~Thread()
{
	ThreadTerminate ();
}


//----------------------------------------------------------------------------
//
// Function:		ThreadCreate
//
// Description:		This function creates a thread and begins executing it
//					immediately
//
// Input:			void function
//
// Returns:			bool
//
//----------------------------------------------------------------------------

bool Thread::ThreadCreate ( void* ThreadFunc)
{
	DWORD	m_dwThreadID;

	m_count ++;
	
	m_hThread = CreateThread(NULL, 0, (LPTHREAD_START_ROUTINE)ThreadFunc, 
							(LPVOID)this, 0, &m_dwThreadID);
	
	m_ThreadID = (int) m_dwThreadID;
	WaitForSingleObject(m_hThread, INFINITE);

	m_bIsRunning = true;
	m_bTerminate = false;
	m_bSuspend = false;
	
	// Check thread creation is successful or failed

	if(m_hThread != 0)
		return true;
	return false;

}


//----------------------------------------------------------------------------
//
// Function:		ThreadSuspend
//
// Description:		This function suspends the thread
//
// Input:			void
//
// Returns:			bool
//
//----------------------------------------------------------------------------
	
bool Thread::ThreadSuspend ()
{
	if(m_bTerminate)
		return false;
	if(m_bSuspend)
		return true;
	DWORD nRet = SuspendThread(m_hThread);
	
	// If suspend is failed
	if(nRet == 0xFFFFFFFF)
		return false;
	
	m_bSuspend = true;
	return true;
}


//----------------------------------------------------------------------------
//
// Function:		ThreadSuspend (time)
//
// Description:		This function suspends the thread for a certain time
//
// Input:			sleep time in milliseconds
//
// Returns:			void
//
//----------------------------------------------------------------------------
	
void Thread::ThreadSuspend (int time)
{

	Sleep (time);

}


//----------------------------------------------------------------------------
//
// Function:		ThreadResume
//
// Description:		This function resumes the thread
//
// Input:			void
//
// Returns:			bool
//
//----------------------------------------------------------------------------

bool Thread::ThreadResume ()
{
	if(m_bTerminate)
		return false;
	DWORD nRet = ResumeThread(m_hThread);
	
	// If resume thread is failed
	if(nRet == 0xFFFFFFFF)
		return false;
	m_bSuspend = false;
	return true;
}


//----------------------------------------------------------------------------
//
// Function:		ThreadTerminate
//
// Description:		This function terminates the thread
//
// Input:			void
//
// Returns:			void
//
//----------------------------------------------------------------------------

void Thread::ThreadTerminate()
{
	DWORD dwExitCode;	
	
	m_count --;
	
	GetExitCodeThread(m_hThread,&dwExitCode);
	
	if (STILL_ACTIVE == dwExitCode)
	{
		TerminateThread(m_hThread,dwExitCode);
		CloseHandle(m_hThread);
		m_hThread = NULL;
	}
	m_bIsRunning = false;
	m_bTerminate = true;

}


//----------------------------------------------------------------------------
//
// Function:		ThreadExit
//
// Description:		This function ends the thread
//
// Input:			void
//
// Returns:			void
//
//----------------------------------------------------------------------------


void Thread::ThreadExit()
{
	DWORD dwExitCode;
	
	m_count --;	
	
	GetExitCodeThread(m_hThread,&dwExitCode);
	if (STILL_ACTIVE == dwExitCode)
	{
		ExitThread(dwExitCode);
		CloseHandle(m_hThread);
		m_hThread = NULL;
	}
	m_bIsRunning = false;
	m_bTerminate = true;

}


//----------------------------------------------------------------------------
//
// Function:		SetPriority
//
// Description:		This function sets the priority of the thread
//
// Input:			int
//
// Returns:			void
//
//----------------------------------------------------------------------------

void Thread::SetPriority(int nLevel)	
{
	SetThreadPriority(m_hThread,nLevel); 
}


//----------------------------------------------------------------------------
//
// Function:		GetPriority
//
// Description:		This function gets the priority of the thread
//
// Input:			int
//
// Returns:			void
//
//----------------------------------------------------------------------------

char* Thread::GetPriority()
{
		
	switch (GetThreadPriority(m_hThread))
	{
		case 1:		return "THREAD_PRIORITY_ABOVE_NORMAL";
					break;

		case -1:	return "THREAD_PRIORITY_BELOW_NORMAL";
					break;
		
		case 2:		return "THREAD_PRIORITY_HIGHEST";
					break;
		
		case -15:	return "THREAD_PRIORITY_IDLE";
					break;
		
		case -2:	return "THREAD_PRIORITY_LOWEST";
					break;
		
		case 0:		return "THREAD_PRIORITY_NORMAL";
					break;
		
		case 15:	return "THREAD_PRIORITY_TIME_CRITICAL";
					break;
	
		default:	return "Error !";
	}

}


//----------------------------------------------------------------------------
//
// Function:		GetThreadID
//
// Description:		This function returns the thread id
//
// Input:			void
//
// Returns:			int
//
//----------------------------------------------------------------------------
	
int Thread::GetThreadID ()
{
	return m_ThreadID;
}


//----------------------------------------------------------------------------
//
// Function:		GetNoOfThread
//
// Description:		This function returns the thread id
//
// Input:			void
//
// Returns:			int
//
//----------------------------------------------------------------------------
	
int Thread::GetNoOfThread ()
{
	return m_count;
}


//----------------------------------------------------------------------------
//
// Function:		SendMessage
//
// Description:		This function places (posts) a message in the message queue 
//					of the specified thread and then returns without waiting 
//					for the thread to process the message. 
//
// Input:			char*, char*
//
// Returns:			void
//
//----------------------------------------------------------------------------

void Thread::SendMessage (char* id, int msg)
{
	Msg *p = new Msg;
	Msg *q = head;
		 
	p->msg_id = new char[strlen(id)+1];
	strcpy(p->msg_id, id);
	p->message = msg;
	
	if (head == NULL)				//If there is no message in the queue
	{
		head = q = p;
		head->link = NULL;
	}
	else
	{	
		while (q->link)
			q = q->link;
		q->link = p;
		q = p;
		p->link = NULL;
	}
}

//----------------------------------------------------------------------------
//
// Function:		GetMessage
//
// Description:		Retrieves a message from the calling thread's message 
//					queue and places it in the specified structure. 
//
// Input:			char for massage id
//
// Output:			char for massage 
//
//----------------------------------------------------------------------------

void Thread::GetMessage (char* id, int& msg )
{
	Msg *p, *q;
	
	q = head;

	if (!head )						// If no message in the queue 
	{
		msg = -1;
		return;
	}
	if (strcmp(q->msg_id, id)==0 )	// Check the first messge is match or not
	{
		msg = q->message;
		head = head->link;
		delete q;
		return;
	}
	
	p = q->link;					// Check the other msgs in the queue
	while ((p != NULL) && (strcmp(p->msg_id, id) != 0))
	{
		q = p;
		p = q->link;
	}
	if (strcmp(p->msg_id, id)== 0)
	{
		msg = p->message;
		q->link = p->link;
		delete p;
	}
	else
		msg = -1;

	

}

