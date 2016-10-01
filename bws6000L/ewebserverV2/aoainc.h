/*
 * aoainc.h 
 *
 * Header file contains the function prototype for 
 * the assembly module.
 *
 * @AOA project
 * add include statements in this file 
 * invoke  h2inc aoainc.h 
 * this will generate a new aoainc.inc 
 * but change all sword to dword in aoainc.inc file 
 * now this file is ready to be included 
 */

// data segment selector, from prcycle.lst refer GDT Table for details of these selectors
// shared memory between applications and aoa 
// 
//--------------------------------------------
#define S_Timer		0x00 //Timer Value is 4 bytes next offset should be 0x04   
#define S_SectorNo	0x04 //Sector Number is 4 bytes the next offset should be 0x08
//--------------------------------------------

// Base of Shared memory between aoa and application
//--------------------------------------------
#define S_Base		0x8600

//--------------------------------------------
#define GlobalDataSel	0x+b8 
#define RDataSel	0x18
#define	StackSel	0xC
#define MEMDataSel      0xC0 // This is the Zero selector in GDT for addressing Real mode memory such as 8600
			     // This is used to address Shared memory in protected mode G4Data_Sel

// data offset in GlobalDataSeg
#define StoreCharOffset	11 
#define StoreDecOffset	12


//  prototype for the assembly module
void	printstrasm32(char*,int,int);
int	getstrasm32(char*);
void	setcursorasm32(int);
void	printcharasm32(char,int);
void	printhexasm32(int,int);
int	readfloppyasm32(char*,long);
int	writefloppyasm32(char*,long);
long	mallocasm32(long*);
int 	freeasm32(int);
long	getTaskPtrasm32();
int	fetchasm32(long*,char*,long*);
int	getcursorasm32();
char	getcharasm32();
int	gettimerasm32();
int	getGDTEntryasm32(long*, long*,int);
int	setGDTEntryasm32(long*, long*,int);
int	getdecasm32();
void	cleanscreenasm32();
void	scrollasm32();
int	readfloppyasm32(char *, long);  //read sectors from floppy into buffer. 
	//first parameter is starting sector, second is the address of buffer
