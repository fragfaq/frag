Menu, Tray, Icon, %A_ScriptDir%\res\pic\swap.ico, 1

; CoordMode, Pixel

Gui, -Caption
Gui, +LastFound +AlwaysOnTop +ToolWindow
Gui, +OwnDialogs
Gui, Font, s19 w800
Gui, Add, Text, x5 y35 h106 w106 c3ac760 vSkill, 
Gui, Color, 000001
WinSet, TransColor, 000001
Gui, Show, x940 y350 h100 w50, weapon swap

Loop
{
	Sleep, 100
	PixelGetColor, color, 1604, 994
	if (color = "0x2CE4FC")
	{
		Var1 = H
	}
	else if (color = "0x00091F")
	{
		Var1 = S
	}
	else
	{
		Var1 = 
	}
	GuiControl,, Skill, %Var1%
}
return
^!+n::Gui Cancel
^n::
Gui, Show, x940 y350 h100 w50, weapon swap
return

