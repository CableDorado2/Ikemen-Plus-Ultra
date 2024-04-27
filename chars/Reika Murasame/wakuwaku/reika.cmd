;麗華の技コマンド


;-| Default Values |-------------------------------------------------------
[Defaults]
command.time = 15

command.buffer.time = 1

                    
;-| AI用 |---------------------------------------------------------

[Command]
name = "AI_01"
Command = a, a, a, a, a, a
time = 0

[Command]
name = "AI_02"
Command = b, b, b, b, b, b
time = 0

[Command]
name = "AI_03"
Command = c, c, c, c, c, c
time = 0

[Command]
name = "AI_04"
Command = x, x, x, x, x, x
time = 0

[Command]
name = "AI_05"
Command = y, y, y, y, y, y
time = 0

[Command]
name = "AI_06"
Command = z, z, z, z, z, z
time = 0

[Command]
name = "AI_07"
Command = a, a, a, a, a, a, b
time = 0

[Command]
name = "AI_08"
Command = a, a, a, a, a, a, c
time = 0

[Command]
name = "AI_09"
Command = a, a, a, a, a, a, x
time = 0

[Command]
name = "AI_10"
Command = a, a, a, a, a, a, y
time = 0

[Command]
name = "AI_11"
Command = a, a, a, a, a, a, z
time = 0

[Command]
name = "AI_12"
Command = b, b, b, b, b, b, a
time = 0

[Command]
name = "AI_13"
Command = b, b, b, b, b, b, c
time = 0

[Command]
name = "AI_14"
Command = b, b, b, b, b, b, x
time = 0

[Command]
name = "AI_15"
Command = b, b, b, b, b, b, y
time = 0

[Command]
name = "AI_16"
Command = b, b, b, b, b, b, z
time = 0

[Command]
name = "AI_17"
Command = c, c, c, c, c, c, a
time = 0

[Command]
name = "AI_18"
Command = c, c, c, c, c, c, b
time = 0

[Command]
name = "AI_19"
Command = c, c, c, c, c, c, x
time = 0

[Command]
name = "AI_20"
Command = c, c, c, c, c, c, y
time = 0

[Command]
name = "AI_21"
Command = c, c, c, c, c, c, z
time = 0

[Command]
name = "AI_22"
Command = x, x, x, x, x, x, a
time = 0

[Command]
name = "AI_23"
command = x, x, x, x, x, x, b
time = 0

[Command]
name = "AI_24"
command = x, x, x, x, x, x, c
time = 0

[Command]
name = "AI_25"
command = x, x, x, x, x, x, y
time = 0

[Command]
name = "AI_26"
command = x, x, x, x, x, x, z
time = 0

[Command]
name = "AI_27"
command = y, y, y, y, y, y, a
time = 0

[Command]
name = "AI_28"
command = y, y, y, y, y, y, b
time = 0

[Command]
name = "AI_29"
command = y, y, y, y, y, y, c
time = 0

[Command]
name = "AI_30"
command = y, y, y, y, y, y, x
time = 0

[Command]
name = "AI_31"
command = y, y, y, y, y, y, z
time = 0

[Command]
name = "AI_32"
command = z, z, z, z, z, z, a
time = 0

[Command]
name = "AI_33"
command = z, z, z, z, z, z, b
time = 0

[Command]
name = "AI_34"
command = z, z, z, z, z, z, c
time = 0

[Command]
name = "AI_35"
command = z, z, z, z, z, z, x
time = 0

[Command]
name = "AI_36"
command = z, z, z, z, z, z, y
time = 0

[Command]
name = "AI_37"
command = F, F, F, F, F, F
time = 0

[Command]
name = "AI_38"
command = B, B, B, B, B, B
time = 0

[Command]
name = "AI_39"
command = U, U, U, U, U, U
time = 0

[Command]
name = "AI_40"
command = D, D, D, D, D, D
time = 0

[Command]
name = "AI_41"
command = F, F, F, F, F, F, B
time = 0

[Command]
name = "AI_42"
command = F, F, F, F, F, F, U
time = 0

[Command]
name = "AI_43"
command = F, F, F, F, F, F, D
time = 0

[Command]
name = "AI_44"
command = B, B, B, B, B, B, F
time = 0

[Command]
name = "AI_45"
command = B, B, B, B, B, B, U
time = 0

[Command]
name = "AI_46"
command = B, B, B, B, B, B, D
time = 0

[Command]
name = "AI_47"
command = U, U, U, U, U, U, F
time = 0

[Command]
name = "AI_48"
command = U, U, U, U, U, U, B
time = 0

