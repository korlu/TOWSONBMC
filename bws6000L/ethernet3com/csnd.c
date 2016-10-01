//cinit.c file 
// Coded by R. Karne on August 5, 2005 
// Copyright Towson University 
//
extern int enableTransmit(int, long); 
extern int disableTransmit(int); 
extern int getCurrentSendPtr(short); 
extern int getTransmitStatus(int); 
extern int getIntStatus(int); 
extern int getTransmitFree(int); 
extern int getMediaStatus(int);
extern int getFifoDiag(int);
extern int transasm(short,char*,int);
extern int sendPacket(short, int, long);
extern int sendPacketN(short, int);
extern int dnStall (int); 
extern int dnUnStall (int); 
extern int setDnLstPtr (int, int); 
extern int ackNICInt(int, int);
extern int stopTransmitAt(int, int);
extern int getInternalConfig(int);
extern int getMacControl(int);
extern int getMacControl(int);
extern int getConfigData(int, int);
extern int getNetworkDiag(int);
extern int resetTransmitter(int);
extern int getTransmitPacketId(int); 


//-----------------------------------------------
// enable transmitter, packets are in the buffer   
//-----------------------------------------------
int cenableTransmit(int iobase, long ptr) 
{
    return enableTransmit(iobase, ptr); 
}
//-----------------------------------------------
// disable transmitter   
//-----------------------------------------------
int cdisableTransmit(int iobase) 
{
    return disableTransmit(iobase); 
}
//-----------------------------------------------
// get snd ptr for linked list    
//-----------------------------------------------
int cgetCurrentSendPtr(short iobase) 
{
    return getCurrentSendPtr(iobase); 
}
//-----------------------------------------------
// get transmit status
//-----------------------------------------------
int cgetTransmitStatus(int iobase) 
{
    return getTransmitStatus(iobase); 
}
//-----------------------------------------------
// get int status
//-----------------------------------------------
int cgetIntStatus(int iobase) 
{
    return getIntStatus(iobase); 
}
//-----------------------------------------------
// get transmit free
//-----------------------------------------------
int cgetTransmitFree(int iobase) 
{
    return getTransmitFree(iobase); 
}
//-----------------------------------------------
// get transmit packet id  
//-----------------------------------------------
int cgetTransmitPacketId(int iobase) 
{
    return getTransmitPacketId(iobase); 
}
//-----------------------------------------------
// get media status
//-----------------------------------------------
int cgetMediaStatus(int iobase) 
{
    return getMediaStatus(iobase); 
}
//-----------------------------------------------
// get fifo diagnostic
//-----------------------------------------------
int cgetFifoDiag(int iobase) 
{
    return getFifoDiag(iobase); 
}
//-----------------------------------------------
// dnStall    
//-----------------------------------------------
int cdnStall (int iobase)
{
	return dnStall(iobase);
}
//-----------------------------------------------
// dnUnStall    
//-----------------------------------------------
int cdnUnStall (int iobase)
{
	return dnUnStall(iobase);
}
//-----------------------------------------------
// setDnLstPtr    
//-----------------------------------------------
int csetDnLstPtr (int iobase, int ptr)
{
	return setDnLstPtr(iobase, ptr);
}
//-----------------------------------------------
// acknowledge interrupt    
//-----------------------------------------------
int cackNICInt (int iobase, int num)
{
	return ackNICInt(iobase, num);
}
//-----------------------------------------------
// send    
//-----------------------------------------------

int csend(short IO_BASE, int addr, long delay)
{
int retCode; 
	retCode = sendPacket(IO_BASE, addr, delay); 
 return retCode; 
}
//-----------------------------------------------
// send n    
//-----------------------------------------------

int csendN(short IO_BASE, int addr)
{
int retCode; 
	retCode = sendPacketN(IO_BASE, addr); 
 return retCode; 
}
//-----------------------------------------------
// send    
//-----------------------------------------------
int cstopTransmitAt(int IO_BASE, int ptr, int DnLstPtr)
{
int retCode; 
	retCode = stopTransmitAt(ptr, DnLstPtr); 
 return retCode; 
}
//-----------------------------------------------
// internal config register for full duplex mode    
//-----------------------------------------------
int cgetInternalConfig(int iobase)
{
	return getInternalConfig(iobase);
}
//-----------------------------------------------
// mac control register for full duplex mode    
//-----------------------------------------------
int cgetMacControl(int iobase)
{
	return getMacControl(iobase);
}
//-----------------------------------------------
// media options
//-----------------------------------------------
int cgetMediaOptions(int iobase)
{
	return getMediaOptions(iobase);
}
//-----------------------------------------------
// configuration data for given configuration address    
//-----------------------------------------------
int cgetConfigData(int iobase, int address)
{
	return getConfigData(iobase, address);
}
//-----------------------------------------------
// network diagnostic
//-----------------------------------------------
int cgetNetworkDiag(int iobase)
{
	return getNetworkDiag(iobase);
}
//-----------------------------------------------
// reset transmitter
//-----------------------------------------------
int cresetTransmitter(int iobase)
{
	return resetTransmitter(iobase);
}
