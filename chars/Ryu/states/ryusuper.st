; ______________________________
;| Ryu by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;============================================================================================
;======================================<HYPER STATES>========================================
;============================================================================================

;======================<SHINKUU HADOU KEN>=============================
[Statedef 3000]
type = S
physics = S
movetype = A
anim = 3000
ctrl = 0
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

[State 3000, Width]
type = width
trigger1 = animelemtime(8) = -1
value = 20, 0

[State 3000, Snd]
type = playsnd
trigger1 = animelem = 3
value = ifelse(var(1) = 2, 14, 4), 3
channel = 0

[State 3000, Super Pause FX]
type = helper
trigger1 = fvar(31)
trigger1 = animelem = 3
helpertype = normal
stateno = 7500
ID = 7500
name = "Superpause FX"
postype = p1
pos = ceil(-15 * const(size.xscale)), ceil(-73 * const(size.yscale))
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
pos = ceil(-15 * const(size.xscale)), ceil(-73 * const(size.yscale))
sound = s0, 8500
darken = ifelse(fvar(31), 0, 1)
p2defmul = 1 + (0 * (fvar(5) := 0))

[State 3000, NHB]
type = nothitby
trigger1 = animelemtime(8) < 0
time = 1
value = SCA

[State 3000, Correct Projectile Trade]
type = hitby
trigger1 = animelem = 8
value = SCA, AA, AT
time = 1

[State 3000, hadouken]
type = helper
trigger1 = animelem = 8
helpertype = normal
stateno = 3005
ID = 3005
name = "Shinkuu Hadouken"
postype = p1
pos = 80, -66
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 3000, Dust]
type = explod
trigger1 = animelem = 8
vel = 0, 0
anim = 7106
ID = 7106
sprpriority = 3
postype = p1
pos = 50, 4
ownpal = 1
scale = 0.75, 0.5
pausemovetime = -1
supermovetime = -1

[State 3000, Snd]
type = playsnd
trigger1 = animelem = 7
value = ifelse(var(1) = 2, 14, 4), 5 -(var(1) = 2) * 5
channel = 0
[State 3000, Snd]
type = playsnd
trigger1 = animelem = 8
value = 5, 0

[State 3000, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<DENJIN HADOU KEN>=============================
[Statedef 3020]
type = S
physics = S
movetype = A
anim = 3020
ctrl = 0
velset = 0, 0
poweradd = -1000
sprpriority = 1
facep2 = 1

[State 3020, Custom Combo End]
type = palfx
trigger1 = !time
trigger1 = var(20) > 0
trigger1 = (var(20) := 0) || (var(15) := 0) || 1
time = 1

[State 3020, Strength]
type = varset
trigger1 = var(10) != 5
var(10) = 5
ignorehitpause = 1

[State 3020, Width]
type = width
trigger1 = 1
value = 16, 0

[State 3020, NHB]
type = nothitby
trigger1 = time <= 4
time = 1
value = SCA

[State 3020, Snd]
type = playsnd
trigger1 = anim = 3020 && animelem = 3
value = 4, 15
channel = 0

[State 3020, Super Pause FX]
type = helper
trigger1 = fvar(31)
trigger1 = anim = 3020 && animelem = 3
helpertype = normal
stateno = 7500
ID = 7500
name = "Superpause FX"
postype = p1
pos = ceil(-5 * const(size.xscale)), ceil(-69 * const(size.yscale))
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3020, Super Pause]
type = superpause
trigger1 = time = 3
time = 43
movetime = 43
anim = ifelse(fvar(31), -1, 100)
pos = ceil(-5 * const(size.xscale)), ceil(-69 * const(size.yscale))
sound = s0, 8500
darken = ifelse(fvar(31), 0, 1)
p2defmul = 1 + (0 * (fvar(5) := 0))

[State 3020, Electricity]
type = explod
trigger1 = !numexplod(3027)
trigger1 = anim = 3020 && animelemtime(3) >= 1
anim = 3027
ID = 3027
sprpriority = 3
postype = p1
pos = -5, -69
bindtime = -1
removetime = 180
removeongethit = 1
scale = 0.25, 0.25
ownpal = 1

[State 3020, Electricity]
type = modifyexplod
trigger1 = numexplod(3027)
ID = 3027
scale = 0.25 + (0.00375 * var(0)), 0.25 + (0.00375 * var(0))

[State 3020, lv1indicator]
type = explod
trigger1 = (anim = 3020 && animelemtime(4) >= 0) || (anim = 3021 && animelemtime(2) < 0)
trigger1 = var(0) >= 10
anim = 3030
ID = 3030
sprpriority = 4
postype = p1
pos = -5, -69
ownpal = 1
persistent = 0
[State 3020, lv2indicator]
type = explod
trigger1 = (anim = 3020 && animelemtime(4) >= 0) || (anim = 3021 && animelemtime(2) < 0)
trigger1 = var(0) >= 30
anim = 3030
ID = 3030
sprpriority = 4
postype = p1
pos = -5, -69
ownpal = 1
persistent = 0
[State 3020, lv3indicator]
type = explod
trigger1 = (anim = 3020 && animelemtime(4) >= 0) || (anim = 3021 && animelemtime(2) < 0)
trigger1 = var(0) >= 60
anim = 3030
ID = 3030
sprpriority = 4
postype = p1
pos = -5, -69
ownpal = 1
persistent = 0
[State 3020, lv4indicator]
type = explod
trigger1 = (anim = 3020 && animelemtime(4) >= 0) || (anim = 3021 && animelemtime(2) < 0)
trigger1 = var(0) >= 120
anim = 3030
ID = 3030
sprpriority = 4
postype = p1
pos = 68, -68
ownpal = 1
persistent = 0

[State 3020, lv1flash]
type = palfx
trigger1 = (anim = 3020 && animelemtime(4) >= 0) || (anim = 3021 && animelemtime(2) < 0)
trigger1 = var(0) >= 10
time = 6
add = 0, 128, 255
sinadd = 0, -128, -255, 24
persistent = 0
[State 3020, lv2flash]
type = palfx
trigger1 = (anim = 3020 && animelemtime(4) >= 0) || (anim = 3021 && animelemtime(2) < 0)
trigger1 = var(0) >= 30
time = 6
add = 0, 128, 255
sinadd = 0, -128, -255, 24
persistent = 0
[State 3020, lv3flash]
type = palfx
trigger1 = (anim = 3020 && animelemtime(4) >= 0) || (anim = 3021 && animelemtime(2) < 0)
trigger1 = var(0) >= 60
time = 6
add = 0, 128, 255
sinadd = 0, -128, -255, 24
persistent = 0
[State 3020, lv4flash]
type = palfx
trigger1 = (anim = 3020 && animelemtime(4) >= 0) || (anim = 3021 && animelemtime(2) < 0)
trigger1 = var(0) >= 120
time = 6
add = 0, 128, 255
sinadd = 0, -128, -255, 24
persistent = 0

[State 3020, lv1snd]
type = playsnd
trigger1 = (anim = 3020 && animelemtime(4) >= 0) || (anim = 3021 && animelemtime(2) < 0)
trigger1 = var(0) >= 10
value = 5, 6 + (random % 2)
persistent = 0
[State 3020, lv2snd]
type = playsnd
trigger1 = (anim = 3020 && animelemtime(4) >= 0) || (anim = 3021 && animelemtime(2) < 0)
trigger1 = var(0) >= 30
value = 5, 6 + (random % 2)
persistent = 0
[State 3020, lv3snd]
type = playsnd
trigger1 = (anim = 3020 && animelemtime(4) >= 0) || (anim = 3021 && animelemtime(2) < 0)
trigger1 = var(0) >= 60
value = 5, 6 + (random % 2)
persistent = 0
[State 3020, lv4snd]
type = playsnd
trigger1 = (anim = 3020 && animelemtime(4) >= 0) || (anim = 3021 && animelemtime(2) < 0)
trigger1 = var(0) >= 120
value = 5, 6 + (random % 2)
persistent = 0

[State 3020, Snd]
type = playsnd
trigger1 = anim = 3020
trigger1 = animelemtime(4) >= 0
trigger1 = !(time % 16)
value = 5, 14
channel = 1

[State 3020, Denjin Var Reset]
type = varset
trigger1 = anim = 3020 && animelemtime(4) < 0
var(0) = 0

[State 3020, Denjin Var]
type = varadd
triggerall = var(0) < 200
triggerall = anim = 3020 && animelemtime(4) >= 0
trigger1 = !AIlevel
trigger1 = command = "holdx" || command = "holdy" || command = "holdz"
trigger2 = AIlevel
var(0) = 1

[State 3020, Denjin Var]
type = varadd
triggerall = var(0) < 200
triggerall = anim = 3020 && animelemtime(4) >= 0
trigger1 = !AIlevel
trigger1 = command = "holdx" || command = "holdy" || command = "holdz"
trigger1 = command = "fwd" || command = "back" || command = "up" || command = "down"
trigger2 = AIlevel && random < 333
var(0) = 1

[State 3020, Flash]
type = palfx
triggerall = anim = 3020 && animelemtime(4) >= 0
trigger1 = !AIlevel && (command = "holdx" || command = "holdy" || command = "holdz") && var(0) < 200
trigger1 = command = "fwd" || command = "back" || command = "down" || command = "up"
time = 1
add = 48, 48, 48

[State 3020, Anim]
type = changeanim
triggerall = time >= 50
triggerall = anim = 3020 && animelemtime(4) >= 0
trigger1 = var(0) >= 120
trigger2 = !AIlevel
trigger2 = command != "holdx" && command != "holdy" && command != "holdz"
value = 3021

[State 3020, Anim]
type = changeanim
triggerall = AIlevel && numenemy
triggerall = anim = 3020 && animelemtime(4) >= 0
trigger1 = (p2dist x < 0 || enemynear, movetype = A || inguarddist)
trigger2 = (fvar(16) <= 90) && (enemynear, stateno = 40)
value = 3021

[State 3020, Remove Electricity]
type = removeexplod
trigger1 = anim = 3021
ID = 3027

[State 3020, Correct Projectile Trade]
type = hitby
trigger1 = time > 4
trigger1 = anim = 3021 && animelem = 1
value = SCA, AA, AT
time = 1

[State 3020, Hadouken]
type = helper
trigger1 = anim = 3021
trigger1 = animelem = 1
helpertype = normal
stateno = 3025
ID = 3025
name = "Denjin Hadouken"
postype = p1
pos = 83, -68
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 3020, Dust]
type = explod
trigger1 = anim = 3021 && animelem = 1
vel = 0, 0
anim = 7106
sprpriority = 3
postype = p1
pos = 50, 4
ownpal = 1
scale = 0.75, 0.5
pausemovetime = -1
supermovetime = -1

[State 3020, Snd]
type = playsnd
trigger1 = anim = 3021 && animelem = 1
value = 4, 5
channel = 0

[State 3020, Snd]
type = playsnd
trigger1 = anim = 3021 && animelem = 1
value = 5, 0
channel = 1

[State 3020, End]
type = changestate
trigger1 = anim = 3021 && !animtime
value = 0
ctrl = 1


;========================<SHOCKED>=============================
[Statedef 7696]
type = U
physics = N
movetype = H
ctrl = 0
velset = 0, 0

[State 7696, Pos]
type = posset
trigger1 = pos y > 0
y = 0

