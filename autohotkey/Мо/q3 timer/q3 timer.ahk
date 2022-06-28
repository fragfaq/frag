#SingleInstance Force

sc2F::
SendInput, {sc2F}
SetTimer, Timer1, 24000
return

sc2D::
SendInput, {sc2D}
SetTimer, Timer2, 24000
return

Timer1:
SoundPlay, %A_ScriptDir%\res\1.mp3
SetTimer, Timer1, off
return

Timer2:
SoundPlay, %A_ScriptDir%\res\2.mp3
SetTimer, Timer2, off
return