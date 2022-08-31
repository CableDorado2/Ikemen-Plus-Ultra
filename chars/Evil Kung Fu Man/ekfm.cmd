; The CMD file.
;
; Two parts: 1. Command definition and  2. State entry
; (state entry is after the commands def section)
;
; 1. Command definition
; ---------------------
; Note: The commands are CASE-SENSITIVE, and so are the command names.
; The eight directions are:
;   B, DB, D, DF, F, UF, U, UB     (all CAPS)
;   corresponding to back, down-back, down, downforward, etc.
; The six buttons are:
;   a, b, c, x, y, z               (all lower case)
;   In default key config, abc are are the bottom, and xyz are on the
;   top row. For 2 button characters, we recommend you use a and b.
;   For 6 button characters, use abc for kicks and xyz for punches.
;
; Each [Command] section defines a command that you can use for
; state entry, as well as in the CNS file.
; The command section should look like:
;
;   [Command]
;   name = some_name
;   command = the_command
;   time = time (optional)
;   buffer.time = time (optional)
;
; - some_name
;   A name to give that command. You'll use this name to refer to
;   that command in the state entry, as well as the CNS. It is case-
;   sensitive (QCB_a is NOT the same as Qcb_a or QCB_A).
;
; - command
;   list of buttons or directions, separated by commas. Each of these
;   buttons or directions is referred to as a "symbol".
;   Directions and buttons can be preceded by special characters:
;   slash (/) - means the key must be held down
;          egs. command = /D       ;hold the down direction
;               command = /DB, a   ;hold down-back while you press a
;   tilde (~) - to detect key releases
;          egs. command = ~a       ;release the a button
;               command = ~D, F, a ;release down, press fwd, then a
;          If you want to detect "charge moves", you can specify
;          the time the key must be held down for (in game-ticks)
;          egs. command = ~30a     ;hold a for at least 30 ticks, then release
;   dollar ($) - Direction-only: detect as 4-way
;          egs. command = $D       ;will detect if D, DB or DF is held
;               command = $B       ;will detect if B, DB or UB is held
;   plus (+) - Buttons only: simultaneous press
;          egs. command = a+b      ;press a and b at the same time
;               command = x+y+z    ;press x, y and z at the same time
;   greater-than (>) - means there must be no other keys pressed or released
;                      between the previous and the current symbol.
;          egs. command = a, >~a   ;press a and release it without having hit
;                                  ;or released any other keys in between
;   You can combine the symbols:
;     eg. command = ~30$D, a+b     ;hold D, DB or DF for 30 ticks, release,
;                                  ;then press a and b together
;
;   Note: Successive direction symbols are always expanded in a manner similar
;         to this example:
;           command = F, F
;         is expanded when MUGEN reads it, to become equivalent to:
;           command = F, >~F, >F
;
;   It is recommended that for most "motion" commads, eg. quarter-circle-fwd,
;   you start off with a "release direction". This makes the command easier
;   to do.
;
; - time (optional)
;   Time allowed to do the command, given in game-ticks. The default
;   value for this is set in the [Defaults] section below. A typical
;   value is 15.
;
; - buffer.time (optional)
;   Time that the command will be buffered for. If the command is done
;   successfully, then it will be valid for this time. The simplest
;   case is to set this to 1. That means that the command is valid
;   only in the same tick it is performed. With a higher value, such
;   as 3 or 4, you can get a "looser" feel to the command. The result
;   is that combos can become easier to do because you can perform
;   the command early. Attacks just as you regain control (eg. from
;   getting up) also become easier to do. The side effect of this is
;   that the command is continuously asserted, so it will seem as if
;   you had performed the move rapidly in succession during the valid
;   time. To understand this, try setting buffer.time to 30 and hit
;   a fast attack, such as KFM's light punch.
;   The default value for this is set in the [Defaults] section below. 
;   This parameter does not affect hold-only commands (eg. /F). It
;   will be assumed to be 1 for those commands.
;
; If you have two or more commands with the same name, all of them will
; work. You can use it to allow multiple motions for the same move.
;
; Some common commands examples are given below.
;
; [Command] ;Quarter circle forward + x
; name = "QCF_x"
; command = ~D, DF, F, x
;
; [Command] ;Half circle back + a
; name = "HCB_a"
; command = ~F, DF, D, DB, B, a
;
; [Command] ;Two quarter circles forward + y
; name = "2QCF_y"
; command = ~D, DF, F, D, DF, F, y
;
; [Command] ;Tap b rapidly
; name = "5b"
; command = b, b, b, b, b
; time = 30
;
; [Command] ;Charge back, then forward + z
; name = "charge_B_F_z"
; command = ~60$B, F, z
; time = 10
;
; [Command] ;Charge down, then up + c
; name = "charge_D_U_c"
; command = ~60$D, U, c
; time = 10


;-| Default Values |-------------------------------------------------------
[Defaults]
; Default value for the "time" parameter of a Command. Minimum 1.
command.time = 15

; Default value for the "buffer.time" parameter of a Command. Minimum 1,
; maximum 30.
command.buffer.time = 1


; These 11 Single Button and Hold Dir commands must be placed here at the top
; of the CMD, above all other commands, and in the standard order shown here,
; in order for the "Compatibly Partnered" version (9742) of the helper AI
; activation method to work with different partners in simul team mode.
; (When the partner is not compatible, then it's best to just use the regular
; version (9741) and rely on the XOR method for backup in case a human
; partner's input turns off the CPU partner's AI.)
; (Now, even if you do not intend to give your character any custom AI, it
; would still be nice if you would place the commands at the top of your CMD,
; for the sake of other characters which do use this AI activation method.
; And then, define Anim 9741 in your AIR file to indicate to other characters
; that your character is compatible.
; It may slightly increase the chances of faulty AI activation if the user is
; using characters with a poor implementation of the old humanly-impossible
; commands AI activation method when fighting against your character, but
; other than that, there's really no particular reason not to.  And you can
; change the names of the commands if you want.  For compatibility, all that
; really matters is the "command" and "time" parameters.)
;
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

;-| Hold Button |----------------------------------------------------------
; Please define Anim 74140108 in your AIR file if AND ONLY IF you place these
; 7 Hold Button commands immediately after the 11 Single Button and Hold Dir
; commands at the very top of your CMD list, as demonstrated here.
; In this version of the AI code, these commands are only used by the XOR
; method, and thus are optional.  But there remains a possibility that a
; future version of the helper method might be helped by having these
; commands placed here, and Anim 74140108 would then be used to indicate
; that a partner character has a compatible CMD.

[Command]
name = "holda"
command = /a
time = 1

[Command]
name = "holdb"
command = /b
time = 1

[Command]
name = "holdc"
command = /c
time = 1

[Command]
name = "holdx"
command = /x
time = 1

[Command]
name = "holdy"
command = /y
time = 1

[Command]
name = "holdz"
command = /z
time = 1

[Command]
name = "holdstart"
command = /s
time = 1

[Command]
name = "recovery"
command = x+y
time = 1

