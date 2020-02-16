;==============================================
; Заводим шарманку: устанавливаем иконку, настройку перезапуска скрипта, если вдруг что
#SingleInstance force
Menu, Tray, Icon, %A_ScriptDir%\res\pic\2.ico, 1
;==============================================
Global Var_conv_cd = 0
;==============================================
; Активируем нужное нам окно
IfWinNotActive, ("ahk_class POEWindowClass")
		{
			WinWaitActive, Path of Exile
		}
Sleep, 30
;==============================================
; Даем звуком понять, что скрипт запущен
SoundBeep, 60, 50
;==============================================
; Отображаем Gui, что б знать, когда скрипт работает
Gui, +LastFound +AlwaysOnTop +ToolWindow +OwnDialogs
Gui, Font, S16 W900, Verdana
Gui, Add, Text, x10 y3 c000000 BackgroundTrans, Auto
Gui, Add, Text, x6 y0 c00ff00 BackgroundTrans, Auto
Gui, Show, x1535 y1040 NoActivate, Autocast
Gui, Color, 000001
WinSet, TransColor, 000001
Gui, -Caption
;==============================================
; Устанавливаем параметры рабочего окна, вне которых скрипт работать не должен.
GroupAdd, poe, ahk_exe PathOfExile.exe
GroupAdd, poe, ahk_exe PathOfExile_x64.exe
;==============================================
; Активируем эти параметры
#IfWinActive ahk_group poe
;==============================================
; Вводим функцию для создания случайного временного промежутка
Sleepfunction(min, max) {
	random, randb, min, max
	return randb
}
;==================================================
; Делаем пометку, на случай, если окно, в котором должен выполняться скрипт, не активно - дождаться его активации
; После этого прожимаем бинды скрипта в ручную, т.к. таймер прожмет их после прошествия указанного времени.
IfWinNotActive, ("ahk_class POEWindowClass")
		{
			WinWaitActive, Path of Exile
		}
	SendInput, {sc13}
	Sleep, % Sleepfunction(40, 60)
	SendInput, {scA}
	Sleep, % Sleepfunction(40, 60)
	SendInput, {scB}
;==============================================
; Устанавливаем таймер на секундe с копьем, с разбросом в 0.1 секунды для Вортекса.
; Исходим из того, что кд вортекса 1,02 секунды и добавляем рандомный промежуток.
;
;============
; Для Молтен Шела устанавливаем таймер в плюс-минус пол секунды. Такой промежуток выбран т.к.:
; У Молтен Шела кд не фиксированный, он зависит от того, как быстро закончится прочность от бафа,
; А значит, если по кд прожимать хоткей - то между активациями, вполне возможно, будут паузы,
; И просчитать это не возможено. Поэтому таймер молтен шела работает иначе:
; Используюя команду PixelSearch, таймер постоянно ищет пиксель заданного цвета на иконке Молтена.
; Если цвет не совпадает - значит скил еще активен, либо в кулдауне. Если совпадает - Скил готов
; К использованию. И уже тогда таймер прожимает хоткей.
;
;============
; И таймер для фокуса, что б шокать от крафта всех вокруг. Стабильный кд в 12 секунд, изи.
;
;============
; А потом таймер для отката фокуса
;

; SetTimer, Molten, % Sleepfunction(450, 550)
; SetTimer, Vortex, % Sleepfunction(1150, 1250)
; SetTimer, Focus, % Sleepfunction(1450, 1550)
SetTimer, Molten, % Sleepfunction(900, 1000)
SetTimer, Vortex, % Sleepfunction(1150, 1125)
SetTimer, Focus, % Sleepfunction(650, 750)
return
;==============================================
; Таймеры:
;==============================================
; Для вортекса:
Vortex:
	IfWinNotActive, ("ahk_class POEWindowClass")
		{
			WinWaitActive, Path of Exile
		}
	Sleep, % Sleepfunction(40, 60)
	SendInput, {sc13}
Return
;==============================================
; Для Молтен Шела:
Molten:
PixelSearch, Px, Py, 1594, 1027, 1594, 1027, 0xDB5918, 0, Fast RGB	; Поиск пикселя, означающего конец кд.
if ErrorLevel														; Если пиксель не найден - короткая пауза.
{
	Sleep, % Sleepfunction(40, 60)
}
else																; Если пиксель найден, то:
{
	IfWinNotActive, ("ahk_class POEWindowClass")					; Выяснить активно ли окно PoE
	{
		WinWaitActive, Path of Exile								; Если окно не активно - ожидать активации.
	}
	Sleep, % Sleepfunction(40, 60)									; Если окно активно, то не большая пауза
	SendInput, {scA}												; И прожатие хоткея.
}
return
;==============================================
; Для шокающего фокуса
Focus:

IfWinNotActive, ("ahk_class POEWindowClass")
	{
		WinWaitActive, Path of Exile
	}
Sleep, % Sleepfunction(40, 60)
SendInput, {scB}
Sleep, 20
Return
;==============================================
; Авторебут скрипта
Reboot:
	Reload
Return
;==============================================
;============
;============
; Левый бинд, что б скрипт не закрывался
^!+F22::
Sleep, 50
return
; ==================
#IfWinActive
