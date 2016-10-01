#include <stdio.h>
#include <malloc.h>

/* temporary constants for structs
 * EMPT is used to set bits of a char to 1
 */
#define EMPT 255;

/* struct defenitions & typedef */

typedef struct
{
	char name[7];
	unsigned char inode_num;
} dir_entry;

typedef struct
{
	unsigned int block_num;
	unsigned int block_size:24;
	unsigned char block_type;
    unsigned int access_permission;
} inode;

typedef struct
{
	unsigned char d0:1;
	unsigned char d1:1;
	unsigned char d2:1;
	unsigned char d3:1;
	unsigned char d4:1;
	unsigned char d5:1;
	unsigned char d6:1;
	unsigned char d7:1;
} ibit;

typedef union
{
	unsigned char data;
	ibit bit;
} bmp_entry;

typedef struct
{
	int ri, is, bs, fs, ib;
	bmp_entry * inode_bitmap;
	bmp_entry * block_bitmap;
} superblock;

typedef struct
{
	inode * nodes;
}inode_block;

typedef struct
{
	char * data;
}data_block;

typedef struct
{
	dir_entry * dirs;
}dirblock;

typedef union
{
	dirblock entries;
	inode_block node;
	data_block bl_data;
	superblock sblock;
}block;

/* function prototyping */

block * disk_create(int ri, int is, int bs, int fs, int ib);

superblock superblock_create(int ri, int is, int bs, int fs, int ib);

superblock sbi_push(superblock a, int ri, int is, int bs, int fs, int ib);

void superblock_print(superblock a, int fs);

void superblock_copy();

void superblock_get();

void superblock_put();

void print_bmp_entry(bmp_entry *a, int fs);

void dir_put(dir_entry a);

void block_free(int block_num);

void block_put(block a, int inode_number);

block block_get(int inode_number);

void block_print(int block_number);

void inode_free(int inode_number);

inode inode_get(int inode_number);

void inode_put(int inode_number, inode b);

void print_inode(int inode_num);

int free_bmp(bmp_entry *a, int size);

/*   Global Variable Declaration       */

block * global_disk;

superblock global_superblock;

/*
 *     data types + entries
 * dir_entry:	char name[7], char inode_num;
 * inode: 		int block_num, block_size, block_type;
 * ibit: 		unsigned char d0 - d7:1;
 * bmp_entry: 	ibit bit, unsigned char data;
 * superblock: 	int ri, is, bs, fs, ib, bmp_entry * inode_bitmap, bmp_entry * block_bitmap;
 * inode_block:	inode * nodes;
 * data_block:	char * data;
 * block: 		inode_block node, data_block bl_data, superblock sblock;
 */

/* disk_create returns a block pointer
 * for no apparent reason, but "creates"
 * the disk using the given input.  In
 * actuality, it sizes the global variable
 * that represents the partition.
 */

block * disk_create(int ri, int is, int bs, int fs, int ib)
{

	int i=0, r=0;
	int b=0;
	int acca, accb, accc;
	superblock a;
	bmp_entry * bmptr;
	inode root_inode;

	i=bs/is;
	r=bs/8;

	a=superblock_create(ri, is, bs, fs, ib);
	global_disk=(block *) malloc(fs);

/* this section of code creates the dynamic sizes for each of the "block types"
 * in the block union.  it makes sure that the size of the blocks are constant
 * and all portions of the block are accessible by any reference in the union
 */
	for(b=1; b<=fs; b++)
	{
		global_disk[b].node.nodes=(inode *)malloc(i);
		global_disk[b].bl_data.data=(char *)malloc(bs);
		global_disk[b].entries.dirs=(dir_entry *)calloc(100, sizeof(int));
	}

	global_disk[0].sblock=a;

//	mounting root inode, creating and putting superblock on partition  //
	superblock_get();
	inode_free(ri);
	block_free(ri);
	superblock_put();

	bmptr=global_disk[0].sblock.inode_bitmap;
	acca=free_bmp(bmptr, global_disk[0].sblock.ib);

	root_inode.block_num=ri;
	root_inode.block_size=1;
	root_inode.block_type='D';
	inode_put(ri, root_inode);

	puts("\tFilesystem successfully created.");
return 0;
}

/* superblock_create returns a fully
 * created superblock.  its of course
 * used by the disk function to create
 * the global disk's superblock.
 */

superblock superblock_create(int ri, int is, int bs, int fs, int ib)
{
	int i=0;
	int c=0, b=0;
	superblock a;

	//	initialize inode bitmap size  //

	i=ib*(bs/is);
	a.inode_bitmap=(bmp_entry *)malloc(i);

	//	initialize block bitmap size  //
	i=fs-ib-1;
	a.block_bitmap=(bmp_entry *)malloc(i);
	for(b; b<(ib*bs/is); b++)
		a.inode_bitmap[b].data=EMPT;
	b=0;
	for(b; b<(fs-ib-1); b++)
		a.block_bitmap[b].data=EMPT;
	a=sbi_push(a, ri, is, bs, fs, ib);

	// print superblock information; ri, is, bs, fs, ib, bitmaps..
	printf("\tSuperblock Info:\n\t  Inode BMP Size:\t%d\n\t  Block BMP Size:\t%d\n", ib*(bs/is), (fs-ib-1));
	i=(ib*(bs/is))/8 + (fs-ib-1)/8 + 20;
	printf("\t  Size in Bytes:\t%d\n", i);
	// return created superblock
	return a;
}