[State 7696, Anim]
type = changeanim
trigger1 = !time
trigger1 = anim != 7696 && selfanimexist(7696)
value = 7696
[State 7696, Anim]
type = changeanim
trigger1 = !time
trigger1 = anim != 9010 && !selfanimexist(7696) && selfanimexist(9010)
value = 9010
[State 7696, Anim]
type = changeanim
trigger1 = !time
trigger1 = !selfanimexist(7696) && !selfanimexist(9010)
value = ifelse(statetype != A, 5002, 5030)

[State 7696, No PalFX]
type = palfx
trigger1 = !time
trigger1 = (anim = 7696 || anim = 9010)
add = 0, 0, 0
time = 1

[State 7696, End]
type = palfx
trigger1 = gethitvar(hitshaketime) <= 1
time = 18
add = 0, 0, 0
mul = 256, 256, 256
sinadd = 255, 255, 255, 4
invertall = 1
color = 0

[State 7696, End]
type = selfstate
trigger1 = hitshakeover
value = ifelse(gethitvar(fall) || pos y, 5020, 5000)


;========================<GUARD CRUSH>=============================
;--- Hitpause---
[Statedef 1115910]
type = S
physics = N
movetype = H
velset = 0, 0

[State 1115910, Bullet time]
type = bgpalfx
trigger1 = !time
time = 5
sinadd = 128, 128, 128, 10
ignorehitpause = 1
persistent = 0

[State 1115910, Anim]
type = changeanim
trigger1 = !selfanimexist(5910)
value = 5002

[State 1115910, Anim]
type = changeanim
trigger1 = selfanimexist(5910)
value = 5910

[State 1115910, End]
type = changestate
trigger1 = hitshakeover
value = 1115911


;--- Hit back ---
[Statedef 1115911]
type = S
movetype= H
physics = S

[State 1115911, Slow]
type = pause
trigger1 = time = [0, 8]
trigger2 = time = [9, 16]
trigger2 = !(time % 2)
time = 1

[State 1115911, Vel]
type = hitvelset
trigger1 = !time
x = 1

[State 1115911, Anim]
type = changeanim
trigger1 = animtime = 0
trigger1 = anim = 5002
value = 5007

[State 1115911, Vel]
type = velmul
trigger1 = time >= gethitvar(slidetime)
x = 0.6

[State 1115911, Vel]
type = velset
trigger1 = hitover
x = 0

[State 1115911, End]
type = defencemulset
trigger1 = hitover
value = 1

[State 1115911, End]
type = selfstate
trigger1 = hitover
value = 0
ctrl = 1


;======================<METSU HADOU KEN>=============================
[Statedef 3040]
type = S
physics = S
movetype = A
anim = 3040
ctrl = 0
velset = 0, 0
poweradd = -3000
sprpriority = 1
facep2 = 1

[State 3040, Custom Combo End]
type = palfx
trigger1 = !time
trigger1 = var(20) > 0
trigger1 = (var(20) := 0) || (var(15) := 0) || 1
time = 1

[State 3040, Strength]
type = varset
trigger1 = var(10) != 7
var(10) = 7
ignorehitpause = 1

[State 3040, Snd]
type = playsnd
trigger1 = time = 3
value = ifelse(var(1) = 2, 14, 4), 10 + (var(1) = 2)
channel = 0

[State 3040, Super Pause FX]
type = helper
trigger1 = fvar(31)
trigger1 = time = 3
helpertype = normal
stateno = 7520
ID = 7500
name = "Superpause FX"
postype = p1
pos = ceil(-15 * const(size.xscale)), ceil(-73 * const(size.yscale))
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3040, Super Pause]
type = superpause
trigger1 = time = 3
time = 47
movetime = 47
anim = ifelse(fvar(31), -1, 102)
pos = ceil(-15 * const(size.xscale)), ceil(-73 * const(size.yscale))
sound = s0, 8520
darken = ifelse(fvar(31), 0, 1)
p2defmul = 1 + (0 * (fvar(5) := 0))

[State 3040, NHB]
type = nothitby
trigger1 = 1
time = 4
value = SCA

[State 3040, End]
type = changestate
trigger1 = time >= 43
value = 3041


;--- Charge ---
[Statedef 3041]
type = S
physics = S
movetype = A
anim = 3041
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 3041, NHB]
type = nothitby
trigger1 = !time
time = 10
value = SCA

[State 3041, Metsu Var Reset]
type = varset
trigger1 = !time
var(52) = 0

[State 3041, Metsu Var]
type = varadd
trigger1 = var(52) < 120
var(52) = 1

[State 3041, Shake]
type = envshake
trigger1 = !(time % 4)
time = 4
freq = 180
ampl = ifelse(var(52) > 80, 3, ifelse(var(52) > 40, 2, 1))

[State 3041, BGPal]
type = bgpalfx
trigger1 = (var(52) = [0, 120])
mul = 256 + ceil(2.13 * var(52)), 256 -ceil(2.13 * var(52)), 256 -ceil(2.13 * var(52))
add = -ceil(var(52) / 2.13), -ceil(var(52) / 2.13), -ceil(var(52) / 2.13)
color = 256 -ceil(var(52) * 2.13)
time = 2

[State 3041, Snd]
type = playsnd
trigger1 = !time
value = ifelse(var(1) = 2, 13, 3), ifelse(var(1) = 2, 6, 5)
channel = 0

[State 3041, Snd]
type = playsnd
trigger1 = 1
value = 5, 15
channel = 3
lowpriority = time

[State 3041, Snd]
type = playsnd
trigger1 = !time
value = 5, 9
channel = 4

[State 3041, FX]
type = explod
trigger1 = !numexplod(3047)
anim = 3047
ID = 3047
sprpriority = 3
postype = p1
pos = -16, -72
bindtime = -1
removetime = -1
removeongethit = 1
ownpal = 1
persistent = 0

[State 3041, Grow]
type = modifyexplod
trigger1 = numexplod(3047)
ID = 3047
scale = 0.5 + 0.0125 * var(52), 0.5 + 0.0125 * var(52)

[State 3041, Beam]
type = changestate
trigger1 = var(52) >= 120
value = 3050

[State 3041, Fireball]
type = changestate
triggerall = time >= 6
trigger1 = !AIlevel
trigger1 = command != "holdx" && command != "holdy" && command != "holdz"
trigger2 = AIlevel
trigger2 = p2dist x < 0 || p2movetype = A || inguarddist
value = 3042


;--- Fire ---
[Statedef 3042]
type = S
physics = S
movetype = A
anim = 3042
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 3042, Remove FX]
type = removeexplod
trigger1 = numexplod(3047)
ID = 3047

[State 3042, Correct Projectile Trade]
type = hitby
trigger1 = time > 9
trigger1 = anim = 3041 && animelem = 2
value = SCA, AA, AT
time = 1

[State 3042, hadouken]
type = helper
trigger1 = animelem = 2
helpertype = normal
stateno = 3045
ID = 3045
name = "Metsu Hadouken"
postype = p1
pos = 83, -67
ownpal = 1

[State 3042, Dust]
type = explod
trigger1 = animelem = 2
anim = 7106
sprpriority = 3
postype = p1
pos = 50, 4
ownpal = 1
scale = 0.75, 0.5
pausemovetime = -1
supermovetime = -1

[State 3042, Snd]
type = playsnd
trigger1 = animelem = 2
value = ifelse(var(1) = 2, 14, 4), 5 -(var(1) = 2) * 5
channel = 0
[State 3000, Snd]
type = playsnd
trigger1 = animelem = 2
value = 5, 0

[State 3042, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<RYUU KOKU HADOU KEN>=============================
[Statedef 3050]
type = S
physics = S
movetype = A
anim = 3050
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 3050, Do not guard]
type = attackdist
trigger1 = 1
value = 0

[State 3050, Strength]
type = varset
trigger1 = var(10) != 7
var(10) = 7
ignorehitpause = 1

[State 3050, Width]
type = width
trigger1 = anim = 3050
trigger2 = anim = 3051 && animelemtime(5) < 0
value = 30, 0

[State 3050, removefx]
type = removeexplod
trigger1 = numexplod(3047)
ID = 3047

[State 3050, Snd]
type = playsnd
trigger1 = !time
value = ifelse(var(1) = 2, 14, 4), ifelse(var(1) = 2, 0, 5)
channel = 0

[State 3050, Shake]
type = envshake
trigger1 = !(time % 4)
trigger1 = anim = 3050 && animelemtime(2) >= 0
time = 4
freq = 180
ampl = 2

[State 3050, Hadouken]
type = helper
trigger1 = anim = 3050 && animelemtime(2) >= 0
trigger1 = !numhelper(3055)
helpertype = normal
stateno = 3055
ID = 3055
name = "Ryu Koku Hadouken"
postype = p1
ownpal = 1
persistent = 0

[State 3050, Snd]
type = playsnd
trigger1 = numhelper(3055)
value = 5, 1
abspan = 0
persistent = 0

[State 3050, Dust]
type = explod
trigger1 = anim = 3050 && animelem = 2
anim = 7106
sprpriority = 3
postype = p1
pos = 45, 0
removetime = -2
scale = 1.5, 1.5
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 3050, Anim]
type = changeanim
trigger1 = anim = 3050 && animelemtime(2) >= 0 && !numhelper(3055)
value = 3051

[State 3050, Snd]
type = playsnd
trigger1 = anim = 3051 && animelem = 8
value = ifelse(var(1) = 2, 5010, 5000), 3
channel = 0

[State 3050, Snd]
type = playsnd
trigger1 = anim = 3051 && animelem = 8
value = 0, 52

[State 3050, Dust]
type = explod
trigger1 = anim = 3051 && animelem = 8
anim = 7102
ID = 7102
sprpriority = -4
postype = p1
pos = -5, 0
scale = 0.33, 0.33
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 3050, Type]
type = statetypeset
trigger1 = anim = 3051 && animelemtime(8) >= 0 && animelemtime(15) < 0
statetype = C
physics = C

[State 3050, Type]
type = statetypeset
trigger1 = anim = 3051 && animelemtime(15) >= 0
statetype = S
physics = S

[State 3050, win]
type = changestate
trigger1 = anim = 3051 && animelemtime(7) >= 0 && winko
value = 3052

[State Idle]
type = statetypeset
trigger1 = anim = 3051
movetype = I

[State 3050, End]
type = changestate
trigger1 = anim = 3051 && !animtime
value = 0
ctrl = 1


;======================<NIDAN SHORYUU TSUKI>=============================
[Statedef 3100]
type = S
physics = S
movetype = A
anim = 3100
ctrl = 0
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

[State 3100, Strength]
type = varset
trigger1 = var(10) != 5
var(10) = 5
ignorehitpause = 1

[State 3100, Super Pause FX]
type = helper
trigger1 = fvar(31)
trigger1 = anim = 3100 && animelem = 4
helpertype = normal
stateno = 7500
ID = 7500
name = "Superpause FX"
postype = p1
pos = ceil(3 * const(size.xscale)), ceil(-66 * const(size.yscale))
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
pos = ceil(3 * const(size.xscale)), ceil(-66 * const(size.yscale))
sound = s0, 8500
darken = ifelse(fvar(31), 0, 1)
p2defmul = 1 + (0 * (fvar(5) := 0))

[State 3100, NHB]
type = nothitby
trigger1 = anim = 3100 && animelemtime(6) < 1
time = 1
value = SCA

[State 3100, Pos]
type = posadd
trigger1 = anim = 3100
trigger1 = animelem = 2 || animelem = 4
x = 6

