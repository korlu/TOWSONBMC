/*************************************************************************************
*  Project name:  File System Management
*
*  Course Number: Summer 519 Operating System I
*
*  Professer:     Dr.Ramesh Karne
*
*  Group Members: Yingshih Shen
*                 Natesh Subramanian
*                 Rajkumar Sivagananathan
*
*  Description:   This program is as a simulation for a file system. It is so-called
*                 file system that is because it can keep tracking stored information
*                 and operating phisical data in either hard drive or discatte appropiately.
*                 The info, which belongs to file(directory), has to be maintained by
*                 following structures
*                    -Directory Name (struct)
*                    -Bitmap (union)
*                    -Inode Block (struct)
*                    -Superblock (struct)
*                    -Data block (struct)
*                    -Directory block (struct)
*                    -Block (union)
*                To see the usages for the file operations in the program, you can use "help"
*                command for your reference.
*************************************************************************************/


#include <stdio.h>
#include <string.h>
#include "disk.h"

/* function prototyping */

void valid_array();
int parse();
int quit();
int mkfs();
int mount();
int unmount();
int mkdir();
int write();
int read();
int ls();
int symlink();
int live();
int part();
int help();
int recdel();
int recls();
int renm();
int deld();
int delfile();
int create();
int append();
int truncate();
int cp();
void error(int a);
int dir();
int pwd();
int chmod();



int parsePath(char *path);

int ls_flag=0;
int sym_flag=0;

typedef union
{
	int argar[4];
	struct
	{
		int ri, is, bs, fs, ib;
	}var;
} argument;


#define CMD 24

/* Flag	for identifying the file system is created or not. 0 is not; 1 is created */
short fs_r = 0;

/**
 * Typedef a function pointer type named function_ptr...
 */

typedef int (*function_ptr)();

/**
 * Array of function pointers corresponding to 2 dim. array
 * of program names so that I can strncmp the output to a
 * function name and map it through iteration on an array
 * rather than a switch statement.
**/


function_ptr func[CMD]={&quit, &mkfs, &mount, &unmount, &mkdir, &write,
&read, &ls, &symlink, &live, &part, &help, &recls, &recdel,
&renm,&deld,&delfile,&create, &append,&truncate, &cp, &dir, &pwd, &chmod};

char valid[CMD][10]={"quit", "mkfs", "mount", "unmount", "mkdir", "write",
"read", "ls", "symlink", "live", "part","help","recls","recdel","renm","deld","delfile","create",
"append","truncate","cp", "dir", "pwd", "chmod" };

char ERRNO[3][50]={"\tError: No filesystem mounted",
			"\tError: No filesystem to mount",
			"\tError: Filesystem already mounted"};


//Code by : Fall 2002
//Modified by : Summer 2003

int main()
{

	/**
	  * variable declaration
	  **/

	int i=1;
	printf("**********************************************************\n");
	printf("\t\tFILE SYSTEM MANAGEMENT \n");
    printf("\t      GROUP PROJECT : Summer 2003\n");
	printf("\t\t\tCOSC 519 \n");
    printf("**********************************************************\n");
	valid_array();

	/**
	  * Enter the parse loop
	  **/

	parse();
	return 0;
}


//Code by : Fall 2002
/**
  * Prints out the "valid" array..
  * quit is 0 so that the function return
  * being false will mean we know that
  * the quit command was issued.
  **/

void valid_array()
{
	int i=0;
	while(i < CMD)
	{
		printf("\t*** CMD #%d: %s  \t***\n", i, valid[i]);
		i++;
	}
}


/**
  * PRIMARY FUNCTION: PARSE LOOP, CMD PROMPT
  * the parser uses an array of function pointers
  * to call functions by index.
 **/
//Code by : Fall 2002
int parse()
{
	int i=1;
	char string[75];

	while(i != 0)
	{
		i=0;

		// the following line prints an extra prompt
		//after getchar in mkfs
		if(string[0]!='\n')printf("COSC519> ");

		/**
		 * Get input from stdin.. gets = bad, scanf = formatted;
		 * sscanf to remove
		**/

		fgets(string, 75, stdin);
		sscanf(string, "%[^\n]", string);

		/**
		 * Returns 0 if quit, 1 - CMD if valid cmd, and CMD
		 * if invalid cmd
		**/

		while(strncasecmp(string, valid[i], strlen(valid[i])) != 0 && i < CMD)
			i++;
		strtok(string, " ");

		if(i && i <= CMD-1)
			func[i]();

		else if(i && i >=CMD)
		{
			if(string[0]!='\n')
				printf("\tError: cannot find \"%s\".\n", string);
		}

		else if(i==0)
			printf("\tQuitting FILE system...\n");
	}

	return i;

}


//Code by : Fall 2002
//This function quits the file system
int quit()
{
	puts("\tQuitting...");
}

/**
 * mkfs creates a new disk with superblock
 * data that is taken from the user in the
 * parse function and verified internally.
**/
//Code by : Fall 2002

int mkfs()
{

	char *c;
	char choice;
	argument a;
	block * disk;
	int i=0;

	for(c=strtok(NULL, " "); c!=NULL && i <=5; c=strtok(NULL, " "))
	{
		a.argar[i]=atoi(c);
		i++;
	}

	if(i != 5)
	{
		printf("\tError: mkfs expects 5 arguments: usage...\n");
		printf("\tmkfs \[ri] \[is] \[bs] \[fs] \[ib]\n");
		printf("\t  ri: inode number of root\n\t  is: inode size (in bytes)\n\t ");
		printf("bs: block size (in bytes)\n");
		printf("\t  fs: file system size (in bytes)\n\t  ");
		printf("ib: number of blocks devoted to inodes\n");
		return 0;
	}

	/**
	  *  arguments have been passed in the correct number;
	  *	 now its time to check em out and make sure they
	  *  aren't contradictory
	 **/

	if(a.var.ri > a.var.fs || a.var.ri == 0)
	{
		printf("\tError: Root inode (ri) outside scope of filesystem (fs).\n");
		return 0;
	}

	if(a.var.is != 8)
		printf("\tWarning: Inode size should not be changed.\n");

	if(a.var.is > a.var.bs/2)
	{
			printf("\tError: Inode size makes it impossible ");
			printf(" for data blocks to exist.\n");
			return 0;
	}

	if(a.var.bs < (a.var.fs/8) + 20)
	{
		printf("\tError: Superblock information will not ");
		printf("fit in specified block/fs size.\n");
		return 0;
	}

	i=(a.var.fs/(a.var.bs/a.var.is));

		while(i*a.var.is - a.var.fs + i > a.var.bs/a.var.is)
			i--;

		if(a.var.ib != i)
				printf("\tWarning: Number of inode blocks is not optimal ");

				printf("(%d).\n", i);

		if(fs_r==0)
		{
			puts("\tMaking File System....");
			disk = disk_create(a.var.ri, a.var.is, a.var.bs, a.var.fs, a.var.ib);
			fs_r=1;
		}
		else
		{
			printf("\tWarning: Creating new FS will destroy old one; ");
			printf("Continue? (y/n):"),fs_r=1;
			choice=getchar();

			if(choice=='y')
			{
				disk = disk_create(a.var.ri, a.var.is, a.var.bs, a.var.fs, a.var.ib);
			}
			else
				printf("\tAborting mkfs\n");
			fs_r=1;
		}

		// set file systme level flag to 1; successful mkfs
		fs_r=1;
		return 1;
}


