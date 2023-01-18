; ______________________________
;| Ryu by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;============================================================================================
;=====================================<NORMAL STATES>========================================
;============================================================================================

;=========<Stand Light Punch>==========
[Statedef 200]
type = S
movetype = A
physics = S
anim = ifelse(abs(fvar(16)) <= (const(size.xscale) * 20), 201, 200)
velset = 0, 0
poweradd = 0
sprpriority = 1
ctrl = 0
facep2 = 1

[State 200, Snd]
type = playsnd
trigger1 = animelem = 2 && random < 200 && var(1) != 2
value = 3, ifelse(random < 500, 3, 6)
channel = 0
[State 200, Snd]
type = playsnd
trigger1 = animelem = 2 && random < 200 && var(1) = 2
value = 13, ifelse(random < 500, 1, 3)
channel = 0
[State 200, Snd]
type = playsnd
trigger1 = var(1) = 2 && random < 200 && animelem = 2
value = 13, ifelse(random < 500, 1, 3)
channel = 0

[State 200, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 1
channel = 1

[State 200, Hit]
type = hitdef
trigger1 = anim = 200 && animelem = 2
trigger1 = (var(15) < 1 || var(20))
attr = S, NA
damage = 30, 0
animtype = Light
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 8, 8
sparkno = -1 + 0 * (var(33) := 8010)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 25) * (var(36) := 66), var(37) := -85
hitsound = -1 + 0 * (var(31) := 1)
guardsound = -1
ground.type = High
ground.slidetime = 12
ground.hittime = 12 + 2 * (var(9) != 0)
ground.velocity = ifelse(var(20), -2.66, -4.49), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
air.type = Low
air.hittime = 120
air.velocity = -4.25, -6.88
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 50) * !var(20), 25 * !var(20)
givepower = 40, 40
yaccel = 0.4850
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State 200, Hit]
type = hitdef
trigger1 = anim = 201 && animelem = 2
trigger1 = (var(15) < 1 || var(20))
attr = S, NA
damage = 30, 0
animtype = Light
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 8, 8
sparkno = -1 + 0 * (var(33) := 8010)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 20) * (var(36) := 40), var(37) := -95
hitsound = -1 + 0 * (var(31) := 1)
guardsound = -1
ground.type = High
ground.slidetime = 12
ground.hittime = 12 + 2 * (var(9) != 0)
ground.velocity = ifelse(var(20), -2.66, -4.49), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
air.type = Low
air.hittime = 120
air.velocity = -4.25, -6.88
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 50) * !var(20), 25 * !var(20)
givepower = 40, 40
yaccel = 0.4850
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State 200, Anim]
type = changeanim
trigger1 = anim = 200
trigger1 = (movecontact = 1 || movereversed = 1) && hitpausetime
trigger1 = animelemtime(2) >= 0 && animelemtime(3) <= 0
trigger1 = hitpausetime <= 6
value = 200
elem = 3
ignorehitpause = 1

[State 200, Anim]
type = changeanim
trigger1 = anim = 201
trigger1 = (movecontact = 1 || movereversed = 1) && hitpausetime
trigger1 = animelemtime(2) >= 0 && animelemtime(3) <= 0
trigger1 = hitpausetime <= 6
value = 201
elem = 3
ignorehitpause = 1

[State Idle]
type = statetypeset
trigger1 = animelemtime(3) >= 0
movetype = I

[State 200, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=========<Stand Medium Punch>==========
[Statedef 210]
type = S
movetype = A
physics = S
anim = ifelse(abs(fvar(16)) <= (const(size.xscale) * 25), ifelse(var(1) = 1, 211, 212), 210)
velset = 0, 0
poweradd = 0
sprpriority = 1
ctrl = 0
facep2 = 1

[State 210, Snd]
type = playsnd
trigger1 = animelem = 3 && random < 350 && var(1) != 2
value = 3, ifelse(random < 500, 2, 3)
channel = 0
[State 210, Snd]
type = playsnd
trigger1 = animelem = 3 && random < 350 && var(1) = 2
value = 13, ifelse(random < 500, 1, 2)
channel = 0
[State 210, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 2
channel = 1

[State 210, Hit]
type = hitdef
trigger1 = animelem = 3 && anim = 210
trigger1 = (var(15) < 1 || var(20))
attr = S, NA
damage = 80, 0
animtype = Medium
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = -1 + 0 * (var(33) := 8011)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 73), var(37) := -79
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1
ground.type = High
ground.slidetime = 15
ground.hittime = 15 + 3 * (var(9) != 0)
ground.velocity = ifelse(var(20), -4.30, -7.51), 0
ground.cornerpush.veloff = 0
air.type = Low
air.hittime = 120
air.velocity = -4.25, -6.88
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 100) * !var(20), ifelse(moveguarded, 25, 50) * !var(20)
givepower = 40, 40
yaccel = 0.4850
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State 210, Hit]
type = hitdef
trigger1 = animelem = 3 && anim = 211
trigger1 = (var(15) < 1 || var(20))
attr = S, NA
damage = 70, 0
animtype = Medium
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = -1 + 0 * (var(33) := 8011)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 35) * (var(36) := 62), var(37) := -76
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1
ground.type = High
ground.slidetime = 15
ground.hittime = 15 + 3 * (var(9) != 0)
ground.velocity = ifelse(var(20), -4.30, -7.51), 0
ground.cornerpush.veloff = 0
air.type = Low
air.hittime = 120
air.velocity = -4.25, -6.88
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 100) * !var(20), ifelse(moveguarded, 25, 50) * !var(20)
givepower = 40, 40
yaccel = 0.4850
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State 210, Hit]
type = hitdef
trigger1 = animelem = 3 && anim = 212
trigger1 = (var(15) < 1 || var(20))
attr = S, NA
damage = 70, 0
animtype = Medium
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = -1 + 0 * (var(33) := 8011)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 40) * (var(36) := 64), var(37) := -61
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1
ground.type = Low
ground.slidetime = 15
ground.hittime = 15 + 3 * (var(9) != 0)
ground.velocity = ifelse(var(20), -4.30, -7.51), 0
ground.cornerpush.veloff = 0
air.type = Low
air.hittime = 120
air.velocity = -4.25, -6.88
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 100) * !var(20), ifelse(moveguarded, 25, 50) * !var(20)
givepower = 40, 40
yaccel = 0.4850
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State 210, Anim]
type = changeanim
trigger1 = anim = 210
trigger1 = (movecontact = 1 || movereversed = 1) && hitpausetime
trigger1 = animelemtime(3) >= 0 && animelemtime(4) <= 0
trigger1 = hitpausetime <= 7
value = 210
elem = 4
ignorehitpause = 1

[State 210, Anim]
type = changeanim
trigger1 = anim = 212
trigger1 = (movecontact = 1 || movereversed = 1) && hitpausetime
trigger1 = animelemtime(3) >= 0 && animelemtime(4) <= 0
trigger1 = hitpausetime <= 6
value = 212
elem = 4
ignorehitpause = 1

[State 210, Kikoku Tsuki]
type = changestate
trigger1 = !AIlevel
trigger1 = var(1) = 2 && command = "z"
trigger1 = (movecontact + movereversed) = [1, 2]
value = 227

[State 211, Ryu Target Combo]
type = changestate
triggerall = var(1) = 1
triggerall = prevstateno != 710
triggerall = (movecontact + movereversed) = [1, 2]
triggerall = command = "c"
trigger1 = !AIlevel
trigger1 = command != "holddown"
trigger2 = AILevel && random < 500
value = 255


[State Idle]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I

[State 210, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1

;=========<Sakotsu Wari>==========
[Statedef 215]
type = S
movetype = A
physics = S
anim = 215
velset = 0, 0
poweradd = 0
sprpriority = 1
ctrl = 0
facep2 = 1

[State 215, Snd]
type = playsnd
trigger1 = ifelse(var(1) = 2, (animelem = 2), (animelem = 3))
value = ifelse(var(1) = 2, 13, 3), 3 -(var(1) = 2) * 2
channel = 0
[State 215, Snd]
type = playsnd
trigger1 = animelem = 4
value = 1, 3
channel = 1

[State 215, Hit]
type = hitdef
trigger1 = animelem = 4
trigger1 = (var(15) < 1 || var(20))
attr = S, NA
damage = 30, 0
animtype = Medium
air.animtype = Back
fall.animtype = Back
guardflag = H
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = -1 + 0 * (var(33) := 8011)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 35) * (var(36) := 50), var(37) := -80
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1
ground.type = High
ground.slidetime = 15
ground.hittime = 15 + 3 * (var(9) != 0)
ground.velocity = ifelse(var(20), -2.66, -4.49), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
air.type = Low
air.hittime = 120
air.velocity = -4.25, -6.88
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 100) * !var(20), ifelse(moveguarded, 25, 50) * !var(20)
givepower = 40, 40
yaccel = 0.4850
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State 215, Hit 2]
type = hitdef
trigger1 = animelem = 5
trigger1 = (var(15) < 1 || var(20))
attr = S, NA
damage = 50, 0
animtype = Medium
air.animtype = Back
fall.animtype = Back
guardflag = H
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = -1 + 0 * (var(33) := 8011)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 50) * (var(36) := 71), var(37) := -39
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1
ground.type = Low
ground.slidetime = 15
ground.hittime = 15 + 3 * (var(9) != 0)
ground.velocity = ifelse(var(20), -4.30, -7.51), 0
ground.cornerpush.veloff = 0
air.type = Low
air.hittime = 120
air.velocity = -4.25, -6.88
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 100) * !var(20), ifelse(moveguarded, 25, 50) * !var(20)
givepower = 40, 40
yaccel = 0.4850
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State Idle]
type = statetypeset
trigger1 = animelemtime(6) >= 0
movetype = I

[State 215, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=========<Stand Hard Punch>==========
[Statedef 220]
type = S
movetype = A
physics = S
anim = ifelse((prevstateno = 710), ifelse(var(1) = 1, 220, 222), ifelse(abs(fvar(16)) <= (const(size.xscale) * 25), 221, ifelse(var(1) = 1, 220, 222)))
velset = 0, 0
poweradd = 0
sprpriority = 1
ctrl = 0
facep2 = 1

[State 220, Snd]
type = playsnd
trigger1 = animelem = 3 && random < 500 && var(1) != 2
value = 3, ifelse(random < 500, 2, 3)
channel = 0
[State 220, Snd]
type = playsnd
trigger1 = animelem = 3 && random < 500 && var(1) = 2
value = 13, ifelse(random < 500, 1, 2)
channel = 0
[State 220, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 3
channel = 1

[State 220, Hit]
type = hitdef
trigger1 = animelem = 4 && anim = 220
trigger1 = (var(15) < 1 || var(20))
attr = S, NA
damage = 120, 0
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 12, 12
sparkno = -1 + 0 * (var(33) := 8012)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 40) * (var(36) := 80), var(37) := -70
hitsound = -1 + 0 * (var(31) := 3)
guardsound = -1
ground.type = Low
ground.slidetime = 18
ground.hittime = 18 + 4 * (var(9) != 0)
ground.velocity = ifelse(var(20), -5.77, -10.52), 0
ground.cornerpush.veloff = 0
air.type = Low
air.hittime = 120
air.velocity = -4.25, -6.88
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 200) * !var(20), ifelse(moveguarded, 25, 100) * !var(20)
givepower = 40, 40
yaccel = 0.4850
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State 220, Hit]
type = hitdef
trigger1 = animelem = 3 && anim = 221
trigger1 = (var(15) < 1 || var(20))
attr = S, NA
damage = 100, 0
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 12, 12
sparkno = -1 + 0 * (var(33) := 8012)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 52), var(37) := -78
hitsound = -1 + 0 * (var(31) := 3)
guardsound = -1
ground.type = Low
ground.slidetime = 18
ground.hittime = 18 + 4 * (var(9) != 0)
ground.velocity = ifelse(var(20), -5.77, -10.52), 0
ground.cornerpush.veloff = 0
air.type = Low
air.hittime = 120
air.velocity = -4.25, -6.88
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 200) * !var(20), ifelse(moveguarded, 25, 100) * !var(20)
givepower = 40, 40
yaccel = 0.4850
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)
forcestand = 1

