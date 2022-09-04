                            __________________________________________
===========================| Ken by Jmorphman		      	      |===========================
                            ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯        [10.14.20]

 - Contact:	Jmorphman@gmail.com
 - Website:	http://network.mugenguild.com/jmorphman/
 - Customized version of Capcom's Ken character, for MUGEN 1.0



=====<Features>=====

 - All the essential stuff
 - Details and moves taken from his various video game appearances
 - Gameplay mixed from several games, including CvS2, KOF, SFA3 and SFIII
 - Special intros versus Ryu, Terry Bogard, and Robert Garcia (all modes except Violent); Ryu, Evil Ryu, DivineWolf's Akuma, and M. 
   Bison/Vega (Violent mode), and a very special intro versus Guile (Master mode)
 - Special winposes versus Ryu (all modes except Violent, if Ryu is defeated in the last round with a Level 3 super combo), M.
   Bison/Vega (Violent mode, if defeated in the last round), and a special winpose when any opponent is defeated with Shinryuken (Master
   mode)



=====<Mode Overview>=====

This character has four different modes:

<Ken>
- Regular Ken
- Can perform EX moves
- Based primarily on his CvS2 moveset

<Violent Ken>
- A version of Ken who has been brainwashed by M. Bison/Vega.
- Has lower defense, moves slower, and has a shallower jump arc, but has better mobility through his teleport dash.

<Master Ken>
- Is basically a mix between the first two modes, except he cannot use EX moves
- Has the lowest defense

<SFIII Ken>
- Regular Ken... but again. And with a different moveset
- Can perform EX moves
- Based on his SFIII: Third Strike moveset



=====<.DEF Overview>=====

This char has five different .def files, here's what each one does:

<KEN.def>
The mode is selected via palette:

Palettes 1, 2, 3		-> Ken mode
Palettes 4, 5, 6		-> SFIII mode
Palettes 7, 8, 9		-> Violent Ken mode
Palette  10, 11, 12		-> Master Ken mode

To add him to your Mugen, add the following line to your select.def, under [Characters]:
Ken,

<NORMALKEN.def>
Only Normal mode.
To add him to your Mugen, add the following line to your select.def, under [Characters]:
Ken/NormalKen.def,

<VIOLENTKEN.def>
Only Violent mode.
To add him to your Mugen, add the following line to your select.def, under [Characters]:
Ken/ViolentKen.def,

<MASTERKEN.def>
Only Master mode.
To add him to your Mugen, add the following line to your select.def, under [Characters]:
Ken/MasterKen.def,

<SFIIIKEN.def>
Only SFIII mode.
To add him to your Mugen, add the following line to your select.def, under [Characters]:
Ken/SFIIIKen.def,



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
.Gakuhatsu				y, z			(near opponent)
.Jigoku Gurama:                		F/B + 2p		(near opponent)
.Tsukami Nage:				F/B + 2k		(near opponent)
.Jigoku Husha:				F/B + 2p		(Air, near opponent)


<SPECIAL>

.Hadoken (EX):         			D, DF, F, p
.Shoryuken (EX):			F, D, DF, p
.Tatsumaki Senpukyaku (EX):		D, DB, B, k
.Airborne Tatsumaki Senpukyaku (EX):	D, DB, B, k		(Air)
.Ryusenkyaku (EX):			B, D, DB, k
.Nata Otoshi Geri:       		D, DF, F, a
    .Inazuma Kakato Wari:       	hold k
.Kama Barai Geri:         		D, DF, F, b
    .Inazuma Kakato Wari:       	hold k
.Oosoto Mawashi Geri:			D, DF, F, c
    .Inazuma Kakato Wari:       	hold k
.Fujin Sen Geri (EX only)		D, DF, F, 2k
.Zenpo Tenshi:				D, DB, B, p
.Zento:					D, DB, B, s


<SUPER>

.Shoryureppa (MAX):             	D, DF, F, D, DF, F, p
.Shinryuken (MAX):			D, DF, F, D, DF, F, k	(mash buttons for more hits)
.Shippu Jinraikyaku (MAX):		D, DB, B, D, DB, B, k


<LV3 SUPER>

.Shonetsu Shinryuken:			D, DF, F, D, DF, F, 3p


<TEAM SUPER>
.Soryuken				D, DF, F, D, DF, F, p + k


<SYSTEM>

.Forward Dash:				F, F
   .Run:                       			hold
.Backward Dash:                 	B, B
.Low Jump:                     		tap U
.High Jump:                     	tap D, U
.Long Low Jump:                 	tap D, tap U            
.Sidestep:                      	a + x
   .Sidestep Attack:            		p / k
