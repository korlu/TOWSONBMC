// proc.h : main header file for the PROC application
//

#if !defined(AFX_PROC_H__E718C6CB_616A_4EE1_B1D1_A016A1098181__INCLUDED_)
#define AFX_PROC_H__E718C6CB_616A_4EE1_B1D1_A016A1098181__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"       // main symbols
#include "PCB.h"

/////////////////////////////////////////////////////////////////////////////
// CProcApp:
// See proc.cpp for the implementation of this class
//

class CProcApp : public CWinApp
{
public:
	int pid;					// pid counter
	int current;				// curent run process id
	CPCB* processes[1024];		// PCB array
	int	PRIQue[3][1024];		// priority que2
	int	PRI[3];					// the last element of priority ques
	CRITICAL_SECTION lock;		// to implement data access serilization
	CRITICAL_SECTION thread;	// used to control thread deleting
	int	threadID;				// current running thread id
	HANDLE threadHandle;		// current running thread handle

public:
	CProcApp();

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CProcApp)
	public:
	virtual BOOL InitInstance();
	virtual int ExitInstance();
	//}}AFX_VIRTUAL

// Implementation
	//{{AFX_MSG(CProcApp)
	afx_msg void OnAppAbout();
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};


/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_PROC_H__E718C6CB_616A_4EE1_B1D1_A016A1098181__INCLUDED_)

