Menu, Tray, Icon, %A_ScriptDir%\res\pic\swap.ico, 1

; Loop
; {
	; Sleep, 20
	; if Var2 = 1
	; {
		; Vc = ff0000
	; }
	; else if Var2 = 2
	; {
		; Vc = 0000ff
	; }
; }


Gui, -Caption
Gui, +LastFound +AlwaysOnTop +ToolWindow
Gui, +OwnDialogs
Gui, Font, s19 w800
Gui, Add, Text, x0 y0 c3ac760 vSkill, ---
; Gui, Add, Text, x0 y0 c%Vc% vSkill, ---
Gui, Add, Text, x0 y25 cbababa vWard, ---
Gui, Add, Text, x0 y50 ce10001 vBlood, ---
Gui, Color, 000001
WinSet, TransColor, 000001
Gui, Show, x945 y370, Skills

Loop
{
	Sleep, 100 ; определение активного скила
	PixelGetColor, color, 1604, 994
	if (color = "0x2CE4FC")
	{
		Var1 = -l- 
		; Var2 = 1
	}
	else if (color = "0x00091F")
	{
		Var1 = llll
		; Var2 = 2
	}
	else
	{
		Var1 = 
	}
	GuiControl,, Skill, %Var1%
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
		Var3 = B
	}
	GuiControl,, Blood, %Var3%
}
return
Gui, Show, x945 y370, Skills
return

