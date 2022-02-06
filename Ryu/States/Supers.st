; ______________________________
;| Ryu by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;============================================================================================
;======================================< HYPER STATES >========================================
;============================================================================================

;======================< SHINKUU HADOU KEN >=============================
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

[State 3000, Strength]
type = varset
trigger1 = var(10) != 5
var(10) = 5
[State 3000, width]
type = width
trigger1 = animelemtime(7) = 0
value = 30, 0

[State 3000, mouth]
type = explod
trigger1 = animelem = 4
anim = 3004
sprpriority = 2
postype = p1
removeongethit = 1
supermovetime = -1

[State 3000, ECreset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3000, Snd]
type = playsnd
trigger1 = animelem = 3
value = 4 + (var(1) = 2) * 10, 3
channel = 0
volume = 200
[State 3000, Super Pause FX]
type = helper
trigger1 = time = 1
helpertype = normal
stateno = 7500
ID = 7500
name = "Super Charge"
postype = p1
pos = -15, -73
ownpal = 1
persistent = 0
supermovetime = 9999
[State 3000, Super Pause]
type = superpause
trigger1 = time = 1
time = 45
movetime = 45
anim = -1
sound = s7, 0
p2defmul = 1
darken = 0

[State Corner Push]
type = varset
trigger1 = animelem = 4
fvar(5) = 0

[State 3000, NHB]
type = nothitby
trigger1 = animelemtime(7) < 0
time = 1
value = SCA

[State 3000, hadouken]
type = helper
trigger1 = animelem = 7
helpertype = normal
stateno = 3005
ID = 3005
name = "hadouken"
postype = p1
pos = 80, -68
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 3000, Dust]
type = explod
trigger1 = animelem = 7
vel = 0, 0
anim = 7106
ID = 7106
sprpriority = 3
postype = p1
pos = 30, 0
ownpal = 1
scale = 0.75, 0.75
pausemovetime = -1
supermovetime = -1

[State 3000, Snd]
type = playsnd
trigger1 = animelem = 6
value = 4 + (var(1) = 2) * 10, 5 -(var(1) = 2) * 5
channel = 0
[State 3000, Snd]
type = playsnd
trigger1 = animelem = 7
value = 5, 0

[State 3000, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================< DENJIN HADOU KEN >=============================
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

[State 3020, Strength]
type = varset
trigger1 = var(10) != 5
var(10) = 5
[State 3020, width]
type = width
trigger1 = 1
value = 30, 0

[State 3020, NHB]
type = nothitby
trigger1 = anim = 3020 && animelemtime(4) < 0
time = 1
value = SCA

[State 3020, ECreset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3020, Snd]
type = playsnd
trigger1 = anim = 3020 && animelem = 3
value = 4, 15
channel = 0
volume = 200
[State 3020, Super Pause FX]
type = helper
trigger1 = anim = 3020 && animelem = 3
helpertype = normal
stateno = 7500
ID = 7500
name = "Super Charge"
postype = p1
pos = -5, -69
ownpal = 1
persistent = 0
supermovetime = 9999
[State 3020, Super Pause]
type = superpause
trigger1 = anim = 3020 && animelem = 3
time = 45
anim = -1
sound = s7, 0
p2defmul = 1
darken = 0

[State Corner Push]
type = varset
trigger1 = anim = 3020 && animelem = 3
fvar(5) = 0

[State 3020, Do not guard]
type = attackdist
trigger1 = 1
value = 0

[State 3020, electricity]
type = explod
trigger1 = !numexplod(3027)
trigger1 = anim = 3020 && animelemtime(3) >= 1
anim = 3027
ID = 3027
sprpriority = 3
postype = p1
pos = -5, -69
bindtime = -1
removetime = -1
ownpal = 1
scale = 0.25, 0.25
removeongethit = 1

[State 3020, grow]
type = modifyexplod
trigger1 = numexplod(3027)
ID = 3027
scale = 0.25 + (0.00375 * var(35)), 0.25 + (0.00375 * var(35))

[State 3020, lv1indicator]
type = explod
trigger1 = (anim = 3020 && animelemtime(4) >= 0) || (anim = 3021 && animelemtime(2) < 0)
trigger1 = var(35) >= 20
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
trigger1 = var(35) >= 60
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
trigger1 = var(35) >= 120
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
trigger1 = var(35) >= 200
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
trigger1 = var(35) >= 20
time = 6
add = 0, 128, 255
sinadd = 0, -128, -255, 24
persistent = 0
[State 3020, lv2flash]
type = palfx
trigger1 = (anim = 3020 && animelemtime(4) >= 0) || (anim = 3021 && animelemtime(2) < 0)
trigger1 = var(35) >= 60
time = 6
add = 0, 128, 255
sinadd = 0, -128, -255, 24
persistent = 0
[State 3020, lv3flash]
type = palfx
trigger1 = (anim = 3020 && animelemtime(4) >= 0) || (anim = 3021 && animelemtime(2) < 0)
trigger1 = var(35) >= 120
time = 6
add = 0, 128, 255
sinadd = 0, -128, -255, 24
persistent = 0
[State 3020, lv4flash]
type = palfx
trigger1 = (anim = 3020 && animelemtime(4) >= 0) || (anim = 3021 && animelemtime(2) < 0)
trigger1 = var(35) >= 200
time = 6
add = 0, 128, 255
sinadd = 0, -128, -255, 24
persistent = 0

[State 3020, lv1snd]
type = playsnd
trigger1 = (anim = 3020 && animelemtime(4) >= 0) || (anim = 3021 && animelemtime(2) < 0)
trigger1 = var(35) >= 20
value = 5, 6 + (random % 2)
persistent = 0
[State 3020, lv2snd]
type = playsnd
trigger1 = (anim = 3020 && animelemtime(4) >= 0) || (anim = 3021 && animelemtime(2) < 0)
trigger1 = var(35) >= 60
value = 5, 6 + (random % 2)
persistent = 0
[State 3020, lv3snd]
type = playsnd
trigger1 = (anim = 3020 && animelemtime(4) >= 0) || (anim = 3021 && animelemtime(2) < 0)
trigger1 = var(35) >= 120
value = 5, 6 + (random % 2)
persistent = 0
[State 3020, lv4snd]
type = playsnd
trigger1 = (anim = 3020 && animelemtime(4) >= 0) || (anim = 3021 && animelemtime(2) < 0)
trigger1 = var(35) >= 200
value = 5, 6 + (random % 2)
persistent = 0

[State 3020, Snd]
type = playsnd
trigger1 = anim = 3020 && animelemtime(4) >= 0 && !(time % 16)
value = 5, 14

[State 3020, denjinvarreset]
type = varset
trigger1 = anim = 3020 && animelemtime(4) < 0
trigger2 = anim = 3021 && animelemtime(1) > 0
var(35) = 0
[State 3020, denjinvar]
type = varadd
triggerall = anim = 3020 && animelemtime(4) >= 0
trigger1 = !AIlevel && (command = "holdx" || command = "holdy" || command = "holdz") && var(35) < 200
trigger2 = AIlevel
var(35) = 1
[State 3020, denjinvar]
type = varadd
triggerall = anim = 3020 && animelemtime(4) >= 0
trigger1 = !AIlevel && (command = "holdx" || command = "holdy" || command = "holdz") && var(35) < 200
trigger1 = (command = "fwd" || command = "back" || command = "up" || command = "down")
trigger2 = AIlevel && random < 333
var(35) = 2

[State 3020, Anim]
type = changeanim
triggerall = anim = 3020 && animelemtime(4) >= 0
trigger1 = var(35) >= 200
trigger2 = !AIlevel && command != "holdx" && command != "holdy" && command != "holdz"
value = 3021
[State 3020, Anim]
type = changeanim
triggerall = AIlevel && numenemy
triggerall = anim = 3020 && animelemtime(4) >= 0
trigger1 = (p2dist x < 0 || enemynear, movetype = A || inguarddist)
trigger2 = (p2bodydist x <= 90) && (enemynear, stateno = 40)
value = 3021

[State 3020, removeelectricity]
type = removeexplod
trigger1 = anim = 3021
ID = 3027

[State 3020, hadouken]
type = helper
trigger1 = anim = 3021 && animelem = 1
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
pos = 30, 0
ownpal = 1
scale = 0.75, 0.75
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

[State 3020, End]
type = changestate
trigger1 = anim = 3021 && !animtime
value = 0
ctrl = 1


;======================< METSU HADOU KEN >=============================
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

[State 3040, Strength]
type = varset
trigger1 = var(10) != 7
var(10) = 7
[State 3040, width]
type = width
trigger1 = anim = 3041 && animelemtime(7) < 0
value = 30, 0

[State 3040, ECreset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3040, Snd]
type = playsnd
trigger1 = anim = 3040 && animelem = 3
value = 4 + (var(1) = 2) * 10, 10 + (var(1) = 2)
channel = 0
volume = 200
[State 3040, Super Pause FX]
type = helper
trigger1 = anim = 3040 && animelem = 4
helpertype = normal
stateno = 7500
ID = 7500
name = "Super Charge"
postype = p1
pos = -15, -73
ownpal = 1
persistent = 0
supermovetime = 9999
[State 3040, Super Pause]
type = superpause
trigger1 = anim = 3040 && animelem = 4
time = 60
anim = -1
sound = s7, 0
p2defmul = 1
darken = 0

[State Corner Push]
type = varset
trigger1 = anim = 3040 && animelem = 4
fvar(5) = 0

[State 3040, NHB]
type = nothitby
trigger1 = anim = 3040 && animelemtime(5) < 0
time = 4
value = SCA

[State 3040, Do not guard]
type = attackdist
trigger1 = 1
value = 0

[State 3040, metsuvarreset]
type = varset
trigger1 = anim = 3040 && animelemtime(5) < 0
trigger2 = anim = 3041 && animelemtime(2) > 0
var(36) = 0
[State 3040, metsuvar]
type = varadd
triggerall = anim = 3040 && animelemtime(5) >= 0
trigger1 = !AIlevel && (command = "holdx" || command = "holdy" || command = "holdz") && var(35) < 140
trigger2 = AIlevel
var(36) = 1
[State 3040, metsuvar]
type = varadd
triggerall = anim = 3040 && animelemtime(5) >= 0
trigger1 = !AIlevel && (command = "holdx" || command = "holdy" || command = "holdz") && var(35) < 140
trigger1 = (command = "fwd" || command = "back" || command = "up" || command = "down")
trigger2 = AIlevel && random < 333
var(36) = 2

[State 3040, Shake]
type = envshake
trigger1 = anim = 3040 && animelemtime(5) >= 0 && !(time % 4)
time = 4
freq = 120
ampl = 1 + ceil(var(36) / 40)
[State 3040, bgpal]
type = bgpalfx
trigger1 = anim = 3040 && animelemtime(5) >= 0 && (var(36) = [0, 140])
mul = 256 + ceil(1.8 * var(36)), 256 -ceil(1.8 * var(36)), 256 -ceil(1.8 * var(36))
add = -ceil(var(36) / 2), -ceil(var(36) / 2), -ceil(var(36) / 2)
color = 256 -ceil(var(36) * 1.8)
time = 2

[State 3040, Snd]
type = playsnd
trigger1 = anim = 3040 && animelem = 5
value = 3 + (var(1) = 2) * 10, 5 + (var(1) = 2)
channel = 0
[State 3040, Snd]
type = playsnd
trigger1 = anim = 3040 && animelem = 5
value = 5, 15
channel = 3
loop = 1
[State 3040, Snd]
type = playsnd
trigger1 = anim = 3040 && animelem = 5
value = 5, 9
channel = 4

[State 3040, FX]
type = explod
trigger1 = !numexplod(3047)
trigger1 = anim = 3040 && animelemtime(5) >= 0
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
[State 3040, grow]
type = modifyexplod
trigger1 = numexplod(3047)
ID = 3047
scale = 0.6 + .01 * var(36), 0.6 + .01 * var(36)

[State 3040, Anim]
type = changeanim
triggerall = anim = 3040 && animelemtime(5) >= 0 && var(36) < 140
trigger1 = !AIlevel && command != "holdx" && command != "holdy" && command != "holdz"
trigger2 = AIlevel && (p2dist x < 0 || p2movetype = A || inguarddist)
value = 3041
[State 3040, removefx]
type = removeexplod
trigger1 = anim = 3041
ID = 3047

[State 3040, beam]
type = changestate
trigger1 = anim = 3040 && animelemtime(5) >= 0 && var(36) >= 140
value = 3050

[State 3040, stopsnd3]
type = stopsnd
trigger1 = anim = 3041 && animelem = 2
channel = 3
[State 3040, stopsnd4]
type = stopsnd
trigger1 = anim = 3041 && animelem = 2
channel = 4

[State 3040, hadouken]
type = helper
trigger1 = anim = 3041 && animelem = 2
helpertype = normal
stateno = 3045
ID = 3045
name = "Metsu Hadouken"
postype = p1
pos = 83, -68
ownpal = 1

[State 3040, Dust]
type = explod
trigger1 = anim = 3041 && animelem = 2
anim = 7106
sprpriority = 3
postype = p1
pos = 30, 0
ownpal = 1
scale = 0.75, 0.75
pausemovetime = -1
supermovetime = -1

[State 3040, Snd]
type = playsnd
trigger1 = anim = 3041 && animelem = 2
value = 4 + (var(1) = 2) * 10, 0
channel = 0
[State 3000, Snd]
type = playsnd
trigger1 = anim = 3041 && animelem = 2
value = 5, 0
[State 3040, End]
type = changestate
trigger1 = anim = 3041 && !animtime
value = 0
ctrl = 1


;======================< RYUU KOKU HADOU KEN >=============================
[Statedef 3050]
type = S
physics = S
movetype = A
anim = 3050
ctrl = 0
velset = 0, 0
sprpriority = 1
facep2 = 1

[State 3050, Do not guard]
type = attackdist
trigger1 = 1
value = 0

[State 3050, Strength]
type = varset
trigger1 = var(10) != 7
var(10) = 7
[State 3050, width]
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
trigger1 = anim = 3050 && animelem = 1
value = 4 + (var(1) = 2) * 10, 0
channel = 0
[State 3050, Snd]
type = playsnd
trigger1 = anim = 3050 && animelem = 1
value = 5, 10

[State 3050, Shake]
type = envshake
trigger1 = anim = 3050 && animelemtime(2) >= 0 && !(time % 4)
time = 4
freq = 120
ampl = 6

[State 3050, hadouken]
type = helper
trigger1 = anim = 3050 && animelemtime(2) >= 0
helpertype = normal
stateno = 3055
ID = 3055
name = "Ryu Koku Hadouken"
postype = p1
ownpal = 1
persistent = 0
[State 3050, pusher]
type = helper
trigger1 = anim = 3050 && animelemtime(2) >= 0
helpertype = normal
stateno = 3054
ID = 3054
name = "Pusher"
postype = p1
pos = 40, 0
facing = -1
size.xscale = 1
size.yscale = 1
size.ground.back = 20
size.ground.front = 20
size.height = 240
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
value = 5000 + (var(1) = 2) * 10, 3
channel = 0
[State 3050, Snd]
type = playsnd
trigger1 = anim = 3051 && animelem = 8
value = 0, 52
[State 3050, Dust]
type = explod
trigger1 = anim = 3051 && animelem = 8
anim = 7104
ID = 7104
sprpriority = -4
postype = p1
pos = -7, 0
scale = 0.5, 0.5
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 3050, statetype]
type = statetypeset
trigger1 = anim = 3051 && animelemtime(8) >= 0 && animelemtime(15) < 0
statetype = C
physics = C
[State 3050, statetype]
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


