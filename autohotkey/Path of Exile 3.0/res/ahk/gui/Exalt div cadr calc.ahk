Menu, Tray, Icon, %A_ScriptDir%\res\pic\tab.png, 1

;===============================================================
; Text
;===============
; Fixed text
Gui, 99:Font, S10 Bold, Verdana
Gui, 99:Add, Text, x10 y12, EX=
Gui, 99:Add, Text, x100 y15, Card name
Gui, 99:Add, Text, x100 y50, The Hoarder
Gui, 99:Add, Text, x100 y80, The Saint's Treasure
Gui, 99:Add, Text, x100 y110, Abandoned Wealth
Gui, 99:Add, Text, x255 y15, Stack
Gui, 99:Add, Text, x270 y50, 12
Gui, 99:Add, Text, x270 y80, 10
Gui, 99:Add, Text, x275 y110, 5
Gui, 99:Add, Text, x305 y15, EX
Gui, 99:Add, Text, x315 y50, 1
Gui, 99:Add, Text, x315 y80, 2
Gui, 99:Add, Text, x315 y110, 3
Gui, 99:Add, Text, x335 y15, Price for 1 card
Gui, 99:Add, Text, x455 y15, Profit (in CO)
;===============
; Variable text
Gui, 99:Add, Text, x485 y50 c00ff00 vProfit1, ???
Gui, 99:Add, Text, x485 y80 c00ff00 vProfit2, ???
Gui, 99:Add, Text, x485 y110 c00ff00 vProfit3, ???
;===============
; Edit
Gui, 99:Add, Edit, x45 y10 w40 Number r1 vEx, 1
Gui, 99:Add, Edit, x370 y45 w40 Number r1 vCard1, 1
Gui, 99:Add, Edit, x370 y75 w40 Number r1 vCard2, 1
Gui, 99:Add, Edit, x370 y105 w40 Number r1 vCard3, 1
;===============
; Buttons in Gui
Gui, 99:Add, Button, x45 y45 w40 h25 gInfo1, Info
Gui, 99:Add, Button, x45 y75 w40 h25 gInfo2, Info
Gui, 99:Add, Button, x45 y105 w40 h25 gInfo3, Info
Gui, 99:Add, Button, x40 y150 w130 h30 gClose99, Close
Gui, 99:Add, Button, x380 y150 w130 h30 gResult, Result
;===============
Gui, 99:Color, 666666
Gui, 99:Show, x430 y200, Exalt Divination Card Calculator
Return
;===============
99GuiClose:
ExitApp
return
;===============================================================
; Button functions:
;===============================================================
Result:
GuiControlGet, Ex
GuiControlGet, Card1
GuiControlGet, Card2
GuiControlGet, Card3
vResult1 := Ex*1  - 12*Card1
vResult2 := Ex*2  - 10*Card2
vResult3 := Ex*3  - 5*Card3
GuiControl,, Profit1, %vResult1%
GuiControl,, Profit2, %vResult2%
GuiControl,, Profit3, %vResult3%
return
;===============
Close99:
ExitApp
return
;===============
;===============================================================
; Gui The Hoarder
Info1:
Gui, 1:Font, S12 Bold, Verdana
;==========Buttons=========
Gui, 1:Add, Button, x15 y5 w80 h25 gSearch1, Search
Gui, 1:Add, Button, x+20 y5 w80 h25 gWiki1, Wiki
Gui, 1:Add, Button, x+20 y5 w80 h25 gCopy1, Copy
;============Text==========
Gui, 1:Font, S11 W700, Verdana
Gui, 1:Add, Text, x15 y+5 cc90a00, Drop locations:
Gui, 1:Font, S11 W500, Verdana
;============Edit==========
Gui, 1:Add, Edit, x15 y+5 w280 r4 ReadOnly, The Belly of the Beast - Act 4`nThe Harvest - Act 4`nThe Rotting Core - Act 9`nVault Map
;===============
Gui, 1:Font, S12 Bold, Verdana
Gui, 1:Add, Button, x115 y+5 w80 h25 gClose1, Close
;===============
Gui, 1:Color, 888888
Gui, 1:Show, x490 y183, The Hoarder
return
;=================================
; Button functions The Hoarder Gui
Search1:
run, https://www.pathofexile.com/trade/search/Synthesis/YByG4giY
return
Wiki1:
run, https://pathofexile.gamepedia.com/The_Hoarder
return
Copy1:
Clipboard := "The Hoarder"
Sleep, 20
ToolTip, copy The Hoarder
Sleep, 600
ToolTip
return
Close1:
Gui, 1:Destroy
Return

;===============================================================
; Gui The Saint's Treasure
Info2:
Gui, 2:Font, S12 Bold, Verdana
;==========Buttons=========
Gui, 2:Add, Button, x15 y5 w80 h25 gSearch2, Search
Gui, 2:Add, Button, x+20 y5 w80 h25 gWiki2, Wiki
Gui, 2:Add, Button, x+20 y5 w80 h25 gCopy2, Copy
;============Text==========
Gui, 2:Font, S11 W700, Verdana
Gui, 2:Add, Text, x15 y+5 cc90a00, Drop locations:
Gui, 2:Font, S11 W500, Verdana
;============Edit==========
Gui, 2:Add, Edit, x15 y+5 w280 r11 ReadOnly, The Slums - Act 3`nThe Marketplace - Act 3`nThe Imperial Fields - Act 8`nThe Grain Gate - Act 8`nAlleyways Map`nArcade Map`nArsenal Map`nBazaar Map`nGhetto Map`nPort Map`nPrecinct Map
;===============
Gui, 2:Font, S12 Bold, Verdana
Gui, 2:Add, Button, x115 y+5 w80 h25 gClose2, Close
;===============
Gui, 2:Color, 888888
Gui, 2:Show, x490 y183, The Saint's Treasure
return
;===============
; Button functions Saint's Treasure Gui
Search2:
run, https://www.pathofexile.com/trade/search/Synthesis/JBVKZ5Il
return
Wiki2:
Vlink3 := "https://pathofexile.gamepedia.com/The_Saint%27s_Treasure"
run, %Vlink3%
return
Copy2:
Clipboard := "The Saint's Treasure"
Sleep, 20
ToolTip, copy The Saint's Treasure
Sleep, 600
ToolTip
return
Close2:
Gui, 2:Destroy
Return

;===============================================================
; Gui Abandoned Wealth
Info3:
Gui, 3:Font, S12 Bold, Verdana
;==========Buttons=========
Gui, 3:Add, Button, x15 y5 w80 h25 gSearch3, Search
Gui, 3:Add, Button, x+20 y5 w80 h25 gWiki3, Wiki
Gui, 3:Add, Button, x+20 y5 w80 h25 gCopy3, Copy
;============Text==========
Gui, 3:Font, S11 W700, Verdana
Gui, 3:Add, Text, x15 y+5 cc90a00, Drop locations:
Gui, 3:Font, S11 W500, Verdana
;============Edit==========
Gui, 3:Add, Edit, x15 y+5 w280 r3 ReadOnly, Arsenal Map`nPrecinct Map`nMao Kun Unique Map
;===============
Gui, 3:Font, S12 Bold, Verdana
Gui, 3:Add, Button, x115 y+5 w80 h25 gClose3, Close
;===============
Gui, 3:Color, 888888
Gui, 3:Show, x490 y183, Abandoned Wealth
return
; Button functions Abandoned Wealth Gui
Search3:
run, https://www.pathofexile.com/trade/search/Synthesis/dy3DGoCJ
return
Wiki3:
run, https://pathofexile.gamepedia.com/Abandoned_Wealth
return
Copy3:
Clipboard := "Abandoned Wealth"
Sleep, 20
ToolTip, copy Abandoned Wealth
Sleep, 600
ToolTip
return
Close3:
Gui, 3:Destroy
Return
;==============================================