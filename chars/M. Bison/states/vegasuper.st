; _______________________________
;| Vega by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;============================================================================================
;======================================<SUPER STATES>========================================
;============================================================================================

;======================<NIGHTMARE BOOSTER>=============================
[Statedef 3000]
type = S
physics = S
movetype = A
ctrl = 0
anim = 3000
velset = 0, 0
poweradd = -1000
sprpriority = 1
facep2 = 1

[State 3000, Custom Combo End]
type = palfx
trigger1 = !time
trigger1 = var(20) > 0
trigger1 = (var(20) := 0) || (var(15) := 0) || 1
time = 1
[State 3000, Pos]
type = posset
trigger1 = !time
y = 0

[State 3000, Strength]
type = varset
trigger1 = var(10) != 5
var(10) = 5
ignorehitpause = 1

[State 3000, Snd]
type = playsnd
trigger1 = time = 3
value = 3, 7
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
pos = ceil(-21 * const(size.xscale)), ceil(-67 * const(size.yscale))
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
pos = ceil(-21 * const(size.xscale)), ceil(-67 * const(size.yscale))
sound = s0, 8500
p2defmul = 1 + (0 * (fvar(5) := 0))
darken = ifelse(fvar(31), 0, 1)

[State 3000, NHB]
type = nothitby
trigger1 = animelemtime(6) < 0
time = 1
value = SCA
ignorehitpause = 1

[State 3000, NHB]
type = nothitby
trigger1 = numhelper(1007)
trigger1 = animelemtime(6) >= 0
value = , NP
time = 1
ignorehitpause = 1

[State 3000, Shield]
type = helper
trigger1 = !numhelper(1007)
trigger1 = animelemtime(6) >= 0
helpertype = normal
stateno = 1007
ID = 1007
name = "Projectile Hitter"
postype = p1

[State 3000, Vel]
type = velset
trigger1 = animelemtime(4) >= 0
x = 8
y = 0

[State 3000, Type]
type = statetypeset
trigger1 = animelemtime(4) >= 0
statetype = A
physics = N

[State 3000, Snd]
type = playsnd
trigger1 = animelem = 4
value = 0, 40
[State 3000, Dust]
type = explod
trigger1 = animelem = 4
anim = 7100
ID = 7100
sprpriority = 3
postype = p1
pos = 0, ceil(pos y)
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1

[State 3000, Snd]
type = playsnd
trigger1 = animelem = 5
value = 5, 4

[State 3000, FX]
type = helper
trigger1 = animelemtime(4) >= 0 && !(animelemtime(4) % 5)
trigger1 = !movecontact && !movereversed
helpertype = normal
stateno = 3005
ID = 3005
name = "Psycho Crusher FX"
postype = p1
pos = 68, -60
ownpal = 1
pausemovetime = 999
supermovetime = 999

[State 3000, Hit]
type = hitdef
trigger1 = animelem = 6
trigger1 = var(15) < 2
attr = S, HA
damage = 30, 4
animtype = Medium
fall.animtype = Medium
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 8, 8
guard.pausetime = 12, 12
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 0) * (var(36) := 75), var(37) := -59
hitsound = -1 + 0 * (var(31) := 3)
guardsound = -1
ground.type = Low
ground.slidetime = 18
ground.hittime = 18
ground.velocity = -10.52, 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
air.type = Low
air.velocity = -2, -2
getpower = 0
givepower = 40, 40
forcestand = 1
envshake.time = 12
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
palfx.sinadd = 64, 64, 64, 4
palfx.mul = 128, 128, 128
palfx.time = 60
air.fall = 1
fall.recover = 0
ID = 3000
yaccel = 0.4850
kill = 0
guard.kill = 1

[State 3000, Flame Particles]
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
size.height = 100
ignorehitpause = 1

[State 3000, P1 State]
type = changestate
trigger1 = movecontact || movereversed
value = ifelse(movehit, 3001, 3003)

[State 3000, End]
type = changestate
trigger1 = animelemtime(6) >= 1
trigger1 = frontedgebodydist <= 10
trigger2 = time >= 120
value = 3002


;--- Spinning ---
[Statedef 3001]
type = A
physics = N
movetype = A
ctrl = 0
anim = 3001
sprpriority = 1

[State 3001, Snd]
type = playsnd
trigger1 = !time
value = 4, 12
channel = 0

[State 3001, Vel]
type = velset
trigger1 = 1
x = 8
y = 0

[State 3001, Hit]
type = hitdef
trigger1 = !(movecontact % 8) && !movereversed
trigger2 = !(movereversed % 8) && !movecontact
attr = S, HA
damage = 30, 4
animtype = Medium
fall.animtype = Medium
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 0, 8
guard.pausetime = 0, 8
sparkno = -1 + 0 * (var(33) := ifelse(hitcount >= 4, 8012, 8014))
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 60) * (var(36) := 75), var(37) := -59
hitsound = -1 + 0 * (var(31) := 3)
guardsound = -1
ground.type = Low
ground.slidetime = 18
ground.hittime = 18
ground.velocity = -10.52, 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
air.type = Low
air.velocity = -2, -2
getpower = 0
givepower = 40, 40
forcestand = 1
envshake.time = 12
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
palfx.sinadd = 64, 64, 64, 4
palfx.mul = 128, 128, 128
palfx.time = 60
air.fall = 1
fall.recover = 0
ID = 3000
yaccel = 0.4850
kill = 0
guard.kill = 1

