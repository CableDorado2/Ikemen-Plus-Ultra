      _________________________________________________________________
======| Beterhans's Branch of Ken by Phantom.of.the.Server & Jmorphman |===========================
                                    [Dec.26.2015]

 - Contact:	Phantom.of.the.Server:	potsmugen@yahoo.com.br
		Jmorphman:		Jmorphman@aol.com
		Beterhans:		beter_hans@hotmail.com
 - Website:	Phantom.of.the.Server:	http://www.mugenguild.com/pots/
		Jmorphman:		http://network.mugenguild.com/jmorphman/
		Beterhans:		http://beterhans.blogspot.com/
 - Customized version of Capcom's Ken character, for MUGEN 1.0


=====<Features>=====

 - All the essential stuff
 - Details and moves taken from his various video game appearances
 - Gameplay mixed from several games, including CvS2, KOF, SFA3 and SFIII
 - Special intros versus Ryu and Terry Bogard (Normal/Master mode); Ryu, Evil Ryu, and M. Bison/Vega
   (Violent mode); and a one verus Guile (Master mode)
 - Special winpose versus Ryu (Normal/Master mode) when Ryu is defeated in the last round with a 
   Level 3 super combo
 - Special winpose versus Vega (Violent mode) when Vega/Bison is defeated in the last round
 - Special winpose when an opponent is defeated with a Shinryuken in Master mode
 - a Daigo like A.I. (Press Start and Heavy kick to select him for it)



=====<Mode Overview>=====

This character has three different modes:

<Normal Ken>
- Can perform EX moves

<Violent Ken>
- Has More moves
- No EX Moves

<Master Ken>
- Is basically a mix between the first two modes, except he cannot use EX moves
- special A.I. act like Daigo.



=====<.DEF Overview>=====

This char has four different .def files, here's what each one does:

<KEN.def>
The mode is selected via palette:

Palettes 1, 2, 3, 4, 5, 6  -> Normal Ken
Palettes 7, 8, 10, 11      -> Violent Ken
Palette  9, 12             -> Master Ken

To add him to your Mugen, add the following line to your select.def, under [Characters]:
Ken,

<NORMALKEN.def>
Only Normal Ken mode.
To add him to your Mugen, add the following line to your select.def, under [Characters]:
Ken/NormalKen.def,

<VIOLENTKEN.def>
Only Violent Ken mode.
To add him to your Mugen, add the following line to your select.def, under [Characters]:
Ken/ViolentKen.def,

<MASTERKEN.def>
Only Master Ken mode.
To add him to your Mugen, add the following line to your select.def, under [Characters]:
Ken/MasterKen.def,



=====<Movelist>=====

 U - up          x - light punch        a - light kick
 D - down        y - medium punch       b - medium kick
 F - forward     z - heavy punch        c - heavy kick
 B - back        p - any punch          k - any kick
 s - start       2p- two punches        2k- two kicks

 (Air) - Move must be performed in the air.
 (EX)  - Move has an EX version, performed by pressing two punch/kick buttons.
 (MAX) - Use two punch/kick buttons when performing a Super move to power it up.


=====<Normal Mode>=====

<NORMAL>

.Inazuma Kakato Wari			F + b
.Ushiro Mawashi Geri			F + c
.Target Combo				y, z			(near opponent)
.Jigoku Gurama:                		F/B + 2p		(near opponent)
.Tsukami Nage:				F/B + 2k		(near opponent)
.Jigoku Husha:				F/B + 2p		(Air, near opponent)


<SPECIAL>

.Hadoken (EX):         			D, DF, F, p
.Shoryuken (EX):			F, D, DF, p
.Tatsumaki Senpukyaku (EX):		D, DB, B, k
.Airborne Tatsumaki Senpukyaku (EX):	D, DB, B, k		(Air)
.Ryusenkyaku (EX):			B, D, DB, k
.Nata Otosi Geri:         		D, DF, F, a
.Kama Harai Geri:         		D, DF, F, b
.Osoto Mawashi Geri:			D, DF, F, c
    .Inazuma Kakato Wari:       	hold k			(after any non-EX Geri move)
.Fujin Sen Geri (EX only)		D, DF, F, 2k
.Zenpou Tenshi:				D, DB, B, p
.Zentou:				D, DB, B, s


<SUPER>

.Shoryureppa (HP for MAX):             	D, DF, F, D, DF, F, P
.Shinryuken :							D, DF, F, D, DF, F, k
.Shippu Jinraikyaku (HK for MAX):		D, DB, B, D, DB, B, k


<LV3 SUPER>

.Jouen Shinryuken:			D, DF, F, D, DF, F, 3p


<TEAM SUPER>
.Souryuken				D, DF, F, D, DF, F, p + k


<SYSTEM>

.Forward Dash:                  	F, F
   .Run:                        	hold
.Backward Dash:                 	B, B
.Low Jump:                      	tap U
.High Jump:                     	tap D, U
.Long Low Jump:                 	tap D, tap U            
.Sidestep:                      	a + x
   .Sidestep Attack:            	p / k
