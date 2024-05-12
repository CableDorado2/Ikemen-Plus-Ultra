; _____________________________________
;| Shin Gouki by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;============================================================================================
;======================================<SUPER STATES>========================================
;============================================================================================

;======================<MESSATSU GOU HADOU>=============================
[Statedef 3000]
type = S
physics = S
movetype = A
anim = 3000
ctrl = 0
velset = 0, 0
sprpriority = 2
facep2 = 1
poweradd = -1000

[State 3000, Custom Combo End]
type = palfx
trigger1 = !time
trigger1 = var(20) > 0
trigger1 = (var(20) := 0) || (var(15) := 0) || 1
time = 1

[State 3000, Strength]
type = varset
trigger1 = var(10) != 5
var(10) = 5
ignorehitpause = 1

[State 3000, Button]
type = varset
triggerall = time <= 0 && !AIlevel
trigger1 = command = "x" || command = "y" || command = "z"
trigger1 = var(11) := ifelse(command = "z", 2, ifelse(command = "y", 1, 0)) || 1
trigger2 = command = "rlsx" || command = "rlsy" || command = "rlsz"
trigger2 = var(11) := ifelse(command = "rlsz", 2, ifelse(command = "rlsy", 1, 0)) || 1
trigger3 = command = "x+" || command = "y+" || command = "z+"
trigger3 = var(11) := ifelse(command = "z+", 2, ifelse(command = "y+", 1, 0)) || 1
trigger4 = command = "rlsx+" || command = "rlsy+" || command = "rlsz+"
trigger4 = var(11) := ifelse(command = "rlsz+", 2, ifelse(command = "rlsy+", 1, 0)) || 1
var(11) = var(11)
ignorehitpause = 1
persistent = 0

[State 3000, Button AI]
type = varset
trigger1 = time <= 0 && AIlevel
var(11) = 2
ignorehitpause = 1

[State 3000, Snd]
type = playsnd
trigger1 = time = 3
value = 4, 5
channel = 0

[State 3000, Super Pause FX]
type = helper
trigger1 = fvar(31)
trigger1 = time = 3
helpertype = normal
stateno = 7500
ID = 7500
name = "Superpause FX"
postype = p1
pos = ceil(-22 * const(size.xscale)), ceil(-48 * const(size.yscale))
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3000, Super Pause]
type = superpause
trigger1 = time = 3
time = 43
movetime = 43
anim = ifelse(fvar(31), -1, 100)
pos = ceil(-22 * const(size.xscale)), ceil(-48 * const(size.yscale))
sound = s0, 8500
p2defmul = 1 + (0 * (fvar(5) := 0))
darken = ifelse(fvar(31), 0, 1)

[State 3000, NHB]
type = nothitby
trigger1 = anim = 3000
trigger2 = anim = 3001 && animelemtime(2) < 1
time = 1
value = SCA

[State 3000, Width]
type = width
trigger1 = anim = 3001 && animelemtime(7) < 0
value = 30, 0

[State 3000, Aura]
type = helper
trigger1 = anim = 3000 && animelem = 3
helpertype = normal
stateno = 6000
ID = 6000
name = "Aura"
postype = p1
ownpal = 1
persistent = 0
supermovetime = 9999

[State 3000, Anim]
type = changeanim
trigger1 = anim = 3000 && time = 46
value = 3001

[State 3000, hadouken]
type = helper
trigger1 = anim = 3001 && animelem = 2
helpertype = normal
stateno = 3005
ID = 3005
name = "Hadouken"
postype = p1
pos = 80, -66
ownpal = 1

[State 3000, Dust]
type = explod
trigger1 = anim = 3001 && animelem = 2
vel = 0, 0
anim = 7106
sprpriority = 3
postype = p1
pos = 42, 0
ownpal = 1
scale = 0.75, 0.75
pausemovetime = -1
supermovetime = -1

[State 3000, Snd]
type = playsnd
trigger1 = anim = 3001 && animelem = 2
value = 3, 7
channel = 0
[State 3000, Snd]
type = playsnd
trigger1 = anim = 3001 && animelem = 2
value = 5, 0

[State 3000, End]
type = changestate
trigger1 = anim = 3001 && !animtime
value = 0
ctrl = 1


;======================<TENMA GOU ZANKUU>=============================
[Statedef 3050]
type = A
physics = N
movetype = A
anim = 3050
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = -1000

[State 3050, Custom Combo End]
type = palfx
trigger1 = !time
trigger1 = var(20) > 0
trigger1 = (var(20) := 0) || (var(15) := 0) || 1
time = 1

[State 3050, Strength]
type = varset
trigger1 = var(10) != 5
var(10) = 5
ignorehitpause = 1

[State 3050, Button]
type = varset
triggerall = time <= 0 && !AIlevel
trigger1 = command = "x" || command = "y" || command = "z"
trigger1 = var(11) := ifelse(command = "z", 2, ifelse(command = "y", 1, 0)) || 1
trigger2 = command = "rlsx" || command = "rlsy" || command = "rlsz"
trigger2 = var(11) := ifelse(command = "rlsz", 2, ifelse(command = "rlsy", 1, 0)) || 1
trigger3 = command = "x+" || command = "y+" || command = "z+"
trigger3 = var(11) := ifelse(command = "z+", 2, ifelse(command = "y+", 1, 0)) || 1
trigger4 = command = "rlsx+" || command = "rlsy+" || command = "rlsz+"
trigger4 = var(11) := ifelse(command = "rlsz+", 2, ifelse(command = "rlsy+", 1, 0)) || 1
var(11) = var(11)
ignorehitpause = 1
persistent = 0

[State 3050, Button AI]
type = varset
trigger1 = time <= 0 && AIlevel
var(11) = 2
ignorehitpause = 1

[State 3050, Snd]
type = playsnd
trigger1 = time = 3
value = 4, 14
channel = 0

[State 3050, Super Pause FX]
type = helper
trigger1 = fvar(31)
trigger1 = time = 3
helpertype = normal
stateno = 7500
ID = 7500
name = "Superpause FX"
postype = p1
pos = ceil(61 * const(size.xscale)), ceil(-51 * const(size.yscale))
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3050, Super Pause]
type = superpause
trigger1 = time = 3
time = 43
movetime = 43
anim = ifelse(fvar(31), -1, 100)
pos = ceil(61 * const(size.xscale)), ceil(-51 * const(size.yscale))
sound = s0, 8500
p2defmul = 1 + (0 * (fvar(5) := 0))
darken = ifelse(fvar(31), 0, 1)

[State 3050, NHB]
type = nothitby
trigger1 = animelemtime(8) < 1
time = 1
value = SCA

[State 3050, hadouken]
type = helper
trigger1 = animelem = 8
helpertype = normal
stateno = 3055
ID = 3055
name = "Hadouken"
postype = p1
pos = 73, -43
ownpal = 1

[State 3050, Snd]
type = playsnd
trigger1 = animelem = 8
value = 4, 0
channel = 0
[State 3050, Snd]
type = playsnd
trigger1 = animelem = 8
value = 5, 0

[State 3050, Vel]
type = velset
trigger1 = animelem = 8
x = -1.5
y = -6
[State 3050, Type]
type = statetypeset
trigger1 = animelemtime(8) > 0
physics = N

[State 3050, Type]
type = veladd
trigger1 = animelemtime(8) > 0
y = 0.5

[State Land]
type = changestate
trigger1 = statetype = A
trigger1 = vel y > 0 && (pos y > -vel y)
value = 1059


;======================<MAX TENMA GOU ZANKUU>=============================
[Statedef 3070]
type = A
physics = N
movetype = A
anim = 3070
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = -2000

[State 3000, Custom Combo End]
type = palfx
trigger1 = !time
trigger1 = var(20) > 0
trigger1 = (var(20) := 0) || (var(15) := 0) || 1
time = 1

[State 3070, Strength]
type = varset
trigger1 = var(10) != 6
var(10) = 6
ignorehitpause = 1

[State 3070, Snd]
type = playsnd
trigger1 = time = 3
value = 4, 14
channel = 0

[State 3070, Super Pause FX]
type = helper
trigger1 = fvar(31)
trigger1 = time = 3
helpertype = normal
stateno = 7510
ID = 7500
name = "Superpause FX"
postype = p1
pos = ceil(-8 * const(size.xscale)), ceil(-103 * const(size.yscale))
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3070, Super Pause]
type = superpause
trigger1 = time = 3
time = 45
movetime = 45
anim = ifelse(fvar(31), -1, 101)
pos = ceil(-8 * const(size.xscale)), ceil(-103 * const(size.yscale))
sound = s0, 8510
p2defmul = 1 + (0 * (fvar(5) := 0))
darken = ifelse(fvar(31), 0, 1)

[State 3070, NHB]
type = nothitby
trigger1 = animelemtime(5) < 1
time = 1
value = SCA

