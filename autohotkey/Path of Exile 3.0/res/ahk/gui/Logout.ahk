#NoEnv
#SingleInstance Force
SetWorkingDir %A_ScriptDir%

Menu Tray, Icon, shell32.dll, 113

Gui -MinimizeBox -MaximizeBox -SysMenu +AlwaysOnTop
Gui Color, 0x0080C0
Gui Font, s32 Bold, Verdana
Gui Add, Text, x20 y10 Center, Resurrect in Town
Gui Add, Text, x20 y88 gBack, BACK!
Gui Add, Text, x250 y88 gCloseall, Close All
Gui Add, GroupBox, x18 y68 w152 h69
Gui Add, GroupBox, x247 y68 w214 h69
Gui Show, w480 h150, Logaut
Return

GuiEscape:
GuiClose:
ExitApp
return

Back:
Run, C:\Users\frag\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\PoE.lnk
Sleep, 100
ExitApp
return

Closeall:
DetectHiddenWindows, On
WinGet, List, List, ahk_class AutoHotkey
Sleep, 100
Loop %List%
{
	WinGet, PID, PID, % "ahk_id " List%A_Index%
	If ( PID <> DllCall("GetCurrentProcessId") )
	PostMessage,0x111,65405,0,, % "ahk_id " List%A_Index%
}
Sleep, 100
ExitApp
return



























;==============================================
;перезапуск скрипта на Control+r
Reboot:
^sc13::
Sleep, 10
Reload
return