//usbbootfred.cpp file 
// used for usb boot process
// Written by Fred Ackers and modified by Dr.Karne
//Towson University Copyright 2008
// fsmgnt.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include <iostream>
#include <windows.h>
#include <atlbase.h>
#include <atlConv.h>
#include "fatfs.h" 

using namespace std; 

/*LPSTR ConvertLPTSTRToLPSTR (LPTSTR pszString)
{
	USES_CONVERSION; 
	
	LPSTR pszCharString = new char  [_tcslen (pszString) + 1];
	memset (pszCharString, 0x00, _tcslen (pszString) + 1);
	strcpy (pszCharString, T2A (pszString));
	// Remember to delete it
	return pszCharString;
}
*/

int matoi(char* str,int nLen)
{
	int nTotal  =  0;
	for (int i = 0; i <= nLen; i++)
	{
		if (str[i]==' ')
			return nTotal;
		nTotal+= (str[i]*27);
	}
	return nTotal;
}
//------------------------------------------------------------------------------
// read all sectors from the USB 
//  and return the buffer pointer 
// usb device id is read in this routine and passed by reference
//------------------------------------------------------------------------------
char * ReadSectors(int drive, DWORD startinglogicalsector, int numberofsectors, char *ud)
{
USES_CONVERSION;
// All msdos data structures must be packed on a 1 byte boundary
#pragma pack (1)
struct
{
  DWORD StartingSector ;
  WORD NumberOfSectors ;
  DWORD pBuffer;
}ControlBlock;
#pragma pack ()

#pragma pack (1)
typedef struct _DIOC_REGISTERS
{
    DWORD reg_EBX;
    DWORD reg_EDX;
    DWORD reg_ECX;
    DWORD reg_EAX;
    DWORD reg_EDI;
    DWORD reg_ESI;
    DWORD reg_Flags;
} DIOC_REGISTERS ;
#pragma pack ()

char* buffer = (char*)malloc (512*numberofsectors);
HANDLE hDevice ;
DIOC_REGISTERS reg ;
BOOL  fResult ;
DWORD cb ;

// Creating handle to vwin32.vxd (win 9x)
hDevice =  CreateFile ( A2T("\\\\.\\vwin32"),
    0,
    0,
    NULL,
    0,
    FILE_FLAG_DELETE_ON_CLOSE,
    NULL );

if ( hDevice == INVALID_HANDLE_VALUE ) 
{
  // win NT/2K/XP code
  HANDLE hDevice;
  DWORD bytesread;

  char _devicename[]  = "\\\\.\\F:"; //watch the syntax RKK
  
  //RKK
  printf("Enter the USB Drive Letter: ");
  scanf("%c", ud);
  _devicename[4] = ud[0];

  //_devicename[4] += drive;

  // Creating a handle to disk drive using CreateFile () function ..
  hDevice = CreateFile(A2T(_devicename),
            GENERIC_READ, FILE_SHARE_READ | FILE_SHARE_WRITE,
            NULL, OPEN_EXISTING, 0, NULL);

    if (hDevice == INVALID_HANDLE_VALUE)
	{
        return NULL;
	}
	else printf("hDevice in reading: %d\n", hDevice); 

  // Setting the pointer to point to the start of the sector we want to read ..
  SetFilePointer (hDevice, (startinglogicalsector*512), NULL, FILE_BEGIN);

  if (!ReadFile (hDevice, buffer, 512*numberofsectors, &bytesread, NULL) )
     return NULL;
}
else
{
  // code for win 95/98
  ControlBlock.StartingSector = (DWORD)startinglogicalsector;
  ControlBlock.NumberOfSectors = (DWORD)numberofsectors ;
  ControlBlock.pBuffer = (DWORD)buffer ;

  //-----------------------------------------------------------
  // SI contains read/write mode flags
  // SI=0h for read and SI=1h for write
  // CX must be equal to ffffh for
  // int 21h's 7305h extention
  // DS:BX -> base addr of the
  // control block structure
  // DL must contain the drive number
  // (01h=A:, 02h=B: etc)
  //-----------------------------------------------------------

  reg.reg_ESI = 0x00 ;
  reg.reg_ECX = -1 ;
  reg.reg_EBX = (DWORD)(&ControlBlock);
  reg.reg_EDX = drive+1;
  reg.reg_EAX = 0x7305 ;

  //  6 == VWIN32_DIOC_DOS_DRIVEINFO
  fResult = DeviceIoControl ( hDevice,
    6,
    &(reg),
    sizeof (reg),
    &(reg),
    sizeof (reg),
    &cb,
    0);

   if (!fResult || (reg.reg_Flags & 0x0001)) return NULL;
}

CloseHandle(hDevice);
return buffer;
}
//------------------------------------------------------------------------------
// write sectors, usb device id is passed to it 
//  and returns the no of bytes written to a file  
//------------------------------------------------------------------------------
int WriteSectors(int drive, DWORD startinglogicalsector, int numberofsectors, 
				 char *buffer, char ud)
{
int bwritten = 0; 
USES_CONVERSION;
// All msdos data structures must be packed on a 1 byte boundary
#pragma pack (1)
struct
{
  DWORD StartingSector ;
  WORD NumberOfSectors ;
  DWORD pBuffer;
}ControlBlock;
#pragma pack ()

#pragma pack (1)
typedef struct _DIOC_REGISTERS
{
    DWORD reg_EBX;
    DWORD reg_EDX;
    DWORD reg_ECX;
    DWORD reg_EAX;
    DWORD reg_EDI;
    DWORD reg_ESI;
    DWORD reg_Flags;
} DIOC_REGISTERS ;
#pragma pack ()

//char* buffer = (char*)malloc (512*numberofsectors);
HANDLE hDevice ;
DIOC_REGISTERS reg ;
BOOL  fResult ;
DWORD cb ;

// Creating handle to vwin32.vxd (win 9x)
hDevice =  CreateFile ( A2T("\\\\.\\vwin32"),
    0,
    0,
    NULL,
    0,
    FILE_FLAG_DELETE_ON_CLOSE,
    NULL );

if ( hDevice == INVALID_HANDLE_VALUE ) 
{
  // win NT/2K/XP code
  HANDLE hDevice;
  DWORD byteswritten;

  char _devicename[]  = "\\\\.\\F:";

  //char _devicename[]  = "\\\\.\\F:\\\\home"; 
  //char _devicename[] = "c:\\\\home\\\\test";
  
  //RKK
   _devicename[4] = ud;

   // Creating a handle to disk drive using CreateFile () function ..
  hDevice = CreateFile(A2T(_devicename),
            GENERIC_WRITE,                      //access
			FILE_SHARE_READ | FILE_SHARE_WRITE, //dwShared Mode 
            NULL,                               //pointer to security descriptor
			OPEN_EXISTING,                     //how to create
			FILE_ATTRIBUTE_SYSTEM | FILE_ATTRIBUTE_ARCHIVE, 
			        //file attributes               
			NULL);                             //handle to file with attr to copy

    if (hDevice == INVALID_HANDLE_VALUE)
	{
		printf("CreateFile failed in WriteSectors: %d\n ", hDevice);
        return -1;
	}
	else printf("hDevice in WriteSectors is: %d\n",hDevice); 

  // Setting the pointer to point to the start of the sector we want to read ..
  SetFilePointer (hDevice, (startinglogicalsector*512), NULL, FILE_BEGIN);

  if (!WriteFile (hDevice, buffer, 512*numberofsectors, &byteswritten, NULL) )
  {
     printf("WriteFile failed in WriteSectors"); 
     return -2;
  }
   
  bwritten = byteswritten; 
}
else
{
  //RKK NOT TESTED 
  // code for win 95/98
  ControlBlock.StartingSector = (DWORD)startinglogicalsector;
  ControlBlock.NumberOfSectors = (DWORD)numberofsectors ;
  ControlBlock.pBuffer = (DWORD)buffer ;

  //-----------------------------------------------------------
  // SI contains read/write mode flags
  // SI=0h for read and SI=1h for write
  // CX must be equal to ffffh for
  // int 21h's 7305h extention
  // DS:BX -> base addr of the
  // control block structure
  // DL must contain the drive number
  // (01h=A:, 02h=B: etc)
  //-----------------------------------------------------------

  reg.reg_ESI = 0x00 ;
  reg.reg_ECX = -1 ;
  reg.reg_EBX = (DWORD)(&ControlBlock);
  reg.reg_EDX = drive+1;
  reg.reg_EAX = 0x7305 ;

  //  6 == VWIN32_DIOC_DOS_DRIVEINFO
  fResult = DeviceIoControl ( hDevice,
    6,
    &(reg),
    sizeof (reg),
    &(reg),
    sizeof (reg),
    &cb,
    0);

   if (!fResult || (reg.reg_Flags & 0x0001)) return NULL;
}

CloseHandle(hDevice);
return bwritten;
}

