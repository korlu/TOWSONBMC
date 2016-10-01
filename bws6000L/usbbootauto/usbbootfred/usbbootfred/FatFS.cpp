#include "StdAfx.h"
#include <windows.h>
#include <iostream>
#include "FatFS.h"

 /* 
*This is the table for FAT16 drives. NOTE that this table includes
* entries for disk sizes larger than 512 MB even though typically
* only the entries for disks < 512 MB in size are used.
* The way this table is accessed is to look for the first entry
* in the table for which the disk size is less than or equal
* to the DiskSize field in that table entry.  For this table to
* work properly BPB_RsvdSecCnt must be 1, BPB_NumFATs
* must be 2, and BPB_RootEntCnt must be 512. Any of these values
* being different may require the first table entries DiskSize value
* to be changed otherwise the cluster count may be to low for FAT16.
   */
DSKSZTOSECPERCLUS DskTableFAT16 [] = {
	{        8400,   0}, /* disks up to  4.1 MB, the 0 value for SecPerClusVal trips an error */
	{      32680,   2},  /* disks up to   16 MB,  1k cluster */
	{    262144,   4},   /* disks up to 128 MB,  2k cluster */
	{   524288,    8},   /* disks up to 256 MB,  4k cluster */
	{ 1048576,  16},     /* disks up to 512 MB,  8k cluster */
	/* The entries after this point are not used unless FAT16 is forced */
	{ 2097152,  32},     /* disks up to     1 GB, 16k cluster */
	{ 4194304,  64},     /* disks up to     2 GB, 32k cluster */
	{ 0xFFFFFFFF, 0} /* any disk greater than 2GB, 0 value for SecPerClusVal trips an error */
};

/* 
* This is the table for FAT32 drives. NOTE that this table includes
* entries for disk sizes smaller than 512 MB even though typically
* only the entries for disks >= 512 MB in size are used.
* The way this table is accessed is to look for the first entry
* in the table for which the disk size is less than or equal
* to the DiskSize field in that table entry. For this table to
* work properly BPB_RsvdSecCnt must be 32, and BPB_NumFATs
* must be 2. Any of these values being different may require the first 
* table entries DiskSize value to be changed otherwise the cluster count 
* may be to low for FAT32.
*/
DSKSZTOSECPERCLUS DskTableFAT32 [] = {
	{       66600,   0},  /* disks up to 32.5 MB, the 0 value for SecPerClusVal trips an error */
	{     532480,   1},   /* disks up to 260 MB,  .5k cluster */
	{ 16777216,   8},     /* disks up to     8 GB,    4k cluster */
	{ 33554432, 16},      /* disks up to   16 GB,    8k cluster */
	{ 67108864, 32},      /* disks up to   32 GB,  16k cluster */
	{ 0xFFFFFFFF, 64}/* disks greater than 32GB, 32k cluster */
};


CFatFS::CFatFS(void)
{
	m_pSectors = NULL;
	m_nLastClusterUsed=1;
}

CFatFS::~CFatFS(void)
{
	if (m_pSectors != NULL)
	{
		delete [] m_pSectors;
		m_pSectors = NULL;
	}
}
unsigned char* CFatFS::ReadSector(unsigned long ThisFATSecNum, unsigned char BytesPerSec)
{
	return m_pSectors[ThisFATSecNum].sec;
}
void CFatFS::WriteSector(unsigned long ThisFATSecNum, unsigned char BytesPerSec, unsigned char* SecBuff)
{
	memcpy((void*)m_pSectors[ThisFATSecNum].sec,(void*)SecBuff,BytesPerSec);
}
void CFatFS::WriteSectorFromStart(unsigned long ThisFATSecNum, unsigned short nByteStart, unsigned char* SecBuff, unsigned char BytesToWrite)
{
	memcpy((void*)&m_pSectors[ThisFATSecNum].sec[nByteStart],(void*)SecBuff,BytesToWrite);
}
int CFatFS::BytesPerCluster(BS_BPB_FAT32 b)
{
	if ((b.bpb.BPB_BytesPerSec * b.bpb.BPB_SecPerClus) > (32*1024))
		return -1;
	else
		return (b.bpb.BPB_BytesPerSec * b.bpb.BPB_SecPerClus);
}
unsigned long CFatFS::RootDirSectors(BS_BPB_FAT16 b)
{//count of sectors occupied by the root directory
	unsigned long lRootDirSectors = ((b.bpb.BPB_RootEntCnt * 32) + (b.bpb.BPB_BytesPerSec - 1)) / b.bpb.BPB_BytesPerSec;
	return lRootDirSectors;//this is always zero for FAT32 volumes
}

