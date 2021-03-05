#SingleInstance force
Menu, Tray, Icon, %A_ScriptDir%\res\pic\BoneArmour.png, 1
;==============================================
; Устанавливаем параметры рабочего окна, вне которых скрипт работать не должен.
GroupAdd, poe, ahk_exe PathOfExile.exe
GroupAdd, poe, ahk_exe PathOfExile_x64.exe
;==============================================
; Активируем эти параметры
#IfWinActive ahk_group poe
;==============================================
; Функция для рандомных слипов
Sleepfunction(min, max) {
	random, randb, min, max
	return randb
}
;==================================================
; Запускаем шарманку
; Делаем пометку, на случай, если окно, в котором должен выполняться скрипт, не активно - дождаться его активации
; Первый раз прожимаем бинды скрипта в ручную, т.к. таймер прожмет их только после прошествия указанного времени.
IfWinNotActive, ("ahk_class POEWindowClass")
		{
			WinWaitActive, ahk_class POEWindowClass
		}
	SendInput, {sc13}
; Обявляем таймеры и устанавливаем время
	SetTimer, BoneArmorTimer, % Sleepfunction(6050, 6200)
Return
;==============================================
; Функционал таймеров
;==============================================
BoneArmorTimer:
IfWinNotActive, ("ahk_class POEWindowClass")
	{
		WinWaitActive ahk_class POEWindowClass
	}
Sleep, % Sleepfunction(40, 60)
SendInput, {sc13}
Sleep, 20
Return
; Левый бинд, что б скрипт не закрывался
^!+F22::
Sleep, 50
return
; ==================
#IfWinActive



