/** the mount function is done.  it creates
  * an entirely new copy of the superblock
  * in memory to be changed by the rest of
  * the functions.
 **/
//Code by : Fall 2002

int mount()
{
	if(fs_r==1)
	{
		puts("\tMounting File System...."), fs_r++;
		superblock_get();
	}
	else if(fs_r==0)error(1);
	else if(fs_r>1)error(2);

return 0;
}



/** the unmount function is done; it copies
  * the contents from the live superblock
  * to the simulated disk partition's
  * superblock.
 **/
//Code by : Fall 2002

int unmount()
{
	if(fs_r>1)
	{
		puts("\tUnmounting File System...."), fs_r--;
		superblock_put();
	}
	else error(0);
}


/**
  * ParsePath takes a character "pointer" (array)
  * and returns an inode number.. the name of this
  * function given in classes was name_i()
  */

int parsePath(char *path)
{

	char passedFile = 0;
	int r, block_n, inode_n;
	inode cur;
	char *token, *pathCopy;
	int flag = 0;
	char * nocaps;

	//if path is NULL, return root inode
	if (path == NULL)
	{
		puts("\tWARNING: null argument, returning root.");
		return global_superblock.ri;
	}

	//fetch root inode
	inode_n = global_superblock.ri;
	cur=inode_get(inode_n);
	block_n = cur.block_num;

	//copy path into pathCopy
	pathCopy = (char*)malloc(strlen(path));
	strcpy(pathCopy,path);

	//parse pathCopy
    for(token=strtok_r(pathCopy,"/", &nocaps); token!=NULL; token=strtok_r(NULL,"/", &nocaps))
	{

		if (passedFile) return -1;
		if(flag > 1 || (ls_flag && flag > 1))
		{
			return -1;
		}

		//for each directory entry
		for(r=0; r<8; r++)
		{
            //if the entry matches the token
			if (strcmp(global_disk[block_n +
				global_superblock.ib].entries.dirs[r].name, token) == 0)
			{
				flag=0;

				//get token's inode of matching entry
				inode_n = global_disk[block_n +
						global_superblock.ib].entries.dirs[r].inode_num;

				cur = inode_get(inode_n);
				block_n = cur.block_num;

				//cases for token's inode type
				switch (cur.block_type)
				{
					case 'F':
						//set flag
						passedFile = 1;
						break;
					case 'S':
						// this statement allows us to write-over symlinks;
						// symlink will set the global flag
						if(sym_flag)
						{
							return inode_n;
						}

						//call parsePath() on the symlink path
						inode_n = parsePath(global_disk[block_n +
								global_superblock.ib].bl_data.data);

						if (inode_n == -1)
							return -1;
						cur = inode_get(inode_n);
						block_n = cur.block_num;

						if (cur.block_type == 'F')
							passedFile = 1;
						break;

					default: break;
				}
			}
		}
        if(r==8)  flag+=1;

	}

	return inode_n;
}



//Code by : Fall 2002
/**
  * mkdir makes a directory
  */

int mkdir()
{

	char *c;
	char * argument[8];
	char * entry[8];
	char directory_entry[50];
	int b=0, i=0, r=0, temp_int;
	int inode_n, block_n, block_temp;
	inode a;
	block temp;

	if(fs_r > 1)
	{

		for(c=strtok(NULL, " "); c!=NULL && i <=5; c=strtok(NULL, " "))
		{
			argument[i]=c;
			i++;
		}

		if(i>1)
		{
			puts("\tError: Function mkdir expects only [1] One argument.");
			return 0;
		}

		if(i==0)
		{
			puts("\tError: Function mkdir expects at least [1] One argument.");
			return 0;
		}

		block_temp = parsePath(argument[0]);
        if(block_temp == -1)
			return -1;

		i=0;

		for(c=strtok(argument[0], "/"); c!=NULL && i <=5; c=strtok(NULL, "/"))
		{
			argument[i]=c, i++;
		}
		b=i-1;
        /* limit the file name within 7 letters */
		if(strlen(argument[b]) > 7)
		{
			printf("\tError: Directory name \"%s\" too long. ");
			printf("[7 or less character limit]\n", argument[b]);
			return 0;
		}

		i=0;
		while(global_disk[block_temp + global_superblock.ib].
					entries.dirs[i].inode_num != 0)
			i++;

		if(i > 7)
		{
			printf("\tError: 8 entry limit per directory reached.\n");
			return 0;
		}

		inode_n=free_bmp(global_superblock.inode_bitmap, global_superblock.fs -
					global_superblock.ib -1);
		block_n=free_bmp(global_superblock.block_bitmap, global_superblock.fs -
					global_superblock.ib -1);
		a.block_num=block_n;
		a.block_size=0;
		a.block_type='D';
        a.access_permission = 3;
		inode_put(inode_n, a);
		global_disk[block_temp + global_superblock.ib].entries.dirs[i].inode_num =
				inode_n;
		strcpy(global_disk[block_temp +
			global_superblock.ib].entries.dirs[i].name, argument[b]);
		inode_free(inode_n);
		block_free(block_n);

		puts("");

		return 0;
	}

	error(0);
	return 0;
}



/**
  * The write function creates a file..
  * the usage is write <string> <file>
  * the string cannot have any white space
 **/
//Code by : Fall 2002

