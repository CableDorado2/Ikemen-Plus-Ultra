; _______________________________
;| Vega by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;============================================================================================
;=====================================<NORMAL STATES>========================================
;============================================================================================

;=========<Stand Light Punch>==========
[Statedef 200]
type = S
movetype = A
physics = S
anim = ifelse(abs(fvar(16)) <= (const(size.xscale) * 25), 201, 200)
velset = 0, 0
poweradd = 0
sprpriority = 1
ctrl = 0
facep2 = 1

[State 200, Snd]
type = playsnd
trigger1 = animelem = 2 && random < 200
value = 3, ifelse(random < 500, 0, 3)
channel = 0
[State 200, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 1
channel = 1

[State 200, Snd]
type = playsnd
trigger1 = !time
value = 5, 0
channel = 3
volumescale = 100
[State 200, FX]
type = helper
trigger1 = !numhelper(6000)
helpertype = normal
stateno = 6000
ID = 6000
name = "Psycho Power"
postype = p1
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1
persistent = 0

[State 200, Hit]
type = hitdef
trigger1 = (var(15) < 1 || var(20))
trigger1 = animelem = 2
attr = S, NA
damage = 25, 0
animtype = Light
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 8, 8
sparkno = -1 + 0 * (var(33) := 8010)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 24) * (var(36) := 85), var(37) := -80
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
trigger1 = anim = 200 && animelemtime(4) >= 0
trigger2 = anim = 201 && animelemtime(3) >= 0
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
anim = ifelse((prevstateno = 710 || abs(fvar(16)) <= (const(size.xscale) * 25)), 211, 210)
velset = 0, 0
poweradd = 0
sprpriority = 1
ctrl = 0
facep2 = 1

[State 210, Snd]
type = playsnd
trigger1 = animelem = 2 && random < 350
value = 3, ifelse(random < 500, 2, 4)
channel = 0
[State 210, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 2
channel = 1

[State 210, Snd]
type = playsnd
trigger1 = !time
value = 5, 1
channel = 3
volumescale = 100
[State 210, FX]
type = helper
trigger1 = !numhelper(6000)
helpertype = normal
stateno = 6000
ID = 6000
name = "Psycho Power"
postype = p1
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1
persistent = 0

[State 210, Hit]
type = hitdef
trigger1 = (var(15) < 1 || var(20))
trigger1 = animelem = 3 && anim = 210
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
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 83), var(37) := -81
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1
ground.type = High
ground.slidetime = 15
ground.hittime = 15 + 3 * (var(9) != 0)
ground.velocity = ifelse(var(20), -4.30, -7.51), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -5.78, -10.47)
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
trigger1 = (var(15) < 1 || var(20))
trigger1 = animelem = 3 && anim = 211
attr = S, NA
damage = 90, 0
animtype = Medium
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = -1 + 0 * (var(33) := 8011)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 80), var(37) := -64
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1
ground.type = Low
ground.slidetime = 15
ground.hittime = 15 + 3 * (var(9) != 0)
ground.velocity = ifelse(var(20), -4.30, -7.51), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -5.78, -10.47)
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
trigger1 = hitpausetime <= 6
value = 210
elem = 4
ignorehitpause = 1

[State 210, Anim]
type = changeanim
trigger1 = anim = 211
trigger1 = (movecontact = 1 || movereversed = 1) && hitpausetime
trigger1 = animelemtime(3) >= 0 && animelemtime(4) <= 0
trigger1 = hitpausetime <= 6
value = 211
elem = 4
ignorehitpause = 1

[State Idle]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I

[State 210, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=========<Stand Hard Punch>==========
[Statedef 220]
type = S
movetype = A
physics = S
anim = ifelse(abs(fvar(16)) <= (const(size.xscale) * 25), 221, 220)
velset = 0, 0
poweradd = 0
sprpriority = 1
ctrl = 0
facep2 = 1

[State 220, Snd]
type = playsnd
trigger1 = animelem = 2 && random < 500
value = 3, ifelse(random < 500, 4, 8)
channel = 0
[State 220, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 3
channel = 1

[State 220, Snd]
type = playsnd
trigger1 = !time
value = 5, 2
channel = 3
volumescale = 100
[State 220, FX]
type = helper
trigger1 = !numhelper(6000)
helpertype = normal
stateno = 6000
ID = 6000
name = "Psycho Power"
postype = p1
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1
persistent = 0

[State 220, Hit]
type = hitdef
trigger1 = (var(15) < 1 || var(20))
trigger1 = animelem = 3 && anim = 220
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
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 70), var(37) := -105
hitsound = -1 + 0 * (var(31) := 3)
guardsound = -1
ground.type = High
ground.slidetime = 18
ground.hittime = 18 + 4 * (var(9) != 0)
ground.velocity = ifelse(var(20), -5.77, -10.52), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -6.82, -12.74)
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
trigger1 = (var(15) < 1 || var(20))
trigger1 = animelem = 3 && anim = 221
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
sparkxy = -10 + 0 * (var(35) := 40) * (var(36) := 80), var(37) := -70
hitsound = -1 + 0 * (var(31) := 3)
guardsound = -1
ground.type = Low
ground.slidetime = 18
ground.hittime = 18 + 4 * (var(9) != 0)
ground.velocity = ifelse(var(20), -5.77, -10.52), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -6.82, -12.74)
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

[State 220, Anim]
type = changeanim
trigger1 = anim = 220
trigger1 = (movecontact = 1 || movereversed = 1) && hitpausetime
trigger1 = animelemtime(3) >= 0 && animelemtime(4) <= 0
trigger1 = hitpausetime <= 8
value = 220
elem = 4
ignorehitpause = 1