;-| CPU |--------------------------------------------------------------
; Note that if you make any changes to the basic one-button or recovery
; commands, you'll need to make the same changes to their matching commands here
; and/or in the XOR VarSet controller.  That includes things like, for example:
;  * changing the recovery command to use a different combination of buttons.
;  * renaming the b button command as "d", or the start button command as "s".
;  * switching the button names around, e.g. so button y triggers "a" and button a triggers "y".
;  * having more than one way to trigger the same command name.
; If you understand how the XOR method works, the proper changes should be obvious.
; If you don't understand it, then simply disable the lines in the XOR VarSet
; controller that correspond to the commands you've altered.

[Command]
name = "a2"
command = a
time = 1

[Command]
name = "b2"
command = b
time = 1

[Command]
name = "c2"
command = c
time = 1

[Command]
name = "x2"
command = x
time = 1

[Command]
name = "y2"
command = y
time = 1

[Command]
name = "z2"
command = z
time = 1

[Command]
name = "start2"
command = s
time = 1

[Command]
name = "holdfwd2"
command = /$F
time = 1

[Command]
name = "holdback2"
command = /$B
time = 1

[Command]
name = "holdup2"
command = /$U
time = 1

[Command]
name = "holddown2"
command = /$D
time = 1

[Command]
name = "holda2"
command = /a
time = 1

[Command]
name = "holdb2"
command = /b
time = 1

[Command]
name = "holdc2"
command = /c
time = 1

[Command]
name = "holdx2"
command = /x
time = 1

[Command]
name = "holdy2"
command = /y
time = 1

[Command]
name = "holdz2"
command = /z
time = 1

[Command]
name = "holdstart2"
command = /s
time = 1

[Command]
name = "recovery2"
command = x+y
time = 1

; Here add matching commands for any moves that must never be used randomly
; by the computer, such as suicide moves and super moves, and add the pairs
; to the XOR VarSet controller in State -3.

; If you're desperate to make sure that the AI always gets turned on as soon
; as possible, you can add more equivalents for your own commands here too,
; and add to the XOR VarSet controller's triggers accordingly.  You should
; use button-only commands before using any commands with directional
; components, since the latter apparently doesn't work in 2002.04.14.

; And of course, if you've run out of unique command labels (Mugen allows
; 128), you can remove as many of these as you want.  You'll of course need
; to modify the XOR VarSet controller's triggers accordingly, but Mugen
; will let you know if you forget to do so. :)


;-| Super Motions |--------------------------------------------------------
;The following two have the same name, but different motion.
;Either one will be detected by a "command = TripleKFPalm" trigger.
;Time is set to 20 (instead of default of 15) to make the move
;easier to do.
;
[Command]
name = "TripleKFPalm"
command = ~D, DF, F, D, DF, F, x
time = 20

[Command]
name = "TripleKFPalm"   ;Same name as above
command = ~D, DF, F, D, DF, F, y
time = 20

[Command]
name = "SmashKFUpper"
command = ~D, DB, B, D, DB, B, x;~F, D, DF, F, D, DF, x
time = 20

[Command]
name = "SmashKFUpper"   ;Same name as above
command = ~D, DB, B, D, DB, B, y;~F, D, DF, F, D, DF, y
time = 20

[Command]
name = "Gun"
command = ~D, B, D, F, x
time = 30

[Command]
name = "Gun"
command = ~D, B, D, F, y
time = 30

[Command]
name = "Gun"
command = ~D, DB, B, DB, D, DF, F, x
time = 30

[Command]
name = "Gun"
command = ~D, DB, B, DB, D, DF, F, y
time = 30


[Command]
name = "Fire"
command = ~D, DF, F, D, DF, F, a
time = 20

[Command]
name = "Fire"   ;Same name as above
command = ~D, DF, F, D, DF, F, b
time = 20

[Command]
name = "Ambush"   ;Same name as above
command = ~D, DF, F, D, DF, F, z
time = 30

[Command]
name = "Napalm"
command = ~D, F, B, a
time = 14

[Command]
name = "Napalm"
command = ~D, F, B, b
time = 14

[Command]
name = "Crap"
command = ~F,DF,D,DB,B,F,DF,D,DB,B,z
time = 60

[Command]
name = "Crap"
command = ~F,D,B,F,D,B,z
time = 60

[Command]
name = "ShunGoku"
command = ~F,DF,D,DB,B,F,DF,D,DB,B,x
time = 25
[Command]
name = "ShunGoku"
command = ~F,D,B,F,D,B,x
time = 25
[Command]
name = "ShunGoku"
command = ~F,DF,D,DB,B,F,DF,D,DB,B,y
time = 25
[Command]
name = "ShunGoku"
command = ~F,D,B,F,D,B,y
time = 25
[Command]
name = "ShunGoku"
command = ~x,x,F,a,y
time = 30

;-| Special Motions |------------------------------------------------------
[Command]
name = "upper_x"
command = ~F, D, DF, x

[Command]
name = "upper_y"
command = ~F, D, DF, y

[Command]
name = "upper_xy"
command = ~F, D, DF, x+y

[Command]
name = "rocketpunch"
command = ~B, D, F, x

[Command]
name = "rocketpunch"
command = ~B, D, F, y

[Command]
name = "rocketpunch"
command = ~B, DB, D, DF, F, x

[Command]
name = "rocketpunch"
command = ~B, DB, D, DF, F, y

[Command]
name = "excusion"
command = ~F, D, B, a

[Command]
name = "excusion"
command = ~F, D, B, b

[Command]
name = "excusion"
command = ~F, DF, D, DB, B, a

[Command]
name = "excusion"
command = ~F, DF, D, DB, B, b

[Command]
name = "revers_x"
command = ~B, D, DB, x

[Command]
name = "revers_y"
command = ~B, D, DB, y

[Command]
name = "revers_xy"
command = ~B, D, DB, x+y

[Command]
name = "QCF_x"
command = ~D, DF, F, x

[Command]
name = "QCF_y"
command = ~D, DF, F, y

[Command]
name = "QCF_xy"
command = ~D, DF, F, x+y

[Command]
name = "QCF_a"
command = ~D, DF, F, a

[Command]
name = "QCF_b"
command = ~D, DF, F, b

[Command]
name = "QCF_ab"
command = ~D, DF, F, a+b

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

[Command]
name = "DD_a"
command = D, D, a
time = 20

[Command]
name = "DD_b"
command = D, D, b
time = 20

[Command]
name = "DD_ab"
command = D, D, a+b
time = 20

[Command]
name = "SupahJump"
;command = ~$D, $U
command = ~$D, $U
time = 5
buffer.time = 2

[Command]
name = "GunFirah"
command = ~F, B, F, x

[Command]
name = "GunFirah"
command = ~F, B, F, y

[Command]
name = "GunFirah"
command = ~x, x, x

[Command]
name = "GunFirah"
command = ~y, y, y

[Command]
name = "anybutton"
command = a
time = 1

[Command]
name = "anybutton"
command = b
time = 1

[Command]
name = "anybutton"
command = c
time = 1

[Command]
name = "anybutton"
command = x
time = 1

[Command]
name = "anybutton"
command = y
time = 1

[Command]
name = "anybutton"
command = z
time = 1

