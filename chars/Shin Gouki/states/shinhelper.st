; _____________________________________
;| Shin Gouki by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==============================================================================================
;=======================================<HELPER STATES>========================================
;==============================================================================================

;========================<GOU HADOU KEN>=============================
[Statedef 1005]
type = S
physics = N
movetype = A
anim = 1005
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 1005, hitoverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 1006
ignorehitpause = 1
[State 1005, HB]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 1005, Strength]
type = varset
trigger1 = !time
var(10) = root, var(10)

[State 1005, ProjContact]
type = varset
trigger1 = movecontact = 1 && numenemy
trigger1 = (enemynear, movetype = H) && !(enemynear, time)
var(18) = 1
ignorehitpause = 1
[State 1005, ProjContact]
type = parentvarset
trigger1 = movecontact = 1 && numenemy
trigger1 = (enemynear, movetype = H) && !(enemynear, time)
trigger1 = root, stateno = 1000
var(18) = 1
ignorehitpause = 1

[State 1005, Vel]
type = velset
trigger1 = 1
x = ifelse(var(10) = 3, 5, ifelse(var(10) = 2, 4.17, 3.33))
y = 0

[State 1005, Size]
type = angledraw
trigger1 = time < 4
trigger1 = !prevstateno
scale = 0.5 + (0.125 * time), 1

[State 1005, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256 - 32 * (time % 3), 256
ignorehitpause = 1

[State 1005, HitSound]
type = playsnd
trigger1 = movecontact = 1
value = 2, ifelse((movehit && numtarget), 7, 0)
channel = 2
ignorehitpause = 1

[State 1005, Miss]
type = hitdef
trigger1 = 1
attr = S, SP
hitflag =
sparkxy = -10, 0

[State 1005, Hit]
type = hitdef
trigger1 = root, var(15) < 1 || root, var(20)
priority = 4, Hit
attr = S, SP
damage = ceil(60 * root, fvar(11)), 7
guard.dist = const(size.proj.attack.dist)
animtype = Hard
hitflag = MAF
guardflag = MA
pausetime = 0, 12; / ((root, var(20) > 0) + 1)
sparkno = -1
guard.sparkno = -1 + 0 * (var(34) := 8001)
guardsound = -1
ground.type = High
ground.slidetime = 18
ground.hittime = 18
ground.velocity = -10.52, 0;ifelse(var(1) <= 12, -4, -10.52), ifelse(var(1) <= 12, -2.5, 0)
ground.cornerpush.veloff = 0
air.velocity = -0.75 * vel x, -6
yaccel = 0.4850
fall = 0;var(1) <= 12
air.fall = 1
fall.recover = 1
fall.recovertime = 120
getpower = 0, 0
givepower = 40, 40
envshake.time = 10
envshake.ampl = ifelse((gametime % 2), -1, 1)
envshake.freq = 180
sprpriority = 4
airguard.ctrltime = 16
airguard.velocity = -6.00, -1.00
p2facing = ifelse((p2stateno != [5020, 5119]) && p2statetype != L, 1, 0)
forcestand = 1

[State 1005, Getpower]
type = poweradd
trigger1 = !(root, var(20))
trigger1 = movecontact = 1
trigger1 = numtarget
value = ifelse(moveguarded, 25, 50)
ignorehitpause = 1

[State 1005, Spark]
type = helper
trigger1 = root, fvar(31)
trigger1 = movecontact = 1 && numtarget
trigger1 = (target, movetype = H) && !(target, time)
helpertype = normal
stateno = ifelse(moveguarded, 8001, 8013)
ID = 8000
name = "Spark"
postype = p1
pos = 0, 0
facing = 1
ownpal = 1
size.xscale = 1
size.yscale = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State 1005, Spark]
type = explod
trigger1 = !(root, fvar(31))
trigger1 = movecontact = 1 && numtarget
trigger1 = (target, movetype = H) && !(target, time)
anim = Fifelse(moveguarded, 40, 2)
ID = 8000
postype = p1
pos = 0, 0
supermovetime = -1
pausemovetime = -1
ontop = 1
ownpal = 1

[State 1005, Counter FX]
type = helper
trigger1 = root, var(9)
trigger1 = movecontact = 1 && numtarget
trigger1 = (target, movetype = H) && !(target, time)
helpertype = normal
stateno = 8290
ID = 8290
name = "Counter FX"
postype = p1
pos = 0, 0
ownpal = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State 1005, Stun System - Add]
type = parentvaradd
trigger1 = movehit = 1
trigger1 = numtarget
trigger1 = target, gethitvar(damage) > 0
trigger1 = root, var(42) >= 0
trigger1 = root, var(20) <= 0
var(42) = ceil(50 * root, fvar(11))
ignorehitpause = 1

[State 1005, Stun System - Dizzy]
type = targetstate
trigger1 = movehit = 1
trigger1 = numenemy = 1 && numpartner = 0
trigger1 = roundstate = 2 && numtarget
trigger1 = target, gethitvar(damage) < target, life
trigger1 = root, var(42) >= (target, const(data.life))
value = 1115310
ignorehitpause = 1

[State 1005, End]
type = changestate
trigger1 = movecontact
value = 1006
ignorehitpause = 1
[State 1005, End]
type = destroyself
trigger1 = frontedgedist < -100 || backedgedist < -80


[Statedef 1006]
type = A
physics = N
movetype = I
anim = 3006
velset = 0, 0
ctrl = 0
sprpriority = 4
movehitpersist = 1

[State 1006, Trade Sound]
type = playsnd
trigger1 = !time
trigger1 = prevstateno = [5000, 5999]
value = 2, 0
channel = 2
lowpriority = 1
volumescale = 50

[State 1006, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 1006, P2 Safe Fall]
type = targetstate
trigger1 = numtarget = 1
trigger1 = target, command = "recovery"
trigger1 = target, pos y >= -48 && target, vel y > 0
trigger1 = target, alive && target, hitfall && target, gethitvar(fall.recover)
trigger1 = target, stateno = 5030 || target, stateno = 5035 || target, stateno = 5050 || target, stateno = 5071
value = 1115200
ignorehitpause = 1

[State 1006, End]
type = destroyself
triggerall = !animtime
trigger1 = !numtarget
trigger2 = numtarget
trigger2 = target, time <= 1 && !(target, hitshakeover)


;========================<SHAKUNETSU HADOU KEN>=============================
[Statedef 1025]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 1025, Strength]
type = varset
trigger1 = !time && !prevstateno
var(10) = root, var(10)
[State 1025, Anim]
type = changeanim
trigger1 = !time && !prevstateno
value = 1025

[State 1025, Hit Number]
type = varadd
trigger1 = 1
var(2) = 1
persistent = 0
ignorehitpause = 1

[State 1025, hitoverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = ifelse(var(2) < var(10), 1025, 1026)
ignorehitpause = 1
[State 1025, HB]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 1025, ProjContact]
type = varset
trigger1 = movecontact = 1 && numenemy
trigger1 = (enemynear, movetype = H) && !(enemynear, time)
var(18) = 1
ignorehitpause = 1
[State 1025, ProjContact]
type = parentvarset
trigger1 = movecontact = 1 && numenemy
trigger1 = (enemynear, movetype = H) && !(enemynear, time)
trigger1 = root, stateno = 1020
var(18) = 1
ignorehitpause = 1

[State 1025, Vel]
type = velset
trigger1 = 1
x = ifelse(var(10) = 3, 6, ifelse(var(10) = 2, 5, 4))
y = 0

[State 1025, Size]
type = angledraw
trigger1 = time < 4
trigger1 = !prevstateno
scale = 0.5 + (0.125 * time), 1

[State 1025, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 1025, HitSound]
type = playsnd
trigger1 = movecontact = 1
value = 2, ifelse((movehit && numtarget), 7, 0)
channel = 2
ignorehitpause = 1

[State 1025, Freeze]
type = posfreeze
trigger1 = time <= ifelse(numtarget, 4, 0)
value = 1

[State 1025, Miss]
type = hitdef
trigger1 = 1
attr = S, SP
hitflag =
sparkxy = -10, 0

[State 1025, Hit]
type = hitdef
trigger1 = root, var(15) < 3 || root, var(20)
trigger1 = time >= ifelse(numtarget, 4, 0)
priority = 4, Hit
attr = S, SP
damage = ceil(ifelse(var(10) = 1, 60, ifelse(var(10) = 2, 42, 36)) * root, fvar(11)), 7
guard.dist = const(size.proj.attack.dist)
animtype = Back
hitflag = MAF
guardflag = MA
pausetime = 0, 12
sparkno = -1
sparkxy = -10, 0
guard.sparkno = -1 + 0 * (var(34) := 8001)
guardsound = -1
ground.type = Low
ground.slidetime = 18
ground.hittime = 18
ground.velocity = -4.0, -5.25
ground.cornerpush.veloff = 0
guard.velocity = -10.52
air.velocity = -4.0, -5.25
yaccel = 0.4850
fall = 1
fall.recover = 1
fall.recovertime = 120
getpower = 0, 0
givepower = 40, 40
envshake.time = 10
envshake.ampl = ifelse((gametime % 2), -1, 1)
envshake.freq = 180
palfx.color = 32
palfx.sinadd = 80, 25, 0, 8
palfx.mul = 512, 256, 128
palfx.time = 60
sprpriority = 4
airguard.ctrltime = 16
airguard.velocity = -6.00, -1.00
p2facing = ifelse((p2stateno != [5020, 5119]) && p2statetype != L, 1, 0)
forcestand = 1
ID = 1025

[State 1025, Getpower]
type = poweradd
trigger1 = !(root, var(20))
trigger1 = movecontact = 1
trigger1 = numtarget
value = ifelse(movehit && !prevstateno, 50, 25)
ignorehitpause = 1

[State 1025, Burned]
type = targetstate
trigger1 = movehit
trigger1 = numtarget(1025)
trigger1 = target, selfanimexist(7697)
trigger1 = (target(1025), stateno = 5000) || (target(1025), stateno = 5010) || (target(1025), stateno = 5020)
value = 7697
ID = 1025
ignorehitpause = 1

[State 1025, Spark]
type = helper
trigger1 = root, fvar(31)
trigger1 = movecontact = 1 && numtarget
trigger1 = (target, movetype = H) && !(target, time)
helpertype = normal
stateno = ifelse(moveguarded, 8001, 8013)
ID = 8000
name = "Spark"
postype = p1
pos = 0, 0
facing = 1
ownpal = 1
size.xscale = 1
size.yscale = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State 1025, Spark]
type = explod
trigger1 = !(root, fvar(31))
trigger1 = movecontact = 1 && numtarget
trigger1 = (target, movetype = H) && !(target, time)
anim = Fifelse(moveguarded, 40, 2)
ID = 8000
postype = p1
pos = 0, 0
supermovetime = -1
pausemovetime = -1
ontop = 1
ownpal = 1

[State 1025, Counter FX]
type = helper
trigger1 = root, var(9)
trigger1 = movecontact = 1 && numtarget
trigger1 = (target, movetype = H) && !(target, time)
helpertype = normal
stateno = 8290
ID = 8290
name = "Counter FX"
postype = p1
pos = 0, 0
ownpal = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State 1025, Flame Particles]
type = helper
trigger1 = !numhelper(8151)
trigger1 = movehit = 1 && numtarget
trigger1 = !(target, hitshakeover)
trigger1 = var(40) := (target, ID)
helpertype = normal
stateno = 8151
ID = 8151
name = "Flame Particles"
postype = p2
ownpal = 1
ignorehitpause = 1

[State 1025, Stun System - Add]
type = parentvaradd
trigger1 = movehit = 1
trigger1 = numtarget
trigger1 = target, gethitvar(damage) > 0
trigger1 = root, var(42) >= 0
trigger1 = root, var(20) <= 0
var(42) = ceil(ifelse(var(10) = 3, 36, ifelse(var(10) = 2, 78, 200)) * root, fvar(11))
ignorehitpause = 1

[State 1025, Stun System - Dizzy]
type = targetstate
trigger1 = movehit = 1
trigger1 = numenemy = 1 && numpartner = 0
trigger1 = roundstate = 2 && numtarget
trigger1 = target, gethitvar(damage) < target, life
trigger1 = root, var(42) >= (target, const(data.life))
value = 1115310
ignorehitpause = 1

[State 1025, End]
type = changestate
trigger1 = movecontact
value = ifelse(var(2) < var(10), 1025, 1026)
[State 1025, End]
type = destroyself
trigger1 = frontedgedist < -100 || backedgedist < -80


[Statedef 1026]
type = A
physics = N
movetype = I
anim = 1026
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 1026, Trade Sound]
type = playsnd
trigger1 = !time
trigger1 = prevstateno = [5000, 5999]
value = 2, 0
channel = 2
lowpriority = 1
volumescale = 50

[State 1026, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 1026, P2 Safe Fall]
type = targetstate
trigger1 = numtarget = 1
trigger1 = target, command = "recovery"
trigger1 = target, pos y >= -48 && target, vel y > 0
trigger1 = target, alive && target, hitfall && target, gethitvar(fall.recover)
trigger1 = target, stateno = 5030 || target, stateno = 5035 || target, stateno = 5050 || target, stateno = 5071
value = 1115200
ignorehitpause = 1

[State 1026, End]
type = destroyself
triggerall = !animtime
trigger1 = !numtarget
trigger2 = numtarget
trigger2 = target, time <= 1 && !(target, hitshakeover)



;========================<ZANKUU HADOUKEN>=============================
[Statedef 1055]
type = A
physics = N
movetype = A
anim = 1055
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 1055, hitoverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 1056
ignorehitpause = 1
[State 1055, HB]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 1055, Strength]
type = varset
trigger1 = !time
var(10) = root, var(10)

[State 1055, ProjContact]
type = varset
trigger1 = movecontact = 1 && numenemy
trigger1 = (enemynear, movetype = H) && !(enemynear, time)
var(18) = 1
ignorehitpause = 1
[State 1055, ProjContact]
type = parentvarset
trigger1 = movecontact = 1 && numenemy
trigger1 = (enemynear, movetype = H) && !(enemynear, time)
trigger1 = root, stateno = 1050
var(18) = 1
ignorehitpause = 1

[State 1055, Vel]
type = velset
trigger1 = 1
;x = ifelse(var(10) = 3, 5.7, ifelse(var(10) = 2, 4.3, 2.9))
;y = ifelse(var(10) = 3, 4, ifelse(var(10) = 2, 3, 2))
x = ifelse(var(10) = 3, 4.15, ifelse(var(10) = 2, 3.46, 2.76))
y = ifelse(var(10) = 3, 2.80, ifelse(var(10) = 2, 2.32, 1.86))

[State 1055, Size]
type = angledraw
trigger1 = time < 2
trigger1 = !prevstateno
scale = 0.5 + (0.25 * time), 0.5 + (0.25 * time)

