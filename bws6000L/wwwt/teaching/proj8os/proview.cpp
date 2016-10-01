// procView.cpp : implementation of the CProcView class
//

#include "stdafx.h"
#include "proc.h"

#include "procDoc.h"
#include "procView.h"
#include "deletedlg.h"
#include "prioritydlg.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

#define ID_EDIT_FIELD   333
#define ID_TREE_LIST_HEADER 337
#define ID_TREE_LIST_CTRL   373
#define ID_TREE_LIST_SCROLLBAR   377

#define TIMER_INTERVAL		20000

extern CProcApp theApp;

DWORD WINAPI threadFunction(LPVOID lpParameter)
{
	int pid = theApp.current;
	theApp.processes[pid]->run();

	return 0;
}

/////////////////////////////////////////////////////////////////////////////
// CProcView

IMPLEMENT_DYNCREATE(CProcView, CView)

BEGIN_MESSAGE_MAP(CProcView, CView)
	//{{AFX_MSG_MAP(CProcView)
	ON_COMMAND(ID_APP_ABOUT, OnAppAbout)
	ON_COMMAND(ID_PROCESS_PRIORITY, OnProcessPriority)
	ON_WM_SIZE()
	ON_WM_HSCROLL()		
	ON_WM_CONTEXTMENU()
	ON_COMMAND(ID_OPEN, OnOpen)
	ON_WM_TIMER()
	ON_WM_SHOWWINDOW()
	ON_WM_DESTROY()
	ON_COMMAND(ID_KILL, OnKill)
	//}}AFX_MSG_MAP
	// Standard printing commands
	ON_COMMAND(ID_FILE_PRINT, CView::OnFilePrint)
	ON_COMMAND(ID_FILE_PRINT_DIRECT, CView::OnFilePrint)
	ON_COMMAND(ID_FILE_PRINT_PREVIEW, CView::OnFilePrintPreview)
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CProcView construction/destruction

CProcView::CProcView()
{
	// TODO: add construction code here
	m_TLInitialized=FALSE;
	m_nTimer = 1000;

	//CP
	for(int i=0; i<3; i++){
		theApp.PRI[i] = 0;
	}
}

CProcView::~CProcView()
{
	
}

BOOL CProcView::PreCreateWindow(CREATESTRUCT& cs)
{
	// TODO: Modify the Window class or styles here by modifying
	//  the CREATESTRUCT cs

	return CView::PreCreateWindow(cs);
}

/////////////////////////////////////////////////////////////////////////////
// CProcView drawing

void CProcView::OnDraw(CDC* pDC)
{
	CProcDoc* pDoc = GetDocument();
	ASSERT_VALID(pDoc);
	// TODO: add draw code for native data here
}

/////////////////////////////////////////////////////////////////////////////
// CProcView printing

BOOL CProcView::OnPreparePrinting(CPrintInfo* pInfo)
{
	// default preparation
	return DoPreparePrinting(pInfo);
}

void CProcView::OnBeginPrinting(CDC* /*pDC*/, CPrintInfo* /*pInfo*/)
{
	// TODO: add extra initialization before printing
}

void CProcView::OnEndPrinting(CDC* /*pDC*/, CPrintInfo* /*pInfo*/)
{
	// TODO: add cleanup after printing
}

/////////////////////////////////////////////////////////////////////////////
// CProcView diagnostics

#ifdef _DEBUG
void CProcView::AssertValid() const
{
	CView::AssertValid();
}

void CProcView::Dump(CDumpContext& dc) const
{
	CView::Dump(dc);
}

CProcDoc* CProcView::GetDocument() // non-debug version is inline
{
	ASSERT(m_pDocument->IsKindOf(RUNTIME_CLASS(CProcDoc)));
	return (CProcDoc*)m_pDocument;
}
#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// CProcView message handlers

void CProcView::OnAppAbout(void){
	// TODO:
}

// **************************************************************************
// CView standard message handler
void CProcView::OnInitialUpdate() 
{
	CView::OnInitialUpdate();
	
	// TODO: Add your specialized code here and/or call the base class
	Initialize();	

	// create image list for tree
	m_cImageList.Create(IDB_TREE_PICTURES, 16, 10, RGB(255, 255, 255));
	m_tree.SetImageList(&m_cImageList, TVSIL_NORMAL);

	// create image list for check boxes assocaited with tree
	m_StatusImageList.Create(IDB_CHECKBOXSTATUS, 16, 2, RGB (255,255,255));	
	m_tree.SetImageList(&m_StatusImageList, TVSIL_STATE );

	CRect m_wndRect;
	GetClientRect(&m_wndRect);
	MoveWindow(0, 0, m_wndRect.Width(), m_wndRect.Height());

	// insert Columns in list for tree
	{
		m_tree.InsertColumn(0, "Property name", LVCFMT_LEFT, 260);
		m_tree.InsertColumn(1, "Property value", LVCFMT_LEFT, 260);
		//m_tree.InsertColumn(2, "Value", LVCFMT_RIGHT, 60);
	}
		
	m_tooltip.Create(this);
	m_tooltip.Activate(TRUE);
	m_tooltip.AddTool(GetDlgItem(ID_TREE_LIST_CTRL),"whatever");

	m_TLInitialized = TRUE;		

	updateProc();
}

