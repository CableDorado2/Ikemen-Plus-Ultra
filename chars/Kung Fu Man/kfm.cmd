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


;-| Button Remapping |-----------------------------------------------------
; This section lets you remap the player's buttons (to easily change the
; button configuration). The format is:
;   old_button = new_button
; If new_button is left blank, the button cannot be pressed.
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

;-| Special Motions |------------------------------------------------------
[Command]
name = "blocking"
command = $F,x
time = 3

[Command]
name = "blocking" ;Same name as above (buttons in opposite order)
command = x,$F
time = 3

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
name = "QCF_x"
command = ~D, DF, F, x

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
name = "QCF_a"
command = ~D, DF, F, a

[Command]
name = "QCF_b"
command = ~D, DF, F, b

[Command]
name = "QCF_ab"
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

;===========================================================================
;---------------------------------------------------------------------------
;Smash Kung Fu Upper (uses one super bar)
[State -1, Smash Kung Fu Upper]
type = ChangeState
value = 3050
triggerall = !ailevel
triggerall = command = "SmashKFUpper"
triggerall = power >= 1000
triggerall = statetype != A
trigger1 = ctrl
trigger2 = hitdefattr = SC, NA, SA, HA
trigger2 = stateno != [3050,3100)
trigger2 = movecontact
trigger3 = stateno = 1310 || stateno = 1330 ;From blocking

;---------------------------------------------------------------------------
;Triple Kung Fu Palm (uses one super bar)
[State -1, Triple Kung Fu Palm]
type = ChangeState
value = 3000
triggerall = !ailevel
triggerall = command = "TripleKFPalm"
triggerall = power >= 1000
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = statetype != A
trigger2 = hitdefattr = SC, NA, SA, HA
trigger2 = stateno != [3000,3050)
trigger2 = movecontact
trigger3 = stateno = 1310 || stateno = 1330 ;From blocking


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
trigger2 = stateno != 440 ;Except for sweep kick
trigger2 = movecontact
trigger3 = stateno = 1310 || stateno = 1330 ;From blocking
var(1) = 1

;---------------------------------------------------------------------------
;Fast Kung Fu Knee (1/3 super bar)
[State -1, Fast Kung Fu Knee]
type = ChangeState
value = 1070
triggerall = !ailevel
triggerall = command = "FF_ab"
triggerall = power >= 330
trigger1 = var(1) ;Use combo condition (above)

;---------------------------------------------------------------------------
;Light Kung Fu Knee
[State -1, Light Kung Fu Knee]
type = ChangeState
value = 1050
triggerall = !ailevel
triggerall = command = "FF_a"
trigger1 = var(1) ;Use combo condition (above)

;---------------------------------------------------------------------------
;Strong Kung Fu Knee
[State -1, Strong Kung Fu Knee]
type = ChangeState
value = 1060
triggerall = !ailevel
triggerall = command = "FF_b"
trigger1 = var(1) ;Use combo condition (above)

;---------------------------------------------------------------------------
;Fast Kung Fu Palm (1/3 super bar)
[State -1, Fast Kung Fu Palm]
type = ChangeState
value = 1020
triggerall = !ailevel
triggerall = command = "QCF_xy"
triggerall = power >= 330
trigger1 = var(1) ;Use combo condition (above)

;---------------------------------------------------------------------------
;Light Kung Fu Palm
[State -1, Light Kung Fu Palm]
type = ChangeState
value = 1000
triggerall = !ailevel
triggerall = command = "QCF_x"
trigger1 = var(1) ;Use combo condition (above)

;---------------------------------------------------------------------------
;Strong Kung Fu Palm
[State -1, Strong Kung Fu Palm]
type = ChangeState
value = 1010
triggerall = !ailevel
triggerall = command = "QCF_y"
trigger1 = var(1) ;Use combo condition (above)

;---------------------------------------------------------------------------
;Fast Kung Fu Upper (1/3 super bar)
[State -1, Fast Kung Fu Upper]
type = ChangeState
value = 1120
triggerall = !ailevel
triggerall = command = "upper_xy"
triggerall = power >= 330
trigger1 = var(1) ;Use combo condition (above)

;---------------------------------------------------------------------------
;Light Kung Fu Upper
[State -1, Light Kung Fu Upper]
type = ChangeState
value = 1100
triggerall = !ailevel
triggerall = command = "upper_x"
trigger1 = var(1) ;Use combo condition (above)

;---------------------------------------------------------------------------
;Strong Kung Fu Upper
[State -1, Strong Kung Fu Upper]
type = ChangeState
value = 1110
triggerall = !ailevel
triggerall = command = "upper_y"
trigger1 = var(1) ;Use combo condition (above)

;---------------------------------------------------------------------------
;Fast Kung Fu Blow (1/3 super bar)
[State -1, Fast Kung Fu Blow]
type = ChangeState
value = 1220
triggerall = !ailevel
triggerall = command = "QCB_xy"
triggerall = power >= 330
trigger1 = var(1) ;Use combo condition (above)

;---------------------------------------------------------------------------
;Light Kung Fu Blow
[State -1, Light Kung Fu Blow]
type = ChangeState
value = 1200
triggerall = !ailevel
triggerall = command = "QCB_x"
trigger1 = var(1) ;Use combo condition (above)

;---------------------------------------------------------------------------
;Strong Kung Fu Blow
[State -1, Strong Kung Fu Blow]
type = ChangeState
value = 1210
triggerall = !ailevel
triggerall = command = "QCB_y"
trigger1 = var(1) ;Use combo condition (above)

;---------------------------------------------------------------------------
;High Kung Fu Blocking (High)
[State -1, High Kung Fu Blocking High]
type = ChangeState
value = 1300
triggerall = !ailevel
triggerall = command = "blocking"
triggerall = command != "holddown"
trigger1 = ctrl
trigger1 = statetype != A
trigger2 = stateno = 1310 || stateno = 1330
trigger2 = time > 0

;---------------------------------------------------------------------------
;High Kung Fu Blocking (Low)
[State -1, High Kung Fu Blocking Low]
type = ChangeState
value = 1320
triggerall = !ailevel
triggerall = command = "blocking"
triggerall = command = "holddown"
trigger1 = ctrl
trigger1 = statetype != A
trigger2 = stateno = 1310 || stateno = 1330
trigger2 = time > 0

;---------------------------------------------------------------------------
;High Kung Fu Blocking (Air)
[State -1, High Kung Fu Blocking Low]
type = ChangeState
value = 1340
triggerall = !ailevel
triggerall = command = "blocking"
triggerall = command != "holdup"
triggerall = command != "holddown"
trigger1 = ctrl
trigger1 = statetype = A
trigger2 = stateno = 1350
trigger2 = time > 0

;---------------------------------------------------------------------------
;Far Kung Fu Zankou
[State -1, Far Kung Fu Zankou]
type = ChangeState
value = 1420
triggerall = !ailevel
triggerall = command = "QCF_ab"
triggerall = power >= 330
trigger1 = var(1) ;Use combo condition (above)

;---------------------------------------------------------------------------
;Light Kung Fu Zankou
[State -1, Light Kung Fu Zankou]
type = ChangeState
value = 1400
triggerall = !ailevel
triggerall = command = "QCF_a"
trigger1 = var(1) ;Use combo condition (above)

;---------------------------------------------------------------------------
;Strong Kung Fu Zankou
[State -1, Strong Kung Fu Zankou]
type = ChangeState
value = 1410
triggerall = !ailevel
triggerall = command = "QCF_b"
trigger1 = var(1) ;Use combo condition (above)

;===========================================================================
;---------------------------------------------------------------------------
;Run Fwd
[State -1, Run Fwd]
type = ChangeState
value = 100
triggerall = !ailevel
trigger1 = command = "FF"
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
;Run Back
[State -1, Run Back]
type = ChangeState
value = 105
triggerall = !ailevel
trigger1 = command = "BB"
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
;Kung Fu Throw
[State -1, Kung Fu Throw]
type = ChangeState
value = 800
triggerall = !ailevel
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
;Stand Light Punch
[State -1, Stand Light Punch]
type = ChangeState
value = 200
triggerall = !ailevel
triggerall = command = "x"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 200
trigger2 = time > 6

;---------------------------------------------------------------------------
;Stand Strong Punch
[State -1, Stand Strong Punch]
type = ChangeState
value = 210
triggerall = !ailevel
triggerall = command = "y"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 200) && time > 5
trigger3 = (stateno = 230) && time > 6

