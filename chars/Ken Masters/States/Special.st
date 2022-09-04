; _________________________________________
;| Ken by Jmorphman                        |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==============================================================================================
;========================================<SPECIAL MOVES>=======================================
;==============================================================================================

;========================<HADOKEN>=============================
[StateDef 1000]
type = S
physics = N
moveType = A
anim = 1000
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
;ifElse((command = "z" || command = "rlsz"), 2, ifElse((command = "y" || command = "rlsy"), 1, 0))
var(10) = ifElse((NumExplod(90000220) || NumExplod(90000225)), 2, ifElse((NumExplod(90000210) || NumExplod(90000215)), 1, 0))

[State 1000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1000, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 0, 1000, ifElse(var(10) = 1, 1010, 1020))

[State 1000, Voice]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1000,0 + 10 * (var(40) = 1)
channel = 0

[State 1000, Hadoken sound effect]
type = PlaySnd
trigger1 = AnimElemTime(5) = 1
value = 1000,1
channel = 1

[State 1000, Projectile]
type = Helper
trigger1 = AnimElemTime(5) = 1
helperType = Normal
stateNo = 1005
ID = 1005
name = "Hadoken Projectile"
posType = P1
pos = 87,-64
size.xScale = 0.5
size.yScale = 0.5
ownPal = 1

[State 1000, Width]
type = Width
trigger1 = AnimElemTime(5) = 0
value = 45,0

[State 1000, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;========================<EX HADOKEN>=============================
[StateDef 1030]
type = S
physics = N
moveType = A
anim = 1030
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 1030, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1030, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1030, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 26

[State 1030, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = -14, -68
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1030, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1030, Voice]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1000,0 + 10 * (var(40) = 1)
channel = 0

[State 1030, Hadoken sound effect]
type = PlaySnd
trigger1 = AnimElemTime(5) = 1
value = 1000,1
channel = 3

[State 1030, Projectile]
type = Helper
trigger1 = AnimElemTime(5) = 1
helperType = Normal
stateNo = 1035
ID = 1035
name = "Hadoken Projectile"
posType = P1
pos = 87,-64
size.xScale = 0.5
size.yScale = 0.5
ownPal = 1

[State 1030, Width]
type = Width
trigger1 = AnimElemTime(5) = 0
value = 45,0

[State 1030, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;=====================<SHORYUKEN>==========================
[StateDef 1100]
type = S
physics = N
moveType = A
anim = 1100
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1100, Remove Shoryuken fist overlay]
type = RemoveExplod
trigger1 = !Time && NumExplod(1124)
id = 1124
ignoreHitPause = 1

[State 1100, Remove Shoryuken flames (ground)]
type = RemoveExplod
trigger1 = !Time && NumExplod(1125)
id = 1125
ignoreHitPause = 1

[State 1100, Remove Shoryuken flames (ascending)]
type = RemoveExplod
trigger1 = !Time && NumExplod(1126)
id = 1126
ignoreHitPause = 1

[State 1100, Remove Shoryuken flames (fade away)]
type = RemoveExplod
trigger1 = !Time && NumExplod(1127)
id = 1127
ignoreHitPause = 1

[State 1100, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
;ifElse((command = "z" || command = "rlsz"), 2, ifElse((command = "y" || command = "rlsy"), 1, 0))
var(10) = ifElse((NumExplod(90000220) || NumExplod(90000225)), 2, ifElse((NumExplod(90000210) || NumExplod(90000215)), 1, 0))

[State 1100, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse(P2MoveType = H || P2Dist x > 110 || Random < 333, 2, ifElse(Random < 500 || P2Dist x > 65, 1, 0))

[State 1100, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 0, 1100, ifElse(var(10) = 1, 1110, 1120))

[State 1100, SFIII skip ground frame]
type = ChangeAnim
trigger1 = var(40) = 3 && AnimElemTime(6) = -2
value = Anim
elem = 6
ignoreHitPause = 1

[State 1100, Voice]
type = PlaySnd
trigger1 = !Time
value = 1100,0 + 10 * (var(40) = 1)
channel = 0

[State 1100, Woosh sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,2
channel = 1

[State 1100, Fire sound]
type = PlaySnd
trigger1 = AnimElem = 4 && var(10) = 2
value = 1100,1
channel = 3

[State 1100, Jump Sound]
type = PlaySnd
trigger1 = AnimElemTime(4) = 1 && var(40) != 3
trigger2 = AnimElem = 4 && var(40) = 3
value = 40,0
channel = 4

[State 1100, Fist Overlay]
type = Explod
trigger1 = AnimElem = 3 && var(10) = 2
ID = 1124
anim = ifElse(var(40) = 3, 11124, 1124)
bindTime = -1
sprPriority = 2
posType = P1
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 1100, Shoryuken Flames (Ground)]
type = Explod
trigger1 = !Time && var(10) = 2 && var(40) != 3
ID = 1125
anim = 1125
bindTime = 7
sprPriority = 3
posType = P1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 1100, Shoryuken Flames (Ascending)]
type = Explod
trigger1 = AnimElem = 4 && var(10) = 2 && var(40) != 3
ID = 1126
anim = 1126
bindTime = -1
removeTime = 21
sprPriority = 3
posType = P1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 1100, Shoryuken Flames (Fade away)]
type = Explod
trigger1 = AnimElem = 6 && var(10) = 2 && var(40) != 3
ID = 1127
anim = 1127
sprPriority = 3
posType = P1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 1100, Shoryuken Flames (SFIII)]
type = Explod
trigger1 = !Time && var(10) = 2 && var(40) = 3
ID = 1125
anim = 11125
bindTime = -1
sprPriority = 3
posType = P1
pos = 12,-28
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 1100, ModifyExplod]
type = ModifyExplod
trigger1 = AnimElem = 2 && NumExplod(1125) && var(40) = 3
ID = 1125
posType = P1
pos = 21,-39
ignoreHitPause = 0

[State 1100, ModifyExplod]
type = ModifyExplod
trigger1 = AnimElem = 3 && NumExplod(1125) && var(40) = 3
ID = 1125
posType = P1
pos = 38,-82
ignoreHitPause = 0

[State 1100, ModifyExplod]
type = ModifyExplod
trigger1 = AnimElemTime(4) >= 0 && NumExplod(1125) && var(40) = 3
ID = 1125
posType = P1
pos = 14,-143
ignoreHitPause = 0

[State 1100, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 4
stateType = A
physics = N

[State 1100, Dust Helper]
type = Helper
trigger1 = AnimElemTime(4) = 1 && var(40) != 3
trigger2 = AnimElem = 4 && var(40) = 3
helperType = Normal
stateNo = 8100
ID = 8100
name = "Shoryuken Dust"
posType = P1
ownPal = 1

[State 1100, VelSet]
type = VelSet
trigger1 = AnimElemTime(4) = 2 && var(40) != 3
trigger2 = AnimElem = 4 && var(40) = 3
x = ifElse(var(10) = 2, 13.75, ifElse(var(10) = 1, 9.375, 5))
y = ifElse(var(10) = 2, -12.5, ifElse(var(10) = 1, -9.375, -6.25))

[State 1100, VelAdd]
type = VelAdd
triggerAll = vel x >= 0
trigger1 = AnimElemTime(4) > 2 && var(40) != 3
trigger2 = AnimElemTime(4) > 0 && var(40) = 3
x = -0.78125

[State 1100, VelSet]
type = VelSet
trigger1 = vel x < 0
x = 0

[State 1100, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(4) > 2 && var(40) != 3
trigger2 = AnimElemTime(4) > 0 && var(40) = 3
y = 0.5859375

[State 1100, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(3) < 0 && var(10) != 2
trigger2 = AnimElemTime(4) < 0 && var(10) = 2
value = SCA
time = 1

[State 1100, Ground Hit (LP/MP)]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 3 && ifElse(var(40) = 3, !var(10), var(10) != 2)
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 1, 70, 112) < 7, 7, fvar(11) * ifElse(var(10) = 1, 70, 112))), 7
getPower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Hard
fall.animType = Hard
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = ifElse(var(10), -0.5, -2.5), -10
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = ifElse(var(10), -0.5, -2.5), -10
air.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 36), var(36) := -79
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1100, Ground Hit Hit (SFIII MP)]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 3 && var(40) = 3 && var(10) = 1
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 1, 70, 112) < 7, 7, fvar(11) * ifElse(var(10) = 1, 70, 112))), 7
getPower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Hard
fall.animType = Hard
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -0.25,0
ground.cornerPush.velOff = 0
guard.velocity = -0.25
guard.cornerPush.velOff = 0
air.velocity = ifElse(var(10), -0.5, -2.5), -10
air.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 36), var(36) := -79
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1100, Air Hit (LP/MP)]
type = HitDef
triggerAll = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 4 && !var(10) && !MoveContact && !MoveReversed
trigger2 = AnimElem = 4 && var(10) = 1
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 56 < 7, 7, fvar(11) * 56)), 7
getPower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Hard
fall.animType = Hard
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2.5, -10
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -2.5, -10
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 27), var(36) := -112
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1100, Ground Hit 1 (HP)]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 2 && var(10) = 2 && var(40) != 3
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 7
getPower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -0.5, -10
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -0.5, -10
air.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 27), var(36) := -40
palFX.time = 52
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1100, Ground Hit Hit 1 (SFIII HP)]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 2 && var(10) = 2 && var(40) = 3
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 7
getPower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Hard
fall.animType = Hard
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -0.25,0
ground.cornerPush.velOff = 0
guard.velocity = -0.25
guard.cornerPush.velOff = 0
air.velocity = -0.5, -10
air.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 27), var(36) := -40
palFX.time = 30
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1100, Flame Particle Timer Set]
type = VarSet
trigger1 = MoveHit = 1 && NumTarget && AnimElemTime(3) < 0 && var(10) = 2
trigger1 = !(Target, HitShakeOver)
var(45) = ifElse(var(40) = 3, 30, 52)
ignoreHitPause = 1
persistent = 0

[State 1100, Flame Particles]
type = Helper
trigger1 = !NumHelper(8150) && var(10) = 2
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

