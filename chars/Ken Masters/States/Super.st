; _________________________________________
;| Ken by Jmorphman                        |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==============================================================================================
;========================================<SUPER STATES>========================================
;==============================================================================================

;========================<SHORYUREPPA>=============================
[StateDef 3000]
type = S
physics = N
moveType = A
anim = 3000
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -1000
faceP2 = 1

[State 3000, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000, 2999]) && var(7)) || var(20)

[State 3000, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3000, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3000, Corner Push]
type = VarSet
trigger1 = Time = 3
fvar(5) = 0

[State 3000, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 43

[State 3000, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3000, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3000, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(2) < 0
time = 1
value = SCA

[State 3000, SuperPause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = 10, -28
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3000, SuperPause]
type = SuperPause
trigger1 = Time = 3
time = 43
moveTime = 43
p2DefMul = 1
unHittable = 0
anim = -1
sound = s8500,0
darken = 0

[State 3000, Voice 1]
type = PlaySnd
trigger1 = !Time && var(40) != 1
value = 3000,0
channel = 0

[State 3000, Voice 1 (Violent)]
type = PlaySnd
trigger1 = !Time && var(40) = 1
value = 3100,10
channel = 0

[State 3000, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 2
value = 3000,1 + 9 * (var(40) = 1)
channel = 0

[State 3000, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x = 10

[State 3000, Dust Helper]
type = Helper
trigger1 = AnimElem = 2
helperType = Normal
stateNo = 8103
ID = 8100
name = "Shoryureppa Dust (Ground)"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 3000, Woosh sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1,2
channel = 1

[State 3000, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 5
value = 40,0
channel = 3

[State 3000, Landing Dust Explod]
type = Explod
trigger1 = AnimElem = 12
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3000, Landing Sound]
type = PlaySnd
trigger1 = AnimElem = 12
value = 52,0
channel = 4

[State 3000, VelSet]
type = VelSet
trigger1 = AnimElem = 12
x = 10

[State 3000, VelAdd]
type = VelAdd
triggerAll = vel x >= 0
trigger1 = AnimElemTime(2) > 0 && AnimElemTime(12) < 0
trigger2 = AnimElemTime(12) > 0
x = -0.78125

[State 3000, VelSet]
type = VelSet
trigger1 = vel x < 0
x = 0

[State 3000, Woosh sound]
type = PlaySnd
trigger1 = AnimElem = 13
value = 1,2
channel = 5

[State 3000, Fire sound]
type = PlaySnd
trigger1 = AnimElem = 15
value = 1100,1
channel = 6

[State 3000, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 15
value = 40,0
channel = 7

[State 3000, Fist Overlay]
type = Explod
trigger1 = AnimElem = 14
ID = 3004
anim = 3004
bindTime = -1
sprPriority = 2
posType = P1
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3000, Shoryuken Flames (Ground)]
type = Explod
trigger1 = AnimElem = 12 && var(40) != 3
ID = 3005
anim = 1125
bindTime = 8
sprPriority = 3
posType = P1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3000, Shoryuken Flames (Ascending)]
type = Explod
trigger1 = AnimElem = 15 && var(40) != 3
ID = 3006
anim = 1126
bindTime = -1
removeTime = 21
sprPriority = 3
posType = P1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3000, Shoryuken Flames (Fade away)]
type = Explod
trigger1 = AnimElem = 16 && var(40) != 3
ID = 3007
anim = 1127
sprPriority = 3
posType = P1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3000, Shoryuken Flames (SFIII)]
type = Explod
trigger1 = AnimElem = 12 && var(40) = 3
ID = 3005
anim = 13005
bindTime = -1
sprPriority = 3
posType = P1
pos = 12,-28
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3000, ModifyExplod]
type = ModifyExplod
trigger1 = AnimElem = 13 && NumExplod(3005) && var(40) = 3
ID = 3005
posType = P1
pos = 21,-39
ignoreHitPause = 0

[State 3000, ModifyExplod]
type = ModifyExplod
trigger1 = AnimElem = 14 && NumExplod(3005) && var(40) = 3
ID = 3005
posType = P1
pos = 38,-82
ignoreHitPause = 0

[State 3000, ModifyExplod]
type = ModifyExplod
trigger1 = AnimElemTime(15) >= 0 && NumExplod(3005) && var(40) = 3
ID = 3005
posType = P1
pos = 14,-143
ignoreHitPause = 0

[State 3000, VelSet]
type = VelSet
trigger1 = AnimElemTime(15) = 0
y = -10

[State 3000, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(15) > 1
y = 0.5859375

[State 3000, Dust Helper]
type = Helper
trigger1 = AnimElemTime(15) = 0
helperType = Normal
stateNo = 8100
ID = 8100
name = "Shoryureppa Dust (Air)"
posType = P1
ownPal = 1

[State 3000, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 15
stateType = A
physics = N

[State 3000, Hit 1]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 3
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 49 < 7, 7, fvar(11) * 49)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 2,2
guard.pauseTime = 2,2
animType = Hard
air.animType = Hard
fall.animType = Hard
ground.type = Low
air.type = Low
ground.hitTime = 22
ground.slideTime = 22
guard.hitTime = 22
air.hitTime = 120
ground.velocity = -7.51,0
ground.cornerPush.velOff = 0
guard.velocity = -7.51
guard.cornerPush.velOff = 0
air.velocity = -2.5, -10
air.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 27), var(36) := -40
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3000, Hit 2]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 + HitCount)
trigger1 = AnimElem = 4
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 2,2
guard.pauseTime = 2,2
animType = Hard
air.animType = Hard
fall.animType = Hard
ground.type = Low
air.type = Low
ground.hitTime = 22
ground.slideTime = 22
guard.hitTime = 22
air.hitTime = 120
ground.velocity = -7.51,0
ground.cornerPush.velOff = 0
guard.velocity = -7.51
guard.cornerPush.velOff = 0
air.velocity = -2.5, -10
air.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 36), var(36) := -79
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3000, Hit 3]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 + HitCount)
trigger1 = AnimElem = 5
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 2,2
guard.pauseTime = 2,2
animType = Hard
air.animType = Hard
fall.animType = Hard
ground.type = High
air.type = Low
ground.hitTime = 22
ground.slideTime = 22
guard.hitTime = 22
air.hitTime = 120
ground.velocity = -7.51,0
ground.cornerPush.velOff = 0
guard.velocity = -7.51
guard.cornerPush.velOff = 0
air.velocity = -2.5, -10
air.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 27), var(36) := -112
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3000, Hit 4]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 + HitCount)
trigger1 = AnimElem = 13
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 2,2
guard.pauseTime = 2,2
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 22
ground.slideTime = 22
guard.hitTime = 22
air.hitTime = 120
ground.velocity = -2.5, -10
ground.cornerPush.velOff = 0
guard.velocity = -7.51
guard.cornerPush.velOff = 0
air.velocity = -2.5, -10
air.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 27), var(36) := -40
palFX.time = 42
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 3000, Flame Particle Timer Set]
type = VarSet
trigger1 = MoveHit = 1 && NumTarget && AnimElemTime(14) < 0
trigger1 = !(Target, HitShakeOver)
var(45) = 42
ignoreHitPause = 1
persistent = 0

[State 3000, Flame Particles]
type = Helper
trigger1 = !NumHelper(8150) && AnimElemTime(13) >= 0
trigger1 = MoveHit = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
trigger1 = var(43) := (Target, ID)
helperType = Normal
stateNo = 8150
ID = 8150
name = "Flame Particles"
posType = P2
ownPal = 1
ignoreHitPause = 1

[State 3000, Hit 5]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 + HitCount)
trigger1 = AnimElem = 14
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 2,2
guard.pauseTime = 2,2
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 22
ground.slideTime = 22
guard.hitTime = 22
air.hitTime = 120
ground.velocity = -2.5, -10
ground.cornerPush.velOff = 0
guard.velocity = -7.51
guard.cornerPush.velOff = 0
air.velocity = -2.5, -10
air.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 36), var(36) := -79
palFX.time = 44
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 3000, Flame Particle Timer Set]
type = VarSet
trigger1 = MoveHit = 1 && NumTarget && AnimElemTime(14) >= 0 && AnimElemTime(15) < 0
trigger1 = !(Target, HitShakeOver)
var(45) = 44
ignoreHitPause = 1
persistent = 0

[State 3000, Hit 6]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 + HitCount)
trigger1 = AnimElem = 15
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 2,2
guard.pauseTime = 2,2
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 22
ground.slideTime = 22
guard.hitTime = 22
air.hitTime = 120
ground.velocity = -2.5, -10
ground.cornerPush.velOff = 0
guard.velocity = -7.51
guard.cornerPush.velOff = 0
air.velocity = -2.5, -10
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 27), var(36) := -112
palFX.time = 46
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 3000, Flame Particle Timer Set]
type = VarSet
trigger1 = MoveHit = 1 && NumTarget && AnimElemTime(15) >= 0
trigger1 = !(Target, HitShakeOver)
var(45) = 46
ignoreHitPause = 1
persistent = 0

[State 3000, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(16) >= 0
moveType = I

[State 3000, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 1101



;========================<MAX SHORYUREPPA>=============================
[StateDef 3050]
type = S
physics = N
moveType = A
anim = 3050
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -2000
faceP2 = 1

[State 3050, Remove Shoryureppa fist overlay]
type = RemoveExplod
trigger1 = !Time && NumExplod(3004)
id = 3004
ignoreHitPause = 1

[State 3050, Remove Shoryureppa flames (ground)]
type = RemoveExplod
trigger1 = !Time && NumExplod(3005)
id = 3005
ignoreHitPause = 1

[State 3050, Remove Shoryureppa flames (ascending)]
type = RemoveExplod
trigger1 = !Time && NumExplod(3006)
id = 3006
ignoreHitPause = 1

[State 3050, Remove Shoryureppa flames (fade away)]
type = RemoveExplod
trigger1 = !Time && NumExplod(3007)
id = 3007
ignoreHitPause = 1

[State 3050, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000, 2999]) && var(7)) || var(20)

[State 3050, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3050, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3050, Corner Push]
type = VarSet
trigger1 = Time = 3
fvar(5) = 0

[State 3050, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 45

[State 3050, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3050, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3050, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(2) < 0
time = 1
value = SCA

[State 3050, Super Pause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = 10, -28
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3050, Super Pause]
type = SuperPause
trigger1 = Time = 3
time = 45
moveTime = 45
p2DefMul = 1
unHittable = 0
anim = -1
sound = s8500,0
darken = 0

[State 3050, Voice 1]
type = PlaySnd
trigger1 = !Time && var(40) != 1
value = 3000,0
channel = 0

[State 3050, Voice 1 (Violent)]
type = PlaySnd
trigger1 = !Time && var(40) = 1
value = 3100,10
channel = 0

[State 3050, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 2
value = 3000,1 + 9 * (var(40) = 1)
channel = 0

[State 3050, Dust Helper]
type = Helper
trigger1 = AnimElem = 2
helperType = Normal
stateNo = 8103
ID = 8100
name = "Shoryureppa Dust (Ground)"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 3050, Woosh sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1,2
channel = 1

[State 3050, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 5
value = 40,0
channel = 3

[State 3050, Landing Dust Explod]
type = Explod
trigger1 = AnimElem = 12
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3050, Landing Sound]
type = PlaySnd
trigger1 = AnimElem = 12
value = 52,0
channel = 4

[State 3050, Woosh sound]
type = PlaySnd
trigger1 = AnimElem = 13
value = 1,2
channel = 5

[State 3050, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 15
value = 40,0
channel = 7

[State 3050, Landing Dust Explod]
type = Explod
trigger1 = AnimElem = 22
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3050, Landing Sound]
type = PlaySnd
trigger1 = AnimElem = 22
value = 52,0
channel = 1

[State 3050, Woosh sound]
type = PlaySnd
trigger1 = AnimElem = 23
value = 1,2
channel = 3

[State 3050, Fire sound]
type = PlaySnd
trigger1 = AnimElem = 25
value = 1100,1
channel = 4

[State 3050, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 25
value = 40,0
channel = 5

[State 3050, Fist Overlay]
type = Explod
trigger1 = AnimElem = 24
ID = 3004
anim = 3054
bindTime = -1
sprPriority = 2
posType = P1
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3050, Shoryuken Flames (Ground)]
type = Explod
trigger1 = AnimElem = 22 && var(40) != 3
ID = 3005
anim = 1125
bindTime = 5
sprPriority = 3
posType = P1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3050, Shoryuken Flames (Ascending)]
type = Explod
trigger1 = AnimElem = 25 && var(40) != 3
ID = 3006
anim = 1126
bindTime = -1
removeTime = 21
sprPriority = 3
posType = P1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3050, Shoryuken Flames (Fade away)]
type = Explod
trigger1 = AnimElem = 29 && var(40) != 3
ID = 3007
anim = 1127
sprPriority = 3
posType = P1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3050, Shoryuken Flames (SFIII)]
type = Explod
trigger1 = AnimElem = 22 && var(40) = 3
ID = 3005
anim = 13055
bindTime = -1
sprPriority = 3
posType = P1
pos = 12,-28
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3050, ModifyExplod]
type = ModifyExplod
trigger1 = AnimElem = 23 && NumExplod(3005) && var(40) = 3
ID = 3005
posType = P1
pos = 21,-39
ignoreHitPause = 0

[State 3050, ModifyExplod]
type = ModifyExplod
trigger1 = AnimElem = 24 && NumExplod(3005) && var(40) = 3
ID = 3005
posType = P1
pos = 38,-82
ignoreHitPause = 0

[State 3050, ModifyExplod]
type = ModifyExplod
trigger1 = AnimElemTime(25) >= 0 && NumExplod(3005) && var(40) = 3
ID = 3005
posType = P1
pos = 14,-143
ignoreHitPause = 0

[State 3050, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x = 10

[State 3050, VelSet]
type = VelSet
trigger1 = AnimElem = 12
x = 8.75

[State 3050, VelSet]
type = VelSet
trigger1 = AnimElem = 22
x = 15

[State 3050, VelAdd]
type = VelAdd
triggerAll = vel x >= 0
trigger1 = AnimElemTime(2) > 0 && AnimElemTime(12) < 0
trigger2 = AnimElemTime(12) > 0 && AnimElemTime(22) < 0
trigger3 = AnimElemTime(22) > 0
x = -0.78125

[State 3050, VelSet]
type = VelSet
trigger1 = vel x < 0
x = 0

[State 3050, VelSet]
type = VelSet
trigger1 = AnimElemTime(25) = 0
y = -12.5

[State 3050, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(25) > 1
y = 0.5859375

[State 3050, Dust Helper]
type = Helper
trigger1 = AnimElemTime(25) = 0
helperType = Normal
stateNo = 8100
ID = 8100
name = "Shoryureppa Dust (Air)"
posType = P1
ownPal = 1

[State 3050, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 25
stateType = A
physics = N

[State 3050, Hit 1]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 3
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 49 < 7, 7, fvar(11) * 49)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 2,2
guard.pauseTime = 2,2
animType = Hard
air.animType = Hard
fall.animType = Hard
ground.type = Low
air.type = Low
ground.hitTime = 22
ground.slideTime = 22
guard.hitTime = 22
air.hitTime = 120
ground.velocity = -4.49,0
ground.cornerPush.velOff = 0
guard.velocity = -4.49
guard.cornerPush.velOff = 0
air.velocity = -2.5, -10
air.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 27), var(36) := -40
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3050, Hit 2]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 + HitCount)
trigger1 = AnimElem = 4
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 2,2
guard.pauseTime = 2,2
animType = Hard
air.animType = Hard
fall.animType = Hard
ground.type = Low
air.type = Low
ground.hitTime = 22
ground.slideTime = 22
guard.hitTime = 22
air.hitTime = 120
ground.velocity = -4.49,0
ground.cornerPush.velOff = 0
guard.velocity = -4.49
guard.cornerPush.velOff = 0
air.velocity = -2.5, -10
air.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 36), var(36) := -79
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3050, Hit 3]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 + HitCount)
trigger1 = AnimElem = 5
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 2,2
guard.pauseTime = 2,2
animType = Hard
air.animType = Hard
fall.animType = Hard
ground.type = High
air.type = Low
ground.hitTime = 22
ground.slideTime = 22
guard.hitTime = 22
air.hitTime = 120
ground.velocity = -4.49,0
ground.cornerPush.velOff = 0
guard.velocity = -4.49
guard.cornerPush.velOff = 0
air.velocity = -2.5, -10
air.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 27), var(36) := -112
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3050, Hit 4]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 + HitCount)
trigger1 = AnimElem = 13
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 2,2
guard.pauseTime = 2,2
animType = Hard
air.animType = Hard
fall.animType = Hard
ground.type = Low
air.type = Low
ground.hitTime = 22
ground.slideTime = 22
guard.hitTime = 22
air.hitTime = 120
ground.velocity = -4.49,0
ground.cornerPush.velOff = 0
guard.velocity = -4.49
guard.cornerPush.velOff = 0
air.velocity = -2.5, -10
air.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 27), var(36) := -40
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3050, Hit 5]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 + HitCount)
trigger1 = AnimElem = 14
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 2,2
guard.pauseTime = 2,2
animType = Hard
air.animType = Hard
fall.animType = Hard
ground.type = Low
air.type = Low
ground.hitTime = 22
ground.slideTime = 22
guard.hitTime = 22
air.hitTime = 120
ground.velocity = -4.49,0
ground.cornerPush.velOff = 0
guard.velocity = -4.49
guard.cornerPush.velOff = 0
air.velocity = -2.5, -10
air.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 36), var(36) := -79
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3050, Hit 6]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 + HitCount)
trigger1 = AnimElem = 15
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 2,2
guard.pauseTime = 2,2
animType = Hard
air.animType = Hard
fall.animType = Hard
ground.type = High
air.type = Low
ground.hitTime = 22
ground.slideTime = 22
guard.hitTime = 22
air.hitTime = 120
ground.velocity = -4.49,0
ground.cornerPush.velOff = 0
guard.velocity = -4.49
guard.cornerPush.velOff = 0
air.velocity = -2.5, -10
air.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 27), var(36) := -112
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3050, Hit 7]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 + HitCount)
trigger1 = AnimElem = 23
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 2,2
guard.pauseTime = 2,2
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 22
ground.slideTime = 22
guard.hitTime = 22
air.hitTime = 120
ground.velocity = -2.5, -10
ground.cornerPush.velOff = 0
guard.velocity = -7.51
guard.cornerPush.velOff = 0
air.velocity = -2.5, -10
air.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 27), var(36) := -40
palFX.time = 42
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 3050, Flame Particle Timer Set]
type = VarSet
trigger1 = MoveHit = 1 && NumTarget && AnimElemTime(24) < 0
trigger1 = !(Target, HitShakeOver)
var(45) = 42
ignoreHitPause = 1
persistent = 0

[State 3050, Flame Particles]
type = Helper
trigger1 = !NumHelper(8150) && AnimElemTime(23) >= 0
trigger1 = MoveHit = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
trigger1 = var(43) := (Target, ID)
helperType = Normal
stateNo = 8150
ID = 8150
name = "Flame Particles"
posType = P2
ownPal = 1
ignoreHitPause = 1