[State 3100, Vel]
type = velset
trigger1 = anim = 3100 && animelemtime(5) >= 0 && animelemtime(7) < 0
x = 9
[State 3100, Snd]
type = playsnd
trigger1 = anim = 3100 && animelem = 5
value = 5, 12
[State 3100, Dust]
type = explod
trigger1 = anim = 3100 && animelemtime(5) >= 0 && vel x > 0.5 && !(time % 2)
anim = 7103
ID = 7103
sprpriority = 3
postype = p1
pos = 45, 0
vel = -2, 0
ownpal = 1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1

[State 3100, Snd]
type = playsnd
trigger1 = anim = 3100 && animelem = 6
value = 3, 4
channel = 0

[State 3100, Hit Elbow]
type = hitdef
trigger1 = (animelem = 5 || animelem = 6) && anim = 3100
trigger1 = var(15) < (1 + hitcount)
ID = 3100
attr = S, HA
damage = 60, 7
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 4, 4
guard.pausetime = 4, 4
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 50) * (var(36) := 111), var(37) := ifelse((animelem = 6), -50, -36)
hitsound = -1 + 0 * (var(31) := 3)
guardsound = -1
p2facing = 1
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = 0, 0
guard.velocity = -10.52
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.type = Low
air.velocity = -0.5, -3
getpower = 0
givepower = 36, 36
envshake.time = 12
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
forcestand = 1
yaccel = 0.4850
forcestand = 1

[State 3100, Hit Elbow]
type = hitdef
trigger1 = animelem = 7 && anim = 3100
trigger1 = var(15) < (2 + hitcount)
ID = 3100
attr = S, HA
damage = 60, 7
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 12, 12
guard.pausetime = 12, 12
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 50) * (var(36) := 111), var(37) := -64
hitsound = -1 + 0 * (var(31) := 3)
guardsound = -1
p2facing = 1
ground.type = Low
ground.slidetime = 32
ground.hittime = 32
ground.velocity = 0, 0
guard.velocity = -10.52
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.type = Low
air.velocity = 0, -4
getpower = 0
givepower = 36, 36
envshake.time = 12
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
forcestand = 1
yaccel = 0.4850
forcestand = 1

[State 3100, Switch]
type = changeanim
trigger1 = anim = 3100
trigger1 = movehit = 1
trigger1 = animelemtime(7) >= 1 && animelemtime(8) < 1
value = 3101

[State 3100, Vel]
type = velset
trigger1 = anim = 3101 && animelemtime(5) >= 0 && animelemtime(7) < 0 && fvar(16) > 0
x = 5
[State 3100, Vel]
type = velset
trigger1 = anim = 3101 && animelem = 7
x = 12
y = -11
[State 3100, Vel]
type = velmul
trigger1 = 1
x = 0.88
[State 3100, Vel]
type = velmul
trigger1 = vel y > 0
x = 0

[State 3100, Type]
type = statetypeset
trigger1 = anim = 3101 && animelemtime(7) >= 0
trigger2 = anim = 1101
statetype = A
physics = N

[State 3100, Type]
type = veladd
trigger1 = anim = 3101 && animelemtime(7) >= 0
trigger2 = anim = 1101
y = 0.5

[State 3100, Anim]
type = changeanim
trigger1 = anim = 3101 && animelemtime(7) > 0 && vel y > -5
value = 1101
persistent = 0

[State 3100, Snd]
type = playsnd
trigger1 = anim = 3101 && animelem = 6 && !var(51)
value = 4, 1
channel = 0
ignorehitpause = 1
persistent = 0

[State 3100, Shin var]
type = varset
trigger1 = !time
var(51) = 0

[State 3100, Shin var]
type = poweradd
triggerall = anim = 3101 && animelemtime(5) < 0 && power >= 2000
trigger1 = !AIlevel
trigger1 = command = "236236kk+"
trigger2 = AIlevel && animelem = 5 && (fvar(16) = [0, 30]) && random < 666
value = -2000 + 0 * (var(51) := 1)
ignorehitpause = 1
persistent = 0

[State 3100, Shin palfx]
type = palfx
trigger1 = anim = 3101 && animelemtime(5) < 0 && var(51)
time = 20
add = 255, 255, 255
sinadd = -255, -255, -255, 80
ignorehitpause = 1
persistent = 0

[State 3100, Shin Shoryuken]
type = changestate
trigger1 = anim = 3101 && animelem = 5 && var(51)
value = 3120

[State 3100, Snd]
type = playsnd
trigger1 = anim = 3101 && animelem = 7
value = 0, 41
[State 3100, Dust]
type = helper
trigger1 = anim = 3101 && animelem = 7
helpertype = normal
stateno = 7100
ID = 7100
name = "Dust"
postype = p1
ownpal = 1

[State 3100, Dust]
type = helper
trigger1 = anim = 3101 && animelem = 6
helpertype = normal
stateno = 3125
ID = 3125
name = "B&W Dust"
postype = p1
pos = ceil(p2dist x /2.0), 0
ownpal = 1
ignorehitpause = 1
size.xscale = 2
size.yscale = 2

[State 3100, Low Hit]
type = hitdef
trigger1 = animelem = 6 && anim = 3101
trigger1 = var(15) < (2 + hitcount)
ID = 3100
attr = S, HA
damage = 60, 7
animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 16, 16
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 111), var(37) := -79
hitsound = -1 + 0 * (var(31) := 3)
guardsound = -1
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = 0, -6
air.type = Low
air.velocity = 0, -6
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
getpower = 0
givepower = 36, 36
envshake.time = 12
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
fall = 1
fall.recover = 0
fall.animtype = Medium
yaccel = 0.4850
forcestand = 1

[State 3100, Shoryuu Hit]
type = hitdef
trigger1 = animelem = 7 && anim = 3101
trigger1 = var(15) < (2 + hitcount)
ID = 3100
attr = A, HA
damage = 60, 7
animtype = Up
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 6, 6
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 111), var(37) := -106
hitsound = -1 + 0 * (var(31) := 3)
guardsound = -1
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -4, -12
air.type = Low
air.velocity = -4, -12
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = 0
givepower = 36, 36
envshake.time = 12
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
fall = 1
fall.recover = 0
yaccel = 0.4850
forcestand = 1

[State Idle]
type = statetypeset
trigger1 = anim = 3100 && animelemtime(8) >= 0
trigger2 = anim = 1101
movetype = I

[State 3100, End]
type = changestate
trigger1 = anim = 3100 && !animtime
value = 0
ctrl = 1

[State Land]
type = changestate
trigger1 = statetype = A
trigger1 = vel y > 0 && (pos y > -vel y)
value = 3102


;---Land---
[Statedef 3102]
type = S
physics = C
movetype = I
anim = 3102
ctrl = 0
velset = 0, 0
sprpriority = 1
movehitpersist = 1
hitcountpersist = 1

[State 3102, Pos]
type = posset
trigger1 = 1
y = 0

[State 3102, Snd]
type = playsnd
trigger1 = !time
value = 0, 52
[State 3102, Dust]
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

[State 3102, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1


;======================<SHIN SHORYUU KEN>=============================
[Statedef 3120]
type = S
physics = S
movetype = A
anim = 3120
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = ifelse(prevstateno = 3100, 0, -3000)
facep2 = (prevstateno != 3100)

[State 3120, Custom Combo End]
type = palfx
trigger1 = !time
trigger1 = var(20) > 0
trigger1 = (var(20) := 0) || (var(15) := 0) || 1
time = 1

[State 3120, Strength]
type = varset
trigger1 = var(10) != 7
var(10) = 7
ignorehitpause = 1

[State 3120, Pos]
type = posadd
trigger1 = !time
trigger1 = anim = 3120 && (prevstateno = 212 || prevstateno = 214)
x = ifelse((prevstateno = 212), 30, 21)

[State 3120, Snd]
type = playsnd
trigger1 = time = 3
value = 4, 9
channel = 0

[State 3120, Super Pause FX]
type = helper
trigger1 = fvar(31)
trigger1 = time = 3
trigger1 = prevstateno != 3100
helpertype = normal
stateno = 7520
ID = 7500
name = "Superpause FX"
postype = p1
pos = ceil(-25 * const(size.xscale)), ceil(-57 * const(size.yscale))
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3120, Super Pause]
type = superpause
trigger1 = time = 3
trigger1 = prevstateno != 3100
time = 47
movetime = 47
anim = ifelse(fvar(31), -1, 102)
pos = ceil(-25 * const(size.xscale)), ceil(-57 * const(size.yscale))
sound = s0, 8520
darken = ifelse(fvar(31), 0, 1)
p2defmul = 1 + (0 * (fvar(5) := 0))

[State 3120, NHB]
type = nothitby
trigger1 = anim = 3120 && animelemtime(5) < 0
trigger2 = (anim = 3120 && animelemtime(2) >= 0 && animelemtime(5) < 0) && movehit
trigger3 = (anim = 3121 && animelemtime(4) < 0) && movehit
time = 1
value = SCA
ignorehitpause = 1

[State 3120, Width]
type = width
trigger1 = anim = 3120 && animelemtime(4) >= 0 && animelemtime(5) < 0 && movehit
trigger2 = anim = 3121 && animelemtime(4) < 0
player = -28, 0
ignorehitpause = 1

[State 3120, Width]
type = width
trigger1 = anim = 3121 && animelemtime(4) >= 0
player = -10, 0
edge = const(size.air.front)
ignorehitpause = 1

[State 3120, Switch]
type = changeanim
trigger1 = anim = 3120
trigger1 = animelemtime(4) > 0 && animelemtime(5) <= 0 && movehit
value = 3121

[State 3120, Switch]
type = changeanim
trigger1 = !time
trigger1 = prevstateno = 3100
value = 3120
elem = 3

[State 3120, Vel]
type = velset
trigger1 = anim = 3120 && animelem = 5
trigger2 = anim = 3121 && animelem = 4
x = ifelse(anim = 3121, 2, 12)
y = ifelse(anim = 3121, -14, -12)
[State 3120, Vel]
type = velmul
trigger1 = 1
x = 0.88
[State 3120, Vel]
type = velmul
trigger1 = vel y > 0
x = 0

[State 3120, Snd]
type = playsnd
trigger1 = anim = 3120 && animelem = 5
trigger2 = anim = 3121 && animelem = 4
value = 0, 41
[State 3120, Dust]
type = helper
trigger1 = anim = 3120 && animelem = 5
trigger2 = anim = 3121 && animelem = 4
helpertype = normal
stateno = 7100
ID = 7100
name = "Dust"
postype = p1
ownpal = 1

[State 3120, lowhits]
type = hitdef
trigger1 = animelem = 4 && anim = 3120
trigger1 = var(15) < (1 + hitcount)
trigger2 = animelem = 3 && anim = 3121
trigger1 = var(15) < (1 + hitcount)
ID = 3120
attr = S, HA
damage = ifelse(prevstateno = 3100, 90, 180), ifelse(prevstateno = 3100, 11, 22)
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(anim = 3120, 60, 45), ifelse(anim = 3120, 50, 45)
guard.pausetime = 12, 12
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 111), var(37) := ifelse((anim = 3120), -79, -90)
hitsound = -1 + 0 * (var(31) := 9)
guardsound = -1
p2facing = 1
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = 0.77, -6;ifelse((anim = 3121), 0, (p2dist x) / 22.0), -6
ground.cornerpush.veloff = 0
air.type = Low
air.velocity = 0.77, -6;ifelse((anim = 3121), 0, (p2dist x) / 22.0), -6
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = 0
givepower = 36, 36
envshake.time = 24
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
fall = 1
fall.recover = 0
kill = ifelse(anim = 3120, (numenemy > 1), (numtarget != numenemy))
yaccel = 0.4850
forcestand = 1

