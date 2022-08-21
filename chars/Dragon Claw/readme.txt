====================================
============Dragon Claw==============
====================================
Version 1.1


Kami Saku and Dragon Claw are copyright, Reuben Kee 2005, 2006
This is a demo on the MUGEN engine only, any sales associated with this character is not allowed and will be brought to court.
By Reu:  Reuy@email.com
For Winmugen/Linuxmugen only.



IMPORTANT CHANGE YOU MUST MAKE TO YOUR MUGEN.CFG:

 ;Number of simultaneous afterimage effects allowed.
 ;Set to a lower number to save memory (minimum 1).
AfterImageMax = 8

 ;Maximum number of layered sprites that can be drawn.
 ;Set to a lower number to save memory (minimum 32).
LayeredSpriteMax = 128

 ;Maximum number of explods allowed in total. Note that hitsparks
 ;also count as explods.
 ;Set to a lower number to save memory (minimum 8).
ExplodMax = 600




Changelog Version 1.1:

- Counterblow now has visual and audible warning to opponent.
- DC cannot do a special move from up+hk in his kick chain anymore as it resulted in him floating.
- Control taken away from fly in after MSSM Sun Cry to prevent afterimage + mssm bug.
- Throws now use proper hitup + hit diagup animations.
- Redid explosion animation for end of MSSM Sun Cry.
- Now possible to cancel crouching attacks into special moves.
- Headstomp limit check now on cancels from normal moves.
- Posfix for heavy kick
- Bad exit from air super fixed.
- MSSM flash step cancellable bug fixed.
- Redid animation for charge up.
- CVS style super jumps and unique animations added.
- Redid portait. Position now compatible with DJ-VAN's EVE screenpack.
- MSSM sun cry starting sound effect redone. Move also burns now.
- Headstomp limit fixed.
- Homing flight now able to be performed in air and near edge of screen
- Redid standing animation, new max level standing animation.
- Secret mode added.

AI related:
- Will remember if he has just performed a missed throw, used to eliminate consecutive throw misses.
- Can now differentiate if he has managed to roll or get behind the opponent, used to reduce rolling too often.
- Will decide to become offensive if enemy is wide open. AI is now more offensive.
- Several misc tweaks to reactions



================
FEATURES:

- Original character design and animation.
- Original rendered visual special effects.
- Original sound effects.
- Original aerial rave system: AERIAL FOLLOW-UP.
- Original hit counter cancel system: HIT BREAK.
- Original guarding counter system: ADVANCING PARRY.
- And, the MSSM SYSTEM.



=================
WHAT IS AERIAL FOLLOW-UP?:

Aerial Follow-Up is the ability to track your opponent into the air to continue hitting him. After you press down + hp, do the command for HOMING FLIGHT (qcb + kick), and you will follow him up into the air.



================
WHAT IS HIT BREAK?:

Hit Break occurs at the instant that both you and the opponent clash attacks at exactly the same time. Both you and the opponent will be paused in the attack, allowing either of you to continue for a chain or cancel.



================
WHAT IS ADVANCING PARRY?:

Advancing Parry is performed at the instant that you guard a hit and press any attack button. Once you have succesfully parried 3 hits in a row, you will perform a counter attack move, dependant on whether you pressed either punch or kick last. The counter attack will cost you 500 power.



=================
WHAT IS MSSM?:

Meta Super Special Moves are special alternate versions of a super move. These can be activated by super cancelling 3 super moves together, producing the MSSM version of the 3rd super move. Everytime you do a super move, there is also a 10% chance that you will activate the MSSM version.













================
SPECIAL MOVES:

-Homing Flight: qcb+ k (cancel from ground launcher to air combo) (can be done near edge of screen)
*Release for auto homing, hold direction to direct his flight
DC leaps onto a nearby wall for an extra kick to chase after a flying or grounded opponent. 

-Crescent Moon Slash: f,d,df + p
DC will swing his blades as he lifts off the ground, spinning above the ground until he does one final slash.

-Sun Blast: (in air) qcf+ p (hold direction)
DC concentrates to heat up his core, causing an explosion which propels him in the direction being held for a twirling attack.

-Flash Step: qcb+p
By heating his armor and exciting his molecules, dc is able to move at an accelerated rate and execute a slash with blinding speed.
*Will pass through projectiles

-Counter Blow: qcf + kick 
*lk to appear on the left of the screen, mk for right, hk for behind opponent
DC heats up his armor till an extremely volatile state, almost any attack from an enemy which strikes his armor will cause an explosion, blinding his opponent and allowing him to sneak up behind for an attack.




=================
SUPER MOVES:

-Heaven's Sword: qcb X2 + k (can be done in air near a wall)
After a quick leap to a nearby wall, DC will take flight by heating the blades on his back to properl him into the skies, then down from the heavens for a massive attack.

-Flash Burst: qcb X2 + p
While his molecules are excited and DC is moving at blinding speed, he will cause his blade to vibrate at an even higher frequency, performing a single slash which seems like several due to the million slight movements which his blade is moving at.

-Full Moon Slash: qcf X2 + p
Striking his blade against the floor to cause great resistance, DC will get extra torque upon release, spinning his blades as he slices his opponent.

-Sun Cry: qcf X2 + p (in air)
Heating up his core to extreme temperatures, DC causes a very controlled implosion which grants him the inertia for a devastating twirling attack.



==================
MISC + EXTRA MOVES:

-Mobile dodge: lp + lk (hold backward to dodge backwards)
DC is vulnerable to throws during rolls.

-Charge up: mp + mk
DC Heats focuses energy on his blades to draw more power from within.

-Head Stomp: down + mk (in air)
Useful for extending air combos.


================
GROUND CHAINS:

lp, forward + lp, mp, forward + mp, hp, forward + hp

lk, forward + lk, mk, forward + mk, hk, forward + hk, up + lk, down + mk, up + hk (input for next move must be done right when move hits)

Ground launcher: down+ hp



================
AIR CHAINS:

lp, lk, mp, mk, hp, hk

lp, lk, mp, mk, down+mk, hp







===================
TIPS:

Know your moves. DC is not a projectile oriented fighter, but he doesn't need them. Use flash step and run away tactics to both avoid oncoming projectiles and pressure your opponent into your hit zone.

Counter blow also works against projectiles. Suprise a projectile abusing opponent.






=======================
SECRET MODE: Flame Wisp

If you seek to invoke the flame wisp, you must first embrace the fire's kiss.
Hold on to the desire for more power, and its might shall make your opponent cower.



=================
Thanks:

TMasta: For ideas and bugtesting.

P.o.t.S: For very detailed bug testing and suggestions and the cool palletes!

Valodim: For giving ideas to gameplay + graciously hosting DC and his vid on mugenguild.

Shadow: The number one Dragon Claw supporter :). For helping alot in bug testing.

DJ-VAN, N8, Berserk#1, P.o.t.S and Lady Kiki for DC's Palletes :)

Tenshin: For creating Kengang, which I learned to code from.

The Necromancer: For some really cool codes and ideas.

Everyone who's worked with me before, Kingtigre, Aiduzzi, The Dreamslayer, for the ideas and encouragement to keep me going.

The MUGEN Fighters Guild, all who run it with compassion, and all who contribute their work to the community. For keeping MUGEN alive after so many years.




Coding is fun, if Reu can code, so can you ;)