[Command]
name = "anydir"
command = F
time = 1
[Command]
name = "anydir"
command = DF
time = 1
[Command]
name = "anydir"
command = D
time = 1
[Command]
name = "anydir"
command = DB
time = 1
[Command]
name = "anydir"
command = B
time = 1
[Command]
name = "anydir"
command = UB
time = 1
[Command]
name = "anydir"
command = U
time = 1
[Command]
name = "anydir"
command = UF
time = 1


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
name = "instakill";Required (do not remove)
command = c+z
time = 1

[Command]
name = "ceedee"
command = z
time = 1
[Command]
name = "ceedee"
command = y+b
time = 1

[Command]
name = "loll"
command = c
time = 1
[Command]
name = "loll"
command = x+a
time = 1

;-| Dir + Button |---------------------------------------------------------
[Command]
name = "down_a"
command = /$D,a
time = 1

[Command]
name = "down_b"
command = /$D,b
time = 1

;---------------------------------------------------------------------------
; 2. State entry
; --------------
; This is where you define what commands bring you to what states.
;
; Each state entry block looks like:
;   [State -1, Label]           ;Change Label to any name you want to use to
;                               ;identify the state with.
;   type = ChangeState          ;Don't change this
;   value = new_state_number
;   trigger1 = command = command_name
;   . . .  (any additional triggers)
;
; - new_state_number is the number of the state to change to
; - command_name is the name of the command (from the section above)
; - Useful triggers to know:
;   - statetype
;       S, C or A : current state-type of player (stand, crouch, air)
;   - ctrl
;       0 or 1 : 1 if player has control. Unless "interrupting" another
;                move, you'll want ctrl = 1
;   - stateno
;       number of state player is in - useful for "move interrupts"
;   - movecontact
;       0 or 1 : 1 if player's last attack touched the opponent
;                useful for "move interrupts"
;
; Note: The order of state entry is important.
;   State entry with a certain command must come before another state
;   entry with a command that is the subset of the first.
;   For example, command "fwd_a" must be listed before "a", and
;   "fwd_ab" should come before both of the others.
;
; For reference on triggers, see CNS documentation.
;
; Just for your information (skip if you're not interested):
; This part is an extension of the CNS. "State -1" is a special state
; that is executed once every game-tick, regardless of what other state
; you are in.


; Don't remove the following line. It's required by the CMD standard.
[Statedef -1]

; The main purpose of having these next two controllers here at the top of
; StateDef -1 is to make sure the AI helper never changes to a different state,
; but they also improve efficiency by preventing Mugen from wasting time
; processing the entire State -1 for the helper.
[State -1, AI Helper Check]
type = ChangeState
trigger1 = IsHelper(9741)
value = 9741

[State -1, AI Helper Check 2]
type = ChangeState
trigger1 = IsHelper(9742)
value = 9742

[State 0, ]
type = ChangeState
trigger1 = statetype != A
trigger1 = ctrl = 1
trigger1 = var(20) >= 500
value = 5300

[State 0, ]
type = ChangeState
triggerall = numhelper(3250)
triggerall = !numhelper(4550)
trigger1 = statetype != A
trigger1 = (ctrl) || (stateno = 0 && roundstate = 3)
trigger1 = helper(3250),movehit >= 100
value = 3252

;===========================================================================
;This is not a move, but it sets up var(1) to be 1 if conditions are right
;for a combo into a special move (used below).
;Since a lot of special moves rely on the same conditions, this reduces
;redundant logic.
[State -1, Combo condition Reset]
type = VarSet
trigger1 = 1
var(1) = 0

[State -1, Combo condition Check]
type = VarSet
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,299]) || (stateno = [400,499])
trigger2 = stateno != 420
trigger2 = stateno != 440 ;Except for sweep kick
trigger2 = movecontact
var(1) = 1

; I BLAM EVERYTHING
[State -1, AI assault]
type = ChangeState
triggerall = power >= 3000
triggerall = p2stateno != [5100,5200]
triggerall = p2bodydist x <= 22
triggerall = p2bodydist y <= -22
triggerall = var(55)
triggerall = statetype != A
triggerall = random < 200
triggerall = !numhelper(3250)
triggerall = life <= 50 && p2life <= 150
trigger1 = ctrl
value = 3250

; Shun goku satsu
[State -1, AI assault]
type = ChangeState
triggerall = power >= 3000
triggerall = p2stateno != [5100,5200]
triggerall = p2bodydist x <= 22
triggerall = p2bodydist y <= -22
triggerall = var(55)
triggerall = statetype != A
triggerall = (p2movetype != A || EnemyNear, Facing = Facing) || (numhelper(3200))
triggerall = random < 900
triggerall = (life + 666 <= p2life) || (p2life <= 666)
trigger1 = ctrl
trigger2 = stateno = [200,499]
trigger2 = movecontact
trigger2 = stateno != 440
value = 3900

; Counter
[State -1, AI]
type = ChangeState
triggerall = p2stateno = [5100,5200]
triggerall = var(55)
triggerall = p2bodydist x >= 80
triggerall = statetype != A
triggerall = prevstateno != 195
trigger1 = random < 300
trigger1 = ctrl
value = 195

; Counter
[State -1, AI]
type = ChangeState
triggerall = p2stateno != [5100,5200]
triggerall = var(55)
triggerall = statetype != A
triggerall = p2movetype = A && EnemyNear, Facing = Facing && enemynear, numproj = 0
triggerall = (p2bodydist y <= -14 && p2bodydist x <= 50) || (p2bodydist x <= 30 && stateno = 220)
trigger1 = random < 300
trigger1 = ctrl
value = 1350

[State -1, AI]
type = ChangeState
triggerall = numhelper(3115) = 0
triggerall = var(55)
triggerall = statetype != A
triggerall = p2movetype = A && enemynear, numproj = 0
triggerall = p2bodydist x <= 80
triggerall = backedgedist > 80
triggerall = random != [250,400]
trigger1 = ctrl
value = ifelse(random<500,255,105)

; FUCKTHISSHIT
[State -1, AIFUCKTHISSHIT]
type = ChangeState
triggerall = var(55)
triggerall = inguarddist
triggerall = p2movetype = A
triggerall = var(50) >= 40
triggerall = statetype != A
trigger1 = random < 700
trigger1 = ctrl
value = ifelse(p2bodydist x<=47,430, ifelse(p2bodydist x<=73,440, ifelse(p2bodydist x<=93&&random<200,1310, 1400 ) ) )

; HAHA
[State -1, HAHA]
type = ChangeState
triggerall = var(55)
triggerall = (p2movetype != A || EnemyNear, Facing = Facing || !InGuardDist) || (random<440)
triggerall = (p2bodydist x <= 68) || (p2bodydist x <= 100 && random < 100)
triggerall = p2bodydist y <= -28
triggerall = p2stateno != [5100,5130]
triggerall = statetype != A
trigger1 = prevstateno = 250 || prevstateno = 255
trigger1 = ctrl
value = ifelse(p2bodydist x<=47,430, ifelse(p2bodydist x<=73,440, ifelse(p2bodydist x<=84&&random<200,1300, 1400 ) ) )

