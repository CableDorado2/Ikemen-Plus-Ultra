; _________________________________________
;| Ken by Phantom.of.the.Server & Jmorphman|
; ?
;==============================================================================================
;========================================<SPECIAL MOVES>=======================================
;==============================================================================================

;=====================<HADOKEN>==========================
[StateDef 1000]
type = S
physics = S
moveType = A
anim = 1000
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1000, CO Moves]
type = ChangeAnim
trigger1 = var(20) && Anim = 1000
trigger1 = AnimElemtime(6) = 0
value = 1000
Elem = 10


[State 1000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x"), 0, ifElse((command = "y"), 1, 2))

[State 1000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse(P2StateNo>=200, 2, ifElse(Random < 500, 1, 0))

[State 1000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
trigger1 = NumTarget(225) || NumTarget(420)
trigger1 = Target,StateType = A && Target,vel x < 0
var(10) = 1

[State 1030, HB]
type = Hitby
trigger1 = anim = 1000
trigger1 = animelemtime(5)>=0 && animelemtime(5)<3
value = SCA,AA,AT
time = 1

[State 1000, Voice]
type = PlaySnd
trigger1 = AnimElem = 5
value = 1000,0 + 10 * (var(40) = 1)
channel = 0

[State 1000, Hadoken Startup Sound]
type = PlaySnd
trigger1 = AnimElem = 5
value = 1000, 1
channel = 2

[State 1000, Projectile]
type = Helper
trigger1 = AnimElem = 5
helperType = Normal
stateNo = 1005
ID = 1005
name = "Hadoken Projectile"
posType = P1
pos = 73,-67
size.xScale = 0.5
size.yScale = 0.5
ownPal = 1

[State 1000, Width]
type = Width
trigger1 = AnimElemTime(5) = 0
value = 30,0

[State 1000, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElem = 9
moveType = I

[State 1000, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;========================<EX HADOKEN>=============================
[StateDef 1030]
type = S
physics = N
moveType = A
anim = 1000
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 1030, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

[State 1030, HB]
type = Hitby
trigger1 = anim = 1000
trigger1 = animelemtime(5)>=0 && animelemtime(5)<3
value = SCA,AA,AT
time = 1

[State 1030, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1030, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 24

[State 1030, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = -12, -71
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1030, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1030, Hadoken Startup Sound]
type = PlaySnd
trigger1 = AnimElem = 5
value = 1000, 1
channel = 2

[State 1030, Voice]
type = PlaySnd
trigger1 = AnimElem = 5
volume = 255
value = 1000,0
channel = 0

[State 1030, Projectile]
type = Helper
trigger1 = AnimElem = 5
helperType = Normal
stateNo = 1035
ID = 1005
name = "Hadoken Projectile"
posType = P1
pos = 73,-67
size.xScale = 0.5
size.yScale = 0.5
ownPal = 1

[State 1030, Width]
type = Width
trigger1 = AnimElemTime(5) = 0
value = 30,0

[State 1000, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElem = 9
moveType = I

[State 1030, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;========================<SHORYUKEN>=============================
[StateDef 1100]
type = S
physics = S
moveType = A
anim = 1100
ctrl = 0
velSet = 0,0
juggle = ifelse((p2movetype = H && p2statetype = A), 7, 8)
sprPriority = 1
powerAdd = ifElse(PrevStateNo = 750, 0, 72 * !var(20))
faceP2 = 1

[State 1100, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "z"), 2, ifElse((command = "y"), 1, 0))

[State 1100, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = IfElse(P2MoveType!=H && P2StateType!=A && P2Bodydist x < 30,2,IfElse(NumTarget,Random%2,Random%3))

[State 1100, Button Detect (AI) special]
type = VarSet
trigger1 = !Time && AILevel
trigger1 = var(59) = 3200
var(10) = 1

[State 1100, Button Detect (AI) special]
type = VarSet
trigger1 = !Time && AILevel
trigger1 = var(59) = 5300
var(10) = 1

[State 1100, Button Detect (AI) special]
type = VarSet
trigger1 = !Time && AILevel
trigger1 = var(59) = 40
var(10) = 1

[State 1100, Alpha Conter set]
type = VarSet
trigger1 = !Time
trigger1 = PrevStateNo = 750
var(10) = 1

[State 1100, ChangeAnim]
type = ChangeAnim
trigger1 = !Time && var(10)>=2
value = 1101

[State 1100, ChangeAnim turn]
type = ChangeAnim
triggerall = Anim =1100 || Anim =1101
triggerall = StateType = A
trigger1 = vel y > -2
value = 1104

[State 1100, NotHitBy]
type = NotHitBy
trigger1 = Anim = 1100 && AnimElemtime(3)<=1
trigger2 = Anim = 1101 && AnimElemtime(4)<=2
value = SCA,AA,AT,AP
time = 1

[State 1100, PosFix]
type = PosAdd
triggerall = P2dist y > -50
trigger1 = Anim = 1100 && AnimElemtime(3)=0
trigger2 = Anim = 1101 && AnimElemtime(4)=0
x = 22

[State 1100, Voice]
type = PlaySnd
triggerall = Anim =1100 || Anim =1101
trigger1 = AnimElem = 2
value = 1100,0 + 10 * (var(40) = 1)
channel = 0

[State 1100, Woosh Sound]
type = PlaySnd
triggerall = Anim =1100 || Anim =1101
trigger1 = AnimElem = 1
value = 1,2
channel = 1

[State 1100, Jump Sound]
type = PlaySnd
triggerall = Anim =1100 || Anim =1101
trigger1 = AnimElem = 4
value = 40,0
channel = 3

[State 1100, Fire Sound]
type = PlaySnd
triggerall = Anim =1100 || Anim =1101
trigger1 = AnimElem = 1 && var(10) = 2
value = 1100,1
channel = 4

[State 1100, StateTypeSet: Air, Physics: A]
type = StateTypeSet
trigger1 = Anim = 1100 && AnimElemtime(3)=0
trigger2 = Anim = 1101 && AnimElemtime(4)=0
stateType = A
physics = A

[State 1100, VelSet]
type = VelSet
trigger1 = Anim = 1100 && AnimElemtime(3)=0
trigger2 = Anim = 1101 && AnimElemtime(4)=0
x = 2 + 2*var(10)
y = ifElse(!var(10), -6.2, ifElse(var(10) = 1, -8.7, -11.2))

[State 1100, Airtime reset]
type = varset
trigger1 = Anim = 1100 && AnimElemtime(3)=0
trigger2 = Anim = 1101 && AnimElemtime(4)=0
var(14) = 0

[State 1100, Airtime add]
type = varadd
triggerall = vel y < 0
trigger1 = Anim = 1100 && AnimElemtime(3)>0
trigger2 = Anim = 1101 && AnimElemtime(4)>0
var(14) = 1

[State 1100, Vel]
type = velmul
triggerall = vel y < 0
trigger1 = 1
x = 1 - 0.01*var(14)

[State 1100, Vel]
type = velmul
trigger1 = vel y > 0
x = 0

[State 1100, Dust Helper]
type = Helper
trigger1 = Anim = 1100 && AnimElemtime(3)=0
trigger2 = Anim = 1101 && AnimElemtime(4)=0
helperType = Normal
stateNo = 8100
ID = 8100
name = "Shoryuken Dust"
posType = P1
ownPal = 1

[State 1100, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = Anim = 1104
trigger1 = AnimElemTime(1) =1
moveType = I

[State 1100, Shoryuken Flames Explod]
type = Explod
trigger1 = Anim = 1101
trigger1 = AnimElem = 1
anim = 1125
ID = 1125
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

[State 1100, ModifyExplod]
type = ModifyExplod
triggerall = NumExplod(1125)
trigger1 = AnimElem = 2
ID = 1125
pos = 19,-39
posType = P1
bindTime = 2

[State 1100, ModifyExplod]
type = ModifyExplod
triggerall = NumExplod(1125)
trigger1 = AnimElem = 3
ID = 1125
pos = 36,-82
posType = P1
bindTime = 2

[State 1100, ModifyExplod]
type = ModifyExplod
triggerall = NumExplod(1125)
trigger1 = AnimElem = 4
ID = 1125
pos = 12,-143
posType = P1
bindTime = -1

[State 1100, ModifyExplod]
type = ModifyExplod
triggerall = NumExplod(1125)
trigger1 = Anim = 1104 && AnimElem = 1
ID = 1125
pos = -6, -134
posType = P1
bindTime = -1

[State 1100, ModifyExplod]
type = ModifyExplod
triggerall = NumExplod(1125)
trigger1 = Anim = 1104 && AnimElem = 2
ID = 1125
pos = -8, -134
posType = P1
bindTime = -1

[State 1100, ModifyExplod]
type = ModifyExplod
triggerall = NumExplod(1125)
trigger1 = Anim = 1104 && AnimElem = 3
ID = 1125
pos = -8, -131
posType = P1
bindTime = 1


[State 1100, LP/MP HitDef (Ground)]
type = HitDef
trigger1 = Anim = 1100
trigger1 = AnimElem = 2
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ifelse(var(20), 60 + var(10) * 7, 100 + var(10) * 7), 16
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2.16, IfElse(var(10),0,-8)
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2.16, -8.81
air.cornerPush.velOff = 0
yAccel = 0.5
fall = (!var(10) || P2StateType = A)
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
ID = 1100

[State 1100, LP/MP HitDef (Air)]
type = HitDef
trigger1 = PrevStateNo != 750
trigger1 = Anim = 1100 && AnimElem = 3
trigger1 = var(10) != 2
trigger1 = ifElse(!var(10), !MoveContact, 1)
attr = A, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = IfElse(MoveContact,30,70)
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2, -8.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -1.6, -8.81
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = HitCount > 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(51) := 2)
guardSound = -1 + 0 * (var(52) := 0)
sparkNo = -1 + 0 * (var(53) := 8013)
guard.sparkNo = -1 + 0 * (var(54) := 8001)
sparkXY = -10 + 0 * (var(55) := 40), var(56) := -120
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
ID = 1100

[State 1100, LP/MP HitDef (Air) Alpha Counter]
type = HitDef
trigger1 = PrevStateNo = 750
trigger1 = Anim = 1100 && AnimElem = 3
trigger1 = var(10) != 2
trigger1 = ifElse(!var(10), !MoveContact, 1)
attr = A, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = IfElse(MoveContact,30,70)
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = DiagUp
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2, -8.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -1.6, -8.81
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = HitCount > 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(51) := 2)
guardSound = -1 + 0 * (var(52) := 0)
sparkNo = -1 + 0 * (var(53) := 8013)
guard.sparkNo = -1 + 0 * (var(54) := 8001)
sparkXY = -10 + 0 * (var(55) := 40), var(56) := -120
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
ID = 1100


[State 1100, HP Ground Hit 1]
type = HitDef
trigger1 = Anim = 1101 && AnimElem = 2
trigger1 = var(10) = 2 && PrevStateNo != 750
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = 70,8
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -4.32, 0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
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
sparkNo = -1 + 0 * (var(53) := 8013)
guard.sparkNo = -1 + 0 * (var(54) := 8001)
sparkXY = -10 + 0 * (var(55) := 40), var(56) := -60
palFX.time = 45
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
ID = 1100

[State 1100, HP Ground Hit 2]
type = HitDef
trigger1 = Anim = 1101 && AnimElem = 3
trigger1 = var(10) = 2 && PrevStateNo != 750
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = Ifelse(HitCount,40,70),8
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -4.32, 0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
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
sparkNo = -1 + 0 * (var(53) := 8013)
guard.sparkNo = -1 + 0 * (var(54) := 8001)
sparkXY = -10 + 0 * (var(55) := 40), var(56) := -70
palFX.time = 45
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
ID = 1100

[State 1100, HP HitDef (Air)]
type = HitDef
trigger1 = Anim = 1101 && AnimElem = 4
trigger1 = var(10) = 2 && PrevStateNo != 750
attr = A, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = 90-HitCount*30,8
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2.16, -8.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2.16, -8.81
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
sparkXY = -10 + 0 * (var(55) := 40), var(56) := -120
palFX.time = 48
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
ID = 1100


[State 1100, Flame Particles]
type = Helper
trigger1 = var(10) = 2
trigger1 = AnimElemTime(2) > 0
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

[State 1100, Alpha FX]
type = Helper
triggerall = Prevstateno = 750
trigger1 = !NumHelper(751)
trigger1 = MoveHit && NumTarget(1100)
trigger1 = Anim = 1100 && Animelemtime(3)>0
trigger1 = Target,StateNo = [5000,5099]
trigger1 = !(Target, HitShakeOver)
trigger1 = var(43) := (Target, ID)
helperType = Normal
stateNo = 751
ID = 751
name = "Alpha FX"
posType = P2
ownPal = 1
ignoreHitPause = 1


;Landing
[StateDef 1105]
type = S
anim = 1105
physics = S
moveType = I
velSet = 0,0

[State 1105, EX Flash Off]
type = VarSet
trigger1 = !Time
var(25) = 0

[State 1105, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 1105, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1105, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 1105, End]
type = ChangeState
trigger1 = !AnimTime
value = 10
ctrl = 1



;========================<EX SHORYUKEN>=============================
[StateDef 1130]
type = S
physics = S
moveType = A
anim = 1130
ctrl = 0
velSet = 0,0
juggle = 0
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 1130, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1130, PosFix]
type = PosAdd
triggerall = P2dist y > -50
trigger1 = Anim = 1130 && AnimElemtime(4)=0
x = IfElse(P2Bodydist x <=22, P2Bodydist x, 22)

[State 1130, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 28

[State 1130, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = 10, -42
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1130, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 0

[State 1130, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(5) < 0
value = SCA
time = 1

[State 1130, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1130, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1100,2
channel = 0

[State 1130, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1,2
channel = 3

[State 1130, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 40,0
channel = 4

[State 1130, Fire Sound]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1100,1
channel = 5

[State 1130, StateTypeSet: Air]
type = StateTypeSet
trigger1 = AnimElem = 4
stateType = A
physics = A

[State 1130, Dust Helper]
type = Helper
trigger1 = AnimElem = 4
helperType = Normal
stateNo = 8100
ID = 8100
name = "Shoryuken Dust"
posType = P1
ownPal = 1

[State 1130, VelSet]
type = VelSet
trigger1 = AnimElem = 4
x = 15
y = -11.5

[State 1130, Velocity]
type = VelMul
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(8) < 0
x = 0.88
persistent = 1

[State 1130, VelSet]
type = VelSet
trigger1 = AnimElem = 8
x = 0

[State 1130, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(6) >= 0
moveType = I

[State 1130, Shoryuken Flames Explod]
type = Explod
trigger1 = AnimElem = 1
anim = 1125
ID = 1125
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

[State 1130, ModifyExplod]
type = ModifyExplod
trigger1 = AnimElem = 2
ID = 1125
pos = 19,-39
posType = P1
bindTime = 2

[State 1130, ModifyExplod]
type = ModifyExplod
trigger1 = AnimElem = 3
ID = 1125
pos = 36,-82
posType = P1
bindTime = 2

[State 1130, ModifyExplod]
type = ModifyExplod
trigger1 = AnimElem = 4
ID = 1125
pos = 12,-143
posType = P1
bindTime = 23

[State 1130, Ground Hit 1]
type = HitDef
trigger1 = AnimElem = 2
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 5, Hit
damage = 80,6
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -4, 0
ground.cornerPush.velOff = 0
guard.velocity = -8
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(51) := 5)
guardSound = -1 + 0 * (var(52) := 0)
sparkNo = -1 + 0 * (var(53) := 8013)
guard.sparkNo = -1 + 0 * (var(54) := 8001)
sparkXY = -10 + 0 * (var(55) := 40), var(56) := -60
palFX.time = 45
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
ID = 1100

[State 1130, Ground Hit 2]
type = HitDef
trigger1 = AnimElem = 3
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = IfElse(HitCount,20,80),6
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -4.32, 0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(51) := 5)
guardSound = -1 + 0 * (var(52) := 0)
sparkNo = -1 + 0 * (var(53) := 8013)
guard.sparkNo = -1 + 0 * (var(54) := 8001)
sparkXY = -10 + 0 * (var(55) := 40), var(56) := -70
palFX.time = 45
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
ID = 1100

[State 1130, Air Hits]
type = HitDef
trigger1 = AnimElem = 4 || AnimElem = 5
attr = A, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = IfElse(HitCount,30,80),6
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2.16, -8.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2.16, -8.81
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(51) := 5)
guardSound = -1 + 0 * (var(52) := 0)
sparkNo = -1 + 0 * (var(53) := 8013)
guard.sparkNo = -1 + 0 * (var(54) := 8001)
sparkXY = -10 + 0 * (var(55) := 40), var(56) := -120
palFX.time = 50
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
ID = 1100

[State 1130, Flame Particles]
type = Helper
trigger1 = AnimElemTime(2) > 0
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




;========================<TATSUMAKI SENPUKYAKU>=============================
[StateDef 1200]
type = A
physics = A
moveType = A
anim = 1200
ctrl = 0
velSet = 0,0
juggle = 7
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1200, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "c"), 2, ifElse((command = "b"), 1, 0))

[State 1200, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel && !var(20)
var(10) = ifElse(Random < 300, 1, 2)

[State 1200, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel && var(20)
var(10) = 0

[State 1200, HB]
type = HitBy
trigger1 = Anim < 1202
value = SCA,AA,HP
time = 1

[State 1200, ChangeAnim spin]
type = ChangeAnim
trigger1 = Anim = 1200
trigger1 = !Animtime
value = 1201

[State 1200, Spin Var reset]
type = varset
trigger1 = !time
var(14) = 0
persistence = 0

[State 1200, ChangeAnim low]
type = ChangeAnim
triggerall = Anim = 1201 && !Animtime
trigger1 = !var(10) && var(14) = 0
trigger2 = var(10)=1 && var(14) = 3
trigger3 = var(10)=2 && var(14) = 4
value = 1202

[State 1200, Spin Var add]
type = varadd
trigger1 = Anim = 1201 && !animtime
var(14) = 1
ignorehitpasue = 1

[State 1200, Voice]
type = PlaySnd
trigger1 = time = 1
value = 1200,0 + 10 * (var(40) = 1)
channel = 0

[State 1200, Woosh Sound]
type = PlaySnd
triggerall = anim = 1201
trigger1 = AnimElemtime(1) = 1
value = 1,4

[State 1200, VelSet]
type = VelSet
trigger1 = Anim = 1200
trigger1 = AnimElem = 1
x = ifElse(!var(10), 2.7, ifElse(var(10) = 1, 3, 3.6))
y = -3.6

[State 1200, VelSet fix]
type = VelSet
trigger1 = Anim = 1201
y = 0

[State 1200, veladd softland]
type = veladd
triggerall = anim = 1202
trigger1= Animelemtime(1)=2
trigger2= Animelemtime(2)=2
trigger3= Animelemtime(3)=2
trigger4= Animelemtime(4)=2
trigger5= Animelemtime(5)=2
trigger6= Animelemtime(6)=2
y = -0.9


[State 1200, Dust Helper]
type = Helper
trigger1 = AnimElem = 1
helperType = Normal
stateNo = 8100
ID = 8100
name = "Tatsumaki Senpukyaku Dust"
posType = P1
ownPal = 1

[State 1200, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = anim = 1202 && animelem = 1
moveType = I

[State 1200, First Hit]
type = HitDef
triigerall = Anim != 1201
trigger1 = Anim = 1200 && AnimElemtime(2) = 1
trigger1 = time = 3
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = 70,7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 28
ground.slideTime = 28
guard.hitTime = 28
guard.ctrlTime = 28
air.hitTime = 120
ground.velocity = -4.32, 0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(51) := 5)
guardSound = -1 + 0 * (var(52) := 0)
sparkNo = -1 + 0 * (var(53) := 8013)
guard.sparkNo = -1 + 0 * (var(54) := 8001)
sparkXY = -10 + 0 * (var(55) := 81), var(56) := -70
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
ID = 1200

[State 1200, Air Hits]
type = HitDef
trigger1 = Anim = 1201 && (AnimElem = 2 || AnimElem = 5)
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = IfElse(HitCount<1,80,15),7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 3, 5), ifElse(var(20), 4, 6)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 28
ground.slideTime = 28
guard.hitTime = 28
guard.ctrlTime = 28
air.hitTime = 120
ground.velocity = -7, 0
ground.cornerPush.velOff = 0
guard.velocity = -9
guard.cornerPush.velOff = 0
air.velocity = -2, -9
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(51) := 5)
guardSound = -1 + 0 * (var(52) := 0)
sparkNo = -1 + 0 * (var(53) := 8013)
guard.sparkNo = -1 + 0 * (var(54) := 8001)
sparkXY = -10 + 0 * (var(55) := 81), var(56) := -70
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
ID = 1200


;Landing
[StateDef 1205]
type = C
anim = 1205 + (var(40)=1)
physics = C
moveType = I
velSet = 0,0

[State 1205, EX Flash Off]
type = VarSet
trigger1 = !Time
var(25) = 0

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

[State 1205, End]
type = ChangeState
trigger1 = !AnimTime
value = 11
ctrl = 1



;========================<EX TATSUMAKI SENPUKYAKU>=============================
[StateDef 1230]
type = A
physics = A
moveType = A
anim = 1200
ctrl = 0
velSet = 0,0
juggle = 0
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 1230, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1200, HB]
type = HitBy
trigger1 = Anim < 1202
value = SCA,AA,HP
time = 1

[State 1230, ChangeAnim spin]
type = ChangeAnim
trigger1 = Anim = 1200
trigger1 = !Animtime
value = 1201

[State 1230, Spin Var reset]
type = varset
trigger1 = !time
var(14) = 0
persistence = 0

[State 1230, ChangeAnim low]
type = ChangeAnim
triggerall = Anim = 1201 && !Animtime
trigger1 = var(14) = 5
value = 1202

[State 1230, Spin Var add]
type = varadd
trigger1 = Anim = 1201 && !animtime
var(14) = 1
ignorehitpasue = 1


[State 1230, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 55

[State 1230, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = 0,-75
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
trigger1 = anim = 1200 && time = 1
value = 1200,0
channel = 0

[State 1230, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = anim = 1201 && AnimElemtime(1) = 0
stateType = A
physics = A

[State 1230, VelSet]
type = VelSet
trigger1 = anim = 1200 && AnimElem = 1
x = 5
y = -3.6

[State 1230, VelSet]
type = VelSet
trigger1 = Anim = 1201
y = 0

[State 1230, veladd softland]
type = veladd
triggerall = anim = 1202
trigger1= Animelemtime(1)=2
trigger2= Animelemtime(2)=2
trigger3= Animelemtime(3)=2
trigger4= Animelemtime(4)=2
trigger5= Animelemtime(5)=2
trigger6= Animelemtime(6)=2
y = -0.9

[State 1230, Dust Helper]
type = Helper
trigger1 = AnimElem = 1
helperType = Normal
stateNo = 8100
ID = 8100
name = "Tatsumaki Senpukyaku Dust"
posType = P1
ownPal = 1

[State 1230, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = Anim = 1202 && AnimElemTime(1) = 1
moveType = I

[State 1230, First Hit]
type = HitDef
trigger1 = Anim = 1200 && AnimElem = 2
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = 80,0
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 7, 13)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 28
ground.slideTime = 28
guard.hitTime = 28
guard.ctrlTime = 28
air.hitTime = 120
ground.velocity = -4.32, 0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(51) := 5)
guardSound = -1 + 0 * (var(52) := 0)
sparkNo = -1 + 0 * (var(53) := 8013)
guard.sparkNo = -1 + 0 * (var(54) := 8001)
sparkXY = -10 + 0 * (var(55) := 61), var(56) := -60
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
ID = 1200

[State 1230, Air Hits]
type = HitDef
trigger1 = Anim = 1201 && (animelem = 2 || animelem = 5)
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = IfElse(HitCount<1,80,16)
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 3, 4), ifElse(var(20), 4, 5)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 28
ground.slideTime = 28
guard.hitTime = 28
guard.ctrlTime = 28
air.hitTime = 120
ground.velocity = -4.32, 0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(51) := 5)
guardSound = -1 + 0 * (var(52) := 0)
sparkNo = -1 + 0 * (var(53) := 8013)
guard.sparkNo = -1 + 0 * (var(54) := 8001)
sparkXY = -10 + 0 * (var(55) := 81), var(56) := -70
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
ID = 1200


;========================<AIRBORNE TATSUMAKI SENPUKYAKU>=============================
[StateDef 1240]
type = A
physics = A
moveType = A
anim = 1240
ctrl = 0
juggle = 7
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1240, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "c"), 2, ifElse((command = "b"), 1, 0))

[State 1240, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = 2 + (Power >= 500 && Random<40)

[State 1200, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel && var(20)
var(10) = 0

[State 1240, EX Move]
type = VarSet
triggerall = !AILevel && Power >= 500 && var(40)<1
trigger1 = command = "EXTatsumakiSenpukyaku"
var(10) = 3

[State 1240, EX Power]
type = Poweradd
trigger1 = !time
trigger1 = var(10) = 3
value = -500

[State 1240, EX Flash]
type = VarSet
triggerall = var(10) = 3
trigger1 = !Time
var(25) = 55

[State 1240, EX FX]
type = Explod
triggerall = var(10) = 3
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = 0,-75
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1240, EX Startup Sound]
type = PlaySnd
triggerall = var(10) = 3
trigger1 = !Time
value = 0,1000
channel = 1

[State 1240, Voice EX]
type = PlaySnd
triggerall = var(40) != 1
triggerall = var(10) = 3
trigger1 = !Time
value = 1200,0
channel = 0


[State 1240, Voice Normal]
type = PlaySnd
triggerall = var(40) != 1
triggerall = var(10) != 3
trigger1 = !Time
value = 4,4
channel = 0

[State 1240, Voice Violent]
type = PlaySnd
triggerall = var(40) = 1
trigger1 = !Time
value = 810,10
channel = 0

[State 1240, Start SPIN]
type = ChangeAnim
trigger1 = Anim = 1240 && !Animtime
value = 1241

[State 1240, Spin Var reset]
type = varset
trigger1 = !time
var(14) = 0
persistence = 0

[State 1240, ChangeAnim low]
type = ChangeAnim
triggerall = Anim = 1241 && !Animtime
trigger1 = var(10) = 0 && var(14) = 1
trigger2 = var(10) = 1 && var(14) = 2
trigger3 = var(10) = 2 && var(14) = 3
trigger4 = var(10) = 3 && var(14) = 4
value = 1202

[State 1240, Spin Var add]
type = varadd
trigger1 = Anim = 1241 && !animtime
var(14) = 1
ignorehitpasue = 1

[State 1240, Woosh Sound]
type = PlaySnd
trigger1 = Anim = 1241
trigger1 = AnimElemtime(1)=1
value = 1,4

[State 1240, VelAdd Normal]
type = VelAdd
triggerall = Var(40) != 1 || var(10) = 3
trigger1 = Anim = 1241 && AnimElemtime(1) = 1
x = 0 + 0.3*(var(10)=3)
y = -1.4-0.7*(var(10)=3)

[State 1240, Veladd EX]
type = veladd
triggerall = var(10) = 3
trigger1 = MoveContact = 1 && vel y > 0
y = -vel y + 1
persistence = 0

[State 1240, VelSet for Violent]
type = VelSet
triggerall = Var(40) = 1 && var(10) != 3
trigger1 = Anim = 1241 && AnimElemtime(1) > 0
x = IfElse(Vel x < 0,-3,4)
y = 0

[State 1240, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = Anim = 1205 && AnimElemTime(1) = 1
moveType = I

[State 1240, Air Hits]
type = HitDef
triggerall = var(10) < 3
trigger1 = Anim = 1241 && (AnimElem = 2 || AnimElem = 5)
attr = A, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = IfElse(HitCount<1,80,15),7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 3, 5), ifElse(var(20), 4, 6)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 28
ground.slideTime = 28
guard.hitTime = 28
guard.ctrlTime = 28
air.hitTime = 120
ground.velocity = -2, 0
ground.cornerPush.velOff = 0
guard.velocity = -9
guard.cornerPush.velOff = 0
air.velocity = -2, -7
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(51) := 5)
guardSound = -1 + 0 * (var(52) := 0)
sparkNo = -1 + 0 * (var(53) := 8013)
guard.sparkNo = -1 + 0 * (var(54) := 8001)
sparkXY = -10 + 0 * (var(55) := 81), var(56) := -70
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
ID = 1200

[State 1240, Air Hits]
type = HitDef
triggerall = var(10) = 3
trigger1 = Anim = 1241 && (AnimElem = 2 || AnimElem = 5)
attr = A, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = IfElse(HitCount<1,90,18),8
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 3, 5), ifElse(var(20), 4, 6)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 28
ground.slideTime = 28
guard.hitTime = 28
guard.ctrlTime = 28
air.hitTime = 120
ground.velocity = -3, -8
ground.cornerPush.velOff = 0
guard.velocity = -9
guard.cornerPush.velOff = 0
air.velocity = -3, -9
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(51) := 5)
guardSound = -1 + 0 * (var(52) := 0)
sparkNo = -1 + 0 * (var(53) := 8013)
guard.sparkNo = -1 + 0 * (var(54) := 8001)
sparkXY = -10 + 0 * (var(55) := 81), var(56) := -70
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
ID = 1200



;========================<CLASSIC AIRBORNE TATSUMAKI SENPUKYAKU>=============================
[StateDef 1250]
type = A
physics = N
moveType = A
anim = 1240
ctrl = 0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1250, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "c" || command = "rlsc"), 2, ifElse((command = "b" || command = "rlsb"), 1, 0))

[State 1250, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = 2

[State 1250, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 2, 1260, ifElse(var(10) = 1, 1250, 1240))

[State 1250, Voice]
type = PlaySnd
trigger1 = !Time
value = 1200 + 50 * (var(40) = 1),0
channel = 0

[State 1250, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 3 || AnimElem = 6 || AnimElem = 9 || AnimElem = 12 || AnimElem = 15
trigger2 = (AnimElem = 18 || AnimElem = 21) && var(10)
trigger3 = (AnimElem = 24 || AnimElem = 27 || AnimElem = 30 || AnimElem = 33) && var(10) = 2
value = 1,4

[State 1250, VelSet]
type = VelSet
trigger1 = AnimElem = 1
x = ifElse(vel x >= 0, 3.8, -3.8)
y = 0

[State 1250, Gravity]
type = VelAdd
trigger1 = !var(10) && AnimElemTime(16) > 0
trigger2 = var(10) = 1 && AnimElemTime(22) > 0
trigger3 = var(10) = 2 && AnimElemTime(34) > 0
y = 0.45

[State 1250, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(15) >= 0 && !var(10)
trigger2 = AnimElemTime(21) >= 0 && var(10) = 1
trigger3 = AnimElemTime(33) >= 0 && var(10) = 2
moveType = I

[State 1250, HitDef]
type = HitDef
trigger1 = AnimElem = 5 || AnimElem = 8 || AnimElem = 11 || AnimElem = 14
trigger2 = var(10) && (AnimElem = 17 || AnimElem = 20)
trigger3 = var(10) = 2 && (AnimElem = 23 || AnimElem = 26 || AnimElem = 29 || AnimElem = 32)
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
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
ground.velocity = -4.32, 0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(51) := 5)
guardSound = -1 + 0 * (var(52) := 0)
sparkNo = -1 + 0 * (var(53) := 8013)
guard.sparkNo = -1 + 0 * (var(54) := 8001)
sparkXY = -10 + 0 * (var(55) := 81), var(56) := -70
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1250, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 1241



;========================<RYUSENKYAKU>=============================
[StateDef 1300]
type = A
physics = N
moveType = A
anim = 1300
ctrl = 0
velSet = 0,0
juggle = 7
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1300, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "c" || command = "rlsc"), 2, ifElse((command = "b" || command = "rlsb"), 1, 0))

[State 1300, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = IfElse(P2BodyDist x > 90, 2, 0)

[State 1300, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
trigger1 = NumTarget && P2Bodydist x < 50
var(10) = 0

[State 1300, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 2, 1320, ifElse(var(10) = 1, 1310, 1300))

[State 1300, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1,4
channel = 1

[State 1300, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1300,0
channel = 0

[State 1300, Dust Helper]
type = Helper
trigger1 = AnimElem = 1
helperType = Normal
stateNo = 8100
ID = 8100
name = "Ryusenkyaku Dust"
posType = P1
ownPal = 1

[State 1300, VelSet]
type = VelSet
trigger1 = AnimElem = 3
x = 2.5
y = -11 - (var(10) * 1.5)

[State 1300, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(3) > 0
y = 1

[State 1301, HitDef 1]
type = HitDef
trigger1 = AnimElem = 6
attr = A, SA
hitFlag = MAFD
guardFlag = H
priority = 4, Hit
damage = 100+10*var(10), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 7, 13)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 7, 13)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 22
ground.slideTime = 22
guard.hitTime = 22
air.hitTime = 120
ground.velocity = -5.40, 18
air.velocity = -5.40, 18
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(51) := 5)
guardSound = -1 + 0 * (var(52) := 0)
sparkNo = -1 + 0 * (var(53) := 8013)
guard.sparkNo = -1 + 0 * (var(54) := 8001)
sparkXY = -10 + 0 * (var(55) := 61), var(56) := -75
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
ID = 1300

[State 1301, HitDef 2]
type = HitDef
trigger1 = AnimElem = 7 && !MoveContact
attr = A, SA
hitFlag = MAFD
guardFlag = H
priority = 4, Hit
damage = 100+10*var(10), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 7, 13)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 7, 13)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 22
ground.slideTime = 22
guard.hitTime = 22
air.hitTime = 120
ground.velocity = -5.40, 18
air.velocity = -5.40, 18
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(51) := 5)
guardSound = -1 + 0 * (var(52) := 0)
sparkNo = -1 + 0 * (var(53) := 8013)
guard.sparkNo = -1 + 0 * (var(54) := 8001)
sparkXY = -10 + 0 * (var(55) := 61), var(56) := -75
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
ID = 1300

