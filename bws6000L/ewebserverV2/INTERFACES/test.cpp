//test.cpp file 
//this program demonstrates the interfaces built to AO user 
// these interfaces are tested 
//
#include "aoaprotected.h"
#define MAX 1000

void main(){
	AOAProtected io;
	char buffer1[MAX]; //it is in the stack  
	char ch;
	char buffer[526]="abcdefgh"; //it is in the data segment 
	long  MemBaseValue=0;                //Memory Base Pointer thu Malloc()  
	long  *MemSizePtr;            //Total no of bytes available for Malloc() 
	long m,n;
	long  *desch;
	long  *descl;
	int test = 0;
	//if *value is declared then value must be 
	//  assigned some address, otherwise, it will 
	//  assume 0011 0000 address or PSP area 
	int k = 0; 
    long a = 0x61626364;
	long b,c;
	long *ptr1;     //to test pointers 
	long *ptr2;
	long *ptr3;
	ptr2 = &b;
	ptr3 = &c;
	int j; 
	char c1[2]; 
	unsigned short a1 = 0; 
    char a10[10]; 
    int value1; 
    int value2; 
    int retcode = 0; 
    unsigned int hword1 = 0; 
    unsigned int lword1 = 0; 
    unsigned int hword2 = 0; 
    unsigned int lword2 = 0; 
    unsigned int rhigh = 0; 
    unsigned int rlow = 0; 
    unsigned int t1high = 0; 
    unsigned int t1low = 0; 
    unsigned int t2high = 0; 
    unsigned int t2low = 0; 
	char *t1; 

	c1[0] = 0x01;
	c1[1] = 0xbb;
	t1 = &c1[0]; 
	desch =&m ;
	descl =&n ;
    hword2 = 0x8f841611; 
    lword2 = 0x890f8101; 
    hword1 = 0x8f0800f8; 
    lword1 = 0x82101817; 

	io.AOAPrintText("I am testing", Line8+20); 
    io.AOAsetTimerPeriod(TIMER_PERIOD); // set timer period 1=55msec 2=55/2 msec 
    io.AOAdisableIRQCntlr(2,0x01);  //disable Real Time Clock Interrupts IRQ8 
	io.AOAdisableIRQCntlr(1,0x01);  //disable System Timer Interrupts IRQ0 Hardware Timer INT 08h 	
	io.AOAenableIRQCntlr(1,0xfe);  //enable harderware timer IRQ0 INT08h

    value1 = io.AOAgetTimer(); 
    io.AOAprintHex(value1, Line18+20); 
    retcode = io.AOAgetClockTicks (&t1high, &t1low);    //t1 time 

    k = 0; 
    while (k == 0) 
    {
        value2 = io.AOAgetTimer() - value1; 
        io.AOAprintHex(value2, Line18+40); 
        io.AOAprintHex(io.AOAgetTimer(), Line18+60); 
        if ((value2 - value1) >= 240000)
            k = 1; 
    }
    retcode = io.AOAgetClockTicks (&t2high, &t2low);   //t2 time  
    retcode = io.AOAClockTicksAdd(t1high, t1low, t2high, t2low, &rhigh, &rlow); //t2-t1 

    io.AOAprintHex(t2high, Line20+20); 
    io.AOAprintHex(t2low, Line20+40); 
    io.AOAprintHex(t1high, Line21+20); 
    io.AOAprintHex(t1low, Line21+40); 
    io.AOAprintHex(rhigh, Line22+20); 
    io.AOAprintHex(rlow, Line22+40); 

	io.AOAPrintText("I am Exiting", Line24+20); 
    
    io.AOAExit(); 

	io.AOAPrintText("I am testing", Line8+20); 
    a1 = io.AOAconvertCharToShort(t1); 

        value1=1234; 
        j = io.AOAconvertBinaryToDecimal(a10, value1); 

	io.AOAprintHex(j, Line13+20);

    for (j=6; j<10; j++) 
      io.AOAprintCharacter(a10[j], Line14+4*j); 

    io.AOAExit(); 

	//while(1){	
	// get a character from keyboard
	//ch = io.AOAgetCharacter();

	// print a character
	//io.AOAprintCharacter(ch, 300);
	//io.AOAprintCharacter(ch); 
	//Sometime this function couldnot find the exact posititon to print


	// get an integer from keyboard
	//integ = io.AOAgetDecimal();
	//io.AOAprintDecimal(integ, 320);
	//io.AOAprintDecimal(integ);
	//Sometime this function couldnot find the exact posititon to print
	//io.AOAprintHex(integ, 340);
	//io.AOAprintHex(integ);
	//Sometime this function couldnot find the exact posititon to print

	// get a string  from keyboard
	//int len = io.AOAgetString(buffer);

	// print a string
	//io.AOAprintString(buffer, len, 400);
	//io.AOAprintString(buffer, len);
	//Sometime this function couldnot find the exact posititon to print
	
	//integ = io.AOAgetHex();
	//io.AOAprintHex(integ, 340);
	
	//io.AOAprintSpace(10, 40); // print 10 blanks at position 40

	//io.AOAskipLine(1);
	//skip given # of lines
	
	//scroll up one line
	//io.AOAscrollUp();
	
	//clearn screen
	//io.AOAcleanScreen();

	//get cursor
	//io.AOAgetCursor();

	//set cursor
	//io.AOAsetCursor(integ);

	// read floppy
	
//	io.AOAreadFloppy(buffer, 33);
//	for (j=0; j < 80; j++)
//	  {
//	   io.AOAprintCharacter(buffer[j],480+j*2);
//	   io.AOAgetCharacter();
//	  }

	// read one sector from floppy
	// given a sector # to buffer

	// malloc a chunk of memory
	// returns an address pointer 
	//  and no of bytes available in memory in sizeAlloc
	
	 //for (k = 0; k < MAX; k++)
	//	buffer1[k] = 'F'; //store F characters in the stack
	
//	 MemSizePtr = &a; //long value assign pointer address before use 
	                  // otherwise, it has a 0 value and will overwrite in PSP area
	 
	 //test = (int)sizeAlloc; 
	 //io.AOAprintHex(test,1680);
	 //io.AOAprintHex((int)&a,1120);
	 // Programmer does malloc() once 
	 //  the call will return the ptr in 
	 //  integ and no of bytes in sizeAlloc as a reference variable 
	 //  Now, the programmer knows the entire size of memory 
	 //   available for him to do memory management by himself
	// MemBaseValue = io.AOAmallocTotal(MemSizePtr);
//	io.AOAprintHex(MemBaseValue,1760);
  //      io.AOAprintHex(*MemSizePtr,1820);
	//
	//  MemBaseValue = io.AOAmallocTotal(MemSizePtr); 
	  //ptr1 = (long*)MemBaseValue;
//	  ptr1 =(long*)io.AOAmallocTotal(MemSizePtr); 
//	  *ptr1 = 0x200; 
//	  *ptr1 = *ptr1 + 0x500; 
  //	io.AOAprintHex(*ptr1,1820);
        //check all the malloc() able memory 
	// store some values to test it....
/*	for (long j = 0; j < *MemSizePtr; j = j + 4) 
	  {
	   *ptr1 = j;
	    ptr1++; 
	  }

	ptr2 = (long*)io.AOAgetTaskPtr();
	MemBaseValue = (long)ptr2;
	io.AOAprintHex(MemBaseValue,1820);*/

//	int GDTIndex=48;	
	//int status = io.AOAgetGDTEntry(desch,descl,GDTIndex);
	

//	io.AOAprintHex((long)*desch,1860);
//	io.AOAprintHex((long)*descl,1880);

//	*desch = 0x00000868;
//	*descl = 0x02008b00;
//	io.AOAPrintText("Start of the delay", 2720);
	//io.AOAShortDelay(5000000);
//	io.AOAPrintText("End of the delay", 2880);	

	//Setting GDT Entry in GDT

//	int m = io.AOAclearTotalMemory(MemBaseValue, MemSizePtr);

	//for (int i=0; i<3000; i++)
	//{
	 // io.AOAstore(integ, i, 'F');
	//}
	//int integ1=0, integ2=0;
	//integ1 = io.AOAgetTimer(); 	

	for(long i=0;i<i+1;i++)
	{
   	
	}
	io.AOAprintHex(i,Line11);	
	//integ2 = io.AOAgetTimer(); 		
	//io.AOAprintHex((integ2-integ1),Line10);	

	
	//io.AOAcliTimer();		
	//integ1 = io.AOAgetTimer(); 		
	//for( i=0;i<99999999;i++)
	//{
   	//}
	//integ2 = io.AOAgetTimer();
	//io.AOAprintHex((integ2-integ1),Line11);		
	
	//io.AOAstiTimer();		
	//integ1 = io.AOAgetTimer(); 		
	//for(i=0;i<99999999;i++)
	//{
	//}
	//integ2 = io.AOAgetTimer();
	//io.AOAprintHex((integ2-integ1),Line12);			

	//io.AOAprintHex(integ);
	
	//io.AOAPrintText(buffer,1120);

	//io.AOAPrintText(buffer);
//}
//	
        //long buffer2[128];
//	long l = 1;
  //      long* buffer2;
//	buffer2 = &l;
  //      io.AOAPrintText("befor calling", 1120);
    //    test = io.AOARDFloppyOneSector(34,buffer2);
	io.AOAExit();
}
