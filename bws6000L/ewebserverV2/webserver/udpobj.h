//*************************************************
// udpobj.h
// ************************************************
#ifndef __udpobj__
#define __udpobj__

#include "../IP/ipobj.h"
#include "../ARP/arpobj.h"

#define MAXUDPSize 2048
#define UDP_Protocol 0x11

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
	int sendData(char *tIP, unsigned short tPort, char *Data, int DataSeize, int currenttask );
	int UDPHandler(char *UDPPack,int size,char *SourceIP, char *TargetIP, int Protocol);
	// This send data is a generic send data, used to send trace data to a console  
	int sendData(unsigned short sPort, char *tIP, unsigned short tPort, char *Data, int Datasize, int currenttask);

};
#endif