unsigned long CFatFS::RootDirSectors(BS_BPB_FAT32 b)
{//count of sectors occupied by the root directory
	unsigned long lRootDirSectors = ((b.bpb.BPB_RootEntCnt * 32) + (b.bpb.BPB_BytesPerSec - 1)) / b.bpb.BPB_BytesPerSec;
	return lRootDirSectors;//this is always zero for FAT32 volumes
}
unsigned long CFatFS::FirstDataSector(BS_BPB_FAT32 b)
{
	unsigned long lFirstDataSector = 0;
	unsigned long FATSz = 0;
	if(b.bpb.BPB_FATSz16 != 0)
		FATSz = b.bpb.BPB_FATSz16;
	else
		FATSz = b.bpb.BPB_FATSz32; 
	lFirstDataSector = b.bpb.BPB_ResvdSecCnt + (b.bpb.BPB_NumFATs * FATSz) + RootDirSectors(b);
	return lFirstDataSector;
	/*NOTE: This sector number is relative to the first sector of the volume that 
	contains the BPB (the sector that contains the BPB is sector number 0). This 
	does not necessarily map directly onto the drive, because sector 0 of the 
	volume is not necessarily sector 0 of the drive due to partitioning.*/
}
unsigned long CFatFS::FirstDataSector(BS_BPB_FAT16 b)
{
	unsigned long lFirstDataSector = 0;
	unsigned long FATSz = 0;
	if(b.bpb.BPB_FATSz16 != 0)
		FATSz = b.bpb.BPB_FATSz16;
	//else
	//	FATSz = b.bpb.BPB_FATSz32; 
	lFirstDataSector = b.bpb.BPB_ResvdSecCnt + (b.bpb.BPB_NumFATs * FATSz) + RootDirSectors(b);
	return lFirstDataSector;
	/*NOTE: This sector number is relative to the first sector of the volume that 
	contains the BPB (the sector that contains the BPB is sector number 0). This 
	does not necessarily map directly onto the drive, because sector 0 of the 
	volume is not necessarily sector 0 of the drive due to partitioning.*/
}
unsigned long CFatFS::FirstSectorofCluster(unsigned long nClusterNum, BS_BPB_FAT32 b)
{
	unsigned long lFirstSectorofCluster = ((nClusterNum - 2) * b.bpb.BPB_SecPerClus) + FirstDataSector(b);
	return lFirstSectorofCluster;
}
unsigned long CFatFS::FirstSectorofCluster(unsigned long nClusterNum, BS_BPB_FAT16 b)
{
	unsigned long lFirstSectorofCluster = ((nClusterNum - 2) * b.bpb.BPB_SecPerClus) + FirstDataSector(b);
	return lFirstSectorofCluster;
}

unsigned long CFatFS::SecOfDataRegion(BS_BPB_FAT32 b)
{
	unsigned long FATSz = 0, TotSec=0;
	if(b.bpb.BPB_FATSz16 != 0)
		FATSz = b.bpb.BPB_FATSz16;
	else
		FATSz = b.bpb.BPB_FATSz32;  

	if(b.bpb.BPB_TotSec16 != 0)
		TotSec = b.bpb.BPB_TotSec16;
	else
		TotSec = b.bpb.BPB_TotSec32;
	unsigned long DataSec = TotSec - (b.bpb.BPB_ResvdSecCnt + (b.bpb.BPB_NumFATs * FATSz) + RootDirSectors(b));
	return DataSec;
}
unsigned long CFatFS::SecOfDataRegion(BS_BPB_FAT16 b)
{
	unsigned long FATSz = 0, TotSec=0;
	if(b.bpb.BPB_FATSz16 != 0)
		FATSz = b.bpb.BPB_FATSz16;
	//else
	//	FATSz = b.bpb.BPB_FATSz32;  

	if(b.bpb.BPB_TotSec16 != 0)
		TotSec = b.bpb.BPB_TotSec16;
	//else
	//	TotSec = b.bpb.BPB_TotSec32;
	unsigned long DataSec = TotSec - (b.bpb.BPB_ResvdSecCnt +(b.bpb.BPB_NumFATs * FATSz) + RootDirSectors(b));
	return DataSec;
}

