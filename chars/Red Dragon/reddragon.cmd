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
;   time = time (optional -- defaults to 15 if omitted)
;
; - some_name
;   A name to give that command. You'll use this name to refer to
;   that command in the state entry, as well as the CNS. It is case-
;   sensitive (QCB_a is NOT the same as Qcb_a or QCB_A).
;
; - command
;   list of buttons or directions, separated by commas.
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
;   You can combine them:
;     eg. command = ~30$D, a+b     ;hold D, DB or DF for 30 ticks, release,
;                                  ;then press a and b together
;   It's recommended that for most "motion" commads, eg. quarter-circle-fwd,
;   you start off with a "release direction". This matches the way most
;   popular fighting games implement their command detection.
;
; - time (optional)
;   Time allowed to do the command, given in game-ticks. Defaults to 15
;   if omitted
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
; 
;==================================================================================
;======| RELACIONADO � AI - AI RELATED |===========================================
;==================================================================================

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
; Another important point to make, is that if you want to add additional
; definitions for any of these basic command names, then there are limits on
; what kind of parameters you can use, in order to ensure the reliability of
; the helper method.  That is, if you redefine any of these first 11 commands,
; then you must follow these rules when doing so:
; - Don't use any command string that includes any tildes. (e.g. no "~x",
;   no "~30D")
; - In the command string, don't include any direction that isn't preceeded by
;   a slash. (e.g. no "F", no "$D")
; - Don't put any non-slashed buttons in a command string overloading one of
;   the Hold Dir command names.
; - Using a command string that includes any commas (e.g. no "a,b"), and/or
;   setting the time parameter to greater than 1, may be safe, but I wouldn't
;   risk it.
; An example of what is permissible, is redefining the "z" button like so:
;	[Command]
;	name = "z"
;	command = y+b
;	time = 1
; Other than that particular common type of redefinition, it's probably best
; to simply avoid adding definitions for these 11 command names altogether.
; And remember, this paragraph just has to do with the helper method.  You'll
; still need to make changes to the XOR code, no matter what type of overloading
; you use with the commands used by it.
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
name = "back"
command = B
time = 1

[Command]
name = "fwd"
command = F
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

[Command]
name = "recovery2" ;Required (do not remove)
command = y+z
time = 1

[Command]
name = "recovery2" ;Required (do not remove)
command = x+z
time = 1

[Command]
name = "recovery2" ;Required (do not remove)
command = a+b
time = 1

[Command]
name = "recovery2" ;Required (do not remove)
command = b+c
time = 1

[Command]
name = "recovery2" ;Required (do not remove)
command = a+c
time = 1

; Here add matching commands for any moves that must never be used randomly
; by the computer, such as suicide moves and super moves, and add the pairs
; to the XOR VarSet controller in State -3.

; If you're desperate to make sure that the AI always gets turned on as soon
; as possible, you can add more equivalents for your own commands here too,
; and add to the XOR VarSet controller's triggers accordingly.  You should
; use button-only commands before using any commands with directional
; components, as the latter apparently doesn't work in Linux Mugen 2002.04.14.

; And of course, if you've run out of unique command labels (Mugen allows
; 128), you can remove as many of these as you want.  You'll of course need
; to modify the XOR VarSet controller's triggers accordingly, but Mugen
; will let you know if you forget to do so. :)

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
name = "recovery" ;Required (do not remove)
command = x+y
time = 1

[Command]
name = "recovery"
command = y+z
time = 1

[Command]
name = "recovery"
command = x+z
time = 1

[Command]
name = "recovery"
command = a+b
time = 1

[Command]
name = "recovery"
command = b+c
time = 1

[Command]
name = "recovery"
command = a+c
time = 1

;-| Dir + Button |---------------------------------------------------------
[Command]
name = "back_x"
command = /$B,x
time = 1

[Command]
name = "back_y"
command = /$B,y
time = 1

[Command]
name = "back_z"
command = /$B,z
time = 1

[Command]
name = "down_x"
command = /$D,x
time = 1

[Command]
name = "down_y"
command = /$D,y
time = 1

[Command]
name = "down_z"
command = /$D,z
time = 1

[Command]
name = "fwd_x"
command = /$F,x
time = 1

[Command]
name = "fwd_y"
command = /$F,y
time = 1

[Command]
name = "fwd_z"
command = /$F,z
time = 1

[Command]
name = "up_x"
command = /$U,x
time = 1

