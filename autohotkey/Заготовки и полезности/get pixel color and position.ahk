F1::
; Clipboard = 1
Sleep, 50
MouseGetPos, MouseX, MouseY
PixelGetColor, color, %MouseX%, %MouseY%, RGB
Sleep, 50
Clipboard = color  is %color% x is %MouseX% y is %MouseY%
Sleep, 50
MsgBox color  is %color%. x is %MouseX%. y is %MouseY%.
return

