Sleepfunction(min, max)
{
	random, randb, min, max
	return randb
}
; ====================================================
MouseGetPos, MposX, MposY
Sleep, 20
; ====================================================
Gui, 1:+LastFound +AlwaysOnTop +OwnDialogs +Owner -Caption
Gui, 1:Color, 666666, 666666 ; Цвет Gui
Gui, 1:Font, S18 W700, Verdana
Gui, 1:Font, S14 W700, Verdana
Gui, 1:Add, Edit, x10 y12 w90 r1 vWHAT_I_GET, 1
Gui, 1:Add, UpDown, Range1-9999, 1
Gui, 1:Font, S18 W700, Verdana
Gui, 1:Font, S11 W1000, Verdana
Gui, 1:Add, Button, x110 y12 h30 gCopyandCloseAll Default, Copy && Close
Gui, 1:Add, Button, x100 y70 h30 gClose, Close

Gui, 1:Show, x%MposX% y%MposY%, Price
Return
; ====================================================
CopyandCloseAll:
GuiControlGet, WHAT_I_GET
VPrice := "~price "
Sleep, 20
VPrice .= WHAT_I_GET " " "chaos"
Sleep, 30
Clipboard := VPrice
;exitapp
Sleep, 30
WinClose
Sleep, 30
IfWinNotActive, ("ahk_class POEWindowClass")
{
	WinActivate, Path of Exile
}
Sleep, 30
Sleep, % Sleepfunction(150, 200)
SendInput, ^{sc1E}
Sleep, % Sleepfunction(150, 200)
SendInput, {scE}
Sleep, % Sleepfunction(150, 200)
SendInput, ^{sc2F}
Sleep, 130
exitapp
return
; ====================================================
Close:
exitapp
return
; ====================================================