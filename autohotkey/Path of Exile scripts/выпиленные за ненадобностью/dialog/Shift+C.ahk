﻿ClipSaved := ClipboardAll
Random, vS1, 100, 190
Random, vS2, 100, 190
Clipboard = 3
Sleep, %vS1%
SendInput, ^{sc2F}
Sleep, %vS2%
Clipboard := ClipSaved