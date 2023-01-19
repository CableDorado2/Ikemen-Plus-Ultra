; ______________________________
;| Ryu by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==============================================================================================
;=======================================<HELPER STATES>========================================
;==============================================================================================

;========================<HADOU KEN>=============================
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
trigger1 = (root, var(15) < 1 || root, var(20))
priority = 4, Hit
attr = S, SP
damage = ceil(ifelse(root, var(1) = 1, 70, 60) * root, fvar(11)), ifelse(root, var(1) = 1, 9, 8)
guard.dist = const(size.proj.attack.dist)
animtype = Hard
hitflag = MAF
guardflag = MA
pausetime = 0, 12
sparkno = -1
guard.sparkno = -1
sparkxy = -10, 0
guardsound = -1
ground.type = High
ground.slidetime = 18
ground.hittime = 18
ground.velocity = -10.52, 0
ground.cornerpush.veloff = 0
air.velocity = -4.0, -5.25
air.fall = 1
fall.recover = 1
fall.recovertime = 120
getpower = 0, 0
givepower = 40, 40
envshake.time = 10
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -1, 1)
sprpriority = 4
yaccel = 0.4850
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
var(42) = ceil(100 * root, fvar(11))
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
trigger1 = frontedgedist < -80 || backedgedist < -80


[Statedef 1006]
type = A
physics = N
movetype = I
anim = 1006
velset = 0, 0
ctrl = 0
sprpriority = 4

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


;========================<EX HADOU KEN>=============================
[Statedef 1015]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 1015, Hit Number]
type = varadd
trigger1 = 1
var(2) = 1
persistent = 0
ignorehitpause = 1

[State 1015, hitoverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = ifelse(var(2) < 2, 1015, 1016)
ignorehitpause = 1
[State 1015, HB]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 1015, Strength]
type = varset
trigger1 = !time && !prevstateno
var(10) = 4

[State 1015, Anim]
type = changeanim
trigger1 = anim != 1005 && anim != 1015
value = ifelse(root, var(1) = 2, 1005, 1015)

[State 1015, Size]
type = angledraw
trigger1 = anim = 1015
scale = 0.8, 0.8

[State 1015, ProjContact]
type = varset
trigger1 = movecontact = 1 && numenemy
trigger1 = (enemynear, movetype = H) && !(enemynear, time)
var(18) = 1
ignorehitpause = 1
[State 1015, ProjContact]
type = parentvarset
trigger1 = movecontact = 1 && numenemy
trigger1 = (enemynear, movetype = H) && !(enemynear, time)
trigger1 = root, stateno = 1010
var(18) = 1
ignorehitpause = 1

[State 1015, Vel]
type = velset
trigger1 = 1
x = 5.3
y = 0

[State 1015, Size]
type = angledraw
trigger1 = time < 4
trigger1 = !prevstateno
scale = 0.5 + (0.125 * time), 1

[State 1015, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256 - 32 * (time % 3), 256
ignorehitpause = 1

[State 1015, Particles]
type = explod
trigger1 = !(gametime % 2)
trigger1 = anim = 1015
anim = 8151
ID = 8151
sprpriority = 3
postype = p1
vel = 0, 0
pos = -40, 0
random = 8, 16
scale = 0.25, 0.25
ownpal = 1

[State 1015, HitSound]
type = playsnd
trigger1 = movecontact = 1
value = 2, ifelse((movehit && numtarget), 7, 0)
channel = 2
ignorehitpause = 1

[State 1015, Freeze]
type = posfreeze
trigger1 = time <= ifelse(numtarget, 4, 0)
value = 1

[State 1015, Miss]
type = hitdef
trigger1 = 1
attr = S, SP
hitflag =
sparkxy = -10, 0

[State 1015, Hit First]
type = hitdef
trigger1 = (root, var(15) < 2 || root, var(20))
trigger1 = time >= ifelse(numtarget, 4, 0)
priority = 4, Hit
attr = S, SP
damage = ceil(52 * root, fvar(11)), 7
guard.dist = const(size.proj.attack.dist)
animtype = Back
hitflag = MAF
guardflag = MA
pausetime = 0, 12
sparkno = -1
guard.sparkno = -1
sparkxy = -10, 0
guardsound = -1
ground.type = High
ground.slidetime = 18
ground.hittime = 18
ground.velocity = -10.52, 0
ground.cornerpush.veloff = 0
air.velocity = -4.0, -5.25
fall = 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120
getpower = 0, 0
givepower = 40, 40
envshake.time = 10
envshake.ampl = ifelse((gametime % 2), -1, 1)
envshake.freq = 180
palfx.color = 256
palfx.sinadd = 128, 128, 128, 4
palfx.mul = 128, 128, 128
palfx.time = ifelse(anim = 1015, 60, 0)
sprpriority = 4
yaccel = 0.4850
airguard.ctrltime = 16
airguard.velocity = -6.00, -1.00
p2facing = ifelse((p2stateno != [5020, 5119]) && p2statetype != L, 1, 0)
forcestand = 1
ID = 1015

[State 1015, Hit Knockdown]
type = hitdef
trigger1 = (root, var(15) < 2 || root, var(20))
trigger1 = time >= ifelse(numtarget, 4, 0)
trigger1 = anim = 1015 && var(2) > 1
priority = 4, Hit
attr = S, SP
damage = ceil(52 * root, fvar(11)), 7
guard.dist = const(size.proj.attack.dist)
animtype = Back
hitflag = MAF
guardflag = MA
pausetime = 0, 12
sparkno = -1
guard.sparkno = -1
sparkxy = -10, 0
guardsound = -1
ground.type = High
ground.slidetime = 18
ground.hittime = 18
ground.velocity = -4.0, -5.25
ground.cornerpush.veloff = 0
air.velocity = -4.0, -5.25
fall = 1
fall.recover = 1
fall.recovertime = 120
getpower = 0, 0
givepower = 40, 40
envshake.time = 10
envshake.ampl = ifelse((gametime % 2), -1, 1)
envshake.freq = 180
palfx.color = 256
palfx.sinadd = 128, 128, 128, 4
palfx.mul = 128, 128, 128
palfx.time = ifelse(anim = 1015, 60, 0)
sprpriority = 4
yaccel = 0.4850
airguard.ctrltime = 16
airguard.velocity = -6.00, -1.00
p2facing = ifelse((p2stateno != [5020, 5119]) && p2statetype != L, 1, 0)
forcestand = 1
ID = 1015

[State 1015, Burned]
type = targetstate
trigger1 = anim = 1015
trigger1 = movehit
trigger1 = numtarget(1015)
trigger1 = target, selfanimexist(7697)
trigger1 = (target(1015), stateno = 5000) || (target(1015), stateno = 5010) || (target(1015), stateno = 5020)
value = 7697
ID = 1015
ignorehitpause = 1

[State 1015, Spark]
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

[State 1015, Spark]
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

[State 1015, Counter FX]
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

[State 1015, Flame Particles]
type = helper
trigger1 = anim = 1015
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

[State 1015, Stun System - Add]
type = parentvaradd
trigger1 = movehit = 1
trigger1 = numtarget
trigger1 = target, gethitvar(damage) > 0
trigger1 = root, var(42) >= 0
trigger1 = root, var(20) <= 0
var(42) = ceil(50 * root, fvar(11))
ignorehitpause = 1

[State 1015, Stun System - Dizzy]
type = targetstate
trigger1 = movehit = 1
trigger1 = numenemy = 1 && numpartner = 0
trigger1 = roundstate = 2 && numtarget
trigger1 = target, gethitvar(damage) < target, life
trigger1 = root, var(42) >= (target, const(data.life))
value = 1115310
ignorehitpause = 1

[State 1015, End]
type = changestate
trigger1 = movecontact
value = ifelse(var(2) < 2, 1015, 1016)
[State 1015, End]
type = destroyself
trigger1 = frontedgedist < -80 || backedgedist < -80


[Statedef 1016]
type = A
physics = N
movetype = I
anim = ifelse(anim = 1015, 1016, 1006)
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 1016, Trade Sound]
type = playsnd
trigger1 = !time
trigger1 = prevstateno = [5000, 5999]
value = 2, 0
channel = 2
lowpriority = 1
volumescale = 50