[State 1300, ChangeState]
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

[State 1301, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1301, Impact Sound]
type = PlaySnd
trigger1 = !Time
value = 1300,1

[State 1301, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;========================<EX RYUSENKYAKU>=============================
[StateDef 1330]
type = A
physics = N
moveType = A
anim = 1330
ctrl = 0
velSet = 0,0
juggle = 0
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
var(25) = 38

[State 1330, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = -3, -62
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1330, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 2

[State 1330, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1,4
channel = 1

[State 1330, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1300,0
channel = 0

[State 1330, Dust Helper]
type = Helper
trigger1 = AnimElem = 1
helperType = Normal
stateNo = 8100
ID = 8100
name = "Ryusenkyaku Dust"
posType = P1
ownPal = 1

[State 1330, VelSet]
type = VelSet
trigger1 = AnimElem = 3
x = 3.5
y = -15.5

[State 1330, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(3) > 0
y = 1

[State 1301, HitDef 1]
type = HitDef
trigger1 = AnimElem = 6
attr = A, SA
hitFlag = MAF
guardFlag = HA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 126 < 7, 7, fvar(11) * 126)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
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
ground.velocity = -5.40, 6.57
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -5.40, 3.24
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(51) := 5)
guardSound = -1 + 0 * (var(52) := 0)
sparkNo = -1 + 0 * (var(53) := 8013)
guard.sparkNo = -1 + 0 * (var(54) := 8001)
sparkXY = -10 + 0 * (var(55) := 61), var(56) := -75
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1301, HitDef 2]
type = HitDef
trigger1 = AnimElem = 7 && !MoveContact
attr = A, SA
hitFlag = MAF
guardFlag = HA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 126 < 7, 7, fvar(11) * 126)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
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
ground.velocity = -5.40, 6.57
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -5.40, 3.24
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(51) := 5)
guardSound = -1 + 0 * (var(52) := 0)
sparkNo = -1 + 0 * (var(53) := 8013)
guard.sparkNo = -1 + 0 * (var(54) := 8001)
sparkXY = -10 + 0 * (var(55) := 61), var(56) := -70
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1330, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 1301



