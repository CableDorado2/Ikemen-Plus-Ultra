; _________________________________________
;| Ken by Phantom.of.the.Server & Jmorphman|
; ?
;==============================================================================================
;========================================<SUPER STATES>========================================
;==============================================================================================

;========================<SHORYUREPPA>=============================
[StateDef 3000]
type = S
physics = S
moveType = A
anim = 3000
ctrl = 0
velSet = 0,0
juggle = ifelse((prevstateno = [1000, 4999]), 0, 6) * !var(20)
sprPriority = 1
faceP2 = 1
	
[State 3000, Strength]
type = varset
triggerall = !AILevel
trigger1 = !time
var(10) = Ifelse(command="holdz" && Power>=2000,1,0)

[State 3000, Strength AI]
type = varset
triggerall = AILevel
trigger1 = !time
var(10) = Ifelse((Random<400 || var(59)) && Power>=2000,1,0)

[State 3000, Poweradd]
type = poweradd
trigger1 = !time
value = -1000-(1000*var(10))

[State No Cornor Push]
type = varset
trigger1 = !time
fvar(5) = 0

[State 3000, PosFix]
type = PosAdd
triggerall = P2dist y > -50 && Anim = 3000
trigger1 = AnimElem=4
trigger2 = AnimElem=15
trigger3 = AnimElem=26
x = 22

[State 3000, lightversion]
type = ChangeAnim
triggerall = Anim = 3000 && var(10) = 0
trigger1= Animelem = 11
value = 3000
Elem = 22

[State 3000, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3000, Unguardable Ticks]
type = VarSet
trigger1 = Time = 2 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 42

[State 3000, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(4) < 3
time = 1
value = SCA

[State 3000, SuperPause FX]
type = Helper
trigger1 = Time = 2 && var(10)=0
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = 11,-28
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3000, Super Pause FX]
type = Helper
trigger1 = Time = 2 && var(10)=1
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = 11,-28
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3000, SuperPause]
type = SuperPause
trigger1 = Time = 2
Time = 40
moveTime = 40
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3000, "Ikuse!"]
type = PlaySnd
trigger1 = AnimElem = 1 && var(40) != 1
value = 3000,0
channel = 0

[State 3000, "SHORYUREPPA!!!"]
type = PlaySnd
trigger1 = AnimElem = 2 && var(40) != 1
value = 3000,1
channel = 0

[State 3000, "Muda da!"]
type = PlaySnd
trigger1 = AnimElem = 1 && var(40) = 1
value = 3100,10
channel = 0

[State 3000, "SHORYUREPPA!!!" (Violent)]
type = PlaySnd
trigger1 = AnimElem = 2 && var(40) = 1
value = 3000,10
channel = 0

[State 3000, Woosh Sound]
type = PlaySnd
triggerall = Anim = 3000
trigger1 = AnimElem = 2 || AnimElem = 13 || AnimElem = 24
value = 1,2
channel = 1

[State 3000, Jump Sound]
type = PlaySnd
triggerall = Anim = 3000
trigger1 = AnimElemTime(26) = 2
value = 40,0
channel = 3

[State 3000, Dust Helper]
type = Helper
triggerall = Anim = 3000
trigger1 = AnimElemTime(26) = 0
helperType = Normal
stateNo = 8100
ID = 8100
name = "Shoryureppa Dust"
posType = P1
ownPal = 1

[State 3000, VelSet]
type = VelSet
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(4) < 0
trigger2 = AnimElemTime(13) >= 0 && AnimElemTime(15) < 0
trigger3 = AnimElemTime(24) >= 0 && AnimElemTime(30) < 0
x = 6 + 2*(AnimElemTime(26) >= 0)

[State 3000, Velocity]
type = VelSet
trigger1 = Anim = 3000 && Animelem=26
y = -12

[State 3000, AirTypeChange]
type = StateTypeSet
trigger1 = Anim = 3000 && Animelem=26
stateType = A
physics = A

[State 3000, Slow 0]
type = VelMul
triggerall = var(10) = 0
trigger1 = AnimElemTime(27) >= 0 && AnimElemTime(30)<0
x = 1-(time - 71)*4.0/100

[State 3000, Slow 1]
type = VelMul
triggerall = var(10) = 1
trigger1 = AnimElemTime(27) >= 0 && AnimElemTime(30)<0
x = 1-(time - 93)*4.0/100

[State 3000, stop]
type = Velset
trigger1 = StateType = A && Vel y > 0
x = 0
presistence = 0

[State 3000, 1st Hit]
type = HitDef
triggerall = !(P2StateNo = [5070,5120])
trigger1 = Anim = 3000
trigger1 =  AnimElem = 2 || AnimElem = 13
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 5, Hit
damage = 40-(10*var(10)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 20
ground.slideTime = 20
guard.hitTime = 20
air.hitTime = 120
ground.velocity = -3,0
ground.cornerPush.velOff = 0
guard.velocity = -5
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 0
hitSound = -1 + 0 * (var(51) := 2)
guardSound = -1 + 0 * (var(52) := 0)
sparkNo = -1 + 0 * (var(53) := 8014)
guard.sparkNo = -1 + 0*(var(54) := 8001)
sparkXY = -10 + 0 * (var(55) := 40), var(56) := -60
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
ID = 3000

[State 3000, 2ndhit]
type = HitDef
triggerall = !(P2StateNo = [5070,5120])
trigger1 = Anim = 3000
trigger1 =  AnimElem = 3 || AnimElem = 14
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = 40-(10*var(10)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 20
ground.slideTime = 20
guard.hitTime = 20
air.hitTime = 120
ground.velocity = -3,0
ground.cornerPush.velOff = 0
guard.velocity = -5
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(51) := 2)
guardSound = -1 + 0 * (var(52) := 0)
sparkNo = -1 + 0 * (var(53) := 8014)
guard.sparkNo = -1 + 0*(var(54) := 8001)
sparkXY = -10 + 0 * (var(55) := 40), var(56) := -70
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
ID = 3000

[State 3000, HitDef 3]
type = HitDef
triggerall = !(P2StateNo = [5070,5120])
trigger1 = anim = 3000
trigger1 =  AnimElem = 4 || AnimElem = 15
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = 30-(20*var(10)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 20
ground.slideTime = 20
guard.hitTime = 20
air.hitTime = 120
ground.velocity = -3,0
ground.cornerPush.velOff = 0
guard.velocity = -5
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(51) := 2)
guardSound = -1 + 0 * (var(52) := 0)
sparkNo = -1 + 0 * (var(53) := 8014)
guard.sparkNo = -1 + 0*(var(54) := 8001)
sparkXY = -10 + 0 * (var(55) := 40), var(56) := -120
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
ID = 3000

[State 3000, Fire Sound]
type = PlaySnd
trigger1 = AnimElem = 23
value = 1100,1
channel = 4

[State 3000, Shoryureppa Flames Explod]
type = Explod
trigger1 = AnimElem = 23
anim = 3005
ID = 3005
sprPriority = 3
bindTime = 2
posType = P1
pos = 10,-28
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3000, ModifyExplod]
type = ModifyExplod
trigger1 = AnimElem = 24
ID = 3005
pos = 19,-39
posType = P1
bindTime = 2

[State 3000, ModifyExplod]
type = ModifyExplod
trigger1 = AnimElem = 25
ID = 3005
pos = 36,-82
posType = P1
bindTime = 4

[State 3000, ModifyExplod]
type = ModifyExplod
trigger1 = AnimElem = 26
ID = 3005
pos = 12,-143
posType = P1
bindTime = 20

[State 3000, Last 1]
type = HitDef
trigger1 = Anim = 3000
trigger1 =  AnimElem = 24
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = 40-(10*var(10)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 8,8
guard.pauseTime = 8,8
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 20
ground.slideTime = 20
guard.hitTime = 20
air.hitTime = 120
ground.velocity = -3,0
ground.cornerPush.velOff = 0
guard.velocity = -5
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(51) := 2)
guardSound = -1 + 0 * (var(52) := 0)
sparkNo = -1 + 0 * (var(53) := 8014)
guard.sparkNo = -1 + 0*(var(54) := 8001)
sparkXY = -10 + 0 * (var(55) := 40), var(56) := -60
palFX.time = 45
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3000, Last 2]
type = HitDef
trigger1 = Anim = 3000
trigger1 =  AnimElem = 25
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = 40-(10*var(10)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 8,8
guard.pauseTime = 8,8
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 20
ground.slideTime = 20
guard.hitTime = 20
air.hitTime = 120
ground.velocity = -3,-5
ground.cornerPush.velOff = 0
guard.velocity = -5
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(51) := 2)
guardSound = -1 + 0 * (var(52) := 0)
sparkNo = -1 + 0 * (var(53) := 8014)
guard.sparkNo = -1 + 0*(var(54) := 8001)
sparkXY = -10 + 0 * (var(55) := 40), var(56) := -70
palFX.time = 45
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
ID = 3000

[State 3000, Last Air]
type = HitDef
triggerall = Anim = 3000
trigger1 =  AnimElem = 26
trigger2 = var(10) && (AnimElem = 27 || AnimElem = 28 ||  AnimElem = 29)
attr = A, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = 40-(15*var(10)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = DiagUp
ground.type = High
air.type = Low
ground.hitTime = 20
ground.slideTime = 20
guard.hitTime = 20
air.hitTime = 120
ground.velocity = -3, -10
ground.cornerPush.velOff = 0
guard.velocity = -12
guard.cornerPush.velOff = 0
air.velocity = -3, -10
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(51) := 2)
guardSound = -1 + 0 * (var(52) := 0)
sparkNo = -1 + 0 * (var(53) := 8014)
guard.sparkNo = -1 + 0*(var(54) := 8001)
sparkXY = -10 + 0 * (var(55) := 40), var(56) := -120
palFX.Time = 27
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
ID = 3000

[State 3000, Flame Particles]
type = Helper
triggerall = Anim = 3000
trigger1 = AnimElemTime(23) > 0
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

