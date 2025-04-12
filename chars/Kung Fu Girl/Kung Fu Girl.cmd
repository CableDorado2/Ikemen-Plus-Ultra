;-| Button Remapping |-----------------------------------------------------
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
command.time = 15
command.buffer.time = 1

;-| Special Motions |------------------------------------------------------
[Command]
name = "KF Palm"
command = ~D, DF, F, x
time = 12

[Command]
name = "KF Palm"
command = ~D, DF, F, ~x
time = 12

[Command]
name = "KF Palm2"
command = ~D, DF, F, y
time = 12

[Command]
name = "KF Palm2"
command = ~D, DF, F, ~y
time = 12

[Command]
name = "KF Palm3"
command = ~D, DF, F, z
time = 12

[Command]
name = "KF Palm3"
command = ~D, DF, F, ~z
time = 12

[Command]
name = "EX KF Palm"
command = ~D, DF, F, x+y
time = 12

[Command]
name = "EX KF Palm"
command = ~D, DF, F, y+z
time = 12

[Command]
name = "EX KF Palm"
command = ~D, DF, F, x+z
time = 12

[Command]
name = "KF Knee"
command = ~F, D, DF, a
time = 15

[Command]
name = "KF Knee"
command = ~F, D, DF, ~a
time = 15

[Command]
name = "KF Knee2"
command = ~F, D, DF, b
time = 15

[Command]
name = "KF Knee2"
command = ~F, D, DF, ~b
time = 15

[Command]
name = "KF Knee3"
command = ~F, D, DF, c
time = 15

[Command]
name = "KF Knee3"
command = ~F, D, DF, ~c
time = 15

[Command]
name = "EX KF Knee"
command = ~F, D, DF, a+b
time = 15

[Command]
name = "EX KF Knee"
command = ~F, D, DF, b+c
time = 15

[Command]
name = "EX KF Knee"
command = ~F, D, DF, a+c
time = 15

[Command]
name = "KF Shuffle"
command = ~D, DB, B, a
time = 12

[Command]
name = "KF Shuffle"
command = ~D, DB, B, ~a
time = 12

[Command]
name = "KF Shuffle"
command = ~D, DB, B, b
time = 12

[Command]
name = "KF Shuffle"
command = ~D, DB, B, ~b
time = 12

[Command]
name = "KF Shuffle"
command = ~D, DB, B, c
time = 12

[Command]
name = "KF Shuffle"
command = ~D, DB, B, ~c
time = 12

[Command]
name = "EX KF Shuffle"
command = ~D, DB, B, a+b
time = 12

[Command]
name = "EX KF Shuffle"
command = ~D, DB, B, b+c
time = 12

[Command]
name = "EX KF Shuffle"
command = ~D, DB, B, a+c
time = 12

;-| Super Motions |--------------------------------------------------------
[Command]
name = "Triple KF Palm"
command = ~D, DF, F, D, DF, F, x
time = 20

[Command]
name = "Triple KF Palm"
command = ~D, DF, F, D, DF, F, y
time = 20

[Command]
name = "Triple KF Palm"
command = ~D, DF, F, D, DF, F, z
time = 20

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

;-| Dir + Button |---------------------------------------------------------
[Command]
name = "back_x"
command = /$B,x
time = 1

[Command]
name = "back_y"
command = /$B,y
time = 1

[Command]
name = "back_z"
command = /$B,z
time = 1

[Command]
name = "down_x"
command = /$D,x
time = 1

[Command]
name = "down_y"
command = /$D,y
time = 1

[Command]
name = "down_z"
command = /$D,z
time = 1

[Command]
name = "fwd_x"
command = /$F,x
time = 1

[Command]
name = "fwd_y"
command = /$F,y
time = 1

[Command]
name = "fwd_z"
command = /$F,z
time = 1

[Command]
name = "up_x"
command = /$U,x
time = 1

[Command]
name = "up_y"
command = /$U,y
time = 1

