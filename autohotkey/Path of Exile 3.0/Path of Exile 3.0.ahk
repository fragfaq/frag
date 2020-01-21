#Persistent
#include %A_ScriptDir%\res\ahk\gui\res\ToolTipFont.ahk
CoordMode, Mouse, Screen
SetDefaultMouseSpeed, 3
;==============================================
VarMapsTierGui := 0
VarDopBinds := 0
VarAntiAfk := 0
;==============================================
GroupAdd, poe, ahk_exe PathOfExile.exe
GroupAdd, poe, ahk_exe PathOfExile_x64.exe
GroupAdd, poe, ahk_exe notepad.exe ; for test
GroupAdd, browser, ahk_exe firefox.exe
GroupAdd, browser, ahk_exe chrome.exe
GroupAdd, trade, search results ahk_exe chrome.exe
GroupAdd, trade, ahk_exe PathOfExile.exe
GroupAdd, trade, ahk_exe PathOfExile_x64.exe
;==============================================
Menu, Tray, Icon, %A_ScriptDir%\res\pic\1.ico, 1
; Подменюшки под курсор
; FLASK
Menu, MousePodMenu1, Add, FLASK HP, FlaskHPScript
Menu, MousePodMenu1, Add
Menu, MousePodMenu1, Add, FLASK CI, FlaskCIScript
Menu, MousePodMenu1, Add
Menu, MousePodMenu1, Add, FLASK OFF, FlaskOff
Menu, MousePodMenu1, Default, FLASK HP
; GUI ON
Menu, MousePodMenu2, Add, EXPGUI ON, ShowExpGui
Menu, MousePodMenu2, Add
Menu, MousePodMenu2, Add
Menu, MousePodMenu2, Add, SKILLS DETECT ON, skills_detect_on
Menu, MousePodMenu2, Add
Menu, MousePodMenu2, Add, DIV EXALT, ExCalc
Menu, MousePodMenu2, Default, EXPGUI ON
; DIFFERENT OFF
Menu, MousePodMenu3, Add, EXPGUI OFF, CloseExpGui
Menu, MousePodMenu3, Add
Menu, MousePodMenu3, Add
Menu, MousePodMenu3, Add, SKILLS DETECT OFF, skills_detect_off
Menu, MousePodMenu3, Default, EXPGUI OFF
; AUTO
Menu, MousePodMenu4, Add, HORIZONTAL, AutosellX
Menu, MousePodMenu4, Add
Menu, MousePodMenu4, Add, VERTICAL, AutosellY
Menu, MousePodMenu4, Add
Menu, MousePodMenu4, Add, AURS_ON, Aurs_on
Menu, MousePodMenu4, Add
Menu, MousePodMenu4, Add
Menu, MousePodMenu4, Add, CRAFT MAGIC, Craft_magic
Menu, MousePodMenu4, Add
Menu, MousePodMenu4, Add, CRAFT RARE, Craft_rare
Menu, MousePodMenu4, Add
Menu, MousePodMenu4, Add, CRAFT ALL, Craft_all
Menu, MousePodMenu4, Add
Menu, MousePodMenu4, Default, AURS_ON
; Меню для этих подменюшекCraft_magic
Menu, MouseMenu, Add, FLASK, :MousePodMenu1
Menu, MouseMenu, Add
Menu, MouseMenu, Add, GUI, :MousePodMenu2
Menu, MouseMenu, Add
Menu, MouseMenu, Add, SCRIPT KILL, :MousePodMenu3
Menu, MouseMenu, Add
Menu, MouseMenu, Add, AUTO, :MousePodMenu4
Menu, MouseMenu, Default, FLASK
; Цвет меню под курсором
Menu, MouseMenu, color, 009628
; Цвет подменюшек под курсор
Menu, MousePodMenu1, color, f17d77
Menu, MousePodMenu2, color, af8511
Menu, MousePodMenu3, color, c05fcc
Menu, MousePodMenu4, color, aaaaaa
; цвет и менюшки в трее
Menu, Tray, color, 009c00
menu, tray, add, Reboot
Menu, tray, Default, Reboot
Menu, Tray, Add,
menu, tray, NoStandard
menu, tray, Standard
return
;==============================================
;==============================================
Sleepfunction(min, max)
{
	random, randb, min, max
	return randb
}
return
;==============================================
;перезапуск скрипта на Control+r
Reboot:
^sc13::
Sleep, 10
Reload
return
;==========================================================================================
;         Cкрипты для маусменю               ==============================================
;==========================================================================================
FlaskHPScript:
SetTitleMatchMode, 2
DetectHiddenWindows, On
WinClose, HP flask.ahk - AutoHotkey
sleep, 50
WinClose, CI flask.ahk - AutoHotkey
sleep, 100
Run, %A_ScriptDir%\res\ahk\flask\HP flask.ahk
return
;==============================================
FlaskCIScript:
SetTitleMatchMode, 2
DetectHiddenWindows, On
WinClose, HP flask.ahk - AutoHotkey
sleep, 50
WinClose, CI flask.ahk - AutoHotkey
sleep, 100
Run, %A_ScriptDir%\res\ahk\flask\CI flask.ahk
return
;==============================================
FlaskOff:
SetTitleMatchMode, 2
DetectHiddenWindows, On
WinClose, HP flask.ahk - AutoHotkey
sleep, 50
WinClose, CI flask.ahk - AutoHotkey
return
;==============================================
;==============================================
skills_detect_on:
SetTitleMatchMode, 2
DetectHiddenWindows, On
WinClose, Skills detect.ahk - AutoHotkey
Run, %A_ScriptDir%\res\ahk\gui\Skills detect.ahk
return
;================
skills_detect_off:
SetTitleMatchMode, 2
DetectHiddenWindows, On
WinClose, Skills detect.ahk - AutoHotkey
return
;==============================================
ShowExpGui:
SetTitleMatchMode, 2
DetectHiddenWindows, On
WinClose, Exp Gui.ahk - AutoHotkey
sleep, 100
Run, %A_ScriptDir%\res\ahk\Exp Gui.ahk
return
;==========
CloseExpGui:
SetTitleMatchMode, 2
DetectHiddenWindows, On
WinClose, Exp Gui.ahk - AutoHotkey
Return
;==============================================
; Калькулятор дивинэйшенок на экзальты
ExCalc:
Run, %A_ScriptDir%\res\ahk\gui\Exalt div cadr calc.ahk
return
;==============================================
;==============================================
; Автопродажа по строкам
AutosellX:
Run, %A_ScriptDir%\res\ahk\gui\Autosell_String.ahk
return
;==============================================
; Автопродажа по столбцам
AutosellY:
Run, %A_ScriptDir%\res\ahk\gui\Autosell_Row.ahk
return
;==============================================
Aurs_on:
sleep, 30
Run, %A_ScriptDir%\res\ahk\other\Aurs_3.7.1.ahk
return
;==============================================
Craft_magic:
sleep, 30
Run, %A_ScriptDir%\res\ahk\other\Craft Alt+Aug.ahk
return
;==============================================
Craft_rare:
sleep, 30
Run, %A_ScriptDir%\res\ahk\other\Craft Alch+Scour.ahk
return
;==============================================
Craft_All:
sleep, 30
Run, %A_ScriptDir%\res\ahk\other\Craft.ahk
return
;==============================================
F3::
IfWinNotActive, ("ahk_class POEWindowClass")
{
	WinActivate, Path of Exile
}
Sleep, % Sleepfunction(40, 60)
SendInput, {Enter}
Sleep, % Sleepfunction(40, 60)
SendInput, ^{sc2F}
Sleep, % Sleepfunction(40, 60)
SendInput, {Enter}
Sleep, % Sleepfunction(40, 60)
return
;==============================================
; menu на CapsLock
sc3A::
Menu, MouseMenu, Show  ; Показывать меню по нажатию CapsLock
return
;=============================================
;=============================================
#IfWinActive ahk_group poe
;=============================================
;=============================================
;==========================================================================================
;         Скрипты на хоткеи                   =============================================
;==========================================================================================
; Logout на F4 и F5
; F4::
; F5::
; Process close, PathOfExile.exe
; Process close, PathOfExile_x64.exe
; Sleep, 20
; SoundPlay, %A_ScriptDir%\res\pic\2.mp3
; Sleep, 20
; Run, %A_ScriptDir%\res\ahk\gui\Logout.ahk
; return
;==========================================================================================
; Logout на Alt+CapsLock и на Shift+CapsLock
!sc3A::
+sc3A::
BlockInput On
Process close, PathOfExile.exe
Process close, PathOfExile_x64.exe
BlockInput Off
return
;==========================================================================================
;сообщение в гильду на Del
sc153::
Sleep, % Sleepfunction(150, 200)
SendInput, {sc147}
Sleep, % Sleepfunction(150, 200)
SendInput, {&}
Sleep, % Sleepfunction(150, 200)
SendInput, {sc14F}
return
;==========================================================================================
;скролл сундука на 8 вкладок на Shift+Scroll
+WheelUp::
SendInput, {Left 17}
Sleep, 1000
return
+WheelDown::
SendInput, {Right 8}
Sleep, 500
return
;=============================================
;Shift+Alt+q - Shift+mouse1 10 раз (автозаточка)
+!sc10::
Loop, 10
{
Random, vS1, 100, 190
Sleep, % Sleepfunction(100, 200)
SendInput, +{LButton}
}
return
; =============================================
;Control+s = Esc, для закрытия чата
^sc1F::
BlockInput On
SendInput, {Esc}
BlockInput Off
return
;=============================================
;Tier - LvL Gui
*F6::
{
Gui, Tier: +LastFound +AlwaysOnTop +ToolWindow +OwnDialogs
Gui, Tier:Add, Picture, x0 y0,res\pic\tier.PNG
Gui, Tier:Show, Center w267 h97, Tier - LvL
Hotkey, IfWinActive, Msgbox
}
KeyWait, F6
{
Gui, Tier:Destroy
}
return
;=============================================
;открытие портала на Shift+E
+sc12::
Random, Vspeed1, 4, 6
Random, Vspeed2, 4, 6
Sleep, % Sleepfunction(50, 80)
MouseGetPos VportalX, VportalY				; сохраняет текущие координаты курсора
Sleep, % Sleepfunction(50, 80)
SendInput, {sc12}							; нажимает E, что б открыть инвентарь
Sleep, % Sleepfunction(50, 80)
MouseMove, 1344, 616, %Vspeed1%				; Наводит курсор на свиток портала
Sleep, % Sleepfunction(50, 80)
Click Right									; Открывает портал
Sleep, % Sleepfunction(50, 80)
SendInput, {sc12}							; нажимает E, что б закрыть инвентарь
Sleep, % Sleepfunction(50, 80)
MouseMove, VportalX, VportalY, %Vspeed2%	; возвращает курсор на место
return
;============================================= 
; Gui для прайса на Win+Mouse3
#Mbutton::
; SendInput, ^!+{F12}
; Sleep, 100
run, %A_ScriptDir%\res\ahk\gui\Price.ahk
return
;============================================ 
; вписывать цены в 1 клик на Crtl+(1-3)
$^1::
$^2::
$^3::
run, %A_ScriptDir%\res\ahk\gui\Fast_Price.ahk
; Varbo := RegExReplace(A_ThisHotkey, "[^0-9]", "")
; Sleep, % Sleepfunction(100, 150)
; SendInput, ^{sc1E}
; Sleep, % Sleepfunction(100, 150)
; SendInput, {~} ;+{sc29}
; Sleep, % Sleepfunction(100, 150)
; SendInput, b
; Sleep, % Sleepfunction(100, 150)
; SendInput, {/}
; Sleep, % Sleepfunction(100, 150)
; SendInput, o %Varbo% chaos
return
;===============================================
; ty на Insert
sc152::
Sleep, 50
SendInput, ty
Sleep, 50
return
;===============================================
:*:tttt::
Send thanks
return
;============
:*:llll::
; Send Hi, can you wait a bit? I have to finish here. I will try to quickly
Send Hi, can you wait a bit? I have to finish here.
return
;============
:*:mnm::
Send Hi, after map
return
;===============================================
; При двойном нажатии на 6 появляются - исчезают цифры на вкладке с мапами
~6::
if (A_PriorHotkey <> "~6" or A_TimeSincePriorHotkey > 500)	; Макс. промежуток между нажатиями для срабатывания
{
	KeyWait, 6
	return
}
if VarMapsTierGui = 0
{
	Run, %A_ScriptDir%\res\ahk\gui\MapStashTabTiers.ahk
	Sleep, 20
	VarMapsTierGui := 1
}
else if VarMapsTierGui = 1
{
	SetTitleMatchMode, 2
	DetectHiddenWindows, On
	WinClose, MapStashTabTiers.ahk - AutoHotkey v
	Sleep, 20
	VarMapsTierGui := 0
}
return
;===============================================
;=====================
#IfWinActive
;=====================
;!тут ПоЕ-онли заканчиваеца!!!!!!!!!!!!!!!!!!!
;###############################################################################################################################################
;==========================================================================================
;        тут ПоЕ-онли заканчиваеца            =============================================
;==========================================================================================
;===============================================
; ^!sc52::
^sc52::
if VarDopBinds = 0
{
	Run, %A_ScriptDir%\res\ahk\other\Fhase Run and vaal gems.ahk
	VarDopBinds := 1
}
else if VarDopBinds = 1
{
	SetTitleMatchMode, 2
	DetectHiddenWindows, On
	WinClose, Fhase Run and vaal gems.ahk - AutoHotkey v
	VarDopBinds := 0
}
return
;==========================================================================================
;скролл браузера
#IfWinActive ahk_group browser
^WheelDown:: SendInput, ^{Tab}
return
^WheelUp:: SendInput, ^+{Tab}
return
;=============================================
;Enter на поетрейде на Ctrl+D
^sc20::
BlockInput On
SendInput, {Enter}
BlockInput Off
return
;=============================================
#IfWinActive
;=============================================
;=============================================
#IfWinActive ahk_group poe
;=============================================
; антиматфильтр
:*:ебать::
Send е6ать
return
;========
:*:хуй::
Send xуй
return
;========
:*:блядь::
Send 6лядь
return
;=============================================
; автокликер на b+mouse3
; If GetKeyState("sc30", "P")
; ~MButton::
; SendInput, {Ctrl down}
; loop
; {
	; SendInput, {Click}
	; Sleep, % Sleepfunction(100, 150)
	; if (!GetKeyState("sc30", "P"))
	; {
		; SendInput, {Ctrl up}
		; break
	; }
; }
; return
;=============================================
; Автокликер на Ctrl+Mouse3
^MButton::
If GetKeyState("MButton", "P")
loop
{
	SendInput, ^{Click}
	Sleep, % Sleepfunction(40, 60)
	if (!GetKeyState("MButton", "P"))
	{
		SendInput, {Ctrl up}
		break
	}
}
return
;=============================================
#IfWinActive
;=============================================
; Рестарт PoE-Wingman
F9::
Run, D:\PoE soft\ярлыки\PoE-Wingman.lnk
return
;=============================================



