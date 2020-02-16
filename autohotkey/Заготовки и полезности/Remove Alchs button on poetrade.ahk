;Ctrl+E - Remove Alchs button on poe.trade
#IfWinActive ahk_group trade
^sc12::
MouseGetPos, xpos, ypos
sleep, 150
Varx := xpos
Vary := ypos
sleep, 150
MouseClick, Left, -119, 813
sleep, 150
MouseClick, Left, -554, 147
sleep, 150
MouseMove, %Varx%, %Vary%
sleep, 150
return
#IfWinActive
