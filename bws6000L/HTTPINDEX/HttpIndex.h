//cirlist.h filename
#ifndef __HTTPIndex__
#define __HTTPIndex__
//*******************************************************************
//Towson University Copyright 2004
//Coded by R.K.Karne, Dated December 10, 2004
// Circular List 
// InPtr points to the insert list 
// OutPtr points to the remove list 
// Size is the size of the list (1000) 
// InPtr = OutPtr, the list is empty 
// (InPtr+1) mod Size = OutPtr, then it is full 
// When Updating the pointers, interrupts are disabled AOAcli()
//   after that interrupts are enabled AOAsti()
// As we do not have locking, we can use interrupts to lock the records
//*******************************************************************
#include "../INTERFACES/AOAProtected.h"
#include "hashIndex.h"
#define MAXIndexSectors 30
#define StartIndexSector 1
#define FilesPerSectorIndex 5
class HttpIndex
{
    private:
   	
	static unsigned long ResourceIndexBase;		// Base address of the HTTP Resource Index
	
	static unsigned long ResourceBufferBase;	// Base address of the HTTP Resource Buffer
	
	static unsigned int ResourceIndexCount;		// Max Index count of the HTTP Resource
	
	static unsigned long ResourceBufferSize;	// Maximum Size of the Buffer allocated fo the HTTP Resource
	
	static unsigned long ResourceIndexSize;		// Maximum Index size of the of the Resource

	static unsigned long ResourcePtr; 		// Points to the current buffer address to store the next file;
	
	static unsigned long ResourceIndexPtr;		// Points to the current index to store the next file

	static int DiskNo;

	HttphashIndex h;				// Denotes the hashIndex for Fast Indexing
	
	struct ResourceIndex
	{
		char FileName[80];
		unsigned long StartAddress;
		unsigned long FileSize;
		unsigned long NextPtr;
	};

	struct FloppyResourceIndex
	{
	    char FileName[80]; 
	    long NoSectors;
	    long StartSector;
	    long EndSector;
	    long FileSize;
	};
    public:
	// Initialize the object
	int init(unsigned long BufferBase, unsigned long BufferSize, int BufferIndexCount,int hashIndexCount);
	// Read the floppy and put it in the buffer
	int readFloppy();
	// Get the file used by the parser to get the file
	int getFile(char *FileName, unsigned long *FileStartAddress, unsigned long *FileSize);
   private:
	int sstrcpy(char* D_Str,int D_Size,char* S_Str,int S_Size);
	int sstrcmp(char* D_Str,char* S_Str);
	int sstrlen(char* str);	
};
#endif

