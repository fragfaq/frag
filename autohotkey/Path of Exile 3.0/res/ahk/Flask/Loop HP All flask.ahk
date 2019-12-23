#SingleInstance force
;=============================================
Menu, Tray, Icon, %A_ScriptDir%\res\swap.ico, 1
;=============================================
Sleepfunction(min, max)
{
	random, randb, min, max
	return randb
}
;=============================================
SendInput, 2
Sleep, % Sleepfunction(40, 60)
SendInput, 3
Sleep, % Sleepfunction(40, 60)
SendInput, 4
Sleep, % Sleepfunction(40, 60)
SendInput, 5
; return
;=============================================
SetTimer, Quartz, % Sleepfunction(6400, 6600)
SetTimer, Silver, % Sleepfunction(6200, 6400)
SetTimer, Basalt, % Sleepfunction(5800, 6000)
SetTimer, Quicksilver, % Sleepfunction(3700, 3900)
Return
;=============================================
Quartz:
SetTitleMatchMode, 2
DetectHiddenWindows, On
IfWinActive ahk_class POEWindowClass
SendInput, 2
Return
;========
Silver:
SetTitleMatchMode, 2
DetectHiddenWindows, On
IfWinActive ahk_class POEWindowClass
SendInput, 3
Return
; ========
Basalt:
SetTitleMatchMode, 2
DetectHiddenWindows, On
IfWinActive ahk_class POEWindowClass
SendInput, 4
Return
; ========
Quicksilver:
SetTitleMatchMode, 2
DetectHiddenWindows, On
IfWinActive ahk_class POEWindowClass
SendInput, 5
Return
;========
#^!+F11::
Pause
Return





















