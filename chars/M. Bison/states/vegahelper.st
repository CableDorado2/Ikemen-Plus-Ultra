; _______________________________
;| Vega by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==============================================================================================
;=======================================<HELPER STATES>========================================
;==============================================================================================

;========================<PROJECTILE HITTER>=============================
[Statedef 1007]
type = A
physics = N
movetype = I
anim = 9999
ctrl = 0

[State 1007, End]
type = destroyself
trigger1 = (root, stateno != 1000) && (root, stateno != 3000) && (root, stateno != 3050) && (root, stateno != 4001)
trigger2 = root, stateno = 1000 && (root, anim != 1000 || animelemtime(6) < 0)
trigger3 = root, stateno = 3000 && (root, anim != 3000 || animelemtime(6) < 0)
trigger4 = root, stateno = 3050 && (root, anim != 3050 || animelemtime(13) < 0)

[State 1007, elemvar]
type = varset
trigger1 = !(root, hitpausetime)
var(0) = (root, animelemno(0))
[State 1007, Anim]
type = changeanim
trigger1 = 1
value = root, anim
elem = var(0)

[State 1007, hitoverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 1007
ignorehitpause = 1

[State 1007, HB]
type = hitby
trigger1 = (root, stateno = 1000) || (root, stateno = 3000)
time = -1
value = SCA, NP
ignorehitpause = 1

[State 1007, HB]
type = hitby
trigger1 = (root, stateno = 3050)
time = -1
value = SCA, NP, SP
ignorehitpause = 1

[State 1007, HB]
type = hitby
trigger1 = (root, stateno = 4001)
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 1007, Bind]
type = bindtoroot
trigger1 = 1
time = -1
[State 1007, Assert]
type = assertspecial
trigger1 = 1
flag = invisible


;========================<PROJECTILE BANISHER>=============================
[Statedef 1407]
type = A
physics = N
movetype = I
ctrl = 0
anim = 1407
velset = 0, 0

[State 1407, hitoverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 1407
ignorehitpause = 1

[State 1407, HB]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 1407, Anim]
type = changeanim
trigger1 = anim != 1407
value = 1407

[State 1407, No Shadow]
type = assertspecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 1407, Bind]
type = bindtoroot
trigger1 = 1
time = -1

[State 1407, hitsound]
type = playsnd
trigger1 = !time && prevstateno
value = 2, 0
channel = 2
ignorehitpause = 1

[State 1407, Spark]
type = helper
trigger1 = root, fvar(31)
trigger1 = !time && prevstateno
helpertype = normal
stateno = 8001
ID = 8000
name = "Spark"
postype = p1
pos = 55, -60
facing = 1
ownpal = 1
size.xscale = 1
size.yscale = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State 1407, Spark]
type = explod
trigger1 = !(root, fvar(31))
trigger1 = !time && prevstateno
anim = F40
ID = 8000
postype = p1
pos = 55, -60
supermovetime = -1
pausemovetime = -1
ontop = 1
ownpal = 1

[State 1407, End]
type = destroyself
;triggerall = 0
trigger1 = root, stateno != 1400 || (root, anim != [1400, 1402])
trigger2 = root, animelemtime(7) < 0 || root, movetype = H
trigger3 = root, anim = 1400 && root, animelemtime(10) >= 0
trigger4 = root, anim = 1401 && root, animelemtime(11) >= 0
trigger5 = root, anim = 1402 && root, animelemtime(12) >= 0


;========================<PSYCHO FIELD>=============================
;--- ADVANCING ---
[Statedef 1605]
type = A
physics = N
movetype = A
anim = 1605
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 1605, NHB]
type = nothitby
trigger1 = 1
time = -1
value = SCA
ignorehitpause = 1
[State 1605, Strength]
type = varset
trigger1 = !time
var(10) = root, var(10)

