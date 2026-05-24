                             ____________________________________
============================| SS1 Bonus by Phantom.of.the.Server |=============================
                             ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯          [15.02.2024]

 - Contact: potsmugen@gmail.com
 - Website: https://network.mugenguild.com/pots/
 - If you downloaded this character from anywhere else, it's probably outdated

 - Based on SNK's Samurai Spirits (Samurai Shodown in the West) bonus stage
 - For Mugen 1.0 and above



==========< INSTALLATION >==========

 - Extract SS1Bonus.rar to your Mugen\chars folder
 - Open your select.def and add this line under [Characters]:

SS1Bonus, chars/SS1Bonus/StageA.def, music=chars/SS1Bonus/BGM.mp3, includestage=1, order=1


Notes:
 - The game includes two stages, you can select the second by using "StageB.def" instead.
 - I used order=1 as an example, you can use whatever you prefer
 - Although I include the original stages in the bonus, it is programmed to function properly in
any stage (only the Kurokos may appear misaligned in some stages)



==========< INTRODUCTION >==========

  This time around I kept the same rules as the original game, which means it's a Time Attack.
You have to succeed in hitting the required number of practice dummies (displayed in-game)
before the timer runs out.
  If you're successful, the "kurokos" will applaud you, but if you're not, your char doesn't
actually get KO'ed so don't worry about getting a Game Over.

  For compatibility purposes, I couldn't make it like the original in that you could only
hit the dummies with slash attacks, so in my conversion any attack will work.  Note that
projectiles and throws still won't have any effect, although the former can be changed in the
configuration file.

  Check CONFIG.txt for a few options.



==========< VERSION HISTORY >==========

<15.02.2024>
 - Added animations for Ikemen GO select screens

<15.05.2022>
 - Bug fixing

<01.05.2022>
 - Bug fixing
 - Compatibility updates
 - Improved widescreen support
 - Made it so the game can't go on very long without any targets appearing

<12.01.2010>
 - For Mugen 1.0 now

<27.01.09>
 - Now supports using two bonus games in simul mode

<v.0.91>
 - Fixed a line that made the "Goal" config option not work properly

<v.0.9>
 - First release



==========< WHAT'S MISSING >==========

 - Some stuff was left out in order to make the conversion more suited for Mugen, but I may go
back and try to find a place for some of it
 - Some way of making difficulty vary between rounds
 - Maybe renaming it. Does anyone know what's written on the stage's banner?



==========< DISCLAIMER >==========

 - Samurai Spirits is property of SNK
 - This bonus game is a non-profit fan work. It cannot be sold or used for any commercial purposes
 - No part of this work may be used for personal profit, be it commissions, paywalls and the likes of it