[State 220, Hit]
type = hitdef
trigger1 = animelem = 4 && anim = 221
trigger1 = !movecontact && !movereversed
trigger1 = (var(15) < 1 || var(20))
attr = S, NA
damage = 80, 0
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 12, 12
sparkno = -1 + 0 * (var(33) := 8012)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 20) * (var(36) := 40), var(37) := -119
hitsound = -1 + 0 * (var(31) := 3)
guardsound = -1
ground.type = High
ground.slidetime = 18
ground.hittime = 18 + 4 * (var(9) != 0)
ground.velocity = ifelse(var(20), -5.77, -10.52), 0
ground.cornerpush.veloff = 0
air.type = Low
air.hittime = 120
air.velocity = -4.25, -6.88
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 200) * !var(20), ifelse(moveguarded, 25, 100) * !var(20)
givepower = 40, 40
yaccel = 0.4850
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State 220, Hit]
type = hitdef
trigger1 = animelem = 4 && anim = 222
trigger1 = (var(15) < 1 || var(20))
attr = S, NA
damage = 120, 0
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 12, 12
sparkno = -1 + 0 * (var(33) := 8012)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 45) * (var(36) := 90), var(37) := -67
hitsound = -1 + 0 * (var(31) := 3)
guardsound = -1
ground.type = Low
ground.slidetime = 18
ground.hittime = 18 + 4 * (var(9) != 0)
ground.velocity = ifelse(var(20), -5.77, -10.52), 0
ground.cornerpush.veloff = 0
air.type = Low
air.hittime = 120
air.velocity = -4.25, -6.88
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 200) * !var(20), ifelse(moveguarded, 25, 100) * !var(20)
givepower = 40, 40
yaccel = 0.4850
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State 220, Hit]
type = hitdef
trigger1 = prevstateno = 710
trigger1 = animelem = 4 && anim = 220
trigger1 = (var(15) < 1 || var(20))
attr = S, NA
damage = 120, 0
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 12, 12
sparkno = -1 + 0 * (var(33) := 8012)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 40) * (var(36) := 80), var(37) := -70
hitsound = -1 + 0 * (var(31) := 3)
guardsound = -1
ground.type = Low
ground.slidetime = 18
ground.hittime = 18 + 4 * (var(9) != 0)
ground.velocity = -6.46, -5.25
air.type = Low
air.hittime = 120
air.velocity = -6.46, -5.25
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -5.77, -10.52)
guard.cornerpush.veloff = 0
fall = 1
getpower = ifelse(movehit, 25, 200) * !var(20), ifelse(moveguarded, 25, 100) * !var(20)
givepower = 40, 40
yaccel = 0.4850
fall.recover = 1
fall.recovertime = 120

[State 220, Hit]
type = hitdef
trigger1 = prevstateno = 710
trigger1 = animelem = 4 && anim = 222
trigger1 = (var(15) < 1 || var(20))
attr = S, NA
damage = 120, 0
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 12, 12
sparkno = -1 + 0 * (var(33) := 8012)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 45) * (var(36) := 90), var(37) := -67
hitsound = -1 + 0 * (var(31) := 3)
guardsound = -1
ground.type = Low
ground.slidetime = 18
ground.hittime = 18 + 4 * (var(9) != 0)
ground.velocity = -6.46, -5.25
air.type = Low
air.hittime = 120
air.velocity = -6.46, -5.25
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -5.77, -10.52)
guard.cornerpush.veloff = 0
fall = 1
getpower = ifelse(movehit, 25, 200) * !var(20), ifelse(moveguarded, 25, 100) * !var(20)
givepower = 40, 40
yaccel = 0.4850
fall.recover = 1
fall.recovertime = 120

[State 220, Anim]
type = changeanim
trigger1 = anim = 220
trigger1 = (movecontact = 1 || movereversed = 1) && hitpausetime
trigger1 = animelemtime(4) >= 0 && animelemtime(5) <= 0
trigger1 = hitpausetime <= 8
value = 220
elem = 5
ignorehitpause = 1

[State 220, Anim]
type = changeanim
trigger1 = anim = 220
trigger1 = (movecontact = 1 || movereversed = 1) && hitpausetime
trigger1 = animelemtime(5) >= 0 && animelemtime(6) <= 0
trigger1 = hitpausetime <= 4
value = 220
elem = 6
ignorehitpause = 1

[State 220, Anim]
type = changeanim
trigger1 = anim = 221
trigger1 = (movecontact = 1 || movereversed = 1) && hitpausetime
trigger1 = animelemtime(4) >= 0 && animelemtime(5) <= 0
trigger1 = hitpausetime <= 9
value = 221
elem = 5
ignorehitpause = 1

[State 220, Anim]
type = changeanim
trigger1 = anim = 221
trigger1 = (movecontact = 1 || movereversed = 1) && hitpausetime
trigger1 = animelemtime(5) >= 0 && animelemtime(6) <= 0
trigger1 = hitpausetime <= 6
value = 221
elem = 6
ignorehitpause = 1

[State Idle]
type = statetypeset
trigger1 = animelemtime(5) >= 0
movetype = I

[State 220, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=========<Kyuubi Kudaki>==========
[Statedef 225]
type = S
movetype = A
physics = S
anim = 225
velset = 0, 0
poweradd = 0
sprpriority = 1
ctrl = 0
facep2 = 1

[State 225, Snd]
type = playsnd
trigger1 = animelem = 5
value = 3, 4
channel = 0
[State 225, Snd]
type = playsnd
trigger1 = animelem = 5
value = 1, 3
channel = 1

[State 225, Width Fix]
type = width
trigger1 = animelemtime(2) >= 0 && animelemtime(11) < 0
edge = 0, 20

[State 225, Width Fix]
type = width
trigger1 = animelemtime(11) >= 0 && animelemtime(12) < 0
edge = 0, 10

[State 225, Pos]
type = posadd
trigger1 = animelem = 2
x = 20

[State 225, Pos]
type = posadd
trigger1 = animelem = 11 || animelem = 12
x = -10

[State 225, Vel]
type = velset
trigger1 = animelemtime(5) >= 0 && animelemtime(6) <= 0
x = 6

[State 225, Hit]
type = hitdef
trigger1 = animelem = 6 || animelem = 7
trigger1 = var(15) < 1 || var(20)
attr = S, NA
damage = ifelse((animelem = 6), 45, 60), 0
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 8, 8;ifelse(var(20), 5, 10), ifelse(var(20), 6, 12)
sparkno = -1 + 0 * (var(33) := 8012)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 53), var(37) := -60
hitsound = -1 + 0 * (var(31) := 3)
guardsound = -1
ground.type = Low
ground.slidetime = 18
ground.hittime = 18 + 4 * (var(9) != 0)
ground.velocity = ifelse(var(20), -10.52, -7.51), 0
ground.cornerpush.veloff = 0
air.type = Low
air.hittime = 120
air.velocity = -4.25, -6.88
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 200) * !var(20), ifelse(moveguarded, 25, 100) * !var(20)
givepower = 40, 40
yaccel = 0.4850
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State Idle]
type = statetypeset
trigger1 = animelemtime(8) >= 0
movetype = I

[State 225, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=========<Kikoku Tsuki>==========
[Statedef 227]
type = S
movetype = A
physics = S
anim = 222
velset = 0, 0
poweradd = 0
sprpriority = 1
ctrl = 0
facep2 = 1

[State 227, Snd]
type = playsnd
trigger1 = animelem = 3 && var(1) != 2
value = 3, ifelse(random < 500, 2, 3)
channel = 0
[State 227, Snd]
type = playsnd
trigger1 = animelem = 3 && var(1) = 2
value = 13, ifelse(random < 500, 1, 2)
channel = 0
[State 227, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 3
channel = 1

[State 227, Hit]
type = hitdef
trigger1 = animelem = 4
trigger1 = (var(15) < 1 || var(20))
attr = S, NA
damage = 60, 0
animtype = Hard
air.animtype = Diagup
fall.animtype = Diagup
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 12, 12
sparkno = -1 + 0 * (var(33) := 8012)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 45) * (var(36) := 90), var(37) := -67
hitsound = -1 + 0 * (var(31) := 3)
guardsound = -1
ground.type = Low
ground.slidetime = 18
ground.hittime = 18 + 4 * (var(9) != 0)
ground.velocity = -5, -5
air.type = Low
air.hittime = 120
air.velocity = ifelse(var(20), -2.25, -4.5), -4.5
air.cornerpush.veloff = 0
fall = 1
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -5.77, -10.52)
guard.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 200) * !var(20), ifelse(moveguarded, 25, 100) * !var(20)
givepower = 40, 40
yaccel = 0.4850
fall.recover = 1
fall.recovertime = 120

[State Idle]
type = statetypeset
trigger1 = animelemtime(5) >= 0
movetype = I

[State 227, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=========<Seichuu Nidan Tsuki>==========
[Statedef 226]
type = S
movetype = A
physics = S
anim = 226
velset = 0, 0
poweradd = 0
sprpriority = 1
ctrl = 0
facep2 = 1

[State 226, Snd]
type = playsnd
trigger1 = animelem = 3 && var(1) != 2
value = 3, ifelse(random < 500, 2, 3)
channel = 0
[State 226, Snd]
type = playsnd
trigger1 = animelem = 3 && var(1) = 2
value = 13, ifelse(random < 500, 1, 2)
channel = 0
[State 226, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 3
channel = 1

[State 226, Vel]
type = velset
trigger1 = animelem = 3
x = ifelse(var(20), 6, 8)
[State 226, Vel]
type = velset
trigger1 = animelem = 5
x = 0

[State 226, Hit]
type = hitdef
trigger1 = animelem = 3
trigger1 = (var(15) < 1 || var(20))
attr = S, NA
damage = 40, 0
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 8, 8
sparkno = -1 + 0 * (var(33) := 8012)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 25) * (var(36) := 35), var(37) := -50
hitsound = -1 + 0 * (var(31) := 3)
guardsound = -1
ground.type = Low
ground.slidetime = 18
ground.hittime = 18 + 4 * (var(9) != 0)
ground.velocity = -4.49, 0
ground.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
air.type = Low
air.hittime = 120
air.velocity = -4.25, -6.88
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 200) * !var(20), ifelse(moveguarded, 25, 100) * !var(20)
givepower = 40, 40
yaccel = 0.4850
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State 226, Hit]
type = hitdef
trigger1 = animelem = 4
trigger1 = (var(15) < 1 || var(20))
attr = S, NA
damage = 60, 0
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 12, 12
sparkno = -1 + 0 * (var(33) := 8012)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 40) * (var(36) := 65), var(37) := -62
hitsound = -1 + 0 * (var(31) := 3)
guardsound = -1
ground.type = Low
ground.slidetime = 18
ground.hittime = 18 + 4 * (var(9) != 0)
ground.velocity = -10.52, 0
ground.cornerpush.veloff = 0
air.type = Low
air.hittime = 120
air.velocity = -4.25, -6.88
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 200) * !var(20), ifelse(moveguarded, 25, 100) * !var(20)
givepower = 40, 40
yaccel = 0.4850
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State Idle]
type = statetypeset
trigger1 = animelemtime(5) >= 0
movetype = I

