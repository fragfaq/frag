;==============================================
Menu, Tray, Icon, %A_ScriptDir%\res\pic\play3.png, 1
;==============================================
GroupAdd, poe, ahk_exe PathOfExile.exe
GroupAdd, poe, ahk_exe PathOfExile_x64.exe
; ==============================================
#IfWinActive ahk_group poe
; ==============================================
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
MsgBox, , Hotkeys for craft Rare items:, B or RightArrow = Use Orb of Scouring`,`nFor reset item and immediately using`nOrb of Alchemy`, for greate new Rare item.`nM = ExitApp., 2
;==================================================
; Кинуть в шмотку Скуринг, а потом Алч на B или стрелку вправо.
sc30::
sc14D::
MouseMove, % randpos(417, 445), % randpos(461, 488), % mousespeed(0, 1)
Sleep, % Sleepfunction(40, 60)
Click Right
MouseMove, % randpos(300, 367), % randpos(444, 590), % mousespeed(0, 1)
Sleep, % Sleepfunction(40, 60)
Click Left
Sleep, % Sleepfunction(40, 60)
MouseMove, % randpos(476, 503), % randpos(319, 346), % mousespeed(0, 1)
Sleep, % Sleepfunction(40, 60)
Click Right
Sleep, % Sleepfunction(40, 60)
MouseMove, % randpos(300, 367), % randpos(444, 590), % mousespeed(0, 1)
Sleep, % Sleepfunction(40, 60)
Click Left
Sleep, % Sleepfunction(140, 160)
SendInput, ^{sc2E}
return
;==================================================
; Выход на M
sc32::
ExitApp
return
;==================================================
#IfWinActive ahk_group poe