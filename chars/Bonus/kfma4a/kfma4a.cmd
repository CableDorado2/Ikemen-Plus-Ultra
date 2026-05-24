;#ADD004BASIC#

[remap]
	x=x
	y=y
	z=z
	a=a
	b=b
	c=c
	s=s
[defaults]
	command.time=15
	command.buffer.time=1


;--------------------
; 超必殺技 (hyper)
;--------------------

[command]
	name="hy1"
	command=~D,F,D,F,x
	time=32
[command]
	name="hy1_s"
	command=~D,F,D,F,y
	time=32
;---
[command]
	name="hy1"
	command=~D,F,x+y
[command]
	name="hy1_s"
	command=~D,F,y+z

;---
[command]
	name="hy2"
	command=~D,F,D,F,a
	time=32
[command]
	name="hy2_s"
	command=~D,F,D,F,b
	time=32
;---
[command]
	name="hy2"
	command=~D,F,a+b
[command]
	name="hy2_s"
	command=~D,F,b+c

;---
[command]
	name="hy3"
	command=~D,B,D,B,x
	time=32
[command]
	name="hy3_s"
	command=~D,B,D,B,y
	time=32
;---
[command]
	name="hy3"
	command=~D,B,x+y
[command]
	name="hy3_s"
	command=~D,B,y+z


;---
[command]
	name="hy4"
	command=~D,B,D,B,a
	time=32
[command]
	name="hy4_s"
	command=~D,B,D,B,b
	time=32
;---
[command]
	name="hy4"
	command=~D,B,a+b
[command]
	name="hy4_s"
	command=~D,B,b+c


;--------------------
; 必殺技 (special)
;--------------------
[command]
	name="sp1"
	command=~F,D,DF,a
	time=20
[command]
	name="sp1_s"
	command=~F,D,DF,b
	time=20
[command]
	name="sp1"
	command=~F,D,F,a
	time=20
[command]
	name="sp1_s"
	command=~F,D,F,b
	time=20

;---
[command]
	name="sp2"
	command=~D,F,x
[command]
	name="sp2_s"
	command=~D,F,y

;---
[command]
	name="sp3"
	command=~D,F,a
[command]
	name="sp3_s"
	command=~D,F,b

;---
[command]
	name="sp4"
	command=~D,B,a
[command]
	name="sp4_s"
	command=~D,B,b

;---
[command]
	name="sp5"
	command=~D,B,x
[command]
	name="sp5_s"
	command=~D,B,y

;---
[command]
	name="sp6"
	command=~D,B,x
[command]
	name="sp6"
	command=~D,B,y
[command]
	name="sp6"
	command=~D,B,a
[command]
	name="sp6"
	command=~D,B,b

;--- plus
[command]
	name="sp7"
	command=~D,B,x
[command]
	name="sp7_s"
	command=~D,B,y

;---
[command]
	name="sp8"
	command=~D,B,a
[command]
	name="sp8_s"
	command=~D,B,b



;--------------------
;--------------------
[command]
	name="ff"
	command=F,F
	time=10
[command]
	name="bb"
	command=B,B
	time=10


;--------------------
[command]
	name="recovery"
	command=x+y
	time=1
[command]
	name="recovery"
	command=z
	time=1
[command]
	name="ab"
	command=a+b
	time=1
[command]
	name="ab"
	command=c
	time=1


;--------
[command]
	name="a"
	command=a
	time=1
[command]
	name="b"
	command=b
	time=1
[command]
	name="c"
	command=c
	time=1
[command]
	name="x"
	command=x
	time=1
[command]
	name="y"
	command=y
	time=1
[command]
	name="z"
	command=z
	time=1
[command]
	name="s"
	command=s
	time=1

;--------
[command]
	name="holdfwd"
	command=/$F
	time=1
[command]
	name="holdback"
	command=/$B
	time=1
[command]
	name="holdup"
	command=/$U
	time=1
[command]
	name="holddown"
	command=/$D
	time=1







;----------------------
[statedef -1]
;----------------------


;--------------------
; hit_spark / guard_spark (v30-32)
;--- set
[state 0]
	type=varset
	trigger1=(stateno!=10005) ;;<- bonus_mode
	trigger1=(movecontact=1) && (var(32)=-1)
	var(32)=hitpausetime ;;<- memo hitpausetime to var
	ignorehitpause=1
;--- hit_spark
[state 0]
	type=helper
	trigger1=(stateno!=10005) ;;<- bonus_mode
	trigger1=(movecontact=1) && (var(32)=hitpausetime) && (sysfvar(0)>0) && (sysvar(4)=0)
	trigger1=(hitdefattr!=sca,nt,st,ht) ;;<- is throw type?
	id=152100
	stateno=152100
	helpertype=normal
	ownpal=0
	keyctrl=0
	postype=p2
	pos=((var(30)/1000)%1000)-500, floor( (500-(var(30)%1000)) *const(size.yscale) -p2dist y)
	size.height= (var(31)%10) +(moveguarded)*40 ;; hit/guard_spark
	facing=1
	ignorehitpause=1