[State 3001, Flame Particles]
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

[State 3001, P2 State]
type = targetdrop
trigger1 = numtarget(3001) > 1
ID = 3000
keepone = 1
excludeID = 3000
ignorehitpause = 1

[State 3001, P2 State]
type = targetstate
trigger1 = movehit = 1 && numtarget(3000) = 1
trigger1 = hitcount >= 5
ID = 3000
value = 3020

[State 3001, p1state]
type = changestate
trigger1 = movehit = 1 && numtarget(3000) = 1
trigger1 = hitcount >= 5
value = 3010

[State 3001, End]
type = changestate
trigger1 = time >= 60
value = 3002


;--- Miss ---
[Statedef 3002]
type = A
physics = S
movetype = I
ctrl = 0
anim = 3002
velset = 0, 0
sprpriority = 1

[State 3002, End]
type = changeanim
trigger1 = anim = 1001 && !animtime
value = 1002

[State 3002, Vel]
type = velset
trigger1 = animelem = 3
x = 0
y = 0

[State 3002, Pos]
type = posset
trigger1 = 1
y = 0

[State 3002, Type]
type = statetypeset
trigger1 = animelem = 3
statetype = S
physics = S

[State 3002, Snd]
type = playsnd
trigger1 = animelem = 3
value = 0, 52
persistent = 0

[State 3002, Dust]
type = explod
trigger1 = animelem = 3
anim = 7102
ID = 7102
sprpriority = -2
postype = p1
scale = 0.5, 0.5
ownpal = 1
persistent = 0
pausemovetime = -1
supermovetime = -1

[State 3002, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- Blocked ---
[Statedef 3003]
type = A
physics = N
movetype = I
anim = 3003
ctrl = 0
velset = -1.5, -10

[State 3003, posfix]
type = posadd
trigger1 = !time
x = 20

[State 3003, Accel]
type = veladd
trigger1 = 1
y = 0.55

[State 3003, Land]
type = changestate
trigger1 = statetype = A
trigger1 = vel y > 0 && (pos y > -vel y)
value = 52


;--- Flying ---
[Statedef 3010]
type = A
physics = N
movetype = A
ctrl = 0
anim = 3010
velset = 0, 0
sprpriority = 1

[State 3010, Rotate]
type = offset
trigger1 = 1
x = 0
y = -60

[State 3010, Rotate]
type = angledraw
trigger1 = time < 45
value = time * 6

[State 3010, Rotate]
type = angledraw
trigger1 = time >= 45
value = 270

[State 3010, Vel]
type = velset
trigger1 = time = [0, 14]
x = 16 * cos(time / 30.0 * pi)
y = -12 * sin(time / 30.0 * pi)

[State 3010, Vel]
type = velset
trigger1 = time = [15, 45]
x = 8 * cos(time / 30.0 * pi)
y = -12 * sin(time / 30.0 * pi)

[State 3010, Throw]
type = targetfacing
trigger1 = !time
value = -1

[State 3010, Bind 2]
type = targetbind
trigger1 = time < 45
pos = 68 * cos(time / 30.0 * pi), -60 -60 * sin(time / 30.0 * pi)

[State 3010, Bind 2]
type = targetbind
trigger1 = time = 45
pos = 0, 0

[State 3010, Vel]
type = velset
trigger1 = time >= 45
x = 0
y = 0

[State 3010, Fake Hit]
type = hitadd
trigger1 = time = 45
value = 1

[State 3010, Juggle]
type = varadd
trigger1 = time = 45
var(15) = 1

[State 3010, Fake Hit]
type = playsnd
trigger1 = time = 45
value = 2, 3
channel = 2

[State 3010, Damage]
type = targetlifeadd
trigger1 = time = 45
value = -ceil(30 * fvar(11))
kill = 0

[State 3010, Damage]
type = targetpoweradd
trigger1 = time = 45
value = 40;givepower

[State 3010, Spark]
type = helper
trigger1 = fvar(31)
trigger1 = numtarget
trigger1 = time = 45
helpertype = normal
stateno = 8012
ID = 8000
name = "Spark"
postype = p1
pos = 0, 10
facing = 1
ownpal = 1
size.xscale = 1
size.yscale = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State 3010, Spark]
type = explod
trigger1 = !fvar(31)
trigger1 = numtarget
trigger1 = time = 45
anim = F3
ID = 8000
postype = p1
pos = -5, 70
supermovetime = -1
pausemovetime = -1
ontop = 1
ownpal = 1

[State 3010, Shake]
type = envshake
trigger1 = numtarget
trigger1 = time = 45
time = 12
ampl = 2
freq = 180

[State 3010, P2 State]
type = targetstate
trigger1 = numtarget
trigger1 = time = 45
ID = 3000
value = 3021

[State 3010, Freeze Anim]
type = changeanim
trigger1 = numtarget
trigger1 = time >= 45
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
value = 3010
elem = 2

[State 3010, End]
type = changestate
trigger1 = time >= 60
value = 3011


;--- Stomping ---
[Statedef 3011]
type = A
physics = N
movetype = A
ctrl = 0
anim = 3011
velset = 0, 0
sprpriority = 1