;---------------------------------------------------------------------------
;Stand Light Kick
[State -1, Stand Light Kick]
type = ChangeState
value = 230
triggerall = !ailevel
triggerall = command = "a"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 200) && time > 7
trigger3 = (stateno = 230) && time > 9

;---------------------------------------------------------------------------
;Standing Strong Kick
[State -1, Standing Strong Kick]
type = ChangeState
value = 240
triggerall = !ailevel
triggerall = command = "b"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 200) && time > 5
trigger3 = (stateno = 230) && time > 6

;---------------------------------------------------------------------------
;Taunt
[State -1, Taunt]
type = ChangeState
value = 195
triggerall = !ailevel
triggerall = command = "start"
trigger1 = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------
;Crouching Light Punch
[State -1, Crouching Light Punch]
type = ChangeState
value = 400
triggerall = !ailevel
triggerall = command = "x"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl

;---------------------------------------------------------------------------
;Crouching Strong Punch
[State -1, Crouching Strong Punch]
type = ChangeState
value = 410
triggerall = !ailevel
triggerall = command = "y"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 430)
trigger2 = (time > 9) || (movecontact && time > 5)

;---------------------------------------------------------------------------
;Crouching Light Kick
[State -1, Crouching Light Kick]
type = ChangeState
value = 430
triggerall = !ailevel
triggerall = command = "a"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 430)
trigger2 = (time > 9) || (movecontact && time > 5)

;---------------------------------------------------------------------------
;Crouching Strong Kick
[State -1, Crouching Strong Kick]
type = ChangeState
value = 440
triggerall = !ailevel
triggerall = command = "b"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 430)
trigger2 = (time > 9) || (movecontact && time > 5)

;---------------------------------------------------------------------------
;Jump Light Punch
[State -1, Jump Light Punch]
type = ChangeState
value = 600
triggerall = !ailevel
triggerall = command = "x"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600
trigger2 = time >= 7
trigger3 = stateno = 1350 ;Air blocking

;---------------------------------------------------------------------------
;Jump Strong Punch
[State -1, Jump Strong Punch]
type = ChangeState
value = 610
triggerall = command = "y"
trigger1 = statetype = A
trigger1 = ctrl
triggerall = !ailevel
trigger2 = stateno = 600 || stateno = 630 ;jump_x or jump_a
trigger2 = movecontact
trigger3 = stateno = 1350 ;Air blocking

;---------------------------------------------------------------------------
;Jump Light Kick
[State -1, Jump Light Kick]
type = ChangeState
value = 630
triggerall = !ailevel
triggerall = command = "a"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 1350 ;Air blocking

;---------------------------------------------------------------------------
;Jump Strong Kick
[State -1, Jump Strong Kick]
type = ChangeState
value = 640
triggerall = !ailevel
triggerall = command = "b"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 || stateno = 630 ;jump_x or jump_a
trigger2 = movecontact
trigger3 = stateno = 1350 ;Air blocking

;===========================================================================
;---------------------------------------------------------------------------
[state -1, AI 40 Jump]
type = changestate
value = 40
triggerall = ailevel && numenemy && roundstate = 2
triggerall = statetype != A && stateno != 40
; condition
trigger1 = ctrl && inguarddist
trigger1 = enemynear,hitdefattr = SC,AT
trigger1 = random < 640 * (ailevel ** 2.0 / 64.0)

[state -1, AI 120 Block]
type = changestate
value = 120
triggerall = ailevel
triggerall = roundstate = 2
triggerall = numenemy
triggerall = ctrl && stateno != [120, 155]
triggerall = inguarddist
triggerall = enemynear,hitdefattr != SCA,AT && enemynear,time < 70
; condition
trigger1 = random < cond(statetype = A && p2statetype != A, 0, cond(statetype != A && p2statetype = A, 640, 896)) * (ailevel ** 2.0 / 64.0)

[State -1, AI 100 Run Fwd]
type = ChangeState
value = 100
triggerall = ailevel
triggerall = roundstate = 2
trigger1 = statetype != A
trigger1 = ctrl
trigger1 = !inguarddist
trigger1 = p2movetype != A
trigger1 = p2bodydist x > const240p(128)
trigger1 = !((enemynear, movetype = A) && ((enemynear, hitdefattr = SCA, HA, HP) || (enemynear, stateno = [2000, 4999])))
trigger1 = random < 100 * (ailevel ** 2.0 / 64.0)

[State -1, AI 105 Run Back]
type = ChangeState
value = 105
triggerall = ailevel
triggerall = roundstate = 2
trigger1 = statetype != A
trigger1 = ctrl
trigger1 = !inguarddist
trigger1 = (frontedgedist < backedgedist) && p2statetype = L
trigger1 = p2bodydist x = [const240p(-8), const240p(64)]
trigger1 = random < 200 * (ailevel ** 2.0 / 64.0)

[State -1, AI 800 Kung Fu Throw]
type = ChangeState
value = 800
triggerall = ailevel
triggerall = roundstate = 2
triggerall = numenemy
triggerall = p2statetype != L && p2stateno != 5120 && p2stateno != 5201
triggerall = statetype = S
triggerall = ctrl
triggerall = stateno != 100
;
triggerall = (p2stateno != 40 && p2stateno != 52 && p2stateno != 105)
triggerall = (p2statetype = S) || (p2statetype = C)
triggerall = p2movetype != H
triggerall = p2movetype != A
;
trigger1 = frontedgebodydist < backedgebodydist
trigger1 = p2bodydist X < 3
trigger1 = random < 640 * (ailevel ** 2.0 / 64.0)
;
trigger2 = frontedgebodydist >= backedgebodydist
trigger2 = p2bodydist X < 5
trigger2 = random < 640 * (ailevel ** 2.0 / 64.0)

;---------------------------------------------------------------------------
[State -1, AI 1300 Kung Fu Blocking]
type = ChangeState
value = cond(statetype = A, 1340, cond(p2statetype = C, 1320, 1300))
triggerall = ailevel
triggerall = roundstate = 2
triggerall = numenemy
triggerall = p2statetype != L && p2stateno != 5120 && p2stateno != 5201
trigger1 = ctrl
trigger1 = inguarddist && p2movetype = A && enemynear,hitdefattr != SCA,AT
trigger1 = (p2bodydist x = [const(size.ground.front), 104]) && (p2dist y = [-72, 72])
trigger1 = enemynear,time >= 4 && p2stateno < 1000 + 3000 * (statetype = A && p2statetype != A && vel y >= 0)
trigger1 = random < cond(statetype = A && p2statetype != A, 288, cond(statetype != A && p2statetype = A, 0, 480)) * (ailevel ** 2.0 / 64.0)
;
trigger2 = cond(statetype = A, stateno = 1350, (stateno = 1310 || stateno = 1330))
trigger2 = time > 0
trigger2 = inguarddist && p2movetype = A && enemynear,hitdefattr != SCA,AT
trigger2 = (p2bodydist x = [const(size.ground.front), 104]) && (p2dist y = [-72, 72])
trigger2 = enemynear,time >= 4 && p2stateno < 1000 + 3000 * (statetype = A && p2statetype != A && vel y >= 0)
trigger2 = random < cond(statetype = A && p2statetype != A, 288, cond(statetype != A && p2statetype = A, 0, 480)) * (ailevel ** 2.0 / 64.0)

;---------------------------------------------------------------------------
[State -1, AI 400 Crouching Light Punch]
type = ChangeState
value = 400
triggerall = ailevel
triggerall = roundstate = 2
triggerall = numenemy
triggerall = p2statetype != L && p2stateno != 5120 && p2stateno != 5201
triggerall = statetype != A
; startup = 3
;Clsn1: 1
; Clsn1[0] =  54,-48, 17,-40
triggerall = p2bodydist x = [-const240p(8), ceil((cond(!ctrl, (2.0 / 3.0), 1.0) * (54 - const(size.ground.front))))]
triggerall = p2dist y = [ceil((cond(!ctrl, (2.0 / 3.0), 1.0) * -48)), const240p(8)]
triggerall = p2statetype != A
; condition
trigger1 = statetype != A
trigger1 = ctrl || stateno = 100 
trigger1 = random < (75 * (ailevel ** 2.0 / 64.0)) + (250 * (enemynear, gethitvar(hittime) >= 3 && !(enemynear, hitfall)))