unsigned long CFatFS::CountOfClustersOfDataRegion(BS_BPB_FAT32 b)
{
	unsigned long CountofClusters = SecOfDataRegion(b) / b.bpb.BPB_SecPerClus;
	return CountofClusters;
}
unsigned long CFatFS::CountOfClustersOfDataRegion(BS_BPB_FAT16 b)
{
	unsigned long CountofClusters = SecOfDataRegion(b) / b.bpb.BPB_SecPerClus;
	return CountofClusters;
}

FATTYPE CFatFS::GetFatType(BS_BPB_FAT32 b)
{
	if(CountOfClustersOfDataRegion(b) < 4085) {
	/* Volume is FAT12 */
		return FAT12;
	} else if(CountOfClustersOfDataRegion(b) < 65525) {
		/* Volume is FAT16 */
		return FAT16;
	} else {
		/* Volume is FAT32 */
		return FAT32;
	}
	return UNKNOWN;
}
FATTYPE CFatFS::GetFatType(BS_BPB_FAT16 b)
{
	if(CountOfClustersOfDataRegion(b) < 4085) {
	/* Volume is FAT12 */
		return FAT12;
	} else if(CountOfClustersOfDataRegion(b) < 65525) {
		/* Volume is FAT16 */
		return FAT16;
	} else {
		/* Volume is FAT32 */
		return FAT32;
	}
	return UNKNOWN;
}

unsigned long CFatFS::ClusterPosition(BS_BPB_FAT32 b, unsigned short N,unsigned long &ThisFATEntOffset, unsigned char nFATNum)
{//takes bpb and cluster number and returns sector location of FAT Entry
	unsigned long FATOffset = 0;
	unsigned long FATSz =0;
	if(b.bpb.BPB_FATSz16 != 0)
		FATSz = b.bpb.BPB_FATSz16*nFATNum;
	else
		FATSz = b.bpb.BPB_FATSz32*nFATNum;  

	if(GetFatType(b) == FAT16)
		FATOffset = N * 2;
	else if (GetFatType(b) == FAT32)
		FATOffset = N * 4;

	unsigned long ThisFATSecNum = FATSz + b.bpb.BPB_ResvdSecCnt + (FATOffset / b.bpb.BPB_BytesPerSec);
	ThisFATEntOffset = (FATOffset % b.bpb.BPB_BytesPerSec);
	return ThisFATSecNum;
}
unsigned long CFatFS::ClusterPosition(BS_BPB_FAT16 b, unsigned short N,unsigned long &ThisFATEntOffset, unsigned char nFATNum)
{//takes bpb and cluster number and returns sector location of FAT Entry
	unsigned long FATOffset = 0;
	unsigned long FATSz =0;
	if(b.bpb.BPB_FATSz16 != 0)
		FATSz = b.bpb.BPB_FATSz16*nFATNum;
	//else
	//	FATSz = b.bpb.BPB_FATSz32*nFATNum;  

	if(GetFatType(b) == FAT16)
		FATOffset = N * 2;
	else if (GetFatType(b) == FAT12)
	{
        FATOffset = N + (N / 2);    
		// Multiply by 1.5 without using floating point, the divide by 2 rounds DOWN
	}
	unsigned long ThisFATSecNum = FATSz + b.bpb.BPB_ResvdSecCnt + (FATOffset / b.bpb.BPB_BytesPerSec);
	ThisFATEntOffset = (FATOffset % b.bpb.BPB_BytesPerSec);
	if(ThisFATEntOffset == (b.bpb.BPB_BytesPerSec - 1)) {
		/* This cluster access spans a sector boundary in the FAT      */
		/* There are a number of strategies to handling this. The      */
		/* easiest is to always load FAT sectors into memory           */
		/* in pairs if the volume is FAT12 (if you want to load        */
		/* FAT sector N, you also load FAT sector N+1 immediately      */
		/* following it in memory unless sector N is the last FAT      */
		/* sector). It is assumed that this is the strategy used here  */
		/* which makes this if test for a sector boundary span         */
		/* unnecessary.                                                */
		}
	return ThisFATSecNum;
}

