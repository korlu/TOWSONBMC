

#include <stdio.h>
#include <stdlib.h>
#include <conio.h>
#include <string.h>
#include <time.h>

#include "flpdsk.h"


extern unsigned char mdisk[FLOPPY_SIZE];

unsigned char mdisk[FLOPPY_SIZE];


floppymng :: floppymng()
{
	int i;
	
	unsigned char b=0x00;
	unsigned char *a=&b;

	myflp.f_userp.f_size=FLOPPY_SIZE;
	myflp.f_userp.f_tracks=FLOPPY_TRACKS;
	myflp.f_userp.f_heads=FLOPPY_HEADS;
	myflp.f_userp.f_sectors=FLOPPY_SECTORS;
	myflp.f_userp.f_secsize=FLOPPY_SECSIZE;

	myflp.c_heads=0;
	myflp.c_track=0;
	myflp.c_sector=1;

	filename="mydisk.dat";
	
	if((mydisk=fopen(filename,"w+b"))==NULL)
	{
		printf("can not open %s\n",filename);
	}

	fseek(mydisk,0,SEEK_SET);

	for(i=0;i<FLOPPY_SIZE;i++)
		fwrite(a,sizeof(unsigned char),1,mydisk);
	
};

void floppymng ::mformat()
{
	printf("Formatting...\n");
	unsigned char BPB[BPB_SIZE]={0x00,0x02,0x01,0x01,0x00,0x02,0xe0,0x00,0x40,0x0b,0xf0,0x09,0x00,0x12,0x00,0x02,0x00,0x00,0x00};
	fseek(mydisk,0x0b,SEEK_SET);
	fwrite(BPB,sizeof(unsigned char),BPB_SIZE,mydisk);

	unsigned char FAT[]={0xf0,0xff,0xff};
	fseek(mydisk,FLOPPY_SECSIZE,SEEK_SET);
	fwrite(FAT,sizeof(unsigned char),3,mydisk);

	printf("=======================================\n");
	printf("Free space:  %d Bytes (%d Sectors)\n",freespace(),freespace()/FLOPPY_SECSIZE);	
	printf("Format completed.\n");
	printf("=======================================\n");
}

void floppymng ::mwrite(char * inputfile)
{
	int i=0,j;
	int FILE_SIZE;
	int fspace;
	int position;
	unsigned short cluster=0;
	unsigned short clusterN=0,clusterO=0;
	unsigned short l_sector;
	int flend=0x0fff;
	unsigned char checkf;
	
	FILE *input;

	printf("%s\n",filename);

	printf("Inputfile file name: %s\n",inputfile);

	if((input=fopen(inputfile,"rb"))==NULL)
	{
		printf("can not open file: %s\n",inputfile);
		return;
	}

	fseek(input,0,SEEK_SET);
	while(!feof(input))
	{
		fread(&mdisk[i],sizeof(unsigned char),1,input);
		i++;
	}

	FILE_SIZE=i-1;

	printf("Read in file: %s\n",inputfile);
	printf("File size: %d\n",FILE_SIZE);

	fspace=freespace();
	if(fspace<FILE_SIZE)
	{
		printf("No space!\n");
		printf("Writing file failed!\n");
		fclose(input);
		return;
	}

	printf("Writing...\n");
	
	int size=FILE_SIZE;

	clusterN=findclstr();

	for (i=0;i<=FILE_SIZE/FLOPPY_SECSIZE;i++)
	{
		clusterO=cluster;
		cluster=clusterN;		

		if(i==0)
		{
			j=-1;
			do
			{
				j++;
				position=19*FLOPPY_SECSIZE+j*32;
				fseek(mydisk,position,SEEK_SET);
				fread(&checkf,sizeof(unsigned char),1,mydisk);				
			}
			while(j!=224 && checkf!=0x00);

				position=19*FLOPPY_SECSIZE+j*32;
				fseek(mydisk,position,SEEK_SET);
				fwrite(inputfile,sizeof(unsigned char),12,mydisk);
				fseek(mydisk,position,SEEK_SET);
				fseek(mydisk,26,SEEK_CUR);
				fwrite(&cluster,sizeof(unsigned short),1,mydisk);
				fwrite(&FILE_SIZE,sizeof(int),1,mydisk);
		}
		else
			writeFAT(clusterO,clusterN);

		l_sector=ClstToLsec(cluster);

		LsecToPsec(l_sector);

		position=PsecToFile();

		fseek(mydisk,position,SEEK_SET);
		if(size>FLOPPY_SECSIZE)
		{
			for(j=0;j<FLOPPY_SECSIZE;j++)
				fwrite(&mdisk[i*FLOPPY_SECSIZE+j],sizeof(unsigned char),1,mydisk);
			size=size-FLOPPY_SECSIZE;
			writeFAT(cluster,flend);
			clusterN=findclstr();
		}
		else
		{
			for(j=0;j<size;j++)
				fwrite(&mdisk[i*FLOPPY_SECSIZE+j],sizeof(unsigned char),1,mydisk);
			writeFAT(cluster,flend);
		}

	}

	fclose(input);

	printf("End of writing file.\n");
	printf("==========================================\n");


};

