
/* cprintstr32.c*/
void printstrasm32(char*, int, int);

int CprintStr32(char *p, int len, int start)
{
	printstrasm32(p, len, start);
	return 0;
}
/********************************************/
/*  read realtime clock using BIOS INT 1A, 02*/
/********************************************/
extern int readrtcasm32();
int CreadRTC()
{
	return readrtcasm32();
}
/********************************************/
/*  read date using BIOS INT 1A, 04         */
/********************************************/
extern int readdateasm32();
int CreadDATE()
{
	return readdateasm32();
}

/********************************************/
/* csetIDTAppPtr32.c*/
/********************************************/
extern int setIDTEntryasm32(long*, long*, int);

int CsetIDTEntry32(long* desch, long* descl, int appno)
{
	
	return setIDTEntryasm32(desch, descl, appno);
}
/********************************************/
/* cgetIDTAppPtr32.c*/
/********************************************/
extern int getIDTEntryasm32(long*, long*, int);

int CgetIDTEntry32(long* desch, long* descl, int appno)
{
	return getIDTEntryasm32(desch, descl, appno);
}

/********************************************/
/* csetGDTAppPtr32.c*/
/********************************************/
extern int setGDTEntryasm32(long*, long*, int);

int CsetGDTEntry32(long* desch, long* descl, int appno)
{
	return setGDTEntryasm32(desch, descl, appno);
}
/********************************************/
/* cgetGDTAppPtr32.c*/
/********************************************/
extern int getGDTEntryasm32(long*, long*, int);

int CgetGDTEntry32(long* desch, long* descl, int appno)
{
	return getGDTEntryasm32(desch, descl, appno);
}
/********************************************/
/* CShortDelay32.c*/
/********************************************/
extern long ShortDelay(long Delay);

int CShortDelay32(long Delay)
{
	return ShortDelay(Delay);
}
/********************************************/
/* cgetchar32.c*/
/********************************************/
extern char getcharasm32(int);

char CgetChar32(int pos)
{
	return getcharasm32(pos);
}
/********************************************/
/* cprintregs32.c                        */
/********************************************/
extern void printregsasm32(int pos);

void CprintRegs32 (int pos)
{
	printregsasm32(pos);
}
/********************************************/
/* cprintsstackregs32.c                        */
/********************************************/
extern void printstackregsasm32(int pos);

void CprintStackRegs32 (int pos)
{
	printstackregsasm32(pos);
}
/********************************************/
/* csetsharedmem32.c                        */
/********************************************/
extern void setsharedmemasm32(int, long);

void CsetSharedMem32(int index, long val)
{
	 setsharedmemasm32(index, val);
}
/********************************************/
/* cgetsharedmem32.c                        */
/********************************************/
extern long getsharedmemasm32(int);

long CgetSharedMem32(int index)
{
	return getsharedmemasm32(index);
}
/* cprintchar32.c*/
void printcharasm32(char, int);

int CprintChar32(char value, int start)
{
	printcharasm32(value, start);
	return 0;
}
/********************************************/
/* ccleanscreen32.c*/
/********************************************/
extern void cleanscreenasm32();

int CcleanScreen32()
{
	cleanscreenasm32();
	return 0;
}
/********************************************/
/* csti32.c*/
/********************************************/
extern long stiasm32();

long Csti32()
{
	return stiasm32();
}

/********************************************/
/* cgetchar32.c*/
/********************************************/
extern long testasm32(long testcase);

long Ctest32(long testcase)
{
	return testasm32(testcase);
}
/********************************************/
/* ccli32.c*/
/********************************************/
extern long cliasm32();

long Ccli32()
{
	return cliasm32();
}
/********************************************/
/* cenableIRQCntlr32.c*/
/********************************************/
extern long enableIRQCntlrasm32(int port, unsigned short mask);