/* superblock integer push.. abbr. name
 * says it all.
 */

superblock sbi_push(superblock a, int ri, int is, int bs, int fs, int ib)
{
	a.ri=ri, a.is=is, a.bs=bs, a.fs=fs, a.ib=ib;
	return a;
}

/*
 * this function prints out the contents
 * of a given superblock, given the size
 * of the filesystem.  the filesystem size
 * is needed to be able to print out the
 * bitmaps in the right size.
 */

void superblock_print(superblock a, int fs)
{

	int ib=global_disk[0].sblock.ib;
	int is=global_disk[0].sblock.is;
	int bs=global_disk[0].sblock.bs;

	printf("Attempting to print superblock....\n");
	printf("\tri: %d\n\tis: %d\n\tbs: %d\n\tfs: %d\n\tib: %d\n", a.ri, a.is, a.bs, a.fs, a.ib);
	printf("Inode Bitmap Table...\n");
	print_bmp_entry(a.inode_bitmap, ib*(bs/is));
	printf("Block Bitmap Table...\n");
	print_bmp_entry(a.block_bitmap, fs-ib-1);
}

/* this function prints a bitmap, used
 * for error checking.
 */

void print_bmp_entry(bmp_entry * a, int fs)
{
	int b=fs/8;
	int i=0;

	printf("Printing bitmap.\n");
	for(i; i<b; i++)
	{
		printf("%d", a[i].bit.d0);
		printf("%d", a[i].bit.d1);
		printf("%d", a[i].bit.d2);
		printf("%d", a[i].bit.d3);
		printf("%d", a[i].bit.d4);
		printf("%d", a[i].bit.d5);
		printf("%d", a[i].bit.d6);
		printf("%d\n", a[i].bit.d7);
	}

}

/* this function initializes the global
 * modify-able superblock in memory to
 * the value of the partition's superblock
 * It's basically a mount command.
 */

void superblock_get()
{
	int i=0;
	int b=0;

	global_superblock.ri=global_disk[0].sblock.ri;
	global_superblock.is=global_disk[0].sblock.is;
	global_superblock.ib=global_disk[0].sblock.ib;
	global_superblock.fs=global_disk[0].sblock.fs;
	global_superblock.bs=global_disk[0].sblock.bs;

	/************* Inode Bitmap Initialization ***************/
	i=global_superblock.ib*(global_superblock.bs/global_superblock.is);
	global_superblock.inode_bitmap=(bmp_entry *)malloc(i);
	for(b; b<i; b++)
		global_superblock.inode_bitmap[b].data=global_disk[0].sblock.inode_bitmap[b].data;

	/************ Block Bitmap Initialization ****************/
	i=global_superblock.fs-global_superblock.ib-1;
	global_superblock.block_bitmap=(bmp_entry *)malloc(i);
	b=0;
	for(b; b<i; b++)
		global_superblock.block_bitmap[b].data=global_disk[0].sblock.block_bitmap[b].data;
}

/* this function initializes the global
 * partition's superblock to the value
 * of the global superblock's.
 * It's basically an unmount command.
 */

void superblock_put()
{
	int i=0;
	int b=0;

	global_disk[0].sblock.ri=global_superblock.ri;
	global_disk[0].sblock.is=global_superblock.is;
	global_disk[0].sblock.ib=global_superblock.ib;
	global_disk[0].sblock.fs=global_superblock.fs;
	global_disk[0].sblock.bs=global_superblock.bs;

	/************* Inode Bitmap Initialization ***************/
	i=global_superblock.ib*(global_superblock.bs/global_superblock.is);
	for(b; b<i; b++)
		global_disk[0].sblock.inode_bitmap[b].data=global_superblock.inode_bitmap[b].data;

	/************ Block Bitmap Initialization ****************/
	i=global_superblock.fs-global_superblock.ib-1;
	b=0;
	for(b; b<i; b++)
		global_disk[0].sblock.block_bitmap[b].data=global_superblock.block_bitmap[b].data;
}

/* free_bmp is the generic function to find
 * free space in a given bitmap with a given size.
 * bitmaps and bitmap sizes can be easily
 * calculated from the info in the superblock,
 * and accessed by any function
 */

