; Стартовые настройки
#SingleInstance Force
CoordMode, Mouse, Screen
;========================================================================
; Подгрузка библиотек
#include %A_ScriptDir%\res\functions_for_price.ahk
;========================================================================
Menu, Tray, Icon, %A_ScriptDir%\res\pic\s.ico, 1
;========================================================================
; Название предмета из буфера обмена
SendInput, ^{sc2E} ; Копирование в буфер из под курсора
Sleep, 50
Item_Copy := Clipboard
Sleep, 30
MouseGetPos, MposX, MposY
Sleep, 30
Item_Copy_Start_Cut := RegExReplace(Item_Copy, "^.*", "") ; Обрезание первой строки
Sleep, 30
Item_Copy_No_Enter := RegExReplace(Item_Copy_Start_Cut, "`r`n", "") ; Обрезание переноса строк
Sleep, 30
Item_Copy_Full_Cut := RegExReplace(Item_Copy_No_Enter, "-.*$", "") ; Обрезание 3ей строки и далее
Sleep, 30
;========================================================================
; Каренси по дефолту, в зависимости от итема (хаосы или экз, если хаосы продаю)
If Item_Copy_Full_Cut != Chaos Orb  ; Если скопирован не хаос - в дроплисте ставим хаос
{
	Currency_List := "chaos||exalted|alch|fuse|jew|chisel|vaal"
}
else If Item_Copy_Full_Cut = Chaos Orb ; Если скопирован хаос - в дроплисте ставим экзальт
{
	Currency_List := "chaos|exalted||alch|fuse|jew|chisel|vaal"
}
if Item_Copy_Full_Cut = ; Если скопировалась какая-то херня, она превратится в пустое значение после обрезаний
{
	;Item_Copy_Full_Cut := "Item"
	Item_Copy_Full_Cut := "Itemasdafdsfsdfsdfasdasd"
}
Sleep, 30
;========================================================================
; Общие опции Gui
Gui, 1:+LastFound +AlwaysOnTop +OwnDialogs
Gui, 1:Color, 666666, 666666 ; Цвет Gui
; Первая строка элементов Gui (текст, эдитбокс, апдаун, каренси лист и кнопка копи и клоз)
Gui, 1:Font, S18 W700, Verdana
Gui, 1:Add, Text, x10 y15, I want
Gui, 1:Font, S14 W700, Verdana
Gui, 1:Add, Edit, x110 y10 w90 r1 vIwant, 1
Gui, 1:Add, UpDown, Range1-9999, 1
Gui, 1:Add, DropDownList, x220 y10 w90 vCurrency, %Currency_List%
Gui, 1:Add, Button, x330 y10 w155 h30 gCopyandCloseAll Default, Copy && Close
; Вторая строка элементов Gui (текст, эдитбокс, апдаун, название итема на продажу)
Gui, 1:Font, S18 W700, Verdana
Gui, 1:Add, Text, x10 y55, For
Gui, 1:Font, S14 W700, Verdana
Gui, 1:Add, Edit, x110 y50 w90 r1 vIpay, 1
Gui, 1:Add, UpDown, Range1-9999, 1
Gui, 1:Font, S18 W700, Verdana
Gui, 1:Add, Text, x220 y55 w260 h25 r1 c00e500, %Item_Copy_Full_Cut%
; Третья строка элементов Gui (кнопки превью и релоад тултип)
Gui, 1:Add, Text, x10 y95, Ratio:
Gui, 1:Font, S14 W700, Verdana
Gui, 1:Add, Edit, x95 y90 w135 r1 vRatio, 
Gui, 1:Add, UpDown, Range0-999999999, 1
Gui, 1:Add, Button, x255 y90 w115 h30 gCalc_use_ratio, Use Ratio
Gui, 1:Add, Button, x390 y90 w95 h30 gCalc_not_use_ratio, Not Use
; Четвертая и пятая строки элементов Gui, значения при рэтио с сайта
Gui, 1:Add, GroupBox, x10 y130 w480 h95 c00e500 Section, Use site Ratio: All ratio and sum
Gui, 1:Add, Text, xs+10 ys+30 vChaos_label_in_site_ratio, chaos
Gui, 1:Add, Text, xs+240 ys+30 vChaos_ratio_in_site_ratio, Ratio.....
Gui, 1:Add, Text, xs+390 ys+30 vChaos_count_in_site_ratio, Sum..
Gui, 1:Add, Text, xs+10 ys+65 w220 h25, %Item_Copy_Full_Cut%
Gui, 1:Add, Text, xs+240 ys+65 vCurrency_ratio_in_site_ratio, Ratio.....
Gui, 1:Add, Text, xs+390 ys+65 vCurrency_count_in_site_ratio, Sum..
; Шестая и седьмая строки элементов Gui, значения при моем рэтио
Gui, 1:Add, GroupBox, x10 y230 w480 h95 c00e500 Section, Use my Ratio: All ratio and sum
Gui, 1:Add, Text, xs+10 ys+30 vCurrency_label_in_my_ratio, chaos
Gui, 1:Add, Text, xs+240 ys+30 vChaos_ratio_in_my_ratio, Ratio.....
Gui, 1:Add, Text, xs+390 ys+30 vChaos_count_in_my_ratio, Sum..
Gui, 1:Add, Text, xs+10 ys+65 w220 h25, %Item_Copy_Full_Cut%
Gui, 1:Add, Text, xs+240 ys+65 vCurrency_ratio_in_my_ratio, Ratio.....
Gui, 1:Add, Text, xs+390 ys+65 vCurrency_count_in_my_ratio, Sum..
Gui, 1:Font, S22 W700, Verdana
Gui, 1:Add, Text, xs+340 ys+55 gMoveratio, ▲
; Восьмая строка элементов Guiб расчет десятых экзальта
; Gui, 1:Font, S18 W700, Verdana
; Gui, 1:Add, Text, x10 y340, Ex=
; Gui, 1:Font, S14 W700, Verdana
; Gui, 1:Add, Edit, x65 y335 w80 r1 vFullex, 
; Gui, 1:Add, UpDown, Range1-999, 150
; Gui, 1:Font, S18 W700, Verdana
; Gui, 1:Add, Text, x180 y340, 0,      =
; Gui, 1:Font, S14 W700, Verdana
; Gui, 1:Add, DropDownList, x210 y335 w40 vExPart, 1|2||3|4|5|6|7|8|9
; Gui, 1:Font, S18 W700, Verdana
; Gui, 1:Add, Text, x280 y340 gExpart vPartresult, 0....
; Отображение Gui
Gui, 1:Show, x700 y270 w500, Price
Return
;========================================================================--------------------------------------------------------------
; Дебаг, потом убрать
;F8::
;MsgBox,,, 1
;Return
;========================================================================
; Произвести расчеты на основе рэтио с сайта
Calc_use_ratio:
GuiControlGet, Ipay
GuiControlGet, Ratio
GuiControlGet, Currency
Sleep, 20
GuiControl,, Iwant, % CalcIvant0(Ipay, Ratio)
GuiControl,, Chaos_label_in_site_ratio, %Currency%
GuiControl,, Chaos_ratio_in_site_ratio, % CalcChaosRatio_use_ratio(ratio)
GuiControl,, Chaos_count_in_site_ratio, % CalcIvant2(Ipay, Ratio)
GuiControl,, Currency_ratio_in_site_ratio, %Ratio%
GuiControl,, Currency_count_in_site_ratio, %Ipay%
return
;========================================================================
; Произвести расчеты самому
Calc_not_use_ratio:
GuiControlGet, Ipay
GuiControlGet, Iwant
GuiControlGet, Currency
Sleep, 20
GuiControl,, Chaos_label_in_my_ratio, %Currency%
GuiControl,, Chaos_ratio_in_my_ratio, % CalcChaosRatio_not_use_ratio(Ipay, Iwant)
GuiControl,, Chaos_count_in_my_ratio, %Iwant%
GuiControl,, Currency_ratio_in_my_ratio, % CalcCurrencyRatio_not_use_ratio(Ipay, Iwant)
GuiControl,, Currency_count_in_my_ratio, %Ipay%
Return
;========================================================================
; Вбивает мое рэтио в поле для рэтио сайта
Moveratio:
GuiControlGet, Currency_ratio_in_my_ratio
Sleep, 20
GuiControl,, Ratio, %Currency_ratio_in_my_ratio%
Return
;========================================================================
; Скопировать прайс в буфер и закрыть скрипт
CopyandCloseAll:
GuiControlGet, Ipay
GuiControlGet, Iwant
GuiControlGet, Currency
Sleep, 20
vCopyPrice := PriceText(Iwant, Ipay, Currency)
Sleep, 30
Clipboard := vCopyPrice
Sleep, 30
exitapp
return
;========================================================================
; Расчет десятых долей Экзальта
; Expart:
; GuiControlGet, Fullex
; GuiControlGet, ExPart
; Sleep, 20
; GuiControl,, Partresult, % ExaltPart(Fullex, ExPart)
; return
;========================================================================
; Порабощает скролл, если скрипт запущен. При редактировании кода комментить.
WheelDown::
VWinname := 1
SendInput, {sc150}
return
WheelUp::
VWinname := 1
SendInput, {sc148}
return
;========================================================================
GuiClose:
ExitApp
return
;=============================================
