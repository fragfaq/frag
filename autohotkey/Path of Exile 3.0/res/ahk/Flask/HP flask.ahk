; ==============================================
; Надо разобраться с:
; 1: Автокаст скилов, вроде разобрался 
; 2: Скрипт автофласок, почему то находится в блоке биндов на D, в блоке else if Vkeys = 6, принцип его работы описан комментами, не вникал, но разобраться по идее не сложно будет чо я там понакодил. Вспомнить принцип работы, вытащить его из этого блока, описать нормально. UPD: Похоже он так написан, что либо просто прожимает фласки, либо включает автопрожатие, так что надо будет внимательно его выдирать, что б просто прожатие осталось на бинде, а автопрожатие можно было прописать отдельно. Хз нахуй я так сделал. Там 2 переменных: Var_autoflask_bind и VautoButton, перепроверить изначальное значение. Так же у автофласок есть отдельный  Gui, и кнопка активации в основном Gui, через метку gAutoflask
; 3: При if Vkeys = 9 на 3 срабатывают фласки 2,3 и 4, а на D только 5. Не очень понятный мне кейс, нужен ли он вообще? Но над этим уже в последнюю очередь
; 4: Не понятно почему при else if Vkeys = 10 на 3 срабатывают фласки 2,3 и 4, а на D срабатывают фласки 3,4 и 5, возможно просто про одну фласку забыли.
; 5: В бинде на тильду при else if Vkeys = 6 зачем то кроме фласки на 5 прожималась еще и фласка на 3, зачем не понятно, закомментил, оставил только 5, мб потом пойму зачем. Было написано "Пятерка на тильду всегда, кроме варианта с одной хп флаской. Тогда добавляется еще и тройка." Переписал так, что б if (Vkeys > 0 and Vkeys < 11) прожималась 5, в остальных случаях дефолтный бинд.
; 6: Бинды на F1 и F2, не сразу понял что это за хрень и зачем нужна. Кароче это остановка прожатия автофласок при нажатии на эти клавиши, нужно это для делва, что бы при кидке факела или динамита фласки автоматом перестали прожиматься, т.к. ты взорвал стену и стоишь на месте пока лутаешь то, что за ней. Выпиливать это не надо, когда будут нормальные автофласки - подогнать под них, вроде там все довольно просто.
; ==============================================
; #SingleInstance Force
; ==============================================
GroupAdd, poe, ahk_exe PathOfExile.exe
GroupAdd, poe, ahk_exe PathOfExile_x64.exe
; ==============================================
; Vkeys: функции билдов при значении переменной.
; 0 = 1 = 1, 2 = 2 etc.
; 1 = 1&2 = 1/2, 3&d = 3+4+5, ~ = 5
; 2 = 1&2 = 1/2/3, 3&d = 4+5, ~ = 5
; 3 = 1&2 = 1/2/3, 3&d = 4/5, ~ = 5
; 4 = 1&2 = 1/2/3/4, 3&d = 5, ~ = 5
; 5 = 1&2 = 1/2, 3&d = 3/4, ~ = 5
; 6 = 1&2 = 1, 3&d = 2+3+4+5, ~ = 5
; 7 = 1&2 = 1/2, 3&d = 3+4, ~ = 5
; 8 = 1&2 = 1/2, 3 = 3+4, d&~ = 5
; 9 = 1&2 = 1, 3 = 2+3+4, d&~ = 5 (В списке "Надо разобраться с:" пункт 3, не приоритетно)
; 10 = 1&2 = 1, 3 = 2+3+4, d = 3+4+5, ~ = 5 (В списке "Надо разобраться с:" пункт 4, странный кейс)
; 11 = 1&2 = 1, 3 = 2+3+4, d = 2+3+4, ~ = 5
; 12 = 1&2 = 1&6?, 3 = 2+3+4, d = 2+3+4, ~ = 5 (то же самое, что и 11, но на 1 и 2 прожимается сперва 1, а потом сразу 6, при условии, что Mouse1 не нажата. На 6 стоит эндюринг край)

