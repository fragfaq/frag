; ==============================================
GroupAdd, poe, ahk_exe PathOfExile.exe
GroupAdd, poe, ahk_exe PathOfExile_x64.exe
; ==============================================
; Vkeys: 
; 0 - дефолт
; 1 - 1,2,3 = 1+2+3+4+5, d = d
; 1 - 1,2,3 = 1+2+3+4+5, d = 1+2+3+4+5
;==============================================
; Vkeys			- меняет хоткеи
;==============================================
Menu, Tray, Icon, %A_ScriptDir%\res\3.ico, 1
;=============================================
#IfWinActive ahk_group poe
;==========================================================================================
Vkeys := 0
VAutoF := 1
;=========== бинд на 1, 2 и 3 =================================
sc2::
sc3::
sc4::
random, VarFlask1, 65, 95
random, VarFlask2, 65, 95
random, VarFlask3, 65, 95
random, VarFlask4, 65, 95
random, VarFlask5, 65, 95
If Vkeys = 0					; 
{
	SendInput % "{" A_ThisHotkey "}"	; 1=1, 2=2, 3=3
}
else If Vkeys = 1						; 1,2,3 = 1+2+3+4+5
{
	sleep, %VarFlask1%
	SendInput, 5
	sleep, %VarFlask2%
	SendInput, 2
	sleep, %VarFlask3%
	SendInput, 4
	sleep, %VarFlask4%
	SendInput, 3
	sleep, %VarFlask5%
	SendInput, 1
}
else if Vkeys = 2						; 1,2,3 = 1+2+3+4+5
{
	sleep, %VarFlask1%
	SendInput, 5
	sleep, %VarFlask2%
	SendInput, 2
	sleep, %VarFlask3%
	SendInput, 4
	sleep, %VarFlask4%
	SendInput, 3
	sleep, %VarFlask5%
	SendInput, 1
}
return
;=========== бинд на D =================================
sc20::
random, VarFlask11, 65, 95
random, VarFlask12, 65, 95
random, VarFlask13, 65, 95
random, VarFlask14, 65, 95
random, VarFlask15, 65, 95
If Vkeys = 0				; 
{
	SendInput % "{" A_ThisHotkey "}"	; d = d
}
If Vkeys = 1							; d = 5
{
	SendInput, 5
}
else if Vkeys = 2						; d = 1+2+3+4+5
{
	sleep, %VarFlask11%
	SendInput, 5
	sleep, %VarFlask12%
	SendInput, 2
	sleep, %VarFlask13%
	SendInput, 4
	sleep, %VarFlask14%
	SendInput, 3
	sleep, %VarFlask15%
	SendInput, 1
}
return
;============================================================
;=====================
#IfWinActive
;=====================
;======;======;======;======;======;======
; Смена биндов и вывод GUI с их описанием
F4:: 
Gui, Destroy
Sleep, 200
if Vkeys = 0
{
	sleep, 50
	Vkeys := 1
}
else if Vkeys > 0
{
	Vkeys += 1
	if Vkeys > 2
	{	
		sleep, 50
		Vkeys := 0
	}
}
Sleep, 50
if Vkeys = 0
{
	VHeal := ""
	Vutil := ""
}
else if Vkeys = 1
{
	VHeal := "D=5"
	VTextColor := "007c07"
}
else if Vkeys = 2
{
	VHeal := "D=12345"
	VTextColor := "850000"
}
Sleep, 50

Gui, +LastFound +AlwaysOnTop +ToolWindow +OwnDialogs
Gui, Font, S26 W900, Verdana
; буквы, первая строчка - тень, вторая сам текст
Gui, Add, Text, x10 y33 c000000 BackgroundTrans, %VHeal%
Gui, Add, Text, x6 y30 c%VTextColor% BackgroundTrans, %VHeal%
; показ и положение Gui
Gui, Show, x220 y870, Flask
; прозрачность
Gui, Color, 000001
WinSet, TransColor, 000001
Gui, -Caption
return

;==============================================
; сброс биндов на дефолтные
F6::
Vkeys := 0
Gui, Destroy
return
;==============================================
;перезапуск скрипта на Ctrl+m
^sc32::
Reload
return
;=============================================
;закрытие gui из основного скрипта
^!+F11::ExitApp ; закрытие скрипта при релоаде Path of Exile 3.0.ahk
return