LONG FAR PASCAL CProcView::DummyWndProc(HWND h, UINT u, WPARAM w, LPARAM l)
{
	return ::DefWindowProc(h, u, w, l);
}

void CProcView::Initialize()
{
	// creates all the objects in frame -
	// header, tree, horizontal scroll bar

	CRect m_wndRect;
	GetWindowRect(&m_wndRect);
	CRect m_headerRect;

	// create the header
	{
		m_headerRect.left = m_headerRect.top = -1;
		m_headerRect.right = m_wndRect.Width();

		m_tree.m_wndHeader.Create(WS_CHILD | WS_VISIBLE | HDS_BUTTONS | HDS_HORZ, m_headerRect, this, ID_TREE_LIST_HEADER);
	}

	CSize textSize;
	// set header's pos, dimensions and image list
	{
		CDC *pDC = m_tree.m_wndHeader.GetDC();
		pDC->SelectObject(&m_tree.m_headerFont);
		textSize = pDC->GetTextExtent("A");
		m_tree.m_wndHeader.ReleaseDC(pDC); 

		m_tree.m_wndHeader.SetWindowPos(&wndTop, -1, -1, m_headerRect.Width(), textSize.cy+4, SWP_SHOWWINDOW);

		m_tree.m_cImageList.Create(IDB_HEADER, 16, 10, 0);
		m_tree.m_wndHeader.SetImageList(&m_tree.m_cImageList);		
	}

	CRect m_treeRect;

	// create the tree itself
	{
		GetWindowRect(&m_wndRect);

		m_treeRect.left=0;
		m_treeRect.top = textSize.cy+4;
		m_treeRect.right = m_headerRect.Width()-5;
		m_treeRect.bottom = m_wndRect.Height()-GetSystemMetrics(SM_CYHSCROLL)-4;

		m_tree.Create(WS_CHILD | WS_VISIBLE | TVS_HASLINES | TVS_LINESATROOT | TVS_HASBUTTONS | TVS_SHOWSELALWAYS,m_treeRect, this, ID_TREE_LIST_CTRL);
	}

	// finally, create the horizontal scroll bar
	{
		CRect m_scrollRect;
		m_scrollRect.left=0;
		m_scrollRect.top = m_treeRect.bottom;
		m_scrollRect.right = m_treeRect.Width()-GetSystemMetrics(SM_CXVSCROLL);
		m_scrollRect.bottom = m_wndRect.bottom;

		m_horScrollBar.Create(WS_CHILD | WS_VISIBLE | WS_DISABLED | SBS_HORZ | SBS_TOPALIGN, m_scrollRect, this, ID_TREE_LIST_SCROLLBAR);
	}

	SortTree(0, TRUE, m_tree.GetRootItem());	
}

BOOL CProcView::VerticalScrollVisible()
{	
	int sMin, sMax;
	m_tree.GetScrollRange(SB_VERT, &sMin, &sMax);	
	return sMax!=0;
}

BOOL CProcView::HorizontalScrollVisible()
{
	int sMin, sMax;
	m_horScrollBar.GetScrollRange(&sMin, &sMax);
	return sMax!=0;
}

int CProcView::StretchWidth(int m_nWidth, int m_nMeasure)
{	
	return ((m_nWidth/m_nMeasure)+1)*m_nMeasure;//put the fixed for +1 in brackets f/0 error
}