[State -1, AI 410 Crouching Strong Punch]
type = ChangeState
value = 410
triggerall = ailevel
triggerall = roundstate = 2
triggerall = numenemy
triggerall = p2statetype != L && p2stateno != 5120 && p2stateno != 5201
; startup = 7
;Clsn1: 2
; Clsn1[0] =  51,-79, 29,-57
; Clsn1[1] =  44,-94, 57,-74
triggerall = p2bodydist x = [-const240p(8), ceil((cond(!ctrl, (2.0 / 3.0), 1.0) * (57 - const(size.ground.front))))]
triggerall = p2dist y = [ceil((cond(!ctrl, (2.0 / 3.0), 1.0) * -94)), const240p(8)]
;
trigger1 = statetype != A
trigger1 = ctrl || stateno = 100
trigger1 = random < (50 * (ailevel ** 2.0 / 64.0)) + (250 * (enemynear, gethitvar(hittime) >= 3 && !(enemynear, hitfall)))
;
trigger2 = (stateno = 400) || (stateno = 430)
trigger2 = (time > 9) || (movecontact && time > 5)
trigger2 = random < (250 * (ailevel ** 2.0 / 64.0)) + (250 * (ailevel ** 2.0 / 64.0) * movehit)

[State -1, AI 200 Stand Light Punch]
type = ChangeState
value = 200
triggerall = ailevel
triggerall = roundstate = 2
triggerall = numenemy
triggerall = p2statetype != L && p2stateno != 5120 && p2stateno != 5201
;startup = 3
;Clsn1: 1
; Clsn1[0] =  16,-80, 61,-71
triggerall = p2bodydist x = [-const240p(8), ceil((cond(!ctrl, (2.0 / 3.0), 1.0) * (61 - const(size.ground.front))))]
triggerall = p2dist y = [ceil((cond(!ctrl, (2.0 / 3.0), 1.0) * -86)), const240p(8)]
triggerall = p2statetype != C
;
trigger1 = statetype != A
trigger1 = ctrl || stateno = 100
trigger1 = random < (75 * (ailevel ** 2.0 / 64.0)) + (250 * (enemynear, gethitvar(hittime) >= 3 && !(enemynear, hitfall)))
;
trigger2 = stateno = 200
trigger2 = time > 6
trigger2 = random < (75 * (ailevel ** 2.0 / 64.0)) + (250 * (ailevel ** 2.0 / 64.0) * movehit)

[State -1, AI 210 Stand Strong Punch]
type = ChangeState
value = 210
triggerall = ailevel
triggerall = roundstate = 2
triggerall = numenemy
triggerall = p2statetype != L && p2stateno != 5120 && p2stateno != 5201
; startup = 8
;Clsn1: 2
; Clsn1[0] =  27,-86, 64,-60
; Clsn1[1] =  64,-63, 79,-82
triggerall = p2bodydist x = [-const240p(8), ceil((cond(!ctrl, (2.0 / 3.0), 1.0) * (79 - const(size.ground.front))))]
triggerall = p2dist y = [ceil((cond(!ctrl, (2.0 / 3.0), 1.0) * -86)), const240p(8)]
triggerall = p2statetype != C
;
trigger1 = statetype != A
trigger1 = ctrl || stateno = 100
trigger1 = random < (50 * (ailevel ** 2.0 / 64.0)) + (250 * (enemynear, gethitvar(hittime) >= 8 && !(enemynear, hitfall)))
;
trigger2 = (stateno = 200) && time > 5
trigger2 = random < (250 * (ailevel ** 2.0 / 64.0)) + (250 * (ailevel ** 2.0 / 64.0) * movehit)
;
trigger3 = (stateno = 230) && time > 6
trigger3 = random < (250 * (ailevel ** 2.0 / 64.0)) + (250 * (ailevel ** 2.0 / 64.0) * movehit)

[State -1, AI 230 Stand Light Kick]
type = ChangeState
value = 230
triggerall = ailevel
triggerall = roundstate = 2
triggerall = numenemy
triggerall = p2statetype != L && p2stateno != 5120 && p2stateno != 5201
; startup = 4
;Clsn1: 3
; Clsn1[0] =  38,-53, 14,-36
; Clsn1[1] =  35,-42, 56,-29
; Clsn1[2] =  69,-34, 53,-23
triggerall = p2bodydist x = [-const240p(8), ceil((cond(!ctrl, (2.0 / 3.0), 1.0) * (69 - const(size.ground.front))))]
triggerall = p2dist y = [ceil((cond(!ctrl, (2.0 / 3.0), 1.0) * -53)), const240p(8)]
triggerall = p2statetype != A
;
trigger1 = statetype != A
trigger1 = ctrl || stateno = 100
trigger1 = random < (75 * (ailevel ** 2.0 / 64.0)) + (250 * (enemynear, gethitvar(hittime) >= 4 && !(enemynear, hitfall)))
;
trigger2 = (stateno = 200) && time > 7
trigger2 = random < (75 * (ailevel ** 2.0 / 64.0)) + (100 * (ailevel ** 2.0 / 64.0) * movehit)
;
trigger3 = (stateno = 230) && time > 9
trigger3 = random < (75 * (ailevel ** 2.0 / 64.0)) + (100 * (ailevel ** 2.0 / 64.0) * movehit)

[State -1, AI 240 Standing Strong Kick]
type = ChangeState
value = 240
triggerall = ailevel
triggerall = roundstate = 2
triggerall = numenemy
triggerall = p2statetype != L && p2stateno != 5120 && p2stateno != 5201
; startup = 7
;Clsn1: 1
; Clsn1[0] =   4,-65, 67,-50
triggerall = p2bodydist x = [-const240p(8), ceil((cond(!ctrl, (2.0 / 3.0), 1.0) * (67 - const(size.ground.front))))]
triggerall = p2dist y = [ceil((cond(!ctrl, (2.0 / 3.0), 1.0) * -53)), const240p(8)]
;
trigger1 = statetype != A
trigger1 = ctrl || stateno = 100 
trigger1 = random < (100 * (ailevel ** 2.0 / 64.0)) + (250 * (enemynear, gethitvar(hittime) >= 7 && !(enemynear, hitfall)))
;
trigger2 = (stateno = 200) && time > 5
trigger2 = random < (250 * (ailevel ** 2.0 / 64.0)) + (250 * (ailevel ** 2.0 / 64.0) * movehit)
;
trigger3 = (stateno = 230) && time > 6
trigger3 = random < (250 * (ailevel ** 2.0 / 64.0)) + (250 * (ailevel ** 2.0 / 64.0) * movehit)

[State -1, AI 430 Crouching Light Kick]
type = ChangeState
value = 430
triggerall = ailevel
triggerall = roundstate = 2
triggerall = numenemy
triggerall = p2stateno != 5120 && p2stateno != 5201
; startup = 4
;Clsn1: 3
; Clsn1[0] =  24,-24,  8,-13
; Clsn1[1] =  23,-19, 45,-10
; Clsn1[2] =  45,-11, 63,  0
triggerall = p2bodydist x = [-const240p(8), ceil((cond(!ctrl, (2.0 / 3.0), 1.0) * (63 - const(size.ground.front))))]
triggerall = p2dist y = [ceil((cond(!ctrl, (2.0 / 3.0), 1.0) * -24)), const240p(8)]
triggerall = p2statetype != A
;
trigger1 = statetype != A
trigger1 = ctrl || stateno = 100
trigger1 = random < (100 * (ailevel ** 2.0 / 64.0)) + (250 * (enemynear, gethitvar(hittime) >= 4 && !(enemynear, hitfall)))
;
trigger2 = (stateno = 400) || (stateno = 430)
trigger2 = (time > 9) || (movecontact && time > 5)
trigger2 = random < (250 * (ailevel ** 2.0 / 64.0)) + (250 * (ailevel ** 2.0 / 64.0) * movehit)