[State 1055, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256 - 32 * (time % 3), 256
ignorehitpause = 1

[State 1055, HitSound]
type = playsnd
trigger1 = movecontact = 1
value = 2, ifelse((movehit && numtarget), 7, 0)
channel = 2
ignorehitpause = 1

[State 1055, Miss]
type = hitdef
trigger1 = 1
attr = S, SP
hitflag =
sparkxy = -10, 0

[State 1055, Hit]
type = hitdef
trigger1 = root, var(15) < 2 || root, var(20)
priority = 4, Hit
attr = A, SP
damage = ceil(40 * root, fvar(11)), 7
guard.dist = const(size.proj.attack.dist)
animtype = Back
fall.animtype = Back
hitflag = MAFD
guardflag = MA
pausetime = 0, 8
sparkno = -1
sparkxy = -10, 0
guard.sparkno = -1 + 0 * (var(34) := 8001)
guardsound = -1
ground.type = High
ground.slidetime = 18
ground.hittime = 18
ground.velocity = -7.51, 0
guard.velocity = -10.52
ground.cornerpush.veloff = 0
air.velocity = -vel x, -1.5
yaccel = 0.4850
down.hittime = 20
down.velocity = 0, 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120
getpower = 0, 0
givepower = 40, 40
envshake.time = 10
envshake.ampl = ifelse((gametime % 2), -1, 1)
envshake.freq = 180
sprpriority = 4
airguard.ctrltime = 16
airguard.velocity = -6.00, -1.00
p2facing = ifelse((p2stateno != [5020, 5119]) && p2statetype != L, 1, 0)
forcestand = 1

[State 1055, Hit - Infinite prevention]
type = hitdef
trigger1 = root, var(15) < 2 || root, var(20)
trigger1 = numenemy && !(root, var(20))
trigger1 = enemynear, movetype = H
trigger1 = enemynear, hitfall = 0
trigger1 = enemynear, anim != 5300
trigger1 = enemynear, gethitvar(hitcount) >= 12
priority = 4, Hit
attr = A, SP
damage = ceil(40 * root, fvar(11)), 7
guard.dist = const(size.proj.attack.dist)
animtype = Back
fall.animtype = Back
hitflag = MAFD
guardflag = MA
pausetime = 0, 8
sparkno = -1
sparkxy = -10, 0
guard.sparkno = -1 + 0 * (var(34) := 8001)
guardsound = -1
ground.type = High
ground.slidetime = 18
ground.hittime = 18
ground.velocity = -vel x, -1.5
guard.velocity = -10.52
ground.cornerpush.veloff = 0
air.velocity = -vel x, -1.5
yaccel = 0.4850
down.hittime = 20
down.velocity = 0, 0
fall = 1
fall.recover = 1
fall.recovertime = 120
getpower = 0, 0
givepower = 40, 40
envshake.time = 10
envshake.ampl = ifelse((gametime % 2), -1, 1)
envshake.freq = 180
sprpriority = 4
airguard.ctrltime = 16
airguard.velocity = -6.00, -1.00
p2facing = ifelse((p2stateno != [5020, 5119]) && p2statetype != L, 1, 0)
forcestand = 1

[State 1055, Getpower]
type = poweradd
trigger1 = !(root, var(20))
trigger1 = movecontact = 1
trigger1 = numtarget
value = ifelse(moveguarded, 25, 50)
ignorehitpause = 1

[State 1055, Spark]
type = helper
trigger1 = root, fvar(31)
trigger1 = movecontact = 1 && numtarget
trigger1 = (target, movetype = H) && !(target, time)
helpertype = normal
stateno = ifelse(moveguarded, 8001, 8013)
ID = 8000
name = "Spark"
postype = p1
pos = 0, 0
facing = 1
ownpal = 1
size.xscale = 1
size.yscale = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State 1055, Spark]
type = explod
trigger1 = !(root, fvar(31))
trigger1 = movecontact = 1 && numtarget
trigger1 = (target, movetype = H) && !(target, time)
anim = Fifelse(moveguarded, 40, 2)
ID = 8000
postype = p1
pos = 0, 0
supermovetime = -1
pausemovetime = -1
ontop = 1
ownpal = 1

[State 1055, Counter FX]
type = helper
trigger1 = root, var(9)
trigger1 = movecontact = 1 && numtarget
trigger1 = (target, movetype = H) && !(target, time)
helpertype = normal
stateno = 8290
ID = 8290
name = "Counter FX"
postype = p1
pos = 0, 0
ownpal = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State 1055, Stun System - Add]
type = parentvaradd
trigger1 = movehit = 1
trigger1 = numtarget
trigger1 = target, gethitvar(damage) > 0
trigger1 = root, var(42) >= 0
trigger1 = root, var(20) <= 0
var(42) = ceil(30 * root, fvar(11))
ignorehitpause = 1

[State 1055, Stun System - Dizzy]
type = targetstate
trigger1 = movehit = 1
trigger1 = numenemy = 1 && numpartner = 0
trigger1 = roundstate = 2 && numtarget
trigger1 = target, gethitvar(damage) < target, life
trigger1 = root, var(42) >= (target, const(data.life))
value = 1115310
ignorehitpause = 1

[State 1055, End]
type = changestate
trigger1 = movecontact
value = 1056
ignorehitpause = 1

[State 1055, End]
type = changestate
trigger1 = pos y >= 0
value = 1057
ignorehitpause = 1

[State 1055, End]
type = destroyself
trigger1 = frontedgedist < -100 || backedgedist < -80


[Statedef 1056]
type = A
physics = N
movetype = I
anim = 3056
velset = 0, 0
ctrl = 0
sprpriority = 4
movehitpersist = 1

[State 1056, Trade Sound]
type = playsnd
trigger1 = !time
trigger1 = prevstateno = [5000, 5999]
value = 2, 0
channel = 2
lowpriority = 1
volumescale = 50

[State 1056, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 1056, P2 Safe Fall]
type = targetstate
trigger1 = numtarget = 1
trigger1 = target, command = "recovery"
trigger1 = target, pos y >= -48 && target, vel y > 0
trigger1 = target, alive && target, hitfall && target, gethitvar(fall.recover)
trigger1 = target, stateno = 5030 || target, stateno = 5035 || target, stateno = 5050 || target, stateno = 5071
value = 1115200
ignorehitpause = 1

[State 1056, End]
type = destroyself
triggerall = !animtime
trigger1 = !numtarget
trigger2 = numtarget
trigger2 = target, time <= 1 && !(target, hitshakeover)


[Statedef 1057]
type = A
physics = N
movetype = I
anim = 3057
velset = 0, 0
ctrl = 0
sprpriority = 4

[State 1057, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 1057, Pos]
type = posset
trigger1 = 1
y = 0

[State 1057, Snd]
type = playsnd
trigger1 = !time
value = 5, 3
ignorehitpause = 1
persistent = 0

[State 1057, Dust]
type = explod
trigger1 = !time
anim = 7102
ID = 7102
sprpriority = -5
postype = p1
pos = 0, 0
vel = 0, 0
removetime = -2
ownpal = 1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1

[State 1057, End]
type = destroyself
trigger1 = !animtime


;========================<MESSATSU GOU HADOU>=============================
[Statedef 3005]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 3005, Hit Number]
type = varadd
trigger1 = 1
var(2) = 1
persistent = 0
ignorehitpause = 1

[State 3005, hitoverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = ifelse(var(2) < 8, 3005, 3006)
ignorehitpause = 1
[State 3005, HB]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 3005, Strength]
type = varset
trigger1 = !time && !prevstateno
var(10) = 5
[State 3005, Button]
type = varset
trigger1 = !time && !prevstateno
var(11) = root, var(11)

[State 3005, Anim]
type = changeanim
trigger1 = !time && !prevstateno
value = 3005

[State 3005, ProjContact]
type = varset
trigger1 = movecontact = 1 && numenemy
trigger1 = (enemynear, movetype = H) && !(enemynear, time)
var(18) = 1
ignorehitpause = 1
[State 3005, ProjContact]
type = parentvarset
trigger1 = movecontact = 1 && numenemy
trigger1 = (enemynear, movetype = H) && !(enemynear, time)
trigger1 = root, stateno = 3000
var(18) = 1
ignorehitpause = 1

[State 3005, Vel]
type = velset
trigger1 = 1
x = ifelse(var(11) = 2, 8, ifelse(var(11) = 1, 6.5, 5))
y = 0

[State 3005, Size]
type = angledraw
trigger1 = time < 4
trigger1 = !prevstateno
scale = 0.5 + (0.125 * time), 1

[State 3005, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256 - 32 * (time % 3), 256
ignorehitpause = 1

[State 3005, HitSound]
type = playsnd
trigger1 = movecontact = 1
value = 2, ifelse((movehit && numtarget), 7, 0)
channel = 2
ignorehitpause = 1

[State 3005, Freeze]
type = posfreeze
trigger1 = time <= ifelse(numtarget, 4, 0)
value = 1

[State 3005, Miss]
type = hitdef
trigger1 = 1
attr = S, HP
hitflag =
sparkxy = -10, 0

[State 3005, Hit]
type = hitdef
trigger1 = root, var(15) < 8
trigger1 = time >= ifelse(numtarget, 4, 0)
priority = 4, Hit
attr = S, HP
damage = ceil(34 * root, fvar(11)), 4
guard.dist = 320
animtype = Back
hitflag = MAF
guardflag = M
pausetime = 0, 12
sparkno = -1
sparkxy = -10, 0
guard.sparkno = -1 + 0 * (var(34) := 8001)
guardsound = -1
ground.type = High
ground.slidetime = 18
ground.hittime = 18
ground.velocity = ifelse(var(2) < 8, -10.52, -6.25), ifelse(var(2) < 8, 0, -5.25)
ground.cornerpush.veloff = 0
air.velocity = -6.25, -5.25
yaccel = 0.4850
guard.velocity = -10.52
fall = (var(2) >= 8)
air.fall = 1
fall.recover = 0
getpower = 0, 0
givepower = 40, 40
envshake.time = 12
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.freq = 180
palfx.sinadd = 128, 128, 128, 4
palfx.mul = 128, 128, 128
palfx.time = 60
sprpriority = 4
airguard.ctrltime = 16
airguard.velocity = -6.00, -1.00
p2facing = ifelse((p2stateno != [5020, 5119]) && p2statetype != L, 1, 0)
forcestand = 1
ID = 3005

[State 3005, Burned]
type = targetstate
trigger1 = movehit
trigger1 = numtarget(3005)
trigger1 = target, selfanimexist(7697)
trigger1 = (target(3005), stateno = 5000) || (target(3005), stateno = 5010) || (target(3005), stateno = 5020)
value = 7697
ID = 3005
ignorehitpause = 1

[State 3005, Spark]
type = helper
trigger1 = root, fvar(31)
trigger1 = movecontact = 1 && numtarget
trigger1 = (target, movetype = H) && !(target, time)
helpertype = normal
stateno = ifelse(moveguarded, 8001, 8014)
ID = 8000
name = "Spark"
postype = p1
pos = 0, 0
facing = 1
ownpal = 1
size.xscale = 1
size.yscale = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State 3005, Spark]
type = explod
trigger1 = !(root, fvar(31))
trigger1 = movecontact = 1 && numtarget
trigger1 = (target, movetype = H) && !(target, time)
anim = Fifelse(moveguarded, 40, 3)
ID = 8000
postype = p1
pos = 0, 0
supermovetime = -1
pausemovetime = -1
ontop = 1
ownpal = 1

[State 3005, Counter FX]
type = helper
trigger1 = root, var(9)
trigger1 = movecontact = 1 && numtarget
trigger1 = (target, movetype = H) && !(target, time)
helpertype = normal
stateno = 8290
ID = 8290
name = "Counter FX"
postype = p1
pos = 0, 0
ownpal = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State 3005, Flame Particles]
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

[State 3005, Underground Juggle Prevention]
type = targetbind
trigger1 = movecontact = 1
trigger1 = numtarget = 1 && numenemy
trigger1 = target, time <= 0
trigger1 = target, ID = enemynear, ID
trigger1 = !(target, hitshakeover) && (target, pos y > 0)
pos = ceil(p2dist x), ceil(-pos y)
ignorehitpause = 1

[State 3005, End]
type = changestate
trigger1 = movecontact
value = ifelse(var(2) < 8, 3005, 3006)
[State 3005, End]
type = destroyself
trigger1 = frontedgedist < -120 || backedgedist < -120


[Statedef 3006]
type = A
physics = N
movetype = I
anim = 3006
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 3006, Trade Sound]
type = playsnd
trigger1 = !time
trigger1 = prevstateno = [5000, 5999]
value = 2, 0
channel = 2
lowpriority = 1
volumescale = 50

[State 3006, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3006, End]
type = destroyself
triggerall = !animtime
trigger1 = !numtarget
trigger2 = numtarget
trigger2 = target, time <= 1 && !(target, hitshakeover)



;========================<TENMA GOU ZANKUU>=============================
[Statedef 3055]
type = A
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 3055, Hit Number]
type = varadd
trigger1 = 1
var(2) = 1
persistent = 0
ignorehitpause = 1

[State 3055, hitoverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = ifelse(var(2) < 8, 3055, 3056)
ignorehitpause = 1
[State 3055, HB]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 3055, Strength]
type = varset
trigger1 = !time && !prevstateno
var(10) = 5
[State 3055, Button]
type = varset
trigger1 = !time && !prevstateno
var(11) = root, var(11)

[State 3055, Anim]
type = changeanim
trigger1 = !time && !prevstateno
value = 3055

[State 3055, ProjContact]
type = varset
trigger1 = movecontact = 1 && numenemy
trigger1 = (enemynear, movetype = H) && !(enemynear, time)
var(18) = 1
ignorehitpause = 1
[State 3055, ProjContact]
type = parentvarset
trigger1 = movecontact = 1 && numenemy
trigger1 = (enemynear, movetype = H) && !(enemynear, time)
trigger1 = root, stateno = 3050
var(18) = 1
ignorehitpause = 1

[State 3055, Vel]
type = velset
trigger1 = 1
x = ifelse(var(11) = 2, 6.63, ifelse(var(11) = 1, 5.39, 4.15))
y = ifelse(var(11) = 2, 4.47, ifelse(var(11) = 1, 3.63, 2.80))

[State 3055, Size]
type = angledraw
trigger1 = time < 2
trigger1 = !prevstateno
scale = 0.5 + (0.25 * time), 0.5 + (0.25 * time)

