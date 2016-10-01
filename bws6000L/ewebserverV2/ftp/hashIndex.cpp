#include "hashIndex.h"
#include"../INTERFACES/AOAprotected.h"
// static variables are declared here
long HttphashIndex::HttpnoIndexRecords; // The number of record hash table is indexing
unsigned long HttphashIndex::HttphashBaseAddress; // This denotes the base address of the hash table
int HttphashIndex::init(long noRecords, unsigned long baseAddress)
{

 HttpnoIndexRecords=noRecords;
 HttphashBaseAddress=baseAddress;
 return noRecords*sizeof(hashRecord);

}

long HttphashIndex::hashfun(char *name, int size)
{
long hashValue=0;
char temp;
	if(size<1)
	{	
	return -1;
	}
for(int i=0; i<size;i++)
{
    temp=name[i];
	
    	if(temp>0x5A)
	{
    	temp = temp-0x5A;
	}

hashValue=hashValue + (((long)temp)&0x000000FF);
}
return (hashValue%HttpnoIndexRecords);
}

char* HttphashIndex::get(char *name, int size)
{

long hashValue=hashfun(name,size);
hashRecord *temp;
temp=(hashRecord *)HttphashBaseAddress;

return (char*)temp[hashValue].First;
}

	
int HttphashIndex::setIndex(long hashValue, unsigned long hashAddress)
{
hashRecord *temp;
temp=(hashRecord *)HttphashBaseAddress;
	if(temp[hashValue].First==0x00)
	{
	temp[hashValue].First=hashAddress;
	return 0;	
	}
	else
	    return -1;

}
	
unsigned long HttphashIndex::getIndex(long hashValue)
{
hashRecord *temp;
temp=(hashRecord *)HttphashBaseAddress;
	return (temp[hashValue].First);
}
	 