[State 3050, Hit 8]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 + HitCount)
trigger1 = AnimElem = 24
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 2,2
guard.pauseTime = 2,2
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 22
ground.slideTime = 22
guard.hitTime = 22
air.hitTime = 120
ground.velocity = -2.5, -10
ground.cornerPush.velOff = 0
guard.velocity = -7.51
guard.cornerPush.velOff = 0
air.velocity = -2.5, -10
air.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 36), var(36) := -79
palFX.time = 44
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 3050, Flame Particle Timer Set]
type = VarSet
trigger1 = MoveHit = 1 && NumTarget && AnimElemTime(24) >= 0 && AnimElemTime(25) < 0
trigger1 = !(Target, HitShakeOver)
var(45) = 44
ignoreHitPause = 1
persistent = 0

[State 3050, Hit 9]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 + HitCount)
trigger1 = AnimElem = 25
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 22
ground.slideTime = 22
guard.hitTime = 22
air.hitTime = 120
ground.velocity = -2.5, -10
ground.cornerPush.velOff = 0
guard.velocity = -7.51
guard.cornerPush.velOff = 0
air.velocity = -2.5, -10
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 27), var(36) := -112
palFX.time = 47
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 3050, Flame Particle Timer Set]
type = VarSet
trigger1 = MoveHit = 1 && NumTarget && AnimElemTime(25) >= 0 && AnimElemTime(26) < 0
trigger1 = !(Target, HitShakeOver)
var(45) = 47
ignoreHitPause = 1
persistent = 0

[State 3050, Hit 10]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 + HitCount)
trigger1 = AnimElem = 26
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 7 < 7, 7, fvar(11) * 7)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 22
ground.slideTime = 22
guard.hitTime = 22
air.hitTime = 120
ground.velocity = -2.5, -10
ground.cornerPush.velOff = 0
guard.velocity = -7.51
guard.cornerPush.velOff = 0
air.velocity = -2.5, -10
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 27), var(36) := -112
palFX.time = 49
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 3050, Flame Particle Timer Set]
type = VarSet
trigger1 = MoveHit = 1 && NumTarget && AnimElemTime(26) >= 0 && AnimElemTime(27) < 0
trigger1 = !(Target, HitShakeOver)
var(45) = 49
ignoreHitPause = 1
persistent = 0

[State 3050, Hit 11]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 + HitCount)
trigger1 = AnimElem = 27
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 7 < 7, 7, fvar(11) * 7)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 22
ground.slideTime = 22
guard.hitTime = 22
air.hitTime = 120
ground.velocity = -2.5, -10
ground.cornerPush.velOff = 0
guard.velocity = -7.51
guard.cornerPush.velOff = 0
air.velocity = -2.5, -10
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 27), var(36) := -112
palFX.time = 50
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 3050, Flame Particle Timer Set]
type = VarSet
trigger1 = MoveHit = 1 && NumTarget && AnimElemTime(27) >= 0 && AnimElemTime(28) < 0
trigger1 = !(Target, HitShakeOver)
var(45) = 50
ignoreHitPause = 1
persistent = 0

[State 3050, Hit 12]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 + HitCount)
trigger1 = AnimElem = 28
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 7 < 7, 7, fvar(11) * 7)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 22
ground.slideTime = 22
guard.hitTime = 22
air.hitTime = 120
ground.velocity = -2.5, -10
ground.cornerPush.velOff = 0
guard.velocity = -7.51
guard.cornerPush.velOff = 0
air.velocity = -2.5, -10
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 27), var(36) := -112
palFX.time = 51
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 3050, Flame Particle Timer Set]
type = VarSet
trigger1 = MoveHit = 1 && NumTarget && AnimElemTime(28) >= 0
trigger1 = !(Target, HitShakeOver)
var(45) = 51
ignoreHitPause = 1
persistent = 0

[State 3050, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(29) >= 0
moveType = I

[State 3050, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 1101



;========================<SHINRYUKEN>=============================
[StateDef 3100]
type = S
physics = N
moveType = A
anim = 3100
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -1000
faceP2 = 1

[State 3100, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000,2999]) && var(7)) || var(20)

[State 3100, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3100, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3100, Corner Push]
type = VarSet
trigger1 = Time = 3
fvar(5) = 0

[State 3100, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 43

[State 3100, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3100, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3100, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(5) < 0
time = 1
value = SCA

[State 3100, Super Pause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = 10,-27
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3100, SuperPause]
type = SuperPause
trigger1 = Time = 3
time = 43
moveTime = 43
p2DefMul = 1
unHittable = 0
anim = -1
sound = s8500,0
darken = 0

[State 3100, Voice 1]
type = PlaySnd
trigger1 = Time = 3
value = 3100,0 + 10 * (var(40) = 1)
channel = 0

[State 3100, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 5
value = 3100,1 + 10 * (var(40) = 1)
channel = 0

[State 3100, Woosh sound]
type = PlaySnd
trigger1 = AnimElem = 8
value = 1,2
channel = 1

[State 3100, Fire sound]
type = PlaySnd
trigger1 = AnimElem = 9 && var(40) = [1,2]
value = 3300,0
channel = 3

[State 3100, Jump Sound]
type = PlaySnd
trigger1 = AnimElemTime(9) = 2
value = 41,0
channel = 4

[State 3100, Shinryuken Flames (Air)]
type = Explod
trigger1 = AnimElem = 9 && var(40) = [1,2]
ID = 3305
anim = 3305
bindTime = -1
removetime = -1
sprPriority = 3
posType = P1
pos = 10, -144
scale = ifElse(var(40) = 2, 0.45, 0.35), 0.35
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3100, Dust Helper]
type = Helper
trigger1 = AnimElemTime(9) = 2
helperType = Normal
stateNo = 8100
ID = 8100
name = "Shinryuken Dust"
posType = P1
ownPal = 1

[State 3100, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 9
stateType = A
physics = N

[State 3100, VelSet]
type = VelSet
trigger1 = AnimElemTime(9) = 2
y = -8.75
persistent = 0

[State 3100, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(9) > 2
y = 0.5859375

[State 3100, Ground Hit 1]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 6
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Hard
air.animType = Hard
fall.animType = Hard
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 1.25
guard.cornerPush.velOff = 0
air.velocity = 1.25, -8.125
air.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 11), var(36) := -29
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3100, Ground Hit 2]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 + HitCount)
trigger1 = AnimElem = 7
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Hard
air.animType = Hard
fall.animType = Hard
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 1.25
guard.cornerPush.velOff = 0
air.velocity = 1.25, -8.125
air.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 27), var(36) := -40
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3100, Ground Hit 3]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 + HitCount)
trigger1 = AnimElem = 8
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Up
air.animType = Up
fall.animType = Up
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 1.25, -8.125
ground.cornerPush.velOff = 0
guard.velocity = 1.25
guard.cornerPush.velOff = 0
air.velocity = 1.25, -8.125
air.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 36), var(36) := -79
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3100, Mashing]
type = VarSet
trigger1 = !Time
var(42) = 0

[State 3100, Mashing]
type = VarSet
trigger1 = !Time
var(12) = 0

[State 3100, Mashing Flag]
type = VarSet
trigger1 = !Time
var(10) = 0

[State 3100, Mashing]
type = VarSet
triggerAll = var(42) = 0 && AnimElemTime(9) >= 2
trigger1 = !AILevel && (command = "a" || command = "b" || command = "c" || command = "x" || command = "y" || command = "z")
trigger2 = !AILevel && (command = "up" || command = "down" || command = "back" || command = "fwd")
trigger3 = AILevel
var(42) = 1

[State 3100, Mashing Increment]
type  = VarAdd
trigger1 = var(42) = 1
var(12) = 1

[State 3100, Mashing Decrement]
type = VarAdd
trigger1 = var(42) > 0
var(42) = -1

[State 3100, Mashing Flag]
type = VarSet
trigger1 = var(12) > 0
var(10) = 1

[State 3100, Anim Advance]
type = ChangeAnim
trigger1 = AnimElemTime(9) >= 2 && AnimElemTime(33) < 0 && vel y >= 0 && AnimElemTime(AnimElemNo(0)) = 0
value = 3100
elem = AnimElemNo(0) + ifElse(AnimElemTime(16) <= 0, 18, ifElse(AnimElemTime(22) <= 0, 12, 6)) - 1 * (AnimElem = 15 || AnimElem = 16 || AnimElem = 21 || AnimElem = 22)
persistent = 0

[State 3100, Anim Skip]
type = ChangeAnim
trigger1 = AnimElemTime(9) >= 2 && AnimElemTime(28) < 0
trigger1 = var(12) > 0
trigger1 = 1 || var(12) := 0
trigger2 = AnimElemTime(32) > 0 && AnimElemTime(33) < 0 && var(10)
value = 3100
elem = AnimElemNo(0) + 1

[State 3100, Spark XY]
type = Null
trigger1 = AnimElemTime(9) >= 0
trigger1 = var(35) := (12 + (Random % 25)) || var(36) := -70 - (Random % 41)

[State 3100, Air Hits]
type = HitDef
triggerAll = !var(16) && (var(15) < 1 + HitCount) && HitCount < 9
trigger1 = AnimElem = 9 || AnimElem = 10 || AnimElem = 11 || AnimElem = 12 || AnimElem = 13 || AnimElem = 14 || AnimElem = 15
trigger2 = AnimElem = 16 || AnimElem = 17 || AnimElem = 18 || AnimElem = 19 || AnimElem = 20 || AnimElem = 21 || AnimElem = 22
trigger3 = AnimElem = 23 || AnimElem = 24
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(HitCount > 4, 14, 21) < 7, 7, fvar(11) * ifElse(HitCount > 4, 14, 21))), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Up
air.animType = Up
fall.animType = Up
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 1.25, -8.125
ground.cornerPush.velOff = 0
guard.velocity = 1.25
guard.cornerPush.velOff = 0
air.velocity = 1.25, -8.125
air.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10, -55
palFX.time = ifElse((var(40) = [1,2]), 47, 12 * var(9))
palFX.add = ifElse((var(40) = [1,2]), 0, 255), ifElse((var(40) = [1,2]), 0, 255), ifElse((var(40) = [1,2]), 0, 255)
palFX.mul = ifElse((var(40) = [1,2]), 128, 256), ifElse((var(40) = [1,2]), 128, 256), ifElse((var(40) = [1,2]), 128, 256)
palFX.sinAdd = ifElse((var(40) = [1,2]), 96, -255), ifElse((var(40) = [1,2]), 96, -255), ifElse((var(40) = [1,2]), 96, -255), ifElse((var(40) = [1,2]), 4, 48)
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3100, Flame Particles]
type = Helper
trigger1 = !NumHelper(8150) && AnimElemTime(9) >= 0 && var(40) = [1,2]
trigger1 = MoveHit = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
trigger1 = var(43) := (Target, ID)
helperType = Normal
stateNo = 8150
ID = 8150
name = "Flame Particles"
posType = P2
ownPal = 1
ignoreHitPause = 1

[State 3100, Flame Particle Timer Set]
type = VarSet
trigger1 = MoveHit = 1 && NumTarget && AnimElemTime(9) >= 0 && var(40) = [1,2]
trigger1 = !(Target, HitShakeOver) && HitPauseTime = 4
var(45) = 47
ignoreHitPause = 1

[State 3100, Woosh sound]
type = PlaySnd
trigger1 = AnimElem = 11
trigger2 = AnimElem = 14
trigger3 = AnimElem = 17
trigger4 = AnimElem = 20
trigger5 = AnimElem = 23
trigger6 = AnimElem = 26
trigger7 = AnimElem = 29
trigger8 = AnimElem = 32
value = 1,2

[State 3100, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(25) >= 0
moveType = I

[State 3100, Shinryuken Flames (Fade Away)]
type = Explod
trigger1 = NumExplod(3305) && AnimElemTime(33) >= 0
anim = 3306
sprPriority = 3
posType = P1
pos = 10, -144
scale = ifElse(var(40) = 2, 0.45, 0.35), 0.35
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3100, RemoveExplod]
type = RemoveExplod
trigger1 = NumExplod(3305) && AnimElemTime(33) >= 0
id = 3305
ignoreHitPause = 1

[State 3100, Master Overlay]
type = Explod
trigger1 = AnimElem = 33 && var(40) = 2
ID = 3105
anim = 3105
bindTime = -1
removeTime = -1
sprPriority = 2
posType = P1
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3100, PalFX]
type = PalFX
trigger1 = AnimElemTime(33) >= -1 && var(40) = 2
time = 1
mul = 128,128,128

[State 3100, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 3101


;Landing
[StateDef 3101]
type = S
anim = ifElse(var(40) = 2, 3111, 3101)
physics = N
moveType = I
velSet = 0,0

[State 3101, RemoveExplod]
type = RemoveExplod
trigger1 = !Time
id = 3105
ignoreHitPause = 1

[State 3101, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 3101, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3101, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0
channel = 1

[State 3101, ChangeState]
type = ChangeState
trigger1 = WinKo && var(40) = 2
trigger1 = 1 || var(10) := Facing
value = 3120

[State 3101, Master Overlay]
type = Explod
trigger1 = !Time && var(40) = 2
anim = 3115
bindTime = -1
sprPriority = 2
posType = P1
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3100, PalFX]
type = PalFX
trigger1 = AnimTime <= -4 && var(40) = 2
time = 1
mul = 128,128,128

[State 3101, PalFX (Fade away)]
type = PalFX
trigger1 = AnimTime >= -5 && AnimTime < -1 && var(40) = 2
time = 1
mul = 128 + 32 * (AnimTime + 6), 128 + 32 * (AnimTime + 6), 128 + 32 * (AnimTime + 6)

[State 3101, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Win by Shinryuken (Master)
[StateDef 3120]
type = S
anim = 3120
physics = N
moveType = I
velSet = 0,0

[State 3120, Turn]
type = Turn
trigger1 = Facing != var(10)

[State 3120, Overlay]
type = Explod
trigger1 = !Time && PrevStateNo = 3101
anim = 3125
bindTime = -1
removeTime = -1
sprPriority = 2
posType = P1
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3120, PalFX]
type = PalFX
trigger1 = 1
time = 1
mul = 128,128,128

[State 3120, ChangeState]
type = ChangeState
trigger1 = PrevStateNo = 3101
value = 180
ctrl = 1



;========================<MAX SHINRYUKEN>=============================
[StateDef 3150]
type = S
physics = N
moveType = A
anim = 3150
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -2000
faceP2 = 1

[State 3150, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000,2999]) && var(7)) || var(20)

[State 3150, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3150, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3150, Corner Push]
type = VarSet
trigger1 = Time = 3
fvar(5) = 0

[State 3150, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 45

[State 3150, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3150, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3150, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(5) < 0
time = 1
value = SCA

[State 3150, Super Pause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = 10,-27
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3150, Super Pause]
type = SuperPause
trigger1 = Time = 3
time = 45
moveTime = 45
p2DefMul = 1
unHittable = 0
anim = -1
sound = s8500,0
darken = 0

[State 3150, Voice 1]
type = PlaySnd
trigger1 = Time = 3
value = 3100,0 + 10 * (var(40) = 1)
channel = 0

[State 3150, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 5
value = 3100,1 + 10 * (var(40) = 1)
channel = 0

[State 3150, Woosh sound]
type = PlaySnd
trigger1 = AnimElem = 8
value = 1,2
channel = 1

[State 3150, Fire sound]
type = PlaySnd
trigger1 = AnimElem = 9 && var(40) = [1,2]
value = 3300,0
channel = 3

[State 3150, Jump Sound]
type = PlaySnd
trigger1 = AnimElemTime(9) = 2
value = 41,0
channel = 4

[State 3150, Shinryuken Flames (Air)]
type = Explod
trigger1 = AnimElem = 9 && var(40) = [1,2]
ID = 3305
anim = 3305
bindTime = -1
removetime = -1
sprPriority = 3
posType = P1
pos = 10, -144
scale = ifElse(var(40) = 2, 0.45, 0.35), 0.35
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3150, Dust Helper]
type = Helper
trigger1 = AnimElemTime(9) = 2
helperType = Normal
stateNo = 8100
ID = 8100
name = "Shinryuken Dust"
posType = P1
ownPal = 1

[State 3150, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 9
stateType = A
physics = N

[State 3150, VelSet]
type = VelSet
trigger1 = AnimElemTime(9) = 2
y = -11.25
persistent = 0

[State 3150, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(9) > 2
y = 0.5859375

[State 3150, Ground Hit 1]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 6
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 49 < 7, 7, fvar(11) * 49)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Hard
air.animType = Hard
fall.animType = Hard
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 1.25
guard.cornerPush.velOff = 0
air.velocity = 1.25, -8.125
air.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 11), var(36) := -29
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3150, Ground Hit 2]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 + HitCount)
trigger1 = AnimElem = 7
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Hard
air.animType = Hard
fall.animType = Hard
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 1.25
guard.cornerPush.velOff = 0
air.velocity = 1.25, -8.125
air.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 27), var(36) := -40
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3150, Ground Hit 3]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 + HitCount)
trigger1 = AnimElem = 8
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Up
air.animType = Up
fall.animType = Up
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 1.25, -8.125
ground.cornerPush.velOff = 0
guard.velocity = 1.25
guard.cornerPush.velOff = 0
air.velocity = 1.25, -8.125
air.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 36), var(36) := -79
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3150, Mashing]
type = VarSet
trigger1 = !Time
var(42) = 0

[State 3150, Mashing]
type = VarSet
trigger1 = !Time
var(12) = 0

[State 3150, Mashing Flag]
type = VarSet
trigger1 = !Time
var(10) = 0

[State 3150, Mashing]
type = VarSet
triggerAll = var(42) = 0 && AnimElemTime(9) >= 2
trigger1 = !AILevel && (command = "a" || command = "b" || command = "c" || command = "x" || command = "y" || command = "z")
trigger2 = !AILevel && (command = "up" || command = "down" || command = "back" || command = "fwd")
trigger3 = AILevel
var(42) = 1

[State 3150, Mashing Increment]
type  = VarAdd
trigger1 = var(42) = 1
var(12) = 1

[State 3150, Mashing Decrement]
type = VarAdd
trigger1 = var(42) > 0
var(42) = -1

[State 3150, Mashing Flag]
type = VarSet
trigger1 = var(12) > 0
var(10) = 1

[State 3150, Anim Advance]
type = ChangeAnim
trigger1 = AnimElemTime(9) >= 2 && AnimElemTime(33) < 0 && vel y >= 0 && AnimElemTime(AnimElemNo(0)) = 0
value = 3150
elem = 33
persistent = 0

[State 3150, Anim Skip]
type = ChangeAnim
trigger1 = AnimElemTime(9) >= 2 && AnimElemTime(33) < 0
trigger1 = var(12) > 0
trigger1 = 1 || var(12) := 0
value = 3150
elem = AnimElemNo(0) + 1

[State 3150, Spark XY]
type = Null
trigger1 = AnimElemTime(9) >= 0
trigger1 = var(35) := (12 + (Random % 25)) || var(36) := -70 - (Random % 41)

