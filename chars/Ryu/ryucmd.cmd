; ______________________________
;| Ryu by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
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
command.time = 12
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
name = "236236pp"
command = ~D, F, D, F, x+y
time = 30
[Command]
name = "236236pp"
command = ~D, F, D, F, x+z
time = 30
[Command]
name = "236236pp"
command = ~D, F, D, F, y+z
time = 30

[Command]
name = "236236pp+"
command = ~D, F, D, F, x+y
time = 30
buffer.time = 5
[Command]
name = "236236pp+"
command = ~D, F, D, F, x+z
time = 30
buffer.time = 5
[Command]
name = "236236pp+"
command = ~D, F, D, F, y+z
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
name = "236236kk"
command = ~D, F, D, F, a+b
time = 30
[Command]
name = "236236kk"
command = ~D, F, D, F, a+c
time = 30
[Command]
name = "236236kk"
command = ~D, F, D, F, b+c
time = 30

[Command]
name = "236236kk+"
command = ~D, F, D, F, a+b
time = 30
buffer.time = 5
[Command]
name = "236236kk+"
command = ~D, F, D, F, a+c
time = 30
buffer.time = 5
[Command]
name = "236236kk+"
command = ~D, F, D, F, b+c
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
name = "214214pp"
command = ~D, B, D, B, x+y
time = 30
[Command]
name = "214214pp"
command = ~D, B, D, B, x+z
time = 30
[Command]
name = "214214pp"
command = ~D, B, D, B, y+z
time = 30

[Command]
name = "214214pp+"
command = ~D, B, D, B, x+y
time = 30
buffer.time = 5
[Command]
name = "214214pp+"
command = ~D, B, D, B, x+z
time = 30
buffer.time = 5
[Command]
name = "214214pp+"
command = ~D, B, D, B, y+z
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
name = "satsu"
command = x, x, F, a, z
time = 40
[Command]
name = "satsu"
command = x, x, F, a+z
time = 32
[Command]
name = "satsu"
command = x, x, F+a+z
time = 24

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
name = "236pp"
command = ~D, DF, F, x+y
time = 12
[Command]
name = "236pp"
command = ~D, DF, F, x+z
time = 12
[Command]
name = "236pp"
command = ~D, DF, F, y+z
time = 12

[Command]
name = "236pp+"
command = ~D, DF, F, x+y
time = 12
buffer.time = 5
[Command]
name = "236pp+"
command = ~D, DF, F, x+z
time = 12
buffer.time = 5
[Command]
name = "236pp+"
command = ~D, DF, F, y+z
time = 12
buffer.time = 5

[Command]
name = "236k"
command = ~D, DF, F, a
time = 12
[Command]
name = "236k"
command = ~D, DF, F, b
time = 12
[Command]
name = "236k"
command = ~D, DF, F, c
time = 12
[Command]
name = "236k"
command = ~D, DF, F, ~a
time = 12
[Command]
name = "236k"
command = ~D, DF, F, ~b
time = 12
[Command]
name = "236k"
command = ~D, DF, F, ~c
time = 12

[Command]
name = "236k+"
command = ~D, DF, F, a
time = 12
buffer.time = 5
[Command]
name = "236k+"
command = ~D, DF, F, b
time = 12
buffer.time = 5
[Command]
name = "236k+"
command = ~D, DF, F, c
time = 12
buffer.time = 5
[Command]
name = "236k+"
command = ~D, DF, F, ~a
time = 12
buffer.time = 5
[Command]
name = "236k+"
command = ~D, DF, F, ~b
time = 12
buffer.time = 5
[Command]
name = "236k+"
command = ~D, DF, F, ~c
time = 12
buffer.time = 5

[Command]
name = "236kk"
command = ~D, DF, F, a+b
time = 12
[Command]
name = "236kk"
command = ~D, DF, F, a+c
time = 12
[Command]
name = "236kk"
command = ~D, DF, F, b+c
time = 12

[Command]
name = "236kk+"
command = ~D, DF, F, a+b
time = 12
buffer.time = 5
[Command]
name = "236kk+"
command = ~D, DF, F, a+c
time = 12
buffer.time = 5
[Command]
name = "236kk+"
command = ~D, DF, F, b+c
time = 12
buffer.time = 5

[Command]
name = "236s"
command = ~D, DF, F, s
time = 12

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
buffer.time = 5

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
name = "214kk"
command = ~D, DB, B, a+b
time = 12
[Command]
name = "214kk"
command = ~D, DB, B, a+c
time = 12
[Command]
name = "214kk"
command = ~D, DB, B, b+c
time = 12

[Command]
name = "214kk+"
command = ~D, DB, B, a+b
time = 12
buffer.time = 5
[Command]
name = "214kk+"
command = ~D, DB, B, a+c
time = 12
buffer.time = 5
[Command]
name = "214kk+"
command = ~D, DB, B, b+c
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
name = "623ppp"
command = ~F, D, $F, x+y+z
time = 18

[Command]
name = "623ppp+"
command = ~F, D, $F, x+y+z
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
name = "623kkk"
command = ~F, D, $F, a+b+c
time = 18

[Command]
name = "623kkk+"
command = ~F, D, $F, a+b+c
time = 18
buffer.time = 5

[Command]
name = "421ppp"
command = ~B, D, $B, x+y+z
time = 18

[Command]
name = "421ppp+"
command = ~B, D, $B, x+y+z
time = 18
buffer.time = 5

[Command]
name = "421kkk"
command = ~B, D, $B, a+b+c
time = 18

[Command]
name = "421kkk+"
command = ~B, D, $B, a+b+c
time = 18
buffer.time = 5

[Command]
name = "41236k"
command = ~B, $D, F, a
time = 18
[Command]
name = "41236k"
command = ~B, $D, F, b
time = 18
[Command]
name = "41236k"
command = ~B, $D, F, c
time = 18
[Command]
name = "41236k"
command = ~B, $D, F, ~a
time = 18
[Command]
name = "41236k"
command = ~B, $D, F, ~b
time = 18
[Command]
name = "41236k"
command = ~B, $D, F, ~c
time = 18

[Command]
name = "41236k+"
command = ~B, $D, F, a
time = 18
buffer.time = 5
[Command]
name = "41236k+"
command = ~B, $D, F, b
time = 18
buffer.time = 5
[Command]
name = "41236k+"
command = ~B, $D, F, c
time = 18
buffer.time = 5
[Command]
name = "41236k+"
command = ~B, $D, F, ~a
time = 18
buffer.time = 5
[Command]
name = "41236k+"
command = ~B, $D, F, ~b
time = 18
buffer.time = 5
[Command]
name = "41236k+"
command = ~B, $D, F, ~c
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
name = "ppp"
command = x+y+z
time = 1

[Command]
name = "kkk"
command = a+b+c
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

[Command]
name = "6z"
command = /F, z
time = 1
[Command]
name = "6z+"
command = /F, z
time = 1
buffer.time = 5

[Command]
name = "4z"
command = /B, z
time = 1
[Command]
name = "4z+"
command = /B, z
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