[State 3070, hadouken]
type = helper
trigger1 = animelem = 5 || animelem = 11 || animelem = 17 || animelem = 23 || animelem = 29
helpertype = normal
stateno = 3075
ID = 3075
name = "Hadouken"
postype = p1
pos = 64, -52
ownpal = 1
size.xscale = 0.60 + (random / 5000.0)
size.yscale = 0.60 + (random / 5000.0)
[State 3070, hadouken]
type = helper
trigger1 = animelem = 5 || animelem = 11 || animelem = 17 || animelem = 23 || animelem = 29
helpertype = normal
stateno = 3075
ID = 3075
name = "Hadouken"
postype = p1
pos = 56, -44
ownpal = 1
size.xscale = 0.60 + (random / 5000.0)
size.yscale = 0.60 + (random / 5000.0)
[State 3070, hadouken]
type = helper
trigger1 = animelem = 8 || animelem = 14 || animelem = 20 || animelem = 26
helpertype = normal
stateno = 3075
ID = 3075
name = "Hadouken"
postype = p1
pos = 54, -52
ownpal = 1
size.xscale = 0.60 + (random / 5000.0)
size.yscale = 0.60 + (random / 5000.0)
[State 3070, hadouken]
type = helper
trigger1 = animelem = 8 || animelem = 14 || animelem = 20 || animelem = 26
helpertype = normal
stateno = 3075
ID = 3075
name = "Hadouken"
postype = p1
pos = 46, -44
ownpal = 1
size.xscale = 0.60 + (random / 5000.0)
size.yscale = 0.60 + (random / 5000.0)

[State 3070, Snd]
type = playsnd
trigger1 = animelem = 5 || animelem = 11 || animelem = 17 || animelem = 23 || animelem = 29
trigger2 = animelem = 8 || animelem = 14 || animelem = 20 || animelem = 26
value = 3, 0
channel = 0
[State 3070, Snd]
type = playsnd
trigger1 = animelem = 5 || animelem = 11 || animelem = 17 || animelem = 23 || animelem = 29
trigger2 = animelem = 8 || animelem = 14 || animelem = 20 || animelem = 26
value = 5, 0
channel = 1

[State 3070, Vel]
type = velset
trigger1 = animelem = 5 || animelem = 11 || animelem = 17 || animelem = 23 || animelem = 29
trigger2 = animelem = 8 || animelem = 14 || animelem = 20 || animelem = 26
x = -2
y = -2.4
[State 3070, Vel]
type = velmul
trigger1 = animelemtime(5) >= 0 && animelemtime(29) < 0
x = 0.75
y = 0.75

[State 3070, Type]
type = statetypeset
trigger1 = animelemtime(32) >= 0
physics = N

[State 3070, Type]
type = veladd
trigger1 = animelemtime(32) >= 0
y = 0.5

[State Land]
type = changestate
trigger1 = statetype = A
trigger1 = vel y > 0 && (pos y > -vel y)
value = 1059


;======================<MESSATSU GOU SHORYUU>=============================
[Statedef 3100]
type = S
physics = S
movetype = A
ctrl = 0
anim = 3100
velset = 0, 0
sprpriority = 1
facep2 = 1
poweradd = -1000

[State 3100, Custom Combo End]
type = palfx
trigger1 = !time
trigger1 = var(20) > 0
trigger1 = (var(20) := 0) || (var(15) := 0) || 1
time = 1

[State 3100, Strength]
type = varset
trigger1 = var(10) != 5
var(10) = 5
ignorehitpause = 1

[State 3100, Button]
type = varset
triggerall = time <= 0 && !AIlevel
trigger1 = command = "x" || command = "y" || command = "z"
trigger1 = var(11) := ifelse(command = "z", 2, ifelse(command = "y", 1, 0)) || 1
trigger2 = command = "rlsx" || command = "rlsy" || command = "rlsz"
trigger2 = var(11) := ifelse(command = "rlsz", 2, ifelse(command = "rlsy", 1, 0)) || 1
trigger3 = command = "x+" || command = "y+" || command = "z+"
trigger3 = var(11) := ifelse(command = "z+", 2, ifelse(command = "y+", 1, 0)) || 1
trigger4 = command = "rlsx+" || command = "rlsy+" || command = "rlsz+"
trigger4 = var(11) := ifelse(command = "rlsz+", 2, ifelse(command = "rlsy+", 1, 0)) || 1
var(11) = var(11)
ignorehitpause = 1
persistent = 0

[State 3100, Button AI]
type = varset
trigger1 = time <= 0 && AIlevel
var(11) = 2
ignorehitpause = 1

[State 3100, Snd]
type = playsnd
trigger1 = time = 2
value = 4, 4
channel = 0

[State 3100, Super Pause FX]
type = helper
trigger1 = fvar(31)
trigger1 = time = 2
helpertype = normal
stateno = 7500
ID = 7500
name = "Superpause FX"
postype = p1
pos = ceil(18 * const(size.xscale)), ceil(-48 * const(size.yscale))
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3100, Super Pause]
type = superpause
trigger1 = time = 2
time = 43
movetime = 43
anim = ifelse(fvar(31), -1, 100)
pos = ceil(18 * const(size.xscale)), ceil(-48 * const(size.yscale))
sound = s0, 8500
p2defmul = 1 + (0 * (fvar(5) := 0))
darken = ifelse(fvar(31), 0, 1)

[State 3100, NHB]
type = nothitby
trigger1 = anim = 3100 && animelemtime(4) < 0
time = 1
value = SCA
ignorehitpause = 1

[State 3100, Vel]
type = velset
trigger1 = anim = 3100 && (animelem = 2 || animelem = 14)
x = ifelse(var(11) = 2, 14, ifelse(var(11) = 1, 11.5, 9))

[State 3100, Vel]
type = velset
trigger1 = anim = 3100 && animelem = 26
x = ifelse(var(11) = 2, 20, ifelse(var(11) = 1, 17.5, 15))

[State 3100, Dust]
type = explod
trigger1 = anim = 3100 && (animelem = 2 || animelem = 14 || animelem = 26)
anim = 7103
ID = 7103
sprpriority = 3
postype = p1
ownpal = 1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1

[State 3100, Vel]
type = velset
trigger1 = anim = 3100 && animelemtime(28) = 1
y = -11

[State 3100, Snd]
type = playsnd
trigger1 = anim = 3100 && (animelem = 4 || animelem = 16)
value = 1, 5
channel = 1
[State 3100, Snd]
type = playsnd
trigger1 = anim = 3100 && animelem = 28
value = 1, 6
channel = 1
[State 3100, Snd]
type = playsnd
trigger1 = anim = 3100 && (animelem = 4 || animelem = 16 || animelem = 28)
value = 3, ifelse((animelem = 4), 1, ifelse((animelem = 16), 9, 11))
channel = 0

[State 3100, Dust]
type = helper
trigger1 = anim = 3100 && animelem = 28
helpertype = normal
stateno = 7100
ID = 7100
name = "Dust"
postype = p1
ownpal = 1
[State 3100, Snd]
type = playsnd
trigger1 = anim = 3100 && animelem = 28
value = 0, 41

[State 3100, Vel]
type = velmul
trigger1 = vel y < 0
x = 0.86
[State 3100, Vel]
type = velmul
trigger1 = vel y > 0
x = 0

[State 3100, Width]
type = width
trigger1 = vel y < 0
edge = const(size.air.front)

[State 3100, Hit Low]
type = hitdef
trigger1 = animelem = 14 && anim = 3100
trigger1 = var(15) < (1 + hitcount)
attr = S, HA
damage = 45, 7
animtype = Medium
fall.animtype = Medium
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse((animelem = 24), 18, 6), ifelse((animelem = 24), 18, 6)
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 50), var(37) := -52
hitsound = -1 + 0 * (var(31) := 3)
guardsound = -1
ground.type = Low
ground.slidetime = 20
ground.hittime = 20
ground.velocity = -4, 0
air.velocity = -4, -3
yaccel = 0.4850
getpower = 0
givepower = 40, 40
envshake.time = 12
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
air.fall = 1
fall.recover = 0
forcestand = 1
airguard.ctrltime = 16
airguard.cornerpush.veloff = 0
airguard.velocity = -6.00, -1.00

[State 3100, hitlow2]
type = hitdef
trigger1 = (animelem = 3 || animelem = 15) && anim = 3100
trigger1 = var(15) < (2 + hitcount)
attr = S, HA
damage = 45, 7
animtype = Hard
fall.animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 6, 6
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 50), var(37) := -75
hitsound = -1 + 0 * (var(31) := 3)
guardsound = -1
ground.type = Low
ground.slidetime = 20
ground.hittime = 20
ground.velocity = -4, 0
air.velocity = -4, -3
yaccel = 0.4850
getpower = 0
givepower = 40, 40
envshake.time = 12
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
air.fall = 1
fall.recover = 0
forcestand = 1
airguard.ctrltime = 16
airguard.cornerpush.veloff = 0
airguard.velocity = -6.00, -1.00