[State 1016, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 1016, P2 Safe Fall]
type = targetstate
trigger1 = numtarget = 1
trigger1 = target, command = "recovery"
trigger1 = target, pos y >= -48 && target, vel y > 0
trigger1 = target, alive && target, hitfall && target, gethitvar(fall.recover)
trigger1 = target, stateno = 5030 || target, stateno = 5035 || target, stateno = 5050 || target, stateno = 5071
value = 1115200
ignorehitpause = 1

[State 1016, End]
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
value = 1015

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
alpha = 256 - 32 * (time % 3), 256
ignorehitpause = 1

[State 1025, Particles]
type = explod
trigger1 = !(gametime % 2)
anim = 8151
ID = 8151
sprpriority = 3
postype = p1
vel = 0, 0
pos = -40, 0
random = 8, 16
scale = 0.25, 0.25
ownpal = 1

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
trigger1 = (root, var(15) < 3 || root, var(20))
trigger1 = time >= ifelse(numtarget, 4, 0)
priority = 4, Hit
attr = S, SP
damage = ceil(ifelse(var(10) = 3, 36, ifelse(var(10) = 2, 36, 50)) * root, fvar(11)), 7
guard.dist = const(size.proj.attack.dist)
animtype = Back
hitflag = MAF
guardflag = MA
pausetime = 0, 12
sparkno = -1
sparkxy = -10, 0
guard.sparkno = -1
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
palfx.color = 256
palfx.sinadd = 128, 128, 128, 4
palfx.mul = 128, 128, 128
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
var(42) = ceil(ifelse(var(10) = 1, 200, ifelse(var(10) = 2, 75, 35)) * root, fvar(11))
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
anim = 1016
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


;========================<SHINKUU HADOU KEN>=============================
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
stateno = ifelse(var(2) < 5, 3005, 3006)
ignorehitpause = 1
[State 3005, HB]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 3005, Strength]
type = varset
trigger1 = var(10) != 5
var(10) = 5
[State 3005, Button]
type = varset
trigger1 = !time && !prevstateno
var(11) = root, var(11)

[State 3005, Anim]
type = changeanim
trigger1 = anim != 3005
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
[State 3005, Vel]
type = velset
trigger1 = time < 2 && var(2) > 1
x = 1
y = 0

[State 3005, Size]
type = angledraw
trigger1 = !prevstateno
trigger1 = time < 4
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
trigger1 = root, var(15) < 5
trigger1 = time >= ifelse(numtarget, 4, 0)
priority = 4, Hit
attr = S, HP
damage = ceil(44 * root, fvar(11)), 5
guard.dist = const(size.proj.attack.dist)
animtype = Back
hitflag = MAF
guardflag = M
pausetime = 0, 12
sparkno = -1
guard.sparkno = -1
sparkxy = -10, 0
guardsound = -1
ground.type = High
ground.slidetime = 18
ground.hittime = 18
ground.velocity = ifelse(var(2) < 5, -10.52, -6.25), ifelse(var(2) < 5, 0, -5.25)
guard.velocity = -10.52
ground.cornerpush.veloff = 0
air.velocity = -6.25, -5.25
fall = (var(2) >= 5)
air.fall = 1
fall.recover = 0
getpower = 0, 0
givepower = 40, 40
envshake.time = 12
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.freq = 180
palfx.sinadd = 128, 128, 128, 4
palfx.mul = 128, 128, 128
palfx.time = ifelse(root, var(1) = 1, 0, 60)
sprpriority = 4
yaccel = 0.4850
p2facing = ifelse((p2stateno != [5020, 5119]) && p2statetype != L, 1, 0)
forcestand = 1
ID = 3005

[State 3005, Burned]
type = targetstate
trigger1 = root, var(1) != 1
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
trigger1 = root, var(1) != 1
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
value = ifelse(var(2) < 5, 3005, 3006)
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


;========================<DENJIN HADOU KEN>=============================
[Statedef 3025]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 3025, Strength]
type = varset
trigger1 = !time && !prevstateno
var(10) = ifelse(root, var(0) >= 120, 4, ifelse(root, var(0) >= 60, 3, ifelse(root, var(0) >= 30, 2, ifelse(root, var(0) >= 10, 1, 0))))

[State 3025, Hit Number]
type = varadd
trigger1 = 1
var(2) = 1
persistent = 0
ignorehitpause = 1

[State 3025, maxhitvar]
type = varadd
trigger1 = !time && !prevstateno
var(4) = 1 + var(10)

[State 3025, hitoverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = ifelse(var(2) < var(4), 3025, 3026)
ignorehitpause = 1
[State 3025, HB]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 3025, Anim]
type = changeanim
trigger1 = anim != 3025
value = 3025

[State 3025, Size]
type = angledraw
trigger1 = 1
scale = ifelse((time % 2), 0.8, 1), ifelse((time % 2), 0.8, 1.25)

[State 3025, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3025, ProjContact]
type = varset
trigger1 = movecontact = 1 && numenemy
trigger1 = (enemynear, movetype = H) && !(enemynear, time)
var(18) = 1
ignorehitpause = 1
[State 3025, ProjContact]
type = parentvarset
trigger1 = movecontact = 1 && numenemy
trigger1 = (enemynear, movetype = H) && !(enemynear, time)
trigger1 = root, stateno = 3020
var(18) = 1
ignorehitpause = 1

[State 3025, Vel]
type = velset
trigger1 = 1
x = 5 + (1.0 * var(10))
y = 0

[State 3025, Particles]
type = explod
trigger1 = !(gametime % 2)
anim = 8155
ID = 8155
sprpriority = 3
postype = p1
pos = -30, 0
random = 40, 40
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
scale = 0.167, 0.167
bindtime = -1
ownpal = 1

[State 3025, HitSound]
type = playsnd
trigger1 = movecontact = 1
value = 2, ifelse((movehit && numtarget), 7, 0)
channel = 2
ignorehitpause = 1

[State 3025, HitSound]
type = playsnd
trigger1 = movehit = 1 && numenemy
trigger1 = enemynear, movetype = H && enemynear, time = 0
value = 5, 5
channel = 2
persistent = 0
ignorehitpause = 1

[State 3025, Freeze]
type = posfreeze
trigger1 = time <= ifelse(numtarget, 4, 0)
value = 1

[State 3025, Miss]
type = hitdef
trigger1 = 1
attr = S, HP
hitflag =
sparkxy = -10, 0

