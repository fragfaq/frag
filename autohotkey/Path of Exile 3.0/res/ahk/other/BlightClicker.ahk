; Функция рандомного отдыха
Sleepfunction(min, max)
{
	random, randb, min, max
	return randb
}
; Установка окна, в котором должен работать скрипт
#IfWinActive ahk_class POEWindowClass
; Бинд на любое сочетание с mouse1
*LButton::   
autoclick:
	while GetKeyState("vk01", "P")
	{
		MouseClick, left, , , 1, % Sleepfunction(40, 60), D
		MouseClick, left, , , 1, % Sleepfunction(40, 60), U
	}
	KeyWait, LButton
return

#IfWinActive























