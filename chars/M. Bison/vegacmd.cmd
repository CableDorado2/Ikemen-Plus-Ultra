; _______________________________
;| Vega by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==============================================================================================
;=======================================< COMMAND FILE >=======================================
;==============================================================================================

;===================< BUTTON REMAPPING >===================

[Remap]
x = x
y = y
z = z
a = a
b = b
c = c
s = s


;===================< DEFAULT VALUES >===================

[Defaults]
command.time = 15
command.buffer.time = 1


;===================< SINGLE BUTTON >===================

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
name = "a+"
command = a
time = 1
buffer.time = 5
[Command]
name = "b+"
command = b
time = 1
buffer.time = 5
[Command]
name = "c+"
command = c
time = 1
buffer.time = 5
[Command]
name = "x+"
command = x
time = 1
buffer.time = 5
[Command]
name = "y+"
command = y
time = 1
buffer.time = 5
[Command]
name = "z+"
command = z
time = 1
buffer.time = 5


;===================< HOLD DIR >===================

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


;====================< RELEASE DIR >====================

[Command]
name = "rlsdir"
command = ~$F
time = 1
[Command]
name = "rlsdir"
command = ~$B
time = 1
[Command]
name = "rlsdir"
command = ~$U
time = 1
[Command]
name = "rlsdir"
command = ~$D
time = 1


;===================< HOLD BUTTON >===================

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


;===================< DIR >===================

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


;====================< RELEASE BUTTON >====================

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

[Command]
name = "rlsx+"
command = ~x
time = 1
buffer.time = 5
[Command]
name = "rlsy+"
command = ~y
time = 1
buffer.time = 5
[Command]
name = "rlsz+"
command = ~z
time = 1
buffer.time = 5
[Command]
name = "rlsa+"
command = ~a
time = 1
buffer.time = 5
[Command]
name = "rlsb+"
command = ~b
time = 1
buffer.time = 5
[Command]
name = "rlsc+"
command = ~c
time = 1
buffer.time = 5


;===================< SUPER MOTIONS >===================

[Command]
name = "4646p"
command = ~$B, $F, $B, F, x
time = 30
[Command]
name = "4646p"
command = ~$B, $F, $B, F, y
time = 30
[Command]
name = "4646p"
command = ~$B, $F, $B, F, z
time = 30
[Command]
name = "4646p"
command = ~$B, $F, $B, F, ~x
time = 30
[Command]
name = "4646p"
command = ~$B, $F, $B, F, ~y
time = 30
[Command]
name = "4646p"
command = ~$B, $F, $B, F, ~z
time = 30

[Command]
name = "4646p+"
command = ~$B, $F, $B, F, x
time = 30
buffer.time = 5
[Command]
name = "4646p+"
command = ~$B, $F, $B, F, y
time = 30
buffer.time = 5
[Command]
name = "4646p+"
command = ~$B, $F, $B, F, z
time = 30
buffer.time = 5
[Command]
name = "4646p+"
command = ~$B, $F, $B, F, ~x
time = 30
buffer.time = 5
[Command]
name = "4646p+"
command = ~$B, $F, $B, F, ~y
time = 30
buffer.time = 5
[Command]
name = "4646p+"
command = ~$B, $F, $B, F, ~z
time = 30
buffer.time = 5


[Command]
name = "4646k"
command = ~$B, $F, $B, F, a
time = 30
[Command]
name = "4646k"
command = ~$B, $F, $B, F, b
time = 30
[Command]
name = "4646k"
command = ~$B, $F, $B, F, c
time = 30
[Command]
name = "4646k"
command = ~$B, $F, $B, F, ~a
time = 30
[Command]
name = "4646k"
command = ~$B, $F, $B, F, ~b
time = 30
[Command]
name = "4646k"
command = ~$B, $F, $B, F, ~c
time = 30

[Command]
name = "4646k+"
command = ~$B, $F, $B, F, a
time = 30
buffer.time = 5
[Command]
name = "4646k+"
command = ~$B, $F, $B, F, b
time = 30
buffer.time = 5
[Command]
name = "4646k+"
command = ~$B, $F, $B, F, c
time = 30
buffer.time = 5
[Command]
name = "4646k+"
command = ~$B, $F, $B, F, ~a
time = 30
buffer.time = 5
[Command]
name = "4646k+"
command = ~$B, $F, $B, F, ~b
time = 30
buffer.time = 5
[Command]
name = "4646k+"
command = ~$B, $F, $B, F, ~c
time = 30
buffer.time = 5

[Command]
name = "4646pp"
command = ~$B, $F, $B, F, x+y
time = 30
[Command]
name = "4646pp"
command = ~$B, $F, $B, F, x+z
time = 30
[Command]
name = "4646pp"
command = ~$B, $F, $B, F, y+z
time = 30

[Command]
name = "4646pp+"
command = ~$B, $F, $B, F, x+y
time = 30
buffer.time = 5
[Command]
name = "4646pp+"
command = ~$B, $F, $B, F, x+z
time = 30
buffer.time = 5
[Command]
name = "4646pp+"
command = ~$B, $F, $B, F, y+z
time = 30
buffer.time = 5

[Command]
name = "1319pp"
command = ~DB, $F, DB, $U, x+y
time = 30
[Command]
name = "1319pp"
command = ~DB, $F, DB, $U, x+z
time = 30
[Command]
name = "1319pp"
command = ~DB, $F, DB, $U, y+z
time = 30

[Command]
name = "1319pp+"
command = ~DB, $F, DB, $U, x+y
time = 30
buffer.time = 5
[Command]
name = "1319pp+"
command = ~DB, $F, DB, $U, x+z
time = 30
buffer.time = 5
[Command]
name = "1319pp+"
command = ~DB, $F, DB, $U, y+z
time = 30
buffer.time = 5

[Command]
name = "214214p"
command = ~D, B, D, B, x
time = 30
[Command]
name = "214214p"
command = ~D, B, D, B, y
time = 30
[Command]
name = "214214p"
command = ~D, B, D, B, z
time = 30
[Command]
name = "214214p"
command = ~D, B, D, B, ~x
time = 30
[Command]
name = "214214p"
command = ~D, B, D, B, ~y
time = 30
[Command]
name = "214214p"
command = ~D, B, D, B, ~z
time = 30

[Command]
name = "214214p+"
command = ~D, B, D, B, x
time = 30
buffer.time = 5
[Command]
name = "214214p+"
command = ~D, B, D, B, y
time = 30
buffer.time = 5
[Command]
name = "214214p+"
command = ~D, B, D, B, z
time = 30
buffer.time = 5
[Command]
name = "214214p+"
command = ~D, B, D, B, ~x
time = 30
buffer.time = 5
[Command]
name = "214214p+"
command = ~D, B, D, B, ~y
time = 30
buffer.time = 5
[Command]
name = "214214p+"
command = ~D, B, D, B, ~z
time = 30
buffer.time = 5


;===================< SPECIAL MOTIONS >===================