[State -1, AI 440 Crouching Strong Kick]
type = ChangeState
value = 440
triggerall = ailevel
triggerall = roundstate = 2
triggerall = numenemy
triggerall = p2stateno != 5120 && p2stateno != 5201
; startup = 9
;Clsn1: 3
; Clsn1[0] =  40,-10, 18,-25
; Clsn1[1] =  40,-17, 58, -4
; Clsn1[2] =  76,  1, 58,-10
triggerall = p2bodydist x = [-const240p(8), ceil((cond(!ctrl, (2.0 / 3.0), 1.0) * (76 - const(size.ground.front))))]
triggerall = p2dist y = [ceil((cond(!ctrl, (2.0 / 3.0), 1.0) * -25)), const240p(8)]
triggerall = (p2statetype = S || (p2statetype = C && p2movetype = H))
;
trigger1 = statetype != A
trigger1 = ctrl || stateno = 100
trigger1 = random < (25 * (ailevel ** 2.0 / 64.0)) + (250 * (enemynear, gethitvar(hittime) >= 9 && !(enemynear, hitfall)))
;
trigger2 = (stateno = 400) || (stateno = 430)
trigger2 = (time > 9) || (movecontact && time > 5)
trigger2 = !moveguarded
trigger2 = random < (50 * (ailevel ** 2.0 / 64.0)) + (250 * (ailevel ** 2.0 / 64.0) * movehit)

;---------------------------------------------------------------------------
;Jump Strong Punch
[State -1, AI 610 Jump Strong Punch]
type = ChangeState
value = 610
triggerall = ailevel
triggerall = roundstate = 2
triggerall = numenemy
triggerall = p2statetype != L && p2stateno != 5120 && p2stateno != 5201
triggerall = vel y > 0 || p2statetype = A
; startup = 6
;Clsn1: 1
; Clsn1[0] =  23,-45, 57,-77
;
trigger1 = statetype = A
trigger1 = ctrl || stateno = 132
trigger1 = p2bodydist x = [-const240p(8) + (6 * (vel x + enemynear, vel x)), 57 + (6 * (vel x + enemynear, vel x) - const(size.ground.front))]
trigger1 = p2dist y = [-77 - const240p(16), -45 + const240p(80) + (32 * vel y * (vel y > 0))]
trigger1 = random < (200 * (ailevel ** 2.0 / 64.0)) + (250 * (ailevel ** 2.0 / 64.0) * (stateno = 1340 || numtarget))
;
trigger2 = stateno = 600 || stateno = 630 ;jump_x or jump_a
trigger2 = movecontact
trigger2 = (p2bodydist x = [-const240p(8), 57 + (const240p(16) * (vel x > 0)) - const(size.ground.front)])
trigger2 = (p2dist y = [-77 - const240p(16), -45 + const240p(80) + (32 * vel y > 1.0)])
trigger2 = random < (200 * (ailevel ** 2.0 / 64.0)) + (250 * (ailevel ** 2.0 / 64.0) * movehit)
;
trigger3 = stateno = 1350 ;Air blocking
trigger3 = (p2bodydist x = [-const240p(8), 57 + (const240p(16) * (vel x > 0)) - const(size.ground.front)])
trigger3 = (p2dist y = [-77 - const240p(16), -45 + const240p(80) + (32 * vel y > 1.0)])
trigger3 = random < (400 * (ailevel ** 2.0 / 64.0))
; condition
trigger4 = ctrl
trigger4 = vel y > 0
trigger4 = p2bodydist x > 0
trigger4 = p2dist y > -45 && abs(p2dist y) = [p2dist x, p2dist x + const240p(72)]
trigger4 = p2statetype != A
trigger4 = random < (200 * (ailevel ** 2.0 / 64.0))

;---------------------------------------------------------------------------
;Jump Strong Kick
[State -1, AI 640 Jump Strong Kick]
type = ChangeState
value = 640
triggerall = ailevel
triggerall = roundstate = 2
triggerall = numenemy
triggerall = p2statetype != L && p2stateno != 5120 && p2stateno != 5201
triggerall = vel y > 0 || p2statetype = A
; startup = 6
;Clsn1: 2
; Clsn1[0] =  43,-48, 13,-33
; Clsn1[1] =  43,-42, 69,-28
trigger1 = statetype = A
trigger1 = ctrl || stateno = 132
trigger1 = p2bodydist x = [-const240p(8) + (6 * (vel x + enemynear, vel x)), 69 + (9 * (vel x + enemynear, vel x) - const(size.ground.front))]
trigger1 = p2dist y = [-48 - const240p(16), -28 + const240p(80) + (32 * vel y * (vel y > 0))]
trigger1 = random < (200 * (ailevel ** 2.0 / 64.0)) + (250 * (ailevel ** 2.0 / 64.0) * (stateno = 1340 || numtarget))
;
trigger2 = stateno = 600 || stateno = 630 ;jump_x or jump_a
trigger2 = movecontact
trigger2 = (p2bodydist x = [-const240p(8), 69 + (const240p(16) * (vel x > 0)) - const(size.ground.front)])
trigger2 = (p2dist y = [-48 - const240p(16), -28 + const240p(80) + (32 * vel y > 1.0)])
trigger2 = random < (200 * (ailevel ** 2.0 / 64.0)) + (250 * (ailevel ** 2.0 / 64.0) * movehit)
;
trigger3 = stateno = 1350 ;Air blocking
trigger3 = (p2bodydist x = [-const240p(8), 69 + (const240p(16) * (vel x > 0)) - const(size.ground.front)])
trigger3 = (p2dist y = [-48 - const240p(16), -28 + const240p(80) + (32 * vel y > 1.0)])
trigger3 = random < (400 * (ailevel ** 2.0 / 64.0))
; condition
trigger4 = ctrl
trigger4 = vel y > 0
trigger4 = p2bodydist x > 0
trigger4 = p2dist y > -48 && abs(p2dist y) = [p2dist x, p2dist x + const240p(72)]
trigger4 = p2statetype != A
trigger4 = random < (200 * (ailevel ** 2.0 / 64.0))

;---------------------------------------------------------------------------
;Jump Light Punch
[State -1, AI 600 Jump Light Punch]
type = ChangeState
value = 600
triggerall = ailevel
triggerall = roundstate = 2
triggerall = numenemy
triggerall = p2statetype != L && p2stateno != 5120 && p2stateno != 5201
; startup = 3
;Clsn1: 2
; Clsn1[0] =  15,-70, 31,-60
; Clsn1[1] =  49,-54, 29,-65
triggerall = vel y > 0 || p2statetype = A
;
trigger1 = statetype = A
trigger1 = ctrl || stateno = 132
trigger1 = p2bodydist x = [-const240p(8) + (3 * (vel x + enemynear, vel x)), 49 + (3 * (vel x + enemynear, vel x) - const(size.ground.front))]
trigger1 = p2dist y = [-70 - const240p(16), -54 + const240p(80) + (32 * vel y * (vel y > 0))]
trigger1 = random < (200 * (ailevel ** 2.0 / 64.0)) + (250 * (ailevel ** 2.0 / 64.0) * (stateno = 1340 || numtarget))
;
trigger2 = stateno = 600
trigger2 = time >= 7
trigger2 = (p2bodydist x = [-const240p(8), 49 + (const240p(16) * (vel x > 0)) - const(size.ground.front)])
trigger2 = (p2dist y = [-70 - const240p(16), -54 + const240p(80) + (32 * vel y > 1.0)])
trigger2 = random < (200 * (ailevel ** 2.0 / 64.0)) + (250 * (ailevel ** 2.0 / 64.0) * movehit)
;
trigger3 = stateno = 1350 ;Air blocking
trigger3 = (p2bodydist x = [-const240p(8), 49 + (const240p(16) * (vel x > 0)) - const(size.ground.front)])
trigger3 = p2dist y = [-70 - const240p(16), -54 + const240p(80) + (32 * vel y * (vel y > 0))]
trigger3 = random < (400 * (ailevel ** 2.0 / 64.0))
; condition
trigger4 = ctrl
trigger4 = vel y > 0
trigger4 = p2bodydist x > 0
trigger4 = p2dist y > -70 && abs(p2dist y) = [p2dist x, p2dist x + const240p(72)]
trigger4 = p2statetype != A
trigger4 = random < (200 * (ailevel ** 2.0 / 64.0))