[Command]
name = "up_z"
command = /$U,z
time = 1

[Command]
name = "back_a"
command = /$B,a
time = 1

[Command]
name = "back_b"
command = /$B,b
time = 1

[Command]
name = "back_c"
command = /$B,c
time = 1

[Command]
name = "down_a"
command = /$D,a
time = 1

[Command]
name = "down_b"
command = /$D,b
time = 1

[Command]
name = "down_c"
command = /$D,c
time = 1

[Command]
name = "fwd_a"
command = /$F,a
time = 1

[Command]
name = "fwd_b"
command = /$F,b
time = 1

[Command]
name = "fwd_c"
command = /$F,c
time = 1

[Command]
name = "up_a"
command = /$U,a
time = 1

[Command]
name = "up_b"
command = /$U,b
time = 1

[Command]
name = "up_c"
command = /$U,c
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
name = "s"
command = s
time = 1

;-| Single Dir |------------------------------------------------------------
[Command]
name = "fwd" ;Required (do not remove)
command = $F
time = 1

[Command]
name = "downfwd"
command = $DF
time = 1

[Command]
name = "down" ;Required (do not remove)
command = $D
time = 1

[Command]
name = "downback"
command = $DB
time = 1

[Command]
name = "back" ;Required (do not remove)
command = $B
time = 1

[Command]
name = "upback"
command = $UB
time = 1

[Command]
name = "up" ;Required (do not remove)
command = $U
time = 1

[Command]
name = "upfwd"
command = $UF
time = 1

;-| Hold Button |--------------------------------------------------------------
[Command]
name = "hold_x"
command = /x
time = 1

[Command]
name = "hold_y"
command = /y
time = 1

[Command]
name = "hold_z"
command = /z
time = 1

[Command]
name = "hold_a"
command = /a
time = 1

[Command]
name = "hold_b"
command = /b
time = 1

[Command]
name = "hold_c"
command = /c
time = 1

[Command]
name = "hold_s"
command = /s
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
name = "holdfwd" ;Required (do not remove)
command = /$F
time = 1

[Command]
name = "holddownfwd"
command = /$DF
time = 1

[Command]
name = "holddown" ;Required (do not remove)
command = /$D
time = 1

[Command]
name = "holddownback"
command = /$DB
time = 1

[Command]
name = "holdback" ;Required (do not remove)
command = /$B
time = 1

[Command]
name = "holdupback"
command = /$UB
time = 1

[Command]
name = "holdup" ;Required (do not remove)
command = /$U
time = 1

[Command]
name = "holdupfwd"
command = /$UF
time = 1

;---------------------------------------------------------------------------
;Release Direction
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

;--------------------------------------------------------------------------
;Release Button
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

;---------------------------------------------------------------------------
;Other
[Command]
name = "highjump"
command = $D, $U
time = 15

;---------------------------------------------------------------------------
[Statedef -1]

[State -1, Tick Fix]
type = CtrlSet
triggerall = !ctrl
trigger1 = (StateNo = 52 || StateNo = 101 || StateNo = 5120) && !AnimTime
trigger2 = (StateNo = [200,499]) && !AnimTime
trigger3 = ((StateNo = [760,762]) || (StateNo = [700,715]) || (StateNo = [900,905])) && !AnimTime
trigger4 = StateNo = 810 && !AnimTime
trigger5 = (StateNo = 5001 || StateNo = 5011 || StateNo = 151 || StateNo = 153) && HitOver
value = 1

[State -1, EX KF Knee]
type = ChangeState
value = 1130
triggerall = !AIlevel
triggerall = command = "EX KF Knee"
triggerall = RoundState = 2 && StateType != A
triggerall = power >= 1000
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || Stateno = 101
trigger2 = var(5)

[State -1, EX KF Shuffle]
type = ChangeState
value = 1330
triggerall = !AIlevel
triggerall = command = "EX KF Shuffle"
triggerall = RoundState = 2 && StateType != A
triggerall = power >= 1000
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || Stateno = 101
trigger2 = var(5)