[State 3150, Air Hits]
type = HitDef
triggerAll = !var(16) && (var(15) < 1 + HitCount) && HitCount < (9 + 8 * var(10))
trigger1 = AnimElem = 9 || AnimElem = 10 || AnimElem = 11 || AnimElem = 12 || AnimElem = 13 || AnimElem = 14 || AnimElem = 15
trigger2 = AnimElem = 16 || AnimElem = 17 || AnimElem = 18 || AnimElem = 19 || AnimElem = 20 || AnimElem = 21 || AnimElem = 22
trigger3 = AnimElem = 23 || AnimElem = 24 || AnimElem = 25 || AnimElem = 26 || AnimElem = 27 || AnimElem = 28 || AnimElem = 29
trigger4 = AnimElem = 30 || AnimElem = 31 || AnimElem = 32
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(HitCount > 11, 7, ifElse(HitCount > 5, 14, 21)) < 7, 7, fvar(11) * ifElse(HitCount > 11, 7, ifElse(HitCount > 5, 14, 21)))), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Up
air.animType = Up
fall.animType = Up
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 1.25, -8.125
ground.cornerPush.velOff = 0
guard.velocity = 1.25
guard.cornerPush.velOff = 0
air.velocity = 1.25, -8.125
air.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10, -55
palFX.time = ifElse((var(40) = [1,2]), 47, 12 * var(9))
palFX.add = ifElse((var(40) = [1,2]), 0, 255), ifElse((var(40) = [1,2]), 0, 255), ifElse((var(40) = [1,2]), 0, 255)
palFX.mul = ifElse((var(40) = [1,2]), 128, 256), ifElse((var(40) = [1,2]), 128, 256), ifElse((var(40) = [1,2]), 128, 256)
palFX.sinAdd = ifElse((var(40) = [1,2]), 96, -255), ifElse((var(40) = [1,2]), 96, -255), ifElse((var(40) = [1,2]), 96, -255), ifElse((var(40) = [1,2]), 4, 48)
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3150, Flame Particles]
type = Helper
trigger1 = !NumHelper(8150) && AnimElemTime(9) >= 0 && var(40) = [1,2]
trigger1 = MoveHit = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
trigger1 = var(43) := (Target, ID)
helperType = Normal
stateNo = 8150
ID = 8150
name = "Flame Particles"
posType = P2
ownPal = 1
ignoreHitPause = 1

[State 3150, Flame Particle Timer Set]
type = VarSet
trigger1 = MoveHit = 1 && NumTarget && AnimElemTime(9) >= 0 && var(40) = [1,2]
trigger1 = !(Target, HitShakeOver) && HitPauseTime = 4
var(45) = 47
ignoreHitPause = 1

[State 3150, Woosh sound]
type = PlaySnd
trigger1 = AnimElem = 11
trigger2 = AnimElem = 14
trigger3 = AnimElem = 17
trigger4 = AnimElem = 20
trigger5 = AnimElem = 23
trigger6 = AnimElem = 26
trigger7 = AnimElem = 29
trigger8 = AnimElem = 32
value = 1,2

[State 3150, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(33) >= 0
moveType = I

[State 3150, Shinryuken Flames (Fade Away)]
type = Explod
trigger1 = NumExplod(3305) && AnimElemTime(33) >= 0
anim = 3306
sprPriority = 3
posType = P1
pos = 10, -144
scale = ifElse(var(40) = 2, 0.45, 0.35), 0.35
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3150, RemoveExplod]
type = RemoveExplod
trigger1 = NumExplod(3305) && AnimElemTime(33) >= 0
id = 3305
ignoreHitPause = 1

[State 3150, Master Overlay]
type = Explod
trigger1 = AnimElem = 33 && var(40) = 2
ID = 3105
anim = 3105
bindTime = -1
removeTime = -1
sprPriority = 2
posType = P1
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3150, PalFX]
type = PalFX
trigger1 = AnimElemTime(33) >= -1 && var(40) = 2
time = 1
mul = 128,128,128

[State 3150, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 3101



;========================<SHIPPU JINRAIKYAKU>=============================
[StateDef 3200]
type = S
physics = N
moveType = A
anim = 3200
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -1000
faceP2 = 1

[State 3200, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000, 2999]) && var(7)) || var(20)

[State 3200, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3200, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3200, Corner Push]
type = VarSet
trigger1 = Time = 3
fvar(5) = 0

[State 3200, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 43

[State 3200, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3200, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3200, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(4) < 0
time = 1
value = SCA

[State 3200, Super Pause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = -8, -26
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3200, Super Pause]
type = SuperPause
trigger1 = Time = 3
time = 43
moveTime = 43
p2DefMul = 1
unHittable = 0
anim = -1
sound = s8500,0
darken = 0

[State 3200, Width]
type = Width
trigger1 = AnimElemTime(41) < 0
edge = 64,0
ignoreHitPause = 1

[State 3200, Voice 1]
type = PlaySnd
trigger1 = !Time && var(40) != 1
value = 1300,0
channel = 0

[State 3200, Voice 1 (Violent)]
type = PlaySnd
trigger1 = !Time && var(40) = 1
value = 1600,0
channel = 0

[State 3200, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 2
value = 3200,0 + 10 * (var(40) = 1)
channel = 0

[State 3200, Woosh sound]
type = PlaySnd
trigger1 = AnimElem = 3
trigger2 = AnimElem = 13
trigger3 = AnimElem = 24
trigger4 = AnimElem = 35
value = 1,5

[State 3200, PosAdd]
type = PosAdd
trigger1 = AnimElem = 11
trigger2 = AnimElem = 20
trigger3 = AnimElem = 30
x = 28

[State 3200, PosAdd]
type = PosAdd
trigger1 = AnimElem = 41
x = 8

[State 3200, Dust Helper]
type = Helper
trigger1 = AnimElem = 2
helperType = Normal
stateNo = 8103
ID = 8100
name = "Shippu Jinraikyaku Dust (Ground)"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 3200, Push Helper]
type = Helper
trigger1 = AnimElem = 2
helperType = Normal
stateNo = 13200
ID = 13200
name = "Shippu Jinraikyaku Pushbox"
posType = P1
size.ground.back = 32
size.ground.front = 48
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 3200, Hit 1]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 4
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 34
ground.slideTime = 34
guard.hitTime = 34
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -5 + 1, -6.5625/2.5
air.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 75), var(36) := -106
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3200, Hit 2]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 14
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 34
ground.slideTime = 34
guard.hitTime = 34
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -5 + 1, -6.5625/2.5
air.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 93), var(36) := -56
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3200, Hit 3]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 25
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 34
ground.slideTime = 34
guard.hitTime = 34
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -5 + 1, -6.5625/2.5
air.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 82), var(36) := -102
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3200, Hit 4]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 36
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 34
ground.slideTime = 34
guard.hitTime = 34
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -5 + 1, -6.5625/2.5
air.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 102), var(36) := -61
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3200, Woosh sound]
type = PlaySnd
trigger1 = AnimElem = 41
trigger2 = AnimElem = 45 || AnimElem = 48 || AnimElem = 51 || AnimElem = 54
trigger3 = AnimElem = 57 || AnimElem = 60 || AnimElem = 63 || AnimElem = 66
trigger4 = AnimElem = 69
value = 1,5

[State 3200, Jump sound]
type = PlaySnd
trigger1 = AnimElem = 41
value = 40,0
channel = 1

[State 3200, Dust Helper]
type = Helper
trigger1 = AnimElem = 41
helperType = Normal
stateNo = 8100
ID = 8100
name = "Shippu Jinraikyaku Dust (Air)"
posType = P1
ownPal = 1

[State 3200, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 41
stateType = A
physics = N

[State 3200, VelSet]
type = VelSet
trigger1 = AnimElemTime(41) = 1
x = 5.5

[State 3200, VelSet]
type = VelSet
trigger1 = AnimElem = 45
y = -5.375

[State 3200, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(45) > 0 && vel x >= 0
x = -0.48828125

[State 3200, VelSet]
type = VelSet
trigger1 = vel x < 0
x = 0

[State 3200, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(45) > 0
y = 0.29296875

[State 3200, Hit 5]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 41
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 8,8
guard.pauseTime = 8,8
animType = Up
air.animType = Up
fall.animType = Up
ground.type = High
air.type = Low
ground.hitTime = 34
ground.slideTime = 34
guard.hitTime = 34
air.hitTime = 120
ground.velocity = -3.5, -6
ground.cornerPush.velOff = 0
guard.velocity = -3.5
guard.cornerPush.velOff = 0
air.velocity = -3.5, -6
air.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 27), var(36) := -68
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3200, Air Hits (Opponent in front)]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 46
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 2,2
guard.pauseTime = 2,2
animType = Up
air.animType = Up
fall.animType = Up
ground.type = High
air.type = Low
ground.hitTime = 16
ground.slideTime = 16
guard.hitTime = 16
air.hitTime = 120
ground.velocity = -3.5, -5.90625
ground.cornerPush.velOff = 0
guard.velocity = -3.5
guard.cornerPush.velOff = 0
air.velocity = -3.5, -5.90625
air.cornerPush.velOff = 0
yAccel = 0.4375
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 60), var(36) := -71
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3200, Air Hits (Opponent in back)]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 49
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 2,2
guard.pauseTime = 2,2
animType = Up
air.animType = Up
fall.animType = Up
ground.type = High
air.type = Low
ground.hitTime = 16
ground.slideTime = 16
guard.hitTime = 16
air.hitTime = 120
ground.velocity = 3.5, -5.90625
ground.cornerPush.velOff = 0
guard.velocity = 3.5
guard.cornerPush.velOff = 0
air.velocity = 3.5, -5.90625
air.cornerPush.velOff = 0
yAccel = 0.4375
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := -45), var(36) := -71
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3200, Final Hit (Opponent in front)]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 52
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 6,6
guard.pauseTime = 6,6
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 16
ground.slideTime = 16
guard.hitTime = 16
air.hitTime = 120
ground.velocity = -5,-11.4375
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -5, -11.4375
air.cornerPush.velOff = 0
yAccel = 0.875
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 60), var(36) := -71
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3200, Final Hit (Opponent in back)]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 55
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 6,6
guard.pauseTime = 6,6
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 16
ground.slideTime = 16
guard.hitTime = 16
air.hitTime = 120
ground.velocity = 5,-11.4375
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = 5, -11.4375
air.cornerPush.velOff = 0
yAccel = 0.875
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := -45), var(36) := -71
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3200, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(56) >= 0
moveType = I

[State 3200, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 1205



;========================<SFIII SHIPPU JINRAIKYAKU>=============================
[StateDef 3210]
type = S
physics = N
moveType = A
anim = 3210
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -1000
faceP2 = 1

[State 3210, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000, 2999]) && var(7)) || var(20)

[State 3210, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3210, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3210, Corner Push]
type = VarSet
trigger1 = Time = 3
fvar(5) = 0

[State 3210, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 43

[State 3210, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3210, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3210, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(5) < 0
time = 1
value = SCA

[State 3210, Super Pause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = 25, -66
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3210, Super Pause]
type = SuperPause
trigger1 = Time = 3
time = 43
moveTime = 43
p2DefMul = 1
unHittable = 0
anim = -1
sound = s8500,0
darken = 0

[State 3210, Width]
type = Width
trigger1 = 1
edge = 64,0
ignoreHitPause = 1

[State 3210, Voice 1]
type = PlaySnd
trigger1 = !Time
value = 3210,0
channel = 0

[State 3210, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 14
value = 3210,1
channel = 0

[State 3210, Voice 3]
type = PlaySnd
trigger1 = AnimElem = 24
trigger2 = AnimElem = 34
trigger3 = AnimElem = 43
value = 3210,2
channel = 0

[State 3210, Woosh sound]
type = PlaySnd
trigger1 = AnimElem = 5
trigger2 = AnimElem = 14
trigger3 = AnimElem = 24
trigger4 = AnimElem = 34
trigger5 = AnimElem = 43
value = 1,5

[State 3210, PosAdd]
type = PosAdd
trigger1 = !Time
x = 12

[State 3210, PosAdd]
type = PosAdd
trigger1 = AnimElem = 2
x = 4

[State 3210, PosAdd]
type = PosAdd
trigger1 = AnimElem = 5
x = 16

[State 3210, VelSet]
type = VelSet
trigger1 = AnimElemTime(5) = 1
x = 5.043478260869565

[State 3210, VelSet]
type = VelSet
trigger1 = AnimElem = 44
x = 0

[State 3210, Dust Helper]
type = Helper
trigger1 = AnimElem = 5
helperType = Normal
stateNo = 8103
ID = 8100
name = "Shippu Jinraikyaku Dust (Ground)"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 3210, Push Helper]
type = Helper
trigger1 = AnimElem = 5
helperType = Normal
stateNo = 13200
ID = 13200
name = "Shippu Jinraikyaku Pushbox"
posType = P1
size.ground.back = 32
size.ground.front = 48
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 3210, Hit 1]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 6
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 6,6
guard.pauseTime = 6,6
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 20
ground.slideTime = 20
guard.hitTime = 20
air.hitTime = 120
ground.velocity = 4.49,0
ground.cornerPush.velOff = 0
guard.velocity = 4.49
guard.cornerPush.velOff = 0
air.velocity = -7, -7.75
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 93), var(36) := -56
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3210, Hit 2]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 15
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 20
ground.slideTime = 20
guard.hitTime = 20
air.hitTime = 120
ground.velocity = -10.52,0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -7, -7.75
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 75), var(36) := -106
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3210, Hit 3]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 25
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 20
ground.slideTime = 20
guard.hitTime = 20
air.hitTime = 120
ground.velocity = -10.52,0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -7, -7.75
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 75), var(36) := -106
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3210, Hit 4]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 36
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 6,6
guard.pauseTime = 6,6
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 20
ground.slideTime = 20
guard.hitTime = 20
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -7, -7.75
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 93), var(36) := -56
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3210, Hit 5]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 44
ID = 3210
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 6,8
guard.pauseTime = 8,8
animType = Up
air.animType = Up
fall.animType = Up
ground.type = High
air.type = Low
ground.hitTime = 20
ground.slideTime = 20
guard.hitTime = 20
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -7, -7.75
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 66), var(36) := -81
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3210, ChangeAnimElem]
type = ChangeAnim
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = AnimElemTime(44) >= 0 && AnimElemTime(45) <= 0
trigger1 = HitPauseTime <= 6
value = 3210
elem = 45
ignoreHitPause = 1

[State 3210, ChangeState]
type = ChangeState
trigger1 = NumTarget(3210)
trigger1 = MoveHit
value = 3211

[State 3210, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(45) >= 0
moveType = I

[State 3210, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Finish
[StateDef 3211]
type = S
anim = 3211
physics = N
moveType = A
velSet = 0,0
hitCountPersist = 1

[State 3211, Jump sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 40,0
channel = 1

[State 3211, Woosh sound]
type = PlaySnd
trigger1 = AnimElem = 4 || AnimElem = 7 || AnimElem = 10 || AnimElem = 13
trigger2 = AnimElem = 16 || AnimElem = 19
value = 1,5

[State 3211, Dust Helper]
type = Helper
trigger1 = AnimElem = 4
helperType = Normal
stateNo = 8100
ID = 8100
name = "Shippu Jinraikyaku Dust (Air)"
posType = P1
ownPal = 1

[State 3211, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 4
stateType = A
physics = N

[State 3211, VelSet]
type = VelSet
trigger1 = AnimElem = 4
y = -5.5

[State 3211, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(4) > 0 && AnimElemTime(12) < 0
y = 0.125

[State 3211, VelSet]
type = VelSet
trigger1 = AnimElem = 12
y = 0

[State 3211, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(12) > 0
y = 0.25

[State 3211, HitDef (Opponent in front)]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 5
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 2,2
guard.pauseTime = 2,2
animType = Up
air.animType = Up
fall.animType = Up
ground.type = High
air.type = Low
ground.hitTime = 16
ground.slideTime = 16
guard.hitTime = 16
air.hitTime = 120
ground.velocity = 0,-5.90625
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = 0, -5.90625
air.cornerPush.velOff = 0
yAccel = 0.4375
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 60), var(36) := -71
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3211, HitDef (Opponent in back)]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 8
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 2,2
guard.pauseTime = 2,2
animType = Up
air.animType = Up
fall.animType = Up
ground.type = High
air.type = Low
ground.hitTime = 16
ground.slideTime = 16
guard.hitTime = 16
air.hitTime = 120
ground.velocity = 0,-5.90625
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = 0, -5.90625
air.cornerPush.velOff = 0
yAccel = 0.4375
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := -45), var(36) := -71
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3211, Final Hit (Opponent in front)]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 11
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 6,6
guard.pauseTime = 6,6
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 16
ground.slideTime = 16
guard.hitTime = 16
air.hitTime = 120
ground.velocity = -5,-10.4375
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -5, -10.4375
air.cornerPush.velOff = 0
yAccel = 0.875
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 60), var(36) := -71
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3211, Final Hit (Opponent in back)]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 14
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 6,6
guard.pauseTime = 6,6
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 16
ground.slideTime = 16
guard.hitTime = 16
air.hitTime = 120
ground.velocity = 5,-10.4375
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = 5, -10.4375
air.cornerPush.velOff = 0
yAccel = 0.875
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := -45), var(36) := -71
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3211, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(15) >= 0
moveType = I

[State 3211, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 1215



;========================<MAX SHIPPU JINRAIKYAKU>=============================
[StateDef 3250]
type = S
physics = N
moveType = A
anim = 3250
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -2000
faceP2 = 1

[State 3250, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000, 2999]) && var(7)) || var(20)

[State 3250, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3250, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3250, Corner Push]
type = VarSet
trigger1 = Time = 3
fvar(5) = 0

[State 3250, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 45

[State 3250, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3250, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3250, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(4) < 0
time = 1
value = SCA

[State 3250, Super Pause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = -8, -26
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3250, Super Pause]
type = SuperPause
trigger1 = Time = 3
time = 45
moveTime = 45
p2DefMul = 1
unHittable = 0
anim = -1
sound = s8500,0
darken = 0

[State 3250, Width]
type = Width
trigger1 = AnimElemTime(41) < 0
edge = 64,0
ignoreHitPause = 1

[State 3250, Voice 1]
type = PlaySnd
trigger1 = !Time
value = 1300,0
channel = 0

[State 3250, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 2
value = 3200,0
channel = 0

[State 3250, Woosh sound]
type = PlaySnd
trigger1 = AnimElem = 3
trigger2 = AnimElem = 13
trigger3 = AnimElem = 24
trigger4 = AnimElem = 35
value = 1,5

[State 3250, PosAdd]
type = PosAdd
trigger1 = AnimElem = 11
trigger2 = AnimElem = 20
trigger3 = AnimElem = 30
x = 28

[State 3250, PosAdd]
type = PosAdd
trigger1 = AnimElem = 41
x = 8

[State 3250, Dust Helper]
type = Helper
trigger1 = AnimElem = 2
helperType = Normal
stateNo = 8103
ID = 8100
name = "Shippu Jinraikyaku Dust (Ground)"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 3250, Push Helper]
type = Helper
trigger1 = AnimElem = 2
helperType = Normal
stateNo = 13200
ID = 13200
name = "Shippu Jinraikyaku Pushbox"
posType = P1
size.ground.back = 32
size.ground.front = 48
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 3250, Hit 1]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 4
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 34
ground.slideTime = 34
guard.hitTime = 34
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -5 + 1, -6.5625/2.5
air.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 75), var(36) := -106
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3250, Hit 2]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 14
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 34
ground.slideTime = 34
guard.hitTime = 34
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -5 + 1, -6.5625/2.5
air.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 93), var(36) := -56
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3250, Hit 3]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 25
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 34
ground.slideTime = 34
guard.hitTime = 34
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -5 + 1, -6.5625/2.5
air.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 82), var(36) := -102
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3250, Hit 4]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 36
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 34
ground.slideTime = 34
guard.hitTime = 34
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -5 + 1, -6.5625/2.5
air.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 102), var(36) := -61
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3250, Woosh sound]
type = PlaySnd
trigger1 = AnimElem = 41
trigger2 = AnimElem = 45 || AnimElem = 48 || AnimElem = 51 || AnimElem = 54
trigger3 = AnimElem = 57 || AnimElem = 60 || AnimElem = 63 || AnimElem = 66
trigger4 = AnimElem = 69 || AnimElem = 72 || AnimElem = 75 || AnimElem = 78
trigger5 = AnimElem = 81
value = 1,5

