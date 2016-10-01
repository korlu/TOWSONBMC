// procView.h : interface of the CProcView class
//
/////////////////////////////////////////////////////////////////////////////

#if !defined(AFX_PROCVIEW_H__A2B88B40_4A9A_4269_AF51_C09FC1CFA985__INCLUDED_)
#define AFX_PROCVIEW_H__A2B88B40_4A9A_4269_AF51_C09FC1CFA985__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#include "TreeListCtrl.h"
#include "TreeToolTipCtrl.h"
#include "ProcDoc.h"

class CProcView : public CView
{
protected: // create from serialization only
	CProcView();
	DECLARE_DYNCREATE(CProcView)

// Attributes
public:
	CProcDoc* GetDocument();

// **************************************************************************
private:
	int	m_nTimer;

// Public properties
	CImageList m_cImageList;
	CImageList m_StatusImageList;

//attributes
public:
	BOOL m_RTL;
	CFont m_headerFont;
	CTreeListCtrl m_tree;
	CScrollBar m_horScrollBar;
private:	
	void DisplayToolTip(CPoint point,TVHITTESTINFO hInfo, CString colText);		
	CTreeToolTipCtrl m_tooltip;	
	BOOL m_TLInitialized;	
	void schedule();

// Operations
public:
	static LONG FAR PASCAL DummyWndProc(HWND, UINT, WPARAM, LPARAM);
	void Initialize();

public:
	//static void RegisterClass();	
	void SortTree(int nCol, BOOL bAscending, HTREEITEM hParent);	
	void ResetScrollBar();

	BOOL VerticalScrollVisible();
	BOOL HorizontalScrollVisible();

	int StretchWidth(int m_nWidth, int m_nMeasure);

// **************************************************************************

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CProcView)
	public:
	virtual BOOL OnNotify(WPARAM wParam, LPARAM lParam, LRESULT* pResult);
	virtual void OnDraw(CDC* pDC);  // overridden to draw this view
	virtual BOOL PreCreateWindow(CREATESTRUCT& cs);
	virtual void OnInitialUpdate();
	virtual BOOL PreTranslateMessage(MSG* pMsg);	
	virtual BOOL DestroyWindow();
	protected:
	virtual BOOL OnPreparePrinting(CPrintInfo* pInfo);
	virtual void OnBeginPrinting(CDC* pDC, CPrintInfo* pInfo);
	virtual void OnEndPrinting(CDC* pDC, CPrintInfo* pInfo);
	virtual void OnActivateView(BOOL bActivate, CView* pActivateView, CView* pDeactiveView);
	//}}AFX_VIRTUAL

// Implementation
public:
	void updateProc();
	virtual ~CProcView();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:

// Generated message map functions
protected:
	//{{AFX_MSG(CProcView)
	afx_msg void OnAppAbout();
	afx_msg void OnProcessPriority();
	afx_msg void OnSize(UINT nType, int cx, int cy);		
	afx_msg void OnHScroll(UINT nSBCode, UINT nPos, CScrollBar* pScrollBar);	    
	afx_msg void OnContextMenu(CWnd* pWnd, CPoint point);	
	afx_msg void OnOpen();
	afx_msg void OnTimer(UINT nIDEvent);
	afx_msg void OnShowWindow(BOOL bShow, UINT nStatus);
	afx_msg void OnDestroy();
	afx_msg void OnKill();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

#ifndef _DEBUG  // debug version in procView.cpp
inline CProcDoc* CProcView::GetDocument()
   { return (CProcDoc*)m_pDocument; }
#endif

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_PROCVIEW_H__A2B88B40_4A9A_4269_AF51_C09FC1CFA985__INCLUDED_)
