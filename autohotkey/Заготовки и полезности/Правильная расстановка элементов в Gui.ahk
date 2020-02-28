; Designate the groupbox as a section and then use xs/ys to position controls relative to the upper-left corner of the groupbox. Here's an example:

Gui, Add, GroupBox, xm     ym+10  Section w100 h140, Box #1
Gui, Add, Radio   , xs+10  ys+20                   , Radio #1-1
Gui, Add, Radio   , xs+10  ys+40                   , Radio #1-2
Gui, Add, Radio   , xs+10  ys+60                   , Radio #1-3
Gui, Add, Radio   , xs+10  ys+80                   , Radio #1-4
Gui, Add, Radio   , xs+10  ys+100                  , Radio #1-5
Gui, Add, Radio   , xs+10  ys+120                  , Radio #1-6

Gui, Add, GroupBox, xm+100 ym+160 Section w100 h140, Box #2
Gui, Add, Radio   , xs+10  ys+20                   , Radio #2-1
Gui, Add, Radio   , xs+10  ys+40                   , Radio #2-2
Gui, Add, Radio   , xs+10  ys+60                   , Radio #2-3
Gui, Add, Radio   , xs+10  ys+80                   , Radio #2-4
Gui, Add, Radio   , xs+10  ys+100                  , Radio #2-5
Gui, Add, Radio   , xs+10  ys+120                  , Radio #2-6

Gui, Show
Return

GuiClose:
GuiEscape:
{
    ExitApp
}