unsigned long CFatFS::ReadClusterEntryValue(BS_BPB_FAT32 b, unsigned short N)
{
	unsigned long ThisFATEntOffset = 0;
	unsigned long ThisFATSecNum = ClusterPosition(b,N,ThisFATEntOffset);
	unsigned char *SecBuff = ReadSector(ThisFATSecNum, b.bpb.BPB_BytesPerSec);
	unsigned short FAT16ClusEntryVal = 0;
	unsigned long FAT32ClusEntryVal = 0;
	if(GetFatType(b) == FAT16)
	{
		FAT16ClusEntryVal = *((unsigned short *) &SecBuff[ThisFATEntOffset]);
		delete [] SecBuff;
		return FAT16ClusEntryVal;
	}
	else
	{
		FAT32ClusEntryVal = (*((unsigned long *) &SecBuff[ThisFATEntOffset])) & 0x0FFFFFFF;
		delete [] SecBuff;
		return FAT32ClusEntryVal;
	}
}

unsigned long CFatFS::ReadClusterEntryValue(BS_BPB_FAT16 b, unsigned short N)
{
	unsigned long ThisFATEntOffset = 0;
	unsigned long ThisFATSecNum = ClusterPosition(b,N,ThisFATEntOffset);
	unsigned char *SecBuff = ReadSector(ThisFATSecNum, b.bpb.BPB_BytesPerSec);
	unsigned short FAT16ClusEntryVal = 0;
	unsigned short FAT12ClusEntryVal = 0;
	if(GetFatType(b) == FAT16)
	{
		FAT16ClusEntryVal = *((unsigned short *) &SecBuff[ThisFATEntOffset]);
		delete [] SecBuff;
		return FAT16ClusEntryVal;
	}
	else
	{
		FAT12ClusEntryVal = *((unsigned short *) &SecBuff[ThisFATEntOffset]);
		if(N & 0x0001) 
			FAT12ClusEntryVal = FAT12ClusEntryVal >> 4;	/* Cluster number is ODD */
		else
			FAT12ClusEntryVal = FAT12ClusEntryVal & 0x0FFF;	/* Cluster number is EVEN */
		delete [] SecBuff;
		return FAT12ClusEntryVal;
	}
}
unsigned long CFatFS::GetFat32Entry(unsigned long FAT32ClusEntryVal, unsigned long& Fat32EntryHighOrder)
{//returns the lower 28 bits of the fat entry, passes the high order bits back 
	Fat32EntryHighOrder = FAT32ClusEntryVal & 0xF0000000;
	return FAT32ClusEntryVal & 0x0FFFFFFF;
}
void CFatFS::WriteClusterEntryValue(BS_BPB_FAT32 b, unsigned short N, unsigned long FAT32ClusEntryVal, unsigned short FAT16ClusEntryVal)
{
	unsigned long ThisFATEntOffset = 0;
	unsigned long ThisFATSecNum = ClusterPosition(b,N,ThisFATEntOffset);
	unsigned char *SecBuff = ReadSector(ThisFATSecNum, b.bpb.BPB_BytesPerSec);
	if(GetFatType(b) == FAT16)
		*((unsigned short *) &SecBuff[ThisFATEntOffset]) = FAT16ClusEntryVal;
	else {
		FAT32ClusEntryVal = FAT32ClusEntryVal & 0x0FFFFFFF;
		*((unsigned long *) &SecBuff[ThisFATEntOffset]) =
			(*((unsigned long *) &SecBuff[ThisFATEntOffset])) & 0xF0000000;
		*((unsigned long *) &SecBuff[ThisFATEntOffset]) = 
		    (*((unsigned long *) &SecBuff[ThisFATEntOffset])) | FAT32ClusEntryVal;
	}
	WriteSector(ThisFATSecNum,b.bpb.BPB_BytesPerSec,SecBuff);
	delete [] SecBuff;
}
void CFatFS::WriteClusterEntryValue(BS_BPB_FAT16 b, unsigned short N, unsigned long FAT12ClusEntryVal, unsigned short FAT16ClusEntryVal)
{
	unsigned long ThisFATEntOffset = 0;
	unsigned long ThisFATSecNum = ClusterPosition(b,N,ThisFATEntOffset);
	unsigned char *SecBuff = ReadSector(ThisFATSecNum, b.bpb.BPB_BytesPerSec);
	if(GetFatType(b) == FAT16)
		*((unsigned short *) &SecBuff[ThisFATEntOffset]) = FAT16ClusEntryVal;
	else if (GetFatType(b) == FAT12){
		if(N & 0x0001) {
			FAT12ClusEntryVal = FAT12ClusEntryVal << 4;	/* Cluster number is ODD */
			*((unsigned short *) &SecBuff[ThisFATEntOffset]) = 
				(*((unsigned short *) &SecBuff[ThisFATEntOffset])) & 0x000F;
		} else {
			FAT12ClusEntryVal = FAT12ClusEntryVal & 0x0FFF;	/* Cluster number is EVEN */
			*((unsigned short *) &SecBuff[ThisFATEntOffset]) = 
				(*((unsigned short *) &SecBuff[ThisFATEntOffset])) & 0xF000;
		}
		*((unsigned short *) &SecBuff[ThisFATEntOffset]) = 
			(*((unsigned short *) &SecBuff[ThisFATEntOffset])) | FAT12ClusEntryVal;
	}
	WriteSector(ThisFATSecNum,b.bpb.BPB_BytesPerSec,SecBuff);
	delete [] SecBuff;
}