[State 1100, Ground Hit 2 (HP)]
type = HitDef
triggerAll = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 3 && var(10) = 2 && var(40) != 3
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 49 < 7, 7, fvar(11) * 49)), 7
getPower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -0.5, -10
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -0.5, -10
air.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 36), var(36) := -79
palFX.time = 53
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1100, Ground Hit Hit 2 (SFIII HP)]
type = HitDef
triggerAll = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 3 && var(10) = 2 && var(40) = 3
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 49 < 7, 7, fvar(11) * 49)), 7
getPower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Hard
fall.animType = Hard
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -0.25,0
ground.cornerPush.velOff = 0
guard.velocity = -0.25
guard.cornerPush.velOff = 0
air.velocity = -0.5, -10
air.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 36), var(36) := -79
palFX.time = 30
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1100, Flame Particle Timer Set]
type = VarSet
trigger1 = MoveHit = 1 && NumTarget && AnimElemTime(3) >= 0 && AnimElemTime(4) < 0 && var(10) = 2
trigger1 = !(Target, HitShakeOver)
var(45) = ifElse(var(40) = 3, 30, 53)
ignoreHitPause = 1
persistent = 0

[State 1100, Air Hit (HP)]
type = HitDef
triggerAll = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 4 && var(10) = 2
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 56 < 7, 7, fvar(11) * 56)), 7
getPower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2.5, -10
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -2.5, -10
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 27), var(36) := -112
palFX.time = 55
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1100, Flame Particle Timer Set]
type = VarSet
trigger1 = MoveHit = 1 && NumTarget && AnimElemTime(4) >= 0 && var(10) = 2
trigger1 = !(Target, HitShakeOver)
var(45) = 55
ignoreHitPause = 1
persistent = 0

[State 1100, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(6) >= 0
moveType = I

[State 1100, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 1101


;Landing
[StateDef 1101]
type = S
anim = 1101
physics = N
moveType = I
velSet = 0,0

[State 1101, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 1101, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1101, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0
channel = 1

[State 1101, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;========================<EX SHORYUKEN>=============================
[StateDef 1130]
type = S
physics = N
moveType = A
anim = 1130
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 1130, Remove Shoryuken fist overlay]
type = RemoveExplod
trigger1 = !Time && NumExplod(1124)
id = 1124
ignoreHitPause = 1

[State 1130, Remove Shoryuken flames (ground)]
type = RemoveExplod
trigger1 = !Time && NumExplod(1125)
id = 1125
ignoreHitPause = 1

[State 1130, Remove Shoryuken flames (ascending)]
type = RemoveExplod
trigger1 = !Time && NumExplod(1126)
id = 1126
ignoreHitPause = 1

[State 1130, Remove Shoryuken flames (fade away)]
type = RemoveExplod
trigger1 = !Time && NumExplod(1127)
id = 1127
ignoreHitPause = 1

[State 1130, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1130, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1130, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 25

[State 1130, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = 18, -37
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1130, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1130, SFIII skip ground frame]
type = ChangeAnim
trigger1 = var(40) = 3 && AnimElemTime(6) = -2
value = Anim
elem = 6
ignoreHitPause = 1

[State 1130, Voice]
type = PlaySnd
trigger1 = !Time
value = 1100,0 + 10 * (var(40) = 1)
channel = 0

[State 1130, Woosh sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,2
channel = 3

[State 1130, Fire sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1100,1
channel = 4

[State 1130, Jump Sound]
type = PlaySnd
trigger1 = AnimElemTime(4) = 1 && var(40) != 3
trigger2 = AnimElem = 4 && var(40) = 3
value = 40,0
channel = 5

[State 1130, Fist Overlay]
type = Explod
trigger1 = AnimElem = 3
ID = 1124
anim = ifElse(var(40) = 3, 11124, 1124)
bindTime = -1
sprPriority = 2
posType = P1
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 1130, Shoryuken Flames (Ground)]
type = Explod
trigger1 = !Time && var(40) != 3
ID = 1125
anim = 1125
bindTime = 7
sprPriority = 3
posType = P1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 1130, Shoryuken Flames (Ascending)]
type = Explod
trigger1 = AnimElem = 4 && var(40) != 3
ID = 1126
anim = 1126
bindTime = -1
removeTime = 21
sprPriority = 3
posType = P1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 1130, Shoryuken Flames (Fade away)]
type = Explod
trigger1 = AnimElem = 6 && var(40) != 3
ID = 1127
anim = 1127
sprPriority = 3
posType = P1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 1130, Shoryuken Flames (SFIII)]
type = Explod
trigger1 = !Time && var(40) = 3
ID = 1125
anim = 11135
bindTime = -1
sprPriority = 3
posType = P1
pos = 12,-28
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 1130, ModifyExplod]
type = ModifyExplod
trigger1 = AnimElem = 2 && NumExplod(1125) && var(40) = 3
ID = 1125
posType = P1
pos = 21,-39
ignoreHitPause = 0

[State 1130, ModifyExplod]
type = ModifyExplod
trigger1 = AnimElem = 3 && NumExplod(1125) && var(40) = 3
ID = 1125
posType = P1
pos = 38,-82
ignoreHitPause = 0

[State 1130, ModifyExplod]
type = ModifyExplod
trigger1 = AnimElemTime(4) >= 0 && NumExplod(1125) && var(40) = 3
ID = 1125
posType = P1
pos = 14,-143
ignoreHitPause = 0

[State 1130, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 4
stateType = A
physics = N

[State 1130, Dust Helper]
type = Helper
trigger1 = AnimElemTime(4) = 1 && var(40) != 3
trigger2 = AnimElem = 4 && var(40) = 3
helperType = Normal
stateNo = 8100
ID = 8100
name = "Shoryuken Dust"
posType = P1
ownPal = 1

[State 1130, VelSet]
type = VelSet
trigger1 = AnimElemTime(4) = 2 && var(40) != 3
trigger2 = AnimElem = 4 && var(40) = 3
x = 15.9375
y = -14.0625

[State 1130, VelAdd]
type = VelAdd
triggerAll = vel x >= 0
trigger1 = AnimElemTime(4) > 2 && var(40) != 3
trigger2 = AnimElemTime(4) > 0 && var(40) = 3
x = -0.78125

[State 1130, VelSet]
type = VelSet
trigger1 = vel x < 0
x = 0

[State 1130, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(4) > 2 && var(40) != 3
trigger2 = AnimElemTime(4) > 0 && var(40) = 3
y = 0.5859375

[State 1130, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(5) < 0
value = SCA
time = 1

[State 1130, Ground Hit 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 2 && var(40) != 3
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -0.5, -10
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -0.5, -10
air.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 27), var(36) := -40
palFX.time = 52
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1130, Ground Hit Hit 1 (SFIII)]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 2 && var(40) = 3
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
animType = Hard
air.animType = Hard
fall.animType = Hard
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -0.25,0
ground.cornerPush.velOff = 0
guard.velocity = -0.25
guard.cornerPush.velOff = 0
air.velocity = -0.5, -10
air.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 27), var(36) := -40
palFX.time = 30
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1130, Flame Particle Timer Set]
type = VarSet
trigger1 = MoveHit = 1 && NumTarget && AnimElemTime(3) < 0
trigger1 = !(Target, HitShakeOver)
var(45) = ifElse(var(40) = 3, 30, 52)
ignoreHitPause = 1
persistent = 0

[State 1130, Flame Particles]
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

[State 1130, Ground Hit 2]
type = HitDef
triggerAll = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 3 && var(40) != 3
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -0.5, -10
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -0.5, -10
air.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 36), var(36) := -79
palFX.time = 53
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1130, Ground Hit Hit 2 (SFIII)]
type = HitDef
triggerAll = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 3 && var(40) = 3
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
animType = Hard
air.animType = Hard
fall.animType = Hard
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -0.25,0
ground.cornerPush.velOff = 0
guard.velocity = -0.25
guard.cornerPush.velOff = 0
air.velocity = -0.5, -10
air.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 36), var(36) := -79
palFX.time = 30
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1130, Flame Particle Timer Set]
type = VarSet
trigger1 = MoveHit = 1 && NumTarget && AnimElemTime(3) >= 0 && AnimElemTime(4) < 0
trigger1 = !(Target, HitShakeOver)
var(45) = ifElse(var(40) = 3, 30, 53)
ignoreHitPause = 1
persistent = 0

[State 1130, Air Hit 1]
type = HitDef
triggerAll = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 4
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2.5, -10
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -2.5, -10
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 27), var(36) := -112
palFX.time = 55
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1130, Flame Particle Timer Set]
type = VarSet
trigger1 = MoveHit = 1 && NumTarget && AnimElemTime(4) >= 0 && AnimElemTime(5) < 0
trigger1 = !(Target, HitShakeOver)
var(45) = 53
ignoreHitPause = 1
persistent = 0

[State 1130, Air Hit 2]
type = HitDef
triggerAll = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 5
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 49 < 7, 7, fvar(11) * 49)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2.5, -10
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -2.5, -10
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 27), var(36) := -112
palFX.time = 56
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1130, Flame Particle Timer Set]
type = VarSet
trigger1 = MoveHit = 1 && NumTarget && AnimElemTime(5) = 0
trigger1 = !(Target, HitShakeOver)
var(45) = 56
ignoreHitPause = 1
persistent = 0