[State 3055, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256 - 32 * (time % 3), 256
ignorehitpause = 1

[State 3055, HitSound]
type = playsnd
trigger1 = movecontact = 1
value = 2, ifelse((movehit && numtarget), 7, 0)
channel = 2
ignorehitpause = 1

[State 3055, Freeze]
type = posfreeze
trigger1 = time <= ifelse(numtarget, 4, 0)
value = 1

[State 3055, Miss]
type = hitdef
trigger1 = 1
attr = S, HP
hitflag =
sparkxy = -10, 0

[State 3055, Hit]
type = hitdef
trigger1 = root, var(15) < 8
trigger1 = time >= ifelse(numtarget, 4, 0)
priority = 4, Hit
attr = A, HP
damage = ceil(30 * root, fvar(11)), 4
guard.dist = 320
animtype = Back
hitflag = MAFD
guardflag = M
pausetime = 0, 12
sparkno = -1
sparkxy = -10, 0
guard.sparkno = -1 + 0 * (var(34) := 8001)
guardsound = -1
ground.type = Low
ground.slidetime = 18
ground.hittime = 18
ground.velocity = -6.25, 4.5
ground.cornerpush.veloff = 0
air.velocity = -6.25, 4.5
yaccel = 0.4850
down.velocity = 0, 0
down.hittime = 20
guard.velocity = -10.52
fall = 1
air.fall = 1
fall.recover = 0
getpower = 0, 0
givepower = 40, 40
envshake.time = 12
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.freq = 180
palfx.sinadd = 128, 128, 128, 4
palfx.mul = 128, 128, 128
palfx.time = 60
sprpriority = 4
airguard.ctrltime = 16
airguard.velocity = -6.00, -1.00
p2facing = ifelse((p2stateno != [5020, 5119]) && p2statetype != L, 1, 0)
forcestand = 1
ID = 3055

[State 3055, Burned]
type = targetstate
trigger1 = movehit
trigger1 = numtarget(3055)
trigger1 = target, selfanimexist(7697)
trigger1 = (target(3055), stateno = 5000) || (target(3055), stateno = 5010) || (target(3055), stateno = 5020)
value = 7697
ID = 3055
ignorehitpause = 1

[State 3055, Spark]
type = helper
trigger1 = root, fvar(31)
trigger1 = movecontact = 1 && numtarget
trigger1 = (target, movetype = H) && !(target, time)
helpertype = normal
stateno = ifelse(moveguarded, 8001, 8014)
ID = 8000
name = "Spark"
postype = p1
pos = 0, 0
facing = 1
ownpal = 1
size.xscale = 1
size.yscale = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State 3055, Spark]
type = explod
trigger1 = !(root, fvar(31))
trigger1 = movecontact = 1 && numtarget
trigger1 = (target, movetype = H) && !(target, time)
anim = Fifelse(moveguarded, 40, 3)
ID = 8000
postype = p1
pos = 0, 0
supermovetime = -1
pausemovetime = -1
ontop = 1
ownpal = 1

[State 3055, Counter FX]
type = helper
trigger1 = root, var(9)
trigger1 = movecontact = 1 && numtarget
trigger1 = (target, movetype = H) && !(target, time)
helpertype = normal
stateno = 8290
ID = 8290
name = "Counter FX"
postype = p1
pos = 0, 0
ownpal = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State 3055, Flame Particles]
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

[State 3055, Underground Juggle Prevention]
type = targetbind
trigger1 = movecontact = 1
trigger1 = numtarget = 1 && numenemy
trigger1 = target, time <= 0
trigger1 = target, ID = enemynear, ID
trigger1 = !(target, hitshakeover) && (target, pos y > 0)
pos = ceil(p2dist x), ceil(-pos y)
ignorehitpause = 1

[State 3055, End]
type = changestate
trigger1 = movecontact
value = ifelse(var(2) < 8, 3055, 3056)

[State 3055, End]
type = changestate
trigger1 = pos y >= 0
value = 3057
ignorehitpause = 1

[State 3055, End]
type = destroyself
trigger1 = frontedgedist < -120 || backedgedist < -120


[Statedef 3056]
type = A
physics = N
movetype = I
anim = 3056
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 3056, Trade Sound]
type = playsnd
trigger1 = !time
trigger1 = prevstateno = [5000, 5999]
value = 2, 0
channel = 2
lowpriority = 1
volumescale = 50

[State 3056, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3056, End]
type = destroyself
triggerall = !animtime
trigger1 = !numtarget
trigger2 = numtarget
trigger2 = target, time <= 1 && !(target, hitshakeover)


[Statedef 3057]
type = A
physics = N
movetype = I
anim = 3057
velset = 0, 0
ctrl = 0
sprpriority = 4
[State 3057, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1
[State 3057, Pos]
type = posset
trigger1 = 1
y = 0
[State 3057, Snd]
type = playsnd
trigger1 = animelem = 1
value = 5, 3
ignorehitpause = 1
persistent = 0

[State 3057, Dust]
type = explod
trigger1 = !time
anim = 7102
ID = 7102
sprpriority = -2
pos = 0, 0
vel = 0, 0
removetime = -2
ownpal = 1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1

[State 3057, End]
type = destroyself
trigger1 = !animtime


;========================<ZANKUU HADOUKEN>=============================
[Statedef 3075]
type = A
physics = N
movetype = A
anim = 1055
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 3075, hitoverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 3076
ignorehitpause = 1
[State 3075, HB]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 3075, Strength]
type = varset
trigger1 = !time && !prevstateno
var(10) = 6

[State 3075, ProjContact]
type = varset
trigger1 = movecontact = 1 && numenemy
trigger1 = (enemynear, movetype = H) && !(enemynear, time)
var(18) = 1
ignorehitpause = 1
[State 3075, ProjContact]
type = parentvarset
trigger1 = movecontact = 1 && numenemy
trigger1 = (enemynear, movetype = H) && !(enemynear, time)
trigger1 = root, stateno = 3070
var(18) = 1
ignorehitpause = 1

[State 3075, vel1]
type = velset
trigger1 = !time && (rootdist y > 48)
x = 6 + random / 500.0
y = 3 + random / 500.0
[State 3075, vel2]
type = velset
trigger1 = !time && (rootdist y <= 48)
x = 4 + random / 500.0
y = 5 + random / 500.0

[State 3075, Size]
type = angledraw
trigger1 = time < 2
trigger1 = !prevstateno
scale = 0.5 + (0.25 * time), 0.5 + (0.25 * time)

[State 3075, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256 - 32 * (time % 3), 256
ignorehitpause = 1

[State 3075, HitSound]
type = parentvarset
trigger1 = movecontact = 1
var(52) = ifelse((movehit && numtarget), 2, 1)
persistent = 0
ignorehitpause = 1

[State 3075, Miss]
type = hitdef
trigger1 = 1
attr = A, HP
hitflag =
sparkxy = -10, 0

[State 3075, Hit]
type = hitdef
trigger1 = root, var(15) < 18
priority = 4, Hit
attr = A, HP
damage = ceil(24 * root, fvar(11)), 3
guard.dist = 320
animtype = Hard
fall.animtype = Back
hitflag = MAFD
guardflag = MA
pausetime = 0, 12
sparkno = -1
sparkxy = -10, 0
guard.sparkno = -1 + 0 * (var(34) := 8001)
guardsound = -1
ground.type = High
ground.slidetime = 18
ground.hittime = 18
ground.velocity = -10, 0
ground.cornerpush.veloff = 0
air.velocity = -6.25, 4.5
yaccel = 0.4850
down.hittime = 20
down.velocity = 0, 0
air.fall = 1
fall.recover = 0
getpower = 0, 0
givepower = 40, 40
envshake.time = 12
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.freq = 180
sprpriority = 4
airguard.ctrltime = 16
airguard.velocity = -6.00, -1.00
p2facing = ifelse((p2stateno != [5020, 5119]) && p2statetype != L, 1, 0)
forcestand = 1

[State 3075, Spark]
type = helper
trigger1 = root, fvar(31)
trigger1 = movecontact = 1 && numtarget
trigger1 = (target, movetype = H) && !(target, time)
helpertype = normal
stateno = ifelse(moveguarded, 8001, 8014)
ID = 8000
name = "Spark"
postype = p1
pos = 0, 0
facing = 1
ownpal = 1
size.xscale = 1
size.yscale = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State 3075, Spark]
type = explod
trigger1 = !(root, fvar(31))
trigger1 = movecontact = 1 && numtarget
trigger1 = (target, movetype = H) && !(target, time)
anim = Fifelse(moveguarded, 40, 3)
ID = 8000
postype = p1
pos = 0, 0
supermovetime = -1
pausemovetime = -1
ontop = 1
ownpal = 1

[State 3075, Counter FX]
type = helper
trigger1 = root, var(9)
trigger1 = movecontact = 1 && numtarget
trigger1 = (target, movetype = H) && !(target, time)
helpertype = normal
stateno = 8290
ID = 8290
name = "Counter FX"
postype = p1
pos = 0, 0
ownpal = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State 3075, Underground Juggle Prevention]
type = targetbind
trigger1 = movecontact = 1
trigger1 = numtarget = 1 && numenemy
trigger1 = target, time <= 0
trigger1 = target, ID = enemynear, ID
trigger1 = !(target, hitshakeover) && (target, pos y > 0)
pos = ceil(p2dist x), ceil(-pos y)
ignorehitpause = 1

[State 3075, End]
type = changestate
trigger1 = movecontact
value = 3076
ignorehitpause = 1

[State 3075, End]
type = changestate
trigger1 = pos y >= 0
value = 1057
ignorehitpause = 1

[State 3075, End]
type = destroyself
trigger1 = frontedgedist < -100 || backedgedist < -80


[Statedef 3076]
type = A
physics = N
movetype = I
anim = 3056
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 3076, Trade Sound]
type = playsnd
trigger1 = !time
trigger1 = prevstateno = [5000, 5999]
value = 2, 0
channel = 2
lowpriority = 1
volumescale = 50

[State 3076, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3076, End]
type = destroyself
triggerall = !animtime
trigger1 = !numtarget
trigger2 = numtarget
trigger2 = target, time <= 1 && !(target, hitshakeover)
trigger3 = numhelper(3075) > 1
trigger3 = time > (helper(3075), time)


;========================<KONGOU KOKURETSU ZAN>=============================
;--- LIGHTNING ---
[Statedef 4205]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0, 0
anim = 4205
sprpriority = 4

[State 4205, hitoverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 4205
ignorehitpause = 1
[State 4205, NHB]
type = nothitby
trigger1 = 1
time = -1
value = SCA, AA, AP, AT
ignorehitpause = 1

[State 4205, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 4205, Strength]
type = varset
trigger1 = !time && !prevstateno
var(10) = 6

[State 4205, ProjContact]
type = varset
trigger1 = movecontact = 1 && numenemy
trigger1 = (enemynear, movetype = H) && !(enemynear, time)
var(18) = 1
ignorehitpause = 1
[State 4205, ProjContact]
type = parentvarset
trigger1 = movecontact = 1 && numenemy
trigger1 = (enemynear, movetype = H) && !(enemynear, time)
trigger1 = root, stateno = 4200
var(18) = 1
ignorehitpause = 1

[State 4205, Shadows]
type = afterimage
trigger1 = !time && !prevstateno
time = 999
timegap = 1
framegap = 2
length = 3
palcontrast = 20, 10, 50
trans = add

[State 4205, Hit]
type = hitdef
trigger1 = animelem = 1
attr = S, HP
damage = ceil(120 * root, fvar(11)), 15
guard.dist = 320
animtype = Up
guardflag = M
hitflag = MAFD
priority = 4, Hit
pausetime = 0, 12
sparkno = -1
guard.sparkno = -1
hitsound = s2, 8
guardsound = s2, 0
ground.type = High
ground.slidetime = 20
ground.hittime = 20
ground.velocity = ifelse(frontedgedist < backedgedist, 6, -6), -6
ground.cornerpush.veloff = 0
air.velocity = ifelse(frontedgedist < backedgedist, 6, -6), -6
yaccel = 0.4850
down.velocity = ifelse(frontedgedist < backedgedist, 6, -6), -6
getpower = 0, 0
givepower = 40, 40
guard.velocity = -10.52
fall = 1
fall.recover = 0
palfx.sinadd = 128, 128, 128, 4
palfx.mul = 128, 128, 128
palfx.time = 60
sprpriority = 4
p2facing = ifelse((p2stateno != [5020, 5119]) && p2statetype != L, 1, 0)
forcestand = 1
airguard.ctrltime = 16
airguard.cornerpush.veloff = 0
airguard.velocity = -6.00, -1.00

[State 4205, Flame Particles]
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

[State 4205, Spark]
type = helper
trigger1 = root, fvar(31)
trigger1 = movecontact = 1 && numtarget
trigger1 = (target, movetype = H) && !(target, time)
helpertype = normal
stateno = ifelse(moveguarded, 8001, 8014)
ID = 8000
name = "Spark"
postype = p2
facing = -1
pos = (target, const(size.ground.front) -10), (target, const(size.mid.pos.y))
facing = 1
ownpal = 1
size.xscale = 1
size.yscale = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State 4205, Spark]
type = explod
trigger1 = !(root, fvar(31))
trigger1 = movecontact = 1 && numtarget
trigger1 = (target, movetype = H) && !(target, time)
anim = Fifelse(moveguarded, 40, 3)
ID = 8000
postype = p2
facing = -1
pos = (target, const(size.ground.front) -10), (target, const(size.mid.pos.y))
supermovetime = -1
pausemovetime = -1
ontop = 1
ownpal = 1

[State 4205, Counter FX]
type = helper
trigger1 = root, var(9)
trigger1 = movecontact = 1 && numtarget
trigger1 = (target, movetype = H) && !(target, time)
helpertype = normal
stateno = 8290
ID = 8290
name = "Counter FX"
postype = p2
facing = -1
pos = (target, const(size.ground.front) -10), (target, const(size.mid.pos.y))
ownpal = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State 4205, End]
type = destroyself
trigger1 = !animtime
trigger1 = !numhelper(4206)


;--- SHOCKWAVES ---
[Statedef 4206]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 5

[State 4206, hitoverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 4206
ignorehitpause = 1
[State 4206, NHB]
type = nothitby
trigger1 = 1
time = -1
value = SCA, AA, AP, AT
ignorehitpause = 1

[State 4206, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256 - 32 * (time % 3), 256
ignorehitpause = 1

[State 4206, Strength]
type = varset
trigger1 = !time && !prevstateno
var(10) = 6
[State 4206, Anim]
type = changeanim
trigger1 = !time && !prevstateno
value = 4206

[State 4206, ProjContact]
type = varset
trigger1 = movecontact = 1 && numenemy
trigger1 = (enemynear, movetype = H) && !(enemynear, time)
var(18) = 1
ignorehitpause = 1
[State 4206, ProjContact]
type = parentvarset
trigger1 = movecontact = 1 && numenemy
trigger1 = (enemynear, movetype = H) && !(enemynear, time)
var(18) = 1
ignorehitpause = 1

[State 4206, movehitvar2]
type = varset
trigger1 = !time && prevstateno
var(4) = animelemno(0)
ignorehitpause = 1

[State 4206, Shadows]
type = afterimage
trigger1 = !time && !prevstateno
time = 999
timegap = 1
framegap = 2
length = 7
palcontrast = 20, 20, 20
trans = add

[State 4206, HitSound]
type = playsnd
trigger1 = movecontact = 1
value = 2, ifelse((movehit && numtarget), 8, 0)
channel = 2
ignorehitpause = 1

[State 4206, Hit]
type = hitdef
trigger1 = animelemno(0) != var(4)
trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8 || animelem = 9
attr = S, HP
damage = ceil(50 * root, fvar(11)), 7
guard.dist = 320
animtype = Hard
fall.animtype = Up
guardflag = M
hitflag = MAFD
priority = 4, Hit
pausetime = 0, 1
sparkno = -1
guard.sparkno = -1
guardsound = -1
ground.type = High
ground.slidetime = 20
ground.hittime = 20
ground.velocity = ifelse((animelem = 9), -12, -4), 0
ground.cornerpush.veloff = 0
air.velocity = -3, -16
yaccel = 0.4850
getpower = 0, 0
givepower = 40, 40
fall = 0
air.fall = 1
fall.recover = 0
palfx.sinadd = 128, 128, 128, 4
palfx.mul = 128, 128, 128
palfx.time = 60
ID = 4206 + (facing = -1)
nochainID = 4207 -(facing = -1)
sprpriority = 4
p2facing = ifelse((p2stateno != [5020, 5119]) && p2statetype != L, 1, 0)
forcestand = 1
airguard.ctrltime = 16
airguard.cornerpush.veloff = 0
airguard.velocity = -6.00, -1.00

[State 4206, Flame Particles]
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

[State 4206, Spark]
type = helper
trigger1 = root, fvar(31)
trigger1 = movecontact = 1 && numtarget
trigger1 = (target, movetype = H) && !(target, time)
helpertype = normal
stateno = ifelse(moveguarded, 8001, 8014)
ID = 8000
name = "Spark"
postype = p2
facing = -1
pos = (target, const(size.ground.front) -10), (target, const(size.mid.pos.y))
facing = 1
ownpal = 1
size.xscale = 1
size.yscale = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State 4206, Spark]
type = explod
trigger1 = !(root, fvar(31))
trigger1 = movecontact = 1 && numtarget
trigger1 = (target, movetype = H) && !(target, time)
anim = Fifelse(moveguarded, 40, 3)
ID = 8000
postype = p2
facing = -1
pos = (target, const(size.ground.front) -10), (target, const(size.mid.pos.y))
supermovetime = -1
pausemovetime = -1
ontop = 1
ownpal = 1

[State 4206, Counter FX]
type = helper
trigger1 = root, var(9)
trigger1 = movecontact = 1 && numtarget
trigger1 = (target, movetype = H) && !(target, time)
helpertype = normal
stateno = 8290
ID = 8290
name = "Counter FX"
postype = p2
facing = -1
pos = (target, const(size.ground.front) -10), (target, const(size.mid.pos.y))
ownpal = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State 4206, End]
type = destroyself
triggerall = !animtime
trigger1 = !numtarget
trigger2 = numtarget
trigger2 = target, time <= 1 && !(target, hitshakeover)



