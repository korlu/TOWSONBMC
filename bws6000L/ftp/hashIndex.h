#ifndef __hashIndex__
#define __hashIndex__

class HttphashIndex{
    private:
	static long HttpnoIndexRecords; // The number of record hash table is indexing
	static unsigned long HttphashBaseAddress; // This denotes the base address of the hash table
	struct hashRecord
	{
	unsigned long First;
	};
    public:
	int init(long noRecords, unsigned long baseAddress);
	long hashfun(char *name, int size);
	char* get(char *name, int size);
	int setIndex(long hashValue, unsigned long hashAddress);
	unsigned long getIndex(long hashValue);	

};


#endif
