; CLW file contains information for the MFC ClassWizard

[General Info]
Version=1
LastClass=CProcDoc
LastTemplate=CDialog
NewFileInclude1=#include "stdafx.h"
NewFileInclude2=#include "proc.h"
LastPage=0

ClassCount=8
Class1=CProcApp
Class2=CProcDoc
Class3=CProcView
Class4=CMainFrame

ResourceCount=5
Resource1=IDD_DIALOG1
Resource2=IDD_ABOUTBOX
Class5=CChildFrame
Class6=CAboutDlg
Resource3=IDR_PROCTYPE
Class7=CDeleteDlg
Resource4=IDR_MAINFRAME
Class8=CPriorityDlg
Resource5=IDD_DIALOG2

[CLS:CProcApp]
Type=0
HeaderFile=proc.h
ImplementationFile=proc.cpp
Filter=N
BaseClass=CWinApp
VirtualFilter=AC
LastObject=CProcApp

[CLS:CProcDoc]
Type=0
HeaderFile=procDoc.h
ImplementationFile=procDoc.cpp
Filter=N
LastObject=CProcDoc
BaseClass=CDocument
VirtualFilter=DC

[CLS:CProcView]
Type=0
HeaderFile=procView.h
ImplementationFile=procView.cpp
Filter=C
BaseClass=CView
VirtualFilter=VWC
LastObject=CProcView


[CLS:CMainFrame]
Type=0
HeaderFile=MainFrm.h
ImplementationFile=MainFrm.cpp
Filter=T
LastObject=CMainFrame
BaseClass=CMDIFrameWnd
VirtualFilter=fWC


[CLS:CChildFrame]
Type=0
HeaderFile=ChildFrm.h
ImplementationFile=ChildFrm.cpp
Filter=M


[CLS:CAboutDlg]
Type=0
HeaderFile=proc.cpp
ImplementationFile=proc.cpp
Filter=D

[DLG:IDD_ABOUTBOX]
Type=1
Class=CAboutDlg
ControlCount=4
Control1=IDC_STATIC,static,1342177283
Control2=IDC_STATIC,static,1342308480
Control3=IDC_STATIC,static,1342308352
Control4=IDOK,button,1342373889

[MNU:IDR_MAINFRAME]
Type=1
Class=CMainFrame
Command1=ID_APP_EXIT
Command2=ID_APP_ABOUT
CommandCount=2

[TB:IDR_MAINFRAME]
Type=1
Class=CMainFrame
Command1=ID_FILE_NEW
Command2=ID_FILE_OPEN
Command3=ID_FILE_SAVE
Command4=ID_EDIT_CUT
Command5=ID_EDIT_COPY
Command6=ID_EDIT_PASTE
Command7=ID_FILE_PRINT
Command8=ID_APP_ABOUT
CommandCount=8

[MNU:IDR_PROCTYPE]
Type=1
Class=CProcView
Command1=ID_APP_EXIT
Command2=ID_OPEN
Command3=ID_KILL
Command4=ID_PROCESS_PRIORITY
Command5=ID_APP_ABOUT
CommandCount=5

[ACL:IDR_MAINFRAME]
Type=1
Class=CMainFrame
Command1=ID_FILE_NEW
Command2=ID_FILE_OPEN
Command3=ID_FILE_SAVE
Command4=ID_FILE_PRINT
Command5=ID_EDIT_UNDO
Command6=ID_EDIT_CUT
Command7=ID_EDIT_COPY
Command8=ID_EDIT_PASTE
Command9=ID_EDIT_UNDO
Command10=ID_EDIT_CUT
Command11=ID_EDIT_COPY
Command12=ID_EDIT_PASTE
Command13=ID_NEXT_PANE
Command14=ID_PREV_PANE
CommandCount=14

[DLG:IDD_DIALOG1]
Type=1
Class=CDeleteDlg
ControlCount=5
Control1=IDOK,button,1342242817
Control2=IDCANCEL,button,1342242816
Control3=IDC_STATIC,static,1342308352
Control4=IDC_EDIT1,edit,1350639744
Control5=IDC_SPIN1,msctls_updown32,1342177330

[CLS:CDeleteDlg]
Type=0
HeaderFile=DeleteDlg.h
ImplementationFile=DeleteDlg.cpp
BaseClass=CDialog
Filter=D
VirtualFilter=dWC
LastObject=IDOK

[DLG:IDD_DIALOG2]
Type=1
Class=CPriorityDlg
ControlCount=6
Control1=IDOK,button,1342242817
Control2=IDCANCEL,button,1342242816
Control3=IDC_STATIC,static,1342308352
Control4=IDC_EDIT1,edit,1350631552
Control5=IDC_STATIC,static,1342308352
Control6=IDC_EDIT2,edit,1350631552

[CLS:CPriorityDlg]
Type=0
HeaderFile=PriorityDlg.h
ImplementationFile=PriorityDlg.cpp
BaseClass=CDialog
Filter=D
LastObject=IDOK
VirtualFilter=dWC

