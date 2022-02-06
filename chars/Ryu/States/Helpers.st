; ______________________________
;| Ryu by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==============================================================================================
;=======================================< HELPER STATES >========================================
;==============================================================================================

;========================< JUMP DUST >=============================
[Statedef 7100]
physics = N
velset = 0, 0
anim = 9741
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
trigger1 = time >= 7


;========================< HADOU KEN >=============================
[Statedef 1005]
type = S
physics = N
movetype = A
anim = 1005
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 1005, HitOverride]
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
[State 1005, movehitvar]
type = varset
trigger1 = movecontact && numtarget
trigger1 = !(target, ishelper)
var(3) = 1
ignorehitpause = 1

[State 1005, Vel]
type = velset
trigger1 = 1
x = ifelse(var(10) = 3, 6, ifelse(var(10) = 2, 4.5, 3))
y = 0

[State 1005, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 1005, HitSound]
type = playsnd
trigger1 = movehit && numtarget
trigger1 = target, time = 0 && target, movetype = H
value = 2, 7
persistent = 0
ignorehitpause = 1

[State 1005, Hit]
type = hitdef
trigger1 = 1
priority = 4, Hit
attr = S, SP
damage = ceil(82 * root, fvar(12)), 7
animtype = Hard
hitflag = MAF
guardflag = MA
pausetime = 0, 12 / ((root, var(20) > 0) + 1)
sparkno = -1
guard.sparkno = s7001
sparkxy = -10, 0
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -10.52, 0
ground.cornerpush.veloff = 0
air.velocity = -4, -4
air.fall = 1
fall.recover = 1
fall.recovertime = 30
getpower = ifelse(p2movetype = H, 72, 144) * !(root, var(20)), 36 * !(root, var(20))
givepower = 36, 36
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4
sprpriority = 4
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse((root, var(20)), -4, -8), -1.5
forcestand = 1

[State 1005, Miss]
type = hitdef
trigger1 = numenemy
trigger1 = (enemynear, stateno = [5070, 5071])
attr = S, SP
hitflag = 

[State 1005, Sparks]
type = explod
trigger1 = movehit && numtarget
trigger1 = (target, movetype = H) && !(target, time)
anim = 7020 + (random % 8)
ID = 7000
sprpriority = 5
postype = left
pos = ceil((target, pos x) -((target, const(size.ground.front) -10) * facing) + 160), ceil(screenpos y)
removetime = -2
ownpal = 1
facing = -1
ignorehitpause = 1
persistent = 0
pausemovetime = 100
supermovetime = 100

[State 1005, End]
type = changestate
trigger1 = movecontact
value = 1006
ignorehitpause = 1
[State 1005, End]
type = destroyself
trigger1 = pos x != [ -200, 200]