[State 3120, shoryuuhits]
type = hitdef
trigger1 = anim = 3120 && animelemtime(5) >= 0 && !(animelemtime(5) % 3)
trigger1 = var(15) < (3 + hitcount)
attr = A, HA
damage = 40, 7
animtype = Up
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 6, 6
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 111), var(37) := -106
hitsound = -1 + 0 * (var(31) := 3)
guardsound = -1
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -3, -10
air.type = Low
air.velocity = -3, -10
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = 0
givepower = 36, 36
envshake.time = 12
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
fall = 1
fall.recover = 0
yaccel = 0.4850
forcestand = 1

[State 3120, shinshoryuuhits]
type = hitdef
trigger1 = (animelem = 4 || animelem = 5) && anim = 3121
trigger1 = var(15) < (1 + hitcount)
ID = 3120
attr = A, HA
damage = 180, 22
animtype = Up
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse((animelem = 5), 36, 12), ifelse((animelem = 5), 36, 12)
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 111), var(37) := -103
hitsound = -1 + 0 * (var(31) := ifelse((animelem = 5), 10, 9))
guardsound = -1
p2facing = 1
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = ifelse((animelem = 4), 0, -2), ifelse((animelem = 4), -12, -21)
air.type = Low
air.velocity = ifelse((animelem = 4), 0, -2), ifelse((animelem = 4), -12, -21)
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = 0
givepower = 36, 36
envshake.time = 24
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -4, 4)
fall = 1
fall.recover = 0
fall.envshake.time = 12
fall.envshake.freq = 180
fall.envshake.ampl = ifelse((gametime % 2), -2, 2)
kill = (numtarget != numenemy) || (animelem = 5)
yaccel = 0.4850
forcestand = 1

[State 3120, Juggle Reset]
type = varset
trigger1 = movehit = 1 && numtarget(3120)
var(15) = 0
ignorehitpause = 1

[State 3120, Push]
type = playerpush
trigger1 = numtarget(3120) = 1
value = 0
ignorehitpause = 1

[State 3120, Bind]
type = targetbind
trigger1 = movehit = 1 && numtarget(3120) = 1
trigger1 = (target, stateno != [120, 155]) && !(target(3120), hitshakeover)
trigger1 = anim = 3120 && animelemtime(4) >= 0 && animelemtime(5) < 0
ID = 3120
pos = 36, -80 - target(3120), const(size.mid.pos.y)
ignorehitpause = 1
persistent = 0

[State 3120, Bind]
type = targetbind
trigger1 = movehit = 1 && numtarget(3120) = 1
trigger1 = (target, stateno != [120, 155]) && !(target(3120), hitshakeover)
trigger1 = anim = 3121 && animelemtime(3) >= 0 && animelemtime(4) < 0
ID = 3120
pos = 26, -92 - target(3120), const(size.mid.pos.y)
ignorehitpause = 1
persistent = 0

[State 3120, Sparks]
type = helper
triggerall = movehit = 1 && numtarget
triggerall = (target, movetype = H) && !(target, time)
trigger1 = anim = 3120 && animelemtime(4) >= 0 && animelemtime(5) < 0
trigger2 = anim = 3121
helpertype = normal
stateno = 7050
ID = 7050
name = "Shin Shoryuken Spark"
postype = p1
facing = ifelse(p2dist x < 0, -1, 1)
pos = ceil(cond(p2dist x > (var(36) * const(size.xscale)), (var(36) * const(size.xscale)), cond(p2dist x > (var(35) * const(size.xscale)), p2dist x, (var(35) * const(size.xscale))))), ceil(var(37) * const(size.yscale))
ownpal = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

;[State 3120, Zoom]
;type = zoom
;trigger1 = movehit
;trigger1 = numenemy + numpartner = 1
;trigger1 = anim = 3120 || (anim = 3121 && animelemtime(5) <= 1)
;scale = 1 + 0.125 * hitcount;1.25
;pos = pos x, pos y
;ignorehitpause = 1

[State 3120, Snd]
type = playsnd
trigger1 = movehit = 1
trigger1 = anim = 3120 && animelemtime(5) <= 0
value = 3, 4
channel = 0
ignorehitpause = 1
persistent = 0

[State 3120, Snd]
type = playsnd
trigger1 = anim = 3120 && animelemtime(5) = 1
value = 4, 1
channel = 0
ignorehitpause = 1
persistent = 0

[State 3120, Snd]
type = playsnd
trigger1 = anim = 3121 && animelem = 1
value = 4, 4
channel = 0
ignorehitpause = 1
persistent = 0
[State 3120, Snd]
type = playsnd
trigger1 = anim = 3121 && animelem = 4
value = 4, 6
channel = 0
ignorehitpause = 1
persistent = 0

[State 3120, Dust]
type = helper
triggerall = movehit && numtarget
triggerall = (target, movetype = H) && !(target, time)
trigger1 = anim = 3120 && animelemtime(4) > 0 && animelemtime(5) < 0
trigger2 = anim = 3121 && animelemtime(5) < 0
helpertype = normal
stateno = 3125
ID = 3125
name = "B&W Dust"
postype = p1
ceil(p2dist x /2.0)
ownpal = 1
ignorehitpause = 1
size.xscale = 2
size.yscale = 2

[State 3120, Type]
type = statetypeset
trigger1 = anim = 3120 && animelemtime(5) >= 0
trigger2 = anim = 3121 && animelemtime(4) >= 0
trigger3 = anim = 1101 || anim = 3122
statetype = A
physics = N
[State 3120, Accel]
type = veladd
trigger1 = anim = 3120 && animelemtime(5) > 0
trigger2 = anim = 3121 && animelemtime(4) > 0
trigger3 = anim = 1101 || anim = 3122
y = 0.5

[State 3120, Anim]
type = changeanim
trigger1 = anim = 3120 && animelemtime(5) > 0 && vel y > -5
trigger2 = anim = 3121 && animelemtime(4) > 0 && vel y > -4
value = ifelse(anim = 3121, 3122, 1101)
persistent = 0

[State Idle]
type = statetypeset
trigger1 = anim = 1101 || anim = 3122
movetype = I

[State Land]
type = changestate
trigger1 = statetype = A
trigger1 = vel y > 0 && (pos y > -vel y)
value = ifelse(anim = 3122, 3123, 1108)


;---Land---
[Statedef 3123]
type = S
physics = S
movetype = I
anim = 3123
ctrl = 0
velset = 0, 0
sprpriority = 1
movehitpersist = 1
hitcountpersist = 1

[State 3123, Pos]
type = posset
trigger1 = 1
y = 0

[State 3123, Snd]
type = playsnd
trigger1 = !time
value = 0, 52
[State 3123, Dust]
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

[State 3123, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<MESSATSU GOU SHORYUU>=============================
[Statedef 3140]
type = S
physics = S
movetype = A
ctrl = 0
anim = 3140
velset = 0, 0
sprpriority = 1
poweradd = -1000
facep2 = 1

[State 3140, Custom Combo End]
type = palfx
trigger1 = !time
trigger1 = var(20) > 0
trigger1 = (var(20) := 0) || (var(15) := 0) || 1
time = 1

[State 3140, Strength]
type = varset
trigger1 = var(10) != 5
var(10) = 5
ignorehitpause = 1

[State 3140, Button]
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

[State 3140, Button AI]
type = varset
trigger1 = time <= 0 && AIlevel
var(11) = 2
ignorehitpause = 1

[State 3140, Snd]
type = playsnd
trigger1 = time = 3
value = ifelse(var(1) = 2, 14, 4), 10 -(var(1) = 2)
channel = 0

[State 3140, Super Pause FX]
type = helper
trigger1 = fvar(31)
trigger1 = time = 3
helpertype = normal
stateno = 7500
ID = 7500
name = "Superpause FX"
postype = p1
pos = ceil(12 * const(size.xscale)), ceil(-48 * const(size.yscale))
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3140, Super Pause]
type = superpause
trigger1 = time = 3
time = 43
movetime = 43
anim = ifelse(fvar(31), -1, 100)
pos = ceil(12 * const(size.xscale)), ceil(-48 * const(size.yscale))
sound = s0, 8500
darken = ifelse(fvar(31), 0, 1)
p2defmul = 1 + (0 * (fvar(5) := 0))

[State 3140, NHB]
type = nothitby
trigger1 = anim = 3140 && animelemtime(3) < 0
time = 1
value = SCA
ignorehitpause = 1

[State 3140, Vel]
type = velset
trigger1 = anim = 3140 && (animelem = 2 || animelem = 14)
x = ifelse(var(11) = 2, 12, ifelse(var(11) = 1, 10.5, 9))

[State 3140, Vel]
type = velset
trigger1 = anim = 3140 && animelem = 26
x = ifelse(var(11) = 2, 20, ifelse(var(11) = 1, 17.5, 15))

[State 3140, Dust]
type = explod
trigger1 = anim = 3140 && (animelem = 2 || animelem = 14 || animelem = 26)
anim = 7103
ID = 7103
sprpriority = 3
postype = p1
ownpal = 1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1

[State 3140, Snd]
type = playsnd
trigger1 = anim = 3140 && (animelem = 4 || animelem = 16 || animelem = 28) && var(1) = 2
value = 13, ifelse((animelem = 4), 0, ifelse((animelem = 16), 3, 2))
channel = 0
[State 3140, Snd]
type = playsnd
trigger1 = anim = 3140 && (animelem = 4 || animelem = 16 || animelem = 28) && var(1) != 2
value = 3, ifelse((animelem = 4), 6, ifelse((animelem = 16), 7, 3))
channel = 0

[State 3140, Snd]
type = playsnd
trigger1 = anim = 3140 && (animelem = 4 || animelem = 16)
value = 1, 5
channel = 1
[State 3140, Snd]
type = playsnd
trigger1 = anim = 3140 && animelem = 28
value = 1, 6
channel = 1

[State 3140, Snd]
type = playsnd
trigger1 = anim = 3140 && animelemtime(28) = 1
value = 0, 41
[State 3140, Dust]
type = helper
trigger1 = anim = 3140 && animelem = 28
helpertype = normal
stateno = 7100
ID = 7100
name = "Dust"
postype = p1
ownpal = 1

[State 3140, Vel]
type = velset
trigger1 = anim = 3140 && animelemtime(28) = 1
y = -11

[State 3140, Vel]
type = velmul
trigger1 = vel y < 0
x = 0.86
[State 3140, Vel]
type = velmul
trigger1 = vel y > 0
x = 0

[State 3140, Type]
type = statetypeset
trigger1 = anim = 3140 && animelemtime(28) >= 1
trigger2 = anim = 1101
statetype = A
physics = N

[State 3140, Type]
type = veladd
trigger1 = anim = 3140 && animelemtime(28) >= 1
trigger2 = anim = 1101
y = 0.5

[State 3140, Anim]
type = changeanim
trigger1 = anim = 3140 && animelemtime(28) > 1 && vel y > -5.5
value = 1101
persistent = 0

[State 3140, Hit Low]
type = hitdef
trigger1 = animelem = 14 && anim = 3140
trigger1 = var(15) < (1 + hitcount)
attr = S, HA
damage = 40, 7
animtype = Medium
fall.animtype = Medium
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse((animelem = 24), 18, 6), ifelse((animelem = 24), 18, 6)
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 111), var(37) := -52
hitsound = -1 + 0 * (var(31) := 3)
guardsound = -1
ground.type = Low
ground.slidetime = 24
ground.hittime = 24
ground.velocity = -4, 0
ground.cornerpush.veloff = 0
air.velocity = -3.75, -3.75
getpower = 0
givepower = 36, 36
envshake.time = 12
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
yaccel = 0.4850
forcestand = 1
air.fall = 1
fall.recover = 0

