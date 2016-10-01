//****************************************************
// EtherObj.h 
// header file for EtherObj 
// Coded by Karthick Venkatasamy Jaganathan
// Dated 09/09/04
// Towson University, Copyright 2004 
// ***************************************************

#ifndef __etherobj__
#define __etherobj__
#include "../INTERFACES/AOAProtected.h"
#include "../webserver/aoatask.h"

extern "C"
{

	void csetBaseAddress (int); 		//set device address in the object   
	int cgetBaseAddress (); 		//get device address from the object   
	int cinitEther(short, char*);    //initialize ether object 
	int ccreateDS(int, int, int, int, int, int, int, int, int, int, short); 
	int cenableTransmit(int,long);          //pass IO_BASE, DPD pointer  
	int cenableReceive(int);                //pass IO_BASE  
	int cdisableTransmit(int);               //pass IO_BASE  
	int cdisableReceive(int);                //pass IO_BASE  
	int cgetCurrentReceivePtr(short);             //get current rcv ptr 
	int cgetCurrentSendPtr(short);             //get current send ptr 
	int cgetTransmitStatus(int);               //pass IO_BASE  
	int cgetIntStatus(int);               //pass IO_BASE  
	int cgetFifoDiag(int);               //pass IO_BASE  
	int cgetTransmitFree(int);               //pass IO_BASE  
	int cgetMediaStatus(int);               //pass IO_BASE  
	int cdnStall(int); 
	int cdnUnStall(int); 
	int cupStall(int); 
	int cupUnStall(int); 
	int csetDnLstPtr(int,int);           // pass IO_BASE and DnLstPtr
	int cackNICInt(int, int);
	void closeasm(short);
	int cstopTransmitAt(int, int);
	int csend(short, int, long);
	int csendN(short, int, int);
	int cgetInternalConfig(int); 
	int cgetMacControl(int); 
	int cgetMediaOptions(int); 
	int cgetConfigData(int, int);
	int cgetNetworkDiag(int);
	int cresetTransmitter(int);
	int cgetTransmitPacketId(int); 
}

//This is an interface class definition 

class EtherObj 
{

private:
	static short IO_BASE;  //Global Variable 

	AOAProtected io;
	AOATask task;

public:

 	static char mac[6]; //Global Variable 
	static long DownListPointer; // send saved here for reusing this during enable   
	static long DownListDataPointer;  //send  
	static long UpListPointer;      //receive 
	static long SndLstSize;          //size of send list 
	static long RcvLstSize;          //size of receive list 
	static long PacketSize;          // packet size in initialization

	static long SendInPtr;           //InPtr for send   
	static long SendOutPtr;          //OutPtr for send   
	static long ReceiveInPtr;           //InPtr for Receive   
	static long ReceiveOutPtr;          //OutPtr for receive   
        static long NoofPackets;
        //Global variables are accessible to all instantiations of the object 
	// However, Init() should be called only once, so that these global 
	//  variables are initialized once 
	//  Different processes can instantiate different objects, but they should not 
	//   do the Init()
	// However, as there is only one resource, which is ethernet card, send and receive 
	//  must be appropriately called, so that two different tasks do not call send or receive 
	//  at the same time 
	//  Receive is only done by ISR which is an interrupt and it sets CLI and STI so that 
	//  no one else calls receive data from the ethernet card 
	//  However, send can be called by ARP or TCP to send data 
	//  Thus, we should have a lock for send() so that it is treated as a critical resource 
	//  We have witnessed ARP and a regular send() were lost when this happens 
public:
	//  these are C++ functions
	//long LocalSendOutPtr; 
	
	EtherObj ();
	
//----------------------------------------------------------------------------------
	void setBaseAddress(int);  //will set the base address in the object  
	int  getBaseAddress();      //get the base address from the object  
	int  createDataStructure(int, int, int, int, int, int, int, int, int, int);
	long Init();   //initialization for global object 
	int  enableTransmit();   //enable transmitter packets are in the buffer 
	int  enableReceive();   //enable receive packets are in the buffer 
	int  disableTransmit();   //disable transmitter packets are in the buffer 
	int  disableReceive();   //disable receive packets are in the buffer 
	int  getCurrentReceivePtr(); //get current receive ptr for the linked list InPtr 
	int  getCurrentSendPtr(); //get current send ptr for the linked list OutPtr
	int  discardPacket();    //discard packet read 
	int  readPacket(long, long*, long*, long*); 
	int  getTransmitStatus();   //enable transmitter packets are in the buffer 
	int  getIntStatus();    
	int  getTransmitFree();  
	int  getMediaStatus();  
	int  getFifoDiag();  
	int  dnStall(); 
	int  upStall(); 
	int  dnUnStall(); 
	int  upUnStall(); 
	int  setDnLstPtr(int);           // pass DnLstPtr
	int  ackNICInt(int);
	int  printDpd(int, int);
	int  printUpd(int, int);
	int  getInternalConfig();
	int  getMacControl();
	int  getMediaOptions();
	int  getConfigData(int);
	int  getNetworkDiag();
	int  resetTransmitter();
	int  getDPDStatus(int); 
	int  getTransmitPacketId();
	int  getNoofPackets();

//----------------------------------------------------------------------------------
	int testArpIP(char *buff);
	void getMAC(char*);
	void Close();
	int ARPInsertPkt(char* PACK,int PACK_Size, int PROTOCOL, char* Sender_HAdd, 
				char* Target_HAdd, int sendtype, int currenttask);
	   //ARP send  
	int IPInsertPkt(char* PACK,int PACK_Size, int PROTOCOL, char* Target_HAdd, int currenttask);
	int FormatEthPacket(char* PACK,int PACK_Size, int PROTOCOL, char* Target_HAdd,
				long InPtr, int sendtype, int currenttask);
	int FormatEthPacketN(char* PACK,int PACK_Size, int PROTOCOL, char* Target_HAdd, 
				long InPtr, int count, int sendtype, int currenttask);
	
	   //IP data send 
	int SendPacket (long,int );//send packet for ARP and data  
	int SendPacketN(int count);
	int CheckSendFlag ();//Check Send Flag for current Write DPD entry  
	int CheckDownComplete();//Check Down Complete bit  
	int ReadData(char**, int*, char*, char*); 	
	int StopTransmitAt (int); 
	int IncSendPtr(int); 
	int DPDFull(); 
	int getCount(); 
	int full(); 
	int sndCall();
	int sndCallN(int count);

};

#endif