.Forward Roll:                  	F + a + x
.Backward Roll:                 	B + a + x
.Parry High:                    	tap F
.Parry Low:                     	tap D
.Air Parry:                     	tap F           	(Air)
.Power Charge:                  	hold b + y
.Zero Counter:                  	B, DB, D, p / k		(during standing or crouching guard)
.Custom Combo:                  	c + z           	(Air also)
.Fall Recovery:                 	2p / a + x      	(while falling and allowed)



=====<Violent Mode>=====

<NORMAL>

.Inazuma Kakato Wari			F + b
.Seoi Nage:				F/B + 2p		(near opponent)
.Jigoku Gurama:                		F/B + 2k		(near opponent)
.Jigoku Husha:				F/B + 2k 		(Air, near opponent)


<SPECIAL>

.Hadoken:         			D, DF, F, p
.Shoryuken:				F, D, DF, p
.Tatsumaki Senpukyaku:			D, DB, B, k
.Airborne Tatsumaki Senpukyaku:		D, DB, B, k		(Air)
.Rasetsukyaku:				F, D, DF, k
.Nata Otoshi Geri:       		D, DF, F, a
    .Inazuma Kakato Wari:       	hold k
.Kama Barai Geri:         		D, DF, F, b
    .Inazuma Kakato Wari:       	hold k
.Oosoto Mawashi Geri:			D, DF, F, c
    .Inazuma Kakato Wari:       	hold k


<SUPER>

.Shoryureppa (MAX):             	D, DF, F, D, DF, F, P
.Shinryuken (MAX):			D, DF, F, D, DF, F, k	(mash buttons for more hits)
.Kuzuryureppa (MAX):			D, DB, B, D, DB, B, k


<LV3 SUPER>

.Shinbu Messatsu:			D, DF, F, DF, D, DB, B, 2p


<TEAM SUPER>
.Shin Goku Messatsu			D, DF, F, DF, D, DB, B, p + k


<SYSTEM>

.Forward Dash:				F, F
   .Run:                       			hold
.Backward Dash:                 	B, B
.Low Jump:                     		tap U
.High Jump:                     	tap D, U
.Long Low Jump:                 	tap D, tap U            
.Sidestep:                      	a + x
   .Sidestep Attack:            		p / k
.Forward Roll:                  	F + a + x
.Backward Roll:                 	B + a + x
.Parry High:                    	tap F
.Parry Low:                     	tap D
.Air Parry:                     	tap F           	(Air)
.Power Charge:                  	hold b + y
.Zero Counter:                  	B, DB, D, p / k		(during standing or crouching guard)
.Custom Combo:                  	c + z           	(Air also)
.Fall Recovery:                 	2p / a + x      	(while falling and allowed)



=====<Master Ken Mode>=====

<NORMAL>

.Inazuma Kakato Wari			F + b
.Ushiro Mawashi Geri			F + c
.Gakuhatsu				y, z			(near opponent)
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
.Rasetsukyaku:				F, D, DF, k
.Nata Otoshi Geri:       		D, DF, F, a
    .Inazuma Kakato Wari:       	hold k
.Kama Barai Geri:         		D, DF, F, b
    .Inazuma Kakato Wari:       	hold k
.Oosoto Mawashi Geri:			D, DF, F, c
    .Inazuma Kakato Wari:       	hold k
.Zenpo Tenshi:				D, DB, B, p
.Zento:					D, DB, B, s


<SUPER>

.Shoryureppa (MAX):             	D, DF, F, D, DF, F, P
.Shinryuken (MAX):			D, DF, F, D, DF, F, k	(mash buttons for more hits)
.Shippu Jinraikyaku (MAX):		D, DB, B, D, DB, B, k
.Kuzuryureppa (MAX only):		D, DF, F, DF, D, DB, B, 2k


<LV3 SUPER>

.Shonetsu Shinryuken:			D, DF, F, D, DF, F, 3p
.Shinbu Messatsu:			D, DF, F, DF, D, DB, B, 2p


<TEAM SUPER>
.Soryuken				D, DF, F, D, DF, F, p + k


<SYSTEM>

.Forward Dash:				F, F
   .Run:                       			hold
.Backward Dash:                 	B, B
.Low Jump:                     		tap U
.High Jump:                     	tap D, U
.Long Low Jump:                 	tap D, tap U            
.Sidestep:                      	a + x
   .Sidestep Attack:            		p / k
.Forward Roll:                  	F + a + x
.Backward Roll:                 	B + a + x
.Parry High:                    	tap F
.Parry Low:                     	tap D
.Air Parry:                     	tap F           	(Air)
.Power Charge:                  	hold b + y
.Zero Counter:                  	B, DB, D, p / k		(during standing or crouching guard)
.Custom Combo:                  	c + z           	(Air also)
.Fall Recovery:                 	2p / a + x      	(while falling and allowed)



