; Стартовые настройки
#SingleInstance Force
CoordMode, Mouse, Screen
;========================================================================
; Подгрузка библиотек
#include %A_ScriptDir%\res\ToolTipFont.ahk	; Либа для тултипа ratio
#include %A_ScriptDir%\res\AddTooltip.ahk	; Либа для текстовых элементов и т.п.
#include %A_ScriptDir%\res\Lib1.ahk		; Либы для цветных тултипов
#include %A_ScriptDir%\res\Lib2.ahk		
;========================================================================
Menu, Tray, Icon, %A_ScriptDir%\res\pic\s.ico, 1
;========================================================================
; Продлевает время тултипов на тексте
AddToolTip("AutoPopDelay", 55)
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
	Currency_List := "chaos||exa|alch|fuse|jew|chisel|vaal"
}
else If Item_Copy_Full_Cut = Chaos Orb ; Если скопирован хаос - в дроплисте ставим экзальт
{
	Currency_List := "chaos|exa||alch|fuse|jew|chisel|vaal"
}
if Item_Copy_Full_Cut = "" ; Если скопировалась какая-то херня, она превратится в пустое значение после обрезаний
	Sleep, 30
;========================================================================
; Общие опции Gui
Gui, 1:+LastFound +AlwaysOnTop +OwnDialogs
Gui, 1:Color, 666666, 666666 ; Цвет Gui
; Первая строка элементов Gui (текст, эдитбокс, апдаун, каренси лист и кнопка копи и клоз)
Gui, 1:Font, S18 W700, Verdana
Gui, 1:Add, Text, x10 y15, I want
Gui, 1:Font, S14 W700, Verdana
Gui, 1:Add, Edit, x110 y10 w90 r1 vWHAT_I_GET, 1
Gui, 1:Add, UpDown, Range1-9999, 1
Gui, 1:Add, DropDownList, vCurrency x220 y10 w90, %Currency_List%
Gui, 1:Add, Button, x330 y10 w155 h30 vCopyandClose gCopyandCloseAll Default, Copy && Close
; Вторая строка элементов Gui (текст, эдитбокс, апдаун, название итема на продажу)
Gui, 1:Font, S18 W700, Verdana
Gui, 1:Add, Text, x10 y55, For
Gui, 1:Font, S14 W700, Verdana
Gui, 1:Add, Edit, x110 y50 w90 r1 vWHAT_I_HAVE_TO_PAY, 1
Gui, 1:Add, UpDown, Range1-9999, 1
Gui, 1:Font, S14 W700, Verdana
Gui, 1:Add, Text, x220 y60 w320 r1 c00e500 hWndhText gNull1, %Item_Copy_Full_Cut%
Tip=
   (ltrim
    Currency, которую я продаю. Если тут пусто - значит криво копирнулось.
    )
AddTooltip(hText,Tip)
; Разделитель черный
Gui, 1:Add, Progress, x-5 y89 w510 h4 Background000000
; Третья строка элементов Gui (кнопки превью и релоад тултип)
Gui, 1:Add, Button, x20 y102 w260 h25 gSetprice, Previev
Gui, 1:Add, Button, x330 y102 w155 h25 gReloadTooltip, ReloadTooltip
; Разделитель черный
Gui, 1:Add, Progress, x-5 y136 w510 h4 Background000000
; четвертая полоса элементов Gui для расчетов по ratio
Gui, 1:Font, S18 W700, Verdana
Gui, 1:Add, Text, x10 y155 hWndhText gNull2, Sell ratio
Gui, 1:Font, S14 W700, Verdana
Gui, 1:Add, Edit, x140 y150 w120 r1 vRatio, 0
Gui, 1:Add, UpDown, Range0-9999, 0
Gui, 1:Add, Button, x330 y150 w155 h30 vRatioReset gRatioReset, Reset Ratio
Gui, 1:Font, S14 W700, Verdana
Tip=
   (ltrim
    Ratio продаваемой currency на трэйде.
    )
AddTooltip(hText,Tip)
; Сетка из желтых разделителей
Gui, 1:Add, Progress, x-5 y199 w510 h4 BackgroundE0EE01
Gui, 1:Add, Progress, x-5 y235 w510 h4 BackgroundE0EE01
Gui, 1:Add, Progress, x496 y202 w19 h76 Vertical BackgroundE0EE01
Gui, 1:Add, Progress, x160 y202 w4 h76 Vertical BackgroundE0EE01
Gui, 1:Add, Progress, x330 y202 w4 h76 Vertical BackgroundE0EE01
Gui, 1:Add, Progress, x-5 y202 w9 h76 Vertical BackgroundE0EE01
; Пятая мини полоса, верхняя часть таблички, currency, которую получу
Gui, 1:Add, Text, x10 y208 w145 vCurrencyIGet hWndhText gNull3,
Tip=
   (ltrim
    Какую валюту получу (скорей всего Хаосы).
    )