;---------------------------------------------------------------------------
;Jump Light Kick
[State -1, AI 630 Jump Light Kick]
type = ChangeState
value = 630
triggerall = ailevel
triggerall = roundstate = 2
triggerall = numenemy
triggerall = p2statetype != L && p2stateno != 5120 && p2stateno != 5201
triggerall = vel y > 0 || p2statetype = A
; startup = 3
;Clsn1: 1
;  Clsn1[0] = 11, -54, 35, -37
trigger1 = statetype = A
trigger1 = ctrl || stateno = 132
trigger1 = p2bodydist x = [-const240p(8) + (3 * (vel x + enemynear, vel x)), 35 + (3 * (vel x + enemynear, vel x) - const(size.ground.front))]
trigger1 = p2dist y = [-54 - const240p(16), -37 + const240p(80) + (32 * vel y * (vel y > 0))]
trigger1 = random < (200 * (ailevel ** 2.0 / 64.0)) + (250 * (ailevel ** 2.0 / 64.0) * (stateno = 1340 || numtarget))
;
trigger2 = stateno = 1350 ;Air blocking
trigger2 = (p2bodydist x = [-const240p(8), 35 + (const240p(16) * (vel x > 0)) - const(size.ground.front)])
trigger2 = (p2dist y = [-54 - const240p(16), -37 + const240p(80) + (32 * vel y > 1.0)])
trigger2 = random < (400 * (ailevel ** 2.0 / 64.0)) + (250 * (ailevel ** 2.0 / 64.0) * movehit)
; condition
trigger4 = ctrl || stateno = 100
trigger4 = vel y > 0
trigger4 = p2bodydist x > 0
trigger4 = p2dist y > -54 && abs(p2dist y) = [p2dist x, p2dist x + const240p(72)]
trigger4 = p2statetype != A
trigger4 = random < (200 * (ailevel ** 2.0 / 64.0))

;---------------------------------------------------------------------------
; AI Special Moves
;---------------------------------------------------------------------------
[State -1, AI 1050 Light Kung Fu Knee]
type = ChangeState
value = 1050
triggerall = ailevel
triggerall = roundstate = 2
triggerall = numenemy
triggerall = p2statetype != L && p2stateno != 5120 && p2stateno != 5201
triggerall = statetype != A
triggerall = p2statetype != C
; startup = 9
;Clsn1: 1
; Clsn1[0] =  30,-80,  9,-49
; condition
trigger1 = ctrl || stateno = 100
trigger1 = p2bodydist x = [-const240p(8), 56 + 9 * (vel x + enemynear, vel x) - const(size.ground.front)]
trigger1 = p2dist y = [-94 - (9 * enemynear, vel y), const240p(8) - (enemynear, vel y)]
trigger1 = (p2stateno != [120, 155])
trigger1 = enemynear, vel x >= 0 || var(47)
trigger1 = enemynear, vel y > const240p(-2) || var(47)
trigger1 = p2movetype = A || p2statetype = A
trigger1 = (p2bodydist x > 0) && (facing != enemynear, facing)
trigger1 = random < (100 * (ailevel ** 2.0 / 64.0))
; condition
trigger2 = !ctrl
trigger2 = var(1)
trigger2 = movecontact = [1, 8]
trigger2 = p2bodydist x = [-const240p(8), ceil(0.5 * (56 - const(size.ground.front)))]
trigger2 = p2dist y = [ceil(0.5 * -94), const240p(8)]
trigger2 = movehit && numtarget
trigger2 = p2statetype = A || enemynear, gethitvar(yvel) || enemynear, hitfall
trigger2 = random < cond((stateno = 200 || stateno = 230 || stateno = 400 || stateno = 430), 25, 200) * (ailevel ** 2.0 / 64.0)
; condition
trigger3 = ctrl || stateno = 100
trigger3 = p2bodydist x = [-const240p(8), (56 + ((9 * enemynear, vel x) * p2statetype = A)) - const(size.ground.front)]
trigger3 = p2dist y = [-94, -8 - (enemynear, vel y * (enemynear, vel y > 0))]
trigger3 = enemynear, statetype = A && enemynear, hitfall
;trigger3 = !(enemynear, stateno = [820, 821])
trigger3 = random < (cond(power >= 1000, 50, 500) * (ailevel ** 2.0 / 64.0))

[State -1, AI 1060 Strong Kung Fu Knee]
type = ChangeState
value = 1060
triggerall = ailevel
triggerall = roundstate = 2
triggerall = numenemy
triggerall = p2statetype != L && p2stateno != 5120 && p2stateno != 5201
triggerall = statetype != A
triggerall = p2statetype != C
; startup = 9
;Clsn1: 1
; Clsn1[0] =  30,-80,  9,-49
; condition
trigger1 = ctrl || stateno = 100
trigger1 = p2bodydist x = [-const240p(8), 56 + 9 * (vel x + enemynear, vel x) - const(size.ground.front)]
trigger1 = p2dist y = [-94 - (9 * enemynear, vel y), const240p(8) - (enemynear, vel y)]
trigger1 = (p2stateno != [120, 155])
trigger1 = enemynear, vel x >= 0 || var(47)
trigger1 = enemynear, vel y > const240p(-2) || var(47)
trigger1 = p2movetype = A || p2statetype = A
trigger1 = (p2bodydist x > 0) && (facing != enemynear, facing)
trigger1 = random < (100 * (ailevel ** 2.0 / 64.0))
; condition
trigger2 = !ctrl
trigger2 = var(1)
trigger2 = movecontact = [1, 8]
trigger2 = p2bodydist x = [-const240p(8), ceil(0.5 * (56 - const(size.ground.front)))]
trigger2 = p2dist y = [ceil(0.5 * -94), const240p(8)]
trigger2 = movehit && numtarget
trigger2 = p2statetype = A || enemynear, gethitvar(yvel) || enemynear, hitfall
trigger2 = random < cond((stateno = 200 || stateno = 230 || stateno = 400 || stateno = 430), 25, 200) * (ailevel ** 2.0 / 64.0)
; condition
trigger3 = ctrl || stateno = 100
trigger3 = p2bodydist x = [-const240p(8), (56 + ((9 * enemynear, vel x) * p2statetype = A)) - const(size.ground.front)]
trigger3 = p2dist y = [-94, -8 - (enemynear, vel y * (enemynear, vel y > 0))]
trigger3 = enemynear, statetype = A && enemynear, hitfall
;trigger3 = !(enemynear, stateno = [820, 821])
trigger3 = random < (cond(power >= 1000, 50, 500) * (ailevel ** 2.0 / 64.0))

;Light Kung Fu Upper
[State -1, AI 1100 Light Kung Fu Upper]
type = ChangeState
value = 1100
triggerall = ailevel
triggerall = roundstate = 2
triggerall = numenemy
triggerall = p2statetype != L && p2stateno != 5120 && p2stateno != 5201
triggerall = statetype != A
trigger1 = p2statetype != C
; startup = 7
;Clsn1: 1
; Clsn1[0] =  30,-60, 55,-131
; condition
trigger1 = ctrl || stateno = 100
trigger1 = p2bodydist x = [-const240p(8), 55 + 7 * (vel x + enemynear, vel x) - const(size.ground.front)]
trigger1 = p2dist y = [-131 - (enemynear, vel y), const240p(8) - (enemynear, vel y)]
trigger1 = (p2stateno != [120, 155])
trigger1 = enemynear, vel x >= 0 || var(47)
trigger1 = enemynear, vel y > const240p(-2) || var(47)
trigger1 = p2movetype = A || p2statetype = A
trigger1 = (p2bodydist x > 0) && (facing != enemynear, facing)
trigger1 = random < (200 * (ailevel ** 2.0 / 64.0))
; condition
trigger2 = !ctrl
trigger2 = var(1)
trigger2 = movecontact = [1, 8]
trigger2 = p2bodydist x = [-const240p(8), ceil(0.5 * (55 - const(size.ground.front)))]
trigger2 = p2dist y = [ceil(0.5 * -131), const240p(8)]
trigger2 = movehit && numtarget
trigger2 = enemynear, gethitvar(hittime) >= 7
trigger2 = random < cond((stateno = 200 || stateno = 230 || stateno = 400 || stateno = 430), 25, 50) * (ailevel ** 2.0 / 64.0)
; condition
trigger3 = ctrl || stateno = 100
trigger3 = p2bodydist x = [-const240p(8), (55 + ((7 * enemynear, vel x) * p2statetype = A)) - const(size.ground.front)]
trigger3 = p2dist y = [-131, -8 - (enemynear, vel y * (enemynear, vel y > 0))]
trigger3 = enemynear, statetype = A && enemynear, hitfall
;trigger3 = !(enemynear, stateno = [820, 821])
trigger3 = random < (cond(power >= 1000, 50, 500) * (ailevel ** 2.0 / 64.0))

