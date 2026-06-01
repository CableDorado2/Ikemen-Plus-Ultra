; The CMD file.

;-| Button Remapping |-----------------------------------------------------
[Remap]
x = x
y = y
z = z
a = a
b = b
c = c
s = s

;-| Default Values |-------------------------------------------------------
[Defaults]
; Default value for the "time" parameter of a Command. Minimum 1.
command.time = 15

; Default value for the "buffer.time" parameter of a Command. Minimum 1,
; maximum 30.
command.buffer.time = 1


;-| Super Motions |--------------------------------------------------------

;-| Special Motions |------------------------------------------------------

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
name = "recovery";Required (do not remove)
command = x+y
time = 1

;-| Dir + Button |---------------------------------------------------------

[Command]
name = "SafeFall"
command = U,a
time = 6

[Command]
name = "SafeFall"
command = a,U
time = 6

[Command]
name = "ThrowEscape"
command = B,y
time = 6

[Command]
name = "ThrowEscape"
command = y,B
time = 6

[Command]
name = "ThrowEscape"
command = F,y
time = 6

[Command]
name = "ThrowEscape"
command = y,F
time = 6

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

;-| Specific Direction |--------------------------------------------------------------

[Command]
name = "DownBack"
command = DB
time = 1

[Command]
name = "Down"
command = D
time = 1

[Command]
name = "DownFwd"
command = DF
time = 1

[Command]
name = "UpBack"
command = UB
time = 1

[Command]
name = "Up"
command = U
time = 1

[Command]
name = "UpFwd"
command = UF
time = 1

[Command]
name = "Forwards"
command = F
time = 1

[Command]
name = "Backwards"
command = B
time = 1

[Statedef -1]

;===========================================================================
;---------------------------------------------------------------------------
;Run Fwd
;[State -1, Run Fwd]
;type = ChangeState
;value = 100
;trigger1 = IsHelper = 0
;trigger1 = command = "FF"
;trigger1 = statetype = S
;trigger1 = ctrl

;---------------------------------------------------------------------------
;Run Back
;[State -1, Run Back]
;type = ChangeState
;value = 105
;trigger1 = IsHelper = 0
;trigger1 = command = "BB"
;trigger1 = statetype = S
;trigger1 = ctrl

;Enemy Stuff (Moved from -2 states)

;Knockdown from Player KO
[State 21021, ChangeState]
type = ChangeState
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = Time > 0
trigger1 = (root, NumHelper(386) = 1)
trigger1 = StateNo = [10000,21875]
trigger1 = StateNo != [10030,11003];Custom Hitstates
trigger1 = StateNo != 11031;Raven Pummel Finisher
trigger1 = StateNo != 11151;Fog Wait
trigger1 = StateNo != 21035;Jet Recover
trigger1 = StateNo != 21077;Zamza Spin Recover
trigger1 = StateNo != 21145;R.Bear Pummel Finisher
trigger1 = StateNo != 21171;Mr.X Old Intro
trigger1 = StateNo != 21177;Mr.X KO 1a/2
trigger1 = StateNo != 21178;Mr.X KO 1b/2
trigger1 = StateNo != 21179;Mr.X KO 2/2
trigger1 = StateNo != 21181;Shiva Get Up 2/2
trigger1 = StateNo != 21195;Enemy Run Away
trigger1 = StateNo != 21199;Particle/Molecule Explode
trigger1 = StateNo != 21211;Rocket Recover
trigger1 = StateNo != [21227,21245];Intros
trigger1 = StateNo != [21347,21367];Vehelits+Roo/Bruce/Ash Stats+Roo/Bruce/Ash Appear
trigger1 = StateNo != 21467;Twins Stats
trigger1 = StateNo != 21497;Twins Intro
trigger1 = StateNo != 21511;Jet MKII Stats
trigger1 = StateNo != 21565;P1 Self-Destruct 1/2
trigger1 = StateNo != 21567;P1 Self-Destruct 2/2
trigger1 = StateNo != 21569;Antonio/Souther Stats
trigger1 = StateNo != 21595;Harakiri Stats
trigger1 = StateNo != 21733;Assist Enemy Stats
trigger1 = StateNo != [21623,21639];Control Panel States
trigger1 = StateNo != [21613,21619];Seeker States
trigger1 = StateNo != 21707;Mona Team Lift State
trigger1 = StateNo != 21785;Onihime/Yasha Stats
trigger1 = StateNo != 21831;Bongo/Warrior Stats
trigger1 = StateNo != [21857,21861];Shiva/Mr.X Intros
value = 8613

;Quick KO Bonus Point Reduction
[State -1, VarAdd]
type = VarAdd
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = Var(10) > 0
trigger1 = StateType != L
trigger1 = MoveType != H
trigger1 = StateNo = [10000,21875]
trigger1 = StateNo != 10010 && StateNo != 10011 && StateNo != 10013 && StateNo != 21871;Blocking (HitOverride version)/Shiva guard
trigger1 = StateNo != [120,155];MUGEN default guard
trigger1 = StateNo != [10030,11003];Custom Hitstates
;trigger1 = StateNo != 11031;Raven Pummel Finisher
trigger1 = StateNo != 11151;Fog Wait
trigger1 = StateNo != 21035;Jet Recover
trigger1 = StateNo != 21077;Zamza Spin Recover
;trigger1 = StateNo != 21145;R.Bear Pummel Finisher
trigger1 = StateNo != 21171;Mr.X Old Intro
trigger1 = StateNo != 21177;Mr.X KO 1a/2
trigger1 = StateNo != 21178;Mr.X KO 1b/2
trigger1 = StateNo != 21179;Mr.X KO 2/2
trigger1 = StateNo != 21181;Shiva Get Up 2/2
;trigger1 = StateNo != 21195;Enemy Run Away
trigger1 = StateNo != 21199;Particle/Molecule Explode
trigger1 = StateNo != 21211;Rocket Recover
trigger1 = StateNo != [21227,21245];Intros
trigger1 = StateNo != [21351,21357];Vehelits' KO State + Intro
trigger1 = StateNo != [21363,21367];Bruce+Roo+Ash Stats + Appear
trigger1 = StateNo != 21467;Twins Stats
trigger1 = StateNo != 21497;Twins Intro
trigger1 = StateNo != 21511;Jet MKII Stats
trigger1 = StateNo != 21275;Electra Feint
trigger1 = StateNo != 5110;LieDown
trigger1 = StateNo != 5120;GetUp
trigger1 = StateNo != 8500;Stunned from enemy escaping a throw
trigger1 = StateNo != 8613;Knockdown from player KO
trigger1 = StateNo != 21565;P1 Self-Destruct 1/2
trigger1 = StateNo != 21567;P1 Self-Destruct 2/2
trigger1 = StateNo != 21569;Antonio/Souther Stats
trigger1 = StateNo != 21595;Harakiri Stats
trigger1 = StateNo != 21733;Assist Enemy Stats
trigger1 = StateNo != 21785;Onihime/Yasha Stats
trigger1 = StateNo != 21831;Bongo/Warrior Stats
trigger1 = StateNo != [21857,21861];Shiva/Mr.X Intros
trigger1 = Var(53) <= 0;Boss invincible time is over
trigger1 = ((Var(0) != 19) || (FVar(1) > 1000)) || ((Var(0) = 19) && (FVar(1) <= 1000) && (GameTime%3 = 0))
v = 10
value = -1
ignorehitpause = 1

;Quick KO Bonus Point Reduction
;[State -1, VarAdd]
;type = VarAdd
;trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
;trigger1 = Var(10) > 0
;trigger1 = StateType != L
;trigger1 = StateNo = [10000,21855]
;trigger1 = StateNo != [10030,11003];Custom Hitstates
;;trigger1 = StateNo != 11031;Raven Pummel Finisher
;trigger1 = StateNo != 11151;Fog Wait
;trigger1 = StateNo != 21035;Jet Recover
;trigger1 = StateNo != 21077;Zamza Spin Recover
;;trigger1 = StateNo != 21145;R.Bear Pummel Finisher
;trigger1 = StateNo != 21171;Mr.X Intro
;trigger1 = StateNo != 21177;Mr.X KO 1a/2
;trigger1 = StateNo != 21178;Mr.X KO 1b/2
;trigger1 = StateNo != 21179;Mr.X KO 2/2
;trigger1 = StateNo != 21181;Shiva Get Up 2/2
;;trigger1 = StateNo != 21195;Enemy Run Away
;trigger1 = StateNo != 21199;Particle/Molecule Explode
;trigger1 = StateNo != 21211;Rocket Recover
;trigger1 = StateNo != [21227,21245];Intros
;trigger1 = StateNo != [21353,21357];Vehelits' KO State + Intro
;trigger1 = StateNo != [21363,21367];Bruce+Roo+Ash Stats + Appear
;trigger1 = StateNo != 21467;Twins Stats
;trigger1 = StateNo != 21497;Twins Intro
;trigger1 = StateNo != 21511;Jet MKII Stats
;trigger1 = StateNo != 21275;Electra Feint
;trigger1 = StateNo != 5110;LieDown
;trigger1 = StateNo != 5120;GetUp
;trigger1 = StateNo != 8500;Stunned from enemy escaping a throw
;trigger1 = StateNo != 8613;Knockdown from player KO
;trigger1 = StateNo != 21565;P1 Self-Destruct 1/2
;trigger1 = StateNo != 21567;P1 Self-Destruct 2/2
;trigger1 = StateNo != 21569;Antonio/Souther Stats
;trigger1 = StateNo != 21595;Harakiri Stats
;trigger1 = StateNo != 21733;Assist Enemy Stats
;trigger1 = StateNo != 21785;Onihime/Yasha Stats
;trigger1 = StateNo != 21831;Bongo/Warrior Stats
;trigger1 = Var(53) <= 0;Boss invincible time is over
;trigger1 = (Var(0) = 19) && (FVar(1) <= 1000)
;trigger1 = GameTime%3 = 0
;v = 10
;value = -1
;ignorehitpause = 1

;Damage Tracker
[state -1, VarSet]
type = varset
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = 1
var(30) = var(31)

[State -1, VarSet]
Type = VarSet
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
Trigger1 = 1
var(31) = life

[State -1, VarSet]
type = varset
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = 1
var(32) = var(30)-var(31)
ignorehitpause = 1

[State -1, VarSet]
type = VarSet
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = Var(32) > Floor(500.001/(root,FVar(38)))
v = 32
value = Floor(500.001/(root,FVar(38)))
ignorehitpause = 1

;HitCount
[State -1, VarAdd]
type = VarAdd
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = Var(32) > 0
;trigger1 = MoveType = H
v = 33
value = 1
ignorehitpause = 1

;Combo Bonus Multiplier Start

;No Bonus
[State -1, VarSet]
type = VarSet
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = Var(33) = [0,2]
trigger1 = FVar(38) != 1
fv = 38
value = 1
ignorehitpause = 1

;Combo Bonus
[State -1, VarSet]
type = VarSet
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = Var(33) = [3,12]
trigger1 = FVar(38) != 1+((Var(33)-2)*0.2)
fv = 38
value = 1+((Var(33)-2)*0.2)
ignorehitpause = 1

;Max Combo Bonus
[State -1, VarSet]
type = VarSet
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = Var(33) > 12
trigger1 = FVar(38) != 3
fv = 38
value = 3
ignorehitpause = 1

