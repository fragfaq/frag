; ==============================================
GroupAdd, poe, ahk_exe PathOfExile.exe
GroupAdd, poe, ahk_exe PathOfExile_x64.exe
; ==============================================
; Vkeys: 
; 0 - дефолт
; 1 - 1/2 - 1/2, 3 - 3,4,5
; 2 - 1/2/3 - 1/2/3, 3 - 4,5
; 3 - 1/2/3 - 1/2/3, 3 - 4/5
; 4 - 1/2/3/4 - 1/2/3/4, 3 - 5
; 5 - 1/2 - 1/2, 3 - 3/4, ` - 5
;==============================================
; Vkeys			- меняет хоткеи
; Vdvehilki		- меняет значение переменной для варианта 1
; Vtrihilki		- меняет значение переменной для варианта 2 и 3
; Vkvadhilki	- меняет значение переменной для варианта 4 и 5
;==============================================
; Функция для слипа, пример использования:
; Sleep, % Sleepfunction(45, 80)
; 45 и 80 могут быть любыми числами, между которыми будет найдено случайное число.
; Каждый раз рандомное число будет разным, т.к. каждый раз идет обращение к функции, и она возвращает новый результат.
Sleepfunction(min, max)
{
	random, randb, min, max
	return randb
}
;==============================================
Menu, Tray, Icon, %A_ScriptDir%\res\hp.png, 1
;=============================================
#IfWinActive ahk_group poe
;==========================================================================================
Vkeys := 0
Vdvehilki := 1
Vtrihilki := 1
Vkvadhilki := 1
Vspeed := 4
Vspeed_dmg := 3
VautoButton := 0
Var_f_bind := 0
Var_Smoke_mine := 0
;=========== бинд на 1 =================================
sc2::						; В изначальной проверке может стоять любое значение, если оно не привязанно к биндам.
If Vkeys = 0				; Тут должно быть пустое значение, или не определенное значение, для которого нет условий.
{							; В этом случае используем стандартный бинд, задаем Vkeys = 0, (даже если он уже 0),
	SendInput, 1			; и перебираем варианты значения Vkeys и биндов, в зависимости от этого значения.
}
else if Vkeys = 0			; дефолт
{
	SendInput, 1
}
else if Vkeys = 1			; 1 или 2 в зависимости от Vdvehilki, 3&d = 3+4+5
{
	SendInput, %Vdvehilki%
	Vdvehilki += 1
	if Vdvehilki > 2
	{
		Vdvehilki := 1
	}
}
else if Vkeys = 2			; 1, 2 или 3 в зависимости от Vtrihilki, 3&d = 4+5
{
	SendInput, %Vtrihilki%
	Vtrihilki += 1
	if Vtrihilki > 3
	{
		Vtrihilki := 1
	}
}
else if Vkeys = 3			; 1, 2 или 3 в зависимости от Vtrihilki, 3&d = 4/5
{
	SendInput, %Vtrihilki%
	Vtrihilki += 1
	if Vtrihilki > 3
	{
		Vtrihilki := 1
	}
}
else if Vkeys = 4			; 1, 2, 3 или 4 в зависимости от Vkvadhilki, 3 = 5, d = d
{
	SendInput, %Vkvadhilki%
	Vkvadhilki += 1
	if Vkvadhilki > 4
	{
		Vkvadhilki := 1
	}
}
else if Vkeys = 5			; 1 или 2 в зависимости от Vdvehilki
{
	SendInput, %Vdvehilki%
	Vdvehilki += 1
	if Vdvehilki > 2
	{
		Vdvehilki := 1
	}
}
else if Vkeys = 6			; 1
{
	SendInput, 1
}
return
;=========== бинд на 2 =================================
sc3::						; В изначальной проверке может стоять любое значение, если оно не привязанно к биндам.
If Vkeys = 0				; Тут должно быть пустое значение, или не определенное значение, для которого нет условий.
{							; В этом случае используем стандартный бинд, задаем Vkeys = 0, (даже если он уже 0),
	SendInput, 2			; и перебираем варианты значения Vkeys и биндов, в зависимости от этого значения.
}
else if Vkeys = 0			; дефолт
{
	SendInput, 2
}
else if Vkeys = 1			; 1 или 2 в зависимости от Vdvehilki, 3 = 3+4+5
{
	SendInput, %Vdvehilki%
	Vdvehilki += 1
	if Vdvehilki > 2
	{
		Vdvehilki := 1
	}
}
else if Vkeys = 2			; 1, 2 или 3 в зависимости от Vtrihilki, 3&d = 4+5
{
	SendInput, %Vtrihilki%
	Vtrihilki += 1
	if Vtrihilki > 3
	{
		Vtrihilki := 1
	}
}
else if Vkeys = 3			; 1, 2 или 3 в зависимости от Vtrihilki, 3&d = 4/5
{
	SendInput, %Vtrihilki%
	Vtrihilki += 1
	if Vtrihilki > 3
	{
		Vtrihilki := 1
	}
}
else if Vkeys = 4			; 1, 2, 3 или 4 в зависимости от Vkvadhilki, 3 = 5, d = d
{
	SendInput, %Vkvadhilki%
	Vkvadhilki += 1
	if Vkvadhilki > 4
	{
		Vkvadhilki := 1
	}
}
else if Vkeys = 5			; 1 или 2 в зависимости от Vdvehilki, 3&d = 3/4
{
	SendInput, %Vdvehilki%
	Vdvehilki += 1
	if Vdvehilki > 2
	{
		Vdvehilki := 1
	}
}
else if Vkeys = 6			; 1 или 2 в зависимости от Vdvehilki, 3&d = 3/4
{
	SendInput, 1
}
return
;=========== бинд на 3 =================================
sc4::
SetTitleMatchMode, 2
DetectHiddenWindows, On
WinClose, Loop HP flask.ahk - AutoHotkey v
Sleep, 20
Var_f_bind := 0
VautoButton := 0
Gui, 2:Destroy
Gui, 3:Destroy				; В изначальной проверке может стоять любое значение, если оно не привязанно к биндам.
If Vkeys = 0				; Тут должно быть пустое значение, или не определенное значение, для которого нет условий.
{							; В этом случае используем стандартный бинд, задаем Vkeys = 0, (даже если он уже 0),
	SendInput, 3			; и перебираем варианты значения Vkeys и биндов, в зависимости от этого значения.
}
else if Vkeys = 0			; дефолт
{
	SendInput, 3
}
else if Vkeys = 1			; 3 = 3+4+5, 1&2 = 1/2
{
	Sleep, % Sleepfunction(45, 80)
	SendInput, 3
	Sleep, % Sleepfunction(45, 80)
	SendInput, 4
	Sleep, % Sleepfunction(45, 80)
	SendInput, 5
}
else if Vkeys = 2			; 3 = 4+5, 1&2 = 1/2/3
{
	Sleep, % Sleepfunction(45, 80)
	SendInput, 4
	Sleep, % Sleepfunction(45, 80)
	SendInput, 5
}
else if Vkeys = 3			; 3 = 4/5, 1&2 = 1/2/3
{
	SendInput, %Vspeed%
	Vspeed += 1
	if Vspeed > 5
	{
		Vspeed := 4
	}
}
else if Vkeys = 4			; 3 = 5, 1&2 = 1/2/3/4
{
	SendInput, 5
}
else if Vkeys = 5			; 3 = 3/4, 1&2 = 1/2 (для квиксильверов на 3 или 4)
{
	SendInput, %Vspeed_dmg%
	Vspeed_dmg += 1
	if Vspeed_dmg > 4
	{
		Vspeed_dmg := 3
	}
}
else if Vkeys = 6			; 3 = 2+3+4+5 (для 4ех утилиток на 3 или d)
{
	SendInput, 2
	Sleep, % Sleepfunction(45, 80)
	SendInput, 3
	Sleep, % Sleepfunction(45, 80)
	SendInput, 4
	Sleep, % Sleepfunction(45, 80)
	SendInput, 5
}
return
;=========== бинд на D =================================
sc20::
SetTitleMatchMode, 2
DetectHiddenWindows, On
WinClose, Loop HP flask.ahk - AutoHotkey v
Sleep, 20
Var_f_bind := 0
VautoButton := 0
Gui, 2:Destroy
Gui, 3:Destroy				; В изначальной проверке может стоять любое значение, если оно не привязанно к биндам.
If Vkeys = 0				; Тут должно быть пустое значение, или не определенное значение, для которого нет условий.
{							; В этом случае используем стандартный бинд, задаем Vkeys = 0, (даже если он уже 0),
	SendInput, {sc20}		; и перебираем варианты значения Vkeys и биндов, в зависимости от этого значения.
}
else if Vkeys = 0			; дефолт
{
	SendInput, {sc20}
}
else if Vkeys = 1			; d = 3+4+5, 1&2 = 1/2
{
	Sleep, % Sleepfunction(45, 80)
	SendInput, 3
	Sleep, % Sleepfunction(45, 80)
	SendInput, 4
	Sleep, % Sleepfunction(45, 80)
	SendInput, 5	
}
If Vkeys = 2				; d = 4+5, 1&2 = 1/2/3
{
	Sleep, % Sleepfunction(45, 80)
	SendInput, 4
	Sleep, % Sleepfunction(45, 80)
	SendInput, 5
}
else if Vkeys = 3			; d = 4/5, 1&2 = 1/2/3
{
	SendInput, %Vspeed%
	Vspeed += 1
	if Vspeed > 5
	{
		Vspeed := 4
	}
}
else if Vkeys = 4			; d = 5, 1&2 = 1/2/3/4
{
	SendInput, 5
}
else if Vkeys = 5			; d = 3/4, 1&2 = 1/2 (для квиксильверов на 3 или 4)
{
	SendInput, %Vspeed_dmg%
	Vspeed_dmg += 1
	if Vspeed_dmg > 4
	{
		Vspeed_dmg := 3
	}
}
else if Vkeys = 6			; d = 2+3+4+5 (для 4ех утилиток на 3 или d)
{
	Sleep, % Sleepfunction(45, 80)
	SendInput, 2
	Sleep, % Sleepfunction(45, 80)
	SendInput, 3
	Sleep, % Sleepfunction(45, 80)
	SendInput, 4
	Sleep, % Sleepfunction(45, 80)
	SendInput, 5
}
else if (Vkeys < 1 and Vkeys > 6)
{
	SendInput, {sc20}
}
return
;=========== бинд на Tilde =============================
; Пятерка на тильду всегда, кроме варианта с одной хп флаской. Тогда добавляется еще и тройка.
sc29::
if Vkeys != 6
{
	SendInput, 5
}
else if Vkeys = 6
{
	SendInput, 3
	Sleep, % Sleepfunction(45, 80)
	SendInput, 5
}
return
;=========== бинд на R =================================
; Если бинды активны - то на R нажимаются и R и H ака mouse3
; sc13::
; if (Vkeys > 0 and Vkeys < 7)
; {
	; SendInput, {sc13} ; R
	; Sleep, % Sleepfunction(45, 80)
	; SendInput, {sc23} ; H
; }
; else
; {
	; SendInput, {sc13} ; R
; }
; return
;=========== бинд на Mouse3===============================
; MButton::
; if (Vkeys > 0 and Vkeys < 7)
; {
	; SendInput, {sc23} ; R
; }
; else
; {
	; SendInput, {MButton} ; Mouse3
; }
; return
;==============================================
; Бинд на Q, что по очереди нажималось сперва просто клавиша, потом с шифтом и так по кругу.
sc10::
if Var_Smoke_mine = 0
{
	SendInput, {sc10} ; Q
	Var_Smoke_mine := 1
}
else if Var_Smoke_mine = 1
{
	SendInput, +{sc10} ; Shift+Q
	Var_Smoke_mine := 0
}
return
;=====================
#IfWinActive
;==============================================
^8::
MsgBox, Var_Smoke_mine = %Var_Smoke_mine%
return
;==============================================
:*:qweqwe::
Send 111111111111111111111111111111
return
;=====================
; #IfWinActive
;=====================
;======;======;======;======;======;======
; Смена биндов и вывод GUI с их описанием, но сперва закрытиие цикла, если он работает.
F8:: 
SetTitleMatchMode, 2
DetectHiddenWindows, On
WinClose, Loop HP flask.ahk - AutoHotkey v
Sleep, 20
Var_f_bind := 0
VautoButton := 0
Sleep, % Sleepfunction(40, 60)
Vkeys := 5 ; Закомментировать для доступности всех биндов. Раскомменетировать или указать Vkeys для одного варианта.
Sleep, % Sleepfunction(40, 60)
Gui, Destroy
Gui, 2:Destroy
Gui, 3:Destroy
Sleep, % Sleepfunction(40, 60)
if Vkeys = 0
{
	Sleep, % Sleepfunction(30, 50)
	Vkeys := 1
}
else if Vkeys > 0
{
	Vkeys += 1
	if Vkeys > 6
	{	
		Sleep, % Sleepfunction(30, 50)
		Vkeys := 0
	}
}
Sleep, % Sleepfunction(30, 50)
if Vkeys = 0
{
	VHeal := ""
	Vutil := ""
	VHealnumder := ""
	Vutilnumber := ""
	VTilde := ""
	VkeyR := ""
}
else if Vkeys = 1
{
	VHeal := "Хилки по очереди"
	Vutil := "Утилитки одновременно"
	VHealnumder := 2
	Vutilnumber := 3
	VTilde := "Ё=5"
	VkeyR := "R=R+H, M3=H"
}
else if Vkeys = 2
{
	VHeal := "Хилки по очереди"
	Vutil := "Утилитки одновременно"
	VHealnumder := 3
	Vutilnumber := 2
	VTilde := "Ё=5"
	VkeyR := "R=R+H, M3=H"
}
else if Vkeys = 3
{
	VHeal := "Хилки по очереди"
	Vutil := "Утилитки по очереди"
	VHealnumder := 3
	Vutilnumber := 2
	VTilde := "Ё=5"
	VkeyR := "R=R+H, M3=H"
}
else if Vkeys = 4
{
	VHeal := "Хилки по очереди"
	Vutil := "Утилитка"
	VHealnumder := 4
	Vutilnumber := 1
	VTilde := "Ё=5"
	VkeyR := "R=R+H, M3=H"
}	
else if Vkeys = 5
{
	VHeal := "Хилки по очереди"
	Vutil := "Утилитки по очереди"
	VHealnumder := 2
	Vutilnumber := 2
	VTilde := "Ё=5"
	VkeyR := "R=R+H, M3=H"
}
else if Vkeys = 6
{
	VHeal := "Хилка на 1 и 2"
	Vutil := "Утилитки одновременно"
	VHealnumder := 1
	Vutilnumber := 4
	VTilde := "Ё=3+5"
	VkeyR := "R=R+H, M3=H"
}
Sleep, % Sleepfunction(30, 50)

Gui, +LastFound +AlwaysOnTop +ToolWindow +OwnDialogs
Gui, Font, S18 W600, Verdana
; буквы, первая строчка - тень, вторая сам текст
Gui, Add, Text, x36 y17 c000000 BackgroundTrans, %VHeal%`n%Vutil%
Gui, Add, Text, x33 y14 c007c07 BackgroundTrans, %VHeal%`n%Vutil%
; цифры хилок
Gui, Font, S28 W700, Verdana
Gui, Add, Text, x4 y4 c000000 BackgroundTrans, %VHealnumder%
Gui, Add, Text, x0 y0 cd1e150 BackgroundTrans, %VHealnumder%
; цифры утилок
Gui, Add, Text, x4 y38 c000000 BackgroundTrans, %Vutilnumber%
Gui, Add, Text, x0 y34 cd1e150 BackgroundTrans, %Vutilnumber%
; Бинд тильды
Gui, Font, S20 W900, Verdana
Gui, Add, Text, x0 y70 c000000 BackgroundTrans, %VTilde%
Gui, Add, Text, x0 y76 c000000 BackgroundTrans, %VTilde%
Gui, Add, Text, x6 y70 c000000 BackgroundTrans, %VTilde%
Gui, Add, Text, x6 y76 c000000 BackgroundTrans, %VTilde%
Gui, Add, Text, x3 y73 cffffff BackgroundTrans, %VTilde%
; Бинд R
Gui, Font, S14 W900, Verdana
Gui, Add, Text, x150 y80 c000000 BackgroundTrans, %VkeyR%
Gui, Add, Text, x150 y86 c000000 BackgroundTrans, %VkeyR%
Gui, Add, Text, x156 y80 c000000 BackgroundTrans, %VkeyR%
Gui, Add, Text, x156 y86 c000000 BackgroundTrans, %VkeyR%
Gui, Add, Text, x153 y83 cffffff BackgroundTrans, %VkeyR%
; автопрожатие хп фласок
Gui, add, Picture, x310 y80 w40 h40 gAutoflask, %A_ScriptDir%\res\hp.png
; показ и положение Gui
Gui, Show, x220 y870 NoActivate, Flask
; прозрачность
Gui, Color, 000001
WinSet, TransColor, 000001
Gui, -Caption
return
;==============================================
+F8::
Vkeys := 0
return
;==============================================
; сброс биндов на дефолтные
F7::
SetTitleMatchMode, 2
DetectHiddenWindows, On
WinClose, Loop HP flask.ahk - AutoHotkey v
Sleep, 20
Var_f_bind := 0
VautoButton := 0
Vkeys := 0
Gui, Destroy
Gui, 2:Destroy
Gui, 3:Destroy
return
;==============================================
;перезапуск скрипта на Ctrl+m
^sc32::
Reload
return
;=============================================
; #IfWinActive ahk_group poe
;=============================================
Autoflask:
!sc21::
+scF::
SetTitleMatchMode, 2
DetectHiddenWindows, On
WinClose, Loop HP flask.ahk - AutoHotkey v ; Закрывает цикл, если он работает
Sleep, 20
if VautoButton = 0	; если переменные клавиш в исходном состоянии (т.е. скрипт не работает) - бинд клавиши F меняеца
{					; на запуск цикла фласок. Что бы отслеживать функцию клавиши, так же меняется значение VautoButton
	Gui, 2:Destroy
	Gui, 3:Destroy
	SoundBeep, 60, 50
	Sleep, 20
	Gui, 2:+LastFound +AlwaysOnTop +ToolWindow +OwnDialogs
	Gui, 2:Font, S36 W900, Verdana
	Gui, 2:Add, Text, x10 y3 c000000 BackgroundTrans, !!!!
	Gui, 2:Add, Text, x6 y0 cb40a0a BackgroundTrans, !!!!
	Gui, 2:Show, x480 y870 NoActivate, Auto_on
	Gui, 2:Color, 000001
	WinSet, TransColor, 000001
	Gui, 2:-Caption
	Var_f_bind := 1
	VautoButton := 1
}
else if VautoButton = 1 ; если биндом клавиши является запуск скрипта - меняет бинд на дефолтный.
{
	Gui, 2:Destroy
	Gui, 3:Destroy
	SoundBeep, 60, 50
	Sleep, 20
	Gui, 2:+LastFound +AlwaysOnTop +ToolWindow +OwnDialogs
	Gui, 2:Font, S36 W900, Verdana
	Gui, 2:Add, Text, x10 y3 c000000 BackgroundTrans, 
	Gui, 2:Add, Text, x6 y0 cb40a0a BackgroundTrans, 
	Gui, 2:Show, x480 y870 NoActivate, Auto_off
	Gui, 2:Color, 000001
	WinSet, TransColor, 000001
	Gui, 2:-Caption	
	Var_f_bind := 0
	VautoButton := 0
}
return
;=============================================
#IfWinActive ahk_group poe
;=============================================

sc21:: 				; бинд на F, если VautoButton = 0, то бинд дефолтный. Если VautoButton = 1, то бинд меняется
if Var_f_bind = 0	; в зависимости от собственного значения Var_f_bind. Запустить скрипт, или убить его.
{
	SendInput, {sc21}
}
else if Var_f_bind = 1						; Если Var_f_bind = 1 - он запускает цикл, если = 2 - убивает.
{											; Если = 0 - выполняет стандартное нажатие клавиши.
	Gui, 3:Destroy
	SoundBeep, 60, 50
	Sleep, 20
	Gui, 3:+LastFound +AlwaysOnTop +ToolWindow +OwnDialogs
	Gui, 3:Font, S36 W900, Verdana
	Gui, 3:Add, Text, x10 y3 c000000 BackgroundTrans, ON
	Gui, 3:Add, Text, x6 y0 c00ff00 BackgroundTrans, ON
	Gui, 3:Show, x480 y870 NoActivate, Auto_on
	Gui, 3:Color, 000001
	WinSet, TransColor, 000001
	Gui, 3:-Caption
	; Run, %A_ScriptDir%\Loop HP flask.ahk
	Run, %A_ScriptDir%\Loop HP All flask.ahk
	Sleep, 100
	Var_f_bind := 2
}
else if Var_f_bind = 2
{
	Gui, 3:Destroy
	SetTitleMatchMode, 2
	DetectHiddenWindows, On
	; WinClose, Loop HP flask.ahk - AutoHotkey v
	WinClose, Loop HP All flask.ahk - AutoHotkey v
	Sleep, 20
	Var_f_bind := 1
}
return


;==============================================
;=====================
#IfWinActive
;==============================================аааа
;закрытие gui из основного скрипта
; ^!+F11::ExitApp ; закрытие скрипта при релоаде Path of Exile 3.0.ahk
; return