;--- hit_spark_def
[state 0]
	type=explod
	trigger1=(stateno!=10005) ;;<- bonus_mode
	trigger1=(movecontact=1) && (var(32)=hitpausetime) && (sysfvar(0)<=0) && (sysvar(4)=0)
	trigger1=(hitdefattr!=sca,nt,st,ht) ;;<- is throw type?
	anim=f0+ifelse(movehit,ifelse(var(31)%10<3, var(31)%10, 3), 40)
	ownpal=0
	postype=p2
	pos=((var(30)/1000)%1000)-500, floor( (500-(var(30)%1000)) *const(size.yscale) -p2dist y)
	sprpriority=5
	ignorehitpause=1
;--- reset
[state 0]
	type=varset
	trigger1=(stateno!=10005) ;;<- bonus_mode
	trigger1=(var(32)>-1)
	var(32)=-1


;----------------------
;----------------------
; change char standing anim
[state 0]
	type=changeanim
	triggerall=(stateno=[0,1]) && (anim=0)
	trigger1=var(3)=1 && (animelem=20,>0)
	trigger2=var(3)=2 && ((animelem=20,<0) || (animelem=39,>0))
	trigger3=var(3)=3 && (animelem=39,<0)
	value=0
	elem=(var(3)-1)*19+1

; 1: 1-19
; 2: 20-38
; 3: 39-57

;;---
[state 0]
	type=afterimagetime
	trigger1=movetype=h && time<2
	time=0
;---
; voice_bk/jd
[state 0]
	type=playsnd
	trigger1=(stateno!=10005) ;;<- bonus_mode
	trigger1=stateno=195500 && time=1 && (sysfvar(0)>0)
	value=s1,(random%2)+var(3)*100
	channel=0


;----------------------
;----------------------
; combo set
[state 0]
	type=varset
	trigger1=(stateno!=10005) ;;<- bonus_mode
	trigger1=var(41)
	var(41)=0
[state 0]
	type=varset
	triggerall=roundstate=2
	triggerall=(stateno!=10005) ;;<- bonus_mode
	triggerall=!var(41)
	triggerall=movecontact
	trigger1=stateno=200 || stateno=210 || stateno=230 || stateno=260
	trigger2=stateno=400 || stateno=410 || stateno=430
	trigger3=stateno=275 && ((var(51)<1) || (var(51)>0 && (animelem=10,>0)))
	var(41)=1
;op;	ignorehitpause=1


;--------------------
; 超必殺技 (hyper)
;--------------------
; 扶揺戻脚 (fuyo reikyaku)
[state 0]
	type=changestate
	value=3000
	triggerall=command="hy2" || command="hy2_s"
	triggerall=!ishelper && var(51)<1
	triggerall=power>=1000
	trigger1=statetype!=a &&(ctrl || var(41))

; 夭遏弐指 (yoatsu nishi)
[state 0]
	type=changestate
	value=ifelse(var(3)=2,3100,3400)
	triggerall=command="hy4" || command="hy4_s"
	triggerall=!ishelper && var(51)<1
	triggerall=power>=1000
	trigger1=statetype!=a &&(ctrl || var(41))

; 垂天波掌 (suiten hasyo)
[state 0]
	type=changestate
	value=3200
	triggerall=command="hy1" || command="hy1_s"
	triggerall=!ishelper && var(51)<1
	triggerall=power>=1000
	triggerall=!numprojid(91000)
	trigger1=statetype!=a &&(ctrl || var(41))

; 培風控襲 (baifu kusyu)
[state 0]
	type=changestate
	value=3300
	triggerall=command="hy4" || command="hy4_s"
	triggerall=!ishelper && var(51)<1
	triggerall=power>=1000
	trigger1=statetype=a && ctrl

; 広莫逍遥 (kobaku syoyo) (max2)
[state 0]
	type=changestate
	value=3500
	triggerall=command="hy3" || command="hy3_s"
	triggerall=!ishelper && var(51)<1
	triggerall=power>=2000
	trigger1=statetype!=a &&(ctrl || var(41))



;--------------------
; 必殺技 (special)
;--------------------

; 戻脚 (reikyaku)
[state 0]
	type=changestate
	value=1200
	triggerall=command="sp1" || command="sp1_s"
	triggerall=!ishelper && var(51)<1
	trigger1=statetype!=a &&(ctrl || var(41))

; 波掌 (hasyo)
[state 0]
	type=changestate
	value=1100
	triggerall=command="sp2" || command="sp2_s"
	triggerall=!ishelper && var(51)<1
	triggerall=!numprojid(91000)
	trigger1=statetype!=a &&(ctrl || var(41))

; 窮奇 (kyuki)
[state 0]
	type=changestate
	value=1000
	triggerall=command="sp3" || command="sp3_s"
	triggerall=!ishelper && var(51)<1
	trigger1=statetype!=a &&(ctrl || var(41))

; 弐指 (nishi)
[state 0]
	type=changestate
	value=1300
	triggerall=var(3)=2 ;; <- char type
	triggerall=!ishelper && var(51)<1
	triggerall=command="sp4" || command="sp4_s"
	trigger1=statetype!=a &&(ctrl || var(41))

; 明鏡 (meikyo)
[state 0]
	type=changestate
	value=1400
	triggerall=!ishelper && var(51)<1
	triggerall=statetype!=a &&(ctrl || var(41))
	trigger1=var(3)=2 ;; <- char type
	trigger1=command="sp5" || command="sp5_s"
	trigger2=var(3)=3 ;; <- char type
	trigger2=command="sp5_s"

; 控襲 (kusyu)
[state 0]
	type=changestate
	value=1500
	triggerall=command="sp6"
	triggerall=!ishelper && var(51)<1
	trigger1=statetype=a && ctrl