[State 220, Anim]
type = changeanim
trigger1 = anim = 221
trigger1 = (movecontact = 1 || movereversed = 1) && hitpausetime
trigger1 = animelemtime(3) >= 0 && animelemtime(4) <= 0
trigger1 = hitpausetime <= 9
value = 221
elem = 4
ignorehitpause = 1

[State 220, Anim]
type = changeanim
trigger1 = anim = 221
trigger1 = (movecontact = 1 || movereversed = 1) && hitpausetime
trigger1 = animelemtime(4) >= 0 && animelemtime(5) <= 0
trigger1 = hitpausetime <= 6
value = 221
elem = 5
ignorehitpause = 1

[State Idle]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I

[State 220, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=========<Stand Light Kick>==========
[Statedef 230]
type = S
movetype = A
physics = S
anim = ifelse(abs(fvar(16)) <= (const(size.xscale) * 25), 231, 230)
velset = 0, 0
poweradd = 0
sprpriority = 1
ctrl = 0
facep2 = 1

[State 230, Snd]
type = playsnd
trigger1 = animelem = 3 && random < 200
value = 3, ifelse(random < 500, 0, 3)
channel = 0
[State 230, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 4
channel = 1

[State 230, Hit]
type = hitdef
trigger1 = (var(15) < 1 || var(20))
trigger1 = animelem = 4 && anim = 230
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
sparkxy = -10 + 0 * (var(35) := 40) * (var(36) := 80), var(37) := -75
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

[State 230, Hit]
type = hitdef
trigger1 = (var(15) < 1 || var(20))
trigger1 = animelem = 3 && anim = 231
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
sparkxy = -10 + 0 * (var(35) := 20) * (var(36) := 56), var(37) := -72
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
trigger1 = anim = 231
trigger1 = (movecontact = 1 || movereversed = 1) && hitpausetime
trigger1 = animelemtime(3) >= 0 && animelemtime(4) <= 0
trigger1 = hitpausetime <= 5
value = 231
elem = 4
ignorehitpause = 1

[State Idle]
type = statetypeset
trigger1 = anim = 230 && animelemtime(5) >= 0
trigger2 = anim = 231 && animelemtime(4) >= 0
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
anim = ifelse(abs(fvar(16)) <= (const(size.xscale) * 25), 241, 240)
velset = 0, 0
poweradd = 0
sprpriority = 1
ctrl = 0
facep2 = 1

[State 240, Snd]
type = playsnd
trigger1 = animelem = 3 && random < 350
value = 3, ifelse(random < 500, 2, 4)
channel = 0
[State 240, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 5
channel = 1

[State 240, Hit]
type = hitdef
trigger1 = (var(15) < 1 || var(20))
trigger1 = animelem = 4 && anim = 240
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
sparkxy = -10 + 0 * (var(35) := 44) * (var(36) := 108), var(37) := -78
hitsound = -1 + 0 * (var(31) := 5)
guardsound = -1
ground.type = High
ground.slidetime = 15
ground.hittime = 15 + 3 * (var(9) != 0)
ground.velocity = ifelse(var(20), -4.30, -7.51), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -5.78, -10.47)
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
trigger1 = (var(15) < 1 || var(20))
trigger1 = animelem = 4 && anim = 241
attr = S, NA
damage = 90, 0
animtype = Medium
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = -1 + 0 * (var(33) := 8011)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 32) * (var(36) := 90), var(37) := -72
hitsound = -1 + 0 * (var(31) := 5)
guardsound = -1
ground.type = Low
ground.slidetime = 15
ground.hittime = 15 + 3 * (var(9) != 0)
ground.velocity = ifelse(var(20), -4.30, -7.51), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -5.78, -10.47)
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

[State 240, Anim]
type = changeanim
trigger1 = anim = 240
trigger1 = (movecontact = 1 || movereversed = 1) && hitpausetime
trigger1 = animelemtime(5) >= 0 && animelemtime(6) <= 0
trigger1 = hitpausetime <= 7
value = 240
elem = 6
ignorehitpause = 1

[State 240, Anim]
type = changeanim
trigger1 = anim = 241
trigger1 = (movecontact = 1 || movereversed = 1) && hitpausetime
trigger1 = animelemtime(4) >= 0 && animelemtime(5) <= 0
trigger1 = hitpausetime <= 7
value = 241
elem = 5
ignorehitpause = 1

[State Idle]
type = statetypeset
trigger1 = anim = 240 && animelemtime(6) >= 0
trigger2 = anim = 241 && animelemtime(5) >= 0
movetype = I

[State 240, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=========<Stand Hard Kick>==========
[Statedef 250]
type = S
movetype = A
physics = S
anim = ifelse((prevstateno != 710 && abs(fvar(16)) <= (const(size.xscale) * 25)), 251, 250)
velset = 0, 0
poweradd = 0
sprpriority = 1
ctrl = 0
facep2 = 1

[State 250, Snd]
type = playsnd
trigger1 = animelem = 3 && random < 500
value = 3, ifelse(random < 500, 4, 8)
channel = 0
[State 250, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 6
channel = 1

[State 250, Hit]
type = hitdef
trigger1 = (var(15) < 1 || var(20))
trigger1 = animelem = 4 && anim = 250
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
sparkxy = -10 + 0 * (var(35) := 52) * (var(36) := 112), var(37) := -78
hitsound = -1 + 0 * (var(31) := 6)
guardsound = -1
ground.type = High
ground.slidetime = 18
ground.hittime = 18 + 4 * (var(9) != 0)
ground.velocity = ifelse(var(20), -5.77, -10.52), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -6.82, -12.74)
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
trigger1 = (var(15) < 1 || var(20))
trigger1 = animelem = 4 && anim = 250 && prevstateno = 710
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
sparkxy = -10 + 0 * (var(35) := 52) * (var(36) := 112), var(37) := -78
hitsound = -1 + 0 * (var(31) := 6)
guardsound = -1
ground.type = High
ground.slidetime = 18
ground.hittime = 18 + 4 * (var(9) != 0)
ground.velocity = -6.46, -5.25
air.type = Low
air.hittime = 120
air.velocity = -6.46, -5.25
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -5.77, -10.52)
guard.cornerpush.veloff = 0;ifelse(var(20), -6.82, -12.74)
getpower = ifelse(movehit, 25, 200) * !var(20), ifelse(moveguarded, 25, 100) * !var(20)
givepower = 40, 40
yaccel = 0.4850
fall = 1
fall.recover = 1
fall.recovertime = 120

