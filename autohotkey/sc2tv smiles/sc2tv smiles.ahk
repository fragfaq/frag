Menu, Tray, Icon, 1.ico, 1
;=============================================
GroupAdd, smile, ahk_exe firefox.exe
GroupAdd, smile, ahk_exe chrome.exe
GroupAdd, smile, ahk_exe Skype.exe
GroupAdd, smile, ahk_exe Discord.exe
GroupAdd, smile, ahk_exe Telegram.exe
;=============================================
#IfWinActive ahk_group smile
;=============================================
F1::
BlockInput On
SendInput, {space}:five:{space}
SendInput, {Enter}
BlockInput Off
return
;=============================================
F9::
ClipSaved := ClipboardAll
Random, v1, 1, 3
Sleep, 200
Clipboard = :shockot:
Sleep, 200
SendInput, ^{sc2F %v1%}
Sleep, 200
SendInput, {Enter}
Sleep, 200
Clipboard := ClipSaved
return
;=============================================
F10::
ClipSaved := ClipboardAll
Random, v1, 1, 3
Sleep, 200
Clipboard = :happy:
Sleep, 200
SendInput, ^{sc2F %v1%}
Sleep, 200
SendInput, {Enter}
Sleep, 200
Clipboard := ClipSaved
return
;=============================================
F11::
ClipSaved := ClipboardAll
Random, v1, 1, 3
Sleep, 200
Clipboard = :peka:
Sleep, 200
SendInput, ^{sc2F %v1%}
Sleep, 200
SendInput, {Enter}
Sleep, 200
Clipboard := ClipSaved
return
;=============================================
F12::
ClipSaved := ClipboardAll
Random, v1, 1, 3
Sleep, 200
Clipboard = :grumpy:
Sleep, 200
SendInput, ^{sc2F %v1%}
Sleep, 200
SendInput, {Enter}
Sleep, 200
Clipboard := ClipSaved
return
;=============================================
Browser_Back::
BlockInput On
SendInput, {space}:aniadolf:{space}
SendInput, {Enter}
BlockInput Off
return
;=============================================
Browser_Forward::
BlockInput On
SendInput, {space}:anilove:{space}
SendInput, {Enter}
BlockInput Off
return
;=============================================
Browser_Stop::
BlockInput On
SendInput, {space}:holypeka:{space}
SendInput, {Enter}
BlockInput Off
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