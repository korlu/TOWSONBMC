#ifndef __apptask__
#define __apptask__

#include "../INTERFACES/AOAProtected.h"
#include "wcirlist.h"
#include "../ETHERNET/etherobj.h"
#include "../ARP/ARPObj.h"
#include "../IP/IPObj.h"
#include "../TCP/TCPObj.h"
#include "../FTOP/FTOPObj.h"
#include "AOATask.h"
#include "wttrace.h"
//apptask.h file 
//apptask.h file 
//aoa task class which has some task functions 
const int POLL_TIME = 5;

class apptask 
{
 private:
     AOAProtected io;
     EtherObj EO;
     TCPObj tcp;
     FTOPObj ftop;
     // Ethernet object to receive ethernet Message	 
 public:
     WStack stk;
     WCirList cir;
     WTTrace wttr; 
  apptask(); //default is used for Sleep
  apptask(int x); //pass starting Task_ID 
	
  static int ScheduleArray[16];

  static int taskDeletes;
  static int resumeCount;
  static long cvalue;
  static long svalue;
  static long gvalue;
  static long tvalue;
  static int runFlag;
  static long iddlecount;
  static long MaxTaskId; //max task id for HTTP tasks 
  static long MinTaskId; //min task id for HTTP tasks 
  static unsigned long ExitTimer;// one minute exit timer  

  static long rcvstarttime; 
  static long httpstarttime; 
  static long totalstarttime; 
  static long rcvcurtime; 
  static long httpcurtime; 
  static long totalcurtime; 
  static long systemstarttime; 
  static long TotalDataRcvd; 
  static unsigned int t1high; 
  static unsigned int t1low; 
  static unsigned int t2high; 
  static unsigned int t2low; 
  static unsigned int rcvtickshigh; 
  static unsigned int rcvtickslow; 
  static unsigned int httptickshigh; 
  static unsigned int httptickslow; 
  static unsigned int totaltickshigh; 
  static unsigned int totaltickslow; 

  static long Scheduler_Flag; 
  static int  nextTaskID;
  static int  Task_Status[NO_OF_TASKS]; // 0- iddle 1 - running 2 - Sleep
  static int  Task_Delay[NO_OF_TASKS];// Amount of delay in 55 ms 
  static int  Current_Task;
  static int  Current_Tcbrno;
  static int  Current_State;
  static int  Current_TCBRNo;
  static int  ftpFlag;

  static long packts; 
  static long ippackcount;
  static long arppackcount;
  static long otherpackcount;	 
  static long upCompleteNotSetCount;
  static long notForThisNodeCount;
  static long notArpOrIpCount;	 
  static long schedulerCount;	 

  // These are variables to manage Webserver Tasks 
  static int WSFreeTask;
  static int WSStartTaskNo;
  static int WSEndTaskNo; 
  static int TaskNextPtr[NO_OF_TASKS];

  static unsigned long noethpacksp;
  static unsigned long noetherrors;
  static char FTPipAdd[4];
  static unsigned short FTPPortNum;
  // Temporary Variables Must be deleted
 
  // tasks 
  void MainTask(long s); 
  void FTOPTimeOut(long s);   
  void RcvTask (long s); 
  void InterfaceTask (long s); 
  void FileTransferTask (long s); 
  void HttpTask (long s);

  void createOtherTasks(); 
  
  //local funtions and calls 
  void StoreFunAddress(long address,int index);
  int  createTask(long Function_Address, int flag);
  void ErrorHandler(long s);
  int getCurrentTask(); 
  void printStatistics(); 
  void checkErrors(); 

  int Scheduler_Algorithm_1(); 
  int insertHttpTask(int tcbrno, long timerc); 

  void printScreenLayout(); 
  void printScreenTags(); 
  void clearScreen(); 
};

#endif



