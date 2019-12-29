#Persistent
;=============================================
GroupAdd, poe, ahk_exe PathOfExile.exe
GroupAdd, poe, ahk_exe PathOfExile_x64.exe
GroupAdd, poe, ahk_exe PathOfExile_x64Steam.exe
GroupAdd, poe, ahk_exe PathOfExileSteam.exe
;=============================================
Sleepfunction(min, max)
{
	random, randb, min, max
	return randb
}
;=============================================
Var_2key := 0
Var_Fkey := 0
;=============================================
#IfWinActive ahk_group poe
;=============================================
sc3::
if Var_2key = 0
{
	SendInput, {sc3}
}
else if Var_2key = 1
{
	SendInput, {sc3}
	Sleep, % Sleepfunction(40, 60)
	SendInput, {sc4}
	Sleep, % Sleepfunction(40, 60)
	SendInput, {sc5}
	Sleep, % Sleepfunction(40, 60)
	SendInput, {sc6}
	Sleep, % Sleepfunction(40, 60)
}
return
;=============================================
F11::
if Var_Fkey = 0
{
	Var_2key := 1
	Var_Fkey := 1
	Sleep, % Sleepfunction(40, 60)
}
else if Var_Fkey = 1
{
	Var_2key := 0
	Var_Fkey := 0
	Sleep, % Sleepfunction(40, 60)
}
return
;=============================================
#IfWinActive
;=============================================