[State 226, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=========<Stand Light Kick>==========
[Statedef 230]
type = S
movetype = A
physics = S
anim = 230
velset = 0, 0
poweradd = 0
sprpriority = 1
ctrl = 0
facep2 = 1

[State 230, Snd]
type = playsnd
trigger1 = animelem = 3 && random < 200 && var(1) != 2
value = 3, ifelse(random < 500, 3, 6)
channel = 0
[State 230, Snd]
type = playsnd
trigger1 = animelem = 3 && random < 200 && var(1) = 2
value = 13, ifelse(random < 500, 1, 3)
channel = 0

[State 230, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 4
channel = 1

[State 230, Hit]
type = hitdef
trigger1 = animelem = 3
trigger1 = (var(15) < 1 || var(20))
attr = S, NA
damage = 30, 0
animtype = Light
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 8, 8
sparkno = -1 + 0 * (var(33) := 8010)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 40) * (var(36) := 76), var(37) := -34
hitsound = -1 + 0 * (var(31) := 4)
guardsound = -1
ground.type = Low
ground.slidetime = 12
ground.hittime = 12 + 2 * (var(9) != 0)
ground.velocity = ifelse(var(20), -2.66, -4.49), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
air.type = Low
air.hittime = 120
air.velocity = -4.25, -6.88
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 50) * !var(20), 25 * !var(20)
givepower = 40, 40
yaccel = 0.4850
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State 230, Anim]
type = changeanim
trigger1 = anim = 230
trigger1 = (movecontact = 1 || movereversed = 1) && hitpausetime
trigger1 = animelemtime(3) >= 0 && animelemtime(4) <= 0
trigger1 = hitpausetime <= 6
value = 230
elem = 4
ignorehitpause = 1

[State Idle]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I

[State 230, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=========<Stand Medium Kick>==========
[Statedef 240]
type = S
movetype = A
physics = S
anim = ifelse((prevstateno = 710 || abs(fvar(16)) <= (const(size.xscale) * 25)), 241, 240)
velset = 0, 0
poweradd = 0
sprpriority = 1
ctrl = 0
facep2 = 1

[State 240, Snd]
type = playsnd
trigger1 = animelem = 3 && random < 350 && var(1) != 2
value = 3, ifelse(random < 500, 2, 3)
channel = 0
[State 240, Snd]
type = playsnd
trigger1 = animelem = 3 && random < 350 && var(1) = 2
value = 13, ifelse(random < 500, 1, 2)
channel = 0
[State 240, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 4
channel = 1

[State 240, Hit]
type = hitdef
trigger1 = animelem = 3 && anim = 240
trigger1 = (var(15) < 1 || var(20))
attr = S, NA
damage = 80, 0
animtype = Medium
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = -1 + 0 * (var(33) := 8011)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 0) * (var(36) := 44), var(37) := -93
hitsound = -1 + 0 * (var(31) := 5)
guardsound = -1
ground.type = High
ground.slidetime = 15
ground.hittime = 15 + 3 * (var(9) != 0)
ground.velocity = ifelse(var(20), -4.30, -7.51), 0
ground.cornerpush.veloff = 0
air.type = Low
air.hittime = 120
air.velocity = -4.25, -6.88
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 100) * !var(20), ifelse(moveguarded, 25, 50) * !var(20)
givepower = 40, 40
yaccel = 0.4850
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State 240, Hit]
type = hitdef
trigger1 = animelem = 3 && anim = 241
trigger1 = (var(15) < 1 || var(20))
attr = S, NA
damage = 80, 0
animtype = Medium
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = -1 + 0 * (var(33) := 8011)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 40) * (var(36) := 68), var(37) := -78
hitsound = -1 + 0 * (var(31) := 5)
guardsound = -1
ground.type = Low
ground.slidetime = 15
ground.hittime = 15 + 3 * (var(9) != 0)
ground.velocity = ifelse(var(20), -4.30, -7.51), 0
ground.cornerpush.veloff = 0
air.type = Low
air.hittime = 120
air.velocity = -4.25, -6.88
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 100) * !var(20), ifelse(moveguarded, 25, 50) * !var(20)
givepower = 40, 40
yaccel = 0.4850
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)
forcestand = 1

[State 240, Anim]
type = changeanim
trigger1 = anim = 240
trigger1 = (movecontact = 1 || movereversed = 1) && hitpausetime
trigger1 = animelemtime(3) >= 0 && animelemtime(4) <= 0
trigger1 = hitpausetime <= 6
value = 240
elem = 4
ignorehitpause = 1

[State 240, Anim]
type = changeanim
trigger1 = anim = 241
trigger1 = (movecontact = 1 || movereversed = 1) && hitpausetime
trigger1 = animelemtime(3) >= 0 && animelemtime(4) <= 0
trigger1 = hitpausetime <= 6
value = 241
elem = 4
ignorehitpause = 1

[State Idle]
type = statetypeset
trigger1 = animelemtime(5) >= 0
movetype = I

[State 240, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=========<SENPUU KYAKU>==========
[Statedef 245]
type = S
movetype = A
physics = S
anim = 245
velset = 0, 0
poweradd = 0
sprpriority = 1
ctrl = 0
facep2 = 1

[State 245, Snd]
type = playsnd
trigger1 = animelem = 5
value = ifelse(var(1) = 2, 13, 3), 2
channel = 0

[State 245, Snd]
type = playsnd
trigger1 = animelem = 2
value = 0, 40

[State 245, Dust]
type = helper
trigger1 = animelem = 2
helpertype = normal
stateno = 7100
ID = 7100
name = "Dust"
postype = p1
ownpal = 1

[State 245, Snd]
type = playsnd
trigger1 = animelem = 5
value = 1, 6
channel = 1

[State 245, Accel]
type = veladd
trigger1 = animelemtime(2) >= 1
y = 0.5

[State 245, Vel]
type = velset
trigger1 = animelemtime(2) = 1
x = ifelse(prevstateno = 100, 5, 3)
y = -4.5

[State 245, Type]
type = statetypeset
trigger1 = animelem = 2
statetype = A
physics = N

[State 245, Hit]
type = hitdef
trigger1 = animelem = 8
trigger1 = (var(15) < 1 || var(20))
attr = A, NA
damage = 70, 0
animtype = Medium
air.animtype = Back
fall.animtype = Back
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = -1 + 0 * (var(33) := 8011)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 20) * (var(36) := 62), var(37) := -78
hitsound = -1 + 0 * (var(31) := 6)
guardsound = -1
ground.type = High
ground.slidetime = 15
ground.hittime = 15 + 3 * (var(9) != 0)
ground.velocity = ifelse(var(20), -4.30, -7.51), 0
ground.cornerpush.veloff = 0
air.type = Low
air.hittime = 120
air.velocity = -4.25, -6.88
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 100) * !var(20), ifelse(moveguarded, 25, 50) * !var(20)
givepower = 40, 40
yaccel = 0.4850
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State Idle]
type = statetypeset
trigger1 = animelemtime(9) >= 0
movetype = I

[State 245, End]
type = changestate
trigger1 = statetype = A
trigger1 = vel y > 0 && (pos y > -vel y)
value = 246



;---Land---
[Statedef 246]
type = S
physics = S
movetype = I
anim = 48
ctrl = 0
velset = 0, 0
sprpriority = 1
movehitpersist = 1
hitcountpersist = 1

[State 246, Pos]
type = posset
trigger1 = 1
y = 0

[State 246, Snd]
type = playsnd
trigger1 = !time
value = 0, 52

[State 246, Dust]
type = explod
trigger1 = !time
anim = 7102
ID = 7100
sprpriority = -5
postype = p1
scale = 0.5, 0.5
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 246, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=========<Stand Hard Kick>==========
[Statedef 250]
type = S
movetype = A
physics = S
anim = ifelse(abs(fvar(16)) <= (const(size.xscale) * 25), 251, 250)
velset = 0, 0
poweradd = 0
sprpriority = 1
ctrl = 0
facep2 = 1

[State 250, Snd]
type = playsnd
trigger1 = animelem = 4 && random < 500 && var(1) != 2
value = 3, ifelse(random < 500, 2, 3)
channel = 0
[State 250, Snd]
type = playsnd
trigger1 = animelem = 4 && random < 500 && var(1) = 2
value = 13, ifelse(random < 500, 1, 2)
channel = 0
[State 250, Snd]
type = playsnd
trigger1 = anim = 250 && animelem = 4
trigger2 = anim = 251 && (animelem = 2 || animelem = 5)
value = 1, 6
channel = 1

[State 250, Hit]
type = hitdef
trigger1 = animelem = 4 && anim = 250
trigger1 = (var(15) < 1 || var(20))
attr = S, NA
damage = 110, 0
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 12, 12
sparkno = -1 + 0 * (var(33) := 8012)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 82), var(37) := -92
hitsound = -1 + 0 * (var(31) := 6)
guardsound = -1
ground.type = High
ground.slidetime = 18
ground.hittime = 18 + 4 * (var(9) != 0)
ground.velocity = ifelse(var(20), -5.77, -10.52), 0
ground.cornerpush.veloff = 0
air.type = Low
air.hittime = 120
air.velocity = -4.25, -6.88
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 200) * !var(20), ifelse(moveguarded, 25, 100) * !var(20)
givepower = 40, 40
yaccel = 0.4850
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State 250, Hit]
type = hitdef
trigger1 = animelem = 3 && anim = 251
trigger1 = (var(15) < 1 || var(20))
attr = S, NA
damage = 40, 0
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 12, 12;8, 8
sparkno = -1 + 0 * (var(33) := 8012)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 20) * (var(36) := 40), var(37) := -103
hitsound = -1 + 0 * (var(31) := 6)
guardsound = -1
ground.type = High
ground.slidetime = 18
ground.hittime = 18 + 4 * (var(9) != 0)
ground.velocity = ifelse(var(20), -4.30, -7.51), 0
ground.cornerpush.veloff = 0
air.type = Low
air.hittime = 120
air.velocity = -3, -3
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 200) * !var(20), ifelse(moveguarded, 25, 100) * !var(20)
givepower = 40, 40
yaccel = 0.4850
air.fall = 1
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State 250, Hit]
type = hitdef
trigger1 = animelem = 5 && anim = 251
trigger1 = (var(15) < (1 + hitcount) || var(20))
attr = S, NA
damage = 70, 0
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 12, 12
sparkno = -1 + 0 * (var(33) := 8012)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 45) * (var(36) := 90), var(37) := -72
hitsound = -1 + 0 * (var(31) := 6)
guardsound = -1
ground.type = Low
ground.slidetime = 18
ground.hittime = 18 + 4 * (var(9) != 0)
ground.velocity = ifelse(var(20), -5.77, -10.52), 0
ground.cornerpush.veloff = 0
air.type = Low
air.hittime = 120
air.velocity = -8, 8
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 200) * !var(20), ifelse(moveguarded, 25, 100) * !var(20)
givepower = 40, 40
yaccel = 0.4850
air.fall = 1
fall.recover = 0
fall.xvelocity = -2.5
fall.yvelocity = -3.5
p2facing = 1

