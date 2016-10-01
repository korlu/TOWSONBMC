//----------------------------------------------
//apptask.cpp
// implementation for tasks 
//  there are also some non-task members in this file 
//----------------------------------------------
#include "apptask.h"
#include "aoatask.h"
#include "../HTTPPARSER/parserobj.h"
#include "../TCP/tcpobj.h"
#include "../FTP/FTPObj.h"
#include "wcirlist.h"
#include "wstack.h"
#include "../HTTPTABLE/HTTPList.h"
#include "../FTP/FTPObj.h"
#include "../UDP/UDPObj.h"
#include "../FTOP/FTOPObj.h"
#include "intexception.h"

typedef void (apptask::*pmfdOthers)(long);  //typedef for a member ptr 	
long *getFunctionPtrOthers(pmfdOthers);

int apptask::ScheduleArray[16];
int apptask::arptimer;

/*Home */
/*
char apptask::SrcIP[4]={192, 168, 1, 11};
char apptask::GateWayIP[4]={192, 168, 1, 1};
char apptask::FTPServerIP[4]={192, 168, 1, 8};
char apptask::GateWayMAC[6]= {0xf8, 0xe4, 0xfb, 0xc3, 0xc6, 0x62};
char apptask::SrcMAC[6] = {0x00, 0x08, 0x74, 0xde, 0x89, 0x40};
//RKK-AW universal mac 
*/

/*LAB*/
char apptask::SrcIP[4]={10, 55, 65, 14};
char apptask::GateWayIP[4]={10, 55, 65, 254};
char apptask::FTPServerIP[4]={10, 55, 65, 115};
char apptask::GateWayMAC[6]= {0x00, 0x25, 0x45, 0x59, 0x98, 0xbf};
char apptask::SrcMAC[6] = {0x00, 0x08, 0x74, 0xde, 0x89, 0x40};

unsigned long apptask::ExitTimer = 0; //one minute exit timer 
// if there is no receive activity for one minute, the server will exit 

int apptask::taskDeletes = 0; //static variable initialization 
int apptask::resumeCount = 0; //static variable initialization 
int apptask::runFlag = 0; //static variable initialization 
long apptask::systemstarttime = 0; //static variable initialization 
long apptask::cvalue = 0; //static variable initialization 
long apptask::svalue = 0; //static variable initialization 
long apptask::gvalue = 0; //static variable initialization
long apptask::tvalue = 0; //static variable initialization 
long apptask::TotalHttpCount = 0; //total http requests  
long apptask::TotalRcvCount = 0; //total http requests  
long apptask::TotalSuspendCount = 0; //total http requests  
long apptask::rcvstarttime = 0; //timers  
long apptask::TotalDataRcvd = 0; //timers  
long apptask::httpstarttime=0;   
long apptask::totalstarttime= 0;   
long apptask::rcvcurtime=0;   
long apptask::httpcurtime=0;   
long apptask::totalcurtime=0;   
long apptask::Scheduler_Flag = 0; //static variable initialization
long apptask::iddlecount = 0;
long apptask::MaxTaskId = 0;  //Max task id for HTTP tasks 
long apptask::MinTaskId = 0;  //Min task id for HTTP tasks 
unsigned int apptask::t1low = 0;  //ticks  
unsigned int apptask::t2low = 0;  //ticks  
unsigned int apptask::t1high = 0;  //ticks  
unsigned int apptask::t2high = 0;  //ticks  
unsigned int apptask::rcvtickshigh = 0;  //ticks  
unsigned int apptask::rcvtickslow = 0;  //ticks  
unsigned int apptask::httptickshigh = 0;  //ticks  
unsigned int apptask::httptickslow = 0;  //ticks  
unsigned int apptask::totaltickshigh = 0;  //ticks  
unsigned int apptask::totaltickslow = 0;  //ticks  
// the above two task id parameters are initialized in the test.cpp file 
//  we only insert these tasks in the run list and run them 

int  apptask::Task_Status[NO_OF_TASKS];
int  apptask::Task_Delay[NO_OF_TASKS];
int  apptask::Current_Task=3;
int  apptask::Current_Tcbrno=-1;

int  apptask::Current_State=0;
int  apptask::ftpFlag=0;

// Web server Management Variables
int apptask::WSStartTaskNo =0;
int apptask::WSEndTaskNo =0; 
int apptask::TaskNextPtr[NO_OF_TASKS];
int apptask::WSFreeTask=0;
//Temporary Counter Variables
long apptask::packts = 0; 
long apptask::ippackcount = 0 ;
long apptask::arppackcount = 0 ;
long apptask::otherpackcount = 0;	
long apptask::upCompleteNotSetCount = 0 ;
long apptask::notForThisNodeCount = 0 ;
long apptask::notArpOrIpCount = 0;
long apptask::schedulerCount = 0;
//----------------------------------------
unsigned long apptask::noethpacksp = 0 ;
unsigned long apptask::noetherrors = 0;
//----------------------------------------
//----------------------------------------
// default constructor
apptask::apptask()
{

};
//----------------------------------------
//this constructor will take the initial Task_ID
//----------------------------------------

apptask::apptask(int x)
{
 Current_Task =3;
 for(int i =0;i < NO_OF_TASKS; i++)
	{
	 Task_Status[i] = 0 ;
	 TaskNextPtr[i]=0;
	}
	packts = 0; 
	svalue = 0;
	WSStartTaskNo =0;
	WSEndTaskNo =0; 
	WSFreeTask=0;
	io.Application_Status = 1;
	rcvstarttime = 0; 
	rcvcurtime = 0; 
	httpstarttime = 0; 
	httpcurtime = 0; 
	totalstarttime = 0; 
	totalcurtime = 0; 
	Current_Tcbrno = -1;

	// RCV_PID = 4;
	// HTTP_PID = 7;
	// INT_PID = 5;
	//------------------
	// RCV  HTTP  INT | Output task id
	//------------------
	//  0    0     0  |  0
	//  0    0     1  |  0
	//  0    1     0  |  7
	//  0    1     1  |  7
	//  1    0     0  |  4
	//  1    0     1  |  4
	//  1    1     0  |  4
	//  1    1     1  |  4
	//------------------
	  
	ScheduleArray[0] = 0;
	ScheduleArray[1] = 0;
	ScheduleArray[2] = 7;
	ScheduleArray[3] = 7;
	ScheduleArray[4] = 4;
	ScheduleArray[5] = 4;
	ScheduleArray[6] = 4;
	ScheduleArray[7] = 4;

	MaxTaskId = 0; 
	MinTaskId = 0; 
	ExitTimer = 0; 

};