[State -1, EX KF Palm]
type = ChangeState
value = 1030
triggerall = !AIlevel
triggerall = command = "EX KF Palm"
triggerall = RoundState = 2 && StateType != A
triggerall = power >= 1000
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || Stateno = 101
trigger2 = var(5)
trigger3 = (Stateno=[1000,1020]) && Movehit

[State -1, Medium KF Knee]
type = ChangeState
value = 1110
triggerall = !AIlevel
triggerall = command = "KF Knee2"
triggerall = RoundState = 2 && StateType != A
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || Stateno = 101
trigger2 = var(5)

[State -1, Strong KF Knee]
type = ChangeState
value = 1120
triggerall = !AIlevel
triggerall = command = "KF Knee3"
triggerall = RoundState = 2 && StateType != A
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || Stateno = 101
trigger2 = var(5)

[State -1, Light KF Knee]
type = ChangeState
value = 1100
triggerall = !AIlevel
triggerall = command = "KF Knee"
triggerall = RoundState = 2 && StateType != A
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || Stateno = 101
trigger2 = var(5)

[State -1, KF Shuffle]
type = ChangeState
value = 1300
triggerall = !AIlevel
triggerall = command = "KF Shuffle"
triggerall = RoundState = 2 && StateType != A
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || Stateno = 101
trigger2 = var(5)

[State -1, Strong KF Palm]
type = ChangeState
value = 1020
triggerall = !AIlevel
triggerall = command = "KF Palm3"
triggerall = RoundState = 2 && StateType != A
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || Stateno = 101
trigger2 = var(5)

[State -1, Medium KF Palm]
type = ChangeState
value = 1010
triggerall = !AIlevel
triggerall = command = "KF Palm2"
triggerall = RoundState = 2 && StateType != A
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || Stateno = 101
trigger2 = var(5)

[State -1, Light KF Palm]
type = ChangeState
value = 1000
triggerall = !AIlevel
triggerall = command = "KF Palm"
triggerall = RoundState = 2 && StateType != A
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || Stateno = 101
trigger2 = var(5)

[State -1, Throw]
type = ChangeState
value = 800
triggerAll = !AILevel && P2BodyDist X <=20
triggerall = p2statetype != A && p2statetype != L && P2MoveType != H
trigger1 = (command = "b+y") && (command = "holdfwd" || command = "holdback")
trigger1 = RoundState = 2 && StateType = S
trigger1 = ctrl

[State -1, Just Guard]
type = Changestate
value = 700
triggerall = !AIlevel
triggerall = command = "a+x"
triggerall = statetype != A
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || Stateno = 101 || Stateno = 106 || Stateno = 700

[State -1, Heavy Smash]
type = Changestate
value = 500
triggerall = !AIlevel
triggerall = command = "c+z"
triggerall = statetype != A
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || Stateno = 101 || Stateno = 106

[State -1, Kung Fu Chop]
type = Changestate
value = 211
triggerall = !AIlevel
triggerall = command = "z" && command = "holdfwd"
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl || Stateno = 101

[State -1, Kung Fu Chop Comboed]
type = Changestate
value = 212
triggerall = !AIlevel
triggerall = command = "z" && command = "holdfwd"
triggerall = command != "holddown"
triggerall = StateType != A
trigger1 = (stateno=210||stateno=225||stateno=255) && var(5) && Movehit

[State -1, Run Fwd]
type = ChangeState
value = 100
triggerall = !AIlevel
trigger1 = command = "FF"
trigger1 = statetype = S
trigger1 = ctrl

[State -1, Run Back]
type = ChangeState
value = 105
triggerall = !AIlevel
trigger1 = command = "BB"
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
;Triple Kung Fu Palm (uses one super bar)
[State -1, Triple Kung Fu Palm]
type = ChangeState
value = 3000
triggerall = !ailevel
triggerall = command = "Triple KF Palm"
triggerall = power >= 1000
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = statetype != A
trigger2 = hitdefattr = SC, NA, SA, HA
trigger2 = stateno != [3000,3050)
trigger2 = movecontact
;trigger3 = stateno = 1310 || stateno = 1330 ;From blocking

