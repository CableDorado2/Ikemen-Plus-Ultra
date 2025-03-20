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
	setRoundsToWin(-1) --rounds to win
	setRoundTime(-1) --round time disabled
	data.versusScreen = false --versus screen disabled
	data.victoryscreen = false --victory screen disabled
	data.stage = "stages/HD TEST/Training Room(Scale).def" --predefined custom stage
	data.bgm = "sound/System/Tutorial.mp3" --predefined custom song route
	data.p1TeamMenu = {mode = 0, chars = 1} --predefined P1 team mode as Single, 1 Character				
	data.p2TeamMenu = {mode = 0, chars = 1} --predefined P2 team mode as Single, 1 Character
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
{condition = "", btntonext = true, txt = "OK, LET'S TRY SOME MOVES"},
{condition = "f_tutoCheck1", btntonext = false, txt = "PRESS FORDWARD BUTTON AND COME TO ME."},
{condition = "f_tutoCheck2", btntonext = false, txt = "NICE. NOW GO BACK USING LEFT BUTTON"},
{condition = "f_tutoCheck3", btntonext = false, txt = "GOOD. NOW CROUCH WITH DOWN BUTTON"},
{condition = "f_tutoCheck4", btntonext = false, txt = "YEP. JUMP WITH UP BUTTON"},
{condition = "f_tutoCheck5", btntonext = false, txt = "HMM. TAP 2 TIMES LEFT BUTTON"},
{condition = "f_tutoCheck6", btntonext = false, txt = "NOW. TAP 2 TIMES RIGHT BUTTON"},
{condition = "f_tutoCheck7", btntonext = false, txt = "LET'S TRY THOSE FITS, USE [A] [B] AND [C] BUTTONS TO ATTACK ME."},
{condition = "f_tutoCheck8", btntonext = false, txt = "LET'S TRY THOSE FITS, USE [A] [B] AND [C] BUTTONS TO PUNCH ME."},
{condition = "f_tutoCheck9", btntonext = false, txt = "LET'S TRY THOSE FITS, USE [A] [B] AND [C] BUTTONS TO PUNCH ME."},
{condition = "f_tutoCheck10", btntonext = false, txt = "LET'S TRY THOSE FITS, USE [A] [B] AND [C] BUTTONS TO PUNCH ME."},
{condition = "f_tutoCheck11", btntonext = false, txt = "LET'S TRY THOSE FITS, USE [A] [B] AND [C] BUTTONS TO PUNCH ME."},
{condition = "f_tutoCheck12", btntonext = false, txt = "LET'S TRY THOSE FITS, USE [A] [B] AND [C] BUTTONS TO PUNCH ME."},
{condition = "f_tutoCheck13", btntonext = false, txt = "LET'S TRY THOSE FITS, USE [A] [B] AND [C] BUTTONS TO PUNCH ME."},
{condition = "f_tutoCheck14", btntonext = false, txt = "LET'S TRY THOSE FITS, USE [A] [B] AND [C] BUTTONS TO PUNCH ME."},
{condition = "f_tutoCheck15", btntonext = false, txt = "LET'S TRY THOSE FITS, USE [A] [B] AND [C] BUTTONS TO PUNCH ME."},
}

--The next checks uses the CNS triggers and KFG char as base example
function f_tutoCheck1()
	if teamside() == 1 and anim() == 20 and posX() >= 10 then
		return true
	else
		return false
	end
end

function f_tutoCheck2()
	if teamside() == 1 and anim() == 21 and posX() <= 90 then
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

function f_tutoCheck7()
	if teamside() == 1 then
	--Check LP
		if anim() == 200 and (teamside() == 2 and gethitvar("hitcount") == 1) and not check1 then
			check1 = true
		end
	--Check MP
		if anim() == 210 and  not check2 then
			check2 = true
		end
	--Check HP
		if anim() == 220 or anim() == 221 and  and check3 then
			check3 = true
		end
	end
	if check1 and check2 and check3 then
		return true
	end
end