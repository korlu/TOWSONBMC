// procDoc.cpp : implementation of the CProcDoc class
//

#include "stdafx.h"
#include "proc.h"

#include "procDoc.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CProcDoc

IMPLEMENT_DYNCREATE(CProcDoc, CDocument)

BEGIN_MESSAGE_MAP(CProcDoc, CDocument)
	//{{AFX_MSG_MAP(CProcDoc)
		// NOTE - the ClassWizard will add and remove mapping macros here.
		//    DO NOT EDIT what you see in these blocks of generated code!
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CProcDoc construction/destruction

CProcDoc::CProcDoc()
{
	// TODO: add one-time construction code here

}

CProcDoc::~CProcDoc()
{
}

BOOL CProcDoc::OnNewDocument()
{
	if (!CDocument::OnNewDocument())
		return FALSE;

	// TODO: add reinitialization code here
	// (SDI documents will reuse this document)

	/*WINDOWPLACEMENT wndpl;

	CFrameWnd* pMainWnd = (CFrameWnd*)AfxGetMainWnd();
	CView *pActiveView = pMainWnd->GetActiveView();
	pActiveView->GetWindowPlacement(&wndpl);
	wndpl.flags |= WPF_RESTORETOMAXIMIZED;
	wndpl.showCmd |= SW_SHOWMAXIMIZED;
	pActiveView->SetWindowPlacement(&wndpl);*/

	return TRUE;
}



/////////////////////////////////////////////////////////////////////////////
// CProcDoc serialization

void CProcDoc::Serialize(CArchive& ar)
{
	if (ar.IsStoring())
	{
		// TODO: add storing code here
	}
	else
	{
		// TODO: add loading code here
	}
}

/////////////////////////////////////////////////////////////////////////////
// CProcDoc diagnostics

#ifdef _DEBUG
void CProcDoc::AssertValid() const
{
	CDocument::AssertValid();
}

void CProcDoc::Dump(CDumpContext& dc) const
{
	CDocument::Dump(dc);
}
#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// CProcDoc commands

CView* CProcDoc::GetNextView(POSITION& rPosition) const
{
	// TODO: Add your specialized code here and/or call the base class
	
	return CDocument::GetNextView(rPosition);
}