[Command]
name = "46p"
command = ~$B, F, x
time = 12
[Command]
name = "46p"
command = ~$B, F, y
time = 12
[Command]
name = "46p"
command = ~$B, F, z
time = 12
[Command]
name = "46p"
command = ~$B, F, ~x
time = 12
[Command]
name = "46p"
command = ~$B, F, ~y
time = 12
[Command]
name = "46p"
command = ~$B, F, ~z
time = 12

[Command]
name = "46p+"
command = ~$B, F, x
time = 12
buffer.time = 5
[Command]
name = "46p+"
command = ~$B, F, y
time = 12
buffer.time = 5
[Command]
name = "46p+"
command = ~$B, F, z
time = 12
buffer.time = 5
[Command]
name = "46p+"
command = ~$B, F, ~x
time = 12
buffer.time = 5
[Command]
name = "46p+"
command = ~$B, F, ~y
time = 12
buffer.time = 5
[Command]
name = "46p+"
command = ~$B, F, ~z
time = 12

[Command]
name = "46k"
command = ~$B, F, a
time = 12
[Command]
name = "46k"
command = ~$B, F, b
time = 12
[Command]
name = "46k"
command = ~$B, F, c
time = 12
[Command]
name = "46k"
command = ~$B, F, ~a
time = 12
[Command]
name = "46k"
command = ~$B, F, ~b
time = 12
[Command]
name = "46k"
command = ~$B, F, ~c
time = 12

[Command]
name = "46k+"
command = ~$B, F, a
time = 12
buffer.time = 5
[Command]
name = "46k+"
command = ~$B, F, b
time = 12
buffer.time = 5
[Command]
name = "46k+"
command = ~$B, F, c
time = 12
buffer.time = 5
[Command]
name = "46k+"
command = ~$B, F, ~a
time = 12
buffer.time = 5
[Command]
name = "46k+"
command = ~$B, F, ~b
time = 12
buffer.time = 5
[Command]
name = "46k+"
command = ~$B, F, ~c
time = 12
buffer.time = 5

[Command]
name = "28p"
command = ~$D, $U, x
time = 12
[Command]
name = "28p"
command = ~$D, $U, y
time = 12
[Command]
name = "28p"
command = ~$D, $U, z
time = 12

[Command]
name = "28p+"
command = ~$D, $U, x
time = 12
buffer.time = 5
[Command]
name = "28p+"
command = ~$D, $U, y
time = 12
buffer.time = 5
[Command]
name = "28p+"
command = ~$D, $U, z
time = 12
buffer.time = 5

[Command]
name = "28k"
command = ~$D, $U, a
time = 12
[Command]
name = "28k"
command = ~$D, $U, b
time = 12
[Command]
name = "28k"
command = ~$D, $U, c
time = 12
[Command]
name = "28k"
command = ~$D, $U, ~a
time = 12
[Command]
name = "28k"
command = ~$D, $U, ~b
time = 12
[Command]
name = "28k"
command = ~$D, $U, ~c
time = 12

[Command]
name = "28k+"
command = ~$D, $U, a
time = 12
buffer.time = 5
[Command]
name = "28k+"
command = ~$D, $U, b
time = 12
buffer.time = 5
[Command]
name = "28k+"
command = ~$D, $U, c
time = 12
buffer.time = 5
[Command]
name = "28k+"
command = ~$D, $U, ~a
time = 12
buffer.time = 5
[Command]
name = "28k+"
command = ~$D, $U, ~b
time = 12
buffer.time = 5
[Command]
name = "28k+"
command = ~$D, $U, ~c
time = 12
buffer.time = 5

[Command]
name = "41236p"
command = ~B, $D, F, x
time = 18
[Command]
name = "41236p"
command = ~B, $D, F, y
time = 18
[Command]
name = "41236p"
command = ~B, $D, F, z
time = 18
[Command]
name = "41236p"
command = ~B, $D, F, ~x
time = 18
[Command]
name = "41236p"
command = ~B, $D, F, ~y
time = 18
[Command]
name = "41236p"
command = ~B, $D, F, ~z
time = 18

[Command]
name = "41236p+"
command = ~B, $D, F, x
time = 18
buffer.time = 5
[Command]
name = "41236p+"
command = ~B, $D, F, y
time = 18
buffer.time = 5
[Command]
name = "41236p+"
command = ~B, $D, F, z
time = 18
buffer.time = 5
[Command]
name = "41236p+"
command = ~B, $D, F, ~x
time = 18
buffer.time = 5
[Command]
name = "41236p+"
command = ~B, $D, F, ~y
time = 18
buffer.time = 5
[Command]
name = "41236p+"
command = ~B, $D, F, ~z
time = 18
buffer.time = 5

[Command]
name = "63214p"
command = ~F, $D, B, x
time = 18
[Command]
name = "63214p"
command = ~F, $D, B, y
time = 18
[Command]
name = "63214p"
command = ~F, $D, B, z
time = 18
[Command]
name = "63214p"
command = ~F, $D, B, ~x
time = 18
[Command]
name = "63214p"
command = ~F, $D, B, ~y
time = 18
[Command]
name = "63214p"
command = ~F, $D, B, ~z
time = 18

[Command]
name = "63214p+"
command = ~F, $D, B, x
time = 18
buffer.time = 5
[Command]
name = "63214p+"
command = ~F, $D, B, y
time = 18
buffer.time = 5
[Command]
name = "63214p+"
command = ~F, $D, B, z
time = 18
buffer.time = 5
[Command]
name = "63214p+"
command = ~F, $D, B, ~x
time = 18
buffer.time = 5
[Command]
name = "63214p+"
command = ~F, $D, B, ~y
time = 18
buffer.time = 5
[Command]
name = "63214p+"
command = ~F, $D, B, ~z
time = 18
buffer.time = 5

[Command]
name = "623p"
command = ~F, D, $F, x
time = 18
[Command]
name = "623p"
command = ~F, D, $F, y
time = 18
[Command]
name = "623p"
command = ~F, D, $F, z
time = 18
[Command]
name = "623p"
command = ~F, D, $F, ~x
time = 18
[Command]
name = "623p"
command = ~F, D, $F, ~y
time = 18
[Command]
name = "623p"
command = ~F, D, $F, ~z
time = 18

[Command]
name = "623p+"
command = ~F, D, $F, x
time = 18
buffer.time = 5
[Command]
name = "623p+"
command = ~F, D, $F, y
time = 18
buffer.time = 5
[Command]
name = "623p+"
command = ~F, D, $F, z
time = 18
buffer.time = 5
[Command]
name = "623p+"
command = ~F, D, $F, ~x
time = 18
buffer.time = 5
[Command]
name = "623p+"
command = ~F, D, $F, ~y
time = 18
buffer.time = 5
[Command]
name = "623p+"
command = ~F, D, $F, ~z
time = 18
buffer.time = 5

[Command]
name = "623pp"
command = ~F, D, $F, x+y
time = 18
[Command]
name = "623pp"
command = ~F, D, $F, x+z
time = 18
[Command]
name = "623pp"
command = ~F, D, $F, y+z
time = 18

