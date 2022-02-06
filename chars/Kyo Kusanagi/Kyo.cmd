[Remap]
x = x
y = y
z = z
a = a
b = b
c = c
s = s

;-| 標準化 |-------------------------------------------------------
[Defaults]
command.time = 15
command.buffer.time = 1

;------------------------------------------------------------------------------
;-| MAX超必殺技 |--------------------------------------------------------------

[Command]
name = "hpc1"
command = ~D, F, D, F, c
time = 30

[Command]
name = "hpc2"
command = ~D, B, D, B, c
time = 30

[Command]
name = "hpc3"
command = ~D, F, D, B, c
time = 30

[Command]
name = "hpc4"
command = ~D, B, D, F, c
time = 30

[Command]
name = "hpz1"
command = ~D, F, D, F, z
time = 30

[Command]
name = "hpz2"
command = ~D, B, D, B, z
time = 30

;------------------------------------------------------------------------------
;-| 超必殺技 |-----------------------------------------------------------------

[Command]
name = "hp6a"
command = ~D, F, D, B, x
time = 30
[Command]
name = "hp6b"
command = ~D, F, D, B, y
time = 30

[Command]
name = "hp5x"
command = ~D, F, D, B, a
time = 30
[Command]
name = "hp5y"
command = ~D, F, D, B, b
time = 30

[Command]
name = "hp4a"
command = ~D, B, D, B, b
time = 30
[Command]
name = "hp4b"
command = ~D, B, D, B, a
time = 30

[Command]
name = "hp3x"
command = ~D, B, D, B, x
time = 30
[Command]
name = "hp3y"
command = ~D, B, D, B, y
time = 30

[Command]
name = "hp2b"
command = ~D, F, D, F, b
time = 30
[Command]
name = "hp2a"
command = ~D, F, D, F, a
time = 30

[Command]
name = "hp1x"
command = ~D, F, D, F, x
time = 30
[Command]
name = "hp1y"
command = ~D, F, D, F, y
time = 30

;------------------------------------------------------------------------------
;-| 必殺技 |-------------------------------------------------------------------

[Command]
name = "sp1x"
command = ~B, D, DF, x
time = 30
[Command]
name = "sp1y"
command = ~B, D, DF, y
time = 30

[Command]
name = "sp2x"
command = ~F, D, DF, x
time = 30
[Command]
name = "sp2x"
command = ~F, D, DF, y
time = 30

[Command]
name = "sp3a"
command = ~D, DB, B, a
time = 30
[Command]
name = "sp3b"
command = ~D, DB, B, b
time = 30

[Command]
name = "sp4a"
command = ~B, D, DF, a
time = 30
[Command]
name = "sp4b"
command = ~B, D, DF, b
time = 30

[Command]
name = "sp5x"
command = ~D, DF, F, x
time = 30
[Command]
name = "sp5y"
command = ~D, DF, F, y
time = 30

[Command]
name = "sp6a"
command = ~D, DF, F, a
time = 30
[Command]
name = "sp6b"
command = ~D, DF, F, b
time = 30

[Command]
name = "sp7x"
command = ~B, D, DB, x
time = 30
[Command]
name = "sp7y"
command = ~B, D, DB, y
time = 30

[Command]
name = "sp8x"
command = ~D, DB, B, x
time = 30
[Command]
name = "sp8y"
command = ~D, DB, B, y
time = 30

[Command]
name = "sp9a"
command = ~F, D, DF, a
time = 30
[Command]
name = "sp9b"
command = ~F, D, DF, b
time = 30

[Command]
name = "jump"
command = D, $U
time = 12

;------------------------------------------------------------------------------
;-| キー２回連続入力 |---------------------------------------------------------
[Command]
name = "FF"     ;要求済み (キーの変更は可能ですが名前を変えたり無効にしてはいけません)
command = F, F
time = 10

[Command]
name = "BB"     ;要求済み (キーの変更は可能ですが名前を変えたり無効にしてはいけません)
command = B, B
time = 10

;------------------------------------------------------------------------------
;-| 同時押し |-----------------------------------------------------------------
[Command]
name = "debug"
command = c+z
time = 1

[Command]
name = "ふっとばし攻撃"
command = y+b
time = 1

[Command]
name = "ふっとばし攻撃"
command = z
time = 1

[Command]
name = "MAX発動"
command = a+y
time = 1

[Command]
name = "MAX発動"
command = c
time = 1