; ВАЖНО:
; При изменении или добавлении биндов надо проверять все, т.к. есть строчки типа if (Vkeys < 1 or Vkeys > 10) и при добавлении новых вариантов переменных надо увеличивать числа в этих строчках.
; К примеру при добавлении значения 11 переменной Vkeys надо изменить "if (Vkeys < 1 or Vkeys > 10)" на "if (Vkeys < 1 or Vkeys > 11)"
; Так же в таких выражениях важно не путать and и or, если вы проверяете, находится ли переменная внутри промежутка, к примеру "if (Vkeys > 0 and Vkeys < 3)", то нужен end. Если вместо end написать or ( "if (Vkeys > 0 or Vkeys < 3)" ), то скрипт будет срабатывать при любом значении Vkeys, т.к. Vkeys или больше нуля или меньше трех. И наоборот, если значение должно быть вне промежутка, к примеру "if (Vkeys < 0 or Vkeys > 3)", то скрипт сработает только с or, если поставить and ( "if (Vkeys < 0 and Vkeys > 3)" ) то скрипт не сработает, т.к. он будет искать значение, которое одновременно меньше нуля, и больше трех, что невозможно.
;============================================================================================
; Переменные
; =========================
; Основные переменные:
; Vkeys					- меняет хоткеи
; Vdvehilki					- меняет значение переменной для варианта 1
; Vtrihilki					- меняет значение переменной для варианта 2 и 3
; Vkvadhilki				- меняет значение переменной для варианта 4 и 5
; Var_autoflask_bind			- для автофласок, потом разобраться с ним.
; VautoButton				- тоже для автофласок, потом разобраться с ним.
; Var_auto_skils				- для автокаста скилов, подробное описание в функции autocast
; Var_path_auto_skils			- путь для скрипта автокаста, после "%A_ScriptDir%\"
; Var_mana_toggle			- нужна что бы включать и выключать автофласку маны
;==============================================
; Переменные текста Gui
; VHeal				- текст первой строки
; Vutil					- текст второй строки
; VHealnumder		- число перед первой строкой
; Vutilnumber		- число перед второй строкой
; VText1				- небольшой текст, начинается под цифрами
; VText2				- небольшой текст, начинается под часами
;==============================================
Menu, Tray, Icon, %A_ScriptDir%\res\Life_flask1.png, 1
;=============================================
#IfWinActive ahk_group poe
;==========================================================================================
global Vkeys := 0
global Vdvehilki := 1
global Vtrihilki := 1
global Vkvadhilki := 1
global Vspeed := 4
global Vspeed_dmg := 3
global VautoButton := 0
global Var_autoflask_bind := 0
global Var_auto_skils := 0
global Var_path_auto_skils := "support skils script\BoneArmor.ahk"
global Var_mana_toggle := 0
;==============================================
; Стартовый Gui, который показывает только что Vkeys = 0
Gui, Destroy
Gui, 2:Destroy
Gui, 3:Destroy
Gui, +LastFound +AlwaysOnTop +ToolWindow +OwnDialogs
Gui, Font, S16 W900, Verdana
Gui, Add, Text, x215 y80 c000000 BackgroundTrans, keys %Vkeys%
Gui, Add, Text, x215 y86 c000000 BackgroundTrans, keys %Vkeys%
Gui, Add, Text, x221 y80 c000000 BackgroundTrans, keys %Vkeys%
Gui, Add, Text, x221 y86 c000000 BackgroundTrans, keys %Vkeys%
Gui, Add, Text, x219 y83 ca0a0a0 BackgroundTrans, keys %Vkeys%
; показ и положение Gui
Gui, Show, x220 y870 NoActivate, Flask
; прозрачность
Gui, Color, 000001
WinSet, TransColor, 000001
Gui, -Caption
;==============================================
; Функция для слипа, пример использования:
; Sleep, % Sleepfunction(45, 80)
; 45 и 80 могут быть любыми числами, между которыми будет найдено случайное число.
; Каждый раз рандомное число будет разным, т.к. каждый раз идет обращение к функции, и она возвращает новый результат.
Sleepfunction(min, max)
{
	random, randb, min, max
	return randb
}
; return
;=================================================================
; Функция для запуска автопрожатия скилов
; ----------------------------
; Принцип работы самой функции:
; Если Var_auto_skils равен 0 (значение задается в начале скрипта), то при нажатии на хоткей, к которому привязана функция запускается автокаст и Var_auto_skils становится равен 1. При повторном нажатии автокаст останавливаетсяи Var_auto_skils становится равен 0.
; Как и какие скилы будут прожиматься определяется отдельным скриптом, который функция запускает или убивает, в зависимости от значения переменной Var_auto_skils.
; Пример бинда функции:
; F1::
; autocast()
; return
; ----------------------------
; Принцип работы в скрипте на данный момент:
; Функция привязана к F8 и F7.
; F8 работает как тумблер вкл/выкл, при первом нажатии включается автокаст, при повторном выключается. Значение Vkeys не важно.
; F7 всегда выключает автокаст и устанавливает значение переменной Var_auto_skils на 0.
; ----------------------------
; autocast() {
	; if Var_auto_skils = 0
	; {
		; Run, %A_ScriptDir%\%Var_path_auto_skils%
		; Var_auto_skils := 1
	; }
	; else if Var_auto_skils = 1
	; {
		; SetTitleMatchMode, 2
		; DetectHiddenWindows, On
		; WinClose, %Var_path_auto_skils% - AutoHotkey v
		; Var_auto_skils := 0
	; }
; }
; return
; ----------------------------
; Для отключения закомментировать блок выше и раскомментировать блок ниже, тогда убирать ее из бинда будет не нужно, т.к. она не будет ничего делать.
autocast() {
}
return
;=================================================================

; ################################################################
; #####################  БИНДЫ  #####################################
; ################################################################

