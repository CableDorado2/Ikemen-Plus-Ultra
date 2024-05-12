; _____________________________________
;| Shin Gouki by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
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


;===================< RELEASE BUTTON >===================

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


;===================< SUPER MOTIONS >===================

[Command]
name = "236236p"
command = ~D, F, D, F, x
time = 30
[Command]
name = "236236p"
command = ~D, F, D, F, y
time = 30
[Command]
name = "236236p"
command = ~D, F, D, F, z
time = 30
[Command]
name = "236236p"
command = ~D, F, D, F, ~x
time = 30
[Command]
name = "236236p"
command = ~D, F, D, F, ~y
time = 30
[Command]
name = "236236p"
command = ~D, F, D, F, ~z
time = 30

[Command]
name = "236236p+"
command = ~D, F, D, F, x
time = 30
buffer.time = 5
[Command]
name = "236236p+"
command = ~D, F, D, F, y
time = 30
buffer.time = 5
[Command]
name = "236236p+"
command = ~D, F, D, F, z
time = 30
buffer.time = 5
[Command]
name = "236236p+"
command = ~D, F, D, F, ~x
time = 30
buffer.time = 5
[Command]
name = "236236p+"
command = ~D, F, D, F, ~y
time = 30
buffer.time = 5
[Command]
name = "236236p+"
command = ~D, F, D, F, ~z
time = 30
buffer.time = 5

[Command]
name = "236236k"
command = ~D, F, D, F, a
time = 30
[Command]
name = "236236k"
command = ~D, F, D, F, b
time = 30
[Command]
name = "236236k"
command = ~D, F, D, F, c
time = 30
[Command]
name = "236236k"
command = ~D, F, D, F, ~a
time = 30
[Command]
name = "236236k"
command = ~D, F, D, F, ~b
time = 30
[Command]
name = "236236k"
command = ~D, F, D, F, ~c
time = 30

[Command]
name = "236236k+"
command = ~D, F, D, F, a
time = 30
buffer.time = 5
[Command]
name = "236236k+"
command = ~D, F, D, F, b
time = 30
buffer.time = 5
[Command]
name = "236236k+"
command = ~D, F, D, F, c
time = 30
buffer.time = 5
[Command]
name = "236236k+"
command = ~D, F, D, F, ~a
time = 30
buffer.time = 5
[Command]
name = "236236k+"
command = ~D, F, D, F, ~b
time = 30
buffer.time = 5
[Command]
name = "236236k+"
command = ~D, F, D, F, ~c
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

[Command]
name = "214214k"
command = ~D, B, D, B, a
time = 30
[Command]
name = "214214k"
command = ~D, B, D, B, b
time = 30
[Command]
name = "214214k"
command = ~D, B, D, B, c
time = 30
[Command]
name = "214214k"
command = ~D, B, D, B, ~a
time = 30
[Command]
name = "214214k"
command = ~D, B, D, B, ~b
time = 30
[Command]
name = "214214k"
command = ~D, B, D, B, ~c
time = 30

[Command]
name = "214214k+"
command = ~D, B, D, B, a
time = 30
buffer.time = 5
[Command]
name = "214214k+"
command = ~D, B, D, B, b
time = 30
buffer.time = 5
[Command]
name = "214214k+"
command = ~D, B, D, B, c
time = 30
buffer.time = 5
[Command]
name = "214214k+"
command = ~D, B, D, B, ~a
time = 30
buffer.time = 5
[Command]
name = "214214k+"
command = ~D, B, D, B, ~b
time = 30
buffer.time = 5
[Command]
name = "214214k+"
command = ~D, B, D, B, ~c
time = 30
buffer.time = 5

[Command]
name = "222pp"
command = D, D, D, x+y
time = 30
[Command]
name = "222pp"
command = D, D, D, x+z
time = 30
[Command]
name = "222pp"
command = D, D, D, y+z
time = 30

[Command]
name = "222pp+"
command = D, D, D, x+y
time = 30
buffer.time = 5
[Command]
name = "222pp+"
command = D, D, D, x+z
time = 30
buffer.time = 5
[Command]
name = "222pp+"
command = D, D, D, y+z
time = 30
buffer.time = 5

[Command]
name = "222kk"
command = D, D, D, a+b
time = 30
[Command]
name = "222kk"
command = D, D, D, a+c
time = 30
[Command]
name = "222kk"
command = D, D, D, b+c
time = 30

[Command]
name = "222kk+"
command = D, D, D, a+b
time = 30
buffer.time = 5
[Command]
name = "222kk+"
command = D, D, D, a+c
time = 30
buffer.time = 5
[Command]
name = "222kk+"
command = D, D, D, b+c
time = 30
buffer.time = 5

[Command]
name = "41236pp"
command = ~B, $D, F, x+y
time = 18
[Command]
name = "41236pp"
command = ~B, $D, F, x+z
time = 18
[Command]
name = "41236pp"
command = ~B, $D, F, y+z
time = 18

[Command]
name = "41236pp+"
command = ~B, $D, F, x+y
time = 18
buffer.time = 5
[Command]
name = "41236pp+"
command = ~B, $D, F, x+z
time = 18
buffer.time = 5
[Command]
name = "41236pp+"
command = ~B, $D, F, y+z
time = 18
buffer.time = 5

[Command]
name = "63214kk"
command = ~F, $D, B, a+b
time = 18
[Command]
name = "63214kk"
command = ~F, $D, B, a+c
time = 18
[Command]
name = "63214kk"
command = ~F, $D, B, b+c
time = 18

[Command]
name = "63214kk+"
command = ~F, $D, B, a+b
time = 18
buffer.time = 5
[Command]
name = "63214kk+"
command = ~F, $D, B, a+c
time = 18
buffer.time = 5
[Command]
name = "63214kk+"
command = ~F, $D, B, b+c
time = 18
buffer.time = 5

[Command]
name = "satsu"
command = x, x, F, a, z
time = 40
[Command]
name = "satsu"
command = x, x, F, a+z
time = 34
[Command]
name = "satsu"
command = x, x, F+a+z
time = 28

[Command]
name = "satsu+"
command = x, x, F, a, z
time = 40
buffer.time = 5
[Command]
name = "satsu+"
command = x, x, F, a+z
time = 32
buffer.time = 5
[Command]
name = "satsu+"
command = x, x, F+a+z
time = 24
buffer.time = 5


;===================< SPECIAL MOTIONS >===================

[Command]
name = "236p"
command = ~D, DF, F, x
time = 12
[Command]
name = "236p"
command = ~D, DF, F, y
time = 12
[Command]
name = "236p"
command = ~D, DF, F, z
time = 12
[Command]
name = "236p"
command = ~D, DF, F, ~x
time = 12
[Command]
name = "236p"
command = ~D, DF, F, ~y
time = 12
[Command]
name = "236p"
command = ~D, DF, F, ~z
time = 12

[Command]
name = "236p+"
command = ~D, DF, F, x
time = 12
buffer.time = 5
[Command]
name = "236p+"
command = ~D, DF, F, y
time = 12
buffer.time = 5
[Command]
name = "236p+"
command = ~D, DF, F, z
time = 12
buffer.time = 5
[Command]
name = "236p+"
command = ~D, DF, F, ~x
time = 12
buffer.time = 5
[Command]
name = "236p+"
command = ~D, DF, F, ~y
time = 12
buffer.time = 5
[Command]
name = "236p+"
command = ~D, DF, F, ~z
time = 12
buffer.time = 5

[Command]
name = "214p"
command = ~D, DB, B, x
time = 12
[Command]
name = "214p"
command = ~D, DB, B, y
time = 12
[Command]
name = "214p"
command = ~D, DB, B, z
time = 12
[Command]
name = "214p"
command = ~D, DB, B, ~x
time = 12
[Command]
name = "214p"
command = ~D, DB, B, ~y
time = 12
[Command]
name = "214p"
command = ~D, DB, B, ~z
time = 12

[Command]
name = "214p+"
command = ~D, DB, B, x
time = 12
buffer.time = 5
[Command]
name = "214p+"
command = ~D, DB, B, y
time = 12
buffer.time = 5
[Command]
name = "214p+"
command = ~D, DB, B, z
time = 12
buffer.time = 5
[Command]
name = "214p+"
command = ~D, DB, B, ~x
time = 12
buffer.time = 5
[Command]
name = "214p+"
command = ~D, DB, B, ~y
time = 12
buffer.time = 5
[Command]
name = "214p+"
command = ~D, DB, B, ~z
time = 12
buffer.time = 5


