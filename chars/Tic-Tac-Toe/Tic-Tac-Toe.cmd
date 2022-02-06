; <<<The CMD file.>>>
;================AI===================
;-| Painel de controle |-------
[Command]
name="x"
command=x
time=1
[Command]
name="y"
command=y
time=1
[Command]
name="z"
command=/z

[Command]
name="a"
command=a
time=1
[Command]
name="b"
command=b
time=1
[Command];
name="c"
command=c
time=1

[Command]
name="start"
command=s
time=1

[Command]
name="recovery"
command=x+y
time=1

;-| Movimentação |-----------------------------------------------
[Command]
name="down_a"
command=/$D,a
time=1

[Command]
name="down_b"
command=/$D,b
time=1

[Command]
name="holdfwd"
command=/$F
time=1

[Command]
name="holdback"
command=/$B
time=1

[Command]
name="holdup"
command=/$U
time=1

[Command]
name="holddown"
command=/$D
time=1

;---------------------------------------------------------------------------
[Statedef -1]

;Taunt
;’§”­
[State -1,Taunt]
type=Null
trigger1=Roundstate>2

;---------------------------------------------------------------------------