[State 3000, StateTypeSet: Idle]
type = StateTypeSet
triggerall = Anim = 3000
trigger1 = AnimElem = 30
moveType = I


;Landing================
[StateDef 3001]
type = S
anim = 3001
physics = S
moveType = I
velSet = 0,0
ctrl = 0

[State 3001, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 3001, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3001, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 3001, End]
type = ChangeState
trigger1 = !AnimTime
value = 11
ctrl = 1


;========================<SHINRYUKEN>=============================
[StateDef 3100]
type = S
physics = S
moveType = A
anim = 3100
ctrl = 0
velSet = 0,0
sprPriority = 1
juggle = ifelse((prevstateno = [1000, 4999]), 0, 6) * !var(20)
powerAdd = -2000
faceP2 = 1

[State 3100, Strength]
type = varset
trigger1 = !time && var(10) != 1
var(10) = 1

[State No Cornor Push]
type = varset
trigger1 = !time
fvar(5) = 0

[State 3100, Unguardable Ticks]
type = VarSet
trigger1 = Time = 2 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 42

[State 3100, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3100, NotHitBy]
type = NotHitBy
trigger1 = Anim = 3100
trigger2 = Anim = 3101
trigger2 = Animelemtime(4)<0
time = 1
value = SCA

[State 3100, Super Pause FX]
type = Helper
trigger1 = Anim = 3100 && Time = 2
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = 11,-28
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3100, Super Pause]
type = SuperPause
trigger1 = Anim = 3100 && Time = 2
Time = 40
moveTime = 40
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3100, Voice 1]
type = PlaySnd
trigger1 = Anim = 3100 && !Time
value = 3100,0 + 10 * (var(40) = 1)
channel = 0

[State 3100, Voice 2]
type = PlaySnd
trigger1 = Anim = 3100 && AnimElem = 5
value = 3100,1 + 10 * (var(40) = 1)
channel = 0

[State 3100, HitDef low]
type = HitDef
triggerall = !(P2StateNo = [5070,5120])
triggerall =  Anim = 3100
trigger1 =  AnimElem = 5 || AnimElem = 6
attr = S, HA
hitFlag = MAFL
guardFlag = M
priority = 5, Hit
damage = 30,7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Hard
air.animType = Up
fall.animType = Up
ground.type = Low
air.type = Low
ground.hitTime = 20
ground.slideTime = 20
guard.hitTime = 20
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = -2
guard.cornerPush.velOff = 0
air.velocity = 0, -2
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(51) := 2)
guardSound = -1 + 0 * (var(52) := 0)
sparkNo = -1 + 0 * (var(53) := 8012)
guard.sparkNo = -1 + 0*(var(54) := 8001)
sparkXY = -10 + 0 * (var(55) := 35), var(56) := -30
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3100, HitDef High]
type = HitDef
triggerall = !(P2StateNo = [5070,5120])
trigger1 = Anim = 3100 &&  AnimElem = 7
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 5, Hit
damage = 50,7
getPower = 0,0
givePower = 36, 36
pauseTime = 2,0
guard.pauseTime = 2,4
animType = Hard
air.animType = Up
fall.animType = Up
ground.type = High
air.type = Low
ground.hitTime = 20
ground.slideTime = 20
guard.hitTime = 20
air.hitTime = 120
ground.velocity = 2, -12
ground.cornerPush.velOff = 0
guard.velocity = -6
guard.cornerPush.velOff = 0
air.velocity = 2, -10
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(51) := 2)
guardSound = -1 + 0 * (var(52) := 0)
sparkNo = -1 + 0 * (var(53) := 8012)
guard.sparkNo = -1 + 0*(var(54) := 8001)
sparkXY = -10 + 0 * (var(55) := 40), var(56) := -70
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
ID = 3100

[State 3100, Jump to air anim]
type = ChangeAnim
trigger1 = anim = 3100 && !AnimTime
value = 3101

[State 3100, add vel init]
type = posadd
trigger1 = anim = 3101 && animelem=1
x = 14

[State 3100, add vel init]
type = veladd
trigger1 = anim = 3101 && animelem=1
y = -7

[State 3100, add vel init]
type = veladd
triggerall = anim = 3101
trigger1 = animelemtime(1)>=0 && animelemtime(15)<0
trigger1 = time%3=0
y = -1

[State 3100 noPlayerpush]
type = PlayerPush
triggerall = anim = 3101
trigger1 = animelemtime(1)>=0 && animelemtime(15)<0
value = 0
ignoreHitPause = 1

[State 3100, StateTypeChange]
type = StateTypeSet
trigger1 = anim = 3101 && animelem=1
stateType = A
physics = A

[State 3100, Jump Sound]
type = PlaySnd
triggerall = anim = 3101
trigger1 = animelem=1
value = 40,0
channel = 3

[State 3100, Woosh Sound]
type = PlaySnd
triggerall = anim = 3101
trigger1 = animelem = 2
value = 1,5
channel = 1

[State 3100, Fire Sound]
type = PlaySnd
triggerall = anim = 3101
trigger1 = animelem = 1
value = 3100,2
channel = 4

[State 3100, Dust Helper]
type = Helper
triggerall = anim = 3101
trigger1 = animelem=1
helperType = Normal
stateNo = 8100
ID = 8100
name = "Shinryuken Dust"
posType = P1
ownPal = 1

[State 3100, Flames Explod]
type = Explod
trigger1 = anim = 3101 && animelem = 1
anim = 3105
ID = 3105
sprPriority = 3
bindTime = 28
removeTime = -2
posType = P1
pos = 10,-144
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1
trans = addalpha
alpha = 230,255
removeOnGetHit = 1
ignoreHitPause = 0

[State 3100, Flame Explod modify]
type = ModifyExplod
triggerall = NumExplod(3105)
trigger1 = anim = 3101
trigger1 = time >= 80 && time < 100
ID = 3105
trans = addalpha
alpha = 230-10*(time-80),255

[State 3100, Flame Particles]
type = Helper
trigger1 = AnimElemTime(1) >= 0
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


[State 3100, Air Hits]
type = HitDef
triggerall = !(P2StateNo = [5070,5120])
triggerall = anim = 3101
trigger1 = AnimElem = 1 || AnimElem = 3 || AnimElem = 5 || AnimElem = 7 || AnimElem = 9 || AnimElem = 11 || AnimElem = 13
trigger2 = AnimElem = 2 || AnimElem = 4 || AnimElem = 6 || AnimElem = 8 || AnimElem = 10 || AnimElem = 12 || AnimElem = 14
trigger2 = var(12)
attr = A, HA
hitFlag = MAF
guardFlag = M
priority = 5, Hit
damage = 18,7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Up
ground.type = High
air.type = Low
ground.hitTime = 20
ground.slideTime = 20
guard.hitTime = 20
air.hitTime = 120
ground.velocity = 2.0 * IfElse((P2Dist x = [-30,30]),0,IfElse(P2Dist x>0,1,-1)), -6
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = 2.0 * IfElse((P2Dist x = [-30,30]),0,IfElse(P2Dist x>0,1,-1)), -6
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
fall.damage = 5
forceStand = 1
hitSound = -1 + 0 * (var(51) := 2)
guardSound = -1 + 0 * (var(52) := 0)
sparkNo = -1 + 0 * (var(53) := 8012)
guard.sparkNo = -1 + 0*(var(54) := 8001)
sparkXY = -10 + 0 * (var(55) := 40), var(56) := -120
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
ID = 3100

[State 3100, Mashing]
type = VarSet
trigger1 = !Time
var(12) = 0

[State 3100, Mashing]
type = varadd
trigger1 = !AILevel && command = "a" || command = "b" || command = "c"
trigger2 = AILevel && Random < (AILevel*100.0)
var(12) = 3

[State 3100, Mashing Decrement]
type = varadd
trigger1 = var(12)
var(12) = -1

[State 3100, Master PalFX]
type = PalFX
triggerall = anim = 3101 && var(40) = 2
trigger1 = AnimElemTime(14)=1
Time = 37
add = 0,0,0
mul = 100,100,100
sinAdd = 0,0,0,1
invertAll = 0
color = 256

[State 3100, Master Shinryuken Mask]
type = Explod
triggerall = var(40) = 2 && anim = 3101
trigger1 = AnimElem = 15
anim = 3102
ID = 3102
sprPriority = 2
bindTime = -1
removetime = 27
posType = P1
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0


[State 3100, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = anim = 3101 && AnimElem = 15
moveType = I

;Master Landing================
[StateDef 3111]
type = S
anim = 3111
physics = S
moveType = I
velSet = 0,0
ctrl = 0

[State 3111, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 3111, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3111, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 3111, Master Shinryuken Mask]
type = Explod
trigger1 = !time
anim = 3112
ID = 3112
sprPriority = 2
bindTime = -1
removetime = -2
posType = P1
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3111, End]
type = ChangeState
trigger1 = !AnimTime
value = 11
ctrl = 1

[State 3111, EndWIN]
type = ChangeState
triggerall = winko
trigger1 = anim = 3111 && animelemtime(1)=8
value = 3112
ctrl = 0


;========================<WIN BY SHINRYUKEN (MASTER)>=============================
[Statedef 3112]
type = S
physics = S

[State 3112, Master Shinryuken Mask]
type = Explod
trigger1 = !Time && !NumExplod(3114)
anim = 3114
ID = 3114
facing = 1
sprPriority = 2
removeTime = -1
posType = P1
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 3112, PalFX]
type = PalFX
trigger1 = 1
time = -1
add = 0,0,0
mul = 100,100,100
sinAdd = 0,0,0,1
invertAll = 0
color = 256

[State 3112, ChangeAnim]
type = ChangeAnim
trigger1 = !Time && anim != 3113
value = 3113

[State 3112, win]
type = changestate
trigger1 = time >= 120 && roundstate = 3 && PrevStateNo != 180
value = ifelse(roundstate = 3, 180, 0)
ctrl = 1

;========================<SHIPPU JINRAIKYAKU>=============================
[StateDef 3200]
type = S
physics = S
moveType = A
anim = 3200
ctrl = 0
velSet = 0,0
juggle = ifelse((prevstateno = [1000, 4999]), 0, 6) * !var(20)
sprPriority = 1
faceP2 = 1

