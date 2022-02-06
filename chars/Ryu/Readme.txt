                                ______________________________
===============================| Ryu by Phantom.of.the.Server |================================
                                ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯           [14.01.2010]

- Contact: potsmugen@yahoo.com.br
- Website: http://www.mugenguild.com/pots/

- Customized version of Capcom's Ryu character from Capcom vs Snk series
- For Mugen 1.0 only



=====<Features>=====

- All the essential stuff
- 3 modes: Ryu, Evil Ryu and Master Ryu
- Every Ryu/Evil Ryu move ever seen in video games (let me know if i missed any :P) and more
- Details taken from his various video-game appearances and storyline
- Custom gameplay
- Effects edited from various games
- Sounds from various games, including SFZ3, CvS2 and DS
- CFE, CvS2 and MvC voice samples
- Intros, win poses and special animations
- Ryu vs Evil Ryu intro
- Evil/Master Ryu vs my Shin Gouki intro
- Ryu vs my Sakura intro
- Special intros vs my Pocket Shin Gouki and Reu's Evil Ken
- Special intros vs CvS2 Another Kyo and CvS2 Ryo by Byakko
- 38 palettes



=====<Mode Overview>=====

This char has three different modes, here follows a short description:

<Normal Ryu>
- Has the highest defence
- Can perform EX moves

<Evil Ryu>
- Moves faster
- Has a better movelist
- Shouryuu Ken and Tatsumaki Senpuu Kyaku cause more hits on the opponent
- Shinkuu Tatsumaki Senpuu Kyaku draws in the opponent twice as fast as Ryu's

<Master Ryu>
- Is basically a mix between the first two modes, except he cannot use EX moves
- Defence is even lower than Evil Ryu's

Obs.: "Master Ryu" can more or less be understood for how Ryu would fight if Gouken didn't
tone down the Ansatsuken style and therefore teached him the Satsui no Hadou techniques.
But this is just a pretty explanation, the truth is I just wanted to add a mode with all of
both version's moves. =P
  Also, some people speculate he's the original SF1 Ryu (not his older brother from SF2) when
fighting without his shoes, which weigh about 60kg each to prevent himself from killing his
opponents with a single blow.



=====<.DEF Overview>=====

This char has four different .def files, here's what each one does:

<RYU.def>
The mode is selected via palette:

Palettes 1, 2, 3, 4, 5, 6  -> Normal Ryu
Palettes 7, 8, 10, 11, 12  -> Evil Ryu
Palette  9                 -> Master Ryu

To add him to your Mugen, add the following line to your select.def, under [Characters]:
Ryu,

<NORMALRYU.def>
Only Normal Ryu mode.
To add him to your Mugen, add the following line to your select.def, under [Characters]:
Ryu/NormalRyu.def,

<EVILRYU.def>
Only Evil Ryu mode.
To add him to your Mugen, add the following line to your select.def, under [Characters]:
Ryu/EvilRyu.def,

<MASTERRYU.def>
Only Master Ryu mode.
To add him to your Mugen, add the following line to your select.def, under [Characters]:
Ryu/MasterRyu.def,



=====<Movelist>=====

U - up          x - weak punch         a - weak kick
D - down        y - medium punch       b - medium kick
F - forward     z - strong punch       c - strong kick
B - back        p - any punch          k - any kick
s - start       2p- two punches        2k- two kicks

(Air)- Move must be performed in the air.

(EX)- Move with an EX version. EX moves are performed by pressing two punch/kick buttons.
e.g.: Hadouken - D, DF, F, p
      EX Hadouken - D, DF, F, 2p

EX moves are more powerful than regular Special moves, but consume half of a power stock.
Only Normal Ryu can use them.

(N)- Move can only be performed by Normal or Master Ryu.
(E)- Move can only be performed by Evil or Master Ryu.
     *When not specified, any mode can perform the move.


<NORMAL>
.Seoi Nage:                        F/B + 2p (near opponent)
.Tomoe Nage:                       F/B + 2k (near opponent)
.Sakotsu Wari:                     F + y
.Senpuu Kyaku:                     F + b
.Seichuu Nidan Tsuki:              2p
.(N) Kyuubi Kudaki:                F + z
.(E) Tenma Kuujin Kyaku:           D + b (while jumping forward)
.(E) Kikoku Tsuki:                 y, z (near opponent)