bool CFatFS::IsEndOfClusterChain(unsigned long FATContent, BS_BPB_FAT32 b)
{
	bool IsEOF = false;
	FATTYPE FATType = GetFatType(b);
	if(FATType == FAT12) {
		if(FATContent >= 0x0FF8)
			IsEOF = true;
	} else if(FATType == FAT16) {
		if(FATContent >= 0xFFF8)
			IsEOF = true;
	} else if (FATType == FAT32) {
		if(FATContent >= 0x0FFFFFF8)
			IsEOF = true;
	}
	return IsEOF;
}
bool CFatFS::IsEndOfClusterChain(unsigned long FATContent, BS_BPB_FAT16 b)
{
	bool IsEOF = false;
	FATTYPE FATType = GetFatType(b);
	if(FATType == FAT12) {
		if(FATContent >= 0x0FF8)
			IsEOF = true;
	} else if(FATType == FAT16) {
		if(FATContent >= 0xFFF8)
			IsEOF = true;
	} else if (FATType == FAT32) {
		if(FATContent >= 0x0FFFFFF8)
			IsEOF = true;
	}
	return IsEOF;
}
unsigned long CFatFS::GetFatEOCMark(BS_BPB_FAT32 b)
{
	FATTYPE FATType = GetFatType(b);
	if(FATType == FAT12) {
		return 0x0FFF;;
	} else if(FATType == FAT16) {
		return 0xFFFF;
	} else if (FATType == FAT32) {
		return 0x0FFFFFFF;
	}
	else return 0x00000000;//this a null directory entry and should never be called
}
unsigned long CFatFS::GetFatEOCMark(BS_BPB_FAT16 b)
{
	FATTYPE FATType = GetFatType(b);
	if(FATType == FAT12) {
		return 0x0FFF;;
	} else if(FATType == FAT16) {
		return 0xFFFF;
	} else if (FATType == FAT32) {
		return 0x0FFFFFFF;
	}
	else return 0x00000000;//this a null directory entry and should never be called
}
unsigned long CFatFS::GetFATBadClusterMark(BS_BPB_FAT32 b)
{
	FATTYPE FATType = GetFatType(b);
	if(FATType == FAT12) {
		return 0x0FF7;;
	} else if(FATType == FAT16) {
		return 0xFFF7;
	} else if (FATType == FAT32) {
		return 0x0FFFFFF7;
	}
	else return 0x00000000;//this a null directory entry and should never be called
}
unsigned long CFatFS::GetFATBadClusterMark(BS_BPB_FAT16 b)
{
	FATTYPE FATType = GetFatType(b);
	if(FATType == FAT12) {
		return 0x0FF7;;
	} else if(FATType == FAT16) {
		return 0xFFF7;
	} else if (FATType == FAT32) {
		return 0x0FFFFFF7;
	}
	else return 0x00000000;//this a null directory entry and should never be called
}