[State 250, Anim]
type = changeanim
trigger1 = anim = 250
trigger1 = (movecontact = 1 || movereversed = 1) && hitpausetime
trigger1 = animelemtime(4) >= 0 && animelemtime(5) <= 0
trigger1 = hitpausetime <= 10
value = 250
elem = 5
ignorehitpause = 1

[State 250, Anim]
type = changeanim
trigger1 = anim = 251
trigger1 = (movecontact = 1 || movereversed = 1) && hitpausetime
trigger1 = animelemtime(3) >= 0 && animelemtime(4) <= 0
trigger1 = hitpausetime <= 5
value = 251
elem = 4
ignorehitpause = 1

[State Idle]
type = statetypeset
trigger1 = animelemtime(6) >= 0
movetype = I

[State 250, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=======================<Ryu Target Combo>========================
[Statedef 255]
type = S
movetype = A
physics = S
anim = 255
velset = 0, 0
poweradd = 0
sprpriority = 2
ctrl = 0
facep2 = 0

[State Damage Scaling - Add]
type = varadd
trigger1 = !time
trigger1 = var(43)
trigger1 = 1 || var(43) := 0
var(42) = 1

[State 255, Pos]
type = posadd
trigger1 = animelem = 1
trigger1 = prevstateno = 210 || prevstateno = 211
x = 24 * const(size.xscale)

[State 255, Pos]
type = posadd
trigger1 = animelem = 2
x = 12 * const(size.xscale)

[State 255, Pos]
type = posadd
trigger1 = animelem = 3
x = 12 * const(size.xscale)

[State 255, Pos]
type = posadd
trigger1 = animelem = 10
x = 9 * const(size.xscale)

[State 255, Pos]
type = posadd
trigger1 = !animtime
x = 12 * const(size.xscale)

[State 255, Snd]
type = playsnd
trigger1 = animelem = 4
value = 3, ifelse(random < 500, 2, 3)
channel = 0

[State 255, Snd]
type = playsnd
trigger1 = animelem = 5
value = 1, 6
channel = 1
freqmul = 0.95 + (random / 10000.0)

[State 255, Hit]
type = hitdef
trigger1 = animelem = 6
trigger1 = var(15) < 1 || var(20)
forcenofall = !var(20)
attr = S, NA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 60, 0
getpower = ifelse(movehit, 25, 200) * !var(20), ifelse(moveguarded, 25, 100) * !var(20)
givepower = 40, 40
pausetime = 12, 12
guard.pausetime = 12, 12
animtype = Back
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = -4.0, -7.5
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -5.77, -10.52)
guard.cornerpush.veloff = 0
air.velocity = -4.0, -7.5
air.cornerpush.veloff = 0
yaccel = 0.4850
fall = 1
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 6)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8012)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 10) * (var(36) := 55), var(37) := -92
forcestand = 1

[State 255, Anim]
type = changeanim
trigger1 = anim = 255
trigger1 = (movecontact = 1 || movereversed = 1) && hitpausetime
trigger1 = animelemtime(6) >= 0 && animelemtime(7) <= 0
trigger1 = hitpausetime <= 10
value = 255
elem = 7
ignorehitpause = 1

[State Idle]
type = statetypeset
trigger1 = animelemtime(7) >= 0
movetype = I

[State 255, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1



;=========<Crouch Light Punch>==========
[Statedef 400]
type = C
movetype = A
physics = C
anim = 400
velset = 0, 0
poweradd = 0
sprpriority = 1
ctrl = 0
facep2 = 1

[State 400, Snd]
type = playsnd
trigger1 = animelem = 2 && random < 200 && var(1) != 2
value = 3, ifelse(random < 500, 3, 6)
channel = 0
[State 400, Snd]
type = playsnd
trigger1 = animelem = 2 && random < 200 && var(1) = 2
value = 13, ifelse(random < 500, 1, 3)
channel = 0

[State 400, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 1
channel = 1

[State 400, Hit]
type = hitdef
trigger1 = animelem = 2
trigger1 = (var(15) < 1 || var(20))
attr = C, NA
damage = 20, 0
animtype = Light
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 8, 8
sparkno = -1 + 0 * (var(33) := 8010)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 25) * (var(36) := 63), var(37) := -51
hitsound = -1 + 0 * (var(31) := 1)
guardsound = -1
ground.type = Low
ground.slidetime = 12
ground.hittime = 12 + 2 * (var(9) != 0)
ground.velocity = ifelse(var(20), -2.66, -4.49), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
air.type = Low
air.hittime = 120
air.velocity = -4.25, -6.88
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 50) * !var(20), 25 * !var(20)
givepower = 40, 40
yaccel = 0.4850
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State 400, Anim]
type = changeanim
trigger1 = anim = 400
trigger1 = (movecontact = 1 || movereversed = 1) && hitpausetime
trigger1 = animelemtime(2) >= 0 && animelemtime(3) <= 0
trigger1 = hitpausetime <= 5
value = 400
elem = 3
ignorehitpause = 1

[State Idle]
type = statetypeset
trigger1 = animelemtime(3) >= 0
movetype = I

[State 400, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1


;=========<Crouch Medium Punch>==========
[Statedef 410]
type = C
movetype = A
physics = C
anim = 410
velset = 0, 0
poweradd = 0
sprpriority = 1
ctrl = 0
facep2 = 1

[State 410, Snd]
type = playsnd
trigger1 = animelem = 3 && random < 350 && var(1) != 2
value = 3, ifelse(random < 500, 2, 3)
channel = 0
[State 410, Snd]
type = playsnd
trigger1 = animelem = 3 && random < 350 && var(1) = 2
value = 13, ifelse(random < 500, 1, 2)
channel = 0
[State 410, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 2
channel = 1

[State 410, Hit]
type = hitdef
trigger1 = animelem = 3
trigger1 = (var(15) < 1 || var(20))
attr = C, NA
damage = 60, 0
animtype = Medium
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = -1 + 0 * (var(33) := 8011)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 64), var(37) := -46
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1
ground.type = Low
ground.slidetime = 15
ground.hittime = 15 + 3 * (var(9) != 0)
ground.velocity = ifelse(var(20), -4.30, -7.51), 0
ground.cornerpush.veloff = 0
air.type = Low
air.hittime = 120
air.velocity = -4.25, -6.88
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 100) * !var(20), ifelse(moveguarded, 25, 50) * !var(20)
givepower = 40, 40
yaccel = 0.4850
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State 410, Anim]
type = changeanim
trigger1 = anim = 410
trigger1 = (movecontact = 1 || movereversed = 1) && hitpausetime
trigger1 = animelemtime(3) >= 0 && animelemtime(4) <= 0
trigger1 = hitpausetime <= 7
value = 410
elem = 4
ignorehitpause = 1

[State Idle]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I

[State 410, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1


;=========<Crouch Hard Punch>==========
[Statedef 420]
type = C
movetype = A
physics = C
anim = 420
velset = 0, 0
poweradd = 0
sprpriority = 1
ctrl = 0
facep2 = 1

[State 420, Snd]
type = playsnd
trigger1 = animelem = 4 && random < 500 && var(1) != 2
value = 3, ifelse(random < 500, 2, 3)
channel = 0
[State 420, Snd]
type = playsnd
trigger1 = animelem = 4 && random < 500 && var(1) = 2
value = 13, ifelse(random < 500, 1, 2)
channel = 0
[State 420, Snd]
type = playsnd
trigger1 = animelem = 4
value = 1, 3
channel = 1

[State 420, Hit]
type = hitdef
trigger1 = animelem = 4
trigger1 = (var(15) < 1 || var(20))
attr = C, NA
damage = 90, 0
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 12, 12
sparkno = -1 + 0 * (var(33) := 8012)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 54), var(37) := -73
hitsound = -1 + 0 * (var(31) := 3)
guardsound = -1
ground.type = Low
ground.slidetime = 18
ground.hittime = 18 + 4 * (var(9) != 0)
ground.velocity = ifelse(var(20), -5.77, -10.52), 0
ground.cornerpush.veloff = 0
air.type = Low
air.hittime = 120
air.velocity = -4.25, -6.88
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 200) * !var(20), ifelse(moveguarded, 25, 100) * !var(20)
givepower = 40, 40
yaccel = 0.4850
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)
forcestand = 1

[State 420, Hit]
type = hitdef
trigger1 = animelem = 5
trigger1 = !movecontact && !movereversed
trigger1 = (var(15) < 1 || var(20))
attr = S, NA
damage = 90, 0
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 12, 12
sparkno = -1 + 0 * (var(33) := 8012)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 10) * (var(36) := 25), var(37) := -120
hitsound = -1 + 0 * (var(31) := 3)
guardsound = -1
ground.type = High
ground.slidetime = 18
ground.hittime = 18 + 4 * (var(9) != 0)
ground.velocity = ifelse(var(20), -5.77, -10.52), 0
ground.cornerpush.veloff = 0
air.type = Low
air.hittime = 120
air.velocity = -4.25, -6.88
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 200) * !var(20), ifelse(moveguarded, 25, 100) * !var(20)
givepower = 40, 40
yaccel = 0.4850
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State 420, Anim]
type = changeanim
trigger1 = anim = 420
trigger1 = (movecontact = 1 || movereversed = 1) && hitpausetime
trigger1 = animelemtime(5) >= 0 && animelemtime(6) <= 0
trigger1 = hitpausetime <= 8
value = 420
elem = 6
ignorehitpause = 1

[State 420, Anim]
type = changeanim
trigger1 = anim = 420
trigger1 = (movecontact = 1 || movereversed = 1) && hitpausetime
trigger1 = animelemtime(6) >= 0 && animelemtime(7) <= 0
trigger1 = hitpausetime <= 4
value = 420
elem = 7
ignorehitpause = 1

[State Idle]
type = statetypeset
trigger1 = animelemtime(6) >= 0
movetype = I

