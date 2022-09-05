;-| 超必殺技 |--------------------------------------------------------
;ここには超必殺技を記述してください、同じ名前を「name =」欄に書けますが
;コマンドは絶対に違ったものにしてください。
;カンフーマンは弱パンチと強パンチで技が出せるように同じ名前のコマンドで
;内容が弱と強になっています。
;「time=20」と書くことで「コマンドを20フレーム以内に入力」と設定できます。



[Command]
name = "功夫乱舞"
command = ~D, F, D, F, c
time = 30

[Command]
name = "真・功夫連撃"
command = ~D, B, D, B, c
time = 30

[Command]
name = "超疾風！功夫突き"
command = ~D, F, D, F, z
time = 30

[Command]
name = "真・飛翔！功夫アッパー"
command = ~D, B, D, B, z
time = 30




[Command]
name = "疾風！功夫三連撃"
command = ~D, F, D, F, x
time = 30
[Command]
name = "疾風！功夫三連撃"
command = ~D, F, D, F, y
time = 30

[Command]
name = "烈・飛翔！功夫アッパー"
command = ~D, F, D, F, a
time = 30
[Command]
name = "烈・飛翔！功夫アッパー"
command = ~D, F, D, F, b
time = 30

;-| 必殺技 |------------------------------------------------------



[Command]
name = "功夫山靠・弱"
command = ~D,DF,F, a
time = 30
[Command]
name = "功夫山靠・強"
command = ~D,DF,F, b
time = 30

[Command]
name = "功夫連撃"
command = ~F,D,DB, y
time = 30
[Command]
name = "功夫連撃"
command = ~F,D,DB, x
time = 30

[Command]
name = "強虎咆疾風拳"
command = ~D,DB,B, y
time = 30
[Command]
name = "弱虎咆疾風拳"
command = ~D,DB,B, x
time = 30

[Command]
name = "強功夫双手突き"
command = ~D,DB,B, b
time = 30
[Command]
name = "弱功夫双手突き"
command = ~D,DB,B, a
time = 30

[Command]
name = "強功夫飛天脚"
command = ~B,D,DB, b
time = 30
[Command]
name = "弱功夫飛天脚"
command = ~B,D,DB, a
time = 30

[Command]
name = "強功夫空連脚"
command = ~F,D,DF, b
time = 30
[Command]
name = "弱功夫空連脚"
command = ~F,D,DF, a
time = 30

[Command]
name = "強飛翔！功夫アッパー"
command = ~F,D,DF, y
time = 30
[Command]
name = "弱飛翔！功夫アッパー"
command = ~F,D,DF, x
time = 30

[Command]
name = "強疾風瞬歩"
command = ~B,D,DB, y
time = 30
[Command]
name = "弱疾風瞬歩"
command = ~B,D,DB, x
time = 30

[Command]
name = "強功夫遠当て"
command = ~D,DF,F, y
time = 30
[Command]
name = "弱功夫遠当て"
command = ~D,DF,F, x
time = 30

[Command]
name = "緊急回避前"
command = x+a
time = 1

[Command]
name = "緊急回避前"
command = z
time = 1

[Command]
name = "緊急回避後"
command = /$B,x+a
time = 1

[Command]
name = "緊急回避後"
command = /$B,z
time = 1


;[Command]
;name = "EX功夫連撃"
;command = ~F,DF,D,DB,B,F, x+y
;time = 30
;[Command]
;name = "功夫山靠・EX"
;command = ~D,DF,F, a+b
;time = 30
;[Command]
;name = "EX強虎咆疾風拳"
;command = ~D,B, y+x
;[Command]
;name = "EX功夫双手突き"
;command = ~D,B, b+a
;[Command]
;name = "EX功夫飛天脚"
;command = ~F,F, a+b
;[Command]
;name = "EX功夫空連脚"
;command = ~F,D,DF, a+b
;[Command]
;name = "EX飛翔！功夫アッパー"
;command = ~F,D,DF,x+y
;[Command]
;name = "EX疾風瞬歩"
;command = ~B,D,DB, x+y
;[Command]
;name = "EX功夫遠当て"
;command = ~D,DF,F, y+x

;-| ２回押し技 |-----------------------------------------------------------
[Command]
name = "FF"     
command = F, F
time = 10

[Command]
name = "BB"     
command = B, B
time = 10

;-| ２・３個の同時押し技 |-----------------------------------------------
[Command]
name = "ゲージ溜め発動"
command = z+c
time = 1

