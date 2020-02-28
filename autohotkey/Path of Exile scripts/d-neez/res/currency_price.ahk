; Стартовые настройки: 
#SingleInstance Ignore ; Вместо перезапуска скрипта будет выводиться текущий
CoordMode, Mouse, Screen ; Координаты считаются по экрану.
;========================================================================
; Подгрузка библиотек:
#include %A_ScriptDir%\price_functions.ahk
;========================================================================
; Иконка
Menu, Tray, Icon, %A_ScriptDir%\CO.png, 1
;========================================================================
; ======================================================== начало Gui
; Общие опции Gui
Gui, +LastFound +OwnDialogs
Gui, Color, 666666, 666666 ; Цвет Gui
Gui, Font, S18 W700, Verdana
; ======================================================== Первый групбокс
Gui, Add, GroupBox, xm ym Section w500 h160 cffffff, Fus
; Первая строка элементов Gui
Gui, Add, Text, xs+15 ys+30, I want:
Gui, Font, S14 W700, Verdana
Gui, Add, Edit, xs+120 ys+30 w90 r1 vIwantforfus, 1
Gui, Add, UpDown, Range1-9999, 1
Gui, Font, S18 W700, Verdana
Gui, Add, Text, xs+270 ys+30, Ratio:
Gui, Font, S14 W700, Verdana
Gui, Add, Edit, xs+360 ys+30 w120 r1 vRatiofus, 1
Gui, Add, UpDown, Range1-9999, 1
; Вторая строка элементов Gui
Gui, Font, S18 W700, Verdana
Gui, Add, Text, xs+15 ys+80, I pay:
Gui, Font, S14 W700, Verdana
Gui, Add, Edit, xs+120 ys+80 w90 r1 vIpayfus, 1
Gui, Add, UpDown, Range1-9999, 1
Gui, Add, Button, xs+270 ys+80 w70 h30 gCalcfus, Calc
Gui, Add, Button, xs+410 ys+80 w70 h30 gCopyfus, Copy
; Третья строка элементов Gui
Gui, Font, S18 W700, Verdana
Gui, Add, Text, xs+15 ys+120, Chaos ratio:
Gui, Add, Text, xs+200 ys+120 vChaosRatioforfus, 0.0000
; ======================================================== Второй групбокс
Gui, Add, GroupBox, xm+520 ym Section w500 h160 c000000, Jewel
; Первая строка элементов Gui
Gui, Add, Text, xs+15 ys+30, I want:
Gui, Font, S14 W700, Verdana
Gui, Add, Edit, xs+120 ys+30 w90 r1 vIwantforjew, 1
Gui, Add, UpDown, Range1-9999, 1
Gui, Font, S18 W700, Verdana
Gui, Add, Text, xs+270 ys+30, Ratio:
Gui, Font, S14 W700, Verdana
Gui, Add, Edit, xs+360 ys+30 w120 r1 vRatiojew, 1
Gui, Add, UpDown, Range1-9999, 1
; Вторая строка элементов Gui
Gui, Font, S18 W700, Verdana
Gui, Add, Text, xs+15 ys+80, I pay:
Gui, Font, S14 W700, Verdana
Gui, Add, Edit, xs+120 ys+80 w90 r1 vIpayjew, 1
Gui, Add, UpDown, Range1-9999, 1
Gui, Add, Button, xs+270 ys+80 w70 h30 gCalcjew, Calc
Gui, Add, Button, xs+410 ys+80 w70 h30 gCopyjew, Copy
; Третья строка элементов Gui
Gui, Font, S18 W700, Verdana
Gui, Add, Text, xs+15 ys+120, Chaos ratio:
Gui, Add, Text, xs+200 ys+120 vChaosRatioforjew, 0.0000
; ======================================================== Третий групбокс
Gui, Add, GroupBox, xm ym+180 Section w500 h160 c0000ff, Alt
; Первая строка элементов Gui
Gui, Add, Text, xs+15 ys+30, I want:
Gui, Font, S14 W700, Verdana
Gui, Add, Edit, xs+120 ys+30 w90 r1 vIwantforalt, 1
Gui, Add, UpDown, Range1-9999, 1
Gui, Font, S18 W700, Verdana
Gui, Add, Text, xs+270 ys+30, Ratio:
Gui, Font, S14 W700, Verdana
Gui, Add, Edit, xs+360 ys+30 w120 r1 vRatioalt, 1
Gui, Add, UpDown, Range1-9999, 1
; Вторая строка элементов Gui
Gui, Font, S18 W700, Verdana
Gui, Add, Text, xs+15 ys+80, I pay:
Gui, Font, S14 W700, Verdana
Gui, Add, Edit, xs+120 ys+80 w90 r1 vIpayalt, 1
Gui, Add, UpDown, Range1-9999, 1
Gui, Add, Button, xs+270 ys+80 w70 h30 gCalcalt, Calc
Gui, Add, Button, xs+410 ys+80 w70 h30 gCopyalt, Copy
; Третья строка элементов Gui
Gui, Font, S18 W700, Verdana
Gui, Add, Text, xs+15 ys+120, Chaos ratio:
Gui, Add, Text, xs+200 ys+120 vChaosRatioforalt, 0.0000

