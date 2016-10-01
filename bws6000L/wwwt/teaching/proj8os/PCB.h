// PCB.h: interface for the CPCB class.
//
//////////////////////////////////////////////////////////////////////
#include <string>

#if !defined(AFX_PCB_H__7160C5E6_A266_4964_B885_D898642BD51C__INCLUDED_)
#define AFX_PCB_H__7160C5E6_A266_4964_B885_D898642BD51C__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

class CPCB  
{
private:
	CString Pname;
	CString Path;
	int	Pid;			// process pid
	int parent;			// paretn pid
	CTime Arrival;		// arrival time
	int	Estimated;		// estimated excution time
	int	Priority;		// process priority
	int	Counter;		// next instruction to be executed
	bool Finished;		// finished reading process file
	bool scheduled;		// first run time or has been scheduled
	HTREEITEM self;		// its self value in the tree

public:
	void setSelf(HTREEITEM value);
	bool runOnce();
	HTREEITEM getSelf();
	void setPriority(int value);
	void setParent(int pid);
	void addEstimated(int est);
	void run();
	bool isFinished();
	void elapse();
	CPCB(CString name, CString path);
	virtual ~CPCB();

	int getPID();
	int getPriority();
	int getEIP();
	CString getPname();
	CString getName();
	CTime getArrival();
	int getEstimated();
	int getParent();
};

#endif // !defined(AFX_PCB_H__7160C5E6_A266_4964_B885_D898642BD51C__INCLUDED_)