void CFatFS::CountOfSectorsForFAT(BS_BPB_FAT32& b, unsigned long DskSize)
{
	FATTYPE FATType = GetFatType(b);
	unsigned long TmpVal1 = DskSize - (b.bpb.BPB_ResvdSecCnt + RootDirSectors(b));
	unsigned long TmpVal2 = (256 * b.bpb.BPB_SecPerClus) + b.bpb.BPB_NumFATs;
	if(FATType == FAT32)
		TmpVal2 = TmpVal2 / 2;
	unsigned long FATSz = (TmpVal1 + (TmpVal2 - 1)) / TmpVal2;
	if(FATType == FAT32) {
		b.bpb.BPB_FATSz16 = 0;
		b.bpb.BPB_FATSz32 = FATSz;
	} else {
		b.bpb.BPB_FATSz16 = FATSz & 0xFF;
		// there is no BPB_FATSz32 in a FAT16 BPB 
	}
}
void CFatFS::CountOfSectorsForFAT(BS_BPB_FAT16& b, unsigned long DskSize)
{
	//FATTYPE FATType = GetFatType(b);
	unsigned long TmpVal1 = DskSize - (b.bpb.BPB_ResvdSecCnt + RootDirSectors(b));
	unsigned long TmpVal2 = (256 * b.bpb.BPB_SecPerClus) + b.bpb.BPB_NumFATs;
	//if(FATType == FAT32)
	//	TmpVal2 = TmpVal2 / 2;
	unsigned long FATSz = (TmpVal1 + (TmpVal2 - 1)) / TmpVal2;
	//if(FATType == FAT32) {
	//	b.bpb.BPB_FATSz16 = 0;
	//	b.bpb.BPB_FATSz32 = FATSz;
	//} else {
	b.bpb.BPB_FATSz16 = FATSz & 0xFF;// there is no BPB_FATSz32 in a FAT16 BPB 
	//}
}
unsigned short CFatFS::FirstRootDirSecNum(BS_BPB_FAT16 b)
{
	return b.bpb.BPB_ResvdSecCnt + (b.bpb.BPB_NumFATs * b.bpb.BPB_FATSz16);
}
unsigned short CFatFS::FirstRootDirSecNum(BS_BPB_FAT32 b)
{
	
	return FirstSectorofCluster(b.bpb.BPB_RootClus,b);
}
unsigned long CFatFS::FirstRootDirByteNum(BS_BPB_FAT16 b)
{
	return ((b.bpb.BPB_ResvdSecCnt + (b.bpb.BPB_NumFATs * b.bpb.BPB_FATSz16))* b.bpb.BPB_BytesPerSec);
}
unsigned long CFatFS::FirstRootDirByteNum(BS_BPB_FAT32 b)
{
	
	return (FirstSectorofCluster(b.bpb.BPB_RootClus,b)*b.bpb.BPB_BytesPerSec);
}

#define BETWEEN(x,a,b) ((a <= x) && (x <= b))
void CFatFS::GetDiskGeometry16(unsigned short nSizeInMB, unsigned short& BytesPerSec, unsigned char& SecPerClus, unsigned long& TotalClusters, unsigned long& nDskSz)
{
	BytesPerSec = 512;
	if (BETWEEN(nSizeInMB,5,16))
		SecPerClus=DskTableFAT16[1].SecPerClusVal;
	else if (BETWEEN(nSizeInMB,16,128))
		SecPerClus=DskTableFAT16[2].SecPerClusVal;
	else if (BETWEEN(nSizeInMB,128,256))
		SecPerClus=DskTableFAT16[3].SecPerClusVal;
	else if (BETWEEN(nSizeInMB,256,512))
		SecPerClus=DskTableFAT16[4].SecPerClusVal;
	else if (BETWEEN(nSizeInMB,512,1024))
		SecPerClus=DskTableFAT16[5].SecPerClusVal;
	else if (BETWEEN(nSizeInMB,1024,2048))
		SecPerClus=DskTableFAT16[6].SecPerClusVal;
	else
		SecPerClus = 0;
	nDskSz = nSizeInMB * 1024 * 1024;
	unsigned long lTotalClusters = (unsigned long)(nDskSz / (((unsigned long)BytesPerSec) * ((unsigned long)SecPerClus)));
	TotalClusters = (unsigned short)lTotalClusters;
}