int write()
{

	int inode_n, block_n, r, empty_r=-1;
	inode parent, file;
	char *path, *pathToken, *filename;
	int rewrite=0;

	// if filesystem is mounted

	if(fs_r > 1)
	{

		//fetch data to write
		char *data = strtok(NULL," ");
		if (data == NULL)
		{
			printf("\tError: Wrong arguments for write function.\n");
			return 0;
		}

		//parse path into inode number of file's parent directory
		path = strtok(NULL," ");
		if (path == NULL)
		{
			printf("\tError: Wrong arguments for write function.\n");
			return 0;
		}

		inode_n = parsePath(path);
		if (inode_n == -1)
		{
			printf("\tError: Wrong arguments for write function.\n");
			return 0;
		}
		parent = inode_get(inode_n);

		//get to last token in filename

		for(pathToken=strtok(path,"/"); pathToken!=NULL;
			pathToken=strtok(NULL,"/")) filename = pathToken;

		if(parent.block_type == 'F' || parent.block_type == 'S')
		{
			rewrite=parent.block_num;
			parent.block_type='F';
			strcpy(global_disk[rewrite + global_superblock.ib].bl_data.data, data);
			return 0;
		}

		//for each directory entry
		for(r=0; r<8; r++)
		{
			//record last empty entry
			if (empty_r < 0 && global_disk[parent.block_num +
				global_superblock.ib].entries.dirs[r].inode_num == 0)
			empty_r = r;

			//if the entry matches the token
			if (strcmp(global_disk[parent.block_num +
				global_superblock.ib].entries.dirs[r].name, filename) == 0)
			{
				//convert directory entry inode number into inode called file
				file = inode_get(global_disk[parent.block_num +
					global_superblock.ib].entries.dirs[r].inode_num);
				//copy data argument into file's datablock's data field
				strcpy(global_disk[file.block_num +
							global_superblock.ib].bl_data.data,data);
				//break out of for() with r=9
				r=9;
			}
		}

		//if r==8 and -1<empty_r<7, make new file at entry empty_r
		if (r==8 && -1<empty_r && empty_r<8)
		{
			//get free blocks
			inode_n = free_bmp(global_superblock.inode_bitmap, global_superblock.fs -
					global_superblock.ib -1);
			block_n = free_bmp(global_superblock.block_bitmap, global_superblock.fs -
					global_superblock.ib -1);

			//build inode
			file.block_num = block_n;
			file.block_size=strlen(data);
			file.block_type = 'F';

			//put inode
			inode_put(inode_n,file);

			//build block
			strcpy(global_disk[block_n + global_superblock.ib].bl_data.data, data);

			//put block
			//block_put(temp,block_n);

			//fill parent directory entry
			global_disk[parent.block_num +
				global_superblock.ib].entries.dirs[empty_r].inode_num = inode_n;
			strcpy(global_disk[parent.block_num +
				global_superblock.ib].entries.dirs[empty_r].name, filename);

			//update bitmap
			inode_free(inode_n);
			block_free(block_n);
			puts("");
			return 0;
		}

		//else, no existing file was found to
		//update and no room exists in directory
		//to make new file
		else
			printf("\tError: write failed because directory is full.\n");
	}

	error(0);
	return 0;

}



//Code by : Fall 2002
//Modification: Summer 2003
//This lists the directories and files
//in the file system.

int ls()
{

    int inode_n, r, list_n;
    inode dir, list;
    char *upper_path;

	if(fs_r > 1)
	{
		ls_flag=1;

		//fetch path from function parameter
        upper_path = strtok(NULL," ");

        if (upper_path == NULL)
		{
            upper_path = (char*)malloc(2);
            strcpy(upper_path,"/\0");
		}

		//parse path into inode number of directory
        inode_n = parsePath(upper_path);
        if (inode_n == -1)
		{
			printf("\tError: invalid arguments for ls function\n");
			return 0;
		}

		//if path is not a directory, exit
		dir = inode_get(inode_n);

		if (dir.block_type != 'D')
		{
			printf("\tError: Wrong arguments for ls function\n");
			return 0;
		}

		//for each directory entry
		for(r=0; r<8; r++)
		{
			//if the entry matches the token
            if ( (list_n = global_disk[dir.block_num +  global_superblock.ib].entries.dirs[r].inode_num) != 0)
            {
               list = inode_get(list_n);
               switch ( list.block_type )
               {
                case 'D':
                   printf("\t<%s> ",global_disk[dir.block_num + global_superblock.ib].entries.dirs[r].name);
                   break;
                case 'F':
                   printf("\t%s ",global_disk[dir.block_num + global_superblock.ib].entries.dirs[r].name);
                   break;
               }
            }


		}

		ls_flag=0;
		printf("\n");
		return 0;
	}

	error(0);
	return 0;
}


/**
  * The recls function is simply ls all the
  * directory and files recursively
 **/
 //Code by : Spring 2003

int recls()
{

        int inode_n, r;
        inode dir;
        char* path;

        if(fs_r > 1)
        {
                ls_flag=1;

 				//fetch path from function parameter
                path = strtok(NULL," ");
                if (path == NULL)
                {
                        path = (char*)malloc(2);
                        strcpy(path,"/\0");
                }

                //parse path into inode number of directory
                inode_n = parsePath(path);

 				if (inode_n == -1)
                {
                        printf("\tError: invalid arguments for ");
                        printf("recls function\n");
                        return 0;
                }

                //if path is not a directory, exit
                dir = inode_get(inode_n);

                if (dir.block_type != 'D')
                {
                        printf("\tError: Wrong arguments for ");
                        printf("recls function\n");
                        return 0;
                }

                //for each directory entry
              	for(r=0; r<8; r++)
                {
                        //if the entry matches the token
                    if((dir.block_num==2)&&(global_disk[dir.block_num +
                       global_superblock.ib].entries.dirs[r].inode_num != 0))
                    {
						printf("\t%s ",
						global_disk[dir.block_num+global_superblock.ib].entries.dirs[r].name);
                        dir.block_num=dir.block_num-1;
                    }

                    if((dir.block_num==1)&&(global_disk[dir.block_num +
                       global_superblock.ib].entries.dirs[r].inode_num != 0))
                    {
						printf("%s ",
						global_disk[dir.block_num+global_superblock.ib].entries.dirs[r].name);
                                 dir.block_num=dir.block_num+2;
                    }

                    if (global_disk[dir.block_num +
                       global_superblock.ib].entries.dirs[r].inode_num != 0)
                     {
						 for(dir.block_num=3;dir.block_num<=3;dir.block_num++)
                        		printf("%s ",global_disk[dir.block_num +
                        		global_superblock.ib].entries.dirs[r].name);
                     }

                     dir.block_num=2;

                }

                ls_flag=0;
                printf("\n");
                return 0;
        }

        error(0);
        return 0;
}



