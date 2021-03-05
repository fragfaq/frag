Menu, Tray, Icon, %A_ScriptDir%\res\pic\Blood_Rage_skill_icon.png, 1
;==============================================
SetTimer, Adrenalin, 400
SetTimer, Blood_Rage, 420
SetTimer, Warchief, 440 ; Change to Lion's Roar
SetTimer, Molten, 460
SetTimer, Bleed, 500
SetTimer, Frozen, 540
SetTimer, Golem, 560
SetTimer, Aurs, 600
SetTimer, Reboot, 60000
Return
;==============================================
Adrenalin:
	PixelSearch, Px, Py, 20, 46, 1800, 46, 0x82581F, 0, Fast RGB ; Looking for Adrenalin
	; PixelSearch, Px, Py, 0, 0, 1600, 1033, 0x171717, 0, Fast RGB ; For tests Notepad and PoE any monitor
	; PixelSearch, Px, Py, 1518, 1024, 1518, 1024, 0x282B30, 0, Fast RGB ; For tests Notepad and PoE
	; PixelSearch, Px, Py, 20, 37, 1800, 37, 0xEF5910, 0, Fast RGB ; For tests PoE, Blood Rage Icon
	if ErrorLevel
	{
		Gui, 1:Destroy
	}
	else
	{
		Gui, 1:-Caption
		Gui, 1:+LastFound +AlwaysOnTop +ToolWindow +OwnDialogs
		Gui, 1:Font, S22 W900, Verdana
		Gui, 1:Add, Text, x7 y7 c000000 BackgroundTrans, ADRENALIN
		Gui, 1:Add, Text, x1 y7 c000000 BackgroundTrans, ADRENALIN
		Gui, 1:Add, Text, x7 y1 c000000 BackgroundTrans, ADRENALIN
		Gui, 1:Add, Text, x1 y1 c000000 BackgroundTrans, ADRENALIN
		Gui, 1:Add, Text, x4 y4 cFFFF00 BackgroundTrans, ADRENALIN
		Gui, 1:Color, 000001
		WinSet, TransColor, 000001
		Gui, 1:Show, x860 y200 w300 h45 NoActivate, ADR7
	}
Return
;============
Blood_Rage:
	PixelSearch, Px, Py, 20, 37, 1800, 37, 0xEF5910, 0, Fast RGB ; Looking for Blood Rage
	; PixelSearch, Px, Py, 0, 0, 1600, 1033, 0x171717, 0, Fast RGB ; For tests Notepad and PoE any monitor
	; PixelSearch, Px, Py, 1518, 1024, 1518, 1024, 0x282B30, 0, Fast RGB ; For tests Notepad and PoE
	; PixelSearch, Px, Py, 20, 37, 1800, 37, 0xEF5910, 0, Fast RGB ; For tests PoE, Blood Rage Icon
	if ErrorLevel
	{
		Gui, 2:Destroy
	}
	else
	{
		Gui, 2:-Caption
		Gui, 2:+LastFound +AlwaysOnTop +ToolWindow +OwnDialogs
		Gui, 2:Color, CC07CC
		Gui, 2:Show, x907 y320 w50 h8 NoActivate, BR
	}
Return
;============
Warchief:
	; PixelSearch, Px, Py, 20, 52, 300, 52, 0x49D723, 0, Fast RGB ; Looking for Warchief
	PixelSearch, Px, Py, 20, 51, 1800, 51, 0x473A23, 0, Fast RGB ; Looking for Lion's Roar
	; PixelSearch, Px, Py, 0, 0, 1600, 1033, 0x171717, 0, Fast RGB ; For tests Notepad and PoE any monitor
	; PixelSearch, Px, Py, 1518, 1024, 1518, 1024, 0x282B30, 0, Fast RGB ; For tests Notepad and PoE
	; PixelSearch, Px, Py, 20, 37, 1800, 37, 0xEF5910, 0, Fast RGB ; For tests PoE, Blood Rage Icon
	if ErrorLevel
	{
		Gui, 3:Destroy
	}
	else
	{
		Gui, 3:-Caption
		Gui, 3:+LastFound +AlwaysOnTop +ToolWindow +OwnDialogs
		Gui, 3:Color, 00FFFF
		Gui, 3:Show, x957 y320 w55 h8 NoActivate, AW
	}