[State 250, Hit]
type = hitdef
trigger1 = (var(15) < 1 || var(20))
trigger1 = animelem = 4 && anim = 251
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
sparkxy = -10 + 0 * (var(35) := 33) * (var(36) := 90), var(37) := -72
hitsound = -1 + 0 * (var(31) := 6)
guardsound = -1
ground.type = High
ground.slidetime = 18
ground.hittime = 18 + 4 * (var(9) != 0)
ground.velocity = ifelse(var(20), -5.77, -10.52), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -6.82, -12.74)
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

[State 250, Anim]
type = changeanim
trigger1 = anim = 250
trigger1 = (movecontact = 1 || movereversed = 1) && hitpausetime
trigger1 = animelemtime(5) >= 0 && animelemtime(6) <= 0
trigger1 = hitpausetime <= 9
value = 250
elem = 6
ignorehitpause = 1

[State 250, Anim]
type = changeanim
trigger1 = anim = 251
trigger1 = (movecontact = 1 || movereversed = 1) && hitpausetime
trigger1 = animelemtime(4) >= 0 && animelemtime(5) <= 0
trigger1 = hitpausetime <= 9
value = 251
elem = 5
ignorehitpause = 1

[State Idle]
type = statetypeset
trigger1 = anim = 250 && animelemtime(6) >= 0
trigger2 = anim = 251 && animelemtime(5) >= 0
movetype = I

[State 250, End]
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
trigger1 = animelem = 2 && random < 200
value = 3, ifelse(random < 500, 0, 3)
channel = 0
[State 400, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 1
channel = 1

[State 400, Snd]
type = playsnd
trigger1 = !time
value = 5, 0
channel = 3
volumescale = 100
[State 400, FX]
type = helper
trigger1 = !numhelper(6000)
helpertype = normal
stateno = 6000
ID = 6000
name = "Psycho Power"
postype = p1
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1
persistent = 0

[State 400, Hit]
type = hitdef
trigger1 = (var(15) < 1 || var(20))
trigger1 = animelem = 2
attr = C, NA
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
sparkxy = -10 + 0 * (var(35) := 20) * (var(36) := 56), var(37) := -52
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
trigger1 = animelem = 4 && random < 350
value = 3, ifelse(random < 500, 2, 4)
channel = 0
[State 410, Snd]
type = playsnd
trigger1 = animelem = 5
value = 1, 2
channel = 1

[State 410, Snd]
type = playsnd
trigger1 = !time
value = 5, 1
channel = 3
volumescale = 100
[State 410, FX]
type = helper
trigger1 = !numhelper(6000)
helpertype = normal
stateno = 6000
ID = 6000
name = "Psycho Power"
postype = p1
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1
persistent = 0

[State 410, Hit]
type = hitdef
trigger1 = (var(15) < 1 || var(20))
trigger1 = animelem = 5
attr = C, NA
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
sparkxy = -10 + 0 * (var(35) := 40) * (var(36) := 94), var(37) := -58
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1
ground.type = Low
ground.slidetime = 15
ground.hittime = 15 + 3 * (var(9) != 0)
ground.velocity = ifelse(var(20), -4.30, -7.51), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -5.78, -10.47)
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
trigger1 = animelemtime(5) >= 0 && animelemtime(6) <= 0
trigger1 = hitpausetime <= 6
value = 410
elem = 6
ignorehitpause = 1

[State Idle]
type = statetypeset
trigger1 = animelemtime(6) >= 0
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
trigger1 = animelem = 4 && random < 500
value = 3, ifelse(random < 500, 4, 8)
channel = 0
[State 420, Snd]
type = playsnd
trigger1 = animelem = 5
value = 1, 3
channel = 1

[State 420, Snd]
type = playsnd
trigger1 = !time
value = 5, 2
channel = 3
volumescale = 100
[State 420, FX]
type = helper
trigger1 = !numhelper(6000)
helpertype = normal
stateno = 6000
ID = 6000
name = "Psycho Power"
postype = p1
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1
persistent = 0

[State 420, Hit]
type = hitdef
trigger1 = (var(15) < 1 || var(20))
trigger1 = animelem = 5
attr = C, NA
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
sparkxy = -10 + 0 * (var(35) := 44) * (var(36) := 96), var(37) := -58
hitsound = -1 + 0 * (var(31) := 3)
guardsound = -1
ground.type = Low
ground.slidetime = 18
ground.hittime = 18 + 4 * (var(9) != 0)
ground.velocity = ifelse(var(20), -5.77, -10.52), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -6.82, -12.74)
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
trigger1 = hitpausetime <= 6
value = 420
elem = 6
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
trigger1 = animelem = 2 && random < 200
value = 3, ifelse(random < 500, 0, 3)
channel = 0
[State 430, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 4
channel = 1

[State 430, Hit]
type = hitdef
trigger1 = (var(15) < 1 || var(20))
trigger1 = animelem = 3
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
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 75), var(37) := -8
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
trigger1 = animelemtime(3) >= 0 && animelemtime(4) <= 0
trigger1 = hitpausetime <= 5
value = 430
elem = 4
ignorehitpause = 1

