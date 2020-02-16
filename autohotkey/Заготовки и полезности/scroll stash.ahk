;скролл сундука
^WheelUp::
Random, vLeft, 50, 100
Random, vRight, 50, 100
SendInput, {Left}
return
sleep, %vLeft%
^WheelDown::
SendInput, {Right}
sleep, %vRight%
return