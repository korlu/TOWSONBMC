// ------------------------------------------------------------
// EtherObj.cpp
// Coded by Ramesh Karne and Sandeep Girumala on April 14, 2006 
// Copyright Towson University 
// ------------------------------------------------------------

#include "EtherObj.h"

//int EtherObj::TimerCount=0;
char EtherObj::mac[6];
short EtherObj::IO_BASE=0;
unsigned long EtherObj::IOADDR=0;
unsigned long EtherObj::IODATA=0;

long EtherObj::TDLPointer = 0;
long EtherObj::TDLDataPointer = 0;
long EtherObj::RDLPointer = 0;
long EtherObj::RDLDataPointer = 0;

long  EtherObj::SendInPtr  = 0;   
long  EtherObj::SendOutPtr  = 0;   
long  EtherObj::ReceiveInPtr = 0;  
long  EtherObj::ReceiveOutPtr = 0;  
long  EtherObj::TotalRcvCount = 0; //no of packets rcvd and processed   
long  EtherObj::TotalDataSent = 0; //total bytes sent    

//------------------------------------------------------
// default does not change any member functions or data
//  use init() method to initialize EO only once 
//   so that EO can be instantiated many times 
//   without resetting the card over and over again 
//------------------------------------------------------
EtherObj::EtherObj()
{ 
}

//------------------------------------------
// initialization
//------------------------------------------
int EtherObj::inittest(long tbaseAddress, long tbufferPointer, long rbaseAddress, long rbufferPointer) 
  {
     int retcode=0;
     int tdtail=0;
     int rdtail=0;
     
     SendInPtr = 0;
     SendOutPtr = 0;
     ReceiveInPtr = 0;
     ReceiveOutPtr = 0;

     // Size of descriptor = 16 bytes
     // p.306 initialize no of descriptors to NO_OF_RDL and NO_OF_TDL  
     tdtail = 0;
     rdtail = NO_OF_RDL - 2;

     TDLPointer = tbaseAddress;
     TDLDataPointer = tbufferPointer;
     RDLPointer = rbaseAddress;
     RDLDataPointer = rbufferPointer;
     
     printDiag(Line3);  //to enable diagnostics, read once 

     retcode = createTDL();
     retcode = createRDL();

     // initTDL(int TDLen, int TDHead, int TDTail)
     retcode = initTDL(NO_OF_TDL/8, 0, tdtail);
     
     // initRDL(int RDLen, int RDHead, int RDTail)
     retcode = initRDL(NO_OF_RDL/8, 0, rdtail);
     return 0;  
  }

//------------------------------------------
// init TDL
//------------------------------------------
int EtherObj::initTDL(int len, int head, int tail)
  {
     int retcode = 0;
     
     retcode = setTDBALow(TDLPointer);
     retcode = setTDBAHigh(0x0);
     retcode = setTDLen(len);
     retcode = setTDHead(head);
     retcode = setTDTail(tail);

     return retcode;
  }

//------------------------------------------
// init RDL
//------------------------------------------
int EtherObj::initRDL(int len, int head, int tail)
  {
     int retcode = 0;
     
     retcode = setRDBALow(RDLPointer);
     retcode = setRDBAHigh(0x0);
     retcode = setRDLen(len);
     retcode = setRDHead(head);
     retcode = setRDTail(tail);

     return retcode;
  }

//------------------------------------------
// create transmit descriptor list
// similar to DPD
// pg. 36
//------------------------------------------
int EtherObj::createTDL() 
  {
    int i;
    long *lptr;
    long l;
    lptr = &l;  
    
//       63           48 47  40 39 36 35  32 31  24 23    16 15        0
//	----------------------------------------------------------------
//  0	|                          Buffer Address [63:0]                | 
//	----------------------------------------------------------------
//  8	|     Special   |  CSS | RSV | STA  | CMD  |  CSO   |  Length   |
//	-----------------------------------------------------------------
    lptr = (long*)(TDLPointer - ADDR_OFFSET);

    for(i=0; i<NO_OF_TDL; i++)
    {
      *lptr = TDLDataPointer + i * T_BUFFER_SIZE;  // buffer address[0-31]
      lptr++;
      *lptr = 0; // buffer address[32-63]
      lptr++;
      *lptr = 0x0b000000; // CMD = 0x0b, CSO = 0x00, Length =0// 0x05ea = 1514
      			  // CMD bits
			  // bit 0 = End of Packet
			  // bit 1 = Insert FCS
			  // bit 3 = Report Status
      lptr++;
      *lptr = 0x00000000; // Special = 0x0000, CSS = 0x00, RSV = 0x00
      lptr++;
    } 

    return 0;
  } 

//------------------------------------------
// create receive descriptor list
// similar to UPD
// pg. 20
//------------------------------------------
int EtherObj::createRDL() 
  {
    int i;
    long *lptr;
    long l;
    lptr = &l;  
    
//       63           48 47  40 39        32 31           16 15        0
//	----------------------------------------------------------------
//  0	|                          Buffer Address [63:0]                | 
//	----------------------------------------------------------------
//  8	|    Reserved   |Errors|   Status   |   Reserved    |  Length   |
//	-----------------------------------------------------------------
//	Length, Status and Errors are modified by hardware upon packet reception
//
    lptr = (long*)(RDLPointer - ADDR_OFFSET);

    for(i=0; i<NO_OF_RDL; i++)
    {
      *lptr = RDLDataPointer + i * R_BUFFER_SIZE;  // buffer address[0-31]
      lptr++;
      *lptr = 0; // buffer address[32-63]
      lptr++;
      *lptr = 0;
      lptr++;
      *lptr = 0;
      lptr++;
    } 

    return 0;
  } 

//------------------------------------------
// get base address from the object 
//------------------------------------------
int EtherObj::getBaseAddress() 
  {
   return IO_BASE;  
  }
//------------------------------------------
// set base address in the object 
//------------------------------------------
void EtherObj::setBaseAddress(int addr) 
  {
    IO_BASE = addr; 
    IOADDR = addr;
    IODATA = IOADDR + 4;
  }

//------------------------------------------
// print register 
//------------------------------------------
int EtherObj::printRegisters(int line) 
  {
    int retcode=0;

     retcode = getECompatibility();
     io.AOAprintHex(retcode, line);

     retcode = getEDeviceId();
     io.AOAprintHex(retcode, line+20);
 
     retcode = getEVendorId();
     io.AOAprintHex(retcode, line+40);
     
     retcode = getEInitCtrl1();
     io.AOAprintHex(retcode, line+60);
     
     retcode = getEInitCtrl2();
     io.AOAprintHex(retcode, line+80);

     retcode = getEInitCtrl3();
     io.AOAprintHex(retcode, line+100);

     retcode = getEMgmtCtrl();
     io.AOAprintHex(retcode, line+120);
     
     retcode = getEIPv4Byte01();
     io.AOAprintHex(retcode, line+160);

     retcode = getEIPv4Byte23();
     io.AOAprintHex(retcode, line+160+20);
 
     retcode = getControl();
     io.AOAprintHex(retcode, line+160+40);

     retcode = getStatus();
     io.AOAprintHex(retcode, line+160+60);
 
     retcode = getMdicPhyCtrl();
     io.AOAprintHex(retcode, line+160+80);

     retcode = getMdicPhyStat();
     io.AOAprintHex(retcode, line+160+100);

     retcode = getInterruptMaskSet();
     io.AOAprintHex(retcode, line+160+120);

     retcode = getInterruptMaskClear();
     io.AOAprintHex(retcode, line+320);
     
     retcode = getTDBALow();
     io.AOAprintHex(retcode, line+320+20);
     
     retcode = getTDBAHigh();
     io.AOAprintHex(retcode, line+320+40);
     
     retcode = getTDLen();
     io.AOAprintHex(retcode, line+320+60);

     retcode = getTDHead();
     io.AOAprintHex(retcode, line+320+80);
     
     retcode = getTDTail();
     io.AOAprintHex(retcode, line+320+100);

     retcode = getTCtrl();
     io.AOAprintHex(retcode, line+320+120);

     retcode = getRAL0();
     io.AOAprintHex(retcode, line+480);

     retcode = getRAH0();
     io.AOAprintHex(retcode, line+480+20);
     
     retcode = getRAL1();
     io.AOAprintHex(retcode, line+480+40);

     retcode = getRAH1();
     io.AOAprintHex(retcode, line+480+60);

    return retcode;
  }

//****************************************************
// get MAC address from static variable in EO
//  this is not used for reading MAC address from EPROM
//****************************************************
void EtherObj::getMAC(char *dMAC)
{
	for(int i=0; i<6; i++)
		dMAC[i] = mac[i];
}

//****************************************************
// get MAC address from EPROM
//  this is to be called from test.cpp only once,
//   otherwise the application hangs
//
// if arp or ip needs MAC address, they should call
// getMAC(char *) function and not this one.
//****************************************************
void EtherObj::getMACEPROM(char *dMAC)
{
	int retcode=0;
	int i=0;
	int temp=0;

	//p.230 EERD (EEPROM Read Register)
	//31                16 15         8 7        5   4    3      1    0
	//----------------------------------------------------------------------
	//|        Data       |   Address  | Reserved |DONE | Reserved | START |
	//----------------------------------------------------------------------
	//
	// Reading data from EEPROM pg. 96
	//
	// Look at EEPROM address map in pg.98
	// Word 00h -> Ethernet Address Byte 1 and Ethernet Address Byte 0
	// Word 01h -> Ethernet Address Byte 3 and Ethernet Address Byte 2
	// Word 02h -> Ethernet Address Byte 5 and Ethernet Address Byte 4	
	
	// EERD 0x14
	setRegister32(0x14, IOADDR);
	 
	// Step 1
	// ------
	// Write 00h in address field, set START to 1 and wait until DONE is 1
	// value read is in Data which is ethernet address byte0 and byte1	
	setRegister32(0x00000001, IODATA);

	do
	{
	   retcode = getRegister32(IODATA);
	}while((retcode & 0x00000010) == 0);

	retcode = getRegister32(IODATA);

	mac[0] = (retcode & 0x00ff0000) >> 16; // mask bit(16-23) and right shift by 16 to get byte0 
	mac[1] = (retcode & 0xff000000) >> 24; // mask bit(24-31) and right shift by 16 to get byte1  

	// Step 2
	// ------
	// Write 01h in address field, set START to 1 and wait until DONE is 1
	// value read is in Data which is ethernet address byte2 and byte3
	setRegister32(0x00000101, IODATA);
	
	do
	{
	   retcode = getRegister32(IODATA);
	}while((retcode & 0x00000010) == 0);

	retcode = getRegister32(IODATA);

	mac[2] = (retcode & 0x00ff0000) >> 16; // mask bit(16-23) and right shift by 16 to get byte2 
	mac[3] = (retcode & 0xff000000) >> 24; // mask bit(24-31) and right shift by 16 to get byte3  
	
	// Step 3
	// ------
	// Write 02h in address field, set START to 1 and wait until DONE is 1
	// value read is in Data which is ethernet address byte4 and byte5
	setRegister32(0x00000201, IODATA);
	
	do
	{
	   retcode = getRegister32(IODATA);
	}while((retcode & 0x00000010) == 0);

	retcode = getRegister32(IODATA);

	mac[4] = (retcode & 0x00ff0000) >> 16; // mask bit(16-23) and right shift by 16 to get byte4 
	mac[5] = (retcode & 0xff000000) >> 24; // mask bit(24-31) and right shift by 16 to get byte5	
	
	// copy from static variable mac to passed variable dMAC
	for(i=0; i<6; i++)
	    dMAC[i] = mac[i];

	temp = 0;
	// copy first 4 bytes into temp and print it
	for(i=0; i<4; i++)
	{
	    temp = temp | (mac[i] & 0x000000ff);
	    if(i < 3)
	    {
	       temp = temp << 8;
	    }
	}
	io.AOAprintHex(temp, Line24+60);
	
	temp = 0;
	// copy next 2 bytes into temp
	for(i=0; i<2; i++)
	{
	    temp = temp | (mac[i+4] & 0x000000ff);
	    temp = temp << 8;
	}
	// fill the remaining 2 bytes with ff so that it will be easy to read mac address
	for(i=0; i<2; i++)
	{
	    temp = temp | 0x000000ff;
	    if(i < 1)
	    {
	       temp = temp << 8;
	    }
	}
	
	io.AOAprintHex(temp, Line24+80);
}