void CProcView::ResetScrollBar()
{
	// resetting the horizontal scroll bar

	int m_nTotalWidth=0, m_nPageWidth;

	CRect m_treeRect;
	m_tree.GetClientRect(&m_treeRect);

	CRect m_wndRect;
	GetClientRect(&m_wndRect);

	CRect m_headerRect;
	m_tree.m_wndHeader.GetClientRect(&m_headerRect);

	CRect m_barRect;
	m_horScrollBar.GetClientRect(m_barRect);

	m_nPageWidth = m_treeRect.Width();

	m_nTotalWidth = m_tree.GetColumnsWidth();

	if(m_nTotalWidth > m_nPageWidth)
	{
		// show the scroll bar and adjust it's size
		{
			m_horScrollBar.EnableWindow(TRUE);

			m_horScrollBar.ShowWindow(SW_SHOW);

			// the tree becomes smaller
			m_tree.SetWindowPos(&wndTop, 0, 0, m_wndRect.Width(), m_wndRect.Height()-m_barRect.Height()-m_headerRect.Height(), SWP_NOMOVE);

			if(!VerticalScrollVisible())
				// i.e. vertical scroll bar isn't visible
			{
				m_horScrollBar.SetWindowPos(&wndTop, 0, 0, m_wndRect.Width(), m_barRect.Height(), SWP_NOMOVE);
			}
			else
			{
				m_horScrollBar.SetWindowPos(&wndTop, 0, 0, m_wndRect.Width() - GetSystemMetrics(SM_CXVSCROLL), m_barRect.Height(), SWP_NOMOVE);
			}
		}

		m_horScrollBar.SetScrollRange(0, m_nTotalWidth-m_nPageWidth);

		// recalculate the offset
		{
			CRect m_wndHeaderRect;
			m_tree.m_wndHeader.GetWindowRect(&m_wndHeaderRect);
			ScreenToClient(&m_wndHeaderRect);

			m_tree.m_nOffset = m_wndHeaderRect.left;
			m_horScrollBar.SetScrollPos(-m_tree.m_nOffset);
		}
	}
	else
	{
		m_horScrollBar.EnableWindow(FALSE);

		// we no longer need it, so hide it!
		{
			m_horScrollBar.ShowWindow(SW_HIDE);

			m_tree.SetWindowPos(&wndTop, 0, 0, m_wndRect.Width(), m_wndRect.Height() - m_headerRect.Height(), SWP_NOMOVE);
			// the tree takes scroll's place
		}

		m_horScrollBar.SetScrollRange(0, 0);

		// set scroll offset to zero
		{
			m_tree.m_nOffset = 0;
			m_tree.Invalidate();
			CRect m_headerRect;
			m_tree.m_wndHeader.GetWindowRect(&m_headerRect);
			CRect m_wndRect;
			GetClientRect(&m_wndRect);
			m_tree.m_wndHeader.SetWindowPos(&wndTop, m_tree.m_nOffset, 0, max(StretchWidth(m_tree.GetColumnsWidth(),m_wndRect.Width()),m_wndRect.Width()), m_headerRect.Height(), SWP_SHOWWINDOW);
		}
	}
}

void CProcView::OnHScroll(UINT nSBCode, UINT nPos, CScrollBar* pScrollBar) 
{
	CRect m_treeRect;
	m_tree.GetClientRect(&m_treeRect);
	
	// if horizontal scroll bar 
	if(pScrollBar == &m_horScrollBar)
	{
		int m_nCurPos = m_horScrollBar.GetScrollPos();
		int m_nPrevPos = m_nCurPos;
		// decide what to do for each diffrent scroll event
		switch(nSBCode)
		{
			case SB_LEFT:			m_nCurPos = 0;
									break;
			case SB_RIGHT:			m_nCurPos = m_horScrollBar.GetScrollLimit()-1;
									break;
			case SB_LINELEFT:		m_nCurPos = max(m_nCurPos-6, 0);
									break;
			case SB_LINERIGHT:		m_nCurPos = min(m_nCurPos+6, m_horScrollBar.GetScrollLimit()-1);
									break;
			case SB_PAGELEFT:		m_nCurPos = max(m_nCurPos-m_treeRect.Width(), 0);
									break;
			case SB_PAGERIGHT:		m_nCurPos = min(m_nCurPos+m_treeRect.Width(), m_horScrollBar.GetScrollLimit()-1);
									break;
			case SB_THUMBTRACK:
			case SB_THUMBPOSITION:  if(nPos==0)
									    m_nCurPos = 0;
								    else
									    m_nCurPos = min(StretchWidth(nPos, 6), m_horScrollBar.GetScrollLimit()-1);
								    break;
		}		

		m_horScrollBar.SetScrollPos(m_nCurPos);
		m_tree.m_nOffset = -m_nCurPos;

		// smoothly scroll the tree control
		{
			CRect m_scrollRect;
			m_tree.GetClientRect(&m_scrollRect);
			m_tree.ScrollWindow(m_nPrevPos - m_nCurPos, 0, &m_scrollRect, &m_scrollRect);
		}

		CRect m_headerRect;
		m_tree.m_wndHeader.GetWindowRect(&m_headerRect);
		CRect m_wndRect;
		GetClientRect(&m_wndRect);		

		m_tree.m_wndHeader.SetWindowPos(&wndTop, m_tree.m_nOffset, 0, max(StretchWidth(m_tree.GetColumnsWidth(),m_treeRect.Width()),m_wndRect.Width()), m_headerRect.Height(), SWP_SHOWWINDOW);
	}
	
	CView::OnHScroll(nSBCode, nPos, pScrollBar);
}

