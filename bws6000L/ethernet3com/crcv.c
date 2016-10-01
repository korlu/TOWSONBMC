//cinit.c file 
// Coded by R. Karne on August 5, 2005 
// Copyright Towson University 
//
extern int enableReceive(int); 
extern int disableReceive(int); 
extern int getCurrentReceivePtr(short); 
extern int upStall (int); 
extern int upUnStall (int); 
//-----------------------------------------------
// enable receiver   
//-----------------------------------------------
int cenableReceive(int iobase) 
{
    return enableReceive(iobase); 
}

//-----------------------------------------------
// disable receiver   
//-----------------------------------------------
int cdisableReceive(int iobase) 
{
    return disableReceive(iobase); 
}

//-----------------------------------------------
// get rcv ptr for linked list    
//-----------------------------------------------
int cgetCurrentReceivePtr(short iobase) 
{
    return getCurrentReceivePtr(iobase); 
}
//-----------------------------------------------
// upStall    
//-----------------------------------------------
int cupStall (int iobase)
{
	return upStall(iobase);
}
//-----------------------------------------------
// upUnStall    
//-----------------------------------------------
int cupUnStall (int iobase)
{
	return upUnStall(iobase);
}



