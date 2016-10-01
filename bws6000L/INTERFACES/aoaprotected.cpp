/*
 * AOAProtected.cpp
 *
 * Implimentation file of class AOAProtected
 *
 * @AOA project
 */
//--------------------------------------------------------------------------------------------------------------

#include "aoaprotected.h"

int AOAProtected::Application_Status = 0;	
int AOAProtected::phpparseflag = 0;	
int AOAProtected::phpparseflagread = 0;	
int AOAProtected::PosCount = 0;	
int AOAProtected::LineNumber = 0;	
long AOAProtected::RunRegister = 0;	
long AOAProtected::RcvCounter = 0;	
long AOAProtected::SndCounter = 0;	
long AOAProtected::HttpCounter = 0;	
long AOAProtected::IntCounter = 0;	
int AOAProtected::tDWCounter = 0;	
char AOAProtected::AUTHSYN_SPORT[2] = {0xc0, 0x20}; 
char AOAProtected::DomainName[25] = "baremachine.towson.edu"; 

//  Application_status = 0 The application is yet to start
//  Application_status = 1 The application is runnning
//  Application_status = 2 The application is stopped
//  This is used in case of tasks
//-----------------------------------------------
AOAProtected::AOAProtected(){
	version = 1;

}
//--------------------------------------------------------------------------------------------------------
long AOAProtected::test(long testcase)
{
	return Ctest32(testcase);
}
//--------------------------------------------------------------------------------------------------------
void AOAProtected::AOAcli()
{
	
	Ccli32();
}
//--------------------------------------------------------------------------------------------------------
int AOAProtected::AOAenableIRQCntlr(int picno,unsigned short mask)
{
	return CenableIRQCntlr32(picno,mask);

}
//--------------------------------------------------------------------------------------------------------
int AOAProtected::AOAdisableIRQCntlr(int picno,unsigned short mask)
{
	return CdisableIRQCntlr32(picno,mask);
}
//--------------------------------------------------------------------------------------------------------
int AOAProtected::AOAackPICCntlr(int picno)
{
	return CackPICCntlr32(picno);
}
//--------------------------------------------------------------------------------------------------------
void AOAProtected::AOAintTimer()
{
	CintTimer32();
}
//--------------------------------------------------------------------------------------------------------
void AOAProtected::AOAsti()
{
	    Csti32(); 
}
//--------------------------------------------------------------------------------------------------------
void AOAProtected::AOAstiTimer()
{	int i=0;
	CstiTimer32();
}
//--------------------------------------------------------------------------------------------------------
void AOAProtected::AOAcliTimer()
{
	CcliTimer32();
}

//------------------------------------------------------
int AOAProtected::AOAgetString(char* buffer){
	return CgetStr32(buffer);
}
//------------------------------------------------------
//  mode 0= real, 1 = protected 
//    In protected mode, descriptor always adds 0x00110000 to a given address 
//  In order to print real memory, we need to use a zero selector which 
//    does not add 0x00110000, that means, this has to be done in asm code 
//------------------------------------------------------
int AOAProtected::AOAprintMemory(long addr, int count, int location, int mode)
{	
        long *ptr = 0; 
	long p1; 
	ptr = &p1; 
	long value = 0; 

	//clear the screen area before print data 
	for( int i = 0; i < count*4 ; i++)
	  {
	  value = ' '; 
	  AOAprintCharacter(value, location+i*2);
	  ptr++;
	  }

	if (mode == 0)  //real memory address with zero selector 
	  {
	     for( int i = 0; i < count ; i++)
	       {
		 value = CgetRealMemory(addr); 
	         AOAprintHex(value, location + i*20);
		 addr = addr + 4; //next address  
	       }

	  }
	else if (mode == 1)   //protected memory above 0x00110000
         {
          addr = addr - ADDR_OFFSET; 
	  ptr = (long*)addr; 	

	  for( int i = 0; i < count ; i++)
	   {
	    value = *ptr; 
	    AOAprintHex(value, location + i*20);
	    ptr++;
	   }
	 } //end of else 

	return 0;
}

//-----------------------------------------------------------------------

int AOAProtected::AOAprintString(char* buffer, int len, int pos){
	return CprintStr32(buffer, len, pos);
} 
//-----------------------------------------------------------------------
int AOAProtected::AOAprintString(char* buffer, int len){
	int pos;

	pos = AOAgetCursor();
	return CprintStr32(buffer, len, pos);
} 

//-----------------------------------------------------------------------
int AOAProtected::AOAgetCursor(){
	return CgetCursor32();
}

//-----------------------------------------------------------------------
// get clock ticks 64 bit value 
//-----------------------------------------------------------------------
int AOAProtected::AOAgetClockTicks(unsigned int *hword1, unsigned int *lword1){
    unsigned int lowword = 0; 
    unsigned int highword = 0; 
    _asm
    {
         rdtsc
         mov lowword, eax 
         mov highword, edx 
    }
    *hword1 = highword; 
    *lword1 = lowword; 
    return 0; 
}