//--------------------------------------------------------------------------
// Fault Taularance Protocol Time Out 
void apptask::FTOPTimeOut(long v1)
{
    int time = 150;
    char* TraceString = " FTOPTimeOut       "; //trace string limited 40 characters 
    int i=0;
    //while(1)
    io.AOAsetSharedMemTraceString(TraceString); //store the trace string 
    while(io.Application_Status != 2)
    {
    ftop.SendFTOP(Current_Task);
    //TaskSleep(time); 
    }
    io.AOAExit();
}
//--------------------------------------------------------------------------
// HttpTask 
// tcp.storeTraceRecord stores TCB records for each request at TRACE1 address 
//--------------------------------------------------------------------------
void apptask::HttpTask(long v1)
{
	AOATask task;
   	parserObj p; 
	TCPObj tcp;
   	int i=0; 
	int retcode=0;
	
    if (PRINT) 
       io.AOAprintHex(Current_Task, Line11+140); 
     
    if (tcp.HttpRequests == 1) 
       systemstarttime = io.AOAgetTimer();  //start time 

   	while(io.Application_Status!=2)
	{
		Current_State = 0x0;

		retcode = tcp.getTaskID(Current_Tcbrno);
		if(retcode < 0)
		{
		    //we set task id in the TCB entry only once here 
			// we also verify the TCB entry before we set task id 
			//  this is only for checking and error trapping
			tcp.setTaskID(Current_Tcbrno, Current_Task);
            //
            if (TRACE_RECORD_FLAG == 1) 
              wttr.insert((Current_Task - MinTaskId), TASK_MASK_SCHEDULE); 

	   		retcode = p.processRequest(Current_Tcbrno, Current_Task);
            if (TRACE_RECORD_FLAG) 
                tcp.storeTraceDword(retcode, Current_Tcbrno, 9); //return code for task 

            if (PRINT) 
            {
		    io.AOAprintHex(retcode, Line11+40); 
		    io.AOAprintHex(Current_Task, Line11+140); 
            }
			
			switch(retcode)
			{
		         case -1: 
			      io.AOAPrintText("Message is empty ParserObj: -1", Line23+6); 
			      break; 
		         case -2: 
			      io.AOAPrintText("Method not supported (POST, HEAD) ParserObj: -2", Line23+6); 
			      break;  
		         case -3: 
			      io.AOAPrintText("Response header does not start with '/' ParserObj: -3", Line23+6); 
			      break; 
		         case -4: 
			      io.AOAPrintText("Version number does not start with ' ' ParserObj: -4", Line23+6); 
			      break;  			
		         case -5: 
			      io.AOAPrintText("No line break after version number ParserObj: -5", Line23+6); 
			      break; 
		         case -6: 
			      io.AOAPrintText("Version number is not 1.0 or 1.1 ParserObj: -6", Line23+6); 
			      break;  		
		         case -7: 
			      io.AOAPrintText("Send flag cannot be set TCPObj: -7", Line23+6); 
			      break; 
		         case -8: 
			      io.AOAPrintText("Connection timeout TCPObj: -8", Line23+6); 
			      break;  		
	             case -9: 
	              io.AOAPrintText("TCB Segment size is greater than the maximum acceptable send size TCPObj: -9", 
                     Line23+6);		    
                   break;  			
		         case -11: 
			      io.AOAPrintText("State is not established or finwait TCPObj: -11", Line23+6); 
			      break;  		
		         case -12: 
			      io.AOAPrintText("TDL pointer is out of range TCPObj: -12", Line23+6); 
			      break; 
		         case -13: 
			      io.AOAPrintText("Data buffer is out of range TCPObj: -13", Line23+6); 
			      break;  					      
		   	     case -24: 
			      io.AOAPrintText("Length of data to send is less than 1 byte IP: -24", Line23+6); 
			      break;  	
		   	     case -25: 
			      io.AOAPrintText("Length of data to send is greater than max send size IP: -25", Line23+6); 
			      break;  						
		   	     case -26: 
			      io.AOAPrintText("TDL pointer is out of range EO: -26", Line23+6); 
			      break;  				
		   	     case -27: 
			      io.AOAPrintText("Data buffer is out of range EO: -27", Line23+6); 
			      break;  	
		   	    case -28: 
			      io.AOAPrintText("TCB is not available TCP: -28", Line23+6); 
			      break;  				      
		   	    case -29: 
			      io.AOAPrintText("TDL is FULL TCP:SendN: -29", Line23+6); 
			      break;  				      
		   	    case -30: 
			      io.AOAPrintText("TDL is FULL TCP:SendMisc: -30", Line23+6); 
			      break;  				      
		   	    case -31: 
			      io.AOAPrintText("Task do not match in tcb TCP:setFileParam: -31", Line23+6); 
			      break;  
		   	    case -32: 
			      io.AOAPrintText("Request is not GET TCP:OtherHandler: -32", Line23+6); 
			      break;  				      
		   	    case -33: 
			      io.AOAPrintText("Tcb number do not match in tcb TCP:tcpSendN: -33", Line1); 
			      break;  				      			      
		   	    case -34: 
			      io.AOAPrintText("Tcb number do not match in tcb (first suspend) TCP:tcpSendN: -34", Line2); 
			      break;  				      					      
		   	    case -35: 
			      io.AOAPrintText("Tcb number do not match in tcb (second suspend) TCP:tcpSendN: -35", Line3);
			      break;  				      					      
		   	    case -36: 
		          io.AOAPrintText("Tcb number do not match in tcb TCP:SendN: -36", Line4);
			      break;  				      					      
		   	    case -37: 
		          io.AOAPrintText("tcb->avail = 0 TCP:SendN: -37", Line22+20);
			      break;  					      
		   	    case -38: 
		          io.AOAPrintText("tcb->avail = 0 TCP:tcpSendN: -38", Line6);
			      break;  					      
		   	case -39: 
		          io.AOAPrintText("tcb->avail = 0 (first suspend) TCP:SendN: -39", Line7);
		          io.AOAprintHex(Current_Task, Line7+140);
			      break;  					      
		   	case -40: 
		          io.AOAPrintText("tcb->avail = 0 (second suspend) TCP:tcpSendN: -40", Line8);
		          io.AOAprintHex(Current_Task, Line8+140);
			      break;  						      
			}
		}
		else
		{
		   io.AOAPrintText("apptask:httptask tcb is used another task", Line21+20); 
           io.AOAprintHex(retcode, Line21+120); 
           io.Application_Status = 2; 
           io.AOAExit(); 
		}
		// task is complete
		
		// get tcb availability
		retcode = tcp.getAvail(Current_Tcbrno);
		
		if(retcode != 0) // if it is available, then check tcbrno
		{
		 retcode = tcp.getTaskID(Current_Tcbrno);

		 if (Current_Task != retcode) 
		  {
		   //task is messed up 
		   //check task id before leaving the process as a final check 
		   //io.AOAPrintText("Current Task does not match with TCB entry!!!!", Line23); 
           //io.AOAprintHex(io.AOAgetTimer(), Line21+20); 
           //io.AOAprintHex(Current_Tcbrno, Line21+20); 
           //io.Application_Status = 2; 
           //io.AOAExit(); 
		   //io.AOAprintHex(retcode, Line20+20); 
		   //io.AOAprintHex(Current_Task, Line20+40); 
		   //io.AOAprintHex(Current_Tcbrno, Line20+60); 
		   //tcp.storeTraceRecord(Current_Tcbrno); 
		   //io.Application_Status = 2; 
		   //io.AOAprintHex(io.AOAgetTimer(), Line23+140);
		  }
		}
		
		tcp.HttpCount--; //decrement the http counter  
        //TotalHttpCount++; 
        if (PRINT) 
		  io.AOAprintHex(tcp.HttpCount, Line11+60); 
		//io.AOAprintHex(TotalHttpCount, Line11+80); 
        if (PRINT) 
		  io.AOAprintHex(tcp.HttpRequests, Line11+80); 
        if (TRACE_RECORD_FLAG == 1) 
           wttr.insert((Current_Task - MinTaskId), TASK_MASK_COMPLETE); 
		task.AOAcompleteTask(Current_Task, Current_State);
	    }
}
//-----------------------------------------
// FileTransferTask
//-----------------------------------------
void apptask::FileTransferTask(long v1)
{	
	FTPObj ftp;
	AOATask task; 
	int i =0;
	int retcode=0;


        io.AOAPrintText("FileTransferTask:", Line12); 
	io.AOAprintHex(Current_Task, Line12+140);
   
        // start file transfer
        ftop.setMode(0x01); //make it active  
        retcode = ftp.StartTransfer(ftp.IP, ftp.port, 0);
        	
	while(io.Application_Status !=2)
	{
	    i++;
	    io.AOAprintHex(i, Line12+120);
	    task.AOAsuspendTask();
	}
	
        io.AOAPrintText("Left while loop FileTransferTask", Line20+60); 
	
	io.AOAExit();
};

//-----------------------------------------
// InterfaceTask 
//-----------------------------------------
void apptask::InterfaceTask(long v1)
{	
	AOATask task; 
	int i =0;
	int retcode=0;
	char a = 'N';	

	io.AOAPrintText("InterfaceTask:", Line13);
        io.AOAprintHex(Current_Task, Line13+140); 
	
	while(io.Application_Status !=2)
	{
    	    a = io.AOAgetCharacterBuff();
	    if(a=='e')
	    {
		   io.Application_Status = 2;
	           io.AOAPrintText("GUIT Done",Line20+100);		
		   io.AOAExit();
	    }
        if (PRINT) 
	      io.AOAprintHex(io.AOAgetTimer(), Line13+120);
	    task.AOAsuspendTask(); 
	}
	
        io.AOAPrintText("Left while loop InterfaceTask", Line20+60); 
	io.Application_Status = 2;
	
	io.AOAExit();
};

