//****************************************************
// IPObj.h 
// Header file for IPObj 
// Coded by Karthick Venkatasamy Jaganathan
// Dated 10/09/04
// Towson University, Copyright 2004 
// ***************************************************
#ifndef __ipobj__
#define __ipobj__
#define MAXSEND_SIZE	1060
#define MAXRECEV_SIZE	1900
#define IPVHL		0x45
#define TCP		0x06
#include "../Ethernet/etherobj.h"

// this IP Object dosent support fragmentation and this object operates w.r.t IP version 4
// The Ethernet Object must be initialised before the calling of init() of this function

class IPObj
{

private:

	// Source MAC Assress Global for all instance of the object
	// must be initialized in the init() 
    	static	char 	msourceMAC[7];

	// Source IP Global for All the instance of the Object
	// must be initialized in the init()
	static	char 	msourceIP[4];	

	// Time to live is set to the maximum value
	// must be initialized in the init()	
	static 	char 	mTimeLive;	

	// Service Type which is global for all instance of objects
	// must be initialized in the init()	
	static 	char 	mServiceType;
	
	// Version of IP which is 4 and the Length of IP header, which is 5
	char 	mVerHlen;

	// Fragment Number Not implemented
	short 	mFragment_Flags;

	// This is the Ethernet object used to send and receive Ethernet Messages	
	EtherObj EO;

	// This object has all the user interface API
	AOAProtected io;
	// IP statistics
	static unsigned long noippacksr;	// Total number of IP Packets received
	static unsigned long noippackss;	// Total number of IP Packets Sent
	static unsigned long noippacksps;	// Total number of IP Packets successfully processed 	
public:
		IPObj();
	void 	init(char *SrcIP);
	int 	sendData(char* data, int len, char DestIP[4], char DestMac[6], int protocol, int currenttask);
	int 	IPHandler(char* ARPPack,int size);	
	void   	printStatistics(int Line);	
private:
	unsigned short 	checksum(char *packet);
};
#endif
