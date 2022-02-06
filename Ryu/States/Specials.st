; ______________________________
;| Ryu by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;============================================================================================
;=====================================< SPECIAL STATES >=======================================
;============================================================================================

;======================< HADOU KEN >=============================
[Statedef 1000]
type = S
physics = S
movetype = A
anim = 1000
ctrl = 0
velset = 0, 0
poweradd = 72 * !var(20)
sprpriority = 1
facep2 = 1

[State 1000, Strength]
type = varset
trigger1 = !time && !AIlevel
var(10) = ifelse(command = "qcfz", 3, ifelse(command = "qcfy", 2, 1))
[State 1000, Strength AI]
type = varset
trigger1 = !time && AIlevel
var(10) = ifelse((p2movetype = H || random < 500), 3, ifelse(random < 500, 2, 1))

[State 1000, width]
type = width
trigger1 = animelemtime(5) = 0
value = 30, 0

[State 1000, Hadouken]
type = helper
trigger1 = animelemtime(5) = 1
helpertype = normal
stateno = 1005
ID = 1005
name = "Hadouken"
postype = p1
pos = 80, -68
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 1000, Snd]
type = playsnd
trigger1 = animelem = 3
value = 4 + (var(1) = 2) * 10, 0
channel = 0
[State 1000, Snd]
type = playsnd
trigger1 = animelemtime(5) = 1
value = 5, 0