[State Idle]
type = statetypeset
trigger1 = animelemtime(4) >= 0
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
trigger1 = animelem = 2 && random < 350
value = 3, ifelse(random < 500, 2, 4)
channel = 0
[State 440, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 5
channel = 1

[State 440, Hit]
type = hitdef
trigger1 = (var(15) < 1 || var(20))
trigger1 = animelem = 3
attr = C, NA
damage = 65, 0
animtype = Medium
air.animtype = Back
fall.animtype = Back
guardflag = L
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = -1 + 0 * (var(33) := 8011)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 84), var(37) := -14
hitsound = -1 + 0 * (var(31) := 5)
guardsound = -1
ground.type = Low
ground.slidetime = 15
ground.hittime = 15 + 3 * (var(9) != 0)
ground.velocity = ifelse(var(20), -4.30, -7.51), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -5.78, -10.47)
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
trigger1 = hitpausetime <= 7
value = 440
elem = 4
ignorehitpause = 1

[State Idle]
type = statetypeset
trigger1 = animelemtime(4) >= 0
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
physics = S
anim = 450
velset = 0, 0
poweradd = 0
sprpriority = 1
ctrl = 0
facep2 = 1

[State 450, Snd]
type = playsnd
trigger1 = animelem = 4
value = 3, ifelse(random < 500, 4, 8)
channel = 0
[State 450, Snd]
type = playsnd
trigger1 = animelem = 5
value = 5, 8
channel = 1

[State 450, Vel]
type = velset
trigger1 = animelem = 5
x = 25

[State 450, Push]
type = playerpush
trigger1 = animelemtime(5) >= 0 && animelemtime(6) < 0 && movehit
value = 0
ignorehitpause = 1

[State 450, Hit]
type = hitdef
trigger1 = (var(15) < 1 || var(20))
trigger1 = animelem = 5
attr = C, NA
damage = 100, 0
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = L
hitflag = MAF
priority = 4, Hit
pausetime = 12, 12
sparkno = -1 + 0 * (var(33) := 8012)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 0) * (var(36) := 52), var(37) := -20
hitsound = -1 + 0 * (var(31) := 6)
guardsound = -1
ground.type = Trip
ground.slidetime = 18
ground.hittime = 18 + 4 * (var(9) != 0)
ground.velocity = -1, -8.24
air.type = Low
air.velocity = -1, -8.24
air.cornerpush.veloff = 0
down.velocity = -2, -4
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -5.77, -10.52)
guard.cornerpush.veloff = 0;ifelse(var(20), -6.82, -12.74)
getpower = ifelse(movehit, 25, 200) * !var(20), ifelse(moveguarded, 25, 100) * !var(20)
givepower = 40, 40
yaccel = 0.677
fall = 1
fall.recover = !var(9)
fall.recovertime = 120

[State Idle]
type = statetypeset
trigger1 = animelemtime(6) >= 0
movetype = I

[State 450, End]
type = changestate
trigger1 = !animtime
value = ifelse(command = "holddown", 10, 12)
ctrl = 1


;=========<Air Light Punch>==========
[Statedef 600]
type = A
movetype = A
physics = N
anim = ifelse(vel x || (var(3) = [1, 2]), 601, 600)
poweradd = 0
sprpriority = 1
ctrl = 0

[State 600, Snd]
type = playsnd
trigger1 = anim = 600 && animelem = 2 && random < 200
trigger2 = anim = 601 && animelem = 3 && random < 200
value = 3, ifelse(random < 500, 0, 3)
channel = 0
[State 600, Snd]
type = playsnd
trigger1 = anim = 600 && animelem = 2
trigger2 = anim = 601 && animelem = 3
value = 1, 1
channel = 1

[State 600, Snd]
type = playsnd
trigger1 = !time
value = 5, 0
channel = 3
volumescale = 100
[State 600, FX]
type = helper
trigger1 = !numhelper(6000)
helpertype = normal
stateno = 6000
ID = 6000
name = "Psycho Power"
postype = p1
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1
persistent = 0

[State 600, Hit]
type = hitdef
trigger1 = (var(15) < 1 || var(20))
trigger1 = anim = 600 && animelem = 2
attr = A, NA
damage = 50, 0
animtype = Light
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 8, 8
sparkno = -1 + 0 * (var(33) := 8010)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 54), var(37) := -70
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

[State 600, Hit]
type = hitdef
trigger1 = (var(15) < 1 || var(20))
trigger1 = anim = 601 && animelem = 4
attr = A, NA
damage = 50, 0
animtype = Light
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 8, 8
sparkno = -1 + 0 * (var(33) := 8010)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 73), var(37) := -96
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
trigger1 = hitpausetime <= 6
value = 600
elem = 3
ignorehitpause = 1

[State 600, Anim]
type = changeanim
trigger1 = anim = 601
trigger1 = (movecontact = 1 || movereversed = 1) && hitpausetime
trigger1 = animelemtime(4) >= 0 && animelemtime(5) <= 0
trigger1 = hitpausetime <= 6
value = 601
elem = 5
ignorehitpause = 1

[State 600, Type]
type = statetypeset
trigger1 = anim = 600 && animelemtime(4) >= 0
trigger2 = anim = 601 && animelemtime(6) >= 0
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
anim = 610
poweradd = 0
sprpriority = 1
ctrl = 0