//Code by : Spring 2003
/**
  * This function deletes the directories
  * in every level.
 **/
int deld()
{

	int inode_n, r;
	inode dir;
	char* path;

	if(fs_r > 1)
	{
		ls_flag=1;

		//fetch path from function parameter
		path = strtok(NULL," ");

		if (path == NULL)
		{
			path = (char*)malloc(2);
			strcpy(path,"/\0");
		}

		//parse path into inode number of directory
		inode_n = parsePath(path);

		if (inode_n == -1)
		{
			printf("\tError: invalid arguments for deld function\n");
			return 0;
		}

		//if path is not a directory, exit
		dir = inode_get(inode_n);

		if (dir.block_type != 'D')
		{
			printf("\tError: Wrong arguments for ls function\n");
			return 0;
		}

		//for each directory entry
		for(r=0; r<8; r++)
		{
			//if the entry matches the token
			if (global_disk[dir.block_num +
				global_superblock.ib].entries.dirs[r].inode_num != 0)

			strcpy(global_disk[dir.block_num +
				global_superblock.ib].entries.dirs[r].name,"");
		}

		ls_flag=0;
		printf("\n");
		return 0;
	}

	error(0);
	return 0;
}


/**
  * The function deletes all the directories and
  * files from the present file system recursively.
 **/

int recdel()
{

        int inode_n, r;
        inode dir;
        char* path;

        if(fs_r > 1)
        {
                ls_flag=1;

                //fetch path from function parameter
                path = strtok(NULL," ");

                if (path == NULL)
                {
                        path = (char*)malloc(2);
                        strcpy(path,"/\0");
                }

                //parse path into inode number of directory
                inode_n = parsePath(path);

                if (inode_n == -1)
                {
                        printf("\tError: invalid arguments for ");
                        printf("recdel function\n");
                        return 0;
                }

                //if path is not a directory, exit
                dir = inode_get(inode_n);

                if (dir.block_type != 'D')
                {
                        printf("\tError: Wrong arguments for ");
                        printf("recdel function\n");
                        return 0;
                }

                //for each directory entry
              	for(r=0; r<8; r++)
                {
                    //if the entry matches the token
                  	if((dir.block_num==2)&&(global_disk[dir.block_num +
                       global_superblock.ib].entries.dirs[r].inode_num != 0))
                    {
							strcpy(global_disk[dir.block_num+
										global_superblock.ib].entries.dirs[r].name,"");
                            dir.block_num=dir.block_num-1;
					}

					if((dir.block_num==1)&&(global_disk[dir.block_num +
					  global_superblock.ib].entries.dirs[r].inode_num !=0))
					{
						strcpy(global_disk[dir.block_num+
							global_superblock.ib].entries.dirs[r].name,"");
						dir.block_num=dir.block_num+2;
					}

					if (global_disk[dir.block_num +
					   global_superblock.ib].entries.dirs[r].inode_num != 0)
					{
					 for(dir.block_num=3;dir.block_num<=3;dir.block_num++)
							strcpy(global_disk[dir.block_num +
								global_superblock.ib].entries.dirs[r].name,"");}
						dir.block_num=2;
					}

					ls_flag=0;
					printf("\n");
					return 0;
        }

        error(0);
        return 0;


}



/**
  * The read function simply does its job;
  * outputs straight from the partition in
  * raw char form
 **/
//Code by : Fall 2002

int read()
{

	char *c;
	char * argument[8];
	int b=0, i=0, r=0, temp_int;
	int inode_n, block_n, block_temp;
	inode a;
	char directory_entry[50];

	// if file system is mounted
	if(fs_r > 1)
	{

		for(c=strtok(NULL, " "); c!=NULL && i <=5; c=strtok(NULL, " "))
		{
			argument[i]=c;
			i++;
		}

		if(i>1)
			printf("\tWarning: Function read expects only [1] One argument.\n");

		block_temp = parsePath(argument[0]);


		a=inode_get(block_temp);
		block_n = a.block_num;

		printf("\t%s\n",global_disk[block_temp +
				global_superblock.ib].bl_data.data);
		return 0;
	}

	error(0);
	return 0;
}




//function delfile();
//Code by : Spring 2003
/**
  * This function is used to delete files
  * in a particular directory structure.
 **/

int delfile()
{

	char *c;
	char * argument[8];
	int b=0, i=0, r=0, temp_int;
	int inode_n, block_n, block_temp;
	inode a;
	char directory_entry[50];

	// if file system is mounted
	if(fs_r > 1)
	{

		for(c=strtok(NULL, " "); c!=NULL && i <=5; c=strtok(NULL, " "))
		{
			argument[i]=c;
			i++;
		}

		if(i>1)
			printf("\tWarning: Function delfile expects only [1] One argument.\n");

		block_temp = parsePath(argument[0]);


		a=inode_get(block_temp);
		block_n = a.block_num;

		strcpy(global_disk[block_temp + global_superblock.ib].bl_data.data,"");
		return 0;
	}

	error(0);
	return 0;
}



//function append();
//Code by : Spring 2003
/**
  * This function is used to append the
  * text to a particular file.This function
  * takes the appending text and the file
  * path as paramters.
 **/

int append()

{
	int inode_n;
	char *path;

	// if filesystem is mounted

	if(fs_r > 1)
	{

		//fetch data to write
		char *data = strtok(NULL," ");

		if (data == NULL)
		{
			printf("\tError: Wrong arguments for append function.\n");
			return 0;
		}

		//parse path into inode number of file's parent directory
		path = strtok(NULL," ");

		if (path == NULL)
		{
			printf("\tError: Wrong arguments for append function.\n");
			return 0;
		}

		inode_n = parsePath(path);
		if (inode_n == -1)
		{
			printf("\tError: Wrong arguments for append function.\n");
			return 0;
		}

		strcat(global_disk[inode_n + global_superblock.ib].bl_data.data, data);


		return 0;
	}

	error(0);
	return 0;

}

//fuction cp()
//Code by : Spring 2003
/**
  * This function is used to copy a file
  * from one directory to other directory.
  **/