[Command]
name = "AI_49"
command = U, U, U, U, U, U, D
time = 0

[Command]
name = "AI_50"
command = D, D, D, D, D, D, F
time = 0

;-| Super Motions |--------------------------------------------------------
[Command];１４連斬
name = "14"
command = ~F,D,B,F, y
time = 25

[Command];紅蓮大斬
name = "guren"
command = ~D, DB,B, y

[Command];真刃牙
name = "majin"
command = ~D, DF, F, y

[Command];天覇断空裂斬
name = "danku"
command = ~D, DF, F, y+b

;-| Special Motions |------------------------------------------------------
[Command]
name = "upper_x"
command = ~F, D, DF, x

[Command]
name = "zero"
command = ~F,DF,D,DB,B, b

[Command]
name = "te"
command = ~D, DF, F, b

[Command]
name = "senpu"
command = ~D, DF, F,b

[Command]
name = "ura"
command = ~D, B, b
time = 20

[Command]
name = "zanba"
command = ~D, DF, F, x

[Command]
name = "a3"
command = ~D, DB, B, a

[Command]
name = "souryu"
command = ~D, DB, B, D, DB, a
time = 20

[Command]
name = "QCF_y"
command = ~D, DF, F, y

[Command]
name = "QCF_xy"
command = ~D, DF, F, x+y

[Command]
name = "QCB_x"
command = ~D, DB, B, x

[Command]
name = "QCB_y"
command = ~D, DB, B, y

[Command]
name = "QCB_xy"
command = ~D, DB, B, x+y

[Command]
name = "FF_ab"
command = F, F, a+b

[Command]
name = "FF_a"
command = F, F, a

[Command]
name = "FF_b"
command = F, F, b

;-| Double Tap |-----------------------------------------------------------
[Command]
name = "FF"     ;Required (do not remove)
command = F, F
time = 10

[Command]
name = "BB"     ;Required (do not remove)
command = B, B
time = 10

;-| 2/3 Button Combination |-----------------------------------------------

[Command]
name = "ryusui"
command = x+a

[Command]
name = "cd"
command = y+b

[Command]
name = "recovery";Required (do not remove)
command = x+y
time = 1

;-| Dir + Button |---------------------------------------------------------

[Command]
name = "maex"
command = /F,x
time =1

[Command]
name = "maea"
command = /F,a
time = 1

[Command]
name = "a2"
command = /$DF,a
time = 1

[Command]
name = "down_a"
command = /$D,a
time = 1

[Command]
name = "down_b"
command = /$D,b
time = 1

;-| Single Button |---------------------------------------------------------
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
name = "holdup2" ;Required (do not remove)
command = /U
time = 1

[command]
name="fwd"
command=F
time=1

[command]
name="back"
command=B
time=1

[command]
name="up"
command=U
time=1

[command]
name="down"
command=D
time=1

;-| Hold Dir |--------------------------------------------------------------
[Command]
name = "holdfwd";Required (do not remove)
command = /$F
time = 1

[Command]
name = "holdback";Required (do not remove)
command = /$B
time = 1

[Command]
name = "holdup" ;Required (do not remove)
command = /$U
time = 1

[Command]
name = "holddown";Required (do not remove)
command = /$D
time = 1

[Statedef -1]
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; タッグチームモード関連記述 TAG TEAM MODE
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
[State -1, tag LV3]
type = ChangeState
value = 46000
triggerall = var(59) < 1
triggerall = command = "holddown" && command = "c" && command = "z"
triggerall = Var(51) = 1
triggerall = partner, life > 0
triggerall = power >= 3000
trigger1 = (StateType != A) && (Ctrl = 1)

[State -1, tag]
type = ChangeState
value = 45100
triggerall = var(59) < 1
triggerall = command = "c" && command = "z"
triggerall = Var(51) = 1
triggerall = partner, life > 0
trigger1 = (StateType != A) && (Ctrl = 1)
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 終了 END
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;===========================================================================
;天覇断空裂斬
[State -1,]
type = ChangeState
value = 20000
triggerall = var(59) < 1
triggerall = command = "danku"
;triggerall = var(10) = 100
triggerall = NumHelper(4500)= 0
triggerall = NumHelper(4600)= 0
triggerall = NumHelper(4601)= 0
triggerall = NumHelper(4605)= 0
Triggerall = anim != 4
trigger1 = palno = 6
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,239])
trigger2 = movecontact
trigger3 = (stateno = [400,430])
trigger3 = movecontact