[State 3011, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = 1, 0

[State 3011, Rotate]
type = offset
trigger1 = !time
x = 0
y = 0

[State 3011, Rotate]
type = angledraw
trigger1 = !time
value = 0

[State 3011, Push]
type = playerpush
trigger1 = 1
value = 0

[State 3011, Accel]
type = veladd
trigger1 = animelemtime (6) >= 0
y = 1

[State 3011, End]
type = changestate
trigger1 = vel y > 0 && (pos y > -vel y)
value = 3012


;--- Stomp ---
[Statedef 3012]
type = S
physics = N
movetype = A
ctrl = 0
anim = 3012
velset = 0, 0
sprpriority = 1

[State 3012, Push]
type = playerpush
trigger1 = animelemtime(10) < 0
value = 0
ignorehitpause = 1

[State 3012, Pos]
type = offset
trigger1 = animelemtime(6) < 0
trigger1 = numtarget(3012)
y = -(target(3012), const(size.ground.front))
ignorehitpause = 1

[State 3012, Pos]
type = offset
trigger1 = animelemtime(6) >= 0 && animelemtime(7) < 0
trigger1 = numtarget(3012)
y = ceil(-0.5 * (target(3012), const(size.ground.front)))

[State 3012, Pos]
type = posset
trigger1 = 1
y = 0

[State 3012, Vel]
type = velset
trigger1 = animelem = 5
x = -5

[State 3012, Snd]
type = playsnd
trigger1 = animelem = 5
value = 0, 105

[State 3012, Vel]
type = velset
trigger1 = animelem = 12
x = 0

[State 3012, Snd]
type = playsnd
trigger1 = animelem = 12
value = 0, 52

[State 3012, Dust]
type = explod
trigger1 = animelem = 12
anim = 7102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 3012, Snd]
type = playsnd
trigger1 = !time
value = 5, 7

[State 3012, Dust]
type = explod
trigger1 = !time
anim = 7100
ID = 7100
sprpriority = 1
postype = p1
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 3012, Dust]
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

[State 3012, Shake]
type = envshake
trigger1 = !time
time = 18
freq = 180
ampl = 2

[State 3012, Hit]
type = hitdef
trigger1 = !time
attr = S, HA
hitflag = MAFD
guardflag = M
priority = 4, Hit
damage = 30, 4
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
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = -4, -6
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = -4, -6
air.cornerpush.veloff = 0
yaccel = 0.4850
fall = 1
air.fall = 1
fall.recover = 1
fall.recovertime = 120
forcestand = 1
hitsound = -1 + 0 * (var(31) := 6)
guardsound = s2,0
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := -20) * (var(36) := 20), var(37) := -10
envshake.time = 12
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.freq = 180
down.velocity = 0, 0
ID = 3012