[Command]
name = "recovery"   ;要求済み (キーの変更は可能ですが名前を変えたり無効にしてはいけません)
command = x+a
time = 1

[Command]
name = "x+y"
command = x+y
time = 1

[Command]
name = "a+b"
command = a+b
time = 1

;------------------------------------------------------------------------------
;-| 方向キー＋ボタン |---------------------------------------------------------

[Command]
name = "down_a"
command = /$D,a
time = 1

[Command]
name = "down_b"
command = /$D,b
time = 1

;------------------------------------------------------------------------------
;-| ボタン単発 |---------------------------------------------------------------
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

[command]
name = "fwd"
command = F
time = 1

[command]
name = "back"
command = B
time = 1

[command]
name = "up"
command = U
time = 1

[command]
name = "down"
command = D
time = 1

;------------------------------------------------------------------------------
;-| 押しっぱなし |-------------------------------------------------------------

[Command]
name = "holdfwd"   ;要求済み (キーの変更は可能ですが名前を変えたり無効にしてはいけません)
command = /$F
time = 1

[Command]
name = "holdback"  ;要求済み (キーの変更は可能ですが名前を変えたり無効にしてはいけません)
command = /$B
time = 1

[Command]
name = "holdup"    ;要求済み (キーの変更は可能ですが名前を変えたり無効にしてはいけません)
command = /$U
time = 1

[Command]
name = "holddown"  ;要求済み (キーの変更は可能ですが名前を変えたり無効にしてはいけません)
command = /$D
time = 1

[Command]
name = "holdxy"
command = /$x+y
time = 1

[Command]
name = "holdab"
command = /$a+b
time = 1

[Command]
name = "holda"
command = /$a
time = 1

[Command]
name = "holdb"
command = /$b
time = 1

[Command]
name = "holdc"
command = /$c
time = 1

[Command]
name = "holdx"
command = /$x
time = 1

[Command]
name = "holdy"
command = /$y
time = 1

[Command]
name = "holdz"
command = /$z
time = 1

;------------------------------------------------------------------------------
;-| AI起動用 |-----------------------------------------------------------------

;判定用[Command]
[Command]
name = "F"
command = $F
time = 1
[Command]
name = "B"
command = $B
time = 1
[Command]
name = "U"
command = $U
time = 1
[Command]
name = "D"
command = $D
time = 1


;------------------------------------------------------------------------------

;==============================================================================
;------------------------------------------------------------------------------

[Statedef -1];←この行は絶対に消さないでください。必須の項目です。

;==============================================================================
;MAX2
;==============================================================================
;伍百弐拾四式・神塵
[State -1, KAMUKURA]
type = ChangeState
value = 4000
triggerall = command = "hpc1"
triggerall = power >= 3000
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact

;------------------------------------------------------------------------------
;6321463214BD
[State -1, 6321463214BD]
type = ChangeState
value = 4300
triggerall = command = "hpc2"
triggerall = power >= 3000
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact

;------------------------------------------------------------------------------
;2141236BD
[State -1, 2141236BD]
type = ChangeState
value = 4200
triggerall = command = "hpc3"
triggerall = power >= 3000
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact

;------------------------------------------------------------------------------
;236236AC
[State -1, 236236AC]
type = ChangeState
value = 4100
triggerall = command = "hpc4"
triggerall = power >= 3000
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact

;==============================================================================
;MAX超必殺技
;==============================================================================
;MAX裏百八式・大蛇薙
[State -1, MAX裏百八式・大蛇薙]
type = ChangeState
value = 3050
triggerall = command = "hpz1"
triggerall = power >= 2000
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact

;------------------------------------------------------------------------------
;236236AC
[State -1, 236236AC]
type = ChangeState
value = 3250
triggerall = command = "hpz2"
triggerall = power >= 2000
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact

;==============================================================================
;超必殺技
;==============================================================================
;弱裏百八式・大蛇薙
[State -1, 弱裏百八式・大蛇薙]
type = ChangeState
value = 3000
triggerall = command = "hp1x"
triggerall = power >= 1000
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact

;強裏百八式・大蛇薙
[State -1, 強裏百八式・大蛇薙]
type = ChangeState
value = 3010
triggerall = command = "hp1y"
triggerall = power >= 1000
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact

;------------------------------------------------------------------------------
;236236A
[State -1, 236236A]
type = ChangeState
value = 3200
triggerall = command = "hp2a"
triggerall = power >= 1000
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact

;236236C
[State -1, 236236C]
type = ChangeState
value = 3210
triggerall = command = "hp2b"
triggerall = power >= 1000
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact

;------------------------------------------------------------------------------
;236236A
[State -1, 236236A]
type = ChangeState
value = 3300
triggerall = command = "hp4a"
triggerall = power >= 1000
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact

;236236C
[State -1, 236236C]
type = ChangeState
value = 3310
triggerall = command = "hp4b"
triggerall = power >= 1000
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact

;------------------------------------------------------------------------------
;236236BorD
[State -1, 236236BorD]
type = ChangeState
value = 3800
triggerall = command = "hp3x"
triggerall = power >= 1000
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact

;236236BorD
[State -1, 236236BorD]
type = ChangeState
value = 3800
triggerall = command = "hp3y"
triggerall = power >= 1000
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact

;------------------------------------------------------------------------------
;236236BorD
[State -1, 236236BorD]
type = ChangeState
value = 3600
triggerall = command = "hp5x"
triggerall = power >= 1000
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact

;236236BorD
[State -1, 236236BorD]
type = ChangeState
value = 3610
triggerall = command = "hp5y"
triggerall = power >= 1000
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact

;------------------------------------------------------------------------------
;236236BorD
[State -1, 236236BorD]
type = ChangeState
value = 3700
triggerall = command = "hp6a"
triggerall = power >= 1000
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact

;236236BorD
[State -1, 236236BorD]
type = ChangeState
value = 3700
triggerall = command = "hp6b"
triggerall = power >= 1000
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact

;==============================================================================
;必殺技
;==============================================================================

;------------------------------------------------------------------------------

[State -1, 214A]
type = ChangeState
value = 1900
triggerall = command = "sp9a"
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact

[State -1, 214C]
type = ChangeState
value = 1910
triggerall = command = "sp9b"
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact

;------------------------------------------------------------------------------

[State -1, 214A]
type = ChangeState
value = 1300
triggerall = command = "sp7x"
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact

[State -1, 214C]
type = ChangeState
value = 1310
triggerall = command = "sp7y"
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact

;------------------------------------------------------------------------------

[State -1, 63214B]
type = ChangeState
value = 1400
triggerall = command = "sp1x"
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact

[State -1, 63214D]
type = ChangeState
value = 1410
triggerall = command = "sp1y"
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact

;------------------------------------------------------------------------------
;弱百式・鬼焼き
[State -1, 弱百式・鬼焼き]
type = ChangeState
value = 1100
triggerall = command = "sp2x"
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact

;------------------------------------------------------------------------------
[State -1, 623B]
type = ChangeState
value = 1500
triggerall = command = "sp3a"
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact

[State -1, 623D]
type = ChangeState
value = 1510
triggerall = command = "sp3b"
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact

;------------------------------------------------------------------------------
[State -1, 421B]
type = ChangeState
value = 1800
triggerall = command = "sp4a"
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact

[State -1, 421D]
type = ChangeState
value = 1810
triggerall = command = "sp4b"
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact

;------------------------------------------------------------------------------
[State -1, 236A]
type = ChangeState
value = 1600
triggerall = command = "sp5x"
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact

[State -1, 236C]
type = ChangeState
value = 1700
triggerall = command = "sp5y"
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact

;------------------------------------------------------------------------------
;弱七拾五式・改
[State -1, 弱七拾五式・改]
type = ChangeState
value = 1200
triggerall = command = "sp6a"
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact

;強七拾五式・改
[State -1, 強七拾五式・改]
type = ChangeState
value = 1210
triggerall = command = "sp6b"
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact

;------------------------------------------------------------------------------

[State -1, 214A]
type = ChangeState
value = 1000
triggerall = command = "sp8x"
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact

[State -1, 214C]
type = ChangeState
value = 1010
triggerall = command = "sp8y"
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact

;==============================================================================
;各種システム
;==============================================================================

;ガードキャンセル後方緊急回避
[State -1, ガードキャンセル後方緊急回避]
type = ChangeState
value = 710
triggerall = command = "holdback"
triggerall = (command = "x" && command = "a") || command = "z"
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact

;クイック緊急回避
[State -1, クイック緊急回避]
type = ChangeState
value = 700
triggerall = (command = "x" && command = "a") || command = "z"
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact

;------------------------------------------------------------------------------