;=========== бинд на 1 =================================
sc2:: 
If Vkeys = 0 
{
	SendInput, 1			; дефолт
}
else if Vkeys = 1			; 1 или 2 в зависимости от Vdvehilki, 3&d = 3+4+5
{
	SendInput, %Vdvehilki%
	Vdvehilki += 1
	if Vdvehilki > 2
	{
		Vdvehilki := 1
	}
}
else if Vkeys = 2			; 1, 2 или 3 в зависимости от Vtrihilki, 3&d = 4+5
{
	SendInput, %Vtrihilki%
	Vtrihilki += 1
	if Vtrihilki > 3
	{
		Vtrihilki := 1
	}
}
else if Vkeys = 3			; 1, 2 или 3 в зависимости от Vtrihilki, 3&d = 4/5
{
	SendInput, %Vtrihilki%
	Vtrihilki += 1
	if Vtrihilki > 3
	{
		Vtrihilki := 1
	}
}
else if Vkeys = 4			; 1, 2, 3 или 4 в зависимости от Vkvadhilki, 3 = 5, d = d
{
	SendInput, %Vkvadhilki%
	Vkvadhilki += 1
	if Vkvadhilki > 4
	{
		Vkvadhilki := 1
	}
}
else if Vkeys = 5			; 1 или 2 в зависимости от Vdvehilki
{
	SendInput, %Vdvehilki%
	Vdvehilki += 1
	if Vdvehilki > 2
	{
		Vdvehilki := 1
	}
}
else if Vkeys = 6			; 1
{
	SendInput, 1
}
else if (Vkeys = 7 or Vkeys = 8) 	; 1 или 2 в зависимости от Vdvehilki
{
	SendInput, %Vdvehilki%
	Vdvehilki += 1
	if Vdvehilki > 2
	{
		Vdvehilki := 1
	}
}
else if (Vkeys => 9 or Vkeys < 12)	; 1
{
	SendInput, 1
}
else if Vkeys = 12						; 1 или 1 & 6
{
	GetKeyState, state, LButton
	if state = D
	{
		SendInput, 1						; 1 если mouse1 нажата
	}
	else
	{
		SendInput, 1
		Sleep, % Sleepfunction(40, 80)	; 1 & 6 если mouse1 не нажата
		SendInput, 6
	}
}
return
;=========== бинд на 2 =================================
sc3::
If Vkeys = 0
{
	SendInput, 2			; дефолт
}
else if Vkeys = 1			; 1 или 2 в зависимости от Vdvehilki, 3 = 3+4+5
{
	SendInput, %Vdvehilki%
	Vdvehilki += 1
	if Vdvehilki > 2
	{
		Vdvehilki := 1
	}
}
else if Vkeys = 2			; 1, 2 или 3 в зависимости от Vtrihilki, 3&d = 4+5
{
	SendInput, %Vtrihilki%
	Vtrihilki += 1
	if Vtrihilki > 3
	{
		Vtrihilki := 1
	}
}
else if Vkeys = 3			; 1, 2 или 3 в зависимости от Vtrihilki, 3&d = 4/5
{
	SendInput, %Vtrihilki%
	Vtrihilki += 1
	if Vtrihilki > 3
	{
		Vtrihilki := 1
	}
}
else if Vkeys = 4			; 1, 2, 3 или 4 в зависимости от Vkvadhilki, 3 = 5, d = d
{
	SendInput, %Vkvadhilki%
	Vkvadhilki += 1
	if Vkvadhilki > 4
	{
		Vkvadhilki := 1
	}
}
else if Vkeys = 5			; 1 или 2 в зависимости от Vdvehilki, 3&d = 3/4
{
	SendInput, %Vdvehilki%
	Vdvehilki += 1
	if Vdvehilki > 2
	{
		Vdvehilki := 1
	}
}
else if Vkeys = 6			; 1
{
	SendInput, 1
}
else if (Vkeys = 7 or Vkeys = 8)			; 1 или 2 в зависимости от Vdvehilki
{
	SendInput, %Vdvehilki%
	Vdvehilki += 1
	if Vdvehilki > 2
	{
		Vdvehilki := 1
	}
}
else if (Vkeys = 9 or Vkeys = 11)			; 1
{
	SendInput, 1
}
else if Vkeys = 12						; 1 или 1 & 6
{
	GetKeyState, state, LButton
	if state = D
	{
		SendInput, 1						; 1 если mouse1 нажата
	}
	else
	{
		SendInput, 1
		Sleep, % Sleepfunction(40, 80)	; 1 & 6 если mouse1 не нажата
		SendInput, 6
	}
}
return
;=========== бинд на 3 =================================
sc4::
SetTitleMatchMode, 2
DetectHiddenWindows, On
WinClose, Loop HP All flask.ahk - AutoHotkey v
Sleep, 20
Var_autoflask_bind := 0
VautoButton := 0
Gui, 2:Destroy
Gui, 3:Destroy
If Vkeys = 0
{
	SendInput, 3			; Дефолт
}
else if Vkeys = 1			; 3 = 3+4+5, 1&2 = 1/2
{
	Sleep, % Sleepfunction(45, 80)
	SendInput, 3
	Sleep, % Sleepfunction(45, 80)
	SendInput, 4
	Sleep, % Sleepfunction(45, 80)
	SendInput, 5
}
else if Vkeys = 2			; 3 = 4+5, 1&2 = 1/2/3
{
	Sleep, % Sleepfunction(45, 80)
	SendInput, 4
	Sleep, % Sleepfunction(45, 80)
	SendInput, 5
}
else if Vkeys = 3			; 3 = 4/5, 1&2 = 1/2/3
{
	SendInput, %Vspeed%
	Vspeed += 1
	if Vspeed > 5
	{
		Vspeed := 4
	}
}
else if Vkeys = 4			; 3 = 5, 1&2 = 1/2/3/4
{
	SendInput, 5
}
else if Vkeys = 5			; 3 = 3/4, 1&2 = 1/2 (для квиксильверов на 3 или 4)
{
	SendInput, %Vspeed_dmg%
	Vspeed_dmg += 1
	if Vspeed_dmg > 4
	{
		Vspeed_dmg := 3
	}
}
else if Vkeys = 6			; 3 = 2+3+4+5 (для 4ех утилиток на 3 или d)
{
	SendInput, 2
	Sleep, % Sleepfunction(45, 80)
	SendInput, 3
	Sleep, % Sleepfunction(45, 80)
	SendInput, 4
	Sleep, % Sleepfunction(45, 80)
	SendInput, 5
}
else if (Vkeys = 7 or Vkeys = 8)			; 3 = 3+4
{
	Sleep, % Sleepfunction(45, 80)
	SendInput, 3
	Sleep, % Sleepfunction(45, 80)
	SendInput, 4
}
else if (Vkeys => 9 and Vkeys <= 11)			; 3 = 2+3+4
{
	SendInput, 2
	Sleep, % Sleepfunction(45, 80)
	SendInput, 3
	Sleep, % Sleepfunction(45, 80)
	SendInput, 4
}
else if Vkeys = 12			; 3 = 2+3+4
{
	SendInput, 2
	Sleep, % Sleepfunction(45, 80)
	SendInput, 3
	Sleep, % Sleepfunction(45, 80)
	SendInput, 4
}
return
;=========== бинд на D =================================
sc20::
if Vkeys = 0				; дефолт
{
	SendInput, {sc20}
}
else if Vkeys = 1			; d = 3+4+5, 1&2 = 1/2
{
	Sleep, % Sleepfunction(45, 80)
	SendInput, 3
	Sleep, % Sleepfunction(45, 80)
	SendInput, 4
	Sleep, % Sleepfunction(45, 80)
	SendInput, 5	
}
If Vkeys = 2				; d = 4+5, 1&2 = 1/2/3
{
	Sleep, % Sleepfunction(45, 80)
	SendInput, 4
	Sleep, % Sleepfunction(45, 80)
	SendInput, 5
}
else if Vkeys = 3			; d = 4/5, 1&2 = 1/2/3
{
	SendInput, %Vspeed%
	Vspeed += 1
	if Vspeed > 5
	{
		Vspeed := 4
	}
}
else if Vkeys = 4			; d = 5, 1&2 = 1/2/3/4
{
	SendInput, 5
}
else if Vkeys = 5			; d = 3/4, 1&2 = 1/2 (для квиксильверов на 3 или 4)
{
	SendInput, %Vspeed_dmg%
	Vspeed_dmg += 1
	if Vspeed_dmg > 4
	{
		Vspeed_dmg := 3
	}
}
else if Vkeys = 6			; d = 2+3+4+5 (для 4ех утилиток на 3 или d)
{
; =========================================================================
; В списке "Надо разобраться с:" пункт 2, как работает примерно понял, но надо переделать, подробности в списке.
	if Var_autoflask_bind = 0		; Определяет, будет ли запущен скрипт на автофласки. Значение изменяется вместе
	{								; со значением VautoButton. Если VautoButton = 0, то бинд дефолтный. Если
		Gui, 3:Destroy				; VautoButton = 1, то бинд меняется в зависимости от собственного значения 
		SetTitleMatchMode, 2		; Var_autoflask_bind. Запустить скрипт, или убить его. При значении 0 - убивает
		DetectHiddenWindows, On		; скрипт автопрожатия и закрывает его Gui.
		WinClose, Loop HP All flask.ahk - AutoHotkey v
		Sleep, % Sleepfunction(45, 80)
		SendInput, 2
		Sleep, % Sleepfunction(45, 80)
		SendInput, 3
		Sleep, % Sleepfunction(45, 80)
		SendInput, 4
		Sleep, % Sleepfunction(45, 80)
		SendInput, 5
		Sleep, 20
	}
	else if Var_autoflask_bind = 1	; При значении 1 запускает скрипт автопрожатий и отображает Gui. Так же меняет
	{								; значение Var_autoflask_bind на 2, что б клавиша работала как тумблер (on/off).
		Gui, 3:Destroy
		SoundBeep, 60, 50
		Sleep, 20
		Gui, 3:+LastFound +AlwaysOnTop +ToolWindow +OwnDialogs
		Gui, 3:Font, S36 W900, Verdana
		Gui, 3:Add, Text, x10 y3 c000000 BackgroundTrans, ON
		Gui, 3:Add, Text, x6 y0 c00ff00 BackgroundTrans, ON
		Gui, 3:Show, x480 y870 NoActivate, Auto_on
		Gui, 3:Color, 000001
		WinSet, TransColor, 000001
		Gui, 3:-Caption
		Run, %A_ScriptDir%\Loop HP All flask.ahk
		Sleep, 100
		Var_autoflask_bind := 2
	}
	else if Var_autoflask_bind = 2	; При значении 2 убивает скрипт автофласок и задает значение Var_autoflask_bind=1
	{								; что б повторным нажатием запустить скрипт.
		Gui, 3:Destroy
		SoundBeep, 60, 50
		SetTitleMatchMode, 2
		DetectHiddenWindows, On
		WinClose, Loop HP All flask.ahk - AutoHotkey v
		Sleep, 20
		Var_autoflask_bind := 1
	}
; =========================================================================
}
else if Vkeys = 7					; 3 = 3+4
{
	Sleep, % Sleepfunction(45, 80)
	SendInput, 3
	Sleep, % Sleepfunction(45, 80)
	SendInput, 4
}
else if (Vkeys = 8 or Vkeys = 9)				; d = 5
{
	SendInput, 5
}
else if Vkeys = 10
{
	Sleep, % Sleepfunction(45, 80)
	SendInput, 3
	Sleep, % Sleepfunction(45, 80)
	SendInput, 4
	Sleep, % Sleepfunction(45, 80)
	SendInput, 5
}
else if Vkeys = 11							; D = 2+3+4
{
	SendInput, 2
	Sleep, % Sleepfunction(45, 80)
	SendInput, 3
	Sleep, % Sleepfunction(45, 80)
	SendInput, 4
}
else if Vkeys = 12							; D = 2+3+4
{
	SendInput, 2
	Sleep, % Sleepfunction(45, 80)
	SendInput, 3
	Sleep, % Sleepfunction(45, 80)
	SendInput, 4
}
else if Vkeys => 13
{
	SendInput, {sc20}
}
return
;=========== бинд на Tilde =============================
; Пятерка на тильду если Vkeys больше нуля, иначе дефолтный бинд
sc29::
if (Vkeys <= 0 or Vkeys > 12)			; дефолт (~)
{
	SendInput, {sc29}
}
else if (Vkeys > 0 and Vkeys <= 12)		; ~ = 5
{
	SendInput, 5
}
return
;=========== бинд на W =================================
; Convocation‌ + керса на mouse3 (для миньеньщика)
; Если бинды на фласки включены - то на w сперва прожимается Mouse3, а потом сразу w, что б кастовать керсу конвокейшном.
; sc11::
; if (Vkeys > 0 and Vkeys <= 11)				; W + mouse3
; {
	; SendInput, {sc11}
	; Sleep, % Sleepfunction(35, 50)
	; SendInput, {MButton}
; }
; else if (Vkeys <= 0 or Vkeys > 11)				; W (дефолт)
; {
	; SendInput, {sc11}
; }
; return
;=========== бинд на 9 =====================================
; Объединяет Vaal Molten Shell и Enduring Cry на один бинд
; При активных биндах на фласки при нажатии на 9 (Mouse4, боковая кнопка мыши со вшитой девяткой на нее)
; Сперва прожимается Vaal Molten Shell, т.к. он инстант, потом Enduring Cry
; ~scA::
; if (Vkeys > 0 and Vkeys <= 12)				; 9 + 6
; {
	; Sleep, % Sleepfunction(40, 60)
	; SendInput, {6}
; }
; else if (Vkeys <= 0 or Vkeys > 12)				; дефолт
; {
	; Sleep, 0
; }
; return
;=========== бинд на Mouse2 =================================
; Bladefall‌ + Blade Blast на mouse2 (для деда)
; Если бинды на фласки включены - то на Mouse2 сперва прожимается Mouse2, а потом сразу R, что б кастовать BB и BF на 1 клавишу.
; ~RButton::
; if (Vkeys > 0 and Vkeys <= 12)				; RButton + R
; {
	; Sleep, % Sleepfunction(395, 430)
	; SendInput, {7}
; }
; else if (Vkeys <= 0 or Vkeys > 12)				; дефолт
; {
	; Sleep, 0
; }
; return
;=========== бинд на Mouse3 ==================================
; Автопрожатие манафласки по кд по таймеру.
; Таймер запускается на Mouse3 и выключается вместе с биндами фласок
; ~MButton::
; if (Vkeys > 0 and Vkeys <= 12)				; RButton + R
; {
	; if Var_mana_toggle = 0
	; {
		; SetTimer, ManaLoop, % Sleepfunction(4800, 5000)
		; SetTimer, ManaLoop, % Sleepfunction(5200, 5500) ; Попробую увеличить кд фласки, что бы она медленнеее расходовалась
		; Var_mana_toggle := 1
		; Menu, Tray, Icon, %A_ScriptDir%\res\Mana_Flask1.png, 1
	; }
	; else if Var_mana_toggle = 1
	; {
		; SetTimer, ManaLoop, off
		; Var_mana_toggle := 0
		; Menu, Tray, Icon, %A_ScriptDir%\res\Life_flask1.png, 1
	; }
; }
; else if (Vkeys <= 0 or Vkeys > 12)				; дефолт
; {
	; SetTimer, ManaLoop, off
	; Var_mana_toggle := 0
; }
; return
; ==========
; ManaLoop:
; IfWinNotActive, ("ahk_class POEWindowClass")
	; {
		; WinWaitActive ahk_class POEWindowClass
	; }
