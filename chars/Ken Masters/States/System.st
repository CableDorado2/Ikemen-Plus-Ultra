; _________________________________________
;| Ken by Phantom.of.the.Server & Jmorphman & Beterhans|
; ?
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

;[State 0, Remove Explods]
;type = RemoveExplod
;trigger1 = IsHelper

;[State 0, Destroy Helpers]
;type = DestroySelf
;trigger1 = IsHelper

[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = (Anim != 5 && Anim != 7) && Anim != var(40) * 2
trigger2 = (Anim = 5 || Anim = 7) && !AnimTime
value = var(40) * 2

[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = Anim = 5 && var(40) = 1
value = 7

[State 0, Die because of Bad character]
type = LifeAdd
trigger1 = NumEnemy
trigger1 = Enemy, AuthorName = "alexlexus" && Enemy, Name = "Gouken"
value = -1000

[State 0, Dead]
type = ChangeState
trigger1 = !Alive
value = 5050

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



;====================<CROUCHING>====================
;Stand to Crouch
[StateDef 10]
type = C
physics = C
moveType = I
velSet = 0,0
sprPriority = 0

[State 10, ChangeAnim]
type = ChangeAnim
triggerAll = var(40) != 1
trigger1 = !Time && Anim = 12
value = 10
elem = 3 - AnimElemNo(0)

[State 10, ChangeAnim]
triggerAll = var(40) != 1
type = ChangeAnim
trigger1 = Anim != 10
value = 10

[State 10, ChangeAnim]
type = ChangeAnim
triggerAll = var(40) = 1
trigger1 = !Time && Anim = 15
value = 13
elem = 3 - AnimElemNo(0)

[State 10, ChangeAnim]
type = ChangeAnim
triggerAll = var(40) = 1
trigger1 = Anim != 13
value = 13

[State 10, End]
type = ChangeState
trigger1 = !AnimTime
value = 11


;Crouching
[StateDef 11]
type = C
physics = C
moveType = I
anim = ifElse(var(40) != 1, 11, 14)
velSet = 0,0
sprPriority = 0

[State 11, ChangeAnim]
type = ChangeAnim
trigger1 = (Anim != 6 && Anim != 8) && Anim != 11 && Anim != 14
trigger2 = (Anim = 6 || Anim = 8) && !AnimTime
value = ifElse(var(40) != 1, 11, 14)

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

[State 12, ChangeAnim]
type = ChangeAnim
triggerAll = var(40) != 1
trigger1 = !Time && Anim = 10
value = 12
elem = 3 - AnimElemNo(0)


[State 12, Anim]
type = changeanim
triggerall = var(40) != 1
triggerall = !(anim = 761 && animtime)
trigger1 = anim = 761 && !animtime
trigger2 = anim != 12
value = 12

[State 12, ChangeAnim]
type = ChangeAnim
triggerAll = var(40) = 1
trigger1 = !Time && Anim = 13
value = 15
elem = 3 - AnimElemNo(0)

[State 12, Anim]
type = changeanim
triggerall = var(40) = 1
triggerall = !(anim = 761 && animtime)
trigger1 = anim = 761 && !animtime
trigger2 = anim != 15
value = 15

[State 12, End]
type = ChangeState
trigger1 = command = "holddown" && command != "holdup"
value = 10

[State 12, End]
type = ChangeState
trigger1 = !AnimTime
value = 0



;====================<WALKING>====================
[StateDef 20]
type = S
physics = S
moveType = I
sprPriority = 0

[State 20, VelSet]
type = VelSet
trigger1 = command = "holdfwd"
x = const(velocity.walk.fwd.x)

[State 20, VelSet]
type = VelSet
trigger1 = command = "holdback"
x = const(velocity.walk.back.x)

[State 20, ChangeAnim]
type = ChangeAnim
triggerAll = vel x > 0
trigger1 = Anim != 20 && Anim != 5
trigger2 = Anim = 5 && AnimElemTime(1) >= 1
value = 20

[State 20, ChangeAnim]
type = ChangeAnim
triggerAll = vel x < 0
trigger1 = Anim != 21 && Anim != 5
trigger2 = Anim = 5 && AnimElemTime(1) >= 1
value = 21

;<AI Walking>=============================
[Statedef 21]
type= S
physics=N
sprpriority= 0
ctrl= 0
facep2= 1

[State 21, Init Pos fix]
type= posset
trigger1= !time
pos y= 0
persistent= 0

[State 21, Var14Clear]
type= Varset
trigger1= !time
var(14)= 0
Persistent=0

[State 21, Var12Clear]
type= Varset
trigger1= !time
var(12)= 0
Persistent=0

[State 21, Init get random var less them 400]
type= Varset
trigger1= !time
trigger1= random<400
var(14)=1                 ;1=Random Move, 0=forced forward, -1=forced backward

[State 21, Conditions for force MoveForward at start]
type= Varset
triggerAll= !time
trigger1= BackEdgeBodyDist <= 20
trigger2= Enemynear,BackEdgeBodyDist <= 20 && !(Enemynear,Prevstateno=[5100,5299]) 
trigger3= ((Enemynear,Stateno=[5100,5299]) || P2Statetype=L || P2Movetype=H) && P2Bodydist x > 100
trigger4= NumTarget
trigger5= Enemynear,P2dist x < -20
trigger6= (var(59) = [2,4])
var(14)=0

[State 21, Conditions for force MoveBackward at start]
type= Varset
triggerAll= !time
trigger1= BackEdgeBodyDist > 60 && !NumTarget
trigger1= Random<220 + 700*((Enemynear,Prevstateno=[5100,5299]) || (Enemynear,Stateno=[5100,5299]) || P2Statetype=L)
trigger2= NumEnemy && Enemynear,vel x > 3 && random<320
trigger3= var(59) = 6 && P2Bodydist x < 60
var(14)= -1

[State 21, INIT Move Var]
type= Varset
trigger1= !time && var(14)=1
var(12)= 0

[State 21, add random Move Var]
type= Varset
trigger1= var(14)=1 && var(12)<1
var(12)= 60+random%41

[State 21, consume Move var]
type= Varadd
trigger1= var(14)=1
trigger1= var(12)>0
var(12)= -1

[State 21, Force move back]
type= Varset
triggerall= var(14) != -1 && time
trigger1= P2Bodydist x<50 && (P2Statetype=L || (P2StateNo=[5100,5299]))
trigger2= NumTarget(1430)
trigger2= P2Bodydist x < 20
trigger3= var(59) = 6 && P2Bodydist x < 60
;5300 move to jump pos
trigger4= var(59) = 5300 && Enemynear,Anim != 5300
trigger4= P2bodydist x < 55
trigger4= (BackEdgeBodydist + P2Bodydist x) > 55
var(14)= -1

[State 21, Force move forward]
type= Varset
triggerall= var(14) != 0 && time
trigger1= NumTarget(1430)
trigger1= P2Bodydist x > 35
trigger2= (var(59) = [2,4])
trigger3= var(59) = 5300 && Enemynear,Anim = 5300
trigger3= P2bodydist x > 2
trigger4= var(59) = 5300 && Enemynear,Anim != 5300
trigger4= P2bodydist x > 70 || (BackEdgeBodydist + P2Bodydist x) <= 55
var(14)= 0

[State 21, Move Forward]
type = VelSet
trigger1= !time && var(14)= 0
trigger2= Var(14)=1 && Var(12)>=30
trigger3= time && NumTarget(1310) && var(14) = 0
trigger4= Anim = 21 && var(14) = 0
x = const(velocity.walk.fwd.x) * const(size.xscale)

[State 21, Move Backward]
type = VelSet
trigger1= !time && var(14)= -1
trigger2= Var(14)=1 && Var(12)<30
trigger3= time && NumTarget(1310) && var(14) = -1
trigger4= Anim = 20 && var(14) = -1
x = const(velocity.walk.back.x) * const(size.xscale)

[State 21, 3]
type = ChangeAnim
triggerall = vel x > 0
trigger1 = Anim != 20 && Anim != 5
trigger2 = Anim = 5 && AnimTime = 0
value = 20

[State 21, 4]
type = ChangeAnim
triggerall = vel x < 0
trigger1 = Anim != 21 && Anim != 5
trigger2 = Anim = 5 && AnimTime = 0
value = 21

[State 21, Exit to 0]
type = changestate
triggerall = !((var(59) = [2,4]) || var(59) = 6) || (P2Bodydist x < -10 && Anim = 20) || P2Dist x < 0
triggerall = P2MoveType != H || P2Dist x < 0
trigger1 = !NumTarget
trigger1 = p2bodydist x <= 60 && (random < ifelse((Enemynear,vel x<-1),20,200))
trigger1 = P2StateNo<5000 && P2Movetype!=H
trigger2 = p2dist x < 0
trigger3 = time && vel x>0 && FrontEdgeBodyDist <= 40
trigger4 = time && vel x<0 && BackEdgeBodyDist < 20
trigger5 = enemy,numproj > 0
trigger6 = InGuardDist
trigger7 = roundstate != 2
trigger8 = (P2Stateno=[5100,5299]) && P2Bodydist x <30
trigger9 = p2bodydist x < 10 && !NumTarget
value = 0
ctrl = 1

[State 21, Exit to 0 safe]
type = changestate
trigger1 = RoundState != 2
value = 0
ctrl = 1

;====================<A.I. JUMPING>====================
;Jumping
[StateDef 39]
type = S
physics = S
moveType = I
anim = ifElse(var(40) = 1, 48, 40)
ctrl = 0
velSet = 0,0
sprPriority = 1
faceP2 = 1

[State 39, Direction Forward or backward]
type = VarSet
trigger1 = !time && AILevel
sysvar(1) = IfElse(Enemynear,Ctrl || (P2StateNo = [0,105]),0,IfElse((P2StateNo = [5030,5120]),-1,1))

[State 39, Force forward]
type = VarSet
trigger1 = !time && AILevel
trigger1 = var(59) = 1240 || var(59) = 5300
sysvar(1) = 1

[State 39, Force up]
type = VarSet
trigger1 = !time && AILevel
trigger1 = var(59) = 3200
sysvar(1) = 0

[State 39, High Jump (AI)]
type = VarSet
trigger1 = !Time && AILevel && var(59) = 0
var(3) = ifElse((P2BodyDist x >= 170 || Random < (125 * (AILevel ** 2 / 64.0))), 3, 0)

[State 39, Low Jump (AI)]
type = VarSet
triggerall = !time && AILevel && (var(3) != [1,2]) && Random < 200
trigger1 = P2Bodydist x = [120,60]
var(3) = ifElse((var(3) = 3 && sysvar(1)), 2, 1)

[State 39, Low Jump (stand jump)]
type = VarSet
triggerall = !time && AILevel && sysvar(1) = 0
trigger1 = P2Bodydist x < 70
var(3) = 1

[State 39, Force Normal jump TASK]
type = varset
trigger1 = !Time && var(59) = 3200
var(3) = 0

[State 39, Force High jump TASK]
type = varset
triggerall = !Time
trigger1 = var(59) = 5300
trigger1 = P2Bodydist x >= 115
var(3) = 3

[State 39, High Jump]
type = VarSet
trigger1 = !Time && PrevStateNo = 100
var(3) = 3

[State 39, Jump Sound]
type = PlaySnd
trigger1 = !AnimTime
value = ifElse((var(3) = [2,3]), 41, 40), 0

[State 39, Dust Helper]
type = Helper
trigger1 = !AnimTime
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
ownPal = 1

[State 39, Velocity: Normal Jump]
type = VelSet
trigger1 = !AnimTime
x = ifElse(!sysvar(1), const(velocity.jump.neu.x), ifElse(sysvar(1) = 1, const(velocity.jump.fwd.x), const(velocity.jump.back.x)))
y = const(velocity.jump.y)

[State 39, Velocity: Low Jump]
type = VelSet
trigger1 = !AnimTime && var(3) = 1
x = ifElse(!sysvar(1), const(velocity.jump.neu.x), ifElse(sysvar(1) = 1, const(velocity.jump.fwd.x), const(velocity.jump.back.x)))
y = 0.8 * const(velocity.jump.y)

[State 39, Velocity: Long Low Jump]
type = VelSet
trigger1 = !AnimTime && var(3) = 2
x = ifElse(!sysvar(1), const(velocity.jump.neu.x), ifElse(sysvar(1) = 1, const(velocity.runjump.fwd.x), const(velocity.runjump.back.x)))
y = 0.75 * const(velocity.jump.y)

[State 39, Velocity: Long Jump]
type = VelSet
trigger1 = !AnimTime && var(3) = 3
x = ifElse(!sysvar(1), const(velocity.jump.neu.x), ifElse(sysvar(1) = 1, const(velocity.runjump.fwd.x), const(velocity.runjump.back.x)))
y = ifElse(!sysvar(1), const(velocity.runjump.y), const(velocity.jump.y))

[State 39, VelMul]
type = VelMul
trigger1 = !AnimTime && var(40)
x = ifElse(var(40) = 1, 0.95,1)
y = 1.01

[State 39, End]
type = ChangeState
trigger1 = !AnimTime
value = 50
ctrl = 1



;====================<Human JUMPING>====================
;Jumping
[StateDef 40]
type = S
physics = S
moveType = I
anim = ifElse(var(40) = 1, 48, 40)
ctrl = 0
velSet = 0,0
sprPriority = 1
faceP2 = 1

[State 40, If AI Use this state to go walk]
type = ChangeState
trigger1 = AILevel
value = 21

[State 40, Direction]
type = VarSet
trigger1 = !AILevel
sysvar(1) = ifElse(!Time, 0, ifElse(command = "holdfwd", 1, ifElse(command = "holdback", -1, sysvar(1))))

[State 40, High Jump]
type = VarSet
trigger1 = !Time && !AILevel
var(3) = ifElse(command = "highjump", 3, 0)

[State 40, High Jump]
type = VarSet
trigger1 = !Time && PrevStateNo = 100
var(3) = 3

[State 40, Low Jump]
type = VarSet
trigger1 = !AILevel && command != "holdup" && (var(3) != [1,2])
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
x = ifElse(!sysvar(1), const(velocity.jump.neu.x), ifElse(sysvar(1) = 1, const(velocity.jump.fwd.x), const(velocity.jump.back.x)))
y = const(velocity.jump.y)

[State 40, Velocity: Low Jump]
type = VelSet
trigger1 = !AnimTime && var(3) = 1
x = ifElse(!sysvar(1), const(velocity.jump.neu.x), ifElse(sysvar(1) = 1, const(velocity.jump.fwd.x), const(velocity.jump.back.x)))
y = 0.8 * const(velocity.jump.y)

[State 40, Velocity: Long Low Jump]
type = VelSet
trigger1 = !AnimTime && var(3) = 2
x = ifElse(!sysvar(1), const(velocity.jump.neu.x), ifElse(sysvar(1) = 1, const(velocity.runjump.fwd.x), const(velocity.runjump.back.x)))
y = 0.75 * const(velocity.jump.y)

[State 40, Velocity: Long Jump]
type = VelSet
trigger1 = !AnimTime && var(3) = 3
x = ifElse(!sysvar(1), const(velocity.jump.neu.x), ifElse(sysvar(1) = 1, const(velocity.runjump.fwd.x), const(velocity.runjump.back.x)))
y = ifElse(!sysvar(1), const(velocity.runjump.y), const(velocity.jump.y))

[State 40, VelMul]
type = VelMul
trigger1 = !AnimTime && var(40)
x = ifElse(var(40) = 1, 0.95,1)
y = 1.01


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

[State 50, Gravity]
type = Gravity
trigger1 = Time >= 1 || PrevStateNo != 40

[State 50, Landing]
type = ChangeState
trigger1 = pos y > -vel y
value = 52


[StateDef 51]
type = A
physics = N
moveType = I
sprPriority = 1

[State 51, Gravity]
type = Gravity
trigger1 = 1

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

[State 52, From Shoryuken]
type = ChangeState
trigger1 = !time && (PrevStateNo = 1100 || PrevStateNo = 1130)
value = 1105

[State 52, From Tatsumaki]
type = ChangeState
trigger1 = !time && (PrevStateNo = 1200 || PrevStateNo = 1230 || PrevStateNo = 3200)
value = 1205

[State 52, From SUPER SHORYUKEN]
type = ChangeState
triggerall = !time
trigger1 =PrevStateNo = 3000
trigger2 =PrevStateNo = 3100
value = 3001 + 110*(var(40)=2 && PrevStateNo = 3100)

[State 52, From SF4 Ultra]
type = ChangeState
triggerall = !time
trigger1 = PrevStateNo = [3300,3399]
value = 3320

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
trigger1 = Time = 1 && PrevStateNo < 1000
trigger2 = Time = 1 && Anim != 57
value = 1

[State 52, ChangeState to Guarding]
type = ChangeState
trigger1 = ctrl && command = "holdback"
trigger1 = InGuardDist && PrevStateNo < 600
value = 120

[State 52, Assert: NoWalk]
type = AssertSpecial
trigger1 = 1
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
trigger1 = Anim != 5 && var(40) != 1
value = 5

[State 52, ChangeAnim to Turning]
type = ChangeAnim
trigger1 = ctrl && P2Dist x < 0
trigger1 = Anim != 7 && var(40) = 1
value = 7

[State 52, Turn]
type = Turn
trigger1 = Anim = 5 && AnimElem = 1
trigger2 = Anim = 7 && AnimElem = 1

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
trigger1 = (AnimElem = 2 || AnimElem = 5)
value = 100, ifElse((AnimElem = 2), 0, 1)

[State 100, Jump]
type = ChangeState
trigger1 = !AILevel
trigger1 = command = "holdfwd" && command = "holdup"
value = 40

[State 100, End]
type = ChangeState
trigger1 = !AILevel && command != "holdfwd"
trigger2 = AILevel && P2StateType = A
trigger2 = P2Bodydist x < -10
trigger3 = AILevel && P2StateType != A && P2Bodydist x < 1 && time > 2
trigger4 = AILevel && P2StateType != A && (Enemynear,ctrl || StateNo = 21) && P2Bodydist x < 100
trigger4 = Random < (10 + 100*P2Bodydist x < 80 - 90*P2Bodydist x < 40)
trigger5 = AILevel && P2StateType != A && !(Enemynear,ctrl || StateNo = 21) && P2Bodydist x < 30 && !(var(59) = [3,4])
trigger6 = Roundstate != 2
trigger7 = AILevel && (P2Bodydist x = [90,110]) && (Enemynear,Ctrl || P2StateNo=21)
trigger7 = Random < 80 * (AIlevel ** 2 / 64.0)
value = 101


;Stop Running
[StateDef 101]
type = S
physics = S
moveType = I
anim = 101
Ctrl = Ifelse(AILevel,1,0)
sprPriority = 1

[State 101, Stopping Sound]
type = PlaySnd
trigger1 = !Time
value = 101,0

[State 101, Skid Dust]
type = Explod
trigger1 = !Time
anim = 8104
sprPriority=3
posType = P1
pos = 0,0
vel = 0,0
scale = 0.5,0.5
pauseMovetime = -1
superMoveTime = -1
ownpal = 1

[State 101, Jump]
type = ChangeState
trigger1 = !AILevel && command = "holdup"
value = 40

[State 101, End]
type = ChangeState
trigger1 = !AnimTime
value = ifElse(command = "holddown", 10, 0)
ctrl = 1



;========================<DASH BACKWARDS>==========================
[StateDef 105]
type = A
physics = S
moveType = I
velSet = 0,0
anim = ifElse(var(40) = 1, 107, 105)
ctrl = 0
sprPriority = 1

[State 105, HB]
type = Hitby
trigger1 = Anim = 105
value = SA,AA,AP

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
type = S
physics = S
moveType = I
anim = ifElse(var(40) = 1, 112, 110)
ctrl = 0
sprPriority = 1

[State 110, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x = -1.33 * const(velocity.run.back.x)
y = const(velocity.run.back.y)

[State 110, VelMul]
type = VelMul
trigger1 = AnimElemTime(2) > 0
x = 0.98

[State 110, Dash Sound]
type = PlaySnd
trigger1 = !Time
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
triggerAll = Time <= 10
trigger1 = !AILevel && command != "holdfwd"
trigger2 = AILevel && (Enemynear,ctrl || P2StateNo < 100)
trigger2 = P2Bodydist x < 70
trigger3 = AILevel && NumTarget(1430)
sysvar(1) = 0

[State 110, ChangeState to Running]
type = ChangeState
trigger1 = Time = 10 && sysvar(1)
value = 100

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

;==========< PARRY >==========
;--- STANDING ---
[Statedef 700]
type = S
physics = S
movetype = I
anim = 760
velset = 0, 0
ctrl = 0
sprpriority = 0
poweradd = 78
facep2 = 1

[State 700, HB]
type = hitby
trigger1 = time<4
value = SCA, AT
time = 1

[State 700, Stop]
type = posfreeze
trigger1 = !time
value = 1

[State 700, NoShake]
type = envshake
trigger1 = !time
time = 0
freq = 0
ampl = 0

[State 700, Back]
type = posadd
trigger1 = !time
trigger1 = GetHitvar(animtype) > 1
x = -2

[State 700, Pause]
type = pause
trigger1 = !time && numenemy
time = 20-ifelse((GetHitVar(animtype)=[3,5]),4,GetHitVar(animtype))-ifelse(GetHitVar(hitshaketime)>16,16,GetHitVar(hitshaketime))
movetime = 20-ifelse((GetHitVar(animtype)=[3,5]),4,GetHitVar(animtype))-ifelse(GetHitVar(hitshaketime)>16,16,GetHitVar(hitshaketime))
endcmdbuftime = 20-ifelse((GetHitVar(animtype)=[3,5]),4,GetHitVar(animtype))-ifelse(GetHitVar(hitshaketime)>16,16,GetHitVar(hitshaketime))
pausebg = 0

[State 700, blueflash]
type=palfx
triggerall= var(21)<=3
trigger1= time<16 && time%2=0
add=50,50,250
time=1
color=100

[State 700, redflash]
type=palfx
triggerall= var(21)>3
trigger1= time<16 && time%8=0
add=80,20,0
mul=240,150,60
time=4
color=0

[State 700, Snd]
type = playsnd
trigger1 = !time
value = 4,1+10*(var(40)=1)
channel = 0

[State 700, Snd]
type = playsnd
trigger1 = !time
value = 760, 0

[State 700, Spark]
type = explod
trigger1 = animelem = 2
anim = 8360
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
flag1 = nostandguard
flag2 = nocrouchguard

[State 700, ChangeState]
type = ChangeState
triggerall = !AILevel
triggerall = command = "holdback"
triggerall = inguarddist
trigger1 = AnimElemtime(2)>=15
value = 120

[State 700, Ctrl]
type = Ctrlset
trigger1 = time = 15
value = 1

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
anim = 761
velset = 0, 0
ctrl = 0
sprpriority = 2
poweradd = 78
facep2 = 1

[State 701, HB]
type = hitby
trigger1 = time < 4
value = SCA, AT
time = 1

[State 701, Stop]
type = posfreeze
trigger1 = !time
value = 1

[State 701, NoShake]
type = envshake
trigger1 = !time
time = 0
freq = 0
ampl = 0

[State 701, Back]
type = posadd
trigger1 = !time
trigger1 = GetHitvar(animtype) > 1
x = -8

[State 701, Pause]
type = pause
trigger1 = !time && numenemy
time = 20-ifelse((GetHitVar(animtype)=[3,5]),4,GetHitVar(animtype))-ifelse(GetHitVar(hitshaketime)>16,16,GetHitVar(hitshaketime))
movetime = 20-ifelse((GetHitVar(animtype)=[3,5]),4,GetHitVar(animtype))-ifelse(GetHitVar(hitshaketime)>16,16,GetHitVar(hitshaketime))
endcmdbuftime = 20-ifelse((GetHitVar(animtype)=[3,5]),4,GetHitVar(animtype))-ifelse(GetHitVar(hitshaketime)>16,16,GetHitVar(hitshaketime))
pausebg = 0

[State 701, blueflash]
type=palfx
triggerall= var(21)<=3
trigger1= time<16 && time%2=0
add=50,50,250
time=1
color=100

[State 701, redflash]
type=palfx
triggerall= var(21)>3
trigger1= time<16 && time%8=0
add=80,20,0
mul=240,150,60
time=4
color=0

[State 701, Snd]
type = playsnd
trigger1 = !time
value = 4,1+10*(var(40)=1)
channel = 0

[State 701, Snd]
type = playsnd
trigger1 = !time
value = 760, 0

[State 701, Spark]
type = explod
trigger1 = animelem = 2
anim = 8360
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
flag1 = nostandguard
flag2 = nocrouchguard

[State 701, ChangeState]
type = ChangeState
triggerall = !AILevel
triggerall = command = "holdback"
triggerall = inguarddist
trigger1 = AnimElemtime(2)>=15
value = 120

[State 701, Ctrl]
type = Ctrlset
trigger1 = time = 15
value = 1


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
anim = 762
ctrl = 0
sprpriority = 2
poweradd = 78
facep2 = 1

[State 702, HB]
type = hitby
trigger1 = time < 4
value = SCA, AT
time = 1

[State 702, NoShake]
type = envshake
trigger1 = !time
time = 0
freq = 0
ampl = 0

[State 702, Pause]
type = pause
trigger1 = !time && numenemy
time = 20-ifelse((GetHitVar(animtype)=[3,5]),4,GetHitVar(animtype))-ifelse(GetHitVar(hitshaketime)>16,16,GetHitVar(hitshaketime))
movetime = 20-ifelse((GetHitVar(animtype)=[3,5]),4,GetHitVar(animtype))-ifelse(GetHitVar(hitshaketime)>16,16,GetHitVar(hitshaketime))
endcmdbuftime = 20-ifelse((GetHitVar(animtype)=[3,5]),4,GetHitVar(animtype))-ifelse(GetHitVar(hitshaketime)>16,16,GetHitVar(hitshaketime))
pausebg = 0

[State 702, Type]
type = statetypeset
trigger1 = time < 15
physics = N

[State 702, Stop]
type = posfreeze
trigger1 = time < 14
value = 1

[State 702, Vel]
type = velset
trigger1 = time = 15
x = ifelse(vel x > 2, 2, ifelse(vel x < -2, -2, vel x))
y = ifelse(vel y < -2, vel y, -3)

[State 702, Type]
type = statetypeset
trigger1 = time >= 15
physics = A

[State 702, blueflash]
type=palfx
triggerall= var(21)<=3
trigger1= time<16 && time%2=0
add=50,50,250
time=1
color=100

[State 702, redflash]
type=palfx
triggerall= var(21)>3
trigger1= time<16 && time%8=0
add=80,20,0
mul=240,150,60
time=4
color=0

[State 702, Snd]
type = playsnd
trigger1 = !time
value = 4,1+10*(var(40)=1)
channel = 0

[State 702, Snd]
type = playsnd
trigger1 = !time
value = 760, 0

[State 702, Spark]
type = explod
trigger1 = anim = 762
trigger1 = animelem = 2
anim = 8360
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

[State 702, land anim]
type = ChangeAnim
trigger1 = anim = 762 && !animtime
value = 42
elem = 7

[State 702, ChangeState]
type = ChangeState
triggerall = !AILevel
triggerall = command = "holdback"
triggerall = inguarddist
trigger1 = AnimElemtime(2)>=15
value = 120

[State 702, Ctrl]
type = ctrlset
trigger1 = time = 15
value = 1


;====================<DODGE>====================
[StateDef 765]
type = S
physics = S
moveType = I
anim = 700
ctrl = 0
velSet = 0,0
sprPriority = -2

[State 765, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = 4, ifElse(var(40) = 1, 10, 2)
channel = 0

[State 765, Dodge Sound]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1,3
channel = 1

[State 765, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0
ignoreHitPause = 1

[State 765, HitBy]
type = HitBy
trigger1 = 1
value = SCA,AT
time = 1

[State 765, Attack]
type = ChangeState
trigger1 = !AILevel && Time = [15,25]
trigger1 = command = "x" || command = "y" || command = "z" || command = "a" || command = "b" || command = "c"
value = ifElse((command = "x" || command = "y" || command = "z"), 225, 250)

[State 765, Attack (AI)]
type = ChangeState
trigger1 = AILevel && (Time = [15,25]) && NumEnemy
trigger1 = (EnemyNear, MoveType != A) && (P2BodyDist x = [-60,60]) && (P2Dist y >= -60)
value = ifElse(Random < 666, 225, 250)

[State 765, End]
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
trigger1 = AnimElemTime(8) < 0
value = SCA,AT
time = 1

[State 710, Voice]
type = PlaySnd
trigger1 = var(40) != 1
trigger1 = AnimElem = 1
value = 4, ifElse(Random < 500, 1, 0)
channel = 0

[State 710, Voice (Violent]
type = PlaySnd
trigger1 = var(40) = 1
trigger1 = AnimElem = 1
value = 4, ifElse(Random < 500, 11, 10)
channel = 0

[State 710, Roll Sound]
type = PlaySnd
trigger1 = Time = 1
value = 110,0
channel = 1

[State 710, Start Roll]
type = VelSet
trigger1 = AnimElem = 2
x = 6.6 * ifElse(var(40) = 1, 0.76666, 1)

[State 710, End Roll]
type = VelSet
trigger1 = AnimElem = 7
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
trigger1 = AnimElemTime(8) < 0
value = SCA,AT
time = 1

[State 715, Voice]
type = PlaySnd
trigger1 = var(40) != 1
trigger1 = AnimElem = 1
value = 4, ifElse(Random < 500, 1, 0)
channel = 0

[State 715, Voice (Violent]
type = PlaySnd
trigger1 = var(40) = 1
trigger1 = AnimElem = 1
value = 4, ifElse(Random < 500, 11, 10)
channel = 0

[State 715, Roll Sound]
type = PlaySnd
trigger1 = Time = 1
value = 110,0
channel = 1

[State 715, Start Roll]
type = VelSet
trigger1 = AnimElem = 2
x = -6.6 * ifElse(var(40) = 1, 0.76666, 1)

[State 715, End Roll]
type = VelSet
trigger1 = AnimElem = 7
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
triggerall = var(40) < 2
triggerAll = Power < const(data.power) && Power < PowerMax
trigger1 = !AILevel && (command = "holdb" && command = "holdy")
trigger2 = AILevel
value = 2 + ifElse(time < 60, 0, (time - 60) / 10)

[State 730, PowerAdd]
type = PowerAdd
triggerall = var(40) > 1
triggerAll = Power < const(data.power) && Power < PowerMax
trigger1 = !AILevel && (command = "holdb" && command = "holdy")
trigger2 = AILevel
value = 2 + (time / 10)

[State 730, Voice]
type = PlaySnd
trigger1 = !Time && var(40) != 1
value = 730,1
channel = 0

[State 730, Voice]
type = PlaySnd
trigger1 = !Time && var(40) = 1
value = 1250,0
channel = 0

[State 730, Character Flash]
type = PalFX
trigger1 = 1
time = 1
add = 75 + ceil(sin(Time / 6.0 * pi) * 75),25 + ceil(sin(Time / 6.0 * pi) * 25),0

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
trigger1 = Power >= PowerMax || RoundState != 2
trigger2 = !AILevel && (command != "holdb" || command != "holdy")
trigger3 = AILevel && (InGuardDist || P2BodyDist x <= 120)
trigger4 = AILevel && var(59)
value = 731


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
value = 810,10
channel = 0
persistent = 0


[State 731, End]
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
var(10) = (command = "Counter_K")
ignoreHitPause = 1

[State 750, Button (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2StateType = A), 0, ifElse((P2StateType = C), 1, ifElse(Random < 400, 0, 1)))
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
value = 4,ifElse(var(40) = 1, 11, 2)
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
value = ifElse(var(10) = 1, 450, 1100)



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
value = 4,ifElse(var(40) = 1, 11, 2)
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
value = 4,ifElse(var(40) = 1, 11, 2)
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
trigger1 = !time
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
value = 4,ifElse(var(40) = 1, 11, 2)
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

[State 763, Gravity]
type = Gravity
trigger1 = 1

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
anim = ifElse(var(40) = 1 , 901, 900)
velSet = 0,0
ctrl = 0
sprPriority = 2

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
trigger1 = !time
var(20) = 300

[State 900, Power add]
type = poweradd
trigger1 = !time
value = -1500

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
trigger1= !AnimTime
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


;Air Version===============
[Statedef 905]
type = A
physics = N
moveType = A
anim = 905
ctrl = 0
sprPriority = 2

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

[State 905, Custom Combo Time]
type = VarSet
trigger1 = !time
var(20) = IfElse(Power>=3000,600,300)

[State 905, Power add]
type = poweradd
trigger1 = !time
value = IfElse(var(20)>300,-3000,-1500)

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

[State 906, Gravity]
type = Gravity
trigger1 = 1

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
trigger1 = Anim = 5035
value = 5050

[State 5205, VelAdd]
type = VelAdd
trigger1 = 1
y = GetHitVar(yAccel)

[State 5205, Ground]
type = selfstate
trigger1 = vel y > 0 && var(39) = 0
trigger1 = pos y >= const(movement.air.gethit.groundrecover.ground.threshold)
value = 5200

[State 5205, Air]
type = selfstate
trigger1 = time >= 60 && var(39) = 0
value = 5210

[State 5205, Safe]
type = selfstate
trigger1 = pos y > 0
value = 5100




;==========<FALL RECOVERY>==========
[StateDef 5200]
type = A
moveType = H
physics = N

[State 5200, Dizzy fix]
type = SelfState
trigger1 = var(39) = 1
value = 5050

[State 5200, ChangeAnim]
type = ChangeAnim
trigger1 = Anim = 5035 && !AnimTime
value = 5050

[State 5200, VelAdd]
type = VelAdd
trigger1 = 1
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

[State 5200, Dizzy fix]
type = SelfState
trigger1 = var(39) = 1
value = 5050

[State 5201, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 5201, VelSet]
type = VelSet
trigger1 = !Time
x = -8
y = 0

[State 5201, VelMul]
type = VelMul
trigger1 = 1
x = 0.9

[State 5201, Voice]
type = PlaySnd
trigger1 = !Time
value = 4,2 + 9 * (var(40) = 1)
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

[State 5200, Dizzy fix]
type = SelfState
trigger1 = var(39) = 1
value = 5050

[State 5210, Gravity]
type = VelAdd
trigger1 = 1
y = 0.6 * const(size.yscale)

[State 5210, VelSet]
type = VelSet
trigger1 = !Time
x= ifelse(command="holdfwd",-1.33,-4) * const(size.xscale)
y= -7.55 * const(size.yscale)

[State 5210, Voice]
type = PlaySnd
trigger1 = !Time
value = 4,1
channel = 0

[State 5210, Recover Sound]
type = PlaySnd
trigger1 = !Time
value  = 5200,0

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
trigger1 = AnimElemTime(8) < 0
value = SCA
time = 1

[State 5210, CtrlSet]
type = CtrlSet
trigger1 = AnimElemTime(8) >= 0
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
trigger1 = !AILevel && StateType = S && command = "holddown"
trigger2 = AILevel && StateType = S && (EnemyNear, MoveType = A) && (EnemyNear, StateType = C)
stateType = C
physics = C

[State 120, Crouching to Stand]
type = StateTypeSet
trigger1 = !AILevel && StateType = C && command != "holddown"
trigger2 = AILevel && StateType = C && (EnemyNear, MoveType = A) && (EnemyNear, StateType != C)
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
trigger1 = (!AILevel && command != "holdback")
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
trigger1 = !AILevel && command = "holddown"
trigger2 = AILevel && Random < (250 * (AILevel ** 2 / 64.0))
trigger2 = (EnemyNear, MoveType = A) && (EnemyNear, StateType = C)
value = 131

[State 130, Stop Guarding]
type = ChangeState
trigger1 = (!AILevel && command != "holdback")
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
trigger1 = !AILevel && command != "holddown"
trigger2 = AILevel && Random < (125 * (AILevel ** 2 / 64.0))
trigger2 = (EnemyNear, MoveType = A) && (EnemyNear, StateType != C)
value = 130

[State 131, AI Fix]
type = CtrlSet
trigger1 = AILevel && NumEnemy
value = (EnemyNear, Time >= 120 || Time >= 180)

[State 131, Stop Guarding]
type = ChangeState
trigger1 = (!AILevel && command != "holdback")
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
trigger1 = 1
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
trigger1 = (!AILevel && command = "holdback") || AILevel
value = 130

[State 132, Change to Falling]
type = ChangeState
trigger1 = sysvar(0)
value = 52

[State 132, Stop Guarding]
type = ChangeState
trigger1 = (!AILevel && command != "holdback")
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
trigger1 = !AILevel && StateType = S && command = "holddown"
trigger2 = AILevel && Random < (250 * (AILevel ** 2 / 64.0))
trigger2 = StateType = S && (EnemyNear, MoveType = A) && (EnemyNear, StateType = C)
stateType = C
physics = C

[State 140, Crouching to Standing]
type = StateTypeSet
trigger1 = !AILevel && StateType = C && command != "holddown"
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
value = 151 + 2 * ((!AILevel && command = "holddown") || (AILevel && (EnemyNear, MoveType = A) && (EnemyNear, StateType = C)))

[State 150, Standing to Crouching]
type = StateTypeSet
trigger1 = !AILevel && StateType = S && command = "holddown"
trigger2 = AILevel && Random < (250 * (AILevel ** 2 / 64.0))
stateType = C
physics = C

[State 150, Crouching to Standing]
type = StateTypeSet
trigger1 = !AILevel && StateType = C && command != "holddown"
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
trigger1 = !AILevel && StateType = S && command = "holddown"
trigger2 = AILevel && Random < (250 * (AILevel ** 2 / 64.0))
trigger2 = StateType = S && (EnemyNear, MoveType = A) && (EnemyNear, StateType = C)
stateType = C
physics = C

[State 151, Crouching to Standing]
type = StateTypeSet
trigger1 = !AILevel && StateType = C && command != "holddown"
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
value = 151 + 2 * ((!AILevel && command = "holddown") || (AILevel && (EnemyNear, MoveType = A) && (EnemyNear, StateType = C)))

[State 152, Standing to Crouching]
type = StateTypeSet
trigger1 = !AILevel && statetype = S && command = "holddown"
trigger2 = AILevel && Random < (250 * (AILevel ** 2 / 64.0))
trigger2 = StateType = S && (EnemyNear, MoveType = A) && (EnemyNear, StateType = C)
stateType = C
physics = C

[State 152, Crouching to Standing]
type = StateTypeSet
trigger1 = !AILevel && StateType = C && command != "holddown"
trigger2 = AILevel && Random < (125 * (AILevel ** 2 / 64.0))
trigger2 = StateType = C && (EnemyNear, MoveType = A) && (EnemyNear, StateType != C)
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
trigger1 = !AILevel && StateType = S && command = "holddown"
trigger2 = AILevel && Random < (250 * (AILevel ** 2 / 64.0))
trigger2 = StateType = S && (EnemyNear, MoveType = A) && (EnemyNear, StateType = C)
stateType = C
physics = C

[State 153, Crouching to Standing]
type = StateTypeSet
trigger1 = !AILevel && StateType = C && command != "holddown"
trigger2 = AILevel && Random < (125 * (AILevel ** 2 / 64.0))
trigger2 = StateType = C && (EnemyNear, MoveType = A) && (EnemyNear, StateType != C)
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
trigger1 = 1
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
trigger1 = (!AILevel && command = "holdback") || AILevel
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

[State 5901, Intro vs A Morrigan]
type = ChangeState
triggerall = numenemy
triggerall = !(TeamMode = Simul) && !(Enemy, TeamMode = Simul)
trigger1 = Enemy,Name = "Morrigan_Aensland"
trigger1 = Enemy,AuthorName = "BeterHans"
trigger1 = Enemy,var(32)
value = 110630


[State 5901, Intro with Ken as partner]
type = ChangeState
triggerall = var(40) != 1 && numenemy
triggerall = RoundNo = 1 || (!(Enemy, RoundsExisted) && !(TeamMode = Simul) && !(Enemy, TeamMode = Simul))
triggerall = TeamMode = Simul
trigger1 = Partner,Name = "Ryu"
trigger1 = Partner,AuthorName = "Phantom.of.the.Server"
trigger1 = Partner,var(1) != 2
value = IFElse(Random<200,6910,189)


[State 5901, vs Ryu (P2 side)]
type = ChangeState
triggerall = var(40) != 1
triggerall = NumEnemy
trigger1 = RoundNo = 1 || (!(Enemy, RoundsExisted) && !(TeamMode = Simul) && !(Enemy, TeamMode = Simul))
trigger1 = !(TeamMode = Simul) && !(Enemy, TeamMode = Simul)
trigger1 = Enemy, AuthorName = "Phantom.of.the.Server" && Enemy, Name = "Ryu" && (Enemy, var(1) != 2)
trigger1 = Enemy, StateNo = [192,193]
value = ifElse(Enemy, StateNo = 192, 193, 194)

[State 5901, vs Ryu (P1 side)]
type = ChangeState
triggerall = var(40) != 1
triggerall = NumEnemy
trigger1 = RoundNo = 1; || (!(Enemy, RoundsExisted) && !(TeamMode = Simul) && !(Enemy, TeamMode = Simul))
trigger1 = !(TeamMode = Simul) && !(Enemy, TeamMode = Simul)
trigger1 = Enemy, AuthorName = "Phantom.of.the.Server" && Enemy, Name = "Ryu" && (Enemy, var(1) != 2)
value = 193 + (Random % 2)

[State 5901, vs Terry Bogard]
type = ChangeState
trigger1 = var(40) != 1
trigger1 = NumEnemy
trigger1 = RoundNo = 1
trigger1 = Enemy, AuthorName = "vyn" && Enemy, Name = "Terry"
value = 199

[State 5901, vs Intro vs Violent Ken]
type = ChangeState
triggerAll = var(40) != 1
triggerAll = NumEnemy
triggerAll = RoundNo = 1 && (!(Enemy, RoundsExisted) && !(TeamMode = Simul) && !(Enemy, TeamMode = Simul))
triggerAll = Enemy, AuthorName = "Phantom.of.the.Server&Jmorphman" && Enemy, Name = "Ken Masters"
trigger1 = Enemy, StateNo = 5972
value = 5971

[State 5901, vs Intro vs Ken (Violent)]
type = ChangeState
triggerAll = var(40) = 1
triggerAll = NumEnemy
triggerAll = RoundNo = 1 && (!(Enemy, RoundsExisted) && !(TeamMode = Simul) && !(Enemy, TeamMode = Simul))
triggerAll = Enemy, AuthorName = "Phantom.of.the.Server&Jmorphman" && Enemy, Name = "Ken Masters"
trigger1 = Enemy, StateNo = 5971
value = 5972

[State 5901, vs Intro vs Vega (Violent)]
type = ChangeState
trigger1 = var(40) = 1
trigger1 = NumEnemy
trigger1 = RoundNo = 1 && (!(Enemy, RoundsExisted) && !(TeamMode = Simul) && !(Enemy, TeamMode = Simul))
trigger1 = Enemy, AuthorName = "Phantom.of.the.Server" && Enemy, Name = "Vega"
value = 5982

[State 5901, vs Intro vs Evil Ryu (Violent)]
type = ChangeState
triggerAll = var(40) = 1
triggerAll = NumEnemy
triggerAll = RoundNo = 1 && (!(Enemy, RoundsExisted) && !(TeamMode = Simul) && !(Enemy, TeamMode = Simul))
triggerAll = Enemy, AuthorName = "Phantom.of.the.Server" && Enemy, Name = "Ryu" && (Enemy, var(1) = 2)
trigger1 = Enemy, StateNo = 5982
value = 5983

[State 5901, vs Intro vs Guile (Master)]
type = ChangeState
triggerAll = var(40) = 2
triggerAll = NumEnemy
triggerAll = RoundNo = 1 || (!(Enemy, RoundsExisted) && !(TeamMode = Simul) && !(Enemy, TeamMode = Simul))
trigger1 = Enemy, Name = "cvsguile" || Enemy, Name = "Guile" || Enemy, Name = "K-Guile"
value = 5984

[State 5901, Intro vs Ryu (Violent)]
type = ChangeState
trigger1 = EnemyNear, var(1) != 2
trigger1 = var(40) = 1
trigger1 = NumEnemy
trigger1 = RoundNo = 1 && (!(TeamMode = Simul) && !(Enemy, TeamMode = Simul))
trigger1 = Enemy, AuthorName = "Phantom.of.the.Server" && Enemy, Name = "Ryu"
value = 5990

[State 5901, Turns Intro]
type = ChangeState
trigger1 = TeamMode = Turns
trigger1 = !RoundsExisted && RoundNo >= 2
value = 6900

[State 5900, Intro Decider]
type = ChangeState
trigger1 = time > 1
trigger1 = RoundNo = 1 && var(40) != 1
value = 188 + (Random % 5)

[State 5900, Violent Intro]
type = ChangeState
trigger1 = time > 1
trigger1 = RoundNo = 1 && var(40) = 1
value = 5981

[State 5901, End]
type = ChangeState
trigger1 = time > 2
value = 0

;==========<INTRO vs A.Morrigan>==========
[Statedef 110630]
type=S
anim = 0

[State 110630, intro]
type=assertspecial
trigger1= 1
flag=intro

[State 110630, Morrigan Not in 630]
type = ChangeState
triggerall = time > 10
trigger1 = Enemynear,Name != "Morrigan_Aensland"
trigger2 = P2StateNo != 630
value = 0


[State 110630, intro]
type = ChangeAnim
trigger1 = time = 120
value = 110630

[State 110630 Turns]
type = Turn
triggerall = Anim = 110630
trigger1 = animelem = 2
trigger2 = animelem = 11

[State 110630, Hehe SND]
type = PlaySnd
trigger1 = Anim = 110630
trigger1 = animelem = 5
value = 9033, 2
channel = 0

[State 110630, Miss SND]
type = PlaySnd
trigger1 = Anim = 110630
trigger1 = animelem = 7
value = 5000, 0
channel = 0

[State 110630, Mask]
type = explod
trigger1 = SelfAnimExist(110631) && !NumExplod(110631)
trigger1 = Anim = 110630 && AnimElem = 5
anim = 110631
ID = 110631
postype = P1
pos = 0,0
bindtime = -1
removetime = 60
scale = Const(size.xscale),Const(size.yscale)
ownpal = 0
sprpriority = 1

[State 110630, END]
type = ChangeState
trigger1 = anim = 110630 && !animtime
value = 0


;====================<INTRO 1>====================
[StateDef 188]
type = S
physics = S
anim = 188

[State 188, Change to Intro vs Violent]
type = ChangeState
trigger1 = Enemy, var(40) = 1
trigger1 = var(40) != 1
trigger1 = NumEnemy
trigger1 = RoundNo = 1 && (!(TeamMode = Simul) && !(Enemy, TeamMode = Simul))
trigger1 = Enemy, AuthorName = "Phantom.of.the.Server&Jmorphman" && Enemy, Name = "Ken Masters"
value = 5971

[State 188, Assert: Intro]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 188, PosAdd]
type = PosAdd
trigger1 = !Time
trigger1 = PrevStateNo = 193
x = -ceil(var(10) - 110)

[State 188, PosSet]
type = PosSet
trigger1 = !Time
trigger1 = PrevStateNo = 194
x = var(10)
y = 0

[State 188, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 188,0
channel = 0

[State 188, End]
type = ChangeState
trigger1 = !AnimTime
value = 0



;====================<INTRO 2>====================
[StateDef 189]
type = S
physics = S
anim = 189

[State 189, Change to Intro vs Violent]
type = ChangeState
trigger1 = Enemy, var(40) = 1
trigger1 = var(40) != 1
trigger1 = NumEnemy
trigger1 = RoundNo = 1 && (!(TeamMode = Simul) && !(Enemy, TeamMode = Simul))
trigger1 = Enemy, AuthorName = "Phantom.of.the.Server&Jmorphman" && Enemy, Name = "Ken Masters"
value = 5971

[State 189, Assert: Intro]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 189, PosAdd]
type = PosAdd
trigger1 = !Time
trigger1 = PrevStateNo = 193
x = -ceil(var(10) - 110)

[State 189, PosSet]
type = PosSet
trigger1 = !Time
trigger1 = PrevStateNo = 194
x = var(10)
y = 0

[State 188, End]
type = ChangeState
trigger1 = !AnimTime
value = 0



;====================<INTRO 3>====================
[StateDef 190]
type = S
physics = S
anim = 190

[State 190, Change to Intro vs Violent]
type = ChangeState
trigger1 = Enemy, var(40) = 1
trigger1 = var(40) != 1
trigger1 = NumEnemy
trigger1 = RoundNo = 1 && (!(TeamMode = Simul) && !(Enemy, TeamMode = Simul))
trigger1 = Enemy, AuthorName = "Phantom.of.the.Server&Jmorphman" && Enemy, Name = "Ken Masters"
value = 5971

[State 5900, Intro Decider]
type = ChangeState
trigger1 = !Time
value = 188 + (Random % 5)

[State 190, Assert: Intro]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 190, PosAdd]
type = PosAdd
trigger1 = !Time
trigger1 = PrevStateNo = 193
x = -ceil(var(10) - 110)

[State 190, PosSet]
type = PosSet
trigger1 = !Time
trigger1 = PrevStateNo = 194
x = var(10)
y = 0

[State 190, End]
type = ChangeState
trigger1 = !AnimTime
value = 0



;====================<INTRO 4>====================
[StateDef 191]
type = S
physics = S
anim = 191
ctrl = 0

[State 191, Change to Intro vs Violent]
type = ChangeState
trigger1 = Enemy, var(40) = 1
trigger1 = var(40) != 1
trigger1 = NumEnemy
trigger1 = RoundNo = 1 && (!(TeamMode = Simul) && !(Enemy, TeamMode = Simul))
trigger1 = Enemy, AuthorName = "Phantom.of.the.Server&Jmorphman" && Enemy, Name = "Ken Masters"
value = 5971

[State 191, Assert: Intro]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 191, PosAdd]
type = PosAdd
trigger1 = !Time
trigger1 = PrevStateNo = 193
x = -ceil(var(10) - 110)

[State 191, PosSet]
type = PosSet
trigger1 = !Time
trigger1 = PrevStateNo = 194
x = var(10)
y = 0

[State 191, Voice]
type = PlaySnd
trigger1 = AnimElemTime(1) = 70
value = 191, Random % 2
channel = 0

[State 191, End]
type = ChangeState
trigger1 = !Animtime
value = 0



;====================<INTRO 5>====================
[StateDef 192]
type = S
physics = S
anim = 192
ctrl = 0

[State 191, Change to Intro vs Violent]
type = ChangeState
trigger1 = Enemy, var(40) = 1
trigger1 = var(40) != 1
trigger1 = NumEnemy
trigger1 = RoundNo = 1 && (!(TeamMode = Simul) && !(Enemy, TeamMode = Simul))
trigger1 = Enemy, AuthorName = "Phantom.of.the.Server&Jmorphman" && Enemy, Name = "Ken Masters"
value = 5971

[State 192, Assert: Intro]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 192, PosAdd]
type = PosAdd
trigger1 = !Time
trigger1 = PrevStateNo = 193
x = -ceil(var(10) - 110)

[State 192, PosSet]
type = PosSet
trigger1 = !Time
trigger1 = PrevStateNo = 194
x = var(10)
y = 0

[State 192, Whoosh Sound]
type = PlaySnd
trigger1 = AnimElem = 4
trigger2 = AnimElem = 7
value = 1,0

[State 192, Whoosh Sound]
type = PlaySnd
trigger1 = AnimElem = 12
value = 1,1

[State 191, Voice]
type = PlaySnd
trigger1 = anim = 192 && AnimElemTime(20) = 1
value = 192,0
channel = 0

[State 192, End]
type = ChangeState
trigger1 = !Animtime
value = 0



;====================<INTRO VS RYU (FIST BUMP)>====================
[StateDef 193]
type = S
moveType = I
physics = N
anim = 193
ctrl = 0

[State 193, vs Intro Decider]
type = ChangeState
trigger1 = (Enemy, var(1) = 2)
trigger1 = var(40) != 1
trigger1 = NumEnemy
trigger1 = RoundNo = 1 && (!(TeamMode = Simul) && !(Enemy, TeamMode = Simul))
trigger1 = Enemy, AuthorName = "Phantom.of.the.Server" && Enemy, Name = "Ryu"
value = 188 + (Random % 5)

[State 193, Assert: Intro]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 193, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 0,0
ignoreHitPause = 1

[State 193, Camera Helper]
type = Helper
trigger1 = !NumHelper(8999)
helpertype = Normal
stateNo = 8999
ID = 8999
name = "Camera"
posType = P1

[State 193, VarSet]
type = VarSet
trigger1 = !Time
var(10) = ceil(P2dist X)

[State 193, PosAdd]
type = PosAdd
trigger1 = !Time
x = ceil(P2Dist X - 110)

[State 193, Voice]
type = PlaySnd
trigger1 = AnimElem = 9
value = 193, 0
channel = 0

[State 193, Back Dash Sound]
type = PlaySnd
trigger1 = AnimElem = 10
value = 105,0

[State 193, Dust Helper]
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

[State 193, VelSet]
type = VelSet
trigger1 = AnimElem = 10
x = -(ceil(var(10) - 110) * 0.0625)

[State 193, VelSet]
type = VelSet
trigger1 = AnimElem = 12
x = 0

[State 193, Landing Sound]
type = PlaySnd
trigger1 = AnimElem = 12
value = 100,1

[State 193, Landing Dust Explod]
type = Explod
trigger1 = AnimElem = 12
anim = 8102
sprpriority = -3
postype = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 193, End]
type = ChangeState
trigger1 = !AnimTime
value = 0



;====================<INTRO VS RYU (NOOGIE)>====================
[StateDef 194]
type = S
physics = N
anim = 194
sprPriority = 1

[State 194, vs Intro Decider]
type = ChangeState
trigger1 = (Enemy, var(1) = 2)
trigger1 = var(40) != 1
trigger1 = NumEnemy
trigger1 = RoundNo = 1 && (!(TeamMode = Simul) && !(Enemy, TeamMode = Simul))
trigger1 = Enemy, AuthorName = "Phantom.of.the.Server" && Enemy, Name = "Ryu"
value = 188 + (Random % 5)

[State 194, Assert: Intro]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 194, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 0,0
ignoreHitPause = 1

[State 194, Camera Helper]
type = Helper
trigger1 = !NumHelper(8999)
helpertype = Normal
stateNo = 8999
ID = 8999
name = "Camera"
posType = P1

[State 194, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 194,0

[State 194, VarSet]
type = VarSet
trigger1 = !Time
var(10) = ceil(pos x)

[State 194, PosAdd]
type = PosAdd
trigger1 = !Time
;320x240
;x = P2Dist x - 31
;640x480
x = P2Dist x - 31.5
;1280x720
;x = P2Dist x - 31.75

[State 194, PosAdd]
type = PosAdd
triggerAll = Anim = 194
trigger1 = AnimElem = 13
x = ceil(P2Dist x - 45)

[State 194, SprPriority]
type = SprPriority
triggerAll = Anim = 194
trigger1 = AnimElem = 13
value = -1

[State 194, PosAdd]
type = PosAdd
triggerAll = Anim = 194
trigger1 = AnimElemTime(13) = 3
x = ceil(P2Dist x - 25)

[State 194, SprPriority]
type = SprPriority
triggerAll = Anim = 194
trigger1 = AnimElemTime(13) = 3
value = 2

[State 194, PosAdd]
type = PosAdd
triggerAll = Anim = 194
trigger1 = AnimElem = 14
x = ceil(P2Dist x)

[State 194, PosAdd]
type = PosAdd
triggerAll = Anim = 194
trigger1 = AnimElemTime(14) = 3
x = ceil(P2Dist x + 22)

[State 194, PosAdd]
type = PosAdd
triggerAll = Anim = 194
trigger1 = AnimElemTime(14) = 6
x = ceil(P2Dist x + 45)

[State 194, SprPriority]
type = SprPriority
triggerAll = Anim = 194
trigger1 = AnimElemTime(14) = 6
value = -1

[State 194, PosAdd]
type = PosAdd
triggerAll = Anim = 194
trigger1 = AnimElem = 15
x = ceil(P2Dist x + 15)
y = ceil(P2Dist y - 76)

[State 194, PosAdd]
type = PosAdd
triggerAll = Anim = 194
trigger1 = AnimElem = 16
x = ceil(P2Dist x - 11)
y = ceil(P2Dist y - 105)

[State 194, PosAdd]
type = PosAdd
triggerAll = Anim = 194
trigger1 = AnimElem = 17
x = ceil(P2Dist x - 40)
y = ceil(P2Dist y - 80)

[State 194, VelSet]
type = VelSet
triggerAll = Anim = 194
trigger1 = AnimElem = 18
x = ((var(10) - pos x) / 24) * ifElse(var(10) > pos x, -1, 1)
y = -5.625

[State 194, Gravity]
type = Gravity
triggerAll = Anim = 194
trigger1 = AnimElemTime(18) >= 0

[State 194, PosSet]
type = PosAdd
triggerAll = Anim = 194
trigger1 = AnimElem = 19
y = 70

[State 194, Landing Dust Explod]
type = Explod
triggerAll = Anim = 194
trigger1 = pos y > -vel y
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 194, Landing Sound]
type = PlaySnd
triggerAll = Anim = 194
trigger1 = pos y > -vel y
value = 52,0

[State 194, Change]
type = ChangeAnim
triggerAll = Anim = 194
trigger1 = pos y > -vel y
value = 47

[State 194, Change]
type = ChangeAnim
trigger1 = Anim = 47 && !AnimTime
value = 192

[State 194, PosSet]
type = PosSet
triggerAll = Anim = 47
trigger1 = pos y > -vel y
trigger1 = AnimElemTime(18) >= 0
x = var(10)
y = 0

[State 194, VelSet]
type = VelSet
triggerAll = Anim = 47
trigger1 = pos y > -vel y
x = 0
y = 0

[State 194, Whoosh Sound]
type = PlaySnd
triggerAll = Anim = 192
trigger1 = AnimElem = 4
trigger2 = AnimElem = 7
value = 1,0

[State 194, Whoosh Sound]
type = PlaySnd
triggerAll = Anim = 192
trigger1 = AnimElem = 12
value = 1,1

[State 194, End]
type = ChangeState
trigger1 = !AnimTime && Anim = 192
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

;=========< HIT FALL >===============
[Statedef 5050]
type    = A
movetype= H
physics = N

[State 5050, 1] ;Change anim when done with transition
type = ChangeAnim
trigger1 = AnimTime = 0
trigger1 = Anim = 5035
trigger2 = Time = 0     ;If no transition anim
trigger2 = Anim != 5035
trigger2 = (Anim != [5051, 5059]) && (Anim != [5061, 5069])
trigger2 = Anim != 5090 ;Not if hit off ground anim
value = 5050

[State 5050, 2] ;Coming down anim
type = ChangeAnim
trigger1 = anim = [5050,5059]
trigger1 = Vel Y >= ifelse(anim = 5050, Const720p(4), Const720p(-8))
trigger1 = SelfAnimExist(anim+10)
value = anim+10
persistent = 0

[State 5050, 3] ;Gravity
type = VelAdd
trigger1 = 1
y = GetHitVar(yaccel)

[State 5050, 4] ;Recover near ground
type = ChangeState
triggerall = Vel Y > 0
triggerall = Pos Y >= Const(movement.air.gethit.groundrecover.ground.threshold)
triggerall = alive
triggerall = CanRecover
triggerall = !var(39)
trigger1 = Command = "recovery"
value = 5200 ;Air get-hit (fall recovery on ground)

[State 5050, 5]; Recover in mid air
type = ChangeState
triggerall = Vel Y > Const(movement.air.gethit.airrecover.threshold)
triggerall = alive
triggerall = CanRecover
triggerall = !var(39)
trigger1 = Command = "recovery"
value = 5210 ;Air get-hit (fall recovery in air)

[State 5050, 6]
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= ifelse((anim = [5051,5059]) || (anim = [5061,5069]), 0, Const(movement.air.gethit.groundlevel))
value = 5100 ;Downed get-hit (hit ground from fall)

;====================<Dizzy>==================
[Statedef 5300]
type=S
physics=S
movetype=I
velset=0,0
anim=5300
ctrl=0

[State 5300, change dizzy 2]
type=varset
trigger1 = !time
var(39) = 2

[State 5300, change dizzy var]
type=varset
trigger1 = !time
fvar(38) = fvar(39)

[State 5300, change dizzy var]
type=varset
trigger1 = !time
fvar(39) = 0

[state 5300, pos fix]
type=posset
trigger1=!time
y=0
persistent=0

[state 5300, DetectKeyPress 1]
type=varadd
triggerall= time%2=0
triggerall=command="holdfwd" || command="holdback" || command="holdup" || command="holddown"
trigger1= command="a" || command="b" || command="c" || command="x" || command="y" || command="z"
fvar(38)= -8

[state 5300, DetectKeyPress 2]
type=varadd
triggerall= time%2=0
triggerall=command!="holdfwd" && command!="holdback" && command!="holdup" && command!="holddown"
trigger1= command="a" || command="b" || command="c" || command="x" || command="y" || command="z"
fvar(38)= -4

[state 5300, DetectKeyPress 3]
type=varadd
triggerall= time%2=0
trigger1= command!="a" && command!="b" && command!="c" && command!="x" && command!="y" && command!="z"
fvar(38)= -1

[State 5300, fast anim]
type=changeanim
triggerall= time%2=0
trigger1= command="a" || command="b" || command="c" || command="x" || command="y" || command="z"
value= 5300
elem= ifelse(AnimElemNo(0)=6,1,AnimelemNo(0)+1)

[state 5300, Ducks]
type=helper
trigger1= !NumHelper(6300)
trigger1= time=1
helpertype=normal
name= "Dizzy Ducks"
ID=6300
stateno=6300
postype=p1
pos= 0,0
ownpal=1
trans=none
persistent=0

[state 5300, end]
type=changestate
trigger1= time>6 && fvar(38)<1
value=0
ctrl=1



;====================<INTRO VS VIOLENT>====================
[StateDef 5971]
type = S
anim = 5971

[State 5971, Assert: Intro]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 5971, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 0,0
ignoreHitPause = 1

[State 5971, Camera Helper]
type = Helper
trigger1 = !NumHelper(8999)
helpertype = Normal
stateNo = 8999
ID = 8999
name = "Camera"
posType = P1

[State 5971, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 10
value = 1,4
channel = 1

[State 5971, Voice]
type = PlaySnd
trigger1 = AnimElem = 7
value = 1300,0
channel = 0

[State 5971, Dust Helper]
type = Helper
trigger1 = AnimElem = 7
helperType = Normal
stateNo = 8100
ID = 8100
name = "Ryusenkyaku Dust"
posType = P1
ownPal = 1

[State 5971, VelSet]
type = VelSet
trigger1 = AnimElem = 9
x = 4
y = -14

[State 5971, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(9) > 0 && AnimElemTime(14) < 0
y = 1

[State 5971, VelSet]
type = VelSet
trigger1 = pos y > -vel y
x = 0
y = 0

[State 5971, PosSet]
type = PosSet
trigger1 = pos y > -vel y
y = 0

[State 5971, Landing Dust Explod]
type = Explod
trigger1 = AnimElem = 14
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 5971, Landing Sound]
type = PlaySnd
trigger1 = AnimElem = 14
value = 1300,1

[State 5971, Voice]
type = PlaySnd
trigger1 = AnimElem = 22
value = 4,1
channel = 0

[State 5971, Rolling Sound]
type = PlaySnd
trigger1 = AnimElem = 22
value = 105,0
channel = 1

[State 5971, VelSet]
type = VelSet
trigger1 = AnimElem = 22
x = -((Helper(8999), RootDist x))/31

[State 5971, Roll Dust]
type = Explod
triggerAll = !(AnimElemTime(4) % 3)
trigger1 = AnimElemTime(25) >= 0 && AnimElemTime(30) < 0
anim = 8104
sprPriority = 3
posType = P1
pos = 0,0
vel = 0,0
scale = 0.5,0.5
pauseMovetime = -1
superMoveTime = -1
ownpal = 1

[State 5971, VelSet]
type = VelSet
trigger1 = AnimElem = 33
x = 0

[State 5971, PosSet]
type = PosSet
trigger1 = AnimElem = 33
x = Helper(8999), pos x

[State 5971, End]
type = ChangeState
trigger1 = !AnimTime
value = 0



;====================<INTRO VS KEN (VIOLENT)>====================
[StateDef 5972]
type = S
anim = 5972

[State 5972, Assert: Intro]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 5972, Change to Regular Intro]
type = ChangeState
trigger1 = Enemy, var(40) = 1
trigger1 = var(40) = 1
trigger1 = NumEnemy
trigger1 = RoundNo = 1 && (!(TeamMode = Simul) && !(Enemy, TeamMode = Simul))
trigger1 = Enemy, AuthorName = "Phantom.of.the.Server&Jmorphman" && Enemy, Name = "Ken Masters"
value = 5981

[State 5972, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 0,0
ignoreHitPause = 1

[State 5972, Camera Helper]
type = Helper
trigger1 = !NumHelper(8999)
helpertype = Normal
stateNo = 8999
ID = 8999
name = "Camera"
posType = P1

[State 5972, Voice 1]
type = PlaySnd
trigger1 = AnimElem = 2
value = 198,0
channel = 0

[State 5972, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 5 && var(40) = 1
value = 1600,0
channel = 0

[State 5972, Rasetsu Kyaku Sound]
type = PlaySnd
trigger1 = AnimElem = 5
value = 1600, 1
channel = 1

[State 5972, Fade Away Helper]
type = Helper
trigger1 = AnimElem = 5
helperType = Normal
stateNo = 1605
ID = 1605
name = "Rasetsu Kyaku Fade Away Helper"
posType = P1
ownPal = 1

[State 5972, VelSet]
type = VelSet
trigger1 = AnimElem = 5
x = 11

[State 5972, VelSet]
type = VelSet
trigger1 = AnimElem = 14
x = 0

[State 5972, Voice 3]
type = PlaySnd
trigger1 = AnimElem = 21
value = 1100,10
channel = 0

[State 5972, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 20
value = 1,2
channel = 1

[State 5972, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 23
value = 40,0
channel = 3

[State 5972, Fire Sound]
type = PlaySnd
trigger1 = AnimElem = 20
value = 1100,1
channel = 4

[State 5972, Dust Helper]
type = Helper
trigger1 = AnimElem = 23
helperType = Normal
stateNo = 8100
ID = 8100
name = "Shoryuken Dust"
posType = P1
ownPal = 1

[State 5972, VelSet]
type = VelSet
trigger1 = AnimElem = 23
x = -((Helper(8999), RootDist x) + 344.96)/28
y = -10.5

[State 5972, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(23) >= 0
y = 0.47

[State 5972, Velocity]
type = VelMul
trigger1 = AnimElemTime(23) >= 0 && AnimElemTime(26) < 0
x = 0.88
persistent = 1

[State 5972, VelSet]
type = VelSet
trigger1 = AnimElem = 26
x = 0

[State 5972, PosAdd]
type = PosAdd
trigger1 = AnimElem = 20
trigger2 = AnimElem = 21
x = -8

[State 5972, Shoryuken Flames Explod]
type = Explod
trigger1 = AnimElem = 20
anim = 5973
ID = 5973
sprPriority = 3
bindTime = 2
posType = P1
pos = -10,-28
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 5971, ModifyExplod]
type = ModifyExplod
trigger1 = AnimElem = 21
ID = 5973
pos = -19,-39
posType = P1
bindTime = 2

[State 5971, ModifyExplod]
type = ModifyExplod
trigger1 = AnimElem = 22
ID = 5973
pos = -36,-82
posType = P1
bindTime = 2

[State 5972, ModifyExplod]
type = ModifyExplod
trigger1 = AnimElem = 23
ID = 5973
pos = -12,-143
posType = P1
bindTime = 19

[State 5972, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 5973


;Landing
[StateDef 5973]
type = S
physics = N
moveType = I
velSet = 0,0

[State 5973, PosSet]
type = PosSet
trigger1 = !Time
x = Helper(8999), pos x
y = 0

[State 5973, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 0,0
ignoreHitPause = 1

[State 5973, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 5973, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 5973, End]
type = ChangeState
trigger1 = !AnimTime
value = 0



;====================<VIOLENT KEN INTRO>====================
[StateDef 5981]
type = S
physics = S
anim = 5981

[State 5981, Assert: Intro]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 5981, Change to Intro vs Ken]
type = ChangeState
trigger1 = Enemy, var(40) != 1
trigger1 = var(40) = 1
trigger1 = NumEnemy
trigger1 = RoundNo = 1 && (!(TeamMode = Simul) && !(Enemy, TeamMode = Simul))
trigger1 = Enemy, AuthorName = "Phantom.of.the.Server&Jmorphman" && Enemy, Name = "Ken Masters"
value = 5972

[State 5981, Change to Intro vs Evil Ryu]
type = ChangeState
trigger1 = Enemy, var(1) = 2
trigger1 = var(40) = 1
trigger1 = NumEnemy
trigger1 = RoundNo = 1 && (!(TeamMode = Simul) && !(Enemy, TeamMode = Simul))
trigger1 = Enemy, AuthorName = "Phantom.of.the.Server" && Enemy, Name = "Ryu"
value = 5983

[State 5981, Voice]
type = PlaySnd
trigger1 = AnimElemTime(1) = 50
value = 5981, 0
channel = 0

[State 5981, End]
type = ChangeState
trigger1 = !AnimTime
value = 0



;====================<INTRO VS VEGA (VIOLENT)>====================
[StateDef 5982]
type = S
physics = S
anim = 5982

[State 5982, Assert: Intro]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 5982, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 3500,0
channel = 0

[State 5982, End]
type = ChangeState
trigger1 = !AnimTime
value = 0



;====================<INTRO VS EVIL RYU (VIOLENT)>====================
[StateDef 5983]
type = S
anim = 2

[State 5983, Assert: Intro]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 5983, Change to Regular Intro]
type = ChangeState
trigger1 = Enemy, var(1) != 2
trigger1 = var(40) = 1
trigger1 = NumEnemy
trigger1 = RoundNo = 1 && (!(TeamMode = Simul) && !(Enemy, TeamMode = Simul))
trigger1 = Enemy, AuthorName = "Phantom.of.the.Server" && Enemy, Name = "Ryu"
value = 5981

[State 5983, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 0,0
ignoreHitPause = 1

[State 5983, Camera Helper]
type = Helper
trigger1 = !NumHelper(8999)
helpertype = Normal
stateNo = 8999
ID = 8999
name = "Camera"
posType = P1

[State 5983, PosAdd]
type = PosAdd
trigger1 = !Time
x = 26.34

[State 5983, ChangeAnim]
type = ChangeAnim
trigger1 = Time = 10
value = 5983

[State 5983, ChangeAnim]
type = Turn
trigger1 = !Time
trigger2 = Anim = 5983 && AnimElem = 1

[State 5983, Voice 1]
type = PlaySnd
trigger1 = AnimElem = 1 && Anim = 5983
value = 4, ifElse(var(40) = 1, 10, 2)
channel = 0

[State 5983, Dodge Sound]
type = PlaySnd
trigger1 = AnimElem = 1 && Anim = 5983
value = 1,3
channel = 1

[State 5983, Voice 2]
type = PlaySnd
triggerAll = Anim = 5983
trigger1 = AnimElem = 7
value = 1100,10
channel = 0

[State 5983, Woosh Sound]
type = PlaySnd
triggerAll = Anim = 5983
trigger1 = AnimElem = 6
value = 1,2
channel = 1

[State 5983, Jump Sound]
type = PlaySnd
triggerAll = Anim = 5983
trigger1 = AnimElem = 9
value = 40,0
channel = 3

[State 5983, Fire Sound]
type = PlaySnd
triggerAll = Anim = 5983
trigger1 = AnimElem = 6
value = 1100,1
channel = 4

[State 5983, Dust Helper]
type = Helper
triggerAll = Anim = 5983
trigger1 = AnimElem = 9
helperType = Normal
stateNo = 8100
ID = 8100
name = "Shoryuken Dust"
posType = P1
ownPal = 1

[State 5983, VelSet]
type = VelSet
triggerAll = Anim = 5983
trigger1 = AnimElem = 9
x = -((Helper(8999), RootDist x) + 124)/28
y = -10.5

[State 5983, VelAdd]
type = VelAdd
triggerAll = Anim = 5983
trigger1 = AnimElemTime(9) >= 0
y = 0.47

[State 5983, Velocity]
type = VelMul
triggerAll = Anim = 5983
trigger1 = AnimElemTime(9) >= 0 && AnimElemTime(13) < 0
x = 0.88
persistent = 1

[State 5983, VelSet]
type = VelSet
triggerAll = Anim = 5983
trigger1 = AnimElem = 13
x = 0

[State 5983, PosAdd]
type = PosAdd
triggerAll = Anim = 5983
trigger1 = AnimElem = 6
trigger2 = AnimElem = 7
x = 8

[State 5983, Shoryuken Flames Explod]
type = Explod
triggerAll = Anim = 5983
trigger1 = AnimElem = 6
anim = 5973
ID = 5973
sprPriority = 3
bindTime = 2
posType = P1
pos = -10,-28
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 5983, ModifyExplod]
type = ModifyExplod
triggerAll = Anim = 5983
trigger1 = AnimElem = 7
ID = 5973
pos = -19,-39
posType = P1
bindTime = 2

[State 5983, ModifyExplod]
type = ModifyExplod
triggerAll = Anim = 5983
trigger1 = AnimElem = 8
ID = 5973
pos = -36,-82
posType = P1
bindTime = 2

[State 5983, ModifyExplod]
type = ModifyExplod
triggerAll = Anim = 5983
trigger1 = AnimElem = 9
ID = 5973
pos = -12,-143
posType = P1
bindTime = 19

[State 5983, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 5973


;====================<INTRO VS GUILE (MASTER)>====================
[StateDef 5984]
type = S
physics = S
anim = 5984

[State 5984, Assert: Intro]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 5984, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = 5984, 0
channel = 0

[State 5984, End]
type = ChangeState
trigger1 = !AnimTime
value = 0



;====================<VIOLENT INTRO VS RYU>====================
[StateDef 5990]
type = S
physics = S
anim = 5990
sprPriority = -1

[State 5990, Assert: Intro]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 5990, Change to Intro vs Ryu]
type = ChangeState
trigger1 = EnemyNear, var(1) = 2
value = 5981

[State 5990, Helicopter]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 5992
ID = 5992
name = "Helicopter"
posType = P1
ownPal = 1

[State 5990, Cape]
type = Helper
trigger1 = AnimElem = 44
helperType = Normal
stateNo = 5991
ID = 5991
name = "Cape"
posType = P1
ownPal = 1

[State 5990, Helicopter Sound]
type = PlaySnd
trigger1 = Time = 5
value = 5992,0
channel = 5
loop = 1

[State 5990, End]
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
channel = 1

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

[State 6901, Whoosh Sound]
type = PlaySnd
triggerAll = Anim = 6901
trigger1 = AnimElem = 5
trigger2 = AnimElem = 8
value = 1,0

[State 6901, Whoosh Sound]
type = PlaySnd
triggerAll = Anim = 6901
trigger1 = AnimElem = 13
value = 1,1

[State 6901, Voice (Violent)]
type = PlaySnd
triggerAll = Anim = 6902
trigger1 = AnimElem = 4
value = 198,0
channel = 0

[State 6901, End]
type = ChangeState
trigger1 = !AnimTime
value = 0



;====================<SIMUL MODE INTRO>====================
[StateDef 6910]
type = S
physics = S
anim = 6910

[State 193, vs Intro Decider]
type = ChangeState
trigger1 = (Partner, var(1) = 2)
trigger1 = var(40) != 1
trigger1 = NumPartner
trigger1 = RoundNo = 1 || (!(TeamMode = Simul) && !(Enemy, TeamMode = Simul))
trigger1 = Partner, AuthorName = "Phantom.of.the.Server" && Partner, Name = "Ryu"
value = 188 + (Random % 5)

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

[State 180, Team Win with beterhans Ryu alive]
type = ChangeState
triggerall = var(34)
trigger1 = var(40) != 1
trigger1 = PlayerID(var(34)),Name = "Ryu"
trigger1 = PlayerID(var(34)),AuthorName = "Phantom.of.the.Server"
trigger1 = PlayerID(var(34)),var(34)
trigger1 = PlayerID(var(34)),StateNo != 362
trigger1 = PlayerID(var(34)),var(1) != 2 && !(PlayerID(var(34)),StateNo = 3050 || PlayerID(var(34)),StateNo = 3052)
value = 390

[State 180, Team Win with beterhans Ryu Dead]
type = ChangeState
triggerall = TeamMode = Simul
trigger1 = var(40) != 1
trigger1 = Partner,Name = "Ryu"
trigger1 = Partner,AuthorName = "Phantom.of.the.Server"
trigger1 = Partner,var(34)
trigger1 = Partner,var(1) != 2
trigger1 = Partner,Alive = 0 || Partner,StateNo = 3052
value = 392

[State 180, Win by Shinryuken (Master)]
type = ChangeState
trigger1 = TeamMode != Simul
trigger1 = PrevStateNo = 3112
value = 3112

[State 180, Win by Souryuken]
type = ChangeState
trigger1 = TeamMode != Simul
trigger1 = PrevStateNo = 3711
value = 3711

[State 180, Win vs Ryu]
type = ChangeState
trigger1 = var(40) != 1 && var(11)
trigger1 = (RoundState = 2 || MatchOver)
trigger1 = TeamMode = Single && Enemy,TeamMode = Single
trigger1 = NumEnemy
trigger1 = Enemy, AuthorName = "Phantom.of.the.Server" && Enemy, Name = "Ryu" && (Enemy, var(1) != 2)
value = 184

[State 180, Win vs Vega (Violent]
type = ChangeState
trigger1 = var(40) = 1
trigger1 = (RoundState = 2 || MatchOver) && !(TeamMode = Turns)
trigger1 = NumEnemy
trigger1 = Enemy, AuthorName = "Phantom.of.the.Server" && Enemy, Name = "Vega"
value = 187

[State 180, Win with Ryu not beterhans ryu (Simul)]
type = ChangeState
trigger1 = var(40) != 1
trigger1 = TeamMode = Simul && NumPartner
trigger1 = Partner, Alive
trigger1 = Partner, AuthorName = "Phantom.of.the.Server" && Partner, Name = "Ryu" && (Partner, var(1) != 2)
value = 181

[State 180, Win 1]
type = ChangeState
trigger1 = command = "holdstart"
value = ifElse(var(40) != 1, 181, 185)

[State 180, Win 2]
type = ChangeState
trigger1 = command = "holdx" || command = "holdy" || command = "holdz"
value = ifElse(var(40) != 1, 182, 186)

[State 180, Win 3]
type = ChangeState
triggerAll = var(40) != 1
trigger1 = command = "holda" || command = "holdb" || command = "holdc"
value = 183

[State 180, Win Decider]
type = ChangeState
trigger1 = var(40) != 1
value = 181 + (Random % 3)

[State 180, Violent Win Decider]
type = ChangeState
trigger1 = var(40) = 1
value = 185 + (Random % 2)



;====================<WIN 1>====================
[StateDef 181]
type = S
physics = S
MoveType = I
anim = 181
ctrl = 0
velset = 0,0

[State 181, Assert: RoundNotOver]
type = AssertSpecial
trigger1 = Time < 200
flag = RoundNotOver

[State 181, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = 181, 0 + (Random % 2)
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
trigger1 = AnimElem = 4
value = 181, 0
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

[State 183, Voice]
type = PlaySnd
trigger1 = AnimElem = 9
value = 181,1
channel = 0


;====================<WIN VS RYU>====================
[StateDef 184]
type = S
physics = S
anim = 20
ctrl = 0

[State 184, Assert: RoundNotOver]
type = AssertSpecial
trigger1 = Time < 200
flag = RoundNotOver

[State 392, Screen]
type = ScreenBound
trigger1 = time 
value = IFElse(FrontEdgeBodyDist < 2 || BackEdgeBodydist < 2,0,1)
movecamera = 1,1

[State 184, VelSet]
type = VelSet
trigger1 = Anim = 20
x = const(velocity.walk.fwd.x)

[State 184, Turn]
type = Turn
trigger1 = Enemy, Facing = Facing
trigger1 = Enemy, P2Dist X <= 65 && (Enemy, P2Dist X >= 55)

[State 184, ChangeAnim]
type = ChangeAnim
trigger1 = Enemy, Facing != Facing
trigger1 = Anim = 20
trigger1 = vel x > 0
trigger1 = Enemy, P2Dist X <= 65 && (Enemy, P2Dist X >= 25)
value = 184

[State 184, PosAdd]
type = PosAdd
trigger1 = Anim = 184
x = ceil(Enemy, P2Dist x - 65)

[State 184, VelSet]
type = VelSet
trigger1 = Anim = 184
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
trigger1 = AnimElem = 1
value = 185,0 + (Random % 2)
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
trigger1 = AnimElem = 1
value = 186,0
channel = 0



;====================<VIOLENT WIN VS VEGA>====================
[StateDef 187]
type = S
anim = 187
ctrl = 0

[State 187, Assert: RoundNotOver]
type = AssertSpecial
trigger1 = Time < 200
flag = RoundNotOver

[State 187, Voice 1]
type = PlaySnd
trigger1 = !Time
value = 5000,11
channel = 0

[State 187, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 67
value = 5000,2
channel = 0

[State 187, Particles]
type = Helper
trigger1 = !NumHelper(8332) && AnimElem = 10 && AnimElemTime(60) < 0
helperType = Normal
stateNo = 8332
ID = 8332
name = "Particles"
postype = P1
pauseMoveTime = 65535
superMoveTime = 65535
ownPal = 1

[State 187, PalFX]
type = PalFX
trigger1 = AnimElem = 60
time = 24
add = 0,0,0
mul = 256,256,256
sinadd = 255,255,255,48
invertall = 0
color = 256


;==========< team win move towards each other>
[Statedef 390]
type = S
MoveType = I
physics = S
ctrl = 0
velset = 0, 0

[State 390 safe]
type = assertspecial
trigger1 = time < 360
Flag = roundnotover

[State 390 safe]
type = PlayerPush
trigger1 = 1
value = 0

[State 390 safe]
type = NotHitBy
trigger1 = 1
value = SCA

[State 390 Turn]
type = Turn
triggerall = var(34)
triggerall = !time
trigger1 = facing = PlayerID(var(34)),facing
trigger1 = pos x = PlayerID(var(34)),pos x
trigger1 = ID < PlayerID(var(34)),ID
trigger2 = facing = 1
trigger2 = pos x > PlayerID(var(34)),pos x
trigger3 = facing = -1
trigger3 = pos x < PlayerID(var(34)),pos x

[State 390 move anim]
type = ChangeAnim
trigger1 = time = 1 && anim != 20
value = 20

[State 390 Move forward]
type = velset
trigger1 = time && anim = 20
x = Const(Velocity.walk.fwd.x)

[State 390 Win pose no1]
type = ChangeState
triggerall = var(34)
triggerall = time && anim = 20 && facing != PlayerID(var(34)),facing
trigger1 = facing = 1
trigger1 = (pos x - PlayerID(var(34)),pos x) = [-111,-108]
trigger2 = facing = -1
trigger2 = (pos x - PlayerID(var(34)),pos x) = [108,111]
value = 391

[State 390 stop and perform win pose]
type = ChangeState
triggerall = var(34)
triggerall = time && anim = 20
trigger1 = facing = 1
trigger1 = (pos x - PlayerID(var(34)),pos x) >  (42 * Const(size.xscale))
trigger2 = facing = -1
trigger2 = (pos x - PlayerID(var(34)),pos x) < -(42 * Const(size.xscale))
value = 181

;==========< team Win with beterhans Ken>
[Statedef 391]
type = S
MoveType = I
physics = S
ctrl = 0
velset = 0, 0
anim = 391

[State 391 safe]
type = assertspecial
trigger1 = time < 120
Flag = roundnotover

[State 391, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1

;====================<Team WIN With Dead Ryu>====================
[StateDef 392]
type = S
physics = S
ctrl = 0

[State 392, Assert: RoundNotOver]
type = AssertSpecial
trigger1 = Time < 200
flag = RoundNotOver

[State 392, Screen]
type = ScreenBound
trigger1 = time 
value = IFElse(FrontEdgeBodyDist < 2 || BackEdgeBodydist < 2,0,1)
movecamera = 1,1

[State 392, VelSet]
type = VelSet
trigger1 = Anim = 20
x = const(velocity.walk.fwd.x)

[State 392, Turn to Partner]
type = Turn
triggerall = !time
trigger1 = facing = 1
trigger1 = pos x >= (partner,pos x + 65 * partner,facing)
trigger2 = facing = -1
trigger2 = pos x <= (partner,pos x + 65 * partner,facing)

[State 392, Move Anim]
type = ChangeAnim
trigger1 = !time && anim != 20
value = 20

[State 392, ChangeAnim]
type = ChangeAnim
triggerall = Anim = 20
trigger1 = partner,StateNo != 3052
trigger1 = pos x - (partner,pos x + 65 * partner,facing) = [-10,10]
trigger2 = partner,StateNo = 3052
trigger2 = pos x - (partner,pos x + 20 * partner,facing) = [-10,10]
value = 184

[State 392, Posfix]
type = Posset
trigger1 = Anim = 184 && partner,StateNo != 3052
x = partner,pos x + 65 * partner,facing

[State 392, Turn final]
type = Turn
trigger1 = anim = 184
trigger1 = facing = partner,facing

[State 392, VelSet]
type = VelSet
trigger1 = Anim = 184
x = 0



;==========<TAUNT>==========
[StateDef 195]
type = S
moveType = I
physics = S
anim = 195
velSet  = 0,0
sprPriority = 1
ctrl = 0

[State 195, ChangeAnim]
type = ChangeAnim
triggerAll = !Time
trigger1 = !AILevel && command = "holdfwd"
trigger2 = AILevel && P2Bodydist x < 80
trigger3 = AILevel && var(59) = 5300 && P2Bodydist x < 30
value = 196

[State 195, ChangeAnim]
type = ChangeAnim
triggerAll = !Time && anim = 195
trigger1 = !AILevel && command = "holdback"
trigger2 = AILevel && Random < 400
value = 197

[State 195, ChangeAnim]
type = ChangeAnim
triggerAll = !Time && anim = 195
trigger1 = !AILevel && command = "holddown"
trigger2 = AILevel && Random < 600
value = 183

[State 195, Voice 1]
type = PlaySnd
triggerAll = Anim = 195
trigger1 = AnimElem = 2
value = 195 + 4*(Random % 2), 0
channel = 0

[State 195, Voice 2]
type = PlaySnd
triggerAll = Anim = 196
trigger1 = AnimElem = 2
value = 188,0
channel = 0

[State 195, Voice 3]
type = PlaySnd
triggerAll = Anim = 197
trigger1 = AnimElem = 1
value = 195 + 4*(Random % 2), 0
channel = 0

[State 183, Voice 4]
type = PlaySnd
triggerAll = Anim = 183
trigger1 = AnimElem = 9
value = 181,1
channel = 0

[State 195, StateTypeSet: Attack]
type = StateTypeSet
triggerAll = Anim = 196
trigger1 = AnimElemTime(3) >= 0
moveType = A

[State 195, HitDef]
type = HitDef
triggerAll = Anim = 196
trigger1 = AnimElem = 3 || AnimElem = 6
ID = 200 * !var(20)
attr = S, NA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = 7, 0
getpower = 72 * !var(20), 36 * !var(20)
givepower = 36, 36
pauseTime = ifElse(var(20), 4, 8) - 1, ifElse(var(20), 4, 4)
guard.pauseTime = ifElse(var(20), 4, 8) - 1, ifElse(var(20), 4, 8)
animType = Light
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 12 + 2 * var(9)
ground.slideTime = 12 + 2 * var(9)
guard.hitTime = 12
air.hitTime = 120
ground.velocity = ifElse(var(20), -2.41, -4.49), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -2.41, -4.49)
guard.cornerPush.velOff = 0
air.velocity = -3,-4
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(51) := 0)
guardSound = -1 + 0 * (var(52) := 0)
sparkNo = -1 + 0 * (var(53) := 8010)
guard.sparkNo = -1 + 0 * (var(54) := 8000)
sparkXY = -10 + 0 * (var(55) := 88), var(56):=-84
palFX.time = 12 * var(9)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 195, StateTypeSet: Idle]
type = StateTypeSet
triggerAll = Anim = 196
trigger1 = AnimElemTime(7) >= 0
moveType = I

[State 195, End]
type = ChangeState
trigger1 = !AnimTime
trigger2 = Anim = 183 && AnimElemTime(9) = 33
value = 0
ctrl = 1



;==========<VIOLENT TAUNT>==========
[StateDef 198]
type = S
moveType = I
physics = S
anim = 198
velSet  = 0,0
sprPriority = 1
ctrl = 0

[State 198, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 198,0
channel = 0

[State 198, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====================<K.O.>====================
[StateDef 5150]
type = L
movetype = H
physics = N
sprpriority = -3

[State 5150, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 5150

[State 5150, Screen]
type = ScreenBound
trigger1 = Anim != 171
value = 0

[State 5150, Screen]
type = ScreenBound
trigger1 = Anim = 171
value = 1
movecamera = 1,1

[State 5150, Anim]; Lose to Ryu
type = ChangeAnim
triggerall = Anim != 171
triggerall = Enemy, AuthorName = "Phantom.of.the.Server" && Enemy, Name = "Ryu" && (Enemy, var(1) != 2)
triggerall = (Roundstate = 2 || MatchOver)
triggerall = TeamMode != turns
trigger1 = Enemy, Anim = 184
trigger1 = Abs(pos x + (65 * facing) - Enemy,pos x) < 30
value = 171

[State 5150, Anim] ; Save by Ryu
type = ChangeAnim
triggerall = Anim != 171
triggerall = (Roundstate >= 2 || MatchOver)
triggerall = TeamMode = Simul
trigger1 = Partner,Name = "Ryu"
trigger1 = Partner,AuthorName = "Phantom.of.the.Server"
trigger1 = Partner,var(1) != 2
trigger1 = Partner,Anim = 184
trigger1 = Abs(pos x + (65 * facing) - Partner,pos x) < 30
value = 171

[State 5150, SprPriority]
type = SprPriority
trigger1= Anim = 171
value = 3

[State 5150, VelMul]
type = VelMul
trigger1 = 1
x= 0.85

[State 5150, VelSet]
type = VelSet
trigger1 = abs(vel x) < 0.05
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

[State 5981, Hitting the Floor Sound]
type = PlaySnd
trigger1 = AnimElem = 10
value = F7,0

[State 5981, Hitting the Floor Explod]
type = Explod
trigger1 = AnimElem = 10
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
trigger1 = 1
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
[State -2, Lv3 Super Finish Detection]
type = VarSet
triggerAll = !(Enemy, Alive)
trigger1 = StateNo = [3300,3399]
trigger2 = StateNo = [3500,3599]
trigger3 = StateNo >= 1100 && StateNo < 3999
var(11) = 1
ignoreHitPause = 1

[State -2, Hit Detection]
type = VarSet
trigger1 = MoveContact = 1 && var(50) < 0
var(50) = HitPauseTime
ignoreHitPause = 1

[State -2, Hit Sound]
type = PlaySnd
trigger1 = MoveContact = 1 && var(50) = HitPauseTime
trigger1 = MoveHit = 1 && var(51) >= 0
value = 2, var(51)
channel = 2
ignoreHitPause = 1

[State -2, Guard Sound]
type = PlaySnd
trigger1 = MoveContact = 1 && var(50) = HitPauseTime
trigger1 = MoveGuarded = 1 && var(52) >= 0
value = 3, var(52)
channel = 2
ignoreHitPause = 1

[State -2, Hit Sparks]
type = Helper
triggerAll = MoveContact = 1 && var(50) = HitPauseTime
triggerAll = (StateNo != 3250) || (StateNo = 3250 && AnimElemTime(53) < 0) || (StateNo = 3250 && AnimElemTime(54) >= 0 && AnimElemTime(59) < 0) || (StateNo = 3250 && AnimElemTime(60) >= 0 && AnimElemTime(65) < 0)
trigger1 = MoveHit = 1 && NumEnemy
trigger1 = var(53) = 8010 || var(53) = 8011 || var(53) = 8012 || var(53) = 8013 || var(53) = 8014 || var(53) = 8001
trigger2 = MoveGuarded = 1 && NumEnemy
trigger2 = var(54) = 8000 || var(54) = 8001
helperType = Normal
stateNo = ifElse(MoveGuarded, var(54), var(53))
ID = 8000
name = "Spark"
postype = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < var(55), ceil(P2Dist x), var(55))), var(56)
facing = -1
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State -2, Hit Sparks (MAX Shippu Jinraikyaku, Opponent Behind)]
type = Helper
triggerAll = MoveContact = 1 && var(50) = HitPauseTime
triggerAll = (StateNo = 3250 && AnimElemTime(53) >= 0 && AnimElemTime(54) < 0) || (StateNo = 3250 && AnimElemTime(59) >= 0 && AnimElemTime(60) < 0) || (StateNo = 3250 && AnimElemTime(65) >= 0)
trigger1 = MoveHit = 1 && NumEnemy
trigger1 = var(53) = 8010 || var(53) = 8011 || var(53) = 8012 || var(53) = 8013 || var(53) = 8014 || var(53) = 8001
trigger2 = MoveGuarded = 1 && NumEnemy
trigger2 = var(54) = 8000 || var(54) = 8001
helperType = Normal
stateNo = ifElse(MoveGuarded, var(54), var(53))
ID = 8000
name = "Spark"
postype = P1
pos = ifElse(P2Dist x >= 0, 0, ifElse(P2Dist x >= var(55), ceil(P2Dist x), var(55))), var(56)
facing = 1
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State -2, Normal Cancelable State Define]
type = varset
triggerall = !var(6) && time=1
trigger1 = StateNo = 200 || StateNo = 205 || StateNo = 215 || StateNo = 225
trigger2 = StateNo = 240 || StateNo = 245 || StateNo = 400 || StateNo = 410 || StateNo = 420
trigger3 = StateNo = 430 || StateNo = 440 || StateNo = 450
trigger4 = StateNo = [600,651]
var(6) = 1

[State -2, Special Cancelable State Define]
type = varset
triggerall = !var(7)
trigger1 = NumHelper(1005)
trigger1 = Helper,time < 10
trigger2 = StateNo = 1100 || StateNo = 1130 || (StateNo = 1240 && var(10) != 3)
var(7) = 1

[State -2, Super Cancelable State Define]
type = varset
triggerall = !var(8)
trigger1 = StateNo = 3000 || StateNo = 3200
var(8) = 1

[State -2, Normal Cancelable State Reset]
type = varset
trigger1 = var(6) && StateNo != [200,999]
var(6) = 0

[State -2, Special Cancelable State Reset]
type = varset
trigger1 = var(7) && StateNo != [1000,2999]
trigger2 = var(7) && NumHelper(1005)
trigger2 = Helper,time >= 10
trigger3 = var(7) && StateNO != [1000,2999]
var(7) = 0

[State -2, Super Cancelable State Reset]
type = varset
trigger1 = var(8) && StateNo != [3000,4999]
var(8) = 0

[State -2, AI Monitor Helper]
type = helper
trigger1 = AILevel && !NumHelper(32767)
trigger1 = NumEnemy && RoundState = 2
helpertype = normal
stateno = 32767
ID = 32767
name = "AI Monitor Helper"
postype = P2
size.xScale = Const(Size.xScale)
size.yScale = Const(Size.yScale)
size.proj.doscale = ID; Give Parent ID to Child

[State -2, Counter FX]
type = Helper
trigger1 = MoveHit = 1 && var(50) = HitPauseTime
trigger1 = NumEnemy && var(9)
trigger1 = !(HitDefAttr = SCA, AT) && (EnemyNear, MoveReversed != 1)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < var(55), ceil(P2Dist x), var(55))), var(56)
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
var(50) = -1

[State -2, Hit Detection]
type = VarRangeSet
trigger1 = MoveType = I
trigger2 = MoveType = H && Time
first = 50
last = 56
value = -1
ignoreHitPause = 1

[State -2, P2 Facing]
type = TargetFacing
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver) && !(Target, HitFall) && (Target, Time <= 1)
trigger2 = MoveContact = 1 && NumTarget(1232)
trigger2 = !(Target, HitShakeOver) && (Target, Time <= 1)
value = ifElse(P2Dist x >= 0, -1, 1)
ignoreHitPause = 1

[State -2, Dizzy safe]
type = SelfState
triggerall = var(39) = 1
triggerall = time && Alive
triggerall = !(StateNo = [5000,5299])
trigger1 = Ctrl || StateNo = 21
value = IFElse(StateType = S || StateType = C,5300,5050)

[State -2, Dizzy reset to 0]
type = varset
trigger1 = fvar(39) != 0
trigger1 = Anim = 5300
fvar(39) = 0


[State -2, P2 Safe Fall]
type = TargetState
trigger1 = NumTarget = 1
trigger1 = Target,var(39) = 0
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

[State -2, Combo Number]
type= varadd
triggerall= RoundState=2
triggerall= !NumHelper(StateNo+5)
triggerall= hitcount = 1
trigger1= Movetype=A && NumTarget
trigger1= target,time=0 && target,movetype=H
var(13) = 1
ignorehitpause=1

[State -2, Combo Number Reset]
type= varset
triggerall= var(13)
trigger1= Enemynear,Ctrl || Enemynear,StateNo < 200
var(13) = 0
ignorehitpause=1

[State -2, Custom Combo End]
type = VarSet
trigger1 = var(20) < 0
trigger2 = MoveType = H
trigger3 = RoundState != 2
trigger4 = (StateNo = [3000,4999])
var(20) = 0
ignoreHitPause=1

[State -2, Custom Combo Time]
type = VarAdd
trigger1 = var(20) > 0
var(20) = -1
ignoreHitPause = 1

[State -2, Free Juggle]
type = AssertSpecial
trigger1 = var(20)
trigger2 = NumTarget(1430)
flag = nojugglecheck

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

;=====================<Team status>
;============<My Teammate ID>
[State -2, Clear teammate]
type = varset
triggerall = var(34)
trigger1 = PlayerID(var(34)),Alive = 0
trigger2 = PlayerID(var(34)),Life < 1
var(34) = 0
ignorehitpause = 1

[State -2, Parter ID set have Parter]
type = varset
triggerall = var(34) = 0
triggerall = NumPartner
trigger1 = Partner,Alive
var(34) = Partner,ID

[State -2, Parter ID set have Helper]
type = varset
triggerall = var(34) = 0
triggerall = !IsHelper
trigger1 = NumHelper(785)
trigger1 = Helper(785),Alive
var(34) = Helper(785),ID

[State -2, Parter ID set Helper have Parent]
type = varset
triggerall = var(34) = 0
triggerall = IsHelper
trigger1 = Parent,Alive
var(34) = Parent,ID


;============<Enemy IDs>
[State -2, Close Enemy ID clear 1 Enemy]
type = varset
triggerall = var(32)
trigger1 = NumEnemy = 1
trigger1 = Enemynear,Alive = 0 || Enemynear,ID != PlayerID(var(32)),ID
var(32) = 0

[State -2, Close Enemy ID set 1 Enemy]
type = varset
triggerall = !var(32)
trigger1 = NumEnemy = 1
trigger1 = Enemynear,Alive
var(32) = Enemynear,ID

[State -2, Close Enemy ID clear 2 Enemys]
type = varset
triggerall = var(32)
trigger1 = NumEnemy > 1
trigger1 = PlayerID(var(32)),Alive = 0
var(32) = 0

[State -2, Close Enemy ID set 2 Enemys]
type = varset
triggerall = NumEnemy > 1
triggerall = Enemynear,Alive || Enemynear(1),Alive
trigger1 = !var(32)
trigger2 = var(32)
trigger2 = Enemynear,Alive && Enemynear(1),Alive
trigger2 = PlayerID(var(32)),ID != Enemynear,ID
trigger3 = var(32)
trigger3 = (Enemynear,Alive = 1 && Enemynear(1),Alive = 0) || (Enemynear,Alive = 0 && Enemynear(1),Alive = 1)
trigger3 = PlayerID(var(32)),Alive = 0
var(32) = IFElse(Enemynear,Alive,Enemynear,ID,Enemynear(1),ID)

[State -2, Far Enemy ID clear 2 Enemys]
type = varset
triggerall = var(33)
trigger1 = PlayerID(var(33)),Alive = 0
trigger2 = (Enemynear,Alive = 1 && Enemynear(1),Alive = 0) || (Enemynear,Alive = 0 && Enemynear(1),Alive = 1)
var(33) = 0

[State -2, Far Enemy ID set 2 Enemys]
type = varset
triggerall = NumEnemy > 1
triggerall = var(32)
triggerall = Enemynear,Alive && Enemynear(1),Alive
trigger1 = !var(33)
trigger2 = var(33)
trigger2 = PlayerID(var(33)),ID != Enemynear(1),ID
var(33) = Enemynear(1),ID

;============<Team Status>
[State -2, Mark teammate is Defending me]
type = varset
triggerall = RoundState = 2
triggerall = !(InGuardDist || MoveType = H)
triggerall = var(34)
triggerall = var(32)
triggerall = var(35) != 1
triggerall = !(PlayerID(var(34)),Pos y < Ceil(-80 * Const(size.yscale)))
trigger1 = facing = 1 && !var(33)
trigger1 = Pos x < PlayerID(var(34)),Pos x
trigger1 = PlayerID(var(34)),pos x < PlayerID(var(32)),Pos x
trigger2 = facing = 1 && var(33)
trigger2 = Pos x < PlayerID(var(34)),Pos x
trigger2 = PlayerID(var(34)),pos x < PlayerID(var(32)),Pos x
trigger2 = PlayerID(var(32)),Pos x < PlayerID(var(33)),Pos x
trigger3 = facing = -1 && !var(33)
trigger3 = Pos x > PlayerID(var(34)),Pos x
trigger3 = PlayerID(var(34)),pos x > PlayerID(var(32)),Pos x
trigger4 = facing = -1 && var(33)
trigger4 = Pos x > PlayerID(var(34)),Pos x
trigger4 = PlayerID(var(34)),pos x > PlayerID(var(32)),Pos x
trigger4 = PlayerID(var(32)),Pos x > PlayerID(var(33)),Pos x
var(35) = 1

[State -2, Mark we are trapping enemy]
type = varset
triggerall = RoundState = 2
triggerall = !(InGuardDist || MoveType = H)
triggerall = var(34)
triggerall = var(32)
triggerall = var(35) != 2
triggerall = !(PlayerID(var(34)),Pos y < Ceil(-80 * Const(size.yscale)))
trigger1 = facing = 1 && !var(33)
trigger1 = Pos x < PlayerID(var(32)),Pos x
trigger1 = PlayerID(var(32)),Pos x < PlayerID(var(34)),Pos x
trigger2 = facing = 1 && var(33)
trigger2 = Pos x < PlayerID(var(32)),Pos x
trigger2 = PlayerID(var(32)),Pos x < PlayerID(var(33)),Pos x
trigger2 = PlayerID(var(33)),Pos x < PlayerID(var(34)),Pos x
trigger2 = Abs(PlayerID(var(32)),Pos x - PlayerID(var(33)),Pos x) < IfElse(Abs(Pos x - PlayerID(var(32)),Pos x)>Abs(PlayerID(var(33)),Pos x - PlayerID(var(34)),Pos x),Abs(Pos x - PlayerID(var(32)),Pos x),Abs(PlayerID(var(33)),Pos x - PlayerID(var(34)),Pos x))
trigger3 = facing = -1 && !var(33)
trigger3 = Pos x > PlayerID(var(32)),Pos x
trigger3 = PlayerID(var(32)),Pos x > PlayerID(var(34)),Pos x
trigger4 = facing = -1 && var(33)
trigger4 = Pos x > PlayerID(var(32)),Pos x
trigger4 = PlayerID(var(32)),Pos x > PlayerID(var(33)),Pos x
trigger4 = PlayerID(var(33)),Pos x > PlayerID(var(34)),Pos x
trigger4 = Abs(PlayerID(var(32)),Pos x - PlayerID(var(33)),Pos x) < IfElse(Abs(Pos x - PlayerID(var(32)),Pos x)>Abs(PlayerID(var(33)),Pos x - PlayerID(var(34)),Pos x),Abs(Pos x - PlayerID(var(32)),Pos x),Abs(PlayerID(var(33)),Pos x - PlayerID(var(34)),Pos x))
var(35) = 2

[State -2, Mark Teammate Trapped]
type = varset
triggerall = RoundState = 2
triggerall = !(InGuardDist || MoveType = H)
triggerall = var(34)
triggerall = var(32) && var(33)
triggerall = var(35) != 3
;triggerall = PlayerID(var(34)),MoveType = H
triggerall = !(PlayerID(var(34)),Pos y < Ceil(-80 * Const(size.yscale)))
trigger1 = facing = 1
trigger1 = Pos x < PlayerID(var(32)),Pos x
trigger1 = PlayerID(var(32)),Pos x < PlayerID(var(34)),Pos x
trigger1 = PlayerID(var(34)),Pos x < PlayerID(var(33)),Pos x
trigger1 = PlayerID(var(32)),facing =1 && PlayerID(var(33)),facing = -1
trigger2 = facing = -1
trigger2 = Pos x > PlayerID(var(32)),Pos x
trigger2 = PlayerID(var(32)),Pos x > PlayerID(var(34)),Pos x
trigger2 = PlayerID(var(34)),Pos x > PlayerID(var(33)),Pos x
trigger2 = PlayerID(var(32)),facing =-1 && PlayerID(var(33)),facing = 1
var(35) = 3

[State -2, Mark Teammate Cornered]
type = varset
triggerall = RoundState = 2
triggerall = !(InGuardDist || MoveType = H)
triggerall = var(34)
triggerall = var(32) && var(33)
triggerall = var(35) != 4
;triggerall = PlayerID(var(34)),MoveType = H
triggerall = !(PlayerID(var(34)),Pos y < Ceil(-80 * Const(size.yscale)))
trigger1 = PlayerID(var(34)),BackEdgeBodydist < 30
trigger1 = Abs(PlayerID(var(34)),pos x) > Abs(PlayerID(var(32)),pos x)
trigger1 = Abs(PlayerID(var(34)),pos x) > Abs(PlayerID(var(33)),pos x)
trigger1 = Abs(PlayerID(var(34)),pos x) - Abs(PlayerID(var(32)),pos x) < 60
trigger1 = Abs(PlayerID(var(34)),pos x) - Abs(PlayerID(var(33)),pos x) < 60
var(35) = 4

[State -2 mark Im fight in lead or fight alone]
type = varset
triggerall = var(35)
triggerall = var(34)
triggerall = var(32)
trigger1 = facing = PlayerID(var(34)), facing
trigger1 = facing = 1
trigger1 = PlayerID(var(34)),pos x < pos x
trigger1 = pos x < PlayerID(var(32)), pos x
trigger2 = facing = PlayerID(var(34)), facing
trigger2 = facing = -1
trigger2 = PlayerID(var(34)),pos x > pos x
trigger2 = pos x > PlayerID(var(32)),pos x
trigger3 = facing != PlayerID(var(34)), facing
trigger3 = facing = 1
trigger3 = pos x > PlayerID(var(34)), pos x
trigger4 = facing != PlayerID(var(34)), facing
trigger4 = facing = -1
trigger4 = pos x < PlayerID(var(34)), pos x
var(35) = 0

[State -2 Clear Teammate mark]
type = varset
triggerall = var(35)
trigger1 = !var(34)
trigger2 = InGuardDist
trigger3 = MoveType = H
trigger4 = var(34)
trigger4 = PlayerID(var(34)),Pos y < Ceil(-80 * Const(size.yscale))
trigger5 = var(32) = 0
var(35) = 0


;======== Damage Scaling System ===========
;var(9) Counter Hit
;var(13) Hit Counter
;fvar(10) Scaling fact by Hit
;fvar(11) Scaling fact by P2Lift
;fvar(29) Scaling fact

[State -2, Reset fvar(10)]
type = varset
triggerall= RoundState=2
triggerall= fvar(10) != 1
trigger1 = Enemynear,Ctrl
trigger2 = Enemynear,StateNo < 5000 || Enemynear,MoveType != H
fvar(10) = 1
ignorehitpause=1

[State -2, Damage Scaling by States]
type=varset
triggerall= RoundState=2
triggerall= StateNo != 3510
triggerall= (Enemynear,StateNo = [5000,5199]) || Enemynear,MoveType = H
trigger1= NumEnemy && var(13)<10 && !var(20)
fvar(10)= ifelse(var(13)<3 && PrevStateNo < 3000,1,1.1-var(13)*(0.1)-0.2*(PrevStateNo>=3000))
ignorehitpause=1

[State -2, Damage Scaling by States]
type=varset
triggerall= RoundState=2
triggerall= (Enemynear,StateNo = [5000,5199]) || Enemynear,MoveType = H
trigger1= NumEnemy && (var(13)>=10 || var(20))
trigger1= hitcount = 1 && Enemy,time = 0
fvar(10)= fvar(10)* (0.9 - 0.1*(var(20)>0))
ignorehitpause=1

[State -2, Attack var by P2Life]
type=varset
triggerall= RoundState=2
trigger1= NumEnemy
fvar(11)= ifelse(Enemynear,life > Enemynear,lifemax/2,1,Ifelse(Enemynear,life > Enemynear,lifemax/4,0.95,Ifelse(Enemynear,life > Enemynear,lifemax/6,0.9,0.75)))
ignorehitpause=1

[State -2, PreDampener var set]
type=varset
trigger1= RoundState=2
fvar(28)= (var(9)*0.25) + fvar(10) * fvar(11) * Ifelse(var(20),(1.0/(1+(var(13)/25.0))),1)
ignorehitpause=1

[State -2, Dampener var set]
type=varset
trigger1= RoundState=2
fvar(29)= IFElse(fvar(28) < (0.1+0.1*(var(20)!=0)),0.1+0.1*(var(20)!=0),fvar(28))
ignorehitpause=1

[State -2, Dampener Apply]
type=attackmulset
trigger1= RoundState=2
value= fvar(29)
ignorehitpause=1


;[State -2, Defense Levels]
;type = DefenceMulSet
;trigger1 = var(40)
;value = ifElse(var(40) = 2, 1.25, 1.125) * (const(data.fall.defence_mul) ** GetHitVar(FallCount))
;ignoreHitPause = 1

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
value = 11, ifElse((var(40) = 1), 2, 1) + 2 * (StateNo = 5130)
ignoreHitPause = 1

[State -2, RemoveExplod]
type = RemoveExplod
trigger1 = NumExplod(1125) && StateNo != [1100,1130]
id = 1125
ignoreHitPause = 1

[State -2, RemoveExplod]
type = RemoveExplod
trigger1 = NumExplod(3005) && StateNo != [3000,3050]
id = 3005
ignoreHitPause = 1

[State -2, Helicopter Sound Loop Off]
type = StopSnd
trigger1 = Time = 1
trigger1 = PrevStateNo = 5990 && StateNo != 5990
trigger2 = NumHelper(5992)
trigger2 = Helper(5992), StateNo != 5992
channel = 5
ignoreHitPause = 1


[State -2, Debug]
type = displaytoclipboard
trigger1 = 1
text = "AI = %d Task = %d, Damage=%d, XBDIST %d XDIST %d"
params = AIlevel, var(59),fvar(29),P2Bodydist x, P2Dist y
ignorehitpause = 1

[State -2, Debug]
type = appendtoclipboard
trigger1 = 1
text = "\n var(20)%d var(10)%d var(46)%d var(4) %d"
params = var(20),var(10),var(46), var(4)
ignorehitpause = 1



;===========================================================================
;===============================<-3 STATES>=================================
;===========================================================================
[StateDef -3]

[State -3, GameTime]
type = VarSet
trigger1 = 1
var(58) = GameTime
ignoreHitPause = 1

[State -3, No Reverse Guard]
type = AssertSpecial
triggerall = StateNo = [200,4999]
triggerall = MoveType = A
trigger1 = Enemynear,P2Dist x < 0
flag = unguardable

[State -3, ProjContact Reset]
type = VarSet
triggerAll = var(18)
trigger1 = (StateNo != [1000,1030])
var(18) = 0

[State -3, Active Projectile Flag Off]
type = VarSet
trigger1 = var(29) && NumHelper(1005)
trigger1 = Helper(1005), StateNo != 1005 && Helper(1005), StateNo != 1035
trigger2 = var(29) && !NumHelper(1005)
var(29) = 0
ignoreHitPause = 1

[State -3, Active Projectile Flag On]
type = VarSet
triggerAll = var(20) <= 0 && !var(29)
triggerAll = NumHelper(1005)
trigger1 = Helper(1005), StateNo = 1005
trigger2 = Helper(1005), StateNo = 1035
var(29) = 1
ignoreHitPause = 1

;-----------<Special info Announcement>---------
[State -3, Dodge inform clear]
type = varset
trigger1 = (var(44) & 1) && time <= 1
trigger1 = !(StateNo = 765 || StateNo = 710 || StateNo = 715 || StateNo = 1500)
var(44) = var(44) - 1

[State -3, Dodge inform]
type = varset
trigger1 = !(var(44) & 1) && time <= 1
trigger1 = (StateNo = 765 || StateNo = 710 || StateNo = 715 || StateNo = 1500)
var(44) = var(44) + 1

[State -3, Charge inform clear]
type = varset
trigger1 = (var(44) & 2) && time <= 1
trigger1 = StateNo != 730
var(44) = var(44) - 2

[State -3, Charge inform]
type = varset
trigger1 = !(var(44) & 2) && time <= 1
trigger1 = StateNo = 730
var(44) = var(44) + 2

[State -3, Alpha Counter inform Clear]
type = varset
trigger1 = (var(44) & 4) && time <= 1
trigger1 = !(StateNo = 750 || PrevStateNo = 750)
var(44) = var(44) - 4

[State -3, Alpha Counter inform]
type = varset
trigger1 = !(var(44) & 4) && time <= 1
trigger1 = (StateNo = 750 || PrevStateNo = 750)
var(44) = var(44) + 4

[State -3, Fast Attack inform Clear]
type = varset
trigger1 = (var(44) & 16) && time <= 1
trigger1 = !(StateNo = 200 || StateNo = 400 || StateNo = 430)
var(44) = var(44) - 16

[State -3, Fast Attack inform]
type = varset
trigger1 = !(var(44) & 16) && time <= 1
trigger1 = (StateNo = 200 || StateNo = 400 || StateNo = 430)
var(44) = var(44) + 16

[State -3, Hadoken inform Clear]
type = varset
trigger1 = (var(44) & 32) && time <= 1
trigger1 = !(StateNo = [1000,1030])
var(44) = var(44) - 32

[State -3, Hadoken inform]
type = varset
trigger1 = !(var(44) & 32) && time <= 1
trigger1 = (StateNo = [1000,1030])
var(44) = var(44) + 32


[State -3, dizzy restart]
type=varset
triggerall = var(39)=2
trigger1 = PrevstateNo = 5300
trigger2 = Ctrl || StateNo < 5000
var(39) = 0

[state -3, dizzy varadd]
type=varadd
triggerall= roundstate=2 && movetype=H
triggerall= !var(39)
triggerall= !NumHelper(6300)
triggerall= (stateno!=[120,159]) && (stateno!=[700,702])
triggerall= stateno>=5000
triggerall= GetHitVar(hitcount)<4
triggerall= Enemynear,var(20) = 0
trigger1= !time
fvar(39)= 3 + 6*(Enemynear,hitdefattr=SCA,SA) + 7*((Enemynear,hitdefattr=SCA,NA) && GetHitvar(animtype)=0) + 20*((Enemynear,hitdefattr=SCA,NA)&&GetHitvar(animtype)=1) + 28*((Enemynear,hitdefattr=SCA,NA)&&GetHitvar(animtype)>1)
ignorehitpause=1

[state -3, dizzy varsubtract]
type=varadd
triggerall= !var(39)
triggerall= !NumHelper(6300)
triggerall= fvar(39) && fvar(39)<var(38)
triggerall= StateNo != [5000,5999]
trigger1= time%10=0
fvar(39)= ifelse((fvar(39)>0 && fvar(39)<2),-(fvar(39)),-1-StateType=C-StateType=L)

[State -3, Ready Dizzy State]
type=varset
triggerall= RoundState=2 && !var(39)
trigger1= fvar(39)>=var(38)
var(39)=1

[State -3, Enter Dizzy State]
type=ChangeState
triggerall= RoundState=2
triggerall= var(39) =1
trigger1= (StateNo=5001 + 10*StateType=C) && HitOver
trigger2= StateNo=5120 && Anim=5120 && !Animtime
value=5300

[state -3, Ducks]
type=helper
triggerall = roundstate = 2
trigger1= !NumHelper(6300)
trigger1= var(39)=1
helpertype=normal
name= "Dizzy Ducks"
ID=6300
stateno=6300
postype=p1
pos= 0,0
ownpal=1
trans=none
persistent=0

[state -3, Hif fall set]
type = hitfallset
triggerall = roundstate = 2
triggerall = StateNo = [5000,5999]
triggerall = time =1
trigger1 = var(39)=1
value = 1


[state -3, dizzy var reset]
type = varset
trigger1= RoundState != 2
trigger1= fvar(39)
fvar(39) = 0



[State -3, Assert: NoWalk after Parry]
type = AssertSpecial
trigger1 = var(26) > 0
trigger1 = var(26) := (var(26)-1)
flag = NoWalk
ignoreHitPause = 1


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
color = 0
add = 120,80,0
sinadd = 64,32,5,3
time = 1
ignoreHitPause = 1


[State -3, Movement AfterImage]
type = AfterImage
triggerAll = Time = 1 && !var(20)
trigger1 = StateNo = 50 && (var(3) = 2 || var(3) = 3)
trigger2 = (StateNo = [710,715]) || StateNo = 765
trigger3 = StateNo = 5983
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
triggerall = var(10) = 0
trigger1 = (StateNo = 3000 || StateNo = 3100 || StateNo = 3200) && Time = 40
trigger2 = StateNo = 3700 && Time = 40
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
triggerall = var(10) = 1 
trigger1 = (StateNo = 3000 || StateNo = 3100 || StateNo = 3200) && Time = 40
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
triggerall = var(10) = 2
trigger1 = StateNo = 3300 && Time = 3
trigger2 = StateNo = 3500 && Time = 40
trigger3 = StateNo = 3601 && Time = 9
trigger4 = StateNo = 3701 && Time = 77
time = 2
timeGap = 1
frameGap = 10
length = 21
palcolor = 250
palinvertall = 0
palbright = 200,100,0
palcontrast = 200,100,0
palpostbright = 0,0,0
paladd = 200,100,10
palmul = 0.4,0.2,0.1
trans=add1

[State -3, AfterImage Persist]
type = AfterImageTime
trigger1 = StateNo = 50 || (StateNo = [600,699])
trigger1 = (var(3) = 2 || var(3) = 3) && vel y < -1
trigger2 = var(20)
trigger3 = StateNo = [700,715]
trigger4 = (StateNo = [3000,4999]) && StateNo != 3701
trigger5 = StateNo = 5983 && AnimElemTime(3) < 0
trigger6 = StateNo = 3701 && AnimElemTime(29) < 0
trigger7 = StateNo = 3701 && AnimElemTime(30) >= 0
time = 2

[State -3, System Corner Push]
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
trigger1 = P2Dist y >= (EnemyNear, const(size.height) - 12)
trigger2 = P2StateType = C
trigger2 = P2Dist y >= (EnemyNear, const(size.height) - 28)
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

[State -3, Custom Combo Finish]
type = Helper
triggerAll = WinKO && var(20)
triggerAll = RoundState = 3 && !NumHelper(8600)
trigger1 = MoveHit = [1,4]
trigger2 = NumHelper(1005)
trigger2 = (Helper(1005), StateNo = [1005,1007]) && (Helper(1005), var(18))
trigger3 = StateNo = 810 && (AnimElemTime(9) = [0, 1])
trigger4 = StateNo = 821 && (AnimElemTime(3) = [0, 1])
trigger5 = StateNo = 830 && (AnimElemTime(5) = [0, 1])
trigger6 = StateNo = 861 && (AnimElemTime(2) = [0, 1])
trigger6 = Anim = 862 + (var(40) = 1)
helperType = Normal
stateNo = 8600
ID = 8600 + 0 * (var(23) := 900)
name = "Super Finish"
posType = left
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
trigger2 = (StateNo = [3000,3050])
trigger2 = var(23) := 3000
trigger3 = (StateNo = [3100,3150])
trigger3 = var(23) := 3100
trigger4 = (StateNo = [3200,3299])
trigger4 = var(23) := 3200
trigger5 = StateNo = 3300
trigger5 = var(23) := 3300
trigger6 = StateNo = 3400
trigger6 = var(23) := 3400
trigger7 = (StateNo = [3500,3599])
trigger7 = var(23) := 3500
trigger8 = (StateNo = [3700,3799])
trigger8 = var(23) := 3700
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
