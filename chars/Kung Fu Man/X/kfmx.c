;このキャラクターのコマンドファイルです。
;MUGEN標準では拡張子は.cmdですが、Windowsに命令するコマンドスクリプトと
;関連付けされているため、誤動作を避ける意味でCommandの頭文字と掛けて
;Cプログラムファイル(.c)に変えてあります。
;
;==============================================================================

;-| ボタン配置 |-----------------------------------------------------
;各ボタンの配置を簡単に変更できます。
;このキャラクターのボタン配置を変えたいときなどに使います。
;x = x を x = a に変えれば、xがaに変わります。

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
; timeを記述しなかった場合、以下の値が参照されます。最小値は1です。
command.time = 15

; buffer.timeの値です。1～30まで設定できます。
; 普通は1です。
command.buffer.time = 1


;------------------------------------------------------------------------------
;-| 超必殺技 |-----------------------------------------------------------------
;コマンドの一部が重なる場合、先に書かれたものが優先されるので
;気を付けてください。

[Command]
name = "TripleKFPalm"
command = ~D, DF, F, D, DF, F, x
time = 20

[Command]
name = "TripleKFAttack"
command = ~D, DF, F, D, DF, F, y
time = 20

[Command]
name = "SmashKFUpper"
command = ~D, DB, B, D, DB, B, x
time = 20

[Command]
name = "SmashKFUpper" ;上と同じコマンド名=どちらでも同じ技が出せる
command = ~D, DB, B, D, DB, B, y
time = 20

[Command]
name = "揚炮"  ;日本語も使えるらしい
command = ~D, DF, F, D, DF, F, a
time = 20

[Command]
name = "揚炮"
command = ~D, DF, F, D, DF, F, b
time = 20

;------------------------------------------------------------------------------
;-| 必殺技 |-------------------------------------------------------------------
;コマンドの一部が重なる場合、先に書かれたものが優先されるので
;623 → 236の順に登録されています。
;（注:236等はテンキーでコマンドを表しています）

[Command]
name = "blocking"
command = $F, z
time = 3

[Command]
name = "blocking"
command = z, $F
time = 3

[Command]
name = "C-blocking"
command = D, z
time = 3

[Command]
name = "623_x"
command = ~F, D, DF, x

[Command]
name = "623_y"
command = ~F, D, DF, y

[Command]
name = "623_xy"
command = ~F, D, DF, x+y

[Command]
name = "421_b"
command = ~B, D, DB, b

[Command]
name = "236_x"
command = ~D, DF, F, x

[Command]
name = "236_y"
command = ~D, DF, F, y

[Command]
name = "236_xy"
command = ~D, DF, F, x+y

[Command]
name = "214_x"
command = ~D, DB, B, x

[Command]
name = "214_y"
command = ~D, DB, B, y

[Command]
name = "214_xy"
command = ~D, DB, B, x+y

[Command]
name = "236_a"
command = ~D, DF, F, a

[Command]
name = "236_b"
command = ~D, DF, F, b

[Command]
name = "236_ab"
command = ~D, DF, F, a+b

[Command]
name = "FF_ab"
command = F, F, a+b

[Command]
name = "FF_a"
command = F, F, a

[Command]
name = "FF_b"
command = F, F, b

[Command]
name = "highjump"
command = D, $U
time = 10

;------------------------------------------------------------------------------
;-| キー２回連続入力 |---------------------------------------------------------
[Command]
name = "FF"     ;Common1.cnsに使用されているため、コマンド名を変えるときは注意
command = F, F
time = 10

[Command]
name = "BB"     ;Common1.cns
command = B, B
time = 10

;------------------------------------------------------------------------------
;-| 同時押し |-----------------------------------------------------------------
[Command]
name = "recovery"   ;Common1.cns
command = x+y
time = 1

[Command]
name = "recovery"   ;Common1.cns
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

[Command]
name = "F_c"
command = /$F,c
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

;------------------------------------------------------------------------------
;-| 方向キー押しっぱなし |-----------------------------------------------------
[Command]
name = "holdfwd"   ;Common1.cnsで使用されている
command = /$F
time = 1

