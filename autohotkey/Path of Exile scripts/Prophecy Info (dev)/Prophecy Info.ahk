#NoEnv
#Include %A_ScriptDir%\res\Class_CtlColors.ahk ; Подгрузка либы для покраски элементов
#Include %A_ScriptDir%\res\AniGIF.ahk ; Подгрузка либы для гифки
;----------------------------------------------------------------------------------------------------
Green1 := "004c00"
Green2 := "007a00"
TabName = _____List_____
Prophecy_name := -----------------------------------
;-------------------------------------------------------------------------------------------------
Menu, Tray, Icon, %A_ScriptDir%\res\Prophecy_icon.png, 1 ; иконка трэя
AnimPicFile := A_ScriptDir "\res\Gif-1.gif" ; путь к гифке
AGif := AddAnimatedGIF(AnimPicFile, 255, 10, 669, 349) ; расположение гифки
GuiControl, Hide, %AGif%
; =====
; начало Gui
Gui, 1:Color, 000000 ; Цвет Gui
Gui, 1:Font, s12 w500 cffffff, Verdana ; Настройки шрифта
Gui, 1:Font, s14 w500, Verdana ; Настройки шрифта
Gui, 1:Add, Tab3, x10 y0 w935 vTabName gTabChange Buttons +Bottom, %A_Space%%A_Space%%A_Space%%A_Space% List %A_Space%%A_Space%%A_Space%%A_Space% || %A_Space%%A_Space%%A_Space%%A_Space% Info %A_Space%%A_Space%%A_Space%%A_Space% |
; начало первой вкладки
Gui, 1:Tab, 1
Gui, 1:Font, s11 w700, Verdana  ; Настройки шрифта
; =====
; Комбобокс
; Gui, 1:Font, s10 w500 c007a00, Verdana ; Настройки шрифта
Gui, 1:Add, ComboBox, x15 y10 w240 r18 hwndCBBID1 gInfo vProphecy_name Simple Choose1, List ; Список Prophecy в комбобоксе. hwndCBBID1 - функция для покраски комбобокса из либы Class_CtlColors.ahk
CtlColors.Attach(CBBID1, "007a00", "000000")
; =====
; Эдитбокс
Gui, 1:Font, s12 w700 c000000, Verdana
Gui, 1:Add, Edit, x255 y10 w665 h347 hwndEDID1 vProphecy_info ReadOnly, Choose Prophecy ; Локации для выполнения в не редактируемом эдитбоксе
Gui, 1:Color, 000000
Gui, 1:Font, s32 w700 c000000, Verdana
Gui, 1:Add, Edit, x840 y293 +Right hwndEDID2 vProphecy_Seal ReadOnly, 0 ; Prophecy_Seal в не редактируемом эдитбоксе
;-----------------------------------------------
; начало второй вкладки
Gui, 1:Tab, 2
Gui, 1:Color, 1b1b1b
Gui, 1:Font, s11 w700 cff0000, Verdana
Gui, 1:Add, Text, x20 y10, Краткое FAQ
Gui, 1:Add, Text, x20 y70, Как редактировать список Prophecy
Gui, 1:Add, Text, x20 y130, Открыть файл со списком Prophecy или папку res
Gui, 1:Add, Text, x20 y190, Дебаг (Вам сюда не надо)


Gui, 1:Add, Button, x20 y35 w90 h20 gGuiinfo, FAQ ; Кнопка Основной инфы
Gui, 1:Add, Button, x20 y95 w90 h20 gIniedit, Edit FAQ ; Кнопка Основной инфы
Gui, 1:Add, Button, x20 y155 w90 h20 gOpenini, Open ini ; Кнопка Основной инфы
Gui, 1:Add, Button, x120 y155 w120 h20 gOpenfolder, Open folder ; Кнопка Основной инфы
Gui, 1:Add, Button, x20 y215 w90 h20 gDebug, Debug ; Кнопка Основной инфы