; Sleep, % Sleepfunction(20, 40)
; SendInput, {sc6}
; Sleep, % Sleepfunction(20, 40)
; return
; =================================================================================
; =================================================================================
/* 
; =================================================================================
;=========== бинд на F1 ================================= Тут какой-то баг на эфки. В списке "Надо разобраться с:" пункт 6, там описано что это за хрень.
;===========
; ~F1::
; SendInput, {F1}
; Sleep, % Sleepfunction(45, 80)
; if Var_autoflask_bind = 2
; {
	; Gui, 3:Destroy
	; SoundBeep, 60, 50
	; SetTitleMatchMode, 2
	; DetectHiddenWindows, On
	; WinClose, Loop HP All flask.ahk - AutoHotkey v
	; Sleep, 20
	; Var_autoflask_bind := 1
; }
; else if Var_autoflask_bind = 1
; {
	; Sleep, 20	
; }
; else if Var_autoflask_bind = 0
; {
	; SendInput, {sc14}
	; Sleep, 20	
; }
; return
;=========== бинд на F2 =================================
; ~F2::
; SendInput, {F2}
; Sleep, % Sleepfunction(45, 80)
; if Var_autoflask_bind = 2
; {
	; Gui, 3:Destroy
	; SoundBeep, 60, 50
	; SetTitleMatchMode, 2
	; DetectHiddenWindows, On
	; WinClose, Loop HP All flask.ahk - AutoHotkey v
	; Sleep, 20
	; Var_autoflask_bind := 1
; }
; else if Var_autoflask_bind = 1
; {
	; Sleep, 20
; }
; else if Var_autoflask_bind = 0
; {
	; SendInput, {sc14}
	; Sleep, 20
; }
; return
; =================================================================================
 */
