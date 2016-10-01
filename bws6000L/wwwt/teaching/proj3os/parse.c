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
void error(int a);

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


#define CMD 12

short fs_r = 0;

/* typedef a function pointer type named function_ptr...
 
 */

typedef int (*function_ptr)();

/* array of function pointers corresponding to 2 dim. array of program names
 * so that I can strncmp the output to a function name and map it through iteration
 * on an array rather than a switch statement.
 */

function_ptr func[CMD]={&quit, &mkfs, &mount, &unmount, &mkdir, &write, &read, &ls, &symlink, &live, &part, &help};
char valid[CMD][8]={"quit", "mkfs", "mount", "unmount", "mkdir", "write", "read", "ls", "symlink", "live", "part", "help"};
char ERRNO[3][50]={"\tError: No filesystem mounted", "\tError: No filesystem to mount", "\tError: Filesystem already mounted"};

int main() 
{

	/* variable declaration */
	int i=1;
	printf(" ---------------------------------------------------------\n");
	printf("FILEMANAGEMENT SYSTEM\n");
	printf("COSC 519 \n");
	printf("FINAL PROJECT \n");
    printf(" ---------------------------------------------------------\n");
	valid_array();
	/* enter the parse loop */
	parse();
	return 0;
}

/* prints out the "valid" array.. quit is 0 so that the function return being
 * false will mean we know that the quit command was issued.
 */

void valid_array() 
{
	int i=0;
	while(i < CMD) 
	{ 
		printf("\t*** CMD #%d: %s  \t***\n", i, valid[i]); 
		i++; 
	}
}

/* PRIMARY FUNCTION: PARSE LOOP, CMD PROMPT 
 * the parser uses an array of function pointers to call functions by index.
 */