[State 3025, Hit]
type = hitdef
trigger1 = root, var(15) < (5 + var(2))
trigger1 = time >= ifelse(numtarget, 4, 0)
priority = 4, Hit
attr = S, HP
damage = ceil(ifelse(var(2) >= var(4), 100, 20) * root, fvar(11)), 7
guard.dist = const(size.proj.attack.dist)
animtype = Hard
hitflag = MAF
guardflag = M
pausetime = 0, 12
sparkno = -1
guard.sparkno = -1
sparkxy = -10, 0
guardsound = -1
ground.type = High
ground.slidetime = 18
ground.hittime = 18
ground.velocity = -10.52, 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
air.velocity = -5, -3
fall = 0
air.fall = 1
fall.recover = 0
getpower = 0, 0
givepower = 40, 40
envshake.time = 12
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.freq = 180
sprpriority = 4
yaccel = 0.4850
ID = 3025
p2facing = ifelse((p2stateno != [5020, 5119]) && p2statetype != L, 1, 0)
forcestand = 1
palfx.time = 60
palfx.add = 0, 0, 0
palfx.mul = 256, 256, 256
palfx.sinadd = 255, 255, 255, 4
palfx.invertall = 1
palfx.color = 0

[State 3025, Shocked]
type = targetstate
trigger1 = movehit
trigger1 = numtarget(3025)
trigger1 = target, selfanimexist(7696)
trigger1 = (target(3025), stateno = 5000) || (target(3025), stateno = 5010) || (target(3025), stateno = 5020)
value = 7696
ID = 3025
ignorehitpause = 1

[State 3025, Guard Crush]
type = playsnd
trigger1 = moveguarded = 1
trigger1 = var(2) = 5 && numtarget(3025)
trigger1 = target(3025), stateno = [150, 153]
value = 7, 1
channel = 2
ignorehitpause = 1

[State 3025, Guard Crush]
type = targetstate
trigger1 = moveguarded = 1
trigger1 = var(2) = 5 && numtarget(3025)
trigger1 = target(3025), stateno = [150, 153]
value = 1115910
ID = 3025
ignorehitpause = 1

[State 3025, Stun System - Add]
type = parentvaradd
trigger1 = var(2) = var(4);Last hit only
trigger1 = movehit = 1
trigger1 = numtarget
trigger1 = root, var(42) >= 0
var(42) = ceil(var(4) * 250 * root, fvar(11))
ignorehitpause = 1

[State 3025, Stun System - Dizzy]
type = targetstate
trigger1 = movehit = 1
trigger1 = numenemy = 1 && numpartner = 0
trigger1 = roundstate = 2 && numtarget
trigger1 = target, gethitvar(damage) < target, life
trigger1 = root, var(42) >= (target, const(data.life))
value = 1115310
ignorehitpause = 1

[State 3025, Stun System - Simul]
type = targetstate
trigger1 = var(2) = 5
trigger1 = movehit = 1
trigger1 = (numenemy + numpartner > 1) || !(root, fvar(33))
trigger1 = roundstate = 2 && numtarget
value = 1115310
ignorehitpause = 1

[State 3025, Spark]
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

[State 3025, Spark]
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

[State 3025, Counter FX]
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

[State 3025, Shock Particles]
type = helper
trigger1 = !numhelper(8155)
trigger1 = movehit = 1 && numtarget
trigger1 = !(target, hitshakeover)
trigger1 = var(40) := (target, ID)
helpertype = normal
stateno = 8155
ID = 8155
name = "Shock Particles"
postype = p2
ownpal = 1
size.height = 46
ignorehitpause = 1

[State 3025, Underground Juggle Prevention]
type = targetbind
trigger1 = movecontact = 1
trigger1 = numtarget = 1 && numenemy
trigger1 = target, time <= 0
trigger1 = target, ID = enemynear, ID
trigger1 = !(target, hitshakeover) && (target, pos y > 0)
pos = ceil(p2dist x), ceil(-pos y)
ignorehitpause = 1

[State 3025, End]
type = changestate
trigger1 = movecontact
value = ifelse(var(2) < var(4), 3025, 3026)
[State 3025, End]
type = destroyself
trigger1 = frontedgedist < -120 || backedgedist < -120


[Statedef 3026]
type = A
physics = N
movetype = I
anim = 3026
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 3026, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3026, Dizzy]
type = playsnd
trigger1 = numtarget
trigger1 = numenemy + numpartner > 1
trigger1 = target, stateno = 1115300; && target, time = 1
value = 0, 5301
persistent = 0

[State 3026, End]
type = destroyself
triggerall = !animtime
trigger1 = !numtarget
trigger2 = numtarget
trigger2 = target, time <= 1 && !(target, hitshakeover)


;========================<METSU HADOU KEN>=============================
[Statedef 3045]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 3045, Strength]
type = varset
trigger1 = !time && !prevstateno
var(10) = ifelse(root, var(52) >= 90, 4, ifelse(root, var(52) >= 60, 3, ifelse(root, var(52) >= 35, 2, ifelse(root, var(52) >= 15, 1, 0))))

[State 3045, Hit Number]
type = varadd
trigger1 = 1
var(2) = 1
persistent = 0
ignorehitpause = 1

[State 3045, maxhitvar]
type = varadd
trigger1 = !time && !prevstateno
var(4) = 4 + var(10)

[State 3045, hitoverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = ifelse(var(2) < var(4), 3045, 3046)
ignorehitpause = 1

[State 3045, HB]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 3045, Anim]
type = changeanim
trigger1 = !time && !prevstateno
value = 3045

[State 3045, ProjContact]
type = varset
trigger1 = movecontact = 1 && numenemy
trigger1 = (enemynear, movetype = H) && !(enemynear, time)
var(18) = 1
ignorehitpause = 1
[State 3045, ProjContact]
type = parentvarset
trigger1 = movecontact = 1 && numenemy
trigger1 = (enemynear, movetype = H) && !(enemynear, time)
trigger1 = root, stateno = 3042
var(18) = 1
ignorehitpause = 1

[State 3045, Vel]
type = velset
trigger1 = 1
x = 6 + var(10)
y = 0

[State 3045, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3045, HitSound]
type = playsnd
trigger1 = movecontact = 1
value = 2, ifelse((movehit && numtarget), 7, 0)
channel = 2
ignorehitpause = 1

[State 3045, Freeze]
type = posfreeze
trigger1 = time <= ifelse(numtarget, 4, 0)
value = 1

[State 3045, Miss]
type = hitdef
trigger1 = 1
attr = S, HP
hitflag =
sparkxy = -10, 0

[State 3045, Hit]
type = hitdef
trigger1 = root, var(15) < (8 + var(2))
trigger1 = time >= ifelse(numtarget, 4, 0)
priority = 4, Hit
attr = S, HP
damage = ceil(ifelse(var(2) >= var(4), 100, 40) * root, fvar(11)), 7
guard.dist = const(size.proj.attack.dist)
animtype = Hard
fall.animtype = Hard
hitflag = MAF
guardflag = M
pausetime = 0, 12
sparkno = -1
guard.sparkno = -1
sparkxy = -10, 0
guardsound = -1
ground.type = Low
ground.slidetime = 18
ground.hittime = 18
ground.velocity = -4.5, -6
ground.cornerpush.veloff = 0
guard.velocity = -10.52
air.velocity = -4.5, -6
fall = 1
fall.recover = 0
p2facing = ifelse((p2stateno != [5020, 5119]) && p2statetype != L, 1, 0)
forcestand = 1
getpower = 0, 0
givepower = 40, 40
envshake.time = 12
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.freq = 180
palfx.color = 256
palfx.sinadd = 64, 0, 16, 4
palfx.mul = 192, 0, 64
palfx.time = 60
sprpriority = 4
yaccel = 0.4850
ID = 3045

[State 3045, Stun System - Add]
type = parentvaradd
trigger1 = var(2) = var(4);Last hit only
trigger1 = movehit = 1
trigger1 = numtarget
trigger1 = root, var(42) >= 0
var(42) = ceil(250 * var(4) * root, fvar(11))
ignorehitpause = 1

