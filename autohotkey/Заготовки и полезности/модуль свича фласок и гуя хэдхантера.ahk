Browser_Stop::
Send, ^!+#{F12} ;close gui
sleep, 100
Var := 0
VarH := 1
return
;=============================================
;пить на 2,3,4 и d разные фласки на разные кнопки
flusks5678()
{
run,  "res\ahk\local\flusks5678.ahk" \res\ahk\local\
}
flusks678()
{
run,  "res\ahk\local\flusks678.ahk" \res\ahk\local\
}
#If (Var = 1) ;1 хилка
	sc3::SendInput, {sc2}	;2=1
	sc4::flusks5678()		;3=5,6,7,8
	sc5::flusks5678()		;4=5,6,7,8
	sc20::flusks5678()		;d=5,6,7,8
#if ; End #if (Var = 1)
#If (Var = 3) ;квиксильвер0 , 1

	sc3::SendInput, {sc2}	;2=1
	sc4::flusks678()		;3=6,7,8
	sc5::flusks678()		;4=6,7,8
	sc20::SendInput, {sc6}	;d=5
#if ; End #if (Var = 3)
#If (Var = 4) ;2 хилки
	sc3::SendInput, {sc6}	;2=5
	sc4::flusks678()		;3=6,7,8
	sc5::flusks678()		;4=6,7,8
	sc20::SendInput, {sc6}	;d=5
#if ; End #if (Var = 4)
;=============================================
F1::
If Var = 0
{
Send, ^!+#{F12} ;закрыть предыдущий gui на CTRL+ALT+SHIFT+WIN+F12
Run, "res\ahk\gui\g1 - damag.ahk", \res\ahk\gui\ ;открыть gui
Var := 1 ;сменить значение переменной
}
else if Var = 1
{
Send, ^!+#{F12} ;закрыть предыдущий гуй на CTRL+ALT+SHIFT+WIN+F12
Run, "res\ahk\gui\g2 - default.ahk", \res\ahk\gui\ ;открыть gui
send, !{scF}
Var := 2 ;сменить значение переменной
}
else if var = 2
{
Send, ^!+#{F12} ;закрыть предыдущий гуй на CTRL+ALT+SHIFT+WIN+F12
Run, "res\ahk\gui\g3 - Quicksilver.ahk", \res\ahk\gui\ ;открыть gui
Var = 3 ;сменить значение переменной
}
else if var = 3
{
Send, ^!+#{F12} ;закрыть предыдущий гуй на CTRL+ALT+SHIFT+WIN+F12
Run, "res\ahk\gui\g4 - Life Flask.ahk", \res\ahk\gui\ ;открыть gui
Var := 4 ;сменить значение переменной
}
else if var = 4
{
Send, ^!+#{F12} ;закрыть предыдущий гуй на CTRL+ALT+SHIFT+WIN+F12
Run, "res\ahk\gui\g2 - default.ahk", \res\ahk\gui\ ;открыть gui
Var := 0 ;сменить значение переменной
}
return
;=============================================
;Headhunter
!F1::
If VarH = 1
{
Send, ^!+#{F11} ;закрыть предыдущий гуй на CTRL+ALT+SHIFT+WIN+F11
Run, "res\ahk\gui\Headhunter.ahk", \res\ahk\gui\ ;открыть gui
VarH := 2
}
else if VarH = 2
{
Send, ^!+#{F11} ;закрыть предыдущий гуй на CTRL+ALT+SHIFT+WIN+F11
VarH := 1
}
return

;=============================================
Browser_Refresh:: 
Send, ^!+#{F12} ;close gui
Send, ^!+#{F11} ;close Headhunter gui
MsgBox, %Var% , %VarH%
return
;=============================================
