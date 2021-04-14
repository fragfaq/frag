#SingleInstance force
;==============================================
; Устанавливаем параметры рабочего окна, вне которых скрипт работать не должен.
GroupAdd, poe, ahk_exe PathOfExile.exe
GroupAdd, poe, ahk_exe PathOfExile_x64.exe
GroupAdd, poe, ahk_exe PathOfExile_x64Steam.exe
GroupAdd, poe, ahk_exe PathOfExileSteam.exe
;==============================================
; Активируем эти параметры
; #IfWinActive ahk_group poe
;==============================================
; Функция для рандомных слипов
Sleepfunction(min, max) {
	random, randb, min, max
	return randb
}
;==================================================
; Запускаем шарманку на F6
F6::
; Делаем пометку, на случай, если окно, в котором должен выполняться скрипт, не активно - дождаться его активации
; Первый раз прожимаем бинды скрипта в ручную, т.к. таймер прожмет их только после прошествия указанного времени.
IfWinNotActive, ("ahk_class POEWindowClass")
		{
			WinWaitActive, ahk_class POEWindowClass
		}
	SendInput, {a}
	Sleep, % Sleepfunction(40, 60)
	SendInput, {b}
; Обявляем таймеры и устанавливаем время
	SetTimer, tBrand, % Sleepfunction(1990, 2190)
	SetTimer, tFocus, % Sleepfunction(12050, 12150)
Return
;==============================================
; Останавливаем шарманку на F12
F12::
SetTimer, tBrand, off
SetTimer, tFocus, off
Return
;==============================================
; Функционал таймеров
;==============================================
; Для брандов
tBrand:
IfWinNotActive, ("ahk_class POEWindowClass")
	{
		WinWaitActive ahk_class POEWindowClass
	}
Sleep, % Sleepfunction(40, 60)
SendInput, {a}
Sleep, 20
Return
;==============================================
; Для фокуса
tFocus:
IfWinNotActive, ("ahk_class POEWindowClass")
	{
		WinWaitActive, ahk_class POEWindowClass
	}
Sleep, % Sleepfunction(40, 60)
SendInput, {b}
Sleep, 20
Return
;==============================================
; #IfWinActive


