[State 3012, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- Target taken for a ride ---
[Statedef 3020]
type = A
movetype = H
physics = N
velset = 0, 0
sprpriority = -1

[State 3020, Anim]
type = changeanim2
trigger1 = 1
value = 3020

[State 3020, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = 0, 0

[State 3020, Rotate]
type = angledraw
trigger1 = time < 45
value = time * -6

[State 3020, Rotate]
type = angledraw
trigger1 = time >= 45
value = -270

[State 3020, Safety]
type = selfstate
trigger1 = time >= 180
value = 5040


;--- Target falling ---
[Statedef 3021]
type = A
movetype= H
physics = N
velset = 0, 8

[State 3021, Rotate]
type = angledraw
trigger1 = !time
value = 0

[State 3021, 1]
type = ChangeAnim
trigger1 = !time
value = 5080

[State 3021, Pos]
type = posadd
trigger1 = !time
y = const(size.ground.back)

[State 3021, 3]
type = VelAdd
trigger1 = 1
y = 0.4850;yaccel

[State 3021, 6]
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= -vel y
value = 3022


;--- Target fallen ---
[Statedef 3022]
type = L
movetype= H
physics = N
velset = 0, 0

[State 3022, EnvShake]
type = envshake
trigger1 = !time
time = 12
freq = 180
ampl = 1

[State 3022, 2]
type = changeanim
trigger1 = !time
value = 5100

[State 3022, 4]
type = PosSet
trigger1 = 1
y = 0

[State 3022, 7]
type = Changeanim
trigger1 = anim = 5100 && !animtime
value = 5110

[State 3022, 8]
type = Explod
trigger1 = Time = 1
anim = F(60 + (sysvar(1) > Const720p(20)) + (sysvar(1) > Const720p(56)))
pos = 0, 0
sprpriority = ifelse (sysvar(1) <= Const720p(56), -10, 10)

[State 3022, 10]
type = PlaySnd
trigger1 = Time = 1
value = F7, (sysvar(1) > Const720p(20)) + (sysvar(1) > Const720p(56))

[State 3022, 12]
type = selfstate
trigger1 = time >= 60
value = 5120


;======================<PSYCHO BREAK SMASHER>=============================
[Statedef 3050]
type = S
physics = S
movetype = A
ctrl = 0
anim = 3050
velset = 0, 0
poweradd = -2000
sprpriority = 1
facep2 = 1

[State 3050, Custom Combo End]
type = palfx
trigger1 = !time
trigger1 = var(20) > 0
trigger1 = (var(20) := 0) || (var(15) := 0) || 1
time = 1

[State 3050, Pos]
type = posset
trigger1 = !time
y = 0

[State 3050, Strength]
type = varset
trigger1 = var(10) != 6
var(10) = 6
ignorehitpause = 1

[State 3050, Snd]
type = playsnd
trigger1 = time = 3
value = 4, 10
channel = 0

[State 3050, Super Pause FX]
type = helper
trigger1 = fvar(31)
trigger1 = time = 3
helpertype = normal
stateno = 7510
ID = 7500
name = "Superpause FX"
postype = p1
pos = ceil(24 * const(size.xscale)), ceil(-91 * const(size.yscale))
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3050, Super Pause]
type = superpause
trigger1 = time = 3
time = 45
movetime = 45
anim = ifelse(fvar(31), -1, 101)
pos = ceil(24 * const(size.xscale)), ceil(-91 * const(size.yscale))
sound = s0, 8510
p2defmul = 1 + (0 * (fvar(5) := 0))
darken = ifelse(fvar(31), 0, 1)

[State 3050, Push]
type = playerpush
trigger1 = anim = 3050 && animelemtime(13) >= 0
value = 0
ignorehitpause = 1

[State 3050, NHB]
type = nothitby
trigger1 = anim = 3050 && animelemtime(13) >= 0
value = , NP, SP
time = 1
ignorehitpause = 1
[State 3050, shield]
type = helper
trigger1 = !numhelper(1007)
trigger1 = anim = 3050 && animelemtime(13) >= 0
helpertype = normal
stateno = 1007
ID = 1007
name = "Projectile Hitter"
postype = p1

[State 3050, NHB]
type = nothitby
trigger1 = anim = 3050 && time < 64
time = 1
value = SCA
ignorehitpause = 1

[State 3050, Hit Var]
type = varset
trigger1 = !time
var(14) = 0
[State 3050, Hit Var]
type = varadd
trigger1 = movehit = 1 || moveguarded = 1 || movereversed = 1
var(14) = 1

[State 3050, Vel]
type = velset
trigger1 = anim = 3050 && animelemtime(11) >= 0
x = 10
y = 0
[State 3050, Vel]
type = velset
trigger1 = anim = 3050 && animelemtime(11) >= 0 && var(14) < 9
trigger1 = (movecontact = [1, 3]) || (movereversed = [1, 3])
x = 0
y = 0

[State 3050, Type]
type = statetypeset
trigger1 = anim = 3050 && animelemtime(11) >= 0
statetype = A
physics = N

[State 3050, Snd]
type = playsnd
trigger1 = anim = 3050 && animelem = 11
value = 0, 40
[State 3050, Dust]
type = explod
trigger1 = anim = 3050 && animelem = 11
anim = 7100
ID = 7100
sprpriority = 3
postype = p1
pos = 0, ceil(pos y)
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1

[State 3050, Snd]
type = playsnd
trigger1 = anim = 3050 && animelem = 11
value = 4, 5
channel = 0
[State 3050, Snd]
type = playsnd
trigger1 = anim = 3050 && animelem = 13
value = 5, 5

[State 3050, FX]
type = helper
trigger1 = !numhelper(3060)
trigger1 = anim = 3050 && animelemtime(13) >= 0
helpertype = normal
stateno = 3060
ID = 3060
name = "Psycho Crusher"
postype = p1
ownpal = 1
pausemovetime = 999
supermovetime = 999

[State 3050, Hit]
type = hitdef
triggerall = var(15) < 9
triggerall = anim = 3050 && animelemtime(13) >= 0
trigger1 = !(movecontact % 4) && !movereversed
trigger2 = !(movereversed % 4) && !movecontact
attr = S, HA
damage = 160 / (hitcount + 1), 7
animtype = Diagup
fall.animtype = Diagup
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 4, 8
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 0) * (var(36) := 75), var(37) := -59
hitsound = -1 + 0 * (var(31) := 3)
guardsound = -1
ground.type = Low
ground.slidetime = 18
ground.hittime = 18
ground.velocity = -6, -6
ground.cornerpush.veloff = 0
air.type = Low
air.velocity = -6, -6
getpower = 0
givepower = 40, 40
forcestand = 1
envshake.time = 12
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
palfx.sinadd = 64, 64, 64, 4
palfx.mul = 128, 128, 128
palfx.time = 60
fall = 1
fall.recover = 0
ID = 3050
yaccel = 0.4850

[State 3050, Burned]
type = targetstate
trigger1 = movehit
trigger1 = numtarget(3050)
trigger1 = target, selfanimexist(7697)
trigger1 = (target(3050), stateno = 5000) || (target(3050), stateno = 5010) || (target(3050), stateno = 5020)
value = 7697
ID = 3050
ignorehitpause = 1

[State 3050, Flame Particles]
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
size.height = 80
ignorehitpause = 1

[State 3050, Anim]
type = changeanim
trigger1 = anim = 3050 && (animelemtime(12) >= 85)
trigger2 = anim = 3050 && (animelemtime(12) >= 10) && (frontedgebodydist <= 0)
value = 3051

[State 3050, Vel]
type = velmul
trigger1 = anim = 3051
x = 0.85
[State 3050, End]
type = changeanim
trigger1 = anim = 3051 && !animtime
value = 1002

[State 3050, Vel]
type = velset
trigger1 = anim = 1002
x = 0
y = 0
[State 3050, Pos]
type = posset
trigger1 = anim = 1002
y = 0
[State 3050, Type]
type = statetypeset
trigger1 = anim = 1002
statetype = S
physics = S

