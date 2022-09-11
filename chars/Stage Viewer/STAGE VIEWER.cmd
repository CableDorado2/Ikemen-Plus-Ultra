[Remap]
x = x
y = y
z = z
a = a
b = b
c = c
s = s

;-| Default Values |-------------------------------------------------------
[Defaults]
; Default value for the "time" parameter of a Command. Minimum 1.
command.time = 15

; Default value for the "buffer.time" parameter of a Command. Minimum 1,
; maximum 30.
command.buffer.time = 1

;====================<SINGLE BUTTON>====================

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
name = "s"
command = s
time = 1

;==================<HOLD DIRECTION>==================

[Command]
name = "holdfwd"
command=/$F
time=1

[Command]
name = "holdback"
command = /$B
time = 1

[Command]
name = "holdup"
command = /$U
time=1

[Command]
name = "holddown"
command = /$D
time = 1


;====================<HOLD BUTTON>====================

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
name = "holdstart"
command = /s
time = 1



;====================<DIRECTION>====================

[Command]
name = "fwd"
command = F
time = 1

[Command]
name = "back"
command = B
time = 1

[Command]
name = "up"
command = U
time = 1

[Command]
name = "down"
command = D
time = 1

[Command]
name = "dfwd"
command = DF
time = 1

[Command]
name = "dback"
command = DB
time = 1

[Command]
name = "ufwd"
command = UF
time = 1

[Command]
name = "uback"
command = UB
time = 1



;====================<RELEASE DIR>====================

[Command]
name = "rlsfwd"
command = ~$F
time = 1

[Command]
name = "rlsback"
command = ~$B
time = 1

[Command]
name = "rlsup"
command = ~$U
time = 1

[Command]
name = "rlsdown"
command = ~$D
time = 1



;====================<RELEASE BUTTON>====================

[Command]
name = "rlsx"
command = ~x
time = 1

[Command]
name = "rlsy"
command = ~y
time = 1

[Command]
name = "rlsz"
command = ~z
time = 1

[Command]
name = "rlsa"
command = ~a
time = 1

[Command]
name = "rlsb"
command = ~b
time = 1

[Command]
name = "rlsc"
command = ~c
time = 1



;====================<OTHER>====================

[Command]
name = "highjump"
command = $D, $U
time = 15



;====================<DOUBLE TAP>====================

[Command]
name = "FF"
command = F, F
time = 10

[Command]
name = "BB"
command = B, B
time = 10



;====================<2/3 BUTTON COMBINATION>====================

[Command]
name = "recovery"
command = x+y
time = 1

[Command]
name = "recovery"
command = x+z
time = 1

[Command]
name = "recovery"
command = y+z
time = 1

[Command]
name = "recovery"
command = a+x
time = 1

[Command]
name = "recovery"
command = /x
time = 1

[Command]
name = "recovery"
command = /y
time = 1

[Command]
name = "recovery"
command = /z
time = 1

[Command]
name = "recovery"
command = /a
time = 1

[Command]
name = "recovery"
command = /b
time = 1

[Command]
name = "recovery"
command = /c
time = 1


[Command]
name = "pp"
command = x+y
time = 1

[Command]
name = "pp"
command = x+z
time = 1

[Command]
name = "pp"
command = y+z
time = 1


[Command]
name = "kk"
command = a+b
time = 1

[Command]
name = "kk"
command = a+c
time = 1

[Command]
name = "kk"
command = b+c
time = 1


[Command]
name = "a+x"
command = a+x
time=1

[Command]
name = "b+y"
command = b+y
time = 1

[Command]
name = "c+z"
command = c+z
time = 1


[Command]
name = "a+b"
command = a+b
time = 1

[Command]
name = "a+c"
command = a+c
time = 1

[Command]
name = "b+c"
command = b+c
time = 1

[Statedef -1]

[State -1 Click Sound] ;Click Sound
type= playsnd
triggerall = var(1) = 1
triggerall = teamside = 1
trigger1 = enemynear,name != "STAGE VIEWER"
trigger1 = enemynear,authorname != "Yoshin222"
trigger1 = command = "z" 
trigger2 = command = "b" 
trigger3 = command = "c" 
value = 0,2 ;Click
channel = 5
volumescale = 100
ignorehitpause = 1
persistent = 1

