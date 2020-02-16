Menu, Tray, Icon, Shell32.dll, 210

Gui, -Caption
Gui, +LastFound +AlwaysOnTop +ToolWindow
Gui, +OwnDialogs
Gui, Font, s30 w800
Gui, Add, Text, x5 y35 h106 w106 c3ac760 vSkill, 
Gui, Color, 000001
WinSet, TransColor, 000001
Gui, Show, x940 y350 h100 w50, weapon swap

Loop
{
	Sleep, 100
	; GetKeyState, state, m, U
	; if state = D
		; break
	PixelSearch, Px, Py, 1604, 994, 1604, 994, 0x2CE4FC, 0, Fast
	if ErrorLevel
		Var1:= "" ; SendInput, 2
	else
		Var1:= "H" ; SendInput, 1
	GuiControl,, Skill, %Var1%
}
return
^!+n::Gui Cancel ; ExitApp
^n::
Gui, Show, x940 y350 h100 w50, weapon swap
return





