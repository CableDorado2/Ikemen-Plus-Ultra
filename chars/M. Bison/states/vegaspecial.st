; _______________________________
;| Vega by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;============================================================================================
;=====================================<SPECIAL STATES>=======================================
;============================================================================================

;======================<PSYCHO CRUSHER>=============================
[Statedef 1000]
type = S
physics = S
movetype = A
ctrl = 0
anim = 1000
velset = 0, 0
poweradd = 100 * !var(20)
facep2 = 1
sprpriority = 1

[State 1000, Strength]
type = varset
trigger1 = var(10) != [1, 3]
var(10) = 2
ignorehitpause = 1

[State 1000, Strength AI]
type = varset
trigger1 = time <= 0 && AIlevel
var(10) = ifelse(random < 500, 3, ifelse(random < 666, 2, 1))
ignorehitpause = 1

[State 1000, Strength AI]
type = varset
trigger1 = time <= 0 && AIlevel
trigger1 = fvar(16) >= 160
var(10) = ifelse(random < 500, 3, 2)
ignorehitpause = 1

[State 1000, Strength AI]
type = varset
trigger1 = time <= 0 && AIlevel
trigger1 = fvar(16) >= 200
var(10) = 3
ignorehitpause = 1

[State 1000, Width]
type = width
trigger1 = anim = 1000 && animelemtime(4) >= 0
value = 20
ignorehitpause = 1
[State 1000, Push]
type = playerpush
trigger1 = anim = 1000 && animelemtime(6) >= 0
value = 0
ignorehitpause = 1

[State 1000, NHB]
type = nothitby
trigger1 = anim = 1000 && animelemtime(6) >= 0
value = , NP
time = 1
ignorehitpause = 1

[State 1000, shield]
type = helper
trigger1 = !numhelper(1007)
trigger1 = anim = 1000 && animelemtime(6) >= 0
helpertype = normal
stateno = 1007
ID = 1007
name = "Projectile Hitter"
postype = p1

[State 1000, Vel]
type = velset
trigger1 = anim = 1000 && animelemtime(4) >= 0
x = ifelse(var(10) = 3, 10, ifelse(var(10) = 2, 7.5, 5))
y = 0
[State 1000, Type]
type = statetypeset
trigger1 = anim = 1000 && animelemtime(4) >= 0
statetype = A
physics = N

[State 1000, FX]
type = helper
trigger1 = !numhelper(1005)
trigger1 = anim = 1000 && animelemtime(6) >= 0
helpertype = normal
stateno = 1005
ID = 1005
name = "Psycho Crusher"
postype = p1
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1
pausemovetime = 999
supermovetime = 999

[State 1000, Snd]
type = playsnd
trigger1 = anim = 1000 && animelem = 4
value = 0, 40

[State 1000, Dust]
type = helper
trigger1 = anim = 1000 && animelem = 4
helpertype = normal
stateno = 7104
ID = 7100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 1000, Snd]
type = playsnd
trigger1 = anim = 1000 && animelem = 5
value = 4, 5
channel = 0
[State 1000, Snd]
type = playsnd
trigger1 = anim = 1000 && animelem = 5
value = 5, 4

[State 1000, Hit]
type = hitdef
triggerall = anim = 1000 && animelemtime(6) >= 0
triggerall = (var(15) < 1 || var(20))
trigger1 = !movereversed && !(movecontact % ifelse(var(10) = 3, 6, ifelse(var(10) = 2, 8, 10)))
trigger2 = !movecontact && !(movereversed % ifelse(var(10) = 3, 6, ifelse(var(10) = 2, 8, 10)))
attr = A, SA
damage = ifelse(movecontact, 20, 90 + 10 * var(10)), 7
animtype = Hard
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = 12, 12
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 0) * (var(36) := 75), var(37) := -59
hitsound = -1 + 0 * (var(31) := 3)
guardsound = -1
ground.type = Low
ground.slidetime = 18
ground.hittime = 18
ground.velocity = -6, -6
ground.cornerpush.veloff = 0
guard.slidetime = 12
guard.hittime = 12
guard.velocity = -4.49
air.type = Low
air.velocity = -6, -6
getpower = ifelse(movehit, 25, 100) * !var(20), ifelse(moveguarded, 25, 50) * !var(20)
givepower = 40, 40
forcestand = 1
envshake.time = 10
envshake.ampl = 1
envshake.freq = 180
palfx.sinadd = 64, 64, 64, 4
palfx.mul = 128, 128, 128
palfx.time = 60
fall = 1
fall.recover = 1
fall.recovertime = 120
ID = 1000
yaccel = 0.4850
airguard.ctrltime = 16
airguard.velocity = -6.00, -1.00
airguard.cornerpush.veloff = 0

[State 1000, Burned]
type = targetstate
trigger1 = movehit
trigger1 = numtarget(1000)
trigger1 = target, selfanimexist(7697)
trigger1 = (target(1000), stateno = 5000) || (target(1000), stateno = 5010) || (target(1000), stateno = 5020)
value = 7697
ID = 1000
ignorehitpause = 1

[State 1000, Flame Particles]
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
size.height = 48
ignorehitpause = 1