[State 1130, if the third hits on its last frame then mugen will think AnimElem = 5 for no goddamn reason so here's a duplicate flame timer]
type = VarSet
trigger1 = MoveHit = 1 && NumTarget && AnimElemTime(5) >= 1
trigger1 = !(Target, HitShakeOver)
var(45) = 56
ignoreHitPause = 1
persistent = 0

[State 1130, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(6) >= 0
moveType = I

[State 1130, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 1101



;=====================<TATSUMAKI SENPUKYAKU>==========================
[StateDef 1200]
type = S
physics = N
moveType = A
anim = 1200
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1200, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
;ifElse((command = "c" || command = "rlsc"), 2, ifElse((command = "b" || command = "rlsb"), 1, 0))
var(10) = ifElse((NumExplod(90000250) || NumExplod(90000255)), 2, ifElse((NumExplod(90000240) || NumExplod(90000245)), 1, 0))

[State 1200, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || P2Dist x > 189 || Random < 333), 2, ifElse(P2Dist x > 112, 1, 0))

[State 1200, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 0, 1200, ifElse(var(10) = 1, 1201, 1202))

[State 1200, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1200,0 + 10 * (var(40) = 1)
channel = 0

[State 1200, Jump sound]
type = PlaySnd
trigger1 = !Time
value = 40,0
channel = 1

[State 1200, Woosh sound]
type = PlaySnd
trigger1 = Time = 1
trigger2 = AnimElem = 7
trigger3 = AnimElem = 10
trigger4 = AnimElem = 13
trigger5 = AnimElem = 16 && var(10)
trigger6 = AnimElem = 19 && var(10)
trigger7 = AnimElem = 22 && var(10)
trigger8 = AnimElem = 25 && var(10)
trigger9 = AnimElem = 28 && var(10) = 2
trigger10 = AnimElem = 31 && var(10) = 2
value = 1,5

[State 1200, Dust Helper]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8100
ID = 8100
name = "Tatsumaki Senpukyaku Dust"
posType = P1
ownPal = 1

[State 1200, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = !Time
stateType = A
physics = N

[State 1200, VelSet]
type = VelSet
trigger1 = !Time
x = ifElse(var(10) = 2, 4.6875, ifElse(var(10) = 1, 3.90625, 3.125))
y = -5

[State 1200, VelAdd]
type = VelAdd
trigger1 = Time > 0 && AnimElemTime(7) < 0
trigger2 = AnimElemTime(13) > 0 && !var(10)
trigger3 = AnimElemTime(25) > 0 && var(10) = 1
trigger4 = AnimElemTime(31) > 0 && var(10) = 2
y = 0.5859375

[State 1200, VelSet]
type = VelSet
trigger1 = AnimElem = 7
y = 0

[State 1200, First Hit]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 2
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 16
ground.slideTime = 16
guard.hitTime = 16
air.hitTime = 120
ground.velocity = -9.02,0
ground.cornerPush.velOff = 0
guard.velocity = -9.02
guard.cornerPush.velOff = 0
air.velocity = -7.5, -5
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 27), var(36) := -68
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1200, HitDef (Opponent in front)]
type = HitDef
triggerAll = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 8
trigger2 = (AnimElem = 14 || AnimElem = 20) && var(10)
trigger3 = AnimElem = 26 && var(10) = 2
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
guard.pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 16
ground.slideTime = 16
guard.hitTime = 16
air.hitTime = 120
ground.velocity = -8.02, 0
ground.cornerPush.velOff = 0
guard.velocity = -8.02
guard.cornerPush.velOff = 0
air.velocity = -7.5, -5
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 60), var(36) := -71
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1200, HitDef (Opponent in back)]
type = HitDef
triggerAll = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 11
trigger2 = (AnimElem = 17 || AnimElem = 23) && var(10)
trigger3 = AnimElem = 29 && var(10) = 2
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
guard.pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 16
ground.slideTime = 16
guard.hitTime = 16
air.hitTime = 120
ground.velocity = 8.02, 0
ground.cornerPush.velOff = 0
guard.velocity = 8.02
guard.cornerPush.velOff = 0
air.velocity = 7.5, -5
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := -45), var(36) := -71
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1200, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(12) >= 0 && !var(10)
trigger2 = AnimElemTime(24) >= 0 && var(10) = 1
trigger3 = AnimElemTime(30) >= 0 && var(10) = 2
moveType = I

[State 1200, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 1205


;Landing
[StateDef 1205]
type = S
anim = 1205
physics = N
moveType = I
velSet = 0,0

[State 1205, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 1205, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1205, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0
channel = 1

[State 1205, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;=====================<SFIII TATSUMAKI SENPUKYAKU>==========================
[StateDef 1210]
type = S
physics = N
moveType = A
anim = 1210
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1210, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
;ifElse((command = "c" || command = "rlsc"), 2, ifElse((command = "b" || command = "rlsb"), 1, 0))
var(10) = ifElse((NumExplod(90000250) || NumExplod(90000255)), 2, ifElse((NumExplod(90000240) || NumExplod(90000245)), 1, 0))

[State 1210, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || P2Dist x > 228 || Random < 333), 2, ifElse(P2Dist x > 150, 1, 0))

[State 1210, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 0, 1210, ifElse(var(10) = 1, 1211, 1212))

[State 1210, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1200,0
channel = 0

[State 1210, Jump sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 40,0
channel = 1

[State 1210, Woosh sound]
type = PlaySnd
trigger1 = AnimElem = 2
trigger2 = AnimElem = 7
trigger3 = AnimElem = 10
trigger4 = AnimElem = 13 && var(10)
trigger5 = AnimElem = 16 && var(10)
trigger6 = AnimElem = 19 && var(10)
trigger7 = AnimElem = 22 && var(10)
trigger8 = AnimElem = 25 && var(10) = 2
trigger9 = AnimElem = 28 && var(10) = 2
value = 1,5

[State 1210, PosAdd]
type = PosAdd
trigger1 = AnimElem = 2
x = 16

[State 1210, PosAdd]
type = PosAdd
trigger1 = AnimElem = 4
trigger2 = AnimElemTime(4) = 1
x = 4
y = -2

[State 1210, Dust Helper]
type = Helper
trigger1 = AnimElem = 4
helperType = Normal
stateNo = 8100
ID = 8100
name = "Tatsumaki Senpukyaku Dust"
posType = P1
ownPal = 1

[State 1210, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 4
stateType = A
physics = N

[State 1210, VelSet]
type = VelSet
trigger1 = AnimElem = 4
x = ifElse(var(10) = 2, 5.5, ifElse(var(10) = 1, 4.8125, 4.25))
y = ifElse(var(10) = 2, -1.3125, ifElse(var(10) = 1, -1.5, -1.375))

[State 1210, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(4) > 0
y = ifElse(var(10) = 2, 0.0625, ifElse(var(10) = 1, 0.09375, 0.1875))

[State 1210, First Hit]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 3
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 3, 6)
guard.pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 3, 6)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 16
ground.slideTime = 16
guard.hitTime = 16
air.hitTime = 120
ground.velocity = -10.52,0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -7.5, -5
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 32), var(36) := -71
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1210, HitDef (Opponent in front)]
type = HitDef
triggerAll = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 8
trigger2 = (AnimElem = 14 || AnimElem = 20) && var(10)
trigger3 = AnimElem = 26 && var(10) = 2
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 2, 4)
guard.pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 2, 4)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 16
ground.slideTime = 16
guard.hitTime = 16
air.hitTime = 120
ground.velocity = -10.52, 0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -7.5, -5
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 60), var(36) := -71
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1210, HitDef (Opponent in back)]
type = HitDef
triggerAll = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 11
trigger2 = (AnimElem = 17 || AnimElem = 23) && var(10)
trigger3 = AnimElem = 29 && var(10) = 2
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 2, 4)
guard.pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 2, 4)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 16
ground.slideTime = 16
guard.hitTime = 16
air.hitTime = 120
ground.velocity = 10.52, 0
ground.cornerPush.velOff = 0
guard.velocity = 10.52
guard.cornerPush.velOff = 0
air.velocity = 7.5, -5
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := -45), var(36) := -71
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1210, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(12) >= 0 && !var(10)
trigger2 = AnimElemTime(24) >= 0 && var(10) = 1
trigger3 = AnimElemTime(30) >= 0 && var(10) = 2
moveType = I

[State 1210, VelAdd for skipped frame]
type = VelAdd
triggerAll = MoveContact = 1 && !HitPauseTime
trigger1 = AnimElemTime(8) >= 0 && AnimElemTime(9) < 0
trigger2 = AnimElemTime(14) >= 0 && AnimElemTime(15) < 0
trigger3 = AnimElemTime(20) >= 0 && AnimElemTime(21) < 0
trigger4 = AnimElemTime(26) >= 0 && AnimElemTime(27) < 0
trigger5 = AnimElemTime(11) >= 0 && AnimElemTime(12) < 0
trigger6 = AnimElemTime(17) >= 0 && AnimElemTime(18) < 0
trigger7 = AnimElemTime(23) >= 0 && AnimElemTime(24) < 0
trigger8 = AnimElemTime(29) >= 0 && AnimElemTime(30) < 0
y = ifElse(var(10) = 2, 0.0625, ifElse(var(10) = 1, 0.09375, 0.1875))/2

[State 1210, Frame advance]
type = ChangeAnim
triggerAll = MoveContact = 1 && !HitPauseTime
trigger1 = AnimElemTime(8) >= 0 && AnimElemTime(9) < 0
trigger2 = AnimElemTime(14) >= 0 && AnimElemTime(15) < 0
trigger3 = AnimElemTime(20) >= 0 && AnimElemTime(21) < 0
trigger4 = AnimElemTime(26) >= 0 && AnimElemTime(27) < 0
trigger5 = AnimElemTime(11) >= 0 && AnimElemTime(12) < 0
trigger6 = AnimElemTime(17) >= 0 && AnimElemTime(18) < 0
trigger7 = AnimElemTime(23) >= 0 && AnimElemTime(24) < 0
trigger8 = AnimElemTime(29) >= 0 && AnimElemTime(30) < 0
value = ifElse(var(10) = 0, 1210, ifElse(var(10) = 1, 1211, 1212))
elem = AnimElemNo(0) + 1
ignoreHitPause = 1

[State 1210, End]
type = ChangeState
triggerAll = AnimElemTime(4) > 0
trigger1 = pos y + vel y > -(vel y + ifElse(var(10) = 2, 0.0625, ifElse(var(10) = 1, 0.09375, 0.1875)))
trigger2 = !AnimTime
value = 1215


;Landing
[StateDef 1215]
type = S
anim = 1215
physics = N
moveType = I
velSet = 0,0

[State 1215, PosAdd]
type = PosAdd
trigger1 = !Time
x = 9