[Command]
name = "up_y"
command = /$U,y
time = 1

[Command]
name = "up_z"
command = /$U,z
time = 1

[Command]
name = "back_a"
command = /$B,a
time = 1

[Command]
name = "back_b"
command = /$B,b
time = 1

[Command]
name = "back_c"
command = /$B,c
time = 1

[Command]
name = "down_a"
command = /$D,a
time = 1

[Command]
name = "down_b"
command = /$D,b
time = 1

[Command]
name = "down_c"
command = /$D,c
time = 1

[Command]
name = "fwd_a"
command = /$F,a
time = 1

[Command]
name = "fwd_b"
command = /$F,b
time = 1

[Command]
name = "fwd_c"
command = /$F,c
time = 1

[Command]
name = "up_a"
command = /$U,a
time = 1

[Command]
name = "up_b"
command = /$U,b
time = 1

[Command]
name = "up_c"
command = /$U,c
time = 1

;-| Dir |--------------------------------------------------------------------

[Command]
name = "up"
command = $U
time = 1

[Command]
name = "down"
command = $D
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

;==================================================================================
;======| RELACIONADO � AI - AI RELATED |===========================================
;==================================================================================

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

; This is generally the best place to put most of your AI directives.  For
; example, this controller would only be executed when the CPU is in control:
;
; [State -1, Haha!]
; type = ChangeState
; trigger1 = var(0) ; (Or use "var(59)>0" if you've chosen not to
;                   ; use the Simplifier variable/controller.)
; trigger1 = ctrl
; trigger1 = (StateType = S)
; trigger1 = (MoveType = I)
; trigger1 = (P2MoveType = H)
; trigger1 = (NumEnemy = 1)
; trigger1 = (Enemy,GetHitVar(HitTime) > 60)
; trigger1 = (PrevStateNo != 195)
; trigger1 = (Random < 99)
; value = 195

; And of course, most human-only command-based ChangeStates also belong
; in State -1.  For example, this move would only be performable by a human:
;
; [State -1, Death Before Dishonor]
; type = ChangeState
; trigger1 = (command = "suicide")
; trigger1 = !var(0) ; (Or use "var(59)<1" if you've chosen not to
;                    ; use the Simplifier variable/controller.)
; trigger1 = ctrl
; trigger1 = (StateType != A)
; trigger1 = (MoveType = I)
; value = {suicide state number}

[State -1, Control Helper Check]
type = ChangeState
trigger1 = IsHelper(9998)
value = 9998

;==================================================================================
;==================================================================================
;==================================================================================

;===========================================================================
;---------------------------------------------------------------------------
[State -1, Breath (fullscreen)]
type = ChangeState
value = 2200
triggerall = var(59) < 1
triggerall = var(5) = 1 || (hitshakeover && stateno = [9100, 9105])
triggerall = stateno != 9000
trigger1 = command = "holdup"
trigger1 = command = "z"
trigger1 = var(3) := 0 || 1
trigger1 = var(0) := 0 || 1
trigger1 = var(1) := 0 || 1

[State -1, Breath (side)]
type = ChangeState
value = 2100
triggerall = var(59) < 1
triggerall = var(5) = 1 || (hitshakeover && stateno = [9100, 9105])
triggerall = stateno != 9000
trigger1 = command = "holdup"
trigger1 = command = "y"
trigger1 = var(3) := 0 || 1
trigger1 = var(0) := 0 || 1
trigger1 = var(1) := 0 || 1

[State -1, Breath (top-down)]
type = ChangeState
value = 2000
triggerall = var(59) < 1
triggerall = var(5) = 1 || (hitshakeover && stateno = [9100, 9105])
triggerall = stateno != 9000
trigger1 = command = "holdup"
trigger1 = command = "x"
trigger1 = var(3) := 0 || 1
trigger1 = var(0) := 0 || 1
trigger1 = var(1) := 0 || 1

[State -1, Undead Summoning]
type = ChangeState
value = 1400
triggerall = var(59) < 1
triggerall = var(5) = 1
triggerall = stateno != [9000, 9100]
trigger1 = command = "holddown"
trigger1 = command = "b"
trigger1 = var(21) > 0
trigger1 = var(3) := 0 || 1
trigger1 = var(0) := 0 || 1

