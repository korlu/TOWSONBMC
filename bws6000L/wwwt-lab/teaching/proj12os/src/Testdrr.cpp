#include <iostream>

#include "ThreadManager.h"

using namespace std;

int main()
{
   ThreadManager tm;

   int rootId = tm.CreateRootThread("Rooty");
   tm.PrintAllThreads(cout);

   tm.PauseThread(rootId);
   if (tm.PauseThread(10) == -1)
   {
      cout << "Invalid id!!!!!!" << endl;
   }

   tm.PrintThreadInfo(cout,rootId);

   tm.ResumeThread(rootId);
   if (tm.ResumeThread(4) == -1)
   {
      cout << "Invalid id!!!!!!" << endl;
   }

   tm.PrintAllThreads(cout);

   int child1 = tm.CreateThread(rootId,"Child1");
   int child2 = tm.CreateThread(rootId,"Child2");
   int gchildof2 = tm.CreateThread(child2,"GrandChildOf2");
   tm.PrintAllThreads(cout);

   cout << endl << endl;

   cout << "Thread Id of Child1: " << tm.GetThreadId("Child1") << endl;
   cout << "Thread Name of id #" << child2 << ": " << tm.GetThreadName(child2) << endl;

   cout << endl << endl;

   tm.SendMessage(rootId,child1,"I'm your father");
   if (tm.SendMessage(100,200,"Never going to see") == -1)
   {
      cout << "Invalid id!!!!!!" << endl;
   }


   tm.PauseThread(child2);
   tm.PrintThreadInfo(cout,child2);
 
   if (tm.PrintThreadInfo(cout,8) == -1)
   {
      cout << "Invalid id!!!!!!" << endl;
   }

   tm.StartThread(child2);
   tm.PrintAllThreads(cout);

   tm.StopThread(child2);
   if (tm.StopThread(786) == -1)
   {
      cout << "Invalid id!!!!!!" << endl;
   }

   cout << endl << endl;
   cout << "Number of threads: " << tm.ReturnNoOfThreads() << endl;
   tm.PrintAllThreads(cout);

   cout << "Enum: " << tm.GetThreadState(rootId) << endl;
   cout << "String: " << tm.GetThreadStateString(rootId) << endl;

   tm.TerminateThread(rootId);
   tm.TerminateThread(child1);
   tm.TerminateThread(child2);
   tm.TerminateThread(gchildof2);

   if (tm.TerminateThread(10973) == -1)
   {
      cout << "Invalid id!!!!!!" << endl;
   }

   if (tm.GetThreadState(10973) == -1)
   {
      cout << "Invalid id!!!!!!" << endl;
   }

   if (tm.GetThreadStateString(20973) == "")
   {
      cout << "Invalid id!!!!!!" << endl;
   }
  
   tm.PrintAllThreads(cout);

   return 0;
}