//------------------------------------------
// get register 
//------------------------------------------
int EtherObj::getRegister32(unsigned long iobase) 
  {
    return cigetRegister32(iobase);
  }

//------------------------------------------
// set register
//------------------------------------------
void EtherObj::setRegister32(int value, unsigned long iobase) 
  {
    cisetRegister32(value, iobase);
  }

//------------------------------------------
// get eeprom compatibility word
// pg. 103
//------------------------------------------
int EtherObj::getECompatibility() 
  {
        int retcode=0;

	//p.230 EERD (EEPROM Read Register)
     	// EERD 0x14
	setRegister32(0x14, IOADDR);
	 
	// Write 03h in address field, set START to 1 and wait until DONE is 1
	// value read is in Data which is ethernet address byte0 and byte1	
	setRegister32(0x00000301, IODATA);

	do
	{
	   retcode = getRegister32(IODATA);
	}while((retcode & 0x00000010) == 0);

	retcode = getRegister32(IODATA);

	retcode = retcode & 0xffff0000; // mask bit(0-15)
	retcode = retcode >> 16;

    	return retcode;
  }

//------------------------------------------
// get eeprom device id
// pg. 107
//------------------------------------------
int EtherObj::getEDeviceId() 
  {
        int retcode=0;

	//p.230 EERD (EEPROM Read Register)
     	// EERD 0x14
	setRegister32(0x14, IOADDR);
	 
	// p.98 EEPROM address map
	// Write 0dh in address field, set START to 1 and wait until DONE is 1
	// value read is in Data which is ethernet address byte0 and byte1	
	setRegister32(0x00000d01, IODATA);

	do
	{
	   retcode = getRegister32(IODATA);
	}while((retcode & 0x00000010) == 0);

	retcode = getRegister32(IODATA);

	retcode = retcode & 0xffff0000; // mask bit(0-15)
	retcode = retcode >> 16;

    	return retcode;
  }

//------------------------------------------
// get eeprom vendor id
// pg. 107
//------------------------------------------
int EtherObj::getEVendorId() 
  {
        int retcode=0;

	//p.230 EERD (EEPROM Read Register)
     	// EERD 0x14
	setRegister32(0x14, IOADDR);
	 
	//p.98 EEPROM address map
	// Write 0eh in address field, set START to 1 and wait until DONE is 1
	// value read is in Data which is ethernet address byte0 and byte1	
	setRegister32(0x00000e01, IODATA);

	do
	{
	   retcode = getRegister32(IODATA);
	}while((retcode & 0x00000010) == 0);

	retcode = getRegister32(IODATA);

	retcode = retcode & 0xffff0000; // mask bit(0-15)
	retcode = retcode >> 16;

    	return retcode;
  }


//------------------------------------------
// get eeprom init control word 1
// pg. 105
//------------------------------------------
int EtherObj::getEInitCtrl1() 
  {
        int retcode=0;

	//p.230 EERD (EEPROM Read Register)
     	// EERD 0x14
	setRegister32(0x14, IOADDR);
	 
	//p.98 EEPROM address map
	// Write 0ah in address field, set START to 1 and wait until DONE is 1
	// value read is in Data which is ethernet address byte0 and byte1	
	setRegister32(0x00000a01, IODATA);

	do
	{
	   retcode = getRegister32(IODATA);
	}while((retcode & 0x00000010) == 0);

	retcode = getRegister32(IODATA);

	retcode = retcode & 0xffff0000; // mask bit(0-15)
	retcode = retcode >> 16;

    	return retcode;
  }

//------------------------------------------
// get eeprom init control word 2
// pg. 107
//------------------------------------------
int EtherObj::getEInitCtrl2() 
  {
        int retcode=0;

	//p.230 EERD (EEPROM Read Register)
     	// EERD 0x14
	setRegister32(0x14, IOADDR);
	 
	//p.98 EEPROM address map
	// Write 0fh in address field, set START to 1 and wait until DONE is 1
	// value read is in Data which is ethernet address byte0 and byte1	
	setRegister32(0x00000f01, IODATA);

	do
	{
	   retcode = getRegister32(IODATA);
	}while((retcode & 0x00000010) == 0);

	retcode = getRegister32(IODATA);

	retcode = retcode & 0xffff0000; // mask bit(0-15)
	retcode = retcode >> 16;

    	return retcode;
  }

//------------------------------------------
// get eeprom management control word 
// pg. 113
//------------------------------------------
int EtherObj::getEMgmtCtrl() 
  {
        int retcode=0;

	//p.230 EERD (EEPROM Read Register)
     	// EERD 0x14
	setRegister32(0x14, IOADDR);
	 
	//p.98 EEPROM address map
	// Write 23h in address field, set START to 1 and wait until DONE is 1
	// value read is in Data which is ethernet address byte0 and byte1	
	setRegister32(0x00002301, IODATA);

	do
	{
	   retcode = getRegister32(IODATA);
	}while((retcode & 0x00000010) == 0);

	retcode = getRegister32(IODATA);

	retcode = retcode & 0xffff0000; // mask bit(0-15)
	retcode = retcode >> 16;

    	return retcode;
  }

//------------------------------------------
// get eeprom init control word 3
// pg. 115
//------------------------------------------
int EtherObj::getEInitCtrl3() 
  {
        int retcode=0;

	//p.230 EERD (EEPROM Read Register)
     	// EERD 0x14
	setRegister32(0x14, IOADDR);
	 
	//p.98 EEPROM address map
	// Write 24h in address field, set START to 1 and wait until DONE is 1
	// value read is in Data which is ethernet address byte0 and byte1	
	setRegister32(0x00002401, IODATA);

	do
	{
	   retcode = getRegister32(IODATA);
	}while((retcode & 0x00000010) == 0);

	retcode = getRegister32(IODATA);

	retcode = retcode & 0xffff0000; // mask bit(0-15)
	retcode = retcode >> 16;

    	return retcode;
  }

//------------------------------------------
// get eeprom ipv4 address byte(0-1)
// pg. 115
//------------------------------------------
int EtherObj::getEIPv4Byte01() 
  {
        int retcode=0;

	//p.230 EERD (EEPROM Read Register)
     	// EERD 0x14
	setRegister32(0x14, IOADDR);
	 
	//p.98 EEPROM address map
	// Write 25h in address field, set START to 1 and wait until DONE is 1
	// value read is in Data which is ethernet address byte0 and byte1	
	setRegister32(0x00002501, IODATA);

	do
	{
	   retcode = getRegister32(IODATA);
	}while((retcode & 0x00000010) == 0);

	retcode = getRegister32(IODATA);

	retcode = retcode & 0xffff0000; // mask bit(0-15)
	retcode = retcode >> 16;

    	return retcode;
  }

//------------------------------------------
// get eeprom ipv4 address byte(2-3)
// pg. 115
//------------------------------------------
int EtherObj::getEIPv4Byte23() 
  {
        int retcode=0;

	//p.230 EERD (EEPROM Read Register)
     	// EERD 0x14
	setRegister32(0x14, IOADDR);
	 
	//p.98 EEPROM address map
	// Write 26h in address field, set START to 1 and wait until DONE is 1
	// value read is in Data which is ethernet address byte0 and byte1	
	setRegister32(0x00002601, IODATA);

	do
	{
	   retcode = getRegister32(IODATA);
	}while((retcode & 0x00000010) == 0);

	retcode = getRegister32(IODATA);

	retcode = retcode & 0xffff0000; // mask bit(0-15)
	retcode = retcode >> 16;

    	return retcode;
  }

//------------------------------------------
// get control register
// pg. 220
//------------------------------------------
int EtherObj::getControl() 
  {
        int retcode=0;

     	// CTRL 0x00
	setRegister32(0x00, IOADDR);
	 
	retcode = getRegister32(IODATA);

    	return retcode;
  }

//------------------------------------------
// get status register
// pg. 225
//------------------------------------------
int EtherObj::getStatus() 
  {
        int retcode=0;

     	// STATUS 0x08
	setRegister32(0x08, IOADDR);
	 
	retcode = getRegister32(IODATA);

    	return retcode;
  }

//------------------------------------------
// get mdi control - PHY control register
// pg. 238
//------------------------------------------
int EtherObj::getMdicPhyCtrl() 
  {
        int retcode=0;

	//p.238 MDIC (MDI Control Register)
     	// MDIC 0x20
	setRegister32(0x20, IOADDR);
	 
	//    31        30          29              28        27  26  25    21 20    16 15         0 
	//------------------------------------------------------------------------------------------
	//| Reserved | Error | Interrupt Enable | Ready bit | Opcode | PHYADD | REGADD | DATA      |
	//------------------------------------------------------------------------------------------
	// Write 0h in REGADD, 
	// set Interrupt Enable to 0,
	// set Opcode to 10,
	// set PHYADD to 00001
	// set Ready bit to 0 and wait until Ready bit is 1
	// value read is in DATA
	
	setRegister32(0x08200000, IODATA);

	do
	{
	   retcode = getRegister32(IODATA);
	}while((retcode & 0x10000000) == 0);

	retcode = getRegister32(IODATA);

	retcode = retcode & 0x0000ffff; // mask bit(16-31)

    	return retcode;
  }

//------------------------------------------
// get mdi control - PHY status register
// pg. 244
//------------------------------------------
int EtherObj::getMdicPhyStat() 
  {
        int retcode=0;

	//p.238 MDIC (MDI Control Register)
     	// MDIC 0x20
	setRegister32(0x20, IOADDR);
	 
	//    31        30          29              28        27  26  25    21 20    16 15        0 
	//-----------------------------------------------------------------------------------------
	//| Reserved | Error | Interrupt Enable | Ready bit | Opcode | PHYADD | REGADD | DATA     |
	//-----------------------------------------------------------------------------------------
	// Write 1h in REGADD, 
	// set Interrupt Enable to 0,
	// set Opcode to 10,
	// set PHYADD to 00001
	// set Ready bit to 0 and wait until Ready bit is 1
	// value read is in DATA
	
	setRegister32(0x08210000, IODATA);

	do
	{
	   retcode = getRegister32(IODATA);
	}while((retcode & 0x10000000) == 0);

	retcode = getRegister32(IODATA);

	retcode = retcode & 0x0000ffff; // mask bit(16-31)

    	return retcode;
  }

//------------------------------------------
// get interrupt mask set register
// pg. 296
//------------------------------------------
int EtherObj::getInterruptMaskSet() 
  {
        int retcode=0;

     	// IMS 0xd0
	setRegister32(0xd0, IOADDR);
	 
	// 31  				      17 16            			      0 
	//-----------------------------------------------------------------------------
	//|             Reserved                |                IMS bits             |
	//-----------------------------------------------------------------------------

	retcode = getRegister32(IODATA);

    	return retcode;
  }

//------------------------------------------
// get interrupt mask clear register
// pg. 297
//------------------------------------------
int EtherObj::getInterruptMaskClear() 
  {
        int retcode=0;

     	// IMC 0xd8
	setRegister32(0xd8, IOADDR);
	 
	// 31  				      17 16            			      0 
	//-----------------------------------------------------------------------------
	//|             Reserved                |                 IMC bits            |
	//-----------------------------------------------------------------------------

	retcode = getRegister32(IODATA);

    	return retcode;
  }

