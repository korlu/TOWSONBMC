/*Algorithm.cpp*/
 
#include "Algorithm.h"
#include "Windows.h"
#include <stdlib.h>
#include <vector>
	

void CAlgorithm::FIFO(){

	using namespace std;

	//initialize the diskArray
	initDiskArray();

	//create a buffer to hold the request list
	vector<int> buffer;
	vector<int>::iterator iter;

	//Copy algorithm name
	strcpy(algName, "FIFO");

	//get the requests from file
	while(infile){
	infile>>request;
	buffer.push_back(request);
	}

	//get start time
	startTime = clock();

	//get number of requests
	numRequests = buffer.size()-1;

	//initialize variables
	totalDist = 0;
	avgDist = 0;
	dirChanges = 0;

	int currentPos = startPoint;
	int nextPos, tempDist;
	int maxDist = 9999;
	int sleepTime = 0;

	//start the algorithm

	//use iterator to go through the list
	for (iter=buffer.begin(); iter != buffer.end(); iter++)
	{
		nextPos = *iter;

		//calc totalDist
		tempDist = abs(currentPos - nextPos);
		if (tempDist<=maxDist)
		{
		totalDist += tempDist;
		}

		//calc disk direction changes
		//get new direction
		if(currentPos < nextPos)
		{
			newDirection = 0;  //forward
		}
		else
		{
			newDirection = 1;  //backward
		}

		//compare with current direction
		if(diskDirection != newDirection)
		{
			diskDirection = newDirection;
			dirChanges++;
		}


		//simulate I/O accessing diskArray position			
		output = diskArray[nextPos];			
		
		//put to sleep to simulate different data access times
		//use random number generator to get different sleep times		
		sleepTime = rand() % 10;
		Sleep(sleepTime);

		currentPos = nextPos;
	}


	//get end time
	endTime = clock();

	//get total time
	time = endTime - startTime;

	//calc avg dist
	avgDist = totalDist / numRequests;

	//close the input file
	infile.close();

	//write results to file
	Output();
}


void CAlgorithm::SSTF(){
	using namespace std;
	
	//initialize the diskArray
	initDiskArray();

	//create a buffer to hold the request list
	vector<int> buffer;
	vector<int>::iterator iter, iter2;

	//Copy algorithm name
	strcpy(algName, "SSTF");

	//get the requests from file
	while(infile){
		infile>>request;		
		buffer.push_back(request);
	}
	
	//get start time	
	startTime = clock();
	
	//get number of requests
	numRequests = buffer.size() - 1;

	//initialize variables
	totalDist = 0;
	avgDist = 0;
	dirChanges = 0;

	//get the first request
	int nextPos, nextRequest, tempDist;
	int minDist = 10001;
	int currentPos = startPoint;
	int sleepTime = 0;

	while (!buffer.empty()){
		
		//use iterator to go through the list
		for (iter=buffer.begin(); iter != buffer.end(); iter++)
		{
			nextPos = *iter;
			tempDist = abs(currentPos - nextPos);

			//check the distance
			if(tempDist < minDist){
				minDist = tempDist;
				nextRequest = nextPos;
				iter2 = iter;
			}
		}		
		
		//calc disk direction changes
		//get new direction
		if(currentPos < nextRequest){
			newDirection = 0;  //forward
		}else{
			newDirection = 1;  //backward
		}
		
		//compare with current direction
		if(diskDirection != newDirection){
			diskDirection = newDirection;
			dirChanges++;
		}

		//calc totalDist
		totalDist += minDist;

		//simulate I/O accessing diskArray position
		output = diskArray[nextRequest];
		
		//put to sleep to simulate different data access times
		//use random number generator to get different sleep times		
		sleepTime = rand() % 10;
		Sleep(sleepTime);

		//remove request from buffer		
		buffer.erase(iter2);

		//reset variables
		minDist = 10001;
		currentPos = nextRequest;
	}		

	//get end time
	endTime = clock();

	//get total time
	time = endTime - startTime;

	
	//calc avg dist
	avgDist = totalDist / numRequests;		

	//close the input file
	infile.close();

	//write results to file
	Output();
}

