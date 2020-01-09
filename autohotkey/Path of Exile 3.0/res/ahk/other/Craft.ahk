;==============================================
; Вводим функцию для создания случайного временного промежутка
sleepfunction(min, max)
{
	random, randa, min, max
	return randa
}
;==================================================
; Вводим функцию для создания случайной скорости мышки
mousespeed(min, max)
{
	random, randb, min, max
	return randb
}
;==================================================
; Вводим функцию для создания случайных координат
randpos(min, max)
{
	random, randc, min, max
	return randc
}
;==================================================
MsgBox, , Hotkeys for craft magic items, B = Use Alt orb`nN = Use Aug orb`nM = Exit script
;==================================================
; Кинуть Альт на B
sc30::
MouseMove, % randpos(97, 131), % randpos(318, 344), % mousespeed(2, 4)
Sleep, % Sleepfunction(40, 60)
Click Right
Sleep, % Sleepfunction(40, 60)
MouseMove, % randpos(300, 367), % randpos(444, 590), % mousespeed(2, 4)
Sleep, % Sleepfunction(40, 60)
Click Left
Sleep, % Sleepfunction(40, 60)
return
;==================================================
; Кинуть Ауг на N
sc31::
MouseMove, % randpos(216, 245), % randpos(369, 395), % mousespeed(2, 4)
Sleep, % Sleepfunction(40, 60)
Click Right
Sleep, % Sleepfunction(40, 60)
MouseMove, % randpos(300, 367), % randpos(444, 590), % mousespeed(2, 4)
Sleep, % Sleepfunction(40, 60)
Click Left
Sleep, % Sleepfunction(40, 60)
return
;==================================================
; Выход на M
sc32::
SetTitleMatchMode, 2
DetectHiddenWindows, On
WinClose, Craft.ahk - AutoHotkey v
return