long CenableIRQCntlr32(int port, unsigned short mask)
{
	if( port == 1)
	{			
	return enableIRQCntlrasm32(0x21, mask);
	}
	else if(port == 2)
	{
	return enableIRQCntlrasm32(0xA1, mask);			
	}
	else
	return -1;
}
/********************************************/
/* cenableIRQCntlr32.c*/
/********************************************/
extern long disableIRQCntlrasm32(int port, unsigned short mask);

long CdisableIRQCntlr32(int port, unsigned short mask)
{
	if( port == 1)
	{			
	return disableIRQCntlrasm32(0x21, mask);
	}
	else if(port == 2)
	{
	return disableIRQCntlrasm32(0xA1, mask);			
	}
	else
	return -1;
}
/********************************************/
/* cackPCICntlr32.c*/
/********************************************/
extern long ackPICCntlrasm32(int port, unsigned short mask);

long CackPICCntlr32(int port)
{
	if( port == 1)
	{			
	return ackPICCntlrasm32(0x20, 0x20);
	}
	else if(port == 2)
	{
	// in order to acknowledge 2nd chip, you need to 
	//  acknowledge both chips as they are cascaded 
	ackPICCntlrasm32(0xA0, 0x20);			
	return ackPICCntlrasm32(0x20, 0x20);			
	}
	else
	return -1;
}
/***********************************************************/
/* CreadIntStatusRegister32.c                 */
/*  0x21 , 0xa1 addresses for chip 1, and 2 mask registers */ 
/*  0x20 , 0xa0 addresses for chip 1, and 2 status registers */ 
/***********************************************************/
extern int readintstatusregisterasm32(int port);

int CreadIntStatusRegister32(int port)
{
    int addr = 0; 

        if (port == 1) //chip 1 
	 {
	  addr = 0x20; //status register address  
	  return readintstatusregisterasm32(addr);
	 }
	else 
        if (port == 2) //chip 2 
	 {
	  addr = 0xa0; //status register address  
	  return readintstatusregisterasm32(addr);
	 }
 return -1; 
} 
/***********************************************************/
/* CreadIntMaskRegister32.c                 */
/*  0x21 , 0xa1 addresses for chip 1, and 2 mask registers */ 
/*  0x20 , 0xa0 addresses for chip 1, and 2 status registers */ 
/***********************************************************/
extern int readintmaskregisterasm32(int port);

int CreadIntMaskRegister32(int port)
{
    int addr = 0; 

        if (port == 1) //chip 1 
	 {
	  addr = 0x21; //mask register address  
	  return readintmaskregisterasm32(addr);
	 }
	else 
        if (port == 2) //chip 2 
	 {
	  addr = 0xa1; //mask register address  
	  return readintmaskregisterasm32(addr);
	 }
 return -1; 
} 
/********************************************/
/* cinttimer32.c*/
/********************************************/
extern void inttimerasm32();

void CintTimer32()
{
	inttimerasm32();
}
/********************************************/
/* cgetchar32.c*/
/********************************************/
extern void stiTimerasm32();

void CstiTimer32()
{
	stiTimerasm32();
}
/********************************************/
/* cgetchar32.c*/
/********************************************/
extern void cliTimerasm32();

void CcliTimer32()
{
	cliTimerasm32();
}
/********************************************/
/* cgetstr32.c*/
/********************************************/
extern int getstrasm32(char*);

int CgetStr32(char* str)
{
	return getstrasm32(str);
}
/********************************************/
/* cgetcursor32.c*/
/********************************************/
extern int getcursorasm32();

int CgetCursor32()
{
	return getcursorasm32();
}
/********************************************/
/* cgettimer32.c*/
/********************************************/
extern int gettimerasm32();

int CgetTimer32()
{
	return gettimerasm32();
}
/********************************************/
/* csetcursor32.c*/
/********************************************/
extern void setcursorasm32(int);

int CsetCursor32(int pos)
{
	setcursorasm32(pos);
	return 0;
}
/********************************************/
/* cscroll32.c*/
/********************************************/
extern void scrollasm32();

