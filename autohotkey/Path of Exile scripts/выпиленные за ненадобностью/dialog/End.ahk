ClipSaved := ClipboardAll
Random, vS1, 100, 190
Random, vS2, 100, 190
Random, vS3, 100, 190
Random, vS4, 100, 190
Clipboard = /abandon_daily
SendInput, {Enter}
Sleep, %vS1%
SendInput, ^{sc2F}
Sleep, %vS2%
SendInput, {Enter}
Clipboard := ClipSaved
exit