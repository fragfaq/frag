﻿Random, v1, 50, 80 ; генерирует рандомное число в промежутке на переменные v1 - v5
Random, v2, 50, 80
Random, v3, 50, 80
Random, v4, 50, 80
Random, v5, 50, 80
sleep, %v1% ; пауза из переменной v1
Send, {sc2} ; пьется фласка с биндом на цифру 1
sleep, %v2% ; пауза из переменной v2
Send, {sc3} ; пьется фласка с биндом на цифру 2
sleep, %v3% ; пауза из переменной v3
Send, {sc4} ; пьется фласка с биндом на цифру 3
sleep, %v4% ; пауза из переменной v4
Send, {sc5} ; пьется фласка с биндом на цифру 4
sleep, %v5% ; пауза из переменной v5
Send, {sc6} ; пьется фласка с биндом на цифру 5
Exit 