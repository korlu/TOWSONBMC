//wlist.h filename
#ifndef __WList
#define __WList
//*******************************************************************
//Towson University Copyright 2006
//Coded by R.K.Karne, Sandeep Girumala, Dated Feb 23, 2006  
//*******************************************************************
#include "../INTERFACES/AOAProtected.h"

class WList
{
    private:
	static long base;
	
	static long size;

	AOAProtected io;

    public:
	
	struct TraceRecord 
	{	
	   long Valid;
	   long TaskId;   //TaskId 
	   long WState;   //State of the task 
	   //32 bits total; each 4 bits represent a state 
	   // you could have a total of 8 transitions starting from bit 31 
	   //  01234567 shows 0->1->2->3->4->5->6->7
	   int WTCBRNo;
	   long WSTime;  //timer
	   long WPTime;  //process time as of last insert  
	   long WPMaxTime;  //Max time  
	   long WSCount;  //number of times the task is scheduled  
	   long WTimer;
	};

    public:

        int init(long base, long size);

	int reset(long taskid);
	
	int insert(long taskid, int tcbrnoc, int value, int maskindex);
	
	int insert(long taskid, int value);
	
	int get(long *taskid, long *statec, int *tcbrnoc);

	int printlist(int lineno); 
};
#endif

