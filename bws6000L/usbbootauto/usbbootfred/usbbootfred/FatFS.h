#pragma once

#pragma pack(1)
union BS_BPB_FAT16{
		unsigned char bs[62];
		struct BPB{
	unsigned char BS_jmpBoot[3];//0xEB 0x3C 0x90
	unsigned char BS_OEMName[8];//MSWIN4.1 "MSDOS5.0"
	unsigned short BPB_BytesPerSec;//512, 1024, 2048 or 4096 "512"="02 00"
	unsigned char BPB_SecPerClus;//1, 2, 4, 8, 16, 32, 64, and 128 "32"
	unsigned short BPB_ResvdSecCnt;//must not be 0, should be 1 for FAT12/16 "6"
	unsigned char BPB_NumFATs;//count of fats on the volume "2"
	unsigned short BPB_RootEntCnt;//0 for FAT32, or FAT12 and FAT16 volumes, this field contains
	//the count of 32-byte directory entries in the root directory. this value should always 
	//specify a count that when multiplied by 32 results in an even multiple of BPB_BytsPerSec "512"=02 00"
	unsigned short BPB_TotSec16;//must be 0 for FAT32, For FAT12 and FAT16 volumes, 
	//this field contains the sector count, and BPB_TotSec32 is 0 if the total sector count “fits” "0"
	unsigned char BPB_Media;//0xF8 "248="0xF8"
	unsigned short BPB_FATSz16;//must be 0 for FAT32, 16-bit count of sectors "245"="0xF5"
	//occupied by ONE FAT for FAT12,16
	unsigned short BPB_SecPerTrk;//for int13 "63"="0x3F"
	unsigned short BPB_NumHeads;//for int13 "255"="0xFF"
	unsigned long BPB_HiddSec;//count of hidden sectors preceading FAT volume "32"
	unsigned long BPB_TotSec32;//must be non-zero for FAT32 "2004960"="00 1E 97 E0"
	unsigned char BS_DrvNum;//int13 drive number, 0x80 for hard drives "0x80"
	unsigned char BS_Reserved1;//should be 0, used by winnt to format fat volumes "0"
	unsigned char BS_BootSig;//0x29 signifying that the next 3 bytes are present "0x29"
	unsigned long BS_VolID;//volume serial number "0C 7A 44 E5"
	unsigned char BS_VolLab[11];//11-byte volume label "NO NAME    "
	unsigned char BS_FilSysType[8];//“FAT16   ”
		}bpb;
};
#pragma pack()

#pragma pack(1)
union BS_BPB_FAT32{
	unsigned char bs[62];
	struct BPB{
	char BS_jmpBoot[3];//0xEB 0x?? 0x90
	char BS_OEMName[8];//MSWIN4.1
	unsigned short BPB_BytesPerSec;//512, 1024, 2048 or 4096
	unsigned char BPB_SecPerClus;//1, 2, 4, 8, 16, 32, 64, and 128
	unsigned short BPB_ResvdSecCnt;//must not be 0
	unsigned char BPB_NumFATs;//count of fats on the volume
	unsigned short BPB_RootEntCnt;//0 for FAT32
	unsigned short BPB_TotSec16;//must be 0 for FAT32
	unsigned char BPB_Media;//0xF8
	unsigned char BPB_FATSz16;//must be 0 for FAT32
	unsigned short BPB_SecPerTrk;//for int13
	unsigned short BPB_NumHeads;//for int13
	unsigned long BPB_HiddSec;//count of hidden sectors preceading FAT volume
	unsigned long BPB_TotSec32;//must be non-zero for FAT32
	unsigned long BPB_FATSz32;//must be non-zero, #of bits occupied by one FAT
	unsigned short BPB_FSVer;//0:0
	unsigned long BPB_RootClus;//set to first cluster in root directory, usually 2
	unsigned short BPB_FSInfo;//sector number of FSINFO structure, usually 1
	unsigned short BPB_BkBootSec;//should be 6
	char BPB_Reserved[12];//for future use
	unsigned short BS_DrvNum;//int13 drive number, 0x80 for hard disks
	unsigned char BS_Reserved1;//should be 0, used by winnt to format fat volumes
	unsigned char BS_BootSig;//0x29 signifying that the next 3 bytes are present
	unsigned long BS_VolID;//volume serial number
	char BS_VolLab[11];//11-byte volume label
	char BS_FilSysType[8];//“FAT     ”
	}bpb;
};
#pragma pack()
enum FATTYPE{ FAT12, FAT16, FAT32, UNKNOWN};
enum FILE_ATTRIBUTE{
	ATTR_READ_ONLY=0x01,
	ATTR_HIDDEN=0x02,
	ATTR_SYSTEM=0x04,
	ATTR_VOLUME_ID=0x08,
	ATTR_DIRECTORY=0x10,
	ATTR_ARCHIVE=0x20,
	ATTR_LONG_NAME=(ATTR_READ_ONLY | ATTR_HIDDEN | ATTR_SYSTEM | ATTR_VOLUME_ID)
	//The upper two bits of the attribute byte are reserved and should always be set to 0 when a file is created and never modified or looked at after that.
};
struct FAT_DIR_ENTRY {
	char DIR_Name[11];//short name
	unsigned char DIR_Attr;
	unsigned char DIR_NTRes;//should be zero, reserved
	unsigned char DIR_CrtTimeTenth;//0-199, count of tenths of a second at creation time
	unsigned short DIR_CrtTime;//file creation time
	unsigned short DIR_CrtDate;//file creation date
	unsigned short DIR_LstAccDate;//last access date
	unsigned short DIR_FstClusHI;//hi-word of this entry's first cluster, should be 0 for FAT12,FAT16
	unsigned short DIR_WrtTime;//last write time
	unsigned short DIR_WrtDate;//last write date
	unsigned short DIR_FstClusLO;//lo-word of entry's first cluster
	unsigned long DIR_FileSize;//32-bit unsigned value holding file size in bytes
};
/*If DIR_Name[0] == 0xE5, then the directory entry is free 
(there is no file or directory name in this entry). 

If DIR_Name[0] == 0x00, then the directory entry is free (same as for 0xE5), and there are no 
allocated directory entries after this one (all of the DIR_Name[0] bytes in all of the entries 
after this one are also set to 0). 

If DIR_Name[0] == 0x05, then the actual file name character for this byte is 0xE5. 0xE5 is 
actually a valid KANJI lead byte value for the character set used in Japan. The special 0x05 
value is used so that this special file name case for Japan can be handled properly and not 
cause FAT file system code to think that the entry is free. 

*/
struct Sector{
	//There can be 16 directory entries for one cluster, each dir entry is 32 bytes...
	unsigned char sec[512];//sector is 512 bytes according our calculations
};
struct DSKSZTOSECPERCLUS {
	unsigned long	DiskSize;
	unsigned char	SecPerClusVal;
};

