Menu, Tray, Icon, %A_ScriptDir%\res\pic\poloska1.ico, 1
;==============================================
Sleepfunction(min, max)
{
	random, randb, min, max
	return randb
}
;==============================================
SetTimer, NoFocus1, % Sleepfunction(100, 150)
SetTimer, NoFocus2, % Sleepfunction(200, 250)
return
;==============================================
; Таймер для полоски кд шокающего фокуса
; Часть первая
NoFocus1:
PixelSearch, Px, Py, 1668, 1047, 1668, 1047, 0x5A0800, 0, Fast RGB
if ErrorLevel
{
	Sleep, 20
}
else
{
	Wait(8100)
		Wait(time){
		static MyProgress
		tick := A_TickCount + time
		Gui, 4:New, hwndMyGui
		Gui, 4: -Caption +AlwaysOnTop +ToolWindow
		Gui, 4:Margin, 0, 0
		Gui, 4:Add, Progress, w250 h15 Range%A_TickCount%-%tick% vMyProgress
		Gui, 4:Show, x555 y1045 NA
		While A_TickCount<=tick {
			GuiControl,,MyProgress,% A_TickCount
			Sleep, 16
		}
		Gui, 4:Destroy
	}
}
return
; ==========================================
; Часть вторая
NoFocus2:
PixelSearch, Px, Py, 1669, 1029, 1669, 1029, 0x3F3602, 0, Fast RGB
if ErrorLevel
{
	Sleep, 20
}
else
{
	Gui, 4:Destroy
}
return