; First Punch
[State -1, Single Attack]
type = ChangeState
triggerall = var(55)
triggerall = statetype != A
;triggerall = (p2movetype != A || EnemyNear, Facing = Facing)
triggerall = p2stateno != [5100,5130]
triggerall = p2bodydist x <= 55
triggerall = random < 500
trigger1 = ctrl
value = ifelse( random < 500&&prevstateno!=250 ,250 ,  ifelse( (random<500||p2bodydist y<=-55)&&p2bodydist x<=33, ifelse(random<500,1100,1210) , (ifelse(random<500&&p2bodydist y>=-33,230,200) + ifelse(random<100&&p2bodydist y>=-29,200,0)) ) )

[State -3: ChangeState]
type = ChangeState
triggerall = !numhelper(3200)
triggerall = stateno != 40
triggerall = (var(55)) && (StateType != A) && (Ctrl) && (EnemyNear, Facing != Facing) && (var(50)<40)
trigger1 = (P2StateType != C) && (P2MoveType = A) && ((inguarddist) || (EnemyNear, NumProj > 0))
value = 130

[State -3: ChangeState]
type = ChangeState
triggerall = !numhelper(3200)
triggerall = stateno != 40
triggerall = (var(55)) && (StateType != A) && (Ctrl) && (EnemyNear, Facing != Facing) && (var(50)<40)
trigger1 = (P2StateType = C) && (P2MoveType = A) && ((inguarddist) || (EnemyNear, NumProj > 0))
value = ifelse(random<16,40,131)

; Assault Supper
[State -1, AI assault]
type = ChangeState
triggerall = p2stateno != [5100,5200]
triggerall = var(55)
triggerall = statetype != A
triggerall = (p2movetype != A || EnemyNear, Facing = Facing || !InGuardDist)
triggerall = p2bodydist x <= 10
triggerall = var(30) = 1
triggerall = var(31) = 0
trigger1 = ctrl
value = 4000

; Assault Supper
;[State -1, AI assault]
;type = ChangeState
;triggerall = power >= 1000
;triggerall = p2stateno != [5100,5200]
;triggerall = var(55)
;triggerall = statetype != A
;triggerall = (p2movetype != A || EnemyNear, Facing = Facing || !InGuardDist) || (numhelper(3200))
;triggerall = (p2bodydist y = [-10,10]) &&  (p2bodydist x <= 80)
;triggerall = random < 300
;triggerall = (life + 210 <= p2life) || (p2life <= 210) || (random < 15)
;trigger1 = ctrl
;trigger1 = p2stateno = [120,169]
;trigger2 = stateno = 3050
;trigger2 = movehit
;trigger3 = var(1)
;trigger3 = moveguarded
;value = 3050

; First Punch
;[State -1, AI]
;type = ChangeState
;triggerall = var(55)
;triggerall = statetype != A
;triggerall = p2statetype = S
;triggerall = p2movetype != A
;triggerall = p2bodydist x <= 40
;triggerall = random < 300
;trigger1 = ctrl
;value = ifelse(random<500,1000,1010)

[State -1, THROW]
type = ChangeState
triggerall = var(55)
triggerall = statetype != A
triggerall = p2bodydist x <= 3
triggerall = p2movetype != H
triggerall = p2statetype != A
triggerall = p2stateno != [5100,5130]
trigger1 = ctrl
value = ifelse(random<140,ifelse(random<500,255,250), ifelse(power>=1000&&random<330 , 3050 , ifelse(random<200,1450,800) )  )

[State -1, WHA]
type = ChangeState
triggerall = var(55)
triggerall = statetype != A
triggerall = p2bodydist x <= 3
triggerall = p2movetype != H
triggerall = p2statetype != A
triggerall = p2stateno != [5100,5130]
trigger1 = stateno = 800
trigger1 = animtime = 0
value = ifelse(random<500,ifelse(random<500,255,250),ifelse(random<200,1100,200))

[State -1, Situational Attack]
type = ChangeState
triggerall = var(55)
triggerall = statetype != A
triggerall = (p2movetype != A || EnemyNear, Facing = Facing || !InGuardDist) || (numhelper(3200))
triggerall = p2statetype = C
triggerall = p2stateno != [5100,5130]
triggerall = p2bodydist x <= 77
triggerall = p2bodydist y <= -58
triggerall = random < 90
trigger1 = ctrl
value = ifelse(random<50,40,205)

[State -1, Situational Attack]
type = ChangeState
triggerall = var(55)
triggerall = statetype != A
triggerall = (p2movetype != A || EnemyNear, Facing = Facing || !InGuardDist) || (numhelper(3200))
triggerall = p2stateno != [5100,5130]
triggerall = p2bodydist x <= 77
triggerall = p2bodydist y <= -58
triggerall = random < 300
triggerall = stateno != 20
trigger1 = ctrl
value = ifelse(random<350,250,ifelse(p2bodydist x <= 36,1110,1060))


[State -1, Single Attack]
type = ChangeState
triggerall = var(55)
triggerall = statetype != A
triggerall = (p2movetype != A || EnemyNear, Facing = Facing || !InGuardDist) || (numhelper(3200))
triggerall = p2stateno != [5100,5130]
triggerall = p2bodydist x <= 70
triggerall = p2bodydist y >= -55
triggerall = random < 200
trigger1 = ctrl
value = ifelse(random<200, ifelse(random<500&&p2bodydist y>=-12,ifelse(random<500&&power>=330,1320,1300),1210) , ifelse(random<500&&p2bodydist y>=-33,240,210) + ifelse(random<200&&p2bodydist y>=-29,200,0) )

[State -1, Single Attack]
type = ChangeState
triggerall = var(55)
triggerall = statetype != A
triggerall = (p2movetype != A || EnemyNear, Facing = Facing || !InGuardDist) || (numhelper(3200))
triggerall = p2stateno != [5100,5130]
triggerall = p2bodydist x <= 82
triggerall = p2bodydist y >= -75
triggerall = random < 150
trigger1 = ctrl
value = ifelse(random<100, ifelse(random<500,1350,1250), (ifelse(random<250, ifelse(random<120,220,1010), ifelse(random<500,235,205) )) )

[State -1, Single Attack]
type = ChangeState
triggerall = var(55)
triggerall = statetype != A
triggerall = (p2movetype != A || EnemyNear, Facing = Facing || !InGuardDist) || (numhelper(3200))
triggerall = p2stateno != [5100,5130]
triggerall = p2bodydist x <= 130
triggerall = p2bodydist y >=-75
triggerall = random < 150
trigger1 = ctrl
value = ifelse(random<250&&p2bodydist x<=123, (ifelse(random<330&&power>=300,ifelse(random<500&&p2bodydist y>=-13,1320,1020),1010)), ifelse(random<500,1450,ifelse(p2movetype=H,1250,1400)) )

[State -1, TATATATA]
type = ChangeState
triggerall = var(55)
triggerall = statetype != A
triggerall = (p2movetype != A || EnemyNear, Facing = Facing || !InGuardDist) || (numhelper(3200))
triggerall = p2stateno != [5100,5130]
triggerall = p2stateno != [120,169]
triggerall = p2bodydist x >= 130
;triggerall = var(22) > 0
triggerall = random < 140
triggerall = stateno != 20
trigger1 = ctrl
value = ifelse(random < 100 , 1350 , ifelse(random<500,250,ifelse(random<870&&var(22) > 0,1250,1450)) )