[State 3100, Hit High]
type = hitdef
trigger1 = (animelem = 4 || animelem = 16) && anim = 3100
trigger1 = var(15) < (3 + hitcount)
attr = S, HA
damage = 45, 7
animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 6, 6
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 50), var(37) := -100
hitsound = -1 + 0 * (var(31) := 3)
guardsound = -1
ground.type = High
ground.slidetime = 20
ground.hittime = 20
ground.velocity = -4, 0
air.velocity = -4, -3
yaccel = 0.4850
getpower = 0
givepower = 40, 40
envshake.time = 12
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
air.fall = 1
fall.recover = 0
forcestand = 1
airguard.ctrltime = 16
airguard.cornerpush.veloff = 0
airguard.velocity = -6.00, -1.00

[State 3100, Hit Fall]
type = hitdef
trigger1 = anim = 3100
trigger1 = animelem = 26 || animelem = 27
trigger1 = var(15) < (3 + hitcount)
attr = S, HA
damage = 45, 7
animtype = Hard
fall.animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 18, 18
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 50), var(37) := ifelse((animelem = 27), -75, -52)
hitsound = -1 + 0 * (var(31) := 3)
guardsound = -1
ground.type = Low
ground.slidetime = 20
ground.hittime = 20
ground.velocity = 0, -9.0
air.velocity = 0, -9.0
yaccel = 0.4850
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
getpower = 0
givepower = 40, 40
envshake.time = 12
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
fall = 1
fall.recover = 0
forcestand = 1
airguard.ctrltime = 16
airguard.cornerpush.veloff = 0
airguard.velocity = -6.00, -1.00

[State 3100, Hit Final]
type = hitdef
trigger1 = animelem = 28 && anim = 3100
trigger1 = var(15) < (3 + hitcount)
persistent = 0
attr = A, HA
damage = 40, 7
animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 2, 2
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 10) * (var(36) := 30), var(37) := -100
hitsound = -1 + 0 * (var(31) := 3)
guardsound = -1
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -4.0, -9.0
air.velocity = -4.0, -9.0
yaccel = 0.4850
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
getpower = 0
givepower = 40, 40
envshake.time = 12
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
fall = 1
fall.recover = 0
forcestand = 1

[State 3100, Type]
type = statetypeset
trigger1 = anim = 3100 && animelemtime(28) >= 1
statetype = A
physics = N

[State 3100, Type]
type = veladd
trigger1 = anim = 3100 && animelemtime(28) >= 1
trigger2 = anim = 1101
y = 0.5

[State 3100, Anim]
type = changeanim
trigger1 = anim = 3100 && animelemtime(28) > 2 && vel y > -5.5
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


;======================<MESSATSU GOU RASEN>=============================
[Statedef 3200]
type = S
physics = S
movetype = A
anim = 3200
ctrl = 0
velset = 0, 0
sprpriority = 1
facep2 = 1
poweradd = -1000

[State 3200, Custom Combo End]
type = palfx
trigger1 = !time
trigger1 = var(20) > 0
trigger1 = (var(20) := 0) || (var(15) := 0) || 1
time = 1

[State 3200, Strength]
type = varset
trigger1 = var(10) != 5
var(10) = 5
ignorehitpause = 1

[State 3200, Button]
type = varset
triggerall = time <= 0 && !AIlevel
trigger1 = command = "a" || command = "b" || command = "c"
trigger1 = var(11) := ifelse(command = "c", 2, ifelse(command = "b", 1, 0)) || 1
trigger2 = command = "rlsa" || command = "rlsb" || command = "rlsc"
trigger2 = var(11) := ifelse(command = "rlsc", 2, ifelse(command = "rlsb", 1, 0)) || 1
trigger3 = command = "a+" || command = "b+" || command = "c+"
trigger3 = var(11) := ifelse(command = "c+", 2, ifelse(command = "b+", 1, 0)) || 1
trigger4 = command = "rlsa+" || command = "rlsb+" || command = "rlsc+"
trigger4 = var(11) := ifelse(command = "rlsc+", 2, ifelse(command = "rlsb+", 1, 0)) || 1
var(11) = var(11)
ignorehitpause = 1
persistent = 0

[State 3200, Button AI]
type = varset
trigger1 = time <= 0 && AIlevel
var(11) = 2
ignorehitpause = 1

[State 3200, Snd]
type = playsnd
trigger1 = time = 3
value = 4, 4
channel = 0

[State 3200, Super Pause FX]
type = helper
trigger1 = fvar(31)
trigger1 = time = 3
helpertype = normal
stateno = 7500
ID = 7500
name = "Superpause FX"
postype = p1
pos = ceil(-32 * const(size.xscale)), ceil(-8 * const(size.yscale))
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3200, Super Pause]
type = superpause
trigger1 = time = 3
time = 43
movetime = 43
anim = ifelse(fvar(31), -1, 100)
pos = ceil(-32 * const(size.xscale)), ceil(-8 * const(size.yscale))
sound = s0, 8500
p2defmul = 1 + (0 * (fvar(5) := 0))
darken = ifelse(fvar(31), 0, 1)

[State 3200, NHB]
type = nothitby
trigger1 = anim = 3200
trigger2 = anim = 3201 && animelemtime(2) < 0
time = 1
value = SCA
ignorehitpause = 1

[State 3200, Snd]
type = playsnd
trigger1 = anim = 3200 && animelem = 7
trigger2 = anim = 3201 && animelem = 55
value = 3, ifelse((animelem = 7), 6, 7)
channel = 0
[State 3200, Snd]
type = playsnd
trigger1 = anim = 3201
value = 5, 13
persistent = 0

[State 3200, Snd]
type = playsnd
trigger1 = anim = 3200 && animelem = 8
value = 0, 41
[State 3200, Dust]
type = helper
trigger1 = anim = 3200 && animelem = 8
helpertype = normal
stateno = 7100
ID = 7100
name = "Dust"
postype = p1
ownpal = 1

[State 3200, Vel]
type = velset
trigger1 = anim = 3200 && animelem = 10
x = ifelse(command = "holdfwd", 1.25, ifelse(command = "holdback", -1.25, 0))
y = ifelse(var(11) = 2, -8, ifelse(var(11) = 1, -6, -4))
[State 3200, Vel]
type = velset
trigger1 = anim = 3201 && vel y > 0
y = 0

[State 3200, Accel]
type = veladd
trigger1 = anim = 3201 && vel y < 0
y = ifelse(var(11) = 2, 0.14, ifelse(var(11) = 1, 0.105, 0.07))

[State 3200, ctrlvel]
type = veladd
triggerall = !AIlevel
triggerall = anim = 3201 && vel y < 0
trigger1 = command = "holdfwd" && vel x < 1.25
trigger2 = command = "holdback" && vel x > -1.25
x = ifelse(command = "holdfwd", 0.0625, ifelse(command = "holdback", -0.0625, 0))

[State 3200, ctrlvelAI]
type = veladd
trigger1 = AIlevel
trigger1 = anim = 3201 && vel y < 0
trigger1 = fvar(16) > 35 && vel x < 1.25
x = 0.0625

[State 3200, Type]
type = statetypeset
trigger1 = anim = 3200 && animelemtime(8) > 0
statetype = A
physics = N

[State 3200, Anim]
type = changeanim
trigger1 = anim = 3200 && !animtime
value = 3201

[State 3200, Anim]
type = changeanim
trigger1 = anim = 3201 && !animtime
value = 3205
persistent = 0

[State 3200, Type]
type = statetypeset
trigger1 = anim = 3205
statetype = A
physics = N

[State 3200, Type]
type = veladd
trigger1 = anim = 3205
y = 0.5

[State 3200, Snd]
type = playsnd
triggerall = anim = 3201
trigger1 = animelem = 1 || animelem = 7 || animelem = 13 || animelem = 19 || animelem = 25
trigger2 = animelem = 31 || animelem = 37 || animelem = 43 || animelem = 49 || animelem = 55
value = 1, 5
channel = 1

[State 3200, Hit First]
type = hitdef
trigger1 = anim = 3200 && animelem = 8
trigger1 = var(15) < 11
attr = S, HA
damage = 50, 7
animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 16, 16
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 15) * (var(36) := 35), var(37) := -62
hitsound = -1 + 0 * (var(31) := 6)
guardsound = -1
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = ifelse(fvar(16) > 15, 2, 0), -7.5
air.type = Low
air.velocity = ifelse(fvar(16) > 15, 2, 0), -7.5
yaccel = 0.4850
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
getpower = 0
givepower = 40, 40
envshake.time = 12
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
fall = 1
fall.recover = 0
forcestand = 1
airguard.ctrltime = 16
airguard.cornerpush.veloff = 0
airguard.velocity = -6.00, -1.00