[State 1605, Time Var]
type = varadd
trigger1 = time
var(0) = 1
[State 1605, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

;[State 1605, Guard]
;type = attackdist
;trigger1 = 1
;value = 0

[State 1605, Accel]
type = veladd
trigger1 = vel x < 2.5
x = 0.10
[State 1605, Vel]
type = velset
trigger1 = vel x > 2.5
x = 2.5
[State 1605, Vel]
type = velset
trigger1 = var(0) < 18
x = 0
y = 0
[State 1605, Bind]
type = bindtoroot
trigger1 = var(0) < 18
pos = 46, -75

[State 1605, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
[State 1605, Angle]
type = angleadd
trigger1 = 1
value = 4
[State 1605, Angle]
type = angledraw
trigger1 = 1

[State 1605, End]
type = changestate
trigger1 = root, movetype = H
trigger1 = (root, stateno != [120, 155]) && (root, stateno != [700, 702])
value = 1606

[State 1605, End]
type = changestate
;trigger1 = var(0) >= ifelse(var(10) = 3, 121, ifelse(var(10) = 2, 95, 68))
trigger1 = var(0) >= ifelse(var(10) = 3, 120, ifelse(var(10) = 2, 84, 48))
value = 1610


;--- CANCELLED ---
[Statedef 1606]
type = A
physics = N
movetype = I
velset = 0.66 * vel x, 0
ctrl = 0
sprpriority = 4

[State 1606, Anim]
type = changeanim
trigger1 = anim != 1605
value = 1605

[State 1606, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 1606, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256

[State 1606, Fade]
type = palfx
trigger1 = !time
time = 20
sinadd = -255, -255, -255, 80

[State 1605, Angle]
type = angleadd
trigger1 = 1
value = 6

[State 1606, Shrink]
type = angledraw
trigger1 = 1
scale = 1 -(time * 0.05), 1 -(time * 0.05)

[State 1606, End]
type = destroyself
trigger1 = time >= 20


;--- BURSTING ---
[Statedef 1610]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 1610, Hit Number]
type = varadd
trigger1 = 1
var(2) = 1
persistent = 0
ignorehitpause = 1

[State 1610, hitoverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = ifelse((var(2) < 3), 1610, 1612)
ignorehitpause = 1

[State 1610, HB]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 1610, ProjContact]
type = varset
trigger1 = movecontact = 1 && numenemy
trigger1 = (enemynear, movetype = H) && !(enemynear, time)
var(18) = 1
ignorehitpause = 1
[State 1610, ProjContact]
type = parentvarset
trigger1 = movecontact = 1 && numenemy
trigger1 = (enemynear, movetype = H) && !(enemynear, time)
trigger1 = root, stateno = 1600
var(18) = 1
ignorehitpause = 1

[State 1610, Time Var]
type = varadd
trigger1 = time
var(1) = 1
[State 1610, Anim]
type = changeanim
trigger1 = anim != 1610
value = 1610

[State 1610, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
[State 1610, Angle]
type = angleadd
trigger1 = 1
value = 4
[State 1610, Angle]
type = angledraw
trigger1 = 1
[State 1610, Shrink]
type = angledraw
trigger1 = var(1) < 5
scale = (0.4 + 0.12 * var(1)), (0.4 + 0.12 * var(1))
[State 1610, Vel]
type = velset
trigger1 = 1
x = 0
y = 0

[State 1610, Snd]
type = playsnd
trigger1 = !time && prevstateno = 1605
value = 5, 12
[State 1610, Dust]
type = explod
trigger1 = !time && prevstateno = 1605
anim = 7102
sprpriority = -5
postype = p1
pos = 0, -ceil(pos y)
scale = 0.5,.5;0.67, 0.67
pausemovetime = -1
supermovetime = -1

[State 1610, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 1610, HitSound]
type = playsnd
trigger1 = movecontact = 1
value = 2, ifelse((movehit && numtarget), 7, 0)
channel = 2
ignorehitpause = 1

[State 1610, Hit]
type = hitdef
trigger1 = var(1) = 0 || var(1) = 6 || var(1) = 12
priority = 4, Hit
attr = S, SP
damage = ceil(28 * root, fvar(11)), 7
guard.dist = const(size.proj.attack.dist)
animtype = Hard
fall.animtype = Hard
hitflag = MAFD
guardflag = MA
pausetime = 0, 12
sparkno = -1
guard.sparkno = -1
sparkxy = -10, 0
guardsound = -1
ground.type = High
ground.slidetime = 18
ground.hittime = 18
ground.velocity = ifelse(p2dist x < 0, 10.52, -10.52), 0
ground.cornerpush.veloff = 0
air.type = Low
air.velocity = ifelse(p2dist x < 0, 2, -2), -8
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
p2facing = ifelse(p2dist x < 0, -1, 1)
forcestand = 1
yaccel = 0.4850

[State 1610, Getpower]
type = poweradd
trigger1 = !(root, var(20))
trigger1 = movecontact = 1
trigger1 = numtarget
value = ifelse(movehit && !prevstateno, 50, 25)
ignorehitpause = 1

[State 1610, Underground Juggle Prevention]
type = targetbind
trigger1 = movecontact = 1
trigger1 = numtarget && numenemy
trigger1 = (target, time = 0) && (target, ID = enemynear, ID)
trigger1 = !(target, hitshakeover) && (target, pos y > 0)
pos = ceil(p2dist x), ceil(-pos y)
ignorehitpause = 1

[State 1610, Spark]
type = helper
trigger1 = root, fvar(31)
trigger1 = movecontact = 1 && numtarget
trigger1 = (target, movetype = H) && !(target, time)
helpertype = normal
stateno = ifelse(moveguarded, 8001, 8013)
ID = 8000
name = "Spark"
postype = p1
pos = ceil(p2dist x / 2.0), ceil((p2dist y + pos y) / 2.0)
facing = 1
ownpal = 1
size.xscale = 1
size.yscale = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State 1610, Spark]
type = explod
trigger1 = !(root, fvar(31))
trigger1 = movecontact = 1 && numtarget
trigger1 = (target, movetype = H) && !(target, time)
anim = Fifelse(moveguarded, 40, 2)
ID = 8000
postype = p1
pos = ceil(p2dist x / 2.0), ceil((p2dist y + pos y) / 2.0)
supermovetime = -1
pausemovetime = -1
ontop = 1
ownpal = 1

[State 1610, Counter FX]
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

[State 1610, Stun System - Add]
type = parentvaradd
trigger1 = movehit = 1
trigger1 = numtarget
trigger1 = target, gethitvar(damage) > 0
trigger1 = root, var(42) >= 0
trigger1 = root, var(20) <= 0
var(42) = ceil(50 * root, fvar(11))
ignorehitpause = 1

[State 1610, Stun System - Dizzy]
type = targetstate
trigger1 = movehit = 1
trigger1 = numenemy = 1 && numpartner = 0
trigger1 = roundstate = 2 && numtarget
trigger1 = target, gethitvar(damage) < target, life
trigger1 = root, var(42) >= (target, const(data.life))
value = 1115310
ignorehitpause = 1

[State 1610, Underground Juggle Prevention]
type = targetbind
trigger1 = movecontact = 1
trigger1 = numtarget = 1 && numenemy
trigger1 = target, time <= 0
trigger1 = target, ID = enemynear, ID
trigger1 = !(target, hitshakeover) && (target, pos y > 0)
pos = ceil(p2dist x), ceil(-pos y)
ignorehitpause = 1

[State 1610, End]
type = changestate
trigger1 = movecontact
value = ifelse(var(2) < 3, 1610, 1612)
ignorehitpause = 1

[State 1610, End]
type = changestate
trigger1 = var(1) >= 30
value = 1612


[Statedef 1612]
type = A
physics = N
movetype = I
anim = 1612
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 1612, Trade Sound]
type = playsnd
trigger1 = !time
trigger1 = prevstateno = [5000, 5999]
value = 2, 0
channel = 2
lowpriority = 1
volumescale = 50

[State 1612, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 1612, Angle]
type = angleadd
trigger1 = 1
value = 4

[State 1612, Angle]
type = angledraw
trigger1 = 1

[State 1612, P2 Safe Fall]
type = targetstate
trigger1 = numtarget = 1
trigger1 = target, command = "recovery"
trigger1 = target, pos y >= -48 && target, vel y > 0
trigger1 = target, alive && target, hitfall && target, gethitvar(fall.recover)
trigger1 = target, stateno = 5030 || target, stateno = 5035 || target, stateno = 5050 || target, stateno = 5071
value = 1115200
ignorehitpause = 1

[State 1612, End]
type = destroyself
triggerall = !animtime
trigger1 = !numtarget
trigger2 = numtarget
trigger2 = target, time <= 1 && !(target, hitshakeover)


;========================<PSYCHO CANNON>=============================
;--- Charging ---
[Statedef 3209]
type = S
physics = N
movetype = A
anim = 3210
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 3209, Charge Var]
type = varset
trigger1 = 1
var(10) = root, var(0)

