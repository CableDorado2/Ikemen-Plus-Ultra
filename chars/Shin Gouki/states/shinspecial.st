; _____________________________________
;| Shin Gouki by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;============================================================================================
;=====================================<SPECIAL STATES>=======================================
;============================================================================================

;======================<GOU HADOU KEN>=============================
[Statedef 1000]
type = S
physics = S
movetype = A
anim = 1000
ctrl = 0
velset = 0, 0
poweradd = 50 * !var(20)
sprpriority = 1
facep2 = 1

[State 1000, Strength]
type = varset
trigger1 = var(10) != [1, 3]
var(10) = 2
ignorehitpause = 1

[State 1000, Strength AI]
type = varset
trigger1 = time <= 0 && AIlevel
var(10) = ifelse((p2movetype = H || random < 500), 3, ifelse(random < 500, 2, 1))
ignorehitpause = 1

[State 1000, Width]
type = width
trigger1 = animelemtime(5) = -1
value = 30, 0

[State 1000, Correct Projectile Trade]
type = hitby
trigger1 = animelem = 5
value = SCA, AA, AT
time = 1

[State 1000, Hadouken]
type = helper
trigger1 = animelem = 5
helpertype = normal
stateno = 1005
ID = 1005
name = "Hadouken"
postype = p1
pos = 78, -66
ownpal = 1
size.xscale = 0.75
size.yscale = 0.75

[State 1000, Snd]
type = playsnd
trigger1 = animelem = 4
value = 3, 3
channel = 0
[State 1000, Snd]
type = playsnd
trigger1 = animelem = 5
value = 5, 0

[State 1000, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<SHAKUNETSU HADOU KEN>=============================
[Statedef 1020]
type = S
physics = S
movetype = A
anim = 1020
ctrl = 0
velset = 0, 0
poweradd = 50 * !var(20)
sprpriority = 1
facep2 = 1

[State 1020, Strength]
type = varset
trigger1 = var(10) != [1, 3]
var(10) = 2
ignorehitpause = 1

[State 1020, Strength AI]
type = varset
trigger1 = time <= 0 && AIlevel
var(10) = ifelse((p2movetype = H || random < 333), 1, ifelse(random < 500, 2, 3))
ignorehitpause = 1

[State 1020, Width]
type = width
trigger1 = animelemtime(10) = -1
value = 30, 0

[State 1020, Anim]
type = changeanim
trigger1 = var(10) = 1 && animelem = 5
trigger2 = var(10) = 2 && animelem = 7
value = 1020
elem = 9
persistent = 0

[State 1000, Correct Projectile Trade]
type = hitby
trigger1 = animelem = 10
value = SCA, AA, AT
time = 1

[State 1020, Hadouken]
type = helper
trigger1 = animelem = 10
helpertype = normal
stateno = 1025
ID = 1025
name = "Hadouken"
postype = p1
pos = 78, -66
size.xscale = ifelse(var(10) = 3, 1.0, ifelse(var(10) = 2, 0.9, 0.8))
size.yscale = ifelse(var(10) = 3, 1.0, ifelse(var(10) = 2, 0.9, 0.8))
ownpal = 1
persistent = 0

[State 1020, Aura]
type = helper
trigger1 = animelem = 3
helpertype = normal
stateno = 6000
ID = 6000
postype = p1
ownpal = 1
persistent = 0

[State 1020, Snd]
type = playsnd
trigger1 = animelem = 3
value = 3, 5
channel = 0
persistent = 0

[State 1020, Snd]
type = playsnd
trigger1 = animelem = 10
value = 3, 0
channel = 0
[State 1020, Snd]
type = playsnd
trigger1 = animelem = 10
value = 5, 0

[State 1020, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;========================<BURNED>=============================
[Statedef 7697]
type = A
physics = N
movetype = H
velset = 0, 0

[State 7697, End]
type = selfstate
trigger1 = !selfanimexist(7697)
value = 5020

[state 7697, Anim]
type = changeanim
trigger1 = !time
trigger1 = gethitvar(animtype) != [3,5]
value = ifelse((gethitvar(airtype) = 1), 5000, 5010) + gethitvar(animtype)

[state 7697, Anim]
type = changeanim
trigger1 = !time
trigger1 = gethitvar(animtype) = [3,5]
value = 5030

[state 7697, Anim]
type = changeanim
trigger1 = !time
trigger1 = (gethitvar(animtype) = [4,5]) && (selfanimexist(5047 + gethitvar(animtype)))
value = 5047 + gethitvar(animtype)

[state 7697, Anim]
type = changeanim
trigger1 = !hitshakeover
value = anim

[State 7697, Anim]
type = changeanim
trigger1 = hitshakeover
trigger1 = anim != 7697
value = 7697

[State 7697, Accel]
type = veladd
trigger1 = hitshakeover
y = gethitvar(yaccel)

[State 7697, Vel]
type = hitvelset
trigger1 = hitshakeover
x = 1
y = 1
persistent = 0

[State 7697, End]
type = selfstate
trigger1 = hitshakeover
trigger1 = vel y > 0
trigger1 = !hitfall
value = 5040

[State 7697, Recover]
type = selfstate
triggerall = vel y > 0
triggerall = pos y >= const(movement.air.gethit.groundrecover.ground.threshold)
triggerall = alive
triggerall = canrecover
trigger1 = command = "recovery"
value = 5200

[State 7697, End]
type = selfstate
trigger1 = vel y > 0
trigger1 = pos y >= const(movement.air.gethit.groundlevel)
value = 5100


;======================<ZANKUU HADOU KEN>=============================
[Statedef 1050]
type = A
physics = N
movetype = A
anim = 1050
ctrl = 0
facep2 = 1
poweradd = 50 * !var(20)
sprpriority = 1

[State 1050, Strength]
type = varset
trigger1 = var(10) != [1, 3]
var(10) = 2
ignorehitpause = 1

[State 1050, Strength AI]
type = varset
trigger1 = time <= 0 && AIlevel
var(10) = ifelse((p2movetype = H || random < 333), 3, ifelse(random < 500, 2, 1))
ignorehitpause = 1

[State 1050, Accel]
type = gravity
trigger1 = 1

[State 1050, Width]
type = width
trigger1 = animelemtime(2) = -1 || animelemtime(5) = -1
player = 27, 0

[State 1050, Correct Projectile Trade]
type = hitby
trigger1 = animelem = 2 || animelem = 5
value = SCA, AA, AT
time = 1

[State 1050, Hadouken]
type = helper
trigger1 = animelem = 2 || animelem = 5
helpertype = normal
stateno = 1055
ID = ifelse((animelem = 5), 1055, 1056)
name = "Hadouken"
postype = p1
pos = ifelse((animelem = 2), 54, 67), ifelse((animelem = 2), -48, -48)
ownpal = 1
size.xscale = 0.75
size.yscale = 0.75

[State 1050, Snd]
type = playsnd
trigger1 = animelem = 2 || animelem = 5
value = 3, 10
channel = 0
[State 1050, Snd]
type = playsnd
trigger1 = animelem = 2 || animelem = 5
value = 5, 0
channel = 1

[State Land]
type = changestate
trigger1 = statetype = A
trigger1 = vel y > 0 && (pos y > -vel y)
value = 1059


;---Land---
[Statedef 1059]
type = S
physics = S
movetype = I
anim = 48
ctrl = 0
velset = 0, 0
sprpriority = 1
movehitpersist = 1
hitcountpersist = 1

[State 1059, Pos]
type = posset
trigger1 = 1
y = 0

[State 1059, Snd]
type = playsnd
trigger1 = !time
value = 0, 52
[State 1059, Dust]
type = explod
trigger1 = !time
anim = 7102
ID = 7100
sprpriority = -5
postype = p1
scale = 0.5, 0.5
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 1059, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<GOU SHORYUU KEN>=============================
[Statedef 1100]
type = S
physics = S
movetype = A
anim = 1100
ctrl = 0
velset = 0, 0
poweradd = 100 * (!var(20) && prevstateno != 750)
facep2 = 1
sprpriority = 1

[State 1100, Strength]
type = varset
trigger1 = var(10) != [1, 3]
var(10) = 2
ignorehitpause = 1

[State 1100, Strength AI]
type = varset
trigger1 = time <= 0 && AIlevel
var(10) = ifelse((p2movetype = H && p2statetype = A), 3, 1)
ignorehitpause = 1

[State 1100, NHB]
type = nothitby
trigger1 = anim = 1100 && animelemtime(4) < 0
value = SCA
time = 1
ignorehitpause = 1

[State 1100, Pos]
type = posadd
trigger1 = anim = 1100 && animelem = 1
x = ifelse(var(10) = 3, 8, ifelse(var(10) = 2, 4, 0))

[State 1100, Accel]
type = veladd
trigger1 = anim = 1100
trigger1 = animelemtime(4) >= 1
trigger2 = anim = 1101
y = 0.5

[State 1100, Vel]
type = velset
trigger1 = anim = 1100
trigger1 = animelemtime(4) = [0, 1]
x = ifelse(var(10) = 3, 12, ifelse(var(10) = 2, 9, 6))
y = ifelse(var(10) = 3, -11, ifelse(var(10) = 2, -8.5, -6))

[State 1100, Grounded Frame]
type = posfreeze
trigger1 = anim = 1100
trigger1 = animelemtime(4) = 0
value = 1

[State 1100, Vel]
type = velmul
trigger1 = 1
x = 0.88
[State 1100, Vel]
type = velset
trigger1 = vel y > 0
x = 0

[State 1100, Snd]
type = playsnd
trigger1 = anim = 1100 && animelem = 3
value = 1, 3
channel = 1

[State 1100, Snd]
type = playsnd
trigger1 = anim = 1100 && animelem = 4
value = 0, ifelse(var(10) = 1, 40, 41)

[State 1100, Dust]
type = helper
trigger1 = anim = 1100 && animelem = 4
helpertype = normal
stateno = 7100
ID = 7100
name = "Dust"
postype = p1
ownpal = 1

[State 1100, Snd]
type = playsnd
trigger1 = anim = 1100 && animelem = 4
value = 3, 9
channel = 0
ignorehitpause = 1
persistent = 0

[State 1100, Hit]
type = hitdef
trigger1 = animelem = 2 && anim = 1100
trigger1 = var(15) < ifelse(var(10) = 3, 3, ifelse(var(10) = 2, 2, 1)) || var(20)
trigger2 = animelem = 3 && anim = 1100
trigger2 = var(15) < ifelse(var(10) = 3, 4, ifelse(var(10) = 2, 3, 2)) || var(20)
attr = S, SA
damage = ifelse(var(10) = 3, 46, ifelse(var(10) = 2, 40, 34)), 7
animtype = Hard
fall.animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 12, 12;ifelse(var(20), 6, 12), ifelse(var(20), 5, 11)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 20) * (var(36) := 45), var(37) := ifelse((animelem = 2), -52, -75)
hitsound = -1 + 0 * (var(31) := 3)
guardsound = -1
ground.type = Low
ground.slidetime = 18
ground.hittime = 18
ground.velocity = 0, ifelse(var(10) = 3, -9.0, ifelse(var(10) = 2, -8.0, -5.5))
air.type = Low
air.velocity = 0, ifelse(var(10) = 3, -9.0, ifelse(var(10) = 2, -8.0, -5.5))
yaccel = 0.4850
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 100) * !var(20), ifelse(moveguarded, 25, 50) * !var(20)
givepower = 40, 40
envshake.time = 10
envshake.ampl = ifelse((gametime % 2), -1, 1)
envshake.freq = 180
fall = 1
fall.recover = 1
fall.recovertime = 120
fall.animtype = Medium
forcestand = 1
airguard.ctrltime = 16
airguard.cornerpush.veloff = 0
airguard.velocity = -6.00, -1.00