;=====================<NATA OTOSI GERI>==========================
[StateDef 1400]
type = S
physics = S
moveType = A
anim = 1400
ctrl = 0
velSet = 0,0
juggle = 7
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1400, Voice]
type = PlaySnd
trigger1 = AnimElem = 5
value = 4, ifElse(Random < 500, 3, 4) + 9 * (var(40) = 1)
channel = 0

[State 1400, Woosh]
type = PlaySnd
trigger1 = AnimElem = 5
value = 1,4

[State 1400, PosAdd]
type = PosAdd
trigger1 = AnimElem = 1
x = 8

[State 1400, HitDef 1]
type = HitDef
trigger1 = AnimElem = 6 || (AnimElem = 7 && Command != "holda")
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = IfElse(HitCount,20,70),8
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 20
ground.slideTime = 20
guard.hitTime = 20
air.hitTime = 120
ground.velocity = -4.32, 0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(51) := 5)
guardSound = -1 + 0 * (var(52) := 0)
sparkNo = -1 + 0 * (var(53) := 8013)
guard.sparkNo = -1 + 0 * (var(54) := 8001)
sparkXY = -10 + 0 * (var(55) := 60), var(56) := -85
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
ID = 1400

[State 1410, to Inazuma Kakato Wari]
type = ChangeState
triggerall = Anim = 1400 && animElemtime(7)=4
trigger1 = !AILevel && Command = "holda"
trigger2 = AIlevel
trigger2 = P2StateType !=S || P2Bodydist x  < 56
value = 1405