//-----------------------------------------------------------------------
// subtract using character arrays
//  and return two 32 bit result
//-----------------------------------------------------------------------
unsigned int AOAProtected::AOAClockTicksSubtract(unsigned int hword1, unsigned int lword1, unsigned int hword2, 
        unsigned int lword2, unsigned int *resulthigh, unsigned int *resultlow)
{
    int retcode = 0; 
    int i = 0; //count 
    int j = 0; 
    int k = 0; 
    int index = 0; 
    unsigned char ary1 [64]; 
    unsigned char ary2 [64]; 
    unsigned char mask [64]; 
    unsigned char result [64]; 
    unsigned int imask = 0; 
    unsigned int t1 = 0; 
    unsigned int t2 = 0; 
    unsigned int flag = 0; 

    for (i = 0; i < 32; i++)
       {
         ary1[i] = '0';  //reset to all 0 characters  
         ary2[i] = '0'; 
         result[i] = '0'; 
         imask = 0; 
       }

    //----------------------------------------------------
    if (hword2 == 0 && hword1 == 0) 
    {
        //common case
        *resulthigh = 0; 
        *resultlow =  lword2 - lword1;
        return 0; 
    }
    else if (hword2 == hword1) 
    {
        //common case
        *resulthigh = 0; 
        *resultlow =  lword2 - lword1;
        return 0; 
    }
    else if (hword2 == 0 && hword1 > 0) 
        return -1;     //error 
    else
    {
        //----------------------------------------------------
        //copy the bits as characters into arrays 
        imask = 0x80000000;   //bit 0 set to 1  
        for (i = 0; i < 32; i++)
            {
                t1 = hword1 & imask;      //extract the bit 
                if (t1 == imask) // if the bit is set
                   ary1[i] = '1';         //store a bit as a 1 character 
                else ary1[i] = '0';       //no need to shift, it is a 0 

                t2 = hword2 & imask;      //extract the bit 
                if (t2 == imask)          // if the bit is set
                   ary2[i] = '1';         //store a bit as 1 character 
                else ary2[i] = '0';       //no need to shift, it is a 0 

                imask = imask >> 1;       //shift mask by 1 bit
            }
        imask = 0x80000000;   //bit 0 set to 1  
        for (i = 0; i < 32; i++)
            {
                t1 = lword1 & imask;      //extract the bit 
                if (t1 == imask) // if the bit is set
                   ary1[i+32] = '1';      //store a bit as a 1 character 
                else ary1[i+32] = '0';    //no need to shift, it is a 0 

                t2 = lword2 & imask;      //extract the bit 
                if (t2 == imask) // if the bit is set
                   ary2[i+32] =  '1';     //store a bit as a 1 character 
                else ary2[i+32] = '0';       //no need to shift, it is a 0  

                imask = imask >> 1;       //shift mask by 1 bit
            }
        //64 bit values are now stored as 64 characters in the arrays 
        // we need to subtract the two arrays with carry 
        // Ary2 char 0    1    1   0  
        // Ary1 char 0    0    1   1
        // result    0    1    0   1 
        // borrow    0    0    0   1 
        // borrow has to be propagated to the left of current position until a 1 is found 
        //   replace the 0 character with 1 
        //   once the 1 is found, then make this 1 to zero 

        index = 63; 
        for (i=0; i<64; i++) 
        {
            //subtract each character 
            if (ary2[index] == '0' && ary1[index] == '0') 
                result[index] = '0'; 
            else if (ary2[index] == '1' && ary1[index] == '0') 
                result[index] = '1'; 
            else if (ary2[index] == '1' && ary1[index] == '1') 
                result[index] = '0'; 
            else if (ary2[index] == '0' && ary1[index] == '1') 
            {
                result[index] = '1'; 
                flag = 0; 
                j = index-1;       //start with the next character towards 0th character 
                while (flag == 0) 
                {
                    if (ary2[j] == '0')
                    {
                        ary2[j] = '1';  //set the carry bit and proceed   
                    }
                    else 
                    {
                        //this bit ends borrow character 
                        ary2[j] = '0'; 
                        flag = 1;     //quit borrowing now 
                    }
                    j = j - 1;        //continue borrow  
                    if (j < 0)       //last character then quit borrow  
                        flag = 1; 
                } //end of while loop for borrow  
            } //end of else 
            index--;                 //next character  
        }  //end of for loop 
        //result has the subtracted value 

        //set the value in the resulthigh and resultlow
        *resulthigh = 0; 
        *resultlow  = 0; 
        imask = 0x80000000; 
        for (i=0; i<32; i++) 
        {
            if (result[i] == '1') 
                *resulthigh = *resulthigh | imask;   
            imask = imask >> 1; 
        }
        imask = 0x80000000; 
        for (i=0; i<32; i++) 
        {
            if (result[i+32] == '1') 
                *resultlow = *resultlow | imask;   
            imask = imask >> 1; 
        } 
        /*
        if (*resulthigh > 0) 
        {
            AOAPrintText("ClockTcksDiffChar: Timer Value may be wrong!", Line23+20); 
            return -1; 
        }
        */

    } //end of main else 

    return 0; 
}
//-----------------------------------------------------------------------
// add using character arrays
//  and return two 32 bit result
//-----------------------------------------------------------------------
unsigned int AOAProtected::AOAClockTicksAdd(unsigned int hword1, unsigned int lword1, unsigned int hword2, 
        unsigned int lword2, unsigned int *resulthigh, unsigned int *resultlow)
{
    int retcode = 0; 
    int i = 0; //count 
    int j = 0; 
    int k = 0; 
    int index = 0; 
    unsigned char ary1 [64]; 
    unsigned char ary2 [64]; 
    unsigned char mask [64]; 
    unsigned char result [64]; 
    unsigned int imask = 0; 
    unsigned int t1 = 0; 
    unsigned int t2 = 0; 
    unsigned int flag = 0; 
    unsigned char carry = '0'; 

    for (i = 0; i < 32; i++)
       {
         ary1[i] = '0';  //reset to all 0 characters  
         ary2[i] = '0'; 
         result[i] = '0'; 
         imask = 0; 
       }

        //In case of ADD, you must add all the time no matter what is the high value 
        //----------------------------------------------------
        //copy the bits as characters into arrays 
        imask = 0x80000000;   //bit 0 set to 1  
        for (i = 0; i < 32; i++)
            {
                t1 = hword1 & imask;      //extract the bit 
                if (t1 == imask) // if the bit is set
                   ary1[i] = '1';         //store a bit as a 1 character 
                else ary1[i] = '0';       //no need to shift, it is a 0 

                t2 = hword2 & imask;      //extract the bit 
                if (t2 == imask)          // if the bit is set
                   ary2[i] = '1';         //store a bit as 1 character 
                else ary2[i] = '0';       //no need to shift, it is a 0 

                imask = imask >> 1;       //shift mask by 1 bit
            }
        imask = 0x80000000;   //bit 0 set to 1  
        for (i = 0; i < 32; i++)
            {
                t1 = lword1 & imask;      //extract the bit 
                if (t1 == imask) // if the bit is set
                   ary1[i+32] = '1';      //store a bit as a 1 character 
                else ary1[i+32] = '0';    //no need to shift, it is a 0 

                t2 = lword2 & imask;      //extract the bit 
                if (t2 == imask) // if the bit is set
                   ary2[i+32] =  '1';     //store a bit as a 1 character 
                else ary2[i+32] = '0';       //no need to shift, it is a 0  

                imask = imask >> 1;       //shift mask by 1 bit
            }
        //64 bit values are now stored as 64 characters in the arrays 
        // we need to subtract the two arrays with carry 
        // Ary2 char 0    1    1   0  
        // Ary1 char 0    0    1   1
        // result    0    1    0   1 
        // borrow    0    0    0   1 
        // borrow has to be propagated to the left of current position until a 1 is found 
        //   replace the 0 character with 1 
        //   once the 1 is found, then make this 1 to zero 

        index = 63; 
        carry = '0'; 
        for (i=0; i<64; i++) 
        {
            //add three characters 
            if (ary2[index] == '0' && ary1[index] == '0' && carry == '0') 
            {
                result[index] = '0'; 
                carry = '0'; 
            }
            else if (ary2[index] == '0' && ary1[index] == '0' && carry == '1') 
            {
                result[index] = '1'; 
                carry = '0'; 
            }
            else if (ary2[index] == '0' && ary1[index] == '1' && carry == '0') 
            {
                result[index] = '1'; 
                carry = '0'; 
            }
            else if (ary2[index] == '0' && ary1[index] == '1' && carry == '1') 
            {
                result[index] = '0'; 
                carry = '1'; 
            }
            else if (ary2[index] == '1' && ary1[index] == '0' && carry == '0') 
            {
                result[index] = '1'; 
                carry = '0'; 
            }
            else if (ary2[index] == '1' && ary1[index] == '0' && carry == '1') 
            {
                result[index] = '0'; 
                carry = '1'; 
            }
            else if (ary2[index] == '1' && ary1[index] == '1' && carry == '0') 
            {
                result[index] = '0'; 
                carry = '1'; 
            }
            else if (ary2[index] == '1' && ary1[index] == '1' && carry == '1') 
            {
                result[index] = '1'; 
                carry = '1'; 
            }

            index--;                 //next character  
        }  //end of for loop 
        //result has the subtracted value 

        //set the value in the resulthigh and resultlow
        *resulthigh = 0; 
        *resultlow  = 0; 
        imask = 0x80000000; 
        for (i=0; i<32; i++) 
        {
            if (result[i] == '1') 
                *resulthigh = *resulthigh | imask;   
            imask = imask >> 1; 
        }
        imask = 0x80000000; 
        for (i=0; i<32; i++) 
        {
            if (result[i+32] == '1') 
                *resultlow = *resultlow | imask;   
            imask = imask >> 1; 
        } 

    return 0; 
};
//-----------------------------------------------------------------------
long AOAProtected::AOAgetTimer(){
	return CgetTimer32();
//	return Timer_Count;
}

//-----------------------------------------------------------------------
int AOAProtected::AOAsetCursor(int pos){
	return CsetCursor32(pos);
}

//-----------------------------------------------------------------------
int AOAProtected::AOAcleanScreen(){
	return CcleanScreen32();
}

//-----------------------------------------------------------------------
int AOAProtected::AOAscrollUp(){
	return CscrollUp32();
}

//-----------------------------------------------------------------------
//print character using video memory 
// display is a shared resource for all tasks 
// use cli and sti to make sure timer interrupt does not come 
// this is used to print trace characters 
// ----------------------------------------------------------------------
int AOAProtected::AOAprintCharacter(char value, int pos, int* pindex){
 int retcode; 
 int pi; 

        //AOAcli();   //disbale timer and other interrupts 
	//critical section start  
	pi = *pindex; 
	retcode = CprintChar32(value, pos);
	retcode = CprintChar32 ('P', pi * 2 + Line3); 
	*pindex = *pindex + 1; //increment index  
	//critical section end  
	//AOAsti(); 
        return retcode; 
}

//-----------------------------------------------------------------------
//print character using video memory 
// display is a shared resource for all tasks 
// use cli and sti to make sure timer interrupt does not come 
// this is used for all other print characters but not printing trace char
// ----------------------------------------------------------------------
int AOAProtected::AOAprintCharacter(char value, int pos)
{
 int retcode; 

     if(pos < 0 || pos >= 4000)
	{
	   return -1;
	}
        //AOAcli();   //disbale timer and other interrupts 
	//critical section start  
	retcode = CprintChar32(value, pos);
	//critical section end  
	//AOAsti(); 
        return retcode; 
}