[State 3050, Snd]
type = playsnd
trigger1 = anim = 1002
value = 0, 52
persistent = 0
[State 3050, Dust]
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
trigger1 = anim = [1001, 1002]
movetype = I

[State 3050, End]
type = changestate
trigger1 = anim = 1002 && !animtime
value = 0
ctrl = 1


;======================<KNEE PRESS NIGHTMARE>=============================
[Statedef 3100]
type = S
physics = S
movetype = A
ctrl = 0
anim = 3100
velset = 0, 0
poweradd = -1000
sprpriority = 1
facep2 = 1

[State 3100, Custom Combo End]
type = palfx
trigger1 = !time
trigger1 = var(20) > 0
trigger1 = (var(20) := 0) || (var(15) := 0) || 1
time = 1

[State 3100, Pos]
type = posset
trigger1 = !time
y = 0

[State 3100, Strength]
type = varset
trigger1 = var(10) != 5
var(10) = 5
ignorehitpause = 1

[State 3100, Snd]
type = playsnd
trigger1 = time = 3
value = 4, 11
channel = 0

[State 3100, Super Pause FX]
type = helper
trigger1 = fvar(31)
trigger1 = time = 3
helpertype = normal
stateno = 7500
ID = 7500
name = "Superpause FX"
postype = p1
pos = ceil(20 * const(size.xscale)), ceil(-23 * const(size.yscale))
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3100, Super Pause]
type = superpause
trigger1 = time = 3
time = 43
movetime = 43
anim = ifelse(fvar(31), -1, 100)
pos = ceil(20 * const(size.xscale)), ceil(-23 * const(size.yscale))
sound = s0, 8500
p2defmul = 1 + (0 * (fvar(5) := 0))
darken = ifelse(fvar(31), 0, 1)

[State 3100, NHB]
type = nothitby
trigger1 = animelemtime(4) < 0
time = 1
value = SCA
ignorehitpause = 1

[State 3100, Anim]
type = changeanim
triggerall = vel y > 0 && vel y > 0 && (pos y > -vel y)
trigger1 = animelemtime(5) >= 0 && animelemtime(6) < 0
trigger2 = animelemtime(11) >= 0 && animelemtime(12) < 0
value = 3100
elem = animelemno(0) + 1

[State 3100, Snd]
type = playsnd
trigger1 = (animelem = 2 || animelem = 8)
value = 0, 40
[State 3100, Dust]
type = explod
trigger1 = (animelem = 2 || animelem = 8)
anim = 7100
ID = 7100
sprpriority = 3
postype = p1
pos = 0, ceil(pos y)
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1

[State 3100, Vel]
type = velset
trigger1 = (animelem = 2 || animelem = 8)
x = ifelse((animelem = 2), 5, 7.5)
y = -2.5
[State 3100, Vel]
type = velset
trigger1 = animelem = 16
x = 25
[State 3100, Vel]
type = velset
trigger1 = animelemtime(6) >= 0 && animelemtime(8) < 0
x = 0
y = 0
[State 3100, Vel]
type = velset
trigger1 = animelemtime(12) >= 0
y = 0

[State 3100, Type]
type = statetypeset
trigger1 = animelemtime(2) >= 0 && animelemtime(6) < 0
trigger2 = animelemtime(8) >= 0 && animelemtime(12) < 0
statetype = A
physics = N
[State 3100, Type]
type = statetypeset
trigger1 = animelemtime(6) >= 0 && animelemtime(8) < 0
trigger2 = animelemtime(12) >= 0
statetype = S
physics = S
[State 3100, Accel]
type = veladd
trigger1 = animelemtime(2) >= 0 && animelemtime(6) < 0
trigger2 = animelemtime(8) >= 0 && animelemtime(12) < 0
y = 0.25

[State 3100, Pos]
type = posset
trigger1 = animelemtime(6) >= 0 && animelemtime(8) < 0
trigger2 = animelemtime(12) >= 0
y = 0

[State 3100, Snd]
type = playsnd
trigger1 = animelem = 3 || animelem = 9
value = 1, 6
channel = 1
[State 3100, Snd]
type = playsnd
trigger1 = animelem = 15
value = 5, 8
channel = 1

[State 3100, Snd]
type = playsnd
trigger1 = animelem = 6 || animelem = 12
value = 0, 52
[State 3100, Dust]
type = explod
trigger1 = animelem = 6 || animelem = 12
anim = 7102
ID = 7102
sprpriority = -2
postype = p1
scale = 0.5, 0.5
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 3100, Hit High]
type = hitdef
trigger1 = animelem = 4 || animelem = 10
trigger1 = var(15) < (1 + hitcount)
attr = S, HA
damage = 50, 5
animtype = Medium
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 4, 12
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 80), var(37) := -85
hitsound = -1 + 0 * (var(31) := 6)
guardsound = -1
ground.type = Low
ground.slidetime = 20
ground.hittime = 20
ground.velocity = -7, 0
air.type = Low
air.velocity = -3, -4.5
air.cornerpush.veloff = 0
getpower = 0
givepower = 40, 40
forcestand = 1
envshake.time = 12
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
fall = 0
air.fall = 1
fall.recover = 0
yaccel = 0.4850

