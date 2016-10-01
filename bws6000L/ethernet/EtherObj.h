// ------------------------------------------------------------
// EtherObj.h
// Coded by Ramesh Karne and Sandeep Girumala on April 14, 2006 
// Copyright Towson University 
// ------------------------------------------------------------

#ifndef __etherobj__
#define __etherobj__
#include "../INTERFACES/AOAProtected.h"
//#include "../webserver/aoatask.h"

extern "C"
{
	int cigetRegister32(unsigned long );
	void cisetRegister32(int, unsigned long );
}

//This is an interface class definition 

class EtherObj 
{

private:
	static short IO_BASE;  //Global Variable 
	static unsigned long IOADDR;
	static unsigned long IODATA;

	AOAProtected io;
	//AOATask task;

public:

 	static char mac[6]; //Global Variable 

	static long TotalRcvCount;

	static long TDLPointer;
	static long TDLDataPointer;

	static long RDLPointer;
	static long RDLDataPointer;

	static long ReceiveInPtr; 
	static long ReceiveOutPtr;
	static long SendInPtr; 
	static long SendOutPtr;
	static long TotalDataSent;

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

//----------------------------------------------------------------------------------
	void getMAC(char*);
	void getMACEPROM(char*);
	int getRegister32(unsigned long );
	void setRegister32(int , unsigned long );	

	int getECompatibility();
	int getEDeviceId();
	int getEVendorId();
	int getEInitCtrl1();
	int getEInitCtrl2();
	int getEInitCtrl3();
	int getEMgmtCtrl();
	int getEIPv4Byte01();
	int getEIPv4Byte23();

	int getControl();
	int getStatus();
	int getMdicPhyCtrl();
	int getMdicPhyStat();
	int getInterruptMaskSet();
	int getInterruptMaskClear();

	int ColdReset();
	int HotReset();
	int inittest(long , long , long , long , char*);
	int createTDL();
	int createRDL();
	int initTDL(int , int , int );
	int initRDL(int , int , int );
	int RDLfull();

	int getTDBALow();
	int getTDBAHigh();
	int getTDLen();
	int getTDHead();
	int getTDTail();
	
	int getRDBALow();
	int getRDBAHigh();
	int getRDLen();
	int getRDHead();
	int getRDTail();
	
	int setTDBALow(int );
	int setTDBAHigh(int );
	int setTDLen(int );
	int setTDHead(int );
	int setTDTail(int );

	int setRDBALow(int );
	int setRDBAHigh(int );
	int setRDLen(int );
	int setRDHead(int );
	int setRDTail(int );

	int getTCtrl();
	int setTCtrl(int );
	int TEnable();
	int TDisable();
	int isTDescDone(int );
	int resetTDescDone(int );

	int getRCtrl();
	int setRCtrl(int );
	int REnable();
	int RDisable();
	int isRDescDone(int );
	int resetRDescDone(int );

	int getRAL0();
	int setRAL0(int );
	int getRAH0();
	int setRAH0(int );

	int getRAL1();
	int setRAL1(int );
	int getRAH1();
	int setRAH1(int );
	
	int printRegisters(int );
	int setTData(int , int , int );
	int printTDL(int , int );
	int printRDL(int , int );
	
	int getPRC64();
	int getPRC127();
	int getPRC255();
	int getPRC511();
	int getPRC1023();
	int getPRC1522();
	int getGPRC();
	int getBPRC();
	int getMPRC();
	int getGPTC();
	int getRNBC();
	int getTPR();
	int getTPT();
	int getPTC64();
	int getPTC127();
	int getPTC255();
	int getPTC511();
	int getPTC1023();
	int getPTC1522();
	int getMPTC();	
	int getBPTC();
	int getICR();

	int getSCC();
	int getECOL();
	int getMCC();
	int getLATECOL();
	int getCOLC();
	int getDC();
	int getTNCRS();
	int getSEC();
	int getGOTCL();
	int getGOTCH();
	int getMGTPTC();
	int getTOTL();
	int getTOTH();

	int getTXDCTL();
	int getRXDCTL();
	int getTIPG();
	
	int printTReadData(int , int , int );
	int printRReadData(int , int , int );
	int printDiag(int );
	int printTStat(int );
//-----------------------------------------------------------------------------------------------------------
	int getCurrentReceivePtr();
	int getCount();
	int ReadData(char**, int*, char*, char*); 	
	int discardPacket();
	int TDLFull();
        int IPInsertPkt(char* , int , int , char* , int CurrentTask);	
	int sndCall();
	int IncSendOutPtr();
	int ARPInsertPkt(char* PACK,int PACK_Size, int PROTOCOL, char* Sender_HAdd, 
				char* Target_HAdd, int sendtype, int CurrentTask);
	int FormatEthPacket(char* PACK,int PACK_Size, int PROTOCOL, char* Target_HAdd,
				long InPtr, int sendtype, int currenttask);
	int FormatEthPacketN(char* PACK,int PACK_Size, int PROTOCOL, char* Target_HAdd, 
				long InPtr, int count, int sendtype, int currenttask);
	int sndCallN(int count);	
};

#endif