[State 3140, Hit Low 2]
type = hitdef
trigger1 = (animelem = 3 || animelem = 15) && anim = 3140
trigger1 = var(15) < (2 + hitcount)
attr = S, HA
damage = 40, 7
animtype = Hard
fall.animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 6, 6
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 111), var(37) := -75
hitsound = -1 + 0 * (var(31) := 3)
guardsound = -1
ground.type = Low
ground.slidetime = 24
ground.hittime = 24
ground.velocity = -4, 0
ground.cornerpush.veloff = 0
air.velocity = -3.75, -3.75
getpower = 0
givepower = 36, 36
envshake.time = 12
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
yaccel = 0.4850
forcestand = 1
air.fall = 1
fall.recover = 0

[State 3140, Hit High]
type = hitdef
trigger1 = (animelem = 4 || animelem = 16) && anim = 3140
trigger1 = var(15) < (3 + hitcount)
attr = S, HA
damage = 40, 7
animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 6, 6
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 111), var(37) := -100
hitsound = -1 + 0 * (var(31) := 3)
guardsound = -1
ground.type = High
ground.slidetime = 24
ground.hittime = 24
ground.velocity = -4, 0
ground.cornerpush.veloff = 0
air.velocity = -3.75, -3.75
getpower = 0
givepower = 36, 36
envshake.time = 12
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
yaccel = 0.4850
forcestand = 1
air.fall = 1
fall.recover = 0

[State 3140, Hit Low 3]
type = hitdef
trigger1 = animelem = 26 && anim = 3140
trigger1 = var(15) < (1 + hitcount)
attr = S, HA
damage = 40, 7
animtype = Medium
fall.animtype = Medium
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 18, 18
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 111), var(37) := -52
hitsound = -1 + 0 * (var(31) := 3)
guardsound = -1
ground.type = Low
ground.slidetime = 24
ground.hittime = 24
ground.velocity = 0, -5.0
air.velocity = 0, -5.0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = 0
givepower = 36, 36
envshake.time = 12
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
fall = 1
fall.recover = 0
yaccel = 0.4850
forcestand = 1

[State 3140, Hit Low 4]
type = hitdef
trigger1 = animelem = 27 && anim = 3140
trigger1 = var(15) < (2 + hitcount)
attr = S, HA
damage = 40, 7
animtype = Hard
fall.animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 18, 18
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 111), var(37) := -75
hitsound = -1 + 0 * (var(31) := 3)
guardsound = -1
ground.type = Low
ground.slidetime = 24
ground.hittime = 24
ground.velocity = 0, -5.0
air.velocity = 0, -5.0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = 0
givepower = 36, 36
envshake.time = 12
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
fall = 1
fall.recover = 0
yaccel = 0.4850
forcestand = 1

[State 3140, Hit Final]
type = hitdef
trigger1 = animelem = 28 && anim = 3140
trigger1 = var(15) < (3 + hitcount)
persistent = 0
attr = A, HA
damage = 40, 7
animtype = Up
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 2, 2
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 111), var(37) := -100
hitsound = -1 + 0 * (var(31) := 3)
guardsound = -1
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -6, -12
air.velocity = -6, -12
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = 0
givepower = 36, 36
envshake.time = 12
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
fall = 1
fall.recover = 0
yaccel = 0.4850
forcestand = 1

[State Idle]
type = statetypeset
trigger1 = anim = 1101
movetype = I

[State Land]
type = changestate
trigger1 = statetype = A
trigger1 = vel y > 0 && (pos y > -vel y)
value = 1108


;======================<METSU SHORYUU KEN>=============================
[Statedef 3160]
type = S
physics = S
movetype = A
anim = 3160
ctrl = 0
velset = 0, 0
poweradd = -2000
facep2 = 1
sprpriority = 1

[State 3160, Custom Combo End]
type = palfx
trigger1 = !time
trigger1 = var(20) > 0
trigger1 = (var(20) := 0) || (var(15) := 0) || 1
time = 1

[State 3160, Strength]
type = varset
trigger1 = var(10) != 6
var(10) = 6
ignorehitpause = 1

[State 3160, Width]
type = width
trigger1 = anim = 3160 && animelemtime(7) >= 0 && animelemtime(9) < 0
player = 20, 0

[State 3160, Snd]
type = playsnd
trigger1 = time = 3
value = 3 + (var(1) = 2) * 11, 5 + (var(1) = 2)
channel = 0

[State 3160, Super Pause FX]
type = helper
trigger1 = fvar(31)
trigger1 = time = 3
helpertype = normal
stateno = 7510
ID = 7500
name = "Superpause FX"
postype = p1
pos = ceil(3 * const(size.xscale)), ceil(-66 * const(size.yscale))
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3160, Super Pause]
type = superpause
trigger1 = time = 3
time = 45
movetime = 45
anim = ifelse(fvar(31), -1, 101)
pos = ceil(3 * const(size.xscale)), ceil(-66 * const(size.yscale))
sound = s0, 8510
darken = ifelse(fvar(31), 0, 1)
p2defmul = 1 + (0 * (fvar(5) := 0))

[State 3160, NHB]
type = nothitby
trigger1 = anim = 3160 && animelemtime(8) < 1
time = 1
value = SCA

[State 3160, Pos]
type = posadd
trigger1 = anim = 3160
trigger1 = animelem = 2 || animelem = 4
x = 6

[State 3160, Vel]
type = velset
trigger1 = anim = 3160 && animelemtime(6) >= 0 && animelemtime(8) < 0
x = 12
[State 3160, Snd]
type = playsnd
trigger1 = anim = 3160 && animelem = 6
value = 5, 12
[State 3160, Dust]
type = explod
trigger1 = anim = 3160 && animelemtime(6) >= 0 && vel x > 0.5 && !(time % 2)
anim = 7103
ID = 7103
sprpriority = 3
postype = p1
pos = 45, 0
vel = -2, 0
ownpal = 1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1

[State 3160, Snd]
type = playsnd
trigger1 = anim = 3160 && animelem = 6
value = ifelse(var(1) = 2, 13, 3), 2 + (var(1) = 2) * 2
channel = 0

[State 3160, Hit Elbow]
type = hitdef
trigger1 = anim = 3160 && animelem = 8
attr = S, HA
damage = 120, 15
animtype = Hard
fall.animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 0, 12
guard.pausetime = 12, 12
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 111), var(37) := -64
hitsound = -1 + 0 * (var(31) := 3)
guardsound = -1
p2facing = 1
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
guard.hittime = 16
p2facing = 1
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
air.type = Low
air.velocity = 0, 0
getpower = 0
givepower = 36, 36
envshake.time = 12
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -3, 3)
forcestand = 1
yaccel = 0.4850
ID = 3160
forcestand = 1

[State 3160, P2 State]
type = targetstate
trigger1 = anim = 3160
trigger1 = animelemtime(8) >= 0 && animelemtime(9) < 0
trigger1 = movehit = 1 && numtarget(3160)
value = 3162
ID = 3160
ignorehitpause = 1
[State 3160, Switch]
type = changeanim
trigger1 = anim = 3160 && animelemtime(9) >= 0 && animelemtime(10) < 0 && movehit
value = 3161

[State 3160, Vel]
type = velmul
trigger1 = statetype = A
x = 0.88

[State 3160, Snd]
type = playsnd
trigger1 = anim = 3161 && animelem = 13
value = 0, 41
[State 3160, Dust]
type = helper
trigger1 = anim = 3161 && animelem = 13
helpertype = normal
stateno = 7100
ID = 7100
name = "Dust"
postype = p1
ownpal = 1

[State 3160, Type]
type = statetypeset
trigger1 = anim = 3161 && animelemtime(13) >= 0
trigger2 = anim = 1101
statetype = A
physics = N

[State 3160, Type]
type = veladd
trigger1 = anim = 3161 && animelemtime(13) >= 0
trigger2 = anim = 1101
y = 0.5

[State 3160, Shake]
type = offset
trigger1 = anim = 3161 && animelemtime(9) >= 1 && animelemtime(10) < 0
x = ifelse((animelemtime(13) % 2), 1, -1)

[State 3160, Vel]
type = velset
trigger1 = anim = 3161 && animelem = 4
x = 6
[State 3160, Vel]
type = velset
trigger1 = anim = 3161 && animelem = 13
x = 18
y = -12;-14

[State 3160, Anim]
type = changeanim
trigger1 = anim = 3161 && animelemtime(13) > 0 && vel y > -4
value = 1101
persistent = 0

[State 3160, Snd]
type = playsnd
trigger1 = anim = 3161 && animelem = 10
value = ifelse(var(1) = 2, 14, 4), 6 -(var(1) = 2) * 5
channel = 0

[State 3160, Dust]
type = helper
trigger1 = anim = 3161 && animelem = 12
helpertype = normal
stateno = 3125
ID = 3125
name = "B&W Dust"
postype = p1
pos = 0, 0
ownpal = 1
ignorehitpause = 1
persistent = 0
size.xscale = 2
size.yscale = 2

[State 3160, fire]
type = helper
trigger1 = anim = 3161 && animelem = 13 && !numhelper(3165)
helpertype = normal
stateno = 3165
ID = 3165
name = "Metsu Shoryuu Fire"
postype = p1
ownpal = 1
ignorehitpause = 1
persistent = 0

[State 3160, Snd]
type = playsnd
trigger1 = anim = 3161 && animelem = 5
value = 5, 13

[State 3160, Snd]
type = playsnd
trigger1 = anim = 3161 && animelem = 13
value = 5, 18

[State 3160, bgpal]
type = bgpalfx
trigger1 = anim = 3161 && animelem = 5
sinadd = -64, -64, -64, 80
time = 40

[State 3160, focus]
type = explod
trigger1 = anim = 3161 && animelem = 5
anim = 3167
sprpriority = 3
postype = p1
pos = 12, -25
bindtime = -1
removeongethit = 1

[State 3160, Hit Low]
type = hitdef
trigger1 = animelem = 12 && anim = 3161
attr = S, HA
damage = 80, 10
animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 4, 4
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 111), var(37) := -75
hitsound = -1 + 0 * (var(31) := 3)
guardsound = -1
p2facing = 1
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
p2facing = 1
ground.velocity = 0.5, -7.5
air.type = Low
air.velocity = 0.5, -7.5
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = 0
givepower = 36, 36
envshake.time = 12
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -3, 3)
fall = 1
fall.recover = 0
fall.animtype = Medium
yaccel = 0.4850
forcestand = 1

[State 3160, Shoryuu Hit]
type = hitdef
trigger1 = anim = 3161
trigger1 = animelemtime(13) >= 0 && !(animelemtime(13) % 2)
attr = A, HA
damage = 30, 7
animtype = Diagup
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 4, 4
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 111), var(37) := -106
hitsound = -1 + 0 * (var(31) := 3)
guardsound = -1
p2facing = 1
ground.type = High
ground.slidetime = 16
ground.hittime = 16
p2facing = 1
ground.velocity = -3, -10
air.type = Low
air.velocity = -3, ifelse(hitcount >= 10, -14, -10)
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = 0
givepower = 36, 36
envshake.time = 12
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
fall = 1
fall.recover = 0
yaccel = 0.4850
forcestand = 1

