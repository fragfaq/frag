﻿Random, v1, 50, 80 ; генерирует рандомное число в промежутке на переменные v1 - v5
Random, v2, 50, 80
Random, v3, 50, 80
Random, v4, 50, 80
sleep, %v1% ; пауза из переменной v1
SendInput, {sc3} ; пьется фласка с биндом на цифру 2
sleep, %v2% ; пауза из переменной v2
SendInput, {sc4} ; пьется фласка с биндом на цифру 3
sleep, %v3% ; пауза из переменной v3
SendInput, {sc5} ; пьется фласка с биндом на цифру 4
sleep, %v4% ; пауза из переменной v4
SendInput, {sc6} ; пьется фласка с биндом на цифру 5
Exit
