#Persistent
#include %A_ScriptDir%\res\ahk\gui\res\ToolTipFont.ahk
; #include %A_ScriptDir%\res\ahk\other\Stash_jump.ahk
CoordMode, Mouse, Screen
SetDefaultMouseSpeed, 3
; #SingleInstance Force
;==============================================
VarMapsTierGui := 0
VarDopBinds := 0
VarAntiAfk := 0
VarBlightClicker := 0
Var_stash_jump := 0
;==============================================
;==============================================
GroupAdd, poe, ahk_exe PathOfExile.exe
GroupAdd, poe, ahk_exe PathOfExile_x64.exe
GroupAdd, poe, ahk_exe notepad.exe ; for test
GroupAdd, browser, ahk_exe firefox.exe
GroupAdd, browser, ahk_exe chrome.exe
GroupAdd, trade, ahk_exe Awakened PoE Trade.exe
GroupAdd, browser_and_trade, ahk_exe chrome.exe
GroupAdd, browser_and_trade, ahk_exe Awakened PoE Trade.exe
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
; скролл сундука на 8 вкладок на Shift+Scroll
+WheelUp::
SendInput, {Left 6}
Sleep, 200
return
+WheelDown::
SendInput, {Right 6} 
Sleep, 200
return
; ===================
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
; вписывать цены в 1 клик на Crtl+(1-3)
$^1::
sc149::
run, %A_ScriptDir%\res\ahk\gui\Fast_Price.ahk
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
; антиматфильтр
:*:ебать::е6ать
:*:хуй::xуй
:*:хуйню::xуйню
:*:хуйня::xуйня
:*:блядь::6лядь
:*:проебал::прое6ал
:*:нихуя::ниxуя
:*:дохуя::доxуя
:*:пиздец::пи3дец
:*:дохуя::доxуя
;=============================================
:*:сдача::can you give change if i pay only exalts?
:*:sdacha::can you give change if i pay only exalts?
:*:alll::Do you have more? I can buy everything
:*:bmmm::Sorry, I busy on Blighted Map. Ask Chris to make trade possible while mapping.
:*:blll::Sorry, I busy on Blighted Map. Ask Chris to make trade possible while mapping.
return
;=============================================

; Дымовая мина
; ~sc10::
; Sleep, 300
; SendInput, 6
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
; 8::
; MsgBox,,, % testfunc(Rnd(11, 12), Rnd(13, 14), Sleepfunction(10, 20))
; return
;=============================================

;=============================================

;=============================================
; Написать дисе на Ctrl+del
^sc153::
ClipSaved := ClipboardAll
Sleep, % Sleepfunction(40, 60)
SendInput, {sc147}
Sleep, % Sleepfunction(40, 60)
Clipboard = @Ryan_Madison 
Sleep, % Sleepfunction(40, 60)
SendInput, ^{sc2F}
Sleep, % Sleepfunction(40, 60)
SendInput, {Space}
Sleep, % Sleepfunction(40, 60)
Clipboard := ClipSaved
return
;=============================================
;=====================
#IfWinActive
;=====================
;!тут ПоЕ-онли заканчиваеца!!!!!!!!!!!!!!!!!!!
;###############################################################################################################################################
;==========================================================================================
;        тут ПоЕ-онли заканчиваеца            =============================================
;==========================================================================================
;==========================================================================================
;скролл браузера
#IfWinActive ahk_group browser
^WheelDown:: SendInput, ^{Tab}
return
^WheelUp:: SendInput, ^+{Tab}
return
#IfWinActive
;=============================================
;Enter на Ctrl+D на поетрейде и Awakened PoE Trade
#IfWinActive ahk_group browser_and_trade
^sc20::
BlockInput On
SendInput, {Enter}
BlockInput Off
return
#IfWinActive
;=============================================
; Gui для прайса на Win+Mouse3	
#Mbutton::
!+Mbutton::
!Mbutton::
SetTitleMatchMode, 2
DetectHiddenWindows, On
WinClose, %A_ScriptDir%\res\ahk\gui\Price.ahk - AutoHotkey v ; Закрывает скрипт, если он открыт, а то он тупит, если перезапускать с открытым.
Sleep, 20
SetTitleMatchMode, 1
Sleep, 20
run, %A_ScriptDir%\res\ahk\gui\Price.ahk
return	
;=============================================
^sc52::
SoundBeep, 1000, 100
SoundBeep, 500, 100
Sleep, 40
Run, %A_ScriptDir%\reload.ahk
return
;=============================================
:*:123123::
SoundBeep, 1000, 100
SoundBeep, 500, 100
Sleep, 40
Run, %A_ScriptDir%\reload.ahk
return
;=============================================












