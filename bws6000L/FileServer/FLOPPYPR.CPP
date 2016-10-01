#include<stdio.h>
#include<conio.h>
#include<dos.h>
#include<string.h>
#include<limits.h>
#include<stdlib.h>
#include<alloc.h>
#define FSIZE 20
#define DISKNO 5
#define MAXFILE 150
#define MAXSIZE 1458688
int readlist(void);    //read list file
int readfile(char*,long); //read the size of file .calc the sector
int readsector(int,long);
int writesector(int);
int writefile(void);   //read a file and write
int writeindex(int,char);
int convto8(char *input, char *output);
int format(void);
char filebuffer[512];
long total_sectors=2849;
long ava_sectors=total_sectors;
long startLSect=31;
int diskNo=1;
struct floppy_index
{
char  file_name[80];
long  filesectors;
long  start;
long  end;
long  filesize;
}nfile[MAXFILE];

void main(void)
{
//int fcheck=0;
clrscr();
//format();
//fcheck =
diskNo=1;
printf("\n\t\tAOA web disc creation\n");
//printf("Index::Name  Size(Bytes)  Total Sec  Start Sec  End Sec");
//char input[80]="c:\\abcdefghij\\987654321\\12345678\\abcc122.doce";
//char output[80];
//convto8(input,output);

readlist();



getch();
}

int readlist(void)
{
	FILE *listfile;
	char *filename="C:\\disk\\reu\\index.txt";
	char file[80]="\n";
	//char file1[80];
	long f=0;
	long index=0; //just for file count for one floppy
	int flag=0;

	listfile=fopen(filename,"rb");

	       if(listfile==NULL)
	       {
	       printf("\nError: Could not open file %s",filename);
	       return 3; //indexfile could not open
	       }

 Label1: while(1)
		{
			if(file[0]=='x' && file[1]=='y' && file[2]=='z')
			{
		       //	printf("Total Files in Index File %ld",index);

				if(index==0)
				{
					if(diskNo==1)
					{
					printf("\nError:No files in the list");
					fclose(listfile);
					return 0;
					}
					else
					{
					 int fcheck=0;
		       Errormsg:         printf("\n1:Insert Disk No. %d,The Last Inserted Disk",diskNo);
					 printf("\nPress any key...");
					 getch();
					 int k=30;
					 int flag_found=0;
					 do{
					 fcheck=absread(0,1,k,filebuffer);
						 if(fcheck!=0)
						 {
						  goto Errormsg;
						 }
						 if(filebuffer[484]!=(char)diskNo)
						 {
						 goto Errormsg;
						 }
						 if(filebuffer[483]=='N')
						 {
						 filebuffer[483]='E';
						 fcheck=abswrite(0,1,k,filebuffer);
						 flag_found=1;
							if(fcheck!=0)
							 {
							  goto Errormsg;
							 }
						fclose(listfile);
						return 0;
						}
					 k--;
					 }while(k>=1 || flag_found!=1);

					}
				fclose(listfile);
				return 0;
				}
				printf("\nWriting Disk %d",diskNo);
				format();
				writesector(f);
				writeindex(f,'E');
				//printf("index=%d",index);
				fclose(listfile);
				return 0;//eof file reached in index file

			     }
		      else
		     {
		     index++;
		     }

		fscanf(listfile,"%s",file);


		if(file[0]=='x' && file[1]=='y' && file[2]=='z')
		{
		goto Label1;
		}
		else
		{
			flag =0;
			flag = readfile(file,f);
			if(flag==-3)
			{
			   index--;
			}
		}
		f++;

			if (flag==-1 || (f-1)>=(MAXFILE-1))
			{
			long temp;
			printf("\nWriting Disk %d",diskNo);
			format();
			writesector(f);
			writeindex(f,'N');
			diskNo++;

			flag = 0;
			ava_sectors=total_sectors;
			index = 0;
			f=0;
			floppy_index zeroIndex;
			zeroIndex.file_name[0]='\0';
			zeroIndex.filesize=0;
			zeroIndex.filesectors=0;
			zeroIndex.start=0;
			zeroIndex.end=0;
			for(int i=0;i<150;i++)
			{
			nfile[i]=zeroIndex;
			}
	     Errormsg1:	printf("\nEnter disc %d\n.....",diskNo);
			int fcheck1=absread(0,1,1,filebuffer);
			 if(fcheck1!=0)
			 {
			   goto Errormsg1;
			 }

			//check disk by reading first sector
			goto Label1;

			}

			if(flag==-2)
			{
			f--; //read the next file skipping the larger file
			index--;
			printf("\nError: Skiping file %s because file size is too large",file);
			}

		}


      // fclose(listfile);
	//printf("\nSize of Index:%d",sizeof(floppy_index));
      //	return 1;   //returns to main indicates task ended
	}

	int readfile(char *filename,long f)
	{
	FILE *mydisk;
	char buff[512];
	long size=0;
	long filesize=0;
	//int i=0;
	int sectors=1;
	char *ptr;
	//long lsect=31;

	char pathname[100];
	char output[80];
	pathname[0]='\0';
	strcat(pathname,"C:\\disk\\reu\\");


	strcat(pathname,filename);
	//printf("\npathname=%s",pathname);

	convto8(pathname,output);
	printf("\nfile %s",output);
	mydisk=fopen(output,"rb");

	       if(mydisk==NULL)
	      {
		printf("\nError: Could not open file %s",filename);
		return -3;//file in index could not open
	      }

	fseek(mydisk,0,SEEK_SET);
	while(1)
	{
	size = fread(buff,1,512,mydisk);
       //	printf("size=%d",size);
	filesize=size+filesize;
	sectors++;
      //	printf("sector=%d",sectors);
	if (size==0)
		{
		sectors=sectors-1;
		}
	if(size<512)
		{
		break;
		}
	}

	if (filesize>=MAXSIZE)//if file size is greater then 1.44MB it will skip it
	{
       //	printf("\nfilesize=%ld<%ld",filesize,MAXSIZE);
	return -2; //indicates file to large
	}
	ava_sectors=ava_sectors-(sectors-1);


       //	printf("\nAvailable sector=%ld",ava_sectors);

		if (ava_sectors<0) //no more sectors available to write
		{
		fclose(mydisk);
		return -1;  //Disk is full no
		}
		else
		 {
		  //printf("\n%d",f);
		  strcpy(nfile[f].file_name,filename);
		  //printf("::%s",nfile[f].file_name);
		  nfile[f].filesize=filesize;
		  //printf("\t%ld bytes",nfile[f].filesize);
		  nfile[f].filesectors=sectors-1;
		  //printf("\t%ld",nfile[f].filesectors);

			 if(f==0)
			 nfile[f].start=startLSect;
			 else
			 nfile[f].start=(nfile[f-1].end+1);

		  //printf("\t%ld",nfile[f].start);
		  nfile[f].end=nfile[f].start+nfile[f].filesectors-1;
		  //printf("\t%ld",nfile[f].end);
		  }


	fclose(mydisk);

     /*
      int nsects=nfile[index].filesectors;
      int fcheck=0;
      fcheck = readsector(nsects,lsect);
      //printf("\n%d",fcheck);
     if(fcheck==1)
     printf("\nAll Sectors are good");
     else
     printf("\nBad Sector Found");
     //	sleep(4);
     printf("i'm about to write %d,",lsect);
     fcheck=writesector(nsects,lsect);
      //	sleep(4);
    // fcheck = readsector(nsects,lsect);


*/      return 1;
	}

       //	int readsector(int nsects, long lsect)
       //	{
     /*	char buff[512];
	int i=0;
	int drive=0;
	nsects=1;
	i=absread(drive,nsects,lsect,&buff);
       printf("i=%d",i);
       //	printf("First 10 bytes");

       //	for(int k=0;k<10;k++)
     //		printf("\n0x%02x",buff[k]);
       */
      //	return 1;
      //	}