[State 1000, Anim]
type = changeanim
triggerall = anim = 1000 && time >= 20
trigger1 = frontedgedist <= (const(size.air.front) + 20)
trigger2 = var(10) = 1 && time >= 37
trigger3 = var(10) = 2 && time >= 61
trigger4 = var(10) = 3 && time >= 85
value = 1001

[State 1000, Vel]
type = velmul
trigger1 = anim = 1001
x = 0.85

[State 1000, End]
type = changeanim
trigger1 = anim = 1001 && !animtime
value = 1002
[State 1000, Vel]
type = velset
trigger1 = anim = 1002
x = 0
y = 0
[State 1000, Pos]
type = posset
trigger1 = anim = 1002
y = 0
[State 1000, Type]
type = statetypeset
trigger1 = anim = 1002
statetype = S
physics = S
[State 1000, Snd]
type = playsnd
trigger1 = anim = 1002
value = 0, 52
persistent = 0
[State 1000, Dust]
type = explod
trigger1 = anim = 1002
anim = 7102
ID = 7102
sprpriority = -2
postype = p1
scale = 0.5, 0.5
ownpal = 1
persistent = 0
pausemovetime = -1
supermovetime = -1

[State Idle]
type = statetypeset
trigger1 = anim != 1000
movetype = I

[State 1000, End]
type = changestate
trigger1 = anim = 1002 && !animtime
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


;======================<DOUBLE KNEE PRESS>=============================
[Statedef 1100]
type = S
physics = N
movetype = A
ctrl = 0
anim = 1100
velset = 0, 0
poweradd = 100 * !var(20)
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
var(10) = ifelse((p2movetype = H || random < 333), 1, ifelse(random < 500, 2, 3))
ignorehitpause = 1

[State 1100, Anim]
type = changeanim
trigger1 = !time
value = ifelse(var(10) = 3, 1102, ifelse(var(10) = 2, 1101, 1100))

[State 1100, Snd]
type = playsnd
trigger1 = (anim = [1100, 1102]) && animelem = 2
value = 0, 40

[State 1100, Dust]
type = helper
trigger1 = (anim = [1100, 1102]) && animelem = 2
helpertype = normal
stateno = 7104
ID = 7100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 1100, Vel]
type = velset
trigger1 = (anim = [1100, 1102]) && animelem = 2
x = ifelse(var(10) = 3, 10, ifelse(var(10) = 2, 8, 6))
y = -ifelse(var(10) = 3, 3, ifelse(var(10) = 2, 2.5, 2))

[State 1100, Type]
type = statetypeset
trigger1 = (anim = [1100, 1102]) && animelemtime(2) >= 0
statetype = A
physics = N
[State 1100, Accel]
type = veladd
trigger1 = (anim = [1100, 1102]) && animelemtime(2) >= 0
y = 0.25

[State 1100, Snd]
type = playsnd
trigger1 = (anim = [1100, 1102]) && animelem = 3
value = 3, 6
channel = 0
[State 1100, Snd]
type = playsnd
trigger1 = (anim = [1100, 1102]) && animelem = 4
value = 1, 6
channel = 1

[State 1100, Hit High]
type = hitdef
trigger1 = (anim = [1100, 1102]) && animelem = 4
trigger1 = (var(15) < 1 || var(20))
attr = A, SA
damage = 35 + (5 * var(10)), 7
animtype = Hard
fall.animtype = Back
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = 12, 12
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 0) * (var(36) := 80), var(37) := -85
hitsound = -1 + 0 * (var(31) := 6)
guardsound = -1
ground.type = Low
ground.slidetime = 18
ground.hittime = 18
ground.velocity = -7, 0
air.type = Low
air.velocity = -4.0, -6.0
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 100) * !var(20), ifelse(moveguarded, 25, 50) * !var(20)
givepower = 40, 40
forcestand = 1
envshake.time = 10
envshake.ampl = 1
envshake.freq = 180
fall = 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.4850
airguard.ctrltime = 16
airguard.velocity = -6.00, -1.00
airguard.cornerpush.veloff = 0

[State 1100, Hit Low]
type = hitdef
trigger1 = (anim = [1100, 1102]) && animelem = 5
trigger1 = (var(15) < 1 || var(20))
attr = A, SA
damage = 35 + (5 * var(10)), 7
animtype = Back
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = 12, 12
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 22) * (var(36) := 66), var(37) := -26
hitsound = -1 + 0 * (var(31) := 6)
guardsound = -1
ground.type = Low
ground.slidetime = 18
ground.hittime = 18
ground.velocity = -4.0, -6.0
air.type = Low
air.velocity = -4.0, -6.0
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 100) * !var(20), ifelse(moveguarded, 25, 50) * !var(20)
givepower = 40, 40
forcestand = 1
envshake.time = 10
envshake.ampl = 1
envshake.freq = 180
fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.4850
airguard.ctrltime = 16
airguard.velocity = -6.00, -1.00
airguard.cornerpush.veloff = 0

[State 1100, End]
type = changeanim
trigger1 = vel y > 0 && vel y > 0 && (pos y > -vel y)
value = 1103