[State 1100, Hit Midair]
type = hitdef
trigger1 = animelem = 4 && anim = 1100
trigger1 = var(15) < ifelse(var(10) = 3, 5, ifelse(var(10) = 2, 4, 3)) || var(20)
attr = A, SA
damage = 50, 8
animtype = Back
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = 12, 12;ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 10) * (var(36) := 30), var(37) := -100
hitsound = -1 + 0 * (var(31) := 3)
guardsound = -1
ground.type = High
ground.slidetime = 18
ground.hittime = 18
ground.velocity = ifelse(var(10) = 3, -4, ifelse(var(10) = 2, -3.5, -3)), ifelse(var(10) = 3, -9.0, ifelse(var(10) = 2, -8.0, -5.5))
air.type = Low
air.velocity = ifelse(var(10) = 3, -4, ifelse(var(10) = 2, -3.5, -3)), ifelse(var(10) = 3, -9.0, ifelse(var(10) = 2, -8.0, -5.5))
yaccel = 0.4850
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 100) * !var(20), ifelse(moveguarded, 25, 50) * !var(20)
givepower = 40, 40
envshake.time = 10
envshake.ampl = ifelse((gametime % 2), -1, 1)
envshake.freq = 180
fall = 1
fall.recover = 1
fall.recovertime = 120
airguard.ctrltime = 16
airguard.velocity = -6.00, -1.00
forcestand = 1
airguard.cornerpush.veloff = 0

[State 1100, Type]
type = statetypeset
trigger1 = anim = 1100 && animelemtime(4) >= 0
statetype = A
physics = N

[State 1100, Anim]
type = changeanim
trigger1 = anim = 1100 && animelemtime(4) > 0 && vel y > (ifelse(var(10) = 3, -5.3, ifelse(var(10) = 2, -4, -2.7)))
value = 1101

[State Idle]
type = statetypeset
trigger1 = anim = 1101
movetype = I

[State Land]
type = changestate
trigger1 = statetype = A
trigger1 = vel y > 0 && (pos y > -vel y)
value = 1109


;---Land---
[Statedef 1109]
type = S
physics = S
movetype = I
anim = 1109
ctrl = 0
velset = 0, 0
sprpriority = 1
movehitpersist = 1
hitcountpersist = 1

[State 1109, Pos]
type = posset
trigger1 = 1
y = 0

[State 1109, Snd]
type = playsnd
trigger1 = !time
value = 0, 52
[State 1109, Dust]
type = explod
trigger1 = !time
anim = 7102
ID = 7100
sprpriority = -5
postype = p1
scale = 0.5, 0.5
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 1109, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<TATSUMAKI ZANKUU KYAKU>=============================
[Statedef 1200]
type = A
physics = N
movetype = A
anim = 1200
ctrl = 0
velset = 0, 0
poweradd = 100 * !var(20)
facep2 = 1
sprpriority = 1

[State 1200, Strength]
type = varset
trigger1 = var(10) != [1, 3]
var(10) = 2
ignorehitpause = 1

[State 1200, Strength AI]
type = varset
trigger1 = time <= 0 && AIlevel
var(10) = ifelse(p2movetype = H, 3, 1)
ignorehitpause = 1

[State 1200, Snd]
type = playsnd
trigger1 = anim = 1200 && animelem = 1
value = 3, 11
channel = 0
[State 1200, Snd]
type = playsnd
trigger1 = anim = 1200 && animelem = 1
value = 0, 40
[State 1200, Dust]
type = helper
trigger1 = anim = 1200 && animelem = 1
helpertype = normal
stateno = 7104
ID = 7100
name = "Dust"
postype = p1
ownpal = 1

[State 1200, Anim]
type = changeanim
trigger1 = anim = 1200 && !animtime
value = 1201

[State 1200, Type]
type = statetypeset
trigger1 = anim = 1200 || anim = 1205
statetype = A
physics = N

[State 1200, Type]
type = veladd
trigger1 = anim = 1200 || anim = 1205
y = 0.5

[State 1200, Type]
type = statetypeset
trigger1 = anim = 1201
statetype = A
physics = N