[State 3209, Max Hit Var]
type = varset
trigger1 = 1
var(4) = 3 + var(10)

[State 3209, Charge Snd]
type = playsnd
trigger1 = !time
trigger1 = !prevstateno
value = 5, 13
channel = 5

[State 3209, Angle]
type = angledraw
trigger1 = 1
scale = ifelse(var(10) >= 5, 1, 0.25 + 0.15 * var(10)), ifelse(var(10) >= 5, 1, 0.25 + 0.15 * var(10))
value = (gametime % 60) * -3

[State 3209, Anim]
type = changeanim
trigger1 = anim != 3210 && var(10) >= 5
trigger2 = anim != 3211 && (var(10) = [3, 4])
trigger3 = anim != 3212 && var(10) <= 2
value = ifelse(var(10) >= 5, 3210, ifelse(var(10) >= 3, 3211, 3212))
elem = animelemno(0)

[State 3209, hitoverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, HP, AT
stateno = 3215
slot = 0
ignorehitpause = 1

[State 3209, hitoverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, NP, SP
stateno = 3209
slot = 1
ignorehitpause = 1

[State 3209, HB]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 3209, Bind]
type = bindtoroot
trigger1 = 1
pos = 40, -62

[State 3209, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256 - 32 * (time % 3), 256
ignorehitpause = 1

[State 3210, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256 - 32 * (time % 3), 256
ignorehitpause = 1

[State 3209, HitSound]
type = playsnd
trigger1 = movecontact = 1
value = 2, ifelse((movehit && numtarget), 7, 0)
channel = 2
ignorehitpause = 1

[State 3209, Miss]
type = hitdef
trigger1 = 1
attr = S, HP
hitflag =
sparkxy = -10, 0

[State 3209, Hit]
type = hitdef
trigger1 = root, var(15) < 8
trigger1 = !((movecontact + movereversed) % 4)
priority = 1, Hit; Absorb rather than trade
attr = S, HP
damage = ceil(7 * root, fvar(11)), 7
guard.dist = const(size.proj.attack.dist)
animtype = Hard
hitflag = MAF
guardflag = M
pausetime = 0, 12
sparkno = -1
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10, 0
guardsound = -1
ground.type = High
ground.slidetime = 18
ground.hittime = 18
ground.velocity = -2.5, -10
ground.cornerpush.veloff = 0
guard.velocity = -10.52
air.velocity = -2.5, -10
fall = 1
air.fall = 1
fall.recover = 0
getpower = 0, 0
givepower = 40, 40
envshake.time = 12
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.freq = 180
sprpriority = 4
yaccel = 0.4850
p2facing = ifelse((p2stateno != [5020, 5119]) && p2statetype != L, 1, 0)
forcestand = 1
kill = 0
guard.kill = 0
ID = 3209
nochainID = 3209

[State 3209, Spark]
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

[State 3209, Spark]
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

[State 3209, Counter FX]
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

[State 3209, End]
type = changestate
trigger1 = root, stateno = 3202
trigger1 = root, animelemtime(3) >= 0
value = 3210

[State 3209, End]
type = changestate
trigger1 = root, stateno != [3201, 3202]
trigger2 = root, movetype = H
value = 3215


;--- Advancing ---
[Statedef 3210]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 3210, Charge Snd]
type = stopsnd
trigger1 = !time
channel = 5

[State 3210, Shadows]
type = afterimage
trigger1 = !time && prevstateno = 3209
time = 300
timegap = 1
framegap = 5
length = 15
paladd = 0, 0, 0
palmul = 0.75, 0.75, 0.75
palcontrast = 128, 128, 128
palpostbright = 0, 0, 0
trans = add

[State 3210, Hit Number]
type = varadd
trigger1 = 1
var(2) = 1
persistent = 0
ignorehitpause = 1

[State 3210, hitoverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = ifelse(var(2) < var(4), 3210, 3215)
ignorehitpause = 1

[State 3210, HB]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 3210, Anim]
type = changeanim
trigger1 = !time && !prevstateno
value = 3210

[State 3210, ProjContact]
type = varset
trigger1 = movecontact = 1 && numenemy
trigger1 = (enemynear, movetype = H) && !(enemynear, time)
var(18) = 1
ignorehitpause = 1
[State 3210, ProjContact]
type = parentvarset
trigger1 = movecontact = 1 && numenemy
trigger1 = (enemynear, movetype = H) && !(enemynear, time)
trigger1 = root, stateno = 3202
var(18) = 1
ignorehitpause = 1

[State 3210, Vel]
type = velset
trigger1 = 1
x = 5 + (1.0 * var(10))

[State 3210, Angle]
type = angledraw
trigger1 = 1
scale = ifelse(var(10) >= 5, 1, 0.5 + 0.1 * var(10)), ifelse(var(10) >= 5, 1, 0.5 + 0.1 * var(10))
value = (gametime % 60) * -6

[State 3210, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256 - 32 * (time % 3), 256
ignorehitpause = 1

[State 3210, HitSound]
type = playsnd
trigger1 = movecontact = 1
value = 2, ifelse((movehit && numtarget), 7, 0)
channel = 2
ignorehitpause = 1

[State 3210, Freeze]
type = posfreeze
trigger1 = time <= ifelse(numtarget, 4, 0)
value = 1

[State 3210, Miss]
type = hitdef
trigger1 = 1
attr = S, HP
hitflag =
sparkxy = -10, 0

[State 3210, Hit Grounded]
type = hitdef
trigger1 = root, var(15) < 8
trigger1 = time >= ifelse(numtarget, 4, 0)
trigger1 = (var(2) < var(4)) && (var(2) % 2)
priority = 4, Hit
attr = S, HP
damage = ceil(50 * root, fvar(11)), 7
guard.dist = const(size.proj.attack.dist)
animtype = Hard
hitflag = MAF
guardflag = M
pausetime = 0, 12
sparkno = -1
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10, 0
guardsound = -1
ground.type = Low
ground.slidetime = 18
ground.hittime = 18
ground.velocity = -10.52, 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
air.velocity = -4, -6
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
p2facing = ifelse((p2stateno != [5020, 5119]) && p2statetype != L, 1, 0)
forcestand = 1

[State 3210, Hit Grounded]
type = hitdef
trigger1 = root, var(15) < 8
trigger1 = time >= (prevstateno = 3210) * 4
trigger1 = (var(2) < var(4)) && !(var(2) % 2)
priority = 4, Hit
attr = S, HP
damage = ceil(50 * root, fvar(11)), 7
guard.dist = const(size.proj.attack.dist)
animtype = Hard
hitflag = MAF
guardflag = M
pausetime = 0, 12
sparkno = -1
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10, 0
guardsound = -1
ground.type = High
ground.slidetime = 18
ground.hittime = 18
ground.velocity = -10.52, 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
air.velocity = -4, -6
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
p2facing = ifelse((p2stateno != [5020, 5119]) && p2statetype != L, 1, 0)
forcestand = 1

[State 3210, Hit Final]
type = hitdef
trigger1 = root, var(15) < (5 + var(2))
trigger1 = time >= (prevstateno = 3210) * 4
trigger1 = var(2) >= var(4)
priority = 4, Hit
attr = S, HP
damage = ceil(50 * root, fvar(11)), 7
guard.dist = const(size.proj.attack.dist)
animtype = Hard
hitflag = MAF
guardflag = M
pausetime = 0, 12
sparkno = -1
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10, 0
guardsound = -1
ground.type = High
ground.slidetime = 18
ground.hittime = 18
ground.velocity = -4, -6
ground.cornerpush.veloff = 0
guard.velocity = -10.52
air.velocity = -4, -6
fall = 1
air.fall = 1
fall.recover = 0
getpower = 0, 0
givepower = 40, 40
envshake.time = 12
envshake.ampl = ifelse((gametime % 2), -2, 2)
envshake.freq = 180
sprpriority = 4
yaccel = 0.4850
p2facing = ifelse((p2stateno != [5020, 5119]) && p2statetype != L, 1, 0)
forcestand = 1

[State 3210, Spark]
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

[State 3210, Spark]
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

[State 3210, Counter FX]
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

[State 3210, Underground Juggle Prevention]
type = targetbind
trigger1 = movecontact = 1
trigger1 = numtarget = 1 && numenemy
trigger1 = target, time <= 0
trigger1 = target, ID = enemynear, ID
trigger1 = !(target, hitshakeover) && (target, pos y > 0)
pos = ceil(p2dist x), ceil(-pos y)
ignorehitpause = 1

[State 3210, End]
type = changestate
trigger1 = movecontact
value = ifelse(var(2) < var(4), 3210, 3215)

[State 3210, End]
type = changestate
trigger1 = vel y > 0 && pos y >= 0
value = 3215

[State 3210, End]
type = destroyself
trigger1 = frontedgedist < -120 || backedgedist < -120


;--- Disappear ---
[Statedef 3215]
type = A
physics = N
movetype = I
anim = 3215
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 3215, Trade Sound]
type = playsnd
trigger1 = !time
trigger1 = prevstateno = [5000, 5999]
value = 2, 0
channel = 2
lowpriority = 1
volumescale = 50

[State 3215, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3215, End]
type = destroyself
triggerall = !animtime
trigger1 = !numtarget
trigger2 = numtarget
trigger2 = target, time <= 1 && !(target, hitshakeover)


;========================<FINAL PSYCHO CRUSHER CAMERA>=============================
[Statedef 4090]
type = S
physics = N
movetype = A
anim = 4090
ctrl = 0
velset = 0, 0

[State 4090, hitoverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 4090
slot = 0
ignorehitpause = 1

[State 4090, HB]
type = nothitby
trigger1 = 1
time = -1
value = SCA
ignorehitpause = 1

[State 4090, Bind]
type = posset
trigger1 = 1
x = 0
y = 0

[State 4090, Bind]
type = turn
trigger1 = facing != (root, facing)

[State 4090, Hit]
type = hitdef
trigger1 = !time
attr = A, HA
hitflag = MAFD
priority = 1, Miss
getpower = 0, 0
givepower = 0, 0
sparkno = -1
guard.sparkno = -1
hitsound = -1
guardsound = -1
numhits = 0
p2stateno = 4096

[State 4090, Hit]
type = hitdef
trigger1 = !time
trigger1 = p2stateno = [0, 155]
attr = A, HA
hitflag = MAFD
priority = 1, Miss
getpower = 0, 0
givepower = 0, 0
sparkno = -1
guard.sparkno = -1
hitsound = -1
guardsound = -1
numhits = 0
p2stateno = 4095

[State 4090, Screen]
type = screenbound
trigger1 = 1
value = (numtarget < numenemy)
movecamera = 1, 1

[State 4090, Screen]
type = posset
trigger1 = 1
x = (root, pos x) * 0.75

[State 4090, BG PalFX]
type = bgpalfx
trigger1 = root, stateno = 4000
trigger1 = root, time >= 70
time = 1
mul = 128, 128, 128

[State 4090, End]
type = destroyself
trigger1 = root, stateno != 4000
trigger2 = time >= 120


;--- Target can block ---
[Statedef 4095]
type = U
physics = N
movetype = H

[State 4095, Bind]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 0

[State 4095, End]
type = selfstate
trigger1 = AIlevel
trigger1 = time >= 1
trigger1 = anim = [120, 155]
value = ifelse(statetype = A, 132, ifelse(statetype = C, 131, 130))
ctrl = 1

[State 4095, End]
type = selfstate
trigger1 = time >= 1
value = ifelse(statetype = A, 50, ifelse(statetype = C, 11, 0))
ctrl = 1


;--- Target is screwed ---
[Statedef 4096]
type = U
physics = N
movetype = H

[State 4096, NHB]
type = nothitby
trigger1 = statetype = L
time = 1
value = SCA

[State 4096, Bind]
type = screenbound
trigger1 = time < 1
value = 0
movecamera = 0, 0

[State 4096, Freeze]
type = posfreeze
trigger1 = 1
value = 1

[State 4096, Freeze]
type = changeanim
trigger1 = 1
value = anim
elem = animelemno(-1)

[State 4096, End]
type = changestate
trigger1 = time >= 1
trigger1 = statetype = L
value = 4097

[State 4096, End]
type = selfstate
trigger1 = time >= 20
value = ifelse(statetype = A, 50, ifelse(statetype = C, 11, 0))
ctrl = 1


;--- No OTG ---
[Statedef 4097]
type = L
movetype= H
physics = C
anim = 5110
velset = 0, 0

[State 4097, NHB]
type = nothitby
trigger1 = 1
value = SCA

[State 4097, Pos]
type = PosSet
trigger1 = Time = 0
y = 0

[State 4097, End]
type = selfstate
trigger1 = alive
trigger1 = time >= 30
value = ifelse(alive, 5120, 5150)


;========================<PSYCHO POWER>=============================
[Statedef 6000]
physics = N
anim = 9999
sprpriority = 2
ctrl = 0

[State 6000, Bind]
type = bindtoroot
trigger1 = 1

[State 6000, Turn]
type = turn
trigger1 = facing != (root, facing)

[State 6000, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 6000, Move Var]
type = varset
trigger1 = !time
var(0) = (root, stateno)
[State 6000, Move Var]
type = varset
trigger1 = !time
var(1) = (root, anim)

[State 6000, Anim]
type = changeanim
trigger1 = (root, stateno = [200, 270]) && (root, anim = [200, 271])
trigger1 = selfanimexist((root, anim) + 5800)
value = (root, anim) + 5800
elem = root, animelemno(0)

[State 6000, Anim]
type = changeanim
trigger1 = root, stateno = 200 && root, anim = 200
value = 6000
elem = root, animelemno(0)

[State 6000, Anim]
type = changeanim
trigger1 = root, stateno = 200 && root, anim = 201
value = 6001
elem = root, animelemno(0)

[State 6000, Anim]
type = changeanim
trigger1 = root, stateno = 210 && root, anim = 210
value = 6005
elem = root, animelemno(0)

[State 6000, Anim]
type = changeanim
trigger1 = root, stateno = 210 && root, anim = 211
value = 6006
elem = root, animelemno(0)

[State 6000, Anim]
type = changeanim
trigger1 = root, stateno = 220 && root, anim = 220
value = 6010
elem = root, animelemno(0)

[State 6000, Anim]
type = changeanim
trigger1 = root, stateno = 220 && root, anim = 221
value = 6011
elem = root, animelemno(0)

[State 6000, Anim]
type = changeanim
trigger1 = root, stateno = 400 && root, anim = 400
value = 6030
elem = root, animelemno(0)

[State 6000, Anim]
type = changeanim
trigger1 = root, stateno = 410 && root, anim = 410
value = 6035
elem = root, animelemno(0)

[State 6000, Anim]
type = changeanim
trigger1 = root, stateno = 420 && root, anim = 420
value = 6040
elem = root, animelemno(0)

[State 6000, Anim]
type = changeanim
trigger1 = root, stateno = 600 && root, anim = 600
value = 6060
elem = root, animelemno(0)

[State 6000, Anim]
type = changeanim
trigger1 = root, stateno = 600 && root, anim = 601
value = 6061
elem = root, animelemno(0)

[State 6000, Anim]
type = changeanim
trigger1 = root, stateno = 610 && root, anim = 610
value = 6065
elem = root, animelemno(0)

[State 6000, Anim]
type = changeanim
trigger1 = root, stateno = 615 && root, anim = 615
value = 6066
elem = root, animelemno(0)

[State 6000, Anim]
type = changeanim
trigger1 = root, stateno = 620 && root, anim = 620
value = 6070
elem = root, animelemno(0)

[State 6000, Anim]
type = changeanim
trigger1 = root, stateno = 620 && root, anim = 621
value = 6071
elem = root, animelemno(0)

[State 6000, Anim]
type = changeanim
trigger1 = root, stateno = 1205 && root, anim = 1205
value = 1206
elem = root, animelemno(0)

[State 6000, Anim]
type = changeanim
trigger1 = (root, stateno = 1255) && (root, anim = 1255)
value = 1256
elem = root, animelemno(0)

[State 6000, Anim]
type = changeanim
trigger1 = (root, stateno = 1400) && (root, anim = [1400, 1402])
value = 1405
elem = root, animelemno(0)

[State 6000, Spr]
type = sprpriority
trigger1 = 1
value = 2

[State 6000, Spr]
type = sprpriority
trigger1 = anim = 6006 && animelemtime(3) < 0
value = 0

[State 6000, End]
type = destroyself
trigger1 = !animtime
trigger2 = (root, stateno) != var(0) || (root, anim) != var(1)
trigger3 = (anim != [6000, 6071]) && anim != 1206 && anim != 1256 && anim != 1405
trigger4 = root, movetype = H
trigger5 = time >= 180


;========================<PSYCHO CRUSHER>=============================
[Statedef 1005]
physics = N
anim = 1005
sprpriority = 3
ctrl = 0
[State 1005, Bind]
type = bindtoroot
trigger1 = 1
pos = 80, -60
[State 1005, Turn]
type = turn
trigger1 = facing != (root, facing)
[State 1005, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1
[State 1005, End]
type = destroyself
trigger1 = (root, stateno != 1000) || (root, anim != 1000)
trigger2 = (root, stateno = 1000) && root, animelemtime(6) < 0


;========================<HEARTBREAK DESPAIR>=============================
[Statedef 3005]
physics = N
anim = 3005
sprpriority = 3
ctrl = 0

[State 3005, Bind]
type = bindtoroot
trigger1 = (root, stateno = 3000) && (root, movetype != H)
pos = (90 -time * 3), -59

[State 3005, Turn]
type = turn
trigger1 = facing != (root, facing)

[State 3005, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3005, Angle]
type = angledraw
trigger1 = time <= 2
scale = 0.083 * (time + 1), 0.17 * (time + 1)

[State 3005, Angle]
type = angledraw
trigger1 = time >= 3
scale = (0.25 + 0.11 * (time -3)), (0.5 -0.071 * (time -3))

[State 3005, End]
type = destroyself
trigger1 = time >= 11


;========================<PSYCHO BREAK SMASHER>=============================
[Statedef 3060]
physics = N
anim = 3060
sprpriority = 3
ctrl = 0

[State 3060, Bind]
type = bindtoroot
trigger1 = anim = 3060
pos = 80, -60

[State 3060, Turn]
type = turn
trigger1 = !time
trigger1 = facing != (root, facing)

[State 3060, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256 - 32 * (time % 5), 256
ignorehitpause = 1

[State 3060, End]
type = changeanim
triggerall = anim = 3060
trigger1 = (root, stateno != 3050) || (root, anim != 3050)
trigger2 = (root, stateno = 3050) && root, animelemtime(13) < 0
value = 3061

[State 3060, End]
type = destroyself
trigger1 = anim = 3061 && !animtime


;========================<FINAL PSYCHO CRUSHER>=============================
[Statedef 4006]
physics = N
anim = 4006
sprpriority = 5
velset = -2, 0
[State 4006, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256

[State 4006, Bind]
type = bindtoroot
trigger1 = root, stateno = 4001
pos = 160 -(20 * time), -60

[State 4006, Shrink]
type = angledraw
trigger1 = 1
scale = 0.25 + (0.03125 * time), 0.5 + (0.0625 * time)

[State 4006, fadeout]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256 -(16 * time), 256

[State 4006, End]
type = destroyself
trigger1 = time >= 16


;========================<WARP FX>=============================
;--- FADE OUT ---
[Statedef 1705]
physics = N
anim = 9999
sprpriority = ifelse((parent, ishelper), 0, -2)

[State 1705, End]
type = destroyself
trigger1 = time >= 10 || root, movetype = H
trigger2 = !playerIDexist(parent, ID)

[State 1705, NHB]
type = nothitby
trigger1 = 1
time = -1
value = SCA

[State 1705, FX]
type = helper
trigger1 = !(parent, ishelper)
helpertype = normal
stateno = 1705
ID = 1705
name = "Warp FX"
postype = p1
ownpal = 1
persistent = 0

[State 1705, animvar]
type = varset
trigger1 = !time
var(0) = (root, anim)

[State 1705, animvar]
type = varset
trigger1 = !time
var(1) = (root, animelemno(0))

[State 1705, Anim]
type = changeanim
trigger1 = 1
value = var(0)
elem = var(1)

[State 1705, posvar]
type = varadd
trigger1 = var(2) < 60
var(2) = 6

[State 1705, Bind]
type = bindtoroot
trigger1 = 1
pos = ifelse((parent, ishelper), -var(2), var(2))

[State 1705, fadeout]
type = trans
trigger1 = 1
trans = addalpha
alpha = ceil(256 -25 * time), 25 * time


;--- FADE IN ---
[Statedef 1706]
physics = N
anim = 9999
sprpriority = ifelse((parent, ishelper), 0, -2)

[State 1706, End]
type = destroyself
trigger1 = time >= 10 || root, movetype = H
trigger2 = !playerIDexist(parent, ID)

[State 1706, NHB]
type = nothitby
trigger1 = 1
time = -1
value = SCA

[State 1706, FX]
type = helper
trigger1 = !(parent, ishelper)
helpertype = normal
stateno = 1706
ID = 1706
name = "Warp FX"
postype = p1
ownpal = 1
persistent = 0

[State 1706, animvar]
type = varset
trigger1 = !time
var(0) = (root, anim)

[State 1706, animvar]
type = varset
trigger1 = !time
var(1) = (root, animelemno(0))

[State 1706, Anim]
type = changeanim
trigger1 = 1
value = var(0)
elem = var(1)

[State 1706, posvar]
type = varadd
trigger1 = var(2) < 60
var(2) = 6

[State 1706, Bind]
type = bindtoroot
trigger1 = 1
pos = ifelse((parent, ishelper), -60 + var(2), 60 -var(2))

[State 1706, fadeout]
type = trans
trigger1 = 1
trans = addalpha
alpha = 25 * time, ceil(256 -25 * time)


;========================<CAPE>=============================
[Statedef 6100]
physics = N
anim = 6100
sprpriority = -1
velset = -2, -0.5
[State 6100, Accel]
type = veladd
trigger1 = 1
y = 0.1
[State 6100, fadeout]
type = trans
trigger1 = 1
trans = addalpha
alpha = ceil(256 -13 * time), 13 * time
[State 6100, End]
type = destroyself
trigger1 = time >= 20


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
pos = 0, ceil(pos y)
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
pos = -8, 0

[State 7240, Snd]
type = playsnd
trigger1 = !time
value = 7, 4
channel = 0

[State 7240, Snd]
type = playsnd
trigger1 = 1
value = 7, 6
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
vel = ((rootdist x - 20) / 32.0), ((rootdist y - 67) / 32.0)
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

[State 752, Bind]
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
type = removeexplod
trigger1 = numexplod(21) && time >= 16
ID = 21

[State 7520, Scale]
type = modifyexplod
trigger1 = numexplod(20) && time >= 32
ID = 20
postype = back
pos = 160, ifelse((gamewidth / gameheight) > 1.55, 90, 120)
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
value = 7, 5
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
trigger1 = root, var(23) = [3000, 3049]
var(0) = 2
[State 8600, Move Name]
type = varset
trigger1 = !time
trigger1 = root, var(23) = 3100
var(0) = 3
[State 8600, Move Name]
type = varset
trigger1 = !time
trigger1 = root, var(23) = 3200
var(0) = 4
[State 8600, Move Name]
type = varset
trigger1 = !time
trigger1 = root, var(23) = 3050
var(0) = 5
[State 8600, Move Name]
type = varset
trigger1 = !time
trigger1 = root, var(23) = 4001
var(0) = 6

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
trigger2 = root, stateno = 1000
trigger2 = root, movehit = 1 && root, hitpausetime = 10
trigger3 = root, stateno = 1255
trigger3 = root, movehit = 1 && root, hitpausetime = 10
trigger4 = root, stateno = 1300
trigger4 = root, movehit = [1, 2]
trigger5 = root, stateno = 1400
trigger5 = root, movehit = [1, 2]
trigger6 = root, stateno = 3000
trigger6 = root, movehit = [1, 2]
trigger7 = root, stateno = 3001
trigger7 = root, movehit = [1, 2]
trigger8 = root, stateno = 3050
trigger8 = root, movehit = [1, 2]
var(1) = 60

[State 8150, Time]
type = varset
trigger1 = root, stateno = 1400
trigger1 = root, movehit = [1, 2]
var(1) = 30

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

[State 8150, Booster]
type = posset
trigger1 = playerID(var(0)), stateno = [3020, 3021]
x = ceil(playerID(var(0)), pos x)
y = ceil(playerID(var(0)), pos y)

[State 8150, Turn]
type = turn
trigger1 = playerIDexist(var(0))
trigger1 = facing != (playerID(var(0)), facing)

[State 8150, Snd]
type = playsnd
trigger1 = playerIDexist(var(0))
trigger1 = playerID(var(0)), hitshakeover
value = 5, 14
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

[State 8970, Circle around]
type = modifyexplod
trigger1 = numexplod(4)
ID = 4
postype = p1
pos = ceil(32 * cos((gametime + 48) / 32.0 * pi)), ceil(8 * sin((gametime + 48) / 32.0 * pi))
scale = 0.375 + 0.125 * sin((gametime + 48) / 32.0 * pi), 0.375 + 0.125 * sin((gametime + 48) / 32.0 * pi)

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
trigger1 = var(1) < (-375 + ifelse((gamewidth / gameheight) > 1.67, 142, 204))
var(1) = ceil(-375 + ifelse((gamewidth / gameheight) > 1.67, 142, 204))
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
