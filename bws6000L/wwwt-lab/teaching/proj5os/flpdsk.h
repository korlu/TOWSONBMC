
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <conio.h>
#include <string.h>
#include <time.h>


struct fdparms		/*floppy structure*/
{
	int		f_size;		/*Size of disk in bytes*/
	int		f_tracks;	/*Total tracks*/
	int		f_heads;	/*Number of heads*/
	int		f_sectors;	/*Sectors/track*/
	int		f_secsize;	/*How big are the sectors in the disk drive?*/
};

#define FLOPPY_SIZE 1474560
#define FLOPPY_TRACKS 80
#define	FLOPPY_HEADS 2
#define	FLOPPY_SECTORS 18
#define FLOPPY_SECSIZE 512

#define BPB_SIZE 19

struct floppy		/*floppy state*/
{
	fdparms f_userp;		/*User defined floppy parameters*/
	unsigned int c_track;		/*current track number*/
	unsigned int c_heads;		/*current head number*/
	unsigned int c_sector;		/*current sector number*/

};


class floppymng
{
private: 
		floppy myflp;
		FILE *mydisk;
		
		char *filename;

		int ClstToLsec(unsigned short cluster);
		void LsecToPsec(unsigned short Lsector);
		int PsecToFile();
		int findclstr();
		void writeFAT(int cluster,int clusterN);
		int readFAT(int cluster);
		int freespace();

public: 
		floppymng();
		~floppymng();
		void mread(char *);
		void mwrite(char *);
		void mdelete(char *);
		void mformat();

};

