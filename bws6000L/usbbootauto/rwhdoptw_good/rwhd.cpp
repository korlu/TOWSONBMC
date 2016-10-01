// rwhd.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include <iostream>
#include <windows.h>
#include <atlbase.h>  
#include <atlConv.h>

char * ReadSectors(int drive, DWORD startinglogicalsector, int numberofsectors)
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
	hDevice = CreateFile ( A2T("\\\\.\\vwin32"),
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

	  char _devicename[] = "\\\\.\\A:";
	  _devicename[4] += drive-1;

	  // Creating a handle to disk drive using CreateFile () function ..
	  hDevice = CreateFile(A2T(_devicename),
				GENERIC_READ, FILE_SHARE_READ | FILE_SHARE_WRITE,
				NULL, OPEN_EXISTING, 0, NULL);

		if (hDevice == INVALID_HANDLE_VALUE)
			return NULL;
		else printf("hDevice in ReadSectors is: %d\n",hDevice);
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
BOOL WriteSectors(int drive, DWORD startinglogicalsector, int numberofsectors, unsigned char * lpBufferToWrite, unsigned long dwSize)
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
	BOOL  fResult = FALSE;
	DWORD cb ;

	// Creating handle to vwin32.vxd (win 9x)
	hDevice = CreateFile ( A2T("\\\\.\\vwin32"),
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

	  char _devicename[] = "\\\\.\\A:";
	  _devicename[4] += drive-1;

	  // Creating a handle to disk drive using CreateFile () function ..
	  hDevice = CreateFile(A2T(_devicename),
				GENERIC_WRITE, FILE_SHARE_READ | FILE_SHARE_WRITE,
				NULL, OPEN_EXISTING, 0, NULL);

		if (hDevice == INVALID_HANDLE_VALUE)
			return FALSE;

	  // Setting the pointer to point to the start of the sector we want to read ..
	  SetFilePointer (hDevice, (startinglogicalsector*512), NULL, FILE_BEGIN);

	  if (!WriteFile(hDevice, lpBufferToWrite, dwSize, &byteswritten, NULL) )
		 return NULL;
	  else
	  {
		  printf("hDevice in WriteSectors is: %d\n",hDevice);
		  fResult = TRUE;
	  }
	}
	else
	{
	  // code for win 95/98
	  ControlBlock.StartingSector = (DWORD)startinglogicalsector;
	  ControlBlock.NumberOfSectors = (DWORD)numberofsectors ;
	  ControlBlock.pBuffer = (DWORD)lpBufferToWrite ;

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

	  reg.reg_ESI = 0x6001 ;
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

	   fResult = fResult && !(reg.reg_Flags & 1);
	}

	CloseHandle(hDevice);
	return fResult == TRUE;
}