[State 3250, Jump sound]
type = PlaySnd
trigger1 = AnimElem = 41
value = 40,0
channel = 1

[State 3250, Dust Helper]
type = Helper
trigger1 = AnimElem = 41
helperType = Normal
stateNo = 8100
ID = 8100
name = "Shippu Jinraikyaku Dust (Air)"
posType = P1
ownPal = 1

[State 3250, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 41
stateType = A
physics = N

[State 3250, VelSet]
type = VelSet
trigger1 = AnimElemTime(41) = 1
x = 7.5

[State 3250, VelSet]
type = VelSet
trigger1 = AnimElem = 45
y = -9.375 / 1.25

[State 3250, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(45) > 0 && vel x >= 0
x = -0.48828125

[State 3250, VelSet]
type = VelSet
trigger1 = vel x < 0
x = 0

[State 3250, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(45) > 0 && AnimElemTime(64) < 0
y = 0.29296875 / 1.25

[State 3250, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(64) >= 0
y = 0.341796875 / 1.25

[State 3250, Hit 5]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 41
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 8,8
guard.pauseTime = 8,8
animType = Up
air.animType = Up
fall.animType = Up
ground.type = High
air.type = Low
ground.hitTime = 34
ground.slideTime = 34
guard.hitTime = 34
air.hitTime = 120
ground.velocity = -3.5, -10
ground.cornerPush.velOff = 0
guard.velocity = -3.5
guard.cornerPush.velOff = 0
air.velocity = -3.5, -6.5625;-10
air.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 27), var(36) := -68
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3250, Air Hits (Opponent in front)]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 46 || AnimElem = 52 || AnimElem = 58
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 2,2
guard.pauseTime = 2,2
animType = Up
air.animType = Up
fall.animType = Up
ground.type = High
air.type = Low
ground.hitTime = 16
ground.slideTime = 16
guard.hitTime = 16
air.hitTime = 120
ground.velocity = -3.5, -5.90625
ground.cornerPush.velOff = 0
guard.velocity = -3.5
guard.cornerPush.velOff = 0
air.velocity = -3.5, -5.90625
air.cornerPush.velOff = 0
yAccel = 0.4375
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 60), var(36) := -71
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3250, Air Hits (Opponent in back)]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 49 || AnimElem = 55 || AnimElem = 61
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 2,2
guard.pauseTime = 2,2
animType = Up
air.animType = Up
fall.animType = Up
ground.type = High
air.type = Low
ground.hitTime = 16
ground.slideTime = 16
guard.hitTime = 16
air.hitTime = 120
ground.velocity = 3.5, -5.90625
ground.cornerPush.velOff = 0
guard.velocity = 3.5
guard.cornerPush.velOff = 0
air.velocity = 3.5, -5.90625
air.cornerPush.velOff = 0
yAccel = 0.4375
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := -45), var(36) := -71
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3250, Final Hit (Opponent in front)]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 64
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 6,6
guard.pauseTime = 6,6
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 16
ground.slideTime = 16
guard.hitTime = 16
air.hitTime = 120
ground.velocity = -5,-14.4375
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -5, -14.4375
air.cornerPush.velOff = 0
yAccel = 0.875
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 60), var(36) := -71
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3250, Final Hit (Opponent in back)]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 67
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 6,6
guard.pauseTime = 6,6
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 16
ground.slideTime = 16
guard.hitTime = 16
air.hitTime = 120
ground.velocity = 5,-14.4375
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = 5, -14.4375
air.cornerPush.velOff = 0
yAccel = 0.875
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := -45), var(36) := -71
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3250, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(68) >= 0
moveType = I

[State 3250, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 1205



;========================<MAX SFIII SHIPPU JINRAIKYAKU>=============================
[StateDef 3260]
type = S
physics = N
moveType = A
anim = 3210
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -2000
faceP2 = 1

[State 3260, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000, 2999]) && var(7)) || var(20)

[State 3260, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3260, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3260, Corner Push]
type = VarSet
trigger1 = Time = 3
fvar(5) = 0

[State 3260, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 45

[State 3260, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3260, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3260, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(5) < 0
time = 1
value = SCA

[State 3260, Super Pause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = 25, -66
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3260, Super Pause]
type = SuperPause
trigger1 = Time = 3
time = 45
moveTime = 45
p2DefMul = 1
unHittable = 0
anim = -1
sound = s8500,0
darken = 0

[State 3260, Width]
type = Width
trigger1 = 1
edge = 64,0
ignoreHitPause = 1

[State 3260, Voice 1]
type = PlaySnd
trigger1 = !Time
value = 3210,0
channel = 0

[State 3260, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 14
value = 3210,1
channel = 0

[State 3260, Voice 3]
type = PlaySnd
trigger1 = AnimElem = 24
trigger2 = AnimElem = 34
trigger3 = AnimElem = 43
value = 3210,2
channel = 0

[State 3260, Woosh sound]
type = PlaySnd
trigger1 = AnimElem = 5
trigger2 = AnimElem = 14
trigger3 = AnimElem = 24
trigger4 = AnimElem = 34
trigger5 = AnimElem = 43
value = 1,5

[State 3260, PosAdd]
type = PosAdd
trigger1 = !Time
x = 12

[State 3260, PosAdd]
type = PosAdd
trigger1 = AnimElem = 2
x = 4

[State 3260, PosAdd]
type = PosAdd
trigger1 = AnimElem = 5
x = 16

[State 3260, VelSet]
type = VelSet
trigger1 = AnimElemTime(5) = 1
x = 5.043478260869565

[State 3260, VelSet]
type = VelSet
trigger1 = AnimElem = 44
x = 0

[State 3260, Dust Helper]
type = Helper
trigger1 = AnimElem = 5
helperType = Normal
stateNo = 8103
ID = 8100
name = "Shippu Jinraikyaku Dust (Ground)"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 3260, Push Helper]
type = Helper
trigger1 = AnimElem = 5
helperType = Normal
stateNo = 13200
ID = 13200
name = "Shippu Jinraikyaku Pushbox"
posType = P1
size.ground.back = 32
size.ground.front = 48
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 3260, Hit 1]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 6
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 6,6
guard.pauseTime = 6,6
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 20
ground.slideTime = 20
guard.hitTime = 20
air.hitTime = 120
ground.velocity = 4.49,0
ground.cornerPush.velOff = 0
guard.velocity = 4.49
guard.cornerPush.velOff = 0
air.velocity = -7, -7.75
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 93), var(36) := -56
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3260, Hit 2]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 15
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 20
ground.slideTime = 20
guard.hitTime = 20
air.hitTime = 120
ground.velocity = -10.52,0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -7, -7.75
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 75), var(36) := -106
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3260, Hit 3]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 25
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 20
ground.slideTime = 20
guard.hitTime = 20
air.hitTime = 120
ground.velocity = -10.52,0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -7, -7.75
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 75), var(36) := -106
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3260, Hit 4]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 36
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 6,6
guard.pauseTime = 6,6
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 20
ground.slideTime = 20
guard.hitTime = 20
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -7, -7.75
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 93), var(36) := -56
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3260, Hit 5]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 44
ID = 3260
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 6,8
guard.pauseTime = 8,8
animType = Up
air.animType = Up
fall.animType = Up
ground.type = High
air.type = Low
ground.hitTime = 20
ground.slideTime = 20
guard.hitTime = 20
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -7, -7.75
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 66), var(36) := -81
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3260, ChangeAnimElem]
type = ChangeAnim
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = AnimElemTime(44) >= 0 && AnimElemTime(45) <= 0
trigger1 = HitPauseTime <= 6
value = 3210
elem = 45
ignoreHitPause = 1

[State 3260, ChangeState]
type = ChangeState
trigger1 = NumTarget(3260)
trigger1 = MoveHit
value = 3261

[State 3260, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(45) >= 0
moveType = I

[State 3260, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Finish
[StateDef 3261]
type = S
anim = 3261
physics = N
moveType = A
velSet = 0,0
hitCountPersist = 1

[State 3261, Jump sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 40,0
channel = 1

[State 3261, Woosh sound]
type = PlaySnd
trigger1 = AnimElem = 4 || AnimElem = 7 || AnimElem = 10 || AnimElem = 13
trigger2 = AnimElem = 16 || AnimElem = 19 || AnimElem = 22 || AnimElem = 22
trigger3 = AnimElem = 25 || AnimElem = 28 || AnimElem = 31 || AnimElem = 34
trigger4 = AnimElem = 37 || AnimElem = 40
value = 1,5

[State 3261, Dust Helper]
type = Helper
trigger1 = AnimElem = 4
helperType = Normal
stateNo = 8100
ID = 8100
name = "Shippu Jinraikyaku Dust (Air)"
posType = P1
ownPal = 1

[State 3261, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 4
stateType = A
physics = N

[State 3261, VelSet]
type = VelSet
trigger1 = AnimElem = 4
y = -5.5

[State 3261, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(4) > 0 && AnimElemTime(27) < 0
y = 0.125

[State 3261, VelSet]
type = VelSet
trigger1 = AnimElem = 27
y = 0

[State 3261, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(27) > 0
y = 0.25

[State 3261, HitDef (Opponent in front)]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 5 || AnimElem = 11 || AnimElem = 17
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 2,2
guard.pauseTime = 2,2
animType = Up
air.animType = Up
fall.animType = Up
ground.type = High
air.type = Low
ground.hitTime = 16
ground.slideTime = 16
guard.hitTime = 16
air.hitTime = 120
ground.velocity = 0,-5.90625
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = 0, -5.90625
air.cornerPush.velOff = 0
yAccel = 0.4375
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 60), var(36) := -71
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3261, HitDef (Opponent in back)]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 8 || AnimElem = 14 || AnimElem = 20
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 2,2
guard.pauseTime = 2,2
animType = Up
air.animType = Up
fall.animType = Up
ground.type = High
air.type = Low
ground.hitTime = 16
ground.slideTime = 16
guard.hitTime = 16
air.hitTime = 120
ground.velocity = 0,-5.90625
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = 0, -5.90625
air.cornerPush.velOff = 0
yAccel = 0.4375
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := -45), var(36) := -71
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3261, Final Hit (Opponent in front)]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 23
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 6,6
guard.pauseTime = 6,6
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 16
ground.slideTime = 16
guard.hitTime = 16
air.hitTime = 120
ground.velocity = -5,-14.4375
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -5, -14.4375
air.cornerPush.velOff = 0
yAccel = 0.875
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 60), var(36) := -71
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3261, Final Hit (Opponent in back)]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 26
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 6,6
guard.pauseTime = 6,6
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 16
ground.slideTime = 16
guard.hitTime = 16
air.hitTime = 120
ground.velocity = 5,-14.4375
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = 5, -14.4375
air.cornerPush.velOff = 0
yAccel = 0.875
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := -45), var(36) := -71
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3261, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(27) >= 0
moveType = I

[State 3261, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 1215



;========================<SHONETSU SHINRYUKEN>=============================
[StateDef 3300]
type = S
physics = N
moveType = A
anim = 3300
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -3000
faceP2 = 1

[State 3300, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000,2999]) && var(7)) || var(20)

[State 3300, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3300, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3300, Corner Push]
type = VarSet
trigger1 = Time = 3
fvar(5) = 0

[State 3300, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 47

[State 3300, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3300, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3300, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(8) < 0
time = 1
value = SCA

[State 3300, Super Pause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8520
ID = 8500
name = "Superpause FX"
posType = P1
pos = -23,-68
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3300, Super Pause]
type = SuperPause
trigger1 = Time = 3
time = 47
moveTime = 47
p2DefMul = 1
unHittable = 0
anim = -1
sound = s8500,0
darken = 0

[State 3300, Voice 1]
type = PlaySnd
trigger1 = Time = 3
value = 3100,0
channel = 0

[State 3300, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 9
value = 3100,1
channel = 0

[State 3300, Woosh sound]
type = PlaySnd
trigger1 = AnimElem = 7
value = 1,2
channel = 1

[State 3300, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 7
ID = 3300
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 52,52
guard.pauseTime = 44,44
animType = Hard
air.animType = Hard
fall.animType = Hard
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -1.5, -6.25
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -1.5, -6.25
air.cornerPush.velOff = 0
yAccel = 0.3125
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 45), var(36) := -52
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3300, TargetDrop]
type = TargetDrop
trigger1 = NumTarget(3300) > 1
ID = 3300
keepOne = 1
excludeID = 3300
ignoreHitPause = 1

[State 3300, PlayerPush]
type = PlayerPush
trigger1 = MoveHit && NumTarget(3300)
value = 0
ignoreHitPause = 1

[State 3300, Width]
type = Width
trigger1 = MoveHit && NumTarget(3300)
edge = 64,0
ignoreHitPause = 1

[State 3300, TargetBind]
type = TargetBind
trigger1 = MoveHit && NumTarget(3300)
pos = 30,0
ignoreHitPause = 1

[State 3300, TargetState]
type = TargetState
trigger1 = MoveHit && NumTarget(3300)
value = 3315
ID = 3300
ignoreHitPause = 1
persistent = 0

[State 3300, ChangeState]
type = ChangeState
trigger1 = NumTarget(3300)
trigger1 = MoveHit && Target, Alive
value = 3310

[State 3300, Ground Hit (Whiffed)]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 + HitCount)
trigger1 = AnimElem = 8
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 2,2
guard.pauseTime = 2,2
animType = Up
air.animType = Up
fall.animType = Up
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 1.25, -8.125
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = 1.25, -8.125
air.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 36), var(36) := -79
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3300, Fire sound]
type = PlaySnd
trigger1 = AnimElem = 9
value = 3300,0
channel = 3

[State 3300, Jump Sound]
type = PlaySnd
trigger1 = AnimElemTime(9) = 2
value = 41,0
channel = 4

[State 3300, Shinryuken Flames (Air)]
type = Explod
trigger1 = AnimElem = 9
ID = 3305
anim = 3305
bindTime = -1
removetime = -1
sprPriority = 3
posType = P1
pos = 10, -144
scale = 0.35, 0.35
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3300, Dust Helper]
type = Helper
trigger1 = AnimElemTime(9) = 2
helperType = Normal
stateNo = 8100
ID = 8100
name = "Shonetsu Shinryuken Dust"
posType = P1
ownPal = 1

[State 3300, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 9
stateType = A
physics = N

[State 3300, VelSet]
type = VelSet
trigger1 = AnimElemTime(9) = 2
y = -11.25 / 1.125
persistent = 0

[State 3300, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(9) > 2
y = 0.5859375 / 1.75 / 1.125

[State 3300, Woosh sound]
type = PlaySnd
trigger1 = AnimElem = 11
trigger2 = AnimElem = 14
trigger3 = AnimElem = 17
trigger4 = AnimElem = 20
value = 1,2

[State 3300, Spark XY]
type = Null
trigger1 = AnimElemTime(9) >= 0
trigger1 = var(35) := (12 + (Random % 25)) || var(36) := -70 - (Random % 41)

[State 3300, Air Hits (Whiffed)]
type = HitDef
triggerAll = !var(16) && (var(15) < 1 + HitCount)
trigger1 = AnimElem = 9 || AnimElem = 10 || AnimElem = 11 || AnimElem = 12 || AnimElem = 13 || AnimElem = 14 || AnimElem = 15
trigger2 = AnimElem = 16 || AnimElem = 17 || AnimElem = 18 || AnimElem = 19 || AnimElem = 20
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Up
air.animType = Up
fall.animType = Up
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 1.25, -10.125
ground.cornerPush.velOff = 0
guard.velocity = 1.25
guard.cornerPush.velOff = 0
air.velocity = 1.25, -10.125
air.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10, -55
palFX.time = 45
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3300, Flame Particles]
type = Helper
trigger1 = !NumHelper(8150) && AnimElemTime(9) >= 0
trigger1 = MoveHit = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
trigger1 = var(43) := (Target, ID)
helperType = Normal
stateNo = 8150
ID = 8150
name = "Flame Particles"
posType = P2
ownPal = 1
ignoreHitPause = 1

[State 3300, Flame Particle Timer Set]
type = VarSet
trigger1 = MoveHit = 1 && NumTarget && AnimElemTime(9) >= 0
trigger1 = !(Target, HitShakeOver) && HitPauseTime = 4
var(45) = 45
ignoreHitPause = 1

[State 3300, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(21) >= 0
moveType = I

[State 3300, Shinryuken Flames (Fade Away)]
type = Explod
trigger1 = NumExplod(3305) && AnimElemTime(21) >= 0
anim = 3306
sprPriority = 3
posType = P1
pos = 10, -144
scale = 0.35, 0.35
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3300, RemoveExplod]
type = RemoveExplod
trigger1 = NumExplod(3305) && AnimElemTime(21) >= 0
id = 3305
ignoreHitPause = 1

[State 3300, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 3313


;Success
[StateDef 3310]
type = S
anim = 3310
physics = N
moveType = A
velSet = 0,0
hitCountPersist = 1

[State 3310, Width]
type = Width
trigger1 = 1
edge = 64,0

[State 3310, Jump Sound]
type = PlaySnd
trigger1 = AnimElemTime(2) = 1
value = 40,0
channel = 3

[State 3310, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 2
stateType = A
physics = N

[State 3310, Dust Helper]
type = Helper
trigger1 = AnimElemTime(2) = 1
helperType = Normal
stateNo = 8100
ID = 8100
name = "Shonetsu Shinryuken Dust"
posType = P1
ownPal = 1

[State 3310, VelSet]
type = VelSet
trigger1 = AnimElemTime(2) = 2
x = 0.9375
y = -9.375 / 2.125

[State 3310, VelSet]
type = VelSet
trigger1 = vel x < 0
x = 0

[State 3310, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(2) > 2
y = 0.5859375 / 2.0625

[State 3310, PosAdd]
type = PosAdd
trigger1 = AnimElem = 5
y = -6

[State 3310, Voice]
type = PlaySnd
trigger1 = AnimElem = 8
value = 3310,0
channel = 0

[State 3310, Woosh sound]
type = PlaySnd
trigger1 = AnimElem = 8
value = 1,5
channel = 4

[State 3310, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 3311


;Success, Landing
[StateDef 3311]
type = S
anim = 3311
physics = N
moveType = A
velSet = 0,0
hitCountPersist = 1

[State 3311, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 3311, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3311, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0
channel = 5

[State 3311, Hit 1]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 1
ID = 3311
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 6,6
guard.pauseTime = 6,6
animType = Hard
air.animType = Hard
fall.animType = Hard
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -5, -6.5625
air.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 93), var(36) := -56
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3311, TargetDrop]
type = TargetDrop
trigger1 = NumTarget(3311) > 1
ID = 3311
keepOne = 1
excludeID = 3311
ignoreHitPause = 1

[State 3311, TargetBind]
type = TargetBind
trigger1 = MoveHit && NumTarget(3311)
pos = 64,0
ignoreHitPause = 1
persistent = 0

[State 3311, TargetState]
type = TargetState
trigger1 = MoveHit && NumTarget(3311)
value = 3325
ID = 3311
ignoreHitPause = 1
persistent = 0

[State 3311, Woosh sound]
type = PlaySnd
trigger1 = AnimElem = 8
trigger2 = AnimElem = 12
trigger3 = AnimElem = 16
trigger4 = AnimElem = 23
value = 1,5

[State 3311, Hit 2]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 9
ID = 3311
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 6,6
guard.pauseTime = 6,6
animType = Hard
air.animType = Hard
fall.animType = Hard
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -5, -6.5625
air.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 65), var(36) := -69
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3311, Hit 3]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 13
ID = 3311
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 6,6
guard.pauseTime = 6,6
animType = Hard
air.animType = Hard
fall.animType = Hard
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -5, -6.5625
air.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 46), var(36) := -86
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3311, Hit 4]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 17
ID = 3311
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 6,6
guard.pauseTime = 6,6
animType = Hard
air.animType = Hard
fall.animType = Hard
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -5, -6.5625
air.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -99
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3311, Hit 5]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 24
ID = 3311
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 6,6
guard.pauseTime = 6,6
animType = Hard
air.animType = Hard
fall.animType = Hard
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -5, -6.5625
air.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 82), var(36) := -102
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3311, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 29
value = 40,0
channel = 1