; カンフーブロー (KungFu Blow)
[state 0]
	type=changestate
	value=1600
	triggerall=statetype!=a &&(ctrl || var(41))
	triggerall=!ishelper && var(51)<1
	trigger1=var(3)=1 ;; <- char type
	trigger1=command="sp7" || command="sp7_s"
	trigger2=var(3)=3 ;; <- char type
	trigger2=command="sp7"

; カンフー山靠 (KungFu Zanko)
[state 0]
	type=changestate
	value=1700
	triggerall=var(3)=1 || var(3)=3 ;; <- char type
	triggerall=!ishelper && var(51)<1
	triggerall=command="sp8" || command="sp8_s"
	trigger1=statetype!=a &&(ctrl || var(41))


;--------------------
; 特殊 (uniqe)
;--------------------
; 緊急回避 (roll)
[state 0]
	type=changestate
	value=ifelse(command="holdback",115,110)
	triggerall=command="recovery"
	triggerall=!ishelper && var(51)<1
	triggerall=!var(4)
	triggerall=(sysvar(4)!=[2,3])
	trigger1=statetype!=a && ctrl

; リープ (leap)
[state 0]
	type=changestate
	value=610
	trigger1=stateno=58 && vel y>1

[state 0] ; run
	type=changestate
	value=100
	triggerall=command="ff"
	triggerall=!ishelper && var(51)<1
	trigger1=statetype=s && ctrl && stateno!=100
[state 0] ; backstep
	type=changestate
	value=105
	triggerall=command="bb"
	triggerall=!ishelper && var(51)<1
	trigger1=statetype=s && ctrl && stateno!=105


;--------------------
; 投げ (throw)
[state 0]
	type=changestate
	value=800
	triggerall=(command="y" || command="b") && (command="holdfwd" || command="holdback")
	triggerall=!ishelper && var(51)<1
	trigger1=statetype=s && ctrl && (stateno!=[100,101])
	trigger1=p2statetype!=a && p2movetype!=h && p2statetype!=l
	trigger1=(p2stateno!=[150,155]) && (p2bodydist x=[-12,12])

[state 0] ; against_throw 投げ外し
	type=changestate
	triggerall=stateno=810
	triggerall=(sysfvar(0)>0)
	triggerall=numtarget &&(time=[1,2]);;<-frame
	triggerall=playeridexist(floor(sysfvar(0)))
	triggerall=playerid(floor(sysfvar(0))),stateno=90900
	triggerall=playerid(floor(sysfvar(0))),var(17)>0
	trigger1=target,command="y"||target,command="b"
	trigger2=target,var(51)>0 && (random%2)
	trigger2=random<target,var(51)*118 ;*at
	value=190130


;--------------------
; 挑発 (taunt)
[state 0]
	type=changestate
	value=195
	triggerall=command="s"
	triggerall=!ishelper && var(51)<1
	trigger1=statetype=s && ctrl



;--------------------
; 基本 (basic)
;--------------------
; s-lp
; 立ち弱パンチ
[state 0]
	type=changestate
	value=200
	triggerall=command="x" && command!="holddown"
	triggerall=!ishelper && var(51)<1
	trigger1=statetype!=a && ctrl
	trigger2=(stateno=200||stateno=260||stateno=400||stateno=430) && (time>5||movecontact)

; s-hp
; 立ち強パンチ
[state 0]
	type=changestate
	value=ifelse(p2bodydist x<26,210,220)
	triggerall=command="y" && command!="holddown"
	triggerall=!ishelper && var(51)<1
	trigger1=statetype=s && ctrl

; s-lk-sp
; 立ち弱キック(中形/中段)
[state 0]
	type=changestate
	value=270
	triggerall=command="a" && command="holdfwd" && command!="holddown"
	triggerall=!ishelper && var(51)<1
	trigger1=statetype=s && ctrl

; s-lk-sp-cnacel
; 立ち弱キック(中段-キャンセル)
[state 0]
	type=changestate
	value=275
	triggerall=command="a" && command="holdfwd" && command!="holddown"
	triggerall=!ishelper && var(51)<1
	trigger1=statetype!=a && var(41) && stateno!=275

; s-hk-upper
; 立ち強キック(上形/打ち上げ)
[state 0]
	type=changestate
	value=250
	triggerall=command="b" && command="holdfwd" && command!="holddown"
	triggerall=!ishelper && var(51)<1
	trigger1=statetype!=a && (ctrl || var(41)) && stateno!=250

; s-lk
; 立ち弱キック
[state 0]
	type=changestate
	value=260
	triggerall=command="a" && command!="holddown"
	triggerall=!ishelper && var(51)<1
	trigger1=statetype!=a && ctrl
	trigger2=(stateno=200||stateno=260||stateno=400||stateno=430) && (time>5||movecontact)

; s-hk
; 立ち強キック
[state 0]
	type=changestate
	value=ifelse(p2bodydist x<16,230,240)
	triggerall=command="b" && command!="holddown"
	triggerall=!ishelper && var(51)<1
	trigger1=statetype=s && ctrl

;--------------------
; c-lp
; しゃがみ弱パンチ
[state 0]
	type=changestate
	value=400
	triggerall=command="x" && command="holddown"
	triggerall=!ishelper && var(51)<1
	trigger1=statetype!=a && ctrl
	trigger2=(stateno=200||stateno=260||stateno=400||stateno=430) && (time>5||movecontact)