[State 610, Snd]
type = playsnd
trigger1 = animelem = 2 && random < 350
value = 3, ifelse(random < 500, 2, 4)
channel = 0
[State 610, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 2
channel = 1

[State 610, Snd]
type = playsnd
trigger1 = !time
value = 5, 1
channel = 3
volumescale = 100
[State 610, FX]
type = helper
trigger1 = !numhelper(6000)
helpertype = normal
stateno = 6000
ID = 6000
name = "Psycho Power"
postype = p1
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1
persistent = 0

[State 610, Hit]
type = hitdef
trigger1 = (var(15) < 1 || var(20))
trigger1 = animelem = 2
attr = A, NA
damage = 90, 0
animtype = Medium
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = -1 + 0 * (var(33) := 8011)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 54), var(37) := -68
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
guard.cornerpush.veloff = 0;ifelse(var(20), -5.78, -10.47)
air.type = High
air.hittime = 120
air.velocity = ifelse(var(20), -1.33, -2.67), -9
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 100) * !var(20), ifelse(moveguarded, 25, 50) * !var(20)
givepower = 40, 40
air.fall = (vel x != 0)
fall.recover = 1
fall.recovertime = 120
yaccel = 0.4850
airguard.ctrltime = 16
airguard.velocity = -6.00, -1.00
airguard.cornerpush.veloff = 0
forcenofall = 0

[State 610, Anim]
type = changeanim
trigger1 = anim = 610
trigger1 = (movecontact = 1 || movereversed = 1) && hitpausetime
trigger1 = animelemtime(2) >= 0 && animelemtime(3) <= 0
trigger1 = hitpausetime <= 8
value = 610
elem = 3
ignorehitpause = 1

[State 610, Hell Attack]
type = changestate
trigger1 = !AIlevel
trigger1 = command = "y"
trigger1 = vel x && animelemtime(3) >= 0
value = 615

[State 610, Type]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I

[State Gravity]
type = gravity
trigger1 = 1

[State Land]
type = changestate
trigger1 = vel y > 0 && (pos y > -vel y)
value = 52


;=========<Hell Attack>==========
[Statedef 615]
type = A
movetype = A
physics = N
anim = 615
poweradd = 0
sprpriority = 1
ctrl = 0

[State 615, Snd]
type = playsnd
trigger1 = animelem = 3 && random < 350
value = 3, ifelse(random < 500, 2, 4)
channel = 0
[State 615, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 3
channel = 1

[State 615, Snd]
type = playsnd
trigger1 = !time
value = 5, 1
channel = 3
volumescale = 100
[State 615, FX]
type = helper
trigger1 = !numhelper(6000)
helpertype = normal
stateno = 6000
ID = 6000
name = "Psycho Power"
postype = p1
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1
persistent = 0

[State 615, Hit]
type = hitdef
trigger1 = animelem = 4
trigger1 = (var(15) < 2 || var(20))
attr = A, NA
damage = 30, 0
animtype = Medium
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = -1 + 0 * (var(33) := 8011)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 53), var(37) := -66
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
guard.cornerpush.veloff = 0;ifelse(var(20), -5.78, -10.47)
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

[State 615, Anim]
type = changeanim
trigger1 = anim = 615
trigger1 = (movecontact = 1 || movereversed = 1) && hitpausetime
trigger1 = animelemtime(3) >= 0 && animelemtime(4) <= 0
trigger1 = hitpausetime <= 8
value = 615
elem = 4
ignorehitpause = 1

[State 615, Type]
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
anim = ifelse(vel x || (var(3) = [1, 2]), 621, 620)
poweradd = 0
sprpriority = 1
ctrl = 0

[State 620, Snd]
type = playsnd
trigger1 = animelem = 3 && random < 500
value = 3, ifelse(random < 500, 4, 8)
channel = 0
[State 620, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 3
channel = 1

[State 620, Snd]
type = playsnd
trigger1 = !time
value = 5, 2
channel = 3
volumescale = 100
[State 620, FX]
type = helper
trigger1 = !numhelper(6000)
helpertype = normal
stateno = 6000
ID = 6000
name = "Psycho Power"
postype = p1
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1
persistent = 0

[State 620, Hit]
type = hitdef
trigger1 = (var(15) < 1 || var(20))
trigger1 = anim = 620 && animelem = 3
attr = A, NA
damage = 110, 0
animtype = Hard
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 12, 12
sparkno = -1 + 0 * (var(33) := 8012)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 53), var(37) := -66
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
guard.cornerpush.veloff = 0;ifelse(var(20), -6.82, -12.74)
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

[State 620, Hit]
type = hitdef
trigger1 = (var(15) < 1 || var(20))
trigger1 = anim = 621 && animelem = 4
attr = A, NA
damage = 110, 0
animtype = Hard
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 12, 12
sparkno = -1 + 0 * (var(33) := 8012)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 60), var(37) := -98
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
guard.cornerpush.veloff = 0;ifelse(var(20), -6.82, -12.74)
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
trigger1 = hitpausetime <= 9
value = 620
elem = 4
ignorehitpause = 1

[State 620, Anim]
type = changeanim
trigger1 = anim = 621
trigger1 = (movecontact = 1 || movereversed = 1) && hitpausetime
trigger1 = animelemtime(4) >= 0 && animelemtime(5) <= 0
trigger1 = hitpausetime <= 9
value = 621
elem = 5
ignorehitpause = 1

[State 620, Type]
type = statetypeset
trigger1 = anim = 620 && animelemtime(5) >= 0
trigger2 = anim = 621 && animelemtime(6) >= 0
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
anim = ifelse(vel x || (var(3) = [1, 2]), 631, 630)
poweradd = 0
sprpriority = 1
ctrl = 0