//------------------------------------------
// get transmit descriptor base address low
// pg. 314
//------------------------------------------
int EtherObj::getTDBALow() 
  {
        int retcode=0;

     	// TDBAL 0x3800
	setRegister32(0x3800, IOADDR);
	 
	// Lower 4 bits are always 0
	// 31  				                	      4 3	      0 
	//-----------------------------------------------------------------------------
	//|                              TDBAL                         |      0       |  
	//-----------------------------------------------------------------------------

	retcode = getRegister32(IODATA);

    	return retcode;
  }

//------------------------------------------
// get receive descriptor base address low
// pg. 305
//------------------------------------------
int EtherObj::getRDBALow() 
  {
        int retcode=0;

     	// RDBAL 0x2800
	setRegister32(0x2800, IOADDR);
	 
	// Lower 4 bits are always 0
	// 31  				                	      4 3	      0 
	//-----------------------------------------------------------------------------
	//|                              RDBAL                         |      0       |  
	//-----------------------------------------------------------------------------

	retcode = getRegister32(IODATA);

    	return retcode;
  }

//------------------------------------------
// set transmit descriptor base address low
// pg. 314
//------------------------------------------
int EtherObj::setTDBALow(int addr) 
  {
        int retcode=0;
	int temp=0;

     	// TDBAL 0x3800
	setRegister32(0x3800, IOADDR);
	 
	// Lower 4 bits are always 0
	// 31  				                	      4 3	      0 
	//-----------------------------------------------------------------------------
	//|                              TDBAL                         |      0       |  
	//-----------------------------------------------------------------------------

	//mask lower 4 bits to 0
	temp = addr;
	temp = temp & 0xfffffff0;
	
	setRegister32(temp, IODATA);

    	return retcode;
  }

//------------------------------------------
// set receive descriptor base address low
// pg. 305
//------------------------------------------
int EtherObj::setRDBALow(int addr) 
  {
        int retcode=0;
	int temp=0;

     	// RDBAL 0x2800
	setRegister32(0x2800, IOADDR);
	 
	// Lower 4 bits are always 0
	// 31  				                	      4 3	      0 
	//-----------------------------------------------------------------------------
	//|                              RDBAL                         |      0       |  
	//-----------------------------------------------------------------------------

	//mask lower 4 bits to 0
	temp = addr;
	temp = temp & 0xfffffff0;
	
	setRegister32(temp, IODATA);

    	return retcode;
  }

//------------------------------------------
// get transmit descriptor base address high
// pg. 315
//------------------------------------------
int EtherObj::getTDBAHigh() 
  {
        int retcode=0;

     	// TDBAH 0x3804
	setRegister32(0x3804, IOADDR);
	 
	// 31  				                			      0 
	//-----------------------------------------------------------------------------
	//|                                    TDBAH                                  |  
	//-----------------------------------------------------------------------------

	retcode = getRegister32(IODATA);

    	return retcode;
  }

//------------------------------------------
// get receive descriptor base address high
// pg. 305
//------------------------------------------
int EtherObj::getRDBAHigh() 
  {
        int retcode=0;

     	// RDBAH 0x2804
	setRegister32(0x2804, IOADDR);
	 
	// 31  				                			      0 
	//-----------------------------------------------------------------------------
	//|                                    RDBAH                                  |  
	//-----------------------------------------------------------------------------

	retcode = getRegister32(IODATA);

    	return retcode;
  }

//------------------------------------------
// set transmit descriptor base address high
// pg. 315
//------------------------------------------
int EtherObj::setTDBAHigh(int addr) 
  {
        int retcode=0;

     	// TDBAH 0x3804
	setRegister32(0x3804, IOADDR);
	 
	// 31  				                			      0 
	//-----------------------------------------------------------------------------
	//|                                    TDBAH                                  |  
	//-----------------------------------------------------------------------------

	setRegister32(addr, IODATA);	

    	return retcode;
  }

//------------------------------------------
// set receive descriptor base address high
// pg. 305
//------------------------------------------
int EtherObj::setRDBAHigh(int addr) 
  {
        int retcode=0;

     	// RDBAH 0x2804
	setRegister32(0x2804, IOADDR);
	 
	// 31  				                			      0 
	//-----------------------------------------------------------------------------
	//|                                    RDBAH                                  |  
	//-----------------------------------------------------------------------------

	setRegister32(addr, IODATA);	

    	return retcode;
  }

//------------------------------------------
// get transmit descriptor length
// pg. 315
//------------------------------------------
int EtherObj::getTDLen() 
  {
        int retcode=0;

     	// TDLEN 0x3808
	setRegister32(0x3808, IOADDR);
	 
	// 31  			 20 19	                       7 6	               0 
	//------------------------------------------------------------------------------
	//|         Reserved       |             LEN            |          0           |  
	//------------------------------------------------------------------------------
	
	//LEN = Number of bytes in descriptor ring, which is always a multiple of 128
	//Number of descriptors = multiple of 8
	//Size of each descriptor = 16 bytes
	
	retcode = getRegister32(IODATA);

    	return retcode;
  }

//------------------------------------------
// get receive descriptor length
// pg. 306
//------------------------------------------
int EtherObj::getRDLen() 
  {
        int retcode=0;

     	// RDLEN 0x2808
	setRegister32(0x2808, IOADDR);
	 
	// 31  			 20 19	                       7 6	               0 
	//------------------------------------------------------------------------------
	//|         Reserved       |             LEN            |          0           |  
	//------------------------------------------------------------------------------
	
	//LEN = Number of bytes in descriptor ring, which is always a multiple of 128
	//Number of descriptors = multiple of 8
	//Size of each descriptor = 16 bytes
	
	retcode = getRegister32(IODATA);

    	return retcode;
  }

//------------------------------------------
// set transmit descriptor length
// pg. 315
//------------------------------------------
int EtherObj::setTDLen(int len) 
  {
        int retcode=0;
	int temp=0;

     	// TDLEN 0x3808
	setRegister32(0x3808, IOADDR);
	 
	// 31  			 20 19	                       7 6	               0 
	//------------------------------------------------------------------------------
	//|         Reserved       |             LEN            |          0           |  
	//------------------------------------------------------------------------------
	
	//Number of descriptors = multiple of 8
	//Size of each descriptor = 16 bytes
	//p306 if we use 8000 descriptors, then 8000 = 0x1F40 is the LEN field 
	//0000 0000 0000 0000 0000 0000 0000 0000 
	//0000 0000 0000 1111 1010 0000 0000 0000
	
	//mask all other bits except lower 13 bits because LEN is 13 bits long
	temp = len;
	temp = temp & 0x00001fff;
	temp = temp << 7; // left shift 7 bits so that LEN is bit[7:19]
	
	setRegister32(temp, IODATA);	

    	return retcode;
  }

//------------------------------------------
// set receive descriptor length
// pg. 306
//------------------------------------------
int EtherObj::setRDLen(int len) 
  {
        int retcode=0;
	int temp=0;

     	// RDLEN 0x2808
	setRegister32(0x2808, IOADDR);
	 
	// 31  			 20 19	                       7 6	               0 
	//------------------------------------------------------------------------------
	//|         Reserved       |             LEN            |          0           |  
	//------------------------------------------------------------------------------
	
	//Number of descriptors = multiple of 8
	//Size of each descriptor = 16 bytes
	//p306 if we use 8000 descriptors, then 8000 = 0x1F40 is the LEN field 
	//0000 0000 0000 0000 0000 0000 0000 0000 
	//0000 0000 0000 1111 1010 0000 0000 0000
	
	//mask all other bits except lower 13 bits because LEN is 13 bits long
	temp = len;
	temp = temp & 0x00001fff;
	temp = temp << 7; // left shift 7 bits so that LEN is bit[7:19]
	
	setRegister32(temp, IODATA);	

    	return retcode;
  }

//------------------------------------------
// get transmit descriptor head
// pg. 316
//------------------------------------------
int EtherObj::getTDHead() 
  {
        int retcode=0;

     	// TDH 0x3810
	setRegister32(0x3810, IOADDR);
	 
	// 31  			                 16 15	                              0 
	//-----------------------------------------------------------------------------
	//|                Reserved                |              TDH                 |  
	//-----------------------------------------------------------------------------
	
	retcode = getRegister32(IODATA);

    	return retcode;
  }

//------------------------------------------
// get receive descriptor head
// pg. 306
//------------------------------------------
int EtherObj::getRDHead() 
  {
        int retcode=0;

     	// RDH 0x2810
	setRegister32(0x2810, IOADDR);
	 
	// 31  			                 16 15	                              0 
	//-----------------------------------------------------------------------------
	//|                Reserved                |              RDH                 |  
	//-----------------------------------------------------------------------------
	
	retcode = getRegister32(IODATA);

    	return retcode;
  }

//------------------------------------------
// set transmit descriptor head
// pg. 316
//------------------------------------------
int EtherObj::setTDHead(int headindex) 
  {
        int retcode=0;
	int temp=0;

     	// TDH 0x3810
	setRegister32(0x3810, IOADDR);
	 
	// 31  			                 16 15	                              0 
	//-----------------------------------------------------------------------------
	//|                Reserved                |              TDH                 |  
	//-----------------------------------------------------------------------------
	
	//mask higher 16 bits
	temp = headindex;
	temp = temp & 0x0000ffff;
	
	setRegister32(temp, IODATA);

    	return retcode;
  }

//------------------------------------------
// set receive descriptor head
// pg. 306
//------------------------------------------
int EtherObj::setRDHead(int headindex) 
  {
        int retcode=0;
	int temp=0;

     	// RDH 0x2810
	setRegister32(0x2810, IOADDR);
	 
	// 31  			                 16 15	                              0 
	//-----------------------------------------------------------------------------
	//|                Reserved                |              RDH                 |  
	//-----------------------------------------------------------------------------
	
	//mask higher 16 bits
	temp = headindex;
	temp = temp & 0x0000ffff;
	
	setRegister32(temp, IODATA);

    	return retcode;
  } 

//------------------------------------------
// get transmit descriptor tail
// pg. 317
//------------------------------------------
int EtherObj::getTDTail() 
  {
        int retcode=0;

     	// TDT 0x3818
	setRegister32(0x3818, IOADDR);
	 
	// 31  			                 16 15	                              0 
	//-----------------------------------------------------------------------------
	//|                Reserved                |              TDT                 |  
	//-----------------------------------------------------------------------------
	
	retcode = getRegister32(IODATA);

    	return retcode;
  }

//------------------------------------------
// get receive descriptor tail
// pg. 307
//------------------------------------------
int EtherObj::getRDTail() 
  {
        int retcode=0;

     	// RDT 0x2818
	setRegister32(0x2818, IOADDR);
	 
	// 31  			                 16 15	                              0 
	//-----------------------------------------------------------------------------
	//|                Reserved                |              RDT                 |  
	//-----------------------------------------------------------------------------
	
	retcode = getRegister32(IODATA);

    	return retcode;
  }

//------------------------------------------
// set transmit descriptor tail
// pg. 317
//------------------------------------------
int EtherObj::setTDTail(int tailindex) 
  {
    int retcode=0;
	int temp=0;

    // TDT 0x3818
	setRegister32(0x3818, IOADDR);
	 
	// 31  			                 16 15	                              0 
	//-----------------------------------------------------------------------------
	//|                Reserved                |              TDT                 |  
	//-----------------------------------------------------------------------------
	
	//mask higher 16 bits
	temp = tailindex;
	temp = temp & 0x0000ffff;
	
	setRegister32(temp, IODATA);

    return retcode;
  }

