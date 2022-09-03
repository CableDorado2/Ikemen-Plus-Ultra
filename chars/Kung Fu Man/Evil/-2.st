;---------------------------------------------------------------------------
; States that are always executed (use statedef -2)
;---------------------------------------------------------------------------

[StateDef -2]

[State 0, Helper]
type = Helper
trigger1 = roundstate < 2
trigger1 = !numhelper(444)
helpertype = normal
name = "CONFIG"
ID = 444
stateno = 444
pos = 444,444
postype = p1
facing = 1
ownpal = 1
supermovetime = 65535
pausemovetime = 65535
ignorehitpause = 1

[State I blame Neon Tiger]
type = Helper
trigger1 = enemynear, name = "Slot Machine Mk II"
trigger1 = enemynear, stateno = 20003
trigger1 = enemynear, time = 1
helpertype = normal
name = "BLAM"
ID = 4550
stateno = 4550
pos = 0,0
postype = p1
ownpal = 1
supermovetime = 65535
pausemovetime = 65535
ignorehitpause = 1

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = numhelper(3200)
flag = nojugglecheck
ignorehitpause = 1

[State ANTI-MINDGAME-GUARD]
type = VarAdd
triggerall = var(50) < 120
trigger1 = p2movetype = A
trigger1 = stateno = [120,169]
var(50) = 1
ignorehitpause = 1
[State ANTI-MINDGAME-GUARD]
type = VarSet
triggerall = var(50) > 0
trigger1 = numenemy != 0
trigger1 = enemynear, movecontact = 1
var(50) = ceil(var(50)*0.8)
ignorehitpause = 1
[State ANTI-MINDGAME-GUARD]
type = VarAdd
triggerall = var(50) > 0
trigger1 = p2movetype != A
trigger1 = stateno != [120,169]
trigger1 = (gametime%3)=0
var(50) = -1
ignorehitpause = 1

[State 0, VarSet]
type = VarSet
triggerall = var(26) != var(25)
trigger1 = !numhelper(3030)
trigger2 = var(25) != 0
var(26) = var(25)
ignorehitpause = 1

[State 0, VarSet]
type = VarSet
trigger1 = var(25)
trigger1 = (p2movetype != H) || (p2stateno = [120,169])
trigger1 = !numhelper(3200)
trigger1 = !numhelper(3250)
;trigger1 = !numhelper(3030)
var(25) = 0
ignorehitpause = 1

[State 0, Helper]
type = Helper
triggerall = fvar(30) != 0
trigger1 = p2movetype = H
trigger1 = (enemynear,gethitvar(hitcount)- var(26) ) >= 5
trigger1 = !numhelper(3030)
trigger1 = p2stateno != [120,169]
trigger1 = numenemy = 1
helpertype = normal
name = "Combo announcer"
ID = 3030
stateno = 69
pos = 0,0
postype = p1
ownpal = 1
supermovetime = 65535
pausemovetime = 65535
ignorehitpause = 1

[State -2, BackupLife]
type = VarSet
trigger1 = !numhelper(202)
var(24) = life
ignorehitpause = 1
[State -2, SNES9X]
type = LifeSet
trigger1 = numhelper(202)
value = var(24)
[State -2, SNES9X]
type = PowerAdd
trigger1 = numhelper(202)
value = 5
;[State TEST]
;type = PlaySnd
;trigger1 = numhelper(202)
;value = 5,0

[State -2, ForGreatJustice]
type = Helper
trigger1 = numhelper(201) = 0
ID = 201
stateno = 201
pos = 99999,99999
supermovetime = 9999
pausemovetime = 9999

[State 0, ]
type = VarSet
trigger1 = p2movetype = H && (enemynear,gethitvar(hitcount))
trigger2 = (fvar(14):=0)
fvar(14) = enemynear,gethitvar(hitcount)-var(25)
ignorehitpause = 1
[State 0, ]
type = VarSet
trigger1 = fvar(14) = 0
fvar(15) = 0
ignorehitpause = 1
[State 0, ]
type = VarSet
;trigger1 = stateno != [1000,3999]
trigger1 = hitdefattr = SCA, NA, NT, NP
;trigger2 = (fvar(15):=0)
fvar(15) = fvar(14) / 27
ignorehitpause = 1
[State 0, ]
type = VarSet
;trigger1 = stateno = [1000,1999]
trigger1 = hitdefattr = SCA, SA, ST, SP
;trigger2 = (fvar(15):=0)
fvar(15) = fvar(14) / 13
ignorehitpause = 1
[State 0, ]
type = VarSet
;trigger1 = stateno = [2000,3999]
trigger1 = hitdefattr = SCA, HA, HT, HP
;trigger2 = (fvar(15):=0)
fvar(15) = fvar(14) / 47
ignorehitpause = 1
[State 0, AttackMulSet]
type = AttackMulSet
trigger1 = 1
time = 2
value = ifelse(p2movetype!=H,1,1 - ifelse(fvar(15)>.65,.65,fvar(15)))
ignorehitpause = 1