[State 3045, Stun System - Dizzy]
type = targetstate
trigger1 = movehit = 1
trigger1 = numenemy = 1 && numpartner = 0
trigger1 = roundstate = 2 && numtarget
trigger1 = target, gethitvar(damage) < target, life
trigger1 = root, var(42) >= (target, const(data.life))
value = 1115310
ignorehitpause = 1

[State 3045, Stun System - Simul]
type = targetstate
trigger1 = var(2) = var(4)
trigger1 = var(4) >= 6
trigger1 = movehit = 1
trigger1 = numenemy + numpartner > 1
trigger1 = roundstate = 2 && numtarget
value = 1115310
ignorehitpause = 1

[State 3045, Spark]
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

[State 3045, Spark]
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

[State 3045, Counter FX]
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

[State 3045, Underground Juggle Prevention]
type = targetbind
trigger1 = movecontact = 1
trigger1 = numtarget = 1 && numenemy
trigger1 = target, time <= 0
trigger1 = target, ID = enemynear, ID
trigger1 = !(target, hitshakeover) && (target, pos y > 0)
pos = ceil(p2dist x), ceil(-pos y)
ignorehitpause = 1

[State 3045, End]
type = changestate
trigger1 = movecontact
value = ifelse(var(2) < var(4), 3045, 3046)

[State 3045, End]
type = destroyself
trigger1 = frontedgedist < -180 || backedgedist < -180


[Statedef 3046]
type = A
physics = N
movetype = I
anim = 3046
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 3046, Snd]
type = playsnd
trigger1 = !time
value = 5, 10
ignorehitpause = 1
persistent = 0

[State 3046, Dizzy]
type = playsnd
trigger1 = numtarget
trigger1 = numenemy + numpartner > 1
trigger1 = target, stateno = 1115300 && target, time = 1
value = 0, 5301
persistent = 0

[State 3046, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3046, End]
type = destroyself
trigger1 = !animtime
trigger1 = !numtarget



;========================<RYUU KOKU HADOU KEN>=============================
[Statedef 3055]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 3055, hitoverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 3055
ignorehitpause = 1
[State 3055, HB]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 3055, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1
[State 3055, Bind]
type = bindtoroot
trigger1 = 1
pos = 69, -66

[State 3055, Strength]
type = varset
trigger1 = var(10) != 7
var(10) = 7
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

[State 3055, movehitvar2]
type = varset
trigger1 = !time && prevstateno
var(4) = animelemno(0)
ignorehitpause = 1

[State 3055, bgpal]
type = bgpalfx
trigger1 = 1
mul = 512, 0, 0
time = 2
mul = 512, 0, 0
add = -70, -70, -70
color = 0
ignorehitpause = 1

[State 3055, HitSound]
type = playsnd
trigger1 = movecontact = 1
value = 2, ifelse((movehit && numtarget), 11, 0)
channel = 2
ignorehitpause = 1

[State 3055, Hit]
type = hitdef
trigger1 = animelemno(0) != var(4)
trigger1 = animelemtime(25) <0 && !(time%4)
attr = S, HP
damage = ceil(66 * root, fvar(11)), 7
guard.dist = const(size.proj.attack.dist)
animtype = Hard
fall.animtype = Hard
hitflag = MAFD
priority = 4, Hit
pausetime = 0, 2
guard.dist = 320
sparkno = -1
guard.sparkno = -1
guardsound = -1
ground.type = Low
ground.slidetime = 18
ground.hittime = 18
ground.velocity = -20, -1
ground.cornerpush.veloff = 0
guard.velocity = -10.52
air.velocity = -20, -1
down.velocity = -20, -1
getpower = 0, 0
givepower = 40, 40
fall = 1
fall.recover = 0
sprpriority = 4
yaccel = 0.4850
p2facing = ifelse((p2stateno != [5020, 5119]) && p2statetype != L, 1, 0)
forcestand = 1

[State 3055, Hit]
type = hitdef
trigger1 = animelemno(0) != var(4)
trigger1 = animelem = 25
attr = S, HP
damage = ceil(66 * root, fvar(11)), 7
guard.dist = const(size.proj.attack.dist)
animtype = Diagup
fall.animtype = Diagup
hitflag = MAFD
priority = 4, Hit
pausetime = 0, 2
guard.dist = 320
sparkno = -1
guard.sparkno = -1
guardsound = -1
ground.type = Low
ground.slidetime = 18
ground.hittime = 18
ground.velocity = -20, 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
air.velocity = -20, -9
down.velocity = -20, -9
getpower = 0, 0
givepower = 40, 40
fall = 1
fall.recover = 0
sprpriority = 4
yaccel = 0.4850
p2facing = ifelse((p2stateno != [5020, 5119]) && p2statetype != L, 1, 0)
forcestand = 1

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
pos = ceil(p2dist x), 0
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
pos = ceil(p2dist x), 0
supermovetime = -1
pausemovetime = -1
ontop = 1
ownpal = 1

[State 3055, End]
type = changestate
trigger1 = !animtime || root, stateno != 3050 || root, anim != 3050
value = 3056

[Statedef 3056]
type = A
physics = N
movetype = I
anim = 3056
ctrl = 0
velset = 0, 0
sprpriority = 4
[State 3056, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3056, bgpal]
type = bgpalfx
trigger1 = 1
mul = 512 -ceil(18 * time), ceil(18 * time), ceil(18 * time)
add = (-70 + 5 * time), (-70 + 5 * time), (-70 + 5 * time)
color = ceil(18 * time)
time = 2
[State 3056, End]
type = destroyself
trigger1 = !animtime


;====================<LAZY SHAKUNETSU CHARGE>====================
[Statedef 1024]
type = A
physics = N
anim = 9999
sprpriority = 0
ctrl = 0

