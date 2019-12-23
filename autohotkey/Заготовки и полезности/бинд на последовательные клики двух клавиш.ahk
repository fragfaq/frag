^k::
    ctrl_k_var := true
    sleep 1000  ; wait 1 second for ctrl+D
    if (ctrl_k_var)  ; If  you don't press ctrl+D within 1 second after ctrl+K
        MsgBox, ctrl+K
    ctrl_k_var := false
return

#If ctrl_k_var

    ^d::    
        MsgBox, ctrl+K+D
        ctrl_k_var := false
    return

#If