[State 1100, Recovery]
type = changeanim
triggerall = anim = 1103
triggerall = animelemtime(2) < 0
trigger1 = var(10) = 1
trigger1 = animelemtime(1) = 6
trigger2 = var(10) = 2
trigger2 = animelemtime(1) = 9
value = 1103
elem = 2

[State 1100, Vel]
type = velset
trigger1 = anim = 1103
x = 0
y = 0

[State 1100, Pos]
type = posset
trigger1 = anim = 1103
y = 0

[State 1100, Type]
type = statetypeset
trigger1 = anim = 1103
statetype = S
physics = S
movetype = I

[State 1100, Snd]
type = playsnd
trigger1 = anim = 1103
value = 0, 52
persistent = 0

[State 1100, Dust]
type = explod
trigger1 = anim = 1103
anim = 7102
ID = 7102
sprpriority = -2
postype = p1
scale = 0.5, 0.5
ownpal = 1
persistent = 0
pausemovetime = -1
supermovetime = -1

[State 1100, End]
type = changestate
trigger1 = anim = 1103 && !animtime
value = 0
ctrl = 1


;======================<HEAD PRESS>=============================
[Statedef 1200]
type = S
physics = N
movetype = A
ctrl = 0
anim = 1200
velset = 0, 0
poweradd = 100 * !var(20)
facep2 = 1
juggle = 7 * !var(20)
sprpriority = 1

[State 1200, Strength]
type = varset
trigger1 = !time
var(10) = 3
ignorehitpause = 1

[State 1200, Snd]
type = playsnd
trigger1 = animelem = 2
value = 0, 40

[State 1200, Dust]
type = helper
trigger1 = animelem = 2
helpertype = normal
stateno = 7100
ID = 7100
name = "Dust"
postype = p1
ownpal = 1

[State 1200, Type]
type = statetypeset
trigger1 = animelemtime(2) >= 0
statetype = A
physics = N

[State 1200, Accel]
type = veladd
trigger1 = animelemtime(2) >= 1
y = 1.0

[State 1200, Vel]
type = velset
trigger1 = animelemtime(2) = 1
y = -14
persistent = 0

[State 1200, Vel]
type = velset
trigger1 = animelemtime(2) = 1
trigger1 = numenemy
x = p2dist x / (14 + ((14 ** 2) - (2 * (enemynear(0), const(size.height)))) ** 0.5)
persistent = 0

[State 1200, Vel]
type = velset
trigger1 = vel x > 10
x = 10

[State 1200, Vel]
type = turn
trigger1 = vel x < 0
persistent = 0

[State 1200, Vel]
type = velset
trigger1 = vel x < 0
x = 0

[State 1200, Snd]
type = playsnd
trigger1 = animelem = 2
value = 3, 0
channel = 0

[State 1200, Miss]
type = hitdef
trigger1 = animelemtime(6) >= 0
trigger1 = !movecontact && !movereversed
attr = A, SA
hitflag =
sparkxy = -10, 0

[State 1200, Hit]
type = hitdef
trigger1 = animelemtime(6) >= 0
trigger1 = !movecontact && !movereversed
trigger1 = var(15) < 2 || var(20)
attr = A, SA
damage = 100, 13
animtype = Hard
air.animtype = Back
guardflag = HA
hitflag = MAFD
priority = 4, Hit
pausetime = 0, 24
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := -10) * (var(36) := 10), var(37) := 0
hitsound = -1 + 0 * (var(31) := 6)
guardsound = -1
ground.type = Low
ground.slidetime = 18
ground.hittime = 18
ground.velocity = -7, 0
air.type = Low
air.velocity = -4, -4
air.cornerpush.veloff = 0
down.velocity = 0, 0
getpower = ifelse(movehit, 25, 100) * !var(20), ifelse(moveguarded, 25, 50) * !var(20)
givepower = 40, 40
forcestand = 1
envshake.time = 10
envshake.ampl = 1
envshake.freq = 180
fall = 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120
ID = 1200
yaccel = 0.4850
airguard.ctrltime = 16
airguard.velocity = -6.00, -1.00
airguard.cornerpush.veloff = 0

[State 1200, End]
type = changestate
trigger1 = movecontact
value = 1201
ignorehitpause = 1

[State 1200, End]
type = changestate
trigger1 = vel y > 0 && (pos y > -vel y)
value = 1202


;--- HIT ---
[Statedef 1201]
type = A
physics = N
movetype = A
ctrl = 0
anim = 1201
velset = 0, 0
sprpriority = 1

[State 1201, Pos]
type = posfreeze
trigger1 = animelemtime(4) < 0
value = 1
ignorehitpause = 1

[State 1201, Push]
type = playerpush
trigger1 = animelemtime(5) < 0
value = 0
ignorehitpause = 1

[State 1201, Accel]
type = veladd
trigger1 = animelemtime(5) >= 0
y = 0.53

[State 1201, Snd]
type = playsnd
trigger1 = animelem = 5
value = 0, 40

[State 1201, Vel]
type = velset
trigger1 = animelem = 5
x = 0
y = -7.70