[State 3160, Juggle Reset]
type = varset
trigger1 = movehit = 1
trigger1 = hitcount >= 10
var(15) = 0
ignorehitpause = 1

[State 3160, Sparks]
type = helper
trigger1 = movehit = 1 && numtarget
trigger1 = (target, movetype = H) && !(target, time)
trigger1 = anim = 3160 && animelemtime(8) >= 0 && animelemtime(9) < 0
helpertype = normal
stateno = 7050
ID = 7050
name = "Shin Shoryuken Spark"
postype = p1
facing = ifelse(p2dist x < 0, -1, 1)
pos = ceil(cond(p2dist x > (var(36) * const(size.xscale)), (var(36) * const(size.xscale)), cond(p2dist x > (var(35) * const(size.xscale)), p2dist x, (var(35) * const(size.xscale))))), ceil(var(37) * const(size.yscale))
ownpal = 1
facing = -1
ignorehitpause = 1
pausemovetime = 255
supermovetime = 255

[State Idle]
type = statetypeset
trigger1 = anim = 3160 && animelemtime(9) >= 0
trigger2 = anim = 1101
movetype = I

[State 3160, End]
type = changestate
trigger1 = anim = 3160 && !animtime
value = 0
ctrl = 1

[State Land]
type = changestate
trigger1 = statetype = A
trigger1 = vel y > 0 && (pos y > -vel y)
value = 3102


;----- TARGET -----
[Statedef 3162]
type = S
physics = S
movetype = H
ctrl = 0
velset = 0, 0

[State 3162, NHB];shinkuu hadouken fix
type = nothitby
trigger1 = time < 24
value = SCA

[State 3162, Pos]
type = posset
trigger1 = 1
y = 0
[State 3162, fall]
type = hitfallset
trigger1 = 1
value = 0

[State 3162, Anim]
type = changeanim
trigger1 = time < 24
value = 5012
[State 3162, Anim]
type = changeanim
trigger1 = time = 24
value = 5017
[State 3162, Anim]
type = changeanim
trigger1 = time = 32
value = 5300

[State 3162, Shake]
type = offset
trigger1 = time <= 24
x = ifelse((time % 2), 1, -1)

[State 3162, No PalFX]
type = palfx
trigger1 = !time
time = 1
add = 0, 0, 0

[State 3162, End]
type = selfstate
trigger1 = time >= 90
value = 5001


;======================<REPPU JINRAI SHOU>=============================
[Statedef 3180]
type = S
physics = S
movetype = A
anim = 3180
ctrl = 0
velset = 0, 0
poweradd = -1000
sprpriority = 1
facep2 = 1

[State 3180, Custom Combo End]
type = palfx
trigger1 = !time
trigger1 = var(20) > 0
trigger1 = (var(20) := 0) || (var(15) := 0) || 1
time = 1

[State 3180, Strength]
type = varset
trigger1 = var(10) != 5
var(10) = 5
ignorehitpause = 1

[State 3180, Snd]
type = playsnd
trigger1 = time = 3
value = 4, 8
channel = 0

[State 3180, Super Pause FX]
type = helper
trigger1 = fvar(31)
trigger1 = time = 3
helpertype = normal
stateno = 7500
ID = 7500
name = "Superpause FX"
postype = p1
pos = ceil(0 * const(size.xscale)), ceil(-80 * const(size.yscale))
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3180, Super Pause]
type = superpause
trigger1 = time = 3
time = 43
movetime = 43
anim = ifelse(fvar(31), -1, 100)
pos = ceil(0 * const(size.xscale)), ceil(-80 * const(size.yscale))
sound = s0, 8500
darken = ifelse(fvar(31), 0, 1)
p2defmul = 1 + (0 * (fvar(5) := 0))


[State 3180, NHB]
type = nothitby
trigger1 = animelemtime(12) < 0
time = 1
value = SCA

[State 3180, Vel]
type = velset
trigger1 = animelem = 10 || animelem = 17 || animelem = 29
x = 6
[State 3180, Vel]
type = velset
trigger1 = animelem = 34
x = 9
[State 3180, Dust]
type = explod
trigger1 = animelem = 10 || animelem = 17 || animelem = 29 || animelem = 34
anim = 7103
ID = 7103
sprpriority = 3
postype = p1
pos = 31, 0
vel = 1, 0
ownpal = 1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1

[State 3180, Snd]
type = playsnd
trigger1 = animelem = 11 || animelem = 14 || animelem = 23 || animelem = 26
value = 3, 6
channel = 0
[State 3180, Snd]
type = playsnd
trigger1 = animelem = 17 || animelem = 29
value = 3, 7
channel = 0
[State 3180, Snd]
type = playsnd
trigger1 = animelem = 34
value = 3, 4
channel = 0

[State 3180, Snd]
type = playsnd
trigger1 = animelem = 11 || animelem = 23
value = 1, 1
channel = 1
[State 3180, Snd]
type = playsnd
trigger1 = animelem = 14 || animelem = 26
value = 1, 2
channel = 1
[State 3180, Snd]
type = playsnd
trigger1 = animelem = 18 || animelem = 30 || animelem = 34
value = 1, 3
channel = 1

[State 3180, highhits]
type = hitdef
trigger1 = animelem = 11 || animelem = 14 || animelem = 23 || animelem = 26
attr = S, HA
damage = 30, 7
animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 2, 2
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 111), var(37) := -86
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1
ground.type = High
ground.slidetime = 32
ground.hittime = 32
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
air.type = Low
air.velocity = -5, -7
getpower = 0
givepower = 36, 36
envshake.time = 12
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
forcestand = 1
yaccel = 0.4850
air.fall = 1
fall.recover = 0

[State 3180, lowhits]
type = hitdef
trigger1 = animelem = 18 || animelem = 30
attr = S, HA
damage = 40, 7
animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 2, 2
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 111), var(37) := -60
hitsound = -1 + 0 * (var(31) := 3)
guardsound = -1
ground.type = Low
ground.slidetime = 32
ground.hittime = 32
ground.velocity = -4.49, 0
ground.cornerpush.veloff = 0
air.type = Low
air.velocity = -5, -7
getpower = 0
givepower = 36, 36
envshake.time = 12
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
forcestand = 1
yaccel = 0.4850
air.fall = 1
fall.recover = 0

[State 3180, uppercut]
type = hitdef
trigger1 = animelem = 35
ID = 3180
attr = S, HA
damage = 60, 7
animtype = Up
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 12, 12
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 111), var(37) := -77
hitsound = -1 + 0 * (var(31) := 3)
guardsound = -1
p2facing = 1
ground.type = Low
ground.slidetime = 20
ground.hittime = 20
ground.velocity = -2, -13
air.type = Low
air.velocity = -2, -13
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = 0
givepower = 36, 36
envshake.time = 12
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
forcestand = 1
yaccel = 0.4850
forcestand = 1
fall = 1
fall.recover = 0

[State Idle]
type = statetypeset
trigger1 = animelemtime(36) >= 0
movetype = I

[State 3180, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<SHINKUU TATSUMAKI SENPUU KYAKKU>=============================
[Statedef 3200]
type = S
physics = S
movetype = A
anim = 3200
ctrl = 0
velset = 0, 0
poweradd = -1000
facep2 = 1
sprpriority = 1

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
trigger1 = var(1) != 3
value = ifelse(var(1) = 2, 14, 4), 3
channel = 0

[State 3200, Snd]
type = playsnd
trigger1 = time = 3
trigger1 = var(1) = 3
value = 4, 99
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
pos = ceil(-32 * const(size.xscale)), ceil(-16 * const(size.yscale))
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
pos = ceil(-32 * const(size.xscale)), ceil(-16 * const(size.yscale))
sound = s0, 8500
darken = ifelse(fvar(31), 0, 1)
p2defmul = 1 + (0 * (fvar(5) := 0))

[State 3200, NHB]
type = nothitby
trigger1 = anim = 3200
time = 1
value = SCA
[State 3200, Width]
type = width
trigger1 = (anim = [3201, 3202]) && movehit
edge = 50, 35

[State 3200, Snd]
type = playsnd
trigger1 = anim = 3200 && animelem = 5
value = 0, 41

[State 3200, Dust]
type = helper
trigger1 = anim = 3200 && animelem = 5
helpertype = normal
stateno = 7100
ID = 7100
name = "Dust"
postype = p1
ownpal = 1

[State 3200, Vel]
type = velmul
trigger1 = vel x
x = 0.85

[State 3200, Vel]
type = velset
trigger1 = var(1) = 1
trigger1 = anim = 3200 && animelem = 5
x = ifelse(var(11) = 2, 6, ifelse(var(11) = 0, -6,0))

[State 3200, Vel]
type = velset
trigger1 = anim = 3200 && animelem = 5
y = -5.05

[State 3200, Anim]
type = changeanim
trigger1 = anim = 3200 && !animtime
;value = ifelse(var(1) = 1, 3201, 3202)
value = ifelse(var(1) = 2, 3202, 3201)

[State 3200, Snd]
type = playsnd
trigger1 = anim = [3201, 3202]
value = ifelse(var(1) = 2, 14, 4), ifelse(var(1) = 2, 12, 14)
channel = 0
persistent = 0

[State 3200, Vel]
type = velset
trigger1 = var(1) != 2
trigger1 = anim = [3201, 3202]
y = ifelse(var(1) = 2, -0.5, 0.15)

[State 3200, Vel]
type = velset
trigger1 = var(1) = 2
trigger1 = anim = [3201, 3202]
y = ifelse(var(11) = 2, -0.6, ifelse(var(11) = 1, -0.4, -0.2))

[State 3200, Push]
type = playerpush
trigger1 = anim = 3201 || anim = 3202 || anim = 3203
value = 0
ignorehitpause = 1

[State 3200, Snd]
type = playsnd
triggerall = anim = 3201 || anim = 3202
trigger1 = animelem = 1 || animelem = 7 || animelem = 13 || animelem = 19 || animelem = 25 || animelem = 31 || animelem = 37
value = 1, ifelse((anim = 3202), 1, 6)
channel = 1

[State 3200, Anim]
type = changeanim
trigger1 = (anim = [3201, 3202]) && !animtime
value = 3203
persistent = 0

[State 3200, Type]
type = statetypeset
trigger1 = anim = 3200 && animelemtime(5) >= 0
trigger2 = anim = 3203 && animelemtime(1) >= 1
statetype = A
physics = N

[State 3200, Type]
type = veladd
trigger1 = anim = 3200 && animelemtime(5) >= 0
trigger2 = anim = 3203 && animelemtime(1) >= 1
y = 0.5

[State 3200, Type]
type = statetypeset
trigger1 = anim = 3200 && animtime = -1
trigger2 = anim = [3201, 3202]
statetype = A
physics = N

[State 3200, Hit]
type = hitdef
trigger1 = anim = 3201 && (animelem = 2 || animelem = 8 || animelem = 14 || animelem = 20 || animelem = 26 || animelem = 32)
trigger1 = var(15) < 10
attr = A, HA
damage = 25, 3
animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 5, 0
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 64), var(37) := -70
hitsound = -1 + 0 * (var(31) := 6)
guardsound = -1
ground.type = High
ground.slidetime = 16
ground.hittime = 16
p2facing = 1
ground.velocity = ifelse((p2dist x != [-64, 64]), 22, 16), 0
ground.cornerpush.veloff = 0
guard.velocity = 10.52
air.type = Low
air.velocity = ifelse((p2dist x != [-30, 30]), 6, 5), ifelse(p2dist y < (-60 - enemy, const(size.mid.pos.y)), -1.5, -4.0) + vel y
getpower = 0
givepower = 36, 36
envshake.time = 12
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
air.fall = 1
fall.recover = 0
sprpriority = -1
forcestand = 1
yaccel = 0.4850
forcestand = 1