;======================< NIDAN SHORYUU TSUKI >=============================
[Statedef 3100]
type = S
physics = S
movetype = A
anim = 3100
ctrl = 0
velset = 0, 0
poweradd = -1000
sprpriority = 1
juggle = ifelse((prevstateno = [1000, 4999]), 0, 6) * !var(20)
facep2 = 1

[State 3100, Strength]
type = varset
trigger1 = var(10) != 5
var(10) = 5

[State 3100, Snd]
type = playsnd
trigger1 = anim = 3100 && animelem = 4
value = 4, 19
channel = 0
volume = 200
[State 3100, Super Pause FX]
type = helper
trigger1 = anim = 3100 && animelem = 4
helpertype = normal
stateno = 7500
ID = 7500
name = "Super Charge"
postype = p1
pos = 3, -66
ownpal = 1
persistent = 0
supermovetime = 9999

[State 3100, ECreset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3100, Super Pause]
type = superpause
trigger1 = anim = 3100 && animelem = 4
time = 45
anim = -1
sound = s7, 0
p2defmul = 1
darken = 0

[State Corner Push]
type = varset
trigger1 = anim = 3100 && animelem = 4
fvar(5) = 0

[State 3100, NHB]
type = nothitby
trigger1 = anim = 3100 && animelemtime(7) < 0
time = 1
value = SCA

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
pausemovetime = -1
supermovetime = -1

[State 3100, Snd]
type = playsnd
trigger1 = anim = 3100 && animelem = 6
value = 3, 4
channel = 0

[State 3100, elbowhit]
type = hitdef
trigger1 = animelem = 7 && anim = 3100
ID = 3100
attr = S, HA
damage = 115, 14
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 12, 24
guard.pausetime = 12, 12
sparkno = s7030 + (random % 8)
guard.sparkno = s7001
sparkxy = -15, -64
hitsound = s2, 3
guardsound = s2, 0
p2facing = 1
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = 0, 0
guard.velocity = -10.52
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.type = Low
air.velocity = -.5, -3
getpower = 0
givepower = 36, 36
envshake.time = 18
envshake.freq = 120
envshake.ampl = 9
forcestand = 1
yaccel = 0.5
forcestand = 1