;=====================

;=====================
#IfWinActive
;=====================
; 6::
; MsgBox, Vkeys = %Vkeys%
; return
;======;======;======;======;======;======
; Смена биндов и вывод GUI с их описанием, но сперва закрытиие цикла, если он работает.
; Хоткеи: F8
; ==========
F8::
!+scB::
!+scA::
; --------------------------------------------------------------------------------
; Нужное значение Vkeys, что б не нажимать F8 много раз:
; Закомментировать все в этом блоке для доступности всех биндов. 
; Если какое-то значение Vkeys задано (не закомментированная строка), то при нажатии на F8 значение Vkeys станет на 1 больше.
; К примеру если не закомментирована строка "Vkeys := 0 ; 1&2 = 1/2, 3&d = 3+4+5, ~ = 5" то Vkeys станет 1. В строке указано какие бинды выставятся.
Vkeys := 4 ; Vkeys станет 5, бинды: 1&2 = 1/2, 3&d = 3/4, ~ = 5
; Vkeys := 8 ; Vkeys станет 9, бинды: 1&2 = 1, 3 = 2+3+4, d = 5, ~ = 5
; Vkeys := 9 ; Vkeys станет 10, бинды: 1&2 = 1, 3 = 2+3+4, d = 3+4+5, ~ = 5
; Vkeys := 0 ; Vkeys станет 1, бинды: 1&2 = 1/2, 3&d = 3+4+5, ~ = 5
; Vkeys := 1 ; Vkeys станет 2, бинды: 1&2 = 1/2/3, 3&d = 4+5, ~ = 5
; Vkeys := 5 ; Vkeys станет 6, бинды: 1&2 = 1, 3&d = 2+3+4+5, ~ = 5
; Vkeys := 6 ; Vkeys станет 7, бинды: 1&2 = 1/2, 3&d = 3+4, ~ = 5
; Vkeys := 10 ; Vkeys станет 11, бинды: 1&2 = 1, 3&d = 2+3+4, ~ = 5
; Vkeys := 11 ; Vkeys станет 12, бинды: 1&2 = 1&6, 3&d = 2+3+4, ~ = 5
; --------------------------------------------------------------------------------
; Воспроизведение звука при акивации скрипта, если хоткей нажат случайно. Включение автокаста работает из любого окна, выключение только когда PoE активно.
SoundPlay, %A_ScriptDir%\res\on.wav
; --------------------------------------------------------------------------------
; Отключение автофласок (предположительно, еще не разбирал их)
; SetTitleMatchMode, 2
; DetectHiddenWindows, On
; WinClose, Loop HP All flask.ahk - AutoHotkey v
; Sleep, 20
; Var_autoflask_bind := 0
; VautoButton := 0
Sleep, % Sleepfunction(20, 30)
; ---------------------
; Закрытие всех Gui
Gui, Destroy
Gui, 2:Destroy
Gui, 3:Destroy
Sleep, % Sleepfunction(40, 60)
; ---------------------
; Запуск/остановка автокаста
autocast()
; ---------------------
; переключение переменных, по очереди, если стартовое значение Vkeys не задается при нажатии, а если задается, то устанавливается значение на 1 больше.
if Vkeys = 0
{
	Sleep, % Sleepfunction(30, 50)
	Vkeys := 1
}
else if Vkeys > 0
{
	Vkeys += 1
	if Vkeys > 12
	{	
		Sleep, % Sleepfunction(30, 50)
		Vkeys := 0
	}
}
Sleep, % Sleepfunction(30, 50)
; ---------------------
; Текст для Gui в зависимости от переменной.
if Vkeys = 0
{
	VHeal := ""
	Vutil := ""
	VHealnumder := ""
	Vutilnumber := ""
	VText1 := ""
	VText2 := ""
}
else if Vkeys = 1
{
	VHeal := "Хилки по очереди"
	Vutil := "Утилитки одновременно"
	VHealnumder := 2
	Vutilnumber := 3
	VText1 := ""
	VText2 := ""
}
else if Vkeys = 2
{
	VHeal := "Хилки по очереди"
	Vutil := "Утилитки одновременно"
	VHealnumder := 3
	Vutilnumber := 2
	VText1 := ""
	VText2 := ""
}
else if Vkeys = 3
{
	VHeal := "Хилки по очереди"
	Vutil := "Утилитки по очереди"
	VHealnumder := 3
	Vutilnumber := 2
	VText1 := ""
	VText2 := ""
}
else if Vkeys = 4
{
	VHeal := "Хилки по очереди"
	Vutil := "Утилитка"
	VHealnumder := 4
	Vutilnumber := 1
	VText1 := ""
	VText2 := ""
}	
else if Vkeys = 5
{
	VHeal := "Хилки по очереди"
	Vutil := "Утилитки по очереди"
	VHealnumder := 2
	Vutilnumber := 2
	VText1 := ""
	VText2 := ""
}
else if Vkeys = 6
{
	VHeal := "Хилка на 1 и 2"
	Vutil := "Утилитки одновременно"
	VHealnumder := 1
	Vutilnumber := 4
	VText1 := ""
	VText2 := ""
}
else if Vkeys = 7
{
	VHeal := "Хилки по очереди"
	Vutil := "Утилитки одновременно"
	VHealnumder := 2
	Vutilnumber := 2
	VText1 := ""
	VText2 := ""
}
else if Vkeys = 8
{
	VHeal := "Хилки по очереди"
	Vutil := "Утилитки одновременно"
	VHealnumder := 2
	Vutilnumber := 2
	VText1 := "d = 5"
	VText2 := ""
}
else if Vkeys = 9
{
	VHeal := "Хилка на 1 и 2"
	Vutil := "Утилитки одновременно"
	VHealnumder := 1
	Vutilnumber := 3
	VText1 := "d = 5"
	VText2 := ""
}
else if Vkeys = 10
{
	VHeal := "Хилка на 1 и 2"
	Vutil := "Утилитки одновременно"
	VHealnumder := 1
	Vutilnumber := 3
	VText1 := "d = 345"
	VText2 := ""
}
else if Vkeys = 11
{
	VHeal := "Хилка на 1 и 2"
	Vutil := "Утилитки одновременно"
	VHealnumder := 1
	Vutilnumber := 3
	VText1 := "d = 234"
	VText2 := ""
}
else if Vkeys = 12
{
	VHeal := "Хилка+Cry на 1 и 2"
	Vutil := "Утилитки одновременно"
	VHealnumder := 1
	Vutilnumber := 3
	VText1 := "d = 234"
	VText2 := ""
}
Sleep, % Sleepfunction(30, 50)
; ---------------------
; Код самого Gui
Gui, +LastFound +AlwaysOnTop +ToolWindow +OwnDialogs
Gui, Font, S18 W600, Verdana
; Буквы, первой и второй строки - тень, вторая сам текст
Gui, Add, Text, x36 y17 c000000 BackgroundTrans, %VHeal%`n%Vutil%
Gui, Add, Text, x33 y14 c007c07 BackgroundTrans, %VHeal%`n%Vutil%
; Цифры хилок (перед первой строкой)
Gui, Font, S28 W700, Verdana
Gui, Add, Text, x4 y4 c000000 BackgroundTrans, %VHealnumder%
Gui, Add, Text, x0 y0 cd1e150 BackgroundTrans, %VHealnumder%
; Цифры утилок (перед второй строкой)
Gui, Add, Text, x4 y38 c000000 BackgroundTrans, %Vutilnumber%
Gui, Add, Text, x0 y34 cd1e150 BackgroundTrans, %Vutilnumber%
; Небольшой текст, начинается под цифрами
Gui, Font, S14 W900, Verdana
Gui, Add, Text, x0 y83 c000000 BackgroundTrans, %VText1%
Gui, Add, Text, x0 y89 c000000 BackgroundTrans, %VText1%
Gui, Add, Text, x6 y83 c000000 BackgroundTrans, %VText1%
Gui, Add, Text, x6 y89 c000000 BackgroundTrans, %VText1%
Gui, Add, Text, x3 y86 c00c90b BackgroundTrans, %VText1%
; Небольшой текст, начинается под часами
Gui, Font, S14 W900, Verdana
Gui, Add, Text, x120 y83 c000000 BackgroundTrans, %VText2%
Gui, Add, Text, x120 y89 c000000 BackgroundTrans, %VText2%
Gui, Add, Text, x126 y83 c000000 BackgroundTrans, %VText2%
Gui, Add, Text, x126 y89 c000000 BackgroundTrans, %VText2%
Gui, Add, Text, x123 y86 c00c90b BackgroundTrans, %VText2%
; Значение переменной Vkeys
Gui, Font, S16 W900, Verdana
Gui, Add, Text, x215 y80 c000000 BackgroundTrans, keys %Vkeys%
Gui, Add, Text, x215 y86 c000000 BackgroundTrans, keys %Vkeys%
Gui, Add, Text, x221 y80 c000000 BackgroundTrans, keys %Vkeys%
Gui, Add, Text, x221 y86 c000000 BackgroundTrans, keys %Vkeys%
Gui, Add, Text, x219 y83 ca0a0a0 BackgroundTrans, keys %Vkeys%
; Кнопка для автопрожатия хп фласок
; Gui, add, Picture, x308 y88 w22 h25 gAutoflask, %A_ScriptDir%\res\hp-A.png
; показ и положение Gui
Gui, Show, x220 y870 NoActivate, Flask
; прозрачность
Gui, Color, 000001
WinSet, TransColor, 000001
Gui, -Caption
return
;==============================================
; Сброс биндов на дефолтные и отключение автокаста при нажатии F7, Enter, Ctrl+Enter, и комбинаций Shift+кнопка мыши (как правая так и левая)
; Бинд разделен на 2 части, что б звук воспроизводился только при активном окне PoE и только на бинды Shift+кнопки мыши, Enter и Ctrl+Enter.
; Для Shift+кнопки мыши потому, что на другие хоткеи сложно нажать случайно, но сами они нажимаются часто по прямому назначению и постоянный звук бы раздражжал.
; Для Enter и Ctrl+Enter что б при альтабе что-то напечатать хоткеи не слетали. F7 же работает вне зависимости от активного окна.
#IfWinActive ahk_exe PathOfExile_x64.exe
; ~+RButton::
; ~+LButton::
~sc1C::
~^sc1C::
	if Vkeys > 0
	{
		SoundPlay, %A_ScriptDir%\res\off.wav
		SendInput, {F7}
	}
