//******************************************************
// This is HttpIndex.cpp file 
//******************************************************
#include"httpIndex.h"
#include"../INTERFACES/AOAProtected.h"

// The Static Variable definition starts here
unsigned long HttpIndex::ResourceIndexBase=0;		// Base address of the HTTP Resource Index
	
unsigned long HttpIndex::ResourceBufferBase=0;		// Base address of the HTTP Resource Buffer

unsigned int HttpIndex::ResourceIndexCount=0;		// Max Index count of the HTTP Resource
	
unsigned long HttpIndex::ResourceBufferSize=0;		// Maximum Size of the Buffer allocated fo the HTTP Resource
	
unsigned long HttpIndex::ResourceIndexSize=0;		// Maximum Index size of the of the Resource

unsigned long HttpIndex::ResourcePtr=0; 		// Points to the current buffer address to store the next file;
	
unsigned long HttpIndex::ResourceIndexPtr=0;		// Points to the current index to store the next file

int HttpIndex::DiskNo=0;				// Disk Number is initially 1

// Funation Definition Starts Here
// ***************************************************************************
// This is the method called globally to initialize the object all the static values will be initialized in this method
// This methosd must be called only onec per program
// Returns -1 if the buffer size is much less 
int HttpIndex::init(unsigned long BufferBase, unsigned long BufferSize, int BufferIndexCount, int hashIndexCount)
{
	// Local variable declarations
	AOAProtected io;
	long HashIndexSize =0;
	HashIndexSize = h.init(hashIndexCount,BufferBase);
	
	if(BufferSize < (((BufferIndexCount * sizeof(ResourceIndex))*10)+HashIndexSize))
	{
	    return -1;
	}
	
	ResourceIndexBase = BufferBase+HashIndexSize;		

	ResourceBufferBase=(BufferBase + (sizeof(ResourceIndex)*BufferIndexCount) + HashIndexSize);
	
	ResourceIndexCount=BufferIndexCount;		
	
	ResourceIndexSize=sizeof(ResourceIndex)*BufferIndexCount;

	ResourceBufferSize=BufferSize-ResourceIndexSize;	
	
	ResourcePtr=ResourceBufferBase; 		
	
	ResourceIndexPtr=0;
	
	DiskNo=1;

	return 0;
}