[Command]
name = "623pp+"
command = ~F, D, $F, x+y
time = 18
buffer.time = 5
[Command]
name = "623pp+"
command = ~F, D, $F, x+z
time = 18
buffer.time = 5
[Command]
name = "623pp+"
command = ~F, D, $F, y+z
time = 18

[Command]
name = "623s"
command = ~F, D, $F, s
time = 18

[Command]
name = "623kk"
command = ~F, D, $F, a+b
time = 18
[Command]
name = "623kk"
command = ~F, D, $F, a+c
time = 18
[Command]
name = "623kk"
command = ~F, D, $F, b+c
time = 18

[Command]
name = "623kk+"
command = ~F, D, $F, a+b
time = 18
buffer.time = 5
[Command]
name = "623kk+"
command = ~F, D, $F, a+c
time = 18
buffer.time = 5
[Command]
name = "623kk+"
command = ~F, D, $F, b+c
time = 18
buffer.time = 5

[Command]
name = "421pp"
command = ~B, D, $B, x+y
time = 18
[Command]
name = "421pp"
command = ~B, D, $B, x+z
time = 18
[Command]
name = "421pp"
command = ~B, D, $B, y+z
time = 18

[Command]
name = "421pp+"
command = ~B, D, $B, x+y
time = 18
buffer.time = 5
[Command]
name = "421pp+"
command = ~B, D, $B, x+z
time = 18
buffer.time = 5
[Command]
name = "421pp+"
command = ~B, D, $B, y+z
time = 18
buffer.time = 5

[Command]
name = "421kk"
command = ~B, D, $B, a+b
time = 18
[Command]
name = "421kk"
command = ~B, D, $B, a+c
time = 18
[Command]
name = "421kk"
command = ~B, D, $B, b+c
time = 18

[Command]
name = "421kk+"
command = ~B, D, $B, a+b
time = 18
buffer.time = 5
[Command]
name = "421kk+"
command = ~B, D, $B, a+c
time = 18
buffer.time = 5
[Command]
name = "421kk+"
command = ~B, D, $B, b+c
time = 18
buffer.time = 5

[Command]
name = "421s"
command = ~B, D, $B, s
time = 18


;===================< OTHER >===================

[Command]
name = "recovery"
command = x
time = 1
[Command]
name = "recovery"
command = y
time = 1
[Command]
name = "recovery"
command = z
time = 1
[Command]
name = "recovery"
command = a
time = 1
[Command]
name = "recovery"
command = b
time = 1
[Command]
name = "recovery"
command = c
time = 1

[Command]
name = "highjump"
command = $D
time = 1

[Command]
name = "counter_p"
command = F, x + y
time = 8
[Command]
name = "counter_p"
command = F, x + z
time = 8
[Command]
name = "counter_p"
command = F, y + z
time = 8

[Command]
name = "counter_k"
command = F, a + b
time = 8
[Command]
name = "counter_k"
command = F, a + c
time = 8
[Command]
name = "counter_k"
command = F, b + c
time = 8

[Command]
name = "movelist"
command = s, s
time = 15


;===================< DOUBLE TAP >===================

[Command]
name = "FF"
command = F, F
time = 10

[Command]
name = "BB"
command = B, B
time = 10


;===================< 2/3 BUTTON COMBINATION >===================

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
time = 1

[Command]
name = "c+z"
command = c+z
time = 1


;====================< INPUT CHECK >====================

[Command]
name = "6v"
command = F, a
time = 10
buffer.time = 5
[Command]
name = "6v"
command = F, b
time = 10
buffer.time = 5
[Command]
name = "6v"
command = F, c
time = 10
buffer.time = 5
[Command]
name = "6v"
command = F, x
time = 10
buffer.time = 5
[Command]
name = "6v"
command = F, y
time = 10
buffer.time = 5
[Command]
name = "6v"
command = F, z
time = 10
buffer.time = 5

[Command]
name = "6v"
command = F, ~a
time = 10
buffer.time = 5
[Command]
name = "6v"
command = F, ~b
time = 10
buffer.time = 5
[Command]
name = "6v"
command = F, ~c
time = 10
buffer.time = 5
[Command]
name = "6v"
command = F, ~x
time = 10
buffer.time = 5
[Command]
name = "6v"
command = F, ~y
time = 10
buffer.time = 5
[Command]
name = "6v"
command = F, ~z
time = 10
buffer.time = 5

[Command]
name = "4v"
command = B, a
time = 10
buffer.time = 5
[Command]
name = "4v"
command = B, b
time = 10
buffer.time = 5
[Command]
name = "4v"
command = B, c
time = 10
buffer.time = 5
[Command]
name = "4v"
command = B, x
time = 10
buffer.time = 5
[Command]
name = "4v"
command = B, y
time = 10
buffer.time = 5
[Command]
name = "4v"
command = B, z
time = 10
buffer.time = 5

[Command]
name = "4v"
command = B, ~a
time = 10
buffer.time = 5
[Command]
name = "4v"
command = B, ~b
time = 10
buffer.time = 5
[Command]
name = "4v"
command = B, ~c
time = 10
buffer.time = 5
[Command]
name = "4v"
command = B, ~x
time = 10
buffer.time = 5
[Command]
name = "4v"
command = B, ~y
time = 10
buffer.time = 5
[Command]
name = "4v"
command = B, ~z
time = 10
buffer.time = 5


;===========================================================================
;===============================< -1 STATES >=================================
;===========================================================================

[Statedef -1]

[State -1, Inputs]
type = changestate
trigger1 = ishelper(9999)
trigger1 = stateno != 9999
value = 9999
ctrl = 0

[State -1, Landing Buffer]
type = varset
trigger1 = time < 5
trigger1 = stateno = [600, 699]
trigger1 = vel y > 0 && (pos y > - vel y)
trigger1 = !movecontact && !movereversed && hitdefattr != SCA, AA, AP, AT
var(58) = 0
ignorehitpause = 0

[State -1, Buffer Timer]
type = varadd
trigger1 = var(58)
var(58) = ifelse(var(58) < 0, 1, -1)
ignorehitpause = 0

[State -1, Buffer Off]
type = varset
trigger1 = hitpausetime || movereversed = 1
var(58) = 5
ignorehitpause = 1

[State -1, Roll Forward]
type = varset
var(59) = 720
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "a" && command = "x"
triggerall = roundstate = 2 && statetype != A
trigger1 = ctrl || (stateno = [100, 101])
trigger1 = helper(9999), command = "holdfwd"
trigger2 = var(20) && var(4)

[State -1, Roll Backward]
type = varset
var(59) = 725
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "a" && command = "x"
triggerall = roundstate = 2 && statetype != A
trigger1 = ctrl || (stateno = [100, 101])
trigger1 = helper(9999), command = "holdback"

[State -1, Dodge]
type = varset
var(59) = 710
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "a" && command = "x"
triggerall = roundstate = 2 && statetype != A
trigger1 = (ctrl || (stateno = [100, 101]))