[State 1215, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 1215, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1215, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0
channel = 1

[State 1215, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;=====================<EX TATSUMAKI SENPUKYAKU>==========================
[StateDef 1230]
type = S
physics = N
moveType = A
anim = 1230
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 1230, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1230, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1230, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 46

[State 1230, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = 6, -72
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1230, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1230, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1200,0
channel = 0

[State 1230, Jump sound]
type = PlaySnd
trigger1 = !Time
value = 40,0
channel = 3

[State 1230, Woosh sound]
type = PlaySnd
trigger1 = Time = 1
trigger2 = AnimElem = 7
trigger3 = AnimElem = 10
trigger4 = AnimElem = 13
trigger5 = AnimElem = 16
trigger6 = AnimElem = 19
trigger7 = AnimElem = 22
trigger8 = AnimElem = 25
trigger9 = AnimElem = 28
trigger10 = AnimElem = 31
trigger11 = AnimElem = 34
trigger12 = AnimElem = 37
value = 1,5

[State 1230, Dust Helper]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8100
ID = 8100
name = "Tatsumaki Senpukyaku Dust"
posType = P1
ownPal = 1

[State 1230, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = !Time
stateType = A
physics = N

[State 1230, VelSet]
type = VelSet
trigger1 = !Time
x = 5.46875
y = -5

[State 1230, VelAdd]
type = VelAdd
trigger1 = Time > 0 && AnimElemTime(7) < 0
trigger2 = AnimElemTime(37) > 0
y = 0.5859375

[State 1230, VelSet]
type = VelSet
trigger1 = AnimElem = 7
y = 0

[State 1230, First Hit]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 2
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 6,6
guard.pauseTime = 6,6
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -9.02,0
ground.cornerPush.velOff = 0
guard.velocity = -9.02
guard.cornerPush.velOff = 0
air.velocity = -7.5, -5
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 27), var(36) := -68
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1230, HitDef (Opponent in front)]
type = HitDef
triggerAll = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 8 || AnimElem = 14 || AnimElem = 20 || AnimElem = 26 || AnimElem = 32
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 6,6
guard.pauseTime = 6,6
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -8.02, 0
ground.cornerPush.velOff = 0
guard.velocity = -8.02
guard.cornerPush.velOff = 0
air.velocity = -7.5, -5
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 60), var(36) := -71
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1230, HitDef (Opponent in back)]
type = HitDef
triggerAll = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 11 || AnimElem = 17 || AnimElem = 23 || AnimElem = 29 || AnimElem = 35
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 6,6
guard.pauseTime = 6,6
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 8.02, 0
ground.cornerPush.velOff = 0
guard.velocity = 8.02
guard.cornerPush.velOff = 0
air.velocity = 7.5, -5
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := -45), var(36) := -71
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1230, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(36) >= 0
moveType = I

[State 1230, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 1205



;=====================<EX SFIII TATSUMAKI SENPUKYAKU>==========================
[StateDef 1240]
type = S
physics = N
moveType = A
anim = 1240
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 1240, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1240, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1240, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 47

[State 1240, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = 6, -72
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1240, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1240, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1200,0
channel = 0

[State 1240, Jump sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 40,0
channel = 3

[State 1240, Woosh sound]
type = PlaySnd
trigger1 = AnimElem = 2
trigger2 = AnimElem = 7
trigger3 = AnimElem = 10
trigger4 = AnimElem = 13
trigger5 = AnimElem = 16
trigger6 = AnimElem = 19
trigger7 = AnimElem = 22
trigger8 = AnimElem = 25
trigger9 = AnimElem = 28
trigger10 = AnimElem = 31
trigger11 = AnimElem = 34
value = 1,5

[State 1240, PosAdd]
type = PosAdd
trigger1 = AnimElem = 2
x = 16

[State 1240, PosAdd]
type = PosAdd
trigger1 = AnimElem = 4
trigger2 = AnimElemTime(4) = 1
x = 4
y = -2

[State 1240, Dust Helper]
type = Helper
trigger1 = AnimElem = 4
helperType = Normal
stateNo = 8100
ID = 8100
name = "Tatsumaki Senpukyaku Dust"
posType = P1
ownPal = 1

[State 1240, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 4
stateType = A
physics = N

[State 1240, VelSet]
type = VelSet
trigger1 = AnimElem = 4
x = 6.5
y = -1.2578125

[State 1240, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(4) > 0
y = 0.0625

[State 1240, First Hit]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 3
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 16
ground.slideTime = 16
guard.hitTime = 16
air.hitTime = 120
ground.velocity = -10.52,0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -7.5, -5
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 32), var(36) := -71
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1240, HitDef (Opponent in front)]
type = HitDef
triggerAll = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 8 || AnimElem = 14 || AnimElem = 20 || AnimElem = 26 || AnimElem = 32
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 16
ground.slideTime = 16
guard.hitTime = 16
air.hitTime = 120
ground.velocity = -10.52, 0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -7.5, -5
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 60), var(36) := -71
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1240, HitDef (Opponent in back)]
type = HitDef
triggerAll = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 11 || AnimElem = 17 || AnimElem = 23 || AnimElem = 29 || AnimElem = 35
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 16
ground.slideTime = 16
guard.hitTime = 16
air.hitTime = 120
ground.velocity = 10.52, 0
ground.cornerPush.velOff = 0
guard.velocity = 10.52
guard.cornerPush.velOff = 0
air.velocity = 7.5, -5
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := -45), var(36) := -71
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1240, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(36) >= 0
moveType = I

[State 1240, End]
type = ChangeState
triggerAll = AnimElemTime(4) > 0
trigger1 = pos y + vel y > -(vel y + 0.0625)
value = 1215



;=====================<AIRBORNE TATSUMAKI SENPUKYAKU>==========================
[StateDef 1250]
type = A
physics = N
moveType = A
anim = 1250
ctrl = 0
sprPriority = 1
powerAdd = 72 * !var(20)

[State 1250, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
;ifElse((command = "c" || command = "rlsc"), 2, ifElse((command = "b" || command = "rlsb"), 1, 0))
var(10) = ifElse((NumExplod(90000250) || NumExplod(90000255)), 2, ifElse((NumExplod(90000240) || NumExplod(90000245)), 1, 0))

[State 1250, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = 2

[State 1250, VarAdd]
type = VarAdd
trigger1 = !Time && vel y > 0
var(10) = 10

[State 1250, Voice]
type = PlaySnd
trigger1 = !Time
value = 4,4
channel = 0

[State 1250, Woosh sound]
type = PlaySnd
trigger1 = AnimElem = 4
trigger2 = AnimElem = 7
trigger3 = AnimElem = 10
trigger4 = AnimElem = 13
trigger5 = AnimElem = 16
value = 1,5

[State 1250, VelSet]
type = VelAdd
trigger1 = !Time; && var(10) < 10 (this is how CvS2 does it but idk it looks weird to selectively add horizontal movement)
x = ifElse(var(10) % 10 = 2, 2.5, ifElse(var(10) % 10 = 1, 1.875, 1.25)) * ifElse(vel x < 0, -1, 1)

[State 1250, VelAdd]
type = VelAdd
trigger1 = Time > 0
y = ifElse(vel y > 0 || AnimElemTime(22) > 0, 0.48828125, 0.1953125)
;y = ifElse(AnimElemTime(22) > 0 || var(10) >= 10, 0.48828125, 0.1953125) (this is how CvS2 does it but idk it looks more natural to just turn up the gravity earlier)

[State 1250, HitDef (Opponent in front)]
type = HitDef
triggerAll = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 5 || AnimElem = 11
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 49 < 7, 7, fvar(11) * 49)), 7
getPower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
guard.pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 16
ground.slideTime = 16
guard.hitTime = 16
air.hitTime = 120
ground.velocity = -8.02, 0
ground.cornerPush.velOff = 0
guard.velocity = -8.02
guard.cornerPush.velOff = 0
air.velocity = -7.5, -5
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 60), var(36) := -71
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1250, HitDef (Opponent in back)]
type = HitDef
triggerAll = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 8 || AnimElem = 14
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 49 < 7, 7, fvar(11) * 49)), 7
getPower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
guard.pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 16
ground.slideTime = 16
guard.hitTime = 16
air.hitTime = 120
ground.velocity = 8.02, 0
ground.cornerPush.velOff = 0
guard.velocity = 8.02
guard.cornerPush.velOff = 0
air.velocity = 7.5, -5
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := -45), var(36) := -71
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1250, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(15) >= 0
moveType = I

[State 1250, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 1255


;Landing
[StateDef 1255]
type = S
anim = ifElse(var(40) = 1, 1256, 1255)
physics = N
moveType = I
velSet = 0,0

[State 1255, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 1255, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1255, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0
channel = 4

[State 1255, End]
type = ChangeState
trigger1 = !AnimTime
value = 11
ctrl = 1



;=====================<SFIII AIRBORNE TATSUMAKI SENPUKYAKU>==========================
[StateDef 1260]
type = A
physics = N
moveType = A
anim = 1260
ctrl = 0
sprPriority = 1
powerAdd = 72 * !var(20)

[State 1260, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
;ifElse((command = "c" || command = "rlsc"), 2, ifElse((command = "b" || command = "rlsb"), 1, 0))
var(10) = ifElse((NumExplod(90000250) || NumExplod(90000255)), 2, ifElse((NumExplod(90000240) || NumExplod(90000245)), 1, 0))

[State 1260, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = 2

[State 1260, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 0, 1260, ifElse(var(10) = 1, 1261, 1262))

[State 1260, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1200,0
channel = 0

[State 1260, Woosh sound]
type = PlaySnd
trigger1 = AnimElem = 3
trigger2 = AnimElem = 6
trigger3 = AnimElem = 9
trigger4 = AnimElem = 12
trigger5 = AnimElem = 15 && var(10)
trigger6 = AnimElem = 18 && var(10)
trigger7 = AnimElem = 21 && var(10) = 2
trigger8 = AnimElem = 24 && var(10) = 2
value = 1,5

[State 1260, VelSet]
type = VelAdd
trigger1 = !Time
x = ifElse(var(10) = 2, 1.5, ifElse(var(10) = 1, 1.125, 1))
y = ifElse(var(10) = 2, -0.96875, -0.46875)

[State 1260, VelAdd]
type = VelAdd
trigger1 = Time > 0
y = ifElse(var(10) = 2, 0.46875, ifElse(var(10) = 1, 0.4375, 0.40625))

[State 1260, HitDef (Opponent in front)]
type = HitDef
triggerAll = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 4 || AnimElem = 10
trigger2 = AnimElem = 16 && var(10)
trigger3 = AnimElem = 22 && var(10) = 2
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 49 < 7, 7, fvar(11) * 49)), 7
getPower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 3, 6)
guard.pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 3, 6)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 16
ground.slideTime = 16
guard.hitTime = 16
air.hitTime = 120
ground.velocity = -10.52, 0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -7.5, -5
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 60), var(36) := -71
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1260, HitDef (Opponent in back)]
type = HitDef
triggerAll = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 7 || AnimElem = 13
trigger2 = AnimElem = 19 && var(10)
trigger3 = AnimElem = 25 && var(10) = 2
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 49 < 7, 7, fvar(11) * 49)), 7
getPower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 3, 6)
guard.pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 3, 6)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 16
ground.slideTime = 16
guard.hitTime = 16
air.hitTime = 120
ground.velocity = 10.52, 0
ground.cornerPush.velOff = 0
guard.velocity = 10.52
guard.cornerPush.velOff = 0
air.velocity = 7.5, -5
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := -45), var(36) := -71
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1260, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(14) >= 0 && !var(10)
trigger2 = AnimElemTime(20) >= 0 && var(10) = 1
trigger3 = AnimElemTime(26) >= 0 && var(10) = 2
moveType = I