[State 3100, switch]
type = changeanim
trigger1 = anim = 3100
trigger1 = animelemtime(7) >= 0 && animelemtime(8) < 0 && movehit
value = 3101
ignorehitpause = 0

[State 3100, Vel]
type = velset
trigger1 = anim = 3101 && animelemtime(5) >= 0 && animelemtime(7) < 0 && p2bodydist x > 0
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

[State 3100, statetype]
type = statetypeset
trigger1 = anim = 3101 && animelemtime(7) >= 0
trigger2 = anim = 1101
statetype = A
physics = A
[State 3100, Anim]
type = changeanim
trigger1 = anim = 3101 && animelemtime(7) > 0 && vel y > -5
value = 1101
persistent = 0

[State 3100, Snd]
type = playsnd
trigger1 = anim = 3101 && animelem = 6 && !var(33)
value = 4, 1
channel = 0
ignorehitpause = 1
persistent = 0

[State 3100, shinvar]
type = poweradd
triggerall = anim = 3101 && animelemtime(6) < 0 && power >= 2000
trigger1 = !AIlevel
trigger1 = (var(1) = 1 && command = "2df2k") || (var(1) = 3 && command = "qcbhcfk")
trigger2 = AIlevel && animelem = 5 && (p2bodydist x = [0, 30]) && random < 666
value = -2000 + 0 * (var(33) := 1)
ignorehitpause = 1
persistent = 0
[State 3100, palfx]
type = palfx
trigger1 = anim = 3101 && animelemtime(6) < 0 && var(33)
time = 20
add = 255, 255, 255
sinadd = -255, -255, -255, 80
ignorehitpause = 1
persistent = 0

[State 3100, shinshoryuken]
type = changestate
trigger1 = anim = 3101 && animelem = 7 && var(33)
value = 3120

[State 3100, Snd]
type = playsnd
trigger1 = anim = 3101 && animelem = 7
value = 0, 41
[State 3100, Dust]
type = helper
trigger1 = anim = 1100 && animelem = 4
helpertype = normal
stateno = 7100
ID = 7100
name = "Dust"
postype = p1
ownpal = 1

[State 3100, Push]
type = playerpush
trigger1 = anim = 3101 && animelemtime(6) >= 0 && var(33) && power >= 2000
value = 0
ignorehitpause = 1
[State 3100, Snd]
type = playsnd
trigger1 = anim = 3101 && var(33)
value = 4, 11
channel = 0
ignorehitpause = 1
persistent = 0
[State 3100, Dust]
type = helper
trigger1 = anim = 3101 && animelem = 6
helpertype = normal
stateno = 3125
ID = 3125
name = "B&W Dust"
postype = p1
pos = 0, 0
ownpal = 1
ignorehitpause = 1
size.xscale = 2
size.yscale = 2

[State 3100, lowhit]
type = hitdef
trigger1 = animelem = 6 && anim = 3101
ID = 3100
attr = S, HA
damage = 58, 7
animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(var(33), 45, 16), ifelse(var(33), 35, 16)
sparkno = s7030 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -79
hitsound = s2, 3
guardsound = s2, 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = ifelse(var(33), (p2dist x) / 22.0, 0.5), -6
air.type = Low
air.velocity = ifelse(var(33), (p2dist x) / 22.0, 0.5), ifelse(var(33), -6, -4)
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
getpower = 0
givepower = 36, 36
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
fall = 1
fall.recover = 0
fall.animtype = Medium
yaccel = 0.5
forcestand = 1

[State 3100, shoryuuhit]
type = hitdef
trigger1 = animelem = 7 && anim = 3101
ID = 3100
attr = A, HA
damage = 58, 7
animtype = Up
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 6, 6
sparkno = s7030 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -106
hitsound = s2, 3
guardsound = s2, 0
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
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
fall = 1
fall.recover = 0
yaccel = 0.5
forcestand = 1

[State Idle]
type = statetypeset
trigger1 = anim = 3100 && animelemtime(8) >= 0
trigger2 = anim = 1101 || anim = 3102
movetype = I

[State 3100, End]
type = changestate
trigger1 = anim = 3100 && !animtime
value = 0
ctrl = 1
[State 3100, End]
type = changestate
trigger1 = anim = 3102 && !animtime
value = 11
ctrl = 1


;======================< SHIN SHORYUU KEN >=============================
[Statedef 3120]
type = S
physics = S
movetype = A
anim = 3120
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = ifelse(prevstateno = 3100, 0, -3000)
juggle = ifelse((prevstateno = [1000, 4999]), 0, 9) * !var(20)
facep2 = (prevstateno != 3100)

[State 3120, Strength]
type = varset
trigger1 = var(10) != 7
var(10) = 7

[State 3120, Pos]
type = posadd
trigger1 = !time
trigger1 = anim = 3120 && (prevstateno = 212 || prevstateno = 214)
x = ifelse((prevstateno = 212), 30, 21)

;[State 3120, mouth]
;type = explod
;trigger1 = anim = 3120 && animelem = 2
;anim = 3124
;sprpriority = 2
;postype = p1
;removeongethit = 1
;supermovetime = -1
[State 3120, Snd]
type = playsnd
trigger1 = anim = 3120 && animelem = 2
value = 4, 9
channel = 0
volume = 200

[State 3120, Super Pause FX]
type = helper
trigger1 = anim = 3120 && animelem = 2
trigger1 = prevstateno != 3100
helpertype = normal
stateno = 7500
ID = 7500
name = "Super Charge"
postype = p1
pos = -25, -57
ownpal = 1
persistent = 0
supermovetime = 9999

[State 3120, ECreset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3120, Super Pause]
type = superpause
trigger1 = anim = 3120 && animelem = 2
trigger1 = prevstateno != 3100
time = 60
anim = -1
sound = s7, 0
p2defmul = 1
darken = 0

[State Corner Push]
type = varset
trigger1 = anim = 3120 && animelem = 2
trigger1 = prevstateno != 3100
fvar(5) = 0

[State 3120, NHB]
type = nothitby
trigger1 = anim = 3120 && animelemtime(5) < 0
trigger2 = (anim = 3120 && animelemtime(2) >= 0 && animelemtime(5) < 0) && movehit
trigger3 = (anim = 3121 && animelemtime(4) < 0) && movehit
time = 1
value = SCA
ignorehitpause = 1
[State 3120, width]
type = width
trigger1 = anim = 3120 && animelemtime(4) >= 0 && animelemtime(5) < 0 && movehit
trigger2 = anim = 3121 && animelemtime(4) < 0
player = -28, 0
ignorehitpause = 1
[State 3120, width]
type = width
trigger1 = anim = 3121 && animelemtime(4) >= 0
player = -10, 0
edge = const(size.air.front)
ignorehitpause = 1

[State 3120, switch]
type = changeanim
trigger1 = anim = 3120 && animelemtime(4) > 0 && animelemtime(5) < 0 && movehit
trigger1 = AIlevel || (!AIlevel && command != "holdup")
trigger2 = prevstateno = 3100
value = 3121
ignorehitpause = 0
persistent = 0

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
trigger2 = animelem = 3 && anim = 3121
ID = 3120
attr = S, HA
damage = ifelse(anim = 3120, 192, 74), ifelse(anim = 3120, 24, 9)
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse(anim = 3120, 60, 45), ifelse(anim = 3120, 50, 45)
guard.pausetime = 12, 12
sparkno = s7030 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, ifelse((anim = 3120), -79, -90)
hitsound = s2, 3
guardsound = s2, 0
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
envshake.freq = 120
envshake.ampl = 8
fall = 1
fall.recover = 0
kill = ifelse(anim = 3120, (numenemy > 1), (numtarget != numenemy))
yaccel = 0.6
forcestand = 1

[State 3120, shoryuuhits]
type = hitdef
trigger1 = anim = 3120 && animelemtime(5) >= 0 && !(animelemtime(5) % 3)
attr = A, HA
damage = 28, 7
animtype = Up
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 6, 6
sparkno = s7030 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -106
hitsound = s2, 3
guardsound = s2, 0
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
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
fall = 1
fall.recover = 0
yaccel = 0.5
forcestand = 1

[State 3120, shinshoryuuhits]
type = hitdef
trigger1 = (animelem = 4 || animelem = 5) && anim = 3121
ID = 3120
attr = A, HA
damage = 74, 9
animtype = Up
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse((animelem = 5), 36, 12), ifelse((animelem = 5), 36, 12)
sparkno = s7030 + (random % 8)
guard.sparkno = s7001
sparkxy = -15, -103
hitsound = s2, ifelse((animelem = 5), 8, 3)
guardsound = s2, 0
p2facing = 1
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = ifelse((animelem = 4), 0, -2), ifelse((animelem = 4), -12, -30)
air.type = Low
air.velocity = ifelse((animelem = 4), 0, -2), ifelse((animelem = 4), -12, -30)
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = 0
givepower = 36, 36
envshake.time = 24
envshake.freq = 120
envshake.ampl = 8
fall = 1
fall.recover = 0
fall.envshake.time = 18
fall.envshake.freq = 120
fall.envshake.ampl = 6
kill = (numtarget != numenemy) || (animelem = 5)
yaccel = 0.6
forcestand = 1

