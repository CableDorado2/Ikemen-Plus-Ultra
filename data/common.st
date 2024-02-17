;===========================================================================;
;Command Buffering File for: everyone, lol                                  ;
;Original system for Capcom VS. SNK: Collision Course                       ;
;by Vans                                                                    ;
;Modifications by Jesuszilla for Capcom VS. SNK 2.                          ;
;Further modifications by PlasmoidThunder for Gensokyo Reloaded.            ;
;The below Helper state (10371) serves as a dummy for var usage and         ;
;determining reversed commands. Raw commands are also defined here for      ;
;optimisation purposes and so things are easier to adjust globally.         ;
;All actual buffering code has been moved to match.cns.                     ;
;===========================================================================;
;-| Default Values |--------------------------------------------------------
[Defaults]
; Default value for the "time" parameter of a Command. Minimum 1.
command.time = 15
; Default value for the "buffer.time" parameter of a Command. Minimum 1,
; maximum 30.
command.buffer.time = 1

;-| Single Button |---------------------------------------------------------
[Command]
name = "a"
command = a
time = 1

[Command]
name = "b"
command = b
time = 1

[Command]
name = "c"
command = c
time = 1

[Command]
name = "x"
command = x
time = 1

[Command]
name = "y"
command = y
time = 1

[Command]
name = "z"
command = z
time = 1

[Command]
name = "start"
command = s
time = 1

[Command]
name = "back"     ; REQUIRED for command buffering
command = B
time = 1

[Command]
name = "fwd"      ; REQUIRED for command buffering
command = F
time = 1

[Command]
name = "up"       ; REQUIRED for command buffering
command = U
time = 1

[Command]
name = "down"     ; REQUIRED for command buffering
command = D
time = 1

[Command]
name = "fwd2"     ; REQUIRED for command buffering
command = F
time = 1

[Command]
name = "fwd2"     ; REQUIRED for command buffering
command = DF
time = 1

[Command]
name = "fwd2"     ; REQUIRED for command buffering
command = UF
time = 1

[Command]
name = "back2"    ; REQUIRED for command buffering
command = B
time = 1

[Command]
name = "back2"    ; REQUIRED for command buffering
command = UB
time = 1

[Command]
name = "back2"    ; REQUIRED for command buffering
command = DB
time = 1

[Command]
name = "up2"
command = U      ; REQUIRED for command buffering
time = 1

[Command]
name = "up2"
command = UB      ; REQUIRED for command buffering
time = 1

[Command]
name = "up2"
command = UF      ; REQUIRED for command buffering
time = 1

[Command]
name = "down2"    ; REQUIRED for command buffering
command = D
time = 1

[Command]
name = "down2"    ; REQUIRED for command buffering
command = DB
time = 1

[Command]
name = "down2"    ; REQUIRED for command buffering
command = DF
time = 1

;-| Hold Button |-----------------------------------------------------------
[Command]
name = "holdx"
command = /x
time = 1

[Command]
name = "holdy"
command = /y
time = 1

[Command]
name = "holdz"
command = /z
time = 1

[Command]
name = "holda"
command = /a
time = 1

[Command]
name = "holdb"
command = /b
time = 1

[Command]
name = "holdc"
command = /c
time = 1

[Command]
name = "holdstart"
command = /s
time = 1

;-| Hold Dir |--------------------------------------------------------------
[Command]
name = "holdfwd" ;Required (do not remove)
command = /$F
time = 1

[Command]
name = "holddown" ;Required (do not remove)
command = /$D
time = 1

[Command]
name = "holdback" ;Required (do not remove)
command = /$B
time = 1

[Command]
name = "holdup" ;Required (do not remove)
command = /$U
time = 1

;-| Double Tap |------------------------------------------------------------
[Command]
name = "FF"     ;Required (do not remove)
command = F, F
time = 10
buffer.time = 2

[Command]
name = "BB"     ;Required (do not remove)
command = B, B
time = 10
buffer.time = 2

;-| Tech Recovery |---------------------------------------------------------
[Command]
name = "recovery";Required (do not remove)
command = /x
time = 1
[Command]
name = "recovery";Required (do not remove)
command = /y
time = 1
[Command]
name = "recovery";Required (do not remove)
command = /z
time = 1
[Command]
name = "recovery";Required (do not remove)
command = /b
time = 1
[Command]
name = "recovery";Required (do not remove)
command = /c
time = 1

;---------------------------------------------------------------------------
; Buffer state
[Statedef 10371]
anim = 1998
ctrl = 0

[State 10371, NO TURN BEHAVIOR.]
type = AssertSpecial
trigger1 = 1
flag = invisible ;Just in case.
ignorehitpause = 1

[State 10371, BindToRoot]
type = BindToRoot
trigger1 = 1
time = 1
pos = 0,Const(size.mid.pos.y)
ignorehitpause = 1

[State 0, DisplayToClipboard]
type = Null;DisplayToClipboard
trigger1 = 1
text = "A = %d B = %d C = %d var(1) = %d var(37) = %d"
params = var(0)&16513,var(0)&33026,var(0)&66052,var(1),var(37)
ignorehitpause = 1

[State 0, DisplayToClipboard]
type = Null;DisplayToClipboard
trigger1 = 1
text = "var(48)&1 = %d var(48)&2 = %d var(48)&4 = %d var(48)&8 = %d, var(41) = %d, var(59) = %d"
params = var(48)&1,var(48)&2,var(48)&4,var(48)&8,var(41),var(59)
ignorehitpause = 1