[State 420, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1


;=========<Crouch Light Kick>==========
[Statedef 430]
type = C
movetype = A
physics = C
anim = 430
velset = 0, 0
poweradd = 0
sprpriority = 1
ctrl = 0
facep2 = 1

[State 430, Snd]
type = playsnd
trigger1 = animelem = 2 && random < 200 && var(1) != 2
value = 3, ifelse(random < 500, 3, 6)
channel = 0
[State 430, Snd]
type = playsnd
trigger1 = animelem = 2 && random < 200 && var(1) = 2
value = 13, ifelse(random < 500, 1, 3)
channel = 0

[State 430, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 4
channel = 1

[State 430, Hit]
type = hitdef
trigger1 = animelem = 2
trigger1 = (var(15) < 1 || var(20))
attr = C, NA
damage = 20, 0
animtype = Light
air.animtype = Back
fall.animtype = Back
guardflag = L
hitflag = MAF
priority = 4, Hit
pausetime = 8, 8
sparkno = -1 + 0 * (var(33) := 8010)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 74), var(37) := -4
hitsound = -1 + 0 * (var(31) := 4)
guardsound = -1
ground.type = Low
ground.slidetime = 12
ground.hittime = 12 + 2 * (var(9) != 0)
ground.velocity = ifelse(var(20), -2.66, -4.49), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
air.type = Low
air.hittime = 120
air.velocity = -4.25, -6.88
air.cornerpush.veloff = 0
down.velocity = -2, -2
getpower = ifelse(movehit, 25, 50) * !var(20), 25 * !var(20)
givepower = 40, 40
yaccel = 0.4850
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State 430, Anim]
type = changeanim
trigger1 = anim = 430
trigger1 = (movecontact = 1 || movereversed = 1) && hitpausetime
trigger1 = animelemtime(2) >= 0 && animelemtime(3) <= 0
trigger1 = hitpausetime <= 5
value = 430
elem = 3
ignorehitpause = 1

[State Idle]
type = statetypeset
trigger1 = animelemtime(3) >= 0
movetype = I

[State 430, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1


;=========<Crouch Medium Kick>==========
[Statedef 440]
type = C
movetype = A
physics = C
anim = 440
velset = 0, 0
poweradd = 0
sprpriority = 1
ctrl = 0
facep2 = 1

[State 440, Snd]
type = playsnd
trigger1 = animelem = 3 && random < 350 && var(1) != 2
value = 3, ifelse(random < 500, 2, 3)
channel = 0
[State 440, Snd]
type = playsnd
trigger1 = animelem = 3 && random < 350 && var(1) = 2
value = 13, ifelse(random < 500, 1, 2)
channel = 0
[State 440, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 5
channel = 1

[State 440, Hit]
type = hitdef
trigger1 = animelem = 3
trigger1 = (var(15) < 1 || var(20))
attr = C, NA
damage = 60, 0
animtype = Medium
air.animtype = Back
fall.animtype = Back
guardflag = L
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = -1 + 0 * (var(33) := 8011)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 81), var(37) := -5
hitsound = -1 + 0 * (var(31) := 5)
guardsound = -1
ground.type = Low
ground.slidetime = 15
ground.hittime = 15 + 3 * (var(9) != 0)
ground.velocity = ifelse(var(20), -4.30, -7.51), 0
ground.cornerpush.veloff = 0
air.type = Low
air.hittime = 120
air.velocity = -4.25, -6.88
air.cornerpush.veloff = 0
down.velocity = -3, -3
getpower = ifelse(movehit, 25, 100) * !var(20), ifelse(moveguarded, 25, 50) * !var(20)
givepower = 40, 40
yaccel = 0.4850
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State 440, Anim]
type = changeanim
trigger1 = anim = 440
trigger1 = (movecontact = 1 || movereversed = 1) && hitpausetime
trigger1 = animelemtime(3) >= 0 && animelemtime(4) <= 0
trigger1 = hitpausetime <= 8
value = 440
elem = 4
ignorehitpause = 1

[State 440, Anim]
type = changeanim
trigger1 = anim = 440
trigger1 = (movecontact = 1 || movereversed = 1) && hitpausetime
trigger1 = animelemtime(4) >= 0 && animelemtime(5) <= 0
trigger1 = hitpausetime <= 5
value = 440
elem = 5
ignorehitpause = 1

[State Idle]
type = statetypeset
trigger1 = animelemtime(5) >= 0
movetype = I

[State 440, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1


;=========<Crouch Hard Kick>==========
[Statedef 450]
type = C
movetype = A
physics = C
anim = 450
velset = 0, 0
poweradd = 0
sprpriority = 1
ctrl = 0
facep2 = 1

[State 450, Snd]
type = playsnd
trigger1 = animelem = 3 && random < 500 && var(1) != 2
value = 3, ifelse(random < 500, 2, 3)
channel = 0
[State 450, Snd]
type = playsnd
trigger1 = animelem = 3 && random < 500 && var(1) = 2
value = 13, ifelse(random < 500, 1, 2)
channel = 0
[State 450, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 6
channel = 1

[State 450, Hit]
type = hitdef
trigger1 = animelem = 3
trigger1 = (var(15) < 1 || var(20))
attr = C, NA
damage = 90, 0
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = L
hitflag = MAF
priority = 4, Hit
pausetime = 12, 12
sparkno = -1 + 0 * (var(33) := 8012)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 79), var(37) := -6
hitsound = -1 + 0 * (var(31) := 6)
guardsound = -1
ground.type = Trip
ground.slidetime = 18
ground.hittime = 18 + 4 * (var(9) != 0)
ground.velocity = -1, -8.24
air.type = Low
air.hittime = 120
air.velocity = -1, -8.24
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -5.77, -10.52)
guard.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 200) * !var(20), ifelse(moveguarded, 25, 100) * !var(20)
givepower = 40, 40
yaccel = 0.677
fall = 1
fall.recover = !var(9)
fall.recovertime = 120

[State 450, Anim]
type = changeanim
trigger1 = anim = 450
trigger1 = (movecontact = 1 || movereversed = 1) && hitpausetime
trigger1 = animelemtime(3) >= 0 && animelemtime(4) <= 0
trigger1 = hitpausetime <= 9
value = 450
elem = 4
ignorehitpause = 1

[State Idle]
type = statetypeset
trigger1 = animelemtime(5) >= 0
movetype = I

[State 450, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1

;=========<Air Light Punch>==========
[Statedef 600]
type = A
movetype = A
physics = N
anim = 600
poweradd = 0
sprpriority = 1
ctrl = 0

[State 600, Snd]
type = playsnd
trigger1 = animelem = 2 && random < 200 && var(1) != 2
value = 3, ifelse(random < 500, 3, 6)
channel = 0
[State 600, Snd]
type = playsnd
trigger1 = animelem = 2 && random < 200 && var(1) = 2
value = 13, ifelse(random < 500, 1, 3)
channel = 0

[State 600, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 1
channel = 1

[State 600, Hit]
type = hitdef
trigger1 = animelem = 2
trigger1 = (var(15) < 1 || var(20))
attr = A, NA
damage = 50, 0
animtype = Light
air.animtype = Back
fall.animtype = Back
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 8, 8
sparkno = -1 + 0 * (var(33) := 8010)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 20) * (var(36) := 43), var(37) := -50
hitsound = -1 + 0 * (var(31) := 1)
guardsound = -1
ground.type = High
ground.hittime = 12
ground.slidetime = 12
ground.velocity = ifelse(var(20), -2.66, -4.49), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
guard.hittime = 12
guard.slidetime = 12
guard.velocity = ifelse(var(20), -2.66, -4.49)
guard.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
air.type = Low
air.hittime = 120
air.velocity = -4.25, -6.88
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 50) * !var(20), 25 * !var(20)
givepower = 40, 40
yaccel = 0.4850
airguard.ctrltime = 16
airguard.velocity = -6.00, -1.00
airguard.cornerpush.veloff = 0
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State 600, Anim]
type = changeanim
trigger1 = anim = 600
trigger1 = (movecontact = 1 || movereversed = 1) && hitpausetime
trigger1 = animelemtime(2) >= 0 && animelemtime(3) <= 0
trigger1 = hitpausetime <= 4
value = 600
elem = 3
ignorehitpause = 1

[State 600, Type]
type = statetypeset
trigger1 = animelemtime(6) >= 0
movetype = I

[State Gravity]
type = gravity
trigger1 = 1

[State Land]
type = changestate
trigger1 = vel y > 0 && (pos y > -vel y)
value = 52


;=========<Air Medium Punch>==========
[Statedef 610]
type = A
movetype = A
physics = N
anim = ifelse((vel x || (var(3) = [1, 2])), 610, 611)
poweradd = 0
sprpriority = 1
ctrl = 0

[State 610, Snd]
type = playsnd
trigger1 = animelem = 3 && random < 350 && var(1) != 2
value = 3, ifelse(random < 500, 2, 3)
channel = 0
[State 610, Snd]
type = playsnd
trigger1 = animelem = 3 && random < 350 && var(1) = 2
value = 13, ifelse(random < 500, 1, 2)
channel = 0
[State 610, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 2
channel = 1

[State 610, Hit]
type = hitdef
trigger1 = anim = 610 && animelem = 2
trigger1 = (var(15) < 1 || var(20))
attr = A, NA
damage = 50, 0
animtype = Medium
air.animtype = Back
fall.animtype = Back
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = -1 + 0 * (var(33) := 8011)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 10) * (var(36) := 38), var(37) := -88
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1
ground.type = High
ground.hittime = 12
ground.slidetime = 12
ground.velocity = ifelse(var(20), -2.66, -4.49), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
guard.hittime = 15
guard.slidetime = 15
guard.velocity = ifelse(var(20), -4.30, -7.51)
guard.cornerpush.veloff = 0
air.type = Low
air.hittime = 120
air.velocity = ifelse(var(20), -1.33, -2.67), -9
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 100) * !var(20), ifelse(moveguarded, 25, 50) * !var(20)
givepower = 40, 40
air.fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.4850
airguard.ctrltime = 16
airguard.velocity = -6.00, -1.00
airguard.cornerpush.veloff = 0

[State 610, Hit]
type = hitdef
trigger1 = anim = 610 && animelem = 3
trigger1 = (var(15) < (1 + hitcount) || var(20))
attr = A, NA
damage = 30, 0
animtype = Medium
air.animtype = Back
fall.animtype = Back
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = -1 + 0 * (var(33) := 8011)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 5) * (var(36) := 25), var(37) := -120
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1
ground.type = High
ground.hittime = 12
ground.slidetime = 12
ground.velocity = ifelse(var(20), -2.66, -4.49), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
guard.hittime = 15
guard.slidetime = 15
guard.velocity = ifelse(var(20), -4.30, -7.51)
guard.cornerpush.veloff = 0
air.type = High
air.hittime = 120
air.velocity = ifelse(var(20), -1.33, -2.67), -9
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 100) * !var(20), ifelse(moveguarded, 25, 50) * !var(20)
givepower = 40, 40
air.fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.4850
airguard.ctrltime = 16
airguard.velocity = -6.00, -1.00
airguard.cornerpush.veloff = 0

[State 610, Hit]
type = hitdef
trigger1 = anim = 611 && animelem = 3
trigger1 = (var(15) < 1 || var(20))
attr = A, NA
damage = 80, 0
animtype = Medium
air.animtype = Back
fall.animtype = Back
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = -1 + 0 * (var(33) := 8011)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 54), var(37) := -52
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1
ground.type = High
ground.hittime = 12
ground.slidetime = 12
ground.velocity = ifelse(var(20), -2.66, -4.49), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
guard.hittime = 15
guard.slidetime = 15
guard.velocity = ifelse(var(20), -4.30, -7.51)
guard.cornerpush.veloff = 0
air.type = Low
air.hittime = 120
air.velocity = -4.25, -6.88
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 100) * !var(20), ifelse(moveguarded, 25, 50) * !var(20)
givepower = 40, 40
yaccel = 0.4850
airguard.ctrltime = 16
airguard.velocity = -6.00, -1.00
airguard.cornerpush.veloff = 0
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State 610, Anim]
type = changeanim
trigger1 = anim = 610
trigger1 = (movecontact = 1 || movereversed = 1) && hitpausetime
trigger1 = animelemtime(3) >= 0 && animelemtime(4) <= 0
trigger1 = hitpausetime <= 5
value = 610
elem = 4
ignorehitpause = 1