; Так же в этот бинд добавлена отправка хоткея F4 в Path of Exile 3.0.ahk, что бы отключать автокликер нормально (сбрасывая значение переменной).
SetTitleMatchMode, 2
DetectHiddenWindows, On
if WinExist("BlightClicker ahk_class AutoHotkey")
{
	SendLevel  1 
	SendInput, {F4}
}
return
#IfWinActive
;========================================================
; Этот блок добавлен, потому что звук на Shift+кнопки мыши пока не нужен, и так норм.
#IfWinActive ahk_exe PathOfExile_x64.exe
~+RButton::
~+LButton::
; ~sc1C::
; ~^sc1C::
	if Vkeys > 0
	{
		; SoundPlay, %A_ScriptDir%\res\off.wav
		SendInput, {F7}
	}
; Так же в этот бинд добавлена отправка хоткея F4 в Path of Exile 3.0.ahk, что бы отключать автокликер нормально (сбрасывая значение переменной).
SetTitleMatchMode, 2
DetectHiddenWindows, On
if WinExist("BlightClicker ahk_class AutoHotkey")
{
	SendLevel  1 
	SendInput, {F4}
}
return
#IfWinActive
;==============================================
;==============================================
; Сброс биндов на дефолтные и отключение автокаста при нажатии F7, Enter и Ctrl+Enter
F7::
; --------------------------------------------------------------------------------
; Отключение автофласок (предположительно, еще не разбирал их)
; SetTitleMatchMode, 2
; DetectHiddenWindows, On
; WinClose, Loop HP All flask.ahk - AutoHotkey v
; Sleep, 20
; Var_auto_skils := 0
; Var_autoflask_bind := 0
; VautoButton := 0
; --------------------------------------------------------------------------------
; Остановка автопрожатия фласки с маной
; SetTimer, ManaLoop, Off
; Var_mana_toggle := 0
; Menu, Tray, Icon, %A_ScriptDir%\res\Life_flask1.png, 1
; --------------------------------------------------------------------------------
; Остановка автокаста
SetTitleMatchMode, 2
DetectHiddenWindows, On
WinClose, %Var_path_auto_skils% - AutoHotkey v
Var_auto_skils = 0
; --------------------------------------------------------------------------------
; Установка стандартных биндов
Vkeys := 0
; --------------------------------------------------------------------------------
; Закрытие всех Gui
Gui, Destroy
Gui, 2:Destroy
Gui, 3:Destroy
; -------------------
; отображение Gui, со значением переменной Vkeys, что б было видно, что она равно 0. Нужен что б знать, что сам скрипт запущен.
Gui, +LastFound +AlwaysOnTop +ToolWindow +OwnDialogs
Gui, Font, S16 W900, Verdana
Gui, Add, Text, x215 y80 c000000 BackgroundTrans, keys %Vkeys%
Gui, Add, Text, x215 y86 c000000 BackgroundTrans, keys %Vkeys%
Gui, Add, Text, x221 y80 c000000 BackgroundTrans, keys %Vkeys%
Gui, Add, Text, x221 y86 c000000 BackgroundTrans, keys %Vkeys%
Gui, Add, Text, x219 y83 ca0a0a0 BackgroundTrans, keys %Vkeys%
; показ и положение Gui
Gui, Show, x220 y870 NoActivate, Flask
; прозрачность
Gui, Color, 000001
WinSet, TransColor, 000001
Gui, -Caption
return
;=============================================
; Сброс биндов на дефолтные и отключение автокаста при скроле мышкой, ну пусть будет закомментированным пока.
/* Отключено на время левелинга.
~WheelDown::
~WheelUp::
if Vkeys > 0
{
	SetTitleMatchMode, 2
	DetectHiddenWindows, On
	WinClose, Loop HP All flask.ahk - AutoHotkey v
	Sleep, % Sleepfunction(60, 80)
	WinClose, support skils script\Molten Shell and Vortex.ahk - AutoHotkey v
	Sleep, 20
	Var_auto_skils := 0
	Var_autoflask_bind := 0
	VautoButton := 0
	Vkeys := 0
	Gui, Destroy
	Gui, 2:Destroy
	Gui, 3:Destroy

	Gui, +LastFound +AlwaysOnTop +ToolWindow +OwnDialogs
	Gui, Font, S16 W900, Verdana
	Gui, Add, Text, x215 y80 c000000 BackgroundTrans, keys %Vkeys%
	Gui, Add, Text, x215 y86 c000000 BackgroundTrans, keys %Vkeys%
	Gui, Add, Text, x221 y80 c000000 BackgroundTrans, keys %Vkeys%
	Gui, Add, Text, x221 y86 c000000 BackgroundTrans, keys %Vkeys%
	Gui, Add, Text, x219 y83 ca0a0a0 BackgroundTrans, keys %Vkeys%
	; показ и положение Gui
	Gui, Show, x220 y870 NoActivate, Flask
	; прозрачность
	Gui, Color, 000001
	WinSet, TransColor, 000001
	Gui, -Caption
}
else if Vkeys = 0
{
	Sleep, 10
}
return 
*/
;=============================================
; Gui для автофласок, с ними надо еще разобраться (в списке "Надо разобраться с:" пункт 2)
; Autoflask:
; !sc21::
; SetTitleMatchMode, 2
; DetectHiddenWindows, On
; WinClose, Loop HP All flask.ahk - AutoHotkey v ; Закрывает цикл, если он работает
; Sleep, 20
; if VautoButton = 0	; если переменные клавиш в исходном состоянии - бинд клавиши D будет d = 2+3+4+5. При нажатии
; {					; хоткея или кнопки отрисовывается Gui, меняются значения VautoButton и Var_autoflask_bind на 1
	; Gui, 2:Destroy	; После этого бинд клавиши D будет запускать скрипт автофласок.
	; Gui, 3:Destroy
	; SoundBeep, 60, 50
	; Sleep, 20
	; Gui, 2:+LastFound +AlwaysOnTop +ToolWindow +OwnDialogs
	; Gui, 2:Font, S36 W900, Verdana
	; Gui, 2:Add, Text, x10 y3 c000000 BackgroundTrans, !!!!
	; Gui, 2:Add, Text, x6 y0 cb40a0a BackgroundTrans, !!!!
	; Gui, 2:Show, x480 y870 NoActivate, Auto_on
	; Gui, 2:Color, 000001
	; WinSet, TransColor, 000001
	; Gui, 2:-Caption
	; Var_autoflask_bind := 1
	; VautoButton := 1
; }
; else if VautoButton = 1 ; если биндом клавиши является запуск скрипта - меняет бинд на дефолтный.
; {
	; Gui, 2:Destroy
	; Gui, 3:Destroy
	; SoundBeep, 60, 50
	; Sleep, 20
	; Gui, 2:+LastFound +AlwaysOnTop +ToolWindow +OwnDialogs
	; Gui, 2:Font, S36 W900, Verdana
	; Gui, 2:Add, Text, x10 y3 c000000 BackgroundTrans, 
	; Gui, 2:Add, Text, x6 y0 cb40a0a BackgroundTrans, 
	; Gui, 2:Show, x480 y870 NoActivate, Auto_off
	; Gui, 2:Color, 000001
	; WinSet, TransColor, 000001
	; Gui, 2:-Caption
	; Var_autoflask_bind := 0
	; VautoButton := 0
; }
; return
;==============================================
:*:111111::
reload
return
;==============================================