class CFatFS
{
public:
	CFatFS(void);
	~CFatFS(void);
	unsigned char* ReadSector(unsigned long ThisFATSecNum, unsigned char BytesPerSec);
	void WriteSector(unsigned long ThisFATSecNum, unsigned char BytesPerSec, unsigned char* SecBuff);
	void WriteSectorFromStart(unsigned long ThisFATSecNum, unsigned short nByteStart, unsigned char* SecBuff, unsigned char BytesToWrite);
	int BytesPerCluster(BS_BPB_FAT32 b);
	unsigned long RootDirSectors(BS_BPB_FAT16 b);
	unsigned long RootDirSectors(BS_BPB_FAT32 b);
	unsigned long FirstDataSector(BS_BPB_FAT32 b);
	unsigned long FirstDataSector(BS_BPB_FAT16 b);
	unsigned long FirstSectorofCluster(unsigned long nClusterNum, BS_BPB_FAT32 b);
	unsigned long FirstSectorofCluster(unsigned long nClusterNum, BS_BPB_FAT16 b);
	unsigned long SecOfDataRegion(BS_BPB_FAT32 b);
	unsigned long SecOfDataRegion(BS_BPB_FAT16 b);
	unsigned long CountOfClustersOfDataRegion(BS_BPB_FAT32 b);
	unsigned long CountOfClustersOfDataRegion(BS_BPB_FAT16 b);
	FATTYPE GetFatType(BS_BPB_FAT32 b);
	FATTYPE GetFatType(BS_BPB_FAT16 b);
	unsigned long ClusterPosition(BS_BPB_FAT32 b, unsigned short N,unsigned long &ThisFATEntOffset, unsigned char nFATNum=0);
	unsigned long ClusterPosition(BS_BPB_FAT16 b, unsigned short N,unsigned long &ThisFATEntOffset, unsigned char nFATNum=0);
	unsigned long ReadClusterEntryValue(BS_BPB_FAT32 b, unsigned short N);
	unsigned long ReadClusterEntryValue(BS_BPB_FAT16 b, unsigned short N);
	unsigned long GetFat32Entry(unsigned long FAT32ClusEntryVal, unsigned long& Fat32EntryHighOrder);
	void WriteClusterEntryValue(BS_BPB_FAT32 b, unsigned short N, unsigned long FAT32ClusEntryVal = 0, unsigned short FAT16ClusEntryVal = 0);
	void WriteClusterEntryValue(BS_BPB_FAT16 b, unsigned short N, unsigned long FAT12ClusEntryVal = 0, unsigned short FAT16ClusEntryVal = 0);
	bool IsEndOfClusterChain(unsigned long FATContent, BS_BPB_FAT32 b);
	bool IsEndOfClusterChain(unsigned long FATContent, BS_BPB_FAT16 b);
	unsigned long GetFatEOCMark(BS_BPB_FAT32 b);
	unsigned long GetFatEOCMark(BS_BPB_FAT16 b);
	unsigned long GetFATBadClusterMark(BS_BPB_FAT32 b);
	unsigned long GetFATBadClusterMark(BS_BPB_FAT16 b);
	void CountOfSectorsForFAT(BS_BPB_FAT32& b, unsigned long DskSize);
	void CountOfSectorsForFAT(BS_BPB_FAT16& b, unsigned long DskSize);
	unsigned short FirstRootDirSecNum(BS_BPB_FAT16 b);
	unsigned short FirstRootDirSecNum(BS_BPB_FAT32 b);
	unsigned long FirstRootDirByteNum(BS_BPB_FAT16 b);
	unsigned long FirstRootDirByteNum(BS_BPB_FAT32 b);
	void GetDiskGeometry16(unsigned short nSizeInMB, unsigned short& BytesPerSec, unsigned char& SecPerClus, unsigned long& TotalClusters, unsigned long& nDskSz);
	void CreateFileSystem16(BS_BPB_FAT16& bs_fat);
	unsigned short GetLastClusterUsed() { return m_nLastClusterUsed;}
	void IncLastClusterUsed() { m_nLastClusterUsed++; }
protected:
	unsigned short m_nLastClusterUsed;
	Sector* m_pSectors;
};
