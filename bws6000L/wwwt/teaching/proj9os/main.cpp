///////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////  Main/Test Program  (main.cpp) ///////////////////////////////
	
#include <iostream>
#include "threadMgmt.h"

using namespace std;

void RootProc (LPVOID);
void Child1Proc (LPVOID);
void Child2Proc (LPVOID);
void GrandChildProc (LPVOID);

int main() 
{ 
	Thread rootThread;						// Root Thread

	// Create root thread 
	if (rootThread.ThreadCreate (RootProc) == NULL)
	{
		cout << "Root Thread creation is error!" << endl;
		return 1;
	}
	
   return 0; 
} 

//*********************************************************************************************
// Root thread procedure

void RootProc (LPVOID Arg) 
{ 
	Thread* pthread = (Thread*) Arg;

	cout << "Root: I'm Root thread..." << endl
		 << "I'm created successfully!" << endl
		 << "My thread ID is: " << pthread->GetThreadID() << endl;
	
	cout << "Total number of threads we have now (including myself) is: "
		 << pthread->GetNoOfThread() << endl;
	
	cout << "After create my children, I will sleep for a while."
		 << endl << endl;

	// Create two children
	if (pthread->ThreadCreate(Child1Proc) == NULL)
	{
		cout << "Child Thread 1 creation is error!" << endl;
		return;
	}

	if (pthread->ThreadCreate(Child2Proc) == NULL)
	{
		cout << "Child Thread 2 creation is error!" << endl;
		return;
	}

	// Root thread suspend for 5 seconds
	pthread->ThreadSuspend(5000);

	cout << "I'm the root again, let me check how many threads we have" << endl
		 << "after I took my rest: " << endl
		 << "Right now we have: " << pthread->GetNoOfThread() << endl << endl;

	cout << "I tested my thread class successfully. See you next time!" << endl;

}

//**********************************************************************************************
// Child 1 thread procedure

void Child1Proc (LPVOID Arg)
{
	char *id1, *id2;				// Msg ids for msgs to Child and Grandchild threads

	Thread *pthread = (Thread*) Arg;

	cout << "Child 1: In Root's Child thread 1..." << endl
		 << "I'm created successfully!" << endl
		 << "My thread ID is: " << pthread->GetThreadID() << endl;
		
	id1 = "msg 1";
	id2 = "msg 2";

	pthread->SendMessage(id1, pthread->GetThreadID());
	pthread->SendMessage(id2, pthread->GetThreadID());	
	cout << "I sent a message to my child and my sister." << endl << endl;

	// Create Grandchild thread
	if (pthread->ThreadCreate(GrandChildProc) == NULL)
	{
		cout << "GrandChild Thread creation is error!" << endl;
		return;
	}
}

//**********************************************************************************************
// Child 2 thread procedure

void Child2Proc (LPVOID Arg)
{
	char *id;						// Msg id for msg from child1
	int  msg = 0;					// Message

	Thread *pthread = (Thread*) Arg;

	cout << "Child 2: In Root's Child thread 2..." << endl
		 << "I'm created successfully!" << endl
		 << "My thread ID is: " << pthread->GetThreadID() << endl;		 

	pthread->SetPriority(THREAD_PRIORITY_LOWEST);	

	cout << "My priority is: " << pthread->GetPriority() << endl;
	
	id = "msg 2";
	pthread->GetMessage(id, msg);
	cout << "I got the message from my sister: " << endl;
	if (msg == -1)
		cout << "There is no message what I want." << endl << endl;
	else
		cout << "My sister ID is: " << msg << endl << endl;

	cout << "I finished my job, and I have to quit." << endl << endl;
	pthread->ThreadTerminate();
}

//**********************************************************************************************
// GrandChild thread Procedure

void GrandChildProc (LPVOID Arg)
{
	char *id;						// Msg id for msg from Child 1
	int  msg = 0;					// Message

	Thread *pthread = (Thread*) Arg;

	cout << "Grandchild: In Root's Grandchild thread..." << endl
		 << "I'm created successfully!" << endl
		 << "My thread ID is: " << pthread->GetThreadID() << endl;

	id = "msg 1";
	pthread->GetMessage(id, msg);
	cout << "I got the message from my parent: " << endl;
	if (msg == -1)
		cout << "There is no message what I want." << endl << endl;
	else
		cout << "My parent ID is: " << msg << endl << endl;

}


