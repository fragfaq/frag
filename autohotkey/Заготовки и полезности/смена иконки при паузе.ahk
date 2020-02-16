;==============================================
Пауза скрипта и смена иконки на Shift+F
OnMessage(0x111, "WM_COMMAND")
Return
; ===================
+sc21::PauseFunc()
; ===================
PauseFunc()
{
	static pause
	Pause, toggle, 1
	Menu, Tray, Icon, % (pause := !pause) ? "res\pic\stop3.png" : "res\pic\play3.png",1,1
	Return true
}
; ========
WM_COMMAND(wp){
	if (wp = 65306)
		Return PauseFunc()
}
return
;==============================================