[Command]
name = "214k"
command = ~D, DB, B, a
time = 12
[Command]
name = "214k"
command = ~D, DB, B, b
time = 12
[Command]
name = "214k"
command = ~D, DB, B, c
time = 12
[Command]
name = "214k"
command = ~D, DB, B, ~a
time = 12
[Command]
name = "214k"
command = ~D, DB, B, ~b
time = 12
[Command]
name = "214k"
command = ~D, DB, B, ~c
time = 12

[Command]
name = "214k+"
command = ~D, DB, B, a
time = 12
buffer.time = 5
[Command]
name = "214k+"
command = ~D, DB, B, b
time = 12
buffer.time = 5
[Command]
name = "214k+"
command = ~D, DB, B, c
time = 12
buffer.time = 5
[Command]
name = "214k+"
command = ~D, DB, B, ~a
time = 12
buffer.time = 5
[Command]
name = "214k+"
command = ~D, DB, B, ~b
time = 12
buffer.time = 5
[Command]
name = "214k+"
command = ~D, DB, B, ~c
time = 12
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
buffer.time = 5

[Command]
name = "623k"
command = ~F, D, $F, a
time = 18
[Command]
name = "623k"
command = ~F, D, $F, b
time = 18
[Command]
name = "623k"
command = ~F, D, $F, c
time = 18
[Command]
name = "623k"
command = ~F, D, $F, ~a
time = 18
[Command]
name = "623k"
command = ~F, D, $F, ~b
time = 18
[Command]
name = "623k"
command = ~F, D, $F, ~c
time = 18

[Command]
name = "623k+"
command = ~F, D, $F, a
time = 18
buffer.time = 5
[Command]
name = "623k+"
command = ~F, D, $F, b
time = 18
buffer.time = 5
[Command]
name = "623k+"
command = ~F, D, $F, c
time = 18
buffer.time = 5
[Command]
name = "623k+"
command = ~F, D, $F, ~a
time = 18
buffer.time = 5
[Command]
name = "623k+"
command = ~F, D, $F, ~b
time = 18
buffer.time = 5
[Command]
name = "623k+"
command = ~F, D, $F, ~c
time = 18
buffer.time = 5

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
name = "22p"
command = D, D, x
time = 20
[Command]
name = "22p"
command = D, D, y
time = 20
[Command]
name = "22p"
command = D, D, z
time = 20
[Command]
name = "22p"
command = D, D, ~x
time = 20
[Command]
name = "22p"
command = D, D, ~y
time = 20
[Command]
name = "22p"
command = D, D, ~z
time = 20

[Command]
name = "22p+"
command = D, D, x
time = 20
buffer.time = 5
[Command]
name = "22p+"
command = D, D, y
time = 20
buffer.time = 5
[Command]
name = "22p+"
command = D, D, z
time = 20
buffer.time = 5
[Command]
name = "22p+"
command = D, D, ~x
time = 20
buffer.time = 5
[Command]
name = "22p+"
command = D, D, ~y
time = 20
buffer.time = 5
[Command]
name = "22p+"
command = D, D, ~z
time = 20
buffer.time = 5

[Command]
name = "22k"
command = D, D, a
time = 20
[Command]
name = "22k"
command = D, D, b
time = 20
[Command]
name = "22k"
command = D, D, c
time = 20
[Command]
name = "22k"
command = D, D, ~a
time = 20
[Command]
name = "22k"
command = D, D, ~b
time = 20
[Command]
name = "22k"
command = D, D, ~c
time = 20

[Command]
name = "22k+"
command = D, D, a
time = 20
buffer.time = 5
[Command]
name = "22k+"
command = D, D, b
time = 20
buffer.time = 5
[Command]
name = "22k+"
command = D, D, c
time = 20
buffer.time = 5
[Command]
name = "22k+"
command = D, D, ~a
time = 20
buffer.time = 5
[Command]
name = "22k+"
command = D, D, ~b
time = 20
buffer.time = 5
[Command]
name = "22k+"
command = D, D, ~c
time = 20
buffer.time = 5


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
name = "c+z"
command = c+z
time = 1

[Command]
name = "a+x"
command = a+x
time = 1


;====================< DIRECTION + BUTTON >====================

[Command]
name = "6b"
command = /F, b
time = 1
[Command]
name = "6b+"
command = /F, b
time = 1
buffer.time = 5

[Command]
name = "6y"
command = /F, y
time = 1
[Command]
name = "6y+"
command = /F, y
time = 1
buffer.time = 5


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

[Command]
name = "2v"
command = D, a
time = 10
buffer.time = 5
[Command]
name = "2v"
command = D, b
time = 10
buffer.time = 5
[Command]
name = "2v"
command = D, c
time = 10
buffer.time = 5
[Command]
name = "2v"
command = D, x
time = 10
buffer.time = 5
[Command]
name = "2v"
command = D, y
time = 10
buffer.time = 5
[Command]
name = "2v"
command = D, z
time = 10
buffer.time = 5

[Command]
name = "2v"
command = D, ~a
time = 10
buffer.time = 5
[Command]
name = "2v"
command = D, ~b
time = 10
buffer.time = 5
[Command]
name = "2v"
command = D, ~c
time = 10
buffer.time = 5
[Command]
name = "2v"
command = D, ~x
time = 10
buffer.time = 5
[Command]
name = "2v"
command = D, ~y
time = 10
buffer.time = 5
[Command]
name = "2v"
command = D, ~z
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
triggerall = command = "a+x"
triggerall = roundstate = 2 && statetype != A
trigger1 = ctrl || (stateno = [100, 101])
trigger1 = helper(9999), command = "holdfwd"
trigger2 = var(20) && var(4)

[State -1, Roll Backward]
type = varset
var(59) = 725
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "a+x"
triggerall = roundstate = 2 && statetype != A
trigger1 = ctrl || (stateno = [100, 101])
trigger1 = helper(9999), command = "holdback"

[State -1, Dodge]
type = varset
var(59) = 710
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "a+x"
triggerall = roundstate = 2 && statetype != A
trigger1 = (ctrl || (stateno = [100, 101]))

[State -1, Tenshou Kaireki Jin]
type = varset
var(59) = 4300
ignorehitpause = 1
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = helper(9999), command = "2v"
triggerall = helper(9999), command = "222kk+"
triggerall = helper(9999), command = "222kk" || !var(58)
triggerall = roundstate = 2 && statetype != A && power >= 2000 && var(20) <= 60
triggerall = !numhelper(4305)
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(7) || (var(8) && stateno != 4300)
trigger3 = stateno = 1400 && anim = 1400 && animelemtime(6) >= 0

[State -1, Kongou Kokuretsu Zan]
type = varset
var(59) = 4200
ignorehitpause = 1
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = helper(9999), command = "2v"
triggerall = helper(9999), command = "222pp+"
triggerall = helper(9999), command = "222pp" || !var(58)
triggerall = roundstate = 2 && statetype != A && power >= 2000 && var(20) <= 60
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(7) || (var(8) && stateno != 4200)

[State -1, Ashura Senkuu]
type = varset
var(59) = 1400
ignorehitpause = 1
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = helper(9999), command = "623pp+" || helper(9999), command = "623kk+" || helper(9999), command = "421pp+" || helper(9999), command = "421kk+"
triggerall = helper(9999), command = "623pp" || helper(9999), command = "623kk" || helper(9999), command = "421pp" || helper(9999), command = "421kk" || !var(58)
triggerall = roundstate = 2 && statetype != A
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(6)

[State -1, Shun Goku Satsu]
type = varset
var(59) = 4000
ignorehitpause = 1
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = helper(9999), command = "satsu+"
triggerall = helper(9999), command = "satsu" || !var(58)
triggerall = roundstate = 2 && statetype != A && power >= 3000 && var(20) <= 60
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(7) || (var(8) && stateno != 4000)
trigger3 = (stateno = [200, 499])

[State -1, Misogi]
type = varset
var(59) = 4100
ignorehitpause = 1
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = helper(9999), command = "4v"
triggerall = helper(9999), command = "63214kk+"
triggerall = helper(9999), command = "63214kk" || !var(58)
triggerall = roundstate = 2 && statetype != A && power >= 3000 && var(20) <= 60
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(7) || (var(8) && stateno != 4100)