int writesector(int f)
{
//char buff[512];
FILE *mydisk;
int drive=0;
int wError=0;
int rCheck=0;

	//write index here
	//writing files
       //printf("\nf=%d",f);
	for(int i=0;i<f;i++)
	{
	printf("\nDisk No:%d",diskNo);
	printf(" File No: %d",i);
	printf("  Filename: %s",nfile[i].file_name);
	char output[80];
	char pathname[100]="C:\\disk\\reu\\";
	strcat(pathname,nfile[i].file_name);
	//printf("\npathname=%s",pathname);
	convto8(pathname,output);
	printf("\nfile %s",output);
	mydisk=fopen(output,"rb");


	       if(mydisk==NULL)
	       {
	       printf("\nError:WS Cannot open file %s",nfile[i].file_name);
	       continue;//file in index could not open
	       }

	fseek(mydisk,0,SEEK_SET);

		for(int s=nfile[i].start;s<=nfile[i].end;s++)
		 {
			for(int j=0;j<512;j++)     //clean the buffer
			{
			filebuffer[j]=0x00;
			}

		 rCheck = fread(filebuffer,1,512,mydisk);  //read in buffer
		 if(rCheck==0)
			 {
			 printf("\nError: File Read Error %s",nfile[i].file_name);
			 //goto
			 break;
			 }

		 wError=abswrite(drive,1,s,filebuffer);      //one sector at a time
		       //printf("\ns=%d",s);
			 if(wError!=0)
			 {
			 printf("\nError: Cannot write sector %d",s);
			 //goto
			 break;
			 }
		 }
	fclose(mydisk);
	}

	printf("\n");
return 1;
}