[State -1, Ashura Senkuu]
type = varset
var(59) = 1400
ignorehitpause = 1
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = helper(9999), command = "623ppp+" || helper(9999), command = "623kkk+" || helper(9999), command = "421ppp+" || helper(9999), command = "421kkk+"
triggerall = helper(9999), command = "623ppp" || helper(9999), command = "623kkk" || helper(9999), command = "421ppp" || helper(9999), command = "421kkk" || !var(58)
triggerall = var(1) != 1 && roundstate = 2 && statetype != A
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(6)

[State -1, Shun Goku Satsu]
type = varset
var(59) = 4000
ignorehitpause = 1
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = helper(9999), command = "satsu+"
triggerall = helper(9999), command = "satsu" || !var(58)
triggerall = var(1) != 1 && roundstate = 2 && statetype != A && power >= 3000 && var(20) <= 60
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(7) || (var(8) && stateno != 4000)
trigger3 = (stateno = [200, 499])

[State -1, Shin Shoryuuken]
type = varset
var(59) = 3120
ignorehitpause = 1
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = helper(9999), command = "6v"
triggerall = helper(9999), command = "236236kk+"
triggerall = helper(9999), command = "236236kk" || !var(58)
triggerall = var(1) != 2 && roundstate = 2 && statetype != A && power >= 3000 && var(20) <= 60
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(7) || (var(8) && stateno != 3100 && stateno != 3120)

[State -1, Metsu Shoryuuken]
type = varset
var(59) = 3160
ignorehitpause = 1
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = helper(9999), command = "6v"
triggerall = (var(1) = 2 && helper(9999), command = "236236kk+") || (var(1) = 3 && helper(9999), command = "236236pp+")
triggerall = (var(1) = 2 && helper(9999), command = "236236kk") || (var(1) = 3 && helper(9999), command = "236236pp") || !var(58)
triggerall = var(1) != 1 && roundstate = 2 && statetype != A && power >= 2000 && var(20) <= 60
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(7) || (var(8) && stateno != 3160)

[State -1, Metsu Hadouken]
type = varset
var(59) = 3040
ignorehitpause = 1
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = helper(9999), command = "4v"
triggerall = helper(9999), command = "214214pp+"
triggerall = helper(9999), command = "214214pp" || !var(58)
triggerall = var(1) != 1 && roundstate = 2 && statetype != A && power >= 3000 && var(20) <= 60
triggerall = !var(39)
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(7) || (var(8) && stateno != 3042)

[State -1, Kaze no Ken]
type = varset
var(59) = 3300
ignorehitpause = 1
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = helper(9999), command = "2v"
triggerall = command = "222pp+"
triggerall = command = "222pp" || !var(58)
triggerall = var(1) != 2 && roundstate = 2 && statetype != A && power >= 2000 && var(20) <= 60
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(7) || (var(8) && stateno != 3310)

[State -1, Denjin Hadouken]
type = varset
var(59) = 3020
ignorehitpause = 1
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = helper(9999), command = "4v"
triggerall = helper(9999), command = "214214p+"
triggerall = helper(9999), command = "214214p" || !var(58)
triggerall = var(1) != 2 && roundstate = 2 && statetype != A && power >= 1000 && var(20) <= 60
triggerall = !var(39)
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(7) || (var(8) && stateno != 3020)

[State -1, Reppu Jinrai Shou]
type = varset
var(59) = 3180
ignorehitpause = 1
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = helper(9999), command = "6v"
triggerall = helper(9999), command = "236236k+"
triggerall = helper(9999), command = "236236k" || !var(58)
triggerall = var(1) = 3 && roundstate = 2 && statetype != A && power >= 1000 && var(20) <= 60
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(7) || (var(8) && stateno != 3180)

[State -1, Messatsu Gou Shoryuu]
type = varset
var(59) = 3140
ignorehitpause = 1
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = helper(9999), command = "6v"
triggerall = helper(9999), command = "236236k+"
triggerall = helper(9999), command = "236236k" || !var(58)
triggerall = var(1) = 2 && roundstate = 2 && statetype != A && power >= 1000 && var(20) <= 60
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(7) || (var(8) && stateno != 3140)

[State -1, Nidan Shoryuu Tsuki]
type = varset
var(59) = 3100
ignorehitpause = 1
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = helper(9999), command = "6v"
triggerall = helper(9999), command = "236236k+"
triggerall = helper(9999), command = "236236k" || !var(58)
triggerall = var(1) = 1 && roundstate = 2 && statetype != A && power >= 1000 && var(20) <= 60
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(7) || (var(8) && stateno != 3100)

[State -1, Shinkuu Tatsumaki]
type = varset
var(59) = 3200
ignorehitpause = 1
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = helper(9999), command = "4v"
triggerall = helper(9999), command = "214214k+"
triggerall = helper(9999), command = "214214k" || !var(58)
triggerall = roundstate = 2 && statetype != A && power >= 1000 && var(20) <= 60
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(7) || (var(8) && stateno != 3200)

[State -1, Shinkuu Hadouken]
type = varset
var(59) = 3000
ignorehitpause = 1
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = helper(9999), command = "6v"
triggerall = helper(9999), command = "236236p+"
triggerall = helper(9999), command = "236236p" || !var(58)
triggerall = roundstate = 2 && statetype != A && power >= 1000 && var(20) <= 60
triggerall = !var(39)
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(7) || (var(8) && stateno != 3000)

[State -1, EX Shoryuken]
type = varset
var(59) = 1110
ignorehitpause = 1
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = helper(9999), command = "623pp+"
triggerall = helper(9999), command = "623pp" || !var(58)
triggerall = ifelse((stateno = 226 || stateno = 440), (helper(9999), command != "236p"), 1)
triggerall = var(1) < 3 && roundstate = 2 && statetype != A && power >= 500 && var(20) <= 60
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(6)

[State -1, EX Kuchuu Tatsumaki]
type = varset
var(59) = 1260
ignorehitpause = 1
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "214kk"
triggerall = var(1) < 3 && roundstate = 2 && statetype = A && (var(3) != [1, 2]) && power >= 500 && var(20) <= 60
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(6)
trigger3 = stateno = 245 && movecontact

[State -1, EX Tatsumaki]
type = varset
var(59) = 1210
ignorehitpause = 1
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = helper(9999), command = "214kk+"
triggerall = helper(9999), command = "214kk" || !var(58)
triggerall = var(1) < 3 && roundstate = 2 && statetype != A && power >= 500 && var(20) <= 60
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(6)

[State -1, EX Ryusokyaku]
type = varset
var(59) = 1520
ignorehitpause = 1
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = helper(9999), command = "236kk+"
triggerall = helper(9999), command = "236kk" || !var(58)
triggerall = var(1) = 2 && roundstate = 2 && statetype != A && power >= 500 && var(20) <= 60
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(6)

[State -1, EX Joudan]
type = varset
var(59) = 1310
ignorehitpause = 1
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = helper(9999), command = "236kk+"
triggerall = helper(9999), command = "236kk" || !var(58)
triggerall = var(1) = 1 && roundstate = 2 && statetype != A && power >= 500 && var(20) <= 60
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(6)

