; _____________________________________
;| Shin Gouki by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==============================================================================================
;=======================================<COMMON STATES>========================================
;==============================================================================================

;====================<STANDING>====================
[Statedef 0]
type = S
physics = S
movetype = I
velset = 0, 0
sprpriority = 0

[State 0, Gone]
type = removeexplod
trigger1 = ishelper
[State 0, Gone]
type = destroyself
trigger1 = ishelper

[State 0, Anim]
type = changeanim
trigger1 = anim != 0 && anim != 5
trigger2 = anim = 5 && !animtime
value = 0

[State 0, Dead]
type = changestate
trigger1 = !alive
value = 5050


;====================<CROUCHING>====================
[Statedef 10]
type = C
physics = C
movetype = I
velset = 0, 0
sprpriority = 0

[State 10, No walking]
type = assertspecial
trigger1 = 1
flag = nowalk

[State 10, Anim]
type = changeanim
trigger1 = !time && anim = 12
value = 10
elem = 3 -animelemno(0)

[State 10, Anim]
type = changeanim
trigger1 = anim != 10
value = 10

[State 10, End]
type = selfstate
trigger1 = !animtime
value = 11


[Statedef 11]
type = C
physics = C
movetype = I
anim = 11
velset = 0, 0
sprpriority = 0

[State 11, No walking]
type = assertspecial
trigger1 = 1
flag = nowalk

[State 11, Anim]
type = changeanim
trigger1 = anim = 6 && !animtime
value = 11


[Statedef 12]
type = S
physics = S
movetype = I
velset = 0, 0
sprpriority = 0

[State 12, No walking]
type = assertspecial
trigger1 = 1
flag = nowalk

[State 12, Anim]
type = changeanim
trigger1 = !time && anim = 10
value = 12
elem = 3 -animelemno(0)

[State 12, Anim]
type = changeanim
trigger1 = anim != 12
value = 12

[State 12, End]
type = selfstate
trigger1 = command = "holddown" && command != "holdup"
value = 10

[State 12, End]
type = selfstate
trigger1 = !animtime
value = 0


;====================<WALKING>====================
[Statedef 20]
type = S
physics = S
movetype = I
sprpriority = 0

[State 20, Vel]
type = velset
trigger1 = command = "holdfwd"
x = const(velocity.walk.fwd.x)

[State 20, Vel]
type = velset
trigger1 = command = "holdback"
x = const(velocity.walk.back.x)

[State 20, Anim]
type = changeanim
triggerall = vel x > 0
trigger1 = anim != 20 && anim != 5
trigger2 = anim = 5 && animelemtime(1) >= 1
value = 20

[State 20, Anim]
type = changeanim
triggerall = vel x < 0
trigger1 = anim != 21 && anim != 5
trigger2 = anim = 5 && animelemtime(1) >= 1
value = 21


;===================<JUMPING>================
[Statedef 40]
type = S
physics = S
movetype = I
anim = 40
ctrl = 0
velset = 0, 0
sprpriority = 1
facep2 = (prevstateno != 100)

[State 40, Keyboard Check]
type = changestate
trigger1 = !time
trigger1 = !AIlevel
trigger1 = prevstateno = 52
trigger1 = command = "holddown" && command = "holdup"
value = 10
ctrl = 1

[State 40, Direction]
type = varset
trigger1 = !time
sysvar(1) = 0

[State 40, Direction]
type = varset
trigger1 = !AIlevel
trigger1 = time >= 1
trigger1 = command = "holdfwd" || command = "holdback"
sysvar(1) = (command = "holdfwd") - (command = "holdback")
persistent = 0

[State 40, Direction]
type = varset
trigger1 = AIlevel
sysvar(1) = ifelse((enemynear, movetype != A || backedgebodydist <= 10), 1, ifelse((enemynear, movetype = A), -1, 0))

[State 40, High Jump]
type = varset
trigger1 = !time
var(3) = 0

[State 40, High Jump]
type = varset
trigger1 = !time && !AIlevel
trigger1 = var(2)
var(3) = 3

[State 40, High Jump]
type = varset
trigger1 = !time && AIlevel
trigger1 = fvar(16) >= 160 || random < 125
var(3) = 3

[State 40, Running Jump]
type = varset
trigger1 = prevstateno = 100
var(3) = 3
[State 40, Running Jump]
type = varset
trigger1 = prevstateno = 100
sysvar(1) = 1

[State 40, Low Jump]
type = varset
trigger1 = !AIlevel && command != "holdup" && (var(3) != [1, 2])
var(3) = ifelse((var(3) = 3 && sysvar(1)), 2, 1)
[State 40, Low Jump]
type = varset
trigger1 = AIlevel && (var(3) != [1, 2])
trigger1 = (enemynear, statetype = C) && random < 500
var(3) = ifelse((var(3) = 3 && sysvar(1)), 2, 1)

[State 40, Jump Cancel]
type = varset
trigger1 = prevstateno = 420
var(3) = 3

[State 40, Jump Cancel]
type = varset
trigger1 = prevstateno = 420
var(15) = 0

[State 40, Snd]
type = playsnd
trigger1 = !animtime
value = 0, ifelse((var(3) = [2, 3]), 41, 40)

[State 40, Dust]
type = helper
trigger1 = !animtime
helpertype = normal
stateno = 7100
ID = 7100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 40, Vel Normal]
type = velset
trigger1 = !animtime
x = ifelse(!sysvar(1), const(velocity.jump.neu.x), ifelse(sysvar(1) = 1, const(velocity.jump.fwd.x), const(velocity.jump.back.x)))
y = const(velocity.jump.y)

[State 40, Vel Short]
type = velset
trigger1 = !animtime && var(3) = 1
x = ifelse(!sysvar(1), const(velocity.jump.neu.x), ifelse(sysvar(1) = 1, const(velocity.jump.fwd.x), const(velocity.jump.back.x)))
y = 0.76 * const(velocity.jump.y)

[State 40, Vel Medium]
type = velset
trigger1 = !animtime && var(3) = 2
x = ifelse(!sysvar(1), const(velocity.jump.neu.x), ifelse(sysvar(1) = 1, const(velocity.runjump.fwd.x), const(velocity.runjump.back.x)))
y = 0.76 * const(velocity.jump.y)

[State 40, Vel Long]
type = velset
trigger1 = !animtime && var(3) = 3
x = ifelse(!sysvar(1), const(velocity.jump.neu.x), ifelse(sysvar(1) = 1, const(velocity.runjump.fwd.x), const(velocity.runjump.back.x)))
y = ifelse(!sysvar(1), const(velocity.runjump.y), const(velocity.jump.y))

[State 40, End]
type = selfstate
trigger1 = !animtime
value = 50
ctrl = 1


[Statedef 50]
type = A
physics = N
movetype = I
sprpriority = 1

[State 50, Anim]
type = changeanim
trigger1 = !time
value = ifelse(!vel x, 41, ifelse(vel x > 0, 42, 43)) + 10 * (var(3) = [1, 2])
persistent = 0

[State 50, No Guard]
type = assertspecial
trigger1 = var(3) = [1, 2]
flag = noairguard

[State 50, Grounded Frame]
type = posfreeze
trigger1 = time < 1 && prevstateno = 40
value = 1

[State 50, Accel]
type = gravity
trigger1 = time >= 1 || prevstateno != 40

[State 50, Land]
type = changestate
trigger1 = vel y > 0 && (pos y > -vel y)
value = 52


[Statedef 51]
type = A
physics = N
movetype = I
sprpriority = 1

[State 51, Accel]
type = gravity
trigger1 = 1

[State 51, Land]
type = selfstate
trigger1 = vel y > 0 && (pos y > -vel y)
value = 52


[Statedef 52]
type = S
physics = S
movetype = I
anim = 47
ctrl = 0
sprpriority = 1

[State 52, Anim 48]
type = changeanim
triggerall = !time
trigger1 = vel y >= (-1.05 * const(velocity.jump.y))
trigger2 = vel x >= (1.25 * const(velocity.jump.fwd.x))
trigger3 = vel x <= (1.25 * const(velocity.jump.back.x))
value = 48

[State 52, Anim 57]
type = changeanim
trigger1 = !time && (var(3) = [1, 2])
trigger1 = (prevstateno = [600, 699])
value = 57

[State 52, Anim 48]
type = changeanim
trigger1 = !time && prevstateno = 645
value = 48

[State 52, Stop]
type = velset
trigger1 = 1
x = 0
y = 0

[State 52, Pos]
type = posset
trigger1 = 1
y = 0

[State 52, Ctrl]
type = ctrlset
trigger1 = !time && (prevstateno != [600, 699])
trigger2 = time = 1 && anim != 57
value = 1

[State 52, Guard]
type = changestate
trigger1 = var(20) <= 0
trigger1 = ctrl && command = "holdback"
trigger1 = inguarddist && (prevstateno != [600, 699])
value = 120

[State 52, No Walk]
type = assertspecial
trigger1 = anim != 5
flag = nowalk

[State 52, Snd]
type = playsnd
trigger1 = !time
value = 0, 52

[State 52, Dust]
type = explod
trigger1 = !time
anim = 7102
sprpriority = -5
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 52, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<RUN>===========================
[Statedef 100]
type = S
movetype = I
physics = S
velset = 0, 0
anim = 100
ctrl = 0
sprpriority = 1

[State 100, Snd]
type = playsnd
trigger1 = !time
value = 0, 100

[State 100, Dust]
type = helper
trigger1 = !time
helpertype = normal
stateno = 7104
ID = 7100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 100, Pos]
type = posset
trigger1 = 1
y = 0
[State 100, Vel]
type = velset
trigger1 = 1
x = const(velocity.run.fwd.x)

[State 100, steps]
type = playsnd
trigger1 = anim = 100 && (animelem = 3 || animelem = 6)
value = 0, ifelse((animelem = 3), 103, 106)

[State 100, Jump]
type = changestate
trigger1 = !AIlevel
trigger1 = command = "holdfwd" && command = "holdup"
value = 40
[State 100, Jump]
type = changestate
trigger1 = AIlevel && random < 25
value = 40

[State 100, End]
type = changestate
triggerall = time >= 9
trigger1 = !AIlevel
trigger1 = command != "holdfwd" || command = "holdback"
trigger2 = AIlevel && (p2movetype = A || p2dist x < 80)
trigger3 = p2dist x < -const(size.ground.back)
value = 101


;--- STOP ---
[Statedef 101]
type = S
physics = S
movetype = I
anim = 101
ctrl = 0
sprpriority = 1

[State 101, Snd]
type = playsnd
trigger1 = !time
value = 0, 101

[State 101, Dust]
type = explod
trigger1 = !time
anim = 7103
sprpriority = 3
postype = p1
pos = 0, 0
vel = 0, 0
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 101, Jump]
type = changestate
trigger1 = !AIlevel && command = "holdup"
value = 40
[State 101, End]
type = changestate
trigger1 = !animtime
value = ifelse(command = "holddown", 10, 0)
ctrl = 1


;========================<FORWARD DASH>==========================
[Statedef 102]
type = S
movetype = I
physics = S
velset = 0, 0
anim = 102
ctrl = 0
sprpriority = 1

[State 102, Run]
type = varset
trigger1 = !time
sysvar(1) = 1

[State 102, Run]
type = varset
triggerall = time <= 5
trigger1 = !AIlevel && command != "holdfwd"
trigger2 = AIlevel && fvar(16) < 120
sysvar(1) = 0

[State 102, Run]
type = changestate
trigger1 = time = 5 && sysvar(1)
value = 100

[State 102, Freeze]
type = changeanim
trigger1 = time <= 1
trigger2 = time < 5
trigger2 = sysvar(1) = 1
value = 102
elem = 1

[State 102, Vel]
type = velset
trigger1 = animelem = 2
x = -1.2 * const(velocity.run.back.x)
y = const(velocity.run.back.y)

[State 102, Snd]
type = playsnd
trigger1 = animelem = 2
value = 0, 102

[State 102, Dust]
type = helper
trigger1 = animelem = 2
helpertype = normal
stateno = 7104
ID = 7100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 102, End]
type = changestate
trigger1 = !animtime
value = 103


;--- LAND ---
[Statedef 103]
type = S
physics = S
ctrl = 1
anim = 103
velset = 0, 0

[State 103, Pos]
type = posset
trigger1 = 1
y = 0

[State 103, Snd]
type = playsnd
trigger1 = !time
value = 0, 103

[State 103, Dust]
type = explod
trigger1 = !time
anim = 7102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 103, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;========================<BACK DASH>==========================
[Statedef 105]
type = A
movetype = I
physics = S
velset = 0, 0
anim = 105
ctrl = 0
sprpriority = 1

[State 105, Vel]
type = velset
trigger1 = animelem = 2
x = const(velocity.run.back.x)
y = const(velocity.run.back.y)

[State 105, Snd]
type = playsnd
trigger1 = animelem = 2
value = 0, 105

[State 105, Dust]
type = helper
trigger1 = animelem = 2
helpertype = normal
stateno = 7104
ID = 7100
name = "Dash Dust"
postype = p1
facing = -1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 105, End]
type = changestate
trigger1 = !animtime
value = 106


;--- LAND ---
[Statedef 106]
type = S
physics = S
ctrl = 0
anim = 106
velset = 0, 0

[State 106, Pos]
type = posset
trigger1 = 1
y = 0

[State 106, Snd]
type = playsnd
trigger1 = !time
value = 0, 106

[State 106, Dust]
type = explod
trigger1 = !time
anim = 7102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 106, Ctrl]
type = ctrlset
trigger1 = time >= 2
value = 1

[State 106, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;========================<GUARD>========================
;--- START ---
[Statedef 120]
type = U
physics = U
anim = 120 + (statetype = C) + (statetype = A) * 2

[State 120, Type]
type = statetypeset
trigger1 = !time && statetype = S
physics = S

[State 120, Type]
type = statetypeset
trigger1 = !time && statetype = C
physics = C

[State 120, Type]
type = statetypeset
trigger1 = !time && statetype = A
physics = A

[State 120, Vel]
type = velset
trigger1 = !time && statetype != A
x = 0
y = 0

[State 120, High to Low]
type = statetypeset
trigger1 = !AIlevel && statetype = S && command = "holddown"
trigger2 = AIlevel && numenemy
trigger2 = statetype = S && (enemynear, movetype = A)
trigger2 = (enemynear, statetype = C) || (enemynear, hitdefattr = C, AA, AP)
statetype = C
physics = C

[State 120, Low to High]
type = statetypeset
trigger1 = !AIlevel && statetype = C && command != "holddown"
trigger2 = AIlevel && numenemy
trigger2 = statetype = C && (enemynear, movetype = A)
trigger2 = !(enemynear, statetype = C) && !(enemynear, hitdefattr = C, AA, AP)
statetype = S
physics = S

[State 120, End]
type = changestate
trigger1 = !animtime || AIlevel
value = 130 + (statetype = C) + (statetype = A) * 2

[State 120, Stop Guarding]
type = changestate
trigger1 = !inguarddist
trigger2 = !AIlevel
trigger2 = p2dist x >= 0
trigger2 = command != "holdback" || command = "holdfwd"
trigger3 = !AIlevel
trigger3 = p2dist x < 0
trigger3 = command != "holdfwd" || command = "holdback"
trigger4 = AIlevel && numenemy
trigger4 = enemynear, hitdefattr = SCA, AT
value = 140

[State 120, No Walking]
type = assertspecial
triggerall = ctrl
trigger1 = p2dist x >= 0
trigger1 = command != "holdfwd"
trigger2 = p2dist x < 0
trigger2 = command != "holdback"
flag = nowalk


;--- STAND GUARD (Guarding) ---
[Statedef 130]
type = S
physics = S

[State 130, Anim]
type = changeanim
trigger1 = anim != 130
value = 130

[State 130, AI fix]
type = changestate
trigger1 = AIlevel && numenemy
trigger1 = time >= 120 || enemynear, time >= 60
trigger1 = random < 17
value = 40

[State 130, Snd]
type = playsnd
trigger1 = !time
trigger1 = prevstateno = 132 || (prevstateno = [154, 155])
value = 0, 52

[State 130, Dust]
type = explod
trigger1 = !time
trigger1 = prevstateno = 132 || (prevstateno = [154, 155])
anim = 7102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 130, High to Low]
type = changestate
trigger1 = !AIlevel && command = "holddown"
trigger2 = AIlevel && numenemy
trigger2 = (enemynear, movetype = A) && random < (250 * (AIlevel ** 2 / 64.0))
trigger2 = (enemynear, statetype = C) || (enemynear, hitdefattr = C, AA, AP)
value = 131

[State 130, Stop Guarding]
type = changestate
trigger1 = !inguarddist
trigger2 = !AIlevel
trigger2 = p2dist x >= 0
trigger2 = command != "holdback" || command = "holdfwd"
trigger3 = !AIlevel
trigger3 = p2dist x < 0
trigger3 = command != "holdfwd" || command = "holdback"
trigger4 = AIlevel && numenemy
trigger4 = enemynear, hitdefattr = SCA, AT
value = 140

[State 130, No Walking]
type = assertspecial
triggerall = ctrl
trigger1 = p2dist x >= 0
trigger1 = command != "holdfwd"
trigger2 = p2dist x < 0
trigger2 = command != "holdback"
flag = nowalk


;--- CROUCH GUARD (Guarding) ---
[Statedef 131]
type = C
physics = C

[State 131, Anim]
type = changeanim
trigger1 = anim != 131
value = 131

[State 131, Low to High]
type = changestate
trigger1 = !AIlevel && command != "holddown"
trigger2 = AIlevel && numenemy
trigger2 = (enemynear, movetype = A) && random < (125 * (AIlevel ** 2 / 64.0))
trigger2 = !(enemynear, statetype = C) && !(enemynear, hitdefattr = C, AA, AP)
value = 130