int cp()
{

	int inode_n, inode_n1, inode_n2, block_n, r, empty_r;
	inode parent, file;
	char *path1, *path2, *filename, *data, *pathToken;

	// if filesystem is mounted

	if(fs_r > 1)
	{
		path1 = strtok(NULL, " ");
		path2 = strtok (NULL, " ");

		inode_n1 = parsePath(path1);
		data = (char *) malloc (strlen(global_disk[inode_n1 +
				global_superblock.ib].bl_data.data));
		strcpy(data, global_disk[inode_n1 + global_superblock.ib].bl_data.data);
		inode_n2=parsePath(path2);
		parent = inode_get(inode_n2);

		for(pathToken=strtok(path2,"/"); pathToken!=NULL;
			pathToken=strtok(NULL,"/")) filename = pathToken;
		//for each directory entry
		for(r=0; r < 8; r++)
		{
			//record last empty entry
			if ( empty_r < 0 && global_disk[parent.block_num +
					global_superblock.ib].entries.dirs[r].inode_num == 0 )
				empty_r = r;
		}

		if (empty_r > -1 && empty_r  < 8)
		{

			//get free blocks
			inode_n = free_bmp(global_superblock.inode_bitmap, global_superblock.fs -
							global_superblock.ib -1);
			block_n = free_bmp(global_superblock.block_bitmap, global_superblock.fs -
							global_superblock.ib -1);
			//build inode
			file.block_num = block_n;
			file.block_size= strlen(data);
			file.block_type = 'F';

			//put inode
			inode_put(inode_n,file);

			//build block
			strcpy(global_disk[block_n + global_superblock.ib].bl_data.data, data);

			//fill parent directory entry
			global_disk[parent.block_num +
				global_superblock.ib].entries.dirs[empty_r].inode_num = inode_n;
			strcpy(global_disk[parent.block_num +
				global_superblock.ib].entries.dirs[empty_r].name, filename);

			//update bitmap
			inode_free(inode_n);
			block_free(block_n);
			puts("");
			return 0;
		}

		//else no room exists in directory to make new file
		else printf("\tError: cp failed because directory is full.\n");
	}

	error(0);
	return 0;
}



//function truncate()
//Code by : Spring 2003
/**
  * This function truncates a given file.This means that
  * the file properties are not changed but the contents
  * of the file are emptied
 **/

int truncate()

{
	int inode_n;
	char *path;

	// if filesystem is mounted

	if(fs_r > 1)
	{
		//parse path into inode number of file's parent directory
		path = strtok(NULL," ");

		if (path == NULL)
		{
			printf("\tError: Wrong arguments for truncate function.\n");
			return 0;
		}

		inode_n = parsePath(path);

		if (inode_n == -1)
		{
			printf("\tError: Wrong arguments for truncate function.\n");
			return 0;
		}

		strcpy(global_disk[inode_n + global_superblock.ib].bl_data.data, "");


		return 0;
	}

	error(0);
	return 0;

}


//function create()
//Code by : Spring 2003

/**
  * This function creates an empty file.
 **/

int create()
{

	int inode_n, block_n, r, empty_r=-1, size=40;
	inode parent, file;
	char *path, *pathToken, *filename;

	// if filesystem is mounted

	if(fs_r > 1)
	{

		//parse path into inode number of file's parent directory
		path = strtok(NULL," ");
		if (path == NULL)
		{
			printf("\tError: Wrong arguments for create function.\n");
			return 0;
		}
       inode_n = parsePath(path);
		if (inode_n == -1)
		{
			printf("\tError: Wrong arguments for create function.\n");
			return 0;
		}
		parent = inode_get(inode_n);

		//get to last token in filename

		for(pathToken=strtok(path,"/"); pathToken!=NULL;
				pathToken=strtok(NULL,"/"))

			filename = pathToken;

		//for each directory entry
		for(r=0; r<8; r++)
		{
			//record last empty entry
			if (empty_r < 0 && global_disk[parent.block_num +
				global_superblock.ib].entries.dirs[r].inode_num == 0)
				empty_r = r;
		}

		if (-1<empty_r && empty_r<8)
		{
			//get free blocks
			inode_n = free_bmp(global_superblock.inode_bitmap, global_superblock.fs -
						global_superblock.ib -1);
			block_n = free_bmp(global_superblock.block_bitmap, global_superblock.fs -
						global_superblock.ib -1);
			//build inode
			file.block_num = block_n;
			file.block_size= size;
            file.block_type = 'F';
            //initialization of "rw-", read, and write only
            file.access_permission = 3;

			//put inode
			inode_put(inode_n,file);

			//build block
			strcpy(global_disk[block_n + global_superblock.ib].bl_data.data, "");

			//fill parent directory entry
			global_disk[parent.block_num +
				global_superblock.ib].entries.dirs[empty_r].inode_num = inode_n;
			strcpy(global_disk[parent.block_num +
				global_superblock.ib].entries.dirs[empty_r].name, filename);

			//update bitmap
			inode_free(inode_n);
			block_free(block_n);
			puts("");
			return 0;
		}

		//else, no room exists in directory to make new file
		else printf("\tError: create failed because directory is full.\n");

	}

	error(0);
	return 0;

}



/*********************************************************
* renm():  Switch a file or a directory name to a new one.
* code by: Summer 2003
*****************************************************/