[State 3200, Hit]
type = hitdef
trigger1 = anim = 3201 && (animelem = 5 || animelem = 11 || animelem = 17 || animelem = 23 || animelem = 29 || animelem = 35)
trigger1 = var(15) < 10
attr = A, HA
damage = 25, 3
animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 5, 0
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := -60) * (var(36) := -30), var(37) := -70
hitsound = -1 + 0 * (var(31) := 6)
guardsound = -1
ground.type = High
ground.slidetime = 16
ground.hittime = 16
p2facing = -1
ground.velocity = ifelse((p2dist x != [-64, 64]), -22, -16), 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
air.type = Low
air.velocity = ifelse((p2dist x != [-30, 30]), -6, -5), ifelse(p2dist y < (-60 - enemy, const(size.mid.pos.y)), -1.5, -4.0) + vel y
getpower = 0
givepower = 36, 36
envshake.time = 12
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
air.fall = 1
fall.recover = 0
sprpriority = 1
forcestand = 1
yaccel = 0.4850
forcestand = 1

[State 3200, Hit Final]
type = hitdef
trigger1 = anim = 3201 && animelem = 38
trigger1 = var(15) < 10
attr = A, HA
damage = 25, 3
animtype = Diagup
air.animtype = Diagup
fall.animtype = Diagup
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 5, 0
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 64), var(37) := -70
hitsound = -1 + 0 * (var(31) := 6)
guardsound = -1
ground.type = High
ground.slidetime = 16
ground.hittime = 16
p2facing = 1
ground.velocity = -4, -8
air.type = Low
air.velocity = -4, -8
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = 0
givepower = 36, 36
envshake.time = 12
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
fall = 1
fall.recover = 0
sprpriority = 1
yaccel = 0.4850
forcestand = 1

[State 3200, Hit Evil]
type = hitdef
trigger1 = anim = 3202 && (animelem = 2 || animelem = 8 || animelem = 14 || animelem = 20 || animelem = 26 || animelem = 32)
trigger1 = var(15) < (2 + hitcount)
attr = A, HA
damage = 20, 3
animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 3, 0
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 64), var(37) := -70
hitsound = -1 + 0 * (var(31) := 6)
guardsound = -1
ground.type = High
ground.slidetime = 16
ground.hittime = 16
p2facing = 1
ground.velocity = ifelse(p2dist x > 30, 16, 14), ifelse(p2dist y < (-60 - enemy, const(size.mid.pos.y)), 0, -4.0) + vel y
air.type = Low
air.velocity = ifelse(p2dist x > 30, 16, 14), ifelse(p2dist y < (-60 - enemy, const(size.mid.pos.y)), 0, -4.0) + vel y
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = 0
givepower = 36, 36
envshake.time = 12
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
fall = 1
fall.recover = 0
sprpriority = -1
yaccel = 0.4850
forcestand = 1

[State 3200, Hit Evil Behind]
type = hitdef
trigger1 = anim = 3202 && (animelem = 5 || animelem = 11 || animelem = 17 || animelem = 23 || animelem = 29 || animelem = 35)
trigger1 = var(15) < (2 + hitcount)
attr = A, HA
damage = 20, 3
animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 3, 0
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := -60) * (var(36) := -30), var(37) := -70
hitsound = -1 + 0 * (var(31) := 6)
guardsound = -1
ground.type = High
ground.slidetime = 16
ground.hittime = 16
p2facing = -1
ground.velocity = ifelse(p2dist x > 30, -16, -14), ifelse(p2dist y < (-60 - enemy, const(size.mid.pos.y)), 0, -4.0) + vel y
air.type = Low
air.velocity = ifelse(p2dist x > 30, -16, -14), ifelse(p2dist y < (-60 - enemy, const(size.mid.pos.y)), 0, -4.0) + vel y
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = 0
givepower = 36, 36
envshake.time = 12
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
fall = 1
fall.recover = 0
sprpriority = 1
yaccel = 0.4850
forcestand = 1

[State 3200, Hit Evil Final]
type = hitdef
trigger1 = anim = 3202 && animelem = 38
trigger1 = var(15) < (2 + hitcount)
attr = A, HA
damage = 20, 3
animtype = Diagup
air.animtype = Diagup
fall.animtype = Diagup
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 3, 0
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 64), var(37) := -70
hitsound = -1 + 0 * (var(31) := 6)
guardsound = -1
ground.type = High
ground.slidetime = 16
ground.hittime = 16
p2facing = 1
ground.velocity = -6, -6
air.type = Low
air.velocity = -6, -6
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = 0
givepower = 36, 36
envshake.time = 12
envshake.freq = 180
envshake.ampl = ifelse((gametime % 2), -2, 2)
fall = 1
fall.recover = 0
sprpriority = 1
yaccel = 0.4850
forcestand = 1

[State 3200, Dust]
type = explod
trigger1 = (anim = [3201, 3202]) && !numexplod(3210)
anim = 3210
ID = 3210
sprpriority = -3
postype = p1
pos = 0, -ceil(pos y)
removetime = -1
ownpal = 1
removeongethit = 1
scale = 0.75, 0.75

[State 3200, Dust]
type = modifyexplod
trigger1 = numexplod(3210)
ID = 3210
postype = p1
pos = 0, -ceil(pos y)

[State 3200, Dust]
type = removeexplod
trigger1 = (anim != [3201, 3202]) && numexplod(3210)
ID = 3210

[State 3200, Dust]
type = explod
trigger1 = anim = [3201, 3202]
trigger1 = animelem = 5 || animelem = 11 || animelem = 17 || animelem = 23 || animelem = 29 || animelem = 35 || animelem = 41
anim = 3211
sprpriority = 1
postype = p1
pos = -10, -ceil(pos y)
vel = -3, 0
ownpal = 1

[State 3200, Dust]
type = explod
trigger1 = anim = [3201, 3202]
trigger1 = animelem = 2 || animelem = 8 || animelem = 14 || animelem = 20 || animelem = 26 || animelem = 32 || animelem = 38
anim = 3211
sprpriority = 1
postype = p1
facing = -1
pos = 10, -ceil(pos y)
vel = 3, 0
ownpal = 1

[State 3200, ^__^]
type = helper
trigger1 = !time && var(1) = 3
helpertype = normal
stateno = 3215
ID = 3215
name = "Cloud"
postype = back
pos = ceil(pos x) + 160, -260
supermovetime = 9999
persistent = 0

[State 3200, Vacuum]
type = helper
trigger1 = (anim = [3201, 3202]) && !numhelper(3205)
helpertype = normal
stateno = 3205
ID = 3205
name = "Vacuum"
postype = p2
pos = enemynear, const(size.ground.back) -25, -ceil(enemy, pos y)
persistent = 0
size.ground.back = 8
size.ground.front = 8
size.height = 240

[State Idle]
type = statetypeset
trigger1 = anim = 3203
trigger2 = anim = 3201 || anim = 3202
trigger2 = animelemtime(39) >= 0
movetype = I

[State Land]
type = changestate
trigger1 = statetype = A
trigger1 = vel y > 0 && (pos y > -vel y)
value = 1209


;======================<KAZE NO KEN>=============================
[Statedef 3300]
type = S
physics = S
movetype = A
anim = 3300
ctrl = 0
velset = 0, 0
poweradd = -2000
sprpriority = 1
facep2 = 1

[State 3300, Combo]
type = varset
trigger1 = !time
var(0) = prevstateno = [3000, 4999]

[State 3300, Custom Combo End]
type = palfx
trigger1 = !time
trigger1 = var(20) > 0
trigger1 = (var(20) := 0) || (var(15) := 0) || 1
time = 1

[State 3300, Strength]
type = varset
trigger1 = var(10) != 6
var(10) = 6
ignorehitpause = 1

[State 3300, Snd]
type = playsnd
trigger1 = animelem = 2
value = 4, 8
channel = 0

[State 3300, Super Pause FX]
type = helper
trigger1 = fvar(31)
trigger1 = animelem = 2
helpertype = normal
stateno = 7510
ID = 7500
name = "Superpause FX"
postype = p1
pos = ceil(2 * const(size.xscale)), ceil(-80 * const(size.yscale))
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3300, Super Pause]
type = superpause
trigger1 = time = 3
time = 45
movetime = 45
anim = ifelse(fvar(31), -1, 101)
pos = ceil(2 * const(size.xscale)), ceil(-80 * const(size.yscale))
sound = s0, 8510
darken = ifelse(fvar(31), 0, 1)
p2defmul = 1 + (0 * (fvar(5) := 0))

[State 3300, NHB]
type = nothitby
trigger1 = animelemtime(11) < 2
time = 1
value = SCA

[State 3300, Snd]
type = playsnd
trigger1 = animelem = 10
value = 3, 6
channel = 0

[State 3300, Snd]
type = playsnd
trigger1 = animelem = 10
value = 1, 1
channel = 1

[State 3300, Do not guard]
type = attackdist
trigger1 = 1
value = 0

[State 3300, Miss]
type = hitdef
trigger1 = animelemtime(11) >= 0 && animelemtime(12) < 0
ID = 3300
attr = S, HT
hitflag =

[State 3300, Reversal]
type = reversaldef
trigger1 = !var(0)
trigger1 = !movehit && var(26) <= 0;no double parry
trigger1 = animelemtime(11) >= 0
trigger1 = p2dist y >= -16
ID = 3300
attr = S, HT
reversal.attr = SCA, NA, SA, HA
pausetime = 0, 0
sparkno = -1 + 0 * (var(33) := 0)
sparkxy = 0, 0
hitsound = -1 + 0 * (var(31) := -1)
p1stateno = 3310
p2stateno = 3320
fall = 0
numhits = 0

[State 3300, Drop Target];ReversalDef bug
type = targetdrop
triggerall = numtarget
trigger1 = target, movetype != H
trigger2 = target, hitover

[State 3300, Hit]
type = hitdef
trigger1 = var(0)
trigger1 = animelemtime(11) = [0, 3]
ID = 3300
attr = S, HT
hitflag = MAF+
priority = 1, Miss
pausetime = 0, 0
sparkno = -1 + 0 * (var(33) := 0)
sparkxy = 0, 0
hitsound = -1 + 0 * (var(31) := -1)
p1stateno = 3310
p2stateno = 3320
fall = 0
numhits = 0

[State Idle]
type = statetypeset
trigger1 = animelemtime(13) >= 0
trigger2 = prevstateno = [1000, 4999]
trigger2 = animelemtime(11) >= 2
movetype = I

[State 3300, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1



;-----SUCCESS-----
[Statedef 3310]
type = S
physics = S
movetype = A
anim = 3310
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 3310, Corner Push]
type = width
trigger1 = time && animelemtime(5) < 0
edge = 80, 0

[State 3310, Snd]
type = playsnd
trigger1 = animelem = 3
value = 3, 4
channel = 0

[State 3310, Palfx]
type = palfx
trigger1 = animelemtime(5) < 0
time = 1
mul = 0, 0, 0

[State 3310, Palfx]
type = envcolor
trigger1 = time && animelemtime(5) < 1
time = 1
value = 255, 255, 255
under = 1

[State 3310, Assert]
type = assertspecial
trigger1 = time && animelemtime(5) < 1
flag = nobardisplay
flag2 = noFG