[State 1201, Vel Dir]
type = velmul
trigger1 = 1
x = 0.95

[State 1201, Vel Dir]
type = velset
trigger1 = animelemtime(5) >= 0
trigger1 = command = "holdfwd" && command != "holdback"
x = 4.818

[State 1201, Vel Dir]
type = velset
trigger1 = animelemtime(5) >= 0
trigger1 = command != "holdfwd" && command = "holdback"
x = -4.818

[State 1201, Skull Diver]
type = changestate
triggerall = animelemtime(8) >= 0
trigger1 = !AIlevel && (command = "x" || command = "y" || command = "z")
trigger2 = AIlevel && (p2dist y = [-50, 100])
value = 1205

[State 1201, End]
type = changestate
trigger1 = vel y > 0 && (pos y > -vel y)
value = 1203


;--- MISS ---
[Statedef 1202]
type = S
physics = S
ctrl = 0
anim = 1202
sprpriority = 1

[State 1202, Vel]
type = velset
trigger1 = 1
x = 0
y = 0

[State 1202, Pos]
type = posset
trigger1 = 1
y = 0

[State 1202, Snd]
type = playsnd
trigger1 = !time
value = 5, 7

[State 1202, Dust]
type = explod
trigger1 = !time
anim = 7100
ID = 7100
sprpriority = 1
postype = p1
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 1202, Dust]
type = explod
trigger1 = !time
anim = 7102
ID = 7102
sprpriority = -2
postype = p1
scale = 0.75, 0.75
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 1202, Shake]
type = envshake
trigger1 = !time
time = 12
freq = 180
ampl = 2