[State 1200, Vel]
type = velset
trigger1 = anim = 1200 && animelem = 1
x = 3.50
y = -4.84

[State 1200, Vel]
type = velset
trigger1 = anim = 1201
x = 3.50
y = 0

[State 1200, Snd]
type = playsnd
trigger1 = anim = 1201 && !(animelemtime(1) % 9)
value = 1, 6
channel = 1

[State 1200, Anim]
type = changeanim
trigger1 = anim = 1201
trigger1 = ifelse(var(10) = 3, !animtime, ifelse(var(10) = 2, animelemtime(13) >= 0, animelemtime(7) >= 0))
value = 1205
persistent = 0

[State 1200, Hit First]
type = hitdef
trigger1 = anim = 1200 && animelem = 2
trigger1 = var(15) < ifelse(var(10) = 3, 4, ifelse(var(10) = 2, 3, 2)) || var(20)
attr = S, SA
damage = 30, 7
animtype = Hard
fall.animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 12, 12;ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 10) * (var(36) := 30), var(37) := ifelse((anim = 1200), -62, -69)
hitsound = -1 + 0 * (var(31) := 6)
guardsound = -1
ground.type = Low
ground.slidetime = 18
ground.hittime = 18
ground.velocity = -2.0, -7.25
air.type = Low
air.velocity = -2.0, -7.25
yaccel = 0.4850
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 100) * !var(20), ifelse(moveguarded, 25, 50) * !var(20)
givepower = 40, 40
envshake.time = 10
envshake.ampl = ifelse((gametime % 2), -1, 1)
envshake.freq = 180
fall = 1
fall.recover = 1
fall.recovertime = 120
airguard.ctrltime = 16
airguard.velocity = -6.00, -1.00
forcestand = 1
airguard.cornerpush.veloff = 0

[State 1200, Hit]
type = hitdef
trigger1 = anim = 1201
trigger1 = animelem = 2 || animelem = 8 || animelem = 14 || animelem = 20
trigger1 = var(15) < ifelse(var(10) = 3, 4, ifelse(var(10) = 2, 3, 2)) || var(20)
attr = S, SA
damage = 50, 7
animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 12, 12;ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 65), var(37) := ifelse((anim = 1200), -62, -69)
hitsound = -1 + 0 * (var(31) := 6)
guardsound = -1
ground.type = High
ground.slidetime = 18
ground.hittime = 18
ground.velocity = -2.0, -7.25
air.type = Low
air.velocity = -2.0, -7.25
yaccel = 0.4850
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 100) * !var(20), ifelse(moveguarded, 25, 50) * !var(20)
givepower = 40, 40
envshake.time = 10
envshake.ampl = ifelse((gametime % 2), -1, 1)
envshake.freq = 180
fall = 1
fall.recover = 1
fall.recovertime = 120
airguard.ctrltime = 16
airguard.velocity = -6.00, -1.00
forcestand = 1
airguard.cornerpush.veloff = 0

[State 1200, Hit B]
type = hitdef
trigger1 = anim = 1201
trigger1 = animelem = 5 || animelem = 11 || animelem = 17 || animelem = 23
trigger1 = (var(15) < 3 || var(20))
attr = S, SA
damage = 40, 5
animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 12, 12;ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := -55) * (var(36) := -20), var(37) := -70
hitsound = -1 + 0 * (var(31) := 6)
guardsound = -1
ground.type = High
ground.slidetime = 18
ground.hittime = 18
ground.velocity = 3.0, -7.25
air.type = Low
air.velocity = 3.0, -7.25
yaccel = 0.4850
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 100) * !var(20), ifelse(moveguarded, 25, 50) * !var(20)
givepower = 40, 40
envshake.time = 10
envshake.ampl = ifelse((gametime % 2), -1, 1)
envshake.freq = 180
fall = 1
fall.recover = 1
fall.recovertime = 120
airguard.ctrltime = 16
airguard.velocity = -6.00, -1.00
forcestand = 1
airguard.cornerpush.veloff = 0

[State Idle]
type = statetypeset
trigger1 = anim = 1205
movetype = I

[State Land]
type = changestate
trigger1 = statetype = A
trigger1 = vel y > 0 && (pos y > -vel y)
value = 1209


;---Land---
[Statedef 1209]
type = S
physics = S
movetype = I
anim = 47
ctrl = 0
velset = 0, 0
sprpriority = 1
movehitpersist = 1
hitcountpersist = 1

[State 1209, Pos]
type = posset
trigger1 = 1
y = 0

[State 1209, Snd]
type = playsnd
trigger1 = !time
value = 0, 52
[State 1209, Dust]
type = explod
trigger1 = !time
anim = 7102
ID = 7100
sprpriority = -5
postype = p1
scale = 0.5, 0.5
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 1209, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<KUUCHUU TATSUMAKI ZANKUU KYAKU>=============================
[Statedef 1250]
type = A
physics = N
movetype = A
anim = 1250
ctrl = 0
velset = (vel x) + ifelse(vel x >= 0, 1, -1), (vel y) -1
poweradd = 100 * !var(20)
sprpriority = 1

[State 1250, Strength]
type = varset
trigger1 = var(10) != [1, 3]
var(10) = 2
ignorehitpause = 1

[State 1250, Strength AI]
type = varset
trigger1 = time <= 0 && AIlevel
var(10) = 3
ignorehitpause = 1

[State 1250, Accel]
type = veladd
trigger1 = 1
y = ifelse(animelemtime(28) >= 0 || vel y < 0, 0.50, 0.33)

[State 1250, Snd]
type = playsnd
trigger1 = animelem = 1
value = 3, 11
channel = 0

[State 1250, Snd]
type = playsnd
trigger1 = !(animelemtime(4) % 9)
trigger1 = animelemtime(28) < 0
value = 1, 6
channel = 1

[State 1250, Hit]
type = hitdef
trigger1 = animelem = 5 || animelem = 11 || animelem = 17 || animelem = 23
trigger1 = (var(15) < (2 + hitcount) || var(20))
attr = A, SA
damage = 60, 7
animtype = Hard
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 12, 12;ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 65), var(37) := -69
hitsound = -1 + 0 * (var(31) := 6)
guardsound = -1
ground.type = High
ground.slidetime = 18
ground.hittime = 18
ground.velocity = -3.0, -7.5
air.type = Low
air.velocity = -3.0, -7.5
yaccel = 0.4850
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 100) * !var(20), ifelse(moveguarded, 25, 50) * !var(20)
givepower = 40, 40
envshake.time = 10
envshake.ampl = ifelse((gametime % 2), -1, 1)
envshake.freq = 180
fall = 1
fall.recover = 1
fall.recovertime = 120
airguard.ctrltime = 16
airguard.velocity = -6.00, -1.00
forcestand = 1
airguard.cornerpush.veloff = 0

[State 1250, Hit B]
type = hitdef
trigger1 = animelem = 8 || animelem = 14 || animelem = 20 || animelem = 26
trigger1 = (var(15) < (2 + hitcount) || var(20))
attr = A, SA
damage = 60, 7
animtype = Hard
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 12, 12;ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := -55) * (var(36) := -20), var(37) := -70
hitsound = -1 + 0 * (var(31) := 6)
guardsound = -1
ground.type = High
ground.slidetime = 18
ground.hittime = 18
ground.velocity = 3.0, -7.5
air.type = Low
air.velocity = 3.0, -7.5
yaccel = 0.4850
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 100) * !var(20), ifelse(moveguarded, 25, 50) * !var(20)
givepower = 40, 40
envshake.time = 10
envshake.ampl = ifelse((gametime % 2), -1, 1)
envshake.freq = 180
fall = 1
fall.recover = 1
fall.recovertime = 120
airguard.ctrltime = 16
airguard.velocity = -6.00, -1.00
forcestand = 1
airguard.cornerpush.veloff = 0

