#ifndef __thashIndex__
#define __thashIndex__
#include "../INTERFACES/aoaprotected.h"

class TcphashIndex
{
    private:
	AOAProtected io; 
	static long TcpnoIndexRecords; // The number of record hash table is indexing
	static unsigned long TcphashBaseAddress; // This denotes the base address of the hash table
	struct hashRecord
	{
	long First;
	};
    public:
	int init(long noRecords, unsigned long baseAddress);
	long hashfun(char *ip, char *port);
	long get(char *ip, char *port);
	long setIndex(long hashValue, long hashAddress);
	long getIndex(long hashValue);	

};


#endif