//-----------------------------------------------------------------------
int AOAProtected::AOAprintCharacter(char value){
	int pos, retcode;

        //AOAcli();   //disbale timer and other interrupts 
	//critical section start  
	pos = AOAgetCursor();
	retcode = CprintChar32(value, pos);
	//AOAsti(); 
        return retcode; 
}
//-----------------------------------------------------------------------
int AOAProtected::AOAprintSpace(int count, int pos){
	char blank = ' ';
	int base;
	
	base = pos;
	for(int i=0; i<count; i++){
		AOAprintCharacter(blank, base);
		base += 2;
	}
	
	return 0;
}
//-----------------------------------------------------------------------
int AOAProtected::AOAprintSpace(int count){
	char blank = ' ';
	int base;
	
	base = AOAgetCursor();
	for(int i=0; i<count; i++){
		AOAprintCharacter(blank, base);
		base++;
	}
	
	return 0;
}
//-----------------------------------------------------------------------
int AOAProtected::AOAskipLine(int lines){
	for(int i=0; i<lines; i++)
		CnewLine32();

	return 0;
}
//-----------------------------------------------------------------------
int AOAProtected::AOAprintDecimal(int value, int pos){
	return CprintDec32(value, pos);
}
//-----------------------------------------------------------------------
int AOAProtected::AOAprintDecimal(int value){
    	int i=0;
	//AOAcliTimer();
	int pos = AOAgetCursor();
	i = CprintDec32(value, pos);
	//AOAstiTimer();
	return i;
}
//-----------------------------------------------------------------------
// print hexa decimal value on the screen 
// this routine does not use any interrupts
//  when printing a character uses a lock 
//  RKK 6-14-2005 
//-----------------------------------------------------------------------
int AOAProtected::AOAprintHex(long value, int pos){
    	int i =0;
	int retcode; 
	char c; 
	unsigned int maskv = 0xf0000000; 
	unsigned int datav = 0; 
	unsigned int indexv = 0; 
	int positionv = 0; 
	char HexTable[17] = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 
			      'A', 'B', 'C', 'D', 'E', 'F', '\0'}; 

        //shifting maskv or datav did not work for some weired reason!!!!!!!!!!!RKK
	
	datav = value;
	positionv = pos; 
        if(pos < 0 || pos >= 4000)
	{
	   AOAPrintText("line no is beyond the limit (0 to 4000)", Line24);
	   return -1;
	}
	   for (i = 0; i < 8; i++) 
	     {
	   	indexv = datav & maskv; //bitwise AND 
	   	indexv = datav >> 28; //shift right to form index   
	   	c = HexTable[indexv]; //get a character from the table with index  
	   	retcode = AOAprintCharacter (c, positionv); //print the character  
	   	positionv = positionv + 2; //next nibble to print  
		datav = datav << 4;    //left shift the data by 4 bits   
	      }

	return retcode;
}
//-----------------------------------------------------------------------
// print hexa decimal value on the screen 
// this routine does not use any interrupts
//   this version can take a char pointer as input 
//  RKK 6-14-2005 
//-----------------------------------------------------------------------
int AOAProtected::AOAprintHex(char *value, int pos){
    	int i =0;
	int retcode; 
	char c; 
	unsigned int maskv = 0xf0000000; 
	unsigned int datav = 0; 
	long *p1; 
	long p2; 
	unsigned int indexv = 0; 
	int positionv = 0; 
	char HexTable[17] = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 
			      'A', 'B', 'C', 'D', 'E', 'F', '\0'}; 
	p1 = &p2; //dummy address  

        //shifting maskv or datav did not work for some weired reason!!!!!!!!!!!RKK
	
	p1 = (long*)value;
	datav = *p1; 

	positionv = pos; 
        if(pos < 0 || pos >= 4000)
	{
	   AOAPrintText("line no is beyond the limit (0 to 4000)", Line24);
	   return -1;
	}
	   for (i = 0; i < 8; i++) 
	     {
	   	indexv = datav & maskv; //bitwise AND 
	   	indexv = datav >> 28; //shift right to form index   
	   	c = HexTable[indexv]; //get a character from the table with index  
	   	retcode = AOAprintCharacter (c, positionv); //print the character  
	   	positionv = positionv + 2; //next nibble to print  
		datav = datav << 4;    //left shift the data by 4 bits   
	      }

	return retcode;
};
//-----------------------------------------------------------------------
int AOAProtected::AOAclearNTFlag(){
    	int i =0;
	i = CclearNTFlag();
	return i;
}
//-----------------------------------------------------------------------
int AOAProtected::AOAprintFlags(int pos){
    	int i =0;
	i = CprintFlags32(pos);
	return i;
}
//-----------------------------------------------------------------------
int AOAProtected::AOAgetFlags(){
    	int i =0;
	_asm { 
	      cli 
	      push eax 
	      pushfd 
	      pop eax 
	      mov i, eax 
	      pop eax 
	      sti
	     }
	return i;
}
//-----------------------------------------------------------------------
char AOAProtected::AOAgetSharedMemChar(int index, int base){
	return CgetSharedMemChar32 (index, base);
}


//------------------------------------------------------
int AOAProtected::AOAreadRTC(){
    int retcode = 0; 
    AOAsetSharedMem(0x120, 0x0); //reset memory  
    AOAsetSharedMem(0x124, 0x0); //reset memory  
    AOAsetSharedMem(0x128, 0x0); //reset memory  
    AOAsetSharedMem(0x130, 0x01); //set RTCFLAG  
	retcode = CreadRTC();
    AOAsetSharedMem(0x130, 0x00); //reset RTCFLAG  
    retcode = AOAgetSharedMem(0x120); 
	return retcode;
}
//------------------------------------------------------
int AOAProtected::AOAreadDATE(){
    int retcode = 0; 
    AOAsetSharedMem(0x120, 0x0); //reset memory  
    AOAsetSharedMem(0x124, 0x0); //reset memory  
    AOAsetSharedMem(0x128, 0x0); //reset memory  
    AOAsetSharedMem(0x130, 0x02); //set RTCFLAG  
	retcode = CreadDATE();
    AOAsetSharedMem(0x130, 0x00); //reset RTCFLAG  
    retcode = AOAgetSharedMem(0x124); 
	return retcode;
}
//-----------------------------------------------------------------------
unsigned long AOAProtected::AOAUnixTime(unsigned int rtc, unsigned int date) {


  unsigned int b =0;
  unsigned int day, mon, year, sec, min, hour; 
  unsigned long v1 = 0; 
  unsigned long c1 = 0; 
  unsigned long c2 = 0; 

  day = 0;
  mon = 0;
  year = 0;
  hour = 0;
  min = 0;
  sec = 0;
  c1 = 863398800; 
  c2 = 0; 

			day = date & 0x000000FF;
			
			b = date & 0x0000FF00;
			mon = b >> 8;
			
			b = date & 0xFFFF0000;
			year = b >> 16;

            //convert rtc 
			b = rtc & 0x0000FF00;
			sec =b >>8;
			
			b = rtc & 0x00FF0000;
			min = b >> 16;
			
			b = rtc & 0xFF000000;
			hour = b >> 24;

    year = AOAconvertCharToInt(year);
    mon = AOAconvertCharToInt(mon);
    day = AOAconvertCharToInt(day);
    hour = AOAconvertCharToInt(hour);
    min = AOAconvertCharToInt(min);
    sec = AOAconvertCharToInt(sec);

   if(0 >= (int)(mon -=2)){     // 1..12 -> 11,12,1,....10
		mon += 12;				//puts feb last since it has leap day
		year -= 1;
	}
	return (((
		           (year/4 - year/100 + year/400 + 367*mon/12 + day) +
			year*365 - 719499
		)*24 +hour  //now we have hours
	     )*60 + min //now we have minutes
	  )*60 + sec ; //finally seconds

    /* the following code has some problem
   if(0 >= (int)(mon -=2)){     // 1..12 -> 11,12,1,....10
		mon += 12;				//puts feb last since it has leap day
		year -= 1;
	}

    c2 = 438291*year - c1; 
    AOAprintHex(c2, Line10+40); 
    v1 = 72 * (c2 + 36700 * mon + 1200 * day + 50 * hour) + 60 * min + sec;
    AOAprintHex(v1, Line10+60); 
    return v1; 
    */

};
//****************************************************************************************
// This will convert 4 byte value or 8 characters into unsigned int value 
//  and return the value 
//****************************************************************************************
unsigned int AOAProtected::AOAconvertCharToInt(int chars)
{
    unsigned int value  = 0; 
    unsigned int value1 = 0; 
    unsigned int value2 = 0; 
    int i=0; 

    value1 = chars; 
    for (i=0; i < 8; i++) 
      {
       value2 = value1 & 0x0000000f;  
       if (value2 < 0 || value2 > 9) 
         {
             AOAPrintText("Error:AOAprotected Not a valid character in conversion to int value", Line23+20); 
             return -1; 
         }
       else
         {
           value = value + value2 * AOApower10(i);  
         }
       value1 = value1 >> 4; //next nibble or character 
      }
    return value; 
}; 
//****************************************************************************************
// This will convert unsigned int into 8 characters  
//****************************************************************************************
int AOAProtected::AOAconvertIntToChar(char *chars, unsigned int value)
{
    unsigned int value1 = 0;
    unsigned int value2 = 0;
    int i = 0;
    value2 = value;
        for (i = 0; i < 8; i++)   
        {
            value1 = value2 & 0x0000000f;
            chars[7-i] =value1 + 0x30;
            value2 = value2 >> 4; //next digit
        }
    return 0; 
}; 
//****************************************************************************************
// computes powers of 10, used to convert integer values 
//****************************************************************************************
unsigned int AOAProtected::AOApower10(int tenpower)
{
    int i = 0; 
    unsigned int value = 1; 
    for (i=0; i < tenpower; i++)
      {
          value = value * 10; 
      }
    return value; 
};

//-----------------------------------------------------------------------
// reset automic instruction 
// returns 1 if it is locked 
// returns 0 if it is not locked, which is an error! 
int AOAProtected::AOAresetLock(int lock, long tid){
   return CresetLock32 (lock, tid);
}
//-----------------------------------------------------------------------
// testAndSet automic instruction 
// return 0, operation is successful 
// return 1, operation was not successful, it is already locked 
// if it is locked by the same process before, it is ok, it is successful
//-----------------------------------------------------------------------
int AOAProtected::AOAtestAndSet(int lock, long tid){
  int taskid, storedlock; 

  storedlock = AOAgetSharedMem(0x4c);   //hardcoded 
  taskid = AOAgetSharedMem(0x5c+lock);  //hardcoded the values are in sharmem.inc 

  if (storedlock == 1 && taskid == tid)
     return 0;   //it is successful, the same process made the lock before 
  else 
   return CtestAndSet32 (lock, tid);
}
//-----------------------------------------------------------------------
// This procedure gets 40 characters from the shared memory 
//   where a trace string is stored 
void AOAProtected::AOAgetSharedMemTraceString(char* array1){
  int i = 0; 
  for (i=0; i < 40; i++) 
   array1[i] = AOAgetSharedMemChar (i,0x24); //hard coded!S_APP_String
  //array1 now has the 40 character string 
}
//-----------------------------------------------------------------------
// This procedure sets 40 characters in the shared memory 
//   where a trace string is stored 
void AOAProtected::AOAsetSharedMemTraceString(char* array1){
  int i = 0; 
  for (i=0; i < 40; i++) 
   AOAsetSharedMemChar (i,array1[i], 0x24); //hard coded! S_APP_String
  //array1 has the 40 character string 
}
//-----------------------------------------------------------------------
void AOAProtected::AOAsetSharedMemChar(int index, char c, int base){
	CsetSharedMemChar32 (index, c, base);
}