Return
;============
Molten:
	PixelSearch, Px, Py, 10, 39, 1900, 39, 0xEB6C18, 0, Fast RGB ; Looking for Molten
	; PixelSearch, Px, Py, 0, 0, 1600, 1033, 0x171717, 0, Fast RGB ; For tests Notepad and PoE any monitor
	; PixelSearch, Px, Py, 1518, 1024, 1518, 1024, 0x282B30, 0, Fast RGB ; For tests Notepad and PoE
	; PixelSearch, Px, Py, 20, 37, 1800, 37, 0xEF5910, 0, Fast RGB ; For tests PoE, Blood Rage Icon
	if ErrorLevel
	{
		Gui, 4:Destroy
	}
	else
	{
		; SoundBeep, 60, 50
		Gui, 4:-Caption
		Gui, 4:+LastFound +AlwaysOnTop +ToolWindow +OwnDialogs
		Gui, 4:Font, S26 W900, Verdana
		Gui, 4:Add, Text, x5 y5 c000000 BackgroundTrans, M
		Gui, 4:Add, Text, x1 y5 c000000 BackgroundTrans, M
		Gui, 4:Add, Text, x5 y1 c000000 BackgroundTrans, M
		Gui, 4:Add, Text, x1 y1 c000000 BackgroundTrans, M
		Gui, 4:Add, Text, x3 y3 cFF8D00 BackgroundTrans, M
		Gui, 4:Color, 000001
		WinSet, TransColor, 000001
		Gui, 4:Show, x940 y370 w300 h45 NoActivate, Molten Shell
	}
Return
;============
Bleed:
	PixelSearch, Px, Py, 20, 114, 1800, 114, 0x66515E, 0, Fast RGB ; Looking for bleed
	; PixelSearch, Px, Py, 0, 0, 1600, 1033, 0x171717, 0, Fast RGB ; For tests Notepad and PoE any monitor
	; PixelSearch, Px, Py, 1518, 1024, 1518, 1024, 0x282B30, 0, Fast RGB ; For tests Notepad and PoE
	; PixelSearch, Px, Py, 20, 37, 1800, 37, 0xEF5910, 0, Fast RGB ; For tests PoE, Blood Rage Icon
	if ErrorLevel
	{
		Gui, 5:Destroy
		Sleep, 30
		PixelSearch, Px, Py, 20, 123, 1800, 123, 0x790B07, 0, Fast RGB ; Looking for Corrupted Blood if no bleed
		; PixelSearch, Px, Py, 0, 0, 1600, 1033, 0x171717, 0, Fast RGB ; For tests Notepad and PoE any monitor
		; PixelSearch, Px, Py, 1518, 1024, 1518, 1024, 0x282B30, 0, Fast RGB ; For tests Notepad and PoE
		; PixelSearch, Px, Py, 20, 52, 300, 52, 0x49D723, 0, Fast RGB ; For tests PoE, Warchief Icon
		if ErrorLevel
		{
			Gui, 6:Destroy
		}
		else
		{
			Gui, 6:-Caption
			Gui, 6:+LastFound +AlwaysOnTop +ToolWindow +OwnDialogs
			Gui, 6:+LastFound +AlwaysOnTop +ToolWindow +OwnDialogs
			Gui, 6:Font, S20 W900, Verdana
			Gui, 6:Add, Text, x3 y3 c000000 BackgroundTrans, Cor Blood
			Gui, 6:Add, Text, x0 y0 c980002 BackgroundTrans, Cor Blood
			Gui, 6:Color, 000001
			WinSet, TransColor, 000001
			Gui, 6:Show, x883 y280 w300 h45 NoActivate, Corrupted blood
		}
	}
	else
	{
		Gui, 6:Destroy
		Gui, 5:-Caption
		Gui, 5:+LastFound +AlwaysOnTop +ToolWindow +OwnDialogs
		Gui, 5:Font, S20 W900, Verdana
		Gui, 5:Add, Text, x3 y3 c000000 BackgroundTrans, BLEEEED
		Gui, 5:Add, Text, x0 y0 c980002 BackgroundTrans, BLEEEED
		Gui, 5:Color, 000001
		WinSet, TransColor, 000001
		Gui, 5:Show, x890 y280 w300 h45 NoActivate, Bleed
	}
Return
;============