//---------------------------------------------------------------------------------------------------------
// This is a main task invoked from test.cpp 
//  When everything is done, it should return to test.cpp 
//  This task also invokes scheduler and runs a given task 
//  When a given task is suspended, it returns to this main task 
//  When a given task is finihed, it should also return to this main task 
//  When a given task is delayed, it should also return to this main task 
//  MainTask
//---------------------------------------------------------------------------------------------------------
void apptask::MainTask(long v1)
{		
	AOATask task; //task object
	EtherObj EO; 
    ARPObj arp;
	FTPObj ftp;
	TCPObj tcp;

	int retcode = 0; 
    unsigned int ticks = 0; 
	int n = 0; 
	int i = 0, j = 0; 
	long taskid;
	long timer;
	unsigned int delay100;
	long statec;
	long timerc;
	long httpMax = 0;
	int tcbrnoc=-1;
    char ch = ' '; 
	int disfavor = 0; 
	int temp=0;
	unsigned int currenttime = 0;
	int idFound = 0;
	int tpktssentNIC = 0; 
	int tpktssentAPP = 0; 
	int priorcount = 0; 
	int k = 0; 
	int noOfElements = 0; 
	int counter = 0; 
	int httpflag = 0; 
	int rcvflag = 0; 
	int dpdstatus = 0; 
	int prevTask = 0; 
	int prevTaskID = 0; 
	int rcvcount = 0; 
    unsigned long avgRTT1 = 0;
    unsigned long avgRTT2 = 0;
	int loopcount=0;
    unsigned short ttrace = 0; 
    unsigned int resulth = 0; 
    unsigned int resultl = 0; 
    unsigned int result1h = 0; 
    unsigned int result1l = 0; 
    unsigned int t1starthigh = 0; 
    unsigned int t1startlow = 0; 
    unsigned int t2starthigh = 0; 
    unsigned int t2startlow = 0; 
    unsigned long httpfile; 
    unsigned long httpfsize; 
    unsigned char *httpptr; 
    unsigned char *httpptr1;
	taskDeletes = 0; 
	cvalue = 0; 

   /* task id 4 = receive task RCV_PID
    * task id 5 = interface task  INT_PID
    * task id 6 = file transfer task FTP_PID
    * task id 7 = http task HTTP_PID
    */

   n = RCV_PID;
   iddlecount = 0; 
   io.AOAackPICCntlr(1);
   io.AOAackPICCntlr(2);

   createOtherTasks();   //create all other tasks, only main task was created before in test.cpp
   
   for (i=0; i<5; i++)
    {
    retcode = arp.ARPBroadcast(GateWayIP, SrcIP, SrcMAC); //need one ARP to tell GW 
    retcode = arp.ARPBroadcast(FTPServerIP, SrcIP, SrcMAC); //need one ARP to tell GW 
    io.AOAShortDelay(100000); 
    } 

   //This loop will enable all files to be loaded into memeory using adhoc FTP 
   while(1)
   {
     io.AOAprintHex(n, Line10+20); 
     retcode = EO.IncSendOutPtr();
       
     if(n == RCV_PID && arp.resolveFlagForFileTransfer == 0)
       {
          n = FTP_PID;
       }
     else if(n == RCV_PID && arp.resolveFlagForFileTransfer == 1)
       {
          n = RCV_PID;
       } 
     else if(n == FTP_PID)
       {
          n = RCV_PID;
       } 

    Current_Task = n; //set the current task in apptask 

    task.AOArunTask(n);

    if(ftp.fileTransferFinished == 1 )//sdp && EO.CheckSendFlag() == 0)
    {   
	upCompleteNotSetCount = 0; 
	io.AOAPrintText("FTC", Line2+6);
	// so we do not have to worry counting interrupts before TCP transmissions start 
	retcode = io.AOAgetSharedMem(0xa4); 
	priorcount = retcode;  //save the prior interrrupt counts 
	break;
    }
   }
   //******************************************
   //after file transfer save the debug templace
   //  in memory 
   //******************************************
   retcode = ftp.getFile("debugxx.html", &httpfile, &httpfsize);
   httpptr = (unsigned char *)(DEBUGTRACE_ADDR - ADDR_OFFSET);
   httpptr1 = (unsigned char *)httpfile; //no need to subtract ADD_OFFSET
   for (i=0; i<httpfsize; i++)
       httpptr[i] = httpptr1[i]; //save   
   //******************************************

   io.AOAMaskRunRegister(RCV_PID, 0);
   io.AOAMaskRunRegister(HTTP_PID, 0);
   io.AOAMaskRunRegister(INT_PID, 0);

   printScreenLayout();   //clear the screen and print the layout 
   printScreenTags(); 
   io.AOAPrintText("MAIN:", Line9+6); 
   io.AOAPrintText("runTsk", Line8+20); 
   io.AOAPrintText("CirCnt", Line8+40); 
   io.AOAPrintText("resCnt", Line8+60); 
   io.AOAPrintText("delCnt", Line8+80); 
   io.AOAPrintText("State", Line8+100); 
	
   //--------------------------------------------------------
   k = 0; 
   totalcurtime = 0; 
   rcvcurtime = 0; 
   httpcurtime = 0; 
   rcvcount = 0; 
   loopcount = 0; 

   tcp.trace1Count = 0; 
   runFlag = 0; 
   arptimer = io.AOAgetTimer();
   //Main task loop 
   while (io.Application_Status != 2) 
	{
       if ((io.AOAgetTimer() - arptimer) > 30000)
        {
           //do ARPs once in a while 
           retcode = arp.ARPBroadcast(GateWayIP, SrcIP, SrcMAC); //need one ARP to tell GW 
           retcode = arp.ARPBroadcast(FTPServerIP, SrcIP, SrcMAC); //need one ARP to tell GW 
           arptimer = io.AOAgetTimer(); 
        }
        totalstarttime = io.AOAgetTimer();
        //if ((io.AOAgetTimer() - systemstarttime) > 240000*10)
        ch = io.AOAgetCharacterBuff();
	    if (ch == 'Q')
          {
            //computer the main task total clock ticks 
            //retcode = io.AOAgetClockTicks (&t2starthigh, &t2startlow); 
            //retcode = io.AOAClockTicksSubtract(t1starthigh, t1startlow, t2starthigh, t2startlow, &resulth, &resultl); 
            //totaltickshigh = resulth; 
            //totaltickslow = resultl; 

            io.AOAPrintText("THTTP", Line5+20); 
            io.AOAPrintText("TOTDATRCV", Line5+40); 
            io.AOAPrintText("TOTDATSND", Line5+60); 
            io.AOAprintHex(tcp.HttpRequests, Line6+20); 
            io.AOAprintHex(TotalDataRcvd, Line6+40); 
            io.AOAprintHex(EO.TotalDataSent, Line6+60); 
            io.AOAprintHex(tcp.MaxNoOfTasksUsed, Line13+20); 
            io.AOAPrintText("TOTTICKS", Line5+80); 
            io.AOAPrintText("RCVTICS", Line5+100); 
            io.AOAPrintText("HTTPTICS", Line5+120); 
            io.AOAprintHex(totaltickslow, Line6+80); 
            io.AOAprintHex(totaltickshigh, Line7+80); 
            io.AOAprintHex(rcvtickslow, Line6+100); 
            io.AOAprintHex(rcvtickshigh, Line7+100); 
            io.AOAprintHex(httptickslow, Line6+120); 
            io.AOAprintHex(httptickshigh, Line7+120); 

	        io.Application_Status = 2;                  //quit the server
            io.AOAExit(); 
          }

	    retcode = EO.IncSendOutPtr(); //if there is a xmit then, it will reset the xmitter 
	    //            and increment the send out ptr 
	    tcbrnoc = -1;
	   //-------------------------------------------------------
	   if(EO.isRDescDone(EO.ReceiveOutPtr))  //check if D bit is set, Download 
	     {
	       io.AOAMaskRunRegister(RCV_PID, 1);  //turn on the control bit for RCV 
           rcvflag = 1; 
	     }
	   else 
	     {
	       io.AOAMaskRunRegister(RCV_PID, 0); 
	     }
       /*
	   if (EO.RDLfull())
	     {
	       io.AOAPrintText("MainTask: RDL Buffer is full!", Line23); 
	       io.AOAprintHex(EO.ReceiveOutPtr, Line23+80); 
	       io.AOAprintHex(EO.getRDTail(), Line23+100); 
	     }
         */
	   //-------------------------------------------------------
	   //we only call RCV task if there is packet in the buffer, for which 
	   //  the data download or D bit is set 
	   //  ReceiveOutPtr is pointing to the slot which is to be processed 
	   //  ReceiveOutPtr will be only incremented when that message is processed 
	   //    and discarded 
	   //  ReceiveInPtr is not important  
	   //-------------------------------------------------------
	
	   if(tcp.getHttpCount() > 0)
	     {
           if( tcp.getHttpCount() > httpMax)
		      httpMax = tcp.getHttpCount();		   
	       io.AOAMaskRunRegister(HTTP_PID, 1); //turn on the control bit for HTTP 
	     }

	   if (io.RunRegister !=0)   //check if there is no task to run  
	     {
	       //there is a task to be run 
	       n = Scheduler_Algorithm_1(); //returns a task to run as n
	       idFound = 0;	
	       //io.AOAprintHex(noOfElements, Line2+140); 
	       if (n == HTTP_PID) 
	          httpflag = 1; 
	       else httpflag = 0; 
	       counter = 0; 

	       noOfElements = cir.getCount();  //no of elements to be checked for delay 
           if (PRINT) 
              io.AOAprintHex(noOfElements, Line9+40); 
	       //--------------------------------------------------------
	       if(httpflag == 1) // it is http task
	         {		  // we need to find which http task to run
	            while (counter < noOfElements && idFound == 0)
	               {
	                 retcode = cir.getCount(); 
	                 if (retcode > tcp.MaxNoOfTasksUsed) 
		                 tcp.MaxNoOfTasksUsed = retcode; 

	                 if(cir.empty() == 0)
	                   {
	                     cir.get(&taskid, &delay100, &statec, &tcbrnoc, &timerc);
	                   }
	                 else
	                     io.AOAPrintText("apptask:MainTask circular list is empty", Line24);
	                 currenttime = io.AOAgetTimer();
	                 //check in the tcb if this task can be resumed
	                 //  even if the delay is not finished yet....
 
                     if (tcp.getResetFlag(tcbrnoc) == 1) 
		               {
	                     n = 0; 
		                 idFound = 0; 
                         taskDeletes++; 
                         if (PRINT) 
                            io.AOAprintHex(taskDeletes, Line13+140); 
                         tcp.DeleteTCB(tcbrnoc, 0x00000060);  //delete the tCB  
		                 continue;
	                   }
                     else if (tcp.getSuspendFlag(tcbrnoc) == 1 && tcp.getResumeFlag(tcbrnoc) == 1) 
		                {
	                     n = taskid; 
		                 idFound = 1; 
		                 tcp.resetResumeFlag(tcbrnoc);
                         resumeCount++; 
		                 continue;
	                    }
	
	                 if(currenttime >= delay100) // is delay zero
	                   {
	                     n = taskid;  // delay is zero, run the task
		                 idFound = 1;
	                   }
	                 else  // delay is not zero, put it back into the circular list
	                   {
	                      if(cir.full() == 0 && tcp.getAvail(tcbrnoc) == 1) //RKK-AW new code change
	                        {
	                           cir.insert(taskid, delay100, statec, tcbrnoc, timerc);
	                        }
	                     else
	                        {
	                           io.AOAPrintText("apptask:MainTask circular list is full", Line24);
	                        }			     
	                   } // end of else

	                  counter++; 
                      
                        /*
		                 if(tcp.MaxNoOfTasksUsed > 100) 
                         {
                             tcp.storeTraceTCBRecord(tcbrnoc); 
                         }
                         */
	               } // end of while

	           if (idFound == 0)
	              n = 0;

	         } //end of if  httpflag = 1
	       //--------------------------------------------------------
	       if(n >= 4 && n <=MaxTaskId)
	          {
                Current_Task = n; //set the current task in apptask, global variable for task 	
	            if(n > 8)
	            Current_Tcbrno = tcbrnoc; //global variable for task
                    //  task.AOAprintTSS(prevTask, Line12); 
		        if (n == RCV_PID) 
	             {
	                rcvstarttime = io.AOAgetTimer(); 
	             }
	            if (httpflag == 1) 
	             {
                    if (runFlag == 0) 
                    {
                    runFlag = 1;   //Time to start measurements, ONLY once 
                    totalcurtime = 0; 
                    rcvcurtime = 0; 
                    totalstarttime = io.AOAgetTimer(); 
                    TotalDataRcvd = 0; 
                    EO.TotalDataSent = 0; 
                    totaltickshigh = 0; 
                    totaltickslow = 0; 
                    rcvtickshigh = 0; 
                    rcvtickslow = 0; 
                    httptickshigh = 0; 
                    httptickslow = 0; 
                    //start closk ticks for the main task 
                    //retcode = io.AOAgetClockTicks (&t1starthigh, &t1startlow); 
                    }
	                httpstarttime = io.AOAgetTimer(); 
	             }

	            //---------------------------------
	            ExitTimer = io.AOAgetTimer(); 

                //retcode = io.AOAgetClockTicks (&t1high, &t1low); 
	            task.AOArunTask(n);  //run task 
                //retcode = io.AOAgetClockTicks (&t2high, &t2low); 

                if (PRINT) 
                   io.AOAprintHex(n, Line9+20); 
	            //---------------------------------
		        if (n == RCV_PID) 
	             {
	                //rcvcurtime = rcvcurtime + (io.AOAgetTimer() - rcvstarttime); 
                    //retcode = io.AOAClockTicksSubtract(t1high, t1low, t2high, t2low, &resulth, &resultl); 
                    //retcode = io.AOAClockTicksAdd(rcvtickshigh, rcvtickslow, resulth, resultl, 
                                                     //&result1h, &result1l); 
                    //rcvtickshigh = result1h; 
                    //rcvtickslow = result1l; 

                    TotalRcvCount++; 
	             }
	             if (httpflag == 1) 
	             {
	               // httpcurtime = httpcurtime + (io.AOAgetTimer() - httpstarttime); 
                    //retcode = io.AOAClockTicksSubtract(t1high, t1low, t2high, t2low, &resulth, &resultl); 
                    //retcode = io.AOAClockTicksAdd(httptickshigh, httptickslow, resulth, resultl, 
                                                     //&result1h, &result1l); 
                    //httptickshigh = result1h;
                    //httptickslow = result1l;

                    TotalHttpCount++; 
	             }

	          } //end of if n >= 4 

	        if(n == RCV_PID)
              {
	            io.AOAMaskRunRegister(RCV_PID, 0);  //turn off the control bit 
              }

	        if(cir.getCount() == 0 && n >= HTTP_PID) // there are http requests in the run list
	         {
	           io.AOAMaskRunRegister(HTTP_PID, 0); //turn off the control bit 
	         }
            if (PRINT) 
            {
            io.AOAprintHex(tcp.MaxNoOfTasksUsed, Line13+20); 
            io.AOAprintHex(tcp.MaxNoOfTCBsUsed, Line13+40); 
            io.AOAprintHex(tcp.trace2Count, Line13+60); 
            io.AOAprintHex(tcp.TotalDelCount, Line13+80); 
            io.AOAprintHex(tcp.NoOfResets, Line13+100); 
	        io.AOAprintHex(EO.ReceiveInPtr, Line3 + 40); 
	        io.AOAprintHex(EO.ReceiveOutPtr, Line3 + 60); 
	        io.AOAprintHex(EO.SendInPtr, Line5 + 80); 
	        io.AOAprintHex(EO.SendOutPtr, Line5 + 100); 
            }
                 
	     } //end of Run Register Condition 

       totalcurtime = totalcurtime + (io.AOAgetTimer() - totalstarttime); 

	} //end of main wule loop 

  task.AOAapplink32(); //link to the main application app1tss
  io.AOAExit(); //exit from the program  
}; //end of Main Task 