int CscrollUp32()
{
	scrollasm32();
	return 0;
}

/********************************************/
/* cnewline32.c*/
/********************************************/
extern 	int CgetCursor32();
extern	int CsetCursor32(int);
extern  int CscrollUp32();
extern  int CprintDec32(int,int);

int CnewLine32()
{
	int pos;
	int line, space;

	pos = CgetCursor32();
	
	pos++;
	line = pos / 80;
	space = pos % 80;
	line++;
	
	if(line > 50)
	{
		CscrollUp32();
		pos = 3919;
		return CsetCursor32(pos);
	}
	
	line *= 80;
	return CsetCursor32(line);
}
/*	cprintdec32.c	*/

int CprintDec32(int value, int pos)
{	
	int output, k;
	int num=1, base=1;
	int temp = value / 10;
	char disp;
	char buff[16];
		
	while(temp>=1)
	{
		num++;
		base = base*10;
		temp = temp/10;
	}

	for(k=0; k<num; k++)
	{
		output = value / base;
		disp = (char)output+'0';
		printcharasm32(disp, pos);		
		pos = pos + 2;				
		value = value % base;
		base=base/10;
	}

	return 0;
}

/* cclearntflag.c*/
void clearntflagasm32();

int CclearNTFlag()
{
	clearntflagasm32();
	return 0;
}
/* cprintflags.c*/
void printflagsasm32(int);

int CprintFlags32(int start)
{
	printflagsasm32(start);
	return 0;
}
/********************************************/
/* cgetsharedmemchar32.c                    */
/********************************************/
extern char getsharedmemcharasm32(int, int);

char CgetSharedMemChar32(int index, int base)
{
	return getsharedmemcharasm32(index, base);
}
/********************************************/
/* cresetlock32.c                        */
/********************************************/
extern long resetlockasm32(int, long);

int CresetLock32(int lock, long tid)
{
	return resetlockasm32(lock, tid);
}
/********************************************/
/* ctestandset32.c                        */
/********************************************/
extern long testandsetasm32(int, long);

int CtestAndSet32(int lock, long tid)
{
	return testandsetasm32(lock, tid);
}
/********************************************/
/* csetsharedmemchar32.c                    */
/********************************************/
extern void setsharedmemcharasm32(int, char, int);

void CsetSharedMemChar32(int index, char c, int base)
{
	setsharedmemcharasm32(index, c, base);
}

/********************************************/
/* cgetmem32.c                        */
/********************************************/
extern long getmemasm32(long);
extern long setmemasm32(long,long);
extern long getrealmemory(long);

long CgetMem32 (long addr)
{
	return getmemasm32(addr);
}

long CsetMem32 (long addr, long data)
{
	return setmemasm32(addr, data);
}

long CgetRealMemory (long addr)
{
	return getrealmemory(addr);
}
/********************************************/
/* cgetstackpop32.c                        */
/********************************************/
extern long getstackpopasm32(int index);

long CgetStackPOP32 (int index)
{
	return getstackpopasm32(index);
}
/********************************************/
/* cgetcharint32.c*/
/********************************************/
extern char getcharintasm32();

char CgetCharInt32()
{
	return getcharintasm32();
}
/********************************************/
/* cgetchar32.c*/
/********************************************/
extern char getcharbuffasm32();

char CgetCharBuff32()
{
	return getcharbuffasm32();
}
/********************************************/
/* creadfloppy32.c*/
/* read one sector 
   char ptr and sector number is passed to it*/
/********************************************/
extern void readfloppyasm32(char*, long);

int CreadFloppy32(char* buff, long sectorno)
{
	readfloppyasm32(buff, sectorno);
	return 0;
}
/********************************************/
/* cwritefloppy32.c*/
/* write one sector 
   char ptr and sector number is passed to it*/
/********************************************/
extern void writefloppyasm32(char*, long);

int CwriteFloppy32(char* buff, long sectorno)
{
	writefloppyasm32(buff, sectorno);
	return 0;
}