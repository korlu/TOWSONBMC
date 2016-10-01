// PriorityDlg.cpp : implementation file
//

#include "stdafx.h"
#include "proc.h"
#include "PriorityDlg.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

extern CProcApp theApp;

/////////////////////////////////////////////////////////////////////////////
// CPriorityDlg dialog


CPriorityDlg::CPriorityDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CPriorityDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CPriorityDlg)
	m_ppid = 0;
	m_priority = 0;
	//}}AFX_DATA_INIT
}


void CPriorityDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CPriorityDlg)
	DDX_Text(pDX, IDC_EDIT1, m_ppid);
	DDX_Text(pDX, IDC_EDIT2, m_priority);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CPriorityDlg, CDialog)
	//{{AFX_MSG_MAP(CPriorityDlg)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CPriorityDlg message handlers

void CPriorityDlg::OnOK() 
{
	// TODO: Add extra validation here
	
	UpdateData();

	int oldPriority = -1;
	
	if(theApp.processes[m_ppid] == NULL){
		AfxMessageBox("Input a valid process ID!");
		return;
	}

	oldPriority = theApp.processes[m_ppid]->getPriority();

	if(oldPriority == m_priority){
		AfxMessageBox("Input a difirrent priority for the process!");
		return;
	}

	CDialog::OnOK();
}
