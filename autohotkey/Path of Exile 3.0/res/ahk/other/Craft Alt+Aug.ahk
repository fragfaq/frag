;==============================================
Menu, Tray, Icon, %A_ScriptDir%\res\pic\play3.png, 1
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
MsgBox, , Hotkeys for craft Magic items, B or RightArrow = Use Alt orb`nN or Numpad0 = Use Aug orb`nM = Exit script
;==================================================
; Кинуть в шмотку Альт на B
sc30::
sc14D::
MouseMove, % randpos(97, 131), % randpos(318, 344), % mousespeed(1, 2)
Sleep, % Sleepfunction(40, 60)
Click Right
Sleep, % Sleepfunction(40, 60)
MouseMove, % randpos(300, 367), % randpos(444, 590), % mousespeed(1, 2)
Sleep, % Sleepfunction(40, 60)
Click Left
Sleep, % Sleepfunction(40, 60)
return
;==================================================
; Кинуть в шмотку Ауг на N
sc31::
sc52::
MouseMove, % randpos(216, 245), % randpos(369, 395), % mousespeed(1, 2)
Sleep, % Sleepfunction(40, 60)
Click Right
Sleep, % Sleepfunction(40, 60)
MouseMove, % randpos(300, 367), % randpos(444, 590), % mousespeed(1, 2)
Sleep, % Sleepfunction(40, 60)
Click Left
Sleep, % Sleepfunction(40, 60)
return
;==================================================
; Выход на M
sc32::
ExitApp
return
return