[State 131, AI fix]
type = changestate
trigger1 = AIlevel && numenemy
trigger1 = time >= 120 || enemynear, time >= 60
trigger1 = random < 17
value = 40

[State 131, Stop Guarding]
type = changestate
trigger1 = !inguarddist
trigger2 = !AIlevel
trigger2 = p2dist x >= 0
trigger2 = command != "holdback" || command = "holdfwd"
trigger3 = !AIlevel
trigger3 = p2dist x < 0
trigger3 = command != "holdfwd" || command = "holdback"
trigger4 = AIlevel && numenemy
trigger4 = enemynear, hitdefattr = SCA, AT
value = 140


;--- AIR GUARD (Guarding) ---
[Statedef 132]
type = A
physics = N

[State 132, Anim]
type = changeanim
trigger1 = anim != 132
value = 132

[State 132, Accel]
type = veladd
trigger1 = 1
y = const(movement.yaccel)

[State 132, Var]
type = varset
trigger1 = 1
sysvar(0) = (vel y > 0 && (pos y > -vel y))

[State 132, Vel]
type = velset
trigger1 = sysvar(0)
y = 0

[State 132, Pos]
type = posset
trigger1 = sysvar(0)
y = 0

[State 132, End]
type = changestate
triggerall = sysvar(0) && inguarddist
trigger1 = !AIlevel
trigger1 = ifelse(p2dist x < 0, command = "holdfwd", command = "holdback")
trigger2 = AIlevel
value = 130

[State 132, End]
type = changestate
trigger1 = sysvar(0)
value = 52

;[State 132, Stop guarding was here]


;--- GUARD (End) ---
[Statedef 140]
type = U
physics = U
ctrl = 1

[State 140, Anim]
type = changeanim
trigger1 = !time
value = 140 + (statetype = C) + (statetype = A) * 2

[State 140, Type]
type = statetypeset
trigger1 = !time && statetype = S
physics = S

[State 140, Type]
type = statetypeset
trigger1 = !time && statetype = C
physics = C

[State 140, Type]
type = statetypeset
trigger1 = !time && statetype = A
physics = A

[State 140, High to Low]
type = statetypeset
trigger1 = !AIlevel && statetype = S && command = "holddown"
trigger2 = AIlevel && numenemy
trigger2 = statetype = S && (enemynear, movetype = A) && random < (250 * (AIlevel ** 2 / 64.0))
trigger2 = (enemynear, statetype = C) || (enemynear, hitdefattr = C, AA, AP)
statetype = C
physics = C

[State 140, Low to High]
type = statetypeset
trigger1 = !AIlevel && statetype = C && command != "holddown"
trigger2 = AIlevel && numenemy
trigger2 = statetype = C && (enemynear, movetype = A) && random < (125 * (AIlevel ** 2 / 64.0))
trigger2 = !(enemynear, statetype = C) && !(enemynear, hitdefattr = C, AA, AP)
statetype = S
physics = S

[State 140, No Walking]
type = assertspecial
triggerall = ctrl
trigger1 = p2dist x >= 0
trigger1 = command != "holdfwd"
trigger2 = p2dist x < 0
trigger2 = command != "holdback"
flag = nowalk

[State 140, End]
type = changestate
trigger1 = !animtime
value = (statetype = C) * 11 + (statetype = A) * 51


;--- STAND GUARD HIT (Shaking) ---
[Statedef 150]
type = S
movetype = H
physics = N
velset = 0, 0

[State 150, Anim]
type = changeanim
trigger1 = 1
value = 150

[State 150, End]
type = changestate
trigger1 = hitshakeover
value = 151 + 2 * ((!AIlevel && command = "holddown") || (AIlevel && (enemynear, movetype = A) && (enemynear, statetype = C)))

[State 150, High to Low]
type = statetypeset
trigger1 = !AIlevel && statetype = S && command = "holddown"
trigger2 = AIlevel && numenemy
trigger2 = statetype = S && (enemynear, movetype = A) && random < (250 * (AIlevel ** 2 / 64.0))
trigger2 = (enemynear, statetype = C) || (enemynear, hitdefattr = C, AA, AP)
statetype = C
physics = C

[State 150, Low to High]
type = statetypeset
trigger1 = !AIlevel && statetype = C && command != "holddown"
trigger2 = AIlevel && numenemy
trigger2 = statetype = C && (enemynear, movetype = A) && random < (125 * (AIlevel ** 2 / 64.0))
trigger2 = !(enemynear, statetype = C) && !(enemynear, hitdefattr = C, AA, AP)
statetype = S
physics = S


;--- STAND GUARD HIT 2 (Knocked back) ---
[Statedef 151]
type = S
physics = S
movetype = H
anim = 130

[State 151, Vel]
type = hitvelset
trigger1 = !time
x = 1

[State 151, Vel]
type = velset
trigger1 = time = gethitvar(slidetime)
trigger2 = hitover
x = 0

[State 151, Ctrl]
type = ctrlset
trigger1 = time = gethitvar(ctrltime)
value = 1

[State 151, High to Low]
type = statetypeset
trigger1 = !AIlevel && statetype = S && command = "holddown"
trigger2 = AIlevel && numenemy
trigger2 = statetype = S && (enemynear, movetype = A) && random < (250 * (AIlevel ** 2 / 64.0))
trigger2 = (enemynear, statetype = C) || (enemynear, hitdefattr = C, AA, AP)
statetype = C
physics = C

[State 151, Low to High]
type = statetypeset
trigger1 = !AIlevel && statetype = C && command != "holddown"
trigger2 = AIlevel && numenemy
trigger2 = statetype = C && (enemynear, movetype = A) && random < (125 * (AIlevel ** 2 / 64.0))
trigger2 = !(enemynear, statetype = C) && !(enemynear, hitdefattr = C, AA, AP)
statetype = S
physics = S

[State 151, End]
type = changestate
trigger1 = hitover
value = 130
ctrl = 1


;--- CROUCH GUARD HIT (Shaking) ---
[Statedef 152]
type = C
physics = N
movetype = H
velset = 0, 0

[State 152, Anim]
type = changeanim
trigger1 = 1
value = 151

[State 152, End]
type = changestate
trigger1 = hitshakeover
value = 151 + 2 * ((!AIlevel && command = "holddown") || (AIlevel && (enemynear, movetype = A) && (enemynear, statetype = C)))

[State 152, High to Low]
type = statetypeset
trigger1 = !AIlevel && statetype = S && command = "holddown"
trigger2 = AIlevel && numenemy
trigger2 = statetype = S && (enemynear, movetype = A) && random < (250 * (AIlevel ** 2 / 64.0))
trigger2 = (enemynear, statetype = C) || (enemynear, hitdefattr = C, AA, AP)
statetype = C
physics = C

[State 152, Low to High]
type = statetypeset
trigger1 = !AIlevel && statetype = C && command != "holddown"
trigger2 = AIlevel && numenemy
trigger2 = statetype = C && (enemynear, movetype = A) && random < (125 * (AIlevel ** 2 / 64.0))
trigger2 = !(enemynear, statetype = C) && !(enemynear, hitdefattr = C, AA, AP)
statetype = S
physics = S


;--- CROUCH GUARD HIT 2 (Knocked back) ---
[Statedef 153]
type = C
physics = C
movetype = H
anim = 131

[State 153, Vel]
type = hitvelset
trigger1 = !time
x = 1

[State 153, Vel]
type = velset
trigger1 = time = gethitvar(slidetime)
trigger2 = hitover
x = 0

[State 153, Ctrl]
type = ctrlset
trigger1 = time = gethitvar(ctrltime)
value = 1

[State 153, High to Low]
type = statetypeset
trigger1 = !AIlevel && statetype = S && command = "holddown"
trigger2 = AIlevel && numenemy
trigger2 = statetype = S && (enemynear, movetype = A) && random < (250 * (AIlevel ** 2 / 64.0))
trigger2 = (enemynear, statetype = C) || (enemynear, hitdefattr = C, AA, AP)
statetype = C
physics = C

[State 153, Low to High]
type = statetypeset
trigger1 = !AIlevel && statetype = C && command != "holddown"
trigger2 = AIlevel && numenemy
trigger2 = statetype = C && (enemynear, movetype = A) && random < (125 * (AIlevel ** 2 / 64.0))
trigger2 = !(enemynear, statetype = C) && !(enemynear, hitdefattr = C, AA, AP)
statetype = S
physics = S

[State 153, End]
type = changestate
trigger1 = hitover
value = 131
ctrl = 1


;--- AIR GUARD HIT (Shaking) ---
[Statedef 154]
type = A
physics = N
movetype = H
velset = 0, 0

[State 154, Anim]
type = changeanim
trigger1 = 1
value = 152

[State 154, End]
type = changestate
trigger1 = hitshakeover
value = 155

;--- AIR GUARD HIT 2 (Knocked away) ---
[Statedef 155]
type = A
physics = N
movetype = H
anim = 132

[State 155, Vel]
type = hitvelset
trigger1 = !time
x = 1
y = 1

[State 155, Accel]
type = veladd
trigger1 = 1
y = const(movement.yaccel)

[State 155, Ctrl]
type = ctrlset
trigger1 = time = gethitvar(ctrltime)
value = 1

[State 155, Var]
type = varset
trigger1 = 1
sysvar(0) = (vel y > 0 && (pos y > -vel y))

[State 155, Vel]
type = velset
trigger1 = sysvar(0)
y = 0

[State 155, Pos]
type = posset
trigger1 = sysvar(0)
y = 0

[State 155, End]
type = changestate
triggerall = sysvar(0) && inguarddist
trigger1 = !AIlevel
trigger1 = ifelse(p2dist x < 0, command = "holdfwd", command = "holdback")
trigger2 = AIlevel
value = 130

[State 155, End]
type = changestate
trigger1 = sysvar(0)
value = 52


;====================<PARRY>====================
;--- STANDING ---
[Statedef 700]
type = S
physics = S
movetype = I
anim = 700
velset = 0, 0
ctrl = 0
sprpriority = 2
poweradd = 0
facep2 = 1

[State 700, HB]
type = hitby
trigger1 = 1
value = SCA, AT
time = 1

[State 700, Fireball Pause]
type = pause
trigger1 = !time
trigger1 = numenemy
trigger1 = prevstateno = [5000, 5020]
trigger1 = enemynear, movereversed != 1
time = 15
movetime = 15
endcmdbuftime = 15
pausebg = 0

[State 700, Consecutive Parries]
type = posadd
trigger1 = !time
trigger1 = numhelper(705)
trigger1 = helper(705), var(3)
x = -8

[State 700, Stop]
type = posfreeze
trigger1 = 1
value = 1
[State 700, No walking]
type = varset
trigger1 = 1
var(26) = 4

[State 700, Snd]
type = playsnd
trigger1 = !time
value = 3, (random < 500)
channel = 0
[State 700, Snd]
type = playsnd
trigger1 = !time
value = 7, 3

[State 700, Flash]
type = palfx
trigger1 = !time
add = 0, 64, 255
sinadd = 0, -64, -255, 60
time = 15
[State 700, FX]
type = explod
trigger1 = !time
anim = 7200
sprpriority = 5
postype = p1
pos = 36, -65
pausemovetime = -1
supermovetime = -1
scale = 0.5, 0.5
ownpal = 1

[State 700, Shake]
type = envshake
trigger1 = !time
time = 1
ampl = 0