int parse() 
{
	int i=1;
	char string[75];

	while(i != 0) 
	{
		i=0;
		// the following line prints an extra prompt after getchar in mkfs
		if(string[0]!='\n')printf("ddig-1.07# ");

		/* get input from stdin.. gets = bad, scanf = formatted; sscanf to remove \n*/
		fgets(string, 75, stdin);
		sscanf(string, "%[^\n]", string);

		/* returns 0 if quit, 1 - CMD if valid cmd, and CMD if invalid cmd */
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

int quit() 
{ 
	puts("\tQuitting..."); 
}

/* mkfs creates a new disk with superblock
 * data that is taken from the user in the
 * parse function and verified internally.
 */


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
		printf("\t  ri: inode number of root\n\t  is: inode size (in bytes)\n\t  bs: block size (in bytes)\n");
		printf("\t  fs: file system size (in bytes)\n\t  ib: number of blocks devoted to inodes\n");
		return 0;
	}
	/*** arguments have been passed in the correct number;
		 now its time to check em out and make sure they aren't contradictory */
	if(a.var.ri > a.var.fs || a.var.ri == 0) 
	{
		printf("\tError: Root inode (ri) outside scope of filesystem (fs).\n");
		return 0;
	}
	if(a.var.is != 8) 
		printf("\tWarning: Inode size should not be changed.\n");
	if(a.var.is > a.var.bs/2) 
		{ 
			printf("\tError: Inode size makes it impossible for data blocks to exist.\n"); 
			return 0; 
		}
	if(a.var.bs < (a.var.fs/8) + 20) 
	{ 
		printf("\tError: Superblock information will not fit in specified block/fs size.\n"); 
		return 0; 
	}

	i=(a.var.fs/(a.var.bs/a.var.is));

		while(i*a.var.is - a.var.fs + i > a.var.bs/a.var.is)
			i--;
			if(a.var.ib != i) 
				printf("\tWarning: Number of inode blocks is not optimal (%d).\n", i);

		if(fs_r==0) 
		{
			puts("\tMaking File System....");
			disk = disk_create(a.var.ri, a.var.is, a.var.bs, a.var.fs, a.var.ib);
			fs_r=1;
		}

		else 
		{
			printf("\tWarning: Creating new FS will destroy old one; Continue? (y/n):"),fs_r=1;
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

/* the mount function is done.  it creates
 * an entirely new copy of the superblock
 * in memory to be changed by the rest of
 * the functions.
 */

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

/* the unmount function is done; it copies
 * the contents from the live superblock
 * to the simulated disk partition's
 * superblock.
 */


int unmount() 
{ 
	if(fs_r>1) 
	{
		puts("\tUnmounting File System...."), fs_r--;
		superblock_put();
	}
	else error(0);
}

/* parsePath takes a character "pointer" (array)
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
			if (strcmp(global_disk[block_n + global_superblock.ib].entries.dirs[r].name, token) == 0) 
			{
				flag=0;
				//get token's inode of matching entry
				inode_n = global_disk[block_n + global_superblock.ib].entries.dirs[r].inode_num;

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
						// this statement allows us to write-over symlinks; symlink will set the global flag
						if(sym_flag) 
						{
							return inode_n; 
						}
					
						//call parsePath() on the symlink path
						inode_n = parsePath(global_disk[block_n + global_superblock.ib].bl_data.data);
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
	if(r==8) flag+=1;	

	}
	
	return inode_n;
}


/* mkdir makes a directory

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
	if(strlen(argument[b]) > 7) 
	{ 
		printf("\tError: Directory name \"%s\" too long. [7 or less character limit]\n", argument[b]); 
		return 0; 
	}

	i=0;
	while(global_disk[block_temp + global_superblock.ib].entries.dirs[i].inode_num != 0) 
		i++;
		
	if(i > 7) 
	{ 
		printf("\tError: 8 entry limit per directory reached.\n"); 
		return 0; 
	}
		inode_n=free_bmp(global_superblock.inode_bitmap, global_superblock.fs - global_superblock.ib -1);
		block_n=free_bmp(global_superblock.block_bitmap, global_superblock.fs - global_superblock.ib -1);
		a.block_num=block_n;
		a.block_size=0;
		a.block_type='D';
		inode_put(inode_n, a);
		global_disk[block_temp + global_superblock.ib].entries.dirs[i].inode_num = inode_n;
		strcpy(global_disk[block_temp + global_superblock.ib].entries.dirs[i].name, argument[b]);
		inode_free(inode_n);
		block_free(block_n);
	puts("");

	return 0;
	}

	error(0);
	return 0;
}

/* the write function creates a file..
 * the usage is write <string> <file>
 * the string cannot have any white space
 */

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

		for(pathToken=strtok(path,"/"); pathToken!=NULL; pathToken=strtok(NULL,"/")) filename = pathToken;

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
			if (empty_r < 0 && global_disk[parent.block_num + global_superblock.ib].entries.dirs[r].inode_num == 0) empty_r = r;
		//if the entry matches the token
			if (strcmp(global_disk[parent.block_num + global_superblock.ib].entries.dirs[r].name, filename) == 0) {
			//convert directory entry inode number into inode called file
			file = inode_get(global_disk[parent.block_num + global_superblock.ib].entries.dirs[r].inode_num);
			//copy data argument into file's datablock's data field
			strcpy(global_disk[file.block_num + global_superblock.ib].bl_data.data,data);
			//break out of for() with r=9
			r=9; }
		}

	//if r==8 and -1<empty_r<7, make new file at entry empty_r
	if (r==8 && -1<empty_r && empty_r<8) 
	{
		//get free blocks
		inode_n = free_bmp(global_superblock.inode_bitmap, global_superblock.fs - global_superblock.ib -1);
		block_n = free_bmp(global_superblock.block_bitmap, global_superblock.fs - global_superblock.ib -1);
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
		global_disk[parent.block_num + global_superblock.ib].entries.dirs[empty_r].inode_num = inode_n;
		strcpy(global_disk[parent.block_num + global_superblock.ib].entries.dirs[empty_r].name, filename);

		//update bitmap
		inode_free(inode_n);
		block_free(block_n);
		puts("");
		return 0;
	}

	//else, no existing file was found to update and no room exists in directory to make new file
	else printf("\tError: write failed because directory is full.\n");
}
	error(0);
	return 0;

}



