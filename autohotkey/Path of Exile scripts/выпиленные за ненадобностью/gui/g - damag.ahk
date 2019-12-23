; Menu, Tray, Icon, res\pic\d.ico, 1
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
;==============================================
Gui, +LastFound +AlwaysOnTop +ToolWindow +OwnDialogs
; Gui, Font, s25 Bold, Tahoma ;1 фласка
; Gui, Add, Text, x6 y52 w50 h50 c%vc1% BackgroundTrans, 1 ;element 1
; Gui, Add, Text, x2 y49 w50 h50 c%vc4% BackgroundTrans, 1 ;element 1
; Gui, Add, Text, x6 y81 w50 h50 c%vc1% BackgroundTrans, 2 ;element 2
; Gui, Add, Text, x2 y78 w50 h50 c%vc4% BackgroundTrans, 2 ;element 2
; Gui, Font, s20 Bold, Tahoma ;2 фласка
; Gui, Add, Text, x50 y43 w50 h50 c%vc2% BackgroundTrans, 3 ;element 1
; Gui, Add, Text, x47 y40 w50 h50 c%vc4% BackgroundTrans, 3 ;element 1
; Gui, Add, Text, x50 y67 w50 h50 c%vc2% BackgroundTrans, 4 ;element 2
; Gui, Add, Text, x47 y64 w50 h50 c%vc4% BackgroundTrans, 4 ;element 2
; Gui, Add, Text, x50 y91 w50 h50 c%vc2% BackgroundTrans, d ;element 3
; Gui, Add, Text, x47 y88 w50 h50 c%vc4% BackgroundTrans, d ;element 3
; Gui, Font, S20 Bold, Tahoma ;3 фласка
; Gui, Add, Text, x100 y43 w50 h50 c%vc5% BackgroundTrans, 3 ;element 1
; Gui, Add, Text, x97 y40 w50 h50 c%vc2% BackgroundTrans, 3 ;element 1
; Gui, Add, Text, x100 y67 w50 h50 c%vc5% BackgroundTrans, 4 ;element 2
; Gui, Add, Text, x97 y64 w50 h50 c%vc2% BackgroundTrans, 4 ;element 2
; Gui, Add, Text, x100 y91 w50 h50 c%vc5% BackgroundTrans, d ;element 3
; Gui, Add, Text, x97 y88 w50 h50 c%vc2% BackgroundTrans, d ;element 3
; Gui, Font, S20 Bold, Tahoma ;4 фласка
; Gui, Add, Text, x143 y43 w50 h50 c%vc5% BackgroundTrans, 3 ;element 1
; Gui, Add, Text, x140 y40 w50 h50 c%vc2% BackgroundTrans, 3 ;element 1
; Gui, Add, Text, x143 y67 w50 h50 c%vc5% BackgroundTrans, 4 ;element 2
; Gui, Add, Text, x140 y64 w50 h50 c%vc2% BackgroundTrans, 4 ;element 2
; Gui, Add, Text, x143 y91 w50 h50 c%vc5% BackgroundTrans, d ;element 3
; Gui, Add, Text, x140 y88 w50 h50 c%vc2% BackgroundTrans, d ;element 3
; Gui, Font, S20 Bold, Tahoma ;5 фласка
; Gui, Add, Text, x193 y43 w50 h50 c%vc5% BackgroundTrans, 3 ;element 1
; Gui, Add, Text, x190 y40 w50 h50 c%vc2% BackgroundTrans, 3 ;element 1
; Gui, Add, Text, x193 y65 w50 h50 c%vc5% BackgroundTrans, 4 ;element 2
; Gui, Add, Text, x190 y62 w50 h50 c%vc2% BackgroundTrans, 4 ;element 2
; Gui, Add, Text, x193 y91 w50 h50 c%vc5% BackgroundTrans, d ;element 3
; Gui, Add, Text, x190 y88 w50 h50 c%vc2% BackgroundTrans, d ;element 3
Gui, Font, S30 Bold, Tahoma ;тайтл
Gui, Add, Text, x93 y-1 w240 h50 c%vc4% BackgroundTrans, Damag
Gui, Add, Text, x90 y-5 w240 h50 c%vc7% BackgroundTrans, Damag
;окно и прозрачность
Gui, Show, x310 y930 h140 w250, Damag
Gui, Color, 000001
WinSet, TransColor, 000001
Gui, -Caption ;без рамки
Return

GuiClose:
ExitApp
;==============================================
^!+F12::ExitApp ;закрытие gui из основного скрипта
;==============================================
;перезапуск скрипта на Control+r
;^sc13::
;Reload
;return
;=============================================
