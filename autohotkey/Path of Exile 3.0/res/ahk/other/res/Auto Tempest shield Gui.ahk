﻿Menu, Tray, Icon, %A_ScriptDir%\pic\TS.png, 1

Gui, +LastFound +AlwaysOnTop +ToolWindow +OwnDialogs
Gui, Font, S20 W900 underline, Verdana
Gui, Add, Text, x10 y6 c000000 BackgroundTrans, TS
Gui, Add, Text, x0 y0 c000000 BackgroundTrans, TS
Gui, Add, Text, x10 y0 c000000 BackgroundTrans, TS
Gui, Add, Text, x-6 y-6 c000000 BackgroundTrans, TS
Gui, Add, Text, x6 y0 c4c4cff BackgroundTrans, TS
Gui, Show, x1527 y1030 NoActivate, Auto_Phase_Run
Gui, Color, 000001
WinSet, TransColor, 000001
Gui, -Caption