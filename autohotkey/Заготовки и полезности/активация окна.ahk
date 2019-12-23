F1::
IfWinExist, ahk_class POEWindowClass
{
	WinActivate, ahk_class POEWindowClass
}
Else
{
	Msgbox,,, no
}
return