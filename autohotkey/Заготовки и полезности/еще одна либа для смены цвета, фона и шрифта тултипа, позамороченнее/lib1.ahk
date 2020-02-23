ShowToolTip(wp, lp = "", msg = "")  {
   static WM_MOUSEMOVE := 0x200, SS_NOTIFY := 0x100, MyPID := DllCall("GetCurrentProcessId"), prev, opt
   
   fn := A_ThisFunc, GuiCtrl := A_GuiControl
   if (!opt && opt := wp)  {
      OnMessage(WM_MOUSEMOVE, fn)
   }
   else if msg  {
      for k, v in opt.controls  {
         if (GuiCtrl = k && (hover := true) && GuiCtrl != prev && prev := GuiCtrl)  {
            %fn%("hide")
            opt.timers.Push( timer := Func(fn).Bind("show", k) )
            SetTimer, % timer, % "-" . opt.delay
         }
      }
      (!hover && %fn%("hide", true))
   }
   else if (wp = "show")  {
      MouseGetPos,,, hwnd
      WinGet, PID, PID, ahk_id %hwnd%
      ( MyPID = PID && opt.controls[lp].Show() )
      opt.timers.Push( timer := Func(fn).Bind("TrackOut") )
      SetTimer, % timer, 100
      opt.timers.Push( timer := Func(fn).Bind("hide") )
      SetTimer, % timer, % "-" opt.duration
   }
   else if (wp = "hide")  {
      for k, v in opt.controls
         v.Hide()
      for key, timer in opt.timers
         SetTimer, % timer, Delete
      opt.timers := [], (lp && prev := "")
   }
   else if (wp = "TrackOut")  {
      MouseGetPos,,, hwnd
      WinGet, PID, PID, ahk_id %hwnd%
      (MyPID != PID && %fn%("hide", true))
   }
}