[State 3120, fix]
type = targetbind
trigger1 = numtarget(3120) = 1
trigger1 = (target, stateno != [120, 155]) && !(target(3120), hitshakeover)
trigger1 = anim = 3120 && animelemtime(4) >= 0 && animelemtime(5) < 0
ID = 3120
pos = 38 + target(3120), const(size.mid.pos.x), -88 -target(3120), const(size.mid.pos.y)
ignorehitpause = 1
[State 3120, fix]
type = targetbind
trigger1 = numtarget(3120) = 1
trigger1 = (target, stateno != [120, 155]) && !(target(3120), hitshakeover)
trigger1 = anim = 3121 && animelemtime(3) >= 0 && animelemtime(4) < 0
ID = 3120
pos = 24 + target(3120), const(size.mid.pos.x), -98 -target(3120), const(size.mid.pos.y)
ignorehitpause = 1

[State 3120, Sparks]
type = helper
triggerall = movehit && numtarget
triggerall = (target, movetype = H) && !(target, time)
trigger1 = anim = 3120 && animelemtime(4) >= 0 && animelemtime(5) < 0
trigger2 = anim = 3121
helpertype = normal
stateno = 7050
ID = 7050
name = "Shin Shoryuken Spark"
postype = p1
pos = ifelse(anim = 3121, 26, 36), ifelse((anim = 3121 && animelem = 5), -128, ifelse((anim = 3121 && animelem = 4), -109, ifelse((anim = 3121 && animelem = 3), -90, -80)))
;pos = (target, const(size.ground.front) -ifelse((anim = 3121 && animelemtime(4) < 0), 15, 10)), ifelse((anim = 3120), -79, ifelse((animelemtime(4) < 0), -90, -103)) -floor(p2dist y)
ownpal = 1
facing = -1
ignorehitpause = 1
pausemovetime = 255
supermovetime = 255

[State 3120, Snd]
type = playsnd
trigger1 = movehit = 1
trigger1 = anim = 3120 && animelemtime(5) < 0
value = 3, 4
channel = 0
ignorehitpause = 1
persistent = 0
[State 3120, Snd]
type = playsnd
trigger1 = anim = 3120 && animelem = 5
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
pos = 0, 0
ownpal = 1
ignorehitpause = 1
size.xscale = 2
size.yscale = 2

[State 3120, statetype]
type = statetypeset
trigger1 = anim = 3120 && animelemtime(5) >= 0
trigger2 = anim = 3121 && animelemtime(4) >= 0
trigger3 = anim = 1101 || anim = 1111
statetype = A
physics = N
[State 3120, Accel]
type = gravity
trigger1 = anim = 3120 && animelemtime(5) > 0
trigger2 = anim = 3121 && animelemtime(4) > 0
trigger3 = anim = 1101 || anim = 1111

[State 3120, Anim]
type = changeanim
trigger1 = anim = 3120 && animelemtime(5) > 0 && vel y > -5
trigger2 = anim = 3121 && animelemtime(4) > 0 && vel y > -4
value = ifelse(anim = 3121, 1111, 1101)
persistent = 0
[State 3120, Anim]
type = changeanim
trigger1 = pos y >= -10 && (anim = 1101 || anim = 1111)
value = ifelse(anim = 1101, 1102, 3122)
persistent = 0

[State 3120, Vel]
type = velset
trigger1 = anim = 1102 || anim = 3122
y = 0
[State 3120, Pos]
type = posset
trigger1 = anim = 1102 || anim = 3122
y = 0

[State 3120, Snd]
type = playsnd
trigger1 = anim = 1102 || anim = 3122
value = 0, 52
persistent = 0
[State 3120, Dust]
type = explod
trigger1 = anim = 1102 || anim = 3122
anim = 7102
ID = 7102
sprpriority = -2
postype = p1
pos = 0, 0
vel = 0, 0
ownpal = 1
scale = 0.5, 0.5
persistent = 0
pausemovetime = -1
supermovetime = -1

[State Idle]
type = statetypeset
trigger1 = anim = 1101 || anim = 1111 || anim = 1102 || anim = 3122
movetype = I

[State 3120, End]
type = changestate
trigger1 = anim = 3100 && !animtime
value = 0
ctrl = 1
[State 3120, End]
type = changestate
trigger1 = (anim = 1102 || anim = 3122) && !animtime
value = ifelse(anim = 3122, 11, 0)
ctrl = 1


;======================< MESSATSU GOU SHORYUU >=============================
[Statedef 3140]
type = S
physics = S
movetype = A
ctrl = 0
anim = 3140
velset = 0, 0
juggle = ifelse((prevstateno = [1000, 4999]), 0, 6) * !var(20)
sprpriority = 1
facep2 = 1

[State 3140, Strength]
type = varset
trigger1 = var(10) != 5
var(10) = 5

[State 3140, Snd]
type = playsnd
trigger1 = anim = 3140 && animelemtime(1) = 2
value = 4 + (var(1) = 2) * 10, 10 -(var(1) = 2)
channel = 0
[State 3140, Super Pause FX]
type = helper
trigger1 = anim = 3140 && animelemtime(1) = 2
helpertype = normal
stateno = 7500
ID = 7500
name = "Super Charge"
postype = p1
pos = 12, -54
ownpal = 1
persistent = 0
supermovetime = 9999

[State 3140, ECreset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3140, Super Pause]
type = superpause
trigger1 = anim = 3140 && animelemtime(1) = 2
time = 45
anim = -1
sound = s7, 0
poweradd = ifelse(var(20) > 0, -10 * var(20), -1000)
p2defmul = 1
darken = 0

[State Corner Push]
type = varset
trigger1 = anim = 3140 && animelemtime(1) = 2
fvar(5) = 0

[State 3140, NHB]
type = nothitby
trigger1 = anim = 3140 && animelemtime(3) < 0
time = 1
value = SCA
ignorehitpause = 1

[State 3140, Vel]
type = velset
trigger1 = anim = 3140 && (animelem = 2 || animelem = 14)
x = 12
[State 3140, Vel]
type = velset
trigger1 = anim = 3140 && animelem = 26
x = 19
[State 3140, Dust]
type = explod
trigger1 = anim = 3140 && (animelem = 2 || animelem = 14 || animelem = 26)
anim = 7103
ID = 7103
sprpriority = 3
postype = p1
ownpal = 1
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
x = 18
y = -11

[State 3140, Vel]
type = velmul
trigger1 = vel y < 0
x = 0.86
[State 3140, Vel]
type = velmul
trigger1 = vel y > 0
x = 0

[State 3140, statetype]
type = statetypeset
trigger1 = anim = 3140 && animelemtime(28) >= 1
trigger2 = anim = 1101
statetype = A
physics = A
[State 3140, Anim]
type = changeanim
trigger1 = anim = 3140 && animelemtime(28) > 1 && vel y > -5.5
value = 1101
persistent = 0

[State 3140, hitlow]
type = hitdef
trigger1 = animelem = 14 && anim = 3140
attr = S, HA 
damage = 32, 6
animtype = Medium 
fall.animtype = Medium 
guardflag = M 
hitflag = MAF
priority = 4, Hit
pausetime = ifelse((animelem = 24), 18, 6), ifelse((animelem = 24), 18, 6)
sparkno = s7030 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -52
hitsound = s2, 3 
guardsound = s2, 0
ground.type = Low
ground.slidetime = 24
ground.hittime = 24
ground.velocity = -4, 0
ground.cornerpush.veloff = 0
air.velocity = -4, -2
getpower = 0
givepower = 36, 36
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
yaccel = 0.5
forcestand = 1

[State 3140, hitlow2]
type = hitdef
trigger1 = (animelem = 3 || animelem = 15) && anim = 3140
attr = S, HA 
damage = 32, 6
animtype = Hard 
fall.animtype = Hard 
guardflag = M 
hitflag = MAF
priority = 4, Hit
pausetime = 6, 6
sparkno = s7030 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -75
hitsound = s2, 3 
guardsound = s2, 0
ground.type = Low
ground.slidetime = 24
ground.hittime = 24
ground.velocity = -4, 0
ground.cornerpush.veloff = 0
air.velocity = -4, -2
getpower = 0
givepower = 36, 36
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
yaccel = 0.5
forcestand = 1

[State 3140, hitlow3]
type = hitdef
trigger1 = animelem = 26 && anim = 3140
attr = S, HA 
damage = 32, 6
animtype = Medium 
fall.animtype = Medium 
guardflag = M 
hitflag = MAF
priority = 4, Hit
pausetime = 18, 18
sparkno = s7030 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -52
hitsound = s2, 3 
guardsound = s2, 0
ground.type = Low
ground.slidetime = 24
ground.hittime = 24
ground.velocity = 0.5, -6
air.velocity = 0.5, -6
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = 0
givepower = 36, 36
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
fall = 1
fall.recover = 0
yaccel = 0.5
forcestand = 1