//********************************************************
// Recevie task to check  if any ethernet msgs arrived and 
//  porcess them 
//  RcvTask
//********************************************************
void apptask::RcvTask(long v1)
{
    ARPObj 	ar;
    IPObj 	ip;
    TCPObj tcp; 
    AOATask task;  
    
    char *Data;
    char abc; 
    Data = &abc; 
    char macaddr[6];
  
    int i=0, j=0;
    int loopcount1 = 0; 
    int retcode = 0;     
    int empty = 0; 
    int RXSize = 0; 
    long lcount = 0, vcount=0;
    int PacketType = 0;
    long starttime = 0;     
    
    ippackcount = 0; 
    arppackcount = 0; 
    upCompleteNotSetCount = 0 ;
    notForThisNodeCount = 0 ;
    notArpOrIpCount = 0;
    
    if (PRINT) 
    {
    io.AOAPrintText("RCV:",Line3+6); 
    io.AOAprintHex(Current_Task, Line3+140); 
    }

    while(io.Application_Status!=2)
    {
     if (PRINT) 
        io.AOAprintHex(Current_Task, Line3+140); 
	 // macaddr is passed to TCPObj because TCPObj doesnt call arp.Resolve()
	 // TCPObj stores this macaddr in TCB
	 RXSize =   EO.ReadData(&Data, &PacketType, ip.msourceIP, macaddr);
     TotalDataRcvd = TotalDataRcvd + RXSize; //accumulate the data packets arrived  
     if (PRINT) 
        io.AOAprintHex(RXSize, Line3+80); 
	 starttime = io.AOAgetTimer(); 	 
	 if (RXSize == -1) 
	   {
	   //packet is not ready to receive 
	   // UpComplete Bit is not set
       upCompleteNotSetCount++;
	   task.AOAsuspendTask(); 
       if (PRINT) 
          io.AOAprintHex(upCompleteNotSetCount, Line3+100);
	   continue; 
       }
	 if (RXSize == -2) 
	   {
	   //packet arrived is not destined to this node
	   notForThisNodeCount++;
	   task.AOAsuspendTask();
       if (PRINT) 
          io.AOAprintHex(notForThisNodeCount, Line3+120);
	   continue; 
       }
	 if (RXSize == -3) 
	   {
	   //packet arrived is not arp or ip type packet
	   // we do not handle packets other than arp or ip
	   notArpOrIpCount++; 
	   task.AOAsuspendTask(); 
       if (PRINT) 
          io.AOAprintHex(notArpOrIpCount, Line5+20);
	   continue; 
       }
	 if (RXSize == -4) 
	   {
	   //receive overrun error 
	   task.AOAsuspendTask(); 
       if (PRINT) 
	     io.AOAPrintText("RCV Task: Receive Overrun!", Line5+80); 
	   continue; 
       }
	 

	 while (EO.TDLFull()) //test for send list full 
			      // if this is full, need more entries in the list 
			      // list size is small! 
	    {
	     //the list is full wait
	     io.AOAprintHex(EO.SendInPtr, Line23 + 20); 
	     io.AOAprintHex(EO.SendOutPtr, Line23 + 40); 
  	     io.AOAPrintText("TDL IS FULL!",Line23+60); 
	     task.AOAsuspendTask(); 
	    }

	 if(RXSize >= 0)
	 {
	  if(PacketType == ARP_TYPE)  //ARP Packets 
	    {	
	       arppackcount++;
           if (PRINT) 
	          io.AOAprintHex(arppackcount, Line5+40); 
	       //ar.printARPTable(Line4); 
	       retcode  = ar.ARPHandler((char*) Data, RXSize, Current_Task);		
           switch (retcode)	          
		   {
		   case -1: 
			io.AOAPrintText("Hardware Type Mismatch in ARP: -1", Line23); 
			break; 
		   case -2: 
			io.AOAPrintText("Protocol Mismatch in ARP: -2", Line23); 
			break;  
		   case -3: 
			io.AOAPrintText("Length of Hardware Address Mismatch in ARP: -3", Line23); 
			break;  
		   case -4: 
			io.AOAPrintText("Protocol Address Length Mismatch in ARP: -4", Line23); 
			break;  
		   case -5: 
			io.AOAPrintText("Not a Request or Reply, can't handle it!: -5", Line23); 
			break;  
		   case -6: 
			io.AOAPrintText("Should never happen in ARP, Catastrophic: -6", Line23); 
			break;  
		   case -7: 
			io.AOAPrintText("IP No Match!Not An Error: It is a broadcast : -7", Line23); 
			j++; 
			io.AOAprintHex(j, Line23+100); 
			break;  
		   case -8: 
			io.AOAPrintText("TDL Slot or Memory Error Catastrophic - 8!", Line23); 
			break;  
		   case -9: 
			io.AOAPrintText("TDL Slot or Memory Error Catastrophic! - 9", Line23); 
			break;  
		 }

	       retcode = EO.discardPacket(); //packet is removed 
	       task.AOAsuspendTask(); 

        }
	  else if(PacketType == IP_TYPE)  //IP Packets 
	    {	

	       ippackcount++;
           if (PRINT) 
	          io.AOAprintHex(ippackcount, Line5+60);  
	       retcode = ip.IPHandler((char*) Data, RXSize, macaddr, starttime, Current_Task);  

           if (TRACE_RECORD_FLAG) 
                tcp.storeTraceDword(retcode, Current_Tcbrno, 13); //return code for IP/TCP Handler 
           switch (retcode)	          
		   {
		   case -1: 
			io.AOAPrintText("Packet Size is less than the header IP: -1", Line23); 
			break; 					 
		   case -2: 
			io.AOAPrintText("Packet Size is large! IP: -2", Line23); 
			break; 
		   case -3: 
			io.AOAPrintText("Not our packet, Throw it out! IP: -3", Line23); 
			break;  
		   case -4: 
			io.AOAPrintText("Fragmented Data IP: -4", Line23); 
			break;  
		   case -5: 
			io.AOAPrintText("No Data in the Datagram! IP: -5", Line23); 
			break;  
		   case -6: 
			io.AOAPrintText("IP Destination do not Match! IP: -6", Line23); 
			break;  
		   case -7: 
			io.AOAPrintText("Other Packets IP: -7", Line23); 
			break;  
		   case -8: 
			io.AOAPrintText("Checksum Error! IP: -8", Line23); 
			break;  
		   case -9: 
			io.AOAPrintText("Discard the packet! IP: -9", Line23); 
			break;  
		   case -10: 
			io.AOAPrintText("Length of data to send is less than 1 byte IP: -10", Line23); 
			break;  	
		   case -11: 
			io.AOAPrintText("Length of data to send is greater than max send size IP: -11", Line23); 
			break;  			
		   case -12: 
			io.AOAPrintText("TDL pointer is out of range EO: -12", Line23); 
			break;  				
		   case -13: 
			io.AOAPrintText("Data buffer is out of range EO: -13", Line23); 
			break;  
		   case -14: 
			io.AOAPrintText("Packet size is less header size UDP: -14", Line23); 
			break;  				
		   case -15: 
			io.AOAPrintText("Packet is not for our port UDP: -15", Line23); 
			break;  			
		   case -16: 
			io.AOAPrintText("Packet size is less than 3 FTP: -16", Line23); 
			break;  			
		   case -17: 
			io.AOAPrintText("Packet is less than minimum length TCP: -17", Line23); 
			break;  
		   case -18: 
			io.AOAPrintText("Packet is not for HTTP Port TCP: -18", Line23); 
			break;  				
		   case -19: 
			io.AOAPrintText("Packet does not have correct checksum TCP: -19", Line23); 
			break;  			
		   case -20: 
			io.AOAPrintText("Retrieving TCB Record Failed TCP: -20", Line23); 
			break;  	
		   case -22: 
			io.AOAPrintText("Dpd pointer is out of range TCP: -22", Line23); 
			break;  				
		   case -23: 
			io.AOAPrintText("Data buffer is out of range TCP: -23", Line23); 
			break;  			
		   case -24: 
			io.AOAPrintText("Length of data to send is less than 1 byte IP: -24", Line23); 
			break;  	
		   case -25: 
			io.AOAPrintText("Length of data to send is greater than max send size IP: -25", Line23); 
			break;  						
		   case -26: 
			io.AOAPrintText("TDL pointer is out of range EO: -26", Line23); 
			break;  				
		   case -27: 
			io.AOAPrintText("Data buffer is out of range EO: -27", Line23); 
			break;  	
		   case -28: 
			io.AOAPrintText("packet size is larger than record size HTTPList: -28", Line23); 
			break;  						
		   case -29: 
			io.AOAPrintText("http buffer is full HTTPList: -29", Line23); 
			break;  				
		   case -30: 
			io.AOAPrintText("valid bit is not set HTTPList: -30", Line23); 
			break;  			
		   case -31: 
			io.AOAPrintText("TCPObj:OtherHandler Not a GET request -31", Line23); 
			break;  						

		 }  //end of switch 

         if (retcode != DONOTDISCARD) 
	          retcode = EO.discardPacket(); //packet is removed 
	     task.AOAsuspendTask(); 
	    } //end of else for IP Type 

	}  //RXSize if 

    } //end of while loop
    
    io.AOAPrintText("RcvTask is Ending", Line22); 
    io.AOAExit();
}; //end of rcv task 