[State -1, Tenma Gou Zankuu MvC]
type = varset
var(59) = 3070
ignorehitpause = 1
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "6v"
triggerall = command = "41236pp"
triggerall = roundstate = 2 && statetype = A && (var(3) != [1, 2]) && power >= 2000 && var(20) <= 60 && !var(39)
trigger1 = ctrl
trigger2 = var(7) || (var(8) && stateno != 3070)

[State -1, Messatsu Gou Shoryuu]
type = varset
var(59) = 3100
ignorehitpause = 1
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = helper(9999), command = "6v"
triggerall = helper(9999), command = "236236p+"
triggerall = helper(9999), command = "236236p" || !var(58)
triggerall = roundstate = 2 && statetype != A && power >= 1000 && var(20) <= 60
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(7) || (var(8) && stateno != 3100)

[State -1, Messatsu Gou Senpuu]
type = varset
var(59) = 3250
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "4v"
triggerall = command = "214214k"
triggerall = roundstate = 2 && statetype = A && (var(3) != [1, 2]) && power >= 1000 && var(20) <= 60
trigger1 = ctrl
trigger2 = var(7) || (var(8) && (stateno != [3200, 3250]))

[State -1, Messatsu Gou Rasen]
type = varset
var(59) = 3200
ignorehitpause = 1
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = helper(9999), command = "4v"
triggerall = helper(9999), command = "214214k+"
triggerall = helper(9999), command = "214214k" || !var(58)
triggerall = roundstate = 2 && statetype != A && power >= 1000 && var(20) <= 60
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(7) || (var(8) && (stateno != [3200, 3250]))

[State -1, Tenma Shinzui Wari]
type = varset
var(59) = 3300
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "6v"
triggerall = command = "236236k"
triggerall = roundstate = 2 && statetype = A && (var(3) != [1, 2]) && power >= 1000 && var(20) <= 60
trigger1 = ctrl
trigger2 = var(7) || (var(8) && stateno != 3300)

[State -1, Tenma Gou Zankuu]
type = varset
var(59) = 3050
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "6v"
triggerall = command = "236236p"
triggerall = roundstate = 2 && statetype = A && (var(3) != [1, 2]) && power >= 1000 && var(20) <= 60 && !var(39)
trigger1 = ctrl
trigger2 = var(7) || (var(8) && stateno != 3050)

[State -1, Messatsu Gou Hadou]
type = varset
var(59) = 3000
ignorehitpause = 1
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "4v"
triggerall = helper(9999), command = "214214p+"
triggerall = helper(9999), command = "214214p" || !var(58)
triggerall = roundstate = 2 && statetype != A && power >= 1000 && var(20) <= 60 && !var(39)
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(7) || (var(8) && stateno != 3000)

[State -1, Shakunetsu Hadouken]
type = varset
var(59) = 1020
ignorehitpause = 1
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = helper(9999), command = "63214p+"
triggerall = helper(9999), command = "63214p" || !var(58)
triggerall = roundstate = 2 && statetype != A && !var(39)
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(6)

[State -1, Gou Shoryuuken]
type = varset
var(59) = 1100
ignorehitpause = 1
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = helper(9999), command = "623p+"
triggerall = helper(9999), command = "623p" || !var(58)
triggerall = roundstate = 2 && statetype != A
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(6)

[State -1, Kuuchuu Tatsumaki Zankuu Kyaku]
type = varset
var(59) = 1250
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "214k"
triggerall = roundstate = 2 && statetype = A && (var(3) != [1, 2])
trigger1 = ctrl
trigger2 = var(6)

[State -1, Tatsumaki Zankuu Kyaku]
type = varset
var(59) = 1200
ignorehitpause = 1
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = helper(9999), command = "214k+"
triggerall = helper(9999), command = "214k" || !var(58)
triggerall = roundstate = 2 && statetype != A
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(6)

[State -1, Hyakki Shuu]
type = varset
var(59) = 1300
ignorehitpause = 1
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = helper(9999), command = "623k+"
triggerall = helper(9999), command = "623k" || !var(58)
triggerall = roundstate = 2 && statetype != A
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(6)

[State -1, Zankuu Hadouken]
type = varset
var(59) = 1050
ignorehitpause = 1
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = ifelse(p2dist x < 0, command = "214p", command = "236p")
triggerall = roundstate = 2 && statetype = A && (var(3) != [1, 2]) && !var(39)
trigger1 = ctrl
trigger2 = var(6)

[State -1, Gou Hadouken]
type = varset
var(59) = 1000
ignorehitpause = 1
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = helper(9999), command = "236p+"
triggerall = helper(9999), command = "236p" || !var(58)
triggerall = roundstate = 2 && statetype != A && !var(39)
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(6)

[State -1, Tenma Shurettou]
type = varset
var(59) = 1500
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "22p+" || command = "22k+"
triggerall = command = "22p" || command = "22k" || !var(58)
triggerall = roundstate = 2 && statetype != A
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(6)

[State -1, Zenpou Tenshin]
type = varset
var(59) = 1450
ignorehitpause = 1
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = helper(9999), command = "214p+"
triggerall = helper(9999), command = "214p" || !var(58)
triggerall = roundstate = 2 && statetype != A
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(6)

[State -1, Custom Combo]
type = varset
var(59) = ifelse(statetype = A, 765, 760)
trigger1 = !AIlevel && !var(59) && !ishelper
trigger1 = command = "c+z"
trigger1 = roundstate = 2 && power >= 2000 && !var(20)
trigger1 = ctrl || (stateno = [100, 101])

[State -1, Zero Counter]
type = changestate
value = 750
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "counter_p" || command = "counter_k"
triggerall = roundstate = 2 && power >= 1000 && statetype != A && !var(20)
trigger1 = stateno = 150 || stateno = 152
trigger2 = (stateno = 151 || stateno = 153) && time < 8

[State -1, Roll Recovery]
type = selfstate
value = 5220
trigger1 = !AIlevel && !var(59) && !ishelper
trigger1 = command = "a" || command = "b" || command = "c"
trigger1 = !ctrl
trigger1 = roundstate = 2 && alive
trigger1 = (stateno = 5040 || stateno = 5050) && vel y >= -1

[State -1, Run]
type = varset
var(59) = 102
trigger1 = !AIlevel && !var(59) && !ishelper
trigger1 = helper(9999), command = "FF"
trigger1 = roundstate = 2 && statetype = S
trigger1 = ctrl

[State -1, Back Dash]
type = varset
var(59) = 105
trigger1 = !AIlevel && !var(59) && !ishelper
trigger1 = helper(9999), command = "BB"
trigger1 = roundstate = 2 && statetype = S
trigger1 = ctrl || stateno = 101

[State -1, Air Throw]
type = varset
var(59) = 850
trigger1 = !AIlevel && !var(59) && !ishelper
trigger1 = command = "kk"
trigger1 = command = "holdfwd" || command = "holdback"
trigger1 = roundstate = 2 && statetype = A
trigger1 = ctrl

[State -1, throw]
type = varset
var(59) = 800
trigger1 = !AIlevel && !var(59) && !ishelper
trigger1 = (command = "pp" || command = "kk") && (command = "holdfwd" || command = "holdback")
trigger1 = roundstate = 2 && ctrl && statetype = S && stateno != 100

[State -1, Power Charge]
type = varset
var(59) = 740
trigger1 = !AIlevel && !var(59) && !ishelper
trigger1 = command = "holdb" && command = "holdy"
trigger1 = roundstate = 2 && statetype != A
trigger1 = power < const(data.power) && power < powermax && !var(20)
trigger1 = ctrl || (stateno = [100, 101])

[State -1, CHK]
type = varset
var(59) = 450
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "c" || (!var(58) && command = "c+")
triggerall = command = "holddown" && statetype != A
trigger1 = ctrl || (stateno = [100, 101])
trigger2 = (movecontact + movereversed) = [1, 4]
trigger2 = stateno = 200 || stateno = 210 || stateno = 220 || (stateno = [400, 420]) || (stateno = [230, 240]) || (stateno = [430, 440])
trigger3 = var(4)

[State -1, CHP]
type = varset
var(59) = 420
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "z" || (!var(58) && command = "z+")
triggerall = command = "holddown" && statetype != A
trigger1 = ctrl || (stateno = [100, 101])
trigger2 = (movecontact + movereversed) = [1, 4]
trigger2 = (stateno = [200, 210]) || (stateno = [400, 410]) || (stateno = [230, 240]) || (stateno = [430, 440])
trigger3 = var(4)