;========================<GROUND IMPACT>=============================
[Statedef 4210]
type = C
physics = N
movetype = A
ctrl = 0
anim = 4210

[State 4210, hitoverride]
type = hitoverride
trigger1 = 1
attr = SCA, AA, AP, AT
time = -1
stateno = 4210
ignorehitpause = 1

[State 4210, HB]
type = nothitby
trigger1 = 1
time = -1
value = SCA, AA, AP, AT
ignorehitpause = 1

[State 4210, Hit]
type = hitdef
trigger1 = !time
trigger1 = (p2stateno != [120, 155]) || (p2statetype != C)
attr = S, HP
hitflag = M
guardflag = L
priority = 1, Miss
damage = 0, 0
getpower = 0, 0
givepower = 0, 0
pausetime = 0, 8
guard.pausetime = 0, 0
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = Trip
air.type = Trip
ground.hittime = 12
ground.slidetime = 12
guard.hittime = 12
air.hittime = 120
ground.velocity = -1, -8.24
ground.cornerpush.veloff = 0
guard.velocity = 0
guard.cornerpush.veloff = 0
air.velocity = -1, -8.24
air.cornerpush.veloff = 0
yaccel = 0.677
fall = 1
fall.recover = 0
p2facing = 1
forcestand = 1
hitsound = -1
guardsound = -1
sparkno = -1
guard.sparkno = -1
sparkxy = -10, 0
numhits = 0

[State 4210, Idle]
type = statetypeset
trigger1 = time
movetype = I

[State 4210, Dust]
type = explod
trigger1 = !time
anim = 4211
ID = 4211
sprpriority = -2
postype = p1
pos = 0, 16
removetime = 16

[State 4210, Fade]
type = modifyexplod
trigger1 = numexplod(4211)
ID = 4211
scale = 0.5 + (0.1 * time), 0.075 + (0.015 * time)

[State 4210, Fade]
type = modifyexplod
trigger1 = time >= 8
ID = 4211
trans = addalpha
alpha = 256 - (32 * (time - 8)), 256

[State 4210, End]
type = destroyself
trigger1 = time >= 16


;========================<TENSHOU KAIREKI JIN>=============================
[Statedef 4305]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 5

[State 4305, hitoverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 4305
ignorehitpause = 1
[State 4305, HB]
type = nothitby
trigger1 = 1
time = -1
value = SCA, AA, AP, AT
ignorehitpause = 1

[State 4305, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256 - 32 * (time % 3), 256
ignorehitpause = 1

[State 4305, Pos]
type = posset
trigger1 = 1
y = 0

[State 4305, Vel]
type = velmul
trigger1 = 1
x = 0.95
[State 4305, Vel]
type = velset
trigger1 = !time && !prevstateno
x = 0;4
y = 0

[State 4305, Vel]
type = posadd
trigger1 = animelem = 2 || animelem = 3
x = 10

[State 4305, Strength]
type = varset
trigger1 = !time && !prevstateno
var(10) = 6
[State 4305, Anim]
type = changeanim
trigger1 = !time && !prevstateno
value = 4305

[State 4305, ProjContact]
type = varset
trigger1 = movecontact = 1 && numenemy
trigger1 = (enemynear, movetype = H) && !(enemynear, time)
var(18) = 1
ignorehitpause = 1
[State 4305, ProjContact]
type = parentvarset
trigger1 = movecontact = 1 && numenemy
trigger1 = (enemynear, movetype = H) && !(enemynear, time)
trigger1 = root, stateno = 4300
var(18) = 1
ignorehitpause = 1

[State 4305, HitSound]
type = playsnd
trigger1 = movecontact = 1
value = 2, ifelse((movehit && numtarget), 11, 0)
channel = 2
ignorehitpause = 1

[State 4305, Unguardable Freeze]
type = assertspecial
trigger1 = movetype = A
trigger1 = !movecontact && !numtarget
trigger1 = numenemy >= 1
trigger1 = enemynear(0), time <= 0
trigger1 = enemynear(0), stateno = 120
trigger1 = enemynear(0), anim != [120, 155]
trigger2 = numenemy >= 2
trigger2 = enemynear(0), time <= 0 && enemynear(1), time <= 0
trigger2 = enemynear(0), stateno = 120 && enemynear(1), stateno = 120
trigger2 = (enemynear(0), anim != [120, 155]) && (enemynear(1), anim != [120, 155])
flag = unguardable

[State 4305, Miss]
type = hitdef
trigger1 = 1
attr = S, HP
hitflag =
sparkxy = -10, 0

[State 4305, Hit]
type = hitdef
triggerall = root, var(15) < 10
trigger1 = animelem = 2 || animelem = 4 || animelem = 6 || animelem = 8 || animelem = 10
trigger2 = animelem = 3 || animelem = 5 || animelem = 7 || animelem = 9 || animelem = 11
attr = S, HP
damage = ceil(37 * root, fvar(11)), 7
guard.dist = 320
animtype = Hard
fall.animtype = Up
guardflag = M
hitflag = MAFD
priority = 4, Hit
pausetime = 0, 0
guard.pausetime = 0, 12
sparkno = -1
guard.sparkno = -1
guardsound = -1
ground.type = High
ground.slidetime = 18
ground.hittime = 18
ground.velocity = 1.5, -8.5
ground.cornerpush.veloff = 0
air.velocity = 1.5, -8.5
yaccel = 0.4850
getpower = 0, 0
givepower = 40, 40
guard.velocity = -10.52
fall = 1
fall.recover = 0
palfx.sinadd = 128, 128, 128, 4
palfx.mul = 128, 128, 128
palfx.time = 60
sprpriority = 4
airguard.ctrltime = 16
airguard.velocity = -6.00, -1.00
p2facing = ifelse((p2stateno != [5020, 5119]) && p2statetype != L, 1, 0)
forcestand = 1

[State 4305, Hit]
type = hitdef
trigger1 = animelem = 12
attr = S, HP
damage = ceil(37 * root, fvar(11)), 4
guard.dist = 320
animtype = Diagup
air.animtype = Diagup
fall.animtype = Diagup
guardflag = M
hitflag = MAFD
priority = 4, Hit
pausetime = 0, 0
guard.pausetime = 0, 12
sparkno = -1
guard.sparkno = -1
guardsound = -1
ground.type = High
ground.slidetime = 18
ground.hittime = 18
ground.velocity = -3, -8.5
ground.cornerpush.veloff = 0
air.velocity = -3, -8.5
yaccel = 0.4850
getpower = 0, 0
givepower = 40, 40
guard.velocity = -10.52
fall = 1
fall.recover = 0
palfx.sinadd = 128, 128, 128, 4
palfx.mul = 128, 128, 128
palfx.time = 60
sprpriority = 4
airguard.ctrltime = 16
airguard.velocity = -6.00, -1.00
p2facing = ifelse((p2stateno != [5020, 5119]) && p2statetype != L, 1, 0)
forcestand = 1

[State 4305, Flame Particles]
type = helper
trigger1 = !numhelper(8150)
trigger1 = movehit = 1 && numtarget
trigger1 = var(40) := (target, ID)
helpertype = normal
stateno = 8150
ID = 8150
name = "Flame Particles"
postype = p2
ownpal = 1
ignorehitpause = 1

[State 4305, Spark]
type = helper
trigger1 = root, fvar(31)
trigger1 = movecontact = 1 && numtarget
trigger1 = (target, movetype = H) && !(target, time)
helpertype = normal
stateno = ifelse(moveguarded, 8001, 8014)
ID = 8000
name = "Spark"
postype = p2
facing = -1
pos = (target, const(size.ground.front) - 30), (target, const(size.mid.pos.y))
facing = 1
ownpal = 1
size.xscale = 1
size.yscale = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State 4305, Spark]
type = explod
trigger1 = !(root, fvar(31))
trigger1 = movecontact = 1 && numtarget
trigger1 = (target, movetype = H) && !(target, time)
anim = Fifelse(moveguarded, 40, 3)
ID = 8000
postype = p2
facing = -1
pos = (target, const(size.ground.front) - 30), (target, const(size.mid.pos.y))
supermovetime = -1
pausemovetime = -1
ontop = 1
ownpal = 1

[State 4305, Counter FX]
type = helper
trigger1 = root, var(9)
trigger1 = movecontact = 1 && numtarget
trigger1 = (target, movetype = H) && !(target, time)
helpertype = normal
stateno = 8290
ID = 8290
name = "Counter FX"
postype = p2
facing = -1
pos = (target, const(size.ground.front) -10), (target, const(size.mid.pos.y))
ownpal = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State 4305, End]
type = destroyself
triggerall = !animtime
trigger1 = !numtarget
trigger2 = numtarget
trigger2 = target, time <= 1 && !(target, hitshakeover)


;========================<TENMA SHINZUI WARI F.X.>=============================
[Statedef 3305]
physics = N
velset = 0, 0
anim = 3305
sprpriority = 3

[State 3305, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3305, Bind]
type = bindtoroot
trigger1 = root, anim = 3300
ignorehitpause = 1

[State 3305, End]
type = destroyself
trigger1 = !animtime || root, stateno != 3300 || root, movetype = H


;========================<MISOGI ILLUSIONS>=============================
[Statedef 4104]
physics = N
anim = 9999

[State 4104, FX]
type = explod
trigger1 = !time
anim = 4110
ID = 4110
sprpriority = -1
postype = p1
pos = 0, 0
vel = 0, 0
removetime = -2
ownpal = 1
pausemovetime = 300
supermovetime = 300

[State 4104, particles]
type = explod
trigger1 = time = [1, 16]
vel = 0, -(random / 200.0)
accel = 0, -0.5
anim = 4111
sprpriority = -1
postype = p1
pos = -2, -45
random = 50, 50
facing = -1 + (random < 500) * 2
removetime = -2
ownpal = 1
scale = 0.25, 0.25
pausemovetime = 300
supermovetime = 300

[State 4104, End]
type = destroyself
trigger1 = time >= 60


