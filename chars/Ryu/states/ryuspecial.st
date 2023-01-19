; ______________________________
;| Ryu by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;============================================================================================
;=====================================<SPECIAL STATES>=======================================
;============================================================================================

;======================<HADOU KEN>=============================
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
value = 20, 0

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
pos = 80, -66
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 1000, Snd]
type = playsnd
trigger1 = animelem = 3
value = ifelse(var(1) = 2, 14, 4), 0
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


;======================<EX HADOU KEN>=============================
[Statedef 1010]
type = S
physics = S
movetype = A
anim = 1010
ctrl = 0
velset = 0, 0
poweradd = -500
sprpriority = 1
facep2 = 1

[State 1010, Strength]
type = varset
trigger1 = var(10) != 4
var(10) = 4
ignorehitpause = 1

[State 1010, Custom Combo End]
type = palfx
trigger1 = !time
trigger1 = var(20) > 0
trigger1 = (var(20) := 0) || (var(15) := 0) || 1
time = 1

[State 1010, ExFX]
type = explod
trigger1 = !time
anim = 7210
sprpriority = 3
postype = p1
pos = ceil(-16 * const(size.xscale)), ceil(-67 * const(size.yscale))
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1010, Width]
type = width
trigger1 = animelemtime(5) = -1
value = 20, 0

[State 1010, Correct Projectile Trade]
type = hitby
trigger1 = animelem = 11
value = SCA, AA, AT
time = 1

[State 1010, Hadouken]
type = helper
trigger1 = animelem = 5
helpertype = normal
stateno = 1015
ID = 1015
name = "Hadouken"
postype = p1
pos = 80, -66
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 1010, Snd]
type = playsnd
trigger1 = animelem = 3
value = ifelse(var(1) = 2, 14, 4), ifelse(var(1) = 2, 0, 18)
channel = 0
[State 1010, Snd]
type = playsnd
trigger1 = animelem = 5
value = 5, 0

[State 1010, End]
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
trigger1 = animelemtime(6) = -1
value = 20, 0

[State 1020, Anim]
type = changeanim
triggerall = animelem = 5
trigger1 = var(10) = 1 && time < 10
trigger2 = var(10) = 2 && time < 16
trigger3 = var(10) = 3 && time < 22
value = 1020
elem = 3

[State 1020, Correct Projectile Trade]
type = hitby
trigger1 = animelem = 6
value = SCA, AA, AT
time = 1

[State 1020, FX]
type = helper
trigger1 = animelem = 3 && !numhelper(1024)
helpertype = normal
stateno = 1024
ID = 1024
name = "Shakunetsu Charge"
postype = p1
ownpal = 1

[State 1020, Hadouken]
type = helper
trigger1 = animelem = 6
helpertype = normal
stateno = 1025
ID = 1025
name = "Shakunetsu Hadouken"
postype = p1
pos = 78, -68
ownpal = 1
size.xscale = ifelse(var(10) = 3, 0.5, ifelse(var(10) = 2, 0.45, 0.4))
size.yscale = ifelse(var(10) = 3, 0.5, ifelse(var(10) = 2, 0.45, 0.4))

[State 1020, Snd]
type = playsnd
trigger1 = animelem = 2
value = ifelse(var(1) = 2, 13, 3), ifelse(var(1) = 2, 5, 5)
channel = 0
persistent = 0

[State 1020, Snd]
type = playsnd
trigger1 = animelem = 6
value = ifelse(var(1) = 2, 14, 4), ifelse(var(1) = 2, 0, 18)
channel = 0

[State 1020, Snd]
type = playsnd
trigger1 = animelem = 6
value = 5, 0

[State 1020, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1

;======================<EX SHAKUNETSU HADOU KEN>=============================
[Statedef 1030]
type = S
physics = S
movetype = A
anim = 1020
ctrl = 0
velset = 0, 0
poweradd = -500
sprpriority = 2
facep2 = 1

[State Damage Scaling - Add]
type = varadd
trigger1 = !time
trigger1 = var(43)
trigger1 = 1 || var(43) := 0
var(42) = 1

[State 1030, Custom Combo End]
type = palfx
trigger1 = !time
trigger1 = var(20) > 0
trigger1 = (var(20) := 0) || (var(15) := 0) || 1
time = 1

[State 1030, ExFX]
type = explod
trigger1 = !time
anim = 7210
sprpriority = 3
postype = p1
pos = ceil(-22 * const(size.xscale)), ceil(-48 * const(size.yscale))
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1030, Width]
type = width
trigger1 = animelemtime(6) = -1
value = 20, 0

[State 1030, Anim]
type = changeanim
trigger1 = animelem = 5
trigger1 = time < 22
value = 1020
elem = 3

[State 1030, FX]
type = helper
trigger1 = animelem = 3 && !numhelper(1024)
helpertype = normal
stateno = 1024
ID = 1024
name = "Shakunetsu Charge"
postype = p1
ownpal = 1

[State 1030, Correct Projectile Trade]
type = hitby
trigger1 = animelem = 6
value2 = SCA, AA, AT
time = 1

[State 1030, Hadouken]
type = helper
trigger1 = animelem = 6
helpertype = normal
stateno = 1035
ID = 1035
name = "Shakunetsu Hadouken"
postype = p1
pos = 78, -68
ownpal = 1
size.xscale = 1
size.yscale = 1

[State 1030, Snd]
type = playsnd
trigger1 = animelem = 2
value = ifelse(var(1) = 2, 13, 3), ifelse(var(1) = 2, 5, 5)
channel = 0
persistent = 0

[State 1030, Snd]
type = playsnd
trigger1 = animelem = 6
value = ifelse(var(1) = 2, 14, 4), ifelse(var(1) = 2, 0, 18)
channel = 0

[State 1030, Snd]
type = playsnd
trigger1 = animelem = 6
value = 5, 0

[State 1030, End]
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


;==============================<HADOU NO KAMAE>==============================
[Statedef 1090]
type = S
physics = S
movetype = I
anim = 1090
ctrl = 0
velset = 0, 0

[State 1090, Snd]
type = playsnd
trigger1 = animelem = 5 && var(1) = 1
value = 3, 6
channel = 0
[State 1090, Snd]
type = playsnd
trigger1 = animelem = 3 && var(1) = 3
value = 4, 100 + (random % 4)
channel = 0

[State Idle]
type = statetypeset
trigger1 = animelemtime(3) >= 0
movetype = I

[State 1090, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<SHORYUU KEN>=============================
[Statedef 1100]
type = S
physics = S
movetype = A
anim = 1100
ctrl = 0
velset = 0, 0
poweradd = 100 * !var(20)
sprpriority = 1
facep2 = 1

[State 1100, Strength]
type = varset
trigger1 = var(10) != [1, 3]
var(10) = 2
ignorehitpause = 1

[State 1100, Strength AI]
type = varset
trigger1 = time <= 0 && AIlevel
var(10) = ifelse((p2movetype = H || random < 333), 3, ifelse(random < 500, 2, 1))
ignorehitpause = 1

[State 1100, Startup]
type = changeanim
triggerall = anim = 1100
triggerall = animelemtime(1) = 1 && animelemtime(2) < 0
trigger1 = var(1) = 1
trigger2 = var(1) != 1 && var(10) != 3
value = 1100
elem = 2
[State 1100, Startup Normal]
type = changeanim
triggerall = anim = 1100
triggerall = animelemtime(2) = 1 && animelemtime(3) < 0
trigger1 = var(1) = 1
trigger2 = var(1) != 1 && var(10) != 3
value = 1100
elem = 3

[State 1100, HB]
type = hitby
trigger1 = anim = 1100 && animelemtime(4) < 0
trigger1 = var(10) = 1
value = SC, AA
time = 1
ignorehitpause = 1

[State 1100, HB]
type = hitby
trigger1 = anim = 1100 && animelemtime(4) < 0
trigger1 = var(10) = 2
value = C, AA
time = 1
ignorehitpause = 1

[State 1100, HB]
type = nothitby
trigger1 = anim = 1100 && animelemtime(4) < 0
trigger1 = var(10) = 3
value = SCA
time = 1
ignorehitpause = 1

[State 1100, Accel]
type = veladd
trigger1 = anim = 1100 && animelemtime(4) >= 1
trigger2 = anim = 1101
y = ifelse(var(10) = 3, 0.66, ifelse(var(10) = 2, 0.61, 0.56))

[State 1100, Vel]
type = velmul
trigger1 = 1
x = 0.88

[State 1100, Vel]
type = velmul
trigger1 = vel y > 0
x = 0

[State 1100, Pos]
type = posadd
trigger1 = anim = 1100
trigger1 = animelem = 1 || animelem = 2
x = ifelse(var(10) = 3, 7, ifelse(var(10) = 2, 2, 0))

[State 1100, Vel]
type = velset
trigger1 = anim = 1100
trigger1 = animelemtime(4) = [0, 1]
x = ifelse(var(10) = 3, 7.2, ifelse(var(10) = 2, 4.9, 2.8))
y = ifelse(var(10) = 3, -12.30, ifelse(var(10) = 2, -9.15, -6.20))

[State 1100, Grounded Frame]
type = posfreeze
trigger1 = anim = 1100 && animelemtime(4) = 0
value = 1

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
trigger1 = anim = 1100 && animelem = 2
value = ifelse(var(1) = 2, 14, 4), 1
channel = 0
ignorehitpause = 1
persistent = 0

[State 1100, Hit Normal]
type = hitdef
trigger1 = var(1) = 1
trigger1 = anim = 1100 && animelem = 3
trigger1 = (var(15) < 1 || var(20))
attr = S, SA
damage = 100 + (var(10) * 10), 15
animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 12, 12
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 25) * (var(36) := 40), var(37) := -79
hitsound = -1 + 0 * (var(31) := 3)
guardsound = -1
ground.type = Low
ground.slidetime = 18
ground.hittime = 18
ground.velocity = ifelse(var(10) = 3, -4, ifelse(var(10) = 2, -3.5, -3)), ifelse(var(10) = 3, -11.50, ifelse(var(10) = 2, -9.50, -7.50))
ground.cornerpush.veloff = 0
air.type = Low
air.velocity = ifelse(var(10) = 3, -4, ifelse(var(10) = 2, -3.5, -3)), ifelse(var(10) = 3, -11.50, ifelse(var(10) = 2, -9.50, -7.50))
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
yaccel = 0.4850
forcestand = 1

