#NoEnv
#SingleInstance Force
;;;;;#Persistent
ListLines Off

gui -DPIScale -MinimizeBox  ;+AlwaysOnTop
gui Add,Text,xm,
   (ltrim
    Instructions: Hover the mouse over the GUI controls to see the tooltips.
   )

gui Add,Button,w300 hwndhButton1 gButton1 Section,Test Button 1
AddTooltip(hButton1,"Button 1: Press me to change my tooltip")

gui Add,Button,y+0 wp hWndhButton2 gButton2,Test Button 2 
AddTooltip(hButton2,"Button 2: Press me to remove the tooltip for this button")

gui Add,Button,y+0 wp hWndhButton3,Test Button 3
AddTooltip(hButton3,"A Multiline Test tooltip`n2nd line`n3rd line`n4th line")

gui Add,Button,xm wp hWndhButton4 gActivate,Activate
Tip=
   (ltrim
    Press me after pressing the Deactivate button (below) to re-enable all of
    the tooltips.
   )
AddTooltip(hButton4,Tip)

gui Add,Button,y+0 wp hWndhButton5 gDeactivate,Deactivate
Tip=
   (ltrim
    Press me to deactivate the tooltip control.  No tooltips will show after
    pressing this button.
   )
AddTooltip(hButton5,Tip)

gui Add,Button,xm wp hWndhButton6 gSetAutoPopDelay,Set AutoPop delay
Tip=
   (ltrim
    Press me to set the autopop delay time to 15 seconds.  Note: Increasing the
    autopop delay time can be useful when one or more long tooltips are used.
   )
AddTooltip(hButton6,Tip)

gui Add,Button,xm wp hWndhButton7 gSetTitle,Set Tooltip Title
Tip=
   (ltrim
    Press me to add a title to all of the tooltips.
    Hint: Not a recommended in most cases.
   )
AddTooltip(hButton7,Tip)

gui Add,Button,y+0 wp hWndhButton8 gRemoveTitle,Remove Tooltip Title
Tip=
   (ltrim
    Press me to remove the tooltip title.
   )
AddTooltip(hButton8,Tip)

gui Add,Checkbox,wp hWndhCheckbox,Checkbox Control
AddTooltip(hCheckbox,"Tooltip for the Checkbox control")

gui Add,ComboBox,wp r5 hWndhComboBox,ComboBox Control||2|3|4|5
    ;-- A ComboBox is actually two controls -- an Edit control and a Drop-down
    ;   button.  Note that the handle returned for this control is for the
    ;   drop-down button, not for the Edit control.
Tip=
   (ltrim
    Tooltip for the drop-down button piece of the ComboBox control.  Note that
    this tip is different than the tip for Edit piece of the control.
   )
AddTooltip(hComboBox,Tip)

gui Add,DateTime,wp hWndhDateTime  ;,DateTime Control
AddTooltip(hDateTime,"Tooltip for the DateTime control")

gui Add,DropDownList,wp r5 hWndhDDL,DropDownList Control||2|3|4|5
AddTooltip(hDDL,"Tooltip for the DropDownList control")

gui Add,Edit,wp hWndhEdit,Edit Control
AddTooltip(hEdit,"Tooltip for the Edit control")

gui Add,Hotkey,wp hWndhHotkey,^+p  ;Hotkey Control
AddTooltip(hHotkey,"Tooltip for the Hotkey control")

gui Add,Link,hWndhLink,This is a <a href="https://autohotkey.com">link</a>.
Tip=
   (ltrim
    Tooltip for the Link control.  Click on me to go to AutoHotkey.com.
   )
AddToolTip(hLink,Tip)

gui Add,ListBox,w300 r5 hWndhListBox,ListBox Control||2|3|4|5
AddTooltip(hListBox,"Tooltip for the ListBox control")