; ======================================================== Четвертый групбокс
Gui, Add, GroupBox, xm+520 ym+180 Section w500 h160 ce3bb1c, Alch
; Первая строка элементов Gui
Gui, Add, Text, xs+15 ys+30, I want:
Gui, Font, S14 W700, Verdana
Gui, Add, Edit, xs+120 ys+30 w90 r1 vIwantforalch, 1
Gui, Add, UpDown, Range1-9999, 1
Gui, Font, S18 W700, Verdana
Gui, Add, Text, xs+270 ys+30, Ratio:
Gui, Font, S14 W700, Verdana
Gui, Add, Edit, xs+360 ys+30 w120 r1 vRatioalch, 1
Gui, Add, UpDown, Range1-9999, 1
; Вторая строка элементов Gui
Gui, Font, S18 W700, Verdana
Gui, Add, Text, xs+15 ys+80, I pay:
Gui, Font, S14 W700, Verdana
Gui, Add, Edit, xs+120 ys+80 w90 r1 vIpayalch, 1
Gui, Add, UpDown, Range1-9999, 1
Gui, Add, Button, xs+270 ys+80 w70 h30 gCalcalch, Calc
Gui, Add, Button, xs+410 ys+80 w70 h30 gCopyalch, Copy
; Третья строка элементов Gui
Gui, Font, S18 W700, Verdana
Gui, Add, Text, xs+15 ys+120, Chaos ratio:
Gui, Add, Text, xs+200 ys+120 vChaosRatioforalch, 0.0000

; ======================================================== Пятый групбокс
Gui, Add, GroupBox, xm ym+360 Section w500 h160 cff7f00, Chaos
; Первая строка элементов Gui
Gui, Add, Text, xs+15 ys+30, I want:
Gui, Font, S14 W700, Verdana
Gui, Add, Edit, xs+120 ys+30 w90 r1 vIwantforco, 1
Gui, Add, UpDown, Range1-9999, 1
Gui, Font, S18 W700, Verdana
Gui, Add, Text, xs+270 ys+30, Ratio:
Gui, Font, S14 W700, Verdana
Gui, Add, Edit, xs+360 ys+30 w120 r1 vRatioco, 1
Gui, Add, UpDown, Range1-9999, 1
; Вторая строка элементов Gui
Gui, Font, S18 W700, Verdana
Gui, Add, Text, xs+15 ys+80, I pay:
Gui, Font, S14 W700, Verdana
Gui, Add, Edit, xs+120 ys+80 w90 r1 vIpayco, 1
Gui, Add, UpDown, Range1-9999, 1
Gui, Add, Button, xs+270 ys+80 w70 h30 gCalcco, Calc
Gui, Add, Button, xs+410 ys+80 w70 h30 gCopyco, Copy
; Третья строка элементов Gui
Gui, Font, S18 W700, Verdana
Gui, Add, Text, xs+15 ys+120, Chaos ratio:
Gui, Add, Text, xs+200 ys+120 vExRatioforco, 0.0000