;---------------------------------------------------------------------------
; １４連ムラサメブラスター
[State -1,]
type = ChangeState
value = 7005
triggerall = var(59) < 1
triggerall = command = "14"
triggerall = power >= 3000
triggerall = var(10) > 50
triggerall = NumHelper(4500)= 0
triggerall = NumHelper(4600)= 0
triggerall = NumHelper(4601)= 0
triggerall = NumHelper(4605)= 0
Triggerall = anim != 4
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,239])
trigger2 = movecontact
trigger3 = (stateno = [400,430])
trigger3 = movecontact

;---------------------------------------------------------------------------
; 真・刃牙・・・マジンガー
[State -1,]
type = ChangeState
value = 3998
triggerall = var(59) < 1
triggerall = command = "majin"
triggerall = power >= 1000
triggerall = NumHelper(4500)= 0
triggerall = NumHelper(4600)= 0
triggerall = NumHelper(4601)= 0
triggerall = NumHelper(4605)= 0
Triggerall = anim != 4
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,239])
trigger2 = movecontact
trigger3 = (stateno = [400,430])
trigger3 = movecontact
;---------------------------------------------------------------------------
; 紅蓮大斬・・・グレンダイザー
[State -1,]
type = ChangeState
value = 3999
triggerall = var(59) < 1
triggerall = command = "guren"
triggerall = power >= 1000
triggerall = NumHelper(4500)= 0
triggerall = NumHelper(4600)= 0
triggerall = NumHelper(4601)= 0
triggerall = NumHelper(4605)= 0
Triggerall = anim != 4
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,239])
trigger2 = movecontact
trigger3 = (stateno = [400,430])
trigger3 = movecontact
;===========================================================================

;---------------------------------------------------------------------------
;ゼロストラッシュ
[State -1, ]
type = ChangeState
value = 2000
triggerall = var(59) < 1
triggerall = command = "zero"
Triggerall = anim != 4
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,239])
trigger2 = movecontact
trigger3 = (stateno = [400,430])
trigger3 = movecontact

;---------------------------------------------------------------------------
;村雨流・旋風剣
[State -1, ]
type = ChangeState
value = 2500
triggerall = var(59) < 1
triggerall = command = "senpu"
Triggerall = anim != 4
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,239])
trigger2 = movecontact
trigger3 = (stateno = [400,430])
trigger3 = movecontact


;---------------------------------------------------------------------------
;村雨流・斬波
[State -1, ]
type = ChangeState
value = 1000
triggerall = var(59) < 1
triggerall = command = "zanba"
Triggerall = anim != 4
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,239])
trigger2 = movecontact
trigger3 = (stateno = [400,430])
trigger3 = movecontact

;---------------------------------------------------------------------------
;村雨流・流水
[State -1, ]
type = ChangeState
value = 1300
triggerall = var(59) < 1
triggerall = command = "ryusui"
Triggerall = anim != 4
trigger1 = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------
;双龍飛転脚
[State -1, Stand Light Kick]
type = ChangeState
value = 1605
triggerall = var(59) < 1
triggerall = command = "souryu"
Triggerall = anim != 4
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,239])
trigger2 = movecontact
trigger3 = (stateno = [400,430])
trigger3 = movecontact

;trigger2 = stateno = 235
;trigger2= movecontact= 1

;---------------------------------------------------------------------------
;飛転脚
[State -1, Stand Light Kick]
type = ChangeState
value = 1305;231
triggerall = var(59) < 1
triggerall = command = "a3"
Triggerall = anim != 4
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = [200,239])
trigger2 = movecontact
trigger3 = (stateno = [400,430])
trigger3 = movecontact

;trigger2 = stateno = 235
;trigger2= movecontact= 1

;---------------------------------------------------------------------------
;近接ダッシュ
[State -1, Run Fwd]
type = ChangeState
value = 107
triggerall = var(59) < 1
Triggerall = anim != 4
trigger1 = command = "FF"
trigger1 = statetype = S
trigger1 = p2bodydist X <= 20
trigger1 = ctrl

;---------------------------------------------------------------------------
;Run Fwd
;ダッシュ
[State -1, Run Fwd]
type = ChangeState
value = 100
triggerall = var(59) < 1
Triggerall = anim != 4
trigger1 = command = "FF"
trigger1 = statetype = S
trigger1 = p2bodydist X > 20
trigger1 = ctrl

;---------------------------------------------------------------------------
;Run Back
;後退ダッシュ
[State -1, Run Back]
type = ChangeState
value = 105
triggerall = var(59) < 1
Triggerall = anim != 4
trigger1 = command = "BB"
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
;ガードキャンセル
[State 1505, 9]
type=ChangeState
value= 350
triggerall = var(59) < 1
triggerall = power >= 1000
triggerall = command = "y"
Triggerall = anim != 4
trigger1 = stateno = 150
trigger2 = stateno = 152