[State 1202, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;---Land---
[Statedef 1203]
type = S
physics = S
movetype = I
anim = 1203
ctrl = 0
velset = 0, 0
sprpriority = 1
movehitpersist = 1
hitcountpersist = 1

[State 1203, Pos]
type = posset
trigger1 = 1
y = 0

[State 1203, Snd]
type = playsnd
trigger1 = !time
value = 0, 52
[State 1203, Dust]
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

[State 1203, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- SOMERSAULT SKULL DIVER ---
[Statedef 1205]
type = A
movetype = A
physics = N
anim = 1205
poweradd = 100 * !var(20)
sprpriority = 1
ctrl = 0
facep2 = 1

[State 1205, Accel]
type = veladd
trigger1 = time
y = 0.53

[State 1205, Vel Dir]
type = velmul
trigger1 = 1
x = 0.95

[State 1205, Vel Dir]
type = velset
trigger1 = command = "holdfwd" && command != "holdback"
x = 4.818

[State 1205, Vel Dir]
type = velset
trigger1 = command != "holdfwd" && command = "holdback"
x = -4.818

[State 1205, Snd]
type = playsnd
trigger1 = animelem = 3
value = 4, 2
channel = 0

[State 1205, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 3
channel = 1

[State 1205, Snd]
type = playsnd
trigger1 = animelem = 2
value = 5, 2
channel = 3

[State 1205, FX]
type = helper
trigger1 = !numhelper(6000)
helpertype = normal
stateno = 6000
ID = 6000
name = "Psycho Power"
postype = p1
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1
persistent = 0

[State 1205, Hit]
type = hitdef
trigger1 = animelem = 4
trigger1 = (var(15) < 3 || var(20))
attr = A, SA
damage = 70, 7
animtype = Hard
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 12, 12
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 20) * (var(36) := 76), var(37) := -98
hitsound = -1 + 0 * (var(31) := 3)
guardsound = -1
ground.type = High
ground.slidetime = 18
ground.hittime = 18
ground.velocity = -7
air.type = Low
air.velocity = -5, -6
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 100) * !var(20), ifelse(moveguarded, 25, 50) * !var(20)
givepower = 40, 40
envshake.time = 10
envshake.freq = 180
envshake.ampl = 3
yaccel = 0.4850
airguard.ctrltime = 16
airguard.velocity = -6.00, -1.00
forcestand = 1
fall = 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120
airguard.cornerpush.veloff = 0

[State 1205, Type]
type = statetypeset
trigger1 = animelemtime(6) >= 0
movetype = I

[State 1205, End]
type = changestate
trigger1 = vel y > 0 && pos y > 0
value = 1203


;======================<DEVIL REVERSE>=============================
[Statedef 1250]
type = S
physics = N
movetype = A
ctrl = 0
anim = 1250
velset = 0, 0
poweradd = 100 * !var(20)
facep2 = 1
sprpriority = 1

[State 1250, Strength]
type = varset
trigger1 = !time
var(10) = 3
ignorehitpause = 1

[State 1250, Snd]
type = playsnd
trigger1 = animelem = 2
value = 0, 40

[State 1250, Dust]
type = helper
trigger1 = animelem = 2
helpertype = normal
stateno = 7100
ID = 7100
name = "Dust"
postype = p1
ownpal = 1

[State 1250, Type]
type = statetypeset
trigger1 = animelemtime(2) >= 0
statetype = A
physics = N

[State 1250, Accel]
type = veladd
trigger1 = animelemtime(2) >= 1
y = 1.0

[State 1200, Vel]
type = velset
trigger1 = animelemtime(2) = 1
y = -14

[State 1200, Vel]
type = velset
trigger1 = animelemtime(2) = 1
trigger1 = numenemy
x = p2dist x / (14 + ((14 ** 2) - (2 * (enemynear(0), const(size.height)))) ** 0.5)
persistent = 0

[State 1250, Vel]
type = turn
trigger1 = vel x < 0
persistent = 0

[State 1250, Vel]
type = velset
trigger1 = vel x > 10
x = 10

[State 1250, Vel]
type = velset
trigger1 = vel x < 0
x = 0

[State 1250, Snd]
type = playsnd
trigger1 = animelem = 2
value = 3, 0
channel = 0

[State 1250, Punch]
type = changestate
triggerall = vel y >= 0
triggerall = animelemtime(2) > 0
trigger1 = !AIlevel
trigger1 = command = "x" || command = "y" || command = "z"
trigger2 = AIlevel
trigger2 = p2dist y = [-50, 100]
value = 1255

[State 1250, End]
type = changestate
trigger1 = vel y > 0 && (pos y > -vel y)
value = 1203


;--- Punch ---
[Statedef 1255]
type = A
physics = N
movetype = A
ctrl = 0
anim = 1255
velset = 0, 0
poweradd = 0
sprpriority = 1

[State 1255, Snd]
type = playsnd
trigger1 = animelem = 4
value = 3, 5
channel = 0

[State 1255, Snd]
type = playsnd
trigger1 = animelem = 8
value = 1, 3
channel = 1

[State 1255, Accel]
type = veladd
trigger1 = time
y = 0.75

[State 1255, Vel]
type = velset
trigger1 = !time
x = -6
y = -9

[State 1255, Vel Dir]
type = velmul
trigger1 = 1
x = 0.95

[State 1255, Vel Dir]
type = velset
trigger1 = command = "holdfwd" && command != "holdback"
x = 4.818

[State 1255, Vel Dir]
type = velset
trigger1 = command != "holdfwd" && command = "holdback"
x = -4.818

[State 1255, Turn]
type = turn
trigger1 = !time
trigger1 = command = "holdfwd" && command != "holdback"

[State 1255, Snd]
type = playsnd
trigger1 = animelem = 6
value = 5, 2
channel = 3

[State 1255, FX]
type = helper
trigger1 = !numhelper(6000)
helpertype = normal
stateno = 6000
ID = 6000
name = "Psycho Power"
postype = p1
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1
persistent = 0

[State 1255, Hit]
type = hitdef
trigger1 = animelem = 8
trigger1 = (var(15) < 3 || var(20))
attr = A, SA
damage = 70, 9
animtype = Back
fall.animtype = Back
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 12, 12
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 10) * (var(36) := 70), var(37) := -60
hitsound = -1 + 0 * (var(31) := 3)
guardsound = -1
ground.type = High
ground.slidetime = 18
ground.hittime = 18
ground.velocity = -4, -8.5
air.type = Low
air.velocity = -4, -8.5
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 100) * !var(20), ifelse(moveguarded, 25, 50) * !var(20)
givepower = 40, 40
envshake.time = 10
envshake.freq = 180
envshake.ampl = 3
palfx.sinadd = 64, 64, 64, 4
palfx.mul = 128, 128, 128
palfx.time = 60
fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.4850
airguard.ctrltime = 16
airguard.velocity = -6.00, -1.00
forcestand = 1
airguard.cornerpush.veloff = 0

[State 1255, Juggle Reset]
type = varset
trigger1 = movehit = 1
var(15) = 0
ignorehitpause = 1

[State 1255, Flame Particles]
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
size.height = 48
ignorehitpause = 1

[State 1255, End]
type = changestate
trigger1 = vel y > 0 && (pos y > -vel y)
value = 1203


;======================<PSYCHO IMPACT>=============================
[Statedef 1300]
type = S
physics = S
movetype = A
ctrl = 0
anim = 1300
velset = 0, 0
poweradd = 100 * !var(20)
facep2 = 1
sprpriority = 1

[State 1300, Strength]
type = varset
trigger1 = var(10) != [1, 3]
var(10) = 2
ignorehitpause = 1

[State 1300, Strength AI]
type = varset
trigger1 = time <= 0 && AIlevel
var(10) = ifelse(random < 500, 3, ifelse(random < 666, 2, 1))
ignorehitpause = 1

[State 1300, Type]
type = statetypeset
trigger1 = animelemtime(2) >= 0 && animelemtime(13) < 0
physics = N
[State 1300, Type]
type = statetypeset
trigger1 = animelemtime(2) < 0 || animelemtime(13) >= 0
physics = S

[State 1300, Snd]
type = playsnd
trigger1 = animelem = 2
value = 0, 102

[State 1300, Dust]
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

[State 1300, Vel]
type = velset
trigger1 = animelem = 2
x = ifelse(var(10) = 3, 12, ifelse(var(10) = 2, 9, 6))

[State 1300, Vel]
type = velmul
trigger1 = vel x
x = 0.95

