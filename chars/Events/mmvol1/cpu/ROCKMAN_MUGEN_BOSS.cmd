;-| AI |--------------------------------------------------------
[Command]
Name = "AI_00"
Command = F, B, D, U, a, a
Time = 0　　　　　　　　

[Command]
Name = "AI_01"
Command = F, B, D, U, a, b
Time = 0

[Command]
Name = "AI_02"
Command = F, B, D, U, a, x
Time = 0　　　　　　　　

[Command]
Name = "AI_03"
Command = F, B, D, U, a, y
Time = 0

[Command]
Name = "AI_04"
Command = F, B, D, U, a, D
Time = 0　　　　　　　　

[Command]
Name = "AI_05"
Command = F, B, D, U, a, U
Time = 0

[Command]
Name = "AI_06"
Command = F, B, D, U, a, F
Time = 0　　　　　　　　

[Command]
Name = "AI_07"
Command = F, B, D, U, a, B
Time = 0

[Command]
Name = "AI_08"
Command = F, B, D, U, b, a
Time = 0　　　　　　　　

[Command]
Name = "AI_09"
Command = F, B, D, U, b, b
Time = 0

[Command]
Name = "AI_10"
Command = F, B, D, U, a, x
Time = 0　　　　　　　　

[Command]
Name = "AI_11"
Command = F, B, D, U, a, y
Time = 0

[Command]
Name = "AI_12"
Command = F, B, D, U, a, D
Time = 0　　　　　　　　

[Command]
Name = "AI_13"
Command = F, B, D, U, a, U
Time = 0

[Command]
Name = "AI_14"
Command = F, B, D, U, a, F
Time = 0　　　　　　　　

[Command]
Name = "AI_15"
Command = F, B, D, U, a, B
Time = 0

[Command]
Name = "AI_16"
Command = F, B, D, U, a, a
Time = 0　　　　　　　　

[Command]
Name = "AI_17"
Command = F, B, D, U, a, b
Time = 0

[Command]
Name = "AI_18"
Command = F, B, D, U, b, a
Time = 0　　　　　　　　

[Command]
Name = "AI_19"
Command = F, B, D, U, b, x
Time = 0

[Command]
Name = "AI_20"
Command = F, B, D, U, b, y
Time = 0

[Command]
Name = "AI_21"
Command = F, B, D, U, b, D
Time = 0

[Command]
Name = "AI_22"
Command = F, B, D, U, b, U
Time = 0　　　　　　　　

[Command]
Name = "AI_23"
Command = F, B, D, U, b, F
Time = 0

[Command]
Name = "AI_24"
Command = F, B, D, U, b, D
Time = 0　　　　　　　　

[Command]
Name = "AI_25"
Command = F, B, D, U, b, B
Time = 0

[Command]
Name = "AI_26"
Command = F, B, D, U, b, F
Time = 0　　　　　　　　

[Command]
Name = "AI_27"
Command = F, B, D, U, b, B
Time = 0

[Command]
Name = "AI_28"
Command = F, B, D, U, x, a
Time = 0　　　　　　　　

[Command]
Name = "AI_29"
Command = F, B, D, U, x, b
Time = 0

[Command]
Name = "AI_30"
Command = F, B, D, U, x, x
Time = 0

;-| Default Values |-------------------------------------------------------
[Defaults]
; Default value for the "time" parameter of a Command. Minimum 1.
command.time = 15

; Default value for the "buffer.time" parameter of a Command. Minimum 1,
; maximum 30.
command.buffer.time = 1


;-| Double Tap |-----------------------------------------------------------
[Command]
name = "FF"     ;Required (do not remove)
command = F, F
time = 10

[Command]
name = "BB"     ;Required (do not remove)
command = B, B
time = 10

;-| 2/3 Button Combination |-----------------------------------------------
[Command]
name = "recovery";Required (do not remove)
command = x+y
time = 1

;-| Dir + Button |---------------------------------------------------------
[Command]
name = "down_a"
command = /$D,a
time = 1

[Command]
name = "down_b"
command = /$D,b
time = 1

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

;-| Hold Dir |--------------------------------------------------------------
[Command]
name = "holdfwd";Required (do not remove)
command = /$F
time = 1

[Command]
name = "holdback";Required (do not remove)
command = /$B
time = 1

[Command]
name = "holdup" ;Required (do not remove)
command = /$U
time = 1

[Command]
name = "holddown";Required (do not remove)
command = /$D
time = 1

[Command]
name = "holda";Required (do not remove)
command = /$a
time = 1

[Command]
name = "holdb";Required (do not remove)
command = /$b
time = 1

[Command]
name ="fwd"
command = F
time = 1

[Command]
name = "back"
command = B
time = 1

[Command]
name= "up"
command=U
time = 1

[Command]
name = "down"
command = D
time = 1

[Statedef -1]

;jump
[State -1]
type = ChangeState
value = 41
triggerall = statetype != A
triggerall = command = "a"
trigger1 = ctrl = 1