=====<SFIII Mode>=====

<NORMAL>

.Inazuma Kakato Wari			hold b / B + b
.Fumikomi Mae Geri			F + b
.Shiden Kakato Otoshi			F + c			(hold c to feint)
.Gakuhatsu				y, z			(near opponent)
.Seoi Nage:				F/B + 2p		(near opponent)
.Jigoku Gurama:                		F/B + 2k		(near opponent)


<SPECIAL>

.Hadoken (EX):         			D, DF, F, p
.Shoryuken (EX):			F, D, DF, p
.Tatsumaki Senpukyaku (EX):		D, DB, B, k
.Airborne Tatsumaki Senpukyaku (EX):	D, DB, B, k		(Air)


<SUPER>

.Shoryureppa (MAX):             	D, DF, F, D, DF, F, p
.Shinryuken (MAX):			D, DF, F, D, DF, F, k	(mash buttons for more hits)
.Shippu Jinraikyaku (MAX):		D, DB, B, D, DB, B, k


<LV3 SUPER>

.Guren Senpukyaku:			D, DF, F, D, DF, F, 3k


<TEAM SUPER>
.Soryuken				D, DF, F, D, DF, F, p + k


<SYSTEM>

.Forward Dash:				F, F
   .Run:                       			hold
.Backward Dash:                 	B, B
.Low Jump:                     		tap U
.High Jump:                     	tap D, U
.Long Low Jump:                 	tap D, tap U            
.Sidestep:                      	a + x
   .Sidestep Attack:            		p / k
.Forward Roll:                  	F + a + x
.Backward Roll:                 	B + a + x
.Parry High:                    	tap F
.Parry Low:                     	tap D
.Air Parry:                     	tap F           	(Air)
.Power Charge:                  	hold b + y
.Zero Counter:                  	B, DB, D, p / k		(during standing or crouching guard)
.Custom Combo:                  	c + z           	(Air also)
.Fall Recovery:                 	2p / a + x      	(while falling and allowed)



=====<Move Details>=====

 - During Tsukami Nage, you and your opponent can mash buttons to respectively increase or decrease the number of hits.
 - EX Aerial Tatsumaki Senpukyaku, if cancelled into, can hit falling opponents (in other words, if an airborne opponent gets hit with
   an aerial normal by Ken, and if Ken then cancels that normal into EX Aerial Tatsumaki Senpukyaku, those Tatsumaki hits juggle of the
   falling opponent). This behavior differs from the normal Aerial Tatsumaki Senpukyaku, which cannot juggle a falling opponent if
   cancelled into. 
 - Inazuma Kakato Wari (all versions) and Ryusenkyaku are overheads.
 - Fujin Sen Geri causes wall bounce if both hits connect.
 - Kuzuryureppa can be juggled afterwards with any attack if the final hits connect; additionally, this also resets the damage dampener,
   so any subsequent hits will be treated as if they were the start of a new combo, damage-wise.
 - Shonetsu Shinryuken can also be performed with this alternate command: B, DB, D, DF, F, 2p
 - Guren Senpukyaku can also be performed with this alternate command: B, DB, D, DF, F, 2k
 - Soryuken uses 3 powerbars, and can only be used in simul mode with Ryu by P.o.t.S. as your teammate; Ken and Ryu must be on opposite
   sides of the opponent for the attack to initiate. Additionally, Ryu must be in either Normal mode or Master mode; likewise, Ken must
   be in either Normal mode, Master mode, or SFIII mode.
 - Shin Goku Messatsu uses 3 powerbars, and can only be used in simul mode with Ryu by P.o.t.S. as your teammate; Ken and Ryu must be
   on opposite sides of the opponent for the attack to initiate. Additionally, Ryu must be in Evil mode; likewise, Ken must be in
   Violent mode.



=====<Miscellaneous>=====

- To change his voice to use English SFIV voices, open the .def file and replace "Sound.snd" with "SoundSFIVEnglish.snd"



=====<Gameplay Notes>=====

COMBO SYSTEM:
 - Some Normal attacks can be canceled into Command, Special and Super moves
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

 - removed "Tick Fix"
 - fixed bug where certain System.st states had gravity applied twice
 - Using a juggle reset move twice no longer turns on the "juggle flag" (var(16)); it is now possible to combo off that second juggle
   reset move by activating Custom Combo, but otherwise, continuing the combo from that second move remains impossible (in most cases).