void CFatFS::CreateFileSystem16(BS_BPB_FAT16& bs_fat)
{
	if (m_pSectors != NULL)
	{
		delete [] m_pSectors;
		m_pSectors = NULL;
	}
	m_pSectors = new Sector[bs_fat.bpb.BPB_TotSec16];
	for (unsigned long n = 0; n < bs_fat.bpb.BPB_TotSec16; n++)
		memset(&m_pSectors[n].sec,0,bs_fat.bpb.BPB_BytesPerSec);
	bs_fat.bpb.BS_jmpBoot[0]=0xEB;bs_fat.bpb.BS_jmpBoot[1]=0x3C;bs_fat.bpb.BS_jmpBoot[2]=0x90;
	unsigned long nDskSz = 0;
	GetDiskGeometry16((((0x1E97E0*512)/1024)/1024),bs_fat.bpb.BPB_BytesPerSec,bs_fat.bpb.BPB_SecPerClus,bs_fat.bpb.BPB_TotSec32,nDskSz);
	bs_fat.bpb.BPB_TotSec32 *= bs_fat.bpb.BPB_SecPerClus;
	bs_fat.bpb.BPB_TotSec16=0;
	bs_fat.bpb.BS_OEMName[0]='M';
	bs_fat.bpb.BS_OEMName[1]='S';
	bs_fat.bpb.BS_OEMName[2]='D';
	bs_fat.bpb.BS_OEMName[3]='O';
	bs_fat.bpb.BS_OEMName[4]='S';
	bs_fat.bpb.BS_OEMName[5]='5';
	bs_fat.bpb.BS_OEMName[6]='.';
	bs_fat.bpb.BS_OEMName[7]='0';
	bs_fat.bpb.BPB_ResvdSecCnt=6;
	bs_fat.bpb.BPB_NumFATs=2;
	bs_fat.bpb.BPB_RootEntCnt = 512; //(bs_fat.bpb.BPB_BytesPerSec * 8) / 32;
	bs_fat.bpb.BPB_Media=0xF8;
	bs_fat.bpb.BPB_FATSz16 = 0xF5;
	bs_fat.bpb.BPB_HiddSec = 32;
	bs_fat.bpb.BPB_TotSec32 = 0x1E97E0;
	bs_fat.bpb.BS_DrvNum = 0x80;
	bs_fat.bpb.BS_Reserved1 = 0;
	bs_fat.bpb.BS_BootSig = 0x29;
	bs_fat.bpb.BS_VolID = 0x0C7A44E5;
	bs_fat.bpb.BS_VolLab[0]='N';
	bs_fat.bpb.BS_VolLab[1]='O';
	bs_fat.bpb.BS_VolLab[2]=' ';
	bs_fat.bpb.BS_VolLab[3]='N';
	bs_fat.bpb.BS_VolLab[4]='A';
	bs_fat.bpb.BS_VolLab[5]='M';
	bs_fat.bpb.BS_VolLab[6]='E';
	bs_fat.bpb.BS_VolLab[7]=' ';
	bs_fat.bpb.BS_VolLab[8]=' ';
	bs_fat.bpb.BS_VolLab[9]=' ';
	bs_fat.bpb.BS_VolLab[10]=' ';
	bs_fat.bpb.BS_FilSysType[0]='F';
	bs_fat.bpb.BS_FilSysType[1]='A';
	bs_fat.bpb.BS_FilSysType[2]='T';
	bs_fat.bpb.BS_FilSysType[3]='1';
	bs_fat.bpb.BS_FilSysType[4]='6';
	bs_fat.bpb.BS_FilSysType[5]=' ';
	bs_fat.bpb.BS_FilSysType[6]=' ';
	bs_fat.bpb.BS_FilSysType[7]=' ';
	int n = sizeof(BS_BPB_FAT16);
	int m = sizeof(bs_fat);
	memcpy((void*)m_pSectors[0].sec,(void*)&bs_fat,sizeof(BS_BPB_FAT16));
	FAT_DIR_ENTRY dir;
	memset((void*)&dir,0,sizeof(dir));
	dir.DIR_Attr = ATTR_DIRECTORY;
	dir.DIR_WrtTime = 0x7C42;
	dir.DIR_WrtDate = 0x38A2;
	dir.DIR_Name[0] = 'T';
	dir.DIR_Name[1] = 'E';
	dir.DIR_Name[2] = 'M';
	dir.DIR_Name[3] = 'P';
	dir.DIR_Name[4] = ' ';
	dir.DIR_Name[5] = ' ';
	dir.DIR_Name[6] = ' ';
	dir.DIR_Name[7] = ' ';
	dir.DIR_Name[8] = ' ';
	dir.DIR_Name[9] = ' ';
	dir.DIR_Name[10] = ' ';
	unsigned long nRootDirEntry = FirstRootDirSecNum(bs_fat);
	memcpy((void*)m_pSectors[nRootDirEntry].sec,(void*)&dir,sizeof(FAT_DIR_ENTRY));
}