[State -1, EX Hadouken]
type = varset
var(59) = 1010
ignorehitpause = 1
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = helper(9999), command = "236pp+"
triggerall = helper(9999), command = "236pp" || !var(58)
triggerall = var(1) < 3 && roundstate = 2 && statetype != A && !var(39)
triggerall = power >= 500 && var(20) <= 60
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(6)

[State -1, Shakunetsu Hadouken]
type = varset
var(59) = 1020
ignorehitpause = 1
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = helper(9999), command = "63214p+"
triggerall = helper(9999), command = "63214p" || !var(58)
triggerall = var(1) != 1 && roundstate = 2 && statetype != A && !var(39)
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(6)

[State -1, Shoryuken]
type = varset
var(59) = 1100
ignorehitpause = 1
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = helper(9999), command = "623p+"
triggerall = helper(9999), command = "623p" || !var(58)
triggerall = ifelse((var(20) && stateno = 1000), (helper(9999), command != "236p"), 1);custom combo
triggerall = ifelse((stateno = 226 || stateno = 440), (helper(9999), command != "236p"), 1)
triggerall = roundstate = 2 && statetype != A
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(6)

[State -1, Kuchuu Tatsumaki]
type = varset
ignorehitpause = 1
var(59) = ifelse(var(1) = 3, 1270, 1250)
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "214k"
triggerall = roundstate = 2 && statetype = A && (var(3) != [1, 2])
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(6)

[State -1, Tatsumaki]
type = varset
var(59) = 1200
ignorehitpause = 1
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = helper(9999), command = "214k+"
triggerall = helper(9999), command = "214k" || !var(58)
triggerall = roundstate = 2 && statetype != A
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(6)

[State -1, Joudan Sokutou Geri]
type = varset
var(59) = 1300
ignorehitpause = 1
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = (var(1) = 1 && helper(9999), command = "236k+") || (var(1) = 3 && helper(9999), command = "41236k+")
triggerall = (var(1) = 1 && helper(9999), command = "236k") || (var(1) = 3 && helper(9999), command = "41236k") || !var(58)
triggerall = roundstate = 2 && statetype != A
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(6)

[State -1, Ryusokyaku]
type = varset
var(59) = 1500
ignorehitpause = 1
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = helper(9999), command = "236k+"
triggerall = helper(9999), command = "236k" || !var(58)
triggerall = var(1) != 1 && roundstate = 2 && statetype != A
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(6)

[State -1, Hadouken]
type = varset
var(59) = 1000
ignorehitpause = 1
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = helper(9999), command = "236p+"
triggerall = helper(9999), command = "236p" || !var(58)
triggerall = roundstate = 2 && statetype != A && !var(39)
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(6)

[State -1, Custom Combo]
type = varset
var(59) = ifelse(statetype = A, 765, 760)
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "c+z"
triggerall = roundstate = 2 && power >= 2000 && !var(20)
trigger1 = ctrl || (stateno = [100, 101])

[State -1, Zero Counter]
type = changestate
value = 750
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "counter_p" || command = "counter_k"
triggerall = roundstate = 2 && power >= 1000 && statetype != A && !var(20)
trigger1 = stateno = 150 || stateno = 152
trigger2 = (stateno = 151 || stateno = 153) && time < 8

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

[State -1, Seichuu Nidan Tsuki]
type = varset
var(59) = 226
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "z+"
triggerall = (var(1) = 2 && command = "6z+") || (var(1) = 3 && command = "4z+")
triggerall = (var(1) = 2 && command = "6z") || (var(1) = 3 && command = "4z") || !var(58)
triggerall = command != "holddown" && statetype != A && var(1) != 1
trigger1 = ctrl || (stateno = [100, 101])
trigger2 = var(4)
trigger3 = var(1) = 3
trigger3 = (movecontact + movereversed) = [1, 4]
trigger3 = stateno = 200 || stateno = 210 || stateno = 230 || stateno = 240 || stateno = 400 || stateno = 410 || stateno = 430 || stateno = 440

[State -1, Kyuubi Kudaki]
type = varset
var(59) = 225
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "6z" || (!var(58) && command = "6z+")
triggerall = command != "holddown" && statetype != A && var(1) != 2
trigger1 = ctrl || (stateno = [100, 101])
trigger2 = var(4)
trigger3 = var(1) = 3
trigger3 = (movecontact + movereversed) = [1, 4]
trigger3 = stateno = 200 || stateno = 210 || stateno = 230 || stateno = 240 || stateno = 400 || stateno = 410 || stateno = 430 || stateno = 440

[State -1, CHK]
type = varset
var(59) = 450
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "c" || (!var(58) && command = "c+")
triggerall = command = "holddown" && statetype != A
trigger1 = ctrl || (stateno = [100, 101])
trigger2 = var(4)
trigger3 = var(1) = 3
trigger3 = (movecontact + movereversed) = [1, 4]
trigger3 = stateno = 200 || stateno = 210 || stateno = 220 || stateno = 225 || stateno = 226 || stateno = 230 || stateno = 240
trigger4 = var(1) = 3
trigger4 = (movecontact + movereversed) = [1, 4]
trigger4 = stateno = 400 || stateno = 410 || stateno = 420 || stateno = 430 || stateno = 440

[State -1, CHP]
type = varset
var(59) = 420
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "z" || (!var(58) && command = "z+")
triggerall = command = "holddown" && statetype != A
trigger1 = ctrl || (stateno = [100, 101])
trigger2 = var(4)
trigger3 = var(1) = 3
trigger3 = (movecontact + movereversed) = [1, 4]
trigger3 = stateno = 200 || stateno = 210 || stateno = 230 || stateno = 240 || stateno = 400 || stateno = 410 || stateno = 430 || stateno = 440

[State -1, SHK]
type = varset
var(59) = 250
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "c" || (!var(58) && command = "c+")
triggerall = command != "holddown" && statetype != A
trigger1 = ctrl || (stateno = [100, 101])
trigger2 = var(4)
trigger3 = var(1) = 3
trigger3 = (movecontact + movereversed) = [1, 4]
trigger3 = stateno = 200 || stateno = 210 || stateno = 220 || stateno = 225 || stateno = 226 || stateno = 230 || stateno = 240
trigger4 = var(1) = 3
trigger4 = (movecontact + movereversed) = [1, 4]
trigger4 = stateno = 400 || stateno = 410 || stateno = 420 || stateno = 430 || stateno = 440

[State -1, SHP]
type = varset
var(59) = 220
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "z" || (!var(58) && command = "z+")
triggerall = command != "holddown" && statetype != A
trigger1 = ctrl || (stateno = [100, 101])
trigger2 = var(4)
trigger3 = var(1) = 3
trigger3 = (movecontact + movereversed) = [1, 4]
trigger3 = stateno = 200 || stateno = 210 || stateno = 230 || stateno = 240 || stateno = 400 || stateno = 410 || stateno = 430 || stateno = 440