[State 1250, Anim]
type = changeanim
triggerall = anim = 1250 && animelemtime(28) < 0
trigger1 = var(10) = 1 && animelemtime(10) >= 0
trigger2 = var(10) = 2 && animelemtime(16) >= 0
value = 1250
elem = 28

[State Idle]
type = statetypeset
trigger1 = animelemtime(27) >= 0
movetype = I

[State Land]
type = changestate
trigger1 = statetype = A
trigger1 = vel y > 0 && (pos y > -vel y)
value = 1259


;---Land---
[Statedef 1259]
type = S
physics = S
movetype = I
anim = 48
ctrl = 0
velset = 0, 0
sprpriority = 1
movehitpersist = 1
hitcountpersist = 1

[State 1259, Pos]
type = posset
trigger1 = 1
y = 0

[State 1259, Snd]
type = playsnd
trigger1 = !time
value = 0, 52
[State 1259, Dust]
type = explod
trigger1 = !time
anim = 7102
ID = 7100
sprpriority = -5
postype = p1
scale = 0.5, 0.5
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 1259, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<HYAKKI SHU>=============================
[Statedef 1300]
type = A
physics = N
movetype = I
anim = 1300
ctrl = 0
velset = 0, 0
poweradd = 100 * !var(20)
sprpriority = 1
facep2 = 1

[State 1300, Strength]
type = varset
trigger1 = var(10) != [1, 3]
var(10) = 2
ignorehitpause = 1

[State 1300, Strength AI]
type = varset
trigger1 = time <= 0 && AIlevel
var(10) = ifelse(p2dist x >= 180, 3, ifelse(p2dist x >= 100, 2, 1))
ignorehitpause = 1

[State 1300, Snd]
type = playsnd
trigger1 = !time
value = 3, 1
channel = 0

[State 1300, Snd]
type = playsnd
trigger1 = !time
value = 0, 40

[State 1300, Dust]
type = helper
trigger1 = !time
helpertype = normal
stateno = 7100
ID = 7100
name = "Dust"
postype = p1
ownpal = 1

[State 1300, Accel]
type = veladd
trigger1 = 1
y = 0.623

[State 1300, Vel]
type = velset
trigger1 = !time
x = ifelse(var(10) = 3, 5.00, ifelse(var(10) = 2, 3.25, 1.50))
y = -10.590

[State 1300, Gou Shou]
type = changestate
triggerall = vel y >= 0
triggerall = animelemtime(14) < 0
trigger1 = !AIlevel
trigger1 = command = "x" || command = "y" || command = "z" || command = "rlsx" || command = "rlsy" || command = "rlsz"
trigger2 = AIlevel
trigger2 = (p2dist x = [0, 90]) && (p2dist y = [-40, 40]) && (random < 333 || p2movetype = A)
value = 1301

[State 1300, Gou Jin]
type = changestate
triggerall = vel y >= 0
trigger1 = !AIlevel
trigger1 = command != "holddown"
trigger1 = command = "a" || command = "rlsa" || command = "b" || command = "rlsb" || command = "c" || command = "rlsc"
trigger2 = AIlevel
trigger2 = (p2dist x = [0, 120]) && p2dist y >= 0 && (random < 333 || p2movetype = A)
value = 1302

[State 1300, Gou Dan]
type = changestate
triggerall = vel y >= 0
triggerall = animelemtime(14) < 0
trigger1 = !AIlevel
trigger1 = command = "a" || command = "rlsa" || command = "b" || command = "rlsb" || command = "c" || command = "rlsc"
trigger2 = AIlevel
trigger2 = (p2dist x = [0, 60]) && p2dist y >= 40 && (random < 333 || p2movetype = A)
value = 1303

[State 1300, End]
type = changestate
trigger1 = vel y > 0 && (pos y > -vel y)
value = 1305


;=========<HYAKKI GOU SHOU>==========
[Statedef 1301]
type = A
movetype = A
physics = N
anim = 1301
poweradd = 0
sprpriority = 1
ctrl = 0

[State 1301, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 3
channel = 1

[State 1301, Snd]
type = playsnd
trigger1 = animelem = 3
value = 3, 3
channel = 0

[State 1301, Accel]
type = veladd
trigger1 = time
y = 0.623

[State 1301, hitgrabp]
type = hitdef
trigger1 = animelem = 1
trigger1 = (var(15) < 1 || var(20))
trigger1 = command = "holdfwd" || command = "holdback"
trigger1 = !var(29) && numenemy
trigger1 = p2dist x >= ifelse((facing = enemynear, facing), -(enemynear, const(size.ground.front)), -(enemynear, const(size.ground.back)))
attr = A, ST
hitflag = M
priority = 1, Miss
hitsound = -1 + 0 * (var(31) := 800)
sparkno = -1 + 0 * (var(33) := 0)
sprpriority = 1
p1facing = 1
p2facing = 1
p1stateno = 1320
fall = 1
numhits = 0

[State 1301, Hit]
type = hitdef
trigger1 = animelem = 3
trigger1 = (var(15) < 1 || var(20))
attr = A, SA
damage = 100, 12
animtype = Hard
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 12, 12;ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 15) * (var(36) := 45), var(37) := -55
hitsound = -1 + 0 * (var(31) := 3)
guardsound = -1
ground.type = High
ground.slidetime = 18
ground.hittime = 18
ground.velocity = -4.0, -6.0
air.type = Low
air.velocity = -4.0, -6.0
yaccel = 0.4850
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 100) * !var(20), ifelse(moveguarded, 25, 50) * !var(20)
givepower = 40, 40
envshake.time = 10
envshake.ampl = ifelse((gametime % 2), -1, 1)
envshake.freq = 180
fall = 1
fall.recover = 1
fall.recovertime = 120
airguard.ctrltime = 16
airguard.velocity = -6.00, -1.00
forcestand = 1
airguard.cornerpush.veloff = 0

[State Idle]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I

[State Land]
type = changestate
trigger1 = statetype = A
trigger1 = vel y > 0 && (pos y > -vel y)
value = 1309


;=========<HYAKKI GOU JIN>==========
[Statedef 1302]
type = A
physics = N
movetype = A
anim = 1302
velset = 0, 0
ctrl = 0
juggle = 7 * !var(20)
poweradd = 0
sprpriority = 1

[State 1302, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 6
channel = 1

[State 1302, Snd]
type = playsnd
trigger1 = animelem = 3
value = 3, 8
channel = 0

[State 1302, Vel]
type = velset
trigger1 = animelemtime(4) > 0
x = 9
y = 9

[State 1302, hitgrabk]
type = hitdef
trigger1 = animelem = 1
trigger1 = (var(15) < 1 || var(20))
trigger1 = command = "holdfwd" || command = "holdback"
trigger1 = !var(29) && numenemy
trigger1 = p2dist x >= ifelse((facing = enemynear, facing), -(enemynear, const(size.ground.front)), -(enemynear, const(size.ground.back)))
attr = A, ST
hitflag = MAF
priority = 1, Miss
hitsound = -1 + 0 * (var(31) := 800)
sparkno = -1 + 0 * (var(33) := 0)
sprpriority = 1
p1facing = -1
p2facing = 1
p1stateno = 1330
fall = 1
numhits = 0

[State 1302, Hit]
type = hitdef
trigger1 = animelem = 4
trigger1 = (var(15) < 1 || var(20))
attr = A, SA
damage = 60, 7
animtype = Hard
guardflag = HA
hitflag = MAFD
priority = 4, Hit
pausetime = 12, 12;ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 20) * (var(36) := 45), var(37) := -7
hitsound = -1 + 0 * (var(31) := 6)
guardsound = -1
ground.type = High
ground.slidetime = 18
ground.hittime = 18
ground.velocity = -4.49
air.type = Low
air.velocity = -8, 8
yaccel = 0.4850
down.hittime = 30
down.velocity = 0, 0
getpower = ifelse(movehit, 25, 100) * !var(20), ifelse(moveguarded, 25, 50) * !var(20)
givepower = 40, 40
envshake.time = 10
envshake.ampl = ifelse((gametime % 2), -1, 1)
envshake.freq = 180
air.fall = 1
fall.recover = 1
fall.recovertime = 120
airguard.ctrltime = 16
airguard.velocity = -6.00, -1.00
forcestand = 1
airguard.cornerpush.veloff = 0

