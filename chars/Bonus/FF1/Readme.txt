[Introduction]
You cannot control this yourself. It is for the enemy only.

[How to Play]
When the game starts, repeatedly press any of the x, y, or ab buttons.

[Various]
There is no sound.
To eliminate error messages, a 1-pixel image has been embedded where necessary.
It works on any stage, but because the background used is the same as the arm wrestling background,
if there is an image in the foreground of the stage, it will be displayed.
If you press right or left when you are attacked immediately after the match starts, a mysterious dust cloud will appear.
Considering team battles, winning increases your power gauge by 1000, and losing increases the opponent's gauge by 3000.

[Mechanism]
Immediately after the start, it jumps to stateno = 200 and attacks the entire screen with
attr = S, NA, guardflag = none to steal the opponent's state.
That's the mechanism.
Therefore, it will not activate against special characters (such as Apocalypse).
If it does not activate, it will end automatically. Probably.

Also, it doesn't work properly when using simul. It creates two arms.
I lack knowledge of triggers.
The time display is arbitrary.
When the match ends for reasons other than time running out, the time at that moment isn't displayed.
Also, it would be a bit more interesting if there were a score like in Metal Slug's train destruction, but
the processing is complicated, so I haven't created it at the moment.

It would be fun if the level could be selected during the intro, but
I can't get it to work properly.

[State 190];Difficulty Selection
type = VarSet
trigger1 = Time = 0
v = 4
value = ifelse(random<=300,1,0)

I've set it up like this. There's a 300/1000 chance of the level becoming Hard during the intro.

The win/loss is determined by var(2), and each time you press any of x, y, or a, var(2) increases by 1.
When the opponent presses a button, it decreases by 2 for Normal and 3 for Hard.

That alone is far too weak (because the opponent's button press is random),

[State 201]
type = Varadd
trigger1 = random <= 10
v = 2
value = -1

I added this as well.

If you only use one button against the opponent, I think it will be just the right strength.