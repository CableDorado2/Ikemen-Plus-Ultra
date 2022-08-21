[Remap]
x = x
y = y
z = z
a = a
b = b
c = c
s = s

[Defaults]
command.time = 30
command.buffer.time = 1

;===============================================================================
;MAX2
[Command]
name = "2626_c"
command = ~D, F, D, F, c
time = 30

;MAX
[Command]
name = "2426_x+y"
command = ~D, B, D, B, z
time = 30

[Command]
name = "2626_x+y"
command = ~D, F,$D, F, z
time = 30


[Command]
name = "2624_x/y"
command = ~D, B, D, B, x
time = 30
[Command]
name = "2624_x/y"
command = ~D, B, D, B, y
time = 30

[Command]
name = "2626_x/y"
command = ~D, F, D, F, x
time = 30
[Command]
name = "2626_x/y"
command = ~D, F, D, F, y
time = 30

[Command]
name = "2626_a/b"
command = ~D, F, D, F, a
time = 30
[Command]
name = "2626_a/b"
command = ~D, F, D, F, b
time = 30



;-| Special Motions |------------------------------------------------------

[Command]
name = "24_a"
command = ~D, DB, B, a
time = 30
[Command]
name = "24_b"
command = ~D, DB, B, b
time = 30


[Command]
name = "4~6_x"
command = ~B, D, DF, x
time = 30
[Command]
name = "4~6_y"
command = ~B, D, DF, y
time = 30

[Command]
name = "626_x"
command = ~F, D, DF, x
time = 30
[Command]
name = "626_y"
command = ~F, D, DF, y
time = 30


[Command]
name = "24_x"
command = ~D, DB, B, x
time = 30
[Command]
name = "24_y"
command = ~D, DB, B, y
time = 30


[Command]
name = "424_x"
command = ~B, D, DB, x
time = 30
[Command]
name = "424_y"
command = ~B, D, DB, y
time = 30


[Command]
name = "626_a"
command = ~F, D, DF, a
time = 30
[Command]
name = "626_b"
command = ~F, D, DF, b
time = 30


[Command]
name = "26_x"
command = ~D, DF, F, x
time = 30
[Command]
name = "26_y"
command = ~D, DF, F, y
time = 30

[Command]
name = "26_a"
command = ~D, DF, F, a
time = 30
[Command]
name = "26_b"
command = ~D, DF, F, b
time = 30



[Command]
name = "x+y"
command = x+y
time = 12

[Command]
name = "a+b"
command = a+b
time = 12


[Command]
name = "longjump"
command = ~$D,$U
time = 10

;===============================================================================

[Command]
name = "FF"
command = F,F
time = 10

[Command]
name = "BB"
command = B,B
time = 10

;===============================================================================

[Command]
name = "a"
command = a
time = 1

[Command]
name = "b"
command = b
time = 1

[Command]
name = "c"
command = c
time = 1

[Command]
name = "x"
command = x
time = 1

[Command]
name = "y"
command = y
time = 1

[Command]
name = "z"
command = z
time = 1

[Command]
name = "start"
command = s
time = 1

[Command]
name = "cd"
command = b+y
time = 1

[Command]
name = "a+b"
command = a+b
time = 1

[Command]
name = "x+y"
command = x+y
time = 1

[Command]
name = "a+y"
command = a+y
time = 1

[Command]
name = "recovery"
command = z
time = 1

[Command]
name = "recovery"
command = x+a
time = 1

;===============================================================================

[Command]
name = "holdfwd"
command = /$F
time = 1

[Command]
name = "holdback"
command = /$B
time = 1

[Command]
name = "holdup"
command = /$U
time = 1

[Command]
name = "holddown"
command = /$D
time = 1

[Command]
name = "hold_a"
command = /$a
time = 1

[Command]
name = "hold_b"
command = /$b
time = 1

[Command]
name = "hold_c"
command = /$c
time = 1

[Command]
name = "hold_x"
command = /$x
time = 1

[Command]
name = "hold_y"
command = /$y
time = 1

[Command]
name = "hold_z"
command = /$z
time = 1