//------------------------------------------
// set receive descriptor tail
// pg. 307
//------------------------------------------
int EtherObj::setRDTail(int tailindex) 
  {
        int retcode=0;
	int temp=0;

     	// RDT 0x2818
	setRegister32(0x2818, IOADDR);
	 
	// 31  			                 16 15	                              0 
	//-----------------------------------------------------------------------------
	//|                Reserved                |              RDT                 |  
	//-----------------------------------------------------------------------------
	
	//mask higher 16 bits
	temp = tailindex;
	temp = temp & 0x0000ffff;
	
	setRegister32(temp, IODATA);

    	return retcode;
  }

//------------------------------------------
// get transmit control
// pg. 309
//------------------------------------------
int EtherObj::getTCtrl() 
  {
        int retcode=0;

     	// TCTL 0x0400
	setRegister32(0x0400, IOADDR);
	 
	// 31        26 25       22 21             12 11               4 3            0
	//-----------------------------------------------------------------------------
	//|  Reserved  | CNTL bits |      COLD       |        CT        |  CNTL bits  |  
	//-----------------------------------------------------------------------------
	
	retcode = getRegister32(IODATA);

    	return retcode;
  }

//------------------------------------------
// get receive control
// pg. 299
//------------------------------------------
int EtherObj::getRCtrl() 
  {
        int retcode=0;

     	// RCTL 0x0100
	setRegister32(0x0100, IOADDR);
	 
	// 31        27 26                                                            0
	//-----------------------------------------------------------------------------
	//|  Reserved  |                     Receive Control bits                     |  
	//-----------------------------------------------------------------------------
	
	retcode = getRegister32(IODATA);

    	return retcode;
  }

//------------------------------------------
// set transmit control
// pg. 309
//------------------------------------------
int EtherObj::setTCtrl(int value) 
  {
        int retcode=0;

     	// TCTL 0x0400
	setRegister32(0x0400, IOADDR);
	 
	// 31        26 25       22 21             12 11               4 3            0
	//-----------------------------------------------------------------------------
	//|  Reserved  | CNTL bits |      COLD       |        CT        |  CNTL bits  |  
	//-----------------------------------------------------------------------------
	
	setRegister32(value, IODATA);

    	return retcode;
  }

//------------------------------------------
// set receive control
// pg. 299
//------------------------------------------
int EtherObj::setRCtrl(int value) 
  {
        int retcode=0;

     	// RCTL 0x0100
	setRegister32(0x0100, IOADDR);
	 
	// 31        27 26                                                            0
	//-----------------------------------------------------------------------------
	//|  Reserved  |                     Receive Control bits                     |  
	//-----------------------------------------------------------------------------
	
	setRegister32(value, IODATA);

    	return retcode;
  }

//------------------------------------------
// enable transmitter
// pg. 309
//------------------------------------------
int EtherObj::TEnable() 
  {
        int retcode=0;

	// bit1 = Transmit enable
	// make bit1 = 1
	retcode = setTCtrl(0x002000f2);	

    	return retcode;
  }

//------------------------------------------
// enable receiver
// pg. 299
//------------------------------------------
int EtherObj::REnable() 
  {
        int retcode=0;

	// bit1 = Receiver enable
	// make bit1 = 1
	// bit3 = 1 (Unicast Promiscuous Enabled)
	// bit15 = 1 (Broadcast Accept Mode)
	// bit22 = 1 (Discard Pause Frames)
	// bit26 = 1 (Strip Ethernet CRC from incoming packet)
	
	//retcode = setRCtrl(0x0440800a);//bit3 = 1	
	retcode = setRCtrl(0x04408002); //bit3 = 0	

    	return retcode;
  }

//------------------------------------------
// cold reset
// pg. 220
//------------------------------------------
int EtherObj::ColdReset() 
  {
        int retcode=0;

	// bit26 = device reset
	// make bit26 = 1

    	// CTRL 0x0000
	setRegister32(0x0000, IOADDR);
	 
	setRegister32(0x04000000, IODATA);	

	retcode = getRegister32(IODATA);

	retcode = retcode & 0x04000000;
	
	while(retcode != 0)
	{
	   // wait until device reset bit is cleared
	   retcode = getRegister32(IODATA);
           retcode = retcode & 0x04000000;
	}
	io.AOAPrintText("Cold reset is successful", Line23);
	
    	return retcode;
  }

//------------------------------------------
// hot reset
//------------------------------------------
int EtherObj::HotReset() 
  {
        int retcode=0;

	retcode = ColdReset();

	retcode = inittest(DPD_ADDR, DPD_DATA, UPD_ADDR, UPD_DATA);
	retcode = TEnable();
	retcode = REnable();
	
	io.AOAPrintText("    Hot reset is successful", Line23);
    	return retcode;
  }

//------------------------------------------
// disable transmitter
// pg. 309
//------------------------------------------
int EtherObj::TDisable() 
  {
        int retcode=0;

	// bit1 = Transmit enable
	// make bit1 = 0
	retcode = setTCtrl(0x00000000);	

    	return retcode;
  }

//------------------------------------------
// disable receiver
// pg. 299
//------------------------------------------
int EtherObj::RDisable() 
  {
        int retcode=0;

	// bit1 = Receiver enable
	// make bit1 = 0
	retcode = setRCtrl(0x00000000);	

    	return retcode;
  }

//--------------------------------------------
// fill transmitter data buffer with character
//--------------------------------------------
int EtherObj::setTData(int index, int value, int noOfBytes) 
  {
      	int i=0;
        int retcode=0;
	long *lptr;
	long l1=0;
	lptr = &l1;

	long ldata=0;
	
	for(i=0; i<4; i++)
	{
	   //ldata = ldata | ( ch & 0x000000ff);
	   ldata = value;
	   if(i<3)
	   {
	     ldata = ldata << 8;
	   }
	}
	
	
	lptr = (long*)(TDLDataPointer + index * T_BUFFER_SIZE - ADDR_OFFSET);
	
	for(i=0; i<noOfBytes; i++)
	{
	   lptr[i] = ldata;
	}
	
    	return retcode;
  }

//--------------------------------------------
// get receiver data buffer
//--------------------------------------------
int EtherObj::printRReadData(int index, int noOfBytes, int line) 
  {
        int i=0;
        int retcode=0;
	long *lptr;
	long l1=0;
	lptr = &l1;
	long temp[100];
	
	lptr = (long*)(RDLDataPointer + index * R_BUFFER_SIZE - ADDR_OFFSET);
	
	for(i=0; i<noOfBytes; i++)
	    temp[i] = lptr[i];

	for(i=0; i<noOfBytes; i++)
	    io.AOAprintHex((long)temp[i], line+i*20);
	
    	return retcode;
  }

//--------------------------------------------
// get transmitter data buffer
//--------------------------------------------
int EtherObj::printTReadData(int index, int noOfBytes, int line) 
  {
        int i=0;
        int retcode=0;
	long *lptr;
	long l1=0;
	lptr = &l1;
	long temp[100];
	
	lptr = (long*)(TDLDataPointer + index * T_BUFFER_SIZE - ADDR_OFFSET);
	
	for(i=0; i<noOfBytes; i++)
	    temp[i] = lptr[i];

	for(i=0; i<noOfBytes; i++)
	    io.AOAprintHex((long)temp[i], line+i*20);
	
    	return retcode;
  }

//------------------------------------------
// is transmit descriptor done
// pg. 40
//------------------------------------------
int EtherObj::isTDescDone(int index) 
  {
    int retcode=0;
	long *lptr;
	long l1=0;
	lptr = &l1;
	int temp=0;

	// 16 is size of each descriptor
	lptr = (long*)(TDLPointer + index*16 - ADDR_OFFSET);
	
	lptr++;
	lptr++;
	lptr++;   //4th word last bit for status  

	temp = *lptr;

	temp = temp & 0x00000001;

	if(temp == 1)
	    retcode = 1;
	else
	    retcode = 0;

    	return retcode;
  }

//------------------------------------------
// is receive descriptor done
// pg. 22
//------------------------------------------
int EtherObj::isRDescDone(int index) 
  {
        int retcode=0;
	long *lptr;
	long l1=0;
	lptr = &l1;
	int temp=0;

	// 16 is size of each descriptor
	lptr = (long*)(RDLPointer + index*16 - ADDR_OFFSET);
	
	lptr++;
	lptr++;
	lptr++;

	temp = *lptr;

	//temp = temp & 0x00000001;
	temp = temp & 0x00000001;

	if(temp == 1)
	    retcode = 1;
	else
	    retcode = 0;

    	return retcode;
  }

//------------------------------------------
// reset transmit descriptor done bit
// pg. 40
//------------------------------------------
int EtherObj::resetTDescDone(int index) 
  {
    int retcode=0;
	long *lptr;
	long l1=0;
	lptr = &l1;
	int temp=0;

	// Size of descriptor = 16 bytes
	lptr = (long*)(TDLPointer + index * 16 - ADDR_OFFSET);
	
	lptr++;
	lptr++;
	lptr++;

	temp = *lptr;

	temp = temp & 0xfffffff0;

	*lptr = temp;

    	return retcode;
  }

//------------------------------------------
// reset receive descriptor done bit
// pg. 22
//------------------------------------------
int EtherObj::resetRDescDone(int index) 
  {
        int retcode=0;
	long *lptr;
	long l1=0;
	lptr = &l1;
	int temp=0;

	// Size of descriptor = 16 bytes
	lptr = (long*)(RDLPointer + index * 16 - ADDR_OFFSET);
	
	lptr++;
	lptr++;
	lptr++;

	temp = *lptr;

	temp = temp & 0xffffff00; // reset status byte

	*lptr = temp;

    	return retcode;
  }

//------------------------------------------
// get receive address low - register 0 
// pg. 328
//------------------------------------------
int EtherObj::getRAL0() 
  {
        int retcode=0;

     	// RAL0 0x5400
	setRegister32(0x5400, IOADDR);
	 
	// 31                                                                         0
	//-----------------------------------------------------------------------------
	//|                                    RAL                                    |  
	//-----------------------------------------------------------------------------
        // RAL = Lower 32-bit of 48-bit ethernet address
	
	retcode = getRegister32(IODATA);

    	return retcode;
  }

//------------------------------------------
// set receive address low - register 0
// pg. 328
//------------------------------------------
int EtherObj::setRAL0(int value) 
  {
        int retcode=0;

     	// RAL0 0x5400
	setRegister32(0x5400, IOADDR);
	 
	// 31                                                                         0
	//-----------------------------------------------------------------------------
	//|                                    RAL                                    |  
	//-----------------------------------------------------------------------------
        // RAL = Lower 32-bit of 48-bit ethernet address
	
	setRegister32(value, IODATA);

    	return retcode;
  }

//------------------------------------------
// get receive address high - register 0 
// pg. 328
//------------------------------------------
int EtherObj::getRAH0() 
  {
        int retcode=0;

     	// RAH0 0x5404
	setRegister32(0x5404, IOADDR);
	 
	//  31  30                     18 17  16 15                                   0
	//-----------------------------------------------------------------------------
	//| AV |         Reserved        |  AS  |                RAL                  |  
	//-----------------------------------------------------------------------------
        // AV (Address Valid) 1 = Incoming packet is compared against this address
	// AS (Address Select) 00 = Destination address; how this address is to be used as(src or dst)
	// RAH = Upper 16 bits of 48-bit ethernet address
	 
	retcode = getRegister32(IODATA);

    	return retcode;
  }

