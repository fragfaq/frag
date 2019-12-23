Gui, +LastFound +AlwaysOnTop +ToolWindow +OwnDialogs
;1 фласка
Gui, Font, s30 Bold, Tahoma
Gui, Add, Text, x4 y64 w50 h50 c0415BE +BackgroundTrans, 1
Gui, Add, Text, x0 y60 w50 h50 cffffff +BackgroundTrans, 1
;2 фласка
Gui, Font, s30 Bold, Tahoma
Gui, Add, Text, x48 y63 w50 h50 c0415BE BackgroundTrans, 2
Gui, Add, Text, x45 y60 w50 h50 cffffff BackgroundTrans, 2
;3 фласка
Gui, Font, S30 Bold, Tahoma
Gui, Add, Text, x98 y63 w50 h50 cffffff BackgroundTrans, 3
Gui, Add, Text, x95 y60 w50 h50 c00ff00 BackgroundTrans, 3

;4 фласка
Gui, Font, S30 Bold, Tahoma
;Gui, Add, Text, x143 y63 w240 h50 cffffff BackgroundTrans, 4
;Gui, Add, Text, x140 y60 w240 h50 c00ff00 BackgroundTrans, 4
Gui, Add, Text, x143 y63 w240 h50 cffffff BackgroundTrans, 4
Gui, Add, Text, x140 y60 w240 h50 c00ff00 BackgroundTrans, 4
;5 фласка
Gui, Font, S30 Bold, Tahoma
Gui, Add, Text, x193 y63 w240 h50 cffffff BackgroundTrans, 5
Gui, Add, Text, x190 y60 w240 h50 c00ff00 BackgroundTrans, 5
;тайтл
Gui, Font, S30 Bold, Tahoma
Gui, Add, Text, x93 y3 w240 h50 cffffff BackgroundTrans, Damag
Gui, Add, Text, x90 y0 w240 h50 cff0000 BackgroundTrans, Damag
;окно и прозрачность
Gui, Show, x310 y930 h140 w250, New GUI Window
Gui, Color, 000001
WinSet, TransColor, 000001
Return

GuiClose:
ExitApp

;==============================================
;перезапуск скрипта на Control+r
^sc13::
Reload
return
;=============================================