[State 1260, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 1215



;=====================<VIOLENT AIRBORNE TATSUMAKI SENPUKYAKU>==========================
[StateDef 1270]
type = A
physics = N
moveType = A
anim = 1270
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)

[State 1270, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
;ifElse((command = "c" || command = "rlsc"), 2, ifElse((command = "b" || command = "rlsb"), 1, 0))
var(10) = ifElse((NumExplod(90000250) || NumExplod(90000255)), 2, ifElse((NumExplod(90000240) || NumExplod(90000245)), 1, 0))

[State 1270, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || P2Dist x > 235 || Random < 333), 2, ifElse(P2Dist x > 170, 1, 0))

[State 1270, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 0, 1270, ifElse(var(10) = 1, 1271, 1272))

[State 1270, Voice]
type = PlaySnd
trigger1 = !Time && var(40) != 1
value = 1200,0
channel = 0

[State 1270, Voice (Violent)]
type = PlaySnd
trigger1 = !Time && var(40) = 1
value = 1270,0
channel = 0

[State 1270, Woosh sound]
type = PlaySnd
trigger1 = !Time
trigger2 = AnimElem = 6
trigger3 = AnimElem = 9
trigger4 = AnimElem = 12
trigger5 = AnimElem = 15
trigger6 = AnimElem = 18
trigger7 = AnimElem = 21 && var(10)
trigger8 = AnimElem = 24 && var(10)
trigger9 = AnimElem = 27 && var(10)
trigger10 = AnimElem = 30 && var(10)
trigger11 = AnimElem = 33 && var(10) = 2
trigger12 = AnimElem = 36 && var(10) = 2
value = 1,5

[State 1270, VelSet]
type = VelAdd
trigger1 = AnimElem = 4
x = ifElse(sysvar(1) < 0, -6, 6)

[State 1270, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(18) > 0 && !var(10)
trigger2 = AnimElemTime(30) > 0 && var(10) = 1
trigger3 = AnimElemTime(36) > 0 && var(10) = 2
y = 0.48828125

[State 1270, HitDef (Opponent in front)]
type = HitDef
triggerAll = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 7 || AnimElem = 13
trigger2 = (AnimElem = 19 || AnimElem = 25) && var(10)
trigger3 = AnimElem = 31 && var(10) = 2
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
guard.pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 16
ground.slideTime = 16
guard.hitTime = 16
air.hitTime = 120
ground.velocity = -8.02, 0
ground.cornerPush.velOff = 0
guard.velocity = -8.02
guard.cornerPush.velOff = 0
air.velocity = -7.5, -5
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 60), var(36) := -71
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1270, HitDef (Opponent in back)]
type = HitDef
triggerAll = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 10 || AnimElem = 16
trigger2 = (AnimElem = 22 || AnimElem = 28) && var(10)
trigger3 = AnimElem = 34 && var(10) = 2
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
guard.pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 16
ground.slideTime = 16
guard.hitTime = 16
air.hitTime = 120
ground.velocity = 8.02, 0
ground.cornerPush.velOff = 0
guard.velocity = 8.02
guard.cornerPush.velOff = 0
air.velocity = 7.5, -5
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := -45), var(36) := -71
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1270, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(17) >= 0 && !var(10)
trigger2 = AnimElemTime(29) >= 0 && var(10) = 1
trigger3 = AnimElemTime(35) >= 0 && var(10) = 2
moveType = I

[State 1270, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 1255



;=====================<EX AIRBORNE TATSUMAKI SENPUKYAKU>==========================
[StateDef 1280]
type = A
physics = N
moveType = A
anim = 1280
ctrl = 0
sprPriority = 1
powerAdd = -500
hitCountPersist = 1

[State 1280, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1280, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1280, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 45

[State 1280, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = 0, -80
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1280, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1280, Voice]
type = PlaySnd
trigger1 = !Time
value = 1200,0
channel = 0

[State 1280, Woosh sound]
type = PlaySnd
trigger1 = AnimElem = 4
trigger2 = AnimElem = 7
trigger3 = AnimElem = 10
trigger4 = AnimElem = 13
trigger5 = AnimElem = 16
trigger6 = AnimElem = 19
trigger7 = AnimElem = 22
trigger8 = AnimElem = 25
trigger9 = AnimElem = 28
trigger10 = AnimElem = 31
trigger11 = AnimElem = 34
value = 1,5

[State 1280, VelSet]
type = VelAdd
trigger1 = !Time
x = 1.875 * ifElse(vel x < 0, -1, 1)

[State 1280, VelAdd]
type = VelAdd
trigger1 = Time > 0
y = ifElse(vel y > 0 || AnimElemTime(40) > 0, 0.48828125, 0.1953125)

[State 1280, HitDef (Opponent in front)]
type = HitDef
triggerAll = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 5 || AnimElem = 11 || AnimElem = 17 || AnimElem = 23 || AnimElem = 29
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * ifElse(HitCount > 5, 14, ifElse(HitCount > 3, 21, 49)) < 7, 7, fvar(11) * ifElse(HitCount > 5, 14, ifElse(HitCount > 3, 21, 49)))), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 6,6
guard.pauseTime = 6,6
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 16
ground.slideTime = 16
guard.hitTime = 16
air.hitTime = 120
ground.velocity = -7.5, -5
ground.cornerPush.velOff = 0
guard.velocity = -7.5
guard.cornerPush.velOff = 0
air.velocity = -7.5, -5
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 60), var(36) := -71
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1280, HitDef (Opponent in back)]
type = HitDef
triggerAll = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 8 || AnimElem = 14 || AnimElem = 20 || AnimElem = 26 || AnimElem = 32
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 49 < 7, 7, fvar(11) * 49)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 6,6
guard.pauseTime = 6,6
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 16
ground.slideTime = 16
guard.hitTime = 16
air.hitTime = 120
ground.velocity = 7.5, -5
ground.cornerPush.velOff = 0
guard.velocity = -7.5
guard.cornerPush.velOff = 0
air.velocity = 7.5, -5
air.cornerPush.velOff = 0
airGuard.velocity = 8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := -45), var(36) := -71
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1280, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(33) >= 0
moveType = I

[State 1280, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 1255



;=====================<EX SFIII AIRBORNE TATSUMAKI SENPUKYAKU>==========================
[StateDef 1290]
type = A
physics = N
moveType = A
anim = 1290
ctrl = 0
sprPriority = 1
powerAdd = -500
hitCountPersist = 1

[State 1290, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1290, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1290, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 45

[State 1290, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = 6, -80
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1290, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1290, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1200,0
channel = 0

[State 1290, Woosh sound]
type = PlaySnd
trigger1 = AnimElem = 3
trigger2 = AnimElem = 6
trigger3 = AnimElem = 9
trigger4 = AnimElem = 12
trigger5 = AnimElem = 15
trigger6 = AnimElem = 18
trigger7 = AnimElem = 21
trigger8 = AnimElem = 24
trigger9 = AnimElem = 27
trigger10 = AnimElem = 30
trigger11 = AnimElem = 33
trigger12 = AnimElem = 36
trigger13 = AnimElem = 39
trigger14 = AnimElem = 42
value = 1,5

[State 1290, VelSet]
type = VelAdd
trigger1 = !Time
x = 1.125
y = -0.96875

[State 1290, VelAdd]
type = VelAdd
trigger1 = Time > 0
y = 0.40625

[State 1290, HitDef (Opponent in front)]
type = HitDef
triggerAll = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 4 || AnimElem = 10 || AnimElem = 16 || AnimElem = 22 || AnimElem = 28 || AnimElem = 34 || AnimElem = 40
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 49 < 7, 7, fvar(11) * 49)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 16
ground.slideTime = 16
guard.hitTime = 16
air.hitTime = 120
ground.velocity = -7.5, -5
ground.cornerPush.velOff = 0
guard.velocity = -7.5
guard.cornerPush.velOff = 0
air.velocity = -7.5, -5
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 60), var(36) := -71
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1290, HitDef (Opponent in back)]
type = HitDef
triggerAll = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 7 || AnimElem = 13 || AnimElem = 19 || AnimElem = 25 || AnimElem = 31 || AnimElem = 37 || AnimElem = 43
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 49 < 7, 7, fvar(11) * 49)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 16
ground.slideTime = 16
guard.hitTime = 16
air.hitTime = 120
ground.velocity = 7.5, -5
ground.cornerPush.velOff = 0
guard.velocity = 7.5
guard.cornerPush.velOff = 0
air.velocity = 7.5, -5
air.cornerPush.velOff = 0
airGuard.velocity = 8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := -45), var(36) := -71
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1290, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(44) >= 0
moveType = I

[State 1290, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 1215



;=====================<RYUSENKYAKU>==========================
[StateDef 1300]
type = S
physics = N
moveType = A
anim = 1300
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1300, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
;ifElse((command = "c" || command = "rlsc"), 2, ifElse((command = "b" || command = "rlsb"), 1, 0))
var(10) = ifElse((NumExplod(90000250) || NumExplod(90000255)), 2, ifElse((NumExplod(90000240) || NumExplod(90000245)), 1, 0))

[State 1300, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || P2Dist x > 187), 2, ifElse(P2Dist x > 160, 1, 0))

[State 1300, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 0, 1300, ifElse(var(10) = 1, 1310, 1320))

[State 1300, Voice]
type = PlaySnd
trigger1 = !Time
value = 1300,0
channel = 0

[State 1300, Jumping Sound]
type = PlaySnd
trigger1 = !Time
value = 40,0
channel = 1

[State 1300, Woosh sound]
type = PlaySnd
trigger1 = AnimElem = 5
value = 1,5
channel = 3

