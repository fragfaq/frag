; #SingleInstance off
#SingleInstance force
CoordMode, Pixel, Relative
;==============================================
Sleepfunction(min, max)
{
	random, randb, min, max
	return randb
}
;==============================================
GroupAdd, poe, ahk_exe PathOfExile.exe
GroupAdd, poe, ahk_exe PathOfExile_x64.exe
;=======================================
#include %A_ScriptDir%\gui\res\ToolTipFont.ahk
;=======================================
#NoTrayIcon
;=======================================
Var_links = 0
VarFromIni = %A_ScriptDir%\other\Send_Phase_Run.txt
;=======================================
ToolTipFont("s18", "Verdana")
ToolTipColor("Black", "White")
;=======================================
#IfWinActive ahk_group poe
;=======================================
MyEdit1_TT := "Intervention:`n1: Химера`n2: Рин`n3: Жордин`n `nFortification:`n1:Хилок"
MyEdit2_TT := "Запуск и`nперезапуск`nскрипта с`nфласками"
MyEdit3_TT := "Запуск и`nперезапуск`nопределения`nбафов,`nдебафов`nи т.д."
MyEdit4_TT := "Links"
MyEdit5_TT := "Autoreply"
MyEdit6_TT := "Restart`nscript"
MyEdit7_TT := "Autoreply`nEdit"
MyEdit8_TT := ""
;===============
Gui, +LastFound +AlwaysOnTop +ToolWindow +OwnDialogs
; размер шрифта
Gui, Font, S16 W700, Verdana
; поле edit и его параметры
Gui, Color, 666666, 666666
Gui, Add, Edit, x0 y30 w40 h30 Limit2 Number, 00
; кнопка подсказки по бандитам
Gui, Add, Picture, x36 y20 w50 h50 vMyEdit1 gBandits 0x0100, %A_ScriptDir%\pic\Jun.png
Gui, Add, Picture, x80 y20 w30 h50 vMyEdit2 gFlask 0x0100, %A_ScriptDir%\pic\Life_flask1.png
Gui, Add, Picture, x160 y25 w40 h40 vMyEdit3 gSkills 0x0100, %A_ScriptDir%\gui\res\pic\Blood_Rage_skill_icon.png
Gui, Add, Picture, x200 y25 w40 h45 vMyEdit4 gLinks 0x0100, %A_ScriptDir%\pic\Fixed_Fossil.png
Gui, Add, Picture, x237 y35 w27 h27 vMyEdit5 gAutoreply 0x0100, %A_ScriptDir%\pic\autoreply1.png
Gui, Add, Picture, x265 y37 w30 h30 vMyEdit6 gRestart 0x0100, %A_ScriptDir%\pic\Herald_of_Purity_skill_icon1.png
Gui, Add, Picture, x0 y0 w30 h30 vMyEdit7 gAutoreplyEdit 0x0100, %A_ScriptDir%\pic\Edit.ico
; Gui, Add, Picture, x530 y37 w22 h25 vMyEdit8 gPhase_Run 0x0100, %A_ScriptDir%\pic\W.png
; окно Gui
OnMessage(0x200, "WM_MOUSEMOVE")
Gui, Show, x0 y1020 w900 h30, Expa Gui
; прозрачность
Gui, Color, 000001
WinSet, TransColor, 000001
Gui, -Caption
return
;===============
; Функция для тултипов при наведении:
WM_MOUSEMOVE()
{
	static PrevControl, _TT  ; _TT is defined as a static variable (blank) for use by the ToolTip command below.
	CurrControl := A_GuiControl
	If (CurrControl <> PrevControl)
	{
		ToolTip, % %CurrControl%_TT
		SetTimer, RemoveToolTip, 4000
		PrevControl := CurrControl
	}
}
RemoveToolTip:
ToolTip
return
;========================================================================
;========================================================================
;========================================================================
Bandits:
return
;=======================================
Flask:
SetTitleMatchMode, 2
DetectHiddenWindows, On
WinClose, HP flask.ahk - AutoHotkey v
sleep, 50
WinClose, CI flask.ahk - AutoHotkey v
sleep, 100
Run, %A_ScriptDir%\flask\HP flask.ahk
return
;=======================================
Skills:
SetTitleMatchMode, 2
DetectHiddenWindows, On
WinClose, Skills detect.ahk - AutoHotkey v
Run, %A_ScriptDir%\gui\Skills detect.ahk
return
;=============================================
Links:
If Var_links = 0
{
	Gui, 2:-Caption
	Gui, 2:+AlwaysOnTop +ToolWindow +OwnDialogs
	Gui, 2:Font, S16 W900 c00ff00, Verdana
	Gui, 2:Add, Text, gPoeninja, PoeNinja
	Gui, 2:Add, Text, y+1 gCurrency, Currency
	Gui, 2:Add, Text, y+1 gIncubators, Incubators
	Gui, 2:Add, Text, y+1 gScarabs, Scarabs
	Gui, 2:Add, Text, y+1 gFossils, Fossils
	Gui, 2:Add, Text, y+1 gEssences, Essences
	Gui, 2:Add, Text, y+1 gDivination, Divination
	Gui, 2:Add, Text, y+1 gBeasts, Beasts
	Gui, 2:Font, S16 W900 c006633, Verdana
	Gui, 2:Add, Text, y+1, Trade:
	Gui, 2:Add, Text, y+1 gItemsTrade, Items
	Gui, 2:Add, Text, y+1 gCurrencyTrade, Currency
	Gui, 2:Font, S16 W900 cC1FA00, Verdana
	Gui, 2:Add, Text, y+1, Wiki:
	Gui, 2:Add, Text, y+1 gEnWiki, EN
	Gui, 2:Add, Text, y+1 gRuWiki, RU
	Gui, 2:Add, Text, y+1 gPoeDB, PoeDB
	Gui, 2:Color, 151515
	Gui, 2:Show, Center NoActivate, Links

	Var_links := 1
}
else If Var_links = 1
{
	Gui, 2:Destroy
	Var_links := 0
}
return
;============
Poeninja:
Run, https://poe.ninja/
Gui, 2:Destroy
return
Currency:
Run, https://poe.ninja/challenge/currency
Gui, 2:Destroy
return
Incubators:
Run, https://poe.ninja/challenge/incubators
Gui, 2:Destroy
return
Scarabs:
Run, https://poe.ninja/challenge/scarabs
Gui, 2:Destroy
return
Fossils:
Run, https://poe.ninja/challenge/fossils
Gui, 2:Destroy
return
Essences:
Run, https://poe.ninja/challenge/essences
Gui, 2:Destroy
return
Divination:
Run, https://poe.ninja/challenge/divinationcards
Gui, 2:Destroy
return
Beasts:
Run, https://poe.ninja/challenge/beasts
Gui, 2:Destroy
return
ItemsTrade:
Run, https://www.pathofexile.com/trade/
Gui, 2:Destroy
return
CurrencyTrade:
Run, https://www.pathofexile.com/trade/exchange/Legion
Gui, 2:Destroy
return
EnWiki:
Run, https://pathofexile.gamepedia.com/Path_of_Exile_Wiki
Gui, 2:Destroy
return
RuWiki:
Run, https://pathofexile-ru.gamepedia.com/Path_of_Exile_Wiki
Gui, 2:Destroy
return
PoeDB:
Run, http://poedb.tw/
Gui, 2:Destroy
return
;============================
Autoreply:
FileRead, Autoreply_Text, %A_ScriptDir%\pic\Autoreply.ini
Sleep, % Sleepfunction(40, 60)
IfWinNotActive, ("ahk_class POEWindowClass")
{
	WinActivate, Path of Exile
}
SendInput, {Enter}
Sleep, % Sleepfunction(40, 60)
SendInput, {/}
Sleep, % Sleepfunction(40, 60)
SendInput, Autoreply
Sleep, % Sleepfunction(40, 60)
SendInput, {Space}
Sleep, % Sleepfunction(40, 60)
SendInput, %Autoreply_Text%
Sleep, % Sleepfunction(40, 60)
SendInput, {Enter}
return
;============================
AutoreplyEdit:
InputBox, Autoreply_text, enter text, Enter text for autoreply
Sleep, 500
If ErrorLevel = 0
{
	FileDelete, %A_ScriptDir%\pic\Autoreply.ini
	Sleep, 100
	FileAppend, %Autoreply_text%, %A_ScriptDir%\pic\Autoreply.ini
}
return
;===============================================
#IfWinActive
;===============================================
; Phase_Run:
; IfWinNotActive, ("ahk_class POEWindowClass")
; {
	; WinActivate, Path of Exile
; }
; Sleep, 100
; SendLevel 1
; SendInput, !{0}
; FileDelete, %VarFromIni%
; FileAppend, 1, %A_ScriptDir%\other\Send_Phase_Run.ini

; return
;===============================================
Restart:
Reload
return
;=============================================