[State -1, SHK]
type = varset
var(59) = 250
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "c" || (!var(58) && command = "c+")
triggerall = command != "holddown" && statetype != A
trigger1 = ctrl || (stateno = [100, 101])
trigger2 = (movecontact + movereversed) = [1, 4]
trigger2 = stateno = 200 || stateno = 210 || stateno = 220 || (stateno = [400, 420]) || (stateno = [230, 240]) || (stateno = [430, 440])
trigger3 = var(4)

[State -1, SHP]
type = varset
var(59) = 220
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "z" || (!var(58) && command = "z+")
triggerall = command != "holddown" && statetype != A
trigger1 = ctrl || (stateno = [100, 101])
trigger2 = (movecontact + movereversed) = [1, 4]
trigger2 = (stateno = [200, 210]) || (stateno = [400, 410]) || (stateno = [230, 240]) || (stateno = [430, 440])
trigger3 = var(4)

[State -1, SMK2]
type = varset
var(59) = 245
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "6b" || (!var(58) && command = "6b+")
triggerall = command != "holddown" && statetype != A
trigger1 = ctrl || (stateno = [100, 101])
trigger2 = (movecontact + movereversed) = [1, 4]
trigger2 = (stateno = [200, 210]) || stateno = 230 || (stateno = [400, 410]) || stateno = 430
trigger3 = var(4)

[State -1, SMP2]
type = varset
var(59) = 215
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "6y" || (!var(58) && command = "6y+")
triggerall = command != "holddown" && statetype != A
trigger1 = ctrl || (stateno = [100, 101])
trigger2 = (movecontact + movereversed) = [1, 4]
trigger2 = stateno = 200 || stateno = 230 || stateno = 400 || stateno = 430
trigger3 = var(4)

[State -1, CMK]
type = varset
var(59) = 440
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "b" || (!var(58) && command = "b+")
triggerall = command = "holddown" && statetype != A
trigger1 = ctrl || (stateno = [100, 101])
trigger2 = (movecontact + movereversed) = [1, 4]
trigger2 = (stateno = [200, 210]) || stateno = 230 || (stateno = [400, 410]) || stateno = 430
trigger3 = var(4)

[State -1, CMP]
type = varset
var(59) = 410
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "y" || (!var(58) && command = "y+")
triggerall = command = "holddown" && statetype != A
trigger1 = ctrl || (stateno = [100, 101])
trigger2 = (movecontact + movereversed) = [1, 4]
trigger2 = stateno = 200 || stateno = 230 || stateno = 400 || stateno = 430
trigger3 = var(4)

[State -1, SMK]
type = varset
var(59) = 240
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "b" || (!var(58) && command = "b+")
triggerall = command != "holddown" && statetype != A
trigger1 = ctrl || (stateno = [100, 101])
trigger2 = (movecontact + movereversed) = [1, 4]
trigger2 = (stateno = [200, 210]) || stateno = 230 || (stateno = [400, 410]) || stateno = 430
trigger3 = var(4)

[State -1, SMP]
type = varset
var(59) = 210
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "y" || (!var(58) && command = "y+")
triggerall = command != "holddown" && statetype != A
trigger1 = ctrl || (stateno = [100, 101])
trigger2 = (movecontact + movereversed) = [1, 4]
trigger2 = stateno = 200 || stateno = 230 || stateno = 400 || stateno = 430
trigger3 = var(4)

[State -1, CLK]
type = varset
var(59) = 430
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "a" || (!var(58) && command = "a+")
triggerall = command = "holddown" && statetype != A
trigger1 = ctrl || (stateno = [100, 101])
trigger2 = (movecontact + movereversed) = [1, 4]
trigger2 = stateno = 200 || stateno = 400
trigger3 = (stateno = 200 || stateno = 400 || stateno = 430) && time >= 5
trigger4 = var(4)

[State -1, CLP]
type = varset
var(59) = 400
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "x" || (!var(58) && command = "x+")
triggerall = command = "holddown" && statetype != A
trigger1 = ctrl || (stateno = [100, 101])
trigger2 = (stateno = 200 || stateno = 400 || stateno = 430) && time >= 5
trigger3 = var(4)

[State -1, SLK]
type = varset
var(59) = 230
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "a" || (!var(58) && command = "a+")
triggerall = command != "holddown" && statetype != A
trigger1 = ctrl || (stateno = [100, 101])
trigger2 = (movecontact + movereversed) = [1, 4]
trigger2 = stateno = 200 || stateno = 400
trigger3 = (stateno = 200 || stateno = 400 || stateno = 430) && time >= 5
trigger4 = var(4)

[State -1, SLP]
type = varset
var(59) = 200
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "x" || (!var(58) && command = "x+")
triggerall = command != "holddown" && statetype != A
trigger1 = ctrl || (stateno = [100, 101])
trigger2 = (stateno = 200 || stateno = 400 || stateno = 430) && time >= 5
trigger3 = var(4)

[State -1, AHK]
type = varset
var(59) = 650
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "c" && statetype = A
trigger1 = ctrl
trigger2 = (movecontact + movereversed) = [1, 4]
trigger2 = (stateno = [600, 640]) && (var(3) != [1, 2])
trigger3 = var(4)

[State -1, AHP]
type = varset
var(59) = 620
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "z" && statetype = A
trigger1 = ctrl
trigger2 = (movecontact + movereversed) = [1, 4]
trigger2 = ((stateno = [600, 610]) || (stateno = [630, 640])) && (var(3) != [1, 2])
trigger3 = var(4)

[State -1, TKK]
type = varset
var(59) = 645
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "holddown" && command = "b" && statetype = A
triggerall = vel x > 0 && pos y <= -90 && (var(3) != [1, 2])
trigger1 = ctrl
trigger2 = var(4)

[State -1, AMK]
type = varset
var(59) = 640
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "b" && statetype = A
trigger1 = ctrl
trigger2 = (movecontact + movereversed) = [1, 4]
trigger2 = ((stateno = [600, 610]) || stateno = 630) && (var(3) != [1, 2])
trigger3 = var(4)

[State -1, AMP]
type = varset
var(59) = 610
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "y" && statetype = A
trigger1 = ctrl
trigger2 = (movecontact + movereversed) = [1, 4]
trigger2 = (stateno = 600 || stateno = 630) && (var(3) != [1, 2])
trigger3 = var(4)

[State -1, ALK]
type = varset
var(59) = 630
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "a" && statetype = A
trigger1 = ctrl
trigger2 = (movecontact + movereversed) = [1, 4]
trigger2 = stateno = 600 && (var(3) != [1, 2])
trigger3 = var(4)

[State -1, ALP]
type = varset
var(59) = 600
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "x" && statetype = A
trigger1 = ctrl
trigger2 = var(4)

[State -1, AerialRave]
type = varset
var(59) = 40
ignorehitpause = 1
trigger1 = !AIlevel && !var(59) && !ishelper
trigger1 = roundstate = 2 && command = "holdup"
trigger1 = stateno = 420 && movehit = 1
trigger1 = animelemtime(5) < 0 || (animelemtime(5) = 0 && hitpausetime)

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
triggerall = var(59) = 1000 || var(59) = 1020 || var(59) = 1050 || var(59) = 1100 || var(59) = 1400
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
triggerall = var(59) = 1200 || var(59) = 1250 || var(59) = 1300
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


;=============================================================================
;=================================< A.I. >====================================
;=============================================================================

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

[State -1, recoveryroll]
type = selfstate
value = 5220
trigger1 = AIlevel && numenemy
trigger1 = roundstate = 2 && alive
trigger1 = !ctrl
trigger1 = (stateno = 5040 || stateno = 5050) && vel y >= -1 && pos y >= -20
trigger1 = (fvar(16) = [-10, 10]) && random < (50 * (AIlevel ** 2 / 64.0))