[State 630, Snd]
type = playsnd
trigger1 = anim = 630 && animelem = 2 && random < 200
trigger2 = anim = 631 && animelem = 3 && random < 200
value = 3, ifelse(random < 500, 0, 3)
channel = 0
[State 630, Snd]
type = playsnd
trigger1 = anim = 630 && animelem = 2
trigger2 = anim = 631 && animelem = 3
value = 1, 4
channel = 1

[State 630, Hit]
type = hitdef
trigger1 = (var(15) < 1 || var(20))
trigger1 = animelem = 2 && anim = 630
attr = A, NA
damage = 40, 0
animtype = Light
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 8, 8
sparkno = -1 + 0 * (var(33) := 8010)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 64), var(37) := -68
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
trigger1 = (var(15) < 1 || var(20))
trigger1 = animelem = 3 && anim = 631
attr = A, NA
damage = 40, 0
animtype = Light
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 8, 8
sparkno = -1 + 0 * (var(33) := 8010)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 0) * (var(36) := 30), var(37) := -75
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

[State 630, Anim]
type = changeanim
trigger1 = anim = 630
trigger1 = (movecontact = 1 || movereversed = 1) && hitpausetime
trigger1 = animelemtime(2) >= 0 && animelemtime(3) <= 0
trigger1 = hitpausetime <= 6
value = 630
elem = 3
ignorehitpause = 1

[State 630, Anim]
type = changeanim
trigger1 = anim = 631
trigger1 = (movecontact = 1 || movereversed = 1) && hitpausetime
trigger1 = animelemtime(3) >= 0 && animelemtime(4) <= 0
trigger1 = hitpausetime <= 6
value = 631
elem = 4
ignorehitpause = 1

[State 630, Type]
type = statetypeset
trigger1 = anim = 630 && animelemtime(4) >= 0
trigger2 = anim = 631 && animelemtime(5) >= 0
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
anim = ifelse(vel x || (var(3) = [1, 2]), 641, 640)
poweradd = 0
sprpriority = 1
ctrl = 0

[State 640, Snd]
type = playsnd
trigger1 = anim = 640 && animelem = 3 && random < 350
trigger2 = anim = 641 && animelem = 2 && random < 350
value = 3, ifelse(random < 500, 2, 4)
channel = 0
[State 640, Snd]
type = playsnd
trigger1 = anim = 640 && animelem = 3
trigger2 = anim = 641 && animelem = 2
value = 1, 5
channel = 1

[State 640, Hit]
type = hitdef
trigger1 = (var(15) < 1 || var(20))
trigger1 = anim = 640 && animelem = 4
attr = A, NA
damage = 70, 0
animtype = Medium
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = -1 + 0 * (var(33) := 8011)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 16) * (var(36) := 90), var(37) := ifelse(p2dist x < 0, -38, -66)
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
guard.cornerpush.veloff = 0;ifelse(var(20), -5.78, -10.47)
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
trigger1 = (var(15) < 1 || var(20))
trigger1 = anim = 641 && animelem = 2
attr = A, NA
damage = 80, 0
animtype = Medium
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = -1 + 0 * (var(33) := 8011)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := -35) * (var(36) := 44), var(37) := ifelse(p2dist x < 0, -40, -72)
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
guard.cornerpush.veloff = 0;ifelse(var(20), -5.78, -10.47)
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
trigger1 = animelemtime(4) >= 0 && animelemtime(5) <= 0
trigger1 = hitpausetime <= 8
value = 640
elem = 5
ignorehitpause = 1

[State 640, Anim]
type = changeanim
trigger1 = anim = 641
trigger1 = (movecontact = 1 || movereversed = 1) && hitpausetime
trigger1 = animelemtime(2) >= 0 && animelemtime(3) <= 0
trigger1 = hitpausetime <= 8
value = 641
elem = 3
ignorehitpause = 1

[State 640, Type]
type = statetypeset
trigger1 = anim = 640 && animelemtime(6) >= 0
trigger2 = anim = 641 && animelemtime(4) >= 0
movetype = I

[State Gravity]
type = gravity
trigger1 = 1

[State Land]
type = changestate
trigger1 = vel y > 0 && (pos y > -vel y)
value = 52


;=========<Air Hard Kick>==========
[Statedef 650]
type = A
movetype = A
physics = N
anim = ifelse(vel x || (var(3) = [1, 2]), 651, 650)
poweradd = 0
sprpriority = 1
ctrl = 0

[State 650, Snd]
type = playsnd
trigger1 = animelem = 3 && random < 500
value = 3, ifelse(random < 500, 4, 8)
channel = 0
[State 650, Snd]
type = playsnd
trigger1 = anim = 650 && animelem = 4
trigger2 = anim = 651 && animelem = 3
value = 1, 6
channel = 1

[State 650, Hit]
type = hitdef
trigger1 = (var(15) < 1 || var(20))
trigger1 = anim = 650 && animelem = 4
attr = A, NA
damage = 100, 0
animtype = Hard
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 12, 12
sparkno = -1 + 0 * (var(33) := 8012)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 90), var(37) := -66
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
guard.cornerpush.veloff = 0;ifelse(var(20), -6.82, -12.74)
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
trigger1 = (var(15) < 1 || var(20))
trigger1 = anim = 651 && animelem = 3
attr = A, NA
damage = 100, 0
animtype = Hard
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 12, 12
sparkno = -1 + 0 * (var(33) := 8012)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := -20) * (var(36) := 89), var(37) := -54
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
guard.cornerpush.veloff = 0;ifelse(var(20), -6.82, -12.74)
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
trigger1 = animelemtime(4) >= 0 && animelemtime(5) <= 0
trigger1 = hitpausetime <= 10
value = 650
elem = 5
ignorehitpause = 1