[State 3200, Hit Rising]
type = hitdef
triggerall = anim = 3201
trigger1 = animelem = 2 || animelem = 8 || animelem = 14 || animelem = 20 || animelem = 26 || animelem = 32 || animelem = 38 || animelem = 44 || animelem = 50
trigger1 = var(15) < 11
attr = A, HA
damage = 30, 3
animtype = Up
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 2, 2
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 65), var(37) := -69
hitsound = -1 + 0 * (var(31) := 6)
guardsound = -1
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = ifelse(fvar(16) > 24, 1.5, 0), -16
air.type = Low
air.velocity = ifelse(fvar(16) > 24, 1.5, 0), (vel y - 1.0)
yaccel = 0.4850
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
getpower = 0
givepower = 40, 40
envshake.time = 12
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
fall = 1
fall.recover = 0
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
forcestand = 1

[State 3200, Hit Behind]
type = hitdef
triggerall = anim = 3201
trigger1 = animelem = 5 || animelem = 11 || animelem = 17 || animelem = 23 || animelem = 29 || animelem = 35 || animelem = 41 || animelem = 47
trigger1 = var(15) < 11
attr = A, HA
damage = 30, 3
animtype = Up
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 2, 2
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := -55) * (var(36) := -20), var(37) := -69
hitsound = -1 + 0 * (var(31) := 6)
guardsound = -1
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = 6, -9
air.type = Low
air.velocity = 6, -9
yaccel = 0.4850
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
getpower = 0
givepower = 40, 40
envshake.time = 12
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
fall = 1
fall.recover = 0
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
forcestand = 1

[State 3200, Hit Final]
type = hitdef
trigger1 = anim = 3201 && animelem = 56
attr = S, HA
damage = 50, 5
animtype = Diagup
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 24, 24
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 65), var(37) := -70
hitsound = -1 + 0 * (var(31) := 6)
guardsound = -1
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -7.5, -3
air.type = Low
air.velocity = -7.5, -3
yaccel = 0.4850
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
getpower = 0
givepower = 40, 40
envshake.time = 12
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
fall = 1
fall.recover = 0
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
forcestand = 1

[State Idle]
type = statetypeset
trigger1 = anim = 3205
movetype = I

[State Land]
type = changestate
trigger1 = statetype = A
trigger1 = vel y > 0 && (pos y > -vel y)
value = 1259


;======================<MESSATSU GOU SENPUU>=============================
[Statedef 3250]
type = A
physics = N
movetype = A
anim = 3250
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = -1000

[State 3250, Custom Combo End]
type = palfx
trigger1 = !time
trigger1 = var(20) > 0
trigger1 = (var(20) := 0) || (var(15) := 0) || 1
time = 1

[State 3250, Strength]
type = varset
trigger1 = var(10) != 5
var(10) = 5
ignorehitpause = 1

[State 3250, Button]
type = varset
triggerall = time <= 0 && !AIlevel
trigger1 = command = "a" || command = "b" || command = "c"
trigger1 = var(11) := ifelse(command = "c", 2, ifelse(command = "b", 1, 0)) || 1
trigger2 = command = "rlsa" || command = "rlsb" || command = "rlsc"
trigger2 = var(11) := ifelse(command = "rlsc", 2, ifelse(command = "rlsb", 1, 0)) || 1
trigger3 = command = "a+" || command = "b+" || command = "c+"
trigger3 = var(11) := ifelse(command = "c+", 2, ifelse(command = "b+", 1, 0)) || 1
trigger4 = command = "rlsa+" || command = "rlsb+" || command = "rlsc+"
trigger4 = var(11) := ifelse(command = "rlsc+", 2, ifelse(command = "rlsb+", 1, 0)) || 1
var(11) = var(11)
ignorehitpause = 1
persistent = 0

[State 3250, Button AI]
type = varset
trigger1 = time <= 0 && AIlevel
var(11) = 2
ignorehitpause = 1

[State 3250, Snd]
type = playsnd
trigger1 = time = 3
value = 4, 4
channel = 0

[State 3250, Super Pause FX]
type = helper
trigger1 = fvar(31)
trigger1 = time = 3
helpertype = normal
stateno = 7500
ID = 7500
name = "Superpause FX"
postype = p1
pos = ceil(-34 * const(size.xscale)), ceil(-63 * const(size.yscale))
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3250, Super Pause]
type = superpause
trigger1 = time = 3
time = 43
movetime = 43
anim = ifelse(fvar(31), -1, 100)
pos = ceil(-34 * const(size.xscale)), ceil(-63 * const(size.yscale))
sound = s0, 8500
p2defmul = 1 + (0 * (fvar(5) := 0))
darken = ifelse(fvar(31), 0, 1)

[State 3250, NHB]
type = nothitby
trigger1 = anim = 3250
trigger2 = anim = 3251 && animelemtime(2) < 0
time = 1
value = SCA
ignorehitpause = 1

[State 3250, Snd]
type = playsnd
trigger1 = anim = 3250 && animelem = 4
trigger2 = anim = 3251 && animelem = 61
value = 3, ifelse((animelem = 4), 6, 7)
channel = 0
[State 3250, Snd]
type = playsnd
trigger1 = anim = 3251
value = 5, 13
persistent = 0

[State 3250, Vel]
type = velset
trigger1 = anim = 3250
x = 0
y = 0
[State 3250, Vel]
type = velset
trigger1 = anim = 3251 && animelemtime(15) < 0 && pos y < -10
y = ifelse(animelemtime(9) < 0, 0.33, 0.1)
[State 3250, Vel]
type = velset
trigger1 = anim = 3251 && animelem = 15
x = 0
y = ifelse(var(11) = 2, -4, ifelse(var(11) = 1, -3, -2))

[State 3250, Accel]
type = veladd
trigger1 = anim = 3251 && animelemtime(15) >= 0 && vel y < 0
y = ifelse(var(11) = 2, 0.05, ifelse(var(11) = 1, 0.0375, 0.025))

[State 3250, ctrlvel]
type = veladd
triggerall = !AIlevel
triggerall = anim = 3251 && vel y < 0
trigger1 = command = "holdfwd" && vel x < 1.25
trigger2 = command = "holdback" && vel x > -1.25
x = ifelse(command = "holdfwd", 0.0625, ifelse(command = "holdback", -0.0625, 0))

[State 3250, ctrlvelAI]
type = veladd
trigger1 = AIlevel
trigger1 = anim = 3251 && vel y < 0
trigger1 = fvar(16) > 35 && vel x < 1.25
x = 0.0625

[State 3250, Anim]
type = changeanim
trigger1 = anim = 3250 && !animtime
value = 3251
[State 3250, Anim]
type = changeanim
trigger1 = anim = 3251 && !animtime
value = 3205
persistent = 0

[State 3250, Type]
type = statetypeset
trigger1 = anim = 3205
statetype = A
physics = N

[State 3250, Type]
type = veladd
trigger1 = anim = 3205
y = 0.5

[State 3250, Snd]
type = playsnd
triggerall = anim = 3251
trigger1 = animelem = 1 || animelem = 7 || animelem = 13 || animelem = 19 || animelem = 25 || animelem = 31
trigger2 = animelem = 37 || animelem = 43 || animelem = 49 || animelem = 55 || animelem = 61
value = 1, 5
channel = 1

[State 3250, Hit Rising]
type = hitdef
trigger1 = anim = 3251
trigger1 = animelem = 2 || animelem = 8 || animelem = 14 || animelem = 20 || animelem = 26 || animelem = 32 || animelem = 38 || animelem = 44 || animelem = 50 || animelem = 56
trigger1 = var(15) < 19
attr = A, HA
damage = 25, 7
animtype = Up
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 2, 2
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 65), var(37) := -69
hitsound = -1 + 0 * (var(31) := 6)
guardsound = -1
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = ifelse(fvar(16) > 24, 1.5, 0), -7.0
air.type = Low
air.velocity = ifelse(fvar(16) > 24, 1.5, 0), (vel y - 1.5)
yaccel = 0.4850
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
getpower = 0
givepower = 40, 40
envshake.time = 12
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
fall = 1
fall.recover = 0
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
forcestand = 1

[State 3250, Hit Behind]
type = hitdef
trigger1 = anim = 3201
trigger1 = animelem = 5 || animelem = 11 || animelem = 17 || animelem = 23 || animelem = 29 || animelem = 35 || animelem = 41 || animelem = 47 || animelem = 53
trigger1 = var(15) < 19
attr = A, HA
damage = 25, 7
animtype = Up
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 2, 2
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := -55) * (var(36) := -20), var(37) := -69
hitsound = -1 + 0 * (var(31) := 6)
guardsound = -1
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = 6, -9
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.type = Low
air.velocity = 6, -9
yaccel = 0.4850
getpower = 0
givepower = 40, 40
envshake.time = 12
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
fall = 1
fall.recover = 0
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
forcestand = 1