[State 3200, INIT]
type = varset
trigger1 = !time
var(10) = 0
persistence = 0


[State 3200, Strength]
type = varset
trigger1 = !AILevel && Power>=2000 && Anim = 3200 && !time
var(10) = IfElse(command = "holdc" && var(40),1,0)

[State 3200, Strength AI]
type = varset
trigger1 = AILevel && Power>=2000 && Anim = 3200 && !time
var(10) = IfElse((Random<400 || var(59)) && var(40),1,0)

[State 3200, Poweradd]
type = Poweradd
trigger1 = !time
value = -1000-1000*var(10)

[State No Cornor Push]
type = varset
trigger1 = !time
fvar(5) = 0

[State 3200, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3000, Unguardable]
type = VarSet
trigger1 = Time = 2 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 42

[State 3200, NotHitBy]
type = NotHitBy
trigger1 = anim = 3200 && AnimElemTime(4) < 2
time = 1
value = SCA

[State 3200, Super Pause FX]
type = Helper
trigger1 = Time = 2 && var(10) = 0
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = 22,-66
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3000, Super Pause FX]
type = Helper
trigger1 = Time = 2 && var(10)
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = 22,-66
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1


[State 3200, SuperPause]
type = SuperPause
trigger1 = Time = 2
time = 40
moveTime = 40
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3200, Voice 1]
type = PlaySnd
triggerall = anim = 3200
trigger1 = Time = 2 && var(40) != 1
value = 3000,0
channel = 0

[State 3200, Voice 2]
type = PlaySnd
triggerall = anim = 3200
trigger1 = AnimElem = 4 && var(40) != 1
value = 3200,0
channel = 0

[State 3200, Voice 1 (Violent)]
type = PlaySnd
triggerall = anim = 3200
trigger1 = Time = 2 && var(40) = 1
value = 3100,10
channel = 0

[State 3200, Voice 2 (Violent)]
type = PlaySnd
triggerall = anim = 3200
trigger1 = AnimElem = 4 && var(40) = 1 && !var(10)
value = 3200,10
channel = 0

[State 3200, Voice 2 (Violent)]
type = PlaySnd
triggerall = anim = 3200
trigger1 = AnimElem = 4 && var(40) = 1 && var(10)
value = 3400,0
channel = 0

[State 3200, Voice Lv2 (Master)]
type = PlaySnd
triggerall = anim = 3250 && var(10) && var(40) = 2
trigger1 = animelem = 37
value = 3100,1
channel = 0

[State 3200, Woosh Sound]
type = PlaySnd
trigger1 = anim = 3200
trigger1 = AnimElem = 4 || AnimElem = 13 || AnimElem = 23 || AnimElem = 33 || AnimElem = 42
trigger2 = anim = 3201
trigger2 = animelemtime(5)=1 || animelemtime(11)=1 || animelemtime(17)=1 || animelemtime(23)=1 || animelemtime(29)=1 || animelemtime(35)=1 || animelemtime(41)=1 || animelemtime(46)=1
trigger3 = anim = 3250
trigger3 = animelemtime(3)=1 || animelemtime(13)=1 || animelemtime(24)=1 || animelemtime(35)=1
value = 1,2

[State 3200, PosAdd]
type = PosAdd
triggerall = anim = 3200
trigger1 = AnimElem = 11 || AnimElem = 21 || AnimElem = 31
x = 16

[State 3200, veladd]
type = veladd
triggerall = anim = 3200
trigger1 = AnimElem = 4 || AnimElem = 14 || AnimElem = 24 || AnimElem = 34
x = 4

[State 3200, veladd]
type = veladd
triggerall = anim = 3200
trigger1 = AnimElem = 44
x = 8

[State 3200, LV2 Moves]
type = ChangeAnim
trigger1 = anim = 3200 && var(10)
trigger1 = animelem = 41
value = 3250

[State 3200, PosAdd]
type = PosAdd
triggerall = anim = 3250
trigger1 = AnimElem = 1
x = 16

[State 3200, PosAdd]
type = PosAdd
triggerall = anim = 3250
trigger1 = AnimElem = 16 || AnimElem = 27 || AnimElem = 38
x = 20

[State 3200, veladd]
type = veladd
triggerall = anim = 3250
trigger1 = AnimElem = 3
x = 5

[State 3200, veladd]
type = veladd
triggerall = anim = 3250
trigger1 = AnimElemtime(16) = 1 || AnimElemtime(27) = 1
x = 10

[State 3200, veladd]
type = veladd
triggerall = anim = 3250
trigger1 = AnimElem = 38
y = -8

[State 3200, StateTypeSet: Air]
type = StateTypeSet
triggerall = anim = 3250
trigger1 = AnimElem = 38
StateType = A
Physics = A
MoveType = A

[State 3200, veladd]
type = veladd
triggerall = anim = 3250
trigger1 = AnimElem = 41 || AnimElem = 44
y = -2

[State 3200, HitDef Mid]
type = HitDef
triggerall = !(P2StateNo = [5070,5120])
triggerall = anim = 3200
trigger1 = AnimElem = 4
trigger2 = AnimElem = 34
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = 35,7
getPower = 0,0
givePower = 36, 36
pauseTime = 2,4
guard.pauseTime = 2,4
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 22
ground.slideTime = 22
guard.hitTime = 22
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -2, -6
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(51) := 5)
guardSound = -1 + 0 * (var(52) := 0)
sparkNo = -1 + 0 * (var(53) := 8014)
guard.sparkNo = -1 + 0*(var(54) := 8001)
sparkXY = -10 + 0 * (var(55) := 160), var(56) := -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
ID = 3200

[State 3200, HitDef High]
type = HitDef
triggerall = !(P2StateNo = [5070,5120])
triggerall = anim = 3200
trigger1 = AnimElem = 14 || AnimElem = 24
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = 35,7
getPower = 0,0
givePower = 36, 36
pauseTime = 2,4
guard.pauseTime = 2,4
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 22
ground.slideTime = 22
guard.hitTime = 22
air.hitTime = 120
ground.velocity = -1,0
ground.cornerPush.velOff = 0
guard.velocity = -1
guard.cornerPush.velOff = 0
air.velocity = -2, -6
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(51) := 5)
guardSound = -1 + 0 * (var(52) := 0)
sparkNo = -1 + 0 * (var(53) := 8014)
guard.sparkNo = -1 + 0*(var(54) := 8001)
sparkXY = -10 + 0 * (var(55) := 160), var(56) := -100
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
ID = 3200

[State 3200, HitDef Back]
type = HitDef
triggerall = anim = 3250
trigger1 = AnimElem = 6
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = 10,7
getPower = 0,0
givePower = 36, 36
pauseTime = 2,4
guard.pauseTime = 2,4
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 22
ground.slideTime = 22
guard.hitTime = 22
air.hitTime = 120
ground.velocity = 4,0
ground.cornerPush.velOff = 0
guard.velocity = 4
guard.cornerPush.velOff = 0
air.velocity = 2, -6
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(51) := 5)
guardSound = -1 + 0 * (var(52) := 0)
sparkNo = -1 + 0 * (var(53) := 8014)
guard.sparkNo = -1 + 0*(var(54) := 8001)
sparkXY = -10 + 0 * (var(55) := 160), var(56) := -100
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
ID = 3200

[State 1100, ShoRyus Low]
type = HitDef
trigger1 = Anim = 3250
trigger1 = AnimElem = 14 || AnimElem = 15 || AnimElem = 25 || AnimElem = 26 || AnimElem = 36 || AnimElem = 37
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = 15,10
getPower = 0,0
givePower = 6,6
pauseTime = 3,3
animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 22
ground.slideTime = 22
guard.hitTime = 22
air.hitTime = 120
ground.velocity = -3, 0
ground.cornerPush.velOff = 0
guard.velocity = -3
guard.cornerPush.velOff = 0
air.velocity = -3, -5
air.cornerPush.velOff = 0
yAccel = 0.5
fall = !var(10)
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(51) := 2)
guardSound = -1 + 0 * (var(52) := 0)
sparkNo = -1 + 0 * (var(53) := 8013)
guard.sparkNo = -1 + 0 * (var(54) := 8001)
sparkXY = -10 + 0 * (var(55) := 40), var(56) := -70
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
ID = 3200

[State 1100, ShoRyus High]
type = HitDef
trigger1 = Anim = 3250
trigger1 = AnimElem = 16 || AnimElem = 27
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = 15,10
getPower = 0,0
givePower = 6, 6
pauseTime = 3,3
animType = Back
ground.type = High
air.type = Low
ground.hitTime = 22
ground.slideTime = 22
guard.hitTime = 22
air.hitTime = 120
ground.velocity = -3, -6
ground.cornerPush.velOff = 0
guard.velocity = -3
guard.cornerPush.velOff = 0
air.velocity = -3, -5
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(51) := 2)
guardSound = -1 + 0 * (var(52) := 0)
sparkNo = -1 + 0 * (var(53) := 8013)
guard.sparkNo = -1 + 0 * (var(54) := 8001)
sparkXY = -10 + 0 * (var(55) := 40), var(56) := -70
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
ID = 3200

[State 3200, NoPush]
type = PlayerPush
triggerall = anim = 3250
trigger1 = animelemtime(38)>=0 && animelemtime(49)<0
value = 0
ignorehitpause = 1

[State 3200, ShinRyuKen Air Hits]
type = HitDef
triggerall = anim = 3250
trigger1 = animelemtime(38)>=0 && animelemtime(45)<0
trigger1 = time%2 = 0
attr = A, HA
hitFlag = MAF
guardFlag = M
priority = 5, Hit
damage = 10,7
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Up
air.animType = Up
fall.animType = Up
ground.type = High
air.type = Low
ground.hitTime = 20
ground.slideTime = 20
guard.hitTime = 20
air.hitTime = 120
ground.velocity = 2.0 * ifElse(P2Dist x < 0, -1, 1), IfElse(P2Dist y < -60,-4,-11)
ground.cornerPush.velOff = 0
guard.velocity = -12
guard.cornerPush.velOff = 0
air.velocity = 2.0 * ifElse(P2Dist x < 0, -1, 1), IfElse(P2Dist y < -60,-3.6,-8)
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(51) := 2)
guardSound = -1 + 0 * (var(52) := 0)
sparkNo = -1 + 0 * (var(53) := 8012)
guard.sparkNo = -1 + 0*(var(54) := 8001)
sparkXY = -10 + 0 * (var(55) := 40), var(56) := -120
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
ID = 3200

