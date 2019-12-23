;пить все фласки на 3,4&d
;res\ahk\local\flusks 3.ahk - прожимает 5678
;res\ahk\local\2=1.ahk - прожимает 1
;res\ahk\local\fl\1.ahk - прожимает d
;res\ahk\local\fl\2.ahk - 4.ahk - прожимает соотвецтвующие клавиши (2,3,4)
flusks5678()
{
run,  "res\ahk\local\fl\flusks5678.ahk" \res\ahk\local\
}
flusks678()
{
run,  "res\ahk\local\fl\flusks678.ahk" \res\ahk\local\
}
sc3:: ;кнопка 2
If GetKeyState("ScrollLock", "T") = 0 ; если ScrollLock выключен 
  SendInput, {sc2}
If GetKeyState("ScrollLock", "T") = 1 ; если ScrollLock включен
  SendInput, {sc3}
return
sc4:: ;кнопка 3
If GetKeyState("ScrollLock", "T") = 0 ; если ScrollLock выключен
  flusks5678()
If GetKeyState("ScrollLock", "T") = 1 ; если ScrollLock включен
  SendInput, {sc4}
return
sc5:: ;кнопка 4
If GetKeyState("ScrollLock", "T") = 0 ; если ScrollLock выключен
  flusks5678()
If GetKeyState("ScrollLock", "T") = 1 ; если ScrollLock включен
  SendInput, {sc5}
return
sc20:: ;кнопка D
If GetKeyState("ScrollLock", "T") = 0 ; если ScrollLock выключен 
  flusks5678()
If GetKeyState("ScrollLock", "T") = 1 ; если ScrollLock включен
  SendInput, {sc20}
return