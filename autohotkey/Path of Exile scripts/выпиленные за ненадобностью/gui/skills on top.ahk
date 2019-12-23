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

Loop 
{
	Sleep, 300
	; Dark Pact
	PixelSearch, Px, Py, 40, 42, 400, 42, 0x070301, 0, Fast
	; PixelSearch, Px, Py, 20, 49, 156, 49, 0x603347, 0, Fast
	if ErrorLevel
	{
		Gui, Show, x0 y0 w0 h0 NoActivate, noDP
	}
	else
	{
		Gui, Color, 3c007a
		Gui Font, s11 w800
		Gui, Add, Text, Center x0 y0 w130 h15 cff0000, | | | | |
		Gui Font
		Gui, Show, x683 y20 w130 h15 NoActivate, DP
	}
	; Arcane Surge
	PixelSearch, Px, Py, 37, 33, 800, 33, 0x467780, 0, Fast
	if ErrorLevel
	{
		Gui, 2:Show, x0 y0 w0 h0 NoActivate, noAS
	}
	else
	{
		Gui, 2:Color, 00f9ff ; 8a8ae0
		Gui, 2:Show, x683 y35 w130 h10 NoActivate, AS
	}
	; Lightning Golem
	PixelSearch, Px, Py, 20, 43, 800, 43, 0xFFFA9F, 0, Fast
	if ErrorLevel
	{
		Gui, 3:Show, x0 y0 w0 h0 NoActivate, noLG
	}
	else
	{
		Gui, 3:Color, 898981
		Gui, 3:Show, x683 y45 w130 h10 NoActivate, LG
	}
	; предпологаемое место для чарджей, когда они будут.
}

; color  is 0x070301 x is 40 y is 42