[State 1400, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;=====================<KAMA HARAI GERI>==========================
[StateDef 1410]
type = S
physics = S
moveType = A
anim = 1410
ctrl = 0
velSet = 0,0
juggle = 7
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1410, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 4, ifElse(Random < 500, 3, 4) + 9 * (var(40) = 1)
channel = 0

[State 1410, Woosh]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,4

[State 1410, PosAdd]
type = PosAdd
trigger1 = AnimElem = 1
x = 8

[State 1410, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(6) >= 0
moveType = I

[State 1410, HitDef 1]
type = HitDef
trigger1 = AnimElem = 3
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = 80,8
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 20
ground.slideTime = 20
guard.hitTime = 20
air.hitTime = 120
ground.velocity = -4.32, 0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(51) := 5)
guardSound = -1 + 0 * (var(52) := 0)
sparkNo = -1 + 0 * (var(53) := 8013)
guard.sparkNo = -1 + 0 * (var(54) := 8001)
sparkXY = -10 + 0 * (var(55) := 60), var(56) := -75
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
ID = 1410

[State 1410, HitDef 2]
type = HitDef
trigger1 = Command != "holdb"
trigger1 = AnimElem = 4
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = IfElse(HitCount,30,80)
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 20
ground.slideTime = 20
guard.hitTime = 20
air.hitTime = 120
ground.velocity = -4.32, 0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(51) := 5)
guardSound = -1 + 0 * (var(52) := 0)
sparkNo = -1 + 0 * (var(53) := 8013)
guard.sparkNo = -1 + 0 * (var(54) := 8001)
sparkXY = -10 + 0 * (var(55) := 60), var(56) := -80
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
ID = 1410