int writeindex(int index,char status)
{
int flag=0;
int count=0;
int totalFiles = index;
int filesPerSec = 512/sizeof(floppy_index);
int numofSectors = index/filesPerSec;
int fileNumber=0;

if((index%filesPerSec)>0)
{
	numofSectors++;
}
//printf("\nNumber of sec %d",numofSectors);
//printf("\nNumber of sec %d",filesPerSec);
floppy_index *stptr;
printf("\nTotal files in index=%d",index);
//return 0;
for(int j=1;j<=numofSectors;j++)
{
	stptr=(floppy_index*)filebuffer;
	for(int k=0;k<512;k++)     //clean the buffer
	{
		filebuffer[k]=0x00;
	}
	for(int i=0;i<filesPerSec;i++)
	{
		strcpy(stptr->file_name,nfile[fileNumber].file_name);
		//printf("\nfilename=%s",stptr->file_name);
		stptr->filesectors=nfile[fileNumber].filesectors;
		stptr->filesize=nfile[fileNumber].filesize;
		stptr->start=nfile[fileNumber].start;
		stptr->end=nfile[fileNumber].end;
		count++;
		fileNumber++;
		stptr++;
		totalFiles--;
		if(totalFiles<=0)
		{ break;}
	}
	if(totalFiles==0)
	{
		printf("\nif=%d",i+1);
		filebuffer[482]=(char)(i+1);
		filebuffer[483]=status;
		filebuffer[484]=(char)diskNo;
		flag=abswrite(0,1,j,filebuffer);
	       if(flag!=0)
	       {return -1;}
		printf("\nDisks successfully created");
		return 0;
	}
	else
	{
		printf("\nelse %d",i);
		filebuffer[482]=(char)(i);
		filebuffer[483]='C';
		filebuffer[484]=(char)diskNo;
		flag=abswrite(0,1,j,filebuffer);

		if(flag!=0)
		{
		return -1;
		}
	}

}
return 0;
}
//floppy_table *indexPoint;
//indexPoint=nfile;
//abswrite(0,1,30,indexPoint);


// return 1;




//}



	int format(void)
	{

	char *formatbuffer[512];
	char *formatbuffer1[512];
	LoopBack:
	printf("\nInsert new disk for drive A:");
	printf("\nand press ENTER when ready");
	printf("\npress N to calcel format");
	char c = getch();
	if(c=='N'|| c=='n')
	{
	printf("\nDisks creation failure Exiting......");
	getch();
	exit(0);
	}
	printf("\nFormating Diskette.....");
	printf("\nAOA WebServer Disk.....");
	for(long i=0;i<512;i++)
	formatbuffer[i]=0x00;
	//printf("\nhere");
	printf("\n");
	float temp1=0;
	float temp2=0;
	float temp3=0;
	for(float a=1;a<2880;a++)
	{
		i=abswrite(0,1,a,formatbuffer);
		if(i==-1)
		{
		printf("\nError: Disk Error cannot format disk ");
		goto LoopBack;
		}
		temp1 = a/2880;
		temp2 = temp1*50;
		printf("\r%3.0f percentage completed",temp2);
	}
	sleep(4);
	for(a=1;a<2880;a++)
	{

		i = absread(0,1,a,formatbuffer1);
		if(i==-1)
		{
		printf("\nError: Disk Error cannot format disk");
		goto LoopBack;
		}
		temp1 = a/2880;
		temp2 = temp1*50;
		temp3 = temp2+50;
		printf("\r%3.0f percentage completed",temp3);
	}

	printf("\nDisk Format Completed");
	return 0;
	}
int convto8(char *input, char *output)
{
char name[80];
  int i=0;
  int j=0;
  output[0]='\0';
  while(input[i]!='\0')
  {
  name[j] = input[i];
  j++;
  if(input[i]=='\\')
  {
	if(j>9)
	{
	 name[6]='~';
	 name[7]='1';
	 name[8]='\\';
	 name[9]='\0';
	 j=0;
	 strcat(output,name);
	}
	else
	{

	name[j]='\0';

	j=0;
	strcat(output, name);
	}
  }
  i++;
  }
  name[j]='\0';
  for(int k=0;k<j;k++)
  {
      if(name[k] == '.')
      {
	if(k>8)
	{
	name[6]='~';
	name[7]='1';
	name[8]='.';
	name[9]=name[k+1];
	name[10]=name[k+2];
	name[11]=name[k+3];
	name[12]='\0';
	strcat(output,name);
	return 0;
	}
	else
	{
	  if(name[k+4]!='\0')
	  {
	  name[k+4]='\0';
	  name[k-1]='1';
	  name[k-2]='~';
	  }
	  else
	  {
	  name[k+4]='\0';
	  }
	  strcat(output,name);
	  return 0;
	}
      }
  }
 return 0;
}