[Statedef 1006]
type = A
physics = N
movetype = I
anim = 1006
velset = 0, 0
ctrl = 0
sprpriority = 4
[State 1006, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1
[State 1006, Snd]
type = playsnd
trigger1 = !time
value = 5, 1
ignorehitpause = 1
persistent = 0
[State 1006, End]
type = destroyself
trigger1 = !animtime


;========================< EX HADOU KEN >=============================
[Statedef 1015]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 1015, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = ifelse(var(2) < 2, 1015, 1016)
ignorehitpause = 1
[State 1015, hitby]
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
trigger1 = !time && !prevstateno
value = 1015

[State 1015, hitvar]
type = varadd
trigger1 = !time
var(2) = 1
[State 1015, movehitvar]
type = varset
trigger1 = movecontact && numtarget
trigger1 = !(target, ishelper)
var(3) = 1
ignorehitpause = 1

[State 1015, Vel]
type = velset
trigger1 = 1
x = ifelse((time < 2 && var(2) > 1), 1, 7)
y = 0

[State 1015, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 1015, HitSound]
type = playsnd
trigger1 = movehit && numtarget
trigger1 = target, time = 0 && target, movetype = H
value = 2, 7
channel = 1
persistent = 0
ignorehitpause = 1

[State 1015, Hit]
type = hitdef
trigger1 = 1
priority = 4, Hit
attr = S, SP
damage = ceil(62 * root, fvar(12)), 7
animtype = Back
hitflag = MAF
guardflag = MA
pausetime = 4 * (var(2) < 2), 6
sparkno = -1
guard.sparkno = s7001
sparkxy = -10, 0
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -4, -4
ground.cornerpush.veloff = 0
air.velocity = -4, -4
fall = 1
fall.recover = 1
fall.recovertime = 22
getpower = 0
givepower = 36, 36
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4
palfx.color = 32
palfx.sinadd = 80, 25, 0, 8
palfx.mul = 512, 256, 128
palfx.time = 32
sprpriority = 4
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse((root, var(20)), -4, -8), -1.5
forcestand = 1

[State 1015, Miss]
type = hitdef
trigger1 = numenemy
trigger1 = (enemynear, stateno = [5070, 5071])
attr = S, SP
hitflag = 

[State 1015, Sparks]
type = explod
trigger1 = movehit && numtarget
trigger1 = (target, movetype = H) && !(target, time)
anim = 7020 + (random % 8)
ID = 7000
sprpriority = 5
postype = left
pos = ceil((target, pos x) -((target, const(size.ground.front) -10) * facing) + 160), ceil(screenpos y)
removetime = -2
ownpal = 1
facing = -1
ignorehitpause = 1
persistent = 0
pausemovetime = 100
supermovetime = 100

[State 1015, flames]
type = helper
trigger1 = movehit && numtarget && numhelper(7180) < 1
trigger1 = !(target, time) && (target, movetype = H)
helpertype = normal
stateno = 7180
ID = 7180
name = "flames"
postype = p2
bindtime = 1000
ownpal = 1
facing = -1
size.ground.front = 0
size.ground.back = 0
ignorehitpause = 1

[State 1015, End]
type = changestate
trigger1 = movecontact
value = ifelse(var(2) < 2, 1015, 1016)
[State 1015, End]
type = destroyself
trigger1 = pos x != [ -200, 200]

[Statedef 1016]
type = A
physics = N
movetype = I
anim = 1016
ctrl = 0
velset = 0, 0
sprpriority = 4
[State 1016, Snd]
type = playsnd
trigger1 = !time
value = 5, 1
ignorehitpause = 1
persistent = 0
[State 1016, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1
[State 1016, End]
type = destroyself
trigger1 = !animtime


;========================< SHAKUNETSU HADOU KEN >=============================
[Statedef 1025]
type = S
physics = N
movetype = A
anim = 1015
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 1025, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 1026
ignorehitpause = 1
[State 1025, HB]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 1025, Strength]
type = varset
trigger1 = !time
var(10) = root, var(10)
[State 1025, movehitvar]
type = varset
trigger1 = movecontact && numtarget
trigger1 = !(target, ishelper)
var(3) = 1
ignorehitpause = 1

[State 1025, Vel]
type = velset
trigger1 = 1
x = ifelse(var(10) = 3, 5, ifelse(var(10) = 2, 4, 3))
y = 0

[State 1025, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 1025, HitSound]
type = playsnd
trigger1 = movehit && numtarget
trigger1 = target, time = 0 && target, movetype = H
value = 2, 7
persistent = 0
ignorehitpause = 1

[State 1025, Hit]
type = hitdef
trigger1 = 1
priority = 4, Hit
attr = S, SP
damage = ceil(82 * root, fvar(12)), 7
animtype = Hard
hitflag = MAF
guardflag = MA
pausetime = (4 * (var(2) < 2)) / ((root, var(20) > 0) + 1), 6 / ((root, var(20) > 0) + 1)
sparkno = -1
guard.sparkno = s7001
sparkxy = -10, 0
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = ifelse(time <= 18, -4, -10.52), ifelse(time <= 18, -4, 0)
ground.cornerpush.veloff = 0
air.velocity = -4, -4
fall = (time <= 18)
fall.recover = 1
fall.recovertime = 22
air.fall = 1
getpower = ifelse(p2movetype = H, 72, 144) * !(root, var(20)), 36 * !(root, var(20))
givepower = 36, 36
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4
palfx.color = 32
palfx.sinadd = 80, 25, 0, 8
palfx.mul = 512, 256, 128
palfx.time = 32
sprpriority = 4
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse((root, var(20)), -4, -8), -1.5
forcestand = 1

[State 1025, Miss]
type = hitdef
trigger1 = numenemy
trigger1 = (enemynear, stateno = [5070, 5071])
attr = S, SP
hitflag = 

[State 1025, Sparks]
type = explod
trigger1 = movehit && numtarget
trigger1 = (target, movetype = H) && !(target, time)
anim = 7020 + (random % 8)
ID = 7000
sprpriority = 5
postype = left
pos = ceil((target, pos x) -((target, const(size.ground.front) -10) * facing) + 160), ceil(screenpos y)
removetime = -2
ownpal = 1
facing = -1
ignorehitpause = 1
persistent = 0
pausemovetime = 100
supermovetime = 100

[State 1025, flames]
type = helper
trigger1 = movehit && numtarget && numhelper(7180) < 1
trigger1 = !(target, time) && (target, movetype = H) && !var(16)
helpertype = normal
stateno = 7180
ID = 7180
name = "flames"
postype = p2
bindtime = 1000
ownpal = 1
facing = -1
size.ground.front = 0
size.ground.back = 0
ignorehitpause = 1

[State 1025, End]
type = changestate
trigger1 = movecontact
value = 1026
ignorehitpause = 1
[State 1025, End]
type = destroyself
trigger1 = pos x != [ -200, 200]

[Statedef 1026]
type = A
physics = N
movetype = I
anim = 1016
velset = 0, 0
ctrl = 0
sprpriority = 4
[State 1026, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1
[State 1026, Snd]
type = playsnd
trigger1 = !time
value = 5, 1
ignorehitpause = 1
persistent = 0
[State 1026, End]
type = destroyself
trigger1 = !animtime


;========================< SHINKUU HADOU KEN >=============================
[Statedef 3005]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 3005, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = ifelse(var(2) < 5, 3005, 3006)
ignorehitpause = 1
[State 3005, hitby]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 3005, Strength]
type = varset
trigger1 = !time && !prevstateno
var(10) = 5
[State 3005, Anim]
type = changeanim
trigger1 = !time && !prevstateno
value = 3005

[State 3005, hitvar]
type = varadd
trigger1 = !time
var(2) = 1
[State 3005, movehitvar]
type = varset
trigger1 = movecontact && numtarget
trigger1 = !(target, ishelper)
var(3) = 1
ignorehitpause = 1

[State 3005, Vel]
type = velset
trigger1 = 1
x = ifelse((time < 2 && var(2) > 1), 1, 9)
y = 0

[State 3005, shield]
type = helper
trigger1 = (root, var(1) != 2) && !numhelper(3008)
helpertype = normal
stateno = 3008
ID = 3008
name = "Shinkuu Shield"
postype = p1
ownpal = 1

[State 3005, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3005, HitSound]
type = playsnd
trigger1 = movehit && numtarget
trigger1 = target, time = 0 && target, movetype = H
value = 2, 7
channel = 1
persistent = 0
ignorehitpause = 1

[State 3005, Hit]
type = hitdef
trigger1 = root, var(1) = 1
priority = 4, Hit
attr = S, HP
damage = ceil(36 * root, fvar(12)), 8
animtype = Back
hitflag = MAF
guardflag = M
pausetime = 4 * (var(2) < 5), 8
sparkno = -1
guard.sparkno = s7001
sparkxy = -10, 0
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = ifelse(var(2) < 5, -10.52, -6), ifelse(var(2) < 5, 0, -4)
guard.velocity = -10.52
ground.cornerpush.veloff = 0
air.velocity = -6, -4
fall = (var(2) >= 5)
air.fall = 1
fall.recover = 0
getpower = 0
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
sprpriority = 4
yaccel = 0.5
forcestand = 1

[State 3005, Hit]
type = hitdef
trigger1 = root, var(1) != 1
priority = 4, Hit
attr = S, HP
damage = ceil(36 * root, fvar(12)), 8
animtype = Back
hitflag = MAF
guardflag = M
pausetime = 4 * (var(2) < 5), 8
sparkno = -1
guard.sparkno = s7001
sparkxy = -10, 0
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = ifelse(var(2) < 5, -10.52, -6), ifelse(var(2) < 5, 0, -6)
guard.velocity = -10.52
ground.cornerpush.veloff = 0
air.velocity = -6, -6
fall = (var(2) >= 5)
air.fall = 1
fall.recover = 0
getpower = 0
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
palfx.sinadd = 64, 64, 64, 4
palfx.mul = 128, 128, 128
palfx.time = 32
sprpriority = 4
yaccel = 0.5
forcestand = 1

[State 3005, Miss]
type = hitdef
trigger1 = numenemy && (root, var(1) <= 1)
trigger1 = (enemynear, stateno = [5070, 5071])
attr = S, HP
hitflag = 

[State 3005, Sparks]
type = explod
trigger1 = movehit && numtarget
trigger1 = (target, movetype = H) && !(target, time)
anim = 7030 + (random % 8)
ID = 7000
sprpriority = 5
postype = left
pos = ceil((target, pos x) -(target, const(size.ground.front) -10) * facing + 160), ceil(screenpos y)
removetime = -2
ownpal = 1
facing = -1
ignorehitpause = 1
persistent = 0
pausemovetime = 100
supermovetime = 100

[State 3005, flames]
type = helper
trigger1 = movehit && numtarget && numhelper(7181) < 1 && (root, var(1) != 1)
trigger1 = !(target, time) && (target, movetype = H) && !var(16)
helpertype = normal
stateno = 7181
ID = 7181
name = "flames"
postype = p2
bindtime = 1000
ownpal = 1
facing = -1
size.ground.front = 0
size.ground.back = 0
ignorehitpause = 1

[State 3005, End]
type = changestate
trigger1 = movecontact
value = ifelse(var(2) < 5, 3005, 3006)
[State 3005, End]
type = destroyself
trigger1 = pos x != [ -240, 240]

[Statedef 3006]
type = A
physics = N
movetype = I
anim = 3006
ctrl = 0
velset = 0, 0
sprpriority = 4
[State 3006, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1
[State 3006, Snd]
type = playsnd
trigger1 = !time
value = 5, 1
ignorehitpause = 1
persistent = 0
[State 3006, End]
type = destroyself
trigger1 = !animtime


;========================< SHINKUU SHIELD >=============================
[Statedef 3008]
type = A
physics = N
movetype = A
anim = 3008
ctrl = 0
velset = 8, 0
sprpriority = 3
[State 3008, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1
[State 3008, Bind]
type = varset
trigger1 = !time
var(0) = parent, ID
[State 3008, Bind]
type = bindtoparent
trigger1 = playerIDexist(var(0))
pos = 10, 0
time = 1
[State 3008, Turn]
type = turn
trigger1 = playerIDexist(var(0))
trigger1 = (facing != parent, facing)
[State 3008, End]
type = destroyself
trigger1 = !playerIDexist(var(0))
trigger2 = playerIDexist(var(0))
trigger2 = parent, stateno != 3005


;========================< DENJIN HADOU KEN >=============================
[Statedef 3025]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 3025, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = ifelse(var(2) < var(4), 3025, 3026)
ignorehitpause = 1
[State 3025, hitby]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1
[State 3025, Anim]
type = changeanim
trigger1 = !time && !prevstateno
value = 3025

[State 3025, Strength]
type = varset
trigger1 = !time && !prevstateno
var(10) = ifelse(root, var(35) >= 200, 4, ifelse(root, var(35) >= 120, 3, ifelse(root, var(35) >= 60, 2, ifelse(root, var(35) >= 20, 1, 0))))

[State 3025, hitvar]
type = varadd
trigger1 = !time
var(2) = 1
[State 3025, maxhitvar]
type = varadd
trigger1 = !time && !prevstateno
var(4) = 1 + var(10)

[State 3025, movehitvar]
type = varset
trigger1 = movecontact && numtarget
trigger1 = !(target, ishelper)
var(3) = 1
ignorehitpause = 1

[State 3025, Vel]
type = velset
trigger1 = 1
x = ifelse((time < 2 && var(2) > 1), 0.5, 4 + 1.5 * var(10))
y = 0

[State 3025, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3025, particles]
type = explod
trigger1 = 1
vel = -.5 -(random / 1000.0), 0
accel = 0, 0.075
anim = 3031
sprpriority = 3
postype = p1
pos = -25, 0
random = 70, 30
facing = -1 + (random < 500) * 2
vfacing = -1 + (random < 500) * 2
scale = 0.5, 0.5
ownpal = 1
ignorehitpause = 1
[State 3025, particles]
type = explod
trigger1 = var(4) = 5
vel = -.5 -(random / 1000.0), 0
accel = 0, 0.075
anim = 3031
sprpriority = 3
postype = p1
pos = -25, 0
random = 70, 30
facing = -1 + (random < 500) * 2
vfacing = -1 + (random < 500) * 2
scale = 0.5, 0.5
ownpal = 1
ignorehitpause = 1

[State 3025, HitSound]
type = playsnd
trigger1 = movehit && numtarget
trigger1 = target, time = 0 && target, movetype = H
value = 2, 7
channel = 1
persistent = 0
ignorehitpause = 1
[State 3025, HitSound]
type = playsnd
trigger1 = movehit && numtarget
trigger1 = target, time = 0 && target, movetype = H
value = 5, 5
channel = 2
persistent = 0
ignorehitpause = 1

[State 3025, Hit]
type = hitdef
trigger1 = 1
priority = 4, Hit
attr = S, HP
damage = ceil(48 * root, fvar(12)), 7
animtype = Hard
hitflag = MAF
pausetime = 4 * (var(2) < var(4)), 12
sparkno = -1
guard.sparkno = s7001
sparkxy = -10, 0
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -6, 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
air.velocity = -5, -2
fall = 0
air.fall = 1
fall.recover = 0
getpower = 0
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
palfx.color = 32
palfx.sinadd = 10, 30, 60, 8
palfx.mul = 128, 256, 512
palfx.time = 32
sprpriority = 4
yaccel = 0.5
ID = 3025
forcestand = 1

[State 3025, Miss]
type = hitdef
trigger1 = numenemy && (root, var(1) <= 1)
trigger1 = (enemynear, stateno = [5070, 5071])
attr = S, HP
hitflag = 

[State 3025, p2state]
type = targetstate
trigger1 = movehit && numtarget(3025)
trigger1 = target(3025), gethitvar(hitcount) >= 2
trigger1 = (target(3025), stateno = 5000) || (target(3025), stateno = 5010) || (target(3025), stateno = 5020)
value = 7696
ID = 3025
ignorehitpause = 1

[State -2, Debug]
type = displaytoclipboard
trigger1 = 1
text = "AI = %d"
params = hitcount

[State 3025, Sparks]
type = explod
trigger1 = movehit && numtarget
trigger1 = (target, movetype = H) && !(target, time)
anim = 7030 + (random % 8)
ID = 7000
sprpriority = 5
postype = left
pos = ceil((target, pos x) -((target, const(size.ground.front) -10) * facing) + 160), ceil(screenpos y)
removetime = -2
ownpal = 1
facing = -1
ignorehitpause = 1
persistent = 0
pausemovetime = 100
supermovetime = 100

[State 3025, dizzyfx]
type = helper
trigger1 = movehit && numtarget && numhelper(3033) < 1
trigger1 = !(target, time) && (target, movetype = H)
helpertype = normal
stateno = 3033
ID = 3033
name = "Dizzy FX"
postype = p2
ownpal = 1
facing = -1
size.ground.front = 0
size.ground.back = 0
ignorehitpause = 1
persistent = 0

[State 3025, End]
type = changestate
trigger1 = movecontact
value = ifelse(var(2) < var(4), 3025, 3026)
[State 3025, End]
type = destroyself
trigger1 = pos x != [ -220, 220]

[Statedef 3026]
type = A
physics = N
movetype = I
anim = 3026
ctrl = 0
velset = 0, 0
sprpriority = 4
[State 3026, Snd]
type = playsnd
trigger1 = !time
value = 5, 1
ignorehitpause = 1
persistent = 0
[State 3026, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3026, End]
type = destroyself
trigger1 = !animtime


;========================< METSU HADOU KEN >=============================
[Statedef 3045]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 3045, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = ifelse(var(2) < var(4), 3045, 3046)
ignorehitpause = 1
[State 3045, hitby]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1
[State 3045, Anim]
type = changeanim
trigger1 = !time && !prevstateno
value = 3045

[State 3045, Strength]
type = varset
trigger1 = !time && !prevstateno
var(10) = floor(root, var(36) / 40)
[State 3045, hitvar]
type = varadd
trigger1 = !time
var(2) = 1
[State 3045, maxhitvar]
type = varadd
trigger1 = !time && !prevstateno
var(4) = 2 + var(10)

[State 3045, movehitvar]
type = varset
trigger1 = movecontact && numtarget
trigger1 = !(target, ishelper)
var(3) = 1
ignorehitpause = 1

[State 3045, Vel]
type = velset
trigger1 = 1
x = ifelse((time < 2 && var(2) > 1), 0.5, 6 + 2 * var(10))
y = 0

[State 3045, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3045, HitSound]
type = playsnd
trigger1 = movehit && numtarget
trigger1 = target, time = 0 && target, movetype = H
value = 2, 7
channel = 1
persistent = 0
ignorehitpause = 1

[State 3045, Hit]
type = hitdef
trigger1 = 1
priority = 4, Hit
attr = S, HP
damage = ceil(68 * root, fvar(12)), 7
animtype = Hard
fall.animtype = Hard
hitflag = MAF
pausetime = 6 * (var(2) < var(4)), 8
sparkno = -1
guard.sparkno = s7001
sparkxy = -10, 0
guardsound = s2, 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -6, 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
air.velocity = -5, -2
fall = 1
fall.recover = 0
getpower = 0
givepower = 36, 36
envshake.time = 16
envshake.freq = 120
envshake.ampl = 6
palfx.color = 0
palfx.sinadd = 64, 0, 0, 4
palfx.mul = 256, 0, 0
palfx.time = 48
sprpriority = 4
yaccel = 0.5
ID = 3045
forcestand = 1

[State 3045, Miss]
type = hitdef
trigger1 = numenemy && (root, var(1) <= 1)
trigger1 = (enemynear, stateno = [5070, 5071])
attr = S, HP
hitflag = 

[State 3045, p2state]
type = targetstate
trigger1 = movehit && numtarget(3045)
trigger1 = target(3045), gethitvar(hitcount) >= 2
trigger1 = (target(3045), stateno = 5000) || (target(3045), stateno = 5010) || (target(3045), stateno = 5020)
value = 1113045
ID = 3045
ignorehitpause = 1

[State 3045, Sparks]
type = explod
trigger1 = movehit && numtarget
trigger1 = (target, movetype = H) && !(target, time)
anim = 7030 + (random % 8)
ID = 7000
sprpriority = 5
postype = left
pos = ceil((target, pos x) -((target, const(size.ground.front) -10) * facing) + 160), ceil(screenpos y)
removetime = -2
ownpal = 1
facing = -1
ignorehitpause = 1
persistent = 0
pausemovetime = 100
supermovetime = 100

[State 3045, dizzyfx]
type = helper
trigger1 = movehit && numtarget && numhelper(3033) < 1
trigger1 = !(target, time) && (target, movetype = H)
helpertype = normal
stateno = 3033
ID = 3033
name = "Dizzy FX"
postype = p2
ownpal = 1
facing = -1
size.ground.front = 0
size.ground.back = 0
ignorehitpause = 1

[State 3045, End]
type = changestate
trigger1 = movecontact
value = ifelse(var(2) < var(4), 3045, 3046)
[State 3045, End]
type = destroyself
trigger1 = pos x != [ -260, 260]

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
[State 3046, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1
[State 3046, End]
type = destroyself
trigger1 = !animtime


;========================< RYUU KOKU HADOU KEN >=============================
[Statedef 3055]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 3055, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 3055
ignorehitpause = 1
[State 3055, hitby]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 3055, Assert]
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

[State 3055, movehitvar]
type = varset
trigger1 = movecontact && numtarget
trigger1 = !(target, ishelper)
var(3) = 1
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
trigger1 = movehit && numtarget
trigger1 = !(target, time) && target, movetype = H
value = 2, 7
channel = 1
ignorehitpause = 1

[State 3055, Hit]
type = hitdef
triggerall = animelemno(0) != var(4)
trigger1 = animelem = 1 || animelem = 3 || animelem = 5 || animelem = 7 || animelem = 9 || animelem = 11
trigger2 = animelem = 13 || animelem = 15 || animelem = 17 || animelem = 19 || animelem = 21
attr = S, HP
damage = ceil(44 * root, fvar(12)), 7
animtype = Hard
fall.animtype = Hard
hitflag = MAFD
priority = 4, Hit
pausetime = 2, 2
guard.dist = 320
sparkno = -1
guard.sparkno = -1
guardsound = s2, 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -20, 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
air.velocity = -20, -.5
down.velocity = -20, -.5
getpower = 0
givepower = 36, 36
fall = 1
fall.recover = 0
sprpriority = 4
yaccel = 0.5
forcestand = 1

[State 3055, Hit]
type = hitdef
trigger1 = animelemno(0) != var(4)
trigger1 = animelem = 23
attr = S, HP 
damage = ceil(44 * root, fvar(12)), 7
animtype = Diagup
fall.animtype = Diagup
hitflag = MAFD
priority = 4, Hit 
pausetime = 2, 2
guard.dist = 320
sparkno = -1
guard.sparkno = -1
guardsound = s2, 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -20, 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
air.velocity = -20, -9
down.velocity = -20, -9
getpower = 0
givepower = 36, 36
fall = 1
fall.recover = 0
sprpriority = 4
yaccel = 0.5
forcestand = 1

[State 3055, Sparks]
type = explod
trigger1 = movecontact = 1 && numtarget
trigger1 = (target, movetype = H) && !(target, time)
anim = ifelse(moveguarded, 7001, 7030 + (random % 8))
ID = 7000
sprpriority = 5
postype = p2
pos = (target, const(size.ground.front) -10), (target, const(size.mid.pos.y))
removetime = -2
ownpal = 1
facing = -1
ignorehitpause = 1
pausemovetime = 100
supermovetime = 100

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
[State 3056, Assert]
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


;========================< HADOUKEN BLOW BACK >=============================
[Statedef 3054]
physics = N
movetype = A
anim = 3054
[State 3054, NHB]
type = nothitby
trigger1 = 1
time = -1
value = SCA
[State 3054, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 3054
ignorehitpause = 1
[State 3054, bound]
type = screenbound
trigger1 = 1
value = 0
[State 3054, Push]
type = playerpush
trigger1 = 1
value = 1
[State 3054, Vel]
type = velset
trigger1 = !time && !prevstateno
x = 40
[State 3054, Vel]
type = velmul
trigger1 = 1
x = 0.9
[State 3054, Snd]
type = playsnd
trigger1 = !time && !prevstateno
value = 5, 2
[State 3054, Hit]
type = hitdef
trigger1 = !time
priority = 4, Hit
attr = S, SP
damage = 0, 0
numhits = 0
animtype = Back
hitflag = MAF
guard.dist = 0
sparkno = -1
guard.sparkno = -1
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -8, -6
ground.cornerpush.veloff = 0
guard.velocity = -10.52
air.velocity = -8, -6
kill = 0
[State 3054, End]
type = destroyself
trigger1 = time >= 15


;========================< B&W DUST >=============================
[Statedef 3125]
physics = N
anim = 9741
[State 3125, Assert]
type = assertspecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1
[State 3125, Dust]
type = explod
trigger1 = !time
anim = 3125
ID = 3125
sprpriority = -2
postype = p1
removetime = 16
[State 3125, Fade]
type = palfx
trigger1 = !time
color = 0
mul = 384, 384, 384
sinadd = -255, -255, -255, 64
time = 16
[State 3125, Shrink]
type = modifyexplod
trigger1 = 1
ID = 3125
scale = 0.2 + (0.05 * time) * const(size.xscale), 0.05 + (0.0125 * time) * const(size.yscale)
[State 3125, End]
type = destroyself
trigger1 = time >= 17


;========================< METSU SHORYUU KEN >=============================
[Statedef 3165]
physics = N
velset = 0, 0
anim = 3165
sprpriority = 3
[State 3165, Assert]
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


;========================< TATSUMAKI VACUUM >=============================
[Statedef 3205]
physics = N
velset = 0, 0
anim = 3205
[State 3205, NHB]
type = nothitby
trigger1 = 1
time = -1
value = SCA
[State 3205, HitOverride]
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
trigger1 = p2bodydist x = [ -10, 10]
value = 1
[State 3205, Pos]
type = posset
trigger1 = 1
y = 0
[State 3205, Vel]
type = velset
trigger1 = root, var(1) = 1
x = 250.0 / (rootdist x + 50.0)
;ifelse((rootdist x = [0, 100]), 2, ifelse((rootdist x = [100, 200]), 1.5, 1))
[State 3205, Vel]
type = velset
trigger1 = root, var(1) != 1
x = 500.0 / (rootdist x + 50.0)
;ifelse((rootdist x = [0, 100]), 4, ifelse((rootdist x = [100, 200]), 3, 2))

[State 3205, Dust]
type = explod
trigger1 = (p2bodydist x = [ -5, 5]) && (enemynear, statetype != A) && !(time % 12)
anim = 7103
ID = 7103
sprpriority = 2
postype = p1
pos = 0, 0
scale = 1, 1
removetime = -2
ownpal = 1
[State 3205, Pos]
type = posadd
trigger1 = p2bodydist x != [ -5, 5]
x = ceil(p2dist x) - enemynear, const(size.ground.back) -5
[State 3205, End]
type = destroyself
trigger1 = root, stateno != 3200 || (root, anim != [3201, 3202]) || root, movecontact


;========================< CLOUD >=============================
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
removetime = -1
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
trigger1 = var(0) = 3 && vel y < 0 && pos y <= -260


;========================< S.G.S. GUARDED >=============================
[Statedef 4012]
physics = N
velset = 0, 0
anim = 9741

[State 4012, BG PalFX]
type = bgpalfx
trigger1 = !time
time = 20
add = -255, -128, -64
sinadd = 255, 128, 64, 80
persistent = 0
[State 4012, palfx]
type = palfx
trigger1 = !time
time = 24
sinadd = -255, -255, -255, 96

[State 4012, thunder]
type = explod
trigger1 = !time
anim = 4012
ID = 4012
sprpriority = -2
postype = p1
pos = 0, -ceil(pos y)
removetime = -2
supermovetime = 30
ownpal = 1
[State 4012, Circle]
type = explod
trigger1 = !time
anim = 7501
ID = 4013
sprpriority = 5
postype = p1
removetime = 20
supermovetime = 30

[State 4012, Shrink]
type = modifyexplod
trigger1 = numexplod(4013)
ID = 4013
scale = 0.2 + (0.09 * time), 0.2 + (0.09 * time)
[State 4012, No Shadow]
type = assertspecial
trigger1 = 1
flag = invisible
ignorehitpause = 1
[State 4012, End]
type = destroyself
trigger1 = time >= 24


;========================< BAG >=============================
[Statedef 6000]
physics = N
anim = 6000
sprpriority = 0
[State 6000, bound]
type = screenbound
trigger1 = 1
value = 0
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
type = gravity
trigger1 = time >= 91
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
trigger1 = pos y >= -4
value = 6001

[Statedef 6001]
physics = S
anim = ifelse(random < 750, 6001, 6002)
sprpriority = -3
velset = vel x, 0
[State 6001, Stop]
type = posset
trigger1 = 1
y = -4
[State 6001, landsnd]
type = playsnd
trigger1 = !time
trigger2 = anim = 6003 && animelem = 3
value = 5, 2
[State 6001, Dust]
type = explod
trigger1 = !time
anim = 7104
ID = 7104
sprpriority = -4
postype = p1
scale = 0.25, 0.25
ownpal = 1
[State 6001, fall]
type = changeanim
triggerall = anim = 6001 && animelemtime(2) > 0 && random < 500
trigger1 = root, movetype = H && (rootdist x = [ -30, 30]) && (rootdist x = [ -30, 30]); && !(root, time)
trigger2 = enemy, movetype = H && (p2dist x = [ -30, 30]) && (p2dist y = [ -30, 30]); && !(enemy, time)
value = 6003
persistent = 0
[State 6001, bound]
type = screenbound
trigger1 = 1
value = 0


;========================< DIZZY FX >=============================
[Statedef 3033]
physics = N
velset = 0, 0
anim = 9741
sprpriority = 4
[State 3033, Assert]
type = assertspecial
trigger1 = 1
flag = invisible
ignorehitpause = 1
[State 3033, Pos]
type = posadd
trigger1 = 1
x = ceil(p2dist x)
y = ceil(p2dist y)
[State 3033, Snd]
type = playsnd
trigger1 = enemynear, stateno = 5300
value = 0, ifelse(random < 500, 5300, 5301)
persistent = 0
[State 3033, End]
type = destroyself
trigger1 = enemynear, ctrl
trigger1 = (enemynear, movetype != H) && (enemynear, stateno != 5300)


;========================< FIRE >=============================
;--- RED ---
[Statedef 7180]
physics = N
velset = 0, 0
anim = 9741
sprpriority = 4
[State 7180, Assert]
type = assertspecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1
[State 7180, flames]
type = explod
trigger1 = 1
anim = 7180
ID = 7180
sprpriority = 3
postype = p2
vel = -.2, -.75
pos = (enemynear, const(size.mid.pos.x)), ifelse((enemynear, statetype = L), 0, (enemynear, const(size.mid.pos.y) + 10))
random = 40, 40
scale = 0.5, 0.5
ownpal = 1
[State 7180, Pos]
type = posadd
trigger1 = 1
x = ceil(p2dist x)
y = ceil(p2dist y)
[State End]
type = destroyself
triggerall = numenemy
trigger1 = enemynear, ctrl
trigger2 = enemynear, movetype != H || enemynear, stateno = 5300
trigger3 = enemynear, statetype = L && (enemynear, stateno != [5080, 5081])
[State End]
type = destroyself
trigger1 = !numenemy || time >= 120


;--- SHARED ---
[Statedef 7181]
physics = N
velset = 0, 0
anim = 9741
sprpriority = 4
[State 7181, Assert]
type = assertspecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1
[State 7181, flames]
type = explod
trigger1 = 1
anim = 7181
ID = 7181
sprpriority = 3
postype = p2
vel = -.2, -.75
pos = (enemynear, const(size.mid.pos.x)), ifelse((enemynear, statetype = L), 0, (enemynear, const(size.mid.pos.y) + 10))
random = 40, 40
removetime = -2
scale = 0.5, 0.5
ownpal = 1
[State 7181, Pos]
type = posadd
trigger1 = 1
x = ceil(p2dist x)
y = ceil(p2dist y)
[State End]
type = destroyself
triggerall = numenemy
trigger1 = enemynear, ctrl
trigger2 = enemynear, movetype != H || enemynear, stateno = 5300
trigger3 = enemynear, statetype = L && (enemynear, stateno != [5080, 5081])
[State End]
type = destroyself
trigger1 = !numenemy || time >= 120


;========================< SHIN SHORYUUKEN SHOCKWAVE >=============================
[Statedef 7050]
physics = N
velset = 0, 0
anim = 9741
[State 7050, palfx]
type = palfx
trigger1 = time = 5
time = 10
add = 0, 0, 0
sinadd = -255, -255, -255, 40
[State 7050, Circle]
type = explod
trigger1 = !time
anim = 7051
ID = 7051
sprpriority = 5
postype = p1
removetime = 15
pausemovetime = -1
supermovetime = -1
[State 7050, Circle]
type = explod
trigger1 = !time
anim = 7050
ID = 7050
sprpriority = 5
postype = p1
removetime = 15
pausemovetime = -1
supermovetime = -1
[State 7050, Shrink]
type = modifyexplod
trigger1 = 1
ID = 7051
scale = 0.15 * time, 0.15 * time
[State 7050, Shrink]
type = modifyexplod
trigger1 = 1
ID = 7050
scale = 0.05 * time, 0.05 * time
[State 7050, No Shadow]
type = assertspecial
trigger1 = 1
flag = invisible
ignorehitpause = 1
[State 7050, Safety]
type = removeexplod
trigger1 = time >= 15
ID = 7050
[State 7050, End]
type = destroyself
trigger1 = time >= 15


;========================< POWER CHARGE >=============================
;--- MAIN FX ---
[Statedef 7240]
type = S
anim = 7240
velset = 0, 0
ctrl = 0

[State 7240, Bind]
type = bindtoroot
trigger1 = (root, stateno = 740) && (root, anim = 740)
pos = -10, 0
[State 7240, Snd]
type = playsnd
trigger1 = !time
value = 7, 4
channel = 0

[State 7240, Aura]
type = explod
trigger1 = !numexplod(7242)
ID = 7242
anim = 7242
sprpriority = 3
postype = p1
bindtime = -1
removetime = -1
pausemovetime = -1
supermovetime = -1
scale = 0.5, 0.5
ownpal = 1

[State 7240, FX]
type = modifyexplod
trigger1 = numexplod(7242) && (root, power < 3000)
ID = 7242
scale = 0.5, 0.1 + .4 * (root, power / 3000.0)
[State 7240, FX]
type = modifyexplod
trigger1 = numexplod(7242) && (root, power >= 3000)
ID = 7242
scale = 0.5, 0.5

[State 7240, No Shadow]
type = assertspecial
trigger1 = 1
flag = noshadow

[State 7240, End]
type = stopsnd
trigger1 = (root, stateno != 740) || (root, anim != 740) || (root, movetype = H)
channel = 0
[State 7240, End]
type = removeexplod
trigger1 = (root, stateno != 740) || (root, anim != 740) || (root, movetype = H)
[State 7240, End]
type = destroyself
trigger1 = (root, stateno != 740) || (root, anim != 740) || (root, movetype = H)


;--- PARTICLES ---
[Statedef 7243]
type = S
anim = 9741
velset = 0, 0
ctrl = 0

[State 7243, Bind]
type = bindtoroot
trigger1 = !(time % 4)
pos = ceil(-90 + (random / 6.25)), ceil(20 -(random / 6.25))

[State 7243, Particle]
type = explod
trigger1 = (time % 4) = 1
anim = 7243
sprpriority = ifelse(random < 750, 5, -1)
postype = p1
vel = ((rootdist x -10) / 16.0), ((rootdist y -60) / 16.0)
scale = ifelse(random < 500, 0.5, -.5), ifelse(random < 500, 0.5, -.5)
removetime = 16
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 7243, End]
type = removeexplod
trigger1 = (root, stateno != 740) || (root, anim != 740) || (root, movetype = H)
[State 7243, End]
type = destroyself
trigger1 = (root, stateno != 740) || (root, anim != 740) || (root, movetype = H)


;========================< ZERO COUNTER CHARGE >=============================
[Statedef 7250]
physics = N
velset = 0, 0
anim = 9741

[State 7250, BG PalFX]
type = bgpalfx
trigger1 = !time
time = 20
add = -255, -128, -64
sinadd = 255, 128, 64, 80
persistent = 0
[State 7250, palfx]
type = palfx
trigger1 = !time
time = 20
sinadd = -255, -255, -255, 80

[State 7250, Dust]
type = explod
trigger1 = !time
anim = 7104
ID = 7104
sprpriority = -2
postype = p1
pos = 0, -ceil(pos y)
supermovetime = 30
ownpal = 1
[State 7250, thunder]
type = explod
trigger1 = !time
anim = 7250
ID = 7250
sprpriority = -2
postype = p1
pos = 0, -ceil(pos y)
removetime = -2
supermovetime = 30
ownpal = 1
[State 7250, Circle]
type = explod
trigger1 = !time
anim = 7251
ID = 7251
sprpriority = 3
postype = p1
removetime = 20
supermovetime = 30

[State 7250, Shrink]
type = modifyexplod
trigger1 = numexplod(7251)
ID = 7251
scale = 0.2 + (0.09 * time), 0.2 + (0.09 * time)
[State 7250, No Shadow]
type = assertspecial
trigger1 = 1
flag = noshadow
flag2 = invisible
ignorehitpause = 1
[State 7250, End]
type = destroyself
trigger1 = time >= 20


;========================< ORIGINAL COMBO CHARGE >=============================
[Statedef 7260]
physics = N
velset = 0, 0
anim = 9741

[State 7260, BG PalFX]
type = bgpalfx
trigger1 = !time
time = 30
add = -255, -255, -128
sinadd = 255, 255, 128, 120
[State 7260, palfx]
type = palfx
trigger1 = time = 20
time = 11
sinadd = -255, -255, -255, 40
persistent = 0

[State 7260, main]
type = explod
trigger1 = !time
anim = 7260
ID = 7260
sprpriority = 5
postype = p1
removetime = 20
supermovetime = 300
[State 7260, sphere]
type = explod
trigger1 = !time
anim = 7500
ID = 7261
sprpriority = 5
postype = p1
removetime = -1
supermovetime = 300
[State 7260, Circle]
type = explod
trigger1 = time = 20
anim = 7501
ID = 7262
sprpriority = 5
postype = p1
removetime = -1
supermovetime = 300

[State 7260, shrinkcircle]
type = modifyexplod
trigger1 = 1
ID = 7260
scale = 2 -(0.1 * time), 2 -(0.1 * time)
[State 7260, shrinkcircle]
type = modifyexplod
trigger1 = 1
ID = 7261
scale = 0.017 * time, 0.017 * time
[State 7260, shrinkcircle]
type = modifyexplod
trigger1 = time >= 20
ID = 7262
scale = 0.1 + (0.1 * (time -20)), 0.1 + (0.1 * (time -20))

[State 7260, No Shadow]
type = assertspecial
trigger1 = 1
flag = noshadow
flag2 = invisible
ignorehitpause = 1
[State 7260, bound]
type = screenbound
trigger1 = 1
value = 0
[State 7260, Safety]
type = removeexplod
trigger1 = time >= 30
[State 6110, End]
type = destroyself
trigger1 = time >= 30


;========================< SUPER CHARGE >=============================
[Statedef 7500]
physics = N
velset = 0, 0
anim = 9741

[State 7500, Lv1]
type = bgpalfx
trigger1 = time <= 10 && root, var(10) = 5
time = 1
add = 256 -ceil(25.6 * time), 256 -ceil(25.6 * time), 256 -ceil(25.6 * time)
mul = 256 -floor(25.6 * time), 256 -floor(25.6 * time), 256
color = 256 -floor(25.6 * time)
[State 7500, Lv1]
type = bgpalfx
trigger1 = (time = [11, 39]) && root, var(10) = 5
time = 1
mul = 0, 0, 256
color = 0
[State 7500, Lv1]
type = bgpalfx
trigger1 = time >= 40 && root, var(10) = 5
time = 1
mul = ceil(51.2 * (time -40)), ceil(51.2 * (time -40)), 256
color = floor(51.2 * (time -40))

[State 7500, Lv2]
type = bgpalfx
trigger1 = time <= 15 && root, var(10) = 6
time = 1
add = 256 -ceil(17.07 * time), 256 -ceil(17.07 * time), 256 -ceil(17.07 * time)
mul = 256 -floor(17.07 * time), 256 -floor(17.07 * time), 256
color = 256 -floor(17.07 * time)
[State 7500, Lv2]
type = bgpalfx
trigger1 = (time = [16, 47]) && root, var(10) = 6
time = 1
mul = 0, 0, 256
color = 0
[State 7500, Lv2]
type = bgpalfx
trigger1 = time >= 48 && root, var(10) = 6
time = 1
mul = ceil(51.2 * (time -48)), ceil(51.2 * (time -48)), 256
color = floor(51.2 * (time -48))

[State 7500, Lv3]
type = bgpalfx
trigger1 = time <= 20 && root, var(10) = 7
time = 1
add = 256 -ceil(12.8 * time), 256 -ceil(12.8 * time), 256 -ceil(12.8 * time)
mul = 256 -floor(12.8 * time), 256 -floor(12.8 * time), 256 -floor(12.8 * time)
color = 256 -floor(12.8 * time)
[State 7500, Lv3]
type = bgpalfx
trigger1 = (time = [21, 54]) && root, var(10) = 7
time = 1
mul = 0, 0, 0
color = 0
[State 7500, Lv3]
type = bgpalfx
trigger1 = time >= 55 && root, var(10) = 7
time = 1
mul = ceil(51.2 * (time -55)), ceil(51.2 * (time -55)), ceil(51.2 * (time -55))
color = floor(51.2 * (time -55))

[State 7500, Spiral]
type = helper
trigger1 = !time && root, var(10) >= 6
helpertype = normal
stateno = 7509
ID = 7509
name = "Super Charge Spiral"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 7500, Main]
type = explod
trigger1 = !time
anim = 7500
ID = 7500
sprpriority = 5
postype = p1
removetime = -1
pausemovetime = -1
supermovetime = -1
[State 7500, Large Circle]
type = explod
trigger1 = !time
anim = 7501
ID = 7501
sprpriority = 5
postype = p1
pausemovetime = -1
supermovetime = -1

[State 7500, Portrait]
type = explod
trigger1 = time = 1 && root, var(10) = 7
anim = ifelse((root, var(1) = 2), 7511, 7510)
ID = 7510
postype = back
pos = 160, 120
sprpriority = -16
bindtime = -1
pausemovetime = -1
supermovetime = -1

[State 7500, Circle]
type = explod
trigger1 = !time
anim = 7502
ID = 75021
sprpriority = 5
postype = p1
pausemovetime = -1
supermovetime = -1
[State 7500, Circle]
type = explod
trigger1 = time = 7
anim = 7502
ID = 75022
sprpriority = 5
postype = p1
pausemovetime = -1
supermovetime = -1
[State 7500, Circle]
type = explod
trigger1 = time = 14
anim = 7502
ID = 75023
sprpriority = 5
postype = p1
pausemovetime = -1
supermovetime = -1
[State 7500, Circle]
type = explod
trigger1 = time = 21
anim = 7502
ID = 75024
sprpriority = 5
postype = p1
pausemovetime = -1
supermovetime = -1
[State 7500, Circle]
type = explod
trigger1 = time = 28
anim = 7502
ID = 75025
sprpriority = 5
postype = p1
pausemovetime = -1
supermovetime = -1

[State 7500, Scale]
type = modifyexplod
trigger1 = root, var(10) = 5
ID = 7500
scale = 1.5 -(0.0333 * time), 1.5 -(0.0333 * time)
[State 7500, Scale]
type = modifyexplod
trigger1 = root, var(10) = 6
ID = 7500
scale = 1.5 -(0.0283 * time), 1.5 -(0.0283 * time)
[State 7500, Scale]
type = modifyexplod
trigger1 = root, var(10) = 7
ID = 7500
scale = 1.5 -(0.025 * time), 1.5 -(0.025 * time)

[State 7500, Scale]
type = modifyexplod
trigger1 = numexplod(7501)
ID = 7501
scale = 0.25 + (0.075 * time), 0.25 + (0.075 * time)
trans = addalpha
alpha = ceil(256 -6.4 * time), 256

[State 7500, Scale]
type = modifyexplod
trigger1 = numexplod(7510) && time < 8
ID = 7510
postype = back
pos = -160 + (40 * time), 120
scale = 0.5, 0.5
trans = addalpha
alpha = (32 * time), 256
[State 7500, Scale]
type = modifyexplod
trigger1 = numexplod(7510) && (time = [8, 50])
ID = 7510
postype = back
pos = 160, 120
scale = 0.5, 0.5
trans = addalpha
alpha = 256, 256
[State 7500, Scale]
type = modifyexplod
trigger1 = numexplod(7510) && time >= 50 && root, var(1) != 2
ID = 7510
postype = back
pos = 160 -(20 * (time -50)), 120 + (40 * (time -50))
scale = 0.5 + (0.25 * (time -50)), 0.5 + (0.25 * (time -50))
trans = addalpha
alpha = 256 -ceil(25.6 * (time -50)), 256
[State 7500, Scale]
type = modifyexplod
trigger1 = numexplod(7510) && time >= 50 && root, var(1) = 2
ID = 7510
postype = back
pos = 160 -(18 * (time -50)), 120 + (32 * (time -50))
scale = 0.5 + (0.25 * (time -50)), 0.5 + (0.25 * (time -50))
trans = addalpha
alpha = 256 -ceil(25.6 * (time -50)), 256

[State 7500, Scale]
type = modifyexplod
trigger1 = numexplod(75021)
ID = 75021
scale = 0.25 + (0.0375 * time), 0.25 + (0.0375 * time)
[State 7500, Scale]
type = modifyexplod
trigger1 = numexplod(75022)
ID = 75022
scale = 0.25 + (0.0375 * (time -7)), 0.25 + (0.0375 * (time -7))
[State 7500, Scale]
type = modifyexplod
trigger1 = numexplod(75023)
ID = 75023
scale = 0.25 + (0.0375 * (time -14)), 0.25 + (0.0375 * (time -14))
[State 7500, Scale]
type = modifyexplod
trigger1 = numexplod(75024)
ID = 75024
scale = 0.25 + (0.0375 * (time -21)), 0.25 + (0.0375 * (time -21))
[State 7500, Scale]
type = modifyexplod
trigger1 = numexplod(75025)
ID = 75025
scale = 0.25 + (0.0375 * (time -28)), 0.25 + (0.0375 * (time -28))

[State 7500, Safety]
type = assertspecial
trigger1 = 1
flag = noshadow
flag2 = invisible
[State 7500, No bars]
type = assertspecial
trigger1 = root, var(10) = 7
flag = nobardisplay
flag2 = noFG

[State 7500, Safety]
type = removeexplod
trigger1 = root, var(10) = 5 && time >= 45
trigger2 = root, var(10) = 6 && time >= 53
trigger3 = time >= 60
[State 7500, End]
type = destroyself
trigger1 = root, var(10) = 5 && time >= 45
trigger2 = root, var(10) = 6 && time >= 53
trigger3 = time >= 60


;--- Spiral ---
[Statedef 7509]
physics = N
anim = 7509
sprpriority = 5
[State 7509, Assert]
type = assertspecial
trigger1 = 1
flag = noshadow

[State 7509, Spin]
type = angleset
trigger1 = !time
value = -15 * (random % 24)
[State 7509, Spin]
type = angleadd
trigger1 = 1
value = -15

[State 7509, Angle]
type = angledraw
trigger1 = root, var(10) = 6
scale = 1 -(time / 53.0), 1 -(time / 53.0)
[State 7509, Trans]
type = trans
trigger1 = root, var(10) = 6
trans = addalpha
alpha = floor(4.83 * time), 256

[State 7509, Angle]
type = angledraw
trigger1 = root, var(10) = 7
scale = 1 -(time / 60.0), 1 -(time / 60.0)
[State 7509, Trans]
type = trans
trigger1 = root, var(10) = 7
trans = addalpha
alpha = floor(4.267 * time), 256

[State 7509, End]
type = destroyself
trigger1 = root, var(10) = 6 && time >= 53
trigger2 = time >= 60


;========================< COUNTER F.X. >=============================
[Statedef 7400]
type = A
physics = N
anim = 9741

[State 7400, superchargebgpalfx]
type = allpalfx
trigger1 = !time
time = 8
add = 255, 255, 255
sinadd = -255, -255, -255, 32

[State 7400, slow]
type = pause
trigger1 = time < 8
time = 1

[State 7400, End]
type = destroyself
trigger1 = time >= 8


;========================< SUPER FINISH >=============================
[Statedef 7600]
type = A
velset = 0, 0
anim = 9741
[State 7600, Bind]
type = posset
trigger1 = 1
x = 0
y = ceil(pos y -screenpos y) + 120

[State 7600, Snd]
type = playsnd
trigger1 = !time
value = 7, 7
channel = 1

[State 7600, Snd]
type = sndpan
trigger1 = time <= 80
channel = 1
abspan = ceil(sin(gametime / 20.0 * pi) * 160)

[State 7600, Snd]
type = assertspecial
trigger1 = time <= 80
flag = nomusic

[State 7600, BG PalFX]
type = bgpalfx
trigger1 = time < 10
time = 1
mul = 0, 0, 0
[State 7600, BG PalFX]
type = bgpalfx
trigger1 = time = [10, 20]
time = 1
mul = (time -10) * 25, (time -10) * 25, (time -10) * 25

[State 7600, MvC]
type = explod
trigger1 = !time
anim = 7601
ID = 7601
ontop = 1
postype = left
pos = 0, 0
scale = 1, (1.3333333 * gameheight / gamewidth)
bindtime = -1
removetime = 20
pausemovetime = -1
supermovetime = -1

[State 7600, Fade]
type = modifyexplod
trigger1 = numexplod(7601)
ID = 7601
trans = addalpha
alpha = ifelse(time < 10, 256, ceil(256 -(time -10) * 25.6)), 256

[State 7600, Circle]
type = explod
trigger1 = !time
anim = 7600
ID = 7600
sprpriority = -255
postype = left
pos = 160, floor((1.3333333 * gameheight / gamewidth) * 120)
bindtime = -1
removetime = 20
pausemovetime = -1
supermovetime = -1

[State 7600, Scale]
type = modifyexplod
trigger1 = numexplod(7600)
ID = 7600
scale = (0.25 * time) * (1.3333333 * gameheight / gamewidth), (0.25 * time) * (1.3333333 * gameheight / gamewidth)
trans = addalpha
alpha = ceil(256 -12.8 * time), 256

[State 7600, Safety]
type = removeexplod
trigger1 = time > 20 && numexplod
trigger2 = roundstate < 3
[State 7600, nobars]
type = assertspecial
trigger1 = time <= 20
flag = nobardisplay
flag2 = noFG
flag3 = globalnoshadow

[State 7600, End]
type = destroyself
trigger1 = roundstate < 3


;========================< KANJI B.G. >=============================
[Statedef 7610]
physics = N
velset = 0, 0
anim = 9741

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
pos = 160, 120
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


;========================< CAMERA CONTROL >=============================
[Statedef 7650]
physics = N
velset = 0, 0
anim = 9741
[State 7650, bound]
type = screenbound
trigger1 = 1
value = 0
movecamera = 1, 1
[State 7650, End]
type = destroyself
trigger1 = roundstate = 2
