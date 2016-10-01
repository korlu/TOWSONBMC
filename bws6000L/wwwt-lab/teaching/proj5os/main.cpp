#include <stdio.h>
#include "flpdsk.h"



void main()
{
	floppymng myflp;
	myflp.mformat();

	char *inputfile;
	inputfile="hello.txt";

	char *outputfile;
	outputfile="hello.txt";

	char *input2;
	char *output2;

	input2="hello2.txt";
	output2="hello2.txt";

	myflp.mwrite(inputfile);
	myflp.mwrite(input2);
	
	

	myflp.mread(outputfile);
	myflp.mread(output2);
	
	myflp.mdelete(outputfile);
	myflp.mdelete(output2);

	myflp.mread(outputfile);
	myflp.mread(output2);

	myflp.mwrite(output2);
	myflp.mwrite(outputfile);


	input2="mydisk2.dat";
	myflp.mwrite(input2);
}