[State 1000, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================< SHAKUNETSU HADOU KEN >=============================
[Statedef 1020]
type = S
physics = S
movetype = A
anim = 1000
ctrl = 0
velset = 0, 0
poweradd = 72 * !var(20)
sprpriority = 1
facep2 = 1

[State 1020, Strength]
type = varset
trigger1 = !time && !AIlevel
var(10) = ifelse(command = "qcfz", 3, ifelse(command = "qcfy", 2, 1))
[State 1020, Strength AI]
type = varset
trigger1 = !time && AIlevel
var(10) = ifelse((p2movetype = H || random < 500), 3, ifelse(random < 500, 2, 1))

[State 1020, width]
type = width
trigger1 = animelemtime(5) = 0
value = 30, 0

[State 1020, Hadouken]
type = helper
trigger1 = animelemtime(5) = 1
helpertype = normal
stateno = 1025
ID = 1025
name = "Shakunetsu Hadouken"
postype = p1
pos = 80, -68
ownpal = 1

[State 1020, Snd]
type = playsnd
trigger1 = animelem = 3
value = 4 + (var(1) = 2) * 10, 0
channel = 0
[State 1020, Snd]
type = playsnd
trigger1 = animelemtime(5) = 1
value = 5, 0

[State 1020, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================< SHORYUU KEN >=============================
[Statedef 1100]
type = S
physics = S
movetype = A
anim = 1100
ctrl = 0
velset = 0, 0
poweradd = 72 * (!var(20) && prevstateno != 750)
juggle = ifelse(var(1) = 1, 8, ifelse((p2movetype = H && p2statetype = A), 7, 9))
sprpriority = 1
facep2 = 1

[State 1100, Strength]
type = varset
trigger1 = !time && !AIlevel
var(10) = ifelse((command = "dfz" || prevstateno = 750), 3, ifelse(command = "dfy", 2, 1))
[State 1100, Strength AI]
type = varset
trigger1 = !time && AIlevel
var(10) = ifelse((p2movetype = H || prevstateno = 750 || random < 333), 3, ifelse(random < 500, 2, 1))

[State 1100, nothitby]
type = nothitby
trigger1 = anim = 1100 && animelemtime(4) < 0 && prevstateno != 750
value = SCA
time = 1
ignorehitpause = 1
[State NHB -ZC]
type = nothitby
triggerall = prevstateno = 750
trigger1 = var(1) = 1 && animelemtime(3) < 0
trigger2 = var(1) != 1 && animelemtime(2) < 0
value = SCA
time = 1

[State 1100, Vel]
type = velset
trigger1 = anim = 1100 && animelem = 4
x = ifelse(var(10) = 3, 12, ifelse(var(10) = 2, 9, 6))
y = ifelse(var(10) = 3, -11, ifelse(var(10) = 2, -8.5, -6))
[State 1100, Vel]
type = velmul
trigger1 = 1
x = 0.88
[State 1100, Vel]
type = velmul
trigger1 = vel y > 0
x = 0

[State 1100, Snd]
type = playsnd
trigger1 = anim = 1100 && animelem = 4
value = 0, 41
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
value = 4 + (var(1) = 2) * 10, 1
channel = 0
ignorehitpause = 1
persistent = 0

[State 1100, Hit]
type = hitdef
trigger1 = animelem = 3 && anim = 1100 && var(1) <= 1
attr = S, SA
damage = ifelse(var(20), 60 + var(10) * 7, 111 + var(10) * 7), 15
animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
sparkno = s7020 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -79
hitsound = s2, 3
guardsound = s2, 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = ifelse(var(10) = 3, -4, ifelse(var(10) = 2, -3.5, -3)), ifelse(var(10) = 3, -12, ifelse(var(10) = 2, -10, -8))
ground.cornerpush.veloff = 0
air.type = Low
air.velocity = ifelse(var(10) = 3, -4, ifelse(var(10) = 2, -3.5, -3)), ifelse(var(10) = 3, -12, ifelse(var(10) = 2, -10, -8))
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = ifelse(p2movetype = H, 72, 144) * (!var(20) && prevstateno != 750), 36 * (!var(20) && prevstateno != 750)
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 4
fall = 1
fall.recover = 1
fall.recovertime = 120
fall.animtype = Medium
yaccel = 0.5
forcestand = 1

[State 1100, hit2]
type = hitdef
trigger1 = animelem = 4 && anim = 1100 && var(1) <= 1
trigger1 = !movecontact && !movereversed
attr = A, SA
damage = 28, 7
animtype = Back
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
sparkno = s7020 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -106
hitsound = s2, 3
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = ifelse(var(10) = 3, -4, ifelse(var(10) = 2, -3.5, -3)), ifelse(var(10) = 3, -12, ifelse(var(10) = 2, -10, -8))
ground.cornerpush.veloff = 0
air.type = Low
air.velocity = ifelse(var(10) = 3, -4, ifelse(var(10) = 2, -3.5, -3)), ifelse(var(10) = 3, -12, ifelse(var(10) = 2, -10, -8))
guard.cornerpush.veloff = 0
guard.velocity = -10.52
getpower = ifelse(p2movetype = H, 72, 144) * (!var(20) && prevstateno != 750), 36 * (!var(20) && prevstateno != 750)
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 4
fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
forcestand = 1
airguard.cornerpush.veloff = 0

[State 1100, Hit]
type = hitdef
trigger1 = animelem = 2 && anim = 1100 && var(1) != 1
trigger2 = animelem = 3 && anim = 1100 && var(1) != 1
attr = S, SA
damage = 45 + var(10) * 7, 7
animtype = Medium
fall.animtype = Medium
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
sparkno = s7020 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, ifelse((animelem = 2), -52, -79)
hitsound = s2, 3
guardsound = s2, 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -2, -8
ground.cornerpush.veloff = 0
air.type = Low
air.velocity = -2, -8
guard.cornerpush.veloff = 0
guard.velocity = -10.52
getpower = ifelse(p2movetype = H, 72, 144) * (!var(20) && prevstateno != 750), 36 * (!var(20) && prevstateno != 750)
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 4
fall = 1
fall.recover = 1
fall.recovertime = 120
fall.animtype = Medium
yaccel = 0.5
forcestand = 1

[State 1100, hithard2]
type = hitdef
trigger1 = animelem = 4 && anim = 1100 && var(1) != 1
attr = A, SA
damage = 28, 7
animtype = Up
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
sparkno = s7020 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -106
hitsound = s2, 3
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = ifelse(var(10) = 3, -5, ifelse(var(10) = 2, -4, -3)), ifelse(var(10) = 3, -12, ifelse(var(10) = 2, -10, -8))
ground.cornerpush.veloff = 0
air.type = Low
air.velocity = ifelse(var(10) = 3, -5, ifelse(var(10) = 2, -4, -3)), ifelse(var(10) = 3, -12, ifelse(var(10) = 2, -10, -8))
guard.cornerpush.veloff = 0
guard.velocity = -10.52
getpower = ifelse(p2movetype = H, 72, 144) * (!var(20) && prevstateno != 750), 36 * (!var(20) && prevstateno != 750)
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 4
fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
forcestand = 1
airguard.cornerpush.veloff = 0

[State 1100, statetype]
type = statetypeset
trigger1 = anim = 1100 && animelemtime(4) >= 0
trigger2 = anim = 1101
statetype = A
physics = A
[State 1100, Anim]
type = changeanim
trigger1 = anim = 1100 && animelemtime(4) > 0 && vel y > (ifelse(var(10) = 3, -5.3, ifelse(var(10) = 2, -4, -2.7)))
value = 1101
persistent = 0

[State Idle]
type = statetypeset
trigger1 = anim = 1101
movetype = I


;======================< TATSUMAKI SENPUU KYAKU >=============================
[Statedef 1200]
type = A
physics = N
movetype = A
anim = 1200
ctrl = 0
velset = 0, 0
poweradd = 72 * !var(20)
juggle = 8
sprpriority = 1
facep2 = 1

[State 1200, Strength]
type = varset
trigger1 = !time && !AIlevel
var(10) = ifelse((command = "qcbc"), 3, ifelse(command = "qcbb", 2, 1))
[State 1200, Strength AI]
type = varset
trigger1 = !time && AIlevel
var(10) = ifelse((p2movetype = H || random < 333), 1, ifelse(random < 500, 2, 3))

[State 1200, Snd]
type = playsnd
trigger1 = anim = 1200 && animelem = 1
value = 4 + (var(1) = 2) * 10, 2
channel = 0
[State 1200, Snd]
type = playsnd
trigger1 = anim = 1200 && animelem = 1
value = 0, 40
[State 1200, Dust]
type = helper
trigger1 = anim = 1200 && animelem = 1
helpertype = normal
stateno = 7100
ID = 7100
name = "Dust"
postype = p1
ownpal = 1

[State 1200, Anim]
type = changeanim
trigger1 = anim = 1200 && !animtime
value = 1201

[State 1200, statetype]
type = statetypeset
trigger1 = anim = 1200 || anim = 1205
statetype = A
physics = A
[State 1200, statetype]
type = statetypeset
trigger1 = anim = 1201
statetype = A
physics = N

[State 1200, Vel]
type = velset
trigger1 = anim = 1200 && animelem = 1
x = 3.5
y = -4

[State 1200, Vel]
type = velset
trigger1 = anim = 1201
x = 3.5
y = 0

[State 1200, spin]
type = playsnd
trigger1 = anim = 1201 && !(animelemtime(1) % 9)
value = 1, 6
channel = 1

[State 1200, Anim]
type = changeanim
trigger1 = var(1) = 1
trigger1 = anim = 1201 && ifelse(var(10) = 3, animelemtime(18) >= 0, ifelse(var(10) = 2, animelemtime(12) >= 0, animelemtime(6) >= 0))
value = 1205
persistent = 0
[State 1200, Anim]
type = changeanim
trigger1 = var(1) != 1
trigger1 = anim = 1201 && ifelse(var(10) = 3, !animtime, ifelse(var(10) = 2, animelemtime(12) >= 0, animelemtime(6) >= 0))
value = 1205
persistent = 0

[State 1200, Hit Again]
type = movehitreset
trigger1 = var(1) = 1
trigger1 = movehit = 1 && !numtarget

[State 1200, Hit]
type = hitdef
trigger1 = var(1) = 1 && (!movehit || var(20))
trigger1 = anim = 1201 && (animelem = 2 || animelem = 8 || animelem = 14)
attr = A, SA
damage = ifelse(movehit, 21, 98), 7
animtype = Hard
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 7, 14), ifelse(var(20), 7, 14)
sparkno = s7020 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -70
hitsound = s2, 6
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -4, -7.5
air.type = Low
air.velocity = -4, -7.5
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = ifelse(p2movetype = H, 72, 144) * !var(20), 36 * !var(20)
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 4
fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
forcestand = 1
airguard.cornerpush.veloff = 0

[State 1200, hitb]
type = hitdef
trigger1 = var(1) = 1 && (!movehit || var(20))
trigger1 = anim = 1201 && (animelem = 5 || animelem = 11 || animelem = 17)
attr = A, SA
damage = ifelse(movehit, 21, 98), 7
animtype = Hard
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 7, 14), ifelse(var(20), 7, 14)
sparkno = s7020 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -70
hitsound = s2, 6
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = 4, -7.5
air.type = Low
air.velocity = 4, -7.5
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = ifelse(p2movetype = H, 72, 144) * !var(20), 36 * !var(20)
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 4
fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.5
p2facing = -1
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
forcestand = 1
airguard.cornerpush.veloff = 0