void CProcView::SortTree(int nCol, BOOL bAscending, HTREEITEM hParent)
{		
	HTREEITEM hChild=NULL;
	HTREEITEM hPa = hParent;
	
	while(hPa!=NULL)
	{
		if(m_tree.ItemHasChildren(hPa))
		{			
			m_tree.SortItems(nCol, bAscending, hPa);
			SortTree(nCol, bAscending, hChild);			
		}			

		hPa = m_tree.GetNextSiblingItem(hPa);
	}
	
	/*else
	{	
		HTREEITEM ChildOfParent=NULL;
		HTREEITEM ChildOfPChild=NULL;
		while(hPa!=NULL)
		{
			if(m_tree.ItemHasChildren(hPa))
			{
				ChildOfParent=m_tree.GetChildItem(hPa);
				while(ChildOfParent!=NULL)
				{						
					m_tree.SortItems(nCol,bAscending,ChildOfParent);
					ChildOfParent = m_tree.GetNextSiblingItem(ChildOfParent);
				}
				
			}
			hPa = m_tree.GetNextSiblingItem(hPa);
		}	
	}*/		
}

BOOL CProcView::OnNotify(WPARAM wParam, LPARAM lParam, LRESULT* pResult) 
{
	HD_NOTIFY *pHDN = (HD_NOTIFY*)lParam;	

	if((wParam == ID_TREE_LIST_HEADER) && (pHDN->hdr.code == HDN_ITEMCLICK))
	{
		int nCol = pHDN->iItem;

		BOOL bAscending = FALSE;

		if(m_tree.m_wndHeader.GetItemImage(nCol)==-1)
			bAscending = TRUE;
		else
		if(m_tree.m_wndHeader.GetItemImage(nCol)==1)
			bAscending = TRUE;

		for(int i=0;i<m_tree.GetColumnsNum();i++)
		{
			m_tree.m_wndHeader.SetItemImage(i, -1);
		}

		if(bAscending)
			m_tree.m_wndHeader.SetItemImage(nCol, 0);
		else
			m_tree.m_wndHeader.SetItemImage(nCol, 1);

		m_tree.SortItems(nCol, bAscending, NULL);
		SortTree(nCol, bAscending, m_tree.GetRootItem());

		m_tree.UpdateWindow();
	}
	else
	if((wParam == ID_TREE_LIST_HEADER) && (pHDN->hdr.code == HDN_ITEMCHANGED))
	{
		int m_nPrevColumnsWidth = m_tree.GetColumnsWidth();
		m_tree.RecalcColumnsWidth();
		ResetScrollBar();

		// in case we were at the scroll bar's end,
		// and some column's width was reduced,
		// update header's position (move to the right).
		CRect m_treeRect;
		m_tree.GetClientRect(&m_treeRect);

		CRect m_headerRect;
		m_tree.m_wndHeader.GetClientRect(&m_headerRect);

		if((m_nPrevColumnsWidth > m_tree.GetColumnsWidth()) &&
		   (m_horScrollBar.GetScrollPos() == m_horScrollBar.GetScrollLimit()-1) &&
		   (m_treeRect.Width() < m_tree.GetColumnsWidth()))
		{
			m_tree.m_nOffset = -m_tree.GetColumnsWidth()+m_treeRect.Width();
			m_tree.m_wndHeader.SetWindowPos(&wndTop, m_tree.m_nOffset, 0, 0, 0, SWP_NOSIZE);
		}

		m_tree.Invalidate();
	}
	else
		GetParent()->SendMessage(WM_NOTIFY, wParam, lParam);
	
	return CView::OnNotify(wParam, lParam, pResult);
}

void CProcView::OnContextMenu(CWnd* pWnd, CPoint point) 
{	
	GetParent()->SendMessage(WM_CONTEXTMENU, (WPARAM)pWnd, MAKELPARAM(point.x, point.y) ); 
}

