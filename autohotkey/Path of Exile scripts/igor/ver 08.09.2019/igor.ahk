;=============================================
GroupAdd, poe, ahk_exe PathOfExile.exe
GroupAdd, poe, ahk_exe PathOfExile_x64.exe
;=============================================
#IfWinActive ahk_group poe
;=============================================
; Функция для рандомного интервала между нажатиями
Sleepfunction(min, max)
{
	random, randb, min, max
	return randb
}
;=============================================
;  Сами нажатия
sc4::
Sleep, % Sleepfunction(50, 80)
SendInput, {sc4} ; пьется фласка с биндом на цифру 3
Sleep, % Sleepfunction(50, 80)
SendInput, {sc5} ; пьется фласка с биндом на цифру 4
Sleep, % Sleepfunction(50, 80)
SendInput, {sc6} ; пьется фласка с биндом на цифру 5
;=============================================
;перезапуск скрипта на Control+r
; ^sc13::
; Reload
; return
;=============================================