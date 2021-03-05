#SingleInstance force
;=============================================
; Menu, Tray, Icon, %A_ScriptDir%\res\pic\Convocation.png, 1
; #NoTrayIcon
;==============================================
GroupAdd, poe, ahk_exe PathOfExile.exe
GroupAdd, poe, ahk_exe PathOfExile_x64.exe
;=============================================
#IfWinActive ahk_group poe
;=============================================
IfWinNotActive, ("ahk_class POEWindowClass")
{
	WinActivate, Path of Exile
}
Sleep, 20
SendInput, {sc11}
exit


