[State 3311, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 29
stateType = A
physics = N

[State 3311, Dust Helper]
type = Helper
trigger1 = AnimElem = 29
helperType = Normal
stateNo = 8100
ID = 8100
name = "Shonetsu Shinryuken Dust"
posType = P1
ownPal = 1

[State 3311, VelSet]
type = VelSet
trigger1 = AnimElem = 29
y = -4.75

[State 3311, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(29) > 0
y = 0.5859375

[State 3311, Woosh sound]
type = PlaySnd
trigger1 = AnimElem = 30
value = 1,5
channel = 3

[State 3311, Hit 6]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 31
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 6,6
guard.pauseTime = 6,6
animType = Hard
air.animType = Hard
fall.animType = Hard
ground.type = Low
air.type = Low
ground.hitTime = 34
ground.slideTime = 34
guard.hitTime = 34
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -5, -6.5625
air.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 75), var(36) := -96
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3311, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 3312


;Finish
[StateDef 3312]
type = S
anim = 3312
physics = N
moveType = A
velSet = 0,0
hitCountPersist = 1

[State 3312, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 3312, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
pos = 26,0
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3312, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0
channel = 4

[State 3312, Voice]
type = PlaySnd
trigger1 = AnimElem = 8
value = 3100,1
channel = 0

[State 3312, Woosh sound]
type = PlaySnd
trigger1 = AnimElem = 5
value = 1,2
channel = 5

[State 3312, Fire sound 1]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1100,1
channel = 6

[State 3312, Body Overlay]
type = Helper
trigger1 = AnimElem = 4
helperType = Normal
stateNo = 13312
ID = 13312
name = "Body Overlay"
posType = P1
ownPal = 1

[State 3312, Flames (Ground)]
type = Explod
trigger1 = AnimElem = 4
anim = 3315
bindTime = -1
sprPriority = 2
posType = P1
pos = 20,-10
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3312, Ground Hit]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 + HitCount)
trigger1 = AnimElem = 6
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
animType = Up
air.animType = Up
fall.animType = Up
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 1.25, -8.125
ground.cornerPush.velOff = 0
guard.velocity = 1.25
guard.cornerPush.velOff = 0
air.velocity = 1.25, -8.125
air.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 58), var(36) := -72
palFX.time = 54
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3312, Flame Particles]
type = Helper
trigger1 = !NumHelper(8150)
trigger1 = MoveHit = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
trigger1 = var(43) := (Target, ID)
helperType = Normal
stateNo = 8150
ID = 8150
name = "Flame Particles"
posType = P2
ownPal = 1
ignoreHitPause = 1

[State 3312, Flame Particle Timer Set]
type = VarSet
trigger1 = MoveHit = 1 && NumTarget
trigger1 = !(Target, HitShakeOver) && HitPauseTime = 12
var(45) = 54
ignoreHitPause = 1

[State 3312, Jump Sound]
type = PlaySnd
trigger1 = AnimElemTime(7) = 2
value = 41,0
channel = 7

[State 3312, Fire sound 2]
type = PlaySnd
trigger1 = AnimElem = 7
value = 3300,0
channel = 6

[State 3312, Shinryuken Flames (Air)]
type = Explod
trigger1 = AnimElem = 7
ID = 3305
anim = 3316
bindTime = -1
removetime = -1
sprPriority = 3
posType = P1
pos = 10, -144
scale = 0.35, 0.35
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3312, Dust Helper]
type = Helper
trigger1 = AnimElemTime(7) = 2
helperType = Normal
stateNo = 8100
ID = 8100
name = "Shonetsu Shinryuken Dust"
posType = P1
pos = 26,0
ownPal = 1

[State 3312, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 7
stateType = A
physics = N

[State 3312, VelSet]
type = VelSet
trigger1 = AnimElemTime(7) = 2
y = -11.25 / 1.5
persistent = 0

[State 3312, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(7) > 2 && AnimElemTime(23) <= 0
y = 0.5859375 / 2.375 / 1.5

[State 3312, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(23) > 0
y = 0.5859375 / 1.5

[State 3312, Woosh sound]
type = PlaySnd
trigger1 = AnimElem = 9
trigger2 = AnimElem = 12
trigger3 = AnimElem = 15
trigger4 = AnimElem = 18
trigger5 = AnimElem = 21
value = 1,2

[State 3312, Spark XY]
type = Null
trigger1 = AnimElemTime(7) >= 0
trigger1 = var(35) := (28 + (Random % 25)) || var(36) := -70 - (Random % 41)

[State 3312, Air Hits]
type = HitDef
triggerAll = !var(16) && (var(15) < 1 + HitCount)
trigger1 = AnimElem = 7 || AnimElem = 8 || AnimElem = 9 || AnimElem = 10 || AnimElem = 11 || AnimElem = 12 || AnimElem = 13 || AnimElem = 14
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 2,2
guard.pauseTime = 2,2
animType = Up
air.animType = Up
fall.animType = Up
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 0, -8.125
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = 0, -8.125
air.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10, -55
palFX.time = 54
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3312, Flame Particle Timer Set]
type = VarSet
trigger1 = MoveHit = 1 && NumTarget && AnimElemTime(7) > 0
trigger1 = !(Target, HitShakeOver) && HitPauseTime = 2
var(45) = 54
ignoreHitPause = 1

[State 3312, Final Hit]
type = HitDef
triggerAll = !var(16) && (var(15) < 1 + HitCount)
trigger1 = AnimElem = 15
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 2,2
guard.pauseTime = 2,2
animType = Up
air.animType = Up
fall.animType = Up
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -4, -10.125
ground.cornerPush.velOff = 0
guard.velocity = -4
guard.cornerPush.velOff = 0
air.velocity = -4, -10.125
air.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10, -55
palFX.time = 54
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3312, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(16) >= 0
moveType = I

[State 3312, Shinryuken Flames (Fade Away)]
type = Explod
trigger1 = NumExplod(3305) && AnimElemTime(23) >= 0
anim = 3306
sprPriority = 3
posType = P1
pos = 10, -144
scale = 0.35, 0.35
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3312, RemoveExplod]
type = RemoveExplod
trigger1 = NumExplod(3305) && AnimElemTime(23) >= 0
id = 3305
ignoreHitPause = 1

[State 3312, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 3313


;Landing
[StateDef 3313]
type = S
anim = 3313
physics = N
moveType = I
velSet = 0,0

[State 3313, PosAdd]
type = PosAdd
trigger1 = !Time && PrevStateNo = 3312
x = 26

[State 3313, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 3313, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3313, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0
channel = 1

[State 3313, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Target
[StateDef 3315]
type = S
moveType = H
physics = N
velSet = 0,0

[State 3315, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 3315, HitFallSet]
type = HitFallSet
trigger1 = !Time
value = 0

[State 3315, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 5012

[State 3315, ChangeAnim]
type = ChangeAnim
trigger1 = Time > 0
value = Anim

[State 3315, ChangeState]
type = ChangeState
trigger1 = HitShakeOver
value = 3316


;Knocked upwards
[StateDef 3316]
type = A
movetype = H
physics = N

[State 3316, ChangeAnim]
type = ChangeAnim
trigger1 = SelfAnimExist(5051) && Anim != 5051
value = 5051

[State 3316, VelSet]
type = VelSet
trigger1 = !Time
x = -1.5
y = -6.25

[State 3316, VelAdd]
type = VelAdd
trigger1 = Time > 0
y = 0.3125

[State 3316, SelfState]
type = SelfState
trigger1 = vel y > 0 && pos y >= const(movement.air.getHit.groundRecover.ground.threshold)
value = 5050

[State 3316, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 3317


;Knocked upwards (transition)
[StateDef 3317]
type = A
movetype = H
physics = N

[State 3317, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
trigger1 = SelfAnimExist(5035)
trigger1 = Anim != [5051,5059]
trigger1 = Anim != 5090
value = 5035

[State 3317, VelAdd]
type = VelAdd
trigger1 = Time > 0
y = 0.3125

[State 3317, SelfState]
type = SelfState
trigger1 = HitOver
trigger2 = !AnimTime
trigger3 = vel y > 0
trigger3 = pos y >= const(movement.air.gethit.groundLevel)
trigger4 = !Time
trigger4 = Anim != 5035
value = 5050


;Target, knocked back onto ground
[StateDef 3325]
type = S
moveType = H
physics = N
velSet = 0,0

[State 3325, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 3325, HitFallSet]
type = HitFallSet
trigger1 = !Time
value = 0

[State 3325, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 5012

[State 3325, ChangeAnim]
type = ChangeAnim
trigger1 = Time > 0
value = Anim

[State 3325, ChangeState]
type = ChangeState
trigger1 = HitShakeOver
value = 3326


;Sliding
[StateDef 3326]
type = S
movetype = H
physics = S

[State 3326, ChangeAnim]
type = ChangeAnim
trigger1 = !AnimTime
value = 5017

[State 3326, DefenceMulSet]
type = DefenceMulSet
trigger1 = HitOver
value = 1

[State 3326, SelfState]
type = SelfState
trigger1 = HitOver
value = 0
ctrl = 1



;========================<KUZURYUREPPA>=============================
[StateDef 3450]
type = S
physics = N
moveType = A
anim = 3450
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -2000
faceP2 = 1

[State 3450, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000, 2999]) && var(7)) || var(20)

[State 3450, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3450, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3450, Corner Push]
type = VarSet
trigger1 = Time = 3
fvar(5) = 0

[State 3450, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 45

[State 3450, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3450, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3450, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(11) < 0
time = 1
value = SCA

[State 3450, Super Pause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = -8, -26
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3450, Super Pause]
type = SuperPause
trigger1 = Time = 3
time = 45
moveTime = 45
p2DefMul = 1
unHittable = 0
anim = -1
sound = s8500,0
darken = 0

[State 3450, Width]
type = Width
trigger1 = AnimElemTime(46) < 0
edge = 64,0
ignoreHitPause = 1

[State 3450, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 3400,0 + 1 * (var(40) = 2)
channel = 0

[State 3450, Shippu wooshes]
type = PlaySnd
trigger1 = AnimElem = 3
trigger2 = AnimElem = 15
trigger3 = AnimElem = 25
trigger4 = AnimElem = 38
value = 1,5

[State 3450, Push Helper]
type = Helper
trigger1 = AnimElem = 2
helperType = Normal
stateNo = 13200
ID = 13200
name = "Kuzuryureppa Pushbox"
posType = P1
size.ground.back = 32
size.ground.front = 48
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 3450, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x = 2.5

[State 3450, PosAdd]
type = PosAdd
trigger1 = AnimElem = 2
x = 16

[State 3450, Dust Helper]
type = Helper
trigger1 = AnimElem = 2
helperType = Normal
stateNo = 8103
ID = 8100
name = "Kuzuryureppa Dust (Ground)"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 3450, Hit 1]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 3
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 7 < 7, 7, fvar(11) * 7)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 2,2
guard.pauseTime = 2,2
animType = Hard
air.animType = Hard
fall.animType = Hard
ground.type = Low
air.type = Low
ground.hitTime = 28
ground.slideTime = 28
guard.hitTime = 28
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -5, -6.5625
air.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 48), var(36) := -77
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3450, Hit 2]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 4
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 7 < 7, 7, fvar(11) * 7)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 2,2
guard.pauseTime = 2,2
animType = Hard
air.animType = Hard
fall.animType = Hard
ground.type = High
air.type = Low
ground.hitTime = 28
ground.slideTime = 28
guard.hitTime = 28
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -5, -6.5625
air.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 75), var(36) := -106
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3450, Hit 3]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 16
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 2,2
guard.pauseTime = 2,2
animType = Hard
air.animType = Hard
fall.animType = Hard
ground.type = High
air.type = Low
ground.hitTime = 28
ground.slideTime = 28
guard.hitTime = 28
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -5, -6.5625
air.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 82), var(36) := -102
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3450, Hit 4]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 26
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 2,2
guard.pauseTime = 2,2
animType = Hard
air.animType = Hard
fall.animType = Hard
ground.type = High
air.type = Low
ground.hitTime = 28
ground.slideTime = 28
guard.hitTime = 28
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -5, -6.5625
air.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 82), var(36) := -102
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3450, Hit 5]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 39
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 7 < 7, 7, fvar(11) * 7)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 2,2
guard.pauseTime = 2,2
animType = Hard
air.animType = Hard
fall.animType = Hard
ground.type = Low
air.type = Low
ground.hitTime = 28
ground.slideTime = 28
guard.hitTime = 28
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -5, -6.5625
air.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 82), var(36) := -97
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3450, Hit 6]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 40
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 7 < 7, 7, fvar(11) * 7)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 2,2
guard.pauseTime = 2,2
animType = Hard
air.animType = Hard
fall.animType = Hard
ground.type = Low
air.type = Low
ground.hitTime = 28
ground.slideTime = 28
guard.hitTime = 28
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -5, -6.5625
air.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 102), var(36) := -61
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3450, Shoryureppa woosh sound 1]
type = PlaySnd
trigger1 = AnimElem = 47
value = 1,2
channel = 1

[State 3450, Shoryureppa jump sound 1]
type = PlaySnd
trigger1 = AnimElem = 49
value = 40,0
channel = 3

[State 3450, Landing Dust Explod]
type = Explod
trigger1 = AnimElem = 56
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3450, Shoryureppa landing sound 1]
type = PlaySnd
trigger1 = AnimElem = 56
value = 52,0
channel = 4

[State 3450, Shoryureppa woosh sound 2]
type = PlaySnd
trigger1 = AnimElem = 57
value = 1,2
channel = 5

[State 3450, Shoryureppa jump sound 2]
type = PlaySnd
trigger1 = AnimElem = 59
value = 40,0
channel = 6

[State 3450, Landing Dust Explod]
type = Explod
trigger1 = AnimElem = 66
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3450, Shoryureppa landing sound 2]
type = PlaySnd
trigger1 = AnimElem = 66
value = 52,0
channel = 7

[State 3450, Shoryureppa Hit 1/3]
type = HitDef
triggerAll = !var(16) && (var(15) < 1 + HitCount)
trigger1 = AnimElem = 47
trigger2 = AnimElem = 57
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Hard
air.animType = Hard
fall.animType = Hard
ground.type = Low
air.type = Low
ground.hitTime = 28
ground.slideTime = 28
guard.hitTime = 28
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -5, -6.5625
air.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 27), var(36) := -40
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3450, Shoryureppa Hit 2/4]
type = HitDef
triggerAll = !var(16) && (var(15) < 1 + HitCount)
trigger1 = AnimElem = 48
trigger2 = AnimElem = 58
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Hard
air.animType = Hard
fall.animType = Hard
ground.type = Low
air.type = Low
ground.hitTime = 28
ground.slideTime = 28
guard.hitTime = 28
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -5, -6.5625
air.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 36), var(36) := -79
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3450, VelSet]
type = VelSet
trigger1 = AnimElem = 66
x = 0

[State 3450, Shinryuken woosh (ground)]
type = PlaySnd
trigger1 = AnimElem = 68
value = 1,2
channel = 8

[State 3450, Shinryuken Ground Hit 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 + HitCount)
trigger1 = AnimElem = 67
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Hard
air.animType = Hard
fall.animType = Hard
ground.type = High
air.type = Low
ground.hitTime = 28
ground.slideTime = 28
guard.hitTime = 28
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 1.25
guard.cornerPush.velOff = 0
air.velocity = 1.25, -8.125
air.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 27), var(36) := -40
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3450, Shinryuken Ground Hit 2]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 + HitCount)
trigger1 = AnimElem = 68
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
animType = Up
air.animType = Up
fall.animType = Up
ground.type = High
air.type = Low
ground.hitTime = 28
ground.slideTime = 28
guard.hitTime = 28
air.hitTime = 120
ground.velocity = 1.25, -8.125
ground.cornerPush.velOff = 0
guard.velocity = 1.25
guard.cornerPush.velOff = 0
air.velocity = 1.25, -8.125
air.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 36), var(36) := -79
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3450, Jump Sound]
type = PlaySnd
trigger1 = AnimElemTime(69) = 1
value = 41,0
channel = 9

[State 3450, Shinryuken wooshes (air)]
type = PlaySnd
trigger1 = AnimElem = 71
trigger2 = AnimElem = 74
value = 1,2

[State 3450, Dust Helper]
type = Helper
trigger1 = AnimElemTime(69) = 1
helperType = Normal
stateNo = 8100
ID = 8100
name = "Shinryuken Dust"
posType = P1
ownPal = 1

[State 3450, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 69
stateType = A
physics = N

[State 3450, VelSet]
type = VelSet
trigger1 = AnimElem = 70
y = -8

[State 3450, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(70) >= 0
y = ifElse(AnimElemTime(77) >= 0, 0.75, 0.25)

[State 3450, Spark XY]
type = Null
trigger1 = AnimElemTime(69) >= 0
trigger1 = var(35) := (12 + (Random % 25)) || var(36) := -70 - (Random % 41)

[State 3450, Aerial Shinryuken Hits]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 + HitCount)
trigger1 = AnimElem = 69 || AnimElem = 70 || AnimElem = 71 || AnimElem = 72 || AnimElem = 73 || AnimElem = 74
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 2,2
guard.pauseTime = 2,2
animType = Up
air.animType = Up
fall.animType = Up
ground.type = High
air.type = Low
ground.hitTime = 28
ground.slideTime = 28
guard.hitTime = 28
air.hitTime = 120
ground.velocity = 1.25, -8.125
ground.cornerPush.velOff = 0
guard.velocity = 1.25
guard.cornerPush.velOff = 0
air.velocity = 1.25, -8.125
air.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10, -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3450, Final Hit]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 + HitCount)
trigger1 = AnimElem = 75
ID = 3450
attr = A, HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 2,2
guard.pauseTime = 2,2
animType = Up
air.animType = Up
fall.animType = Up
ground.type = High
air.type = Low
ground.hitTime = 28
ground.slideTime = 28
guard.hitTime = 28
air.hitTime = 120
ground.velocity = -0.25, -14.4375
ground.cornerPush.velOff = 0
guard.velocity = -0.25
guard.cornerPush.velOff = 0
air.velocity = -0.25, -14.4375
air.cornerPush.velOff = 0
yAccel = 0.875
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10, -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3450, Juggle Reset]
type = VarSet
trigger1 = MoveHit && NumTarget(3450)
var(15) = 0

