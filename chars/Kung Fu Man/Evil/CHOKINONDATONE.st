;This file will lead you to salvation should you believe in such things.
;Anti-Rape system Version 1.0 by aokmaniac13. Raped (ironicaly) by The_None
;var(10) - DO WE FIRE THE WEAPONS?

[Statedef 201]
movetype = I
physics = N
ctrl = 0
velset = 0,0
anim = 0

[State 201, Nevermind.]
type = varset
triggerall = numhelper(202) = 1
triggerall = var(10) = 1
trigger1 = root, anim != [15000,16000]
trigger1 = root, anim != [9005,9020]
trigger1 = root, anim != [18200,19230]
trigger1 = root, anim != 7696
trigger2 = ! (root, gethitvar(isbound))
trigger2 = root, alive
v = 10
value = 0
ignorehitpause = 1

[State 201, Nevermind.]
type = varset
triggerall = numhelper(202) = 1
triggerall = enemy, name = "kuromaru" || enemy, name = "slime" || enemy, name = "black_mwang95%"
triggerall = var(10) = 2
;trigger1 = root, anim != [3520,3831]
trigger1 = selfanimexist(root, anim)
trigger1 = ! (root, gethitvar(isbound))
trigger1 = root, alive
v = 10
value = 0
ignorehitpause = 1

[State 201, Nevermind.]
type = varset
triggerall = numhelper(202) = 1
triggerall = enemy, name = "Haruhi Suzumiya"
triggerall = var(10) = 3
trigger1 = ! (root, gethitvar(isbound))
trigger1 = root, alive
v = 10
value = 0
ignorehitpause = 1

;The ever watchful eye...
[State 201, FIRE ALL WEAPONS]
type = varset
triggerall = numhelper(202) = 0
triggerall = !var(10)
triggerall = root, gethitvar(isbound)
trigger1 = root, anim = [15100,15953]
trigger2 = root, anim = [9005,9020]
trigger3 = root, anim = [18200,19230]
trigger4 = root, anim = 7696
v = 10
value = 1
ignorehitpause = 1

;The ever watchful eye...
[State 201, KEEP FIRING!]
type = varset
triggerall = numhelper(202) = 0
triggerall = !var(10)
triggerall = root, gethitvar(isbound)
triggerall = enemy, name = "kuromaru" || enemy, name = "slime" || enemy, name = "black_mwang95%"
trigger1 = !selfanimexist(root, anim)
trigger2 = root, anim = 6621
v = 10
value = 2
ignorehitpause = 1


;The ever watchful eye...
[State 201, AAAAH MOTHERLAND!]
type = varset
triggerall = numhelper(202) = 0
triggerall = !var(10)
triggerall = root, gethitvar(isbound)
triggerall = enemy, name = "Haruhi Suzumiya"
trigger1 = enemy, stateno = [3200,3220]
v = 10
value = 3
ignorehitpause = 1

[State 201, WHO TOUCHED MY GUN?]
type = helper
triggerall = numhelper(202) = 0
trigger1 = var(10)
ID = 202
postype = left
pos = 0,0
stateno = 202
pausemovetime = 999
ignorehitpause = 1


;Naturally, it works silently.
[State 201, Invisible]
type = assertspecial
trigger1 = 1
flag = invisible
ignorehitpause = 1

;And unnoticeably.
[State 201, playerpush]
type = playerpush
trigger1 = 1
value = 0

;THIS MEANS WAR FUCKER
[Statedef 202]
movetype = I
physics = N
ctrl = 0
velset = 0,0

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = nomusic
flag2 = timerfreeze
flag3 = nokoslow

[State Quote BG]
type = Explod
trigger1 = !numexplod(9001)
trigger1 = parent, var(10)
ID = 9001
anim = 9001
pos = 0,0
postype = left
facing = 1
removetime = 20000
supermovetime = 65535
pausemovetime = 65535
sprpriority = 997
bindtime = -1
ontop = 1
ownpal = 1
scale = 1,1
ignorehitpause = 1

;Naturally, it works silently.
[State 202, Invisible]
type = assertspecial
trigger1 = 1
flag = invisible
flag2 = nomusic
flag3 = nobardisplay
ignorehitpause = 1

;And unnoticeably.
[State 202, playerpush]
type = playerpush
trigger1 = 1
value = 0

[State 202, playsnd]
type = playsnd
trigger1 = time = 0
value = 201,ifelse(random<500,3,0)
ignorehitpause=1

[State 202, playsnd]
type = playsnd
trigger1 = time = 40
value = 201,ifelse(random<500,1,2)
channel = 4
loop = 1
ignorehitpause=1

[State BLAM]
type = Helper
trigger1 = !numhelper(4450)
trigger1 = random < 80
trigger1 = parent, var(10) = 0
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

[State 201, StopSound]
type = stopsnd
trigger1 = parent, var(10) = 0
channel = 4
ignorehitpause = 1

[State 201, RemoveGankbank]
type = removeexplod
trigger1 = parent, var(10) = 0
trigger1 = numexplod(9001)
ID = 9001
ignorehitpause = 1

[State 202, destroyself]
type = destroyself
trigger1 = !numexplod(9001)
trigger1 = parent, var(10) = 0
ignorehitpause = 1
