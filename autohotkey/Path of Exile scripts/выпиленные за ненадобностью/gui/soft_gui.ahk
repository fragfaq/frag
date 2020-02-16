Menu, Tray, NoIcon
;===========================
;---Buttons Parametrs---
B1 = x20 y290 w150 h50 ;PoE
B2 = x190 y290 w150 h50 ;TradeMacro
B3 = x360 y290 w150 h50 ;Whisper
B4 = x530 y290 w150 h50 ;MercuryTrade
B5 = x590 y20 w90 h30 ;Close
B6 = x275 y25 w150 h50 ;Ok
B9 = x20 y20 w90 h30 ;Sticker
B7 = x20 y60 w90 h30 ;Skills
B10 = x20 y100 w90 h30 ;Mousefix
B8 = x20 y140 w90 h30 ;Mousefix

;---Picture Parametrs---
P1 = x200 y10 w300 h300
;======================================================
;------------------функции софта-----------------------
;======================================================
;===========================PoE
PoEOn(){
	Run, "C:\Path of Exile\Client.exe", C:\Path of Exile\
}
PoEOff(){
	Process close, PathOfExile.exe
	Process close, PathOfExile_x64.exe
}
;===========================TradeMacro
MacroOn(){
	Run, "E:\PoE soft\TradeMacro.lnk", E:\PoE soft\
}
MacroOff(){
	fullScriptPath = E:\PoE soft\TradeMacro\_TradeMacroMain.ahk
	DetectHiddenWindows, On 
	WinClose, %fullScriptPath% ahk_class AutoHotkey
	sleep, 200
	DetectHiddenWindows, Off 
	return
}
;===========================Whisper
MonitorOn(){
	Run, "E:\PoE soft\PoEWhisperNotifier.lnk", E:\PoE soft\
}
MonitorOff(){
	Process close, PoEWhisperNotifier.exe
}
;===========================MercuryTrade
MercuryOn(){
	Run, "E:\PoE soft\MercuryTrade.lnk", E:\PoE soft\
}
	MercuryOff(){
	Process close, javaw.exe
}
;=====================================================
;------------------настройки Gui----------------------
;=====================================================
Gui, Font, s11 w700
Gui, -Caption
Gui, +ToolWindow
Gui, +AlwaysOnTop
;===========================Gui Content
Gui, Color, 000000
Gui, Add, Picture, %P1%, res\pic\PoE.png
Gui, Show, w700 h360, Run Soft
;===========================Gui Buttons
Gui, Add, Button, %B1%, PoE
Gui, Add, Button, %B2%, TradeMacro
Gui, Add, Button, %B3%, Whisper
Gui, Add, Button, %B4%, MercuryTrade
Gui, Add, Button, %B5%, Close
Gui, Add, Button, %B7% disabled, Skills
Gui, Add, Button, %B8%, Mousefix
Gui, Add, Button, %B9%, Sticker
Gui, Add, Button, %B10%, SkillsUp
return
;=====================================================
;------------------функции кнопок---------------------
;=====================================================
ButtonPoE:
PoEOn()
Sleep, 100
ExitApp
return
;=====================
ButtonTradeMacro:
MacroOff()
Sleep, 1000
MacroOn()
return
;=====================
ButtonWhisper:
MonitorOff()
Sleep, 1000
MonitorOn()
return
;=====================
ButtonMercuryTrade:
MercuryOff()
Sleep, 1000
MercuryOn()
return
;=====================
ButtonSkills:
Run, "res\ahk\gui\skills.ahk", \res\ahk\gui\
return
;=====================
ButtonSkillsUp:
Run, "res\ahk\gui\skills on top.ahk", \res\ahk\gui\
return
;=====================
ButtonMousefix:
Run, %A_AppData%\Microsoft\Windows\Start Menu\Programs\Startup\mousefix.lnk
return
;=====================
ButtonClose:
ExitApp
;=====================
ButtonSticker:
Run, "res\ahk\gui\sticker.ahk", \res\ahk\gui\
return
;==============================================
;перезапуск скрипта на Control+r
+sc13::
Reload
return
;=============================================