[State 1300, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = !Time
stateType = A
physics = N

[State 1300, Dust Helper]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8103
ID = 8100
name = "Ryusenkyaku Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 1300, VelSet]
type = VelSet
trigger1 = AnimElem = 3
x = ifElse(var(10) = 2, 4.375, ifElse(var(10) = 1, 3.75, 3.125))
y = ifElse(var(10) = 2, -11.25, ifElse(var(10) = 1, -10.625, -10))

[State 1300, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(3) > 0
y = 0.78125

[State 1300, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 6
ID = 1300
attr = A, SA
hitFlag = MAF
guardFlag = HA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 105, ifElse(var(10) = 1, 98, 91)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 105, ifElse(var(10) = 1, 98, 91)))), 7
getPower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -6.25, 3.75
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -6.25, 3.75
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.78125
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 46), var(36) := -79
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1300, HitDef 2]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 7 && !MoveContact && !MoveReversed
ID = 1300
attr = A, SA
hitFlag = MAF
guardFlag = HA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 105, ifElse(var(10) = 1, 98, 84)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 105, ifElse(var(10) = 1, 98, 84)))), 7
getPower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -6.25, 3.75
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -6.25, 3.75
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.78125
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 54), var(36) := -37
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1300, TargetDrop]
type = TargetDrop
trigger1 = NumTarget(1300) > 1
ID = 1300
keepOne = 1
excludeID = 1300
ignoreHitPause = 1

[State 1300, TargetState]
type = TargetState
trigger1 = MoveHit && NumTarget(1300)
trigger1 = !(Target(1300), Time)
value = ifElse(Target(1300), StateType = A, 5425, 5420)
ID = 1300
ignoreHitPause = 1

[State 1300, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 1301


;Landing
[StateDef 1301]
type = S
anim = 1301
physics = N
moveType = I
velSet = 0,0

[State 1301, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 1301, Impact Dust]
type = Explod
trigger1 = !Time
anim = 8105
sprPriority = -3
posType = P1
scale = 0.325,0.325
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1301, Impact Sound]
type = PlaySnd
trigger1 = !Time
value = 1300,1
channel = 1

[State 1301, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;========================<SLAMMED AGAINST THE GROUND>=============================
;Being Slammed (Standing)
[StateDef 5420]
type = U
moveType = H
physics = N
velset = 0,0

[State 5420, ChangeAnim]
type = ChangeAnim
trigger1 = 1
value = ifElse(SelfAnimExist(5111) || SelfAnimExist(5112), 5012, 5070)

[State 5420, ChangeAnim]
type = ChangeAnim
trigger1 = SelfAnimExist(5420 + (StateType = C))
value = 5420 + (StateType = C)

[State 5420, End]
type = SelfState
trigger1 = HitShakeOver && pos y < 0
trigger2 = StateType = L
value = 5030

[State 5420, End]
type = ChangeState
trigger1 = HitShakeOver && pos y >= 0
value = 5421


;Hitting the Ground
[StateDef 5421]
type = L
moveType = H
physics = N
velSet = 0,0

[State 5421, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(SelfAnimExist(5102) && PrevStateNo != 5426, 5102, ifElse(SelfAnimExist(5101) && PrevStateNo != 5426, 5101, 5100))

[State 5421, ChangeAnim]
type = ChangeAnim
triggerall = !Time && PrevStateNo != 5426
trigger1 = SelfAnimExist(5422)
value = 5422

[State 5421, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 5421, HitFallDamage]
type = HitFallDamage
trigger1 = !Time

[State 5421, EnvShake]
type = EnvShake
trigger1 = !Time
time = 14
ampl = -4

[State 5421, Impact Sound]
type = PlaySnd
trigger1 = !Time
value = F7,1

[State 5421, Hitting the Floor FX]
type = Explod
trigger1 = !Time
anim = F61
posType = P1
pos = 0, 0
sprPriority = -3

[State 5421, End]
type = ChangeState
trigger1 = !AnimTime
trigger2 = Anim = 5100 + (Anim % 10)
trigger2 = Time = 4
trigger2 = Anim != 5422
trigger3 = Anim = 5422
trigger3 = AnimTime = 0 || Time = 12
value = 5422


;Bouncing Off Ground
[StateDef 5422]
type = L
moveType = H
physics = N

[State 5422, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(SelfAnimExist(5160 + Anim % 10), 5160 + Anim % 10, 5160)

[State 5422, ChangeAnim]
type = ChangeAnim
triggerall = !Time && Anim = 5422
trigger1 = SelfAnimExist(5424)
value = 5424

[State 5422, VelSet]
type = VelSet
trigger1 = !Time
y = -3.75

[State 5422, PosSet]
type = PosSet
trigger1 = !Time
y = const(movement.down.bounce.offset.y)

[State 5422, PosAdd]
type = PosAdd
trigger1 = !Time
x = const(movement.down.bounce.offset.x)

[State 5422, VelAdd]
type = VelAdd
trigger1 = 1
y = 0.625

[State 5422, ChangeAnim]
type = ChangeAnim
trigger1 = Anim = 5424
trigger1 = vel y > 0
trigger1 = pos y >= const(movement.down.bounce.groundlevel)
value = ifElse(SelfAnimExist(5162), 5162, ifElse(SelfAnimExist(5161), 5161, 5160))

[State 5422, End]
type = SelfState
trigger1 = GetHitVar(chainID) != 429 && GetHitVar(chainID) != 1040 && GetHitVar(chainID) != 1050
trigger1 = vel y > 0
trigger1 = pos y >= const(movement.down.bounce.groundlevel)
value = 5110

[State 5422, End]
type = ChangeState
trigger1 = GetHitVar(chainID) = 429 || GetHitVar(chainID) = 1040 || GetHitVar(chainID) = 1050
trigger1 = vel y > 0
trigger1 = pos y >= const(movement.down.bounce.groundlevel)
value = 1057


;Aerial Being Slammed (Hitshake)
[StateDef 5425]
type = A
moveType = H
physics = N
velSet = 0,0

[State 5425, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 5070

[State 5425, ChangeAnim]
type = ChangeAnim
trigger1 = Time > 0
value = Anim

[State 5425, ChangeAnim]
type = ChangeState
trigger1 = HitShakeOver
value = 5426


;Aerial Being Slammed (Knocked Away)
[StateDef 5426]
type = A
moveType = H
physics = N
ctrl = 0

[State 5426, VelAdd]
type = VelAdd
trigger1 = Time > 0
y = GetHitVar(yaccel)

[State 5426, HitVelSet]
type = HitVelSet
trigger1 = !Time
x = 1
y = 1

[State 5426, ChangeState]
type = ChangeState
trigger1 = vel y > 0
trigger1 = pos y >= const(movement.air.gethit.trip.groundlevel)
value = 5421



;=====================<EX RYUSENKYAKU>==========================
[StateDef 1330]
type = S
physics = N
moveType = A
anim = 1330
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 1330, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1330, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1330, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 26

[State 1330, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = -4,-65
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1330, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1330, Voice]
type = PlaySnd
trigger1 = !Time
value = 1300,0
channel = 0

[State 1330, Jumping Sound]
type = PlaySnd
trigger1 = !Time
value = 40,0
channel = 3

[State 1330, Woosh sound]
type = PlaySnd
trigger1 = AnimElem = 5
value = 1,5
channel = 4

[State 1330, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = !Time
stateType = A
physics = N

[State 1330, Dust Helper]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8103
ID = 8100
name = "Ryusenkyaku Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 1330, VelSet]
type = VelSet
trigger1 = AnimElem = 3
x = ifElse(P2Dist x / 28 > 5, 5, P2Dist x / 28)
y = -14.25

[State 1330, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(3) > 0
y = 1.171875

[State 1330, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(4) < 0
value = SCA
time = 1

[State 1330, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 6
ID = 1330
attr = A, SA
hitFlag = MAF
guardFlag = HA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 119 < 7, 7, fvar(11) * 119)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 22
ground.slideTime = 22
guard.hitTime = 22
air.hitTime = 120
ground.velocity = -6.25, 3.75
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -6.25, 3.75
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.78125
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 46), var(36) := -79
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1330, HitDef 2]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 7 && !MoveContact && !MoveReversed
ID = 1330
attr = A, SA
hitFlag = MAF
guardFlag = HA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 119 < 7, 7, fvar(11) * 119)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 22
ground.slideTime = 22
guard.hitTime = 22
air.hitTime = 120
ground.velocity = -6.25, 3.75
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -6.25, 3.75
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.78125
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 54), var(36) := -37
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1330, TargetDrop]
type = TargetDrop
trigger1 = NumTarget(1330) > 1
ID = 1330
keepOne = 1
excludeID = 1330
ignoreHitPause = 1

[State 1330, TargetState]
type = TargetState
trigger1 = MoveHit && NumTarget(1330)
trigger1 = !(Target(1330), Time)
value = ifElse(Target(1330), StateType = A, 5425, 5420)
ID = 1330
ignoreHitPause = 1

[State 1330, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 1301



;========================<NATA OTOSHI GERI>=============================
[StateDef 1400]
type = S
physics = N
moveType = A
anim = 1400
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1400, Voice]
type = PlaySnd
trigger1 = AnimElem = 5 && Random < 500
value = 4, ifElse(Random < 500, 3, 4) + 9 * (var(40) = 1)
channel = 0

[State 1400, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 5
value = 1,5
channel = 1

[State 1400, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 6
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 84 < 7, 7, fvar(11) * 84)), 7
getPower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -12.64,0
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -7.5, -5
air.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 82), var(36) := -102
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1400, Followup Detection Reset]
type = VarSet
trigger1 = AnimElemTime(7) < 0
var(14) = 0
ignoreHitPause = 1

[State 1400, Inazuma Kakato Wari]
type = VarSet
triggerAll = (!var(14) || AILevel) && AnimElemTime(7) < 0
trigger1 = !AILevel
trigger1 = command = "holda" || command = "holdb" || command = "holdc"
trigger2 = AILevel && !var(14)
trigger2 = P2Dist x >= 0 && MoveGuarded && Enemy, StateType = C
var(14) = 1405

[State 1400, Followup]
type = ChangeState
triggerAll = var(14) = 1405
trigger1 = AnimElemTime(7) = 0
value = var(14)

[State 1400, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(8) >= 0
moveType = I

[State 1400, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;========================<INAZUMA KAKATO WARI (FROM NATA OTOSHI GERI)>=============================
[StateDef 1405]
type = S
physics = N
moveType = A
anim = 1405
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 1405, Voice]
type = PlaySnd
trigger1 = AnimElem = 4 && Random < 500
value = 4, ifElse(Random < 500, 3, 4) + 9 * (var(40) = 1)
channel = 0

[State 1405, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1,5
channel = 3

[State 1405, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 5
attr = S, SA
hitFlag = MAF
guardFlag = H
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 56 < 7, 7, fvar(11) * 56)), 7
getPower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -12.64,0
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -7.5, -5
air.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 102), var(36) := -61
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1405, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(6) >= 0
moveType = I

