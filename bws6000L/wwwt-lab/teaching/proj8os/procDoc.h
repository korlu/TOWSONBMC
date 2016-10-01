// procDoc.h : interface of the CProcDoc class
//
/////////////////////////////////////////////////////////////////////////////

#if !defined(AFX_PROCDOC_H__DE97E049_58CC_45E2_A2BC_FA437D2ED32D__INCLUDED_)
#define AFX_PROCDOC_H__DE97E049_58CC_45E2_A2BC_FA437D2ED32D__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000


class CProcDoc : public CDocument
{
protected: // create from serialization only
	CProcDoc();
	DECLARE_DYNCREATE(CProcDoc)

// Attributes
public:

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CProcDoc)
	public:
	virtual BOOL OnNewDocument();
	virtual void Serialize(CArchive& ar);
	virtual CView* GetNextView(POSITION& rPosition) const;
	//}}AFX_VIRTUAL

// Implementation
public:
	virtual ~CProcDoc();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:

// Generated message map functions
protected:
	//{{AFX_MSG(CProcDoc)
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_PROCDOC_H__DE97E049_58CC_45E2_A2BC_FA437D2ED32D__INCLUDED_)
