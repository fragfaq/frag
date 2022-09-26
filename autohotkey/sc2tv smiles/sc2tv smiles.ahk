Menu, Tray, Icon, 1.ico, 1
;=============================================
; GroupAdd, smile, ahk_exe firefox.exe
GroupAdd, smile, ahk_exe chrome.exe
; GroupAdd, smile, ahk_exe Skype.exe
GroupAdd, smile, ahk_exe Discord.exe
GroupAdd, smile, ahk_exe Telegram.exe
;=============================================
#IfWinActive ahk_group smile
;=============================================
F1::
Sleep, 200
SendInput, {space}:five:{space}
Sleep, 200
return
;=============================================
F2::
Sleep, 200
SendInput, {space}:joyful:{space}
Sleep, 200
return
;=============================================
F4::
Sleep, 200
SendInput, {space}:gusta:{space}
Sleep, 200
return
;=============================================
F8::
Sleep, 200
SendInput, {space}:anigandalf:{space}
Sleep, 200
return
;=============================================
F9::
Sleep, 200
SendInput, {space}:anigglord:{space}
Sleep, 200
return
;=============================================
F10::
Sleep, 200
SendInput, {space}:happy:{space}
Sleep, 200
return
;=============================================
F11::
Sleep, 200
SendInput, {space}:peka:{space}
Sleep, 200
return
;=============================================
F12::
Sleep, 200
SendInput, {space}:grumpy:{space}
Sleep, 200
return
;=============================================
+F12::
BlockInput On
Send, {F12}
BlockInput Off
return
;=============================================
^WheelDown:: Send ^{Tab}
return
^WheelUp:: Send ^+{Tab}
return
;=============================================
#IfWinActive
;=============================================
;перезапуск скрипта на Control+F4
^F4::
Reload
return
;=============================================