[State -1, Senpuu Kyaku]
type = varset
var(59) = 245
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "6b" || (!var(58) && command = "6b+")
triggerall = command != "holddown" && statetype != A
trigger1 = ctrl || (stateno = [100, 101])
trigger2 = var(4)
trigger3 = var(1) = 3
trigger3 = (movecontact + movereversed) = [1, 4]
trigger3 = stateno = 200 || stateno = 210 || stateno = 230 || stateno = 400 || stateno = 410 || stateno = 430

[State -1, Sakotsu Wari]
type = varset
var(59) = 215
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "6y" || (!var(58) && command = "6y+")
triggerall = command != "holddown" && statetype != A
trigger1 = ctrl || (stateno = [100, 101])
trigger2 = var(4)
trigger3 = var(1) = 3
trigger3 = (movecontact + movereversed) = [1, 4]
trigger3 = stateno = 200 || stateno = 230 || stateno = 400 || stateno = 430

[State -1, CMK]
type = varset
var(59) = 440
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "b" || (!var(58) && command = "b+")
triggerall = command = "holddown" && statetype != A
trigger1 = ctrl || (stateno = [100, 101])
trigger2 = var(4)
trigger3 = var(1) = 3
trigger3 = (movecontact + movereversed) = [1, 4]
trigger3 = stateno = 200 || stateno = 210 || stateno = 230 || stateno = 400 || stateno = 410 || stateno = 430

[State -1, CMP]
type = varset
var(59) = 410
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "y" || (!var(58) && command = "y+")
triggerall = command = "holddown" && statetype != A
trigger1 = ctrl || (stateno = [100, 101])
trigger2 = var(4)
trigger3 = var(1) = 3
trigger3 = (movecontact + movereversed) = [1, 4]
trigger3 = stateno = 200 || stateno = 230 || stateno = 400 || stateno = 430

[State -1, SMK]
type = varset
var(59) = 240
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "b" || (!var(58) && command = "b+")
triggerall = command != "holddown" && statetype != A
trigger1 = ctrl || (stateno = [100, 101])
trigger2 = var(4)
trigger3 = var(1) = 3
trigger3 = (movecontact + movereversed) = [1, 4]
trigger3 = stateno = 200 || stateno = 210 || stateno = 230 || stateno = 400 || stateno = 410 || stateno = 430

[State -1, SMP]
type = varset
var(59) = 210
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "y" || (!var(58) && command = "y+")
triggerall = command != "holddown" && statetype != A
trigger1 = ctrl || (stateno = [100, 101])
trigger2 = var(4)
trigger3 = var(1) = 3
trigger3 = (movecontact + movereversed) = [1, 4]
trigger3 = stateno = 200 || stateno = 230 || stateno = 400 || stateno = 430

[State -1, CLK]
type = varset
var(59) = 430
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "a" || (!var(58) && command = "a+")
triggerall = command = "holddown" && statetype != A
trigger1 = ctrl || (stateno = [100, 101])
trigger2 = (stateno = 200 || stateno = 400 || stateno = 430) && time >= 5
trigger3 = var(4)
trigger4 = var(1) = 3
trigger4 = (movecontact + movereversed) = [1, 4]
trigger4 = stateno = 200 || stateno = 400

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
trigger2 = (stateno = 200 || stateno = 400 || stateno = 430) && time >= 5
trigger3 = var(4)
trigger4 = var(1) = 3
trigger4 = (movecontact + movereversed) = [1, 4]
trigger4 = stateno = 200 || stateno = 400

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
trigger2 = var(4)

[State -1, AHP]
type = varset
var(59) = 620
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "z" && statetype = A
trigger1 = ctrl
trigger2 = var(4)

[State -1, TKK]
type = varset
var(59) = 645
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "b"
triggerall = command = "holddown" && statetype = A && var(1) != 1
triggerall = vel x > 0 && pos y <= -75 && (var(3) != [1, 2])
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

[State -1, Hado no Kamae]
type = varset
var(59) = 1090
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = helper(9999), command = "236s"
triggerall = var(1) != 2 && statetype != A
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(6)

[State -1, Taunt]
type = varset
var(59) = 195
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "start" && statetype != A
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(6)

[State -1, No Power - Simul]
type = varset
triggerall = !AIlevel && var(59)
trigger1 = var(59) = 1010 && power < 500
trigger1 = var(59) := 1000
trigger2 = var(59) = 1110 && power < 500
trigger2 = var(59) := 1100
trigger3 = var(59) = 1210 && power < 500
trigger3 = var(59) := 1200
trigger4 = var(59) = 1260 && power < 500
trigger4 = var(59) := 1250
trigger5 = var(59) = 1310 && power < 500
trigger5 = var(59) := 1300
trigger6 = var(59) = 1520 && power < 500
trigger6 = var(59) := 1200
trigger7 = var(59) = 3000 && power < 1000
trigger7 = var(59) := 1000
trigger8 = var(59) = 3020 && power < 1000
trigger8 = 1 || var(59) := 0
trigger9 = var(59) = 3040 && power < 3000
trigger9 = 1 || var(59) := 0
trigger10 = var(59) = 3100 && power < 1000
trigger10 = var(59) := 1300
trigger11 = var(59) = 3120 && power < 3000
trigger11 = var(59) := 1300
trigger12 = var(59) = 3160 && power < 2000
trigger12 = var(59) := 1500
trigger13 = var(59) = 3180 && power < 1000
trigger13 = var(59) := 1500
trigger14 = var(59) = 3200 && power < 1000
trigger14 = var(59) := 1200
trigger15 = var(59) = 3300 && power < 2000
trigger15 = 1 || var(59) := 0
trigger16 = var(59) = 4000 && power < 3000
trigger16 = 1 || var(59) := 0
var(59) = var(59)
ignorehitpause = 1

[State -1, Punch Strength]
type = varset
triggerall = !AIlevel && var(59)
triggerall = var(59) = 1000 || var(59) = 1020 || var(59) = 1100
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
triggerall = var(59) = 1200 || var(59) = 1250 || var(59) = 1270 || var(59) = 1300 || var(59) = 1500
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
;=================================< A.I. >==================================
;===========================================================================

[State -1, Jump]
type = changestate
value = 40
trigger1 = AIlevel && numenemy
trigger1 = roundstate = 2 && statetype != A && ctrl
trigger1 = enemynear, movetype = A && fvar(16) < 160 && enemynear, hitdefattr = SC, AT

[State -1, roll / dodge]
type = changestate
value = ifelse(random < 600, 720, 710)
trigger1 = AIlevel && numenemy
trigger1 = roundstate = 2 && statetype != A && ctrl && random < (50 * (AIlevel ** 2 / 64.0))
trigger1 = enemynear, movetype = A && fvar(16) < 80

[State -1, ashurasenkuu]
type = changestate
value = 1400
triggerall = AIlevel && numenemy
triggerall = var(1) != 1 && statetype != A && roundstate = 2 && ctrl
triggerall = p2stateno != [1115310, 1115319]
trigger1 = enemynear, movetype = A && fvar(16) < 90 && (facing != enemynear, facing) && random < (500 * (AIlevel ** 2 / 64.0))
trigger2 = enemy, numproj > 0 && random < (250 * (AIlevel ** 2 / 64.0))
trigger3 = fvar(16) < 60 && enemy, hitdefattr = SC, AT && random < (750 * (AIlevel ** 2 / 64.0))
trigger3 = random < (50 * (AIlevel ** 2 / 64.0))
trigger3 = var(10) := ifelse((random < (500 * (AIlevel ** 2 / 64.0)) || backedgedist < 100), 3, -3)

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