;--------------------------------------------------------------------------
[State -1, Stand Light Punch]
type = ChangeState
value = 200
triggerall = !AIlevel
triggerall = command != "holddown" && command = "x"
triggerall = statetype != A
trigger1 = ctrl || Stateno = 101
trigger2 = (stateno=200||stateno=231) && var(5) && Movehit

[State -1, Stand Medium Punch]
type = ChangeState
value = 210 
triggerall = !AIlevel
triggerall = command != "holddown" && command = "y"
triggerall = StateType != A
trigger1 = ctrl || Stateno = 101
trigger2 = (stateno=200||stateno=211||stateno=231||stateno=251) && var(5) && Movehit

[State -1, Stand Strong Punch]
type = ChangeState
value = 220 + (Abs(P2BodyDist X) <= 15) * 1
triggerall = !AIlevel
triggerall = command = "z" && command != "holdfwd"
triggerall = command != "holddown"
triggerall = StateType != A
trigger1 = ctrl || Stateno = 101
trigger2 = (stateno=210||stateno=251) && var(5) && Movehit

[State -1, Stand Light Kick]
type = ChangeState
value = 230 + (Abs(P2BodyDist X) <= 15) * 1
triggerall = !AIlevel
triggerall = command != "holddown" && command = "a"
triggerall = statetype != A
trigger1 = ctrl || Stateno = 101
trigger2 = (stateno=200||stateno=230||stateno=231) && var(5) && Movehit

[State -1, Stand Medium Kick]
type = ChangeState
value = 240
triggerall = !AIlevel
triggerall = command != "holddown" && command = "b"
triggerall = statetype != A
trigger1 = ctrl || Stateno = 101
trigger2 = (stateno=221||stateno=231||stateno=251) && var(5) && Movehit

[State -1, Standing Strong Kick]
type = ChangeState
value = 250 + (Abs(P2BodyDist X) <= 15) * 1
triggerall = !AIlevel
triggerall = command != "holddown" && command = "c"
triggerall = StateType != A
trigger1 = ctrl || Stateno = 101
trigger2 = (stateno=210||stateno=211||stateno=220||stateno=221||stateno=251) && var(5) && Movehit

[State -1, Crouching Light Punch]
type = ChangeState
value = 400
triggerall = !AIlevel
triggerAll = command = "holddown" && command = "x"
triggerAll = StateType != A
trigger1 = ctrl || Stateno = 101
trigger2 = (stateno=400) && var(5) && Movehit

[State -1, Crouching Medium Punch]
type = ChangeState
value = 410
triggerall = !AIlevel
triggerAll = command = "holddown" && command = "y"
triggerAll = StateType != A
trigger1 = ctrl || Stateno = 101
trigger2 = (stateno=400) && var(5) && Movehit

[State -1, Crouching Strong Punch]
type = ChangeState
value = 420
triggerall = !AIlevel
triggerAll = command = "holddown" && command = "z"
triggerAll = StateType != A
trigger1 = ctrl || Stateno = 101
trigger2 = (stateno=410) && var(5) && Movehit

[State -1, Crouching Light Kick]
type = ChangeState
value = 430
triggerall = !AIlevel
triggerAll = command = "holddown" && command = "a"
triggerAll = StateType != A
trigger1 = ctrl || Stateno = 101
trigger2 = (stateno=400||stateno=430) && var(5) && Movehit

[State -1, Crouching Medium Kick]
type = ChangeState
value = 440
triggerall = !AIlevel
triggerAll = command = "holddown" && command = "b"
triggerAll = StateType != A
trigger1 = ctrl || Stateno = 101
trigger2 = (stateno=400) && var(5) && Movehit

