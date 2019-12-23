; функции рандомных пауз и скорости мыши

mspeed(min, max)
{
	random, randa, min, max
	return randa
}

pausesleep(min, max)
{
	random, randb, min, max
	return randb
}

; функции рандомных координатов скилов

Random, StartSkillX, 1647, 1675
Random, StartSkillY, 1026, 1054
Random, Skill_1_X, 1420, 1465
Random, Skill_1_Y, 550, 591
Random, Skill_2_X, 1483, 1527
Random, Skill_2_Y, 549, 598
Random, Skill_3_X, 1546, 1593
Random, Skill_3_Y, 547, 592
Random, Skill_4_X, 1419, 1467
Random, Skill_4_Y, 615, 660
Random, Skill_5_X, 1485, 1530
Random, Skill_5_Y, 617, 662
Random, Skill_6_X, 1546, 1596
Random, Skill_6_Y, 616, 660
Random, Skill_7_X, 1426, 1468
Random, Skill_7_Y, 691, 727
Random, Skill_8_X, 1487, 1529
Random, Skill_8_Y, 686, 724
Random, Skill_9_X, 1549, 1596
Random, Skill_9_Y, 681, 727
Random, Skill_10_X, 1422, 1467
Random, Skill_10_Y, 743, 789
Random, Skill_11_X, 1483, 1529
Random, Skill_11_Y, 743, 787
Random, Skill_12_X, 1545, 1596
Random, Skill_12_Y, 743, 794
Random, Skill_13_X, 1417, 1466
Random, Skill_13_Y, 806, 859
Random, Skill_14_X, 1484, 1527
Random, Skill_14_Y, 807, 853
Random, Skill_15_X, 1548, 1596
Random, Skill_15_Y, 814, 857
; указанные скилы прожимаются

BlockInput On
sleep, % pausesleep(100, 200)
MouseGetPos VauraX, VauraY									; Сохраняет текущие координаты курсора
sleep, % pausesleep(100, 200)
MouseMove, %StartSkillX%, %StartSkillY%, % mspeed(4, 8)		; Наводит курсор открыть список скилов
sleep, % pausesleep(100, 200)
Click left													; Нажимает на скил, открывает список скилов
sleep, % pausesleep(100, 200)
; ============================================= Номер ауры 1
MouseMove, %Skill_9_X%, %Skill_9_Y%, % mspeed(4, 8)			; Наводит курсор на первую ауру
sleep, % pausesleep(100, 200)
Click left													; Выбирает первую ауру
sleep, % pausesleep(100, 200)
SendInput, {scB}											; Прожимает первую ауру
sleep, % pausesleep(100, 200)
MouseMove, %StartSkillX%, %StartSkillY%, % mspeed(4, 8)		; Наводит курсор открыть список скилов
sleep, % pausesleep(100, 200)
Click left													; Нажимает на скил, открывает список скилов
sleep, % pausesleep(100, 200)
; ============================================= Номер ауры 2
MouseMove, %Skill_4_X%, %Skill_4_Y%, % mspeed(4, 8)			; Наводит курсор на вторую ауру
sleep, % pausesleep(100, 200)
Click left													; Выбирает ауру
sleep, % pausesleep(100, 200)
SendInput, {scB}											; Прожимает ауру
sleep, % pausesleep(100, 200)
MouseMove, %StartSkillX%, %StartSkillY%, % mspeed(4, 8)		; Наводит курсор открыть список скилов
sleep, % pausesleep(100, 200)
Click left													; Нажимает на скил, открывает список скилов
sleep, % pausesleep(100, 200)
; ============================================= Номер ауры 3
MouseMove, %Skill_6_X%, %Skill_6_Y%, % mspeed(4, 8)			; Наводит курсор на третью ауру
sleep, % pausesleep(100, 200)
Click left													; Выбирает ауру
sleep, % pausesleep(100, 200)
SendInput, {scB}											; Прожимает ауру
sleep, % pausesleep(100, 200)
MouseMove, %StartSkillX%, %StartSkillY%, % mspeed(4, 8)		; Наводит курсор открыть список скилов
sleep, % pausesleep(100, 200)
Click left													; Нажимает на скил, открывает список скилов
sleep, % pausesleep(100, 200)
; ============================================= Номер ауры 4
MouseMove, %Skill_12_X%, %Skill_12_Y%, % mspeed(4, 8)		; Наводит курсор на четвертую ауру
sleep, % pausesleep(100, 200)
Click left													; Выбирает ауру
sleep, % pausesleep(100, 200)
SendInput, {scB}											; Прожимает ауру
sleep, % pausesleep(100, 200)
MouseMove, %StartSkillX%, %StartSkillY%, % mspeed(4, 8)		; Наводит курсор открыть список скилов
sleep, % pausesleep(100, 200)
Click left													; Нажимает на скил, открывает список скилов
sleep, % pausesleep(100, 200)
; ================================== Номер ауры 5, если есть
MouseMove, %Skill_13_X%, %Skill_13_Y%, % mspeed(4, 8)		; Наводит курсор на четвертую ауру
sleep, % pausesleep(100, 200)
Click left													; Выбирает ауру
sleep, % pausesleep(100, 200)
SendInput, {scB}											; Прожимает ауру
sleep, % pausesleep(100, 200)
MouseMove, %StartSkillX%, %StartSkillY%, % mspeed(4, 8)		; Наводит курсор открыть список скилов
sleep, % pausesleep(100, 200)
Click left													; Нажимает на скил, открывает список скилов
sleep, % pausesleep(100, 200)
; ==================== Номер ауры 6 или изначального скрипта
MouseMove, %Skill_10_X%, %Skill_10_Y%, % mspeed(4, 8)		; Наводит курсор на первый изначальный скил
sleep, % pausesleep(100, 200)
Click left													; Выбирает изначальный скил
sleep, % pausesleep(100, 200)
MouseMove, VauraX, VauraY, % mspeed(4, 8)					; Наводит курсор на первый скил
BlockInput Off


; return

; 7 4 5 9 12 13 14=0 vaal cyclone 20-20
; 7 4 5 9 12 13 8=0 - cyclone 21-20


; ==============================================
; перезапуск скрипта
; +sc13::
; Reload
; return
















