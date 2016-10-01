#ifndef __ftopobj__
#define __ftopobj__


// This is an implementation of FTP Protocol for transfering
// web resources to the AOA memory
#define ACTIVE	0X01
#define STANDBY	0X02

#include "../INTERFACES/AOAProtected.h"
#include "../ETHERNET/EtherObj.h"
class FTOPObj
{
private:
	// This is the next expected sequence number
	static unsigned int Mode;
	static unsigned long LRT;
	EtherObj EO;	
	AOAProtected io;

public:
	int init();	
	int HandleFTOP(char *Data, int Size, int currenttask);
	int SendFTOP(int currenttask);
	int getMode();// returns 1 for active and 0 for STANDBY
};
#endif