;========================<AURA>=============================
[Statedef 6000]
physics = N
velset = 0, 0
anim = 6000
sprpriority = -2
[State 6000, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256 - 32 * (time % 3), 256
ignorehitpause = 1

[State 6000, Var]
type = varset
trigger1 = !time
var(0) = root, anim

[State 6000, Shadows]
type = afterimage
trigger1 = !time
time = 999
timegap = 1
framegap = 1
length = 2
palcontrast = 100, 100, 100
trans = add

[State 6000, Bind]
type = bindtoroot
trigger1 = 1

[State 6000, Priority]
type = sprpriority
trigger1 = root, stateno = 3000
value = 2

[State 6000, End]
type = destroyself
trigger1 = (root, anim) != var(0)
trigger2 = root, stateno = 195 && root, animelemtime(19) >= 0
trigger3 = root, stateno = 192 && root, animelemtime(26) >= 0
trigger4 = root, stateno = 1020 && root, animelemtime(9) >= 0
trigger5 = root, stateno = 1400 && root, animelemtime(5) >= 0
trigger6 = root, stateno = 3020 && root, anim = 3020 && root, animelemtime(22) >= 0
trigger7 = root, stateno = 188 && root, anim = 188 && root, animelemtime(39) >= 0


;========================<METSU>=============================
[Statedef 6002]
physics = N
velset = 0, -0.5
anim = 6002
sprpriority = -1
[State 6002, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1
[State 6002, Shadows]
type = afterimage
trigger1 = !time
time = 999
timegap = 1
framegap = 1
length = 2
palcontrast = 120, 90, 150
trans = add
[State 6002, Shadows]
type = velset
trigger1 = animelem = 6
y = -2
[State 6002, Fade]
type = palfx
trigger1 = animelem = 7
sinadd = -255, -255, -255, 64
time = 16

[State 6002, Bind]
type = posset
trigger1 = root, stateno = 195 && root, movetype != H
x = ceil(root, pos x) + ifelse(root, facing = -1, 5, -5)

[State 6002, End]
type = destroyself
trigger1 = !animtime || root, movetype = H


;========================<KKZ AURA>=============================
[Statedef 4203]
physics = N
velset = 0, 0
anim = 4203
sprpriority = 0

[State 4203, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 4203, Shadows]
type = afterimage
trigger1 = !time
time = 60
timegap = 1
framegap = 2
length = 5
palcolor = 256
palinvertall = 0
palbright = 0, 0, 0
palcontrast = 128, 128, 128
palpostbright = 0,0,0
paladd = 0, 0, 0
palmul = 0.75, 0.75, 0.75
trans = add

[State 4203, End]
type = destroyself
trigger1 = root, stateno != 4200 || root, anim != 4200
trigger2 = root, stateno = 4200 && root, animelemtime(19) >= 0
trigger3 = !animtime


;========================<RED PARTICLES>=============================
[Statedef 6021]
physics = N
anim = 6021
sprpriority = 4
[State 6021, No Shadow]
type = assertspecial
trigger1 = 1
flag = noshadow
[State 6021, Assert]
type = assertspecial
trigger1 = !time
flag = invisible
[State 6021, Fade]
type = palfx
trigger1 = !time
add = -255, -255, -255
sinadd = 255, 255, 255, 40
time = 10
[State 6021, Vel]
type = velset
trigger1 = !time
x = (rootdist x + 16) / 36.0
y = (rootdist y -79) / 36.0
[State 6021, End]
type = destroyself
trigger1 = !animtime


;========================<VEGA>=============================
[Statedef 6100]
physics = N
velset = 0, 0
anim = 6100
sprpriority = 4

[State 6100, offset]
type = offset
trigger1 = 1
y = 6

[State 6100, Snd]
type = playsnd
trigger1 = time = 5
value = 6, random < 500
channel = 0

[State 6100, blood]
type = explod
trigger1 = animelem = 9
anim = 6105
ID = 6105
sprpriority = 5
postype = p1
bindtime = -1

[State 6100, Snd]
type = playsnd
trigger1 = animelem = 9
value = 2, 9
channel = 2

[State 6100, Snd]
type = playsnd
trigger1 = animelem = 12
value = 6, 11
channel = 0

[State 6100, Snd]
type = playsnd
trigger1 = animelem = 20
value = f7, 0

[State 6100, FX]
type = explod
trigger1 = animelem = 20
anim = f60
postype = p1
pos = 0, 0
sprpriority = -10

[State 6100, Gone]
type = changestate
trigger1 = animelemtime(23) >= 0
value = 6101


;--- DEAD ---
[Statedef 6101]
physics = N
velset = 0, 0
anim = 6101
sprpriority = 4

[State 6101, offset]
type = offset
trigger1 = 1
y = 6

[State 6101, Fade]
type = trans
trigger1 = time >= 180
trans = addalpha
alpha = 256 - 4 * (time - 180), 4 * (time - 180)

[State 6101, Gone]
type = destroyself
trigger1 = time >= 244

[State 6101, Gone]
type = destroyself
triggerall = numenemy
trigger1 = enemy, name = "Shin Gouki" && enemy, authorname = "Phantom.of.the.Server" && enemy, numhelper(6100)
trigger2 = enemy, name = "Vega" && enemy, authorname = "Phantom.of.the.Server"
trigger3 = enemy, name = "cvsvega" && (enemy, authorname = "Warusaki3" || enemy, authorname != "Gargoyle")
trigger4 = enemy, name = "M. Bison" && enemy, authorname = "VK, Updated by Terry Kuo, adapted by Tenebrous"
trigger5 = enemy, name = "M.Bison" && enemy, authorname = "N -Mario"
trigger6 = enemy, name = "CvSBison" && enemy, authorname = "Team Kai (Saiai and Koga)"
trigger7 = enemy, name = "[Necromancer's] M. Bison" || enemy, name = "Sevil Nahte"


;========================<DUST>=============================
;--- Jump ---
[Statedef 7100]
physics = N
velset = 0, 0
anim = 9999

[State 7100, Bind]
type = bindtoroot
trigger1 = time

[State 7100, Dust]
type = explod
trigger1 = !time
anim = 7100
ID = 7100
sprpriority = 3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1

[State 7100, Dust]
type = explod
trigger1 = !time || time = 2 || time = 6
anim = 7101
ID = 7100
sprpriority = 3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1

[State 7100, Assert]
type = assertspecial
trigger1 = 1
flag = invisible

[State 7100, End]
type = destroyself
trigger1 = !numexplod
trigger2 = time >= 60


;--- Dash ---
[Statedef 7104]
type = A
anim = 9999
velset = 0, 0
sprpriority = 5

[State 7104, Pos]
type = posset
trigger1 = !time = 0
y = 0

[State 7104, Dust]
type = explod
trigger1 = time = 0 || time = 3 || time = 6
anim = 7104
ID = ifelse((time = 6), 3, ifelse((time = 3), 2, 1))
postype = p1
pos = 0, -4
random = 8, 8
vel = -3 -(random / 1000.0), -2 -(random / 2000.0)
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
removetime = 16
sprpriority = 3
pausemovetime = -1
supermovetime = -1

[State 7104, Scale]
type = modifyexplod
trigger1 = numexplod(1)
ID = 1
scale = 0.1 + (0.025 * time), 0.1 + (0.025 * time)
trans = addalpha
alpha = 256 -(16 * time), 256
[State 7104, Scale]
type = modifyexplod
trigger1 = numexplod(2)
ID = 2
scale = 0.1 + (0.025 * (time -3)), 0.1 + (0.025 * (time -3))
trans = addalpha
alpha = 256 -(16 * (time -3)), 256
[State 7104, Scale]
type = modifyexplod
trigger1 = numexplod(3)
ID = 3
scale = 0.1 + (0.025 * (time -6)), 0.1 + (0.025 * (time -6))
trans = addalpha
alpha = 256 -(16 * (time -6)), 256

[State 7104, End]
type = removeexplod
trigger1 = time >= 22
[State 7104, End]
type = destroyself
trigger1 = !numexplod


;--- Impact ---
[Statedef 8110]
type = A
anim = 9999
velset = 0, 0
sprpriority = 5

[State 8110, Pos]
type = posset
trigger1 = !time
y = 0

[State 8110, FX Ground]
type = explod
trigger1 = !time
anim = 8110
ID = 1
postype = p1
removetime = 8
sprpriority = -10
pausemovetime = -1
supermovetime = -1

[State 8110, FX Back]
type = explod
trigger1 = !time
anim = 8111
ID = 2
postype = p1
removetime = 8
sprpriority = -10
pausemovetime = -1
supermovetime = -1

[State 8110, Scale]
type = modifyexplod
trigger1 = numexplod
scale = 0.25 + (0.03125 * time), 0.25 + (0.03125 * time)
trans = addalpha
alpha = 256 - (32 * time), 256

[State 8110, End]
type = removeexplod
trigger1 = time >= 8

[State 8110, End]
type = destroyself
trigger1 = !numexplod


;--- Impact Small ---
[Statedef 8111]
type = A
anim = 9999
velset = 0, 0
sprpriority = 5

[State 8111, Pos]
type = posset
trigger1 = !time
y = 0

[State 8111, Pos]
type = posset
trigger1 = !time
trigger1 = root, stateno = 175
y = 8

[State 8111, FX Ground]
type = explod
trigger1 = !time
anim = 8110
ID = 1
postype = p1
removetime = 8
sprpriority = -10
pausemovetime = -1
supermovetime = -1

[State 8111, FX Back]
type = explod
trigger1 = !time
anim = 8111
ID = 2
postype = p1
removetime = 8
sprpriority = 2
pausemovetime = -1
supermovetime = -1

[State 8111, Scale]
type = modifyexplod
trigger1 = numexplod
scale = 0.125 + (0.015625 * time), 0.125 + (0.015625 * time)
trans = addalpha
alpha = 256 - (32 * time), 256

[State 8111, End]
type = removeexplod
trigger1 = time >= 8

[State 8111, End]
type = destroyself
trigger1 = !numexplod


;========================<PURPLE FLAMES>=============================
[Statedef 8150]
type = A
velset = 0, 0
anim = 9999

[State 8150, Player]
type = varset
trigger1 = !time
var(0) = parent, var(40)

[State 8150, Time]
type = varadd
trigger1 = 1
var(1) = -1

[State 8150, Time]
type = varset
trigger1 = !time
trigger2 = root, stateno = 195
trigger2 = root, movehit = [1, 2]
trigger3 = root, stateno = 3300
trigger3 = root, movehit = [1, 2]
trigger4 = numhelper(3005)
trigger4 = helper(3005), var(18) && helper(3005), time <= 1
trigger5 = numhelper(3055)
trigger5 = helper(3055), var(18) && helper(3055), time <= 1
trigger6 = numhelper(4205)
trigger6 = helper(4205), movehit = [1, 2]
trigger7 = numhelper(4206)
trigger7 = helper(4206), movehit = [1, 2]
trigger8 = numhelper(4305)
trigger8 = helper(4305), movehit = [1, 2]
var(1) = 60

[State 8150, Pos]
type = posset
trigger1 = playerIDexist(var(0))
x = ceil(playerID(var(0)), pos x)
y = ceil(playerID(var(0)), pos y) + (playerID(var(0)), const(size.mid.pos.y))

[State 8150, Pos]
type = posset
trigger1 = playerIDexist(var(0))
trigger1 = playerID(var(0)), statetype = L
x = ceil(playerID(var(0)), pos x)
y = ceil(playerID(var(0)), pos y) - 20

[State 8150, Turn]
type = turn
trigger1 = playerIDexist(var(0))
trigger1 = facing != (playerID(var(0)), facing)

[State 8150, Snd]
type = playsnd
trigger1 = playerIDexist(var(0))
trigger1 = playerID(var(0)), hitshakeover
value = 5, 2
persistent = 0

[State 8150, Flames]
type = explod
trigger1 = playerIDexist(var(0))
anim = 8150
sprpriority = 3
postype = p1
random = 40, 40
vel = (random / 2000.0), -0.5 -(random / 2000.0)
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
scale = 0.5, 0.5
ownpal = 1

[State 8150, Flames]
type = explod
trigger1 = playerIDexist(var(0))
anim = 8150
sprpriority = -1
postype = p1
random = 60, 60
vel = (random / 2000.0), -0.5 -(random / 2000.0)
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
scale = 0.5, 0.5
ownpal = 1

[State 8150, End]
type = destroyself
trigger1 = !playerIDexist(var(0))
trigger2 = var(1) <= 0

[State 8150, End]
type = destroyself
triggerall = playerIDexist(var(0))
trigger1 = (playerID(var(0)), movetype = H) && (playerID(var(0)), stateno = [1114100, 1114110]);misogi


;========================<RED FLAMES>=============================
[Statedef 8151]
type = A
velset = 0, 0
anim = 9999

[State 8151, Player]
type = varset
trigger1 = !time
var(0) = parent, var(40)

[State 8151, Time]
type = varadd
trigger1 = 1
var(1) = -1

[State 8151, Time]
type = varset
trigger1 = !time
trigger2 = numhelper(1025)
trigger2 = helper(1025), var(18) && helper(1025), time <= 1
var(1) = 60

[State 8151, Pos]
type = posset
trigger1 = playerIDexist(var(0))
x = ceil(playerID(var(0)), pos x)
y = ceil(playerID(var(0)), pos y) + (playerID(var(0)), const(size.mid.pos.y))

[State 8151, Pos]
type = posset
trigger1 = playerIDexist(var(0))
trigger1 = playerID(var(0)), statetype = L
x = ceil(playerID(var(0)), pos x)
y = ceil(playerID(var(0)), pos y) - 20

[State 8151, Turn]
type = turn
trigger1 = playerIDexist(var(0))
trigger1 = facing != (playerID(var(0)), facing)

[State 8151, Snd]
type = playsnd
trigger1 = playerIDexist(var(0))
trigger1 = playerID(var(0)), hitshakeover
value = 5, 2
persistent = 0

[State 8151, Flames]
type = explod
trigger1 = playerIDexist(var(0))
anim = 8151
sprpriority = 3
postype = p1
random = 40, 40
vel = (random / 2000.0), -0.5 -(random / 2000.0)
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
scale = 0.5, 0.5
ownpal = 1

[State 8151, Flames]
type = explod
trigger1 = playerIDexist(var(0))
anim = 8151
sprpriority = -1
postype = p1
random = 60, 60
vel = (random / 2000.0), -0.5 -(random / 2000.0)
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
scale = 0.5, 0.5
ownpal = 1

[State 8151, End]
type = destroyself
trigger1 = !playerIDexist(var(0))
trigger2 = var(1) <= 0

[State 8151, End]
type = destroyself
triggerall = playerIDexist(var(0))
trigger1 = (playerID(var(0)), movetype = H) && (playerID(var(0)), stateno = [1114100, 1114110]);misogi


;====================<POWER CHARGE>====================
;--- MAIN FX ---
[Statedef 7240]
type = A
physics = N
movetype = I
anim = 9999
ctrl = 0
velset = 0, 0

[State 7240, Bind]
type = bindtoroot
trigger1 = root, stateno = 740 && root, anim = 740
pos = -4, 0

[State 7240, Snd]
type = playsnd
trigger1 = !time
value = 7, 4
channel = 0

[State 7240, Snd]
type = playsnd
trigger1 = 1
value = 7, 5
channel = 1
lowpriority = 1
volumescale = ifelse(time < 180, (time * 0.277), 50)

[State 7240, Aura]
type = explod
trigger1 = !numexplod(7240)
ID = 7240
anim = 7240
sprpriority = 3
postype = p1
bindtime = -1
removetime = -1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1
[State 7240, Dust]
type = explod
trigger1 = !(time % 6)
anim = 7105
sprpriority = -3
postype = p1
pos = 0, -ceil(pos y)
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 7240, FX]
type = modifyexplod
trigger1 = numexplod(7240)
trigger1 = root, time <= 60
ID = 7240
scale = 0.5, 0.125

[State 7240, FX]
type = modifyexplod
trigger1 = numexplod(7240)
trigger1 = root, time = [61, 119]
ID = 7240
scale = 0.5, 0.1 + ((root, time - 60) * 0.00625)

[State 7240, FX]
type = modifyexplod
trigger1 = numexplod(7240)
trigger1 = root, time >= 120
ID = 7240
scale = 0.5, 0.5

[State 7240, End]
type = stopsnd
trigger1 = root, stateno != 740
trigger2 = root, movetype = H
channel = 0
[State 7240, End]
type = stopsnd
trigger1 = root, stateno != 740
trigger2 = root, movetype = H
channel = 1

[State 7240, End]
type = removeexplod
trigger1 = root, stateno != 740
trigger2 = root, movetype = H

[State 7240, End]
type = destroyself
trigger1 = root, stateno != 740
trigger2 = root, movetype = H


;--- Particles ---
[Statedef 7241]
type = A
physics = N
movetype = I
anim = 9999
ctrl = 0
velset = 0, 0

[State 7241, Bind]
type = bindtoroot
trigger1 = !(time % 8)
pos = ceil(-160 + (random / 3.125)), ceil(160 - (random / 3.125))

[State 7241, Particle]
type = explod
trigger1 = (time % 8) = 1
anim = 7241
sprpriority = ifelse(random < 750, 5, -1)
postype = p1
vel = ((rootdist x - 5) / 32.0), ((rootdist y - 57) / 32.0)
scale = ifelse(random < 500, 0.5, -0.5), ifelse(random < 500, 0.5, -0.5)
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 7241, End]
type = removeexplod
trigger1 = root, stateno != 740
[State 7241, End]
type = destroyself
trigger1 = root, stateno != 740


;====================<ZERO COUNTER PAUSE>====================
[Statedef 7250]
type = A
physics = N
movetype = I
anim = 9999
ctrl = 0
velset = 0, 0

[State 7250, BG PalFX]
type = bgpalfx
trigger1 = 1
time = 1
color = 16 * time
mul = 16 * time, 16 * time, 16 * time

[State 7250, Circle]
type = explod
trigger1 = !time
anim = 7250
ID = 1
sprpriority = 3
postype = p1
removetime = 16
supermovetime = -1
ownpal = 1

[State 7250, Scale]
type = modifyexplod
trigger1 = numexplod(1)
ID = 1
scale = (0.0625 * time), (0.0625 * time)
trans = addalpha
alpha = 256 -(16 * time), 256

