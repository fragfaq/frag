Menu, Tray, Icon, %A_ScriptDir%\res\pic\Blood_Rage_skill_icon.png, 1
;==============================================
SetTimer, Bone_Armor, 400
SetTimer, Phase_Run, 450
SetTimer, Bleed, 500
SetTimer, Frozen, 550
SetTimer, Bern, 600
SetTimer, Reboot, 60000
Return
;==============================================
Phase_Run:
	PixelSearch, Px, Py, 20, 50, 1800, 50, 0x081D3A, 0, Fast RGB ; Looking for Phase Run
	if ErrorLevel
	{
		Gui, 2:Destroy
	}
	else
	{
		Gui, 2:-Caption
		Gui, 2:+LastFound +AlwaysOnTop +ToolWindow +OwnDialogs
		Gui, 2:Color, CC07CC
		Gui, 2:Show, x907 y315 w50 h9 NoActivate, Phase_Run
	}
Return
;============
Bone_Armor:
	PixelSearch, Px, Py, 300, 31, 1800, 31, 0xB0AC00, 0, Fast RGB ; Looking for Bone Armor - working
	if ErrorLevel
	{
		Gui, 3:Destroy
	}
	else
	{
		Gui, 3:-Caption
		Gui, 3:+LastFound +AlwaysOnTop +ToolWindow +OwnDialogs
		Gui, 3:Color, 00FFFF
		Gui, 3:Show, x957 y315 w55 h9 NoActivate, Bone_Armor
	}
Return
;============
Bern:
	PixelSearch, Px, Py, 20, 118, 1800, 118, 0xE99200, 0, Fast RGB ; Looking for Bern - work
	; PixelSearch, Px, Py, 1, 1, 1920, 1080, 0xE99200, 255, Fast RGB ; Test Gui
	if ErrorLevel
	{
		Gui, 4:Destroy
	}
	else
	{
		Gui, 4:Destroy
		Gui, 4:-Caption
		Gui, 4:+LastFound +AlwaysOnTop +ToolWindow +OwnDialogs
		Gui, 4:Font, S20 W900, Verdana
		Gui, 4:Add, Text, x3 y3 c000000 BackgroundTrans, BERN
		Gui, 4:Add, Text, x0 y0 cf26200 BackgroundTrans, BERN
		Gui, 4:Color, 000001
		WinSet, TransColor, 000001
		Gui, 4:Show, x915 y270 w300 h45 NoActivate, Bern
	}
Return
;============
Bleed:
	PixelSearch, Px, Py, 20, 114, 1800, 114, 0x66515E, 0, Fast RGB ; Looking for bleed
	; PixelSearch, Px, Py, 1, 1, 1920, 1080, 0xE99200, 255, Fast RGB ; Test Gui
	if ErrorLevel
	{
		Gui, 5:Destroy
		Sleep, 30
		PixelSearch, Px, Py, 20, 123, 1800, 123, 0x790B07, 0, Fast RGB ; Looking for Corrupted Blood if no bleed
		; PixelSearch, Px, Py, 1, 1, 1920, 1080, 0xE99200, 255, Fast RGB ; Test Gui
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
			Gui, 6:Show, x883 y275 w300 h45 NoActivate, Corrupted blood
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
		Gui, 5:Show, x890 y275 w300 h45 NoActivate, Bleed
	}
Return
;============
Frozen:
	PixelSearch, Px, Py, 20, 113, 1800, 113, 0x220403, 0, Fast RGB ; Looking for Frozen
	; PixelSearch, Px, Py, 1, 1, 1920, 1080, 0xE99200, 255, Fast RGB ; Test Gui
	if ErrorLevel
	{
		Gui, 7:Destroy
		Sleep, 30
		PixelSearch, Px, Py, 20, 108, 1800, 108, 0x57636D, 0, Fast RGB ; Looking for Chill if no Frozen
		; PixelSearch, Px, Py, 1, 1, 1920, 1080, 0xE99200, 255, Fast RGB ; Test Gui
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
			Gui, 8:Show, x927 y275 w300 h45 NoActivate, Chill
		}
	}
	else
	{
		Gui, 8:Destroy
		Gui, 7:-Caption
		Gui, 7:+LastFound +AlwaysOnTop +ToolWindow +OwnDialogs
		Gui, 7:Font, S20 W900, Verdana
		Gui, 7:Add, Text, x1 y3 cffffff BackgroundTrans, Frozen
		Gui, 7:Add, Text, x0 y0 c0000ff BackgroundTrans, Frozen
		Gui, 7:Color, 000001
		WinSet, TransColor, 000001
		Gui, 7:Show, x905 y275 w300 h45 NoActivate, Frozen
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