//-----------------------------------------------------------------------
long AOAProtected::AOAgetSharedMem(int index){
	return CgetSharedMem32 (index);
}
//-----------------------------------------------------------------------
void AOAProtected::AOAsetSharedMem(int index, long val){
	 CsetSharedMem32 (index, val);
}
//-----------------------------------------------------------------------
//gets data from memory with absolute address
//-----------------------------------------------------------------------
long AOAProtected::AOAgetMem(long addr){
	return CgetMem32 (addr);
}
//-----------------------------------------------------------------------
//set the 4 byte data in memory with absolute address
//-----------------------------------------------------------------------
long AOAProtected::AOAsetMem(long addr, long data){
	return CsetMem32 (addr, data);
}
//-----------------------------------------------------------------------
void AOAProtected::AOAprintRegs (int pos){
	CprintRegs32 (pos);
}
//-----------------------------------------------------------------------
void AOAProtected::AOAprintStackRegs (int pos){
	CprintStackRegs32 (pos);
}
//-----------------------------------------------------------------------
long AOAProtected::AOAgetStackPOP(int index){
	return CgetStackPOP32 (index);
}
//-----------------------------------------------------------------------
// It is implemented in the API instead of prcycle 
// RKK 6-21-2005 
// -----------------------------------------------------
int AOAProtected::AOAgetDecimal(){
	char ch;
	int mul = 10;
	int result = 0;

	ch = AOAgetCharacter();
	while(ch>='0' && ch<='9'){
		result *= mul;
		result += ch - '0';
		ch = AOAgetCharacter();
	}

	return result;
}
//------------------------------------------------------
// It is implemented in the API instead of prcycle 
// RKK 6-21-2005 
// -----------------------------------------------------
int AOAProtected::AOAgetHex(){
	char ch;
	int mul = 16;
	int result = 0;
	int tmp = 0;

	ch = AOAgetCharacter();
	while((ch>='0' && ch<='9') || (ch>='a' && ch<='f') || (ch>='A' && ch<='F')){
		if(ch>='0' && ch<='9'){
			tmp = ch - '0';
		}else if(ch>='a' && ch<='f'){
			tmp = ch - 'a' + 10;
		}else{
			tmp = ch - 'A' + 10;
		}

		result *= mul;
		result += tmp;
		ch = AOAgetCharacter();
	}

	return result;
}
//------------------------------------------------------
// It is implemented in the API instead of prcycle 
// RKK 6-21-2005 
// -----------------------------------------------------
char AOAProtected::AOAgetCharacter(){
  int cursorp; //cursor position  
  char c;      //character to be read  
        
        cursorp = AOAgetCursor();  //get cursor position 
	c = CgetChar32 (cursorp);  //call get character 
	AOAprintCharacter(c, cursorp*2); //echo the character 
	cursorp = cursorp + 1;     //next position  
	AOAsetCursor(cursorp);     // set up for next position 
	return c;                  //return the character 
}
//------------------------------------------------------
// It is implemented using interrupt 
// RKK 6-21-2005 
// -----------------------------------------------------
char AOAProtected::AOAgetCharacterInt(){
     return CgetCharInt32();         
}
//------------------------------------------------------
//------------------------------------------------------
char AOAProtected::AOAgetCharacterBuff()
{	char i =0;
	i= CgetCharBuff32();
	return i;
}
//------------------------------------------------------

int AOAProtected::AOAreadFloppy(char* buff, long sectorno){
	return CreadFloppy32(buff, sectorno);
}

//------------------------------------------------------
int AOAProtected::AOAwriteFloppy(char* buff, long sectorno){
	return CwriteFloppy32(buff, sectorno);
}
//------------------------------------------------------
int AOAProtected::AOAclearTotalMemory(long MEMBaseValue, long* MEMSizePtr)
{	long *ptr;
	ptr=(long*)MEMBaseValue; 
	for( int i = 0; i < *MEMSizePtr ; i=i+4)
	{
	*ptr = 0x00000000;
	ptr++;
	}
	return 0;
}
//-----------------------------------------------------------------------
void AOAProtected::AOAExit()
//io.AOAExit call in the application when compiled will do 
//  push on edi, esi, ebx and also change the stack pointer 
//   before returning from the interrupt, we need to restore the stack 
//   The following asm code should be in this file only, otherwise, 
//     a C call will push more registers on the stack 
{
_asm{
    	cli
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	sti
	iretd
    }
}

//-----------------------------------------------------------------------
// When we have written an ISR (interrupt service routine) which is in 
//   the application program (EtherIntReceive) instead of in the PRCYCLE 
//   caused the return problem 
//   This routine for compiler was a call and thus it pushed EDI, ESI, EBX 
//     and did a push on EBP as well, look at EtherIntReceive.asm file for details 
//   As this routine is like an interrupt where the code is in the application, 
//    but for compiler purposes it is a call, we need to restore the stack the 
//    following way...
//-----------------------------------------------------------------------
// This call is only used for ISR routines 
//  currently we use this for EtherIntReceive in apptask.cpp file 
//  It can also be used for other ISRs, but watch the registers 
//  pushed on the stack!
//-----------------------------------------------------------------------
void AOAProtected::AOAISRExit()
{
// keep the asm code here, otherwise, you need to worry about 
//  a C call push on the stack 
//  Also, watch some times, if EtherIntReceive has pushed eci or some 
//  other registers on the stack
//  compile apptask.asm with asm1.bat and check the apptask.lst file 
//   to see if any other registers are pushed on the stack! 
//  Adjust the following code accordingly
//

_asm{
	
	pop	edi   ; io.AOAISRExit related 
	pop	esi   ;  '
	pop	ebx   ;  '
	mov	esp, ebp ; '
	pop	ebp   ;    ' 

	pop	edi   ; EtherIntReceive Call related  
	pop	esi   ; '
	pop	ebx   ; '
	mov	esp, ebp ; '
	pop	ebp

	;---------------------------------------------------------------------------------
	;changed this code on 7-7-2004
		push	edx
		pushfd ; turn off NT flag in the CPU not in the TSS
		; so that CPU will return to its application during IRETD not to 
		;  exit from the task using link field in the TSS 
		pop	edx;
		AND	edx, 0FFFFBFFFh
		push	edx
		popfd
		pop	edx
	;---------------------------------------------------------------------------------

	sti           ; now you can enable interrupts 

	iretd         ; return from ISR 
    }
	
}
/********************************************************************************
 * Takes the string and prints it at the given base position in the screen
 ********************************************************************************/
void AOAProtected::AOAPrintText(char* str, int base)
{	
	int temp=0;
        temp = base;	

     if(base < 0 || base >= 4000)
	{
	   return;
	}
	// This loop runs untill the end of the string
	for (int i = 0; str[i] != '\0' && i < 80 ; i++)
	{
	  AOAprintCharacter(str[i], temp);
	  temp +=2;
	}
	// Position  the cursor right after the printed text
	//AOAsetCursor(temp/2);
}	
/********************************************************************************
 * Takes the string and length and prints it at the given base position in the screen
 ********************************************************************************/
void AOAProtected::AOAPrintText(char* str, int length, int base)
{	
	int i;
	for (i=0; i<length; i++)
	{
	  AOAprintCharacter(str[i],base);
	  base +=2;
	}
	// Position  the cursor right after the printed text
	//AOAsetCursor(base/2);
}	
/*******************************************************************************************************************
 * Another Varient of print Text which accepts only  the char string and prints it from the current cursor position
 *******************************************************************************************************************/

void AOAProtected::AOAPrintText(char* str)
{	
	int charpos, temp1;
	 charpos = AOAgetCursor();
	 int base = charpos*2;
	 
	for (int i = 0; str[i] != '\0'; i++)
	{
	  if(str[i] == '\n')
	 {
           charpos = AOAgetCursor();
	   temp1 = charpos%80;
	   charpos=charpos+(80-temp1);
	   AOAsetCursor(charpos); 
	  }
	  else
	  {
	  AOAprintCharacter(str[i],base);
	  base +=2;
	  }
	}
	AOAsetCursor(base/2);

}	
//****************************************************************************************
// This will convert 2 byte character symbols into one byte Hex value 
//  This is used to import certificate file in tls 
//****************************************************************************************
char AOAProtected::AOA2CharTo1CharHex(char *ptr)
{
    char  t1  = ' ';
	char c1 = 0;
	char c2 = 0; 
	
	
	if( ptr[0] >= '0'&& ptr[0] <= '9')
		c1 = ptr[0] - 0x30;
	else
	if( ptr[0] >= 'A' && ptr[0] <= 'F')
		c1 = ptr[0] - 0x37;
	else
	if( ptr[0] >= 'a' && ptr[0] <= 'f')
		c1 = ptr[0] - 0x57;
	
	c1 = c1 & 0x0f;      //only 4 bits captured 
	c1 = c1 << 4;       //shift left 4 bits 

	if( ptr[1] >= '0' && ptr[1] <= '9')
		c2 = ptr[1] - 0x30;
	else
	if(ptr[1] >= 'A' && ptr[1] <= 'F')
		c2 = ptr[1] - 0x37;
	else
        if( ptr[1] >= 'a' && ptr[1] <= 'f')
		c2 = ptr[1] - 0x57;

	c2 = c2 & 0x0f;     //only 4 bits captured 
	c1 = c1 | c2; 

	t1 = c1 & 0x0ff;

    return t1;
};
/********************************************************************************************
 * This function converts  char array into decimal number 
 * This is useful when a number like 45 is in char array, it converts it into a decimal number 
 * The input to this function is char array nom[5]
 *******************************************************************************************/