[State 1024, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = -1
ignorehitpause = 1

[State 1024, noshadow]
type = assertspecial
trigger1 = 1
flag = noshadow

[State 1024, bind]
type = bindtoroot
trigger1 = 1
pos = -1 + (random % 3), -1 + (random % 3)
facing = 1

[State 1024, Red]
type = palfx
trigger1 = 1
color = 0
mul = 256, 0, 0
time = 1

[State 1024, Level]
type = varset
trigger1 = !time
var(0) = root, var(10)

[State 1024, trans]
type = angledraw
trigger1 = 1
scale = 1.05 + 0.025 * var(0), 1.05 + 0.025 * var(0)

[State 1024, trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 224, 256
ignorehitpause = 1

[State 1024, Anim]
type = changeanim
trigger1 = selfanimexist(root, anim)
value = (root, anim)
elem = (root, animelemno(0))

[State 1024, End]
type = destroyself
trigger1 = root, movetype = H
trigger2 = root, stateno != 1020
trigger2 = root, stateno != 1030 
trigger3 = root, animelemtime(5) >= 0


;========================<SUPER SHORYUKEN DUST>=============================
[Statedef 3125]
physics = N
anim = 9999

[State 3125, Pos]
type = posset
trigger1 = 1
y = 0

[State 3125, Dust]
type = explod
trigger1 = !time
anim = 3125
ID = 3125
sprpriority = -2
postype = p1
pos = 0, 2
removetime = 16

[State 3125, Shrink]
type = modifyexplod
trigger1 = 1
ID = 3125
scale = 0.2 + (0.05 * time) * const(size.xscale), 0.02 + (0.005 * time) * const(size.yscale)

[State 3125, Fade]
type = modifyexplod
trigger1 = 1
ID = 3125
trans = addalpha
alpha = 256 - (16 * time), 256

[State 3125, End]
type = destroyself
trigger1 = time >= 16


;========================<METSU SHORYUU KEN>=============================
[Statedef 3165]
physics = N
velset = 0, 0
anim = 3165
sprpriority = 3
[State 3165, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1
[State 3165, Bind]
type = bindtoroot
trigger1 = 1
[State 3165, Shadows]
type = afterimage
trigger1 = !time && !prevstateno
time = 999
timegap = 1
framegap = 1
length = 3
palcontrast = 120, 30, 30
trans = add
[State 3165, End]
type = destroyself
trigger1 = !animtime


;========================<TATSUMAKI VACUUM>=============================
[Statedef 3205]
physics = N
velset = 0, 0
anim = 3205

[State 3205, NHB]
type = nothitby
trigger1 = 1
time = -1
value = SCA

[State 3205, hitoverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 3205
ignorehitpause = 1

[State 3205, bound]
type = screenbound
trigger1 = 1
value = 0

[State 3205, Turn]
type = turn
trigger1 = rootdist x < 5

[State 3205, Push]
type = playerpush
trigger1 = p2bodydist x = [-10, 10]
value = 1

[State 3205, Pos]
type = posset
trigger1 = 1
y = 0

[State 3205, Vel]
type = velset
trigger1 = root, var(1) = 1
x = 250.0 / (rootdist x + 50.0)

[State 3205, Vel]
type = velset
trigger1 = root, var(1) != 1
x = 500.0 / (rootdist x + 50.0)

[State 3205, Dust]
type = explod
trigger1 = numenemy
trigger1 = (p2bodydist x = [-5, 5]) && (enemynear, statetype != A) && !(time % 12)
anim = 7103
ID = 7103
sprpriority = 2
postype = p1
pos = 0, 0
scale = 0.5, 0.5
removetime = -2
ownpal = 1

[State 3205, Pos]
type = posadd
trigger1 = numenemy
trigger1 = p2bodydist x != [-5, 5]
x = ceil(p2dist x) - enemynear, const(size.ground.back) -5

[State 3205, End]
type = destroyself
trigger1 = root, stateno != 3200 || (root, anim != [3201, 3202]) || root, movecontact


;========================<CLOUD>=============================
[Statedef 3215]
physics = N
anim = 3215
sprpriority = 4

[State 3215, Pos]
type = posadd
trigger1 = !time
y = -ceil(screenpos y) -20
[State 3215, Bind]
type = posset
trigger1 = var(0) != 3
x = ceil(root, pos x)
[State 3215, Bind]
type = posset
trigger1 = var(0) = 2
y = -180

[State 3215, Vel]
type = velset
trigger1 = !time
trigger1 = var(0) := 1
y = (pos y + 180) / -57.9

[State 3215, Anim]
type = changeanim
trigger1 = anim = 3215 && (root, anim = [3201, 3202])
trigger1 = var(0) := 2
value = 3216
[State 3215, Vel]
type = velset
trigger1 = var(0) = 2
y = 0

[State 3215, Vel]
type = velset
trigger1 = anim = 3216 && (root, anim != [3201, 3202])
trigger1 = var(0) := 3
y = -2

[State 3215, rain]
type = explod
trigger1 = var(0) = 2 && !numexplod(3217)
anim = 3217
ID = 3217
sprpriority = 3
postype = p1
facing = 1
pos = 0, -ceil(pos y)
bindtime = -1
removetime = 300
trans = addalpha
alpha = 128, 128

[State 3215, rain]
type = removeexplod
trigger1 = var(0) = 3

[State 3215, Snd]
type = playsnd
trigger1 = var(0) = 2
value = 5, 16
channel = 0
loop = 1
persistent = 0
[State 3215, Snd]
type = stopsnd
trigger1 = var(0) != 2
channel = 0

[State 3215, End]
type = destroyself
trigger1 = var(0) = 3
trigger1 = vel y < 0 && pos y <= -260


;========================<BAG>=============================
[Statedef 6000]
physics = N
anim = 6000
sprpriority = 0

[State 6000, Bind1]
type = bindtoroot
trigger1 = (root, anim = 355) && roundstate = 1
trigger1 = (root, animelemtime(1) >= 0) && (root, animelemtime(4) < 0)
pos = 61, -46
[State 6000, Bind4]
type = bindtoroot
trigger1 = (root, anim = 355) && roundstate = 1
trigger1 = (root, animelemtime(4) >= 0) && (root, animelemtime(5) < 0)
pos = 38, -46
[State 6000, Bind5]
type = bindtoroot
trigger1 = (root, anim = 355) && roundstate = 1
trigger1 = (root, animelemtime(5) >= 0) && (root, animelemtime(6) < 0)
pos = 14, -46
[State 6000, Bind6]
type = bindtoroot
trigger1 = (root, anim = 355) && roundstate = 1
trigger1 = (root, animelemtime(6) >= 0) && (root, animelemtime(7) < 0)
pos = 2, -43
[State 6000, Bind7]
type = bindtoroot
trigger1 = (root, anim = 355) && roundstate = 1
trigger1 = root, animelem = 7
pos = -19, -46

[State 6000, Accel]
type = veladd
trigger1 = time >= 91
y = 0.5

[State 6000, Vel]
type = velset
trigger1 = time = 91
x = -7

[State 6000, Vel]
type = velmul
trigger1 = time >= 91
x = 0.85

[State 6000]
type = sprpriority
trigger1 = time >= 91
value = -3

[State 6000, End]
type = changestate
trigger1 = vel y > 0
trigger1 = ((pos y -6) > -vel y)
trigger1 = p2name != "Shining Force 2 Kraken" && p4name != "Shining Force 2 Kraken"
trigger1 = p2name != "Sky Chase" && p4name != "Sky Chase"
value = 6001

[State 6000, Sink]
type = destroyself
trigger1 = time >= 180
trigger1 = screenpos y > gameheight


[Statedef 6001]
physics = S
anim = ifelse(random < 750, 6001, 6002)
sprpriority = -3
velset = vel x, 0

[State 6001, Stop]
type = posset
trigger1 = 1
y = -6

[State 6001, landsnd]
type = playsnd
trigger1 = !time
trigger2 = anim = 6003 && animelem = 3
value = 5, 2

[State 6001, Dust]
type = explod
trigger1 = !time
anim = 7102
ID = 7102
sprpriority = -4
postype = p1
pos = -2, 0
scale = 0.25, 0.25
ownpal = 1

[State 6001, Fall]
type = changeanim
triggerall = anim = 6001
triggerall = random < 500
triggerall = animelemtime(2) > 0
trigger1 = root, movetype = H
trigger1 = (rootdist x = [-30, 30]) && (rootdist x = [-30, 30])
trigger2 = numenemy
trigger2 = enemy, movetype = H
trigger2 = (p2dist x = [-30, 30]) && (p2dist y = [-30, 30])
value = 6003
persistent = 0


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
trigger2 = numhelper(3005)
trigger2 = helper(3005), var(18) && helper(3005), time <= 1
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
value = 5, 20
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
trigger1 = (playerID(var(0)), movetype = H) && playerID(var(0)), stateno = 3162;metsu shoryuken
trigger2 = (playerID(var(0)), movetype = H) && (playerID(var(0)), stateno = [3320, 3322]);kaze no ken


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
trigger2 = numhelper(1015)
trigger2 = helper(1015), var(18) && helper(1015), time <= 1
trigger3 = numhelper(1025)
trigger3 = helper(1025), var(18) && helper(1025), time <= 1
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
value = 5, 20
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
trigger1 = (playerID(var(0)), movetype = H) && playerID(var(0)), stateno = 3162;metsu shoryuken
trigger2 = (playerID(var(0)), movetype = H) && (playerID(var(0)), stateno = [3320, 3322]);kaze no ken


;========================<SHOCK>=============================
[Statedef 8155]
type = A
velset = 0, 0
anim = 9999

[State 8155, Player]
type = varset
trigger1 = !time
var(0) = parent, var(40)

[State 8155, Time]
type = varadd
trigger1 = 1
var(1) = -1

[State 8155, Time]
type = varset
trigger1 = !time
trigger2 = numhelper(3025)
trigger2 = helper(3025), var(18) && helper(3025), time <= 1
var(1) = 60

[State 8155, Pos]
type = posset
trigger1 = playerIDexist(var(0))
x = ceil(playerID(var(0)), pos x)
y = ceil(playerID(var(0)), pos y) + (playerID(var(0)), const(size.mid.pos.y))

[State 8155, Pos]
type = posset
trigger1 = playerIDexist(var(0))
trigger1 = playerID(var(0)), statetype = L
x = ceil(playerID(var(0)), pos x)
y = ceil(playerID(var(0)), pos y) - 20

[State 8155, Turn]
type = turn
trigger1 = playerIDexist(var(0))
trigger1 = facing != (playerID(var(0)), facing)

[State 8155, Flames]
type = explod
trigger1 = playerIDexist(var(0))
trigger1 = !(time % 2)
anim = 8155
sprpriority = 3
postype = p1
random = (playerID(var(0)), const(size.height)), (playerID(var(0)), const(size.height))
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
bindtime = -1
scale = 0.15, 0.15
ownpal = 1

[State 8155, End]
type = destroyself
trigger1 = !playerIDexist(var(0))
trigger2 = var(1) <= 0

[State 8155, End]
type = destroyself
triggerall = playerIDexist(var(0))
trigger1 = (playerID(var(0)), movetype = H) && playerID(var(0)), stateno = 3162;metsu shoryuken
trigger2 = (playerID(var(0)), movetype = H) && (playerID(var(0)), stateno = [3320, 3322]);kaze no ken


;========================<KAZE NO KEN SHOCKWAVE>=============================
[Statedef 3315]
physics = N
velset = 0, 0
anim = 9999

[State 3315, Palfx]
type = palfx
trigger1 = time = 5
time = 10
add = 0, 0, 0
sinadd = -255, -255, -255, 40

[State 3315, Circle]
type = explod
trigger1 = !time
anim = 3315
ID = 3315
sprpriority = -1
postype = p1
removetime = 16
pausemovetime = -1
supermovetime = -1

[State 3315, Shrink]
type = modifyexplod
trigger1 = 1
ID = 3315
scale = 0.5 + time * 0.09375, 0.5 - (0.03125 * time)

[State 3315, Safety]
type = removeexplod
trigger1 = time >= 16

[State 3315, End]
type = destroyself
trigger1 = !numexplod


;========================<SHIN SHORYUUKEN SHOCKWAVE>=============================
[Statedef 7050]
physics = N
velset = 0, 0
anim = 9999

[State 7050, Circle]
type = explod
trigger1 = !time
anim = 7050
ID = 7050
sprpriority = -5
postype = p1
removetime = 16
pausemovetime = -1
supermovetime = -1

[State 7050, Circle]
type = explod
trigger1 = !time
anim = 7051
ID = 7051
sprpriority = -5
postype = p1
removetime = 16
pausemovetime = -1
supermovetime = -1

[State 7050, Shrink]
type = modifyexplod
trigger1 = 1
ID = 7050
scale = 0.05 * time, 0.05 * time
trans = addalpha
alpha = 256 - (16 * time), 256

[State 7050, Shrink]
type = modifyexplod
trigger1 = 1
ID = 7051
scale = 0.15 * time, 0.15 * time

[State 7050, No Shadow]
type = assertspecial
trigger1 = 1
flag = invisible
ignorehitpause = 1

[State 7050, Safety]
type = removeexplod
trigger1 = time >= 16
ID = 7050

[State 7050, End]
type = destroyself
trigger1 = time >= 16


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
pos = -9, 0

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
vel = ((rootdist x -11) / 32.0), ((rootdist y -61) / 32.0)
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
anim = ifelse((root, var(1) = 3), 7527, ifelse((root, var(1) = 2), 7526, 7525))
ID = 20
sprpriority = -16
postype = back
bindtime = -1
removetime = 40
supermovetime = -1
[State 7520, Portrait]
type = explod
trigger1 = !time
anim = ifelse((root, var(1) = 3), 7527, ifelse((root, var(1) = 2), 7526, 7525))
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
pos = 160, ifelse((gamewidth / gameheight) > 1.55, 100, 120)
scale = 1 - (0.03125 * time), 1 - (0.03125 * time)
trans = addalpha
alpha = (8 * time), 256
[State 7520, Scale]
type = modifyexplod
trigger1 = numexplod(21) && time < 16
ID = 21
postype = back
pos = 160, ifelse((gamewidth / gameheight) > 1.55, 100, 120)
scale = 2 - (0.09375 * time), 2 - (0.09375 * time)
trans = addalpha
alpha = (8 * time), 256

[State 7520, Scale]
type = modifyexplod
trigger1 = numexplod(20) && (time = [16, 32])
ID = 20
postype = back
pos = 160, ifelse((gamewidth / gameheight) > 1.55, 100, 120)
scale = 0.5, 0.5
trans = addalpha
alpha = 256, 256
[State 7520, Scale]
type = removeexplod
trigger1 = numexplod(21) && time >= 16
ID = 21

[State 7520, Scale]
type = modifyexplod
trigger1 = numexplod(20) && time >= 32
ID = 20
postype = back
pos = 160, ifelse((gamewidth / gameheight) > 1.55, 100, 120)
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
value = 7, 7
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
trigger1 = root, var(23) = 3200
var(0) = 3
[State 8600, Move Name]
type = varset
trigger1 = !time
trigger1 = root, var(23) = 3100
var(0) = 4
[State 8600, Move Name]
type = varset
trigger1 = !time
trigger1 = root, var(23) = 3020
var(0) = 5
[State 8600, Move Name]
type = varset
trigger1 = !time
trigger1 = root, var(23) = 3300
var(0) = 6
[State 8600, Move Name]
type = varset
trigger1 = !time
trigger1 = root, var(23) = 3120
var(0) = 7
[State 8600, Move Name]
type = varset
trigger1 = !time
trigger1 = root, var(23) = 3140
var(0) = 8
[State 8600, Move Name]
type = varset
trigger1 = !time
trigger1 = root, var(23) = 3160
var(0) = 9
[State 8600, Move Name]
type = varset
trigger1 = !time
trigger1 = root, var(23) = 3040
var(0) = 10
[State 8600, Move Name]
type = varset
trigger1 = !time
trigger1 = root, var(23) = 3050
var(0) = 11
[State 8600, Move Name]
type = varset
trigger1 = !time
trigger1 = root, var(23) = 3180
var(0) = 12

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
value = 7, 8

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

[State 7610, Fade]
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
trigger1 = time < 6
ID = 7610
scale = (5.5 - time) * (1.3333333 * gameheight / gamewidth), (5.5 - time) * (1.3333333 * gameheight / gamewidth)

[State 7610, Shrink]
type = modifyexplod
trigger1 = time >= 6
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
removetime = 600
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
trigger1 = root, var(1) = 1
trigger1 = var(1) < (-366 + ifelse((gamewidth / gameheight) > 1.67, 142, 204))
var(1) = ceil(-366 + ifelse((gamewidth / gameheight) > 1.67, 142, 204))

[State 8980, Pos Y];-Half of image height
type = varset
trigger1 = root, var(1) = 2
trigger1 = var(1) < (-404 + ifelse((gamewidth / gameheight) > 1.67, 142, 204))
var(1) = ceil(-404 + ifelse((gamewidth / gameheight) > 1.67, 142, 204))

[State 8980, Pos Y];-Half of image height
type = varset
trigger1 = root, var(1) = 3
trigger1 = var(1) < (-452 + ifelse((gamewidth / gameheight) > 1.67, 142, 204))
var(1) = ceil(-452 + ifelse((gamewidth / gameheight) > 1.67, 142, 204))

[State 8980, Pos Y]
type = varset
trigger1 = var(1) > 0
var(1) = 0

[State 8980, Explod]
type = explod
trigger1 = !numexplod(8980)
anim = ifelse((root, var(1) = 3), 8982, ifelse((root, var(1) = 2), 8981, 8980))
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


;========================<CHARGED HADOUKEN>=============================
[Statedef 1045]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 1045, Strength]
type = varset
trigger1 = !time
trigger1 = !prevstateno
var(10) = root, var(10)

[State 1045, Anim]
type = changeanim
trigger1 = anim != 1005
value = 1005

[State 1045, Hit Number]
type = varadd
trigger1 = 1
var(2) = 1
persistent = 0
ignorehitpause = 1

[State 1045, hitoverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = ifelse(var(2) < 2, 1045, 1046)
ignorehitpause = 1

[State 1045, HB]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State Damage Scaling - Update Root]
type = null
trigger1 = !var(43)
trigger1 = movecontact && numtarget
trigger1 = var(43) := 1
trigger1 = root, var(43) = 0
;trigger1 = root, var(43) := 1
ignorehitpause = 1

[State 1045, ProjContact]
type = varset
trigger1 = movecontact = 1 && numenemy
trigger1 = (enemynear, movetype = H) && !(enemynear, time)
var(18) = 1
ignorehitpause = 1
[State 1045, ProjContact]
type = varset
trigger1 = movecontact = 1 && numenemy
trigger1 = (enemynear, movetype = H) && !(enemynear, time)
trigger1 = root, stateno = 1040
var(18) = 1
ignorehitpause = 1

[State 1045, Vel]
type = velset
trigger1 = 1
x = ifelse(var(10) = 3, 7.5, ifelse(var(10) = 2, 6.25, 5.0))
y = 0

[State 1045, Size]
type = angledraw
trigger1 = time < 4
trigger1 = !prevstateno
scale = 0.5 + (0.125 * time), 1

[State 1045, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256 - 32 * (time % 4), 256
ignorehitpause = 1

[State 1045, Particles]
type = explod
trigger1 = !(gametime % 2)
anim = 8155
ID = 8155
sprpriority = 3
postype = p1
pos = -30, 0
random = 20, 20
;random = 40, 40
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
angle = 90 * (random % 4)
scale = 0.167, 0.167
bindtime = -1
ownpal = 1

[State 1045, HitSound]
type = playsnd
trigger1 = movecontact = 1
value = 2, ifelse((movehit && numtarget), 7, 0)
channel = 2
ignorehitpause = 1

[State 1045, HitSound]
type = playsnd
trigger1 = movehit = 1
trigger1 = numtarget
trigger1 = target, time = 0
value = 5, 5
channel = 2
persistent = 0
ignorehitpause = 1

[State 1045, Freeze]
type = posfreeze
trigger1 = time <= ifelse(numtarget, 4, 0)
value = 1

[State 1045, Miss]
type = hitdef
trigger1 = 1
attr = S, SP
hitflag =
sparkxy = -10, 0

[State 1045, Hit]
type = hitdef
trigger1 = root, var(15) < 2 || root, var(20)
trigger1 = time >= ifelse(numtarget, 4, 0)
priority = 4, Hit
attr = S, SP
damage = 45, 11
guard.dist = const(size.proj.attack.dist)
animtype = Hard
fall.animtype = Back
hitflag = MAF
guardflag = MA
pausetime = 0, 12
sparkno = -1
sparkxy = -10, 0
guard.sparkno = -1
guardsound = -1
ground.type = High
ground.slidetime = 18
ground.hittime = 18
ground.velocity = -10.52, 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
air.velocity = -4.0, -5.25
yaccel = 0.4850
air.fall = 1
fall.recover = 1
fall.recovertime = 120
getpower = 0, 0
givepower = 40, 40
envshake.time = 10
envshake.ampl = ifelse((gametime % 2), -1, 1)
envshake.freq = 180
p1sprpriority = 4
airguard.ctrltime = 16
airguard.velocity = -6.00, -1.00
forcestand = 1
palfx.time = 30
palfx.add = 0, 0, 0
palfx.mul = 256, 256, 256
palfx.sinadd = 255, 255, 255, 4
palfx.invertall = 1
palfx.color = 0
ID = 1045

[State 1045, Getpower]
type = poweradd
trigger1 = !(root, var(20))
trigger1 = movecontact = 1
trigger1 = numtarget
value = ifelse(movehit && !prevstateno, 50, 25)
ignorehitpause = 1

[State 1045, Shocked]
type = targetstate
trigger1 = movehit
trigger1 = numtarget(1045)
trigger1 = target, selfanimexist(7696)
trigger1 = (target(1045), stateno = 5000) || (target(1045), stateno = 5010) || (target(1045), stateno = 5020)
value = 7696
ID = 1045
ignorehitpause = 1

[State 1045, Spark]
type = helper
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

[State 1045, Spark]
type = explod
trigger1 = movecontact = 1 && numtarget
trigger1 = (target, movetype = H) && !(target, time)
anim = ifelse(moveguarded, 8000, 8010)
ID = 8000
postype = p1
pos = 0, 0
supermovetime = -1
pausemovetime = -1
ontop = 1
ownpal = 1

[State 1045, Counter FX]
type = helper
trigger1 = movehit = 1
trigger1 = numtarget
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

[State 1045, Shock Particles]
type = helper
trigger1 = !numhelper(8155)
trigger1 = movehit = 1 && numtarget
trigger1 = !(target, hitshakeover)
trigger1 = var(40) := (target, ID)
helpertype = normal
stateno = 8155
ID = 8155
name = "Shock Particles"
postype = p2
ownpal = 1
size.height = 46
ignorehitpause = 1

[State 1045, End]
type = changestate
trigger1 = movecontact
value = ifelse(var(2) < 2, 1045, 1046)

[State 1045, End]
type = destroyself
trigger1 = frontedgedist < -100 || backedgedist < -80


[Statedef 1046]
type = A
physics = N
movetype = I
anim = 1006
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 1046, Trade Sound]
type = playsnd
trigger1 = !time
trigger1 = prevstateno = [5000, 5999]
value = 2, 0
channel = 2
lowpriority = 1
volumescale = 50

[State 1046, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 1046, End]
type = destroyself
trigger1 = !animtime

;========================<EX SHAKUNETSU HADOU KEN>=============================
[Statedef 1035]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 1035, Anim]
type = changeanim
trigger1 = anim != 1015
value = 1015

[State 1035, hitoverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 1036
ignorehitpause = 1

[State 1035, HB]
type = hitby
trigger1 = 1
time = -1
value = SCA, HP
ignorehitpause = 1

[State Damage Scaling - Update Root]
type = null
trigger1 = !var(43)
trigger1 = movecontact && numtarget
trigger1 = var(43) := 1
trigger1 = root, var(43) = 0
ignorehitpause = 1

[State 1035, ProjContact]
type = varset
trigger1 = movecontact = 1 && numenemy
trigger1 = (enemynear, movetype = H) && !(enemynear, time)
var(18) = 1
ignorehitpause = 1

[State 1035, ProjContact]
type = varset
trigger1 = movecontact = 1 && numenemy
trigger1 = (enemynear, movetype = H) && !(enemynear, time)
trigger1 = root, stateno = 1030
var(18) = 1
ignorehitpause = 1

[State 1035, Vel]
type = velset
trigger1 = 1
x = 12
y = 0

[State 1035, Size]
type = angledraw
trigger1 = 1
scale = 0.33, ifelse(time < 4, 0.5 - (0.085 * time), 0.33)

[State 1035, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256 - 32 * (time % 3), 256
ignorehitpause = 1

[State 1035, Particles]
type = explod
trigger1 = !(time % 2)
anim = 8151
ID = 8151
sprpriority = 3
postype = p1
vel = 0, 0
pos = -40, 0
random = 4, 4
;random = 8, 8
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
angle = 90 * (random % 4)
scale = 0.2, 0.2
ownpal = 1

[State 1035, HitSound]
type = playsnd
trigger1 = movecontact = 1
value = 2, ifelse((movehit && numtarget), 12, 0)
channel = 2
ignorehitpause = 1

[State 1035, Miss]
type = hitdef
trigger1 = 1
attr = S, SP
hitflag =
sparkxy = -10, 0

[State 1035, Hit]
type = hitdef
trigger1 = (root, var(15) < 1 || root, var(20))
trigger1 = 1
priority = 4, Hit
attr = S, SP
damage = 40, 10
guard.dist = const(size.proj.attack.dist)
animtype = Back
hitflag = MAF
guardflag = MA
pausetime = 0, 12
sparkno = -1
sparkxy = -10, 0
guard.sparkno = -1
guardsound = -1
ground.type = Low
ground.slidetime = 18
ground.hittime = 18
ground.velocity = -12, -4.25
ground.cornerpush.veloff = 0
guard.velocity = -10.52
air.velocity = -12, -4.25
yaccel = 0.4850
fall = 1
fall.recover = 1
fall.recovertime = 120
getpower = 0, 0
givepower = 40, 40
envshake.time = 10
envshake.ampl = ifelse((gametime % 2), -1, 1)
envshake.freq = 180
palfx.color = 256
palfx.sinadd = 128, 128, 128, 4
palfx.mul = 128, 128, 128
palfx.time = 60
p1sprpriority = 4
airguard.ctrltime = 16
airguard.velocity = -6.00, -1.00
forcestand = 1
ID = 1035

[State 1035, Burned]
type = targetstate
trigger1 = movehit
trigger1 = numtarget(1035)
trigger1 = target, selfanimexist(7697)
trigger1 = (target(1035), stateno = 5000) || (target(1035), stateno = 5010) || (target(1035), stateno = 5020)
value = 7697
ID = 1035
ignorehitpause = 1

[State 1035, Spark]
type = helper
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

[State 1035, Spark]
type = explod
trigger1 = movecontact = 1 && numtarget
trigger1 = (target, movetype = H) && !(target, time)
anim = ifelse(moveguarded, 8010, 8000)
ID = 8000
postype = p1
pos = 0, 0
supermovetime = -1
pausemovetime = -1
ontop = 1
ownpal = 1

[State 1035, Counter FX]
type = helper
trigger1 = movehit = 1
trigger1 = numtarget
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

[State 1035, Flame Particles]
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

[State 1035, End]
type = changestate
trigger1 = movecontact
value = 1036

[State 1035, End]
type = destroyself
trigger1 = frontedgedist < -100 || backedgedist < -80



;--- Explosion ---
[Statedef 1036]
type = S
physics = N
movetype = A
ctrl = 0
anim = 1036
velset = 0, 0
sprpriority = 4

[State 1036, HB]
type = nothitby
trigger1 = 1
time = -1
value = SCA
ignorehitpause = 1

[State Damage Scaling - Update Root]
type = null
trigger1 = !var(43)
trigger1 = movecontact && numtarget
trigger1 = var(43) := 1
trigger1 = root, var(43) = 0
ignorehitpause = 1

[State 1036, ProjContact]
type = varset
trigger1 = movecontact = 1 && numenemy
trigger1 = (enemynear, movetype = H) && !(enemynear, time)
var(18) = 1
ignorehitpause = 1

[State 1036, ProjContact]
type = varset
trigger1 = movecontact = 1 && numenemy
trigger1 = (enemynear, movetype = H) && !(enemynear, time)
trigger1 = root, stateno = 1030
var(18) = 1
ignorehitpause = 1

[State 1036, Size]
type = angledraw
trigger1 = 1
scale = 0.75, 0.75

[State 1036, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 1036, Sound]
type = playsnd
trigger1 = animelem = 3
value = 5, 21

[State 1036, HitSound]
type = playsnd
trigger1 = movecontact = 1
value = 2, ifelse((movehit && numtarget), 12, 0)
channel = 2
ignorehitpause = 1

[State 1036, Hit]
type = hitdef
trigger1 = animelem = 3
trigger1 = root, var(15) < 2 || root, var(20)
priority = 4, Hit
attr = S, SP
damage = 40, 10
guard.dist = const(size.proj.attack.dist)
animtype = Back
hitflag = MAF
guardflag = MA
pausetime = 0, 4
sparkno = -1
sparkxy = -10, 0
guard.sparkno = -1
guardsound = -1
ground.type = Low
ground.slidetime = 18
ground.hittime = 18
ground.velocity = -12, -4.25
ground.cornerpush.veloff = 0
guard.velocity = -10.52
air.velocity = -12, -4.25
yaccel = 0.4850
fall = 1
fall.recover = 1
fall.recovertime = 120
getpower = 0, 0
givepower = 40, 40
envshake.time = 10
envshake.ampl = ifelse((gametime % 2), -1, 1)
envshake.freq = 180
palfx.color = 256
palfx.sinadd = 128, 128, 128, 4
palfx.mul = 128, 128, 128
palfx.time = 60
p1sprpriority = 4
airguard.ctrltime = 16
airguard.velocity = -6.00, -1.00
forcestand = 1
ID = 1036

[State 1036, Wall Bounce]
type = targetstate
trigger1 = movehit && numtarget(1036)
trigger1 = (target(1036), stateno = 5000) || (target(1036), stateno = 5010) || (target(1036), stateno = 5020)
value = 1111300
ID = 1036
ignorehitpause = 1

[State 1036, Juggle Reset]
type = varset
trigger1 = movehit = 1
trigger1 = numtarget(1036)
trigger1 = target(1036), stateno = 1111300
var(15) = 0
ignorehitpause = 1

[State 1036, Spark]
type = helper
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

[State 1036, Spark]
type = explod
trigger1 = movecontact = 1 && numtarget
trigger1 = (target, movetype = H) && !(target, time)
anim = ifelse(moveguarded, 8000, 8010)
ID = 8000
postype = p1
pos = 0, 0
supermovetime = -1
pausemovetime = -1
ontop = 1
ownpal = 1

[State 1036, Counter FX]
type = helper
trigger1 = movehit = 1
trigger1 = numtarget
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

[State 1036, Flame Particles]
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

[State 1036, End]
type = destroyself
trigger1 = !animtime