[State 3200, Fire Sound]
type = PlaySnd
triggerall = anim = 3250
trigger1 = animelemtime(37) = 4
value = 3100,2
channel = 4

[State 3100, Flames Explod]
type = Explod
trigger1 = anim = 3250 && animelem = 38
anim = 3105
ID = 3105
sprPriority = 3
bindTime = 15
removeTime = -2
posType = P1
pos = 10,-144
scale = 0.6,0.6
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1
trans = addalpha
alpha = 230,255
removeOnGetHit = 1
ignoreHitPause = 0

[State 3200, Flame Explod modify]
type = ModifyExplod
triggerall = NumExplod(3105)
trigger1 = anim = 3250
trigger1 = time >= 194 && time < 220
ID = 3105
trans = addalpha
alpha = 230-8*(time-194),255

[State 3200, Flame Particles]
type = Helper
trigger1 = anim = 3250
trigger1 = AnimElemTime(38) >= 0
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


[State 3200, HitDef Up]
type = HitDef
trigger1 = anim = 3200
trigger1 = AnimElem = 44
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = 40,7
getPower = 0,0
givePower = 36, 36
pauseTime = 2,4
guard.pauseTime = 2,4
animType = Up
air.animType = Up
fall.animType = Up
ground.type = High
air.type = Low
ground.hitTime = 22
ground.slideTime = 22
guard.hitTime = 22
air.hitTime = 120
ground.velocity = -3,-7
ground.cornerPush.velOff = 0
guard.velocity = -3
guard.cornerPush.velOff = 0
air.velocity = -2, -6
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(51) := 5)
guardSound = -1 + 0 * (var(52) := 0)
sparkNo = -1 + 0 * (var(53) := 8014)
guard.sparkNo = -1 + 0*(var(54) := 8001)
sparkXY = -10 + 0 * (var(55) := 44), var(56) := -60
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
ID = 3200

[State 3200, StateTypeSet: Idle]
type = StateTypeSet
triiger1 = anim = 3200
trigger1 = AnimElem = 46
moveType = I

[State 3200, End]
type = ChangeState
trigger1 = Anim = 3200 && !AnimTime
value = 0
ctrl = 1

[State 3200, ChangeAnim]
type = ChangeAnim
trigger1 = MoveHit && NumTarget(3200) && AnimElem = 45
trigger1 = Target(3200),StateNo=5000 && Target(3200),time < 4
value = 3201

[State 3200, veladd init]
type = veladd
trigger1 = StateType != A && anim = 3201
y = -7
persistent = 0

[State 3200, veladd rest]
type = veladd
triggerall = anim = 3201
trigger1 = animelemtime(5)=1 || animelemtime(11)=1 || animelemtime(17)=1 || animelemtime(23)=1
y = -2
x = -0.9

[State 3200, StateTypeSet: air]
type = StateTypeSet
trigger1 = anim = 3201
trigger1 = StateType != A
Statetype = A
Physics = A

[State 3200, Penultimate Hits]
type = HitDef
triggerAll = anim = 3201 && HitCount < 10
trigger1 = animelemtime(6)=1 || animelemtime(12)=1 || animelemtime(18)=1 || animelemtime(24)=1 || animelemtime(30)=1 || animelemtime(36)=1 || animelemtime(42)=1 || animelemtime(48)=1
trigger2 = animelemtime(9)=1 || animelemtime(15)=1 || animelemtime(21)=1 || animelemtime(27)=1 || animelemtime(33)=1 || animelemtime(39)=1 || animelemtime(45)=1 || animelemtime(51)=1
attr = A, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = 8,7
getPower = 0,0
givePower = 36, 36
pauseTime = 2,3
guard.pauseTime = 2,3
animType = up
air.animType = up
fall.animType = up
ground.type = High
air.type = Low
ground.hitTime = 22
ground.slideTime = 22
guard.hitTime = 22
air.hitTime = 120
ground.velocity = 0, -9
ground.cornerPush.velOff = 0
guard.velocity = -12
guard.cornerPush.velOff = 0
air.velocity = -4, IfElse(P2dist y > 0,-7,-3)
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(51) := 5)
guardSound = -1 + 0 * (var(52) := 0)
sparkNo = -1 + 0 * (var(53) := 8014)
guard.sparkNo = -1 + 0*(var(54) := 8001)
sparkXY = -10 + 0 * (var(55) := 81), var(56) := -70
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
ID = 3200

[State 3200, StateTypeSet: Idel]
type = StateTypeSet
trigger1 = anim = 3250 && animelem = 46
Movetype = I





;========================<JOUEN SHINRYUKEN SF4>=============================
[StateDef 3300]
type = S
physics = S
moveType = A
anim = 3300
ctrl = 0
velSet = 0,0
sprPriority = 1
juggle = ifelse((prevstateno = [1000, 4999]), 0, 6) * !var(20)
powerAdd = -3000
faceP2 = 1

[State 3300, Strength]
type = varset
trigger1 = !time && var(10) != 2
var(10) = 2

[State 3300 No Cornor Push]
type = varset
trigger1 = !time
fvar(5) = 0

[State 3300, Unguardable Ticks]
type = VarSet
trigger1 = Time = 2 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 72

[State 3300, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3300, NotHitBy]
type = NotHitBy
trigger1 = anim = 3300
trigger2 = anim = 3310 && animelemtime(30)>=0
trigger3 = anim = 3312 && animelemtime(18)<0
time = 1
value = SCA,AA,AT,AP
ignorehitpause = 1

[State 3300, Super Pause FX]
type = Helper
trigger1 = Time = 2
helperType = Normal
stateNo = 8530
ID = 8500
name = "Superpause FX"
posType = p1
pos = -28,-78
superMoveTime = 255
ownpal = 1

[State 3300, Super Pause]
type = SuperPause
trigger1 = Time = 2
Time = 70
moveTime = 70
anim = -1
sound = s8500,0
darken = 0

[State 3300, Voice Take this]
type = PlaySnd
trigger1 = Anim = 3300 && Animelem = 3
value = 3300,0
channel = 0

[State 3300, Voice WolaWola]
type = PlaySnd
trigger1 = Anim = 3310 && Animelem = 5
value = 3300,1
channel = 0

[State 3300, Voice Shinryuken]
type = PlaySnd
trigger1 = Anim = 3310 && Animelemtime(31)=1
trigger2 = Anim = 3300 && Animelemtime(10)=1
trigger2 = !NumTarget(3300) || !MoveHit
value = 3300,2
channel = 0

[State 3300, SoundFX Hit]
type = PlaySnd
triggerall = Anim = 3300 && Animelemtime(10)=0
trigger1 = NumTarget(3300) && MoveHit
trigger1 = Target(3300),StateNo = 3306 ||  Target(3300),StateNo = 5000 || Target(3300),StateNo = 5020
value = 2,10

[State 3300, SoundFX Fire]
type = PlaySnd
trigger1 = Anim = 3310 && Animelemtime(32)=1
trigger2 = Anim = 3300 && Animelemtime(10)=1
trigger2 = !NumTarget(3300) || !MoveHit
value = 1100,1

[State 3300, Shoryuken Flames Explod 1]
type = Explod
triggerall = !NumExplod(3305)
trigger1 = Anim = 3312 && AnimElemtime(1)=1
trigger2 = Anim = 3301 && AnimElemtime(1)=1
anim = 3305
ID = 3305
sprPriority = 3
bindTime = -1
removetime = -1
posType = P1
pos = 10,-144
scale = 0.46,0.46
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 1

[State 3300, Flame 2 out]
type = ModifyExplod
triggerall = NumExplod(3305)
trigger1 = Anim = 3301 && animelemtime(9)=1
ID = 3305
bindTime = 1
removetime = 62

[State 3300, Flame 2 out]
type = ModifyExplod
triggerall = NumExplod(3305)
trigger1 = Anim = 3301 && time >= 108 && time < 134
ID = 3305
trans = addalpha
alpha = 255-9*(time-108),255
ignoreHitPause = 1

[State 3300, Flame 1 out]
type = ModifyExplod
triggerall = NumExplod(3305)
trigger1 = Anim = 3312 && time =259
ID = 3305
bindTime = 1
removetime = 90

[State 3300, Flame 1 out]
type = ModifyExplod
triggerall = NumExplod(3305)
trigger1 = Anim = 3312 && time >= 260 && time < 276
ID = 3305
trans = addalpha
alpha = 255-15*(time-260),255
ignoreHitPause = 1

[State 220, Woosh]
type = PlaySnd
trigger1 = Anim = 3300 && Animelem = 7
trigger2 = anim = 3310
trigger2 = animelem = 5 || animelem = 10 || animelem = 13 || animelem = 16 || animelem = 24 || animelem = 31
value = 1,2
channel = 1

[State 3300, HitDef 1st Hit]
type = HitDef
triggerall = !(P2StateNo = [5070,5120])
trigger1 =  Anim = 3300 && AnimElem = 9
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 7, Hit
damage = 60,10
getPower = 0,0
givePower = 36,36
pauseTime = 48,48
guard.pauseTime = 48,48
animType = Up
ground.type = Low
air.type = Low
ground.hitTime = 46
ground.slideTime = 46
guard.hitTime = 22
air.hitTime = 46
ground.velocity = -1.2, -3
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -1.2, -3
air.cornerPush.velOff = 0
yAccel = 0.1
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(51) := 11)
guardSound = -1 + 0 * (var(52) := 0)
sparkNo = -1 + 0 * (var(53) := 8014)
guard.sparkNo = -1 + 0*(var(54) := 8001)
sparkXY = -10 + 0 * (var(55) := 40), var(56) := -70
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 20
envShake.ampl = 9
envShake.freq = 100
maxdist = 50, 20
mindist = 1,0
kill = 0
ID = 3300