Gui, 1:Font, s11 w700 cffffff, Verdana
Gui, 1:Add, Checkbox, x20 y340 vGifhide, Выкл Gif ; Чекбокс для полного отключения гифки
Gui, 1:Add, Text, x730 y340, Ahk Version %A_AhkVersion%
; =====
Gui, 1:Show, x300 y360 w935 h415, Prophecy Info ; Отрисовка, размер и положение Gui
; 
; ================================================
; Тут основной Gui заканчивается
; ================================================
; 
; 
; 
; 
; ================================================
; Функционал первой вкладки.
; ================================================
; Функция, которая прочтет файл со списком Prophecy, и заполнит комбобокс названиями, что бы выбрать нужную Prophecy
GuiControl,, Prophecy_name, | ; Очистка комбобокса, что б поместить в него только Prophecy
Loop, read, %A_ScriptDir%\res\Prophecy.ini ; Чтение файла со списком и описанием Prophecy 
{
	Prophecy_count++
	if Prophecy_count = 1 ; Данная проверка нужна для того, чтобы можно было после первой Prophecy вставить дополнительный знак конвеера | нужно это для выбора по-умолчанию в выпадающих списках
	{
		Prophecy_List_place:= A_LoopReadLine "|" ; Создает переменную, в которой все Prophecy с описаниями записаны в строку и разделены знаком конвеера. Особо эта переменная не нужна, т.к. нигде не выводится, оставлена для дебага.
		Prophecy_List := RegExReplace(A_LoopReadLine, ":.*$", "") "|" ; Создает переменную со списком Prophecy, без описания. Описание убирается регуляркой. Список представляет из себя строку со знакоми конвеера, что бы корректно отображаться в комбобоксе.
	}
	else
	{
		Prophecy_List_place := Prophecy_List_place "|" A_LoopReadLine
		Prophecy_List := Prophecy_List "|" RegExReplace(A_LoopReadLine, ":.*$", "")
	}
}
GuiControl,,Prophecy_name,%Prophecy_List% ; Комбобокс заполняется списком Prophecy
Return
; Gui отрисовывается с подгруженным списком
; 
; ===============================================
Info: ; При нажатии на строку в комбобоксе появится описание
GuiControlGet, Prophecy_name ; Считывает название Prophecy
GuiControlGet, Gifhide
Loop Read, %A_ScriptDir%\res\Prophecy.ini ; Чтение файла со списком и описанием Prophecy
{
	IfInString A_LoopReadLine, %Prophecy_name% ; Поиск в файле строки, с выбранной Prophecy
	{
		Loop Parse, A_LoopReadLine, `. ; Забор этой строки
		{
			Prophecy_place_and_seal_cost_noenter := RegExReplace(A_LoopReadLine, "^.*:", "") ; Сохранение в переменную описания и seal cost Prophecy с помощью регулярки, без переносов строк в описании
			StringReplace, Prophecy_place_and_seal_cost, Prophecy_place_and_seal_cost_noenter, ``n, `n, All ; Выправляет перенос строк в описании
			Prophecy_place := RegExReplace(Prophecy_place_and_seal_cost, "=.*$", "") ; Обрезает регуляркой seal cost, оставляет только описание
			Prophecy_seal_cost := RegExReplace(Prophecy_place_and_seal_cost, "^.*=", "") ; Обрезает регуляркой описание, оставляет только seal cost
		}	
	}
}
; Изменение цвета шрифта эдитбокса и фона комбобокса, если выбран разделитель
if Prophecy_name contains -
{
	if TabName contains List
	{
		if Gifhide = 0 ; Отображение/скрытие гифки на разделителе, в зависимости от чекбокса
		{
			GuiControl, Show, %AGif% ; отображение гифки
		}
		else if Gifhide = 1
		{
			GuiControl, Hide, %AGif% ; Скрытие гифки
		}
	}
	else if TabName contains Info
	{
			GuiControl, Hide, %AGif% ; Скрытие гифки
	}
	CtlColors.Change(EDID1, "Black", "Black") ; Смена цвета шрифта эдитбокса
	CtlColors.Change(EDID2, "Black", "Black")
	Prophecy_color := " Green1" ; Темный комбобокс
}
else if Prophecy_name not contains -
{
	GuiControl, Hide, %AGif% ; Скрытие гифки
	CtlColors.Change(EDID1, "Black", "White") ; Смена цвета шрифта эдитбокса
	CtlColors.Change(EDID2, "Black", "ff4cff")
	Prophecy_color := " Green2" ; Светлый комбобокс
}
StringSplit, LC, Prophecy_color, %A_Space% ; Смена фона комбобокса
If (%LC2%)
{
	BG := %LC2%, TX := "Black"
	CtlColors.Change(CBBID1, BG, TX)
	SendMessage, LB_SETCURSEL, -1, 0, , ahk_id %LBID1%
}
GuiControl, , Prophecy_Seal, %Prophecy_seal_cost% ; Отображение описания Prophecy в эдитбоксе
GuiControl, , Prophecy_info, %Prophecy_place% ; Отображение описания Prophecy в эдитбоксе
return
; ===============================================