[State -1, Crouching Strong Kick]
type = ChangeState
value = 450
triggerall = !AIlevel
triggerAll = command = "holddown" && command = "c"
triggerAll = StateType != A
trigger1 = ctrl || Stateno = 101
trigger2 = (stateno=410||stateno=420) && var(5) && Movehit

[State -1, Jump Light Punch]
type = ChangeState
value = 600
triggerall = !AIlevel
triggerall = command = "x"
trigger1 = statetype = A
trigger1 = ctrl

[State -1, Jump Medium Punch]
type = ChangeState
value = 610
triggerall = command = "y"
trigger1 = statetype = A
trigger1 = ctrl

[State -1, Jump Strong Punch]
type = ChangeState
value = 620
triggerall = !AIlevel
triggerall = command = "z"
trigger1 = statetype = A
trigger1 = ctrl

[State -1, Jump Light Kick]
type = ChangeState
value = 630
triggerall = !AIlevel
triggerall = command = "a"
trigger1 = statetype = A
trigger1 = ctrl

[State -1, Jump Medium Kick]
type = ChangeState
value = 640
triggerall = !AIlevel
triggerall = command = "b"
trigger1 = statetype = A
trigger1 = ctrl

[State -1, Jump Strong Kick]
type = ChangeState
value = 651
triggerall = !AIlevel
triggerall = command = "c"
triggerall = statetype = A
trigger1 = ctrl

[State -1, Taunt]
type = ChangeState
value = 195
triggerall = !AIlevel
triggerall = command = "s"
triggerall = StateType != A
triggerall = StateNo != [200,699]
trigger1 = ctrl || (StateNo = [100,101])
trigger2 = var(5)

;========================================================
;A.I.
[State -1, Dash Forward]
type = changestate
value = 100
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype = S
triggerall = ctrl && (stateno != [100, 106])
trigger1 = (enemynear, movetype != A) && p2bodydist x >= 160 && random < (25 * (AIlevel ** 2 / 64.0))

[State -1, dash]
type = changestate
value = 105
triggerall = AIlevel && numenemy
triggerall = statetype = S && roundstate = 2 && ctrl
triggerall = (p2bodydist x = [0, 80]) && backedgebodydist > 80 && (stateno != [100, 106])
trigger1 = enemynear, movetype = A && random < (50 * (AIlevel ** 2 / 64.0))
trigger2 = enemynear, stateno = 5120 && enemynear, animtime = -3 && random < (200 * (AIlevel ** 2 / 64.0))

[State -1, Jump]
type = changestate
value = 40
trigger1 = AIlevel && numenemy
trigger1 = roundstate = 2 && statetype != A && ctrl
trigger1 = enemynear, movetype = A && p2bodydist x < 160 && enemynear, hitdefattr = SC, AT

[State -1, Guard]
type = changestate
value = 120
trigger1 = AIlevel && numenemy
trigger1 = roundstate = 2 && inguarddist
trigger1 = ctrl && (stateno != [120, 155])
trigger1 = !(enemynear, hitdefattr = SCA, AT) && (enemynear, time < 120)
trigger1 = statetype != A || p2statetype = A
trigger1 = random < (ifelse((p2stateno = [200, 699]), 300, ifelse((p2stateno = [1000, 2999]), 500, 1000)) * (AIlevel ** 2 / 64.0))

[State -1, Heavy Smash]
type = changestate
value = 500
triggerall = AIlevel && numenemy
triggerall = statetype != A && roundstate = 2
triggerall = (p2bodydist x = [-5, 38]) && p2statetype != L && P2stateno = 700
trigger1 = (ctrl || StateNo = 40 || StateNo = 52 || Stateno = 101 || Stateno = 106 || Stateno = 700) && random < (600 * (AIlevel ** 2 / 64.0))