[State 3140, hitlow4]
type = hitdef
trigger1 = animelem = 27 && anim = 3140
attr = S, HA 
damage = 32, 6
animtype = Hard 
fall.animtype = Hard 
guardflag = M 
hitflag = MAF
priority = 4, Hit
pausetime = 18, 18
sparkno = s7030 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -75
hitsound = s2, 3 
guardsound = s2, 0
ground.type = Low
ground.slidetime = 24
ground.hittime = 24
ground.velocity = 0.5, -6
air.velocity = 0.5, -6
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = 0
givepower = 36, 36
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
fall = 1
fall.recover = 0
yaccel = 0.5
forcestand = 1

[State 3140, hithigh]
type = hitdef
trigger1 = (animelem = 4 || animelem = 16) && anim = 3140
attr = S, HA 
damage = 32, 6
animtype = Hard 
guardflag = M 
hitflag = MAF
priority = 4, Hit
pausetime = 6, 6
sparkno = s7030 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -100
hitsound = s2, 3 
guardsound = s2, 0
ground.type = High
ground.slidetime = 24
ground.hittime = 24
ground.velocity = -4, 0
ground.cornerpush.veloff = 0
air.velocity = -4, -2
getpower = 0
givepower = 36, 36
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
yaccel = 0.5
forcestand = 1

[State 3140, hitfinal]
type = hitdef
trigger1 = animelem = 28 && anim = 3140
persistent = 0
attr = A, HA 
damage = 32, 6
animtype = Up
guardflag = M 
hitflag = MAF
priority = 4, Hit
pausetime = 2, 2
sparkno = s7030 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -100
hitsound = s2, 3 
guardsound = s2, 0
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
envshake.time = 18
envshake.freq = 120
envshake.ampl = 7
fall = 1
fall.recover = 0
yaccel = 0.5
forcestand = 1

[State Idle]
type = statetypeset
trigger1 = anim = 1101
movetype = I


;======================< METSU SHORYUU KEN >=============================
[Statedef 3160]
type = S
physics = S
movetype = A
anim = 3160
ctrl = 0
velset = 0, 0
poweradd = -2000
juggle = ifelse((prevstateno = [1000, 4999]), 0, 6) * !var(20)
facep2 = 1
sprpriority = 1

[State 3160, Strength]
type = varset
trigger1 = var(10) != 6
var(10) = 6

[State 3160, width]
type = width
trigger1 = anim = 3160 && animelemtime(4) >= 0 && animelemtime(9) < 0
player = 25, 0

[State 3160, Snd]
type = playsnd
trigger1 = anim = 3160 && animelem = 4
value = 3 + (var(1) = 2) * 11, 5 + (var(1) = 2)
channel = 0
volume = 200
[State 3160, Super Pause FX]
type = helper
trigger1 = anim = 3160 && animelem = 4
helpertype = normal
stateno = 7500
ID = 7500
name = "Super Charge"
postype = p1
pos = 3, -66
ownpal = 1
persistent = 0
supermovetime = 9999

[State 3160, ECreset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3160, Super Pause]
type = superpause
trigger1 = anim = 3160 && animelem = 4
time = 53
anim = -1
sound = s7, 0
p2defmul = 1
darken = 0

[State Corner Push]
type = varset
trigger1 = anim = 3160 && animelem = 4
fvar(5) = 0

[State 3160, NHB]
type = nothitby
trigger1 = anim = 3160 && animelemtime(7) < 1
trigger2 = movehit && (anim = 3160 || (anim = 3160 && animelemtime(12) < 0))
time = 1
value = SCA

[State 3160, Vel]
type = velset
trigger1 = anim = 3160 && animelemtime(5) >= 0 && animelemtime(7) < 0
x = 12
[State 3160, Snd]
type = playsnd
trigger1 = anim = 3160 && animelem = 5
value = 5, 12
[State 3160, Dust]
type = explod
trigger1 = anim = 3160 && animelemtime(5) >= 0 && vel x > 0.5 && !(time % 2)
anim = 7103
ID = 7103
sprpriority = 3
postype = p1
pos = 45, 0
vel = -2, 0
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 3160, Snd]
type = playsnd
trigger1 = anim = 3160 && animelem = 6
value = 3 + (var(1) = 2) * 10, 2 + (var(1) = 2) * 2
channel = 0

[State 3160, elbowhit]
type = hitdef
trigger1 = anim = 3160 && animelem = 7
attr = S, HA 
damage = 140, 18
animtype = Hard 
fall.animtype = Hard 
guardflag = M 
hitflag = MAF
priority = 4, Hit
pausetime = 0, 12
guard.pausetime = 12, 12
sparkno = s7030 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -64
hitsound = s2, 3 
guardsound = s2, 0
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
envshake.time = 18
envshake.freq = 120
envshake.ampl = 9
forcestand = 1
yaccel = 0.5
ID = 3160
forcestand = 1

[State 3160, p2state]
type = targetstate
trigger1 = anim = 3160 && animelemtime(7) >= 0 && animelemtime(8) < 0
trigger1 = movehit = 1 && numtarget(3160)
value = 3162
ID = 3160
ignorehitpause = 1
[State 3160, switch]
type = changeanim
trigger1 = anim = 3160 && animelemtime(8) >= 0 && animelemtime(9) < 0 && movehit
value = 3161
ignorehitpause = 0
persistent = 0

[State 3160, Vel]
type = velset
trigger1 = anim = 3161 && animelemtime(4) >= 0 && animelemtime(9) < 0 && p2bodydist x > 5
x = 3
[State 3160, Vel]
type = velset
trigger1 = anim = 3161 && animelem = 13
x = 18
y = -11
[State 3160, Vel]
type = velmul
trigger1 = 1
x = 0.88
[State 3160, Vel]
type = velmul
trigger1 = vel y > 0
x = 0
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

[State 3160, statetype]
type = statetypeset
trigger1 = anim = 3161 && animelemtime(13) >= 0
trigger2 = anim = 1101
statetype = A
physics = A
[State 3160, Anim]
type = changeanim
trigger1 = anim = 3161 && animelemtime(13) > 0 && vel y > -4
value = 1101
persistent = 0

[State 3160, Snd]
type = playsnd
trigger1 = anim = 3161 && animelem = 12
value = 4 + (var(1) = 2) * 10, 6 -(var(1) = 2) * 5
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
trigger1 = anim = 3161 && animelem = 9
value = 5, 13
[State 3160, Snd]
type = playsnd
trigger1 = anim = 3161 && animelem = 13
value = 5, 18

[State 3160, focus]
type = explod
trigger1 = anim = 3161 && animelem = 9
anim = 3167
sprpriority = 3
postype = p1
pos = 12, -25
removeongethit = 1
[State 3160, BG PalFX]
type = bgpalfx
trigger1 = anim = 3161 && animelem = 9
sinadd = 25, -150, -150, 32
time = 16

[State 3160, lowhit]
type = hitdef
trigger1 = animelem = 12 && anim = 3161
attr = S, HA
damage = 36, 4
animtype = Back 
guardflag = M 
hitflag = MAF
priority = 4, Hit
pausetime = 24, 24
sparkno = s7030 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -75
hitsound = s2, 3 
guardsound = s2, 0
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
envshake.time = 24
envshake.freq = 120
envshake.ampl = 9
fall = 1
fall.recover = 0
fall.animtype = Medium
yaccel = 0.5
forcestand = 1

[State 3160, shoryuuhit]
type = hitdef
trigger1 = anim = 3161 && !(animelemtime(13) % 3)
attr = A, HA 
damage = 24, 4
animtype = Diagup
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 4, 4
sparkno = s7030 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -106
hitsound = s2, 3
guardsound = s2, 0
p2facing = 1
ground.type = High
ground.slidetime = 16
ground.hittime = 16
p2facing = 1
ground.velocity = -3, -12
air.type = Low
air.velocity = -3, -12
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = 0
givepower = 36, 36
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
fall = 1
fall.recover = 0
yaccel = 0.5
forcestand = 1

[State 3160, Sparks]
type = helper
triggerall = movehit = 1 && numtarget
triggerall = (target, movetype = H) && !(target, time)
trigger1 = anim = 3160 && animelemtime(7) >= 0 && animelemtime(8) < 0
trigger2 = anim = 3161 && animelemtime(12) >= 0 && animelemtime(13) < 0
helpertype = normal
stateno = 7050
ID = 7050
name = "Shin Shoryuken Spark"
postype = p2
pos = (target, const(size.ground.front) -10), (ifelse(anim = 3161, -75, -64) -floor(p2dist y))
ownpal = 1
facing = -1
ignorehitpause = 1
pausemovetime = 255
supermovetime = 255

[State Idle]
type = statetypeset
trigger1 = anim = 3160 && animelemtime(8) >= 0
trigger2 = anim = 1101
movetype = I

[State 3160, End]
type = changestate
trigger1 = anim = 3160 && !animtime
value = 0
ctrl = 1