[State 3100, Hit Low]
type = hitdef
trigger1 = animelem = 5 || animelem = 11
trigger1 = var(15) < (1 + hitcount)
attr = S, HA
damage = 50, 5
animtype = Hard
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 4, 12
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 22) * (var(36) := 66), var(37) := -26
hitsound = -1 + 0 * (var(31) := 6)
guardsound = -1
ground.type = Low
ground.slidetime = 20
ground.hittime = 20
ground.velocity = -7, 0
air.type = Low
air.velocity = -3, -4.5
air.cornerpush.veloff = 0
getpower = 0
givepower = 40, 40
forcestand = 1
envshake.time = 12
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
fall = 0
air.fall = 1
fall.recover = 0
yaccel = 0.4850

[State 3100, Hit Slide]
type = hitdef
trigger1 = animelem = 16
trigger1 = var(15) < (1 + hitcount)
attr = C, HA
damage = 50, 5
animtype = Hard
guardflag = L
hitflag = MAFD
priority = 4, Hit
pausetime = 12, 12
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 0) * (var(36) := 52), var(37) := -20
hitsound = -1 + 0 * (var(31) := 6)
guardsound = -1
ground.type = Trip
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -4, -4
air.type = Low
air.velocity = -4, -4
air.cornerpush.veloff = 0
down.hittime = 20
down.velocity = 0, 0
getpower = 0
givepower = 40, 40
envshake.time = 12
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
fall = 1
fall.recover = 0
yaccel = 0.4850
forcestand = 1

[State Idle]
type = statetypeset
trigger1 = animelemtime(17) >= 0
movetype = I

[State 3100, Kicks]
type = changestate
trigger1 = animelem = 14
trigger1 = movehit = [1, 14]
value = 3110

[State 3100, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- Kicks ---
[Statedef 3110]
type = A
physics = N
movetype = A
ctrl = 0
anim = 3110
velset = 0, 0
sprpriority = 1

[State 3110, Vel]
type = velset
trigger1 = animelemtime(2) >= 0 && animelemtime(12) < 0
x = 4

[State 3110, Snd]
type = playsnd
trigger1 = animelem = 11
value = 3, 1
channel = 0

[State 3100, Snd]
type = playsnd
trigger1 = animelem = 2 || animelem = 7 || animelem = 9 || animelem = 12
value = 1, 6
channel = 1

[State 3110, Hit]
type = hitdef
trigger1 = animelem = 2 || animelem = 7 || animelem = 9
attr = A, HA
damage = 25, 3
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse((animelem = 2), 8, 4), 12
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 10) * (var(36) := 36), var(37) := -79
hitsound = -1 + 0 * (var(31) := 5)
guardsound = -1
air.type = Low
ground.type = High
ground.slidetime = 20
ground.hittime = 20
ground.velocity = -4.49, 0
ground.cornerpush.veloff = 0;-8.17
air.velocity = -6, -3.5
air.cornerpush.veloff = 0
getpower = 0
givepower = 40, 40
forcestand = 1
envshake.time = 12
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
fall = 0
air.fall = 1
fall.recover = 0
yaccel = 0.4850

[State 3110, Hit]
type = hitdef
trigger1 = animelem = 12
attr = A, HA
damage = 25, 3
animtype = Diagup
fall.animtype = Diagup
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 12, 12
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 80), var(37) := -86
hitsound = -1 + 0 * (var(31) := 6)
guardsound = -1
air.type = Low
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -8, -4
guard.velocity = -7.51
ground.cornerpush.veloff = 0;-10.47
air.velocity = -8, -4
air.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
guard.velocity = -10.52
getpower = 0
givepower = 40, 40
forcestand = 1
envshake.time = 12
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
fall = 1
fall.recover = 0
yaccel = 0.4850

[State 3110, Accel]
type = veladd
trigger1 = animelemtime(13) >= 0
y = 0.5
[State 3110, Vel]
type = velset
trigger1 = animelem = 13
x = -4
y = -8
[State 3110, Type]
type = statetypeset
trigger1 = animelemtime(13) >= 0
movetype = I

[State 3110, End]
type = changestate
trigger1 = animelemtime(13) >= 0
trigger1 = vel y > 0 && (pos y > -vel y)
value = 3111


;--- Land ---
[Statedef 3111]
type = S
physics = S
ctrl = 0
anim = 1103
velset = 0, 0

[State 3111, Pos]
type = posset
trigger1 = 1
y = 0

[State 3111, Snd]
type = playsnd
trigger1 = !time
value = 0, 52

[State 3111, Dust]
type = explod
trigger1 = !time
anim = 7102
ID = 7102
sprpriority = -2
postype = p1
scale = 0.5, 0.5
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 3111, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<PSYCHO CANNON>=============================
[Statedef 3200]
type = S
physics = S
movetype = A
ctrl = 0
anim = 3200
velset = 0, 0
poweradd = -1000
sprpriority = 1
facep2 = 1

[State 3200, Custom Combo End]
type = palfx
trigger1 = !time
trigger1 = var(20) > 0
trigger1 = (var(20) := 0) || (var(15) := 0) || 1
time = 1

[State 3200, Pos]
type = posset
trigger1 = !time
y = 0

[State 3200, Strength]
type = varset
trigger1 = var(10) != 5
var(10) = 5
ignorehitpause = 1