//------------------------------------------
// set receive address high - register 0
// pg. 328
//------------------------------------------
int EtherObj::setRAH0(int value) 
  {
        int retcode=0;
	int temp=0;

	temp = value & 0x0000ffff;
	temp = temp | 0x80000000; // bit31 = 1

     	// RAH0 0x5404
	setRegister32(0x5404, IOADDR);
	 
	//  31  30                     18 17  16 15                                   0
	//-----------------------------------------------------------------------------
	//| AV |         Reserved        |  AS  |                RAL                  |  
	//-----------------------------------------------------------------------------
        // AV (Address Valid) 1 = Incoming packet is compared against this address
	// AS (Address Select) 00 = Destination address; how this address is to be used as(src or dst)
	// RAH = Upper 16 bits of 48-bit ethernet address
	
	setRegister32(temp, IODATA);

    	return retcode;
  }

//------------------------------------------
// get receive address low - register 1 
// pg. 328
//------------------------------------------
int EtherObj::getRAL1() 
  {
        int retcode=0;

     	// RAL1 0x5408
	setRegister32(0x5408, IOADDR);
	 
	// 31                                                                         0
	//-----------------------------------------------------------------------------
	//|                                    RAL                                    |  
	//-----------------------------------------------------------------------------
        // RAL = Lower 32-bit of 48-bit ethernet address
	
	retcode = getRegister32(IODATA);

    	return retcode;
  }

//------------------------------------------
// set receive address low - register 1
// pg. 328
//------------------------------------------
int EtherObj::setRAL1(int value) 
  {
        int retcode=0;

     	// RAL1 0x5408
	setRegister32(0x5408, IOADDR);
	 
	// 31                                                                         0
	//-----------------------------------------------------------------------------
	//|                                    RAL                                    |  
	//-----------------------------------------------------------------------------
        // RAL = Lower 32-bit of 48-bit ethernet address
	
	setRegister32(value, IODATA);

    	return retcode;
  }

//------------------------------------------
// get receive address high - register 1 
// pg. 328
//------------------------------------------
int EtherObj::getRAH1() 
  {
        int retcode=0;

     	// RAH1 0x540c
	setRegister32(0x540c, IOADDR);
	 
	//  31  30                     18 17  16 15                                   0
	//-----------------------------------------------------------------------------
	//| AV |         Reserved        |  AS  |                RAL                  |  
	//-----------------------------------------------------------------------------
        // AV (Address Valid) 1 = Incoming packet is compared against this address
	// AS (Address Select) 00 = Destination address; how this address is to be used as(src or dst)
	// RAH = Upper 16 bits of 48-bit ethernet address
	 
	retcode = getRegister32(IODATA);

    	return retcode;
  }

//------------------------------------------
// set receive address high - register 1
// pg. 328
//------------------------------------------
int EtherObj::setRAH1(int value) 
  {
        int retcode=0;
	int temp=0;

	temp = value & 0x0000ffff;
	temp = temp | 0x80000000; // bit31 = 1

     	// RAH1 0x540c
	setRegister32(0x540c, IOADDR);
	 
	//  31  30                     18 17  16 15                                   0
	//-----------------------------------------------------------------------------
	//| AV |         Reserved        |  AS  |                RAL                  |  
	//-----------------------------------------------------------------------------
        // AV (Address Valid) 1 = Incoming packet is compared against this address
	// AS (Address Select) 00 = Destination address; how this address is to be used as(src or dst)
	// RAH = Upper 16 bits of 48-bit ethernet address
	
	setRegister32(temp, IODATA);

    	return retcode;
  }

//--------------------------------------------
// print TDL 
//--------------------------------------------
int EtherObj::printTDL(int index, int line) 
  {
      	int i=0;
        int retcode=0;
	long *lptr;
	long l1=0;
	lptr = &l1;
	long x=0;
	int temp=0;

	// Size of descriptor = 16 bytes
	x = TDLPointer + index * 16 - ADDR_OFFSET;
	
	lptr = (long*)x;
	
	temp = *lptr;
	io.AOAprintHex(temp, line);
	lptr++;
	temp = *lptr;
	io.AOAprintHex(temp, line+20);
	lptr++;
	temp = *lptr;
	io.AOAprintHex(temp, line+40);
	lptr++;
	temp = *lptr;
	io.AOAprintHex(temp, line+60);
	lptr++;

    	return retcode;
  }

//--------------------------------------------
// print RDL 
//--------------------------------------------
int EtherObj::printRDL(int index, int line) 
  {
      	int i=0;
        int retcode=0;
	long *lptr;
	long l1=0;
	lptr = &l1;
	long x=0;
	int temp=0;

	// Size of descriptor = 16 bytes
	x = RDLPointer + index * 16 - ADDR_OFFSET;
	
	lptr = (long*)x;

	temp = *lptr;
	io.AOAprintHex(temp, line);
	lptr++;
	temp = *lptr;
	io.AOAprintHex(temp, line+20);
	lptr++;
	temp = *lptr;
	io.AOAprintHex(temp, line+40);
	lptr++;
	temp = *lptr;
	io.AOAprintHex(temp, line+60);
	lptr++;

    	return retcode;
  }

//------------------------------------------
// get packets received count 64 bytes 
// pg. 349
//------------------------------------------
int EtherObj::getPRC64() 
  {
        int retcode=0;

     	// PRC64 0x405c
	setRegister32(0x405c, IOADDR);
	 
	// 31                                                                         0
	//-----------------------------------------------------------------------------
	//|                                   PRC64                                   |  
	//-----------------------------------------------------------------------------
	
	retcode = getRegister32(IODATA);

    	return retcode;
  }

//------------------------------------------
// get packets received count 65-127 bytes 
// pg. 350
//------------------------------------------
int EtherObj::getPRC127() 
  {
        int retcode=0;

     	// PRC127 0x4060
	setRegister32(0x4060, IOADDR);
	 
	// 31                                                                         0
	//-----------------------------------------------------------------------------
	//|                                   PRC127                                  |  
	//-----------------------------------------------------------------------------
	
	retcode = getRegister32(IODATA);

    	return retcode;
  }

//------------------------------------------
// get packets received count 128-255 bytes 
// pg. 350
//------------------------------------------
int EtherObj::getPRC255() 
  {
        int retcode=0;

     	// PRC255 0x4064
	setRegister32(0x4064, IOADDR);
	 
	// 31                                                                         0
	//-----------------------------------------------------------------------------
	//|                                   PRC255                                  |  
	//-----------------------------------------------------------------------------
	
	retcode = getRegister32(IODATA);

    	return retcode;
  }

//------------------------------------------
// get packets received count 256-511 bytes 
// pg. 351
//------------------------------------------
int EtherObj::getPRC511() 
  {
        int retcode=0;

     	// PRC511 0x4068
	setRegister32(0x4068, IOADDR);
	 
	// 31                                                                         0
	//-----------------------------------------------------------------------------
	//|                                   PRC511                                  |  
	//-----------------------------------------------------------------------------
	
	retcode = getRegister32(IODATA);

    	return retcode;
  }

//------------------------------------------
// get packets received count 512-1023 bytes 
// pg. 351
//------------------------------------------
int EtherObj::getPRC1023() 
  {
        int retcode=0;

     	// PRC1023 0x406c
	setRegister32(0x406c, IOADDR);
	 
	// 31                                                                         0
	//-----------------------------------------------------------------------------
	//|                                   PRC1023                                  |  
	//-----------------------------------------------------------------------------
	
	retcode = getRegister32(IODATA);

    	return retcode;
  }

//------------------------------------------
// get packets received count 1024-max bytes 
// pg. 352
//------------------------------------------
int EtherObj::getPRC1522() 
  {
        int retcode=0;

     	// PRC1522 0x4070
	setRegister32(0x4070, IOADDR);
	 
	// 31                                                                         0
	//-----------------------------------------------------------------------------
	//|                                   PRC1522                                  |  
	//-----------------------------------------------------------------------------
	
	retcode = getRegister32(IODATA);

    	return retcode;
  }

//------------------------------------------
// get good packets received count 
// pg. 352
//------------------------------------------
int EtherObj::getGPRC() 
  {
        int retcode=0;

     	// GPRC 0x4074
	setRegister32(0x4074, IOADDR);
	 
	// 31                                                                         0
	//-----------------------------------------------------------------------------
	//|                                   GPRC                                    |  
	//-----------------------------------------------------------------------------
	
	retcode = getRegister32(IODATA);

    	return retcode;
  }
//------------------------------------------
// interrupt cause read register 
// pg. 289 
//------------------------------------------
int EtherObj::getICR() 
  {
        int retcode=0;

     	// get ICR 0x000c0 
	setRegister32(0x00c0, IOADDR);
	// 31                                                                         0
	//-----------------------------------------------------------------------------
	//|                                   ICR                                     |  
	//-----------------------------------------------------------------------------
	//0 - TXDW trasmit descriptor written back 
	//1 - TXQE transmit queue empty 
	//2 - LSC  link status change 
	//3 - RXSEQ receive sequence error 
	//-----------------------------------
	//4 - RXDMT0 receive descriptor minimum threshold reached 
	//5  - reserved 
	//6  - RXO receiver overrun, no available FIFO, or BW is inadequate 
	//7  - RXT0 receiver timer interrupt 
	//-----------------------------------
	//
	retcode = getRegister32(IODATA);
    	return retcode;
  }
//------------------------------------------
// get broadcast packets received count 
// pg. 353
//------------------------------------------
int EtherObj::getBPRC() 
  {
        int retcode=0;

     	// BPRC 0x4078
	setRegister32(0x4078, IOADDR);
	 
	// 31                                                                         0
	//-----------------------------------------------------------------------------
	//|                                   BPRC                                    |  
	//-----------------------------------------------------------------------------
	
	retcode = getRegister32(IODATA);

    	return retcode;
  }

//------------------------------------------
// get multicast packets received count 
// pg. 353
//------------------------------------------
int EtherObj::getMPRC() 
  {
        int retcode=0;

     	// MPRC 0x407c
	setRegister32(0x407c, IOADDR);
	 
	// 31                                                                         0
	//-----------------------------------------------------------------------------
	//|                                   MPRC                                    |  
	//-----------------------------------------------------------------------------
	
	retcode = getRegister32(IODATA);

    	return retcode;
  }

//------------------------------------------
// get good packets transmitted count 
// pg. 354
//------------------------------------------
int EtherObj::getGPTC() 
  {
        int retcode=0;

     	// GPTC 0x4080
	setRegister32(0x4080, IOADDR);
	 
	// 31                                                                         0
	//-----------------------------------------------------------------------------
	//|                                   GPTC                                    |  
	//-----------------------------------------------------------------------------
	
	retcode = getRegister32(IODATA);

    	return retcode;
  }

//------------------------------------------
// get receive no buffers count 
// pg. 355
//------------------------------------------
int EtherObj::getRNBC() 
  {
        int retcode=0;

     	// RNBC 0x40a0
	setRegister32(0x40a0, IOADDR);
	 
	// 31                                                                         0
	//-----------------------------------------------------------------------------
	//|                                   RNBC                                    |  
	//-----------------------------------------------------------------------------
	
	retcode = getRegister32(IODATA);

    	return retcode;
  }

//------------------------------------------
// get total packets received
// pg. 361
//------------------------------------------
int EtherObj::getTPR() 
  {
        int retcode=0;

     	// TPR 0x40d0
	setRegister32(0x40d0, IOADDR);
	 
	// 31                                                                         0
	//-----------------------------------------------------------------------------
	//|                                   TPR                                     |  
	//-----------------------------------------------------------------------------
	
	retcode = getRegister32(IODATA);

    	return retcode;
  }

//------------------------------------------
// get total packets transmitted
// pg. 361
//------------------------------------------
int EtherObj::getTPT() 
  {
        int retcode=0;

     	// TPT 0x40d4
	setRegister32(0x40d4, IOADDR);
	 
	// 31                                                                         0
	//-----------------------------------------------------------------------------
	//|                                   TPT                                     |  
	//-----------------------------------------------------------------------------
	
	retcode = getRegister32(IODATA);

    	return retcode;
  }

