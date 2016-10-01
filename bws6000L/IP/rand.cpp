//****************************************************
//   randimp.h 
//****************************************************
// this is a integer based random number generator 
// floating point based generators require float.h 
//  and other OS related functions 
//****************************************************
#include "rand.h"
#include "../Interfaces/AOAProtected.h"

random::random()
{		startingSeed = 0;
		oldSeed =0;
}
random::random(int x)
{		startingSeed = x;
		oldSeed =startingSeed;
}

//****************************************************
int random::getRandomAoA(int newseed)
{
   	int newx;  //local variable

	if(newseed != oldSeed)
		oldSeed = newseed;
// simple random number generator 
//	newx = (57*oldSeed + 1) % 256;
	newx = (57*oldSeed + 1) % 512;
	oldSeed = newx; 
	
	return newx;
}