[State 1200, Hit]
type = hitdef
trigger1 = var(1) != 1 && hitcount < 3
trigger1 = anim = 1201 && (animelem = 2 || animelem = 8 || animelem = 14 || animelem = 20)
attr = A, SA
damage = 35, 7
animtype = Hard
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 7, 14), ifelse(var(20), 7, 14)
sparkno = s7020 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -70
hitsound = s2, 6
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -2.5, -8
air.type = Low
air.velocity = -2.5, -6.5
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = ifelse(p2movetype = H, 72, 144) * !var(20), 36 * !var(20)
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 4
fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
forcestand = 1
airguard.cornerpush.veloff = 0

[State 1200, hitb]
type = hitdef
trigger1 = var(1) != 1 && hitcount < 3
trigger1 = anim = 1201 && (animelem = 5 || animelem = 11 || animelem = 17 || animelem = 23)
attr = A, SA
damage = 35, 7
animtype = Hard
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 7, 14), ifelse(var(20), 7, 14)
sparkno = s7020 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -70
hitsound = s2, 6
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = 2.5, -8
air.type = Low
air.velocity = 2.5, -6.5
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = ifelse(p2movetype = H, 72, 144) * !var(20), 36 * !var(20)
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 4
fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.5
p2facing = -1
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
forcestand = 1
airguard.cornerpush.veloff = 0