[State -1, Slam]
type = ChangeState
value = 1300
triggerall = var(59) < 1
triggerall = var(5) = 1
triggerall = stateno != [9000, 9100]
triggerall = command = "holddown"
trigger1 = command = "a"
trigger1 = command = "c"
trigger1 = var(1) := 0 || 1
trigger1 = var(3) := 0 || 1
trigger2 = command = "a"
trigger2 = var(1) := facing || 1
trigger2 = var(3) := 0 || 1
trigger3 = command = "c"
trigger3 = var(1) := -facing || 1
trigger3 = var(3) := 0 || 1

[State -1, Scorching Spheres]
type = ChangeState
value = 1100
triggerall = var(59) < 1
triggerall = var(5) = 1
triggerall = stateno != [9000, 9100]
trigger1 = command = "a"
trigger1 = command = "c"
trigger1 = var(25) > 0
trigger1 = var(3) := 0 || 1

[State -1, Fire Bolt]
type = ChangeState
value = 1000
triggerall = var(59) < 1
triggerall = var(5) = 1
triggerall = stateno != [9000, 9100]
triggerall = command = "holddown"
trigger1 = command = "x"
trigger1 = command = "z"
trigger1 = fvar(0) := 0 || 1
trigger1 = var(1) := 10 || 1
trigger2 = command = "x"
trigger2 = fvar(0) := 0 || 1
trigger2 = var(1) := 10 + facing || 1
trigger3 = command = "z"
trigger3 = fvar(0) := 0 || 1
trigger3 = var(1) := 10 - facing || 1

[State -1, Fire Wall]
type = ChangeState
value = 1000
triggerall = var(59) < 1
triggerall = var(5) = 1
triggerall = stateno != [9000, 9100]
trigger1 = command = "x"
trigger1 = command = "z"
trigger1 = fvar(0) := 0 || 1
trigger1 = var(1) := 0 || 1
trigger2 = command = "x"
trigger2 = fvar(0) := 0 || 1
trigger2 = var(1) := facing || 1
trigger3 = command = "z"
trigger3 = fvar(0) := 0 || 1
trigger3 = var(1) := -facing || 1

[State -1, Deadfall]
type = ChangeState
value = 600
triggerall = var(59) < 1
triggerall = var(5) = 1
triggerall = stateno != [9000, 9100]
trigger1 = command = "y"
trigger1 = var(3) := 0 || 1
trigger1 = var(0) := 0 || 1

[State -1, Swipe]
type = ChangeState
value = 200
triggerall = var(59) < 1
triggerall = var(5) = 1
triggerall = stateno != [9000, 9100]
trigger1 = command = "a"
trigger1 = var(3) := 0 || 1
trigger1 = var(0) := facing || 1

[State -1, Bite]
type = ChangeState
value = 800
triggerall = var(59) < 1
triggerall = var(5) = 1
triggerall = stateno != [9000, 9100]
trigger1 = command = "b"
trigger1 = var(3) := 0 || 1

[State -1, Swipe]
type = ChangeState
value = 200
triggerall = var(59) < 1
triggerall = var(5) = 1
triggerall = stateno != [9000, 9100]
trigger1 = command = "c"
trigger1 = var(3) := 0 || 1
trigger1 = var(0) := -facing || 1

;===========================================================================
;---------------------------------------------------------------------------
; AI

[State AI, Action Select]
type = VarSet
trigger1 = var(20) < 2
var(58) = random%19

[State AI, Action Select]
type = VarSet
trigger1 = var(20) > 1
var(58) = random%21

[State AI, Summon Select]
type = VarSet
trigger1 = !var(50)
trigger1 = stateno != 5900
var(50) = ifelse(var(21) > 0, ifelse(var(25) > 0, random%2 + 1, 2), ifelse(var(25) > 0, 1, -1))

[State AI, Idle]
type = VarSet
trigger1 = p2statetype = L
trigger2 = p2statetype = A
trigger2 = p2movetype = H
trigger3 = p2dist x != [-160, 160]
trigger4 = random*fvar(10) > 100
var(58) = -1

[State AI, Skeleton Timer]
type = VarAdd
trigger1 = Var(49) > 0
trigger1 = numhelper(4000)
var(49) = -10*var(21)/numhelper(4000)

[State AI, Skeleton Timer]
type = VarSet
trigger1 = Var(49) > 0
trigger1 = !numhelper(4000)
var(49) = 0

