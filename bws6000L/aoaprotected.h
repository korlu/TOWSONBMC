#ifndef __aoaprotected__
#define __aoaprotected__

/*
 *	AOAProtected.h                      
 * Interface for basic input and output service.
 * This is the 32 bit code routine.
 * All functions in this class will only work in protected model
 *
 * @AOA project
 *
*/

/*
  This interface class can use one or more C 
  routines which needs to be declared within 
  extern block 
  add all related C routines to this class in 
  this extern block 
*/
	const int Line1= 160;
	const int Line2= 320;
	const int Line3= 480;
	const int Line4= 640;
	const int Line5= 800;
	const int Line6= 960;
	const int Line7= 1120;
	const int Line8= 1280;
	const int Line9= 1440;
	const int Line10= 1600;
	const int Line11= 1760;
	const int Line12= 1920;
	const int Line13= 2080;
	const int Line14= 2240;
	const int Line15= 2400;
	const int Line16= 2560;
	const int Line17= 2720;
	const int Line18= 2880;
	const int Line19= 3040;
	const int Line20= 3200;
	const int Line21= 3360;
	const int Line22= 3520;
	const int Line23= 3680;
	const int Line24= 3840;

	const int ARP_TYPE      = 0x0806; // This denotes the ARP type field in the Ethernet Packet
	const int IP_TYPE       = 0x0800;  // This denotes the IP type field in the Ethernet PAcket
	const long ADDR_OFFSET  = 0x00110000; //when ever an absolute address is used then substract this in C++
	const long TIMER_PERIOD = 220; //55msec is divided by this constant for clock period 
	const long STACK_SIZE   = 0x8000; //32K Cache Size  

	const long  TSS_ADDR   =  0x02110000; //MEMORY MAP 
	const long  DPD_ADDR   =  0x0230bf40;
	const long  UPD_ADDR   =  0x0245a140;
	const long  DPD_DATA   =  0x025a8340;
	const long  UPD_DATA   =  0x035ea740;
	const long  TASK_PTRS  =  0x0472CB40;
	const long  INT_PTRS   =  0x0482CB40;
	const long  TCP_ADDR   =  0x0492CB40;
	const long  HTTP_ADDR  =  0x062608a0;
	const long  FILE_ADDR  =  0x08100000;
	const long  STACK_ADDR =  0x10000000;

	const long ARP_DELAY = 20;
	
	const int RCV_PID = 4;
	const int SND_PID = 5;
	const int INT_PID = 6;
	const int FTP_PID = 7;
	const int HTTP_PID = 8;

extern "C"
{
	int CgetStr32(char*);  //IO Function Code x100
	int CprintStr32(char*, int, int); // x101
	int CgetCursor32();    //x102 
	char CgetChar32(int);     //x103
	char CgetCharInt32();     //x103
	char CgetCharBuff32(); //x104	
	int CsetCursor32(int); //x105
	int CgetTimer32();     //x106
	int CincrementTimer32(); //x107	
	int CcleanScreen32(); //x108
	int CscrollUp32();    //x109
	int CnewLine32();     //x110 there is no asm file, no trace code
	int CprintChar32(char, int); //x111
	int CprintDec32(int, int);   //x112 there is no asm file, no trace code 
	int CprintHex32(int, int);   //x113
	int CprintFlags32(int);        //x114
	int CclearNTFlag();          //x115
	int CreadFloppy32(char*, long); //char pointer and sector no x116 
	int CwriteFloppy32(char*, long); //char pointer and sector no x117 
	long Cmalloc32(long*);  /* pass number of bytes address pointer, returns x118*/
	long Ctest32(long);   // A test function used for testing purpose x119
	int CShortDelay32(long Delay); // Delay for a time in micriseconds x120
	void CstiTimer32();   //x121
	void CcliTimer32();   //x122 
	void Ccli32();        //x123
	void Csti32();        //x124
	long CgetSharedMem32 (int addr); //x125 
	long CgetMem32 (long index);     //x126 
	long CsetMem32 (long index, long data);     //x126 
	long CgetStackPOP32 (int index); //x127
	void CprintRegs32 (int pos); //pos as a starting point on the screen x128  
	char CgetSharedMemChar32 (int index, int base);          //x129 
	void CsetSharedMemChar32 (int index, char c , int base); //x130 
	void CintTimer32();        //x131 call timer interrupt 
	int CtestAndSet32(int lock, long tid);   //x132 test and set lock  
	int CresetLock32(int lock, long tid);   //x133 test and set lock  
	int CgetGDTEntry32(long*, long*,int);	//x134 Two long pointers for 8 bytes GDT Descriptors
						// int for the offset of the descriptor in GDT
	int CsetGDTEntry32(long*, long*, int); //x135 Two long pointers for 8 bytes GDT Descriptors
						// int for the offset of the descriptor in GDT
	int CgetIDTEntry32(long*, long*,int);	//x136 Two long pointers for 8 bytes GDT Descriptors
						// int for the offset of the descriptor in GDT
	int CsetIDTEntry32(long*, long*, int); //x137 Two long pointers for 8 bytes GDT Descriptors	
	int CenableIRQCntlr32(int picno,unsigned short mask); //x138
	int CdisableIRQCntlr32(int picno,unsigned short mask); //x139
	int CackPICCntlr32(int picno); //x140
	void CsetSharedMem32 (int index, long val ); //x141

}
//External Variable Definitions