[State 1410, to Inazuma Kakato Wari]
type = ChangeState
triggerall = Anim = 1410 && animElemtime(5)=2
trigger1 = !AILevel && Command = "holdb"
trigger2 = AIlevel
trigger2 = P2StateType !=S || P2Bodydist x  < 56
value = 1405

[State 1410, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;=====================<OSOTO MAWASHI GERI>==========================
[StateDef 1420]
type = S
physics = S
moveType = A
anim = 1420
ctrl = 0
velSet = 0,0
juggle = 7
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1420, Voice]
type = PlaySnd
trigger1 = AnimElem = 4
value = 4, ifElse(Random < 500, 3, 4) + 9 * (var(40) = 1)
channel = 0

[State 1420, Woosh]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1,4

[State 1420, PosAdd]
type = PosAdd
trigger1 = AnimElem = 1
x = 8

[State 1420, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(7) >= 0
moveType = I

[State 1420, HitDef]
type = HitDef
trigger1 = (AnimElemtime(5)>0 && AnimElemtime(7)<0) && !MoveContact && !Movereversed
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = 100,0
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 20
ground.slideTime = 20
guard.hitTime = 20
air.hitTime = 120
ground.velocity = -2.16, -8.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2.16, -8.81
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(51) := 5)
guardSound = -1 + 0 * (var(52) := 0)
sparkNo = -1 + 0 * (var(53) := 8013)
guard.sparkNo = -1 + 0 * (var(54) := 8001)
sparkXY = -10 + 0 * (var(55) := 60), var(56) := -75
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1420, to Inazuma Kakato Wari]
type = ChangeState
triggerall = Anim = 1420 && animElemtime(6)=4
trigger1 = !AILevel && Command = "holdc"
trigger2 = AIlevel
trigger2 = P2StateType !=S || P2Bodydist x  < 56
value = 1405

