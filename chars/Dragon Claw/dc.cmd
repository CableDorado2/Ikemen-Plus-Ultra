
[Remap]
x = x
y = y
z = z
a = a
b = b
c = c
s = s

[Defaults]
command.time=15
command.buffer.time=1




[Command]
name = "QCFX2_x"
command = ~D, DF, F, D, DF, F, x
time = 30
[Command]
name = "QCFX2_y"
command = ~D, DF, F, D, DF, F, y
time = 30
[Command]
name = "QCFX2_z"
command = ~D, DF, F, D, DF, F, z
time = 30
[Command]
name = "QCFX2_a"
command = ~D, DF, F, D, DF, F, a
time = 30
[Command]
name = "QCFX2_b"
command = ~D, DF, F, D, DF, F, b
time = 30
[Command]
name = "QCFX2_c"
command = ~D, DF, F, D, DF, F, c
time = 30
[Command]
name = "QCBX2_x"
command = ~D, DB, B, D, DB, B, x
time = 30
[Command]
name = "QCBX2_y"
command = ~D, DB, B, D, DB, B, y
time = 30
[Command]
name = "QCBX2_z"
command = ~D, DB, B, D, DB, B, z
time = 30
[Command]
name = "QCBX2_a"
command = ~D, DB, B, D, DB, B, a
time = 30
[Command]
name = "QCBX2_b"
command = ~D, DB, B, D, DB, B, b
time = 30
[Command]
name = "QCBX2_c"
command = ~D, DB, B, D, DB, B, c
time = 30
[Command]
name = "upper_x"
command = ~F, D, DF, x
[Command]
name = "upper_y"
command = ~F, D, DF, y
[Command]
name = "upper_z"
command = ~F, D, DF, z
[Command]
name = "upper_xy"
command = ~F, D, DF, x+y
[Command]
name = "QCF_x"
command = ~D, DF, F, x
[Command]
name = "QCF_y"
command = ~D, DF, F, y
[Command]
name = "QCF_z"
command = ~D, DF, F, z
[Command]
name = "QCF_xy"
command = ~D, DF, F, x+y
[Command]
name = "QCF_a"
command = ~D, DF, F, a
[Command]
name = "QCF_b"
command = ~D, DF, F, b
[Command]
name = "QCF_c"
command = ~D, DF, F, c
[Command]
name = "QCB_a"
command = ~D, DB, B, a
[Command]
name = "QCB_b"
command = ~D, DB, B, b
[Command]
name = "QCB_c"
command = ~D, DB, B, c
[Command]
name = "QCB_ab"
command = ~D, DB, B, a+b
[Command]
name = "QCB_x"
command = ~D, DB, B, x
[Command]
name = "QCB_y"
command = ~D, DB, B, y
[Command]
name = "QCB_z"
command = ~D, DB, B, z
[Command]
name = "QCB_xy"
command = ~D, DB, B, x+y
[Command]
name = "FF_ab"
command = F, F, a+b
[Command]
name = "FF_a"
command = F, F, a
[Command]
name = "FF_b"
command = F, F, b
[Command]
name = "FF_c"
command = F, F, c
[Command]
name = "FF"
command = F, F
time = 10
[Command]
name = "BB"
command = B, B
time = 10
[Command]
name = "recovery"
command = x+y
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
name="fwd"
command=F
time=1
[Command]
name="back"
command=B
time=1
[Command]
name="up"
command=U
time=1
[Command]
name="down"
command=D
time=1
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
[Command]
name = "hold_z"
command = /z
time = 1
[Command]
name = "hold_c"
command = /c
time = 1
[Command]
name = "hold_y"
command = /y
time = 1
[Command]
name = "hold_b"
command = /b
time = 1
[Command]
name = "hold_x"
command = /x
time = 1
[Command]
name = "hold_a"
command = /a
time = 1
[Command]
name = "holdfwd2"
command = ~D,$F
time = 5
[Command]
name = "holdback2"
command = ~D,$B
time = 5
[Command]
name = "holdup2" 
command=$D,$U
time=15
[Statedef -1]
[State -1, AI]
type = changestate
trigger1 = ishelper(9998)
value = 9998
[State -1, CHARGE]
type = ChangeState
value = 1400
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
triggerall = Var(30) >= 1
triggerall = statetype = S
triggerall = ctrl = 1 && var(40) > 30 && stateno != 1400
triggerall = P2movetype != A && power < 3000
triggerall = var(23) <= 0
trigger1 = P2BodyDist X = [100,500]
[State -1, rest]
type = ChangeState
value = 9996
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
triggerall = Var(30) >= 1
triggerall = statetype != A
triggerall = ctrl = 1
trigger1 = power >= 3000 && life >= 600 && p2life <= 300
[State -1, rest move]
type = ChangeState
value = 61
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
triggerall = Var(30) >= 1
triggerall = statetype != A
triggerall = stateno = 9996 && p2dist X < 0
trigger1 = power >= 3000 && life >= 600 && p2life <= 300
[State -1, flashstep from far]
type = changestate
value = 2315
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
triggerall = Var(30) >= 1 
triggerall = var(41) >= 3
triggerall = statetype != A
triggerall = ctrl && p2movetype = A
trigger1 = p2dist X = [200,250] 
[State -1, jump back sunblast evade cornertrap]
type = changestate
value = 40
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
triggerall = Var(30) >= 1 
triggerall = var(41) >= 3
triggerall = statetype != A
triggerall = ctrl && p2movetype = A
trigger1 = p2dist X = [200,450] 
[State -1, jump back sunblast evade cornertrap]
type = changestate
value = 1210
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
triggerall = Var(30) >= 1 
triggerall = var(41) >= 3
triggerall = statetype = A
triggerall = ctrl && p2movetype = A
trigger1 = pos Y < -70 && vel X = 0
trigger1 = p2dist X = [250,450] 
[State -1, Stand Kick Throw]
type = ChangeState
value = 800
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
triggerall = Var(30) >= 1
triggerall = statetype = S
triggerall = ctrl = 1
triggerall = p2statetype = S
triggerall = P2movetype != H
trigger1 = P2BodyDist X = [0,20]
trigger1 = P2BodyDist Y = [-10, 10]
trigger1 = (random <= 100) || (life <= 300 && random <= 800)
[State -1, Stand Kick Throw]
type = ChangeState
value = 900
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
triggerall = Var(30) >= 1
triggerall = statetype = S
triggerall = ctrl = 1
triggerall = p2statetype = S
triggerall = P2movetype != H
trigger1 = P2BodyDist X = [0,20]
trigger1 = P2BodyDist Y = [-10, 10]
trigger1 = (random <= 100) || (life <= 300 && random <= 800)
[State -1, roll]
type = changestate
value = 60
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
triggerall = Var(30) >= 1 
triggerall = statetype != A
trigger1 = stateno = 800 && animtime = 0
trigger2 = stateno = 900 && animtime = 0
[State -1]
type = ChangeState
value = 3100
triggerall = Var(30) >= 1
triggerall = roundstate = 2
triggerall = random <= 500
trigger1 = stateno = 2315 && movehit  && time = 23 && power >= 3000 && p2bodydist X < 100 && time > 27
trigger2 = stateno = 2315 && movehit  && time = 23 && power >= 1000 && p2bodydist X < 100 && p2life < 250 && time > 27
[State -1]
type = ChangeState
value = 3400
triggerall = Var(30) >= 1
triggerall = roundstate = 2
trigger1 = stateno = 2315 && movehit  && time = 23 && power >= 3000
trigger2 = stateno = 2315 && movehit  && time = 23 && power >= 1000 && p2life < 250
[State -1]
type = ChangeState
value = 3300
triggerall = Var(30) >= 1
triggerall = roundstate = 2
trigger1 = stateno = 1221 && movehit  && time = 25 && power >= 3000
trigger2 = stateno = 1221 && movehit  && time = 25 && power >= 1000 && p2life < 250
trigger3 = stateno = 646 && (p2dist X = [0,80]) && (p2dist Y = [-110,70]) && time = 9 && p2life < 100
[State -1, jump null]
type = ChangeState
value = 0
triggerall = var(32) = 1
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
triggerall = Var(30) = 1
triggerall = statetype != A
trigger1 = stateno = 40
[State -1, run in]
type = changestate
value = 100
triggerall = var(32) = 1
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
triggerall = Var(30) >= 1 
triggerall = statetype != A
triggerall = stateno = 0 && ctrl
trigger1 = p2dist X = [100,550] 
[State -1, roll]
type = changestate
value = 60
triggerall = var(32) = 1
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
triggerall = Var(30) >= 1 
triggerall = statetype != A
triggerall = random <= 300
triggerall = facing != enemynear, facing
trigger1 = stateno = 230 && animtime = 0 && movehit = 0 && backedgedist >= 30 && random <= 500
trigger2 = stateno = 200 && animtime = 0 && movehit = 0 && backedgedist >= 30 && random <= 500
[State -1, roll]
type = changestate
value = 61
triggerall = var(32) = 1
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
triggerall = Var(30) >= 1 
triggerall = statetype != A
triggerall = random <= 300
triggerall = facing != enemynear, facing
trigger1 = stateno = 100 && random <= 200
trigger1 = p2dist X = [0,100] 
trigger2 = ctrl && random <= 200
trigger2 = p2dist X = [0,80] 
trigger3 = p2movetype = A && ctrl && random <= 800 
trigger3 = p2dist X = [0,100] 
trigger4 = stateno = 230 && animtime = 0 && movehit = 0
trigger5 = stateno = 200 && animtime = 0 && movehit = 0
[State -1, kicku]
type = changestate
value = 230
triggerall = var(32) = 1
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
triggerall = Var(30) >= 1 
triggerall = statetype != A
triggerall = (random <= 100) || (life < 200 && random <= 800)
trigger1 = stateno = 100
trigger1 = p2dist X = [-100,100] 
trigger2 = ctrl
trigger2 = p2dist X = [-80,80] 
[State -1, punchu]
type = changestate
value = 200
triggerall = var(32) = 1
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
triggerall = Var(30) >= 1 
triggerall = statetype != A
triggerall = random <= 400
trigger1 = stateno = 100
trigger1 = p2dist X = [-100,100] 
trigger2 = ctrl
trigger2 = p2dist X = [-80,80] 
[State -1, Stand Light Punch]
type = ChangeState
value = 205
triggerall = Var(30) >= 1 
triggerall = var(32) = 1
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
triggerall = statetype != A
trigger1 = stateno = 200 && time > 9 && movehit > 0
ignorehitpause = 1
[State -1, Stand Light Punch]
type = ChangeState
value = 207
triggerall = Var(30) >= 1 
triggerall = var(32) = 1
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
triggerall = statetype != A
trigger1 = stateno = 206  && time > 26 && movehit > 0
ignorehitpause = 1
[State -1, Stand Light Punch]
type = ChangeState
value = 206
triggerall = Var(30) >= 1 
triggerall = var(32) = 1
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
triggerall = statetype != A
trigger1 = stateno = 205 && time > 15 && movehit > 0
ignorehitpause = 1
[State -1, Stand Strong Punch]
type = ChangeState
value = 211
triggerall = Var(30) >= 1 
triggerall = var(32) = 1
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
triggerall = statetype != A
trigger1 = stateno = 210  && time > 24 && movehit > 0
ignorehitpause = 1
[State -1, Stand Strong Punch]
type = ChangeState
value = 210
triggerall = Var(30) >= 1 
triggerall = var(32) = 1
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
triggerall = statetype != A
trigger1 = stateno = 207  && time > 19 && movehit > 0
ignorehitpause = 1
[State -1, HEAVY FLASH STEP]
type = ChangeState
value = 2315
triggerall = Var(30) >= 1 
triggerall = var(32) = 1
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
triggerall = statetype != A
trigger1 = stateno = 211 && time = 20 && movehit > 0
[State -1, Stand Light Kick]
type = ChangeState
value = 235
triggerall = Var(30) >= 1 
triggerall = var(32) = 1
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
trigger1 = stateno = 230  && movehit > 0 && animelemno(0) = 5 && var(13) = 1
ignorehitpause = 1
[State -1, Stand Light Kick]
type = ChangeState
value = 237
triggerall = Var(30) >= 1 
triggerall = var(32) = 1
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
trigger1 = stateno = 236  && movehit > 0 && animelemno(0) = 7 && var(13) = 3
ignorehitpause = 1
[State -1, Stand Light Kick]
type = ChangeState
value = 236
triggerall = Var(30) >= 1 
triggerall = var(32) = 1
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
trigger1 = stateno = 235  && movehit > 0 && animelemno(0) = 5&& var(13) = 2
ignorehitpause = 1
[State -1, Stand Light Kick]
type = ChangeState
value = 241
triggerall = Var(30) >= 1 
triggerall = var(32) = 1
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
trigger1 = stateno = 240  && movehit > 0 && animelemno(0) = 10 && var(13) = 5
ignorehitpause = 1
[State -1, Standing Strong Kick]
type = ChangeState
value = 240
triggerall = Var(30) >= 1 
triggerall = var(32) = 1
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
trigger1 = stateno = 237 && movehit > 0 && animelemno(0) = 13 && var(13) = 4
ignorehitpause = 1
[State -1, Stand Light Kick]
type = ChangeState
value = 250
triggerall = Var(30) >= 1 
triggerall = var(32) = 1
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
trigger1 = stateno = 241  && movehit > 0 && animelemno(0) = 16 && var(13) = 6
[State -1, Stand Light Kick]
type = ChangeState
value = 251
triggerall = Var(30) >= 1 
triggerall = var(32) = 1
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
trigger1 = stateno = 250  && movehit> 0 && animelemno(0) = 8
[State -1, Stand Light Kick]
type = ChangeState
value = 252
triggerall = Var(30) >= 1 
triggerall = var(32) = 1
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
trigger1 = stateno = 251  && movehit > 0 && animelemno(0) = 8 && p2life < 60
[State -1, jump!]
type = changestate
value = 9997
triggerall = Var(30) >= 1 
triggerall = var(32) = 1
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
triggerall = statetype != A
trigger1 = stateno = 1004 && animtime = 0 && (p2bodydist X = [0,70]) && (p2bodydist Y =  [-250,-200])
[State -1, Attack chain after counter]
type = changestate
value = 600
triggerall = Var(30) >= 1 
triggerall = var(32) = 1
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
triggerall = statetype = A && p2statetype = A && p2movetype = H
trigger1 = stateno = 50 && ctrl && (p2dist X = [0,80]) && (p2dist Y = [-110,20]) && time = 8
trigger2 = stateno = 646 && (p2dist X = [-10,80]) && (p2dist Y = [-110,70]) && time = 9
[State -1, Attack chain after counter]
type = changestate
value = 630
triggerall = Var(30) >= 1 
triggerall = var(32) = 1
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
triggerall = statetype = A
trigger1 = stateno = 600 && movecontact > 0
[State -1, Attack chain after counter]
type = changestate
value = 605
triggerall = Var(30) >= 1 
triggerall = var(32) = 1
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
triggerall = statetype = A
trigger1 = stateno = 630 && movecontact > 0
[State -1, Attack chain after counter]
type = changestate
value = 610
triggerall = Var(30) >= 1 
triggerall = var(32) = 1
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
triggerall = statetype = A
trigger1 = stateno = 605 && movecontact > 0 && var(10)= 1
[State -1, Attack chain after counter]
type = changestate
value = 635
triggerall = Var(30) >= 1 
triggerall = var(32) = 1
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
triggerall = statetype = A
trigger1 = stateno = 605 && movecontact > 0
[State -1, Attack chain after counter]
type = changestate
value = 645
triggerall = Var(30) >= 1 
triggerall = var(32) = 1
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
triggerall = statetype = A
trigger1 = stateno = 635 && movecontact > 0 && var(10)= 0 
[State -1, Crouching lk]
type = changestate
value = 430
triggerall = var(32) = 2
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
triggerall = Var(30) >= 1 
triggerall = statetype != A && stateno != 100
triggerall = ctrl || stateno = 52
triggerall = p2stateno != 5120
trigger1 = p2dist X = [-70,75]
trigger1 = p2dist Y = 0
[State -1, Crouching hk]
type = changestate
value = 450
triggerall = var(32) = 2
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
triggerall = Var(30) >= 1 
triggerall = statetype != A && stateno != 100 && p2movetype != H
triggerall = ctrl || stateno = 52
triggerall = var(44) = 0
trigger1 = p2dist X = [75,170]
trigger1 = p2dist Y = 0
[State -1, Crouching hk]
type = changestate
value = 415
triggerall = var(32) = 2
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
triggerall = Var(30) >= 1 
triggerall = statetype != A
trigger1 = stateno = 430 && movehit = 1
[State -1, homing flight]
type = changestate
value = 1020
triggerall = var(32) = 2
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
triggerall = Var(30) >= 1 
triggerall = statetype != A
trigger1 = stateno = 415 && movehit = 1
[State -1, sunblast]
type = changestate
value = 1220
triggerall = var(32) = 2
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
triggerall = Var(30) >= 1 
triggerall = statetype = A
trigger1 = stateno = 646 && time = 8 && var(10) = 1
trigger1 = p2dist X <= 200 && p2statetype = A
trigger1 = p2dist Y = [-50,50]
trigger2 = stateno = 1221 && time = 26  && var(11) = 1
trigger2 = p2dist X > 70 && p2statetype = A
trigger2 = p2dist Y = [-90,90]
[State -1, sunblast]
type = changestate
value = 1200
triggerall = var(32) = 2
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
triggerall = Var(30) >= 1 
triggerall = statetype = A
trigger1 = stateno = 1221 && time = 26  && var(11) = 1
trigger1 = p2dist X <= 70 && p2statetype = A
trigger1 = p2dist Y = [-90,90]
[State -1, hk]
type = changestate
value = 640
triggerall = var(32) = 2
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
triggerall = Var(30) >= 1 
triggerall = statetype = A
trigger1 = stateno = 1201 && ctrl
trigger1 = p2dist X <= 150 && p2statetype = A
trigger1 = p2dist Y = [-70,70]
[State -1, lp]
type = changestate
value = 600
triggerall = var(32) = 2
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
triggerall = Var(30) >= 1 
triggerall = statetype = A
trigger1 = stateno = 1023
trigger1 = p2dist X <= 150 && p2statetype = A
trigger1 = p2dist Y = [-60,60]
trigger2 = stateno = 646 && time = 9 && var(10) = 1
trigger2 = p2dist X <= 100 && p2statetype = A
trigger2 = p2dist Y = [-50,50]
[State -1, lk]
type = changestate
value = 630
triggerall = var(32) = 2
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
triggerall = Var(30) >= 1 
triggerall = statetype = A
trigger1 = stateno = 600 && movehit = 1
[State -1,mp]
type = changestate
value = 605
triggerall = var(32) = 2
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
triggerall = Var(30) >= 1 
triggerall = statetype = A
trigger1 = stateno = 630 && movehit = 1
[State -1, mk]
type = changestate
value = 635
triggerall = var(32) = 2
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
triggerall = Var(30) >= 1 
triggerall = statetype = A
trigger1 = stateno = 605 && movehit = 1
[State -1, stomp]
type = changestate
value = 645
triggerall = var(32) = 2
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
triggerall = Var(30) >= 1 
triggerall = statetype = A
trigger1 = stateno = 635 && movehit = 1
[State -1, jump back sunblast evade cornertrap]
type = changestate
value = 1022
triggerall = var(32) = 2
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
triggerall = Var(30) >= 1 
triggerall = statetype = A
triggerall = ctrl && (stateno = 50 || stateno = 46)
trigger1 = backedgedist < 5
trigger1 = p2dist X  > 150 && pos Y < -70
trigger1 = random < 600
[State -1, jump back sunblast evade cornertrap]
type = changestate
value = 610
triggerall = var(32) = 2
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
triggerall = Var(30) >= 1 
triggerall = statetype = A
triggerall = stateno = 1023
trigger1 = p2dist X <= 180 && p2statetype != A && p2movetype != H
[State -1, jump back sunblast evade cornertrap]
type = changestate
value = 645
triggerall = var(32) = 2
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
triggerall = Var(30) >= 1 
triggerall = statetype = A
triggerall = stateno = 1023
trigger1 = p2dist X <= 100 && p2statetype != A && p2movetype = H
[State -1, jump back sunblast evade cornertrap]
type = changestate
value = 42
triggerall = var(32) = 2
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
triggerall = Var(30) >= 1 
triggerall = statetype != A
triggerall = ctrl
trigger1 = backedgedist < 5
trigger1 = p2dist X = [150,250] 
trigger1 = random < 600
[State -1, jump back sunblast evade cornertrap]
type = changestate
value = 1220
triggerall = var(32) = 2
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
triggerall = Var(30) >= 1 
triggerall = statetype = A && p2movetype != A
triggerall = stateno = 50
trigger1 = pos Y < -70 
trigger1 = backedgedist < 5
trigger1 = p2dist X = [150,250] 
trigger1 = random < 600
[State -1, dashforward evade cornertrap]
type = changestate
value = 100
triggerall = var(32) = 2
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
triggerall = Var(30) >= 1 
triggerall = statetype != A
triggerall = ctrl
trigger1 = backedgedist < 5
trigger1 = p2dist X = [100,200] 
trigger1 = random < 600
[State -1, dashforward evade cornertrap]
type = changestate
value = 41
triggerall = var(32) = 2
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
triggerall = Var(30) >= 1 
triggerall = statetype != A
trigger1 = stateno = 100
[State -1, roll forward evade cornertrap]
type = changestate
value = 61
triggerall = var(32) = 2
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
triggerall = Var(30) >= 1 
triggerall = statetype != A
triggerall = ctrl && stateno != 100
triggerall = facing != enemynear, facing
trigger1 = backedgedist < 5
trigger1 = p2dist X = [0,100] 
trigger1 = random < 800
[State -1, rollback]
type = changestate
value = 61
triggerall = var(32) = 2
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
triggerall = Var(30) >= 1 
triggerall = statetype != A && stateno != 100
triggerall = backedgedist < 5
triggerall = facing != enemynear, facing
trigger1 = stateno = 430 && movehit = 0 && animtime = 0
trigger2 = stateno = 450 && movehit = 0 && animtime = 0
[State -1, dashback1]
type = changestate
value = 42
triggerall = var(32) = 2
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
triggerall = Var(30) >= 1 
triggerall = statetype != A && p2movetype != A
triggerall = ctrl && stateno != 100
trigger1 = p2dist X = [250,500]
trigger1 = random < 500  && backedgedist < 5
trigger2 = p2dist X = [250,500] 
trigger2 =  random <= 200
[State -1, dashback1]
type = changestate
value = 45
triggerall = var(32) = 2
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
triggerall = Var(30) >= 1 
triggerall = statetype != A && p2movetype != A
trigger1 = ctrl && stateno != 100
trigger1 = p2dist X = [150,250]
trigger1 = random < 500  && backedgedist < 5
trigger2 = ctrl && stateno != 100
trigger2 = p2dist X = [150,250] 
trigger2 =  random <= 200
trigger3 = stateno=  60 && animtime = 0
[State -1, dashback2]
type = changestate
value = 105
triggerall = var(32) = 2
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
triggerall = Var(30) >= 1 
triggerall = statetype != A && p2movetype != A
triggerall = ctrl && stateno != 100
trigger1 = p2dist X = [200,500] 
trigger1 = random < 200
[State -1, rollback]
type = changestate
value = 60
triggerall = var(32) = 2
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
triggerall = Var(30) >= 1 
triggerall = statetype != A && stateno != 100
triggerall = ctrl || stateno = 20
triggerall = facing != enemynear, facing
trigger1 = p2dist X = [0,100] 
trigger1 = random < 100
trigger2 = p2dist X = [100,180] 
trigger2 = random < 50
trigger3 = p2movetype = A && random <= 400
[State -1, rollback]
type = changestate
value = 60
triggerall = var(32) = 2
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
triggerall = Var(30) >= 1 
triggerall = statetype != A && stateno != 100
triggerall = facing != enemynear, facing
trigger1 = stateno = 450 && movehit = 0 && animtime = 0
[State -1, walk back]
type = changestate
value = 20
triggerall = var(32) = 2
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
triggerall = Var(30) >= 1 
triggerall = statetype != A && stateno != 100
triggerall = ctrl
trigger1 = p2dist X = [0,500]
[State -1, jump back sunblast evade cornertrap]
type = changestate
value = 2315
triggerall = var(32) = 3
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
triggerall = Var(30) >= 1 
triggerall = statetype != A
triggerall = ctrl
trigger1 = p2dist X = [200,250] 
trigger1 = random < 200
[State -1, jump back sunblast evade cornertrap]
type = changestate
value = 2315
triggerall = var(32) = 3
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
triggerall = Var(30) >= 1 
triggerall = statetype != A
triggerall = ctrl && p2movetype != A
trigger1 = p2dist X = [150,200] 
trigger1 = random < 200
[State -1, Aaah dun hurt me >_< land]
type = changestate
value = 1320
triggerall = var(32) = 3
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
triggerall = Var(30) >= 1 
triggerall = statetype != A
triggerall = ctrl && p2movetype = A
triggerall = facing != enemynear, facing
trigger1 = p2dist X = [-20,150] 
trigger1 = p2dist Y >= -20
[State -1, Aaah dun hurt me >_< air]
type = changestate
value = 1320
triggerall = var(32) = 3
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
triggerall = Var(30) >= 1 
triggerall = statetype != A
triggerall = ctrl && p2movetype = A
triggerall = facing != enemynear, facing
trigger1 = p2dist X = [-20,150] 
trigger1 = p2dist Y = [-100,-20]
trigger1 = enemynear, vel Y > 0
[State -1, Attack chain after counter]
type = changestate
value = 640
triggerall = var(32) = 3
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
triggerall = Var(30) >= 1 
triggerall = statetype = A && p2statetype != A
trigger1 = stateno = 1322 && ctrl
[State -1, Attack chain after counter]
type = changestate
value = 1200
triggerall = var(32) = 3
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
triggerall = Var(30) >= 1 
triggerall = statetype = A
trigger1 = stateno = 640 && movecontact > 0
[State -1, Attack chain after counter]
type = changestate
value = 610
triggerall = var(32) = 3
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
triggerall = Var(30) >= 1 
triggerall = statetype = A
trigger1 = stateno = 1201 && ctrl
[State -1, Attack chain after counter]
type = changestate
value = 600
triggerall = var(32) = 3
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
triggerall = Var(30) >= 1 
triggerall = statetype = A && p2statetype = A
trigger1 = stateno = 1322 && ctrl
[State -1, Attack chain after counter]
type = changestate
value = 630
triggerall = var(32) = 3
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
triggerall = Var(30) >= 1 
triggerall = statetype = A
trigger1 = stateno = 600 && movecontact > 0
[State -1, Attack chain after counter]
type = changestate
value = 605
triggerall = var(32) = 3
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
triggerall = Var(30) >= 1 
triggerall = statetype = A
trigger1 = stateno = 630 && movecontact > 0
[State -1, Attack chain after counter]
type = changestate
value = 1220
triggerall = var(32) = 3
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
triggerall = Var(30) >= 1 
triggerall = statetype = A && random < 500
trigger1 = stateno = 605 && movecontact > 0
[State -1, Attack chain after counter]
type = changestate
value = 635
triggerall = var(32) = 3
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
triggerall = Var(30) >= 1 
triggerall = statetype = A
trigger1 = stateno = 605 && movecontact > 0
[State -1, Attack chain after counter]
type = changestate
value = 610
triggerall = var(32) = 3
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
triggerall = Var(30) >= 1 
triggerall = statetype = A
trigger1 = stateno = 635 && movecontact > 0
[State -1, jump back sunblast evade cornertrap]
type = changestate
value = 42
triggerall = var(32) = 3
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
triggerall = Var(30) >= 1 
triggerall = statetype != A
triggerall = ctrl
trigger1 = backedgedist < 5
trigger1 = p2dist X = [150,250] 
trigger1 = random < 600
[State -1, jump back sunblast evade cornertrap]
type = changestate
value = 1220
triggerall = var(32) = 3
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
triggerall = Var(30) >= 1 
triggerall = statetype = A && p2movetype != A
triggerall = stateno = 50
trigger1 = pos Y < -70 
trigger1 = backedgedist < 5
trigger1 = p2dist X = [150,250] 
trigger1 = random < 600
[State -1, dashforward evade cornertrap]
type = changestate
value = 100
triggerall = var(32) = 3
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
triggerall = Var(30) >= 1 
triggerall = statetype != A
triggerall = ctrl
trigger1 = backedgedist < 5
trigger1 = p2dist X = [100,200] 
trigger1 = random < 600
[State -1, dashforward evade cornertrap]
type = changestate
value = 41
triggerall = var(32) = 3
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
triggerall = Var(30) >= 1 
triggerall = statetype != A
trigger1 = stateno = 100
[State -1, dashforward evade cornertrap]
type = changestate
value = 61
triggerall = var(32) = 3
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
triggerall = Var(30) >= 1 
triggerall = statetype != A
triggerall = ctrl && stateno != 100
triggerall = facing != enemynear, facing
trigger1 = backedgedist < 5
trigger1 = p2dist X = [0,100] 
trigger1 = random < 800
[State -1, dashback]
type = changestate
value = 105
triggerall = var(32) = 3
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
triggerall = Var(30) >= 1 
triggerall = statetype != A && p2movetype != A
triggerall = ctrl && stateno != 100
triggerall = facing != enemynear, facing
trigger1 = p2dist X = [0,100] 
trigger1 = random < 300
trigger2 = p2dist X = [100,180] 
trigger2 = random < 50
[State -1, rollback]
type = changestate
value = 60
triggerall = var(32) = 3
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
triggerall = Var(30) >= 1 
triggerall = statetype != A && stateno != 100
triggerall = ctrl || stateno = 20
triggerall = facing != enemynear, facing
trigger1 = p2dist X = [0,100] 
trigger1 = random < 300
trigger2 = p2dist X = [100,180] 
trigger2 = random < 50
[State -1, walk back]
type = changestate
value = 20
triggerall = var(32) = 3
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
triggerall = Var(30) >= 1 
triggerall = statetype != A && stateno != 100
triggerall = ctrl
trigger1 = p2dist X = [0,200]
[State -1, walk forward]
type = changestate
value = 21
triggerall = var(32) = 3
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
triggerall = Var(30) >= 1 
triggerall = statetype != A && stateno != 100
triggerall = ctrl && p2movetype != A
triggerall = enemynear, numproj = 0 && enemynear, numhelper = 0
trigger1 = p2dist X = [230,500]
[State -1, roll]
type = changestate
value = 60
triggerall = var(32) = 4
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
triggerall = Var(30) >= 1 
triggerall = statetype != A
triggerall = random <= 300
triggerall = facing != enemynear, facing
trigger1 = ctrl && random <= 10
[State -1, roll]
type = changestate
value = 61
triggerall = var(32) = 4
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
triggerall = Var(30) >= 1 
triggerall = statetype != A
triggerall = random <= 300
triggerall = facing != enemynear, facing
trigger1 = ctrl && random <= 100
trigger1 = p2dist X = [0,80] 
trigger2 = p2movetype = A && ctrl && random <= 800 
trigger2 = p2dist X = [150,500] 
[State -1, Aaah dun hurt me >_< land]
type = changestate
value = 1320
triggerall = var(32) = 4
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
triggerall = Var(30) >= 1 
triggerall = statetype != A
triggerall = ctrl && p2movetype = A
triggerall = facing != enemynear, facing
trigger1 = p2dist X = [-20,150] 
trigger1 = p2dist Y >= -20
[State -1, Aaah dun hurt me >_< air]
type = changestate
value = 1320
triggerall = var(32) = 4
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
triggerall = Var(30) >= 1 
triggerall = statetype != A
triggerall = ctrl && p2movetype = A
triggerall = facing != enemynear, facing
trigger1 = p2dist X = [-20,150] 
trigger1 = p2dist Y = [-100,-20]
trigger1 = enemynear, vel Y > 0
[State -1, walk forward]
type = changestate
value = 21
triggerall = var(32) = 4
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
triggerall = Var(30) >= 1 
triggerall = statetype != A && stateno != 100
triggerall = ctrl && p2movetype != A
trigger1 = p2dist X = [150,500]
[State -1, Attack chain after counter]
type = changestate
value = 640
triggerall = var(32) = 4
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
triggerall = Var(30) >= 1 
triggerall = statetype = A && p2statetype != A
trigger1 = stateno = 1322 && ctrl
[State -1, Attack chain after counter]
type = changestate
value = 1200
triggerall = var(32) = 4
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
triggerall = Var(30) >= 1 
triggerall = statetype = A
trigger1 = stateno = 640 && movecontact > 0
[State -1, Attack chain after counter]
type = changestate
value = 610
triggerall = var(32) = 4
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
triggerall = Var(30) >= 1 
triggerall = statetype = A
trigger1 = stateno = 1201 && ctrl
[State -1, Attack chain after counter]
type = changestate
value = 600
triggerall = var(32) = 4
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
triggerall = Var(30) >= 1 
triggerall = statetype = A && p2statetype = A
trigger1 = stateno = 1322 && ctrl
[State -1, Attack chain after counter]
type = changestate
value = 630
triggerall = var(32) = 4
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
triggerall = Var(30) >= 1 
triggerall = statetype = A
trigger1 = stateno = 600 && movecontact > 0
[State -1, Attack chain after counter]
type = changestate
value = 605
triggerall = var(32) = 4
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
triggerall = Var(30) >= 1 
triggerall = statetype = A
trigger1 = stateno = 630 && movecontact > 0
[State -1, Attack chain after counter]
type = changestate
value = 1220
triggerall = var(32) = 4
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
triggerall = Var(30) >= 1 
triggerall = statetype = A && random < 500
trigger1 = stateno = 605 && movecontact > 0
[State -1, Attack chain after counter]
type = changestate
value = 635
triggerall = var(32) = 4
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
triggerall = Var(30) >= 1 
triggerall = statetype = A
trigger1 = stateno = 605 && movecontact > 0
[State -1, Attack chain after counter]
type = changestate
value = 610
triggerall = var(32) = 4
triggerall = (roundstate != [0,1]) || (roundstate != [3,4]) 
triggerall = Var(30) >= 1 
triggerall = statetype = A
trigger1 = stateno = 635 && movecontact > 0
[State -1, Winfreeze]
type = ChangeState
value = 0
triggerall = Var(30) = 1
triggerall = Win = 1
trigger1 = statetype != A
trigger1 = ctrl
[State -1]
type = ChangeState
value = 5210
triggerall = canrecover = 1
triggerall = Var(30) = 1
triggerall = life > 0
trigger1 = time > 30
trigger1 = stateno = 5050
[State -1]
type = ChangeState
value = 5201
triggerall = canrecover = 1
triggerall = Var(30) = 1
triggerall = life > 0
trigger1 = stateno = 5100
trigger1 = Pos Y < -20
persistent = 0
[State -1, grounddefend]
type=changestate
value= 130
triggerall=var(30)>=1 && statetype!=A&&roundstate=2
triggerall=enemynear,hitdefattr=SA,AA,AP && inguarddist
trigger1 = ctrl
trigger2 = stateno = 52
persistent=0
[State -1, grounddefend]
type=changestate
value= 131
triggerall=var(30)>=1 && statetype!=A&&roundstate=2
triggerall=enemynear,hitdefattr=C,AA,AP && inguarddist
trigger1 = ctrl
trigger2 = stateno = 52
persistent=0
[state -1, AI crouch guard]
type = ChangeState
trigger1 = p2movetype = A
trigger1 = var(30)>=1
trigger1 =  inguarddist
trigger1 = Statetype != A
trigger1 = p2statetype = C
trigger1 = ctrl || stateno =52 || stateno = 140
value = 131
[State -1, airdefend]
type=changestate
value=132
triggerall=var(30)>=1&&statetype=A&&roundstate=2&&ctrl
trigger1=enemynear,hitdefattr=SCA,AA,AP&&inguarddist
trigger2 = p2movetype = A && inguarddist
persistent=0
:ACES CANCELS
[State -1]
type = ChangeState
value = 3000
triggerall = Var(30) >= 1
triggerall = roundstate = 2 && power >= 1000
triggerall = random <= 500
trigger1 = stateno = 3430 && p2stateno = 3450 && time = 15
[State -1]
type = ChangeState
value = 3100
triggerall = Var(30) >= 1
triggerall = roundstate = 2 && power >= 1000
trigger1 = stateno = 3430 && p2stateno = 5030 && time = 57
[State -1]
type = ChangeState
value = 3300
triggerall = Var(30) >= 1
triggerall = roundstate = 2 && power >= 1000
triggerall = random <= 500
trigger1 = stateno = 3121 && time = 50 && movehit = 1
[State -1]
type = ChangeState
value = 3400
triggerall = Var(30) >= 1
triggerall = roundstate = 2 && power >= 1000
triggerall = numtarget > 0
trigger1 = stateno = 3004 && time > 5 && p2bodydist Y > -60 && target, vel y > 0
[State -1]
type = ChangeState
value = 3300
triggerall = Var(30) >= 1
triggerall = roundstate = 2 && power >= 1000
trigger1 = stateno = 3006 && time = 15 && movehit = 1
[State -1]
type = ChangeState
value = 3002
triggerall = Var(30) >= 1
triggerall = roundstate = 2 && power >= 1000
trigger1 = stateno = 3302 && frontedgedist < 3 && p2movetype = h && var(9) > 9 && time > 20
[State -1, Stand Light Punch]
type = ChangeState
value = 3000
triggerall = var(30) <= 0
triggerall = power >= 1000 && movecontact > 0
triggerall = command = "QCFX2_a" || command = "QCFX2_b" || command = "QCFX2_c"
trigger1 = stateno = 2300 && AnimElemNo(0) >= 26 
trigger2 = stateno = 2310 && AnimElemNo(0) >= 26 
trigger3 = stateno = 2315 && AnimElemNo(0) >= 26 
trigger4 = stateno = 2325 && AnimElemNo(0) >= 26 
[State -1, Stand Light Punch]
type = ChangeState
value = 3002
triggerall = var(30) <= 0
triggerall = power >= 1000
triggerall = command = "QCFX2_a" || command = "QCFX2_b" || command = "QCFX2_c"
trigger1 = stateno = 1201 && frontedgedist < 3
trigger2 = stateno = 1211 && frontedgedist < 3
trigger3 = stateno = 1221 && frontedgedist < 3
trigger4 = stateno = 3301 && frontedgedist < 3
trigger5 = stateno = 3302 && frontedgedist < 3
trigger6 = stateno = 3121 && frontedgedist < 3
[State -1, Stand Light Punch]
type = ChangeState
value = 3002
triggerall = var(30) <= 0
triggerall = power >= 1000
triggerall = command = "QCBX2_a" || command = "QCBX2_b" || command = "QCBX2_c"
trigger1 = stateno = 50 && backedgedist+(8*vel x) < 3
trigger2 = stateno = 46 && backedgedist+(8*vel x) < 3
[State -1, Stand Light Punch]
type = ChangeState
value = 3000
triggerall = var(30) <= 0
triggerall = power >= 1000
triggerall = command = "QCBX2_a" || command = "QCBX2_b" || command = "QCBX2_c"
trigger1 = ctrl && statetype = S
trigger2 = stateno = 200 && AnimElemNo(0) >= 3
trigger3 = stateno = 205  && AnimElemNo(0) >= 9
trigger4 = stateno = 206  && AnimElemNo(0) >= 14
trigger5 = stateno = 207  && AnimElemNo(0) >= 11
trigger6 = stateno = 210  && AnimElemNo(0) >= 17
trigger7 = stateno = 211  && AnimElemNo(0) >= 10
trigger8 = numtarget > 0
trigger8 = stateno = 3004 && target, movetype = H
trigger9 = stateno = 3430 && AnimElemNo(0) >= 2
trigger10 = stateno = 415  && AnimElemNo(0) >= 10
[State -1, Stand Light Punch]
type = ChangeState
value = 3100
triggerall = var(30) <= 0
triggerall = power >= 1000 && movecontact > 0
triggerall = command = "QCBX2_x" || command = "QCBX2_y" || command = "QCBX2_z"
trigger1 = stateno = 2300 && AnimElemNo(0) >= 26 
trigger2 = stateno = 2310 && AnimElemNo(0) >= 26 
trigger3 = stateno = 2315 && AnimElemNo(0) >= 26 
trigger4 = stateno = 2325 && AnimElemNo(0) >= 26 
[State -1, Stand Light Punch]
type = ChangeState
value = 3100
triggerall = var(30) <= 0
triggerall = power >= 1000
triggerall = command = "QCFX2_x" || command = "QCFX2_y" || command = "QCFX2_z"
trigger1 = ctrl && statetype = S
trigger2 = stateno = 200 && AnimElemNo(0) >= 3
trigger3 = stateno = 205  && AnimElemNo(0) >= 9
trigger4 = stateno = 206  && AnimElemNo(0) >= 14
trigger5 = stateno = 207  && AnimElemNo(0) >= 11
trigger6 = stateno = 210  && AnimElemNo(0) >= 17
trigger7 = stateno = 211  && AnimElemNo(0) >= 10
trigger8 = stateno = 3430 && AnimElemNo(0) >= 2
[State -1, Stand Light Punch]
type = ChangeState
value = 3400
triggerall = var(30) <= 0
triggerall = power >= 1000
triggerall = command = "QCBX2_x" || command = "QCBX2_y" || command = "QCBX2_z"
trigger1 = ctrl && statetype = S
trigger2 = stateno = 200 && AnimElemNo(0) >= 3
trigger3 = stateno = 205  && AnimElemNo(0) >= 9
trigger4 = stateno = 206  && AnimElemNo(0) >= 14
trigger5 = stateno = 207  && AnimElemNo(0) >= 11
trigger6 = stateno = 210  && AnimElemNo(0) >= 17
trigger7 = stateno = 211  && AnimElemNo(0) >= 10
trigger8 = numtarget > 0
trigger8 = stateno = 3004 && target, movetype = H
[State -1, Stand Light Punch]
type = ChangeState
value = 3400
triggerall = var(30) <= 0
triggerall = power >= 1000 && movecontact > 0
triggerall = command = "QCFX2_x" || command = "QCFX2_y" || command = "QCFX2_z"
trigger1 = stateno = 2300 && AnimElemNo(0) >= 26 
trigger2 = stateno = 2310 && AnimElemNo(0) >= 26 
trigger3 = stateno = 2315 && AnimElemNo(0) >= 26 
trigger4 = stateno = 2325 && AnimElemNo(0) >= 26 
[State -1, Stand Light Punch]
type = ChangeState
value = 3300
triggerall = var(30) <= 0
triggerall = power >= 1000
triggerall = command = "QCFX2_x" || command = "QCFX2_y" || command = "QCFX2_z"
trigger1 = ctrl && statetype = A
trigger2 = hitdefattr = A, NA && movecontact = 1
trigger3 = stateno = 1007 || stateno = 1017 || stateno = 1027 || stateno = 1101 || stateno = 1111 || stateno = 1121 || stateno = 1201 || stateno = 1211 || stateno = 1221
trigger3 = movecontact > 0
trigger4 = stateno = 3006 && movecontact > 0
trigger5 = stateno = 3121
trigger5 = movecontact > 0
:Special moves
[State -1]
type = ChangeState
value = 45
triggerall = var(30) <= 0
triggerall = command = "holdup2"
trigger1 = StateType != A
trigger1 = ctrl = 1
[State -1, Stand Light Punch]
type = ChangeState
value = 1200
triggerall = var(30) <= 0
triggerall = command = "QCF_x" && var(11) < 2
trigger1 = ctrl && statetype = A
trigger2 = hitdefattr = A, NA && movecontact = 1
trigger3 = stateno = 1007 || stateno = 1017 || stateno = 1027
trigger3 = movecontact = 1
[State -1, Stand Light Punch]
type = ChangeState
value = 1210
triggerall = var(30) <= 0
triggerall = command = "QCF_y" && var(11) < 2
trigger1 = ctrl && statetype = A
trigger2 = hitdefattr = A, NA && movecontact = 1
trigger3 = stateno = 1007 || stateno = 1017 || stateno = 1027
trigger3 = movecontact = 1
[State -1, Stand Light Punch]
type = ChangeState
value = 1220
triggerall = var(30) <= 0
triggerall = command = "QCF_z" && var(11) < 2
trigger1 = ctrl && statetype = A
trigger2 = hitdefattr = A, NA && movecontact = 1
trigger3 = stateno = 1007 || stateno = 1017 || stateno = 1027
trigger3 = movecontact = 1
[State -1, Stand Light Punch]
type = ChangeState
value = 1000
triggerall = var(30) <= 0
triggerall = command = "QCB_a"
triggerall = stateno != 252
trigger1 = ctrl && statetype = S
trigger2 = hitdefattr = C, NA && movecontact > 0
trigger3 = hitdefattr = S, NA && movecontact > 0
[State -1, Stand Light Punch]
type = ChangeState
value = 1010
triggerall = var(30) <= 0
triggerall = command = "QCB_b"
triggerall = stateno != 252
trigger1 = ctrl && statetype = S
trigger2 = hitdefattr = C, NA && movecontact > 0
trigger3 = hitdefattr = S, NA && movecontact > 0
[State -1, Stand Light Punch]
type = ChangeState
value = 1020
triggerall = var(30) <= 0
triggerall = command = "QCB_c"
triggerall = stateno != 252
trigger1 = ctrl && statetype = S
trigger2 = hitdefattr = C, NA && movecontact > 0
trigger3 = hitdefattr = S, NA && movecontact > 0
[State -1, Stand Light Punch]
type = ChangeState
value = 1002
triggerall = var(30) <= 0
triggerall = command = "QCB_a"
trigger1 = stateno = 50 && backedgedist+(8*vel x) < 3
trigger2 = stateno = 46 && backedgedist+(8*vel x) < 3
[State -1, Stand Light Punch]
type = ChangeState
value = 1012
triggerall = var(30) <= 0
triggerall = command = "QCB_b"
trigger1 = stateno = 50 && backedgedist+(8*vel x) < 3
trigger2 = stateno = 46 && backedgedist+(8*vel x) < 3
[State -1, Stand Light Punch]
type = ChangeState
value = 1022
triggerall = var(30) <= 0
triggerall = command = "QCB_c"
trigger1 = stateno = 50 && backedgedist+(8*vel x) < 3
trigger2 = stateno = 46 && backedgedist+(8*vel x) < 3
[State -1, Stand Light Punch]
type = ChangeState
value = 1300
triggerall = var(30) <= 0
triggerall = command = "QCF_a"
triggerall = stateno != 252
trigger1 = ctrl && statetype = S
trigger2 = hitdefattr = C, NA && movecontact > 0
trigger3 = hitdefattr = S, NA && movecontact > 0
[State -1, Stand Light Punch]
type = ChangeState
value = 1310
triggerall = var(30) <= 0
triggerall = command = "QCF_b"
triggerall = stateno != 252
trigger1 = ctrl && statetype = S
trigger2 = hitdefattr = C, NA && movecontact > 0
trigger3 = hitdefattr = S, NA && movecontact > 0
[State -1, Stand Light Punch]
type = ChangeState
value = 1320
triggerall = var(30) <= 0
triggerall = command = "QCF_c"
triggerall = stateno != 252
trigger1 = ctrl && statetype = S
trigger2 = hitdefattr = C, NA && movecontact > 0
trigger3 = hitdefattr = S, NA && movecontact > 0
[State -1, Stand Light Punch]
type = ChangeState
value = 2300
triggerall = var(30) <= 0
triggerall = command = "QCB_x"
trigger1 = ctrl && statetype = S
trigger2 = stateno = 200 && AnimElemNo(0) >= 3
trigger3 = stateno = 205  && AnimElemNo(0) >= 9
trigger4 = stateno = 206  && AnimElemNo(0) >= 14
trigger5 = stateno = 207  && AnimElemNo(0) >= 11
trigger6 = stateno = 210  && AnimElemNo(0) >= 17
trigger7 = stateno = 211  && AnimElemNo(0) >= 10
trigger8 = hitdefattr = C, NA && movecontact > 0
trigger9 = stateno=  400 && AnimElemNo(0) >= 5
trigger10 = stateno=  430 && AnimElemNo(0) >= 6
trigger11 = stateno=  410 && AnimElemNo(0) >= 11
trigger12 = stateno=  440 && AnimElemNo(0) >= 9
trigger13 = stateno=  415 && AnimElemNo(0) >= 12
trigger14 = stateno=  450 && AnimElemNo(0) >= 7
[State -1, Stand Light Punch]
type = ChangeState
value = 2310
triggerall = var(30) <= 0
triggerall = command = "QCB_y"
trigger1 = ctrl && statetype = S
trigger2 = stateno = 200 && AnimElemNo(0) >= 3
trigger3 = stateno = 205  && AnimElemNo(0) >= 9
trigger4 = stateno = 206  && AnimElemNo(0) >= 14
trigger5 = stateno = 207  && AnimElemNo(0) >= 11
trigger6 = stateno = 210  && AnimElemNo(0) >= 17
trigger7 = stateno = 211  && AnimElemNo(0) >= 10
trigger8 = hitdefattr = C, NA && movecontact > 0
trigger9 = stateno=  400 && AnimElemNo(0) >= 5
trigger10 = stateno=  430 && AnimElemNo(0) >= 6
trigger11 = stateno=  410 && AnimElemNo(0) >= 11
trigger12 = stateno=  440 && AnimElemNo(0) >= 9
trigger13 = stateno=  415 && AnimElemNo(0) >= 12
trigger14 = stateno=  450 && AnimElemNo(0) >= 7
[State -1, Stand Light Punch]
type = ChangeState
value = 2315
triggerall = var(30) <= 0
triggerall = command = "QCB_z"
trigger1 = ctrl && statetype = S
trigger2 = stateno = 200 && AnimElemNo(0) >= 3
trigger3 = stateno = 205  && AnimElemNo(0) >= 9
trigger4 = stateno = 206  && AnimElemNo(0) >= 14
trigger5 = stateno = 207  && AnimElemNo(0) >= 11
trigger6 = stateno = 210  && AnimElemNo(0) >= 17
trigger7 = stateno = 211  && AnimElemNo(0) >= 10
trigger8 = hitdefattr = C, NA && movecontact > 0
trigger9 = stateno=  400 && AnimElemNo(0) >= 5
trigger10 = stateno=  430 && AnimElemNo(0) >= 6
trigger11 = stateno=  410 && AnimElemNo(0) >= 11
trigger12 = stateno=  440 && AnimElemNo(0) >= 9
trigger13 = stateno=  415 && AnimElemNo(0) >= 12
trigger14 = stateno=  450 && AnimElemNo(0) >= 7
[State -1, Stand Light Punch]
type = ChangeState
value = 1120
triggerall = var(30) <= 0
triggerall = command = "upper_z"
trigger1 = ctrl && statetype = S
trigger2 = stateno = 200 && AnimElemNo(0) >= 3
trigger3 = stateno = 205  && AnimElemNo(0) >= 9
trigger4 = stateno = 206  && AnimElemNo(0) >= 14
trigger5 = stateno = 207  && AnimElemNo(0) >= 11
trigger6 = stateno = 210  && AnimElemNo(0) >= 17
trigger7 = stateno = 211  && AnimElemNo(0) >= 10
trigger8 = hitdefattr = C, NA && movecontact > 0
trigger9 = stateno=  400 && AnimElemNo(0) >= 5
trigger10 = stateno=  430 && AnimElemNo(0) >= 6
trigger11 = stateno=  410 && AnimElemNo(0) >= 11
trigger12 = stateno=  440 && AnimElemNo(0) >= 9
trigger13 = stateno=  415 && AnimElemNo(0) >= 12
trigger14 = stateno=  450 && AnimElemNo(0) >= 7
[State -1, Stand Light Punch]
type = ChangeState
value = 1100
triggerall = var(30) <= 0
triggerall = command = "upper_x"
trigger1 = ctrl && statetype = S
trigger2 = stateno = 200 && AnimElemNo(0) >= 3
trigger3 = stateno = 205  && AnimElemNo(0) >= 9
trigger4 = stateno = 206  && AnimElemNo(0) >= 14
trigger5 = stateno = 207  && AnimElemNo(0) >= 11
trigger6 = stateno = 210  && AnimElemNo(0) >= 17
trigger7 = stateno = 211  && AnimElemNo(0) >= 10
trigger8 = hitdefattr = C, NA && movecontact > 0
trigger9 = stateno=  400 && AnimElemNo(0) >= 5
trigger10 = stateno=  430 && AnimElemNo(0) >= 6
trigger11 = stateno=  410 && AnimElemNo(0) >= 11
trigger12 = stateno=  440 && AnimElemNo(0) >= 9
trigger13 = stateno=  415 && AnimElemNo(0) >= 12
trigger14 = stateno=  450 && AnimElemNo(0) >= 7
[State -1, Stand Light Punch]
type = ChangeState
value = 1110
triggerall = var(30) <= 0
triggerall = command = "upper_y"
trigger1 = ctrl && statetype = S
trigger2 = stateno = 200 && AnimElemNo(0) >= 3
trigger3 = stateno = 205  && AnimElemNo(0) >= 9
trigger4 = stateno = 206  && AnimElemNo(0) >= 14
trigger5 = stateno = 207  && AnimElemNo(0) >= 11
trigger6 = stateno = 210  && AnimElemNo(0) >= 17
trigger7 = stateno = 211  && AnimElemNo(0) >= 10
trigger8 = hitdefattr = C, NA && movecontact > 0
trigger9 = stateno=  400 && AnimElemNo(0) >= 5
trigger10 = stateno=  430 && AnimElemNo(0) >= 6
trigger11 = stateno=  410 && AnimElemNo(0) >= 11
trigger12 = stateno=  440 && AnimElemNo(0) >= 9
trigger13 = stateno=  415 && AnimElemNo(0) >= 12
trigger14 = stateno=  450 && AnimElemNo(0) >= 7
[State -1, Charge]
type = ChangeState
value = 1400
triggerall = var(30) <= 0
triggerall = command = "hold_y"
triggerall = command = "hold_b"
triggerall = var(23) <= 0
trigger1 = statetype = S
trigger1 = ctrl
[State -1, Run Fwd]
type = ChangeState
value = 100
triggerall = var(30) <= 0
trigger1 = command = "FF"
trigger1 = statetype = S
trigger1 = ctrl
[State -1, Run Back]
type = ChangeState
value = 105
triggerall = var(30) <= 0
trigger1 = command = "BB"
trigger1 = statetype = S
trigger1 = ctrl
[State -1, Back flip]
type = ChangeState
value = 60
triggerall = var(30) <= 0
triggerall = command = "a"
triggerall = command = "x"
triggerall = command = "holdback"
trigger1 = statetype = S
trigger1 = ctrl
[State -1, Back flip]
type = ChangeState
value = 61
triggerall = var(30) <= 0
triggerall = command = "a"
triggerall = command = "x"
triggerall = command != "holdback"
trigger1 = statetype = S
trigger1 = ctrl
[State -1, Kung Fu Throw]
type = ChangeState
value = 800
triggerall = var(30) <= 0
triggerall = command = "y"
triggerall = command = "x" ^^ command = "z"
triggerall = statetype = S
triggerall = stateno != 100
trigger1 = ctrl
[State -1, Kung Fu Throw]
type = ChangeState
value = 900
triggerall = var(30) <= 0
triggerall = command = "b"
triggerall = command = "a" ^^ command = "c"
triggerall = statetype = S
triggerall = ctrl
triggerall = stateno != 100
trigger1 = ctrl
[State -1, Stand Light Punch]
type = ChangeState
value = 205
triggerall = var(30) <= 0
triggerall = command = "x"
triggerall = command = "holdfwd"
triggerall = command != "holddown"
trigger1 = stateno = 200 && time > 3
trigger2 = statetype = S
trigger2 = ctrl
ignorehitpause = 1
[State -1, Stand Light Punch]
type = ChangeState
value = 200
triggerall = var(30) <= 0
triggerall = command = "x"
triggerall = command != "holdfwd"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 200
trigger2 = time > 12 && movecontact = 0
trigger3 = stateno = 230 && movecontact = 1 && prevstateno != 200
[State -1, Stand Light Punch]
type = ChangeState
value = 207
triggerall = var(30) <= 0
triggerall = command = "y"
triggerall = command = "holdfwd"
triggerall = command != "holddown"
trigger1 = stateno = 206  && time > 20
trigger2 = statetype = S
trigger2 = ctrl
ignorehitpause = 1
[State -1, Stand Light Punch]
type = ChangeState
value = 206
triggerall = var(30) <= 0
triggerall = command = "y"
triggerall = command != "holdfwd"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 205 && time > 7
ignorehitpause = 1
[State -1, Stand Strong Punch]
type = ChangeState
value = 211
triggerall = var(30) <= 0
triggerall = command = "z"
triggerall = command = "holdfwd"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 210  && time > 17
ignorehitpause = 1
[State -1, Stand Strong Punch]
type = ChangeState
value = 210
triggerall = var(30) <= 0
triggerall = command = "z"
triggerall = command != "holdfwd"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 207  && time > 12
ignorehitpause = 1
[State -1, Stand Light Kick]
type = ChangeState
value = 250
triggerall = var(30) <= 0
triggerall = command = "a"
triggerall = command = "holdup"
trigger1 = stateno = 241  && movecontact > 0 && animelemno(0) = 15 && var(13) = 6
[State -1, Stand Light Kick]
type = ChangeState
value = 251
triggerall = var(30) <= 0
triggerall = command = "b"
triggerall = command = "holddown"
trigger1 = stateno = 250  && movecontact > 0 && animelemno(0) = 8
[State -1, Stand Light Kick]
type = ChangeState
value = 252
triggerall = var(30) <= 0
triggerall = command = "c"
triggerall = command = "holdup"
trigger1 = stateno = 251  && movecontact > 0 && animelemno(0) = 8
[State -1, Stand Light Kick]
type = ChangeState
value = 235
triggerall = var(30) <= 0
triggerall = command = "a"
triggerall = command = "holdfwd"
triggerall = command != "holddown"
trigger1 = ctrl && statetype = S
trigger2 = stateno = 230  && movecontact > 0 && animelemno(0) = 5 && var(13) = 1
ignorehitpause = 1
[State -1, Stand Light Kick]
type = ChangeState
value = 230
triggerall = var(30) <= 0
triggerall = command = "a"
triggerall = command != "holdfwd"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
[State -1, Stand Light Kick]
type = ChangeState
value = 237
triggerall = var(30) <= 0
triggerall = command = "b"
triggerall = command = "holdfwd"
triggerall = command != "holddown"
trigger1 = ctrl && statetype = S
trigger2 = stateno = 236  && movecontact > 0 && animelemno(0) = 7 && var(13) = 3
ignorehitpause = 1
[State -1, Stand Light Kick]
type = ChangeState
value = 236
triggerall = var(30) <= 0
triggerall = command = "b"
triggerall = command != "holdfwd"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 235  && movecontact > 0 && animelemno(0) = 5&& var(13) = 2
ignorehitpause = 1
[State -1, Stand Light Kick]
type = ChangeState
value = 241
triggerall = var(30) <= 0
triggerall = command = "c"
triggerall = command = "holdfwd"
triggerall = command != "holddown"
trigger1 = ctrl && statetype = S
trigger2 = stateno = 240  && movecontact > 0 && animelemno(0) = 10 && var(13) = 5
ignorehitpause = 1
[State -1, Standing Strong Kick]
type = ChangeState
value = 240
triggerall = var(30) <= 0
triggerall = command = "c"
triggerall = command != "holdfwd"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 237 && movecontact > 0 && animelemno(0) = 13 && var(13) = 4
ignorehitpause = 1
[State -1, Taunt]
type = ChangeState
value = 195
triggerall = var(30) <= 0
triggerall = command = "start"
trigger1 = statetype != A
trigger1 = ctrl
[State -1, Crouching Light Punch]
type = ChangeState
value = 400
triggerall = var(30) <= 0
triggerall = command = "x"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = stateno = 430 && movecontact = 1 && prevstateno != 430
[State -1, Crouching Strong Punch]
type = ChangeState
value = 415
triggerall = var(30) <= 0
triggerall = command = "z"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = stateno = 400 && AnimElemNo(0) >= 3
trigger3 = stateno = 410 && AnimElemNo(0) >= 10
trigger4 = stateno = 430 && AnimElemNo(0) >= 4
[State -1, Crouching Strong Punch]
type = ChangeState
value = 410
triggerall = var(30) <= 0
triggerall = command = "y"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = stateno = 400 && AnimElemNo(0) >= 3
trigger3 = stateno = 430 && AnimElemNo(0) >= 4
[State -1, Crouching Light Kick]
type = ChangeState
value = 430
triggerall = var(30) <= 0
triggerall = command = "a"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = stateno = 400 && AnimElemNo(0) >= 3
[State -1, Crouching Strong Kick]
type = ChangeState
value = 450
triggerall = var(30) <= 0
triggerall = command = "c"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = stateno = 400 && AnimElemNo(0) >= 3
trigger3 = stateno = 430 && AnimElemNo(0) >= 4
trigger4 = stateno = 440 && AnimElemNo(0) >= 8
[State -1, Crouching Strong Kick]
type = ChangeState
value = 440
triggerall = var(30) <= 0
triggerall = command = "b"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = stateno = 400 && AnimElemNo(0) >= 3
trigger3 = stateno = 430 && AnimElemNo(0) >= 4
[State -1, Jump Light Punch]
type = ChangeState
value = 605
triggerall = var(30) <= 0
triggerall = command = "y"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 =  stateno = 630 
trigger2 = movecontact > 0
[State -1, Jump Light Punch]
type = ChangeState
value = 600
triggerall = var(30) <= 0
triggerall = command = "x"
trigger1 = statetype = A
trigger1 = ctrl
[State -1, Jump Strong Punch]
type = ChangeState
value = 610
triggerall = var(30) <= 0
triggerall = command = "z"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 ||stateno = 605 || stateno = 630 || stateno = 635
trigger2 = movecontact > 0
[State -1, Jump Strong Kick]
type = ChangeState
value = 645
triggerall = var(30) <= 0
triggerall = command = "holddown"
triggerall = command = "b"
triggerall = var(10) < 3
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 ||stateno = 605 || stateno = 630 || stateno = 635
trigger2 = movecontact > 0
[State -1, Jump Light Kick]
type = ChangeState
value = 635
triggerall = var(30) <= 0
triggerall = command = "b"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 605 
trigger2 = movecontact > 0
[State -1, Jump Light Kick]
type = ChangeState
value = 630
triggerall = var(30) <= 0
triggerall = command = "a"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600
trigger2 = movecontact > 0
[State -1, Jump Strong Kick]
type = ChangeState
value = 640
triggerall = var(30) <= 0
triggerall = command = "c"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 ||stateno = 605 || stateno = 630 || stateno = 635 || stateno = 610
trigger2 = movecontact > 0