[State 0, Helper]
type = Helper
trigger1 = !numhelper(900)
helpertype = normal
name = "System Gauge"
ID = 900
stateno = 900
pos = 0,0
postype = p1
ownpal = 1
supermovetime = 65535
pausemovetime = 65535
ignorehitpause = 1

[State KFM winpose]
type = VarSet
triggerall = !var(46)
trigger1 = p2name = "Kung Fu Man" || p4name = "Kung Fu Man"
trigger2 = p2name = "Super Kung Fu Man" || p4name = "Super Kung Fu Man"
trigger3 = p2name = "Hokuto KFM" || p4name = "Hokuto KFM"
trigger4 = p2name = "KFM Plus" || p4name = "KFM Plus"
trigger5 = p2name = "Kung Fu Man in add004" || p4name = "Kung Fu Man in add004"
trigger6 = p2name = "Kung Fu Man AI" || p4name = "Kung Fu Man AI"
trigger7 = p2name = "SF3 Kfm" || p4name = "SF3 Kfm"
trigger8 = p2name = "Combo Kung Fu Man" || p4name = "Combo Kung Fu Man"
trigger9 = p2name = "Kung Fu Man SSJ" || p4name = "Kung Fu Man SSJ"
v = 46
value = 1
[State ahuron winpose]
type = VarSet
triggerall = !var(46)
trigger1 = enemynear, authorname = "ahuron"
trigger2 = enemynear, authorname = "beppu"
v = 46
value = 2

[State 0, ]
type = ChangeState
trigger1 = stateno = 194
trigger1 = roundstate = 1
trigger1 = p2stateno = [1940,1949]
trigger1 = p2bodydist x <= 40
value = 220
ctrl = 0

[State 0, ]
type = PowerSet
triggerall = var(30) = 1
trigger1 = stateno != 19666
trigger2 = time != 0
value = 0
ignorehitpause = 1
[State 0, VelAdd]
type = VarAdd
trigger1 = var(30) = 1
trigger1 = var(32) > 0
var(32) = -1
[State 0, VelAdd]
type = LifeAdd
trigger1 = (gametime%2)=0
trigger1 = var(30) = 1
trigger1 = var(31) = 0
trigger1 = var(32) <= 0
value = -1
kill = 0
[State 0, VelAdd]
type = VarSet
trigger1 = var(30) = 1
trigger1 = var(31) = 1
trigger1 = var(32) > 0
var(32) = 0

[State 0, ]
type = Helper
triggerall = var(30) = 0
triggerall = numhelper(666) = 0
trigger1 = winko
trigger2 = roundstate > 2
trigger2 = life = 0
trigger2 = p2life = 0
helpertype = normal
name = "Gonna kick some ass!"
ID = 666
pos = 0,0
postype = p1
facing = 1
stateno = 666
supermovetime = 65535
pausemovetime = 65535
ignorehitpause = 1

[State 0, ]
type = PlaySnd
trigger1 = anim = 5300
trigger1 = Animelem = 2
value = S2,12
channel = 0

; Within StateDef -2, none of your own AI-related code should be placed
; above these next two controllers.

[State -2, StopAI]
type = VarSet
triggerall = (var(59) > 0)
trigger1 = (RoundState != 2)
trigger2 = !Alive
var(59) = -2
IgnoreHitPause = 1

; This controller is optional.  It lets you slightly simplify the triggers
; in your AI code: var(0) and !var(0) instead of var(59)>0 and var(59)<1.
; Another benefit is that it makes it easier for users to disable your AI,
; if they so choose.
[State -2, Simplifier]
type = VarSet
trigger1 = (var(59) = 1)
trigger2 = (var(55):=0)
var(55) = 1	; Another option is to replace 1 with something like MatchNo, if
		; you want to design your AI to have varying levels of difficulty.
IgnoreHitPause = 1

;[State -2, DTC]
;type = DisplayToClipboard
;trigger1 = 1
;text = "p2bodydist x = %d p2bodydist y = %d com = %d amul %f guard = %d"
;params = floor(p2bodydist x),floor(p2bodydist y),floor(fvar(14)),(1 - ifelse(fvar(15)>.5,.5,fvar(15))),(enemynear,moveguarded);, MatchNo, NumPartner
;IgnoreHitPause = 1