[State 1100, Hit Normal]
type = hitdef
trigger1 = var(1) = 1
trigger1 = anim = 1100 && animelem = 4
trigger1 = !movecontact && !movereversed
trigger1 = (var(15) < 1 || var(20))
attr = A, SA
damage = 60, 7
animtype = Back
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = 12, 12
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 10) * (var(36) := 25), var(37) := -106
hitsound = -1 + 0 * (var(31) := 3)
guardsound = -1
ground.type = High
ground.slidetime = 18
ground.hittime = 18
ground.velocity = ifelse(var(10) = 3, -4, ifelse(var(10) = 2, -3.5, -3)), ifelse(var(10) = 3, -11.50, ifelse(var(10) = 2, -9.50, -7.50))
ground.cornerpush.veloff = 0
air.type = Low
air.velocity = ifelse(var(10) = 3, -4, ifelse(var(10) = 2, -3.5, -3)), ifelse(var(10) = 3, -11.50, ifelse(var(10) = 2, -9.50, -7.50))
guard.cornerpush.veloff = 0
guard.velocity = -10.52
getpower = ifelse(movehit, 25, 100) * !var(20), ifelse(moveguarded, 25, 50) * !var(20)
givepower = 40, 40
envshake.time = 10
envshake.ampl = ifelse((gametime % 2), -1, 1)
envshake.freq = 180
fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.4850
airguard.ctrltime = 16
airguard.velocity = -6.00, -1.00
forcestand = 1
airguard.cornerpush.veloff = 0

[State 1100, Hit Evil]
type = hitdef
trigger1 = var(1) != 1 && var(10) >= 3
trigger1 = anim = 1100 && animelem = 2
trigger1 = (var(15) < 1 || var(20))
trigger2 = var(1) != 1
trigger2 = anim = 1100 && animelem = 3
trigger2 = ifelse(var(10) <= 2, (!movecontact && !movereversed), 1)
trigger2 = (var(15) < var(10) || var(20))
attr = S, SA
damage = ifelse(var(10) = 3, 35, ifelse(var(10) = 2, 45, 80)), ifelse(var(10) = 3, 7, ifelse(var(10) = 2, 7, 10))
animtype = Medium
fall.animtype = Medium
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 12, 12
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 25) * (var(36) := 40), var(37) := ifelse((animelem = 2), -52, -79)
hitsound = -1 + 0 * (var(31) := 3)
guardsound = -1
ground.type = Low
ground.slidetime = 18
ground.hittime = 18
ground.velocity = -2.0, -7.50
ground.cornerpush.veloff = 0
air.type = Low
air.velocity = -2.0, -7.50
guard.cornerpush.veloff = 0
guard.velocity = -10.52
getpower = ifelse(movehit, 25, 100) * !var(20), ifelse(moveguarded, 25, 50) * !var(20)
givepower = 40, 40
envshake.time = 10
envshake.ampl = ifelse((gametime % 2), -1, 1)
envshake.freq = 180
fall = 1
fall.recover = 1
fall.recovertime = 120
fall.animtype = Medium
yaccel = 0.4850
forcestand = 1

[State 1100, Hit Evil]
type = hitdef
trigger1 = var(1) != 1
trigger1 = anim = 1100 && animelem = 4
trigger1 = ifelse(var(10) = 1, (!movecontact && !movereversed), 1)
trigger1 = (var(15) < var(10) || var(20))
attr = A, SA
damage = 60, 8
animtype = Up
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = 12, 12
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 10) * (var(36) := 25), var(37) := -106
hitsound = -1 + 0 * (var(31) := 3)
guardsound = -1
ground.type = High
ground.slidetime = 18
ground.hittime = 18
ground.velocity = ifelse(var(10) = 3, -5, ifelse(var(10) = 2, -4, -3)), ifelse(var(10) = 3, -11.50, ifelse(var(10) = 2, -9.50, -7.50))
ground.cornerpush.veloff = 0
air.type = Low
air.velocity = ifelse(var(10) = 3, -5, ifelse(var(10) = 2, -4, -3)), ifelse(var(10) = 3, -11.50, ifelse(var(10) = 2, -9.50, -7.50))
guard.cornerpush.veloff = 0
guard.velocity = -10.52
getpower = ifelse(movehit, 25, 100) * !var(20), ifelse(moveguarded, 25, 50) * !var(20)
givepower = 40, 40
envshake.time = 10
envshake.ampl = ifelse((gametime % 2), -1, 1)
envshake.freq = 180
fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.4850
airguard.ctrltime = 16
airguard.velocity = -6.00, -1.00
forcestand = 1
airguard.cornerpush.veloff = 0

[State 1100, Type]
type = statetypeset
trigger1 = anim = 1100 && animelemtime(4) >= 0
trigger2 = anim = 1101
statetype = A
physics = N

[State 1100, Anim]
type = changeanim
trigger1 = anim = 1100 && animelemtime(4) > 0
trigger1 = vel y > (ifelse(var(10) = 3, -4, ifelse(var(10) = 2, -3, -2)))
value = 1101
persistent = 0

[State Idle]
type = statetypeset
trigger1 = anim = 1101
movetype = I

[State Land]
type = changestate
trigger1 = statetype = A
trigger1 = vel y > 0 && (pos y > -vel y)
value = 1108


;---Land---
[Statedef 1108]
type = S
physics = S
movetype = I
anim = 1108
ctrl = 0
velset = 0, 0
sprpriority = 1
movehitpersist = 1
hitcountpersist = 1

[State 1108, Pos]
type = posset
trigger1 = 1
y = 0

[State 1108, Snd]
type = playsnd
trigger1 = !time
value = 0, 52
[State 1108, Dust]
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

[State 1108, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<EX SHORYUU KEN>=============================
[Statedef 1110]
type = S
physics = S
movetype = A
anim = 1100
ctrl = 0
velset = 0, 0
poweradd = -500
facep2 = 1
sprpriority = 1
sprpriority = 1

[State 1110, Strength]
type = varset
trigger1 = var(10) != 4
var(10) = 4
ignorehitpause = 1

[State 1110, Custom Combo End]
type = palfx
trigger1 = !time
trigger1 = var(20) > 0
trigger1 = (var(20) := 0) || (var(15) := 0) || 1
time = 1

[State 1110, ExFX]
type = explod
trigger1 = !time
anim = 7210
sprpriority = 3
postype = p1
pos = ceil(19 * const(size.xscale)), ceil(-53 * const(size.yscale))
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1110, Startup Normal]
type = changeanim
trigger1 = var(1) = 1
trigger1 = anim = 1100
trigger1 = animelemtime(1) = 1 && animelemtime(2) < 0
value = 1100
elem = 2
[State 1110, Startup Normal]
type = changeanim
trigger1 = var(1) = 1
trigger1 = anim = 1100
trigger1 = animelemtime(2) = 1 && animelemtime(3) < 0
value = 1100
elem = 3

[State 1110, NHB]
type = nothitby
trigger1 = anim = 1100 && animelemtime(4) < 1
value = SCA
time = 1
ignorehitpause = 1

[State 1110, Accel]
type = veladd
trigger1 = anim = 1100 && animelemtime(4) >= 1
trigger2 = anim = 1101
y = 0.66

[State 1110, Vel]
type = velmul
trigger1 = 1
x = 0.88

[State 1110, Vel]
type = velmul
trigger1 = vel y > 0
x = 0

[State 1110, Combo]
type = posadd
trigger1 = anim = 1100
trigger1 = animelem = 1 || animelem = 2
x = 7

[State 1110, Vel]
type = velset
trigger1 = anim = 1100
trigger1 = animelemtime(4) = [0, 1]
x = 12
y = -12.3

[State 1110, Grounded Frame]
type = posfreeze
trigger1 = anim = 1100 && animelemtime(4) = 0
value = 1

[State 1110, Snd]
type = playsnd
trigger1 = anim = 1100 && animelem = 3
value = 1, 3
channel = 1

[State 1110, Snd]
type = playsnd
trigger1 = anim = 1100 && animelem = 4
value = 0, 41

[State 1110, Dust]
type = helper
trigger1 = anim = 1100 && animelem = 4
helpertype = normal
stateno = 7100
ID = 7100
name = "Dust"
postype = p1
ownpal = 1