;===========================================================================
[Statedef -1]
;===========================================================================
;---------------------------------------------------------------------------
[State -1] ;攻撃キャンセル特種蹴り、コン?中用
type = ChangeState
value = 3500
triggerall = command = "2626_c"
triggerall = power >= 3000
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact

[State -1] ;攻撃キャンセル特種蹴り、コン?中用
type = ChangeState
value = 3300
triggerall = command = "2426_x+y"
triggerall = power >= 2000
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact

;---------------------------------------------------------------------------
[State -1] ;攻撃キャンセル特種蹴り、コン?中用
type = ChangeState
value = 3100
triggerall = command = "2626_x+y"
triggerall = power >= 2000
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact


[State -1] ;攻撃キャンセル特種蹴り、コン?中用
type = ChangeState
value = 2200
triggerall = command = "2624_x/y"
triggerall = power >= 1000
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact

[State -1] ;攻撃キャンセル特種蹴り、コン?中用
type = ChangeState
value = 2100
triggerall = command = "2626_x/y"
triggerall = power >= 1000
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact

[State -1] ;攻撃キャンセル特種蹴り、コン?中用
type = ChangeState
value = 2000
triggerall = command = "2626_a/b"
triggerall = power >= 1000
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact

;============================================================================================
[State -1] ;攻撃キャンセル特種蹴り、コン?中用
type = ChangeState
value = ifelse(command = "24_b",1750,1700)
triggerall = command = "24_a" ||command = "24_b"
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact

[State -1] ;攻撃キャンセル特種蹴り、コン?中用
type = ChangeState
value = ifelse(command = "4~6_y",1650,1600)
triggerall = command = "4~6_x" ||command = "4~6_y"
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact

[State -1] ;攻撃キャンセル特種蹴り、コン?中用
type = ChangeState
value = ifelse(command = "626_y",1550,1500)
triggerall = command = "626_x" ||command = "626_y"
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact

[State -1] ;攻撃キャンセル特種蹴り、コン?中用
type = ChangeState
value = ifelse(command = "424_y",1350,1300)
triggerall = command = "424_x" ||command = "424_y"
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact

[State -1] ;攻撃キャンセル特種蹴り、コン?中用
type = ChangeState
value = 1400
triggerall = command = "24_x" ||command = "24_y"
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact

[State -1] ;攻撃キャンセル特種蹴り、コン?中用
type = ChangeState
value = ifelse(command = "626_b",1250,1200)
triggerall = command = "626_a" ||command = "626_b"
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact

[State -1] ;攻撃キャンセル特種蹴り、コン?中用
type = ChangeState
value = ifelse(command = "26_y",1150,1100)
triggerall = command = "26_x" ||command = "26_y"
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact

[State -1] ;攻撃キャンセル特種蹴り、コン?中用
type = ChangeState
value = 1030
triggerall = command = "26_a" ||command = "26_b"
triggerall = !NumProj
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact

[State -1] ;攻撃キャンセル特種蹴り、コン?中用
type = ChangeState
value = ifelse(command = "26_b",1010,1000)
triggerall = command = "26_a" ||command = "26_b"
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact

;-------------------------------------------------------------Roll from falling
[State -1]
type = ChangeState
triggerall = Vel Y > 0 && Pos Y >= -20 && alive && (StateNo = 5050 || StateNo = 5071)
trigger1 = Command = "recovery" || Command = "z"
value = 5200

;---------------------------------------------------------------------------

[State -1, T S]
type = ChangeState
value = 710
triggerall = !var(59)
triggerall = RoundState=2
triggerall = command = "recovery" && command = "holdback"
triggerall = statetype != A
trigger1 = ctrl || (stateno = 100 && time >= 3)
trigger2 = power >= 1000
trigger2 = stateno = [150,153]

;---------------------------------------------------------------------------
;前緊急回避
[State -1, T S]
type = ChangeState
value = 700
triggerall = !var(59)
triggerall = RoundState=2
triggerall = command = "recovery"
triggerall = statetype != A
trigger1 = ctrl || (stateno = 100 && time >= 3)
trigger2 = power >= 1000
trigger2 = stateno = [150,153]
trigger3 = stateno = 100