//------------------------------------------------------------------------------
//MAIN 
//It is a C code, NO C++ classes here 
//------------------------------------------------------------------------------
int main(int argc,  char* argv[])
{
	int SECTORS_TO_READ = 120000; //no of sectors to read RKK (128MB)
	
	char c1; 
	int i = 0; 
	char wbuffer[512]; 
	int wcount = 0;
	char udrive[1] = {'F'};   //initialized to F 
	char* pSectors = ReadSectors(6,0,SECTORS_TO_READ, &udrive[0]);
	
	for (i=0; i < 512; i++) 
		wbuffer[i]='M'; 

	if (pSectors != NULL)
	{
		HANDLE hFile = CreateFile(L"c:\\home\\Sector.bin",GENERIC_WRITE,FILE_SHARE_WRITE,NULL,OPEN_ALWAYS,NULL,NULL);
		unsigned long dwBytesWritten = 0;
		
		BS_BPB_FAT16 fat;
		//for (unsigned long nSecNum = 0; nSecNum < SECTORS_TO_READ; nSecNum++)
		//{
			if (WriteFile(hFile,(void*)pSectors,512*SECTORS_TO_READ,&dwBytesWritten,NULL)==TRUE)
			{
			}
		//		continue;
			//else break;
		//}
		printf("No of Bytes Written:  %d\n ", dwBytesWritten); 

		for (i=0; i<dwBytesWritten; i++) 
		{ 
	      //RKK The signature TDOSC2008T is placed in prcycle.asm at DemoStack1Seg 
		  //  This address is 0xc80 from the start address of prcycle.exe file 
		  // You can check the 0xc80 value in the prcycle.map file 
	      // Starting address of the USB is not included here, usually it is 1 sector
		  if (pSectors[i]    == 'T' && pSectors[i+1]  == 'D' && pSectors[i+2] == 'O' &&
			  pSectors[i+3]  == 'S' && pSectors[i+4] == 'C' && pSectors[i+5] == '2' &&
			  pSectors[i+6]  == '0' && pSectors[i+7] == '0' && pSectors[i+8] == '8' &&
			  pSectors[i+9]  == 'T') 
		  {
			  printf("The prcycle.exe start address is: %x\n", i-0xc80); 
			  printf("The prcycle.exe starting sector no: %x\n", (i-0xc80)/512); 
              printf("The test.exe starting sector no: %x\n", (i-0xc80)/512 + 0x40); 
		  }

		}
		CloseHandle(hFile);

        int d1 = 0; 
		printf("The USB Drive Used to write: %c \n",udrive[0]); 
        //wcount = WriteSectors (6, 1, 1, wbuffer, udrive[0]); 
		printf("\nThe no of bytes written: %d", wcount); 
		scanf("%d", &d1); 
       
		
		return 0;
		//------------------------------------------------------------------------------
		// The following code is not USED
		//------------------------------------------------------------------------------
		/*
		CFatFS fsfat;
		unsigned long nDskSz;
		fsfat.CreateFileSystem16(fat);
		unsigned long lCluster = fsfat.FirstSectorofCluster(6209,fat);
		unsigned long dwBytesRead = 0;
		hFile = CreateFile(L"F:\\Sector.bin",GENERIC_READ,FILE_SHARE_READ,NULL,OPEN_ALWAYS,NULL,NULL);
		memset(&fat,0,sizeof(fat));
		ReadFile(hFile,(void*)&fat,sizeof(fat),&dwBytesRead,NULL);
		char ch;
		for(unsigned long n = 0; n < ((fat.bpb.BPB_ResvdSecCnt + (fat.bpb.BPB_NumFATs * fat.bpb.BPB_FATSz16))* fat.bpb.BPB_BytesPerSec)-sizeof(fat); n++)
			ReadFile(hFile,(void*)&ch,1,&dwBytesRead,NULL);
		FAT_DIR_ENTRY dir;
		dir.DIR_Name[0]=0xFF;
		HANDLE hFileDir = CreateFile(L"F:\\dir.bin",GENERIC_WRITE,FILE_SHARE_WRITE,NULL,OPEN_ALWAYS,NULL,NULL);
		while (dir.DIR_Name[0] != 0x00)
		for (unsigned long n=0; n < fat.bpb.BPB_RootEntCnt; n++)
		{
			if (ReadFile(hFile,(void*)&dir,sizeof(dir),&dwBytesRead,NULL)==TRUE)
				WriteFile(hFileDir,(void*)&dir,sizeof(dir),&dwBytesWritten,NULL);
		}
		unsigned long nPos = (lCluster*fat.bpb.BPB_BytesPerSec) - (fat.bpb.BPB_RootEntCnt*sizeof(dir)) - (((fat.bpb.BPB_ResvdSecCnt + (fat.bpb.BPB_NumFATs * fat.bpb.BPB_FATSz16))* fat.bpb.BPB_BytesPerSec))-sizeof(fat);
		for (unsigned long n=0; n < nPos; n++)
		{
			if (ReadFile(hFile,(void*)&ch,sizeof(ch),&dwBytesRead,NULL)==TRUE)
				continue;
		}
		dir.DIR_Name[0]=0xFF;
		while (dir.DIR_Name[0] != 0x00)
		{
			if (ReadFile(hFile,(void*)&dir,sizeof(dir),&dwBytesRead,NULL)==TRUE)
				WriteFile(hFileDir,(void*)&dir,sizeof(dir),&dwBytesWritten,NULL);
		}
		CloseHandle(hFileDir);
		CloseHandle(hFile);
		/*printf("Bps %d\n",fat.bpb.BPB_BytesPerSec);
		printf("fatsz16 %d\n",fat.bpb.BPB_FATSz16);
		printf("hiddensec %d\n",fat.bpb.BPB_HiddSec);
		printf("media %d\n",fat.bpb.BPB_Media);
		printf("numfats %d\n",fat.bpb.BPB_NumFATs);
		printf("numheads %d\n",fat.bpb.BPB_NumHeads);
		printf("resvdsecdnt %d\n",fat.bpb.BPB_ResvdSecCnt);
		printf("rootentcnt %d\n",fat.bpb.BPB_RootEntCnt);
		printf("secperclus %d\n",fat.bpb.BPB_SecPerClus);
		printf("secpertrk %d\n",fat.bpb.BPB_SecPerTrk);
		printf("totsec16 %d\n",fat.bpb.BPB_TotSec16);
		printf("totsec32 %d\n",fat.bpb.BPB_TotSec32);
		printf("drvnum %d\n",fat.bpb.BS_DrvNum);
		printf("filsystype %x\n",fat.bpb.BS_FilSysType);
		printf("jmpboot %x\n",fat.bpb.BS_jmpBoot);
		printf("oemname %s\n",fat.bpb.BS_OEMName);
		printf("reserved1 %d\n",fat.bpb.BS_Reserved1);
		printf("volid %d\n",fat.bpb.BS_VolID);
		printf("bootsig %x\n",fat.bpb.BS_BootSig);
		printf("vollab %s\n",fat.bpb.BS_VolLab);
	}
*/
	
/*	USES_CONVERSION;
	char tstrCmd[256] = "something\0";
	char tstrCmdParam[256] = "something\0";
	if (argc < 3)
	{
		printf("Usage:\r\nfsmgnt createfs [SizeInMB>=5}");
		return -1;
	}
	CFatFS fat;
	BS_BPB_FAT16 bs_fat;
	unsigned short nCurrentFileCluster = 0;
	unsigned long nCurrentByteForOpenFile =0;
	unsigned short BytesPerSec=0;
	unsigned long TotalClusters=0;
	unsigned char SecPerClus=0;
	unsigned long nDskSz = 0;
	char openhandle[256];
	strcpy(openhandle,"");
	if (strcmp(strlwr(argv[1]),"createfs")==0)
	{
		memset(&bs_fat,0,sizeof(bs_fat));
		fat.GetDiskGeometry16(atoi(argv[2]),BytesPerSec,SecPerClus,TotalClusters,nDskSz);
		bs_fat.bpb.BPB_BytesPerSec = BytesPerSec;
		bs_fat.bpb.BPB_SecPerClus = SecPerClus;
		bs_fat.bpb.BPB_TotSec16=SecPerClus*TotalClusters;
		fat.CreateFileSystem16(bs_fat);
		//printf("bps=%d spc=%d totclus=%d totsec=%d disksize=%d",bs_fat.bpb.BPB_BytesPerSec,bs_fat.bpb.BPB_SecPerClus,TotalClusters,bs_fat.bpb.BPB_TotSec16,nDskSz);
	}
	else
	{
		printf("incorrect usage... exiting\r\n");
		return 0;
	}
	while (strcmp(strlwr(tstrCmd),"exit")!=0)
	{
		//if ()
		//{
			printf("\r\nPossible commands are:\r\n"
				"createfile [filename]\r\n"
				"open [filename] (open \"/hd0/\" for boot sector, w/o quotes)\r\n"
				"write [handle] [char] [-b[byte] optional]\r\n"
				"read [handle]\r\n"
				"mkdir [dirname]\r\n"
//				"chdir [dirname]\r\n"
				"ls\r\n"
				"close [handle]\r\n"
				"export [filename] (will export to actual file located on the hard drive, must include path)\r\n"
				"exit\r\n");
			cin >> tstrCmd;
			strcpy(tstrCmdParam,"");
			if (strcmp(strlwr(tstrCmd),"exit")!=0 && strcmp(strlwr(tstrCmd),"ls")!=0 &&
				(strcmp(strlwr(tstrCmd),"createfile")==0 || 
				strcmp(strlwr(tstrCmd),"open")==0 || 
				strcmp(strlwr(tstrCmd),"write")==0 || 
				strcmp(strlwr(tstrCmd),"read")==0 || 
				strcmp(strlwr(tstrCmd),"mkdir")==0 || 
//				strcmp(strlwr(tstrCmd),"chdir")==0 || 
				strcmp(strlwr(tstrCmd),"close")==0 || 
				strcmp(strlwr(tstrCmd),"export")==0))
			{
				cin.getline(tstrCmdParam,256);
				char* tok = strtok(tstrCmdParam," ");
				strcpy(tstrCmdParam,tok);
				printf("Cmd:%s Params:%s\r\n",tstrCmd,tstrCmdParam);
			}
			else
				printf("Bad Command Entered\r\n");
		//}
		//else
		{
			const int nExit = 11934;
			const int nExport = 18198;
			const int nClose = 14418;
			const int nCreateFile = 28188;
			const int nWrite = 14985;
			const int nRead = 11124;
			const int nOpen = 11718;
			const int nMkdir = 14445;
//			const int nChdir = 14094;
			const int nLs = 6021;
			switch(matoi(strlwr(tstrCmd),strlen(tstrCmd)))
			{
			case nExport:
				{
					HANDLE hFile = CreateFile(A2T((char*)tstrCmdParam),GENERIC_WRITE,FILE_SHARE_WRITE,NULL,OPEN_ALWAYS,NULL,NULL);
					unsigned long dwBytesWritten = 0;
					for (unsigned long nSecNum = 0; nSecNum < max(bs_fat.bpb.BPB_TotSec16,bs_fat.bpb.BPB_TotSec32); nSecNum++)
					{
						if (WriteFile(hFile,(void*)(fat.ReadSector(nSecNum,bs_fat.bpb.BPB_BytesPerSec)),bs_fat.bpb.BPB_BytesPerSec,&dwBytesWritten,NULL) == TRUE)
							continue;
						else break;
					}
					CloseHandle(hFile);
					printf("File %s Exported\r\n",tstrCmdParam);
				break;
				}
			case nClose:
				{
					strcpy(openhandle,"");
					printf("Handle Closed");
					nCurrentByteForOpenFile = 0;
					nCurrentFileCluster = 0;
				break;
				}
			case nWrite:
				{
					char* CmdParam = strtok(NULL,"\0");
					unsigned long nSector = (nCurrentFileCluster*bs_fat.bpb.BPB_SecPerClus)+fat.FirstRootDirSecNum(bs_fat);
					while (CmdParam !=NULL)
					{
						if (nCurrentByteForOpenFile > 0)
							fat.WriteSectorFromStart(nSector,nCurrentByteForOpenFile-1,(unsigned char*)CmdParam,strlen(CmdParam));
						else
							fat.WriteSectorFromStart(nSector,nCurrentByteForOpenFile,(unsigned char*)CmdParam,strlen(CmdParam));
						nCurrentByteForOpenFile+=strlen(CmdParam);
						CmdParam = strtok(NULL,"\0");
					}
					unsigned char nChar = 0xF8;
					fat.WriteSectorFromStart(nSector,nCurrentByteForOpenFile,(unsigned char*)&nChar,1);
					nCurrentByteForOpenFile+=1;
				break;
				}
			case nRead:
				{
					if (strcmp(openhandle,"")!=0)
					{
						char buf[256];
						//printf("%d",matoi("/hd0/",strlen("/hd0/")));
						if (atoi(tstrCmdParam) == matoi("/hd0/",strlen("/hd0/")))
						{
							printf("Sector 0 looks like:\r\n%s\r\n",(char*)fat.ReadSector(0,bs_fat.bpb.BPB_BytesPerSec));
						}
						else
						{
							unsigned long nSector = (nCurrentFileCluster*bs_fat.bpb.BPB_SecPerClus)+fat.FirstRootDirSecNum(bs_fat);
							unsigned short nReadCount=1;
							unsigned short nChar = 0;
							unsigned char* sec = fat.ReadSector(nSector,bs_fat.bpb.BPB_BytesPerSec);
							while (sec[nChar] != 0xF8)
							{
								printf("%c",sec[nChar++]);
								if (nChar == bs_fat.bpb.BPB_BytesPerSec)
									sec = fat.ReadSector((nCurrentFileCluster*bs_fat.bpb.BPB_SecPerClus)+fat.FirstRootDirSecNum(bs_fat)+nReadCount++,bs_fat.bpb.BPB_BytesPerSec);
							}
							//printf("Sector %d looks like:\r\n%d",nSector,(char*)fat.ReadSector(nSector,bs_fat.bpb.BPB_BytesPerSec));
							//printf("Read file not implemented yet\r\n");
						}
					}
					else
						printf("You must open a file before you can read\r\n");
				break;
				}
			case nOpen:
				{
					printf("Opening %s\r\n",tstrCmdParam);
					if (strcmp(strlwr(tstrCmdParam),"/hd0/")==0)
					{
						char buf[256];
						//printf("%d",matoi(tstrCmdParam,strlen(tstrCmdParam)));
						itoa(matoi(tstrCmdParam,strlen(tstrCmdParam)),buf,10);
						strcpy(openhandle,buf);
						printf("handle for %s=%s\r\n",tstrCmdParam,buf);
					}
					else if (strcmp(openhandle,"")==0)
					{
						bool bIsOkToOpen = false;
						int nSecCount = fat.FirstRootDirSecNum(bs_fat);
						unsigned char* sec = fat.ReadSector(nSecCount,bs_fat.bpb.BPB_BytesPerSec);
						FAT_DIR_ENTRY dir;
						dir.DIR_Name[0] = 0x01;
						int nCount = 0;
						while (dir.DIR_Name[0] != 0x00)
						{
							memcpy(&dir,&sec[nCount*sizeof(FAT_DIR_ENTRY)],sizeof(FAT_DIR_ENTRY));
							char dirname[12];
							memcpy(dirname,dir.DIR_Name,sizeof(char)*11);
							dirname[11] = 0x00;
							if (dir.DIR_Attr == ATTR_DIRECTORY)
							{
								nCount++;
								continue;
							}
							else
							{
								if (strcmp(strlwr(tstrCmdParam),strlwr(dirname))==0)
								{
									bIsOkToOpen=true;
									nCurrentFileCluster = dir.DIR_FstClusLO;
									break;
								}
							}
							nCount++;
							if (nCount % 16 == 0)
							{
								sec = fat.ReadSector(nSecCount++,bs_fat.bpb.BPB_BytesPerSec);
								nCount = 0;
							}
						}
						if(bIsOkToOpen)
						{
							char buf[256];
							itoa(matoi(tstrCmdParam,strlen(tstrCmdParam)),buf,10);
							strcpy(openhandle,buf);
							printf("handle for %s=%s\r\n",tstrCmdParam,buf);
						}
						else printf("Unable to find file to open\r\n");
					}
					else
					{
						printf("You must call closehandle on %s\r\n",openhandle);
					}
				break;
				}
			case nMkdir:
				{
					printf("All files created after this entry will be under this directory, are you sure you want to continue? (yes or no)\r\n");
					cin.getline(tstrCmdParam,256);
					if (strcmp(strlwr(tstrCmdParam),"yes")!=0)
					{
						printf("Not continuing this action\r\n");
						break;
					}
				unsigned long nRootDirStart = fat.FirstRootDirByteNum(bs_fat);
				FAT_DIR_ENTRY dir;
				memset((void*)&dir,0,sizeof(dir));
				dir.DIR_Attr = ATTR_DIRECTORY;
				dir.DIR_WrtTime = 0x7C42;
				dir.DIR_WrtDate = 0x38A2;
				dir.DIR_Name[0] = tstrCmdParam[0];
				dir.DIR_Name[1] = tstrCmdParam[1];
				dir.DIR_Name[2] = tstrCmdParam[2];
				dir.DIR_Name[3] = tstrCmdParam[3];
				dir.DIR_Name[4] = tstrCmdParam[4];
				dir.DIR_Name[5] = tstrCmdParam[5];
				dir.DIR_Name[6] = tstrCmdParam[6];
				dir.DIR_Name[7] = tstrCmdParam[7];
				dir.DIR_Name[8] = tstrCmdParam[8];
				dir.DIR_Name[9] = tstrCmdParam[9];
				dir.DIR_Name[10] = tstrCmdParam[10];
				dir.DIR_CrtTime = 0x68BD;
				dir.DIR_CrtDate = 0xA27C;
				dir.DIR_LstAccDate=0xA238;
				fat.IncLastClusterUsed();
				dir.DIR_FstClusLO = fat.GetLastClusterUsed();
				unsigned long nRootDirEntry = fat.FirstRootDirSecNum(bs_fat);
				fat.WriteSectorFromStart(nRootDirEntry,(dir.DIR_FstClusLO-1)*sizeof(FAT_DIR_ENTRY),(unsigned char*)&dir,sizeof(FAT_DIR_ENTRY));
				memset(&dir,0,sizeof(dir));
				dir.DIR_FstClusLO = fat.GetLastClusterUsed();
				fat.WriteSectorFromStart(nRootDirEntry,dir.DIR_FstClusLO*sizeof(FAT_DIR_ENTRY),(unsigned char*)&dir,sizeof(FAT_DIR_ENTRY));
				printf("file created with name %s\r\n",tstrCmdParam);
				break;
				}
			case nChdir:
				{
				break;
				}
			case nLs:
				{
					int nSecCount = fat.FirstRootDirSecNum(bs_fat);
					unsigned char* sec = fat.ReadSector(nSecCount,bs_fat.bpb.BPB_BytesPerSec);
					FAT_DIR_ENTRY dir;
					dir.DIR_Name[0] = 0x01;
					int nCount = 0;
					while (dir.DIR_Name[0] != 0x00)
					{
						memcpy(&dir,&sec[nCount*sizeof(FAT_DIR_ENTRY)],sizeof(FAT_DIR_ENTRY));
						char dirname[12];
						memcpy(dirname,dir.DIR_Name,sizeof(char)*11);
						dirname[11] = 0x00;
						if (dir.DIR_Attr == ATTR_DIRECTORY)
							printf("Directory %s\r\n",dirname);
						else
							printf("File %s\r\n",dirname);
						nCount++;
						if (nCount % 16 == 0)
						{
							sec = fat.ReadSector(nSecCount++,bs_fat.bpb.BPB_BytesPerSec);
							nCount = 0;
						}
					}
				break;
				}
			case nCreateFile:
				{
				//cin >> tstrCmd;
				unsigned long nRootDirStart = fat.FirstRootDirByteNum(bs_fat);
				FAT_DIR_ENTRY dir;
				memset((void*)&dir,0,sizeof(dir));
				dir.DIR_Attr = ATTR_ARCHIVE;
				dir.DIR_WrtTime = 0x7C42;
				dir.DIR_WrtDate = 0x38A2;
				dir.DIR_Name[0] = tstrCmdParam[0];
				dir.DIR_Name[1] = tstrCmdParam[1];
				dir.DIR_Name[2] = tstrCmdParam[2];
				dir.DIR_Name[3] = tstrCmdParam[3];
				dir.DIR_Name[4] = tstrCmdParam[4];
				dir.DIR_Name[5] = tstrCmdParam[5];
				dir.DIR_Name[6] = tstrCmdParam[6];
				dir.DIR_Name[7] = tstrCmdParam[7];
				dir.DIR_Name[8] = tstrCmdParam[8];
				dir.DIR_Name[9] = tstrCmdParam[9];
				dir.DIR_Name[10] = tstrCmdParam[10];
				dir.DIR_CrtTime = 0x68BD;
				dir.DIR_CrtDate = 0xA27C;
				dir.DIR_LstAccDate=0xA238;
				fat.IncLastClusterUsed();
				dir.DIR_FstClusLO = fat.GetLastClusterUsed();
				unsigned long nRootDirEntry = fat.FirstRootDirSecNum(bs_fat);
				fat.WriteSectorFromStart(nRootDirEntry,(dir.DIR_FstClusLO-1)*sizeof(FAT_DIR_ENTRY),(unsigned char*)&dir,sizeof(FAT_DIR_ENTRY));
				memset(&dir,0,sizeof(dir));
				dir.DIR_FstClusLO = fat.GetLastClusterUsed();
				fat.WriteSectorFromStart(nRootDirEntry,dir.DIR_FstClusLO*sizeof(FAT_DIR_ENTRY),(unsigned char*)&dir,sizeof(FAT_DIR_ENTRY));
				printf("file created with name %s\r\n",tstrCmdParam);
				break;
				}
			case nExit:
				{
				printf("switch exit called\r\n");
				return 0;
				break;
				}
			default:
				printf("%s Command not implemented yet\r\n",tstrCmd);
				int n = matoi(strlwr(tstrCmd),strlen(tstrCmd));
				break;
			}
		}
*/	}
	
	/*return 0;*/
}