[State 1110, Snd]
type = playsnd
triggerall = anim = 1100
trigger1 = var(1) != 2 && animelem = 3
trigger2 = var(1) = 2 && animelem = 2
value = ifelse(var(1) = 2, 14, 4), 1
channel = 0
ignorehitpause = 1
persistent = 0

[State 1110, Hit]
type = hitdef
trigger1 = animelem = 2 && anim = 1100 && var(1) != 1
trigger1 = var(15) < 4
trigger2 = animelem = 3 && anim = 1100
trigger2 = var(15) < 4
attr = S, SA
damage = ifelse(var(1) = 1, 90, 47), ifelse(var(1) = 1, 12, 7)
animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 12, 12
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 25) * (var(36) := 40), var(37) := ifelse((animelem = 2), -53, -79)
hitsound = -1 + 0 * (var(31) := 3)
guardsound = -1
ground.type = Low
ground.slidetime = 18
ground.hittime = 18
ground.velocity = 0, -8
ground.cornerpush.veloff = 0
air.type = Low
air.velocity = 0, -8
guard.velocity = -10.52
guard.cornerpush.veloff = 0
getpower = 0
givepower = 40, 40
envshake.time = 10
envshake.ampl = ifelse((gametime % 2), -1, 1)
envshake.freq = 180
fall = 1
fall.recover = 1
fall.recovertime = 120
fall.animtype = Medium
yaccel = 0.4850
forcestand = 1

[State 1110, Hit 2]
type = hitdef
trigger1 = animelem = 4 && anim = 1100
trigger1 = var(15) < 4
attr = A, SA
damage = 60, 8
animtype = Up
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = 12, 12
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 10) * (var(36) := 25), var(37) := -106
hitsound = -1 + 0 * (var(31) := 3)
guardsound = -1
ground.type = High
ground.slidetime = 18
ground.hittime = 18
ground.velocity = -4, -11
ground.cornerpush.veloff = 0
air.type = Low
air.velocity = -4, -11
guard.velocity = -10.52
guard.cornerpush.veloff = 0
getpower = 0
givepower = 40, 40
envshake.time = 10
envshake.ampl = ifelse((gametime % 2), -1, 1)
envshake.freq = 180
fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.4850
airguard.ctrltime = 16
airguard.cornerpush.veloff = 0
airguard.velocity = -6.00, -1.00
forcestand = 1

[State 1110, Type]
type = statetypeset
trigger1 = anim = 1100 && animelemtime(4) >= 0
trigger2 = anim = 1101
statetype = A
physics = N

[State 1110, Anim]
type = changeanim
trigger1 = anim = 1100 && animelemtime(4) > 0 && vel y > (ifelse(var(10) = 3, -5.3, ifelse(var(10) = 2, -4, -2.7)))
value = 1101
persistent = 0

[State Idle]
type = statetypeset
trigger1 = anim = 1101
movetype = I

[State Land]
type = changestate
trigger1 = statetype = A
trigger1 = vel y > 0 && (pos y > -vel y)
value = 1108


;======================<TATSUMAKI SENPUU KYAKU>=============================
[Statedef 1200]
type = A
physics = N
movetype = A
anim = 1200
ctrl = 0
velset = 0, 0
poweradd = 100 * !var(20)
sprpriority = 1
facep2 = 1

[State 1200, Strength]
type = varset
trigger1 = var(10) != [1, 3]
var(10) = 2
ignorehitpause = 1

[State 1200, Strength AI]
type = varset
trigger1 = time <= 0 && AIlevel
var(10) = ifelse((p2movetype = H || random < 333), 1, ifelse(random < 500, 2, 3))
ignorehitpause = 1

[State 1200, Snd]
type = playsnd
trigger1 = anim = 1200 && animelem = 1
value = ifelse(var(1) = 2, 14, 4), 2
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
x = 3.5
y = -4.84

[State 1200, Vel]
type = velset
trigger1 = anim = 1201
x = 3.5
y = 0

[State 1200, Snd]
type = playsnd
trigger1 = anim = 1201 && !(animelemtime(1) % 9)
value = 1, 6
channel = 1

[State 1200, Anim]
type = changeanim
trigger1 = var(1) = 1
trigger1 = anim = 1201 && ifelse(var(10) = 3, animelemtime(19) >= 0, ifelse(var(10) = 2, animelemtime(13) >= 0, animelemtime(7) >= 0))
value = 1205

[State 1200, Anim]
type = changeanim
trigger1 = var(1) != 1
trigger1 = anim = 1201 && ifelse(var(10) = 3, !animtime, ifelse(var(10) = 2, animelemtime(13) >= 0, animelemtime(7) >= 0))
value = 1205

[State 1200, Hit Normal]
type = hitdef
trigger1 = var(1) = 1
trigger1 = (var(15) < 1 || var(20))
trigger1 = anim = 1201 && (animelem = 2 || animelem = 8 || animelem = 14)
attr = A, SA
damage = ifelse(movecontact, 20, (70 + var(10) * 10)), ifelse(movecontact, 7, 11)
animtype = Hard
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = 12, 12
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 64), var(37) := -70
hitsound = -1 + 0 * (var(31) := 6)
guardsound = -1
ground.type = High
ground.slidetime = 18
ground.hittime = 18
ground.velocity = -4.5, -6.0
air.type = Low
air.velocity = -4.5, -6.0
air.cornerpush.veloff = 0
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
yaccel = 0.4850
airguard.ctrltime = 16
airguard.velocity = -6.00, -1.00
forcestand = 1
airguard.cornerpush.veloff = 0

[State 1200, Hit Normal Behind]
type = hitdef
trigger1 = var(1) = 1
trigger1 = (var(15) < 1 || var(20))
trigger1 = anim = 1201 && (animelem = 5 || animelem = 11 || animelem = 17)
attr = A, SA
damage = ifelse(movecontact, 20, (50 + var(10) * 10)), 7
animtype = Hard
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = 12, 12
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := -60) * (var(36) := -30), var(37) := -70
hitsound = -1 + 0 * (var(31) := 6)
guardsound = -1
ground.type = High
ground.slidetime = 18
ground.hittime = 18
ground.velocity = 4.5, -6.0
air.type = Low
air.velocity = 4.5, -6.0
air.cornerpush.veloff = 0
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
yaccel = 0.4850
p2facing = -1
airguard.ctrltime = 16
airguard.velocity = -6.00, -1.00
forcestand = 1
airguard.cornerpush.veloff = 0

[State 1200, Hit Evil]
type = hitdef
trigger1 = var(1) != 1
trigger1 = anim = 1201
trigger1 = animelem = 2 || animelem = 8 || animelem = 14 || animelem = 20
trigger1 = var(15) < ifelse(var(10) = 3, 3, ifelse(var(10) = 2, 2, 1)) || var(20)
attr = A, SA
damage = ifelse(movecontact, 25, 50), 7
animtype = Hard
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = 12, 12
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 64), var(37) := -70
hitsound = -1 + 0 * (var(31) := 6)
guardsound = -1
ground.type = High
ground.slidetime = 18
ground.hittime = 18
ground.velocity = -2.0, -7.25
air.type = Low
air.velocity = -3.0, -6.50
air.cornerpush.veloff = 0
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
yaccel = 0.4850
airguard.ctrltime = 16
airguard.velocity = -6.00, -1.00
forcestand = 1
airguard.cornerpush.veloff = 0

[State 1200, Hit Evil Behind]
type = hitdef
trigger1 = var(1) != 1
trigger1 = anim = 1201
trigger1 = animelem = 5 || animelem = 11 || animelem = 17 || animelem = 23
trigger1 = var(15) < ifelse(var(10) = 3, 3, ifelse(var(10) = 2, 2, 1)) || var(20)
attr = A, SA
damage = ifelse(movecontact, 20, 40), 7
animtype = Hard
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = 12, 12
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := -60) * (var(36) := -30), var(37) := -70
hitsound = -1 + 0 * (var(31) := 6)
guardsound = -1
ground.type = High
ground.slidetime = 18
ground.hittime = 18
ground.velocity = 3.0, -6.50
air.type = Low
air.velocity = 3.0, -6.50
air.cornerpush.veloff = 0
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
yaccel = 0.4850
p2facing = -1
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


;======================<EX TATSUMAKI>=============================
[Statedef 1210]
type = A
physics = N
movetype = A
anim = 1200
ctrl = 0
velset = 0, 0
poweradd = -500
facep2 = 1
sprpriority = 1

[State 1210, Strength]
type = varset
trigger1 = var(10) != 4
var(10) = 4
ignorehitpause = 1

[State 1210, Custom Combo End]
type = palfx
trigger1 = !time
trigger1 = var(20) > 0
trigger1 = (var(20) := 0) || (var(15) := 0) || 1
time = 1

[State 1210, ExFX]
type = explod
trigger1 = !time
anim = 7210
sprpriority = 3
postype = p1
pos = ceil(0 * const(size.xscale)), ceil(-90 * const(size.yscale))
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1210, Width]
type = width
trigger1 = anim = 1210 && movehit
edge = 50, 35
[State 1210, Push]
type = playerpush
trigger1 = anim = 1207 || anim = 1210
value = 0
ignorehitpause = 1

[State 1210, Snd]
type = playsnd
trigger1 = anim = 1200 && animelem = 1
value = ifelse(var(1) = 2, 14, 4), ifelse(var(1) = 2, 12, 7)
channel = 0

