/*algorithm.h*/

#include <stdio.h>
#include <iostream.h>
#include <fstream.h>
#include <time.h> 
#include "stdafx.h" 
#include "string.h"

#ifndef __ALGORITHM_H
#define __ALGORITHM_H

class CAlgorithm
{
public:
	CAlgorithm (){;};
	int Menu();
	void Output();
	void FIFO();
	void SSTF();
	void SCAN();
	void LOOK();
	void CloseFile();
	void initDiskArray();

private:
	ifstream infile;
	FILE *outfile;
	char filename[100], diskArray[10000], algName[100];
	int startPoint, diskDirection, algorithm, request, run;
	int totalDist, avgDist, numRequests, dirChanges, newDirection;
	char output;
	clock_t startTime, endTime, time; 
	
};

#endif //__ALGORITHM_H