[State 3200, Snd]
type = playsnd
trigger1 = time = 3
value = 4, 14
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
pos = ceil(47 * const(size.xscale)), ceil(-70 * const(size.yscale))
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
pos = ceil(47 * const(size.xscale)), ceil(-70 * const(size.yscale))
sound = s0, 8500
p2defmul = 1 + (0 * (fvar(5) := 0))
darken = ifelse(fvar(31), 0, 1)

[State 3200, NHB]
type = nothitby
trigger1 = 1
time = 1
value = SCA
ignorehitpause = 1

[State 3200, End]
type = changestate
trigger1 = !animtime
value = 3201


;--- Charging ---
[Statedef 3201]
type = S
physics = S
movetype = A
ctrl = 0
anim = 3201
velset = 0, 0
sprpriority = 1

[State 3201, Charge]
type = varset
trigger1 = !time
var(0) = 0

[State 3201, Fireball]
type = helper
trigger1 = !time
helpertype = normal
stateno = 3209
ID = 3210
name = "Psycho Cannon"
postype = p1
pos = 48, -90
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 3201, Snd]
type = playsnd
trigger1 = time = 20
value = 3, 7
channel = 0

[State 3201, End]
type = changestate
trigger1 = time >= 180 || roundstate != 2
trigger2 = command != "holdx" && command != "holdy" && command != "holdz"
trigger3 = numhelper(3210)
trigger3 = helper(3210), stateno = 3209
trigger3 = helper(3210), moveguarded || helper(3210), movereversed
value = 3202

[State 3201, End]
type = changestate
trigger1 = time >= 20
trigger1 = !numhelper(3210)
value = 0
ctrl = 1

[State 3201, Charge]
type = varadd
trigger1 = time = 10 || time = 20 || time = 40 || time = 60 || time = 90
var(0) = 1


;--- Firing ---
[Statedef 3202]
type = S
physics = S
movetype = A
ctrl = 0
anim = 3202
velset = 0, 0
sprpriority = 1

[State 3202, Snd]
type = playsnd
trigger1 = !time
value = 3, 2
channel = 0

[State 3202, Snd]
type = playsnd
trigger1 = animelem = 3
value = 2, 1
channel = 5

[State 3202, Spark]
type = helper
trigger1 = fvar(31)
trigger1 = animelem = 3
helpertype = normal
stateno = 8010
ID = 8000
name = "Spark"
postype = p1
facing = 1
pos = 40, -62
ownpal = 1
size.xscale = 1
size.yscale = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State 3202, Spark]
type = explod
trigger1 = !fvar(31)
trigger1 = animelem = 3
anim = F3
ID = 8000
postype = p1
pos = 40, -62
supermovetime = -1
pausemovetime = -1
ontop = 1
ownpal = 1

[State 3202, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<FINAL PSYCHO CRUSHER>=============================
[Statedef 4000]
type = S
physics = N
movetype = A
anim = 4000
ctrl = 0
velset = 0, 0
poweradd = -3000
facep2 = 1
sprpriority = 1

[State 4000, Custom Combo End]
type = palfx
trigger1 = !time
trigger1 = var(20) > 0
trigger1 = (var(20) := 0) || (var(15) := 0) || 1
time = 1

[State 4000, Pos]
type = posset
trigger1 = !time
y = 0

[State 4000, Strength]
type = varset
trigger1 = var(10) != 7
var(10) = 7
ignorehitpause = 1

[State 4000, Snd]
type = playsnd
trigger1 = !time
value = 4, 15
channel = 0

[State 4000, Super Pause FX]
type = helper
trigger1 = fvar(31)
trigger1 = time = 30
helpertype = normal
stateno = 7520
ID = 7500
name = "Superpause FX"
postype = p1
pos = ceil(2 * const(size.xscale)), ceil(-87 * const(size.yscale))
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 4000, Super Pause]
type = superpause
trigger1 = time = 30
time = 80
movetime = 80
anim = ifelse(fvar(31), -1, 102)
pos = ceil(2 * const(size.xscale)), ceil(-87 * const(size.yscale))
sound = s0, 8520
p2defmul = 1 + (0 * (fvar(5) := 0))
darken = ifelse(fvar(31), 0, 1)

[State 4000, Camera]
type = helper
trigger1 = time = 29
helpertype = normal
stateno = 4090
ID = 4090
name = "Psycho Crusher Camera"
postype = p1
size.xscale = 1
size.yscale = 1
supermovetime = 300
pausemovetime = 300

[State 4000, NHB]
type = nothitby
trigger1 = 1
time = 1
value = SCA

[State 4000, Push]
type = playerpush
trigger1 = 1
value = 0

[State 4000, Screen]
type = screenbound
trigger1 = time >= 30
value = 0
movecamera = 0, 1

[State 4000, posfix]
type = posadd
trigger1 = animelem = 2 || animelem = 3
x = ifelse((animelem = 2), -8, -12)

[State 4000, Vel]
type = velset
trigger1 = animelem = 10
x = -20

[State 4000, Guard]
type = attackdist
trigger1 = 1
value = 320

[State 4000, Screen]
type = varset
trigger1 = !time
var(0) = 0
[State 4000, Screen]
type = varset
trigger1 = pos x < (gamewidth / -4)
var(0) = 1

[State 4000, End]
type = changestate
trigger1 = time >= 110
value = 4001


;--- Attack ---
[Statedef 4001]
type = A
physics = N
movetype = A
anim = 4001
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 4001, NHB]
type = nothitby
trigger1 = 1
time = 1
value = SCA

