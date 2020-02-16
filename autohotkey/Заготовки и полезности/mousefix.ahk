Menu, Tray, Icon, shell32.dll, 145
*LButton::
MouseClick, left,,, 1, 0, D  ; Hold down the left mouse button.
Loop
{
	Sleep, 40
	GetKeyState, state, LButton, P
	if state = U  ; The key has been released, so break out of the loop.
		break
}
MouseClick, left,,, 1, 0, U  ; Release the mouse button.
return

; *MButton::LButton
; MouseClick, left,,, 1, 0, D  ; Hold down the left mouse button.
; Loop
; {
	; Sleep, 20
	; GetKeyState, state, LButton, P
	; if state = U  ; The key has been released, so break out of the loop.
		; break
; }
; MouseClick, left,,, 1, 0, U  ; Release the mouse button.
; return