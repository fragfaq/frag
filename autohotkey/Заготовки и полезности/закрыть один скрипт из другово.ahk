DetectHiddenWindows, On ; Установка запускаемого скрипта на паузу
WM_COMMAND := 0x111
ID_FILE_EXIT := 65405
PostMessage, WM_COMMAND, ID_FILE_EXIT,,, %A_ScriptDir%\res\ahk\other\Get currency.ahk
return