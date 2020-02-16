#NoEnv
#include %A_ScriptDir%\res\Class_CtlColors.ahk

Gui, +LastFound +OwnDialogs +Owner
; Gui, +LastFound +AlwaysOnTop +OwnDialogs +Owner
Gui, Color, 666666, 666666 ; Цвет Gui
Gui, Font, S12 W700, Verdana
Gui, Add, CheckBox, x15 y15 vStr1 gStr1 hwndCBID1, Line1
Gui, Add, CheckBox, x15 y+15 vStr2 gStr2 hwndCBID2, Line2
Gui, Add, CheckBox, x15 y+15 vStr3 gStr3 hwndCBID3, Line3
Gui, Add, CheckBox, x15 y+15 vStr4 gStr4 hwndCBID4, Line4
Gui, Add, CheckBox, x15 y+15 vStr5 gStr5 hwndCBID5, Line5
Gui, Add, CheckBox, x15 y+15 vStr6 gStr6 hwndCBID6, ALL
Gui, Add, Button, x15 y+15 w75 gSell, OK
Gui, Show,, New GUI Window
Return

Sell:
GuiControlGet, Str1
GuiControlGet, Str2
GuiControlGet, Str3
GuiControlGet, Str4
GuiControlGet, Str5
GuiControlGet, Str6
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
If Str6 = 1
{
	VAutoSellX := 1247
	VAutoSellX1 := 1247
	VAutoSellY := 562
	Loop, 5
	{
		Random, VSellTime1, 90, 120
		Sleep, %VSellTime1%
		VAutoSellX := VAutoSellX1 + VAutoSellStep
		VAutoSellY := VAutoSellY + VAutoSellStep
		Loop, 12
		{
			Random, VSellTime2, 90, 120
			Sleep, %VSellTime2%
			MouseClick, Left, %VAutoSellX%, %VAutoSellY%
			VAutoSellX := VAutoSellX + VAutoSellStep
		}
	}
}
else if Str6 = 0
{
	GoTo, st1
}
st1:
If Str1 = 1
{
	VAutoSellX := 1300
	VAutoSellY := 615
	Loop, 12
	{
		Random, VSellTime2, 90, 120
		Sleep, %VSellTime2%
		MouseClick, Left, %VAutoSellX%, %VAutoSellY%
		VAutoSellX := VAutoSellX + VAutoSellStep
	}
}
else if Str1 = 0
{
	GoTo, st2
}
st2:
If Str2 = 1
{
	VAutoSellX := 1300
	VAutoSellY := 664
	Loop, 12
	{
		Random, VSellTime2, 90, 120
		Sleep, %VSellTime2%
		MouseClick, Left, %VAutoSellX%, %VAutoSellY%
		VAutoSellX := VAutoSellX + VAutoSellStep
	}
}
else if Str2 = 0
{
	GoTo, st3
}
st3:
If Str3 = 1
{
	VAutoSellX := 1300
	VAutoSellY := 715
	Loop, 12
	{
		Random, VSellTime2, 90, 120
		Sleep, %VSellTime2%
		MouseClick, Left, %VAutoSellX%, %VAutoSellY%
		VAutoSellX := VAutoSellX + VAutoSellStep
	}
}
else if Str3 = 0
{
	GoTo, st4
}
st4:
If Str4 = 1
{
	VAutoSellX := 1300
	VAutoSellY := 770
	Loop, 12
	{
		Random, VSellTime2, 90, 120
		Sleep, %VSellTime2%
		MouseClick, Left, %VAutoSellX%, %VAutoSellY%
		VAutoSellX := VAutoSellX + VAutoSellStep
	}
}
else if Str4 = 0
{
	GoTo, st5
}
st5:
If Str5 = 1
{
	VAutoSellX := 1300
	VAutoSellY := 822
	Loop, 12
	{
		Random, VSellTime2, 90, 120
		Sleep, %VSellTime2%
		MouseClick, Left, %VAutoSellX%, %VAutoSellY%
		VAutoSellX := VAutoSellX + VAutoSellStep
	}
}
else if Str5 = 0
{
	GoTo, stend
}
stend:
SendInput {LCtrl Up}
BlockInput Off
ExitApp
return

Str1:
GuiControlGet, Str1
CtlColors.Change(CBID1, (Str1 ? "Lime" : "666666"), "666666")
return
Str2:
GuiControlGet, Str2
CtlColors.Change(CBID2, (Str2 ? "Lime" : "666666"), "666666")
return
Str3:
GuiControlGet, Str3
CtlColors.Change(CBID3, (Str3 ? "Lime" : "666666"), "666666")
return
Str4:
GuiControlGet, Str4
CtlColors.Change(CBID4, (Str4 ? "Lime" : "666666"), "666666")
return
Str5:
GuiControlGet, Str5
CtlColors.Change(CBID5, (Str5 ? "Lime" : "666666"), "666666")
return
Str6:
GuiControlGet, Str6
CtlColors.Change(CBID6, (Str6 ? "Lime" : "666666"), "666666")
return
; 6::
; MsgBox, %Str1% = `n%Str2% = `n%Str3% = `n%Str4% = `n%Str5% = `n%Str6% = `n
; return
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