[State -1, run]
type = changestate
value = 102
trigger1 = AIlevel && numenemy
trigger1 = var(1) != 1
trigger1 = statetype = S && roundstate = 2 && ctrl && random < (200 * (AIlevel ** 2 / 64.0))
trigger1 = (stateno != [100, 105]) && enemynear, movetype != A && fvar(16) > 120

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
trigger1 = roundstate = 2 && power >= 1000 && !var(20) && life < 500 && random < (10 * (AIlevel ** 2 / 64.0))

[State -1, powercharge]
type = changestate
value = 740
trigger1 = AIlevel && numenemy
trigger1 = roundstate = 2 && statetype != A && ctrl
trigger1 = power < const(data.power) && power < powermax && !var(20)
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
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = roundstate = 2 && statetype != A
trigger1 = p2dist x > 160 && (enemynear, vel y > 0) && ctrl && random < (100 * (AIlevel ** 2 / 64.0))
trigger1 = !(enemynear, ctrl) && (enemynear, movetype = H)

[State -1, SLP]
type = changestate
value = 200
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = statetype != A && roundstate = 2
triggerall = p2stateno != [1115310, 1115319]
triggerall = (fvar(16) = [0, 46]) && (p2bodydist y = [-50, 50]) && p2statetype != L && !(enemynear, hitfall)
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = (ctrl || (stateno = [100, 101])) && random < (100 * (AIlevel ** 2 / 64.0))

[State -1, SMP2]
type = changestate
value = 215
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = statetype != A && roundstate = 2
triggerall = p2stateno != [1115310, 1115319]
triggerall = (fvar(16) = [0, 53]) && (p2bodydist y = [-50, 50]) && p2statetype = S && !(enemynear, hitfall)
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = (ctrl || (stateno = [100, 101])) && p2statetype = C && random < (150 * (AIlevel ** 2 / 64.0))

[State -1, SMP]
type = changestate
value = 210
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = statetype != A && roundstate = 2
triggerall = p2stateno != [1115310, 1115319]
triggerall = (fvar(16) = [0, 53]) && (p2bodydist y = [-50, 50]) && p2statetype = S && !(enemynear, hitfall)
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = (ctrl || (stateno = [100, 101])) && random < (75 * (AIlevel ** 2 / 64.0))

[State -1, SHP3]
type = changestate
value = 226
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = var(1) != 1 && statetype != A && roundstate = 2
triggerall = p2stateno != [1115310, 1115319]
triggerall = (fvar(16) = [0, 60]) && (p2bodydist y = [-50, 50]) && (p2statetype = S || p2statetype = C)
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = (ctrl || (stateno = [100, 101])) && random < (33 * (AIlevel ** 2 / 64.0))

[State -1, SHP2]
type = changestate
value = 225
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = var(1) != 2 && statetype != A && roundstate = 2
triggerall = p2stateno != [1115310, 1115319]
triggerall = (fvar(16) = [0, 50]) && (p2bodydist y = [-50, 50]) && p2statetype != L && !(enemynear, hitfall)
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = (ctrl || (stateno = [100, 101])) && random < (25 * (AIlevel ** 2 / 64.0))

[State -1, SHP]
type = changestate
value = 220
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = statetype != A && roundstate = 2
triggerall = p2stateno != [1115310, 1115319]
triggerall = (fvar(16) = [0, 46]) && (p2bodydist y = [-50, 50]) && p2statetype != L && !(enemynear, hitfall)
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = (ctrl || (stateno = [100, 101])) && random < (100 * (AIlevel ** 2 / 64.0))
trigger2 = stateno = 1500 && !animtime
trigger2 = (fvar(16) = [0, 20]) && var(10) = 3

[State -1, SLK]
type = changestate
value = 230
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = statetype != A && roundstate = 2
triggerall = p2stateno != [1115310, 1115319]
triggerall = (fvar(16) = [0, 59]) && (p2bodydist y = [-50, 50]) && p2statetype != L && p2statetype != A && !(enemynear, hitfall) && !(enemynear, hitfall)
trigger1 = (ctrl || (stateno = [100, 101])) && random < (50 * (AIlevel ** 2 / 64.0))

[State -1, SMK2]
type = changestate
value = 245
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = statetype != A && roundstate = 2
triggerall = p2stateno != [1115310, 1115319]
triggerall = (fvar(16) = [0, 50]) && (p2bodydist y = [-50, 50]) && p2statetype != L && p2statetype != C && !(enemynear, hitfall)
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = (ctrl || (stateno = [100, 101])) && random < (33 * (AIlevel ** 2 / 64.0))

[State -1, SMK]
type = changestate
value = 240
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = statetype != A && roundstate = 2
triggerall = p2stateno != [1115310, 1115319]
triggerall = (fvar(16) = [0, 20]) && (p2bodydist y = [-50, 50]) && p2statetype != L && p2statetype != C && !(enemynear, hitfall)
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = (ctrl || (stateno = [100, 101])) && random < (75 * (AIlevel ** 2 / 64.0))

[State -1, SHK]
type = changestate
value = 250
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = statetype != A && roundstate = 2
triggerall = p2stateno != [1115310, 1115319]
triggerall = (fvar(16) = [0, 59]) && (p2bodydist y = [-50, 50]) && p2statetype != L && p2statetype != C && !(enemynear, hitfall)
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = (ctrl || (stateno = [100, 101])) && random < (100 * (AIlevel ** 2 / 64.0))

[State -1, CLP]
type = changestate
value = 400
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = statetype != A && roundstate = 2
triggerall = p2stateno != [1115310, 1115319]
triggerall = (fvar(16) = [0, 40]) && (p2bodydist y = [-50, 50]) && p2statetype != L && p2statetype != A && !(enemynear, hitfall)
trigger1 = (ctrl || (stateno = [100, 101])) && random < (50 * (AIlevel ** 2 / 64.0))

[State -1, CMP]
type = changestate
value = 410
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = statetype != A && roundstate = 2
triggerall = (fvar(16) = [0, 45]) && (p2bodydist y = [-50, 50]) && p2statetype != L && p2statetype != A && !(enemynear, hitfall)
trigger1 = (ctrl || (stateno = [100, 101])) && random < (75 * (AIlevel ** 2 / 64.0))

[State -1, CHP]
type = changestate
value = 420
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = statetype != A && roundstate = 2
triggerall = (fvar(16) = [0, 33]) && (p2bodydist y = [-50, 50]) && p2statetype != L && !(enemynear, hitfall)
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = (ctrl || (stateno = [100, 101])) && random < (100 * (AIlevel ** 2 / 64.0))