[State -1, AI 1110 Strong Kung Fu Upper]
type = ChangeState
value = 1110
triggerall = ailevel
triggerall = roundstate = 2
triggerall = numenemy
triggerall = p2statetype != L && p2stateno != 5120 && p2stateno != 5201
triggerall = statetype != A
; startup = 7
;Clsn1: 1
; Clsn1[0] =  30,-60, 55,-131
trigger1 = ctrl || stateno = 100
trigger1 = p2bodydist x = [-const240p(8), 55 + 7 * (vel x + enemynear, vel x) - const(size.ground.front)]
trigger1 = p2dist y = [-131 - (enemynear, vel y), const240p(8) - (enemynear, vel y)]
trigger1 = (p2stateno != [120, 155])
trigger1 = enemynear, vel x >= 0 || var(47)
trigger1 = enemynear, vel y > const240p(-2) || var(47)
trigger1 = p2movetype = A || p2statetype = A
trigger1 = (p2bodydist x > 0) && (facing != enemynear, facing)
trigger1 = random < (200 * (ailevel ** 2.0 / 64.0))
; condition
trigger2 = !ctrl
trigger2 = var(1)
trigger2 = movecontact = [1, 8]
trigger2 = p2bodydist x = [-const240p(8), ceil(0.5 * (55 - const(size.ground.front)))]
trigger2 = p2dist y = [ceil(0.5 * -131), const240p(8)]
trigger2 = movehit && numtarget
trigger2 = enemynear, gethitvar(hittime) >= 7
trigger2 = random < cond((stateno = 200 || stateno = 230 || stateno = 400 || stateno = 430), 25, 250) * (ailevel ** 2.0 / 64.0)
; condition
trigger3 = ctrl || stateno = 100
trigger3 = p2bodydist x = [-const240p(8), (55 + ((7 * enemynear, vel x) * p2statetype = A)) - const(size.ground.front)]
trigger3 = p2dist y = [-131, -8 - (enemynear, vel y * (enemynear, vel y > 0))]
trigger3 = enemynear, statetype = A && enemynear, hitfall
;trigger3 = !(enemynear, stateno = [820, 821])
trigger3 = random < (cond(power >= 1000, 50, 500) * (ailevel ** 2.0 / 64.0))

;Strong Kung Fu Palm
[State -1, AI 1010 Strong Kung Fu Palm]
type = ChangeState
value = 1010
; startup = 8
;Clsn1: 1
; Clsn1[0] =  68,-66,  9,-44
triggerall = ailevel
triggerall = roundstate = 2
triggerall = numenemy
triggerall = p2statetype != L && p2stateno != 5120 && p2stateno != 5201
triggerall = !(enemynear, ctrl) && (enemynear, stateno != [120, 155])
;
triggerall = p2bodydist x = [-const240p(8), ceil((cond(!ctrl, (2.0 / 3.0), 1.0) * (104 - const(size.ground.front))))]
triggerall = p2dist y = [ceil((cond(!ctrl, (2.0 / 3.0), 1.0) * -66)), const240p(8)]
;
trigger1 = ctrl || stateno = 100
trigger1 = statetype != A
trigger1 = p2bodydist x > (60 - const(size.ground.front))
trigger1 = random < (25 * (ailevel * 2.0 / 64.0))
;
trigger2 = !ctrl
trigger2 = var(1)
trigger2 = movecontact = [1, 8]
trigger2 = movehit && numtarget
trigger2 = enemynear, gethitvar(hittime) >= 8
trigger2 = !((target, statetype = A) || (target, gethitvar(yvel)) || (target, hitfall))
trigger2 = random < cond((stateno = 200 || stateno = 230 || stateno = 400 || stateno = 430), 25, 250) * (ailevel ** 2.0 / 64.0)

;Light Kung Fu Palm
[State -1, AI 1000 Light Kung Fu Palm]
type = ChangeState
value = 1000
; startup = 8
;Clsn1: 1
; Clsn1[0] =  68,-66,  9,-44
triggerall = ailevel
triggerall = roundstate = 2
triggerall = numenemy
triggerall = p2statetype != L && p2stateno != 5120 && p2stateno != 5201
triggerall = !(enemynear, ctrl) && (enemynear, stateno != [120, 155])
;
triggerall = p2bodydist x = [-const240p(8), ceil((cond(!ctrl, (2.0 / 3.0), 1.0) * (104 - const(size.ground.front))))]
triggerall = p2dist y = [ceil((cond(!ctrl, (2.0 / 3.0), 1.0) * -66)), const240p(8)]
;
trigger1 = ctrl || stateno = 100
trigger1 = statetype != A
trigger1 = p2bodydist x > (60 - const(size.ground.front))
trigger1 = random < (25 * (ailevel ** 2.0 / 64.0))
;
trigger2 = !ctrl
trigger2 = var(1)
trigger2 = movecontact = [1, 8]
trigger2 = movehit && numtarget
trigger2 = enemynear, gethitvar(hittime) >= 8 
trigger2 = !((target, statetype = A) || (target, gethitvar(yvel)) || (target, hitfall))
trigger2 = random < cond((stateno = 200 || stateno = 230 || stateno = 400 || stateno = 430), 25, 250) * (ailevel ** 2.0 / 64.0)

;Strong Kung Fu Zankou
[State -1, AI 1410 Strong Kung Fu Zankou]
type = ChangeState
value = 1410
triggerall = ailevel
triggerall = roundstate = 2
triggerall = numenemy
triggerall = p2statetype != L && p2stateno != 5120 && p2stateno != 5201
triggerall = !(enemynear, ctrl) && (enemynear, stateno != [120, 155])
; startup = 8
;Clsn1: 1
; Clsn1[0] =  34,-76,  4,-22
triggerall = p2bodydist x = [-const240p(8), (ceil(cond(!ctrl, (2.0 / 3.0), 1.0) * (84 - const(size.ground.front))))]
triggerall = p2dist y = [(ceil(cond(!ctrl, (2.0 / 3.0), 1.0) * -76)), const240p(8)]
;
trigger1 = ctrl || stateno = 100
trigger1 = statetype != A
trigger1 = random < (25 * (ailevel ** 2.0 / 64.0))
;
trigger2 = !ctrl
trigger2 = var(1)
trigger2 = movecontact = [1, 8]
trigger2 = movehit && numtarget
trigger2 = enemynear, gethitvar(hittime) >= 8
trigger2 = !((target, statetype = A) || (target, gethitvar(yvel)) || (target, hitfall))
trigger2 = random < cond((stateno = 200 || stateno = 230 || stateno = 400 || stateno = 430), 25, 250) * (ailevel ** 2.0 / 64.0)

;Light Kung Fu Zankou
[State -1, AI 1400 Light Kung Fu Zankou]
type = ChangeState
value = 1400
triggerall = ailevel
triggerall = roundstate = 2
triggerall = numenemy
triggerall = p2statetype != L && p2stateno != 5120 && p2stateno != 5201
triggerall = !(enemynear, ctrl) && (enemynear, stateno != [120, 155])
; startup = 8
;Clsn1: 1
; Clsn1[0] =  34,-76,  4,-22
triggerall = p2bodydist x = [-const240p(8), (ceil(cond(!ctrl, (2.0 / 3.0), 1.0) * (66 - const(size.ground.front))))]
triggerall = p2dist y = [(ceil(cond(!ctrl, (2.0 / 3.0), 1.0) * -76)), const240p(8)]
;
trigger1 = ctrl || stateno = 100
trigger1 = statetype != A
trigger1 = random < (25 * (ailevel ** 2.0 / 64.0))
;
trigger2 = !ctrl
trigger2 = var(1)
trigger2 = movecontact = [1, 8]
trigger2 = movehit && numtarget
trigger2 = enemynear, gethitvar(hittime) >= 8
trigger2 = !((target, statetype = A) || (target, gethitvar(yvel)) || (target, hitfall))
trigger2 = random < cond((stateno = 200 || stateno = 230 || stateno = 400 || stateno = 430), 25, 250) * (ailevel ** 2.0 / 64.0)

