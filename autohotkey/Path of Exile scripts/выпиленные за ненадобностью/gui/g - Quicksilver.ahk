Menu, Tray, Icon, res\pic\q.ico, 1
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
vc10 = 6c6c6c ;светло серый
;==============================================
Gui, +LastFound +AlwaysOnTop +ToolWindow +OwnDialogs
Gui, Font, s25 Bold, Tahoma ;1 фласка
Gui, Add, Text, x6 y52 w50 h50 c%vc1% BackgroundTrans, 1 ;element 1
Gui, Add, Text, x2 y49 w50 h50 c%vc4% BackgroundTrans, 1 ;element 1
Gui, Add, Text, x6 y81 w50 h50 c%vc1% BackgroundTrans, 2 ;element 2
Gui, Add, Text, x2 y78 w50 h50 c%vc4% BackgroundTrans, 2 ;element 2
Gui, Font, s30 Bold, Tahoma ;2 фласка
Gui, Add, Text, x49 y64 w50 h50 c%vc5% BackgroundTrans, D
Gui, Add, Text, x45 y60 w50 h50 c%vc2% BackgroundTrans, D
Gui, Font, S25 Bold, Tahoma ;3 фласка
Gui, Add, Text, x100 y52 w50 h50 c%vc5% BackgroundTrans, 3 ;element 1
Gui, Add, Text, x97 y49 w50 h50 c%vc2% BackgroundTrans, 3 ;element 1
Gui, Add, Text, x100 y81 w50 h50 c%vc5% BackgroundTrans, 4 ;element 2
Gui, Add, Text, x97 y78 w50 h50 c%vc2% BackgroundTrans, 4 ;element 2
Gui, Font, S25 Bold, Tahoma ;4 фласка
Gui, Add, Text, x142 y52 w50 h50 c%vc5% BackgroundTrans, 3 ;element 1
Gui, Add, Text, x140 y49 w50 h50 c%vc2% BackgroundTrans, 3 ;element 1
Gui, Add, Text, x143 y81 w50 h50 c%vc5% BackgroundTrans, 4 ;element 2
Gui, Add, Text, x140 y78 w50 h50 c%vc2% BackgroundTrans, 4 ;element 2
Gui, Font, S25 Bold, Tahoma ;5 фласка
Gui, Add, Text, x193 y52 w50 h50 c%vc5% BackgroundTrans, 3 ;element 1
Gui, Add, Text, x190 y49 w50 h50 c%vc2% BackgroundTrans, 3 ;element 1
Gui, Add, Text, x193 y81 w50 h50 c%vc5% BackgroundTrans, 4 ;element 2
Gui, Add, Text, x190 y78 w50 h50 c%vc2% BackgroundTrans, 4 ;element 2
Gui, Font, S25 Bold, Tahoma ;тайтл
Gui, Add, Text, x63 y-1 w240 h50 c%vc3% BackgroundTrans, Quicksilver
Gui, Add, Text, x60 y-5 w240 h50 c%vc10% BackgroundTrans, Quicksilver
;окно и прозрачность
Gui, Show, x310 y930 h140 w250, Quicksilver
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