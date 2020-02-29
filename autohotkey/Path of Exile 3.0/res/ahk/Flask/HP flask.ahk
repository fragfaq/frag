; #SingleInstance Force
; ==============================================
GroupAdd, poe, ahk_exe PathOfExile.exe
GroupAdd, poe, ahk_exe PathOfExile_x64.exe
; ==============================================
; Vkeys: 
; 0 = 1 = 1, 2 = 2 etc.
; 1 = 1/2 = 1/2, 3&d = 3+4+5, ~ = 5
; 2 = 1/2 = 1/2/3, 3&d = 4+5, ~ = 5
; 3 = 1/2 = 1/2/3, 3&d = 4/5, ~ = 5
; 4 = 1/2 = 1/2/3/4, 3&d = 5, ~ = 5
; 5 = 1/2 = 1/2, 3&d = 3/4, ~ = 5
; 6 = 1/2 = 1, 3&d = 2+3+4+5, ~ = 5
; 7 = 1/2 = 1/2, 3&d = 3+4, ~ = 5
; 8 = 1/2 = 1/2, 3 = 3/4, d = 5, ~ = 5
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
global Var_auto_skils := 0
VarBlightClicker := 0
Vtest1 = 0
;==============================================
; Стартовый Gui, который показывает только что Vkeys = 0
Gui, Destroy
Gui, 2:Destroy
Gui, 3:Destroy
Gui, +LastFound +AlwaysOnTop +ToolWindow +OwnDialogs
Gui, Font, S16 W900, Verdana
Gui, Add, Text, x215 y80 c000000 BackgroundTrans, keys %Vkeys%
Gui, Add, Text, x215 y86 c000000 BackgroundTrans, keys %Vkeys%
Gui, Add, Text, x221 y80 c000000 BackgroundTrans, keys %Vkeys%
Gui, Add, Text, x221 y86 c000000 BackgroundTrans, keys %Vkeys%
Gui, Add, Text, x219 y83 ca0a0a0 BackgroundTrans, keys %Vkeys%
; показ и положение Gui
Gui, Show, x220 y870 NoActivate, Flask
; прозрачность
Gui, Color, 000001
WinSet, TransColor, 000001
Gui, -Caption
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
; return
;==============================================
; Функция для запуска автопрожатия скилов
autocast() {
	If Vkeys > 0
	{
		if Var_auto_skils = 0
		{
			Run, %A_ScriptDir%\support skils script\Molten Shell and Vortex.ahk
			Var_auto_skils := 1
		}
		else if Var_auto_skils = 1
		{
			SetTitleMatchMode, 2
			DetectHiddenWindows, On
			WinClose, support skils script\Molten Shell and Vortex.ahk - AutoHotkey v
			Var_auto_skils := 0
		}
	}
	else
	{
		Sleep, 10
	}
}
return
;=================
; Для лвлинга и следующей лиги, отключение функции, без ее выпиливания из кода
; Раскомментить этот блок и закомментить тот, что выше.
; autocast() {
; }
; return
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
else if (Vkeys = 7 or Vkeys = 8) 	; 1 или 2 в зависимости от Vdvehilki
{
	SendInput, %Vdvehilki%
	Vdvehilki += 1
	if Vdvehilki > 2
	{
		Vdvehilki := 1
	}
}
else if (Vkeys = 9 or Vkeys = 10)	; 1
{
	SendInput, 1
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
else if Vkeys = 6			; 1
{
	SendInput, 1
}
else if (Vkeys = 7 or Vkeys = 8)			; 1 или 2 в зависимости от Vdvehilki
{
	SendInput, %Vdvehilki%
	Vdvehilki += 1
	if Vdvehilki > 2
	{
		Vdvehilki := 1
	}
}
else if (Vkeys = 9 or Vkeys = 10)			; 1
{
	SendInput, 1
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
else if (Vkeys = 7 or Vkeys = 8)			; 3 = 3+4
{
	Sleep, % Sleepfunction(45, 80)
	SendInput, 3
	Sleep, % Sleepfunction(45, 80)
	SendInput, 4
}
else if (Vkeys = 9 or Vkeys = 10)			; 3 = 2+3+4
{
	SendInput, 2
	Sleep, % Sleepfunction(45, 80)
	SendInput, 3
	Sleep, % Sleepfunction(45, 80)
	SendInput, 4
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
else if Vkeys = 7					; 3 = 3+4
{
	Sleep, % Sleepfunction(45, 80)
	SendInput, 3
	Sleep, % Sleepfunction(45, 80)
	SendInput, 4
}
else if (Vkeys = 8 or Vkeys = 9)				; d = 5
{
	SendInput, 5
}
else if (Vkeys < 1 and Vkeys > 9)
{
	SendInput, {sc20}
}
else if Vkeys = 10
{
	Sleep, % Sleepfunction(45, 80)
	SendInput, 3
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
;=========== бинд на F1 ================================= Тут какой-то баг на эфки.
; ~F1::
; SendInput, {F1}
; Sleep, % Sleepfunction(45, 80)
; if Var_autoflask_bind = 2
; {
	; Gui, 3:Destroy
	; SoundBeep, 60, 50
	; SetTitleMatchMode, 2
	; DetectHiddenWindows, On
	; WinClose, Loop HP All flask.ahk - AutoHotkey v
	; Sleep, 20
	; Var_autoflask_bind := 1
; }
; else if Var_autoflask_bind = 1
; {
	; Sleep, 20	
; }
; else if Var_autoflask_bind = 0
; {
	; SendInput, {sc14}
	; Sleep, 20	
; }
; return
;=========== бинд на F2 =================================
; ~F2::
; SendInput, {F2}
; Sleep, % Sleepfunction(45, 80)
; if Var_autoflask_bind = 2
; {
	; Gui, 3:Destroy
	; SoundBeep, 60, 50
	; SetTitleMatchMode, 2
	; DetectHiddenWindows, On
	; WinClose, Loop HP All flask.ahk - AutoHotkey v
	; Sleep, 20
	; Var_autoflask_bind := 1
; }
; else if Var_autoflask_bind = 1
; {
	; Sleep, 20
; }
; else if Var_autoflask_bind = 0
; {
	; SendInput, {sc14}
	; Sleep, 20
; }
; return
;=========== бинд на W =================================
; Если бинды на фласки включены - то на w сперва прожимается w, а потом сразу Mouse3, что б кастануть керсу.
sc11::
if Vkeys > 0
{
	SendInput, {sc11}
	Sleep, % Sleepfunction(35, 50)
	SendInput, {MButton}
}
else if (Vkeys = 0 and VarBlightClicker = 0)
{
	SendInput, {sc11}
}
else if (Vkeys = 0 and VarBlightClicker = 1)
{
	If GetKeyState("sc11", "P")
	loop
	{
		SendInput, ^{Click}
		Sleep, % Sleepfunction(40, 60)
		if (!GetKeyState("sc11", "P"))
		{
			SendInput, {Ctrl up}
			break
		}
	}
}
return 
;==============================================
; Переключатель автокликера на Ctrl+~
~^sc29::
if VarBlightClicker = 0
{
	Gui, Arrow:Destroy
	Sleep, 20
	Gui, Arrow:+LastFound +AlwaysOnTop +ToolWindow +OwnDialogs
	Gui, Arrow:Add, Picture, x1 y1 w50 h50, %A_ScriptDir%\res\Arrow.png
	Gui, Arrow:Show, x890 y20 NoActivate, Autocast
	Gui, Arrow:Color, 000001
	WinSet, TransColor, 000001
	Gui, Arrow:-Caption
	VarBlightClicker := 1
}
else if VarBlightClicker = 1
{
	Gui, Arrow:Destroy
	VarBlightClicker := 0
}
return
;==============================================
;=====================
#IfWinActive
;=====================
; 6::
; MsgBox, Vkeys = %Vkeys%
; return
;======;======;======;======;======;======
; Смена биндов и вывод GUI с их описанием, но сперва закрытиие цикла, если он работает.
; Хоткеи: F8 и Shift+0
; global Vkeys := 8
; ==========
F8::
~+scA::
; Vkeys := 4 ; Закомментировать для доступности всех биндов. Раскомменетировать или указать Vkeys для одного варианта
Vkeys := 8 ; Закомментировать для доступности всех биндов. Раскомменетировать или указать Vkeys для одного варианта
; Vkeys := 9 ; Закомментировать для доступности всех биндов. Раскомменетировать или указать Vkeys для одного варианта
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
	if Vkeys > 10
	{	
		Sleep, % Sleepfunction(30, 50)
		Vkeys := 0
	}
}
Sleep, % Sleepfunction(30, 50)
autocast()
Sleep, % Sleepfunction(30, 50)
if Vkeys = 0
{
	VHeal := ""
	Vutil := ""
	VHealnumder := ""
	Vutilnumber := ""
	VText1 := ""
	VText2 := ""
}
else if Vkeys = 1
{
	VHeal := "Хилки по очереди"
	Vutil := "Утилитки одновременно"
	VHealnumder := 2
	Vutilnumber := 3
	VText1 := ""
	VText2 := ""
}
else if Vkeys = 2
{
	VHeal := "Хилки по очереди"
	Vutil := "Утилитки одновременно"
	VHealnumder := 3
	Vutilnumber := 2
	VText1 := ""
	VText2 := ""
}
else if Vkeys = 3
{
	VHeal := "Хилки по очереди"
	Vutil := "Утилитки по очереди"
	VHealnumder := 3
	Vutilnumber := 2
	VText1 := ""
	VText2 := ""
}
else if Vkeys = 4
{
	VHeal := "Хилки по очереди"
	Vutil := "Утилитка"
	VHealnumder := 4
	Vutilnumber := 1
	VText1 := ""
	VText2 := ""
}	
else if Vkeys = 5
{
	VHeal := "Хилки по очереди"
	Vutil := "Утилитки по очереди"
	VHealnumder := 2
	Vutilnumber := 2
	VText1 := ""
	VText2 := ""
}
else if Vkeys = 6
{
	VHeal := "Хилка на 1 и 2"
	Vutil := "Утилитки одновременно"
	VHealnumder := 1
	Vutilnumber := 4
	VText1 := ""
	VText2 := ""
}
else if Vkeys = 7
{
	VHeal := "Хилки по очереди"
	Vutil := "Утилитки одновременно"
	VHealnumder := 2
	Vutilnumber := 2
	VText1 := ""
	VText2 := ""
}
else if Vkeys = 8
{
	VHeal := "Хилки по очереди"
	Vutil := "Утилитки одновременно"
	VHealnumder := 2
	Vutilnumber := 2
	VText1 := "d = 5"
	VText2 := ""
}
else if Vkeys = 9
{
	VHeal := "Хилка на 1 и 2"
	Vutil := "Утилитки одновременно"
	VHealnumder := 1
	Vutilnumber := 3
	VText1 := "d = 5"
	VText2 := ""
}
else if Vkeys = 10
{
	VHeal := "Хилка на 1 и 2"
	Vutil := "Утилитки одновременно"
	VHealnumder := 1
	Vutilnumber := 3
	VText1 := "d = 345"
	VText2 := ""
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
; не используемый на данный момент текст
Gui, Font, S14 W900, Verdana
Gui, Add, Text, x0 y83 c000000 BackgroundTrans, %VText1%
Gui, Add, Text, x0 y89 c000000 BackgroundTrans, %VText1%
Gui, Add, Text, x6 y83 c000000 BackgroundTrans, %VText1%
Gui, Add, Text, x6 y89 c000000 BackgroundTrans, %VText1%
Gui, Add, Text, x3 y86 c00c90b BackgroundTrans, %VText1%
; Значение Vkeys
Gui, Font, S16 W900, Verdana
Gui, Add, Text, x215 y80 c000000 BackgroundTrans, keys %Vkeys%
Gui, Add, Text, x215 y86 c000000 BackgroundTrans, keys %Vkeys%
Gui, Add, Text, x221 y80 c000000 BackgroundTrans, keys %Vkeys%
Gui, Add, Text, x221 y86 c000000 BackgroundTrans, keys %Vkeys%
Gui, Add, Text, x219 y83 ca0a0a0 BackgroundTrans, keys %Vkeys%
; автопрожатие хп фласок
Gui, add, Picture, x308 y88 w22 h25 gAutoflask, %A_ScriptDir%\res\hp-A.png
; показ и положение Gui
Gui, Show, x220 y870 NoActivate, Flask
; прозрачность
Gui, Color, 000001
WinSet, TransColor, 000001
Gui, -Caption
return
;==============================================
; Сброс биндов на дефолтные и отключение автокаста при нажатии F7, Enter и Ctrl+Enter
F7::
SetTitleMatchMode, 2
DetectHiddenWindows, On
WinClose, Loop HP All flask.ahk - AutoHotkey v
WinClose, support skils script\Molten Shell and Vortex.ahk - AutoHotkey v
Sleep, 20
Var_auto_skils := 0
Var_autoflask_bind := 0
VautoButton := 0
Vkeys := 0
Gui, Destroy
Gui, 2:Destroy
Gui, 3:Destroy

Gui, +LastFound +AlwaysOnTop +ToolWindow +OwnDialogs
Gui, Font, S16 W900, Verdana
Gui, Add, Text, x215 y80 c000000 BackgroundTrans, keys %Vkeys%
Gui, Add, Text, x215 y86 c000000 BackgroundTrans, keys %Vkeys%
Gui, Add, Text, x221 y80 c000000 BackgroundTrans, keys %Vkeys%
Gui, Add, Text, x221 y86 c000000 BackgroundTrans, keys %Vkeys%
Gui, Add, Text, x219 y83 ca0a0a0 BackgroundTrans, keys %Vkeys%
; показ и положение Gui
Gui, Show, x220 y870 NoActivate, Flask
; прозрачность
Gui, Color, 000001
WinSet, TransColor, 000001
Gui, -Caption

return
;=============================================
; Сброс биндов на дефолтные и отключение автокаста при скроле мышкой
~WheelDown::
~WheelUp::
if Vkeys > 0
{
	SetTitleMatchMode, 2
	DetectHiddenWindows, On
	WinClose, Loop HP All flask.ahk - AutoHotkey v
	Sleep, % Sleepfunction(60, 80)
	WinClose, support skils script\Molten Shell and Vortex.ahk - AutoHotkey v
	Sleep, 20
	Var_auto_skils := 0
	Var_autoflask_bind := 0
	VautoButton := 0
	Vkeys := 0
	Gui, Destroy
	Gui, 2:Destroy
	Gui, 3:Destroy

	Gui, +LastFound +AlwaysOnTop +ToolWindow +OwnDialogs
	Gui, Font, S16 W900, Verdana
	Gui, Add, Text, x215 y80 c000000 BackgroundTrans, keys %Vkeys%
	Gui, Add, Text, x215 y86 c000000 BackgroundTrans, keys %Vkeys%
	Gui, Add, Text, x221 y80 c000000 BackgroundTrans, keys %Vkeys%
	Gui, Add, Text, x221 y86 c000000 BackgroundTrans, keys %Vkeys%
	Gui, Add, Text, x219 y83 ca0a0a0 BackgroundTrans, keys %Vkeys%
	; показ и положение Gui
	Gui, Show, x220 y870 NoActivate, Flask
	; прозрачность
	Gui, Color, 000001
	WinSet, TransColor, 000001
	Gui, -Caption
}
else if Vkeys = 0
{
	Sleep, 10
}
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
:*:111111::
reload
return
;==============================================