;---------------------------------------------------------------------------
;投げ （通常）
[State -1, Kung Fu Throw]
type = ChangeState
value = 800
triggerall = var(59) < 1
triggerall = command = "b"
triggerall = statetype = S
triggerall = ctrl
triggerall = p2stateno != 40
triggerall = stateno != 100
Triggerall = anim != 4
trigger1 = command = "holdfwd"
trigger1 = p2bodydist X < 3
trigger1 = (p2statetype = S) || (p2statetype = C)
trigger1 = p2movetype != H
trigger2 = command = "holdback"
trigger2 = p2bodydist X < 5
trigger2 = (p2statetype = S) || (p2statetype = C)
trigger2 = p2movetype != H

;---------------------------------------------------------------------------
;投げ（裏）
[State -1, Kung Fu Throw]
type = ChangeState
value = 801
triggerall = var(59) < 1
triggerall = command = "y"
triggerall = statetype = S
triggerall = ctrl
triggerall = p2stateno != 40
triggerall = stateno != 100
Triggerall = anim != 4
trigger1 = command = "holdfwd"
trigger1 = p2bodydist X < 3
trigger1 = (p2statetype = S) || (p2statetype = C)
trigger1 = p2movetype != H
trigger2 = command = "holdback"
trigger2 = p2bodydist X < 5
trigger2 = (p2statetype = S) || (p2statetype = C)
trigger2 = p2movetype != H

;---------------------------------------------------------------------------
; 刀呼び
[State -1, Taunt]
type = ChangeState
value = 2300
triggerall = var(59) < 1
triggerall = command = "c"||command = "cd"
triggerall = NumExplod(8030)= 1
Triggerall = anim != 4
trigger1 = numhelper(2310) = 0
trigger1 = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------
; 刀交換
[State -1, Taunt]
type = ChangeState
value = 2410
triggerall = var(59) < 1
triggerall = command = "c"||command = "cd"
triggerall = numhelper(2310) = 1
triggerall = numhelper(2351) = 1
Triggerall = anim != 4
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,239])
trigger2 = movecontact
trigger3 = (stateno = [400,430])
trigger3 = movecontact
;---------------------------------------------------------------------------
;Taunt
;挑発
[State -1, Taunt]
type = ChangeState
value = 195
triggerall = var(59) < 1
triggerall = command = "start"
Triggerall = anim != 4
trigger1 = statetype != A
trigger1 = ctrl

;===========================================================================
;---------------------------------------------------------------------------
;立ち弱パンチ（近距離）
[State -1, Stand Light Punch]
type = ChangeState
value = 200
triggerall = var(59) < 1
triggerall = command = "x"
triggerall = command != "holddown"
triggerall = p2bodydist X <= 20
Triggerall = anim != 4
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 200) && time > 10
trigger3 = stateno = 200
trigger3 = movecontact= 1
;--------------------------------------------------------------------------
;立ち弱パンチ（遠距離）
[State -1, Stand Light Punch]
type = ChangeState
value = 205
triggerall = var(59) < 1
triggerall = command = "x"
triggerall = command != "holddown"
triggerall = p2bodydist X > 20
Triggerall = anim != 4
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 205) && time > 10
trigger3 = stateno = 200
trigger3 = movecontact= 1
;---------------------------------------------------------------------------
;Stand Strong Punch
;立ちふっとばし
[State -1, Stand Strong Punch]
type = ChangeState
value = 240
triggerall = var(59) < 1
triggerall = command = "y"
;triggerall = command != "holddown"
triggerall = StateNo != 100
Triggerall = anim != 4
trigger1 = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
;Stand Strong Punch
;立ち斬り（近距離）
[State -1, Stand Strong Punch]
type = ChangeState
value = 210
triggerall = var(59) < 1
triggerall = command = "b"
triggerall = command != "holddown"
triggerall = p2bodydist X <= 20
Triggerall = anim != 4
trigger1 = statetype = S
trigger1 = ctrl
;---------------------------------------------------------------------------
;Stand Strong Punch
;立ち斬り（遠距離）
[State -1, Stand Strong Punch]
type = ChangeState
value = 220
triggerall = var(59) < 1
triggerall = command = "b"
triggerall = command != "holddown"
triggerall = p2bodydist X > 20
Triggerall = anim != 4
trigger1 = statetype = S
trigger1 = ctrl
;---------------------------------------------------------------------------
;レバー前キック
[State -1,Stand Light Kick2]
type = ChangeState
value = 238
triggerall = var(59) < 1
triggerall = command = "maea"
triggerall = command != "holddown"
Triggerall = anim != 4
trigger1 = statetype = S
trigger1 = ctrl= 1
trigger2 = stateno = 230
trigger2 = movecontact= 1
;---------------------------------------------------------------------------
;立ち弱キック（遠距離）
[State -1, Stand Light Kick]
type = ChangeState
value = 230
triggerall = var(59) < 1
triggerall = command = "a"
triggerall = command != "holddown"
triggerall = p2bodydist X > 20
Triggerall = anim != 4
trigger1 = statetype = S
trigger1 = ctrl
;trigger2 = (stateno = 230) && time > 25