[State 1405, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;========================<KAMA BARAI GERI>=============================
[StateDef 1410]
type = S
physics = N
moveType = A
anim = 1410
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1410, PosAdd]
type = PosAdd
trigger1 = !Time
x = 8

[State 1410, PosAdd]
type = PosAdd
trigger1 = AnimElem = 4
x = 16

[State 1410, Voice]
type = PlaySnd
trigger1 = AnimElem = 3 && Random < 500
value = 4, ifElse(Random < 500, 3, 4) + 9 * (var(40) = 1)
channel = 0

[State 1410, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1,5
channel = 1

[State 1410, Hit 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 4
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 63 < 7, 7, fvar(11) * 63)), 7
getPower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 8, 16)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 8, 16)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -12.64,0
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -7.5, -5
air.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 59), var(36) := -106
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1410, Followup Detection Reset]
type = VarSet
trigger1 = AnimElemTime(5) <= 0
var(14) = 0
ignoreHitPause = 1

[State 1410, Inazuma Kakato Wari]
type = VarSet
triggerAll = (!var(14) || AILevel) && AnimElemTime(5) <= 0
trigger1 = !AILevel
trigger1 = command = "holda" || command = "holdb" || command = "holdc"
trigger2 = AILevel && !var(14)
trigger2 = P2Dist x >= 0 && MoveGuarded && Enemy, StateType = C
var(14) = 1415

[State 1410, Followup]
type = ChangeState
triggerAll = var(14) = 1415
trigger1 = AnimElemTime(5) = 0
value = var(14)

[State 1410, Hit 2]
type = HitDef
trigger1 = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 5
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -12.64,0
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -7.5, -5
air.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 54), var(36) := -97
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1410, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(6) >= 0
moveType = I

[State 1410, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;========================<INAZUMA KAKATO WARI (FROM KAMA BARAI GERI)>=============================
[StateDef 1415]
type = S
physics = N
moveType = A
anim = ifElse(MoveContact, 1416, 1415)
ctrl = 0
velSet = 0,0
sprPriority = 1
moveHitPersist = 1

[State 1415, PosAdd]
type = PosAdd
trigger1 = !Time
x = -16

[State 1415, Voice]
type = PlaySnd
trigger1 = AnimElem = 5 && Random < 500
value = 4, ifElse(Random < 500, 3, 4) + 9 * (var(40) = 1)
channel = 0

[State 1415, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 5
value = 1,5
channel = 3

[State 1415, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 6
attr = S, SA
hitFlag = MAF
guardFlag = H
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 56 < 7, 7, fvar(11) * 56)), 7
getPower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -12.64,0
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -7.5, -5
air.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 102), var(36) := -61
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1415, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(7) >= 0
moveType = I

[State 1415, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;========================<OOSOTO MAWASHI GERI>=============================
[StateDef 1420]
type = S
physics = N
moveType = A
anim = 1420
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1420, PosAdd]
type = PosAdd
trigger1 = !Time
x = 8

[State 1420, Voice]
type = PlaySnd
trigger1 = AnimElem = 4 && Random < 500
value = 4, ifElse(Random < 500, 3, 4) + 9 * (var(40) = 1)
channel = 0

[State 1420, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1,5
channel = 1

[State 1420, Spark XY]
type = Null
trigger1 = AnimElem = 5
trigger1 = var(35) := 82 || var(36) := -102
trigger2 = AnimElem = 6
trigger2 = var(35) := 76 || var(36) := -94

[State 1420, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 5
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 98 < 7, 7, fvar(11) * 98)), 7
getPower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -5,-6.5625
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -5,-6.5625
air.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10, -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1420, Followup Detection Reset]
type = VarSet
trigger1 = AnimElemTime(6) < 0
var(14) = 0
ignoreHitPause = 1

[State 1420, Inazuma Kakato Wari]
type = VarSet
triggerAll = (!var(14) || AILevel) && AnimElemTime(6) < 0
trigger1 = !AILevel
trigger1 = command = "holda" || command = "holdb" || command = "holdc"
trigger2 = AILevel && !var(14)
trigger2 = P2Dist x >= 0 && MoveGuarded && Enemy, StateType = C
var(14) = 1425

[State 1420, Followup]
type = ChangeState
triggerAll = var(14) = 1425
trigger1 = AnimElemTime(6) = 0
value = var(14)

[State 1420, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(7) >= 0
moveType = I

[State 1420, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;========================<INAZUMA KAKATO WARI (FROM OOSOTO MAWASHI GERI)>=============================
[StateDef 1425]
type = S
physics = N
moveType = A
anim = 1425
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 1425, Voice]
type = PlaySnd
trigger1 = AnimElem = 5 && Random < 500
value = 4, ifElse(Random < 500, 3, 4) + 9 * (var(40) = 1)
channel = 0

[State 1425, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 5
value = 1,5
channel = 3

[State 1425, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 6
attr = S, SA
hitFlag = MAF
guardFlag = H
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 56 < 7, 7, fvar(11) * 56)), 7
getPower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -12.64,0
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -7.5, -5
air.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 102), var(36) := -61
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1425, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(7) >= 0
moveType = I

[State 1425, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;========================<FUJIN SEN GERI>=============================
[StateDef 1430]
type = S
physics = N
moveType = A
anim = 1430
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 1430, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1430, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1430, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 31

[State 1430, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = 0, -62
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1430, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1430, Voice 1]
type = PlaySnd
trigger1 = !Time
value = 4,3
channel = 0

[State 1430, Woosh Sound 1]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1,5
channel = 3

[State 1430, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 12
value = 4,4
channel = 0

[State 1430, Woosh Sound 2]
type = PlaySnd
trigger1 = AnimElem = 11
value = 1,5
channel = 4

[State 1430, PosAdd]
type = PosAdd
trigger1 = !Time
x = 8

[State 1430, PosAdd]
type = PosAdd
trigger1 = AnimElem = 4
trigger2 = AnimElem = 10
x = 16

[State 1430, Hit 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 4
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 10,14
guard.pauseTime = 10,14
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2.41,0
ground.cornerPush.velOff = 0
guard.velocity = -2.41
guard.cornerPush.velOff = 0
air.velocity = -7.5, -5
air.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 59), var(36) := -106
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1430, Hit 2]
type = HitDef
trigger1 = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 5
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 10,10
guard.pauseTime = 10,10
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2.41,0
ground.cornerPush.velOff = 0
guard.velocity = -2.41
guard.cornerPush.velOff = 0
air.velocity = -7.5, -5
air.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 54), var(36) := -97
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1430, Hit 3]
type = HitDef
trigger1 = !var(16) && (var(15) < (1 + HitCount) || var(20))
trigger1 = AnimElem = 12
ID = 1430
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 20
ground.slideTime = 20
guard.hitTime = 20
air.hitTime = 120
ground.velocity = -12, -6
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -12, -6
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 65), var(36) := -69
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1430, Juggle Reset]
type = VarSet
trigger1 = MoveHit && !var(11) && NumTarget(1430)
var(15) = 0

[State 1430, VarAdd]
type = VarAdd
trigger1 = MoveHit && NumTarget(1430)
var(11) = 1
persistent = 0

[State 1430, TargetDrop]
type = TargetDrop
trigger1 = NumTarget(1430) > 1
ID = 1430
keepOne = 1
excludeID = 1430
ignoreHitPause = 1

[State 1430, TargetState]
type = TargetState
trigger1 = MoveHit && NumTarget(1430)
trigger1 = !(Target(1430), Time)
value = 1435
ID = 1430
ignoreHitPause = 1

[State 1430, ChangeAnimElem]
type = ChangeAnim
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = AnimElemTime(12) >= 0 && AnimElemTime(13) <= 0
trigger1 = HitPauseTime <= 10
value = 1430
elem = 13
ignoreHitPause = 1