;-------------------------------------------------------------------------------
;Normals
[State -1, SLP]
type = changestate
value = 200
triggerall = AIlevel && numenemy
triggerall = statetype != A && roundstate = 2 && (enemynear, statetype != C)
triggerall = (p2bodydist x = [-5, 38]) && p2statetype != L && P2statetype != A;p2bodydist x <=39
trigger1 = ctrl || Stateno = 101 && random < (200 * (AIlevel ** 2 / 64.0))


[State -1, SMP]
type = changestate
value = 210
triggerall = AIlevel && numenemy
triggerall = statetype != A && roundstate = 2
triggerall = (p2bodydist x = [0, 38]) && p2statetype != L && P2statetype != A
trigger1 = ctrl || Stateno = 101 && random < (50 * (AIlevel ** 2 / 64.0))
trigger2 = (stateno=200||stateno=211||stateno=231||stateno=251) && var(5) && Movehit && random < (290 * (AIlevel ** 2 / 64.0))

[State -1, Kung Fu Chop]
type = Changestate
value = 211
triggerall = AIlevel && numenemy
triggerall = statetype != A && roundstate = 2
triggerall = (p2bodydist x = [0, 50]) && p2statetype != L && P2statetype != A && P2statetype = C
trigger1 = ctrl || stateno= 101 && random < (50 * (AIlevel ** 2 / 64.0))

[State -1, Kung Fu Chop Comboed]
type = Changestate
value = 212
triggerall = AIlevel && numenemy
triggerall = statetype != A && roundstate = 2
triggerall = (p2bodydist x = [0, 50]) && p2statetype != L && P2statetype != A
trigger1 = (stateno=210||stateno=221||stateno=251) && var(5) && Movehit && random < (300 * (AIlevel ** 2 / 64.0))

[State -1, SHP]
type = changestate
value = 220 + (Abs(P2BodyDist X) <= 15) * 1
triggerall = AIlevel && numenemy
triggerall = statetype != A && roundstate = 2 && (enemynear, statetype != C)
triggerall = (p2bodydist x = [0, 63]) && p2statetype != L && P2statetype != A
trigger1 = ctrl || stateno=101 && random < (40 * (AIlevel ** 2 / 64.0))
trigger2 = (stateno=210||stateno=251) && var(5) && Movehit && random < (360 * (AIlevel ** 2 / 64.0))

[State -1, SLK]
type = changestate
value = 230 + (Abs(P2BodyDist X) <= 15) * 1
triggerall = AIlevel && numenemy
triggerall = statetype != A && roundstate = 2
triggerall = (p2bodydist x = [-5, 64]) && p2statetype != L && P2statetype != A
trigger1 = ctrl || Stateno = 101 && random < (200 * (AIlevel ** 2 / 64.0))

[State -1, SMK]
type = changestate
value = 240
triggerall = AIlevel && numenemy
triggerall = statetype != A && roundstate = 2
triggerall = (p2bodydist x = [0, 59]) && (p2bodydist y = [ -50, 50]) && p2statetype != L && !(enemynear, hitfall)
trigger1 = ctrl || Stateno = 101 && random < (100 * (AIlevel ** 2 / 64.0))
trigger2 = (stateno=200||stateno=231) && var(5) && Movehit && random < (290 * (AIlevel ** 2 / 64.0))

[State -1, SHK]
type = changestate
value = 250 + (Abs(P2BodyDist X) <= 15) * 1
triggerall = AIlevel && numenemy
triggerall = statetype != A && roundstate = 2 && (enemynear, statetype != C)
triggerall = (p2bodydist x = [0, 42]) && (p2bodydist y = [ -50, 50]) && p2statetype != L && !(enemynear, hitfall)
trigger1 = ctrl || stateno=101 && random < (75 * (AIlevel ** 2 / 64.0))
trigger2 = (stateno=210||stateno=211||stateno=220||stateno=221||stateno=251) && var(5) && Movehit && random < (300 * (AIlevel ** 2 / 64.0))