[State 3250, Hit Final]
type = hitdef
trigger1 = anim = 3251 && animelem = 62
trigger1 = var(15) < 19
attr = S, HA
damage = 25, 7
animtype = Diagup
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 24, 24
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 65), var(37) := -70
hitsound = -1 + 0 * (var(31) := 6)
guardsound = -1
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -7.5, -3
air.type = Low
air.velocity = -7.5, -3
yaccel = 0.4850
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
getpower = 0
givepower = 40, 40
envshake.time = 12
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
fall = 1
fall.recover = 0
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
forcestand = 1

[State Idle]
type = statetypeset
trigger1 = anim = 3205
movetype = I

[State Land]
type = changestate
trigger1 = statetype = A
trigger1 = vel y > 0 && (pos y > -vel y)
value = 1259


;======================<TENMA SHINZUI WARI>=============================
[Statedef 3300]
type = A
physics = N
movetype = A
anim = 3300
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = -1000

[State 3300, Custom Combo End]
type = palfx
trigger1 = !time
trigger1 = var(20) > 0
trigger1 = (var(20) := 0) || (var(15) := 0) || 1
time = 1

[State 3300, Strength]
type = varset
trigger1 = var(10) != 5
var(10) = 5
ignorehitpause = 1

[State 3300, Combo Position]
type = posadd
trigger1 = !time
trigger1 = (prevstateno = [1200, 1250]) || (prevstateno = [3200, 3250])
y = -24

[State 3300, Snd]
type = playsnd
trigger1 = time = 2
value = 4, 14
channel = 0

[State 3300, Super Pause FX]
type = helper
trigger1 = fvar(31)
trigger1 = time = 2
helpertype = normal
stateno = 7500
ID = 7500
name = "Superpause FX"
postype = p1
pos = ceil(5 * const(size.xscale)), ceil(-45 * const(size.yscale))
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3300, Super Pause]
type = superpause
trigger1 = time = 2
time = 43
movetime = 43
anim = ifelse(fvar(31), -1, 100)
pos = ceil(5 * const(size.xscale)), ceil(-45 * const(size.yscale))
sound = s0, 8500
p2defmul = 1 + (0 * (fvar(5) := 0))
darken = ifelse(fvar(31), 0, 1)

[State 3300, NHB]
type = nothitby
trigger1 = anim = 3300 && animelemtime(2) < 1
time = 1
value = SCA
ignorehitpause = 1

[State 3300, Push]
type = playerpush
trigger1 = 1
value = 0
ignorehitpause = 1

[State 3300, trail]
type = helper
trigger1 = anim = 3300 && animelem = 2
helpertype = normal
stateno = 3305
ID = 33050
name = "Tenma trail"
postype = p1
ownpal = 1
persistent = 0
[State 3300, Dust]
type = explod
trigger1 = anim = 3300 && animelem = 2
anim = 3306
ID = 3306
sprpriority = 1
postype = p1
ownpal = 1
[State 3300, Vel]
type = velset
trigger1 = anim = 3300 && animelem = 2
x = 12
y = 12

[State 3300, Snd]
type = playsnd
trigger1 = anim = 3300 && animelem = 2
value = 3, 7
channel = 0
[State 3300, Snd]
type = playsnd
trigger1 = anim = 3300 && animelem = 2
value = 1, 6
channel = 1

[State 3300, Hit]
type = hitdef
trigger1 = animelem = 2
trigger1 = var(15) < 2
ID = 3300
attr = A, HA
damage = 140, 21
animtype = Hard
guardflag = HA
hitflag = MAFD
priority = 4, Hit
pausetime = 0, 12
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 25) * (var(36) := 50), var(37) := -15
hitsound = -1 + 0 * (var(31) := 11)
guardsound = -1
ground.type = High
animtype = Diagup
fall.animtype = Diagup
ground.slidetime = 16
ground.hittime = 16
ground.velocity = 0, -10
air.velocity = 0, -10
yaccel = 0.4850
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
getpower = 0
givepower = 40, 40
envshake.time = 24
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
palfx.sinadd = 64, 64, 64, 4
palfx.mul = 128, 128, 128
palfx.time = 60
fall = 1
fall.recover = 0
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
forcestand = 1

[State 3300, Flame Particles]
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

[State 3300, Anim]
type = changeanim
trigger1 = anim = 3300 && animelemtime(2) > 0 && pos y >= -5
value = 3301
persistent = 0

[State 3300, Type]
type = statetypeset
trigger1 = anim = 3301
statetype = S
physics = N
[State 3300, Type]
type = velmul
trigger1 = anim = 3301
x = 0.8

[State 3300, Stop]
type = posset
trigger1 = anim = 3301
y = 0
[State 3300, Stop]
type = velset
trigger1 = anim = 3301
y = 0

[State 3300, Dust]
type = explod
trigger1 = anim = 3301 && animelem = 1
anim = 7102
ID = 7102
sprpriority = -2
postype = p1
ownpal = 1
ignorehitpause = 1
pausemovetime = -1
supermovetime = -1

[State 3300, Dust]
type = explod
trigger1 = anim = 3301 && vel x > 1 && !(time % 5)
anim = 7103
ID = 7103
sprpriority = 3
postype = p1
pos = 42, 0
vel = -1, 0
ownpal = 1
scale = 0.5, 0.5
ignorehitpause = 1
pausemovetime = -1
supermovetime = -1

[State 3300, Snd]
type = playsnd
trigger1 = anim = 3301 && animelem = 1
value = 0, 52
[State 3300, Snd]
type = playsnd
trigger1 = anim = 3301 && animelem = 1
value = 5, 14

[State 3300, End]
type = changestate
trigger1 = anim = 3301 && !animtime
value = 0
ctrl = 1


;======================<SHUN GOKU SATSU>=============================
[Statedef 4000]
type = S
physics = S
movetype = A
anim = 4000
ctrl = 0
velset = 0, 0
facep2 = 1
poweradd = -3000
sprpriority = 1

[State 4000, Custom Combo End]
type = palfx
trigger1 = !time
trigger1 = var(20) > 0
trigger1 = (var(20) := 0) || (var(15) := 0) || 1
time = 1

[State 4000, Strength]
type = varset
trigger1 = var(10) != 7
var(10) = 7
ignorehitpause = 1

[State 4000, Snd]
type = playsnd
trigger1 = !time
value = 4, 13
channel = 0

[State 4000, Super Pause FX]
type = helper
trigger1 = fvar(31)
trigger1 = time = 2
helpertype = normal
stateno = 7520
ID = 7500
name = "Superpause FX"
postype = p1
pos = ceil(14 * const(size.xscale)), ceil(-104 * const(size.yscale))
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 4000, Super Pause];no advantage
type = superpause
trigger1 = time = 2
time = 40
movetime = 40
anim = ifelse(fvar(31), -1, 102)
pos = ceil(14 * const(size.xscale)), ceil(-104 * const(size.yscale))
sound = s0, 8520
p2defmul = 1 + (0 * (fvar(5) := 0))
darken = ifelse(fvar(31), 0, 1)

[State 4000, NHB]
type = nothitby
trigger1 = time < 52
time = 1
value = SCA

[State 4000, Vel]
type = velset
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
x = 8
[State 4000, Vel]
type = velset
trigger1 = animelem = 3
x = 0

[State 4000, Snd]
type = playsnd
trigger1 = animelem = 2
value = 5, 6
persistent = 0

[State 4000, Miss]
type = hitdef
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
attr = S, HT
hitflag =

[State 4000, Hit]
type = hitdef
trigger1 = !var(29) && numenemy
trigger1 = fvar(16) <= 17
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
trigger1 = p2dist x >= ifelse((facing = enemynear, facing), -(enemynear, const(size.ground.front)), -(enemynear, const(size.ground.back)))
attr = S, HT
hitflag = M
priority = 6, Miss
numhits = 0
sparkno = -1 + 0 * (var(33) := 0)
hitsound = -1 + 0 * (var(31) := 800)
p1facing = 1
p1stateno = 4001
fall = 1
fall.recover = 0

[State 4000, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- PLAYER ---
[Statedef 4001]
type = S
physics = N
movetype = A
anim = 4001
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 4001, Throw]
type = targetstate
trigger1 = !time
value = 1114002
[State 4001, Throw]
type = targetfacing
trigger1 = !time
value = -1

[State 4001, Snd]
type = playsnd
trigger1 = !time
value = 4, 10
channel = 0

[State 4001, Snd]
type = playsnd
trigger1 = !time
value = 5, 8

[State 4001, Pause]
type = pause
trigger1 = animelemtime(2) >= 0 && animelemtime(34) < 0
time = 2
movetime = 2
[State 4001, Pause]
type = pause
trigger1 = animelemtime(34) = 0
time = 0