[State -1, CLK]
type = changestate
value = 430
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = statetype != A && roundstate = 2
triggerall = (fvar(16) = [0, 54]) && (p2bodydist y = [-50, 50]) && p2statetype != L && p2statetype = S && !(enemynear, hitfall)
trigger1 = (ctrl || (stateno = [100, 101])) && random < (50 * (AIlevel ** 2 / 64.0))

[State -1, CMK]
type = changestate
value = 440
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = statetype != A && roundstate = 2
triggerall = (fvar(16) = [0, 62]) && (p2bodydist y = [-50, 50]) && p2statetype != L && p2statetype = S && !(enemynear, hitfall)
trigger1 = (ctrl || (stateno = [100, 101])) && random < (75 * (AIlevel ** 2 / 64.0))

[State -1, CHK]
type = changestate
value = 450
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = statetype != A && roundstate = 2
triggerall = (fvar(16) = [0, 56]) && (p2bodydist y = [-50, 50]) && p2statetype != L && p2statetype = S && !(enemynear, hitfall)
trigger1 = (ctrl || (stateno = [100, 101])) && random < (100 * (AIlevel ** 2 / 64.0))

[State -1, ALP]
type = changestate
value = 600
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = statetype = A && roundstate = 2
triggerall = vel y > 0 || p2statetype = A
triggerall = (fvar(16) = [0, 84]) && (p2bodydist y = [-50, 50]) && p2statetype != L && !(enemynear, hitfall)
trigger1 = ctrl && random < (50 * (AIlevel ** 2 / 64.0))

[State -1, AMP]
type = changestate
value = 610
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = statetype = A && roundstate = 2
triggerall = vel y > 0 || p2statetype = A
triggerall = (fvar(16) = [0, 78]) && (p2bodydist y = [-50, 50]) && p2statetype != L && !(enemynear, hitfall)
trigger1 = ctrl && random < (ifelse((vel x > 0 && p2statetype = A), 250, 75) * (AIlevel ** 2 / 64.0))

[State -1, AHP]
type = changestate
value = 620
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = statetype = A && roundstate = 2
triggerall = vel y > 0 || p2statetype = A
triggerall = (fvar(16) = [0, 110]) && (p2bodydist y = [-50, 50]) && p2statetype != L && !(enemynear, hitfall)
trigger1 = ctrl && random < (100 * (AIlevel ** 2 / 64.0))

[State -1, ALK]
type = changestate
value = 630
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = statetype = A && roundstate = 2
triggerall = vel y > 0 || p2statetype = A
triggerall = (fvar(16) = [0, 70]) && (p2bodydist y = [-50, 50]) && p2statetype != L && !(enemynear, hitfall)
trigger1 = ctrl && random < (50 * (AIlevel ** 2 / 64.0))

[State -1, TKK]
type = changestate
value = 645
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = var(1) != 1 && statetype = A && roundstate = 2
triggerall = vel x > 0 && vel y >= 0 && pos y <= -70
triggerall = (fvar(16) > 0) && (p2bodydist y > 0)
trigger1 = ctrl && random < (50 * (AIlevel ** 2 / 64.0))

[State -1, AMK]
type = changestate
value = 640
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = statetype = A && roundstate = 2
triggerall = vel y > 0 || p2statetype = A
triggerall = (fvar(16) = [-50, 130]) && (p2bodydist y = [-50, 50]) && p2statetype != L && !(enemynear, hitfall)
trigger1 = ctrl && random < (75 * (AIlevel ** 2 / 64.0))

[State -1, AHK]
type = changestate
value = 650
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = statetype = A && roundstate = 2
triggerall = vel y > 0 || p2statetype = A
triggerall = (fvar(16) = [0, 130]) && (p2bodydist y = [-50, 50]) && p2statetype != L && !(enemynear, hitfall)
trigger1 = ctrl && random < (100 * (AIlevel ** 2 / 64.0))

[State -1, throw]
type = changestate
value = 800
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = roundstate = 2 && statetype = S && stateno != 100 && ctrl
triggerall = p2statetype != A && p2statetype != L && p2movetype != H
trigger1 = (fvar(16) = [0, 20]) && (p2bodydist y = [-25, 25]) && random < (250 * (AIlevel ** 2 / 64.0))
trigger2 = (p2stateno != [120, 155]) && (fvar(16) = [0, 26]) && (p2bodydist y = [-25, 25]) && random < (500 * (AIlevel ** 2 / 64.0))

[State -1, shoryuuken]
type = changestate
value = ifelse((var(1) != 3 && power >= 500 && random < 133), 1110, 1100)
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = roundstate = 2 && statetype != A
triggerall = (p2stateno != [120, 155]) && p2statetype != L
triggerall = (fvar(16) > 0) && (enemynear, vel y > -1) && (enemynear, vel x > -2)
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
triggerall = var(1) != 1 || !(enemynear, hitfall) || numtarget(1310) || numtarget(3120) || numtarget(3180)
trigger1 = (ctrl || (stateno = [100, 101])) && fvar(16) < 50 && random < (200 * (AIlevel ** 2 / 64.0))
trigger2 = var(6) && fvar(16) < 30 && random < (200 * (AIlevel ** 2 / 64.0))
trigger3 = (ctrl || (stateno = [100, 101])) && fvar(16) < 100 && p2dist y < -120 && random < (250 * (AIlevel ** 2 / 64.0))
trigger4 = ctrl && var(1) != 1 && prevstateno = 1209 && random < (200 * (AIlevel ** 2 / 64.0))
trigger5 = ctrl && (prevstateno = [1000, 1099])
trigger5 = p2statetype = A && enemynear, vel y > 0
trigger5 = random < (333 * (AIlevel ** 2 / 64.0))

[State -1, ryusokyaku]
type = changestate
value = 1500
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = var(1) = 2 && roundstate = 2 && statetype != A
triggerall = (p2stateno != [120, 155]) && p2statetype != L && !(enemynear, hitfall)
triggerall = (fvar(16) = [0, 90]) && (p2bodydist y = [-180, 60])
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = (stateno = [200, 499]) && stateno != 200 && stateno != 230 && stateno != 400 && stateno != 430
trigger1 = var(6) && movehit && random < (200 * (AIlevel ** 2 / 64.0))

[State -1, joudansokutougeri]
type = changestate
value = ifelse((var(1) != 3 && power >= 500 && random < 100), 1310, 1300)
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = var(1) != 2 && roundstate = 2 && statetype != A
triggerall = (p2stateno != [120, 155]) && p2statetype != L && !(enemynear, hitfall)
triggerall = (fvar(16) = [0, 90]) && (p2bodydist y = [-180, 60])
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = ctrl && random < (50 * (AIlevel ** 2 / 64.0))
trigger2 = var(6) && random < (200 * (AIlevel ** 2 / 64.0))

[State -1, Classic Air Tatsumaki]
type = changestate
value = 1270
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = var(1) = 3
triggerall = vel y > 0 || p2statetype = A
triggerall = roundstate = 2 && statetype = A && (var(3) != [1, 2])
trigger1 = ctrl && fvar(16) < 160 && p2dist y <= -120 && random < (25 * (AIlevel ** 2 / 64.0))
trigger2 = var(6) && random < (50 * (AIlevel ** 2 / 64.0))