[State Idle]
type = statetypeset
trigger1 = anim = 1205
movetype = I


;======================< KUUCHUU TATSUMAKI SENPUU KYAKU >=============================
[Statedef 1250]
type = A
physics = A
movetype = A
anim = 1250
ctrl = 0
velset = (vel x) + ifelse(vel x >= 0, 1, -1), (vel y) -1
poweradd = 72 * !var(20)
sprpriority = 1
juggle = 8

[State 1250, Strength]
type = varset
trigger1 = !time && !AIlevel
var(10) = ifelse((command = "qcbc"), 3, ifelse(command = "qcbb", 2, 1))
[State 1250, Strength AI]
type = varset
trigger1 = !time && AIlevel
var(10) = 3

[State 1250, slow]
type = veladd
trigger1 = anim = 1250 && animelemtime(24) < 0
y = -const(movement.yaccel) * 0.33

[State 1250, Snd]
type = playsnd
trigger1 = animelem = 1 && anim = 1250 && vel y <= 0
value = 4 + (var(1) = 2) * 10, 2
channel = 0
[State 1250, Snd]
type = playsnd
trigger1 = animelem = 1 && anim = 1250 && vel y > 0
value = 3 + (var(1) = 2) * 10, 2
channel = 0

[State 1250, spin]
type = playsnd
trigger1 = anim = 1250 && !(animelemtime(4) % 9) && animelemtime(26) < 0
value = 1, 6
channel = 1

[State 1250, Hit Again]
type = movehitreset
trigger1 = var(1) = 1
trigger1 = movehit = 1 && !numtarget

[State 1250, Hit]
type = hitdef
trigger1 = var(1) = 1 && (!movehit || var(20))
trigger1 = animelem = 5 || animelem = 11 || animelem = 17 || animelem = 23
attr = A, SA
damage = ifelse(var(1) = 1, 60, 40), 7
animtype = Hard
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 7, 14), ifelse(var(20), 7, 14)
sparkno = s7020 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -69
hitsound = s2, 6
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -2, -7
air.type = Low
air.velocity = -2, -6
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = ifelse(p2movetype = H, 72, 144) * !var(20), 36 * !var(20)
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 4
fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
forcestand = 1
airguard.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0

[State 1250, hitb]
type = hitdef
trigger1 = var(1) = 1 && (!movehit || var(20))
trigger1 = animelem = 8 || animelem = 14 || animelem = 20 || animelem = 26
attr = A, SA
damage = ifelse(var(1) = 1, 60, 40), 7
animtype = Hard
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 7, 14), ifelse(var(20), 7, 14)
sparkno = s7020 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -70
hitsound = s2, 6
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = 2, -7
air.type = Low
air.velocity = 2, -6
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = ifelse(p2movetype = H, 72, 144) * !var(20), 36 * !var(20)
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 4
fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
forcestand = 1
airguard.cornerpush.veloff = 0

[State Idle]
type = statetypeset
trigger1 = animelemtime(27) >= 0
movetype = I


;======================< CLASSIC AERIAL TATSUMAKI >=============================
[Statedef 1270]
type = A
physics = N
movetype = A
anim = 1270
ctrl = 0
poweradd = 72 * !var(20)
sprpriority = 1
juggle = 8

[State 1270, Strength]
type = varset
trigger1 = !time && !AIlevel
var(10) = ifelse((command = "hcbc"), 3, ifelse(command = "hcbb", 2, 1))
[State 1270, Strength AI]
type = varset
trigger1 = !time && AIlevel
var(10) = 3

