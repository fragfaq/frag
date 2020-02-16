#include %A_ScriptDir%\lib_test.ahk
;===============================================
Menu, Tray, Icon, %A_ScriptDir%\res\pic\4.png, 1
;===============================================
global VarAutoPhaseRun := 0
global VarAutoTempestShield := 0
global VarAutoEnduringCry := 0
global VarAutoConvocation := 0
global VarAutoVolatileDead := 0
Var_Gui_Ini = %A_ScriptDir%\Send_Phase_Run.ini
;===============================================
SetTimer, PhaseRun_Ini_timer, 500
;========
;===============================================
GroupAdd, poe, ahk_exe PathOfExile.exe
GroupAdd, poe, ahk_exe PathOfExile_x64.exe
GroupAdd, poe, ahk_exe notepad.exe ; for test
GroupAdd, browser, ahk_exe firefox.exe
GroupAdd, browser, ahk_exe chrome.exe
GroupAdd, trade, search results ahk_exe chrome.exe
GroupAdd, trade, ahk_exe PathOfExile.exe
GroupAdd, trade, ahk_exe PathOfExile_x64.exe
;===============================================
#IfWinActive ahk_group poe
;===============================================
; Автопрожатие Bone Armor и Fhase Run (кнопок 9 и 0) на Shift+0
!0::
FhaseRun_On_Off()
return
;===============================================
; double E run PhaseRun and(or) Convocation, close both if both on
~sc2E::
if (A_PriorHotkey <> "~sc2E" or A_TimeSincePriorHotkey > 500)
{
	KeyWait, sc2E
	return
}
if (VarAutoPhaseRun = 0 and VarAutoConvocation = 0)
{
	FhaseRun_On_Off()
	On_Off_Convocation()
	WinActivate, ahk_class POEWindowClass
}
else if (VarAutoPhaseRun = 1 and VarAutoConvocation = 0)
{
	On_Off_Convocation()
	WinActivate, ahk_class POEWindowClass
}
else if (VarAutoPhaseRun = 0 and VarAutoConvocation = 1)
{
	FhaseRun_On_Off()
	WinActivate, ahk_class POEWindowClass
}
else if (VarAutoPhaseRun = 1 and VarAutoConvocation = 1)
{
	Close_Auto_Phase_Run_Gui()
}
return
;===============================================
~sc11::
if (A_PriorHotkey <> "~sc11" or A_TimeSincePriorHotkey > 500)
{
	KeyWait, sc11
	return
}
On_Off_Convocation()
return
;===============================================
~9::
if (A_PriorHotkey <> "~9" or A_TimeSincePriorHotkey > 500)
{
	KeyWait, 9
	return
}
FhaseRun_On_Off()
return
;===============================================
; #IfWinActive ahk_group poe
;=====================
; При нажатии на 0 нажимает сперва 9 потом 0
scB::
Sleep, % Sleepfunction(40, 60)
SendInput, 9
Sleep, % Sleepfunction(40, 60)
SendInput, 0
return
;===============================================
;=====================
#IfWinActive
;=====================
; Shift+Mouse3 прожимают Ваал скелетов (R), Ваал хасту (mouse3) и, если еще не запущены, то Бон армор (9) и Фэйс ран (0).
; После чего запускают таймер для Бон армора и Фэйс рана и отрисовывают Gui, если они небыли запущены.
+MButton::
Sleep, % Sleepfunction(60, 120)
ConvocationOff()
Sleep, % Sleepfunction(60, 120)
SendInput, {sc13}
Sleep, % Sleepfunction(60, 120)
SendInput, {MButton}
Sleep, % Sleepfunction(60, 120)
PhaseRun_On_if_Off()
return
;===============================================
; Метки таймеров:
;===============================================
Fhase_Run:
SetTitleMatchMode, 2
DetectHiddenWindows, On
IfWinActive ahk_class POEWindowClass
SendInput, 9
Sleep, % Sleepfunction(40, 60)
SetTitleMatchMode, 2
DetectHiddenWindows, On
IfWinActive ahk_class POEWindowClass
SendInput, 0
return
;===============================================
Tempest_shield:
SetTitleMatchMode, 2
DetectHiddenWindows, On
IfWinActive ahk_class POEWindowClass
SendInput, {sc13}
Sleep, 20
return
;===============================================
Enduring_Cry:
SetTitleMatchMode, 2
DetectHiddenWindows, On
IfWinActive ahk_class POEWindowClass
SendInput, {sc13}
Sleep, % Sleepfunction(60, 120)
SetTitleMatchMode, 2
DetectHiddenWindows, On
IfWinActive ahk_class POEWindowClass
SendInput, {sc13}
return
;===============================================
Convocation:
SetTitleMatchMode, 2
DetectHiddenWindows, On
IfWinActive ahk_class POEWindowClass
SendInput, {sc11}
Sleep, % Sleepfunction(60, 120)
return
;===============================================
VolatileDead:
SetTitleMatchMode, 2
DetectHiddenWindows, On
IfWinActive ahk_class POEWindowClass
SendInput, {sc13}
Sleep, 20
return
;===============================================
PhaseRun_Ini_timer:
FileRead, Var_Gui_Ini_Count, %Var_Gui_Ini%
if Var_Gui_Ini_Count contains 1
{
	FileDelete, %Var_Gui_Ini%
	FileAppend, 0, %A_ScriptDir%\Send_Phase_Run.ini
	if (VarAutoPhaseRun = 1 or VarAutoConvocation = 1)
	{
		Close_Auto_Phase_Run_Gui()
	}
	else if (VarAutoPhaseRun = 0 or VarAutoConvocation = 0)
	{
		FhaseRun_On_Off()
		On_Off_Convocation()
	}
}
else
{
	Sleep, 20
}
return
;===============================================
; close scripts
;===============================================
~F7::
SendInput, {F7}
Close_Auto_Phase_Run_Gui()
VarAutoPhaseRun := 0
return
;=====================
$Esc::
SendInput, {Escape}
Sleep, % Sleepfunction(40, 60)
SendInput, {F7}
Close_Auto_Phase_Run_Gui()
VarAutoPhaseRun := 0
return
;=====================
;===============================================
#IfWinActive ahk_group poe
WheelDown::
if VarAutoPhaseRun = 1
{
	Close_Auto_Phase_Run_Gui()
	VarAutoPhaseRun := 0
}
else if VarAutoPhaseRun = 0
{
	SendInput, {WheelDown}
}
return

;======
WheelUp::
if VarAutoPhaseRun = 1
{
	Close_Auto_Phase_Run_Gui()
	VarAutoPhaseRun := 0
}
else if VarAutoPhaseRun = 0
{
	SendInput, {WheelUp}
}
return
;===============================================
#IfWinActive
