;Light Kung Fu Blow
[State -1, AI 1200 Light Kung Fu Blow]
type = ChangeState
value = 1200
triggerall = ailevel
triggerall = roundstate = 2
triggerall = numenemy
triggerall = p2statetype != L && p2stateno != 5120 && p2stateno != 5201
; startup = 13
;Clsn1: 2
; Clsn1[0] = -14,-72, 17,-55
; Clsn1[1] =  44,-72, 91,-45
triggerall = p2bodydist x = [-const240p(8), (ceil(cond(!ctrl, (2.0 / 3.0), 1.0) * (91 - const(size.ground.front))))]
triggerall = p2dist y = [(ceil(cond(!ctrl, (2.0 / 3.0), 1.0) * -72)), const240p(8)]
;
trigger1 = ctrl || stateno = 100
trigger1 = statetype != A
trigger1 = random < (25 * (ailevel ** 2.0 / 64.0))
;
trigger2 = !ctrl
trigger2 = var(1)
trigger2 = movecontact = [1, 8]
trigger2 = enemynear, gethitvar(hittime) >= 13
trigger2 = !((target, statetype = A) || (target, gethitvar(yvel)) || (target, hitfall))
trigger2 = random < cond((stateno = 200 || stateno = 230 || stateno = 400 || stateno = 430), 25, 250) * (ailevel ** 2.0 / 64.0)

;Strong Kung Fu Blow
[State -1, AI 1210 Strong Kung Fu Blow]
type = ChangeState
value = 1210
triggerall = ailevel
triggerall = roundstate = 2
triggerall = numenemy
triggerall = p2statetype != L && p2stateno != 5120 && p2stateno != 5201
; startup = 17
;Clsn1: 2
; Clsn1[0] = -14,-72, 17,-55
; Clsn1[1] =  44,-72, 91,-45
triggerall = p2bodydist x = [-const240p(8), (ceil(cond(!ctrl, (2.0 / 3.0), 1.0) * (91 - const(size.ground.front))))]
triggerall = p2dist y = [(ceil(cond(!ctrl, (2.0 / 3.0), 1.0) * -72)), const240p(8)]
;
trigger1 = ctrl || stateno = 100
trigger1 = statetype != A
trigger1 = random < (25 * (ailevel ** 2.0 / 64.0))
;
trigger2 = !ctrl
trigger2 = var(1)
trigger2 = movecontact = [1, 8]
trigger2 = enemynear, gethitvar(hittime) >= 17
trigger2 = !((target, statetype = A) || (target, gethitvar(yvel)) || (target, hitfall))
trigger2 = random < cond((stateno = 200 || stateno = 230 || stateno = 400 || stateno = 430), 25, 250) * (ailevel ** 2.0 / 64.0)

;---------------------------------------------------------------------------
;AI EX Moves
;---------------------------------------------------------------------------
;Fast Kung Fu Upper (1/3 super bar)
[State -1, AI 1120 Fast Kung Fu Upper]
type = ChangeState
value = 1120
triggerall = ailevel
triggerall = roundstate = 2
triggerall = numenemy
triggerall = p2statetype != L && p2stateno != 5120 && p2stateno != 5201
triggerall = power >= 330
; startup = 7
;Clsn1: 1
; Clsn1[0] =  30,-60, 55,-131
;
trigger1 = ctrl || stateno = 100
trigger1 = statetype != A
trigger1 = p2bodydist x = [-const240p(8) + (7 * enemynear, vel x), (55 + (7 * enemynear, vel x) - const(size.ground.front))]
trigger1 = p2dist y = [-131 - (enemynear, vel y), const240p(8) - (enemynear, vel y)]
trigger1 = (p2stateno != [120, 155])
trigger1 = enemynear, vel x >= 0 || var(47)
trigger1 = enemynear, vel y > const240p(-2) || var(47)
trigger1 = p2movetype = A || p2statetype = A
trigger1 = (p2bodydist x > 0) && (facing != enemynear, facing)
trigger1 = !((enemynear, statetype = A) && (!(enemynear, vel x)) && (enemynear, movetype != A))
trigger1 = random < (25 * (ailevel ** 2.0 / 64.0))
;
trigger2 = !ctrl
trigger2 = var(1)
trigger2 = movecontact = [1, 8]
trigger2 = p2bodydist x = [-const240p(8), ceil(0.5 * (55 - const(size.ground.front)))]
trigger2 = p2dist y = [ceil(0.5 * -131), const240p(8)]
trigger2 = movehit && numtarget
trigger2 = enemynear, gethitvar(hittime) >= 7
trigger2 = random < (25 * (ailevel ** 2.0 / 64.0))
;
trigger3 = ctrl || stateno = 100
trigger3 = p2bodydist x = [-const240p(8), (55 + ((7 * enemynear, vel x) * p2statetype = A)) - const(size.ground.front)]
trigger3 = p2dist y = [-131, -8 - (enemynear, vel y * (enemynear, vel y > 0))]
trigger3 = enemynear, statetype = A && enemynear, hitfall
;trigger3 = !(enemynear, stateno = [820, 821])
trigger3 = random < (cond(power >= 1000, 50, 500) * (ailevel ** 2.0 / 64.0))

[State -1, AI 1070 Fast Kung Fu Knee]
type = ChangeState
value = 1050
triggerall = ailevel
triggerall = roundstate = 2
triggerall = numenemy
triggerall = p2statetype != L && p2stateno != 5120 && p2stateno != 5201
triggerall = statetype != A
triggerall = p2statetype != C
; startup = 9
;Clsn1: 1
; Clsn1[0] =  30,-80,  9,-49
; condition
trigger1 = ctrl || stateno = 100
trigger1 = p2bodydist x = [-const240p(8), 62 + 7 * (vel x + enemynear, vel x) - const(size.ground.front)]
trigger1 = p2dist y = [-94 - (9 * enemynear, vel y), const240p(8) - (enemynear, vel y)]
trigger1 = (p2stateno != [120, 155])
trigger1 = enemynear, vel x >= 0 || var(47)
trigger1 = enemynear, vel y > const240p(-2) || var(47)
trigger1 = p2movetype = A || p2statetype = A
trigger1 = (p2bodydist x > 0) && (facing != enemynear, facing)
trigger1 = random < (50 * (ailevel ** 2.0 / 64.0))
; condition
trigger2 = !ctrl
trigger2 = var(1)
trigger2 = movecontact = [1, 8]
trigger2 = p2bodydist x = [-const240p(8), ceil(0.5 * (62 - const(size.ground.front)))]
trigger2 = p2dist y = [ceil(0.5 * -94), const240p(8)]
trigger2 = movehit && numtarget
trigger2 = p2statetype = A || enemynear, gethitvar(yvel) || enemynear, hitfall
trigger2 = random < cond((stateno = 200 || stateno = 230 || stateno = 400 || stateno = 430), 25, 200) * (ailevel ** 2.0 / 64.0)
; condition
trigger3 = ctrl || stateno = 100
trigger3 = p2bodydist x = [-const240p(8), (62 + ((7 * enemynear, vel x) * p2statetype = A)) - const(size.ground.front)]
trigger3 = p2dist y = [-94, -8 - (enemynear, vel y * (enemynear, vel y > 0))]
trigger3 = enemynear, statetype = A && enemynear, hitfall
;trigger3 = !(enemynear, stateno = [820, 821])
trigger3 = random < (cond(power >= 1000, 50, 500) * (ailevel ** 2.0 / 64.0))

;Far Kung Fu Zankou
[State -1, AI 1420 Far Kung Fu Zankou]
type = ChangeState
value = 1420
triggerall = ailevel
triggerall = roundstate = 2
triggerall = numenemy
triggerall = p2statetype != L && p2stateno != 5120 && p2stateno != 5201
triggerall = power >= 330
triggerall = !(enemynear, ctrl) && (enemynear, stateno != [120, 155])
; startup = 8
;Clsn1: 1
; Clsn1[0] =  34,-76,  4,-22
triggerall = p2bodydist x = [-const240p(8), (ceil(cond(!ctrl, (2.0 / 3.0), 1.0) * (144 - const(size.ground.front))))]
triggerall = p2dist y = [(ceil(cond(!ctrl, (2.0 / 3.0), 1.0) * -76)), const240p(8)]
;
trigger1 = ctrl || stateno = 100
trigger1 = statetype != A
trigger1 = random < 0
;
trigger2 = !ctrl
trigger2 = var(1)
trigger2 = movecontact = [1, 8]
trigger2 = enemynear, gethitvar(hittime) >= 8
trigger2 = !((target, statetype = A) || (target, gethitvar(yvel)) || (target, hitfall))
trigger2 = random < cond((stateno = 200 || stateno = 230 || stateno = 400 || stateno = 430), 25, 100) * (ailevel ** 2.0 / 64.0)

