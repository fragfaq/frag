#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#NoTrayIcon
;=============================================
; Опции Gui
Gui, +LastFound +AlwaysOnTop +ToolWindow +OwnDialogs
; Размер и цвет шрифта
Gui, Font, S14 W700 C00ff00, Verdana
; Цвет Gui, что б сделать его прозрачным
Gui, Color, 666666, 666666
; Сами цифры
Gui, Add, Text, x56 y15, 1
Gui, Add, Text, xp+66 y15, 2
Gui, Add, Text, xp+66 y15, 3
Gui, Add, Text, xp+66 y15, 4
Gui, Add, Text, xp+66 y15, 5
Gui, Add, Text, xp+66 y15, 6
Gui, Add, Text, xp+66 y15, 7
Gui, Add, Text, xp+66 y15, 8
Gui, Add, Text, xp+66 y15, 9
Gui, Add, Text, x95 y85, 10
Gui, Add, Text, xp+65 y85, 11
Gui, Add, Text, xp+65 y85, 12
Gui, Add, Text, xp+65 y85, 13
Gui, Add, Text, xp+65 y85, 14
Gui, Add, Text, xp+65 y85, 15
Gui, Add, Text, xp+65 y85, 16
; Прозрачность
Gui, Color, 000001
WinSet, TransColor, 000001
Gui, -Caption
; Показать не активный Gui
Gui, Show, x5 y160 w620 h420 NoActivate, Window
return
