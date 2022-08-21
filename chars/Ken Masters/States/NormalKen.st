; _________________________________________
;| Ken by Phantom.of.the.Server & Jmorphman|
; ?
;==============================================================================================
;=======================================<INITIALIZE>============================================
;==============================================================================================
[StateDef 5900]
type = S

[State 5900, Int VarReset]
type = VarRangeSet
trigger1 = !time
fvalue = 0
first=1
last=39

[State 5900, Float VarReset]
type = VarRangeSet
trigger1 = !time
value = 0
first=2
last=49

[State 5900, Mode Detection]
type = VarSet
trigger1 = 1
var(40) = 0
ignoreHitPause = 1

[state 5900, dizzy threshold]
type = varset
trigger1 = !time
var(38) = IfElse(var(40)=2,150,IfElse(var(40)=1,100,120))

[State 5900, End]
type = ChangeState
trigger1 = time
value = 5901