.Forward Roll:                  	F + a + x
.Backward Roll:                 	B + a + x
.Parry High:                    	tap F
.Parry Low:                     	tap D
.Air Parry:                     	tap F           	(Air)
.Power Charge:                  	hold b + y
.Alpha/Zero Counter:                DB, D, p / k 		(during standing or crouching guard)
.Custom Combo:                  	c + z           	(Air also)
.Fall Recovery:                 	2p / a + x      	(while falling and allowed)


=====<Violent Mode>=====

<NORMAL>

.Inazuma Kakato Wari			F + b
.Ushiro Mawashi Geri			F + c
.Seoi Nage:				F/B + 2p		(near opponent)
.Jigoku Gurama:                		F/B + 2k		(near opponent)
.Jigoku Husha:				F/B + 2k 		(Air, near opponent)


<SPECIAL>

.Hadoken:         			D, DF, F, p
.Shoryuken:				F, D, DF, p
.Tatsumaki Senpukyaku:			D, DB, B, k
.Airborne Tatsumaki Senpukyaku:		D, DB, B, k		(Air)
.Rasetsu Kyaku:				F, D, DF, k
.Nata Otosi Geri:         		D, DF, F, a
.Kama Harai Geri:         		D, DF, F, b
.Osoto Mawashi Geri:			D, DF, F, c
.Inazuma Kakato Wari:			hold k			(after any Geri move)


<LV1 SUPER>

.Shoryureppa (MAX):             	D, DF, F, D, DF, F, P
.Shinryuken (MAX):			D, DF, F, D, DF, F, k
.Shippu Jinraikyaku:			D, DB, B, D, DB, B, k


<LV2 SUPER>

.Kuzuryureppa:				D, DB, B, D, DB, B, 2k


<LV3 SUPER>

.Shinbu Messatsu:			D, DF, F, DF, D, DB, B, 2p


<SYSTEM>

.Forward Dash:                  	F, F
.Run:             	           	hold
.Backward Dash:                 	B, B
.Low Jump:                      	tap U
.High Jump:                     	tap D, U
.Long Low Jump:                 	tap D, tap U            
.Sidestep:                      	a + x
.Sidestep Attack:    	        	p / k
.Forward Roll:                  	F + a + x
.Backward Roll:                 	B + a + x
.Parry High:                    	tap F
.Parry Low:                     	tap D
.Air Parry:                     	tap F           	(Air)
.Power Charge:                  	hold b + y
.Zero Counter:                  	B, DB, D, p / k 	(during standing or crouching guard)
.Custom Combo:                  	c + z           	(Air also)
.Fall Recovery:                 	2p / a + x      	(while falling and allowed)



=====<Master Mode>=====

<NORMAL>

.Inazuma Kakato Wari			F + b
.Ushiro Mawashi Geri			F + c
.Target Combo				y, z			(near opponent)
.Jigoku Gurama:                		F/B + 2p		(near opponent)
.Tsukami Nage:				F/B + 2k		(near opponent)
.Jigoku Husha:				F/B + 2p		(Air, near opponent)


<SPECIAL>

.Hadoken:         			D, DF, F, p
.Shoryuken:				F, D, DF, p
.Tatsumaki Senpukyaku:			D, DB, B, k
.Airborne Tatsumaki Senpukyaku:		D, DB, B, k		(Air)
.Classic Airborne Tatsumaki Senpukyaku:	F, DF, D, DB, B, k	(Air)
.Ryusenkyaku:				B, D, DB, k
.Rasetsu Kyaku:				F, D, DF, k
.Nata Otosi Geri:         		D, DF, F, a
.Kama Harai Geri:         		D, DF, F, b
.Osoto Mawashi Geri:			D, DF, F, c
    .Inazuma Kakato Wari:       	hold k
.Zenpou Tenshi:				D, DB, B, p
.Zentou:				D, DB, B, s


<SUPER>

.Shoryureppa (MAX):             	D, DF, F, D, DF, F, P
.Shinryuken (MAX):			D, DF, F, D, DF, F, k
.Shippu Jinraikyaku (MAX):		D, DB, B, D, DB, B, k


<LV2 SUPER>

.Kuzuryureppa:				D, DF, F, DF, D, DB, B, 2k


<LV3 SUPER>

.Jouen Shinryuken:			D, DF, F, D, DF, F, 3p
.Shinbu Messatsu:			D, DF, F, DF, D, DB, B, 2p


<TEAM SUPER>
.Souryuken				D, DF, F, D, DF, F, p + k


<SYSTEM>

