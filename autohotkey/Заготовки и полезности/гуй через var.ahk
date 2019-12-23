Var = 1
F1::
If Var = 1
{
Gui, +LastFound +AlwaysOnTop +ToolWindow +OwnDialogs
Gui, Add, text, x0 y0 w557 h44 ,hello, world 
Gui, Show, Center w557 h44, 123
Hotkey, IfWinActive, Msgbox
var = 2
}
else if var =2
{
Gui Destroy
var = 1
}
return