; Отображение гифки в зависимости от таба, чекбокса и разделителя
TabChange:
Loop
{
	Gui, submit, nohide
	GuiControlGet, Gifhide
	if TabName contains Info ; Скрытие гифки на вкладке Info
	{
		Sleep, 20
		GuiControl, Hide, %AGif%
	}
	else if TabName contains List ; Отображение/скрытие гифки на вкладке List
	{
		GuiControlGet, Gifhide
		if Prophecy_name contains - ; Отображение/скрытие гифки в зависимости от разделителя
		{
			if Gifhide = 0 ; Отображение/скрытие гифки на разделителе, в зависимости от чекбокса
			{
				GuiControl, Show, %AGif% ; отображение гифки
			}
			else if Gifhide = 1
			{
				GuiControl, Hide, %AGif% ; Скрытие гифки
			}
		}
		else if Prophecy_name not contains -
		{
			GuiControl, Hide, %AGif% ; Скрытие гифки
		}
	}
}
Sleep, 100
GuiControl,, TabName
return
; ===============================================
; Функционал второй вкладки
; ===============================================
; -----------------------------------------------
; 1-ая кнопка
Guiinfo:
Gui, faq:Destroy
Gui, iniedit_faq:Destroy
Gui, debug:Destroy
Gui, faq:Color, 717171 ; Цвет Gui
Gui, faq:Font, s12 w700 cff0000, Verdana ; Настройки шрифта
Gui, faq:Add, Radio, x-15 y10 hwndRBID1 Checked, %A_Space%Как это работает:
CtlColors.Attach(RBID1, "Lime", "") ; зеленый фон
Gui, faq:Font, s11 w500 c000000, Verdana ; Настройки шрифта
Gui, faq:Add, Text, x10 y+10 w890, Скрипт парсит список Prophecy и соответствующие им локации из файла \res\Prophecy.ini`n`nВ списке слева - названия Prophecy. Названия указаны без "The", если оно было в названии. Это сделано для поиска по названию. Поиск работает только если вбивать название с начала, т.е. если вы вбиваете "Sight" - вы не найдете "Beyond Sight", вбивать нужно "Beyond".`n`nВ окне справа - описание Prophecy, локации, на которых можно их выполнить, или другая инфа (к примеру, что данное професи лучше вынуть, чем выполнять). Карты указаны без тира, т.к. GGG каждую лигу перемешивают атлас. Если локация из компании - указан номер акта.`n`nProphecy в цепочках разделены разделителями, при нажатии на них список Prophecy темнеет, а на окно локаций накладывается заглушка.
Gui, faq:Add, Button, x400 y+20 w90 h20 gClosegui2, Close ; Кнопка для закрытия FAQ Gui
Gui, faq:Show, x320 y370 w895, FAQ
return
Closegui2: ; Функционал кнопки для закрытия FAQ Gui
Gui, faq:Destroy
return
; -----------------------------------------------
; 2-ая кнопка
Iniedit:
Gui, faq:Destroy
Gui, iniedit_faq:Destroy
Gui, debug:Destroy
Gui, iniedit_faq:Color, 717171 ; Цвет Gui
Gui, iniedit_faq:Font, s12 w700, Verdana ; Настройки шрифта
Gui, iniedit_faq:Add, Radio, x-13 y10 w890 hwndRBID2 Checked, %A_Space%Редактировать список Prophecy очень просто. Вы можете добавлять Prophecy или изменять их %A_Space%описание.
CtlColors.Attach(RBID2, "ff4cff", "") ; Розовый фон
Gui, iniedit_faq:Font, s11 w500, Verdana ; Настройки шрифта
Gui, iniedit_faq:Add, Progress, x367 y54 w40 h17 Backgroundfdff00 ; "res" желтый
Gui, iniedit_faq:Add, Progress, x773 y54 w93 h17 Backgroundfdff00 ; Prophecy.ini желтый
Gui, iniedit_faq:Add, Progress, x9 y163 w184 h21 Backgroundfdff00 ; Название Prophecy желтый
Gui, iniedit_faq:Add, Progress, x193 y163 w11 h21 Background00ff00 ; : зеленый
Gui, iniedit_faq:Add, Progress, x204 y163 w186 h21 Backgroundfdff00 ; Описание Prophecy желтый
Gui, iniedit_faq:Add, Progress, x390 y163 w20 h21 Background00ff00 ; `n зеленый
Gui, iniedit_faq:Add, Progress, x410 y163 w189 h21 Backgroundfdff00 ; Описание Prophecy желтый
Gui, iniedit_faq:Add, Text, BackgroundTrans x10 y53 w890, Файл со списком Prophecy находится в папке "res" , находящийся в папке скрипта и называетеся Prophecy.ini
Gui, iniedit_faq:Add, Text, BackgroundTrans x10 y+12 w890, Что бы не искать папку, в основном интерфейсе предусмотрена специальная кнопка, которая откроет файл. В случае, если система не знает, чем открывать ini файлы - выберите блокнот, или аналогичный редактор.
Gui, iniedit_faq:Add, Text, BackgroundTrans x10 y+12 w890, Открыв файл вы увидите текст в следующем формате:
Gui, iniedit_faq:Font, s14 w700, Arial ; Настройки шрифта
Gui, iniedit_faq:Add, Text, BackgroundTrans x10 y+12 w890, Название Prophecy:Описание Prophecy``nОписание Prophecy
Gui, iniedit_faq:Font, s11 w500, Verdana ; Настройки шрифта
Gui, iniedit_faq:Add, Text, BackgroundTrans x10 y+12 w890, При редактировании списка есть несколько важных моментов:
; Gui, iniedit_faq:Add, Text, BackgroundTrans x10 yp w890 h0,
Gui, iniedit_faq:Add, Text, BackgroundTrans x10 y+12 w890, 1: Между названием и описанием стоит двоеточие. Оно необходимо, для разделения названий и описаний в работе скрипта, так что трогать его нельзя. Пробелов до и после двоеточия нет и быть не должно.
Gui, iniedit_faq:Add, Text, BackgroundTrans x10 y+12 w890, 2: В описание вы можете увидеть символы "``n" - это означает перенос строки. К примеру "Ghetto Map``nPrecinct Map" означает, что "Ghetto Map" будет на первой строке, а "Precinct Map" на второй (и т.д.). Переносы строк в описании упрощают его чтение. Пробелы до и после "``n" также не нужны.
Gui, iniedit_faq:Add, Text, BackgroundTrans x10 y+12 w890, 3: Разделители, используются для упрощения поиска в списке. Разделитель состоит из названия в виде кучи знаков минус и описания "Choose Prophecy". В названии должен быть минимум 1 знак минус, иначе часть кода перестанет работать. Описание разделителя не имеет значение для работы кода. Тем немнее рекомендуется просто копировать уже существующие разделители.
Gui, iniedit_faq:Add, Button, x400 y+10 w90 h20 gClosegui3, Close ; Кнопка для закрытия FAQ Gui
Gui, iniedit_faq:Show, x320 y370 w895, Edit FAQ
Return
Closegui3: ; Функционал кнопки для закрытия FAQ Gui
Gui, iniedit_faq:Destroy
Return
; -----------------------------------------------
; 3-ая и 4ая кнопка
Openini:
Run, %A_ScriptDir%\res\Prophecy.ini
return
Openfolder:
Run, %A_ScriptDir%\res\
return
; -----------------------------------------------
; 5-ая кнопка
Debug:
Gui, faq:Destroy
Gui, iniedit_faq:Destroy
Gui, debug:Destroy
Gui, debug:Color, 000000 ; Цвет Gui
Gui, debug:Font, s11 w700 cffffff, Verdana
Gui, debug:Add, Edit, x10 y10 w980 h400 -WantCtrlA ReadOnly, Prophecy_List = %Prophecy_List%`n`nTabName = %TabName%`n`nProphecy_place = %Prophecy_place%`n`nProphecy_info = %Prophecy_info%`n`nGifhide = %Gifhide%`n`nProphecy_name = %Prophecy_name%`n`nProphecy_color = %Prophecy_color%`n`nProphecy_place_and_seal_cost = %Prophecy_place_and_seal_cost%`n`nProphecy_seal_cost = %Prophecy_seal_cost%
Gui, debug:Add, Button, x10 y410 w980 h35 gCloseguiD, Close ; Кнопка для закрытия FAQ Gui
Gui, debug:Show, x320 y370 w995 h447, Debug
Return
CloseguiD: ; Функционал кнопки для закрытия Debug Gui
Gui, debug:Destroy
Return
; -----------------------------------------------
; Закрытие окон со второй вкладки на Esc
Esc::
Gui, faq:Destroy
Gui, iniedit_faq:Destroy
Gui, debug:Destroy
Return
; Выход из приложения при закрытии Gui
GuiClose:
ExitApp
return
; ==============================================
; перезапуск скрипта на Control+r
^sc13::
Reload
return
; =============================================