//------------------------------------------
// get packets transmitted count 64 bytes 
// pg. 362
//------------------------------------------
int EtherObj::getPTC64() 
  {
        int retcode=0;

     	// PTC64 0x40d8
	setRegister32(0x40d8, IOADDR);
	 
	// 31                                                                         0
	//-----------------------------------------------------------------------------
	//|                                   PTC64                                   |  
	//-----------------------------------------------------------------------------
	
	retcode = getRegister32(IODATA);

    	return retcode;
  }

//------------------------------------------
// get packets transmitted count 65-127 bytes 
// pg. 362
//------------------------------------------
int EtherObj::getPTC127() 
  {
        int retcode=0;

     	// PTC127 0x40dc
	setRegister32(0x40dc, IOADDR);
	 
	// 31                                                                         0
	//-----------------------------------------------------------------------------
	//|                                   PTC127                                  |  
	//-----------------------------------------------------------------------------
	
	retcode = getRegister32(IODATA);

    	return retcode;
  }

//------------------------------------------
// get packets transmitted count 128-255 bytes 
// pg. 363
//------------------------------------------
int EtherObj::getPTC255() 
  {
        int retcode=0;

     	// PTC255 0x40e0
	setRegister32(0x40e0, IOADDR);
	
	// 31                                                                         0
	//-----------------------------------------------------------------------------
	//|                                   PTC255                                  |  
	//-----------------------------------------------------------------------------
	
	retcode = getRegister32(IODATA);

    	return retcode;
  }

//------------------------------------------
// get packets transmitted count 256-511 bytes 
// pg. 363
//------------------------------------------
int EtherObj::getPTC511() 
  {
        int retcode=0;

     	// PTC511 0x40e4
	setRegister32(0x40e4, IOADDR);
	 
	// 31                                                                         0
	//-----------------------------------------------------------------------------
	//|                                   PTC511                                  |  
	//-----------------------------------------------------------------------------
	
	retcode = getRegister32(IODATA);

    	return retcode;
  }

//------------------------------------------
// get packets transmitted count 512-1023 bytes 
// pg. 364
//------------------------------------------
int EtherObj::getPTC1023() 
  {
        int retcode=0;

     	// PTC1023 0x40e8
	setRegister32(0x40e8, IOADDR);
	 
	// 31                                                                         0
	//-----------------------------------------------------------------------------
	//|                                   PTC1023                                  |  
	//-----------------------------------------------------------------------------
	
	retcode = getRegister32(IODATA);

    	return retcode;
  }

//------------------------------------------
// get packets transmitted count 1024-max bytes 
// pg. 364
//------------------------------------------
int EtherObj::getPTC1522() 
  {
        int retcode=0;

     	// PTC1522 0x40ec
	setRegister32(0x40ec, IOADDR);
	 
	// 31                                                                         0
	//-----------------------------------------------------------------------------
	//|                                   PRC1522                                  |  
	//-----------------------------------------------------------------------------
	
	retcode = getRegister32(IODATA);

    	return retcode;
  }

//------------------------------------------
// get multicast packets transmitted count 
// pg. 365
//------------------------------------------
int EtherObj::getMPTC() 
  {
        int retcode=0;

     	// MPTC 0x40f0
	setRegister32(0x40f0, IOADDR);
	 
	// 31                                                                         0
	//-----------------------------------------------------------------------------
	//|                                   MPTC                                    |  
	//-----------------------------------------------------------------------------
	
	retcode = getRegister32(IODATA);

    	return retcode;
  }

//------------------------------------------
// get broadcast packets transmitted count 
// pg. 365
//------------------------------------------
int EtherObj::getBPTC() 
  {
        int retcode=0;

     	// BPTC 0x40f4
	setRegister32(0x40f4, IOADDR);
	 
	// 31                                                                         0
	//-----------------------------------------------------------------------------
	//|                                   BPTC                                    |  
	//-----------------------------------------------------------------------------
	
	retcode = getRegister32(IODATA);

    	return retcode;
  }

//------------------------------------------
// get single collision count 
// pg. 342
//------------------------------------------
int EtherObj::getSCC() 
  {
        int retcode=0;

     	// SCC 0x4014
	setRegister32(0x4014, IOADDR);
	 
	// 31                                                                         0
	//-----------------------------------------------------------------------------
	//|                                    SCC                                    |  
	//-----------------------------------------------------------------------------
	
	retcode = getRegister32(IODATA);

    	return retcode;
  }

//------------------------------------------
// get excessive collisions count 
// pg. 343
//------------------------------------------
int EtherObj::getECOL() 
  {
        int retcode=0;

     	// ECOL 0x4018
	setRegister32(0x4018, IOADDR);
	 
	// 31                                                                         0
	//-----------------------------------------------------------------------------
	//|                                   ECOL                                    |  
	//-----------------------------------------------------------------------------
	
	retcode = getRegister32(IODATA);

    	return retcode;
  }

//------------------------------------------
// get multiple collision count 
// pg. 343
//------------------------------------------
int EtherObj::getMCC() 
  {
        int retcode=0;

     	// MCC 0x401c
	setRegister32(0x401c, IOADDR);
	 
	// 31                                                                         0
	//-----------------------------------------------------------------------------
	//|                                   MCC                                     |  
	//-----------------------------------------------------------------------------
	
	retcode = getRegister32(IODATA);

    	return retcode;
  }

//------------------------------------------
// get late collisions count 
// pg. 344
//------------------------------------------
int EtherObj::getLATECOL() 
  {
        int retcode=0;

     	// LATECOL 0x4020
	setRegister32(0x4020, IOADDR);
	 
	// 31                                                                         0
	//-----------------------------------------------------------------------------
	//|                                   LCC                                     |  
	//-----------------------------------------------------------------------------
	
	retcode = getRegister32(IODATA);

    	return retcode;
  }

//------------------------------------------
// get collision count 
// pg. 344
//------------------------------------------
int EtherObj::getCOLC() 
  {
        int retcode=0;

     	// COLC 0x4028
	setRegister32(0x4028, IOADDR);
	 
	// 31                                                                         0
	//-----------------------------------------------------------------------------
	//|                                   COLC                                    |  
	//-----------------------------------------------------------------------------
	
	retcode = getRegister32(IODATA);

    	return retcode;
  }

//------------------------------------------
// get defer count 
// pg. 345
//------------------------------------------
int EtherObj::getDC() 
  {
        int retcode=0;

     	// DC 0x4030
	setRegister32(0x4030, IOADDR);
	 
	// 31                                                                         0
	//-----------------------------------------------------------------------------
	//|                                   DC                                      |  
	//-----------------------------------------------------------------------------
	
	retcode = getRegister32(IODATA);

    	return retcode;
  }

//------------------------------------------
// get transmit with no crs
// pg. 345
//------------------------------------------
int EtherObj::getTNCRS() 
  {
        int retcode=0;

     	// TNCRS 0x4034
	setRegister32(0x4034, IOADDR);
	 
	// 31                                                                         0
	//-----------------------------------------------------------------------------
	//|                                  TNCRS                                    |  
	//-----------------------------------------------------------------------------
	
	retcode = getRegister32(IODATA);

    	return retcode;
  }

//------------------------------------------
// get sequence error count 
// pg. 346
//------------------------------------------
int EtherObj::getSEC() 
  {
        int retcode=0;

     	// SEC 0x4038
	setRegister32(0x4038, IOADDR);
	 
	// 31                                                                         0
	//-----------------------------------------------------------------------------
	//|                                   SEC                                     |  
	//-----------------------------------------------------------------------------
	
	retcode = getRegister32(IODATA);

    	return retcode;
  }

//------------------------------------------
// get good octets transmitted count 
// pg. 355
//------------------------------------------
int EtherObj::getGOTCL() 
  {
        int retcode=0;

     	// GOTCL 0x4090
	setRegister32(0x4090, IOADDR);
	 
	// 31                                                                         0
	//-----------------------------------------------------------------------------
	//|                                  GOTCL                                    |  
	//-----------------------------------------------------------------------------
	
	retcode = getRegister32(IODATA);

    	return retcode;
  }

//------------------------------------------
// get good octets transmitted count 
// pg. 355
//------------------------------------------
int EtherObj::getGOTCH() 
  {
        int retcode=0;

     	// GOTCH 0x4094
	setRegister32(0x4094, IOADDR);
	 
	// 31                                                                         0
	//-----------------------------------------------------------------------------
	//|                                  GOTCH                                    |  
	//-----------------------------------------------------------------------------
	
	retcode = getRegister32(IODATA);

    	return retcode;
  }

//------------------------------------------
// get management packets transmitted count 
// pg. 359
//------------------------------------------
int EtherObj::getMGTPTC() 
  {
        int retcode=0;

     	// MGTPTC 0x40bc
	setRegister32(0x40bc, IOADDR);
	 
	// 31                                                                         0
	//-----------------------------------------------------------------------------
	//|                                 MGTPTC                                    |  
	//-----------------------------------------------------------------------------
	
	retcode = getRegister32(IODATA);

    	return retcode;
  }

//------------------------------------------
// get total octets transmitted count 
// pg. 360
//------------------------------------------
int EtherObj::getTOTL() 
  {
        int retcode=0;

     	// TOTL 0x40c8
	setRegister32(0x40c8, IOADDR);
	 
	// 31                                                                         0
	//-----------------------------------------------------------------------------
	//|                                  TOTL                                    |  
	//-----------------------------------------------------------------------------
	
	retcode = getRegister32(IODATA);

    	return retcode;
  }

//------------------------------------------
// get total octets transmitted count 
// pg. 360
//------------------------------------------
int EtherObj::getTOTH() 
  {
        int retcode=0;

     	// TOTH 0x40cc
	setRegister32(0x40cc, IOADDR);
	 
	// 31                                                                         0
	//-----------------------------------------------------------------------------
	//|                                  TOTH                                    |  
	//-----------------------------------------------------------------------------
	
	retcode = getRegister32(IODATA);

    	return retcode;
  }

//------------------------------------------
// get transmit descriptor control
// pg. 318
//------------------------------------------
int EtherObj::getTXDCTL() 
  {
        int retcode=0;

     	// TXDCTL 0x3828
	setRegister32(0x3828, IOADDR);
	 
	// 31      25   24   23 22 21       16 15 14 13         8 7   6 5             0
	//-----------------------------------------------------------------------------
	//| LWTHRESH | GRAN | RSV |  WTHRESH  | RSV |   HTHRESH  | RSV |    PTHRESH   |  
	//-----------------------------------------------------------------------------
	
	retcode = getRegister32(IODATA);

    	return retcode;
  }

//------------------------------------------
// get receive descriptor control
// pg. 323
//------------------------------------------
int EtherObj::getRXDCTL() 
  {
        int retcode=0;

     	// RXDCTL 0x2828
	setRegister32(0x2828, IOADDR);
	 
	// 31      25   24   23 22 21       16 15 14 13         8 7   6 5             0
	//-----------------------------------------------------------------------------
	//| Reserved | GRAN | RSV |  WTHRESH  | RSV |   HTHRESH  | RSV |    PTHRESH   |  
	//-----------------------------------------------------------------------------
	
	retcode = getRegister32(IODATA);

    	return retcode;
  }

//------------------------------------------
// get inter packet gap register
// pg. 311
//------------------------------------------
int EtherObj::getTIPG() 
  {
        int retcode=0;

     	// TIPG 0x0410
	setRegister32(0x0410, IOADDR);
	 
	// 31      30                20 19                    10 9                    0
	//-----------------------------------------------------------------------------
	//| Reserved |     IPGR2       |         IPGR1          |        IPGT         |  
	//-----------------------------------------------------------------------------
	
	retcode = getRegister32(IODATA);

    	return retcode;
  }