[State -1, goushoryuuken]
type = changestate
value = 1100
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = roundstate = 2 && statetype != A
triggerall = !(enemynear, ctrl) && (enemynear, stateno != [120, 155])
triggerall = (p2statetype != L || p2stateno = 5120) && (fvar(16) = [0, 40]) && (p2dist y = [-120, 0])
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = (ctrl || (stateno = [100, 101])) && p2statetype = A && random < (ifelse(prevstateno = 1200, 333, 200) * (AIlevel ** 2 / 64.0))
trigger2 = (stateno = [200, 499])
trigger2 = (movehit = [1, 16]) && (fvar(16) = [0, 12]) && random < (500 * (AIlevel ** 2 / 64.0))
trigger4 = (ctrl || (stateno = [100, 101])) && enemynear, movetype = A && (fvar(16) = [0, 40]) && random < (500 * (AIlevel ** 2 / 64.0))
trigger5 = stateno = 0 && prevstateno = 5120 && time <= 1
trigger5 = (ctrl || (stateno = [100, 101])) && (fvar(16) = [-40, 40]) && random < (500 * (AIlevel ** 2 / 64.0))
trigger6 = (ctrl || (stateno = [100, 101])) && (fvar(16) = [-30, 30])
trigger6 = (enemynear, stateno = 5120) && (enemynear, animtime = [-6, -3]) && random < (250 * (AIlevel ** 2 / 64.0))

[State -1, ashurasenkuu]
type = changestate
value = 1400
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = statetype != A && roundstate = 2
triggerall = ctrl || (stateno = [100, 101])
trigger1 = enemynear, movetype = A && (fvar(16) = [-90, 90])
trigger1 = (enemynear, fvar(16) > 0) && (enemynear, facing != facing)
trigger1 = backedgebodydist <= 10 || (p2dist x < 0 && frontedgebodydist <= 10)
trigger1 = random < (250 * (AIlevel ** 2 / 64.0))

[State -1, roll / dodge]
type = changestate
value = ifelse(random < (250 * (AIlevel ** 2 / 64.0)), 710, 720)
trigger1 = AIlevel && numenemy
trigger1 = roundstate = 2 && statetype != A
trigger1 = (ctrl || (stateno = [100, 101])) && random < (50 * (AIlevel ** 2 / 64.0))
trigger1 = (enemynear, movetype = A) && (enemynear, hitdefattr = SCA, AA)
trigger1 = (fvar(16) = [40, 120]) && (enemynear, animtime <= -28)

[State -1, tenmashurettou]
type = changestate
value = 1500
trigger1 = AIlevel && numenemy
trigger1 = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
trigger1 = roundstate = 2 && statetype != A
trigger1 = ctrl && (fvar(16) = [-60, 60]) && (p2dist y = [-20, 0])
trigger1 = enemynear, movetype = A && (enemy, hitdefattr = SCA, AA) && random < (200 * (AIlevel ** 2 / 64.0))

[State -1, Jump]
type = changestate
value = 40
trigger1 = AIlevel && numenemy
trigger1 = roundstate = 2 && statetype != A && (ctrl || (stateno = [100, 101]))
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
trigger1 = ctrl && (stateno != [120, 155]) && !var(20)
trigger1 = prevstateno != [720, 725]
trigger1 = !var(26) || fvar(16) >= 40
trigger1 = !(enemynear, hitdefattr = SCA, AT) && (enemynear, time < 120)
trigger1 = statetype != A || p2statetype = A
trigger1 = ifelse(statetype = A, ((var(3) != [1, 2]) || stateno = 5210), 1)
trigger1 = random < (ifelse((p2stateno = [200, 699]), 100, ifelse((p2stateno = [1000, 2999]), 333, 1000)) * (AIlevel ** 2 / 64.0))

[State -1, Zero Counter]
type = changestate
value = 750
trigger1 = AIlevel && numenemy
trigger1 = (stateno = 151 || stateno = 153) && time <= 8
trigger1 = random < (50 * (AIlevel ** 2 / 64.0))
trigger1 = roundstate = 2 && statetype != A
trigger1 = power >= 1000 && !var(20)
trigger1 = (fvar(16) = [-50, 50]) && life < 400

[State -1, powercharge]
type = changestate
value = 740
triggerall = AIlevel && numenemy
trigger1 = roundstate = 2 && statetype != A && ctrl
trigger1 = power < const(data.power) && power < powermax && !var(20)
trigger1 = !inguarddist && fvar(16) >= 160 && random < (100 * (AIlevel ** 2 / 64.0))

[State -1, Air Throw]
type = changestate
value = 850
trigger1 = AIlevel && numenemy
trigger1 = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
trigger1 = roundstate = 2 && statetype = A && (var(3) != [1, 2])
trigger1 = ctrl && (pos y <= -42 || vel y < 0)
trigger1 = p2statetype = A && p2movetype != H
trigger1 = (fvar(16) = [0, 20]) && (p2dist y = [-80, -40]) && random < (333 * (AIlevel ** 2 / 64.0))

[State -1, Throw]
type = changestate
value = 800
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = roundstate = 2 && statetype = S
triggerall = p2statetype != A && p2statetype != L && p2movetype != H
triggerall = (fvar(16) = [0, 20]) && p2dist y = 0
trigger1 = ctrl && random < (200 * (AIlevel ** 2 / 64.0))
trigger2 = ctrl && (p2stateno = [120, 140]) && random < (750 * (AIlevel ** 2 / 64.0))

[State -1, CLK]
type = changestate
value = 430
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = roundstate = 2 && statetype != A && !inguarddist
triggerall = (fvar(16) = [0, 36]) && (p2dist y = [-50, 50]) && p2statetype = S
triggerall = ((p2stateno != [120, 155]) || p2stateno = 130 || p2stateno = 150 || p2stateno = 151) && p2movetype != A
trigger1 = (ctrl || (stateno = [100, 101]))
trigger1 = random < (200 * (AIlevel ** 2 / 64.0)) || (p2stateno = 130 || p2stateno = 150 || p2stateno = 151) || p2stateno = 5110
trigger2 = (stateno = 200 || stateno = 400 || stateno = 430) && time >= 5 && random < (50 * (AIlevel ** 2 / 64.0))

[State -1, SLP]
type = changestate
value = 200
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = roundstate = 2 && statetype != A && !inguarddist
triggerall = (fvar(16) = [0, 40]) && (p2dist y = [-50, 50]) && p2statetype != C && p2statetype != L && !(enemynear, hitfall)
triggerall = (p2stateno != [120, 155]) && p2movetype != A && !(enemynear, hitfall)
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = (ctrl || (stateno = [100, 101])) && random < (100 * (AIlevel ** 2 / 64.0))
trigger2 = (stateno = 200 || stateno = 400 || stateno = 430) && time >= 5 && random < (50 * (AIlevel ** 2 / 64.0))

[State -1, SHP]
type = changestate
value = 220
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = roundstate = 2 && statetype != A
triggerall = (fvar(16) = [0, 80]) && (p2dist y = [-50, 50]) && p2statetype != C && p2statetype != L && !(enemynear, hitfall)
triggerall = (p2stateno != [120, 155]) && p2movetype != A && !(enemynear, hitfall)
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = (ctrl || (stateno = [100, 101])) && fvar(16) < 25 && random < (100 * (AIlevel ** 2 / 64.0))
trigger2 = (stateno = 200 || stateno = 210 || stateno = 230 || stateno = 240 || stateno = 400 || stateno = 410 || stateno = 430 || stateno = 440)
trigger2 = fvar(16) <= 50 && (movehit = [1, 16]) && random < (250 * (AIlevel ** 2 / 64.0))

[State -1, SHK]
type = changestate
value = 250
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = roundstate = 2 && statetype != A
triggerall = (fvar(16) = [0, 70]) && (p2dist y = [-50, 50]) && p2statetype != C && p2statetype != L && !(enemynear, hitfall)
triggerall = (p2stateno != [120, 155]) && p2movetype != A && !(enemynear, hitfall)
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = (stateno = 200 || stateno = 210 || stateno = 230 || stateno = 240 || stateno = 400 || stateno = 410 || stateno = 430 || stateno = 440)
trigger1 = fvar(16) = 0 && (movehit = [1, 16]) && random < (250 * (AIlevel ** 2 / 64.0))

[State -1, SMP2]
type = changestate
value = 215
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = roundstate = 2 && statetype != A
triggerall = (fvar(16) = [0, 45]) && (p2dist y = [-50, 0]) && p2statetype = C && !(enemynear, hitfall)
triggerall = ((p2stateno != [120, 155]) || p2stateno = 131 || p2stateno = 152 || p2stateno = 153) && p2movetype != A && !(enemynear, hitfall)
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = ctrl || (stateno = [100, 101])
trigger1 = p2movetype != H && (prevstateno = [400, 440])
trigger1 = random < (200 * (AIlevel ** 2 / 64.0))
trigger2 = stateno = 430 && moveguarded
trigger2 = random < (250 * (AIlevel ** 2 / 64.0))

