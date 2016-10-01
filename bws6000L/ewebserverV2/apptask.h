#ifndef __aoatask__
#define __aoatask__

#include "AOAProtected.h"

//aoatask.h file 
//aoa task class which has some task functions 

class aoatask {
 public:
  aoatask();
  static long avalue;
  static long svalue;
  static long f1value;
  static long t1value; 
  static long f2value; 
  static long tvalue;
  static long Scheduler_Flag; 
  static int  taskState[100];//0-Not Running 1-Running 2-Sleep
  static int  taskDelay[100];// Amount of delay for each tasks


  static int  nextTaskID;
  long bvalue;
  

  void Timer (long s); 
  void Scheduler (long s); 
  void fun1 (long s); 
  void fun2 (long s); 
};
#endif