[State 4001, Push]
type = playerpush
trigger1 = 1
value = 0
[State 4001, NHB]
type = nothitby
trigger1 = animelemtime(35) < 0
value = SCA
time = 1
[State 4001, imageoff]
type = afterimagetime
trigger1 = animelemtime(5) > 0
time = 0

[State 4001, fadeout]
type = allpalfx
trigger1 = animelemtime(1) = 10
time = 30
sinadd = -255, -255, -255, 120

[State 4001, black]
type = envcolor
trigger1 = animelemtime(2) >= 0 && animelemtime(35) < -1
time = 2
value = 0, 0, 0

[State 4001, Assert]
type = assertspecial
trigger1 = animelemtime(2) >= 0 && animelemtime(35) < 0
flag = nobardisplay
flag2 = noFG
[State 4001, spr]
type = sprpriority
trigger1 = animelemtime(35) >= 0
value = 1
[State 4001, Bind]
type = targetbind
trigger1 = animelemtime(35) < 0
pos = 45, 0

[State 4001, hitadd]
type = hitadd
trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8 || animelem = 9
trigger2 = animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15
trigger3 = animelem = 16 || animelem = 17 || animelem = 18 || animelem = 19 || animelem = 20 || animelem = 21 || animelem = 22 || animelem = 23 || animelem = 24 || animelem = 25
trigger4 = animelem = 26 || animelem = 27 || animelem = 28 || animelem = 29 || animelem = 30 || animelem = 31 || animelem = 32 || animelem = 33 || animelem = 34
value = 1

[State 4001, Damage]
type = targetlifeadd
triggerall = numtarget
trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8 || animelem = 9 || animelem = 10
trigger2 = animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15 || animelem = 16 || animelem = 17
trigger3 = animelem = 18 || animelem = 19 || animelem = 20 || animelem = 21 || animelem = 22 || animelem = 23 || animelem = 24 || animelem = 25 || animelem = 26
trigger4 = animelem = 27 || animelem = 28 || animelem = 29 || animelem = 30 || animelem = 31 || animelem = 32 || animelem = 33 || animelem = 34
value = -ceil(ifelse(48 * fvar(11) < 7, 7, 48 * fvar(11)))
kill = animelem = 34
absolute = 1

[State 4001, Juggle]
type = varadd
trigger1 = animelem = 34
var(15) = 1

[State 4001, givepower]
type = targetpoweradd
triggerall = numtarget
trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8 || animelem = 9 || animelem = 10
trigger2 = animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15 || animelem = 16 || animelem = 17
trigger3 = animelem = 18 || animelem = 19 || animelem = 20 || animelem = 21 || animelem = 22 || animelem = 23 || animelem = 24 || animelem = 25 || animelem = 26
trigger4 = animelem = 27 || animelem = 28 || animelem = 29 || animelem = 30 || animelem = 31 || animelem = 32 || animelem = 33 || animelem = 34
value = 11

[State 4001, HitSound]
type = playsnd
trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8 || animelem = 9 || animelem = 10
trigger2 = animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15 || animelem = 16 || animelem = 17
trigger3 = animelem = 18 || animelem = 19 || animelem = 20 || animelem = 21 || animelem = 22 || animelem = 23 || animelem = 24 || animelem = 25 || animelem = 26
trigger4 = animelem = 27 || animelem = 28 || animelem = 29 || animelem = 30 || animelem = 31 || animelem = 32 || animelem = 33 || animelem = 34
value = 2, ifelse((animelem = 34), 10, 3)
channel = 2

[State 4001, Spark]
type = helper
triggerall = fvar(31)
triggerall = numtarget
trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8 || animelem = 9
trigger2 = animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15
trigger3 = animelem = 16 || animelem = 17 || animelem = 18 || animelem = 19 || animelem = 20 || animelem = 21 || animelem = 22 || animelem = 23 || animelem = 24 || animelem = 25
trigger4 = animelem = 26 || animelem = 27 || animelem = 28 || animelem = 29 || animelem = 30 || animelem = 31 || animelem = 32 || animelem = 33 || animelem = 34
helpertype = normal
stateno = 8012
ID = 8000
name = "Spark"
postype = p1
pos = 45 - 30 + (random % 61), (target, const(size.mid.pos.y)) - 30 + (random % 61)
facing = 1
ownpal = 1
size.xscale = 1
size.yscale = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State 4001, Spark]
type = explod
triggerall = !fvar(31)
triggerall = numtarget
trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8 || animelem = 9
trigger2 = animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15
trigger3 = animelem = 16 || animelem = 17 || animelem = 18 || animelem = 19 || animelem = 20 || animelem = 21 || animelem = 22 || animelem = 23 || animelem = 24 || animelem = 25
trigger4 = animelem = 26 || animelem = 27 || animelem = 28 || animelem = 29 || animelem = 30 || animelem = 31 || animelem = 32 || animelem = 33 || animelem = 34
anim = F3
ID = 8000
postype = p1
pos = 45, (target, const(size.mid.pos.y))
random = 60, 60
supermovetime = -1
pausemovetime = -1
ontop = 1
ownpal = 1

[State 4001, Shake]
type = envshake
trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8 || animelem = 9 || animelem = 10
trigger2 = animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15 || animelem = 16 || animelem = 17
trigger3 = animelem = 18 || animelem = 19 || animelem = 20 || animelem = 21 || animelem = 22 || animelem = 23 || animelem = 24 || animelem = 25 || animelem = 26
trigger4 = animelem = 27 || animelem = 28 || animelem = 29 || animelem = 30 || animelem = 31 || animelem = 32 || animelem = 33 || animelem = 34
time = 6
freq = 180
ampl = 2

[State 4001, Kanji]
type = explod
trigger1 = animelem = 35
anim = 6013
ID = 6013
sprpriority = 1
postype = p1
facing = ifelse(facing = 1, 1, -1)
pos = ifelse(facing = 1, 0, 32)
bindtime = -1
removeongethit = 1
ownpal = 1

[State 4001, Snd]
type = playsnd
trigger1 = animelemtime(35) = 10
value = 4, 9
channel = 0

[State 4001, Throw]
type = targetstate
trigger1 = animelemtime(34) >= 0 && numtarget
value = 1114003
persistent = 0

[State 4001, Assert]
type = assertspecial
trigger1 = animelemtime(34) >= 0 && animelemtime(35) <= 0
flag = nokoslow

[State 4001, Snd]
type = playsnd
trigger1 = animelem = 35 && !winko
value = 5, 5

[State 4001, Shake]
type = envshake
trigger1 = !winko
trigger1 = animelemtime(35) = 0 || animelemtime(35) = 8 || animelemtime(35) = 16
time = 8
freq = 180
ampl = ifelse(animelemtime(35) = 16, 1, ifelse(animelemtime(35) = 8, 2, 3))

[State 4001, Dust]
type = helper
trigger1 = animelem = 35 && !winko
helpertype = normal
stateno = 8110
ID = 8100
name = "Impact Dust"
postype = p1
pos = 45, 0
ownpal = 1

[State 4001, End]
type = changestate
trigger1 = animelemtime(35) >= 0 && animelemtime(36) < 0 && winko
value = 4090

[State 4001, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- TARGET ---
[Statedef 1114002]
type = S
physics = N
movetype = H
velset = 0, 0
ctrl = 0

[State 1114002, Anim]
type = changeanim2
trigger1 = !time
value = 4002

[State 1114002, Safety]
type = selfstate
trigger1 = time >= 180
value = 5040


[Statedef 1114003]
type = L
physics = C
movetype = H
velset = 0, 0
ctrl = 0

[State 1114003, Anim]
type = changeanim2
trigger1 = !time
value = 4003

[State 1114003, End]
type = selfstate
trigger1 = !alive
value = 5150

[State 1114003, End]
type = selfstate
trigger1 = time >= 97 && alive
value = 5120


;======================<MISOGI>=============================
[Statedef 4100]
type = S
physics = S
movetype = A
anim = 4100
ctrl = 0
velset = 0, 0
facep2 = 1
poweradd = -3000
sprpriority = 1

[State 4100, Custom Combo End]
type = palfx
trigger1 = !time
trigger1 = var(20) > 0
trigger1 = (var(20) := 0) || (var(15) := 0) || 1
time = 1

[State 4100, Strength]
type = varset
trigger1 = var(10) != 7
var(10) = 7
ignorehitpause = 1

[State 4100, Snd]
type = playsnd
trigger1 = !time
value = 4, 3
channel = 0

[State 4100, Super Pause FX]
type = helper
trigger1 = fvar(31)
trigger1 = time = 3
helpertype = normal
stateno = 7520
ID = 7500
name = "Superpause FX"
postype = p1
pos = ceil(-5 * const(size.xscale)), ceil(-45 * const(size.yscale))
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 4100, Super Pause]
type = superpause
trigger1 = time = 3
persistent = 0
time = 47
movetime = 47
anim = ifelse(fvar(31), -1, 102)
pos = ceil(-5 * const(size.xscale)), ceil(-45 * const(size.yscale))
sound = s0, 8520
p2defmul = 1 + (0 * (fvar(5) := 0))
darken = ifelse(fvar(31), 0, 1)

