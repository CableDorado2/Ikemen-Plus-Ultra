; ______________________________
;| Ryu by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;================================================================================================
;========================================< MODE STATES >===========================================
;================================================================================================

;==========< PALETTE MODE SELECTION >==========
[Statedef 5900]
type = S
[State 5900, varreset]
type = varrangeset
trigger1 = !roundsexisted
value = 0
[State 5900, varreset]
type = varrangeset
trigger1 = !roundsexisted
fvalue = 0

[State 5900, Palette]
type = remappal
trigger1 = 1
source = 1, 1
dest = 1, palno

[State 5900, modevar]
type = varset
trigger1 = 1
var(1) = ifelse(palno = 9, 3, ifelse(palno >= 7, 2, 1))
[State 5900, End]
type = changestate
trigger1 = !time
value = ifelse(roundno = 1, 190, 0)