[State -1, Final Psycho Crusher]
type = varset
var(59) = 4000
ignorehitpause = 1
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = helper(9999), command = "1319pp+"
triggerall = helper(9999), command = "1319pp" || !var(58)
triggerall = (var(48) > ifelse(!var(58), 0, 5) && var(50) > ifelse(!var(58), 0, 5)) || var(20)
triggerall = roundstate = 2 && power >= 3000 && var(20) <= 60
triggerall = statetype != A || stateno = 1100 || stateno = 3001 || stateno = 3100
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(7) || (var(8) && stateno != 4000)

[State -1, Vega Warp - Custom Combo]
type = varset
var(59) = 1710
ignorehitpause = 1
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = helper(9999), command = "623pp" || helper(9999), command = "623kk" || helper(9999), command = "421pp" || helper(9999), command = "421kk"
triggerall = roundstate = 2 && alive
trigger1 = var(20) && (stateno = [200, 289])
trigger2 = var(20) && (stateno = [1000, 2999]) && movecontact

[State -1, Vega Warp]
type = varset
var(59) = 1700
ignorehitpause = 1
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = helper(9999), command = "623pp+" || helper(9999), command = "623kk+" || helper(9999), command = "421pp+" || helper(9999), command = "421kk+" || helper(9999), command = "623s" || helper(9999), command = "421s"
triggerall = helper(9999), command = "623pp" || helper(9999), command = "623kk" || helper(9999), command = "421pp" || helper(9999), command = "421kk" || helper(9999), command = "623s" || helper(9999), command = "421s" || !var(58)
triggerall = roundstate = 2 && statetype != A
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(6)

[State -1, Psycho Break Smasher]
type = varset
var(59) = 3050
ignorehitpause = 1
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = helper(9999), command = "6v"
triggerall = helper(9999), command = "4646pp+"
triggerall = helper(9999), command = "4646pp" || !var(58)
triggerall = var(48) > ifelse(!var(58), 0, 5) || var(20)
triggerall = roundstate = 2 && power >= 2000 && var(20) <= 60
triggerall = statetype != A || stateno = 1100 || stateno = 3001 || stateno = 3100
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(7) || (var(8) && stateno != 3050)

[State -1, Nightmare Booster]
type = varset
var(59) = 3000
ignorehitpause = 1
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = helper(9999), command = "6v"
triggerall = helper(9999), command = "4646p+"
triggerall = helper(9999), command = "4646p" || !var(58)
triggerall = var(48) > ifelse(!var(58), 0, 5) || var(20)
triggerall = roundstate = 2 && power >= 1000 && var(20) <= 60
triggerall = statetype != A || stateno = 1100 || stateno = 3001 || stateno = 3100
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(7) || (var(8) && stateno != 3001)

[State -1, Knee Press Nightmare]
type = varset
var(59) = 3100
ignorehitpause = 1
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = helper(9999), command = "6v"
triggerall = helper(9999), command = "4646k+"
triggerall = helper(9999), command = "4646k" || !var(58)
triggerall = var(48) > ifelse(!var(58), 0, 5) || var(20)
triggerall = roundstate = 2 && power >= 1000 && var(20) <= 60
triggerall = statetype != A || stateno = 1100 || stateno = 3001 || stateno = 3100
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(7) || (var(8) && stateno != 3100)

[State -1, Psycho Cannon]
type = varset
var(59) = 3200
ignorehitpause = 1
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = helper(9999), command = "4v"
triggerall = helper(9999), command = "214214p+"
triggerall = helper(9999), command = "214214p" || !var(58)
triggerall = roundstate = 2 && power >= 1000 && var(20) <= 60
triggerall = var(39) < 2
triggerall = statetype != A || stateno = 1100 || stateno = 3001 || stateno = 3100
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(7) || (var(8) && stateno != 3202)

[State -1, Psycho Impact]
type = varset
var(59) = 1300
ignorehitpause = 1
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = helper(9999), command = "41236p+"
triggerall = helper(9999), command = "41236p" || !var(58)
triggerall = roundstate = 2 && statetype != A
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(6)

[State -1, Psycho Banish]
type = varset
var(59) = 1400
ignorehitpause = 1
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = helper(9999), command = "623p+"
triggerall = helper(9999), command = "623p" || !var(58)
triggerall = roundstate = 2 && statetype != A
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(6)

[State -1, Psycho Field]
type = varset
var(59) = 1600
ignorehitpause = 1
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = helper(9999), command = "63214p+"
triggerall = helper(9999), command = "63214p" || !var(58)
triggerall = roundstate = 2 && statetype != A && !var(39)
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(6)

[State -1, Psycho Crusher]
type = varset
var(59) = 1000
ignorehitpause = 1
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = helper(9999), command = "46p+"
triggerall = helper(9999), command = "46p" || !var(58)
triggerall = var(48) > ifelse(!var(58), 18, 23) || var(20)
triggerall = roundstate = 2 && statetype != A
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(6)

[State -1, Double Knee Press]
type = varset
var(59) = 1100
ignorehitpause = 1
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = helper(9999), command = "46k+"
triggerall = helper(9999), command = "46k" || !var(58)
triggerall = var(48) > ifelse(!var(58), 18, 23) || var(20)
triggerall = roundstate = 2 && statetype != A
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(6)

[State -1, Head Press]
type = varset
var(59) = 1200
ignorehitpause = 1
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = helper(9999), command = "28k+"
triggerall = helper(9999), command = "28k" || !var(58)
triggerall = var(50) > ifelse(!var(58), 0, 5) || var(20)
triggerall = roundstate = 2 && statetype != A
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(6)

[State -1, Devil Reverse]
type = varset
var(59) = 1250
ignorehitpause = 1
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = helper(9999), command = "28p+"
triggerall = helper(9999), command = "28p" || !var(58)
triggerall = var(50) > ifelse(!var(58), 0, 5) || var(20)
triggerall = roundstate = 2 && statetype != A
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(6)

[State -1, Zero Counter]
type = changestate
value = 750
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "counter_p" || command = "counter_k"
triggerall = roundstate = 2 && power >= 1000 && statetype != A && !var(20)
trigger1 = stateno = 150 || stateno = 152
trigger2 = (stateno = 151 || stateno = 153) && time < 8

[State -1, throw]
type = varset
var(59) = 800
trigger1 = !AIlevel && !var(59) && !ishelper
trigger1 = (command = "pp" || command = "kk") && (command = "holdfwd" || command = "holdback")
trigger1 = roundstate = 2 && statetype = S && ctrl && stateno != 100

[State -1, Custom Combo]
type = varset
var(59) = ifelse(statetype = A, 765, 760)
trigger1 = !AIlevel && !var(59) && !ishelper
trigger1 = command = "c+z"
trigger1 = roundstate = 2 && power >= 2000 && !var(20)
trigger1 = ctrl || (stateno = [100, 101])

[State -1, Power Charge]
type = varset
var(59) = 740
trigger1 = !AIlevel && !var(59) && !ishelper
trigger1 = command = "holdb" && command = "holdy"
trigger1 = roundstate = 2 && statetype != A
trigger1 = power < const(data.power) && power < powermax && !var(20)
trigger1 = ctrl || (stateno = [100, 101])