/*
 class AOAProtected
*/
class AOAProtected
{

private:
	int	version;	



public:
	int 	trace; 
	static 		int 	Application_Status;		
	static int 	PosCount; 
	static int	LineNumber; 
	static long	RunRegister;
	static long	RcvCounter;
	static long	SndCounter;
	static long	HttpCounter;
	static long	IntCounter;

	AOAProtected();					//constructor				
	
	long test(long);				// A generic test case
	
	long AOAgetSharedMem(int index);  	//get data from shared memory 8600 + index 

	char AOAgetSharedMemChar(int index, int base );  	//get char data from shared memory 8600 + index 

	void AOAgetSharedMemTraceString (char*); //get shared memory trace string 40 char  

	void AOAsetSharedMemTraceString (char*); //set shared memory trace string 40 char  

	int  AOAtestAndSet(int lock, long tid);           //test and set the lock, 0-3

	int  AOAresetLock(int lock, long tid);   //reset lock, 0-3 

	void AOAsetSharedMemChar(int index, char c, int base); 
	//set char data in shared memory 8600 + index +base 

	long AOAgetMem(long addr);  	        //get data from memory using absolute address  
	long AOAsetMem(long addr, long data);  	        //set data in memory using absolute address  

	long AOAgetStackPOP(int index);         //get the stack value by ESP - index value  
	//start index 0 and increment by 4 to get the next value 

	void AOAprintRegs(int pos);            //print GPRs on the screen with base as starting position on screen
	
	char AOAgetCharacter();           		//read in single character synchronously wait untill u 
							// a char is in the buffer

	char AOAgetCharacterInt();           		//read in single character synchronously with interrupt

	char AOAgetCharacterBuff();           		//read in single character if any available in the buffer	
							// No wait for keyboard
	void AOAcli();					// Clear Interrupts
	void AOAsti();					// Set Interrupts

	void AOAintTimer();				// call timer interrupt

	void AOAsetTimerPeriod(int value);  	//set timer rate 1,2,3,4 

	void AOAstiTimer();				// Set Timer Interrupt
	
	void AOAcliTimer();				// Clear Timer Interrupr
	
	int AOAgetDecimal();        			//read in 32 bit decimal value 

	int AOAgetHex();	                      	//read in HEX value

	int AOAgetString (char*);    			//read in character string 
	
	int AOAprintCharacter(char , int , int*) ;	//print character on screen particuliar position
	int AOAprintCharacter(char , int) ;	//print character on screen particuliar position
	int AOAprintCharacter(char);		//print character at current cursor 

	int AOAprintDecimal(int, int);			//print decimal on screen particuliar position
	int AOAprintDecimal(int);			//print decimal at current cursor 
	                                
	int AOAclearNTFlag(); 			       	//clear NT flag  
	