void CProcView::OnSize(UINT nType, int cx, int cy) 
{
	SetScrollRange(SB_HORZ, 0, 0);
	SetScrollRange(SB_VERT, 0, 0);

	if(m_TLInitialized)
	{	
		// resize all the controls	
		CRect m_wndRect;
		GetClientRect(&m_wndRect);

		CRect m_headerRect;
		m_tree.m_wndHeader.GetClientRect(&m_headerRect);
		m_tree.m_wndHeader.SetWindowPos(&wndTop, 0, 0, m_wndRect.Width(), m_headerRect.Height(), SWP_NOMOVE);

		CRect m_scrollRect;
		m_horScrollBar.GetClientRect(&m_scrollRect);

		m_tree.SetWindowPos(&wndTop, 0, 0, m_wndRect.Width(), m_wndRect.Height() - m_scrollRect.Height(), SWP_NOMOVE);

		CRect m_treeRect;
		m_tree.GetClientRect(&m_treeRect);
		m_horScrollBar.MoveWindow(0, m_treeRect.bottom, m_wndRect.Width(), m_scrollRect.Height());

		if(m_tree.GetColumnsWidth() > m_treeRect.Width())
		{
			// show the horz scroll bar
			{
				CRect m_barRect;
				m_horScrollBar.GetClientRect(&m_barRect);			

				m_horScrollBar.EnableWindow(TRUE);

				m_horScrollBar.ShowWindow(SW_SHOW);

				// the tree becomes smaller
				m_tree.SetWindowPos(&wndTop, 0, 0, m_wndRect.Width(), m_wndRect.Height()-m_barRect.Height()-m_headerRect.Height(), SWP_NOMOVE);

				int tfdsfsd=m_wndRect.Width() - GetSystemMetrics(SM_CXVSCROLL);
				m_horScrollBar.SetWindowPos(&wndTop, 0, 0, m_wndRect.Width() - GetSystemMetrics(SM_CXVSCROLL), m_barRect.Height(), SWP_NOMOVE);
				
			}

			m_horScrollBar.SetScrollRange(0, m_tree.GetColumnsWidth()-m_treeRect.Width());

		}
		else
		{
			// hide the scroll bar
			{
				m_horScrollBar.EnableWindow(FALSE);

				m_horScrollBar.ShowWindow(SW_HIDE);

				// the tree becomes larger
				m_tree.SetWindowPos(&wndTop, 0, 0, m_wndRect.Width(), m_wndRect.Height()-m_headerRect.Height(), SWP_NOMOVE);				
			}

			m_horScrollBar.SetScrollRange(0, 0);
		}

		m_tree.ResetVertScrollBar();
		
		// Reset the header control position and scroll
		// the tree control as required.
		int m_nCurPos = m_horScrollBar.GetScrollPos();
		m_tree.m_nOffset = -m_nCurPos;
	
		// smoothly scroll the tree control
	    {
		CRect m_scrollRect;
		m_tree.GetClientRect(&m_scrollRect);
		m_tree.ScrollWindow(m_nCurPos, 0, &m_scrollRect, &m_scrollRect);
		}
		m_tree.m_wndHeader.GetWindowRect(&m_headerRect);	
		GetClientRect(&m_wndRect);

		m_tree.m_wndHeader.SetWindowPos(&wndTop, m_tree.m_nOffset, 0,max(StretchWidth(m_tree.GetColumnsWidth(),m_treeRect.Width()),m_wndRect.Width()), m_headerRect.Height(),SWP_SHOWWINDOW);			
	}	
}


