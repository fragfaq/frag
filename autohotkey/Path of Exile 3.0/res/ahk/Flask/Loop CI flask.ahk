Menu, Tray, Icon, %A_ScriptDir%\res\swap.ico, 1
;=============================================
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
;=============================================
^!+F12::ExitApp ; Закрытие скрипта при отправке нажатия из основного скрипта, или при перезагрузке основного скрипта