	int AOAprintFlags(int);		         	//print flag register at a given position on screen 

	int AOAgetFlags();		         	//return flag  register to application  

	int AOAprintHex(long, int);	//print HEX value on screen particuliar position
	int AOAprintHex(long);				//print HEX value at current cursor 

	int AOAprintString (char* , int, int);		//print string on screen particuliar position
	int AOAprintString (char* , int);		//print string at current cursor 

	int AOAprintSpace(int, int);			//print seveal blank space on screen particuliar position
	int AOAprintSpace(int);				//print seveal blank space at current cursor 

	int AOAskipLine(int);				//go to next line

	int AOAscrollUp();				//scroll screen up one line

	int AOAcleanScreen();				//clean screen

	int AOAgetCursor();				//get current cursor position
	int AOAsetCursor(int);				//set screen cursor position

	long AOAgetTimer();				//get timer value
	long AOAincrementTimer();			//get timer value	

	int AOAreadFloppy(char*, long); 		//read one sector from floppy, char ptr and sector no
	int AOAwriteFloppy(char*, long); 		//write one sector from mem, pointed by ptr to a given sector 

	long AOAmallocTotal(long*);			//malloc a chunk of memory
	// Returns Memory Size Allocated through parameterby reference
	// Returns memory base address through the return value
	
	int AOAclearTotalMemory(long MEMBaseValue, long* MEMSizePtr);
	
	void AOAExit();					//exit from program

	void AOAPrintText(char* str, int base); //print the text at the give base as convetional c++ function
	void AOAPrintText(char* str, int base, int length);
	 //print the text at the give base as convetional c++ function

	void AOAPrintText(char* str);			
 //Another Varient of print Text which accepts only  the char string and prints it from the current cursor position

	int AOACharToDecimal(char nom[5]);		//This function converts  char array into decimal number

	void AOAChartoIP(char ip[20], char ipchar[4]);  //This function converts ip address which is obtained as character array and converts into a 4 byte ip address

	int AOAStrLen(char* str);			//This function calculates the length of a given string

	void AOAStrRev(char* str);			//This function calculates the length of a given string

	void AOADecimalToChar(int num, char nom[5]);  	//This function converts a decimal number into a char number

	void AOAStrCat(char* str, char* str1, char* str2); //This function concatenates two string

	void AOAGetText(char* str);		//This function gets Text from the console

	void AOAStrAppend(char* str1, char* str2);         //attach the str2 at the end of the str1

	void AOAclearScreen(int sp, int ep);    //clear the specified screen area.

	void AOAMsPrintText(char* str, int base);//print the str in multiple screens, starting at base.

	void AOAMsPrintText(char* str);         //print the str in multiple screens.

	int AOAStrMatch(int start, char* str1, char* str2); 
	
	int AOAShortDelay(long);			// delay for a while delay in micro seconds	

	//find the str1 in str2, and return the start position. if not found, return -1.
	int AOAgetGDTEntry(long*, long*, int);		// Get the GDT descriptor ptr for Application
	
	int AOAsetGDTEntry(long*, long*, int);		// Set the GDT descriptor ptr for Application
							// Currently only 4  
							// This is for the base of the application GDT entries APP1TSS
	int AOAgetIDTEntry(long*, long*, int);		// Get the IDT descriptor ptr for Application
	int AOAsetIDTEntry(long*, long*, int);		// Set the IDT descriptor ptr for Application	

	int AOAenableIRQCntlr(int picno,unsigned short mask);
	int AOAdisableIRQCntlr(int picno,unsigned short mask);
	int AOAackPICCntlr(int picno);
	
	// Initialize the Interrupt Service Routines		
	int AOAsetISR(long GDTDescNo, long IDTDescNo, unsigned long FunctionAddress);
	void AOAISRExit();				//exit from ISR program
	void  AOAsetSharedMem(int index, long val);

	void AOAInitTrace(int); //pass line number 
	void AOAClearTrace();   //reset the lines on the screen 
	void AOAPrintCharacterTrace(char); //pass the character to be printed  

	int AOAMaskRunRegister(int pid, int fn);
};



#endif