[Command]
name = "holdback"  ;Common1.cns
command = /$B
time = 1

[Command]
name = "holdup"    ;Common1.cns
command = /$U
time = 1

[Command]
name = "holddown"  ;Common1.cns
command = /$D
time = 1

;------------------------------------------------------------------------------
;==============================================================================
[Statedef -1];必須項目
;==============================================================================
;------------------------------------------------------------------------------
;以下、コマンド成立時の条件記述部
;
;==============================================================================
;パワーゲージはpowerで表され、1000でLV1となります。

;カンフーマウンテンクラッシャー（レベル３）
[State -1, Kung Fu Mountain Crusher]
type = ChangeState
value = 3060
triggerall = command = "揚炮"  ;日本語のコマンド名
triggerall = power >= 3000
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno != 440
trigger2 = hitdefattr = SC, NA, SA, HA
trigger2 = stateno != 3060
trigger2 = movecontact
trigger3 = stateno = 1310 || stateno = 1330  ;ブロッキング後

;------------------------------------------------------------------------------
;スマッシュカンフーアッパー（レベル１）
[State -1, Smash Kung Fu Upper]
type = ChangeState
value = 3050
triggerall = command = "SmashKFUpper"
triggerall = power >= 1000
triggerall = statetype != A
trigger1 = ctrl
trigger2 = hitdefattr = SC, NA, SA, HA
trigger2 = stateno != [3050,3100)
trigger2 = movecontact
trigger3 = stateno = 1310 || stateno = 1330

;---------------------------------------------------------------------------
;トリプルカンフーアタック（レベル２）
[State -1, Triple Kung Fu Attack]
type = ChangeState
value = 3010
triggerall = command = "TripleKFAttack"
triggerall = power >= 2000
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = statetype != A
trigger2 = hitdefattr = SC, NA, SA, HA
trigger2 = stateno != [3000,3051]
trigger2 = stateno != 3060
trigger2 = movecontact
trigger3 = stateno = 1310 || stateno = 1330

;トリプルカンフーパーム（レベル１）
[State -1, Triple Kung Fu Palm]
type = ChangeState
value = 3000
triggerall = command = "TripleKFPalm"
triggerall = power >= 1000
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = statetype != A
trigger2 = hitdefattr = SC, NA, SA, HA
trigger2 = stateno != [3000,3050)
trigger2 = movecontact
trigger3 = stateno = 1310 || stateno = 1330


;===========================================================================
;本家に搭載されている"Combo condition Check"システムは廃止しました。
;（前回、被ダメージ直後の挙動が怪しかったので）

;[Combo condition Check 本家版]
;trigger1 = statetype != A
;trigger1 = ctrl
;trigger2 = (stateno = [200,299]) || (stateno = [400,499])
;trigger2 = stateno != 440
;trigger2 = movecontact
;trigger3 = stateno = 1310 || stateno = 1330


;---------------------------------------------------------------------------
;ファストカンフーニー（パワーゲージを1/3消費して繰り出すEX必殺技）
[State -1, Fast Kung Fu Knee]
type = ChangeState
value = 1070
triggerall = command = "FF_ab"
triggerall = power >= 333
trigger1 = statetype != A && ctrl
trigger2 = (stateno=[200,240])||(stateno=[400,430])
trigger2 = movecontact
trigger3 = stateno = 1310 || stateno = 1330

;カンフーニー（弱）
[State -1, Light Kung Fu Knee]
type = ChangeState
value = 1050
triggerall = command = "FF_a"
trigger1 = statetype != A && ctrl
trigger2 = (stateno=[200,240])||(stateno=[400,430])
trigger2 = movecontact
trigger3 = stateno = 1310 || stateno = 1330

;カンフーニー（強）
[State -1, Strong Kung Fu Knee]
type = ChangeState
value = 1060
triggerall = command = "FF_b"
trigger1 = statetype != A && ctrl
trigger2 = (stateno=[200,240])||(stateno=[400,430])
trigger2 = movecontact
trigger3 = stateno = 1310 || stateno = 1330