[State -1 HP Check] ;Check if pressing Heavy Punch
type= varset
triggerall = teamside = 1
triggerall = enemynear,name != "STAGE VIEWER"
triggerall = enemynear,authorname != "Yoshin222"
trigger1 = (command = "z" || command = "holdz")
var(0) = 1
ignorehitpause = 1
persistent = 1
[State -1 HP Check2] ;Check if not pressing Heavy Punch
type= varset
triggerall = teamside = 1
trigger1 = enemynear,name = "STAGE VIEWER"
trigger2 = enemynear,authorname = "Yoshin222"
trigger3 = !(command = "z" || command = "holdz")
var(0) = 0 ;Set tp 0 if mirror, or not pressing button
ignorehitpause = 1
persistent = 1

[State -1 Disable BG] ;Disable Background
type= varset
triggerall = teamside = 1
trigger1 = command = "c" ;Heavy Kick
var(3) = ifelse(var(3) = 1,0,1)
ignorehitpause = 1
persistent = 1

[State -1 Disable FG] ;Disable Foreground
type= varset
triggerall = teamside = 1
trigger1 = command = "b" ;Medium Kick
var(2) = ifelse(var(2) = 1,0,1)
ignorehitpause = 1
persistent = 1

[State -1, MP Check] ;Speed Up if holding Medium Punch
type = varset
triggerall = teamside = 1
triggerall = !var(0) ;Pressing Heavy punch, locking to opponent
trigger1 =  (command = "y" || command = "holdy")
fvar(0) = 1.5
ignorehitpause = 1
persistent = 1

[State -1, visible player] ;Make player visible while this explod exists
type = explod
triggerall = teamside = 1
triggerall = !numexplod(091) ;Visible Player
trigger1 = (command = "a" || command = "holda") ; Light Kick
anim = 1
ID = 091
pos = 0,0
postype = P1
pausemovetime = -1
supermovetime = -1
removetime = 2
ontop = 1
ignorehitpause = 1
persistent = 1
;
;[State -1, disable visibility]
;type = removeexplod
;triggerall = teamside = 1
;triggerall = numexplod(091)
;trigger1 = (command = "a" || command = "holda")
;ID = 091
;ignorehitpause = 1
;persistent = 1

[State -1, LP Check] ;Slow down if holding Light Punch
type = varset
triggerall = teamside = 1
triggerall = !var(0) ;Pressing Heavy punch, locking to opponent
triggerall = !(command = "y" || command = "holdy")
trigger1 =  (command = "x" || command = "holdx")
fvar(0) = 0.5
ignorehitpause = 1
persistent = 1

[State -1, set] ;Value tweaked so it is always be a minimum of 1
type = varset
triggerall = !var(0) ;Pressing Heavy punch, locking to opponent
trigger1 = teamside = 1
fvar(1) = ceil(ifelse(fvar(2) * fvar(0) < 1, 1, fvar(2) * fvar(0))) ;Current speed = Move speed x Amplifier
ignorehitpause = 1
persistent = 1