// Read the floppy and put it in the buffer
int HttpIndex::readFloppy()
{
	AOAProtected io;
	char a='C', buffer[700],b='C', buffer1[512];
	int i= StartIndexSector;
	int k=0;
	int NoFilesSectors=0;
	int TotalFilesRead=0;
	DiskNo=1;
	FloppyResourceIndex *tmpindex;
	ResourceIndex *tmpresourceindex, *tmpres;
    	tmpresourceindex =(ResourceIndex*)ResourceIndexBase;
		
	unsigned long filesize=0;
	int m=0,n=0;
	unsigned long HashValue;
	char *ResourcePtr1;	
	a='N';
	//1
	while(a=='N')
	{
LoopBack:
	    io.AOAPrintText("InsertDisk",Line10);
	    io.AOAprintDecimal(DiskNo,Line10+22);
	    io.AOAPrintText("and press ENTER when ready...",Line10+42);
	    io.AOAgetCharacter();
	    io.AOAPrintText("                               ",Line9);
	    // 2
	    if(a=='N')
	    {
	    i=1;
	    }
	    // ~2
	    a='C';
	    m=0,n=0;	
	    ResourcePtr1=(char*)ResourcePtr;

	    while(a=='C')
	    {
	    //3
	    //io.AOAPrintText("A",Line19);

	    // Initialize the tmpResourceStructure 
	    io.AOAreadFloppy(buffer,i);
	    tmpindex = (FloppyResourceIndex*)buffer;
	    if(((int)buffer[484]) != DiskNo)
	    {//4
	   	//	io.AOAPrintText("B",Line19);	
	   		io.AOAPrintText("Error:Wrong Disk ",Line9);
	   		io.AOAprintDecimal(buffer[484],Line9+40);
	   		goto LoopBack; 
	    }//~4
   	    //io.AOAPrintText("C",Line19); 
	    
	    NoFilesSectors =(int)buffer[482];
	    //************************************************
	    io.AOAPrintText("No of files indexed in this sector:", Line7);
	    io.AOAprintDecimal(NoFilesSectors,Line7+72);
	    io.AOAPrintText("Index Sector:",Line8);
	    io.AOAprintHex(i,Line8+28);
	    //************************************************
	    i++;
	    if(NoFilesSectors>FilesPerSectorIndex)
	    	{//5
		   // io.AOAPrintText("D",Line19);	
		    return -1;
	        }//~5
   	    //io.AOAPrintText("E",Line19); 
   	        for(k=0;k<NoFilesSectors;k++)
	    	{//6
      	    		//io.AOAPrintText("F",Line19);  
			//Read the file and place it in the memory
			sstrcpy(tmpresourceindex[ResourceIndexPtr].FileName,sizeof(tmpresourceindex[ResourceIndexPtr].FileName),tmpindex->FileName, sizeof(tmpindex->FileName));
			tmpresourceindex[ResourceIndexPtr].StartAddress=(long)ResourcePtr;
			tmpresourceindex[ResourceIndexPtr].FileSize=tmpindex->FileSize;
			tmpresourceindex[ResourceIndexPtr].NextPtr=0x00000000;	
			filesize=tmpindex->FileSize;

			//************************************************************************//
			io.AOAPrintText("Disk Number:",Line5);
			io.AOAprintDecimal(DiskNo,Line5+28);
			io.AOAPrintText("                                                                                ",Line3);		
			io.AOAPrintText("File Name:",Line5+60);
			io.AOAPrintText(tmpresourceindex[ResourceIndexPtr].FileName,Line5+80);
			io.AOAPrintText("File Size:",Line6+60);
			io.AOAprintDecimal(tmpresourceindex[ResourceIndexPtr].FileSize,Line6+80);
			io.AOAPrintText("File Number:",Line6);
			io.AOAprintHex((((i-2)*5)+k+1),Line6+28);
			io.AOAPrintText("Index Sector->File Number:",Line7);
			io.AOAprintDecimal((k+1),Line7+50);
			
			//while(i++<0xFFFFFFF);	
			/**************************************************************************/
			
			HashValue = h.hashfun((&(tmpresourceindex[ResourceIndexPtr].FileName[0])),(sstrlen(tmpresourceindex[ResourceIndexPtr].FileName)));
			if(h.getIndex(HashValue) == 0)
			{
			   
			    h.setIndex(HashValue,(unsigned long)(&tmpresourceindex[ResourceIndexPtr]));
			   

			}
			else
			{
			tmpres =(ResourceIndex*)h.getIndex(HashValue);	
			while(tmpres->NextPtr != 0x00000000)	
			{
				if(sstrcmp(tmpres->FileName,tmpresourceindex[ResourceIndexPtr].FileName) == 0)
				{
				    io.AOAPrintText("Error:File exists",Line10);
				    goto FileExist;
				}
				tmpres = (ResourceIndex*)(tmpres->NextPtr);	
			}
			if(sstrcmp(tmpres->FileName,tmpresourceindex[ResourceIndexPtr].FileName) == 0)
			{
			    io.AOAPrintText("Error:File exists",Line10);
			    goto FileExist;
			}
			else
			{
			    tmpres->NextPtr = (unsigned long)(&tmpresourceindex[ResourceIndexPtr]);
			}
			
			
			}
		 	
			
	      	    	//io.AOAPrintText("M",Line19);  	
			for(m=tmpindex->StartSector;m<=tmpindex->EndSector;m++)
			{
	        	     //io.AOAPrintText("N",Line19);   
			     io.AOAreadFloppy(buffer1,m); 
			     
			     for(n=0;(n<512 && filesize>0);n++)
			     {
		    	    	//io.AOAPrintText("O",Line19);  
				
				*ResourcePtr1=buffer1[n];
				ResourcePtr1++;
				if(((long)ResourcePtr1) > (ResourceBufferBase+ResourceBufferSize))
				{
  	        	    	    //io.AOAPrintText("P",Line19);   
	   			      io.AOAPrintText("DiskWriteComplete:Insufficient Space in the ResourceBuffer",Line11); 
				    return -3;		
				}
		    	    	//io.AOAPrintText("Q",Line19);  	
				ResourcePtr++;
				filesize--;
			     }
			}
		
			if((ResourceIndexPtr+1)>ResourceIndexCount)
			{//13
	        	    //io.AOAPrintText("R",Line19);   
			      io.AOAPrintText("DiskWriteComplete:Insufficient Space in the ResourceIndex",Line11);
			    return -2;
			}//~13
			ResourceIndexPtr++;
	      	    	//io.AOAPrintText("S",Line19);  	
			FileExist:	
			    tmpindex++;
	    	}//~6
	    a= buffer[483];
	    io.AOAPrintText("Status Character:",Line8);
	    io.AOAprintCharacter(a,Line8+36);
	    //io.AOAPrintText("T",Line19);  
	    }//~3
	    if(a=='N')
	    {
	    DiskNo++;
	    }

	    //io.AOAPrintText("U",Line19);   
	}//~1
	    if(a=='E')
	    {
	    io.AOAPrintText("Files loaded successfully",Line11);
	    //io.AOAPrintText("V",Line19);  	
	    }
	    else
	    {
	    io.AOAPrintText("File Loading not Successful",Line11);	
	    io.AOAExit();
	    }
	return 0;
}