int AOAProtected::AOACharToDecimal(char nom[5])
{
  int num;
  int charno;
  for(int h = 0; nom[h] !='\0';h++);// Calculate the length of the char array
     num = nom[--h] - 0x30; // Convert the units digit of the number into decimal 

         
     // Parse the rest of the digits of the number
     for(int g = 1; h > 0 ;h--,g++)
      {
      charno = (nom[h-1] - 0x30);
     
      for( int d =g; d > 0; d--)
      {
      charno = charno *10; //Calculate the weightage of the position
       
      }
    
      num = num + charno;
      }
     return num;
}
/***************************************************************************************************************
 * This function converts ip address which is obtained as character array and converts into a 4 byte ip address
 * The input ip which is a char array
 * The output ipchar which is a 4 byte char array IP address
 * This function is not so robost so proper input must be given
 ***************************************************************************************************************/
void AOAProtected::AOAChartoIP(char ip[20], char ipchar[4])
{
char temp[3]; int i,j,k,l; // loop Variables
  
l=0;
	for(i = 0; ip[i]!='\0'; i++)
	{
		for( int j=i, k=0; ip[j]!='.' && ip[j]!='\0' ; j++,i++,k++)
		{
		temp[k]=ip[j];
		}
 	temp[k]='\0';
	ipchar[l++]= AOACharToDecimal(temp);
}
ipchar[l]='\0';
}
//-----------------------------------------------------------------------
// This checks a valid character for WWW Links 
//  it can be only alphanumeric, period, or dash 
//  We do not check for a valid domain name at this point
//  One need to do DNS to do this 
//-----------------------------------------------------------------------
int AOAProtected::AOAcheckValidLinkChar(char ch)
{
    unsigned char c; 

    c = ch; 
    if ((c >= 0x61 && c <= 0x7A) ||  (c >= 0x41 && c <= 0x5A) || (c >= 0x30 && c <= 0x39) ||
          (c == 0x2E) || (c == 0x2D))
      return 0; 
    else return -1; 
}
//--------------------------------------------------------------------------
// This method is used in the Web server, do not change this defition 
//--------------------------------------------------------------------------
int AOAProtected::AOAStrLenAll(char* str)
{
	int len;
	len = 0;
	while(str[len] != '\0')   
	{
		len++;
	}
	return len;
};
//--------------------------------------------------------------------------
// This method is used to parse one line of test 
//--------------------------------------------------------------------------
int AOAProtected::AOAParseOneLine(char* str)
{
	int len;
	len = 0;
	while(str[len] != 0x0d && str[len + 1] != 0x0a)   
        
	{
		len++;
	}
	return len;
};
/***************************************************************************************************************
 * This function calculates the length of a given string
 * The input is a String 
 * The output is the length of the string
 ***************************************************************************************************************/

int AOAProtected::AOAStrLen(char* str)
{
	int len;
	len = 0;
	//if the char in string is not '\0' then go on until it reaches the MaxLen
	// while(str[len] != '\0')   
	while(str[len] != '\0' && str[len] != 0x0a && str[len] != 0x0d)   
	{
		len++;
	}
	return len;
}
/***************************************************************************************************************
 * This function calculates the length of a given string
 * The input is a String 
 * The output is the length of the string
 ***************************************************************************************************************/
void AOAProtected::AOAStrRev(char* str)
{
 int len = AOAStrLen(str);
 char str1[256];
 for(int h = len,i =0; h >0 ; h--, i++)
  {
   str1[i]=str[h-1];
  }
  str1[i]='\0';
  int k=0;
  while(str1[k]!='\0')
  {
    str[k] = str1[k];
    k++;
  }
  str[k]='\0';
}
/***************************************************************************************************************
 * This function converts a decimal number into a char number
 * This is used in POP like applications where a decimal number must be sent as a string
 ***************************************************************************************************************/
void AOAProtected::AOADecimalToChar(int num, char nom[5])
{
int i=0;

while(num >0)
{
nom[i++] = (num % 10) + 0x30;
num = num /10;
}

nom[i]='\0';
AOAStrRev(nom);

}
/***************************************************************************************************************
 * This function concatenates two string 
 * The input is three strings str is the result of the concatenated strings str1 and str2
 ***************************************************************************************************************/
void AOAProtected::AOAStrCat(char* str, char* str1, char* str2)
{

	//copy the chars in str1 into str, except '\0'
	for (int i = 0; str1[i] != '\0'; i++)
	{
		str[i] = str1[i];
	}

 
	for (int j = 0 ; str2[j] != '\0';j++,i++)
	{
		str[i] = str2[j];
	}
	str[i]='\0';
};
//--------------------------------------------------------------------
// this function concatenates str2 with str2 given both lengths 
//  requires exact lengths 
//--------------------------------------------------------------------
void AOAProtected::AOAStrCat(char* str1, char* str2, int l2)
{
	for (int i = 0; i < l2; i++)
		str1[i] = str2[i];
};
//***********************************************************
//  checks for upper case letters A-Z
//   returns 1 if upper, else 0 
//***********************************************************
int AOAProtected::AOAUpper(char c)
  {
    unsigned short u; 

    u = c & 0x00ff;   //unsigned short value 
    if (u >= 0x41 && u <= 0x5a) 
      return 1; 
    else return 0; 
  };
//***********************************************************
//  checks for lower case letters a-z 
//   returns 1 if lower, else 0 
//***********************************************************
int AOAProtected::AOALower(char c)
  {
    unsigned short u; 

    u = c & 0x00ff;   //unsigned short value 
    if (u >= 0x61 && u <= 0x7a) 
      return 1; 
    else return 0; 
  };
//************************************************************************************
//  power function 
//   no error checking or overflow implemented 
//************************************************************************************
unsigned long AOAProtected::AOAPower(int base, int power)
  {
    int i = 0; 
    unsigned long p = 0; 

    p = 1;
    for (i = 0; i < power; i++)
      {
        p = p * base; 	
      }
    return p; 
  };
//****************************************************************************
//substring copy 
//****************************************************************************
void AOAProtected::AOASubStrCopy(char * field, const char * arg1, int start, int end, int outstart)
{
	int j=0;
	//while(field[i] != '@')
	//{
	//	i++;
	//}

	//field[i] = ' ';
	while((start+j) <= end)
	{
		field[outstart+j] = arg1[start + j];
		j++;
	}
}
//**********************************************************************
// string copy 
//**********************************************************************
void AOAProtected :: AOAStrCopy(char *s1, const char *s2, int len)
{
	int i=0;
	while(i < len)
	{
		s1[i] = s2[i];
		i++;
	}
	s1[i]= 0x00;
}
//**********************************************************************
// string method to trim off leading blanks from a string, if any ghf 
//**********************************************************************
void AOAProtected::AOAStrTrim(char *s1, const char * s2, int len)
{
    int i = 0;
    // int validChar = 0;
    while(i < len)
    {
      /// if( s2[i] > 0x20 && validChar == 0)
      if( s2[i] > 0x20 && s2[i] <= 0x7e)
      {
         // validChar = 1;
         s1[i] = s2[i]; 
      }
      // else if (validChar == 1)
      //     s1[i] = s2[i];
      i++;
    }
    s1[i] = 0x00;   // null character
}


