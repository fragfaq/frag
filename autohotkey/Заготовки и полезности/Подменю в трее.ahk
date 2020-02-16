#Persistent
Menu, podmenu, add, name1, Metka
Menu, podmenu, add, name2, Metka 

Menu, Tray, add, submenu, :podmenu


Menu, tray, Default, submenu

Menu, Tray, Add,
menu, tray, NoStandard
menu, tray, Standard
return

Metka:
return

;;;;;;;;;;;;;;;;;;;;;;;;
; перезапуск скрипта на Control+r
^sc13::
SendInput, ^!+{F11}
Sleep, 100
Reload
return