[State 0, VarSet]
type = VarSet
trigger1 = time = 1
trigger1 = movetype = A
var(51) = floor(p2bodydist x)
ignorehitpause = 1

[State -2, DTC]
type = DisplayToClipboard
trigger1 = 1
text = "guard = %d, lastbodydist = %d"
params = var(50),var(51)
IgnoreHitPause = 1

[State 0, AppendToClipboard]
type = AppendToClipboard
trigger1 = 1
text = "\ncombo = %d, 25 = %d , 26 = %d"
params = (enemynear,gethitvar(hitcount))-var(26),var(25),var(26)
ignorehitpause = 1


;---------------------------------------------------------------------------
; States that are executed when in self's state file (use statedef -3)
;---------------------------------------------------------------------------

[Statedef -3]

;This controller plays a sound everytime KFM lands from a jump, or
;from his back-dash.
[State -3, Landing Sound]
type = PlaySnd
triggerall = Time = 1
trigger1 = stateno = 52 ;Jump land
trigger2 = stateno = 106 ;Run-back land
value = 40, 0

; It is very important that this controller NOT be moved to State -2, as putting
; it there would defeat the entire purpose of the controller, allowing the
; helper method to erroneously set the AI variable.
; And within State -3, don't put any ChangeState controllers before this
; controller, lest you unnecessarily delay your character's AI activation.
[State -3, GameTimeVar]
type = VarSet
trigger1 = 1
var(58) = GameTime
IgnoreHitPause = 1

; Kamek and Luchini appear to have been the first ones to use the IsHomeTeam AI activation concept.
; Feel free to move this controller to your character's intro state for slightly better efficiency.
[State -3, SetAI]
type = VarSet
triggerall = !RoundState
triggerall = IsHomeTeam
trigger1 = (TeamSide = 2)
trigger2 = (MatchNo > 1)
var(59) = 1

; Feel free to move this controller to your character's intro state for slightly better efficiency.
; Note that it may give P2 a slight unfair advantage in simul team vs mode, so you
; may want to disable it.  But then, since when has Mugen been about fairness? =P
[State -3, Unfair]; Is this reliable?
type = VarSet
trigger1 = !RoundState
trigger1 = (var(59) != 1)
trigger1 = NumPartner
trigger1 = (ID > Partner,ID)
trigger1 = (TeamSide = 2)
var(59) = 1

[State -3, AI Helper (Compatibly Partnered Version)]
type = Helper
trigger1 = !var(59)
trigger1 = !NumHelper(9742)
trigger1 = (RoundState = 2)
trigger1 = Alive
trigger1 = NumPartner
trigger1 = Partner,SelfAnimExist(9741)
HelperType = normal
name = "AI Helper (Simul Version)"
ID = 9742
pos = 9999999,99999
StateNo = 9742
KeyCtrl = 1
PauseMoveTime = 999999999
SuperMoveTime = 999999999

; If you want to use the Guard mode, Dummy mode, Distance, or Button jam dummy control
; options in Training mode without activating the dummy's AI while working on your
; character, then all you need to do is temporarily disable this controller.
[State -3, AI Helper]
type = Helper
triggerall = !var(59)
triggerall = !NumHelper(9741)
triggerall = (RoundState = 2)
triggerall = Alive
trigger1 = !NumPartner
trigger2 = !(Partner,SelfAnimExist(9741))
HelperType = normal
name = "AI Helper"
ID = 9741
pos = 9999999,99999
StateNo = 9741
KeyCtrl = 1
PauseMoveTime = 999999999
SuperMoveTime = 999999999

[State -3, TurnBackOnAI]
type = VarSet
trigger1 = (var(59) = -2)
trigger1 = (RoundState = 2)
trigger1 = Alive
var(59) = 1