[State Land]
type = changestate
trigger1 = statetype = A
trigger1 = vel y > 0 && (pos y > -vel y)
value = 1309


;=========<HYAKKI GOU DAN>==========
[Statedef 1303]
type = A
movetype = A
physics = N
anim = 1303
poweradd = 0
sprpriority = 1
ctrl = 0

[State 1303, Accel]
type = veladd
trigger1 = time
y = 0.623

[State 1303, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 3
channel = 1

[State 1303, Snd]
type = playsnd
trigger1 = animelem = 3
value = 3, 6
channel = 0

[State 1303, Anim]
type = changeanim
triggerall = animelemtime(3) > 2 && animelemtime(4) < 0 && vel y > 0
trigger1 = fvar(16) < 35
trigger2 = pos y >= -25
value = 1303
elem = 4
persistent = 0

[State 1303, Hit]
type = hitdef
trigger1 = animelem = 4
trigger1 = (var(15) < 1 || var(20))
attr = A, SA
damage = 60, 8
animtype = Hard
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 4, 4
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 15) * (var(36) := 55), var(37) := -56
hitsound = -1 + 0 * (var(31) := 6)
guardsound = -1
ground.type = High
ground.slidetime = 18
ground.hittime = 18
ground.velocity = -vel x, 10
air.type = Low
air.velocity = -vel x, 10
yaccel = 0.4850
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
fall.yvelocity = 0
givepower = 40, 40
envshake.time = 10
envshake.ampl = ifelse((gametime % 2), -1, 1)
envshake.freq = 180
fall = 1
fall.recover = 0
airguard.ctrltime = 16
airguard.velocity = -6.00, -1.00
forcestand = 1
airguard.cornerpush.veloff = 0

[State 1303, End]
type = changestate
trigger1 = vel y > 0 && (pos y > -vel y)
value = 1304


;--- Stomp ---
[Statedef 1304]
type = S
movetype = A
anim = 1304
physics = S
velset = 0, 0
ctrl = 0
juggle = 7 * !var(20)
sprpriority = 1

[State 1304, Pos]
type = posset
trigger1 = 1
y = 0

[State 1304, Snd]
type = playsnd
trigger1 = !time
value = 5, 5
persistent = 0
ignorehitpause = 1

[State 1304, Dust]
type = explod
trigger1 = !time
anim = 7102
ID = 7102
sprpriority = -2
postype = p1
pos = 40, 0
vel = 0, 0
removetime = -2
ownpal = 1
scale = 0.5, 0.5
ignorehitpause = 1
pausemovetime = -1
supermovetime = -1

[State 1304, Hit]
type = hitdef
trigger1 = animelem = 1
trigger1 = (var(15) < 1 || var(20))
attr = S, SA
damage = 80, 10
animtype = Hard
guardflag = M
hitflag = FD
priority = 4, Hit
pausetime = 18, 18;ifelse(var(20), 9, 18), ifelse(var(20), 9, 18)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 15) * (var(36) := 50), var(37) := -4
hitsound = -1 + 0 * (var(31) := 6)
guardsound = -1
ground.type = High
ground.slidetime = 18
ground.hittime = 18
air.type = Low
air.velocity = -7, 7
yaccel = 0.4850
down.velocity = 0, 0
down.bounce = 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 100) * !var(20), ifelse(moveguarded, 25, 50) * !var(20)
givepower = 40, 40
fall = 1
fall.recover = 0
forcestand = 1
airguard.ctrltime = 16
airguard.cornerpush.veloff = 0
airguard.velocity = -6.00, -1.00

[State 1304, Shake]
type = envshake
trigger1 = !time
time = 18
freq = 180
ampl = 2

[State 1304, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=========<HYAKKI GOU ZAN>==========
[Statedef 1305]
type = S
physics = S
movetype = A
anim = 1305
poweradd = 0
velset = vel x, 0
sprpriority = 1
ctrl = 0

[State 1305, Width]
type = width
trigger1 = animelemtime(2) >= 0 && animelemtime(5) < 0
value = 30

[State 1305, Pos]
type = posset
trigger1 = !time
y = 0

[State 1305, Snd]
type = playsnd
trigger1 = !time
value = 0, 101

[State 1305, Dust]
type = explod
trigger1 = !time
anim = 7103
sprpriority = 3
postype = p1
pos = 25, 0
vel = 1, 0
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1305, Snd]
type = playsnd
trigger1 = animelem = 2
value = 3, 9
channel = 0

[State 1305, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 6
channel = 1

[State 1305, Hit]
type = hitdef
trigger1 = animelem = 2
trigger1 = (var(15) < 1 || var(20))
attr = S, SA
damage = 80, 10
animtype = Hard
fall.animtype = Hard
guardflag = L
hitflag = MAFD
priority = 4, Hit
pausetime = 12, 12;ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 50) * (var(36) := 100), var(37) := -18
hitsound = -1 + 0 * (var(31) := 6)
guardsound = -1
ground.type = Trip
ground.slidetime = 12
ground.slidetime = 18
ground.hittime = 18
ground.velocity = -1, -6.0
air.type = Trip
air.velocity = -1, -6.0
yaccel = 0.677
down.velocity = -1.33, -6.85
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 100) * !var(20), ifelse(moveguarded, 25, 50) * !var(20)
givepower = 40, 40
envshake.time = 10
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -1, 1)
fall = 1
fall.recover = 1
fall.recovertime = 120
forcestand = 1

[State 1305, Anim]
type = changeanim
trigger1 = anim = 1305
trigger1 = (movecontact = 1 || movereversed = 1) && hitpausetime
trigger1 = animelemtime(2) >= 0 && animelemtime(3) <= 0
trigger1 = hitpausetime <= 8
value = 1305
elem = 3
ignorehitpause = 1

[State Idle]
type = statetypeset
trigger1 = animelemtime(3) >= 0
movetype = I