; c-hp
; しゃがみ強パンチ
[state 0]
	type=changestate
	value=410
	triggerall=command="y" && command="holddown"
	triggerall=!ishelper && var(51)<1
	trigger1=statetype=c && ctrl

; c-lk
; しゃがみ弱キック
[state 0]
	type=changestate
	value=430
	triggerall=command="a" && command="holddown"
	triggerall=!ishelper && var(51)<1
	trigger1=statetype!=a && ctrl
	trigger2=(stateno=200||stateno=260||stateno=400||stateno=430) && (time>5||movecontact)

; c-hk
; しゃがみ強キック
[state 0]
	type=changestate
	value=440
	triggerall=command="b" && command="holddown"
	triggerall=!ishelper && var(51)<1
	trigger1=statetype=c && ctrl

;--------------------
; j-lp
; ジャンプ弱パンチ
[state 0]
	type=changestate
	value=600
	triggerall=command="x"
	triggerall=!ishelper && var(51)<1
	trigger1=statetype=a && ctrl

; j-hp
; ジャンプ強パンチ
[state 0]
	type=changestate
	value=610
	triggerall=command="y"
	triggerall=!ishelper && var(51)<1
	trigger1=statetype=a && ctrl

; j-lk
; ジャンプ弱キック
[state 0]
	type=changestate
	value=630
	triggerall=command="a"
	triggerall=!ishelper && var(51)<1
	trigger1=statetype=a && ctrl

; j-hk
; ジャンプ強キック
[state 0]
	type=changestate
	value=640
	triggerall=command="b"
	triggerall=!ishelper && var(51)<1
	trigger1=statetype=a && ctrl

;========
;========
; leap
; リープアタック
[state 0]
	type=changestate
	trigger1=(command="x" && command="a") && command!="holdup"
	trigger1=(sysvar(4)=2)
	trigger1=!ishelper && var(51)<1
	trigger1=statetype!=a && (ctrl || var(41))
	value=48
	ctrl=0
;**;	ignorehitpause=1 ;;<- 注:全cmdより優先に実行
;---
; guard breaking
; ガード・ブレーキング
[state 0]
	type=changestate
	trigger1=command="y" && command="b"
	trigger1=sysvar(4)=2 && roundstate=2
	trigger1=!ishelper && var(51)<1
	trigger1=power>=1000
	trigger1=statetype!=a && (ctrl || var(41))
	value=8210
	ctrl=0
	ignorehitpause=1

;========
; guard cancel attack
; ガードキャンセル - 攻撃
[state 0]
	type=changestate
	triggerall=!ishelper
	triggerall=roundstate=2 && power>=1000
	triggerall=(stateno=150||stateno=152) ;;&& time>0
	trigger1=var(51)<1
	trigger1=(command="a" && command="b") || command="c"
	trigger2=var(51)>0 ;; ai_gc
	trigger2=random<((roundno+matchno)/3.0+var(51))*500 && random>life*2
	trigger2=random>p2bodydist x*50 || p2bodydist x<82
	value=8200
	ctrl=0
	ignorehitpause=1

; guard calcel move
; ガードキャンセル - 移動
[state 0]
	type=changestate
	triggerall=!ishelper
	triggerall=alive
	triggerall=command="recovery"
	triggerall=power>=ifelse(sysvar(4)=2,500,1000)
	trigger1=stateno=150 || stateno=152
	value=ifelse(command="holdback",115,110)
	ctrl=0
	ignorehitpause=1 ; add
[state 0]
	type=poweradd
	triggerall=!sysvar(4)
	trigger1=stateno=110||stateno=115
	trigger1=time=1 && (prevstateno=[150,152])
	value=-ifelse(sysvar(4)=2,500,1000)
	ignorehitpause=1
[state 0]
	type=palfx
	trigger1=stateno=110||stateno=115
	trigger1=time=1 && (prevstateno=[150,152])
	time=6
	add=128,128,128
	ignorehitpause=1
[state 0]
	type=nothitby
	trigger1=stateno=110||stateno=115
	trigger1=(prevstateno=[150,152])
	value=sca
	time=2
	ignorehitpause=1












;-------------------
; [ai]
;-------------------


; jump long_fwd
[state 0]
	type=changestate
	value=142011
	triggerall=!ishelper
	triggerall=var(51)>0 && roundstate=2 && statetype!=a && statetype!=l && ctrl && random<360 && sysvar(4)
	trigger1=enemynear,movetype=a && enemynear,statetype!=a
	trigger1=enemynear,numprojid(91000)
	trigger1=!enemynear,numprojid(91010)
	trigger1=!enemynear,numprojid(91020)
	trigger1=!enemynear,numprojid(91030)
	trigger1=!enemynear,numprojid(91040)
; jump small/mid_fwd
[state 0]
	type=changestate
	value=142020+(p2bodydist x>88)*10+(p2bodydist x>39)
	triggerall=!ishelper
	triggerall=var(51)>0 && roundstate=2 && sysvar(4) && sysvar(4)!=2 && statetype!=a && ctrl ;; && p2movetype=i
	trigger1=p2bodydist x<128 && p2statetype=c && random<368
; leap
[state 0]
	type=changestate
	value=48
	triggerall=!ishelper
	triggerall=var(51)>0 && roundstate=2 && sysvar(4)=2 && statetype!=a && ctrl ;; && p2movetype=i
	trigger1=p2bodydist x<88 && p2statetype=c && random<368