<10/14/20>
 - Total revamp/recode. Added a more extensive color separation. Overhauled sprites, damage levels, animations, hitboxes, and coding.
   Now (mostly) uses frame data/velocities/timings from CvS2.
 - Hit sparks reduced 65% in size
 - Added EXPLODsive Buffering system, projectile reflection, and compatibility with the Reigi no Ishizue super from Vans's Chizuru.
 - SFIII mode added
 - New intro added against two versions of Robert: DivineWolf's and Chazzanova's
 - New intro added vs. Akuma by DivineWolf
 - Revamped team intro for Violent mode vs. Evil Ryu
 - Fixed intro errors involving simul mode
 - Violent mode can no longer use Ushiro Mawashi Geri
 - Ushiro Mawashi Geri now knocks down in Master mode, like in SFA3
 - Tsukami Nage looks and behaves more like SFA3
 - Fixed EX Hadoken bug where it would not disappear when hit by projectiles that hit more than once
 - The Shoryuken effects are now from CvS2 (but the old Shoryuken FX is still used for SFIII mode)
 - Flames that appear on opponent when they are hit now disappear after a firm, set amount of time, exactly matching the PalFX applied
   to them. (They used to disappear if opponent regained control, or hit the floor if they were knocked down).
 - Can now cancel certain air normals into Airborne Tatsumaki Senpukyaku, though they will not connect on airborne opponents; cancelling 
   the EX version will, however, have those hits connect
 - Shoryureppa no longer has a longish hit pause on the final few hits
 - Jouen Shinryuken has been renamed to Shonetsu Shinryuken
 - Added new sprites for Shonetsu Shinryuken 
 - Soryuken has been overhauled to look and feel better
 - Added a new team super for Violent Ken and Evil Ryu: Shin Goku Messatsu
 - [Ryu patch] If the conditions for activating one of the team supers is met, an AI-controlled Ryu will now try to remain relatively
   stationary, and will not initiate a new attacks (Ryu will however return to his normal AI routine as soon as any of the conditions
   for the team super are no longer true); this is intended to greatly ease the chance of pulling off the team supers, and also applies 
   to Ken's AI routine.

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
 - Corrected problem with backwards roll not having any invincibility frames 
 - Fixed PalFX errors in Jouen Shinryuken
 - Fixed some minor fire PalFX issues
 - Modified some canceling rules

<v.05/27/11>
 - First release


=====<Special Thanks>=====
 - JustNoPoint/Dreamslayer for sprite rips
 - P.o.t.S. for the majority of the code, effects, hitsparks, formatting style, and the Violent Ken stance, Rasetsukyaku sprites, simul
   intro with Ryu sprites, and SFIII mode Shoryuken effects
 - the_mith for the SFIII taunt
 - C.V.S.N.B. for part of the SFIII intro and some additional Shonetsu Shinryuken sprites
 - Balthazar for Guren Senpukyaku, and SFIII close standing MP sprites
 - SeanAltly for the Fumikomi Mae Geri and Shiden Kakato Otoshi sprites
 - Balthazar, Buckus, and SeanAltly for SFIII Tatsumaki Senpukyaku sprites
 - Balthazar and Hien for the Shonetsu Shinryuken sprites
 - Hero for Midnight Bliss sprites
 - VioFitz for the noogie intro with Ryu and special winpose vs. Ryu sprites
 - TMasta, MotorRoach, and Alex Sinigaglia for the turning fist bump SFIII intro
 - Shao_Kun, Alex Sinigaglia, and Rai Tei for the neutral jumping heavy punch
 - Buckus, chuchoryu, C.V.S.N.B., Alex Sinigaglia, and Troy for the SFIII mode stance sprites
 - TMasta for all other sprite edits
 - Crazy Koopa for the Jouen Shinryuken effects
 - @ndroide for the Orochi skull FX
 - vyn for the Master Shinryuken effects and the Orochi pillar FX
 - Froz for the Violent Ken win vs. Vega/M. Bison flames FX
 - Anthem, Banxman3, Chosis, Cyan Paul, Cyclysm, Dishamonpow, Dshiznetz, Goodaldo, Hoshi, Jplayer, Kawaii Desu, Kirishima, MalaDingDong,
   MC2, Project.13 ShoShingo, Takato-kun, TotalDramaXtremist, Trill Cosby, Yzan, and Zero-Sennin for palettes
 - Chosis, CrazyKoopa, Dshiznetz, .Hades., PsychoKrusher, and Rojenomu for super portraits 
 - VioFitz for the noogie intro and the winpose/lose vs Ryu sprites
 - Vegeta 20XX for the default small portrait
 - ughwtf for a Violent small portrait
 - Teros for the Master small portrait
 - MightyKombat for the English SFIV soundpack
 - Everybody at the MUGEN Fighters Guild for feedback.
 - The MUGEN Fighters Guild for providing hosting.


=====<Disclaimer>=====

 - The Ken character is property of Capcom
 - Capcom vs SNK is property of Capcom
 - This MUGEN character is a non-profit fan work, it cannot be used for any commercial purposes