Menu, Tray, Icon, %A_ScriptDir%\res\pic\swap.ico, 1

Gui, -Caption
Gui, +LastFound +AlwaysOnTop +ToolWindow
Gui, +OwnDialogs
Gui, Font, s16 w800
Gui, Add, Text, x0 y0 +Center vSkill, ----------------
Gui, Add, Text, x0 y25 +Center cbababa vWard, ----------------
Gui, Add, Text, x0 y50 +Center cb26300 vBlood, ----------------
Gui, Add, Text, x0 y75 +Center c059c00 vFrenzy, ----------------
Gui, Color, 000001
WinSet, TransColor, 000001
Gui, Show, x890 y370, Skills

Loop
{
	Sleep, 100 ; определение активного скила и вывод его в гуй заданным цветом
	PixelGetColor, color, 1604, 994
	if (color = "0x2CE4FC")
	{
		GuiControl, +ce10001, Skill
		GuiControl,, Skill, HS
	}
	else if (color = "0x00091F")
	{
		GuiControl, +c0015b6, Skill 
		GuiControl,, Skill, Sun
	}
	else
	{
		GuiControl,, Skill, 
	}
	; Sleep, 100 ; есть вард или нет
	PixelSearch, Px, Py, 36, 45, 136, 46, 0x18FF84, 0, Fast
	if ErrorLevel
	{
		Var2 = 
	}
	else
	{
		Var2 = W
	}
	GuiControl,, Ward, %Var2%
	; Sleep, 100 ; есть блудрэйдж или нет
	PixelSearch, Px, Py, 155, 41, 800, 41, 0x031062, 0, Fast
	if ErrorLevel
	{
		Var3 = 
	}
	else
	{
		Var3 = BR
	}
	GuiControl,, Blood, %Var3%
	; Sleep, 100 ; френзи чарджи
	PixelSearch, Px, Py, 33, 46, 800, 46, 0x00FBF7, 0, Fast
	if ErrorLevel
	{
		Var4 = 
	}
	else
	{
		Var4 = FC
	}
	GuiControl,, Frenzy, %Var4%
}
return
Gui, Show, x945 y370, Skills
return