;;---
;; cancel attack
[state 0]
	type=changestate
	value=275
	triggerall=!ishelper
	triggerall=var(51)>0 && roundstate=2 && statetype!=a && (stateno!=275)
	trigger1=var(41) && random<22
	trigger2=(stateno=210||stateno=230) && movecontact && random<ifelse(movehit,500,300)
[state 0]
	type=changestate
	value=250
	triggerall=!ishelper
	triggerall=var(51)>0 && roundstate=2 && statetype!=a && (stateno!=250)
	trigger1=var(41) && random<22
	trigger2=var(41) && stateno=275 && (animelem=10,>0) && random<150

;-------------------
; 近距離・立弱 p200, k260 / 近距離・立強p <26,220,210 k <16,230,240
[state 0] ; stand attack***
	type=changestate
	value= ifelse(random<350, ifelse(random<500,200,260), ifelse(random<500, ifelse(p2bodydist x<26,210,220), ifelse(p2bodydist x<16,230,240)) )
	triggerall=!ishelper
	triggerall=var(51)>0 && roundstate=2 && statetype!=a && ctrl && p2statetype!=l
	trigger1=sysfvar(0)>0 && playeridexist(floor(sysfvar(0)))
	trigger1=(playerid(floor(sysfvar(0))),var(0)=90900) && playerid(floor(sysfvar(0))),var(18)%10=1
	trigger2=(p2bodydist x=[0,32]) && (enemynear,statetype=s) && random<400
	trigger3=(stateno=[100,101]) && (p2bodydist x=[0,26]) && (enemynear,numproj=0) && random<400
	trigger4=(prevstateno=[600,699]) && (p2bodydist x=[0,42]) && random<400

;---
; 屈・弱p400 弱k430 強p410 強k440
[state 0] ; crouching attack
	type=changestate
	value=ifelse(random<350, ifelse(random<600,430,400), ifelse(random<750,410,440) )
	triggerall=!ishelper
	triggerall=var(51)>0 && roundstate=2 && statetype!=a && ctrl && p2statetype!=l
	trigger1=sysfvar(0)>0 && playeridexist(floor(sysfvar(0)))
	trigger1=(playerid(floor(sysfvar(0))),var(0)=90900) && (playerid(floor(sysfvar(0))),var(18)/10)%10=1
	trigger2=(p2bodydist x<42) && (enemynear,movetype!=a) && (enemynear,statetype=s) && random<180
	trigger3=(stateno=[100,101]) && (p2bodydist x<26) && (enemynear,numproj=0) && (enemynear,statetype!=a) && random<220
	trigger4=(prevstateno=52) && (p2bodydist x<42) && random<200

; 屈・弱p 400
[state 0]
	type=changestate
	value=400
	triggerall=!ishelper
	triggerall=var(51)>0 && roundstate=2 && (p2bodydist x=[-28,28])
	trigger1=(stateno=200||stateno=260||stateno=400||stateno=430) && (movecontact||time>5) && random<200
; 屈・弱k 430
[state 0]
	type=changestate
	value=430
	triggerall=!ishelper
	triggerall=var(51)>0 && roundstate=2 && (p2bodydist x=[-28,28])
	trigger1=(stateno=200||stateno=260||stateno=400||stateno=430) && (movecontact||time>5) && random<250

; 屈・強k
[state 0]
	type=changestate
	value=440
	triggerall=!ishelper
	triggerall=var(51)>0 && roundstate=2 && statetype!=a && ctrl && p2statetype!=l
	trigger1=(p2bodydist x=[5,60]) && (p2movetype!=a) && (p2statetype=s) && random<125

;---
; 空中攻撃 :: 弱p600 強p610 弱k630 強k640
[state 0] ; jump attack
	type=changestate
	value=ifelse(random<300, ifelse(random<500,600,610), ifelse(random<400,630,640) )
	triggerall=!ishelper
	triggerall=var(51)>0 && roundstate=2 && statetype=a && ctrl && numenemy
	trigger1=sysfvar(0)>0 && playeridexist(floor(sysfvar(0)))
	trigger1=(playerid(floor(sysfvar(0))),var(0)=90900) && (playerid(floor(sysfvar(0))),var(18)/100)%10=1
	trigger2=(pos y>-65) && (vel y>0) && (p2bodydist x=[-35,85]) && random<800

;-------- special
; reflect
[state 0]
	type=changestate
	value=1400
	triggerall=!ishelper
	triggerall=var(3)=2 || var(3)=3 ;<-char type
	triggerall=var(51)>0 && numenemy && roundstate=2
	triggerall=statetype!=a &&ctrl
	triggerall=enemynear,numprojid(91000)
	trigger1=random<066 && enemynear,numprojid(91010)
	trigger2=random<928 && enemynear,numprojid(91020)
	trigger3=random<082 && enemynear,numprojid(91030)
	trigger4=random<038 && enemynear,numprojid(91040)