BOOL CProcView::PreTranslateMessage(MSG* pMsg) 
{	
	if(pMsg->message == WM_MOUSEMOVE && pMsg->hwnd == m_tree.m_hWnd)
	{		
		CDC* pDC;
		pDC=GetDC();
		HDC hDC=pDC->GetSafeHdc();
		CDC HeadDC;
		HeadDC.Attach(hDC);
		// Save DC
		int nSavedDC = HeadDC.SaveDC();
		CFont font;
		font.CreateFont(14,0,                        // nWidth
		0,                         // nEscapement
		0,                         // nOrientation
		FW_NORMAL,                 // nWeight
		FALSE,                     // bItalic
		FALSE,                     // bUnderline
		0,                         // cStrikeOut
		ANSI_CHARSET,              // nCharSet
		OUT_DEFAULT_PRECIS,        // nOutPrecision
		CLIP_DEFAULT_PRECIS,       // nClipPrecision
		DEFAULT_QUALITY,           // nQuality
		DEFAULT_PITCH,			   // nPitchAndFamily
		NULL);                     // lpszFacename

		HeadDC.SelectObject(font);
		
		TVHITTESTINFO hInfo;
		CPoint point(LOWORD(pMsg->lParam),HIWORD(pMsg->lParam));
		hInfo.pt = point;	
		m_tree.HitTest(&hInfo);				
		
		if (hInfo.hItem!=NULL)
		{
			CArray<RECT,RECT> ColumnRectArray;
			CArray<int,int>	ColumnWidthArray;
			CArray<CString,CString>	ItemTextArray;
			CArray<CSize,CSize>	ItemTextWidthArray;
			
			for (int i=0;i<m_tree.m_wndHeader.GetItemCount();i++)
			{
				RECT ColumnRect;					
				m_tree.m_wndHeader.GetItemRect(i,&ColumnRect);
				ColumnRectArray.Add(ColumnRect);
				int WidthOfColumn=ColumnRect.right-ColumnRect.left;				
				ColumnWidthArray.Add(WidthOfColumn);
				CString Text=m_tree.GetItemText(hInfo.hItem,i);	
				ItemTextArray.Add(Text);
				CSize Width=pDC->GetTextExtent(Text);				
				ItemTextWidthArray.Add(Width);
			}		
			
			for (i=0;i<m_tree.m_wndHeader.GetItemCount();i++)
			{
				if (i==0)
				{					
					CPoint point=GetCurrentMessage()->pt;
					RECT TextItemRect;
					m_tree.GetItemRect(hInfo.hItem,&TextItemRect,TRUE);					
					point.x=TextItemRect.right-int((TextItemRect.right-TextItemRect.left)/2);					
					if ( (hInfo.flags & TVHT_ONITEMRIGHT) && (hInfo.pt.x<ColumnRectArray.GetAt(i).right) && (ItemTextWidthArray.GetAt(i).cx>(ColumnWidthArray.GetAt(i)-TextItemRect.right-4-int((TextItemRect.right-TextItemRect.left)/2))) )					
					{				
						CString colText=m_tree.GetItemText(hInfo.hItem,i);	
						DisplayToolTip(point,hInfo,colText);				
						m_tooltip.RelayEvent(pMsg);	
						break;
					}
					else
						m_tooltip.Pop();					
				}
				else
				{
					if ((hInfo.pt.x>ColumnRectArray.GetAt(i-1).right) && (hInfo.pt.x<ColumnRectArray.GetAt(i).right) && (ItemTextWidthArray.GetAt(i).cx>(ColumnWidthArray.GetAt(i)-8)) )
					{						
						CString colText=m_tree.GetItemText(hInfo.hItem,i);							
						point.x=ColumnRectArray.GetAt(i).left;						
						DisplayToolTip(point,hInfo,colText);				
						m_tooltip.RelayEvent(pMsg);	
						break;
					}
					else 
						m_tooltip.Pop();			
				}
			}		
			
			ColumnRectArray.RemoveAll();
			ColumnWidthArray.RemoveAll();
			ItemTextArray.RemoveAll();
			ItemTextWidthArray.RemoveAll();
		}
		else
			m_tooltip.Pop();					
		
		// Restore dc

		HeadDC.RestoreDC( nSavedDC );

		// Detach the dc before returning
		HeadDC.Detach();

	}
	return CView::PreTranslateMessage(pMsg);
}


void CProcView::DisplayToolTip(CPoint point, TVHITTESTINFO hInfo, CString colText)
{	
	RECT ItemRect;
	CToolInfo ToolInfo;

	if (m_tooltip.GetToolInfo(ToolInfo,GetDlgItem(ID_TREE_LIST_CTRL)))
	{					
		short height=m_tree.GetItemHeight();
		m_tree.GetItemRect(hInfo.hItem,&ItemRect,TRUE);	
		
		point.y=ItemRect.top+height+3;
		ClientToScreen(&point);

		m_tooltip.SendMessage(TTM_TRACKACTIVATE, TRUE, (LPARAM)&ToolInfo);
		m_tooltip.SendMessage(TTM_TRACKPOSITION, 0, (LPARAM) (DWORD)MAKELONG(point.x, point.y));				
						
		ToolInfo.uFlags|=TTF_TRACK; 
		ToolInfo.uFlags|=TTF_ABSOLUTE; 

		m_tooltip.SetToolInfo(&ToolInfo);
							
		if (hInfo.hItem==m_tree.GetSelectedItem())
		{		
			m_tooltip.SetTipBkColor(RGB(128,128,95));
			m_tooltip.SetTipTextColor(RGB(255,255,255));			
		}
		else
		{
			m_tooltip.SetTipBkColor(RGB(250,254,218));
			m_tooltip.SetTipTextColor(RGB(0,0,0));
		}
		m_tooltip.UpdateTipText(colText,&m_tree);								
		m_tooltip.Update();
	}						
}

