; I'm a litter monitor tell my master what's going on right now :)
;=============== MONITOR HELPER ===========
[StateDef 32767]
type = A
physics = N
moveType = I
anim = 9741
ctrl = 0

[State Parent Check 1]
type = varset
trigger1 = var(2) = 0
trigger1 = PlayerIDExist(Const(size.proj.doscale))
var(2) = Const(size.proj.doscale)
ignoreHitPause = 1

[State Parent Check 2]
type = varset
trigger1 = var(2)
trigger1 = PlayerIDExist(Const(size.proj.doscale)) = 0
var(2) = 0
ignoreHitPause = 1

;======== Bind ==========
[State 32767, Bind to Enemynear]
type = posset
trigger1 = 1
x = Parent,Pos x + Abs(Parent,P2Dist x) * IfElse((Parent,pos x > Enemynear,pos x),-1,1)
y = 20
ignorehitpause = 1

[State 32767, Facing]
type = Turn
trigger1 = facing != Enemynear,facing
ignorehitpause = 1

[State 32767, Record current EnemyID]
type = varset
trigger1 = Enemynear,ID != var(3)
var(3) = Enemynear,ID
ignorehitpause = 1

;======== Censor ========
;Sense Attack --------------------

[State 32767, Enemy start attack]
type = varset
triggerall = var(4) = 0
trigger1 = P2MoveType = A && Enemynear,time <= 2
var(4) = 1
ignorehitpause = 1

[State 32767, Enemy attacking]
type = varset
triggerall = var(4) != 2
trigger1 = Enemynear, HitDefattr = SCA,AA,AP,AT
trigger2 = Enemynear, MoveType = A && (P2StateNo = [3000,4999]) && Enemynear,time < 2
var(4) = 2
ignorehitpause = 1

[State 32767, Enemy attacking ending]
type = varset
triggerall = var(4) = 2
trigger1 = !(Enemynear,Ctrl) && !(Enemynear, HitDefattr = SCA,AA,AP,AT)
trigger1 = IfElse(P2StateNo<3000,1,Enemynear,time>60)
trigger2 = abs(Enemynear,Animtime) < 10
var(4) = 3
ignorehitpause = 1

[State 32767, Enemy not attacking at all]
type = varset
triggerall = var(4)
trigger1 = Enemynear,ctrl
trigger2 = Enemynear,StateNo < 200
var(4) = 0
ignorehitpause = 1

[State 32767, tell parent the result]
type = parentvarset
trigger1 = parent,var(4) != var(4)
var(4) = var(4)
ignorehitpause = 1

;Detect Hadouken -----------------------------
[State 32767, Enemy Hadoken 3]
type = varset
triggerall = var(45) && var(46)
triggerall = P2StateType != A && Enemynear,pos y >= 0
triggerall = (P2StateNo = [1000,3999])
trigger1 = Enemynear, StateNo != var(45)
trigger1 = Enemynear, StateNo != var(46)
trigger1 = var(4) = [1,2]
trigger1 = abs(Enemynear, animtime) = 1
trigger1 = (Enemynear,NumHelper || Enemynear,NumProj)
var(47) = Enemynear, StateNo

[State 32767, Enemy Hadoken 2]
type = varset
triggerall = var(45) && !var(46) && !var(47)
triggerall = P2StateType != A && Enemynear,pos y >= 0
triggerall = (P2StateNo = [1000,3999])
trigger1 = var(4) = [1,2]
trigger1 = abs(Enemynear, animtime) = 1
trigger1 = (Enemynear,NumHelper || Enemynear,NumProj)
trigger1 = Enemynear, StateNo != var(45)
var(46) = Enemynear, StateNo

[State 32767, Enemy Hadoken 1]
type = varset
triggerall = !var(45) && !var(46) && !var(47)
triggerall = P2StateType != A && Enemynear,pos y >= 0
triggerall = (P2StateNo = [1000,3999])
trigger1 = var(4) = [1,2]
trigger1 = abs(Enemynear, animtime) = 1
trigger1 = (Enemynear,NumHelper || Enemynear,NumProj)
var(45) = Enemynear, StateNo

[State 32767, Enemy Hadokening end]
type = parentvarset
triggerall = Enemynear,var(32) != parent,ID
triggerall = (parent,var(46) & 32)
triggerall = Enemynear,time < 2
trigger1 = Enemynear,StateNo != var(45)
trigger1 = Enemynear,StateNo != var(46)
trigger1 = Enemynear,StateNo != var(47)
trigger2 = Enemynear, Ctrl
var(46) = parent,var(46) - 32

[State 32767, Enemy Hadokening]
type = parentvarset
triggerall = Enemynear,var(32) != parent,ID
triggerall = Roundstate = 2
triggerall = !(parent,var(46) & 32)
triggerall = (P2StateNo = [1000,3999])
triggerall = Enemynear,time < 2
trigger1 = (P2StateNo = var(45)) || (P2StateNo = var(46)) || (P2StateNo = var(47))
var(46) = parent,var(46) + 32


;---------- Detect Charging ----------
[State 32767, Remember Enemy charging stateno]
type = varset
trigger1 = Enemynear,Power > var(43)
trigger1 = P2MoveType = I && P2StateNo >= 160
trigger1 = Enemynear,vel x = 0 && !(Enemynear,Ctrl)
trigger1 = var(44) != P2StateNo
var(44) = P2StateNo

[State 32767, Record P2Power]
type = varset
trigger1 = Enemynear,Power != var(43)
var(43) = Enemynear,Power
ignorehitpause = 1