[State -1, SMK2]
type = changestate
value = 245
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = roundstate = 2 && statetype != A
triggerall = (fvar(16) = [0, 80]) && (p2dist y = [-50, 0]) && p2statetype = C && !(enemynear, hitfall)
triggerall = ((p2stateno != [120, 155]) || p2stateno = 131 || p2stateno = 152 || p2stateno = 153) && p2movetype != A && !(enemynear, hitfall)
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = (ctrl || (stateno = [100, 101])) && random < (500 * (AIlevel ** 2 / 64.0))

[State -1, SMP]
type = changestate
value = 210
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = roundstate = 2 && statetype != A
triggerall = (fvar(16) = [0, 60]) && (p2dist y = [-50, 50]) && p2statetype != C && p2statetype != L && !(enemynear, hitfall)
triggerall = (p2stateno != [120, 155]) && p2movetype != A && !(enemynear, hitfall)
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = (stateno = 200 || stateno = 230 || stateno = 400 || stateno = 430)
trigger1 = fvar(16) <= 16 && (movehit = [1, 16]) && random < (250 * (AIlevel ** 2 / 64.0))

[State -1, SMK]
type = changestate
value = 240
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = roundstate = 2 && statetype != A
triggerall = (fvar(16) = [0, 60]) && (p2dist y = [-50, 50]) && p2statetype != C && p2statetype != L && !(enemynear, hitfall)
triggerall = (p2stateno != [120, 155]) && p2movetype != A && !(enemynear, hitfall)
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = (stateno = 200 || stateno = 210 || stateno = 230 || stateno = 400 || stateno = 410 || stateno = 430)
trigger1 = fvar(16) <= 16 && (movehit = [1, 16]) && random < (250 * (AIlevel ** 2 / 64.0))

[State -1, SLK]
type = changestate
value = 230
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = roundstate = 2 && statetype != A && !inguarddist
triggerall = (fvar(16) = [0, 60]) && (p2dist y = [-50, 50]) && p2statetype != C && p2statetype != L && !(enemynear, hitfall)
triggerall = (p2stateno != [120, 155]) && p2movetype != A && !(enemynear, hitfall)
trigger1 = (stateno = 200 || stateno = 400)
trigger1 = fvar(16) <= 4 && ((movehit = [1, 16]) = [1, 4]) && random < (250 * (AIlevel ** 2 / 64.0))

[State -1, CHP]
type = changestate
value = 420
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = roundstate = 2 && statetype != A && !inguarddist
triggerall = (fvar(16) = [0, 40]) && (p2dist y = [-50, 50]) && p2statetype != L && !(enemynear, hitfall)
triggerall = (p2stateno != [120, 155]) && p2movetype != A && !(enemynear, hitfall)
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = (stateno = 200 || stateno = 210 || stateno = 230 || stateno = 240 || stateno = 400 || stateno = 410 || stateno = 430 || stateno = 440)
trigger1 = fvar(16) <= 4 && ((movehit = [1, 16]) = [1, 4]) && random < (250 * (AIlevel ** 2 / 64.0))

[State -1, CHK]
type = changestate
value = 450
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = roundstate = 2 && statetype != A && !inguarddist
triggerall = (fvar(16) = [0, 60]) && (p2dist y = [-50, 50]) && p2statetype != A && p2stateno != 5120
triggerall = ((p2stateno != [120, 155]) || p2stateno = 130 || p2stateno = 150 || p2stateno = 151) && p2movetype != A
trigger1 = (stateno = 200 || stateno = 210 || stateno = 230 || stateno = 240 || stateno = 400 || stateno = 410 || stateno = 430 || stateno = 440)
trigger1 = fvar(16) <= 30 && (movecontact = [1, 8]) && random < (250 * (AIlevel ** 2 / 64.0))

[State -1, CMP]
type = changestate
value = 410
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = roundstate = 2 && statetype != A && !inguarddist
triggerall = (fvar(16) = [0, 45]) && (p2dist y = [-50, 50]) && p2statetype = C
triggerall = (p2stateno != [120, 155]) && p2movetype != A && !(enemynear, hitfall)
trigger1 = (stateno = 200 || stateno = 230 || stateno = 400 || stateno = 430)
trigger1 = fvar(16) <= 20 && ((movehit = [1, 16]) = [1, 4]) && random < (250 * (AIlevel ** 2 / 64.0))

[State -1, CMK]
type = changestate
value = 440
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = roundstate = 2 && statetype != A && !inguarddist
triggerall = (fvar(16) = [0, 70]) && (p2dist y = [-50, 50]) && p2statetype = S
triggerall = ((p2stateno != [120, 155]) || p2stateno = 130 || p2stateno = 150 || p2stateno = 151) && p2movetype != A
trigger1 = (stateno = 200 || stateno = 210 || stateno = 230 || stateno = 400 || stateno = 410 || stateno = 430)
trigger1 = fvar(16) <= 20 && ((movehit = [1, 16]) = [1, 4]) && random < (250 * (AIlevel ** 2 / 64.0))

[State -1, CLP]
type = changestate
value = 400
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = roundstate = 2 && statetype != A && !inguarddist && !(enemynear, hitfall)
triggerall = (fvar(16) = [0, 50]) && (p2dist y = [-50, 50]) && p2statetype = C
triggerall = (p2stateno != [120, 155]) && p2movetype != A
trigger1 = (ctrl || (stateno = [100, 101])) && random < (100 * (AIlevel ** 2 / 64.0))
trigger2 = (stateno = 200 || stateno = 400 || stateno = 430) && time >= 5 && random < (50 * (AIlevel ** 2 / 64.0))

[State -1, AHP]
type = changestate
value = 620
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = roundstate = 2 && statetype = A && !inguarddist
triggerall = vel y > 0 || p2statetype = A
triggerall = (fvar(16) = [0, 45]) && (p2dist y = [-50, 50]) && p2statetype != L && !(enemynear, hitfall)
trigger1 = ctrl && random < (25 * (AIlevel ** 2 / 64.0))
trigger2 = (stateno = 600 || stateno = 610 || stateno = 630 || stateno = 640) && (var(3) != [1, 2]) && ((movehit = [1, 16]) = [1, 4]) && random < (250 * (AIlevel ** 2 / 64.0))

[State -1, AHK]
type = changestate
value = 650
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = roundstate = 2 && statetype = A && !inguarddist
triggerall = vel y > 0 || p2statetype = A
triggerall = (fvar(16) = [0, 50]) && (p2dist y = [-50, 50]) && p2statetype != L && !(enemynear, hitfall)
trigger1 = ctrl && random < (25 * (AIlevel ** 2 / 64.0))
trigger2 = (stateno = 600 || stateno = 610 || stateno = 630 || stateno = 640) && (var(3) != [1, 2]) && ((movehit = [1, 16]) = [1, 4]) && random < (250 * (AIlevel ** 2 / 64.0))

[State -1, TKK]
type = changestate
value = 645
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = roundstate = 2 && statetype = A
triggerall = vel x > 0 && vel y >= 0 && pos y <= -70
triggerall = (fvar(16) = [0, 45]) && (p2dist y = [-50, 50])
trigger1 = ctrl && random < (25 * (AIlevel ** 2 / 64.0))

[State -1, AMP]
type = changestate
value = 610
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = roundstate = 2 && statetype = A
triggerall = vel y > 0 || p2statetype = A
triggerall = (fvar(16) = [0, 100]) && (p2dist y = [-50, 50]) && p2statetype != L && !(enemynear, hitfall)
trigger1 = ctrl && random < (25 * (AIlevel ** 2 / 64.0))

[State -1, AMK]
type = changestate
value = 640
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = roundstate = 2 && statetype = A
triggerall = vel y > 0 || p2statetype = A
triggerall = (fvar(16) = [-50, 30]) && (p2dist y = [-50, 50]) && p2statetype != L && !(enemynear, hitfall)
trigger1 = ctrl && random < (25 * (AIlevel ** 2 / 64.0))

[State -1, ALP]
type = changestate
value = 600
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = roundstate = 2 && statetype = A
triggerall = vel y > 0 || p2statetype = A
triggerall = (fvar(16) = [0, 30]) && (p2dist y = [-50, 50]) && p2statetype != L && !(enemynear, hitfall)
trigger1 = ctrl && random < (25 * (AIlevel ** 2 / 64.0))