<SPECIAL>
.Hadou Ken:                        D, DF, F, p (EX)
.Shouryuu Ken:                     F, D, DF, p (EX)
.Tatsumaki Senpuu Kyaku:           D, DB, B, k (EX)
.Kuuchuu Tatsumaki Senpuu Kyaku:   D, DB, B, k (Air)(EX)
.(E) Classic Kuuchuu Tatsumaki:    F, DF, D, DB, B, k
.Joudan Sokutou Geri:              D, DF, F, k (EX)
.(E) Shakunetsu Hadou Ken:         B, DB, D, DF, F, p
.(E) Ashura Senkuu Zenpou:         F, D, DF, 2p/2k
.(E) Ashura Senkuu Kouhou:         B, D, DB, 2p/2k

<Lv1 SUPER>
.Shinkuu Hadou Ken:                D, DF, F, D, DF, F, p
.Shinkuu Tatsumaki Senpuu Kyaku:   D, DB, B, D, DB, B, k
.(N) Denjin Hadou Ken:             D, DB, B, D, DB, B, p
.(N) Nidan Shouryuu Tsuki:         D, DF, F, D, DF, k
.(E) Messatsu Gou Shouryuu:        D, DF, F, D, DF, k

<Lv2 SUPER>
.(N) Reppuu Jinrai Shou:           D, DF, F, DF, D, DB, B, p
.(E) Metsu Shoryuu ken:            D, DF, F, DF, D, DB, B, k

<Lv3 SUPER>
.(N) Shin Shoryuu Ken:             D, DF, F, D, DF, 2k
.(E) Metsu Hadou Ken:              D, DB, B, D, DB, B, p
.(E) Ryuu Koku Hadou Ken:          Fully charge Metsu Hadou Ken
.(E) Shun Goku Satsu:                  x, x, F, a, z


<SYSTEM>

.Backward Dash:                    B, B
.Forward Dash:                     F, F
.Run:                              F, F (hold)
.Dodge:                            a + x
.Roll:                             F + a + x
.Parry High:                       (tap) F
.Parry Low:                        (tap) D
.Air Parry:                        (tap) F (Air)
.Power Charge:                     b+y  (hold)
.Excel Combo:                      c+z  (can also be done in the air)
.Zero Counter:                     B, DB, D, p/k  (during standing or crouching guard)
.Fall Recovery:                    2p (while falling when hit)
.Low Jump:                         U (tap)
.High Jump:                        D, U
.Chouhatsu: s
.(N)Hadou no Kamae: D, DF, F, s



NOTE: Some Super moves in Master mode have a different command, as follows:

.Nidan Shoryuu Tsuki: B, DB, D, DF, F, 2k
.Metsu Hadou Ken: F, DF, D, DB, B, 2p
.Shin Shoryuu Ken: D, DB, B, DB, D, DF, F, k



=====<Move Details>=====

- Sakotsu Wari is an overhead

- EX version of Ryu's Hadouken is the Shakunetsu Hadou Ken

- EX version of Joudan Sokutou Geri will make the opponent bounce off the wall

- Shinkuu Tatsumaki Senpuu Kyaku draws opponents towards you

- You can cancel Nidan Shouryuu Tsuki to Shin Shoryuken, if you successfully hit your opponent
with it and input its command just as Ryu connects the second hit. If successful Ryu will
flash white and switch to Shin Shoryuken. Be aware that this way it'll cause less damage than
a regular Shin Shoryuken

- Mashing any direction during Denjin or Metsu Hadouken will make Ryu charge it faster

- Some opponents are able to break out of Shun Goku Satsu, such as Gen or Gouki. However other
opponents may recieve extra damage, such as Vega (M.Bison) or Geese Howard (for more details,
check "Other Info"). To break out of Shun Goku Satsu, the victim must have more than half of
his life points and quickly mash any buttons;

- When Ryu fires the Ryuu Koku Hadou Ken, any opponent behind him will be blown away. Useful to
prevent getting hit out of the move while firing the beam.

- Normal and Master modes have extra taunts



=====<Other Info>=====

<Chars that have maximum resistance to Shun Goku Satsu>
   - Gen, Gouki, Mech Gouki, Pocket Shin Gouki, Shin Gouki and Soul Gen

<Chars that have medium resistance to Shun Goku Satsu>
   - Blaze Agent, Dark Sakura, Evil Ryu, God Rugal and Oyaji

<Chars that recieve 25% extra damage from Shun Goku Satsu>
   - Demitri, Jedah, Shadow DIO and Vega (M.Bison)
   - Geese Howard, Mukai, Orochi, Ryuji Yamazaki and Setsuna
   - Goro, Kintaro, Motaro, Shang Tsung and Shao Kahn
   - Dr. Doom
   - Mech Rugal, Omega Rugal and Rugal
   - Original Zero, Perfect Weapon MB-02, Sevil Nahte and Shadow Dio


