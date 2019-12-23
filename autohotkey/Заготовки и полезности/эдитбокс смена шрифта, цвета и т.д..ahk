a1=0
a2=0
a3=0
a4=0

Gui, Color,, Green
Gui, Font, CBlue
Gui, Add, Edit, vMyEdit w200 h100, The quick onyx goblin`njumps over the lazy dwarf
Gui, Add, Button, gMyButton1 w200 h40, Change text color
Gui, Add, Button, gMyButton2 w200 h40, Change background color
Gui, Add, Button, gMyButton3 w200 h40, Change text alignment
Gui, Add, Button, gMyButton4 w200 h40, Change text size
Gui, Show,, My GUI
return

MyButton1:
if a1 = 0
{
Gui, Font, cYellow
GuiControl, Font, MyEdit
a1 = 1
return
}
else
{
Gui, Font, cBlue
GuiControl, Font, MyEdit
a1 = 0
return
}

MyButton2:
if a2 = 0
{
Gui, Color,, Red
a2 = 1
return
}
else
{
Gui, Color,, Green
a2 = 0
return
}

MyButton3:
if a3 = 0
{
GuiControl, +Center, MyEdit
a3 = 1
return
}
if a3 = 1
{
GuiControl, +Right, MyEdit
a3 = 2
return
}
if a3 = 2
{
GuiControl, +Left, MyEdit
a3 = 0
return
}

MyButton4:
if a4 = 0
{
Gui, Font, s18
GuiControl, Font, MyEdit
a4 = 1
return
}
else
{
Gui, Font
GuiControl, Font, MyEdit
a4 = 0
return
}

Esc::
GuiClose:
ExitApp