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
MsgBox, , Craft in currency stash tab:, Press H to see all the hotkeys., 1
;==================================================
sc23::
Gui, +LastFound +AlwaysOnTop +ToolWindow
Gui +OwnDialogs
Gui, Font, S16 W900, Verdana
Gui, Add, Text,, H = hotkeys
Gui, Add, Text,, B = Alt
Gui, Add, Text,, N = Aug
Gui, Add, Text,, RightArrow = Scouring and Alchemy
Gui, Add, Text,, Numpad0 = Only Scouring
Gui, Add, Text,, C = Trans
Gui, Add, Text,, R = Regal
Gui, Add, Text,, M = Exit
Gui, Show, NoActivate, Autocast
return
;==================================================
; Кинуть в шмотку Альт на B
sc30::
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
; Кинуть в шмотку только Скуринг на Numpad0
sc52::
MouseMove, % randpos(417, 445), % randpos(461, 488), % mousespeed(0, 1)
Sleep, % Sleepfunction(40, 60)
Click Right
MouseMove, % randpos(300, 367), % randpos(444, 590), % mousespeed(0, 1)
Sleep, % Sleepfunction(40, 60)
Click Left
Sleep, % Sleepfunction(40, 60)
return
;==================================================
; Кинуть в шмотку Скуринг, а потом Алч на RightArrow
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
; Кинуть в шмотку Транс на С
sc2E::
MouseMove, % randpos(43, 71), % randpos(313, 345), % mousespeed(0, 1)
Sleep, % Sleepfunction(40, 60)
Click Right
MouseMove, % randpos(300, 367), % randpos(444, 590), % mousespeed(0, 1)
Sleep, % Sleepfunction(40, 60)
Click Left
Sleep, % Sleepfunction(40, 60)
return
;==================================================
; Кинуть в шмотку Регал на R
sc13::
MouseMove, % randpos(417, 441), % randpos(316, 346), % mousespeed(0, 1)
Sleep, % Sleepfunction(40, 60)
Click Right
MouseMove, % randpos(300, 367), % randpos(444, 590), % mousespeed(0, 1)
Sleep, % Sleepfunction(40, 60)
Click Left
Sleep, % Sleepfunction(40, 60)
return
;==================================================
; Выход на M
sc32::
ExitApp
return
;==================================================
#IfWinActive ahk_group poe
;==================================================