[State -1, kuchuutatsumakisenpuukyaku]
type = changestate
value = ifelse((power >= 500 && random < 100), 1260, 1250)
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = var(1) != 3
triggerall = vel y > 0 || p2statetype = A
triggerall = roundstate = 2 && statetype = A && (var(3) != [1, 2])
trigger1 = ctrl && fvar(16) < 160 && p2dist y >= -120 && random < (25 * (AIlevel ** 2 / 64.0))
trigger2 = var(6) && random < (50 * (AIlevel ** 2 / 64.0))

[State -1, tatsumakisenpuukyaku]
type = changestate
value = 1200
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = roundstate = 2 && statetype != A
triggerall = (p2stateno != [120, 155]) && p2statetype != L
triggerall = (fvar(16) = [0, 60]) && (enemynear, vel y > -1) && (enemynear, vel x > -2)
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
triggerall = var(1) != 1 || !(enemynear, hitfall) || numtarget(1310) || numtarget(3120) || numtarget(3180)
trigger1 = var(6) && random < (200 * (AIlevel ** 2 / 64.0))

[State -1, tatsumakisenpuukyaku]
type = changestate
value = 1210
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = roundstate = 2 && statetype != A
triggerall = var(1) = 1 && power >= 500
triggerall = (p2stateno != [120, 155]) && p2statetype != L
triggerall = (p2dist x = [-60, 60]) && p2dist y >= -80 && (enemynear, vel y > -1) && (enemynear, vel x > -2) && !(enemynear, hitfall)
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = ctrl && random < (50 * (AIlevel ** 2 / 64.0))
trigger2 = var(6) && random < (200 * (AIlevel ** 2 / 64.0))
trigger3 = ctrl && var(1) != 1 && prevstateno = 1100 && random < (150 * (AIlevel ** 2 / 64.0))

[State -1, shakunetsuhadouken]
type = changestate
value = 1020
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = var(1) != 1 && roundstate = 2 && statetype != A
triggerall = (p2stateno != [120, 155]) && p2statetype != L
triggerall = (enemynear, vel y > -1)
triggerall = !var(39)
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = ctrl && p2dist x < 160 && random < (100 * (AIlevel ** 2 / 64.0))
trigger2 = (stateno = 220 || stateno = 400 || stateno = 420) && var(6) && random < (125 * (AIlevel ** 2 / 64.0))
trigger3 = (stateno = [200, 499]) && var(6) && random < (125 * (AIlevel ** 2 / 64.0))

[State -1, hadouken]
type = changestate
value = ifelse((var(1) != 3 && power >= 500 && random < 100), 1010, 1000)
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = roundstate = 2 && statetype != A
triggerall = (p2stateno != [120, 155]) && p2statetype != L
triggerall = (enemynear, vel y > -1)
triggerall = !var(39)
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = ctrl && p2dist x > 160 && random < (150 * (AIlevel ** 2 / 64.0))
trigger2 = var(6) && random < (200 * (AIlevel ** 2 / 64.0))

[State -1, shinshoryuken]
type = changestate
value = 3120
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = var(1) != 2 && roundstate = 2 && statetype != A && power >= 3000 && var(20) <= 60
triggerall = !(enemynear, ctrl) && (p2stateno != [120, 155]) && p2statetype != L
triggerall = (fvar(16) = [0, 30]) && p2dist y > -80 && (enemynear, vel y > -2) && (enemynear, vel x > -2)
triggerall = movetype = A || !(enemynear, hitfall)
trigger1 = (ctrl || (stateno = [100, 101])) && random < (250 * (AIlevel ** 2 / 64.0))
trigger2 = ((stateno = [210, 214]) || (stateno = 420)) && (fvar(16) = [0, 10]) && var(7) && random < (250 * (AIlevel ** 2 / 64.0))
trigger3 = stateno = 1100 && (fvar(16) = [0, 20]) && var(7) && random < (200 * (AIlevel ** 2 / 64.0))

[State -1, shungokusatsu]
type = changestate
value = 4000
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = var(1) != 1 && roundstate = 2 && statetype != A && power >= 3000 && var(20) <= 60
triggerall = !(enemynear, ctrl) && (enemynear, movetype != A) && (enemynear, statetype != L) && (p2stateno != [5030, 5119])
triggerall = (p2dist x = [0, 160]) && (p2stateno != 40)
triggerall = ifelse((enemynear, vel y > 0), (enemynear, vel x < 0), (enemynear, vel y >= 0))
trigger1 = ctrl && (fvar(16) = [0, 90]) && (p2dist y = [-5, 5]) && random < (150 * (AIlevel ** 2 / 64.0))
trigger2 = ctrl && (p2stateno = [120, 155]) && p2statetype != A && random < (250 * (AIlevel ** 2 / 64.0))
trigger3 = ctrl && (fvar(16) = [0, 90]) && (p2dist y = [-5, 5]) && random < (150 * (AIlevel ** 2 / 64.0))

[State -1, jinraishou]
type = changestate
value = 3180
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = var(1) = 3 && roundstate = 2 && statetype != A && power >= 1000 && var(20) <= 60
triggerall = !(enemynear, ctrl) && (p2stateno != [120, 155]) && p2statetype != L && (p2statetype = S || p2statetype = C)
triggerall = (fvar(16) = [0, 70]) && p2dist y > -120 && (enemynear, vel y > -2) && (enemynear, vel x > -2)
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = (ctrl || (stateno = [100, 101])) && random < (100 * (AIlevel ** 2 / 64.0))
trigger2 = var(7) && random < (200 * (AIlevel ** 2 / 64.0))
trigger3 = stateno = 3140 && anim = 3140 && animelemtime(26) >= 0 && var(8) && random < (200 * (AIlevel ** 2 / 64.0))

[State -1, metsushoryuken]
type = changestate
value = 3160
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = var(1) != 1 && roundstate = 2 && statetype != A && power >= 2000 && !var(20)
triggerall = !(enemynear, ctrl) && (p2stateno != [120, 155]) && p2statetype != L
triggerall = (fvar(16) = [0, 80]) && (p2dist y = [-100, 0]) && (enemynear, vel y = [-7, 1]) && (enemynear, vel x > -4)
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = (ctrl || (stateno = [100, 101])) && random < (50 * (AIlevel ** 2 / 64.0))
trigger2 = var(6) && random < (50 * (AIlevel ** 2 / 64.0))
trigger3 = stateno = 1300 && var(7) && random < (75 * (AIlevel ** 2 / 64.0))
trigger4 = stateno = 3140 && var(8) && anim = 3140 && animelemtime(26) >= 0 && random < (100 * (AIlevel ** 2 / 64.0))
trigger5 = (stateno = [1000, 4999]) && var(18) && stateno != 3000 && stateno != 3020
trigger5 = random < (50 * (AIlevel ** 2 / 64.0))