[State 1300, Anim]
type = changeanim
triggerall = animelemtime(2) >= 2 && animelemtime(3) < 0
trigger1 = var(10) = 1 && animelemtime(2) >= 6
trigger2 = var(10) = 2 && animelemtime(2) >= 10
trigger3 = var(10) = 3 && animelemtime(2) >= 14
value = 1300
elem = 3

[State 1300, Snd]
type = playsnd
trigger1 = animelem = 1 || animelem = 3 || animelem = 8
value = 3, ifelse((animelem = 1), 1, ifelse((animelem = 3), 4, 8))
channel = 0
[State 1300, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 3
channel = 1
[State 1300, Snd]
type = playsnd
trigger1 = animelem = 8
value = 5, 2
channel = 1

[State 1300, FX]
type = explod
trigger1 = animelem = 9
anim = 1305
ID = 1305
sprpriority = 1
postype = p1
bindtime = -1
removeongethit = 1
scale = 0.5, 0.5

[State 1300, Hit]
type = hitdef
trigger1 = animelem = 4
trigger1 = (var(15) < (1 + hitcount) || var(20))
attr = S, SA
damage = 40, 7
animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 12, 12
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 20) * (var(36) := 50), var(37) := -66
hitsound = -1 + 0 * (var(31) := 3)
guardsound = -1
ground.type = Low
ground.slidetime = 18
ground.hittime = 24
ground.velocity = -6, 0
air.type = Low
air.velocity = -2, -4
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 50, 100) * (!var(20) && prevstateno != 750), ifelse(moveguarded, 25, 50)
givepower = 40, 40
forcestand = 1
envshake.time = 10
envshake.ampl = 1
envshake.freq = 180
air.fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.4850

[State 1300, Hit]
type = hitdef
trigger1 = animelem = 9
trigger1 = (var(15) < (1 + hitcount) || var(20))
attr = S, SA
damage = 60, 8
animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 4, 4
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 83), var(37) := -85
hitsound = -1 + 0 * (var(31) := 3)
guardsound = -1
ground.type = High
ground.slidetime = 18
ground.hittime = 18
ground.velocity = -6, -6
air.type = Low
air.velocity = -6, -6
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
getpower = ifelse(movehit, 50, 100) * (!var(20) && prevstateno != 750), ifelse(moveguarded, 25, 50)
givepower = 40, 40
forcestand = 1
envshake.time = 10
envshake.ampl = 1
envshake.freq = 180
palfx.sinadd = 64, 64, 64, 4
palfx.mul = 128, 128, 128
palfx.time = 60
fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.4850

[State 1300, Flame Particles]
type = helper
trigger1 = animelemtime(9) >= 0
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
size.height = 60
ignorehitpause = 1

[State Idle]
type = statetypeset
trigger1 = animelemtime(10) >= 0
movetype = I

[State 1300, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<PSYCHO BANISH>=============================
[Statedef 1400]
type = S
physics = S
movetype = A
ctrl = 0
anim = 1400
velset = 0, 0
poweradd = 100 * !var(20)
facep2 = 1
sprpriority = 1

[State 1400, Strength]
type = varset
trigger1 = var(10) != [1, 3]
var(10) = 2
ignorehitpause = 1

[State 1400, Strength AI]
type = varset
trigger1 = time <= 0 && AIlevel
var(10) = ifelse((p2movetype = H || random < 500), 3, ifelse(random < 500, 2, 1))
ignorehitpause = 1

[State 1400, Anim]
type = changeanim
trigger1 = !time && (var(10) = [1, 3])
value = 1399 + var(10)

[State 1400, Snd]
type = playsnd
trigger1 = animelem = 4
value = 3, 8
channel = 0
[State 1400, Snd]
type = playsnd
trigger1 = animelem = 4
value = 5, 3
channel = 1
[State 1400, FX]
type = helper
trigger1 = !numhelper(6000)
helpertype = normal
stateno = 6000
ID = 6000
name = "Psycho Power"
postype = p1
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1
persistent = 0

[State 1400, shield]
type = helper
triggerall = animelemtime(7) >= 0 && !numhelper(1407)
trigger1 = anim = 1400 && animelemtime(10) < 0
trigger2 = anim = 1401 && animelemtime(11) < 0
trigger3 = anim = 1402 && animelemtime(12) < 0
helpertype = normal
stateno = 1407
ID = 1407
name = "Projectile Banisher"
postype = p1
ownpal = 1

[State 1400, NHB]
type = hitby
trigger1 = numhelper(1407)
value = SCA, AA, AT
time = 1
ignorehitpause = 1

[State 1400, Hit]
type = hitdef
trigger1 = (var(15) < 1 || var(20))
trigger1 = var(10) = 1 && (animelem = 7 || animelem = 8 || animelem = 9)
trigger2 = var(10) = 2 && (animelem = 7 || animelem = 8 || animelem = 9 || animelem = 10)
trigger3 = var(10) = 3 && (animelem = 7 || animelem = 8 || animelem = 9 || animelem = 10 || animelem = 11)
ID = 1400
attr = S, SA
damage = ifelse(var(10) = 1, 30, ifelse(var(10) = 2, 25, 22)), 7
animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 0, ifelse(var(10) = 3, 8,  ifelse(var(10) = 2, 6, 4))
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 40) * (var(36) := 70), var(37) := ceil(-100 + (animelemno(0) -7) * ifelse(var(10) = 3, 19, ifelse(var(10) = 2, 25, 37)))
hitsound = -1 + 0 * (var(31) := 3)
guardsound = -1
ground.type = Low
ground.slidetime = 18
ground.hittime = 18
ground.velocity = -10, 0
ground.cornerpush.veloff = 0;-20.0 * (animelemno(0) >= var(10) + 8)
air.type = Low
air.velocity = -4, -5
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 100) * !var(20), ifelse(moveguarded, 25, 50) * !var(20)
givepower = 40, 40
forcestand = 1
envshake.time = 10
envshake.ampl = 1
envshake.freq = 180
palfx.sinadd = 64, 64, 64, 4
palfx.mul = 128, 128, 128
palfx.time = 30
air.fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.4850