;============
Frozen:
	PixelSearch, Px, Py, 20, 113, 1800, 113, 0x220403, 0, Fast RGB ; Looking for Frozen
	; PixelSearch, Px, Py, 0, 0, 1600, 1033, 0x171717, 0, Fast RGB ; For tests Notepad and PoE any monitor
	; PixelSearch, Px, Py, 1518, 1024, 1518, 1024, 0x282B30, 0, Fast RGB ; For tests Notepad and PoE
	; PixelSearch, Px, Py, 20, 37, 1800, 37, 0xEF5910, 0, Fast RGB ; For tests PoE, Blood Rage Icon
	if ErrorLevel
	{
		Gui, 7:Destroy
		Sleep, 30
		PixelSearch, Px, Py, 20, 108, 1800, 108, 0x57636D, 0, Fast RGB ; Looking for Chill if no Frozen
		; PixelSearch, Px, Py, 0, 0, 1600, 1033, 0x171717, 0, Fast RGB ; For tests Notepad and PoE any monitor
		; PixelSearch, Px, Py, 1518, 1024, 1518, 1024, 0x282B30, 0, Fast RGB ; For tests Notepad and PoE
		; PixelSearch, Px, Py, 20, 52, 300, 52, 0x49D723, 0, Fast RGB ; For tests PoE, Warchief Icon
		if ErrorLevel
		{
			Gui, 8:Destroy
		}
		else
		{
			Gui, 8:-Caption
			Gui, 8:+LastFound +AlwaysOnTop +ToolWindow +OwnDialogs
			Gui, 8:Font, S20 W900, Verdana
			Gui, 8:Add, Text, x3 y3 c0000ff BackgroundTrans, Chill
			Gui, 8:Add, Text, x0 y0 cffffff BackgroundTrans, Chill
			Gui, 8:Color, 000001
			WinSet, TransColor, 000001
			Gui, 8:Show, x920 y255 w300 h45 NoActivate, Chill
		}
	}
	else
	{
		Gui, 8:Destroy
		Gui, 7:-Caption
		Gui, 7:+LastFound +AlwaysOnTop +ToolWindow +OwnDialogs
		Gui, 7:Font, S20 W900, Verdana
		Gui, 7:Add, Text, x3 y3 cffffff BackgroundTrans, Frozen
		Gui, 7:Add, Text, x0 y0 c0000ff BackgroundTrans, Frozen
		Gui, 7:Color, 000001
		WinSet, TransColor, 000001
		Gui, 7:Show, x905 y255 w300 h45 NoActivate, Frozen
	}
Return
;============
Golem:
	PixelSearch, Px, Py, 27, 31, 1100, 31, 0x0A4961, 0, Fast RGB ; Looking for Molten
	; PixelSearch, Px, Py, 0, 0, 1600, 1033, 0x171717, 0, Fast RGB ; For tests Notepad and PoE any monitor
	; PixelSearch, Px, Py, 1518, 1024, 1518, 1024, 0x282B30, 0, Fast RGB ; For tests Notepad and PoE
	; PixelSearch, Px, Py, 20, 37, 1800, 37, 0xEF5910, 0, Fast RGB ; For tests PoE, Blood Rage Icon
	if ErrorLevel
	{
		Gui, 9:Destroy
	}
	else
	{
		Gui, 9:-Caption
		Gui, 9:+LastFound +AlwaysOnTop +ToolWindow +OwnDialogs
		Gui, 9:Color, 57aeb2
		Gui, 9:Show, x531 y990 w18 h100 NoActivate, Golem
	}
Return
;============
Aurs:
	PixelSearch, Px, Py, 1775, 1019, 1775, 1019, 0x0c4080, 0, Fast RGB ; Looking for Mana
	; PixelSearch, Px, Py, 0, 0, 1600, 1033, 0x171717, 0, Fast RGB ; For tests Notepad and PoE any monitor
	; PixelSearch, Px, Py, 1518, 1024, 1518, 1024, 0x282B30, 0, Fast RGB ; For tests Notepad and PoE
	; PixelSearch, Px, Py, 20, 37, 1800, 37, 0xEF5910, 0, Fast RGB ; For tests PoE, Blood Rage Icon
	if ErrorLevel
	{
		Gui, 10:Destroy
	}
	else
	{
		PixelSearch, Px, Py, 1881, 924, 1881, 924, 0x927355, 0, Fast RGB ; Looking for Hud
		if ErrorLevel
		{
			Gui, 10:Destroy
		}
		else
		{
			Gui, 10:-Caption
			Gui, 10:+LastFound +AlwaysOnTop +ToolWindow +OwnDialogs
			Gui, 10:Font, S40 W900, Verdana
			Gui, 10:Add, Text, x3 y3 cffffff BackgroundTrans, Aurs!
			Gui, 10:Add, Text, x0 y0 c0e5a0c BackgroundTrans, Aurs!
			Gui, 10:Color, 000001
			WinSet, TransColor, 000001
			Gui, 10:Show, x890 y510 NoActivate, Aurs
		}
	}
Return
;==============================================
Reboot:
	Reload
Return
;==============================================
;==============================================
;перезапуск скрипта на Control+r
; ^sc13::
; Reload
; return