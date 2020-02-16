;===============================================================
vc = 000000
;===============================================================
Gui, Font, S10 CDefault Bold, Verdana
Gui, Add, Text, x10 y15 w50 h30 c%vc%, EX=
Gui, Add, Text, x100 y15 w150 h30 c%vc%, Card name
Gui, Add, Text, x100 y50 w150 h30 c%vc%, The Hoarder
Gui, Add, Text, x100 y80 w150 h30 c%vc%, The Saint's Treasure
Gui, Add, Text, x100 y110 w150 h30 c%vc%, Abandoned Wealth
Gui, Add, Text, x255 y15 w50 h30 c%vc%, Stack
Gui, Add, Text, x255 y50 w50 h30 c%vc%, 12
Gui, Add, Text, x255 y80 w50 h30 c%vc%, 10
Gui, Add, Text, x255 y110 w50 h30 c%vc%, 5
Gui, Add, Text, x305 y15 w40 h30 c%vc%, EX
Gui, Add, Text, x305 y50 w40 h30 c%vc%, 1
Gui, Add, Text, x305 y80 w40 h30 c%vc%, 2
Gui, Add, Text, x305 y110 w40 h30 c%vc%, 3
Gui, Add, Text, x335 y15 w200 h30 c%vc%, Price for 1 card
;===============================================================
Gui, Add, Text, x455 y15 w100 h30 , Profit (in CO)
Gui, Add, Text, x455 y50 w100 h30 vProfit1 , ?
Gui, Add, Text, x455 y80 w100 h30 vProfit2 , ?
Gui, Add, Text, x455 y110 w100 h30 vProfit3 , ?
;===============================================================
gui, add, text, x0 y40 w560 h1 0x7
gui, add, text, x0 y70 w560 h1 0x7
gui, add, text, x0 y100 w560 h1 0x7
gui, add, text, x0 y130 w560 h1 0x7
;
gui, add, text, x95 y0 w1 h130 0x7
gui, add, text, x250 y0 w1 h130 0x7
gui, add, text, x300 y0 w1 h130 0x7
gui, add, text, x330 y0 w1 h130 0x7
gui, add, text, x450 y0 w1 h130 0x7
gui, add, text, x560 y0 w1 h130 0x7
;===============================================================
;поля ввода
Gui, Add, Edit, x45 y10 w40 h1 Number r1 vEx,
Gui, Add, Edit, x335 y42 w40 h25 Number r1 vCard1,
Gui, Add, Edit, x335 y73 w40 h25 Number r1 vCard2,
Gui, Add, Edit, x335 y102 w40 h25 Number r1 vCard3,
;===============================================================
;Кнопки
Gui, Add, Button, x50 y135 w130 h30 , Close
Gui, Add, Button, x380 y135 w130 h30 , Result
;===============================================================
Gui, Color, 666666
Gui, Show, x431 y183 h180 w560, New GUI Window
Return

; GuiClose:
; ExitApp
ButtonResult:
GuiControlGet, Ex
GuiControlGet, Card1
GuiControlGet, Card2
GuiControlGet, Card3
var1 := Ex*1  - 12*Card1
var2 := Ex*2  - 10*Card2
var3 := Ex*3  - 5*Card3
GuiControl,, Profit1, %Var1%
GuiControl,, Profit2, %Var2%
GuiControl,, Profit3, %Var3%
return
ButtonClose:
ExitApp
return
