//wttrace.h filename
#ifndef __WTTrace
#define __WTTrace
//*******************************************************************
//Towson University Copyright 2006
//Coded by R.K.Karne, Sandeep Girumala, Dated Feb 23, 2006  
//*******************************************************************
#include "../INTERFACES/AOAProtected.h"

class WTTrace
{
    private:
	static int base;
	static int size;

	AOAProtected io;

	struct TraceRecord 
	{	
        unsigned short trace;  //4 byte bit oriented trace flags 
	};

    public:

    int init(int base, int size);
	int insert(int index, unsigned short mask);
	int reset(int index, unsigned short mask);
	unsigned short get(int index);

};
#endif