[State 610, Anim]
type = changeanim
trigger1 = anim = 611
trigger1 = (movecontact = 1 || movereversed = 1) && hitpausetime
trigger1 = animelemtime(3) >= 0 && animelemtime(4) <= 0
trigger1 = hitpausetime <= 6
value = 611
elem = 4
ignorehitpause = 1

[State 610, Type]
type = statetypeset
trigger1 = animelemtime(5) >= 0
movetype = I

[State Gravity]
type = gravity
trigger1 = 1

[State Land]
type = changestate
trigger1 = vel y > 0 && (pos y > -vel y)
value = 52


;=========<Air Hard Punch>==========
[Statedef 620]
type = A
movetype = A
physics = N
anim = 620
poweradd = 0
sprpriority = 1
ctrl = 0

[State 620, Snd]
type = playsnd
trigger1 = animelem = 3 && random < 500 && var(1) != 2
value = 3, ifelse(random < 500, 2, 3)
channel = 0
[State 620, Snd]
type = playsnd
trigger1 = animelem = 3 && random < 500 && var(1) = 2
value = 13, ifelse(random < 500, 1, 2)
channel = 0
[State 620, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 3
channel = 1

[State 620, Hit]
type = hitdef
trigger1 = animelem = 3
trigger1 = (var(15) < 1 || var(20))
attr = A, NA
damage = 100, 0
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 12, 12
sparkno = -1 + 0 * (var(33) := 8012)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 54), var(37) := -52
hitsound = -1 + 0 * (var(31) := 3)
guardsound = -1
ground.type = High
ground.hittime = 12
ground.slidetime = 12
ground.velocity = ifelse(var(20), -2.66, -4.49), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
guard.hittime = 18
guard.slidetime = 18
guard.velocity = ifelse(var(20), -5.77, -10.52)
guard.cornerpush.veloff = 0
air.type = Low
air.hittime = 120
air.velocity = -4.25, -6.88
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 200) * !var(20), ifelse(moveguarded, 25, 100) * !var(20)
givepower = 40, 40
yaccel = 0.4850
airguard.ctrltime = 16
airguard.velocity = -6.00, -1.00
airguard.cornerpush.veloff = 0
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State 620, Anim]
type = changeanim
trigger1 = anim = 620
trigger1 = (movecontact = 1 || movereversed = 1) && hitpausetime
trigger1 = animelemtime(3) >= 0 && animelemtime(4) <= 0
trigger1 = hitpausetime <= 8
value = 620
elem = 4
ignorehitpause = 1

[State 620, Type]
type = statetypeset
trigger1 = animelemtime(5) >= 0
movetype = I

[State Gravity]
type = gravity
trigger1 = 1

[State Land]
type = changestate
trigger1 = vel y > 0 && (pos y > -vel y)
value = 52


;=========<Air Light Kick>==========
[Statedef 630]
type = A
movetype = A
physics = N
anim = ifelse((vel x || (var(3) = [1, 2])), 630, 631)
poweradd = 0
sprpriority = 1
ctrl = 0

[State 630, Snd]
type = playsnd
trigger1 = animelem = 2 && random < 200 && var(1) != 2
value = 3, ifelse(random < 500, 3, 6)
channel = 0
[State 630, Snd]
type = playsnd
trigger1 = animelem = 2 && random < 200 && var(1) = 2
value = 13, ifelse(random < 500, 1, 3)
channel = 0

[State 630, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 4
channel = 1

[State 630, Hit]
type = hitdef
trigger1 = animelem = 2 && anim = 630
trigger1 = (var(15) < 1 || var(20))
attr = A, NA
damage = 40, 0
animtype = Light
air.animtype = Back
fall.animtype = Back
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 8, 8
sparkno = -1 + 0 * (var(33) := 8010)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 10) * (var(36) := 32), var(37) := -42
hitsound = -1 + 0 * (var(31) := 4)
guardsound = -1
ground.type = High
ground.hittime = 12
ground.slidetime = 12
ground.velocity = ifelse(var(20), -2.66, -4.49), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
guard.hittime = 12
guard.slidetime = 12
guard.velocity = ifelse(var(20), -2.66, -4.49)
guard.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
air.type = Low
air.hittime = 120
air.velocity = -4.25, -6.88
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 50) * !var(20), 25 * !var(20)
givepower = 40, 40
yaccel = 0.4850
airguard.ctrltime = 16
airguard.velocity = -6.00, -1.00
airguard.cornerpush.veloff = 0
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State 630, Hit]
type = hitdef
trigger1 = animelem = 2 && anim = 631
trigger1 = (var(15) < 1 || var(20))
attr = A, NA
damage = 40, 0
animtype = Light
air.animtype = Back
fall.animtype = Back
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 8, 8
sparkno = -1 + 0 * (var(33) := 8010)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 10) * (var(36) := 33), var(37) := -108
hitsound = -1 + 0 * (var(31) := 4)
guardsound = -1
ground.type = High
ground.hittime = 12
ground.slidetime = 12
ground.velocity = ifelse(var(20), -2.66, -4.49), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
guard.hittime = 12
guard.slidetime = 12
guard.velocity = ifelse(var(20), -2.66, -4.49)
guard.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
air.type = High
air.hittime = 120
air.velocity = -4.25, -6.88
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 50) * !var(20), 25 * !var(20)
givepower = 40, 40
yaccel = 0.4850
airguard.ctrltime = 16
airguard.velocity = -6.00, -1.00
airguard.cornerpush.veloff = 0
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State 275 Anim]
type = changeanim
trigger1 = anim = 630
trigger1 = (movecontact = 1 || movereversed = 1) && hitpausetime
trigger1 = animelemtime(2) >= 0 && animelemtime(3) <= 0
trigger1 = hitpausetime <= 4
value = 630
elem = 3
ignorehitpause = 1

[State 630, Anim]
type = changeanim
trigger1 = anim = 631
trigger1 = (movecontact = 1 || movereversed = 1) && hitpausetime
trigger1 = animelemtime(2) >= 0 && animelemtime(3) <= 0
trigger1 = hitpausetime <= 4
value = 631
elem = 3
ignorehitpause = 1

[State 630, Type]
type = statetypeset
trigger1 = animelemtime(7) >= 0
movetype = I

[State Gravity]
type = gravity
trigger1 = 1

[State Land]
type = changestate
trigger1 = vel y > 0 && (pos y > -vel y)
value = 52


;=========<Air Medium Kick>==========
[Statedef 640]
type = A
movetype = A
physics = N
anim = ifelse((vel x || (var(3) = [1, 2])), 640, 641)
poweradd = 0
sprpriority = 1
ctrl = 0

[State 640, Snd]
type = playsnd
trigger1 = animelem = 2 && random < 350 && var(1) != 2
value = 3, ifelse(random < 500, 2, 3)
channel = 0
[State 640, Snd]
type = playsnd
trigger1 = animelem = 2 && random < 350 && var(1) = 2
value = 13, ifelse(random < 500, 1, 2)
channel = 0
[State 640, Snd]
type = playsnd
trigger1 = anim = 640 && animelem = 3
trigger2 = anim = 641 && animelem = 2
value = 1, 5
channel = 1

[State 640, Hit]
type = hitdef
trigger1 = anim = 640 && animelem = 3
trigger1 = (var(15) < 1 || var(20))
attr = A, NA
damage = 70, 0
animtype = Medium
air.animtype = Back
fall.animtype = Back
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = -1 + 0 * (var(33) := 8011)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := -30) * (var(36) := 64), var(37) := -48
hitsound = -1 + 0 * (var(31) := 5)
guardsound = -1
ground.type = High
ground.hittime = 12
ground.slidetime = 12
ground.velocity = ifelse(var(20), -2.66, -4.49), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
guard.hittime = 15
guard.slidetime = 15
guard.velocity = ifelse(var(20), -4.30, -7.51)
guard.cornerpush.veloff = 0
air.type = Low
air.hittime = 120
air.velocity = -4.25, -6.88
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 100) * !var(20), ifelse(moveguarded, 25, 50) * !var(20)
givepower = 40, 40
yaccel = 0.4850
airguard.ctrltime = 16
airguard.velocity = -6.00, -1.00
airguard.cornerpush.veloff = 0
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State 640, Hit]
type = hitdef
trigger1 = anim = 641 && animelem = 2
trigger1 = (var(15) < 1 || var(20))
attr = A, NA
damage = 80, 0
animtype = Medium
air.animtype = Back
fall.animtype = Back
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = -1 + 0 * (var(33) := 8011)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 10) * (var(36) := 37), var(37) := -108
hitsound = -1 + 0 * (var(31) := 5)
guardsound = -1
ground.type = High
ground.hittime = 12
ground.slidetime = 12
ground.velocity = ifelse(var(20), -2.66, -4.49), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
guard.hittime = 15
guard.slidetime = 15
guard.velocity = ifelse(var(20), -4.30, -7.51)
guard.cornerpush.veloff = 0
air.type = High
air.hittime = 120
air.velocity = -4.25, -6.88
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 100) * !var(20), ifelse(moveguarded, 25, 50) * !var(20)
givepower = 40, 40
yaccel = 0.4850
airguard.ctrltime = 16
airguard.velocity = -6.00, -1.00
airguard.cornerpush.veloff = 0
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State 640, Anim]
type = changeanim
trigger1 = anim = 640
trigger1 = (movecontact = 1 || movereversed = 1) && hitpausetime
trigger1 = animelemtime(3) >= 0 && animelemtime(4) <= 0
trigger1 = hitpausetime <= 6
value = 640
elem = 4
ignorehitpause = 1

[State 640, Anim]
type = changeanim
trigger1 = anim = 641
trigger1 = (movecontact = 1 || movereversed = 1) && hitpausetime
trigger1 = animelemtime(2) >= 0 && animelemtime(3) <= 0
trigger1 = hitpausetime <= 6
value = 641
elem = 3
ignorehitpause = 1

[State 640, Type]
type = statetypeset
trigger1 = animelemtime(5) >= 0
movetype = I

[State Gravity]
type = gravity
trigger1 = 1

[State Land]
type = changestate
trigger1 = vel y > 0 && (pos y > -vel y)
value = 52


;======================<TENMA KUUJIN KYAKU>=============================
[Statedef 645]
type = A
physics = N
movetype = A
anim = 645
velset = 0, 0
ctrl = 0
juggle = 7
poweradd = 0
sprpriority = -1

[State 645, Snd]
type = playsnd
trigger1 = animelem = 1
value = ifelse(var(1) = 2, 13, 3), 2 + (var(1) = 2) * 2
channel = 0
[State 645, Snd]
type = playsnd
trigger1 = animelem = 4
value = 1, 6
channel = 1

[State 645, Vel]
type = velset
trigger1 = animelemtime(4) >= 0
x = 7
y = 7