//************************************************************************************
// compare two strings for full compare including case sensitive
//  return 0 if compares 100% 
//  compare strings only for a given length 
//  retrn -1 if it fails 
//  mixedcase = 0, compare as is 
//  mixedcase = 1, compare with mixed letters A-Z 0r a - z 
//************************************************************************************
int AOAProtected::AOAStrCompare(char* str1, char* str2, int length, int mixedcase )
{
  int retcode=0, j=0; 
  char ch = ' '; 
  unsigned short u1 = 0, u2 = 0; 

  retcode = 0; 
  if (mixedcase == 0)    //compare as is  
    {
      for (j = 0 ; j < length; j++)
        {
          if (str1[j] == str2[j])
	    retcode = 0; 
          else retcode = -1; 
          if (retcode != 0)
	    return retcode; 
        }
    }

  else if (mixedcase == 1)    //s1 and s2 could be mixed case    
    {
      for (j = 0 ; j < length; j++)
        {
	  u1 = str1[j] & 0x00ff;  //make it unsigned short value  
	  u2 = str2[j] & 0x00ff;  //make it unsigned short value

	  if (AOAUpper(str1[j]) == 1 && AOALower(str2[j]) == 1)
	    {
	     //upper and lower 
             if (u2-0x20 == u1)
	        retcode = 0; 
             else retcode = -1; 
	    }
	  else if (AOALower(str1[j]) == 1 && AOAUpper(str2[j]) == 1)
	    {
	     //lower and upper 
             if (u1-0x20 == u2)
	        retcode = 0; 
             else retcode = -1; 
	    }
	  else
	    {
	     //both upper or both lower or non alpha characters  
             if (u1 == u2)
	        retcode = 0; 
             else retcode = -1; 
	    }
          if (retcode != 0)
	    return retcode; 

        } //end of for loop
    } //end of mixed case 
  return retcode; 
}
//************************************************************************************
// compare two strings for full compare including case sensitive
//
// starting point idxstart1 for string 1, ending point idxstop1 for string 1
// starting point idxstart2 for string 2, ending point idxstop2 for string 2
//
//  return 0 if compares 100% 
//  compare strings only for a given length 
//  retrn -1 if it fails 
//  mixedcase = 0, compare as is 
//  mixedcase = 1, compare with mixed letters A-Z 0r a - z 
//************************************************************************************
int AOAProtected::AOAStrCompare(char* str1, char* str2, int idxstart1, int idxstop1,
                                int idxstart2, int idxstop2, int mixedcase )
{
  int retcode=0, j=0; 
  char ch = ' '; 
  unsigned short u1 = 0, u2 = 0; \
  int length1 = idxstop1 - idxstart1;
  int length2 = idxstop2 - idxstart2;
  int length = 0;

  // check to see if range of lengths is same size, if not there can be no match
  if (length1 != length2) retcode = -1;  
  else length = length1;  // in case lengths are same, then go compare them

  retcode = 0; 
  if (mixedcase == 0)    //compare as is  
    {
      for (j = 0 ; j < length; j++)
        {
          if (str1[j + idxstart1] == str2[j + idxstart2])
	    retcode = 0; 
          else retcode = -1; 
          if (retcode != 0)
	    return retcode; 
        }
    }

  else if (mixedcase == 1)    //s1 and s2 could be mixed case    
    {
      for (j = 0 ; j < length; j++)
        {
	  u1 = str1[j + idxstart1] & 0x00ff;  //make it unsigned short value  
	  u2 = str2[j + idxstart2] & 0x00ff;  //make it unsigned short value

	  if (AOAUpper(str1[j + idxstart1]) == 1 && AOALower(str2[j + idxstart2]) == 1)
	    {
	     //upper and lower 
             if (u2-0x20 == u1)
	        retcode = 0; 
             else retcode = -1; 
	    }
	  else if (AOALower(str1[j + idxstart1]) == 1 && AOAUpper(str2[j + idxstart2]) == 1)
	    {
	     //lower and upper 
             if (u1-0x20 == u2)
	        retcode = 0; 
             else retcode = -1; 
	    }
	  else
	    {
	     //both upper or both lower or non alpha characters  
             if (u1 == u2)
	        retcode = 0; 
             else retcode = -1; 
	    }
          if (retcode != 0)
	    return retcode; 

        } //end of for loop
    } //end of mixed case 
  return retcode; 
}

/***************************************************************************************************************
 * This function returns the first index occurence of the character c in the string str 
 * A value of -1 indicates that the character was not found in the string
 ***************************************************************************************************************/
  int AOAProtected::AOAindexOf(char* str, char c)         // ghf: added to mimic java method
{	
	int retVal = -1;
	int found = 0;
	int len = AOAStrLen(str);
	
	for (int ii = 0; ii < len; ii++) {
		if((str[ii] == c) && found != 1) 
			{ retVal = ii; found = 1; }	
		if (found == 1) break;
	}
	
	return retVal;
}
/***************************************************************************************************************
 * This function returns the substring substr resulting from string str starting at index until the end of str 
 ***************************************************************************************************************/
  char *  AOAProtected::AOAsubstring(char* str, char * substr, int index)         // ghf: added to mimic java method
{	
      int len = AOAStrLen(str);
      int cntr = 0;
      
      if (len > index)
	  for( int ii = index; ii < len; ii++)
	      {
		substr[cntr++] = str[ii];      
	      }
	  substr[cntr] = '\0';
	      
	  return  substr;
}
/***************************************************************************************************************
 * This function gets Text from the console 
 * The end delimiter for this is ESC
 * The user should press ESC key and then c return key at the end of thetext.
 ***************************************************************************************************************/
void AOAProtected::AOAGetText(char* str)
{	
	int i = 0, temp1,temp2;
	char a = 0x00;
	int charpos;
	while(a != 0x1B)
	{ 
	  a= AOAgetCharacter();
	  if(a == 0x08)
	  {
	   charpos = AOAgetCursor();
	   charpos--;
	   AOAprintCharacter(' ',charpos*2);
	   charpos--;
	   AOAsetCursor(charpos);
	   AOAprintCharacter(' ',charpos*2);
	   AOAsetCursor(charpos);
	   i--;
	  }
	  else if(a == 0x0d)
	  {
	   charpos = AOAgetCursor();
	   temp1 = charpos%80;
	   charpos=charpos+(80-temp1);
	   AOAsetCursor(charpos); 
	   str[i++] = '\n';
	  }
	  else
	  {
	  
	  str[i++] = a;
	  }
	}
	str[i-1]='\0';
}	
/**************************************************************
 * attach str2 at the end of str1
**************************************************************/
void AOAProtected::AOAStrAppend(char* str1, char* str2)
{
	int len;

	len = AOAStrLen(str1);
	//append the chars in str2 into str1, except '\0'
	
	for (int j = 0 ; str2[j] != '\0';j++)
	{
		str1[len+j] = str2[j];
	}
	str1[len+j]='\0';
}
/**************************************************
 * clear the specified area in screen
**************************************************/
void AOAProtected::AOAclearScreen(int sp, int ep)
{
  for (int i = sp; i < ep; i+=2)
  {
    AOAprintCharacter(' ',i);
  }
}
//------------------------------------------------------
// copies memory from source to destination 
//------------------------------------------------------
int AOAProtected::AOAMemCopy(char *dest, char *src, int length)
{	
 int i = 0; 
 for (i=0; i < length; i++)
   {
       dest[i] = src[i]; 
   }
 return 0; 
}; 
/*********************************************
 * print the text in multiple screens,
 * first page starting at base
*********************************************/
void AOAProtected::AOAMsPrintText(char* str, int base)
{
	int temp1;
	AOAclearScreen(320,3360);
	AOAsetCursor(base/2);
	for (int i = 0; str[i] != '\0'; i++)
	{
	  if(str[i] == '\n')
	 {
	   temp1 = base%160;
	   base=base+(160-temp1);
	   if (base >= 3200)
	   {
	   	base = 320;
		AOAprintString("press space to next page", 24, 3240);
	        AOAsetCursor(1644);
		while(AOAgetCharacter()!=0x20);
		AOAclearScreen(320,3360);
	   }
	  }
	  else if(str[i] == '\t' || str[i] == '\r')
	  {
	  }
	  else
	  {
	    AOAprintCharacter(str[i],base);
	  base +=2;
 	  if (base >= 3200)
	   {
	   	base = 320;
		AOAprintString("press space to next page", 24, 3240);
		AOAsetCursor(1644);
		while(AOAgetCharacter()!=0x20);
		AOAclearScreen(320, 3360);
	   }

	  }
	}
	AOAsetCursor(base/2);
}
/*********************************************
 * print the text in multiple screens
*********************************************/
void AOAProtected::AOAMsPrintText(char* str)
{	
	int charpos, temp1;
	charpos = AOAgetCursor();
	int base = charpos*2;
	 
 	for (int i = 0; str[i] != '\0'; i++)
	{
	  if(str[i] == '\n')
	  {
	    temp1 = base%160;
	    base=base+(160-temp1);
	    if (base >= 3200)
	    {
	   	base = 320;
		AOAprintString("press space to next page", 24, 3240);
		AOAsetCursor(1644);
		while(AOAgetCharacter()!=0x20);
		AOAclearScreen(320,3360);
	    }
	  }
	  else if(str[i] == '\t' || str[i] == '\r')
	  {
	  }
	  else
	  {
	    AOAprintCharacter(str[i],base);
	    base +=2;
 	    if (base >= 3200)
	    {
	   	base = 320;
		AOAprintString("press space to next page", 24, 3240);
		AOAsetCursor(1644);
		while(AOAgetCharacter()!=0x20);
		AOAclearScreen(320,3360);
	    }
	  }
	}
	AOAsetCursor(base/2);
}	
//----------------------------------------------------
int AOAProtected::AOAShortDelay(long Delay)
{

	return CShortDelay32(Delay);

}