//---------------------------------------------------------------------------------
// get current running task 
//---------------------------------------------------------------------------------
int apptask::getCurrentTask()
  {
    return Current_Task; 
  }; 
//---------------------------------------------------------------------------------
// Scheduler Algorithm 1 Call 
//---------------------------------------------------------------------------------
int apptask::Scheduler_Algorithm_1()
  {
    int n=0, r=0;

    r = io.RunRegister;
    n = ScheduleArray[r];

    return n;

  }; 

//-----------------------------------------
// createTask 
// This is an API 
//-----------------------------------------
int apptask::createTask(long Function_Address, int flag)
{
AOATask task;
int Task_ID = 4;
long Task_Stack; 

while(Task_Status[Task_ID] != 0 && ((Task_ID) < NO_OF_TASKS))
			Task_ID++;
if(Task_ID == NO_OF_TASKS)
{
		return -1;
}
//Change the Stack Size Here	
Task_Stack = task.StackBase - (STACK_SIZE * Task_ID);

task.AOAcreateTask(Function_Address, Task_Stack, Task_ID, flag);
if (flag == 1)  //error handler task 
 Task_Status[Task_ID] = 0;
else Task_Status[Task_ID] = 1; //all other tasks   
//long Function_Address, long StackMEM_Ptr, int Task_ID
return Task_ID;
};