; Combo 1
[State -1, AI Combo]
type = ChangeState
triggerall = var(55)
trigger1 = stateno = 200
trigger1 = movecontact
value = ifelse( random< 500 , 1350 , ifelse(random<500,200,230) + ifelse(random<500&&p2bodydist x<=58,0,10) )

[State -1, AI Combo]
type = ChangeState
triggerall = var(55)
trigger1 = stateno = 230
trigger1 = movecontact
value = ifelse( random<500&&p2bodydist x<=70, ifelse(random<500&&p2bodydist x<=64,240,210) , 235 )

[State -1, AI Combo]
type = ChangeState
triggerall = var(55)
trigger1 = stateno = 210
trigger1 = movecontact
value = ifelse(random<100, 1310, ifelse(random<500,1010,235) )

[State -1, AI Combo]
type = ChangeState
triggerall = var(55)
trigger1 = stateno = 240
trigger1 = movecontact
value = ifelse(random<500&&p2bodydist x<=50,1060,205)

[State -1, AI Combo]
type = ChangeState
triggerall = var(55)
trigger1 = stateno = 205
trigger1 = movecontact
value = ifelse( random<500&&p2bodydist x<= 123,ifelse(random<500&&p2bodydist x<=55,1050,1010) , 1250 )

[State -1, AI Combo]
type = ChangeState
triggerall = var(55)
trigger1 = stateno = 235
trigger1 = movecontact
trigger1 = hitcount >= 4
value = ifelse(random<500&&p2bodydist x<=70,1060,ifelse(random<500,1250,1010))

; Air Combos
[State -1, AI]
type = ChangeState
triggerall = var(55)
triggerall = statetype = A
triggerall = p2movetype != A
triggerall = p2bodydist x <= 48
triggerall = p2bodydist y = [-40,60]
triggerall = random < 500
trigger1 = ctrl
value = ifelse(random<500&&p2bodydist x <= 22,630,600)

[State -1, AI]
type = ChangeState
triggerall = var(55)
triggerall = statetype = A
triggerall = p2bodydist x <= 61
triggerall = p2bodydist y = [-30,80]
triggerall = random < 500
trigger1 = ctrl
trigger2 = stateno = 600 || stateno = 630
trigger2 = movecontact
trigger2 = random < 100
value = ifelse(random<500,610,640)

[State -1, AI]
type = ChangeState
triggerall = var(55)
triggerall = statetype = A
triggerall = p2bodydist x <= 158
triggerall = p2bodydist y >= -30
triggerall = vel y > 0
triggerall = random < 100
trigger1 = ctrl
trigger2 = stateno = 610 || stateno = 640
trigger2 = movecontact
trigger2 = random < 100
value = ifelse(p2bodydist x<=88||random<200,1500,1550) + ifelse(random<450,10,0) + ifelse(random<150&&power>=330,10,0)

; Shun goku satsu
[State -1, AI assault]
type = ChangeState
triggerall = power >= 2000
triggerall = p2stateno != [5100,5200]
triggerall = var(55)
triggerall = statetype != A
triggerall = (p2movetype != A || EnemyNear, Facing = Facing) || (numhelper(3200))
triggerall = random < 700
triggerall = p2bodydist x <= 100
triggerall = (life + 200 <= p2life) || (p2life <= 200)
trigger1 = ctrl
trigger2 = stateno = [200,499]
trigger2 = movecontact
trigger2 = stateno != 440
trigger3 = stateno = 3000
trigger3 = movecontact
trigger4 = stateno = 3050
trigger4 = movecontact
value = 3200

; Assault Supper
[State -1, AI assault]
type = ChangeState
triggerall = power >= 1000
triggerall = p2stateno != [5100,5200]
triggerall = var(55)
triggerall = statetype != A
triggerall = (p2movetype != A || EnemyNear, Facing = Facing) || (numhelper(3200))
triggerall = p2bodydist x >= 80
triggerall = random < 300
triggerall = var(22) = 0
triggerall = (life + 210 <= p2life) || (p2life <= 210)
triggerall = stateno != 20
trigger1 = ctrl
value = 3100

; Assault Supper
[State -1, AI assault]
type = ChangeState
triggerall = power >= 1000
triggerall = p2stateno != [5100,5200]
triggerall = var(55)
triggerall = statetype != A
triggerall = (p2movetype != A || EnemyNear, Facing = Facing) || (numhelper(3200))
triggerall = p2bodydist x <= 30
triggerall = random < 300
triggerall = (life + 250 <= p2life) || (p2life <= 250)
triggerall = stateno != 20
trigger1 = ctrl
value = 3050

; Assault Supper
[State -1, AI assault]
type = ChangeState
triggerall = power >= 1000
triggerall = p2stateno != [5100,5200]
triggerall = var(55)
triggerall = statetype != A
triggerall = (p2movetype != A || EnemyNear, Facing = Facing)
triggerall = (p2bodydist y = [-10,10]) &&  (p2bodydist x <= 170) || (numhelper(3200))
triggerall = random < 300
triggerall = p2stateno != [120,169]
triggerall = (life + 230 <= p2life) || (p2life <= 230)
triggerall = stateno != 20
trigger1 = ctrl
value = ifelse(random<100,3100,3000)

; Shoryuken
[State -1, AI]
type = ChangeState
triggerall = p2stateno != [5100,5200]
triggerall = var(55)
triggerall = statetype != A
triggerall = (p2movetype != A || EnemyNear, Facing = Facing)
triggerall = (p2bodydist y = [-5,5]) && (p2bodydist x <= 80) || (numhelper(3200))
triggerall = stateno != 20
trigger1 = random < 200
trigger1 = ctrl
trigger2 = random < 100
trigger2 = stateno = [200,299]
trigger2 = stateno != 420
trigger2 = stateno != 440
trigger2 = movecontact
value = ifelse(Random<500,1050,1060) + ifelse(Random<500&&power>=330,0,10)

; Some Mobility
[State -1, AI]
type = ChangeState
triggerall = var(55)
triggerall = statetype != A
triggerall = movetype != A
triggerall = (p2movetype != A || EnemyNear, Facing = Facing)
triggerall = command = "holdfwd"
triggerall = p2bodydist x >= 48
triggerall = random = [100,400]
triggerall = stateno != 20
trigger1 = ctrl
value = 100

; Some Mobility
[State -1, AI]
type = ChangeState
triggerall = var(55)
triggerall = statetype != A
triggerall = movetype != A
triggerall = numhelper(3115) = 1
triggerall = command = "holdfwd"
triggerall = p2bodydist x >= 60
triggerall = stateno != 20
trigger1 = ctrl
value = 100

[State -1, AI]
type = ChangeState
triggerall = var(55)
triggerall = p2movetype = A
triggerall = random = [150,250]
triggerall = stateno != 20
trigger1 = stateno = 106
trigger1 = animtime = 0
value = 40