[State 3300, Target]
type = TargetState
triggerall =  Anim = 3300 && AnimElemtime(9)>=0 && animelemtime(10)<0
trigger1 = MoveHit && Numtarget(3300)
trigger1 = (Target(3300),StateNo=5000 || Target(3300),StateNo=5020)
value = 3306

[State 3300, Success]
type = ChangeAnim
trigger1 = anim = 3300 && !AnimTime && MoveHit && Numtarget(3300)
trigger1 = Target(3300),StateNo=3306 && target(3300),time < 8
value = 3310

[State 3300, Fail hit]
type = ChangeState
trigger1 = anim = 3300
trigger1 = !AnimTime
value = 3301

[State 3300, Landstop]
type = velset
trigger1 = StateType = A && Pos y >= 0
x = 0
y = 0

[State 3300, Land]
type = StateTypeSet
trigger1 = Anim != 3312 || Anim != 3301
trigger1 = StateType = A && Pos y >= 0
stateType = S
physics = S

[State 3300, Gravity]
type = VelAdd
trigger1 = Anim != 3312 || Anim != 3301
trigger1 = StateType = A
y = 0.2

[State 3300, Leap shoryu]
type = veladd
trigger1 = Anim = 3310 && animelemtime(1) = 0
x = 1.2
y = -4

[State 3300, StateTypeSet: Air, Physics: N]
type = StateTypeSet
trigger1 = Anim = 3310 && animelemtime(1) = 1
stateType = A
physics = N

[State 3300, NoPush]
type = PlayerPush
trigger1 = Anim = 3310
trigger1 = Animelemtime(9)>=0 && Animelemtime(32)<0
value = 0
ignorehitpause = 1

[State 3300, Posfix 1]
type = posadd
trigger1 = Anim = 3300 && animelemtime(9)=0
x = 10

[State 3300, Posfix 2]
type = posadd
trigger1 = Anim = 3310 && animelem = 30
x = IfElse(P2StateType=A,78,IfElse((P2dist x=[0,78]),P2dist x,78))

[State 3300, Success Airhit]
type = HitDef
trigger1 =  Anim = 3310 && AnimElem = 7
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = 29,10
getPower = 0,0
givePower = 36,36
pauseTime = 8,8
animType = Hard
ground.type = Low
air.type = Low
ground.hitTime = 46
ground.slideTime = 46
guard.hitTime = 22
air.hitTime = 46
ground.velocity = -0.2, 0
ground.cornerPush.velOff = 0
guard.velocity = -3
guard.cornerPush.velOff = 0
air.velocity = -0.2, 0
air.cornerPush.velOff = 0
yAccel = 0.4
fall = 0
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(51) := 5)
guardSound = -1 + 0 * (var(52) := 0)
sparkNo = -1 + 0 * (var(53) := 8014)
guard.sparkNo = -1 + 0*(var(54) := 8001)
sparkXY = -10 + 0 * (var(55) := 40), var(56) := -70
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 8
envShake.ampl = 4
envShake.freq = 80
kill = 0
P2StateNo = 3307
ID = 3300

[State 3300, Success LowHit 1]
type = HitDef
triggerall =  Anim = 3310
trigger1 = AnimElem = 11
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = 29,10
getPower = 0,0
givePower = 36,36
pauseTime = 8,8
animType = Hard
ground.type = Low
air.type = Low
ground.hitTime = 38
ground.slideTime = 38
guard.hitTime = 22
air.hitTime = 38
ground.velocity = -4, 0
ground.cornerPush.velOff = 0
guard.velocity = -3
guard.cornerPush.velOff = 0
air.velocity = -4, 0
air.cornerPush.velOff = 0
yAccel = 0.4
fall = 0
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(51) := 5)
guardSound = -1 + 0 * (var(52) := 0)
sparkNo = -1 + 0 * (var(53) := 8014)
guard.sparkNo = -1 + 0*(var(54) := 8001)
sparkXY = -10 + 0 * (var(55) := 200), var(56) := -40
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 8
envShake.ampl = 4
envShake.freq = 80
kill = 0
ID = 3300

[State 3300, Success LowHits]
type = HitDef
triggerall =  Anim = 3310
trigger1 = AnimElem = 14 || AnimElem = 17 || AnimElem = 21 || AnimElem = 26
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = 29,10
getPower = 0,0
givePower = 10,10
pauseTime = 6,6
animType = Hard
ground.type = High
air.type = Low
ground.hitTime = 38
ground.slideTime = 38
guard.hitTime = 22
air.hitTime = 38
ground.velocity = -2, 0
ground.cornerPush.velOff = 0
guard.velocity = -3
guard.cornerPush.velOff = 0
air.velocity = -2, 0
air.cornerPush.velOff = 0
yAccel = 0.4
fall = 0
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(51) := 5)
guardSound = -1 + 0 * (var(52) := 0)
sparkNo = -1 + 0 * (var(53) := 8014)
guard.sparkNo = -1 + 0*(var(54) := 8001)
sparkXY = -10 + 0 * (var(55) := 200), var(56) := -70
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 8
envShake.ampl = 4
envShake.freq = 80
kill = 0
ID = 3300

[State 3300, Success Shoryu Ready]
type = HitDef
triggerall =  Anim = 3310
trigger1 = AnimElem = 32
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = 29,10
getPower = 0,0
givePower = 36,36
pauseTime = 8,8
animType = Up
ground.type = Low
air.type = Low
ground.hitTime = 38
ground.slideTime = 38
ground.velocity = -1, -7
ground.cornerPush.velOff = 0
guard.velocity = -3
guard.cornerPush.velOff = 0
air.velocity = -1, -7
air.cornerPush.velOff = 0
yAccel = 0.4
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(51) := 2)
guardSound = -1 + 0 * (var(52) := 0)
sparkNo = -1 + 0 * (var(53) := 8014)
guard.sparkNo = -1 + 0*(var(54) := 8001)
sparkXY = -10 + 0 * (var(55) := 200), var(56) := -90
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 8
envShake.ampl = 4
envShake.freq = 80
kill = 1
ID = 3300

[State 3300, Last Shoryu]
type = ChangeAnim
trigger1 = anim = 3310 && !animtime
value = 3312

[State 3300, Last Shoryu no push]
type = PlayerPush
trigger1 = anim = 3312 && animelemtime(21)<0
value = 0
ignorehitpause = 1

[State 3300, Last Shoryu vel up]
type = veladd
trigger1 = anim = 3312 && animelemtime(1)=0
trigger2 = Anim = 3301 && animelemtime(1)=0
y = -8

[State 3300, StateTypeSet: Air, Physics: A]
type = StateTypeSet
trigger1 = Anim = 3312 && animelemtime(1)=0
trigger2 = Anim = 3301 && animelemtime(1)=0
stateType = A
physics = A

[State 3300, Last Shoryu vel cont up]
type = veladd
triggerall = anim = 3312
trigger1 = animelemtime(4)>=0 && animelemtime(20)<0 && time%3=0
y = -2.06

[State 3300, Last Shoryu hits]
type = HitDef
triggerall = anim = 3312
trigger1 = animelemtime(1)>=1 && animelemtime(16)<0 && time%5=0
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = 24,10
getPower = 0,0
givePower = 36,36
pauseTime = 1,1
animType = Up
ground.type = Low
air.type = Low
ground.hitTime = 38
ground.slideTime = 38
ground.velocity = IfElse(P2dist x <0, -0.8,0), -5.8
ground.cornerPush.velOff = 0
guard.velocity = -3
guard.cornerPush.velOff = 0
air.velocity = IfElse(P2dist x <0, -0.8,0), -5.8
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(51) := 2)
guardSound = -1 + 0 * (var(52) := 0)
sparkNo = -1 + 0 * (var(53) := 8014)
guard.sparkNo = -1 + 0*(var(54) := 8001)
sparkXY = -10 + 0 * (var(55) := 200), var(56) := -120
palFX.time = 48
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 8
envShake.ampl = 4
envShake.freq = 80
kill = 0
ID = 3312

[State 3300, Last Shoryu Final hit]
type = HitDef
triggerall = anim = 3312
trigger1 = animelem = 17
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = 45,10
getPower = 0,0
givePower = 36,36
pauseTime = 1,1
animType = DiagUp
ground.type = Low
air.type = Low
ground.hitTime = 38
ground.slideTime = 38
ground.velocity = -2, -5
ground.cornerPush.velOff = 0
guard.velocity = -3
guard.cornerPush.velOff = 0
air.velocity = -2, -5
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
fall.damage = 10
forceStand = 1
hitSound = -1 + 0 * (var(51) := 2)
guardSound = -1 + 0 * (var(52) := 0)
sparkNo = -1 + 0 * (var(53) := 8014)
guard.sparkNo = -1 + 0*(var(54) := 8001)
sparkXY = -10 + 0 * (var(55) := 200), var(56) := -120
palFX.time = 48
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 8
envShake.ampl = 4
envShake.freq = 80
kill = 1
ID = 3312

[State 3300, Flame Particles]
type = Helper
triggerall = !NumHelper(8150)
triggerall = Anim = 3301 || Anim = 3312
trigger1 = AnimElemTime(1)=1
trigger1 = MoveHit && NumTarget
trigger1 = var(43) := (Target, ID)
helperType = Normal
stateNo = 8150
ID = 8150
name = "Flame Particles"
posType = P2
ownPal = 1
ignoreHitPause = 1

[State 3300, Lost Target]
type = ChangeState
trigger1 = Anim = 3310 && Animelemtime(9)=0
trigger1 = MoveHit > 8
value = 10
Ctrl = 1

[State Idle]
type=statetypeset
trigger1= anim = 3312
trigger1= animelemtime(21)>=0
movetype=I

