Menu, Tray, Icon, 1.ico, 1
;=============================================
GroupAdd, poe, ahk_exe PathOfExile.exe
GroupAdd, poe, ahk_exe PathOfExile_x64.exe
GroupAdd, browser, ahk_exe firefox.exe
GroupAdd, browser, ahk_exe chrome.exe
;==============================================
#IfWinActive ahk_group poe
;=============================================
F2::
BlockInput On
MouseMove, 1006, 983,
Click
MouseMove, 945, 333,
BlockInput Off
return
;=============================================
F3::
ClipSaved := ClipboardAll
Random, vS1, 100, 300
Random, vS2, 100, 300
Clipboard = /remaining
SendInput, {Enter}
Sleep, %vS1%
SendInput, ^{sc2F}
Sleep, %vS2%
SendInput, {Enter}
Clipboard := ClipSaved
return
;=============================================
F10::
ClipSaved := ClipboardAll
Random, vS1, 100, 300
Random, vS2, 100, 300
Clipboard = /hideout
SendInput, {Enter}
Sleep, %vS1%
SendInput, ^{sc2F}
Sleep, %vS2%
SendInput, {Enter}
Clipboard := ClipSaved
return
;=============================================
F8::
ClipSaved := ClipboardAll
Random, vS1, 100, 300
Random, vS2, 100, 300
Clipboard = /clear
SendInput, {Enter}
Sleep, %vS1%
SendInput, ^{sc2F}
Sleep, %vS2%
SendInput, {Enter}
Clipboard := ClipSaved
return
;=============================================
;Лив из пати на Page Up
sc149::
ClipSaved := ClipboardAll
Random, vS1, 100, 300
Random, vS2, 100, 300
Clipboard = /kick Pathfinder_EA
SendInput, {Enter}
Sleep, %vS1%
SendInput, ^{sc2F}
Sleep, %vS2%
SendInput, {Enter}
Clipboard := ClipSaved
return
;=============================================
;пить фласку на четверку и на тильту
`::4
return
;=============================================
;Тройка на Shift+C
+sc2E::
ClipSaved := ClipboardAll
Random, vS1, 100, 190
Random, vS2, 100, 190
Clipboard = 3
Sleep, %vS1%
SendInput, ^{sc2F}
Sleep, %vS2%
Clipboard := ClipSaved
return
;=============================================
;Control+Alt+t - написать себе (тест PoEMonitor)
^!sc14::
ClipSaved := ClipboardAll
Random, vS1, 100, 190
Random, vS2, 100, 190
Clipboard = @FRAG_RoA
Sleep, %vS1%
SendInput, ^{sc2F}
Sleep, %vS2%
Clipboard := ClipSaved
return
;=============================================
;Shift+Alt+b - Control+mouse1 20 раз
+!sc30::
Loop, 20
{
Random, vS1, 100, 190
Sleep, %vS1%
SendInput, ^{LButton}
}
return
;=============================================
;Shift+Alt+q - Shift+mouse1 10 раз
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
ClipSaved := ClipboardAll
Random, vS1, 100, 190
Random, vS2, 100, 190
Clipboard =  hi, after map
Sleep, %vS1%
SendInput, ^{sc2F}
Sleep, %vS2%
Clipboard := ClipSaved
return
;=============================================
;Alt+l = hi, after lab
!sc26::
ClipSaved := ClipboardAll
Random, vS1, 100, 190
Random, vS2, 100, 190
Clipboard =  hi, after lab
Sleep, %vS1%
SendInput, ^{sc2F}
Sleep, %vS2%
Clipboard := ClipSaved
return
;=============================================
;Alt+1 = 1 min plz
!sc2::
ClipSaved := ClipboardAll
Random, vS1, 100, 190
Random, vS2, 100, 190
Clipboard = 1 min plz
Sleep, %vS1%
SendInput, ^{sc2F}
Sleep, %vS2%
Clipboard := ClipSaved
return
;=============================================
;Alt+h = my hideout
!sc23::
ClipSaved := ClipboardAll
Random, vS1, 100, 190
Random, vS2, 100, 190
Clipboard = my hideout
Sleep, %vS1%
SendInput, ^{sc2F}
Sleep, %vS2%
Clipboard := ClipSaved
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
ClipSaved := ClipboardAll
Random, vS1, 100, 190
Random, vS2, 100, 190
Clipboard = sold, sorry
Sleep, %vS1%
SendInput, ^{sc2F}
Sleep, %vS2%
Clipboard := ClipSaved
}
return
;=============================================
;Control+s = Esc
^sc1F::
BlockInput On
SendInput, {Esc}
BlockInput Off
return
;=============================================
;ty for insert
insert::
ClipSaved := ClipboardAll
Random, vS1, 100, 190
Random, vS2, 100, 190
Clipboard = ty
Sleep, %vS1%
SendInput, ^{sc2F}
Sleep, %vS2%
Clipboard := ClipSaved
return
;=============================================
;exit на вперед и назад
Browser_Back::
BlockInput On
Process close, PathOfExile.exe
Process close, PathOfExile_x64.exe
BlockInput Off
return
;=======
Browser_Forward::
BlockInput On
Process close, PathOfExile.exe
Process close, PathOfExile_x64.exe
BlockInput Off
return
;=============================================
;сообщение в гильду с открытым чатом на Del
sc153::
ClipSaved := ClipboardAll
Random, vS1, 100, 190
Random, vS2, 100, 190
Random, vS3, 100, 190
Clipboard = &
Sleep, %vS1%
SendInput, {sc147}
Sleep, %vS2%
SendInput, ^{sc2F}
Sleep, %vS3%
Clipboard := ClipSaved
return
;======================
;сообщение в гильду с закрытым чатом на Control+Del & Shift+Del
^sc153::
Guild()
return
+sc153::
Guild()
return
Guild(){
ClipSaved := ClipboardAll
Random, vS1, 100, 190
Random, vS2, 100, 190
Random, vS3, 100, 190
Clipboard = &
SendInput, {Enter}
Sleep, %vS1%
SendInput, {sc147}
Sleep, %vS2%
SendInput, ^{sc2F}
Sleep, %vS3%
Clipboard := ClipSaved
}
return
;=============================================
;сообщение в Local с открытым чатом на Home
sc14F::
ClipSaved := ClipboardAll
Random, vS1, 100, 190
Random, vS2, 100, 190
Random, vS3, 100, 190
Random, vS4, 100, 190
Clipboard = /
Sleep, %vS1%
SendInput, {sc147}
Sleep, %vS2%
SendInput, ^{sc2F}
Sleep, %vS3%
SendInput, {scE}
Sleep, %vS4%
Clipboard := ClipSaved
return
;======================
;сообщение в Local с закрытым чатом на Control+Home & Shift+Home
^sc14F::
Local()
return
+sc14F::
Local()
return
Local(){
ClipSaved := ClipboardAll
Random, vS1, 100, 190
Random, vS2, 100, 190
Random, vS3, 100, 190
Random, vS4, 100, 190
Clipboard = /
SendInput, {Enter}
Sleep, %vS1%
SendInput, {sc147}
Sleep, %vS2%
SendInput, ^{sc2F}
Sleep, %vS3%
SendInput, {scE}
Sleep, %vS4%
Clipboard := ClipSaved
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
;пить все фласки на 3
3:: ; бинд на мышке на mouse5
Random, st1, 50, 80
Random, st2, 50, 80
sleep, %st1%
Send, 4
sleep, %st2%
Send, 5
return
;=============================================
#IfWinActive
;!тут ПоЕ-онли заканчиваеца!!!!!!!!!!!!!!!!!!!
;###############################################################################################################################################
;###############################################################################################################################################
;###############################################################################################################################################
;=============================================
;Tier - LvL Gui
*F4::
{
Gui, +LastFound +AlwaysOnTop +ToolWindow +OwnDialogs
Gui, Add, Picture, x0 y0 ,tier.PNG
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
;=============================================
;поиск на поетрейде на Ctrl+D
^d::
BlockInput On
SendInput, {Enter}
BlockInput Off
return
;=============================================
;удаляет запятую в названии шмота для poe.trade
+sc2F:: ; Shift + V
sleep, 30
SendInput, {sc147} ;end
sleep, 30
SendInput, {sc1D Down} ;LCtrl
sleep, 30
SendInput, {sc14D} ;right
sleep, 30
SendInput, {sc14D} ;right
sleep, 30
SendInput, {sc14D} ;right
sleep, 30
SendInput, {sc1D up} ;LCtrl
sleep, 30
SendInput, {sc14B} ;left
sleep, 30
SendInput, {scE} ;backspace
return
;=============================================
#IfWinActive
;=============================================
;=============================================
;Запуск PoE на Control+Alt+Backspace
^!Backspace::
Run, "E:\Path of Exile\Client.exe", E:\Path of Exile\
return
;=============================================
^!PgDn::
;Запуск/перезапуск PoEMonitor на Control+Alt+PgDn
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
;перезапуск скрипта на Control+r
^sc13::
Reload
return
;=============================================