;---------------------------------------------------------------------------
;ファストカンフーパーム（EX）
[State -1, Fast Kung Fu Palm]
type = ChangeState
value = 1020
triggerall = command = "236_xy"
triggerall = power >= 333
trigger1 = statetype != A && ctrl
trigger2 = (stateno=[200,240])||(stateno=[400,430])
trigger2 = movecontact
trigger3 = stateno = 1310 || stateno = 1330

;カンフーパーム（弱）
[State -1, Light Kung Fu Palm]
type = ChangeState
value = 1000
triggerall = command = "236_x"
trigger1 = statetype != A && ctrl
trigger2 = (stateno=[200,240])||(stateno=[400,430])
trigger2 = movecontact
trigger3 = stateno = 1310 || stateno = 1330

;カンフーパーム（強）
[State -1, Strong Kung Fu Palm]
type = ChangeState
value = 1010
triggerall = command = "236_y"
trigger1 = statetype != A && ctrl
trigger2 = (stateno=[200,240])||(stateno=[400,430])
trigger2 = movecontact
trigger3 = stateno = 1310 || stateno = 1330

;---------------------------------------------------------------------------
;ファストカンフーアッパー（EX）
[State -1, Fast Kung Fu Upper]
type = ChangeState
value = 1120
triggerall = command = "623_xy"
triggerall = power >= 333
trigger1 = statetype != A && ctrl
trigger2 = (stateno=[200,240])||(stateno=[400,430])
trigger2 = movecontact
trigger3 = stateno = 1310 || stateno = 1330

;カンフーアッパー（弱）
[State -1, Light Kung Fu Upper]
type = ChangeState
value = 1100
triggerall = command = "623_x"
trigger1 = statetype != A && ctrl
trigger2 = (stateno=[200,240])||(stateno=[400,430])
trigger2 = movecontact
trigger3 = stateno = 1310 || stateno = 1330

;カンフーアッパー（強）
[State -1, Strong Kung Fu Upper]
type = ChangeState
value = 1110
triggerall = command = "623_y"
trigger1 = statetype != A && ctrl
trigger2 = (stateno=[200,240])||(stateno=[400,430])
trigger2 = movecontact
trigger3 = stateno = 1310 || stateno = 1330

;---------------------------------------------------------------------------
;ファストカンフーブロウ（EX）
[State -1, Fast Kung Fu Blow]
type = ChangeState
value = 1220
triggerall = command = "214_xy"
triggerall = power >= 333
trigger1 = statetype != A && ctrl
trigger2 = (stateno=[200,240])||(stateno=[400,430])
trigger2 = movecontact
trigger3 = stateno = 1310 || stateno = 1330

;カンフーブロウ（弱）
[State -1, Light Kung Fu Blow]
type = ChangeState
value = 1200
triggerall = command = "214_x"
trigger1 = statetype != A && ctrl
trigger2 = (stateno=[200,240])||(stateno=[400,430])
trigger2 = movecontact
trigger3 = stateno = 1310 || stateno = 1330

;カンフーブロウ（強）
[State -1, Strong Kung Fu Blow]
type = ChangeState
value = 1210
triggerall = command = "214_y"
trigger1 = statetype != A && ctrl
trigger2 = (stateno=[200,240])||(stateno=[400,430])
trigger2 = movecontact
trigger3 = stateno = 1310 || stateno = 1330

;---------------------------------------------------------------------------
;ファストカンフーザンコウ（EX）
[State -1, Fast Kung Fu Zankou]
type = ChangeState
value = 1420
triggerall = command = "236_ab"
triggerall = power >= 333
trigger1 = statetype != A && ctrl
trigger2 = (stateno=[200,240])||(stateno=[400,430])
trigger2 = movecontact
trigger3 = stateno = 1310 || stateno = 1330

;カンフーザンコウ（弱）
[State -1, Light Kung Fu Zankou]
type = ChangeState
value = 1400
triggerall = command = "236_a"
trigger1 = statetype != A && ctrl
trigger2 = (stateno=[200,240])||(stateno=[400,430])
trigger2 = movecontact
trigger3 = stateno = 1310 || stateno = 1330