void CAlgorithm::SCAN()
{
	using namespace std;
	
	//initialize the diskArray
	initDiskArray();

	//create a buffer to hold the request list
	vector<int> buffer;
	vector<int>::iterator iter;

	//Copy algorithm name
	if(diskDirection == 0){
		strcpy(algName, "SCAN p(Start Direction: Forward)");
	}else{
		strcpy(algName, "SCAN (Start Direction: Backward)");
	}
	

	//get the requests from file
	while(infile)
	{
		infile>>request;
		buffer.push_back(request);
	}

	//get start time
	startTime = clock();

	//get number of requests
	numRequests = buffer.size() - 1;

	//initialize variables
	totalDist = 0;
	avgDist = 0;
	dirChanges = 0;

	//get the first request
	int maxPos = 9999;
	int tmpPos = startPoint;
	int nextPos, currentPos;
	int sleepTime = 0;

	//Start the algorithm
	for (currentPos = tmpPos; !buffer.empty() && (diskDirection == 1?currentPos >= 0:currentPos <= maxPos); diskDirection == 1?currentPos--:currentPos++)
	{			
		//use iterator to go through the list
		for (iter=buffer.begin(); !buffer.empty() && iter != buffer.end(); iter++)
		{
			nextPos = *iter;
			if (nextPos == currentPos)
			{
				//simulate I/O accessing diskArray position
				output = diskArray[currentPos];
				
				//put to sleep to simulate different data access times
				//use random number generator to get different sleep times		
				sleepTime = rand() % 10;
				Sleep(sleepTime);

				//remove request from buffer		
				buffer.erase(iter);

				//step back because erase moved the iter
				//one step too far
				iter--;
			}
		}
		
		totalDist += 1;
				
		//the first position of the array has been reached
		//change directions
		tmpPos = currentPos;		
		if (diskDirection == 1 && currentPos == 0)
		{
			diskDirection = 0;				
			dirChanges++;
		}
		else if (diskDirection == 0 && currentPos == maxPos)
		{
			diskDirection = 1;	
			dirChanges++;
		}

	}			
	//End the algorithm

	//get end time
	endTime = clock();

	//get total time
	time = endTime - startTime;
		
	//calc avg dist
	avgDist = totalDist / numRequests;

	//close the input file
	infile.close();

	//write results to file
	Output();

}

void CAlgorithm::LOOK()
{
	using namespace std;
	
	//initialize the diskArray
	initDiskArray();

	//create a buffer to hold the request list
	vector<int> buffer;
	vector<int>::iterator iter;
	vector<int>::iterator iter2;

	//Copy algorithm name
	if(diskDirection == 0){
		strcpy(algName, "LOOK (Start Direction: Forward)");
	}else{
		strcpy(algName, "LOOK (Start Direction: Backward)");
	}

	//get the requests from file
	while(infile)
	{
		infile>>request;
		buffer.push_back(request);
	}

	//get start time
	startTime = clock();

	//get number of requests
	numRequests = buffer.size() - 1;

	//initialize variables
	totalDist = 0;
	avgDist = 0;
	dirChanges = 0;

	//get the first request
	int maxPos = 9999;
	int tmpPos = startPoint;
	int nextPos, currentPos;
	bool foundRequest = false;
	int request = 0;
	int requestDist = 0;
	int sleepTime = 0;

	//Start the algorithm
	for (currentPos = tmpPos; !buffer.empty() && (diskDirection == 1?currentPos >= 0:currentPos <= maxPos); diskDirection == 1?currentPos--:currentPos++)
	{	
		foundRequest = false;
		//check for requests in current direction
		if(diskDirection == 0){
			
			//use iterator to go through the list
			for (iter2=buffer.begin(); iter2 != buffer.end() && foundRequest == false; iter2++)
			{
				request = *iter2;
				requestDist = currentPos - request;

				//check the distance
				if(requestDist <= 0){
					foundRequest = true;
				}
			}
		}else{
			//use iterator to go through the list
			for (iter2=buffer.begin(); iter2 != buffer.end() && foundRequest == false; iter2++)
			{
				request = *iter2;
				requestDist = currentPos - request;

				//check the distance
				if(requestDist >= 0){
					foundRequest = true;
				}
			}
		}
		
		//switch directions if no further requests found
		if (diskDirection == 1 && foundRequest == false)
		{
			diskDirection = 0;				
			dirChanges++;
		}
		else if (diskDirection == 0 && foundRequest == false)
		{
			diskDirection = 1;	
			dirChanges++;
		}

		//use iterator to go through the list
		for (iter=buffer.begin(); !buffer.empty() && iter != buffer.end(); iter++)
		{
			nextPos = *iter;
			if (nextPos == currentPos)
			{
				//simulate I/O accessing diskArray position
				output = diskArray[currentPos];
				
				//put to sleep to simulate different data access times
				//use random number generator to get different sleep times		
				sleepTime = rand() % 10;
				Sleep(sleepTime);

				//remove request from buffer		
				buffer.erase(iter);

				//step back because erase moved the iter
				//one step too far
				iter--;
				
				foundRequest = false;
				//check for requests in current direction
				if(diskDirection == 0){
					
					//use iterator to go through the list
					for (iter2=buffer.begin(); iter2 != buffer.end() && foundRequest == false; iter2++)
					{
						request = *iter2;
						requestDist = currentPos - request;

						//check the distance
						if(requestDist <= 0){
							foundRequest = true;
						}
					}
				}else{
					//use iterator to go through the list
					for (iter2=buffer.begin(); iter2 != buffer.end() && foundRequest == false; iter2++)
					{
						request = *iter2;
						requestDist = currentPos - request;

						//check the distance
						if(requestDist >= 0){
							foundRequest = true;
						}
					}
				}
				
				//switch directions if no further requests found
				if (diskDirection == 1 && foundRequest == false)
				{
					diskDirection = 0;				
					dirChanges++;
				}
				else if (diskDirection == 0 && foundRequest == false)
				{
					diskDirection = 1;	
					dirChanges++;
				}
			}
		}
		
		totalDist += 1;
				
		//the first position of the array has been reached
		//change directions
		tmpPos = currentPos;		
		if (diskDirection == 1 && currentPos == 0)
		{
			diskDirection = 0;				
			dirChanges++;
		}
		else if (diskDirection == 0 && currentPos == maxPos)
		{
			diskDirection = 1;	
			dirChanges++;
		}
	}			
	//End the algorithm

	//get end time
	endTime = clock();

	//get total time
	time = endTime - startTime;
		
	//calc avg dist
	avgDist = totalDist / numRequests;

	//close the input file
	infile.close();

	//write results to file
	Output();

}


