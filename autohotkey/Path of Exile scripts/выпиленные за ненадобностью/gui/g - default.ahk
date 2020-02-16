Menu, Tray, Icon, res\pic\def.ico, 1
;==============================================
vc1 = 0000ff ;синий
vc2 = F55B00 ;оранжевый 
vc3 = 00ffff ;голубой
vc4 = ffffff ;белый
vc5 = 000000 ;черный
vc6 = 00ff00 ;зеленый
vc7 = ff0000 ;красный
vc8 = 191919 ;темно серый
vc9 = 464646 ;серый
vc11 = 006600 ;темно зеленый
;==============================================
Gui, +LastFound +AlwaysOnTop +ToolWindow +OwnDialogs
;Gui, Font, S50 Bold, Tahoma ;тайтл
;Gui, Add, Text, x7 y37 w240 h150 c%vc9% BackgroundTrans, default
;Gui, Add, Text, x2 y30 w240 h150 c%vc11% BackgroundTrans, default
Gui, Font, S30 Bold, Tahoma ;тайтл
Gui, Add, Text, x93 y-1 w240 h50 c%vc4% BackgroundTrans, Default
Gui, Add, Text, x90 y-5 w240 h50 c%vc7% BackgroundTrans, Default
;окно и прозрачность
Gui, Show, x310 y930 h140 w250, default
Gui, Color, 000001
WinSet, TransColor, 000001
Gui, -Caption ;без рамки
Return

GuiClose:
ExitApp
;============================================== AMD Radeon R9 200 Series
^!+F12::ExitApp ;закрытие gui из основного скрипта
;==============================================
;перезапуск скрипта на Control+r
;^sc13::
;Reload
;return
;=============================================