;-----------------------------------------
;MIRROR INPUT FREEZE (LEFT+RIGHT, UP+DOWN
;-----------------------------------------
;;UP + DOWN + RIGHT + LEFT
[State -1 move]
type= posfreeze
triggerall = !var(0) ;Pressing Heavy punch, locking to opponent
triggerall = teamside = 1
trigger1 = (command = "up" || command = "holdup") && (command = "down" || command = "holddown")
trigger2 = (command = "fwd" || command = "holdfwd") && (command = "back" || command = "holdback")
x = 1
y = 1
ignorehitpause = 1
persistent = 1

;RIGHT + LEFT
[State -1 move]
type= posfreeze
triggerall = !var(0) ;Pressing Heavy punch, locking to opponent
triggerall = teamside = 1
trigger1 = (command = "fwd" || command = "holdfwd") && (command = "back" || command = "holdback")
x = 1
ignorehitpause = 1
persistent = 1

;UP + DOWN
[State -1 move]
type= posfreeze
triggerall = !var(0) ;Pressing Heavy punch, locking to opponent
triggerall = teamside = 1
trigger1 = (command = "up" || command = "holdup") && (command = "down" || command = "holddown")
y = 1
ignorehitpause = 1
persistent = 1


;MOVEMENT COMMANDS
;------------------------------------------------------------------
;DUAL COMMANDS
;-----------------------------------------
;UP + LEFT
[State -1 move]
type= posadd
triggerall = !var(0) ;Pressing Heavy punch, locking to opponent
triggerall = teamside = 1
trigger1 = (command = "up" || command = "holdup")  &&  (command = "back" || command = "holdback")
y = floor(-fvar(1))
x = floor(-fvar(1))
ignorehitpause = 1
persistent = 1

;DOWN + LEFT
[State -1 move]
type= posadd
triggerall = !var(0) ;Pressing Heavy punch, locking to opponent
triggerall = teamside = 1
trigger1 = (command = "down" || command = "holddown")  &&  (command = "back" || command = "holdback")
y = floor(fvar(1))
x = floor(-fvar(1))
ignorehitpause = 1
persistent = 1

;UP + RIGHT
[State -1 move]
type= posadd
triggerall = !var(0) ;Pressing Heavy punch, locking to opponent
triggerall = teamside = 1
trigger1 = (command = "up" || command = "holdup")  &&  (command = "fwd" || command = "holdfwd")
y = floor(-fvar(1))
x = floor(fvar(1))
ignorehitpause = 1
persistent = 1

;DOWN + RIGHT
[State -1 move]
type= posadd
triggerall = !var(0) ;Pressing Heavy punch, locking to opponent
triggerall = teamside = 1
trigger1 = (command = "down" || command = "holddown")  &&  (command = "fwd" || command = "holdfwd")
y = floor(fvar(1))
x = floor(fvar(1))
ignorehitpause = 1
persistent = 1

;END OF DUAL COMMANDS
;-----------------------------------------
;SINGLE DIRECTIONS (ALSO CHECKS NOT HOLD ADDITIONAL DIRECTIONS
;-----------------------------------------
;UP AND NOT HOLDING LEFT OR RIGHT
[State -1 move]
type= posadd
triggerall = !var(0) ;Pressing Heavy punch, locking to opponent
triggerall = teamside = 1
trigger1 = (command = "up" || command = "holdup")  &&  !(command = "back" || command = "holdback") &&  !(command = "fwd" || command = "holdfwd")
y = floor(-fvar(1))
x = 0
ignorehitpause = 1
persistent = 1

;DOWN AND NOT HOLDING LEFT OR RIGHT
[State -1 move]
type= posadd
triggerall = !var(0) ;Pressing Heavy punch, locking to opponent
triggerall = teamside = 1
trigger1 = (command = "down" || command = "holddown")  &&  !(command = "back" || command = "holdback") &&  !(command = "fwd" || command = "holdfwd")
y = floor(fvar(1))
x = 0
ignorehitpause = 1
persistent = 1

;LEFT AND NOT HOLDING UP OR DOWN
[State -1 move]
type= posadd
triggerall = !var(0) ;Pressing Heavy punch, locking to opponent
triggerall = teamside = 1
trigger1 = (command = "back" || command = "holdback") && !(command = "down" || command = "holddown")  &&  !(command = "up" || command = "holdup") 
y = 0
x = -floor(fvar(1))
ignorehitpause = 1
persistent = 1

;RIGHT AND NOT HOLDING UP OR DOWN
[State -1 move]
type= posadd
triggerall = !var(0) ;Pressing Heavy punch, locking to opponent
triggerall = teamside = 1
trigger1 = (command = "fwd" || command = "holdfwd") && !(command = "down" || command = "holddown")  &&  !(command = "up" || command = "holdup") 
y = 0
x = floor(fvar(1))
ignorehitpause = 1
persistent = 1

;END OF SINGLE DDIRECTIONS 
;-----------------------------------------
