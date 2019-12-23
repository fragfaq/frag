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
Menu, Tray, Icon, %A_ScriptDir%\res\Life_flask1.png, 1
;=============================================
; #include %A_ScriptDir%\lib_3.9.ahk
;=============================================
#IfWinActive ahk_group poe
;==========================================================================================
global Vkeys := 0
global Vdvehilki := 1
global Vtrihilki := 1
global Vkvadhilki := 1
global Vspeed := 4
global Vspeed_dmg := 3
global VautoButton := 0
global Var_autoflask_bind := 0
global Var_FRBA := 0
Vtest1 = 0
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
return
;=========== бинд на 1 =================================
sc2:: 
If Vkeys = 0 
{
	SendInput, 1			; дефолт
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
else if Vkeys = 7			; 1 или 2 в зависимости от Vdvehilki
{
	SendInput, %Vdvehilki%
	Vdvehilki += 1
	if Vdvehilki > 2
	{
		Vdvehilki := 1
	}
}
return
;=========== бинд на 2 =================================
sc3::
If Vkeys = 0
{
	SendInput, 2			; дефолт
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
else if Vkeys = 7			; 1 или 2 в зависимости от Vdvehilki
{
	SendInput, %Vdvehilki%
	Vdvehilki += 1
	if Vdvehilki > 2
	{
		Vdvehilki := 1
	}
}
return
;=========== бинд на 3 =================================
sc4::
SetTitleMatchMode, 2
DetectHiddenWindows, On
WinClose, Loop HP All flask.ahk - AutoHotkey v
Sleep, 20
Var_autoflask_bind := 0
VautoButton := 0
Gui, 2:Destroy
Gui, 3:Destroy
If Vkeys = 0
{
	SendInput, 3			; Дефолт
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
else if Vkeys = 7			; 3 = 4+5
{
	Sleep, % Sleepfunction(45, 80)
	SendInput, 4
	Sleep, % Sleepfunction(45, 80)
	SendInput, 5
}
return
;=========== бинд на D =================================
sc20::
if Vkeys = 0				; дефолт
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
	if Var_autoflask_bind = 0		; Определяет, будет ли запущен скрипт на автофласки. Значение изменяется вместе
	{								; со значением VautoButton. Если VautoButton = 0, то бинд дефолтный. Если
		Gui, 3:Destroy				; VautoButton = 1, то бинд меняется в зависимости от собственного значения 
		SetTitleMatchMode, 2		; Var_autoflask_bind. Запустить скрипт, или убить его. При значении 0 - убивает
		DetectHiddenWindows, On		; скрипт автопрожатия и закрывает его Gui.
		WinClose, Loop HP All flask.ahk - AutoHotkey v
		Sleep, % Sleepfunction(45, 80)
		SendInput, 2
		Sleep, % Sleepfunction(45, 80)
		SendInput, 3
		Sleep, % Sleepfunction(45, 80)
		SendInput, 4
		Sleep, % Sleepfunction(45, 80)
		SendInput, 5
		Sleep, 20
	}
	else if Var_autoflask_bind = 1	; При значении 1 запускает скрипт автопрожатий и отображает Gui. Так же меняет
	{								; значение Var_autoflask_bind на 2, что б клавиша работала как тумблер (on/off).
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
		Run, %A_ScriptDir%\Loop HP All flask.ahk
		Sleep, 100
		Var_autoflask_bind := 2
	}
	else if Var_autoflask_bind = 2	; При значении 2 убивает скрипт автофласок и задает значение Var_autoflask_bind=1
	{								; что б повторным нажатием запустить скрипт.
		Gui, 3:Destroy
		SoundBeep, 60, 50
		SetTitleMatchMode, 2
		DetectHiddenWindows, On
		WinClose, Loop HP All flask.ahk - AutoHotkey v
		Sleep, 20
		Var_autoflask_bind := 1
	}
}
else if (Vkeys < 1 and Vkeys > 7)
{
	SendInput, {sc20}
}
else if Vkeys = 7			; 3 = 4+5
{
	Sleep, % Sleepfunction(45, 80)
	SendInput, 4
	Sleep, % Sleepfunction(45, 80)
	SendInput, 5
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

;==============================================
F1::
SendInput, {F1}
Sleep, % Sleepfunction(45, 80)
if Var_autoflask_bind = 2
{
	Gui, 3:Destroy
	SoundBeep, 60, 50
	SetTitleMatchMode, 2
	DetectHiddenWindows, On
	WinClose, Loop HP All flask.ahk - AutoHotkey v
	Sleep, 20
	Var_autoflask_bind := 1
}
else if Var_autoflask_bind = 1
{
	Sleep, 20
}
return
;==============================================
F2::
SendInput, {F2}
Sleep, % Sleepfunction(45, 80)
if Var_autoflask_bind = 2
{
	Gui, 3:Destroy
	SoundBeep, 60, 50
	SetTitleMatchMode, 2
	DetectHiddenWindows, On
	WinClose, Loop HP All flask.ahk - AutoHotkey v
	Sleep, 20
	Var_autoflask_bind := 1
}
else if Var_autoflask_bind = 1
{
	Sleep, 20
}
return
;==============================================
; если бинды на фласки включены - то на w сперва прожимается w, а потом сразу ноль, что б кастануть керсу.
~sc11::
if Vkeys > 0
{
	Sleep, % Sleepfunction(35, 50)
	SendInput, {sc13}
	Sleep, % Sleepfunction(145, 180)
	SendInput, +{scB}
}
else if Var_autoflask_bind = 1
{
	SendInput, {sc11}
}
return 
; 7::
; msgbox, %Vkeys%
; return
;==============================================
; автопрожатие бонармора на Shift+9
~+scA::
If Vkeys > 0
{
	if Var_FRBA = 0
	{
		Run, %A_ScriptDir%\FRBA.ahk
		Var_FRBA := 1
	}
	else if Var_FRBA = 1
	{
		SetTitleMatchMode, 2
		DetectHiddenWindows, On
		WinClose, FRBA.ahk - AutoHotkey v
		Var_FRBA := 0
	}
}
else
{
	SendInput, {scB}
}
return
;==============================================
;=====================
#IfWinActive
;=====================
; 6::
; MsgBox, VautoButton = %VautoButton%`nVautoButton1 = %VautoButton1%`nVar_autoflask_bind = %Var_autoflask_bind%
; return
;======;======;======;======;======;======
; Смена биндов и вывод GUI с их описанием, но сперва закрытиие цикла, если он работает.
F8::
Vkeys := 6 ; Закомментировать для доступности всех биндов. Раскомменетировать или указать Vkeys для одного варианта.
Sleep, % Sleepfunction(40, 60)
SetTitleMatchMode, 2
DetectHiddenWindows, On
WinClose, Loop HP All flask.ahk - AutoHotkey v
Sleep, 20
Var_autoflask_bind := 0
VautoButton := 0
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
	if Vkeys > 7
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
	VTilde := ""
	VkeyR := ""
}
else if Vkeys = 2
{
	VHeal := "Хилки по очереди"
	Vutil := "Утилитки одновременно"
	VHealnumder := 3
	Vutilnumber := 2
	VTilde := ""
	; VkeyR := ""
	VkeyR := ""
}
else if Vkeys = 3
{
	VHeal := "Хилки по очереди"
	Vutil := "Утилитки по очереди"
	VHealnumder := 3
	Vutilnumber := 2
	VTilde := ""
	VkeyR := ""
}
else if Vkeys = 4
{
	VHeal := "Хилки по очереди"
	Vutil := "Утилитка"
	VHealnumder := 4
	Vutilnumber := 1
	VTilde := ""
	VkeyR := ""
}	
else if Vkeys = 5
{
	VHeal := "Хилки по очереди"
	Vutil := "Утилитки по очереди"
	VHealnumder := 2
	Vutilnumber := 2
	VTilde := ""
	VkeyR := ""
}
else if Vkeys = 6
{
	VHeal := "Хилка на 1 и 2"
	Vutil := "Утилитки одновременно"
	VHealnumder := 1
	Vutilnumber := 4
	VTilde := ""
	VkeyR := ""
}
else if Vkeys = 7
{
	VHeal := "Хилки по очереди"
	Vutil := "Утилитки одновременно"
	VHealnumder := 2
	Vutilnumber := 2
	VTilde := ""
	VkeyR := ""
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
; Gui, add, Picture, x310 y80 w40 h40 gAutoflask, %A_ScriptDir%\res\hp.png
Gui, add, Picture, x308 y88 w22 h25 gAutoflask, %A_ScriptDir%\res\hp-A.png
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
WinClose, Loop HP All flask.ahk - AutoHotkey v
WinClose, FRBA.ahk - AutoHotkey v
Sleep, 20
Var_autoflask_bind := 0
VautoButton := 0
Vkeys := 0
Gui, Destroy
Gui, 2:Destroy
Gui, 3:Destroy
return
;=============================================
Autoflask:
!sc21::
SetTitleMatchMode, 2
DetectHiddenWindows, On
WinClose, Loop HP All flask.ahk - AutoHotkey v ; Закрывает цикл, если он работает
Sleep, 20
if VautoButton = 0	; если переменные клавиш в исходном состоянии - бинд клавиши D будет d = 2+3+4+5. При нажатии
{					; хоткея или кнопки отрисовывается Gui, меняются значения VautoButton и Var_autoflask_bind на 1
	Gui, 2:Destroy	; После этого бинд клавиши D будет запускать скрипт автофласок.
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
	Var_autoflask_bind := 1
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
	Var_autoflask_bind := 0
	VautoButton := 0
}
return
;==============================================