[State 1210, Snd]
type = playsnd
trigger1 = anim = 1200 && animelem = 1
value = 0, 41

[State 1210, Dust]
type = helper
trigger1 = anim = 1200 && animelem = 1
helpertype = normal
stateno = 7104
ID = 7100
name = "Dust"
postype = p1
pos = -10, 0
ownpal = 1

[State 1210, Dust]
type = helper
trigger1 = anim = 1200 && animelem = 1
helpertype = normal
stateno = 7104
ID = 7100
name = "Dust"
postype = p1
pos = 20, 0
facing = -1
ownpal = 1

[State 1210, Anim]
type = changeanim
trigger1 = anim = 1200 && !animtime
value = 1210

[State 1210, Accel]
type = velset
trigger1 = anim = 1210
x = 0
y = 0.5

[State 1210, Vel]
type = velset
trigger1 = anim = 1200 && animelem = 1
x = 1.5
y = -4.66

[State 1210, Vel]
type = velset
trigger1 = anim = 1207
x = -1.5

[State 1210, Snd]
type = playsnd
triggerall = anim = 1210
trigger1 = animelem = 1 || animelem = 7 || animelem = 13
value = 1, 6
channel = 1

[State 1210, Anim]
type = changeanim
trigger1 = anim = 1210 && !animtime
value = 1207
persistent = 0

[State 1210, Type]
type = statetypeset
trigger1 = anim = 1200 && animelemtime(1) > 1
trigger2 = anim = 1207 && animelemtime(1) > 1
statetype = A
physics = N

[State 1210, Type]
type = veladd
trigger1 = anim = 1200 && animelemtime(1) > 1
trigger2 = anim = 1207 && animelemtime(1) > 1
y = 0.5

[State 1210, Type]
type = statetypeset
trigger1 = anim = 1210
statetype = A
physics = N

[State 1210, Hit]
type = hitdef
trigger1 = anim = 1210 && (animelem = 2 || animelem = 8)
trigger1 = var(15) < 5
attr = A, SA
damage = 29, 7
animtype = Hard
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = 5, 0
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 60), var(37) := -70
hitsound = -1 + 0 * (var(31) := 6)
guardsound = -1
ground.type = High
ground.slidetime = 18
ground.hittime = 18
p2facing = 1
ground.velocity = ifelse((p2dist x != [-64, 64]), 14, 10), ifelse(p2dist y < (-60 - enemy, const(size.mid.pos.y)), 0, -4.0)
air.type = Low
air.velocity = ifelse((p2dist x != [-64, 64]), 14, 10), ifelse(p2dist y < (-60 - enemy, const(size.mid.pos.y)), 0, -4.0) + vel y
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
guard.velocity = -4.49
guard.slidetime = 12
guard.cornerpush.veloff = 0
getpower = 0
givepower = 40, 40
envshake.time = 10
envshake.ampl = ifelse((gametime % 2), -1, 1)
envshake.freq = 180
fall = 1
fall.recover = 0
sprpriority = -1
yaccel = 0.4850
airguard.ctrltime = 16
airguard.cornerpush.veloff = 0
airguard.velocity = -6.00, -1.00
forcestand = 1

[State 1210, Hit]
type = hitdef
trigger1 = anim = 1210 && (animelem = 5 || animelem = 11)
trigger1 = var(15) < 5
attr = A, SA
damage = 29, 7
animtype = Hard
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = 5, 0
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := -60) * (var(36) := -30), var(37) := -70
hitsound = -1 + 0 * (var(31) := 6)
guardsound = -1
ground.type = High
ground.slidetime = 18
ground.hittime = 18
p2facing = -1
ground.velocity = ifelse((p2dist x != [-64, 64]), -14, -10), ifelse(p2dist y < (-60 - enemy, const(size.mid.pos.y)), 0, -4.0)
air.type = Low
air.velocity = ifelse((p2dist x != [-64, 64]), -14, -10), ifelse(p2dist y < (-60 - enemy, const(size.mid.pos.y)), 0, -4.0) + vel y
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
guard.velocity = -4.49
guard.slidetime = 12
guard.cornerpush.veloff = 0
getpower = 0
givepower = 40, 40
envshake.time = 10
envshake.ampl = ifelse((gametime % 2), -1, 1)
envshake.freq = 180
fall = 1
fall.recover = 0
sprpriority = 1
yaccel = 0.4850
airguard.ctrltime = 16
airguard.cornerpush.veloff = 0
airguard.velocity = -6.00, -1.00
forcestand = 1

[State 1210, Hit Final]
type = hitdef
trigger1 = anim = 1210
trigger1 = animelem = 14
trigger1 = var(15) < 5
attr = A, SA
damage = 29, 7
animtype = Diagup
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = 5, 0
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 60), var(37) := -70
hitsound = -1 + 0 * (var(31) := 6)
guardsound = -1
ground.type = High
ground.slidetime = 18
ground.hittime = 18
p2facing = 1
ground.velocity = -5, -8
air.type = Low
air.velocity = -5, -8
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
getpower = 0
givepower = 40, 40
envshake.time = 10
envshake.ampl = ifelse((gametime % 2), -1, 1)
envshake.freq = 180
fall = 1
fall.recover = 0
sprpriority = 1
yaccel = 0.4850
airguard.ctrltime = 16
airguard.cornerpush.veloff = 0
airguard.velocity = -6.00, -1.00
forcestand = 1

[State 1210, Juggle Reset]
type = varset
trigger1 = movehit = 1
trigger1 = anim = 1210 && animelemtime(15) >= 0
var(15) = 1
ignorehitpause = 1

[State Idle]
type = statetypeset
trigger1 = anim = 1207
movetype = I

[State Land]
type = changestate
trigger1 = statetype = A
trigger1 = vel y > 0 && (pos y > -vel y)
value = 1209


;======================<KUUCHUU TATSUMAKI SENPUU KYAKU>=============================
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
trigger1 = animelem = 1 && anim = 1250 && vel y <= 0
value = ifelse(var(1) = 2, 14, 4), 2
channel = 0

[State 1250, Snd]
type = playsnd
trigger1 = animelem = 1 && anim = 1250 && vel y > 0
value = ifelse(var(1) = 2, 13, 3), 2
channel = 0

[State 1250, Snd]
type = playsnd
trigger1 = anim = 1250 && !(animelemtime(4) % 9) && animelemtime(26) < 0
value = 1, 6
channel = 1

[State 1250, Hit]
type = hitdef
trigger1 = animelem = 5 || animelem = 11 || animelem = 17 || animelem = 23
trigger1 = (var(15) < 1 || var(20))
attr = A, SA
damage = ifelse(movecontact, 25, ifelse(var(1) != 1, 80, 100)), ifelse(movecontact, 7, ifelse(var(1) != 1, 10, 13))
animtype = Hard
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 12, 12
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 64), var(37) := -69
hitsound = -1 + 0 * (var(31) := 6)
guardsound = -1
ground.type = High
ground.slidetime = 18
ground.hittime = 18
ground.velocity = -3.0, -7.0
air.type = Low
air.velocity = -3.0, -7.0
air.cornerpush.veloff = 0
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
yaccel = 0.4850
airguard.ctrltime = 16
airguard.velocity = -6.00, -1.00
forcestand = 1
airguard.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0

[State 1250, Hit Behind]
type = hitdef
trigger1 = animelem = 8 || animelem = 14 || animelem = 20 || animelem = 26
trigger1 = (var(15) < 1 || var(20))
attr = A, SA
damage = ifelse(movecontact, 25, 100), ifelse(movecontact, 7, 10)
animtype = Hard
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 12, 12
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := -60) * (var(36) := -30), var(37) := -70
hitsound = -1 + 0 * (var(31) := 6)
guardsound = -1
ground.type = High
ground.slidetime = 18
ground.hittime = 18
ground.velocity = 3.0, -7.0
air.type = Low
air.velocity = 3.0, -7.0
air.cornerpush.veloff = 0
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
yaccel = 0.4850
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
value = 1209


;======================<EX KUUCHUU SHINKUU TATSUMAKI>=============================
[Statedef 1260]
type = A
physics = N
movetype = A
anim = 1260
ctrl = 0
poweradd = -500
sprpriority = 1

[State 1260, Strength]
type = varset
trigger1 = var(10) != 4
var(10) = 4
ignorehitpause = 1

[State 1260, Custom Combo End]
type = palfx
trigger1 = !time
trigger1 = var(20) > 0
trigger1 = (var(20) := 0) || (var(15) := 0) || 1
time = 1

[State 1260, ExFX]
type = explod
trigger1 = !time
anim = 7210
sprpriority = 3
postype = p1
pos = ceil(0 * const(size.xscale)), ceil(-60 * const(size.yscale))
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1260, Width]
type = width
trigger1 = movehit
edge = 50, 35
[State 1260, Push]
type = playerpush
trigger1 = animelemtime(28) < 0
value = 0
ignorehitpause = 1

[State 1260, slow]
type = veladd
trigger1 = 1
y = 0.5

[State 1260, slow]
type = velmul
trigger1 = animelemtime(4) >= 0 && animelemtime(22) < 0 && vel y > 0
x = 0.95
y = 0.66

[State 1260, slow]
type = velset
trigger1 = animelemtime(12) < 0 && pos y >= -10
x = 0
y = 0

[State 1260, Snd]
type = playsnd
trigger1 = animelem = 1
value = ifelse(var(1) = 2, 14, 4), ifelse(var(1) = 2, 12, 7)
channel = 0