[State -1, Forward Dash]
type = varset
var(59) = 102
trigger1 = !AIlevel && !var(59) && !ishelper
trigger1 = helper(9999), command = "FF"
trigger1 = roundstate = 2 && statetype = S
trigger1 = ctrl || stateno = 103

[State -1, Back Dash]
type = varset
var(59) = 105
trigger1 = !AIlevel && !var(59) && !ishelper
trigger1 = helper(9999), command = "BB"
trigger1 = roundstate = 2 && statetype = S
trigger1 = ctrl || stateno = 101 || stateno = 103

[State -1, CHK]
type = varset
var(59) = 450
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "c" || (!var(58) && command = "c+")
triggerall = command = "holddown" && statetype != A
trigger1 = ctrl || (stateno = [100, 101])
trigger2 = var(4)

[State -1, CHP]
type = varset
var(59) = 420
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "z" || (!var(58) && command = "z+")
triggerall = command = "holddown" && statetype != A
trigger1 = ctrl || (stateno = [100, 101])
trigger2 = var(4)

[State -1, SHK]
type = varset
var(59) = 250
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "c" || (!var(58) && command = "c+")
triggerall = command != "holddown" && statetype != A
trigger1 = ctrl || (stateno = [100, 101])
trigger2 = var(4)

[State -1, SHP]
type = varset
var(59) = 220
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "z" || (!var(58) && command = "z+")
triggerall = command != "holddown" && statetype != A
trigger1 = ctrl || (stateno = [100, 101])
trigger2 = var(4)

[State -1, CMK]
type = varset
var(59) = 440
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "b" || (!var(58) && command = "b+")
triggerall = command = "holddown" && statetype != A
trigger1 = ctrl || (stateno = [100, 101])
trigger2 = var(4)

[State -1, CMP]
type = varset
var(59) = 410
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "y" || (!var(58) && command = "y+")
triggerall = command = "holddown" && statetype != A
trigger1 = ctrl || (stateno = [100, 101])
trigger2 = var(4)

[State -1, SMK]
type = varset
var(59) = 240
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "b" || (!var(58) && command = "b+")
triggerall = command != "holddown" && statetype != A
trigger1 = ctrl || (stateno = [100, 101])
trigger2 = var(4)

[State -1, SMP]
type = varset
var(59) = 210
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "y" || (!var(58) && command = "y+")
triggerall = command != "holddown" && statetype != A
trigger1 = ctrl || (stateno = [100, 101])
trigger2 = var(4)

[State -1, CLK]
type = varset
var(59) = 430
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "a" || (!var(58) && command = "a+")
triggerall = command = "holddown" && statetype != A
trigger1 = ctrl || (stateno = [100, 101])
trigger2 = var(4)
trigger3 = (stateno = 200 || stateno = 400) && time >= 5

[State -1, CLP]
type = varset
var(59) = 400
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "x" || (!var(58) && command = "x+")
triggerall = command = "holddown" && statetype != A
trigger1 = ctrl || (stateno = [100, 101])
trigger2 = var(4)
trigger3 = (stateno = 200 || stateno = 400) && time >= 5

[State -1, SLK]
type = varset
var(59) = 230
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "a" || (!var(58) && command = "a+")
triggerall = command != "holddown" && statetype != A
trigger1 = ctrl || (stateno = [100, 101])
trigger2 = var(4)
trigger3 = (stateno = 200 || stateno = 400) && time >= 5

[State -1, SLP]
type = varset
var(59) = 200
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "x" || (!var(58) && command = "x+")
triggerall = command != "holddown" && statetype != A
trigger1 = ctrl || (stateno = [100, 101])
trigger2 = var(4)
trigger3 = (stateno = 200 || stateno = 400) && time >= 5

[State -1, AHK]
type = varset
var(59) = 650
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "c" && statetype = A
trigger1 = ctrl
trigger2 = var(4)

[State -1, AHP]
type = varset
var(59) = 620
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "z" && statetype = A
trigger1 = ctrl
trigger2 = var(4)

[State -1, AMK]
type = varset
var(59) = 640
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "b" && statetype = A
trigger1 = ctrl
trigger2 = var(4)

[State -1, AMP]
type = varset
var(59) = 610
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "y" && statetype = A
trigger1 = ctrl
trigger2 = var(4)

[State -1, ALK]
type = varset
var(59) = 630
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "a" && statetype = A
trigger1 = ctrl
trigger2 = var(4)

[State -1, ALP]
type = varset
var(59) = 600
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "x" && statetype = A
trigger1 = ctrl
trigger2 = var(4)

[State -1, Taunt]
type = varset
var(59) = 195
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "start" && statetype != A
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(6)

[State -1, Punch Strength]
type = varset
triggerall = !AIlevel && var(59)
triggerall = var(59) = 1000 || var(59) = 1300 || var(59) = 1400 || var(59) = 1600
trigger1 = command = "x" || command = "y" || command = "z" || helper(9999), command = "x" || helper(9999), command = "y" || helper(9999), command = "z"
trigger1 = var(10) := ifelse(command = "z" || helper(9999), command = "z", 3, ifelse(command = "y" || helper(9999), command = "y", 2, 1))
trigger2 = command = "rlsx" || command = "rlsy" || command = "rlsz" || helper(9999), command = "rlsx" || helper(9999), command = "rlsy" || helper(9999), command = "rlsz"
trigger2 = var(10) := ifelse(command = "rlsz" || helper(9999), command = "rlsz", 3, ifelse(command = "rlsy" || helper(9999), command = "rlsy", 2, 1))
trigger3 = command = "x+" || command = "y+" || command = "z+" || helper(9999), command = "x+" || helper(9999), command = "y+" || helper(9999), command = "z+"
trigger3 = var(10) := ifelse(command = "z+" || helper(9999), command = "z+", 3, ifelse(command = "y+" || helper(9999), command = "y+", 2, 1))
trigger4 = command = "rlsx+" || command = "rlsy+" || command = "rlsz+" || helper(9999), command = "rlsx+" || helper(9999), command = "rlsy+" || helper(9999), command = "rlsz+"
trigger4 = var(10) := ifelse(command = "rlsz+" || helper(9999), command = "rlsz+", 3, ifelse(command = "rlsy+" || helper(9999), command = "rlsy+", 2, 1))
var(10) = var(10)
ignorehitpause = 0