[State 1305, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1



;---Land---
[Statedef 1309]
type = S
physics = S
movetype = I
anim = 48
ctrl = 0
velset = 0, 0
sprpriority = 1
movehitpersist = 1
hitcountpersist = 1

[State 1309, Pos]
type = posset
trigger1 = 1
y = 0

[State 1309, Snd]
type = playsnd
trigger1 = !time
value = 0, 52
[State 1309, Dust]
type = explod
trigger1 = !time
anim = 7102
ID = 7100
sprpriority = -5
postype = p1
scale = 0.5, 0.5
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 1309, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<HYAKKI GOUSAI>=============================
;--- PLAYER ---
[Statedef 1320]
type = A
physics = N
movetype = A
anim = 1320
ctrl = 0
velset = 0, 0

[State Throw]
type = targetstate
trigger1 = !time
value = 1325

[State 1320, Snd]
type = playsnd
trigger1 = !time
value = 4, 10
channel = 0

[State 1320, Vel]
type = velset
trigger1 = animelemtime(3) < 0
x = 0
y = 0
[State 1320, Vel]
type = velset
trigger1 = animelem = 3
x = 2
y = -6
[State 1320, Accel]
type = veladd
trigger1 = animelemtime(3) > 0
y = 0.5

[State 1320, accel]
type = velmul
trigger1 = animelemtime(3) > 0 && vel y > 1
y = 1.2
[State 1320, Width]
type = width
trigger1 = 1
edge = 30, 0

[State 1320, Bind 1]
type = bindtotarget
trigger1 = animelemtime(1) >= 0 && animelemtime(3) < 0
pos = target, const(size.head.pos.x), 35 + (target, const(size.head.pos.y))

[State 1320, Bind 3]
type = targetbind
trigger1 = animelemtime(3) >= 0 && animelemtime(4) < 0
pos = -11, -50
[State 1320, Bind 4]
type = targetbind
trigger1 = animelemtime(4) >= 0 && animelemtime(5) < 0
pos = -28, -64
[State 1320, Bind 5]
type = targetbind
trigger1 = animelemtime(5) >= 0 && animelemtime(6) < 0
pos = 4, -96
[State 1320, Bind 6]
type = targetbind
trigger1 = animelemtime(6) >= 0 && animelemtime(7) < 0
pos = 14, -100
[State 1320, Bind 7]
type = targetbind
trigger1 = animelemtime(7) >= 0
pos = 12, -112

[State 1320, spr 1]
type = sprpriority
trigger1 = animelemtime(1) >= 0 && animelemtime(5) < 0
value = 1
[State 1320, spr 2]
type = sprpriority
trigger1 = animelemtime(5) >= 0
value = -1

[State 1320, End]
type = changestate
trigger1 = animelemtime(3) > 0 && vel y > 0 && pos y > -15
value = 1321


;--- HIT FLOOR ---
[Statedef 1321]
type = C
physics = C
movetype = A
anim = 1321
ctrl = 0
velset = 0, 0
sprpriority = -1

[State 1321, Pos]
type = posadd
trigger1 = !time
x = 13

[State 1321, Throw]
type = targetstate
trigger1 = !time
value = 1326

[State 1321, Stun]
type = targetstate
trigger1 = numtarget
trigger1 = target, stateno = 1326 && target, animelemtime(3) = 1
trigger1 = numenemy = 1 && numpartner = 0
trigger1 = var(42) >= (target, const(data.life))
value = 1115312

[State 1321, Pos]
type = posset
trigger1 = 1
y = 0

[State 1321, Bind 1]
type = targetbind
trigger1 = animelemtime(1) >= 0 && animelemtime(2) < 0
pos = 12, -68

[State 1321, Bind 2]
type = targetbind
trigger1 = animelem = 2
pos = 12, -12

[State 1321, Damage]
type = hitadd
trigger1 = animelem = 2
value = 1

[State 1321, Juggle]
type = varadd
trigger1 = animelem = 2
var(15) = 1

[State 1321, Damage]
type = targetlifeadd
trigger1 = animelem = 2
value = -ceil(100 * fvar(11))

[State 1321, Stun System - Add]
type = varadd
trigger1 = animelem = 2
trigger1 = var(20) <= 0
trigger1 = var(42) >= 0
var(42) = ceil(80 * fvar(11))

[State 1321, Damage]
type = targetpoweradd
trigger1 = animelem = 2
value = 40;givepower

[State 1321, Damage]
type = poweradd
trigger1 = animelem = 2 && !var(20)
value = 100;getpower

[State 1321, Snd]
type = playsnd
trigger1 = !time
value = 3, 7
channel = 0

[State 1321, Shake]
type = envshake
trigger1 = !time
time = 18
freq = 180
ampl = 2

[State 1321, Snd]
type = playsnd
trigger1 = animelem = 2
value = 2, 3
channel = 2

[State 1321, Spark]
type = helper
trigger1 = fvar(31)
trigger1 = animelem = 2
helpertype = normal
stateno = 8012
ID = 8000
name = "Spark"
postype = p1
pos = 17, -30
facing = 1
ownpal = 1
size.xscale = 1
size.yscale = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State 1321, Spark]
type = explod
trigger1 = !fvar(31)
trigger1 = animelem = 2
anim = F3
ID = 8000
postype = p1
pos = 17, -30
supermovetime = -1
pausemovetime = -1
ontop = 1
ownpal = 1