;--- --TARGET -----
[Statedef 3162]
type = S
physics = S
movetype = H
ctrl = 0
velset = 0, 0
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
trigger1 = 1
value = 5002
[State 3162, Shake]
type = posadd
trigger1 = 1
x = ifelse((time % 2), 1, -1)

[State 3162, End]
type = selfstate
trigger1 = time >= 90
value = 5001


;======================< REPPU JINRAI SHOU >=============================
[Statedef 3180]
type = S
physics = S
movetype = A
anim = 3180
ctrl = 0
velset = 0, 0
poweradd = -2000
sprpriority = 1
juggle = ifelse((prevstateno = [1000, 4999]), 0, 6) * !var(20)
facep2 = 1

[State 3180, Strength]
type = varset
trigger1 = var(10) != 6
var(10) = 6

[State 3180, Snd]
type = playsnd
trigger1 = animelem = 2
value = 4, 8
channel = 0
volume = 200
[State 3180, Super Pause FX]
type = helper
trigger1 = animelem = 2
helpertype = normal
stateno = 7500
ID = 7500
name = "Super Charge"
postype = p1
pos = 2, -67
ownpal = 1
persistent = 0
supermovetime = 9999

[State 3180, ECreset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3180, Super Pause]
type = superpause
trigger1 = animelem = 2
time = 53
movetime = 53
anim = -1
sound = s7, 0
p2defmul = 1
darken = 0

[State Corner Push]
type = varset
trigger1 = animelem = 2
fvar(5) = 0

[State 3180, NHB]
type = nothitby
trigger1 = animelemtime(16) < 0
time = 1
value = SCA

[State 3180, Vel]
type = velset
trigger1 = animelem = 21 || animelem = 33
x = 6
[State 3180, Vel]
type = velset
trigger1 = animelem = 38
x = 9
[State 3180, Dust]
type = explod
trigger1 = animelem = 21 || animelem = 33 || animelem = 38
anim = 7103
ID = 7103
sprpriority = 3
postype = p1
pos = 31, 0
vel = 1, 0
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 3180, Snd]
type = playsnd
trigger1 = animelem = 15 || animelem = 18 || animelem = 27 || animelem = 30
value = 3, 6
channel = 0
[State 3180, Snd]
type = playsnd
trigger1 = animelem = 22 || animelem = 34
value = 3, 7
channel = 0
[State 3180, Snd]
type = playsnd
trigger1 = animelem = 39
value = 3, 4
channel = 0

[State 3180, Snd]
type = playsnd
trigger1 = animelem = 15 || animelem = 27
value = 1, 1
channel = 1
[State 3180, Snd]
type = playsnd
trigger1 = animelem = 18 || animelem = 30
value = 1, 2
channel = 1
[State 3180, Snd]
type = playsnd
trigger1 = animelem = 22 || animelem = 34 || animelem = 39
value = 1, 3
channel = 1

[State 3180, highhits]
type = hitdef
trigger1 = animelem = 15 || animelem = 18 || animelem = 27 || animelem = 30
attr = S, HA 
damage = 40, 5
animtype = Hard 
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 2, 2
sparkno = s7030 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -86
hitsound = s2, 2 
guardsound = s2, 0
ground.type = High
ground.slidetime = 20
ground.hittime = 20
ground.velocity = ifelse(p2bodydist x > 35, 1, -2), 0
ground.cornerpush.veloff = 0
air.type = Low
air.velocity = -5, -7
getpower = 0
givepower = 36, 36
envshake.time = 8
envshake.freq = 120
envshake.ampl = 6
forcestand = 1
yaccel = 0.5
air.fall = 1
fall.recover = 0

[State 3180, lowhits]
type = hitdef
trigger1 = animelem = 22 || animelem = 34
attr = S, HA 
damage = 40, 5
animtype = Hard 
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 2, 2
sparkno = s7030 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -60
hitsound = s2, 3 
guardsound = s2, 0
ground.type = Low
ground.slidetime = 20
ground.hittime = 20
ground.velocity = ifelse(p2bodydist x > 35, 1, -3), 0
ground.cornerpush.veloff = 0
air.type = Low
air.velocity = -5, -7
getpower = 0
givepower = 36, 36
envshake.time = 8
envshake.freq = 120
envshake.ampl = 6
forcestand = 1
yaccel = 0.5
air.fall = 1
fall.recover = 0

[State 3180, uppercut]
type = hitdef
trigger1 = animelem = 39
ID = 3180
attr = S, HA 
damage = 40, 5
animtype = Up
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 12, 12
sparkno = s7030 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -77
hitsound = s2, 3 
guardsound = s2, 0
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
envshake.time = 8
envshake.freq = 120
envshake.ampl = 6
forcestand = 1
yaccel = 0.6
forcestand = 1
fall = 1
fall.recover = 0

[State Idle]
type = statetypeset
trigger1 = animelemtime(40) >= 0
movetype = I