More can be added here, so contact me if you know any and I'll consider it.
This list may be incomplete. Also, if you notice that this system isn't working with some char
please contact me so I can fix it.


<Selecting the win pose>
(Speech translations by Kibagami)

Normal/Master Ryu:
X, Y or Z -> Ryu raises his arm and says "Ore no kachi da!" ("Victory is mine!").
A, B or C -> Ryu crosses his arms and wind starts ruffling his clothes. There's a random chance
that a small leaf will appear, blown by the wind, or hold Start to see it.

Evil Ryu:
X, Y or Z -> Ryu turns his back and says "Shin no tsu, tometekureru!" ("I will stop your
heartbeat!").
A, B or C -> Ryu stomps the ground and says "Zetsu!" ("Death!").


<Extra win poses>

Normal Ryu:
Win by Shin Shoryuken -> Ryu turns his back on the opponent.

Evil Ryu:
Win by Ryuu Koku Hadou Ken -> Ryu falls on his knees, exhausted.
Win by Shun Goku Satsu -> Ryu has his back turned, breathing heavily, saying "Ware, Kobushi
kiwame tari..." ("I mastered my fist...") while the Metsu kanji is displayed in the background.

Master mode has all of the above.



=====<Move Name Translations>=====

- Credit goes to Chris McDonald

Seoi Nage:                         Over-the-Shoulder Throw
Tomoe Nage:                        Overhead Judo Throw
Sakotsu Wari:                      Collarbone Splitter
Kyuubi Kudaki:                     Solarplexus Smasher
Seichuu Nidan Tsuki:               Mid-Level Two-Part Thrust
Senpuu Kyaku:                      Whirlwind Kick
Tenma Kuujin Kyaku:                Demonic Air Blade Kick

Hadou Ken:                         Surge Fist
Shakunetsu Hadou Ken:              Scorching Heat Surge Fist
Shouryuu Ken:                      Rising Dragon Fist
Tatsumaki Senpuu Kyaku:            Tornado Whirlwind Kick
Kuuchuu Tatsumaki Senpuu Kyaku:    Mid-air Tornado Whirlwind Kick
Joudan Sokutou Geri:               Upward Blade Kick
Ashura Senkuu Zenpou:              (demonic warrior) Forward Air Flash
Ashura Senkuu Kouhou:              (demonic warrior) Backward Air Flash

Shinkuu Hadou Ken:                 Vacuum Surge Fist
Denjin Hadou Ken:                  Electric Blade Surge Fist
Shinkuu Tatsumaki Senpuu Kyaku:    Vacuum Tornado Whirlwind Kick
Nidan Shouryuu Tsuki:              Two-Part Rising Dragon Thrust
Messatsu Gou Shouryuu:             Great Rising Dragon Deadly Attack

Reppuu Jinrai Shou:                Gale Thunderclap Palm
Metsu Shoryuken:                   Rising Dragon Fist of Destruction

Metsu Hadou Ken:                   Surge Fist of Destruction
Ryuu Koku Hadou Ken:               Dragon Cutting Surge Fist
Shin Shoryuu Ken:                  True Rising Dragon Fist
Shun Goku Satsu:                   Instant Hell Murder



=====<Version History>=====

<14.01.2010>
- For Mugen 1.0 now
- Cancel timing is more strict
- Opponent can't normally air recover out of combos
- Made Shinkuu Hadouken's startup faster and recovery longer. It will now connect from a
  cancelled Shoryuken
- Fixed an earlier mistake that made Master Ryu's Tatsumaki behave incorrectly
- Can cancel the sweep again, and Evil/Master modes can juggle a bit from it
- Revised Shoryuken hit velocities
- Zero Counters cost two levels of power and are done with a dragon punch motion

<27.03.09>
- Some fixes

<14.12.08>
- Some more general system fixes
- Opponent can now Tech Hit throws
- Applied SF4's command shortcuts to Shun Goku Satsu, you can now also do it as
  "x, x, F + a + z"

<v.2.7>
- Master Ryu now also has the special intro with my Shin Gouki

<v.2.6>
- Normal Ryu's Tatsumaki Senpuu Kyaku can no longer be stopped by several chars with a single
  parry, but rather one per hit
- Normal Ryu's Tatsumaki Senpuu Kyaku can now hit multiple times during Original Combo
- Evil Ryu can now juggle after Shinkuu Hadouken in the corner, if you're quick enough
- Evil Ryu can no longer jump higher, made him too floaty
- New Metsu Shoryuuken SFX
- Denjin Hadouken no longer knocks down
- Cleaned up the Joudan Sokutou Geri sprite edits a bit
- Denjin Hadouken charges faster for lower levels
- Improved timing on some of his normal attacks
- Jumping medium punch now sets the opponent for a juggle, but only Normal and Master Ryu have it
- Nidan Shouryuu Tsuki -> Shin Shoryuken is now done with the latter's command
- Walks a bit faster, but as such Evil/Master modes no longer get a speed boost
- Default palette is now SF2, plus added a SF4 palette
- Metsu Shoryuuken now does less damage, due to its corner juggle advantages
- Reppuu Jinrai Shou no longer automatically finishes with a Shoryuken, instead now lets you
  juggle after it
- Because of the more polished cancelling and juggling, Shin Shoryuken can no longer juggle
  (unless Super Canceled into)
- Defense levels now work correctly on single hits, or first hit of a combo
- The half circle version of Kuuchuu Tatsumaki Senpuu Kyaku now behaves like CvS2, sillier
  but more useful


<v.2.5>
- Can no longer Super Cancel Denjin Hadouken
- Master mode now has an uber stance
- Master mode now always uses Boufuu Tatsumaki Senpuu Kyaku
- Master mode defence decreased
- Metsu Shoryuken is now a Level 2 Super move
- Ashura Senkuu now has invulnerable startup


<v.2.4>
- A lot of tweaking and bug fixes
- Rearranged the palettes (Master Ryu now uses the SF1 palette \o/)
- Can't remember the rest =P


<v.2.2>
- Mostly fixes and tweaked stuff
- Added super portrait for Lv3 Supers
- Shun Goku Satsu now deals 55% damage to normal opponents and 75% to evil characters (see
Other Info), no matter how much life and defence they have >=)
- Shun Goku Satsu can now be canceled from Ashura Senkuu
- Rugal can no longer evade Shun Goku Satsu, and now takes extra damage from it. God Rugal
remains the same though
- Added Flattened special anim
- Added special intro vs Byakko's CvS2 Ryo
- Added special intro vs my Sakura
- Hadouken and Shinkuu Hadouken now have high resolution
- Standing attacks that aim low can no longer be air-blocked 
- Stricter timing on the Nidan Shoryuu Tsuki to Shin Shoryuu Ken cancel
- Slightly increased Shouryuu Ken's range, for smoother cancels
- Shin Shouryuu Ken now hits jumping opponents correctly


