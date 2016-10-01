//cinit.c file 
// Coded by R. Karne on August 5, 2005 
// Copyright Towson University 
//
extern long initasm(short, char*);
extern int createDSasm(int, int, int, int, int, int, int, int, int, int, short);

//-----------------------------------------------
// initialize ethernet card 
//-----------------------------------------------
long cinitEther(short p, char* m)
{
  return initasm(p,m);
}

//-----------------------------------------------
// create upload and download datastructure  
//-----------------------------------------------
int ccreateDS(int NoRcvBuf, int RcvStat, int UpLstPtr, int RcvFragAddr, int RcvFragLen, 
				 int NoSndBuf, int SndStat, int DnLstPtr, int SndFragAddr, int SndFragLen,
				 short iobase) 
{
  return createDSasm( NoRcvBuf, RcvStat, UpLstPtr, RcvFragAddr, RcvFragLen, 
				 NoSndBuf, SndStat, DnLstPtr, SndFragAddr, SndFragLen, iobase );
}
