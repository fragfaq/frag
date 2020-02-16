vaura(min, max)
{
	random, ran, min, max
	return ran
}
; return

Random, Vspeed1, 4, 8
Random, Vspeed2, 4, 8
Random, Vspeed3, 4, 8
Random, Vspeed4, 4, 8
Random, Vspeed5, 4, 8
Random, Vspeed6, 4, 8
Random, Vspeed7, 4, 8
Random, Vspeed8, 4, 8
Random, Vspeed9, 4, 8
BlockInput On
sleep, % vaura(50, 80)
MouseGetPos VauraX, VauraY					; Сохраняет текущие координаты курсора
sleep, % vaura(50, 80)
MouseMove, 1663, 1037, %Vspeed1%			; Наводит курсор открыть список скилов
sleep, % vaura(50, 80)
Click left									; Нажимает на скил, открывает список скилов
sleep, % vaura(50, 80)
MouseMove, 1577, 567, %Vspeed2%				; Наводит курсор на первую ауру
sleep, % vaura(50, 80)
Click left									; Выбирает первую ауру
sleep, % vaura(50, 80)
SendInput, {scB}							; Прожимает первую ауру
sleep, % vaura(50, 80)
MouseMove, 1663, 1037, %Vspeed3%			; Наводит курсор открыть список скилов
sleep, % vaura(50, 80)
Click left									; Нажимает на скил, открывает список скилов
sleep, % vaura(50, 80)
MouseMove, 1570, 771, %Vspeed4%				; Наводит курсор на вторую ауру
sleep, % vaura(50, 80)
Click left									; Выбирает вторую ауру
sleep, % vaura(50, 80)
SendInput, {scB}							; Прожимает вторую ауру
sleep, % vaura(50, 80)
MouseMove, 1663, 1037, %Vspeed5%			; Наводит курсор открыть список скилов
sleep, % vaura(50, 80)
Click left									; Нажимает на скил, открывает список скилов
sleep, % vaura(50, 80)
MouseMove, 1441, 834, %Vspeed6%				; Наводит курсор на третью ауру
sleep, % vaura(50, 80)
Click left									; Выбирает третью ауру
sleep, % vaura(50, 80)
SendInput, {scB}							; Прожимает третью ауру
sleep, % vaura(50, 80)
MouseMove, 1663, 1037, %Vspeed7%			; Наводит курсор открыть список скилов
sleep, % vaura(50, 80)
Click left									; Нажимает на скил, открывает список скилов
sleep, % vaura(50, 80)
MouseMove, 1504, 703, %Vspeed8%				; Наводит курсор на первый скил
sleep, % vaura(50, 80)
Click left									; Выбирает первый скил
sleep, % vaura(50, 80)
MouseMove, VauraX, VauraY, %Vspeed9%		; Наводит курсор на первый скил
BlockInput Off
