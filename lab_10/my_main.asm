.486                                      ; create 32 bit code
.model flat, stdcall                      ; 32 bit memory model
option casemap :none                      ; case sensitive 

include masm32\include\windows.inc
include masm32\macros\macros.asm

include masm32\include\user32.inc
include masm32\include\kernel32.inc
include masm32\include\masm32.inc
include masm32\include\comctl32.inc

includelib masm32\lib\user32.lib
includelib masm32\lib\kernel32.lib
includelib masm32\lib\masm32.lib
includelib masm32\lib\comctl32.lib

WndProc PROTO :DWORD,:DWORD,:DWORD,:DWORD

DLG = 1000
num1_edt = 1003
num2_edt = 1004
sum_btn = 1005
res_edt = 1007

.data?
	hInstance dd ?				; указатель на модуль программы
	hWnd dd ?
	icce INITCOMMONCONTROLSEX <>
	buf db 2 dup(?)
	
.code
start:
    mov icce.dwSize, SIZEOF INITCOMMONCONTROLSEX
    mov icce.dwICC, ICC_DATE_CLASSES or \
                    ICC_INTERNET_CLASSES or \
                    ICC_PAGESCROLLER_CLASS or \
                    ICC_COOL_CLASSES

    invoke InitCommonControlsEx, offset icce

    invoke GetModuleHandle, NULL
    mov hInstance, eax

    invoke DialogBoxParam, hInstance, DLG, 0, offset WndProc, 0

    invoke ExitProcess, eax

WndProc proc hWin :DWORD, uMsg :DWORD, wParam :DWORD, lParam :DWORD
	switch uMsg
		case WM_INITDIALOG
			invoke SendMessage, hWin, WM_SETICON, 1, FUNC(LoadIcon, NULL, IDI_ASTERISK)
 
		case WM_COMMAND
			switch wParam
				case sum_btn
					invoke GetDlgItemInt, hWin, num1_edt, 0, TRUE
					mov ebx, eax
					invoke GetDlgItemInt, hWin, num2_edt, 0, TRUE
					add eax, ebx
						
					invoke SetDlgItemInt, hWin, res_edt, eax, TRUE
			endsw
			
		case WM_CLOSE
			invoke EndDialog, hWin, 0
 
    endsw
 
	xor eax,eax
	ret
WndProc ENDP
 
end start
