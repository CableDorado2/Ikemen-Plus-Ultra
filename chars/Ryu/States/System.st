; ______________________________
;| Ryu by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==============================================================================================
;=======================================< COMMON STATES >========================================
;==============================================================================================

;==========< PARRY >==========
;--- STANDING ---
[Statedef 700]
type = S
physics = S
movetype = I
anim = 700
velset = 0, 0
ctrl = 0
sprpriority = 2
poweradd = 78
facep2 = 1

[State 700, HB]
type = hitby
trigger1 = 1
value = SCA, AT
time = 1
[State 700, Stop]
type = posfreeze
trigger1 = 1
value = 1

[State 700, Pause]
type = pause
trigger1 = !time
time = 15
movetime = 15
endcmdbuftime = 15
pausebg = 0
[State 700, Pause]
type = pause
trigger1 = !time && numenemy
trigger1 = (enemynear, movehit = 1)
time = ifelse((enemynear, hitpausetime = [0, 15]), 15 -(enemynear, hitpausetime), 0)
movetime = ifelse((enemynear, hitpausetime = [0, 15]), 15 -(enemynear, hitpausetime), 0)
endcmdbuftime = ifelse((enemynear, hitpausetime = [0, 15]), 15 -(enemynear, hitpausetime), 0)
pausebg = 0

[State 700, Flash]
type = palfx
trigger1 = !time
add = 0, 50, 255
sinadd = 0, -50, -255, 60
time = 15

[State 700, Snd]
type = playsnd
trigger1 = !time
value = 3 + (var(1) = 2) * 10, 6 -(var(1) = 2) * 3
channel = 0
[State 700, Snd]
type = playsnd
trigger1 = !time
value = 7, 3

[State 700, Spark]
type = explod
trigger1 = animelem = 2
anim = 7200
ID = 7200
sprpriority = 5
postype = p1
pos = 31, -69
pausemovetime = 60
ownpal = 1
scale = 0.5, 0.5