;CD attack
[State -1]
type = ChangeState
value = 500
triggerall = (command = "y" && command = "b") || command = "c"
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact

;CD attack
[State -1]
type = ChangeState
value = 650
triggerall = (command = "y" && command = "b") || command = "c"
triggerall = statetype = A
trigger1 = ctrl
trigger2=(stateno=[600,699]) && movecontact


;---------------------------------------------------------------------------

[State -1, Throw]
type = ChangeState
value = 800
triggerall = !var(59)
triggerall = RoundState=2
triggerall = command = "y"
triggerall = command = "holdfwd" || command = "holdback"
triggerall = statetype != A
triggerall = stateno != 100
trigger1 = p2bodydist X < 10
trigger1 = p2statetype != A && p2movetype != H
trigger1 = ctrl

;------------------------------------------------------------------------------
;K投げ
[State -1, Throw]
type = ChangeState
value = 850
triggerall = !var(59)
triggerall = RoundState=2
triggerall = command = "b"
triggerall = command = "holdfwd" || command = "holdback"
triggerall = statetype != A
triggerall = stateno != 100
trigger1 = p2bodydist X < 10
trigger1 = p2statetype != A && p2movetype != H
trigger1 = ctrl

[State -1, kamae_a]
type = ChangeState
value = 250
triggerall = !var(59)
triggerall = RoundState=2
triggerall = command = "x+y"
triggerall = statetype != A
trigger1 = ctrl || (stateno = 100 && time >= 3)
trigger2 = (stateno = [200,210]) || (stateno = [220,230])
trigger2 = movecontact

[State -1, kamae_a]
type = ChangeState
value = 260
triggerall = !var(59)
triggerall = RoundState=2
triggerall = command = "a+b"
triggerall = statetype != A
trigger1 = ctrl || (stateno = 100 && time >= 3)
trigger2 = (stateno = [200,210]) || (stateno = [220,230])
trigger2 = movecontact

;---------------------------------------------------------------------------



;[State -1] ;攻撃キャンセル特種蹴り、コン?中用
;type = ChangeState
;value = 315
;triggerall = !var(59)
;triggerall = RoundState=2
;triggerall = command != "holddown"
;triggerall = command = "x" && (command = "holdfwd" || command = "holdback")
;triggerall = statetype != A
;triggerall = MoveContact
;trigger1 = StateNo = 200
;trigger2 = StateNo = 210
;trigger3 = StateNo = 215
;trigger4 = StateNo = 220
;trigger5 = StateNo = 230
;trigger6 = StateNo = 400
;trigger7 = StateNo = 410
;trigger8 = StateNo = 420

;===========================================================================
[State -1, Dash]
type = ChangeState
value = 100
triggerall = !var(59)
triggerall = RoundState=2
trigger1 = command = "FF"
trigger1 = statetype != A
trigger1 = ctrl

;バックステップ
[State -1, Back Step]
type = ChangeState
value = 105
triggerall = !var(59)
triggerall = RoundState=2
trigger1 = command = "BB"
trigger1 = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------

;Stand Light Punch
[State -1, Stand Light Punch]
type = ChangeState
value = 206
triggerall = command = "x" && (command = "holdfwd" || command = "holdback")
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 100

;Stand Light Punch
[State -1, Stand Light Punch]
type = ChangeState
value = 200
triggerall = command = "x"
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 100

;Stand Medium Punch Close
[State -1, Stand Medium Punch Close]
type = ChangeState
value = 215
triggerall = p2bodydist X <= 10
triggerall = command = "y"
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,209])&& movecontact
trigger3 = (stateno = [230,239])&& movecontact
trigger4 = (stateno = [400,409])&& movecontact
trigger5 = (stateno = [430,439])&& movecontact
trigger6 = stateno = 100

;Stand Medium Punch
[State -1, Stand Medium Punch]
type = ChangeState
value = 210
triggerall = command = "y"
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,209])&& movecontact
trigger3 = (stateno = [230,239])&& movecontact
trigger4 = (stateno = [400,409])&& movecontact
trigger5 = (stateno = [430,439])&& movecontact
trigger6 = stateno = 100