/***********************************************
 * find str2 in str1, and return the start 
 * posision. If not found, return -1
***********************************************/
int AOAProtected::AOAStrMatch(int start, char* str1, char* str2)
{
	bool match = 0;
	for (int i=start; str1[i]!='\0';i++)
	{
	    for (int j=0; str2[j] != '\0'; j++)
	    {
	    	if (str2[j] == str1[i+j])
		  match = 1;
		else
		{
		  match = 0;
		  break;
		}
	    }
	    if (match)
	    {
	    	return i;
	    }
	}
	return -1;
}
//----------------------------------------------------------------------
int AOAProtected::AOAgetGDTEntry(long* desch, long* descl, int GDTIndex)
{
	return CgetGDTEntry32(desch, descl, GDTIndex); 
}
//-----------------------------------------------------------------------
int AOAProtected::AOAsetGDTEntry(long* desch, long* descl, int GDTIndex)
{
	return CsetGDTEntry32(desch, descl, GDTIndex); 
}
//-----------------------------------------------------------------------
int AOAProtected::AOAgetIDTEntry(long* desch, long* descl, int IDTIndex)
{
	return CgetIDTEntry32(desch, descl, IDTIndex); 
}
//-----------------------------------------------------------------------
int AOAProtected::AOAsetIDTEntry(long* desch, long* descl, int IDTIndex)
{
	return CsetIDTEntry32(desch, descl, IDTIndex); 
}
//-----------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------
void AOAProtected::AOAsetTimerPeriod(int value)
{
	unsigned short n = 0xFFFF;
	n = n / value;
	AOAprintHex(n, Line5);
        unsigned char ln = (n & 0xFF);  //lower byte 
	unsigned char hn = ((n>>8) & 0xFF); //upper byte 
	_asm
	{
		cli	               //disable interrupts 	
		push	eax
		push	edx

		xor	edx,edx
		xor	eax,eax

		mov	dx, 43h        //port for control register in the timer 
		mov	al, 3ch        //value in the register 0011 1100 
		out	dx, al         // set the control register 
		mov	dx, 40h        //store the register value 2 bytes 
		mov	al, ln         //code from the Web www.inversereality.org/tutorials/
		out	dx, al
		mov	al, hn
		out 	dx, al

		pop	edx
		pop	eax
		sti                //enable interrupts 
	}
	
}
//-----------------------------------------------------------------------------------------------------
//  Print Trace Functions 
//   Initialize the trace 
//-----------------------------------------------------------------------------------------------------
void AOAProtected::AOAInitTrace(int lineno)
  {
   LineNumber = lineno;  //Line to be printed 
   PosCount = LineNumber*160; 
   return; 
  }

//-----------------------------------------------------------------------------------------------------
//   Clear the trace 
//-----------------------------------------------------------------------------------------------------
void AOAProtected::AOAClearTrace()
  {
   int i; 
   
   for (i = 0; i < PosCount/2; i++) 
     {
      AOAprintCharacter(' ', LineNumber*160+i*2); 
     }
   PosCount = LineNumber*160; 
   
   return; 
  }
//-----------------------------------------------------------------------------------------------------
//   Print a character in the trace line  
//-----------------------------------------------------------------------------------------------------
void AOAProtected::AOAPrintCharacterTrace(char c)
  {
      AOAprintCharacter(c, PosCount); 
         PosCount = PosCount + 2; //next position  
   return; 
  }
//-----------------------------------------------------------------------------------------------------
//This functions sets the descriptor in the GDT for defining the selector for Interrupt Service Routine
//This also sets up the IDT entry for the Interrupt Service Routine
//This takes the GET Entry the IDT Entry and the Function address of the ISR as paramaters
//-----------------------------------------------------------------------------------------------------
int AOAProtected::AOAsetISR(long GDTDescNo, long IDTDescNo, unsigned long FunctionAddress)
{
	long GDTIndex = GDTDescNo;
	// Tow variables to get the GDT and IDT Descriptors
	long deschg, desclg;	
	// Temporary variables 
	unsigned long tem = 0x00000000;
	unsigned long Selector;	
	
	// Get the GDT Entry from the GDT Table
	AOAgetGDTEntry(&deschg,&desclg,GDTIndex);
	// Clear the higher and lower bytes of the base address in the descriptor 
	deschg = deschg & 0x00000000;
	desclg = desclg & 0x00F0FF00;
	tem = 0x00000000;
	// 0x00110000 is the base for the application segment 
	tem = tem |  0x00110000;
	// Assigne the base address and the limit in the corresponding locations of the descriptor 
	deschg = deschg | ((tem << 16 ) & 0xFFFF0000);
	deschg = deschg | 0x0000FFFF;
	desclg = desclg | (tem & 0xFF000000);
	desclg = desclg | 0x000F0000;
	desclg = desclg | ((tem>>16) & 0x000000FF);	
	// Assign the G bit in the descriptor to make it address up to 4 GB
	desclg = desclg | 0x00800000;	
	// Set eh GDT Entry int the GDT Table
	AOAsetGDTEntry(&deschg,&desclg,GDTIndex);	
	
	// Compute the selector from the GDT Index number
	Selector = GDTIndex * 8;
	Selector = (Selector << 16 ) & 0xFFFF0000;
	tem = 0x00000000;
	tem = tem | FunctionAddress;

	// Get the IDT Entry 
	AOAgetIDTEntry(&deschg,&desclg, IDTDescNo);	

	// Set the Function addres in the offset of the descriptor
	desclg = desclg & 0x0000FFFF;
	desclg = desclg | (tem & 0xFFFF0000);	
	deschg = deschg & 0xFFFF0000;
	deschg = deschg | (tem & 0x0000FFFF);

	// Set the selector int he descriptor
	deschg = deschg | Selector;

	// Set the IDT Descriptor
	AOAsetIDTEntry(&deschg,&desclg, IDTDescNo);
	return 0;
};
//****************************************************************************************
//This will convert a negative number to a positive number using 2s complement 
// invert and add 1 
//****************************************************************************************
unsigned int AOAProtected::AOAconvertToPositive(int number)
{
    unsigned int value  = 0; 
    int mask = 0; 

    value = ~number; 
    value = value + 1;   
    return value; 
};
//****************************************************************************************
// This will convert 2 byte character array into unsigned short value 
//  and return the value 
//  This is used to convert port numbers in char form to short values 
//    This can also be used to convert IP addresses in 2 char form to a short value 
//    AOAprintHex causes some problems printing short values 
//****************************************************************************************
unsigned short AOAProtected::AOAconvertCharToShort(char *twochar)
{
    /*
    unsigned short sum = (twochar[0] & 0xff);
    sum <<= 8;
    sum += (twochar[1] & 0xff);

    return sum; 
    */
    
    unsigned short value  = 0; 
    unsigned short value1 = 0; 

    value = 0; 
    value = twochar[0] & 0xff;  
    value = (value << 8);
    value1 = 0; 
    value1 = twochar[1] & 0xff; 
    value = value |  value1;  
    return value; 
};
//****************************************************************************************
// This will convert 4 byte character array into unsigned long value 
//  and return the value 
//****************************************************************************************
/*
unsigned long AOAProtected::AOAconvertChar4ToLong(char *fourchar)
{
    unsigned long sum = (fourchar[0] & 0xff);

    for( int i = 1; i < 4; i++)
    {
            sum <<= 8;
            sum += (fourchar[i] & 0xff);
    }

    return sum; 
};
*/
//----------------------------------------------------------------------
// converts decimal character digits to int value 
//----------------------------------------------------------------------
unsigned int AOAProtected::AOAconvertDecimalCharsToInt(char *str)
{
    unsigned int sum = 0;
    unsigned char c1; 
    int i=0; 
    int len=0; 
    int n=0; 

    len = AOAStrLen(str);  //number of decimal characters 
    n = len-1; 
    sum = 0; 

    for (i=0; i < len; i++) 
    {
        c1 = str[i];      //get a decimal character
        if (ValidDecimalDigit(c1))
        {
            c1 = c1 - 0x30;   //remove decimal digit character code 
            sum = sum + c1 * AOAPower(10, n); 
            n = n - 1;
        }
        else return -1;  //invalid digit 
    }

    return sum; 
};
//-----------------------------------------------------
// checks a valid decimal digit in character form 
//-----------------------------------------------------
bool AOAProtected::ValidDecimalDigit(char c1)
{
    if (c1 >= 0x30 && c1 <= 0x39)
        return true; 
    else return false; 
}
//---------------------------------------------------------------------------
// converts a long value to 8 hex characters 
//  and store it is str string 
//---------------------------------------------------------------------------
void AOAProtected::AOAconvertLongTo8HexChars(unsigned long value, char *str)
{
    unsigned long sum=0;
    unsigned long c1; 
    unsigned long mask; 
    int i=0; 

    sum = value; 
    mask = 0xf0000000;  //to select 4 bits  
    for (i=0; i<8; i++) 
    {
      c1 = mask & sum; //extract 4 bits only 
      c1 = c1 >> (32 - (i+1)*4); //shift right to get the value in 4 bits, 28, 24, 20, 16, 12, 8, 4, 0 
      c1 = 0x0000000f & c1;      //mask all 28 bits in c1 
      if (c1 < 10)
          c1= c1+0x30;
      else c1 = c1+0x37; 
      str[i]= c1; 
      mask = mask >> 4;  //shift the mask to right to select next digit  
    }
};
//-----------------------------------------------------
unsigned long AOAProtected::AOAconvertChar4ToLong(char *fourchar)
{
    unsigned long sum = 0;
    unsigned char c1; 
    int i=0; 
    //AOAPrintText(fourchar, Line18+20); 
    //AOAprintHex(AOAStrLen(fourchar), Line18+60); 
    sum = fourchar[3] - 0x30;  //first digit from right 
    i=2; 
    do 
    {
      c1 = fourchar[i] - 0x30; 
      if (c1 != 0) 
        sum = sum + (AOAPower(10, c1));  
      //AOAprintHex(sum, Line17+20*i+6); 
      i--; 
    }
    while (i>=0);

    //AOAprintHex(sum, Line18+80); 
    return sum; 
};
//-----------------------------------------------------------
//convert char decimal digits to int
//-----------------------------------------------------------
/*unsigned int AOAProtected::AOAconvertCharsToInt(char *s1, int len)
{
    unsigned int sum = 0;
    unsigned char c1; 
    int i=0; 
    int j=0; 

   sum = s1[len -1] - 0x30;  //first digit from right 
   //j = len -1; 
    for (i=0; i<len; i++) 
    {
      c1 = s1[i] - 0x30; 
      sum = sum + c1*(AOAPower(10, (len-i-1)));  
    }
    return sum; 
};*/
//****************************************************************************************
// This will convert 4 byte int value to 10 digit char string  
//****************************************************************************************
void AOAProtected::AOAconvertBinaryToDecimal(unsigned int value, char *decimaldigits)
{
    unsigned int value1 = 0; 
    int i=0; 

    value1 = value; 
    for (i=0; i < 10; i++) 
      {
          decimaldigits[9-i] = (value1 % 10)+0x30; 
          value1 = value1 / 10;  
      }

    decimaldigits[10]='\0'; 

};