;========== Miss Shot Shoryuken =========
[StateDef 3301]
type = A
physics = A
moveType = A
anim = 3301
ctrl = 0
velSet = 0,-4.2
sprPriority = 1

[State 3301, NotHitBy]
type = NotHitBy
trigger1 = anim = 3301
trigger1 = animelemtime(9)<0
time = 1
value = SCA,AA,AT,AP
ignorehitpause = 1

[State 3301, Miss Shoryu vel cont up]
type = veladd
triggerall = anim = 3301
trigger1 = animelemtime(1)>=0 && animelemtime(11)<0 && time%5=0
y = -2.1

[State 3301, NoPush]
type = PlayerPush
trigger1 = Anim = 3301
trigger1 = Animelemtime(1)>=0 && Animelemtime(13)<0
value = 0
ignorehitpause = 1

[State 3301, Shoryuken Flames Explod 1]
type = Explod
triggerall = !NumExplod(3305)
trigger1 = Anim = 3301 && AnimElemtime(1)=0
anim = 3305
ID = 3305
sprPriority = 3
bindTime = -1
removetime = -1
posType = P1
pos = 10,-144
scale = 0.46,0.46
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 1

[State 3301, Flame 2 out]
type = ModifyExplod
triggerall = NumExplod(3305)
trigger1 = Anim = 3301 && animelemtime(9)=0
ID = 3305
bindTime = 1
removetime = 61

[State 3301, Flame 2 out]
type = ModifyExplod
triggerall = NumExplod(3305)
trigger1 = Anim = 3301 && time >= 28 && time < 60
ID = 3305
trans = addalpha
alpha = 255-7*(time-28),255
ignoreHitPause = 1


[State 3301, Miss Shoryu hits]
type = HitDef
triggerall = anim = 3301
trigger1 = animelem = 1 || animelem = 2 || animelem = 3 || animelem = 4
trigger2 = animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 5, Hit
damage = 30,10
getPower = 0,0
givePower = 36,36
pauseTime = 1,1
animType = Up
ground.type = Low
air.type = Low
ground.hitTime = 22
ground.slideTime = 22
ground.velocity = IfElse(P2dist x <0, -0.8,0), -6
ground.cornerPush.velOff = 0
guard.velocity = -3
guard.cornerPush.velOff = 0
air.velocity = IfElse(P2dist x <0, -0.8,0), -6
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(51) := 2)
guardSound = -1 + 0 * (var(52) := 0)
sparkNo = -1 + 0 * (var(53) := 8014)
guard.sparkNo = -1 + 0*(var(54) := 8001)
sparkXY = -10 + 0 * (var(55) := 200), var(56) := -120
palFX.time = 48
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 8
envShake.ampl = 4
envShake.freq = 80
kill = 0
ID = 3300

[State 3301, Flame Particles]
type = Helper
triggerall = !NumHelper(8150)
triggerall = Anim = 3301
trigger1 = MoveHit && NumTarget
trigger1 = var(43) := (Target, ID)
helperType = Normal
stateNo = 8150
ID = 8150
name = "Flame Particles"
posType = P2
ownPal = 1
ignoreHitPause = 1

[State Idle]
type=statetypeset
trigger1= 3301
trigger1= animelemtime(12)>=0
movetype=I

;========== Target Air ================
[StateDef 3306]
type = A
physics = N
anim = 5051
movetype = H
ctrl = 0
velset = 0,0

[State 3306, 3] ;Gravity
type = VelAdd
trigger1 = 1
y = GetHitVar(yaccel)

[State 3306, 3]
type = HitVelSet
trigger1 = Time = 0
x = 1
y = 1

[State 3306, trans]
type = ChangeAnim
trigger1 = anim = 5051 && vel y > -1
value = 5061

[State 3306, End]
type = SelfState
trigger1 = Pos y >= 0 && vel y > 0
value = 5100

;========= Target Ground ==========
[StateDef 3307]
type = S
physics = S
anim = 5012
movetype = H
ctrl = 0
velset = 0,0

[State 3307, Pos fix]
type = posset
trigger1 = !time
y = 0

[State 3307, NoFall]
type = HitFallSet
trigger1 = !time
value = 0

[State 3307, move]
type = HitVelSet
trigger1 = Time = 0
x = 1

[State 3307 anim]
type = ChangeAnim
trigger1 = Anim = 5012 && !Animtime
value = Anim + 5

[State 3307, end]
type = SelfState
trigger1 = anim = 5017 && !Animtime
value = 0
Ctrl = 1

;=========== Landing =============
[StateDef 3320]
type = C
Physics = C
MoveType = I
ctrl = 0
velset = 0,0
Anim = 3321 - !NumTarget(3312)

[State 3320, Posfix]
type = posset
trigger1 = !time
y = 0

[State 3320, Stay C]
type = ChangeState
triggerall = Animelemtime(4) = 6
trigger1 = !AILevel && command = "holddown"
trigger2 = AILevel && Random < 500
value = 11
Ctrl = 1

[State 3320, End]
type = ChangeState
trigger1 = !Animtime
value = 0
Ctrl = 1



;========================<SHINBU MESSATSU Iori Like Super>=============================
[StateDef 3500]
type = S
physics = N
moveType = A
anim = 3500
ctrl = 0
velSet = 0,0
sprPriority = 1
juggle = ifelse((prevstateno = [1000, 4999]), 0, 6) * !var(20)
powerAdd = -3000
faceP2 = 1

[State 3500, Strength]
type = varset
trigger1 = !time && var(10) != 2
var(10) = 2

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

[State No Cornor Push]
type = varset
trigger1 = !time
fvar(5) = 0

[State 3500, Unguardable]
type = VarSet
trigger1 = Time = 2 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 45

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
trigger1 = Anim = 3500
trigger1 = AnimElemTime(7) < 0
time = 1
value = SCA

[State 3500, Super Pause FX]
type = Helper
trigger1 = Time = 2
helperType = Normal
stateNo = 8520
ID = 8500
name = "Superpause FX"
posType = p1
pos = 2,-82
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3500, Super Pause]
type = SuperPause
trigger1 = !Time
time = 43
moveTime = 43
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3500, Woosh Sound]
type = PlaySnd
trigger1 = Anim = 3500
trigger1 = AnimElem = 6
value = 41,0
channel = 1

[State 3500, End of Dash Sound]
type = PlaySnd
trigger1 = Anim = 3500
trigger1 = AnimElem = 8
trigger2 = Anim = 3501
trigger2 = AnimElem = 2
value = 52,0
channel = 1

[State 3500, VelSet]
type = VelSet
trigger1 = Anim = 3500
trigger1 = AnimElem = 6
x = 12

[State 3500, VelMul]
type = VelMul
trigger1 = Anim = 3500
trigger1 = AnimElemTime(7) > 0
x = 0.85

[State 3500, VelMul]
type = VelMul
triggerall = vel x > 0
trigger1 = Anim = 3501
trigger1 = Animelemtime(1)>=0
x = 0.85 - (0.02*(38-Abs(Animtime)))

[State 3500, VelSet]
type = VelSet
trigger1 = Anim = 3500
trigger1 = AnimElem = 8
trigger2 = Anim = 3501
trigger2 = AnimElem = 2
x = 0

[State 3500, Dust Helper]
type = Helper
trigger1 = Anim = 3500
trigger1 = AnimElem = 6
helperType = Normal
stateNo = 8103
ID = 8100
name = "Shinbu Messatsu Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 3500, HitDef]
type = HitDef
trigger1 = Anim = 3500
trigger1 = AnimElem = 6
attr = S, HA
hitFlag = M
guardFlag = M
priority = 4, Hit
damage = 0,0
getPower = 0,0
givePower = 36, 36
pauseTime = 11,12
guard.pauseTime = 11,12
animType = Hard
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
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(51) := 5)
guardSound = -1 + 0 * (var(52) := 0)
sparkNo = -1 + 0 * (var(53) := 8014)
guard.sparkNo = -1 + 0*(var(54) := 8001)
sparkXY = -10 + 0 * (var(55) := 60), var(56) := -65
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
ID = 3500

[State 3500, Landing Dust Explod]
type = Explod
trigger1 = Anim = 3500
trigger1 = AnimElem = 8
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3500, ChangeState Success]
type = ChangeState
trigger1 = NumTarget(3500) && MoveHit
trigger1 = Target, Alive && (Target,StateNo = [5000,5099])
value = 3510

[State 3500, ChangeState Fail]
type = ChangeAnim
trigger1 = MoveContact && Anim = 3500
value = 3501