[State 4100, NHB]
type = nothitby
trigger1 = anim = 4100
time = 1
value = SCA

[State 4100, Illusion]
type = helper
trigger1 = anim = 4100 && time = 49
helpertype = normal
stateno = 4104
ID = 4104
name = "Misogi Illusion"
postype = p1
ownpal = 1
persistent = 0
pausemovetime = 999
supermovetime = 999

[State 4100, Anim]
type = changeanim
trigger1 = anim = 4100 && time = 50
value = 4101

[State 4100, Type]
type = statetypeset
trigger1 = anim != 4101
statetype = S
physics = S
[State 4100, Type]
type = statetypeset
trigger1 = anim = 4101
statetype = A
physics = N

[State 4100, Push]
type = playerpush
trigger1 = anim != 4100 && anim != 4103
value = 0
ignorehitpause = 1
[State 4100, sprpriority]
type = sprpriority
trigger1 = anim != 4100
value = -1
ignorehitpause = 1

[State 4100, Pos]
type = posadd
trigger1 = anim = 4101 && animelem = 1
x = p2dist x -10
y = p2dist y -240
[State 4100, Snd]
type = playsnd
trigger1 = anim = 4101 && animelem = 1
value = 5, 9
persistent = 0

[State 4100, Vel]
type = velset
trigger1 = anim = 4101 && animelemtime(2) < 0
x = 0
y = 0

[State 4100, Vel]
type = velset
trigger1 = anim = 4101 && animelem = 2
y = 20
[State 4100, Accel]
type = veladd
trigger1 = anim = 4101 && animelemtime(2) > 0
y = 0.5

[State 4100, Anim]
type = changeanim
trigger1 = anim = 4101 && animelemtime(2) > 3 && p2dist y < (enemynear, const(size.height) + 20)
trigger2 = anim = 4101 && animelemtime(1) > 0 && pos y > -30
value = 4101
elem = 3
persistent = 0
[State 4100, Snd]
type = playsnd
trigger1 = anim = 4101 && animelemtime(2) > 3 && p2dist y < (enemynear, const(size.height) + 20)
trigger2 = anim = 4101 && animelemtime(1) > 0 && pos y > -30
value = 4, 11
channel = 0
persistent = 0

[State 4100, particles]
type = explod
trigger1 = anim = 4101 && animelemtime(2) > 0
vel = 0, -4
anim = 4111
sprpriority = 3
postype = p1
pos = 3, -60
random = 40, 40
facing = -1 + (random < 500) * 2
scale = 0.5, 0.5
ownpal = 1

[State 4100, Hit]
type = hitdef
trigger1 = anim = 4101 && animelem = 3
attr = A, HA
damage = 420, 60
animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 0, 0
guard.pausetime = 0, 30
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
hitsound = -1 + 0 * (var(31) := 9)
guardsound = -1
ground.type = High
air.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -2, 0
air.velocity = 0, 20
yaccel = 0.4850
ground.cornerpush.veloff = 0
guard.velocity = 0;-10.52
guard.cornerpush.veloff = 0
getpower = 0
givepower = 40, 40
envshake.time = 12
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
fall = 1
fall.recover = 0
;p2stateno = ifelse(p2statetype = A, 1114110, 1114100)
sprpriority = -1
ID = 4100
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
forcestand = 1
palfx.mul = 256, 256, 256
palfx.time = 1

[State 4100, P2 State]
type = targetstate
trigger1 = time > 0
trigger1 = movehit && numtarget(4100)
trigger1 = (target(4100), stateno = 5000) || (target(4100), stateno = 5010)
value = 1114100
ID = 4100
ignorehitpause = 1
[State 4100, P2 State]
type = targetstate
trigger1 = time > 0
trigger1 = movehit && numtarget(4100)
trigger1 = (target(4100), stateno = 5020)
value = 1114110
ID = 4100
ignorehitpause = 1

[State 4100, cutFX]
type = explod
triggerall = anim = 4101 && animelemtime(3) >= 0 && movehit && numtarget
trigger1 = (target, time = 0) && (target, movetype = H)
anim = 4107
sprpriority = 4
postype = p2
facing = -1
pos = 0, 0
ownpal = 1
ignorehitpause = 1
persistent = 0

[State 4100, Anim]
type = changeanim
trigger1 = anim = 4101 && pos y >= -5
value = ifelse(movehit, 4102, 4103)
[State 4100, Stop]
type = posset
trigger1 = anim = [4102, 4103]
y = 0
[State 4100, Stop]
type = velset
trigger1 = anim = [4102, 4103]
y = 0

[State 4100, Shake]
type = envshake
trigger1 = (anim = 4102 || anim = 4103) && animelem = 1
time = ifelse((anim = 4102), 30, 15)
freq = 180
ampl = 3

[State 4100, Snd]
type = playsnd
trigger1 = anim = 4102 && animelem = 1
value = 5, 7
[State 4100, fire]
type = explod
trigger1 = anim = 4102 && animelem = 1
vel = 0, 0
anim = 4105
sprpriority = 4
postype = p1
pos = 0, 0
ownpal = 1

[State 4100, Snd]
type = playsnd
trigger1 = anim = 4103 && animelem = 1
value = 5, 10
[State 4100, fire]
type = explod
trigger1 = anim = 4103 && animelem = 1
vel = 0, 0
anim = 4106
sprpriority = 4
postype = p1
pos = 0, 0
ownpal = 1

[State 4100, Dust]
type = explod
trigger1 = (anim = 4102 || anim = 4103) && animelem = 1
anim = 7102
ID = 7102
sprpriority = -2
postype = p1
pos = 0, 0
vel = 0, 0
ownpal = 1
scale = 0.5, 0.5
ignorehitpause = 1
pausemovetime = -1
supermovetime = -1

[State 4100, Dust]
type = explod
trigger1 = anim = 4102 && animelemtime(1) = 13
vel = 0, 0
anim = 7107
ID = 7107
sprpriority = 5
postype = p1
pos = 0, 0
ownpal = 1

[State 4100, particles]
type = explod
trigger1 = anim = 4102 && animelemtime(1) >= 5 && animelemtime(1) < 17
vel = ceil(5 + random / 100), ceil(1 + random / 500)
accel = -0.4, -0.75
anim = 4108
sprpriority = 3
postype = p1
pos = 2, -40
random = 60, 60
facing = -1 + (random < 500) * 2
ownpal = 1
scale = 0.5, 0.1
[State 4100, particles]
type = explod
trigger1 = anim = 4102 && animelemtime(1) >= 3 && animelemtime(1) < 15
vel = -ceil(5 + random / 100), ceil(1 + random / 500)
accel = 0.4, -0.75
anim = 4108
sprpriority = 3
postype = p1
pos = 2, -40
random = 60, 60
facing = -1 + (random < 500) * 2
ownpal = 1
scale = 0.5, 0.1

[State Idle]
type = statetypeset
trigger1 = anim = 4102 || anim = 4103
movetype = I

[State 4100, End]
type = changestate
trigger1 = winko
trigger1 = anim = 4102
trigger1 = animelemtime(4) >= 0 && animelemtime(5) < 0
value = 4190

[State 4100, End]
type = changestate
trigger1 = (anim = [4102, 4103]) && !animtime
value = 0
ctrl = 1


;--- TARGET STANDING ---
[Statedef 1114100]
type = S
physics = C
movetype = H
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 1114100, NHB]
type = nothitby
trigger1 = 1
time = 1
value = SCA

[State 1114100, Anim]
type = changeanim
trigger1 = !time && selfanimexist(5950)
value = 5950
[State 1114100, Anim]
type = changeanim2
trigger1 = !time && !selfanimexist(5950)
value = 1114100

[State 1114100, Stop]
type = posset
trigger1 = 1
y = 0

[State 1114100, Dust]
type = explod
trigger1 = anim = 1114100 && animelem = 7
trigger2 = anim = 5950 && animtime = -4
anim = F60
pos = 0, 0
sprpriority = -10

[State 1114100, Snd]
type = playsnd
trigger1 = anim = 1114100 && animelem = 7
trigger2 = anim = 5950 && animtime = -4
value = f7, 0


[State 1114100, Type]
type = statetypeset
trigger1 = time = 60
statetype = L

[State 1114100, Anim]
type = changeanim
trigger1 = time >= 110 && selfanimexist(5111)
value = 5111

[State 1114100, End]
type = selfstate
trigger1 = time >= 110
value = ifelse(alive, 5120, 5150)


