vc1 = 464646 ;серый
vc2 = ff0000 ;красный
;==============================================
Gui, +LastFound +AlwaysOnTop +ToolWindow +OwnDialogs
Gui, Font, S30 Bold, Tahoma ;тайтл
Gui, Add, Text, x84 y-1 w240 h50 c%vc1% BackgroundTrans, OFF
Gui, Add, Text, x80 y-5 w240 h50 c%vc2% BackgroundTrans, OFF
;окно и прозрачность
Gui, Show, x310 y930 h140 w250, Life Flask
Gui, Color, 000001
WinSet, TransColor, 000001
Gui, -Caption ;без рамки
Return

GuiClose:
ExitApp
;==============================================
^!+F12::ExitApp ;закрытие gui из основного скрипта