;---------------------------------------------------------------------------

;Stand Light Kick Close
[State -1, Stand Light Kick Close]
type = ChangeState
value = 235
triggerall = p2bodydist X <= 10
triggerall = command = "a"
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,209])&& movecontact
trigger3 = (stateno = [400,409])&& movecontact
trigger4 = stateno = 100

;Stand Light Kick
[State -1, Stand Light Kick]
type = ChangeState
value = 230
triggerall = command = "a"
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,209])&& movecontact
trigger3 = (stateno = [400,409])&& movecontact
trigger4 = stateno = 100

;Stand Medium Kick Close
[State -1, Stand Medium Kick Close]
type = ChangeState
value = 245
triggerall = p2bodydist X <= 10
triggerall = command = "b"
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,219])&& movecontact
trigger3 = (stateno = [230,239])&& movecontact
trigger4 = (stateno = [400,419])&& movecontact
trigger5 = (stateno = [430,439])&& movecontact
trigger6 = stateno = 100

;Stand Medium Kick
[State -1, Stand Medium Kick]
type = ChangeState
value = 240
triggerall = command = "b"
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,219])&& movecontact
trigger3 = (stateno = [230,239])&& movecontact
trigger4 = (stateno = [400,419])&& movecontact
trigger5 = (stateno = [430,439])&& movecontact
trigger6 = stateno = 100

;---------------------------------------------------------------------------

[State -1] ;挑発、近距離でやると攻撃判定あり、ヒット時にパワ?ゲ?ジもすっげえ減る。
type = ChangeState
triggerall = !var(59)
triggerall = RoundState=2
triggerall = command = "start"
trigger1 = statetype != A && ctrl
value = 198

;---------------------------------------------------------------------------

;Crouching Light Punch
[State -1, Crouching Light Punch]
type = ChangeState
value = 400
triggerall = command = "x"
triggerall = command = "holddown"
triggerall = statetype != A
trigger1 = ctrl  

;Crouching Medium Punch
[State -1, Crouching Medium Punch]
type = ChangeState
value = 410
triggerall = command = "y"
triggerall = command = "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,209])&& movecontact
trigger3 = (stateno = [230,239])&& movecontact
trigger4 = (stateno = [400,409])&& movecontact
trigger5 = (stateno = [430,439])&& movecontact   

;---------------------------------------------------------------------------

;Crouching Light Kick
[State -1, Crouching Light Kick]
type = ChangeState
value = 430
triggerall = command = "a"
triggerall = command = "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,209])&& movecontact
trigger3 = (stateno = [400,409])&& movecontact  

;Crouching Medium Kick
[State -1, Crouching Medium Kick]
type = ChangeState
value = 440
triggerall = command = "b"
triggerall = command = "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,219])&& movecontact
trigger3 = (stateno = [230,239])&& movecontact
trigger4 = (stateno = [400,419])&& movecontact
trigger5 = (stateno = [430,439])&& movecontact
trigger6 = stateno = 100  

;---------------------------------------------------------------------------

[State -1] ;空中弱パン?
type = ChangeState
value = Ifelse(vel x, 605, 600)
triggerall = !var(59)
triggerall = RoundState=2
triggerall = command = "x"
trigger1 = statetype = A && ctrl

[State -1] ;空中強パン?
type = ChangeState
value = Ifelse(vel x, 610, 615)
triggerall = !var(59)
triggerall = RoundState=2
triggerall = command = "y"
trigger1 = statetype = A && ctrl

[State -1] ;空中弱キック
type = ChangeState
value = Ifelse(vel x, 625, 620)
triggerall = !var(59)
triggerall = RoundState=2
triggerall = command = "a"
trigger1 = statetype = A && ctrl

[State -1] ;空中強キック
type = ChangeState
value = Ifelse(vel x, 635, 630)
triggerall = !var(59)
triggerall = RoundState=2
triggerall = command = "b"
trigger1 = statetype = A && ctrl

