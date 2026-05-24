; ____________________________________
;| SS1 Bonus by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;====================<MAIN STATE>====================
[Statedef 0]
type = S
physics = N
movetype = I
anim = 9999

[State 0, OK]
type = changestate
trigger1 = ctrl
trigger1 = roundstate = 2
trigger1 = fvar(2) != 0
value = 2


;====================<PLAYING>====================
[Statedef 2]
type = S
physics = N
movetype = I
anim = 9999
ctrl = 0

[State 2, Time]
type = varadd
trigger1 = roundstate = 2
fvar(2) = -0.01666667


;====================<DISPLAY>====================
[Statedef 500]
movetype = I
physics = N
anim = 9999

[State 500, NHB]
type = nothitby
trigger1 = 1
time = -1
value = SCA
ignorehitpause = 1

[State 500, No Bars]
type = assertspecial
trigger1 = root, fvar(1) != -2
trigger1 = !numpartner
flag = nobardisplay

[State 500, No Bars]
type = assertspecial
triggerall = root, fvar(1) != -2
triggerall = numpartner
trigger1 = partner, name = "Duck Hunt" && partner, authorname = "Phantom.of.the.Server"
trigger2 = partner, name = "Catwalk" && partner, authorname = "Phantom.of.the.Server"
trigger3 = partner, name = "SS1 Bonus" && partner, authorname = "Phantom.of.the.Server"
trigger4 = partner, name = "Sky Chase" && partner, authorname = "Phantom.of.the.Server"
flag = nobardisplay

[State 500, Timer BG]
type = explod
trigger1 = !numexplod(510)
trigger1 = root, fvar(1) != -2
anim = 510
ID = 510
sprpriority = 33
postype = left
pos = 136, ifelse((gamewidth / gameheight) > 1.55, 8, 16)
scale = 1, 1
bindtime = -1
removetime = -1
pausemovetime = -1
supermovetime = -1

[State 500, Score BG]
type = explod
trigger1 = !numexplod(530)
anim = 530
ID = 530
sprpriority = 33
postype = left
pos = ifelse(teamside = 2, 53, 197), ifelse((gamewidth / gameheight) > 1.55, 15, 30)
scale = 1, 1
bindtime = -1
removetime = -1
pausemovetime = -1
supermovetime = -1

;--- Timer ---
[State 500, 10]
type = varset
trigger1 = root, var(2) = [1, 98]
var(11) = floor(root, var(2) * 0.1)

[State 500, 1]
type = varset
trigger1 = root, var(2) = [1, 98]
var(10) = floor(root, var(2)) - (var(11) * 10)

[State 500, Min]
type = varrangeset
trigger1 = root, var(2) <= 0
first = 10
last = 11
value = 0

[State 500, Max]
type = varrangeset
trigger1 = root, var(2) >= 99
first = 10
last = 11
value = 9

[State 500, 1]
type = explod
trigger1 = root, fvar(1) != -2
anim = 520 + var(10)
ID = 520
sprpriority = 34
postype = left
pos = 161, ifelse((gamewidth / gameheight) > 1.55, 16, 24)
bindtime = -1
removetime = 1
pausemovetime = -1
supermovetime = -1

[State 500, 10]
type = explod
triggerall = root, fvar(1) != -2
trigger1 = var(11)
trigger2 = (root, fvar(1) < 0)
anim = 520 + var(11)
ID = 520
sprpriority = 34
postype = left
pos = 145, ifelse((gamewidth / gameheight) > 1.55, 16, 24)
bindtime = -1
removetime = 1
pausemovetime = -1
supermovetime = -1


;--- Score ---
[State 500, 100]
type = varset
trigger1 = root, var(10) = [1, 998]
var(22) = floor(root, var(10) * 0.01)

[State 500, 10]
type = varset
trigger1 = root, var(10) = [1, 998]
var(21) = floor(root, var(10) * 0.1) - (var(22) * 10)