; NON-AI

;===========================================================================
;---------------------------------------------------------------------------
;Smash Kung Fu Upper (uses one super bar)
;スマッシュ・カンフー・ウッパー（ゲージレベル１）
[State -1, Smash Kung Fu Upper]
type = ChangeState
value = 4000
triggerall = command = "Ambush"
triggerall = statetype != A
triggerall = var(30) = 1
triggerall = var(31) = 0
trigger1 = ctrl

;===========================================================================
;---------------------------------------------------------------------------
;Smash Kung Fu Upper (uses one super bar)
;スマッシュ・カンフー・ウッパー（ゲージレベル１）
[State -1, Shun Goku Satsu]
type = ChangeState
value = 3900
triggerall = command = "ShunGoku"
triggerall = power >= 3000
triggerall = statetype != A
trigger1 = ctrl
trigger2 = hitdefattr = SC, NA, SA, HA
trigger2 = stateno != [3700,6999)
trigger2 = movecontact
trigger3 = stateno = [200,499]

;===========================================================================
;---------------------------------------------------------------------------
;Smash Kung Fu Upper (uses one super bar)
;スマッシュ・カンフー・ウッパー（ゲージレベル１）
[State -1, Smash Kung Fu Upper]
type = ChangeState
value = 3250
triggerall = command = "Crap"
triggerall = power >= 3000
triggerall = life <= 500
triggerall = statetype != A
trigger1 = ctrl
trigger2 = hitdefattr = SC, NA, SA, HA
trigger2 = stateno != [3700,6999)
trigger2 = movecontact

;===========================================================================
;---------------------------------------------------------------------------
;Smash Kung Fu Upper (uses one super bar)
;スマッシュ・カンフー・ウッパー（ゲージレベル１）
[State -1, Smash Kung Fu Upper]
type = ChangeState
value = 3200
triggerall = numhelper(3200) = 0
triggerall = command = "Napalm"
triggerall = power >= 2000
triggerall = statetype != A
trigger1 = ctrl
trigger2 = hitdefattr = SC, NA, SA, HA
trigger2 = stateno != [3700,6999)
trigger2 = movecontact

;===========================================================================
;---------------------------------------------------------------------------
;Smash Kung Fu Upper (uses one super bar)
;スマッシュ・カンフー・ウッパー（ゲージレベル１）
[State -1, Smash Kung Fu Upper]
type = ChangeState
;value = ifelse(command="y"&&power>=2000,3060,3050)
value = 3050
triggerall = command = "SmashKFUpper"
triggerall = power >= 1000
triggerall = statetype != A
triggerall = !var(55)
trigger1 = ctrl
trigger2 = hitdefattr = SC, NA, SA, HA
trigger2 = stateno != [3050,6999]
trigger2 = movecontact
trigger3 = stateno = 1021

;---------------------------------------------------------------------------
;Triple Kung Fu Palm (uses one super bar)
;三烈カンフー突き手（ゲージレベル１）
[State -1, Triple Kung Fu Palm]
type = ChangeState
;value = ifelse(command="y"&&power>=2000,3010,3000)
value = 3000
triggerall = command = "TripleKFPalm"
triggerall = power >= 1000
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = statetype != A
trigger2 = hitdefattr = SC, NA, SA, HA
trigger2 = (stateno != [3000,6999])
trigger2 = movecontact
trigger3 = stateno = 1021
trigger4 = stateno = 3051
trigger4 = animelemtime(7) >= 0


;===========================================================================
;---------------------------------------------------------------------------
;Smash Kung Fu Upper (uses one super bar)
;スマッシュ・カンフー・ウッパー（ゲージレベル１）
[State -1, Smash Kung Fu Upper]
type = ChangeState
value = 3100
triggerall = command = "Gun"
triggerall = power >= 1000
triggerall = statetype != A
trigger1 = ctrl
trigger2 = hitdefattr = SC, NA, SA, HA
trigger2 = stateno != [3050,6999)
trigger2 = movecontact
trigger3 = stateno = 3051
trigger3 = animelemtime(7) >= 0


;---------------------------------------------------------------------------
;Light Kung Fu Blow
[State -1, Light Kung Fu Blow]
type = ChangeState
value = 1450
triggerall = command = "excusion"
trigger1 = var(1) ;Use combo condition (above)

;---------------------------------------------------------------------------
;Fast Rocket-Punch (1/3 super bar)
;速いカンフー蹴り（ゲージレベル１／３）
;[State -1, Fast Kung Fu Knee]
;type = ChangeState
;value = 1420
;triggerall = command = "rocketpunch_xy"
;triggerall = power >= 330
;trigger1 = var(1) ;Use combo condition (above)
;trigger2 = stateno = [1200,1220]
;trigger2 = movecontact

;---------------------------------------------------------------------------
;Light Rocket-Punch
;カンフー蹴り（弱）
[State -1, Light Kung Fu Knee]
type = ChangeState
value = 1400
triggerall = enemynear, anim != 5300
triggerall = command = "rocketpunch"
trigger1 = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------
;Fast Kung Fu Knee (1/3 super bar)
;速いカンフー蹴り（ゲージレベル１／３）
[State -1, Fast Kung Fu Knee]
type = ChangeState
value = 1320
triggerall = command = "DD_ab"
triggerall = power >= 330
trigger1 = var(1) ;Use combo condition (above)
trigger2 = stateno = [1200,1220]
trigger2 = movecontact
trigger2 = var(21) >= 1000
trigger3 = stateno = [1000,1020]
trigger3 = movecontact
trigger3 = var(21) >= 1000

;---------------------------------------------------------------------------
;Light Kung Fu Knee
;カンフー蹴り（弱）
[State -1, Light Kung Fu Knee]
type = ChangeState
value = 1300
triggerall = command = "DD_a"
trigger1 = var(1) ;Use combo condition (above)
trigger2 = stateno = [1200,1220]
trigger2 = movecontact
trigger2 = var(21) >= 1000
trigger3 = stateno = [1000,1020]
trigger3 = movecontact
trigger3 = var(21) >= 1000

;---------------------------------------------------------------------------
;Strong Kung Fu Knee
;カンフー蹴り（弱）
[State -1, Strong Kung Fu Knee]
type = ChangeState
value = 1310
triggerall = command = "DD_b"
trigger1 = var(1) ;Use combo condition (above)
trigger2 = stateno = [1200,1220]
trigger2 = movecontact
trigger2 = var(21) >= 1000
trigger3 = stateno = [1000,1020]
trigger3 = movecontact
trigger3 = var(21) >= 1000

;---------------------------------------------------------------------------
;Fast Kung Fu Knee (1/3 super bar)
;速いカンフー蹴り（ゲージレベル１／３）
[State -1, Fast Kung Fu Knee]
type = ChangeState
value = 1070
triggerall = command = "FF_ab"
triggerall = power >= 330
trigger1 = var(1) ;Use combo condition (above)
trigger2 = stateno = [1200,1220]
trigger2 = movecontact
trigger2 = var(21) >= 1000
trigger3 = stateno = [1000,1010]
trigger3 = movecontact
trigger3 = var(21) >= 1000