[Command]
name = "recovery"
command = x+y
time = 1

[Command]
name = "ふっ飛ばし"
command = y+b
time = 1

[Command]
name = "ふっ飛ばし"
command = c
time = 1

[Command]
name = "MAX"
command = a+y
time = 1

[Command]
name = "ストライカー"
command = a+y
time = 1

[Command]
name = "おしっぱなしx"
command = /$x
time = 1

[Command]
name = "おしっぱなしy"
command = /$y
time = 1

[Command]
name = "おしっぱなしa"
command = /$a
time = 1

[Command]
name = "おしっぱなしb"
command = /$b
time = 1

[Command]
name = "おしっぱなしz"
command = /$z
time = 1

[Command]
name = "おしっぱなしc"
command = /$c
time = 1

;-| 方向とボタンで出す技 |---------------------------------------------------------
[Command]
name = "氷柱割り"
command = /$F,x
time = 1

[Command]
name = "鬼車"
command = /$F,y
time = 1

[Command]
name = "特足払い"
command = /$F,a
time = 1

[Command]
name = "特肘打ち"
command = /$F,b
time = 1

[Command]
name = "下段突き"
command = /DF,x
time = 1

[Command]
name = "下段受け"
command = /$DF,a
time = 1

[Command]
name = "上段受け"
command = /$F,a
time = 1

[Command]
name = "避け攻撃"
command = /$B,x
time = 1

[Command]
name = "ダッキング攻撃"
command = /$B,a
time = 1

[Command]
name = "ボディーブロー"
command = /$DF,y
time = 1

[Command]
name = "ローキック"
command = /$DF,b
time = 1






[Command]
name = "大回転蹴り"
command = /$F,x
time = 1

[Command]
name = "棒高跳び蹴り"
command = /$F,a
time = 1


[Command]
name = "down_a"
command = /$D,a
time = 1

[Command]
name = "down_b"
command = /$D,b
time = 1

;-| ボタン設定（いじらない）|---------------------------------------------------------
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

;-| 押しっぱなし設定（いじらない）-------------------------------------------------------
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
name = "上段受け"
command = F
time = 1

[Command]
name = "下段受け"
command = D
time = 1

; 下の記述↓は絶対に消さないでください。
[Statedef -1]

;---------------------------------------------------------------------------
;功　夫　乱　舞
[State -1, Strong Kung Fu Palm]
type = ChangeState
value = 2400
triggerall = command = "功夫乱舞"
triggerall = power >= 3000
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact

;---------------------------------------------------------------------------
;真・飛翔！功夫アッパー
[State -1, Strong Kung Fu Palm]
type = ChangeState
value = 2080
triggerall = command = "真・飛翔！功夫アッパー"
triggerall = power >= 2000
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact

;---------------------------------------------------------------------------
;烈・飛翔！功夫アッパー
[State -1, Strong Kung Fu Palm]
type = ChangeState
value = 2060
triggerall = command = "烈・飛翔！功夫アッパー"
triggerall = power >= 1000
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact

;---------------------------------------------------------------------------
;真・功夫連撃
[State -1, Strong Kung Fu Palm]
type = ChangeState
value = 2300
triggerall = command = "真・功夫連撃"
triggerall = power >= 3000
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact

;---------------------------------------------------------------------------
;超疾風！功夫突き
[State -1, Strong Kung Fu Palm]
type = ChangeState
value = 2200
triggerall = command = "超疾風！功夫突き"
triggerall = power >= 2000
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact

;---------------------------------------------------------------------------
;疾風！功夫三連撃
[State -1, Strong Kung Fu Palm]
type = ChangeState
value = 2100
triggerall = command = "疾風！功夫三連撃"
triggerall = power >= 1000
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact

;---------------------------------------------------------------------------
;EX・功夫連撃
;[State -1, Strong Kung Fu Palm]
;type = ChangeState
;value = 1550
;triggerall = command = "EX功夫連撃"
;triggerall = power >= 500
;triggerall = statetype != A
;triggerall = p2dist X < 80
;triggerall = p2statetype != A
;trigger1 = ctrl
;trigger2 = stateno = 200 
;trigger3 = stateno = 205 
;trigger4 = (stateno = 213||stateno = 215||stateno = 216) 
;trigger5 = stateno = 235 
;trigger6 = stateno = 245 
;trigger7 = stateno = 290 
;trigger8 = stateno = 400 
;trigger9 = stateno = 410 
;trigger10= stateno = 420 
;trigger11= stateno = 440 
;trigger12= stateno = 252 
;trigger13= stateno = 250 

