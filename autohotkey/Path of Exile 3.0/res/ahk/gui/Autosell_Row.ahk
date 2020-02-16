#NoEnv

; Gui, +LastFound +AlwaysOnTop +OwnDialogs +Owner
Gui, +LastFound +OwnDialogs +Owner
Gui, Color, 666666, 666666 ; Цвет Gui
Gui, Font, S12 W700, Verdana
Gui, Add, DropDownList, x15 y15 w75 vRow, 1||2|3|4|5|6|7|8|9|10|11|12
Gui, Add, Button, x15 y+15 w75 gSell, OK
Gui, Show,, New GUI Window
Return

Sell:
GuiControlGet, Row
VAutoSellX := 1247
VAutoSellX1 := 1247
VAutoSellY := 562
VAutoSellY1 := 562
VAutoSellStep := 53
WinClose
Sleep, 40
IfWinNotActive, ("ahk_class POEWindowClass")
{
	WinActivate, Path of Exile
}
Sleep, 40
BlockInput On
SendInput {LCtrl Down}
Loop, %Row%
{
	Random, VSellTime1, 90, 120
	Sleep, %VSellTime1%
	VAutoSellX := VAutoSellX + VAutoSellStep
	VAutoSellY := VAutoSellY1 + VAutoSellStep
	Loop, 5
	{
		Random, VSellTime2, 90, 120
		Sleep, %VSellTime2%
		MouseClick, Left, %VAutoSellX%, %VAutoSellY%
		VAutoSellY := VAutoSellY + VAutoSellStep
	}
}
SendInput {LCtrl Up}
BlockInput Off
ExitApp
return

WheelDown::
VWinname := 1
SendInput, {sc150}
return
WheelUp::
VWinname := 1
SendInput, {sc148}
return
;===============
; GuiClose:
; ExitApp
; return
;==============================================
;перезапуск скрипта на Control+r
; ^sc13::
; Reload
; return
;==============================================