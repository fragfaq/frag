Menu, Tray, Icon, %A_ScriptDir%\res\pic\play3.png, 1
;==============================================
GroupAdd, poe, ahk_exe PathOfExile.exe
GroupAdd, poe, ahk_exe PathOfExile_x64.exe
;==============================================
#IfWinActive ahk_group poe
;==============================================
Gui, Currency:-Caption
Gui, Currency:+LastFound +AlwaysOnTop +ToolWindow +OwnDialogs
Gui, Currency:Color, 000001
WinSet, TransColor, 000001
Gui, Currency:Add, Picture, x0 y0 w40 h-1, %A_ScriptDir%\res\pic\3.png
Gui, Currency:Show, x930 y400 w40 h40 NoActivate, Currency
;============
loop
{
	Random, vS1, 100, 200
	Sleep, %vS1%
	MouseGetPos AreaX, AreaY
	Sleep, 10
	PixelGetColor, Varscroll, %AreaX%, %AreaY%, RGB
	if (Varscroll = 0x222222 or Varscroll = 0xFCDDB2)
	{
		Click left
	}
}
return
;==============================================
#IfWinActive
;==============================================
;==============================================
;перезапуск скрипта на Control+r
; ^sc13::
; Reload
; return