;功夫連撃
[State -1, Strong Kung Fu Palm]
type = ChangeState
value = 1540
triggerall = command = "功夫連撃"
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact

;---------------------------------------------------------------------------
; EX・強襲！功夫脚_1
;[State -1]
;type = ChangeState
;value = 1603
;triggerall = var(58) <= 0
;triggerall = power >= 500
;triggerall = statetype = A
;triggerall = command = "EX功夫双手突き"
;trigger1 = ctrl
;trigger2 = (stateno = [200,799])
;trigger3 = (stateno = [1300,1399])

; 強・強襲！功夫脚
[State -1]
type = ChangeState
value = 1601
triggerall = command = "強功夫双手突き"
triggerall = statetype = A
trigger1 = ctrl
trigger2=(stateno=[600,699]) && movecontact

; 弱・強襲！功夫脚
[State -1]
type = ChangeState
value = 1600
triggerall = command = "弱功夫双手突き"
triggerall = statetype = A
trigger1 = ctrl
trigger2=(stateno=[600,699]) && movecontact

;---------------------------------------------------------------------------
;EX・功夫空連脚
;[State -1, Strong Kung Fu Palm]
;type = ChangeState
;value = 1302
;triggerall = command = "EX功夫空連脚"
;triggerall = power >= 500
;trigger1 = statetype != A
;trigger1 = ctrl
;trigger2 = stateno = 200 
;trigger3 = stateno = 205 
;trigger4 = (stateno = 213||stateno = 215||stateno = 216) 
;trigger5 = stateno = 235 
;trigger6 = stateno = 245 
;trigger7 = stateno = 290 
;trigger8 = stateno = 400 
;trigger9 = stateno = 410 
;trigger10= stateno = 420 
;trigger11= stateno = 440 
;trigger12= stateno = 252 
;trigger13= stateno = 250 

;強・功夫空連脚
[State -1, Strong Kung Fu Palm]
type = ChangeState
value = 1301
triggerall = command = "強功夫空連脚"
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact

;弱・功夫空連脚
[State -1, Strong Kung Fu Palm]
type = ChangeState
value = 1300
triggerall = command = "弱功夫空連脚"
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact

;---------------------------------------------------------------------------
;EX・功夫飛天脚
;[State -1, Strong Kung Fu Palm]
;type = ChangeState
;value = 1356
;triggerall = power >= 500
;triggerall = command = "EX功夫飛天脚"
;trigger1 = statetype != A
;trigger1 = ctrl
;trigger2 = stateno = 200 
;trigger3 = stateno = 205 
;trigger4 = (stateno = 213||stateno = 215||stateno = 216) 
;trigger5 = stateno = 235 
;trigger6 = stateno = 245 
;trigger7 = stateno = 290 
;trigger8 = stateno = 400 
;trigger9 = stateno = 410 
;trigger10= stateno = 420 
;trigger11= stateno = 440 
;trigger12= stateno = 252 
;trigger13= stateno = 250 

;強・功夫飛天脚
[State -1, Strong Kung Fu Palm]
type = ChangeState
value = 1355
triggerall = command = "強功夫飛天脚"
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact

;弱・功夫飛天脚
[State -1, Strong Kung Fu Palm]
type = ChangeState
value = 1350
triggerall = command = "弱功夫飛天脚"
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact

;---------------------------------------------------------------------------
;EX・功夫山靠
;[State -1, Strong Kung Fu Palm]
;type = ChangeState
;value = 1702
;triggerall = command = "功夫山靠・EX"
;triggerall = power >= 500
;trigger1 = statetype != A
;trigger1 = ctrl
;trigger2 = stateno = 200 
;trigger3 = stateno = 205 
;trigger4 = (stateno = 213||stateno = 215||stateno = 216) 
;trigger5 = stateno = 235 
;trigger6 = stateno = 245 
;trigger7 = stateno = 290 
;trigger8 = stateno = 400 
;trigger9 = stateno = 410 
;trigger10= stateno = 420 
;trigger11= stateno = 440 
;trigger12= stateno = 252 
;trigger13= stateno = 250 

;功夫山靠・強
[State -1, Strong Kung Fu Palm]
type = ChangeState
value = 1701
triggerall = command = "功夫山靠・強"
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact

;功夫山靠・弱
[State -1, Strong Kung Fu Palm]
type = ChangeState
value = 1700
triggerall = command = "功夫山靠・弱"
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact

