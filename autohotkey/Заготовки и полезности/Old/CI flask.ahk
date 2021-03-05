SendInput, ^!+{F12}
; ==============================================
GroupAdd, poe, ahk_exe PathOfExile.exe
GroupAdd, poe, ahk_exe PathOfExile_x64.exe
; ==============================================
; Vkeys: 
; 0 - дефолт
; 1 - 1,2,3 = 1+2+3+4+5, d = d
; 1 - 1,2,3 = 1+2+3+4+5, d = 1+2+3+4+5
; Порядок фласок слева на право (порядок прожима в скрипте): 1: Базальт - антиблид, 2: Сильвер (онслот) - антифриз, 3: Кварц (фэйсинг) - антикерс, 4: джэйд (флат эвэйд) - инкр. эвэйд офк, 5: Квиксильвер на редьюс чарж юз. Порядок прожатия: 5,2,4,3,1
;==============================================
; Vkeys			- меняет хоткеи
;==============================================
Menu, Tray, Icon, %A_ScriptDir%\res\ci.png, 1
;=============================================
#IfWinActive ahk_group poe
;==========================================================================================
Vkeys := 0
VAuto := 1
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
	SendInput, % "{" A_ThisHotkey "}"	; 1=1, 2=2, 3=3
}
else If (Vkeys >0 and Vkeys <4)			; 1,2,3 = 1+2+3+4+5
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
else if Vkeys = 4						; 1,2,3 = 1+2+3+5
{
	sleep, %VarFlask1%
	SendInput, 5
	sleep, %VarFlask2%
	SendInput, 2
	sleep, %VarFlask3%
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
	SendInput, % "{" A_ThisHotkey "}"	; d = d
}
If Vkeys = 1							; d = 1+2+3+4+5
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
else if Vkeys = 2						; d = вкл\выкл цикл 1+2+3+4+5
{
	if VAuto = 1
	{	
		Gui, 1:Destroy
		Sleep, 20
		SoundBeep, 60, 50
		Sleep, 20
		Gui, 1:+LastFound +AlwaysOnTop +ToolWindow +OwnDialogs
		Gui, 1:Font, S26 W900, Verdana
		; буквы, первая строчка - тень, вторая сам текст
		Gui, 1:Add, Text, x10 y33 c000000 BackgroundTrans, ON
		Gui, 1:Add, Text, x6 y30 cb40a0a BackgroundTrans, ON
		; показ и положение Gui
		Gui, 1:Show, x380 y870 NoActivate, Auto
		; прозрачность
		Gui, 1:Color, 000001
		WinSet, TransColor, 000001
		Gui, 1:-Caption
		; запуск цикла
		Run, %A_ScriptDir%\Loop CI flask.ahk
		Sleep, 200
		VAuto := 2
	}
	else if VAuto = 2
	{
		Gui, 1:Destroy
		Sleep, 20
		SoundBeep, 60, 50
		Sleep, 20
		; остановка цикла
		SendInput, ^!+{F12}
		Gui, 1:+LastFound +AlwaysOnTop +ToolWindow +OwnDialogs
		Gui, 1:Font, S26 W900, Verdana
		; буквы, первая строчка - тень, вторая сам текст
		Gui, 1:Add, Text, x10 y33 c000000 BackgroundTrans, OFF
		Gui, 1:Add, Text, x6 y30 c007c07 BackgroundTrans, OFF
		; прозрачность
		Gui, 1:Color, 000001
		WinSet, TransColor, 000001
		Gui, 1:-Caption
		; показ и положение Gui
		Gui, 1:Show, x380 y870 NoActivate, Auto
		Sleep, 200
		VAuto := 1
	}
}
else if Vkeys = 3
{
	SendInput, 5
}
else if Vkeys = 4
{
	sleep, %VarFlask11%
	SendInput, 5
	sleep, %VarFlask12%
	SendInput, 2
	sleep, %VarFlask13%
	SendInput, 3
	sleep, %VarFlask15%
	SendInput, 1
}
return
;============================================================
;=========== Vaal Grace and Vaal Haste на Shift+D (Shift+D = R and 9)
+sc20::
random, VarVaal1, 65, 95
random, VarVaal2, 65, 95
random, VarVaal3, 65, 95
random, VarVaal4, 65, 95
If Vkeys = 0  
{
	SendInput, +{sc20}
}
else if Vkeys <> 0
{
	SendInput, {sc13}
	Sleep, %VarVaal1%
	SendInput, {scA}
	Sleep, %VarVaal2%
}
return
;=====================
#IfWinActive
;=====================
;======;======;======;======;======;======
; Смена биндов и вывод GUI с их описанием
F8::
VAuto := 1
Sleep, 150
SendInput, ^!+{F12}
Sleep, 150
Gui, 1:Destroy
Gui, 2:Destroy
Gui, 3:Destroy

if Vkeys = 0
{
	sleep, 50
	Vkeys := 1
}
else if Vkeys > 0
{
	Vkeys += 1
	if Vkeys > 4
	{	
		sleep, 50
		Vkeys := 0
	}
}
Sleep, 50
if Vkeys = 0
{
	VHeal := ""
	VOnOff := ""
}
else if Vkeys = 1
{
	VHeal := "D=52431"
	VTextColor := "850000"
}
else if Vkeys = 2
{
	VHeal := "   AUTO"
	VTextColor := "007c07"
	Gui, 3:+AlwaysOnTop +OwnDialogs +ToolWindow 
	Gui, 3:Color, 00ff00 ; Цвет Gui
	Gui, 3:-Caption
	Gui, 3:Show, x920 y295 w80 h10 NoActivate, Auto1
}
else if Vkeys = 3
{
	VHeal := "D=5"
	VTextColor := "007c07"
}
else if Vkeys = 4
{
	VHeal := "D=5231"
	VTextColor := "5757ff"
}
Sleep, 50

Gui, 2:+LastFound +AlwaysOnTop +ToolWindow +OwnDialogs
Gui, 2:Font, S26 W900, Verdana
; буквы, первая строчка - тень, вторая сам текст
Gui, 2:Add, Text, x10 y33 c000000 BackgroundTrans, %VHeal%
Gui, 2:Add, Text, x6 y30 c%VTextColor% BackgroundTrans, %VHeal%
; прозрачность
Gui, 2:Color, 000001
WinSet, TransColor, 000001
Gui, 2:-Caption
; показ и положение Gui
Gui, 2:Show, x220 y870 NoActivate, Flask

return

;==============================================
; сброс биндов на дефолтные
F7::
VAuto := 1
Vkeys := 0
Sleep, 150
SendInput, ^!+{F12}
Sleep, 150
Gui, 1:Destroy
Gui, 2:Destroy
Gui, 3:Destroy
return
;==============================================
; 6::
; MsgBox,,, Vkeys = %Vkeys%, VAuto = %VAuto%
; return
;==============================================
;перезапуск скрипта на Ctrl+m
^sc32::
Reload
return
;=============================================
;закрытие gui из основного скрипта
; ^!+F11::ExitApp ; закрытие скрипта при релоаде Path of Exile 3.0.ahk
; return