[State 1321, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1


;--- TARGET ---
[Statedef 1325]
type = A
physics = N
movetype = H
ctrl = 0
sprpriority = 0

[State 1325, Anim]
type = changeanim2
trigger1 = !time
value = 1325

[State 1325, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = 0, 0

[State 1325, Safety]
type = selfstate
trigger1 = time >= 180
value = 5040


;--- TARGET HIT FLOOR ---
[Statedef 1326]
type = A
physics = N
movetype = H
ctrl = 0
sprpriority = 0

[State 1326, Anim]
type = changeanim2
trigger1 = !time
value = 1326

[State 1326, Accel]
type = veladd
trigger1 = animelemtime(3) >= 0
y = 0.4850;yaccel
[State 1326, Vel]
type = velset
trigger1 = animelem = 3
x = -3
y = -6

[State 1326, Recover]
type = selfstate
trigger1 = command = "recovery"
trigger1 = animelemtime(3) > 0
trigger1 = vel y > 0 && alive
trigger1 = pos y >= (-52 - (const(size.head.pos.y) - const(size.mid.pos.y)))
value = 5200

[State 1326, End]
type = selfstate
trigger1 = animelemtime(3) > 0 && vel y > 0
trigger1 = pos y >= (-32 - (const(size.head.pos.y) - const(size.mid.pos.y)))
value = 5100


;======================<HYAKKI GOU TSUI>=============================
;--- PLAYER ---
[Statedef 1330]
type = A
physics = N
movetype = A
anim = 1330
ctrl = 0
velset = 0, 0
sprpriority = 1

[State Throw]
type = targetstate
trigger1 = !time
value = 1335

[State 1330, Snd]
type = playsnd
trigger1 = animelem = 4
value = 3, 6
channel = 0
[State 815, spinsnd]
type = playsnd
trigger1 = animelem = 6 || animelem = 10 || animelem = 14
value = 1, 6
channel = 1

[State 1330, Vel]
type = velset
trigger1 = animelemtime(4) < 0
x = 0
y = 0
[State 1330, Vel]
type = velset
trigger1 = animelem = 4
x = -3.5
y = -12

[State 1330, Accel]
type = veladd
trigger1 = animelemtime(4) > 0
y = 0.5

[State 1330, accel]
type = velmul
trigger1 = animelemtime(4) > 0 && (vel y = [1, 20])
y = 1.1
[State 1330, accel]
type = velmul
trigger1 = vel y > 0
x = 0.95
[State 1330, Width]
type = width
trigger1 = 1
edge = 30, 0

[State 1330, Bind 1]
type = bindtotarget
trigger1 = animelemtime(1) >= 0 && animelemtime(3) < 0
pos = (target, const(size.mid.pos.x)), 55 + (target, const(size.mid.pos.y))
;-23
[State 1330, Bind 3]
type = bindtotarget
trigger1 = animelemtime(3) >= 0 && animelemtime(4) < 0
pos = 8 + (target, const(size.mid.pos.x)), 55 + (target, const(size.mid.pos.y))
[State 1330, Bind 4]
type = bindtotarget
trigger1 = animelemtime(4) >= 0 && animelemtime(5) < 0
pos = 18 + (target, const(size.mid.pos.x)), 55 + (target, const(size.mid.pos.y))

[State 1330, Bind 5]
type = targetbind
trigger1 = animelemtime(5) >= 0 && animelemtime(6) < 0
pos = 12, -62
[State 1330, Bind 6]
type = targetbind
trigger1 = animelemtime(6) >= 0 && animelemtime(7) < 0
trigger2 = animelemtime(10) >= 0 && animelemtime(11) < 0
trigger3 = animelemtime(14) >= 0 && animelemtime(15) < 0
pos = 2, -55
[State 1330, Bind 7]
type = targetbind
trigger1 = animelemtime(7) >= 0 && animelemtime(8) < 0
trigger2 = animelemtime(11) >= 0 && animelemtime(12) < 0
trigger3 = animelemtime(15) >= 0
pos = -14, -36
[State 1330, Bind 8]
type = targetbind
trigger1 = animelemtime(8) >= 0 && animelemtime(9) < 0
trigger2 = animelemtime(12) >= 0 && animelemtime(13) < 0
pos = 9, 0
[State 1330, Bind 9]
type = targetbind
trigger1 = animelemtime(9) >= 0 && animelemtime(10) < 0
trigger2 = animelemtime(13) >= 0 && animelemtime(14) < 0
pos = 20, -52

[State 1330, End]
type = changestate
trigger1 = animelemtime(4) > 0 && vel y > 0 && pos y > -15
value = 1331


;--- HIT FLOOR ---
[Statedef 1331]
type = C
physics = C
movetype = A
anim = 1331
ctrl = 0
velset = 0, 0
sprpriority = 1
[State 1331, Pos]
type = posadd
trigger1 = !time
x = 32
[State 1331, Pos]
type = posset
trigger1 = !time
y = 0

[State 1331, Throw]
type = targetstate
trigger1 = !time
value = 1336

[State 1331, Stun]
type = targetstate
trigger1 = numtarget
trigger1 = target, stateno = 1336 && target, animelemtime(2) = 1
trigger1 = numenemy = 1 && numpartner = 0
trigger1 = var(42) >= (target, const(data.life))
value = 1115312

[State 1331, Damage]
type = hitadd
trigger1 = !time
value = 1

[State 1331, Juggle]
type = varadd
trigger1 = !time
var(15) = 1

[State 1331, Damage]
type = targetlifeadd
trigger1 = !time
value = -ceil(160 * fvar(11))

[State 1331, Stun System - Add]
type = varadd
trigger1 = !time
trigger1 = var(20) <= 0
trigger1 = var(42) >= 0
var(42) = ceil(150 * fvar(11))

[State 1331, Damage]
type = targetpoweradd
trigger1 = !time
value = 40;givepower

[State 1331, Damage]
type = poweradd
trigger1 = !time && !var(20)
value = 100;getpower

[State 1331, Bind 1]
type = targetbind
trigger1 = animelemtime(1) >= 0 && animelemtime(2) < 0
pos = -32, 0

[State 1331, Snd]
type = playsnd
trigger1 = !time
value = 3, 7
channel = 0

[State 1331, Shake]
type = envshake
trigger1 = !time
time = 18
freq = 180
ampl = 3

[State 1331, Snd]
type = playsnd
trigger1 = !time
value = 5, 4

[State 1331, Dust]
type = helper
trigger1 = !time
helpertype = normal
stateno = 8110
ID = 8100
name = "Impact Dust"
postype = p1
pos = -24, 0
ownpal = 1

[State 1331, Vel]
type = velset
trigger1 = animelem = 2
x = 2
y = -6

[State 1331, Type]
type = statetypeset
trigger1 = animelemtime(2) >= 0
statetype = A
physics = N

[State 1331, Type]
type = veladd
trigger1 = animelemtime(2) >= 0
y = 0.5

[State Land]
type = changestate
trigger1 = statetype = A
trigger1 = vel y > 0 && (pos y > -vel y)
value = 52


;--- TARGET ---
[Statedef 1335]
type = A
physics = N
movetype = H
ctrl = 0
sprpriority = 0

[State 1335, Anim]
type = changeanim2
trigger1 = !time
value = 1335

[State 1335, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = 0, 0

[State 1335, Safety]
type = selfstate
trigger1 = time >= 180
value = 5040


;--- TARGET HIT FLOOR ---
[Statedef 1336]
type = A
physics = N
movetype = H
ctrl = 0
sprpriority = 0
[State 1336, Anim]
type = changeanim2
trigger1 = !time
value = 1336

[State 1336, Vel]
type = velset
trigger1 = animelem = 2
x = 4
y = -5

[State 1336, Accel]
type = veladd
trigger1 = animelemtime(2) > 0
y = 0.5

[State 1336, Recover]
type = selfstate
trigger1 = command = "recovery"
trigger1 = animelemtime(2) > 0
trigger1 = pos y >= -20 && vel y > 0 && alive
value = 5200

[State 1336, End]
type = selfstate
trigger1 = animelemtime(2) > 0 && vel y > 0 && pos y >= -10
value = 5100


;======================<ASHURA SENKUU>=============================
[Statedef 1400]
type = S
physics = N
movetype = I
anim = 1400
velset = 0, 0
ctrl = 0
sprpriority = -1
facep2 = 1

[State 1400, Strength]
type = varset
triggerall = time <= 0 && !AIlevel
trigger1 = helper(9999), command = "623pp" || helper(9999), command = "623kk"
trigger1 = var(10) := ifelse((helper(9999), command = "a" + helper(9999), command = "b" + helper(9999), command = "c") >= 2, 2, 3)
trigger2 = helper(9999), command = "421pp" || helper(9999), command = "421kk"
trigger2 = var(10) := ifelse((helper(9999), command = "a" + helper(9999), command = "b" + helper(9999), command = "c") >= 2, -2, -3)
trigger3 = helper(9999), command = "623pp+" || helper(9999), command = "623kk+"
trigger3 = var(10) := ifelse((helper(9999), command = "a+" + helper(9999), command = "b+" + helper(9999), command = "c+") >= 2, 2, 3)
trigger4 = helper(9999), command = "421pp+" || helper(9999), command = "421kk+"
trigger4 = var(10) := ifelse((helper(9999), command = "a+" + helper(9999), command = "b+" + helper(9999), command = "c+") >= 2, -2, -3)
var(10) = var(10)
ignorehitpause = 1
persistent = 0

[State 1400, Strength]
type = varset
trigger1 = time <= 0 && AIlevel
var(10) = ifelse(random < 250, 2, 3)
ignorehitpause = 1

[State 1400, afterimage]
type = afterimage
trigger1 = animelem = 3 && !var(20)
time = 2
timegap = 1
framegap = 6
length = ifelse((var(10) = 3 || var(10) = -3), 24, 18)
palbright = 0, 0, 0
paladd = 0, 0, 0
palmul = 0.9, 0.9, 0.9
palcontrast = 160, 160, 160
palpostbright = 0, 0, 0
trans = add1

[State 1400, Aura]
type = helper
trigger1 = animelem = 3
helpertype = normal
stateno = 6000
ID = 6000
postype = p1
ownpal = 1
persistent = 0

[State 1400, Vel]
type = velset
trigger1 = animelemtime(2) > 0 && animelemtime(6) < 0
x = ifelse(var(10) = 3, -7, ifelse(var(10) = 2, -4, ifelse(var(10) = -3, 7, 4))) * sin((time -2) / 2)

[State 1400, Vel]
type = velset
trigger1 = animelem = 6
x = ifelse(var(10) = 3, 14, ifelse(var(10) = 2, 9, ifelse(var(10) = -3, -14, -9)))
[State 1400, Vel]
type = velmul
trigger1 = animelemtime(6) > ifelse((var(10) = 3 || var(10) = -3), 16, 9)
x = 0.9

[State 1400, Snd]
type = playsnd
trigger1 = animelem = 6
value = 5, 6
persistent = 0

[State 1400, Push]
type = playerpush
trigger1 = time > 0
trigger1 = animelemtime(3) >= 0
value = 0

[State 1400, NHB]
type = nothitby
triggerall = animelemtime(6) < ifelse((var(10) = 3 || var(10) = -3), 32, 20)
trigger1 = animelemtime(6) < 0
trigger2 = animelemtime(6) >= 0
trigger2 = backedgebodydist > (-2 * vel x)
value = SCA, AA, AP, AT
time = 1

[State 1400, Turn]
type = turn
trigger1 = animelemtime(6) > 0 && p2dist x < 0

[State 1400, End]
type = changestate
trigger1 = animelemtime(6) >= ifelse((var(10) = 3 || var(10) = -3), 40, 24)
trigger2 = animelemtime(6) > 0 && vel x < 0 && backedgebodydist <= 0
trigger3 = animelemtime(6) > 0 && vel x > 0 && frontedgebodydist <= 0
value = 1401


;---Recovery---
[Statedef 1401]
type = S
physics = N
movetype = I
anim = 1401
velset = 0, 0
ctrl = 0
sprpriority = -1

[State 1401, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<ZENPOU TENSHIN>=============================
[Statedef 1450]
type = S
physics = N
movetype = I
anim = 1450
ctrl = 0
velset = 0, 0
sprpriority = 1
facep2 = 1

[State 1450, Strength]
type = varset
triggerall = time <= 0 && !AIlevel
trigger1 = helper(9999), command = "x" || helper(9999), command = "y" || helper(9999), command = "z"
trigger1 = var(10) := ifelse(helper(9999), command = "z", 3, ifelse(helper(9999), command = "y", 2, 1))
trigger2 = helper(9999), command = "rlsx" || helper(9999), command = "rlsy" || helper(9999), command = "rlsz"
trigger2 = var(10) := ifelse(helper(9999), command = "rlsz", 3, ifelse(helper(9999), command = "rlsy", 2, 1))
trigger3 = helper(9999), command = "x+" || helper(9999), command = "y+" || helper(9999), command = "z+"
trigger3 = var(10) := ifelse(helper(9999), command = "z+", 3, ifelse(helper(9999), command = "y+", 2, 1))
trigger4 = helper(9999), command = "rlsx+" || helper(9999), command = "rlsy+" || helper(9999), command = "rlsz+"
trigger4 = var(10) := ifelse(helper(9999), command = "rlsz+", 3, ifelse(helper(9999), command = "rlsy+", 2, 1))
var(10) = var(10)
ignorehitpause = 1
persistent = 0

[State 1450, Strength AI]
type = varset
trigger1 = time <= 0 && AIlevel
var(10) = ifelse(random < 500, 1, ifelse(random < 500, 2, 3))
ignorehitpause = 1

[State 1450, Type]
type = statetypeset
trigger1 = anim = 1450 && animelemtime(3) >= 0
statetype = C
[State 1450, Type]
type = statetypeset
trigger1 = anim = 1451 && animelemtime(3) >= 0
statetype = S
physics = S

[State 1450, Vel]
type = velset
trigger1 = anim = 1450 && animelemtime(2) >= 0
x = ifelse(animelemtime(4) >= 0, 5, 6)

[State 1400, Dust]
type = helper
trigger1 = anim = 1450 && animelem = 2
helpertype = normal
stateno = 7104
ID = 7100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 1400, Snd]
type = playsnd
trigger1 = anim = 1450 && animelem = 2
value = 0, 40
persistent = 0

[State 1450, Push]
type = playerpush
trigger1 = anim = 1450
trigger2 = anim = 1451 && animelemtime(3) < 0
value = 0
[State 1450, NHB]
type = nothitby
trigger1 = anim = 1450 && animelemtime(2) >= 0
value = , AT
time = 1

[State 1450, Anim]
type = changeanim
trigger1 = anim = 1450
trigger1 = ifelse(var(10) = 3, !animtime, ifelse(var(10) = 2, animelemtime(8) >= 0, animelemtime(4) >= 0))
value = 1451

[State 1400, Dust]
type = explod
trigger1 = anim = 1451 && animelem = 2
anim = 7102
ID = 7102
sprpriority = -2
postype = p1
pos = 25, 0
vel = 0, 0
removetime = -2
ownpal = 1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1

[State 1400, Snd]
type = playsnd
trigger1 = anim = 1451 && animelem = 2
value = 0, 52

[State 1450, End]
type = changestate
trigger1 = anim = 1451 && !animtime
value = 0
ctrl = 1


;======================<GOUHA KEN>=============================
;--- POSE ---
[Statedef 1500]
type = S
physics = S
movetype = A
anim = 1500
ctrl = 0
velset = 0, 0
facep2 = 1
sprpriority = 1
poweradd = 50 * !var(20)

[State 1500, Anim]
type = changeanim
trigger1 = time <= 0 && !AIlevel && command = "22k"
trigger2 = time <= 0 && AIlevel && p2statetype = C
value = 1501
[State 1500, Type]
type = statetypeset
trigger1 = anim = 1501
statetype = C
physics = C

[State 1500, Reversal]
type = reversaldef
trigger1 = anim = 1500
trigger1 = animelem = 3
reversal.attr = SCA, AA
p1stateno = 1505
pausetime = 0, 20
hitsound = s2, 0
sparkno = ifelse(fvar(31), -1, 40) + 0 * (var(33) := -1)
sparkxy = 20, 0
numhits = 0

[State 1500, Reversal]
type = reversaldef
trigger1 = anim = 1501
trigger1 = animelem = 3
reversal.attr = SC, AA
p1stateno = 1505
pausetime = 0, 20
hitsound = s2, 0
sparkno = ifelse(fvar(31), -1, 40) + 0 * (var(33) := -1)
sparkxy = 20, 0
numhits = 0

[State 1500, Drop Target];ReversalDef bug
type = targetdrop
triggerall = numtarget
trigger1 = target, movetype != H
trigger2 = target, hitover

[State Idle]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I

[State 1500, End]
type = changestate
trigger1 = !animtime
value = ifelse(anim = 1501, 11, 0)
ctrl = 1


;--- GOUHA KEN ---
[Statedef 1505]
type = S
movetype = A
physics = S
velset = 0, 0
poweradd = 50 * !var(20)
sprpriority = 1
ctrl = 0

[State 1505, Spark]
type = helper
trigger1 = fvar(31)
trigger1 = !time && numenemy
helpertype = normal
stateno = ifelse((enemynear, hitdefattr = SCA, NA), 8000, 8001)
ID = 8000
name = "Spark"
postype = p1
pos = 20 + ifelse(fvar(16) >= 20, 20, ceil(fvar(16))), ifelse(anim = 1501, -20, -60)
ownpal = 1
pausemovetime = 255
supermovetime = 255
ignorehitpause = 1
persistent = 0

[State 1505, Width]
type = changeanim
trigger1 = !time
value = 1505
ignorehitpause = 1

[State 1505, Width]
type = width
trigger1 = time > 0
trigger1 = animelemtime(7) >= 0 && animelemtime(12) < 0
value = 35, 0
ignorehitpause = 1

[State 1505, Snd]
type = playsnd
trigger1 = animelem = 8
value = 1, 3
channel = 1
[State 1505, Snd]
type = playsnd
trigger1 = !time
value = 4, 13
channel = 0

[State 1505, Snd]
type = playsnd
trigger1 = time > 0
trigger1 = animelem = 7
value = 5, 4
ignorehitpause = 1

[State 1505, Dust]
type = explod
trigger1 = time > 0
trigger1 = animelem = 7
anim = 7100
ID = 7100
sprpriority = 1
postype = p1
pos = 48, 0
scale = 0.5, 0.5
ownpal = 1
ignorehitpause = 1
pausemovetime = -1
supermovetime = -1

[State 1505, Dust]
type = explod
trigger1 = time > 0
trigger1 = animelem = 7
anim = 7102
ID = 7102
sprpriority = -2
postype = p1
pos = 48, 0
scale = 0.5, 0.5
ownpal = 1
ignorehitpause = 1
pausemovetime = -1
supermovetime = -1

[State 1505, Shake]
type = envshake
trigger1 = animelem = 7
time = 18
freq = 180
ampl = 2

[State 1505, Hit]
type = hitdef
trigger1 = animelem = 9
trigger1 = (var(15) < 1 || var(20))
ID = 1505
attr = S, SA
damage = 116, 14
animtype = Diagup
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 12, 12;ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 40) * (var(36) := 80), var(37) := -74
hitsound = -1 + 0 * (var(31) := 3)
guardsound = -1
ground.type = High
ground.slidetime = 18
ground.hittime = 18
ground.velocity = -6, -7.5
air.type = Low
air.velocity = -6, -7.5
yaccel = 0.4850
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 100) * !var(20), ifelse(moveguarded, 25, 50) * !var(20)
givepower = 40, 40
;no envshake
fall = 1
fall.recover = 1
fall.recovertime = 120
airguard.ctrltime = 16
airguard.velocity = -6.00, -1.00
forcestand = 1
airguard.cornerpush.veloff = 0

[State Idle]
type = statetypeset
trigger1 = animelemtime(10) >= 0
movetype = I

[State 1505, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1