;---------------------------------------------------------------------------
;Light Kung Fu Knee
;カンフー蹴り（弱）
[State -1, Light Kung Fu Knee]
type = ChangeState
value = 1050
triggerall = command = "FF_a"
trigger1 = var(1) ;Use combo condition (above)
trigger2 = stateno = [1200,1220]
trigger2 = movecontact
trigger2 = var(21) >= 1000
trigger3 = stateno = [1000,1010]
trigger3 = movecontact
trigger3 = var(21) >= 1000

;---------------------------------------------------------------------------
;Strong Kung Fu Knee
;カンフー蹴り（弱）
[State -1, Strong Kung Fu Knee]
type = ChangeState
value = 1060
triggerall = command = "FF_b"
trigger1 = var(1) ;Use combo condition (above)
trigger2 = stateno = [1200,1220]
trigger2 = movecontact
trigger2 = var(21) >= 1000
trigger3 = stateno = [1000,1010]
trigger3 = movecontact
trigger3 = var(21) >= 1000

;---------------------------------------------------------------------------
;Fast Kung Fu Upper (1/3 super bar)
;速いカンフー・ウッパー
[State -1, Fast Kung Fu Upper]
type = ChangeState
value = 1120
triggerall = command = "upper_xy"
triggerall = power >= 330
trigger1 = var(1) ;Use combo condition (above)
trigger2 = stateno = [1000,1020]
trigger2 = movecontact
trigger2 = var(21) >= 1000

;---------------------------------------------------------------------------
;Light Kung Fu Upper
;カンフー・ウッパー（弱）
[State -1, Light Kung Fu Upper]
type = ChangeState
value = 1100
triggerall = command = "upper_x"
trigger1 = var(1) ;Use combo condition (above)
trigger2 = stateno = [1000,1020]
trigger2 = movecontact
trigger2 = var(21) >= 1000

;---------------------------------------------------------------------------
;Strong Kung Fu Upper
;カンフー・ウッパー（強）
[State -1, Strong Kung Fu Upper]
type = ChangeState
value = 1110
triggerall = command = "upper_y"
trigger1 = var(1) ;Use combo condition (above)
trigger2 = stateno = [1000,1020]
trigger2 = movecontact
trigger2 = var(21) >= 1000

;---------------------------------------------------------------------------
;Fast Kung Fu Palm (1/3 super bar)
;速いカンフー突き手（ゲージレベル１／３）
[State -1, Fast Kung Fu Palm]
type = ChangeState
value = 1020
triggerall = command = "QCF_xy"
triggerall = power >= 330
trigger1 = var(1) ;Use combo condition (above)
trigger2 = stateno = [1300,1320]
trigger2 = movecontact
trigger2 = var(21) >= 1000
trigger3 = stateno = [1200,1220]
trigger3 = movecontact
trigger3 = var(21) >= 1000

;---------------------------------------------------------------------------
;Light Kung Fu Palm
;カンフー突き手（弱）
[State -1, Light Kung Fu Palm]
type = ChangeState
value = 1000
triggerall = command = "QCF_x"
trigger1 = var(1) ;Use combo condition (above)
trigger2 = stateno = [1300,1320]
trigger2 = movecontact
trigger2 = var(21) >= 1000
trigger3 = stateno = [1200,1220]
trigger3 = movecontact
trigger3 = var(21) >= 1000

;---------------------------------------------------------------------------
;Strong Kung Fu Palm
;カンフー突き手（強）
[State -1, Strong Kung Fu Palm]
type = ChangeState
value = 1010
triggerall = command = "QCF_y"
trigger1 = var(1) ;Use combo condition (above)
trigger2 = stateno = [1300,1320]
trigger2 = movecontact
trigger2 = var(21) >= 1000
trigger3 = stateno = [1200,1220]
trigger3 = movecontact
trigger3 = var(21) >= 1000

;---------------------------------------------------------------------------
;Light Kung Fu Blow
[State -1, Light Kung Fu Blow]
type = ChangeState
value = 1350
triggerall = command = "revers_x" ||  command = "revers_y" ||  command = "revers_xy"
trigger1 = var(1) ;Use combo condition (above)

;---------------------------------------------------------------------------
;Fast Kung Fu Blow (1/3 super bar)
[State -1, Fast Kung Fu Blow]
type = ChangeState
value = 1220
triggerall = command = "QCB_xy"
triggerall = power >= 330
trigger1 = var(1) ;Use combo condition (above)
trigger2 = stateno = [1000,1020]
trigger2 = movecontact
trigger2 = var(21) >= 1000

;---------------------------------------------------------------------------
;Light Kung Fu Blow
[State -1, Light Kung Fu Blow]
type = ChangeState
value = 1200
triggerall = command = "QCB_x"
trigger1 = var(1) ;Use combo condition (above)
trigger2 = stateno = [1000,1020]
trigger2 = movecontact
trigger2 = var(21) >= 1000

;---------------------------------------------------------------------------
;Strong Kung Fu Blow
[State -1, Strong Kung Fu Blow]
type = ChangeState
value = 1210
triggerall = command = "QCB_y"
trigger1 = var(1) ;Use combo condition (above)
trigger2 = stateno = [1000,1020]
trigger2 = movecontact
trigger2 = var(21) >= 1000

;---------------------------------------------------------------------------
;Fast Kung Fu Blow (1/3 super bar)
[State -1, Fast Kung Fu Blow]
type = ChangeState
value = 1250
triggerall = command = "GunFirah"
trigger1 = var(1) ;Use combo condition (above)

;---------------------------------------------------------------------------
; Light Low Aerial Cannonball
[State -1, Light Low Kung Fu Cannonball]
type = ChangeState
value = 1520
triggerall = command = "QCF_ab"
triggerall = power >= 330
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = [600,640]
trigger2 = movecontact

;---------------------------------------------------------------------------
; Light Low Aerial Cannonball
[State -1, Light Low Kung Fu Cannonball]
type = ChangeState
value = 1500
triggerall = command = "QCF_a"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = [600,640]
trigger2 = movecontact

;---------------------------------------------------------------------------
; Light Low Aerial Cannonball
[State -1, Light Low Kung Fu Cannonball]
type = ChangeState
value = 1510
triggerall = command = "QCF_b"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = [600,640]
trigger2 = movecontact

;---------------------------------------------------------------------------
; Light High Aerial Cannonball
[State -1, Light High Kung Fu Cannonball]
type = ChangeState
value = 1570
triggerall = command = "QCF_xy"
triggerall = power >= 330
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = [600,640]
trigger2 = movecontact

;---------------------------------------------------------------------------
; Light High Aerial Cannonball
[State -1, Light High Kung Fu Cannonball]
type = ChangeState
value = 1550
triggerall = command = "QCF_x"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = [600,640]
trigger2 = movecontact

;---------------------------------------------------------------------------
; Light High Aerial Cannonball
[State -1, Light High Kung Fu Cannonball]
type = ChangeState
value = 1560
triggerall = command = "QCF_y"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = [600,640]
trigger2 = movecontact