[State 500, 1]
type = varset
trigger1 = root, var(10) = [1, 998]
var(20) = root, var(10) - (var(21) * 10) - (var(22) * 100)

[State 500, Min]
type = varrangeset
trigger1 = root, var(10) <= 0
first = 20
last = 22
value = 0

[State 500, Max]
type = varrangeset
trigger1 = root, var(10) >= 999
first = 20
last = 22
value = 9

[State 500, 1]
type = explod
trigger1 = 1
anim = 540 + var(20)
ID = 540
sprpriority = 34
postype = left
pos = ifelse(teamside = 2, 97, 241), ifelse((gamewidth / gameheight) > 1.55, 25, 40)
bindtime = -1
removetime = 1
pausemovetime = -1
supermovetime = -1

[State 500, 10]
type = explod
trigger1 = var(21) || var(22)
anim = 540 + var(21)
ID = 540
sprpriority = 34
postype = left
pos = ifelse(teamside = 2, 81, 225), ifelse((gamewidth / gameheight) > 1.55, 25, 40)
bindtime = -1
removetime = 1
pausemovetime = -1
supermovetime = -1

[State 500, 100]
type = explod
trigger1 = var(22)
anim = 540 + var(22)
ID = 540
sprpriority = 34
postype = left
pos = ifelse(teamside = 2, 65, 209), ifelse((gamewidth / gameheight) > 1.55, 25, 40)
bindtime = -1
removetime = 1
pausemovetime = -1
supermovetime = -1

[State 500, Background Safety]
type = explod
trigger1 = !numexplod(590)
anim = 590
ID = 590
sprpriority = 32
postype = p1
pos = -ceil(pos x), -ceil(pos y) + 30
scale = 1, 1
removetime = -1
pausemovetime = -1
supermovetime = -1

[State 500, Background Safety]
type = explod
trigger1 = !numexplod(591)
anim = 590
ID = 591
sprpriority = 32
postype = p1
pos = -ceil(pos x), -ceil(pos y) + ifelse((gamewidth / gameheight) > 1.55, -218, -248)
scale = 1, 1
facing = -1
vfacing = -1
removetime = -1
pausemovetime = -1
supermovetime = -1

[State 500, Background Safety]
type = modifyexplod
trigger1 = numexplod(590)
ID = 590
postype = p1
pos = -ceil(pos x), -ceil(pos y) + 30

[State 500, Background Safety]
type = modifyexplod
trigger1 = numexplod(591)
ID = 591
postype = p1
pos = -ceil(pos x), -ceil(pos y) + ifelse((gamewidth / gameheight) > 1.55, -218, -248)

[State 500, End]
type = destroyself
trigger1 = root, var(5) = 2


;====================<KUROKOS>====================
[Statedef 900]
movetype = I
physics = N
anim = 9999

[State 900, Pos]
type = posset
trigger1 = !time
x = 0
y = 0

[State 900, Kuroko C]
type = removeexplod
trigger1 = numexplod(900)
trigger1 = roundstate >= 3 && root, var(10) <= 0
ID = 900
persistent = 0

[State 900, Kuroko C]
type = explod
trigger1 = !numexplod(900)
anim = ifelse((roundstate >= 3 && root, var(10) <= 0), 901, 900)
ID = 900
sprpriority = -32
postype = p1
pos = 0, -30
bindtime = -1
removetime = -1
scale = 1, 1
facing = facing
removetime = -1

[State 900, Kuroko L]
type = removeexplod
trigger1 = random < 32
trigger1 = numexplod(901)
trigger1 = roundstate = 4 && root, var(10) <= 0
ID = 901
persistent = 0

[State 900, Kuroko L]
type = explod
trigger1 = !numexplod(901)
anim = ifelse((roundstate >= 3 && root, var(10) <= 0), 901, 900)
ID = 901
sprpriority = -32
postype = p1
pos = -104, -32
bindtime = -1
removetime = -1
scale = 1, 1
facing = facing
removetime = -1

