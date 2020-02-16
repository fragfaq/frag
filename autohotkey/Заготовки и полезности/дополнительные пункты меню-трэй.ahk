; #Persistent ; Выполнять скрипт, пока не закроет пользователь. Хз надо прописывать или нет, вроде не обязательно.

menu, tray, add, TestToggle&Check	; постановка галочки, не вкурил
menu, tray, add, TestToggleEnable	; активирует пункт, делает серым, не вкурил до конца
menu, tray, add, TestDefault		; Устанавливает указанный пункт по дефолту (выделяется черным и он будет при даблклике включаца
menu, tray, add, TestStandard		; Включает - отключает стандартные пункты меню
menu, tray, add, TestDelete			; Удаляет пункт меню, кроме стандартных
menu, tray, add, TestDeleteAll		; Удаляет все меню, кроме стандартных
menu, tray, add, TestRename			; Переименовывает пункт меню. Мб можно от этого сплясать.
menu, tray, add, Test				; Просто пункт мен., на который присваиваешь что нужно.
Menu, Tray, Add,					; Разделитель
menu, tray, NoStandard				; нужно прописать NoStandard, а потом Standard, что б кастомные пункты были выше
menu, tray, Standard				; 
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



TestToggle&Check:
menu, tray, ToggleCheck, TestToggle&Check
menu, tray, Enable, TestToggleEnable ; Разблокирует пункт TestToggleEnable.
menu, tray, add, TestDelete ; Similar to above.
return

TestToggleEnable:
menu, tray, ToggleEnable, TestToggleEnable
return

TestDefault:
if default = TestDefault
{
    menu, tray, NoDefault
    default =
}
else
{
    menu, tray, Default, TestDefault
    default = TestDefault
}
return

TestStandard:
if standard <> n
{
    menu, tray, NoStandard
    standard = n
}
else
{
    menu, tray, Standard
    standard = y
}
return

TestDelete:
menu, tray, delete, TestDelete
return

TestDeleteAll:
menu, tray, DeleteAll
return

TestRename:
if NewName <> renamed
{
    OldName = TestRename
    NewName = renamed
}
else
{
    OldName = renamed
    NewName = TestRename
}
menu, tray, rename, %OldName%, %NewName%
return

Test:
MsgBox, Вы выбрали "%A_ThisMenuItem%" из меню "%A_ThisMenu%".
return


;;;;;;;;;;;;;;;;
;перезапуск скрипта на Control+r
^sc13::
SendInput, ^!+{F11}
Sleep, 100
Reload
return