[State 645, Hit]
type = hitdef
trigger1 = !movecontact && !movereversed
trigger1 = (var(15) < 1 || var(20))
attr = A, NA
damage = 70, 0
animtype = Medium
air.animtype = Back
fall.animtype = Back
guardflag = HA
hitflag = MAFD
priority = 4, Hit
pausetime = 10, 10;12, 12
sparkno = -1 + 0 * (var(33) := 8011)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 52), var(37) := -15
hitsound = -1 + 0 * (var(31) := 5)
guardsound = -1
ground.type = High
ground.slidetime = 12
ground.hittime = 12
ground.velocity = ifelse(var(20), -2.66, -4.49), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
guard.hittime = 15
guard.slidetime = 15
guard.velocity = ifelse(var(20), -4.30, -7.51)
guard.cornerpush.veloff = 0
air.type = Low
air.hittime = 120
air.velocity = -4.25, -6.88
down.hittime = 20
down.velocity = 0, 0
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 100) * !var(20), ifelse(moveguarded, 25, 50) * !var(20)
givepower = 40, 40
yaccel = 0.4850
fall = 0
airguard.ctrltime = 16
airguard.velocity = -6.00, -1.00
airguard.cornerpush.veloff = 0
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State 645, Anim]
type = changeanim
trigger1 = anim = 645
trigger1 = (movecontact = 1 || movereversed = 1) && hitpausetime
trigger1 = animelemtime(4) >= 0 && animelemtime(5) <= 0
trigger1 = hitpausetime <= 7
value = 645
elem = 5
ignorehitpause = 1

[State Land]
type = changestate
trigger1 = vel y > 0 && (pos y > -vel y)
value = 52


;=========<Air Hard Kick>==========
[Statedef 650]
type = A
movetype = A
physics = N
anim = ifelse((vel x || (var(3) = [1, 2])), 650, 651)
poweradd = 0
sprpriority = 1
ctrl = 0

[State 650, Snd]
type = playsnd
trigger1 = animelem = 3 && random < 500 && var(1) != 2
value = 3, ifelse(random < 500, 2, 3)
channel = 0
[State 650, Snd]
type = playsnd
trigger1 = animelem = 3 && random < 500 && var(1) = 2
value = 13, ifelse(random < 500, 1, 2)
channel = 0
[State 650, Snd]
type = playsnd
trigger1 = anim = 650 && animelem = 3
trigger2 = anim = 651 && animelem = 4
value = 1, 6
channel = 1

[State 650, Hit]
type = hitdef
trigger1 = anim = 650 && animelem = 3
trigger1 = (var(15) < 1 || var(20))
attr = A, NA
damage = 100, 0
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 12, 12
sparkno = -1 + 0 * (var(33) := 8012)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 64), var(37) := -48
hitsound = -1 + 0 * (var(31) := 6)
guardsound = -1
ground.type = High
ground.hittime = 12
ground.slidetime = 12
ground.velocity = ifelse(var(20), -2.66, -4.49), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
guard.hittime = 18
guard.slidetime = 18
guard.velocity = ifelse(var(20), -5.77, -10.52)
guard.cornerpush.veloff = 0
air.type = Low
air.hittime = 120
air.velocity = -4.25, -6.88
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 200) * !var(20), ifelse(moveguarded, 25, 100) * !var(20)
givepower = 40, 40
yaccel = 0.4850
airguard.ctrltime = 16
airguard.velocity = -6.00, -1.00
airguard.cornerpush.veloff = 0
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State 650, Hit]
type = hitdef
trigger1 = anim = 651 && animelem = 5
trigger1 = (var(15) < 1 || var(20))
attr = A, NA
damage = 100, 0
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 12, 12
sparkno = -1 + 0 * (var(33) := 8012)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 20) * (var(36) := 61), var(37) := -77
hitsound = -1 + 0 * (var(31) := 6)
guardsound = -1
ground.type = High
ground.hittime = 12
ground.slidetime = 12
ground.velocity = ifelse(var(20), -2.66, -4.49), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
guard.hittime = 18
guard.slidetime = 18
guard.velocity = ifelse(var(20), -5.77, -10.52)
guard.cornerpush.veloff = 0
air.type = Low
air.hittime = 120
air.velocity = -4.25, -6.88
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 200) * !var(20), ifelse(moveguarded, 25, 100) * !var(20)
givepower = 40, 40
yaccel = 0.4850
airguard.ctrltime = 16
airguard.velocity = -6.00, -1.00
airguard.cornerpush.veloff = 0
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State 650, Anim]
type = changeanim
trigger1 = anim = 650
trigger1 = (movecontact = 1 || movereversed = 1) && hitpausetime
trigger1 = animelemtime(3) >= 0 && animelemtime(4) <= 0
trigger1 = hitpausetime <= 8
value = 650
elem = 4
ignorehitpause = 1

[State 650, Type]
type = statetypeset
trigger1 = anim = 650 && animelemtime(4) >= 0
trigger2 = anim = 651 && animelemtime(6) >= 0
movetype = I

[State Gravity]
type = gravity
trigger1 = 1

[State Land]
type = changestate
trigger1 = vel y > 0 && (pos y > -vel y)
value = 52


;=========================================================================
;===============================<THROWS>==================================
;=========================================================================
;========<THROW CONTROLLER>==========
[Statedef 800]
type = S
movetype = A
physics = S
velset = 0, 0
ctrl = 0
anim = 800
sprpriority = 1
facep2 = 1
poweradd = 0

[State 800, Strength]
type = varset
trigger1 = !time && !AIlevel
var(10) = ifelse(command = "kk", 2, 1)
[State 800, Strength]
type = varset
trigger1 = !time && AIlevel
var(10) = ifelse(random < 500, 2, 1)

[State 800, Tech Hit]
type = varset
trigger1 = 1
var(19) = 0
[State 800, Tech Hit]
type = varset
trigger1 = numenemy
trigger1 = enemynear, statetype != A
trigger1 = (enemynear, stateno = [0, 999]) && (enemynear, stateno != [100, 119]) && (enemynear, stateno != [200, 799]) && enemynear, anim != 5300
var(19) = 7

[State 800, Tech Hit Facing]
type = varset
trigger1 = !time
var(27) = facing

[State 800, Do not guard]
type = attackdist
trigger1 = 1
value = 0

[State 800, Hit]
type = hitdef
trigger1 = animelem = 2
trigger1 = !var(29) && numenemy
trigger1 = fvar(16) <= 27
trigger1 = p2dist x >= ifelse((facing = enemynear, facing), -(enemynear, const(size.ground.front)), -(enemynear, const(size.ground.back)))
attr = S, NT
hitflag = M
priority = 1, Miss
sparkno = -1 + 0 * (var(33) := 0)
hitsound = -1 + 0 * (var(31) := 800)
p1facing = 1
p2facing = 1
p1stateno = ifelse((!AIlevel && command = "holdfwd") || (AIlevel && frontedgedist < backedgedist), 803, 801)
guard.dist = 0
fall = 1
fall.recover = 1
fall.recovertime = 120
numhits = 0

[State 800, Snd]
type = playsnd
trigger1 = animelem = 3
value = ifelse(var(1) = 2, 5010, 5000), ifelse(var(1) = 2, 1, 4)
channel = 0