[State 900, Kuroko R]
type = removeexplod
trigger1 = random < 32
trigger1 = numexplod(902)
trigger1 = roundstate = 4 && root, var(10) <= 0
ID = 902
persistent = 0

[State 900, Kuroko R]
type = explod
trigger1 = !numexplod(902)
anim = ifelse((roundstate >= 3 && root, var(10) <= 0), 901, 900)
ID = 902
sprpriority = -32
postype = p1
pos = 104, -32
bindtime = -1
removetime = -1
scale = 1, 1
facing = facing
removetime = -1

[State 900, Kuroko CL]
type = removeexplod
trigger1 = random < 32
trigger1 = numexplod(903)
trigger1 = roundstate = 4 && root, var(10) <= 0
ID = 903
persistent = 0

[State 900, Kuroko CL]
type = explod
trigger1 = !numexplod(903)
anim = ifelse((roundstate >= 3 && root, var(10) <= 0), 901, 900)
ID = 903
sprpriority = -32
postype = p1
pos = -56, -32
bindtime = -1
removetime = -1
scale = 1, 1
facing = facing
removetime = -1

[State 900, Kuroko CR]
type = removeexplod
trigger1 = random < 32
trigger1 = numexplod(904)
trigger1 = roundstate = 4 && root, var(10) <= 0
ID = 904
persistent = 0

[State 900, Kuroko CR]
type = explod
trigger1 = !numexplod(904)
anim = ifelse((roundstate >= 3 && root, var(10) <= 0), 901, 900)
ID = 904
sprpriority = -32
postype = p1
pos = 56, -32
bindtime = -1
removetime = -1
scale = 1, 1
facing = facing
removetime = -1

[State 900, Applause]
type = playsnd
trigger1 = roundstate = 4 && root, var(10) <= 0
channel = 0
value = 2, 0
lowpriority = 1


;====================<TARGET>====================
;--- WAITING ---
[Statedef 1090]
type = A
physics = N
movetype = H
anim = 9999
ctrl = 0
velset = 0, 0

[State 1090, Override]
type = hitoverride
trigger1 = 1
attr = SCA, AA, AP, AT
time = -1
stateno = 1030
ignorehitpause = 1

[State 1090, HB]
type = hitby
trigger1 = 1
time = -1
value = SCA, AA
ignorehitpause = 1

[State 1090, HB]
type = hitby
trigger1 = root, var(50)
time = -1
value = SCA, AA, AP
ignorehitpause = 1

[State 1090, Pos]
type = posset
trigger1 = ishelper(1000) || ishelper(1001) || ishelper(1002)
x = ifelse(ishelper(1000), -120, ifelse(ishelper(1001), 0, 120))
y = 24

[State 1090, Pos]
type = posset
trigger1 = root, var(5) = 2
trigger1 = ishelper(1000) || ishelper(1001) || ishelper(1002)
x = ifelse(ishelper(1000), -60, ifelse(ishelper(1001), 0, 60))
y = 24

[State 1090, Pos]
type = posset
trigger1 = ishelper(1003)
x = ifelse(random < 333, -120, ifelse(random < 500, 0, 120))
y = ifelse((gamewidth / gameheight) > 1.55, -186, -216)

[State 1090, Pos]
type = posset
trigger1 = root, var(5) = 2
trigger1 = ishelper(1003)
x = ifelse(random < 500, -60, 60)
y = ifelse((gamewidth / gameheight) > 1.55, -186, -216)

[State 1090, End]
type = changestate
trigger1 = roundstate < 2
trigger1 = !(root, roundsexisted)
trigger1 = root, stateno = 190 && root, time = 60
value = 1095

[State 1090, End]
type = changestate
triggerall = roundstate = 2
trigger1 = random < 6
trigger2 = random < 100
trigger2 = numhelper(1000)
trigger2 = helper(1000), stateno = 1090
trigger2 = helper(1000), time >= 60
trigger2 = numhelper(1001)
trigger2 = helper(1001), stateno = 1090
trigger2 = helper(1001), time >= 60
trigger2 = numhelper(1002)
trigger2 = helper(1002), stateno = 1090
trigger2 = helper(1002), time >= 60
trigger2 = numhelper(1003)
trigger2 = helper(1003), stateno = 1090
trigger2 = helper(1003), time >= 60
value = 1000