//-----------------------------------------
// insertHttpTask 
// This is an API 
//-----------------------------------------
int apptask::insertHttpTask(int tcbrno, long timerc)
{
  int taskid;
  long timer;

  if (cir.getCount() > 5000) 
  {
      io.AOAprintHex(cir.getCount(), Line24+100); 
      io.Application_Status = 2; 
      io.AOAExit(); 
  }
  
  if(stk.empty() == 0)
  {
    stk.pop(&taskid);

    if (taskid < MinTaskId || taskid > MaxTaskId)
    {
        io.AOAPrintText("TaskID is out of range", Line22+20); 
        return -1000; 
    }

    if(cir.full() == 0)
    {
      cir.insert(taskid, 0, 0x05, tcbrno, timerc);  // insert(taskid, delay, state, tcbrno, timer)
      						 // timerc is the time received task started httptask
      if (TRACE_RECORD_FLAG)
         wttr.insert((taskid - MinTaskId), TASK_MASK_INSERT); //INSERT bit in the trace 
    }
    else
      io.AOAPrintText("apptask:insertHttpTask circular list is full", Line24);
  }
  else
     {

      io.AOAPrintText("apptask:insertHttpTask stack is empty", Line22+20);
      io.Application_Status = 2; 
      io.AOAExit(); 
     }

    //stk.printstack(Line4, 16); 
    //cir.printlist(Line7);   
  
return 0;
};

//-----------------------------------------
// Error Handling Call  
// When ever an error interrupt exception occurs (IDT)
//  it jumps into IDT entry, and invokes code in prcycle. 
//  The code in prcycle, will store a flag and interrupt code 
//  in shared memory S_Error_Flag and S_Error_Code. Then it 
//  will invoke int 08h. 
//  Thus, in Timer Interrupt task in apptask.cpp, the timer 
//  task will continuously check for the global error flag 
//  and if set, then it will call this routine. 
//  The error control and debugging now is controlled by 
//  the AO programmer!
//-----------------------------------------
void apptask::ErrorHandler(long s)
{
  EtherObj EO;
  int k = 0; 
  long data1 = 0; 
  long startAddr = 0; 
  char a; 
  long errorFlag = 0; 
  char* TraceStr = "                "; 
  AOATask      task;

  	   io.AOAsti();

	   io.AOAPrintText ("ERROR!", Line1); 

	   a = io.AOAgetCharacter();  //wait to read screen 
	   io.AOAclearScreen (0,4000);

	   errorFlag = io.AOAgetSharedMem(28);  //Interrupt Code 1Ch  
	   io.AOAPrintText ("Interrupt Code:", Line1+20); 
	   io.AOAprintHex (errorFlag, Line1+50); 
	   io.AOAPrintText ("Current Task: ", Line1+72); 
	   io.AOAprintHex (Current_Task, Line1+98); 
	   errorFlag = io.AOAgetSharedMem(0x20);  //20 S_IO_Function_Code 
	   io.AOAPrintText ("Fn_Code:", Line1+120); 
	   io.AOAprintHex (errorFlag, Line1+138); 
	   io.AOAPrintText ("CalledMethod: ", Line2); 


	   io.AOAgetSharedMemTraceString(TraceStr);
	   io.AOAPrintText (TraceStr, Line2+30); 
	   errorFlag = io.AOAgetSharedMem(0x4C);  //Lock 1  
	   io.AOAprintHex (errorFlag, Line3+100); 
	   errorFlag = io.AOAgetSharedMem(0x60);  //TID 1  
	   io.AOAprintHex (errorFlag, Line3+120); 

	   io.AOAPrintText ("STACK: ", Line3); 


	   for (k = 0; k < 48; k++) //24 entries of stack are printed  
				   
		{
		  //currently it is using the App1Stack_SEL, App1Code_SEL and so on 
		  // we need to change this to a stack where the a task generated error 
		  data1 = io.AOAgetStackPOP(k*4); 
		  io.AOAprintHex (data1, Line4 + k*20); 
		}


	  a = io.AOAgetCharacter();  //wait to read screen 

	  io.AOAPrintText ("Registers: " , Line7); 
	  //printing registers has some problem !!!needs fixing RKK 06-22-2005 
	  //io.AOAprintRegs (Line8); 

//	task.AOAprintTSS(Current_Task, Line17); 

	  a = io.AOAgetCharacter();  //wait to read screen 
	  
          a = 0x00;
	  while (a != 0x1B)  //escape character to exit loop
	  {
	  io.AOAPrintText("Enter Starting Address of Location: ",Line24); 
	  startAddr = io.AOAgetHex(); 
	   io.AOAclearScreen (0,4000);

	  for (k = 0; k < 128; k++)
	  {
	      data1 = io.AOAgetMem(startAddr + k*4); 
	      io.AOAprintHex (data1, Line2 +k * 20);
	  }
	   a = io.AOAgetCharacterInt(); 
          } //end of while

 	task.AOAapplink32(); //link to the main application app1tss
	io.AOAExit();        //return from timer task to application 
}; //end of error handling call 
//----------------------------------------------------------------------
// print statistics at the end of program 
//----------------------------------------------------------------------
void apptask::printStatistics()
 {
   TCPObj tcp; 

   io.AOAclearScreen (0,1758);  //Line1 through 10

   io.AOAPrintText("HttpRequests:",Line3); 
   io.AOAprintHex(tcp.HttpRequests,Line3+40); 
   io.AOAPrintText("GetCount:",Line3+80); 
   io.AOAprintHex(tcp.GetCount,Line3+120); 

   io.AOAPrintText("SynCount:",Line4); 
   io.AOAprintHex(tcp.SynCount,Line4+40); 
   io.AOAPrintText("SynAckCount:",Line4+80); 
   io.AOAprintHex(tcp.SynAckCount,Line4+120); 

   io.AOAPrintText("MaxSynGetTime:",Line5); 
   io.AOAprintHex(tcp.MaxSynGetTime,Line5+40); 
   io.AOAPrintText("MaxConnectionTime:",Line5+80); 
   io.AOAprintHex(tcp.MaxConnectionTime,Line5+120); 

   io.AOAPrintText("MaxNoOfTasksUsed:",Line6); 
   io.AOAprintHex(tcp.MaxNoOfTasksUsed,Line6+40); 
   io.AOAPrintText("MaxNoOfTCBsUsed:",Line6+80); 
   io.AOAprintHex(tcp.MaxNoOfTCBsUsed,Line6+120); 
   
   io.AOAPrintText("UpCNotSetCount:",Line7); 
   io.AOAprintHex(upCompleteNotSetCount,Line7+40); 
   io.AOAPrintText("NotForTNoddeCount:",Line7+80); 
   io.AOAprintHex(notForThisNodeCount, Line7+120); 

   io.AOAPrintText("NotARPIPCount:",Line8); 
   io.AOAprintHex(notArpOrIpCount, Line8+40); 
   io.AOAPrintText("MaxSynGetThresCount:",Line8+80); 
   io.AOAprintHex(tcp.MaxSynGetThreshCount,Line8+120); 

   io.AOAPrintText("NoOfRetransmissions",Line9); 
   io.AOAprintHex(tcp.NoOfRetransmissions,Line9+40);
   
   io.AOAPrintText("AverageSynGetTime",Line9+80); 
   io.AOAprintHex(tcp.TotalSynGetTime,Line9+120); 

 };