[State 1260, Snd]
type = playsnd
trigger1 = animelem = 4 || animelem = 10 || animelem = 16 || animelem = 22
value = 1, 6
channel = 1

[State 1260, Dust]
type = explod
trigger1 = animelemtime(4) >= 0 && animelemtime(22) < 0 && !(time % 6)
anim = 3206
ID = 3206
sprpriority = -2
postype = p1
pos = 0, -ceil(pos y)
scale = ifelse(pos y < -120, 0.5, ifelse(pos y < -60, 0.75, 1)), ifelse(pos y < -120, 0.5, ifelse(pos y < -60, 0.75, 1))
removetime = -2
ownpal = 1

[State 1260, Hit]
type = hitdef
trigger1 = animelem = 5 || animelem = 11
trigger1 = var(15) < 5
attr = A, SA
damage = 29, 7
animtype = Hard
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 5, 0
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 64), var(37) := -70
hitsound = -1 + 0 * (var(31) := 6)
guardsound = -1
ground.type = High
ground.slidetime = 18
ground.hittime = 18
p2facing = 1
ground.velocity = ifelse((p2dist x != [-64, 64]), 14, 10), ifelse(p2dist y < (-60 - enemy, const(size.mid.pos.y)), 0, -4.0)
air.type = Low
air.velocity = ifelse((p2dist x != [-64, 64]), 14, 10), ifelse(p2dist y < (-60 - enemy, const(size.mid.pos.y)), 0, -4.0) + vel y
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
getpower = 0
givepower = 40, 40
envshake.time = 10
envshake.ampl = ifelse((gametime % 2), -1, 1)
envshake.freq = 180
fall = 1
fall.recover = 1
fall.recovertime = 120
sprpriority = -1
yaccel = 0.4850
airguard.ctrltime = 16
airguard.cornerpush.veloff = 0
airguard.velocity = -6.00, -1.00
forcestand = 1

[State 1260, Hit Behind]
type = hitdef
trigger1 = animelem = 8 || animelem = 14
trigger1 = var(15) < 5
attr = A, SA
damage = 29, 7
animtype = Hard
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 5, 0
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := -60) * (var(36) := -30), var(37) := -70
hitsound = -1 + 0 * (var(31) := 6)
guardsound = -1
ground.type = High
ground.slidetime = 18
ground.hittime = 18
p2facing = -1
ground.velocity = ifelse((p2dist x != [-64, 64]), -14, -10), ifelse(p2dist y < (-60 - enemy, const(size.mid.pos.y)), 0, -4.0)
air.type = Low
air.velocity = ifelse((p2dist x != [-64, 64]), -14, -10), ifelse(p2dist y < (-60 - enemy, const(size.mid.pos.y)), 0, -4.0) + vel y
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
getpower = 0
givepower = 40, 40
envshake.time = 10
envshake.ampl = ifelse((gametime % 2), -1, 1)
envshake.freq = 180
fall = 1
fall.recover = 1
fall.recovertime = 120
sprpriority = 1
yaccel = 0.4850
airguard.ctrltime = 16
airguard.cornerpush.veloff = 0
airguard.velocity = -6.00, -1.00
forcestand = 1

[State 1260, Hit Final]
type = hitdef
trigger1 = animelem = 17
trigger1 = var(15) < 5
attr = A, SA
damage = 29, 7
animtype = Diagup
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 5, 0
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 64), var(37) := -70
hitsound = -1 + 0 * (var(31) := 6)
guardsound = -1
ground.type = High
ground.slidetime = 18
ground.hittime = 18
p2facing = 1
ground.velocity = -5, -6
air.type = Low
air.velocity = -5, -6
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
getpower = 0
givepower = 40, 40
envshake.time = 10
envshake.ampl = ifelse((gametime % 2), -1, 1)
envshake.freq = 180
fall = 1
fall.recover = 1
fall.recovertime = 120
sprpriority = 1
yaccel = 0.4850
airguard.ctrltime = 16
airguard.cornerpush.veloff = 0
airguard.velocity = -6.00, -1.00
forcestand = 1

[State Idle]
type = statetypeset
trigger1 = animelemtime(18) >= 0
movetype = I

[State Land]
type = changestate
trigger1 = statetype = A
trigger1 = vel y > 0 && (pos y > -vel y)
value = 1209


;======================<CLASSIC AERIAL TATSUMAKI>=============================
[Statedef 1270]
type = A
physics = N
movetype = A
anim = 1270
ctrl = 0
poweradd = 100 * !var(20)
sprpriority = 1

[State 1270, Strength]
type = varset
trigger1 = var(10) != [1, 3]
var(10) = 2
ignorehitpause = 1

[State 1270, Strength AI]
type = varset
trigger1 = time <= 0 && AIlevel
var(10) = 3
ignorehitpause = 1

[State 1270, Vel]
type = velset
trigger1 = !time
x = ifelse(vel x < 0, -3.5, 3.5)
y = 0
[State 1270, Accel]
type = veladd
trigger1 = var(10) = 1 && time >= 13
trigger2 = var(10) = 2 && time >= 23
trigger3 = time >= ifelse((backedgebodydist <= 0 || frontedgebodydist <= 0), 13, 33)
y = 0.4
[State 1270, Vel]
type = velmul
trigger1 = vel y > 0
x = 0.975

[State 1270, Snd]
type = playsnd
trigger1 = !time
value = ifelse(var(1) = 2, 14, 4), 2
channel = 0

[State 1270, Snd]
type = playsnd
trigger1 = animelem = 5
value = 1, 6
channel = 1

[State 1270, Hit]
type = hitdef
trigger1 = animelem = 5
trigger1 = (var(15) < 1 || var(20))
attr = A, SA
damage = 70, 7
animtype = Hard
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 12, 12
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 64), var(37) := -69
hitsound = -1 + 0 * (var(31) := 6)
guardsound = -1
ground.type = High
ground.slidetime = 18
ground.hittime = 18
ground.velocity = -3, -6
air.type = Low
air.velocity = -3, -6
air.cornerpush.veloff = 0
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
yaccel = 0.4850
airguard.ctrltime = 16
airguard.velocity = -6.00, -1.00
forcestand = 1
airguard.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0

[State 1270, Hit Behind]
type = hitdef
trigger1 = animelem = 8
trigger1 = (var(15) < 1 || var(20))
attr = A, SA
damage = 70, 7
animtype = Hard
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 12, 12
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := -60) * (var(36) := -30), var(37) := -70
hitsound = -1 + 0 * (var(31) := 6)
guardsound = -1
ground.type = High
ground.slidetime = 18
ground.hittime = 18
ground.velocity = 3, -6
air.type = Low
air.velocity = 3, -6
air.cornerpush.veloff = 0
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
yaccel = 0.4850
airguard.ctrltime = 16
airguard.velocity = -6.00, -1.00
forcestand = 1
airguard.cornerpush.veloff = 0

[State 1270, End]
type = changestate
trigger1 = vel y > 0 && (pos y > -vel y)
value = 1209


;======================<JOUDAN SOKUTOU GERI>=============================
[Statedef 1300]
type = S
physics = S
movetype = A
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
var(10) = ifelse((p2movetype = H || random < 333), 1, ifelse(random < 500, 2, 3))
ignorehitpause = 1

[State 1300, Anim]
type = changeanim
trigger1 = !time
value = ifelse(var(10) = 3, 1302, ifelse(var(10) = 2, 1301, 1300))

[State 1300, Vel]
type = velset
trigger1 = (anim = [1301, 1302]) && animelemtime(4) < 0
trigger2 = anim = 1300 && animelemtime(2) < 0
x = 4

[State 1300, Snd]
type = playsnd
triggerall = var(1) != 2
trigger1 = (anim = [1301, 1302]) && animelem = 6
trigger2 = anim = 1300 && animelem = 4
value = 3, ifelse(var(10) = 3, 2, ifelse(var(10) = 2, 7, 6))
channel = 0
[State 1300, Snd]
type = playsnd
triggerall = var(1) = 2
trigger1 = (anim = [1301, 1302]) && animelem = 6
trigger2 = anim = 1300 && animelem = 4
value = 13, ifelse(var(10) = 3, 2, ifelse(var(10) = 2, 1, 3))
channel = 0

[State 1300, Snd]
type = playsnd
trigger1 = (anim = [1301, 1302]) && animelem = 6
trigger2 = anim = 1300 && animelem = 4
value = 1, 6
channel = 1

[State 1300, Snd]
type = playsnd
trigger1 = !time
value = 0, 100

[State 1300, Hit]
type = hitdef
trigger1 = anim = 1300 && animelem = 4
trigger1 = (var(15) < 1 || var(20))
trigger2 = anim = 1301 && animelem = 6
trigger2 = (var(15) < 1 || var(20))
trigger3 = anim = 1302 && animelem = 6
trigger3 = (var(15) < 2 || var(20))
attr = S, SA
damage = (80 + var(10) * 10), 12
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 12, 12
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 68), var(37) := -78
hitsound = -1 + 0 * (var(31) := 6)
guardsound = -1
ground.type = Low
ground.slidetime = 18
ground.hittime = 18
ground.velocity = ifelse(var(10) = 3, -6.0, ifelse(var(10) = 2, -5.0, -4.0)), -6.0
air.type = Low
air.velocity = ifelse(var(10) = 3, -6.0, ifelse(var(10) = 2, -5.0, -4.0)), -6.0
air.cornerpush.veloff = 0
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
yaccel = 0.4850
forcestand = 1