[State 1400, Flame Particles]
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
size.height = 38
ignorehitpause = 1

[State Idle]
type = statetypeset
trigger1 = anim = 1400 && animelemtime(10) >= 0
trigger2 = anim = 1401 && animelemtime(11) >= 0
trigger3 = anim = 1402 && animelemtime(12) >= 0
movetype = I

[State 1400, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<PSYCHO FIELD>=============================
[Statedef 1600]
type = S
physics = S
movetype = A
anim = 1600
ctrl = 0
velset = 0, 0
poweradd = 50 * !var(20)
sprpriority = 1
facep2 = 1

[State 1600, Strength]
type = varset
trigger1 = var(10) != [1, 3]
var(10) = 2
ignorehitpause = 1

[State 1600, Strength AI]
type = varset
trigger1 = time <= 0 && AIlevel
var(10) = ifelse(fvar(16) > 180, 3, ifelse(fvar(16) > 120, 2, 1))
ignorehitpause = 1

[State 1600, field]
type = helper
trigger1 = animelem = 3
helpertype = normal
stateno = 1605
ID = 1605
name = "Psycho Field"
postype = p1
pos = 47, -71
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 1600, Snd]
type = playsnd
trigger1 = animelem = 3
value = 3, 6
channel = 0
[State 1600, Snd]
type = playsnd
trigger1 = animelem = 3
value = 5, 11