[State 3180, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================< SHINKUU TATSUMAKI SENPUU KYAKKU >=============================
[Statedef 3200]
type = S
physics = S
movetype = A
anim = 3200
ctrl = 0
velset = 0, 0
poweradd = -1000
juggle = ifelse((prevstateno = [1000, 4999]), 0, 6) * !var(20)
facep2 = 1
sprpriority = 1

[State 3200, Strength]
type = varset
trigger1 = var(10) != 5
var(10) = 5

;[State 3200, Strength]
;type = varset
;trigger1 = !time && var(34)
;var(34) = 0
;[State 3200, Strength]
;type = varset
;trigger1 = !time && var(1) = 3
;var(34) = command = "2qcbs"

[State 3200, Snd]
type = playsnd
trigger1 = anim = 3200 && animelem = 2
value = 4 + (var(1) = 2) * 10, 3
channel = 0
volume = 200
[State 3200, Snd]
type = playsnd
trigger1 = anim = 3200 && animelem = 2 && var(1) = 3; && var(34)
value = 4, 99
channel = 0
volume = 200

[State 3200, Super Pause FX]
type = helper
trigger1 = anim = 3200 && animelem = 3
helpertype = normal
stateno = 7500
ID = 7500
name = "Super Charge"
postype = p1
pos = -27, -16
ownpal = 1
persistent = 0
supermovetime = 9999

[State 3200, ECreset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3200, Super Pause]
type = superpause
trigger1 = anim = 3200 && animelem = 3
time = 45
anim = -1
sound = s7, 0
p2defmul = 1
darken = 0

[State Corner Push]
type = varset
trigger1 = anim = 3200 && animelem = 3
fvar(5) = 0

[State 3200, NHB]
type = nothitby
trigger1 = anim = 3200
time = 1
value = SCA
[State 3200, width]
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
type = velset
trigger1 = anim = 3200 && animelem = 5
y = -3.3

[State 3200, Anim]
type = changeanim
trigger1 = anim = 3200 && !animtime
;value = ifelse(var(1) = 1 || var(34), 3201, 3202)
value = ifelse(var(1) = 2, 3202, 3201)
[State 3200, Snd]
type = playsnd
trigger1 = anim = [3201, 3202]
value = 4 + (var(1) = 2) * 10, 14 -(var(1) = 2) * 2
channel = 0
persistent = 0

[State 3200, Vel]
type = velset
trigger1 = anim = [3201, 3202]
;y = ifelse((var(1) = 1 && !var(34)), -.5, 0.15)
y = ifelse(var(1) = 2, -.5, 0.15)
[State 3200, Push]
type = playerpush
trigger1 = anim = 3201 || anim = 3202 || anim = 1207
value = 0
ignorehitpause = 1

[State 3200, spin]
type = playsnd
triggerall = anim = 3201 || anim = 3202
trigger1 = animelem = 1 || animelem = 7 || animelem = 13 || animelem = 19 || animelem = 25 || animelem = 31 || animelem = 37
value = 1, 5
channel = 1

[State 3200, Anim]
type = changeanim
trigger1 = (anim = [3201, 3202]) && !animtime
value = 1207
persistent = 0

[State 3200, statetype]
type = statetypeset
trigger1 = anim = 3200 && animelemtime(5) >= 0
trigger2 = anim = 1207 && animelemtime(1) > 1
statetype = A
physics = A
[State 3200, statetype]
type = statetypeset
trigger1 = anim = 3200 && animtime = -1
trigger2 = anim = [3201, 3202]
statetype = A
physics = N

[State 3200, Hit]
type = hitdef
trigger1 = anim = 3201 && (animelem = 2 || animelem = 8 || animelem = 14 || animelem = 20 || animelem = 26 || animelem = 32 || animelem = 38)
attr = S, HA 
damage = 20, 3 
animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 5, 0
sparkno = s7030 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -70
hitsound = sifelse(hitcount, -1, 2), 6
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
p2facing = 1
ground.velocity = ifelse((p2dist x != [ -30, 30]), 20, 15), 0
ground.cornerpush.veloff = 0
air.type = Low
air.velocity = ifelse((p2dist x != [ -30, 30]), 6, 5), ifelse(p2dist y < (enemy, const(size.mid.pos.y)) + 45, -1, -4)
getpower = 0
givepower = 36, 36
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
air.fall = 1
fall.recover = 0
sprpriority = -1
forcestand = 1
yaccel = 0.5
forcestand = 1

[State 3200, Hit]
type = hitdef
trigger1 = anim = 3201 && (animelem = 5 || animelem = 11 || animelem = 17 || animelem = 23 || animelem = 29 || animelem = 35)
attr = S, HA 
damage = 20, 3 
animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 5, 0
sparkno = s7030 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -70
hitsound = sifelse(hitcount, -1, 2), 6
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
p2facing = -1
ground.velocity = ifelse((p2dist x != [ -30, 30]), -20, -15), 0
ground.cornerpush.veloff = 0
air.type = Low
air.velocity = ifelse((p2dist x != [ -30, 30]), -6, -5), ifelse(p2dist y < (enemy, const(size.mid.pos.y)) + 45, -1, -4)
getpower = 0
givepower = 36, 36
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
air.fall = 1
fall.recover = 0
sprpriority = 1
forcestand = 1
yaccel = 0.5
forcestand = 1

[State 3200, hitfinal]
type = hitdef
trigger1 = anim = 3201 && animelem = 41
attr = S, HA 
damage = 20, 3 
animtype = Diagup
air.animtype = Diagup
fall.animtype = Diagup
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 5, 0
sparkno = s7030 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -70
hitsound = sifelse(hitcount, -1, 2), 6
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
p2facing = -1
ground.velocity = -6, -4
air.type = Low
air.velocity = -6, -4
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = 0
givepower = 36, 36
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
fall = 1
fall.recover = 0
sprpriority = 1
yaccel = 0.5
forcestand = 1

[State 3200, hitevil]
type = hitdef
trigger1 = anim = 3202 && (animelem = 2 || animelem = 8 || animelem = 14 || animelem = 20 || animelem = 26 || animelem = 32 || animelem = 38)
attr = S, HA 
damage = 18, 3 
animtype = Hard 
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 3, 0
sparkno = s7030 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -70
hitsound = sifelse(hitcount, -1, 2), 6
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
p2facing = 1
ground.velocity = ifelse(p2dist x > 30, 18, 15), ifelse(p2dist y < (enemy, const(size.mid.pos.y)) + 60, 0, -3.5)
air.type = Low
air.velocity = ifelse(p2dist x > 30, 18, 15), ifelse(p2dist y < (enemy, const(size.mid.pos.y)) + 60, 0, -3.5)
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = 0
givepower = 36, 36
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
fall = 1
fall.recover = 0
sprpriority = -1
yaccel = 0.5
forcestand = 1

[State 3200, hitevil]
type = hitdef
trigger1 = anim = 3202 && (animelem = 5 || animelem = 11 || animelem = 17 || animelem = 23 || animelem = 29 || animelem = 35)
attr = S, HA 
damage = 18, 3 
animtype = Hard 
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 3, 0
sparkno = s7030 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -70
hitsound = sifelse(hitcount, -1, 2), 6
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
p2facing = -1
ground.velocity = ifelse(p2dist x > 30, -18, -15), ifelse(p2dist y < (enemy, const(size.mid.pos.y)) + 60, 0, -3.5)
air.type = Low
air.velocity = ifelse(p2dist x > 30, -18, -15), ifelse(p2dist y < (enemy, const(size.mid.pos.y)) + 60, 0, -3.5)
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = 0
givepower = 36, 36
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
fall = 1
fall.recover = 0
sprpriority = 1
yaccel = 0.5
forcestand = 1

[State 3200, hitevilfinal]
type = hitdef
trigger1 = anim = 3202 && animelem = 41
attr = S, HA 
damage = 18, 3 
animtype = Diagup
air.animtype = Diagup
fall.animtype = Diagup
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 3, 0
sparkno = s7030 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -70
hitsound = sifelse(hitcount, -1, 2), 6
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
p2facing = 1
ground.velocity = -12, -4
air.type = Low
air.velocity = -12, -4
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = 0
givepower = 36, 36
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
fall = 1
fall.recover = 0
sprpriority = 1
yaccel = 0.5
forcestand = 1

[State 3200, HitSound]
type = playsnd
triggerall = movehit = 1 && hitcount > 1
trigger1 = anim = 3201 && hitpausetime = 4
trigger2 = anim = 3202 && hitpausetime = 2
value = 2, 6
channel = 2
ignorehitpause = 1

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
trigger1 = (anim = [3201, 3202]) && (animelem = 5 || animelem = 11 || animelem = 17 || animelem = 23 || animelem = 29 || animelem = 35 || animelem = 41)
anim = 3211
sprpriority = 2
postype = p1
pos = -10, -ceil(pos y)
vel = -3, 0
ownpal = 1
[State 3200, Dust]
type = explod
trigger1 = (anim = [3201, 3202]) && (animelem = 2 || animelem = 8 || animelem = 14 || animelem = 20 || animelem = 26 || animelem = 32 || animelem = 38)
anim = 3211
sprpriority = 2
postype = p1
facing = -1
pos = 10, -ceil(pos y)
vel = 3, 0
ownpal = 1

[State 3200, ^__^]
type = helper
trigger1 = !time && var(1) = 3; && var(34)
helpertype = normal
stateno = 3215
ID = 3215
name = "Cloud"
postype = back
pos = ceil(pos x) + 160, -260
supermovetime = 9999
persistent = 0

[State 3200, pullhelper]
type = helper
trigger1 = (anim = [3201, 3202]) && !numhelper(3205)
helpertype = normal
stateno = 3205
ID = 3205
name = "Vaccum"
postype = p2
pos = enemynear, const(size.ground.back) -25, -ceil(enemy, pos y)
persistent = 0
size.ground.back = 5
size.ground.front = 5
size.height = 240

[State Idle]
type = statetypeset
trigger1 = anim = 1207
movetype = I


;======================< SHUN GOKU SATSU >=============================
[Statedef 4000]
type = S
physics = S
movetype = A
anim = 4000
ctrl = 0
velset = 0, 0
poweradd = -3000
juggle = 15
facep2 = 1
sprpriority = 1

[State 4000, Strength]
type = varset
trigger1 = var(10) != 7
var(10) = 7

[State 4000, Snd]
type = playsnd
trigger1 = !time
value = 14, 6
channel = 0
volume = 200
[State 4000, Super Pause FX]
type = helper
trigger1 = !time
helpertype = normal
stateno = 7500
ID = 7500
name = "Super Charge"
postype = p1
pos = 7, -105
ownpal = 1
persistent = 0
supermovetime = 9999

[State 4000, ECreset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 4000, Super Pause]
type = superpause
trigger1 = !time
time = 60
anim = -1
sound = s7, 0
p2defmul = 1
darken = 0

[State Corner Push]
type = varset
trigger1 = !time
fvar(5) = 0

[State 4000, NHB]
type = nothitby
trigger1 = time < 6
time = 1
value = SCA

[State 4000, Vel]
type = velset
trigger1 = 1
x = 5
[State 4000, Snd]
type = playsnd
trigger1 = animelemtime(1) > 1
value = 5, 4
persistent = 0

[State 4000, Miss]
type = hitdef
trigger1 = time
attr = S, HT
hitflag = 

[State 4000, Hit]
type = hitdef
trigger1 = time
trigger1 = !var(38)
trigger1 = p2dist x >= 0 && p2bodydist x <= 12
attr = S, HT
hitflag = M-
priority = 6, Miss
numhits = 0
sparkno = -1
p1facing = 1
p2facing = 1
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

[State Throw]
type = targetstate
trigger1 = !time
value = 1114002

[State 4001, Snd]
type = playsnd
trigger1 = !time
value = 5, ifelse(var(1) = 3, 17, 11)
[State 4001, grabsnd]
type = playsnd
trigger1 = !time
value = 0, 800

[State 4001, vsothers]
type = varset
trigger1 = !time
var(30) = 234

[State 4001, vsgoukiorgen]
type = varset
triggerall = !time && numtarget
trigger1 = target, name = "Gouki" || target, name = "Shin Gouki" || target, name = "Akuma" || target, name = "Shin Akuma"
trigger2 = target, name = "Mech Gouki" || target, name = "Cyber Akuma" || target, name = "Gen"
trigger3 = target, name = "Pocket Shin Gouki" || target, name = "cvsgouki" || target, name = "SF3Gouki"
trigger4 = target, name = "SoulGen" || target, name = "Gouki_Cota" || target, name = "Gouki CVS 3"
var(30) = 40

[State 4001, vsevilryu]
type = varset
triggerall = !time && numtarget
trigger1 = target, name = "Evil Ryu" || target, name = "ERyu"
trigger2 = target, name = "Ryu" && target, authorname = "Phantom.of.the.Server" && target, var(1) != 1
trigger3 = target, name = "CVSEvilRyu" || target, name = "Destrudo Ryu"
trigger4 = target, name = "Ryu" && target, authorname = "N64Mario" && target, palno >= 7
trigger5 = target, name = "cvsryu" && target, authorname = "Warusaki3" && target, var(12) = 10
trigger6 = target, name = "eRYU -SvsC"
var(30) = 50

[State 4001, vsothersgsusers]
type = varset
triggerall = !time && numtarget
trigger1 = target, name = "God Rugal" || target, name = "Dark Sakura"
trigger2 = target, name = "Oyaji" && target, authorname = "Mr.Chainsaw & Phantom.of.the.Server"
trigger3 = target, name = "cvsrugal" && target, authorname = "Warusaki3" && target, var(12) = 10
trigger4 = target, name = "cvsg_rugal" && target, authorname = "Warusaki3"
trigger5 = target, name = "Tin's S_Gouki" || target, name = "Blaze Agent"
var(30) = 50

[State 4001, vsCAPCOMbadguys]
type = varset
triggerall = !time && numtarget
trigger1 = target, name = "Demitri" || target, name = "Jedah"
trigger2 = target, name = "Vega" && (target, authorname = "Phantom.of.the.Server" || target, authorname = "Messatsu")
trigger3 = target, name = "cvsvega" && (target, authorname = "Warusaki3" || target, authorname = "Gargoyle")
trigger4 = target, name = "M.Bison" && target, authorname = "N -Mario"
trigger5 = target, name = "[Necromancer's] M. Bison"
trigger6 = target, name = "M. Bison" && target, authorname = "VK, Updated by Terry Kuo, adapted by Tenebrous"
trigger7 = target, name = "CvSBison" && target, authorname = "Team Kai (Saiai and Koga)"
trigger8 = target, name = "Shadow DIO" || target, name = "Gill"
var(30) = 456

[State 4001, vsSNKbadguys]
type = varset
triggerall = !time && numtarget
trigger1 = target, name = "Geese" || target, name = "Orochi" || target, name = "Mukai" || target, name = "Ryuji Yamazaki"
trigger2 = target, name = "Geese Howard" || target, name = "Yamazaki"
trigger3 = target, name = "cvsgeese" || target, name = "DGeese" || target, name = "ORIGINAL ZERO"
trigger4 = target, name = "cvsyamazaki" || target, name = "Orochi Rebirth" || target, name = "Tin's Mukai"
trigger5 = target, name = "geese_mmx" || target, name = "Setsuna"
var(30) = 456

[State 4001, vsrugal]
type = varset
triggerall = !time && numtarget
trigger1 = target, name = "Rugal" || target, name = "Rugal Bernstein" || target, name = "Omega Rugal"
trigger2 = target, name = "Rugal94" || target, name = "Rugal94(BOSS)" || target, name = "rugal_B"
trigger3 = target, name = "Rugal_TLE" || target, name = "Omega Rugal Gb" || target, name = "Tin G_rugal"
trigger4 = target, name = "Mech Rugal" || target, name = "Tin 2002_rugal" 
trigger5 = target, name = "Rugal CvS" 
trigger6 = target, name = "cvsrugal" && target, authorname = "Warusaki3" && target, var(12) != 10
var(30) = 456

[State 4001, vsMKbadguys]
type = varset
triggerall = !time && numtarget
trigger1 = target, name = "Shao Kahn" || target, name = "Shang Tsung" || target, name = "Goro"
trigger2 = target, name = "Kintaro" || target, name = "Motaro"
trigger3 = target, name = "shaokahn"
var(30) = 456

[State 4001, vsMARVELbadguys]
type = varset
triggerall = !time && numtarget
trigger1 = target, name = "Dr.Doom"
trigger2 = target, name = "Dr. Doom by WhiteMagic2002"
var(30) = 456

[State 4001, vsGGbadguys]
type = varset
triggerall = !time && numtarget
trigger1 = target, name = "Justice" || target, name = "Testament"
var(30) = 456

[State 4001, vsrandombadguys >= )]
type = varset
triggerall = !time && numtarget
trigger1 = target, name = "Sevil Nahte" || target, name = "Perfect Weapon MB -02"
trigger2 = target, name = "Jaian"; lol = D
var(30) = 456