[State 650, Anim]
type = changeanim
trigger1 = anim = 651
trigger1 = (movecontact = 1 || movereversed = 1) && hitpausetime
trigger1 = animelemtime(3) >= 0 && animelemtime(4) <= 0
trigger1 = hitpausetime <= 10
value = 651
elem = 4
ignorehitpause = 1

[State 650, Type]
type = statetypeset
trigger1 = anim = 650 && animelemtime(6) >= 0
trigger2 = anim = 651 && animelemtime(5) >= 0
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
poweradd = 0
facep2 = 1

[State 800, Strength]
type = varset
trigger1 = !time && !AIlevel
var(10) = ifelse(command = "kk", 2, 1)
[State 800, Strength]
type = varset
trigger1 = !time && AIlevel
var(10) = ifelse(random < 333, 2, 1)

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
trigger1 = animelem = 2 && var(10) = 1
trigger1 = !var(29) && numenemy
trigger1 = fvar(16) <= 27
trigger1 = p2dist x >= ifelse((facing = enemynear, facing), -(enemynear, const(size.ground.front)), -(enemynear, const(size.ground.back)))
trigger1 = !var(29) && numenemy
attr = S, NT
hitflag = M
priority = 1, Miss
sparkno = -1 + 0 * (var(33) := 0)
hitsound = -1 + 0 * (var(31) := 800)
p1facing = 1
p2facing = 1
p1stateno = ifelse((!AIlevel && command = "holdfwd") || (AIlevel && frontedgedist < backedgedist), 803, 801)
guard.dist = 0
ground.velocity = 8, -4
yaccel = 0.4850
fall = 1
fall.recover = 1
fall.recovertime = 48

[State 800, Hit]
type = hitdef
trigger1 = animelem = 2 && var(10) = 2
trigger1 = !var(29) && numenemy
trigger1 = fvar(16) <= 27
trigger1 = p2dist x >= ifelse((facing = enemynear, facing), -(enemynear, const(size.ground.front)), -(enemynear, const(size.ground.back)))
attr = S, NT
hitflag = M
priority = 1, Miss
sparkno = -1 + 0 * (var(33) := 0)
hitsound = -1 + 0 * (var(31) := 800)
p1facing = ifelse((!AIlevel && command = "holdfwd") || (AIlevel && frontedgedist < backedgedist), -1, 1)
p2facing = 1
p1stateno = ifelse((!AIlevel && command = "holdfwd") || (AIlevel && frontedgedist < backedgedist), 803, 801)
guard.dist = 0
yaccel = 0.4850
fall = 1
fall.recover = 1
fall.recovertime = 120
numhits = 0

[State 800, Snd]
type = playsnd
trigger1 = animelem = 3
value = 5000, 2
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

[State 801, End]
type = changestate
trigger1 = 1
value = ifelse(var(10) = 2, 820, 810)
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
pos = -23, 0
[State 803, Bind 3]
type = targetbind
trigger1 = animelemtime(3) >= 0 && animelemtime(4) < 0
pos = -1, 0
[State 803, Bind 4]
type = targetbind
trigger1 = animelemtime(4) >= 0
pos = 22, 0

[State 803, spr]
type = sprpriority
trigger1 = 1
value = -1
[State 803, End]
type = changestate
trigger1 = !animtime
value = ifelse(var(10) = 2, 820, 810)
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


;========<DEADLY THROW>==========
;--- PLAYER ---
[Statedef 810]
type = S
movetype = A
physics = S
anim = 810
ctrl = 0
sprpriority = 1

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
trigger1 = animelemtime(4) < 0
edge = 40, 0
[State 810, Width]
type = width
trigger1 = animelemtime(7) >= 0 && animelemtime(8) < 0
edge = 0, 30

[State 810, throwsnd]
type = playsnd
trigger1 = animelem = 4
value = 3, 8
channel = 0
[State 810, throwsnd]
type = playsnd
trigger1 = animelem = 6
value = 1, 6
channel = 1

[State 810, Bind 1]
type = targetbind
trigger1 = animelemtime(1) >= 0 && animelemtime(4) < 0
pos = 50, 0
[State 810, Bind 4]
type = targetbind
trigger1 = animelemtime(4) >= 0 && animelemtime(5) < 0
pos = 49, -75
[State 810, Bind 5]
type = targetbind
trigger1 = animelemtime(5) >= 0 && animelemtime(6) < 0
pos = 36, -81
[State 810, Bind 6]
type = targetbind
trigger1 = animelemtime(6) >= 0 && animelemtime(7) < 0
pos = 5, -80
[State 810, Bind 7]
type = targetbind
trigger1 = animelem = 7
pos = -20, -80 -target, const(size.mid.pos.y)

[State 810, Juggle]
type = varadd
trigger1 = animelem = 7
var(15) = 1

[State 810, Damage]
type = targetlifeadd
trigger1 = animelem = 7
value = -ceil(140 * fvar(11))

[State 805, Stun System - Add]
type = varadd
trigger1 = !var(19)
trigger1 = var(20) <= 0
trigger1 = var(42) >= 0
var(42) = ceil(120 * fvar(11))
persistent = 0

[State 810, Damage]
type = targetpoweradd
trigger1 = animelem = 7
value = 40;givepower

[State 810, Damage]
type = poweradd
trigger1 = animelem = 7 && !var(20)
value = 100;getpower

[State 810, Throw]
type = targetstate
trigger1 = animelem = 7
value = 812

[State 810, Stun]
type = targetstate
trigger1 = numtarget
trigger1 = animelemtime(7) = 1
trigger1 = numenemy = 1 && numpartner = 0
trigger1 = var(42) >= (target, const(data.life))
value = 1115312