[State -1, throw]
type = changestate
value = 800
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype = S && ctrl
triggerall = p2statetype != A && p2statetype != L && p2movetype != H
trigger1 = (p2bodydist x = [-20, 20]) && random < (250 * (AIlevel ** 2 / 64.0))
trigger2 = (p2stateno != [120, 155]) && (p2bodydist x = [-20, 20]) && random < (500 * (AIlevel ** 2 / 64.0))

[State -1, CLP]
type = changestate
value = 400
triggerall = AIlevel && numenemy
triggerall = statetype != A && roundstate = 2
triggerall = p2bodydist x <=32 && p2statetype != L && P2statetype != A
trigger1 = ctrl && random < (200 * (AIlevel ** 2 / 64.0))

[State -1, CMP]
type = changestate
value = 410
triggerall = AIlevel && numenemy
triggerall = statetype != A && roundstate = 2
triggerall = (p2bodydist x = [0, 35]) && p2statetype != L && P2statetype != A
trigger1 = ctrl && random < (60 * (AIlevel ** 2 / 64.0))
trigger2 = (stateno=400) && var(5) && Movehit && random < (265 * (AIlevel ** 2 / 64.0))


[State -1, CHP]
type = changestate
value = 420
triggerall = AIlevel && numenemy
triggerall = statetype != A && roundstate = 2
triggerall = (p2bodydist x = [0, 39]) && p2statetype != L && P2statetype != A
trigger1 = ctrl && random < (50 * (AIlevel ** 2 / 64.0))
trigger2 = (stateno=410) && var(5) && Movehit && random < (300 * (AIlevel ** 2 / 64.0))

[State -1, CLK]
type = changestate
value = 430
triggerall = AIlevel && numenemy
triggerall = statetype != A && roundstate = 2
triggerall = p2bodydist x <=37 && p2statetype != L && P2statetype != A
trigger1 = ctrl && random < (180 * (AIlevel ** 2 / 64.0))

[State -1, CMK]
type = changestate
value = 440
triggerall = AIlevel && numenemy
triggerall = statetype != A && roundstate = 2
triggerall = (p2bodydist x = [0, 37]) && p2statetype != L && P2statetype != A
trigger1 = ctrl && random < (120 * (AIlevel ** 2 / 64.0))
trigger2 = (stateno=400) && var(5) && Movehit && random < (265 * (AIlevel ** 2 / 64.0))

[State -1, CHK]
type = changestate
value = 450
triggerall = AIlevel && numenemy
triggerall = statetype != A && roundstate = 2
triggerall = (p2bodydist x = [-36, 34]) && p2statetype != L && P2statetype != A
trigger1 = ctrl && random < (50 * (AIlevel ** 2 / 64.0))
trigger2 = (stateno=410||stateno=420) && var(5) && Movehit && random < (250 * (AIlevel ** 2 / 64.0))

[State -1, ALP]
type = changestate
value = 600
triggerall = AIlevel && numenemy
triggerall = statetype = A && roundstate = 2
triggerall = (p2bodydist x = [0, 23]) && (p2bodydist y = [ -50, 50]) && p2statetype = A && !(enemynear, hitfall)
trigger1 = ctrl && random < (300 * (AIlevel ** 2 / 64.0))

[State -1, AMP]
type = changestate
value = 610
triggerall = AIlevel && numenemy
triggerall = statetype = A && roundstate = 2
triggerall = (p2bodydist x = [0, 32]) && (p2bodydist y = [ -50, 50]) && p2statetype != L && !(enemynear, hitfall)
trigger1 = ctrl && random < (ifelse((vel x > 0 && p2statetype = A), 250, 75) * (AIlevel ** 2 / 64.0))

[State -1, AHP]
type = changestate
value = 620
triggerall = AIlevel && numenemy
triggerall = statetype = A && roundstate = 2
triggerall = (p2bodydist x = [0, 43]) && (p2bodydist y = [ -50, 50]) && p2statetype != L && !(enemynear, hitfall)
trigger1 = ctrl && random < (100 * (AIlevel ** 2 / 64.0))

