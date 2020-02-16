ClipSaved := ClipboardAll
Random, vS1, 100, 300
Random, vS2, 100, 300
Clipboard = /clear
SendInput, {Enter}
Sleep, %vS1%
SendInput, ^{sc2F}
Sleep, %vS2%
SendInput, {Enter}
Clipboard := ClipSaved
exit