;---
; dash (kyuki/nishi)
[state 0]
	type=changestate
	value=ifelse(random<600,1000,ifelse(var(3)=2,1300,1700))
	triggerall=!ishelper
	triggerall=var(51)>0 && roundstate=2 && movetype!=h && statetype!=a && p2statetype!=l && numenemy
	trigger1=ctrl && p2movetype=a && p2bodydist x<32 && random<420
	trigger2=(stateno=[100,101]) && p2movetype=a && p2bodydist x<26 && random<220
	trigger3=ctrl && prevstateno=52 && p2statetype=a && p2bodydist x<62 && p2bodydist y>-80 && random<580
	trigger4=ctrl && p2statetype=a && p2bodydist x<32 && p2bodydist y>-80 && random<188
	trigger5=enemynear,movetype=a && enemynear,statetype!=a && enemynear,numprojid(91000)
	trigger5=ctrl && random<158
	trigger6=var(41) && (stateno=275) && (animelem=10,>0) && random<ifelse(movehit,618,228)
	trigger7=ctrl && (prevstateno=250 || prevstateno=8200) && movehit && random<180
;---
; upcut
[state 0]
	type=changestate
	value=1200
	triggerall=!ishelper
	triggerall=var(51)>0 && roundstate=2 && numenemy
	triggerall=statetype!=a && ctrl && p2statetype!=l && enemynear,numprojid(91000)=0
	trigger1=(stateno=[100,101]) && p2movetype=a && (p2bodydist x=[10,50]) && random<186
	trigger2=(prevstateno=[100,105]) && p2bodydist x<86 && random<388
	trigger3=(prevstateno=[100,105]) && p2bodydist x<99 && enemynear,movetype=a && random<258
	trigger4=prevstateno=8200 && p2bodydist x<90 && random<580
	trigger5=prevstateno=5120 && p2bodydist x<96 && enemynear,movetype=a && random<620
	trigger6=enemynear,statetype=a && p2bodydist x<56 && (p2bodydist y=[-130,40]) && random<380
	trigger7=(prevstateno=250 || prevstateno=8200) && p2bodydist x<66 && movehit && random<180
;---
; fireball
[state 0]
	type=changestate
	value=1100
	triggerall=!ishelper
	triggerall=var(51)>0 && roundstate=2 && statetype!=a && !numprojid(91000) && numenemy
	trigger1=ctrl && (p2bodydist x>150) && p2statetype!=a && random<99
	trigger2=var(41) && random<88
	trigger3=var(41) && (stateno=275) && (animelem=10,>0) && random<ifelse(movehit,218,528)
;---
; kusyu (air-sp)
[state 0]
	type=changestate
	value=1500
	triggerall=!ishelper
	triggerall=var(51)>0 && roundstate=2 && numenemy && (gametime%260>180)
	triggerall=statetype=a && ctrl && p2statetype!=l
	trigger1=random<58 && (vel y=[-2,2])
;---
; blow
[state 0]
	type=changestate
	value=1600
	triggerall=!ishelper
	triggerall=var(3)=1 || var(3)=3 ;<-char type
	triggerall=var(51)>0 && roundstate=2 && movetype!=h && statetype!=a && p2statetype!=l && numenemy
	trigger1=ctrl && p2movetype=a && p2bodydist x<32 && random<420
	trigger2=(stateno=[100,101]) && p2movetype=a && p2bodydist x<26 && random<220
	trigger3=ctrl && prevstateno=52 && p2statetype=a && p2bodydist x<62 && p2bodydist y>-80 && random<580
	trigger4=ctrl && p2statetype=a && p2bodydist x<32 && p2bodydist y>-80 && random<188
	trigger5=enemynear,movetype=a && enemynear,statetype!=a && enemynear,numprojid(91000)
	trigger5=ctrl && random<158
	trigger6=var(41) && (stateno=275) && (animelem=10,>0) && random<ifelse(movehit,618,228)
	trigger7=ctrl && prevstateno=250 && movehit && random<180

;--------hyper
; upcut-super
[state 0]
	type=changestate
	value=3000
	triggerall=!ishelper
	triggerall=var(51)>0 && roundstate=2 && power>=1000
	triggerall=statetype!=a &&(stateno!=[800,805]) &&(stateno!=[3000,3050]) && ctrl && enemynear,statetype!=l
	trigger1=((prevstateno=[100,105]) &&(p2bodydist x=[0,100]) && enemynear,movetype=a) && random<550
	trigger2=(prevstateno=5120 &&(enemynear,movetype=a) &&(p2bodydist x=[10,100])) && random<650
	trigger3=((enemynear,statetype=a) &&(p2bodydist x=[0,50]) &&(p2bodydist y=[-130,40])) && random<400
;--------
; dash-super
[state 0]
	type=changestate
	value=ifelse(var(3)=2,3100,3400)
	triggerall=!ishelper
	triggerall=var(51)>0 && roundstate=2 && numenemy && power>=1000
	triggerall=statetype!=a && enemynear,statetype!=l && random<500
	trigger1=var(41) && (stateno=275) && (animelem=10,>0) && random<ifelse(movehit,318,128)
	trigger2=enemynear,statetype=a && p2bodydist x<99 && p2bodydist y>-60 && ctrl && random<200
;---
; upcut-super
[state 0]
	type=changestate
	value=3000
	triggerall=!ishelper
	triggerall=var(51)>0 && roundstate=2 && power>=1000 && movetype!=h && statetype!=a && p2statetype!=l && numenemy
	trigger1=ctrl && p2movetype=a && p2bodydist x<32 && random<418
	trigger2=(stateno=[100,101]) && p2movetype=a && p2bodydist x<26 && random<288
	trigger3=p2statetype=a && p2bodydist x<32 && p2bodydist y>-80 && ctrl && random<288
	trigger4=var(41) && random<88
	trigger5=var(41) && (stateno=275) && (animelem=10,>0) && p2bodydist x<39 && random<ifelse(movehit,318,88)