AddTooltip(hText,Tip)
Gui, 1:Add, Text, x170 y208 w90 hWndhText gNull4 vRatioIGet,
Tip=
   (ltrim
    По какому ratio мне заплатят.
    )
AddTooltip(hText,Tip)
Gui, 1:Add, Text, x350 y208 w90 hWndhText gNull5 vCountIGet,
Tip=
   (ltrim
    Сколько получу, в штуках.
    )
AddTooltip(hText,Tip)
; Шестая мини полоса, нижняя  часть таблички, currency, которую продам
Gui, 1:Add, Text, x10 y247 w145 hWndhText gNull6 vCurrencyISell,
Tip=
   (ltrim
    Какую валюту продаю.
    )
AddTooltip(hText,Tip)
Gui, 1:Add, Text, x170 y247 w90 hWndhText gNull7 vRatioISell,
Tip=
   (ltrim
    Ee ratio, взятое с трэйда.
    )
AddTooltip(hText,Tip)
Gui, 1:Add, Text, x350 y247 w90 hWndhText gNull8 vCountISell,
Tip=
   (ltrim
    Сколько currency продаю, в штуках.
    )
AddTooltip(hText,Tip)
; Разделитель и текстовые кнопки для фикс прайсов
Gui, 1:Add, Progress, x-5 y275 w510 h4 BackgroundE0EE01
Gui, 1:Font, S14 W700 c000000, Verdana
Gui, 1:Add, GroupBox, x10 y280 w478 h115 c00e500, Готовые кликабельные прайсы
Gui, 1:Add, Text, x20 y310 g1_5 hWndhText, 1.5 (2шт за 3орба)
Tip=
   (ltrim
    ~price 3/2 chaos, 1,5с за штуку.
    )
AddTooltip(hText,Tip)
Gui, 1:Add, Text, x260 y310 g2_5 hWndhText, 2.5 (2шт за 5орба)
Tip=
   (ltrim
    ~price 5/2 chaos, 2,5с за штуку.
    )
AddTooltip(hText,Tip)
Gui, 1:Add, Text, x20 y355 g3_5 hWndhText, 3.5 (2шт за 7орба)
Tip=
   (ltrim
    ~price 7/2 chaos, 3,5с за штуку.
    )
AddTooltip(hText,Tip)
Gui, 1:Add, Text, x260 y355 g4_5 hWndhText, 4.5 (2шт за 9орбов)
Tip=
   (ltrim
    ~price 9/2 chaos, 4,5с за штуку.
    )
AddTooltip(hText,Tip)
;Gui, 1:Show, x%MposX% y%MposY% w500, Price
Gui, 1:Show, x700 y270 w500, Price
;========================================================================
; Сразу отправляем в табличку что проадем и что хотим
GuiControlGet, Currency
GuiControl,, CurrencyIGet, %Currency%
GuiControl,, CurrencyISell, %Item_Copy_Full_Cut%
;========================================================================
; Настройки больших цветных тултипов Gui
; Настройки цвета и шрифта
options := { ShowNow: false
           , FontName: "Verdana"
           , FontSize: 16
           , FontStyle: bold
           , TextColor: "White"
           , BackColor: "Black" }
;====================
; Описание тултипов
options.text := "Сколько валюты я получу", edit1 := new ToolTip(options)
options.text := "Тип валюты", list1 := new ToolTip(options)
options.text := "Копировать прайс и закрыть скрипт", button1 := new ToolTip(options)
options.text := "Сколько валюты я продам", edit2 := new ToolTip(options)
options.text := "Перезагрузить тултип с ratio", button3 := new ToolTip(options)
options.text := "Сколько Хаосов дают за одну currency`nИли сколько Хаосов за Экз.`nЭто цифра из второй строчки рэйтов!", edit3 := new ToolTip(options)
options.text := "Сбросить значение ratio, что бы оно не считалось", button4 := new ToolTip(options)
;====================
; Привязка тултипов к контролам
ShowToolTip({controls: { WHAT_I_GET: edit1, Currency: list1, CopyandClose: button1, WHAT_I_HAVE_TO_PAY: edit2, ReloadTooltip: button3, Ratio: edit3, RatioReset: button4 }, delay: 10, duration: 20000})
Return
;========================================================================----------------------------------------------------------------
; Дебаг, потом убрать
F8::
MsgBox,,, Currency_List = %Currency_List%`n===`nCurrency = %Currency%`n===`nCurrencyShow = %CurrencyShow%`n===`nCurrencyISell = %CurrencyISell%`n===`nItem_Copy_Full_Cut = %Item_Copy_Full_Cut%`n===`n`n===`n`n===`n
Return
;========================================================================
; Функционал подгона ratio:
; Превью ratio
Setprice:
GuiControlGet, WHAT_I_HAVE_TO_PAY
GuiControlGet, Currency
GuiControlGet, WHAT_I_GET
GuiControlGet, Ratio
GuiControl,, CurrencyIGet, %Currency%
ToolTipFont("s14", "Verdana")
ToolTipColor("Black", "White")
VPrice := "~price "
Sleep, 20
If Ratio = 0
{
	VPrice .= WHAT_I_GET "/" WHAT_I_HAVE_TO_PAY " " Currency
	Sleep, 30
	ratio1 := (Round(WHAT_I_GET / WHAT_I_HAVE_TO_PAY, 4))
	ratio2 := (Round(WHAT_I_HAVE_TO_PAY / WHAT_I_GET, 4))
	ratio_my := ratio1
	Vtool = "%VPrice%"`n`n	[ %Item_Copy_Full_Cut% ] %ratio2% : 1 [ %Currency% ]`n	[ %Item_Copy_Full_Cut% ] 1 : %ratio1% [ %Currency% ]
}
else if Ratio > 0
{
	Ratio := RegExReplace(Ratio, ",", ".")
	ratio1 := Ratio
	ratio2 := (Round(1 / Ratio, 4))
	WHAT_I_GET := (Round(Ratio * WHAT_I_HAVE_TO_PAY, 0))
	Sleep, 30
	GuiControl,, WHAT_I_GET, %WHAT_I_GET%
	Sleep, 30
	ratio_my := (Round(WHAT_I_GET / WHAT_I_HAVE_TO_PAY, 4))
	Sleep, 30
	VPrice .= WHAT_I_GET "/" WHAT_I_HAVE_TO_PAY " " Currency
	Sleep, 30
	Vtool = "%VPrice%"`n`n	[ %Item_Copy_Full_Cut% ] %ratio2% : 1 [ %Currency% ]`n	[ %Item_Copy_Full_Cut% ] 1 : %ratio1% [ %Currency% ]
}

