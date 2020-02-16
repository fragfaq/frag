;=============================================
;перезапуск скрипта на Control+r
^sc13::
Reload
return
;=============================================

sc1a::
Varx := 1247
Varx1 := 1247
Varx2 := 1459
Vary := 562
Varm := 53
BlockInput On
SendInput {LCtrl Down}
vary := Vary + Varm
Loop, 9
{
Random, Var_first_random, 50, 100
Sleep, %Var_first_random%
MouseClick, Left, %Varx2%, %Vary%
Varx2 := Varx2 + Varm
}
Loop, 4
{
Random, Var_out_random, 200, 350
Sleep, %Var_out_random%
varx := Varx1 + Varm
vary := Vary + Varm
Loop, 12
{
Random, Var_int_random, 50, 100
Sleep, %Var_int_random%
MouseClick, Left, %Varx%, %Vary%
Varx := Varx + Varm
}
}
SendInput {LCtrl Up}
BlockInput Off
return