int _tmain(int argc, _TCHAR* argv[])
{
	if (argc <4)
	{
		_tcprintf(L"rwhd [option] [parameters]\r\n");
		_tcprintf(L"-r driveNum(1-255) startSector(0+) numOfSectors(1+) filenameToWriteTo //Read sector\r\n");
		_tcprintf(L"-w driveNum(1-255) startSector(0+) numOfSectors(1+) filenameToReadFrom //Write sector\r\n");
		_tcprintf(L"-m driveNum(1-255) filenameToReadFrom //Write Boot Sector\r\n");
		_tcprintf(L"-k driveNum(1-255) startSector(0+) numOfSectors(1+) offsetFromStartOfDrive \r\n\tfilenameToWriteTo sectorFile prcyceLocation//Karne Read sector\r\n");
	}
	else
	{
		if ((argc>=6) && (_tcscmp(_tcslwr(argv[1]), L"-r")==0))
		{//Read Sector
			int nDriveNum = _tstoi(argv[2]);
			int nStartSector = _tstoi(argv[3]);
			int nNumOfSectors = _tstoi(argv[4]);
			char* pSectors = ReadSectors(nDriveNum,nStartSector,nNumOfSectors);
			if (pSectors != NULL)
			{
				_tcprintf(L"Read Sector Successful\r\n");
				HANDLE hFile = CreateFile(argv[5],GENERIC_WRITE,FILE_SHARE_WRITE,NULL,OPEN_ALWAYS,NULL,NULL);
				unsigned long dwBytesWritten = 0;
				if (WriteFile(hFile,(void*)pSectors,512*nNumOfSectors,&dwBytesWritten,NULL)==TRUE)
				{
					_tcprintf(L"File Written Successfully\r\n");
				}
				else
				{
					_tcprintf(L"Error Writing File\r\n");
				}
				CloseHandle(hFile);
			}
			else
			{
				_tcprintf(L"Error Reading Sectors from drive\r\n");
			}
		}
		else if ((argc>=6) && (_tcscmp(_tcslwr(argv[1]),L"-w")==0))
		{
			HANDLE hRead = CreateFile(argv[5],GENERIC_READ,FILE_SHARE_READ,NULL,OPEN_ALWAYS,NULL,NULL);
			if (hRead != INVALID_HANDLE_VALUE)
			{
				char pTemp[512];
				DWORD dwRead = 0;
				int nDriveNum = _tstoi(argv[2]);
				int nStartSector = _tstoi(argv[3]);
				int nNumOfSectors = _tstoi(argv[4]);
				DWORD dwFileSizeHigh = 0;
				DWORD dwFileSizeLow = GetFileSize(hRead,&dwFileSizeHigh);
				DWORD dwSizeRead = dwFileSizeLow;
				if (dwFileSizeHigh != 0)
				{
					_tcprintf(L"Warning: Not using high file size!!!\r\n");
				}
				for (int nSector = nStartSector; nSector < nNumOfSectors+nStartSector, dwSizeRead>0; nSector++)
				{
					if (ReadFile(hRead,(void*)pTemp,((dwSizeRead>=512)?512:dwSizeRead),&dwRead,NULL)==TRUE)
					{
						if (dwSizeRead>=512)
						{
							if (WriteSectors(nDriveNum,nSector,1,(unsigned char*)pTemp,512)==TRUE)
							{
								_tcprintf(L"Wrote Sector %d Successfully\r\n",nSector);
							}
							else
							{
								//TODO: implement cluster writing past a certain point on HD
								//Otherwise we get file write errors...
								_tcprintf(L"Error Writing Sector %d\r\n",nSector);
								CloseHandle(hRead);
								return -1;
							}
						}
						else
						{
							ZeroMemory(&pTemp[dwSizeRead],512-dwSizeRead);
							if (WriteSectors(nDriveNum,nSector,1,(unsigned char*)pTemp,dwSizeRead)==TRUE)
							{
							}
							else
							{
								_tcprintf(L"Error writing sector\r\n");
							}
						}
					}
					else
					{
						_tcprintf(L"Error Reading File\r\n");
						CloseHandle(hRead);
						return -1;
					}
					dwSizeRead -= 512;
				}
			}
			else
				_tcprintf(L"Error opening file\r\n");
			CloseHandle(hRead);
		}
		else if ((argc>=4) && (_tcscmp(_tcslwr(argv[1]),L"-m")==0))
		{
			HANDLE hRead = CreateFile(argv[3],GENERIC_READ,FILE_SHARE_READ,NULL,OPEN_ALWAYS,NULL,NULL);
			if (hRead != INVALID_HANDLE_VALUE)
			{
				char pTemp[512];
				DWORD dwRead = 0;
				int nDriveNum = _tstoi(argv[2]);
				if (ReadFile(hRead,(void*)pTemp,512,&dwRead,NULL)==TRUE)
				{
					_tcprintf(L"Read file\r\n");
					if (WriteSectors(nDriveNum,0,1,(unsigned char*)pTemp,512) == TRUE)
					{
						_tcprintf(L"Master Boot Record Written Successfully\r\n");
					}
					else
						_tcprintf(L"Error writing sector\r\n");
				}
				else
					_tcprintf(L"Error reading file\r\n");
			}
			else
				_tcprintf(L"Error opening file\r\n");
			CloseHandle(hRead);
		}
	}
	if ((argc>=10) && (_tcscmp(_tcslwr(argv[1]), L"-k")==0))
		{//Read Sector
			int nDriveNum = _tstoi(argv[2]);
			int nStartSector = _tstoi(argv[3]);
			int nNumOfSectors = _tstoi(argv[4]);
			int nOffsetFromStartOfDrive = _tstoi(argv[5]);
			int nAddress = 0;
			int signatureOffset = _tstoi(argv[9]);
			//RKK signature TDOSC2008T offset in bytes 
			//    from the start of prcycle.exe
			int gapPrcycleTest = _tstoi(argv[10]); 
			//RKK gap between prcycle.exe and test.exe in sectors (64)
			char* pSectors = ReadSectors(nDriveNum,nStartSector,nNumOfSectors);
			if (pSectors != NULL)
			{
				_tcprintf(L"Karne Read Sector Successful\r\n");
				HANDLE hFile = CreateFile(argv[6],GENERIC_WRITE,FILE_SHARE_WRITE,NULL,OPEN_ALWAYS,NULL,NULL);
				unsigned long dwBytesWritten = 0;
				if (WriteFile(hFile,(void*)pSectors,512*nNumOfSectors,&dwBytesWritten,NULL)==TRUE)
				{
					_tcprintf(L"Karne File Written Successfully\r\n");
					_tcprintf(L"No of Bytes Written:  %d\n ", dwBytesWritten); 

					for (nAddress=0; nAddress<dwBytesWritten; nAddress++) 
					{ 
					  //RKK The signature TDOSC2008T is placed in prcycle.asm at DemoStack1Seg 
					  //  Thiss address is 0xc80 from the start address of prcycle.exe fnAddressle 
					  // You can check the 0xc80 value nAddressn the prcycle.map file 
					  // Starting address of the USB nAddresss not included here, usually it is 1 sector
					  if (pSectors[nAddress]    == 'T' && pSectors[nAddress+1]  == 'D' && pSectors[nAddress+2] == 'O' &&
						  pSectors[nAddress+3]  == 'S' && pSectors[nAddress+4] == 'C' && pSectors[nAddress+5] == '2' &&
						  pSectors[nAddress+6]  == '0' && pSectors[nAddress+7] == '0' && pSectors[nAddress+8] == '8' &&
						  pSectors[nAddress+9]  == 'T') 
					  {
						  _tcprintf(L"The prcycle.exe start address nAddresss: %x\n", nAddress-signatureOffset); 
						  _tcprintf(L"The prcycle.exe startnAddressng sector no: %x\n", ((nAddress-signatureOffset)/512)+nOffsetFromStartOfDrive); 
						  _tcprintf(L"The test.exe startnAddressng sector no: %x\n", ((nAddress-signatureOffset)/512 + gapPrcycleTest)+nOffsetFromStartOfDrive); 
						  break;
					  }

					}
					int d1 = 0; 
					_tcprintf(L"The USB Drive Used to write: %c \n",'A'+nDriveNum-1); 
					HANDLE hFile = CreateFile(argv[7],GENERIC_READ|GENERIC_WRITE,FILE_SHARE_READ|FILE_SHARE_WRITE,NULL,OPEN_ALWAYS,NULL,NULL);
					unsigned long dwBytesWritten = 0;
					unsigned long dwRead=0;
					char pTemp[512];
					if (ReadFile(hFile,(void*)pTemp,512,&dwRead,NULL)==TRUE)
					{
						_tcprintf(L"Read %d Bytes from %s\r\n",dwRead,argv[7]);
						unsigned long nSecTemp = ((nAddress-signatureOffset)/512)+nOffsetFromStartOfDrive;
						memcpy(&pTemp[143],&nSecTemp,sizeof(nSecTemp));
						_tcprintf(L"Changed Offset to %x Sector\r\n",nSecTemp);
						SetFilePointer(hFile,0,0,FILE_BEGIN);
						if (WriteFile(hFile,(void*)pTemp,512,&dwBytesWritten,NULL)==TRUE)
						{
							_tcprintf(L"Wrote %d Bytes to %s\r\n",dwBytesWritten,argv[7]);
							HANDLE hPrcycle = CreateFile(argv[8],GENERIC_READ|GENERIC_WRITE,FILE_SHARE_READ|FILE_SHARE_WRITE,NULL,OPEN_ALWAYS,NULL,NULL);
							DWORD dwFileSize = GetFileSize(hPrcycle,NULL);
							unsigned long dwBytesWritten = 0;
							unsigned long dwRead=0;
							char *pPrcycTemp = new char[dwFileSize];
							if (ReadFile(hPrcycle,(void*)pPrcycTemp,dwFileSize,&dwRead,NULL)==TRUE)
							{
								_tcprintf(L"Read %d Bytes from %s\r\n",dwRead,argv[8]);
								for (int n=0; n<dwRead; n++) 
								{ 
									  //RKK The signature TDOSC2008T is placed in prcycle.asm at DemoStack1Seg 
									  //  This address is 0xc80 from the start address of prcycle.exe fnAddressle 
									  // You can check the 0xc80 value nAddressn the prcycle.map file 
									  // Starting address of the USB nAddresss not included here, usually it is 1 sector
									  if (pPrcycTemp[n]    == 'F' && pPrcycTemp[n+1]  == 'A' && pPrcycTemp[n+2] == 'C' &&
										  pPrcycTemp[n+3]  == 'K' && pPrcycTemp[n+4] == 'E' && pPrcycTemp[n+5] == 'R' &&
										  pPrcycTemp[n+6]  == 'S') 
									  {
											unsigned long nSecTemp = ((nAddress-signatureOffset)/512 + gapPrcycleTest)+nOffsetFromStartOfDrive;
											memcpy(&pPrcycTemp[n+15],&nSecTemp,sizeof(nSecTemp));
											unsigned long nCheck = (unsigned long)pPrcycTemp[n+15];
											_tcprintf(L"Check1 %x Check2 %x", nCheck, n);
											_tcprintf(L"Changed Offset to %x Sector\r\n",nSecTemp);
											SetFilePointer(hPrcycle,0,0,FILE_BEGIN);
											
											if (WriteFile(hPrcycle,(void*)pPrcycTemp,dwRead,&dwBytesWritten,NULL)==TRUE)
											{
												_tcprintf(L"Wrote %d Bytes to %s\r\n",dwBytesWritten,argv[8]);
											}
											else
											{
												_tcprintf(L"Error writing karne sector\r\n");
											}
											
										  break;
									  }
								}
							}
							else
							{
								_tcprintf(L"Error reading karne sector\r\n");
							}
							delete [] pPrcycTemp;

						}
						else
						{
							_tcprintf(L"Error writing karne sector\r\n");
						}
					}
					else 
					{
						_tcprintf(L"Error reading karne sector\r\n");
					}
				}
				else
				{
					_tcprintf(L"Karne Error Writing File\r\n");
				}
				CloseHandle(hFile);
			}
			else
			{
				_tcprintf(L"Karne Error Reading Sectors from drive\r\n");
			}
		}
    char val = 0; 
	printf("Enter some keyboard character to exit"); 
    scanf("%c", &val); 
	return 0;
}