<v.2.0>
- Made the char exclusive to Linux and Windows Mugen
- Fixed most bugs
- Either tweaked or remade everything
- Axis is now the same as in CvS2
- More differences between each mode
- Super moves now only have one level of strength but, in exchange for it, better combos are
now possible
- Changed the throw system to SFZ3
- Normal attacks can now be cancelled into the taunt
- Shun Goku Satsu now behaves like with my Shin Gouki
- Added some moves
- Added Power Charge
- Implemented a Damage Reduction system
- Replaced some voice samples with CFE ones
- Tweaked and added some fx
- Added CvS2 sparks
- New flaming Shun Goku Satsu win screen
- Added intro vs my Shin Gouki
- Added intro vs Byakko's CvS2 Another Kyo
- Lots more



=====<What's Missing>=====

- Every move is in, so I guess that from now on I'll just improve what's done
- Intro Ryu vs Evil Ryu, from SFZ3
- Midnight Bliss anim, and some more
- Remaking the char, probably



=====<Special Thanks>=====

- The Dreamslayer, for always helping me when I needed, thanks man ;)
- H" and Warusaki3 for their CvS2 effects
- Arthur, Byakko, Cybaster, Fuze, Garuda, Loona, megaman_zer0, O Ilusionista, Panda, Soliduma,
Toninho 3rd and Winane, for useful feedback
- Hoshi, Loverman and The DreamSlayer, for CvS2 rips
- TMasta, for adding extra animation to the clothes on the "holding bandana" intro and Joudan
Sokutou Geri
- Byakko, GCNMario, Reu and The Dreamslayer for some missing CvS voices I missed at the time
- Byakko, for his tips on how to rip from PSX
- Ex Inferis, for his tutorial on how to rip from Melty Blood
- IxnayDK and Synk for their tips
- Buckethead, for the MvC palette
- Everyone who supported my work on this character, receiving such support even though there
are already so many Ryu conversions for Mugen was nice
- You, for downloading my char ;)



=====<Disclaimer>=====

- Ryu, Evil Ryu, Capcom Fighting Evolution, Capcom vs Snk and Street Fighter are property
of Capcom
- This Mugen character is a non-profit fan work, it cannot be used for any commercial purposes