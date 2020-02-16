Menu, Tray, NoIcon
;==============================================
; Текст, в Т3 много не влазит
T1 = 
T2 = 
T3 = GEM SWAP
T4 = 
;==============================================
SetTitleMatchMode, 2 ; for IfWinActive
; окна под гуй
GroupAdd, poe, ahk_exe PathOfExile.exe
GroupAdd, poe, ahk_exe PathOfExile_x64.exe
GroupAdd, poe, ahk_exe notepad.exe
GroupAdd, poe, PoE - Google Таблицы ahk_exe chrome.exe
; GroupAdd, poe, ahk_exe notepad++.exe
;==============================================
; Цвет текста
vc1 = F55B00 ;оранжевый 
vc2 = 00ffff ;голубой
vc3 = ffffff ;белый
vc4 = 00ff00 ;зеленый
vc5 = ff0000 ;красный
vca = %vc4%
;==============================================
; Параметры кнопки
B1 = x340 y125 h50 w20
B2 = x340 y175 h50 w20
B3 = x340 y225 h25 w20
; поверх всех окон, рамка и прозрачность (ее прописываем отдельно)
Gui, -Caption
Gui, +LastFound +AlwaysOnTop +ToolWindow
Gui, +OwnDialogs
; Шрифт
Gui, Font, s16 w800
; расположение текста
Gui, Add, Text, x0 y0 w800 h30 c%vca%, %T1%
Gui, Add, Text, x0 y25 w800 h30 c%vca%, %T2%
Gui, Add, Text, x0 y50 w200 h30 c%vca%, %T3%
Gui, Add, Text, x0 y75 w800 h30 c%vca%, %T4%
; прозрачность
Gui, Color, 000001
WinSet, TransColor, 000001

; цветные кнопки
Gui, Add, Button, %B1%, X
Gui, Add, Button, %B2%, E
Gui, Add, Button, %B3%, R
;==============================================
; таймер, для проверки IfWinActive
; SetTimer, Show_Gui, 300
; Return
; отоброжение по IfWinActive
; Show_Gui:
; IfWinActive, ahk_group poe
; {
; SetTimer, Show_Gui, Off
Gui, Show, x210 y830 h300 w800 NoActivate, sticker
; WinSet, AlwaysOnTop, On, foo ahk_class AutoHotkeyGUI
; WinWaitNotActive, ahk_group poe
; Sleep, 50
; Gui, Cancel
; SetTimer, Show_Gui, On
; }
Return

;==============================================
; кнопки
ButtonX:
ExitApp
return
ButtonE:
Edit
return
ButtonR:
Reload
return
;==============================================
;перезапуск скрипта на Control+r
; ^sc13::
; Reload
; return
;=============================================