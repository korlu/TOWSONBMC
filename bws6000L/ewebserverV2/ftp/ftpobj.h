#ifndef __ftpobj__
#define __ftpobj__


// This is an implementation of FTP Protocol for transfering
// web resources to the AOA memory
#define ACTIVE_OPEN	0X01
#define ESTABLISHED	0X02
#define ACCEPT 		0X03
#define READY		0X04
#define	RCVD		0x05
#define	fCLOSEWAIT	0x06
#define	fCLOSED		0x07
#define FNameSize 	80 // 80 characters is the maximum size of the file name 
#include "hashIndex.h"
#include "../UDP/udpobj.h"
class FTPObj
{
private:
	// This is the next expected sequence number
	static unsigned int nextseq;

	// Base address of the resourceIndex
	static unsigned long ResourceIndexBase;

	// Base Address of HTTP RecourceBuffer
	static unsigned long ResourceBufferBase;
	
	// Max index count of the http resource
	static unsigned int ResourceIndexCount;

	// Max size of the buffer allocated for HTTP resource
	static unsigned long ResourceBufferSize;

	// Maximum Index size of the resource
	static unsigned long ResourceIndexSize;

	// Points to the current buffer
	static unsigned long ResourcePtr; 

	// Points to the current index to store the next file 
	static unsigned long ResourceIndexPtr;
	
	// current Resource Address
	static char *curraddress;

	static unsigned long tftppkts;	

	static unsigned int LostPkts[4000];
	
	static unsigned int TotalFilePkts;
	
	static unsigned int MaxPktSize;

	static unsigned int TotalLostPkts;	
	static unsigned long TFileSize;		
	// hash index object for fast hashing	
	AOAProtected io;
	HttphashIndex h;		
	UDPObj udp;

	struct ResourceIndex
	{
		char FileName[FNameSize];
		unsigned long StartAddress;
		unsigned long FileSize;
		unsigned long NextPtr;
	};
	int sstrcpy(char *D_Str, int D_Size, char* S_Ztr, int S_Size);
	int sstrcmp(char* D_Str, char *S_Str);
	int sstrlen(char* str);
public:
	// Destingation DOSC FTP servers IP address
	static char IP[4];
	static char DestMac[6];
	
	// Destination FTP servers Port Number
	static unsigned short port;

	// Status
	static int state;	

	static int fileTransferFinished;

	int init(unsigned long BufferBase, unsigned long BufferSize, int BufferIndexCount,
		 int hashIndexCount, char *ftpDestIP, unsigned short ftpDestPort);	
	int FtpHandler(char *UData, long Size, char* tIP, unsigned short tPort, int currenttask);
	int StartTransfer(char *tIP, unsigned short tPort, int currenttask);
	int getFile(char *FileName, unsigned long *FileStartAddress, unsigned long *FileSize);
		
	
};
#endif