[State -1, Kick Strength]
type = varset
triggerall = !AIlevel && var(59)
triggerall = var(59) = 1100
trigger1 = command = "a" || command = "b" || command = "c" || helper(9999), command = "a" || helper(9999), command = "b" || helper(9999), command = "c"
trigger1 = var(10) := ifelse(command = "c" || helper(9999), command = "c", 3, ifelse(command = "b" || helper(9999), command = "b", 2, 1))
trigger2 = command = "rlsa" || command = "rlsb" || command = "rlsc" || helper(9999), command = "rlsa" || helper(9999), command = "rlsb" || helper(9999), command = "rlsc"
trigger2 = var(10) := ifelse(command = "rlsc" || helper(9999), command = "rlsc", 3, ifelse(command = "rlsb" || helper(9999), command = "rlsb", 2, 1))
trigger3 = command = "a+" || command = "b+" || command = "c+" || helper(9999), command = "a+" || helper(9999), command = "b+" || helper(9999), command = "c+"
trigger3 = var(10) := ifelse(command = "c+" || helper(9999), command = "c+", 3, ifelse(command = "b+" || helper(9999), command = "b+", 2, 1))
trigger4 = command = "rlsa+" || command = "rlsb+" || command = "rlsc+" || helper(9999), command = "rlsa+" || helper(9999), command = "rlsb+" || helper(9999), command = "rlsc+"
trigger4 = var(10) := ifelse(command = "rlsc+" || helper(9999), command = "rlsc+", 3, ifelse(command = "rlsb+" || helper(9999), command = "rlsb+", 2, 1))
var(10) = var(10)
ignorehitpause = 0

[State -1, Buffered State]
type = changestate
trigger1 = var(59) > 0
trigger1 = movetype != H || hitover
value = var(59) + 0 * (var(59) := 0) * (var(58) := 5)
ignorehitpause = 0

[State -1, Buffered State]
type = varset
trigger1 = 1
var(59) = 0
ignorehitpause = 0


;===========================================================================
;=================================< A.I. >====================================
;===========================================================================

[State -1, sidestep / dodge]
type = changestate
value = ifelse((backedgebodydist > 40 && random < (200 * (AIlevel ** 2 / 64.0))), 725, ifelse(random < (600 * (AIlevel ** 2 / 64.0)), 720, 710))
trigger1 = AIlevel && numenemy
trigger1 = roundstate = 2 && statetype != A && ctrl && random < (100 * (AIlevel ** 2 / 64.0))
trigger1 = enemynear, movetype = A && fvar(16) < 80

[State -1, Jump]
type = changestate
value = 40
trigger1 = AIlevel && numenemy
trigger1 = roundstate = 2 && statetype != A && ctrl
trigger1 = enemynear, movetype = A && fvar(16) < 160 && enemynear, hitdefattr = SC, AT

[State -1, Roll Fireballs]
type = changestate
value = 720
trigger1 = AIlevel && numenemy
trigger1 = roundstate = 2 && statetype != A
trigger1 = ctrl || (stateno = [100, 101])
trigger1 = numenemy = 1
trigger1 = fvar(16) >= 120
trigger1 = enemynear, time >= 10 || p2movetype != A
trigger1 = inguarddist && !(enemynear, hitdefattr = SCA, AA, AT)
trigger1 = ifelse(fvar(16) < 180, (enemynear, animtime <= -30), 1)
trigger1 = random < (200 * (AIlevel ** 2 / 64.0))

[State -1, Guard]
type = changestate
value = 120
trigger1 = AIlevel && numenemy
trigger1 = roundstate = 2 && inguarddist
trigger1 = ctrl && (stateno != [120, 155]) && stateno != 110
trigger1 = prevstateno != [720, 725]
trigger1 = !var(26) || fvar(16) >= 40
trigger1 = !(enemynear, hitdefattr = SCA, AT) && (enemynear, time < 120)
trigger1 = statetype != A || p2statetype = A
trigger1 = ifelse(statetype = A, ((var(3) != [1, 2]) || stateno = 5210), 1)
trigger1 = random < (ifelse((p2stateno = [200, 699]), 100, ifelse((p2stateno = [1000, 2999]), 333, 1000)) * (AIlevel ** 2 / 64.0))

[State -1, dash]
type = changestate
value = 105
triggerall = AIlevel && numenemy
triggerall = statetype = S && roundstate = 2 && ctrl
triggerall = (fvar(16) = [0, 80]) && backedgebodydist > 80 && (stateno != [100, 105])
trigger1 = enemynear, movetype = A && random < (50 * (AIlevel ** 2 / 64.0))
trigger2 = enemynear, stateno = 5120 && enemynear, animtime = -3 && random < (200 * (AIlevel ** 2 / 64.0))

[State -1, Zero Counter]
type = changestate
value = 750
trigger1 = AIlevel && numenemy
trigger1 = (p2dist x = [-90, 90]) && stateno = 150 || stateno = 152
trigger1 = roundstate = 2 && power >= 2000 && !var(20)
trigger1 = life < 500 && random < (50 * (AIlevel ** 2 / 64.0))

[State -1, powercharge]
type = changestate
value = 740
trigger1 = AIlevel && numenemy
trigger1 = roundstate = 2 && statetype != A
trigger1 = power < const(data.power) && power < powermax && !var(20) && ctrl
trigger1 = random < (50 * (AIlevel ** 2 / 64.0)) && !inguarddist && p2movetype != A && p2dist x >= 160

[State -1, Fall Recovery]
type = changestate
value = 5210
trigger1 = AIlevel && numenemy
trigger1 = roundstate = 2 && alive
trigger1 = stateno = 5050 && canrecover
trigger1 = vel y > 0 && pos y < -20
trigger1 = random < (25 * (AIlevel ** 2 / 64.0))

[State -1, Fall Recovery]
type = changestate
value = 5200
trigger1 = AIlevel && numenemy
trigger1 = roundstate = 2 && alive
trigger1 = stateno = 5050 && gethitvar(fall.recover)
trigger1 = vel y > 0 && pos y >= -20
trigger1 = random < (100 * (AIlevel ** 2 / 64.0))

[State -1, taunt]
type = changestate
value = 195
trigger1 = AIlevel && numenemy
trigger1 = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
trigger1 = roundstate = 2 && statetype != A
trigger1 = life >= 500 && life >= (enemynear, life)
trigger1 = p2dist x > 200 && (enemynear, vel y > 0) && ctrl && random < (100 * (AIlevel ** 2 / 64.0))
trigger1 = !(enemynear, ctrl) && (enemynear, movetype = H)

[State -1, throw]
type = changestate
value = 800
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = roundstate = 2 && statetype = S && stateno != 100 && ctrl
triggerall = p2statetype != A && p2statetype != L && p2movetype != H
trigger1 = (p2dist x = [0, 64]) && (p2dist y = [-25, 25]) && random < (250 * (AIlevel ** 2 / 64.0))
trigger2 = (p2stateno = [120, 155]) && (p2dist x = [0, 64]) && (p2dist y = [-25, 25]) && random < (50 * (AIlevel ** 2 / 64.0))

[State -1, SLP]
type = changestate
value = 200
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = statetype != A && roundstate = 2
triggerall = (fvar(16) = [0, 25]) && (p2dist y = [-50, 50]) && p2statetype != L && !(enemynear, hitfall)
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = (ctrl || (stateno = [100, 101])) && random < (50 * (AIlevel ** 2 / 64.0))

[State -1, SMP]
type = changestate
value = 210
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = statetype != A && roundstate = 2
triggerall = (fvar(16) = [0, 50]) && (p2dist y = [-50, 50]) && p2statetype = S && !(enemynear, hitfall)
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = (ctrl || (stateno = [100, 101])) && random < (50 * (AIlevel ** 2 / 64.0))

