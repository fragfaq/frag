Menu, Tray, Icon, pic\1.ico, 1
Var := 0
;=============================================
GroupAdd, poe, ahk_exe PathOfExile.exe
GroupAdd, poe, ahk_exe PathOfExile_x64.exe
;=============================================
#IfWinActive ahk_group poe
;=============================================
;хайдаут
sc19::
Random, vho, 10, 80
BlockInput On
SendInput, {Enter}
sleep, %vho%
SendInput, {/}hideout
SendInput, {Enter}
BlockInput Off
return
#IfWinActive
;=============================================
;функция запуска скрипта прожатия фласок
flasks4567()
{
Run, "flask\flasks4567.ahk", \flask\
}
return
; условия сочетания клавиш, в зависимости от переменной
#If (Var = 0) ; default
	sc3::SendInput, {sc3}	;2=2
	!sc2::Run, "gui\g - default.ahk", \gui\
#if ; End #if (Var = 0)
#If (Var = 1) ; 2345
	sc3::flasks4567()		;2=4,5,6,7
	!sc3::Run, "gui\g - 2345.ahk", \gui\
#if ; End #if (Var = 1)
;=============================================
F3::
If Var = 0
{
Var := 1 ;сменить значение переменной
}
else if Var = 1
{
Var := 0 ;сменить значение переменной
}
return
;=============================================
;скролл сундука
^WheelUp::
Random, vLeft, 50, 100
Random, vRight, 50, 100
SendInput, {Left}
return
sleep, %vLeft%
^WheelDown::
SendInput, {Right}
sleep, %vRight%
return
;=============================================
;для проверки значения переменной
; F12::
; MsgBox, %Var%
; return
;==============================================
;перезапуск скрипта на Control+r
; ^sc13::
; Reload
; return
;=============================================