[State 1300, Hit Counter]
type = hitdef
triggerall = var(1) != 1
triggerall = var(9) && var(10) = 3
trigger1 = (anim = [1301, 1302]) && animelem = 6
trigger1 = (var(15) < 1 || var(20))
trigger2 = anim = 1300 && animelem = 4
trigger2 = (var(15) < 1 || var(20))
attr = S, SA
damage = (80 + var(10) * 10), 12
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 12, 12
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 68), var(37) := -78
hitsound = -1 + 0 * (var(31) := 6)
guardsound = -1
ground.type = Low
ground.slidetime = 18
ground.hittime = 18
ground.velocity = -12, -6
air.type = Low
air.velocity = -12, -6
air.cornerpush.veloff = 0
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
yaccel = 0.4850
forcestand = 1
ID = 1300

[State 1300, Master Ryu counter bounce]
type = targetstate
trigger1 = movehit && numtarget(1300)
trigger1 = (target(1300), stateno = 5000) || (target(1300), stateno = 5010) || (target(1300), stateno = 5020)
value = 1111300
ID = 1300
ignorehitpause = 1

[State 1300, Pos]
type = posadd
trigger1 = (anim = 1300 && animelem = 8) || ((anim = [1301, 1302]) && animelem = 10)
x = 15
[State 1300, Pos]
type = posadd
trigger1 = (anim = 1300 && animelem = 9) || ((anim = [1301, 1302]) && animelem = 11)
x = 10
[State 1300, Pos]
type = posadd
trigger1 = !animtime
x = 5

[State Idle]
type = statetypeset
trigger1 = anim = 1300 && animelemtime(5) >= 0
trigger2 = anim = 1301 && animelemtime(7) >= 0
trigger3 = anim = 1302 && animelemtime(7) >= 0
movetype = I

[State 1300, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<EX JOUDAN SOKUTOU GERI>=============================
[Statedef 1310]
type = S
physics = S
movetype = A
anim = 1301
ctrl = 0
velset = 0, 0
poweradd = -500
facep2 = 1
sprpriority = 1

[State 1310, Strength]
type = varset
trigger1 = var(10) != 4
var(10) = 4
ignorehitpause = 1

[State 1310, Custom Combo End]
type = palfx
trigger1 = !time
trigger1 = var(20) > 0
trigger1 = (var(20) := 0) || (var(15) := 0) || 1
time = 1

[State 1310, ExFX]
type = explod
trigger1 = !time
anim = 7210
sprpriority = 3
postype = p1
pos = ceil(0 * const(size.xscale)), ceil(-16 * const(size.yscale))
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1310, Vel]
type = velset
trigger1 = (anim = [1301, 1302]) && animelemtime(4) < 0
trigger2 = anim = 1300 && animelemtime(2) < 0
x = 6.5

[State 1310, Snd]
type = playsnd
trigger1 = animelem = 6
value = 3, 4
channel = 0
[State 1310, Snd]
type = playsnd
trigger1 = animelem = 6
value = 1, 6
channel = 1

[State 1310, Snd]
type = playsnd
trigger1 = !time
value = 0, 100

[State 1310, Limit]
type = varset
trigger1 = !time
trigger1 = 1 || var(0) := 0
trigger1 = numtarget(1310)
trigger1 = target(1310), anim != 5300
var(0) = 1

[State 1310, Hit]
type = hitdef
trigger1 = animelem = 6
trigger1 = var(15) < 1
ID = 1310
attr = S, SA
damage = 80, 10
animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 12, 12
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 68), var(37) := -78
hitsound = -1 + 0 * (var(31) := 6)
guardsound = -1
ground.type = High
ground.slidetime = 18
ground.hittime = 18
ground.velocity = -12, -4.25
air.type = Low
air.velocity = -12, -4.25
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
getpower = 0
givepower = 40, 40
envshake.time = 12
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.freq = 180
p2facing = 1
fall.recover = 1
fall.recovertime = 120
forcestand = 1
yaccel = 0.4850
fall = 1

[State 1310, Wall Bounce]
type = targetstate
trigger1 = !var(0)
trigger1 = movehit && numtarget(1310)
trigger1 = (target(1310), stateno = 5000) || (target(1310), stateno = 5010) || (target(1310), stateno = 5020)
value = 1111300
ID = 1310
ignorehitpause = 1

[State 1310, Juggle Reset]
type = varset
trigger1 = movehit = 1
trigger1 = numtarget(1310)
trigger1 = target(1310), stateno = 1111300
var(15) = 0
ignorehitpause = 1

[State 1310, Corner Fix]
type = width
trigger1 = movehit && numtarget(1310)
trigger1 = target(1310), stateno = [1111302, 1111303]
trigger1 = animelemtime(10) >= 0
edge = 40, 0

