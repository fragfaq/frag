﻿vc1 = 0000ff ;синий
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
Gui, Font, S25 Bold, Tahoma ;тайтл
Gui, Add, Text, x93 y-1 w240 h50 c%vc4% BackgroundTrans, default
Gui, Add, Text, x90 y-5 w240 h50 c%vc7% BackgroundTrans, default
;окно и прозрачность
Gui, Show, x310 y930 h140 w250, default
Gui, Color, 000001
WinSet, TransColor, 000001
Gui, -Caption ;без рамки
sleep, 400
ExitApp
