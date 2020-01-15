;==============================================
; Заводим шарманку: устанавливаем иконку, настройку перезапуска скрипта, если вдруг что
#SingleInstance force
Menu, Tray, Icon, %A_ScriptDir%\res\2.ico, 1
;==============================================
Global Var_conv_cd = 0
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
	Sleep, % Sleepfunction(40, 60)
	SendInput, {scB}
;==============================================
; Устанавливаем таймер на секундe с копьем, с разбросом в 0.1 секунды для Вортекса.
; Исходим из того, что кд вортекса 1,02 секунды и добавляем рандомный промежуток.
SetTimer, Vortex, % Sleepfunction(1150, 1250)
;============
; Устанавливаем таймер на примерно 6 секунд для ИК, исходя из базовой длительности,
; Плюсь инкрэйст дюрэйшн, плюс 3 секунды на кд, которое начинается только после окончания бафа.
SetTimer, IC, % Sleepfunction(5950, 6100)
Return
;==============================================
; Запуск и остановка цикла конвокейжна, без керсы (для делва), на Shift+0
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
; Таймеры:
;==============================================
; Для вортекса:
Vortex:
	IfWinNotActive, ("ahk_class POEWindowClass")
		{
			WinWaitActive, Path of Exile
		}
	Sleep, % Sleepfunction(40, 60)
	SendInput, {scB}
Return
;==============================================
; Для Иммортал кола:
IC:
	IfWinNotActive, ("ahk_class POEWindowClass")
		{
			WinWaitActive, Path of Exile
		}
	Sleep, % Sleepfunction(40, 60)
	SendInput, {scA}
Return
;==============================================
; Для конвокейжена:
Conv:
	IfWinNotActive, ("ahk_class POEWindowClass")
		{
			WinWaitActive, Path of Exile
		}
	Sleep, % Sleepfunction(40, 60)
	SendInput, {sc11}
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