//----------------------------------------------------------------------
// check errors in the main task  
//----------------------------------------------------------------------
void apptask::checkErrors()
 {
   int rcvcount = 0; 
   EtherObj EO; 

	rcvcount = EO.getICR();   //get interrupt control register 
	if ((rcvcount & 0x00000040) == 1)
	  {
		io.AOAPrintText("MainTask: Receive Over Run Error Caused an Interrrupt!", Line23); 
		io.AOAprintHex(rcvcount, Line23+120); 
	  }

	if (EO.RDLfull())
	  {
	  io.AOAPrintText("MainTask: RDL Buffer is full!", Line23); 
	  io.AOAprintHex(EO.ReceiveOutPtr, Line23+80); 
	  io.AOAprintHex(EO.getRDTail(), Line23+100); 
	  }

	if (EO.ReceiveOutPtr > NO_OF_RDL) 
	  {
	    io.AOAPrintText("MainTask: Problem with RDL descriptors", Line23); 
	  }			 
 }; 
//-----------------------------------------------------------------------------------------
// create all other tasks, temp.cpp is simpler this way
//-----------------------------------------------------------------------------------------
void apptask::createOtherTasks()
{
	EtherObj EO;
	ARPObj arp; 
	TCPObj tcp;
	UDPObj udp;	
	IPObj ip;

	FTPObj ftp;	
	FTOPObj fto;
	//HTTPList http;
	WCirList cir;
	WStack stk;

	IntException intex;
	AOATask      task;          // aoa task object  
    int tcbsize = 0; 

	//char SrcIP[4]={0x0A, 0x37, 0x0A, 0x10};
	//char SrcIP[4]={0x0A, 0x37, 0x0A, 0x10};	
	//char SrcIP[4]={0x0A, 0x37, 0x0c, 237};//10.55.12.237	
	//char SrcIP[4]={0x0A, 0x37, 0x0A, 0xEB};	
	char SubNetMask[4] = {0xFF, 0xFF, 0xFF, 0x00};	
	//char GateWayIP[4] = {0x0A, 0x37, 0x0B, 0xFE};
	//char GateWayMAC[6] = {0x00, 0x25, 0x45, 0x59, 0x98, 0xbf};
	unsigned short SrcPort = 0x0050; 
	// FTP Parameters
	//char FTPServerIP[4] = {10, 55, 65, 25};
	unsigned short port  = 5008;
	unsigned short sport = 5000;
	int starthttptaskno=0;
	int endhttptaskno=0;
	int HTTPListInitStatus =0;
	int HTTPError;	
	int state = 0;
	int retcode = 0; 		//return code for a call  
	int id = 0;  			//Task ID
	long v2 = 0; 
	int i=0;
	long descht, desclt;	
	int taskid;
	long timer;
    char c; 

	// -----------------------------------------
	// Task related variables
	// ------------------------------------------
	long Task_ID;
    int serverid = 0; 
	long Function_Address_Array[100];

	//-------------------------------------------------------------
	// Function address or Task address related pointers   
    //-------------------------------------------------------------

    /*
    io.AOAPrintText("Enter Server ID:", Line0); 
    c = io.AOAgetCharacter(); 
    if (c == 0x31) 
        SrcIP[3] = 237;  //This server will be 238  
    else if (c == 0x32) 
        SrcIP[3] = 238;  //This server will be 238  
    else io.AOAPrintText("You entered a wrong server number, rerun again!", Line3+20); 
    */

    // int init(long base, int size);	
	stk.init(WSTACK_ADDR - ADDR_OFFSET, NO_HTTP_TASKS); 
    // int init(long base, int size);	
	cir.init(WCIRLIST_ADDR - ADDR_OFFSET, NO_OF_TASKS); 
	// int init(long base, int size);	
	wttr.init(TASKLIST_TRACE_ADDR - ADDR_OFFSET, NO_HTTP_TASKS); 

    pmfdOthers Function_Ptr_X = 0;          //pmfd type  	
    //---------------------------------------------------------------------------
	// For each task compute the function address and store it in the array 
    //---------------------------------------------------------------------------
	//Receive Task 
	Function_Ptr_X = &apptask::RcvTask;             //initialize the ptr with a function RcvTask  
	Function_Address_Array[4] = (long)getFunctionPtrOthers(Function_Ptr_X); // store funtion ptr in an array
	//Interface Task  
	Function_Ptr_X = &apptask::InterfaceTask;     //initialize the ptr with a function InterfaceTask 
	Function_Address_Array[5] = (long)getFunctionPtrOthers(Function_Ptr_X); // store funtion ptr in an array
	//FileTransfer Task  
	Function_Ptr_X = &apptask::FileTransferTask;     //initialize the ptr with a function FileTransferTask 
	Function_Address_Array[6] = (long)getFunctionPtrOthers(Function_Ptr_X); // store funtion ptr in an array        
	//Http Task  
	Function_Ptr_X = &apptask::HttpTask;     //initialize the ptr with a function HttpTask 
	Function_Address_Array[7] = (long)getFunctionPtrOthers(Function_Ptr_X); // store funtion ptr in an array   
	
	//---------------------------------------------------------------------------
	// Create Tasks 
	// --------------------------------------------------------------------------
	Task_ID=createTask((long)Function_Address_Array[4],0); //create a receive task  
	Task_ID=createTask((long)Function_Address_Array[5],0); //create an interface task  
	Task_ID=createTask((long)Function_Address_Array[6],0); //create an file transfer task  

	// task id 7 
	Task_ID=createTask((long)Function_Address_Array[7],0); //create an http task NOT USED 
	// task id 8 
	Task_ID=createTask((long)Function_Address_Array[7],0); //create an http task NOT USED 
	//starting HTTP task is 9, thus the above two tasks are dummy; they are 
	// not inserted into the circular list
	// task id 9 and more 
	
	for(i=0; i < NO_HTTP_TASKS; i++)
	{
	   Task_ID=createTask((long)Function_Address_Array[7],0); //create an http task  Task Id = 8,9,10,11...
	   if (i == 0) 
	     MinTaskId = Task_ID;  //minimal task id for HTTP tasks 
	   if(stk.full() == 0)
	   {
	     stk.push(Task_ID);
	   }
	   else
	     io.AOAPrintText("test.cpp stack is full", Line24);
	}

	MaxTaskId = Task_ID;  // maximum task id for HTTP tasks  
    //intex.IntExceptionInit();     //initialize exception code
         
	//prcycle gets the NIC port address and stores it in shared memory 
	id = io.AOAgetSharedMem(0x9c); //get NIC device address  
	EO.setBaseAddress(id);         //set the base address in the object 
	id = 0; 
	id = EO.getBaseAddress();        
	io.AOAprintHex(id, Line24); 

	//RKK-AW univeral mac EO.getMACEPROM(SrcMAC);
	
	retcode = EO.ColdReset();

	retcode = EO.inittest(DPD_ADDR, DPD_DATA, UPD_ADDR, UPD_DATA,SrcMAC);

	retcode = EO.TEnable();
	retcode = EO.REnable();

	io.AOAenableIRQCntlr(1,0xfe);  //enable harderware timer IRQ0 INT08h

	fto.init();
    fto.setMode(1);  //fault tolerant bit needs to be set for ARP to run

	arp.init(SrcIP, SubNetMask, GateWayIP, SrcMAC);
	ip.init(SrcIP);

	//  init(SrcIP[4],SourceMAC[6],SubnetMask[4],GwayIP[4],GwayMAC[6],SrcPort,
	//      TCPBuffBase,TCBBufferSize,NoTCBRecords, NoHashRecords)
    retcode = tcp.initRecord();    //initialize TCB Record Size 
    tcbsize = NO_OF_HASHRECORDS * 4 + tcp.sizeOfTCBRecord * NO_OF_TCBRECORDS; 
    retcode = tcp.init(SrcIP,SrcMAC, SubNetMask, GateWayIP, GateWayMAC, SrcPort, TCP_ADDR, 
           tcbsize, NO_OF_TCBRECORDS, NO_OF_HASHRECORDS);
	if(retcode != 0)
	{
	   io.AOAPrintText("Memory is not sufficient for creating tcb records", Line23); 
	   io.AOAExit();
	}
    //-------------------------------------------------------------------------------------
	// Hashtable  : 10,000 entries each 4 bytes   = 10,000 *  4   =    40,000	
	// TCB Record : 15,000 records each 320 bytes = 15,000 * 320  = 4,800,000
	// 							       ---------
	// 							        4,840,000 = 0x49da40
	//we always make the tcb table the multiple of 32 to convenience the reading of memory map in DOSC option 9 
    //-------------------------------------------------------------------------------------

	//  init( BufferBase, BufferSize, BufferIndexCount, hashIndexCount, ftpDestIP, ftpDestPort)
	ftp.init(FILE_ADDR, 0x04000000, 10000, 1000, FTPServerIP, port);
	// Hash Index (file: hashindex.cpp) : 1000 records each 4 bytes    =   1000 *  4 =    4,000
	// Resource Index (filenames)       : 10,000 buffers each 92 bytes = 10,000 * 92 =  920,000
	// Resource Buffer (files)          : depends on the total size of files (allocate as needed)
	// add the three values and give the result	
	// result = 67,108,864 (64MB 0x04000000) (including hash index and resource index) 											
	udp.init(SrcIP,sport);


	
	io.AOAPrintText("Initialized Objects",Line7);

	// Clear the Screen
	for(i=0;i<4000;i++)
	{
	    io.AOAprintCharacter('\x20',i);

	    i++;
	}
	
   io.AOAPrintText("Press\x20ny\x20key\x20to\x20load\x20the\x20Resources...",Line10);	
   c = io.AOAgetCharacter();
}

