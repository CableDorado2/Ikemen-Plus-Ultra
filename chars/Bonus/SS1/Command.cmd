; ____________________________________
;| SS1 Bonus by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==============================================================================================
;=======================================< COMMAND FILE >=======================================
;==============================================================================================

;====================< BUTTON REMAPPING >====================
[Remap]
x = x
y = y
z = z
a = a
b = b
c = c
s = s

;====================< DEFAULT VALUES >====================
[Defaults]
command.time = 15
command.buffer.time = 1

;====================< SINGLE BUTTON >====================
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

;====================< HOLD DIR >====================
[Command]
name = "holdfwd"
command = /$F
time = 1
[Command]
name = "holdback"
command = /$B
time = 1
[Command]
name = "holdup"
command = /$U
time = 1
[Command]
name = "holddown"
command = /$D
time = 1

;====================< HOLD BUTTON >====================
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

;====================< DIR >====================
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

;====================< DOUBLE TAP >====================
[Command]
name = "FF"
command = F, F
time = 10
[Command]
name = "BB"
command = B, B
time = 10

;====================< 2/3 BUTTON COMBINATION >====================
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

;===========================================================================
;===============================< -1 STATES >=================================
;===========================================================================
[Statedef -1]

[State -1, Game Over]
type = changestate
triggerall = roundstate >= 1 && stateno != 5150
trigger1 = roundstate >= 3 || life <= 1
trigger2 = fvar(2) = 0
trigger3 = var(10) = 0
value = 5150
