; _________________________________________
;| Ken by Jmorphman                        |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==============================================================================================
;=======================================<SYSTEM STATES>========================================
;==============================================================================================

;====================<STANDING>====================
[StateDef 0]
type = S
physics = S
moveType = I
velSet = 0,0
sprPriority = 0

[State 0, Remove Explods]
type = RemoveExplod
trigger1 = IsHelper

[State 0, Destroy Helpers]
type = DestroySelf
trigger1 = IsHelper

[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != ifElse(var(40) = 3, 4, ifElse(var(40) = 1, 2, ifElse(var(40) = 2, 3, 0))) && Anim != 5 && Anim != 7
trigger2 = Anim = ifElse(var(40) = 1, 7, 5) && !AnimTime
value = ifElse(var(40) = 3, 4, ifElse(var(40) = 1, 2, ifElse(var(40) = 2, 3, 0)))

[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = Anim = 5 && var(40) = 1
value = 7

[State 0, Skywalker]
type = ChangeState
triggerall = pos y < 0
trigger1 = !NumEnemy
trigger2 = NumEnemy = 1
trigger2 = (Enemy, Name = "M -NES Game 1" + Enemy, Name = "M -NES Game 2" + Enemy, Name = "M -GB Game 1" + Enemy, AuthorName = "Bane84") < 2
trigger3 = Numenemy >= 2
trigger3 = (Enemy(0), Name = "M -NES Game 1" + Enemy(0), Name = "M -NES Game 2" + Enemy(0), Name = "M -GB Game 1" + Enemy(0), AuthorName = "Bane84") < 2
trigger3 = (Enemy(1), Name = "M -NES Game 1" + Enemy(1), Name = "M -NES Game 2" + Enemy(1), Name = "M -GB Game 1" + Enemy(1), AuthorName = "Bane84") < 2
value = 50

[State 0, Dead]
type = ChangeState
trigger1 = !Alive
value = 5050



;====================<CROUCHING>====================
;Stand to Crouch
[StateDef 10]
type = C
physics = C
moveType = I
velSet = 0,0
sprPriority = 0

[State 10, Reversed Commands: change to jumping]
type = ChangeState
trigger1 = !Time
trigger1 = NumExplod(92828282) || NumExplod(92468246) && command = "holddown"
value = 40

[State 10, ChangeAnim]
type = ChangeAnim
trigger1 = !Time && Anim = ifElse(var(40) = 1, 15, 12)
value = ifElse(var(40) = 1, 13, 10)
elem = 3 - AnimElemNo(0)

[State 10, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != ifElse(var(40) = 1, 13, 10)
value = ifElse(var(40) = 1, 13, 10)

[State 10, End]
type = ChangeState
trigger1 = !AnimTime
value = 11


;Crouching
[StateDef 11]
type = C
physics = C
moveType = I
anim = ifElse(var(40) = 1, 14, 11)
velSet = 0,0
sprPriority = 0

[State 11, ChangeAnim]
type = ChangeAnim
trigger1 = Anim = ifElse(var(40) = 1, 8, 6) && !AnimTime
value = ifElse(var(40) = 1, 14, 11)

[State 11, ChangeAnim]
type = ChangeAnim
trigger1 = Anim = 6 && var(40) = 1
value = 8



;Crouch to Stand
[StateDef 12]
type = S
physics = S
moveType = I
velSet = 0,0
sprPriority = 0

[State 12, Reversed Commands: change to "fake" crouch state]
type = ChangeState
trigger1 = !Time
trigger1 = (NumExplod(92828282) || NumExplod(92468246)) && command = "holdup"
value = 13

[State 12, ChangeAnim]
type = ChangeAnim
trigger1 = !Time && Anim = ifElse(var(40) = 1, 13, 10)
value = ifElse(var(40) = 1, 15, 12)
elem = 3 - AnimElemNo(0)

[State 12, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != ifElse(var(40) = 1, 15, 12)
value = ifElse(var(40) = 1, 15, 12)

[State 12, End]
type = ChangeState
trigger1 = command = "holddown" && command != "holdup"
value = 10

[State 12, End]
type = ChangeState
trigger1 = !AnimTime
value = 0


;"Fake" crouch state (for reversed commands)
[StateDef 13]
type = C
physics = C
moveType = I
velSet = 0,0
sprPriority = 0
ctrl = 1

[State 13, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != ifElse(var(40) = 1, 13, 10) && Anim != ifElse(var(40) = 1, 15, 11) && Anim != 141
value = 10

[State 13, ChangeAnim]
type = ChangeAnim
trigger1 = Anim = ifElse(var(40) = 1, 13, 10) && !AnimTime
trigger2 = Anim = 141 && !AnimTime
value = 11



;====================<WALKING>====================
[StateDef 20]
type = S
physics = S
moveType = I
sprPriority = 0

[State 20, VelSet]
type = VelSet
trigger1 = !NumExplod(94646464) && !NumExplod(92468246)
trigger1 = command = "holdfwd"
trigger2 = NumExplod(94646464) || NumExplod(92468246)
trigger2 = command = "holdback"
x = ifElse(var(40) = 1, 2.33203125, const(velocity.walk.fwd.x))

[State 20, VelSet]
type = VelSet
trigger1 = !NumExplod(94646464) && !NumExplod(92468246)
trigger1 = command = "holdback"
trigger2 = NumExplod(94646464) || NumExplod(92468246)
trigger2 = command = "holdfwd"
x = ifElse(var(40) = 1, -2.33203125, const(velocity.walk.back.x))

[State 20, ChangeAnim]
type = ChangeAnim
trigger1 = Anim = 5 && var(40) = 1
value = 7

[State 20, ChangeAnim]
type = ChangeAnim
triggerAll = vel x > 0
trigger1 = Anim != 20 && Anim != ifElse(var(40) = 1, 7, 5)
trigger2 = Anim = ifElse(var(40) = 1, 7, 5) && AnimElemTime(1) >= 1
value = 20

[State 20, ChangeAnim]
type = ChangeAnim
triggerAll = vel x < 0
trigger1 = Anim != 21 && Anim != ifElse(var(40) = 1, 7, 5)
trigger2 = Anim = ifElse(var(40) = 1, 7, 5) && AnimElemTime(1) >= 1
value = 21



;====================<JUMPING>====================
;Jumping
[StateDef 40]
type = S
physics = S
moveType = I
ctrl = 0
velSet = 0,0
sprPriority = 1
faceP2 = 1

[State 40, Reversed Commands: change to "fake" crouch state]
type = ChangeState
trigger1 = !Time
trigger1 = (NumExplod(92828282) || NumExplod(92468246)) && command = "holdup"
value = 13

[State 40, If AI, change back to stand state when Double Shinku Hadoken/Shin Goku Messatsu is possible]
type = ChangeState
trigger1 = var(59)
value = 0
ctrl = 1

[State 40, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(40) = 1, 48, 40)

[State 40, Direction]
type = VarSet
trigger1 = !AILevel
trigger1 = !NumExplod(94646464) && !NumExplod(92468246)
sysvar(1) = ifElse(!Time, 0, ifElse(command = "holdfwd", 1, ifElse(command = "holdback", -1, sysvar(1))))

[State 40, Direction (Reversed Commands)]
type = VarSet
trigger1 = !AILevel
trigger1 = NumExplod(94646464) || NumExplod(92468246)
sysvar(1) = ifElse(!Time, 0, ifElse(command = "holdback", 1, ifElse(command = "holdfwd", -1, sysvar(1))))

[State 40, Direction (AI)]
type = VarSet
trigger1 = AILevel
sysvar(1) = ifElse((EnemyNear, MoveType != A || BackEdgeBodyDist <= 10), 1, ifElse((EnemyNear, MoveType = A), -1, 0))

[State 40, High Jump]
type = VarSet
trigger1 = !Time && !AILevel
;ifElse(command = "highjump", 3, 0)
var(3) = ifElse(NumExplod(90000408), 3, 0)

[State 40, High Jump (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(3) = ifElse((P2BodyDist x >= 160 || Random < (125 * (AILevel ** 2 / 64.0))), 3, 0)

[State 40, High Jump]
type = VarSet
trigger1 = !Time && PrevStateNo = 100
var(3) = 3

[State 40, Low Jump]
type = VarSet
trigger1 = !NumExplod(92828282) && !NumExplod(92468246)
trigger1 = !AILevel && command != "holdup" && (var(3) != [1,2])
trigger2 = NumExplod(92828282) || NumExplod(92468246)
trigger2 = !AILevel && command != "holddown" && (var(3) != [1,2])
var(3) = ifElse((var(3) = 3 && sysvar(1)), 2, 1)

[State 40, Low Jump (AI)]
type = VarSet
trigger1 = AILevel && (var(3) != [1,2])
trigger1 = (EnemyNear, StateType = C) && Random < 500
var(3) = ifElse((var(3) = 3 && sysvar(1)), 2, 1)

[State 40, Jump Sound]
type = PlaySnd
trigger1 = !AnimTime
value = ifElse((var(3) = [2,3]), 41, 40), 0

[State 40, Dust Helper]
type = Helper
trigger1 = !AnimTime
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
ownPal = 1

[State 40, Velocity: Normal Jump]
type = VelSet
trigger1 = !AnimTime
x = ifElse(!sysvar(1), const(velocity.jump.neu.x), ifElse(sysvar(1) = 1, const(velocity.jump.fwd.x), const(velocity.jump.back.x))) * ifElse(var(40) = 1, 0.7566539923954373, 1)
y = ifElse(!sysvar(1), const(velocity.jump.y), ifElse(sysvar(1) = 1, -8.75, -9.0625)) * ifElse(var(40) = 1, 1.178947368421053, 1)

[State 40, Velocity: Low Jump]
type = VelSet
trigger1 = !AnimTime && var(3) = 1
x = ifElse(!sysvar(1), const(velocity.jump.neu.x), ifElse(sysvar(1) = 1, const(velocity.jump.fwd.x), const(velocity.jump.back.x))) * ifElse(var(40) = 1, 0.7566539923954373, 1)
y = 0.75 * ifElse(!sysvar(1), const(velocity.jump.y), ifElse(sysvar(1) = 1, -8.75, -9.0625)) * ifElse(var(40) = 1, 1.178947368421053, 1)

[State 40, Velocity: Long Low Jump]
type = VelSet
trigger1 = !AnimTime && var(3) = 2
x = ifElse(!sysvar(1), const(velocity.jump.neu.x), ifElse(sysvar(1) = 1, const(velocity.runjump.fwd.x), const(velocity.runjump.back.x))) * ifElse(var(40) = 1, 0.7566539923954373, 1)
y = 0.75 * ifElse(!sysvar(1), const(velocity.jump.y), ifElse(sysvar(1) = 1, -8.75, -9.0625)) * ifElse(var(40) = 1, 1.178947368421053, 1)

[State 40, Velocity: Long Jump]
type = VelSet
trigger1 = !AnimTime && var(3) = 3
x = ifElse(!sysvar(1), const(velocity.jump.neu.x), ifElse(sysvar(1) = 1, const(velocity.runjump.fwd.x), const(velocity.runjump.back.x))) * ifElse(var(40) = 1, 0.7566539923954373, 1)
y = ifElse(!sysvar(1), const(velocity.runjump.y), ifElse(sysvar(1) = 1, -8.75, -9.0625)) * ifElse(var(40) = 1, 1.178947368421053, 1)

[State 40, End]
type = ChangeState
trigger1 = !AnimTime
value = 50
ctrl = 1


;In Air
[StateDef 50]
type = A
physics = N
moveType = I
sprPriority = 1

[State 50, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(!vel x , 41, ifElse(vel x > 0, 42, 43)) + 10 * (var(3) = [1,2])
persistent = 0

[State 50, Assert: No Guard]
type = AssertSpecial
trigger1 = var(3) = [1,2]
flag = NoAirGuard
ignoreHitPause = 1

[State 50, Grounded Frame]
type = PosFreeze
trigger1 = Time < 1 && PrevStateNo = 40
value = 1

;[State 50, Gravity]
;type = Gravity
;trigger1 = Time > 1 || PrevStateNo != 40

[State 50, Gravity]
type = VelAdd
trigger1 = Time > 1 || PrevStateNo != 40
y = ifElse(var(40) = 1, 0.5546875, 0.48828125)

[State 50, VelAdd]
type = VelAdd
trigger1 = vel x
trigger1 = Time > 1 || PrevStateNo != 40
x = ifElse((var(3) = [2,3]), -0.04577636719, -0.03051757813) * ifElse(vel x < 0, -1, 1)

[State 50, Landing]
type = ChangeState
trigger1 = pos y > -vel y
value = 52


[StateDef 51]
type = A
physics = N
moveType = I
sprPriority = 1

;[State 51, Gravity]
;type = Gravity
;trigger1 = Time > 0

[State 50, Gravity]
type = VelAdd
trigger1 = Time > 0
y = ifElse(var(40) = 1, 0.5546875, 0.48828125)

[State 51, VelAdd]
type = VelAdd
trigger1 = vel x
trigger1 = Time >= 1 || PrevStateNo != 40
x = ifElse((var(3) = [2,3]), -0.04577636719, -0.03051757813) * ifElse(vel x < 0, -1, 1)

[State 51, Landing]
type = ChangeState
trigger1 = pos y > -vel y
value = 52


;Landing
[StateDef 52]
type = S
physics = S
moveType = I
anim = ifElse(var(40) = 1, 49, 47)
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 52, ChangeAnim]
type = ChangeAnim
trigger1 = !Time && (var(3) = 1 || var(3) = 2)
trigger1 = (PrevStateNo = [600,699])
value = ifElse(var(40) = 1, 58, 57)

[State 52, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 52, CtrlSet]
type = CtrlSet
trigger1 = !Time && (PrevStateNo != [600,699])
trigger2 = Time = 1 && Anim != ifElse(var(40) = 1, 58, 57)
value = 1

[State 52, ChangeState to Guarding]
type = ChangeState
;ctrl && command = "holdback"
trigger1 = ctrl && (ifElse(!NumExplod(94646464) && !NumExplod(92468246), ifElse(P2dist x < 0, command = "holdfwd", command = "holdback"), ifElse(P2dist x < 0, command = "holdback", command = "holdfwd")))
trigger1 = InGuardDist && (PrevStateNo != [600,699])
value = 120

[State 52, Assert: NoWalk]
type = AssertSpecial
trigger1 = Anim != ifElse(var(40) = 1, 7, 5)
flag = NoWalk
ignoreHitPause = 1

[State 52, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 52, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 52, ChangeAnim to Turning]
type = ChangeAnim
trigger1 = ctrl && P2Dist x < 0
trigger1 = Anim != ifElse(var(40) = 1, 7, 5)
value = ifElse(var(40) = 1, 7, 5)

[State 52, Turn]
type = Turn
trigger1 = Anim = ifElse(var(40) = 1, 7, 5) && AnimElem = 1

[State 52, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;======================<RUN>===========================
[StateDef 100]
type = S
physics = N
moveType = I
anim = 100
ctrl = 0
sprPriority = 1

[State 100, VelSet]
type = VelSet
trigger1 = 1
x = const(velocity.run.fwd.x)

[State 100, Step Sound]
type = PlaySnd
trigger1 = (AnimElem = 3 || AnimElem = 6)
value = 100, ifElse((AnimElem = 3), 0, 1)

[State 100, Jump]
type = ChangeState
triggerAll = !AILevel
trigger1 = !NumExplod(92828282) && !NumExplod(94646464) && !NumExplod(92468246)
trigger1 = command = "holdfwd" && command = "holdup"
trigger2 = NumExplod(92828282)
trigger2 = command = "holdfwd" && command = "holddown"
trigger3 = NumExplod(94646464)
trigger3 = command = "holdback" && command = "holdup"
trigger4 = NumExplod(92468246)
trigger4 = command = "holdback" && command = "holddown"
value = 40

[State 100, Jump (AI)]
type = ChangeState
trigger1 = AILevel && Random < 25
value = 40

[State 100, End]
type = ChangeState
trigger1 = !NumExplod(94646464) && !NumExplod(92468246)
trigger1 = !AILevel && command != "holdfwd"
trigger2 = NumExplod(94646464) || NumExplod(92468246)
trigger2 = !AILevel && command != "holdback"
trigger3 = AILevel && P2BodyDist x <= 90
value = 101


;Stop Running
[StateDef 101]
type = S
physics = S
moveType = I
anim = 101
ctrl = 0
sprPriority = 1

[State 101, Stopping Sound]
type = PlaySnd
trigger1 = !Time
value = 101,0

[State 101, Skid Dust]
type = Explod
trigger1 = !Time
anim = 8104
sprPriority = 3
posType = P1
pos = 0,0
vel = 0,0
scale = 0.5,0.5
pauseMovetime = -1
superMoveTime = -1
ownpal = 1

[State 101, Jump]
type = ChangeState
trigger1 = !NumExplod(92828282) && !NumExplod(92468246)
trigger1 = !AILevel && command = "holdup"
trigger2 = NumExplod(92828282) || NumExplod(92468246)
trigger2 = !AILevel && command = "holddown"
value = 40

[State 101, End]
type = ChangeState
trigger1 = !AnimTime
trigger1 = !NumExplod(92828282) && !NumExplod(92468246)
value = ifElse(command = "holddown", 10, 0)
ctrl = 1

[State 101, End (Reversed Commands)]
type = ChangeState
trigger1 = !AnimTime
trigger1 = NumExplod(92828282) || NumExplod(92468246)
value = ifElse(command = "holdup", 10, 0)
ctrl = 1



;========================<DASH BACKWARDS>==========================
[StateDef 105]
type = A
physics = N
moveType = I
velSet = 0,0
anim = ifElse(var(40) = 1, 107, 105)
ctrl = 0
sprPriority = 1

[State 105, Back Dash Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 105,0

[State 105, Dust Helper]
type = Helper
trigger1 = AnimElem = 2
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
facing = -1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 105, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x = const(velocity.run.back.x)
y = const(velocity.run.back.y)

[State 105, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(2) > 0
x = 0.09765625

[State 105, End]
type = ChangeState
trigger1 = !AnimTime
value = 106


;Stop Dashing Backwards
[StateDef 106]
type = S
physics = S
ctrl = 0
anim = ifElse(var(40) = 1, 108, 106)
velSet = 0,0

[State 106, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 106, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 100,1

[State 106, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprpriority = -3
postype = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 106, CtrlSet]
type = CtrlSet
trigger1 = Time >= 2
value = 1

[State 106, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;=================<DASH FORWARD>=================
[StateDef 110]
type = A
physics = N
moveType = I
anim = ifElse(var(40) = 1, 112, 110)
ctrl = 0
sprPriority = 1

[State 110, Dash Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 110,0

[State 110, Dust Helper]
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

[State 110, VarSet -> Running]
type = VarSet
trigger1 = !Time
sysvar(1) = 1

[State 110, VarSet -> Not Running]
type = VarSet
triggerAll = AnimElemTime(2) <= 0 && !AILevel
trigger1 = !NumExplod(94646464) && !NumExplod(92468246)
trigger1 = command != "holdfwd"
trigger2 = NumExplod(94646464) || NumExplod(92468246)
trigger2 = command != "holdback"
sysvar(1) = 0

[State 110, ChangeState to Running]
type = ChangeState
trigger1 = AnimElemTime(2) = 0 && sysvar(1)
value = 100

[State 110, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x = 8.125

[State 110, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(2) > 0
x = -0.09765625

[State 110, End]
type = ChangeState
trigger1 = !AnimTime
value = 111


;Stop Dashing Forward
[StateDef 111]
type = S
physics = S
ctrl = 1
anim = 111
velSet = 0,0

[State 111, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 111, Dash End Sound]
type = PlaySnd
trigger1 = !Time
value = 100,0

[State 111, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 111, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====================<DODGE>====================
[StateDef 700]
type = S
physics = S
moveType = I
anim = 700
ctrl = 0
velSet = 0,0
sprPriority = -2

[State 700, Voice]
type = PlaySnd
trigger1 = !Time
value = 4,2 + 8 * (var(40) = 1)
channel = 0

[State 700, Dodge Sound]
type = PlaySnd
trigger1 = !Time
value = 1,3
channel = 1

[State 700, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0
ignoreHitPause = 1

[State 700, HitBy]
type = HitBy
trigger1 = 1
value = SCA,AT
time = 1

[State 700, Attack]
type = ChangeState
trigger1 = !AILevel && Time = [15,25]
;command = "x" || command = "y" || command = "z" || command = "a" || command = "b" || command = "c"
trigger1 = NumExplod(90000200) || NumExplod(90000210) || NumExplod(90000220) || NumExplod(90000230) || NumExplod(90000240) || NumExplod(90000250)
;ifElse((command = "x" || command = "y" || command = "z"), 220, 245)
value = ifElse((NumExplod(90000200) || NumExplod(90000210) || NumExplod(90000220)), 225, ifElse(var(40) = 3, 252, 250))

[State 700, Attack (AI)]
type = ChangeState
trigger1 = AILevel && (Time = [15,25]) && NumEnemy
trigger1 = (EnemyNear, MoveType != A) && (P2BodyDist x = [-60,60]) && (P2Dist y >= -60)
value = ifElse(Random < 666, 225, ifElse(var(40) = 3, 252, 250))

[State 700, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;================<ROLL FORWARD>================
[StateDef 710]
type = S
physics = N
moveType = I
anim = ifElse(var(40) = 1, 711, 710)
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 710, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0
ignoreHitPause = 1

[State 710, HitBy]
type = HitBy
trigger1 = AnimElemTime(9) < 0
value = SCA,AT
time = 1

[State 710, Voice]
type = PlaySnd
trigger1 = !Time
value = 4, ifElse(Random < 500, 0, 1) + 10 * (var(40) = 1)
channel = 0

[State 710, Roll Sound]
type = PlaySnd
trigger1 = !Time
value = 110,0
channel = 1

[State 710, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x = 5.625

[State 710, VelSet]
type = VelSet
trigger1 = AnimElem = 9
x = 0

[State 710, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;===============<ROLL BACKWARDS>===============
[StateDef 715]
type = S
physics = N
moveType = I
anim = ifElse(var(40) = 1, 716, 715)
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 715, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0
ignoreHitPause = 1

[State 715, HitBy]
type = HitBy
trigger1 = AnimElemTime(9) < 0
value = SCA,AT
time = 1

[State 715, Voice]
type = PlaySnd
trigger1 = !Time
value = 4, ifElse(Random < 500, 0, 1) + 10 * (var(40) = 1)
channel = 0

[State 715, Roll Sound]
type = PlaySnd
trigger1 = !Time
value = 110,0
channel = 1

[State 715, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x = -5.625

[State 715, VelSet]
type = VelSet
trigger1 = AnimElem = 9
x = 0

[State 715, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;==========<POWER CHARGE>==========
[StateDef 730]
type = S
physics = S
moveType = I
anim = 730
velSet = 0,0
ctrl = 0

[State 730, PowerAdd]
type = PowerAdd
triggerAll = Power < const(data.power) && Power < PowerMax
trigger1 = !AILevel && (command = "holdb" && command = "holdy")
trigger2 = AILevel
value = 2 + ifElse(time < 60, 0, (time - 60) / 12)

[State 730, Voice]
type = PlaySnd
trigger1 = !Time && var(40) != 1
value = 730,1
channel = 0

[State 730, Voice (Violent)]
type = PlaySnd
trigger1 = !Time && var(40) = 1
value = 1270,0
channel = 0

[State 730, Character Flash]
type = PalFX
trigger1 = 1
time = 1
add = 75 + ceil(sin(Time / 6.0 * pi) * 75), 25 + ceil(sin(Time / 6.0 * pi) * 25),0

[State 730, Power Charge Helper]
type = Helper
trigger1 = !NumHelper(8330)
helperType = Normal
stateNo = 8330
ID = 8330
name = "Power Charge"
posType = P1
pos = 0,0
pauseMoveTime = 65535
superMoveTime = 65535
ownPal = 1

[State 730, Particles]
type = Helper
trigger1 = !NumHelper(8331)
helperType = Normal
stateNo = 8331
ID = 8331
name = "Particles"
postype = P1
pauseMoveTime = 65535
superMoveTime = 65535
ownPal = 1

[State 730, End]
type = ChangeState
trigger1 = Power >= const(data.power) || Power >= PowerMax || RoundState != 2
trigger2 = !AILevel && (command != "holdb" || command != "holdy")
trigger3 = AILevel && (InGuardDist || P2BodyDist x <= 120)
value = 731
ctrl = 1


;Power Charge End
[StateDef 731]
type = S
physics = S
moveType = I
anim = ifElse(var(40) = 1, 732, 731)
velSet = 0,0
ctrl = 1

[State 731, StopSnd]
type = StopSnd
trigger1 = !Time
channel = 0

[State 731, Full Power Voice]
type = PlaySnd
trigger1 = !Time && Power >= const(data.power) && var(40) != 1
value = 3100,0
channel = 0
persistent = 0

[State 731, Full Power Voice (Violent)]
type = PlaySnd
trigger1 = !Time && Power >= const(data.power) && var(40) = 1
value = 730,10
channel = 0
persistent = 0

[State 730, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====================<ZERO COUNTER>====================
[StateDef 750]
type = S
physics = S
moveType = I
anim = 750
velSet = 0,0
ctrl = 0
sprPriority = 2
powerAdd = -1000
faceP2 = 1

[State 750, Button]
type = VarSet
trigger1 = !Time && !AILevel
;(command = "412k")
var(10) = NumExplod(90000230) || NumExplod(90000235) || NumExplod(90000240) || NumExplod(90000245) || NumExplod(90000250) || NumExplod(90000255)
ignoreHitPause = 1

[State 750, Button (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2StateType = A), 0, ifElse((P2StateType = C), 1, ifElse(Random < 500, 0, 1)))
ignoreHitPause = 1

[State 750, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 750, PosFreeze]
type = PosFreeze
trigger1 = 1
value = 1

[State 750, Voice]
type = PlaySnd
trigger1 = !Time
value = 4, ifElse(var(40) = 1, 11, 2)
channel = 0

[State 750, Zero Counter FX Helper]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8350
ID = 8350
name = "Zero Counter"
posType = P1
pos = 22, -65
superMoveTime = 255
ownPal = 1

[State 750, SuperPause]
type = SuperPause
trigger1 = !Time
time = 15
moveTime = 15
p2DefMul = 1
anim = -1
sound = s750,0
darken = 0

[State 750, End]
type = ChangeState
trigger1 = Time >= 15
value = ifElse(var(10) = 1, 2910, 2900)



;====================<PARRY>====================
;Standing Parry
[StateDef 760]
type = S
physics = S
moveType = I
anim = 760
velSet = 0,0
ctrl = 0
sprPriority = 2
powerAdd = 78
faceP2 = 1

[State 760, HitBy]
type = HitBy
trigger1 = 1
value = SCA,AT
time = 1

[State 760, Pause]
type = Pause
trigger1 = !Time
time = 15
moveTime = 15
endCmdBufTime = 15
pauseBg = 0

[State 760, Stop]
type = PosFreeze
trigger1 = 1
value = 1

[State 760, No Walking]
type = VarSet
trigger1 = 1
var(26) = 7

[State 760, Voice]
type = PlaySnd
trigger1= !Time
value = 4, ifElse(var(40) = 1, 11, 2)
channel = 0

[State 760, Parry Sound]
type = PlaySnd
trigger1 = !Time
value = 760,0
channel = 1

[State 760, Player Flash]
type = PalFX
trigger1 = !Time
add = 0,64,255
sinadd = 0,-64,-255,60
time = 15

[State 760, FX]
type = Explod
trigger1 = !Time
anim = 8360
sprPriority = 5
posType = P1
pos = 31, -72
pauseMoveTime = -1
superMoveTime = -1
scale = 0.5,0.5
ownPal = 1

[State 760, EnvShake]
type = EnvShake
trigger1 = !Time
time = 0
ampl = 0

[State 760, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Crouching Parry
[StateDef 761]
type = C
physics = C
moveType = I
anim = 761
velSet = 0,0
ctrl = 0
sprPriority = 2
powerAdd = 78
faceP2 = 1

[State 761, HitBy]
type = HitBy
trigger1 = 1
value = SCA,AT
time = 1

[State 761, Pause]
type = Pause
trigger1 = !Time
time = 15
moveTime = 15
endCmdBufTime = 15
pauseBg = 0

[State 761, PosFreeze]
type = PosFreeze
trigger1 = 1
value = 1

[State 761, No Walk]
type = VarSet
trigger1 = 1
var(26) = 7

[State 761, Voice]
type = PlaySnd
trigger1 = !Time
value = 4, ifElse(var(40) = 1, 11, 2)
channel = 0

[State 761, Parry Sound]
type = PlaySnd
trigger1 = !Time
value = 760,0
channel = 1

[State 761, Player Flash]
type = PalFX
trigger1 = !Time
add = 0,64,255
sinAdd = 0,-64,-255,60
time = 15

[State 761, Parry FX]
type = Explod
trigger1 = !Time
anim = 8360
sprpriority = 5
postype = P1
pos = 27, -24
pauseMovetime = -1
superMovetime = -1
scale = 0.5,0.5
ownpal = 1

[State 761, EnvShake]
type = EnvShake
trigger1 = !Time
time = 0
ampl = 0

[State 761, End]
type = ChangeState
trigger1 = !AnimTime
value = 11
ctrl = 1


;Jumping Parry
[StateDef 762]
type = A
physics = N
moveType = I
anim = 762
ctrl = 0
sprPriority = 2
powerAdd = 78
faceP2 = 1

[State 762, HitBy]
type = HitBy
trigger1 = 1
value = SCA,AT
time = 1

[State 762, Pause]
type = Pause
trigger1 = !Time
time = 15
moveTime = 15
endCmdBufTime = 15
pauseBg = 0

[State 762, PosFreeze]
type = PosFreeze
trigger1 = 1
value = 1

[State 762, Voice]
type = PlaySnd
trigger1 = !Time
value = 4, ifElse(var(40) = 1, 11, 2)
channel = 0

[State 762, Parry Sound]
type = PlaySnd
trigger1 = !Time
value = 760,0
channel = 1

[State 762, Player Flash]
type = PalFX
trigger1 = !Time
add = 0,64,255
sinadd = 0,-64,-255,60
time = 15

[State 762, Parry FX]
type = Explod
trigger1 = !Time
anim = 8360
sprPriority = 5
posType = P1
pos = 42, -65
pauseMoveTime = -1
superMoveTime = -1
scale = 0.5,0.5
ownpal = 1

[State 762, EnvShake]
type = EnvShake
trigger1 = !Time
time = 0
ampl = 0

[State 762, End]
type = ChangeState
trigger1 = !AnimTime
value = 763
ctrl = 1


;Falling
[StateDef 763]
type = A
physics = N
movetype = I
anim = 763
ctrl = 1

[State 763, VelSet]
type = VelSet
trigger1 = !Time
x = ifElse(vel x > 2, 2, ifElse(vel x < -2, -2, vel x))
y = ifElse(vel y < -2, vel y, -2)

;[State 763, Gravity]
;type = Gravity
;trigger1 = Time > 0

[State 763, Gravity]
type = VelAdd
trigger1 = Time > 0
y = ifElse(var(40) = 1, 0.5546875, 0.48828125)

[State 763, Landing]
type = ChangeState
trigger1 = pos y > -vel y
value = 52



;====================<CUSTOM COMBO>====================
;Ground Version
[StateDef 900]
type = S
physics = S
moveType = A
anim = ifElse(var(40) = 1, 901, 900)
velSet = 0,0
ctrl = 0
sprPriority = 2
powerAdd = -1000

[State 900, Corner Push]
type = VarSet
trigger1 = Time = 4
fvar(5) = 0

[State 900, Unguardable]
type = VarSet
trigger1 = Time = 4 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 30

[State 900, NotHitBy]
type = NotHitBy
trigger1 = !time
value = SCA
time = 38

[State 900, PosFreeze]
type = PosFreeze
trigger1 = 1
value = 1

[State 900, Custom Combo Time]
type = VarSet
trigger1 = Time >= 4
var(20) = 180

[State 900, Voice]
type = PlaySnd
trigger1 = Time = 4 && var(40) != 1
value = 3000,0
channel = 0

[State 900, Voice (Violent)]
type = PlaySnd
trigger1 = Time = 4 && var(40) = 1
value = 3100,10
channel = 0

[State 900, Custom Combo FX Helper]
type = Helper
trigger1 = Time = 4
helperType = Normal
stateNo = 8400
ID = 8400
name = "Custom Combo FX"
posType = P1
pos = -8,-60
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 900, SuperPause]
type = SuperPause
trigger1 = Time = 4
time = 30
moveTime = 30
anim = -1
sound = s900,0
p2DefMul = 1
darken = 0

[State 900, AfterImage]
type = AfterImage
trigger1 = !AnimTime
time = 2
timeGap = 1
frameGap = 4
length = 13
palBright = 0,0,0
palContrast = 64,128,192
palPostBright = 0,0,0
palAdd = 0,0,0
palMul = 0.75,0.75,0.75
trans = add1

[State 900, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Air Version
[Statedef 905]
type = A
physics = N
moveType = A
anim = 905
ctrl = 0
sprPriority = 2
powerAdd = -1000

[State 905, Corner Push]
type = VarSet
trigger1 = Time = 4
fvar(5) = 0

[State 905, Unguardable]
type = VarSet
trigger1 = Time = 4 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 30

[State 905, NotHitBy]
type = NotHitBy
trigger1 = !Time
value = SCA
time = 38

[State 905, PosFreeze]
type = PosFreeze
trigger1 = 1
value = 1

[State 905, Custom Combo Timer]
type = VarSet
trigger1 = Time >= 4
var(20) = 180

[State 905, Voice]
type = PlaySnd
trigger1 = Time = 4 && var(40) != 1
value = 3000,0
channel = 0

[State 905, Voice (Violent)]
type = PlaySnd
trigger1 = Time = 4 && var(40) = 1
value = 3100,10
channel = 0

[State 905, Custom Combo FX Helper]
type = Helper
trigger1 = Time = 4
helperType = Normal
stateNo = 8400
ID = 8400
name = "Custom Combo Startup"
posType = P1
pos = 3,-81
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 905, SuperPause]
type = SuperPause
trigger1 = Time = 4
time = 30
moveTime = 30
anim = -1
sound = s900,0
p2DefMul = 1
darken = 0

[State 905, AfterImage]
type = AfterImage
trigger1 = !AnimTime
time = 2
timeGap = 1
frameGap = 4
length = 13
palBright = 0,0,0
palContrast = 64,128,192
palPostBright = 0,0,0
palAdd = 0,0,0
palMul = 0.75,0.75,0.75
trans = add1

[State 905, End]
type = ChangeState
trigger1 = !AnimTime
value = 906
ctrl = 1


;Air Finish
[StateDef 906]
type = A
physics = N
moveType = I
anim = 906
ctrl = 1

;[State 906, Gravity]
;type = Gravity
;trigger1 = Time > 0

[State 906, Gravity]
type = VelAdd
trigger1 = Time > 0
y = ifElse(var(40) = 1, 0.5546875, 0.48828125)

[State 906, Land]
type = ChangeState
trigger1 = pos y > -vel y
value = 52



;==========<TARGET SAFE FALL>==========
[StateDef 5205]
type = A
physics = N
moveType = H

[State 5205, ChangeAnim]
type = ChangeAnim
trigger1 = !AnimTime
trigger1 = anim = 5035
value = 5050

[State 5205, VelAdd]
type = VelAdd
trigger1 = Time > 0
y = GetHitVar(yAccel)

[State 5205, SelfState (Ground)]
type = SelfState
trigger1 = vel y > 0
trigger1 = pos y >= const(movement.air.getHit.groundRecover.ground.threshold)
value = 5200

[State 5205, SelfState (Air)]
type = SelfState
trigger1 = Time >= 60
value = 5210



;==========<FALL RECOVERY>==========
[StateDef 5200]
type = A
moveType = H
physics = N

[State 5200, ChangeAnim]
type = ChangeAnim
trigger1 = Anim = 5035 && !AnimTime
value = 5050

[State 5200, VelAdd]
type = VelAdd
trigger1 = Time > 0
y = GetHitVar(yAccel)

[State 5200, End]
type = SelfState
trigger1 = vel y > 0 && pos y >= 10
value = 5201


[StateDef 5201]
type = S
moveType = I
physics = N
anim = 5200
ctrl = 0
faceP2 = 1

[State 5201, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 5201, VelSet]
type = VelSet
trigger1 = !Time
x = -5
y = 0

[State 5201, Voice]
type = PlaySnd
trigger1 = !Time
value = 4, ifElse(var(40) = 1, 10, 0)
channel = 0

[State 5201, Recover Sound]
type = PlaySnd
trigger1 = !Time
value = 5200,0
channel = 1

[State 5201, Flash]
type = PalFX
trigger1 = !Time
add = 255,255,255
sinAdd = -255,-255,-255,40
time = 10

[State 5201, Recover FX]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8200
ID = 8200
name = "Recover FX"
posType = P1
pos = 0, ceil(-18 * const(size.yScale))
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 5201, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 5201, VelSet]
type = VelSet
trigger1 = AnimElem = 5
x = 0

[State 5201, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Air Recover
[StateDef 5210]
type = A
moveType = I
physics = N
anim = 5210
ctrl = 0
faceP2 = 1

[State 5210, VelAdd]
type = VelAdd
trigger1 = Time > 0
y = 0.6

[State 5210, VelSet]
type = VelSet
trigger1 = !Time
trigger1 = !NumExplod(92828282) && !NumExplod(92468246)
x = ifElse((command = "holdfwd" && command != "holdback"), 4, ifElse((command != "holdfwd" && command = "holdback"), -4, 0))
y = -7.55

[State 5210, VelSet (Reversed commands)]
type = VelSet
trigger1 = !Time
trigger1 = NumExplod(92828282) || NumExplod(92468246)
x = ifElse((command = "holdback" && command != "holdfwd"), 4, ifElse((command != "holdback" && command = "holdfwd"), -4, 0))
y = -7.55

[State 5210, Voice]
type = PlaySnd
trigger1 = !Time
value = 4, ifElse(var(40) = 1, 10, 0)
channel = 0

[State 5210, Recover Sound]
type = PlaySnd
trigger1 = !Time
value = 5200,0
channel = 1

[State 5210, Flash]
type = PalFX
trigger1 = !Time
add = 255,255,255
sinAdd = -255,-255,-255,40
time = 10

[State 5210, Recover FX]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8200
ID = 8200
name = "Recover FX"
posType = P1
pos = 0, ceil(-66 * const(size.yScale))
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 5210, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(5) < 0
value = SCA
time = 1

[State 5210, CtrlSet]
type = CtrlSet
trigger1 = AnimElemTime(5) >= 0
value = 1

[State 5210, Land]
type = ChangeState
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 52



;===================<GUARD>================
;Guard Start
[StateDef 120]
type = U
physics = U
anim = 120 + (StateType = C) + (StateType = A) * 2

[State 120, StateTypeSet: Standing]
type = StateTypeSet
trigger1 = !Time && StateType = S
physics = S

[State 120, StateTypeSet: Crouching]
type = StateTypeSet
trigger1 = !Time && StateType = C
physics = C

[State 120, StateTypeSet: Jumping]
type = StateTypeSet
trigger1 = !Time && StateType = A
physics = A

[State 120, VelSet]
type = VelSet
trigger1 = !Time && StateType != A
x = 0
y = 0

[State 120, Stand to Crouching]
type = StateTypeSet
trigger1 = !NumExplod(92828282) && !NumExplod(92468246)
trigger1 = !AILevel && StateType = S && command = "holddown"
trigger2 = NumExplod(92828282) || NumExplod(92468246)
trigger2 = !AILevel && StateType = S && command = "holdup"
trigger3 = AILevel && StateType = S && (EnemyNear, MoveType = A) && (EnemyNear, StateType = C)
stateType = C
physics = C

[State 120, Crouching to Stand]
type = StateTypeSet
trigger1 = !NumExplod(92828282) && !NumExplod(92468246)
trigger1 = !AILevel && StateType = C && command != "holddown"
trigger2 = NumExplod(92828282) || NumExplod(92468246)
trigger2 = !AILevel && StateType = C && command != "holdup"
trigger3 = AILevel && StateType = C && (EnemyNear, MoveType = A) && (EnemyNear, StateType != C)
stateType = S
physics = S

[State 120, AI Fix]
type = CtrlSet
trigger1 = AILevel && NumEnemy
value = (EnemyNear, Time >= 120 || Time >= 180)

[State 120, Change to Guard State]
type = ChangeState
trigger1 = !AnimTime || AILevel
value = 130 + (StateType = C) + (StateType = A) * 2

[State 120, Stop Guarding]
type = ChangeState
trigger1 = !AILevel && (ifElse(!NumExplod(94646464) && !NumExplod(92468246), ifElse(P2dist x < 0, command != "holdfwd", command != "holdback"), ifElse(P2dist x < 0, command != "holdback", command != "holdfwd")))
trigger2 = !InGuardDist
trigger3 = AILevel && NumEnemy
trigger3 = EnemyNear, HitDefAttr = SCA, AT
value = 140


;Standing Guard
[StateDef 130]
type = S
physics = S

[State 130, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 130
value = 130

[State 130, AI Fix]
type = CtrlSet
trigger1 = AILevel && NumEnemy
value = (EnemyNear, Time >= 120 || Time >= 180)

[State 130, Standing to Crouch]
type = ChangeState
trigger1 = !NumExplod(92828282) && !NumExplod(92468246)
trigger1 = !AILevel && StateType = S && command = "holddown"
trigger2 = NumExplod(92828282) || NumExplod(92468246)
trigger2 = !AILevel && StateType = S && command = "holdup"
trigger3 = AILevel && Random < (250 * (AILevel ** 2 / 64.0))
trigger3 = (EnemyNear, MoveType = A) && (EnemyNear, StateType = C)
value = 131

[State 130, Stop Guarding]
type = ChangeState
trigger1 = !AILevel && (ifElse(!NumExplod(94646464) && !NumExplod(92468246), ifElse(P2dist x < 0, command != "holdfwd", command != "holdback"), ifElse(P2dist x < 0, command != "holdback", command != "holdfwd")))
trigger2 = !InGuardDist
trigger3 = AILevel && NumEnemy
trigger3 = EnemyNear, HitDefAttr = SCA, AT
value = 140

[State 130, Landing Sound]
type = PlaySnd
trigger1 = !Time
trigger1 = PrevStateNo = 132 || (PrevStateNo = [154,155])
value = 52,0

[State 130, Landing Dust Expod]
type = Explod
trigger1 = !Time
trigger1 = PrevStateNo = 132 || (PrevStateNo = [154,155])
anim = 8102
sprpriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1


;Crouch Guarding
[StateDef 131]
type = C
physics = C

[State 131, ChangeAnim]
type = ChangeAnim
trigger1 = anim != 131
value = 131

[State 131, Crouching to Standing]
type = ChangeState
trigger1 = !NumExplod(92828282) && !NumExplod(92468246)
trigger1 = !AILevel && StateType = C && command != "holddown"
trigger2 = NumExplod(92828282) || NumExplod(92468246)
trigger2 = !AILevel && StateType = C && command != "holdup"
trigger3 = AILevel && Random < (125 * (AILevel ** 2 / 64.0))
trigger3 = (EnemyNear, MoveType = A) && (EnemyNear, StateType != C)
value = 130

[State 131, AI Fix]
type = CtrlSet
trigger1 = AILevel && NumEnemy
value = (EnemyNear, Time >= 120 || Time >= 180)

[State 131, Stop Guarding]
type = ChangeState
trigger1 = !AILevel && (ifElse(!NumExplod(94646464) && !NumExplod(92468246), ifElse(P2dist x < 0, command != "holdfwd", command != "holdback"), ifElse(P2dist x < 0, command != "holdback", command != "holdfwd")))
trigger2 = !InGuardDist
trigger3 = AILevel && NumEnemy
trigger3 = EnemyNear, HitDefAttr = SCA, AT
value = 140


;Air Guard
[StateDef 132]
type = A
physics = N

[State 132, ChangeAnim]
type = ChangeAnim
trigger1 = anim != 132
value = 132

[State 132, VelAdd]
type = VelAdd
trigger1 = Time > 0
y = const(movement.yAccel)

[State 132, VarSet]
type = VarSet
trigger1 = 1
sysvar(0) = (pos y >= 0 && vel y > 0)

[State 132, VelSet]
type = VelSet
trigger1 = sysvar(0)
y = 0

[State 132, PosSet]
type = PosSet
trigger1 = sysvar(0)
y = 0

[State 132, AI Fix]
type = CtrlSet
trigger1 = AILevel && NumEnemy
value = (EnemyNear, Time >= 120 || Time >= 180)

[State 132, Jumping to Standing]
type = ChangeState
trigger1 = sysvar(0) && InGuardDist
trigger1 = (!AILevel && (ifElse(!NumExplod(94646464) && !NumExplod(92468246), ifElse(P2dist x < 0, command = "holdfwd", command = "holdback"), ifElse(P2dist x < 0, command = "holdback", command = "holdfwd")))) || AILevel
value = 130

[State 132, Change to Falling]
type = ChangeState
trigger1 = sysvar(0)
value = 52

[State 132, Stop Guarding]
type = ChangeState
trigger1 = !AILevel && (ifElse(!NumExplod(94646464) && !NumExplod(92468246), ifElse(P2dist x < 0, command != "holdfwd", command != "holdback"), ifElse(P2dist x < 0, command != "holdback", command != "holdfwd")))
trigger2 = !InGuardDist
trigger3 = AILevel && NumEnemy
trigger3 = EnemyNear, HitDefAttr = SCA, AT
value = 140


;Guard End
[StateDef 140]
type = U
physics = U
ctrl = 1

[State 140, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 140 + (StateType = C) + (StateType = A) * 2

[State 140, StateTypeSet: Standing]
type = StateTypeSet
trigger1 = !Time && StateType = S
physics = S

[State 140, StateTypeSet: Crouching]
type = StateTypeSet
trigger1 = !Time && StateType = C
physics = C

[State 140, StateTypeSet: Jumping]
type = StateTypeSet
trigger1 = !Time && StateType = A
physics = A

[State 140, Standing to Crouching]
type = StateTypeSet
trigger1 = !AILevel && StateType = S && (NumExplod(90000002) || NumExplod(90000001) || NumExplod(90000003))
trigger2 = AILevel && Random < (250 * (AILevel ** 2 / 64.0))
trigger2 = StateType = S && (EnemyNear, MoveType = A) && (EnemyNear, StateType = C)
stateType = C
physics = C

[State 140, Crouching to Standing]
type = StateTypeSet
trigger1 = !AILevel && StateType = C && (!NumExplod(90000002) && !NumExplod(90000001) && !NumExplod(90000003))
trigger2 = AILevel && Random < (125 * (AILevel ** 2 / 64.0))
trigger2 = StateType = C && (EnemyNear, MoveType = A) && (EnemyNear, StateType != C)
stateType = S
physics = S

[State 140, End]
type = ChangeState
trigger1 = !AnimTime
value = (StateType = C) * 11 + (StateType = A) * 51


;Hit while Guarding (Standing)
[StateDef 150]
type = S
movetype = H
physics = N
velSet = 0,0

[State 150, ChangeAnim]
type = ChangeAnim
trigger1 = 1
value = 150

[State 150, End]
type = ChangeState
trigger1 = HitShakeOver
value = 151 + 2 * ((!AILevel && (NumExplod(90000002) || NumExplod(90000001) || NumExplod(90000003))) || (AILevel && (EnemyNear, MoveType = A) && (EnemyNear, StateType = C)))

[State 150, Standing to Crouching]
type = StateTypeSet
trigger1 = !AILevel && StateType = S && (NumExplod(90000002) || NumExplod(90000001) || NumExplod(90000003))
trigger2 = AILevel && Random < (250 * (AILevel ** 2 / 64.0))
stateType = C
physics = C

[State 150, Crouching to Standing]
type = StateTypeSet
trigger1 = !AILevel && StateType = C && (!NumExplod(90000002) && !NumExplod(90000001) && !NumExplod(90000003))
trigger2 = AIlevel && Random < (125 * (AILevel ** 2 / 64.0))
trigger2 = StateType = C && (EnemyNear, MoveType = A) && (EnemyNear, StateType != C)
stateType = S
physics = S


;Knocked Back while Guarding (Standing)
[StateDef 151]
type = S
moveType = H
physics = S
anim = 150

[State 151, HitVelSet]
type = HitVelSet
trigger1 = !Time
x = 1

[State 151, VelSet]
type = VelSet
trigger1 = Time = GetHitVar(SlideTime)
trigger2 = HitOver
x = 0

[State 151, CtrlSet]
type = CtrlSet
trigger1 = time = GetHitVar(CtrlTime)
value = 1

[State 151, Standing to Crouching]
type = StateTypeSet
trigger1 = !AILevel && StateType = S && (NumExplod(90000002) || NumExplod(90000001) || NumExplod(90000003))
trigger2 = AILevel && Random < (250 * (AILevel ** 2 / 64.0))
trigger2 = StateType = S && (EnemyNear, MoveType = A) && (EnemyNear, StateType = C)
stateType = C
physics = C

[State 151, Crouching to Standing]
type = StateTypeSet
trigger1 = !AILevel && StateType = C && (!NumExplod(90000002) && !NumExplod(90000001) && !NumExplod(90000003))
trigger2 = AILevel && Random < (125 * (AILevel ** 2 / 64.0))
trigger2 = StateType = C && (EnemyNear, MoveType = A) && (EnemyNear, StateType != C)
stateType = S
physics = S

[State 151, End]
type = ChangeState
trigger1 = HitOver
value = 130
ctrl = 1


;Hit while Guarding (Crouching)
[StateDef 152]
type = C
moveType = H
physics = N
velSet = 0,0

[State 152, ChangeAnim]
type = ChangeAnim
trigger1 = 1
value = 151

[State 152, End]
type = ChangeState
trigger1 = HitShakeOver
value = 151 + 2 * ((!AILevel && ((!NumExplod(92828282) && !NumExplod(92468246) && command = "holddown") || ((NumExplod(92828282) || NumExplod(92468246)) && command = "holdup"))) || (AILevel && (EnemyNear, MoveType = A) && (EnemyNear, StateType = C)))

[State 152, Standing to Crouching]
type = StateTypeSet
trigger1 = !NumExplod(92828282) && !NumExplod(92468246)
trigger1 = !AILevel && StateType = S && command = "holddown"
trigger2 = NumExplod(92828282) || NumExplod(92468246)
trigger2 = !AILevel && StateType = S && command = "holdup"
trigger3 = AILevel && Random < (250 * (AILevel ** 2 / 64.0))
trigger3 = StateType = S && (EnemyNear, MoveType = A) && (EnemyNear, StateType = C)
stateType = C
physics = C

[State 152, Crouching to Standing]
type = StateTypeSet
trigger1 = !NumExplod(92828282) && !NumExplod(92468246)
trigger1 = !AILevel && StateType = C && command != "holddown"
trigger2 = NumExplod(92828282) || NumExplod(92468246)
trigger2 = !AILevel && StateType = C && command != "holdup"
trigger3 = AILevel && Random < (125 * (AILevel ** 2 / 64.0))
trigger3 = StateType = C && (EnemyNear, MoveType = A) && (EnemyNear, StateType != C)
stateType = S
physics = S


;Knocked Back while Guarding (Crouching)
[StateDef 153]
type = C
moveType = H
physics = C
anim = 151

[State 153, HitVelSet]
type = HitVelSet
trigger1 = !Time
x = 1

[State 153, VelSet]
type = VelSet
trigger1 = Time = GetHitVar(SlideTime)
trigger2 = HitOver
x = 0

[State 153, CtrlSet]
type = CtrlSet
trigger1 = Time = GetHitVar(CtrlTime)
value = 1

[State 153, Standing to Crouching]
type = StateTypeSet
trigger1 = !NumExplod(92828282) && !NumExplod(92468246)
trigger1 = !AILevel && StateType = S && command = "holddown"
trigger2 = NumExplod(92828282) || NumExplod(92468246)
trigger2 = !AILevel && StateType = S && command = "holdup"
trigger3 = AILevel && Random < (250 * (AILevel ** 2 / 64.0))
trigger3 = StateType = S && (EnemyNear, MoveType = A) && (EnemyNear, StateType = C)
stateType = C
physics = C

[State 153, Crouching to Standing]
type = StateTypeSet
trigger1 = !NumExplod(92828282) && !NumExplod(92468246)
trigger1 = !AILevel && StateType = C && command != "holddown"
trigger2 = NumExplod(92828282) || NumExplod(92468246)
trigger2 = !AILevel && StateType = C && command != "holdup"
trigger3 = AILevel && Random < (125 * (AILevel ** 2 / 64.0))
trigger3 = StateType = C && (EnemyNear, MoveType = A) && (EnemyNear, StateType != C)
stateType = S
physics = S

[State 153, End]
type = ChangeState
trigger1 = HitOver
value = 131
ctrl = 1


;Hit while Guarding (Jumping)
[StateDef 154]
type = A
moveType = H
physics = N
velSet = 0,0

[State 154, ChangeAnim]
type = ChangeAnim
trigger1 = 1
value = 152

[State 154, End]
type = ChangeState
trigger1 = HitShakeOver
value = 155


;Knocked Back while Guarding (Jumping)
[StateDef 155]
type = A
moveType = H
physics = N
anim = 152

[State 155, HitVelSet]
type = HitVelSet
trigger1 = !Time
x = 1
y = 1

[State 155, VelAdd]
type = VelAdd
trigger1 = Time > 0
y = const(movement.yAccel)

[State 155, CtrlSet]
type = CtrlSet
trigger1 = Time = GetHitVar(CtrlTime)
value = 1

[State 155, VarSet]
type = VarSet
trigger1 = 1
sysvar(0) = (pos y >= 0 && vel y > 0)

[State 155, VelSet]
type = VelSet
trigger1 = sysvar(0)
y = 0

[State 155, PosSet]
type = PosSet
trigger1 = sysvar(0)
y = 0

[State 155, End]
type = ChangeState
trigger1 = sysvar(0) && InGuardDist
trigger1 = (!AILevel && (ifElse(!NumExplod(94646464) && !NumExplod(92468246), ifElse(P2dist x < 0, command != "holdfwd", command != "holdback"), ifElse(P2dist x < 0, command != "holdback", command != "holdfwd")))) || AILevel
value = 130

[State 155, End]
type = ChangeState
trigger1 = sysvar(0)
value = 52



;====================<LOSE>====================
[StateDef 170]
type = S
ctrl = 0
anim = ifElse(var(40) = 1, 172, 170)
velSet = 0,0

[State 170, Assert: RoundNotOver]
type = AssertSpecial
trigger1 = Time < 200
flag = RoundNotOver



;====================<DRAW GAME>====================
[StateDef 175]
type = S
ctrl = 0
velSet = 0,0

[State 175, ChangeState]
type = ChangeState
trigger1 = !Time
value = 170



;====================<CONTINUE?>====================
[StateDef 5500]
type = S
anim = 5300
velSet = 0,0
ctrl = 0

[State 5500, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(40) = 1, 5501, 5500)



;====================<INITIALIZE (PART 2)>====================
[StateDef 5901]
type = S

[State 5901, Intro vs Terry Bogard]
type = ChangeState
triggerAll = var(40) != 1
triggerAll = NumEnemy && !(TeamMode = Simul)
triggerAll = RoundNo = 1 || ((!(Enemy, RoundsExisted) || !RoundsExisted) && !(Enemy, TeamMode = Simul))
trigger1 = Enemy, AuthorName = "vyn" && Enemy, Name = "Terry"
trigger2 = Enemy, AuthorName = "QB" && Enemy, Name = "Terry Bogard"
trigger3 = Enemy, AuthorName = "KarmaCharmeleon" && Enemy, Name = "Terry Bogard"
value = 199

[State 5901, Simul Intro with Ryu]
type = ChangeState
trigger1 = var(40) != 1
trigger1 = NumEnemy && RoundNo = 1
trigger1 = TeamMode = Simul && NumPartner
trigger1 = Partner, AuthorName = "Phantom.of.the.Server" && Partner, Name = "Ryu" && (Partner, var(1) != 2)
value = 6910

[State 5901, Intro vs Ryu (P2 side)]
type = ChangeState
triggerAll = var(40) != 1
triggerAll = NumEnemy && !(TeamMode = Simul) && !(Enemy, TeamMode = Simul)
triggerAll = RoundNo = 1 || (!(Enemy, RoundsExisted) || !RoundsExisted)
trigger1 = Enemy, AuthorName = "Phantom.of.the.Server" && Enemy, Name = "Ryu" && (Enemy, var(1) != 2)
trigger1 = Enemy, StateNo = [192,193]
value = ifElse(Enemy, StateNo = 192, 6800, 6801)

[State 5901, Intro vs Ryu (P1 side)]
type = ChangeState
triggerAll = var(40) != 1
triggerAll = NumEnemy && !(TeamMode = Simul) && !(Enemy, TeamMode = Simul)
triggerAll = RoundNo = 1 || (!(Enemy, RoundsExisted) || !RoundsExisted)
trigger1 = Enemy, AuthorName = "Phantom.of.the.Server" && Enemy, Name = "Ryu" && (Enemy, var(1) != 2)
value = 6800 + Random % 2

[State 5901, Intro vs Sean]
type = ChangeState
triggerAll = var(40) != 1
triggerAll = NumEnemy && !(TeamMode = Simul) && !(Enemy, TeamMode = Simul)
triggerAll = RoundNo = 1 || (!(Enemy, RoundsExisted) || !RoundsExisted)
trigger1 = Enemy, AuthorName = "Victorys" && Enemy, Name = "Sean Matsuda"
value = 6800

[State 5901, Intro vs Sean]
type = ChangeState
triggerAll = var(40) != 1
triggerAll = NumEnemy && !(TeamMode = Simul) && !(Enemy, TeamMode = Simul)
triggerAll = RoundNo = 1 || (!(Enemy, RoundsExisted) || !RoundsExisted)
trigger1 = Enemy, AuthorName = "Phantom.of.the.Server" && Enemy, Name = "Ryu" && (Enemy, var(1) != 2)
trigger1 = Enemy, StateNo = [192,193]
value = ifElse(Enemy, StateNo = 192, 6800, 6801)

[State 5901, Intro vs Robert Garcia]
type = ChangeState
triggerAll = var(40) != 1
triggerAll = NumEnemy
triggerAll = RoundNo = 1 || (!RoundsExisted && !Enemy, RoundsExisted && !(TeamMode = Simul) && !(Enemy, TeamMode = Simul))
trigger1 = Enemy, AuthorName = "DGO&DivineWolf" && Enemy, Name = "Robert Garcia"
trigger2 = Enemy, Name = "Robert" && Enemy, AuthorName = "Chazzanova"
value = 6802

[State 5901, Intro vs Violent Ken]
type = ChangeState
triggerAll = var(40) != 1
triggerAll = NumEnemy && !(TeamMode = Simul) && !(Enemy, TeamMode = Simul)
triggerAll = RoundNo = 1 || (((!(Enemy, RoundsExisted) || !RoundsExisted) && !(TeamMode = Simul) && !(Enemy, TeamMode = Simul)))
trigger1 = Enemy, AuthorName = "Jmorphman" && Enemy, Name = "Ken Masters"
value = 6803

[State 5901, Violent Intro vs Ryu]
type = ChangeState
triggerAll = var(40) = 1
triggerAll = NumEnemy && !(TeamMode = Simul) && !(Enemy, TeamMode = Simul)
triggerAll = RoundNo = 1 || (((!(Enemy, RoundsExisted) || !RoundsExisted) && !(TeamMode = Simul) && !(Enemy, TeamMode = Simul)))
trigger1 = Enemy, AuthorName = "Phantom.of.the.Server" && Enemy, Name = "Ryu" && (Enemy, var(1) != 2)
value = 6805

[State 5901, Violent Intro vs Ken]
type = ChangeState
triggerAll = var(40) = 1
triggerAll = NumEnemy && !(TeamMode = Simul) && !(Enemy, TeamMode = Simul)
triggerAll = RoundNo = 1 || (((!(Enemy, RoundsExisted) || !RoundsExisted) && !(TeamMode = Simul) && !(Enemy, TeamMode = Simul)))
trigger1 = Enemy, AuthorName = "Jmorphman" && Enemy, Name = "Ken Masters"
value = 6806

[State 5901, vs Intro vs M. Bison/Vega (Violent)]
type = ChangeState
triggerAll = var(40) = 1
triggerAll = NumEnemy
triggerAll = RoundNo = 1 || (((!(Enemy, RoundsExisted) || !RoundsExisted) && !(TeamMode = Simul) && !(Enemy, TeamMode = Simul)))
trigger1 = Enemy, Name = "M. Bison" || Enemy, Name = "cvsvega" || Enemy, Name = "cvsvega_normal" || Enemy, Name = "cvsvega_ex" || (Enemy, Name = "Vega" && (Enemy, AuthorName = "Phantom.of.the.Server" || Enemy, AuthorName = "Froz")) || Enemy, Name = "M.Bison" || Enemy, Name = "Bison" || Enemy, Name = "Bison Bison"
value = 6807

[State 5901, Violent Intro vs Evil Ryu]
type = ChangeState
triggerAll = var(40) = 1
triggerAll = NumEnemy
triggerAll = RoundNo = 1 || (!RoundsExisted && !Enemy, RoundsExisted && !(TeamMode = Simul) && !(Enemy, TeamMode = Simul))
trigger1 = Enemy, AuthorName = "Phantom.of.the.Server" && Enemy, Name = "Ryu" && (Enemy, var(1) = 2)
value = 6808

[State 5901, Violent Intro vs Akuma]
type = ChangeState
triggerAll = var(40) = 1
triggerAll = NumEnemy && !(TeamMode = Simul) && !(Enemy, TeamMode = Simul)
triggerAll = RoundNo = 1 || (!RoundsExisted && !Enemy, RoundsExisted)
trigger1 = Enemy, AuthorName = "DivineWolf" && Enemy, Name = "Akuma"
value = 6809

[State 5901, Master Intro vs Guile]
type = ChangeState
triggerAll = var(40) = 2
triggerAll = NumEnemy
triggerAll = RoundNo = 1 || (((!(Enemy, RoundsExisted) || !RoundsExisted) && !(TeamMode = Simul) && !(Enemy, TeamMode = Simul)))
trigger1 = Enemy, AuthorName = "Jmorphman" && Enemy, Name = "Guile"
value = 6810

[State 5901, Turns Intro]
type = ChangeState
trigger1 = TeamMode = Turns
trigger1 = !RoundsExisted && RoundNo >= 2
value = 6900

[State 5901, Intro Decider]
type = ChangeState
trigger1 = RoundNo = 1
value = ifElse(var(40) = 1, 6804, ifElse(Enemy, Name = "Eliza Masters", 193, ifElse(var(40) = 2, 191, ifElse(var(40) = 3, ifElse(Random < 250, 190, 192 + Random % 2), 190 + Random % 5))))

[State 5901, End]
type = ChangeState
trigger1 = 1
value = 0



;====================<INTRO 1>====================
[StateDef 190]
type = S
physics = S
anim = 190

[State 190, Assert: Intro]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 190, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 190, Random % 2
channel = 0

[State 190, End]
type = ChangeState
trigger1 = !AnimTime
value = 0



;====================<INTRO 2>====================
[StateDef 191]
type = S
physics = S
anim = 191

[State 191, Assert: Intro]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 191, LP Woosh]
type = PlaySnd
trigger1 = AnimElem = 9
trigger2 = AnimElem = 12
value = 1,0

[State 191, HP Woosh]
type = PlaySnd
trigger1 = AnimElem = 17
value = 1,2

[State 191, End]
type = ChangeState
trigger1 = !AnimTime
value = 0



;====================<INTRO 3>====================
[StateDef 192]
type = S
physics = S
anim = 192

[State 192, Assert: Intro]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 192, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 192,0
channel = 0

[State 192, End]
type = ChangeState
trigger1 = !AnimTime
value = 0



;====================<INTRO 4>====================
[StateDef 193]
type = S
physics = S
anim = 193

[State 193, Assert: Intro]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 193, Voice]
type = PlaySnd
trigger1 = AnimElem = 11
value = 193,0
channel = 0

[State 193, Whoosh Sound]
type = PlaySnd
trigger1 = AnimElem = 8
value = 1,0

[State 193, End]
type = ChangeState
trigger1 = !AnimTime
trigger2 = AnimElem = 18 && var(40) = 3
value = 0



;====================<INTRO 5>====================
[StateDef 194]
type = S
physics = S
anim = 194

[State 194, Assert: Intro]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 194, End]
type = ChangeState
trigger1 = !AnimTime
trigger2 = AnimElem = 9 && var(40) = 3
value = 0



;====================<INTRO VS TERRY BOGARD>====================
[StateDef 199]
type = S
physics = S
anim = 199
sprPriority = 3

[State 199, Assert: Intro]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 199, Voice]
type = PlaySnd
trigger1 = AnimElem = 6
value = 199,0
channel = 0

[State 199, SprPriority]
type = SprPriority
trigger1 = AnimElem = 3
value = 1

[State 199, End]
type = ChangeState
trigger1 = !AnimTime
value = 0



;====================<INTRO VS RYU (FIST BUMP)>====================
[StateDef 6800]
type = S
physics = N
anim = 6800

[State 6800, Change to Regular Intro]
type = PosAdd
trigger1 = Enemy, AuthorName = "Phantom.of.the.Server" && Enemy, Name = "Ryu" && (Enemy, var(1) = 2)
x = -(var(10) - 114.5)

[State 6800, Change to Regular Intro]
type = ChangeState
trigger1 = Enemy, AuthorName = "Phantom.of.the.Server" && Enemy, Name = "Ryu" && (Enemy, var(1) = 2)
value = 5901

[State 6800, Assert: Intro]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 6800, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 0,0
ignoreHitPause = 1

[State 6800, Camera Helper]
type = Helper
trigger1 = !NumHelper(8999)
helpertype = Normal
stateNo = 8999
ID = 8999
name = "Camera"
posType = P1

[State 6800, VarSet]
type = VarSet
trigger1 = !Time
var(10) = ceil(P2dist X)

[State 6800, PosAdd]
type = PosAdd
trigger1 = !Time
;320x240
;x = P2Dist x - 114
;640x480
x = P2Dist x - 114.5
;1280x720
;x = P2Dist x - 114.75

[State 6800, Voice]
type = PlaySnd
trigger1 = AnimElem = 9
value = 6800,0
channel = 0

[State 6800, Fist bump sound]
type = PlaySnd
trigger1 = AnimElem = 7
value = 100,1
channel = 1

[State 6800, Back Dash Sound]
type = PlaySnd
trigger1 = AnimElem = 10
value = 105,0

[State 6800, Dust Helper]
type = Helper
trigger1 = AnimElem = 10
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
facing = -1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 6800, VelSet]
type = VelSet
trigger1 = AnimElem = 10
x = -(var(10) - 114.5)/17

[State 6800, VelSet]
type = VelSet
trigger1 = AnimElem = 12
x = 0

[State 6800, Landing Sound]
type = PlaySnd
trigger1 = AnimElem = 12
value = 100,1

[State 6800, Landing Dust Explod]
type = Explod
trigger1 = AnimElem = 12
anim = 8102
sprpriority = -3
postype = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 6800, End]
type = ChangeState
trigger1 = !AnimTime
value = 0



;====================<INTRO VS RYU (NOOGIE)>====================
[StateDef 6801]
type = S
physics = N
anim = 6801

[State 6801, Change to Regular Intro]
type = PosSet
trigger1 = Enemy, AuthorName = "Phantom.of.the.Server" && Enemy, Name = "Ryu" && (Enemy, var(1) = 2)
x = Helper(8999), pos x

[State 6801, Change to Regular Intro]
type = ChangeState
trigger1 = Enemy, AuthorName = "Phantom.of.the.Server" && Enemy, Name = "Ryu" && (Enemy, var(1) = 2)
value = 5901

[State 6801, Assert: Intro]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 6801, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 0,0
ignoreHitPause = 1

[State 6801, Camera Helper]
type = Helper
trigger1 = !NumHelper(8999)
helpertype = Normal
stateNo = 8999
ID = 8999
name = "Camera"
posType = P1

[State 6801, Voice]
type = PlaySnd
trigger1 = Time = 1
value = 6801,0
channel = 0

[State 6801, PosAdd]
type = PosAdd
trigger1 = !Time
;320x240
;x = P2Dist x - 33
;640x480
x = P2Dist x - 33.5
;1280x720
;x = P2Dist x - 33.75

[State 6801, TargetBind]
type = PosAdd
trigger1 = Anim = 6801
trigger1 = AnimElem = 13
x = P2Dist x - 30

[State 6801, TargetBind]
type = PosAdd
trigger1 = Anim = 6801
trigger1 = AnimElem = 14
x = P2Dist x - 15

[State 6801, SprPriority]
type = SprPriority
trigger1 = Anim = 6801
trigger1 = AnimElem = 14
value = 2

[State 6801, SprPriority]
type = SprPriority
trigger1 = Anim = 6801
trigger1 = AnimElem = 17
value = -1

[State 6801, TargetBind]
type = PosAdd
trigger1 = Anim = 6801
trigger1 = AnimElem = 15
x = P2Dist x

[State 6801, TargetBind]
type = PosAdd
triggerAll = Anim = 6801
trigger1 = AnimElem = 16
trigger2 = AnimElem = 17
x = 15

[State 6801, TargetBind]
type = PosAdd
trigger1 = Anim = 6801
trigger1 = AnimElem = 18
x = -20
y = -5

[State 6801, TargetBind]
type = PosAdd
trigger1 = Anim = 6801
trigger1 = AnimElem = 19
x = -2
y = -110.0

[State 6801, SprPriority]
type = SprPriority
trigger1 = Anim = 6801
trigger1 = AnimElem = 19
value = 2

[State 6801, SprPriority]
type = SprPriority
trigger1 = Anim = 6801
trigger1 = AnimElem = 20
value = -1

[State 6801, TargetBind]
type = PosAdd
trigger1 = Anim = 6801
trigger1 = AnimElem = 20
x = -73
y = 45

[State 6801, TargetBind]
type = PosAdd
trigger1 = Anim = 6801
trigger1 = AnimElem = 21
x = -32
y = 13

[State 6801, TargetBind]
type = PosAdd
trigger1 = Anim = 6801
trigger1 = AnimElem = 22
x = -19
y = 1

[State 6801, VelSet]
type = VelSet
trigger1 = Anim = 6801
trigger1 = AnimElemTime(22) = 2
x = -(abs((Helper(8999), pos x - pos x)) / 30)
y = -5.78125 - 0.5126953125/2

[State 6801, VelAdd]
type = VelAdd
trigger1 = Anim = 6801
trigger1 = AnimElemTime(22) > 2
y = 0.5126953125

[State 6801, PosAdd]
type = PosAdd
trigger1 = Anim = 6801
trigger1 = AnimElem = 23
y = 20

[State 6801, ChangeAnim]
type = ChangeAnim
trigger1 = Anim = 6801
trigger1 = pos y > -vel y
value = 47

[State 6801, VelSet]
type = VelSet
trigger1 = Anim = 47
trigger1 = AnimElem = 1
x = 0
y = 0

[State 6801, PosSet]
type = PosSet
trigger1 = Anim = 47
trigger1 = AnimElem = 1
x = Helper(8999), pos x
y = 0

[State 6801, Landing Dust Explod]
type = Explod
trigger1 = Anim = 47
trigger1 = AnimElem = 1
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 6801, Landing Sound]
type = PlaySnd
trigger1 = Anim = 47
trigger1 = AnimElem = 1
value = 52,0
channel = 1

[State 6801, ChangeAnim]
type = ChangeAnim
trigger1 = Anim = 47
trigger1 = !AnimTime
value = 191
elem = 6

[State 6801, LP Woosh]
type = PlaySnd
triggerAll = Anim = 191
trigger1 = AnimElem = 9
trigger2 = AnimElem = 12
value = 1,0

[State 6801, HP Woosh]
type = PlaySnd
trigger1 = Anim = 191
trigger1 = AnimElem = 17
value = 1,2

[State 6801, End]
type = ChangeState
trigger1 = Anim = 191
trigger1 = !AnimTime
value = 0



;====================<INTRO VS ROBERT GARCIA>====================
[StateDef 6802]
type = S
physics = S
anim = 6802

[State 6802, Assert: Intro]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 6802, Woosh Sound 1]
type = PlaySnd
trigger1 = AnimElem = 8
value = 1,5
channel = 1

[State 6802, Woosh Sound 2]
type = PlaySnd
trigger1 = AnimElem = 17
value = 1,3
channel = 1

[State 6802, Woosh Sound 3]
type = PlaySnd
trigger1 = AnimElem = 29
value = 1,4
channel = 1

[State 6802, Hit Sound 1]
type = PlaySnd
trigger1 = AnimElem = 9
value = 2,4
channel = 2

[State 6802, Hit Sound 2]
type = PlaySnd
trigger1 = AnimElem = 18
value = 2,3
channel = 2

[State 6802, Hit Sound 3]
type = PlaySnd
trigger1 = AnimElem = 29
value = 2,5
channel = 2

[State 6802, Voice]
type = PlaySnd
trigger1 = AnimElem = 39
value = 6800,0
channel = 0

[State 6802, HitSpark 1]
type = Helper
trigger1 = AnimElem = 9
helperType = Normal
stateNo = 8011
ID = 8000
name = "Spark"
posType = P1
pos = 75,-70
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 6802, HitSpark 2]
type = Helper
trigger1 = AnimElem = 18
helperType = Normal
stateNo = 8010
ID = 8000
name = "Spark"
posType = P1
pos = 70,-25
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 6802, HitSpark 3]
type = Helper
trigger1 = AnimElem = 29
helperType = Normal
stateNo = 8012
ID = 8000
name = "Spark"
posType = P1
pos = 100,-105
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 6802, End]
type = ChangeState
trigger1 = !AnimTime
value = 0



;====================<INTRO VS VIOLENT KEN>====================
[StateDef 6803]
type = S
physics = N
anim = 6803

[State 6803, Change to Regular Intro]
type = ChangeState
trigger1 = Time > 0
trigger1 = Enemy, AuthorName = "Jmorphman" && Enemy, Name = "Ken Masters" && Enemy, var(40) != 1
value = ifElse(var(40) = 1, 6804, ifElse(Enemy, Name = "Eliza Masters", 193, ifElse(var(40) = 2, 191, ifElse(var(40) = 3, ifElse(Random < 250, 190, 192 + Random % 2), 190 + Random % 5))))

[State 6803, Assert: Intro]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 6803, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 0,0
ignoreHitPause = 1

[State 6803, Camera Helper]
type = Helper
trigger1 = !NumHelper(8999)
helpertype = Normal
stateNo = 8999
ID = 8999
name = "Camera"
posType = P1

[State 6803, Voice]
type = PlaySnd
trigger1 = AnimElem = 6
value = 1300,0
channel = 0

[State 6803, Jumping Sound]
type = PlaySnd
trigger1 = AnimElem = 6
value = 40,0
channel = 1

[State 6803, Woosh sound]
type = PlaySnd
trigger1 = AnimElem = 11
value = 1,5
channel = 3

[State 6803, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 6
stateType = A
physics = N

[State 6803, Dust Helper]
type = Helper
trigger1 = AnimElem = 6
helperType = Normal
stateNo = 8103
ID = 8100
name = "Ryusenkyaku Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 6803, VelSet]
type = VelSet
trigger1 = AnimElem = 8
x = 4.375
y = -11.25

[State 6803, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(8) > 0 && AnimElemTime(13) < 0
y = 0.78125

[State 6803, PosSet]
type = PosSet
trigger1 = AnimElem = 13
y = 0

[State 6803, VelSet]
type = VelSet
trigger1 = AnimElem = 13
x = 0
y = 0

[State 6803, Impact Dust]
type = Explod
trigger1 = AnimElem = 13
anim = 8105
sprPriority = -3
posType = P1
scale = 0.325,0.325
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 6803, Impact Sound]
type = PlaySnd
trigger1 = AnimElem = 13
value = 1300,1
channel = 1

[State 6803, Voice]
type = PlaySnd
trigger1 = AnimElem = 20
value = 4,3
channel = 0

[State 6803, Roll Sound]
type = PlaySnd
trigger1 = AnimElem = 20
value = 110,0
channel = 1

[State 6803, VelSet]
type = VelSet
trigger1 = AnimElem = 20
x = -(abs((Helper(8999), pos x - pos x)) / 29)

[State 6803, VelSet]
type = VelSet
trigger1 = AnimElem = 31
x = 0

[State 6803, PosSet]
type = PosSet
trigger1 = AnimElem = 31
x = Helper(8999), pos x

[State 6803, End]
type = ChangeState
trigger1 = !AnimTime
value = 0



;====================<VIOLENT INTRO>====================
[StateDef 6804]
type = S
physics = S
anim = 6804

[State 6804, Assert: Intro]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 6804, Voice]
type = PlaySnd
trigger1 = AnimElemTime(1) = 18
value = 6804,0
channel = 0

[State 6804, End]
type = ChangeState
trigger1 = !AnimTime
value = 0



;====================<VIOLENT INTRO VS RYU>====================
[StateDef 6805]
type = S
physics = S
anim = 6805

[State 6805, Change to Regular Intro]
type = ChangeState
trigger1 = Enemy, AuthorName = "Phantom.of.the.Server" && Enemy, Name = "Ryu" && (Enemy, var(1) = 2)
value = 5901

[State 6805, Assert: Intro]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 6805, Shadaloo Gunship]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 26805
ID = 26805
name = "Shadaloo Gunship"
posType = P1
ownPal = 1

[State 6805, Cape]
type = Helper
trigger1 = AnimElem = 44
helperType = Normal
stateNo = 16805
ID = 16805
name = "Cape"
posType = P1
ownPal = 1

[State 6805, Gunship Sound]
type = PlaySnd
trigger1 = Time = 5
value = 6805,0
channel = 5
loop = 1

[State 6805, Cape Sound]
type = PlaySnd
trigger1 = AnimElem = 41
value = 6805,2
channel = 1

[State 6805, End]
type = ChangeState
trigger1 = !AnimTime
value = 0



;====================<VIOLENT INTRO VS KEN>====================
[StateDef 6806]
type = S
physics = N
anim = 6806

[State 6806, Change to Regular Intro]
type = ChangeState
trigger1 = Time > 0
trigger1 = Enemy, AuthorName = "Jmorphman" && Enemy, Name = "Ken Masters" && Enemy, var(40) = 1
value = ifElse(var(40) = 1, 6804, ifElse(Enemy, Name = "Eliza Masters", 193, ifElse(var(40) = 2, 191, ifElse(var(40) = 3, ifElse(Random < 250, 190, 192 + Random % 2), 190 + Random % 5))))

[State 6806, Assert: Intro]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 6806, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 0,0
ignoreHitPause = 1

[State 6806, Camera Helper]
type = Helper
trigger1 = !NumHelper(8999)
helpertype = Normal
stateNo = 8999
ID = 8999
name = "Camera"
posType = P1

[State 6806, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 198,0
channel = 0

[State 6806, Voice]
type = PlaySnd
trigger1 = AnimElem = 5
value = 1600,0
channel = 0

[State 6806, Rasetsukyaku sound effect]
type = PlaySnd
trigger1 = AnimElem = 5
value = 1600,1
channel = 1

[State 6806, Rasetsukyaku Fade Away]
type = Helper
trigger1 = AnimElem = 7
helperType = Normal
stateNo = 1605
ID = 1605
name = "Rasetsukyaku Fade Away"
posType = P1
ownPal = 1

[State 6806, VelSet]
type = VelSet
trigger1 = AnimElem = 7
x = 11

[State 6806, VelMul]
type = VelMul
trigger1 = AnimElemTime(9) > 0 && AnimElemTime(11) < 0
x = 0.8671875023712158

[State 6806, VelSet]
type = VelSet
trigger1 = AnimElem = 11
x = 0

[State 6806, Movement AfterImage]
type = AfterImage
trigger1 = AnimElem = 8
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

[State 6806, AfterImage Off]
type = AfterImage
trigger1 = AnimElem = 10
time = 0
length = 1

[State 6806, Voice]
type = PlaySnd
trigger1 = AnimElem = 15
value = 1100,10
channel = 0

[State 6806, Woosh sound]
type = PlaySnd
trigger1 = AnimElem = 16
value = 1,2
channel = 1

[State 6806, Fire sound]
type = PlaySnd
trigger1 = AnimElem = 18
value = 1100,1
channel = 3

[State 6806, Jump Sound]
type = PlaySnd
trigger1 = AnimElemTime(18) = 1
value = 40,0
channel = 4

[State 6806, Fist Overlay]
type = Explod
trigger1 = AnimElem = 17
anim = 1124
bindTime = -1
sprPriority = 2
facing = -1
posType = P1
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 6806, Shoryuken Flames (Ground)]
type = Explod
trigger1 = AnimElem = 15
anim = 1125
bindTime = 7
sprPriority = 3
posType = P1
facing = -1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 6806, Shoryuken Flames (Ascending)]
type = Explod
trigger1 = AnimElem = 18
anim = 1126
bindTime = -1
removeTime = 21
sprPriority = 3
posType = P1
facing = -1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 6806, Shoryuken Flames (Fade away)]
type = Explod
trigger1 = AnimElem = 19
ID = 1127
anim = 1127
sprPriority = 3
posType = P1
facing = -1
scale = 0.5,0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 6806, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 18
stateType = A
physics = N

[State 6806, Dust Helper]
type = Helper
trigger1 = AnimElemTime(18) = 1
helperType = Normal
stateNo = 8100
ID = 8100
name = "Shoryuken Dust"
posType = P1
ownPal = 1

[State 6806, VelSet]
type = VelSet
trigger1 = AnimElemTime(18) = 2
x = -(abs((Helper(8999), pos x - pos x)) / 9)
y = -12.5

[State 6806, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(18) > 2 && vel x <= 0
x = 0.78125

[State 6806, VelSet]
type = VelSet
trigger1 = AnimElemTime(18) > 2
trigger1 = vel x > 0
x = 0

[State 6806, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(18) > 2 && AnimElemTime(28) < 0
y = 0.5859375

[State 6806, VelSet]
type = VelSet
trigger1 = AnimElem = 28
x = 0
y = 0

[State 6806, PosSet]
type = PosSet
trigger1 = AnimElem = 28
x = Helper(8999), pos x
y = 0

[State 6806, Landing Dust Explod]
type = Explod
trigger1 = AnimElem = 28
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 6806, Landing Sound]
type = PlaySnd
trigger1 = AnimElem = 28
value = 52,0
channel = 1

[State 6806, End]
type = ChangeState
trigger1 = !AnimTime
value = 0



;====================<VIOLENT INTRO VS M.BISON/VEGA>====================
[StateDef 6807]
type = S
physics = S
anim = 6807

[State 6807, Assert: Intro]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 6807, Pause]
type = Pause
trigger1 = StageVar(info.name) != "YDA_CVS-Shadaloo-HQ(Purple_Fire)" && StageVar(info.name) != "YDA_CVS-Shadaloo-HQ(Extended version)"
trigger1 = Time < 402 && (Enemy, Name = "Vega" && (Enemy, AuthorName = "Phantom.of.the.Server" || Enemy, AuthorName = "Froz"))
time = 2
movetime = 2

[State 6807, AssertSpecial: NoMusic]
type = AssertSpecial
trigger1 = Time < 402 && (Enemy, Name = "Vega" && (Enemy, AuthorName = "Phantom.of.the.Server" || Enemy, AuthorName = "Froz"))
trigger2 = Time < 120
flag = NoMusic

[State 6807, Heartbeat Sound]
type = PlaySnd
trigger1 = !Time
value = 6807,1
channel = 5

[State 6807, StopSnd]
type = StopSnd
trigger1 = Time = 120 && !(Enemy, Name = "Vega" && (Enemy, AuthorName = "Phantom.of.the.Server" || Enemy, AuthorName = "Froz"))
channel = 5

[State 6807, ChangeAnim]
type = ChangeAnim
trigger1 = Time = 120 && !(Enemy, Name = "Vega" && (Enemy, AuthorName = "Phantom.of.the.Server" || Enemy, AuthorName = "Froz"))
value = 6807
elem = 2

[State 6807, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 6807,0
channel = 0

[State 6807, BGPalFX - invert colors, short]
type = BGPalFX
triggerAll = (Enemy, Name = "Vega" && (Enemy, AuthorName = "Phantom.of.the.Server" || Enemy, AuthorName = "Froz"))
trigger1 = Time = 149
trigger2 = Time = 199
time = 5
invertall = 1

[State 6807, BGPalFX - invert colors, long]
type = BGPalFX
triggerAll = (Enemy, Name = "Vega" && (Enemy, AuthorName = "Phantom.of.the.Server" || Enemy, AuthorName = "Froz"))
trigger1 = Time = 180
time = 7
invertall = 1

[State 6807, BGPalFX - red]
type = BGPalFX
triggerAll = (Enemy, Name = "Vega" && (Enemy, AuthorName = "Phantom.of.the.Server" || Enemy, AuthorName = "Froz"))
trigger1 = Time = 163
trigger2 = Time = 175
trigger3 = Time = 187
trigger4 = Time = 212
trigger5 = Time = 247
trigger6 = Time = 282
trigger7 = Time = 297
time = 5
add = 0,-256,-256
invertall = 1

[State 6807, BGPalFX - light blue]
type = BGPalFX
triggerAll = (Enemy, Name = "Vega" && (Enemy, AuthorName = "Phantom.of.the.Server" || Enemy, AuthorName = "Froz"))
trigger1 = Time = 223
trigger2 = Time = 237
trigger3 = Time = 257
trigger4 = Time = 267
trigger5 = Time = 277
trigger6 = Time = 302
time = ifElse(Time = 302, 10, 5)
add = 0,96,256

[State 6807, BGPalFX - black screen]
type = BGPalFX
triggerAll = (Enemy, Name = "Vega" && (Enemy, AuthorName = "Phantom.of.the.Server" || Enemy, AuthorName = "Froz"))
trigger1 = Time = 286
time = 11
add = -256,-256,-256

[State 6807, BGPalFX - white screen]
type = BGPalFX
triggerAll = (Enemy, Name = "Vega" && (Enemy, AuthorName = "Phantom.of.the.Server" || Enemy, AuthorName = "Froz"))
trigger1 = Time = 312
time = 10
add = 256,256,256

[State 6807, BGPalFX - white screen fade out]
type = BGPalFX
triggerAll = (Enemy, Name = "Vega" && (Enemy, AuthorName = "Phantom.of.the.Server" || Enemy, AuthorName = "Froz"))
trigger1 = Time = 322
time = 65
add = 256,256,256
sinAdd = -256, -256, -256, 256

[State 6807, End]
type = ChangeState
trigger1 = !AnimTime
value = 0



;====================<VIOLENT INTRO VS EVIL RYU>====================
[StateDef 6808]
type = S
physics = N
anim = 6808

[State 6808, Assert: Intro]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 6808, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 0,0
ignoreHitPause = 1

[State 6808, Camera Helper]
type = Helper
trigger1 = !NumHelper(8999)
helpertype = Normal
stateNo = 8999
ID = 8999
name = "Camera"
posType = P1

[State 6808, PosSet]
type = PosSet
trigger1 = !Time
x = 240 * Facing

[State 6808, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1600,0
channel = 0

[State 6808, Rasetsukyaku sound effect]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1600,1
channel = 1

[State 6808, VelSet]
type = VelSet
trigger1 = AnimElemTime(2) = 10
x = -11

[State 6808, VelMul]
type = VelMul
trigger1 = (Helper(8999), RootDist x) < 55 && vel x
x = 0.8671875023712158

[State 6808, Movement AfterImage]
type = AfterImage
trigger1 = AnimElem = 2
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

[State 6808, AfterImage Off]
type = AfterImageTime
trigger1 = AnimElemTime(7) >= 0
time = 0

[State 6808, PosSet]
type = PosSet
trigger1 = AnimElem = 13
x = Helper(8999), pos x
y = 0

[State 6808, VelSet]
type = VelSet
trigger1 = AnimElem = 13
x = 0

[State 6808, End]
type = ChangeState
trigger1 = !AnimTime
value = 0



;====================<VIOLENT INTRO VS AKUMA>====================
[StateDef 6809]
type = S
physics = S
anim = 6809

[State 6809, Assert: Intro]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 6809, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 0,0
ignoreHitPause = 1

[State 6809, Camera Helper]
type = Helper
trigger1 = !NumHelper(8999)
helpertype = Normal
stateNo = 8999
ID = 8999
name = "Camera"
posType = P1

[State 6809, Voice 1]
type = PlaySnd
trigger1 = !Time
value = 1270,0
channel = 0

[State 6809, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 33
value = 1100,10
channel = 0

[State 6809, Woosh sound]
type = PlaySnd
trigger1 = AnimElem = 34
value = 1,2
channel = 1

[State 6809, Jump Sound]
type = PlaySnd
trigger1 = AnimElemTime(36) = 1
value = 40,0
channel = 3

[State 6809, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 36
stateType = A
physics = N

[State 6809, Dust Helper]
type = Helper
trigger1 = AnimElemTime(36) = 1
helperType = Normal
stateNo = 8100
ID = 8100
name = "Shoryuken Dust"
posType = P1
ownPal = 1

[State 6809, VelSet]
type = VelSet
trigger1 = AnimElemTime(36) = 1
x = (P2Dist x - 25) / 2 / 5
y = -12.5

[State 6809, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(36) > 2 && vel x > 0
x = -0.78125

[State 6809, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(36) > 2 && AnimElemTime(36) <= 6
y = 0.5859375

[State 6809, PosFreeze]
type = PosFreeze
trigger1 = AnimElemTime(36) < 2
trigger2 = AnimElemTime(36) >= 6 && AnimElemTime(37) < 0
value = 1

[State 750, Zero Counter FX Helper]
type = Helper
trigger1 = AnimElemTime(36) = 6
helperType = Normal
stateNo = 8350
ID = 8350
name = "Zero Counter"
posType = P1
pos = 28, -100
superMoveTime = 255
ownPal = 1

[State 6809, Zero Counter Sound]
type = PlaySnd
trigger1 = AnimElemTime(36) = 6
value = 750,0
channel = 4

[State 6809, EnvShake]
type = EnvShake
trigger1 = AnimElemTime(36) = 6
time = 18
ampl = 6
freq = 120

[State 6809, VelSet]
type = VelSet
trigger1 = AnimElem = 37
x = -((Helper(8999), RootDist x))/32
y = -7

[State 6809, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(37) > 0 && AnimElemTime(44) < 0
y = 0.53

[State 6809, VelSet]
type = VelSet
trigger1 = AnimElem = 44
x = 0
y = 0

[State 6809, PosSet]
type = PosSet
trigger1 = AnimElem = 44
x = Helper(8999), pos x
y = 0

[State 6809, Landing Dust Explod]
type = Explod
trigger1 = AnimElem = 44
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 6809, Landing Sound]
type = PlaySnd
trigger1 = AnimElem = 44
value = 52,0
channel = 5

[State 6809, End]
type = ChangeState
trigger1 = !AnimTime
value = 0



;====================<MASTER INTRO VS GUILE>====================
[StateDef 6810]
type = S
physics = S
anim = 6810

[State 6810, Assert: Intro]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 6810, Voice]
type = PlaySnd
trigger1 = !Time
value = 6810, 0
channel = 0

[State 6810, End]
type = ChangeState
trigger1 = !AnimTime
value = 0



;====================<TURNS INTRO>====================
[StateDef 6900]
type = A
anim = 42
velSet = 0,0
ctrl = 0

[State 6900, Assert: Intro]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 6900, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 0,0
ignoreHitPause = 1

[State 6900, Camera Helper]
type = Helper
trigger1 = !NumHelper(8999)
helpertype = Normal
stateNo = 8999
ID = 8999
name = "Camera"
posType = P1

[State 6900, PosSet]
type = PosSet
trigger1 = !Time
x = (-320 + abs(pos x)) * Facing

[State 6900, VelSet]
type = VelSet
trigger1 = !Time
x = (Helper(8999), RootDist x) / -40.0
y = -10.25

[State 6900, VelAdd]
type = VelAdd
trigger1 = 1
y = 0.5

[State 6900, End]
type = ChangeState
trigger1 = Time
trigger1 = pos y > -vel y
value = 6901


;Landing
[StateDef 6901]
type = S
physics = S
anim = 6901 + (var(40) = 1)
velSet = 0,0

[State 6901, Assert: Intro]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 6901, PosSet]
type = PosSet
trigger1 = !Time && NumHelper(8999)
x = ceil(Helper(8999), pos x)

[State 6901, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0
channel = 3

[State 6901, Landing Dust Expod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 6901, LP Woosh]
type = PlaySnd
triggerAll = var(40) != 1
trigger1 = AnimElem = 5
trigger2 = AnimElem = 8
value = 1,0

[State 6901, HP Woosh]
type = PlaySnd
triggerAll = var(40) != 1
trigger1 = AnimElem = 12
value = 1,2

[State 6901, Voice (Violent)]
type = PlaySnd
triggerAll = var(40) = 1
trigger1 = AnimElem = 5
value = 6804,0
channel = 0

[State 6901, End]
type = ChangeState
trigger1 = !AnimTime
value = 0



;====================<SIMUL INTRO WITH RYU>====================
[StateDef 6910]
type = S
physics = S
anim = 6910

[State 6910, Change to Regular Intro]
type = ChangeState
trigger1 = Partner, AuthorName = "Phantom.of.the.Server" && Partner, Name = "Ryu" && (Partner, var(1) = 2)
value = 5901

[State 6910, Assert: Intro]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 6910, End]
type = ChangeState
trigger1 = !AnimTime
value = 0



;====================<WIN POSE DECIDER>====================
[StateDef 180]
type = S

[State 180, Generic Victory Quote (Normal/Master mode)]
type = VictoryQuote
trigger1 = var(40) != 1
value = (Random % (46 + (var(40) = 2)))

[State 180, Generic Victory Quote (Violent mode)]
type = VictoryQuote
trigger1 = var(40) = 1
value = 52 + (Random % 4)

[State 180, Victory Quote vs. Adon]
type = VictoryQuote
triggerAll = var(40) != 1
trigger1 = Enemy, Name = "Adon" || Enemy, Name = "cvsadon"
value = 58

[State 180, Victory Quote vs. Akuma]
type = VictoryQuote
triggerAll = var(40) != 1
trigger1 = Enemy, Name = "Akuma" || Enemy, Name = "cvsgouki" || Enemy, Name = "Gouki" || Enemy, Name = "Shin Akuma" || Enemy, Name = "Shin Gouki" || Enemy, Name = "ShinAkuma" || Enemy, Name = "ShinGouki" || Enemy, Name = "Pocket Shin Gouki"
value = 59

[State 180, Victory Quote vs. Adon]
type = VictoryQuote
triggerAll = var(40) != 1
trigger1 = Enemy, Name = "Alex"
value = 60

[State 180, Victory Quote vs. Balrog]
type = VictoryQuote
triggerAll = var(40) != 1
trigger1 = Enemy, Name = "Balrog" || Enemy, Name = "cvsbison"
value = 61

[State 180, Victory Quote vs. Blanka]
type = VictoryQuote
triggerAll = var(40) != 1
trigger1 = Enemy, Name = "Blanka" || Enemy, Name = "cvsblanka"
value = 62

[State 180, Victory Quote vs. Cammy]
type = VictoryQuote
triggerAll = var(40) != 1
trigger1 = Enemy, Name = "Cammy" || Enemy, Name = "cvscammy"
value = 63

[State 180, Victory Quote vs. Chun-Li]
type = VictoryQuote
triggerAll = var(40) != 1
trigger1 = Enemy, Name = "Chun-Li" || Enemy, Name = "cvschunli" || Enemy, Name = "Chun Li" || Enemy, Name = "ChunLi"
value = 64

[State 180, Victory Quote vs. Cody]
type = VictoryQuote
triggerAll = var(40) != 1
trigger1 = Enemy, Name = "Cody" || Enemy, Name = "cvscody"
value = 65

[State 180, Victory Quote vs. Dan]
type = VictoryQuote
triggerAll = var(40) != 1
trigger1 = Enemy, Name = "Dan" || Enemy, Name = "cvsdan" || Enemy, Name = "Dan Hibiki"
value = 66

[State 180, Victory Quote vs. Dee Jay]
type = VictoryQuote
triggerAll = var(40) != 1
trigger1 = Enemy, Name = "Dee Jay" || Enemy, Name = "DeeJay"
value = 67

[State 180, Victory Quote vs. Dhalsim]
type = VictoryQuote
triggerAll = var(40) != 1
trigger1 = Enemy, Name = "Dhalsim" || Enemy, Name = "cvsdhalsim" || Enemy, Name = "RajaaDhalsim"
value = 68

[State 180, Victory Quote vs. Dudley]
type = VictoryQuote
triggerAll = var(40) != 1
trigger1 = Enemy, Name = "Dudley"
value = 69

[State 180, Victory Quote vs. E. Honda]
type = VictoryQuote
triggerAll = var(40) != 1
trigger1 = Enemy, Name = "E. Honda" || Enemy, Name = "cvshonda" || Enemy, Name = "E.Honda" || Enemy, Name = "Honda"
value = 70

[State 180, Victory Quote vs. Elena]
type = VictoryQuote
triggerAll = var(40) != 1
trigger1 = Enemy, Name = "Elena"
value = 71

[State 180, Victory Quote vs. Fei Long]
type = VictoryQuote
triggerAll = var(40) != 1
trigger1 = Enemy, Name = "Fei Long" || Enemy, Name = "cvsfeilong" || Enemy, Name = "FeiLong" || Enemy, Name = "Fei-Long"
value = 72

[State 180, Victory Quote vs. Gill]
type = VictoryQuote
triggerAll = var(40) != 1
trigger1 = Enemy, Name = "Gill"
value = 73

[State 180, Victory Quote vs. Gen]
type = VictoryQuote
triggerAll = var(40) != 1
trigger1 = Enemy, Name = "Gen"
value = 74

[State 180, Victory Quote vs. Gouken]
type = VictoryQuote
triggerAll = var(40) != 1
trigger1 = Enemy, Name = "Gouken"
value = 75

[State 180, Victory Quote vs. Guile]
type = VictoryQuote
triggerAll = var(40) != 1
trigger1 = Enemy, Name = "Guile" || Enemy, Name = "cvsguile"
value = 76

[State 180, Victory Quote vs. Guy]
type = VictoryQuote
triggerAll = var(40) != 1
trigger1 = Enemy, Name = "Guy" || Enemy, Name = "cvsguy"
value = 77

[State 180, Victory Quote vs. Ibuki]
type = VictoryQuote
triggerAll = var(40) != 1
trigger1 = Enemy, Name = "Ibuki"
value = 78

[State 180, Victory Quote vs. Hugo]
type = VictoryQuote
triggerAll = var(40) != 1
trigger1 = Enemy, Name = "Hugo"
value = 79

[State 180, Victory Quote vs. Ken]
type = VictoryQuote
trigger1 = Enemy, Name = "Ken" || Enemy, Name = "cvsken" || Enemy, Name = "Ken Masters"
value = ifElse(var(40) = 1, 56, 80 + (Random % 2))

[State 180, Victory Quote vs. Makoto]
type = VictoryQuote
triggerAll = var(40) != 1
trigger1 = Enemy, Name = "Makoto"
value = 82

[State 180, Victory Quote vs. M. Bison]
type = VictoryQuote
triggerAll = var(40) != 1
trigger1 = Enemy, Name = "M. Bison" || Enemy, Name = "cvsvega" || (Enemy, Name = "Vega" && Enemy, AuthorName = "Phantom.of.the.Server") || Enemy, Name = "M.Bison" || Enemy, Name = "Bison"
value = 83 + (var(40) = 2)

[State 180, Victory Quote vs. Necro]
type = VictoryQuote
triggerAll = var(40) != 1
trigger1 = Enemy, Name = "Necro"
value = 85

[State 180, Victory Quote vs. Oro]
type = VictoryQuote
triggerAll = var(40) != 1
trigger1 = Enemy, Name = "Oro"
value = 86

[State 180, Victory Quote vs. Rose]
type = VictoryQuote
triggerAll = var(40) != 1
trigger1 = Enemy, Name = "Rose"
value = 87

[State 180, Victory Quote vs. Ryu]
type = VictoryQuote
trigger1 = Enemy, Name = "Ryu" || Enemy, Name = "cvsryu"
value = ifElse(var(40) = 1, 57, 88 + (Random % 2))

[State 180, Victory Quote vs. Sagat]
type = VictoryQuote
triggerAll = var(40) != 1
trigger1 = Enemy, Name = "Sagat" || Enemy, Name = "cvssagat" || Enemy, Name = "SagatMG"
value = 90

[State 180, Victory Quote vs. Sakura]
type = VictoryQuote
triggerAll = var(40) != 1
trigger1 = Enemy, Name = "Sakura" || Enemy, Name = "cvssakura" || Enemy, Name = "Sakura Kasugano"
value = 91

[State 180, win quote vs Morrigan / Lilith]
type= VictoryQuote
trigger1 = var(40) != 1
trigger1 = enemy,name="Morrigan Aensland" || enemy,name="Lilith Aensland" || enemy,name="Morrigan" || enemy,name="Lilith"
value= 92
persistent=0

[State 180, Victory Quote vs. Sean]
type = VictoryQuote
triggerAll = var(40) != 1
trigger1 = Enemy, Name = "Sean"
value = 93

[State 180, Victory Quote vs. T. Hawk]
type = VictoryQuote
triggerAll = var(40) != 1
trigger1 = Enemy, Name = "T. Hawk" || Enemy, Name = "T.Hawk"
value = 94

[State 180, Victory Quote vs. Urien]
type = VictoryQuote
triggerAll = var(40) != 1
trigger1 = Enemy, Name = "Urien"
value = 95

[State 180, Victory Quote vs. Vega]
type = VictoryQuote
triggerAll = var(40) != 1
triggerAll = Enemy, AuthorName != "Phantom.of.the.Server"
trigger1 = Enemy, Name = "Vega" || Enemy, Name = "cvsbalrog"
value = 96

[State 180, Victory Quote vs. Yang]
type = VictoryQuote
triggerAll = var(40) != 1
trigger1 = Enemy, Name = "Yang"
value = 97

[State 180, Victory Quote vs. Yun]
type = VictoryQuote
triggerAll = var(40) != 1
trigger1 = Enemy, Name = "Yun"
value = 98

[State 180, Victory Quote vs. Zangief]
type = VictoryQuote
triggerAll = var(40) != 1
trigger1 = Enemy, Name = "Zangief" || Enemy, Name = "cvszangief"
value = 99

[State 180, Victory Quote vs. Akuma Good Ghost]
type = VictoryQuote
triggerAll = var(40) != 1
trigger1 = Enemy, Name = "Akuma"
trigger1 = Enemy, AuthorName = "Phantom.of.the.Server"
value = 47+Random%2

[State 180, Victory Quote vs. Chun-Li JJ]
type = VictoryQuote
triggerAll = var(40) != 1
trigger1 = Enemy, Name = "Chun Li"
trigger1 = Enemy, AuthorName = "BeterHans"
value = 49+Random%3

[State 180, Win by Shinryuken (Master)]
type = ChangeState
trigger1 = PrevStateNo = 3120
value = 3120

[State 180, Win by Soryuken]
type = ChangeState
trigger1 = PrevStateNo = 4111
value = 4111

[State 180, Win by Shin Goku Messatsu]
type = ChangeState
trigger1 = PrevStateNo = 4211
value = 4211

[State 180, Win vs Ryu]
type = ChangeState
trigger1 = var(40) != 1 && var(27)
trigger1 = (RoundState = 2 || MatchOver) && !(TeamMode = Turns)
trigger1 = NumEnemy
trigger1 = Enemy, AuthorName = "Phantom.of.the.Server" && Enemy, Name = "Ryu" && (Enemy, var(1) != 2)
trigger1 = Enemy, FrontEdgeDist >= 55
value = 184

[State 180, Win with Ryu (Simul)]
type = ChangeState
trigger1 = var(40) != 1
trigger1 = TeamMode = Simul && NumPartner
trigger1 = Partner, Alive
trigger1 = Partner, AuthorName = "Phantom.of.the.Server" && Partner, Name = "Ryu" && (Partner, var(1) != 2)
value = 181

[State 180, Violent Win vs M. Bison/Vega]
type = ChangeState
trigger1 = var(40) = 1
trigger1 = (RoundState = 2 || MatchOver) && !(TeamMode = Turns)
trigger1 = NumEnemy
trigger1 = Enemy, Name = "M. Bison" || Enemy, Name = "cvsvega" || Enemy, Name = "cvsvega_normal" || Enemy, Name = "cvsvega_ex" || (Enemy, Name = "Vega" && Enemy, AuthorName = "Phantom.of.the.Server") || Enemy, Name = "M.Bison" || Enemy, Name = "Bison" || Enemy, Name = "Bison Bison"
value = 187

[State 180, Win 1]
type = ChangeState
trigger1 = command = "holdstart" || command = "holdx"
value = ifElse(var(40) = 1, 185, 181)

[State 180, Win 3]
type = ChangeState
trigger1 = command = "holdz" || command = "holdc"
value = ifElse(var(40) = 1, 185, 182)

[State 180, Win 2]
type = ChangeState
trigger1 = var(40) != 3
trigger1 = command = "holdy" || command = "holda" || command = "holdb"
value = ifElse(var(40) = 1, 186, 183)

[State 180, Win Decider]
type = ChangeState
trigger1 = var(40) != 1
value = 181 + (Random % ifElse(var(40) = 3, 2, 3))

[State 180, Violent Win Decider]
type = ChangeState
trigger1 = var(40) = 1
value = ifElse(Random % 2, 185, 186)



;====================<WIN 1>====================
[StateDef 181]
type = S
physics = S
anim = 181
ctrl = 0

[State 181, Assert: RoundNotOver]
type = AssertSpecial
trigger1 = Time < 200
flag = RoundNotOver

[State 181, Voice]
type = PlaySnd
trigger1 = !Time
value = 181, ifElse(Random < 500, 0, 1)
channel = 0



;====================<WIN 2>====================
[StateDef 182]
type = S
physics = S
anim = 182
ctrl = 0

[State 182, Assert: RoundNotOver]
type = AssertSpecial
trigger1 = Time < 200
flag = RoundNotOver

[State 182, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 182,0
channel = 0



;====================<WIN 3>====================
[StateDef 183]
type = S
physics = S
anim = 183
ctrl = 0

[State 183, Assert: RoundNotOver]
type = AssertSpecial
trigger1 = Time < 200
flag = RoundNotOver

[State 183, ChangeAnimElem]
type = ChangeAnim
trigger1 = AnimElemTime(8) >= 0 && Time < 40
value = 183
elem = 8

[State 183, ChangeAnimElem]
type = ChangeAnim
trigger1 = AnimElemTime(9) >= 0
value = 183
elem = 9

[State 183, Voice]
type = PlaySnd
trigger1 = AnimElem = 9
value = 181,1
channel = 0
persistent = 0



;====================<WIN VS RYU>====================
[StateDef 184]
type = S
physics = S
anim = 20
ctrl = 0

[State 184, Assert: RoundNotOver]
type = AssertSpecial
trigger1 = Anim != 184
trigger2 = Anim = 184 && AnimElemTime(1) < 200
flag = RoundNotOver

[State 184, VelSet]
type = VelSet
trigger1 = Anim = 20
x = const(velocity.walk.fwd.x)

[State 184, ChangeAnim]
type = ChangeAnim
trigger1 = Enemy, Facing = Facing
trigger1 = Enemy, P2Dist X <= 68 && (Enemy, P2Dist X >= 58)
value = 5

[State 184, Turn]
type = Turn
trigger1 = Enemy, Facing = Facing
trigger1 = Enemy, P2Dist X <= 68 && (Enemy, P2Dist X >= 58)

[State 184, ChangeAnim]
type = ChangeAnim
trigger1 = Enemy, Facing != Facing
trigger1 = Anim = 20
trigger1 = vel x > 0
trigger1 = Enemy, P2Dist X <= 68 && (Enemy, P2Dist X >= 28)
trigger2 = Anim = 5 && !AnimTime
value = 184

[State 184, PosAdd]
type = PosAdd
trigger1 = Anim = 5 || Anim = 184
x = ceil(Enemy, P2Dist x - 68)

[State 184, VelSet]
type = VelSet
trigger1 = Anim != 20
x = 0



;====================<VIOLENT WIN 1>====================
[StateDef 185]
type = S
physics = S
anim = 185
ctrl = 0

[State 185, Assert: RoundNotOver]
type = AssertSpecial
trigger1 = Time < 200
flag = RoundNotOver

[State 185, Voice]
type = PlaySnd
trigger1 = AnimElem = 5
value = 185, ifElse(Random < 500, 0, 1)
channel = 0



;====================<VIOLENT WIN 2>====================
[StateDef 186]
type = S
physics = S
anim = 186
ctrl = 0

[State 186, Assert: RoundNotOver]
type = AssertSpecial
trigger1 = Time < 200
flag = RoundNotOver

[State 186, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 186,0
channel = 0



;====================<VIOLENT WIN VS M. BISON>====================
[StateDef 187]
type = S
physics = S
anim = 5300
ctrl = 0

[State 187, Assert: RoundNotOver]
type = AssertSpecial
trigger1 = Time < 365
flag = RoundNotOver

[State 187, Voice 1]
type = PlaySnd
trigger1 = !Time
value = 5950,10
channel = 0

[State 187, ChangeAnim]
type = ChangeAnim
trigger1 = Time = 63 && Anim = 5300
value = 187

[State 187, Psycho Power dissipation sound]
type = PlaySnd
trigger1 = Anim = 187
trigger1 = AnimElem = 1
value = 187,0
channel = 1

[State 187, Psycho Power flames]
type = Helper
trigger1 = Anim = 187
trigger1 = AnimElem = 1
helperType = Normal
stateNo = 10187
ID = 10187
name = "Psycho Power flames"
posType = P1
size.xScale = 0.3
size.yScale = 0.3
ownPal = 1
ignoreHitPause = 0

[State 187, Particles]
type = Helper
trigger1 = Anim = 187
trigger1 = !NumHelper(8332) && AnimElem = 10 && AnimElemTime(61) < 0
helperType = Normal
stateNo = 8332
ID = 8332
name = "Particles"
postype = P1
pauseMoveTime = 65535
superMoveTime = 65535
ownPal = 1

[State 187, Orochi Pillar sound]
type = PlaySnd
trigger1 = Anim = 187
trigger1 = AnimElem = 61
value = 3500,1
channel = 3

[State 1340, Mini Orochi Pillar]
type = Helper
trigger1 = Anim = 187
trigger1 = AnimElem = 61
helperType = Normal
stateNo = 20187
ID = 20187
name = "Orochi Pillar"
posType = P1
pos = 0,0
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1
persistent = 0

[State 187, PalFX]
type = PalFX
trigger1 = Anim = 187
trigger1 = AnimElem = 61
time = 18
add = 0,0,0
mul = 256,256,256
sinadd = 255,255,255,36
invertall = 0
color = 256

[State 187, Voice 2]
type = PlaySnd
trigger1 = Anim = 187
trigger1 = AnimElem = 68
value = 3515,1
channel = 0



;==========<TAUNT>==========
[StateDef 195]
type = S
moveType = I
physics = S
anim = ifElse(var(40) = 2, 183, ifElse(var(40) = 1, 198, 195))
velSet = 0,0
sprPriority = 1
ctrl = 0

[State 195, Taunt 2]
type = ChangeAnim
triggerAll = !Time && var(40) != [1,2]
trigger1 = command = "holdfwd"
trigger2 = var(40) = 3
value = 196

[State 195, Taunt 4]
type = ChangeAnim
triggerAll = !Time && var(40) != 3
trigger1 = command = "holddown"
value = ifElse(var(40) = 2, 195, 183)

[State 195, Taunt 3]
type = ChangeAnim
triggerAll = !Time && var(40) != 1
trigger1 = command = "holdback"
value = 197

[State 195, Voice (Taunt 1)]
type = PlaySnd
trigger1 = !Time && Anim = 195
value = 195,0 + (Random % 2)
channel = 0

[State 195, Voice (Taunt 2)]
type = PlaySnd
trigger1 = !Time && Anim = 196
value = 192,0
channel = 0

[State 195, Voice (Taunt 3)]
type = PlaySnd
trigger1 = !Time && Anim = 197
value = 199,0
channel = 0

[State 195, Voice (Taunt 4)]
type = PlaySnd
trigger1 = AnimElem = 9 && Anim = 183
value = 181,1
channel = 0

[State 195, Voice (Violent)]
type = PlaySnd
trigger1 = AnimElem = 2 && Anim = 198
value = 198,0
channel = 0

[State 195, StateTypeSet: Attack]
type = StateTypeSet
trigger1 = Anim = 196
trigger1 = !Time
moveType = A

[State 195, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = Anim = 196
trigger1 = AnimElem = 4 || AnimElem = 7
forceNoFall = !var(20)
attr = S, NA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 7 < 7, 7, fvar(11) * 7)), 0
getpower = 72 * !var(20), 36 * !var(20)
givepower = 36, 36
pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
guard.pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
animType = Light
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 8 + 2 * var(9)
ground.slideTime = 8 + 2 * var(9)
guard.hitTime = 8
air.hitTime = 120
ground.velocity = ifElse(var(20), -2.41, -4.49), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -2.41, -4.49)
guard.cornerPush.velOff = 0
air.velocity = -4.31, -7.36
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 0)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8010)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 41), var(36):= -96
palFX.time = 12 * var(9)
palFX.add = 255,255,255
palFX.sinAdd = -255,-255,-255,48

[State 195, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = Anim = 196
trigger1 = AnimElemTime(8) >= 0
moveType = I

[State 195, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====================<K.O.>====================
[StateDef 5150]
type = L
moveType = H
physics = N
sprPriority = -3
ctrl = 0

[State 5150, ChangeAnim]
type = ChangeAnim
triggerAll = !Time
triggerAll = SelfAnimExist(5140)
trigger1 = (Anim != [5111,5119]) && (Anim != [5171,5179])
trigger2 = !SelfAnimExist(5140 + (Anim % 10))
value = 5140

[State 5150, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
trigger1 = (Anim = [5111,5119]) || (Anim = [5171,5179])
trigger1 = SelfAnimExist(5140 + (Anim % 10))
value = 5140 + (Anim % 10)

[State 5150, ChangeAnim]
type = ChangeAnim
trigger1 = MatchOver = 1
trigger1 = Anim = [5140,5149]
trigger1 = SelfAnimExist(Anim + 10)
value = Anim + 10
persistent = 0

[State 5150, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
trigger1 = Anim != [5140,5159]
trigger1 = Anim != [5110,5119]
value = 5110

[State 5150, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 171
trigger1 = Enemy, Anim = 184
trigger1 = NumEnemy
trigger1 = Enemy, AuthorName = "Phantom.of.the.Server" && Enemy, Name = "Ryu" && (Enemy, var(1) != 2)
value = 171

[State 5150, ChangeAnimElem to sync with Ryu (P2 side)]
type = ChangeAnim
trigger1 = Anim = 171 && AnimElemTime(7) >= 0
trigger1 = Enemy, Anim = 184 && Enemy, AnimElemTime(4) < 0
value = 171
elem = 6

[State 5150, ChangeAnimElem to sync with Ryu (P2 side)]
type = ChangeAnim
trigger1 = Anim = 171 && AnimElemTime(7) < 0
trigger1 = Enemy, Anim = 184 && Enemy, AnimElemTime(4) >= 0
value = 171
elem = 7

[State 5150, SprPriority]
type = SprPriority
trigger1= Anim = 171
value = 3

[State 5150, VelMul]
type = VelMul
trigger1 = 1
x = 0.85

[State 5150, VelSet]
type = VelSet
trigger1 = abs(vel x) < const(movement.down.friction.threshold)
persistent = 0
x = 0

[State 5150, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1



;====================<CHEAP K.O.>====================
[StateDef 5950]
type = S
moveType = H
physics = S
anim = 5950
velSet = 0,0

[State 5950, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 5950, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 5950, Assert: NoKOsnd]
type = AssertSpecial
trigger1 = 1
flag = NoKOsnd

[State 5950, StopSnd]
type = StopSnd
trigger1 = !Time && !Alive
channel = 0

[State 5950, KO Sound]
type = PlaySnd
trigger1 = AnimElem = 2 && !Alive
value = 5950,0 + 10 * (var(40) = 1)

[State 5950, Hitting the Floor Sound]
type = PlaySnd
trigger1 = AnimElem = 7
value = F7,0

[State 5950, Hitting the Floor Explod]
type = Explod
trigger1 = AnimElem = 7
anim = F60
posType = P1
pos = 0,0
sprPriority = -3

[State 5950, End]
type = ChangeState
trigger1= !AnimTime
value = ifElse(Alive, 5110, 5150)



;====================<AIR HIT TRANSITION>====================
[Statedef 5035]
type = A
movetype = H
physics = N

[State 5035, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
trigger1 = SelfAnimExist(5035)
trigger1 = Anim = [5000,5029]
value = 5035

[State 5035, VelAdd]
type = VelAdd
trigger1 = Time > 0
y = GetHitVar(yAccel)

[State 5035, Recover]
type = ChangeState
triggerAll = !HitFall
trigger1 = HitOver
trigger2 = !AnimTime
trigger3 = vel y > 0 && pos y >= 10
trigger4 = !Time
trigger4 = Anim != 5035
value = 5040

[State 5035, Fall]
type = ChangeState
triggerAll = HitFall
trigger1 = HitOver
trigger2 = !AnimTime
trigger3 = vel y > 0 && pos y >= 10
trigger4 = !Time
trigger4 = Anim != 5035
value = 5050



;===========================================================================
;===============================<-2 STATES>=================================
;===========================================================================
[StateDef -2]

[State -2, Hit Detection]
type = VarSet
trigger1 = MoveContact = 1 && var(30) < 0
var(30) = HitPauseTime
ignoreHitPause = 1

[State -2, Hit Sound]
type = PlaySnd
trigger1 = MoveContact = 1 && var(30) = HitPauseTime
trigger1 = MoveHit = 1 && var(31) >= 0
value = 2, var(31)
channel = 2
ignoreHitPause = 1

[State -2, Guard Sound]
type = PlaySnd
trigger1 = MoveContact = 1 && var(30) = HitPauseTime
trigger1 = MoveGuarded = 1 && var(32) >= 0
value = 3, var(32)
channel = 2
ignoreHitPause = 1

[State -2, Hit Sparks]
type = Helper
triggerAll = MoveContact = 1 && var(30) = HitPauseTime
triggerAll = ((StateNo != [1200,1290]) && (StateNo != [3200,3299]) && StateNo != 3600) || var(35) > 0
trigger1 = MoveHit = 1 && NumEnemy
trigger1 = var(33) = 8010 || var(33) = 8011 || var(33) = 8012 || var(33) = 8013 || var(33) = 8014 || var(33) = 8020 || var(33) = 8001
trigger2 = MoveGuarded = 1 && NumEnemy
trigger2 = var(34) = 8000 || var(34) = 8001
helperType = Normal
stateNo = ifElse(MoveGuarded, var(34), var(33))
ID = 8000
name = "Spark"
postype = P1
pos = ceil(ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < var(35), ceil(P2Dist x), var(35))) * const(size.xScale)), ceil(var(36) * const(size.yScale))
facing = ifElse((StateNo = [4100,4199]), 1, -1)
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State -2, Hit Sparks (Behind P1)]
type = Helper
triggerAll = MoveContact = 1 && var(30) = HitPauseTime
triggerAll = (StateNo = [1200,1290]) || StateNo = 3200 || StateNo = 3250 || StateNo = 3211 || StateNo = 3261 || StateNo = 3600
triggerAll = var(35) < 0
trigger1 = MoveHit = 1 && NumEnemy
trigger1 = var(33) = 8010 || var(33) = 8011 || var(33) = 8012 || var(33) = 8013 || var(33) = 8014 || var(33) = 8015 || var(33) = 8016 || var(33) = 8020 || var(33) = 8001
trigger2 = MoveGuarded = 1 && NumEnemy
trigger2 = var(34) = 8000 || var(34) = 8001
helperType = Normal
stateNo = ifElse(MoveGuarded, var(34), var(33))
ID = 8000
name = "Spark"
postype = P1
pos = ceil(ifElse(P2Dist x > 0, 0, ifElse(P2Dist x > var(35), ceil(P2Dist x), var(35))) * const(size.xScale)), ceil(var(36) * const(size.yScale))
facing = -1
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State -2, Counter FX]
type = Helper
triggerAll = MoveHit = 1 && var(30) = HitPauseTime
triggerAll = NumEnemy && var(9)
trigger1 = !(HitDefAttr = SCA, AT) && (EnemyNear, MoveReversed != 1)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ceil(ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < var(35), ceil(P2Dist x), var(35))) * const(size.xScale)), ceil(var(36) * const(size.yScale))
facing = -1
ownPal = 1
pauseMoveTime = 255
superMoveTime = 255
ignoreHitPause = 1

[State -2, Counter Flag]
type = VarSet
trigger1 = NumEnemy
var(9) = (EnemyNear, MoveType = A)
ignoreHitPause = 1

[State -2, Hit Detection]
type = VarSet
trigger1 = 1
var(30) = -1

[State -2, Hit Detection]
type = VarRangeSet
trigger1 = MoveType = I
trigger2 = MoveType = H && Time
first = 30
last = 36
value = -1
ignoreHitPause = 1

[State -2, P2 Facing]
type = TargetFacing
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver) && !(Target, HitFall) && (Target, Time <= 1)
value = ifElse(P2Dist x >= 0, -1, 1)
ignoreHitPause = 1

[State -2, P2 Safe Fall]
type = TargetState
trigger1 = NumTarget = 1
trigger1 = Target, command = "recovery"
trigger1 = Target, pos y >= -48 && Target, vel y > 0
trigger1 = Target, Alive && Target, HitFall && Target, GetHitVar(fall.recover)
trigger1 = Target, StateNo = 5030 || Target, StateNo = 5035 || Target, StateNo = 5050 || Target, StateNo = 5071
value = 5205
ignoreHitPause = 1

[State -2, Assert: UnGuardable]
type = AssertSpecial
trigger1 = var(17) > 0
trigger1 = var(17) := (var(17) - 1)
flag = UnGuardable
ignoreHitPause = 1

[State -2, Hit Count]
type = VarAdd
trigger1 = !IsHelper
trigger1 = MoveHit = 1
trigger1 = !HitPauseTime
trigger1 = !(HitDefAttr = SCA, AT)
var(13) = 1

[State -2, Hit Count Reset]
type = VarSet
trigger1 = NumEnemy && var(13)
trigger1 = (EnemyNear, MoveType != H) && (EnemyNear, StateNo != 5300)
var(13) = 0
ignoreHitPause = 1

[State -2, Juggle Count]
type = VarAdd
trigger1 = !IsHelper
trigger1 = MoveHit = 1
trigger1 = !HitPauseTime
trigger1 = !(HitDefAttr = SCA,AT)
var(15) = 1

[State -2, Juggle Reset Single]
type = VarSet
triggerAll = NumEnemy = 1 && var(15)
trigger1 = (Enemy, StateType != A) && (Enemy, StateNo != [5100, 5109]) && (Enemy, Time >= 1)
trigger2 = (Enemy, MoveType != H) || (Enemy, StateNo = [120,155]) || (Enemy, Ctrl)
var(15) = 0
ignoreHitPause = 1

[State -2, Juggle Reset Simul]
type = VarSet
triggerAll = NumEnemy >= 2 && var(15)
trigger1 = (EnemyNear(0), StateType != A) && (EnemyNear(0), Time >= 1)
trigger2 = (EnemyNear(0), MoveType != H) || (EnemyNear(0), StateNo = [120,155]) || (EnemyNear(0), Ctrl)
trigger3 = (EnemyNear(1), StateType != A) && (EnemyNear(1), Time >= 1)
trigger4 = (EnemyNear(1), MoveType != H) || (EnemyNear(1), StateNo = [120,155]) || (EnemyNear(1), Ctrl)
var(15) = 0
ignoreHitPause = 1

[State -2, Free Juggling]
type = VarSet
trigger1 = RoundState != 2
var(15) = 0
ignoreHitPause = 1

[State -2, Juggle Flag]
type = VarSet
trigger1 = NumEnemy && !var(16)
trigger1 = (EnemyNear, StateNo = 5040) && !(EnemyNear, Ctrl)
var(16) = 1
ignorehitpause = 1

[State -2, Juggle Flag Reset Single]
type = VarSet
triggerAll = NumEnemy = 1 && var(16)
trigger1 = (Enemy, MoveType != H) && (Enemy, StateNo != 5040)
trigger2 = !(Enemy, HitShakeOver) || (Enemy, StateType = L) || (Enemy, Ctrl)
var(16) = 0
ignoreHitPause = 1

[State -2, Juggle Flag Reset Simul]
type = VarSet
triggerAll = NumEnemy >= 2 && var(16)
trigger1 = (EnemyNear(0), MoveType != H) && (EnemyNear(0), StateNo != 5040)
trigger2 = !(EnemyNear(0), HitShakeOver) || (EnemyNear(0), StateType = L) || (EnemyNear(0), Ctrl)
trigger3 = (EnemyNear(1), MoveType != H) && (EnemyNear(1), StateNo != 5040)
trigger4 = !(EnemyNear(1), HitShakeOver) || (EnemyNear(1), StateType = L) || (EnemyNear(1), Ctrl)
var(16) = 0
ignoreHitPause = 1

[State -2, Custom Combo End]
type = VarSet
trigger1 = var(20) < 0
trigger2 = MoveType = H
trigger3 = RoundState != 2
trigger4 = (StateNo = [3000,4999])
var(20) = 0
ignoreHitPause = 1

[State -2, Custom Combo Time]
type = VarAdd
trigger1 = var(20) > 0
var(20) = -1
ignoreHitPause = 1

[State -2, Custom Combo Asserts]
type = AssertSpecial
trigger1 = var(20) > 0
flag = NoStandGuard
flag2 = NoCrouchGuard
flag3 = NoAirGuard
ignoreHitPause = 1

[State -2, Custom Combo PalFX]
type = PalFX
trigger1 = var(20) > 60
time = 2
add = 32 + ceil(sin(var(20) / 16.0 * pi) * 32), 32 + ceil(sin(var(20) / 16.0 * pi) * 32), 32 + ceil(sin(var(20) / 16.0 * pi) * 32)
ignoreHitPause = 1

[State -2, Custom Combo PalFX]
type = PalFX
trigger1 = var(20) = [1,60]
time = 2
add = 64 + ceil(sin(var(20) / 8.0 * pi) * 64), 64 + ceil(sin(var(20) / 8.0 * pi) * 64), 64 + ceil(sin(var(20) / 8.0 * pi) * 64)
ignoreHitPause = 1

[State -2, Throws Allowed]
type = VarSet
trigger1 = EnemyNear, MoveType != H
trigger1 = EnemyNear, StateNo != 140
trigger1 = (EnemyNear, ctrl && EnemyNear, Time >= 1) || (EnemyNear, Time >= 8)
trigger2 = EnemyNear, MoveType = A
trigger3 = (EnemyNear, StateNo != [0,52]) && (EnemyNear, StateNo != [120,155]) && (EnemyNear, StateNo != [5000,5120])
trigger4 = var(20) || var(21) || var(22)
var(38) = 0

[State -2, Throws Disallowed]
type = VarSet
triggerAll = NumEnemy
trigger1 = EnemyNear, StateNo = [150,155]
trigger2 = (EnemyNear, StateNo = 51 || EnemyNear, StateNo = 140) && (EnemyNear, PrevStateNo = [150, 155])
trigger3 = EnemyNear, MoveType = H && EnemyNear, StateType != A && !var(20) && !var(21) && !var(22)
trigger4 = (EnemyNear, StateNo = [5020,5040]) && EnemyNear, HitFall = 0
trigger5 = EnemyNear, StateNo = 40 && EnemyNear, PrevStateNo != 52 && (EnemyNear, Anim != [0, 29])
var(38) = 1
ignoreHitPause = 1

[State -2, Dampener]
type = VarSet
trigger1 = 1
fvar(10) = ifElse(var(13) < 6, 24, ifElse(var(13) >= 23, 1, 29 - var(13))) / 24.0
ignoreHitPause = 1

[State -2, Dampener - Custom Combo]
type = VarSet
trigger1 = var(20)
fvar(10) = 0.72 * (10 - ifElse(var(13) >= 10, 10, var(13))) / 10.0
ignoreHitPause = 1

[State -2, Dampener - Custom Combo Limiter]
type = VarSet
trigger1 = var(20)
trigger1 = StateNo = 242 || StateNo = 247 || (StateNo = [250,252]) || StateNo = 259
fvar(10) = ifElse(var(13), 0, 0.72)
ignoreHitPause = 1

[State -2, Dampener - Supers]
type = VarSet
trigger1 = (StateNo = [3000,4999])
fvar(10) = ifElse(var(22), 0.6, ifElse(var(21), 0.8, 1.0))
ignoreHitPause = 1

[State -2, Dampener - Supers (Fujin Sen Geri)]
type = VarSet
trigger1 = (StateNo = [3000, 4999])
trigger1 = var(11)
fvar(10) = ifElse(var(22), 0.5, ifElse(var(21), 0.6, 0.7))
ignoreHitPause = 1

[State -2, Dampener Limit]
type = VarSet
trigger1 = fvar(10) < 0
fvar(10) = 0
ignoreHitPause = 1

[State -2, Root Dampener]
type = VarSet
trigger1 = 1
fvar(11) = fvar(10) * ifElse(var(9), 1.2, 1)
ignoreHitPause = 1

;CvS2 Evil Ryu essentially takes 0.358 extra damage every hit
;PotS Evil Ryu essentially takes 0.125 extra damage every hit
;PotS Master Ryu essentially takes 0.25 extra damage every hit
[State -2, Defense Levels]
type = LifeAdd
trigger1 = var(40) = [1,2]
trigger1 = GetHitVar(HitCount) = 1 && GetHitVar(Damage)
trigger1 = StateNo != [760,762]
value = -ceil(ifElse(var(40) = 2, 0.45, 0.358) * GetHitVar(Damage))
kill = 0
ignoreHitPause = 1

;CvS2 Evil Ryu essentially takes 1.358 times more damage than standard
;PotS Evil Ryu essentially takes 1.125 times more damage than standard
;PotS Master Ryu essentially takes 1.25 times more damage than standard
[State -2, Defense Levels]
type = DefenceMulSet
trigger1 = var(40) = [1,2]
value = ifElse(var(40) = 2, 1.45, 1.358) * (const(data.fall.defence_mul) ** GetHitVar(FallCount))
ignoreHitPause = 1

[State -2, Voice Position]
type = SndPan
trigger1 = 1
channel = 0
pan = 0
ignoreHitPause = 1

[State -2, KO Sound Variable]
type = VarSet
triggerAll = StateNo != 5950
trigger1 = Alive && var(41) > 0
trigger2 = !Alive && var(41) < 2
var(41) = ifElse(Alive, 0, var(41) + 1)
ignoreHitPause = 1

[State -2, KO Sound]
type = PlaySnd
triggerAll = PrevStateNo != 5950
trigger1 = !Alive && var(41) = 1
trigger1 = var(41) := 2
value = 11, 1 + 10 * (var(40) = 1)
ignoreHitPause = 1

[State -2, Collapse Sound]
type = PlaySnd
trigger1 = StateNo != 5950
trigger1 = Anim = 5950 || Anim = 5955
trigger1 = AnimElem = 7
value = F7,0

[State -2, Collapse FX]
type = Explod
trigger1 = StateNo != 5950
trigger1 = Anim = 5950 || Anim = 5955
trigger1 = AnimElem = 7
anim = F60
posType = P1
sprpriority = -3

[State -2, Guard Crush/Throw Escape voice]
type = PlaySnd
trigger1 = Anim = 5910 || Anim = 5920 || Anim = 5930
trigger1 = AnimElemTime(1) = 1
trigger2 = Anim = 5940 || Anim = 5945
trigger2 = AnimElem = 2 && StateNo != 890
value = ifElse(var(40) = 1, 5000, 800), ifElse(var(40) = 1, 12, 0)
channel = 0
ignoreHitPause = 1

[State -2, Helicopter Sound Loop/Heartbeat sound Off]
type = StopSnd
trigger1 = NumHelper(26805)
trigger1 = Helper(26805), StateNo != 26805
trigger2 = Time = 1
trigger2 = PrevStateNo = 6805 && StateNo != 6805
trigger3 = Time = 1
trigger3 = PrevStateNo = 6807 && StateNo != 6807
channel = 5
ignoreHitPause = 1

[State -2, Fujin Sen Geri Hit Count Reset]
type = VarSet
trigger1 = !var(13)
var(11) = 0
ignoreHitPause = 1

[State -2, Lv3 Super Finish Detection]
type = VarSet
triggerAll = !(Enemy, Alive)
trigger1 = StateNo = [3300,3399]
trigger2 = StateNo = [3600,3699]
var(27) = 1
ignoreHitPause = 1

[State -2, Remove Shoryuken fist overlay]
type = RemoveExplod
trigger1 = NumExplod(1124) && StateNo != [1100,1130]
id = 1124
ignoreHitPause = 1

[State -2, Remove Shoryuken flames (ground)]
type = RemoveExplod
trigger1 = NumExplod(1125) && StateNo != [1100,1130]
id = 1125
ignoreHitPause = 1

[State -2, Remove Shoryuken flames (ascending)]
type = RemoveExplod
trigger1 = NumExplod(1126) && StateNo != [1100,1130]
id = 1126
ignoreHitPause = 1

[State -2, Remove Shoryuken flames (fade away)]
type = RemoveExplod
trigger1 = NumExplod(1127) && StateNo != [1100,1130]
id = 1127
ignoreHitPause = 1

[State -2, Remove Shoryureppa fist overlay]
type = RemoveExplod
trigger1 = NumExplod(3004) && StateNo != [3000,3050]
id = 3004
ignoreHitPause = 1

[State -2, Remove Shoryureppa flames (ground)]
type = RemoveExplod
trigger1 = NumExplod(3005) && StateNo != [3000,3050]
id = 3005
ignoreHitPause = 1

[State -2, Remove Shoryureppa flames (ascending)]
type = RemoveExplod
trigger1 = NumExplod(3006) && StateNo != [3000,3050]
id = 3006
ignoreHitPause = 1

[State -2, Remove Shoryureppa flames (fade away)]
type = RemoveExplod
trigger1 = NumExplod(3007) && StateNo != [3000,3050]
id = 3007
ignoreHitPause = 1

[State -2, Sealed by Chizuru's Reigi no Ishizue]
type = PalFX
trigger1 = NumProjID(131035)
trigger1 = GameTime % 2 = 1
time = 1
add = 0,0,92
sinAdd = 0,0,0,0
color = 0
invertAll = 0
color = 256
ignoreHitPause = 1

[State -2, EXPLODsive Buffering Helper]
type = Helper
trigger1 = !NumHelper(90000005)
helpertype = Normal
stateNo = 90000005
ID = 90000005
name = "EXPLODsive Buffering helper"
posType = P1
facing = ifElse(Facing = 1, 1, -1)
keyCtrl = 1
ignoreHitPause = 1

[State -2, Debug]
type = DisplayToClipboard
trigger1 = 1
text = "AI = %d Attack = %f Hits = %d Juggle = %d"
params = AILevel, fvar(11), var(13), var(15)
ignoreHitPause = 1

[State -2, Debug]
type = AppendToClipboard
trigger1 = 1
text = "\nBy Jmorphman"
ignoreHitPause = 1



;===========================================================================
;===============================<-3 STATES>=================================
;===========================================================================
[StateDef -3]

[State -3, Disable AI when Double Shinku Hadoken/Shin Goku Messatsu conditions met (Flag off)]
type = VarSet
trigger1 = 1
var(59) = 0
ignoreHitPause = 1

[State -3, Disable AI when Double Shinku Hadoken conditions met (Flag on)]
type = VarSet
triggerAll = AILevel && var(40) != 1
triggerAll = power >= 3000
triggerAll = TeamMode = Simul && NumPartner
triggerAll = Partner, Alive
triggerAll = Partner, Facing = Facing
triggerAll = ((P2Dist x >= Partner, P2Dist x) && (P2Dist x - Partner, P2Dist x <= 150)) || ((P2Dist x < Partner, P2Dist x) && (Partner, P2Dist x - P2Dist x <= 155))
triggerAll = Partner, AuthorName = "Phantom.of.the.Server" && Partner, Name = "Ryu" && (Partner, var(1) != 2)
triggerAll = Partner, StateType != A && !(Partner, var(20))
trigger1 = Partner, ctrl || ((Partner, StateNo = [200,299]) && Partner, Time <= 2) || (Partner, StateNo = 200 || Partner, StateNo = 230 || Partner, StateNo = 245)
trigger2 = (Partner, StateNo = [200,255])
trigger3 = ((Partner, StateNo = [1100,1110]) || (Partner, StateNo = [1300,1310])) && Partner, MoveContact
trigger4 = Partner, StateNo = 52 && (Partner, PrevStateNo = [1000,4999]) && Partner, MoveContact
var(59) = 1
ignoreHitPause = 1

[State -3, Disable AI when Shin Goku Messatsu conditions met (Flag on)]
type = VarSet
triggerAll = AILevel && var(40) != 1
triggerAll = power >= 3000
triggerAll = TeamMode = Simul && NumPartner
triggerAll = Partner, Alive
triggerAll = Partner, Facing != Facing
triggerAll = Partner, AuthorName = "Phantom.of.the.Server" && Partner, Name = "Ryu" && (Partner, var(1) = 2)
triggerAll = Partner, StateType != A && !(Partner, var(20))
trigger1 = Partner, ctrl || ((Partner, StateNo = [200,299]) && Partner, Time <= 2) || (Partner, StateNo = 200 || Partner, StateNo = 230 || Partner, StateNo = 245)
trigger2 = (Partner, StateNo = [200,255])
trigger3 = ((Partner, StateNo = [1100,1110]) || (Partner, StateNo = [1300,1310])) && Partner, MoveContact
trigger4 = Partner, StateNo = 52 && (Partner, PrevStateNo = [1000,4999]) && Partner, MoveContact
var(59) = 1
ignoreHitPause = 1

[State -3, GameTime]
type = VarSet
trigger1 = 1
var(58) = GameTime
ignoreHitPause = 1

[State -3, ProjContact Reset]
type = VarSet
triggerAll = var(18)
trigger1 = StateNo != 1000 && StateNo != 1030
var(18) = 0

[State -3, Projectile Flag Reset]
type = VarSet
trigger1 = var(39) < 0
var(39) = 0
ignoreHitPause = 1

[State -3, Projectile Flag Off]
type = VarSet
trigger1 = !NumHelper(1005)
trigger1 = !NumHelper(1035)
var(39) = 0
ignoreHitPause = 1

[State -3, Chain Combo Reset]
type = VarSet
trigger1 = 1
var(4) = 0
ignoreHitPause = 1

[State -3, Chain Combo Check]
type = VarSet
trigger1 = var(20) && (StateNo = [200,699]) && MoveContact
trigger2 = var(20) && (StateNo = [1000,2999]) && StateType != A && (MoveContact || var(18))
var(4) = 1
ignoreHitPause = 1

[State -3, Cancel Reset]
type = VarSet
trigger1 = 1
var(6) = 0
ignoreHitPause = 1

[State -3, Cancel Check]
type = VarSet
trigger1 = var(20) && (StateNo = [200,699])
trigger2 = var(20) && (StateNo = [1000,2999]) && (MoveContact || var(18))
trigger3 = (StateNo = [200,699]) && Time <= 2
trigger4 = StateNo = 200 && MoveContact
trigger5 = StateNo = 205 && MoveContact
trigger6 = StateNo = 215 && MoveContact && AnimElemTime(4) < 0
trigger7 = StateNo = 225 && MoveContact && AnimElemTime(5) < 0
trigger8 = StateNo = 230 && MoveContact
trigger9 = StateNo = 245 && MoveContact && AnimElemTime(5) < 0
trigger10 = StateNo = 255 && MoveContact && AnimElemTime(6) < 0
trigger11 = StateNo = 400 && MoveContact
trigger12 = StateNo = 410 && MoveContact && AnimElemTime(5) < 0
trigger13 = StateNo = 420 && MoveContact && AnimElemTime(4) < 0
trigger14 = StateNo = 430 && MoveContact
trigger15 = StateNo = 440 && MoveContact && AnimElemTime(6) < 0
trigger16 = StateNo = 450 && MoveContact && AnimElemTime(5) < 0
trigger17 = StateNo = 600 && MoveContact
trigger18 = StateNo = 610 && MoveContact && AnimElemTime(7) < 0
trigger19 = (StateNo = [630,631]) && MoveContact
trigger20 = StateNo = 650 && MoveContact && AnimElemTime(3) < 0
var(6) = 1
ignoreHitPause = 1

[State -3, Super Cancel Reset]
type = VarSet
trigger1 = 1
var(7) = 0
ignoreHitPause = 1

[State -3, Super Cancel Flag Reset]
type = VarSet
trigger1 = var(21)
trigger1 = (StateNo != [3000,4999]) || MoveType = H
var(21) = 0
ignoreHitPause = 1

[State -3, Super Cancel Check]
type = VarSet
trigger1 = var(20) && (StateNo = [200,699])
trigger2 = var(20) && (StateNo = [1000,2999]) && (MoveContact || var(18))
trigger3 = (StateNo = [200,699]) && Time <= 2
trigger4 = StateNo = 200
trigger5 = StateNo = 205
trigger6 = StateNo = 210 && (AnimElemTime(6) < 0 || (MoveContact = [1,8]))
trigger7 = StateNo = 215 && (AnimElemTime(4) < 0 || (MoveContact = [1,8]))
trigger8 = StateNo = 220 && (AnimElemTime(5) < 0 || (MoveContact = [1,8]))
trigger9 = StateNo = 225 && (AnimElemTime(8) < 0 || (MoveContact = [1,8]))
trigger10 = StateNo = 230
trigger11 = StateNo = 245 && (AnimElemTime(5) < 0 || (MoveContact = [1,8]))
trigger12 = StateNo = 255 && (AnimElemTime(6) < 0 || (MoveContact = [1,8]))
trigger13 = StateNo = 400
trigger14 = StateNo = 410 && (AnimElemTime(4) < 0 || (MoveContact = [1,8]))
trigger15 = StateNo = 420 && (AnimElemTime(7) < 0 || (MoveContact = [1,8]))
trigger16 = StateNo = 430
trigger17 = StateNo = 440 && (AnimElemTime(6) < 0 || (MoveContact = [1,8]))
trigger18 = StateNo = 450 && (AnimElemTime(5) < 0 || (MoveContact = [1,8]))
trigger19 = (StateNo = [1000,1030]) && (AnimElemTime(5) = [2,9])
trigger20 = (StateNo = [1100,1130]) && AnimElemTime(4) < 0 && MoveContact
trigger21 = StateNo = 1400 && AnimElemTime(7) < 0 && MoveContact
trigger22 = StateNo = 1410 && AnimElemTime(6) < 0 && MoveContact
trigger23 = StateNo = 1420 && AnimElemTime(7) < 0 && MoveContact
trigger24 = StateNo = 1430 && AnimElemTime(6) < 0 && MoveContact
var(7) = 1
ignoreHitPause = 1

[State -3, Hyper Cancel Reset]
type = VarSet
trigger1 = 1
var(8) = 0
ignoreHitPause = 1

[State -3, Hyper Cancel Reset]
type = VarSet
trigger1 = StateNo = 3000 && AnimElemTime(15) < 0 && MoveContact
trigger2 = StateNo = 3200 && AnimElemTime(41) < 0 && MoveContact
trigger3 = StateNo = 3210 && MoveContact
trigger4 = StateNo = 3211 && AnimElemTime(4) < 0
var(8) = 1
ignoreHitPause = 1

[State -3, Hyper Cancel Flag Reset]
type = VarSet
trigger1 = var(22)
trigger1 = (StateNo != [3000,4999]) || MoveType = H
var(22) = 0
ignoreHitPause = 1

[State -3, Parry Detection]
type = Helper
triggerAll = RoundState = 2 && !NumHelper(765) && !var(20)
triggerAll = (MoveType = I && ctrl) || (StateNo = [760, 762]) || StateNo = 5120
triggerAll = (command != "rlsfwd" && command != "rlsback" && command != "rlsup" && command != "rlsdown") || AILevel
trigger1 = !AILevel && (StateType = S || StateType = C || StateNo = 5120)
;Standing/crouch, no reversed commands
trigger1 = !NumExplod(92828282) && !NumExplod(94646464) && !NumExplod(92468246)
trigger1 = ifElse(P2dist x >= 0, command = "fwd", command = "back") || command = "down"
;Air, no reversed commands
trigger2 = !AILevel && StateType = A && (var(3) != 1 && var(3) != 2)
trigger2 = !NumExplod(94646464) && !NumExplod(92468246)
trigger2 = ifElse(P2dist x >= 0, command = "fwd", command = "back")
;Standing/crouch, left/right or all directions reverse
trigger3 = !AILevel && (StateType = S || StateType = C || StateNo = 5120)
trigger3 = NumExplod(94646464) || NumExplod(92468246)
trigger3 = ifElse(P2dist x >= 0, command = "back", command = "fwd") || ifElse(NumExplod(92468246), command = "up", command = "down")
;Standing/crouch, up/down reverse only
trigger4 = !AILevel && (StateType = S || StateType = C || StateNo = 5120)
trigger4 = NumExplod(92828282) && !NumExplod(94646464) && !NumExplod(92468246)
trigger4 = ifElse(P2dist x >= 0, command = "fwd", command = "back") || command = "up"
;Air, reversed commands
trigger5 = !AILevel && StateType = A && (var(3) != 1 && var(3) != 2)
trigger5 = NumExplod(94646464) || NumExplod(92468246)
trigger5 = ifElse(P2dist x >= 0, command = "back", command = "fwd")
trigger6 = AILevel && (StateNo != [760,762]) && InGuardDist && Random < 50
trigger7 = AILevel && (StateNo = [760,762]) && Time = 14 && Random < 667
helperType = Normal
stateNo = 765
ID = 765
name = "Parry Detection"
posType = P1
pauseMoveTime = 65535
superMoveTime = 65535

[State -3, Parry Attacks]
type = ChangeState
trigger1 = (StateNo != [760,762]) && NumHelper(765)
trigger1 = Helper(765), StateNo = 766
value = ifElse((Helper(765), Anim = 767), 762, ifElse((Helper(765), Anim = 766), 761, 760))
ignoreHitPause = 1

[State -3, Parry Projectiles]
type = HitOverride
trigger1 = (StateNo != [760,762]) && NumHelper(765)
trigger1 = !(Helper(765), var(0)) && (Helper(765), Anim = 765)
attr = SA, AP
stateNo = 760
slot = 0
time = 1
ignoreHitPause = 1

[State -3, Parry Projectiles]
type = HitOverride
trigger1 = (StateNo != [760,762]) && NumHelper(765)
trigger1 = !(Helper(765), var(0)) && (Helper(765), Anim = 766)
attr = C, AP
stateNo = 761
slot = 0
time = 1
ignoreHitPause = 1

[State -3, Parry Projectiles]
type = HitOverride
trigger1 = (StateNo != [760,762]) && NumHelper(765)
trigger1 = !(Helper(765), var(0)) && (Helper(765), Anim = 767)
attr = SCA, AP
stateNo = 762
slot = 0
time = 1
ignoreHitPause = 1

[State -3, Assert: NoWalk after Parry]
type = AssertSpecial
trigger1 = var(26) > 0
trigger1 = var(26) := (var(26)-1)
flag = NoWalk
ignoreHitPause = 1

[State -3, Corner Push]
type = VarSet
trigger1 = fvar(5)
trigger1 = NumTarget
trigger1 = Target, HitOver || (Target, GetHitVar(HitShakeTime) > 0 && Target, Time <= 0)
fvar(5) = 0

[State -3, Corner Push]
type = VarSet
triggerAll = MoveType != H
trigger1 = MoveContact = 1 && NumTarget
fvar(5) = Target, GetHitVar(xVel)
ignoreHitPause = 1

[State -3, Corner Push]
type = PosAdd
triggerAll = fvar(5)
triggerAll = (StateType = S || StateType = C || StateNo = [1200,1240]) && NumTarget
triggerAll = !HitPauseTime && Target, GetHitVar(HitShakeTime) <= 0
triggerAll = (Target, StateType = S || Target, StateType = C) && !(Target, GetHitVar(yvel)) && !(Target, HitFall)
trigger1 = Target, FrontEdgeBodyDist <= abs(Target, vel x)
trigger1 = (Target, GetHitVar(xvel) * Target, Facing) > 0
trigger2 = Target, BackEdgeBodyDist <= abs(target, vel x)
trigger2 = (Target, GetHitVar(xvel) * Target, Facing) < 0
x = ifElse(Target, FrontEdgeBodyDist <= 0, -1, 1) * (Target, Facing) * fvar(5)

[State -3, Corner Push]
type = VarSet
trigger1 = fvar(5)
trigger1 = abs(fvar(5)) < 1.0
fvar(5) = 0

[State -3, Corner Push]
type = VarSet
trigger1 = NumTarget
trigger1 = Target, GetHitVar(HitShakeTime) <= 0
fvar(5) = fvar(5) * 0.85

[State -3, EX FX Decrement]
type = VarAdd
trigger1 = var(25) > 0
var(25) = -1

[State -3, EX FX Reset]
type = VarSet
trigger1 = (StateNo != [1000,2999]) || MoveType = H
var(25) = 0

[State -3, EX Flash]
type = PalFX
trigger1 = !(GameTime % 2) && var(25)
time = 1
color = 0
mul = 256, 224, 0
add = 128, 128, 128
ignoreHitPause = 1

[State -3, Movement AfterImage]
type = AfterImage
triggerAll = Time = 1 && !var(20)
trigger1 = StateNo = 50 && (var(3) = 2 || var(3) = 3)
trigger2 = (StateNo = [700,715])
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

[State -3, Level 1 Super AfterImage]
type = AfterImage
trigger1 = (StateNo = 3000 || StateNo = 3100 || StateNo = 3200 || StateNo = 3210) && Time = 43
time = 2
timeGap = 1
frameGap = 10
length = 21
palBright = 0,0,0
palContrast = 128,128,128
palPostBright = 0,0,0
palAdd = 0,0,0
palMul = 0.75,0.75,0.75
trans = Add1

[State -3, Level 2 Super AfterImage]
type = AfterImage
trigger1 = StateNo = 3050 && Time = 43
trigger2 = StateNo = 3150 && Time = 43
trigger3 = StateNo = 3250 && Time = 43
trigger4 = StateNo = 3260 && Time = 43
trigger5 = StateNo = 3450 && Time = 43
time = 2
timeGap = 1
frameGap = 10
length = 21
palBright = 0,0,0
palContrast = 32,32,160
palPostBright = 0,0,0
palAdd = 0,0,0
palMul = 0.75,0.75,0.75
trans = Add1

[State -3, Level 3 Super AfterImage]
type = AfterImage
trigger1 = StateNo = 3300 && Time = 43
trigger2 = StateNo = 3500 && Time = 43
trigger3 = StateNo = 3600 && Time = 43
trigger4 = StateNo = 4001 && Time = 9
trigger5 = StateNo = 4101 && AnimElem = 34
time = 2
timeGap = 1
frameGap = 10
length = 21
palBright = 0,0,0
palContrast = 160,32,32
palPostBright = 0,0,0
palAdd = 0,0,0
palMul= 0.75,0.75,0.75
trans = Add1

[State -3, AfterImage Persist]
type = AfterImageTime
trigger1 = StateNo = 50 || (StateNo = [600,699])
trigger1 = (var(3) = 2 || var(3) = 3) && vel y < -1
trigger2 = var(20)
trigger3 = StateNo = [700,715]
trigger4 = (StateNo = [3000,4999]) && StateNo != 4111
trigger5 = StateNo = 1600 || StateNo = 6806 || StateNo = 6808
time = 2

[State -3, AfterImage Off]
type = AfterImageTime
triggerAll = Time <= 1
trigger1 = StateNo = 3000 || StateNo = 3050 || StateNo = 3100 || StateNo = 3150 || StateNo = 3200 || StateNo = 3250
trigger2 = StateNo = 3300
time = 0

[State -3, Underground Juggle Prevention]
type = TargetBind
trigger1 = MoveContact = 1
trigger1 = NumTarget && NumEnemy
trigger1 = (Target, Time = 0) && (Target, ID = EnemyNear, ID)
trigger1 = !(Target, HitShakeOver) && (Target, pos y > 0)
pos = ceil(P2Dist x), ceil(-pos y)
ignoreHitPause = 1

[State -3, Prevent Crossup]
type = Width
trigger1 = MoveType != H
edge = 8, 0
ignoreHitPause = 1

[State -3, Variable Height]
type = PlayerPush
triggerAll = StateType = A && MoveType != H && NumEnemy
triggerAll = P2BodyDist x = [-(EnemyNear, const(size.ground.back) + EnemyNear, const(size.ground.front)), 0]
trigger1 = P2StateType = S
trigger1 = P2Dist y >= (EnemyNear, const(size.height) - 34)
trigger2 = P2StateType = C
trigger2 = P2Dist y >= (EnemyNear, const(size.height) - 50)
trigger3 = P2StateType = L
trigger3 = P2Dist y >= 12
value = 0
ignoreHitPause = 1

[State -3, Get Hit Sound]
type = PlaySnd
triggerall = Alive && Time = 1
triggerall = StateNo = 5000 || StateNo = 5010
trigger1 = GetHitVar(AnimType) >= 2 && Random < 500
trigger2 = GetHitVar(AnimType) = 1 && Random < 375
trigger3 = GetHitVar(AnimType) = 0 && Random < (250 * (AILevel ** 2 / 64.0))
value = 5000,(Random % 3) + 10 * (var(40) = 1)
channel = 0
ignoreHitPause = 1

[State -3, Get Hit Sound]
type = PlaySnd
triggerAll = Alive && Time = 1
trigger1 = (StateNo = 5000 || StateNo = 5010) && NumEnemy
trigger1 = GetHitVar(fall) || (EnemyNear, HitDefAttr = SCA,SA,HA)
trigger2 = (StateNo = 5020 || StateNo = 5070 || StateNo = 5080)
trigger3 = (StateNo = 5050 || StateNo = 5100) && (PrevStateNo != [5000,5199])
value = 5000,(Random % 3) + 10 * (var(40) = 1)
channel = 0
ignoreHitPause = 1

[State -3, Cheap KO]
type = ChangeState
trigger1 = !Alive && (StateNo = [5000,5010])
trigger1 = (PrevStateNo = [130,131]) || (PrevStateNo = [140,141]) || (PrevStateNo = [150,153])
value = 5950
ignoreHitPause = 1

[State -3, Assert: NoKOsnd (Cheap KO)]
type = AssertSpecial
trigger1 = (StateNo = [5000,5010])
trigger1 = (PrevStateNo = [130,131]) || (PrevStateNo = [140,141]) || (PrevStateNo=[150,153])
flag = NoKOsnd
ignoreHitPause = 1

[State -3, Stop Guarding Voice]
type = StopSnd
trigger1 = StateNo = [120,155]
channel = 0

[State -3, Custom Combo Finish]
type = Helper
triggerAll = WinKO && var(20)
triggerAll = RoundState = 3 && !NumHelper(8600)
trigger1 = MoveHit = [1,4]
trigger2 = StateNo = 810 && (AnimElemTime(9) = [2,3])
trigger3 = (StateNo = [820,821]) && (AnimElemTime(3) = [0, 1])
trigger4 = StateNo = 830 && (AnimElemTime(7) = [1,2])
trigger5 = StateNo = 861 && (AnimElemTime(13) = [2,3])
trigger6 = NumHelper(1005)
trigger6 = (Helper(1005), StateNo = [1005,1007]) && (Helper(1005), var(18))
trigger7 = NumHelper(1035)
trigger7 = (Helper(1035), StateNo = [1035,1037]) && (Helper(1035), var(18))
helperType = Normal
stateNo = 8600
ID = 8600 + 0 * (var(23) := 900)
name = "Super Finish"
posType = Left
pos = 160, -120
ownPal = 1
pauseMoveTime = 255
superMoveTime = 255
ignoreHitPause = 1

[State -3, Super Finish]
type = Helper
triggerAll = WinKO
triggerAll = RoundState = 3 && !NumHelper(8600)
trigger1 = MoveHit = 1 && (StateNo = [3000,4999])
trigger1 = var(23) := StateNo
trigger2 = StateNo = 3000
trigger2 = var(23) := 3000
trigger3 = StateNo = 3050
trigger3 = var(23) := 3050
trigger4 = StateNo = 3100
trigger4 = var(23) := 3100
trigger5 = StateNo = 3150
trigger5 = var(23) := 3150
trigger6 = StateNo = [3200,3299]
trigger6 = var(23) := 3200
trigger7 = StateNo = 3312
trigger7 = var(23) := 3300
trigger8 = StateNo = 3450
trigger8 = var(23) := 3400
trigger9 = StateNo = 3510
trigger9 = var(23) := 3500
trigger10 = StateNo = [3600,3699]
trigger10 = var(23) := 3600
trigger11 = StateNo = [4100,4199]
trigger11 = var(23) := 4100
trigger12 = StateNo = [4200,4299]
trigger12 = var(23) := 4200
helperType = Normal
stateNo = 8600
ID = 8600
name = "Super Finish"
posType = left
pos = 160,-120
ownPal = 1
pauseMoveTime = 255
superMoveTime = 255
ignoreHitPause = 1