//-------------------------------------------------
long *getFunctionPtrOthers(pmfdOthers abc2)
{
//this approach uses xyz as a stack pointer to locate where the 
//  address of the function is stored 
long v2;
long *ab1;
long *xyz;
pmfdOthers abc1;                            //instance of a member ptr 
apptask first;                        //instance of a class 
xyz = (long *)&first;
abc1 = abc2;                  //initialize the ptr with a function 
xyz--;
ab1= (long*)*xyz;
return (long *)ab1;
};
//-----------------------------------------
// clear the screen and print the screen layout 
//-----------------------------------------
void apptask::printScreenLayout()
{
  int i = 0; 
  unsigned char ch = 0; 

   clearScreen(); 
   io.AOAPrintText ("DOSC Web Server, Running on the bare PC, Towson University", Line0+20); 
   io.AOAPrintText("01",Line1); 
   io.AOAPrintText("02",Line2); 
   io.AOAPrintText("03",Line3); 
   io.AOAPrintText("04",Line4); 
   io.AOAPrintText("05",Line5); 
   io.AOAPrintText("06",Line6); 
   io.AOAPrintText("07",Line7); 
   io.AOAPrintText("08",Line8); 
   io.AOAPrintText("09",Line9); 
   io.AOAPrintText("10",Line10); 
   io.AOAPrintText("11",Line11); 
   io.AOAPrintText("12",Line12); 
   io.AOAPrintText("13",Line13); 
   io.AOAPrintText("14",Line14); 
   io.AOAPrintText("15",Line15); 
   io.AOAPrintText("16",Line16); 
   io.AOAPrintText("17",Line17); 
   io.AOAPrintText("18",Line18); 
   io.AOAPrintText("19",Line19); 
   io.AOAPrintText("20",Line20); 
   io.AOAPrintText("21",Line21); 
   io.AOAPrintText("22",Line22); 
   io.AOAPrintText("23",Line23); 
   io.AOAPrintText("24",Line24); 
   io.AOAPrintText("1", Line1+6); 
   io.AOAPrintText("2", Line1+26); 
   io.AOAPrintText("3", Line1+46); 
   io.AOAPrintText("4", Line1+66); 
   io.AOAPrintText("5", Line1+86); 
   io.AOAPrintText("6", Line1+106); 
   io.AOAPrintText("7", Line1+126); 
   io.AOAPrintText("8", Line1+146); 
};
//-----------------------------------------
// after clearing the screen, you should use 
//  to print screen tags, which rows some text 
//-----------------------------------------
void apptask::printScreenTags()
{
    io.AOAPrintText("RCV:",Line3+6); 
    io.AOAPrintText("RcvIPtr", Line2+40); 
    io.AOAPrintText("RcvOPtr", Line2+60); 
    io.AOAPrintText("RXSize",  Line2+80); 
    io.AOAPrintText("upCnSet", Line2+100); 
    io.AOAPrintText("notFTnd", Line2+120); 
    io.AOAPrintText("TaskID",  Line2+140); 

    io.AOAPrintText("notArIP", Line4+20); 
    io.AOAPrintText("ARPcnt",  Line4+40); 
    io.AOAPrintText("IPcnt",   Line4+60); 
    io.AOAPrintText("SndINPtr",   Line4+80); 
    io.AOAPrintText("SndOUTtr",   Line4+100); 

   io.AOAPrintText("MAIN:", Line9+6); 
   io.AOAPrintText("runTsk", Line8+20); 
   io.AOAPrintText("CirCnt", Line8+40); 

    io.AOAPrintText("HTTP:",Line11+6);
    io.AOAPrintText("TaskID",Line10+140);
    io.AOAPrintText("RetCode",Line10+40);
    io.AOAPrintText("HttpCnt",Line10+60);
    io.AOAPrintText("TotHTTP",Line10+80);
    io.AOAPrintText("State", Line10+100); 
    io.AOAPrintText("Retr",Line10+120);
    io.AOAPrintText("MaxNTasks",Line12+20);
    io.AOAPrintText("MaxNTcbs",Line12+40);
    io.AOAPrintText("TraceCnt",Line12+60);
    io.AOAPrintText("DelCount",Line12+80);
    io.AOAPrintText("NoOfRsts",Line12+100);
    io.AOAPrintText("UnMatReq",Line12+120);
    io.AOAPrintText("taskDel",Line12+140);
};
//-----------------------------------------
// clear screen
//-----------------------------------------
void apptask::clearScreen()
{
   for(int i=0; i<4000;i++)
     {
      io.AOAprintCharacter(' ',i);
      i++;
     }
};