[State 4001, shield]
type = helper
trigger1 = !numhelper(1007)
helpertype = normal
stateno = 1007
ID = 1007
name = "Projectile Hitter"
postype = p1

[State 4001, Push]
type = playerpush
trigger1 = 1
value = 0

[State 4001, screen]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 0

[State 4001, Snd]
type = playsnd
trigger1 = !time
value = 4, 9
channel = 0

[State 4001, Snd]
type = playsnd
trigger1 = !time
value = 5, 10

[State 4001, Pos]
type = posset
trigger1 = !time
x = (-gamewidth) * facing
y = -45

[State 4001, PalFX]
type = varset
trigger1 = !time
var(0) = 0

[State 4001, PalFX]
type = varadd
trigger1 = numexplod(4005)
var(0) = 1
ignorehitpause = 1

[State 4001, FX]
type = explod
trigger1 = !numexplod(4005)
anim = 4005
ID = 4005
sprpriority = 4
postype = p1
ownpal = 1
pausemovetime = 0
supermovetime = 0
removeongethit = 1
ignorehitpause = 1

[State 4001, FX]
type = modifyexplod
trigger1 = frontedgedist > -90 && time < 180
ID = 4005
postype = p1
pos = 75, -60
vel = vel x, 0
removetime = 300
ignorehitpause = 1

[State 4001, Palfx]
type = palfx
trigger1 = (var(0) % 4) = [1, 2]
time = 1
color = 0
add = 60 + ceil(sin(var(0) / 3.0) * 30), 30 + ceil(sin(var(0) / 3.0) * 30), 90 + ceil(sin(var(0) / 3.0) * 30)
mul = 512, 256, 512
ignorehitpause = 1
[State 4001, Palfx]
type = palfx
trigger1 = (var(0) % 4) != [1, 2]
time = 1
color = 0
add = 30 + ceil(sin(var(0) / 3.0) * 30), 60 + ceil(sin(var(0) / 3.0) * 30), 90 + ceil(sin(var(0) / 3.0) * 30)
mul = 256, 512, 512
ignorehitpause = 1

[State 4001, FX]
type = helper
trigger1 = numexplod(4005) && !(gametime % 8)
helpertype = normal
stateno = 4006
ID = 4006
name = "Psycho Crusher"
postype = p1
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1
pausemovetime = 999
supermovetime = 999
ignorehitpause = 1

[State 4001, BG PalFX]
type = bgpalfx
trigger1 = 1
time = 90
add = -128, -128, -128
sinadd = 128, 128, 128, 360
ignorehitpause = 1

[State 4001, Hit Var]
type = varset
trigger1 = !time
var(14) = 0
[State 4001, Hit Var]
type = varadd
trigger1 = movehit = 1 || moveguarded = 1 || movereversed = 1
var(14) = 1

[State 4001, Vel]
type = velset
trigger1 = 1
x = 20
y = 0
[State 4001, Vel]
type = velset
trigger1 = var(14) < 12
trigger1 = (movecontact = [1, 4]) || (movereversed = [1, 4])
x = 0
y = 0

[State 4001, Guard]
type = attackdist
trigger1 = 1
value = 320

[State 4001, Hit]
type = hitdef
trigger1 = !(time % 4) && var(14) < 11
attr = S, HA
damage = 150, 7
animtype = Diagup
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 2, 8
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 0) * (var(36) := 80), var(37) := -60
hitsound = -1 + 0 * (var(31) := 3)
guardsound = -1
ground.type = Low
ground.slidetime = 24
ground.hittime = 24
ground.velocity = -12, -12
ground.cornerpush.veloff = 0
air.type = Low
air.velocity = -12, -12
guard.dist = 320
getpower = 0
givepower = 40, 40
envshake.time = 12
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
sprpriority = 5
fall = 1
fall.recover = 0
ID = 4001
yaccel = 0.4850
forcestand = 1

[State 4001, End]
type = changestate
trigger1 = frontedgedist <= -90 || time >= 180
value = 4002


;--- END ---
[Statedef 4002]
type = S
physics = S
movetype = I
anim = 4002
ctrl = 0
velset = 0, 0

[State 4002, Anim]
type = changeanim
trigger1 = time <= 20
value = 4002
elem = 1

[State 4002, Pos]
type = posset
trigger1 = animelemtime(2) <= -1
x = -60 * facing
y = 0

[State 4002, Palfx]
type = palfx
trigger1 = !time
time = 1
add = 0, 0, 0
ignorehitpause = 1

[State 4002, afterimageoff]
type = afterimagetime
trigger1 = 1
time = 0
ignorehitpause = 1

[State 4002, Snd]
type = playsnd
trigger1 = animelem = 2
value = 4, 1
channel = 0
[State 4002, Snd]
type = playsnd
trigger1 = animelem = 2
value = 5, 6
[State 4002, fadein]
type = trans
trigger1 = animelemtime(2) = [0, 10]
trans = addalpha
alpha = 25 * animelemtime(2), ceil(256 -25 * animelemtime(2))
[State 4002, FX]
type = helper
trigger1 = animelem = 2
helpertype = normal
stateno = 1706
ID = 1705
name = "Warp FX"
postype = p1
pos = 60, 0

[State 4002, Push]
type = playerpush
trigger1 = animelemtime(2) <= 10
value = 0
[State 4002, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1
