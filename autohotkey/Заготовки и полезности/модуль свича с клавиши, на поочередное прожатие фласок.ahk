; Переключатель бинда клавиши d. Отправляет либо нажатие d либо поочередные нажатия клавиш 3 и 5
;=================
; Ввод переменных и цикл их смены. Закрытие и открытие нужного gui
F1::
if VarD = 
{
	Sleep, 100
	VarD := 0
	VarF := 3
}
else if VarD = 0
{
	Sleep, 50
	SendInput, ^!+{F12}
	Sleep, 50
	Run, "res\ahk\gui\d = 3-4.ahk", \res\ahk\gui\
	Sleep, 50
	VarD := 1
}
else if VarD = 1
{
	Sleep, 50
	SendInput, ^!+{F12}
	Sleep, 50
	Run, "res\ahk\gui\d = d.ahk", \res\ahk\gui\
	Sleep, 50
	VarD := 0
}
return
;=================
; Бинд клавиш в зависимости от значения переменной
sc20::
if VarD = 
{
	SendInput, {sc20}
}
if VarD = 0
{
	SendInput, %VarF%
	VarF += 2
	If VarF > 6
	{
		VarF := 3
	}
}
else if VarD = 1
{
	Sleep, 100
	SendInput, {sc20}
}
return