[State -1, SHP]
type = changestate
value = 220
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = statetype != A && roundstate = 2
triggerall = (fvar(16) = [0, 75]) && (p2dist y = [-50, 50]) && p2statetype != L && !(enemynear, hitfall)
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = (ctrl || (stateno = [100, 101])) && random < (50 * (AIlevel ** 2 / 64.0))
trigger2 = stateno = 210 && anim = 206 && animelemtime(4) >= 0 && (movehit = [1, 16])

[State -1, SLK]
type = changestate
value = 230
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = statetype != A && roundstate = 2
triggerall = (fvar(16) = [0, 25]) && (p2dist y = [-50, 50]) && p2statetype != L && p2statetype != A && !(enemynear, hitfall)
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = (ctrl || (stateno = [100, 101])) && random < (50 * (AIlevel ** 2 / 64.0))

[State -1, SMK]
type = changestate
value = 240
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = statetype != A && roundstate = 2
triggerall = (fvar(16) = [0, 50]) && (p2dist y = [-50, 50]) && p2statetype != L && p2statetype != C && !(enemynear, hitfall)
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = (ctrl || (stateno = [100, 101])) && random < (50 * (AIlevel ** 2 / 64.0))

[State -1, SHK]
type = changestate
value = 250
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = statetype != A && roundstate = 2
triggerall = (fvar(16) = [0, 75]) && (p2dist y = [-50, 50]) && p2statetype != L && p2statetype != C && !(enemynear, hitfall)
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = (ctrl || (stateno = [100, 101])) && random < (50 * (AIlevel ** 2 / 64.0))

[State -1, CLP]
type = changestate
value = 400
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = statetype != A && roundstate = 2
triggerall = (fvar(16) = [0, 20]) && (p2dist y = [-50, 50]) && p2statetype != L && p2statetype != A && !(enemynear, hitfall)
trigger1 = (ctrl || (stateno = [100, 101])) && random < (50 * (AIlevel ** 2 / 64.0))

[State -1, CMP]
type = changestate
value = 410
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = statetype != A && roundstate = 2
triggerall = (fvar(16) = [0, 40]) && (p2dist y = [-50, 50]) && p2statetype != L && p2statetype != A && !(enemynear, hitfall)
trigger1 = (ctrl || (stateno = [100, 101])) && random < (50 * (AIlevel ** 2 / 64.0))

[State -1, CHP]
type = changestate
value = 420
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = statetype != A && roundstate = 2
triggerall = (fvar(16) = [0, 60]) && (p2dist y = [-50, 50]) && p2statetype != L
trigger1 = (ctrl || (stateno = [100, 101])) && random < (50 * (AIlevel ** 2 / 64.0))

[State -1, CLK]
type = changestate
value = 430
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = statetype != A && roundstate = 2
triggerall = (fvar(16) = [0, 20]) && (p2dist y = [-50, 50]) && p2statetype != L && p2statetype = S && !(enemynear, hitfall)
trigger1 = (ctrl || (stateno = [100, 101])) && random < (50 * (AIlevel ** 2 / 64.0))

[State -1, CMK]
type = changestate
value = 440
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = statetype != A && roundstate = 2
triggerall = (fvar(16) = [0, 40]) && (p2dist y = [-50, 50]) && p2statetype != L && p2statetype = S && !(enemynear, hitfall)
trigger1 = (ctrl || (stateno = [100, 101])) && random < (50 * (AIlevel ** 2 / 64.0))

[State -1, CHK]
type = changestate
value = 450
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = statetype != A && roundstate = 2
triggerall = (fvar(16) = [140, 170]) && (p2dist y = [-50, 50]) && p2statetype != L && p2statetype = S && !(enemynear, hitfall)
trigger1 = (ctrl || (stateno = [100, 101])) && random < (50 * (AIlevel ** 2 / 64.0))

[State -1, ALP]
type = changestate
value = 600
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = statetype = A && roundstate = 2
triggerall = vel y > 0 || p2statetype = A
triggerall = (fvar(16) = [0, 25]) && (p2dist y = [-50, 50]) && p2statetype != L && !(enemynear, hitfall)
trigger1 = ctrl && random < (50 * (AIlevel ** 2 / 64.0))

[State -1, HellAttack]
type = changestate
value = 615
trigger1 = AIlevel && numenemy
trigger1 = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
trigger1 = statetype = A && roundstate = 2 && vel x
trigger1 = stateno = 610 && animelemtime(4) >= 0

[State -1, AMP]
type = changestate
value = 610
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = statetype = A && roundstate = 2
triggerall = vel y > 0 || p2statetype = A
triggerall = (fvar(16) = [0, 50]) && (p2dist y = [-50, 50]) && p2statetype != L && !(enemynear, hitfall)
trigger1 = ctrl && random < (ifelse(p2statetype = A, 250, 50) * (AIlevel ** 2 / 64.0))

[State -1, AHP]
type = changestate
value = 620
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = statetype = A && roundstate = 2
triggerall = vel y > 0 || p2statetype = A
triggerall = (fvar(16) = [0, 75]) && (p2dist y = [-50, 50]) && p2statetype != L && !(enemynear, hitfall)
trigger1 = ctrl && random < (50 * (AIlevel ** 2 / 64.0))

[State -1, ALK]
type = changestate
value = 630
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = statetype = A && roundstate = 2
triggerall = vel y > 0 || p2statetype = A
triggerall = (fvar(16) = [0, 25]) && (p2dist y = [-50, 50]) && p2statetype != L && !(enemynear, hitfall)
trigger1 = ctrl && random < (50 * (AIlevel ** 2 / 64.0))

[State -1, AMK]
type = changestate
value = 640
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = statetype = A && roundstate = 2
triggerall = vel y > 0 || p2statetype = A
triggerall = (fvar(16) = [0, 50]) && (p2dist y = [-50, 50]) && p2statetype != L && !(enemynear, hitfall)
trigger1 = ctrl && random < (50 * (AIlevel ** 2 / 64.0))

[State -1, AHK]
type = changestate
value = 650
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = statetype = A && roundstate = 2
triggerall = vel y > 0 || p2statetype = A
triggerall = (fvar(16) = [-50, 75]) && (p2dist y = [-50, 50]) && p2statetype != L && !(enemynear, hitfall)
trigger1 = ctrl && random < (50 * (AIlevel ** 2 / 64.0))

[State -1, psycho banish]
type = changestate
value = 1400
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = roundstate = 2 && statetype != A
triggerall = (p2stateno != [120, 155]) && p2statetype != L && !(enemynear, hitfall)
triggerall = (fvar(16) = [0, 40]) && (p2dist y >= -60) && (enemynear, vel y > -2)
trigger1 = (ctrl || (stateno = [100, 101])) && random < (50 * (AIlevel ** 2 / 64.0))
trigger2 = (stateno = [200, 499]) && var(6) && random < (150 * (AIlevel ** 2 / 64.0))