[State 7250, Lightning]
type = explod
trigger1 = !time
anim = 7251
ID = 2
sprpriority = -2
postype = p1
pos = 0, -ceil(pos y)
supermovetime = -1
ownpal = 1

[State 7250, End]
type = destroyself
trigger1 = time >= 16


;========================<CUSTOM COMBO PAUSE=============================
[Statedef 7260]
type = A
physics = N
movetype = I
anim = 7260
ctrl = 0
velset = 0, 0
sprpriority = 5

[State 7260, No Shadow]
type = assertspecial
trigger1 = 1
flag = noshadow

[State 7260, BG PalFX]
type = bgpalfx
trigger1 = time < 25
time = 1
mul = 128, 128, 128

[State 7260, Rotate]
type = angleset
trigger1 = !time
value = 6 * (random % 60)
[State 7260, Rotate]
type = angleadd
trigger1 = 1
value = -6

[State 7260, Scale]
type = angledraw
trigger1 = time < 8
scale = (0.0625 * time), (0.0625 * time)
[State 7260, Scale]
type = angledraw
trigger1 = time >= 8
scale = 0.5, 0.5
[State 7260, Trans]
type = trans
trigger1 = time < 16
trans = addalpha
alpha = 256, 256
[State 7260, Trans]
type = trans
trigger1 = time >= 16
trans = addalpha
alpha = ceil(256 - 25.6 * (time -16)), 256

[State 7260, Lines]
type = explod
trigger1 = !time
anim = 7261
ID = 1
sprpriority = 5
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
removetime = 16
supermovetime = -1

[State 7260, Scale]
type = modifyexplod
trigger1 = numexplod(1)
ID = 1
scale = 2 -(0.125 * time), 2 -(0.125 * time)
trans = addalpha
alpha = ifelse(time < 4, 64 * time, 256), 256

[State 7260, Circle]
type = explod
trigger1 = time = 16
anim = 7262
ID = 2
sprpriority = 5
postype = p1
removetime = 32
supermovetime = -1

[State 7260, Scale]
type = modifyexplod
trigger1 = numexplod(2)
ID = 2
scale = (0.1 * (time -16)), (0.1 * (time -16))
trans = addalpha
alpha = ceil(256 - 25.6 * (time -16)), 256

[State 7260, Safety]
type = removeexplod
trigger1 = time >= 26
[State 7260, End]
type = destroyself
trigger1 = time >= 26


;========================<SUPERPAUSE FX>=============================
;----- Level 1 -----
[Statedef 7500]
type = A
velset = 0, 0
anim = 7500
sprpriority = 5

[State 7500, Bind]
type = varset
trigger1 = !time
fvar(24) = -rootdist x

[State 7500, Bind]
type = varset
trigger1 = !time
fvar(25) = -rootdist y

[State 7500, Bind]
type = bindtoroot
trigger1 = 1
pos = fvar(24), fvar(25)

[State 7500, No Shadow]
type = assertspecial
trigger1 = 1
flag = noshadow

[State 7500, BG PalFX]
type = bgpalfx
trigger1 = time < 39
time = 1
color = 0
mul = 0, 0, 256

[State 7500, Rotate]
type = angleset
trigger1 = !time
value = 6 * (random % 60)
[State 7500, Rotate]
type = angleadd
trigger1 = 1
value = -6