;---
; fireball-super
[state 0]
	type=changestate
	value=3200
	triggerall=!ishelper
	triggerall=var(51)>0 && roundstate=2 && statetype!=a && power>=1000 && !numprojid(91000) && numenemy
	trigger1=(p2bodydist x>150 && p2statetype!=a && ctrl) && random<66
	trigger2=var(41) && random<88
	trigger3=var(41) && (stateno=275 && animelem=10,>0) && random<ifelse(movehit,108,268)
;--------
; max2
[state 0]
	type=changestate
	value=3500
	triggerall=!ishelper
	triggerall=var(51)>0 && roundstate=2 && numenemy && power>=2000
	triggerall=statetype!=a && p2statetype!=a && enemynear,numprojid(91000)=0
	trigger1=var(41) && p2bodydist x<42 && enemynear,backedgebodydist<6 && random<50
	trigger2=ctrl && p2bodydist y>-20 && p2bodydist x<42 && p2statetype=a && random<99
;--------
; throw
[state 0]
	type=changestate
	value=800
	triggerall=!ishelper
	triggerall=var(51)>0 && roundstate=2 && statetype!=a && ctrl && (stateno!=[100,101]) && (p2bodydist x=[-12,12])
	trigger1=p2statetype!=a && p2movetype!=h && p2statetype!=l && random<(matchno+roundno+1)*88 && random<var(51)*98 ;*ntv

; 中段
[state 0]
	type=changestate
	value=270
	triggerall=!ishelper
	triggerall=var(51)>0 && roundstate=2 && statetype!=a && ctrl && p2statetype=c && p2movetype!=a
	trigger1=(p2bodydist x<30) && random<100 && random>life*2
;--------
;========
;========
;========
;========












;========
; kfms clones helper [id:10001-10003]
;========

;; goto helper remove state
[state 0]
	type=selfstate
	triggerall=ishelper(10001)||ishelper(10002)||ishelper(10003)
	trigger1=(stateno=5110) && (life<2)
	value=5150
;---
; goto standing state no:0
[state 0]
	type=selfstate
	value=6000
	triggerall=ishelper(10001)||ishelper(10002)||ishelper(10003)
	trigger1=(stateno=0) || (stateno=[10,12]) || (stateno=[20,21]) || ((stateno=[100,101]) && (p2bodydist x=[-160,160]))
;---
; goto crouching state no:11
[state 0]
	type=selfstate
	triggerall=ishelper(10001)||ishelper(10002)||ishelper(10003)
	triggerall=(stateno=11)
	trigger1=(roundstate!=2) || (ctrl && time>88) || (life<2)
	value=12
[state 0]
	type=changeanim
	triggerall=ishelper(10001)||ishelper(10002)||ishelper(10003)
	triggerall=(stateno=11) && (anim=11) && numenemy
	trigger1=facing= 1 && (screenpos x>enemynear,screenpos x)
	trigger2=facing=-1 && (screenpos x<enemynear,screenpos x)
	value=6
[state 0]
	type=turn
	triggerall=ishelper(10001)||ishelper(10002)||ishelper(10003)
	triggerall=(stateno=11) && numenemy
	trigger1=facing= 1 && (screenpos x>enemynear,screenpos x)
	trigger2=facing=-1 && (screenpos x<enemynear,screenpos x)
;---
; goto crouching guard state
[state 0]
	type=statetypeset
	triggerall=ishelper(10001)||ishelper(10002)||ishelper(10003)
	triggerall=(stateno=120)||(stateno=140)||(stateno=[150,153])
	triggerall=statetype=s && numenemy
	trigger1=enemynear,movetype=a
	trigger1=enemynear,statetype=c||(enemynear,hitdefattr=c,na,sa,ha)
	trigger2=enemynear,movetype=a
	trigger2=enemynear,statetype=c||(enemynear,hitdefattr=c,na,sa,ha)
	statetype=c
	physics=c
	ignorehitpause=1

;========
; jump attack
[state 0]
	type=changestate
	value=ifelse(random<500,610,640)
	triggerall=ishelper(10001)||ishelper(10002)||ishelper(10003)
	triggerall=roundstate=2 && var(51)>1 && statetype=a && ctrl && numenemy
	triggerall=enemynear,statetype!=l
	triggerall=enemynear,stateno!=190116 ;;<-dizzy/stun
	triggerall=enemynear,numhelper(403000)=0 ;;<-dizzy birds
	triggerall=random<20+var(51)*12
	triggerall=var(14) ;;<-screen-in
	trigger1=p2bodydist x<60 && p2bodydist y<68 && vel y>0
	trigger2=p2bodydist x<60 && p2bodydist y<52 && vel y<0
	trigger2=enemynear,pos y<0 && enemynear,vel y<0
	trigger3=(p2bodydist x=[-8,18]) &&(p2bodydist y=[-12,12])