[State -1, ALK]
type = changestate
value = 630
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = roundstate = 2 && statetype = A
triggerall = vel y > 0 || p2statetype = A
triggerall = (fvar(16) = [0, 30]) && (p2dist y = [-50, 50]) && p2statetype != L && !(enemynear, hitfall)
trigger1 = ctrl && random < (25 * (AIlevel ** 2 / 64.0))

[State -1, kuuchuutatsumakizankuukyaku]
type = changestate
value = 1250
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = roundstate = 2 && statetype = A && (var(3) != [1, 2])
triggerall = vel y > 0
triggerall = !(enemynear, ctrl) && (enemynear, stateno != [120, 155])
triggerall = (fvar(16) = [0, 80]) && (p2dist y = [-40, 60]) && p2statetype != L
trigger1 = ctrl && random < (ifelse(p2dist x < 0, 200, 25) * (AIlevel ** 2 / 64.0))
trigger2 = (stateno = [600, 699]) && var(6)
trigger2 = (fvar(16) = [0, 25]) && random < (250 * (AIlevel ** 2 / 64.0))

[State -1, tatsumakizankuukyaku]
type = changestate
value = 1200
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = roundstate = 2 && statetype != A
triggerall = !(enemynear, ctrl) && (enemynear, stateno != [120, 155])
triggerall = (fvar(16) = [0, 90]) && (p2dist y = [-90, 0]) && p2statetype != L
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = (stateno = 220 || stateno = 250 || stateno = 420) && var(6)
trigger1 = (fvar(16) = [0, 30]) && random < (250 * (AIlevel ** 2 / 64.0))
trigger2 = stateno = 450 && var(6)
trigger2 = (fvar(16) = [0, 60]) && random < (250 * (AIlevel ** 2 / 64.0))

[State -1, hyakkishuu]
type = changestate
value = 1300
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = roundstate = 2 && statetype != A
triggerall = (p2dist y = [-120, 0]) && !(enemynear, ctrl)
trigger1 = ctrl
trigger1 = var(39) || (p2stateno = [5050, 5109])
trigger1 = random < (50 * (AIlevel ** 2 / 64.0))

[State -1, zankuuhadouken]
type = changestate
value = 1050
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = roundstate = 2 && statetype = A && (var(3) != [1, 2]) && !var(39)
triggerall = !(enemynear, ctrl) && (enemynear, stateno != [120, 155])
triggerall = p2dist x >= 0 && p2dist y >= -25
trigger1 = ctrl && vel y > -2 && random < (333 * (AIlevel ** 2 / 64.0))
trigger2 = (stateno = [600, 699]) && var(6)
trigger2 = random < (100 * (AIlevel ** 2 / 64.0))

[State -1, gouhadouken]
type = changestate
value = 1000
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = roundstate = 2 && statetype != A && !var(39)
triggerall = (fvar(16) >= 0) && (p2dist y >= -25) && p2movetype != A && (p2statetype != L || p2stateno = 5120)
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = ctrl && fvar(16) >= 100
trigger1 = random < (ifelse((prevstateno = [1000, 1099]), 250, 100) * (AIlevel ** 2 / 64.0))
trigger2 = (stateno = [200, 499]) && var(6)
trigger2 = (fvar(16) = [40, 80]) && random < (100 * (AIlevel ** 2 / 64.0))

[State -1, shakunetsuhadouken]
type = changestate
value = 1020
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = roundstate = 2 && statetype != A && !var(39)
triggerall = (fvar(16) >= 0) && (p2dist y >= -25) && p2movetype != A && p2statetype != L
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = ctrl && fvar(16) >= 160
trigger1 = random < (ifelse((prevstateno = [1000, 1099]), 200, 100) * (AIlevel ** 2 / 64.0))
trigger2 = (stateno = 220 || stateno = 250 || stateno = 420 || stateno = 450) && var(6)
trigger2 = (fvar(16) = [0, 25]) && random < (50 * (AIlevel ** 2 / 64.0))

[State -1, shungokusatsu]
type = changestate
value = 4000
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = roundstate = 2 && statetype != A
triggerall = power >= 3000 && !var(20)
triggerall = p2movetype != H
triggerall = !(enemynear, ctrl) && (p2stateno != 40) && (p2stateno != [5030, 5119])
triggerall = (fvar(16) = [-160, 160]) && (p2dist y = [-120, 0]) && p2statetype != L
triggerall = (enemynear, vel y = 0) || (enemynear, vel y > 0 && enemynear, vel x < 0)
trigger1 = ctrl && (fvar(16) = [0, 60]) && (enemynear, statetype != A) && random < (200 * (AIlevel ** 2 / 64.0))

[State -1, misogi]
type = changestate
value = 4100
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = roundstate = 2 && statetype != A
triggerall = power >= 3000 && !var(20)
triggerall = !(enemynear, ctrl) && (enemynear, stateno != [120, 155]) && p2statetype != L
triggerall = (p2stateno != [5030, 5119]) && (enemynear, vel x = [-1, 1]) && (enemynear, vel y < 4)
triggerall = movetype = A || !(enemynear, hitfall)
trigger1 = ctrl && (enemynear, statetype = S || enemynear, statetype = C) && (enemynear, animtime <= -30) && random < (100 * (AIlevel ** 2 / 64.0))
trigger2 = ctrl && (enemynear, statetype = A) && (enemynear, pos y <= -60) && (enemynear, movetype = A) && random < (500 * (AIlevel ** 2 / 64.0))
trigger3 = stateno = 1100 && (movehit = [1, 16]) && random < (100 * (AIlevel ** 2 / 64.0))

[State -1, kkz]
type = changestate
value = 4200
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = roundstate = 2 && statetype != A && prevstateno != 4200
triggerall = !numhelper(4205) && !numhelper(4206)
triggerall = power >= 2000 && !var(20)
triggerall = !(enemynear, ctrl) && (enemynear, stateno != [120, 155])
triggerall = (fvar(16) = [-30, 30]) && (p2dist y = [-60, 0])
trigger1 = (stateno = 1100 || stateno = 3300) && (movehit = [1, 16]) && random < (50 * (AIlevel ** 2 / 64.0))
trigger2 = stateno = 3000 && numhelper(3005)
trigger2 = helper(3005), var(18) && random < (100 * (AIlevel ** 2 / 64.0))
trigger3 = ctrl && inguarddist
trigger3 = (p2stateno = [3000, 4999]) && random < (200 * (AIlevel ** 2 / 64.0))

[State -1, tkj]
type = changestate
value = 4300
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = roundstate = 2 && statetype != A && prevstateno != 4300
triggerall = !numhelper(4305)
triggerall = power >= 2000 && !var(20)
triggerall = !(enemynear, ctrl) && (enemynear, stateno != [120, 155])
triggerall = (fvar(16) = [-80, 80]) && (p2dist y = [-60, 0])
trigger1 = stateno = 3300 && (movehit = [1, 16]) && random < (50 * (AIlevel ** 2 / 64.0))
trigger2 = stateno = 3100 && (movehit = [1, 16]) && animelemtime(17) >= 0 && random < (200 * (AIlevel ** 2 / 64.0))
trigger3 = stateno = 1400 && animelemtime(6) >= 0 && (fvar(16) = [0, 50]) && p2statetype != A && random < (250 * (AIlevel ** 2 / 64.0))

[State -1, tenmagouzankuu2]
type = changestate
value = 3070
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = roundstate = 2 && statetype = A && (var(3) != [1, 2]) && !var(39) && prevstateno != 3070
triggerall = power >= 2000 && !var(20)
triggerall = !(enemynear, ctrl) && (enemynear, stateno != [120, 155]) && p2statetype != L
triggerall = (fvar(16) = [0, 50]) && p2dist y >= -10
trigger1 = (stateno = 1100 || stateno = 1250 || stateno = [1301, 1303])
trigger1 = (movehit = [1, 16]) && (fvar(16) = [0, 35]) && random < (250 * (AIlevel ** 2 / 64.0))
trigger2 = stateno = 3100 && (movehit = [1, 16]) && random < (200 * (AIlevel ** 2 / 64.0))
trigger3 = (stateno = [3200, 3250]) && (movehit = [1, 16]) && (hitcount >= 7 || anim = 3205) && random < (200 * (AIlevel ** 2 / 64.0))
trigger4 = stateno = 3050 && numhelper(3055)
trigger4 = helper(3055), var(18) && random < (100 * (AIlevel ** 2 / 64.0))

