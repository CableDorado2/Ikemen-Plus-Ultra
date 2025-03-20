--;===========================================================
--; TUTORIAL MENU SCREENPACK DEFINITION
--;===========================================================
table.insert(t_practiceMenu,#t_practiceMenu,{id = textImgNew(), text = "TUTORIAL", gotomenu = "f_tutorial()"}) --Insert new item to t_practiceMenu table loaded by screenpack.lua
sprTutorial = sffNew("script/mods/tutorial/tutorial.sff") --load tutorial sprites
--[[
- tutorial
Set the paramvalue to 1 to predefined this character as a tutorial char.
If more than 1 character have setting tutorial parameter
the tutorial character will be randomly chosen.

;SPECIFIC TUTORIAL DUMMY CHARACTER EXAMPLE:
kfm, tutorial=1, exclude=1, excludetourney=1, order=-1
]]
--;===========================================================
--; TUTORIAL MODE (Learn Game Rules and Battle Tactics)
--;===========================================================
function f_tutorial()
	f_default()
	setGameMode('tutorial')
	--data.gameMode = "training"
	--data.rosterMode = "training"
	setRoundsToWin(1) --rounds to win
	setRoundTime(-1) --round time disabled
	data.versusScreen = false --versus screen disabled
	data.victoryscreen = false --victory screen disabled
	data.stage = "stages/HD TEST/Training Room(Scale).def" --predefined custom stage
	data.bgm = "sound/System/Tutorial.mp3" --predefined custom song route
	data.p1TeamMenu = {mode = 0, chars = 1} --predefined P1 team mode as Single, 1 Character				
	data.p2TeamMenu = {mode = 0, chars = 1} --predefined P2 team mode as Single, 1 Character
	data.p1Pal = 1
	data.p1Char = {"Kung Fu Girl"}
	data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', sprFade)
	if #t_tutorialChar ~= 0 then --If a tutorial char is detected in select.def with tutorial=1 paramvalue
		data.p2In = 2
		data.p2Pal = 1
		data.p2Char = {t_selChars[t_tutorialChar[math.random(#t_tutorialChar)]+1].char} --pick a random tutorial char from the table
	else --Tutorial Char will be selected in char select if there is not tutorial chars detected in select.def with tutorial=1 paramvalue
		data.p2In = 1
		data.p2Faces = true
	end
	textImgSetText(txt_mainSelect, "TUTORIAL MODE")
	f_selectSimple()
end

--;===========================================================
--; TUTORIAL TEST SCREENPACK DEFINITION
--;===========================================================
txt_tutoDiag = createTextImg(jgFnt, 0, 1, "", 0, 0) --Text that appears in black screens important message

--Text background
tutorialWindow = animNew(sprTutorial, [[
1,0, 0,0, -1
]])
animAddPos(tutorialWindow, -55, 0)
animSetScale(tutorialWindow, 2.85, 1.32)
animUpdate(tutorialWindow)

--Next Text Arrow (Down)
tutorialNext = animNew(sprTutorial, [[
2,0, 0,0, 10
2,1, 0,0, 10
2,2, 0,0, 10
2,3, 0,0, 10
2,3, 0,0, 10
2,2, 0,0, 10
2,1, 0,0, 10
2,0, 0,0, 10
]])
animAddPos(tutorialNext, 350, 65)
animSetScale(tutorialNext, 0.5, 0.5)
animUpdate(tutorialNext)

--KFM Portrait
kfmTutoPortrait = animNew(sprTutorial, [[
0,0, 0,0, -1
]])
animAddPos(kfmTutoPortrait, -47, 1)
animSetScale(kfmTutoPortrait, 0.52, 0.52)
animUpdate(kfmTutoPortrait)

t_tutorialDiag = {
{condition = "", btntonext = true, txt = "WELCOME TO THE TUTORIAL MODE!                THIS IS A DIALOGUE TEST.                 PLEASE USE [SELECT] BUTTON TO ADVANCE..."},
{condition = "", btntonext = true, txt = "DURING THIS TUTORIAL, ALL MOVES ARE EXPLAINED CONSIDERING THAT YOUR CHARACTERS IS ON LEFT SIDE FACING TO THE OPPONENT ON THE RIGHT SIDE..."},
{condition = "", btntonext = true, txt = "OK, LET'S TRY SOME MOVES..."},
{condition = "f_tutoCheck1", btntonext = false, txt = "GO FORDWARD USING [RIGHT] BUTTON AND COME TO ME."},
{condition = "f_tutoCheck2", btntonext = false, txt = "NICE. NOW GO BACK USING [LEFT] BUTTON."},
{condition = "f_tutoCheck3", btntonext = false, txt = "GOOD. NOW CROUCH WITH [DOWN] BUTTON."},
{condition = "f_tutoCheck4", btntonext = false, txt = "YEP. JUMP WITH [UP] BUTTON."},
{condition = "f_tutoCheck5", btntonext = false, txt = "HMM. TAP 2 TIMES [LEFT] BUTTON"},
{condition = "f_tutoCheck6", btntonext = false, txt = "NOW! TAP 2 TIMES [RIGHT] BUTTON"},
{condition = "f_tutoCheck7", btntonext = false, txt = "LET'S TRY THOSE FIST.           PRESS [A], [B] AND [C] BUTTONS TO ATTACK ME."},
{condition = "f_tutoCheck8", btntonext = false, txt = "LET'S TRY THOSE KICKS.          PRESS [X], [Y] AND [Z] BUTTONS TO KICK ME."},
{condition = "", btntonext = true, txt = "EACH BUTTON HAVE DIFFERENT DAMAGE PROPERTIES..."},
{condition = "", btntonext = true, txt = "LOW ATTACKS LP/LK[A/X] ARE FASTER..."},
{condition = "", btntonext = true, txt = "MEDIUM ATTACKS MP/MK[B/Y] STUN THE OPPONENT FOR A SHORT TIME..."},
{condition = "", btntonext = true, txt = "HEAVY ATTACKS HP/HK[C/Z] ARE SLOWER BUT IN ADDITION TO DOING MORE DAMAGE, IT STUN FOR LONGER TIME THAN MEDIUM ATTACKS..."},
{condition = "f_tutoCheck9", btntonext = false, txt = "COOL. NOW TRY ALL PREVIOUS ATTACKS DURING JUMP (PRESS [A], [B], [C], [X], [Y] AND [Z] BUTTONS ON AIR)."},
{condition = "f_tutoCheck10", btntonext = false, txt = "GREAT!           LIKE JUMPING, YOU CAN ALSO ATTACK DURING CROUCH.       (PRESS [A], [B], [C], [X], [Y] AND [Z] BUTTONS WHEN CROUCH)."},
{condition = "f_tutoCheck11", btntonext = false, txt = "MARVELOUS!       YOU CAN GRAB THE OPPONENT BY PRESSING [B] AND [Y] BUTTON AT THE SAME TIME WITH [RIGHT] OR [LEFT] BUTTONS."},
{condition = "f_tutoCheck12", btntonext = false, txt = "WONDERFUL!       YOU CAN STOP AND PUSH YOUR OPPONENT WHILE HE IS ATTACKING OR NOT BY PRESSING [C] AND [Z] BUTTONS AT THE SAME TIME."},
{condition = "", btntonext = true, txt = "FANTASTIC! NOW...      SPECIAL MOVES ARE BUTTON COMBINATIONS THAT ALLOW YOU TO DEAL MORE DAMAGE THAN NORMAL HITS..."},
{condition = "", btntonext = true, txt = "KUNG FU GIRL HAS 3 SPECIAL MOVES..."},
{condition = "f_tutoCheck13", btntonext = false, txt = 'THE FIRST ONE IS A "KUNG FU PALM". YOU CAN EXECUTE IT BY PRESSING [DOWN]+[RIGHT]+[ANY PUNCH]. TRY IT!'},
{condition = "f_tutoCheck14", btntonext = false, txt = "THE SECOND ONE IS A KICK COMBINATION. YOU CAN EXECUTE IT BY PRESSING [DOWN]+[LEFT]+[ANY KICK]. TRY IT!"},
{condition = "f_tutoCheck15", btntonext = false, txt = "THIS ONE CAN BE FOLLOWED BY MASHING ANY KICK BUTTON. TRY IT!"},
{condition = "f_tutoCheck16", btntonext = false, txt = "THE LAST ONE IS A DIVE KICK. TO DO IT, PRESS [RIGHT]+[DOWN]+[RIGHT]+[ANY KICK 2 TIMES]."},
{condition = "", btntonext = true, txt = "AWESOME! NOW LET'S TALK ABOUT THE EX MOVES..."},
{condition = "", btntonext = true, txt = "THE EX MOVES ARE IMPROVEMENTS FOR THE SPECIAL MOVES. TO EXECUTE IT, YOU NEED AT LEAST 1 POWER BAR AND PRESS AT THE SAME TIME 2 BUTTONS THAT EXECUTE THE MOVE..."},
{condition = "f_tutoCheck17", btntonext = false, txt = "DO EX VERSION FOR ALL SPECIAL MOVES!"},
{condition = "f_tutoCheck18", btntonext = false, txt = "PERFECT! NOW TEST YOUR MIGHT DEFEATING ME. AND.. THIS IS OPTIONAL BUT WITH WHAT YOU HAVE LEARNED AND THE POWER RESOURCES AVAILABLE, TRY TO MAKE A COMBO OF MORE THAN 10 HITS!"},
{condition = "", btntonext = true, txt = ""},
}

--The next checks uses the CNS triggers and KFG char as base example
function f_tutoCheck1()
	if teamside() == 1 and anim() == 20 and time() > 30 and posX() >= 10 then
		return true
	else
		return false
	end
end

function f_tutoCheck2()
	if teamside() == 1 and anim() == 21 and time() > 30 and posX() <= 90 then
		return true
	end
end

function f_tutoCheck3()
	if teamside() == 1 and anim() == 11 then
		return true
	end
end

function f_tutoCheck4()
	if teamside() == 1 and anim() == 41 and time() >= 30 then
		return true
	end
end

function f_tutoCheck5()
	if teamside() == 1 and anim() == 106 then
		return true
	end
end

function f_tutoCheck6()
	if teamside() == 1 and anim() == 101 then
		return true
	end
end

local success = false
local check1 = false
local check2 = false
local check3 = false
local check4 = false
local check5 = false
local check6 = false

function f_tutoCheck7()
	if teamside() == 1 then
	--Check LP
		if anim() == 200 and hitcount() == 1 and not check1 then
			check1 = true
		end
	--Check MP
		if anim() == 210 and hitcount() == 1 and not check2 then
			check2 = true
		end
	--Check HP
		if (anim() == 220 or anim() == 221) and hitcount() == 1 and not check3 then
			check3 = true
		end
	end
	if check1 and check2 and check3 then
		check1 = false
		check2 = false
		check3 = false
		return true
	end
end

function f_tutoCheck8()
	if teamside() == 1 then
	--Check LK
		if (anim() == 230 or anim() == 231) and hitcount() == 1 and not check1 then
			check1 = true
		end
	--Check MK
		if anim() == 240 and hitcount() == 1 and not check2 then
			check2 = true
		end
	--Check HK
		if (anim() == 250 or anim() == 251) and hitcount() == 1 and not check3 then
			check3 = true
		end
	end
	if check1 and check2 and check3 then
		check1 = false
		check2 = false
		check3 = false
		return true
	end
end

function f_tutoCheck9()
	if teamside() == 1 then
	--Check AIR LP
		if anim() == 600 and hitcount() == 1 and not check1 then
			check1 = true
		end
	--Check AIR MP
		if anim() == 610 and hitcount() == 1 and not check2 then
			check2 = true
		end
	--Check AIR HP
		if anim() == 620 and hitcount() == 1 and not check3 then
			check3 = true
		end	
	--Check AIR LK
		if anim() == 630 and hitcount() == 1 and not check4 then
			check4 = true
		end
	--Check AIR MK
		if anim() == 640 and hitcount() == 1 and not check5 then
			check5 = true
		end
	--Check AIR HK
		if anim() == 650 and hitcount() == 1 and not check6 then
			check6 = true
		end
	end
	if check1 and check2 and check3 and check4 and check5 and check6 then
		check1 = false
		check2 = false
		check3 = false
		check4 = false
		check5 = false
		check6 = false
		return true
	end
end

function f_tutoCheck10()
	if teamside() == 1 then
	--Check DOWN LP
		if anim() == 400 and hitcount() == 1 and not check1 then
			check1 = true
		end
	--Check DOWN MP
		if anim() == 410 and hitcount() == 1 and not check2 then
			check2 = true
		end
	--Check DOWN HP
		if anim() == 420 and hitcount() == 1 and not check3 then
			check3 = true
		end	
	--Check DOWN LK
		if anim() == 430 and hitcount() == 1 and not check4 then
			check4 = true
		end
	--Check DOWN MK
		if anim() == 440 and hitcount() == 1 and not check5 then
			check5 = true
		end
	--Check DOWN HK
		if anim() == 450 and hitcount() == 1 and not check6 then
			check6 = true
		end
	end
	if check1 and check2 and check3 and check4 and check5 and check6 then
		check1 = false
		check2 = false
		check3 = false
		check4 = false
		check5 = false
		check6 = false
		return true
	end
end

function f_tutoCheck11()
	if teamside() == 1 then
	--Check Grab to Right
		if anim() == 810 and not check1 then
			check1 = true
		end
	--Check Grab to Left
		if anim() == 850 and not check2 then
			check2 = true
		end
	end
	if check1 and check2 then
		check1 = false
		check2 = false
		return true
	end
end

function f_tutoCheck12()
	if teamside() == 1 and anim() == 1420 then
		return true
	end
end

function f_tutoCheck13()
	if teamside() == 1 and (anim() == 1000 or anim() == 1010 or anim() == 1020) and time() >= 20 then
		return true
	end
end

function f_tutoCheck14()
	if teamside() == 1 and anim() == 1300 and time() >= 20 then
		return true
	end
end

function f_tutoCheck15()
	if teamside() == 1 and anim() == 1302 and time() >= 20 then
		return true
	end
end

function f_tutoCheck16()
	if teamside() == 1 and anim() == 1105 and time() >= 20 then
		return true
	end
end

function f_tutoCheck17()
	if teamside() == 1 then
	--Check EX KUNG FU PALM
		if anim() == 1030 and not check1 then
			check1 = true
		end
	--Check EX DIVE KICK
		if anim() == 1135 and not check2 then
			check2 = true
		end
	--Check EX ? KICK
		if anim() == 1332 and not check3 then
			check3 = true
		end
	end
	if check1 and check2 and check3 then
		check1 = false
		check2 = false
		check3 = false
		return true
	end
end