[State 7500, Scale]
type = angledraw
trigger1 = time < 16
scale = (0.03125 * time), (0.03125 * time)
[State 7500, Scale]
type = angledraw
trigger1 = time >= 16
scale = 0.5, 0.5
[State 7500, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256

[State 7500, Lines]
type = explod
trigger1 = time = 0 || time = 8 || time = 16 || time = 24
anim = 7501
ID = ifelse(time = 24, 4, ifelse(time = 16, 3, ifelse(time = 8, 2, 1)))
sprpriority = 5
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
bindtime = -1
removetime = 16
supermovetime = -1

[State 7500, Scale]
type = modifyexplod
trigger1 = numexplod(1)
ID = 1
scale = 1 -(0.0625 * time), 1 -(0.0625 * time)
trans = addalpha
alpha = ifelse(time < 4, 64 * time, 256), 256
[State 7500, Scale]
type = modifyexplod
trigger1 = numexplod(2)
ID = 2
scale = 1 -(0.0625 * (time -8)), 1 -(0.0625 * (time -8))
trans = addalpha
alpha = ifelse((time -8) < 4, 64 * (time -8), 256), 256
[State 7500, Scale]
type = modifyexplod
trigger1 = numexplod(3)
ID = 3
scale = 1 -(0.0625 * (time -16)), 1 -(0.0625 * (time -16))
trans = addalpha
alpha = ifelse((time -16) < 4, 64 * (time -16), 256), 256
[State 7500, Scale]
type = modifyexplod
trigger1 = numexplod(4)
ID = 4
scale = 1 -(0.0625 * (time -24)), 1 -(0.0625 * (time -24))
trans = addalpha
alpha = ifelse((time -24) < 4, 64 * (time -24), 256), 256

[State 7500, Circle]
type = explod
trigger1 = time = 24
anim = 7502
ID = 10
sprpriority = 5
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
bindtime = -1
removetime = 32
supermovetime = -1

[State 7500, Scale]
type = modifyexplod
trigger1 = numexplod(10)
ID = 10
scale = 2 -(0.125 * (time -24)), 2 -(0.125 * (time -24))
trans = addalpha
alpha = ifelse((time -24) < 4, 64 * (time -24), 256), 256

[State 7500, Safety]
type = removeexplod
trigger1 = time >= 40
[State 7500, End]
type = destroyself
trigger1 = time >= 40


;----- Level 2 -----
[Statedef 7510]
type = A
velset = 0, 0
anim = 7510
sprpriority = 5

[State 7510, Bind]
type = varset
trigger1 = !time
fvar(24) = -rootdist x

[State 7510, Bind]
type = varset
trigger1 = !time
fvar(25) = -rootdist y

[State 7510, Bind]
type = bindtoroot
trigger1 = 1
pos = fvar(24), fvar(25)

[State 7510, No Shadow]
type = assertspecial
trigger1 = 1
flag = noshadow

[State 7510, BG PalFX]
type = bgpalfx
trigger1 = time < 39
time = 1
color = 0
mul = 192, 0, 256

[State 7510, Rotate]
type = angleset
trigger1 = !time
value = 6 * (random % 60)
[State 7510, Rotate]
type = angleadd
trigger1 = 1
value = -6

[State 7510, Scale]
type = angledraw
trigger1 = time < 16
scale = (0.03125 * time), (0.03125 * time)
[State 7510, Scale]
type = angledraw
trigger1 = time >= 16
scale = 0.5, 0.5
[State 7510, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256

[State 7510, Lines]
type = explod
trigger1 = time = 0 || time = 8 || time = 16 || time = 24
anim = 7511
ID = ifelse(time = 24, 4, ifelse(time = 16, 3, ifelse(time = 8, 2, 1)))
sprpriority = 5
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
bindtime = -1
removetime = 16
supermovetime = -1

[State 7510, Scale]
type = modifyexplod
trigger1 = numexplod(1)
ID = 1
scale = 1 -(0.0625 * time), 1 -(0.0625 * time)
trans = addalpha
alpha = ifelse(time < 4, 64 * time, 256), 256
[State 7510, Scale]
type = modifyexplod
trigger1 = numexplod(2)
ID = 2
scale = 1 -(0.0625 * (time -8)), 1 -(0.0625 * (time -8))
trans = addalpha
alpha = ifelse((time -8) < 4, 64 * (time -8), 256), 256
[State 7510, Scale]
type = modifyexplod
trigger1 = numexplod(3)
ID = 3
scale = 1 -(0.0625 * (time -16)), 1 -(0.0625 * (time -16))
trans = addalpha
alpha = ifelse((time -16) < 4, 64 * (time -16), 256), 256
[State 7510, Scale]
type = modifyexplod
trigger1 = numexplod(4)
ID = 4
scale = 1 -(0.0625 * (time -24)), 1 -(0.0625 * (time -24))
trans = addalpha
alpha = ifelse((time -24) < 4, 64 * (time -24), 256), 256

[State 7510, Circle]
type = explod
trigger1 = time = 24
anim = 7512
ID = 10
sprpriority = 5
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
bindtime = -1
removetime = 32
supermovetime = -1

[State 7510, Scale]
type = modifyexplod
trigger1 = numexplod(10)
ID = 10
scale = 2 -(0.125 * (time -24)), 2 -(0.125 * (time -24))
trans = addalpha
alpha = ifelse((time -24) < 4, 64 * (time -24), 256), 256

[State 7510, Safety]
type = removeexplod
trigger1 = time >= 40
[State 7510, End]
type = destroyself
trigger1 = time >= 40


;----- Level 3 -----
[Statedef 7520]
type = A
velset = 0, 0
anim = 7520
sprpriority = 5

[State 7520, Bind]
type = varset
trigger1 = !time
fvar(24) = -rootdist x

[State 7520, Bind]
type = varset
trigger1 = !time
fvar(25) = -rootdist y

[State 7520, Bind]
type = bindtoroot
trigger1 = 1
pos = fvar(24), fvar(25)

[State 7520, No Shadow]
type = assertspecial
trigger1 = 1
flag = noshadow

[State 7520, Assert]
type = assertspecial
trigger1 = time < 40
flag = nobardisplay
flag2 = noBG
flag3 = noFG

[State 7520, Rotate]
type = angleset
trigger1 = !time
value = 6 * (random % 60)
[State 7520, Rotate]
type = angleadd
trigger1 = 1
value = -6

[State 7520, Scale]
type = angledraw
trigger1 = time < 16
scale = (0.03125 * time), (0.03125 * time)
[State 7520, Scale]
type = angledraw
trigger1 = time >= 16
scale = 0.5, 0.5
[State 7520, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256

[State 7520, Portrait]
type = explod
trigger1 = !time
anim = 7525
ID = 20
sprpriority = -16
postype = back
bindtime = -1
removetime = 40
supermovetime = -1
[State 7520, Portrait]
type = explod
trigger1 = !time
anim = 7525
ID = 21
sprpriority = -16
postype = back
bindtime = -1
removetime = 40
supermovetime = -1

[State 7520, Scale]
type = modifyexplod
trigger1 = numexplod(20) && time < 16
ID = 20
postype = back
pos = 160, ifelse((gamewidth / gameheight) > 1.55, 90, 120)
scale = 1 - (0.03125 * time), 1 - (0.03125 * time)
trans = addalpha
alpha = (8 * time), 256
[State 7520, Scale]
type = modifyexplod
trigger1 = numexplod(21) && time < 16
ID = 21
postype = back
pos = 160, ifelse((gamewidth / gameheight) > 1.55, 90, 120)
scale = 2 - (0.09375 * time), 2 - (0.09375 * time)
trans = addalpha
alpha = (8 * time), 256

[State 7520, Scale]
type = modifyexplod
trigger1 = numexplod(20) && (time = [16, 32])
ID = 20
postype = back
pos = 160, ifelse((gamewidth / gameheight) > 1.55, 90, 120)
scale = 0.5, 0.5
trans = addalpha
alpha = 256, 256
[State 7520, Scale]
type = modifyexplod
trigger1 = numexplod(21) && (time = [16, 32])
ID = 21
scale = 0, 0

[State 7520, Scale]
type = modifyexplod
trigger1 = numexplod(20) && time >= 32
ID = 20
postype = back
pos = 160 + (8 * (time -32)), ifelse((gamewidth / gameheight) > 1.55, 80, 120)
scale = 0.5, 0.5
trans = addalpha
alpha = 128 - 16 * (time -32), 256
[State 7520, Scale]
type = modifyexplod
trigger1 = numexplod(21) && time >= 32
ID = 21
postype = back
pos = 160 - (8 * (time -32)), ifelse((gamewidth / gameheight) > 1.55, 80, 120)
scale = 0.5, 0.5
trans = addalpha
alpha = 128 - 16 * (time -32), 256

[State 7520, Lines]
type = explod
trigger1 = time = 0 || time = 8 || time = 16 || time = 24
anim = 7521
ID = ifelse(time = 24, 4, ifelse(time = 16, 3, ifelse(time = 8, 2, 1)))
sprpriority = 5
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
bindtime = -1
removetime = 16
supermovetime = -1

[State 7520, Scale]
type = modifyexplod
trigger1 = numexplod(1)
ID = 1
scale = 1 -(0.0625 * time), 1 -(0.0625 * time)
trans = addalpha
alpha = ifelse(time < 4, 64 * time, 256), 256
[State 7520, Scale]
type = modifyexplod
trigger1 = numexplod(2)
ID = 2
scale = 1 -(0.0625 * (time -8)), 1 -(0.0625 * (time -8))
trans = addalpha
alpha = ifelse((time -8) < 4, 64 * (time -8), 256), 256
[State 7520, Scale]
type = modifyexplod
trigger1 = numexplod(3)
ID = 3
scale = 1 -(0.0625 * (time -16)), 1 -(0.0625 * (time -16))
trans = addalpha
alpha = ifelse((time -16) < 4, 64 * (time -16), 256), 256
[State 7520, Scale]
type = modifyexplod
trigger1 = numexplod(4)
ID = 4
scale = 1 -(0.0625 * (time -24)), 1 -(0.0625 * (time -24))
trans = addalpha
alpha = ifelse((time -24) < 4, 64 * (time -24), 256), 256

[State 7520, Circle]
type = explod
trigger1 = time = 24
anim = 7522
ID = 10
sprpriority = 5
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
bindtime = -1
removetime = 32
supermovetime = -1

[State 7520, Scale]
type = modifyexplod
trigger1 = numexplod(10)
ID = 10
scale = 2 -(0.125 * (time -24)), 2 -(0.125 * (time -24))
trans = addalpha
alpha = ifelse((time -24) < 4, 64 * (time -24), 256), 256

[State 7520, Safety]
type = removeexplod
trigger1 = time >= 40
[State 7520, End]
type = destroyself
trigger1 = time >= 40


;========================<SUPER FINISH>=============================
[Statedef 8600]
type = A
velset = 0, 0
anim = 9999

[State 8600, Sound]
type = playsnd
trigger1 = !time
value = 7, 6
channel = 1

[State 8600, Snd]
type = sndpan
trigger1 = time <= 80
channel = 1
abspan = ceil(sin(gametime / 20.0 * pi) * 160)

[State 8600, Snd]
type = assertspecial
trigger1 = time <= 80
flag = nomusic

[State 8600, BG PalFX]
type = bgpalfx
trigger1 = time < 16
trigger1 = !(time % 2)
time = 1
color = 0

[State 8600, BG PalFX]
type = bgpalfx
trigger1 = time < 16
trigger1 = (time % 2)
time = 1
color = 0
mul = 128, 32, 0

[State 8600, BG PalFX]
type = bgpalfx
trigger1 = time = [16, 24]
time = 1
color = 32 * (time -16)
mul = 128 + 8 * (time - 16), 32 + 14 * (time - 16), 32 * (time - 16)

[State 8600, Move Name]
type = varset
trigger1 = !time
trigger1 = root, var(23) = 900
var(0) = 1
[State 8600, Move Name]
type = varset
trigger1 = !time
trigger1 = root, var(23) = 3000
var(0) = 2
[State 8600, Move Name]
type = varset
trigger1 = !time
trigger1 = root, var(23) = 3050
var(0) = 3
[State 8600, Move Name]
type = varset
trigger1 = !time
trigger1 = root, var(23) = 3100
var(0) = 4
[State 8600, Move Name]
type = varset
trigger1 = !time
trigger1 = root, var(23) = 3200
var(0) = 5
[State 8600, Move Name]
type = varset
trigger1 = !time
trigger1 = root, var(23) = 3250
var(0) = 6
[State 8600, Move Name]
type = varset
trigger1 = !time
trigger1 = root, var(23) = 3300
var(0) = 7
[State 8600, Move Name]
type = varset
trigger1 = !time
trigger1 = root, var(23) = 3070
var(0) = 8
[State 8600, Move Name]
type = varset
trigger1 = !time
trigger1 = root, var(23) = 4200
var(0) = 9
[State 8600, Move Name]
type = varset
trigger1 = !time
trigger1 = root, var(23) = 4300
var(0) = 10
[State 8600, Move Name]
type = varset
trigger1 = !time
trigger1 = root, var(23) = 4100
var(0) = 11

[State 8600, MvC]
type = explod
trigger1 = !time
anim = 8600
ID = 8600
ontop = 1
postype = left
pos = 160, ifelse((gamewidth / gameheight) > 1.55, 90, 120)
scale = 0.5, 0.5 * (1.3333333 * gameheight / gamewidth)
bindtime = -1
removetime = 32
pausemovetime = -1
supermovetime = -1

[State 8600, Fade]
type = modifyexplod
trigger1 = numexplod(8600)
ID = 8600
trans = addalpha
alpha = ifelse(time < 16, 256, 256 -32 * (time -16)), 256

[State 8600, Text]
type = explod
trigger1 = !time && var(0)
anim = 8609 + var(0)
ID = 10
ontop = 1
postype = left
pos = 160, ifelse((gamewidth / gameheight) > 1.55, 90, 120)
scale = 0.5, 0.5 * (1.3333333 * gameheight / gamewidth)
bindtime = -1
removetime = 32
pausemovetime = -1
supermovetime = -1
[State 8600, Text]
type = explod
trigger1 = !time && var(0)
anim = 8609 + var(0)
ID = 11
ontop = 1
postype = left
pos = 160, ifelse((gamewidth / gameheight) > 1.55, 90, 120)
scale = 0.5, 0.5 * (1.3333333 * gameheight / gamewidth)
bindtime = -1
removetime = 8
pausemovetime = -1
supermovetime = -1

[State 8600, Fade]
type = modifyexplod
trigger1 = numexplod(10)
ID = 10
trans = addalpha
alpha = ifelse(time < 16, 256, 256 -32 * (time -16)), ifelse(time < 16, 0, 32 * (time -16))
[State 8600, Fade]
type = modifyexplod
trigger1 = numexplod(11)
ID = 11
scale = 0.5 + (0.0625 * time), (0.5 + (0.0625 * time)) * (1.3333333 * gameheight / gamewidth)
trans = addalpha
alpha = 256 - (32 * time), 32 * time

[State 8600, Stop Shake]
type = envshake
trigger1 = time <= 24
time = 1
ampl = 0

[State 8600, Assert]
type = assertspecial
trigger1 = time < 16
flag = noFG
[State 8600, Assert]
type = assertspecial
trigger1 = time < 24
flag = nobardisplay

[State 8600, End]
type = removeexplod
trigger1 = time >= 24
trigger2 = roundstate < 3
[State 8600, End]
type = destroyself
trigger1 = roundstate < 3


;========================<KANJI>=============================
[Statedef 6012]
physics = N
velset = 0, 0
anim = 6012
sprpriority = -3

[State 6012, glow]
type = palfx
trigger1 = !time
time = 9999
add = 50, 50, 50
sinadd = 100, 100, 100, 80

[State 6012, Bind]
type = bindtoroot
trigger1 = 1
pos = ifelse((root, facing = 1), 0, 32), 0


;========================<KANJI B.G.>=============================
[Statedef 7610]
physics = N
velset = 0, 0
anim = 9999

[State 7610, Assert]
type = assertspecial
trigger1 = time < 120
flag = nomusic

[State 7610, Snd]
type = playsnd
trigger1 = !time
value = 7, 7

[State 7610, black]
type = bgpalfx
trigger1 = time < 120
time = 2
add = -255, -255, -255

[State 7610, black]
type = bgpalfx
trigger1 = time = 120
time = 60
add = -255, -255, -255
sinadd = 255, 255, 255, 240

[State 6200, Fade]
type = palfx
trigger1 = time = 120
time = 60
sinadd = -255, -255, -255, 240

[State 7610, Kanji]
type = explod
trigger1 = !time
anim = 7610
ID = 7610
sprpriority = -5
postype = left
pos = 160, ifelse((gamewidth / gameheight) > 1.55, 90, 120)
scale = 0.5 * (1.3333333 * gameheight / gamewidth), 0.5 * (1.3333333 * gameheight / gamewidth)
bindtime = -1

[State 7610, Shrink]
type = modifyexplod
trigger1 = time < 12
ID = 7610
scale = ((13 - time) / 2.0) * (1.3333333 * gameheight / gamewidth), ((13 - time) / 2.0) * (1.3333333 * gameheight / gamewidth)

[State 7610, Shrink]
type = modifyexplod
trigger1 = time >= 12
ID = 7610
scale = 0.5 * (1.3333333 * gameheight / gamewidth), 0.5 * (1.3333333 * gameheight / gamewidth)

[State 7610, flamebg]
type = explod
trigger1 = !time
anim = 7611
ID = 7611
sprpriority = 5
postype = left
pos = 0, floor((gameheight / gamewidth) * 80) - 60
bindtime = -1
removetime = -1
pausemovetime = 300
supermovetime = 300

[State 7610, Assert]
type = assertspecial
trigger1 = 1
flag = invisible
flag2 = nobardisplay
ignorehitpause = 1

[State 7610, Assert]
type = assertspecial
trigger1 = time < 120
flag = noFG
ignorehitpause = 1

[State 7610, Safety]
type = removeexplod
trigger1 = time >= 180

[State 7610, End]
type = destroyself
trigger1 = time >= 180


;========================<CAMERA CONTROL>=============================
[Statedef 7650]
physics = N
velset = 0, 0
anim = 9999
[State 7650, bound]
type = screenbound
trigger1 = 1
value = 0
movecamera = 1, 1
[State 7650, End]
type = destroyself
trigger1 = roundstate = 2


;========================<SPARKS>=============================
;--- Guard Normal ---
[Statedef 8000]
type = A
physics = N
movetype = I
anim = 9999
velset = 0, 0
sprpriority = 99

[State 8000, Main]
type = explod
trigger1 = !time
anim = 8000
ID = 1
postype = p1
ontop = 1
removetime = 16
pausemovetime = -1
supermovetime = -1
[State 8010, Scale]
type = modifyexplod
trigger1 = numexplod(1)
ID = 1
scale = 0.1 + (0.0375 * time), 0.1 + (0.0375 * time)
trans = addalpha
alpha = ifelse(time < 4, 256, 256 - 64 * (time - 4)), 256

[State 8000, End]
type = removeexplod
trigger1 = time >= 8
trigger2 = time >= 4
trigger2 = numhelper > (56 / (1 + numenemy + numpartner))

[State 8000, End]
type = destroyself
trigger1 = !numexplod


;--- Guard Special ---
[Statedef 8001]
type = A
physics = N
movetype = I
anim = 9999
velset = 0, 0
sprpriority = 99

[State 8001, Main]
type = explod
trigger1 = !time
anim = 8001
ID = 1
postype = p1
ontop = 1
removetime = 16
pausemovetime = -1
supermovetime = -1
[State 8001, Scale]
type = modifyexplod
trigger1 = numexplod(1)
ID = 1
scale = 0.2 + (0.025 * time), 0.2 + (0.025 * time)
trans = addalpha
alpha = ifelse(time < 4, 256, 256 - 64 * (time - 4)), 256

[State 8001, End]
type = removeexplod
trigger1 = time >= 8
trigger2 = time >= 4
trigger2 = numhelper > (56 / (1 + numenemy + numpartner))

[State 8001, End]
type = destroyself
trigger1 = !numexplod


;--- Weak ---
[Statedef 8010]
type = A
physics = N
movetype = I
anim = 9999
velset = 0, 0
sprpriority = 99

[State 8010, Main]
type = explod
trigger1 = !time
anim = 8010
ID = 0
postype = p1
ontop = 1
removetime = 10
pausemovetime = -1
supermovetime = -1
[State 8010, Scale]
type = modifyexplod
trigger1 = numexplod(0)
ID = 0
scale = 0.3 - (time * 0.03), 0.3 - (time * 0.03)
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)

[State 8010, Center]
type = explod
trigger1 = !time
anim = 8011
ID = 1
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
ontop = 1
removetime = 16
pausemovetime = -1
supermovetime = -1
[State 8010, Scale]
type = modifyexplod
trigger1 = numexplod(1)
ID = 1
scale = 0.15 + (0.009375 * time), 0.15 + (0.009375 * time)
trans = addalpha
alpha = 256 -(16 * time), 256

[State 8010, Streaks]
type = explod
trigger1 = !time
anim = 8012
ID = 2
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
ontop = 1
removetime = 16
pausemovetime = -1
supermovetime = -1
[State 8010, Scale]
type = modifyexplod
trigger1 = numexplod(2)
ID = 2
scale = 0.15 + (0.009375 * time), 0.15 + (0.009375 * time)
trans = addalpha
alpha = 256 -(16 * time), 256

[State 8010, Impact]
type = explod
trigger1 = !time
anim = 8014
ID = 4
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
ontop = 1
removetime = 8
pausemovetime = -1
supermovetime = -1
[State 8010, Scale]
type = modifyexplod
trigger1 = numexplod(4)
ID = 4
scale = 0.3 -(0.0375 * time), 0.3 -(0.0375 * time)
trans = addalpha
alpha = 128 -(16 * time), 256

[State 8010, End]
type = removeexplod
trigger1 = time >= 16
trigger2 = time >= 8
trigger2 = numhelper > (56 / (1 + numenemy + numpartner))

[State 8010, End]
type = destroyself
trigger1 = !numexplod


;--- Medium ---
[Statedef 8011]
type = A
physics = N
movetype = I
anim = 9999
velset = 0, 0
sprpriority = 99

[State 8011, Main]
type = explod
trigger1 = !time
anim = 8010
ID = 0
postype = p1
ontop = 1
removetime = 10
pausemovetime = -1
supermovetime = -1
[State 8011, Scale]
type = modifyexplod
trigger1 = numexplod(0)
ID = 0
scale = 0.35 - (time * 0.035), 0.35 - (time * 0.035)
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)

[State 8011, Center]
type = explod
trigger1 = !time
anim = 8011
ID = 1
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
ontop = 1
removetime = 16
pausemovetime = -1
supermovetime = -1
[State 8011, Scale]
type = modifyexplod
trigger1 = numexplod(1)
ID = 1
scale = 0.175 + (0.0109375 * time), 0.175 + (0.0109375 * time)
trans = addalpha
alpha = 256 -(16 * time), 256

[State 8011, Streaks]
type = explod
trigger1 = !time
anim = 8012
ID = 2
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
ontop = 1
removetime = 16
pausemovetime = -1
supermovetime = -1
[State 8011, Scale]
type = modifyexplod
trigger1 = numexplod(2)
ID = 2
scale = 0.175 + (0.0109375 * time), 0.175 + (0.0109375 * time)
trans = addalpha
alpha = 256 -(16 * time), 256

[State 8011, Impact]
type = explod
trigger1 = !time
anim = 8014
ID = 4
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
ontop = 1
removetime = 8
pausemovetime = -1
supermovetime = -1
[State 8011, Scale]
type = modifyexplod
trigger1 = numexplod(4)
ID = 4
scale = 0.35 -(0.04375 * time), 0.35 -(0.04375 * time)
trans = addalpha
alpha = 128 -(16 * time), 256

[State 8011, End]
type = removeexplod
trigger1 = time >= 16
trigger2 = time >= 8
trigger2 = numhelper > (56 / (1 + numenemy + numpartner))

[State 8011, End]
type = destroyself
trigger1 = !numexplod


;--- Strong ---
[Statedef 8012]
type = A
physics = N
movetype = I
anim = 9999
velset = 0, 0
sprpriority = 99

[State 8012, Main]
type = explod
trigger1 = !time
anim = 8010
ID = 0
postype = p1
ontop = 1
removetime = 10
pausemovetime = -1
supermovetime = -1
[State 8012, Scale]
type = modifyexplod
trigger1 = numexplod(0)
ID = 0
scale = 0.4 - (time * 0.04), 0.4 - (time * 0.04)
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)

[State 8012, Center]
type = explod
trigger1 = !time
anim = 8011
ID = 1
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
ontop = 1
removetime = 16
pausemovetime = -1
supermovetime = -1
[State 8012, Scale]
type = modifyexplod
trigger1 = numexplod(1)
ID = 1
scale = 0.2 + (0.0125 * time), 0.2 + (0.0125 * time)
trans = addalpha
alpha = 256 -(16 * time), 256

[State 8012, Streaks]
type = explod
trigger1 = !time
anim = 8012
ID = 2
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
ontop = 1
removetime = 16
pausemovetime = -1
supermovetime = -1
[State 8012, Scale]
type = modifyexplod
trigger1 = numexplod(2)
ID = 2
scale = 0.2 + (0.0125 * time), 0.2 + (0.0125 * time)
trans = addalpha
alpha = 256 -(16 * time), 256

[State 8012, Impact]
type = explod
trigger1 = !time
anim = 8014
ID = 4
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
ontop = 1
removetime = 8
pausemovetime = -1
supermovetime = -1
[State 8012, Scale]
type = modifyexplod
trigger1 = numexplod(4)
ID = 4
scale = 0.4 -(0.05 * time), 0.4 -(0.05 * time)
trans = addalpha
alpha = 128 -(16 * time), 256

[State 8012, End]
type = removeexplod
trigger1 = time >= 16
trigger2 = time >= 8
trigger2 = numhelper > (56 / (1 + numenemy + numpartner))

[State 8012, End]
type = destroyself
trigger1 = !numexplod


;--- Special ---
[Statedef 8013]
type = A
physics = N
movetype = I
anim = 9999
velset = 0, 0
sprpriority = 99

[State 8013, Main]
type = explod
trigger1 = !time
anim = 8010
ID = 0
postype = p1
ontop = 1
removetime = 10
pausemovetime = -1
supermovetime = -1
[State 8013, Scale]
type = modifyexplod
trigger1 = numexplod(0)
ID = 0
scale = 0.45 - (time * 0.045), 0.45 - (time * 0.045)
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)

[State 8013, Center]
type = explod
trigger1 = !time
anim = 8011
ID = 1
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
ontop = 1
removetime = 16
pausemovetime = -1
supermovetime = -1
[State 8013, Scale]
type = modifyexplod
trigger1 = numexplod(1)
ID = 1
scale = 0.225 + (0.0140625 * time), 0.225 + (0.0140625 * time)
trans = addalpha
alpha = 256 -(16 * time), 256