[State AI, Movement]
type = VarSet
trigger1 = !var(56)
trigger1 = var(56) := 300 + random/2
trigger1 = var(54) := 50 + random/50
trigger2 = abs(p2dist x) > 350
trigger2 = var(56) := 300 + random/2
trigger2 = var(54) := 50 + random/50
var(55) = random/5 - 100

[State AI, Movement]
type = VarSet
trigger1 = 1
var(53) = floor(vel x*2)

[State AI, Movement]
type = VarAdd
trigger1 = var(56)
var(56) = -1

[State AI, Breath]
type = ChangeState
value = 2000 + (random%3)*100
triggerall = var(59) > 0
triggerall = !var(20)
triggerall = var(5) = 1 || (hitshakeover && stateno = [9100, 9105])
triggerall = stateno != 9000
trigger1 = var(51) = 0
trigger1 = life < lifemax*0.3
trigger1 = var(3) := 0 || 1
trigger1 = var(0) := 0 || 1
trigger1 = var(1) := 0 || 1
trigger1 = var(51) := 1

[State AI, Breath]
type = ChangeState
value = 2000 + (random%3)*100
triggerall = var(59) > 0
triggerall = var(20) > 1
triggerall = var(5) = 1
triggerall = stateno != [9000, 9100]
trigger1 = var(58) = [19, 20]
trigger1 = var(3) := 0 || 1
trigger1 = var(0) := 0 || 1
trigger1 = var(1) := 0 || 1

[State AI, Undead Summoning]
type = ChangeState
value = 1400
triggerall = var(59) > 0
triggerall = var(5) = 1
triggerall = stateno != [9000, 9100]
triggerall = var(52)
triggerall = var(50) = 2
trigger1 = var(49) < 1
trigger1 = !numhelper(1155)
trigger1 = var(3) := 0 || 1
trigger1 = var(0) := 0 || 1
trigger1 = var(50) := ifelse(random%5 < 3 && var(25) > 0, 1, 2)

[State AI, Scorching Spheres]
type = ChangeState
value = 1100
triggerall = var(59) > 0
triggerall = var(5) = 1
triggerall = stateno != [9000, 9100]
triggerall = var(52)
triggerall = var(50) = 1
trigger1 = var(49) < 1
trigger1 = !numhelper(1155)
trigger1 = var(3) := 0 || 1
trigger1 = var(50) := ifelse(random%5 < 3 && var(21) > 0, 2, 1)

[State AI, Slam]
type = ChangeState
value = 1300
triggerall = var(59) > 0
triggerall = var(5) = 1
triggerall = stateno != [9000, 9100]
trigger1 = var(58) = [14,18]
trigger1 = enemy, statetype = S || enemy, statetype = C
trigger1 = var(3) := 0 || 1
trigger1 = var(1) := ifelse(random%5 < 3, 0, ifelse(enemy, pos x < pos x, facing, -facing)) || 1

[State AI, Deadfall]
type = ChangeState
value = 600
triggerall = var(59) > 0
triggerall = var(5) = 1
triggerall = stateno != [9000, 9100]
trigger1 = var(58) = [11,13]
trigger1 = var(3) := 0 || 1
trigger1 = var(0) := 0 || 1

[State AI, Fire Bolt]
type = ChangeState
value = 1000
triggerall = var(59) > 0
triggerall = var(5) = 1
triggerall = stateno != [9000, 9100]
trigger1 = var(58) = [8,10]
trigger1 = fvar(0) := 0 || 1
trigger1 = var(1) := random%3 + 9 || 1

[State AI, Fire Wall]
type = ChangeState
value = 1000
triggerall = var(59) > 0
triggerall = var(5) = 1
triggerall = stateno != [9000, 9100]
trigger1 = var(58) = [5,7]
trigger1 = fvar(0) := 0 || 1
trigger1 = var(1) := random%3 - 1 || 1

[State AI, Bite]
type = ChangeState
value = 800
triggerall = var(59) > 0
triggerall = var(5) = 1
triggerall = stateno != [9000, 9100]
trigger1 = var(58) = [3,4]
trigger1 = var(3) := 0 || 1

[State AI, Swipe]
type = ChangeState
value = 200
triggerall = var(59) > 0
triggerall = var(5) = 1
triggerall = stateno != [9000, 9100]
trigger1 = var(58) = [0,2]
trigger1 = var(3) := 0 || 1
trigger1 = var(0) := ifelse(random%2, -1, 1) || 1