[State 1270, Vel]
type = velset
trigger1 = !time
x = ifelse(vel x < 0, -3.5, 3.5)
y = 0
[State 1270, Vel]
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
value = 4 + (var(1) = 2) * 10, 2
channel = 0

[State 1270, spin]
type = playsnd
trigger1 = animelem = 5
value = 1, 6
channel = 1

[State 1270, Hit]
type = hitdef
trigger1 = animelem = 5
trigger1 = (!movehit || var(20))
attr = A, SA
damage = 35, 7
animtype = Hard
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 7, 14), ifelse(var(20), 7, 14)
sparkno = s7020 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -69
hitsound = s2, 6
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -3, -6
air.type = Low
air.velocity = -3, -6
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = ifelse(p2movetype = H, 72, 144) * !var(20), 36 * !var(20)
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 4
fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
forcestand = 1
airguard.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0

[State 1270, hitb]
type = hitdef
trigger1 = animelem = 8
trigger1 = (!movehit || var(20))
attr = A, SA
damage = 35, 7
animtype = Hard
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 7, 14), ifelse(var(20), 7, 14)
sparkno = s7020 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -70
hitsound = s2, 6
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = 3, -6
air.type = Low
air.velocity = 3, -6
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = ifelse(p2movetype = H, 72, 144) * !var(20), 36 * !var(20)
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 4
fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
forcestand = 1
airguard.cornerpush.veloff = 0

[State 1270, End]
type = changestate
trigger1 = pos y > -vel y
value = 52


;======================< JOUDAN SOKUTOU GERI >=============================
[Statedef 1300]
type = S
physics = S
movetype = A
ctrl = 0
velset = 0, 0
poweradd = 72 * !var(20)
juggle = 8
sprpriority = 1
facep2 = 1

[State 1300, Strength]
type = varset
trigger1 = !time && !AIlevel
var(10) = ifelse((command = "qcfc"), 3, ifelse(command = "qcfb", 2, 1))
[State 1300, Strength AI]
type = varset
trigger1 = !time && AIlevel
var(10) = ifelse((p2movetype = H || random < 333), 1, ifelse(random < 500, 2, 3))

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
trigger1 = anim = 1300 && animelem = 3
trigger2 = (anim = [1301, 1302]) && animelem = 5
value = 0, 100

[State 1300, Hit]
type = hitdef
trigger1 = (anim = [1301, 1302]) && animelem = 6
trigger2 = anim = 1300 && animelem = 4
attr = S, SA
damage = (70 + var(10) * 14), 7
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
sparkno = s7020 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -78
hitsound = s2, 6
guardsound = s2, 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -3 -var(10) * 1, -6
air.type = Low
air.velocity = -3 -var(10) * 1, -6
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = ifelse(p2movetype = H, 72, 144) * !var(20), 36 * !var(20)
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.5
forcestand = 1

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
trigger1 = anim = 1300 && animelemtime(6) >= 0
trigger2 = anim = 1301 && animelemtime(8) >= 0
trigger3 = anim = 1302 && animelemtime(8) >= 0
movetype = I

[State 1300, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================< ASHURA SENKUU >=============================
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
trigger1 = !time && !AIlevel
var(10) = ifelse(command = "df2p", 3, ifelse(command = "df2k", 2, ifelse(command = "db2p", -3, -2)))

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
value = 3 + (var(1) = 2) * 10, 4 * (var(1) != 2)
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
[State 1400, nothitby]
type = nothitby
triggerall = animelemtime(6) <= ifelse((var(10) = 3 || var(10) = -3), 35, 20)
trigger1 = animelemtime(6) < 0
trigger2 = vel x < 0 && backedgebodydist > ifelse((var(10) = 3 || var(10) = -3), 12, 8)
trigger3 = vel x > 0 && frontedgebodydist > ifelse((var(10) = 3 || var(10) = -3), 12, 8)
value = SCA, AA, AP, AT
time = 1
ignorehitpause = 1
[State 1400, Turn]
type = turn
trigger1 = animelemtime(6) > 0 && p2dist x < 0

[State 1400, End]
type = changestate
trigger1 = animelemtime(6) = ifelse((var(10) = 3 || var(10) = -3), 40, 25)
trigger2 = animelemtime(6) > 0 && vel x < 0 && backedgebodydist <= 0
trigger3 = animelemtime(6) > 0 && vel x > 0 && frontedgebodydist <= 0
value = 0
ctrl = 1
