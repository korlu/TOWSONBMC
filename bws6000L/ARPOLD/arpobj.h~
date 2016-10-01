//****************************************************
// ARPObj.h 
// Header file for ARPObj 
// Coded by Karthick Venkatasamy Jaganathan
// Dated 09/18/04
// Towson University, Copyright 2004 
// ***************************************************
#ifndef __arpobj__
#define __arpobj__

#include "../Ethernet/etherobj.h"
#include "../Interfaces/AOAProtected.h"
//#include "apptask.h"

# define REQUEST 0x01
# define REPLY 0x02
# define R_REQUEST 0x03
# define R_REPLY 0x04
# define ARPTABLE_COUNT 0x64 //this is a 100 entry hash table
# define ARPT_COUNT 0x4 //this is a 4 entry hash table

struct arprecord
{
    char ip[4];
    char mac[6];
    int next;
};
struct arprecordT
{
    char ip[4];
    char mac[6];
};
class ARPObj
{

    private:
	
    	EtherObj EO;
	AOAProtected io;
//	apptask task;
	static arprecord ARPTABLE[ARPTABLE_COUNT]; //hash table to keep 100 entries 
	static arprecordT ARPT[ARPT_COUNT]; //hash table to keep 100 entries 
	static int hashind[100]; //hash table index to point to a used list based on hash value 

	static int FreePtr;
	// This array holds the ARP Table, Max Capacity of the table is 100 entries
	// The first 4 bytes denotes IP Address, The Second 6 Entries denotes Ethernet MAC Address
	// since it it 6 bytes for MAC Address, this ARPObject is specific to Ethernet
	
	int mHardwareType;
	// Hardware Type
	
	int mProtocol;
	// Protocol Type
	
	long PROTOCOL_TYPE;

	char mHlen;
	// Size of MAC Address
	
	char mPLen;
	// Size of protocol Address
	
	static char mSenderHA[6];
	// Hardware Address of the Sender

	static char mSenderIP[4];
	// IP Address of the Sender

	char packet[256];
	// Buffer for the packet 
	
	static char GateWayIP[4];

	static char SUBNETMASK[4];	

		
	// statistics 
	static unsigned long noArpresolves;	// Number of successful ARP resoultion
	static unsigned long noArpresolvef;	// Number of failed ARP Resolution
	static unsigned long noArprequestp;	// Number of incomming request processed
	static unsigned long noArppackp;	// Total number of ARP Request processed processed 	
	
public:
	static int resolveFlagForFileTransfer;
	static int ARPT_Index;

	ARPObj();
	init(char* senderIP, char * SubNetMask, char* GwayIP);
	int Resolve(char* targetIP, char* targetMAC, int currenttask);
	int ARPHandler(char* ARPPack,int size, int currenttask);	
	int ProcessRequest(char* ARPPack,int size, int currenttask);
	int ProcessReplies(char* ARPPack,int size);
	int Response(char* targetIP, int currenttask);	
	void close();
	void printStatistics(int Line);	
	void printARPTable(int Line);	
private:
	int hashFun(char *ip);	
};

#endif

