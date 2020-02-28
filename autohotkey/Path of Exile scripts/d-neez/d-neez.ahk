#Persistent 
CoordMode, Mouse, Screen
SetDefaultMouseSpeed, 3
Var := 0
FileRead, CharName, %A_ScriptDir%\CharName.txt
;==============================================
Menu, Tray, Icon, %A_ScriptDir%\res\1.ico, 1
;==============================================
menu, tray, add, CHANGE CHARACTER NAME, char_name
menu, tray, add, DIV EXALT, ExCalc
menu, tray, add, CURRENCY CALC, Currency_Calc
menu, tray, add, RELOAD SCRIPT, reboot
Menu, Tray, Add,
Menu, tray, Default, CHANGE CHARACTER NAME
menu, tray, NoStandard
menu, tray, Standard
;=============================================
GroupAdd, poe, ahk_exe PathOfExile.exe
GroupAdd, poe, ahk_exe PathOfExile_x64.exe
GroupAdd, poe, ahk_exe PathOfExile_x64Steam.exe
GroupAdd, poe, ahk_exe PathOfExileSteam.exe
;=============================================
#IfWinActive ahk_group poe
;=============================================
; Открытие портала на Alt+1. Свитки портала должны лежать во втором слоте нижней строки.
!sc2::
Random, v1, 50, 80
Random, v2, 50, 80
Random, v3, 50, 80
Random, v4, 50, 80
Random, v5, 50, 80
Random, v6, 50, 80
Random, Vspeed1, 4, 6
Random, Vspeed2, 4, 6
sleep, %v1%
MouseGetPos VportalX, VportalY				; Сохраняет текущие координаты курсора
sleep, %v2%
SendInput, {sc17}							; Нажимает E, что б открыть инвентарь
sleep, %v3%
MouseMove, 1345, 821, %Vspeed1%				; Наводит курсор на свиток портала
sleep, %v4%
Click Right									; Открывает портал
sleep, %v5%
SendInput, {sc17}							; Нажимает E, что б закрыть инвентарь
sleep, %v6%
MouseMove, VportalX, VportalY, %Vspeed2%	; Возвращает курсор на место
return
;=============================================
;exit на F1
F1::
BlockInput On
Process close, PathOfExile.exe
Process close, PathOfExile_x64.exe
Process close, PathOfExile_x64Steam.exe
Process close, PathOfExileSteam.exe
BlockInput Off
return
;=============================================
; Hideout
F2::
Random, vho1, 40, 80
Random, vho2, 40, 80
Random, vho3, 40, 80
BlockInput On
SendInput, {Enter}
sleep, %vho1%
SendInput, {/}
sleep, %vho2%
SendInput, hideout
sleep, %vho3%
SendInput, {Enter}
BlockInput Off
return
;=============================================
; Ливнуть из пати на Alt+2
!sc3::
SendInput {Enter}/kick %CharName%{Enter}
return
;=========== Бинды на 1-5 =====================================
;=========== Бинд на 1 ========================================
sc2::
if Var != 2 
{
	SendInput, % "{" A_ThisHotkey "}"
}
else if Var = 2
{
	Run, %A_ScriptDir%\res\flask12345.ahk
}
return
;=========== Бинд на 2 ========================================
sc3::
if (Var = 0 or Var = 3)
{
	SendInput, % "{" A_ThisHotkey "}"
}
else if Var = 1
{
	Run, %A_ScriptDir%\res\flask2345.ahk
}
else if Var = 2
{
	Run, %A_ScriptDir%\res\flask12345.ahk
}
return
;=========== Бинды на 3,4 и 5 =================================
sc4::
sc5::
sc6::
if Var = 0
{
	SendInput, % "{" A_ThisHotkey "}"
}
else if Var = 1
{
	Run, %A_ScriptDir%\res\flask2345.ahk
}
else if Var = 2
{
	Run, %A_ScriptDir%\res\flask12345.ahk
}
else  if Var = 3
{
	Run, %A_ScriptDir%\res\flask345.ahk
}
return
;=============================================
; Быстрый прайс на Ctrl+1
^sc2::
Run, %A_ScriptDir%\res\Fast_Price.ahk
return
;=============================================
#IfWinActive
;=============================================
F3::
If Var = 0
{
	Run, %A_ScriptDir%\res\g - 2345.ahk ; Открыть gui
	Var := 1 ; Сменить значение переменной
}
else if Var = 1
{
	Run, %A_ScriptDir%\res\g - 12345.ahk ; Открыть gui
	Var := 2 ; Сменить значение переменной
}
else if Var = 2
{
	Run, %A_ScriptDir%\res\g - 345.ahk ; Открыть gui
	Var := 3 ; Сменить значение переменной
}
else if Var = 3
{
	Run, %A_ScriptDir%\res\g - default.ahk ; Открыть gui
	Var := 0 ; Сменить значение переменной
}
return
;=============================================
ScrollLock:: ; Сброс на стандартные бинды
Run, %A_ScriptDir%\res\g - default.ahk ; Открыть gui
sleep, 50
Var := 0
return
;=============================================
ExCalc:
Run, %A_ScriptDir%\res\Exalt div cadr calc.ahk
return
;=============================================
; Для проверки значения переменной
; F12::
; MsgBox, CharName = %CharName%
; return
;==============================================
char_name:
InputBox, char_name_text, enter text, Enter new character name:
Sleep, 100
If ErrorLevel = 0
{
	FileDelete, %A_ScriptDir%\CharName.txt
	Sleep, 100
	FileAppend, %char_name_text%, %A_ScriptDir%\CharName.txt
	Sleep, 100
	Reload
}
return
;==============================================
; Прайс для валютки на Ctrl+F5
Currency_Calc:
Run, %A_ScriptDir%\res\currency_price.ahk
return
;==============================================
; Перезапуск скрипта на Control+r
^sc13::
reboot:
Reload
return
;=============================================