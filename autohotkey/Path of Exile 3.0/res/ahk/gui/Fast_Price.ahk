#NoEnv
#SingleInstance force
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
Gui, 1:Add, Edit, x10 y12 w123 w160 r1 vWHAT_I_GET, 1
Gui, 1:Add, UpDown, Range1-9999, 1
Gui, 1:Font, S16 W700, Verdana
Gui, 1:Add, Button, x10 y55 h50 w160 gCopyandCloseAll Default, Copy && Close
Gui, 1:Font, S32 W700, ft13
Gui, 1:Add, Text, x10 y115 gPrice2, 2
Gui, 1:Add, Text, x+8 y115 gPrice3, 3
Gui, 1:Add, Text, x+8 y115 gPrice4, 4
Gui, 1:Add, Text, x+8 y115 gPrice5, 5
Gui, 1:Add, Text, x+8 y115 gPrice6, 6
Gui, 1:Add, Text, x+8 y115 gPrice7, 7
Gui, 1:Add, Text, x+8 y115 gPrice8, 8
Gui, 1:Font, S16 W700, Verdana
Gui, 1:Add, Button, x50 y170 h30 gClose, Close

Gui, 1:Show, x%MposX% y%MposY% w181 h215, Price
; Gui, 1:Show, x%MposX% y%MposY%, Price
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
Price2:
VPrice := "~price 2 chaos"
Sleep, 30
Clipboard := VPrice
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
Price3:
VPrice := "~price 3 chaos"
Sleep, 30
Clipboard := VPrice
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
Price4:
VPrice := "~price 4 chaos"
Sleep, 30
Clipboard := VPrice
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
Price5:
VPrice := "~price 5 chaos"
Sleep, 30
Clipboard := VPrice
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
Price6:
VPrice := "~price 6 chaos"
Sleep, 30
Clipboard := VPrice
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
Price7:
VPrice := "~price 7 chaos"
Sleep, 30
Clipboard := VPrice
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
Price8:
VPrice := "~price 8 chaos"
Sleep, 30
Clipboard := VPrice
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