int CAlgorithm::Menu(){

	printf("\nTo run the program enter 1, to exit enter 2\n");
	cin>>run;

	if(run == 1){ 
		//prompt for file 
		printf("\nTo begin the program, enter the file path and name containing the disk requests to be processed\n");
		cin>>filename;

		//Open file
		infile.open(filename);
		
		//Check for valid file, continue prompting until correct
		while(!infile){
			printf("Unable to open the file, enter the file path and name\n");
			cin>>filename;
			infile.open(filename);
		}

		//prompt for start point
		printf("Enter the starting point of the disk head, must be between 0 and 9999\n");
		cin>>startPoint;				

		while (startPoint < 0 || startPoint > 9999){
			printf("Invalid Start Point\n");
			printf("Enter the starting point of the disk head, must be between 0 and 9999\n");
			cin>>startPoint;				
		}

		//prompt for disk direction
		printf("Enter the starting direction of the disk head\n\t0 -> forward\n\t1 -> backward\n");
		cin>>diskDirection;
		
		while (diskDirection != 1 && diskDirection != 0){
			printf("Invalid disk direction\n");
			printf("Enter the starting direction of the disk head\n\t0 -> forward\n\t1 -> backward\n");
			cin>>diskDirection;
		}

		//choose algorithm to run
		printf("Choose one of the following algorithms to run.\n1) First In First Out (FIFO)\n2) Shortest Seek Time First (SSTF)\n3) SCAN\n4) LOOK\n5) Quit\n");
		cin>>algorithm;
		
		while(algorithm < 1 || algorithm > 5){
			printf("Invalid selection\n");
			printf("Choose one of the following algorithms to run.\n1) First In First Out (FIFO)\n2) Shortest Seek Time First (SSTF)\n3) SCAN\n4) LOOK\n5) Quit\n");
			cin>>algorithm;
		}

		return algorithm;
	}else {
		return 5;
	}
}

void CAlgorithm::Output(){
	
	outfile = fopen ("results.txt","a");
  
	if (outfile != NULL)
	{    
		 //format the output to a file
		fprintf(outfile, "\n\n");
		fprintf(outfile, "Results for %s \n", algName);
		fprintf(outfile, "Number of Disk Requests\t\t%d\n", numRequests);
		fprintf(outfile, "Disk start location\t\t%d\n", startPoint);
		fprintf(outfile, "Time to complete\t\t%d\n", time);
		fprintf(outfile, "Total distance traveled\t\t%d\n", totalDist);
		fprintf(outfile, "Average distance traveled\t%d\n", avgDist);
		fprintf(outfile, "Number of direction changes\t%d\n", dirChanges);
		
	}
	
	//close the output file
	CloseFile();
}

void CAlgorithm::CloseFile(){
	
	fclose (outfile);
}

void CAlgorithm::initDiskArray(){

	for (int i = 0; i < 10000; i++){
		diskArray[i] = 'a';
	}
}