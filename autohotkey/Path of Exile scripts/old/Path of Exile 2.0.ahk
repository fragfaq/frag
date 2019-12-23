Menu, Tray, Icon, res\pic\1.ico, 1
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
;Запуск приложений:
;=============================================
;Запуск PoE на Control+Alt+Backspace
^!Backspace::
Run, "E:\Path of Exile\Client.exe", E:\Path of Exile\
return
;=============================================
;Запуск/перезапуск PoEMonitor на Control+Alt+PgDn
^!PgDn::
Process close, PoEMonitor.exe
sleep, 1000
Run, "E:\PoE soft\PoEMonitor.lnk", E:\PoE soft\
return
;=============================================
;запуск POE-TradeMacro на Control+Alt+0
^!0::
Run, "E:\PoE soft\TradeMacro.lnk", E:\PoE soft\
return
;=============================================
#IfWinActive ahk_group poe
;==========================================================================================
;         Запускаемые скрипты                 =============================================
;==========================================================================================
;Запуск скриптов:
;=============================================
;сброс диалога
F4::
Run, "res\ahk\local\F4.ahk", \res\ahk\local\
return
;=============================================
;remaining
F12::
Run, "res\ahk\local\F12.ahk", \res\ahk\local\
return
;=============================================
;sell all on F5
F5::
Run, "res\ahk\local\F5.ahk" \res\ahk\local\
return
;=============================================
;clear
F8::
Run, "res\ahk\local\F8.ahk", \res\ahk\local\
return
;=============================================
;hideout
F10::
Run, "res\ahk\local\F10.ahk", \res\ahk\local\
return
;=============================================
;Лив из пати на Page Up
sc149::
Run, "res\ahk\local\Page Up.ahk", \res\ahk\local\
return
;=============================================
;PoEMonitor test на Control+Alt+t
^!sc14::
Run, "res\ahk\dialog\Control+Alt+t.ahk", \res\ahk\dialog\
return
;=============================================
;Shift+Alt+S - Control+mouse1 20 раз (автопокупка)
+!sc1F::
Run, "res\ahk\local\Shift+Alt+s.ahk", \res\ahk\local\
return
;=============================================
;Shift+Alt+q - Shift+mouse1 10 раз (автозаточка)
;Run, "res\ahk\local\Shift+Alt+q.ahk" \res\ahk\local\
+!sc10::
Loop, 10
{
Random, vS1, 100, 190
Sleep, %vS1%
SendInput, +{LButton}
}
return
;=============================================
;Alt+m = hi, after map
!sc32::
Run, "res\ahk\dialog\Alt+m.ahk" \res\ahk\dialog\
return
;=============================================
;Alt+l = hi, after lab
!sc26::
Run, "res\ahk\dialog\Alt+l.ahk" \res\ahk\dialog\
return
;=============================================
;Alt+1 = 1 min plz
!sc2::
Run, "res\ahk\dialog\Alt+1.ahk" \res\ahk\dialog\
return
;=============================================
;Alt+h = my hideout
!sc23::
Run, "res\ahk\dialog\Alt+h.ahk" \res\ahk\dialog\
return
;=============================================
;Shift+s & Alt+s = sold, sorry
!sc1F::
Varsold()
return
+sc1F::
Varsold()
return
Varsold(){
Run, "res\ahk\dialog\Shift+s & Alt+s.ahk" \res\ahk\dialog\
}
return
;=============================================
;ty for insert
insert::
Run, "res\ahk\dialog\insert.ahk" \res\ahk\dialog\
return
;=============================================
;exit на вперед и назад
Browser_Back::
Varexit()
return
Browser_Forward::
Varexit()
return
Varexit(){
Run, "res\ahk\local\arrows.ahk" \res\ahk\local\
}
;=============================================
;сообщение в гильду на Del
sc153::
Run, "res\ahk\dialog\Del.ahk" \res\ahk\dialog\
return
;=============================================
;сообщение в Local на Home
sc14F::
Run, "res\ahk\dialog\Home.ahk" \res\ahk\dialog\
return
;=============================================
;/autoreply на Control+Alt+a
^!sc1E::
Run, "res\ahk\dialog\autoreply.ahk" \res\ahk\dialog\
return
;=============================================
;Shift+Alt+q - Shift+mouse1 10 раз (автозаточка)
Run, "res\ahk\local\Shift+Alt+q.ahk" \res\ahk\local\
return
;==========================================================================================
;         локальные скрипты                   =============================================
;==========================================================================================
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
;Control+s = Esc
^sc1F::
BlockInput On
SendInput, {Esc}
BlockInput Off
return
;=============================================
;пить фласку на четверку и на тильту
;`::sc20
return
;=============================================
#IfWinActive
;!тут ПоЕ-онли заканчиваеца!!!!!!!!!!!!!!!!!!!
;###############################################################################################################################################
;==========================================================================================
;        тут ПоЕ-онли заканчиваеца            =============================================
;==========================================================================================
;Tier - LvL Gui
*F4::
{
Gui, +LastFound +AlwaysOnTop +ToolWindow +OwnDialogs
Gui, Add, Picture, x0 y0 ,res\pic\tier.PNG
Gui, Show, Center w267 h97, Tier - LvL
Hotkey, IfWinActive, Msgbox
}
KeyWait, F4
{
Gui Destroy
}
return
;=============================================
;скролл браузера
#IfWinActive ahk_group browser
^WheelDown:: Send ^{Tab}
return
^WheelUp:: Send ^+{Tab}
return
#IfWinActive
;=============================================
;поиск на поетрейде на Ctrl+D
^d::
BlockInput On
SendInput, {Enter}
BlockInput Off
return
;=======================================================================================================================================
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
;#If (Var = 2) ;отключение хоткеев
;	sc3::SendInput, {sc3}	;2=2
;	sc4::SendInput, {sc4}	;3=3
;	sc5::SendInput, {sc5}	;4=4
;	sc20::SendInput, {sc20}	;d=d
;#if ; End #if (Var = 2)
#If (Var = 3) ;квиксильвер
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
;!sc11:: ;определяет значение переменной
F2::
Var = 0
return
;=============================================
F1::
If Var = 0
{
Gui , Destroy
Gui, +LastFound +AlwaysOnTop +ToolWindow +OwnDialogs
Gui, Font, S15 Cffff00 Bold, Tahoma
Gui, Font, S30 Cff0000 Bold, Tahoma
Gui, 1:Add, Text, x0 y0 w250 h520 , Damag
Gui, 1:Show, x380 y930 h56 w154, New GUI Window
Gui, -Caption
;Gui, Color, Black 
;Gui, Color, [color=darkred]808080[/color]
;WinSet, TransColor, [color=darkred]808080[/color]
Var = 1
}
else if Var = 1
{
Gui , Destroy
Gui, +LastFound +AlwaysOnTop +ToolWindow +OwnDialogs
Gui, Font, S40 C00ff00 Bold, forque
Gui, Font, S80 C00ff00 Bold, forque
Gui, Add, Text, x0 y0 w240 h240 , flusk
Gui, Show, x297 y969 h86 w250, New GUI Window
Gui, -Caption
;Gui, Color, [color=darkred]808080[/color]
;WinSet, TransColor, [color=darkred]808080[/color]
Var = 2
}
else if var = 2
{
Gui, Destroy
Gui, +LastFound +AlwaysOnTop +ToolWindow +OwnDialogs
Gui, Font, S15 Cffff00 Bold, forque
Gui, Font, S30 C00ffff Bold, forque
;Gui, 1:Add, Text, x-50 y0 w250 h520 +Center, d_6_7_8
Gui, Add, Text, x0 y0 w250 h520 , Quicksilver
Gui, Show, x300 y930 h18 w251, New GUI Window
Gui, -Caption
;Gui, Color, Black
;Gui, Color, [color=darkred]808080[/color]
;WinSet, TransColor, [color=darkred]808080[/color]
Var = 3
}
else if var = 3
{
Gui, Destroy
Gui, +LastFound +AlwaysOnTop +ToolWindow +OwnDialogs
Gui, Font, S15 CF55B00 Bold, forque
Gui, Font, S30 CF55B00 Bold, forque
Gui, 1:Add, Text, x0 y0 w250 h520 , H_E_A_L
Gui, 1:Show, x380 y930 h18 w140, New GUI Window
Gui, -Caption
;Gui, Color, Black 
;Gui, Color, [color=darkred]808080[/color]
;WinSet, TransColor, [color=darkred]808080[/color]
Var = 4
}
else if var = 4
{
Gui, Destroy
Gui, +LastFound +AlwaysOnTop +ToolWindow +OwnDialogs
Gui, Font, S40 C00ff00 Bold, forque
Gui, Font, S80 C00ff00 Bold, forque
Gui, Add, Text, x0 y0 w240 h240 , flusk
Gui, Show, x297 y969 h86 w250, New GUI Window
Gui, -Caption
;Gui, Color, [color=darkred]808080[/color]
;WinSet, TransColor, [color=darkred]808080[/color]
Var = 0
}
return
;=======================================================================================================================================
`::
MsgBox, %Var%
return
