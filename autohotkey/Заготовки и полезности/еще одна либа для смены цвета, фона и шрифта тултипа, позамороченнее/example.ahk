;#Include %A_ScriptDir%\lib1.ahk
;#Include %A_ScriptDir%\lib2.ahk

Gui, add, button, w100 vButton1, qwe
Gui, add, button, w100 vButton2, asd
Gui, add, button, w100 vButton3, zxc
Gui, Add, Edit, w100 vtext1, testTEXT
gui, show,w200, Справочник

options := { ShowNow: false
           , FontName: "Comic Sans MS"
           , FontSize: 20
           , TextColor: 0x0000ff
           , BackColor: 0xFFA500 }

options.text := "Кнопка 1", tooltip1 := new ToolTip(options)
options.text := "Кнопка 2", tooltip2 := new ToolTip(options)
options.text := "Кнопка 3", tooltip3 := new ToolTip(options)
options.text := "asdasddd", tooltip4 := new ToolTip(options)

ShowToolTip({controls: { Button1: tooltip1, Button2: tooltip2, Button3: tooltip3, text1: tooltip4 }, delay: 10, duration: 2000})


#Include %A_ScriptDir%\lib1.ahk
#Include %A_ScriptDir%\lib2.ahk