[State 1600, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<VEGA WARP>=============================
[Statedef 1700]
type = S
physics = N
movetype = I
anim = 1700
velset = 0, 0
ctrl = 0
sprpriority = -1
facep2 = 1

[State 1700, Strength]
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

[State 1700, Strength]
type = varset
trigger1 = time <= 0 && !AIlevel
var(11) = ifelse(command = "start", 1, 0)
ignorehitpause = 1

[State 1700, Strength]
type = varset
trigger1 = time <= 0 && AIlevel
var(10) = ifelse(random < 500, 3, 2)
ignorehitpause = 1

[State 1700, NHB]
type = nothitby
trigger1 = !var(11)
trigger1 = animelemtime(7) < 0
trigger2 = animelemtime(7) >= 0 && animelemtime(10) < 0
value = SCA, NA, SA, HA, NP, SP, HP, NT, ST, HT
time = 1
ignorehitpause = 1

[State 1700, fadeout]
type = trans
trigger1 = animelemtime(7) = [0, 10]
trans = addalpha
alpha = (256 -25 * (animelemtime(7))), (25 * (animelemtime(7)))
[State 1700, fadein]
type = trans
trigger1 = animelemtime(9) = [0, 10]
trans = addalpha
alpha = (25 * (animelemtime(9))), (256 -25 * (animelemtime(9)))

[State 1700, delay]
type = changeanim
trigger1 = animelemtime(6) >= 0 && animelemtime(7) < 0
trigger1 = !AIlevel && var(11) = 1 && command = "holdstart"
value = 1700
elem = ifelse(time >= 60, 10, 6)

[State 1700, Snd]
type = playsnd
trigger1 = animelem = 7
value = 4, 2
channel = 0
[State 1700, Snd]
type = playsnd
trigger1 = animelem = 7 || animelem = 9
value = 5, 6
[State 1700, FX]
type = helper
trigger1 = animelem = 7
helpertype = normal
stateno = 1705
ID = 1705
name = "Warp FX"
postype = p1
ownpal = 1

[State 1700, Vel]
type = velset
trigger1 = !var(11)
trigger1 = animelemtime(8) >= 0 && animelemtime(9) < 0
x = ifelse(var(10) = 3, 32, ifelse(var(10) = -3, -32, ifelse(var(10) = 2, 16, -16)))
[State 1700, Vel]
type = velset
trigger1 = animelem = 9
x = 0

[State 1700, Turn]
type = turn
trigger1 = animelem = 9 && p2dist x < 0
[State 1700, FX]
type = helper
trigger1 = animelem = 9
helpertype = normal
stateno = 1706
ID = 1705
name = "Warp FX"
postype = p1
pos = 60, 0
ownpal = 1

[State 1700, posfix]
type = posadd
trigger1 = animelem = 2 || animelem = 3 || animelem = 13 || animelem = 14
x = ifelse((animelem = 2), -8, ifelse((animelem = 3), -12, ifelse((animelem = 13), 8, 12)))
[State 1700, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- Custom Combo ---
[Statedef 1710]
type = U
physics = N
movetype = I
velset = 0, 0
ctrl = 0
sprpriority = -1

[State 1710, Strength]
type = varset
triggerall = time <= 0 && !AIlevel
trigger1 = helper(9999), command = "623pp" || helper(9999), command = "623kk"
trigger1 = var(10) := ifelse((command = "a" + command = "b" + command = "c") >= 2, 2, 3)
trigger2 = helper(9999), command = "421pp" || helper(9999), command = "421kk"
trigger2 = var(10) := ifelse((command = "a" + command = "b" + command = "c") >= 2, -2, -3)
trigger3 = helper(9999), command = "623pp+" || helper(9999), command = "623kk+"
trigger3 = var(10) := ifelse((command = "a+" + command = "b+" + command = "c+") >= 2, 2, 3)
trigger4 = helper(9999), command = "421pp+" || helper(9999), command = "421kk+"
trigger4 = var(10) := ifelse((command = "a+" + command = "b+" + command = "c+") >= 2, -2, -3)
var(10) = var(10)
ignorehitpause = 1
persistent = 0

[State 1710, Strength Counter]
type = varset
trigger1 = !time && prevstateno = 750
var(10) = 2

[State 1710, Anim]
type = changeanim
trigger1 = time < 10 && (anim != [1710, 1711])
value = anim
elem = animelemno(0)
[State 1710, Anim]
type = changeanim
trigger1 = time >= 10 && (anim != [1710, 1711])
value = ifelse(prevstateno = 750, 1711, 1710)

[State 1710, NHB]
type = nothitby
trigger1 = (anim != [1710, 1711]) || animelemtime(3) < 0
value = SCA, NA, SA, HA, NP, SP, HP, NT, ST, HT
time = 1
[State 1710, Push]
type = playerpush
trigger1 = (anim != [1710, 1711]) || animelemtime(3) < 0
value = 0

[State 1710, fadeout]
type = trans
trigger1 = (anim != [1710, 1711]) && (time = [0, 10])
trans = addalpha
alpha = (256 -25 * time), (25 * time)
[State 1710, fadein]
type = trans
trigger1 = (anim = [1710, 1711]) && (animelemtime(2) = [0, 10])
trans = addalpha
alpha = (25 * (animelemtime(2))), (256 -25 * (animelemtime(2)))

[State 1710, Snd]
type = playsnd
trigger1 = !time
value = 4, 2
channel = 0
[State 1710, Snd]
type = playsnd
trigger1 = !time || ((anim = [1710, 1711]) && animelem = 2)
value = 5, 6
[State 1710, FX]
type = helper
trigger1 = !time
helpertype = normal
stateno = 1705
ID = 1705
name = "Warp FX"
postype = p1
ownpal = 1

[State 1710, Vel]
type = velset
trigger1 = anim = 1710 && animelemtime(2) < 0 && (var(10) = -3 || var(10) = 3)
x = (p2dist x + ifelse(var(10) = 3, 160, -160)) / 10.0
persistent = 0
[State 1710, Vel]
type = velset
trigger1 = anim = 1710 && animelemtime(2) < 0 && (var(10) = -2 || var(10) = 2)
x = (p2dist x + ifelse(var(10) = 2, 64, -64)) / 10.0
persistent = 0
[State 1710, Vel]
type = velset
trigger1 = anim = 1711 && animelemtime(2) < 0
x = (p2dist x + 80) / 2.0
persistent = 0

[State 1710, Vel]
type = velset
trigger1 = anim = 1710 && animelem = 2
trigger2 = anim = 1711 && animelem = 2
x = 0
y = 0

[State 1710, Vel]z
type = velset
trigger1 = (anim != [1710, 1711])
trigger2 = (anim = [1710, 1711]) && animelemtime(2) >= 0
x = 0
y = 0

[State 1710, Type]
type = statetypeset
trigger1 = (anim = [1710, 1711]) && animelemtime(2) >= 0
statetype = S
physics = S
[State 1710, Pos]
type = posset
trigger1 = (anim = [1710, 1711]) && animelemtime(2) >= 0 && pos y
y = 0

[State 1710, Turn]
type = turn
trigger1 = (anim = [1710, 1711]) && animelem = 2 && p2dist x < 0
[State 1710, FX]
type = helper
trigger1 = (anim = [1710, 1711]) && animelem = 2
helpertype = normal
stateno = 1706
ID = 1705
name = "Warp FX"
postype = p1
pos = 60, 0
ownpal = 1

[State 1710, posfix]
type = posadd
trigger1 = anim = 1710 && (animelem = 6 || animelem = 7)
x = ifelse((animelem = 6), 8, 12)
[State 1710, End]
type = changestate
trigger1 = (anim = [1710, 1711]) && !animtime
value = 0
ctrl = 1
