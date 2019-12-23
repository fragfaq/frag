;Menu, Tray, Icon, res\pic\1.ico, 1
;==============================================
GroupAdd, poe, ahk_exe PathOfExile.exe
GroupAdd, poe, ahk_exe PathOfExile_x64.exe
GroupAdd, bowser, ahk_exe firefox.exe
GroupAdd, browser, ahk_exe chrome.exe
;==============================================
;перезапуск скрипта на Control+r
^sc13::
Reload
return
;=============================================

flusks5678()
{
run,  "res\ahk\local\fl\flusks5678.ahk" \res\ahk\local\
}
flusks678()
{
run,  "res\ahk\local\fl\flusks678.ahk" \res\ahk\local\
}
#If (Var = 1)
	sc3::SendInput, {sc2}
	sc4::flusks5678()
	sc5::flusks5678()
	sc20::flusks5678()
	SetScrollLockState, On
#if ; End #if (Var = 1)
#If (Var = 2)
	sc3::SendInput, {sc3}
	sc4::SendInput, {sc4}
	sc5::SendInput, {sc5}
	sc20::SendInput, {sc20}
	SetScrollLockState, Off
#if ; End #if (Var = 2)







;=============================================================================
F3::
If (On){ ; var = 2
SetScrollLockState, AlwaysOn
Gui, Font, S40 C00ff00 Bold, forque
Gui, Font, S80 Cff0000 Bold, forque
Gui, Add, Text, x-50 y20 w480 h100 +Center, T E X T
Gui, Add, Text, x60 y120 w290 h180, M O D E
Gui, Show, x717 y401 h212 w350, New GUI Window
Gui, -Caption
Gui, Color, Black
sleep, 900
Gui , Destroy
Var = 2
On := False
} Else { ; var = 1
SetScrollLockState, AlwaysOff
Gui, Font, S40 C00ff00 Bold, forque
Gui, Font, S80 Cff0000 Bold, forque
Gui, Add, Text, x-50 y20 w480 h100 +Center, W A R
Gui, Add, Text, x60 y120 w290 h180, M O D E
Gui, Show, x717 y401 h212 w350, New GUI Window
Gui, -Caption
Gui, Color, Black
sleep, 900
Gui , Destroy
Var = 1
On := true
}
Return 

;=============================================================================


















#IfWinActive