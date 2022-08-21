; _________________________________________
;| Ken by Phantom.of.the.Server & Jmorphman|
; ?
;==============================================================================================
;========================================<NORMAL MOVES>========================================
;==============================================================================================

;===========<STANDING FAR LIGHT PUNCH>==========
[StateDef 200]
type = S
physics = S
moveType = A
anim = 200
ctrl = 0
velset = 0,0
juggle = ifelse((prevstateno = [200, 4999]), 0, 8) * !var(20)
sprPriority = 1
powerAdd = 0
facep2 = 1

[State 200, Jump to 205]
type = ChangeState
trigger1 = !time && P2Bodydist x < 15
value = 205

[State 200, Voice]
type = PlaySnd
trigger1 = AnimElem = 1 && Random < 200
value = 4, ifElse(Random < 500, 1, 2) + 9 * (var(40) = 1)
channel = 0

[State 200, Woosh]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1,0
channel = 1

[State 200, HitDef]
type = HitDef
trigger1 = Anim = 200
trigger1 = AnimElem = 2
forceNoFall = !var(20)
attr = S, NA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = 30,0
getpower = 72 * !var(20), 36 * !var(20)
givepower = 36, 36
pauseTime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
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
ground.cornerPush.velOff = 0; Use Custom fvar(5)
guard.velocity = ifElse(var(20), -2.41, -4.49)
guard.cornerPush.velOff = 0; Use Custom fvar(5)
air.velocity = -4, -4
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(51) := 0)
guardSound = -1 + 0 * (var(52) := 0)
sparkNo = -1 + 0 * (var(53) := 8010)
guard.sparkNo = -1 + 0 * (var(54) := 8000)
sparkXY = -10 + 0 * (var(55) := 78), var(56):= -84
palFX.time = 12 * var(9)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48
ID = 200


