/*********************************************
		rand.h 
 ********************************************/
 
//This is an interface class definition 


// class definition follow 

class random
{

private:
	int startingSeed;
	//passed with the constructor 
	int oldSeed; 
public:

	//  this is a C++ function
	random();
	random(int x);
	int getRandomAoA(int newseed); 

};

