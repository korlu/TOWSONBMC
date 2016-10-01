// ------------------------------------------------------------
// cisupport.c
// Coded by Ramesh Karne and Sandeep Girumala on April 14, 2006 
// Copyright Towson University 
// ------------------------------------------------------------

extern int igetRegister32(unsigned long );
extern void isetRegister32(int, unsigned long );

//-----------------------------------------------
// get register
//-----------------------------------------------
int cigetRegister32(unsigned long iobase)
{
  return igetRegister32(iobase);
}

//-----------------------------------------------
// set register
//-----------------------------------------------
void cisetRegister32(int value, unsigned long iobase)
{
  isetRegister32(value, iobase);
}