[State 1420, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;===========<INAZUMA KAKATO WARI>==========
[StateDef 1405]
type = S
physics = S
moveType = A
anim = 1405
ctrl = 0
velSet = 0,0
juggle = 0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

;[State 1405, Voice]
;type = PlaySnd
;trigger1 = AnimElem = 5
;value = 4, ifElse(Random < 500, 3, 4) + 9 * (var(40) = 1)
;channel = 0

[State 1405, Woosh]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1,4

[State 1405, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(7) >= 0
moveType = I

[State 1405, HitDef]
type = HitDef
trigger1 = (AnimElemtime(4)>0 && AnimElemtime(6)<0) && !MoveContact && !Movereversed
attr = S, SA
hitFlag = MAF
guardFlag = H
priority = 4, Hit
damage = IfElse(P2MoveType=H,30,80),8
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 20
ground.slideTime = 20
guard.hitTime = 20
air.hitTime = 120
ground.velocity = -5, 0
ground.cornerPush.velOff = 0
guard.velocity = -10
guard.cornerPush.velOff = 0
air.velocity = -2, 14
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(51) := 5)
guardSound = -1 + 0 * (var(52) := 0)
sparkNo = -1 + 0 * (var(53) := 8013)
guard.sparkNo = -1 + 0 * (var(54) := 8001)
sparkXY = -10 + 0 * (var(55) := 70), var(56) := -68
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
ID = 1405

[State 1405, End]
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
juggle = 0
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 1430, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1430, Posadd]
type = Posadd
trigger1 = !time && anim = 1430
x = 10