//------------------------------------------
// print diagnostics 
//------------------------------------------
int EtherObj::printDiag(int line) 
  {
    int retcode=0;
 
     retcode = getPRC64();
     io.AOAprintHex(retcode, line);

     retcode = getPRC127();
     io.AOAprintHex(retcode, line+20);

     retcode = getPRC255();
     io.AOAprintHex(retcode, line+40);

     retcode = getPRC1023();
     io.AOAprintHex(retcode, line+60);

     retcode = getPRC1522();
     io.AOAprintHex(retcode, line+80);
     
     retcode = getGPRC();
     io.AOAprintHex(retcode, line+100);
     
     retcode = getBPRC();
     io.AOAprintHex(retcode, line+120);

     retcode = getMPRC();
     io.AOAprintHex(retcode, line+160);

     retcode = getGPTC();
     io.AOAprintHex(retcode, line+160+20);
     
     retcode = getRNBC();
     io.AOAprintHex(retcode, line+160+40);
     
     retcode = getTPR();
     io.AOAprintHex(retcode, line+160+60);

     retcode = getTPT();
     io.AOAprintHex(retcode, line+160+80);
     
     retcode = getPTC64();
     io.AOAprintHex(retcode, line+160+100);

     retcode = getPTC127();
     io.AOAprintHex(retcode, line+160+120);

     retcode = getPTC255();
     io.AOAprintHex(retcode, line+320);

     retcode = getPTC1023();
     io.AOAprintHex(retcode, line+320+20);

     retcode = getPTC1522();
     io.AOAprintHex(retcode, line+320+40); 

     retcode = getMPTC();
     io.AOAprintHex(retcode, line+320+60);
     
     retcode = getBPTC();
     io.AOAprintHex(retcode, line+320+80);

    return retcode;
  }

//------------------------------------------
// print transmit statistics 
//------------------------------------------
int EtherObj::printTStat(int line) 
  {
    int retcode=0;
 
     retcode = getSCC();
     io.AOAprintHex(retcode, line);

     retcode = getECOL();
     io.AOAprintHex(retcode, line+20);

     retcode = getMCC();
     io.AOAprintHex(retcode, line+40);

     retcode = getLATECOL();
     io.AOAprintHex(retcode, line+60);

     retcode = getCOLC();
     io.AOAprintHex(retcode, line+80);
     
     retcode = getDC();
     io.AOAprintHex(retcode, line+100);
     
     retcode = getTNCRS();
     io.AOAprintHex(retcode, line+120);

     retcode = getSEC();
     io.AOAprintHex(retcode, line+160);

     retcode = getGOTCL();
     io.AOAprintHex(retcode, line+160+20);
     
     retcode = getGOTCH();
     io.AOAprintHex(retcode, line+160+40);
     
     retcode = getMGTPTC();
     io.AOAprintHex(retcode, line+160+60);

     retcode = getTOTL();
     io.AOAprintHex(retcode, line+160+80);
     
     retcode = getTOTH();
     io.AOAprintHex(retcode, line+160+100);
 
    return retcode;
  }

//------------------------------------------
// InPtr
//------------------------------------------
int EtherObj::getCurrentReceivePtr() 
  {
      int retcode=0;

      // read receive descriptor head register
      //  head is the actual packet received
      retcode = getRDHead();

      return retcode;
  }

//------------------------------------------
// get ethernet buffer count	
//  approximate way to count packets in the buffer 
// get good total rcv count - total rcvd packets 
//  it is not working! 
//    problem with getGPRC()
//------------------------------------------
int EtherObj::getCount()
{   
    int rcvcounter = 0; 

    rcvcounter = getGPRC();   //good packets received count 
    rcvcounter = rcvcounter - TotalRcvCount;  
    
    return rcvcounter; 
}
//------------------------------------------
//  check for full condition on the RDL buffers 
//------------------------------------------
int EtherObj::RDLfull()
{   
    int pkts = 0; 

    ReceiveInPtr = getRDTail(); //HD may be possibly here to check for full  

    if(ReceiveInPtr >= ReceiveOutPtr)
    {
	   pkts = ReceiveInPtr-ReceiveOutPtr;  //count no of packets 
    }

   else
   {
        pkts =  NO_OF_RDL - (ReceiveOutPtr-ReceiveInPtr); //count no of packets 

   }
   if (pkts >= NO_OF_RDL) 
     {
       return 1; //full  
     }
   else return 0; //not full  
}

//************************************************************************************************
// Packets are already received and stored in the data buffers 
//  This program just reads packets from the buffers 
//   There is only one buffer used which will be available through Data pointer 
//   We just reduce the count by 14 and point the Data to right point in the buffer 
//   There is no need to copy data at all
//   returns -2 if the packet is not for this node 
//   returns -3 if packet type is not arp or ip
//   returns packet length in normal case 
//   pg. 20
// ***********************************************************************************************
int EtherObj::ReadData(char** Data, int* Type, char*ipaddr, char*macaddr)
{
   // This is for Ethernet II Type
   int PROTOCOL_TYPE =0;
   int portno =0;
   int retcode=0;
   long pktlen = 0; 
   char c1; 
   char *addr;
   char c2;
   addr = &c2;
    	
   long *p1;
   long a1; 
   p1 = &a1;  //dummy address to hold 
   long s1; 

   //we need to subtract 0x00110000 to compensate for the base 
   // address which will be added by the selector in protected mode 
   p1 = (long*) (RDLPointer + ReceiveOutPtr * 16 - ADDR_OFFSET);

   s1 = *p1;  //you can not print *p values in AOAprintHex 

   *Data      =   (char*)s1 -ADDR_OFFSET;   //buffer is pointing to Memory Location same as pointed by DPD
   //*Data address is 0x00110000 less than the absolute address 
   //when you use Data[], system will add 0x00110000 from the selector or base address 
   addr = *Data; 

   p1++;
   p1++;

   pktlen      = *p1;   //get the status into pktlen variable 
   pktlen      = pktlen & 0x0000ffff; //extract paket length 
   //return pktlen after the end of procedure 

   p1++;

   s1 = *p1;   			//get the status local 
   s1 = s1 & 0x00000001; 	//logical AND check for bit 0 (DD - Descriptor Done)
   if (s1 == 0) 
      {
	// bit 0 (DD) is zero 
	return -1;
      }
   else 
      {
	// this macaddr is used in TCPObj
	// TCPObj does not call arp.Resolve(), it uses this mac address
	macaddr[0] = *(*Data+6);
	macaddr[1] = *(*Data+7);
	macaddr[2] = *(*Data+8);
	macaddr[3] = *(*Data+9);
	macaddr[4] = *(*Data+10);
	macaddr[5] = *(*Data+11);

        //--------------------------------------------
        // if the packet arrived is not intended for this node (IP address) 
        //   we simply discard the packet here. 
        // instead of doing it in IPOBJ, we do it here so that 
        //   we do not have to postpone to discard the packet 
        // 24, 25, 26, 27 are IP address bytes when ethernet header is removed 
        // before that, we add 14 to the above locations (24+14) 
        //--------------------------------------------

	// Get the Protocol Type and Palce it in the Application's Type Buffer
        //if you use *DATA[x], it will not work in our system 
	// you must use the following format 
	PROTOCOL_TYPE = (*(*Data+12) & 0x00FF);
	PROTOCOL_TYPE = (PROTOCOL_TYPE <<8);
	PROTOCOL_TYPE = (PROTOCOL_TYPE |  (*(*Data+13) & 0x00FF)); 
	portno = (*(*Data+34) & 0x00ff); 
	portno = portno <<8; 
	portno = (portno | (*(*Data+35) & 0x00ff)); 

	*Type = PROTOCOL_TYPE;	

	if(*Type == ARP_TYPE)
	{
         if (*(*Data+38) != ipaddr[0] || *(*Data+39) != ipaddr[1] ||  
           *(*Data+40) != ipaddr[2] || *(*Data+41) != ipaddr[3])
	 {
	   //this is not our packet 
	   //discard it and return with -2 
	   discardPacket(); 
	   return -2; 
	 }
        }
	else if(*Type == IP_TYPE)
	{
         if (*(*Data+30) != ipaddr[0] || *(*Data+31) != ipaddr[1] ||  
           *(*Data+32) != ipaddr[2] || *(*Data+33) != ipaddr[3])
	 {
	   //this is not our packet 
	   //discard it and return with -2 
	   discardPacket(); 
	   return -2; 
	 }
        }
        else 
	{
	   // we do not handle packets other than arp and ip packets
	   discardPacket();
	   //retcode = HotReset(); 
	/*
	   io.AOAprintHex(ReceiveOutPtr, Line22+20); 
	   io.AOAprintHex(PROTOCOL_TYPE, Line22+40); 
	   io.AOAprintHex(portno, Line22+60); 
	   io.AOAprintHex((long)addr, Line22+80); 

	   printRReadData(ReceiveOutPtr, 40, Line3); 
	   io.Application_Status = 2; 
	   */

	   return -3;
	}

	*Data = *Data + 14; //point it to data instead of header
	pktlen = pktlen - 14; //reduce the length of the packet by 14 bytes header size 

	//retcode = printRReadData(ReceiveOutPtr, 16, Line4);
      }
      
   retcode = getICR();  //read interrupt cause register 
   if ((retcode & 0x00000040) == 1)
     {
       return -4;  //receive overrun error 
     }
   else return pktlen;	
} //end of Receive()

//------------------------------------------
// discard the packet read 
//  at this point, no one needs this packet data
//  this is not same as reading a packet 
//------------------------------------------
int EtherObj::discardPacket() 
  {
   long *p1;  
   long l1;
   p1 = &l1;
   int retcode=0;
   int rtail=0;
   
   //we need to subtract 0x00110000 to compensate for the base 
   // address which will be added by the selector in protected mode 

   p1 = (long*) (RDLPointer + ReceiveOutPtr * 16 - ADDR_OFFSET);

   p1++;
   p1++;
   p1++;
   
   *p1 = 0; // reset status and errors
   
   ReceiveOutPtr++; 

   if (ReceiveOutPtr == NO_OF_RDL)
     {
      ReceiveOutPtr = 0; 
     }

   // read receive descriptor tail register
   retcode = getRDTail();

   if(retcode == NO_OF_RDL - 1)
      rtail = 0;
   else
      rtail = retcode + 1; 

   // set tail register
   retcode = setRDTail(rtail);

   TotalRcvCount++;    //received and processed packets 

   return 0; 
  }

//------------------------------------------
//return 1 if it is full 
//------------------------------------------
int EtherObj::TDLFull()
{ 
    int retcode = 0; 

    if ((SendInPtr + 1) % NO_OF_TDL == SendOutPtr) 
    {
       retcode = 1; //full  
       io.AOAPrintText("TDL is FULL", Line20+80); 
       io.AOAprintHex(SendInPtr, Line20+20); 
       io.AOAprintHex(SendOutPtr, Line20+40); 
       io.AOAprintHex(NO_OF_TDL, Line20+60); 
    }
    else 
       retcode = 0; //not full  

    return retcode; 
}