[State -1, psycho crusher]
type = changestate
value = 1000
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = roundstate = 2 && statetype != A
triggerall = var(48) > 18 || var(20)
triggerall = (p2stateno != [120, 155]) && p2statetype != L && !(enemynear, hitfall)
triggerall = (fvar(16) = [160, 320]) && (p2dist y >= -120) && (enemynear, vel y > -2)
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = ctrl && random < (50 * (AIlevel ** 2 / 64.0))
trigger2 = (stateno = [200, 499]) && var(6) && random < (150 * (AIlevel ** 2 / 64.0))

[State -1, double knee press]
type = changestate
value = 1100
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = roundstate = 2 && statetype != A
triggerall = var(48) > 18 || var(20)
triggerall = (p2stateno != [120, 155]) && p2statetype != L && !(enemynear, hitfall)
triggerall = (fvar(16) = [0, 160]) && (p2dist y >= -120) && (enemynear, vel y > -2)
trigger1 = ctrl && random < (50 * (AIlevel ** 2 / 64.0))
trigger2 = (stateno = [200, 499]) && var(6) && random < (150 * (AIlevel ** 2 / 64.0))

[State -1, psycho impact]
type = changestate
value = 1300
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = roundstate = 2 && statetype != A
triggerall = (p2stateno != [120, 155]) && p2statetype != L && !(enemynear, hitfall)
triggerall = (fvar(16) = [0, 200]) && (p2dist y >= -120) && (enemynear, vel y > -2)
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = (ctrl || (stateno = [100, 101])) && random < (50 * (AIlevel ** 2 / 64.0))
trigger2 = (stateno = [200, 499]) && var(6) && random < (150 * (AIlevel ** 2 / 64.0))

[State -1, head press]
type = changestate
value = 1200
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = roundstate = 2 && statetype != A
triggerall = var(50) > 0 || var(20)
triggerall = (p2stateno != [120, 155])
triggerall = (p2dist y >= -160) && (enemynear, vel y <= 0)
trigger1 = ctrl && random < (50 * (AIlevel ** 2 / 64.0))

[State -1, devil reverse]
type = changestate
value = 1250
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = roundstate = 2 && statetype != A && !(enemynear, hitfall)
triggerall = var(50) > 0 || var(20)
triggerall = (p2stateno != [120, 155]) && p2statetype != L
triggerall = (p2dist y >= -160) && (enemynear, vel y <= 0)
trigger1 = ctrl && random < (15 * (AIlevel ** 2 / 64.0))

[State -1, psychofield]
type = changestate
value = 1600
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = roundstate = 2 && statetype != A
triggerall = !var(39)
triggerall = p2statetype != L && (enemynear, vel y <= 0)
trigger1 = ctrl && p2dist x > 160 && random < (25 * (AIlevel ** 2 / 64.0))

[State -1, knee press nightmare]
type = changestate
value = 3100
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = roundstate = 2 && statetype != A && power >= 1000 && var(20) <= 60
triggerall = var(48) > 0 || var(20)
triggerall = !(enemynear, ctrl) && ((p2stateno != [120, 155]) || p2statetype = A) && p2statetype != L && !(enemynear, hitfall)
triggerall = (fvar(16) = [0, 90]) && (p2dist y >= -180) && (enemynear, vel y > -2) && (enemynear, vel x >= 0)
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = (ctrl || (stateno = [100, 101])) && random < (50 * (AIlevel ** 2 / 64.0))
trigger2 = (stateno = [200, 499]) && var(7) && random < (50 * (AIlevel ** 2 / 64.0))
trigger3 = (stateno = 1300 || stateno = 1400) && (movehit = [1, 16]) && random < (75 * (AIlevel ** 2 / 64.0))

[State -1, heartbreak]
type = changestate
value = 3000
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = roundstate = 2 && statetype != A && power >= 1000 && var(20) <= 60
triggerall = var(48) > 0 || var(20)
triggerall = !(enemynear, ctrl) && ((p2stateno != [120, 155]) || p2statetype = A) && p2statetype != L
triggerall = (fvar(16) = [0, 90]) && (p2dist y >= -180) && (enemynear, vel y > -2) && (enemynear, vel x >= 0)
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = (ctrl || (stateno = [100, 101])) && random < (ifelse((enemynear, hitfall), 200, 50) * (AIlevel ** 2 / 64.0))
trigger2 = (stateno = [200, 499]) && var(7) && random < (50 * (AIlevel ** 2 / 64.0))
trigger3 = (stateno = 1000 || stateno = 1100 || stateno = 1300 || stateno = 1400) && (movehit = [1, 16]) && random < (50 * (AIlevel ** 2 / 64.0))
trigger4 = (stateno = 3100) && animelemtime(8) >= 0 && (movehit = [1, 16]) && random < (200 * (AIlevel ** 2 / 64.0))

[State -1, Psycho Cannon]
type = changestate
value = 3200
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = var(39) < 2
triggerall = roundstate = 2 && statetype != A && power >= 1000 && var(20) <= 60
triggerall = !(enemynear, ctrl) && ((p2stateno != [120, 155]) || p2statetype = A) && p2statetype != L
triggerall = (fvar(16) = [0, 90]) && (p2dist y >= -180) && (enemynear, vel y > -2) && (enemynear, vel x >= 0)
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = (stateno = 1100 || stateno = 1300) && (movehit = [1, 16]) && random < (50 * (AIlevel ** 2 / 64.0))

[State -1, mega crusher]
type = changestate
value = 3050
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = roundstate = 2 && statetype != A && power >= 2000 && !var(20)
triggerall = var(48) > 0
triggerall = frontedgedist >= 160
triggerall = !(enemynear, ctrl) && ((p2stateno != [120, 155]) || p2statetype = A) && p2statetype != L
triggerall = (fvar(16) = [0, 90]) && (p2dist y >= -180) && (enemynear, vel y > -2) && (enemynear, vel x >= 0)
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = ctrl && random < (50 * (AIlevel ** 2 / 64.0))
trigger2 = (stateno = [200, 499]) && var(7) && random < (50 * (AIlevel ** 2 / 64.0))
trigger3 = (stateno = 1000 || stateno = 1100 || stateno = 1300 || stateno = 1400) && (movehit = [1, 16]) && random < (75 * (AIlevel ** 2 / 64.0))
trigger4 = (stateno = 3100) && animelemtime(8) >= 0 && (movehit = [1, 16]) && random < (100 * (AIlevel ** 2 / 64.0))

[State -1, final psycho crusher]
type = changestate
value = 4000
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = roundstate = 2 && statetype != A && power >= 3000 && !var(20)
triggerall = var(48) > 0 && var(50) > 0
triggerall = !(enemynear, ctrl) && ((p2stateno != [120, 155]) || p2statetype = A)
triggerall = (p2statetype = A^^p2movetype = H) && p2statetype != L
trigger1 = ctrl && numenemy && random < (200 * (AIlevel ** 2 / 64.0))
trigger1 = (enemynear, animtime >= 20) || (enemynear, pos y <= -60)