int renm()
{
    char *path,  *c, *upper_path, *name1, *name2;
    char *argument[8], *argument1[8];
    int block_temp, inode_n, r, i = 0, b;
	char type_flag;
    inode INODE;

	// if file system is mounted
	if(fs_r > 1)
	{
        for (c=strtok(NULL, " "); c!=NULL && i <= 5; c=strtok(NULL, " "))
		{
			argument[i] = c;
			i++;
		}
        if ( i< 1)
        {
            printf("renm is able to rename a existed file or directory name\n");
            printf("usage: renm [file1] [file2]\n");
            return -1;
        }
        path = (char*) malloc(strlen(argument[0]));

		/* Store full path for old name*/
        path = argument[0];
        name2 = (char*) malloc(strlen(argument[1]));

		/* new name */
        name2 = argument[1];
        i=0;
		for (c=strtok(path, "/"); c!=NULL && i<=5; c=strtok(NULL, "/"))
		{
			argument1[i]=c;
            i++;
        }
        b = i - 1;
        upper_path = (char*) malloc(strlen(path));

		/* Catch the upper directory for old name */
        if(i < 2)
		{
		   strcpy ( upper_path, "/");
		} else   strcpy ( upper_path, argument1[0] );
        for(i =1; i < b; i++ )
        {
            strcat ( upper_path, "/" );
            strcat ( upper_path, argument1[i] );
        }
        name1 = (char*) malloc(strlen(argument1[b]));

        /* old name */
        name1 = argument1[b];
        block_temp = parsePath(upper_path);
        inode_n = parsePath(path);
        INODE = inode_get(inode_n);

        if (block_temp == -1)
		{
            printf ("\tError: no such name in existed file system. \n");
            return -1;
		}
        if(strlen(name2) > 7 )
        {
           printf("\tError: name is too long. \n");
           return 0;
        }
        i=0;

	/* request user inputs what type of file will be renamed */
	do
	{
           printf("Select the type of file you want to rename, [D]irectory / [F]ile: ");
           scanf("%c", &type_flag);
	}while(type_flag != 'd'&& type_flag!= 'D'&& type_flag != 'f'&& type_flag != 'F');

        switch(type_flag)
		{
			/* Do for the type of directory*/
			case 'd':
			case 'D':
               /*Count how many are the total entries*/
               while(global_disk[block_temp +global_superblock.ib].entries.dirs[i].inode_num != 0)
			   {
                  i++;

			   }
			   if(i > 7)
			   {
                  printf("\tError: 8 entries is limited for each directory. \n");
                  return 0;
			   }

               for (r = 0; r < i; r++)
			   {
                   if (strcmp(global_disk[block_temp + global_superblock.ib].entries.dirs[r].name, name1)==0 && INODE.block_type =='D')
				  {
                     strcpy(global_disk[block_temp + global_superblock.ib].entries.dirs[r].name, name2);
					 printf("renm is successful\n");
                  } else printf("Error: renm is not successful\n");
			   }
               break;
			/*Do for the type of file*/
			case 'f':
			case 'F':
				while(global_disk[block_temp +global_superblock.ib].entries.dirs[i].inode_num != 0)
			   {
                  i++;

			   }
			   if(i > 7)
			   {
                  printf("\tError: 8 entries is limited for each directory. \n");
                  return 0;
			   }

               for (r = 0; r < i; r++)
			   {
                  if (strcmp(global_disk[block_temp + global_superblock.ib].entries.dirs[r].name, name1)==0 && INODE.block_type =='F')
				  {
                     strcpy(global_disk[block_temp + global_superblock.ib].entries.dirs[r].name, name2);
					 printf("renm is successful\n");
                  }  else printf("renm is not successful\n");
               }
               break;

        }

    }
    else
    {
       error(0);
       return -1;
    }
	return 0;
}



/**
  * Symlink is almost a direct copy of write.  it sets
  * the sym_flag global flag when it is running so that parsePath will
  * stop if it encounters a symlink (so that symlink can change it)
 **/
//Code by : Fall 2002

int symlink()
{

	int inode_n, block_n, r, empty_r=-1;
	inode parent, file;
	char *path, *pathToken, *filename;
	int rewrite=0;

	sym_flag=1;

	// if the file system is mounted...
	if(fs_r > 1)
	{
		//fetch data to write
		char *data = strtok(NULL," ");
		if (data == NULL)
		{
			printf("\tWrong arguments for symlink function\n");
			return 0;
		}

		//parse path into inode number of file's parent directory
		path = strtok(NULL," ");
		if (path == NULL)
		{
			printf("\tWrong arguments for symlink function\n");
			return 0;
		}

		inode_n = parsePath(path);
		sym_flag=0;
		if (inode_n == -1)
		{
			printf("\tWrong arguments for symlink function\n");
			return 0;
		}

		parent = inode_get(inode_n);

		//get to last token in filename
		for(pathToken=strtok(path,"/"); pathToken!=NULL;
				pathToken=strtok(NULL,"/"))
		{
			filename = pathToken;
		}

		if(parent.block_type == 'F' || parent.block_type == 'S')
		{
			rewrite=parent.block_num;
			parent.block_type='S';
			strcpy(global_disk[rewrite + global_superblock.ib].bl_data.data, data);
		    return 0;
		}

		//for each directory entry
		for(r=0; r<8; r++)
		{
			//record last empty entry
			if (empty_r < 0 && global_disk[parent.block_num +
				global_superblock.ib].entries.dirs[r].inode_num == 0)
				empty_r = r;

			//if the entry matches the token
			if (strcmp(global_disk[parent.block_num +
				global_superblock.ib].entries.dirs[r].name, filename) == 0)
			{
				//convert directory entry inode number into inode called file
				file = inode_get(global_disk[parent.block_num +
					global_superblock.ib].entries.dirs[r].inode_num);
				//copy data argument into file's datablock's data field
				strcpy(global_disk[file.block_num +
					global_superblock.ib].bl_data.data,data);
				//break out of for() with r=9
				r=9;
			}
		}

		//if r==8 and -1<empty_r<7, make new file at entry empty_r
		if (r==8 && -1<empty_r && empty_r<8)
		{
			//get free blocks
			inode_n = free_bmp(global_superblock.inode_bitmap,
				global_superblock.fs -	global_superblock.ib -1);
			block_n = free_bmp(global_superblock.block_bitmap,
					global_superblock.fs - global_superblock.ib -1);

			//build inode
			file.block_num = block_n;
			file.block_size=strlen(data);
			file.block_type = 'S';

			//put inode
			inode_put(inode_n,file);

			//build block
			strcpy(global_disk[block_n + global_superblock.ib].bl_data.data, data);

			//fill parent directory entry
			global_disk[parent.block_num +
				global_superblock.ib].entries.dirs[empty_r].inode_num = inode_n;
			strcpy(global_disk[parent.block_num +
				global_superblock.ib].entries.dirs[empty_r].name, filename);

			//update bitmap
			inode_free(inode_n);
			block_free(block_n);
			puts("");
			return 0;
		}

		//else, no existing file was found to update and no
		// room exists in directory to make new file
		else printf("\tSymlink creation failed: Directory is full\n");
	}

	error(0);
	return 0;

}


void error(int a)
{
	printf("%s\n", ERRNO[a]);
}

/**
  * Live function displays the global superblock
  * so that you can verify that what you are doing
  * with the other commands are actually
  * effecting the mounted superblock.
 **/
 //Code by : Fall 2002

int live()
{
	if(fs_r > 1)
	superblock_print(global_superblock, global_superblock.fs);
	else error(0);
	return 0;
}

/** The part function displays the superblock
  * on the partition.  its used to make sure
  * that the partition's superblock does not
  * get changed when modifying the global one
 **/
