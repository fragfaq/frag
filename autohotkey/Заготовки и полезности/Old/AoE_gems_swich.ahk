Random, Vspeed1, 4, 10
Random, Vspeed2, 4, 10
Random, Vspeed3, 4, 10
Random, Vspeed4, 4, 10

Random, vS1, 100, 200
Random, vS2, 100, 200
Random, vS3, 100, 200
Random, vS4, 100, 200
Random, vS5, 100, 200
Random, vS6, 100, 200
Random, vS7, 100, 200
Random, vS8, 100, 200
Random, vS9, 100, 200
Random, vS10, 100, 200
Random, vS11, 100, 200
Random, vS12, 100, 200

Random, vXpull, 1347, 1358		; гем в 1ом слоте трехлинка основной руки
Random, vYpull, 191, 203		; генерация координат что б вытащить гем
Random, vXreplace, 1603, 1624	; гем в 6ом слоте броньки
Random, vYreplace, 350, 369		; генерация координат что б поменять гемы
Random, vXpush, 1347, 1358		; гем в 1ом слоте трехлинка основной руки
Random, vYpush, 191, 203		; генерация координат что б вставить гем

BlockInput On
Sleep, %vS1%
MouseGetPos AreaX, AreaY						; запомнить позицию курсора
Sleep, %vS2%
SendInput, {sc12}								; открыть инвентарь на E
Sleep, %vS3%
SendInput, {sc2D}								; сменить раскладку оружия на вторую
Sleep, %vS4%
MouseMove, %vXpull%, %vYpull%, %Vspeed1%		; передвинуть курсор на гем
Sleep, %vS5%
Click right										; вынуть гем
Sleep, %vS6%
MouseMove, %vXreplace%, %vYreplace%, %Vspeed2%	; передвинуть курсор с гемом на второй гем
Sleep, %vS7%
Click left										; поменять гемы местами
Sleep, %vS8%
MouseMove, %vXpush%, %vYpush%, %Vspeed3%		; передвинуть курсор с гемом в пустой сокет
Sleep, %vS9%
Click left										; вставить гем в пустой сокет
Sleep, %vS10%
SendInput, {sc2D}								; сменить раскладку оружия на основную
Sleep, %vS11%
SendInput, {sc12}								; закрыть инвентарь на E
Sleep, %vS12%
MouseMove, AreaX, AreaY, %Vspeed4%				; вернуть курсор на исходную позицию
BlockInput Off
return

