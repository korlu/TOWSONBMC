#if !defined(AFX_PRIORITYDLG_H__12792D4C_34B5_4231_9601_2B3DB89C8036__INCLUDED_)
#define AFX_PRIORITYDLG_H__12792D4C_34B5_4231_9601_2B3DB89C8036__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// PriorityDlg.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CPriorityDlg dialog

class CPriorityDlg : public CDialog
{
// Construction
public:
	CPriorityDlg(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CPriorityDlg)
	enum { IDD = IDD_DIALOG2 };
	int		m_ppid;
	int		m_priority;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CPriorityDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CPriorityDlg)
	virtual void OnOK();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_PRIORITYDLG_H__12792D4C_34B5_4231_9601_2B3DB89C8036__INCLUDED_)