; ======================================================== Шестой групбокс
Gui, Add, GroupBox, xm+520 ym+360 Section w500 h160 cff0000, Exalt
; Первая строка элементов Gui
Gui, Add, Text, xs+15 ys+30, I want:
Gui, Font, S14 W700, Verdana
Gui, Add, Edit, xs+120 ys+30 w90 r1 vIwantforex, 1
Gui, Add, UpDown, Range1-9999, 1
Gui, Font, S18 W700, Verdana
Gui, Add, Text, xs+270 ys+30, Ratio:
Gui, Font, S14 W700, Verdana
Gui, Add, Edit, xs+360 ys+30 w120 r1 vRatioex, 1
Gui, Add, UpDown, Range1-9999, 1
; Вторая строка элементов Gui
Gui, Font, S18 W700, Verdana
Gui, Add, Text, xs+15 ys+80, I pay:
Gui, Font, S14 W700, Verdana
Gui, Add, Edit, xs+120 ys+80 w90 r1 vIpayex, 1
Gui, Add, UpDown, Range1-9999, 1
Gui, Add, Button, xs+270 ys+80 w70 h30 gCalcex, Calc
Gui, Add, Button, xs+410 ys+80 w70 h30 gCopyex, Copy
; Третья строка элементов Gui
Gui, Font, S18 W700, Verdana
Gui, Add, Text, xs+15 ys+120, Exalt ratio:
Gui, Add, Text, xs+200 ys+120 vChaosRatioforex, 0.0000
; ======================================================== отображение Gui
Gui, Show
return
; ======================================================== конец Gui
; ######################################################################
; ##########                    Кнопки Gui                    ##########
; ######################################################################
; Расчет фузов
Calcfus:
GuiControlGet, Ipayfus
GuiControlGet, Ratiofus
Sleep, 20
GuiControl,, Iwantforfus, % CalcIvant(Ipayfus, Ratiofus)
GuiControl,, ChaosRatioforfus, % CalcChaosRatio(Ratiofus)
return
; Текст прайса фузов
Copyfus:
GuiControlGet, Iwantforfus
GuiControlGet, Ipayfus
Sleep, 20
vPriceforfus := PriceText(IwantforFus, Ipayfus, "chaos")
Sleep, 30
Clipboard := vPriceforfus
return
; ========================================================
; Расчет жевелов
Calcjew:
GuiControlGet, Ipayjew
GuiControlGet, Ratiojew
Sleep, 20
GuiControl,, Iwantforjew, % CalcIvant(Ipayjew, Ratiojew)
GuiControl,, ChaosRatioforjew, % CalcChaosRatio(Ratiojew)
return
; Текст прайса жевелов
Copyjew:
GuiControlGet, Iwantforjew
GuiControlGet, Ipayjew
Sleep, 20
vPriceforjew := PriceText(Iwantforjew, Ipayjew, "chaos")
Sleep, 30
Clipboard := vPriceforjew
return
; ========================================================
; Расчет альтов
Calcalt:
GuiControlGet, Ipayalt
GuiControlGet, Ratioalt
Sleep, 20
GuiControl,, Iwantforalt, % CalcIvant(Ipayalt, Ratioalt)
GuiControl,, ChaosRatioforalt, % CalcChaosRatio(Ratioalt)
return
; Текст прайса альтов
Copyalt:
GuiControlGet, Iwantforalt
GuiControlGet, Ipayalt
Sleep, 20
vPriceforalt := PriceText(Iwantforalt, Ipayalt, "chaos")
Sleep, 30
Clipboard := vPriceforalt
return
; ========================================================
; Расчет алхимок
Calcalch:
GuiControlGet, Ipayalch
GuiControlGet, Ratioalch
Sleep, 20
GuiControl,, Iwantforalch, % CalcIvant(Ipayalch, Ratioalch)
GuiControl,, ChaosRatioforalch, % CalcChaosRatio(Ratioalch)
return
; Текст прайса алхимок
Copyalch:
GuiControlGet, Iwantforalch
GuiControlGet, Ipayalch
Sleep, 20
vPriceforalch := PriceText(Iwantforalch, Ipayalch, "chaos")
Sleep, 30
Clipboard := vPriceforalch
return
; ========================================================
; Расчет хаосов
Calcco:
GuiControlGet, Ipayco
GuiControlGet, Ratioco
Sleep, 20
GuiControl,, Iwantforco, % CalcIvant(Ipayco, Ratioco)
GuiControl,, ExRatioforco, % CalcChaosRatio(Ratioco)
return
; Текст прайса хаосов
Copyco:
GuiControlGet, Iwantforco
GuiControlGet, Ipayco
Sleep, 20
vPriceforco := PriceText(Iwantforco, Ipayco, "exa")
Sleep, 30
Clipboard := vPriceforco
return
; ========================================================
; Расчет экзальтов
Calcex:
GuiControlGet, Ipayex
GuiControlGet, Ratioex
Sleep, 20
GuiControl,, Iwantforex, % CalcIvant(Ipayex, Ratioex)
GuiControl,, ChaosRatioforex, % CalcChaosRatio(Ratioex)
return
; Текст прайса экзальтов
Copyex:
GuiControlGet, Iwantforex
GuiControlGet, Ipayex
Sleep, 20
vPriceforex := PriceText(Iwantforex, Ipayex, "chaos")
Sleep, 30
Clipboard := vPriceforex
return
; ========================================================
; Выход на крестик
GuiClose:
ExitApp
return
; ========================================================