;カンフーザンコウ（強）
[State -1, Strong Kung Fu Zankou]
type = ChangeState
value = 1410
triggerall = command = "236_b"
trigger1 = statetype != A && ctrl
trigger2 = (stateno=[200,240])||(stateno=[400,430])
trigger2 = movecontact
trigger3 = stateno = 1310 || stateno = 1330

;---------------------------------------------------------------------------
;上段カンフーブロッキング
[State -1, High Kung Fu Blocking]
type = ChangeState
value = 1300
triggerall = command = "blocking"
triggerall = command != "holddown"
trigger1 = statetype != A && ctrl
trigger2 = stateno = 1310 || stateno = 1330
trigger2 = time > 0

;下段カンフーブロッキング
[State -1, Low Kung Fu Blocking]
type = ChangeState
value = 1320
triggerall = (command = "C-blocking")||(command="holddown"&&command="blocking")
trigger1 = statetype != A && ctrl
trigger2 = stateno = 1310 || stateno = 1330
trigger2 = time > 0

;空中カンフーブロッキング
[State -1, Air Kung Fu Blocking]
type = ChangeState
value = 1340
triggerall = command = "blocking"
triggerall = command != "holdup"
;triggerall = command != "holddown";削除
trigger1 = statetype = A && ctrl
trigger2 = stateno = 1350
trigger2 = time > 0


;===========================================================================
;ホップバックキック
[State -1, Hop Back Kick]
type = ChangeState
value = 2400
triggerall = command = "421_b"
trigger1 = statetype != A && ctrl

;ガードキャンセルカウンター
[State -1, GCCounter]
type = ChangeState
value = 2300
triggerall = command = "blocking"
triggerall = power >= 1000
trigger1 = stateno = [150,153]

;カンフーローリング
[State -1, Roll]
type = ChangeState
value = 2100
triggerall = command = "F_c"
trigger1 = statetype = S && ctrl

;カンフーシャドー
[State -1, Shadow]
type = ChangeState
value = 2000
triggerall = command = "c"
trigger1 = statetype = S && ctrl



;---------------------------------------------------------------------------
;高速ジャンプ
[State -1, High Jump];コマンド入力でフラグON
type = VarSet
triggerall = command = "highjump"
trigger1 = stateno = [0,40]
var(1) = 1   ;ここは大文字厳禁

[State -1, High Jump];フラグOFF
type = VarSet
triggerall = var(1)
trigger1 = time > 3
trigger2 = movetype != I
var(1) = 0

[State -1, High Jump]
type = ChangeState
value = 54
triggerall = var(1)
trigger1 = prevstateno = 40 && stateno = 50


;---------------------------------------------------------------------------
;ラン
[State -1, Run Fwd]
type = ChangeState
value = 100
trigger1 = command = "FF"
trigger1 = statetype = S && ctrl

;バックステップ
[State -1, Back Step]
type = ChangeState
value = 105
trigger1 = command = "BB"
trigger1 = statetype = S && ctrl

;---------------------------------------------------------------------------
;カンフースロー
[State -1, Kung Fu Throw]
type = ChangeState
value = 800
triggerall = command = "y"
triggerall = statetype = S && ctrl
triggerall = stateno != 100
trigger1 = command = "holdfwd"
trigger1 = p2bodydist X < 3
trigger1 = (p2statetype = S) || (p2statetype = C)
trigger1 = p2movetype != H
trigger2 = command = "holdback"
trigger2 = p2bodydist X < 5
trigger2 = (p2statetype = S) || (p2statetype = C)
trigger2 = p2movetype != H

;エリアルカンフースロー
[State -1, Aerial Kung Fu Throw]
type = ChangeState
value = 850
triggerall = command = "y"
triggerall = statetype = A && ctrl
triggerall = stateno != 600
triggerall = stateno != 105
triggerall = Pos Y < -15
triggerall = p2statetype = A
triggerall = p2movetype != H
triggerall = p2bodydist Y = [-120,100] 
trigger1 = command = "holdfwd"
trigger1 = p2bodydist X = [-17,21] 
trigger2 = command = "holdback"
trigger2 = p2bodydist X = [-15,23]