int free_bmp(bmp_entry *a, int size)
{
	int i=1, b=0;

	while(b < size)
	{
		if     (a[b].bit.d0==1)
		{
			return i;
		}
		else if(a[b].bit.d1==1)
		{
			return i+1;
		}
		else if(a[b].bit.d2==1)
		{
			return i+2;
		}
		else if(a[b].bit.d3==1)
		{
			return i+3;
		}
		else if(a[b].bit.d4==1)
		{
			return i+4;
		}
		else if(a[b].bit.d5==1)
		{
			return i+5;
		}
		else if(a[b].bit.d6==1)
		{
			return i+6;
		}
		else if(a[b].bit.d7==1)
		{
			return i+7;
		}
		b++, i+=8;
	}
// if it ever escapes the while loop,
	printf(" ERROR: Escaped while in function free_bmp: no free inodes.\n");
	return 0;
}


/* this function frees a specific inode
 * number in the live version of the
 * inode bitmap.
 */

void inode_free(int inode_number)
{
	int i=0, inode_size, mapsize, b=0;
	inode_size=global_superblock.is;
	mapsize=(int)(global_superblock.ib * global_superblock.bs/global_superblock.is);

	// this loop finds the correct bitmap byte to look for the passed param
	while(inode_number > (b+1)*inode_size)
		b++;

	i = inode_number - (b * inode_size) -1;

		if     (i==0)
		{
			global_superblock.inode_bitmap[b].bit.d0=0;
		}
		else if(i==1)
		{
			global_superblock.inode_bitmap[b].bit.d1=0;
		}
		else if(i==2)
		{
			global_superblock.inode_bitmap[b].bit.d2=0;
		}
		else if(i==3)
		{
			global_superblock.inode_bitmap[b].bit.d3=0;
		}
		else if(i==4)
		{
			global_superblock.inode_bitmap[b].bit.d4=0;
		}
		else if(i==5)
		{
			global_superblock.inode_bitmap[b].bit.d5=0;
		}
		else if(i==6)
		{
			global_superblock.inode_bitmap[b].bit.d6=0;
		}
		else if(i==7)
		{
			global_superblock.inode_bitmap[b].bit.d7=0;
		}

}

/* Inode get is supposed to, given an inode number,
 * return the inode data structure corresponding
 * to that number.  Hopefully, it works.
 */

inode inode_get(int inode_number)
{

	int block=1, r=0, bs=global_disk[0].sblock.bs;
	// increments bs by itself to find out what block the inode number is in.
	while(inode_number > bs)
	{
		block++;
		bs+=bs;
	}
	return global_disk[block].node.nodes[inode_number];
}

/* Inode number is "IS" variable .. b is the depth
 * into the bitmap that the inode is.. corresponds
 * to the "two dimensional array" position of the
 * inodes in the partition blocks.
 */

void inode_put(int inode_number, inode b)
{

	int block=1, r=0, bs=global_disk[0].sblock.bs;
	// increments bs by itself to find out what block
	// the inode number is in.
	while(inode_number > bs)
	{
		block++;
		bs+=bs;
	}
	global_disk[block].node.nodes[inode_number]=b;
}

/* this function simply prints given inode
 * judging by its block number and inode number;
 */

void print_inode(int inode_num)
{
	int i=global_superblock.ri/global_superblock.bs+1;
	printf("Inode %d: size:%d, type:%c\n", global_disk[i].node.nodes[inode_num].block_num,
	global_disk[i].node.nodes[inode_num].block_size, global_disk[i].node.nodes[inode_num].block_type);
}

/* block_free free's an associated block
 * number's position in the block bitmap
 * in the active (memory) superblock
 */

void block_free(int block_number)
{
	//	this function is basically a copy of inode_free
    int i=0, block_size, mapsize, b=0;
    block_size=global_superblock.is;
    mapsize=(int)(global_superblock.ib * global_superblock.bs/global_superblock.is);

    while(block_number > (b+1)*block_size)
		b++;

    i = block_number - (b * block_size) -1;

    if(i==0)
	{
		global_superblock.block_bitmap[b].bit.d0=0;
	}
	else if(i==1)
	{
		global_superblock.block_bitmap[b].bit.d1=0;
	}
	else if(i==2)
	{
		global_superblock.block_bitmap[b].bit.d2=0;
	}
	else if(i==3)
	{
		global_superblock.block_bitmap[b].bit.d3=0;
	}
	else if(i==4)
	{
		global_superblock.block_bitmap[b].bit.d4=0;
	}
	else if(i==5)
	{
		global_superblock.block_bitmap[b].bit.d5=0;
	}
	else if(i==6)
	{
		global_superblock.block_bitmap[b].bit.d6=0;
	}
	else if(i==7)
	{
		global_superblock.block_bitmap[b].bit.d7=0;
	}

}

/* this function takes block a and the
 * associated inode number of said block,
 * and puts the block in the associating
 * block number. (inode num = data_num)
 */


void block_put(block a, int inode_number)
{
	int offset=global_superblock.ib;
	global_disk[offset+inode_number].bl_data=a.bl_data;
}

/* this function returns a block data type
 * given an inode number (the inode number
 * in this case is the "data_num" value in
 * the inode).
 */


block block_get(int block_number)
{
	int offset=global_superblock.ib;
	return global_disk[offset+block_number];
}

void block_print(int block_number)
{
	printf("%s", global_disk[block_number+global_superblock.ib].bl_data.data);
}