;Current Special Effects
;1 - Regeneration (+10 life every second)
;2 - Armour (-25% damage taken, -50% speed)
;3 - Berserk (+50% damage given AND taken, +10 intelligence)
;4 - Anti-Projectile (Can't be hit by projectiles)
;5 - Evasion (10% chance -33% damage, 10% chance -66% damage, 10% chance -100% damage)
;6 - X Berserk (+250% damage dealt, -80% Life)
;7 - Recon (-50% Max Life, +50% Speed, slowly restores Enemy Strength Meter)
;8 - EX Bomb (3 Grenades are dropped upon defeat)
;9 - Jammer (Enemy HUD area becomes covered with a black 'fuzz')

;Evasion Effect Randomizer for damage reduction
[State -1, VarRandom]
type = VarRandom
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = root, Var(44) = 1;Special Effects are enabled
trigger1 = Var(3) = 5;Evasion
v = 21
range = 1,1000
ignorehitpause = 1

;Evasion Effect Randomizer for damage reduction
;[State -1, VarSet]
;type = VarSet
;trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
;trigger1 = root, Var(44) = 1;Special Effects are enabled
;trigger1 = Var(3) = 5;Evasion
;v = 21
;value = 1+((random+random+random+random+random+random+random+random+random+random+1)%1000)
;ignorehitpause = 1

;Damage Multiplier from special effects (Evasion)

;Normal Damage
[State 11151, VarSet]
type = VarSet
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = root, Var(44) = 1;Special Effects are enabled
trigger1 = Var(3) = 5;Evasion
trigger1 = Var(21) = [1,700]
fv = 37
value = 1

; -33% Damage
[State 11151, VarSet]
type = VarSet
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = root, Var(44) = 1;Special Effects are enabled
trigger1 = Var(3) = 5;Evasion
trigger1 = Var(21) = [701,800]
fv = 37
value = 0.67

; -66% Damage
[State 11151, VarSet]
type = VarSet
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = root, Var(44) = 1;Special Effects are enabled
trigger1 = Var(3) = 5;Evasion
trigger1 = Var(21) = [801,900]
fv = 37
value = 0.34

; -100% Damage
[State 11151, VarSet]
type = VarSet
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = root, Var(44) = 1;Special Effects are enabled
trigger1 = Var(3) = 5;Evasion
trigger1 = Var(21) = [901,1000]
fv = 37
value = 0

;------------------------------
;Damage Taken Start
;------------------------------

;Damage Taken
[State 10030, VarAdd]
type = VarAdd
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
;trigger1 = (root, Var(49) = 0)
trigger1 = Var(32) > 0
trigger1 = StateNo != 10011
trigger1 = FVar(32) <= 0
trigger1 = Var(3) != 15
;trigger1 = (Var(0) != 3) && (StateNo != [120,155])
fv = 1
;value = -ifelse( ((Var(32)*FVar(37)) <= 600),(Var(32)*FVar(37))*(parent,FVar(38)),(600*(parent,FVar(38))) )
value = -(Var(32)*FVar(37))*(parent,FVar(38))*FVar(21)
;value = -(Var(32)*FVar(37))*(parent,FVar(38))*(1*(.85**Var(33)))

;Damage Taken (Not Shiva or not blocking)
;[State 10030, VarAdd]
;type = VarAdd
;trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
;;trigger1 = (root, Var(49) = 0)
;trigger1 = Var(32) > 0
;trigger1 = StateNo != 10011
;trigger1 = FVar(32) <= 0
;trigger1 = Var(3) != 15
;trigger1 = (Var(0) = 3) && (StateNo != [120,155])
;fv = 1
;value = -(Var(32)*FVar(37))*(parent,FVar(38))

;Damage Taken (-10% guard damage)
[State 10030, VarAdd]
type = VarAdd
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
;trigger1 = (root, Var(49) = 0)
trigger1 = Var(32) > 0
trigger1 = StateNo != 10011
trigger1 = FVar(32) <= 0
trigger1 = Var(3) != 15
trigger1 = (Var(0) != 3) && (StateNo = [120,155])
fv = 1
;value = -0.9*ifelse( ((Var(32)*FVar(37)) <= 600),(Var(32)*FVar(37))*(parent,FVar(38)),(600*(parent,FVar(38))) )
value = -0.9*((Var(32)*FVar(37))*(parent,FVar(38))*FVar(21))

;Damage Taken (Shiva Guard) Not needed anymore as Shiva uses ReversalDefs to guard instead of the normal guard system.
;[State 10030, VarAdd]
;type = VarAdd
;trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
;;trigger1 = (root, Var(49) = 0)
;trigger1 = Var(32) > 0
;trigger1 = StateNo != 10011
;trigger1 = FVar(32) <= 0
;trigger1 = Var(3) != 15
;trigger1 = (Var(0) = 3) && (StateNo = [120,155])
;fv = 1
;value = -0.3*((Var(32)*FVar(37))*(parent,FVar(38)))

;Stagger Effect
[State 10030, VarAdd]
type = VarAdd
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
;trigger1 = (root, Var(49) = 0)
trigger1 = Var(32) > 0
trigger1 = StateNo != 10011
trigger1 = Var(3) = 15
fv = 1
;value = -0.4*ifelse( ((Var(32)*FVar(37)) <= 600),(Var(32)*FVar(37))*(parent,FVar(38)),(600*(parent,FVar(38))) )
value = -0.4*((Var(32)*FVar(37))*(parent,FVar(38))*FVar(21))

;Add to delayed damage
[State 10030, VarAdd]
type = VarAdd
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
;trigger1 = (root, Var(49) = 0)
trigger1 = Var(32) > 0
trigger1 = StateNo != 10011
trigger1 = Var(3) = 15
fv = 26
;value = 0.6*ifelse( ((Var(32)*FVar(37)) <= 600),(Var(32)*FVar(37))*(parent,FVar(38)),(600*(parent,FVar(38))) )
value = 0.6*((Var(32)*FVar(37))*(parent,FVar(38))*FVar(21))

;Stagger damage
[State 10030, VarAdd]
type = VarAdd
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
;trigger1 = (root, Var(49) = 0)
trigger1 = FVar(26) > 0
trigger1 = FVar(1) > 1
;trigger1 = StateNo != 10011
trigger1 = Var(3) = 15
fv = 1
value = ifelse((FVar(26)>=0.2),-0.2,-FVar(26))
ignorehitpause = 1

;Reduce delayed damage
[State 10030, VarAdd]
type = VarAdd
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
;trigger1 = (root, Var(49) = 0)
trigger1 = FVar(26) > 0
;trigger1 = StateNo != 10011
trigger1 = Var(3) = 15
fv = 26
value = ifelse((FVar(26)>=0.2),-0.2,-FVar(26))
ignorehitpause = 1

;Reduce delayed damage on attack hit
[State -1, VarAdd]
type = VarAdd
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = FVar(26) > 0
trigger1 = Var(3) = 15
trigger1 = MoveHit = 2
fv = 26
value = -100
ignorehitpause = 1

;Var(3) = 15 (Stagger Effect)
;FVar(26) = Stagger Damage

;Shield Damage (30 or less base damage)
[State 10030, VarAdd]
type = VarAdd
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
;trigger1 = (root, Var(49) = 0)
trigger1 = FVar(32) > 0
trigger1 = Var(32) > 0
trigger1 = StateNo != 10011
trigger1 = ((Var(32)*FVar(37))*(parent,FVar(38))) <= Floor(30*(parent,FVar(38)))
fv = 32
;value = -ifelse( ((Var(32)*FVar(37)) <= 600),(Var(32)*FVar(37))*(parent,FVar(38)*0.5),(600*(parent,FVar(38))*0.5) )
value = -(((Var(32)*FVar(37))*(parent,FVar(38)))*FVar(21)*0.5)

;Shield Damage (More than 30 base damage)
[State 10030, VarAdd]
type = VarAdd
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
;trigger1 = (root, Var(49) = 0)
trigger1 = FVar(32) > 0
trigger1 = Var(32) > 0
trigger1 = StateNo != 10011
trigger1 = ((Var(32)*FVar(37))*(parent,FVar(38))) > Floor(30*(parent,FVar(38)))
fv = 32
;value = -ifelse( ((Var(32)*FVar(37)) <= 600),((Var(32)*FVar(37))*(parent,FVar(38)))-(15*(parent,FVar(38))),(600*(parent,FVar(38)))-(15*(parent,FVar(38))) )
value = -((((Var(32)*FVar(37))*(parent,FVar(38)))-(15*(parent,FVar(38))))*FVar(21))

;====================
;Points gained start
;====================

;Attacking, can be counter-hit
[State -1, VarSet]
type = VarSet
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = MoveType = A
trigger1 = Var(40) != 1
v = 40
value = 1
ignorehitpause = 1

[State -1, ParentVarAdd]
type = ParentVarAdd
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = Var(32) = [1,500]
trigger1 = StateNo != 10011
trigger1 = StateNo != 10013
trigger1 = StateNo != [120,155]
v = 56
value = ifelse((Var(40) = 1),((Floor(Var(32)*FVar(38)))*10),(Floor(Var(32)*FVar(38))))

[State -1, ParentVarAdd]
type = ParentVarAdd
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = Var(32) > 500
trigger1 = StateNo != 10011
trigger1 = StateNo != 10013
trigger1 = StateNo != [120,155]
v = 56
value = ifelse((Var(40) = 1),((Floor(500*FVar(38)))*10),(Floor(500*FVar(38))))

;Blocked hits
[State -1, ParentVarAdd]
type = ParentVarAdd
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = Var(32) = [1,500]
trigger1 = StateNo != 10011
trigger1 = StateNo != 10013
trigger1 = StateNo = [120,155]
v = 56
value = Var(32)

[State -1, ParentVarAdd]
type = ParentVarAdd
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = Var(32) > 500
trigger1 = StateNo != 10011
trigger1 = StateNo != 10013
trigger1 = StateNo = [120,155]
v = 56
value = 500

;Not attacking, don't apply counter-hit point bonus
[State -1, VarSet]
type = VarSet
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = MoveType = I
trigger1 = Var(40) != 0
trigger1 = Time > 0
v = 40
value = 0
ignorehitpause = 1

;Being hit, reset counter-hit bonus
[State -1, VarSet]
type = VarSet
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = MoveType = H
trigger1 = Var(40) != 0
trigger1 = Time > 0
v = 40
value = 0
ignorehitpause = 1

;====================
;Points gained end
;====================

;Reset HitCount
[State -1, VarSet]
type = VarSet
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = MoveType != H
trigger1 = Var(33) != 0
v = 33
value = 0
ignorehitpause = 1

;Reset Total damage taken from combo
[State -1, VarSet]
type = VarSet
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = MoveType != H
trigger1 = FVar(36) != 0
fv = 36
value = 0
ignorehitpause = 1

;Screenbound, except for these states
[State -1, ScreenBound]
type = ScreenBound
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = Var(0) != 41;Bongo
;trigger1 = Var(0) != 29;Mona/Lisa
trigger1 = StateNo != [9500,9514]
trigger1 = StateNo != 10181
trigger1 = StateNo != 11000
trigger1 = StateNo != [21229,21233]
trigger1 = StateNo != 21235
trigger1 = StateNo != 21237
trigger1 = StateNo != 21239
trigger1 = StateNo != 21241
;trigger1 = StateNo != 21245
trigger1 = StateNo != 21353
trigger1 = StateNo != 21355
trigger1 = StateNo != 21363
trigger1 = StateNo != 21367
trigger1 = StateNo != 21467
trigger1 = StateNo != 21511
trigger1 = StateNo != 21845
trigger1 = StateNo != [21857,21861]
trigger1 = (Var(0) != 4) || (Var(46) != 1)
value = 1
movecamera = 1,1
ignorehitpause = 1

;Make sure enemies push players (cancelled in some other states)
[State -1, PlayerPush]
type = PlayerPush
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
value = 1
ignorehitpause = 1

;----------

;Hitoverrides for SoR enemies. If setting is activated in Config file.

;GetHit (Standing)
[State -1, HitOverride]
type = HitOverride
triggerall = IsHelper(200) || IsHelper(201) || IsHelper(202)
triggerall = StateNo != [21623,21639]
trigger1 = Var(0) != 34;Seeker
trigger1 = (root, Var(50) = 1)
trigger1 = StateType = S
trigger1 = StateNo != 10010 && StateNo != 10011 && StateNo != 21579 && StateNo != 21845
trigger1 = StateNo != [11141,11153]
trigger1 = StateNo != [21347,21361]
attr = SCA,AA,AP,AT
slot = 0
stateno = 5000
time = 1
ignorehitpause = 1
forceair = 0

;GetHit (Crouching)
[State -1, HitOverride]
type = HitOverride
triggerall = IsHelper(200) || IsHelper(201) || IsHelper(202)
triggerall = StateNo != [21623,21639]
trigger1 = Var(0) != 34;Seeker
trigger1 = (root, Var(50) = 1)
trigger1 = StateType = C
trigger1 = StateNo != 10010 && StateNo != 10011 && StateNo != 21579 && StateNo != 21845
trigger1 = StateNo != [11141,11153]
trigger1 = StateNo != [21347,21361]
attr = SCA,AA,AP,AT
slot = 0
stateno = 5010
time = 1
ignorehitpause = 1
forceair = 0

;GetHit (Air)
[State -1, HitOverride]
type = HitOverride
triggerall = IsHelper(200) || IsHelper(201) || IsHelper(202)
triggerall = StateNo != [21623,21639]
trigger1 = Var(0) != 34;Seeker
trigger1 = (root, Var(50) = 1)
trigger1 = StateType = A
trigger1 = StateNo != 10010 && StateNo != 10011 && StateNo != 21579 && StateNo != 21845
trigger1 = StateNo != [11141,11153]
trigger1 = StateNo != [21347,21361]
attr = SCA,AA,AP,AT
slot = 0
stateno = 5020
time = 1
ignorehitpause = 1
forceair = 0

;GetHit (On ground)
[State -1, HitOverride]
type = HitOverride
triggerall = IsHelper(200) || IsHelper(201) || IsHelper(202)
triggerall = StateNo != [21623,21639]
trigger1 = Var(0) != 34;Seeker
trigger1 = (root, Var(50) = 1)
trigger1 = StateType = L
trigger1 = StateNo != 10010 && StateNo != 10011 && StateNo != 21579 && StateNo != 21845
trigger1 = StateNo != [11141,11153]
trigger1 = StateNo != [21347,21361]
attr = SCA,AA,AP,AT
slot = 0
stateno = 5080
time = 1
ignorehitpause = 1
forceair = 0

;----------
;Guarding Hitoverride for SoR enemies.
[State -1, HitOverride]
type = HitOverride
triggerall = IsHelper(200) || IsHelper(201) || IsHelper(202)
triggerall = StateNo != [21623,21639]
trigger1 = StateNo = 10010 || StateNo = 10011
;trigger1 = (Var(0) != 3 && Var(0) != 12) || (root, Var(43) != 2)
;SoR Style Guard
trigger2 = Var(0) = 3 || Var(0) = 12 || Var(0) = 13 || Var(0) = 15 || Var(0) = 24 || Var(0) = 26 || Var(0) = 37
trigger2 = FVar(34) >= 1
trigger2 = StateNo != 10010 && StateNo != 10011
trigger2 = (root, Var(43) = 1); || ((root, Var(43) = 0) && (Var(0) = 12) && (NumEnemy = 1));Option is on or enemy is Shiva
trigger2 = (Var(0) != 12) || (NumEnemy = 1)
trigger2 = (Ceil(Var(1)*6) >= (random+1)) || (random <= 49)
trigger2 = (StateType = S) || (StateType = C)
trigger2 = MoveType != A
;Second Set
trigger3 = Var(0) = 43 || Var(0) = 45
trigger3 = FVar(34) >= 1
trigger3 = StateNo != 10010 && StateNo != 10011
trigger3 = (root, Var(43) = 1); || ((root, Var(43) = 0) && (Var(0) = 12) && (NumEnemy = 1));Option is on or enemy is Shiva
trigger3 = (Var(0) != 12) || (NumEnemy = 1)
trigger3 = (Ceil(Var(1)*6) >= (random+1)) || (random <= 49)
trigger3 = (StateType = S) || (StateType = C)
trigger3 = MoveType != A
;Shiva Absolute Guard
;trigger4 = Var(0) = 12
;trigger4 = FVar(34) >= 1
;trigger4 = StateNo != 10010 && StateNo != 10011
;trigger4 = (root, Var(43) = 0)
;trigger4 = (NumEnemy = 1)
;trigger4 = (Ceil(Var(1)*6) >= (random+1)) || (random <= 49)
;trigger4 = (StateType = S) || (StateType = C)
;trigger4 = MoveType != A
;SoR Style Guard 2
;trigger3 = Var(0) = 13 || Var(0) = 15 || Var(0) = 21 || Var(0) = 23 || Var(0) = 24  || Var(0) = 26 || Var(0) = 37
;trigger3 = FVar(34) >= 1
;trigger3 = StateNo != 10010 && StateNo != 10011
;trigger3 = (root, Var(43) = 2);Option is on
;trigger3 = Ceil(Var(1)*6) >= (random+1) || (random <= 49)
;trigger3 = (StateType = S) || (StateType = C)
;trigger3 = MoveType != A
;SoR accuracy
;trigger4 = Var(0) = 3 || Var(0) = 12 || Var(0) = 13 || Var(0) = 15 || Var(0) = 21 || Var(0) = 23 || Var(0) = 24  || Var(0) = 26 || Var(0) = 37
;trigger4 = FVar(34) >= 1
;trigger4 = StateNo != 10010 && StateNo != 10011
;trigger4 = (root, Var(43) = 3);Option is on
;trigger4 = Ceil(Var(1)*6) >= (random+1) || (random <= 49)
;trigger4 = (StateType = S) || (StateType = C)
;trigger4 = MoveType != A
attr = SCA,AA,AP,AT
slot = 0
stateno = 10011
time = 1
ignorehitpause = 1
forceair = 0

;Guarding Hitoverride for projectiles
;[State -1, HitOverride]
;type = HitOverride
;triggerall = IsHelper(200) || IsHelper(201) || IsHelper(202)
;triggerall = StateNo != [21623,21639]
;;SoR Style Guard 2
;trigger1 = Var(0) = 13 || Var(0) = 15 || Var(0) = 24  || Var(0) = 26 || Var(0) = 37
;trigger1 = FVar(34) >= 1
;trigger1 = StateNo != 10010 && StateNo != 10011
;trigger1 = (root, Var(43) = 2);Option is on
;trigger1 = Ceil(Var(1)*6) >= (random+1) || (random <= 49)
;trigger1 = (StateType = S) || (StateType = C)
;trigger1 = MoveType != A
;;SoR accuracy
;trigger2 = Var(0) = 3 || Var(0) = 12 || Var(0) = 13 || Var(0) = 15 || Var(0) = 24  || Var(0) = 26 || Var(0) = 37
;trigger2 = FVar(34) >= 1
;trigger2 = StateNo != 10010 && StateNo != 10011
;trigger2 = (root, Var(43) = 3);Option is on
;trigger2 = Ceil(Var(1)*6) >= (random+1) || (random <= 49)
;trigger2 = (StateType = S) || (StateType = C)
;trigger2 = MoveType != A
;;Second Set
;trigger3 = Var(0) = 43 || Var(0) = 45
;trigger3 = FVar(34) >= 1
;trigger3 = StateNo != 10010 && StateNo != 10011
;trigger3 = (root, Var(43) = 3);Option is on
;trigger3 = Ceil(Var(1)*6) >= (random+1) || (random <= 49)
;trigger3 = (StateType = S) || (StateType = C)
;trigger3 = MoveType != A
;attr = SCA,AP
;slot = 0
;stateno = 10011
;time = 1
;ignorehitpause = 1
;forceair = 0

;----------

;Harakiri Counter
[State -1, HitOverride]
type = HitOverride
triggerall = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = StateNo = 21579
;-----
trigger2 = (root, Var(50) = 0)
trigger2 = Var(0) = 33
trigger2 = FVar(34) >= 1
trigger2 = (Ceil(Var(1)*5) >= (random+1)); || (random <= 49)
trigger2 = (StateType = S) || (StateType = C)
;trigger2 = GameTime%2 = 0
trigger2 = MoveType != A
attr = SCA,AA,AP,AT
slot = 0
stateno = 21579
time = 1
ignorehitpause = 1
forceair = 0

;----------

;[State -1, HitOverride]
;type = HitOverride
;triggerall = IsHelper(200) || IsHelper(201) || IsHelper(202)
;trigger1 = StateNo = 10010 || StateNo = 10011
;;SoR Style Guard
;trigger2 = Var(0) = 3 || Var(0) = 12 || Var(0) = 13 || Var(0) = 15 || Var(0) = 21 || Var(0) = 23;Only enemies with the ability to guard
;trigger2 = StateNo != 10010 && StateNo != 10011
;trigger2 = (root, Var(43) = 1) || (root, Var(43) = 2);Option is on
;trigger2 = Ceil(Var(1)*3.5) >= (random+1)
;trigger2 = (StateType = S) || (StateType = C)
;trigger2 = MoveType != A
;attr = SCA,AT
;slot = 1
;stateno = 10011
;time = 1
;ignorehitpause = 1
;forceair = 0
;-----------

;Anti-Projectile (Special Effect)
[State -1, NotHitBy]
type = NotHitBy
triggerall = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = root, Var(44) = 1;Special Effects are enabled
trigger1 = Var(3) = 4;Anti-Projectile
trigger2 = (root, Var(45) = 10) || (root, Var(45) = 11)
value = ,AP
time = 111
ignorehitpause = 1

[State -1, Helper]
type = Helper
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = NumHelper(30000+ID) = 0
trigger1 = Time > 10
trigger1 = Var(0) != 34;Seeker
trigger1 = FVar(1) > 0
trigger1 = (root, Var(45) = 10) || (root, Var(45) = 11)
trigger1 = (StateNo != 10181) && (StateNo != 21567);KO State/P1 Self-Destruct
trigger1 = StateNo != [9500,9514];Generate States
trigger1 = StateNo != 21365;Mini-boss appear State
trigger1 = StateNo != [11000,11003];KO States
trigger1 = StateNo != [21227,21243];Barbon/Jet/Zamza/Abadede Intro States
trigger1 = StateNo != [21347,21361];Vehelits States
trigger1 = StateNo != [21623,21629];Control Panel States
trigger1 = StateNo != [21857,21861];Shiva Intro/Mr.X Intro
trigger1 = StateNo != 21497;Twins Intro (Mona/Lisa)
trigger1 = (StateNo != 8526) && (StateNo != 21195) && (StateNo != 21639);Roo run away/Run away (Mr.X defeated)/Run away (Control Panel destroyed)
helpertype = normal ;player
name = "ProjSuperArmor"
ID = 30000+ID
stateno = 8637
pos = 0,0
postype = p1
facing = 1
keyctrl = 0
ownpal = 0
supermovetime = 0
pausemovetime = 0
ignorehitpause = 1

;Anti-Normal Attack (Stealth Effect)
[State -1, NotHitBy]
type = NotHitBy
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = root, Var(44) = 1;Special Effects are enabled
trigger1 = Var(3) = 11;Stealth
trigger1 = Var(36) <= 0
value2 = ,NA,NP,NT
time = 111
ignorehitpause = 1

;Reset Cloak if hit
[State 0, VarSet]
type = VarSet
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = root, Var(44) = 1;Special Effects are enabled
trigger1 = Var(3) = 11;Stealth
trigger1 = Var(36) <= 0
trigger1 = MoveType = H || StateNo = 5120
v = 36
value = 150
ignorehitpause = 1

;Disable cloak briefly upon attacking
[State 0, VarSet]
type = VarSet
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = root, Var(44) = 1;Special Effects are enabled
trigger1 = Var(3) = 11;Stealth
trigger1 = Var(36) != 777
trigger1 = Var(36) <= 0
trigger1 = MoveType = A
v = 36
value = 777
ignorehitpause = 1

;Reset Cloak after attacking
[State 0, VarSet]
type = VarSet
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = root, Var(44) = 1;Special Effects are enabled
trigger1 = Var(3) = 11;Stealth
trigger1 = Var(36) = 777
trigger1 = MoveType != A
v = 36
value = 0
ignorehitpause = 1

;Recharge Cloak
[State -1, VarAdd]
type = VarAdd
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = root, Var(44) = 1;Special Effects are enabled
trigger1 = Var(3) = 11;Stealth
trigger1 = Var(36) != 777
trigger1 = Var(36) = [1,300]
trigger1 = (MoveType != A) && (MoveType != H) && (StateNo != 5120)
v = 36
value = -1
ignorehitpause = 1

;Bongo Anti-Throw
[State -1, NotHitBy]
type = NotHitBy
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = Var(0) = 41
trigger1 = (root, Var(45) != 10) && (root, Var(45) != 11)
value = ,AT
time = 111
ignorehitpause = 1

[State -1, NotHitBy]
type = NotHitBy
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = Var(0) = 41
trigger1 = (root, Var(45) = 10) || (root, Var(45) = 11)
value = ,AP,AT
time = 111
ignorehitpause = 1

;Bongo Offscreen max value
[State -1, PosSet]
type = PosSet
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = Var(0) = 41 || Var(0) = 29
trigger1 = Pos X < -300
x = -300
;y = 0
ignorehitpause = 1

[State -1, PosSet]
type = PosSet
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = Var(0) = 41 || Var(0) = 29
trigger1 = Pos X > 300
x = 300
;y = 0
ignorehitpause = 1

;Boss invincible
[State -1, NotHitBy]
type = NotHitBy
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = (Var(0) = [12,19]) || Var(0) = 28
trigger1 = Var(53) > 0
value = SCA
time = 2
ignorehitpause = 1

;Boss invincible timer decrease
[State -1, VarAdd]
type = VarAdd
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = (Var(0) = [12,19]) || Var(0) = 28
trigger1 = Var(53) > 0
v = 53
value = -1
ignorehitpause = 1

;Boss invincible flicker effect
[State -1, AssertSpecial]
type = AssertSpecial
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = (Var(0) = [12,19]) || Var(0) = 28
trigger1 = Var(53) > 0
trigger1 = GameTime%3 = 0
trigger1 = StateNo != 21035
flag = invisible

;Attack Cooldown (Not being hit)
[State -1, VarAdd]
type = VarAdd
;trigger1 = Var(0) = 14 ;Jet
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = Var(51) > 0
trigger1 = MoveType = I
trigger1 = StateNo != 5110
trigger1 = StateNo != 5120
trigger1 = StateNo != 21035
trigger1 = StateNo != 21211
trigger1 = StateNo != 21225
trigger1 = StateNo != 21269
trigger1 = (Time >= 30) || PrevStateNo != [21025,21047]
trigger1 = (Time >= 30) || PrevStateNo != [21199,21225]
trigger1 = StateNo != 21855
trigger1 = ((Enemynear, StateType != L) && (Enemynear, StateNo != 5120)) || ((random+1) >= 801-(root, Var(51)*50));(random <= 249)
trigger1 = (MoveType != A); || (GameTime%2 = 0)
;trigger1 = (GameTime%2 = 0) || (P2Dist X = [0,100]) || (Var(0) = [12,19])
;trigger1 = Enemynear, StateNo != 5120
;trigger1 = StateNo != [21025,21047]
v = 51
value = -1
ignorehitpause = 1

;Attack Cooldown (In hit state)
[State -1, VarAdd]
type = VarAdd
;trigger1 = Var(0) = 14 ;Jet
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = Var(51) > 0
trigger1 = MoveType = H
trigger1 = StateNo != 5110
trigger1 = StateNo != 5120
trigger1 = StateNo != 21035
trigger1 = StateNo != 21211
trigger1 = StateNo != 21269
trigger1 = ((Enemynear, StateType != L) && (Enemynear, StateNo != 5120)); || (random <= 249)
;trigger1 = Enemynear, StateNo != 5120
;trigger1 = StateNo != [21025,21047]
v = 51
value = -2;Floor((1+root,Var(51))/2)
ignorehitpause = 1

;Extra Attack Cooldown (Boss, Enemy close)
[State -1, VarAdd]
type = VarAdd
;trigger1 = Var(0) != 14 ;Jet
trigger1 = StateNo != 21225
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = Var(51) > 0
;trigger1 = ((root, Var(51) >= 4) && (random+1 <= (root,Var(51)*50))) || Var(0) = [12,19]
trigger1 = NumEnemy > 0
trigger1 = P2Dist X = [1,100]
;trigger1 = random >= 250
trigger1 = Enemynear, MoveType != H
trigger1 = Enemynear, StateType != L
trigger1 = Enemynear, StateNo != 5120
trigger1 = Var(53) <= 0
v = 51
value = ifelse((MoveType != A),-2,-1)
ignorehitpause = 1

;Extra Attack Cooldown (Boss, Multiple enemies)
[State -1, VarAdd]
type = VarAdd
;trigger1 = Var(0) != 14 ;Jet
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = StateNo != 21225
trigger1 = Var(51) > 0
trigger1 = (Var(0) = [12,19]) || NumEnemy > 2
trigger1 = NumEnemy > 1
trigger1 = random >= 550-(root, Var(51)*25)
trigger1 = Enemynear, MoveType != H
trigger1 = Enemynear, StateType != L
trigger1 = Enemynear, StateNo != 5120
v = 51
value = -(NumEnemy-1)
ignorehitpause = 1

;Extra Attack Cooldown (Shiva)
[State -1, VarAdd]
type = VarAdd
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = Var(0) = 12
trigger1 = Var(51) > 0
trigger1 = NumEnemy > 0
;trigger1 = random >= 250
trigger1 = Enemynear, MoveType != H
trigger1 = Enemynear, StateType != L
trigger1 = Enemynear, StateNo != 5120
v = 51
value = -1
ignorehitpause = 1

;Special Attack Cooldown
[State -1, VarAdd]
type = VarAdd
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = Var(48) > 0
trigger1 = StateNo != 21197;Mr.X Laugh
v = 48
value = ifelse((random>=900),-2,-1)
ignorehitpause = 1

;Mr.X Int Boost (Attack Frequency Up)
[State -1, VarAdd]
type = VarAdd
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = NumExplod(73521) = 0
trigger1 = Var(0) = 19
trigger1 = FVar(1) <= 1000 
v = 1
value = 15
ignorehitpause = 1

;Set to 1000 life if it falls below 1000 for Mr.X, one time only.
[State -1, VarSet]
type = VarSet
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = NumExplod(73521) = 0
trigger1 = Var(0) = 19
trigger1 = FVar(1) <= 1000 
fv = 1
value = 1000
ignorehitpause = 1

;Explod "Variable" for Mr.X Int Up
[State -1, Explod]
type = Explod
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = NumExplod(73521) = 0
trigger1 = Var(0) = 19
trigger1 = FVar(1) <= 1000
anim = 9500
ID = 73521
pos = 0,-50
postype = right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -1
supermovetime = 0
pausemovetime = 0
scale = 0.5,0.5
sprpriority = -100
ontop = 0
ownpal = 0
removeongethit = 0

;Boss Normal Defense
[State -1, VarSet]
type = VarSet
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = (Var(0) = [13,18]) || (Var(0) = [31,33]) || (Var(0) = [21,22]) || (Var(0) = [28,29]) || (Var(0) = 23) || (Var(0) = 39) || (Var(0) = [41,42])
trigger1 = Var(0) != 16
trigger1 = (StateType != A && StateType != L) || (Var(0) = 14 && MoveType != H)
fv = 37
value = 1*FVar(22)

;Boss Air Defense Boost
[State -1, VarSet]
type = VarSet
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = (Var(0) = [13,18]) || (Var(0) = [31,33]) || (Var(0) = [21,22]) || (Var(0) = [28,29]) || (Var(0) = 23) || (Var(0) = 39) || (Var(0) = [41,42])
trigger1 = Var(0) != 14 || GetHitVar(HitCount) >= 4
trigger1 = Var(0) != 16
trigger1 = StateType = A || StateType = L
trigger1 = NumEnemy > 0
trigger1 = Enemynear, Teammode = Simul
fv = 37
value = 0.75*FVar(22);0.8

;Abadede Normal Defense
[State -1, VarSet]
type = VarSet
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = Var(0) = 16
trigger1 = StateType != A && StateType != L
;trigger1 = FVar(37) != 1
fv = 37
value = 1*FVar(22)

;Abadede Air Defense Boost
[State -1, VarSet]
type = VarSet
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = Var(0) = 16
trigger1 = StateType = A || StateType = L
;trigger1 = FVar(37) != 0.65;0.8
fv = 37
value = 0.65*FVar(22)

;Mr.X Defense Boost

;Disable defense booster for Mr.X and Shiva once the other defense booster takes effect
[State 9512, VarSet]
type = VarSet
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = Var(0) = 12 || Var(0) = 19
trigger1 = root, Var(38) != -1
trigger1 = FVar(1) <= 1000
trigger1 = FVar(22) != 1
fv = 22
value = 1

;No Boost (Safety)
[State -1, VarSet]
type = VarSet
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = Var(0) = 19
trigger1 = FVar(1) > 1000
trigger1 = NumEnemy > 0
trigger1 = Enemynear, Teammode != Simul
fv = 37
value = 1*FVar(22)

;FVar(0)*(1+((root,FVar(38)-1)/(root, Var(38))))
;FVar(0)*(1+((root,FVar(38)-1)/(root, Var(38))))

;Start Boost (Minimum)
[State -1, VarSet]
type = VarSet
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = Var(0) = 19
trigger1 = FVar(1) <= 1000
trigger1 = (FVar(1)/1000) > 0.75;0.75
trigger1 = NumEnemy > 0
trigger1 = Enemynear, Teammode != Simul
fv = 37
value = (0.75/(root, FVar(38)))*FVar(22)

;Start Boost
[State -1, VarSet]
type = VarSet
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = Var(0) = 19
trigger1 = FVar(1) <= 1000
trigger1 = (FVar(1)/1000) <= 0.75;0.75
trigger1 = (FVar(1)/1000) > 0.25;0.1
trigger1 = NumEnemy > 0
trigger1 = Enemynear, Teammode != Simul
fv = 37
value = ((FVar(1)/1000)/(root, FVar(38)))*FVar(22)

[State -1, VarSet]
type = VarSet
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = Var(0) = 19
trigger1 = FVar(1) <= 1000
trigger1 = (FVar(1)/1000) <= 0.25;0.1
trigger1 = NumEnemy > 0
trigger1 = Enemynear, Teammode != Simul
fv = 37
value = (0.25/(root, FVar(38)))*FVar(22)

;Vs Simul

;No Boost (Safety)
[State -1, VarSet]
type = VarSet
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = Var(0) = 19
trigger1 = FVar(1) > 1000
trigger1 = NumEnemy > 0
trigger1 = Enemynear, Teammode = Simul
fv = 37
value = ifelse((StateType != A && StateType != L),1*FVar(22),0.65*FVar(22))

;Start Boost (Minimum)
[State -1, VarSet]
type = VarSet
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = Var(0) = 19
trigger1 = FVar(1) <= 1000
trigger1 = (FVar(1)/1000) > 0.99;0.75
trigger1 = NumEnemy > 0
trigger1 = Enemynear, Teammode = Simul
fv = 37
value = ifelse((StateType != A && StateType != L),(0.99/(root, FVar(38)))*FVar(22),(0.99/(root, FVar(38)))*0.65*FVar(22))
;value = (0.95/(root, FVar(38)))

;Start Boost
[State -1, VarSet]
type = VarSet
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = Var(0) = 19
trigger1 = FVar(1) <= 1000
trigger1 = (FVar(1)/1000) <= 0.99;0.75
trigger1 = (FVar(1)/1000) > 0.2;0.1
trigger1 = NumEnemy > 0
trigger1 = Enemynear, Teammode = Simul
fv = 37
value = ifelse((StateType != A && StateType != L),((FVar(1)/1000)/(root, FVar(38)))*FVar(22),((FVar(1)/1000)/(root, FVar(38)))*0.65*FVar(22))
;value = ((FVar(1)/1000)/(root, FVar(38)))

[State -1, VarSet]
type = VarSet
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = Var(0) = 19
trigger1 = FVar(1) <= 1000
trigger1 = (FVar(1)/1000) <= 0.2;0.1
trigger1 = NumEnemy > 0
trigger1 = Enemynear, Teammode = Simul
fv = 37
value = ifelse((StateType != A && StateType != L),(0.2/(root, FVar(38)))*FVar(22),(0.2/(root, FVar(38)))*0.65*FVar(22))
;value = (0.25/(root, FVar(38)))

;End Mr.X Defense Boost


;=========================
;Shiva Defense Boost
;=========================

;Set to 1000 life if it falls below 1000 for Shiva, one time only.
[State -1, VarSet]
type = VarSet
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = NumExplod(73522) = 0
trigger1 = Var(0) = 12
trigger1 = FVar(1) <= 1000 
trigger1 = FVar(1) > 0
fv = 1
value = 1000
ignorehitpause = 1

;Shiva Int Boost (Attack Frequency Up)
[State -1, VarAdd]
type = VarAdd
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = NumExplod(73522) = 0
trigger1 = Var(0) = 12
trigger1 = FVar(1) <= 1000
trigger1 = FVar(1) > 0 
v = 1
value = 10
ignorehitpause = 1

;Shiva Speed Boost
;[State -1, VarAdd]
;type = VarAdd
;trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
;trigger1 = NumExplod(73522) = 0
;trigger1 = Var(0) = 12
;trigger1 = FVar(1) <= 1000 
;trigger1 = FVar(1) > 0
;fv = 2
;value = (FVar(2)*0.1)
;ignorehitpause = 1

;Explod "Variable" for Shiva Atk/Def Bonus
[State -1, Explod]
type = Explod
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = NumExplod(73522) = 0
trigger1 = Var(0) = 12
trigger1 = FVar(1) <= 1000
trigger1 = FVar(1) > 0
anim = 9500
ID = 73522
pos = 0,-50
postype = right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -1
supermovetime = 0
pausemovetime = 0
scale = 0.5,0.5
sprpriority = -100
ontop = 0
ownpal = 0
removeongethit = 0

;Attack Boost
;[State -1, AttackMulSet]
;type = Null;AttackMulSet
;trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
;trigger1 = Var(0) = 12
;trigger1 = NumExplod(73522) = 1
;;trigger1 = FVar(1) <= 1000
;value = 1.25
;ignorehitpause = 1

;Defense Boost
[State -1, VarSet]
type = VarSet
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = Var(0) = 12
trigger1 = NumExplod(73522) = 1
;trigger1 = FVar(1) <= 1000
;trigger1 = FVar(37) != 0.7
trigger1 = StateType != L
fv = 37
value = (0.7/(root, FVar(38)))*FVar(22)

;Defense Boost (In the air)
[State -1, VarSet]
type = VarSet
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = Var(0) = 12
trigger1 = NumExplod(73522) = 1
;trigger1 = FVar(1) <= 1000
;trigger1 = FVar(37) != 0.7
trigger1 = StateType = L
fv = 37
value = (0.35/(root, FVar(38)))*FVar(22)
;value = 0.3/(root, FVar(38))

;Defense Boost (Low Life boost not yet active)
[State -1, VarSet]
type = VarSet
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = Var(0) = 12
trigger1 = NumExplod(73522) = 0
;trigger1 = FVar(1) <= 1000
;trigger1 = FVar(37) != 0.7
trigger1 = StateType != L
fv = 37
value = 1*FVar(22)

;Defense Boost (Air, low Life boost not yet active)
[State -1, VarSet]
type = VarSet
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = Var(0) = 12
trigger1 = NumExplod(73522) = 0
;trigger1 = FVar(1) <= 1000
;trigger1 = FVar(37) != 0.7
trigger1 = StateType = L
fv = 37
value = 0.5*FVar(22);0.3

[State -1, RemoveExplod]
type = RemoveExplod
trigger1 = Var(0) = 12
trigger1 = NumExplod(73522) = 1
trigger1 = FVar(1) <= 0
id = 73522
ignorehitpause = 1

;=========================
;End Shiva Atk/Def Boost
;=========================

;Set base cooldown
[State -1, VarRandom]
type = VarRandom
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = MoveType = A
trigger1 = Var(0) != 14 ;Jet
trigger1 = Var(0) != 20 ;Rocket
trigger1 = Var(0) != 28 ;Jet MKII
trigger1 = Time = 1
v = 51
range = 120,240;120,180
;+(20*(6-root,Var(51)))
;range = 80,120
ignorehitpause = 1

;Set base cooldown (Jet)
[State -1, VarRandom]
type = VarRandom
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = MoveType = A
trigger1 = Var(0) = 14 ;Jet
trigger1 = Time = 1
v = 51
range = 120,240
;range = 120,180
ignorehitpause = 1

;Set base cooldown (Rocket)
[State -1, VarRandom]
type = VarRandom
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = MoveType = A
trigger1 = Var(0) = 20 ;Rocket
trigger1 = Var(49) != 1;Not with Jet MKII
trigger1 = Time = 1
v = 51
range = 150,180
;range = 240,300
ignorehitpause = 1

;Set base cooldown (Rocket)
[State -1, VarRandom]
type = VarRandom
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = MoveType = A
trigger1 = Var(0) = 20 ;Rocket
trigger1 = Var(49) = 1;With Jet MKII
trigger1 = Time = 1
v = 51
range = 150,270
;range = 480,720
;range = 480,660
ignorehitpause = 1

;Set base cooldown (Jet MKII)
[State -1, VarRandom]
type = VarRandom
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = MoveType = A
trigger1 = Var(0) = 28 ;Jet MKII
trigger1 = Time = 1
v = 51
range = 120,210
;range = 540,750
;range = 180,600
ignorehitpause = 1

;Flicker Rocket/Jet MKII when getting ready to attack
[State 5210, 1] ;Blink white
type = PalFX
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = MoveType != A
trigger1 = (Var(0) = 20 && Var(49) = 1) || Var(0) = 28
trigger1 = Var(51) = [61,210]
trigger1 = GameTime%20 = 0
time = 3
add = 32,32,32

[State 5210, 1] ;Blink white
type = PalFX
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = MoveType != A
trigger1 = (Var(0) = 20 && Var(49) = 1) || Var(0) = 28
trigger1 = Var(51) <= 60
trigger1 = GameTime%10 = 0
time = 3
add = 32,32,32

;Enemy Max Intelligence
[State -1, VarSet]
type = VarSet
triggerall = Var(0) != [12,19]
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = Var(1) > 100;40
v = 1
value = 100
ignorehitpause = 1

;Boss Max Intelligence
[State -1, VarSet]
type = VarSet
triggerall = Var(0) = [12,19]
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = Var(1) > 100;50
v = 1
value = 100
ignorehitpause = 1

;Enemy Min Intelligence
[State -1, VarSet]
type = VarSet
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = Var(1) <= 0
v = 1
value = 1
ignorehitpause = 1

;Reduce cooldown by Enemy intelligence (Var(1))
[State -1, VarSet]
type = VarSet
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = MoveType = A
trigger1 = Time = 1
v = 51
value = ifelse(((Var(51)-(Var(1)*2)) > 30),(Var(51)-(Var(1)*2)),30)
;value = Var(51)-Var(1)
ignorehitpause = 1

;Enemy Regeneration (Special Effect)
[State -1, VarAdd]
type = VarAdd
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = (root, Var(44) = 1) || (root, Var(44) = 2);Special Effects are enabled
trigger1 = (Var(3) = 1); || (Var(3) = 13) || (Var(3) = 14)
trigger1 = FVar(1) < FVar(0)
trigger1 = FVar(1) > 0
;trigger1 = GameTime%3 = 0
trigger1 = RoundState = 2
trigger1 = (MoveType != H) && (StateNo != 5120) && (StateNo != 21275)
fv = 1
value = 1;60/sec
ignorehitpause = 1

;Attack Drop (Ranked Mode)
[State -1, AttackMulSet]
type = AttackMulSet
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = root, Var(41) = 4;Ranked Mode
value = 0.5
ignorehitpause = 1

;Attack Power Up (Berserk Effect)
[State -1, AttackMulSet]
type = AttackMulSet
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = root, Var(44) = 1;Special Effects are enabled
trigger1 = Var(3) = 3;Berserk
value = 1.5
ignorehitpause = 1

;Attack Power Up (Advanced Enemies)
[State -1, AttackMulSet]
type = AttackMulSet
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = (root, Var(44) = 1) || (root, Var(44) = 2);Special Effects are enabled
trigger1 = Var(3) = 12;Advanced
value = 1.1
ignorehitpause = 1

;Attack Power Up (Elite Enemies)
[State -1, AttackMulSet]
type = AttackMulSet
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = (root, Var(44) = 1) || (root, Var(44) = 2);Special Effects are enabled
trigger1 = Var(3) = 13;Elite
value = 1.2
ignorehitpause = 1

;Attack Power Up (Super-Elite Enemies)
[State -1, AttackMulSet]
type = AttackMulSet
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = (root, Var(44) = 1) || (root, Var(44) = 2);Special Effects are enabled
trigger1 = Var(3) = 14;Super-Elite
value = 1.3
ignorehitpause = 1

;Attack Power Up (X Berserk Effect)
[State -1, AttackMulSet]
type = AttackMulSet
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = root, Var(44) = 1;Special Effects are enabled
trigger1 = Var(3) = 6;X Berserk
value = 3.5
ignorehitpause = 1

;Enemy Regeneration (Test for early lifebars)
;[State -1, VarAdd]
;type = VarAdd
;trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
;trigger1 = FVar(1) < FVar(0)
;trigger1 = FVar(1) > 0
;trigger1 = GameTime%20 = 0
;trigger1 = RoundState = 2
;trigger1 = (MoveType != H) && (StateNo != 5120) && (StateNo != 21275)
;trigger1 = Var(53) <= 0
;fv = 1
;value = 1;0.5
;ignorehitpause = 1

;Prevent Enemy Life from going above max
[State -1, VarSet]
type = VarSet
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = FVar(1) > FVar(0)
trigger1 = RoundState = 2
fv = 1
value = FVar(0)
ignorehitpause = 1

;Less than 0 life fix
[State -1, VarSet]
type = VarSet
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = FVar(1) < 0
trigger1 = RoundState = 2
fv = 1
value = 0
ignorehitpause = 1

;Prevent guard for SoR enemies. Since the SoR enemies use 'keyctrl = 1', if they got control for just a bit, they could
;end up in the guard states if back was being held.
[State -1, AssertSpecial]
type = AssertSpecial
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = 1
flag = NoStandGuard
flag2 = NoCrouchGuard
flag3 = NoAirGuard
ignorehitpause = 1

;Random number for random attack (Attack 'decider')
;[State -1, VarSet]
;type = VarSet
;trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
;trigger1 = Var(49) != 1
;trigger1 = StateNo != [10030,11003];Custom Hitstates
;trigger1 = StateNo != 21177;Mr.X KO 1a/2
;trigger1 = StateNo != 21178;Mr.X KO 1b/2
;trigger1 = StateNo != 21179;Mr.X KO 2/2
;v = 58
;value = 1+((random+random+random+random+random+random+random+random+random+random+1)%1000)
;ignorehitpause = 1

[State 0, VarRandom]
type = VarRandom
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
;trigger1 = Var(49) != 1
trigger1 = StateNo = 10181 || StateNo != [10030,11003];Custom Hitstates
trigger1 = StateNo != 21175;Mr.X Shoot
trigger1 = StateNo != 21177;Mr.X KO 1a/2
trigger1 = StateNo != 21178;Mr.X KO 1b/2
trigger1 = StateNo != 21179;Mr.X KO 2/2
;trigger1 = StateNo != [21697,21731];Mona/Lisa Team Attacks
v = 58
range = 1,1000
;range = 1,1000+(50*(6-root,Var(51)))
ignorehitpause = 1

;Parry Detection Start

;Reset Var(7)
[State -1, VarSet]
type = VarSet
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = MoveType = A
trigger1 = Time = 1
trigger1 = Var(7) != 0
v = 7
value = 0
ignorehitpause = 1

;Hit, target
[State -1, VarSet]
type = VarSet
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = MoveType = A
trigger1 = Time > 0
trigger1 = MoveHit
trigger1 = Numtarget > 0
trigger1 = Var(7) = 0
v = 7
value = 1
ignorehitpause = 1

;Guarded
[State -1, VarSet]
type = VarSet
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = MoveType = A
trigger1 = Time > 0
trigger1 = MoveGuarded
trigger1 = Var(7) = 0
v = 7
value = 2
ignorehitpause = 1

;Hit, no target (Parry)
[State -1, VarSet]
type = VarSet
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = MoveType = A
trigger1 = Time > 0
trigger1 = MoveHit || MoveReversed
trigger1 = Numtarget = 0 || MoveReversed
trigger1 = Var(7) = 0
v = 7
value = 3
ignorehitpause = 1

;Reduce attack cooldown by 50% if parry detected
[State -1, VarSet]
type = VarSet
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = Time > 1
trigger1 = Var(7) = 3
v = 51
value = (Var(51)/2)
ignorehitpause = 1

[State -1, VarSet]
type = VarSet
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = Time > 1
trigger1 = Var(7) = 3
v = 7
value = 100
ignorehitpause = 1

;Parry Detection End

;Reset Knife Hit (Jack) / Flames Hit (Big-Ben)
[State -1, VarSet]
type = VarSet
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = Var(45) != 0
trigger1 = MoveType = H
v = 45
value = 0

;Knife Hit for Jack. Needed since enemy projectiles are no longer helpers.
[State -1, VarSet]
type = VarSet
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = Var(45) != 1
trigger1 = root, NumExplod(110930) = 1
trigger1 = MoveType != H
trigger1 = Var(0) = 11
v = 45
value = 1
ignorehitpause = 1

;Roo Special Meter
[State -1, VarAdd]
type = VarAdd
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = Var(0) = 21
trigger1 = StateNo != 21289
trigger1 = StateNo != 21291
trigger1 = Var(44) < 300
v = 44
value = 1
ignorehitpause = 1

;Roo Target Safety
;[State -1, TargetState]
;type = TargetState
;trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
;trigger1 = Var(0) = 21
;trigger1 = NumTarget(21295) > 0
;trigger1 = Time > 2
;trigger1 = StateNo != [21295,21321]
;trigger1 = StateNo != 880
;trigger1 = StateNo != 881
;trigger1 = Var(42) = 0
;value = 21323
;ID = 21295
;ignorehitpause = 1

;Shiva Special Meter
[State -1, VarAdd]
type = VarAdd
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = Var(0) = 12
trigger1 = NumEnemy = 1
trigger1 = Var(44) < 900
trigger1 = StateNo != 11115
v = 44
value = ifelse((random>=800),2,1);1
ignorehitpause = 1

;-mulitple enemies
[State -1, VarAdd]
type = VarAdd
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = Var(0) = 12
trigger1 = NumEnemy > 1
trigger1 = Var(44) < 900
trigger1 = StateNo != 11115
v = 44
value = ifelse((random>=500),2,1)
;value = 2
ignorehitpause = 1

;Mona Team Attack Cooldown
[State -1, VarAdd]
type = VarAdd
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = Var(0) = 29
trigger1 = Var(44) > 0
v = 44
value = -1
ignorehitpause = 1

;Evasion Effects
[State -1, Trans]
type = Trans
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = root, Var(44) = 1;Special Effects are enabled
trigger1 = Var(3) = 5;Evasion
trans = addalpha
alpha = 231,25
ignorehitpause = 1

;Cloak Effects
[State -1, Trans]
type = Trans
triggerall = IsHelper(200) || IsHelper(201) || IsHelper(202)
triggerall = root, Var(44) = 1;Special Effects are enabled
triggerall = Var(3) = 11;Stealth
trigger1 = Var(36) <= 0
trigger2 = Var(36) = [1,30]
trigger2 = Time%3 = 0
trans = addalpha
alpha = 32,256
ignorehitpause = 1

[State -1, Trans]
type = Trans
triggerall = IsHelper(200) || IsHelper(201) || IsHelper(202)
triggerall = root, Var(44) = 1;Special Effects are enabled
triggerall = Var(3) = 11;Stealth
trigger1 = Var(36) = 777
trans = addalpha
alpha = 128,256
ignorehitpause = 1

;Stealth Attack Bonus
[State -1, AttackMulSet]
type = AttackMulSet
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = root, Var(44) = 1;Special Effects are enabled
trigger1 = Var(3) = 11;Stealth
trigger1 = (Var(36) <= 0) || (Var(36) = 777)
value = 2
ignorehitpause = 1

;[State -1, Helper]
;type = Helper
;trigger1 = NumHelper(480111) = 0
;trigger1 = IsHelper(200)
;trigger1 = root, Var(44) = 1;Special Effects are enabled
;trigger1 = Var(3) = 5;Evasion
;trigger1 = (StateNo != 10181) && (StateNo != 11000) && (StateNo != 21567)
;helpertype = normal ;player
;name = "Invis1"
;ID = 480111
;stateno = 8617
;pos = -10,0
;postype = p1
;facing = 1
;keyctrl = 0
;ownpal = 1
;supermovetime = 0
;pausemovetime = 0
;ignorehitpause = 1

;[State -1, Helper]
;type = Helper
;trigger1 = NumHelper(480222) = 0
;trigger1 = IsHelper(201)
;trigger1 = root, Var(44) = 1;Special Effects are enabled
;trigger1 = Var(3) = 5;Evasion
;trigger1 = (StateNo != 10181) && (StateNo != 11000) && (StateNo != 21567)
;helpertype = normal ;player
;name = "Invis1"
;ID = 480222
;stateno = 8617
;pos = -10,0
;postype = p1
;facing = 1
;keyctrl = 0
;ownpal = 1
;supermovetime = 0
;pausemovetime = 0
;ignorehitpause = 1

;[State -1, Helper]
;type = Helper
;trigger1 = NumHelper(480333) = 0
;trigger1 = IsHelper(202)
;trigger1 = root, Var(44) = 1;Special Effects are enabled
;trigger1 = Var(3) = 5;Evasion
;trigger1 = (StateNo != 10181) && (StateNo != 11000) && (StateNo != 21567)
;helpertype = normal ;player
;name = "Invis1"
;ID = 480333
;stateno = 8617
;pos = -10,0
;postype = p1
;facing = 1
;keyctrl = 0
;ownpal = 1
;supermovetime = 0
;pausemovetime = 0
;ignorehitpause = 1

;[State -1, Helper]
;type = Helper
;trigger1 = NumHelper(481) = 0
;trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
;trigger1 = root, Var(44) = 1;Special Effects are enabled
;trigger1 = Var(3) = 5;Evasion
;trigger1 = (StateNo != 10181) && (StateNo != 11000) && (StateNo != 21567)
;helpertype = normal ;player
;name = "Invis2"
;ID = 481
;stateno = 8619
;pos = -20,0
;postype = p1
;facing = 1
;keyctrl = 0
;ownpal = 1
;supermovetime = 0
;pausemovetime = 0
;ignorehitpause = 1

;Shield Effect

[State -1, Helper]
type = Helper
trigger1 = NumHelper(482111) = 0
trigger1 = IsHelper(200)
trigger1 = root, Var(44) = 1;Special Effects are enabled
trigger1 = Var(3) = 10;Shield
trigger1 = FVar(32) > 0;Shield Exists
trigger1 = (StateNo != 10181) && (StateNo != 11000) && (StateNo != 21567)
helpertype = normal ;player
name = "GlowEffect"
ID = 482111
stateno = 8623
pos = 0,0
postype = p1
facing = 1
keyctrl = 0
ownpal = 1
supermovetime = 0
pausemovetime = 0
ignorehitpause = 1

[State -1, Helper]
type = Helper
trigger1 = NumHelper(482222) = 0
trigger1 = IsHelper(201)
trigger1 = root, Var(44) = 1;Special Effects are enabled
trigger1 = Var(3) = 10;Shield
trigger1 = FVar(32) > 0;Shield Exists
trigger1 = (StateNo != 10181) && (StateNo != 11000) && (StateNo != 21567)
helpertype = normal ;player
name = "GlowEffect"
ID = 482222
stateno = 8623
pos = 0,0
postype = p1
facing = 1
keyctrl = 0
ownpal = 1
supermovetime = 0
pausemovetime = 0
ignorehitpause = 1

[State -1, Helper]
type = Helper
trigger1 = NumHelper(482333) = 0
trigger1 = IsHelper(202)
trigger1 = root, Var(44) = 1;Special Effects are enabled
trigger1 = Var(3) = 10;Shield
trigger1 = FVar(32) > 0;Shield Exists
trigger1 = (StateNo != 10181) && (StateNo != 11000) && (StateNo != 21567)
helpertype = normal ;player
name = "GlowEffect"
ID = 482333
stateno = 8623
pos = 0,0
postype = p1
facing = 1
keyctrl = 0
ownpal = 1
supermovetime = 0
pausemovetime = 0
ignorehitpause = 1

;Berserk PalFX
[State -1, PalFX]
type = PalFX
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = root, Var(44) = 1;Special Effects are enabled
trigger1 = Var(3) = 3;Berserk
trigger1 = MoveType != H || StateNo = 10011
time = 1
add = 0,-50,-50
;add = 0,-150,-150
mul = 256,256,256
;sinadd = 0,0,0,10
invertall = 0
color = 256
ignorehitpause = 1

;X Berserk PalFX
[State -1, PalFX]
type = PalFX
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = root, Var(44) = 1;Special Effects are enabled
trigger1 = Var(3) = 6;X Berserk
trigger1 = MoveType != H || StateNo = 10011
time = 1
add = 0,-150,-150
;add = 0,-150,-150
mul = 256,256,256
;sinadd = 0,0,0,10
invertall = 0
color = 256
ignorehitpause = 1

;Stagger PalFX
[State -1, PalFX]
type = PalFX
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = root, Var(44) = 1;Special Effects are enabled
trigger1 = Var(3) = 15;Stagger
;trigger1 = MoveType != H || StateNo = 10011
time = 1
add = 50,0,-100
;add = 0,-150,-150
mul = 256,256,256
;sinadd = 0,0,0,10
invertall = 0
color = 256
ignorehitpause = 1

;[State -1, DisplayToClipboard]
;type = DisplayToClipboard
;trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
;trigger1 = 1
;text = "Var(3) = %d"
;params = Var(3)

;Special Effect Icons Start

;Regeneration Icon
[State -1, Explod]
type = Explod
trigger1 = IsHelper(200)
trigger1 = root, Var(44) = 1;Special Effects are enabled
trigger1 = Var(3) = 1;Regeneration
trigger1 = (StateNo != 10181) && (StateNo != 11000) && (StateNo != 21567)
trigger1 = NumExplod(601) = 0
ID = 601
anim = 601
bindtime = -1
removetime = -1
facing = -1
ontop = 0
ownpal = 1
pos = -135,8
postype = right
sprpriority = 250
ignorehitpause = 1
supermovetime = 999999
pausemovetime = 999999

[State -1, Explod]
type = Explod
trigger1 = IsHelper(201)
trigger1 = root, Var(44) = 1;Special Effects are enabled
trigger1 = Var(3) = 1;Regeneration
trigger1 = (StateNo != 10181) && (StateNo != 11000) && (StateNo != 21567)
trigger1 = NumExplod(601) = 0
ID = 601
anim = 601
bindtime = -1
removetime = -1
facing = -1
ontop = 0
ownpal = 1
pos = -135,25
postype = right
sprpriority = 250
ignorehitpause = 1
supermovetime = 999999
pausemovetime = 999999

[State -1, Explod]
type = Explod
trigger1 = IsHelper(202)
trigger1 = root, Var(44) = 1;Special Effects are enabled
trigger1 = Var(3) = 1;Regeneration
trigger1 = (StateNo != 10181) && (StateNo != 11000) && (StateNo != 21567)
trigger1 = NumExplod(601) = 0
ID = 601
anim = 601
bindtime = -1
removetime = -1
facing = -1
ontop = 0
ownpal = 1
pos = -135,42
postype = right
sprpriority = 250
ignorehitpause = 1
supermovetime = 999999
pausemovetime = 999999

;Shield Icon
[State -1, Explod]
type = Explod
trigger1 = IsHelper(200)
trigger1 = root, Var(44) = 1;Special Effects are enabled
trigger1 = Var(3) = 2;Armor
trigger1 = (StateNo != 10181) && (StateNo != 11000) && (StateNo != 21567)
trigger1 = NumExplod(600) = 0
ID = 600
anim = 600
bindtime = -1
removetime = -1
facing = -1
ontop = 0
ownpal = 1
pos = -135,8
postype = right
sprpriority = 250
ignorehitpause = 1
supermovetime = 999999
pausemovetime = 999999

[State -1, Explod]
type = Explod
trigger1 = IsHelper(201)
trigger1 = root, Var(44) = 1;Special Effects are enabled
trigger1 = Var(3) = 2;Armor
trigger1 = (StateNo != 10181) && (StateNo != 11000) && (StateNo != 21567)
trigger1 = NumExplod(600) = 0
ID = 600
anim = 600
bindtime = -1
removetime = -1
facing = -1
ontop = 0
ownpal = 1
pos = -135,25
postype = right
sprpriority = 250
ignorehitpause = 1
supermovetime = 999999
pausemovetime = 999999

[State -1, Explod]
type = Explod
trigger1 = IsHelper(202)
trigger1 = root, Var(44) = 1;Special Effects are enabled
trigger1 = Var(3) = 2;Armor
trigger1 = (StateNo != 10181) && (StateNo != 11000) && (StateNo != 21567)
trigger1 = NumExplod(600) = 0
ID = 600
anim = 600
bindtime = -1
removetime = -1
facing = -1
ontop = 0
ownpal = 1
pos = -135,42
postype = right
sprpriority = 250
ignorehitpause = 1
supermovetime = 999999
pausemovetime = 999999

;Anti-Projectile Icon
[State -1, Explod]
type = Explod
trigger1 = IsHelper(200)
trigger1 = root, Var(44) = 1;Special Effects are enabled
trigger1 = Var(3) = 4;Anti-Projectile
trigger1 = (StateNo != 10181) && (StateNo != 11000) && (StateNo != 21567)
trigger1 = StateNo != 9500
trigger1 = NumExplod(602) = 0
ID = 602
anim = 602
bindtime = -1
removetime = -1
facing = -1
ontop = 0
ownpal = 1
pos = -135,8
postype = right
sprpriority = 250
ignorehitpause = 1
supermovetime = 999999
pausemovetime = 999999

[State -1, Explod]
type = Explod
trigger1 = IsHelper(201)
trigger1 = root, Var(44) = 1;Special Effects are enabled
trigger1 = Var(3) = 4;Anti-Projectile
trigger1 = (StateNo != 10181) && (StateNo != 11000) && (StateNo != 21567)
trigger1 = StateNo != 9500
trigger1 = NumExplod(602) = 0
ID = 602
anim = 602
bindtime = -1
removetime = -1
facing = -1
ontop = 0
ownpal = 1
pos = -135,25
postype = right
sprpriority = 250
ignorehitpause = 1
supermovetime = 999999
pausemovetime = 999999

[State -1, Explod]
type = Explod
trigger1 = IsHelper(202)
trigger1 = root, Var(44) = 1;Special Effects are enabled
trigger1 = Var(3) = 4;Anti-Projectile
trigger1 = (StateNo != 10181) && (StateNo != 11000) && (StateNo != 21567)
trigger1 = StateNo != 9500
trigger1 = NumExplod(602) = 0
ID = 602
anim = 602
bindtime = -1
removetime = -1
facing = -1
ontop = 0
ownpal = 1
pos = -135,42
postype = right
sprpriority = 250
ignorehitpause = 1
supermovetime = 999999
pausemovetime = 999999

;Recon
[State -1, Explod]
type = Explod
trigger1 = IsHelper(200)
trigger1 = root, Var(44) = 1;Special Effects are enabled
trigger1 = Var(3) = 7;Recon
trigger1 = (StateNo != 10181) && (StateNo != 11000) && (StateNo != 21567)
trigger1 = NumExplod(603) = 0
ID = 603
anim = 603
bindtime = -1
removetime = -1
facing = -1
ontop = 0
ownpal = 1
pos = -135,8
postype = right
sprpriority = 250
ignorehitpause = 1
supermovetime = 999999
pausemovetime = 999999

[State -1, Explod]
type = Explod
trigger1 = IsHelper(201)
trigger1 = root, Var(44) = 1;Special Effects are enabled
trigger1 = Var(3) = 7;Recon
trigger1 = (StateNo != 10181) && (StateNo != 11000) && (StateNo != 21567)
trigger1 = NumExplod(603) = 0
ID = 603
anim = 603
bindtime = -1
removetime = -1
facing = -1
ontop = 0
ownpal = 1
pos = -135,25
postype = right
sprpriority = 250
ignorehitpause = 1
supermovetime = 999999
pausemovetime = 999999

[State -1, Explod]
type = Explod
trigger1 = IsHelper(202)
trigger1 = root, Var(44) = 1;Special Effects are enabled
trigger1 = Var(3) = 7;Recon
trigger1 = (StateNo != 10181) && (StateNo != 11000) && (StateNo != 21567)
trigger1 = NumExplod(603) = 0
ID = 603
anim = 603
bindtime = -1
removetime = -1
facing = -1
ontop = 0
ownpal = 1
pos = -135,42
postype = right
sprpriority = 250
ignorehitpause = 1
supermovetime = 999999
pausemovetime = 999999

;Shield Bar
[State -1, Explod]
type = Explod
trigger1 = IsHelper(200)
;trigger1 = root, Var(44) = 1;Special Effects are enabled
trigger1 = Var(3) = 10;Shield
trigger1 = FVar(32) > 0
trigger1 = (StateNo != 10181) && (StateNo != 11000) && (StateNo != 21567)
trigger1 = NumExplod(604) = 0
ID = 604
anim = 604
bindtime = -1
removetime = -1
facing = -1
ontop = 0
ownpal = 1
pos = -14,10
scale = 0.5,0.5
postype = right
sprpriority = 333
ignorehitpause = 1
supermovetime = 999999
pausemovetime = 999999

[State -1, Explod]
type = Explod
trigger1 = IsHelper(201)
trigger1 = root, Var(44) = 1;Special Effects are enabled
trigger1 = Var(3) = 10;Shield
trigger1 = FVar(32) > 0
trigger1 = (StateNo != 10181) && (StateNo != 11000) && (StateNo != 21567)
trigger1 = NumExplod(604) = 0
ID = 604
anim = 604
bindtime = -1
removetime = -1
facing = -1
ontop = 0
ownpal = 1
pos = -14,27
scale = 0.5,0.5
postype = right
sprpriority = 333
ignorehitpause = 1
supermovetime = 999999
pausemovetime = 999999

[State -1, Explod]
type = Explod
trigger1 = IsHelper(202)
trigger1 = root, Var(44) = 1;Special Effects are enabled
trigger1 = Var(3) = 10;Shield
trigger1 = FVar(32) > 0
trigger1 = (StateNo != 10181) && (StateNo != 11000) && (StateNo != 21567)
trigger1 = NumExplod(604) = 0
ID = 604
anim = 604
bindtime = -1
removetime = -1
facing = -1
ontop = 0
ownpal = 1
pos = -14,44
scale = 0.5,0.5
postype = right
sprpriority = 333
ignorehitpause = 1
supermovetime = 999999
pausemovetime = 999999

;Shield Bar Min Size
[State 3100, ModifyExplod]
type = ModifyExplod
trigger1 = IsHelper
trigger1 = FVar(32) <= 0
trigger1 = NumExplod(604) = 1
ID = 604
scale = 0,0.5
ignorehitpause = 1

;Shield Bar Size
[State 3100, ModifyExplod]
type = ModifyExplod
trigger1 = IsHelper
trigger1 = FVar(32) <= Floor(1000*(parent,FVar(38)))
trigger1 = FVar(32) > 0
trigger1 = NumExplod(604) = 1
ID = 604
scale = ((FVar(32)*0.5)/1000),0.5
ignorehitpause = 1

;Shield Bar Max Size
[State 3100, ModifyExplod]
type = ModifyExplod
trigger1 = IsHelper
trigger1 = FVar(32) > Floor(1000*(parent,FVar(38)))
trigger1 = NumExplod(604) = 1
ID = 604
scale = 0.5,0.5
ignorehitpause = 1

;Advanced
[State -1, Explod]
type = Explod
trigger1 = IsHelper(200)
trigger1 = (root, Var(44) = 1) || (root, Var(44) = 2);Special Effects are enabled
trigger1 = Var(3) = 12;Advanced
trigger1 = (StateNo != 10181) && (StateNo != 11000) && (StateNo != 21567)
trigger1 = NumExplod(605) = 0
ID = 605
anim = 605
bindtime = -1
removetime = -1
facing = -1
ontop = 0
ownpal = 1
pos = -135,8
postype = right
sprpriority = 250
ignorehitpause = 1
supermovetime = 999999
pausemovetime = 999999

[State -1, Explod]
type = Explod
trigger1 = IsHelper(201)
trigger1 = (root, Var(44) = 1) || (root, Var(44) = 2);Special Effects are enabled
trigger1 = Var(3) = 12;Advanced
trigger1 = (StateNo != 10181) && (StateNo != 11000) && (StateNo != 21567)
trigger1 = NumExplod(605) = 0
ID = 605
anim = 605
bindtime = -1
removetime = -1
facing = -1
ontop = 0
ownpal = 1
pos = -135,25
postype = right
sprpriority = 250
ignorehitpause = 1
supermovetime = 999999
pausemovetime = 999999

[State -1, Explod]
type = Explod
trigger1 = IsHelper(202)
trigger1 = (root, Var(44) = 1) || (root, Var(44) = 2);Special Effects are enabled
trigger1 = Var(3) = 12;Advanced
trigger1 = (StateNo != 10181) && (StateNo != 11000) && (StateNo != 21567)
trigger1 = NumExplod(605) = 0
ID = 605
anim = 605
bindtime = -1
removetime = -1
facing = -1
ontop = 0
ownpal = 1
pos = -135,42
postype = right
sprpriority = 250
ignorehitpause = 1
supermovetime = 999999
pausemovetime = 999999

;Elite
[State -1, Explod]
type = Explod
trigger1 = IsHelper(200)
trigger1 = (root, Var(44) = 1) || (root, Var(44) = 2);Special Effects are enabled
trigger1 = Var(3) = 13;Elite
trigger1 = (StateNo != 10181) && (StateNo != 11000) && (StateNo != 21567)
trigger1 = NumExplod(606) = 0
ID = 606
anim = 606
bindtime = -1
removetime = -1
facing = -1
ontop = 0
ownpal = 1
pos = -135,8
postype = right
sprpriority = 250
ignorehitpause = 1
supermovetime = 999999
pausemovetime = 999999

[State -1, Explod]
type = Explod
trigger1 = IsHelper(201)
trigger1 = (root, Var(44) = 1) || (root, Var(44) = 2);Special Effects are enabled
trigger1 = Var(3) = 13;Elite
trigger1 = (StateNo != 10181) && (StateNo != 11000) && (StateNo != 21567)
trigger1 = NumExplod(606) = 0
ID = 606
anim = 606
bindtime = -1
removetime = -1
facing = -1
ontop = 0
ownpal = 1
pos = -135,25
postype = right
sprpriority = 250
ignorehitpause = 1
supermovetime = 999999
pausemovetime = 999999

[State -1, Explod]
type = Explod
trigger1 = IsHelper(202)
trigger1 = (root, Var(44) = 1) || (root, Var(44) = 2);Special Effects are enabled
trigger1 = Var(3) = 13;Elite
trigger1 = (StateNo != 10181) && (StateNo != 11000) && (StateNo != 21567)
trigger1 = NumExplod(606) = 0
ID = 606
anim = 606
bindtime = -1
removetime = -1
facing = -1
ontop = 0
ownpal = 1
pos = -135,42
postype = right
sprpriority = 250
ignorehitpause = 1
supermovetime = 999999
pausemovetime = 999999

;Super-Elite
[State -1, Explod]
type = Explod
trigger1 = IsHelper(200)
trigger1 = (root, Var(44) = 1) || (root, Var(44) = 2);Special Effects are enabled
trigger1 = Var(3) = 14;Super-Elite
trigger1 = (StateNo != 10181) && (StateNo != 11000) && (StateNo != 21567)
trigger1 = NumExplod(607) = 0
ID = 607
anim = 607
bindtime = -1
removetime = -1
facing = -1
ontop = 0
ownpal = 1
pos = -135,8
postype = right
sprpriority = 250
ignorehitpause = 1
supermovetime = 999999
pausemovetime = 999999

[State -1, Explod]
type = Explod
trigger1 = IsHelper(201)
trigger1 = (root, Var(44) = 1) || (root, Var(44) = 2);Special Effects are enabled
trigger1 = Var(3) = 14;Super-Elite
trigger1 = (StateNo != 10181) && (StateNo != 11000) && (StateNo != 21567)
trigger1 = NumExplod(607) = 0
ID = 607
anim = 607
bindtime = -1
removetime = -1
facing = -1
ontop = 0
ownpal = 1
pos = -135,25
postype = right
sprpriority = 250
ignorehitpause = 1
supermovetime = 999999
pausemovetime = 999999

[State -1, Explod]
type = Explod
trigger1 = IsHelper(202)
trigger1 = (root, Var(44) = 1) || (root, Var(44) = 2);Special Effects are enabled
trigger1 = Var(3) = 14;Super-Elite
trigger1 = (StateNo != 10181) && (StateNo != 11000) && (StateNo != 21567)
trigger1 = NumExplod(607) = 0
ID = 607
anim = 607
bindtime = -1
removetime = -1
facing = -1
ontop = 0
ownpal = 1
pos = -135,42
postype = right
sprpriority = 250
ignorehitpause = 1
supermovetime = 999999
pausemovetime = 999999

;Remove Special Effect Icons

[State 11000, RemoveExplod]
type = RemoveExplod
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = (StateNo = 10181) || (StateNo = 11000) || (StateNo = 21195) || (StateNo = 21619) || (StateNo = 21567)
trigger1 = NumExplod(600) > 0
id = 600

[State 11000, RemoveExplod]
type = RemoveExplod
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = (StateNo = 10181) || (StateNo = 11000)  || (StateNo = 21195) || (StateNo = 21619) || (StateNo = 21567)
trigger1 = NumExplod(601) > 0
id = 601

[State 11000, RemoveExplod]
type = RemoveExplod
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = (StateNo = 10181) || (StateNo = 11000)  || (StateNo = 21195) || (StateNo = 21619) || (StateNo = 21567)
trigger1 = NumExplod(602) > 0
id = 602

[State 11000, RemoveExplod]
type = RemoveExplod
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = (StateNo = 10181) || (StateNo = 11000)  || (StateNo = 21195) || (StateNo = 21619) || (StateNo = 21567)
trigger1 = NumExplod(603) > 0
id = 603

[State 11000, RemoveExplod]
type = RemoveExplod
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = (StateNo = 10181) || (StateNo = 11000)  || (StateNo = 21195) || (StateNo = 21619) || (StateNo = 21567)
trigger1 = NumExplod(604) > 0
id = 604

[State 11000, RemoveExplod]
type = RemoveExplod
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = (StateNo = 10181) || (StateNo = 11000)  || (StateNo = 21195) || (StateNo = 21619) || (StateNo = 21567)
trigger1 = NumExplod(605) > 0
id = 605

[State 11000, RemoveExplod]
type = RemoveExplod
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = (StateNo = 10181) || (StateNo = 11000)  || (StateNo = 21195) || (StateNo = 21619) || (StateNo = 21567)
trigger1 = NumExplod(606) > 0
id = 606

[State 11000, RemoveExplod]
type = RemoveExplod
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = (StateNo = 10181) || (StateNo = 11000)  || (StateNo = 21195) || (StateNo = 21619) || (StateNo = 21567)
trigger1 = NumExplod(607) > 0
id = 607

;----------
;Tiger Blitz Star Charge
;[State -1, VarAdd]
;type = VarAdd
;trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
;trigger1 = Var(0) = 24
;trigger1 = Var(43) < 3
;trigger1 = MoveType != H
;fv = 35
;value = 0.3
;ignorehitpause = 1

;+1 Blitz Star
;[State -1, VarAdd]
;type = VarAdd
;trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
;trigger1 = Var(0) = 24
;trigger1 = Var(43) < 3
;trigger1 = FVar(35) >= 100
;v = 43
;value = 1
;ignorehitpause = 1

;Reset Charge
;[State -1, VarAdd]
;type = VarAdd
;trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
;trigger1 = Var(0) = 24
;trigger1 = FVar(35) >= 100
;fv = 35
;value = -100
;ignorehitpause = 1
;----------

;Stop Tiger Voice
[State -1, StopSnd]
type = StopSnd
triggerall = IsHelper(200) || IsHelper(201) || IsHelper(202)
triggerall = PrevStateNo = 21415 || PrevStateNo = 21245
triggerall = Time = 1
trigger1 = MoveType = H
trigger2 = StateNo = 11000
channel = 1

[State -1, StopSnd]
type = StopSnd
triggerall = IsHelper(200) || IsHelper(201) || IsHelper(202)
triggerall = PrevStateNo = 21415 || PrevStateNo = 21245
triggerall = Time = 1
trigger1 = MoveType = H
trigger2 = StateNo = 11000
channel = 2

;Stop Nora Voice
[State -1, StopSnd]
type = StopSnd
triggerall = IsHelper(200) || IsHelper(201) || IsHelper(202)
triggerall = PrevStateNo = 21673
triggerall = Time = 1
trigger1 = MoveType = H
trigger2 = StateNo = 11000
channel = 1

[State -1, StopSnd]
type = StopSnd
triggerall = IsHelper(200) || IsHelper(201) || IsHelper(202)
triggerall = PrevStateNo = 21673
triggerall = Time = 1
trigger1 = MoveType = H
trigger2 = StateNo = 11000
channel = 2

;Block Limit Charge
[State -1, VarAdd]
type = VarAdd
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = Var(0) != 16 ;Abadede
trigger1 = FVar(34) < (root,Var(42))
trigger1 = StateNo != 21579
trigger1 = StateNo != 21581
trigger1 = StateNo != 21663 && StateNo != 21665 && StateNo != 21667
trigger1 = StateNo != 10013 && StateNo != 10011
trigger1 = StateNo != 21827 && StateNo != 21819
trigger1 = StateNo != [120,155]
trigger1 = StateType != L
trigger1 = Var(53) <= 0 || Var(0) != 12
fv = 34
value = (parent, FVar(39))
ignorehitpause = 1

;Extra Block Charge (Shiva on last life bar)
[State -1, VarAdd]
type = VarAdd
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = Var(0) = 12
trigger1 = NumEnemy > 0
trigger1 = NumExplod(73522) = 1; || (Enemynear, Teammode = Simul)
trigger1 = StateNo != 10013 && StateNo != 10011
trigger1 = FVar(34) < (root,Var(42))
trigger1 = StateType != L
trigger1 = Var(53) <= 0
fv = 34
value = ((parent, FVar(39))/2.0)
ignorehitpause = 1

;New Shiva Guard restore
;[State -1, VarAdd]
;type = VarAdd
;trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
;trigger1 = Var(0) = 12
;trigger1 = StateNo != 10013 && StateNo != 10011
;trigger1 = FVar(23) < 1
;;trigger1 = StateType != L
;fv = 23
;value = ifelse((MoveType != H),(0.00015*Var(43)*0.5),(0.00015*Var(43))); = 0.009/sec
;ignorehitpause = 1
;0.009
;x2 = 0.018
;x3 = 0.027
;x4 = 0.036
;x5 = 0.045

;Guard Bar Size
;[State 3100, ModifyExplod]
;type = ModifyExplod
;trigger1 = IsHelper(200)
;trigger1 = Var(0) = 12
;trigger1 = NumExplod(17451) = 1
;trigger1 = FVar(23) >= 0
;ID = 17451
;scale = (FVar(23)*0.5/1),0.5
;ignorehitpause = 1

;Guard Bar Min Size
;[State 3100, ModifyExplod]
;type = ModifyExplod
;trigger1 = IsHelper(200)
;trigger1 = Var(0) = 12
;trigger1 = NumExplod(17451) = 1
;trigger1 = FVar(23) < 0
;ID = 17451
;scale = 0,0.5
;ignorehitpause = 1

;Guard Bar Max Size
;[State 3100, ModifyExplod]
;type = ModifyExplod
;trigger1 = IsHelper(200)
;trigger1 = Var(0) = 12
;trigger1 = NumExplod(17451) = 1
;trigger1 = FVar(23) > 1
;ID = 17451
;scale = 0.5,0.5
;ignorehitpause = 1

;[State -1, VarAdd]
;type = VarAdd
;trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
;trigger1 = Var(0) = 12
;trigger1 = NumEnemy > 0
;trigger1 = NumExplod(73522) = 1 && (Enemynear, Teammode = Simul)
;trigger1 = StateNo != 10013 && StateNo != 10011
;trigger1 = FVar(34) < (root,Var(42))
;fv = 34
;value = ((parent, FVar(39))/4.0)
;ignorehitpause = 1

;Block Limit Charge (Abadede)
[State -1, VarAdd]
type = VarAdd
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = Var(0) = 16 ;Abadede
trigger1 = FVar(34) < (root,Var(42))
trigger1 = StateNo != 21113
trigger1 = StateType != L
fv = 34
value = ((parent, FVar(39))/2.0)
ignorehitpause = 1

[State -1, VarSet]
type = VarSet
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = FVar(34) < 0
fv = 34
value = 0
ignorehitpause = 1

;[State -1, DisplayToClipboard]
;type = DisplayToClipboard
;trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
;text = "Damage Multiplier = %f"
;params = FVar(37)
;ignorehitpause = 1

;Var(41) = Special ID (6830787)

;Special ID
;[State 11089, VarSet]
;type = VarSet
;trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
;trigger1 = (parent, Var(25) = 1)
;trigger1 = Var(41) != 6830787
;v = 41
;value = 6830787

;Remove SoR enemy name on KO
[State 11000, RemoveExplod]
type = RemoveExplod
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = Var(0) != 19;Don't remove Mr.X's name
trigger1 = FVar(1) <= 0
trigger1 = NumExplod(10021) > 0
id = 10021

;Remove SoR enemy portrait on KO
[State 11000, RemoveExplod]
type = RemoveExplod
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = FVar(1) <= 0
trigger1 = NumExplod(10022) > 0
id = 10022

;CWD Akaiho Recover Ability Set
[State 11089, VarSet]
type = VarSet
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = Var(0) = 35 ;Akaiho
trigger1 = Var(37) = 2 ;Coward
trigger1 = MoveType = H
trigger1 = PrevStateNo = 21649
trigger1 = Var(47) = 0
v = 47
value = 600

;CWD Recover Ability Timer decrease
[State -1, VarAdd]
type = VarAdd
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = Var(0) = 35 ;Akaiho
trigger1 = Var(37) = 2 ;Coward
trigger1 = Var(47) > 0
v = 47
value = -1
ignorehitpause = 1

;Block damage multiplier
[State -1, VarSet]
type = VarSet
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = RoundState = 2
trigger1 = root, FVar(38) > 1
fv = 33
value = (root,FVar(38));1+( ( (root,FVar(38))-1) /2.0 )

;Block damage multiplier (No change)
[State -1, VarSet]
type = VarSet
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = RoundState = 2
trigger1 = root, FVar(38) <= 1
fv = 33
value = 1

;Reset damage taken
[State -1, VarSet]
type = VarSet
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = RoundState = 2
trigger1 = Time > 0
trigger1 = StateNo != [5000,5900]
fv = 28
value = 0

;Reset hits taken
[State -1, VarSet]
type = VarSet
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = RoundState = 2
trigger1 = Time > 0
trigger1 = StateNo != [120,155]
trigger1 = Var(5) > 0
v = 5
value = 0

;[State -1, DisplayToClipboard]
;type = DisplayToClipboard
;trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
;;trigger1 = Var(0) = [12,18]
;text = "Poison Value = %f"
;params = FVar(31)
;ignorehitpause = 1

;Var(22)  FVar(31)

;Poison Damage
[State -1, VarAdd]
type = VarAdd
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = RoundState = 2
trigger1 = Var(22) > 0
trigger1 = FVar(27) > 0
trigger1 = FVar(1) > 1.05+FVar(27)
fv = 1
value = -FVar(27)
ignorehitpause = 1

;Posion Time Drop
[State -1, VarAdd]
type = VarAdd
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = RoundState = 2
trigger1 = Var(22) > 0
trigger1 = FVar(27) > 0
v = 22
value = -1
ignorehitpause = 1

;Remove Poison Value once poison effect ends
[State -1, VarSet]
type = VarSet
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = RoundState = 2
trigger1 = Var(22) <= 0
trigger1 = FVar(27) > 0
fv = 27
value = 0
ignorehitpause = 1

;+ Sign
;[State 3000, Group1]
;type = Explod
;trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
;trigger1 = root, Var(44) = 1;Special Effects are enabled
;trigger1 = Var(3) = 1;Regeneration
;trigger1 = (StateNo != 10181) && (StateNo != 11000)
;trigger1 = GameTime%15 = 0
;anim = 601
;ID = 601
;pos = 0,-75
;postype = p1
;facing = 1
;vfacing = 1
;bindtime = 1
;vel = ((random+random+1)%3)-1,((random+random+1)%3)-1
;accel = 0,0
;random = 20,20
;removetime = -2
;scale = 1,1
;sprpriority = 2
;ontop = 0
;shadow = 0,0,0
;ownpal = 1
;removeongethit = 0
;ignorehitpause = 1

;Shield Sign
;[State 3000, Group1]
;type = Explod
;trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
;trigger1 = root, Var(44) = 1;Special Effects are enabled
;trigger1 = Var(3) = 2;Armor
;trigger1 = (StateNo != 10181) && (StateNo != 11000)
;trigger1 = GameTime%15 = 0
;anim = 600
;ID = 600
;pos = 0,-75
;postype = p1
;facing = 1
;vfacing = 1
;bindtime = 1
;vel = ((random+random+1)%3)-1,((random+random+1)%3)-1
;accel = 0,0
;random = 20,20
;removetime = -2
;scale = 1,1
;sprpriority = 2
;ontop = 0
;shadow = 0,0,0
;ownpal = 1
;removeongethit = 0
;ignorehitpause = 1

;White Square
;[State 3000, Group1]
;type = Explod
;trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
;trigger1 = root, Var(44) = 1;Special Effects are enabled
;trigger1 = Var(3) = 4;Anti-Projectile
;trigger1 = (StateNo != 10181) && (StateNo != 11000)
;trigger1 = GameTime%15 = 0
;anim = 602
;ID = 602
;pos = 0,-75
;postype = p1
;facing = 1
;vfacing = 1
;bindtime = 1
;vel = ((random+random+1)%3)-1,((random+random+1)%3)-1
;accel = 0,0
;random = 20,20
;removetime = -2
;scale = 1,1
;sprpriority = 2
;ontop = 0
;shadow = 0,0,0
;ownpal = 1
;removeongethit = 0
;ignorehitpause = 1

;[State -1, DisplayToClipboard]
;type = DisplayToClipboard
;trigger1 = NumEnemy > 0
;text = "P2Dist X = %f"
;params = P2Dist X
;ignorehitpause = 1

;Unique ID
[State -1, VarSet]
type = VarSet
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = Var(41) != 470561329;6830787
v = 41
value = 470561329
ignorehitpause = 1

;Reset Variable that disable SoR enemy from being shown in custom states
[State -1, VarSet]
type = VarSet
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = Var(11) != 0
v = 11
value = 0
ignorehitpause = 1

[State -2, System Variable Set]
type = VarSet
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = RoundState >= 2
trigger1 = SysVar(0) != 0
trigger1 = StateType = S || Statetype = C
sysvar(0) = 0
ignorehitpause = 1

;[State -1, DisplayToClipboard]
;type = DisplayToClipboard
;trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
;text = "Attack Cooldown = %d   Block = %f"
;params = Var(51),FVar(34)
;ignorehitpause = 1

;[State -1, DisplayToClipboard]
;type = DisplayToClipboard
;trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
;trigger1 = (Var(0) = [13,18]) || (Var(0) = [31,33]) || (Var(0) = [21,22]) || (Var(0) = [28,29]) || (Var(0) = 23) || (Var(0) = 39) || (Var(0) = [41,42])
;text = "Attack Cooldown = %d   Def = %f"
;params = Var(51),FVar(37)
;ignorehitpause = 1

;Boss Normal Defense (Safety)
[State -1, VarSet]
type = VarSet
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = (Var(0) = [13,18]) || (Var(0) = [31,33]) || (Var(0) = [21,22]) || (Var(0) = [28,29]) || (Var(0) = 23) || (Var(0) = [39,40]) || (Var(0) = [41,42])
trigger1 = Var(0) != 16
trigger1 = FVar(37) <= 0
fv = 37
value = 1

[State -1, DisplayToClipboard]
type = DisplayToClipboard
trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
text = "Attack Cooldown = %d"
params = Var(51)
ignorehitpause = 1

;Anti-Range Defense. Set to 0.35 if no player is nearby.
[State -1, VarSet]
type = VarSet
triggerall = IsHelper(200) || IsHelper(201) || IsHelper(202)
triggerall = (root, Var(45) = 1) || (root, Var(45) = 11)
triggerall = NumEnemy > 0
trigger1 = P2Dist X != [-70,70]
trigger2 = P2Dist Y != [-120,120]
fv = 21
value = 0.35
ignorehitpause = 1

;Anti-Range Defense. Disable once a player gets close enough.
[State -1, VarSet];190
type = VarSet
triggerall = IsHelper(200) || IsHelper(201) || IsHelper(202)
trigger1 = (root, Var(45) = 1) || (root, Var(45) = 11)
trigger1 = NumEnemy > 0
trigger1 = P2Dist X = [-70,70]
trigger1 = P2Dist Y = [-120,120]
trigger2 = (root, Var(45) != 1) && (root, Var(45) != 11);Also set to 1 if option is off
fv = 21
value = 1
ignorehitpause = 1

;[State -1, VarSet]
;type = Null
;triggerall = IsHelper(200) || IsHelper(201) || IsHelper(202)
;triggerall = root, Var(38) = -2
;trigger1 = (Var(0) = [13,18]) || (Var(0) = [31,33]) || (Var(0) = [21,22]) || (Var(0) = [28,29]) || (Var(0) = 23) || (Var(0) = [39,40]) || (Var(0) = [41,42])
;trigger1 = (Var(0) = 12 && FVar(1) > 1000)
;trigger1 = FVar(37) := 1+(1*(.9**GetHitVar(HitCount)))
;trigger2 = Var(0) = 12 && FVar(1) > 1000
;ignorehitpause = 1

;[State -1, DefenceMulSet] ;191
;type = DefenceMulSet
;trigger1 = IsHelper(200) || IsHelper(201) || IsHelper(202)
;trigger1 = root, Var(38) = -2
;trigger1 = GetHitVar(HitCount) > 0
;trigger1 = (Var(0) = [12,19]) || (Var(0) = [31,33]) || (Var(0) = [21,22]) || (Var(0) = [28,29]) || (Var(0) = 23) || (Var(0) = [39,40]) || (Var(0) = [41,42])
;value = 1
;ignorehitpause = 
;persistent = 




;--------------------