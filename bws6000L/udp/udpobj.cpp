//******************************************************************************
// udpobj.cpp
// Check RFC 768
//******************************************************************************
#include "udpobj.h"
#include "../ARP/arpobj.h"
#include "../INTERFACES/aoaprotected.h"
#include "../FTP/ftpobj.h"
#include "../webserver/aoatask.h"

//******************************************************************************
char UDPObj::sourceIP[4];
unsigned short UDPObj::sourcePort;
// This is the init method must be called globally only once in a program
//
void UDPObj::init(char* IP, unsigned short port)
{
	for(int i=0; i<4; i++)
	sourceIP[i] = IP[i];
	sourcePort = port;
}

//******************************************************************************
//This function is used to send a data 
//******************************************************************************
int UDPObj::sendData(char *tIP, unsigned short tPort, char *Data, int Datasize, char *DestMac, int currenttask)
{
        AOAProtected io;
	AOATask task;
	ARPObj arp;
	int sizeOfPacket=0;
	unsigned int temp;
	int i; 
	int retcode=0;
	
	sizeOfPacket = Datasize + 8; // new size of packet ; 8 is for udp header
	Data = Data - 8;
	
	// Set the source Port in the packet
	Data[0] = sourcePort>>8 & 0xff;
	Data[1] = (char)sourcePort & 0xff;
	// Set the destination port in the packet
	Data[2] = tPort>>8 & 0xff;
	Data[3] = (char)tPort & 0xff;

	// Set the datagram length in the packet
	temp = 0x00;
	temp = Datasize+ 8;
	Data[4] = temp>>8 & 0xff;
	Data[5] = (char)temp & 0xff;
	// Set the checksum in the Datagram
	// check sum for udp is not mandatory
	Data[6] = 0x00;
	Data[7] = 0x00;

	retcode = ip.sendData(Data, sizeOfPacket, tIP, DestMac, UDP, currenttask);

        arp.resolveFlagForFileTransfer = 1;

	return retcode;
}
//************************************************************************************
// This function handles the UDP Packets
// return code
// -1 packet size is less than header
// -2 packet is not for this port
//************************************************************************************
int UDPObj::UDPHandler(char *UDPPack,int size,char *SourceIP, char *TargetIP, int Protocol, int currenttask)
{
	FTPObj ftp;			
	unsigned short DestPort = 0;
	int Size = 0;
	int temp = 0;
	int retcode = 0;
	
	// if packet size is less than header
	if(size < 8)
	  return -14;

	// if packet is not for our port
	if( (UDPPack[2]&0xFF) != ((sourcePort>>8) & 0xff) || (UDPPack[3]&0xFF)!= (sourcePort & 0xff) )
	  return -15;
	
	DestPort = UDPPack[0]&0xFF;
	DestPort = ((DestPort << 8) & 0xff00) | (UDPPack[1] & 0x00ff);

	temp = (UDPPack[4]&0xFF);
	temp = ((temp << 8) & 0xff00) | (UDPPack[5] & 0x00ff);
	// 8 is the size of UDP header
	Size = temp - 8;	
	
	// We have to call the application routine to hand over the data
	retcode = ftp.FtpHandler(&UDPPack[8], Size, TargetIP, DestPort, currenttask);	

	return retcode;
}


