#if !defined(AFX_DELETEDLG_H__5B02C19C_E8EA_4189_9F87_A5CDCFB29B59__INCLUDED_)
#define AFX_DELETEDLG_H__5B02C19C_E8EA_4189_9F87_A5CDCFB29B59__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// DeleteDlg.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CDeleteDlg dialog

class CDeleteDlg : public CDialog
{
// Construction
public:
	CDeleteDlg(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CDeleteDlg)
	enum { IDD = IDD_DIALOG1 };
	int		m_pid;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDeleteDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CDeleteDlg)
	virtual void OnOK();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_DELETEDLG_H__5B02C19C_E8EA_4189_9F87_A5CDCFB29B59__INCLUDED_)
