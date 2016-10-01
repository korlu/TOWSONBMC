#include "thashIndex.h"
#include"../Interfaces/AOAprotected.h"
// static variables are declared here
long TcphashIndex::TcpnoIndexRecords; // The number of record hash table is indexing
unsigned long TcphashIndex::TcphashBaseAddress; // This denotes the base address of the hash table

//*******************************************************************
//  initialize all entries in the hash table with -1 
//   it returns 1000*4 = 4000 size of the hash table  
//*******************************************************************
int TcphashIndex::init(long noRecords, unsigned long baseAddress)
{

 TcpnoIndexRecords=noRecords;
 TcphashBaseAddress=baseAddress;
 hashRecord *temp;
 temp=(hashRecord *)TcphashBaseAddress; 

 for(int i=0;i<noRecords; i++)
 {
     temp[i].First=-1;
 }
 
 return noRecords*sizeof(hashRecord);

}
//*******************************************************************
// takes IP and Port No and adds all bits and generates a hash value 
//   and mods with 1000 so that the value will never exceed 1000
//   this value will not execeed 1000 which is used as an index 
//   to the hash table 
//   Many IP and Port combinations may map to the same hash value 
//   The linked list to find these mappings are stored in TCB table 
//*******************************************************************
long TcphashIndex::hashfun(char *ip,char *port)
{
	long hashValue=0;
	hashValue=hashValue + (ip[0]&0xFF);
	hashValue=hashValue + (ip[1]&0xFF);	
	hashValue=hashValue + (ip[2]&0xFF);	
	hashValue=hashValue + (ip[3]&0xFF);	
	hashValue=hashValue + (port[0]&0xFF); 
	hashValue=hashValue + (port[1]&0xFF);	
	return (hashValue%TcpnoIndexRecords); //never exceeds 1000 for example 
}

//*******************************************************************
//*******************************************************************
long TcphashIndex::get(char *ip, char *port)
{
long hashValue=hashfun(ip,port);
hashRecord *temp;
temp=(hashRecord *)TcphashBaseAddress;
return temp[hashValue].First;
}
	
//*******************************************************************
//*******************************************************************
long TcphashIndex::setIndex(long hashValue, long hashAddress)
{
hashRecord *temp;
temp=(hashRecord *)TcphashBaseAddress;
temp[hashValue].First=hashAddress;
return 0;
}
	
//*******************************************************************
// gets the value stored in the hash table with hashvalue as an 
//  index to the table 
//*******************************************************************
long TcphashIndex::getIndex(long hashValue)
{
hashRecord *temp;
temp=(hashRecord *)TcphashBaseAddress;
	return (temp[hashValue].First);
}