//Code by : Fall 2002

int part()
{
	if(fs_r >= 1) superblock_print(global_disk[0].sblock,
				global_disk[0].sblock.fs);
	else
		printf("Filesystem level is %d, run 'mkfs' first.\n", fs_r);
	return 0;
}

/** Help prints out the description in valid commands
*   Code by : Summer 2003                             */

int help()
{
    int i = 0;
    char *c, *argument[8];

    for (c=strtok(NULL, " "); c!=NULL && i < 1; c=strtok(NULL, " "))
    {
			argument[i] = c;
			i++;
    }
    if( i != 1 )
    {
        printf("Usage: help [argument1] \n");
        return 0;
    }

    if( strcmp( argument[0], "mkfs") == 0)
    {
       printf("mkfs: Creates a new disk with superblock data taken from the               \n");
       printf("      user in the parse() function and verified internally.                \n");
       printf("      The function first creates instance argument 'a' and checks          \n");
       printf("      whether arguments were entered correctly by amount and contradiction.\n");
       printf("      If all arguments meet requirements then the function attempts to     \n");
       printf("      create file system.  If no file systems exist the disk_create        \n");
       printf("      function is invoked.  Else, if a file system exists, the function    \n");
       printf("      prompts the user whether to create a new.  The function alerts the   \n");
       printf("      user that creating a new file system will destroy the current file   \n");
       printf("      system.  If arguments don't meet function requirements, then function\n");
       printf("      aborts.  After a file system has successfully been created the file  \n");
       printf("      system level flag is set to 1.  This informs the program that a file \n");
       printf("      system exists.                                                       \n");
    } else if( strcmp( argument[0], "mount") == 0)
    {
       printf("mount:The mount function simply creates a new copy of the file system's    \n");
       printf("      superblock in memory in order to manipulate with other functions. It \n");
       printf("      utilizes the superblock_get function in the header file.             \n");
    } else if( strcmp( argument[0], "unmount") == 0)
    {
        printf("unmount: The unmount function simply copies the contents from the live     \n");
        printf("         superblock to the simulated disk partition's superblock.  It      \n");
        printf("         utilizes the superblock_put function in the header file.          \n");
    }else if( strcmp( argument[0], "mkdir") == 0)
    {
        printf("mkdir: This function can create a directory.                               \n");
    }else if( strcmp( argument[0], "write") == 0)
    {
        printf("write: This function can write some words to a file.                       \n");
    }else if( strcmp( argument[0], "ls") == 0)
    {
        printf("ls:  Function lists files in a given directory.                            \n");
    }else if( strcmp( argument[0], "read") == 0)
    {
        printf("read: This function outputs the content of a file.                         \n");
    }else if( strcmp( argument[0], "live") == 0)
    {
        printf("live: This function displays the global superblock.                        \n");
    }else if( strcmp( argument[0], "part") == 0)
    {
        printf("part: Displays the superblock on the partition.                            \n");
    }else if( strcmp( argument[0], "recls") == 0)
    {
        printf("recls: Lists the files in all the directories recursively of the file system.\n");
    }else if( strcmp( argument[0], "renm") == 0)
    {
        printf("renm: Renames a particular file or a particular directory                  \n");
    }else if( strcmp( argument[0], "recdel") == 0)
    {
       printf("recdel: Deletes the directories including all the files recursively in the \n");
       printf("        file system.                                                       \n");
    }else if( strcmp( argument[0], "append") == 0)
    {
       printf("append: Checks if the file system is mounted and appends words at the end  \n");
       printf("        of a particular file by accepting the path of the file.            \n");
    }else if( strcmp( argument[0], "truncate") == 0)
    {
        printf("truncate: Check for the file system mounted or not and then deletes the    \n");
        printf("          content of the file without changing the permissions and name.   \n");
    }else if( strcmp( argument[0], "cp") == 0)
    {
       printf("cp:       Check for the file system mounted or not and then copies a file  \n");
       printf("          to another directory by accepting the path of the old file, the  \n");
       printf("          path of the new file and the new file name.                      \n");
    }else if( strcmp( argument[0], "create") == 0)
    {
        printf("create:   Check for the file system mounted or not and then creates a file \n");
        printf("          in a directory.                                                  \n");
    }else if( strcmp( argument[0], "deld") == 0)
    {
        printf("deld:     Delete all the directories from each level.                      \n");
    }else if( strcmp( argument[0], "delfile") == 0)
    {
         printf("delfile:  Delete all the files under each directory.                       \n");
    }else if( strcmp( argument[0], "dir") == 0 )
    {
        printf("dir: Gives some infor about directory usage. Those are number of files, size\n");
        printf("     of each files and how many more file it can hold                       \n");
    }else if( strcmp( argument[0], "chmod") == 0)
    {
        printf("chmod: Change access permission for file or directory                       \n");
    }else if( strcmp( argument[0], "find") == 0)
    {
        printf("find: Search for a directory name in the file system                     \n");
	}else if( strcmp( argument[0], "pwd") == 0)
	{   printf("pwd: Displays the full path of your current working directory            \n");
	}else if( strcmp( argument[0], "quit") == 0)
	{
		printf("quit:Quit the system                                                     \n");
	}
	else
    {
        printf("Error argument input %s\n", argument[0]);
        return -1;
    }
}

/*****************************************
* Gives some infor about directory usage
*    -- number of files
*    -- size of each files
*    -- How many more file it can hold
* Code by Summer 2003
*****************************************/

