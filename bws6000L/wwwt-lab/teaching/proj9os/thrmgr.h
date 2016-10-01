////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////// Thread Specification (threadMgmt.h) /////////////////////////////////

#include <windows.h>
#include "Msg.h"

class Thread
{

 public:
	
	// Constructor
	Thread ();

	// Destructor
	~Thread();
	
	// Operations

	bool	ThreadCreate ( void* );
	
	bool	ThreadSuspend ();

	void	ThreadSuspend (int time);

	bool	ThreadResume ();

	void	ThreadTerminate();

	void	ThreadExit();

	void	SetPriority(int nLevel);

	char*	GetPriority();
	
	int		GetThreadID ();

	int		GetNoOfThread ();

	void	SendMessage (char* id, int msg);
		
	void	GetMessage (char* id, int& msg );


private:
	
		// Attributes

		HANDLE	m_hThread;			// Thread handle
		HANDLE	m_hEvent;			// Event handle 
		int		m_ThreadID;			// Contain the thread ID 
		int		m_count;			// The number of thread created
   		bool	m_bTerminate;		// The state of the thread terminated 
		bool	m_bSuspend;			// The state of the thread suspended 
		bool	m_bIsRunning;		// The state of the thread running 
		Msg		*head;				// A pointer points to the message queue

};	




