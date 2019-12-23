#Persistent
#InstallKeybdHook
#MaxThreadsPerHotkey 1
#MaxThreadsBuffer On
VPause := 0
GroupAdd, worms, ahk_exe WA.exe
GroupAdd, worms, ahk_exe Worms Armageddon.exe
#IfWinActive ahk_group worms
sc2C::
if VPause = 0
{
	Send, {F4 down}
	Sleep, 50
	Send, {F4 up}
	Sleep, 50
	Send, {F8 down}
	Sleep, 50
	Send, {F8 up}
	Sleep, 50
	Send, {F8 down}
	Sleep, 50
	Send, {F8 up}
	Sleep, 50
	Send, {F8 down}
	Sleep, 50
	Send, {F8 up}
	Sleep, 250
}
else if VPause = 1
{
	Send, {sc2C}
}
return
!sc23::
if VPause = 0
{
	VPause := 1
}
else if VPause = 1
{
	VPause := 0
}
return
#IfWinActive