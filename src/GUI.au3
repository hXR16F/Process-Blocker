#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_UseUpx=y
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
; Programmed by hXR16F
; hXR16F.ar@gmail.com

#include <ButtonConstants.au3>
#include <ComboConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>

#Region ### START Koda GUI section ###
$Form1 = GUICreate("", 224, 233, 381, 178)
GUISetIcon("C:\Windows\System32\shell32.dll", -51)
$Label1 = GUICtrlCreateLabel("Process name:", 10, 10, 204, 20)
GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
$Input1 = GUICtrlCreateInput("chrome.exe", 16, 36, 191, 24)
GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
$Label2 = GUICtrlCreateLabel("Options:", 10, 74, 203, 20)
GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
$Checkbox1 = GUICtrlCreateCheckbox("Error message box", 16, 100, 191, 17)
GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
$Label3 = GUICtrlCreateLabel("Delay (in seconds):", 10, 130, 203, 20)
GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
$Combo1 = GUICtrlCreateCombo("", 16, 156, 191, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "1|2|3|4|5", "3")
$Button1 = GUICtrlCreateButton("Start Process-Blocker", 10, 194, 203, 25)
GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit

		Case $Button1
			If FileExists(@ScriptDir & "\input.ini") Then
				FileDelete(@ScriptDir & "\input.ini")
			EndIf

			Local $ProcessName = GUICtrlRead($Input1)
			Local $ErrorMessage = GUICtrlRead($Checkbox1)
			Local $Delay = GUICtrlRead($Combo1)

			FileWrite(@ScriptDir & "\input.ini", $ProcessName & @CRLF & $ErrorMessage & @CRLF & $Delay)
			Sleep(50)

			ShellExecute(@ScriptDir & "\Process-Blocker.bat")
			; ShellExecute(@ScriptDir & "\Process-Blocker.bat", "", "", "", @SW_HIDE)
	EndSwitch
WEnd