[State 3450, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(77) >= 0
moveType = I

[State 3450, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 1101



;========================<SHINBU MESSATSU>=============================
;Startup
[StateDef 3500]
type = S
physics = N
moveType = A
anim = ifElse(var(40) = 2, 3501, 3500)
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -3000
faceP2 = 1

[State 3500, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000,2999]) && var(7)) || var(20)

[State 3500, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3500, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3500, Corner Push]
type = VarSet
trigger1 = Time = 3
fvar(5) = 0

[State 3500, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 47

[State 3500, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3500, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3500, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(10) < 0
time = 1
value = SCA

[State 3500, Super Pause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8520
ID = 8500
name = "Superpause FX"
posType = P1
pos = 6,-77
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3500, Super Pause]
type = SuperPause
trigger1 = Time = 3
time = 47
moveTime = 47
p2DefMul = 1
unHittable = 0
anim = -1
sound = s8500,0
darken = 0

[State 3500, Dash Sound]
type = PlaySnd
trigger1 = AnimElem = 9
value = 41,0
channel = 1

[State 3500, Dust Helper]
type = Helper
trigger1 = AnimElem = 9
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 3500, PosAdd]
type = PosAdd
trigger1 = AnimElem = 9
x = 8

[State 3500, VelSet]
type = VelSet
trigger1 = AnimElem = 9
x = 8

[State 3500, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 9
ID = 3500
attr = A, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = 0,0
getPower = 0,0
givePower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 16
ground.slideTime = 16
guard.hitTime = 16
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -73
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3500, TargetDrop]
type = TargetDrop
trigger1 = NumTarget(3500) > 1
ID = 3500
keepOne = 1
excludeID = 3500
ignoreHitPause = 1

[State 3500, TargetState]
type = TargetState
trigger1 = MoveHit && NumTarget(3500)
value = 3505
ID = 3500
ignoreHitPause = 1
persistent = 0

[State 3500, ChangeState]
type = ChangeState
trigger1 = NumTarget(3500)
trigger1 = MoveHit && Target, Alive
value = 3510

[State 3500, VelSet]
type = VelSet
trigger1 = AnimElem = 11
x = 0

[State 3500, Dash End Sound]
type = PlaySnd
trigger1 = AnimElem = 11
value = 100,0

[State 3500, Landing Dust Explod]
type = Explod
trigger1 = AnimElem = 11
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3500, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Target
[StateDef 3505]
type = S
moveType = H
physics = N
velSet = 0,0

[State 3505, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 3505, HitFallSet]
type = HitFallSet
trigger1 = !Time
value = 0

[State 3505, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 5002

[State 3505, ChangeAnim]
type = ChangeAnim
trigger1 = Time > 0
value = Anim

[State 3505, ChangeState]
type = ChangeState
trigger1 = HitShakeOver
value = 3506


;Sliding
[StateDef 3506]
type = S
movetype = H
physics = S

[State 3506, ChangeAnim]
type = ChangeAnim
trigger1 = !AnimTime
value = 5007

[State 3506, DefenceMulSet]
type = DefenceMulSet
trigger1 = HitOver
value = 1

[State 3506, SelfState]
type = SelfState
trigger1 = HitOver
value = 0
ctrl = 1


;Success
[StateDef 3510]
type = S
anim = ifElse(var(40) = 2, 3511, 3510)
physics = N
moveType = A
velSet = 0,0

[State 3510, Dash End Sound]
type = PlaySnd
trigger1 = !Time
value = 100,0

[State 3510, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3510, TargetBind]
type = TargetBind
trigger1 = NumTarget && AnimElemTime(74) < 0
pos = 64,0

[State 3510, Width]
type = Width
trigger1 = NumTarget && AnimElemTime(74) < 0
edge = 80,0

[State 3510, Voice]
type = PlaySnd
trigger1 = !Time && var(40) = 1
value = 3500,0
channel = 0

[State 3510, Voice (Master)]
type = PlaySnd
trigger1 = !Time && var(40) = 2
value = 730,1
channel = 0

[State 3510, HP wooshes]
type = PlaySnd
trigger1 = !Time || AnimElem = 4 || AnimElem = 8 || AnimElem = 37 || AnimElem = 65 || AnimElem = 75 || AnimElem = 79 || AnimElem = 82 || AnimElem = 85 || AnimElem = 88
value = 1,2

[State 3510, HK wooshes]
type = PlaySnd
trigger1 = AnimElem = 13 || AnimElem = 19 || AnimElem = 27 || AnimElem = 47 || AnimElem = 57
value = 1,5

[State 3510, Hit Sound]
type = Null
trigger1 = AnimElem = 2 || AnimElem = 5 || AnimElem = 9 || AnimElem = 39 || AnimElem = 67
trigger1 = var(31) := 2
trigger2 = AnimElem = 14 || AnimElem = 20 || AnimElem = 28 || AnimElem = 48 || AnimElem = 58
trigger2 = var(31) := 5

[State 3510, Spark XY]
type = Null
trigger1 = AnimElem = 2 || AnimElem = 5
trigger1 = var(35) := 63 || var(36) := -87
trigger2 = AnimElem = 9
trigger2 = var(35) := 37 || var(36) := -91
trigger3 = AnimElem = 14
trigger3 = var(35) := 40 || var(36) := -99
trigger4 = AnimElem = 20
trigger4 = var(35) := 68 || var(36) := -33
trigger5 = AnimElem = 28
trigger5 = var(35) := 93 || var(36) := -56
trigger6 = AnimElem = 39
trigger6 = var(35) := 68 || var(36) := -89
trigger7 = AnimElem = 48
trigger7 = var(35) := 66 || var(36) := -81
trigger8 = AnimElem = 58
trigger8 = var(35) := 82 || var(36) := -102
trigger9 = AnimElem = 66
trigger9 = var(35) := 49 || var(36) := -77

[State 3510, HitDef: Low]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 20 || AnimElem = 28 || AnimElem = 48 || AnimElem = 66
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 4, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 0,0
guard.pauseTime = 0,0
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10, -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3510, HitDef: High]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 2 || AnimElem = 5 || AnimElem = 9 || AnimElem = 14 || AnimElem = 39 || AnimElem = 58
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 4, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 0,0
guard.pauseTime = 0,0
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10, -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3510, Orochi Skull Sound]
type = PlaySnd
trigger1 = AnimElem = 74
value = 3500,1
channel = 1

[State 3510, Orochi Skull]
type = Helper
trigger1 = AnimElem = 74
helperType = Normal
stateNo = 3525
ID = 3525
name = "Orochi Skull"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 3510, Final Hit]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 76
ID = 3510
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 168 < 7, 7, fvar(11) * 168)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 0,14
guard.pauseTime = 0,14
animType = Up
air.animType = Up
fall.animType = Up
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2, -14.21875
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -2, -14.21875
air.cornerPush.velOff = 0
yAccel = 0.4375
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 36), var(36) := -79
palFX.time = 79
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3510, Flame Particle Timer Set]
type = VarSet
trigger1 = MoveHit = 1 && NumTarget && AnimElemTime(76) >= 0
trigger1 = !(Target, HitShakeOver)
var(45) = 79
ignoreHitPause = 1
persistent = 0

[State 3510, Flame Particles]
type = Helper
trigger1 = !NumHelper(8150)
trigger1 = MoveHit = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
trigger1 = var(43) := (Target, ID)
helperType = Normal
stateNo = 8150
ID = 8150
name = "Flame Particles"
posType = P2
ownPal = 1
ignoreHitPause = 1

[State 3510, TargetDrop]
type = TargetDrop
trigger1 = NumTarget(3510) > 1
ID = 3510
keepOne = 1
excludeID = 3510
ignoreHitPause = 1

[State 3510, TargetState]
type = TargetState
trigger1 = MoveHit && NumTarget(3510)
value = 13515
ID = 3510
ignoreHitPause = 1
persistent = 0

[State 3510, Jump Sound]
type = PlaySnd
trigger1 = AnimElemTime(77) = 1
value = 41,0
channel = 4

[State 3510, Dust Helper]
type = Helper
trigger1 = AnimElemTime(77) = 1
helperType = Normal
stateNo = 8100
ID = 8100
name = "Shonetsu Shinryuken Dust"
posType = P1
ownPal = 1