[State 200, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(4) >= 0
moveType = I

[State 200, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;===========<STANDING CLOSE LIGHT PUNCH>==========
[StateDef 205]
type = S
physics = S
moveType = A
anim = 205
ctrl = 0
velset = 0,0
juggle = ifelse((prevstateno = [200, 4999]), 0, 8) * !var(20)
sprPriority = 1
powerAdd = 0
facep2 = 1

[State 205, Voice]
type = PlaySnd
trigger1 = AnimElem = 1 && Random < 200
value = 4, ifElse(Random < 500, 1, 2) + 9 * (var(40) = 1)
channel = 0

[State 205, Woosh]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1,0
channel = 1

[State 205, HitDef]
type = HitDef
trigger1 = Anim = 205
trigger1 = AnimElem = 2
forceNoFall = !var(20)
attr = S, NA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = 30,0
getpower = 72 * !var(20), 36 * !var(20)
givepower = 36, 36
pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
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
ground.cornerPush.velOff = 0; Use Custom fvar(5)
guard.velocity = ifElse(var(20), -2.41, -4.49)
guard.cornerPush.velOff = 0; Use Custom fvar(5)
air.velocity = -3, -4
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(51) := 0)
guardSound = -1 + 0 * (var(52) := 0)
sparkNo = -1 + 0 * (var(53) := 8010)
guard.sparkNo = -1 + 0 * (var(54) := 8000)
sparkXY = -10 + 0 * (var(55) := 78), var(56):=-84
palFX.time = 12 * var(9)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48
ID = 200


[State 205, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(4) >= 0
moveType = I

[State 205, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;===========<STANDING FAR MEDIUM PUNCH>==========
[StateDef 210]
type = S
physics = S
moveType = A
anim = 210
ctrl = 0
velSet = 0,0
juggle = ifelse((prevstateno = [200, 4999]), 0, 8) * !var(20)
sprPriority = 1
powerAdd = 18 * !var(20)
faceP2 = 1

[State 210, Jump to 215]
type = ChangeState
trigger1 = !time && P2Bodydist x < 25
value = 215

[State 210, Voice]
type = PlaySnd
trigger1 = AnimElem = 2 && Random < 350
value = 4, ifElse(Random < 500, 2, 3) + 9 * (var(40) = 1)
channel = 0

[State 210, Woosh]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,1
channel = 1

[State 210, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = nowalk
flag2 = noautoturn

[State 210, HitDef]
type = HitDef
trigger1 = Anim = 210
trigger1 = AnimElem = 3
forceNoFall = !var(20)
attr = S, NA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = 65,0
getPower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
animType = Medium
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 17 + 3 * var(9)
ground.slideTime = 17 + 3 * var(9)
guard.hitTime = 17
air.hitTime = 120
ground.velocity = ifElse(var(20), -3.66, -7.51), 0
ground.cornerPush.velOff = 0; Use Custom fvar(5)
guard.velocity = ifElse(var(20), -3.66, -7.51)
guard.cornerPush.velOff = 0; Use Custom fvar(5)
air.velocity = -3.24, -7.73
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(51) := 1)
guardSound = -1 + 0 * (var(52) := 0)
sparkNo = -1 + 0 * (var(53) := 8011)
guard.sparkNo = -1 + 0 * (var(54) := 8000)
sparkXY = -10 + 0 * (var(55) := 92), var(56) := -82
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
ID = 210


[State 210, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = MoveType != I
trigger1 = AnimElemTime(5) >= 0
moveType = I

[State 210, CtrlSet]
type = CtrlSet
trigger1 = MoveType = I
trigger1 = AnimElemTime(6) = 0
value = 1

[State 210, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;===========<STANDING CLOSE MEDIUM PUNCH>==========
[StateDef 215]
type = S
physics = S
moveType = A
anim = 215
ctrl = 0
velSet = 0,0
juggle = ifelse((prevstateno = [200, 4999]), 0, 8) * !var(20)
sprPriority = 1
powerAdd = 18 * !var(20)
facep2 = 1

[State 215, Voice]
type = PlaySnd
trigger1 = AnimElem = 3 && Random < 350
value = 4, ifElse(Random < 500, 2, 3) + 9 * (var(40) = 1)
channel = 0

[State 215, Woosh]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1,1
channel = 1

[State 215, HitDef]
type = HitDef
trigger1 = Anim = 215
trigger1 = AnimElem = 3
forceNoFall = !var(20)
attr = S, NA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = 60,0
getPower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 11)
animType = Medium
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 17 + 3 * var(9)
ground.slideTime = 17 + 3 * var(9)
guard.hitTime = 17
air.hitTime = 120
ground.velocity = ifElse(var(20), -3.66, -7.51), 0
ground.cornerPush.velOff = 0; Use Custom fvar(5)
guard.velocity = ifElse(var(20), -3.66, -7.51)
guard.cornerPush.velOff = 0; Use Custom fvar(5)
air.velocity = -3.24, -7.73
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(51) := 1)
guardSound = -1 + 0 * (var(52) := 0)
sparkNo = -1 + 0 * (var(53) := 8011)
guard.sparkNo = -1 + 0 * (var(54) := 8000)
sparkXY = -10 + 0 * (var(55) := 92), var(56) := -72
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
ID = 215


[State 215, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(5) >= 0
moveType = I

[State 215, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;===========<STANDING FAR HEAVY PUNCH>==========
[StateDef 220]
type = S
physics = S
moveType = A
anim = 220
ctrl = 0
velSet = 0,0
juggle = ifelse((prevstateno = [200, 4999]), 0, 8) * !var(20)
sprPriority = 1
powerAdd = 18 * !var(20)
facep2 = 1

[State 220, Jump 225]
type = ChangeState
trigger1 = !time && P2Bodydist x < 25
trigger2 = PrevStateNo = 215
value = 225

[State 220, Voice]
type = PlaySnd
trigger1 = AnimElem = 2 && Random < 500
value = 4, ifElse(Random < 500, 3, 4) + 9 * (var(40) = 1)
channel = 0

[State 220, Woosh]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,2
channel = 1

[State 220, HitDef]
type = HitDef
trigger1 = Anim = 220
trigger1 = AnimElem = 3 || AnimElem = 4
trigger1 = !movecontact && !movereversed
forceNoFall = !var(20)
attr = S, NA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = 100,0
getPower = ifElse(!var(13), 216, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 5, 13), ifElse(var(20), 6, 18)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 20 + 4 * var(9)
ground.slideTime = 20 + 4 * var(9)
guard.hitTime = 20
air.hitTime = 120
ground.velocity = ifElse(var(20), -4.86, -10.52), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.86, -10.52)
guard.cornerPush.velOff = 0
air.velocity = -5.39, -5.65
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(51) := 2)
guardSound = -1 + 0 * (var(52) := 0)
sparkNo = -1 + 0 * (var(53) := 8012)
guard.sparkNo = -1 + 0 * (var(54) := 8000)
sparkXY = -10 + 0 * (var(55) := 103), var(56) := -88
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
ID = 220

[State 220, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(5) >= 0
movetype = I

[State 220, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;===========<STANDING CLOSE HEAVY PUNCH>==========
[StateDef 225]
type = S
physics = S
moveType = A
anim = 225
ctrl = 0
velSet = 0,0
sprPriority = 1
juggle = ifelse((prevstateno = [200, 4999]), 0, 8) * !var(20)
powerAdd = 18 * !var(20)
facep2 = 1

[State 225, Voice]
type = PlaySnd
trigger1 = AnimElem = 2 && Random < 500
value = 4, ifElse(Random < 500, 3, 4) + 9 * (var(40) = 1)
channel = 0

[State 225, Woosh]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,2
channel = 1

[State 225, HitDef (Normal)]
type = HitDef
trigger1 = Anim = 225
trigger1 = AnimElem = 3 || AnimElem = 4
trigger1 = !movecontact && !movereversed
forceNoFall = !var(20)
attr = S, NA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = 90 - 20*(PrevStateNo = 215),0
getPower = ifElse(!var(13), 216, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 5, 14), ifElse(var(20), 6, 16)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 20 + 4 * var(9)
ground.slideTime = 20 + 4 * var(9)
guard.hitTime = 20
air.hitTime = 120
ground.velocity = ifElse(var(20), -5.77, -10.52) + 2 * (PrevStateNo = 215), 0
ground.cornerPush.velOff = 0; Use Custom fvar(5)
guard.velocity = ifElse(var(20), -5.77, -10.52) + 2 * (PrevStateNo = 215)
guard.cornerPush.velOff = 0; Use Custom fvar(5)
air.velocity = -3.24, -7.73
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(51) := 2)
guardSound = -1 + 0 * (var(52) := 0)
sparkNo = -1 + 0 * (var(53) := 8012)
guard.sparkNo = -1 + 0 * (var(54) := 8000)
sparkXY = -10 + 0 * (var(55) := 103), var(56) := -66
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
forceStand = 1
ID = 225

[State 225, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(7) >= 0
movetype = I

[State 225, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;===========<STANDING LIGHT KICK>==========
[StateDef 230]
type = S
physics = S
moveType = A
anim = 230
ctrl = 0
velSet = 0,0
juggle = ifelse((prevstateno = [200, 4999]), 0, 8) * !var(20)
sprPriority = 1
powerAdd = 0
facep2 = 1

[State 230, Voice]
type = PlaySnd
trigger1 = AnimElem = 2 && Random < 200
value = 4, ifElse(Random < 500, 3, 4) + 9 * (var(40) = 1)
channel = 0

[State 230, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,3
channel = 1

[State 230, HitDef]
type = HitDef
trigger1 = Anim = 230
trigger1 = AnimElem = 3
forceNoFall = !var(20)
attr = S, NA
hitFlag = MAF
guardFlag = L
priority = 4, Hit
damage = 35,0
getPower = 72*!var(20), 36*!var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
animType = Light
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 14 + 2*var(9)
ground.slideTime = 14 + 2*var(9)
guard.hitTime = 14
air.hitTime = 120
ground.velocity = ifElse(var(20), -2.41, -4.49), 0
ground.cornerPush.velOff = 0; Use Custom fvar(5)
guard.velocity = ifElse(var(20), -2.41, -4.49)
guard.cornerPush.velOff = 0; Use Custom fvar(5)
air.velocity = -6.46, -5.25
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(51) := 3)
guardSound = -1 + 0 * (var(52) := 0)
sparkNo = -1 + 0 * (var(53) := 8010)
guard.sparkNo = -1 + 0*(var(54) := 8000)
sparkXY = -10 + 0 * (var(55) := 90), var(56) := -34
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
ID = 230

[State 230, StateTypeSet: Idle]
type = StateTypeSet
trigger1= AnimElemTime(5) >= 0
moveType = I

[State 230, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;===========<STANDING FAR MEDIUM KICK>==========
[StateDef 240]
type = S
physics = S
moveType = A
anim = 240
ctrl = 0
velSet = 0,0
juggle = ifelse((prevstateno = [200, 4999]), 0, 8) * !var(20)
sprPriority = 1
powerAdd = 18 * !var(20)
faceP2 = 1

[State 240, Jumpto 245]
type = ChangeState
trigger1 = !time && P2StateType != A && P2bodydist x < 35
value = 245

[State 240, Voice]
type = PlaySnd
trigger1 = AnimElem = 2 && Random < 350
value = 4, ifElse(Random < 500, 2, 3) + 9 * (var(40) = 1)
channel = 0

[State 240, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,4
channel = 1

[State 240, HitDef]
type = HitDef
trigger1 = Anim = 240
trigger1 = AnimElem = 3
forceNoFall = !var(20)
attr = S, NA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = 70,0
getPower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
animType = Medium
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 17 + 3 * var(9)
ground.slideTime = 17 + 3 * var(9)
guard.hitTime = 17
air.hitTime = 120
ground.velocity = ifElse(var(20), -3.66, -7.51), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -3.66, -7.51)
guard.cornerPush.velOff = 0
air.velocity = -6.46, -5.25
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(51) := 4)
guardSound = -1 + 0 * (var(52) := 0)
sparkNo = -1 + 0 * (var(53) := 8011)
guard.sparkNo = -1 + 0 * (var(54) := 8000)
sparkXY = -10 + 0 * (var(55) := 70), var(56) := -82
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
ID = 240

[State 240, ChangeAnim]
type = ChangeAnim
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) <= 0
trigger1 = HitPauseTime <= ifElse(var(20), 3, 6)
value = 240
elem = 4
ignoreHitPause = 1

[State 240, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(5) >= 0
movetype = I

[State 240, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;===========<STANDING CLOSE MEDIUM KICK>==========
[StateDef 245]
type = S
physics = S
moveType = A
anim = 255
ctrl = 0
velSet = 0,0
juggle = ifelse((prevstateno = [200, 4999]), 0, 8) * !var(20)
sprPriority = 1
powerAdd = 18 * !var(20)
faceP2 = 1

[State 245, Voice]
type = PlaySnd
trigger1 = AnimElem = 2 && Random < 350
value = 4, ifElse(Random < 500, 2, 3) + 9 * (var(40) = 1)
channel = 0

[State 245, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,4
channel = 1

[State 245, HitDef]
type = HitDef
trigger1 = Anim = 255
trigger1 = AnimElem = 3
forceNoFall = !var(20)
attr = S, NA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = 60,0
getPower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
animType = Medium
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 17 + 3 * var(9)
ground.slideTime = 17 + 3 * var(9)
guard.hitTime = 17
air.hitTime = 120
ground.velocity = ifElse(var(20), -5.05, -9.03), 0
ground.cornerPush.velOff = 0; Use Custom fvar(5)
guard.velocity = ifElse(var(20), -5.05, -9.03)
guard.cornerPush.velOff = 0; Use Custom fvar(5)
air.velocity = -6.46, -5.25
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(51) := 4)
guardSound = -1 + 0 * (var(52) := 0)
sparkNo = -1 + 0 * (var(53) := 8011)
guard.sparkNo = -1 + 0 * (var(54) := 8000)
sparkXY = -10 + 0 * (var(55) := 70), var(56) := -80
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
ID = 240


[State 245, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(5) >= 0
movetype = I

[State 245, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;===========<INAZUMA KAKATO WARI>==========
[StateDef 249]
type = S
physics = S
moveType = A
anim = 249
ctrl = 0
velSet = 0,0
juggle = 4
sprPriority = 1
powerAdd = 18 * !var(20)
faceP2 = 1

[State 249, Voice]
type = PlaySnd
trigger1 = AnimElem = 7 && Random < 350
value = 4, ifElse(Random < 500, 3, 4) + 9 * (var(40) = 1)
channel = 0

[State 249, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 6
value = 1,4
channel = 1

[State 249, PosAdd]
type = PosAdd
trigger1 = AnimElem = 1
x = 8

[State 249, HitDef]
type = HitDef
trigger1 = Anim = 249
trigger1 = (AnimElem = 8 || AnimElem = 9) && !movecontact && !movereversed
forceNoFall = !var(20)
attr = S, NA
hitFlag = MAF
guardFlag = H
priority = 4, Hit
damage = 70,0
getPower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
animType = Medium
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18 + 3 * var(9)
ground.slideTime = 18 + 3 * var(9)
guard.hitTime = 18
air.hitTime = 120
ground.velocity = ifElse(var(20), -3.66, -7.51), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -3.66, -7.51)
guard.cornerPush.velOff = 0
air.velocity = -2, 14
air.cornerPush.velOff = 0
yAccel = 0.58
fall = P2StateType = A
fall.recover = 0
fall.recoverTime = 120
hitSound = -1 + 0 * (var(51) := 4)
guardSound = -1 + 0 * (var(52) := 0)
sparkNo = -1 + 0 * (var(53) := 8011)
guard.sparkNo = -1 + 0 * (var(54) := 8000)
sparkXY = -10 + 0 * (var(55) := (70 +40*AnimElem=9)), var(56) := (-68 -20*AnimElem=8)
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
ID = 249

[State 249, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(10) >= 0
movetype = I

[State 249, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;===========<STANDING FAR HEAVY KICK>==========
[StateDef 250]
type = S
physics = S
moveType = A
anim = 250
ctrl = 0
velSet = 0,0
juggle = ifelse((prevstateno = [200, 4999]), 0, 8) * !var(20)
sprPriority = 1
powerAdd = 18 * !var(20)
faceP2 = 1

[State 250, Jump to 255]
type = ChangeState
trigger1 = !time && P2Bodydist x <25
value = 255

[State 250, Voice]
type = PlaySnd
trigger1 = AnimElem = 3 && Random < 500
value = 4, ifElse(Random < 500, 3, 4) + 9 * (var(40) = 1)
channel = 0

[State 250, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1,5
channel = 1

[State 250, PosAdd]
type = PosAdd
trigger1 = AnimElem = 1
x = 8

[State 250, HitDef]
type = HitDef
trigger1 = Anim = 250
trigger1 = AnimElem = 4
forceNoFall = !var(20)
attr = S, NA
hitFlag = MAF
guardFlag = M
priority = 4,Hit
damage = 100,0
getPower = ifElse(!var(13), 216, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 14), ifElse(var(20), 6, 16)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 20 + 4 * var(9)
ground.slideTime = 20 + 4 * var(9)
guard.hitTime = 20
air.hitTime = 120
ground.velocity = ifElse(PrevStateNo = 700, -6.46, ifElse(var(20), -4.86, -10.52)), ifElse(PrevStateNo = 700, -5.25, 0)
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.86, -10.52)
guard.cornerPush.velOff = 0
air.velocity = -6.46, -5.25
air.cornerPush.velOff = 0
yAccel = 0.58
fall = ifElse(PrevStateNo = 700, 1, 0)
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(51) := 5)
guardSound = -1 + 0 * (var(52) := 0)
sparkNo = -1 + 0 * (var(53) := 8012)
guard.sparkNo = -1 + 0 * (var(54) := 8000)
sparkxy = -10 + 0 * (var(55) := 172), var(56) := -60
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
ID = 250

[State 250, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(5) >= 0
moveType = I

[State 250, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;===========<STANDING CLOSE HEAVY KICK>==========
[StateDef 255]
type = S
physics = S
moveType = A
anim = 245 + (var(40)=1)
ctrl = 0
velSet = 0,0
juggle = ifelse((prevstateno = [200, 4999]), 0, 8) * !var(20)
sprPriority = 1
powerAdd = 18 * !var(20)
faceP2 = 1

[State 255, Voice]
type = PlaySnd
trigger1 = AnimElem = 2 && Random < 500
value= 4, ifElse(Random < 500, 3, 4) + 9 * (var(40) = 1)
channel = 0

[State 255, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,5
channel = 1

[State 255, HitDef]
type = HitDef
trigger1 = AnimElem = 3
forceNoFall = !var(20)
attr = S, NA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = 80,0
getPower = ifElse(!var(13), 216, 72)*!var(20), 36*!var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 14), ifElse(var(20), 6, 16)
guard.pauseTime = ifElse(var(20), 5, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 20 + 4 * var(9)
ground.slideTime = 20 + 4 * var(9)
guard.hitTime = 20
air.hitTime = 120
ground.velocity = ifElse(var(20), -3, -5), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -5, -5)
guard.cornerPush.velOff = 0
air.velocity = -4.32, -2
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(51) := 5)
guardSound = -1 + 0 * (var(52) := 0)
sparkNo = -1 + 0 * (var(53) := 8012)
guard.sparkno = -1 + 0 * (var(54) := 8000)
sparkXY = -10 + 0 * (var(55) := 44), var(56) := -100
palFX.time = 12 * var(9)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48
forceStand = 1
ID = 250

[State 255, HitDef]
type = HitDef
trigger1 = AnimElem = 5
trigger2 = AnimElem = 6 && !NumTarget(255)
forceNoFall = !var(20)
attr = S, NA
hitFlag = MAF
guardFlag = H
priority = 4, Hit
damage = 40+40*(!MoveHit),0
getPower = ifElse(!var(13), 216, 72)*!var(20), 36*!var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 14), ifElse(var(20), 6, 16)
guard.pauseTime = ifElse(var(20), 5, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 20 + 4 * var(9)
ground.slideTime = 20 + 4 * var(9)
guard.hitTime = 20
air.hitTime = 120
ground.velocity = ifElse(var(20), -3, -5), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -5, -5)
guard.cornerPush.velOff = 0
air.velocity = -2, 15
air.cornerPush.velOff = 0
yAccel = 0.58
fall = P2StateType = A
fall.recover = 0
fall.recoverTime = 120
hitSound = -1 + 0 * (var(51) := 5)
guardSound = -1 + 0 * (var(52) := 0)
sparkNo = -1 + 0 * (var(53) := 8012)
guard.sparkno = -1 + 0 * (var(54) := 8000)
sparkXY = -10 + 0 * (var(55) := 80), var(56) := -80
palFX.time = 12 * var(9)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48
forceStand = 1
ID = 255


[State 255, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElemTime(7) >= 0
moveType = I

[State 255, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;===========<USHIRO MAWASHI GERI>==========
[StateDef 259]
type = S
physics = S
moveType = A
anim = 259
ctrl = 0
velSet = 0,0
juggle = 6
sprPriority = 1
powerAdd = 18 * !var(20)
faceP2 = 1

[State 259, CO Moves]
type = ChangeAnim
trigger1 = var(20) && Anim = 259
trigger1 = AnimElemtime(2) = 0
value = 259
Elem = 7

[State 259, Fix Pos]
type = Posadd
trigger1= Animelemtime(6)=0
x = 20

[State 259, No Push]
type = PlayerPush
trigger1= Anim = 259
trigger1= Animelemtime(12)<0
value = 0
ignorehitpause = 1

[State 259, Veladd]
type = Veladd
trigger1= Animelemtime(8)=1
x = 7

[State 259, Voice]
type = PlaySnd
trigger1 = var(40) != 1
trigger1 = AnimElem = 7 && Random < 700
value = 820,0
channel = 0

[State 259, Voice]
type = PlaySnd
trigger1 = var(40) = 1
trigger1 = AnimElem = 7 && Random < 700
value = 4,12
channel = 0

[State 259, Hitby]
type = Hitby
trigger1= Animelemtime(3)>=0 && Animelemtime(6)<0
value = SCA,AT

[State 259, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 6
value = 1,5
channel = 1

[State 259, HitDef]
type = HitDef
trigger1 = Anim = 259
trigger1 = (AnimElem = 8 || AnimElem = 9) && !movecontact && !movereversed
forceNoFall = !var(20)
attr = S, NA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = 30 + 120* !var(20),0
getPower = ifElse(!var(13), 216, 72)*!var(20), 36*!var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 14), ifElse(var(20), 6, 14)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 20 + 4 * var(9)
ground.slideTime = 20 + 4 * var(9)
guard.hitTime = 20
air.hitTime = 120
ground.velocity = ifElse(var(20), -3, -8), ifElse(var(20), -7.2, -4)
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -3, -8)
guard.cornerPush.velOff = 0
air.velocity = ifElse(var(20), -3, -8), ifElse(var(20), -7.2, -4)
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
fall.recover = 0
fall.recoverTime = 120
hitSound = -1 + 0 * (var(51) := 5)
guardSound = -1 + 0 * (var(52) := 0)
sparkNo = -1 + 0 * (var(53) := 8012)
guard.sparkno = -1 + 0 * (var(54) := 8000)
sparkXY = -10 + 0 * (var(55) := 44), var(56) := -70
palFX.time = 12 * var(9)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48
ID = 259

[State 259, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElemTime(11) >= 0
moveType = I

[State 259, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1




;===========<CROUCHING LIGHT PUNCH>==========
[StateDef 400]
type = C
physics = C
moveType = A
anim = 400
ctrl = 0
velSet = 0,0
juggle = ifelse((prevstateno = [200, 4999]), 0, 8) * !var(20)
sprPriority = 1
powerAdd = 0
faceP2 = 1

[State 400, Voice]
type = PlaySnd
trigger1 = AnimElem = 1 && Random < 200
value = 4, ifElse(Random < 500, 1, 2) + 9 * (var(40) = 1)
channel = 0

[State 400, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1,0
channel = 1

[State 400, HitDef]
type = HitDef
trigger1 = Anim = 400
trigger1 = AnimElem = 2
forceNoFall = !var(20)
attr = C, NA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = 30,0
getPower = 72 * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
animType = Light
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 14 + 2 * var(9)
ground.slideTime = 14 + 2 * var(9)
guard.hitTime = 14
air.hitTime = 120
ground.velocity = ifElse(var(20), -1.8, -3.8), 0
ground.cornerPush.velOff = 0; Use Custom fvar(5)
guard.velocity = ifElse(var(20), -1.8, -3.8)
guard.cornerPush.velOff = 0; Use Custom fvar(5)
air.velocity = -6.46, -5.25
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(51) := 0)
guardSound = -1 + 0 * (var(52) := 0)
sparkNo = -1 + 0 * (var(53) := 8010)
guard.sparkNo = -1 + 0 * (var(54) := 8000)
sparkXY = -10 + 0 * (var(55) := 69), var(56) := -52
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
ID = 400

[State 400, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(4) >= 0
moveType = I

[State 400, End]
type = ChangeState
trigger1 = !AnimTime
value = 11
ctrl = 1



;===========<CROUCHING MEDIUM PUNCH>==========
[StateDef 410]
type = C
physics = C
moveType = A
anim = 410
ctrl = 0
velSet = 0,0
juggle = ifelse((prevstateno = [200, 4999]), 0, 8) * !var(20)
sprPriority = 1
powerAdd = 18 * !var(20)
faceP2 = 1

[State 410, Voice]
type = PlaySnd
trigger1 = AnimElem = 2 && Random < 350
value = 4, ifElse(Random < 500, 2, 3) + 9 * (var(40) = 1)
channel = 0

[State 410, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,1
channel = 1

[State 410, HitDef]
type = HitDef
trigger1 = Anim = 410
trigger1 = (AnimElem = 3 || AnimElem = 4) && !movecontact && !movereversed
forceNoFall = !var(20)
attr = C, NA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = 60,0
getPower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 11)
animType = Medium
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 17 + 3 * var(9)
ground.slideTime = 17 + 3 * var(9)
guard.hitTime = 17
air.hitTime = 120
ground.velocity = ifElse(var(20), -3.66, -7.51), 0
ground.cornerPush.velOff = 0; Use Custom fvar(5)
guard.velocity = ifElse(var(20), -3.66, -7.51)
guard.cornerPush.velOff = 0; Use Custom fvar(5)
air.velocity = -6.46, -5.25
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(51) := 1)
guardSound = -1 + 0 * (var(52) := 0)
sparkNo = -1 + 0 * (var(53) := 8011)
guard.sparkNo = -1 + 0*(var(54) := 8000)
sparkXY = -10 + 0 * (var(55) := 75), var(56) := -46
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
ID = 410


[State 410, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(5) >= 0
moveType = I

[State 410, End]
type = ChangeState
trigger1 = !AnimTime
value = 11
ctrl = 1



;===========<CROUCHING HEAVY PUNCH>==========
[StateDef 420]
type = C
physics = C
moveType = A
anim = 420
ctrl = 0
velSet = 0,0
juggle = ifelse((prevstateno = [200, 4999]), 0, 8) * !var(20)
sprPriority = 1
powerAdd = 18 * !var(20)
faceP2 = 1

[State 420, Voice]
type = PlaySnd
trigger1 = AnimElem = 2 && Random < 500
value = 4, ifElse(Random < 500, 3, 4) + 9 * (var(40) = 1)
channel = 0

[State 420, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,2
channel = 1

[State 420, HitDef]
type = HitDef
trigger1 = Anim = 420
trigger1 = (AnimElem = 4 || AnimElem = 5) && !movecontact && !movereversed
forceNoFall = !var(20)
attr = C, NA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = 90,0
getPower = ifElse(!var(13), 216, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 14), ifElse(var(20), 6, 16)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 20 + 4 * var(9)
ground.slideTime = 20 + 4 * var(9)
guard.hitTime = 20
air.hitTime = 120
ground.velocity = ifElse(var(20), -4.86, -10.52), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.86, -10.52)
guard.cornerPush.velOff = 0
air.velocity = -3.23, -7.73
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(51) := 2)
guardSound = -1 + 0 * (var(52) := 0)
sparkNo = -1 + 0 * (var(53) := 8012)
guard.sparkNo = -1 + 0 * (var(54) := 8000)
sparkXY = -10 + 0 * (var(55) := 42-20*AnimElem = 5), var(56) := -67-(50*AnimElem = 5)
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
forceStand = 1
ID = 420


[State 420, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(8) >= 0
moveType = I

[State 420, End]
type = ChangeState
trigger1 = !AnimTime
value = 11
ctrl = 1



;===========<CROUCHING LIGHT KICK>==========
[StateDef 430]
type = C
physics = C
moveType = A
anim = 430
ctrl = 0
velSet = 0,0
juggle = ifelse((prevstateno = [200, 4999]), 0, 8) * !var(20)
sprPriority = 1
powerAdd = 0
faceP2 = 1

[State 430, Voice]
type = PlaySnd
trigger1 = AnimElem = 1 && Random < 200
value = 4, ifElse(Random < 500, 1, 2) + 9 * (var(40) = 1)
channel = 0

[State 430, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1,3
channel = 1

[State 430, HitDef]
type = HitDef
trigger1 = Anim = 430
trigger1 = AnimElem = 2
forceNoFall = !var(20)
attr = C, NA
hitFlag = MAF
guardFlag = L
priority = 4, Hit
damage = 30,0
getPower = 72 * !var(20), 36 * !var(20)
givepower = 36, 36
pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
animType = Light
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 14 + 2 * var(9)
ground.slideTime = 14 + 2 * var(9)
guard.hitTime = 14
air.hitTime = 120
ground.velocity = ifElse(var(20), -2.41, -4.49), 0
ground.cornerPush.velOff = 0; Use Custom fvar(5)
guard.velocity = ifElse(var(20), -2.41, -4.49)
guard.cornerPush.velOff = 0; Use Custom fvar(5)
air.velocity = -6.46, -5.25
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(51) := 3)
guardSound = -1 + 0 * (var(52) := 0)
sparkNo = -1 + 0 * (var(53) := 8010)
guard.sparkNo = -1 + 0 * (var(54) := 8000)
sparkXY = -10 + 0 * (var(55) := 68), var(56) := -5
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinadd= -255, -255, -255, 48
ID = 430


[State 430, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(4) >= 0
moveType = I

[State 430, End]
type = ChangeState
trigger1 = !AnimTime
value = 11
ctrl = 1



;===========<CROUCHING MEDIUM KICK>==========
[StateDef 440]
type = C
physics = C
moveType = A
anim = 440
ctrl = 0
velSet = 0,0
juggle = ifelse((prevstateno = [200, 4999]), 0, 8) * !var(20)
sprPriority = 1
powerAdd = 18 * !var(20)
faceP2 = 1

[State 440, Voice]
type = PlaySnd
trigger1 = AnimElem = 2 && Random < 350
value = 4, ifElse(Random < 500, 2, 3) + 9 * (var(40) = 1)
channel = 0

[State 440, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,4
channel = 1

[State 440, HitDef]
type = HitDef
trigger1 = Anim = 440
trigger1 = AnimElem = 3
forceNoFall = !var(20)
attr = C, NA
hitFlag = MAF
guardFlag = L
priority = 4, Hit
damage = 60,0
getPower = ifElse(!var(13),144,72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 11)
animType = Medium
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18 + 3 * var(9)
ground.slideTime = 18 + 3 * var(9)
guard.hitTime = 18
air.hitTime = 120
ground.velocity = ifElse(var(20), -3.66, -7.51), 0
ground.cornerPush.velOff = 0; Use Custom fvar(5)
guard.velocity = ifElse(var(20), -3.66, -7.51)
guard.cornerPush.velOff = 0; Use Custom fvar(5)
air.velocity = -6.46, -5.25
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(51) := 4)
guardSound = -1 + 0 * (var(52) := 0)
sparkNo = -1 + 0 * (var(53) := 8011)
guard.sparkNo = -1 + 0 * (var(54) := 8000)
sparkXY = -10 + 0 * (var(55) := 76), var(56) := -8
palFX.time = 12*var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
ID = 440


[State 440, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(6) >= 0
movetype = I

[State 440, End]
type = Changestate
trigger1 = !AnimTime
value = 11
ctrl = 1



;===========<CROUCHING HEAVY KICK>==========
[StateDef 450]
type = C
physics = C
moveType = A
anim = 450 + (var(40) = 1)
ctrl = 0
velSet = 0,0
juggle = ifelse((prevstateno = [200, 4999]), 0, 8) * !var(20)
sprPriority = 1
powerAdd = 18 * !var(20)
faceP2 = 1

[State 450, NHB]
type = NotHitBy
triggerall = PrevStateNo = 750
trigger1 = AnimElemTime(3)<0
value = SCA

[State 450, Voice]
type = PlaySnd
trigger1 = AnimElem = 2 && Random < 500
value = 4, ifElse(Random < 500, 3, 4) + 9 * (var(40) = 1)
channel = 0

[State 450, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,5
channel = 1

[State 450, HitDef]
type = HitDef
triggerall = PrevStateNo != 750
trigger1 = (AnimElem = 3 || AnimElem=4) && !movecontact && !movereversed
attr = C, NA
hitFlag = MAF
guardFlag = L
priority = 4, Hit
damage = 90,0
getpower = ifElse(!var(13), 216, 72) * !var(20), 36 * !var(20)
givepower = 36, 36
pauseTime = ifElse(var(20), 6, 14), ifElse(var(20), 6, 14)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Trip
air.type = Trip
ground.hitTime = 20 + 4 * var(9)
ground.slideTime = 20 + 4 * var(9)
guard.hitTime = 20
air.hitTime = 120
ground.velocity = -1, -6.25
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.86, -10.52)
guard.cornerPush.velOff = 0
air.velocity = -1, -8.24
air.cornerPush.velOff = 0
yAccel = 0.677
fall = 1
fall.recover = 0
fall.recoverTime = 120
hitSound = -1 + 0 * (var(51) := 5)
guardSound = -1 + 0 * (var(52) := 0)
sparkNo = -1 + 0 * (var(53) := 8012)
guard.sparkNo = -1 + 0 * (var(54) := 8000)
sparkXY = -10 + 0 * (var(55) := 100), var(56) := -12
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
ID = 450

[State 450, HitDef]
type = HitDef
triggerall = PrevStateNo = 750
trigger1 = (AnimElem = 3 || AnimElem=4) && !movecontact && !movereversed
attr = C, NA
hitFlag = MAF
guardFlag = L
priority = 4, Hit
damage = 90,0
getpower = ifElse(!var(13), 216, 72) * !var(20), 36 * !var(20)
givepower = 36, 36
pauseTime = ifElse(var(20), 6, 14), ifElse(var(20), 6, 14)
animType = DiagUp
ground.hitTime = 20 + 4 * var(9)
ground.slideTime = 20 + 4 * var(9)
guard.hitTime = 20
air.hitTime = 120
ground.velocity = -6, -5
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.86, -10.52)
guard.cornerPush.velOff = 0
air.velocity = -6, -6
air.cornerPush.velOff = 0
yAccel = 0.677
fall = 1
fall.recover = 0
fall.recoverTime = 120
hitSound = -1 + 0 * (var(51) := 5)
guardSound = -1 + 0 * (var(52) := 0)
sparkNo = -1 + 0 * (var(53) := 8012)
guard.sparkNo = -1 + 0 * (var(54) := 8000)
sparkXY = -10 + 0 * (var(55) := 100), var(56) := -12
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
ID = 450

[State 450, Alpha FX]
type = Helper
triggerall = Prevstateno = 750
trigger1 = !NumHelper(751)
trigger1 = MoveHit && NumTarget(450)
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


[State 450, StateTypeSet: Idle]
type = StateTypeset
trigger1= AnimElemTime(5) >= 0
moveType = I

[State 450, End]
type = ChangeState
trigger1 = !AnimTime
value = 11
ctrl = 1



;===========<JUMPING LIGHT PUNCH>==========
[StateDef 600]
type = A
physics = N
moveType = A
anim = 600
ctrl = 0
juggle = 7
sprPriority = 1
powerAdd = 0

[State 600, Voice]
type = PlaySnd
trigger1 = AnimElem = 1 && Random < 200
value= 4, ifElse(Random < 500, 1, 2) + 9 * (var(40) = 1)
channel = 0

[State 600, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1,0
channel = 1

[State 600, HitDef]
type = HitDef
trigger1 = Anim = 600
trigger1 = (AnimElemtime(2)>=0 && AnimElemtime(8)<0) && !movecontact && !movereversed
forceNoFall = !var(20)
attr = A, NA
hitFlag = MAF
guardFlag = HA
priority = 4, Hit
damage = 30,0
getPower = 72 * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
animType = Light
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 12 + 2 * var(9)
ground.slideTime = 12 + 2 * var(9)
guard.hitTime = 12
air.hitTime = 120
airguard.ctrlTime = 16
ground.velocity = ifElse(var(20), -2.41, -4.49), 0
ground.cornerPush.velOff = 0; Use Custom fvar(5)
guard.velocity = ifElse(var(20), -2.41, -4.49)
guard.cornerPush.velOff = 0; Use Custom fvar(5)
air.velocity = -4.31, -7.36
air.cornerPush.velOff = 0
airguard.velocity = -5, 0
airguard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(51) := 0)
guardSound = -1 + 0 * (var(52) := 0)
sparkNo = -1 + 0 * (var(53) := 8010)
guard.sparkNo = -1 + 0 * (var(54) := 8000)
sparkXY = -10 + 0 * (var(55) := 51), var(56) := -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
ID = 600

[State 600, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(8) >= 0
moveType = I

[State 600, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 600, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 52



;===========<JUMPING MEDIUM PUNCH>==========
[StateDef 610]
type = A
physics  = N
moveType = A
anim = 610
ctrl = 0
juggle = 7
sprPriority = 1
powerAdd = 18 * !var(20)

[State 610, Voice]
type = PlaySnd
trigger1 = AnimElem = 3 && Random < 350
value = 4, ifElse(Random < 500, 2, 3) + 9 * (var(40) = 1)
channel = 0

[State 610, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1,1
channel = 1

[State 610, HitDef]
type = HitDef
trigger1 = Anim = 610
trigger1 = (AnimElem = 4 || AnimElem = 5) && !movecontact && !movereversed
forceNoFall = !var(20)
attr = A, NA
hitFlag = MAF
guardFlag = HA
priority = 4, Hit
damage = 60,0
getPower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
animType = Medium
air.animType = Back
fall.animType = Back
ground.type = High
air.type = High
ground.hitTime = 17 + 3 * var(9)
ground.slideTime = 17 + 3 * var(9)
guard.hitTime = 17
air.hitTime = 120
airguard.ctrlTime = 16
ground.velocity = ifElse(var(20), -2.41, -4.49), 0
ground.cornerPush.velOff = 0; Use Custom fvar(5)
guard.velocity = ifElse(var(20), -3.66, -7.51)
guard.cornerPush.velOff = 0; Use Custom fvar(5)
air.velocity = -6.46, -5.25
air.cornerPush.velOff = 0
airguard.velocity = -5, 0
airguard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(51) := 4)
guardSound = -1 + 0 * (var(52) := 0)
sparkNo = -1 + 0 * (var(53) := 8011)
guard.sparkNo = -1 + 0 * (var(54) := 8000)
sparkXY = -10 + 0 * (var(55) := 64), var(56) := -65
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
ID = 610

[State 610, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(7) >= 0
movetype = I

[State 610, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 610, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 52



;===========<JUMPING HEAVY PUNCH>==========
[StateDef 620]
type = A
physics = N
moveType = A
anim = 620
ctrl = 0
juggle = 7
sprPriority = 1
powerAdd = 18 * !var(20)

[State 620, Voice]
type = PlaySnd
trigger1 = (AnimElem = 3) && Random < 500
value= 4, ifElse(Random < 500, 3, 4) + 9 * (var(40) = 1)
channel = 0

[State 620, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1,2
channel = 1

[State 620, HitDef]
type = HitDef
trigger1 = Anim = 620
trigger1 = (AnimElem = 4 || AnimElem = 5) && !movecontact && !movereversed
forceNoFall = !var(20)
attr = A, NA
hitFlag = MAF
guardFlag = HA
priority = 4, Hit
damage = 90,0
getPower = ifElse(!var(13), 216, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 5, 14), ifElse(var(20), 6, 16)
animtype = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 20 + 4 * var(9)
ground.slideTime = 20 + 4 * var(9)
guard.hitTime = 20
air.hitTime = 120
airguard.ctrlTime = 16
ground.velocity = ifElse(var(20), -2.41, -4.49), 0
ground.cornerPush.velOff = 0; Use Custom fvar(5)
guard.velocity = ifElse(var(20), -4.86, -10.52)
guard.cornerPush.velOff = 0; Use Custom fvar(5)
air.velocity = -6.46, -5.25
air.cornerPush.velOff = 0
airguard.velocity = -5, 0
airguard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(51) := 2)
guardSound = -1 + 0 * (var(52) := 0)
sparkNo = -1 + 0 * (var(53) := 8012)
guard.sparkNo = -1 + 0 * (var(54) := 8000)
sparkXY = -10 + 0 * (var(55) := 58), var(56) := -65
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
ID = 620


[State 620, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(7) >= 0
moveType = I

[State 620, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 620, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 52



;===========<NEUTRAL JUMPING LIGHT KICK>==========
[StateDef 630]
type = A
physics = N
moveType = A
anim = 630
ctrl = 0
juggle = 7
sprPriority = 1
powerAdd = 0

[State 630, Voice]
type = PlaySnd
trigger1 = AnimElem = 1 && Random < 200
value= 4, ifElse(Random < 500, 1, 2) + 9 * (var(40) = 1)
channel = 0

[State 630, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1,3
channel = 1

[State 630, HitDef]
type = HitDef
trigger1 = Anim = 630
trigger1 = AnimElem = 2
forceNoFall = !var(20)
attr = A, NA
hitFlag = MAF
guardFlag = HA
priority = 4, Hit
damage = 40,0
getPower = 72 * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
animType = Light
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 12 + 2 * var(9)
ground.slideTime = 12 + 2 * var(9)
guard.hitTime = 12
air.hitTime = 120
airguard.ctrlTime = 16
ground.velocity = ifElse(var(20), -2.41, -4.49), 0
ground.cornerPush.velOff = 0; Use Custom fvar(5)
guard.velocity = ifElse(var(20), -2.41, -4.49)
guard.cornerPush.velOff = 0; Use Custom fvar(5)
air.velocity = -3.23, -7.73
air.cornerPush.velOff = 0
airguard.velocity = -5, 0
airguard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(51) := 3)
guardSound = -1 + 0 * (var(52) := 0)
sparkNo = -1 + 0 * (var(53) := 8010)
guard.sparkNo = -1 + 0 * (var(54) := 8000)
sparkXY = -10 + 0 * (var(55) := 50), var(56) := -104
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
ID = 630

[State 630, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(8) >= 0
moveType = I

[State 630, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 630, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 52



;===========<ANGLED JUMPING LIGHT KICK>==========
[StateDef 631]
type = A
physics = N
moveType = A
anim = 631
ctrl = 0
juggle = 7
sprPriority = 1
powerAdd = 0

[State 631, Voice]
type = PlaySnd
trigger1 = AnimElem = 1 && Random < 200
value= 4, ifElse(Random < 500, 1, 2) + 9 * (var(40) = 1)
channel = 0

[State 631, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1,3
channel = 1

[State 631, HitDef]
type = HitDef
trigger1 = Anim = 631
trigger1 = (AnimElemtime(2)>=0 && AnimElemtime(12)<0) && !movecontact && !movereversed
forceNoFall = !var(20)
attr = A, NA
hitFlag = MAF
guardFlag = HA
priority = 4, Hit
damage = 40,0
getPower = 72 * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
animType = Light
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 14 + 2 * var(9)
ground.slideTime = 14 + 2 * var(9)
guard.hitTime = 14
air.hitTime = 120
airguard.ctrlTime = 16
ground.velocity = ifElse(var(20), -2.41, -4.49), 0
ground.cornerPush.velOff = 0; Use Custom fvar(5)
guard.velocity = ifElse(var(20), -2.41, -4.49)
guard.cornerPush.velOff = 0; Use Custom fvar(5)
air.velocity = -3.23, -7.73
air.cornerPush.velOff = 0
airguard.velocity = -5, 0
airguard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(51) := 3)
guardSound = -1 + 0 * (var(52) := 0)
sparkNo = -1 + 0 * (var(53) := 8010)
guard.sparkNo = -1 + 0 * (var(54) := 8000)
sparkXY = -10 + 0 * (var(55) := 60), var(56) := -54
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
ID = 631


[State 631, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(12) >= 0
moveType = I

[State 631, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 631, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 52



;===========<NEUTRAL JUMPING MEDIUM KICK>==========
[StateDef 640]
type = A
physics = N
moveType = A
anim = 640
ctrl = 0
juggle = 7
sprPriority = 1
powerAdd = 18 * !var(20)

[State 640, Voice]
type = PlaySnd
trigger1 = AnimElem = 1 && Random < 350
value = 4, ifElse(Random < 500, 2, 3) + 9 * (var(40) = 1)
channel = 0

[State 640, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1,4
channel = 1

[State 640, Hit]
type = HitDef
trigger1 = Anim = 640
trigger1 = AnimElem = 2
forceNoFall = !var(20)
attr = A, NA
hitFlag = MAF
guardFlag = HA
priority = 4, Hit
damage = 70,0
getPower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
animType = Medium
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 17 + 3 * var(9)
ground.slideTime = 17 + 3 * var(9)
guard.hitTime = 17
air.hitTime = 120
airguard.ctrlTime = 16
ground.velocity = ifElse(var(20), -2.41, -4.49), 0
ground.cornerPush.velOff = 0; Use Custom fvar(5)
guard.velocity = ifElse(var(20), -3.66, -7.51)
guard.cornerPush.velOff = 0; Use Custom fvar(5)
air.velocity = -3.23, -7.73
air.cornerPush.velOff = 0
airguard.velocity = -5, 0
airguard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(51) := 4)
guardSound = -1 + 0 * (var(52) := 0)
sparkNo = -1 + 0 * (var(53) := 8011)
guard.sparkNo = -1 + 0 * (var(54) := 8000)
sparkXY = -10 + 0 * (var(55) := 50), var(56) := -104
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
ID = 640

[State 640, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(5) >= 0
movetype = I

[State 640, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 640, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 52



;===========<ANGLED JUMPING MEDIUM KICK>==========
[StateDef 641]
type = A
physics = N
moveType = A
anim = 641
ctrl = 0
juggle = 7
sprPriority = 1
powerAdd = 18 * !var(20)

[State 641, Voice]
type = PlaySnd
trigger1 = AnimElem = 2 && Random < 350
value = 4, ifElse(Random < 500, 2, 3) + 9 * (var(40) = 1)
channel = 0

[State 641, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,4
channel = 1

[State 641, Hit]
type = HitDef
trigger1 = Anim = 641
trigger1 = (AnimElem = 3 || AnimElem = 4) && !movecontact && !movereversed
forceNoFall = !var(20)
attr = A, NA
hitFlag = MAF
guardFlag = HA
priority = 4, Hit
damage = 60,0
getPower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
animType = Medium
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 17 + 3 * var(9)
ground.slideTime = 17 + 3 * var(9)
guard.hitTime = 17
air.hitTime = 120
airguard.ctrlTime = 16
ground.velocity = ifElse(var(20), -2.41, -4.49), 0
ground.cornerPush.velOff = 0; Use Custom fvar(5)
guard.velocity = ifElse(var(20), -3.66, -7.51)
guard.cornerPush.velOff = 0; Use Custom fvar(5)
air.velocity = -3.23, -7.73
air.cornerPush.velOff = 0
airguard.velocity = -5, 0
airguard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(51) := 4)
guardSound = -1 + 0 * (var(52) := 0)
sparkNo = -1 + 0 * (var(53) := 8011)
guard.sparkNo = -1 + 0 * (var(54) := 8000)
sparkXY = -10 + 0 * (var(55) := 60), var(56) := -54
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
ID = 641

[State 641, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(5) >= 0
movetype = I

[State 641, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 641, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 52



;===========<NEUTRAL JUMPING HEAVY KICK>==========
[StateDef 650]
type = A
physics = N
moveType = A
anim = 650
ctrl = 0
sprPriority = 1
juggle = 7
powerAdd = 18 * !var(20)

[State 650, Voice]
type = PlaySnd
trigger1 = AnimElem = 3 && Random < 500
value = 4, ifElse(Random < 500, 3, 4) + 9 * (var(40) = 1)
channel = 0

[State 650, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1,5
channel = 1

[State 650, HitDef]
type = HitDef
trigger1 = Anim = 650
trigger1 = AnimElem = 5
forceNoFall = !var(20)
attr = A, NA
hitFlag = MAF
guardFlag = HA
priority = 4, Hit
damage = 100,0
getPower = ifElse(!var(13), 216, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 14), ifElse(var(20), 6, 16)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 20 + 4 * var(9)
ground.slideTime = 20 + 4 * var(9)
guard.hitTime = 20
air.hitTime = 120
airguard.ctrlTime = 16
ground.velocity = ifElse(var(20), -2.41, -4.49), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.86, -10.52)
guard.cornerPush.velOff = 0
air.velocity = -6.46, -5.25
air.cornerPush.velOff = 0
airguard.velocity = -5, 0
airguard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(51) := 5)
guardSound = -1 + 0 * (var(52) := 0)
sparkNo = -1 + 0 * (var(53) := 8012)
guard.sparkNo = -1 + 0 * (var(54) := 8000)
sparkXY = -10 + 0 * (var(55) := 77), var(56) := -68
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
ID = 650

[State 650, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(6) >= 0
moveType = I

[State 650, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 650, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 52



;===========<ANGLED JUMPING HEAVY KICK>==========
[StateDef 651]
type = A
physics = N
moveType = A
anim = 651
ctrl = 0
juggle = 7
sprPriority = 1
powerAdd = 18 * !var(20)

[State 651, Voice]
type = PlaySnd
trigger1 = AnimElem = 2 && Random < 500
value = 4, ifElse(Random < 500, 3, 4) + 9 * (var(40) = 1)
channel = 0

[State 651, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,5
channel = 1

[State 651, HitDef]
type = HitDef
trigger1 = Anim = 651
trigger1 = (AnimElem = 3 || AnimElem = 4) && !movecontact && !movereversed
forceNoFall = !var(20)
attr = A, NA
hitFlag = MAF
guardFlag = HA
priority = 4, Hit
damage = 100,0
getPower = ifElse(!var(13), 216, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 5, 14), ifElse(var(20), 6, 16)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 20 + 4 * var(9)
ground.slideTime = 20 + 4 * var(9)
guard.hitTime = 20
air.hitTime = 120
airguard.ctrlTime = 16
ground.velocity = ifElse(var(20), -2.41, -4.49), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.86, -10.52)
guard.cornerPush.velOff = 0
air.velocity = -6.46, -5.25
air.cornerPush.velOff = 0
airguard.velocity = -5, 0
airguard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(51) := 5)
guardSound = -1 + 0 * (var(52) := 0)
sparkNo = -1 + 0 * (var(53) := 8012)
guard.sparkNo = -1 + 0 * (var(54) := 8000)
sparkXY = -10 + 0 * (var(55) := 77), var(56) := -54
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
ID = 651


[State 651, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(6) >= 0
moveType = I

[State 651, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 651, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 52



;===========<THROW ATTEMPT>==========
[StateDef 800]
type = S
physics = S
movetype = A
anim = 800
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 18 * !var(20)
faceP2 = 1

;Var(10) = 0 wheel 1 = shoulder 2 = hit
[State 800, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = Ifelse(command!="kk",IfElse(command="holdx",1,2),0)

[State 800, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = Random%3

[State 800, Force Violent no Hit]
type = varset
trigger1 = var(40)=1
trigger1 = var(10)>1
var(10) = 1

[State 800, Tech Hit Reset]
type = VarSet
trigger1 = 1
var(19) = 0

[State 800, Tech Hit]
type = VarSet
trigger1 = NumEnemy
trigger1 = EnemyNear, StateType != A
trigger1 = (EnemyNear, StateNo = [0,999]) && (EnemyNear, StateNo != [100,119]) && (EnemyNear, StateNo != [200,799])
var(19) = 7

[State 800, AttackDist]
type = AttackDist
trigger1 = 1
value = 0

[State 800, HitDef: Wheel Throw]
type = HitDef
triggerall = anim = 800
triggerall = P2MoveType != H && !(P2StateNo = [150,159])
trigger1 = AnimElem = 2 && (P2MoveType != H || var(20))
trigger1 = var(10) = 0
attr = S, NT
hitFlag = MFD
priority = 5, Miss
getPower = 0,0
givePower = 0,0
sparkNo = -1 +0 * (var(53) := 0)
guard.sparkNo = -1 +0 * (var(54) := 8000)
sparkXY = -10 + 0 * (var(55) := 40), var(56) := -50
hitSound = -1 +0 * (var(51) := 800)
guardSound = -1 +0 * (var(52) := 0)
fall = 1
fall.recover = 1
numHits = 0
p1StateNo = ifElse(command = "holdback", 810, 805)
ID = 810

[State 800, HitDef: Should Throw]
type = HitDef
triggerall = anim = 800
triggerall = P2MoveType != H && !(P2StateNo = [150,159])
trigger1 = AnimElem = 2 &&  (P2MoveType != H || var(20))
trigger1 = var(10) = 1
attr = S, NT
hitFlag = MFD
priority = 5, Miss
getPower = 0,0
givePower = 0,0
sparkNo = -1 +0 * (var(53) := 0)
guard.sparkNo = -1 +0 * (var(54) := 8000)
sparkXY = -10 + 0 * (var(55) := 40), var(56) := -50
hitSound = -1 +0 * (var(51) := 800)
guardSound = -1 +0 * (var(52) := 0)
fall = 1
fall.recover = 1
numHits = 0
p1StateNo = ifElse(command = "holdback", 830, 805)
ID = 830

[State 800, HitDef: Hit Throw Human]
type = HitDef
triggerall = !AILevel
triggerall = anim = 800
triggerall = P2MoveType != H && !(P2StateNo = [150,159])
trigger1 = AnimElem = 2 &&  (P2MoveType != H || var(20))
trigger1 = var(10) = 2 && var(40) != 1
attr = S, NT
hitFlag = MFD
priority = 5, Miss
getPower = 0,0
givePower = 0,0
sparkNo = -1 + 0 * (var(53) := 0)
guard.sparkNo = -1 +0 * (var(54) := 8000)
sparkXY = -10 + 0 * (var(55) := 40), var(56) := -50
hitSound = -1 +0 * (var(51) := 800)
guardSound = -1 +0 * (var(52) := 0)
fall = 1
fall.recover = 1
numhits = 0
p1stateno = ifElse(command = "holdfwd", 820, 805)
ID = 820

[State 800, HitDef: Hit Throw AI]
type = HitDef
triggerall = AILevel
triggerall = anim = 800
triggerall = P2MoveType != H && !(P2StateNo = [150,159])
trigger1 = AnimElem = 2 &&  (P2MoveType != H || var(20))
trigger1 = var(10) = 2 && var(40) != 1
attr = S, NT
hitFlag = MFD
priority = 5, Miss
getPower = 0,0
givePower = 0,0
sparkNo = -1 + 0 * (var(53) := 0)
guard.sparkNo = -1 +0 * (var(54) := 8000)
sparkXY = -10 + 0 * (var(55) := 40), var(56) := -50
hitSound = -1 +0 * (var(51) := 800)
guardSound = -1 +0 * (var(52) := 0)
fall = 1
fall.recover = 1
numhits = 0
p1stateno = ifElse(Enemynear,BackEdgeBodydist - BackEdgeBodydist > 0, 805, 820)
ID = 820

[State 800, Voice (Missed)]
type = PlaySnd
trigger1 = AnimElem = 4 && var(40) != 1
value = 800,0
channel = 0

[State 800, Voice (Missed)]
type = PlaySnd
trigger1 = AnimElem = 4 && var(40) = 1
value = 5000,10
channel = 0

[State 800, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,0
channel = 1

[State 800, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(3) >= 0
moveType = I

[State 800, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;===========<THROW SWITCHING SIDES>==========
[StateDef 805]
type = S
moveType = A
physics = S
anim = ifElse(var(40) = 1, 807, 805)
ctrl = 0
sprPriority = 0

[State 805, NoPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 805, LostTarget]
type = ChangeState
trigger1 = !NumTarget
value = 898

[State 805, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 806

[State 805, TargetFacing]
type = TargetFacing
trigger1 = !Time && NumTarget
value = -1

[State 805, Width]
type = Width
trigger1 = 1
edge = 24,24
ignoreHitPause = 1

[State 805, Turn]
type = Turn
trigger1 = AnimElem = 3

[State 805, Facing]
type = TargetFacing
trigger1 = 1
value = -1

[State 805, Tech Hit]
type = ChangeState
trigger1 = NumTarget && var(19)
trigger1 = (Target, command = "holdfwd" || Target, command = "holdback") && Target, command != "holdup" && Target, command != "holddown"
trigger1 = (Target, command = "b" || Target, command = "c" || Target, command = "y" || Target, command = "z")
value = 890

[State 805, Tech Hit Countdown]
type = VarAdd
trigger1 = var(19) > 0
var(19) = -1

[State 805, TargetBind 1]
type = TargetBind
trigger1 = AnimElemTime(2) < 0 || AnimElemTime(4) >= 0
pos = 35,0

[State 805, TargetBind 2]
type = TargetBind
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(4) < 0
pos = 11,0

[State 805, SprPriority 1]
type = SprPriority
trigger1 = AnimElemTime(2) < 0 || AnimElemTime(4) >= 0
value = 1

[State 805, SprPriority -1]
type = SprPriority
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(4)< 0
value = -1

[State 805, End]
type = ChangeState
trigger1 = !NumTarget
value = 890
ctrl = 0

[State 805, End]
type = ChangeState
trigger1 = AnimElemTime(4) >= 0 && var(40) != 1
value = ifElse(var(10)=0, 810, IfElse(var(10)>1,820,830))


[State 805, End]
type = ChangeState
trigger1 = AnimElemTime(4) >= 0 && var(40) = 1
value = ifElse(var(10)=0, 810, 830)


;===========<THROW SWITCHING SIDES (TARGET)>==========
[StateDef 806]
type = A
moveType = H
physics = N
velSet = 0,0
sprPriority = 0

[State 806, ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 806

[State 806, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 1,1
ignoreHitPause = 1

[State 806, SelfState]
type = SelfState
trigger1 = Time >= 60
value = ifElse(pos y < 0, 5040, 0)
ctrl = 1



;===========<JIGOKU GURAMA (Wheel)>==========
[Statedef 810]
type = A
physics = N
moveType = A
anim = ifElse(var(40) = 1, 811, 810)
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 810, Push Off]
type = PlayerPush
trigger1 = 1
value = 0

[State 810, Lost Target]
type = ChangeState
triggerall = AnimElemtime(1)>=0 && AnimElemtime(9)<0
trigger1 = !NumTarget
trigger2 = (time=[1,65]) && Target,StateNo>=5000
value = 5020
ctrl = 0

[State 810, Tech Hit]
type = ChangeState
trigger1 = NumTarget && var(19)
trigger1 = (Target, command = "holdfwd" || Target, command = "holdback")
trigger1 = (Target, command = "b" || Target, command = "c" || Target, command = "y" || Target, command = "z")
value = 890

[State 810, Throw Escape]
type = VarAdd
trigger1 = var(19) > 0
var(19) = -1

[State 810, Throw]
type = TargetState
trigger1 = !Time && NumTarget
value = 815

[State 810, Throw]
type = TargetFacing
trigger1 = AnimElem = 9
value = 1

[State 810, Width]
type = Width
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(8) < 0
edge = 32,32
ignoreHitPause = 1

[State 810, Width]
type = Width
trigger1 = AnimElemTime(8) >= 0 && AnimElemTime(9) < 0
edge = 64,64
ignoreHitPause = 1

[State 810, TargetBind 1]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(2) < 0
pos = 35,0

[State 810, TargetBind 2]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) < 0
pos = 18,0

[State 810, TargetBind 3]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) < 0
pos = 12,-62

[State 810, TargetBind 4]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(5) < 0
pos = 2,-55

[State 810, TargetBind 5]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(6) < 0
pos = -14,-36

[State 810, TargetBind 6]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(6) >= 0 && AnimElemTime(7) < 0
pos = 9,0

[State 810, TargetBind 7]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(7) >= 0 && AnimElemTime(8) < 0
pos = 20,-52

[State 810, TargetBind 8]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(8) >= 0 && AnimElemTime(9) < 0
pos=-7,-54

[State 810, TargetBind 9]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElem = 9
pos = -74,-57

[State 810, Damage]
type = TargetLifeAdd
trigger1 = NumTarget && AnimElem = 9
value = Ifelse(P2Life>140,-140,-(P2Life-1))

[State 810, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget && AnimElem = 9
value = 36

[State 810, Power]
type = PowerAdd
trigger1 = NumTarget && AnimElem = 9 && !var(20)
value = 72

;17-45 frames
[State 810, VelSet]
type = VelSet
trigger1 = AnimElemtime(3)>0 && AnimElemtime(8)<0
x = -5
y = -cos((time-17)*6.4)


[State 810, VelSet]
type = VelSet
trigger1 = AnimElem = 8
x = 0
y = 0

[State 810, Posfix]
type = Posset
trigger1 = AnimElem = 8
y = 0

[State 810, HitAdd]
type = HitAdd
trigger1 = NumTarget && AnimElem = 9
value = 1

[State 810, VarAdd]
type = VarAdd
trigger1 = NumTarget && AnimElem = 9
var(13) = 1

[State 810, Juggle]
type = VarAdd
trigger1 = NumTarget && AnimElem = 9
var(15) = 1
ignoreHitPause = 1

[State 810, Juggle]
type = VarSet
trigger1 = NumTarget && AnimElem = 9
var(16) = 1
ignoreHitPause = 1

[State 810, Throw]
type = TargetState
trigger1 = NumTarget && AnimElem = 9
value = 816

[State 810, Voice]
type = PlaySnd
trigger1 = AnimElem = 8 && var(40) != 1
value = 1300,0
channel = 0

[State 810, Voice (Violent)]
type = PlaySnd
trigger1 = AnimElem = 9 && var(40) = 1
value = 810,10
channel = 0

[State 810, Woosh Sound 1]
type = PlaySnd
trigger1= AnimElem = 5
value = 1,4
channel = 1

[State 810, Woosh Sound 2]
type = PlaySnd
trigger1= AnimElem = 9
value = 1,5
channel = 1

[State 810, Shake]
type = EnvShake
trigger1= AnimElem = 8
time = 70
freq = 70
ampl = 3

[State 810, Statetypeset]
type = StateTypeSet
trigger1 = AnimElem = 10
Type = C
MoveType = I
Physics = C

[State 810, Ground]
type = posset
trigger1 = !AnimTime
y = 0

[State 810, Turn]
type = Turn
trigger1 = !AnimTime

[State 810, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;===========<JIGOKU GURAMA (TARGET)>==========
;Being Thrown
[StateDef 815]
type = A
moveType = H
physics = N
velSet = 0,0
sprPriority = 0

[State 815, ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 815

[State 815, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 0,0
ignoreHitPause = 1


;After Throw Target
[StateDef 816]
type = A
physics = N
movetype = H
ctrl = 0
sprPriority = 2

[State 816, velset from shoulder]
type = velset
trigger1 = !time && PrevStateNo = 835
x = -5
y = 14

[State 816, velset from wheel]
type = velset
trigger1 = !time && PrevStateNo = 815
x = -5
y = -7

[State 816, SprPriority]
type = SprPriority
trigger1 = AnimElemTime(1) >= 0
value = 1

[State 816, Turn]
type = Turn
trigger1 = !Time

[State 816, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
moveCamera = 1,0
ignoreHitPause = 1

[State 816, VelAdd]
type = VelAdd
Trigger1 = 1
y = 0.5

[State 816, Shake]
type = EnvShake
trigger1= Pos y >= -50
time = 20
freq = 60
ampl = vel y / 3.0
persistence = 0

;[State 816, Recover]
;type = SelfState
;trigger1 = Alive
;trigger1 = command = "recovery"
;trigger1 = vel y > 0 && pos y >= const(movement.air.getHit.groundRecover.ground.threshold)
;value = 5200

[State 816, Damage]
type = LifeAdd
trigger1 = vel y > 0 && pos y >= -24
value = -100 + 90 * (PrevStateNo = 815)
persistence = 0

[State 816, End]
type = SelfState
trigger1 = vel y > 0 && pos y >= -24
value = 5100



;===========<TSUKAMI NAGE>==========
[StateDef 820]
type = S
physics = S
moveType = A
anim = 820
ctrl = 0
velset = 0,0
sprpriority = 1

[State 820, LostTarget Player]
type = ChangeState
trigger1 = !NumTarget
trigger2 = time && Target,StateNo>=5000
value = 898

[State 820, No Push]
type = PlayerPush
trigger1 = 1
value = 0

[State 820, Tech Hit]
type = ChangeState
trigger1 = NumTarget && var(19)
trigger1 = (Target, command = "holdfwd" || Target, command = "holdback")
trigger1 = (Target, command = "b" || Target, command = "c" || Target, command = "y" || Target, command = "z")
value = 890

[State 820, Escape]
type = VarAdd
trigger1 = var(19) > 0
var(19) = -1

[State 820, Throw]
type = TargetState
trigger1= !Time && NumTarget
value = 826

[State 820, Throw]
type = TargetFacing
trigger1 = !time
value = -1

[State 820, TargetBind]
type = TargetBind
trigger1 = !time && NumTarget
pos = 50 - Target, const(size.ground.back), 0

[State 820, Width]
type = Width
trigger1 = 1
edge = 29, 0
ignoreHitPause = 1

[State 820, Timer Start]
type = VarSet
trigger1 = !time
var(10) = 135

[State 820, Timer End (Round Over)]
type = VarSet
trigger1 = RoundState != 2
var(10) = 0

[State 820, Timer Countdown]
type = VarAdd
trigger1 = HitCount
var(10) = -1

[State 820, Timer]
type = VarAdd
triggerAll = NumTarget && HitCount
trigger1 = Target, command = "x" || Target, command = "y" || Target, command = "z"
trigger2 = Target, command = "a" || Target, command = "b" || Target, command = "c"
trigger3 = Target, command = "up" || Target, command= "down" || Target, command = "back" || Target, command = "fwd"
var(10) = -1

[State 820, Mashing]
type = VarSet
trigger1 = !Time
var(42) = 0

[State 820, Mashing]
type = VarSet
trigger1 = !Time
var(12) = 0

[State 820, Mashing]
type = VarSet
triggerAll = var(42) = 0
trigger1 = !AILevel && (command = "a" || command = "b" || command = "c" || command = "x" || command = "y" || command = "z")
trigger2 = !AILevel && (command = "up" || command = "down" || command = "back" || command = "fwd")
trigger3 = AILevel && Random < 800
var(42) = 2

[State 820, Mashing Increment]
type  = VarAdd
trigger1 = var(42) = 2
var(12) = 1

[State 820, Mashing Decrement]
type = VarAdd
trigger1 = var(42) > 0
var(42) = -1

[State 820, Anim Skip]
type = ChangeAnim
triggerall = var(10) > 0
trigger1 = AnimElemTime(AnimElemNo(0)) >= 0 && AnimElemTime(3) < 0
trigger1 = AnimElemTime(AnimElemNo(0) +1 ) >= -var(12)
trigger1 = 1 || var(12) := (var(12) + AnimElemTime(AnimElemNo(0) + 1))
value = 820
elem = AnimElemNo(0) + 1

[State 820, Anim Skip]
type = ChangeAnim
triggerAll = var(10) > 0
trigger1 = AnimElemTime(3)>0
trigger1 = AnimElemTime(3)>=(8 - var(12))
trigger1 = 1 || var(12) := (var(12) + 8 - AnimElemTime(3))
value = 820
elem = 1

[State 820, PalFX Flash]
type = PalFX
trigger1 = command = "a" || command = "b" || command = "c" || command = "x" || command = "y" || command = "z"
trigger2 = command = "up" || command = "down" || command = "back" || command = "fwd"
time = 1
add = 32, 32, 32

[State 820, Throw]
type = TargetState
trigger1 = NumTarget
trigger1 = Target,StateNo != 825
trigger1 = AnimElemTime(3) < 0 || AnimElemTime(5) >= 0
value = 825

[State 820, Throw]
type = TargetState
trigger1 = NumTarget
trigger1 = Target, StateNo != 826
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(5) < 0
value = 826

[State 820, Damage]
type = TargetLifeAdd
trigger1 = NumTarget && AnimElem = 3
value = floor(ifElse(14 * fvar(11) < 7, -7, -14 * fvar(11)))
kill = 1

[State 820, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = HitCount = 1
trigger1 = NumTarget && AnimElem = 3
value = 36

[State 820, Power]
type = PowerAdd
trigger1 = HitCount = 1
trigger1 = NumTarget && AnimElem = 3 && !var(20)
value = 72

[State 820, HitAdd]
type = HitAdd
trigger1 = NumTarget && AnimElem = 3
value = 1

[State 820, Hit Count Increment]
type = VarAdd
trigger1 = NumTarget && AnimElem = 3
var(13) = 1

[State 820, Juggle Points Increment]
type = VarAdd
trigger1 = NumTarget && AnimElem = 3
var(15) = 1
ignoreHitPause = 1

[State 820, Juggle Flag Set]
type = VarSet
trigger1 = NumTarget && AnimElem = 3
var(16) = 1
ignoreHitPause = 1

[State 820, EnvShake]
type = EnvShake
trigger1 = NumTarget && AnimElem = 3
time = 14
ampl = 4
freq = 120

[State 820, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 4,2
channel = 0

[State 820, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,5
channel = 1

[State 820, Hit Sound]
type = PlaySnd
trigger1 = NumTarget && AnimElem = 3
value = 2,5
channel = 2

[State 820, Hit Spark]
type = Helper
trigger1 = NumTarget && AnimElem = 3
helperType = Normal
stateNo = 8012
ID = 8000
name = "Spark"
posType = P1
pos = 38, -56
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 820, End]
type = ChangeState
trigger1 = var(10) <= 0
trigger1 = !Animtime
trigger2 = NumTarget
trigger2 = !(Target, Alive)
trigger3 = Time >= 180
value = 821


;Final Hit
[StateDef 821]
type = S
physics = S
moveType = A
anim = 821
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 821, LostTarget]
type = ChangeState
trigger1 = !NumTarget
trigger2 = time && Target,StateNo>=5000
value = 898

[State 821, Width]
type = Width
trigger1 = 1
edge = ceil(29 * const(size.xScale)), 0
ignoreHitPause = 1

[State 821, Damage]
type = TargetLifeAdd
trigger1 = NumTarget && AnimElem = 3
value = floor(ifElse(61 * fvar(11) < 7, -7, -61 * fvar(11)))
kill = 1

[State 821, HitAdd]
type = HitAdd
trigger1 = NumTarget && AnimElem = 3
value = 1

[State 821, Hit Count Increment]
type = VarAdd
trigger1 = NumTarget && AnimElem = 3
var(13) = 1

[State 821, Juggle Points Increment]
type = VarAdd
trigger1 = NumTarget && AnimElem = 3
var(15) = 1
ignoreHitPause = 1

[State 821, Juggle Flag Set]
type = VarSet
trigger1 = NumTarget && AnimElem = 3
var(16) = 1
ignoreHitPause = 1

[State 821, Throw]
type = TargetState
trigger1 = NumTarget && AnimElem = 3
value = 827

[State 821, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 820,0
channel = 0

[State 821, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1,5
channel = 1

[State 821, Hit Sound]
type = PlaySnd
trigger1 = NumTarget && AnimElem = 3
value = 2,5
channel = 2

[State 821, Hit Spark]
type = Helper
trigger1 = NumTarget && AnimElem = 3
helperType = Normal
stateNo = 8012
ID = 8000
name = "Spark"
posType = P1
pos = 58, -69
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 821, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;===========<KNEES OF HADES (TARGET)>==========
[StateDef 825]
type = S
moveType = H
physics = S
velSet = 0,0
sprPriority = 0

[State 825, ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 825

[State 825, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 0,0
ignoreHitPause = 1

[State 825, PalFX Flash]
type = PalFX
trigger1 = command = "a" || command = "b" || command = "c" || command = "x" || command = "y" || command = "z"
trigger2 = command = "up" || command = "down" || command = "back" || command = "fwd"
time = 1
add = 32, 32, 32

[State 825, Free]
type = SelfState
trigger1 = time > 90
value = 0
ctrl = 1

;Being Hit
[StateDef 826]
type = A
moveType = H
physics = N
velSet = 0,0
sprPriority = 0

[State 826, ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 826

[State 826, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 0,0
ignoreHitPause = 1

[State 826, PalFX Flash]
type = PalFX
trigger1 = command = "a" || command = "b" || command = "c" || command = "x" || command = "y" || command = "z"
trigger2 = command = "up" || command = "down" || command = "back" || command = "fwd"
time = 1
add = 32, 32, 32

[State 826, Free]
type = SelfState
trigger1 = time > 90
value = 0
ctrl = 1

;After Throw
[StateDef 827]
type = A
physics = N
moveType = H
ctrl = 0
velSet = 0,0
sprPriority = 0

[State 827, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 5030

[State 827, ChangeAnim]
type = ChangeAnim
trigger1 = Anim = 5030 && !AnimTime
trigger1 = SelfAnimExist(5035)
value = 5035

[State 827, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 5050 && !AnimTime
value = 5050

[State 828, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
moveCamera = 1,0
ignoreHitPause = 1

[State 828, VelAdd]
type = VelAdd
trigger1 = 1
y = 0.58

[State 828, VelSet]
type = VelSet
trigger1 = !Time
x = -4.17
y = -8.25

[State 828, EnvShake]
type = EnvShake
trigger1 = vel y > 0
trigger1 = pos y >= 25
time = 14
ampl = 4
freq = 120

;[State 828, Recover]
;type = SelfState
;trigger1 = Alive
;trigger1 = command = "recovery"
;trigger1 = vel y > 0 && pos y >= const(movement.air.getHit.groundRecover.ground.threshold)
;value = 5200

[State 828, ChangeAnim]
type = ChangeAnim
trigger1 = vel y > 0
trigger1 = pos y >= 25
trigger1 = SelfAnimExist(5051)
value = 5051

[State 828, End]
type = SelfState
trigger1 = vel y > 0
trigger1 = pos y >= 25
value = 5100



;===========<SEOI NAGE (Shoulder)>==========
[Statedef 830]
type = S
physics = S
moveType = A
anim = 830
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 830, LostTarget]
type = ChangeState
triggerall = AnimElemtime(1)>=0 && AnimElemtime(5)<0
trigger1 = !NumTarget
trigger2 = (time=[1,28]) && Target,StateNo>=5000
value = 898

[State 820, No Push]
type = PlayerPush
trigger1 = 1
value = 0

[State 830, Tech Hit]
type = ChangeState
trigger1 = NumTarget && var(19)
trigger1 = (Target, command = "holdfwd" || Target, command = "holdback")
trigger1 = (Target, command = "b" || Target, command = "c" || Target, command = "y" || Target, command = "z")
value = 890

[State 830, Throw Escape]
type = VarAdd
trigger1 = var(19) > 0
var(19) = -1

[State 830, Throw]
type = TargetState
trigger1 = !Time && NumTarget
value = 835

[State 830, Throw]
type = TargetFacing
trigger1 = AnimElem = 5
value = 1

[State 830, Width]
type = Width
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(5) < 0
edge = 32,0
ignoreHitPause = 1

[State 830, Width]
type = Width
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(6) < 0
edge = 64,0
ignoreHitPause = 1

[State 830, TargetBind 1]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(2) < 0
pos = 35,0

[State 830, TargetBind 2]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) < 0
pos = 8,-84

[State 830, TargetBind 3]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) < 0
pos = -17,-105

[State 830, TargetBind 4]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(5) < 0
pos = -60,-85

[State 830, TargetBind 5]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElem = 5
pos = -60,-60

[State 830, Damage]
type = TargetLifeAdd
trigger1 = NumTarget && AnimElem = 5
value = Ifelse(P2Life>40,-40,-(P2Life-1))

[State 830, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget && AnimElem = 5
value = 36

[State 830, Power]
type = PowerAdd
trigger1 = NumTarget && AnimElem = 5 && !var(20)
value = 72

[State 830, HitAdd]
type = HitAdd
trigger1 = NumTarget && AnimElem = 5
value = 1

[State 830, VarAdd]
type = VarAdd
trigger1 = NumTarget && AnimElem = 5
var(13) = 1

[State 830, Juggle]
type = VarAdd
trigger1 = NumTarget && AnimElem = 5
var(15) = 1
ignoreHitPause = 1

[State 830, Juggle]
type = VarSet
trigger1 = NumTarget && AnimElem = 5
var(16) = 1
ignoreHitPause = 1

[State 830, Throw]
type = TargetState
trigger1 = NumTarget && AnimElem = 5
value = 816

[State 830, Voice Normal]
type = PlaySnd
trigger1 = var(40) != 1
trigger1 = AnimElem = 5
value = 820,0
channel = 0

[State 830, Voice Violent]
type = PlaySnd
trigger1 = var(40) = 1
trigger1 = AnimElem = 5
value = 810,10
channel = 0

[State 830, Woosh Sound]
type = PlaySnd
trigger1= AnimElem = 5
value = 1,5
channel = 1

[State 830, Turn]
type = Turn
trigger1 = !AnimTime

[State 830, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;===========<SEOI NAGE (TARGET)>==========
;Being Thrown
[StateDef 835]
type = A
moveType = H
physics = N
velSet = 0,0
sprPriority = 0

[State 835, ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 835

[State 835, SprPriority]
type = SprPriority
trigger1 = AnimElem = 4
value = 2

[State 835, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 0,0
ignoreHitPause = 1


;After Throw
[StateDef 836]
type = A
physics = N
movetype = H
ctrl = 0
velSet = -6, -6

[State 836, Turn]
type = Turn
trigger1 = !Time

[State 836, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
moveCamera = 1,0
ignoreHitPause = 1

[State 836, VelAdd]
type = VelAdd
Trigger1 = 1
y = 0.5

[State 836, EnvShake]
type = EnvShake
trigger1 = vel y > 0 && pos y >= -24
time = 14
ampl = 4
freq = 120

[State 836, Recover]
type = SelfState
trigger1 = Alive
trigger1 = command = "recovery"
trigger1 = vel y > 0 && pos y >= const(movement.air.getHit.groundRecover.ground.threshold)
value = 5200

[State 836, End]
type = SelfState
trigger1 = vel y > 0 && pos y >= -24
value = 5100




;===========<AIR THROW ATTEMPT>==========
[StateDef 850]
type = A
physics = N
moveType = A
anim = 850
ctrl = 0
sprPriority = 1
powerAdd = 18 * !var(20)

[State 850, Tech Hit Reset]
type = VarSet
trigger1 = 1
var(19) = 0

[State 850, Tech Hit]
type = VarSet
trigger1 = NumEnemy
trigger1 = EnemyNear, StateType = A
trigger1 = (EnemyNear, StateNo = [0,999]) && (EnemyNear, StateNo != [100,119]) && (EnemyNear, StateNo != [200,799])
var(19) = 7

[State 850, AttackDist]
type = AttackDist
trigger1 = 1
value = 0

[State 850, HitDef]
type = HitDef
triggerall = P2MoveType != H || var(20)
trigger1 = AnimElem = 1
attr = A,NT
hitFlag = AF
priority = 1,Miss
getPower = 0,0
givePower = 0,0
sparkNo = -1 + 0 * (var(53) := 0)
guard.sparkNo = -1 + 0 * (var(54) := 8000)
sparkXY = -10 + 0 * (var(55) := 40), var(56) := -50
hitSound = -1 + 0 * (var(51) := 800)
guardSound = -1 + 0 * (var(52) := 0)
fall = 1
fall.recover = 1
numHits = 0
p1StateNo = 860

[State 850, Voice (Missed)]
type = PlaySnd
trigger1 = AnimElem = 4 && var(40) != 1
value = 800,0
channel = 0

[State 850, Voice (Missed)]
type = PlaySnd
trigger1 = AnimElem = 4 && var(40) = 1
value = 5000,10
channel = 0

[State 850, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1,0
channel = 1

[State 850, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(2) >= 0
moveType = I

[State 850, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 850, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 52



;===========<JIGOKU HUSHA>==========
;In Air
[StateDef 860]
type = A
physics = N
moveType = A
anim = 860
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 860, No Push]
type = PlayerPush
trigger1 = 1
value = 0

[State 860, Throw Escape]
type = ChangeState
trigger1 = NumTarget && var(19)
trigger1 = (Target, command = "holdfwd" || Target, command = "holdback")
trigger1 = (Target, command = "b" || Target, command = "c" || Target, command = "y" || Target, command = "z")
value = 892

[State 860, Throw Escape]
type = VarAdd
trigger1 = var(19) > 0
var(19) = -1

[State 860, Turn]
type = Turn
triggerAll = !Time
trigger1 = sysvar(1) > 0
;trigger1 = command = "holdfwd"

[State 860, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 865

[State 860, TargetFacing]
type = TargetFacing
trigger1 = Time <= 1
value = -1

[State 860, Width]
type = Width
trigger1 = AnimElemTime(2) >= 0 && Anim = 861
edge = 33,0
ignoreHitPause = 1

[State 860, ChangeAnim]
type = ChangeAnim
trigger1 = !AnimTime && Anim = 860
value = 861

[State 860, TargetBind 1]
type = TargetBind
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(2) < 0 && Anim = 860
pos = 18,0

[State 860, TargetBind 2]
type = TargetBind
trigger1 = AnimElemTime(2) >= 0 && Anim = 860
pos = 12,-62

[State 860, TargetBind 3]
type = TargetBind
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(2) < 0 && Anim = 861
trigger2 = AnimElem = 3
pos = 2,-55

[State 860, TargetBind 4]
type = TargetBind
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) < 0 && Anim = 861
pos = -14,-36

[State 860, TargetBind 5]
type = TargetBind
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) < 0 && Anim = 861
pos = 9,0

[State 860, TargetBind 6]
type = TargetBind
trigger1 = AnimElemTime(4) >= 0 && Anim = 861
pos = 20,-52

[State 860, Bind Fix]
type = PosSet
trigger1 = pos y > 65
trigger1 = AnimElemTime(1) < 0 && Anim = 861
y = 65

[State 860, VelAdd]
type = VelAdd
trigger1= AnimElemTime(1) >= 0 && Anim = 861
y = 0.442225

[State 860, Voice]
type = PlaySnd
trigger1 = AnimElem = 1 && var(40) != 1 && Anim = 860
value = 1300,0
channel = 0

[State 860, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 2 && Anim = 861
value = 1,4
channel = 1

[State 860, VelSet]
type = VelSet
trigger1 = !Time
x = -3

[State 860, Lost Target]
type = ChangeState
trigger1 = !NumTarget
trigger2 = time && Target,StateNo != 865
value = 5020
ctrl = 0


[State 860, End]
type = ChangeState
trigger1= vel y > 0
trigger1 = pos y > -vel y
value = 861


;Finish
[StateDef 861]
type = C
physics = C
moveType = A
ctrl = 0
velSet = -3,0
sprPriority = 1

[State 861, No Push]
type = PlayerPush
trigger1 = 1
value = 0

[State 861, Lost Target]
type = ChangeState
trigger1 = !NumTarget
trigger2 = (time=[1,6]) && Target,StateNo>=5000
value = 5020
ctrl = 0

[State 861, ChangeAnim]
type = ChangeAnim
trigger1 = AnimElemTime(4) >= 6 && Anim = 861
value = 862 + (var(40) = 1)

[State 861, VelSet]
type = VelSet
trigger1 = Anim = 862 + (var(40) = 1)
x = 0

[State 861, Width]
type = Width
trigger1 = Anim = 862 + (var(40) = 1)
trigger1 = AnimElemTime(2) < 0
edge = 33,0
ignoreHitPause = 1

[State 861, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 861, Skid Dust]
type = Explod
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(4) < 0 && !(AnimElemTime(1) % 5) && Anim = 861
anim = 8104
sprPriority=3
posType = P1
pos = 0,0
vel = 0,0
scale = 0.5,0.5
pauseMovetime = -1
superMoveTime = -1
ownpal = 1

[State 861, Throw]
type = TargetFacing
trigger1 = Anim = 862 + (var(40) = 1)
trigger1 = AnimElem = 1
value = 1

[State 861, TargetBind 3]
type = TargetBind
trigger1 = Anim = 861
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(2) < 0
trigger2 = Anim = 861
trigger2 = AnimElem = 3
pos = 2,-55

[State 861, TargetBind 4]
type = TargetBind
trigger1 = Anim = 861
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) < 0
pos = -14,-36

[State 861, TargetBind 5]
type = TargetBind
trigger1 = Anim = 861
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) < 0
pos = 9,0

[State 861, TargetBind 3]
type = TargetBind
trigger1 = Anim = 861
trigger1 = AnimElemTime(4) >= 0
pos = 20,-52

[State 861, TargetBind 4]
type = TargetBind
trigger1 = Anim = 862 + (var(40) = 1)
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(2) < 0
pos = -7,-54

[State 861, TargetBind 5]
type = TargetBind
trigger1 = Anim = 862 + (var(40) = 1)
trigger1 = AnimElem = 2
pos = -74,-57

[State 861, Damage]
type = TargetLifeAdd
trigger1 = Anim = 862 + (var(40) = 1)
trigger1 = NumTarget
value = Ifelse(P2Life>150,-150,-(P2Life-1))
kill = 1
persistent = 0

[State 861, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = Anim = 862 + (var(40) = 1)
trigger1 = NumTarget
value = 36
persistent = 0

[State 861, Power]
type = PowerAdd
trigger1 = Anim = 862 + (var(40) = 1)
trigger1 = NumTarget && !var(20)
value = 72
persistent = 0

[State 861, HitAdd]
type = HitAdd
trigger1 = Anim = 862 + (var(40) = 1)
trigger1 = NumTarget
value = 1
persistent = 0

[State 861, HitCount]
type = VarAdd
trigger1 = Anim = 862 + (var(40) = 1)
trigger1 = NumTarget
var(13) = 1
persistent = 0

[State 861, Juggle]
type = VarAdd
trigger1 = Anim = 862 + (var(40) = 1)
trigger1= NumTarget && AnimElem = 2
var(15) = 1
ignoreHitPause = 1

[State 861, Juggle]
type = VarSet
trigger1 = Anim = 862 + (var(40) = 1)
trigger1 = NumTarget && AnimElem = 2
var(16) = 1
ignoreHitPause = 1

[State 861, TargetState]
type = TargetState
trigger1 = Anim = 862 + (var(40) = 1) && AnimElem = 1
trigger1 = NumTarget
value = 866

[State 861, Voice]
type = PlaySnd
trigger1 = Anim = 862 + (var(40) = 1)
trigger1 = AnimElem = 2 && var(40) = 1
value = 810,10
channel = 0

[State 861, Woosh Sound]
type = PlaySnd
trigger1 = Anim = 862 + (var(40) = 1)
trigger1 = NumTarget && AnimElem = 2
value = 1,5
channel = 1

[State 861, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0
channel = 2

[State 861, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = p1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 861, Shake]
type = EnvShake
trigger1= AnimElem = 2
time = 70
freq = 70
ampl = 3

[State 861, Statetypeset]
type = StateTypeSet
trigger1 = AnimElem = 3
Type = C
MoveType = I
Physics = C

[State 861, Ground]
type = posset
trigger1 = !AnimTime
y = 0

[State 861, Turn]
type = Turn
trigger1 = Anim = 862 + (var(40) = 1)
trigger1 = !AnimTime

[State 861, End]
type = ChangeState
trigger1 = Anim = 862 + (var(40) = 1)
trigger1 = !AnimTime
value = 0
ctrl = 1



;===========<JIGOKU HUSHA (TARGET)>==========
;In Air
[StateDef 865]
type = A
moveType = H
physics = N
velSet = 0,0
sprPriority = 0

[State 865, ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 865

[State 865, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 0,0
ignoreHitPause = 1

[State 865, safe]
type = SelfState
trigger1 = (P2StateNo != [860,865])
trigger2 = time > 180
value = 5020


;Finish
[StateDef 866]
type = A
physics = N
moveType = H
ctrl = 0
velSet = 0,0
sprPriority = 0

[State 866, ChangeAnim2]
type = ChangeAnim2
trigger1= !Time
value = 866

[State 866, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
moveCamera = 1,0
ignoreHitPause = 1

[State 866, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x = -5
y = -7

[State 866, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(2) > 0
y = 0.47

[State 866, EnvShake]
type = EnvShake
trigger1 = pos y > -vel y
time = 14
ampl = -4
freq = 120

;[State 866, Recover]
;type = SelfState
;trigger1 = Alive
;trigger1 = command = "recovery"
;trigger1 = vel y > 0 && pos y >= const(movement.air.getHit.groundRecover.ground.threshold)
;value = 5200

[State 866, Damage]
type = LifeAdd
trigger1 = AnimElemTime(2) > 0
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = -10
persistence = 0

[State 866, End]
type = SelfState
trigger1 = AnimElemTime(2) > 0
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 5100



;===========<THROW ESCAPED>==========
[StateDef 890]
type = S
physics = N
movetype = I
anim = 5945
ctrl = 0
velset = 0,0
sprPriority = 1

[State 890, TargetBind]
type = TargetBind
trigger1 = !Time && NumTarget
pos = 0,0

[State 890, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 895

[State 890, TargetFacing]
type = TargetFacing
trigger1 = !Time && NumTarget
value = -1

[State 890, PosAdd]
type = PosAdd
trigger1 = !Time
x = 24

[State 890, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 890, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0
ignoreHitPause = 1

[State 890, SprPriority 1]
type = SprPriority
trigger1 = AnimElemTime(6) >= 0
value = 1

[State 890, SprPriority -1]
type = SprPriority
trigger1 = AnimElemTime(2) <= 0
value = -1

[State 890, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 890, VelSet]
type = VelSet
trigger1 = 1
x = -1.425
y = 0

[State 890, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 5000,2
channel = 0

[State 890, Escape Sound]
type = PlaySnd
trigger1= !Time
value = 760,0

[State 890, Throw Escape FX]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8000
ID = 8000
name = "Spark"
PosType = P1
pos = 0, -68
facing = -1
ownPal = 1
size.xScale = 0.5
size.yScale = 0.5
pauseMoveTime = 65535
superMoveTime = 65535

[State 890, End]
type = ChangeState
trigger1 = Time >= 27
value = 0
ctrl = 1


;Target Escape
[StateDef 895]
type = S
physics = N
moveType = I
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 895, ChangeAnim]
type = ChangeAnim
trigger1= !Time
value = ifElse(SelfAnimExist(5940), 5940, 130)

[State 895, ChangeAnim]
type = ChangeAnim
trigger1 = !Time && !SelfAnimExist(5945) && SelfAnimExist(5940)
value = 5940

[State 895, ChangeAnim]
type = ChangeAnim
trigger1= !Time && !SelfAnimExist(5945) && !SelfAnimExist(5940) && SelfAnimExist(5910)
value = 5910

[State 895, ChangeAnim]
type = ChangeAnim
trigger1 = Time >= 20 && Anim = 130
value = 140

[State 895, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 895, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0
ignoreHitPause = 1

[State 895, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 895, VelSet]
type = VelSet
trigger1 = 1
x = -1.425
y = 0

[State 895, End]
type = SelfState
trigger1 = Time >= 27
value = 0
ctrl = 1



;===========<THROW ESCAPE MIDAIR>==========
[StateDef 892]
type = A
physics = N
moveType = I
anim = 892
ctrl = 0
velSet = 0, 0
sprPriority = 1

[State 892, TargetBind]
type = TargetBind
trigger1 = !Time && NumTarget
pos = 48, 0

[State 892, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 897

[State 892, TargetFacing]
type = TargetFacing
trigger1 = !Time && NumTarget
value = -1

[State 892, PosAdd]
type = PosAdd
trigger1 = !Time
x = 24

[State 892, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 892, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 892, PosFreeze]
type = PosFreeze
trigger1 = Time < 18
value = 1

[State 892, VelSet]
type = VelSet
trigger1 = Time = 18
x = -2
y = -4

[State 892, VelAdd]
type = VelAdd
trigger1 = Time > 18
y = 0.5

[State 892, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 2
value = 5000,2
channel = 0

[State 892, PlaySnd]
type = PlaySnd
trigger1 = !Time
value = 760,0

[State 892, Throw Escape FX]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8000
ID = 8000
name = "Spark"
posType = P1
pos = 24,-64
facing = -1
ownPal = 1
size.xScale = 0.5
size.yScale = 0.5
pauseMoveTime = 65535
superMoveTime = 65535

[State 892, ChangeState]
type = ChangeState
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 52


;Target Escape
[StateDef 897]
type = A
physics = N
moveType = I
ctrl = 0
velSet = 0, 0
sprPriority = 1

[State 897, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 152

[State 897, ChangeAnim]
type = ChangeAnim
trigger1 = Time = 18
value = 142

[State 897, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 897, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 897, PosFreeze]
type = PosFreeze
trigger1 = Time < 18
value = 1

[State 897, VelSet]
type = VelSet
trigger1 = Time = 18
x = -2
y = -4

[State 897, VelAdd]
type = VelAdd
trigger1 = Time >= 18
y = 0.5

[State 897, SelfState]
type = SelfState
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 52

;====== Throw breaked by Hit ====
[StateDef 898]
type = S
physics = S
movetype = I
anim = 898
ctrl = 0
velset = 0,0
sprPriority = 1

[State 898, Posfix]
type = Posset
trigger1 = !time
y = 0

[State 898, Turn]
type = Turn
trigger1 = !time && P2Dist x <0

[State 898, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = 5000,0 + (10*(var(40)=1))
channel = 0

[State 898, End]
type = ChangeState
trigger1 = !Animtime
value = 0
ctrl = 1