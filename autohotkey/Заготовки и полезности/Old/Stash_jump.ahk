Rnd(start, predel) {
	random, randb, 1, predel
	coordinata = start + %random%
	return coordinata
}
;========
Sleepfunction(min, max) {
	random, randb, min, max
	return randb
}
;========
testfunc(param1, param2, param3) {
	Sleep, param3
	MouseMove, param1, param2 ,  2
	Sleep, param3
	Click left
}

testfunc(Rnd(start, predel), Rnd(start, predel), Sleepfunction(min, max), Sleepfunction(min, max))




; ========
; Close_Auto_Phase_Run_Gui() {
	; Sleep, 20
	; SetTimer, Fhase_Run, off
	; Sleep, 20
	; SetTimer, Tempest_shield, off
	; Sleep, 20
	; SetTimer, Enduring_Cry, off
	; Sleep, 20
	; SetTimer, Convocation, off
	; Sleep, 20
	; SetTimer, VolatileDead, off
	; Sleep, 20
	; SetTitleMatchMode, 2
	; DetectHiddenWindows, On
	; WinClose, Auto Phase Run Gui.ahk - AutoHotkey v
	; Sleep, 20
	; WinClose, Auto Enduring Cry Gui.ahk - AutoHotkey v
	; Sleep, 20
	; WinClose, Auto Tempest shield Gui.ahk - AutoHotkey v
	; Sleep, 20
	; VarAutoPhaseRun := 0
	; VarAutoTempestShield := 0
	; VarAutoEnduringCry := 0
	; VarAutoConvocation := 0
	; VarAutoVolatileDead := 0
; }
; ========
; ConvocationOff() {
	; SetTimer, Convocation, off
	; Sleep, 20
	; SetTitleMatchMode, 2
	; DetectHiddenWindows, On
	; WinClose, Auto Tempest shield Gui.ahk - AutoHotkey v
	; Sleep, 20
	; VarAutoConvocation := 0
; }
; ========
; FhaseRun_On_Off() {
	; IfWinNotActive, ("ahk_class POEWindowClass")
	; {
		; WinActivate, Path of Exile
	; }
	; Sleep, 40
	; if VarAutoPhaseRun = 0
	; {	
		; SetTitleMatchMode, 2
		; DetectHiddenWindows, On
		; IfWinActive ahk_class POEWindowClass
		; SendInput, 9
		; Sleep, % Sleepfunction(40, 60)
		; SetTitleMatchMode, 2
		; DetectHiddenWindows, On
		; IfWinActive ahk_class POEWindowClass
		; Sleep, 20
		; SendInput, 0
		; Sleep, 20
		; SetTimer, Fhase_Run, % Sleepfunction(4200, 4400)
		; Sleep, 20
		; Run, %A_ScriptDir%\res\Auto Phase Run Gui.ahk
		; Sleep, 20
		; SoundBeep, 60, 50
		; VarAutoPhaseRun := 1
		; Sleep, 500
	; }
	; else if VarAutoPhaseRun = 1
	; {
		; SetTimer, Fhase_Run, off
		; Sleep, 20
		; SetTitleMatchMode, 2
		; DetectHiddenWindows, On
		; WinClose, Auto Phase Run Gui.ahk - AutoHotkey v
		; Sleep, 20
		; SoundBeep, 60, 50
		; VarAutoPhaseRun := 0
		; Sleep, 1500
	; }
; }
; ========
; TempestShield_On_Off() {
	; IfWinNotActive, ("ahk_class POEWindowClass")
	; {
		; WinActivate, Path of Exile
	; }
	; Sleep, 40
	; if VarAutoTempestShield = 0
	; {
		; SetTitleMatchMode, 2
		; DetectHiddenWindows, On
		; IfWinActive ahk_class POEWindowClass
		; Sleep, % Sleepfunction(40, 60)
		; IfWinActive ahk_class POEWindowClass
		; Sleep, 20
		; SetTimer, Tempest_shield, % Sleepfunction(17000, 18000)
		; Sleep, 20
		; Run, %A_ScriptDir%\res\Auto Tempest shield Gui.ahk
		; Sleep, 20
		; SoundBeep, 60, 50
		; VarAutoTempestShield := 1
		; Sleep, 500
	; }
	; else if VarAutoTempestShield = 1
	; {
		; SetTimer, Tempest_shield, off
		; Sleep, 20
		; SetTitleMatchMode, 2
		; DetectHiddenWindows, On
		; WinClose, Auto Tempest shield Gui.ahk - AutoHotkey v
		; Sleep, 20
		; SoundBeep, 60, 50
		; VarAutoTempestShield := 0
		; Sleep, 1500
	; }
; }
; ========
; WarCry_On_Off() {
	; IfWinNotActive, ("ahk_class POEWindowClass")
	; {
		; WinActivate, Path of Exile
	; }
	; Sleep, 40
	; if VarAutoEnduringCry = 0
	; {
		; SetTitleMatchMode, 2
		; DetectHiddenWindows, On
		; IfWinActive ahk_class POEWindowClass
		; SendInput, {sc13}
		; Sleep, % Sleepfunction(40, 60)
		; SetTimer, Enduring_Cry, % Sleepfunction(3060, 4600)
		; Sleep, 20
		; Run, %A_ScriptDir%\res\Auto Enduring Cry Gui.ahk
		; Sleep, 20
		; VarAutoEnduringCry := 1
	; }
	; else if VarAutoEnduringCry = 1
	; {
		; SetTimer, Enduring_Cry, off
		; Sleep, 20
		; SetTitleMatchMode, 2
		; DetectHiddenWindows, On
		; WinClose, Auto Enduring Cry Gui.ahk - AutoHotkey v
		; Sleep, 20
		; VarAutoEnduringCry := 0
	; }
; }
; ========
; PhaseRun_On_if_Off() {
	; IfWinNotActive, ("ahk_class POEWindowClass")
	; {
		; WinActivate, Path of Exile
	; }
	; Sleep, 40
	; if VarAutoPhaseRun = 1
	; {
		; Sleep, 20
	; }
	; else if VarAutoPhaseRun = 0
	; {
		; SendInput, 9
		; Sleep, % Sleepfunction(60, 120)
		; SendInput, 0
		; SetTimer, Fhase_Run, % Sleepfunction(4200, 4400)
		; Sleep, 20
		; Run, %A_ScriptDir%\res\Auto Phase Run Gui.ahk
		; Sleep, 20
		; SoundBeep, 60, 50
		; VarAutoPhaseRun := 1
		; WinActivate, Path of Exile
	; }
; }
;========






























































