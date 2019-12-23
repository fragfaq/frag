;==============================================
; Ctrl+0 или Shift+0 или Ctrl+Alt+Num_3 - пауза
; Ctrl+9 или Shift+9 - возобновление
;==============================================
; SoundBeep, 60, 50
; Sleep, 5000
; SoundBeep, 60, 50
Loop
{
	random, VarFlask11, 65, 95
	random, VarFlask12, 65, 95
	random, VarFlask13, 65, 95
	random, VarFlask14, 65, 95
	random, VarFlask15, 65, 95
	random, VarFlask16, 65, 95
	random, VarLoopCD, 4600, 4800
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
	sleep, %VarLoopCD% 
}
Return
/*
;=====================
^scB::
+scB::
^!sc51::
SoundBeep, 60, 50                 ; Приостановка
If not Stop
{
	Stop := True
	Pause
}
Return
;============================================================
^scA::
+scA::
SoundBeep, 60, 50                  ; Возобновление
If Stop
{
	Stop := False
	Pause
}
Return
*/
;=============================================
^!+F12::ExitApp ; Закрытие скрипта при отправке нажатия из основного скрипта, или при перезагрузке основного скрипта
