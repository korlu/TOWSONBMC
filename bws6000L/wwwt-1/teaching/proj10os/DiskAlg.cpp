// DiskAlgorithms.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include <stdio.h>
#include <iostream.h>
#include <fstream.h>
#include "Algorithm.h"
#include "string.h"

void main(int argc, char* argv[])
{
	CAlgorithm algorithm;
	int option;

	option = algorithm.Menu();
	
	while (option < 5){
		if(option == 1){
			algorithm.FIFO();
		}else if (option == 2){
			algorithm.SSTF();
		}else if (option == 3){
			algorithm.SCAN();
		}else if (option == 4){
			algorithm.LOOK();
		}
		option = algorithm.Menu();
	}			
}
