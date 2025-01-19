============================================================

DATA:
Name: Red Dragon
Game: Dungeons & Dragons: Shadow Over Mystara
Author: Doggiedoo
Version: 1.02

============================================================

USAGE NOTES:

-IMPORTANT: Use Red only with his own stage, which is
 included in his character directory
 (RedDragon\Stages\...). Add him to your select.def file
 with the following line:

	...
 	RedDragon, stages/reddragonstage.def, includestage=0
	...

 Plus any other desired paramaters like music and order.


-The Red Dragon is a giant boss, like the Versus series 
 Apocalypse, Onslaught, and Abyss. Best used as a CPU
 opponent, not recommended for Watch mode (many of his
 attacks are unblockable, and AIs won't know how to evade
 them). His weak spot is his head; characters with strong
 air comboes will do well against him, as well as smaller
 characters with good evasive abilities.

-You can adjust his aggressiveness and stun resistence in
 the config.txt file. You may also wish to tweak his Attack
 and Defence ratings in reddragon.cns to make him a suitable
 challenge for your Mugen roster.

-The Config.txt file has many other options, such as a boss
 lifebar at the bottom of the screen, and control over
 Red's breath usage when played by the CPU.

============================================================

MOVELIST:

	x/z: Fire Wall

	x+z: Double Fire Wall

	y: Bombardment

	a/c: Claw Swipe

	a+c: Scorching Spheres

	b: Devour

	down + x/z: Fire Bolt

	down + x+z: Double Fire Bolt

	down + a/c: Slam

	down + a+c: Heavy Slam

	down + b: Undead Summoning

	up + x: Vertical Breath

	up + y: Horizontal Breath
		-hold left or right to breathe from that
		 side of the stage.

	up + z: Full Screen Breath




MOVE DESCRIPTIONS (SPOILER WARNING):

	Fire Wall:
	
	-Launches a small projectile that erupts into a
	 mobile column of fire for a few moments. Move to
	 the side to avoid. Red can move during this attack.

	Double Fire Wall:

	-Same as above, but using both hands. It is possible
	 to stay between both Fire Walls, but it's better to
	 quickly move away before they erupt. Red cannot
	 move with during this version.

	Bombardment:

	-Drops rocks from above; high damage and takes Red
	 off the screen for a while. Blockable, but wider
	 reach than Synn's version.

	Claw Swipe:

	-Horizontal swipe with either claw. Jump to avoid,
	 unless you can dash away fast enough.

	Scorching Spheres:

	-A small vortex of flame that will shoot waves of 3
	 fireballs at the nearest enemy over a period of
	 time. Used by the AI in round 2. Stay in the air or
	 dodge rhythmically to evade, while keeping an eye
	 on Red's other attacks. Number of waves can be
	 changed in the config.txt file. Only one Scorching
	 Sphere vortex or one set of skeletons can be active
	 at a time.

	Undead Summoning:

	-Calls a number of skeletons that will roam the
	 battlefield and attack Red's enemies. They can be
	 attacked and destroyed. Their attacks are
	 blockable, and include a stab, a jumping stab, and
	 2 slashes. While they don't do much damage
	 individually, they can make an opponent vulnerable
	 to Red's own attacks. Only one Scorching Sphere
	 vortex or one set of skeletons can be active at a
	 time.

	Devour:

	-Bite and chew for high damage. Red can move while
	 rearing back, and will try to follow you if she is
	 under AI control. Dash away as she stops to avoid.

	Fire Bolt:

	-A projectile from one of Red's hands to your
	 current position. Crouch and then jump over, or
	 stand and then dash under to evade, or just block
	 if you can afford the guard damage. Can juggle from
	 other attacks.

	Double Fire Bolt:

	-Same as above, but one projectile from each hand.
	 High damage if they both connect.

	Slam:

	-Red strikes the stage, knocking down any who are
	 close to the impact zone. Jump to avoid. Unlike
	 most moves of this type, this hits crouching
	 opponents.

	Heavy Slam:

	-Same as above, but with both arms. Affects the
	 whole stage and deals more damage, but is slower.

	Vertical Breath:

	-NOTE: All Breath attacks are instant death on all
	 but nigh-invulnerable opponents. Red is also
	 invulnerable while breathing fire. Breaths cannot
	 be performed while Earthshock is active, but can
	 otherwise be used to break out of stun.
	
	-Inhales, drawing opponents in, then breathes
	 downward. Dash out of the way when the screen
	 flashes to escape. Can be hit while inhaling, but
	 cannot be stunned.

	Horizontal Breath:

	-Moves to one side of the screen, dislodging rocks
	 from the ceiling. Most rocks will fall in the
	 corners, but a few will strike randomly around the
	 arena, and a few more will be aimed at Red's
	 enemies. Stay near the middle of the stage and
	 either block (for non-lethal chip damage) or play
	 dodgeball to minimise damage. Red will then inhale
	 and breathe fire across the stage. Large characters
	 may need to jump out of the way as he appears;
	 others can hide under his head once he starts
	 breathing and the rocks stop falling.

	-The rocks can be disabled in the config.txt file,
	 if desired.

	Full Screen Breath:

	-Moves into the background, bringing down rocks as
	 per his Horizontal Breath. He then breathes
	 directly into the screen. To avoid, hide behind the
	 rockls on either side of the stage once the
	 boulders have stopped falling.

	-The rocks can be disabled in the config.txt file.

============================================================

VERSION HISTORY:

-1.02:
	-Undead Summoning added, further options in the
	 config.txt file.
	-Scorching Spheres now fires multiple volleys before
	 disappearing. Number of volleys is configurable.
	-Guard damage on Bombardment increased.
	-Optional text intro/outro, see config.txt for
	 details.
	-Changed victory laugh sample.
	-Added Flamewing (Tower of Doom) palette, and
	 rearranged the others.
	-Cleaned out some unused sprites and sounds.

-1.00:
	-Initial Release.

============================================================

TO-DO LIST:

-Bug fixes/tweaks.

============================================================

CREDITS:

-Elecbyte for Mugen
-Winane for AI activation method
-Capcom and TSR for D&D: Shadow Over Mystara
-All who gave feedback and support

============================================================