[State 3510, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElemTime(77) = 1
stateType = A
physics = N

[State 3510, VelSet]
type = VelSet
trigger1 = AnimElemTime(77) = 1
y = -8.125

[State 3510, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(77) > 1 && AnimElemTime(81) < 0
trigger2 = AnimElemTime(89) >= 0
y = 0.375

[State 3510, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(81) >= 0 && AnimElemTime(89) < 0
y = 0.1875

[State 3310, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(77) >= 0
moveType = I

[State 3510, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 3515


;Landing
[StateDef 3515]
type = S
anim = ifElse(var(40) = 2, 3516, 3515)
physics = N
moveType = I
velSet = 0,0

[State 3515, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 3515, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3515, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0
channel = 1

[State 3530, Voice (Violent)]
type = PlaySnd
trigger1 = AnimElem = 2 && var(40) = 1
value = 3515,0
channel = 0

[State 3530, Voice]
type = PlaySnd
trigger1 = !Time && var(40) = 2
value = 3515,1
channel = 0

[State 3515, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;Target (Final hit)
[StateDef 13515]
type = A
moveType = H
physics = N
velSet = 0,0

[State 13515, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 5030

[State 13515, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
trigger1 = (GetHitVar(AnimType) = [4,5]) && (SelfAnimExist(5047 + GetHitVar(AnimType)))
value = 5047 + GetHitVar(AnimType)

[State 3505, ChangeAnim]
type = ChangeAnim
trigger1 = Time > 0
value = Anim

[State 13515, ChangeState]
type = ChangeState
trigger1 = HitShakeOver
value = 13516


;Target, knocked away
[StateDef 13516]
type = A
moveType = H
physics = N
ctrl = 0

[State 13516, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != [5000, 5199]
trigger1 = SelfAnimExist(5030)
value = 5030

[State 13516, VelAdd]
type = VelAdd
trigger1 = Time > 0
y = GetHitVar(yAccel)

[State 13516, HitVelSet]
type = HitVelSet
trigger1 = !Time
x = 1
y = 1

[State 13516, ChangeState]
type = ChangeState
triggerAll = HitFall
trigger1 = HitOver
trigger2 = vel y > 0
trigger2 = pos y >= const(movement.air.getHit.groundLevel)
value = 13518

[State 13516, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 13517


;Target, air get-hit transition
[StateDef 13517]
type = A
moveType = H
physics = N

[State 13517, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
trigger1 = SelfAnimExist(5035)
trigger1 = Anim != [5051,5059]
trigger1 = Anim != 5090
value = 5035

[State 13517, VelAdd]
type = VelAdd
trigger1 = Time > 0
y = GetHitVar(yAccel)

[State 13517, ChangeState]
type = ChangeState
triggerAll = HitFall
trigger1 = HitOver
trigger2 = !AnimTime
trigger3 = vel y > 0
trigger3 = pos y >= const(movement.air.getHit.groundLevel)
trigger4 = !Time
trigger4 = Anim != 5035
value = 13518


;Target, falling
[StateDef 13518]
type = A
moveType = H
physics = N

[State 13518, ChangeAnim]
type = ChangeAnim
trigger1 = !AnimTime
trigger1 = Anim = 5035
trigger2 = !Time
trigger2 = Anim != 5035
trigger2 = (Anim != [5051,5059]) && (Anim != [5061,5069])
trigger2 = Anim != 5090
value = 5050

[State 13518, ChangeAnim]
type = ChangeAnim
trigger1 = Anim = [5050,5059]
trigger1 = vel y >= ifElse(Anim = 5050, const720p(4), const720p(-8))
trigger1 = SelfAnimExist(Anim + 10)
value = Anim + 10
persistent = 0

[State 13518, VelAdd]
type = VelAdd
trigger1 = Time > 0
y = GetHitVar(yAccel)

[State 13518, ChangeState]
type = ChangeState
trigger1 = vel y > 0
trigger1 = pos y >= ifElse((Anim = [5051,5059]) || (Anim = [5061,5069]), 0, const(movement.air.getHit.groundLevel))
value = 13519


;Target, hit ground from fall
[StateDef 13519]
type = L
moveType = H
physics = N

[State 13519, FallEnvShake]
type = FallEnvShake
trigger1 = !Time

[State 13519, VarSet]
type = VarSet
trigger1 = !Time
sysvar(1) = floor(vel y)

[State 13519, ChangeAnim]
type = ChangeAnim
triggerall = !Time
trigger1 = (Anim != [5051,5059]) && (Anim != [5061,5069])
trigger2 = !SelfAnimExist(5100 + (Anim % 10))
value = 5100

[State 13519, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
trigger1 = (Anim = [5051,5059]) || (Anim = [5061,5069])
trigger1 = SelfAnimExist(5100 + (Anim % 10))
value = 5100 + (Anim % 10)

[State 13519, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 13519, VelSet]
type = VelSet
trigger1 = !Time
y = 0

[State 13519, VelMul]
type = VelMul
trigger1 = !Time
x = 0.75

[State 13519, Explod]
type = Explod
trigger1 = Time = 1
anim = F(60 + (sysvar(1) > const720p(20)) + (sysvar(1) > const720p(56)))
pos = 0, 0
sprPriority = ifElse(sysvar(1) <= const720p(56), -10, 10)

[State 13519, HitFallDamage]
type = HitFallDamage
trigger1 = Time = 3

[State 13519, PlaySnd]
type = PlaySnd
trigger1 = Time = 1
value = F7, (sysvar(1) > const720p(20)) + (sysvar(1) > const720p(56))

[State 13519, PosFreeze]
type = PosFreeze
trigger1 = 1

[State 13519, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 13520


;Target, bounce off ground
[StateDef 13520]
type = L
moveType = H
physics = N

[State 13520, ChangeAnim]
type = ChangeAnim
triggerAll = !Time
trigger1 = Anim != [5101,5109]
trigger2 = !SelfAnimExist(5160 + (Anim % 10))
value = 5160

[State 13520, ChangeAnim]
type = ChangeAnim
triggerAll = !Time
trigger1 = Anim = [5101,5109]
trigger1 = SelfAnimExist(5160 + (Anim % 10))
value = 5160 + (Anim % 10)

[State 13520, HitFallVel]
type = HitFallVel
trigger1 = !Time

[State 13520, PosSet]
type = PosSet
trigger1 = !Time
y = const(movement.down.bounce.offset.y)

[State 13520, PosAdd]
type = PosAdd
trigger1 = Time = 0
x = const(movement.down.bounce.offset.x)

[State 13520, VelAdd]
type = VelAdd
trigger1 = Time > 0
y = const(movement.down.bounce.yAccel)

[State 13520, ChangeState]
type = ChangeState
trigger1 = vel y > 0
trigger1 = pos y >= const(movement.down.bounce.groundLevel)
value = 13521


;Target, lying down
[Statedef 13521]
type = L
moveType = H
physics = N

[State 13521, EnvShake]
type = FallEnvShake
trigger1 = Time = 0

[State 13521, ChangeAnim]
type = ChangeAnim
trigger1 = SelfAnimExist(5110 + (Anim % 10))
trigger1 = Anim = [5081,5089]
value = 5110 + (Anim % 10)
persistent = 0

[State 13521, ChangeAnim]
type = ChangeAnim
triggerAll = !Time
triggerAll = Anim != [5110,5119]
trigger1 = Anim != [5161,5169]
trigger2 = !SelfAnimExist(5170 + (Anim % 10))
value = 5170

[State 13521, ChangeAnim]
type = ChangeAnim
triggerAll = !Time
triggerAll = Anim != [5110,5119]
trigger1 = Anim = [5161,5169]
trigger1 = SelfAnimExist(5170 + (Anim % 10))
value = 5170 + (Anim % 10)

[State 13521, HitFallDamage]
type = HitFallDamage
trigger1 = !Time

[State 13521, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 13521, VarSet]
type = VarSet
trigger1 = !Time
trigger1 = GetHitVar(fall.yVel) != 0
sysvar(1) = floor(vel y)

[State 13521, PlaySnd]
type = PlaySnd
trigger1 = !Time
trigger1 = !sysvar(0)
value = F7, (sysvar(1) > const720p(20)) + (sysvar(1) > const720p(56))

[State 13521, Explod]
type = Explod
trigger1 = !Time
trigger1 = !sysvar(0)
anim = F(60 + (sysvar(1) > const720p(20)) + (sysvar(1) > const720p(56)))
pos = 0, 0
sprPriority = ifElse(sysvar(1) <= const720p(56), -10, 10)

[State 13521, VelSet]
type = VelSet
trigger1 = !Time
y = 0

[State 13521, ChangeAnim]
type = ChangeAnim
triggerAll = Anim = [5171,5179]
triggerAll = SelfAnimExist(5110 + (Anim % 10))
trigger1 = !AnimTime
trigger2 = sysvar(0)
value = 5110 + (Anim % 10)
persistent = 0

[State 13521, ChangeAnim]
type = ChangeAnim
triggerAll = Anim != [5111,5119]
trigger1 = !AnimTime
trigger2 = sysvar(0)
value = 5110
persistent = 0

[State 13521, SelfState]
type = SelfState
triggerAll = !Alive
trigger1 = !AnimTime
trigger2 = sysvar(0)
trigger3 = Anim = [5110,5119]
value = 5150

[State 13521, VarSet]
type = VarSet
trigger1 = sysvar(0)
trigger1 = !Time
sysvar(0) = 0

[State 13521, VelMul]
type = VelMul
trigger1 = 1
x = 0.85

[State 13521, VelSet]
type = VelSet
trigger1 = abs(vel x) < const(movement.down.friction.threshold)
x = 0
persistent = 0

[State 13521, SelfState]
type = SelfState
trigger1 = Time >= 30
value = 5120



;========================<GUREN SENPUKYAKU>=============================
[StateDef 3600]
type = S
physics = N
moveType = A
anim = 3600
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -3000
faceP2 = 1

[State 3600, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000,2999]) && var(7)) || var(20)

[State 3600, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3600, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3600, Corner Push]
type = VarSet
trigger1 = Time = 3
fvar(5) = 0

[State 3600, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 47

[State 3600, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3600, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3600, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(14) < 0
time = 1
value = SCA

[State 3600, Super Pause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8520
ID = 8500
name = "Superpause FX"
posType = P1
pos = 43,-89
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3600, Super Pause]
type = SuperPause
trigger1 = Time = 3
time = 47
moveTime = 47
p2DefMul = 1
unHittable = 0
anim = -1
sound = s8500,0
darken = 0

[State 3600, Voice 1]
type = PlaySnd
trigger1 = !Time
value = 3000,0
channel = 0

[State 3600, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 11
value = 3600,0
channel = 0

[State 3600, Woosh sounds]
type = PlaySnd
trigger1 = AnimElem = 11
trigger2 = AnimElem = 14
trigger3 = AnimElem = 21
trigger4 = AnimElem = 28
trigger5 = AnimElem = 35
trigger6 = AnimElem = 42
trigger7 = AnimElem = 49
trigger8 = AnimElem = 56
trigger9 = AnimElem = 63
trigger10 = AnimElem = 70
trigger11 = AnimElem = 77
value = 1,5

[State 3600, Fire sounds]
type = PlaySnd
trigger1 = AnimElem = 11
trigger2 = AnimElem = 15
trigger3 = AnimElem = 22
trigger4 = AnimElem = 29
trigger5 = AnimElem = 36
trigger6 = AnimElem = 43
trigger7 = AnimElem = 50
trigger8 = AnimElem = 57
trigger9 = AnimElem = 64
trigger10 = AnimElem = 71
trigger11 = AnimElem = 78
value = 1100,1

[State 3600, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 14
value = 40,0
channel = 4

[State 3600, Flames (Initial)]
type = Explod
trigger1 = AnimElem = 11
ID = 3604
anim = 3604
sprPriority = 1
posType = P1
pos = -5,15
superMoveTime = 255
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3600, ModifyExplod]
type = ModifyExplod
trigger1 = AnimElem = 12
ID = 3604
postype = P1
pos = -5,15
sprpriority = 2

[State 3600, Body Overlay]
type = Helper
trigger1 = AnimElem = 12
helperType = Normal
stateNo = 13600
ID = 13600
name = "Body Overlay"
posType = P1
ownPal = 1

[State 3600, Flames (Front)]
type = Explod
trigger1 = AnimElem = 15
trigger2 = AnimElem = 22
trigger3 = AnimElem = 29
trigger4 = AnimElem = 36
trigger5 = AnimElem = 43
trigger6 = AnimElem = 50
trigger7 = AnimElem = 57
trigger8 = AnimElem = 64
trigger9 = AnimElem = 71
trigger10 = AnimElem = 78
anim = 3605
sprPriority = 3
posType = P1
pos = 32,-48
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3600, Flames (Back)]
type = Explod
trigger1 = AnimElem = 19
trigger2 = AnimElem = 26
trigger3 = AnimElem = 33
trigger4 = AnimElem = 40
trigger5 = AnimElem = 47
trigger6 = AnimElem = 54
trigger7 = AnimElem = 61
trigger8 = AnimElem = 68
trigger9 = AnimElem = 75
trigger10 = AnimElem = 82
anim = 3606
sprPriority = 1
posType = P1
pos = 29,-9
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3600, Width]
type = Width
trigger1 = AnimElemTime(83) < 0
edge = 64,0
ignoreHitPause = 1

[State 3600, Push Helper]
type = Helper
trigger1 = AnimElem = 13
helperType = Normal
stateNo = 13200
ID = 13200
name = "Guren Senpukyaku Pushbox"
posType = P1
size.ground.back = 32
size.ground.front = 48
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 3600, PosAdd]
type = PosAdd
trigger1 = AnimElem = 10
x = 29

[State 3600, VelSet]
type = VelSet
trigger1 = AnimElem = 13
x = 5.5
y = -4

[State 3600, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(13) > 0 && vel y < 0
y = 0.5859375

[State 3600, VelSet]
type = VelSet
trigger1 = pos y <= -12.4
y = 0
persistent = 0

[State 3600, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(83) >= 0
y = 0.32

[State 3600, Dust Helper]
type = Helper
trigger1 = AnimElem = 13
helperType = Normal
stateNo = 8100
ID = 8100
name = "Guren Senpukyaku Dust"
posType = P1
ownPal = 1

[State 3600, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 13
stateType = A
physics = N

[State 3600, First Hit]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 12
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 56 < 7, 7, fvar(11) * 56)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 20,20
guard.pauseTime = 20,20
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -7.51,0
ground.cornerPush.velOff = 0
guard.velocity = -7.51
guard.cornerPush.velOff = 0
air.velocity = -7, -7.75
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 54), var(36) := -105
palFX.time = 38
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3600, Flame Particle Timer Set]
type = VarSet
trigger1 = MoveHit = 1 && NumTarget && AnimElemTime(15) < 0
trigger1 = !(Target, HitShakeOver)
var(45) = 38
ignoreHitPause = 1
persistent = 0

[State 3600, Flame Particles]
type = Helper
trigger1 = !NumHelper(8150)
trigger1 = MoveHit = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
trigger1 = var(43) := (Target, ID)
helperType = Normal
stateNo = 8150
ID = 8150
name = "Flame Particles"
posType = P2
ownPal = 1
ignoreHitPause = 1

[State 3600, Rapid Hits (Opponent in front)]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 + HitCount)
trigger1 = AnimElem = 15 || AnimElem = 22 || AnimElem = 29 || AnimElem = 36 || AnimElem = 43 || AnimElem = 50 || AnimElem = 57 || AnimElem = 64 || AnimElem = 71
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 2,2
guard.pauseTime = 2,2
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -7.51,0
ground.cornerPush.velOff = 0
guard.velocity = -7.51
guard.cornerPush.velOff = 0
air.velocity = -7, -7.75
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 58), var(36) := -85
palFX.time = 20
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3600, Rapid Hits (Opponent in back)]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 + HitCount)
trigger1 = AnimElem = 19 || AnimElem = 26 || AnimElem = 33 || AnimElem = 40 || AnimElem = 47 || AnimElem = 54 || AnimElem = 61 || AnimElem = 68 || AnimElem = 75 || AnimElem = 82
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 2,2
guard.pauseTime = 2,2
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 7.51,0
ground.cornerPush.velOff = 0
guard.velocity = 7.51
guard.cornerPush.velOff = 0
air.velocity = 7, -7.75
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := -6), var(36) := -58
palFX.time = 20
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3600, Flame Particle Timer Set]
type = VarSet
trigger1 = MoveHit = 1 && NumTarget && ((AnimElemTime(15) >= 0 && AnimElemTime(78) < 0) || AnimElemTime(82) >= 0)
trigger1 = !(Target, HitShakeOver) && HitPauseTime = 2
var(45) = 20
ignoreHitPause = 1

[State 3600, Final Hit (Opponent in front)]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 + HitCount)
trigger1 = AnimElem = 78
ID = 3600
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 2,2
guard.pauseTime = 2,2
animType = Up
air.animType = Up
fall.animType = Up
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -7, -7.75
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -7, -7.75
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 58), var(36) := -85
palFX.time = 34
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3600, Flame Particle Timer Set (Dead Target)]
type = VarSet
trigger1 = MoveHit = 1 && NumTarget && AnimElemTime(78) >= 0 && AnimElemTime(82) < 0
trigger1 = !(Target, HitShakeOver)
var(45) = 34
ignoreHitPause = 1
persistent = 0

[State 3600, Flame Particle Timer Set (Alive Target)]
type = VarSet
trigger1 = MoveHit = 1 && NumTarget && AnimElemTime(78) >= 0 && AnimElemTime(82) < 0
trigger1 = !(Target, HitShakeOver)
trigger1 = NumTarget(3600)
trigger1 = MoveHit && Target, Alive
var(45) = 104
ignoreHitPause = 1
persistent = 0

[State 3600, TargetDrop]
type = TargetDrop
trigger1 = NumTarget(3600) > 1
ID = 3600
keepOne = 1
excludeID = 3600
ignoreHitPause = 1

[State 3300, TargetState]
type = TargetState
trigger1 = NumTarget(3600)
trigger1 = MoveHit && Target, Alive
value = 3605
ID = 3600
ignoreHitPause = 1
persistent = 0

[State 3600, PlayerPush]
type = PlayerPush
trigger1 = MoveHit && NumTarget(3600)
value = 0
ignoreHitPause = 1

[State 3600, ChangeState]
type = ChangeState
trigger1 = NumTarget(3600)
trigger1 = MoveHit && Target, Alive
value = 3610

[State 3600, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(83) >= 0
moveType = I

[State 3600, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 3601


;Landing
[StateDef 3601]
type = S
anim = 3601
physics = N
moveType = I
velSet = 0,0

[State 3601, ScreenBound]
type = ScreenBound
trigger1 = PrevStateNo = 3610 && EnemyNear, Alive
value = 1
moveCamera = 1,0
ignoreHitPause = 1

[State 3601, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 3601, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3601, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0
channel = 1

[State 3601, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Finish
[StateDef 3610]
type = A
anim = 3610
physics = N
moveType = A
hitCountPersist = 1

[State 3610, ScreenBound]
type = ScreenBound
trigger1 = EnemyNear, Alive
value = 1
moveCamera = 1,0
ignoreHitPause = 1

[State 3610, VelSet]
type = VelAdd
trigger1 = vel x >= 0
x = -0.2

[State 3610, VelSet]
type = VelSet
trigger1 = vel x < 0
x = 0

[State 3610, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(7) < 0
y = 0.19

[State 3610, Land]
type = ChangeAnim
trigger1 = pos y > -vel y && AnimElemTime(7) < 0
value = 3610
elem = 7

[State 3610, Voice 1]
type = PlaySnd
trigger1 = AnimElem = 5
value = 3610,0
channel = 0

[State 3610, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 30
value = 3610,1
channel = 0

[State 3610, VelSet]
type = VelSet
trigger1 = AnimElem = 7
x = 0
y = 0

[State 3610, PosAdd]
type = PosAdd
trigger1 = AnimElem = 7
x = 16

[State 3610, PosSet]
type = PosSet
trigger1 = AnimElem = 7
y = 0

[State 3610, Landing Dust Explod]
type = Explod
trigger1 = AnimElem = 7
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3610, Landing Sound]
type = PlaySnd
trigger1 = AnimElem = 7
value = 52,0
channel = 1

[State 3610, Turn]
type = Turn
trigger1 = AnimElem = 10

[State 3610, Jump sound]
type = PlaySnd
trigger1 = AnimElem = 16
value = 40,0
channel = 3

[State 3610, Woosh sound]
type = PlaySnd
trigger1 = AnimElem = 19
trigger2 = AnimElem = 22
trigger3 = AnimElem = 25
trigger4 = AnimElem = 30
value = 1,5

[State 3610, Dust Helper]
type = Helper
trigger1 = AnimElem = 16
helperType = Normal
stateNo = 8100
ID = 8100
name = "Guren Senpukyaku Dust"
posType = P1
ownPal = 1

[State 3610, VelSet]
type = VelSet
trigger1 = AnimElem = 16
y = -2.95

[State 3610, Gravity]
type = VelAdd
trigger1 = AnimElemTime(16) > 0
y = 0.1

[State 3610, Fire sound]
type = PlaySnd
trigger1 = AnimElem = 31
value = 1100,1
channel = 4

[State 3610, Flames]
type = Explod
trigger1 = AnimElem = 31
ID = 3615
anim = 3615
sprPriority = 3
posType = P1
pos = 18, -18
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3610, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 + HitCount)
trigger1 = AnimElem = 31
ID = 3610
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 182 < 7, 7, fvar(11) * 182)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 24,24
guard.pauseTime = 24,24
animType = DiagUp
air.animType = DiagUp
fall.animType = DiagUp
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -3.5,-10
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -3.5, -10
air.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 49), var(36) := -107
palFX.time = 71
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3610, Flame Particle Timer Set]
type = VarSet
trigger1 = MoveHit = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
var(45) = 71
ignoreHitPause = 1
persistent = 0

[State 3610, Flame Particles]
type = Helper
trigger1 = !NumHelper(8150)
trigger1 = MoveHit = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
trigger1 = var(43) := (Target, ID)
helperType = Normal
stateNo = 8150
ID = 8150
name = "Flame Particles"
posType = P2
ownPal = 1
ignoreHitPause = 1

[State 3610, TargetState]
type = TargetState
trigger1 = MoveHit && NumTarget(3610)
value = 3615
ID = 3610
ignoreHitPause = 1
persistent = 0

[State 3610, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(32) >= 0
moveType = I

[State 3610, End]
type = ChangeState
trigger1 = pos y > -vel y && AnimElemTime(7) >= 0
value = 3601



;===========<GUREN SENPUKYAKU (TARGET)>==========
[StateDef 3605]
type = A
moveType = H
physics = N
velSet = 0,0

[State 3605, PalFX]
type = PalFX
trigger1 = !Time
time = 104
mul = 128, 128, 128
sinAdd = 96, 96, 96, 4
ignoreHitPause = 1

[State 3605, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 1,0
ignoreHitPause = 1

[State 3605, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
trigger1 = GetHitVar(AnimType) = [3,5]
value = 5030

[State 3605, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
trigger1 = (GetHitVar(AnimType) = [4,5]) && (SelfAnimExist(5047 + GetHitVar(AnimType)))
value = 5047 + GetHitVar(AnimType)

[State 3605, ChangeAnim]
type = ChangeAnim
trigger1 = Time > 0
value = Anim

[State 3605, ChangeState]
type = ChangeState
trigger1 = HitShakeOver
value = 3606


;Target, knocked away
[StateDef 3606]
type = A
moveType = H
physics = N
ctrl = 0

[State 3606, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 1,0
ignoreHitPause = 1

[State 3606, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != [5000, 5199]
trigger1 = SelfAnimExist(5030)
value = 5030

[State 3606, VelAdd]
type = VelAdd
trigger1 = Time > 0
y = 0.25/1.75

[State 3606, VelSet]
type = VelSet
trigger1 = !Time
x = 0.5
y = -12.75/1.75

[State 3606, ChangeState]
type = ChangeState
triggerAll = HitFall
trigger1 = HitOver
trigger2 = vel y > 0
trigger2 = pos y >= const(movement.air.getHit.groundLevel)
value = 3608

[State 3606, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 3607


;Target, air get-hit (transition)
[StateDef 3607]
type = A
moveType = H
physics = N

[State 3607, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 1,0
ignoreHitPause = 1

[State 3607, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
trigger1 = SelfAnimExist(5035)
trigger1 = Anim != [5051,5059]
trigger1 = Anim != 5090
value = 5035

[State 3607, VelAdd]
type = VelAdd
trigger1 = Time > 0
y = 0.25/1.75

[State 3607, ChangeState]
type = ChangeState
triggerAll = HitFall
trigger1 = HitOver
trigger2 = !AnimTime
trigger3 = vel y > 0
trigger3 = pos y >= const(movement.air.getHit.groundLevel)
trigger4 = !Time
trigger4 = Anim != 5035
value = 3608


;Target, air get-hit (falling)
[StateDef 3608]
type = A
moveType = H
physics = N

[State 3608, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 1,0
ignoreHitPause = 1

[State 3608, ChangeAnim]
type = ChangeAnim
trigger1 = !AnimTime
trigger1 = Anim = 5035
trigger2 = !Time
trigger2 = Anim != 5035
trigger2 = (Anim != [5051, 5059]) && (Anim != [5061, 5069])
trigger2 = Anim != 5090
value = 5050

[State 3608, ChangeAnim]
type = ChangeAnim
trigger1 = Anim = [5050,5059]
trigger1 = vel y >= ifElse(Anim = 5050, Const720p(4), Const720p(-8))
trigger1 = SelfAnimExist(Anim + 10)
value = Anim + 10
persistent = 0

[State 3608, VelAdd]
type = VelAdd
trigger1 = Time > 0
y = 0.25/1.75

[State 3608, SelfState]
type = SelfState
triggerAll = vel y > 0
triggerAll = pos y >= const(movement.air.getHit.groundRecover.ground.threshold)
triggerAll = Alive
triggerAll = CanRecover
trigger1 = command = "recovery"
value = 5200

[State 3608, SelfState]
type = SelfState
triggerAll = vel y > const(movement.air.getHit.airRecover.threshold)
triggerAll = Alive
triggerAll = CanRecover
trigger1 = command = "recovery"
value = 5210

[State 3608, SelfState]
type = SelfState
trigger1 = vel y > 0
trigger1 = pos y >= ifElse((Anim = [5051, 5059]) || (Anim = [5061, 5069]), 0, const(movement.air.getHit.groundLevel))
value = 5100



;===========<GUREN SENPUKYAKU FINISH (TARGET)>==========
[StateDef 3615]
type = A
moveType = H
physics = N
velSet = 0,0

[State 3615, ScreenBound]
type = ScreenBound
trigger1 = Alive
value = 0
moveCamera = 1,0
ignoreHitPause = 1

[State 3615, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
trigger1 = GetHitVar(AnimType) = [3,5]
value = 5030

[State 3615, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
trigger1 = (GetHitVar(AnimType) = [4,5]) && (SelfAnimExist(5047 + GetHitVar(AnimType)))
value = 5047 + GetHitVar(AnimType)

[State 3615, ChangeAnim]
type = ChangeAnim
trigger1 = Time > 0
value = Anim

[State 3615, ChangeState]
type = ChangeState
trigger1 = HitShakeOver
value = 3616


;Target, knocked away
[StateDef 3616]
type = A
moveType = H
physics = N
ctrl = 0

[State 3616, ScreenBound]
type = ScreenBound
trigger1 = Alive
value = 0
moveCamera = 1,0
ignoreHitPause = 1

[State 3616, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != [5000, 5199]
trigger1 = SelfAnimExist(5030)
value = 5030

[State 3616, VelAdd]
type = VelAdd
trigger1 = Time > 0
y = GetHitVar(yAccel)

[State 3616, HitVelSet]
type = HitVelSet
trigger1 = !Time
x = 1
y = 1

[State 3616, ChangeState]
type = ChangeState
triggerAll = HitFall
trigger1 = HitOver
trigger2 = vel y > 0
trigger2 = pos y >= const(movement.air.getHit.groundLevel)
value = 3618

[State 3616, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 3617


;Target, air get-hit (transition)
[StateDef 3617]
type = A
moveType = H
physics = N

[State 3617, ScreenBound]
type = ScreenBound
trigger1 = Alive
value = 0
moveCamera = 1,0
ignoreHitPause = 1

[State 3617, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
trigger1 = SelfAnimExist(5035)
trigger1 = Anim != [5051,5059]
trigger1 = Anim != 5090
value = 5035

[State 3617, VelAdd]
type = VelAdd
trigger1 = Time > 0
y = GetHitVar(yAccel)

[State 3617, ChangeState]
type = ChangeState
triggerAll = HitFall
trigger1 = HitOver
trigger2 = !AnimTime
trigger3 = vel y > 0
trigger3 = pos y >= const(movement.air.getHit.groundLevel)
trigger4 = !Time
trigger4 = Anim != 5035
value = 3618


;Target, air get-hit (falling)
[StateDef 3618]
type = A
moveType = H
physics = N

[State 3618, ScreenBound]
type = ScreenBound
trigger1 = Alive
value = 0
moveCamera = 1,0
ignoreHitPause = 1

[State 3618, ChangeAnim]
type = ChangeAnim
trigger1 = !AnimTime
trigger1 = Anim = 5035
trigger2 = !Time
trigger2 = Anim != 5035
trigger2 = (Anim != [5051, 5059]) && (Anim != [5061, 5069])
trigger2 = Anim != 5090
value = 5050

[State 3618, ChangeAnim]
type = ChangeAnim
trigger1 = Anim = [5050,5059]
trigger1 = vel y >= ifElse(Anim = 5050, Const720p(4), Const720p(-8))
trigger1 = SelfAnimExist(Anim + 10)
value = Anim + 10
persistent = 0

[State 3618, VelAdd]
type = VelAdd
trigger1 = Time > 0
y = GetHitVar(yAccel)

[State 3618, SelfState]
type = SelfState
triggerAll = vel y > 0
triggerAll = pos y >= const(movement.air.getHit.groundRecover.ground.threshold)
triggerAll = Alive
triggerAll = CanRecover
trigger1 = command = "recovery"
value = 5200

[State 3618, SelfState]
type = SelfState
triggerAll = vel y > const(movement.air.getHit.airRecover.threshold)
triggerAll = Alive
triggerAll = CanRecover
trigger1 = command = "recovery"
value = 5210

[State 3618, SelfState]
type = SelfState
trigger1 = vel y > 0
trigger1 = pos y >= ifElse((Anim = [5051, 5059]) || (Anim = [5061, 5069]), 0, const(movement.air.getHit.groundLevel))
value = 5100



;========================<DOUBLE SHINKU HADOKEN>=============================
[StateDef 4000]
type = S
physics = N
moveType = I
anim = 0
ctrl = 0
velSet = 0,0
sprPriority = 1
faceP2 = 1

[State 4000, ChangeAnim]
type = ChangeAnim
trigger1 = abs(Partner, P2Dist x - P2Dist x) > 10
trigger1 = Partner, P2Dist x > P2Dist x
trigger1 = Anim = 0
value = 105

[State 4000, ChangeAnim]
type = ChangeAnim
trigger1 = abs(Partner, P2Dist x - P2Dist x) > 10
trigger1 = Partner, P2Dist x < P2Dist x
trigger1 = Anim = 0
value = 110

[State 4000, Dash Backwards]
type = VelSet
trigger1 = AnimElem = 2 && Anim = 105
x = const(velocity.run.back.x)
y = const(velocity.run.back.y)

[State 4000, Back Dash Sound]
type = PlaySnd
trigger1 = AnimElem = 2 && Anim = 105
value = 105,0

[State 4000, VelSet]
type = VelSet
trigger1 = AnimElem = 2 && Anim = 110
x = 8.125

[State 4000, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(2) > 0
x = 0.09765625 * ifElse(Anim = 110, -1, 1)

[State 4000, Dash Sound]
type = PlaySnd
trigger1 = Anim = 110 && AnimElemTime(1) = 0
value = 110,0

[State 4000, Dust Helper]
type = Helper
trigger1 = AnimElem = 2
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
facing = ifElse(Anim = 105, -1, 1)
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 4000, ChangeState]
type = ChangeState
trigger1 = Partner, StateNo = 3601
value = 4001

[State 4000, End]
type = ChangeState
triggerAll = !AnimTime
trigger1 = Anim = 105
trigger2 = Anim = 110
value = ifElse(Anim = 105, 106, 111)


;Success
[StateDef 4001]
moveType = A
velSet = 0,0

[State 4001, Landing Sound]
type = PlaySnd
trigger1 = !Time && (Anim = 105 || Anim = 110)
value = 100,1

[State 4001, Landing Dust Explod]
type = Explod
trigger1 = !Time && (Anim = 105 || Anim = 110)
anim = 8102
sprpriority = -3
postype = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 4001, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 4001

[State 4001, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000,2999]) && var(7)) || var(20)

[State 4001, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 4001, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 4001, Corner Push]
type = VarSet
trigger1 = 1
fvar(5) = 0

[State 4001, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 43

[State 4001, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 4001, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 4001, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(7) < -1
time = 1
value = SCA

[State 4001, Voice 1]
type = PlaySnd
trigger1 = AnimElem = 3
value = 4001,0
channel = 0

[State 4001, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 6
value = 1000,0
channel = 0

[State 4001, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;========================<SORYUKEN>=============================
[StateDef 4100]
type = S
physics = N
moveType = A
anim = 4100
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -3000
faceP2 = 1

[State 4100, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000,2999]) && var(7)) || var(20)

[State 4100, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 4100, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 4100, Corner Push]
type = VarSet
trigger1 = 1
fvar(5) = 0

[State 4100, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 43

[State 4100, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 4100, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 4100, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(4) < 0
time = 1
value = SCA

[State 4100, Jumping Sound]
type = PlaySnd
trigger1 = !Time
value = 40,0
channel = 1

[State 4100, Woosh sound]
type = PlaySnd
trigger1 = AnimElem = 5
value = 1,5
channel = 3

[State 4100, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = !Time
stateType = A
physics = N

[State 4100, Dust Helper]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8103
ID = 8100
name = "Soryuken Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 4100, VelSet]
type = VelSet
trigger1 = AnimElem = 3
x = P2Dist x / 30
y = -14.25

[State 4100, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(3) > 0
y = 1.171875

[State 4100, Spark XY]
type = Null
trigger1 = AnimElem = 6
trigger1 = var(35) := 46 || var(36) := -79
trigger2 = AnimElem = 7
trigger2 = var(35) := 54 || var(36) := -37

[State 4100, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 6
ID = 4100
attr = S, HA
hitFlag = MAF
guardFlag =
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -1
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 4100, TargetDrop]
type = TargetDrop
trigger1 = NumTarget(41000) > 1
ID = 4100
keepOne = 1
excludeID = 4100
ignoreHitPause = 1

[State 4100, TargetState]
type = TargetState
trigger1 = MoveHit && NumTarget(4100)
value = 3505
ID = 4100
ignoreHitPause = 1
persistent = 0

[State 4100, ChangeState]
type = ChangeState
triggerAll = NumPartner && NumTarget
triggerAll = Partner, Facing != Facing
trigger1 = pos y > -vel y
trigger1 = MoveHit && Partner, MoveHit && Target, Alive
trigger1 = Target, StateType != A
value = 4101

[State 4100, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 1301


;Connected
[StateDef 4101]
type = S
moveType = A
physics = N
anim = 4101
ctrl = 0
velSet = 0,0
moveHitPersist = 1

[State 4101, PosAdd]
type = PosAdd
trigger1 = !Time
x = ceil(P2Dist X - 50)

[State 4101, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 4101, Impact Dust]
type = Explod
trigger1 = !Time
anim = 8105
sprPriority = -3
posType = P1
scale = 0.325,0.325
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 4101, Impact Sound]
type = PlaySnd
trigger1 = !Time
value = 1300,1
channel = 4

[State 4101, HK wooshes]
type = PlaySnd
trigger1 = AnimElem = 7
value = 1,5

[State 4101, HP wooshes]
type = PlaySnd
trigger1 = AnimElem = 17 || AnimElem = 21
value = 1,2

[State 4101, Hit Sound]
type = Null
trigger1 = AnimElem = 18 || AnimElem = 22
trigger1 = var(31) := 2
trigger2 = AnimElem = 8 || AnimElem = 9
trigger2 = var(31) := 5

[State 4101, Spark XY]
type = Null
trigger1 = AnimElem = 8
trigger1 = var(35) := 59 || var(36) := -106
trigger2 = AnimElem = 9
trigger2 = var(35) := 54 || var(36) := -97
trigger3 = AnimElem = 18
trigger3 = var(35) := 60 || var(36) := -77
trigger4 = AnimElem = 22
trigger4 = var(35) := 49 || var(36) := -77

[State 4101, HitDef: Low]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 18
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10, -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 4101, HitDef: High]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 8 || AnimElem = 9
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10, -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 4101, Penultimate Hit]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 22
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 49 < 7, 7, fvar(11) * 49)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Up
air.animType = Up
fall.animType = Up
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0, -9.125
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = 0, -9.125
air.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10, -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 4101, Afterimage helper]
type = Helper
trigger1 = AnimElem = 29
helperType = Normal
stateNo = 14000
ID = 14000
name = "Afterimage Helper"
posType = P1
superMoveTime = 255
ownPal = 1

[State 4101, Soryuken Portraits]
type = Helper
trigger1 = AnimElem = 29
helperType = Normal
stateNo = 8521
ID = 8521
name = "Soryuken Portraits"
posType = P1
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 4101, Super Pause FX]
type = Helper
trigger1 = AnimElem = 29
helperType = Normal
stateNo = 8520
ID = 8500
name = "Superpause FX"
posType = P1
pos = 10, -28
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 4101, Super Pause FX (Partner)]
type = Helper
trigger1 = AnimElem = 29
helperType = Normal
stateNo = 8520
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(P2Dist x + Partner, P2Dist x) - 5,-28
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 4101, Super Pause]
type = SuperPause
trigger1 = AnimElem = 29
time = 43
moveTime = 43
p2DefMul = 1
unHittable = 0
anim = -1
sound = s8500,0
darken = 0

[State 4101, Voice 1]
type = PlaySnd
trigger1 = AnimElem = 29
value = 1300,0
channel = 0

[State 4101, Woosh sound]
type = PlaySnd
trigger1 = AnimElem = 30
value = 1,2
channel = 1

[State 4101, Jump Sound]
type = PlaySnd
trigger1 = AnimElemTime(32) = 1
value = 40,0
channel = 4

[State 4101, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 32
stateType = A
physics = N

[State 4101, Dust Helper]
type = Helper
trigger1 = AnimElemTime(32) = 1
helperType = Normal
stateNo = 8100
ID = 8100
name = "Shoryuken Dust"
posType = P1
ownPal = 1

[State 4101, VelSet]
type = VelSet
trigger1 = AnimElemTime(32) = 2
y = -9.375

[State 4101, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(32) > 2
y = 0.5859375

[State 4101, MoveHitReset]
type = MoveHitReset
trigger1 = AnimElem = 32
ignoreHitPause = 1

[State 4101, Final Hit]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 + HitCount)
trigger1 = AnimElem = 33
ID = 4101
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 189 < 7, 7, fvar(11) * 189)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 0,0
guard.pauseTime = 0,0
animType = Up
air.animType = Up
fall.animType = Up
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0, -10.125
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = 0, -10.125
air.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 27), var(36) := -112
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 4101, Voice 2]
type = PlaySnd
trigger1 = AnimElemTime(34) = -1
value = 1100,0
channel = 0

[State 4101, Slowdown Helper]
type = Helper
trigger1 = AnimElemTime(33) >= 0 && MoveHit
helperType = Normal
stateNo = 14101
ID = 14101
name = "Superpause FX"
posType = P1
superMoveTime = 255
persistent = 0

[State 4101, Kanji Helper]
type = Helper
trigger1 = AnimElemTime(34) = -1
helperType = Normal
stateNo = 4105
ID = 4105
name = "Superpause FX"
posType = P1
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 4101, Super Pause]
type = SuperPause
trigger1 = AnimElemTime(34) = -1
time = 60
p2DefMul = 1
unHittable = 1
anim = -1
darken = 0

[State 4101, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 4110


;Landing
[StateDef 4110]
type = S
anim = 4110
physics = N
moveType = I
velSet = 0,0

[State 4110, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 4110, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 4110, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 4110, ChangeState]
type = ChangeState
trigger1 = WinKO
value = 4111

[State 4110, End]
type = ChangeState
trigger1 = !AnimTime
trigger2 = !NumTarget && AnimElemTime(2) >= 0
value = 0
ctrl = 1



;========================<WIN BY SOURYKEN>=============================
[Statedef 4111]
type = S

[State 4111, Voice]
type = PlaySnd
trigger1 = AnimElem = 2 && Anim = 4110
value = 181, 0 + (Random % 2)
channel = 0

[State 4111, ChangeAnim]
type = ChangeAnim
trigger1 = Anim = 4110 && AnimElemTime(5) = 0
value = 181
elem = 4

[State 4111, ChangeState]
type = ChangeState
trigger1 = PrevStateNo = 4110
value = 180
ctrl = 1



;========================<SHIN GOKU MESSATSU>=============================
[StateDef 4200]
type = S
physics = N
moveType = A
anim = 4200
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -3000
faceP2 = 1

[State 4200, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000,2999]) && var(7)) || var(20)

[State 4200, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 4200, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 4200, Corner Push]
type = VarSet
trigger1 = Time = 3
fvar(5) = 0

[State 4200, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 47

[State 4200, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 4200, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 4200, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(3) < 0
time = 1
value = SCA

[State 4200, Shin Goku Messatsu Portraits]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8522
ID = 8522
name = "Shin Goku Messatsu Portraits"
posType = P1
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 4200, Super Pause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8520
ID = 8500
name = "Superpause FX"
posType = P1
pos = 4, -73
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 4200, Super Pause FX (Partner)]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8520
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(P2Dist x + Partner, P2Dist x) - 4, -73
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 4200, Super Pause]
type = SuperPause
trigger1 = !Time
time = 43
moveTime = 43
p2DefMul = 1
unHittable = 0
anim = -1
sound = s8500,0
darken = 0

[State 4200, Afterimage helper]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 14000
ID = 14000
name = "Afterimage Helper"
posType = P1
superMoveTime = 255
ownPal = 1

[State 4200, Voice]
type = PlaySnd
trigger1 = !Time
value = 730,10
channel = 1

[State 4200, Dash Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 41,0
channel = 1

[State 4200, Dust Helper]
type = Helper
trigger1 = AnimElem = 2
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 4200, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x = 8

[State 4200, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 2
attr = S, HT
hitFlag = M
priority = 7, Miss
getPower = 0,0
givePower = 0,0
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
hitSound = -1 + 0 * (var(31) := 800)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 0)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 72), var(36) := -60
numHits = 0
p1StateNo = 4201

[State 4200, VelSet]
type = VelSet
trigger1 = AnimElem = 4
x = 0

[State 4200, Dash End Sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 100,0

[State 4200, Landing Dust Explod]
type = Explod
trigger1 = AnimElem = 4
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 4200, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Success
[Statedef 4201]
type = S
physics = N
moveType = A
anim = 4201
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 4201, VarSet]
type = VarSet
trigger1 = !Time && NumTarget
var(10) = 0

[State 4201, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 4205

[State 4201, TargetBind]
type = TargetBind
trigger1 = NumPartner
trigger1 = Partner, StateNo != [3801,3810]
trigger1 = var(10) := 1
pos = 45,0

[State 4201, BindToTarget]
type = BindToTarget
trigger1 = NumPartner && NumTarget && var(10) != 1
trigger1 = Partner, StateNo = [3801,3810]
pos = ifElse(Target, Facing = Facing, -45, 45),0, Foot

[State 4201, ChangeState]
type = ChangeState
triggerAll = NumPartner && NumTarget
triggerAll = Partner, Facing != Facing
trigger1 = Partner, NumTarget && Target, Alive
trigger1 = Target, StateType != A
value = 4210


;Target
[StateDef 4205]
type = S
moveType = H
physics = N
velSet = 0,0

[State 4205, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 4205, HitFallSet]
type = HitFallSet
trigger1 = !Time
value = 0

[State 4205, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 5000

[State 4205, ChangeAnim]
type = ChangeAnim
trigger1 = Time > 0
value = Anim


;Finish
[StateDef 4210]
type = S
anim = 4210
physics = N
moveType = A
velSet = 0,0

[State 4210, HitAdd]
type = HitAdd
trigger1 = AnimElem = 2 || AnimElem = 3 || AnimElem = 4 || AnimElem = 5 || AnimElem = 6 || AnimElem = 7 || AnimElem = 8 || AnimElem = 9
trigger2 = AnimElem = 10 || AnimElem = 11 || AnimElem = 12 || AnimElem = 13 || AnimElem = 14 || AnimElem = 15 || AnimElem = 16
value = 1

[State 4210, HitCount]
type = VarAdd
trigger1 = AnimElem = 2 || AnimElem = 3 || AnimElem = 4 || AnimElem = 5 || AnimElem = 6 || AnimElem = 7 || AnimElem = 8 || AnimElem = 9
trigger2 = AnimElem = 10 || AnimElem = 11 || AnimElem = 12 || AnimElem = 13 || AnimElem = 14 || AnimElem = 15 || AnimElem = 16
var(13) = 1

[State 4210, Damage]
type = TargetLifeAdd
trigger1 = AnimElem = 2 || AnimElem = 3 || AnimElem = 4 || AnimElem = 5 || AnimElem = 6 || AnimElem = 7 || AnimElem = 8 || AnimElem = 9
trigger2 = AnimElem = 10 || AnimElem = 11 || AnimElem = 12 || AnimElem = 13 || AnimElem = 14 || AnimElem = 15 || AnimElem = 16
value = ceil(ifElse(21 * fvar(11) < 7, -7, -21 * fvar(11)))
kill = AnimElem = 16

[State 4210, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = AnimElem = 2 || AnimElem = 3 || AnimElem = 4 || AnimElem = 5 || AnimElem = 6 || AnimElem = 7 || AnimElem = 8 || AnimElem = 9
trigger2 = AnimElem = 10 || AnimElem = 11 || AnimElem = 12 || AnimElem = 13 || AnimElem = 14 || AnimElem = 15 || AnimElem = 16
value = 36

[State 4210, HitSound]
type = PlaySnd
trigger1 = AnimElem = 2 || AnimElem = 3 || AnimElem = 4 || AnimElem = 5 || AnimElem = 6 || AnimElem = 7 || AnimElem = 8 || AnimElem = 9
trigger2 = AnimElem = 10 || AnimElem = 11 || AnimElem = 12 || AnimElem = 13 || AnimElem = 14 || AnimElem = 15 || AnimElem = 16
value = 2,2
channel = 2

[State 4210, Hit Sparks]
type = Helper
trigger1 = AnimElem = 2 || AnimElem = 3 || AnimElem = 4 || AnimElem = 5 || AnimElem = 6 || AnimElem = 7 || AnimElem = 8 || AnimElem = 9
trigger2 = AnimElem = 10 || AnimElem = 11 || AnimElem = 12 || AnimElem = 13 || AnimElem = 14 || AnimElem = 15 || AnimElem = 16
helperType = Normal
stateNo = 8014
ID = 8000
name = "Spark"
sprPriority = 5
postype = P2
pos = -30 + Random % 60, (Target, const(size.mid.pos.y)) - 30 + Random % 60
facing = ifElse(Random % 2, -1, 1)
ownPal = 1
onTop = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 4210, Orochi Skull Sound]
type = PlaySnd
trigger1 = AnimElem = 17
value = 3500,1
channel = 1

[State 4210, Orochi Skull]
type = Helper
trigger1 = AnimElem = 17
helperType = Normal
stateNo = 3525
ID = 3525
name = "Orochi Skull"
posType = P2
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 4210, Flame Particle Timer Set]
type = VarSet
trigger1 = AnimElem = 17 && NumTarget
var(45) = 98
ignoreHitPause = 1
persistent = 0

[State 4210, Flame Particles]
type = Helper
trigger1 = AnimElem = 17 && NumTarget
trigger1 = var(43) := (Target, ID)
helperType = Normal
stateNo = 8150
ID = 8150
name = "Flame Particles"
posType = P2
ownPal = 1
ignoreHitPause = 1

[State 4210, Turn]
type = Turn
trigger1 = AnimElem = 17

[State 4210, ChangeState]
type = ChangeState
trigger1 = AnimElem = 17 && WinKO
value = 4211

[State 4210, Voice]
type = PlaySnd
trigger1 = AnimElemTime(17) = 55
value = 198,0
channel = 0

[State 4210, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;========================<WIN BY SHIN GOKU MESSATSU>=============================
[Statedef 4211]
type = S

[State 4211, Voice]
type = PlaySnd
trigger1 = Time = 70 && PrevStateNo = 4210
value = 185,1
channel = 0

[State 4211, ChangeAnim]
type = ChangeAnim
trigger1 = !Time && PrevStateNo = 4210
value = 4211

[State 4111, ChangeState]
type = ChangeState
trigger1 = Time >= 120 && RoundState = 3
value = ifElse(RoundState = 3, 180, 0)
value = 180
ctrl = 1
