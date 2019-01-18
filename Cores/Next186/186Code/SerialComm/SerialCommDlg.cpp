
// SerialCommDlg.cpp : implementation file
//

#include "stdafx.h"
#include "SerialComm.h"
#include "SerialCommDlg.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#endif


// CAboutDlg dialog used for App About

class CAboutDlg : public CDialog
{
public:
	CAboutDlg();

// Dialog Data
	enum { IDD = IDD_ABOUTBOX };

	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support

// Implementation
protected:
	DECLARE_MESSAGE_MAP()
};

CAboutDlg::CAboutDlg() : CDialog(CAboutDlg::IDD)
{
}

void CAboutDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
}

BEGIN_MESSAGE_MAP(CAboutDlg, CDialog)
END_MESSAGE_MAP()


// CSerialCommDlg dialog




CSerialCommDlg::CSerialCommDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CSerialCommDlg::IDD, pParent)
{
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

void CSerialCommDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	DDX_Control(pDX, IDC_EDIT1, FNameEdit);
	DDX_Control(pDX, IDC_COMBO1, ComSelect);
}

BEGIN_MESSAGE_MAP(CSerialCommDlg, CDialog)
	ON_WM_SYSCOMMAND()
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	//}}AFX_MSG_MAP
	ON_BN_CLICKED(IDC_BUTTON2, &CSerialCommDlg::OnBnClickedButton2)
	ON_BN_CLICKED(IDC_BUTTON1, &CSerialCommDlg::OnBnClickedButton1)
END_MESSAGE_MAP()


// CSerialCommDlg message handlers

BOOL CSerialCommDlg::OnInitDialog()
{
	CDialog::OnInitDialog();

	// Add "About..." menu item to system menu.

	// IDM_ABOUTBOX must be in the system command range.
	ASSERT((IDM_ABOUTBOX & 0xFFF0) == IDM_ABOUTBOX);
	ASSERT(IDM_ABOUTBOX < 0xF000);

	CMenu* pSysMenu = GetSystemMenu(FALSE);
	if (pSysMenu != NULL)
	{
		BOOL bNameValid;
		CString strAboutMenu;
		bNameValid = strAboutMenu.LoadString(IDS_ABOUTBOX);
		ASSERT(bNameValid);
		if (!strAboutMenu.IsEmpty())
		{
			pSysMenu->AppendMenu(MF_SEPARATOR);
			pSysMenu->AppendMenu(MF_STRING, IDM_ABOUTBOX, strAboutMenu);
		}
	}

	// Set the icon for this dialog.  The framework does this automatically
	//  when the application's main window is not a dialog
	SetIcon(m_hIcon, TRUE);			// Set big icon
	SetIcon(m_hIcon, FALSE);		// Set small icon

	fname[0] = 0;
	ComSelect.SetCurSel(2);
	return TRUE;  // return TRUE  unless you set the focus to a control
}

void CSerialCommDlg::OnSysCommand(UINT nID, LPARAM lParam)
{
	if ((nID & 0xFFF0) == IDM_ABOUTBOX)
	{
		CAboutDlg dlgAbout;
		dlgAbout.DoModal();
	}
	else
	{
		CDialog::OnSysCommand(nID, lParam);
	}
}

// If you add a minimize button to your dialog, you will need the code below
//  to draw the icon.  For MFC applications using the document/view model,
//  this is automatically done for you by the framework.

void CSerialCommDlg::OnPaint()
{
	if (IsIconic())
	{
		CPaintDC dc(this); // device context for painting

		SendMessage(WM_ICONERASEBKGND, reinterpret_cast<WPARAM>(dc.GetSafeHdc()), 0);

		// Center icon in client rectangle
		int cxIcon = GetSystemMetrics(SM_CXICON);
		int cyIcon = GetSystemMetrics(SM_CYICON);
		CRect rect;
		GetClientRect(&rect);
		int x = (rect.Width() - cxIcon + 1) / 2;
		int y = (rect.Height() - cyIcon + 1) / 2;

		// Draw the icon
		dc.DrawIcon(x, y, m_hIcon);
	}
	else
	{
		CDialog::OnPaint();
	}
}

// The system calls this function to obtain the cursor to display while the user drags
//  the minimized window.
HCURSOR CSerialCommDlg::OnQueryDragIcon()
{
	return static_cast<HCURSOR>(m_hIcon);
}


void CSerialCommDlg::OnBnClickedButton2()
{
	CString str;
	ComSelect.GetWindowTextA(str);// .Get ComSelect.GetCurSel();
	hComm = CreateFile(str, GENERIC_READ | GENERIC_WRITE, 0, 0, OPEN_EXISTING, /*FILE_FLAG_OVERLAPPED*/0, 0);
	if(hComm != INVALID_HANDLE_VALUE)
	{
		DCB	dcb = {sizeof(dcb), CBR_115200, TRUE, FALSE, FALSE, FALSE, DTR_CONTROL_DISABLE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, RTS_CONTROL_DISABLE, FALSE, 0, 0, 2048, 512, 8, NOPARITY, ONESTOPBIT};
		SetCommState(hComm, &dcb);
		GetCommState(hComm, &dcb);

		DWORD d, dd;
		char *buf = new char[1024*1024];//[32768 - 256 + 2];
		FILE *f = fopen(fname, "rb");
		if(f)
		{
			d = fread(buf+2, 1, 1024*1024-2, f);
			buf[0] = (d >> 8) & 255;
			buf[1] = d & 255;
//			for(int i=0; i<d+2; i++) WriteFile(hComm, buf+i, 1, &dd, NULL);
			WriteFile(hComm, buf, d+2, &dd, NULL);
			fclose(f);
		}
		delete buf;
		CloseHandle(hComm);
	}
	else MessageBox(str + " port error\n");
}

void CSerialCommDlg::OnBnClickedButton1()
{
	OPENFILENAME ofn = {sizeof(ofn), this->m_hWnd, AfxGetInstanceHandle(), "File\0*.*\0", NULL, 0, 0, fname, sizeof(fname), NULL, 0, NULL, "Select file", OFN_EXPLORER | OFN_NOCHANGEDIR};
	GetOpenFileName(&ofn);
	FNameEdit.SetWindowTextA(fname);
}