;---------------------------------------------------------------------------
;立ち弱キック（近距離）
[State -1, Stand Light Kick]
type = ChangeState
value = 235
triggerall = var(59) < 1
triggerall = command = "a"
triggerall = command != "holddown"
triggerall = p2bodydist X <= 20
Triggerall = anim != 4
trigger1 = statetype = S
trigger1 = ctrl
;trigger2 = (stateno = 235) && time > 12
;---------------------------------------------------------------------------
;Crouching Light Punch
;しゃがみ弱パンチ
[State -1, Crouching Light Punch]
type = ChangeState
value = 400
triggerall = var(59) < 1
triggerall = command = "x"
triggerall = command = "holddown"
Triggerall = anim != 4
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = (stateno = 400) && time > 8
;---------------------------------------------------------------------------
;しゃがみ斬り
[State -1, Crouching Strong Punch]
type = ChangeState
value = 410
triggerall = var(59) < 1
triggerall = command = "b"
triggerall = command = "holddown"
Triggerall = anim != 4
trigger1 = statetype = C
trigger1 = ctrl

;---------------------------------------------------------------------------
;しゃがみキック
[State -1, Crouching Light Kick]
type = ChangeState
value = 430
triggerall = var(59) < 1
triggerall = command = "a"
triggerall = command = "holddown"
Triggerall = anim != 4
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = stateno = 400
trigger2 = movecontact= 1
trigger3 = stateno = 230
trigger3 = movecontact= 1
;---------------------------------------------------------------------------
;空中パンチ（斜め）
[State -1, Jump Light Punch]
type = ChangeState
value = 600
triggerall = var(59) < 1
triggerall = command = "x"
triggerall = Vel X != 0
Triggerall = anim != 4
trigger1 = statetype = A
trigger1 = ctrl

;---------------------------------------------------------------------------
;空中パンチ（垂直）
[State -1, Jump Light Punch]
type = ChangeState
value = 605
triggerall = var(59) < 1
triggerall = command = "x"
triggerall = Vel X = 0
Triggerall = anim != 4
trigger1 = statetype = A
trigger1 = ctrl

;---------------------------------------------------------------------------
;空中斬り（斜め）
[State -1, Jump Strong Punch]
type = ChangeState
value = 610
triggerall = var(59) < 1
triggerall = command = "b"
triggerall = Vel X != 0
Triggerall = anim != 4
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600; || stateno = 635 ;jump_x or jump_a
trigger2 = movecontact

;---------------------------------------------------------------------------
;空中斬り（垂直）
[State -1, Jump Strong Punch]
type = ChangeState
value = 615
triggerall = var(59) < 1
triggerall = command = "b"
triggerall = Vel X = 0
Triggerall = anim != 4
trigger1 = statetype = A
trigger1 = ctrl

;---------------------------------------------------------------------------
;空中ふっとばし
[State -1, Jump Strong Punch]
type = ChangeState
value = 640
triggerall = var(59) < 1
triggerall = command = "y"
Triggerall = anim != 4
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 || stateno = 630 ;jump_x or jump_a
trigger2 = movecontact

;---------------------------------------------------------------------------
;空中キック（斜め）
[State -1, Jump Light Kick]
type = ChangeState
value = 630
triggerall = var(59) < 1
triggerall = command = "a"
triggerall = Vel X != 0
Triggerall = anim != 4
trigger1 = statetype = A
trigger1 = ctrl

;---------------------------------------------------------------------------
;空中キック（垂直）
[State -1, Jump Light Kick]
type = ChangeState
value = 635
triggerall = var(59) < 1
triggerall = command = "a"
triggerall = Vel X = 0
Triggerall = anim != 4
trigger1 = statetype = A
trigger1 = ctrl
;---------------------------------------------------------------------------