;===========================================================================
;---------------------------------------------------------------------------
;Run Fwd
;ダッシュ
[State -1, Run Fwd]
type = ChangeState
value = 19666
trigger1 = var(31) = 0
trigger1 = command = "instakill"
trigger1 = statetype = S
trigger1 = ctrl

;===========================================================================
;---------------------------------------------------------------------------
;Run Fwd
;ダッシュ
[State -1, Run Fwd]
type = ChangeState
value = 100
trigger1 = command = "FF"
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
;Run Back
;後退ダッシュ
[State -1, Run Back]
type = ChangeState
value = 105
trigger1 = command = "BB"
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
;Kung Fu Throw
;投げ
[State -1, Kung Fu Throw]
type = ChangeState
value = 800
triggerall = command = "y"
triggerall = statetype = S
triggerall = ctrl
triggerall = stateno != 100
trigger1 = command = "holdfwd"
trigger1 = p2bodydist X < 3
trigger1 = (p2statetype = S) || (p2statetype = C)
trigger1 = p2movetype != H
trigger2 = command = "holdback"
trigger2 = p2bodydist X < 5
trigger2 = (p2statetype = S) || (p2statetype = C)
trigger2 = p2movetype != H


;===========================================================================

;---------------------------------------------------------------------------
;Stand CD
[State -1, Stand Strong Punch]
type = ChangeState
value = 220
triggerall = command = "ceedee"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 229
trigger2 = screenpos x = [0,320]
trigger3 = stateno = 210
trigger3 = movecontact
trigger4 = stateno = [120,169]
trigger4 = power >= 500
trigger4 = statetype != A

;---------------------------------------------------------------------------
;Stand CD
[State -1, Stand Strong Punch]
type = ChangeState
value = 420
triggerall = command = "ceedee"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = stateno = 229
trigger2 = screenpos x = [0,320]
trigger3 = stateno = 210
trigger3 = movecontact


;---------------------------------------------------------------------------
; Back Evasion
[State -1, Stand Strong Punch]
type = ChangeState
value = 255
triggerall = command = "loll"
triggerall = command = "holdback"
triggerall = command != "holddown"
triggerall = !var(55) || random < 80
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 229
trigger2 = screenpos x = [0,320]
trigger3 = (stateno = [120,169]) || (stateno = [200,699])
trigger3 = stateno != 420 || stateno != 440
trigger3 = stateno != 255 || stateno != 250
trigger3 = power >= 500 || var(21) >= 1000
trigger3 = statetype != A

;---------------------------------------------------------------------------
;Evasion
[State -1, Stand Strong Punch]
type = ChangeState
value = 250
triggerall = command = "loll"
triggerall = command != "holddown"
triggerall = !var(55) || random < 80
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 229
trigger2 = screenpos x = [0,320]
trigger3 = (stateno = [120,169]) || (stateno = [200,699])
trigger3 = stateno != 420 || stateno != 440
trigger3 = stateno != 255 || stateno != 250
trigger3 = power >= 500 || var(21) >= 1000
trigger3 = statetype != A

;---------------------------------------------------------------------------
;Stand Light Kick
;立ち弱キック
[State -1, Stand Light Kick]
type = ChangeState
value = 205
triggerall = command = "x"
triggerall = command = "holdfwd"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact
trigger3 = (stateno = 230) && movecontact
trigger4 = (stateno = 210) && movecontact
trigger5 = (stateno = 240) && movecontact
trigger6 = (stateno = 400) && movecontact
trigger7 = (stateno = 410) && movecontact
trigger8 = (stateno = 430) && movecontact

;---------------------------------------------------------------------------
;Stand Light Punch
;立ち弱パンチ
[State -1, Stand Light Punch]
type = ChangeState
value = 200
triggerall = command = "x"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 200
trigger2 = movecontact

;---------------------------------------------------------------------------
;Stand Strong Punch
;立ち強パンチ
[State -1, Stand Strong Punch]
type = ChangeState
value = 210
triggerall = command = "y"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact
trigger3 = (stateno = 230) && movecontact

;---------------------------------------------------------------------------
;Stand Light Kick
;立ち弱キック
[State -1, Stand Light Kick]
type = ChangeState
value = 235
triggerall = command = "a"
triggerall = command = "holdfwd"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact
trigger3 = (stateno = 230) && movecontact
trigger4 = (stateno = 210) && movecontact
trigger5 = (stateno = 240) && movecontact
trigger6 = (stateno = 400) && movecontact
trigger7 = (stateno = 410) && movecontact
trigger8 = (stateno = 430) && movecontact

;---------------------------------------------------------------------------
;Stand Light Kick
;立ち弱キック
[State -1, Stand Light Kick]
type = ChangeState
value = 230
triggerall = command = "a"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact
trigger3 = (stateno = 230) && movecontact

;---------------------------------------------------------------------------
;Standing Strong Kick
;立ち強キック
[State -1, Standing Strong Kick]
type = ChangeState
value = 240
triggerall = command = "b"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact
trigger3 = (stateno = 230) && movecontact
trigger4 = (stateno = 21) && movecontact

;---------------------------------------------------------------------------
;Taunt
;挑発
[State -1, Taunt]
type = ChangeState
value = 195
triggerall = command = "start"
trigger1 = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------
;Crouching Light Punch
;しゃがみ弱パンチ
[State -1, Crouching Light Punch]
type = ChangeState
value = 400
triggerall = command = "x"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = stateno = 400
trigger2 = movecontact

;---------------------------------------------------------------------------
;Crouching Strong Punch
;しゃがみ強パンチ
[State -1, Crouching Strong Punch]
type = ChangeState
value = 410
triggerall = command = "y"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 430)
trigger2 = movecontact

;---------------------------------------------------------------------------
;Crouching Light Kick
;しゃがみ弱キック
[State -1, Crouching Light Kick]
type = ChangeState
value = 430
triggerall = command = "a"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 430)
trigger2 = movecontact

;---------------------------------------------------------------------------
;Crouching Strong Kick
;しゃがみ強キック
[State -1, Crouching Strong Kick]
type = ChangeState
value = 440
triggerall = command = "b"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 430)
trigger2 = movecontact

;---------------------------------------------------------------------------
;Jump Light Punch
;空中弱パンチ
[State -1, Jump Light Punch]
type = ChangeState
value = 600
triggerall = command = "x"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600
trigger2 = statetime >= 7

;---------------------------------------------------------------------------
;Jump Strong Punch
[State -1, Jump Strong Punch]
type = ChangeState
value = 610
triggerall = command = "y"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 || stateno = 630 ;jump_x or jump_a
trigger2 = movecontact

[State -1, Jump Light Kick]
type = ChangeState
value = 620
triggerall = command = "ceedee"
trigger1 = statetype = A
trigger1 = ctrl

;---------------------------------------------------------------------------
;Jump Light Kick
[State -1, Jump Light Kick]
type = ChangeState
value = 630
triggerall = command = "a"
trigger1 = statetype = A
trigger1 = ctrl

;---------------------------------------------------------------------------
;Jump Strong Kick
;空中強キック
[State -1, Jump Strong Kick]
type = ChangeState
value = 640
triggerall = command = "b"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 || stateno = 630 ;jump_x or jump_a
trigger2 = movecontact