Tooltip, %Vtool%
MouseGetPos, VXPosB, VYPosB, VWinname
SetTimer, Refresh, 250
Refresh:
MouseGetPos, VXPos1, VYPos1, VWinname1
Sleep, 200
if VWinname != %VWinname1%
{
	Tooltip
	SetTimer, Refresh, Off
}
Sleep, 30
GuiControl,, CurrencyIGet, %Currency%
GuiControl,, RatioIGet, %ratio2%
GuiControl,, CountIGet, %WHAT_I_GET%
GuiControl,, RatioISell, %ratio_my%
GuiControl,, CountISell, %WHAT_I_HAVE_TO_PAY%
GuiControl,, CurrencyISell, %Item_Copy_Full_Cut%
return
;====================
; Скопировать прайс в буфер и закрыть скрипт
CopyandCloseAll:
GuiControlGet, WHAT_I_HAVE_TO_PAY
GuiControlGet, Currency
GuiControlGet, WHAT_I_GET
ToolTipFont("s14", "Verdana")
ToolTipColor("Black", "White")
VPrice := "~price "
Sleep, 20
if WHAT_I_HAVE_TO_PAY = 1
{
	VPrice .= WHAT_I_GET " " Currency
}
else if WHAT_I_HAVE_TO_PAY <> 1
{
	VPrice .= WHAT_I_GET "/" WHAT_I_HAVE_TO_PAY " " Currency
}
Sleep, 30
Clipboard := VPrice
exitapp
return
;====================
; Сбросить тултип с ratio. Табличку пока не обновляет.
ReloadTooltip:
Tooltip
VWinname1 := ""

return
;====================
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
RatioReset:
Ratio := 0
Sleep, 40
GuiControl,, Ratio, %Ratio%
Return
;========================================================================
; Функционал кнопок для фикс прайсов
1_5: ; 1.5со (~b/o 3/2 chaos)
GuiControlGet, Currency
Sleep, 20
VPrice1 := "~price "
Sleep, 20
VPrice1 .= "3/2" " " Currency
Sleep, 20
Clipboard := VPrice1
Sleep, 20
return
;============
2_5: ; 2.5со (~b/o 5/2 chaos)
GuiControlGet, Currency
Sleep, 20
VPrice1 := "~price "
Sleep, 20
VPrice1 .= "5/2" " " Currency
Sleep, 20
Clipboard := VPrice1
Sleep, 20
return
;============
3_5: ; 3.5со (~b/o 7/2 chaos)
GuiControlGet, Currency
Sleep, 20
VPrice1 := "~price "
Sleep, 20
VPrice1 .= "7/2" " " Currency
Sleep, 20
Clipboard := VPrice1
Sleep, 20
return
;============
4_5: ; 4.5со (~b/o 9/2 chaos)
GuiControlGet, Currency
Sleep, 20
VPrice1 := "~price "
Sleep, 20
VPrice1 .= "9/2" " " Currency
Sleep, 20
Clipboard := VPrice1
Sleep, 20
return
;=============================================
GuiClose:
ExitApp
return
;=============================================
; Нужно для либы, которая показывает тултипы текста
Null1:
Return
Null2:
Return
Null3:
Return
Null4:
Return
Null5:
Return
Null6:
Return
Null7:
Return
Null8:
Return
Null:
Return
;=============================================