[State 3310, NHB]
type = nothitby
trigger1 = animelemtime(5) < 0
time = 1
value = SCA

[State 3310, Push]
type = playerpush
trigger1 = animelemtime(5) < 0
value = 0

[State 3310, Shadow]
type = assertspecial
trigger1 = time && animelemtime(5) < 0
flag = noshadow
flag2 = noFG
flag3 = nomusic

[State 3310, Leaves]
type = explod
trigger1 = animelemtime(5) = [0, 31]
anim = 6010
sprpriority = ifelse(random < 666, 2, -2)
postype = p1
pos = 80, -40
random = 80, 80
vel = (random / 250.0), (random / 125.0)
scale = 0.5 + (random / 2000.0), 0.5 + (random / 2000.0)
vfacing = ifelse(random < 500, -1, 1)
accel = 1, -0.75
removetime = -2
ownpal = 1

[State 3310, hitsound]
type = playsnd
trigger1 = animelem = 5
value = 2, 8
channel = 2

[State 3310, Spark]
type = helper
trigger1 = fvar(31)
trigger1 = animelem = 5
helpertype = normal
stateno = 8014
ID = 8000
name = "Spark"
postype = p1
pos = 46, -77
facing = 1
ownpal = 1
size.xscale = 1
size.yscale = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State 3310, Spark]
type = explod
trigger1 = !fvar(31)
trigger1 = animelem = 5
anim = F3
ID = 8000
postype = p1
pos = 46, -77
supermovetime = -1
pausemovetime = -1
ontop = 1
ownpal = 1

[State 3310, Snd]
type = playsnd
trigger1 = animelem = 2
value = 5, 19

[State 3310, Dust]
type = explod
trigger1 = animelem = 5
vel = 0, 0
anim = 7106
ID = 7106
sprpriority = 3
postype = p1
facing = -1
pos = 46, 0
ownpal = 1
scale = 1.5, 0.5
pausemovetime = -1
supermovetime = -1

[State 3310, FX]
type = helper
trigger1 = animelem = 5
helpertype = normal
stateno = 3315
ID = 3315
name = "Spark"
postype = p1
pos = 46, -77
ownpal = 1
pausemovetime = 255
supermovetime = 255

[State 3310, Shake]
type = envshake
trigger1 = animelem = 5
time = 24
ampl = 2
freq = 180

[State 3310, Throw]
type = targetfacing
trigger1 = animelem = 5
ID = 3300
value = -1

[State 3310, Bind]
type = targetbind
trigger1 = !time && numtarget
trigger1 = target, pos y >= 0
trigger1 = (((target(3300), pos x) - pos x) * facing) < 60
ID = 3300
pos = 60, 0

[State 3310, Bind]
type = targetbind
trigger1 = animelem = 5
ID = 3300
pos = 46, 0

[State 3310, Throw]
type = targetstate
trigger1 = animelem = 5
ID = 3300
value = 3321

[State 3310, Fall Sooner]
type = targetstate
trigger1 = var(0) = 1
trigger1 = time = 86
ID = 3300
value = 3322

[State 3310, hitdamage]
type = hitadd
trigger1 = animelem = 5
value = 1

[State 3310, hitdamage]
type = targetlifeadd
trigger1 = animelem = 5
value = -ceil(280 * fvar(11))
kill = 1

[State 3310, Givepower]
type = targetpoweradd
trigger1 = animelem = 5
value = 100

[State Idle]
type = statetypeset
trigger1 = animelemtime(6) >= 0
movetype = I

[State 3310, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- TARGET ---
[Statedef 3320]
type = A
physics = N
movetype = H
velset = 0, 0
ctrl = 0

[State 3320, NHB]
type = nothitby
trigger1 = 1
time = 1
value = SCA

[State 3320, Push]
type = playerpush
trigger1 = 1
value = 0

[State 3320, Anim]
type = changeanim
trigger1 = 1
value = anim
elem = animelemno(-1)

[State 3320, Pos]
type = posfreeze
trigger1 = 1
value = 1

[State 3320, Snd]
type = stopsnd
trigger1 = !time
channel = 0
[State 3320, Snd]
type = stopsnd
trigger1 = !time
channel = 1
[State 3320, Snd]
type = stopsnd
trigger1 = !time
channel = 2
[State 3320, Snd]
type = stopsnd
trigger1 = !time
channel = 3
[State 3320, Snd]
type = stopsnd
trigger1 = !time
channel = 4
[State 3320, Snd]
type = stopsnd
trigger1 = !time
channel = 5
[State 3320, Snd]
type = stopsnd
trigger1 = !time
channel = 6
[State 3320, Snd]
type = stopsnd
trigger1 = !time
channel = 7

[State 3320, Palfx]
type = palfx
trigger1 = 1
time = 1
mul = 0, 0, 0

[State 3320, Shadow]
type = assertspecial
trigger1 = 1
flag = noshadow

[State 3320, End]
type = selfstate
trigger1 = time >= 60
value = 5000


;--- Hit Pause ---
[Statedef 3321]
type = S
movetype = H
physics = S
velset = 0, 0

[State 3321, Stop]
type = posset
trigger1 = 1
y = 0

[State 3321, Anim]
type = changeanim
trigger1 = 1
value = ifelse(const(size.mid.pos.y) <= -60, 5012, 5002)

[State 3160, Shake]
type = offset
trigger1 = time = [0, 24]
x = ifelse((time % 2), -2, 2)

[State 3160, Shake]
type = offset
trigger1 = time = [25, 48]
x = ifelse((time % 2), -1, 1)

[State 3321, End]
type = changestate
trigger1 = time >= 60
value = 3322


;--- Falling ---
[Statedef 3322]
type = S
physics = S
movetype = H
ctrl = 0
velset = 0, 0

[State 3322, Anim]
type = changeanim2
trigger1 = !time
value = 3322

[State 3322, Stop]
type = posset
trigger1 = 1
y = 0

[State 3322, Dust]
type = explod
trigger1 = animelem = 7
anim = F60
pos = 0, 0
sprpriority = -10

[State 3322, Snd]
type = playsnd
trigger1 = animelem = 7
value = f7, 0

[State 3322, Type]
type = statetypeset
trigger1 = animelem = 4
statetype = A
physics = C
[State 3322, Type]
type = statetypeset
trigger1 = animelem = 7
statetype = L
physics = C

[State 3322, Die faster]
type = selfstate
trigger1 = !animtime
trigger1 = !alive
value = 5150

[State 3322, End]
type = selfstate
trigger1 = time >= 70
value = ifelse(alive, 5120, 5150)


;======================<SHUN GOKU SATSU>=============================
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

[State 4000, Strength]
type = varset
trigger1 = var(10) != 7
var(10) = 7
ignorehitpause = 1

[State 4000, Snd]
type = playsnd
trigger1 = time = 3
value = 14, 6
channel = 0

[State 4000, Super Pause FX]
type = helper
trigger1 = fvar(31)
trigger1 = time = 3
helpertype = normal
stateno = 7520
ID = 7500
name = "Superpause FX"
postype = p1
pos = ceil(7 * const(size.xscale)), ceil(-105 * const(size.yscale))
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 4000, Super Pause];No advantage
type = superpause
trigger1 = time = 3
time = 40
movetime = 40
anim = ifelse(fvar(31), -1, 102)
pos = ceil(7 * const(size.xscale)), ceil(-105 * const(size.yscale))
sound = s0, 8520
darken = ifelse(fvar(31), 0, 1)
p2defmul = 1 + (0 * (fvar(5) := 0))

[State 4000, NHB]
type = nothitby
trigger1 = time < 50
time = 1
value = SCA

[State 4000, Vel]
type = velset
trigger1 = animelem = 2
x = 5
[State 4000, Snd]
type = playsnd
trigger1 = animelem = 2
value = 5, 4

[State 4000, Miss]
type = hitdef
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
attr = S, HT
hitflag =

[State 4000, Hit]
type = hitdef
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
trigger1 = !var(29) && numenemy
trigger1 = fvar(16) <= 12
trigger1 = p2dist x >= ifelse((facing = enemynear, facing), -(enemynear, const(size.ground.front)), -(enemynear, const(size.ground.back)))
attr = S, HT
hitflag = M
priority = 6, Miss
numhits = 0
sparkno = -1 + 0 * (var(33) := 0)
p1facing = 1
p2facing = 1
p1stateno = 4001
fall = 1
fall.recover = 0
hitsound = -1 + 0 * (var(31) := 800)

[State 4000, Vel]
type = velset
trigger1 = animelem = 3
x = 0

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

[State Throw]
type = targetstate
trigger1 = !time
value = 1114002

[State 4001, Snd]
type = playsnd
trigger1 = !time
value = 5, ifelse(var(1) = 3, 17, 11)

[State 4001, Pause]
type = pause
trigger1 = animelemtime(2) >= 0 && animelemtime(17) < -1
time = 2
movetime = 2

[State 4001, Push]
type = playerpush
trigger1 = animelemtime(17) >= 0
value = 0
[State 4001, NHB]
type = nothitby
trigger1 = animelemtime(17) < 0
value = SCA
time = 1
[State 4001, imageoff]
type = afterimagetime
trigger1 = animelemtime(5) > 0
time = 0

[State 4001, fadeout]
type = allpalfx
trigger1 = animelemtime(2) = -16
time = 16
sinadd = -255, -255, -255, 64
[State 4001, black]
type = envcolor
trigger1 = animelemtime(2) >= 0 && animelemtime(17) < 0
time = 2
value = 0, 0, 0

[State 4001, Assert]
type = assertspecial
trigger1 = animelemtime(2) >= 0 && animelemtime(17) < 0
flag = nobardisplay
flag2 = noFG
[State 4001, spr]
type = sprpriority
trigger1 = animelemtime(17) >= 0
value = 1
[State 4001, Bind]
type = targetbind
trigger1 = animelemtime(17) < 0
pos = 45, 0

[State 4001, hitadd]
type = hitadd
trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8 || animelem = 9
trigger2 = animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15 || animelem = 16
value = 1

[State 4001, Juggle]
type = varadd
trigger1 = animelem = 16
var(15) = 1

[State 4001, Damage]
type = targetlifeadd
trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8 || animelem = 9
trigger2 = animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15 || animelem = 16
value = -ceil(ifelse(68 * fvar(11) < 7, 7, 68 * fvar(11)))
kill = animelem = 16

[State 4001, Givepower]
type = targetpoweradd
trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8 || animelem = 9
trigger2 = animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15 || animelem = 16
value = 25

[State 4001, HitSound]
type = playsnd
trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8 || animelem = 9
trigger2 = animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15 || animelem = 16
value = 2, ifelse((animelem = 16), 8, 3)
channel = 2

[State 4001, Spark]
type = helper
triggerall = fvar(31)
triggerall = numtarget
trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8 || animelem = 9
trigger2 = animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15 || animelem = 16
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
trigger2 = animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15 || animelem = 16
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
trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8 || animelem = 9
trigger2 = animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15 || animelem = 16
time = 6
freq = 180
ampl = 2

[State 4001, Snd]
type = playsnd
trigger1 = animelemtime(16) = 10
value = 14, 7
channel = 0

[State 4001, Throw]
type = targetstate
trigger1 = animelemtime(16) >= 0 && numtarget
value = 1114003
persistent = 0

[State 4001, End]
type = changestate
trigger1 = animelemtime(16) >= 0 && winko
value = 4099

[State 4001, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- TARGET ---
[Statedef 1114002]
type = A
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
trigger1 = time >= 76 && alive
value = 5120
