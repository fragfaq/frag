VAutoSellX := 1247
VAutoSellX1 := 1247
VAutoSellY := 562
VAutoSellStep := 53
BlockInput On
SendInput {LCtrl Down}
Loop, 5
{
Random, Var_out_random, 20, 40
Sleep, %Var_out_random%
VAutoSellX := VAutoSellX1 + VAutoSellStep
VAutoSellY := VAutoSellY + VAutoSellStep
Loop, 12
{
Random, Var_int_random, 30, 60
Sleep, %Var_int_random%
MouseClick, Left, %VAutoSellX%, %VAutoSellY%
VAutoSellX := VAutoSellX + VAutoSellStep
}
}
SendInput {LCtrl Up}
BlockInput Off
exit