// Get the file used by the parser to get the file
int HttpIndex::getFile(char *FileName, unsigned long *FileStartAddress, unsigned long *FileSize)
{
    long HashValue=0;
    unsigned long IndexAddress;
    ResourceIndex *tmpres;
    HashValue = h.hashfun(FileName,sstrlen(FileName)); 
    IndexAddress=h.getIndex(HashValue);	
    AOAProtected io;
    
    while(IndexAddress != 0)
    {
	tmpres =(ResourceIndex*)IndexAddress;	 	
	
	if(sstrcmp(tmpres->FileName,FileName) == 0)
	{
	   //FileFound
	   *FileStartAddress=tmpres->StartAddress;
	   *FileSize=tmpres->FileSize;
	   return 0;
	}
	IndexAddress = tmpres->NextPtr;	
    }
    return -1;			
    // File not found
}

int HttpIndex::sstrcmp(char* D_Str,char* S_Str)
{
   int i=0;
   AOAProtected io;
   if(sstrlen(D_Str) != sstrlen(S_Str))
   {
       return -1;
   }
   
   while((D_Str[i]!=0x00 ||  S_Str[i]!=0x00))
   {
 //      if(D_Str[i]==0x00)
//	   break;
  //    if(S_Str[i]==0x00)
//	   break; 
       if(D_Str[i]==S_Str[i])
       {
	   i++;
       }
       else if(D_Str[i]=='/')
       {
	   if(S_Str[i]!='\\');
	   	return -1;
		i++;
       }
       else if(D_Str[i]=='\\')
       {
	   if(S_Str[i]!='/')
	   	return -1;
	   i++;
	
       }
       else if(D_Str[i] != S_Str[i])
       {
	   return -1;
       }
       
   }
   if(D_Str[i]==0x00 && S_Str[i]==0x00)
   {
       return 0;
   }
   else
   {
       return -1;
   }
   return -1;
}

int HttpIndex::sstrcpy(char* D_Str,int D_Size,char* S_Str,int S_Size)
{
int i=0;
int D_Full_flag = 0;
  if(D_Size < 2)
   {
    if(D_Size < 1)
      return -1; 
    if(D_Size == 1)
      {
       D_Str[0] = 0x00;
       return 0;
      }       
   }    
  if(S_Size < 2)
   {
     D_Str[0] = 0x00; 
     return 0; 
   } 
 while(S_Str[i]!=0x00)
   {
     if(i<D_Size)
     {
          if(i< S_Size) 
            D_Str[i] = S_Str[i];
          else
	   { 
            D_Str[i] = 0x00; 
            return 0; 
           } 
     }
     else
     { 
       D_Str[D_Size-1] = 0x00; 
       return 0; 
     }  
     i++;
   }
   if(i<D_Size)
   {
    D_Str[i] = 0x00;
   }
   else
   {
    D_Str[D_Size-1]=0x00; 
   }
return 0;
} 

int HttpIndex::sstrlen(char* str)
{
	int len;
	len = 0;
	//if the char in string is not '\0' then go on until it reaches the MaxLen
	while(str[len] != 0x00)   
	{
		len++;
	}
	return len;
}