[State 8013, Streaks]
type = explod
trigger1 = !time
anim = 8012
ID = 2
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
ontop = 1
removetime = 16
pausemovetime = -1
supermovetime = -1
[State 8013, Scale]
type = modifyexplod
trigger1 = numexplod(2)
ID = 2
scale = 0.225 + (0.0140625 * time), 0.225 + (0.0140625 * time)
trans = addalpha
alpha = 256 -(16 * time), 256

[State 8013, P2 Back]
type = explod
triggerall = !time
triggerall = parent, numtarget
trigger1 = numenemy = parent, numtarget
trigger2 = numenemy > parent, numtarget
trigger2 = abs(enemynear(0), pos x - enemynear(1), pos x) >= 120
anim = 8013
ID = 3
postype = p1
vfacing = ifelse(random < 500, -1, 1)
sprpriority = -3
removetime = 8
pausemovetime = -1
supermovetime = -1

[State 8013, Position]
type = modifyexplod
triggerall = numexplod(3)
trigger1 = numenemy = 1
trigger2 = numenemy >= 2 && !time
ID = 3
postype = p1
pos = ceil(p2dist x + enemynear, const(size.ground.back)), ceil(p2dist y + ifelse(p2statetype = L, 0, ifelse(p2statetype = C, 0.5, 0.75) * enemynear, const(size.head.pos.y)))

[State 8013, Scale]
type = modifyexplod
trigger1 = numexplod(3)
ID = 3
scale = 0.25 + (0.03125 * time), 0.25 + (0.03125 * time)
trans = addalpha
alpha = 256 -(32 * time), 256

[State 8013, Impact]
type = explod
trigger1 = !time
anim = 8014
ID = 4
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
ontop = 1
removetime = 8
pausemovetime = -1
supermovetime = -1
[State 8013, Scale]
type = modifyexplod
trigger1 = numexplod(4)
ID = 4
scale = 0.45 -(0.05625 * time), 0.45 -(0.05625 * time)
trans = addalpha
alpha = 192 -(24 * time), 256

[State 8013, End]
type = removeexplod
trigger1 = time >= 16
trigger2 = time >= 8
trigger2 = numhelper > (56 / (1 + numenemy + numpartner))

[State 8013, End]
type = destroyself
trigger1 = !numexplod


;--- Super ---
[Statedef 8014]
type = A
physics = N
movetype = I
anim = 9999
velset = 0, 0
sprpriority = 99

[State 8014, Main]
type = explod
trigger1 = !time
anim = 8010
ID = 0
postype = p1
ontop = 1
removetime = 10
pausemovetime = -1
supermovetime = -1
[State 8014, Scale]
type = modifyexplod
trigger1 = numexplod(0)
ID = 0
scale = 0.5 - (time * 0.05), 0.5 - (time * 0.05)
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)

[State 8014, Center]
type = explod
trigger1 = !time
anim = 8011
ID = 1
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
ontop = 1
removetime = 16
pausemovetime = -1
supermovetime = -1
[State 8014, Scale]
type = modifyexplod
trigger1 = numexplod(1)
ID = 1
scale = 0.25 + (0.015625 * time), 0.25 + (0.015625 * time)
trans = addalpha
alpha = 256 -(16 * time), 256

[State 8014, Streaks]
type = explod
trigger1 = !time
anim = 8012
ID = 2
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
ontop = 1
removetime = 16
pausemovetime = -1
supermovetime = -1
[State 8014, Scale]
type = modifyexplod
trigger1 = numexplod(2)
ID = 2
scale = 0.25 + (0.015625 * time), 0.25 + (0.015625 * time)
trans = addalpha
alpha = 256 -(16 * time), 256

[State 8014, P2 Back]
type = explod
triggerall = !time
triggerall = parent, numtarget
trigger1 = numenemy = parent, numtarget
trigger2 = numenemy > parent, numtarget
trigger2 = abs(enemynear(0), pos x - enemynear(1), pos x) >= 120
anim = 8013
ID = 3
postype = p1
vfacing = ifelse(random < 500, -1, 1)
sprpriority = -3
removetime = 8
pausemovetime = -1
supermovetime = -1

[State 8014, Position]
type = modifyexplod
triggerall = numexplod(3)
trigger1 = numenemy = 1
trigger2 = numenemy >= 2 && !time
ID = 3
postype = p1
pos = ceil(p2dist x + enemynear, const(size.ground.back)), ceil(p2dist y + ifelse(p2statetype = L, 0, ifelse(p2statetype = C, 0.5, 0.75) * enemynear, const(size.head.pos.y)))

[State 8014, Scale]
type = modifyexplod
trigger1 = numexplod(3)
ID = 3
scale = 0.30 + (0.0375 * time), 0.30 + (0.0375 * time)
trans = addalpha
alpha = 256 -(32 * time), 256

[State 8014, Impact]
type = explod
trigger1 = !time
anim = 8014
ID = 4
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
ontop = 1
removetime = 8
pausemovetime = -1
supermovetime = -1
[State 8014, Scale]
type = modifyexplod
trigger1 = numexplod(4)
ID = 4
scale = 0.5 -(0.0625 * time), 0.5 -(0.0625 * time)
trans = addalpha
alpha = 256 -(32 * time), 256

[State 8014, End]
type = removeexplod
trigger1 = time >= 16
trigger2 = time >= 8
trigger2 = numhelper > (56 / (1 + numenemy + numpartner))

[State 8014, End]
type = destroyself
trigger1 = !numexplod


;========================<RECOVER FX>=============================
[Statedef 8200]
type = A
velset = 0, 0
anim = 8200
sprpriority = 5

[State 8200, No Shadow]
type = assertspecial
trigger1 = 1
flag = noshadow

[State 8200, Scale]
type = angledraw
trigger1 = 1
scale = 0.25 + (0.017 * time), 0.25 + (0.017 * time)

[State 8200, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256 - (16 * time), 256

[State 8200, End]
type = destroyself
trigger1 = time >= 16


;========================<COUNTER FX>=============================
[Statedef 8290]
type = A
physics = N
velset = 0, 0
anim = 9999

[State 8290, Circle]
type = explod
trigger1 = !numexplod(8290)
anim = 8290
ID = 8290
sprpriority = 5
postype = p1
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 8290, Scale]
type = modifyexplod
trigger1 = numexplod(8290)
ID = 8290
scale = 0.2 + (0.05 * time), 0.2 + (0.05 * time)
trans = addalpha
alpha = ceil(256 -(16 * time)), 256

[State 8290, Safety]
type = removeexplod
trigger1 = time >= 16

[State 8290, End]
type = destroyself
trigger1 = !numexplod


;========================<DIZZY STARS>=============================
[Statedef 8970]
type = A
physics = N
movetype = I
anim = 9999
velset = 0, 0
sprpriority = 0

[State 8970, Bullet time]
type = bgpalfx
trigger1 = !time
time = 5
sinadd = 128, 128, 128, 10
ignorehitpause = 1
persistent = 0

[State 8970, Bullet time]
type = varadd
trigger1= numenemy
trigger1 = enemynear, hitshakeover
trigger2 = var(0)
var(0) = 1

[State 8970, Bullet time]
type = pause
triggerall = numenemy
triggerall = enemynear, hitshakeover
trigger1 = var(0) = [1, 16]
trigger2 = var(0) = [17, 32]
trigger2 = !(var(0) % 2)
time = 1

[State 8970, Pos]
type = posset
trigger1 = numenemy
x = enemynear, pos x
y = (enemynear, pos y) + (enemynear, const(size.head.pos.y)) - 16

[State 8970, Pos]
type = posset
trigger1 = numenemy = 1
trigger1 = (enemynear, pos y) > 0
y = (enemynear, const(size.head.pos.y)) - 16

[State 8970, Star]
type = explod
trigger1 = !numexplod(1)
anim = 8970
ID = 1
postype = p1
pos = 0, 0
sprpriority = 5
bindtime = -1
removetime = -1
scale = 0.5, 0.5

[State 8970, Star]
type = explod
trigger1 = !numexplod(2)
anim = 8970
ID = 2
postype = p1
pos = 0, 0
sprpriority = 5
bindtime = -1
removetime = -1
scale = 0.5, 0.5

[State 8970, Star]
type = explod
trigger1 = !numexplod(3)
anim = 8970
ID = 3
postype = p1
pos = 0, 0
sprpriority = 5
bindtime = -1
removetime = -1
scale = 0.5, 0.5

[State 8970, Star]
type = explod
trigger1 = !numexplod(4)
anim = 8970
ID = 4
postype = p1
pos = 0, 0
sprpriority = 5
bindtime = -1
removetime = -1
scale = 0.5, 0.5

[State 8970, Circle around]
type = modifyexplod
trigger1 = numexplod(1)
ID = 1
postype = p1
pos = ceil(32 * cos((gametime + 0) / 32.0 * pi)), ceil(6 * sin((gametime + 0) / 32.0 * pi))
scale = 0.375 + 0.125 * sin((gametime + 0) / 32.0 * pi), 0.375 + 0.125 * sin((gametime + 0) / 32.0 * pi)
sprpriority = ifelse(sin((gametime + 0) / 32.0 * pi) >= 0, 5, -5)

[State 8970, Circle around]
type = modifyexplod
trigger1 = numexplod(2)
ID = 2
postype = p1
pos = ceil(32 * cos((gametime + 32) / 32.0 * pi)), ceil(8 * sin((gametime + 32) / 32.0 * pi))
scale = 0.375 + 0.125 * sin((gametime + 32) / 32.0 * pi), 0.375 + 0.125 * sin((gametime + 32) / 32.0 * pi)
sprpriority = ifelse(sin((gametime + 32) / 32.0 * pi) >= 0, 5, -5)

[State 8970, Circle around]
type = modifyexplod
trigger1 = numexplod(3)
ID = 3
postype = p1
pos = ceil(32 * cos((gametime + 16) / 32.0 * pi)), ceil(8 * sin((gametime + 16) / 32.0 * pi))
scale = 0.375 + 0.125 * sin((gametime + 16) / 32.0 * pi), 0.375 + 0.125 * sin((gametime + 16) / 32.0 * pi)
sprpriority = ifelse(sin((gametime + 16) / 32.0 * pi) >= 0, 5, -5)

[State 8970, Circle around]
type = modifyexplod
trigger1 = numexplod(4)
ID = 4
postype = p1
pos = ceil(32 * cos((gametime + 48) / 32.0 * pi)), ceil(8 * sin((gametime + 48) / 32.0 * pi))
scale = 0.375 + 0.125 * sin((gametime + 48) / 32.0 * pi), 0.375 + 0.125 * sin((gametime + 48) / 32.0 * pi)
sprpriority = ifelse(sin((gametime + 48) / 32.0 * pi) >= 0, 5, -5)

[State 8970, Snd]
type = playsnd
trigger1 = 1
value = 0, 5300
lowpriority = 1
volumescale = 50
channel = 0

[State 8970, End]
type = stopsnd
trigger1 = !numenemy
trigger2 = numenemy
trigger2 = enemynear, stateno != [1115300, 1115319]
channel = 0

[State 8970, End]
type = removeexplod
trigger1 = !numenemy
trigger2 = numenemy
trigger2 = enemynear, stateno != [1115300, 1115319]

[State 8970, End]
type = destroyself
trigger1 = !numexplod


;========================<MOVELIST>=============================
[Statedef 8980]
type = A
physics = N
movetype = I
anim = 9999

[State 8980, Root]
type = varset
trigger1 = !time
sysvar(0) = root, ID

[State 8980, Turn]
type = turn
trigger1 = !time
trigger1 = facing = -1

[State 8980, Pos]
type = posset
trigger1 = 1
x = 0
y = pos y - screenpos y

[State 8980, Assert]
type = assertspecial
trigger1 = 1
flag = nobardisplay

[State 8980, Explod]
type = explod
trigger1 = !numexplod(8989)
anim = 8989
ID = 8989
postype = left
pos = 160, 120
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
pausemovetime = -1
scale = 8, 8
ontop = 1

[State 8980, Snd]
type = playsnd
trigger1 = !time
value = 0, 8980
channel = 0

[State 8980, Pos Y]
type = varadd
trigger1 = root, command = "holdup"
var(1) = 4
[State 8980, Pos Y]
type = varadd
trigger1 = root, command = "holddown"
var(1) = -4

[State 8980, Pos Y]
type = varadd
trigger1 = root, facing = 1 && root, command = "back"
trigger2 = root, facing = -1 && root, command = "fwd"
var(1) = 240
[State 8980, Pos Y]
type = varadd
trigger1 = root, facing = 1 && root, command = "fwd"
trigger2 = root, facing = -1 && root, command = "back"
var(1) = -240

[State 8980, Pos Y];-Half of image height
type = varset
trigger1 = var(1) < (-548 + ifelse((gamewidth / gameheight) > 1.67, 142, 204))
var(1) = ceil(-548 + ifelse((gamewidth / gameheight) > 1.67, 142, 204))

[State 8980, Pos Y]
type = varset
trigger1 = var(1) > 0
var(1) = 0

[State 8980, Explod]
type = explod
trigger1 = !numexplod(8980)
anim = 8980
ID = 8980
postype = left
pausemovetime = -1

[State 8980, Explod]
type = modifyexplod
trigger1 = numexplod(8980)
ID = 8980
postype = left
pos = 160, 18 + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.5, 0.5
ontop = 1

[State 8980, Pause]
type = pause
trigger1 = 1
time = 2
movetime = 2

[State 8980, End]
type = changestate
trigger1 = !playerIDexist(sysvar(0))
trigger2 = root, AIlevel
trigger3 = time
trigger3 = root, command = "start"
value = 8981


;--- Remove ---
[Statedef 8981]
type = A
physics = N
movetype = I
anim = 9999

[State 8981, Snd]
type = playsnd
trigger1 = !time
value = 0, 8981
channel = 0

[State 8981, End]
type = removeexplod
trigger1 = !time

[State 8981, End]
type = destroyself
trigger1 = time >= 30


;========================<DIRECTIONAL INPUT CONTROLLER>=============================
[Statedef 9999]
type = A
physics = N
movetype = I
anim = 9999

[State 9999, Root]
type = varset
trigger1 = !time
sysvar(0) = root, ID

[State 9999, End]
type = destroyself
trigger1 = !playerIDexist(sysvar(0))
trigger2 = root, AIlevel

[State -1, Catarl]
type = ctrlset
trigger1 = ctrl
value = 0

[State 9999, Bind]
type = bindtoroot
trigger1 = 1
pos = 0, ifelse((root, numtarget), 6, 3)

[State 9999, All for this]
type = turn
triggerall = p2dist x < 0
trigger1 = (root, backedgebodydist) <= 0
trigger2 = (root, p2dist x) < -(root, const(size.ground.back))
trigger3 = (root, p2dist x) > (root, const(size.ground.front))

[State 9999, Lonely]
type = turn
trigger1 = !numenemy
trigger1 = facing != root, facing

[State 9999, Debug]
type = displaytoclipboard
trigger1 = 1
text = "Facing = %d"
params = facing * (root, facing)