void CProcView::updateProc()
{
	// write processes information
	m_tree.DeleteAllItems();

	for(int i=0; i<theApp.pid+1; i++)
	{
		if(theApp.processes[i] !=NULL){
			HTREEITEM hself, hTmp;
			CString value;
			int inttmp;

			if(theApp.processes[i]->getParent() != -1){
				int parentid = theApp.processes[i]->getParent();
				if(theApp.processes[parentid] != NULL){
					HTREEITEM parent = theApp.processes[parentid]->getSelf();
					hself = m_tree.InsertItem(theApp.processes[i]->getName(), 1, 1, true, false, parent);
				}else{
					theApp.processes[i]->setParent(-1);
					hself = m_tree.InsertItem(theApp.processes[i]->getName(), 1, 1, true, false);
				}
			}else{
				hself = m_tree.InsertItem(theApp.processes[i]->getName(), 1, 1, true, false);
			}

			theApp.processes[i]->setSelf(hself);
			
			hTmp = m_tree.InsertItem("process name", 1, 1, true, false, hself);
			m_tree.SetItemText(hTmp,1, theApp.processes[i]->getName());
			hTmp = m_tree.InsertItem("path", 1, 1, true, false, hself);
			m_tree.SetItemText(hTmp,1, theApp.processes[i]->getPname());
			hTmp = m_tree.InsertItem("process id", 1, 1, true, false, hself);
			inttmp = theApp.processes[i]->getPID();
			value.Format("%d", inttmp);
			m_tree.SetItemText(hTmp,1, value);
			hTmp = m_tree.InsertItem("priority", 1, 1, true, false, hself);
			inttmp = theApp.processes[i]->getPriority();
			value.Format("%d", inttmp);
			m_tree.SetItemText(hTmp,1, value);
			hTmp = m_tree.InsertItem("arrival", 1, 1, true, false, hself);
			value = theApp.processes[i]->getArrival().Format("%c");
			m_tree.SetItemText(hTmp,1, value);
			hTmp = m_tree.InsertItem("EIP", 1, 1, true, false, hself);
			inttmp = theApp.processes[i]->getEIP();
			value.Format("%d", inttmp);
			m_tree.SetItemText(hTmp,1, value);
			hTmp = m_tree.InsertItem("estimated run time", 1, 1, true, false, hself);
			inttmp = theApp.processes[i]->getEstimated();
			value.Format("%d", inttmp);
			m_tree.SetItemText(hTmp,1, value);
		}
	}
	
	m_tree.SetBackgroundColor(RGB(250,254,218));
	m_tree.SetGridLines(TRUE);
	m_tree.SetGridColor(RGB(23,43,100));
	//m_tree.SetGridStyle(BS_SOLID);
}

void CProcView::OnOpen() 
{
	// TODO: Add your command handler code here
		char szFilters[]=
      "All Files (*.*)|*.*||";

   // Create an Open dialog
   CFileDialog fileDlg (TRUE, "*", "*.*",
      OFN_FILEMUSTEXIST| OFN_HIDEREADONLY, szFilters, this);
   
   // Display the file dialog. When user clicks OK, fileDlg.DoModal() 
   // returns IDOK.
   if( fileDlg.DoModal ()==IDOK )
   {
      CString pathName = fileDlg.GetPathName();
	  CString line;
   
      // create a new PCB
	  CString pname = fileDlg.GetFileTitle();
	  CPCB* p = new CPCB(pname, pathName);

	  // no parent
	  p->setParent(-1);

	  // store it in process arrray
	  int pid = p->getPID();
	  int pri = p->getPriority();
	  
	  // need to serilization data access to these datas
	  EnterCriticalSection(&(theApp.lock));

	  int element = theApp.PRI[pri];
	  theApp.processes[pid] = p;
	  theApp.PRIQue[pri][element] = pid;
	  
	  // change que counter
	  theApp.PRI[pri]++;
	  
	  LeaveCriticalSection(&(theApp.lock));

   }

   updateProc();
}