;---------------------------------------------------------------------------
;"EX・疾風瞬歩"
;[State -1, Strong Kung Fu Palm]
;type = ChangeState
;value = 920
;triggerall = command = "EX疾風瞬歩"
;triggerall = power >= 500
;trigger1 = statetype != A
;trigger1 = ctrl
;trigger2 = stateno = 200 
;trigger3 = stateno = 205 
;trigger4 = (stateno = 213||stateno = 215||stateno = 216) 
;trigger5 = stateno = 235 
;trigger6 = stateno = 245 
;trigger7 = stateno = 290 
;trigger8 = stateno = 400 
;trigger9 = stateno = 410 
;trigger10= stateno = 420 
;trigger11= stateno = 440 
;trigger12= stateno = 252 
;trigger13= stateno = 250 

;"強・疾風瞬歩"
[State -1, Strong Kung Fu Palm]
type = ChangeState
value = 910
triggerall = command = "強疾風瞬歩"
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact

;"弱・疾風瞬歩"
[State -1, Strong Kung Fu Palm]
type = ChangeState
value = 900
triggerall = command = "弱疾風瞬歩"
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact

;---------------------------------------------------------------------------
;EX疾風！功夫突き
;[State -1, Strong Kung Fu Palm]
;type = ChangeState
;value = 1402
;triggerall = command = "EX強虎咆疾風拳"
;triggerall = power >= 500
;trigger1 = statetype != A
;trigger1 = ctrl
;trigger2 = stateno = 200 
;trigger3 = stateno = 205 
;trigger4 = (stateno = 213||stateno = 215||stateno = 216) 
;trigger5 = stateno = 235 
;trigger6 = stateno = 245 
;trigger7 = stateno = 290 
;trigger8 = stateno = 400 
;trigger9 = stateno = 410 
;trigger10= stateno = 420 
;trigger11= stateno = 440 
;trigger12= stateno = 252 
;trigger13= stateno = 250 

;強疾風！功夫突き
[State -1, Strong Kung Fu Palm]
type = ChangeState
value = 1401
triggerall = command = "強虎咆疾風拳"
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact

;弱疾風！功夫突き
[State -1, Strong Kung Fu Palm]
type = ChangeState
value = 1400
triggerall = command = "弱虎咆疾風拳"
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact

;---------------------------------------------------------------------------
;EX・飛翔！功夫アッパー
;[State -1, Strong Kung Fu Palm]
;type = ChangeState
;value = 1150
;triggerall = command = "EX飛翔！功夫アッパー"
;trigger1 = statetype != A
;trigger1 = ctrl
;trigger2 = stateno = 200 
;trigger3 = stateno = 205 
;trigger4 = (stateno = 213||stateno = 215||stateno = 216) 
;trigger5 = stateno = 235 
;trigger6 = stateno = 245 
;trigger7 = stateno = 290 
;trigger8 = stateno = 400 
;trigger9 = stateno = 410 
;trigger10= stateno = 420 
;trigger11= stateno = 440 
;trigger12= stateno = 252 
;trigger13= stateno = 250 

;強飛翔！功夫アッパー
[State -1, Strong Kung Fu Palm]
type = ChangeState
value = 1101
triggerall = command = "強飛翔！功夫アッパー"
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact

;弱飛翔！功夫アッパー
[State -1, Strong Kung Fu Palm]
type = ChangeState
value = 1100
triggerall = command = "弱飛翔！功夫アッパー"
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact

;---------------------------------------------------------------------------
;EX・功夫遠当て拳
;[State -1, Strong Kung Fu Palm]
;type = ChangeState
;value = 1052
;triggerall = command = "EX功夫遠当て"
;triggerall = power >= 500
;trigger1 = statetype != A
;trigger1 = ctrl
;trigger2 = stateno = 200 
;trigger3 = stateno = 205 
;trigger4 = (stateno = 213||stateno = 215||stateno = 216) 
;trigger5 = stateno = 235 
;trigger6 = stateno = 245 
;trigger7 = stateno = 290 
;trigger8 = stateno = 400 
;trigger9 = stateno = 410 
;trigger10= stateno = 420 
;trigger11= stateno = 440 
;trigger12= stateno = 252 
;trigger13= stateno = 250 

;強・功夫遠当て拳
[State -1, Strong Kung Fu Palm]
type = ChangeState
value = 1051
triggerall = command = "強功夫遠当て"
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact

;弱・功夫遠当て拳
[State -1, Strong Kung Fu Palm]
type = ChangeState
value = 1050
triggerall = command = "弱功夫遠当て"
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact

;---------------------------------------------------------------------------
;"EX・功夫双手突き"
;[State -1, Strong Kung Fu Palm]
;type = ChangeState
;value = 1002
;triggerall = command = "EX功夫双手突き"
;triggerall = power >= 500
;trigger1 = statetype != A
;trigger1 = ctrl
;trigger2 = stateno = 200 
;trigger3 = stateno = 205 
;trigger4 = (stateno = 213||stateno = 215||stateno = 216) 
;trigger5 = stateno = 235 
;trigger6 = stateno = 245 
;trigger7 = stateno = 290 
;trigger8 = stateno = 400 
;trigger9 = stateno = 410 
;trigger10= stateno = 420 
;trigger11= stateno = 440 
;trigger12= stateno = 252 
;trigger13= stateno = 250 

;"強・功夫双手突き"
[State -1, Strong Kung Fu Palm]
type = ChangeState
value = 1001
triggerall = command = "強功夫双手突き"
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact

;"弱・功夫双手突き"
[State -1, Strong Kung Fu Palm]
type = ChangeState
value = 1000
triggerall = command = "弱功夫双手突き"
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact

;===========================================================================
;気力溜め
;[State -1, Taunt]
;type = ChangeState
;value = 1650
;triggerall = command = "ゲージ溜め発動"
;trigger1 = statetype != A
;trigger1 = ctrl

;---------------------------------------------------------------------------
;---------------------------------------------------------------------------

;ふっ飛ばし攻撃
[State -1, Stand Light Punch]
type = ChangeState
value = 535
triggerall = (command = "y" && command = "b") || command = "c"
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact

;空中ふっ飛ばし攻撃
[State -1, Stand Light Punch]
type = ChangeState
value = 690
triggerall = (command = "y" && command = "b") || command = "c"
triggerall = statetype = A
trigger1 = ctrl
trigger2=(stateno=[600,699]) && movecontact

;---------------------------------------------------------------------------
;---------------------------------------------------------------------------

;緊急回避後
[State -1, Taunt]
type = ChangeState
value = 701
triggerall = command = "緊急回避後"
trigger1 = statetype != A
trigger1 = ctrl

;緊急回避前
[State -1, Taunt]
type = ChangeState
value = 700
triggerall = command = "緊急回避前"
trigger1 = statetype != A
trigger1 = ctrl

;ダウン回避
[State -1, Taunt]
type = ChangeState
value = 702
triggerall = command = "緊急回避前"
trigger1 = stateno = 5050
trigger1 = pos y >=-20

;---------------------------------------------------------------------------

;ガードキャンセル緊急回避後
;[State -1, 701]
;type = ChangeState
;value = 701
;triggerall = command = "緊急回避後"
;triggerall = power >= 1000
;trigger1 = stateno = 150
;trigger2 = stateno = 151

;ガードキャンセル緊急回避前
;[State -1, 700]
;type = ChangeState
;value = 700
;triggerall = command = "緊急回避前"
;triggerall = power >= 1000
;trigger1 = stateno = 150
;trigger2 = stateno = 151

;---------------------------------------------------------------------------


;---------------------------------------------------------------------------
;ダッシュ
[State -1, Run Fwd]
type = ChangeState
value = 100
trigger1 = command = "FF"
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
;後退ダッシュ
[State -1, Run Back]
type = ChangeState
value = 105
trigger1 = command = "BB"
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
;大外狩り
[State -1, Kung Fu Throw]
type = ChangeState
value = 800
triggerall = command = "y"
triggerall = statetype = S
triggerall = ctrl
triggerall = stateno != 100
trigger1 = command = "holdfwd"
trigger1 = p2bodydist X < 20
trigger1 = (p2statetype = S) || (p2statetype = C)
trigger1 = p2movetype != H
trigger2 = command = "holdback"
trigger2 = p2bodydist X < 20
trigger2 = (p2statetype = S) || (p2statetype = C)
trigger2 = p2movetype != H

;---------------------------------------------------------------------------
;巴投げ
[State -1, Kung Fu Throw]
type = ChangeState
value = 850
triggerall = command = "b"
triggerall = statetype = S
triggerall = ctrl
triggerall = stateno != 100
trigger1 = command = "holdfwd"
trigger1 = p2bodydist X < 20
trigger1 = (p2statetype = S) || (p2statetype = C)
trigger1 = p2movetype != H
trigger2 = command = "holdback"
trigger2 = p2bodydist X < 20
trigger2 = (p2statetype = S) || (p2statetype = C)
trigger2 = p2movetype != H

