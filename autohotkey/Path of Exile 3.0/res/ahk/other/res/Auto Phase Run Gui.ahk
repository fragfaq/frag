Menu, Tray, Icon, %A_ScriptDir%\pic\P.png, 1

Gui, +LastFound +AlwaysOnTop +ToolWindow +OwnDialogs
Gui, Font, S30 W900, Verdana
Gui, Add, Text, x10 y3 c000000 BackgroundTrans, Auto
Gui, Add, Text, x6 y0 c00ff00 BackgroundTrans, Auto
Gui, Show, x1575 y1020 NoActivate, Auto_Phase_Run
Gui, Color, 000001
WinSet, TransColor, 000001
Gui, -Caption