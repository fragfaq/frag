﻿;==============================================
; Заводим шарманку: устанавливаем иконку, настройку перезапуска скрипта, если вдруг что
#SingleInstance force
Menu, Tray, Icon, %A_ScriptDir%\res\2.ico, 1
;==============================================
Global Var_conv_cd = 0
Global Var_QS = 0
;==============================================
; Активируем нужное нам окно
IfWinNotActive, ("ahk_class POEWindowClass")
		{
			WinWaitActive, Path of Exile
		}
Sleep, 30
;==============================================
; Даем звуком понять, что скрипт запущен
SoundBeep, 60, 50
;==============================================
; Отображаем Gui, что б знать, когда скрипт работает
Gui, +LastFound +AlwaysOnTop +ToolWindow +OwnDialogs
Gui, Font, S16 W900, Verdana
Gui, Add, Text, x10 y3 c000000 BackgroundTrans, Auto
Gui, Add, Text, x6 y0 c00ff00 BackgroundTrans, Auto
Gui, Show, x1635 y1020 NoActivate, Auto_Phase_Run
Gui, Color, 000001
WinSet, TransColor, 000001
Gui, -Caption
;==============================================
; Устанавливаем параметры рабочего окна, вне которых скрипт работать не должен.
GroupAdd, poe, ahk_exe PathOfExile.exe
GroupAdd, poe, ahk_exe PathOfExile_x64.exe
;==============================================
; Активируем эти параметры
#IfWinActive ahk_group poe
;==============================================
; Вводим функцию для создания случайного временного промежутка
Sleepfunction(min, max) {
	random, randb, min, max
	return randb
}
;==================================================
; Делаем пометку, на случай, если окно, в котором должен выполняться скрипт, не активно - дождаться его активации
; После этого прожимаем бинды скрипта в ручную, т.к. таймер прожмет их после прошествия указанного времени.
IfWinNotActive, ("ahk_class POEWindowClass")
		{
			WinWaitActive, Path of Exile
		}
	SendInput, {scA}
	; Sleep, % Sleepfunction(40, 60)
	; SendInput, {MButton}
	Sleep, % Sleepfunction(40, 60)
	SendInput, {scB}
;==============================================
; Устанавливаем таймер примерно на 4 секунды,  с разбросом в 0.1 секунды для бон армора и фэйсрана
; бонармора и фэйсрана больше нет, а значит и таймеров для них.
; SetTimer, FRBATimer, % Sleepfunction(4150, 4250)
;============
; Устанавливаем таймер на секунe с копьем,  с разбросом в 0.1 секунды Вортекса.
SetTimer, Vortex, % Sleepfunction(1150, 1250)
;============
; Устанавливаем таймер на примерно 4,7 секунды для ИК
SetTimer, IC, % Sleepfunction(5500, 5900)
Return
;==============================================
; Запуск и остановка цикла конвокейжна, без керсы (для делва)
~+scB::
if Var_conv_cd = 0
{
	SendInput, {sc11}
	SetTimer, Conv, % Sleepfunction(2550, 2650)
		Progress, b w150, ON, Convocation, My Title
	Progress, 100 ; Set the position of the bar to 50%.
	Sleep, 750
	Progress, Off
	Var_conv_cd := 1
}
else if Var_conv_cd = 1
{
	SetTimer, Conv, off
		Progress, b w150, OFF, Convocation, My Title
	Progress, 10 ; Set the position of the bar to 50%.
	Sleep, 750
	Progress, Off
	Var_conv_cd := 0
}
return
;==============================================
; Всплывашка состояния автоквиксильвера, потом доделать
~+MButton::
if Var_QS = 0
{
	SendInput, 5
	SetTimer, AutoQS, % Sleepfunction(3550, 6650)
		Progress, b w150, ON, Quicksilver, My Title
	Progress, 100 ; Set the position of the bar to 50%.
	Sleep, 750
	Progress, Off
	Var_QS := 1
}
else if Var_QS = 1
{
	SetTimer, AutoQS, off
	Progress, b w150, OFF, Quicksilver, My Title
	Progress, 10 ; Set the position of the bar to 50%.
	Sleep, 750
	Progress, Off
	Var_QS := 0
}
return
;==============================================
Vortex:
	IfWinNotActive, ("ahk_class POEWindowClass")
		{
			WinWaitActive, Path of Exile
		}
	Sleep, % Sleepfunction(40, 60)
	SendInput, {scB}
Return
;==============================================
IC:
	IfWinNotActive, ("ahk_class POEWindowClass")
		{
			WinWaitActive, Path of Exile
		}
	Sleep, % Sleepfunction(40, 60)
	SendInput, {scA}
Return
;==============================================
Conv:
	IfWinNotActive, ("ahk_class POEWindowClass")
		{
			WinWaitActive, Path of Exile
		}
	Sleep, % Sleepfunction(40, 60)
	SendInput, {sc11}
Return
;==============================================
AutoQS:
	IfWinNotActive, ("ahk_class POEWindowClass")
		{
			WinWaitActive, Path of Exile
		}
	Sleep, % Sleepfunction(40, 60)
	SendInput, 5
Return
;==============================================
;============
;============
; Левый бинд, что б скрипт не закрывался
^!+sc1B::
Sleep, 50
return
; ==================
#IfWinActive
















#IfWinActive