[State 3500, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = Anim = 3500
trigger1 = AnimElem = 7
trigger2 = Anim = 3501
moveType = I

[State 3500, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;Success
[StateDef 3510]
type = S
moveType = A
physics = N
anim = 3510
ctrl = 0
velSet = 0,0

[State 3510, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0
ignorehitpause = 1


[State 3510, TargetState]
type = TargetState
trigger1 = !time && NumTarget(3500)
trigger1 = Target(3500),StateNo != 3550
value = 3550

[State 3510, TargetBind]
type = TargetBind
trigger1 = NumTarget && AnimElemTime(74) < 0
pos = 40,0

[State 3510, Voice (Violent)]
type = PlaySnd
trigger1 = !Time && var(40) = 1
value = 3500,0
channel = 0

[State 3510, Voice]
type = PlaySnd
trigger1 = !Time && var(40) = 2
value = 730,1
channel = 0

[State 3510, LP Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 1 || AnimElem = 3 || AnimElem = 6
value = 1,0

[State 3510, HP Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 33 || AnimElem = 63
value = 1,2

[State 3510, LK Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 15
value = 1,3

[State 3510, MK Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 10
value = 1,4

[State 3510, HK Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 23 || AnimElem = 43 || AnimElem = 54
value = 1,5

[State 3510, Hit Sound]
type = Null
trigger1 = AnimElem = 2 || AnimElem = 4 || AnimElem = 7
trigger1 = var(51) := 0
trigger2 = AnimElem = 34 || AnimElem = 64
trigger2 = var(51) := 2
trigger3 = AnimElem = 16
trigger3 = var(51) := 3
trigger4 = AnimElem = 11
trigger4 = var(51) := 4
trigger5 = AnimElem = 24 || AnimElem = 44 || AnimElem = 55
trigger5 = var(51) := 5

[State 3510, Spark XY]
type = Null
trigger1 = AnimElem = 2 || AnimElem = 4 || AnimElem = 7
trigger1 = var(55) := 78 || var(56) := -84
trigger2 = AnimElem = 11
trigger2 = var(55) := 70 || var(56) := -82
trigger3 = AnimElem = 16
trigger3 = var(55) := 85 || var(56) := -47
trigger4 = AnimElem = 24
trigger4 = var(55) := 172 || var(56) := -66
trigger5 = AnimElem = 34
trigger5 = var(55) := 103 || var(56) := -88
trigger6 = AnimElem = 44
trigger6 = var(55) := 44 || var(56) := -60
trigger7 = AnimElem = 55
trigger7 = var(55) := 60 || var(56) := -75
trigger8 = AnimElem = 64
trigger8 = var(55) := 103 || var(56) := -66

[State 3510, HitDef: High]
type = HitDef
trigger1 = AnimElem = 2 || AnimElem = 4 || AnimElem = 7 || AnimElem = 11 || AnimElem = 34 || AnimElem = 55 || AnimElem = 64
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = 28,4
getPower = 0,0
givePower = 36, 36
pauseTime = 2,40
guard.pauseTime = 2,4
animType = Hard
air.animType = Back
fall.animType = Back
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
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1
guardSound = -1 + 0 * (var(52) := 0)
sparkNo = -1 + 0 * (var(53) := 8014)
guard.sparkNo = -1 + 0*(var(54) := 8001)
sparkXY = -10, -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0
ID = 3510

[State 3510, HitDef: Low]
type = HitDef
trigger1 =AnimElem = 16 || AnimElem = 24 || AnimElem = 44
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = 28,4
getPower = 0,0
givePower = 36, 36
pauseTime = 2,40
guard.pauseTime = 2,4
animType = Hard
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
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1
guardSound = -1 + 0 * (var(52) := 0)
sparkNo = -1 + 0 * (var(53) := 8014)
guard.sparkNo = -1 + 0*(var(54) := 8001)
sparkXY = -10, -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0
ID = 3510

[State 3510, Final Hit]
type = HitDef
trigger1 = AnimElem = 74
ID = 3510
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = 50,8
getPower = 0,0
givePower = 36, 36
pauseTime = 30,33
animType = Up
ground.hitTime = 20
ground.slideTime = 20
guard.hitTime = 20
air.hitTime = 120
ground.velocity = -1.5, -6.5
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -1.5, -6.5
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(51) := 11)
guardSound = -1 + 0 * (var(52) := 0)
sparkNo = -1 + 0 * (var(53) := 8014)
guard.sparkNo = -1 + 0*(var(54) := 8001)
sparkXY = -10 + 0 * (var(55) := 40), var(56) := -70
palFX.time = 98
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
ID = 3510

[State 3510, Flame Particles]
type = Helper
trigger1 = AnimElemTime(74) > 0
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

[State 3510, BGPALFX]
type = BGPalFX
trigger1 = Anim = 3510
trigger1 = time >= 70
add = -(time-70),-3*(time-70),-3*(time-70)
mul = 256,256,256
time = 1
ignorehitpause = 1

[State 3510, End]
type = ChangeState
trigger1 = !AnimTime
value = 3520


;Finish
[StateDef 3520]
type = A
moveType = A
physics = N
anim = 3520
ctrl = 0
velSet = 0,-10.5

[State 3520, VelAdd]
type = VelAdd
trigger1 = 1
y = 0.5

[State 3510, BGPALFX]
type = BGPalFX
trigger1 = Anim = 3520
trigger1 = time <= 10
add = 200-(20*time),200-(20*time),200-(20*time)
mul = 256,256,256
time = 1
ignorehitpause = 1

[State 3520, dingsound]
type = playsnd
trigger1 = !time
value = 2,10

[State 3520, Air Hit]
type = HitDef
trigger1 = Anim = 3520
trigger1 = AnimElem = 1
attr = A, HA
hitFlag = MAFD
guardFlag = M
priority = 6, Hit
damage = 100,10
getPower = 0,0
givePower = 5, 55
pauseTime = 0,0
animType = DiagUp
ground.hitTime = 22
ground.slideTime = 22
guard.hitTime = 22
air.hitTime = 120
ground.velocity = -1.5, -25
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -1.5, -25
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
fall.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(51) := 11)
guardSound = -1 + 0 * (var(52) := 0)
sparkNo = -1 + 0 * (var(53) := 8014)
guard.sparkNo = -1 + 0*(var(54) := 8001)
sparkXY = -10 + 0 * (var(55) := 40), var(56) := -70
palFX.time = 98
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
ID = 3520

[State 3520, Target]
type = TargetState
trigger1 = MoveHit && NumTarget(3520)
trigger1 = Target(3520),time < 2 && Target(3520),StateNo >= 5000
value = 3555
ignorehitpause = 1

[State 3520, Orochi Skull Sound]
type = PlaySnd
trigger1 = Anim=3520 && Animelemtime(3)=0
value = 3500,1
channel = 1
persistent = 0

[State 3520, Orochi Skull]
type = Helper
trigger1 = Anim=3520 && Animelemtime(3)=0
helperType = Normal
stateNo = 3525
ID = 3525
name = "Orochi Skull"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1
persistent = 0

[State 3520, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 3530



;Landing
[StateDef 3530]
type = S
anim = ifElse(var(40) = 2, 3531, 3530)
physics = N
moveType = I
velSet = 0,0

[State 3530, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 3530, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3530, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 3530, Voice (Violent)]
type = PlaySnd
trigger1 = AnimElem = 2 && var(40) = 1
value = 3500,2
channel = 0

[State 3530, Voice]
type = PlaySnd
trigger1 = !Time && var(40) = 2
value = 3500,3
channel = 0

[State 3530, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Target
[StateDef 3550]
type = S
moveType = H
physics  = N
velSet = 0,0

[State 3550, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 3550, HitFallSet]
type = HitFallSet
trigger1 = Time = 0
value = 0

[State 3550, ChangeAnim]
type = ChangeAnim
trigger1 = Time = 0
value = 5002

[State 3550, ChangeAnim]
type = ChangeAnim
trigger1 = Time > 0
value = Anim

[State 3550, ChangeState]
type = ChangeState
trigger1 = HitShakeOver
value = 3551


;Sliding
[StateDef 3551]
type = S
movetype = H
physics = S

[State 3551, ChangeAnim]
type = ChangeAnim
trigger1 = !AnimTime
value = 5007

[State 3551, DefenceMulSet]
type = DefenceMulSet
trigger1 = HitOver
value = 1

[State 3551, SelfState]
type = SelfState
trigger1 = HitOver
value = 0
ctrl = 1

;Target
[StateDef 3555]
type = A
moveType = H
Physics = N
ctrl = 0
velset = 0,0

[State 3555, anim]
type = ChangeAnim
trigger1 = AnimExist(5051)
trigger1 = !time
value = 5051

[State 3555, anim]
type = ChangeAnim
trigger1 = time && Anim = 5051
trigger1 = AnimExist(5052)
trigger1 = Vel y > -5
value = 5052

[State 3555, 1]
type = HitVelSet
trigger1 = Time = 0
x = 1
y = 1

[State 3555, 2]
type = VelAdd
trigger1 = 1
y = GetHitVar(yaccel)

[State 3555, FFB Hard]
type = ForceFeedback
trigger1 = !time
persistent = 0
time = 15
waveform = sinesquare
ampl = 140

[State 3555, Screen]
type = ScreenBound
trigger1 = time > 8
value = 0
movecamera = 1,0

[State 3555, Damage]
type = LifeAdd
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = -20
persistence = 0

[State 3555, 6]
type = SelfState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 5100

;========================<DOUBLE SHINKU HADOKEN>=============================
[StateDef 3600]
type = S
physics = N
moveType = I
anim = 0
ctrl = 0
velSet = 0,0
sprPriority = 1
faceP2 = 1

[State No Cornor Push]
type = varset
trigger1 = !time
fvar(5) = 0

[State 3600, ChangeAnim]
type = ChangeAnim
trigger1 = abs(Partner, P2Dist x - P2Dist x) > 10
trigger1 = Partner, P2Dist x > P2Dist x
trigger1 = Anim = 0
value = 105

[State 3600, ChangeAnim]
type = ChangeAnim
trigger1 = abs(Partner, P2Dist x - P2Dist x) > 10
trigger1 = Partner, P2Dist x < P2Dist x
trigger1 = Anim = 0
value = 110

[State 3600, Dash Backwards]
type = VelSet
trigger1 = AnimElem = 2 && Anim = 105
x = const(velocity.run.back.x)
y = const(velocity.run.back.y)

[State 3600, Back Dash Sound]
type = PlaySnd
trigger1 = AnimElem = 2 && Anim = 105
value = 105,0

[State 3600, VelSet]
type = VelSet
trigger1 = AnimElem = 2 && Anim = 110
x = 7.76

[State 3600, VelMul]
type = VelMul
trigger1 = AnimElemTime(2) > 0 && Anim = 110
x = 0.98

[State 3600, Dash Sound]
type = PlaySnd
trigger1 = Anim = 110 && AnimElemTime(1) = 0
value = 110,0

[State 3600, Dust Helper]
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

[State 3600, Dust Helper]
type = Helper
trigger1 = AnimElem = 2 && (Anim = 105 || Anim = 110)
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
facing = -1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 3600, ChangeState]
type = ChangeState
trigger1 = Partner, StateNo = 3601
value = 3601

[State 3600, End]
type = ChangeState
triggerAll = !AnimTime
trigger1 = Anim = 105
trigger2 = Anim = 110
value = ifElse(Anim = 105, 106, 111)


;Success
[StateDef 3601]
moveType = A
velSet = 0,0

[State 3601, Landing Sound]
type = PlaySnd
trigger1 = !Time && (Anim = 105 || Anim = 110)
value = 100,1

[State 3601, Landing Dust Explod]
type = Explod
trigger1 = !Time && (Anim = 105 || Anim = 110)
anim = 8102
sprpriority = -3
postype = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3601, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 3600

[State 3601, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000,2999]) && var(7)) || var(20)

[State 3601, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3601, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1



[State 3601, Unguardable]
type = VarSet
trigger1 = Time = 2 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 43

[State 3601, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3601, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3601, NotHitBy]
type = NotHitBy
trigger1 = Anim = 3600
trigger1 = AnimElemTime(9) < 0
time = 1
value = SCA
ignorehitpause = 1

[State 3601, Voice 1]
type = PlaySnd
trigger1 = AnimElem = 3
value = 3600,0
channel = 0

[State 3601, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 6
value = 1000,0
channel = 0

[State 3601, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;========================<SOURYUKEN>=============================
[StateDef 3700]
type = S
physics = N
moveType = A
anim = 3700
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -3000
faceP2 = 1

[State 3700, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000,2999]) && var(7)) || var(20)

[State 3700, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3700, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3700, Unguardable]
type = VarSet
trigger1 = Time = 2 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 43

[State 3700, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3700, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3700, NotHitBy]
type = NotHitBy
trigger1 = anim = 3700
time = 1
value = SCA

[State 3700, Super Pause FX]
type = Helper
trigger1 = Time = 2
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = p1
pos = -8,-58
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3700, Super Pause FX (Partner)]
type = Helper
trigger1 = Time = 2 && NumPartner
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(P2Dist x + Partner, P2Dist x),-58
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3700, Super Pause]
type = SuperPause
trigger1 = AnimElem = 4
Time = 23
moveTime = 23
p2DefMul = 1
unHittable = 1
anim = -1
darken = 0

[State 3700, Super Pause Sound]
type = PlaySnd
trigger1 = Time = 2
value = 8500,0

[State 3700, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 7
stateType = A
physics = N

[State 3700, Voice]
type = PlaySnd
trigger1 = AnimElem = 7
value = 1300,0
channel = 0

[State 3700, Dust Helper]
type = Helper
trigger1 = AnimElem = 7
helperType = Normal
stateNo = 8100
ID = 8100
name = "Ryusenkyaku Dust"
posType = P1
ownPal = 1

[State 3700, VelSet]
type = VelSet
trigger1 = AnimElem = 9
x = P2Dist x/36
y = -15.5

[State 3700, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(9) > 0
y = 1

[State 3700, HitDef]
type = HitDef
trigger1 =  AnimElem = 12
attr = S, HA
hitFlag = MAF
guardFlag =
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 2,4
guard.pauseTime = 2,4
animType = Hard
air.animType = Back
fall.animType = Back
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
air.velocity = 0, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(51) := 2)
guardSound = -1 + 0 * (var(52) := 0)
sparkNo = -1 + 0 * (var(53) := 8014)
guard.sparkNo = -1 + 0*(var(54) := 8001)
sparkXY = -10 + 0 * (var(55) := 61), var(56) := -75
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3700, ChangeState]
type = ChangeState
triggerAll = NumPartner && NumTarget
trigger1 = pos y > -vel y
trigger1 = MoveHit && Partner, MoveHit && Target, Alive
trigger1 = Target, StateType != A
value = 3701

[State 3700, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 1301


;Connected
[StateDef 3701]
type = S
moveType = A
physics = N
anim = 3701
ctrl = 0
velSet = 0,0
moveHitPersist = 1

[State 3701, PosAdd]
type = PosAdd
trigger1 = !Time
x = ceil(P2Dist X - 50)

[State 3701, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 3701, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3701, Impact Sound]
type = PlaySnd
trigger1 = !Time
value = 1300,1

[State 3701, MP Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 16
value = 1,1

[State 3701, HP Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 21 || AnimElem = 30
value = 1,2

[State 3701, HK Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 6
value = 1,5

[State 3701, Hit Sound]
type = Null
trigger1 = AnimElem = 17
trigger1 = var(51) := 1
trigger2 = AnimElem = 8 || AnimElem = 9
trigger2 = var(51) := 5

[State 3701, Spark XY]
type = Null
trigger1 = AnimElem = 8 || AnimElem = 9
trigger1 = var(55) := 60 || var(56) := -80
trigger2 = AnimElem = 17
trigger2 = var(55) := 92 || var(56) := -72

[State 3701, HitDef: High]
type = HitDef
trigger1 = AnimElem = 8 || AnimElem = 9
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 5,6
guard.pauseTime = 5,6
animType = Hard
air.animType = Back
fall.animType = Back
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
air.velocity = 0, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1
guardSound = -1 + 0 * (var(52) := 0)
sparkNo = -1 + 0 * (var(53) := 8014)
guard.sparkNo = -1 + 0*(var(54) := 8001)
sparkXY = -10, -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3701, HitDef: Low]
type = HitDef
trigger1 =AnimElem = 17
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 5,6
guard.pauseTime = 5,6
animType = Hard
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
air.velocity = 0, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1
guardSound = -1 + 0 * (var(52) := 0)
sparkNo = -1 + 0 * (var(53) := 8014)
guard.sparkNo = -1 + 0*(var(54) := 8001)
sparkXY = -10, -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3701, Hit 4]
type = HitDef
trigger1 = AnimElem = 22
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 49 < 7, 7, fvar(11) * 49)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 5,6
guard.pauseTime = 5,6
animType = Up
air.animType = Up
fall.animType = Up
ground.type = High
air.type = Low
ground.hitTime = 20
ground.slideTime = 20
guard.hitTime = 20
air.hitTime = 120
ground.velocity = 0, -10.5
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = 0, -18.5
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(51) := 2)
guardSound = -1 + 0 * (var(52) := 0)
sparkNo = -1 + 0 * (var(53) := 8014)
guard.sparkNo = -1 + 0*(var(54) := 8001)
sparkXY = -10 + 0 * (var(55) := 40), var(56) := -70
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3701, ChangeAnimElem]
type = ChangeAnim
trigger1 = AnimElemTime(30) < 0 && Partner, AnimElem = 31
value = 3701
elem = 30

[State 3701, Souryuken Portraits]
type = Helper
trigger1 = AnimElem = 30
helperType = Normal
stateNo = 8521
ID = 8521
name = "Souryuken Portraits"
posType = p1
pos = 11,-28
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3701, Super Pause FX]
type = Helper
trigger1 = AnimElem = 30
helperType = Normal
stateNo = 8520
ID = 8500
name = "Superpause FX"
posType = p1
pos = 11,-28
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3701, Super Pause FX (Partner)]
type = Helper
trigger1 = AnimElem = 30
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

[State 3701, Super Pause]
type = SuperPause
trigger1 = AnimElem = 30
time = 43
moveTime = 43
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3701, Voice 1]
type = PlaySnd
trigger1 = AnimElem = 30
value = 3000,0
channel = 0