; jump attack-sp
[state 0]
	type=changestate
	value=1500
	triggerall=ishelper(10001)||ishelper(10002)||ishelper(10003)
	triggerall=roundstate=2 && var(51)>2 && statetype=a && ctrl && numenemy
	triggerall=enemynear,statetype!=l
	trigger1=(vel y=[-2,2]) && random<8+var(51)*8+p2bodydist x
	trigger1=enemynear,stateno!=190116 ;;<-dizzy/stun
	trigger1=enemynear,numhelper(403000)=0 ;;<-dizzy birds
	trigger1=var(14) ;;<-screen-in
; jump attack-hp
[state 0]
	type=changestate
	value=3300
	triggerall=ishelper(10001)||ishelper(10002)||ishelper(10003)
	triggerall=roundstate=2 && var(51)>3 && statetype=a && ctrl && numenemy
;op;	triggerall=power>=3000
	triggerall=random<35+var(51)
	triggerall=enemynear,statetype!=l
	trigger1=(vel y=[-2,2]) && random<5+var(51)*5+p2bodydist x
	trigger1=enemynear,stateno!=190116 ;;<-dizzy/stun
	trigger1=enemynear,numhelper(403000)=0 ;;<-dizzy birds
	trigger1=var(14) ;;<-screen-in

;======== remove kfms (helper) in stateno:5150
; bonus
[state 0]
	type=explod
	trigger1=ishelper(10001)||ishelper(10002)||ishelper(10003)
	trigger1=stateno=5150 && time=50
	anim=19010+ifelse(var(51)>6,5,var(51)-1)*100
	sprpriority=5
	postype=p1
	pos=0,0
	scale=2/root,fvar(0),2/root,fvar(0)
	facing=facing
	removetime=-2
	vel=0,-0.5
	ownpal=0
; count kfms
[state 0]
	type=parentvaradd
	trigger1=ishelper(10001)||ishelper(10002)||ishelper(10003)
	trigger1=stateno=5150 && time=1
	var(50)=1
; alive counter/flag
[state 0]
	type=varadd
	trigger1=ishelper(10001)||ishelper(10002)||ishelper(10003)
	trigger1=stateno=5150
	var(18)=1
[state 0]
	type=assertspecial
	trigger1=ishelper(10001)||ishelper(10002)||ishelper(10003)
	trigger1=stateno=5150 && time>30 && (time%7<3)
	trigger1=ishelper(10001)||ishelper(10002)||ishelper(10003)
	flag=invisible
;========
;======== realtime
[state 0]
	type=attackmulset
	trigger1=ishelper(10001)||ishelper(10002)||ishelper(10003)
;op;	trigger1=numenemy
;op;	trigger1=enemynear,ailevel<1
	value=0
	ignorehitpause=1

[state 0]
	type=playerpush
	trigger1=ishelper(10001)||ishelper(10002)||ishelper(10003)
	trigger1=stateno!=10002
	trigger1=stateno!=5150
	trigger1=stateno!=105150
	trigger1=stateno!=5110
	value=1
	ignorehitpause=1
[state 0]
	type=screenbound
	trigger1=ishelper(10001)||ishelper(10002)||ishelper(10003)
	trigger1=var(14)
	trigger1=stateno!=10002
	trigger1=stateno!=5150
	trigger1=stateno!=105150
	trigger1=stateno!=5110
	value=1
;op;	movecamera=1,0
	ignorehitpause=1
; screen-in
[state 0]
	type=varset
	trigger1=ishelper(10001)||ishelper(10002)||ishelper(10003)
	trigger1=!var(14)
	trigger1=(screenpos x=[60,root,var(17)-60]) && (pos y>-28)
	trigger1=stateno!=10002
	var(14)=1
	ignorehitpause=1
;---
;---
; ko sound
[state 0]
	type=playsnd
	trigger1=!var(2) && !alive
	trigger1=movetype=h && !ctrl
	trigger1=stateno!=10002
	trigger1=stateno!=10005
	trigger1=stateno!=10006
	value=s1,11+var(3)*100
	channel=0
	ignorehitpause=1
[state 0]
	type=varset
	trigger1=!var(2) && !alive
	var(2)=1
	ignorehitpause=1
;---
;---
[state 0]
	type=destroyself
	trigger1=ishelper(10001)||ishelper(10002)||ishelper(10003)
	trigger1=stateno=5150 && time>=82
	recursive=1
	removeexplods=1

; reinit for training mode
[state 0]
	type=changestate
	trigger1=ishelper(10001)||ishelper(10002)||ishelper(10003)
	trigger1=stateno=5150 && time=82
	value=10002

;---for_training_mode
; life2var
[state 0]
	type=lifeset
	triggerall=ishelper(10001)||ishelper(10002)||ishelper(10003)
	triggerall=stateno!=10002
	trigger1=ishelper(10001) && (root,var(42)<life)
	trigger2=ishelper(10002) && (root,var(43)<life)
	trigger3=ishelper(10003) && (root,var(44)<life)
	value=root,var(42+ishelper(10002)+ishelper(10003)*2)
	kill=0
	ignorehitpause=1


;-------------------
;=========
; AI switch
;[state 0]
;	type=varset
;	triggerall=!ishelper
;	trigger1=playeridexist(floor(sysfvar(0)))
;	trigger1=playerid(floor(sysfvar(0))),stateno=90900
;	trigger1=var(51)!=playerid(floor(sysfvar(0))),var(51)
;	var(51)=playerid(floor(sysfvar(0))),var(51)

;; v1.0
[state 0]
	type=varset
	trigger1=!ishelper
	var(51)=ailevel

;=========
;[EOF]
