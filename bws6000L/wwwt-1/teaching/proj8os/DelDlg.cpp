// DeleteDlg.cpp : implementation file
//

#include "stdafx.h"
#include "proc.h"
#include "DeleteDlg.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

extern CProcApp theApp;

/////////////////////////////////////////////////////////////////////////////
// CDeleteDlg dialog


CDeleteDlg::CDeleteDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CDeleteDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CDeleteDlg)
	m_pid = 0;
	//}}AFX_DATA_INIT
}


void CDeleteDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CDeleteDlg)
	DDX_Text(pDX, IDC_EDIT1, m_pid);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CDeleteDlg, CDialog)
	//{{AFX_MSG_MAP(CDeleteDlg)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDeleteDlg message handlers

void CDeleteDlg::OnOK() 
{
	// TODO: Add extra validation here
	
	CDialog::OnOK();
}