//****************************************************************************************
// This will convert Decimal number value to integer value  
//****************************************************************************************
int AOAProtected::AOAconvertDecimalToInt(char *decimaldigits)
{
    unsigned int value1 = 0; 
    int i=0; 
    int size = 0;
    int sum = 0;
    unsigned char c1 = 0x00;
    size = AOAStrLen(decimaldigits);
    value1 = 0; 
    for (i=0; i < size; i++) 
      {
          c1 = decimaldigits[i] - 0x30; 
          c1 =c1 * AOAPower(10, (size - i -1));  
          sum = sum + c1;
      }

    return sum; 

};
//****************************************************************************************
// This will convert 4 byte int value to 10 digit char string  
//  It will truncate all leading ZEROs and return the exact no of decimal digits 
//****************************************************************************************
int AOAProtected::AOAconvertBinaryToDecimal(char *decimaldigits, int value)
{
    unsigned int value1 = 0; 
    int i=0; 
    int nodigits = 0; 

    value1 = value; 
    for (i=0; i < 10; i++) 
      {
          decimaldigits[9-i] = (value1 % 10) + 0x30; 
          value1 = value1 / 10;  
          if (value1 == 0)
          {
              break; 
          }
      }
    decimaldigits[10]='\0';  //Now, we have 10 decimal digits in the variable 
    return (9-i); //return the starting index of the valid decimal digits  
};

//****************************************************************************************
// This will convert 4 byte int value into four hex characters  
//****************************************************************************************
int AOAProtected::AOAconvertIntToHexChars(char *fourchar, int value)
{
    unsigned int value1 = 0; 

    value1 = value & 0xffffffff; 
    fourchar[0] = (char)value1; 
    value1 = value1 >> 8; 
    fourchar[1] = (char)value1; 
    value1 = value1 >> 8; 
    fourchar[2] = (char)value1; 
    value1 = value1 >> 8; 
    fourchar[3] = (char)value1; 
    return 0; 
};

//****************************************************************************************
// This will convert 4 byte hex characters into Int value   
//****************************************************************************************
int AOAProtected::AOAconvertHexCharsToInt(char *fourchar)
{
    unsigned int value1 = 0; 
    unsigned int mask1 = 0; 
    unsigned char ch; 

    ch = fourchar[3]; 
    value1 = ch; 
    value1 = value1 << 24;        //first hex char, most significant   

    ch = fourchar[2]; 
    mask1 = ch; 
    mask1 = mask1 << 16;  
    value1 = value1 + mask1;      //second hex char  

    ch = fourchar[1]; 
    mask1 = ch; 
    mask1 = mask1 << 8;  
    value1 = value1 + mask1;      //third hex char  

    ch = fourchar[0]; 
    mask1 = ch; 
    value1 = value1 + mask1;      //fourth hex char, least significant 

    return value1; 
};

//****************************************************************************************
// This will convert 2 byte short value into two characters  
//****************************************************************************************
int AOAProtected::AOAconvertShortToChar(char *twochar, unsigned short value)
{
    unsigned short value1 = 0; 

    value1 = value & 0x0ff00; 
    value1 = value1 >> 8; 
    twochar[0] = (char)value1; 
    twochar[1] = (char)value & 0x00ff; 
    return 0; 
};

//-----------------------------------------------------------------------------------------------------
//  mask runregister
//  This function is used in the scheduler
//  fn = 1 (OR) schedule the pid task
//  fn = 0 (AND) unschedule the pid task
//  run register bit = 0 means disable 
//  run register bit = 1 means enable
//-----------------------------------------------------------------------------------------------------
int AOAProtected::AOAMaskRunRegister(int pid, int fn)
  {
   int mask=0;
   if(pid == RCV_PID && fn == 1)
   {
	mask = 4;
	RunRegister = RunRegister | mask;
   }
   else if(pid == HTTP_PID && fn == 1)
   {
	mask = 2;
	RunRegister = RunRegister | mask;
   }
   else if(pid == INT_PID && fn == 1)
   {
	mask = 1;
	RunRegister = RunRegister | mask;
   }
   else if(pid == RCV_PID && fn == 0)
   {
	mask = 0x3;
	RunRegister = RunRegister & mask;
   }
   else if(pid == HTTP_PID && fn == 0)
   {
	mask = 0x5;
	RunRegister = RunRegister & mask;
   }
   else if(pid == INT_PID && fn == 0)
   {
	mask = 0x6;
	RunRegister = RunRegister & mask;
   }
   else
   {
	AOAPrintText("Error: MaskRunRegister invalid pid or function code", Line24);
	return -1;
   }
   return 0;
  };

//-------------------------------------------------------
// ghf: check to see if character is a digit 
// ------------------------------------------------------
int AOAProtected::AOAisDigit(char c)
{
   int retVal = 0;
   if( c >= 0x30 && c <= 0x39) retVal = 1;
   return retVal;
}
//-------------------------------------------------------
// ghf: check to see if character is a  alpha
// ------------------------------------------------------
int AOAProtected::AOAisAlpha(char c)
{
   int retVal = 0;
   if(AOAisLower(c) || AOAisUpper(c)) retVal = 1;
   return retVal;
}
//-------------------------------------------------------
// ghf: check to see if character is a  lower case
// ------------------------------------------------------
int AOAProtected::AOAisLower(char c)
{
   int retVal = 0;
   if( c >= 0x61 && c <= 0x7A) retVal = 1;
   return retVal;
}
//-------------------------------------------------------
// ghf: check to see if character is a  upper case
// ------------------------------------------------------
int AOAProtected::AOAisUpper(char c)
{
   int retVal = 0;
   if( c >= 0x41 && c <= 0x5A) retVal = 1;
   return retVal;
}

//Niakam Kazemi: Added the following methods 04/23/09
void* AOAProtected::memcpy(void *dst, const void* src, int n)
{
	unsigned char* d = (unsigned char*) dst;
	const unsigned char* s = (const unsigned char*) src;

	while (n > 0) 
	{
		*d++ = *s++;
		--n;
	}

	return dst;
}

void* AOAProtected::memset(void* s, int c, int n)
{
	unsigned char* p = (unsigned char*) s;

	while (n > 0) 
	{
		*p++ = (unsigned char) c;
		--n;
	}

	return s;
};
unsigned long AOAProtected::reverseLongByteOrder (unsigned long N)
{
    unsigned char B0, B1, B2, B3;
    B0 = (N & 0x000000FF) >>  0 ;
    B1 = (N & 0x0000FF00) >>  8 ;
    B2 = (N & 0x00FF0000) >> 16 ;
    B3 = (N & 0xFF000000) >> 24 ;
    return ((B0 << 24) | (B1 << 16) | (B2 << 8) | (B3 << 0));
 };
unsigned short AOAProtected::reverseShortByteOrder (unsigned short N)
{
    unsigned char B0, B1;
    B0 = (N & 0x00FF) >>  0 ;
    B1 = (N & 0xFF00) >>  8 ;
    return ((B0 << 8) | (B1 << 0));
};
char AOAProtected::CharPairToCharHex(char *ptr)
{
    char t1  = ' ';
	char c1 = 0;
	char c2 = 0; 
	
	if( ptr[0] >= '0'&& ptr[0] <= '9')
		c1 = ptr[0]-0x30;
	else
	if( ptr[0] >= 'A' && ptr[0] <= 'F')
		c1 = ptr[0] - 0x37;
	else
	if( ptr[0] >= 'a' && ptr[0] <= 'f')
		c1 = ptr[0] - 0x57;
	
	c1 = c1 & 0x0f;  //only 4 bits captured 
	c1 = c1 << 4;       //shift left 4 bits 

	if( ptr[1] >= '0' && ptr[1] <= '9')
		c2 = ptr[1]-0x30;
	else
	if(ptr[1] >= 'A' && ptr[1] <= 'F')
		c2 = ptr[1] - 0x37;
	else
        if( ptr[1] >= 'a' && ptr[1] <= 'f')
		c2 = ptr[1] - 0x57;

	c2 = c2 & 0x0f;  //only 4 bits captured 
	c1 = c1 | c2; 

	t1 = c1 & 0x0ff;

    return t1;
};
bool AOAProtected::isSame(char* s1, char* s2, int length)
{
    bool areSame = true;
    for (int i = 0; i < length; i++)
        if (s1[i] != s2[i])
        {
            areSame = false;
            break;
        }
    return areSame;
}





