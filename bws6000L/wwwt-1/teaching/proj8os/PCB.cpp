// PCB.cpp: implementation of the CPCB class.
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "proc.h"
#include "PCB.h"
#include "time.h"
#include "stringfile.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

extern CProcApp theApp;
//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

CPCB::CPCB(CString name, CString path)
{
	Pname = CString(name);
	Path = path;
	Arrival = CTime::GetCurrentTime();
	Counter = 1;
	theApp.pid++;
	Finished = false;
	scheduled = false;
	parent = -1;
	self = 0;
	
	// right now if we have loaded more than 1024 processes exit with error
	if(theApp.pid > 1024){
		AfxMessageBox("Load more than 1024 processes!");
		theApp.ExitInstance();
	}

	Pid = theApp.pid;

	// open file
	CStringFile process;
	CString line;
	//process.Open( path + name + ".txt" );
	process.Open( path );

	// read estimated run time
	int est;
	process.GetNextLine(line);
	sscanf(line, "%d", &est);
	Estimated = est;

	// red priority
	int pri;
	process.GetNextLine(line);
	sscanf(line, "%d", &pri);
	Priority = pri;

	// close file
	process.Close();
}

CPCB::~CPCB()
{
}

int CPCB::getPID()
{
	return Pid;
}

int CPCB::getPriority()
{
	return Priority;
}

void CPCB::elapse()
{
	Counter++;
	Estimated--;
	if(0 == Estimated)
		Finished = true;
}

bool CPCB::isFinished()
{
	return Finished;
}

int CPCB::getEIP()
{
	return Counter;
}

void CPCB::run()
{
	// Enter critical section to prevent being deleted
	EnterCriticalSection(&(theApp.thread));

	// read instruction from file and execute
    CStringFile process;
	CString szLine;
	int counter = Counter;

	if(Finished)
		return;

	process.Open( Path );

	while(process.GetNextLine(szLine) != 0){
		// run next instruction
		char ip;
		ip = szLine[0];
		
		CString pchild;
		CString childname;
		CString name;
		CString elapse;
		CPCB* p;
		int pid;
		int pri;
		int element;
		int len;

		switch(ip){
			case 'f':
			    // fork another process
				pchild = szLine.Right(szLine.GetLength()-2);
				childname = pchild.Left(pchild.GetLength()-4);
				p = new CPCB(childname, pchild);

				// set parent
				p->setParent(theApp.current);

				// store it in process arrray
			    pid = p->getPID();
			    pri = p->getPriority();
				  
			    // need to serilization data access to these datas
			    EnterCriticalSection(&(theApp.lock));

			    element = theApp.PRI[pri];
			    theApp.processes[pid] = p;
			    theApp.PRIQue[pri][element] = pid;
				  
			    // change que counter
			    theApp.PRI[pri]++;
				  
			    LeaveCriticalSection(&(theApp.lock));
				break;
			case 's':
				elapse = szLine.Right(szLine.GetLength()-2);
				sscanf(elapse,"%d",&len);
				Estimated+= len;
				break;
			case 'a':
				Finished = true;
				Estimated = 0;
		}

		counter++;
	}

	// we are finished
	scheduled = true;

	process.Close();

	// Leave critical section to free resource
	LeaveCriticalSection(&(theApp.thread));
}

void CPCB::addEstimated(int est)
{
	Estimated += est;
}

void CPCB::setParent(int pid)
{
	parent = pid;
}

void CPCB::setPriority(int value)
{
	Priority = value;
}

int CPCB::getParent()
{
	return parent;
}

int CPCB::getEstimated()
{
	return Estimated;
}

CTime CPCB::getArrival()
{
	return Arrival;
}

CString CPCB::getName()
{
	return Pname;
}

CString CPCB::getPname()
{
	return Path;
}

HTREEITEM CPCB::getSelf()
{
	return self;
}

bool CPCB::runOnce()
{
	return scheduled;
}

void CPCB::setSelf(HTREEITEM value)
{
	self = value;
}