[State -1, metsuhadouken]
type = changestate
value = 3040
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = var(1) != 1 && roundstate = 2 && statetype != A && power >= 3000 && var(20) <= 60 && !inguarddist
triggerall = !var(39)
triggerall = !(enemynear, ctrl) && (enemynear, movetype != A)
triggerall = p2dist x >= 160 && p2dist y > -120 && (enemynear, vel y > -2)
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = ctrl && random < (20 * (AIlevel ** 2 / 64.0))
trigger2 = ctrl && p2dist x >= 240 && random < (30 * (AIlevel ** 2 / 64.0))

[State -1, messatsugoushoryuu]
type = changestate
value = 3140
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = var(1) = 2 && roundstate = 2 && statetype != A && power >= 1000 && var(20) <= 60
triggerall = !(enemynear, ctrl) && (p2stateno != [120, 155]) && p2statetype != L
triggerall = (fvar(16) = [0, 60]) && (enemynear, vel y > -1) && (enemynear, vel x > -2)
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = (ctrl || (stateno = [100, 101])) && random < (50 * (AIlevel ** 2 / 64.0))
trigger2 = ((stateno = [200, 499])) && var(7) && random < (50 * (AIlevel ** 2 / 64.0))
trigger3 = ((stateno = [1100, 1110]) || (stateno = [1300, 1310])) && var(7) && random < (75 * (AIlevel ** 2 / 64.0))
trigger4 = stateno = 3100 && var(8) && anim = 3101 && animelemtime(6) >= 0 && random < (100 * (AIlevel ** 2 / 64.0))
trigger5 = stateno = 3180 && var(8) && anim = 3180 && animelemtime(34) >= 0 && random < (75 * (AIlevel ** 2 / 64.0))
trigger6 = (stateno = [1000, 4999]) && var(18) && stateno != 3020
trigger6 = random < (50 * (AIlevel ** 2 / 64.0))

[State -1, nidanshoryuutsuki]
type = changestate
value = 3100
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = var(1) = 1 && roundstate = 2 && statetype != A && power >= 1000 && var(20) <= 60
triggerall = !(enemynear, ctrl) && (p2stateno != [120, 155]) && p2statetype != L && p2statetype != A && p2statetype != L
triggerall = (fvar(16) = [0, 80]) && (p2dist y = [-100, 0]) && (enemynear, vel y = [-7, 1]) && (enemynear, vel x > -4)
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = (ctrl || (stateno = [100, 101])) && random < (ifelse((enemynear, hitfall), 200, 50) * (AIlevel ** 2 / 64.0))
trigger2 = (stateno = 220 || stateno = 250 || stateno = 420) && var(7) && random < (50 * (AIlevel ** 2 / 64.0))
trigger3 = stateno = 1300 && var(7) && random < (75 * (AIlevel ** 2 / 64.0))
trigger4 = stateno = 3140 && var(8) && anim = 3140 && animelemtime(26) >= 0 && random < (100 * (AIlevel ** 2 / 64.0))
trigger5 = stateno = 3180 && var(8) && anim = 3180 && animelemtime(34) >= 0 && random < (75 * (AIlevel ** 2 / 64.0))
trigger6 = (stateno = [1000, 4999]) && var(18) && stateno != 3000 && stateno != 3020
trigger6 = random < (50 * (AIlevel ** 2 / 64.0))

[State -1, shinkuutatsumakisenpuukyaku]
type = changestate
value = 3200
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = roundstate = 2 && statetype != A && power >= 1000 && var(20) <= 60
triggerall = !(enemynear, ctrl) && (p2stateno != [120, 155]) && p2statetype != L
triggerall = (fvar(16) = [-50, 50]) && p2dist y >= -90 && (enemynear, vel y > -1) && abs(enemynear, vel x) < 2
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = (ctrl || (stateno = [100, 101])) && random < (50 * (AIlevel ** 2 / 64.0))
trigger2 = (stateno = 220 || stateno = 250 || stateno = 420) && var(7) && random < (25 * (AIlevel ** 2 / 64.0))
trigger3 = ((stateno = [1100, 1110]) || stateno = 1310) && var(7) && random < (25 * (AIlevel ** 2 / 64.0))
trigger4 = stateno = 3100 && var(8) && anim = 3101 && animelemtime(6) >= 0 && random < (100 * (AIlevel ** 2 / 64.0))
trigger5 = stateno = 3140 && var(8) && anim = 3140 && animelemtime(26) >= 0 && random < (100 * (AIlevel ** 2 / 64.0))
trigger6 = stateno = 3180 && var(8) && anim = 3180 && animelemtime(34) >= 0 && random < (75 * (AIlevel ** 2 / 64.0))
trigger7 = stateno = 3000 && numhelper(3005)
trigger7 = helper(3005), var(18) && random < (50 * (AIlevel ** 2 / 64.0))

[State -1, denjinhadouken]
type = changestate
value = 3020
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = var(1) != 2 && roundstate = 2 && statetype != A && power >= 1000 && var(20) <= 60 && !inguarddist
triggerall = !var(39) || stateno = 1000 || stateno = 1010 || stateno = 1020 || stateno = 3000
triggerall = !(enemynear, ctrl) && (enemynear, movetype != A)
triggerall = fvar(16) < 80 && p2dist y > -80
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = random < (100 * (AIlevel ** 2 / 64.0))
trigger1 = (stateno = 1100 || stateno = 1300) && var(7) && movehit

[State -1, shinkuuhadouken]
type = changestate
value = 3000
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = roundstate = 2 && statetype != A && power >= 1000 && var(20) <= 60
triggerall = !var(39) || stateno = 1000 || stateno = 1010 || stateno = 1020 || stateno = 3020
triggerall = !(enemynear, ctrl) && ((p2stateno != [120, 155]) || p2statetype = A)
triggerall = (fvar(16) = [0, 100]) && p2statetype != L
triggerall = (p2dist y = [-100, 0]) && (enemynear, vel y = [-7, 1]) && (enemynear, vel x > -2)
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = ctrl && (fvar(16) = [15, 125]) && random < (50 * (AIlevel ** 2 / 64.0))
trigger2 = (stateno = 220 || stateno = 250 || stateno = 420) && var(7) && random < (50 * (AIlevel ** 2 / 64.0))
trigger3 = (stateno = 1110 || (stateno = [1300, 1310])) && var(7) && random < (50 * (AIlevel ** 2 / 64.0))
trigger4 = stateno = 3100 && var(8) && anim = 3101 && animelemtime(6) >= 0 && random < (100 * (AIlevel ** 2 / 64.0)) && !var(33)
trigger5 = stateno = 3140 && var(8) && anim = 3140 && animelemtime(26) >= 0 && random < (100 * (AIlevel ** 2 / 64.0))
trigger6 = stateno = 3180 && var(8) && anim = 3180 && animelemtime(34) >= 0 && random < (75 * (AIlevel ** 2 / 64.0))
trigger7 = (stateno = [1000, 4999]) && var(18) && stateno != 3000 && stateno != 3020
trigger7 = random < (50 * (AIlevel ** 2 / 64.0))
trigger8 = stateno = 52 && !animtime && (prevstateno = [1000, 2999]) && numtarget && random < (250 * (AIlevel ** 2 / 64.0))