;===========================================================================
;---------------------------------------------------------------------------
;立ち弱パンチ
[State -1, Stand Light Punch]
type = ChangeState
value = 200
triggerall = command = "x"
triggerall = command != "holddown"
trigger1 = statetype = S && ctrl
trigger2 = stateno = 200
trigger2 = time > 6

;---------------------------------------------------------------------------
;立ち強パンチ
[State -1, Stand Strong Punch]
type = ChangeState
value = 210
triggerall = command = "y"
triggerall = command != "holddown"
trigger1 = statetype = S && ctrl
trigger2 = (stateno = 200) && time > 5
trigger3 = (stateno = 230) && time > 6

;---------------------------------------------------------------------------
;立ち弱キック
[State -1, Stand Light Kick]
type = ChangeState
value = 230
triggerall = command = "a"
triggerall = command != "holddown"
trigger1 = statetype = S && ctrl
trigger2 = (stateno = 200) && time > 7
trigger3 = (stateno = 230) && time > 9

;---------------------------------------------------------------------------
;立ち強キック
[State -1, Standing Strong Kick]
type = ChangeState
value = 240
triggerall = command = "b"
triggerall = command != "holddown"
trigger1 = statetype = S && ctrl
trigger2 = (stateno = 200) && time > 5
trigger3 = (stateno = 230) && time > 6

;---------------------------------------------------------------------------
;アピール
[State -1, Taunt]
type = ChangeState
value = 195
triggerall = command = "start"
trigger1 = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------
;屈み弱パンチ
[State -1, Crouching Light Punch]
type = ChangeState
value = 400
triggerall = command = "x"
triggerall = command = "holddown"
trigger1 = statetype = C && ctrl

;---------------------------------------------------------------------------
;屈み強パンチ
[State -1, Crouching Strong Punch]
type = ChangeState
value = 410
triggerall = command = "y"
triggerall = command = "holddown"
trigger1 = statetype = C && ctrl
trigger2 = (stateno = 400) || (stateno = 430)
trigger2 = (time > 9) || (movecontact && time > 5)

;---------------------------------------------------------------------------
;屈み弱キック
[State -1, Crouching Light Kick]
type = ChangeState
value = 430
triggerall = command = "a"
triggerall = command = "holddown"
trigger1 = statetype = C && ctrl
trigger2 = (stateno = 400) || (stateno = 430)
trigger2 = (time > 9) || (movecontact && time > 5)

;---------------------------------------------------------------------------
;屈み強キック
[State -1, Crouching Strong Kick]
type = ChangeState
value = 440
triggerall = command = "b"
triggerall = command = "holddown"
trigger1 = statetype = C && ctrl
trigger2 = (stateno = 400) || (stateno = 430)
trigger2 = (time > 9) || (movecontact && time > 5)

;---------------------------------------------------------------------------
;空中弱パンチ
[State -1, Jump Light Punch]
type = ChangeState
value = 600
triggerall = command = "x"
triggerall = stateno != 105 ;バックステップ中は攻撃不可
trigger1 = statetype = A && ctrl
trigger2 = stateno = 600
trigger2 = statetime >= 7
trigger3 = stateno = 1350 ;空中ブロッキング後

;---------------------------------------------------------------------------
;空中強パンチ
[State -1, Jump Strong Punch]
type = ChangeState
value = 610
triggerall = command = "y"
triggerall = stateno != 105
trigger1 = statetype = A && ctrl
trigger2 = stateno = 600 || stateno = 630 ;空中弱からコンボ可能
trigger2 = movecontact
trigger3 = stateno = 1350

;---------------------------------------------------------------------------
;空中弱キック
[State -1, Jump Light Kick]
type = ChangeState
value = 630
triggerall = command = "a"
triggerall = stateno != 105
trigger1 = statetype = A && ctrl
trigger2 = stateno = 1350

;---------------------------------------------------------------------------
;空中強キック
[State -1, Jump Strong Kick]
type = ChangeState
value = 640
triggerall = command = "b"
triggerall = stateno != 105
trigger1 = statetype = A && ctrl
trigger2 = stateno = 600 || stateno = 630
trigger2 = movecontact
trigger3 = stateno = 1350