; According to Roque, this method works in Mugen version 2002.04.14,
; whereas the old humanly-impossible commands method does not.
; It is very important that this controller NOT be moved to State -2.
; Note that this part won't work if AI.Cheat is turned off in mugen.cfg.
[State -3, XOR]
type = VarSet
triggerall = var(59)!=1
trigger1 = (command = "a") ^^ (command = "a2")
trigger2 = (command = "b") ^^ (command = "b2")
trigger3 = (command = "c") ^^ (command = "c2")
trigger4 = (command = "x") ^^ (command = "x2")
trigger5 = (command = "y") ^^ (command = "y2")
trigger6 = (command = "z") ^^ (command = "z2")
trigger7 = (command = "start") ^^ (command = "start2")
trigger8 = (command = "holda") ^^ (command = "holda2")
trigger9 = (command = "holdb") ^^ (command = "holdb2")
trigger10 = (command = "holdc") ^^ (command = "holdc2")
trigger11 = (command = "holdx") ^^ (command = "holdx2")
trigger12 = (command = "holdy") ^^ (command = "holdy2")
trigger13 = (command = "holdz") ^^ (command = "holdz2")
trigger14 = (command = "holdstart") ^^ (command = "holdstart2")
trigger15 = (command = "recovery") ^^ (command = "recovery2")
trigger16 = (command = "holdfwd") ^^ (command = "holdfwd2")
trigger17 = (command = "holdback") ^^ (command = "holdback2")
trigger18 = (command = "holdup") ^^ (command = "holdup2")
trigger19 = (command = "holddown") ^^ (command = "holddown2")
;Add more as desired. (See my notes in the CMD.)
var(59) = 1

; Within StateDef -3, none of your own AI-related code should come after the code
; provided here (and putting it before the code is also generally a bad idea).
; It's better to use State -1 (or, in special circumstances, State -2) instead.

; And finally, for lack of a better place to put this until I get
; around to writing an actual tutorial to go with the code:
; Many thanks to Roque for extensive testing in Linux Mugen.
; Also thanks to [E] for some help.

; Finally some non-AI stuff

[State 0, ]
type = ChangeState
trigger1 = ctrl = 1
trigger1 = statetype != A
trigger1 = screenpos x != [-10,330]
value = 229
ignorehitpause = 1

[State 0, ]
type = ScreenBound
trigger1 = p2stateno = [225,229]
trigger1 = p2movetype = H
value = 0
ignorehitpause = 1

[State 0, ]
type = VarRandom
trigger1 = movetype = H
trigger1 = alive
v = 5
range = 0,5
ignorehitpause = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = stateno = 5120
trigger1 = time = 1
value = S2,44+random%4
channel = 0

[State 0, ]
type = PlaySnd
trigger1 = alive
trigger1 = time = 1
trigger1 = stateno = 5000 || stateno = 5010 || stateno = 5030
trigger1 = random < 500
value = S5000,var(5)
channel = 0
volume = 255

[State 0, ]
type = PlaySnd
trigger1 = alive
trigger1 = time = 1
trigger1 = stateno = 5100
trigger1 = random < 500
value = S5000,3
channel = 0

[State 0, ]
type = AssertSpecial
trigger1 = numexplod(1999) = 1
flag = nobardisplay
flag2 = intro
ignorehitpause = 1

[State 0, ]
type = VarAdd
trigger1 = stateno != [120,169]
trigger1 = gethitvar(damage)
var(20) = gethitvar(damage) + gethitvar(animtype) + (gethitvar(fall)*3) + gethitvar(hitcount)
ignorehitpause = 1

[State 0, ]
type = VarAdd
trigger1 = movetype != H
trigger1 = ((gametime%4)=0) || (stateno=195)
trigger1 = var(20) > 0
var(20) = -1
ignorehitpause = 1

[State 0, ]
type = VarAdd
trigger1 = roundstate = 2
trigger1 = (gametime%2)=0
trigger1 = var(21) < 2000
var(21) = 1 + ifelse(p2movetype=H,1,0) + ifelse(movehit,4,0) + ifelse(stateno=195,3,0)
ignorehitpause = 1

[State 0, ]
type = VarAdd
triggerall = time = 1
triggerall = var(21) >= 1000
triggerall = prevstateno = [1000,1999]
trigger1 = stateno = 1000 || stateno = 1010 || stateno = 1020
trigger2 = stateno = 1050 || stateno = 1060 || stateno = 1070
trigger3 = stateno = 1100 || stateno = 1110 || stateno = 1120
trigger4 = stateno = 1150 || stateno = 1160 || stateno = 1170
trigger5 = stateno = 1200 || stateno = 1210 || stateno = 1220
trigger6 = stateno = 1250
trigger7 = stateno = 1300 || stateno = 1310 || stateno = 1320
trigger8 = stateno = 1350 || stateno = 1360 || stateno = 1370
trigger9 = stateno = 1450
var(21) = -1000
ignorehitpause = 1

[State 0, ]
type = VarSet
trigger1 = movetype = H
trigger1 = time = 1
trigger1 = prevstateno = [5300,5303]
var(20) = -250
ignorehitpause = 1