[State -1, messatsugoushoryuu]
type = changestate
value = 3100
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = roundstate = 2 && statetype != A && prevstateno != 3100
triggerall = power >= 1000 && var(20) <= 60
triggerall = !(enemynear, ctrl) && (enemynear, stateno != [120, 155])
triggerall = (fvar(16) = [-60, 60]) && (p2dist y = [-40, 0]) && p2statetype != L
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = (stateno = 220 || stateno = 250 || stateno = 420 || stateno = 450)
trigger1 = (movehit = [1, 16]) && (fvar(16) = [0, 30]) && random < (100 * (AIlevel ** 2 / 64.0))
trigger2 = (stateno = 1100 || (stateno = [1304, 1305]))
trigger2 = (movehit = [1, 16]) && (fvar(16) = [0, 30]) && random < (250 * (AIlevel ** 2 / 64.0))
trigger3 = (stateno = [1000, 4999]) && numhelper(stateno + 5) && stateno != 4200
trigger3 = helper(stateno + 5), var(18) && random < (100 * (AIlevel ** 2 / 64.0))
trigger4 = ctrl && enemynear, movetype = A && (fvar(16) = [0, 70]) && random < (250 * (AIlevel ** 2 / 64.0))

[State -1, messatsugousenpu]
type = changestate
value = 3250
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = roundstate = 2 && statetype = A && (var(3) != [1, 2]) && (prevstateno != [3200, 3250])
triggerall = power >= 1000 && var(20) <= 60
triggerall = !(enemynear, ctrl) && (enemynear, stateno != [120, 155])
triggerall = (fvar(16) = [0, 40]) && (p2dist y = [-90, 0]) && p2statetype != L
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = ((stateno = [1200, 1250]) || stateno = [1301, 1303])
trigger1 = (movehit = [1, 16]) && (fvar(16) = [0, 30]) && random < (100 * (AIlevel ** 2 / 64.0))
trigger2 = stateno = 3100 && (movehit = [1, 16]) && random < (333 * (AIlevel ** 2 / 64.0))
trigger3 = (stateno = [1000, 4999]) && numhelper(stateno + 5) && var(10) <= 6 && stateno != 3070
trigger3 = helper(stateno + 5), var(18) && random < (100 * (AIlevel ** 2 / 64.0)) && ifelse(anim = 4300, animelemtime(7) >= 0, 1)

[State -1, messatsugourasen]
type = changestate
value = 3200
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = roundstate = 2 && statetype != A && (prevstateno != [3200, 3250])
triggerall = power >= 1000 && var(20) <= 60
triggerall = !(enemynear, ctrl) && (enemynear, stateno != [120, 155])
triggerall = (fvar(16) = [-20, 20]) && (p2dist y = [-50, 0]) && p2statetype != L
trigger1 = (stateno = 220 || stateno = 250 || stateno = 420 || stateno = 450)
trigger1 = (movehit = [1, 16]) && fvar(16) = 0 && random < (100 * (AIlevel ** 2 / 64.0))
trigger2 = stateno = 3100 && (movehit = [1, 16]) && animelemtime(17) >= 0 && fvar(16) = 0 && random < (333 * (AIlevel ** 2 / 64.0))
trigger3 = stateno = 4200 && numhelper(4206)
trigger3 = helper(4206), var(18) && random < (100 * (AIlevel ** 2 / 64.0))
trigger4 = ctrl && enemynear, movetype = A && (fvar(16) = [0, 10]) && random < (200 * (AIlevel ** 2 / 64.0))

[State -1, tenmashinzuiwari]
type = changestate
value = 3300
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = roundstate = 2 && statetype = A && (var(3) != [1, 2]) && pos y >= -50 && prevstateno != 3300
triggerall = power >= 1000 && var(20) <= 60
triggerall = !(enemynear, ctrl) && (enemynear, stateno != [120, 155])
triggerall = (fvar(16) = [-30, 60]) && p2dist y >= -15 && (enemynear, vel y < 6)
trigger1 = (stateno = 620 || stateno = 650)
trigger1 = (movehit = [1, 16]) && random < (100 * (AIlevel ** 2 / 64.0))
trigger2 = (stateno = 1100 || stateno = 1250 || stateno = [1301, 1303])
trigger2 = (movehit = [1, 16]) && random < (250 * (AIlevel ** 2 / 64.0))
trigger3 = stateno = 3100 && (movehit = [1, 16]) && random < (200 * (AIlevel ** 2 / 64.0))
trigger4 = (stateno = [3200, 3250]) && (movehit = [1, 16]) && (hitcount >= 7 || anim = 3205) && random < (200 * (AIlevel ** 2 / 64.0))
trigger5 = stateno = 1050 || stateno = 3050 || stateno = 3070
trigger5 = ifelse(stateno = 3070, animelemtime(31) >= 0, 1)
trigger5 = numhelper(stateno + 5)
trigger5 = helper(stateno + 5), var(18) && random < (200 * (AIlevel ** 2 / 64.0))

[State -1, tenmagouzankuu]
type = changestate
value = 3050
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = roundstate = 2 && statetype = A && (var(3) != [1, 2]) && !var(39) && prevstateno != 3050
triggerall = power >= 1000 && var(20) <= 60
triggerall = !(enemynear, ctrl) && (enemynear, stateno != [120, 155]) && p2statetype != L
triggerall = (fvar(16) = [0, 120]) && p2dist y >= -20 && (enemynear, vel y < 4)
trigger1 = (stateno = 620 || stateno = 650)
trigger1 = (movehit = [1, 16]) && (fvar(16) = [0, 30]) && random < (100 * (AIlevel ** 2 / 64.0))
trigger2 = (stateno = 1100 || stateno = 1250 || stateno = [1301, 1303])
trigger2 = (movehit = [1, 16]) && random < (250 * (AIlevel ** 2 / 64.0))
trigger3 = stateno = 3100 && (movehit = [1, 16]) && random < (200 * (AIlevel ** 2 / 64.0))
trigger4 = (stateno = [3200, 3250]) && (movehit = [1, 16]) && (hitcount >= 7 || anim = 3205) && random < (200 * (AIlevel ** 2 / 64.0))
trigger5 = (stateno = [1000, 4999]) && numhelper(stateno + 5) && var(10) <= 6 && stateno != 3050
trigger5 = helper(stateno + 5), var(18) && random < (100 * (AIlevel ** 2 / 64.0))
trigger5 = ifelse(stateno = 3070, animelemtime(21) >= 0, 1) && ifelse(anim = 4300, animelemtime(7) >= 0, 1)

[State -1, messatsugouhadou]
type = changestate
value = 3000
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = roundstate = 2 && statetype != A && prevstateno != 3000
triggerall = power >= 1000 && var(20) <= 60 && !var(39)
triggerall = !(enemynear, ctrl) && (enemynear, stateno != [120, 155])
triggerall = (fvar(16) = [-120, 120]) && (p2dist y = [-40, 0]) && (enemynear, vel y < 8) && p2statetype != L
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = (stateno = 1100 || (stateno = [1304, 1305]))
trigger1 = (movehit = [1, 16]) && (fvar(16) = [0, 60]) && random < (250 * (AIlevel ** 2 / 64.0))
trigger2 = stateno = 3100 && (movehit = [1, 16]) && animelemtime(17) >= 0 && random < (200 * (AIlevel ** 2 / 64.0))
trigger3 = (stateno = [1000, 4999]) && numhelper(stateno + 5) && var(10) <= 6 && stateno != 3000
trigger3 = helper(stateno + 5), var(18) && random < (100 * (AIlevel ** 2 / 64.0))

[State -1, No wasting]
type = changestate
value = 1000
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = roundstate = 2 && statetype != A && !var(39)
triggerall = (p2statetype != A)
trigger1 = (stateno = [200, 499])
trigger1 = movehit = 4

[State -1, taunt]
type = changestate
value = 195
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = !var(37)
triggerall = roundstate = 2 && statetype != A && prevstateno != 195
triggerall = life >= (lifemax / 2)
trigger1 = ctrl && numenemy
trigger1 = (enemynear, life) <= (enemynear, lifemax / 2)
trigger1 = p2dist x >= 160 && !(enemynear, ctrl) && (enemynear, movetype = H)
trigger1 = (enemynear, statetype = A || enemynear, statetype = L) && random < (500 * (AIlevel ** 2 / 64.0))
