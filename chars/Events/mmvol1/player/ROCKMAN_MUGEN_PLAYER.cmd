
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
name = "holdc";Required (do not remove)
command = /$c
time = 1

[Command]
name = "holdx";Required (do not remove)
command = /$x
time = 1

[Command]
name = "holdy";Required (do not remove)
command = /$y
time = 1

[Command]
name = "holdz";Required (do not remove)
command = /$z
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

;---------------------------------------------------------------------------

[State -1]
type = ChangeState
value = 1200
trigger1 = stateno != 1200
trigger1 = var(3) = 100
trigger1 = numhelper(1250)
trigger1 = helper(1250),stateno = 1252

[State -1]
type = ChangeState
value = 1202
triggerall = command = "a" || command = "b"
trigger1 = var(3) = 100
trigger1 = numhelper(1250)
trigger1 = stateno = 1200 || stateno = 1201 || stateno = 1211

[State -1]
type = ChangeState
value = 1211
triggerall = command = "x" || command = "y"
triggerall = numhelper(2200) < 3
triggerall = var(3) = 100
triggerall = numhelper(1250)
trigger1 = stateno = 1201
trigger2 = stateno = 1211
trigger2 = time >= 4

[State -1]
type = ChangeState
value = 1212
triggerall = command = "x" || command = "y"
triggerall = numhelper(2200) < 3
triggerall = var(3) = 100
trigger1 = stateno = [1202,1203]
trigger2 = stateno = 1212
trigger2 = time >= 4

;---------------------------------------------------------------------------

[State -1]
type = helper
triggerall = numhelper(9101) = 0
triggerall = numhelper(15000) = 0
triggerall = command = "start"
triggerall = stateno != [250,295]
triggerall = stateno != [400,401]
trigger1 = enemy,var(21) = 1 || enemy,var(21) = 3
trigger2 = enemy,var(22) = 1 || enemy,var(22) = 3
trigger3 = enemy,var(23) = 1 || enemy,var(23) = 3
trigger4 = enemy,var(24) = 1 || enemy,var(24) = 3
trigger5 = enemy,var(26) = 1 || enemy,var(26) = 3
trigger6 = enemy,var(27) = 1 || enemy,var(27) = 3
trigger7 = enemy,var(28) = 1 || enemy,var(28) = 3
trigger8 = enemy,var(29) = 1 || enemy,var(29) = 3
trigger9 = enemy,var(30) = [1,3]
trigger9 = enemy,stateno != 2055 && enemy,stateno != 2065 
trigger9 = enemy,stateno != [2990,2992]
trigger10 = enemy,var(30) = 5
trigger10 = enemy,stateno != [3100,3102]
trigger11 = enemy,var(30) = 7
trigger11 = enemy,stateno != [3300,3302]
trigger12 = enemy,var(30) = [9,11]
trigger12 = enemy,stateno != 3450 && enemy,stateno != 3500 
trigger12 = enemy,stateno != [3550,3552]
trigger13 = stateno = 9502
trigger14 = enemy,var(30) = [13,14]
trigger14 = enemy,stateno != 3650
trigger14 = enemy,stateno != [3700,3799]
stateno = 15000
id = 15000
persistent = 0
sprpriority = 200
helpertype = normal
pos = 0, 0
postype = left
keyctrl = 1
ignorehitpause = 1
supermovetime = 999999
pausemovetime = 999999

;---------------------------------------------------------------------------

[State -1]
type = ChangeState
value = 20
triggerall = statetype != A
triggerall = command = "holdfwd" || command = "holdback"
trigger1 = stateno = 1

;jump
[State -1]
type = ChangeState
value = 41
triggerall = command = "a" || command = "b"
trigger1 = stateno = 1 || stateno = 20 || stateno = 52
trigger2 = stateno = 210 || stateno = 212
trigger3 = stateno = 310 || stateno = 312
trigger4 = stateno = 410 || stateno = 412
trigger5 = stateno = 610 || stateno = 612
trigger6 = stateno = 710 || stateno = 712
trigger7 = stateno = 910 || stateno = 912
trigger8 = stateno = 1010 || stateno = 1012

[State -1]
type = ChangeState
value = 43
trigger1 = stateno != 43
trigger1 = var(3) = 90
trigger1 = numhelper(1100)
trigger1 = helper(1100),stateno = 1102