[State 700, No walking]
type = assertspecial
trigger1 = 1
flag = nowalk
[State 700, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- CROUCHING ---
[Statedef 701]
type = C
physics = C
movetype = I
anim = 701
velset = 0, 0
ctrl = 0
sprpriority = 2
poweradd = 78
facep2 = 1

[State 701, HB]
type = hitby
trigger1 = 1
value = SCA, AT
time = 1
[State 701, Stop]
type = posfreeze
trigger1 = 1
value = 1

[State 701, Pause]
type = pause
trigger1 = !time
time = 15
movetime = 15
endcmdbuftime = 15
pausebg = 0
[State 701, Pause]
type = pause
trigger1 = !time && numenemy
trigger1 = (enemynear, movehit = 1)
time = ifelse((enemynear, hitpausetime = [0, 15]), 15 -(enemynear, hitpausetime), 0)
movetime = ifelse((enemynear, hitpausetime = [0, 15]), 15 -(enemynear, hitpausetime), 0)
endcmdbuftime = ifelse((enemynear, hitpausetime = [0, 15]), 15 -(enemynear, hitpausetime), 0)
pausebg = 0

[State 701, Flash]
type = palfx
trigger1 = !time
add = 0, 50, 255
sinadd = 0, -50, -255, 60
time = 15

[State 701, Snd]
type = playsnd
trigger1 = !time
value = 3 + (var(1) = 2) * 10, 6 -(var(1) = 2) * 3
channel = 0
[State 701, Snd]
type = playsnd
trigger1 = !time
value = 7, 3

[State 701, Spark]
type = explod
trigger1 = animelem = 2
anim = 7200
ID = 7200
sprpriority = 5
postype = p1
pos = 25, -22
pausemovetime = 60
ownpal = 1
scale = 0.5, 0.5

[State 701, No walking]
type = assertspecial
trigger1 = 1
flag = nowalk
[State 701, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1


;--- AERIAL ---
[Statedef 702]
type = A
physics = A
movetype = I
anim = 702
ctrl = 0
sprpriority = 2
poweradd = 78
facep2 = 1

[State 702, HB]
type = hitby
trigger1 = time < 15
value = SCA, AT
time = 1

[State 702, Pause]
type = pause
trigger1 = !time
time = 15
movetime = 15
endcmdbuftime = 15
pausebg = 0
[State 702, Pause]
type = pause
trigger1 = !time && numenemy
trigger1 = (enemynear, movehit = 1)
time = ifelse((enemynear, hitpausetime = [0, 15]), 15 -(enemynear, hitpausetime), 0)
movetime = ifelse((enemynear, hitpausetime = [0, 15]), 15 -(enemynear, hitpausetime), 0)
endcmdbuftime = ifelse((enemynear, hitpausetime = [0, 15]), 15 -(enemynear, hitpausetime), 0)
pausebg = 0

[State 702, Type]
type = statetypeset
trigger1 = time < 15
physics = N
[State 702, Stop]
type = posfreeze
trigger1 = time < 15
value = 1

[State 702, Vel]
type = velset
trigger1 = time = 15
x = ifelse(vel x > 2, 2, ifelse(vel x < -2, -2, vel x))
y = ifelse(vel y < -2, vel y, -2)
[State 702, Type]
type = statetypeset
trigger1 = time >= 15
physics = A
[State 702, Ctrl]
type = ctrlset
trigger1 = time >= 15
value = 1

[State 702, Flash]
type = palfx
trigger1 = !time
add = 0, 64, 255
sinadd = 0, -64, -255, 60
time = 15

[State 702, Snd]
type = playsnd
trigger1 = !time
value = 3 + (var(1) = 2) * 10, 6 -(var(1) = 2) * 3
channel = 0
[State 702, Snd]
type = playsnd
trigger1 = !time
value = 7, 3

[State 702, Spark]
type = explod
trigger1 = animelem = 2
anim = 7200
ID = 7200
sprpriority = 5
postype = p1
pos = 40, -66
pausemovetime = 60
ownpal = 1
scale = 0.5, 0.5

[State 702, asserts]
type = assertspecial
trigger1 = 1
flag = noairguard
[State 702, Ctrl]
type = ctrlset
trigger1 = time > 10
value = 1


;==========< DODGE >==========
[Statedef 710]
type = S
physics = S
movetype = I
anim = 710
velset = 0, 0
ctrl = 0
sprpriority = -1
[State 710, Snd]
type = playsnd
trigger1 = animelem = 1
value = 3 + (var(1) = 2) * 10, 7 * (var(1) != 2)
channel = 0
[State 710, Push]
type = playerpush
trigger1 = 1
value = 0
[State 710, HB]
type = hitby
trigger1 = 1
value = SCA, AT
time = 1
[State 710, Attack]
type = changestate
trigger1 = !AIlevel && (time = [15, 25])
trigger1 = command = "x" || command = "y" || command = "z" || command = "a" || command = "b" || command = "c"
value = ifelse((command = "x" || command = "y" || command = "z"), 210, 220)
[State 710, Attack]
type = changestate
trigger1 = AIlevel && (time = [15, 25]) && (p2dist x = [0, 60]) && p2movetype != A
value = ifelse(random < 500, 210, 220)
[State 710, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;==========< FORWARD ROLL >==========
[Statedef 720]
type = C
physics = C
movetype = I
anim = 720
velset = 0, 0
ctrl = 0
sprpriority = 1
[State 720, Snd]
type = playsnd
trigger1 = animelem = 1
value = 3 + (var(1) = 2) * 10, 6 * (var(1) != 2)
channel = 0
[State 720, Snd]
type = playsnd
trigger1 = animelem = 1 && random < 500
value = 3 + (var(1) = 2) * 10, 2 + (var(1) = 2)
channel = 0
[State 720, Vel]
type = velset
trigger1 = animelemtime(2) >= 0 && animelemtime(7) < 0
x = 6
[State 720, Push]
type = playerpush
trigger1 = 1
value = 0
[State 720, HB]
type = hitby
trigger1 = animelemtime(8) < 0
value = SCA, AT
time = 1
[State 720, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;==========< POWER CHARGE >==========
[Statedef 740]
type = S
physics = S
movetype = I
anim = 740
ctrl = 0
velset = 0, 0

[State 740, Power]
type = poweradd
triggerall = anim = 740 && power < powermax
trigger1 = !AIlevel && (command = "holdb" && command = "holdy")
trigger2 = AIlevel
value = 2 + ifelse(time < 60, 0, (time -60) / 10)

[State 740, Snd]
type = playsnd
trigger1 = anim = 740 && time = 8
value = 3 + (var(1) = 2) * 10, 5 + (var(1) = 2)
channel = 0

[State 740, Flash]
type = palfx
trigger1 = 1
time = 1
add = 75 + ceil(sin(time / 6.0 * pi) * 75), 25 + ceil(sin(time / 6.0 * pi) * 25), 0

[State 740, FX]
type = helper
trigger1 = anim = 740 && animelemtime(2) >= 0
trigger1 = !numhelper(7240)
helpertype = normal
stateno = 7240
ID = 7240
name = "Power Charge"
postype = p1
pausemovetime = 65535
supermovetime = 65535
ownpal = 1
[State 740, FX]
type = helper
trigger1 = anim = 740 && animelemtime(2) >= 0
trigger1 = !numhelper(7243)
helpertype = normal
stateno = 7243
ID = 7243
name = "Particles"
postype = p1
pausemovetime = 65535
supermovetime = 65535
ownpal = 1

[State 740, Anim]
type = changeanim
triggerall = anim != 741
trigger1 = !AIlevel && (command != "holdb" || command != "holdy")
trigger2 = power >= const(data.power) || power >= powermax || roundstate != 2
trigger3 = AIlevel && (inguarddist || p2movetype = A || p2dist x < 160)
value = 741

[State 740, Ctrl]
type = ctrlset
trigger1 = anim = 741
value = 1

[State 740, Snd]
type = stopsnd
trigger1 = anim = 741
channel = 0
persistent = 0
[State 740, Snd]
type = playsnd
trigger1 = anim = 741 && power >= powermax
value = 4 + (var(1) = 2) * 10, 10 -(var(1) = 2)
channel = 0
persistent = 0
[State 740, End]
type = changestate
trigger1 = anim = 741 && !animtime
value = 0
ctrl = 1


;==========< ZERO COUNTER >==========
[Statedef 750]
type = S
physics = S
movetype = I
anim = 750
ctrl = 0
velset = 0, 0
poweradd = -2000
sprpriority = 2
facep2 = 1

[State 750, Strength]
type = varset
trigger1 = !time && !AIlevel
var(10) = ifelse((command = "Counter_P"), 1, 2)
ignorehitpause = 1
[State 750, Strength AI]
type = varset
trigger1 = !time && AIlevel
var(10) = ifelse((p2statetype = A), 1, ifelse((p2statetype = C), 2, ifelse(random < 500, 1, 2)))
ignorehitpause = 1

[State 750, Snd]
type = playsnd
trigger1 = !time
value = 3 + (var(1) = 2) * 10, 7 -(var(1) = 2) * 4
channel = 0
[State 750, Super Pause FX]
type = helper
trigger1 = !time
helpertype = normal
stateno = 7250
ID = 7250
postype = p1
pos = 16, -79
ownpal = 1
persistent = 0
supermovetime = 999
[State 750, Super Pause]
type = superpause
trigger1 = !time
time = 20
movetime = 20
anim = -1
sound = s7, 1
p2defmul = 1
darken = 0
[State 750, End]
type = changestate
trigger1 = time >= 20
value = ifelse(var(10) = 1, 1100, 255)


;===================< CUSTOM COMBO >===================
[Statedef 760]
type = U
physics = U
movetype = A
anim = ifelse(statetype = A, 762, 760 + (var(1) = 2))
ctrl = 0
velset = ifelse((statetype = S), 0, vel x), ifelse((statetype = S), 0, vel y)
poweradd = -1000
[State 760, Stop]
type = posfreeze
trigger1 = anim = 762
value = 1

[State 760, Snd]
type = playsnd
trigger1 = !time
value = 4 + (var(1) = 2) * 10, 10 -(var(1) = 2)
channel = 0
[State 760, Super Pause FX]
type = helper
trigger1 = !time
helpertype = normal
stateno = 7260
ID = 7260
postype = p1
pos = ifelse((anim = 760), -2, ifelse((anim = 762), -5, -8)), ifelse((anim = 760), -62, ifelse((anim = 762), -77, -43))
ownpal = 1
size.xscale = 1
size.yscale = 1
persistent = 0
supermovetime = 9999
[State 760, superchargepause]
type = superpause
trigger1 = !time
time = 30
anim = -1
sound = s7, 2
darken = 0
movetime = 30 * (anim != 762)

[State Corner Push]
type = varset
trigger1 = !time
fvar(5) = 0

[State 760, Var]
type = varset
trigger1 = (anim = [760, 761]) && !animtime
trigger2 = anim = 762 && !time
var(20) = 180

[State 760, NHB]
type = nothitby
trigger1 = (anim = [760, 761])
trigger2 = anim = 762 && time <= 1
time = 8
value = SCA

[State 760, Shadows]
type = afterimage
trigger1 = (anim = [760, 761]) && time = 30
trigger2 = anim = 762 && time = 1
time = 2
timegap = 1
framegap = 4
length = 13
paladd = 0, 0, 0
palmul = 0.75, 0.75, 0.75
palcontrast = 64, 128, 192
palpostbright = 0, 0, 0
trans = add1

[State 760, End]
type = changeanim
trigger1 = anim = 762 && !animtime
value = 41
elem = 6

[State 760, Type]
type = statetypeset
trigger1 = anim = 41
statetype = A
physics = A
[State 760, Ctrl]
type = ctrlset
trigger1 = anim = 41
value = 1

[State 760, End]
type = changestate
trigger1 = (anim = [760, 761]) && !animtime
value = 0
ctrl = 1


;====================< STANDING >====================
[Statedef 0]
type = S
physics = S
movetype = I
velset = 0, 0
sprpriority = 0

[State 0, Gone]
type = removeexplod
trigger1 = ishelper
[State 0, Gone]
type = destroyself
trigger1 = ishelper

[State 0, Anim]
type = changeanim
trigger1 = ((var(1) <= 1) && anim != 0) || (var(1) = 2 && anim != 1) || (var(1) = 3 && anim != 2)
trigger1 = anim != 5
trigger2 = anim = 5 && !animtime
value = ifelse(var(1) = 3, 2, ifelse(var(1) = 2, 1, 0))

[State 0, Dead]
type = changestate
trigger1 = !alive
value = 5050

[State 0, Skywalker]
type = changestate
triggerall = pos y < 0
trigger1 = !numenemy
trigger2 = numenemy = 1
trigger2 = (enemy, name = "M -NES Game 1" + enemy, name = "M -NES Game 2" + enemy, name = "M -GB Game 1" + enemy, authorname = "Bane84") < 2
trigger3 = numenemy >= 2
trigger3 = (enemy(0), name = "M -NES Game 1" + enemy(0), name = "M -NES Game 2" + enemy(0), name = "M -GB Game 1" + enemy(0), authorname = "Bane84") < 2
trigger3 = (enemy(1), name = "M -NES Game 1" + enemy(1), name = "M -NES Game 2" + enemy(1), name = "M -GB Game 1" + enemy(1), authorname = "Bane84") < 2
value = 50


;====================< CROUCHING >====================
[Statedef 10]
type = C
physics = C
movetype = I
velset = 0, 0
sprpriority = 0

[State 10, Anim]
type = changeanim
trigger1 = !time && anim = 12
value = 10
elem = 3 -animelemno(0)
[State 10, Anim]
type = changeanim
trigger1 = anim != 10
value = 10

[State 10, End]
type = changestate
trigger1 = !animtime
value = 11


[Statedef 11]
type = C
physics = C
movetype = I
anim = 11
velset = 0, 0
sprpriority = 0

[State 11, Anim]
type = changeanim
trigger1 = anim = 6 && !animtime
value = 11

[Statedef 12]
type = S
physics = S
movetype = I
velset = 0, 0
sprpriority = 0

[State 12, Anim]
type = changeanim
trigger1 = !time && anim = 10
value = 12
elem = 3 -animelemno(0)
[State 12, Anim]
type = changeanim
trigger1 = anim != 12
value = 12

[State 12, End]
type = changestate
trigger1 = command = "holddown" && command != "holdup"
value = 10
[State 12, End]
type = changestate
trigger1 = !animtime
value = 0


;==========< WALKING >==========
[Statedef 20]
type = S
physics = S
sprpriority = 0

[State 20, Vel]
type = velset
trigger1 = command = "holdfwd"
x = const(velocity.walk.fwd.x)
[State 20, Vel]
type = velset
trigger1 = command = "holdback"
x = const(velocity.walk.back.x)

[State 20, Anim]
type = changeanim
triggerall = vel x > 0
trigger1 = anim != 20 && anim != 5
trigger2 = anim = 5 && animelemtime(1) >= 1
value = 20
[State 20, Anim]
type = changeanim
triggerall = vel x < 0
trigger1 = anim != 21 && anim != 5
trigger2 = anim = 5 && animelemtime(1) >= 1
value = 21


;===================< JUMPING >================
[Statedef 40]
type = S
physics = S
anim = 40
ctrl = 0
velset = 0, 0
sprpriority = 1
facep2 = 1

[State 40, Var]
type = varset
trigger1 = !time && AIlevel
var(9) = ifelse((p2dist x > 240 || p2dist y > 180 || random < 100), 3, 1)
[State 40, Var]
type = varset
trigger1 = AIlevel
sysvar(1) = ifelse((enemynear, movetype != A || backedgebodydist <= 10), 1, ifelse((enemynear, movetype = A), -1, 0))
[State 40, Var]
type = varset
trigger1 = !time && !AIlevel
var(9) = ifelse(command = "highjump", 3, 1)
[State 40, Var]
type = varset
trigger1 = !AIlevel
sysvar(1) = ifelse(!time, 0, ifelse(command = "holdfwd", 1, ifelse(command = "holdback", -1, sysvar(1))))
[State 40, Var]
type = varset
trigger1 = !AIlevel && var(9) != 3 && command != "holdup"
trigger2 = AIlevel && var(9) != 3 && random < 100
var(9) = 2

[State 40, Dust]
type = helper
trigger1 = !animtime
helpertype = normal
stateno = 7100
ID = 7100
name = "Dust"
postype = p1
ownpal = 1

[State 40, Vel]
type = velset
trigger1 = !animtime && var(9) != 3
x = ifelse(!sysvar(1), const(velocity.jump.neu.x), ifelse(sysvar(1) = 1, const(velocity.jump.fwd.x), const(velocity.jump.back.x)))
y = ifelse(var(9) = 2, 0.75, 1) * const(velocity.jump.y)
[State 40, Vel]
type = velset
trigger1 = !animtime && var(9) = 3
x = ifelse(!sysvar(1), const(velocity.jump.neu.x), ifelse(sysvar(1) = 1, 1.5 * const(velocity.jump.fwd.x), 1.5 * const(velocity.jump.back.x)))
y = ifelse(!sysvar(1), 1.15, 1) * const(velocity.jump.y)
[State 40, Vel]
type = velset
trigger1 = !animtime && var(9) = 3 && sysvar(1)
x = ifelse(!sysvar(1), const(velocity.jump.neu.x), ifelse(sysvar(1) = 1, 1.5 * const(velocity.jump.fwd.x), 1.5 * const(velocity.jump.back.x)))
y = const(velocity.jump.y)

[State 40, Vel]
type = velset
trigger1 = !animtime && prevstateno = 100 && sysvar(1) = 1
trigger1 = var(9) := 3
x = const(velocity.runjump.fwd.x)
[State 40, End]
type = changestate
trigger1 = !animtime
value = 50
ctrl = 1

[Statedef 50]
type = A
physics = A

[State 50, Snd]
type = playsnd
trigger1 = !time
value = 0, ifelse(var(9) = 3, 41, 40)

[State 50, Anim]
type = changeanim
trigger1 = var(9) != 2
value = ifelse(!(vel x), 41, ifelse((vel x) > 0, 42, 43))
persistent = 0
[State 50, Anim]
type = changeanim
trigger1 = var(9) = 2
value = ifelse(!(vel x), 51, ifelse((vel x) > 0, 52, 53))
elem = animelemno(0)
persistent = 0

[State 50, No Guard]
type = assertspecial
trigger1 = var(9) = 2
flag = noairguard


[Statedef 51]
type = A
physics = A
[State 51, null]
type = null
trigger1 = 1


[Statedef 52]
type = S
physics = S
ctrl = 0
anim = ifelse(vel y > 11, 48, 47)
movehitpersist = 1

[State 52, Stop]
type = velset
trigger1 = 1
x = 0
y = 0
[State 52, Pos]
type = posset
trigger1 = 1
y = 0

[State 52, anim48]
type = changeanim
trigger1 = !time && (prevstateno = 222 || (prevstateno = [1200, 1299]) || prevstateno = 3200)
value = 48
[State 52, anim283]
type = changeanim
trigger1 = !time && prevstateno = 282
value = 283
[State 52, anim1102]
type = changeanim
trigger1 = !time && ((prevstateno = [1100, 1110]) || prevstateno = 3100 || prevstateno = 3140)
value = 1102
[State 52, anim3102]
type = changeanim
trigger1 = !time && (prevstateno = 3160)
value = 3102

[State 52, Snd]
type = playsnd
trigger1 = !time
value = 0, 52
[State 52, Dust]
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

[State 52, Ctrl]
type = ctrlset
trigger1 = !time
trigger1 = prevstateno != [200, 4999]
value = 1
[State 52, Ctrl]
type = ctrlset
trigger1 = time >= 1
trigger1 = prevstateno < 1000
value = 1
[State 52, guard]
type = changestate
trigger1 = command = "holdback"
trigger1 = inguarddist && (prevstateno != [200, 4999])
value = 120

[State 52, No walking]
type = assertspecial
trigger1 = time <= 2 || (prevstateno = [200, 4999])
flag = nowalk
[State 52, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================< RUN >===========================
[Statedef 100]
type = S
movetype = I
physics = S
velset = 0, 0
anim = 100
ctrl = 1
sprpriority = 1
[State 100, Assert]
type = assertspecial
trigger1 = 1
flag = nowalk
flag2 = noautoturn

[State 100, Vel]
type = velset
trigger1 = anim = 100
x = const(velocity.run.fwd.x)

[State 100, steps]
type = playsnd
trigger1 = anim = 100 && (animelem = 3 || animelem = 6)
value = 0, 100
[State 100, change]
type = changeanim
triggerall = time > 7 && anim = 100
trigger1 = !AIlevel && command != "holdfwd"
trigger2 = AIlevel && (p2movetype = A || p2dist x < 80)
value = 101
persistent = 0
[State 100, Snd]
type = playsnd
trigger1 = anim = 101
value = 0, 101
persistent = 0
[State 100, End]
type = changestate
trigger1 = anim = 101 && !animtime
value = 0
ctrl = 1


;========================< FORWARD DASH >==========================
[Statedef 102]
type = S
movetype = I
physics = S
velset = 0, 0
anim = 102
ctrl = 0
sprpriority = 1
[State 102, Vel]
type = velset
trigger1 = animelem = 2
x = -1.33 * const(velocity.run.back.x)
y = const(velocity.run.back.y)
[State 102, Snd]
type = playsnd
trigger1 = animelem = 2
value = 0, 105
[State 102, Dust]
type = explod
trigger1 = animelem = 2
anim = 7103
ID = 7103
sprpriority = 3
postype = p1
vel = 1, 0
removetime = -2
ownpal = 1
pausemovetime = -1
supermovetime = -1
[State 102, End]
type = changestate
triggerall = (animelemtime(2) > 4) && (animelemtime(3) < 0)
trigger1 = !AIlevel && command = "holdfwd"
trigger2 = AIlevel && p2dist x >= 80
value = 100
[State 102, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;========================< BACK DASH >==========================
[Statedef 105]
type = A
movetype = I
physics = S
velset = 0, 0
anim = 105
ctrl = 0
sprpriority = 1

[State 105, Vel]
type = velset
trigger1 = animelem = 2
x = const(velocity.run.back.x)
y = const(velocity.run.back.y)

[State 105, Snd]
type = playsnd
trigger1 = animelem = 2
value = 0, 105
[State 105, Dust]
type = explod
trigger1 = animelem = 2
anim = 7103
ID = 7103
sprpriority = 3
postype = p1
pos = -17, 0
vel = -1, 0
removetime = -2
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 105, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;==========< GUARD >==========
;--- START ---
[Statedef 120]
type = U
physics = U
[State 120, Vel]
type = velset
trigger1 = !time && statetype != A
x = 0
y = 0
[State 120, Anim]
type = changeanim
trigger1 = !time
value = 120 + (statetype = C) + (statetype = A) * 2
[State 120, Type]
type = statetypeset
trigger1 = !time && statetype = S
physics = S
[State 120, Type]
type = statetypeset
trigger1 = !time && statetype = C
physics = C
[State 120, Type]
type = statetypeset
trigger1 = !time && statetype = A
physics = A
[State 120, High to Low]
type = statetypeset
trigger1 = !AIlevel && statetype = S && command = "holddown"
trigger2 = AIlevel && statetype = S && (enemynear, movetype = A) && (enemynear, statetype = C)
statetype = C
physics = C
[State 120, Low to High]
type = statetypeset
trigger1 = !AIlevel && statetype = C && command != "holddown"
trigger2 = AIlevel && statetype = C && (enemynear, movetype = A) && (enemynear, statetype != C)
statetype = S
physics = S
[State AI fix]
type = ctrlset
trigger1 = AIlevel && numenemy
value = (enemynear, time >= 120 || time >= 180)
[State 120, End]
type = changestate
trigger1 = !animtime || AIlevel
value = 130 + (statetype = C) + (statetype = A) * 2
[State 120, Stop]
type = changestate
trigger1 = (!AIlevel && command != "holdback")
trigger2 = !inguarddist
trigger3 = AIlevel && numenemy
trigger3 = enemynear, hitdefattr = SCA, AT
value = 140


;--- STAND GUARD (guarding) ---
[Statedef 130]
type = S
physics = S
[State 130, Anim]
type = changeanim
trigger1 = anim != 130
value = 130
[State AI fix]
type = ctrlset
trigger1 = AIlevel && numenemy
value = (enemynear, time >= 120 || time >= 180)
[State 130, High to Low]
type = changestate
trigger1 = !AIlevel && command = "holddown"
trigger2 = AIlevel && random < (250 * (AIlevel ** 2 / 64.0))
trigger2 = (enemynear, movetype = A) && (enemynear, statetype = C)
value = 131
[State 130, Stop Guarding]
type = changestate
trigger1 = (!AIlevel && command != "holdback")
trigger2 = !inguarddist
trigger3 = AIlevel && numenemy
trigger3 = enemynear, hitdefattr = SCA, AT
value = 140

[State 130, Snd]
type = playsnd
trigger1 = !time
trigger1 = prevstateno = 132 || (prevstateno = [154, 155])
value = 0, 52
[State 130, Dust]
type = explod
trigger1 = !time
trigger1 = prevstateno = 132 || (prevstateno = [154, 155])
anim = 7102
ID = 7102
sprpriority = -2
postype = p1
scale = 0.5, 0.5
ownpal = 1
pausemovetime = -1
supermovetime = -1

;--- CROUCH GUARD (guarding) ---
[Statedef 131]
type = C
physics = C
[State 131, Anim]
type = changeanim
trigger1 = anim != 131
value = 131
[State AI fix]
type = ctrlset
trigger1 = AIlevel && numenemy
value = (enemynear, time >= 120 || time >= 180)
[State 131, Low to High]
type = changestate
trigger1 = !AIlevel && command != "holddown"
trigger2 = AIlevel && random < (125 * (AIlevel ** 2 / 64.0))
trigger2 = (enemynear, movetype = A) && (enemynear, statetype != C)
value = 130
[State 131, Stop Guarding]
type = changestate
trigger1 = (!AIlevel && command != "holdback")
trigger2 = !inguarddist
trigger3 = AIlevel && numenemy
trigger3 = enemynear, hitdefattr = SCA, AT
value = 140


;--- AIR GUARD (guarding) ---
[Statedef 132]
type = A
physics = N
[State 132, Anim]
type = changeanim
trigger1 = anim != 132
value = 132
[State 132, Accel]
type = veladd
trigger1 = 1
y = const(movement.yaccel)
[State 132, Var]
type = varset
trigger1 = 1
sysvar(0) = (pos y >= 0) && (vel y > 0)
[State 132, Vel]
type = velset
trigger1 = sysvar(0)
y = 0
[State 132, Pos]
type = posset
trigger1 = sysvar(0)
y = 0
[State AI fix]
type = ctrlset
trigger1 = AIlevel && numenemy
value = (enemynear, time >= 120 || time >= 180)
[State 132, End]
type = changestate
trigger1 = sysvar(0) && inguarddist
trigger1 = (!AIlevel && command = "holdback") || AIlevel
value = 130
[State 132, End]
type = changestate
trigger1 = sysvar(0)
value = 52
[State 132, stop guarding]
type = changestate
trigger1 = (!AIlevel && command != "holdback")
trigger2 = !inguarddist
trigger3 = AIlevel && numenemy
trigger3 = enemynear, hitdefattr = SCA, AT
value = 140


;--- GUARD (end) ---
[Statedef 140]
type = U
physics = U
ctrl = 1
[State 140, Anim]
type = changeanim
trigger1 = !time
value = 140 + (statetype = C) + (statetype = A) * 2
[State 140, Type]
type = statetypeset
trigger1 = !time && statetype = S
physics = S
[State 140, Type]
type = statetypeset
trigger1 = !time && statetype = C
physics = C
[State 140, Type]
type = statetypeset
trigger1 = !time && statetype = A
physics = A
[State 140, High to Low]
type = statetypeset
trigger1 = !AIlevel && statetype = S && command = "holddown"
trigger2 = AIlevel && random < (250 * (AIlevel ** 2 / 64.0))
trigger2 = statetype = S && (enemynear, movetype = A) && (enemynear, statetype = C)
statetype = C
physics = C
[State 140, Low to High]
type = statetypeset
trigger1 = !AIlevel && statetype = C && command != "holddown"
trigger2 = AIlevel && random < (125 * (AIlevel ** 2 / 64.0))
trigger2 = statetype = C && (enemynear, movetype = A) && (enemynear, statetype != C)
statetype = S
physics = S
[State 140, 5]
type = changestate
trigger1 = !animtime
value = (statetype = C) * 11 + (statetype = A) * 51

;--- SGUARDHIT (shaking) ---
[Statedef 150]
type = S
movetype = H
physics = N
velset = 0, 0
[State 150, Anim]
type = changeanim
trigger1 = 1
value = 150
[State 150, End]
type = changestate
trigger1 = hitshakeover
value = 151 + 2 * ((!AIlevel && command = "holddown") || (AIlevel && (enemynear, movetype = A) && (enemynear, statetype = C)))
[State 150, High to Low]
type = statetypeset
trigger1 = !AIlevel && statetype = S && command = "holddown"
trigger2 = AIlevel && random < (250 * (AIlevel ** 2 / 64.0))
trigger2 = statetype = S && (enemynear, movetype = A) && (enemynear, statetype = C)
statetype = C
physics = C
[State 150, Low to High]
type = statetypeset
trigger1 = !AIlevel && statetype = C && command != "holddown"
trigger2 = AIlevel && random < (125 * (AIlevel ** 2 / 64.0))
trigger2 = statetype = C && (enemynear, movetype = A) && (enemynear, statetype != C)
statetype = S
physics = S

;--- SGUARDHIT2 (knocked back) ---
[Statedef 151]
type = S
movetype = H
physics = S
anim = 150
[State 151, Vel]
type = hitvelset
trigger1 = !time
x = 1
[State 151, Vel]
type = velset
trigger1 = time = gethitvar(slidetime)
trigger2 = hitover
x = 0
[State 151, Ctrl]
type = ctrlset
trigger1 = time = gethitvar(ctrltime)
value = 1
[State 151, High to Low]
type = statetypeset
trigger1 = !AIlevel && statetype = S && command = "holddown"
trigger2 = AIlevel && random < (250 * (AIlevel ** 2 / 64.0))
trigger2 = statetype = S && (enemynear, movetype = A) && (enemynear, statetype = C)
statetype = C
physics = C
[State 151, Low to High]
type = statetypeset
trigger1 = !AIlevel && statetype = C && command != "holddown"
trigger2 = AIlevel && random < (125 * (AIlevel ** 2 / 64.0))
trigger2 = statetype = C && (enemynear, movetype = A) && (enemynear, statetype != C)
statetype = S
physics = S
[State 151, End]
type = changestate
trigger1 = hitover
value = 130
ctrl = 1

;--- CGUARDHIT (shaking) ---
[Statedef 152]
type = C
movetype = H
physics = N
velset = 0, 0
[State 152, Anim]
type = changeanim
trigger1 = 1
value = 151
[State 152, End]
type = changestate
trigger1 = hitshakeover
value = 151 + 2 * ((!AIlevel && command = "holddown") || (AIlevel && (enemynear, movetype = A) && (enemynear, statetype = C)))
[State 152, High to Low]
type = statetypeset
trigger1 = !AIlevel && statetype = S && command = "holddown"
trigger2 = AIlevel && random < (250 * (AIlevel ** 2 / 64.0))
trigger2 = statetype = S && (enemynear, movetype = A) && (enemynear, statetype = C)
statetype = C
physics = C
[State 152, Low to High]
type = statetypeset
trigger1 = !AIlevel && statetype = C && command != "holddown"
trigger2 = AIlevel && random < (125 * (AIlevel ** 2 / 64.0))
trigger2 = statetype = C && (enemynear, movetype = A) && (enemynear, statetype != C)
statetype = S
physics = S

;--- CGUARDHIT2 (knocked back) ---
[Statedef 153]
type = C
movetype = H
physics = C
anim = 151
[State 153, Vel]
type = hitvelset
trigger1 = !time
x = 1
[State 153, Vel]
type = velset
trigger1 = time = gethitvar(slidetime)
trigger2 = hitover
x = 0
[State 153, Ctrl]
type = ctrlset
trigger1 = time = gethitvar(ctrltime)
value = 1
[State 153, High to Low]
type = statetypeset
trigger1 = !AIlevel && statetype = S && command = "holddown"
trigger2 = AIlevel && random < (250 * (AIlevel ** 2 / 64.0))
trigger2 = statetype = S && (enemynear, movetype = A) && (enemynear, statetype = C)
statetype = C
physics = C
[State 153, Low to High]
type = statetypeset
trigger1 = !AIlevel && statetype = C && command != "holddown"
trigger2 = AIlevel && random < (125 * (AIlevel ** 2 / 64.0))
trigger2 = statetype = C && (enemynear, movetype = A) && (enemynear, statetype != C)
statetype = S
physics = S
[State 153, End]
type = changestate
trigger1 = hitover
value = 131
ctrl = 1

;--- AGUARDHIT (shaking) ---
[Statedef 154]
type = A
movetype = H
physics = N
velset = 0, 0
[State 154, Anim]
type = changeanim
trigger1 = 1
value = 152
[State 154, End]
type = changestate
trigger1 = hitshakeover
value = 155

;--- AGUARDHIT2 (knocked away) ---
[Statedef 155]
type = A
movetype = H
physics = N
anim = 152
[State 155, Vel]
type = hitvelset
trigger1 = !time
x = 1
y = 1
[State 155, Vel]
type = veladd
trigger1 = 1
y = const(movement.yaccel)
[State 155, Ctrl]
type = ctrlset
trigger1 = time = gethitvar(ctrltime)
value = 1
[State 155, Var]
type = varset
trigger1 = 1
sysvar(0) = (pos y >= 0) && (vel y > 0)
[State 155, Vel]
type = velset
trigger1 = sysvar(0)
y = 0
[State 155, Pos]
type = posset
trigger1 = sysvar(0)
y = 0
[State 155, End]
type = changestate
trigger1 = sysvar(0) && inguarddist
trigger1 = (!AIlevel && command = "holdback") || AIlevel
value = 130
[State 155, End]
type = changestate
trigger1 = sysvar(0)
value = 52


;==========< CHEAP K.O. >==========
[Statedef 5130]
type = S
movetype = H
physics = S
anim = 5130
[State 5130, NHB]
type = nothitby
trigger1 = !alive
value = SCA
[State 5130, Pos]
type = posset
trigger1 = 1
y = 0
[State 5130, End]
type = changestate
trigger1 = !animtime
value = 5131

[Statedef 5131]
type = L
movetype = H
physics = C
anim = 5131
[State 5131, NHB]
type = nothitby
trigger1 = !alive
value = SCA
[State 5131, Pos]
type = posset
trigger1 = 1
y = 0
[State 5131, posfix]
type = posadd
trigger1 = animelem = 4 || animelem = 5
x = ifelse((animelem = 4), -12, -24)
[State 5131, Snd]
type = playsnd
trigger1 = !time
trigger2 = animelem = 5
value = 0, 52
[State 5131, Dust]
type = explod
trigger1 = !time
anim = 7104
ID = 7104
sprpriority = -4
postype = p1
pos = -7, 0
scale = 0.5, 0.5
ownpal = 1
pausemovetime = -1
supermovetime = -1
[State 5131, Dust]
type = explod
trigger1 = animelem = 5
anim = 7102
ID = 7102
sprpriority = -5
postype = p1
scale = 0.75, 0.75
ownpal = 1
pausemovetime = -1
supermovetime = -1
[State 5131, End]
type = changestate
trigger1 = !animtime
value = ifelse(alive, 5110, 5150)



;==========< TAUNT >==========
[Statedef 195]
type = S
ctrl = 0
velset = 0, 0
physics = S

[State 195, taunt]
type = changestate
triggerall = !time
trigger1 = var(1) = 2
trigger2 = var(1) = 3 && command = "holddown"
value = 197

[State 195, taunt]
type = changeanim
trigger1 = !time
value = ifelse(command = "holdfwd", 195, ifelse(command = "holdback", 357, 350))

[State 195, Snd]
type = playsnd
trigger1 = anim = 195 && animelem = 3
trigger2 = anim = 350 && animelem = 2
trigger3 = anim = 357 && animelem = 4
value = 4, ifelse(random < 250, 8, ifelse(random < 333, 9, ifelse(random < 500, 10, 11)))
channel = 0
[State 195, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;==========< EVIL TAUNT >==========
[Statedef 197]
type = S
physics = S
movetype = I
sprpriority = 1
anim = 197

[State 197, Snd]
type = playsnd
trigger1 = animelem = 4
value = 14, 6
channel = 0
[State 197, Shake]
type = envshake
trigger1 = animelemtime(4) >= 0 && animelemtime(4) <= 20
trigger1 = !(animelemtime(4) % 5)
time = 5
freq = 120
ampl = 6 -ceil(animelemtime(5) * 0.25)

[State 197, Snd]
type = playsnd
trigger1 = animelem = 4
value = 5, 3
[State 197, Dust]
type = explod
trigger1 = animelem = 4
anim = 7100
ID = 7100
sprpriority = 2
postype = p1
pos = -32, 0
ownpal = 1
[State 197, Dust]
type = explod
trigger1 = animelem = 4
anim = 7104
ID = 7104
sprpriority = -2
postype = p1
pos = -32, 0
scale = 0.75, 0.75
ownpal = 1
[State 197, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;==========< HADOU NO KAMAE >==========
[Statedef 198]
type = S
physics = S
movetype = I
anim = 1000
ctrl = 0
velset = 0, 0

[State 198, Snd]
type = playsnd
trigger1 = animelem = 5 && var(1) = 1
value = 3, 6
channel = 0
[State 198, Snd]
type = playsnd
trigger1 = animelem = 3 && var(1) = 3
value = 4, 100 + (random % 4)
channel = 0

[State Idle]
type = statetypeset
trigger1 = animelemtime(3) >= 0
movetype = I

[State 198, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;==========< LOSE (Time over) >==========
[Statedef 170]
type = S
ctrl = 0
anim = 175 -(var(1) = 2) * 5
velset = 0, 0
[State 170, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1
[State 170, Snd]
type = playsnd
trigger1 = anim = 170 && animelem = 2
value = 0, 52
[State 170, Dust]
type = explod
trigger1 = anim = 170 && animelem = 2
anim = 7104
ID = 7104
sprpriority = -4
postype = p1
pos = -7, 0
scale = 0.5, 0.5
ownpal = 1


;==========< DRAWGAME (Time over) >==========
[Statedef 175]
type = S
ctrl = 0
anim = 175
velset = 0, 0
[State 175, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1


;==========< PREINTRO >==========
[Statedef 190]
type = S
ctrl = 0
velset = 0, 0

[State 190, intro Ryu vs Evil]
type = changestate
trigger1 = var(1) != 3 && numenemy
trigger1 = !(teammode = simul) && !(enemy, teammode = simul)
trigger1 = enemy, authorname = "Phantom.of.the.Server" && enemy, name = "Ryu"
trigger1 = (var(1) = 1 && enemy, var(1) = 2) || (var(1) = 2 && enemy, var(1) = 1)
value = 360

[State 190, intro Evil vs Shin Gouki]
type = changestate
trigger1 = (var(1) = [2, 3]) && numenemy
trigger1 = !(teammode = simul) && !(enemy, teammode = simul)
trigger1 = enemy, authorname = "Phantom.of.the.Server" && enemy, name = "Shin Gouki"
value = 368

[State 190, intro Ryu vs Sakura]
type = changestate
trigger1 = var(1) != 2 && numenemy
trigger1 = !(teammode = simul) && !(enemy, teammode = simul)
trigger1 = enemy, authorname = "Phantom.of.the.Server" && enemy, name = "Sakura Kasugano"
value = 373

[State 190, intro vs CvS2 Another Kyo]
type = changestate
trigger1 = numenemy
trigger1 = !(teammode = simul) && !(enemy, teammode = simul)
trigger1 = enemy, authorname = "Mouser && Byakko" && enemy, name = "CvS2AKyo"
value = 370

[State 190, intro vs CvS2 Ryo]
type = changestate
trigger1 = numenemy
trigger1 = !(teammode = simul) && !(enemy, teammode = simul)
trigger1 = enemy, authorname = "Byakko" && enemy, name = "CvS2Ryo"
value = 369

[State 190, introvsPSGouki]
type = changestate
trigger1 = !time && name = "Ryu" && (p2name = "Pocket Shin Gouki" || p4name = "Pocket Shin Gouki")
trigger1 = enemy, authorname = "Phantom.of.the.Server"
value = 363

[State 190, introEK]
type = changestate
trigger1 = !time && name = "Ryu" && (p2name = "Evil Ken" || p4name = "Evil Ken") && var(1) != 2
value = 358

[State 190, intro]
type = changestate
trigger1 = time && var(1) != 2
value = ifelse(random < 333, 355, ifelse(random < 500, 352, 353))
[State 190, intro]
type = changestate
trigger1 = time && var(1) = 2
value = ifelse(random < 500, 354, 356)


;==========< INTRO 1 >==========
[Statedef 355]
type = S
anim = 355
sprpriority = -1
[State 355, intro]
type = assertspecial
trigger1 = 1
flag = intro
[State 355, Spr]
type = sprpriority
trigger1 = animelemtime(7) >= 0
value = 0
[State 355, Bag]
type = helper
trigger1 = !numhelper(6000)
helpertype = normal
stateno = 6000
ID = 6000
name = "Bag"
postype = p1
pos = 61, -46
ownpal = 1
size.shadowoffset = -4
[State 355, Snd]
type = playsnd
trigger1 = animelem = 8 && random < 750
value = 4, ifelse(random < 250, 8, ifelse(random < 333, 9, ifelse(random < 500, 10, 13)))
channel = 0
[State 355, End]
type = changestate
trigger1 = !animtime
value = 0


;==========< INTRO 2 >==========
[Statedef 352]
type = S
anim = 352
[State 352, intro]
type = assertspecial
trigger1 = 1
flag = intro
[State 352, Snd]
type = playsnd
trigger1 = animelem = 7 && random < 750
value = 4, ifelse(random < 250, 8, ifelse(random < 333, 9, ifelse(random < 500, 10, 13)))
channel = 0
[State 352, End]
type = changestate
trigger1 = !animtime
value = 0


;==========< INTRO 3 >==========
[Statedef 353]
type = S
anim = 353
[State 353, intro]
type = assertspecial
trigger1 = 1
flag = intro
[State 353, Snd]
type = playsnd
trigger1 = animelem = 29
value = 4, ifelse(random < 250, 8, ifelse(random < 333, 9, ifelse(random < 500, 10, 13)))
channel = 0
[State 353, End]
type = changestate
trigger1 = !animtime
value = 0


;==========< EVIL INTRO 1 >==========
[Statedef 356]
type = S
anim = 356
sprpriority = -1
[State 356, intro]
type = assertspecial
trigger1 = 1
flag = intro
[State 356, Spr]
type = sprpriority
trigger1 = animelemtime(8) >= 0
value = 0
[State 356, Snd]
type = playsnd
trigger1 = animelem = 5
value = 14, 4
channel = 0
[State 356, Snd]
type = playsnd
trigger1 = animelem = 10
value = 5, 3
[State 356, Dust]
type = explod
trigger1 = animelem = 10
anim = 7100
ID = 7100
sprpriority = 2
postype = p1
pos = -32, 0
ownpal = 1
[State 356, Dust]
type = explod
trigger1 = animelem = 10
anim = 7104
ID = 7104
sprpriority = -2
postype = p1
pos = -32, 0
scale = 0.75, 0.75
ownpal = 1
[State 356, Shake]
type = envshake
trigger1 = animelem = 10
time = 12
frequency = 60
ampl = 4
[State 356, End]
type = changestate
trigger1 = !animtime
value = 0


;==========< EVIL INTRO 2 >==========
[Statedef 354]
type = S
anim = 354
sprpriority = -1
[State 354, intro]
type = assertspecial
trigger1 = 1
flag = intro
[State 354, Snd]
type = playsnd
trigger1 = animelem = 9
value = 14, ifelse(random < 500, 6, 9)
channel = 0
[State 354, End]
type = changestate
trigger1 = !animtime
value = 0


;==========< INTRO RYU vs EVIL RYU >==========
[Statedef 360]
type = S
physics = N
anim = 360 + (var(1) = 2)
sprpriority = 1 -(var(1) = 2) * 2
[State 360, intro]
type = assertspecial
trigger1 = 1
flag = intro
[State 360, Camera]
type = helper
trigger1 = !numhelper(7650)
helpertype = normal
stateno = 7650
ID = 7650
name = "Camera"
postype = p1
[State 360, screen]
type = screenbound
trigger1 = 1
value = 1
movecamera = 0, 1

[State 360, Pos]
type = posset
trigger1 = time <= 2
x = -9 * facing

[State 360, Snd]
type = playsnd
trigger1 = (var(1) = 2) && animelemtime(1) = 30
value = 14, 7
channel = 0
[State 360, Snd]
type = playsnd
trigger1 = (var(1) != 2) && animelem = 3
value = 4, 9
channel = 0

[State 360, Pos]
type = posadd
trigger1 = var(1) != 2 && animelem = 7
trigger2 = var(1) = 2 && animelem = 11
x = -6
[State 360, Vel]
type = velset
trigger1 = var(1) != 2 && animelem = 7
trigger2 = var(1) = 2 && animelem = 11
x = (helper(7650), rootdist x) / -12
[State 360, Pos]
type = posset
trigger1 = var(1) != 2 && animelemtime(10) >= 0
trigger2 = var(1) = 2 && animelemtime(14) >= 0
trigger3 = animelemtime(10) >= 0 && (helper(7650), rootdist x) <= 0
x = ceil(helper(7650), pos x)
[State 360, Vel]
type = velset
trigger1 = var(1) != 2 && animelemtime(10) >= 0
trigger2 = var(1) = 2 && animelemtime(14) >= 0
trigger3 = animelemtime(10) >= 0 && (helper(7650), rootdist x) <= 0
x = 0

[State 360, Snd]
type = playsnd
trigger1 = var(1) != 2 && animelem = 7
trigger2 = var(1) = 2 && animelem = 11
value = 0, 105
[State 360, Dust]
type = explod
trigger1 = var(1) != 2 && animelem = 7
trigger2 = var(1) = 2 && animelem = 11
anim = 7103
ID = 7103
sprpriority = 3
postype = p1
vel = -1, 0
removetime = -2
ownpal = 1

[State 360, Snd]
type = playsnd
trigger1 = var(1) != 2 && animelem = 7
trigger2 = var(1) = 2 && animelem = 11
value = 3 + (var(1) = 2) * 10, (var(1) = 2) * 3
[State 360, End]
type = changestate
trigger1 = !animtime
value = 0


;==========< INTRO EVIL vs SHIN GOUKI >==========
[Statedef 368]
type = S
physics = N
anim = 368
sprpriority = 0
[State 368, intro]
type = assertspecial
trigger1 = 1
flag = intro
[State 368, Camera]
type = helper
trigger1 = !numhelper(7650)
helpertype = normal
stateno = 7650
ID = 7650
name = "Camera"
postype = p1
[State 368, screen]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 1

[State 368, Vel]
type = posset
trigger1 = !time
x = -240 * facing
[State 368, Vel]
type = velset
trigger1 = !time
x = 6
[State 368, Snd]
type = playsnd
trigger1 = !time
value = 5, 4
[State 368, Anim]
type = changeanim
trigger1 = animelemtime(2) < 0 && p2dist x <= 72
value = 368
elem = 2
[State 368, Snd]
type = playsnd
trigger1 = animelem = 2
value = ifelse(var(1) = 2, 14, 4), ifelse(var(1) = 2, 9, 10)
channel = 0
[State 368, Vel]
type = velset
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
x = 0
[State 368, Pos]
type = posset
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
x = -36 * facing

[State 368, fadeout]
type = allpalfx
trigger1 = animelemtime(2) = 10
time = 20
sinadd = -255, -255, -255, 80
[State 368, black]
type = envcolor
trigger1 = animelemtime(2) >= 30 && animelemtime(3) < 0
time = 2
value = 0, 0, 0
[State 368, Assert]
type = assertspecial
trigger1 = animelemtime(2) >= 30 && animelemtime(3) < 0
flag = nobardisplay

[State 368, HitSound]
type = playsnd
trigger1 = animelemtime(2) >= 30 && animelemtime(3) < 0
trigger1 = (animelemtime(2) % 8) = 1
value = 2, 0
[State 368, Sparks]
type = explod
trigger1 = animelemtime(2) >= 30 && animelemtime(3) < 0
trigger1 = (animelemtime(2) % 8) = 1
anim = 7001
ID = 7000
sprpriority = 5
postype = p2
pos = 0, -70
random = 60, 60
facing = -1
ownpal = 1
ontop = 1
pausemovetime = 300
supermovetime = 300
[State 368, Shake]
type = envshake
trigger1 = animelemtime(2) >= 30 && animelemtime(3) < 0
trigger1 = (animelemtime(2) % 8) = 1
time = 2
freq = 90
ampl = -3

[State 368, Anim]
type = changeanim
trigger1 = animelemtime(2) >= 72 && animelemtime(3) < 0
value = 368
elem = 3
[State 368, Snd]
type = playsnd
trigger1 = animelem = 3
value = ifelse(var(1) = 2, 5010, 5000), ifelse(var(1) = 2, 5, 2)
channel = 0

[State 368, Vel]
type = velset
trigger1 = animelem = 3
x = -6
[State 368, Pos]
type = posset
trigger1 = animelemtime(3) >= 0 && (helper(7650), rootdist x <= 0)
x = ceil(helper(7650), pos x)
[State 368, Vel]
type = velset
trigger1 = animelemtime(3) >= 0 && (helper(7650), rootdist x <= 0)
x = 0
[State 368, End]
type = changestate
trigger1 = !animtime
value = 0


;==========< INTRO vs SAKURA >==========
[Statedef 373]
type = S
anim = 373
[State 373, intro]
type = assertspecial
trigger1 = 1
flag = intro

[State 373, Anim]
type = changeanim
trigger1 = animelemtime(20) >= 5 && animelemtime(21) < 0 && numenemy
trigger1 = enemy, animelemtime(28) >= 0
value = 373
elem = 21
persistent = 0

[State 373, Flash]
type = palfx
trigger1 = animelem = 23
add = 0, 50, 255
sinadd = 0, -50, -255, 60
time = 15
[State 373, Snd]
type = playsnd
trigger1 = animelem = 23
value = 3 + (var(1) = 2) * 10, 6 -(var(1) = 2) * 3
channel = 0
[State 373, Snd]
type = playsnd
trigger1 = animelem = 23
value = 7, 3
[State 373, Spark]
type = explod
trigger1 = animelem = 23
anim = 7200
ID = 7200
sprpriority = 5
postype = p1
pos = 31, -69
removetime = -2
pausemovetime = 60
ownpal = 1
scale = 0.5, 0.5

[State 373, End]
type = changestate
trigger1 = !animtime
value = 0


;==========< INTRO vs CvS2 ANOTHER KYO >==========
[Statedef 370]
type = S
physics = N
anim = ifelse(var(1) != 2, 372, 370)
sprpriority = 0
[State 370, intro]
type = assertspecial
trigger1 = 1
flag = intro
[State 370, Camera]
type = helper
trigger1 = !numhelper(7650)
helpertype = normal
stateno = 7650
ID = 7650
name = "Camera"
postype = p1
[State 370, screen]
type = screenbound
trigger1 = 1
value = 1
movecamera = 0, 1

[State 370, Anim]
type = changeanim
trigger1 = time >= 120 && anim != 371
value = 371
[State 370, Vel]
type = velset
trigger1 = anim = 371 && animelem = 1
x = ((p2dist x / 2) -25) / 12
[State 370, Vel]
type = velset
trigger1 = anim = 371 && animelemtime(5) >= 0 && animelemtime(33) < 0
trigger2 = anim = 371 && animelemtime(37) >= 0
x = 0

[state 370, posfix]
type = posadd
trigger1 = anim = 371 && (animelem = 16 || animelem = 17 || animelem = 18)
x = ifelse((animelem = 16), -10, ifelse((animelem = 17), -6, -5))

[State 370, Snd]
type = playsnd
trigger1 = time = 15
value = 4 + (var(1) = 2) * 10, 8 -(var(1) = 2) * 2
channel = 0
[State 370, Snd]
type = playsnd
trigger1 = anim = 371 && animelem = 5
value = 3 + (var(1) = 2) * 10, 6 -(var(1) = 2) * 3
channel = 0
[State 370, Snd]
type = playsnd
trigger1 = anim = 371 && animelem = 11
value = 3 + (var(1) = 2) * 10, 4 -(var(1) = 2) * 4
channel = 0
[State 370, Snd]
type = playsnd
trigger1 = anim = 371 && animelem = 18
value = 3 + (var(1) = 2) * 10, 2 -(var(1) = 2)
channel = 0
[State 370, Snd]
type = playsnd
trigger1 = anim = 371 && animelem = 27
value = 3 + (var(1) = 2) * 10, 3 -(var(1) = 2)
channel = 0

[State 370, Snd]
type = playsnd
trigger1 = anim = 371 && (animelem = 11 || animelem = 18)
value = 1, 3
[State 370, Snd]
type = playsnd
trigger1 = anim = 371 && animelem = 27
value = 1, 6

[State 370, Snd]
type = playsnd
trigger1 = anim = 371 && (animelem = 19 || animelem = 28)
value = 2, 8
[State 370, Sparks]
type = helper
trigger1 = anim = 371 && (animelem = 19 || animelem = 28)
helpertype = normal
stateno = 7050
ID = 7050
name = "Shin Shoryuken Spark"
postype = back
pos = 160, -72
ownpal = 1
ignorehitpause = 1

[State 370, Vel]
type = velset
trigger1 = anim = 371 && animelem = 35
x = (helper(7650), rootdist x) / -12
[State 370, Snd]
type = playsnd
trigger1 = anim = 371 && animelem = 2
value = 0, 105
[State 370, Dust]
type = explod
trigger1 = anim = 371 && animelem = 2
anim = 7103
ID = 7103
sprpriority = 3
postype = p1
vel = 1, 0
removetime = -2
ownpal = 1
[State 370, Snd]
type = playsnd
trigger1 = anim = 371 && animelem = 35
value = 0, 105
[State 370, Dust]
type = explod
trigger1 = anim = 371 && animelem = 35
anim = 7103
ID = 7103
sprpriority = 3
postype = p1
pos = -17, 0
vel = -1, 0
removetime = -2
ownpal = 1

[State 370, Pos]
type = posset
trigger1 = anim = 371 && animelemtime(38) >= 0
x = ceil(helper(7650), pos x)
[State 370, End]
type = changestate
trigger1 = anim = 371 && !animtime
value = 0


;==========< INTRO vs CvS2 RYO >==========
[Statedef 369]
type = A
physics = N
anim = 369
[State 369, intro]
type = assertspecial
trigger1 = 1
flag = intro
[State 369, screen]
type = screenbound
trigger1 = 1
value = 1
movecamera = 0, 0
[State 369, Camera]
type = helper
trigger1 = !numhelper(7650)
helpertype = normal
stateno = 7650
ID = 7650
name = "Camera"
postype = p1
pos = 0, 0
facing = 1
[State 369, Pos]
type = posset
trigger1 = !time
x = -20 * facing
[State 369, Snd]
type = playsnd
trigger1 = time = 15
value = 4 + (var(1) = 2) * 10, 9;-(var(1) = 2) * 3
channel = 0

[State 369, Snd]
type = playsnd
trigger1 = animelem = 7
value = 0, 40
[State 369, Dust]
type = helper
trigger1 = animelem = 7
helpertype = normal
stateno = 7100
ID = 7100
name = "Dust"
postype = p1
ownpal = 1
[State 369, Vel]
type = velset
trigger1 = anim = 369 && animelem = 7
x = (helper(7650), rootdist x) / -50
y = -8
[State 369, Accel]
type = veladd
trigger1 = anim = 369 && animelemtime(7) >= 0
y = 0.35
[State 369, Anim]
type = changeanim
trigger1 = anim = 369 && animelemtime(7) >= 0 && vel y > 0 && pos y >= -5
value = 48
[State 369, Pos]
type = posset
trigger1 = anim = 48
x = ceil(helper(7650), pos x)
y = 0
[State 369, Vel]
type = velset
trigger1 = anim = 48
x = 0
y = 0
[State 369, Snd]
type = playsnd
trigger1 = anim = 48 && animelem = 1
value = 0, 52
[State 369, Dust]
type = explod
trigger1 = anim = 48 && animelem = 1
anim = 7102
ID = 7102
sprpriority = -2
postype = p1
scale = 0.5, 0.5
ownpal = 1
[State 369, End]
type = changestate
trigger1 = anim = 48 && !animtime
value = 0


;==========< INTRO VS EVIL KEN >==========
[Statedef 358]
type = S
anim = 358
[State 358, intro]
type = assertspecial
trigger1 = 1
flag = intro
[State 358, End]
type = changestate
trigger1 = !animtime
value = 0


;==========< INTRO vs POCKET SHIN GOUKI >==========
[Statedef 363]
type = S
anim = 363
[State 363, intro]
type = assertspecial
trigger1 = 1
flag = intro
[State 363, Snd]
type = playsnd
trigger1 = var(1) != 2
trigger1 = animelemtime(5) = 15
value = 4, 11
channel = 0
[State 363, End]
type = changestate
trigger1 = !animtime
value = 0


;==========< WIN POSE DECIDER >==========
[Statedef 180]
type = S

[State 180, Quote]
type = victoryquote
trigger1 = var(1) != 2
value = 1 + (random % 12)

[State 180, Quote]
type = victoryquote
trigger1 = var(1) = 2
value = 50 + (random % 5)

[State 180, Quote]
type = victoryquote
triggerall = numenemy && var(1) != 2
trigger1 = enemy, name = "Ken" || enemy, name = "Ken Masters"
trigger2 = enemy, name = "cvsken" || enemy, name = "svcken"
value = 30

[State 180, Quote]
type = victoryquote
triggerall = numenemy
trigger1 = enemy, name = "Sagat"
trigger2 = enemy, name = "cvssagat" || enemy, name = "svcsagat"
value = ifelse(var(1) = 2, 81, 31)

[State 180, Quote]
type = victoryquote
triggerall = numenemy
trigger1 = enemy, name = "Gouki" || enemy, name = "Akuma"
trigger2 = enemy, name = "Shin Gouki" || enemy, name = "Shin Akuma"
trigger3 = enemy, name = "Cyber Akuma" || enemy, name = "Mech Gouki"
trigger4 = enemy, name = "cvsgouki" || enemy, name = "svcgouki"
value = ifelse(var(1) = 2, 80, 32)

[State 180, Quote]
type = victoryquote
triggerall = numenemy && var(1) != 2
trigger1 = enemy, name = "Sakura Kasugano" || enemy, name = "cvssakura"
value = 33

[State 180, Quote]
type = victoryquote
triggerall = numenemy && var(1) != 2
trigger1 = enemynear, name = "Vega" && enemynear, authorname = "Phantom.of.the.Server"
trigger2 = enemynear, name = "cvsvega" && (enemynear, authorname = "Warusaki3" || enemynear, authorname = "Gargoyle")
trigger3 = enemynear, name = "M.Bison" && enemynear, authorname = "N -Mario"
trigger4 = enemynear, name = "M. Bison" && enemynear, authorname = "VK, Updated by Terry Kuo, adapted by Tenebrous"
trigger5 = enemynear, name = "CvSBison" && enemynear, authorname = "Team Kai (Saiai and Koga)"
value = 34

[State 180, winSGS]
type = changestate
trigger1 = prevstateno = 362
value = 362

[State 180, winRKH]
type = changestate
trigger1 = prevstateno = 3052
value = 3052

[State 180, winShoryuken]
type = changestate
trigger1 = !time && var(0) = 3120
value = 359

[State 180, win]
type = changestate
trigger1 = !time && var(1) != 2
trigger1 = command = "holdx" || command = "holdy" || command = "holdz" || command = "holda" || command = "holdb" || command = "holdc"
value = ifelse((command = "holdx" || command = "holdy" || command = "holdz"), 366, 351)
[State 180, win]
type = changestate
trigger1 = !time && var(1) != 2
value = ifelse(random < 500, 351, 366)

[State 180, win]
type = changestate
trigger1 = !time && var(1) = 2
trigger1 = command = "holdx" || command = "holdy" || command = "holdz" || command = "holda" || command = "holdb" || command = "holdc"
value = ifelse((command = "holdx" || command = "holdy" || command = "holdz"), 364, 365)
[State 180, win]
type = changestate
trigger1 = !time && var(1) = 2
value = ifelse(random < 500, 364, 365)


;==========< WIN 1 >==========
[Statedef 351]
type = S
anim = 351
ctrl = 0
[State 351, win]
type = assertspecial
trigger1 = time < 180
flag = roundnotover
[State 351, Snd]
type = playsnd
trigger1 = animelem = 3 && random < 500
value = 4, 17
channel = 0
[State 351, leaf]
type = explod
trigger1 = animelem = 7
trigger1 = random < 333 || command = "holdstart"
anim = 6010
sprpriority = 2
postype = p1
pos = -21, -28
vel = -1, 1.5
accel = 0.2, -.1
removetime = -2
ownpal = 1


;==========< WIN 2 >==========
[Statedef 366]
type = S
anim = 366
ctrl = 0
[State 366, win]
type = assertspecial
trigger1 = time < 180
flag = roundnotover
[State 366, Snd]
type = playsnd
trigger1 = animelem = 3
value = 4, 16
channel = 0


;==========< WIN by S.G.S. >==========
[Statedef 362]
type = S
sprpriority = -1

[State 362, Anim]
type = changeanim
trigger1 = !time && prevstateno = 4001
value = 362

[State 362, Kanji]
type = helper
trigger1 = !time && prevstateno = 4001 && !numhelper(7610)
helpertype = normal
stateno = 7610
ID = 7610
postype = left
ownpal = 1
persistent = 0

[State 362, Snd]
type = playsnd
trigger1 = time = 10 && prevstateno = 4001
value = 14, 10
channel = 0

[State 362, win]
type = changestate
trigger1 = time >= 120 && roundstate = 3
value = ifelse(roundstate = 3, 180, 0)
ctrl = 1


;==========< WIN by SHORYUKEN >==========
[Statedef 359]
type = S
anim = 359
ctrl = 0

[State 359, Spr]
type = sprpriority
trigger1 = animelemtime(3) >= 0
value = -1

[State 359, win]
type = assertspecial
trigger1 = time < 180
flag = roundnotover


;==========< WIN by R.K.H. >==========
[Statedef 3052]
type = S

[State 3052, Anim]
type = changeanim
trigger1 = !time && anim != 170
value = 170

[State 4001, imageoff]
type = afterimagetime
trigger1 = animelemtime(5) > 0
time = 0

[State 3052, Snd]
type = playsnd
trigger1 = animelem = 2
value = 5000 + (var(1) = 2) * 10, 3
channel = 0

[State 3052, Snd]
type = playsnd
trigger1 = animelem = 2
value = 0, 52

[State 3052, Dust]
type = explod
trigger1 = animelem = 2
anim = 7104
ID = 7104
sprpriority = -4
postype = p1
pos = -7, 0
scale = 0.5, 0.5
ownpal = 1

[State 3052, win]
type = changestate
trigger1 = time >= 60 && roundstate = 3
value = ifelse(roundstate = 3, 180, 0)
ctrl = 1


;==========< EVIL WIN 1 >==========
[Statedef 364]
type = S
anim = 364
ctrl = 0
[State 364, intro]
type = assertspecial
trigger1 = time < 180
flag = roundnotover
[State 364, Spr]
type = sprpriority
trigger1 = animelemtime(3) >= 0
value = -1
[State 364, Snd]
type = playsnd
trigger1 = animelem = 5
value = 14, 8
channel = 0


;==========< EVIL WIN 2 >==========
[Statedef 365]
type = S
anim = 365
ctrl = 0
[State 365, win]
type = assertspecial
trigger1 = time < 180
flag = roundnotover

[State 365, Snd]
type = playsnd
trigger1 = animelem = 4
value = 14, 9
channel = 0
[State 365, Shake]
type = envshake
trigger1 = animelem = 4
time = 18
ampl = 4
[State 365, Snd]
type = playsnd
trigger1 = animelem = 4
value = 5, 3
[State 365, Dust]
type = explod
trigger1 = animelem = 4
anim = 7100
ID = 7100
sprpriority = 2
postype = p1
pos = -32, 0
ownpal = 1
[State 365, Dust]
type = explod
trigger1 = animelem = 4
anim = 7104
ID = 7104
sprpriority = -2
postype = p1
pos = -32, 0
scale = 0.75, 0.75
ownpal = 1


;==========< LOSE (Time over) >==========
[Statedef 170]
type = S
ctrl = 0
velset = 0, 0
anim = 170
velset = 0, 0
[State 170, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1


;==========< DRAWGAME (Time over) >==========
[Statedef 175]
type = S
ctrl = 0
velset = 0, 0
anim = 170
[State 175, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1


;==========< CONTINUE? >==========
[Statedef 5500]
type = S
ctrl = 0
velset = 0, 0
[State 5500, Anim]
type = changeanim
trigger1 = !time
value = 5500


;==========< FALL RECOVERY >==========
[Statedef 5200]
type = A
movetype = H
physics = N
[State 5200, Anim]
type = changeanim
trigger1 = anim = 5035 && !animtime
value = 5050
[State 5200, Vel]
type = veladd
trigger1 = 1
y = gethitvar(yaccel)
[State 5200, End]
type = selfstate
trigger1 = vel y > 0 && pos y >= -10
value = 5201

[Statedef 5201]
type = S
movetype = I
physics = N
anim = 5200
ctrl = 0
facep2 = 1

[State 5201, Pos]
type = posset
trigger1 = 1
y = 0
[State 5201, Vel]
type = velset
trigger1 = !time
x = -8
y = 0
[State 5201, Vel]
type = velmul
trigger1 = 1
x = 0.9

[State 5201, Snd]
type = playsnd
trigger1 = animelem = 1
value = 3 + (var(1) = 2) * 10, 0
channel = 0
[State 5201, Flash]
type = palfx
trigger1 = !time
add = 255, 255, 255
sinadd = -255, -255, -255, 40
time = 10

[State 5201, Dust]
type = playsnd
trigger1 = !time
value = 0, 101
[State 5201, Dust]
type = explod
trigger1 = !(time % 6) && abs(vel x) >= 1
anim = 7103
sprpriority = 3
postype = p1
pos = 0, 0
vel = 1, 0
scale = 1, 1
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 5201, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1
[State 5201, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


[Statedef 5210]
type = A
movetype = I
physics = N
anim = 5210
ctrl = 0

[State 5210, Snd]
type = playsnd
trigger1 = animelem = 1
value = 3 + (var(1) = 2) * 10, 3 * (var(1) = 2)
channel = 0

[State 5210, Flash]
type = palfx
trigger1 = !time
add = 255, 255, 255
sinadd = -255, -255, -255, 40
time = 10

[State 5210, Accel]
type = veladd
trigger1 = 1
y = 0.6

[State 5210, Vel]
type = velset
trigger1 = !time
x = ifelse((command = "holdfwd" && command != "holdback"), 4, ifelse((command != "holdfwd" && command = "holdback"), -4, 0))
y = -7.55

[State 5210, Turn]
type = turn
trigger1 = !time
trigger1 = p2dist x < 0

[State 5210, NHB]
type = nothitby
trigger1 = time < 14
value = SCA
time = 1

[State 5210, Ctrl]
type = ctrlset
trigger1 = time >= 14
value = 1

[State 5210, Land]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 52


;==========< TARGET SAFE FALL >==========
[Statedef 5205]
type = A
physics = N
movetype = H

[State 5205, Anim]
type = changeanim
trigger1 = !animtime
trigger1 = anim = 5035
value = 5050

[State 5205, Accel]
type = veladd
trigger1 = 1
y = gethitvar(yaccel)

[State 5205, Ground]
type = selfstate
trigger1 = vel y > 0
trigger1 = pos y >= const(movement.air.gethit.groundrecover.ground.threshold)
value = 5200

[State 5205, Air]
type = selfstate
trigger1 = time >= 60
value = 5210


;===========================================================================
;===============================< -2 STATES >=================================
;===========================================================================
[Statedef -2]

[State -2, Mode]
type = varset
trigger1 = !var(1)
trigger1 = roundstate >= 2
var(1) = ifelse(random < 500, 1, 2)

[State -2, P2 Facing]
type = targetfacing
trigger1 = movecontact = 1 && numtarget
trigger1 = !(target, hitshakeover) && !(target, hitfall) && (target, time <= 1)
value = ifelse(p2dist x >= 0, -1, 1)
ignorehitpause = 1

[State -2, P2 Safe Fall]
type = targetstate
trigger1 = numtarget = 1
trigger1 = target, command = "recovery"
trigger1 = target, pos y >= -48 && target, vel y > 0
trigger1 = target, alive && target, hitfall && target, gethitvar(fall.recover)
trigger1 = target, stateno = 5030 || target, stateno = 5035 || target, stateno = 5050 || target, stateno = 5071
value = 5205
ignorehitpause = 1

[State -2, Counter FX]
type = helper
trigger1 = !numhelper(7400) && var(29)
trigger1 = movehit = 1 && numtarget && !(hitdefattr = SCA, AT)
helpertype = normal
stateno = 7400
ID = 7400
name = "Counter"
postype = left
pausemovetime = 255
supermovetime = 255
ignorehitpause = 1
[State -2, Counter Flag]
type = varset
trigger1 = numenemy
var(29) = (enemynear, movetype = A)
ignorehitpause = 1

[State -2, Original Combo End]
type = varset
trigger1 = var(20) < 0
trigger2 = movetype = H
trigger3 = roundstate != 2
var(20) = 0
ignorehitpause = 1
[State -2, Original Combo Time]
type = varadd
trigger1 = var(20) > 0
var(20) = -1
ignorehitpause = 1

[State -2, Throws Disallowed]
type = varset
triggerall = numenemy
trigger1 = enemynear, movetype != H
trigger1 = enemynear, stateno != 140
trigger1 = (enemynear, ctrl && enemynear, time >= 1) || (enemynear, time >= 8)
trigger2 = enemynear, movetype = A
trigger3 = (enemynear, stateno != [0, 52]) && (enemynear, stateno != [120, 155]) && (enemynear, stateno != [5000, 5120])
var(38) = 0
[State -2, Throws Disallowed]
type = varset
triggerall = numenemy
trigger1 = enemynear, stateno = [150, 155]
trigger2 = (enemynear, stateno = 51 || enemynear, stateno = 140) && (enemynear, prevstateno = [150, 155])
trigger3 = enemynear, movetype = H && enemynear, statetype != A && !var(20)
trigger4 = (enemynear, stateno = [5020, 5040]) && enemynear, hitfall = 0
trigger5 = enemynear, stateno = 40 && enemynear, prevstateno != 52 && (enemynear, anim != [0, 29])
var(38) = 1
ignorehitpause = 1

[State -2, attackvarbyhits]
type = varset
trigger1 = numenemy
fvar(10) = ifelse(enemynear, gethitvar(hitcount) < 3, 24, ifelse(enemynear, gethitvar(hitcount) >= 24, 2, 26 - enemynear, gethitvar(hitcount))) / 24.0
ignorehitpause = 1
[State -2, attackvarbyhits]
type = varset
trigger1 = numenemy && var(20)
fvar(10) = 0.72 * (10 -ifelse(enemynear, gethitvar(hitcount) >= 9, 9, enemynear, gethitvar(hitcount))) / 10.0
ignorehitpause = 1
[State -2, attackvarbyhitsreset]
type = varset
trigger1 = numenemy
trigger1 = (enemynear, movetype != H)
trigger2 = !numenemy
fvar(10) = ifelse(var(20), 0.72, 1)
ignorehitpause = 1

[State -2, dampenervar]
type = varset
trigger1 = 1
fvar(12) = fvar(10) + (var(29) * 0.2)
ignorehitpause = 1
[State -2, dampener]
type = attackmulset
trigger1 = 1
value = fvar(12)
ignorehitpause = 1

[State -2, Defence Levels]
type = lifeadd
trigger1 = var(1) = 2 || var(1) = 3
trigger1 = gethitvar(hitcount) = 1 && gethitvar(damage)
value = -ceil(ifelse(var(1) = 3, 0.25, 0.125) * gethitvar(damage))
kill = 0
ignorehitpause = 1
[State -2, Defence Levels]
type = defencemulset
trigger1 = var(1) = 2 || var(1) = 3
value = ifelse(var(1) = 3, 1.25, 1.125) * (const(data.fall.defence_mul) ** gethitvar(fallcount))
ignorehitpause = 1

[State -2, Free Juggling]
type = assertspecial
trigger1 = var(20) > 0 || numtarget(3120) || numtarget(3180)
trigger2 = roundstate != 2
flag = nojugglecheck
ignorehitpause = 1
[State -2, Original Combo Guard]
type = assertspecial
trigger1 = var(20) > 0
flag = nostandguard
flag2 = nocrouchguard
flag3 = noairguard
ignorehitpause = 1

[State -2, Original Combo PalFX]
type = palfx
trigger1 = var(20) > 60
time = 2
add = 32 + ceil(sin(var(20) / 16.0 * pi) * 32), 32 + ceil(sin(var(20) / 16.0 * pi) * 32), 32 + ceil(sin(var(20) / 16.0 * pi) * 32)
ignorehitpause = 1
[State -2, Original Combo PalFX]
type = palfx
trigger1 = var(20) = [1, 60]
time = 2
add = 64 + ceil(sin(var(20) / 8.0 * pi) * 64), 64 + ceil(sin(var(20) / 8.0 * pi) * 64), 64 + ceil(sin(var(20) / 8.0 * pi) * 64)
ignorehitpause = 1

[State -2, stopsnd3]
type = stopsnd
trigger1 = time <= 1
trigger1 = prevstateno = 3040
channel = 3
[State -2, stopsnd4]
type = stopsnd
trigger1 = time <= 1
trigger1 = prevstateno = 3040
channel = 4

[State -2, KO snd]
type = varset
trigger1 = alive && var(8) > 0
trigger2 = !alive && var(8) < 2
var(8) = ifelse(alive, 0, var(8) + 1)
ignorehitpause = 1
[State -2, KO snd]
type = playsnd
trigger1 = !alive && var(8) = 1
trigger1 = var(8) := 2
value = 11, ifelse((var(1) = 2), 2, 1) + 2 * (stateno = 5130)
ignorehitpause = 1

[State -2, resetmetsushoryukenvar]
type = varset
trigger1 = (stateno != 3100 || anim != 3101) && var(33)
var(33) = 0

[State -2, Voice Pos]
type = sndpan
trigger1 = 1
channel = 0
pan = 0
ignorehitpause = 1

[State -2, Debug]
type = displaytoclipboard
trigger1 = 1
text = "AI = %d Mode = %d Damage = %f"
params = AIlevel, var(1), fvar(12)
ignorehitpause = 1

[State -2, Debug]
type = appendtoclipboard
trigger1 = 1
text = "\nBy PotS - http://www.mugenguild.com/pots/"
ignorehitpause = 1


;===========================================================================
;===============================< -3 STATES >=================================
;===========================================================================
[Statedef -3]

[State -3, Gametime Var]
type = varset
trigger1 = 1
var(58) = gametime
ignorehitpause = 1

[State -3, Shadows]
type = afterimage
triggerall = time = 1 && !var(20)
trigger1 = stateno = 50 && var(9) = 3
trigger2 = stateno = 710 || stateno = 720
time = 2
timegap = 1
framegap = 3
length = 12
palbright = 0, 0, 0
paladd = 0, 0, 0
palmul = 0.9, 0.9, 0.9
palcontrast = 120, 120, 120
palpostbright = 0, 0, 0
trans = add1

[State -3, ExSnd]
type = playsnd
trigger1 = (stateno = [1000, 2999]) && time = 1 && movetype = A && var(10) = 4
value = 7, 6
ignorehitpause = 1
[State -3, ExShadow]
type = afterimage
trigger1 = (stateno = [1000, 2999]) && time = 1 && movetype = A && var(10) = 4
time = 2
timegap = 1
framegap = 1
length = 8
palbright = 32, 32, 0
palcontrast = 128, 128, 128
paladd = -10, -10, -10
palmul = 1.1, 1, 0.5
trans = add
ignorehitpause = 1
[State -3, ExFlash]
type = palfx
trigger1 = (stateno = [1000, 2999]) && movetype = A && var(10) = 4
triggerall = (anim != [1101, 1103]) && anim != 1207
time = 1
add = 32 + ceil(sin(gametime / 1.5) * 32), 32 + ceil(sin(gametime / 1.5) * 32), 0
mul = 300, 300, 200
ignorehitpause = 1

[State -3, Lv1 Shadows]
type = afterimage
trigger1 = stateno = 3000 && animelem = 4
trigger2 = stateno = 3020 && animelem = 3
trigger3 = stateno = 3100 && anim = 3100 && animelem = 4
trigger4 = stateno = 3140 && anim = 3140 && animelemtime(1) = 2
trigger5 = stateno = 3200 && anim = 3200 && animelem = 3
time = 2
timegap = 1
framegap = 10
length = 30
paladd = 0, 0, 0
palmul = 0.75, 0.75, 0.75
palcontrast = 128, 128, 128
palpostbright = 0, 0, 0
trans = add1

[State -3, Lv2 Shadows]
type = afterimage
trigger1 = stateno = 3180 && anim = 3180 && animelem = 2
trigger2 = stateno = 3160 && anim = 3160 && animelem = 4
time = 2
timegap = 1
framegap = 10
length = 30
paladd = 0, 0, 0
palmul = 0.75, 0.75, 0.75
palcontrast = 32, 32, 160
palpostbright = 0, 0, 0
trans = add1

[State -3, Lv3 Shadows]
type = afterimage
trigger1 = stateno = 3040 && anim = 3040 && animelem = 4
trigger2 = stateno = 3120 && anim = 3120 && animelem = 2
trigger3 = stateno = 4000 && time = 1
trigger4 = stateno = 368 && time = 1
time = 2
timegap = 1
framegap = 10
length = 30
paladd = 0, 0, 0
palmul = 0.75, 0.75, 0.75
palcontrast = 160, 32, 32
palpostbright = 0, 0, 0
trans = add1

[State -3, AfterImagePersist]
type = afterimagetime
trigger1 = stateno = 50 && var(9) = 3 && vel y < -1
trigger2 = var(20) > 0
trigger3 = stateno = 710 || stateno = 720 || stateno = 1400
trigger4 = (stateno = [1000, 2999]) && var(10) = 4 && (anim != [1101, 1103]) && anim != 1207
trigger5 = (stateno = [3000, 4999]) && (anim != [1101, 1102]) && (anim != [1111, 1112])
trigger6 = stateno = 368 && animelemtime(2) < 0
time = 2

[State -3, Corner Push]
type = varset
trigger1 = fvar(5)
trigger1 = numtarget
trigger1 = target, hitover || (target, gethitvar(hitshaketime) > 0 && target, time <= 0)
fvar(5) = 0
[State -3, Corner Push]
type = varset
trigger1 = movecontact = 1 && numtarget
fvar(5) = target, gethitvar(xvel)
ignorehitpause = 1
[State -3, Corner Push]
type = posadd
triggerall = fvar(5)
triggerall = (statetype = S || statetype = C) && numtarget
triggerall = !hitpausetime && target, gethitvar(hitshaketime) <= 0
triggerall = (target, statetype = S || target, statetype = C) && !(target, gethitvar(yvel)) && !(target, hitfall)
trigger1 = target, frontedgebodydist <= abs(target, vel x)
trigger1 = (target, gethitvar(xvel) * target, facing) > 0
trigger2 = target, backedgebodydist <= abs(target, vel x)
trigger2 = (target, gethitvar(xvel) * target, facing) < 0
x = ifelse(target, frontedgebodydist <= 0, -1, 1) * (target, facing) * fvar(5)
[State -3, Corner Push]
type = varset
trigger1 = fvar(5)
trigger1 = abs(fvar(5)) < 1.0
fvar(5) = 0
[State -3, Corner Push]
type = varset
trigger1 = numtarget
trigger1 = target, gethitvar(hitshaketime) <= 0
fvar(5) = fvar(5) * 0.85

[State -3, Underground Juggle Prevention]
type = targetbind
trigger1 = movecontact = 1
trigger1 = numtarget && numenemy
trigger1 = (target, time = 0) && (target, ID = enemynear, ID)
trigger1 = !(target, hitshakeover) && (target, pos y > 0)
pos = ceil(p2dist x), ceil(-pos y)
ignorehitpause = 1

[State -3, Prevent Crossup]
type = width
trigger1 = movetype != H
edge = 8, 0
ignorehitpause = 1

[State -3, Variable Height]
type = playerpush
triggerall = statetype = A && movetype != H && numenemy = 1
triggerall = p2bodydist x = [ -(enemynear, const(size.ground.back) + enemynear, const(size.ground.front)) , 0]
trigger1 = p2statetype = S
trigger1 = p2dist y >= (enemynear, const(size.height) - 30)
trigger2 = p2statetype = C
trigger2 = p2dist y >= (enemynear, const(size.height) - 56)
trigger3 = p2statetype = L
trigger3 = p2dist y >= 12
value = 0
ignorehitpause = 1

[State -3, GetHit Snd]
type = playsnd
triggerall = alive && time = 1
triggerall = stateno = 5000 || stateno = 5010
trigger1 = gethitvar(animtype) >= 2 && random < 500
trigger2 = gethitvar(animtype) = 1 && random < 375
trigger3 = gethitvar(animtype) = 0 && random < 250
value = 5000 + (var(1) = 2) * 10, ceil(random / 200)
channel = 0
ignorehitpause = 1

[State -3, GetHit Snd]
type = playsnd
triggerall = alive && time = 1
trigger1 = (stateno = 5000 || stateno = 5010) && numenemy
trigger1 = gethitvar(fall) || (enemynear, hitdefattr = SCA, SA, HA)
trigger2 = (stateno = 5020 || stateno = 5070 || stateno = 5080)
trigger3 = (stateno = 5050 || stateno = 5100) && (prevstateno != [5000, 5199])
value = 5000 + (var(1) = 2) * 10, ceil(random / 200)
channel = 0
ignorehitpause = 1

[State -3, NoWalk after Parry]
type = assertspecial
trigger1 = prevstateno = 700
trigger1 = stateno = 0 && time < 7
flag = nowalk

[State -3, Cheap KO]
type = changestate
trigger1 = !alive && (stateno = [5000, 5010])
trigger1 = (prevstateno = [130, 131]) || (prevstateno = [140, 141]) || (prevstateno = [150, 153])
value = 5130
ignorehitpause = 1

[State -3, Custom Combo Finish]
type = helper
triggerall = winKO
triggerall = var(20) && !numhelper(7600)
trigger1 = movehit = [1, 4]
trigger2 = numhelper(1005)
trigger2 = helper(1005), var(3)
trigger3 = numhelper(1015)
trigger3 = helper(1015), var(3)
trigger4 = stateno = 805 && animelemtime(4) >= 0 && animelemtime(6) < 0
trigger5 = stateno = 810 && (animelemtime(4) = [0, 1])
helpertype = normal
stateno = 7600
ID = 7600
name = "KO FX"
postype = left
pos = 160, -120
ownpal = 1
ignorehitpause = 1
pausemovetime = 999
supermovetime = 999

[State -3, Super Finish]
type = helper
triggerall = winKO
triggerall = roundstate = 3 && !numhelper(7600) && !numhelper(7610)
trigger1 = (movehit = [1, 4]) && numtarget && (stateno = [3000, 4999])
trigger2 = numhelper(3005)
trigger2 = helper(3005), var(3)
trigger3 = numhelper(3025)
trigger3 = helper(3025), var(3)
trigger4 = numhelper(3045)
trigger4 = helper(3045), var(3)
trigger5 = numhelper(3055)
trigger5 = helper(3055), var(3)
helpertype = normal
stateno = 7600 + 0 * (var(0) := stateno)
ID = 7600
name = "KO FX"
postype = left
pos = 160, -120
ownpal = 1
ignorehitpause = 1
pausemovetime = 999
supermovetime = 999
