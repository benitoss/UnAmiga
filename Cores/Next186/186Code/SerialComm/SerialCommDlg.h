
// SerialCommDlg.h : header file
//

#pragma once
#include "afxwin.h"


// CSerialCommDlg dialog
class CSerialCommDlg : public CDialog
{
// Construction
public:
	CSerialCommDlg(CWnd* pParent = NULL);	// standard constructor

// Dialog Data
	enum { IDD = IDD_SERIALCOMM_DIALOG };

	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support


// Implementation
protected:
	HICON m_hIcon;

	// Generated message map functions
	virtual BOOL OnInitDialog();
	afx_msg void OnSysCommand(UINT nID, LPARAM lParam);
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	DECLARE_MESSAGE_MAP()
public:
	afx_msg void OnBnClickedButton2();
	afx_msg void OnBnClickedButton1();
	HANDLE hComm;
	char fname[MAX_PATH];
	CEdit FNameEdit;
	CComboBox ComSelect;
};
