
#ifndef __aoaparam__
#define __aoaparam__
//aoaparam.h file 
//aoa task parameter class which has all passing parameters to a task 

class aoaparam {
 public:
  int a1, a2, a3; 
  long b1, b2, b3; 
  char c1, c2, c3, c4; 
  char temp[10]; 

 public:
  aoaparam();
 
 friend class aoatask;
};
#endif