[State 1430, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(15) >= 0
moveType = I

[State 1430, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;========================<HIT BY FUJIN SEN GERI>=============================
;Being Launched
[StateDef 1435]
type = A
moveType = H
physics = N
velSet = 0,0

[State 1435, ChangeAnim]
type = ChangeAnim
trigger1 = 1
value = 5012

[State 1435, End]
type = ChangeState
trigger1 = HitShakeOver
value = 1436


;Heading Towards Wall
[StateDef 1436]
type = A
moveType = H
physics = N

[State 1436, HitVelSet]
type = HitVelSet
trigger1 = !Time
x = 1
y = 1

[State 1436, Gravity]
type = VelAdd
trigger1 = 1
y = GetHitVar(yAccel)

[State 1436, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
moveCamera = 0,1
ignoreHitPause = 1

[State 1436, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0
ignoreHitPause = 1

[State 1436, ChangeAnim]
type = ChangeAnim
trigger1 = !Time && SelfAnimExist(5900)
value = 5900

[State 1436, ChangeAnim]
type = ChangeAnim
trigger1 = !Time && !SelfAnimExist(5900)
value = 5030

[State 1436, Bounce Off Wall]
type = ChangeState
trigger1 = BackEdgeBodyDist <= 10 || FrontEdgeBodyDist <= 10
value = 1437

[State 1436, End]
type = SelfState
trigger1 = vel y > 0 && pos y >= 0
value = 5100


;Impacting Wall
[StateDef 1437]
type = A
moveType = H
physics = N

[State 1437, Turn]
type = Turn
trigger1 = !Time
trigger1 = FrontEdgeDist < BackEdgeDist

[State 1437, PosSet]
type = PosSet
trigger1 = 1
x = -160 * Facing

[State 1437, PosFreeze]
type = PosFreeze
trigger1 = 1
x = 1
y = 1

[State 1437, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
moveCamera = 0,1
ignoreHitPause = 1

[State 1437, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 1
ignoreHitPause = 1

[State 1437, ChangeAnim]
type = ChangeAnim
trigger1 = !Time && SelfAnimExist(5901)
value = 5901

[State 1437, ChangeAnim]
type = ChangeAnim
trigger1 = !SelfAnimExist(5901)
value = 5000

[State 1437, Impact Sound]
type = PlaySnd
trigger1 = !Time
value = F7,0

[State 1437, Hitting the Wall FX]
type = Explod
trigger1 = !Time
anim = F72
pos = 0, floor(ScreenPos y) - 50
posType = Back
sprPriority = 3

[State 1437, End]
type = ChangeState
trigger1 = Time >= 4
value = 1438


;Bouncing Off Wall
[Statedef 1438]
type = A
moveType = H
physics = N

[State 1438, Turn]
type = Turn
trigger1 = !Time && !SelfAnimExist(5902)

[State 1438, Gravity]
type = VelAdd
trigger1 = 1
y = 0.5

[State 1438, VelSet]
type = VelSet
trigger1 = !Time
x = ifElse(SelfAnimExist(5902), 2.5, -2.5)
y = -9

[State 1438, ChangeAnim]
type = ChangeAnim
trigger1 = !Time && SelfAnimExist(5902)
value = 5902

[State 1438, ChangeAnim]
type = ChangeAnim
trigger1 = !Time && !SelfAnimExist(5902)
value = ifElse(SelfAnimExist(5051), 5051, 5030)

[State 1438, ChangeAnim]
type = ChangeAnim
trigger1 = Anim = 5030 && !AnimTime
value = 5050

[State 1438, ChangeAnim]
type = ChangeAnim
trigger1 = vel y > -3 && Anim = 5051 && SelfAnimExist(5061)
value = 5061

[State 1438, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
moveCamera = 0,0
ignoreHitPause = 1

[State 1438, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0
ignoreHitPause = 1

[State 1438, Recover]
type = SelfState
trigger1 = Alive
trigger1 = command = "recovery"
trigger1 = vel y > 0 && pos y >= const(movement.air.getHit.groundRecover.ground.threshold)
value = 5200

[State 1438, End]
type = SelfState
trigger1 = vel y > 0 && pos y >= 0
value = 5100



;=====================<ZENPO TENSHI>==========================
[StateDef 1500]
type = S
physics = N
moveType = I
anim = 1500
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0
faceP2 = 1

[State 1500, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
;ifElse((command = "z" || command = "rlsz"), 2, ifElse((command = "y" || command = "rlsy"), 1, 0))
var(10) = ifElse((NumExplod(90000220) || NumExplod(90000225)), 2, ifElse((NumExplod(90000210) || NumExplod(90000215)), 1, 0))

[State 1500, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse(Random < 500, 2, ifElse(Random < 500, 1, 0))

[State 1500, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 0, 1500, ifElse(var(10) = 1, 1510, 1520))

[State 1500, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 4,3
channel = 0

[State 1500, Roll Sound]
type = PlaySnd
trigger1 = !Time
value = 110,0
channel = 1

[State 1500, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x = 5

[State 1500, VelSet]
type = VelSet
trigger1 = AnimElem = 9 && !var(10)
trigger2 = AnimElem = 13 && var(10) = 1
trigger3 = AnimElem = 17 && var(10) = 2
x = 0

[State 1500, PlayerPush]
type = PlayerPush
triggerAll = AnimElemTime(3) >= 0
trigger1 = AnimElemTime(9) < 0 && !var(10)
trigger2 = AnimElemTime(13) < 0 && var(10) = 1
trigger3 = AnimElemTime(17) < 0 && var(10) = 2
value = 0
ignoreHitPause = 1

[State 1500, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;=====================<ZENTO>==========================
[StateDef 1530]
type = S
physics = N
moveType = I
anim = 1530
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0
faceP2 = 1

[State 1530, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 4,3
channel = 0

[State 1530, Roll Sound]
type = PlaySnd
trigger1 = !Time
value = 110,0
channel = 1

[State 1530, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 2
stateType = A
physics = N

[State 1530, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x = 6.325

[State 1530, VelSet]
type = VelSet
trigger1 = AnimElem = 7
x = 0

[State 1530, PlayerPush]
type = PlayerPush
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(7) < 0
value = 0
ignoreHitPause = 1

[State 1530, Hitting the floor sound]
type = PlaySnd
trigger1 = AnimElem = 7
value = F7,0
channel = 3

[State 1530, Hitting the floor effect]
type = Explod
trigger1 = AnimElem = 7
anim = F60
sprPriority = -10
posType = P1

[State 1530, VelSet]
type = VelSet
trigger1 = AnimElem = 12
x = -4.375
y = -3.75

[State 1530, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(12) > 0
y = 0.5859375

[State 1530, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 1531


;Landing
[StateDef 1531]
type = S
anim = 1531
physics = N
moveType = I
velSet = 0,0

[State 1531, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 1531, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1531, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0
channel = 1

[State 1531, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;========================<RASETSUKYAKU>=============================
[StateDef 1600]
type = S
physics = N
moveType = A
anim = 1600
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1600, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
;ifElse((command = "c" || command = "rlsc"), 2, ifElse((command = "b" || command = "rlsb"), 1, 0))
var(10) = ifElse((NumExplod(90000250) || NumExplod(90000255)), 2, ifElse((NumExplod(90000240) || NumExplod(90000245)), 1, 0))

[State 1600, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2Dist x > 225 || Random < 333), 2, ifElse(P2Dist x > 210, 1, 0))

[State 1600, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 0, 1600, ifElse(var(10) = 1, 1610, 1620)) + (var(40) = 2)

[State 1600, Voice]
type = PlaySnd
trigger1 = !Time && var(40) = 1
value = 1600,0
channel = 0

[State 1600, Voice (Master)]
type = PlaySnd
trigger1 = !Time && var(40) = 2
value = 3000,0
channel = 0

[State 1600, Rasetsukyaku sound effect]
type = PlaySnd
trigger1 = !Time
value = 1600,1
channel = 1

[State 1600, AttackDist]
type = AttackDist
trigger1 = 1
value = 0
ignoreHitPause = 1

[State 1600, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(5) < 0 && !var(10)
trigger2 = AnimElemTime(7) < 0 && var(10) = 1
trigger3 = AnimElemTime(9) < 0 && var(10) = 2
value = SCA
time = 1

[State 1600, Rasetsukyaku Fade Away]
type = Helper
trigger1 = AnimElem = 3
helperType = Normal
stateNo = 1605
ID = 1605
name = "Rasetsukyaku Fade Away"
posType = P1
ownPal = 1

[State 1600, PosAdd]
type = PosAdd
trigger1 = AnimElem = 3
x = 22

[State 1600, VelSet]
type = VelSet
trigger1 = AnimElem = 3
x = 11

[State 1600, VelMul]
type = VelMul
trigger1 = AnimElemTime(5) > 0 && !var(10)
trigger2 = AnimElemTime(7) > 0 && var(10) = 1
trigger3 = AnimElemTime(9) > 0 && var(10) = 2
x = 0.8671875023712158

[State 1600, Movement AfterImage]
type = AfterImage
trigger1 = AnimElem = 4
time = 2
timeGap = 1
frameGap = 4
length = 9
palBright = 0,0,0
palContrast = 128,128,128
palPostBright = 0,0,0
palAdd = 0,0,0
palMul = 0.9,0.9,0.9
trans = Add1

[State 1600, AfterImage Off]
type = AfterImage
trigger1 = AnimElem = 6 && !var(10)
time = 0
length = 1

[State 1600, AfterImage Off]
type = AfterImageTime
trigger1 = var(10) = 1 && AnimElemTime(7) >= 0
trigger2 = var(10) = 2 && AnimElemTime(9) >= 0
time = 0

[State 1600, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(6) >= 0 && !var(10)
trigger2 = AnimElemTime(10) >= 0 && var(10) = 1
trigger3 = AnimElemTime(14) >= 0 && var(10) = 2
moveType = I

[State 1600, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;========================<PUNCH ZERO COUNTER>=============================
[StateDef 2900]
type = S
physics = N
moveType = A
anim = 2900
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0

[State 2900, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(3) < 0
value = SCA
time = 1
ignoreHitPause = 1

[State 2900, Voice]
type = PlaySnd
trigger1 = !Time
value = 1100,0 + 10 * (var(40) = 1)
channel = 0

[State 2900, Woosh sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,2
channel = 1

[State 2900, Jump Sound]
type = PlaySnd
trigger1 = AnimElemTime(4) = 1
value = 40,0
channel = 4

[State 2900, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 3
stateType = A
physics = N

[State 2900, Dust Helper]
type = Helper
trigger1 = AnimElem = 4
helperType = Normal
stateNo = 8100
ID = 8100
name = "Oniyaki Dust"
posType = P1
ownPal = 1

[State 2900, VelSet]
type = VelSet
trigger1 = AnimElemTime(4) = 2
x = 9.375
y = -9.375

[State 2900, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(4) > 2 && vel x >= 0
x = -0.78125

[State 2900, VelSet]
type = VelSet
trigger1 = vel x < 0
x = 0

[State 2900, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(4) > 2
y = 0.5859375

[State 2900, Ground Hit]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 3
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 0
getPower = 0,0
givePower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
animType = Hard
air.animType = Hard
fall.animType = Hard
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -0.5, -10
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -0.5, -10
air.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 36), var(36) := -79
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
kill = 0

[State 2900, Air Hit]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 4
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 0
getPower = 0,0
givePower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
animType = DiagUp
air.animType = DiagUp
fall.animType = DiagUp
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2.5, -10
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -2.5, -10
air.cornerPush.velOff = 0
airGuard.velocity = -8, -1
airGuard.cornerPush.velOff = 0
yAccel = 0.537109375
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 27), var(36) := -112
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
kill = 0

[State 2900, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(6) >= 0
moveType = I

[State 2900, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 1101



;========================<KICK ZERO COUNTER>=============================
[StateDef 2910]
type = S
physics = N
moveType = A
anim = 2910
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0

[State 2910, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(3) < 0
value = SCA
time = 1
ignoreHitPause = 1

[State 2910, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 4, ifElse(Random < 500, 3, 4) + 9 * (var(40) = 1)
channel = 0

[State 2910, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,5
channel = 1

[State 2910, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 3
attr = C, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 0
getPower = 0,0
givepower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
animType = DiagUp
air.animType = DiagUp
fall.animType = DiagUp
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -5.54, -5.25
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -5.54, -5.25
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 73), var(36) := -5
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
kill = 0

[State 2910, ChangeAnimElem]
type = ChangeAnim
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) <= 0
trigger1 = HitPauseTime <= ifElse(var(20), 4, 10)
value = 2910
elem = 4
ignoreHitPause = 1

[State 2910, StateTypeSet: Idle]
type = StateTypeset
trigger1= AnimElemTime(5) >= 0
moveType = I

[State 2910, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