[State 32767, Report parent Enemy is not Charging]
type = parentvarset
triggerall = Enemynear,var(32) != parent,ID
trigger1 = (Parent,var(46) & 2)
trigger1 = var(44) && Enemynear,time < 2
trigger1 = var(44) != P2StateNo
var(46) = Parent,var(46) - 2

[State 32767, Report parent Enemy is Charging]
type = parentvarset
triggerall = Enemynear,var(32) != parent,ID
trigger1 = !(Parent,var(46) & 2)
trigger1 = var(44) && Enemynear,time < 2
trigger1 = var(44) = P2StateNo
var(46) = Parent,var(46) + 2

;---------- Detect Evade ----------
[State 32767, Enemy Evade StateNo]
type = varset
triggerall = !var(42) && Enemynear,time
triggerall = !(P2StateNo = [120,159]) && !(P2StateNo = [180,199]) && !(P2StateNo = [200,299])
triggerall = P2StateType != A && P2MoveType = I && (P2StateNo = [110,2999])
triggerall = P2StateNo != var(44) && !(Enemynear,Ctrl)
trigger1 = Abs(ParentDist x) < 100 && Parent,MoveType = A && Parent,HitDefAttr = SCA,AA
trigger2  = Enemynear,vel x
var(42) = P2StateNo

[State 32767, remote var(42) if its wrong]
type = varset
triggerall = var(42) = P2StateNo
trigger1 = P2MoveType = A
trigger2 = P2StateType = A
var(42) = 0

[State 32767, Report parent Enemy is not evading]
type = parentvarset
triggerall = Enemynear,var(32) != parent,ID
triggerall = Enemynear,time < 2
trigger1 = var(42)
trigger1 = (Parent,var(46) & 1)
trigger1 = Abs(var(42) - P2StateNo) > 20
var(46) = Parent,var(46) - 1

[State 32767, Report parent Enemy is evading]
type = parentvarset
triggerall = Enemynear,var(32) != parent,ID
triggerall = Enemynear,time < 2
trigger1 = var(42)
trigger1 = !(Parent,var(46) & 1)
trigger1 = Abs(var(42) - P2StateNo) <= 20
var(46) = Parent,var(46) + 1



;------- Detect fastest attack state -----
[State 32767, reset enemy attack state record]
type = varset
trigger1 = P2MoveType != A && var(39) 
var(39) = 0

[State 32767, Record enemy attack state 1]
type = varadd
triggerall = P2StateType != A && (P2StateNo = [202,499])
trigger1 = var(4)=1
var(39) = 1

[State 32767, Save the StateNo]
type = varset
triggerall = P2StateType != A && (P2StateNo = [200,499])
triggerall = P2StateNo != 200
triggerall = var(39) && var(4) != 1
trigger1 = var(39) < var(40)
trigger2 = var(40) = 0
trigger3 = (var(39) = var(40)) && P2StateType = C
var(41) = P2StateNo

[State 32767, Save the Record]
type = varset
triggerall = P2StateType != A && (P2StateNo = [200,499])
triggerall = P2StateNo != 200
triggerall = var(39) && var(4) != 1
trigger1 = var(39) < var(40)
trigger2 = var(40) = 0
trigger3 = (var(39) = var(40)) && P2StateType = C
var(40) = var(39)

[State 32767, tell parent enemy is not attacking fast]
type = parentvarset
triggerall = Enemynear,var(32) != parent,ID
triggerall = (Parent,var(46) & 16)
trigger1 = P2MoveType != A
var(46) = Parent,var(46) - 16

[State 32767, tell parent enemy is attacking fast]
type = parentvarset
triggerall = Enemynear,var(32) != parent,ID
triggerall = !(Parent,var(46) & 16)
trigger1 = var(40) && var(41)
trigger1 = P2StateNo = var(41) && var(4)<3
var(46) = Parent,var(46) + 16

;--- Copy Beterhans Character announcement ----
[State 32767, copy beterhans char var(44)]
type = parentvarset
trigger1 = Enemynear,AuthorName = "BeterHans"
trigger2 = Enemynear,var(32) = Parent,ID
trigger2 = Parent,var(46) != Enemynear,var(44)
var(46) = Enemynear,var(44)



;======== Debug Info ============
[State 32767, Debug]
type = displaytoclipboard
trigger1 = 1
text = "Player:%d's Enemy Monitor, Moniting Player:%d, Testing %d"
params = var(2) , var(3), Enemynear,NumHelper
ignorehitpause = 1

[State 32767, Debug]
type = appendtoclipboard
trigger1 = 1
text = "\nvar(43)%d var(44)%d var(47)%d"
params = var(43), var(44), var(47)
ignorehitpause = 1

;======== Safe exit =============
[State 32767, Safe 1]
type = SelfState
trigger1 = !IsHelper
value = 0
ctrl = 1

[State 32767, Safe 2]
type = Destroyself
trigger1 = NumHelper(32767) > 2
trigger2 = !NumEnemy || RoundState != 2
trigger3 = Root,AILevel = 0
trigger4 = !var(2)

;======= var info =========
;var(2) is the masters player ID
;var(3) is the moniting enemy ID
;var(4) is Enemy attack state	0 is not attack	1 is pose to attack 2 is attacking 3 is ending
;var(39)Enemy attack timer
;var(40)Enemy attack record
;var(41)Enemy fastest attack
;var(42)Enemy Evade StateNo
;var(43)Enemy last Power point
;var(44)Enemy Charging stateNo work with root var(47)
;var(45~47) Enemy Fireball stateno


;======= tell parrent =======
; var(4) 	Reported by Monitor Enemy attack States.
; var(46) - Specal Info pushed to master