void CProcView::schedule()
{
	// delete current timer
	KillTimer(m_nTimer);

	// terminate current running thread
	EnterCriticalSection(&(theApp.thread));
	TerminateThread(theApp.threadHandle,0);
	LeaveCriticalSection(&(theApp.thread));

	// is there any process in running
	if(theApp.current >= 0){
		// decrease estimate run time
		theApp.processes[theApp.current]->elapse();

		if(theApp.processes[theApp.current]->isFinished())
		{
			// this process has finished, remove it from memory
			int pid = theApp.processes[theApp.current]->getPID();
			int pri = theApp.processes[theApp.current]->getPriority();
			int last = theApp.PRI[pri];

			delete theApp.processes[pid];
			theApp.processes[pid] = NULL;

			if(last > 1){
				EnterCriticalSection(&(theApp.lock));
	
				for(int i=0; i<last-1; i++)
					theApp.PRIQue[pri][i] = theApp.PRIQue[pri][i+1];
			
				theApp.PRI[pri]--;

				LeaveCriticalSection(&(theApp.lock));
			}else{
				EnterCriticalSection(&(theApp.lock));
	
				theApp.PRI[pri]--;

				LeaveCriticalSection(&(theApp.lock));
			}
		}else{
			// move this process to the last of its corresponding priority que
			int pid = theApp.processes[theApp.current]->getPID();
			int pri = theApp.processes[theApp.current]->getPriority();
			int last = theApp.PRI[pri];

			if(last > 1){

				// serilize data access
				EnterCriticalSection(&(theApp.lock));

				for(int i=0; i<last-1; i++)
					theApp.PRIQue[pri][i] = theApp.PRIQue[pri][i+1];
				theApp.PRIQue[pri][last-1] = pid;

				LeaveCriticalSection(&(theApp.lock));
			}
		}
	}

	if(theApp.PRI[0] > 0){
		// run priority que 0
		theApp.current = theApp.PRIQue[0][0];
	}else if(theApp.PRI[1] > 0){
		// run priority que 1
		theApp.current = theApp.PRIQue[1][0];
	}else if(theApp.PRI[2] > 0){
		// run priority que 2
		theApp.current = theApp.PRIQue[2][0];
	}else{
		// no more process
		theApp.current = -1;
	}

	// create a new thread to run the current process
	if(theApp.current != -1 && !theApp.processes[theApp.current]->runOnce()){
		theApp.threadHandle = CreateThread (NULL, 0, &threadFunction, NULL, 0, NULL);    
	}

	updateProc();

	// create a new timer
	SetTimer(m_nTimer, TIMER_INTERVAL, NULL);
}

void CProcView::OnTimer(UINT nIDEvent) 
{
	// TODO: Add your message handler code here and/or call default
	schedule();	
	
	CView::OnTimer(nIDEvent);
}

void CProcView::OnActivateView(BOOL bActivate, CView* pActivateView, CView* pDeactiveView) 
{
	// TODO: Add your specialized code here and/or call the base class
	
	CView::OnActivateView(bActivate, pActivateView, pDeactiveView);
}

void CProcView::OnShowWindow(BOOL bShow, UINT nStatus) 
{
	CView::OnShowWindow(bShow, nStatus);
	
	// TODO: Add your message handler code here
	SetTimer(m_nTimer, TIMER_INTERVAL, NULL);
	
}

BOOL CProcView::DestroyWindow() 
{
	// TODO: Add your specialized code here and/or call the base class
	
	return CView::DestroyWindow();
}

void CProcView::OnDestroy() 
{
	KillTimer(m_nTimer);

	CView::OnDestroy();
	
	// TODO: Add your message handler code here
	
}

void CProcView::OnKill() 
{
	// TODO: Add your command handler code here
	// Kill a process in memory
	CDeleteDlg deleteDlg;
	if( deleteDlg.DoModal() == IDOK ){
		int pid = deleteDlg.m_pid;
		int pri = theApp.processes[pid]->getPriority();
		int last = theApp.PRI[pri];

		EnterCriticalSection(&(theApp.lock));

		for(int i=0; i<last; i++){
			if(theApp.PRIQue[pri][i] == pid){
				// find the process, delete it from the que
				for(int j=i; j<last-1; j++){
					theApp.PRIQue[pri][j] = theApp.PRIQue[pri][j+1];
				}

				// decrease the counter
				theApp.PRI[pri]--;
			}
		}

		// actually delete it from memory
		delete theApp.processes[pid];
		theApp.processes[pid] = NULL;

		// 
		if(theApp.current == pid)
			theApp.current = -1;

		LeaveCriticalSection(&(theApp.lock));
	}

	updateProc();
}

void CProcView::OnProcessPriority(void){
	// TODO:
	CPriorityDlg priorityDlg;
	if(priorityDlg.DoModal() == IDOK){
		int pid = priorityDlg.m_ppid;
		int pri = theApp.processes[pid]->getPriority();
		int last = theApp.PRI[pri];

		EnterCriticalSection(&(theApp.lock));

		for(int i=0; i<last; i++){
			if(theApp.PRIQue[pri][i] == pid){
				// find the process, delete it from the que
				for(int j=i; j<last-1; j++){
					theApp.PRIQue[pri][j] = theApp.PRIQue[pri][j+1];
				}

				// decrease the counter
				theApp.PRI[pri]--;
			}
		}

		last = theApp.PRI[priorityDlg.m_priority];
		theApp.PRIQue[priorityDlg.m_priority][last] = pid;
		theApp.processes[pid]->setPriority(priorityDlg.m_priority);
		theApp.PRI[priorityDlg.m_priority]++;

		LeaveCriticalSection(&(theApp.lock));

		updateProc();
	}
}