int dir()
{

    int inode_n, r, c1, temp;
    int i = 0;
    int j = 0;
    int k = 0;
	inode dir, file_node;
	char* path;
        char file_type;

	if(fs_r > 1)
	{
		ls_flag=1;

		//fetch path from function parameter
		path = strtok(NULL," ");

		if (path == NULL)
		{
			path = (char*)malloc(2);
			strcpy(path,"/\0");
		}

		//parse path into inode number of directory
		inode_n = parsePath(path);

		if (inode_n == -1)
		{
			printf("\tError: invalid arguments for ls function\n");
			return 0;
		}

		//if path is not a directory, exit
		dir = inode_get(inode_n);

		if (dir.block_type != 'D')
		{
			printf("\tError: Wrong arguments for ls function. This function needs a directory name\n");
			return 0;
		}

      c1 = dir.block_size;
      i =0;
      //Print size of directory
      printf(" directory  %s",path);
      printf ("\n");

		//for each directory entry
		for(r=0; r<8; r++)
		{

			//if the entry matches the token
			if (global_disk[dir.block_num +
				global_superblock.ib].entries.dirs[r].inode_num != 0)
          {
                         file_node = inode_get(global_disk[dir.block_num +
                                global_superblock.ib].entries.dirs[r].inode_num);

			 file_type = file_node.block_type;


			 if (file_type == 'F')
             {
				i = i +1;
                printf("File name:\t%s ",global_disk[dir.block_num +
				global_superblock.ib].entries.dirs[r].name);
                printf(" block number : %d ",file_node.block_num);
                printf(" block size   : %d ",file_node.block_size);
                temp = file_node.access_permission / 2;
                if ( (file_node.access_permission % 2) == 1) printf("r");
                else printf("-");
                if ( (temp % 2) == 1 ) printf("w");
                else printf("-");

                temp = temp / 2;
                if ((temp % 2) == 1) printf("x");
                else printf("-");

                printf("\n");
              }
              if (file_type == 'D')
              {
				j = j + 1;
                printf("Directory name:\t%s ",global_disk[dir.block_num + global_superblock.ib].entries.dirs[r].name);
                printf(" block number : %d ",file_node.block_num);

                temp = file_node.access_permission / 2;
                if ( (file_node.access_permission % 2) == 1) printf("r");
                else printf("-");
                if ( (temp % 2) == 1 ) printf("w");
                else printf("-");

                temp = temp / 2;
                if ((temp % 2) == 1) printf("x");
                else printf("-");

                printf("\n");
 			  }
          }
		}
      if (i > 0)
      {
      	printf("Number of files present %d",i);
      	printf("\n");
      	printf("Additional number of files the directory can hold %d",8-(i+j));
        printf("\n");
      }
      if (j > 0)
      {
      	printf("Number of directories present %d",j);
      	printf("\n");
      	printf("Additional number of directories this directory can hold %d",8-(i+j));
      }
		ls_flag=0;
		printf("\n");
		return 0;
	}

	error(0);
	return 0;
}

/*********************************************
*  Gives some infor about current directory
*
* Code by SUMMER 2003
*********************************************/

int pwd()
{

        int inode_n, r, c1;
        inode dir, file_node;
        char* path;

        if(fs_r > 1)
        {
                ls_flag=1;

                //fetch path from function parameter
                path = strtok(NULL," ");

                if (path == NULL)
                {
                        path = (char*)malloc(2);
                        strcpy(path,"/\0");
                }

                //parse path into inode number of directory
                inode_n = parsePath(path);

                if (inode_n == -1)
                {
                        printf("\tError: invalid arguments for ls function\n");
                        return 0;
                }

                //if path is not a directory, exit
                dir = inode_get(inode_n);
               if (dir.block_type != 'D')
                {
                        printf("\tError: Wrong arguments for ls function. This function needs a directory name\n");
                        return 0;
                }


      //Print size of directory
      printf("current path is : COSC519>%s",path);
      printf ("\n");
      return 0;
        }
	error(0);
        return 0;
}
 /*****************************************************************
  *  Change access permisions which has (r)eadable, (w)ritable, and
  *  (e)xcutable permissions to your need
  *  code by SUMMER 2003
  **************************************************************/
 chmod()
 {
    char *parameter, *path,  *c;
    char *argument[8];
    int inode_n, i = 0;
    inode inode;

    //When system is not mounted yet, do quit
    if(fs_r > 1)
	{
        for (c=strtok(NULL, " "); c!=NULL && i <= 2; c=strtok(NULL, " "))
		{
			argument[i] = c;
			i++;
		}
        if(i<1)
        {
            printf("Change access permissions\n");
            printf("usage: chmod [+/-][r/w/x] [file/dir name]\n");
            printf("For example: chmod +x new.c\n");
            return -1;;
        }

        parameter = (char*) malloc(argument[0]);
        parameter = argument[0];

        path = (char*) malloc(strlen(argument[1]));
        path = argument[1];

        //parse path into inode number of directory
		inode_n = parsePath(path);
       if (inode_n == -1)
		{
            printf("\tError: invalid path name for chmod function\n");
			return 0;
        }
        inode = inode_get(inode_n);

        if ( parameter[0] == '-')
        {
            switch(parameter[1])
            {
                case 'r' :
                case 'R' :
                   if ( inode.access_permission % 2 == 1)
                   {
                      inode.access_permission = inode.access_permission - 1;
                      inode_put(inode_n, inode);

                      printf("-r chmod is successful\n");
                      break;
                   }
                   printf("chmod is not successful\n");
                   break;
                case 'w' :
                case 'W' :
                   if ( (inode.access_permission / 2) % 2 == 1)
                   {
                      inode.access_permission = inode.access_permission - 2;
                      inode_put(inode_n, inode);

                      printf("-w chmod is successful\n");
                      break;
                   }
                   printf("chmod is not successful\n");
                   break;
                case 'x' :
                case 'X' :
                   if ( (inode.access_permission / 4) % 2 == 1)
                   {
                      inode.access_permission = inode.access_permission - 4;
                      inode_put(inode_n, inode);
                      printf("-x chmod is successful\n");
                      break;
                   }
                   printf("chmod is not successful\n");
                   break;
            }
        }
        else if( parameter[0] = '+')
        {
            switch(parameter[1])
            {
                case 'r' :
                case 'R' :
                   if ( inode.access_permission % 2 == 0)
                   {
                      inode.access_permission = inode.access_permission + 1;
                      inode_put(inode_n, inode);

                      printf("+r chmod is successful\n");
                      break;
                   }
                   printf("chmod is not successful\n");
                   break;
                case 'w' :
                case 'W' :
                   if ( (inode.access_permission / 2) % 2 == 0)
                   {
                      inode.access_permission = inode.access_permission + 2;
                      inode_put(inode_n, inode);

                      printf("+w chmod is successful\n");
                      break;
                   }
                   printf("chmod is not successful\n");
                   break;
                case 'x' :
                case 'X' :
                   if ( (inode.access_permission / 4) % 2 == 0)
                   {
                      inode.access_permission = inode.access_permission + 4;
                      inode_put(inode_n, inode);

                      printf("+x chmod is successful\n");
                      break;
                   }
                   printf("chmod is not successful\n");
                   break;
            }
        } else
        {
            error(0);
            return -1;
        }

        return 0;
    }
    error(0);
    return 0;
 }

            