[State 1310, Pos]
type = posadd
trigger1 = animelem = 10 || animelem = 11
x = ifelse((animelem = 10), 15, 10)
[State 1310, Pos]
type = posadd
trigger1 = !animtime
x = 5
[State 1310, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1

[State Idle]
type = statetypeset
trigger1 = animelemtime(7) >= 0
movetype = I



;========================<KICKED by EX JOUDAN S.G.>=============================
;--- Hit Pause ---
[Statedef 1111300]
type = A
movetype = H
physics = N
velset = 0, 0

[State 1111300, Anim]
type = changeanim
trigger1 = 1
value = 5002

[State 1111300, End]
type = changestate
trigger1 = hitshakeover
value = 1111301


;--- Falling ---
[Statedef 1111301]
type = A
movetype = H
physics = N

[State 1111301, Accel]
type = veladd
trigger1 = 1
y = gethitvar(yaccel) * 0.67

[State 1111301, Vel]
type = hitvelset
trigger1 = !time
x = 1
y = 1

[State 1111301, Screen]
type = screenbound
trigger1 = 1
value = 1
movecamera = (vel y < 0), 0

[State 1111301, Screen]
type = screenbound
triggerall = numenemy
trigger1 = pos x > -40 && enemy, pos x > -40
trigger2 = pos x < 40 && enemy, pos x < 40
value = 1
movecamera = 1, 0

[State 1111301, Push]
type = playerpush
trigger1 = 1
value = 0

[State 1111301, Anim]
type = changeanim
trigger1 = !time
value = 5030

[State 1111301, Bounce]
type = changestate
trigger1 = time >= 4
trigger1 = backedgebodydist <= 0 || frontedgebodydist <= 0
value = 1111302

[State 1111301, End]
type = selfstate
trigger1 = vel y > 0 && (pos y > -vel y)
value = 5100


;--- Hitting Wall ---
[Statedef 1111302]
type = A
movetype = H
physics = N

[State 1111302, turn]
type = turn
trigger1 = !time
trigger1 = frontedgedist < backedgedist

[State 1111302, Pos]
type = posadd
trigger1 = 1
x = -backedgebodydist

[State 1111302, Pos]
type = posfreeze
trigger1 = 1
x = 1
y = 1

[State 1111302, screen]
type = screenbound
trigger1 = 1
value = 1
movecamera = 0, 0

[State 1111302, Push]
type = playerpush
trigger1 = 1
value = 0

[State 1111302, Anim]
type = changeanim
trigger1 = 1
value = 5000

[State 1111302, Snd]
type = playsnd
trigger1 = !time
value = f7, 2

[State 1111302, FX]
type = explod
trigger1 = !time
anim = f72
postype = p1
pos = ceil(abs(pos x) - (gamewidth / 2)), const(size.mid.pos.y)
sprpriority = -5
ownpal = 1

[State 1111302, End]
type = changestate
trigger1 = time >= 4
value = 1111303


;--- Falling ---
[Statedef 1111303]
type = A
movetype = H
physics = N

[State 1111303, turn]
type = turn
trigger1 = !time

[State 1111303, Accel]
type = veladd
trigger1 = 1
y = 0.4850;yaccel

[State 1111303, Vel]
type = velset
trigger1 = !time
x = ((enemynear, pos x - pos x) * facing + 60) / 36.0
y = (pos y + 0.5 * 0.4850 * 36 ** 2) / -36.0

[State 1111303, Vel]
type = velset
trigger1 = !time
trigger1 = vel x != [-9, 0]
x = ifelse(vel x < -9, -9, 0)

[State 1111303, Anim]
type = changeanim
trigger1 = !time
value = ifelse(selfanimexist(5051), 5051, 5030)
[State 1111303, Anim]
type = changeanim
trigger1 = anim = 5030 && !animtime
value = 5050
[State 1111303, Anim]
type = changeanim
trigger1 = vel y > -3 && anim = 5051
value = 5061

[State 1111303, screen]
type = screenbound
trigger1 = 1
value = 1
movecamera = 0, 0

[State 1111303, Recover]
type = selfstate
trigger1 = alive
trigger1 = command = "recovery"
trigger1 = vel y > 0 && pos y >= const(movement.air.gethit.groundrecover.ground.threshold)
value = 5200

[State 1111303, End]
type = selfstate
trigger1 = vel y > 0 && (pos y > -vel y)
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
trigger1 = helper(9999), command = "623ppp" || helper(9999), command = "623kkk"
trigger1 = var(10) := ifelse((helper(9999), command = "a" && helper(9999), command = "b" && helper(9999), command = "c"), 2, 3)
trigger2 = helper(9999), command = "421ppp" || helper(9999), command = "421kkk"
trigger2 = var(10) := ifelse((helper(9999), command = "a" && helper(9999), command = "b" && helper(9999), command = "c"), -2, -3)
trigger3 = helper(9999), command = "623ppp+" || helper(9999), command = "623kkk+"
trigger3 = var(10) := ifelse((helper(9999), command = "a+" && helper(9999), command = "b+" && helper(9999), command = "c+"), 2, 3)
trigger4 = helper(9999), command = "421ppp+" || helper(9999), command = "421kkk+"
trigger4 = var(10) := ifelse((helper(9999), command = "a+" && helper(9999), command = "b+" && helper(9999), command = "c+"), -2, -3)
var(10) = var(10)
ignorehitpause = 1
persistent = 0

[State 1400, Strength]
type = varset
trigger1 = time <= 0 && AIlevel
var(10) = ifelse(random < 500, 3, 2)
ignorehitpause = 1

[State 1400, afterimage]
type = afterimage
trigger1 = animelem = 3
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

[State 1400, Vel]
type = velset
trigger1 = animelemtime(2) > 0 && animelemtime(6) < 0
x = ifelse(var(10) = 3, -7, ifelse(var(10) = 2, -4, ifelse(var(10) = -3, 7, 4))) * sin((time -2) / 2)
[State 1400, Vel]
type = velset
trigger1 = animelem = 6
x = ifelse(var(10) = 3, 12, ifelse(var(10) = 2, 7.5, ifelse(var(10) = -3, -12, -7.5)))
[State 1400, Vel]
type = velmul
trigger1 = animelemtime(6) > ifelse((var(10) = 3 || var(10) = -3), 16, 9)
x = 0.9

[State 1400, Snd]
type = playsnd
trigger1 = animelem = 2
value = ifelse(var(1) = 2, 13, 3), 4 * (var(1) != 2)
channel = 0
[State 1400, Snd]
type = playsnd
trigger1 = animelem = 6
value = 5, 4
persistent = 0

[State 1400, Push]
type = playerpush
trigger1 = animelemtime(3) >= 0
value = 0

[State 1400, NHB]
type = nothitby
triggerall = animelemtime(6) < ifelse((var(10) = 3 || var(10) = -3), 28, 16)
trigger1 = animelemtime(6) < 0
trigger2 = animelemtime(6) >= 0
trigger2 = backedgebodydist > (-2 * vel x)
value = SCA, AA, AP, AT
time = 1
ignorehitpause = 1

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


;======================<RYUSOKYAKU>=============================
[Statedef 1500]
type = S
physics = S
movetype = A
ctrl = 0
anim = 1500
velset = 0, 0
poweradd = 100 * !var(20)
sprpriority = 1
juggle = 7 * !var(20)
facep2 = 1

[State 1500, Strength]
type = varset
trigger1 = var(10) != [1, 3]
var(10) = 2
ignorehitpause = 1

[State 1500, Strength AI]
type = varset
trigger1 = time <= 0 && AIlevel
var(10) = ifelse((p2movetype = H || random < 333), 1, ifelse(random < 500, 2, 3))
ignorehitpause = 1

[State 1500, Anim]
type = changeanim
trigger1 = !time
value = ifelse(var(10) = 3, 1502, ifelse(var(10) = 2, 1501, 1500))

[State 1500, Pos]
type = posadd
trigger1 = animelem = 4
x = 24
[State 1500, Pos]
type = posadd
trigger1 = animelem = 5
x = 3
[State 1500, Pos]
type = posadd
trigger1 = animelem = 6
x = 6
[State 1500, Pos]
type = posadd
trigger1 = animelem = 7
x = -1
[State 1500, Pos]
type = posadd
trigger1 = animelem = 8
x = 7
[State 1500, Pos]
type = posadd
trigger1 = animelem = 9
x = 2
[State 1500, Pos]
type = posadd
trigger1 = animelem = 10
x = 22
[State 1500, Pos]
type = posadd
trigger1 = animelem = 14
x = ifelse(var(10) = 3, 18, ifelse(var(10) = 2, 16, 14))
[State 1500, Pos]
type = posadd
trigger1 = !animtime
x = 6

[State 1500, Snd]
type = playsnd
trigger1 = var(1) != 2
trigger1 = animelem = 9
value = 3, ifelse(var(10) = 3, 2, ifelse(var(10) = 2, 7, 6))
channel = 0

[State 1500, Snd]
type = playsnd
trigger1 = var(1) = 2
trigger1 = animelem = 2
value = 13, 3
channel = 0

[State 1500, Snd]
type = playsnd
trigger1 = var(1) = 2
trigger1 = animelem = 7
value = 13, 4
channel = 0

[State 1500, Snd]
type = playsnd
trigger1 = animelem = 1
value = 0, 100

[State 1500, Dust]
type = explod
trigger1 = animelem = 3
anim = 7100
ID = 7100
sprpriority = 3
postype = p1
pos = -26, 0
scale = 0.5, 0.5
ownpal = 1

[State 1500, Hit]
type = hitdef
trigger1 = animelem = 10
trigger1 = var(15) < 99 || var(20)
attr = S, SA
hitflag = MAFD
guardflag = M
priority = 4, Hit
damage = 60 + var(10) * 10, 10
getpower = ifelse(movehit, 25, 100) * !var(20), ifelse(moveguarded, 25, 50) * !var(20)
givepower = 40, 40
pausetime = 12, 12
guard.pausetime = 12, 12
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 15
guard.hittime = 18
air.hittime = 120
ground.velocity = -7.51, 0
ground.cornerpush.veloff = 0
guard.velocity = -7.51
guard.cornerpush.veloff = 0
air.velocity = -4.31, 16
air.cornerpush.veloff = 0
yaccel = 0.4850
fall = 0
air.fall = 1
fall.recover = 0
forcestand = 1
hitsound = -1 + 0 * (var(31) := 6)
guardsound = s2,0
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 20) * (var(36) := 50), var(37) := -26
envshake.time = 10
envshake.ampl = ifelse((gametime % 2), -1, 1)
envshake.freq = 180
down.velocity = 0, 0
fall.yvelocity = 0

[State 1500, OTG - Stay down]
type = targetstate
trigger1 = movehit = 1
trigger1 = numtarget = 1
trigger1 = target, stateno = 5020 || target, stateno = 5070
trigger1 = target, prevstateno = [5100, 5101]
trigger1 = target, alive && target, hitfall
value = 1115080
ignorehitpause = 1

[State 1500, Anim]
type = changeanim
triggerall = time > 0
trigger1 = movecontact = 1 && hitpausetime
trigger1 = animelemtime(10) >= 0 && animelemtime(11) <= 0
trigger1 = hitpausetime <= ifelse(var(20), 3, 9)
value = anim
elem = 11
ignorehitpause = 1

[State 1500, Shake]
type = envshake
trigger1 = !(gametime % 2)
trigger1 = animelemtime(10) >= 0 && animelemtime(10) <= 20
time = 2
freq = 180
ampl = 3 - ceil(animelemtime(10) * 0.10)
ignorehitpause = 1

[State 1500, Snd]
type = playsnd
trigger1 = animelem = 10
value = 5, 3

[State 1500, Dust]
type = helper
trigger1 = animelem = 10
helpertype = normal
stateno = 8111
ID = 8100
name = "Impact Dust"
postype = p1
pos = 38, 0
ownpal = 1

[State Idle]
type = statetypeset
trigger1 = anim = 1500 && animelemtime(11) >= 0
movetype = I

[State 1500, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- OTG override ---
[Statedef 1115080]
type = L
physics = N
movetype = H
velset = 0, 0

[State 1115080, Pos]
type = posset
trigger1 = 1
y = 0

[State 1115080, Anim]
type = changeanim
trigger1 = 1
value = 5080

[State 1115080, End]
type = changestate
trigger1 = hitshakeover
value = 1115081


[Statedef 1115081]
type = L
physics = C
movetype = H
velset = 0, 0

[State 1115081, Var]
type = varset
trigger1 = !time
sysvar(0) = 1

[State 1115081, End]
type = selfstate
trigger1 = time >= 18
value = 5110


;======================<EX RYUSOKYAKU>=============================
[Statedef 1520]
type = S
physics = S
movetype = A
ctrl = 0
anim = 1520
velset = 0, 0
poweradd = -500
sprpriority = 1
juggle = 7 * !var(20)
facep2 = 1

[State 1520, Strength]
type = varset
trigger1 = !time
var(10) = 4
ignorehitpause = 1

[State 1520, Custom Combo End]
type = palfx
trigger1 = !time
trigger1 = var(20) > 0
trigger1 = (var(20) := 0) || (var(15) := 0) || 1
time = 1

[State 1520, ExFX]
type = explod
trigger1 = !time
anim = 7210
sprpriority = 3
postype = p1
pos = ceil(-10 * const(size.xscale)), ceil(-62 * const(size.yscale))
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1520, Pos]
type = posadd
trigger1 = animelem = 4
x = 24
[State 1520, Pos]
type = posadd
trigger1 = animelem = 5
x = 3
[State 1520, Pos]
type = posadd
trigger1 = animelem = 6
x = 6
[State 1520, Pos]
type = posadd
trigger1 = animelem = 7
x = -1
[State 1520, Pos]
type = posadd
trigger1 = animelem = 8
x = 7
[State 1520, Pos]
type = posadd
trigger1 = animelem = 9
x = 2
[State 1520, Pos]
type = posadd
trigger1 = animelem = 10
x = 22
[State 1520, Pos]
type = posadd
trigger1 = animelem = 14
x = 16
[State 1520, Pos]
type = posadd
trigger1 = !animtime
x = 6