//-----------------------------------------------------------------------------------------------------------
// IPInsertPacket is used to insert packets in the correct slot of TDL entry 
//  It is similar to ARPInsertPacket, with few differences 
//  BUFFER is same as the data link pointed by the TDL entry for a given slot 
//  return code
//  -12 if tdlpointer is out of range
//  -13 if data buffer is out of range
//  pg. 36
// ----------------------------------------------------------------------------------------------------------
int EtherObj::IPInsertPkt(char* PACK, int PACK_Size, int PROTOCOL, char* Target_HAdd, int CurrentTask)
{   
    int retcode; 
    int i = 0; 
    int sizeOfPacket=0;
    int temp=0;

    long x = 0; 
    long *p1; 
    long c3; 
    p1 = &c3 ; 
 
  //there could be more than one task trying to insert a packet into the list 
  // when we insert a packet, NIC is not there yet, because insert is ahead of write 

    x = TDLPointer + SendInPtr * 16 - ADDR_OFFSET; 
      //TDL address is absolute 
      // when ever you have an absolute address in a pointer, 
      //  make sure you substract 0x00110000
    
    //check if the TDL pointer in the range 
    if ((x+ADDR_OFFSET) > (TDLPointer + (NO_OF_TDL-1) * 16))
     {
      return -12; 
     }    

    PACK = PACK - 14;
 
    p1 = (long*)x; // p1 is address of tdlPointer  

    //now check if this data buffer is within the limits of TDL data buffers 
    if ((*p1) >= (TDLDataPointer + NO_OF_TDL * T_BUFFER_SIZE))
     {
      return -13; 
     }    

    SendInPtr++;    //this is like an InPtr which inserts packets 

    if (SendInPtr == NO_OF_TDL) 
     {
      SendInPtr = 0; //circular list 
     }
 
    p1++;
    p1++;
    
    sizeOfPacket = PACK_Size + 14; // new size of packet  14 is for ethernet header

    for(i=0; i< 6; i++)
    {
       PACK[i] = Target_HAdd[i];    // Copy the destination mac to the pack
       PACK[i+6] =  mac[i]; // copy the source mac address to the pack
    }
       PACK[12] = ((PROTOCOL>>8) & 0x00FF); 	
       PACK[13] = ((PROTOCOL) & 0x00FF); 	

    // Check if the Packet is less than 60 bytes of so PAdd the Buffer with 0 for the rest of the 60 bytes
    if(sizeOfPacket < 60)
    {
	int k = (60 - sizeOfPacket);
	for( i =0; i < k; i++) 
	{
		PACK[sizeOfPacket + i] = 0;				    
	}
	sizeOfPacket = 60;
    }

    temp = *p1;
    temp = temp & 0xffff0000;
    temp = temp + sizeOfPacket;
    
    *p1 = temp;  //TDL entry for length 

    retcode = sndCall();

    return 0;
}

//-----------------------------------------------------------------------------------------------------------
// send the packet	
//-----------------------------------------------------------------------------------------------------------
int EtherObj::sndCall()
{
    int retcode = 0;
    int ttail=0;
    int temp=0;


    // read transmit descriptor tail register
    retcode = getTDTail();

    if(retcode == NO_OF_TDL - 1)
       ttail = 0;
    else
       ttail = retcode + 1; 

    // set tail register
    retcode = setTDTail(ttail); 
      
    return 0;	
}	

//-----------------------------------------------------------------------------------------------------------
// increment the SendOutPtr 
//-----------------------------------------------------------------------------------------------------------
int EtherObj::IncSendOutPtr()
{   
    int retcode=0;
    AOAProtected io; 
    
    while(isTDescDone(SendOutPtr))
    {
	   retcode = resetTDescDone(SendOutPtr);
       if (SendOutPtr == NO_OF_TDL - 1) 
            SendOutPtr = 0;//Circular list
       else 
         SendOutPtr++; 
    }

    return 0; 
}

//**********************************************************************************************
// This function formats an ethernet packet and inserts the packet into the TDL 
// This function takes the Sender Hardware Address, Target Hardware Address, 
// The Higher Level Protocol Type of the Packet and the PACKET and its size
//   This is used send ARP packets 
//  BUFFER is same as the data link pointed by the TDL entry for a given slot 
// *********************************************************************************************
int EtherObj::ARPInsertPkt(char* PACK,int PACK_Size, int PROTOCOL, char* Sender_HAdd, 
				char* Target_HAdd, int sendtype, int CurrentTask)

{   
    int addr; 
    long temp1; 
    char *BUFFER; 
    char c1; 
    BUFFER = &c1;
    int i = 0; 
    int retcode=0;
    int sizeOfPacket=0;
    int stype = 0; 
    long temp = 0; 
   
    long x = 0; 
    long *p1; 
    long c3; 
    p1 = &c3 ; 
    
  x = TDLPointer + SendInPtr * 16 - ADDR_OFFSET; 
      //TDL address is absolute 
      // when ever you have an absolute address in a pointer, 
      //  make sure you substract 0x00110000
      
     //check if the TDL pointer in the range 
    if ((x+ADDR_OFFSET) > (TDLPointer + (NO_OF_TDL-1) * 16))
     {
      return -8; 
     }     

  p1 = (long*)x;

     //now check if this data buffer is within the limits of TDL data buffers 
    if ((*p1) >= (TDLDataPointer + NO_OF_TDL * T_BUFFER_SIZE))
     {
      return -9; 
     }   

  BUFFER = (char*)*p1;

  BUFFER = BUFFER - ADDR_OFFSET; //it is an absolute address  
    
  SendInPtr++;    //this is like an InPtr which inserts packets

  if (SendInPtr == NO_OF_TDL) 
    {
	SendInPtr = 0; //circular list 
    }

    p1++;
    p1++;

    sizeOfPacket = 14 + PACK_Size; // Size of the Ethernet Frame to Send

    for(i=0; i< 6; i++)
    {
       BUFFER[i] = Target_HAdd[i];    // Copy the destination mac to the pack
       BUFFER[i+6] =  Sender_HAdd[i]; // copy the source mac address to the pack
    }
       BUFFER[12] = ((PROTOCOL>>8) & 0x00FF); 	
       BUFFER[13] = ((PROTOCOL) & 0x00FF); 	

    // Copy the higher Level Packet into the FRAME
    for( i=0; i<PACK_Size; i++)
    {
	BUFFER[14+i] = PACK[i];											
    }

    // Check if the Packet is less than 60 bytes of so PAdd the Buffer with 0 for the rest of the 60 bytes
    if(sizeOfPacket < 60)
    {
	int k = (60 - sizeOfPacket);
	for( i =0; i < k; i++) 
	{
		BUFFER[sizeOfPacket + i] = 0;				    
	}
	sizeOfPacket = 60;
    }
   
    temp = *p1;
    temp = temp & 0xffff0000;
    temp = temp + sizeOfPacket;
    
    *p1 = temp;  //TDL entry for length 
    
    retcode = sndCall();

    return 0;  //normal return 
}

//-----------------------------------------------------------------------------------------------------------
// method to format ethernet packet called by tcp
// return code
//  -26 if tdlpointer is out of range
//  -27 if data buffer is out of range
// ----------------------------------------------------------------------------------------------------------
int EtherObj::FormatEthPacket(char* PACK, int PACK_Size, int PROTOCOL, char* Target_HAdd, 
				long InPtr, int sendtype, int CurrentTask)
{   
   
    int i = 0; 
    int sizeOfPacket=0;
    int retcode=0;

    long x = 0; 
    long *p1; 
    long c3; 
    p1 = &c3 ; 
    int stype = 0; 
    int temp=0;

    TotalDataSent = TotalDataSent + PACK_Size + 14; 

  //there could be more than one task trying to insert a packet into the list 
  // when we insert a packet, NIC is not there yet, because insert is ahead of write 

   x = TDLPointer + InPtr * 16 - ADDR_OFFSET; 
      //TDL address is absolute 
      // when ever you have an absolute address in a pointer, 
      //  make sure you substract 0x00110000
 
     //check if the TDL pointer in the range 
    if ((x+ADDR_OFFSET) > (TDLPointer + (NO_OF_TDL-1) * 16))
     {
      return -26; 
     }    
   
    p1 = (long*)x;

     //now check if this data buffer is within the limits of TDL data buffers 
    if ((*p1) >= (TDLDataPointer + NO_OF_TDL * T_BUFFER_SIZE))
     {
      return -27; 
     }    
    
    p1++;
    p1++;
    
    sizeOfPacket = PACK_Size + 14; // new size of packet  14 is for ethernet header

    for(i=0; i< 6; i++)
    {
       PACK[i] = Target_HAdd[i];    // Copy the destination mac to the pack
       PACK[i+6] =  mac[i]; // copy the source mac address to the pack
    }
       PACK[12] = ((PROTOCOL>>8) & 0x00FF); 	
       PACK[13] = ((PROTOCOL) & 0x00FF); 	


    // Check if the Packet is less than 60 bytes of so PAdd the Buffer with 0 for the rest of the 60 bytes
    if(sizeOfPacket < 60)
    {
	int k = (60 - sizeOfPacket);
	for( i =0; i < k; i++) 
	{
		PACK[sizeOfPacket + i] = 0;				    
	}
	sizeOfPacket = 60;
    }

    temp = *p1;
    temp = temp & 0xffff0000;
    temp = temp + sizeOfPacket;
    
    *p1 = temp;  //TDL entry for length  
  
    retcode = sndCall();

    return 0;
}

//-----------------------------------------------------------------------------------------------------------
// method to format ethernet packet called by tcp
// return code
//  -26 if tdlpointer is out of range
//  -27 if data buffer is out of range
// ----------------------------------------------------------------------------------------------------------
int EtherObj::FormatEthPacketN(char* PACK, int PACK_Size, int PROTOCOL, char* Target_HAdd,
				long InPtr, int count, int sendtype, int CurrentTask)
{   
   
    int i = 0; 
    int sizeOfPacket=0;
    int retcode=0;
    int c1 = 0; 
    int c2 = 0; 

    long x = 0; 
    long *p1; 
    long c3; 
    p1 = &c3 ; 
    int stype = 0; 
    int temp=0;

    TotalDataSent = TotalDataSent + PACK_Size + 14; 
    
  //there could be more than one task trying to insert a packet into the list 
  // when we insert a packet, NIC is not there yet, because insert is ahead of write 

   x = TDLPointer + InPtr * 16 - ADDR_OFFSET; 
      //TDL address is absolute 
      // when ever you have an absolute address in a pointer, 
      //  make sure you substract 0x00110000
 
     //check if the TDL pointer in the range 
    if ((x+ADDR_OFFSET) > (TDLPointer + (NO_OF_TDL-1) * 16))
     {
      return -26; 
     }    
   
    p1 = (long*)x;

     //now check if this data buffer is within the limits of TDL data buffers 
    if ((*p1) >= (TDLDataPointer + NO_OF_TDL * T_BUFFER_SIZE))
     {
      return -27; 
     }    
    
    p1++;
    p1++;
    
    sizeOfPacket = PACK_Size + 14; // new size of packet  14 is for ethernet header

    for(i=0; i< 6; i++)
    {
       PACK[i] = Target_HAdd[i];    // Copy the destination mac to the pack
       PACK[i+6] =  mac[i]; // copy the source mac address to the pack
    }
       PACK[12] = ((PROTOCOL>>8) & 0x00FF); 	
       PACK[13] = ((PROTOCOL) & 0x00FF); 	


    // Check if the Packet is less than 60 bytes of so PAdd the Buffer with 0 for the rest of the 60 bytes
    if(sizeOfPacket < 60)
    {
	int k = (60 - sizeOfPacket);
	for( i =0; i < k; i++) 
	{
		PACK[sizeOfPacket + i] = 0;				    
	}
	sizeOfPacket = 60;
    }

    temp = *p1;
    temp = temp & 0xffff0000;
    temp = temp + sizeOfPacket;
    
    *p1 = temp;  //TDL entry for length  

    if(count != 0)
      retcode = sndCallN(count);

    return 0;
}

//-----------------------------------------------------------------------------------------------------------
// send call N	
//-----------------------------------------------------------------------------------------------------------
int EtherObj::sndCallN(int count)
{
    int retcode = 0;
    int ttail=0;
    int temp=0;

    // read transmit descriptor tail register
    retcode = getTDTail();

    temp = retcode + count;
    if(temp > NO_OF_TDL - 1)
	    temp = temp - NO_OF_TDL;
	
    // set tail register
    retcode = setTDTail(temp); 
      
    return 0;	
}

