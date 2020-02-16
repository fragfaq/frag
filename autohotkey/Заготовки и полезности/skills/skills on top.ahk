Menu, Tray, Icon, %A_ScriptDir%\res\pic\swap.ico, 1

Gui, -Caption
Gui, +LastFound +AlwaysOnTop +ToolWindow
Gui, +OwnDialogs
Gui, 2:-Caption
Gui, 2:+LastFound +AlwaysOnTop +ToolWindow
Gui, 2:+OwnDialogs
Gui, 3:-Caption
Gui, 3:+LastFound +AlwaysOnTop +ToolWindow
Gui, 3:+OwnDialogs
Gui, 4:-Caption
Gui, 4:+LastFound +AlwaysOnTop +ToolWindow
Gui, 4:+OwnDialogs
Gui, 5:-Caption
Gui, 5:+LastFound +AlwaysOnTop +ToolWindow
Gui, 5:+OwnDialogs
Loop
{
	Sleep, 100 ; мэйн скилл
	PixelGetColor, color, 1604, 994
	if (color = "0x2CE4FC")
	{
		Gui, Color, c68201
		Gui, Show, x685 y20 w395 h10 NoActivate, HS
	}
	else if (color = "0x00091F")
	{
		Gui, Color, 000c6d
		Gui, Show, x685 y20 w395 h10 NoActivate, Sun
	}
	else
	{
		Gui, Show, x0 y0 w0 h0 NoActivate, noskill
	}
	; ward
	PixelSearch, Px, Py, 36, 45, 136, 46, 0x18FF84, 0, Fast
	if ErrorLevel
	{
		Gui, 2:Show, x0 y0 w0 h0 NoActivate, noward
	}
	else
	{
		Gui, 2:Color, 6e6e6e
		Gui, 2:Show, x685 y30 w130 h10 NoActivate, ward
	}
	; bloodrage
	PixelSearch, Px, Py, 155, 41, 800, 41, 0x031062, 0, Fast
	if ErrorLevel
	{
		Gui, 3:Show, x0 y0 w0 h0 NoActivate, noBR
	}
	else
	{
		Gui, 3:Color, 550000
		Gui, 3:Show, x685 y40 w130 h10 NoActivate, bloodrage
	}
	; frenzy
	PixelSearch, Px, Py, 33, 46, 800, 46, 0x00FBF7, 0, Fast
	if ErrorLevel
	{
		Gui, 4:Show, x0 y0 w0 h0 NoActivate, noFCh
	}
	else
	{
		Gui, 4:Color, 024e00
		Gui, 4:Show, x685 y50 w130 h10 NoActivate, frenzy
	}
	; tray
	PixelSearch, Px, Py, -293, 947, -85, 1013, 0x5f5fd3, 0, Fast
	if ErrorLevel
	{
		Gui, 5:Show, x0 y0 w0 h0 NoActivate, noFCh
	}
	else
	{
		Gui, 5:Color, 9966FF
		Gui, 5:Show, x650 y0 w30 h40 NoActivate, frenzy
	}
}





; 5f5fd3
; x -141
; y 961
;==============================================
;перезапуск скрипта на Control+r
; F1::
; Reload
; return
;=============================================