[State 1520, Snd]
type = playsnd
trigger1 = var(1) != 2
trigger1 = animelem = 9
value = 3, ifelse(var(10) = 3, 2, ifelse(var(10) = 2, 7, 6))
channel = 0

[State 1520, Snd]
type = playsnd
trigger1 = var(1) = 2
trigger1 = animelem = 2
value = 13, 3
channel = 0

[State 1520, Snd]
type = playsnd
trigger1 = var(1) = 2
trigger1 = animelem = 7
value = 13, 4
channel = 0

[State 1520, Snd]
type = playsnd
trigger1 = animelem = 1
value = 0, 100

[State 1520, Dust]
type = explod
trigger1 = animelem = 3
anim = 7100
ID = 7100
sprpriority = 3
postype = p1
pos = -26, 0
scale = 0.5, 0.5
ownpal = 1

[State 1520, Hit]
type = hitdef
trigger1 = animelem = 10
trigger1 = var(15) < 99
attr = S, SA
hitflag = MAFD
guardflag = M
priority = 4, Hit
damage = 80, 10
getpower = 0, 0
givepower = 40, 40
pausetime = 12, 12
guard.pausetime = 12, 12
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 15
guard.hittime = 18
air.hittime = 120
ground.velocity = -7.51, 0
ground.cornerpush.veloff = 0
guard.velocity = -7.51
guard.cornerpush.veloff = 0
air.velocity = -4.31, 16
air.cornerpush.veloff = 0
yaccel = 0.4850
fall = 0
fall.recover = 0
fall.recovertime = 120
forcestand = 1
hitsound = -1 + 0 * (var(31) := 6)
guardsound = s2,0
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 20) * (var(36) := 50), var(37) := -26
envshake.time = 10
envshake.ampl = ifelse((gametime % 2), -1, 1)
envshake.freq = 180
down.velocity = 0, 0
fall.yvelocity = 0

[State 1520, OTG - Stay down]
type = targetstate
trigger1 = movehit = 1
trigger1 = numtarget = 1
trigger1 = target, stateno = 5020 || target, stateno = 5070
trigger1 = target, prevstateno = [5100, 5101]
trigger1 = target, alive && target, hitfall
value = 1115080
ignorehitpause = 1

[State 1520, Anim]
type = changeanim
triggerall = time > 0
trigger1 = movecontact = 1 && hitpausetime
trigger1 = animelemtime(10) >= 0 && animelemtime(11) <= 0
trigger1 = hitpausetime <= ifelse(var(20), 3, 9)
value = anim
elem = 11
ignorehitpause = 1

[State 1520, Shake]
type = envshake
trigger1 = !(gametime % 2)
trigger1 = animelemtime(10) >= 0 && animelemtime(10) <= 20
time = 2
freq = 180
ampl = 3 - ceil(animelemtime(10) * 0.10)
ignorehitpause = 1

[State 1520, Snd]
type = playsnd
trigger1 = animelem = 10
value = 5, 3

[State 1520, Dust]
type = helper
trigger1 = animelem = 10
helpertype = normal
stateno = 8111
ID = 8100
name = "Impact Dust"
postype = p1
pos = 38, 0
ownpal = 1

[State Idle]
type = statetypeset
trigger1 = anim = 1520 && animelemtime(11) >= 0
movetype = I

[State 1520, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- Target Slammed Against Ground ---
[Statedef 1111520]
type = A
movetype = H
physics = N
velset = 0, 0

[State 1111520, Anim]
type = changeanim
trigger1 = 1
value = ifelse(selfanimexist(5420), 5420, 5012)

[State 1111520, Vel]
type = hitvelset
trigger1 = hitshakeover
x = 1
y = 1

[State 1111520, End]
type = changestate
trigger1 = hitshakeover && pos y >= 0
value = 1111521


[Statedef 1111521]
type = L
movetype = H
physics = N
velset = 0, 0

[State 1111521, Anim]
type = changeanim
trigger1 = !time
value = ifelse(selfanimexist(5102), 5102, 5100)

[State 1111521, Damage]
type = hitfalldamage
trigger1 = !time

[State 1111521, Shake]
type = envshake
trigger1 = !time
time = 14
ampl = -4
freq = 180

[State 1111521, Pos]
type = posset
trigger1 = 1
y = 0

[State 1111521, Snd]
type = playsnd
trigger1 = !time
value = f7, 2

[State 1111521, FX]
type = explod
trigger1 = !time
anim = F62
postype = p1
sprpriority = 10

[State 1111521, End]
type = changestate
trigger1 = !animtime
value = 1111522


[Statedef 1111522]
type = L
movetype = H
physics = N

[State 1111522, Anim]
type = changeanim
trigger1 = !time
value = ifelse(selfanimexist(5162), 5162, 5160)

[State 1111522, Pos]
type = posset
trigger1 = !time
y = 0
[State 1111522, Vel]
type = velset
trigger1 = !time
y = -2.4
[State 1111522, accel]
type = veladd
trigger1 = 1
y = 0.6

[State 1111522, End]
type = selfstate
trigger1 = vel y > 0
trigger1 = pos y >= 12
value = 5110

;======================<DENJIN RENKI>=============================
[Statedef 1900]
type = S
physics = S
movetype = I
anim = 1900
ctrl = 0
velset = 0, 0
poweradd = 50 * !var(20)
sprpriority = 2
facep2 = 1

[State 0, VarSet]
type = VarSet
trigger1 = animelem = 8
var(10) = 99

[State 1900, Snd]
type = playsnd
trigger1 = animelem = 2
value = 3, 4
channel = 0

[State 1900, PalFX]
type = palfx
trigger1 = animelem = 8
time = 8
add = 0, 128, 255
sinadd = 0, -128, -255, 32

[State 1900, Sound]
type = playsnd
trigger1 = animelem = 8
value = 5, 6

[State 199, Shake]
type = envshake
trigger1 = animelem = 8
time = 4
ampl = 2
freq = 180

[State 1900, Particles]
type = explod
trigger1 = animelem = 8
anim = 8155
ID = 8155
sprpriority = 3
postype = p1
pos = -6, -54
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
scale = 0.33, 0.45
bindtime = -1
ownpal = 1

[State 1900, Particles]
type = explod
trigger1 = animelem = 8
anim = 8155
ID = 8155
sprpriority = 3
postype = p1
pos = -32, -20
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
scale = 0.167, 0.33
bindtime = -1
ownpal = 1

[State 1900, Particles]
type = explod
trigger1 = animelem = 8
anim = 8155
ID = 8155
sprpriority = 3
postype = p1
pos = 22, -20
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
scale = 0.167, 0.33
bindtime = -1
ownpal = 1

[State 1900, Particles]
type = explod
trigger1 = animelemtime(8) = [0, 7]
anim = 3031
sprpriority = 3
postype = p1
pos = -5, -54
random = 10, 10
;random = 20, 20
vel = (2 + (random / 500.0)) * ifelse(random < 500, -1, 1), (2 + (random / 500.0)) * ifelse(random < 500, -1, 1)
scale = ifelse(random < 500, -0.5, 0.5), ifelse(random < 500, -0.5, 0.5)
angle = 90 * (random % 4)
ownpal = 1

[State 1900, Dust]
type = explod
trigger1 = animelem = 8
anim = 7105
sprpriority = -10
postype = p1
pos = -6, 0
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1900, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<CHARGED HADOUKEN>=============================
[Statedef 1040]
type = S
physics = S
movetype = A
anim = 1040
ctrl = 0
velset = 0, 0
poweradd = 50 * !var(20)
sprpriority = 2
facep2 = 1

[State 0, VarSet]
type = VarSet
trigger1 = time = 0
var(10) = 0

[State Damage Scaling - Add]
type = varadd
trigger1 = !time
trigger1 = var(43)
trigger1 = 1 || var(43) := 0
var(42) = 1

[State 1040, Strength]
type = varset
trigger1 = !AIlevel
trigger1 = time <= 0
var(10) = ifelse(command ="236p", 3, ifelse(command = "236p+", 2, 1))
ignorehitpause = 1
persistent = 0

[State 1040, Strength AI]
type = varset
trigger1 = AIlevel
trigger1 = time <= 0
var(10) = ifelse((p2movetype = H || random < 500), 3, ifelse(random < 500, 2, 1))
ignorehitpause = 1

[State 1040, Width]
type = width
trigger1 = animelemtime(5) = -1
value = 20, 0

[State 1040, Correct Projectile Trade]
type = hitby
trigger1 = animelem = 5
value2 = SCA, AA, AT
time = 1

[State 1040, Hadouken]
type = helper
trigger1 = animelem = 5
helpertype = normal
stateno = 1045
ID = 1045
name = "Hadouken"
postype = p1
pos = 80, -67
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 1040, Snd]
type = playsnd
trigger1 = animelem = 3
value = 4, 19
channel = 0

[State 1040, Snd]
type = playsnd
trigger1 = animelem = 5
value = 5, 0

[State 1040, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