[State 800, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 1
channel = 1

[State Idle]
type = statetypeset
trigger1 = animelemtime(3) >= 0
movetype = I

[State 800, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- PLAYER ---
[Statedef 801]
type = S
movetype = A
physics = S
anim = 801
ctrl = 0
sprpriority = 1

[State Tech Hit]
type = changestate
trigger1 = numtarget && var(19)
trigger1 = (target, command = "holdfwd" || target, command = "holdback") && target, command != "holdup" && target, command != "holddown"
trigger1 = (target, command = "b" || target, command = "c" || target, command = "y" || target, command = "z")
value = 890
[State Tech Hit]
type = varadd
trigger1 = time
trigger1 = var(19) > 0
var(19) = -1

[State Throw]
type = targetstate
trigger1 = !time
value = 802

[State Width]
type = width
trigger1 = 1
edge = 30, 0

[State 801, Bind 1]
type = targetbind
trigger1 = 1
pos = 45, 0

[State 801, End]
type = changestate
trigger1 = !animtime
value = ifelse(var(10) = 2, 810, 805)
ctrl = 0


;--- PLAYER TURNS ---
[Statedef 803]
type = S
movetype = A
physics = S
anim = 803
ctrl = 0
sprpriority = 1

[State 803, Turn]
type = turn
trigger1 = !time
[State 803, P2 Turn]
type = targetfacing
trigger1 = !time
value = -1

[State Tech Hit]
type = changestate
trigger1 = numtarget && var(19)
trigger1 = (target, command = "holdfwd" || target, command = "holdback") && target, command != "holdup" && target, command != "holddown"
trigger1 = (target, command = "b" || target, command = "c" || target, command = "y" || target, command = "z")
value = 890
[State Tech Hit]
type = varadd
trigger1 = time
trigger1 = var(19) > 0
var(19) = -1

[State Throw]
type = targetstate
trigger1 = !time
value = 804

[State Width]
type = width
trigger1 = 1
edge = 30, 30

[State 803, Bind 1]
type = targetbind
trigger1 = animelemtime(1) >= 0 && animelemtime(2) < 0
pos = -45, 0
[State 803, Bind 2]
type = targetbind
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
pos = -25, 0
[State 803, Bind 3]
type = targetbind
trigger1 = animelemtime(3) >= 0 && animelemtime(4) < 0
pos = 0, 0
[State 803, Bind 4]
type = targetbind
trigger1 = animelemtime(4) >= 0 && animelemtime(5) < 0
pos = 22, 0
[State 803, Bind 5]
type = targetbind
trigger1 = animelemtime(5) >= 0
pos = 45, 0

[State 803, spr]
type = sprpriority
trigger1 = 1
value = 1 -2 * (animelemtime(2) >= 0 && animelemtime(5) < 0)

[State 803, End]
type = changestate
trigger1 = !animtime
value = ifelse(var(10) = 2, 810, 805)
ctrl = 0


;--- TARGET ---
[Statedef 802]
type = A
physics = N
movetype = H
velset = 0, 0
sprpriority = 0

[State 802, Anim]
type = changeanim2
trigger1 = !time
value = 802

[State Safety]
type = selfstate
trigger1 = time >= 60
value = ifelse(pos y < 0, 5040, 0)
ctrl = 1


[Statedef 804]
type = A
physics = N
movetype = H
velset = 0, 0
sprpriority = 0

[State 804, Anim]
type = changeanim2
trigger1 = !time
value = 804

[State Safety]
type = selfstate
trigger1 = time >= 60
value = ifelse(pos y < 0, 5040, 0)
ctrl = 1


;========<SEOI NAGE>==========
;--- PLAYER ---
[Statedef 805]
type = S
movetype = A
physics = S
anim = 805
ctrl = 0

[State 805, Throw]
type = targetstate
trigger1 = !time
value = 808
[State 805, Throw]
type = targetfacing
trigger1 = time <= 1
value = -1

[State Tech Hit]
type = changestate
trigger1 = numtarget && var(19)
trigger1 = (target, command = "holdfwd" || target, command = "holdback") && target, command != "holdup" && target, command != "holddown"
trigger1 = (target, command = "b" || target, command = "c" || target, command = "y" || target, command = "z")
value = 890
[State Tech Hit]
type = varadd
trigger1 = time
trigger1 = var(19) > 0
var(19) = -1

[State 805, Width]
type = width
trigger1 = animelemtime(4) < 0
edge = 0, 40
[State 805, Width]
type = width
trigger1 = animelemtime(4) >= 0 && animelemtime(5) < 0
edge = 0, 70

[State 805, throw snd]
type = playsnd
trigger1 = var(1) != 2 && animelem = 2
trigger2 = var(1) = 2 && animelem = 1
value = ifelse(var(1) = 2, 13, 3), ifelse(var(1) = 2, 1, 4)
channel = 0

[State 805, throw snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 6
channel = 1

[State 805, Bind 1]
type = targetbind
trigger1 = animelemtime(1) >= 0 && animelemtime(2) < 0
pos = 15, -76
[State 805, Bind 2]
type = targetbind
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
pos = -11, -105
[State 805, Bind 3]
type = targetbind
trigger1 = animelemtime(3) >= 0 && animelemtime(4) < 0
pos = -40, -80
[State 805, Bind 4]
type = targetbind
trigger1 = animelem = 4
pos = -70, -45

[State 805, Snd]
type = playsnd
trigger1 = numtarget
trigger1 = target, stateno = 809 && target, time = 3
value = 5, 3
persistent = 0

[State 805, Dust]
type = helper
trigger1 = numtarget
trigger1 = target, stateno = 809 && target, time = 3
helpertype = normal
stateno = 8110
ID = 8100
name = "Impact Dust"
postype = p2
pos = 0, 0
ownpal = 1

[State 805, Shake]
type = envshake
trigger1 = numtarget
trigger1 = target, stateno = 809 && target, time = 3
time = 12
freq = 180
ampl = 2
persistent = 0

[State 805, Damage]
type = hitadd
trigger1 = numtarget
trigger1 = target, stateno = 809 && target, time = 3
value = 1

[State 805, Juggle]
type = varadd
trigger1 = animelem = 4
var(15) = 1

[State 805, Damage]
type = targetlifeadd
trigger1 = numtarget
trigger1 = target, stateno = 809 && target, time = 3
value = -ceil(130 * fvar(11))
persistent = 0

[State 805, Stun System - Add]
type = varadd
trigger1 = !var(19)
trigger1 = var(20) <= 0
trigger1 = var(42) >= 0
var(42) = ceil(140 * fvar(11))
persistent = 0

[State 805, Damage]
type = targetpoweradd
trigger1 = animelem = 4
value = 40;givepower

[State 805, Power]
type = poweradd
trigger1 = animelem = 4 && !var(20)
value = 100;getpower

[State 805, Throw]
type = targetstate
trigger1 = animelem = 4
value = 809

[State 805, Stun]
type = targetstate
trigger1 = numtarget
trigger1 = target, stateno = 809 && target, time = 4
trigger1 = numenemy = 1 && numpartner = 0
trigger1 = var(42) >= (target, const(data.life))
value = 1115314

[State 805, Pos]
type = posadd
trigger1 = !animtime
x = 3
[State 805, Turn]
type = turn
trigger1 = !animtime
[State 805, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- TARGET ---
[Statedef 806]
type = A
movetype = H
physics = N
velset = 0, 0
sprpriority = 0

[State 806, Anim]
type = changeanim2
trigger1 = !time
value = 806

[State 806, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = 0, 0

[State 806, Safety]
type = selfstate
trigger1 = time >= 180
value = 5040


[Statedef 807]
type = A
movetype = H
physics = N
velset = 6, -5

[State 807, Accel]
type = veladd
trigger1 = 1
y = 0.4850;yaccel

[State 807, Recover]
type = selfstate
trigger1 = alive
trigger1 = command = "recovery"
trigger1 = vel y > 0 && pos y >= const(movement.air.gethit.groundrecover.ground.threshold)
value = 5200

[State 807, hitground]
type = selfstate
trigger1 = vel y > 0
trigger1 = pos y >= (-const(size.ground.front) -const(size.ground.back))
value = 5100


[Statedef 808]
type = A
movetype = H
physics = N
velset = 0, 0
sprpriority = 0

[State 808, Anim]
type = changeanim2
trigger1 = !time
value = 808

[State 808, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = 0, 0

[State 808, Safety]
type = selfstate
trigger1 = time >= 180
value = 5040


[Statedef 809]
type = A
movetype = H
physics = N
velset = 2, 10

[State 809, hitground]
type = velset
trigger1 = time >= 3
x = 0
y = 0

[State 809, hitground]
type = posset
trigger1 = time >= 3
y = 0

[State 809, anim]
type = changeanim
trigger1 = time = 3
value = 5170

[State 809, anim]
type = changeanim
trigger1 = anim = 5170 && !animtime
value = 5110

[State 809, No FX]
type = varset
trigger1 = 1
sysvar(0) = 1

[State 809, End]
type = selfstate
trigger1 = time >= 30
value = 5110


;========<TOMOE NAGE>==========
;--- PLAYER ---
[Statedef 810]
type = S
movetype = A
physics = S
anim = 810
ctrl = 0

[State 810, Throw]
type = targetstate
trigger1 = !time
value = 811
[State 810, Throw]
type = targetfacing
trigger1 = time <= 1
value = -1

[State Tech Hit]
type = changestate
trigger1 = numtarget && var(19)
trigger1 = (target, command = "holdfwd" || target, command = "holdback") && target, command != "holdup" && target, command != "holddown"
trigger1 = (target, command = "b" || target, command = "c" || target, command = "y" || target, command = "z")
value = 890
[State Tech Hit]
type = varadd
trigger1 = time
trigger1 = var(19) > 0
var(19) = -1

[State 810, Width]
type = width
trigger1 = animelemtime(2) < 0
edge = 0, 20
[State 810, Width]
type = width
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
edge = 0, 50
[State 810, Width]
type = width
trigger1 = animelemtime(4) >= 0 && animelemtime(5) < 0
edge = 0, 70

[State 810, throw snd]
type = playsnd
trigger1 = animelem = 2
value = ifelse(var(1) = 2, 13, 3), 2
channel = 0

[State 810, throw snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 6
channel = 1

[State 810, Bind 1]
type = targetbind
trigger1 = animelemtime(1) >= 0 && animelemtime(2) < 0
pos = 18, 0
[State 810, Bind 2]
type = targetbind
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
pos = 12, -62
[State 810, Bind 3]
type = targetbind
trigger1 = animelemtime(3) >= 0 && animelemtime(4) < 0
pos = -7, -54
[State 810, Bind 4]
type = targetbind
trigger1 = animelem = 4
pos = -74, -57

[State 810, Damage]
type = hitadd
trigger1 = animelem = 4
value = 1

[State 810, Juggle]
type = varadd
trigger1 = animelem = 4
var(15) = 1

[State 810, Damage]
type = targetlifeadd
trigger1 = animelem = 4
value = -ceil(130 * fvar(11))

[State 810, Stun System - Add]
type = varadd
trigger1 = !var(19)
trigger1 = var(20) <= 0
trigger1 = var(42) >= 0
var(42) = ceil(120 * fvar(11))
persistent = 0

[State 810, Damage]
type = targetpoweradd
trigger1 = animelem = 4
value = 40;givepower

[State 810, Power]
type = poweradd
trigger1 = animelem = 4 && !var(20)
value = 100;getpower

[State 810, Throw]
type = targetstate
trigger1 = animelem = 4
value = 812

[State 810, Stun]
type = targetstate
trigger1 = animelemtime(4) = 1
trigger1 = numenemy = 1 && numpartner = 0
trigger1 = var(42) >= (target, const(data.life))
value = 1115312

[State 810, Pos]
type = posadd
trigger1 = animelem = 1 || animelem = 2 || animelem = 3 || animelem = 4
x = ifelse((animelem = 2), -17, ifelse((animelem = 2), -15, ifelse((animelem = 3), -5, -14)))

[State 810, Turn]
type = turn
trigger1 = !animtime
[State 810, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- TARGET ---
[Statedef 811]
type = A
movetype = H
physics = N
velset = 0, 0
sprpriority = 0

[State 811, Anim]
type = changeanim2
trigger1 = !time
value = 811

[State 811, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = 0, 0

[State 811, Safety]
type = selfstate
trigger1 = time >= 180
value = 5040


[Statedef 812]
type = A
movetype = H
physics = N
velset = 5, -9

[State 812, Accel]
type = veladd
trigger1 = 1
y = 0.4850;yaccel

[State 812, Recover]
type = selfstate
trigger1 = alive
trigger1 = command = "recovery"
trigger1 = vel y > 0 && pos y >= const(movement.air.gethit.groundrecover.ground.threshold)
value = 5200

[State 812, hitground]
type = selfstate
trigger1 = vel y > 0
trigger1 = pos y >= (-const(size.ground.front) -const(size.ground.back))
value = 5100


;===========<Target Escaped>==========
[Statedef 890]
type = S
physics = N
movetype = I
anim = 5945
ctrl = 0
velset = 0, 0
sprpriority = 0

[State 890, Tech Hit Facing]
type = turn
trigger1 = !time
trigger1 = facing != var(27)

[State 890, Bind]
type = targetbind
trigger1 = !time
trigger1 = numtarget = 1
pos = (const(size.ground.front) + target, const(size.ground.front)), 0

[State 890, Width]
type = width
trigger1 = !time
trigger1 = numtarget = 1
edge = (target, const(size.ground.front) + target, const(size.ground.back)), 0

[State 890, P2 State]
type = targetstate
trigger1 = !time && numtarget
value = 895
[State 890, Throw]
type = targetfacing
trigger1 = !time && numtarget
value = -1

[State 890, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1
[State 890, Push]
type = playerpush
trigger1 = 1
value = 0

[State 890, Pos]
type = posset
trigger1 = !time
y = 0
[State 890, Vel]
type = velset
trigger1 = 1
x = -1.281
y = 0

[State 890, Snd]
type = playsnd
trigger1 = time = 2
value = ifelse(var(1) = 2, 5010, 5000), ifelse(var(1) = 2, 1, 4)
channel = 0

[State 890, FX]
type = playsnd
trigger1 = !time
value = 2, 0
channel = 2
volumescale = 75

[State 890, FX]
type = helper
trigger1 = !time
helpertype = normal
stateno = 8200
ID = 8200
name = "Spark"
postype = p1
pos = const(size.ground.front), -48
facing = -1
ownpal = 1
size.xscale = 1
size.yscale = 1
pausemovetime = 65535
supermovetime = 65535

[State 890, End]
type = changestate
trigger1 = time >= 26
value = 0
ctrl = 1


;--- TARGET ---
[Statedef 895]
type = S
physics = N
movetype = I
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 895, Anim]
type = changeanim
trigger1 = !time
value = ifelse(selfanimexist(5940), 5940, 130)
[State 895, Anim]
type = changeanim
trigger1 = !time
trigger1 = !selfanimexist(5940) && selfanimexist(5910)
value = 5910
[State 895, Anim]
type = changeanim
trigger1 = time >= 20 && anim = 130
value = 140

[State 895, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1
[State 895, Push]
type = playerpush
trigger1 = 1
value = 0

[State 895, Pos]
type = posset
trigger1 = !time
y = 0
[State 895, Vel]
type = velset
trigger1 = 1
x = -1.281
y = 0

[State 895, End]
type = selfstate
trigger1 = time >= 26
value = 0
ctrl = 1