[State -1, ALK]
type = changestate
value = 630
triggerall = AIlevel && numenemy
triggerall = statetype = A && roundstate = 2
triggerall = (p2bodydist x = [0, 47]) && (p2bodydist y = [ -50, 50]) && p2statetype != L && !(enemynear, hitfall)
trigger1 = ctrl && random < (50 * (AIlevel ** 2 / 64.0))

[State -1, AMK]
type = changestate
value = 640
triggerall = AIlevel && numenemy
triggerall = statetype = A && roundstate = 2
triggerall = (p2bodydist x = [ -15, 47]) && (p2bodydist y = [ -50, 50]) && p2statetype != L && !(enemynear, hitfall)
trigger1 = ctrl && random < (75 * (AIlevel ** 2 / 64.0))

[State -1, AHK]
type = changestate;null
value = 651
triggerall = AIlevel && numenemy
triggerall = statetype = A && roundstate = 2
triggerall = (p2bodydist x = [0, 53]) && (p2bodydist y = [ -50, 50]) && p2statetype = A && !(enemynear, hitfall)
trigger1 = ctrl && random < (200 * (AIlevel ** 2 / 64.0))
;-------------------------------------------------------------------------------
;Specials
[State -1, KF Palm follow-up]
type = ChangeState
value = 1030
triggerall = AIlevel && numenemy
triggerall = statetype != A && roundstate = 2
triggerall = power >= 1000
triggerall = (p2bodydist x = [0, 69]) && p2statetype != L && p2statetype != A && !(enemynear, hitfall)
trigger1 = (Stateno=[1000,1020]) && Movehit && random < (226 * (AIlevel ** 2 / 64.0));(170 * (AIlevel ** 2 / 64.0))

[State -1, KF Palm]
type = ChangeState
value = 1000+ifelse((p2stateno!=[120, 155]), 30,ifelse(random<250,20,ifelse(random<250,10,0)))
triggerall = AIlevel && numenemy
triggerall = statetype != A && roundstate = 2
triggerall = (p2bodydist x = [0, 69]) && p2statetype != L && p2statetype != A && !(enemynear, hitfall)
trigger1 = (stateno=220||stateno=221||stateno=250||stateno=251)&& var(5) && Movehit && random < (240 * (AIlevel ** 2 / 64.0))
trigger2 = (stateno=420)&& var(5) && Movehit && random < (240 * (AIlevel ** 2 / 64.0))

[State -1, KF knee]
type = changestate
value = 1100+ifelse(power >= 1000 && random < 200 && (p2stateno!=[120, 155]), 30,ifelse(random<250,20,ifelse(random<250,10,0)))
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype != A
triggerall = (p2stateno != [120, 155]) && p2statetype != L
triggerall = (p2bodydist x = [0, 40]) && (enemynear, vel y > -1) && (enemynear, vel x > -2)
triggerall = (enemynear, const(size.head.pos.y) <= -40)
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || Stateno = 101
trigger1 = (enemynear, statetype = A) && random < (200 * (AIlevel ** 2 / 64.0))
trigger2 = (p2bodydist x = [0, 20]) && (enemynear, vel y > -1) && (enemynear, vel x > -2)
trigger2 = var(5) && Movehit && random < (60 * (AIlevel ** 2 / 64.0))

[State -1, KF Shuffle]
type = ChangeState
value = 1300+ifelse(power >= 1000 && random < 300 && ((p2stateno!=[120, 155]) && p2statetype=C), 30,0)
triggerall = AIlevel && numenemy
triggerall = statetype != A && roundstate = 2
triggerall = (p2bodydist x = [0, 67]) && p2statetype != L && p2statetype != A && !(enemynear, hitfall)
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || Stateno = 101
trigger1 = random < (30 * (AIlevel ** 2 / 64.0))
trigger2 = var(5) && Movehit && random < (150 * (AIlevel ** 2 / 64.0))