void floppymng ::mread(char *outputfile)
{
	printf("Reading...\n");
	int i=0,j;
	unsigned char output[12];
	unsigned short cluster, nextcluster;
	unsigned short l_sector;
	int position;
	int flsize,size;
	bool filefound;

	j=-1;
	do
	{
		j++;
		position=19*FLOPPY_SECSIZE+j*32;
		fseek(mydisk,position,SEEK_SET);
		fread(output,sizeof(unsigned char),12,mydisk);

		for(i=0;i<12;i++)
		{
			if(output[i]!=outputfile[i])
			{
				filefound=false;
				break;
			}
			else
				filefound=true;
		}
		

	}while(j!=224 && outputfile!=""&&filefound==false);

	if(filefound==false)
	{
		printf("File not found.\n");
		printf("==============================\n");
		return;
	}

	printf("Reading file: ");
	for(i=0;i<12;i++)
	{
		printf("%c",outputfile[i]);
	}
	printf("\n");

	position=19*FLOPPY_SECSIZE+j*32;
	fseek(mydisk,position,SEEK_SET);
	fseek(mydisk,26,SEEK_CUR);

	fread(&nextcluster,sizeof(unsigned short),1,mydisk);

	position=19*FLOPPY_SECSIZE+j*32;
	fseek(mydisk,position,SEEK_SET);
	fseek(mydisk,28,SEEK_CUR);
	fread(&flsize,sizeof(int),1,mydisk);

	size=flsize;

	i=0;
	while(nextcluster!=0x0fff)
	{
		cluster=nextcluster;
		l_sector=ClstToLsec(cluster);
		LsecToPsec(l_sector);
		position=PsecToFile();
		fseek(mydisk,position,SEEK_SET);

		if(size<FLOPPY_SECSIZE)
			for(j=0;j<size;j++)
				fread(&mdisk[i*512+j],sizeof(unsigned char),1,mydisk);
		else
		{
			for(j=0;j<FLOPPY_SECSIZE;j++)
				fread(&mdisk[i*512+j],sizeof(unsigned char),1,mydisk);
			size=size-FLOPPY_SECSIZE;
		}

		nextcluster=readFAT(cluster);
		i++;
	}
	
	for(i=0;i<flsize;i++)
		printf("%c",mdisk[i]);
	printf("\n");

	printf("End of reading file.\n");
	printf("====================================\n");
	

}

void floppymng ::mdelete(char *deletefile)
{
	printf("Deleting...\n");
	int i=0,j;
	unsigned char output[12];
	unsigned short cluster, nextcluster;
	unsigned short l_sector;
	int position;
	int fposition;
	int flsize,size;
	bool filefound;

	unsigned char a=0x00;


	j=-1;
	do
	{
		j++;
		position=19*FLOPPY_SECSIZE+j*32;
		fseek(mydisk,position,SEEK_SET);
		fread(output,sizeof(unsigned char),12,mydisk);

		for(i=0;i<12;i++)
		{
			if(output[i]!=deletefile[i])
			{
				filefound=false;
				break;
			}
			else
				filefound=true;
		}		

	}while(j!=224 && deletefile!=""&&filefound==false);

	if(filefound==false)
	{
		printf("File not found.\n");
		printf("==============================\n");
		return;
	}
	
	printf("Deleting file: ");
	for(i=0;i<12;i++)
	{
		printf("%c",deletefile[i]);
	}
	printf("\n");

	position=19*FLOPPY_SECSIZE+j*32;
	fposition=position;
	fseek(mydisk,position,SEEK_SET);
	fseek(mydisk,26,SEEK_CUR);

	fread(&nextcluster,sizeof(unsigned short),1,mydisk);

	position=19*FLOPPY_SECSIZE+j*32;
	fseek(mydisk,position,SEEK_SET);
	fseek(mydisk,28,SEEK_CUR);
	fread(&flsize,sizeof(int),1,mydisk);

	size=flsize;

	i=0;
	while(nextcluster!=0x0fff)
	{
		cluster=nextcluster;
		l_sector=ClstToLsec(cluster);
		LsecToPsec(l_sector);
		position=PsecToFile();
		fseek(mydisk,position,SEEK_SET);

		if(size<FLOPPY_SECSIZE)
			for(j=0;j<size;j++)
				fwrite(&a,sizeof(unsigned char),1,mydisk);
		else
		{
			for(j=0;j<FLOPPY_SECSIZE;j++)
				fwrite(&a,sizeof(unsigned char),1,mydisk);
			size=size-FLOPPY_SECSIZE;
		}

		nextcluster=readFAT(cluster);
		writeFAT(cluster,a);
		i++;
	}

	fseek(mydisk,fposition,SEEK_SET);
	fwrite(&a,sizeof(unsigned char),1,mydisk);


	printf("End of Delete.\n");
	printf("=============================\n");

}