;--- INTRO ---
[Statedef 1095]
type = A
physics = N
movetype = H
anim = 9999
ctrl = 0
velset = 0, 0

[State 1095, Arrow]
type = explod
trigger1 = !ishelper(1003)
trigger1 = !numexplod(1095)
anim = 1095
ID = 1095
ontop = 1
postype = p1
pos = 0, -17
facing = facing
scale = 1, 1
bindtime = -1
removetime = -1
pausemovetime = -1
supermovetime = -1

[State 1095, Arrow]
type = explod
trigger1 = root, var(5) != 2
trigger1 = ishelper(1003)
trigger1 = !numexplod(1096)
anim = 1096
ID = 1096
ontop = 1
postype = left
facing = facing
scale = 1, 1
bindtime = -1
removetime = -1
pausemovetime = -1
supermovetime = -1

[State 1095, Arrow]
type = modifyexplod
trigger1 = numexplod(1096)
postype = left
pos = 160 + ifelse((time % 96) < 32, -120, ifelse((time % 96) < 64, 0, 120)), 17

[State 1095, Arrow]
type = modifyexplod
trigger1 = root, var(5) = 1
trigger1 = numexplod(1096)
postype = left
pos = 160 + ifelse((time % 80) < 16, -120, ifelse((time % 80) < 32, -60, ifelse((time % 80) < 48, 0, ifelse((time % 80) < 64, 60, 120)))), 17

[State 1095, End]
type = removeexplod
trigger1 = roundstate = 2

[State 1095, End]
type = changestate
trigger1 = roundstate = 2
value = 1090


;--- APPEAR ---
[Statedef 1000]
type = A
physics = N
movetype = I
anim = ifelse(ishelper(1003), 1003, 1000)
ctrl = 0
velset = 0, 0
sprpriority = 30

[State 1000, End]
type = changestate
trigger1 = !animtime
value = 1010


;--- READY ---
[Statedef 1010]
type = A
physics = N
movetype = I
anim = ifelse(ishelper(1003), 1013, 1010)
ctrl = 0
velset = 0, 0
sprpriority = 30

