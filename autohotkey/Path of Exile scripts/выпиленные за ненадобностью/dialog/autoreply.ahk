﻿ClipSaved := ClipboardAll
Random, vS1, 100, 190
Random, vS2, 100, 190
Random, vS3, 100, 190
Random, vS4, 100, 190
Clipboard = /autoreply
Sleep, %vS1%
SendInput, {Enter}
Sleep, %vS2%
SendInput, ^{sc2F}
Sleep, %vS3%
SendInput, {space}
Sleep, %vS4%
Clipboard := ClipSaved
exit