void floppymng ::writeFAT(int cluster, int clusterN)
{
	unsigned short fat,mypool;
	int a;
	fseek(mydisk,FLOPPY_SECSIZE,SEEK_SET);
	fseek(mydisk,int(cluster/2)*3,SEEK_CUR);
	if(cluster%2==0)
	{
		fread(&fat,sizeof(unsigned short),1,mydisk);
		mypool=int(fat/(16*16*16));
		fat=clusterN+mypool*(16*16*16);
		fseek(mydisk,FLOPPY_SECSIZE,SEEK_SET);
		a=int(cluster/2)*3;
		fseek(mydisk,a,SEEK_CUR);
		fwrite(&fat,sizeof(unsigned short),1,mydisk);
	}
	else
	{
		fseek(mydisk,1,SEEK_CUR);
		fread(&fat,sizeof(unsigned short),1,mydisk);
		mypool=fat%16;
		fat=clusterN*16+mypool;
		fseek(mydisk,FLOPPY_SECSIZE,SEEK_SET);
		a=int(cluster/2)*3;
		fseek(mydisk,a,SEEK_CUR);
		fseek(mydisk,1,SEEK_CUR);
		fwrite(&fat,sizeof(unsigned short),1,mydisk);

	}

	
}


int floppymng ::readFAT(int cluster)
{
	unsigned short mypool,a;
	fseek(mydisk,FLOPPY_SECSIZE,SEEK_SET);
	a=int(cluster/2)*3;
	fseek(mydisk,a,SEEK_CUR);

	if(cluster%2==0)
	{
		fread(&mypool,sizeof(unsigned short),1,mydisk);
		mypool=mypool%(16*16*16);
		return mypool;
	}
	else
	{
		fseek(mydisk,sizeof(unsigned char),SEEK_CUR);
		fread(&mypool,sizeof(unsigned short),1,mydisk);
		mypool=int(mypool/16);
		return mypool;
	}
}


int floppymng ::freespace()
{
	int i,j=0;
	int position;
	unsigned short cur_state;

	for (i=0;i<int(FLOPPY_SIZE/512)-31;i++)
	{
		position=int(i/2)*3+FLOPPY_SECSIZE;
		fseek(mydisk,position,SEEK_SET);
		if(i%2==0)
		{
			fread(&cur_state,sizeof(unsigned short),1,mydisk);
			cur_state=cur_state%(16*16*16);
		}
		else
		{
			fseek(mydisk,sizeof(unsigned char),SEEK_CUR);
			fread(&cur_state,sizeof(unsigned short),1,mydisk);
			cur_state=int(cur_state/16);
		}
		if(cur_state==0)
			j++;
	}

	return j*FLOPPY_SECSIZE;
}

int floppymng ::ClstToLsec(unsigned short cluster)
{
	return cluster+31;
}

void floppymng ::LsecToPsec(unsigned short Lsector)
{
	myflp.c_track=int(Lsector/(18*2));
	myflp.c_heads=int((Lsector%(18*2))/18);
	myflp.c_sector=Lsector%18+1;
}

int floppymng ::PsecToFile()
{
	int position;
	position=(myflp.c_track*36+myflp.c_heads*18+(myflp.c_sector-1))*FLOPPY_SECSIZE;
	return position;
}

int floppymng ::findclstr()
{
	int i;
	unsigned short fat;
	for(i=2;i<FLOPPY_HEADS*FLOPPY_TRACKS*FLOPPY_SECTORS-31;i++)
	{
		if(i%2==0)
		{
			fseek(mydisk,FLOPPY_SECSIZE,SEEK_SET);
			fseek(mydisk,int(i/2)*3,SEEK_CUR);
			fread(&fat,sizeof(unsigned short),1,mydisk);
			fat=fat%(16*16*16);
			if(fat==0)
				return i;
		}
		else
		{
			fseek(mydisk,FLOPPY_SECSIZE,SEEK_SET);
			fseek(mydisk,int(i/2)*3,SEEK_CUR);
			fseek(mydisk,1,SEEK_CUR);
			fread(&fat,sizeof(unsigned short),1,mydisk);
			fat=int(fat/16);
			if(fat==0)
				return i;
		}
	}

	return -1;
}

floppymng ::~floppymng()
{
	fclose(mydisk);
};