gui Add,ListView,wp h60 hWndhListView,ListView Control
Tip=
   (ltrim
    Tooltip for the ListView control.  Note that this tip is different than
    tip for the header.
   )
AddTooltip(hListView,Tip)

gui Add,MonthCal,ys wp hWndhMonthCal  ;,MonthCal Control
AddTooltip(hMonthCal,"Tooltip for the MonthCal control")

gui Add,Picture,hWndhPicture gNull,%A_ScriptDir%\_Example Files\AutoHotkey.bmp
Tip=
   (ltrim
    Tooltip for the Picture control.  The tooltip does not show unless a g-label
    for the Picture control is defined.
   )
AddTooltip(hPicture,Tip)

gui Add,Progress,w300 hWndhProgress -Smooth,75  ;Progress Control
AddTooltip(hProgress,"Tooltip for the Progress control")

gui Add,Radio,wp hWndhRadio,Radio Control
AddTooltip(hRadio,"Tooltip for the Radio control")

gui Add,Slider,wp hWndhSlider,45  ;Slider Control
AddTooltip(hSlider,"Tooltip for the Slider control")

gui Add,Tab3,wp h50 hWndhTab,Tab Control|2nd Tab|3rd Tab
AddTooltip(hTab,"Tooltip for the Tab control")
gui Tab

gui Add,Text,wp hWndhText gNull,Text Control
Tip=
   (ltrim
    Tooltip for the Text control.  The tooltip does not show unless a g-label
    for the Text control is defined.
   )
AddTooltip(hText,Tip)

gui Add,TreeView,wp h50 hWndhTreeView
P1   :=TV_Add("TreeView Control")
P1C1 :=TV_Add("First child",P1)
AddTooltip(hTreeView,"Tooltip for the TreeView control")

gui Add,Edit,wp hWndhEdit3,Dummy Edit Control  ;-- Used by UpDown control
Tip=
   (ltrim
    This Edit control was created so that the attached UpDown control could be
    demonstrated.
   )
AddTooltip(hEdit3,Tip)

gui Add,UpDown,hWndhUpDown Range1-10,5
AddTooltip(hUpDown,"Tooltip for the UpDown control")

gui Add,Button,w300 gReload,Reload...

gui Add,StatusBar,hWndhStatusBar,StatusBar control
AddTooltip(hStatusBar,"Tooltip for the StatusBar control")

;-- Show it!
SplitPath A_ScriptName,,,,$ScriptTitle
gui Show,,%$ScriptTitle%

;-- Get handle to the header piece of the ListView control
ControlGet hLVHeader,hWnd,,SysHeader321,%$ScriptTitle%
Tip=
   (ltrim
    Tooltip for the header of the ListView control.  Note that this tip is
    different than the tip for the body of the ListView control.
   )
AddTooltip(hLVHeader,Tip)

;-- Get hWnd to the Edit control piece of the ComboBox
ControlGet hComboBoxEdit,hWnd,,Edit1,%$ScriptTitle%
Tip=
   (ltrim
    Tooltip for the Edit piece of the ComboBox control.  Note that this tip is
    different than the tip for drop-down button piece of this control.
   )
AddTooltip(hComboBoxEdit,Tip)
return

Activate:
AddTooltip("Activate")
return

Button1:
AddTooltip(hButton1,"Tooltip text changed.  Wasn't that easy `;) " . A_TickCount)
return

Button2:
AddTooltip(hButton2,"")
return

Deactivate:
AddTooltip("Deactivate")
return

Null:
return

Reload:
Reload
return

RemoveTitle:
AddTooltip("Title","")
return

SetAutoPopDelay:
AddToolTip("AutoPopDelay",15)
return

SetTitle:
AddTooltip("Title","Bob's Tooltips")
return

GUIClose:
GUIescape:
ExitApp


;*******************
;*                 *
;*    Functions    *
;*                 *
;*******************
#include %A_ScriptDir%
#include AddTooltip.ahk