;---------------------------------------------------------------------------


;---------------------------------------------------------------------------



;---------------------------------------------------------------------------


;---------------------------------------------------------------------------


;---------------------------------------------------------------------------


;---------------------------------------------------------------------------
;氷柱割り(キャンセル版)
;[State -1, Strong Kung Fu Palm]
;type = ChangeState
;value = 251
;triggerall = command = "氷柱割り"
;triggerall = var(1) = 0
;trigger1 = stateno = 200
;trigger1 = movecontact = 1
;trigger2 = stateno = 205
;trigger2 = movecontact = 1
;trigger3 = stateno = 215
;trigger3 = movecontact = 1
;trigger4 = stateno = 235
;trigger4 = movecontact = 1
;trigger5 = stateno = 245
;trigger5 = movecontact = 1
;trigger6 = stateno = 290
;trigger6 = movecontact = 1
;trigger7 = stateno = 400
;trigger7 = movecontact = 1
;trigger8 = stateno = 410
;trigger8 = movecontact = 1
;trigger9 = stateno = 440
;trigger9 = movecontact = 1

;---------------------------------------------------------------------------

;Stand Light Punch
[State -1, Stand Light Punch]
type = ChangeState
value = 206
triggerall = (Command = "x") && (Command = "holdfwd")
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 100

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

;---------------------------------------------------------------------------

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

;Stand Medium Kick
[State -1, Stand Medium Kick]
type = ChangeState
value = 246
triggerall = command = "b"
triggerall = command = "holdfwd"
triggerall = command != "holddown"
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

;---------------------------------------------------------------------------
;挑発
[State -1, Taunt]
type = ChangeState
value = 195
triggerall = command = "start"
trigger1 = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------

;Crouching Light Punch
;[State -1, Crouching Light Punch]
;type = ChangeState
;value = 405
;triggerall = command = "x"
;triggerall = command = "holdfwd"
;triggerall = command = "holddown"
;triggerall = statetype != A
;trigger1 = ctrl  

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
value = 437
triggerall = command = "a"
triggerall = command = "holdfwd"
triggerall = command = "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,209])&& movecontact
trigger3 = (stateno = [400,409])&& movecontact  

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
;空中弱パンチ
[State -1, Jump Light Punch]
type = ChangeState
value = 600
triggerall = command = "x"
trigger1 = vel x = 0
trigger1 = statetype = A
trigger1 = stateno != 106
trigger1 = ctrl

;---------------------------------------------------------------------------
;斜め空中弱パンチ
[State -1, Jump Light Punch]
type = ChangeState
value = 605
triggerall = command = "x"
trigger1 = vel x != 0
trigger1 = statetype = A
trigger1 = stateno != 106
trigger1 = ctrl

;---------------------------------------------------------------------------
;空中強パンチ
[State -1, Jump Strong Punch]
type = ChangeState
value = 610
triggerall = command = "y"
trigger1 = vel x = 0
trigger1 = statetype = A
trigger1 = stateno != 106
trigger1 = ctrl

;---------------------------------------------------------------------------
;斜め空中強パンチ
[State -1, Jump Strong Punch]
type = ChangeState
value = 615
triggerall = command = "y"
trigger1 = vel x != 0
trigger1 = statetype = A
trigger1 = stateno != 106
trigger1 = ctrl

;---------------------------------------------------------------------------
;空中弱キック
[State -1, Jump Light Kick]
type = ChangeState
value = 635
triggerall = command = "a"
trigger1 = vel x = 0
trigger1 = statetype = A
trigger1 = stateno != 106
trigger1 = ctrl

;---------------------------------------------------------------------------
;斜め空中弱キック
[State -1, Jump Light Kick]
type = ChangeState
value = 630
triggerall = command = "a"
trigger1 = vel x != 0
trigger1 = statetype = A
trigger1 = stateno != 106
trigger1 = ctrl

;---------------------------------------------------------------------------
;空中強キック
[State -1, Jump Strong Kick]
type = ChangeState
value = 640
triggerall = command = "b"
trigger1 = vel x = 0
trigger1 = statetype = A
trigger1 = stateno != 106
trigger1 = ctrl

;---------------------------------------------------------------------------
;空中強キック
[State -1, Jump Strong Kick]
type = ChangeState
value = 645
triggerall = command = "b"
trigger1 = vel x != 0
trigger1 = statetype = A
trigger1 = stateno != 106
trigger1 = ctrl