;NEED TO FINISH

[State 4001, Recover]
type = varadd
triggerall = animelemtime(2) > 0 && animelemtime(35) < 0
triggerall = (var(30) = [1, 99]) && numtarget
triggerall = target, life >= 0.33 * (target, lifemax)
trigger1 = (target, command = "x") || (target, command = "y") || (target, command = "z")
trigger2 = (target, command = "a") || (target, command = "b") || (target, command = "c")
trigger3 = (target, command = "up") || (target, command = "down") || (target, command = "back") || (target, command = "fwd")
var(30) = -1

[State 4001, Debug]
type = displaytoclipboard
trigger1 = var(30) < 100
text = " %d button presses to recover"
params = var(30)
[State 4001, Debug]
type = displaytoclipboard
trigger1 = var(30) = 234
text = "Normal Damage"
[State 4001, Debug]
type = displaytoclipboard
trigger1 = var(30) = 456
text = "Extra Damage"

[State 4001, Pause]
type = pause
trigger1 = animelemtime(2) >= 0 && animelemtime(17) < 0
time = 2
movetime = 2
[State 4001, Push]
type = playerpush
trigger1 = animelemtime(17) >= 0
value = 0
[State 4001, nothitby]
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
time = 4
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
triggerall = var(30) > 0
trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8 || animelem = 9
trigger2 = animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15 || animelem = 16
value = 1

[State 4001, hitdamage]
type = targetlifeadd
trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8 || animelem = 9
trigger2 = animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15 || animelem = 16
value = ifelse((var(30) = 456), -40, -32)
kill = animelem = 16

[State 4001, givepower]
type = targetpoweradd
trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8 || animelem = 9
trigger2 = animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15 || animelem = 16
value = 36

[State 4001, HitSound]
type = playsnd
trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8 || animelem = 9
trigger2 = animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15 || animelem = 16
value = 2, ifelse(!var(30), 0, ifelse((animelem = 16), 8, 3))
channel = 2

[State 4001, Sparks]
type = explod
trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8 || animelem = 9
trigger2 = animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15 || animelem = 16
anim = ifelse(!var(30), 7001, 7030 + (random % 8))
ID = 7000
sprpriority = 5
postype = p2
pos = 0, (target, const(size.mid.pos.y))
random = 60, 60
facing = -1
ownpal = 1
ontop = 1
pausemovetime = 300
supermovetime = 300

[State 4001, Shake]
type = envshake
trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8 || animelem = 9
trigger2 = animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15 || animelem = 16
time = 6
freq = 120
ampl = -4

[State 4001, Snd]
type = playsnd
trigger1 = animelemtime(16) = 10
value = 14, 7
channel = 0

[State 4001, throw]
type = targetstate
trigger1 = animelemtime(16) >= 0 && numtarget
value = 1114003
persistent = 0

[State 4001, interrupt]
type = changestate
triggerall = animelemtime(2) > 0 && animelemtime(16) < 0
trigger1 = !var(30) && numtarget
trigger2 = target, stateno = 1114010
value = 4009

[State 4001, End]
type = changestate
trigger1 = animelemtime(16) >= 0 && winko
value = 362
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


;--- PLAYER ---
[Statedef 4009]
type = S
physics = S
movetype = H
anim = 5910
velset = -5, 0
ctrl = 0
[State 4009, target]
type = targetstate
trigger1 = !time && numtarget
value = 1114010
[State 4009, imageoff]
type = afterimagetime
trigger1 = 1
time = 0
[State 4009, Snd]
type = playsnd
trigger1 = !time
value = 5010, 5
channel = 0
[State 4009, Anim]
type = changeanim
trigger1 = anim = 5910 && time = 45
value = 5911

[State 4009, Flash]
type = palfx
trigger1 = !time
add = 30, 30, 100
sinadd = 30, 30, 100, 8
time = 8
[State 4009, Snd]
type = playsnd
trigger1 = !time
value = 7, 1
[State 4009, lightning]
type = helper
trigger1 = !time
helpertype = normal
stateno = 4012
ID = 4012
postype = p1
pos = 0, -60
ownpal = 1
persistent = 0
pausemovetime = 99
supermovetime = 99

[State 4009, End]
type = changestate
trigger1 = anim = 5911 && !animtime
value = 0
ctrl = 1


;--- PLAYER ---
[Statedef 1114010]
type = S
physics = S
movetype = H
anim = 0
velset = -5, 0
ctrl = 0
[State 1114010, Anim]
type = changeanim
trigger1 = !time && selfanimexist(150)
value = 150
[State 1114010, Anim]
type = changeanim
trigger1 = anim = 150 && selfanimexist(140) && time >= 45
value = 140
[State 1114010, Flash]
type = palfx
trigger1 = !time
add = 30, 30, 100
sinadd = 30, 30, 100, 8
time = 8
[State 1114010, End]
type = selfstate
trigger1 = anim = 140 && !animtime
trigger2 = anim = 0 && time >= 54
value = 0
ctrl = 1