[State 810, Turn]
type = turn
trigger1 = animelem = 11
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
sprpriority = -1

[State 811, Anim]
type = changeanim2
trigger1 = !time
value = 811

[State 811, Camera]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 0

[State 811, Safety]
type = selfstate
trigger1 = time >= 180
value = 5040


[Statedef 812]
type = A
movetype = H
physics = N
velset = 8, -4
sprpriority = -1

[State 812, hitground]
type = turn
trigger1 = !time

[State 812, hitground]
type = changeanim
trigger1 = 1
value = 5050

[State 812, hitground]
type = selfstate
trigger1 = 1
value = 5050


;========<DEATH TOWER>==========
;--- PLAYER ---
[Statedef 820]
type = S
movetype = A
physics = S
anim = 820
ctrl = 0
sprpriority = 1

[State 820, Throw]
type = targetstate
trigger1 = !time
value = 821
[State 820, Throw]
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

[State 820, Width]
type = width
trigger1 = animelemtime(6) < 0
edge = 40, 0
[State 820, Width]
type = width
trigger1 = animelemtime(6) >= 0 && animelemtime(7) < 0
edge = 60, 0
[State 820, Width]
type = width
trigger1 = animelemtime(14) >= 0 && animelemtime(15) < 0
edge = 0, 40

[State 820, throwsnd]
type = playsnd
trigger1 = animelem = 4 || animelem = 12
value = 3, ifelse((animelem = 4), 4, 2)
channel = 0
[State 820, throwsnd]
type = playsnd
trigger1 = animelem = 4 || animelem = 13
value = 1, 6
channel = 1

[State 820, Bind 1]
type = targetbind
trigger1 = animelemtime(1) >= 0 && animelemtime(4) < 0
pos = 50, 0
[State 820, Bind 7]
type = targetbind
trigger1 = animelemtime(7) >= 0 && animelemtime(8) < 0
pos = 54, -134
[State 820, Bind 8]
type = targetbind
trigger1 = animelemtime(8) >= 0 && animelemtime(11) < 0
pos = 51, -130
[State 820, Bind 11]
type = targetbind
trigger1 = animelemtime(11) >= 0 && animelemtime(12) < 0
pos = 42, -134
[State 820, Bind 12]
type = targetbind
trigger1 = animelemtime(12) >= 0 && animelemtime(13) < 0
pos = 10, -138
[State 820, Bind 13]
type = targetbind
trigger1 = animelemtime(13) >= 0 && animelemtime(14) < 0
pos = -23, -130
[State 820, Bind 14]
type = targetbind
trigger1 = animelem = 14
pos = -75, -80

[State 820, Juggle]
type = varadd
trigger1 = animelem = 3 || animelem = 7
var(15) = 1

[State 820, Damage]
type = targetlifeadd
trigger1 = animelem = 3 || animelem = 7
value = -ceil(60 * fvar(11))
kill = (animelem = 7)

[State 820, Stun System - Add]
type = varadd
trigger1 = !var(19)
trigger1 = var(20) <= 0
trigger1 = var(42) >= 0
var(42) = ceil(140 * fvar(11))
persistent = 0

[State 820, Damage]
type = targetpoweradd
trigger1 = animelem = 7
value = 40;givepower

[State 820, Damage]
type = poweradd
trigger1 = animelem = 7 && !var(20)
value = 100;getpower

[State 820, Hit]
type = hitadd
trigger1 = animelem = 3 || animelem = 7
value = 1

[State 820, HitSound]
type = playsnd
trigger1 = animelem = 3 || animelem = 7
value = 2, ifelse((animelem = 3), 5, 6)

[State 820, Spark]
type = helper
trigger1 = fvar(31)
trigger1 = animelem = 3 || animelem = 7
helpertype = normal
stateno = 8011
ID = 8000
name = "Spark"
postype = p1
pos = ifelse((animelem = 3), 59, 54), ifelse((animelem = 3), -35, -134)
facing = 1
ownpal = 1
size.xscale = 1
size.yscale = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State 820, Spark]
type = explod
trigger1 = !fvar(31)
trigger1 = animelem = 3 || animelem = 7
anim = F1
ID = 8000
postype = p1
pos = ifelse((animelem = 3), 59, 54), ifelse((animelem = 3), -35, -134)
supermovetime = -1
pausemovetime = -1
ontop = 1
ownpal = 1

[State 820, Throw]
type = targetstate
trigger1 = animelem = 14
value = 822

[State 820, Stun]
type = targetstate
trigger1 = numtarget
trigger1 = animelemtime(14) = 1
trigger1 = numenemy = 1 && numpartner = 0
trigger1 = var(42) >= (target, const(data.life))
value = 1115312

[State 820, Turn]
type = turn
trigger1 = animelem = 18
[State 820, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- TARGET ---
[Statedef 821]
type = A
movetype = H
physics = N
velset = 0, 0
sprpriority = -1

[State 821, Anim]
type = changeanim2
trigger1 = !time
value = 821

[State 821, Camera]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 0

[State 821, Safety]
type = selfstate
trigger1 = time >= 180
value = 5040


[Statedef 822]
type = A
movetype = H
physics = N
velset = 6, 4
sprpriority = -1

[State 822, Accel]
type = veladd
trigger1 = 1
y = 0.4850;yaccel

[State 822, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = 1, 0

[State 822, Recover]
type = selfstate
trigger1 = alive
trigger1 = command = "recovery"
trigger1 = vel y > 0 && pos y >= const(movement.air.gethit.groundrecover.ground.threshold)
value = 5200

[State 822, hitground]
type = selfstate
trigger1 = vel y > 0 && pos y >= 0
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
value = 5000, 2
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