[State 1430, Posadd]
type = Posadd
trigger1 = anim = 1430
trigger1 = animelemtime(10) = 0
x= IFElse(P2Bodydist x < 18 && P2Bodydist x > -10 && P2Dist y > -40,P2Bodydist x - 2,18) * Const(Size.xscale)

[State 1430, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1430, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 35

[State 1430, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = 5, -71
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1430, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1430, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
trigger2 = AnimElem = 11
value = 4,3 + (AnimElem = 11)
channel = 0

[State 1430, Woosh]
type = PlaySnd
trigger1 = AnimElem = 2
trigger2 = AnimElem = 11
value = 1,4 + (AnimElem = 11)

[State 1430, PosAdd]
type = PosAdd
trigger1 = AnimElem = 1
trigger2 = AnimElem = 10
x = 8 + 24 * (AnimElem = 10)

[State 1420, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(15) >= 0
moveType = I

[State 1430, HitDef 1]
type = HitDef
trigger1 = AnimElemtime(3)>0 && AnimElemtime(6)<0
trigger1 = !MoveContact && !Movereversed
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 5, Hit
damage = 90,7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Up
ground.hitTime = 22
ground.slideTime = 22
guard.hitTime = 22
air.hitTime = 120
ground.velocity = -0.2 - 2*(P2bodydist x < 20),-5
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -0.2 - 2*(P2bodydist x < 20), -5
air.cornerPush.velOff = 0
yAccel = 0.4
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(51) := 5)
guardSound = -1 + 0 * (var(52) := 0)
sparkNo = -1 + 0 * (var(53) := 8013)
guard.sparkNo = -1 + 0 * (var(54) := 8001)
sparkXY = -10 + 0 * (var(55) := 60), var(56) := -75
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
ID = 1430

[State 1430, HitDef 2]
type = HitDef
trigger1 = AnimElem = 12
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 5, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
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
ground.velocity = -12, -6
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -12, -6
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(51) := 5)
guardSound = -1 + 0 * (var(52) := 0)
sparkNo = -1 + 0 * (var(53) := 8013)
guard.sparkNo = -1 + 0 * (var(54) := 8001)
sparkXY = -10 + 0 * (var(55) := 44), var(56) := -70
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
ID = 1430

[State 1430, TargetState]
type = TargetState
trigger1 = MoveHit && NumTarget(1430) && Animelemtime(12)>0
trigger1 = (Target(1430), StateNo = 5000) || (Target(1430), StateNo = 5010) || (Target(1430), StateNo = 5020)
trigger1 = MoveHit < 3 && Target(1430),time < 3
value = 1435
ID = 1430
ignoreHitPause = 1

[State 1430, End]
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
value = 5002

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
trigger1 = !Time
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
trigger1 = 1
value = 5000

[State 1437, Impact Sound]
type = PlaySnd
trigger1 = !Time
value = F7,2

[State 1437, Shake]
type = envshake
trigger1 = !time
time = 18
freq = 40
ampl = 6
persistent = 0

[State 1437, Hitting the Wall FX]
type = Explod
trigger1= !Time
anim = F72
pos = 0, floor(ScreenPos y) - 50
posType =  Back
sprPriority = 3

[State 1437, End]
type = ChangeState
trigger1 = Time >= 8
value = 1438


;Bouncing Off Wall
[Statedef 1438]
type = A
moveType = H
physics = N

[State 1438, Turn]
type = Turn
trigger1 = !Time

[State 1438, Gravity]
type = VelAdd
trigger1 = 1
y = 0.5

[State 1438, VelSet]
type = VelSet
trigger1 = !Time
x = -2.5
y = -9

[State 1438, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
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

[State 1438, End]
type = SelfState
trigger1 = vel y > 0 && pos y >= 0
value = 5100



;===========<ZENPOU TENSHIN>==========
[StateDef 1500]
type = S
physics = N
moveType = A
anim = 1500
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1500, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 1450, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AIlevel
var(10) = 0


[State 1450, Alpha Conter set]
type = VarSet
trigger1 = !Time
trigger1 = var(20)
var(10) = 0

[State 1500, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 0, 1500, ifElse(var(10) = 1, 1510, 1520))

[State 1500, Hitby]
type = Hitby
trigger1 = Time
trigger1 = time < 20
value = SC,AT



[State 1500, Voice]
type = Playsnd
trigger1 = AnimElem = 1
value = 4,1
channel = 0

[State 1500, Rolling Sound]
type = Playsnd
trigger1 = AnimElem = 1
value = 105,0
channel = 1

[State 1500, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x = 6

[State 1500, VelSet]
type = VelSet
trigger1 = AnimElem = 9 && !var(10)
trigger2 = AnimElem = 12 && var(10) = 1
trigger3 = AnimElem = 17 && var(10) = 2
x = 0

[State 1500, PlayerPush]
type = PlayerPush
trigger1 = AnimElemTime(2) > 0
value = 0
ignoreHitPause = 1

[State 1500, Change to Crouching]
type = ChangeState
triggerAll = command = "holddown"
trigger1 = AnimElem = 7 && !var(10)
trigger2 = AnimElem = 10 && var(10) = 1
trigger3 = AnimElem = 15 && var(10) = 2
value = 11
ctrl = 1

[State 1500, Roll Dust]
type = Explod
triggerAll = !(AnimElemTime(4) % 3)
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(6) < 0 && !var(10)
trigger2 = AnimElemTime(4) >= 0 && AnimElemTime(9) < 0 && var(10) = 1
trigger3 = AnimElemTime(4) >= 0 && AnimElemTime(14) < 0 && var(10) = 2
anim = 8104
sprPriority=3
posType = P1
pos = 0,0
vel = 0,0
scale = 0.5,0.5
pauseMovetime = -1
superMoveTime = -1
ownpal = 1

[State 1500, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;===========<ZENTOU>==========
[StateDef 1530]
type = S
physics = N
moveType = A
anim = 1530
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1530, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = 4,1
channel = 0

[State 1530, Rolling Sound]
type = PlaySnd
trigger1 = AnimElem = 1
value = 105,0
channel = 1

[State 1530, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x = 6

[State 1530, VelSet]
type = VelSet
trigger1 = AnimElem = 5
x = 0

[State 1530, PlayerPush]
type = PlayerPush
trigger1 = AnimElemTime(2) > 0
value = 0
ignoreHitPause = 1

[State 1530, VelSet]
type = VelSet
trigger1 = AnimElem = 11
x = -3.5
y = -4

[State 1530, Gravity]
type = Gravity
trigger1 = AnimElemTime(11) >= 0

[State 1530, Roll Dust]
type = Explod
trigger1 = AnimElem = 2
anim = 8104
sprPriority=3
posType = P1
pos = 0,0
vel = 0,0
scale = 0.5,0.5
pauseMovetime = -1
superMoveTime = -1
ownpal = 1

[State 1530, Hitting the Floor Dust Explod]
type = Explod
trigger1 = AnimElem = 5
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1530, Hitting the Floor Sound]
type = PlaySnd
trigger1 = AnimElem = 5
value = 1300,1
channel = 2

[State 1530, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 52



;===========<RASETSU KYAKU>==========
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
var(10) = ifElse((command = "c" || command = "rlsc"), 2, ifElse((command = "b" || command = "rlsb"), 1, 0))

[State 1600, Button Detect]
type = VarSet
trigger1 = !Time && AILevel
var(10) = 0 + (P2Bodydist x > 150) + (P2Bodydist x > 200)


[State 1600, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 2, 1620, ifElse(var(10) = 1, 1610, 1600)) + (var(40) = 2)

[State 1600, Voice]
type = PlaySnd
trigger1 = AnimElem = 2 && var(40) = 1
value = 1600,0
channel = 0

[State 1600, Voice (Master)]
type = PlaySnd
trigger1 = AnimElem = 2 && var(40) = 2
value = 3000,0
channel = 0

[State 1600, Rasetsu Kyaku Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1600, 1
channel = 1

[State 1600, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(9) < 0 && !var(10)
trigger2 = AnimElemTime(13) < 0 && var(10)
value = SCA

[State 1600, PlayerPush]
type = PlayerPush
trigger1 = AnimElemTime(9) < 0 && !var(10)
trigger2 = AnimElemTime(13) < 0 && var(10)
value = 0
ignoreHitPause = 1

[State 1600, Fade Away Helper]
type = Helper
trigger1 = AnimElem = 2
helperType = Normal
stateNo = 1605
ID = 1605
name = "Rasetsu Kyaku Fade Away Helper"
posType = P1
ownPal = 1

[State 1600, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x = 12

[State 1600, VelSet]
type = VelSet
trigger1 = AnimElem = 11 && !var(10)
trigger2 = AnimElem = 15 && var(10)
x = 0

[State 1600, VelMul]
type = VelMul
trigger1 = AnimElem = 7 && !var(10)
trigger2 = AnimElem = 9 && var(10)
x = 0.85

[State 1600, Landing Sound]
type = PlaySnd
trigger1 = AnimElem = 11 && !var(10)
trigger2 = AnimElem = 15 && var(10)
value = 100,0
channel = 3

[State 1600, Hitting the Floor Dust Explod]
type = Explod
trigger1 = AnimElem = 11 && !var(10)
trigger2 = AnimElem = 15 && var(10)
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1600, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = nowalk
flag2 = nocrouchguard
flag3 = nostandguard

[State 1600, CtrlSet]
type = ctrlset
trigger1 = (Anim = 1600 || Anim = 1601) && Animelemtime(12)=1
trigger2 = (Anim = 1610 || Anim = 1611 || Anim = 1620 || Anim = 1621) && Animelemtime(16)=1
value = 1



[State 1600, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



