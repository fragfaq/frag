^Space::
Random, v1, 50, 80
Random, v2, 50, 80
Random, v3, 50, 80
Random, v4, 50, 80
Random, v5, 50, 80
Random, v6, 50, 80
sleep, %v1%
MouseGetPos xx, yy
sleep, %v2%
MouseGetPos xx, yy
Send {e}
sleep, %v3%
MouseMove, 1344, 616, 4 ; portal scroll location, top right
sleep, %v4%
Click Right
sleep, %v5%
Send {e}
sleep, %v6%
MouseMove, xx, yy, 0
return
;==============================================
;перезапуск скрипта на Control+r
^sc13::
Reload
return
;=============================================