;Fast Kung Fu Palm (1/3 super bar)
[State -1, AI 1020 Fast Kung Fu Palm]
type = ChangeState
value = 1020
triggerall = ailevel
triggerall = roundstate = 2
triggerall = numenemy
triggerall = p2statetype != L && p2stateno != 5120 && p2stateno != 5201
triggerall = power >= 330
triggerall = !(enemynear, ctrl) && (enemynear, stateno != [120, 155])
; startup = 11
triggerall = p2bodydist x = [-const240p(8), ceil((cond(!ctrl, (2.0 / 3.0), 1.0) * (128 - const(size.ground.front))))]
triggerall = p2dist y = [ceil((cond(!ctrl, (2.0 / 3.0), 1.0) * -66)), const240p(8)]
;
trigger1 = ctrl || stateno = 100
trigger1 = statetype != A

trigger1 = random < (25 * (ailevel ** 2.0 / 64.0))
;
trigger2 = !ctrl
trigger2 = var(1)
trigger2 = movecontact = [1, 8]
trigger2 = movehit && numtarget
trigger2 = enemynear, gethitvar(hittime) >= 11
trigger2 = random < cond((stateno = 200 || stateno = 230 || stateno = 400 || stateno = 430), 25, 250) * (ailevel ** 2.0 / 64.0)

;Fast Kung Fu Blow (1/3 super bar)
[State -1, AI 1220 Fast Kung Fu Blow]
type = ChangeState
value = 1220
triggerall = ailevel
triggerall = roundstate = 2
triggerall = numenemy
triggerall = p2statetype != L && p2stateno != 5120 && p2stateno != 5201
triggerall = power >= 330
triggerall = !(enemynear, ctrl) && (enemynear, stateno != [120, 155])
; startup = 9
;Clsn1: 2
; Clsn1[0] = -14,-72, 17,-55
; Clsn1[1] =  44,-72, 91,-45
triggerall = p2bodydist x = [-const240p(8), (ceil(cond(!ctrl, (2.0 / 3.0), 1.0) * (91 - const(size.ground.front))))]
triggerall = p2dist y = [(ceil(cond(!ctrl, (2.0 / 3.0), 1.0) * -72)), const240p(8)]
;
trigger1 = ctrl || stateno = 100
trigger1 = statetype != A
trigger1 = random < 0
;
trigger2 = !ctrl
trigger2 = var(1)
trigger2 = movecontact = [1, 8]
trigger2 = p2statetype != A
trigger2 = !moveguarded
trigger2 = numtarget
trigger2 = enemynear, gethitvar(hittime) >= 9
trigger2 = !((target, statetype = A) || (target, gethitvar(yvel)) || (target, hitfall))
trigger2 = random < cond((stateno = 200 || stateno = 230 || stateno = 400 || stateno = 430), 25, 100) * (ailevel ** 2.0 / 64.0)

;---------------------------------------------------------------------------
;Triple Kung Fu Palm (uses one super bar)
[State -1, AI 3000 Triple Kung Fu Palm]
type = ChangeState
value = 3000
triggerall = ailevel
triggerall = roundstate = 2
triggerall = numenemy
triggerall = p2statetype != L && p2stateno != 5120 && p2stateno != 5201
triggerall = power >= 1000
triggerall = !(enemynear, ctrl) && (enemynear, stateno != [120, 155])
; startup = 13
;Clsn1: 1
; Clsn1[0] =  68,-71,  9,-40
triggerall = p2bodydist x = [-const240p(8), (ceil(cond(!ctrl, (2.0 / 3.0), 1.0) * (91 - const(size.ground.front))))]
triggerall = p2dist y = [(ceil(cond(!ctrl, (2.0 / 3.0), 1.0) * -72)), const240p(8)]
;
trigger1 = ctrl || stateno = 100
trigger1 = statetype != A
trigger1 = random < (25 * (ailevel ** 2.0 / 64.0))
;
trigger2 = statetype != A
trigger2 = hitdefattr = SC, NA, SA, HA
trigger2 = (stateno != [3000,3050])
trigger2 = !(stateno = 440)
trigger2 = movehit && numtarget
trigger2 = enemynear, gethitvar(hittime) >= 13
trigger2 = !((target, statetype = A) || (target, gethitvar(yvel)) || (target, hitfall))
trigger2 = movecontact = [1, 8]
trigger2 = random < cond((hitdefattr = SC, NA), 25, 200) * (ailevel ** 2.0 / 64.0)
;
trigger3 = stateno = 1310 || stateno = 1330 ;From blocking
trigger3 = p2bodydist x = [-const240p(8), (112 - const(size.ground.front))]
trigger3 = p2dist y = [-71, const240p(8)]
trigger3 = random < (25 * (ailevel ** 2.0 / 64.0))

;---------------------------------------------------------------------------
;Smash Kung Fu Upper (uses one super bar)
[State -1, AI 3050 Smash Kung Fu Upper]
type = ChangeState
value = 3050
triggerall = ailevel
triggerall = roundstate = 2
triggerall = numenemy
triggerall = p2statetype != L && p2stateno != 5120 && p2stateno != 5201
triggerall = power >= 1000
triggerall = statetype != A
; startup = 7
;Clsn1: 1
; Clsn1[0] =  30,-40, 55,-131
;
trigger1 = ctrl || stateno = 100 || ((stateno = 120 || stateno = 130 || stateno = 131) && random < (2 * (ailevel ** 2.0)))
trigger1 = p2bodydist x = [-const240p(8) + (7 * enemynear, vel x), 55 + (7 * enemynear, vel x) - const(size.ground.front)]
trigger1 = p2dist y = [-131 - (enemynear, vel y), const240p(8) - (enemynear, vel y)]
trigger1 = (p2stateno != [120, 155])
trigger1 = enemynear, vel x >= 0 || var(47)
trigger1 = enemynear, vel y > const240p(-2) || var(47)
trigger1 = p2movetype = A || p2statetype = A
trigger1 = (p2bodydist x > 0) && (facing != enemynear, facing)
trigger1 = !((enemynear, statetype = A) && (!(enemynear, vel x)) && (enemynear, movetype != A))
trigger1 = random < (100 * (ailevel ** 2.0 / 64.0))
;
trigger2 = hitdefattr = SC, NA, SA, HA
trigger2 = stateno != [3050,3100)
trigger2 = movecontact
trigger2 = p2bodydist x = [-const240p(8), ceil(0.5 * (55 - const(size.ground.front)))]
trigger2 = p2dist y = [ceil(0.5 * -131), const240p(8)]
trigger2 = movehit && numtarget
trigger2 = enemynear, gethitvar(hittime) >= 7
trigger2 = !(hitdefattr = SC, NA)
trigger2 = !(stateno = 1020) && !(stateno = [1400, 1420])
trigger2 = !(stateno = 3000 && animelemtime(14) < 0)
trigger2 = random < (300 * (ailevel ** 2.0 / 64.0))
;
trigger3 = stateno = 1310 || stateno = 1330 ;From blocking
trigger3 = p2bodydist x = [-const240p(8), ceil(0.5 * (55 - const(size.ground.front)))]
trigger3 = p2dist y = [ceil(0.5 * -71), const240p(8)]
trigger3 = ((enemynear, vel x >= 0) && (enemynear, vel y >= 0)) || numtarget
trigger3 = p2movetype = A || p2statetype = A
trigger3 = random < (500 * (ailevel ** 2.0 / 64.0))
;
trigger4 = ctrl || stateno = 100
trigger4 = p2bodydist x = [-const240p(8), (55 + ((7 * enemynear, vel x) * p2statetype = A)) - const(size.ground.front)]
trigger4 = p2dist y = [-131, -8 - (enemynear, vel y * (enemynear, vel y > 0))]
trigger4 = enemynear, statetype = A && enemynear, hitfall
trigger4 = !(enemynear, stateno = [820, 821])
trigger4 = random < (500 * (ailevel ** 2.0 / 64.0))

;---------------------------------------------------------------------------
;Taunt
[State -1, AI 195 Taunt]
type = ChangeState
value = 195
triggerall = ailevel
triggerall = roundstate = 2
triggerall = numenemy
triggerall = p2statetype != L && p2stateno != 5120 && p2stateno != 5201
trigger1 = statetype != A
trigger1 = ctrl
trigger1 = p2movetype = H && (p2statetype = A || p2statetype = L)
trigger1 = p2bodydist x > const240p(160)
trigger1 = random < (50 * (ailevel ** 2.0 / 64.0))