;--- TARGET MID-AIR ---
[Statedef 1114110]
type = A
physics = N
movetype = H
ctrl = 0
velset = gethitvar(xvel), gethitvar(yvel)
sprpriority = 1

[State 1114110, NHB]
type = nothitby
trigger1 = 1
time = 1
value = SCA

[State 1114110, Anim]
type = changeanim2
trigger1 = !time
value = 1114110

[State 1114110, Accel]
type = veladd
trigger1 = animelemtime(5) < 0
y = 0.4850;yaccel

[State 1114110, Stop]
type = posset
trigger1 = pos y > 0
y = 0

[State 1114110, Stop]
type = velset
trigger1 = pos y >= 0
y = 0

[State 1114110, Type]
type = statetypeset
trigger1 = pos y >= 0
statetype = L
physics = C

[State 1114110, Anim]
type = changeanim2
trigger1 = pos y >= 0
value = 1114110
elem = 5
persistent = 0

[State 1114110, Dust]
type = explod
trigger1 = animelem = 5
anim = F62
postype = p1
sprpriority = 10

[State 1114110, Snd]
type = playsnd
trigger1 = animelem = 5
value = f7, 2

[State 1114110, End]
type = selfstate
trigger1 = animelemtime(7) >= 110
value = ifelse(alive, 5120, 5150)


;======================<KONGOU KOKURETSU ZAN>=============================
[Statedef 4200]
type = S
physics = S
movetype = A
anim = 4200
ctrl = 0
velset = 0, 0
sprpriority = -1
facep2 = 1
poweradd = -2000

[State 4200, Custom Combo End]
type = palfx
trigger1 = !time
trigger1 = var(20) > 0
trigger1 = (var(20) := 0) || (var(15) := 0) || 1
time = 1

[State 4200, Strength]
type = varset
trigger1 = var(10) != 6
var(10) = 6
ignorehitpause = 1

[State 4200, Snd]
type = playsnd
trigger1 = time = 3
value = 3, 5
channel = 0

[State 4200, Super Pause FX]
type = helper
trigger1 = fvar(31)
trigger1 = time = 3
helpertype = normal
stateno = 7510
ID = 7500
name = "Superpause FX"
postype = p1
pos = ceil(-18 * const(size.xscale)), ceil(-126 * const(size.yscale))
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 4200, Super Pause]
type = superpause
trigger1 = time = 3
time = 45
movetime = 45
anim = ifelse(fvar(31), -1, 101)
pos = ceil(-18 * const(size.xscale)), ceil(-126 * const(size.yscale))
sound = s0, 8510
p2defmul = 1 + (0 * (fvar(5) := 0))
darken = ifelse(fvar(31), 0, 1)

[State 4200, NHB]
type = nothitby
trigger1 = animelemtime(16) < 0
time = 1
value = SCA
[State 4200, Push]
type = playerpush
trigger1 = animelemtime(17) < 0
value = 0
ignorehitpause = 1

[State 4200, Aura]
type = helper
trigger1 = animelem = 4
helpertype = normal
stateno = 4203
ID = 4203
name = "KKZ Aura"
postype = p1
ownpal = 1
supermovetime = 46

[State 4200, Shake]
type = envshake
trigger1 = animelemtime(15) >= 0 && animelemtime(15) <= 30
trigger1 = !(animelemtime(15) % 4)
time = 4
freq = 180
ampl = 6 - ceil(animelemtime(15) * 0.167)

[State 4200, Snd]
type = playsnd
trigger1 = animelem = 12
value = 4, 6
channel = 0
[State 4200, Snd]
type = playsnd
trigger1 = animelem = 15
value = 5, 15

[State 4200, lightning]
type = helper
trigger1 = animelem = 15
helpertype = normal
stateno = 4205
ID = 4205
name = "KKZ"
postype = p1
pos = -8, 16
ownpal = 1

[State 4200, shockwave1]
type = helper
trigger1 = animelemtime(15) = 12
helpertype = normal
stateno = 4206
ID = 4206
name = "KKZ"
postype = p1
facing = 1
pos = 0, 0
ownpal = 1

[State 4200, shockwave2]
type = helper
trigger1 = animelemtime(15) = 12
helpertype = normal
stateno = 4206
ID = 4206
name = "KKZ"
postype = p1
facing = -1
pos = 0, 0
ownpal = 1

[State 4200, shockwave3]
type = explod
trigger1 = animelemtime(15) = 12
anim = 4207
ID = 4207
postype = p1
sprpriority = -3
ownpal = 1

[State 4200, shockwave4]
type = explod
trigger1 = animelemtime(15) = 12
anim = 4207
ID = 4207
postype = p1
sprpriority = -3
ownpal = 1

[State 4200, Dust]
type = helper
trigger1 = animelemtime(15) = 1
helpertype = normal
stateno = 4210
ID = 4210
name = "Purple Dust"
postype = p1
pos = -8, 0
ownpal = 1

[State 4200, imageoff]
type = afterimagetime
trigger1 = animelemtime(17) >= 0
time = 0

[State Idle]
type = statetypeset
trigger1 = animelemtime(17) >= 0
movetype = I

[State 4200, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<TENSHOU KAIREKI JIN>=============================
[Statedef 4300]
type = S
physics = S
movetype = A
anim = 4300
ctrl = 0
velset = 0, 0
sprpriority = 1
facep2 = 1
poweradd = -2000

[State 4300, Custom Combo End]
type = palfx
trigger1 = !time
trigger1 = var(20) > 0
trigger1 = (var(20) := 0) || (var(15) := 0) || 1
time = 1

[State 4300, Strength]
type = varset
trigger1 = var(10) != 6
var(10) = 6
ignorehitpause = 1

[State 4300, Snd]
type = playsnd
trigger1 = time = 3
value = 4, 4
channel = 0

[State 4300, Super Pause FX]
type = helper
trigger1 = fvar(31)
trigger1 = time = 3
helpertype = normal
stateno = 7510
ID = 7500
name = "Superpause FX"
postype = p1
pos = ceil(-17 * const(size.xscale)), ceil(-5 * const(size.yscale))
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 4300, Super Pause]
type = superpause
trigger1 = time = 3
time = 45
movetime = 45
anim = ifelse(fvar(31), -1, 101)
pos = ceil(-17 * const(size.xscale)), ceil(-5 * const(size.yscale))
sound = s0, 8510
p2defmul = 1 + (0 * (fvar(5) := 0))
darken = ifelse(fvar(31), 0, 1)

[State 4300, NHB]
type = nothitby
trigger1 = anim = 4300 && animelemtime(7) < 0
time = 1
value = SCA
ignorehitpause = 1

[State 4300, Push]
type = playerpush
trigger1 = anim = 4300
trigger1 = animelemtime(6) >= 0 && animelemtime(7) < 0
value = 0
ignorehitpause = 1

[State 4300, Snd]
type = playsnd
trigger1 = anim = 4300 && animelem = 6
value = 3, 7
channel = 0

[State 4300, Vel]
type = posadd
trigger1 = anim = 4300 && animelemtime(6) = 1
x = 0
y = -180

[State 4300, Blur]
type = explod
trigger1 = anim = 4300
trigger1 = animelemtime(6) >= 0 && animelemtime(7) = -7
anim = 4303
ID = 4303
sprpriority = 1
postype = p1
pos = 0, 0
bindtime = 1
removetime = -2
removeongethit = 1
ownpal = 1

[State 4300, Vel]
type = velset
trigger1 = anim = 4300 && animelem = 7
x = 0
y = -2

[State 4300, Camera]
type = screenbound
trigger1 = anim = 4300 && animelemtime(6) >= 0
trigger2 = anim = 4301
value = 1
movecamera = 1, 1

[State 4300, Snd]
type = playsnd
trigger1 = anim = 4300 && animelem = 6
value = 5, 18

[State 4300, FX]
type = helper
trigger1 = anim = 4300 && animelem = 6
helpertype = normal
stateno = 4305
ID = 4305
name = "Tenshou Kaireki Jin"
postype = p1
pos = 40, -ceil(pos y)
supermovetime = 3
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 4300, Dust]
type = explod
trigger1 = anim = 4300 && animelem = 6
anim = 7106
sprpriority = 3
postype = p1
pos = 0, -ceil(pos y)
facing = 1
ownpal = 1

[State 4300, Anim]
type = changeanim
trigger1 = anim = 4300 && !animtime
value = 4301

[State 4300, Type]
type = statetypeset
trigger1 = anim = 4300 && animelemtime(6) >= 0
statetype = A
physics = N

[State 4300, Type]
type = statetypeset
trigger1 = anim = 4301
statetype = A
physics = N

[State 4300, Type]
type = veladd
trigger1 = anim = 4301
y = 0.5

[State Idle]
type = statetypeset
trigger1 = anim = 4301
movetype = I

[State Land]
type = changestate
trigger1 = statetype = A
trigger1 = vel y > 0 && (pos y > -vel y)
value = 1259