[State 3701, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 30
value = 1,2
channel = 1

[State 3701, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 33
value = 40,0
channel = 3

[State 3701, Dust Helper]
type = Helper
trigger1 = AnimElem = 33
helperType = Normal
stateNo = 8100
ID = 8100
name = "Souryuken Dust"
posType = P1
ownPal = 1

[State 3701, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 33
stateType = A
physics = N

[State 3701, Velocity]
type = VelSet
trigger1 = AnimElem = 33
y = -9.5

[State 3701, Gravity]
type = VelAdd
trigger1 = AnimElemTime(33) >= 2
y = 0.47

[State 3701, Final Hit]
type = HitDef
trigger1 =  AnimElem = 33
ID = 3701
attr = A, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 174 < 7, 7, fvar(11) * 174)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
animType = Up
air.animType = Up
fall.animType = Up
ground.type = High
air.type = Low
ground.hitTime = 20
ground.slideTime = 20
guard.hitTime = 20
air.hitTime = 120
ground.velocity = 0, -8.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = 0, -14.81
air.cornerPush.velOff = 0
yAccel = 0.4
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(51) := 2)
guardSound = -1 + 0 * (var(52) := 0)
sparkNo = -1 + 0 * (var(53) := 8014)
guard.sparkNo = -1 + 0*(var(54) := 8001)
sparkXY = -10 + 0 * (var(55) := 40), var(56) := -120
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3701, Voice 2]
type = PlaySnd
trigger1 = Time = 132 ;&&NumTarget(3701) && MoveHit
value = 1100,0
channel = 0

[State 3701, Pause]
type = Pause
trigger1 = Time < 132 && NumTarget(3701) && MoveHit
time = 2

[State 3701, Kanji Helper]
type = Helper
trigger1 = Time = 132 ;&&NumTarget(3701) && MoveHit
helperType = Normal
stateNo = 3705
ID = 3705
name = "Superpause FX"
posType = p1
pos = 11,-28
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3701, Super Pause]
type = SuperPause
trigger1 = Time = 132 ;&&NumTarget(3701) && MoveHit
time = 60
p2DefMul = 1
unHittable = 1
anim = -1
darken = 0

[State 3701, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 3710



;Landing
[StateDef 3710]
type = S
anim = 3710
physics = N
moveType = I
velSet = 0,0

[State 3710, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 3710, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3710, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 3710, ChangeState]
type = ChangeState
trigger1 = WinKO
value = 3711

[State 3710, End]
type = ChangeState
trigger1 = !AnimTime
trigger2 = !NumTarget && AnimElemTime(2) >= 0
value = 0
ctrl = 1



;========================<WIN BY SOURYKEN>=============================
[Statedef 3711]
type = S

[State 3711, Voice]
type = PlaySnd
trigger1 = AnimElem = 2 && Anim = 3710
value = 181, 0 + (random % 2)
channel = 0

[State 3711, ChangeAnim]
type = ChangeAnim
trigger1 = Anim = 3710 && AnimElemTime(5) = 0
value = 181
elem = 4

[State 3711, ChangeState]
type = ChangeState
trigger1 = PrevStateNo = 3710
value = 180
ctrl = 1