int ls() 
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
			if (global_disk[dir.block_num + global_superblock.ib].entries.dirs[r].inode_num != 0)
			printf("\t%s ",global_disk[dir.block_num + global_superblock.ib].entries.dirs[r].name);
		}
		ls_flag=0;
		printf("\n");
		return 0;
	}

	error(0);
	return 0;
}

/* the read function simply does its job;
 * outputs straight from the partition in raw char form
 */

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

		printf("\t%s\n",global_disk[block_temp + global_superblock.ib].bl_data.data);
		return 0;
	}
	error(0);
	return 0;
}

/* symlink is almost a direct copy of write.  it sets
 * the sym_flag global flag when run so that parsePath will
 * stop if it encounters a symlink (so that symlink can change it)
 */

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
		for(pathToken=strtok(path,"/"); pathToken!=NULL; pathToken=strtok(NULL,"/")) 
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
			if (empty_r < 0 && global_disk[parent.block_num + global_superblock.ib].entries.dirs[r].inode_num == 0) empty_r = r;
			//if the entry matches the token
			if (strcmp(global_disk[parent.block_num + global_superblock.ib].entries.dirs[r].name, filename) == 0) {
			//convert directory entry inode number into inode called file
			file = inode_get(global_disk[parent.block_num + global_superblock.ib].entries.dirs[r].inode_num);
			//copy data argument into file's datablock's data field
			strcpy(global_disk[file.block_num + global_superblock.ib].bl_data.data,data);
			//break out of for() with r=9
			r=9;
		}
	}

	//if r==8 and -1<empty_r<7, make new file at entry empty_r
	if (r==8 && -1<empty_r && empty_r<8) 
	{
		//get free blocks
		inode_n = free_bmp(global_superblock.inode_bitmap, global_superblock.fs - global_superblock.ib -1);
		block_n = free_bmp(global_superblock.block_bitmap, global_superblock.fs - global_superblock.ib -1);
		//build inode
		file.block_num = block_n;
		file.block_size=strlen(data);
		file.block_type = 'S';
		//put inode
		inode_put(inode_n,file);
		//build block
		strcpy(global_disk[block_n + global_superblock.ib].bl_data.data, data);
		//fill parent directory entry
		global_disk[parent.block_num + global_superblock.ib].entries.dirs[empty_r].inode_num = inode_n;
		strcpy(global_disk[parent.block_num + global_superblock.ib].entries.dirs[empty_r].name, filename);

		//update bitmap
		inode_free(inode_n);
		block_free(block_n);
		puts("");
		return 0;
	}

	//else, no existing file was found to update and no room exists in directory to make new file
	else printf("\tSymlink creation failed: Directory is full\n");
	}
	error(0);
	return 0;

}


void error(int a) 
{
	printf("%s\n", ERRNO[a]);
}

/* live function displays the global superblock
 * so that you can verify that what you are doing
 * with the other commands are actually
 * effecting the mounted superblock.
 */

int live() 
{
	if(fs_r > 1)
	superblock_print(global_superblock, global_superblock.fs);
	else error(0);
	return 0;
}

/* the part function displays the superblock
 * on the partition.  its used to make sure
 * that the partition's superblock does not
 * get changed when modifying the global one
 */

int part()
{
	if(fs_r >= 1) superblock_print(global_disk[0].sblock, global_disk[0].sblock.fs);
	else printf("Filesystem level is %d, run 'mkfs' first.\n", fs_r);
	return 0;
}

/* help prints out the array
 * of valid commands so the user can
 * be reminded of them..
 */

int help()
{ 
	valid_array(); 
}

