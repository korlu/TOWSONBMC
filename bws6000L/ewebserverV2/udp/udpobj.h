//*************************************************
// udpobj.h
// ************************************************
#ifndef __udpobj__
#define __udpobj__

#include "../IP/ipobj.h"
#include "../ARP/arpobj.h"

class UDPObj
{
private:
	IPObj ip;
	ARPObj arp;	
	static char 	sourceIP[4];
	static unsigned short 	sourcePort;
	unsigned short checksum();
public:
	void init(char *IP, unsigned short port);
	int sendData(char *tIP, unsigned short tPort, char *Data, int DataSeize, char *DestMac, int currenttask );
	int UDPHandler(char *UDPPack,int size,char *SourceIP, char *TargetIP, int Protocol, int currenttask);
};
#endif