[State 1010, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 0

[State 1010, End]
type = changestate
trigger1 = time < 120 && random < 8
trigger2 = time >= 120
trigger3 = roundstate != 2
value = 1020


;--- DISAPPEAR ---
[Statedef 1020]
type = A
physics = N
movetype = I
anim = ifelse(ishelper(1003), 1023, 1020)
ctrl = 0
velset = 0, 0
sprpriority = 30

[State 1020, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = -1
ignorehitpause = 1

[State 1020, End]
type = changestate
trigger1 = !animtime
value = 1090


;--- GET HIT ---
[Statedef 1030]
type = A
physics = N
movetype = H
anim = ifelse(ishelper(1003), 1033, 1030)
ctrl = 0
velset = 0, 0
sprpriority = 30

[State 1030, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = -1
ignorehitpause = 1

[State 1030, Flash]
type = palfx
trigger1 = !time
time = 2
add = 255, 255, 255

[State 1030, End]
type = changestate
trigger1 = hitshakeover
value = 1040


;--- CUT ---
[Statedef 1040]
type = A
physics = N
movetype = H
anim = ifelse(ishelper(1003), 1043, 1040)
ctrl = 0
velset = 0, 0
sprpriority = 30

[State 1040, Sliced]
type = explod
trigger1 = !time
anim = ifelse(ishelper(1003), 1046, 1045)
sprpriority = 31
postype = p1
vel = 0.5 * gethitvar(xvel), 0.5 * gethitvar(yvel)
accel = 0, 0.5 * gethitvar(yaccel)
scale = const(size.xscale), const(size.yscale)
removetime = -2

[State 1040, Number of Hits]
type = parentvaradd
trigger1 = !time
var(10) = -1

[State 1040, End]
type = changestate
trigger1 = !animtime
value = 1050


;--- HIT, DISAPPEAR ---
[Statedef 1050]
type = A
physics = N
movetype = H
anim = ifelse(ishelper(1003), 1053, 1050)
ctrl = 0
velset = 0, 0
sprpriority = 30

[State 1050, End]
type = changestate
trigger1 = !animtime
value = 1090


;====================<DEAD>====================
[Statedef 5150]
type = A
movetype = H
physics = N
anim = 9999

[State 5150, Hurt]
type = lifeset
trigger1 = 1
value = 0
kill = 1


;==========<COMMON ERASE>==========
[Statedef 10]

[State 10, End]
type = changestate
trigger1 = 1
value = 0

[Statedef 11]

[State 11, End]
type = changestate
trigger1 = 1
value = 0

[Statedef 12]

[State 12, End]
type = changestate
trigger1 = 1
value = 0

[Statedef 20]

[State 20, End]
type = changestate
trigger1 = 1
value = 0

[Statedef 40]

[State 40, End]
type = changestate
trigger1 = 1
value = 0

[Statedef 50]

[State 50, End]
type = changestate
trigger1 = 1
value = 0

[Statedef 51]

[State 51, End]
type = changestate
trigger1 = 1
value = 0

[Statedef 52]

[State 52, End]
type = changestate
trigger1 = 1
value = 0

[Statedef 45]

[State 45, End]
type = changestate
trigger1 = 1
value = 0

[Statedef 100]

[State 100, End]
type = changestate
trigger1 = 1
value = 0

[Statedef 105]

[State 105, End]
type = changestate
trigger1 = 1
value = 0


;==========<Initialize>==========
[Statedef 5900]
type = A

[State 5900, var reset]
type = varrangeset
trigger1 = !roundsexisted
value = 0

[State 5900, var reset]
type = varrangeset
trigger1 = !roundsexisted
fvalue = 0

[State 5900, Palette]
type = remappal
trigger1 = 1
source = 1, 1
dest = 1, palno

[State 5900, End]
type = changestate
trigger1 = 1
value = 5901


;--- Second ---
[Statedef 5902]
type = A

[State 5902, Reset Life]
type = varset
trigger1 = 1
var(2) = 60

[State 5902, Reset Time]
type = varset
trigger1 = 1
fvar(2) = fvar(1)

[State 5902, Goal]
type = varset
trigger1 = 1
var(10) = ceil(fvar(1) / 2.0)

[State 5902, Goal]
type = varset
trigger1 = fvar(1) = -1
var(10) = 100

[State 5902, Goal]
type = varset
trigger1 = fvar(1) = -2
var(10) = 20

[State 5902, Goal]
type = varset
trigger1 = var(51) > 0
var(10) = var(51)

[State 5902, Goal]
type = varset
trigger1 = var(51) > 999
var(10) = 999

[State 5902, End]
type = changestate
trigger1 = 1
value = 190


;====================<INTRO>====================
[Statedef 190]
type = A
physics = N
movetype = I
anim = 9999
ctrl = 0

[State 190, Message]
type = explod
trigger1 = !time && !roundsexisted
anim = 190
ID = 190
ontop = 1
postype = left
pos = 160, ifelse((gamewidth / gameheight) > 1.55, 88, 112)
scale = 1, 1
bindtime = -1
removetime = 76
pausemovetime = -1
supermovetime = -1

[State 190, Message]
type = modifyexplod
trigger1 = numexplod(190)
trigger1 = time = [60, 76]
scale = 1 -0.0625 * (time -60), 1 -0.0625 * (time -60)

[State 190, Message]
type = removeexplod
trigger1 = ctrl
trigger2 = time >= 76

[State 190, End]
type = changestate
trigger1 = ctrl
value = 0


;====================<TIME OVER>====================
[Statedef 170]
physics = N
movetype = I
ctrl = 1

[State 170, End]
type = changestate
trigger1 = 1
value = 5150

[Statedef 175]
physics = N
movetype = I
ctrl = 1

[State 175, End]
type = changestate
trigger1 = 1
value = 5150


;====================<WIN>====================
[Statedef 180]
physics = N
movetype = I
ctrl = 0

[State 180, Quote]
type = victoryquote
trigger1 = 1
value = 1

[State 180, End]
type = changestate
trigger1 = 1
value = 5150


;====================<ERASE HITS>====================
[Statedef 5000]
movetype = H

[State 5000, override]
type = changestate
trigger1 = 1
value = ifelse(ishelper, 1050, 2)

[Statedef 5001]
movetype = H

[State 5001, override]
type = changestate
trigger1 = 1
value = ifelse(ishelper, 1050, 2)

[Statedef 5002]
movetype = H

[State 5002, override]
type = changestate
trigger1 = 1
value = ifelse(ishelper, 1050, 2)

[Statedef 5010]
movetype = H

[State 5010, override]
type = changestate
trigger1 = 1
value = ifelse(ishelper, 1050, 2)

[Statedef 5020]
movetype = H

[State 5020, override]
type = changestate
trigger1 = 1
value = ifelse(ishelper, 1050, 2)

[Statedef 5030]
movetype = H

[State 5030, override]
type = changestate
trigger1 = 1
value = ifelse(ishelper, 1050, 2)

[Statedef 5050]
movetype = H

[State 5050, override]
type = changestate
trigger1 = 1
value = ifelse(ishelper, 1050, 2)

[Statedef 5070]
movetype = H

[State 5070, override]
type = changestate
trigger1 = 1
value = ifelse(ishelper, 1050, 2)

[Statedef 5080]
movetype = H

[State 5080, override]
type = changestate
trigger1 = 1
value = ifelse(ishelper, 1050, 2)

[Statedef 5100]
movetype = H

[State 5100, override]
type = changestate
trigger1 = 1
value = ifelse(ishelper, 1050, 2)


;===========================================================================
;===============================<-2 STATES>=================================
;===========================================================================
[Statedef -2]

[State -2, NHB]
type = nothitby
trigger1 = 1
time = -1
value = SCA, AA, AP, AT
ignorehitpause = 1

[State -2, Life]
type = lifeset
trigger1 = 1
trigger1 = roundstate >= 3 && life > 1
value = lifemax

[State -2, Turn]
type = turn
trigger1 = pos x <= 0 && facing != 1
trigger2 = pos x > 0 && facing != -1

[State -2, Pos]
type = posset
trigger1 = numenemy = 1
trigger1 = roundstate = 2
trigger1 = facing != enemynear, facing
trigger1 = enemynear, ctrl
trigger1 = enemynear, vel x < 0
trigger1 = enemynear, anim != [5, 6]
trigger1 = ((enemynear, time) % 10) = 1
x = ifelse(pos x <= 0, (gamewidth / 2), (-gamewidth / 2))
y = 0

[State -2, Pos]
type = posset
trigger1 = numenemy = 1
trigger1 = roundstate = 2
x = ifelse(pos x <= 0, -(gamewidth / 2), (gamewidth / 2))

[State -2, Pos Center]
type = posset
trigger1 = numenemy >= 2
trigger1 = roundstate = 2
trigger2 = roundstate != 2
x = 0
y = 0

[State -2, No Push]
type = playerpush
trigger1 = 1
value = 0

[State -2, Camera]
type = width
triggerall = roundstate >= 2
trigger1 = !numpartner
trigger2 = numpartner
trigger2 = partner, name = "SS1 Bonus" && partner, authorname = "Phantom.of.the.Server"
edge = frontedgebodydist, backedgebodydist

[State -2, Not Bound]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 0

[State -2, No Push]
type = playerpush
trigger1 = 1
value = 0

[State -2, Ctrl]
type = changestate
trigger1 = stateno && ctrl
value = 0

[State -2, Ctrl]
type = ctrlset
trigger1 = stateno && ctrl
value = 0

[State -2, Time]
type = varset
trigger1 = fvar(1) > 0
trigger1 = fvar(2) > fvar(1)
fvar(2) = fvar(1)

[State -2, Time]
type = varset
trigger1 = fvar(2) = (-1, 0)
fvar(2) = 0

[State -2, Time]
type = varset
trigger1 = 1
var(2) = ceil(fvar(2))

[State -2, Time]
type = assertspecial
trigger1 = alive && fvar(1) != -2
flag = timerfreeze

[State -2, Assisting?]
type = varset
trigger1 = numpartner
trigger1 = partner, name = "SS1 Bonus" && partner, authorname = "Phantom.of.the.Server"
var(5) = ifelse((ID > partner, ID), 2, 1)

[State -2, Assisting?]
type = varset
trigger1 = !numpartner
var(5) = 0

[State -2, Hits Minimum]
type = varset
trigger1 = var(10) < 0
var(10) = 0

[State -2, Share Hits]
type = varset
trigger1 = numpartner
trigger1 = var(5) = 1 || var(5) = 2
trigger1 = partner, var(10) < var(10)
var(10) = partner, var(10)

[State -2, Assert]
type = assertspecial
triggerall = alive
trigger1 = !numpartner
trigger2 = numpartner
trigger2 = partner, name = "Sky Chase" && partner, authorname = "Phantom.of.the.Server"
trigger3 = numpartner
trigger3 = partner, name = "SS1 Bonus" && partner, authorname = "Phantom.of.the.Server"
flag = nokoslow

[State -2, Target DL]
type = helper
trigger1 = !numhelper(1000)
helpertype = normal
stateno = 1090
ID = 1000
name = "Target"
postype = left
pos = 40, ceil(screenpos y -pos y)
facing = ifelse(teamside = 2, 1, -1)
ownpal = 1

[State -2, Target DC]
type = helper
trigger1 = var(5) != 2
trigger1 = !numhelper(1001)
helpertype = normal
stateno = 1090
ID = 1001
name = "Target"
postype = left
pos = 160, ceil(screenpos y -pos y)
facing = ifelse(teamside = 2, 1, -1)
ownpal = 1

[State -2, Target DR]
type = helper
trigger1 = !numhelper(1002)
helpertype = normal
stateno = 1090
ID = 1002
name = "Target"
postype = left
pos = 280, ceil(screenpos y -pos y)
facing = ifelse(teamside = 2, 1, -1)
ownpal = 1

[State -2, Target UC]
type = helper
trigger1 = !numhelper(1003)
helpertype = normal
stateno = 1090
ID = 1003
name = "Target"
postype = left
pos = ifelse(random < 333, 40, ifelse(random < 500, 160, 280)), ceil(screenpos y -pos y)
facing = ifelse(teamside = 2, 1, -1)
ownpal = 1

[State -2, Display]
type = helper
trigger1 = var(5) != 2
trigger1 = roundstate != 4
trigger1 = !numhelper(500)
helpertype = normal
stateno = 500
ID = 500
name = "Display"
postype = left
pos = 160, 0
pausemovetime = 2147483647
supermovetime = 2147483647
ownpal = 1

[State -2, Kurokos]
type = helper
trigger1 = var(5) != 2
trigger1 = !numhelper(900)
helpertype = normal
stateno = 900
ID = 900
name = "Kurokos"
postype = left
pausemovetime = 2147483647
supermovetime = 2147483647
ownpal = 1

[State -2, Debug]
type = displaytoclipboard
trigger1 = 1
text = "Hit = %d Time = %d NumHelper = %d"
params = var(10), var(2), numhelper
ignorehitpause = 1

[State -2, Debug]
type = displaytoclipboard
trigger1 = var(5) = 2
text = "Assisting..."
ignorehitpause = 1

[State -2, Debug]
type = appendtoclipboard
trigger1 = 1
text = "\nBy PotS - https://network.mugenguild.com/pots/"
ignorehitpause = 1