.Forward Dash:                  	F, F
.Run:					hold
.Backward Dash:                 	B, B
.Low Jump:                      	tap U
.High Jump:                     	tap D, U
.Long Low Jump:                 	tap D, tap U
.Sidestep:                      	a + x
.Sidestep Attack: 			p / k
.Forward Roll:                  	F + a + x
.Backward Roll:                 	B + a + x
.Parry High:                    	tap F
.Parry Low:                     	tap D
.Air Parry:                     	tap F           	(Air)
.Power Charge:                  	hold b + y
.Zero Counter:                  	B, DB, D, p / k 	(during standing or crouching guard)
.Custom Combo:                  	c + z           	(Air also)
.Fall Recovery:                 	2p / a + x      	(while falling and allowed)


=====<Move Details>=====

 - Both Inazuma Kakato Wari (all versions) and Ryusenkyaku are overheads.
 - Fujin Sen Geri can be juggled afterwards with any attack if both hits connect.
 - During Shinryuken, you can mash buttons increase the number of hits.
 - Kuzuryureppa can be juggled afterwards with any attack if the final hits connect.
 - Souryuken uses 3 powerbars, and can only be used in simul mode with Ryu by P.o.t.S. as your
   teammate; Ken and Ryu must be on opposite sides of the opponent for the attack to initiate.
   Additionally, Ryu must be in either Normal mode or Master mode; likewise, Ken must be in either
   Normal mode or Master mode.
 - Jouen Shinryuken can also be performed with this alternate command: B, DB, D, DF, F, 2p

=====<Gameplay Notes>=====

COMBO SYSTEM:
 - Some Normal attacks can be canceled into Special and Super moves
 - Some Special moves can be canceled into Super moves
 - Some Lv1 Super moves can be canceled into MAX Super moves
 - Cancelling a Special, Super move or Custom Combo into a Super move resets the juggle points
   but also reduces its damage


CUSTOM COMBO:
 - Removes cancellable attack restrictions and gives you a lot of freedom to combo them
 - Juggle limit is lifted
 - You can only use EX Special or Super moves from the point the character starts flashing faster
   and brighter, and doing so ends Custom Combo
 - Gives you a short invulnerability window at the start



=====<Version History>=====
<Dec.26 2015>By Beterhans
New Custom Combo for AI
AI Tweak

<Nov.3 2015> by Beterhans
-Bug fix
-AI bug fix

<Jun 7 2015> by Beterhans
-Fix Team battle bug

<Jun 7 2015> by Beterhans
-Special Intro with my Awakened Morrigan

<Aug 7 2014> by Beterhans
-Team win pose with ryu
-Team AI Framework

<01/08/2014> by Beterhans
 - Bug fix

<16/02/2014> by Beterhans
 - Bug fix
 - New Quote vs Morrigan

<15/02/2013> by Beterhans
 - Bug fix
 - Dumper change
 - System change
 - AI change

<09/05/11>
 - Throw damage changed
 - Changed around some canceling rules

<v.08/26/11>
 - Increased guard hit times for Tatsumaki Senpukyaku
 - Fixed bug which caused Violent and Master modes to lose life when parrying
 - Made canceling some moves more lenient
 - Modified airborne Tatsumaki Senpukyaku airtime
 - Level 1 Shippu Jinraikyaku now behaves like it does in SFIII:3S

<v.05/31/11>
 - Fixed an EX Hadoken bug
 - Removed bug involving level 2 Shoryureppa hits on airborne opponent
 - Corrected problem with backwards roll not having any invincibility frames palfx on jouen shinryuken
 - Fixed some minor fire PalFX issues
 - Modified some canceling rules

<v.05/27/11>
 - First release


=====<Special Thanks>=====
 - JustNoPoint/Dreamslayer for sprite rips
 - P.o.t.S. for the majority of the code, effects, hitsparks, formatting style, and Rasetsu Kyaku
   sprites
 - TMasta for sprite edits, general planning, and advice; he's the one who really made this all possible
 - the_mith for the SFIII taunt
 - C.V.S.N.B. for part of the SFIII intro and some aditional Jouen Shinryuken sprites
 - Hien for the Jouen Shinryuken sprites
 - Hero for Midnight Bliss sprites
 - Crazy Koopa for the Jouen Shinryuken effects
 - @ndroide for the Orochi skull FX
 - vyn for the Master Shinryuken effects and the Orochi pillar FX
 - Anthem, Banxman3, Chosis, Cyan Paul, Cyclysm, Dishamonpow, Dshiznetz, Goodaldo, Hoshi, Jplayer, Kawaii
   Desu, Kirishima, MalaDingDong, MC2, ShoShingo, Takato-kun, Yzan, and Zero-Sennin for palettes
 - Chosis, CrazyKoopa, Dshiznetz, .Hades., PsychoKrusher, and Rojenomu for super portraits 
 - VioFitz for the noogie intro and the winpose/lose vs Ryu sprites
 - Vegeta 20XX for the default small portrait
 - ughwtf for a Violent small portrait
 - Teros for the Master small portrait
 - Everybody at the MUGEN Fighters Guild for feedback.


=====<Disclaimer>=====

 - The Ken character is property of Capcom
 - Capcom vs SNK is property of Capcom
 - This MUGEN character is a non-profit fan work, it cannot be used for any commercial purposes