[State 700, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- CROUCHING ---
[Statedef 701]
type = C
physics = C
movetype = I
anim = 701
velset = 0, 0
ctrl = 0
sprpriority = 2
poweradd = 0
facep2 = 1

[State 701, HB]
type = hitby
trigger1 = 1
value = SCA, AT
time = 1

[State 701, Fireball Pause]
type = pause
trigger1 = !time
trigger1 = numenemy
trigger1 = prevstateno = [5000, 5020]
trigger1 = enemynear, movereversed != 1
time = 15
movetime = 15
endcmdbuftime = 15
pausebg = 0

[State 701, Stop]
type = posfreeze
trigger1 = 1
value = 1
[State 701, No walking]
type = varset
trigger1 = 1
var(26) = 4

[State 701, Snd]
type = playsnd
trigger1 = !time
value = 3, (random < 500)
channel = 0
[State 701, Snd]
type = playsnd
trigger1 = !time
value = 7, 3

[State 701, Flash]
type = palfx
trigger1 = !time
add = 0, 64, 255
sinadd = 0, -64, -255, 60
time = 15
[State 701, FX]
type = explod
trigger1 = !time
anim = 7200
sprpriority = 5
postype = p1
pos = 27, -21
pausemovetime = -1
supermovetime = -1
scale = 0.5, 0.5
ownpal = 1

[State 701, Shake]
type = envshake
trigger1 = !time
time = 1
ampl = 0

[State 701, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1


;--- JUMPING ---
[Statedef 702]
type = A
physics = N
movetype = I
anim = 702
ctrl = 0
sprpriority = 2
poweradd = 0
facep2 = 1

[State 702, HB]
type = hitby
trigger1 = 1
value = SCA, AT
time = 1

[State 702, Fireball Pause]
type = pause
trigger1 = !time
trigger1 = numenemy
trigger1 = prevstateno = [5000, 5020]
trigger1 = enemynear, movereversed != 1
time = 15
movetime = 15
endcmdbuftime = 15
pausebg = 0

[State 702, Stop]
type = posfreeze
trigger1 = 1
value = 1

[State 702, Snd]
type = playsnd
trigger1 = !time
value = 3, (random < 500)
channel = 0
[State 702, Snd]
type = playsnd
trigger1 = !time
value = 7, 3

[State 702, Flash]
type = palfx
trigger1 = !time
add = 0, 64, 255
sinadd = 0, -64, -255, 60
time = 15
[State 702, FX]
type = explod
trigger1 = !time
anim = 7200
sprpriority = 5
postype = p1
pos = 41, -64
pausemovetime = -1
supermovetime = -1
scale = 0.5, 0.5
ownpal = 1

[State 702, Shake]
type = envshake
trigger1 = !time
time = 1
ampl = 0

[State 702, End]
type = changestate
trigger1 = !animtime
value = 703
ctrl = 1

[Statedef 703]
type = A
physics = N
movetype = I
anim = 703
ctrl = 1
[State 703, Vel]
type = velset
trigger1 = !time
x = ifelse(vel x > 2, 2, ifelse(vel x < -2, -2, vel x))
y = ifelse(vel y < -2, vel y, -2)
[State 703, Accel]
type = gravity
trigger1 = 1
[State 703, Land]
type = changestate
trigger1 = vel y > 0 && (pos y > -vel y)
value = 52


;--- HELPER ---
[Statedef 705]
type = A
physics = N
movetype = I
anim = ifelse(root, statetype = C, 706, ifelse(root, statetype = A, 707, 705))
velset = 0, 0
ctrl = 0

[State 705, NHB]
type = nothitby
trigger1 = 1
value = SCA

[State 705, Bind]
type = bindtoroot
trigger1 = 1
time = -1

[State 705, Anim]
type = changeanim
triggerall = !time
trigger1 = !(root, AIlevel)
trigger1 = root, command = "down"
trigger2 = root, AIlevel
trigger2 = (root, statetype != A) && p2statetype = C
value = 706

[State 705, Anim]
type = changeanim
triggerall = !time
trigger1 = !(root, AIlevel)
trigger1 = root, command = "fwd"
trigger2 = root, AIlevel
trigger2 = anim != 706
value = ifelse((root, statetype = A), 707, 705)

[State 705, Anim]
type = changeanim
trigger1 = anim = 705 || anim = 707
value = ifelse((root, statetype = A), 707, 705)

[State 705, Consecutive Parries]
type = varset
triggerall = !time
trigger1 = root, stateno = [700, 702]
trigger2 = root, var(26)
var(3) = 1

[State 705, Disable]
type = varset
trigger1 = time >= ifelse((root, statetype = A), 8, 10)
trigger2 = facing != (root, facing)
trigger3 = !(root, ctrl)
trigger3 = (root, stateno != [700, 702])
trigger3 = (root, stateno != 5120)
var(0) = 1

[State 705, Disable]
type = varset
triggerall = !var(0)
triggerall = !(root, AIlevel)
trigger1 = root, p2dist x >= 0
trigger1 = root, command = "holdback"
trigger2 = root, p2dist x < 0
trigger2 = root, command = "holdfwd"
trigger3 = time < 5
trigger3 = root, p2dist x >= 0
trigger3 = (root, command = "holdfwd" + root, command = "holddown") > 1
trigger4 = time < 5
trigger4 = root, p2dist x < 0
trigger4 = (root, command = "holdback" + root, command = "holddown") > 1
trigger5 = time >= 5
trigger5 = root, p2dist x >= 0
trigger5 = root, command = "holdfwd" || root, command = "holddown"
trigger6 = time >= 5
trigger6 = root, p2dist x < 0
trigger6 = root, command = "holdback" || root, command = "holddown"
trigger7 = time >= 1
trigger7 = root, p2dist x >= 0
trigger7 = (((anim = 705 || anim = 707) && root, command = "fwd") || (anim = 706 && root, command = "down"))
trigger8 = time >= 1
trigger8 = root, p2dist x >= 0
trigger8 = (((anim = 705 || anim = 707) && root, command = "fwd") || (anim = 706 && root, command = "down"))
var(0) = 1

[State 705, Disable]
type = changeanim
trigger1 = var(0) = 1
value = 9999

[State 705, Standing / Air]
type = reversaldef
trigger1 = !var(0)
trigger1 = anim = 705 || anim = 707
trigger1 = (root, stateno != 5120) || !(root, animtime)
reversal.attr = SCA, AA
p1stateno = 706
pausetime = 0, 15
sparkno = -1
numhits = 0

[State 705, Crouching]
type = reversaldef
trigger1 = !var(0)
trigger1 = anim = 706
reversal.attr = SC, AA
p1stateno = 706
pausetime = 0, 15
sparkno = -1
numhits = 0

[State 705, Disable]
type = reversaldef
trigger1 = var(0) = 1
reversal.attr =
pausetime = 0, 0
sparkno = -1
numhits = 0

[State 705, End]
type = destroyself
trigger1 = time >= 23
trigger2 = (root, movetype != I)
trigger3 = !(root, ctrl) && (root, stateno != [700, 702]) && (root, stateno != 5120)
trigger4 = (root, stateno = [700, 702]) && (root, time <= 1)


;--- Success ---
[Statedef 706]
movetype = I
ctrl = 0
[State 706, Disable]
type = varset
trigger1 = 1
var(0) = 1
[State 706, End]
type = destroyself
trigger1 = root, stateno = [700, 702]
trigger2 = time >= 2


;==========<DODGE>==========
[Statedef 710]
type = S
physics = S
movetype = I
anim = 710
velset = 0, 0
ctrl = 0
sprpriority = -1

[State 710, Snd]
type = playsnd
trigger1 = !time
value = 4, 13
channel = 0

[State 710, Snd]
type = playsnd
trigger1 = animelem = 1
value = 1, 4
channel = 1

[State 710, Push]
type = playerpush
trigger1 = 1
value = 0

[State 710, HB]
type = hitby
trigger1 = 1
value = SCA, AT
time = 1

[State 710, Attack]
type = changestate
trigger1 = !AIlevel && (time = [15, 25])
trigger1 = command = "x" || command = "y" || command = "z" || command = "a" || command = "b" || command = "c"
value = ifelse((command = "x" || command = "y" || command = "z"), 220, 240)

[State 710, Attack]
type = changestate
trigger1 = AIlevel && (time = [15, 25]) && (p2dist x = [0, 60]) && p2movetype != A
value = ifelse(random < 500, 220, 240)

[State 710, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;==========<ROLL>==========
;--- FORWARD ---
[Statedef 720]
type = S
physics = N
movetype = I
anim = 720
velset = 0, 0
ctrl = 0
sprpriority = 1

[State 720, Snd]
type = playsnd
trigger1 = animelem = 1
value = 3, ifelse(random < 250, 0, ifelse(random < 333, 1, ifelse(random < 500, 3, 4)))
channel = 0

[State 720, Snd]
type = playsnd
trigger1 = animelem = 2
value = 0, 102

[State 720, Vel]
type = velset
trigger1 = animelem = 2
x = 5.34

[State 720, Vel]
type = velset
trigger1 = animelem = 9
x = 0

[State 720, Push]
type = playerpush
trigger1 = 1
value = 0

[State 720, HB]
type = hitby
trigger1 = animelemtime(8) < 0
value = SCA, AT
time = 1

[State 720, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- BACK ---
[Statedef 725]
type = S
physics = N
movetype = I
anim = 725
velset = 0, 0
ctrl = 0
sprpriority = 1

[State 725, Snd]
type = playsnd
trigger1 = animelem = 1
value = 3, ifelse(random < 250, 0, ifelse(random < 333, 1, ifelse(random < 500, 3, 4)))
channel = 0

[State 725, Snd]
type = playsnd
trigger1 = animelem = 2
value = 0, 102

[State 725, Vel]
type = velset
trigger1 = animelem = 2
x = -4.01

[State 725, Vel]
type = velset
trigger1 = animelem = 9
x = 0

[State 725, Push]
type = playerpush
trigger1 = 1
value = 0

[State 725, HB]
type = hitby
trigger1 = animelemtime(8) < 0
value = SCA, AT
time = 1

[State 725, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;==========<POWER CHARGE>==========
[Statedef 740]
type = S
physics = S
movetype = I
anim = 740
ctrl = 0
velset = 0, 0

[State 740, Power]
type = poweradd
trigger1 = 1
value = 2 + ifelse(time < 60, 0, (time -60) / 12)

[State 740, Snd]
type = playsnd
trigger1 = time = 8
value = 3, 2
channel = 0

[State 740, Flash]
type = palfx
trigger1 = 1
time = 1
add = 75 + ceil(sin(time / 6.0 * pi) * 75), 25 + ceil(sin(time / 6.0 * pi) * 25), 0

[State 740, FX]
type = helper
trigger1 = !numhelper(7240)
helpertype = normal
stateno = 7240
ID = 7240
name = "Power Charge"
postype = p1
pausemovetime = 65535
supermovetime = 65535
ownpal = 1

[State 740, FX]
type = helper
trigger1 = !numhelper(7241)
helpertype = normal
stateno = 7241
ID = 7241
name = "Particles"
postype = p1
pausemovetime = 65535
supermovetime = 65535
ownpal = 1

[State 740, Aura]
type = helper
trigger1 = animelemtime(5) >= 0 && !numhelper(6000)
helpertype = normal
stateno = 6000
ID = 6000
postype = p1
ownpal = 1

[State 740, End]
type = changestate
triggerall = time >= 8
trigger1 = power >= const(data.power) || power >= powermax || roundstate != 2
trigger2 = !AIlevel && (command != "holdb" || command != "holdy")
trigger3 = AIlevel && (inguarddist || fvar(16) <= 120)
value = 741 + 0 * (var(58) := 5)


;--- END ---
[Statedef 741]
type = S
physics = S
movetype = I
anim = 741
velset = 0, 0
ctrl = 1

[State 741, Snd]
type = stopsnd
trigger1 = !time
channel = 0

[State 741, Snd]
type = playsnd
trigger1 = !time && power >= const(data.power)
value = 4, 15
channel = 0

[State 741, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;==========<ZERO COUNTER>==========
[Statedef 750]
type = S
physics = S
movetype = I
anim = 750
ctrl = 0
velset = 0, 0
poweradd = -1000
sprpriority = 2
facep2 = 1

[State 750, Strength]
type = varset
trigger1 = !time && !AIlevel
var(10) = ifelse((command = "counter_p"), 1, 2)
ignorehitpause = 1
[State 750, Strength AI]
type = varset
trigger1 = !time && AIlevel
var(10) = ifelse((p2statetype = A), 1, ifelse((p2statetype = C), 2, ifelse(random < 500, 1, 2)))
ignorehitpause = 1

[State 750, Snd]
type = playsnd
trigger1 = !time
value = 3, 0
channel = 0
[State 750, ECreset]
type = palfx
trigger1 = !time
trigger1 = var(20) := -1
time = 1
[State 750, Super Pause FX]
type = helper
trigger1 = !time
helpertype = normal
stateno = 7250
ID = 7250
postype = p1
pos = 23, -74
ownpal = 1
persistent = 0
supermovetime = 999

[State 750, Super Pause]
type = superpause
trigger1 = !time
time = 15
movetime = 15
anim = -1
sound = s7, 1
p2defmul = 1
darken = 0

[State 750, End]
type = changestate
trigger1 = time >= 15
value = ifelse(var(10) = 1, 752, 754)


;========================<PUNCH ZERO COUNTER>=============================
[Statedef 752]
type = S
physics = N
movetype = A
anim = 752
ctrl = 0
velset = 0, 0
sprpriority = 2
poweradd = 0

[State 752, NHB]
type = nothitby
trigger1 = animelemtime(3) < 0
value = SCA
time = 1
ignorehitpause = 1

[State 752, Snd]
type = playsnd
trigger1 = animelem = 2
value = 3, ifelse(random < 500, 9, 11)
channel = 0

[State 752, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 3
channel = 1

[State 752, Hit]
type = hitdef
trigger1 = animelem = 3
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 50, 7
getpower = 0, 0
givepower = 40, 40
pausetime = 12, 12
guard.pausetime = 12, 12
animtype = Diagup
air.animtype = Diagup
fall.animtype = Diagup
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = -5.54, -5.25
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = -5.54, -5.25
air.cornerpush.veloff = 0
yaccel = 0.4850
fall = 1
fall.recover = 1
fall.recovertime = 120;24
forcestand = 1
hitsound = -1 + 0 * (var(31) := 3)
guardsound = -1
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 40) * (var(36) := 70), var(37) := -76
envshake.time = 10
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.freq = 180
kill = 0

[State 752, Anim]
type = changeanim
trigger1 = anim = 752
trigger1 = movecontact = 1 && hitpausetime
trigger1 = animelemtime(3) >= 0 && animelemtime(4) <= 0
trigger1 = hitpausetime <= 9
value = 752
elem = 4
ignorehitpause = 1

[State 752, Type]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I

[State 752, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;========================<KICK ZERO COUNTER>=============================
[Statedef 754]
type = S
physics = N
movetype = A
anim = 754
ctrl = 0
velset = 0, 0
sprpriority = 2
poweradd = 0

[State 754, NHB]
type = nothitby
trigger1 = animelemtime(4) < 0
value = SCA
time = 1
ignorehitpause = 1

[State 754, Snd]
type = playsnd
trigger1 = animelem = 3
value = 3, ifelse(random < 500, 9, 11)
channel = 0

[State 754, Snd]
type = playsnd
trigger1 = animelem = 4
value = 1, 3
channel = 1

[State 754, Hit]
type = hitdef
trigger1 = animelem = 4
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 50, 7
getpower = 0, 0
givepower = 40, 40
pausetime = 12, 12
guard.pausetime = 12, 12
animtype = Diagup
air.animtype = Diagup
fall.animtype = Diagup
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = -5.54, -5.25
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = -5.54, -5.25
air.cornerpush.veloff = 0
yaccel = 0.4850
fall = 1
fall.recover = 1
fall.recovertime = 120;24
forcestand = 1
hitsound = -1 + 0 * (var(31) := 3)
guardsound = -1
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 55) * (var(36) := 85), var(37) := -43
envshake.time = 10
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.freq = 180
kill = 0

[State 754, Type]
type = statetypeset
trigger1 = animelemtime(5) >= 0
movetype = I

[State 754, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;====================<CUSTOM COMBO>====================
;--- GROUND ---
[Statedef 760]
type = S
physics = S
movetype = A
anim = 760
velset = 0, 0
ctrl = 0
sprpriority = 2
poweradd = -2000

[State 760, Corner Push]
type = varset
trigger1 = time = 4
fvar(5) = 0

[State 760, NHB]
type = nothitby
trigger1 = !time
value = SCA
time = 38

[State 760, Stop]
type = posfreeze
trigger1 = 1
value = 1

[State 760, Var]
type = varset
trigger1 = time >= 4
var(20) = 300

[State 760, Snd]
type = playsnd
trigger1 = time = 4
value = 4, 11
channel = 0

[State 760, SuperPause FX]
type = helper
trigger1 = time = 4
helpertype = normal
stateno = 7260
ID = 7260
name = "Custom Combo Startup"
postype = p1
pos = -4, -56
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 760, Super Pause]
type = superpause
trigger1 = time = 4
time = 30
movetime = 30
anim = -1
sound = s7, 2
p2defmul = 1
darken = 0

[State 760, AfterImage]
type = afterimage
trigger1 = !animtime
time = 2
timegap = 1
framegap = 4
length = 13
palbright = 0, 0, 0
palcontrast = 64, 128, 192
palpostbright = 0, 0, 0
paladd = 0, 0, 0
palmul = 0.75, 0.75, 0.75
trans = add1

[State 760, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- AIR ---
[Statedef 765]
type = A
physics = N
movetype = A
anim = 765
ctrl = 0
sprpriority = 2
poweradd = -2000

[State 765, Corner Push]
type = varset
trigger1 = time = 4
fvar(5) = 0

[State 765, NHB]
type = nothitby
trigger1 = !time
value = SCA
time = 38

[State 765, Var]
type = varset
trigger1 = time >= 4
var(20) = 240

[State 765, Snd]
type = playsnd
trigger1 = time = 4
value = 4, 11
channel = 0

[State 765, SuperPause FX]
type = helper
trigger1 = time = 4
helpertype = normal
stateno = 7260
ID = 7260
name = "Custom Combo Startup"
postype = p1
pos = 1, -84
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 765, Super Pause]
type = superpause
trigger1 = time = 4
time = 30
movetime = 30
anim = -1
sound = s7, 2
p2defmul = 1
darken = 0

[State 765, AfterImage]
type = afterimage
trigger1 = !animtime
time = 2
timegap = 1
framegap = 4
length = 13
palbright = 0, 0, 0
palcontrast = 64, 128, 192
palpostbright = 0, 0, 0
paladd = 0, 0, 0
palmul = 0.75, 0.75, 0.75
trans = add1

[State 765, End]
type = changestate
trigger1 = !animtime
value = 766
ctrl = 1

[State 765, Stop]
type = posfreeze
trigger1 = 1
value = 1


[Statedef 766]
type = A
physics = N
movetype = I
anim = 766
ctrl = 1

[State 766, Accel]
type = gravity
trigger1 = 1

[State 766, Land]
type = changestate
trigger1 = vel y > 0 && (pos y > -vel y)
value = 52


;====================<CHEAP K.O.>====================
[Statedef 5950]
type = S
movetype = H
physics = S
anim = 5950
velset = 0, 0

[State 5950, NHB]
type = nothitby
trigger1 = 1
value = SCA
[State 5950, Pos]
type = posset
trigger1 = 1
y = 0

[State 5950, KO Snd]
type = assertspecial
trigger1 = 1
flag = nokosnd
[State 5950, KO Snd]
type = stopsnd
trigger1 = !time && !alive
channel = 0
[State 5950, KO Snd]
type = playsnd
trigger1 = animelem = 2 && !alive
value = 11, 3

[State 5950, Pos]
type = posadd
trigger1 = animelem = 6
x = ceil(-16 * const(size.xscale))

[State 5950, Snd]
type = playsnd
trigger1 = animelem = 6
value = f7, 0
[State 5950, FX]
type = explod
trigger1 = animelem = 6
anim = f60
postype = p1
pos = 0, 0
sprpriority = -10

[State 5950, End]
type = changestate
trigger1 = !animtime
value = ifelse(alive, 5110, 5150)


;==========<TAUNT>==========
[Statedef 195]
type = S
movetype = A
physics = S
anim = 195
velset = 0, 0
sprpriority = 1
ctrl = 0

[State 195, Hit]
type = hitdef
trigger1 = animelem = 5
ID = 195
attr = S, SA
damage = 10, 0
animtype = Back
fall.animtype = Back
guardflag = MA
hitflag = MAFD
priority = 4, Hit
pausetime = 4, 4
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := -40) * (var(36) := 40), var(37) := -70
hitsound = -1 + 0 * (var(31) := 3)
guardsound = -1
ground.type = High
ground.slidetime = 18
ground.hittime = 18
air.hittime = 18
down.hittime = 18
ground.velocity = -6, -12
guard.velocity = -10.52
air.type = Low
air.velocity = -6, -12
down.velocity = -6, -12
getpower = ifelse(movehit, 25, 200) * !var(20), ifelse(moveguarded, 25, 100) * !var(20)
givepower = 40, 40
envshake.time = 9
envshake.freq = 60
envshake.ampl = ifelse((gametime % 2), -1, 1)
palfx.sinadd = 64, 64, 64, 4
palfx.mul = 128, 128, 128
palfx.time = 60
fall = 0
fall.recover = 1
fall.recovertime = 44
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
yaccel = 0.4850
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
forcenofall = !var(20)

[State 195, Flame Particles]
type = helper
trigger1 = !numhelper(8150)
trigger1 = movehit = 1 && numtarget
trigger1 = !(target, hitshakeover)
trigger1 = var(40) := (target, ID)
helpertype = normal
stateno = 8150
ID = 8150
name = "Flame Particles"
postype = p2
ownpal = 1
ignorehitpause = 1

[State 195, Aura]
type = helper
trigger1 = animelem = 5
helpertype = normal
stateno = 6000
ID = 6000
postype = p1
ownpal = 1
persistent = 0
ignorehitpause = 1

[State 195, Kanji]
type = helper
trigger1 = animelem = 5
helpertype = normal
stateno = 6002
ID = 6002
postype = p1
pos = -5, -100
facing = ifelse(facing = 1, 1, -1)
ownpal = 1
persistent = 0
ignorehitpause = 1

[State 195, Snd]
type = playsnd
trigger1 = time > 0
trigger1 = animelem = 5
value = 4, 10
channel = 0
ignorehitpause = 1

[State 195, Snd]
type = playsnd
trigger1 = time > 0
trigger1 = animelem = 5
value = 5, 4
ignorehitpause = 1

[State 195, Dust]
type = helper
trigger1 = animelem = 5
helpertype = normal
stateno = 8111
ID = 8100
name = "Impact Dust"
postype = p1
pos = -34, 0
ownpal = 1

[State 195, Shake]
type = envshake
trigger1 = !movereversed
trigger1 = animelemtime(5) >= 0 && animelemtime(5) <= 20
trigger1 = !(animelemtime(5) % 4)
time = 4
freq = 180
ampl = 4 - ceil(animelemtime(5) * 0.15)

[State 195, Type]
type = statetypeset
trigger1 = animelemtime(6) >= 0
movetype = I
[State 195, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;==========<LOSE (Time over)>==========
[Statedef 170]
type = S
ctrl = 0
anim = 170
velset = 0, 0

[State 170, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1

[State 170, Dust]
type = explod
trigger1 = animelem = 2
anim = 7102
ID = 7102
sprpriority = -2
postype = p1
pos = -6, 0
ownpal = 1
scale = 0.33, 0.33

[State 170, Snd]
type = playsnd
trigger1 = animelem = 2
value = 0, 52


;==========<DRAWGAME (Time over)>==========
[Statedef 175]
type = S
ctrl = 0
anim = 175
velset = 0, 0

[State 175, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1

[State 175, Dust]
type = helper
trigger1 = animelem = 5
helpertype = normal
stateno = 8111
ID = 8100
name = "Impact Dust"
postype = p1
pos = -5, 8
ownpal = 1

[State 175, Snd]
type = playsnd
trigger1 = animelem = 5
value = 5, 4


;==========<INITIALIZE>==========
;--- Before Config ---
[Statedef 5900]
type = S

[State 5900, Var Reset]
type = varrangeset
trigger1 = !roundsexisted
value = 0

[State 5900, Var Reset]
type = varrangeset
trigger1 = !roundsexisted
fvalue = 0

[State 5900, Palette]
type = remappal
trigger1 = 1
source = 1, 1
dest = 1, palno

[State 5900, End]
type = changestate
trigger1 = 1
value = 5901


;--- After Config ---
[Statedef 5902]
type = S

[State 5902, Wait for Ryu]
type = varset
trigger1 = !time
var(0) = 0

[State 5902, Wait for Ryu]
type = varset
trigger1 = numenemy
trigger1 = !roundsexisted || !(enemy, roundsexisted)
trigger1 = !numpartner && numenemy = 1
trigger1 = enemy, authorname = "Phantom.of.the.Server" && enemy, name = "Ryu"
var(0) = 1

[State 5902, vs Evil Ryu]
type = changestate
trigger1 = var(0) = 1
trigger1 = enemy, var(1) = [2, 3]
value = 189

[State 5902, Intro vs Vega]
type = changestate
trigger1 = numenemy
trigger1 = !numpartner && numenemy = 1
trigger1 = !roundsexisted
trigger1 = enemy, authorname = "Phantom.of.the.Server" && enemy, name = "Vega"
value = 350

[State 5902, vs Haohmaru]
type = changestate
triggerall = numenemy
triggerall = !numpartner && numenemy = 1
triggerall = !roundsexisted && !(enemy, roundsexisted)
trigger1 = enemy, name = "Cvshaohmaru" && enemy, authorname = "Z Sabre User"
trigger2 = enemy, name = "HaohmaruMG" && enemy, authorname = "Master Gouken"
trigger3 = enemy, name = "cvshaohmaru" && enemy, authorname = "Warusaki3"
value = 191

[State 5902, vs Adon]
type = changestate
trigger1 = numenemy
trigger1 = !numpartner && numenemy = 1
trigger1 = !roundsexisted && !(enemy, roundsexisted)
trigger1 = enemy, authorname = "Sepp" && enemy, name = "Adon"
value = 188

[State 5902, vs Nash]
type = changestate
trigger1 = numenemy && var(0) != 5
trigger1 = !numpartner && numenemy = 1
trigger1 = !roundsexisted && !(enemy, roundsexisted)
trigger1 = enemy, name = "Nash" && enemy, authorname = "Phantom.of.the.Server"
value = 194

[State 5902, Turns Intro]
type = changestate
trigger1 = ifelse(var(0) = 1, time >= 1, 1)
trigger1 = teammode = turns
trigger1 = !roundsexisted && roundno >= 2
value = 6900

[State 5902, End]
type = changestate
trigger1 = ifelse(var(0) = 1, time >= 1, 1)
value = ifelse(roundno = 1, 190, 0)


;==========<PREINTRO>==========
[Statedef 190]
type = S
ctrl = 0
velset = 0, 0

[State 190, Vega Exists]
type = varset
trigger1 = !time
var(0) = 0

[State 190, Vega Exists]
type = varset
trigger1 = numhelper(6100)
var(0) = 1

[State 190, Vega Exists]
type = varset
triggerall = numenemy
trigger1 = enemy, name = "Shin Gouki" && enemy, authorname = "Phantom.of.the.Server" && enemy, numhelper(6100)
trigger2 = enemy, name = "cvsgouki" && enemy, authorname = "Warusaki3"
trigger3 = enemy, name = "cvsvega" && (enemy, authorname = "Warusaki3" || enemy, authorname = "Gargoyle")
trigger4 = enemy, name = "M.Bison" && enemy, authorname = "N -Mario"
trigger5 = enemy, name = "M. Bison" && enemy, authorname = "VK, Updated by Terry Kuo, adapted by Tenebrous"
trigger6 = enemy, name = "CvSBison" && enemy, authorname = "Team Kai (Saiai and Koga)"
trigger7 = enemy, name = "M. Bison" && enemy, authorname = "VK, Updated by Terry Kuo, adapted by Tenebrous"
trigger8 = enemy, name = "Cammy" && enemy, authorname = "Phantom.of.the.Server"
trigger9 = enemy, name = "Shining Force 2 Kraken" && enemy, authorname = "Phantom.of.the.Server"
trigger10 = enemy, name = "Sky Chase" && enemy, authorname = "Phantom.of.the.Server"
var(0) = 1

[State 190, Kill Vega]
type = changestate
triggerall = !time
triggerall = !numpartner && !var(0)
trigger1 = AIlevel && random < 250
trigger2 = !AIlevel && command = "holdup"
value = 194

[State 190, Intro]
type = changestate
trigger1 = 1
value = ifelse(random < 333, 191, ifelse(random < 500, 192, 193))


;==========<INTRO 1>==========
[Statedef 192]
type = S
anim = 192
sprpriority = -1

[State 192, Intro]
type = assertspecial
trigger1 = 1
flag = intro

[State 192, Spr]
type = sprpriority
trigger1 = animelemtime(4) >= 0
value = 0

[State 192, Aura]
type = helper
trigger1 = animelem = 7
helpertype = normal
stateno = 6000
ID = 6000
postype = p1
ownpal = 1
persistent = 0

[State 192, Kanji]
type = helper
trigger1 = animelem = 7
helpertype = normal
stateno = 6002
ID = 6002
postype = p1
pos = -5, -100
facing = ifelse(facing = 1, 1, -1)
ownpal = 1
persistent = 0

[State 192, Snd]
type = playsnd
trigger1 = animelem = 7
value = 3, 5
channel = 0

[State 192, Snd]
type = playsnd
trigger1 = animelem = 7
value = 5, 4

[State 192, Dust]
type = helper
trigger1 = animelem = 7
helpertype = normal
stateno = 8111
ID = 8100
name = "Impact Dust"
postype = p1
pos = -34, 0
ownpal = 1

[State 192, Shake]
type = envshake
trigger1 = animelemtime(7) >= 0 && animelemtime(7) <= 20
trigger1 = !(animelemtime(7) % 4)
time = 4
freq = 180
ampl = 4 - ceil(animelemtime(7) * 0.15)

[State 192, End]
type = changestate
trigger1 = !animtime
value = 0


;==========<INTRO 2>==========
[Statedef 193]
type = S
anim = 193
sprpriority = -1

[State 193, Intro]
type = assertspecial
trigger1 = 1
flag = intro

[State 193, Kanji]
type = explod
trigger1 = !time
anim = 6015 + (facing = -1)
ID = 6015
sprpriority = 0
postype = p1
bindtime = -1
removeongethit = 1
ownpal = 1

[State 193, Snd]
type = playsnd
trigger1 = !time
value = 5, 11

[State 193, hadou]
type = explod
trigger1 = !time
anim = 6020
ID = 6020
sprpriority = 0
postype = p1
pos = 14, -72
removetime = 260
removeongethit = 1
ownpal = 1

[State 193, grow]
type = modifyexplod
trigger1 = time < 40
ID = 6020
scale = (0.025 * time), (0.025 * time)

[State 193, normal]
type = modifyexplod
trigger1 = time >= 40 && time <= 120
ID = 6020
scale = 1, 1

[State 193, Shrink]
type = modifyexplod
trigger1 = time > 120 && time <= 280
ID = 6020
scale = 1 -(0.0063 * (time -120)), 1 -(0.0063 * (time -120))

[State 193, FX]
type = helper
trigger1 = time > 120 && time <= 220
trigger1 = !(time % 4) && numhelper(6021) < 12
helpertype = normal
stateno = 6021
ID = 6021
name = "Red Particle"
postype = p1
;pos = ifelse(random < 250, -160, ifelse(random < 333, -80, ifelse(random < 500, 80, 160))), -75 -(random % 200)
pos = 160 -(random % 320), -75 -(random % 200)
size.xscale = ifelse(random < 500, 0.5, -0.5)
size.yscale = ifelse(random < 500, 0.5, -0.5)
ownpal = 1

[State 193, Dust]
type = explod
trigger1 = time > 120 && time <= 240
trigger1 = ifelse(animelemtime(4) >= 0, !(time % 12), !(time % 9))
anim = 7102
ID = 7102
sprpriority = -2
postype = p1
pos = ifelse(animelemtime(4) >= 0, 16, 20), 0
ownpal = 1
scale = 0.5, 0.5

[State 193, Snd]
type = playsnd
trigger1 = time = 100
value = 5, 12
channel = 4
loop = 1

[State 193, Snd]
type = stopsnd
trigger1 = time >= 260
channel = 4

[State 193, Snd]
type = playsnd
trigger1 = time = 200
value = 4, 7
channel = 0

[State 193, Shake]
type = envshake
trigger1 = !(time % 4)
trigger1 = time = [120, 240]
time = 4
freq = 180
ampl = 1

[State 193, End]
type = changestate
trigger1 = !animtime
value = 0


;==========<INTRO 3>==========
[Statedef 191]
type = S
anim = 191
sprpriority = -1
[State 191, Intro]
type = assertspecial
trigger1 = 1
flag = intro
[State 191, Spr]
type = sprpriority
trigger1 = animelemtime(4) >= 0
value = 0
[State 191, Kanji]
type = explod
trigger1 = !time
anim = 6010
ID = 6010
sprpriority = 1
postype = p1
facing = ifelse(facing = 1, 1, -1)
pos = ifelse(facing = 1, 0, 32)
bindtime = -1
removeongethit = 1
ownpal = 1
[State 191, Snd]
type = playsnd
trigger1 = time = 15
value = 4, 3
channel = 0
[State 191, End]
type = changestate
trigger1 = !animtime
value = 0


;========================<MISOGI INTRO>=============================
[Statedef 194]
type = A
physics = N
movetype = I
anim = 194
ctrl = 0
sprpriority = -1

[State 194, Intro]
type = assertspecial
trigger1 = 1
flag = intro

[State 194, Pos]
type = screenbound
trigger1 = animelemtime(5) < 0
value = 0
movecamera = 1, 0

[State 194, vega]
type = helper
trigger1 = !time
helpertype = normal
stateno = 6100
ID = 6100
name = "Vega"
postype = p1
pos = 20, -ceil(pos y)
;pos = 15, -ceil(pos y)
size.shadowoffset = 6
ownpal = 1

[State 194, Palfx]
type = palfx
trigger1 = animelemtime(2) < 0
add = -255, -255, -255
time = 1

[State 194, Palfx]
type = palfx
trigger1 = animelem = 2
add = -255, -255, -255
sinadd = 255, 255, 255, 28
time = 7

[State 194, Pos]
type = posadd
trigger1 = !time
y = -240

[State 194, Vel]
type = velset
trigger1 = animelem = 2
y = 20

[State 194, Accel]
type = veladd
trigger1 = animelemtime(2) > 0
y = 0.5

[State 194, Anim]
type = changeanim
trigger1 = time && animelemtime(5) < 0 && pos y >= -5
value = 194
elem = 5
persistent = 0

[State 194, Stop]
type = posset
trigger1 = animelemtime(5) >= 0
y = 0

[State 194, Stop]
type = velset
trigger1 = animelemtime(5) >= 0
y = 0

[State 194, Shake]
type = envshake
trigger1 = animelem = 5
time = 18
ampl = 4
freq = 180

[State 194, Snd]
type = playsnd
trigger1 = animelem = 5
value = 5, 10

[State 194, Dust]
type = explod
trigger1 = animelem = 5
anim = 7102
ID = 7102
sprpriority = -2
postype = p1
scale = 0.75, 0.75
ownpal = 1

[State 194, Snd]
type = playsnd
trigger1 = animelem = 3
value = 4, 10
channel = 0

[State 194, Snd]
type = playsnd
trigger1 = animelem = 25
value = 4, 15
channel = 0

[State 194, End]
type = changestate
trigger1 = !animtime
value = 0


;==========<INTRO vs EVIL RYU>==========
[Statedef 189]
type = S
physics = N
anim = 189
sprpriority = 0

[State 189, Intro]
type = assertspecial
trigger1 = 1
flag = intro

[State 189, Camera]
type = helper
trigger1 = !numhelper(7650)
helpertype = normal
stateno = 7650
ID = 7650
name = "Camera"
postype = p1

[State 189, screen]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 1

[State 189, Vel]
type = posset
trigger1 = !time
x = -240 * facing
[State 189, Vel]
type = velset
trigger1 = !time
x = 6
[State 189, Snd]
type = playsnd
trigger1 = !time
value = 5, 6

[State 189, Anim]
type = changeanim
trigger1 = animelemtime(2) < 0 && p2dist x <= 72
value = 189
elem = 2
[State 189, Snd]
type = playsnd
trigger1 = animelem = 2
value = 4, 10
channel = 0
[State 189, Vel]
type = velset
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
x = 0
[State 189, Pos]
type = posset
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
x = -36 * facing

[State 189, fadeout]
type = allpalfx
trigger1 = animelemtime(2) = 10
time = 20
sinadd = -255, -255, -255, 80
[State 189, black]
type = envcolor
trigger1 = animelemtime(2) >= 30 && animelemtime(3) < 0
time = 2
value = 0, 0, 0
[State 189, Assert]
type = assertspecial
trigger1 = animelemtime(2) >= 30 && animelemtime(3) < 0
flag = nobardisplay

[State 189, HitSound]
type = playsnd
trigger1 = animelemtime(2) >= 30 && animelemtime(3) < 0
trigger1 = (animelemtime(2) % 6) = 1
value = 2, 0
channel = 2

[State 189, Spark]
type = helper
trigger1 = animelemtime(2) >= 30 && animelemtime(3) < 0
trigger1 = (animelemtime(2) % 6) = 1
helpertype = normal
stateno = 8001
ID = 8000
name = "Spark"
postype = p2
pos = -30 + (random % 61), -100 + (random % 61)
facing = 1
ownpal = 1
size.xscale = 1
size.yscale = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State 189, Shake]
type = envshake
trigger1 = teamside = 1
trigger1 = animelemtime(2) >= 30 && animelemtime(3) < 0
trigger1 = (animelemtime(2) % 6) = 1
time = 12
ampl = 2
freq = 180

[State 189, Anim]
type = changeanim
trigger1 = animelemtime(2) >= 72 && animelemtime(3) < 0
value = 189
elem = 3
[State 189, Snd]
type = playsnd
trigger1 = animelem = 3
value = 5000, 4
channel = 0

[State 189, Snd]
type = playsnd
trigger1 = animelem = 3 && teamside = 1
value = 7, 1
[State 189, Lightning]
type = helper
trigger1 = animelem = 3 && teamside = 1
helpertype = normal
stateno = 7250
ID = 7250
postype = left
pos = 160, -60
ownpal = 1
supermovetime = 999

[State 189, Vel]
type = velset
trigger1 = animelem = 3
x = -6
[State 189, Pos]
type = posset
trigger1 = animelemtime(3) >= 0 && (helper(7650), rootdist x <= 0)
x = ceil(helper(7650), pos x)
[State 189, Vel]
type = velset
trigger1 = animelemtime(3) >= 0 && (helper(7650), rootdist x <= 0)
x = 0
[State 189, End]
type = changestate
trigger1 = !animtime
value = 0


;==========<INTRO vs HAOHMARU>==========
[Statedef 191]
type = S
anim = 191
sprpriority = -1
[State 191, Intro]
type = assertspecial
trigger1 = 1
flag = intro
[State 191, Spr]
type = sprpriority
trigger1 = animelemtime(4) >= 0
value = 0
[State 191, Kanji]
type = explod
trigger1 = !time
anim = 6014
ID = 6014
sprpriority = 1
postype = p1
facing = ifelse(facing = 1, 1, -1)
pos = ifelse(facing = 1, 0, 32)
bindtime = -1
removeongethit = 1
ownpal = 1
[State 191, Snd]
type = playsnd
trigger1 = time = 180
value = 4, 15
channel = 0
[State 191, End]
type = changestate
trigger1 = !animtime
value = 0


;==========<INTRO vs ADON by Sepp>==========
[Statedef 188]
type = S
anim = 188
sprpriority = -1

[State 188, Intro]
type = assertspecial
trigger1 = 1
flag = intro
ignorehitpause = 1

[State 188, Kanji]
type = explod
trigger1 = !time
anim = 6010
ID = 6010
sprpriority = 1
postype = p1
facing = ifelse(facing = 1, 1, -1)
pos = ifelse(facing = 1, 0, 32)
bindtime = -1
removeongethit = 1
ownpal = 1
persistent = 0
[State 188, Snd]
type = playsnd
trigger1 = animelemtime(2) < 0 && time = 15
value = 4, 3
channel = 0
persistent = 0
[State 188, Anim]
type = changeanim
trigger1 = animelemtime(5) > 0 && animelemtime(6) < 0
value = 188
elem = 5
[State 188, Anim]
type = changeanim
trigger1 = animelemtime(6) < 0 && (enemynear, anim = 1220) && (enemynear, vel x > 0) && p2dist x <= 102
value = 188
elem = 6

[State 188, Snd]
type = playsnd
trigger1 = animelem = 6
value = 5, 14
[State 188, Dust]
type = explod
trigger1 = animelem = 6
anim = 7103
ID = 7103
sprpriority = 3
postype = p1
pos = -35
vel = -0.5, 0
ownpal = 1
scale = 0.5, 0.5

[State 188, Snd]
type = playsnd
trigger1 = animelem = 11
value = 4, 10
channel = 0

[State 188, Type]
type = statetypeset
trigger1 = animelemtime(11) >= 0 && animelemtime(18) < 0
movetype = A
[State 188, Hit]
type = hitdef
trigger1 = animelem = 13
attr = S, NA
animtype = Up
hitflag = MAF
priority = 4, Hit
pausetime = 16, 16
sparkno = -1 + 0 * (var(33) := 8011)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 70), var(37) := -76
hitsound = -1 + 0 * (var(31) := 3)
ground.type = High
ground.slidetime = 12
ground.hittime = 16
ground.velocity = -1, -6
air.type = High
air.velocity = -1, -6
getpower = 0
givepower = 0
envshake.time = 12
envshake.ampl = ifelse((gametime % 2), -2, 2)
sprpriority = 1

[State 188, Aura]
type = helper
trigger1 = animelem = 24
helpertype = normal
stateno = 6000
ID = 6000
postype = p1
ownpal = 1
persistent = 0
[State 188, Kanji]
type = helper
trigger1 = animelem = 24
helpertype = normal
stateno = 6002
ID = 6002
postype = p1
pos = -5, -100
facing = ifelse(facing = 1, 1, -1)
ownpal = 1
persistent = 0
[State 188, Snd]
type = playsnd
trigger1 = animelem = 24
value = 4, 13
channel = 0
[State 188, Snd]
type = playsnd
trigger1 = animelem = 24
value = 5, 4

[State 188, Dust]
type = helper
trigger1 = animelem = 24
helpertype = normal
stateno = 8111
ID = 8100
name = "Impact Dust"
postype = p1
pos = -34, 0
ownpal = 1

[State 188, Shake]
type = envshake
trigger1 = animelem = 24
time = 18
freq = 120
ampl = 4

[State 188, End]
type = changestate
trigger1 = !animtime
value = 0


;========================<INTRO vs VEGA>=============================
[Statedef 350]
type = A
physics = N
movetype = I
anim = 350
ctrl = 0
sprpriority = -1

[State 350, Intro]
type = assertspecial
trigger1 = 1
flag = intro

[State 350, Pos]
type = screenbound
trigger1 = animelemtime(5) < 0
value = 0
movecamera = 1, 0

[State 350, Palfx]
type = palfx
trigger1 = animelemtime(2) <= 0
add = -255, -255, -255
sinadd = 255, 255, 255, 28
time = 7

[State 350, Pos]
type = posadd
trigger1 = !time
y = -240

[State 350, Snd]
type = playsnd
trigger1 = time = 5
value = 4, 7
channel = 0

[State 350, Vel]
type = velset
trigger1 = animelem = 2
y = 20

[State 350, Accel]
type = veladd
trigger1 = animelemtime(2) > 0
y = 0.5

[State 350, Anim]
type = changeanim
trigger1 = time && animelemtime(5) < 0 && pos y >= -5
value = 350
elem = 5
persistent = 0

[State 350, Stop]
type = posset
trigger1 = animelemtime(5) >= 0
y = 0

[State 350, Stop]
type = velset
trigger1 = animelemtime(5) >= 0
y = 0

[State 350, Shake]
type = envshake
trigger1 = animelem = 5
time = 18
ampl = 3
freq = 180

[State 350, Snd]
type = playsnd
trigger1 = animelem = 5
value = 5, 10

[State 350, Dust]
type = explod
trigger1 = animelem = 5
anim = 7102
ID = 7102
sprpriority = -5
postype = p1
scale = 0.5, 0.5
ownpal = 1

[State 350, End]
type = changestate
trigger1 = !animtime
value = 0


;====================<TURNS INTRO>====================
[Statedef 6900]
type = A
anim = 6900
velset = 0, 0
ctrl = 0

[State 6900, Intro]
type = assertspecial
trigger1 = 1
flag = intro

[State 6900, Camera]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 0

[State 6900, Camera]
type = helper
trigger1 = !numhelper(7650)
helpertype = normal
stateno = 7650
ID = 7650
name = "Camera"
postype = p1

[State 6900, Pos]
type = posset
trigger1 = !time
x = (-320 + abs(pos x)) * facing

[State 6900, Vel]
type = velset
trigger1 = !time
x = (helper(7650), rootdist x) / -40.0
y = -10.25
[State 6900, Accel]
type = veladd
trigger1 = 1
y = 0.5

[State 6900, End]
type = changestate
trigger1 = time
trigger1 = vel y > 0 && (pos y > -vel y)
value = 6901


;--- Land ---
[Statedef 6901]
type = S
physics = S
anim = 6901
velset = 0, 0

[State 6901, Intro]
type = assertspecial
trigger1 = 1
flag = intro

[State 6901, Pos]
type = posset
trigger1 = !time && numhelper(7650)
x = ceil(helper(7650), pos x)

[State 6901, Pos]
type = posset
trigger1 = !time
y = 0

[State 6901, Snd]
type = playsnd
trigger1 = animelem = 4
value = 3, 5
channel = 0

[State 6901, Snd]
type = playsnd
trigger1 = !time
value = 0, 52

[State 6901, Dust]
type = explod
trigger1 = !time
anim = 7102
ID = 7102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 6901, End]
type = changestate
trigger1 = !animtime
value = 0


;==========<WIN POSE DECIDER>==========
[Statedef 180]
type = S

[State 180, Quote]
type = victoryquote
trigger1 = 1
value = 1 + (random % 15)

[State 180, Quote]
type = victoryquote
triggerall = numenemy
trigger1 = enemy, name = "Ryu"
trigger2 = enemy, name = "cvsryu" || enemy, name = "svcryu"
value = 50

[State 180, Quote]
type = victoryquote
triggerall = numenemy
trigger1 = enemy, name = "Gen"
trigger2 = enemy, name = "cvsgen" || enemy, name = "MasterGen"
value = 51

[State 180, No turning]
type = assertspecial
trigger1 = prevstateno = 4190
flag = noautoturn

[State 180, winSGS / misogi]
type = changestate
trigger1 = prevstateno = 4090 || prevstateno = 4190
value = prevstateno

[State 180, win]
type = changestate
trigger1 = !time
trigger1 = command = "holdx" || command = "holdy" || command = "holdz" || command = "holda" || command = "holdb" || command = "holdc"
value = ifelse((command = "holdz" || command = "holdc"), 183, ifelse((command = "holdy" || command = "holdb"), 181, 182))

[State 180, win]
type = changestate
trigger1 = !time
value = ifelse(random < 333, 181, ifelse(random < 500, 182, 183))


;==========<WIN 1>==========
[Statedef 181]
type = S
anim = 181
ctrl = 0

[State 181, Spr]
type = sprpriority
trigger1 = animelemtime(2) >= 0
value = -1

[State 181, Snd]
type = playsnd
trigger1 = animelem = 4
value = 4, ifelse(random < 500, 2, 8)
channel = 0

[State 181, Kanji]
type = explod
trigger1 = animelem = 4
anim = 6011
ID = 6011
sprpriority = 1
postype = p1
facing = ifelse(facing = 1, 1, -1)
pos = ifelse(facing = 1, 0, 32)
bindtime = -1
removeongethit = 1
ownpal = 1


;==========<WIN 2>==========
[Statedef 182]
type = S
anim = 182
ctrl = 0

[State 182, Snd]
type = playsnd
trigger1 = animelem = 3
value = 3, 5
channel = 0
persistent = 0


;==========<WIN 3>==========
[Statedef 183]
type = S
anim = 183
ctrl = 0

[State 183, Aura]
type = helper
trigger1 = time > 0
trigger1 = animelem = 5
helpertype = normal
stateno = 6000
ID = 6000
postype = p1
ownpal = 1
persistent = 0
ignorehitpause = 1

[State 183, Kanji]
type = helper
trigger1 = time > 0
trigger1 = animelem = 5
helpertype = normal
stateno = 6002
ID = 6002
postype = p1
pos = -5, -100
facing = ifelse(facing = 1, 1, -1)
ownpal = 1
persistent = 0
ignorehitpause = 1

[State 183, Snd]
type = playsnd
trigger1 = time > 0
trigger1 = animelem = 5
value = 5, 4
ignorehitpause = 1

[State 183, Snd]
type = playsnd
trigger1 = animelem = 5
value = 4, 13
channel = 0

[State 183, Dust]
type = helper
trigger1 = animelem = 5
helpertype = normal
stateno = 8111
ID = 8100
name = "Impact Dust"
postype = p1
pos = -34, 0
ownpal = 1

[State 183, Shake]
type = envshake
trigger1 = animelemtime(5) >= 0
trigger1 = !(time % 4)
time = 4
freq = 180
ampl = 1

[State 183, Snd]
type = playsnd
trigger1 = animelemtime(5) >= 0
value = 5, 12
channel = 5
lowpriority = 1


;==========<WIN by S.G.S.>==========
[Statedef 4090]
type = S
sprpriority = -4
anim = 4090

[State 4090, Safety]
type = removeexplod
trigger1 = 1
ID = 6013

[State 4090, Assert]
type = assertspecial
trigger1 = 1
flag = nokoslow

[State 4090, Kanji]
type = helper
trigger1 = !time && prevstateno = 4001
helpertype = normal
stateno = 6012
ID = 6012
postype = p1
facing = ifelse(facing = 1, 1, -1)
pos = ifelse(facing = 1, 0, 32)
ownpal = 1
persistent = 0
pausemovetime = 99
supermovetime = 99

[State 4090, Kanji]
type = helper
trigger1 = !time && prevstateno = 4001
helpertype = normal
stateno = 7610
ID = 7610
postype = left
ownpal = 1
persistent = 0

[State 4090, Snd]
type = playsnd
trigger1 = time = 10 && prevstateno = 4001
value = 4, 12
channel = 0

[State 4090, Win]
type = changestate
trigger1 = time >= 90;over.waittime + over.wintime
trigger1 = roundstate = 3
value = 180
ctrl = 1


;==========<WIN by MISOGI>==========
[Statedef 4190]
type = S
sprpriority = -5

[State 4190, No turning]
type = assertspecial
trigger1 = 1
flag = noautoturn

[State 4190, Anim]
type = changeanim
trigger1 = anim != 4190
value = 4190

[State 4190, Snd]
type = playsnd
trigger1 = animelem = 9
value = 4, 8
channel = 0

[State 184, Kanji]
type = explod
trigger1 = animelem = 9
anim = 6011
ID = 6011
sprpriority = -3
postype = p1
facing = ifelse(facing = 1, 1, -1)
pos = ifelse(facing = 1, 0, 32)
bindtime = -1
removeongethit = 1
ownpal = 1

[State 4190, Win]
type = changestate
trigger1 = time >= 90;over.waittime + over.wintime
trigger1 = roundstate = 3
value = 180
ctrl = 1


;==========<CONTINUE?>==========
[Statedef 5500]
type = S
anim = 5500
ctrl = 0
velset = 0, 0
[State 5500, Anim]
type = changeanim
trigger1 = !time
value = 5500


;==========<FALL RECOVERY>==========
[Statedef 5200]
type = A
movetype = H
physics = N

[State 5200, Anim]
type = changeanim
trigger1 = anim = 5035 && !animtime
value = 5050

[State 5200, Accel]
type = veladd
trigger1 = 1
y = gethitvar(yaccel)

[State 5200, End]
type = selfstate
trigger1 = vel y > 0 && pos y >= -10
value = 5201


[Statedef 5201]
type = S
movetype = I
physics = N
anim = 5200
ctrl = 0
facep2 = 1

[State 5201, Pos]
type = posset
trigger1 = 1
y = 0

[State 5201, Vel]
type = velset
trigger1 = !time
x = -8
y = 0

[State 5201, Vel]
type = velmul
trigger1 = 1
x = 0.9

[State 5201, Snd]
type = playsnd
trigger1 = animelem = 1
value = 3, 1
channel = 0

[State 5201, Snd]
type = playsnd
trigger1 = !time
value = 0, 5200

[State 5201, Flash]
type = palfx
trigger1 = !time
add = 255, 255, 255
sinadd = -255, -255, -255, 20
time = 5

[State 5201, FX]
type = helper
trigger1 = !time
helpertype = normal
stateno = 8200
ID = 8200
name = "Recover FX"
postype = p1
pos = 0, ceil(-16 * const(size.yscale))
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 5201, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1

[State 5201, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


[Statedef 5210]
type = A
movetype = I
physics = N
anim = 5210
ctrl = 0

[State 5210, Snd]
type = playsnd
trigger1 = !time
value = 3, 1
channel = 0

[State 5210, Snd]
type = playsnd
trigger1 = !time
value = 0, 5200

[State 5210, Flash]
type = palfx
trigger1 = !time
add = 255, 255, 255
sinadd = -255, -255, -255, 20
time = 5

[State 5210, FX]
type = helper
trigger1 = !time
helpertype = normal
stateno = 8200
ID = 8200
name = "Recover FX"
postype = p1
pos = 0, ceil(-74 * const(size.yscale))
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 5210, Accel]
type = veladd
trigger1 = 1
y = const(movement.air.gethit.airrecover.yaccel)

[state 5210, Vel]
type = velmul
trigger1 = !time
x = const(velocity.air.gethit.airrecover.mul.x)
y = const(velocity.air.gethit.airrecover.mul.y)

[state 5210, Vel]
type = veladd
trigger1 = !time
x = const(velocity.air.gethit.airrecover.add.x)
y = const(velocity.air.gethit.airrecover.add.y)

[state 5210, Up]
type = veladd
trigger1 = !time
trigger1 = command = "holdup"
y = const(velocity.air.gethit.airrecover.up)

[state 5210, Down]
type = veladd
trigger1 = !time
trigger1 = command = "holddown"
y = const(velocity.air.gethit.airrecover.down)

[state 5210, Forward]
type = veladd
trigger1 = !time
trigger1 = command = "holdfwd"
x = const(velocity.air.gethit.airrecover.fwd)

[state 5210, Back]
type = veladd
trigger1 = !time
trigger1 = command = "holdback"
x = const(velocity.air.gethit.airrecover.back)

[State 5210, Turn]
type = turn
trigger1 = !time
trigger1 = p2dist x < 0

[State 5210, NHB]
type = nothitby
trigger1 = time < 14
value = SCA
time = 1

[State 5210, Ctrl]
type = ctrlset
trigger1 = time >= 14
value = 1

[State 5210, Land]
type = changestate
trigger1 = vel y > 0
trigger1 = vel y > 0 && (pos y > -vel y)
value = 52

;==========<RECOVERY ROLL>==========
[Statedef 5220]
type = A
movetype = H
physics = N

[State 5220, Anim]
type = changeanim
trigger1 = anim = 5035 && !animtime
value = 5050

[State 5220, Accel]
type = veladd
trigger1 = 1
y = gethitvar(yaccel)

[State 5220, End]
type = selfstate
trigger1 = vel y > 0 && pos y >= 10
value = 5221


[Statedef 5221]
type = S
movetype = I
physics = N
anim = 5220
ctrl = 0
velset = 0, 0
sprpriority = 1
facep2 = 1

[State 5221, Push]
type = playerpush
trigger1 = 1
value = 0

[State 5221, Pos]
type = posset
trigger1 = 1
y = 0

[State 5221, Vel]
type = velset
trigger1 = time = 10
x = 6.15

[State 5221, End]
type = changestate
trigger1 = time >= 29 && command != "holdfwd"
trigger2 = time >= 48
value = 11
ctrl = 1


;========================<TARGET AIR RESET>========================
[Statedef 1115040]
type = A
physics = N
movetype = H
velset = 0, 0

[State 1115040, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = gethitvar(hitshaketime) + ceil((-gethitvar(yvel) + ((gethitvar(yvel) ** 2) - 4 * (0.5 * gethitvar(yaccel)) * (pos y)) ** 0.5) / gethitvar(yaccel))

[State 1115040, End]
type = selfstate
trigger1 = 1
value = 5020


;==========<TARGET SAFE FALL>==========
[Statedef 1115200]
type = A
physics = N
movetype = H

[State 1115200, Anim]
type = changeanim
trigger1 = !animtime
trigger1 = anim = 5035
value = 5050

[State 1115200, Accel]
type = veladd
trigger1 = 1
y = gethitvar(yaccel)

[State 1115200, Ground]
type = selfstate
trigger1 = vel y > 0
trigger1 = pos y >= const(movement.air.gethit.groundrecover.ground.threshold)
value = 5200

[State 1115200, Air]
type = selfstate
trigger1 = time >= 60
value = 5210


;==========<TARGET FORCE HITFALL>==========
[Statedef 1115000]
type = A
movetype = H
physics = N

[State 1115000, Fall]
type = hitfallset
trigger1 = 1
value = 1

[State 1115000, End]
type = selfstate
trigger1 = 1
value = prevstateno


;========================<STUNNED>========================
;----- Air get-hit (Shaking) -----
[Statedef 1115310]
type = A
movetype= H
physics = N
velset = 0, 0

[State 1115310, NHB]
type = nothitby
trigger1 = 1
value = SCA

[State 1115310]
type = HitFallSet
trigger1 = 1
value = 1
ignorehitpause = 1

[State 1115310, Anim]
type = ChangeAnim
trigger1 = Time = 0
value = 5030

[State 1115310, Diagup]
type = ChangeAnim
trigger1 = Time = 0
trigger1 = SelfAnimExist(5052)
value = 5052

[State 1115310, Anim]
type = ChangeAnim
trigger1 = Time > 0
value = anim

[State 1115310, Shake]
type = offset
trigger1 = 1
x = ifelse((gametime % 2), -1, 1)

[State 1115310, 5]
type = ChangeState
trigger1 = HitShakeOver
value = 1115311


;----- Knocked away -----
[Statedef 1115311]
type = A
physics = N
movetype = H
ctrl = 0

[State 1115311, NHB]
type = nothitby
trigger1 = 1
value = sca

[State 1115311, Accel]
type = veladd
trigger1 = 1
y = 0.4850;yaccel

[State 1115311, Vel]
type = velset
trigger1 = !time
x = ifelse(p2dist x < 0, 4.31, -4.31)
y = -7.36

[State 1115311, Anim]
type = changeanim
trigger1 = anim != [5000, 5199]
trigger1 = selfanimexist(5030)
value = 5030

[State 1115311, Anim]
type = changeanim
trigger1 = !animtime
trigger1 = anim < 5035
trigger1 = selfanimexist(5035)
value = 5035

[State 1115311, Anim]
type = changeanim
trigger1 = !animtime
trigger1 = anim = 5035
value = 5050

[State 1115311, Anim]
type = changeanim
trigger1 = anim = 5052
trigger1 = vel y >= ifelse(anim = 5050, const720p(4), const720p(-8))
trigger1 = selfanimexist(5062)
value = 5062
persistent = 0

[State 1115311, End]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y >= ifelse(anim = 5052, 0, const(movement.air.gethit.groundlevel))
value = 1115313


;----- Thrown -----
[Statedef 1115312]
type = A
movetype= H
physics = N
ctrl = 0

[State 1115312, NHB]
type = nothitby
trigger1 = 1
value = SCA

[State 1115312, Accel]
type = VelAdd
trigger1 = 1
y = 0.4850;yaccel

[State 1115312, Anim]
type = changeanim
trigger1 = !animtime
trigger1 = selfanimexist(5035)
trigger1 = anim = [5000, 5030]
value = 5035

[State 1115312, Anim]
type = changeanim
triggerall = !animtime
trigger1 = anim = 5035
trigger2 = anim < 5050
trigger2 = !selfanimexist(5035)
value = 5050

[State 1115312, Up Type]
type = changeanim
trigger1 = anim = [5050,5059]
trigger1 = vel y > 0
trigger1 = selfanimexist(anim + 10)
value = anim + 10
persistent = 0

[State 1115312, End]
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= Const(movement.air.gethit.groundlevel)
value = 1115313


;----- hit ground from fall -----
[Statedef 1115313]
type = L
movetype= H
physics = N

[State 1115313, NHB]
type = nothitby
trigger1 = 1
value = SCA

[State 1115313, EnvShake]
type = FallEnvShake
trigger1 = Time = 0

[State 1115313, Var] ;Save fall velocity
type = VarSet
trigger1 = Time = 0
sysvar(1) = floor(vel y)

[State 1115313, 2] ;Hit ground anim (normal)
type = ChangeAnim
triggerall = time = 0
trigger1 = (anim != [5051,5059]) && (anim != [5061,5069])
trigger2 = !SelfAnimExist(5100 + (anim % 10))
value = 5100

[State 1115313, 3] ;Hit ground anim (for hit up)
type = ChangeAnim
trigger1 = time = 0
trigger1 = (anim = [5051,5059]) || (anim = [5061,5069])
trigger1 = SelfAnimExist(5100 + (anim % 10))
value = 5100 + (anim % 10)

[State 1115313, 4]
type = PosSet
trigger1 = Time = 0
y = 0

[State 1115313, 5]
type = velset
trigger1 = Time = 0
y = 0

[State 1115313, 6] ;Reduce speed
type = VelMul
trigger1 = Time = 0
x = 0.75

[State 1115313, 7]
type = ChangeState
trigger1 = Time = 0
trigger1 = GetHitVar(fall.yvel) = 0
value = 1115315 ;Downed get-hit (lying down)

[State 1115313, 8]
type = Explod
trigger1 = Time = 1
anim = F(60 + (sysvar(1) > Const720p(20)) + (sysvar(1) > Const720p(56)))
pos = 0, 0
sprpriority = ifelse (sysvar(1) <= Const720p(56), -10, 10)

[State 1115313, 9]
type = HitFallDamage
trigger1 = Time = 3

[State 1115313, 10]
type = PlaySnd
trigger1 = Time = 1
value = F7, (sysvar(1) > Const720p(20)) + (sysvar(1) > Const720p(56))

[State 1115313, 11]
type = PosFreeze
trigger1 = 1

[State 1115313, 12]
type = ChangeState
trigger1 = AnimTime = 0
value = 1115314 ;Downed get-hit (bounce off ground)

[State 1115313, 13]
type = ForceFeedback
trigger1 = Time = 0
waveform = sinesquare
ampl = 128,-3,-.2,.005
time = 20


;----- bounce off ground -----
[Statedef 1115314]
type = L
movetype= H
physics = N

[State 1115314, NHB]
type = nothitby
trigger1 = 1
value = SCA

[State 1115314, 1] ;Coming hit ground anim (normal)
type = ChangeAnim
triggerall = time = 0
trigger1 = anim != [5101,5109]
trigger2 = !SelfAnimExist(5160 + (anim % 10))
value = 5160

[State 1115314, 2] ;Coming hit ground anim (for hit up)
type = ChangeAnim
triggerall = time = 0
trigger1 = anim = [5101,5109]
trigger1 = SelfAnimExist(5160 + (anim % 10))
value = 5160 + (anim % 10)

[State 1115314, 3]
type = HitFallVel
trigger1 = Time = 0

[State 1115314, 4]
type = PosSet
trigger1 = Time = 0
y = Const(movement.down.bounce.offset.y)

[State 1115314, 5]
type = PosAdd
trigger1 = Time = 0
x = Const(movement.down.bounce.offset.x)

[State 1115314, 6] ;Acceleration
type = VelAdd
trigger1 = 1
y = Const(movement.down.bounce.yaccel)

[State 1115314, 7] ;Hit ground
trigger1 = Vel Y > 0
trigger1 = Pos Y >= Const(movement.down.bounce.groundlevel)
type = ChangeState
value = 1115315


;----- lying down -----
[Statedef 1115315]
type = L
movetype= H
physics = N

[State 1115315, NHB]
type = nothitby
trigger1 = 1
value = SCA

[State 1115315, EnvShake]
type = FallEnvShake
trigger1 = Time = 0

[State 1115315, 1] ;For hit up/up-diag type (from state 5081)
type = ChangeAnim
persistent = 0
trigger1 = SelfAnimExist(5110 + (anim % 10))
trigger1 = anim = [5081,5089]
value = 5110 + (anim % 10)

[State 1115315, 2] ;Hit ground anim (normal)
type = ChangeAnim
triggerall = time = 0
triggerall = anim != [5110,5119] ;Not already changed anim
trigger1 = anim != [5161,5169]
trigger2 = !SelfAnimExist(5170 + (anim % 10))
value = 5170

[State 1115315, 3] ;Hit ground anim (for hit up)
type = ChangeAnim
triggerall = time = 0
triggerall = anim != [5110,5119] ;Not already changed anim
trigger1 = anim = [5161,5169]
trigger1 = SelfAnimExist(5170 + (anim % 10))
value = 5170 + (anim % 10)

[State 1115315, 5]
type = PosSet
trigger1 = Time = 0
y = 0

[State 1115315, Var] ;Get fall velocity
type = VarSet
trigger1 = Time = 0
trigger1 = GetHitVar(fall.yvel) != 0
sysvar(1) = floor(vel y)

[State 1115315, 6]
type = PlaySnd
trigger1 = Time = 0
trigger1 = !SysVar(0)
value = F7, (sysvar(1) > Const720p(20)) + (sysvar(1) > Const720p(56))

[State 1115315, 7]
type = Explod
trigger1 = Time = 0
trigger1 = !SysVar(0)
anim = F(60 + (sysvar(1) > Const720p(20)) + (sysvar(1) > Const720p(56)))
pos = 0, 0
sprpriority = ifelse (sysvar(1) <= Const720p(56), -10, 10)

[State 1115315, 8]
type = velset
trigger1 = Time = 0
y = 0

[State 1115315, Up type]
type = ChangeAnim
persistent = 0
triggerall = anim = [5171,5179]
triggerall = SelfAnimExist(5110 + (anim % 10))
trigger1 = AnimTime = 0
trigger2 = SysVar(0) ;SysVar(0) = 1 avoids hit ground anim
value = 5110 + (anim % 10)

[State 1115315, 10] ;For normal
type = ChangeAnim
persistent = 0
triggerall = Anim != [5111,5119]
trigger1 = AnimTime = 0
trigger2 = SysVar(0) ;SysVar(0) = 1 avoids hit ground frame
value = 5110

[State 1115315, 11]
type = changestate
trigger1 = alive
trigger1 = time >= 10
value = 1115316

[State 1115315, KO]
type = selfState
triggerall = !alive
trigger1 = AnimTime = 0
trigger2 = SysVar(0) ;SysVar(0) = 1 avoids hit ground frame
trigger3 = Anim = [5110,5119]
value = 5150

[State 1115315, 12]
type = VarSet
trigger1 = SysVar(0)
trigger1 = Time = 0
sysvar(0) = 0

[State 1115315, 13]
type = VelMul
trigger1 = 1
x = 0.85

[State 1115315, 14]
type = velset
trigger1 = abs(Vel x) < Const(movement.down.friction.threshold)
persistent = 0
x = 0


;----- getting up -----
[Statedef 1115316]
type = L
movetype= H
physics = N

[State 1115316, NHB]
type = nothitby
trigger1 = 1
value = SCA

[State 1115316, 1a] ;Get up anim (normal)
type = ChangeAnim
triggerall = time = 0
trigger1 = anim != [5111,5119]
trigger2 = !SelfAnimExist(5120 + (anim % 10))
value = 5120

[State 1115316, 1b] ;Get up anim (for hit up/diag-up)
type = ChangeAnim
triggerall = time = 0
trigger1 = anim = [5111,5119]
trigger1 = SelfAnimExist(5120 + (anim % 10))
value = 5120 + (anim % 10)

[State 1115316, 2]
type = velset
trigger1 = Time = 0
x = 0

[State 1115316, 4]
type = HitFallSet
trigger1 = 1
value = 0

[State 1115316, 7]
type = ChangeState
trigger1 = !animtime
trigger2 = time >= 60
value = 1115300


;--- Dizzy ---
[Statedef 1115300]
type = S
physics = S
movetype = H
velset = 0, 0
anim = 5300

[State 1115300, Simul]
type = statetypeset
trigger1 = numenemy > 1
trigger1 = enemynear(0), hitdefattr = SCA, AT
movetype = I

[State 1115300, Hitfall]
type = hitfallset
trigger1 = 1
value = 0

[State 1115300, Max Timer]
type = varset
trigger1 = !time
sysfvar(2) = 120

[State 1115300, Timer]
type = varadd
trigger1 = time
sysfvar(2) = -1
[State 1115300, Timer]
type = varadd
trigger1 = command = "up" || command = "down" || command = "back" || command = "fwd"
sysfvar(2) = -2
[State 1115300, Timer]
type = varadd
trigger1 = command = "x" || command = "y" || command = "z" || command = "a" || command = "b" || command = "c"
sysfvar(2) = -1

[State 1115300, Signal]
type = palfx
trigger1 = command = "up" || command = "down" || command = "back" || command = "fwd"
trigger2 = command = "x" || command = "y" || command = "z" || command = "a" || command = "b" || command = "c"
time = 1
add = 64, 64, 64

[State 1115300, Skip]
type = varset
trigger1 = !time
sysfvar(3) = 0
[State 1115300, Skip]
type = varadd
trigger1 = command = "up" || command = "down" || command = "back" || command = "fwd"
trigger2 = command = "a" || command = "b" || command = "c" || command = "x" || command = "y" || command = "z"
sysfvar(3) = 1

[State 1115300, Skip]
type = changeanim
trigger1 = animelemtime(animelemno(0)) > 0 && animelemtime(animelemno(0) + 1) < 0
trigger1 = animelemtime(animelemno(0) + 1) >= -sysfvar(3)
value = 5300
elem = animelemno(0) + 1
[State 1115300, Skip]
type = varset
trigger1 = animelemtime(1) >= 0 && !animelemtime(animelemno(0))
sysfvar(3) = 0

[State 1115300, End]
type = varset
trigger1 = sysfvar(2) < 0
sysfvar(2) = 0

[State 1115300, End]
type = selfstate
trigger1 = sysfvar(2) <= 0 || time >= 120 || roundstate != 2
value = 0
ctrl = 1


;===========================================================================
;===============================<-2 STATES>=================================
;===========================================================================
[Statedef -2]

[State -2, Hit Detection]
type = varset
trigger1 = movecontact = 1 && var(30) < 0
var(30) = hitpausetime
ignorehitpause = 1

[State -2, HitSound]
type = playsnd
trigger1 = movecontact = 1 && var(30) = hitpausetime
trigger1 = movehit = 1 && var(31) >= 0
trigger1 = stateno != 1500
value = 2, var(31)
channel = 2
ignorehitpause = 1

[State -2, GuardSound]
type = playsnd
trigger1 = moveguarded = 1
trigger1 = var(30) = hitpausetime
value = 2, 0
channel = 2
ignorehitpause = 1

[State -2, Sparks Custom]
type = helper
triggerall = fvar(31)
triggerall = movecontact = 1 && var(30) = hitpausetime
trigger1 = movehit = 1
trigger1 = var(33) = 8010 || var(33) = 8011 || var(33) = 8012 || var(33) = 8013 || var(33) = 8014
trigger2 = moveguarded = 1
trigger2 = var(34) = 8000 || var(34) = 8001
helpertype = normal
stateno = ifelse(moveguarded, var(34), var(33))
ID = 8000
name = "Spark"
postype = p1
facing = ifelse(p2dist x < 0, -1, 1)
pos = ceil(cond(p2dist x > (var(36) * const(size.xscale)), (var(36) * const(size.xscale)), cond(p2dist x > (var(35) * const(size.xscale)), p2dist x, (var(35) * const(size.xscale))))), ceil(var(37) * const(size.yscale))
ownpal = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State -2, Sparks Screenpack]
type = explod
triggerall = !fvar(31)
triggerall = movecontact = 1 && var(30) = hitpausetime
trigger1 = movehit = 1
trigger1 = var(33) = 8010 || var(33) = 8011 || var(33) = 8012 || var(33) = 8013 || var(33) = 8014
trigger2 = moveguarded = 1
trigger2 = var(34) = 8000 || var(34) = 8001
anim = Fifelse(moveguarded, 40, ifelse(var(33) = 8014, 3, ifelse(var(33) = 8012 || var(33) = 8013, 2, ifelse(var(33) = 8011, 1, 0))))
ID = 8000
postype = p1
facing = ifelse(p2dist x < 0, -1, 1)
pos = ceil(cond(p2dist x > (var(36) * const(size.xscale)), (var(36) * const(size.xscale)), cond(p2dist x > (var(35) * const(size.xscale)), p2dist x, (var(35) * const(size.xscale))))), ceil(var(37) * const(size.yscale))
supermovetime = -1
pausemovetime = -1
ontop = 1
ownpal = 1
ignorehitpause = 1

[State -2, Counter FX]
type = helper
trigger1 = movehit = 1
trigger1 = numenemy && var(9)
trigger1 = var(30) = hitpausetime
trigger1 = !(hitdefattr = SCA, AT) && (enemynear, movereversed != 1)
helpertype = normal
stateno = 8290
ID = 8290
name = "Counter FX"
postype = p1
pos = ceil(cond(p2dist x > (var(36) * const(size.xscale)), (var(36) * const(size.xscale)), cond(p2dist x > (var(35) * const(size.xscale)), p2dist x, (var(35) * const(size.xscale))))), ceil(var(37) * const(size.yscale))
ownpal = 1
pausemovetime = 255
supermovetime = 255
ignorehitpause = 1

[State -2, Counter Flag]
type = varadd
trigger1 = var(9) > 0
var(9) = -1
ignorehitpause = 1
[State -2, Counter Flag]
type = varset
trigger1 = numenemy
trigger1 = enemynear, movetype = A
var(9) = 2
ignorehitpause = 1

[State -2, Hit Detection]
type = varset
trigger1 = 1
var(30) = -1
[State -2, Hit Detection]
type = varrangeset
trigger1 = movetype = I
trigger2 = movetype = H && time
first = 30
last = 37
value = -1
ignorehitpause = 1

[State -2, Stun System - Cooldown]
type = varset
trigger1 = p2movetype = H
var(43) = 60
ignorehitpause = 1

[State -2, Stun System - Cooldown]
type = varadd
trigger1 = var(43) > 0
trigger1 = p2movetype != H
var(43) = -1
ignorehitpause = 1

[State -2, Stun System - Cooldown]
type = varadd
triggerall = !numhelper(7260) && !numhelper(7500)
trigger1 = var(42) > 0
trigger1 = var(43) <= 0
var(42) = ifelse(var(42) >= 5, -5, -var(42))
ignorehitpause = 1

[State -2, Stun System - Set]
type = varset
triggerall = movetype = A || var(41) := 0
triggerall = stateno = [200, 2999]
triggerall = !var(20)
trigger1 = stateno = 200 || stateno = 230 || stateno = 400 || stateno = 430 || stateno = 600 || stateno = 630 || stateno = 215
trigger1 = var(41) := 50
trigger2 = stateno = 210 || stateno = 240 || stateno = 410 || stateno = 440 || stateno = 610 || stateno = 640 || anim = 651 || stateno = 245 || stateno = 645
trigger2 = var(41) := 100
trigger3 = stateno = 220 || stateno = 250 || stateno = 420 || stateno = 450 || stateno = 620 || anim = 650
trigger3 = var(41) := 200
trigger4 = stateno = 1100
trigger4 = var(41) := ifelse(var(10) = 3, 66, ifelse(var(10) = 2, 50, 34))
trigger5 = stateno = 1200
trigger5 = var(41) := ifelse(var(1) = 2, 100, ifelse(var(10) = 3, 80, ifelse(var(10) = 2, 100, 25)))
trigger6 = stateno = 1250
trigger6 = var(41) := 50
trigger7 = stateno = 1301 || stateno = 1303 || stateno = 1304 || stateno = 1305
trigger7 = var(41) := 50
trigger8 = stateno = 1302
trigger8 = var(41) := 100
trigger9 = stateno = 1505
trigger9 = var(41) := 150
var(41) = var(41)

[State -2, Stun System - Add]
type = varadd
trigger1 = movehit = 1
trigger1 = numtarget
trigger1 = target, gethitvar(damage) > 0
trigger1 = var(20) = 0
trigger1 = var(41) > 0
trigger1 = var(42) >= 0
trigger1 = hitdefattr != SCA, HA, HP, HT
var(42) = ceil(var(41) * fvar(11))
ignorehitpause = 1

[State -2, Stun Killer]
type = varset
trigger1 = numenemy > 1
trigger2 = numpartner
trigger3 = roundstate != 2
trigger4 = !fvar(33)
var(42) = -1 + 0 * (var(43) := 0)
ignorehitpause = 1

[State -2, Stun System - Dizzy]
type = targetstate
trigger1 = movehit = 1
trigger1 = numenemy = 1 && numpartner = 0
trigger1 = numtarget
trigger1 = target, gethitvar(damage) < target, life
trigger1 = var(42) >= (target, const(data.life))
value = 1115310
ignorehitpause = 1

[State -2, Stun System - No redizzy]
type = varset
triggerall = numenemy
trigger1 = enemynear, stateno = [1115300, 1115319]
trigger2 = enemynear, stateno = 5300;Ikemen
var(42) = -1
ignorehitpause = 1

[State -2, Stun System Reset]
type = varset
trigger1 = var(42) < 0
trigger1 = p2movetype != H
trigger2 = (numenemy + numpartner) > 1
var(42) = 0
ignorehitpause = 1

[State -2, Stun System Dizzy Stars]
type = helper
trigger1 = roundstate = 2
trigger1 = !numhelper(8970)
trigger1 = numenemy = 1 && numpartner = 0
trigger1 = enemynear, stateno = [1115300, 1115319]
helpertype = normal
stateno = 8970
ID = 8970
name = "Dizzy Stars"
postype = p2
ownpal = 1
ignorehitpause = 1

[State -2, Lv2 Gou Zankuu Hitsound]
type = playsnd
trigger1 = var(52)
value = 2, ifelse(var(52) = 1, 0, 7) + (var(52) := 0)
pan = ceil(p2dist x)
channel = 2
ignorehitpause = 1

[State -2, P2 Facing]
type = targetfacing
triggerall = movecontact = 1 && numtarget
triggerall = !(target, hitfall) && (target, time <= 1)
trigger1 = !(target, hitshakeover)
trigger2 = target, stateno = [150, 155]
value = ifelse(p2dist x >= 0, -1, 1)
ignorehitpause = 1

[State -2, P2 Air Reset]
type = targetstate
trigger1 = numtarget = 1
trigger1 = target, stateno = 5020
trigger1 = target, prevstateno != 1115040
trigger1 = target, alive && !(target, hitfall)
value = 1115040
ignorehitpause = 1

[State -2, P2 Safe Fall]
type = targetstate
trigger1 = numtarget = 1
trigger1 = target, command = "recovery"
trigger1 = target, pos y >= -48 && target, vel y > 0
trigger1 = target, alive && target, hitfall && target, gethitvar(fall.recover)
trigger1 = target, stateno = 5030 || target, stateno = 5035 || target, stateno = 5050 || target, stateno = 5071
value = 1115200
ignorehitpause = 1

[State -2, Juggle Increase]
type = varadd
trigger1 = numenemy
trigger1 = !numhelper(7260) && !numhelper(7500)
trigger1 = enemynear, hitfall
trigger1 = enemynear, time = [0, 1]
trigger1 = enemynear, gethitvar(damage)
var(15) = 1
ignorehitpause = 1

[State -2, Juggle Reset Single]
type = varset
triggerall = numenemy = 1 && var(15)
trigger1 = (enemy, statetype != A) && (enemy, stateno != 5080) && (enemy, time >= 1)
trigger2 = (enemy, movetype != H) || (enemy, stateno = [120, 155]) || (enemy, ctrl) || !(enemy, hitfall)
var(15) = 0
ignorehitpause = 1
[State -2, Juggle Reset Simul]
type = varset
triggerall = numenemy >= 2 && var(15)
trigger1 = (enemynear(0), statetype != A) && (enemynear(0), stateno != 5080) && (enemynear(0), time >= 1)
trigger1 = (((enemynear(0), pos x) - pos x) * facing) >= 0
trigger2 = (enemynear(0), movetype != H) || (enemynear(0), stateno = [120, 155]) || (enemynear(0), ctrl) || !(enemynear(0), hitfall)
trigger2 = (((enemynear(0), pos x) - pos x) * facing) >= 0
trigger3 = (enemynear(1), statetype != A) && (enemynear(1), stateno != 5080) && (enemynear(1), time >= 1)
trigger3 = (((enemynear(1), pos x) - pos x) * facing) = [0, 160]
trigger4 = (enemynear(1), movetype != H) || (enemynear(1), stateno = [120, 155]) || (enemynear(1), ctrl) || !(enemynear(1), hitfall)
trigger4 = (((enemynear(1), pos x) - pos x) * facing) = [0, 160]
var(15) = 0
ignorehitpause = 1
[State -2, Free Juggling]
type = varset
trigger1 = roundstate != 2
var(15) = 0
ignorehitpause = 1

[State -2, Super Cancel Juggle]
type = varset
triggerall = time <= 10
triggerall = prevstateno = [1000, 4999]
trigger1 = stateno = 3000 || stateno = 3050 || stateno = 3070 || stateno = 3100 || stateno = 3200 || stateno = 3250 || stateno = 3300
trigger2 = stateno = 4000 || stateno = 4100 || stateno = 4200 || stateno = 4300
var(15) = 0
ignorehitpause = 1

[State -2, Aerial Rave Juggle]
type = varset
trigger1 = time = 1
trigger1 = stateno = 40 && prevstateno = 420
trigger2 = time = 1
trigger2 = (stateno = [600, 699]) && (prevstateno = [600, 699])
var(15) = 0
ignorehitpause = 1

[State -2, Custom Combo End]
type = varset
trigger1 = var(20) < 0
trigger2 = movetype = H
trigger3 = roundstate != 2
var(20) = 0
ignorehitpause = 1
[State -2, Custom Combo Time]
type = varadd
trigger1 = var(20) > 0
var(20) = -1
ignorehitpause = 1

[State -2, Throws Allowed]
type = varset
triggerall = numenemy
trigger1 = enemynear, movetype != H
trigger1 = enemynear, stateno != 140
trigger1 = (enemynear, ctrl && enemynear, time >= 1) || (enemynear, time >= 8)
trigger2 = enemynear, movetype = A
trigger3 = enemynear, statetype = A
trigger4 = (enemynear, stateno != [0, 52]) && (enemynear, stateno != [120, 155]) && (enemynear, stateno != [5000, 5120])
trigger5 = enemynear, anim = 5300
var(29) = 0
ignorehitpause = 1
[State -2, Throws Disallowed]
type = varset
triggerall = numenemy
triggerall = enemynear, anim != 5300
trigger1 = enemynear, stateno = [150, 155]
trigger2 = (enemynear, stateno = 51 || enemynear, stateno = 140) && (enemynear, prevstateno = [150, 155])
trigger3 = enemynear, movetype = H && enemynear, statetype != A && !var(20)
trigger4 = enemynear, movetype = H && enemynear, statetype = A && enemynear, hitfall = 0
trigger5 = enemynear, stateno = 40 && enemynear, prevstateno != 52 && (enemynear, anim != [0, 29])
var(29) = 1
ignorehitpause = 1

[State -2, Total Combo Damage]
type = varset
trigger1 = numenemy
trigger1 = (enemynear, movetype != H) && (enemynear, anim != 5300)
var(44) = p2life
ignorehitpause = 1

[State -2, Dampener]
type = varset
trigger1 = numenemy
fvar(10) = ifelse(var(44) - p2life <= 0, 1.0, ifelse(var(44) - p2life >= 500, 0.1, 1 - ((var(44) - p2life) * 0.0018)))
ignorehitpause = 1

[State -2, Dampener Chain Combos]
type = varset
trigger1 = p2movetype = H
trigger1 = stateno = [200, 699]
trigger1 = prevstateno = [200, 699]
fvar(10) = ifelse(var(44) - p2life <= 0, 0.75, ifelse(var(44) - p2life >= 375, 0.075, 0.75 - ((var(44) - p2life) * 0.00135)))
ignorehitpause = 1

[State -2, Dampener Custom Combo]
type = varset
trigger1 = var(20)
trigger1 = numenemy
fvar(10) = ifelse(var(44) - p2life <= 0, 0.75, ifelse(var(44) - p2life >= 375, 0.075, 0.75 - ((var(44) - p2life) * 0.00135)))
ignorehitpause = 1

[State -2, Dampener Sweeps]
type = varset
trigger1 = numenemy = 1
trigger1 = enemynear, gethitvar(fallcount) >= 1
trigger1 = enemynear, const(data.fall.defence_mul) = (100.0 / 150.0);default
fvar(10) = fvar(10) / ((2.0 / 3.0) ** enemynear, gethitvar(fallcount))
ignorehitpause = 1

[State -2, Dampener Counter Hit]
type = varset
trigger1 = 1
fvar(11) = fvar(10) * ifelse(var(9), 1.2, 1)
ignorehitpause = 1

[State -2, Dampener Result]
type = attackmulset
trigger1 = 1
value = fvar(11)
ignorehitpause = 1

[State -2, Minimum Damage]
type = targetlifeadd
trigger1 = movehit = 1
trigger1 = numtarget = 1
trigger1 = target, gethitvar(damage) = [1, 6]
trigger1 = target, life > (7 + (target, gethitvar(damage)))
value = -7 + (target, gethitvar(damage))
kill = 0
ignorehitpause = 1

[State -2, Custom Combo Guard]
type = assertspecial
trigger1 = var(20) > 0
flag = nostandguard
flag2 = nocrouchguard
flag3 = noairguard
ignorehitpause = 1

[State -2, Custom Combo PalFX]
type = palfx
trigger1 = var(20) > 60
time = 2
add = 24 + ceil(sin(var(20) / 16.0 * pi) * 24), 24 + ceil(sin(var(20) / 16.0 * pi) * 24), 24 + ceil(sin(var(20) / 16.0 * pi) * 24)
ignorehitpause = 1
[State -2, Custom Combo PalFX]
type = palfx
trigger1 = var(20) = [1, 60]
trigger1 = !(gametime % 4)
time = 2
add = 0, 96, 256
ignorehitpause = 1

[State -2, No Dizzy >:)]
type = selfstate
trigger1 = AIlevel
trigger1 = anim = 5300
trigger1 = numenemy && !pos y
trigger1 = enemynear, movetype != A
trigger1 = ((enemy, name = "Catwalk") + (enemy, authorname = "Phantom.of.the.Server")) != 2
value = 0
ctrl = 1

[State -2, Snd]
type = stopsnd
trigger1 = prevstateno = 193
trigger1 = time <= 1
channel = 4

[State -2, KO snd]
type = varset
trigger1 = alive
trigger1 = var(48) > 0
trigger2 = !alive
trigger2 = var(48) < 2
var(48) = ifelse(alive, 0, var(48) + 1)
ignorehitpause = 1

[State -2, KO snd]
type = playsnd
trigger1 = !alive
trigger1 = var(48) = 1
trigger1 = var(48) := 2
trigger1 = stateno != 5950
value = 11, ifelse(random < 500, 1, 2)
ignorehitpause = 1

[State -2, Drop Target]
type = targetdrop
triggerall = numtarget = 1
trigger1 = target, stateno = 5040
trigger2 = target, stateno = [5200, 5210]
ignorehitpause = 1

[State -2, Dizzy Voice]
type = playsnd
trigger1 = time = 1
trigger1 = anim = 5300
value = 5000, 5
channel = 0

[State -2, Voice Pos]
type = sndpan
trigger1 = 1
channel = 0
pan = 0
ignorehitpause = 1

[State -2, Debug]
type = displaytoclipboard
trigger1 = 1
text = "Damage = %.2f Juggle = %d Throws = %d Stun = %d"
params = fvar(11), var(15), var(29), var(42)
ignorehitpause = 1

[State -2, Debug]
type = appendtoclipboard
trigger1 = 1
text = "\nBy PotS - http://www.mugenguild.com/pots/"
ignorehitpause = 1


;===========================================================================
;===============================<-3 STATES>=================================
;===========================================================================
[Statedef -3]

[State -3, Inputs]
type = helper
trigger1 = !AIlevel
trigger1 = !numhelper(9999)
name = "Shin Gouki Inputs"
ID = 9999
postype = p1
stateno = 9999
keyctrl = 1
size.air.back = 1
size.air.front = 1
ignorehitpause = 1

[State -3, Do or do not]
type = assertspecial
trigger1 = stateno = [120, 132]
flag = nostandguard
flag2 = nocrouchguard
flag3 = noairguard

[State -3, No Guard Cheating]
type = assertspecial
trigger1 = ctrl
trigger1 = !AIlevel
trigger1 = command = "holdfwd" && command = "holdback"
flag = nostandguard
flag2 = nocrouchguard
flag3 = noairguard
ignorehitpause = 1

[State -3, Turning Threshold]
type = assertspecial
trigger1 = roundstate = 2
trigger1 = backedgebodydist > 0
trigger1 = p2dist x >= -const(size.ground.back)
flag = noautoturn

[State -3, Unguardable Freeze]
type = assertspecial
triggerall = movetype = A
triggerall = !movecontact && !numtarget
triggerall = var(20) || stateno = 4100
trigger1 = numenemy >= 1
trigger1 = enemynear(0), time <= 0
trigger1 = enemynear(0), stateno = 120
trigger1 = enemynear(0), anim != [120, 155]
trigger2 = numenemy >= 2
trigger2 = enemynear(0), time <= 0 && enemynear(1), time <= 0
trigger2 = enemynear(0), stateno = 120 && enemynear(1), stateno = 120
trigger2 = (enemynear(0), anim != [120, 155]) && (enemynear(1), anim != [120, 155])
flag = unguardable

[State -3, Infinite Prevention]
type = targetstate
trigger1 = !var(20)
trigger1 = numtarget = 1
trigger1 = stateno = [600, 699]
trigger1 = prevstateno = [600, 699]
trigger1 = target, gethitvar(hitcount) >= 12
trigger1 = target, alive && !(target, hitfall)
trigger1 = target, stateno = 5000 || target, stateno = 5010 || target, stateno = 5020 || target, stateno = 5070 || target, stateno = 5080
trigger1 = target, prevstateno != 1115300 && target, prevstateno != 5300
value = 1115000
ignorehitpause = 1

[State -3, Parry Detection]
type = helper
triggerall = roundstate = 2
triggerall = !numhelper(705) && !var(20)
triggerall = (movetype = I && ctrl) || (stateno = [700, 702]) || stateno = 5120
trigger1 = !AIlevel
trigger1 = command != "rlsdir"
trigger1 = statetype = S || statetype = C || stateno = 5120
trigger1 = (p2dist x >= 0 && command = "fwd") || (p2dist x < 0 && command = "back") || (command = "down")
trigger2 = !AIlevel
trigger2 = command != "rlsdir"
trigger2 = statetype = A
trigger2 = var(3) != 1 && var(3) != 2
trigger2 = (p2dist x >= 0 && command = "fwd") || (p2dist x < 0 && command = "back")
trigger3 = AIlevel
trigger3 = inguarddist
trigger3 = stateno != [700, 702]
trigger3 = random < (50 * (AIlevel ** 2 / 64.0))
trigger4 = AIlevel
trigger4 = stateno = [700, 702]
trigger4 = time = 14 && random < 667
helpertype = normal
stateno = 705
ID = 705
name = "Parry Detection"
postype = p1
pausemovetime = 65535
supermovetime = 65535

[State -3, Parry Attacks]
type = changestate
trigger1 = (stateno != [700, 702]) && numhelper(705)
trigger1 = helper(705), stateno = 706
value = ifelse((helper(705), anim = 707), 702, ifelse((helper(705), anim = 706), 701, 700))
ignorehitpause = 1
[State -3, Parry Projectiles]
type = hitoverride
trigger1 = (stateno != [700, 702]) && numhelper(705)
trigger1 = !(helper(705), var(0)) && (helper(705), anim = 705)
attr = SA, AP
stateno = 700
slot = 0
time = 1
ignorehitpause = 1
[State -3, Parry Projectiles]
type = hitoverride
trigger1 = (stateno != [700, 702]) && numhelper(705)
trigger1 = !(helper(705), var(0)) && (helper(705), anim = 706)
attr = C, AP
stateno = 701
slot = 0
time = 1
ignorehitpause = 1
[State -3, Parry Projectiles]
type = hitoverride
trigger1 = (stateno != [700, 702]) && numhelper(705)
trigger1 = !(helper(705), var(0)) && (helper(705), anim = 707)
attr = SCA, AP
stateno = 702
slot = 0
time = 1
ignorehitpause = 1

[State -3, NoWalk after Parry]
type = assertspecial
trigger1 = var(26) > 0
trigger1 = var(26) := (var(26) - 1) || 1
flag = nowalk

[State -3, ProjContact Reset]
type = varset
triggerall = var(18)
trigger1 = stateno != 1000 && stateno != 1020 && stateno != 1050 && stateno != 3000 && stateno != 3050 && stateno != 3070 && stateno != 4200 && stateno != 4300
trigger2 = stateno = 1000 && animelemtime(5) < 0
trigger3 = stateno = 1020 && animelemtime(10) < 0
trigger4 = stateno = 1050 && animelemtime(2) < 0
trigger5 = stateno = 3000 && anim = 3000
trigger6 = stateno = 3050 && animelemtime(8) < 0
trigger7 = stateno = 3070 && animelemtime(5) < 0
trigger8 = stateno = 4200 && animelemtime(15) < 0
trigger9 = stateno = 4300 && anim = 4300 && animelemtime(6) < 0
var(18) = 0

[State -3, ProjContact Timer]
type = varadd
trigger1 = var(18)
var(18) = 1

[State -3, Projectile Flag]
type = varset
trigger1 = 1
var(39) = 0
ignorehitpause = 1
[State -3, Projectile Flag]
type = varset
triggerall = var(39) != 1
triggerall = var(20) <= 0
trigger1 = stateno != 1000 && numhelper(1005)
trigger1 = helper(1005), stateno = 1005
trigger2 = stateno != 1020 && numhelper(1025)
trigger2 = helper(1025), stateno = 1025
trigger3 = stateno != 1050 && numhelper(1055)
trigger3 = helper(1055), stateno = 1055
trigger4 = stateno != 1050 && numhelper(1056)
trigger4 = helper(1056), stateno = 1055
trigger5 = stateno != 3000 && numhelper(3005)
trigger5 = helper(3005), stateno = 3005
trigger6 = stateno != 3050 && numhelper(3055)
trigger6 = helper(3055), stateno = 3055
trigger7 = stateno != 3070 && numhelper(3075)
trigger7 = helper(3075), stateno = 3075
trigger8 = stateno != 4200 && numhelper(4206)
trigger8 = helper(4206), stateno = 4206
trigger9 = stateno != 4300 && numhelper(4305)
trigger9 = helper(4305), stateno = 4305
var(39) = 1
ignorehitpause = 1

[State -3, Cancel into Normals Reset]
type = varset
trigger1 = movetype = H
trigger2 = movereversed != [1, 2]
var(4) = 0
ignorehitpause = 1
[State -3, Cancel into Normals Check]
type = varset
triggerall = var(20)
trigger1 = var(20) && (stateno = [200, 699]) && (movecontact + movereversed)
trigger2 = var(20) && (stateno = [1000, 2999]) && statetype != A && ((movecontact + movereversed) || var(18))
var(4) = 1
ignorehitpause = 1

[State -3, Cancel Reset]
type = varset
trigger1 = movetype = H
trigger2 = movereversed != [1, 2]
var(6) = 0
ignorehitpause = 1
[State -3, Cancel Check]
type = varset
triggerall = stateno = [200, 2999]
trigger1 = var(20) && (stateno = [200, 699])
trigger2 = var(20) && (stateno = [1000, 2999]) && ((movecontact + movereversed) || var(18))
trigger3 = (stateno = [200, 699]) && time <= 2
trigger3 = prevstateno != [200, 699]
trigger4 = (stateno = [200, 699]) && stateno != 215
trigger4 = (movecontact + movereversed) = [1, 8]
var(6) = 1
ignorehitpause = 1

[State -3, Super Cancel Reset]
type = varset
trigger1 = movetype = H
trigger2 = movereversed != [1, 2]
var(7) = 0
ignorehitpause = 1
[State -3, Super Cancel Check]
type = varset
triggerall = stateno = [200, 2999]
trigger1 = var(6)
trigger2 = stateno = 1000
trigger2 = animelemtime(10) < 0 && var(18)
trigger3 = stateno = 1020
trigger3 = animelemtime(15) < 0 && var(18)
trigger4 = stateno = 1050
trigger4 = animelemtime(9) < 0 && var(18)
trigger5 = stateno = 1100
trigger5 = vel y < 4 && (movecontact + movereversed)
trigger6 = stateno = 1200
trigger6 = anim = 1200 && (movecontact + movereversed)
trigger7 = stateno = 1250
trigger7 = animelemtime(35) < 0 && (movecontact + movereversed)
trigger8 = stateno = 1301
trigger8 = (movecontact + movereversed)
trigger9 = stateno = 1302
trigger9 = (movecontact + movereversed)
trigger10 = stateno = 1305
trigger10 = (movecontact + movereversed)
trigger11 = stateno = 1321
trigger11 = numtarget && animelemtime(2) > 0
trigger12 = stateno = 1505
trigger12 = (movecontact + movereversed)
var(7) = 1
ignorehitpause = 1

[State -3, Hyper Cancel Reset]
type = varset
trigger1 = movetype = H
trigger2 = movereversed != [1, 2]
var(8) = 0
ignorehitpause = 1
[State -3, Hyper Cancel]
type = varset
triggerall = stateno = [3000, 4999]
trigger1 = stateno = 3000
trigger1 = animelemtime(10) < 0 && var(18)
trigger2 = stateno = 3050
trigger2 = animelemtime(13) < 0 && var(18)
trigger3 = stateno = 3070
trigger3 = animelemtime(35) < 0 && var(18)
trigger4 = stateno = 3100
trigger4 = vel y < 4 && (movecontact + movereversed)
trigger5 = stateno = 3200
trigger5 = vel y < 4 && (movecontact + movereversed)
trigger6 = stateno = 3250
trigger6 = vel y < 4 && (movecontact + movereversed)
trigger7 = stateno = 4200
trigger7 = animelemtime(15) > 12 && var(18)
trigger8 = stateno = 4300
trigger8 = animelemtime(7) >= 1 && var(18)
var(8) = 1
ignorehitpause = 1

[State -3, Movement Afterimage]
type = afterimage
triggerall = time = 1 && !var(20)
trigger1 = stateno = 50 && (var(3) = [2, 3])
trigger2 = stateno = [710, 725]
time = 2
timegap = 1
framegap = 4
length = 9
palbright = 0, 0, 0
paladd = 0, 0, 0
palmul = 0.9, 0.9, 0.9
palcontrast = 120, 120, 120
palpostbright = 0, 0, 0
trans = add1

[State -3, Lv1 Super Afterimage]
type = afterimage
trigger1 = stateno = 3000 && anim = 3000 && animelem = 3
trigger2 = stateno = 3050 && animelem = 2
trigger3 = stateno = 3100 && anim = 3100 && animelemtime(1) = 2
trigger4 = stateno = 3200 && anim = 3200 && animelem = 2
trigger5 = stateno = 3250 && anim = 3250 && animelem = 3
trigger6 = stateno = 3300 && time = 1
time = 2
timegap = 1
framegap = 10
length = 21
palcolor = 0
palbright = 0, 0, 0
palcontrast = 0, 64, 256
palpostbright = 0, 0, 0
paladd = 0, 0, 0
palmul = 0.75, 0.75, 0.75
trans = add1

[State -3, Lv2 Super Afterimage]
type = afterimage
trigger1 = stateno = 3070 && animelem = 2
trigger2 = stateno = 4200 && animelem = 2
trigger3 = stateno = 4300 && animelem = 6
time = 2
timegap = 1
framegap = 10
length = 21
palcolor = 0
palbright = 0, 0, 0
palcontrast = 192, 0, 256
palpostbright = 0, 0, 0
paladd = 0, 0, 0
palmul = 0.75, 0.75, 0.75
trans = add1

[State -3, Lv3 Super Afterimage]
type = afterimage
trigger1 = stateno = 4000 && time = 1
trigger2 = stateno = 4100 && anim = 4101 && animelemtime(1) = 1
trigger3 = stateno = 189 && time = 1
time = 2
timegap = 1
framegap = 10
length = 21
palcolor = 0
palbright = 0, 0, 0
palcontrast = 256, 0, 0
palpostbright = 0, 0, 0
paladd = 0, 0, 0
palmul = 0.75, 0.75, 0.75
trans = add1

[State -3, AfterImagePersist]
type = afterimagetime
trigger1 = stateno = 50 || (stateno = [600, 699])
trigger1 = (var(3) = 2 || var(3) = 3) && vel y < -1
trigger2 = var(20) > 0
trigger3 = (stateno = [3000, 4999])
trigger3 = anim != 1101 && anim != 1102 && anim != 3205 && stateno != 4090 && stateno != 4190 && anim != 4301
trigger4 = (stateno = [710, 725]) || stateno = 1400
trigger5 = stateno = 189 && animelemtime(2) < 0
time = 2

[State -3, Scary Supers]
type = attackdist
trigger1 = stateno = [3000, 4999]
value = 320

[State -3, Corner Push]
type = varset
trigger1 = fvar(5)
trigger1 = abs(fvar(5)) < 1.0
fvar(5) = 0
[State -3, Corner Push]
type = varset
trigger1 = fvar(5)
trigger1 = numtarget
trigger1 = target, hitover || (target, gethitvar(hitshaketime) > 0 && target, time <= 0)
fvar(5) = 0
[State -3, Corner Push]
type = varset
trigger1 = movecontact = 1 && numtarget
fvar(5) = target, gethitvar(xvel)
ignorehitpause = 1
[State -3, Corner Push]
type = posadd
triggerall = fvar(5)
triggerall = numtarget
triggerall = !hitpausetime && target, gethitvar(hitshaketime) <= 0
triggerall = (target, statetype = S || target, statetype = C) && !(target, gethitvar(yvel)) && !(target, hitfall)
trigger1 = target, frontedgebodydist <= abs(target, vel x)
trigger1 = (target, gethitvar(xvel) * target, facing) > 0
trigger2 = target, backedgebodydist <= abs(target, vel x)
trigger2 = (target, gethitvar(xvel) * target, facing) < 0
x = ifelse(target, frontedgebodydist <= 0, -1, 1) * (target, facing) * fvar(5)
[State -3, Corner Push]
type = varset
trigger1 = numtarget
trigger1 = target, gethitvar(hitshaketime) <= 0
fvar(5) = fvar(5) * 0.85

[State -3, Underground Juggle Prevention]
type = targetbind
trigger1 = movecontact = 1
trigger1 = numtarget = 1 && numenemy
trigger1 = target, time <= 0
trigger1 = target, ID = enemynear, ID
trigger1 = !(target, hitshakeover) && (target, pos y > 0)
pos = ceil(p2dist x), ceil(-pos y)
ignorehitpause = 1

[State -3, High Jump Input]
type = varset
trigger1 = var(2) > 12
var(2) = 0
[State -3, High Jump Input]
type = varadd
trigger1 = var(2) > 0
var(2) = 1
[State -3, High Jump Input]
type = varset
trigger1 = command = "highjump"
trigger1 = ifelse(statetype = C, command != "rlsdir", 1)
var(2) = 1

[State -3, Jump Reset]
type = varset
trigger1 = var(3)
trigger1 = stateno != 40 && statetype != A
var(3) = 0

[State -3, Force Crossup]
type = width
triggerall = p2statetype != L
trigger1 = statetype = A && var(3) = 3
trigger2 = stateno = 1400 && animelemtime(6) >= 0
edge = -2, 0
ignorehitpause = 1

[State -3, Shin P2BodyDist X]
type = varset
trigger1 = numenemy
trigger1 = p2dist x <= (const(size.ground.front) + ifelse(enemynear, facing != facing, enemynear, const(size.ground.front), enemynear, const(size.ground.back)))
trigger1 = p2dist x >= (-const(size.ground.back) - ifelse(enemynear, facing != facing, enemynear, const(size.ground.back), enemynear, const(size.ground.front)))
fvar(16) = 0
[State -3, Shin P2BodyDist X]
type = varset
trigger1 = numenemy
trigger1 = p2dist x > 0
trigger1 = p2dist x > (const(size.ground.front) + ifelse(enemynear, facing != facing, enemynear, const(size.ground.front), enemynear, const(size.ground.back)))
fvar(16) = p2dist x - (const(size.ground.front) + ifelse(enemynear, facing != facing, enemynear, const(size.ground.front), enemynear, const(size.ground.back)))
[State -3, Shin P2BodyDist X]
type = varset
trigger1 = numenemy
trigger1 = p2dist x < 0
trigger1 = p2dist x < (-const(size.ground.back) - ifelse(enemynear, facing != facing, enemynear, const(size.ground.back), enemynear, const(size.ground.front)))
fvar(16) = p2dist x - (-const(size.ground.back) - ifelse(enemynear, facing != facing, enemynear, const(size.ground.back), enemynear, const(size.ground.front)))

[State -3, Variable Height]
type = playerpush
triggerall = statetype = A
triggerall = movetype != H && numenemy
triggerall = !(vel y > 0 && (pos y > -vel y))
triggerall = (vel x > 0 && (fvar(16) = [-vel x, 0])) || (vel x < 0 && (fvar(16) = [0, -vel x]))
trigger1 = p2statetype = S
trigger1 = (p2dist y - vel y) > (enemynear, const(size.height) + 13 - ifelse((stateno = [100, 106]), 16, 32))
trigger2 = p2statetype = C
trigger2 = (p2dist y - vel y) > (enemynear, const(size.height) - 13 - ifelse((stateno = [100, 106]), 16, 32))
trigger3 = p2statetype = L
trigger3 = (p2dist y - vel y) > (12 - ifelse((stateno = [100, 106]), 16, 32))
value = 0
ignorehitpause = 1

[State -3, GetHit Snd]
type = playsnd
triggerall = alive && time = 1
triggerall = stateno = 5000 || stateno = 5010
trigger1 = gethitvar(animtype) >= 2 && random < 500
trigger2 = gethitvar(animtype) = 1 && random < 375
trigger3 = gethitvar(animtype) = 0 && random < 250
value = 5000, 1 + (random % 5)
channel = 0
ignorehitpause = 1

[State -3, GetHit Snd]
type = playsnd
triggerall = alive && time = 1
trigger1 = (stateno = 5000 || stateno = 5010) && numenemy
trigger1 = gethitvar(fall) || (enemynear, hitdefattr = SCA, SA, HA)
trigger2 = (stateno = 5020 || stateno = 5070 || stateno = 5080)
trigger3 = (stateno = 5050 || stateno = 5100) && (prevstateno != [5000, 5199])
value = 5000, 1 + (random % 5)
channel = 0
ignorehitpause = 1

[State -3, Cheap KO]
type = changestate
trigger1 = !alive
trigger1 = stateno = [5000, 5010]
trigger1 = (prevstateno = [130, 131]) || (prevstateno = [140, 141]) || (prevstateno = [150, 153])
value = 5950

[State -3, Custom Combo Finish]
type = helper
triggerall = winKO
triggerall = roundstate = 3
triggerall = var(20) && !numhelper(8600)
trigger1 = movehit = [1, 4]
trigger2 = numhelper(1005)
trigger2 = helper(1005), var(18)
trigger3 = numhelper(1025)
trigger3 = helper(1025), var(18)
trigger4 = numhelper(1055)
trigger4 = helper(1055), var(18)
trigger5 = numhelper(1056)
trigger5 = helper(1056), var(18)
trigger6 = stateno = 805 && animelemtime(4) >= 0 && animelemtime(6) < 0
trigger7 = stateno = 810 && (animelemtime(4) = [0, 1])
trigger8 = stateno = 815 && (animelemtime(12) = [0, 1])
trigger9 = stateno = 860 && (animelemtime(8) = [0, 1])
trigger10 = stateno = 1321 && (animelemtime(2) = [0, 1])
trigger11 = stateno = 1331 && time <= 1
helpertype = normal
stateno = 8600
ID = 8600 + 0 * (var(23) := 900)
name = "Super Finish"
postype = left
pos = 160, -120
ownpal = 1
ignorehitpause = 1
pausemovetime = 999
supermovetime = 999

[State -3, Super Finish]
type = helper
triggerall = winKO
triggerall = roundstate = 3
triggerall = !numhelper(8600) && !numhelper(7610)
trigger1 = movehit = [1, 4]
trigger1 = stateno = [3000, 4999]
trigger1 = var(23) := stateno
trigger2 = numhelper(3005)
trigger2 = helper(3005), var(18)
trigger2 = var(23) := 3000
trigger3 = numhelper(3055)
trigger3 = helper(3055), var(18)
trigger3 = var(23) := 3050
trigger4 = numhelper(3075)
trigger4 = helper(3075), var(18)
trigger4 = var(23) := 3070
trigger5 = numhelper(4205)
trigger5 = helper(4205), var(18)
trigger5 = var(23) := 4200
trigger6 = numhelper(4206)
trigger6 = helper(4206), var(18)
trigger6 = var(23) := 4200
trigger7 = numhelper(4305)
trigger7 = helper(4305), var(18)
trigger7 = var(23) := 4300
helpertype = normal
stateno = 8600
ID = 8600
name = "Super Finish"
postype = left
pos = 160, -120
ownpal = 1
ignorehitpause = 1
pausemovetime = 999
supermovetime = 999

[State -3, Movelist]
type = helper
trigger1 = !AIlevel
trigger1 = roundstate = 2
trigger1 = !numhelper(8980)
trigger1 = command = "movelist"
trigger1 = command != "holdfwd" && command != "holdback" && command != "holdup" && command != "holddown"
trigger1 = (stateno = [0, 119]) || stateno = 195
name = "Shin Gouki Movelist"
ID = 8980
postype = p1
stateno = 8980
ownpal = 1
supermovetime = 987654321
pausemovetime = 987654321
size.air.back = 1
size.air.front = 1

[State -3, Antifreeze]
type = changestate
triggerall = !ctrl
triggerall = time >= 300
triggerall = roundstate = 2
trigger1 = pos y > 0 && screenpos y > gameheight
trigger2 = !selfanimexist(anim)
value = 5040

[State -3, Antifreeze]
type = targetstate
trigger1 = numtarget = 1
trigger1 = movetype != A
trigger1 = target, time >= 300
value = 51