;CD attack
[State -1]
type = ChangeState
value = 550
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
;P投げ
[State -1, Throw]
type = ChangeState
value = 800
triggerall = command = "y"
triggerall = command = "holdfwd" || command = "holdback"
triggerall = statetype = S
triggerall = p2bodydist X <= 15
triggerall = ctrl
triggerall = stateno != [100,101]
trigger1 = (p2statetype = S) || (p2statetype = C)
trigger1 = p2movetype != H

;K投げ
[State -1, Throw]
type = ChangeState
value = 805
triggerall = command = "b"
triggerall = command = "holdfwd" || command = "holdback"
triggerall = statetype = S
triggerall = p2bodydist X <= 15
triggerall = ctrl
triggerall = stateno != [100,101]
trigger1 = (p2statetype = S) || (p2statetype = C)
trigger1 = p2movetype != H

;------------------------------------------------------------------------------
;挑発
[State -1, Taunt]
type = ChangeState
value = 160
triggerall = command = "start"
triggerall = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------
;ダッシュ
[State -1, Dash]
type = ChangeState
value = 100
trigger1 = command = "FF"
trigger1 = statetype = S
trigger1 = ctrl

;バックステップ
[State -1, Back Step]
type = ChangeState
value = 105
trigger1 = command = "BB"
trigger1 = statetype = S
trigger1 = ctrl

;==============================================================================
;通常技
;==============================================================================

;Stand Light Punch Close
[State -1, Stand Light Punch Close]
type = ChangeState
value = 205
triggerall = p2bodydist X <= 10
triggerall = command = "x"
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

;Stand Medium Punch
[State -1, Stand Medium Punch]
type = ChangeState
value = 216
triggerall = command = "y"
triggerall = command = "holdfwd"
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,209])&& movecontact
trigger3 = (stateno = [230,239])&& movecontact
trigger4 = (stateno = [400,409])&& movecontact
trigger5 = (stateno = [430,439])&& movecontact
trigger6 = stateno = 100

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

;------------------------------------------------------------------------------

;Stand Light Kick Fwd
[State -1, Stand Light Kick Fwd]
type = ChangeState
value = 236
triggerall = (Command = "a") && (Command = "holdfwd")
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,209])&& movecontact
trigger3 = (stateno = [400,409])&& movecontact
trigger4 = stateno = 100

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
value = 246
triggerall = command = "b"
triggerall = command != "holddown"
triggerall = command = "holdfwd"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,219])&& movecontact
trigger3 = (stateno = [230,239])&& movecontact
trigger4 = (stateno = [400,419])&& movecontact
trigger5 = (stateno = [430,439])&& movecontact
trigger6 = stateno = 100

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

;------------------------------------------------------------------------------

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
value = 415
triggerall = command = "y"
triggerall = command = "holddown"
triggerall = command = "holdfwd"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,209])&& movecontact
trigger3 = (stateno = [230,239])&& movecontact
trigger4 = (stateno = [400,409])&& movecontact
trigger5 = (stateno = [430,439])&& movecontact   

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

;------------------------------------------------------------------------------

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
value = 445
triggerall = command = "b"
triggerall = command = "holdfwd"
triggerall = command = "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,219])&& movecontact
trigger3 = (stateno = [230,239])&& movecontact
trigger4 = (stateno = [400,419])&& movecontact
trigger5 = (stateno = [430,439])&& movecontact
trigger6 = stateno = 100  

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

;------------------------------------------------------------------------------

;ジャンプ弱パンチ
[State -1, Jump Light Punch]
type = ChangeState
value = 600
triggerall = command = "x"
trigger1 = statetype = A
trigger1 = ctrl

;外式・奈落落とし
[State -1, 外式・奈落落とし]
type = ChangeState
value = 320
triggerall = command = "y"
triggerall = vel X = 0
triggerall = statetype = A
trigger1 = ctrl

;ジャンプ強パンチ
[State -1, Jump Strong Punch]
type = ChangeState
value = 610
triggerall = command = "y"
triggerall = vel X != 0
triggerall = statetype = A
trigger1 = ctrl

;------------------------------------------------------------------------------
;ジャンプ弱キック
[State -1, Jump Light Kick]
type = ChangeState
value = 630
triggerall = command = "a"
trigger1 = statetype = A
trigger1 = ctrl

;ジャンプ強キック
[State -1, Jump Strong Kick]
type = ChangeState
value = 640
triggerall = command = "b"
trigger1 = statetype = A
trigger1 = ctrl
