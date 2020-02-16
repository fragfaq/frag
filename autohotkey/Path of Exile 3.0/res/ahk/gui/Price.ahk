CoordMode, Mouse, Screen

#include %A_ScriptDir%\res\ToolTipFont.ahk

Menu, Tray, Icon, %A_ScriptDir%\res\pic\s.ico, 1

SendInput, ^{sc2E} ; Копирование в буфер из под курсора
Sleep, 50

Item_Copy := Clipboard
Sleep, 30
Item_Copy_Start_Cut := RegExReplace(Item_Copy, "^.*", "") ; Обрезание первой строки
Sleep, 30
Item_Copy_No_Enter := RegExReplace(Item_Copy_Start_Cut, "`r`n", "") ; Обрезание переноса строк
Sleep, 30
Item_Copy_Full_Cut := RegExReplace(Item_Copy_No_Enter, "-.*$", "") ; Обрезание 3ей строки и далее
Sleep, 30

If Item_Copy_Full_Cut != Chaos Orb  ; Если скопирован не хаос - в дроплисте ставим хаос
{
	Currency_List := "chaos||exa|alch|fuse|jew|chisel|vaal"
}
else If Item_Copy_Full_Cut = Chaos Orb ; Если скопирован хаос - в дроплисте ставим экзальт
{
	Currency_List := "chaos|exa||alch|fuse|jew|chisel|vaal"
}
if Item_Copy_Full_Cut = "" ; Если скопировалась какая-то херня, она превратится в пустое значение после обрезаний
Sleep, 30

Gui, 1:+LastFound +AlwaysOnTop +OwnDialogs +Owner
Gui, 1:Color, 666666, 666666 ; Цвет Gui
Gui, 1:Font, S18 W700, Verdana
Gui, 1:Add, Text, x10 y15, I want
Gui, 1:Add, Text, x10 y55, For
Gui, 1:Font, S14 W700, Verdana
Gui, 1:Add, Edit, x110 y10 w90 r1 vWHAT_I_GET, 1
Gui, 1:Add, UpDown, Range1-9999, 1
Gui, 1:Font, S11 W1000, Verdana
Gui, 1:Add, DropDownList, vCurrency x220 y10 w90, %Currency_List%
Gui, 1:Add, Button, x330 y10 w155 h25 gCopyandCloseAll Default, Copy && Close
Gui, 1:Font, S14 W700, Verdana
Gui, 1:Add, Edit, x110 y50 w90 r1 vWHAT_I_HAVE_TO_PAY, 1
Gui, 1:Add, UpDown, Range1-9999, 1
Gui, 1:Font, S12 W700, Verdana
Gui, 1:Add, Text, x220 y60 w320 r1 c00ff00, %Item_Copy_Full_Cut%
Gui, 1:Add, Progress, x-5 y86 w510 h4 BackgroundE0EE01
Gui, 1:Font, S14 W700 c000000, Verdana
Gui, 1:Font, S14 W700 c000000, Verdana
Gui, 1:Add, Progress, x-5 y120 w510 h4 Background000000
Gui, 1:Add, Button, x20 y135 w260 h25 gSetprice, Previev
Gui, 1:Add, Button, x325 y135 w155 h25 gReloadTooltip, ReloadTooltip

Gui, 1:Add, Progress, x-5 y171 w510 h4 Background000000
Gui, 1:Add, GroupBox, x10 y176 w475 h105 cE0EE01, Готовые прайсы (кликабельны)
Gui, 1:Add, Text, x15 y205 g1_5, 1.5 (2шт за 3орба)
Gui, 1:Add, Text, x260 y205 g2_5, 2.5 (2шт за 5орба)
Gui, 1:Add, Text, x15 y250 g3_5, 3.5 (2шт за 7орба)
Gui, 1:Add, Text, x260 y250 g4_5, 4.5 (2шт за 9орбов)
Gui, 1:Show, x240 y400 w500, Price
Return

Setprice:
GuiControlGet, WHAT_I_HAVE_TO_PAY
GuiControlGet, Currency
GuiControlGet, WHAT_I_GET
ToolTipFont("s14", "Verdana")
ToolTipColor("Black", "White")
VPrice := "~price "
Sleep, 20
If Ratio = 0
VPrice .= WHAT_I_GET "/" WHAT_I_HAVE_TO_PAY " " Currency
Sleep, 30
ratio1 := (Round(WHAT_I_GET / WHAT_I_HAVE_TO_PAY, 4))
ratio2 := (Round(WHAT_I_HAVE_TO_PAY / WHAT_I_GET, 4))
Vtool = "%VPrice%"`n`n[ %Currency% ] 1 : %ratio2% [ %Item_Copy_Full_Cut% ]`n[ %Currency% ] %ratio1% : 1 [ %Item_Copy_Full_Cut% ]
Tooltip, %Vtool%
MouseGetPos, VXPosB, VYPosB, VWinname
Loop
{
	MouseGetPos, VXPos1, VYPos1, VWinname1
	Sleep, 200
	if VWinname != %VWinname1%
	{
		Tooltip
		break
	}
}
return

1_5: ; 1.5со (~b/o 3/2 chaos)
GuiControlGet, Currency
Sleep, 20
VPrice1 := "~price "
Sleep, 20
VPrice1 .= "3/2" " " Currency
Sleep, 20
Clipboard := VPrice1
Sleep, 20
Tooltip, "~price 3/2 chaos" copy
return

2_5: ; 2.5со (~b/o 5/2 chaos)
GuiControlGet, Currency
Sleep, 20
VPrice1 := "~price "
Sleep, 20
VPrice1 .= "5/2" " " Currency
Sleep, 20
Clipboard := VPrice1
Sleep, 20
Tooltip, "~price 5/2 chaos" copy
return
return

3_5: ; 3.5со (~b/o 7/2 chaos)
GuiControlGet, Currency
Sleep, 20
VPrice1 := "~price "
Sleep, 20
VPrice1 .= "7/2" " " Currency
Sleep, 20
Clipboard := VPrice1
Sleep, 20
Tooltip, "~price 7/2 chaos" copy
return

4_5: ; 4.5со (~b/o 9/2 chaos)
GuiControlGet, Currency
Sleep, 20
VPrice1 := "~price "
Sleep, 20
VPrice1 .= "9/2" " " Currency
Sleep, 20
Clipboard := VPrice1
Sleep, 20
Tooltip, "~price 9/2 chaos" copy
return

WheelDown::
VWinname := 1
SendInput, {sc150}
return
WheelUp::
VWinname := 1
SendInput, {sc148}
return

ReloadTooltip:
Tooltip
VWinname1 := ""
return

CopyandCloseAll:
GuiControlGet, WHAT_I_HAVE_TO_PAY
GuiControlGet, Currency
GuiControlGet, WHAT_I_GET
ToolTipFont("s14", "Verdana")
ToolTipColor("Black", "White")
VPrice := "~price "
Sleep, 20
if WHAT_I_HAVE_TO_PAY = 1
{
	VPrice .= WHAT_I_GET " " Currency
}
else if WHAT_I_HAVE_TO_PAY <> 1
{
	VPrice .= WHAT_I_GET "/" WHAT_I_HAVE_TO_PAY " " Currency
}
Sleep, 30
Clipboard := VPrice
exitapp
return

GuiClose:
ExitApp
return

; ==============================================
; перезапуск скрипта на Control+r
^sc13::
Reload
return
; =============================================
;=============================================
;закрытие gui из основного скрипта
^!+F12::ExitApp ; закрытие скрипта при релоаде Path of Exile 3.0.ahk
return