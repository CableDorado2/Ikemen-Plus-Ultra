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
	setPauseVar('nogiveup') --To avoid write exit conditionals in pause menu
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

--;===========================================================
--; INPUT DISPLAY GUIDE
--;===========================================================
--UP Button
local TbuttonUp = animNew(sprGlyphs, [[48,0, 0,0, -1]])

--DOWN Button
local TbuttonDown = animNew(sprGlyphs, [[42,0, 0,0, -1]])

--LEFT Button
local TbuttonLeft = animNew(sprGlyphs, [[44,0, 0,0, -1]])

--RIGHT Button
local TbuttonRight = animNew(sprGlyphs, [[46,0, 0,0, -1]])

--A Button
local TbuttonA = animNew(sprGlyphs, [[1,0, 0,0, -1]])

--B Button
local TbuttonB = animNew(sprGlyphs, [[2,0, 0,0, -1]])

--C Button
local TbuttonC = animNew(sprGlyphs, [[3,0, 0,0, -1]])

--R Button
local TbuttonR = animNew(sprGlyphs, [[28,0, 0,0, -1]])

--X Button
local TbuttonX = animNew(sprGlyphs, [[24,0, 0,0, -1]])

--Y Button
local TbuttonY = animNew(sprGlyphs, [[25,0, 0,0, -1]])

--Z Button
local TbuttonZ = animNew(sprGlyphs, [[26,0, 0,0, -1]])

--L Button
local TbuttonL = animNew(sprGlyphs, [[27,0, 0,0, -1]])

--Start Button
local TbuttonS = animNew(sprGlyphs, [[51,0, 0,0, -1]])

function f_tutoInputDisplay(key1, key2, key3, key4, key5)
	local alphaS = 20
	local alphaD = 100
	local alphaSB = 255
	local alphaDB = 0
	local scaleX = 0.35
	local scaleY = 0.35
--Button Pos X
	local posXup = 65
	local posXdo = 65
	local posXle = 45
	local posXri = 85
	local posXa = 110
	local posXb = 135
	local posXc = 160
	local posXx = 117
	local posXy = 140
	local posXz = 165
	local posXl = 190
	local posXr = 185
	local posXs = 215
--Button Pos Y
	local posYup = 45
	local posYdo = 85
	local posYle = 65
	local posYri = 65
	local posYa = 85
	local posYb = 80
	local posYc = 80
	local posYx = 60
	local posYy = 53
	local posYz = 53
	local posYl = 53
	local posYr = 80
	local posYs = 68
--Player 2/Hints Assets Pos X and Y Distance
	local posXP2 = 0
	local posYP2 = 122
--Draw Assets
--Player 1
	f_drawQuickSpr(TbuttonUp, posXup, posYup, scaleX, scaleY, alphaS, alphaD)
	f_drawQuickSpr(TbuttonDown, posXdo, posYdo, scaleX, scaleY, alphaS, alphaD)
	f_drawQuickSpr(TbuttonLeft, posXle, posYle, scaleX, scaleY, alphaS, alphaD)
	f_drawQuickSpr(TbuttonRight, posXri, posYri, scaleX, scaleY, alphaS, alphaD)
	f_drawQuickSpr(TbuttonA, posXa, posYa, scaleX, scaleY, alphaS, alphaD)
	f_drawQuickSpr(TbuttonB, posXb, posYb, scaleX, scaleY, alphaS, alphaD)
	f_drawQuickSpr(TbuttonC, posXc, posYc, scaleX, scaleY, alphaS, alphaD)
	f_drawQuickSpr(TbuttonX, posXx, posYx, scaleX, scaleY, alphaS, alphaD)
	f_drawQuickSpr(TbuttonY, posXy, posYy, scaleX, scaleY, alphaS, alphaD)
	f_drawQuickSpr(TbuttonZ, posXz, posYz, scaleX, scaleY, alphaS, alphaD)
	f_drawQuickSpr(TbuttonL, posXl, posYl, scaleX, scaleY, alphaS, alphaD)
	f_drawQuickSpr(TbuttonR, posXr, posYr, scaleX, scaleY, alphaS, alphaD)
	f_drawQuickSpr(TbuttonS, posXs, posYs, scaleX, scaleY, alphaS, alphaD)
--Player 2/Hints
	f_drawQuickSpr(TbuttonUp, posXup+posXP2, posYup+posYP2, scaleX, scaleY, alphaS, alphaD)
	f_drawQuickSpr(TbuttonDown, posXdo+posXP2, posYdo+posYP2, scaleX, scaleY, alphaS, alphaD)
	f_drawQuickSpr(TbuttonLeft, posXle+posXP2, posYle+posYP2, scaleX, scaleY, alphaS, alphaD)
	f_drawQuickSpr(TbuttonRight, posXri+posXP2, posYri+posYP2, scaleX, scaleY, alphaS, alphaD)
	f_drawQuickSpr(TbuttonA, posXa+posXP2, posYa+posYP2, scaleX, scaleY, alphaS, alphaD)
	f_drawQuickSpr(TbuttonB, posXb+posXP2, posYb+posYP2, scaleX, scaleY, alphaS, alphaD)
	f_drawQuickSpr(TbuttonC, posXc+posXP2, posYc+posYP2, scaleX, scaleY, alphaS, alphaD)
	f_drawQuickSpr(TbuttonX, posXx+posXP2, posYx+posYP2, scaleX, scaleY, alphaS, alphaD)
	f_drawQuickSpr(TbuttonY, posXy+posXP2, posYy+posYP2, scaleX, scaleY, alphaS, alphaD)
	f_drawQuickSpr(TbuttonZ, posXz+posXP2, posYz+posYP2, scaleX, scaleY, alphaS, alphaD)
	f_drawQuickSpr(TbuttonL, posXl+posXP2, posYl+posYP2, scaleX, scaleY, alphaS, alphaD)
	f_drawQuickSpr(TbuttonR, posXr+posXP2, posYr+posYP2, scaleX, scaleY, alphaS, alphaD)
	f_drawQuickSpr(TbuttonS, posXs+posXP2, posYs+posYP2, scaleX, scaleY, alphaS, alphaD)
--SHOW BUTTONS FOR PLAYER 1 CONTROL
	if commandGetState(p1Cmd, 'holdu') then f_drawQuickSpr(TbuttonUp, posXup, posYup, scaleX, scaleY, alphaSB, alphaDB) end
	if commandGetState(p1Cmd, 'holdd') then f_drawQuickSpr(TbuttonDown, posXdo, posYdo, scaleX, scaleY, alphaSB, alphaDB) end
	if commandGetState(p1Cmd, 'holdl') then f_drawQuickSpr(TbuttonLeft, posXle, posYle, scaleX, scaleY, alphaSB, alphaDB) end
	if commandGetState(p1Cmd, 'holdr') then f_drawQuickSpr(TbuttonRight, posXri, posYri, scaleX, scaleY, alphaSB, alphaDB) end
	if commandGetState(p1Cmd, 'holda') then f_drawQuickSpr(TbuttonA, posXa, posYa, scaleX, scaleY, alphaSB, alphaDB) end
	if commandGetState(p1Cmd, 'holdb') then f_drawQuickSpr(TbuttonB, posXb, posYb, scaleX, scaleY, alphaSB, alphaDB) end
	if commandGetState(p1Cmd, 'holdc') then f_drawQuickSpr(TbuttonC, posXc, posYc, scaleX, scaleY, alphaSB, alphaDB) end
	if commandGetState(p1Cmd, 'holdx') then f_drawQuickSpr(TbuttonX, posXx, posYx, scaleX, scaleY, alphaSB, alphaDB) end
	if commandGetState(p1Cmd, 'holdy') then f_drawQuickSpr(TbuttonY, posXy, posYy, scaleX, scaleY, alphaSB, alphaDB) end
	if commandGetState(p1Cmd, 'holdz') then f_drawQuickSpr(TbuttonZ, posXz, posYz, scaleX, scaleY, alphaSB, alphaDB) end
	if commandGetState(p1Cmd, 'holdq') then f_drawQuickSpr(TbuttonL, posXl, posYl, scaleX, scaleY, alphaSB, alphaDB) end
	if commandGetState(p1Cmd, 'holdw') then f_drawQuickSpr(TbuttonR, posXr, posYr, scaleX, scaleY, alphaSB, alphaDB) end
	if commandGetState(p1Cmd, 'holds') then f_drawQuickSpr(TbuttonS, posXs, posYs, scaleX, scaleY, alphaSB, alphaDB) end
--SHOW BUTTONS FOR PLAYER 2/HINTS
	if key1 == "_U" then f_drawQuickSpr(TbuttonUp, posXup+posXP2, posYup+posYP2, scaleX, scaleY, alphaSB, alphaDB) end
	if key1 == "_D" then f_drawQuickSpr(TbuttonDown, posXdo+posXP2, posYdo+posYP2, scaleX, scaleY, alphaSB, alphaDB) end
	if key1 == "_B" then f_drawQuickSpr(TbuttonLeft, posXle+posXP2, posYle+posYP2, scaleX, scaleY, alphaSB, alphaDB) end
	if key1 == "_F" then f_drawQuickSpr(TbuttonRight, posXri+posXP2, posYri+posYP2, scaleX, scaleY, alphaSB, alphaDB) end
	if key1 == "^A" then f_drawQuickSpr(TbuttonA, posXa+posXP2, posYa+posYP2, scaleX, scaleY, alphaSB, alphaDB) end
	if key1 == "^B" then f_drawQuickSpr(TbuttonB, posXb+posXP2, posYb+posYP2, scaleX, scaleY, alphaSB, alphaDB) end
	if key1 == "^C" then f_drawQuickSpr(TbuttonC, posXc+posXP2, posYc+posYP2, scaleX, scaleY, alphaSB, alphaDB) end
	if key1 == "^X" then f_drawQuickSpr(TbuttonX, posXx+posXP2, posYx+posYP2, scaleX, scaleY, alphaSB, alphaDB) end
	if key1 == "^Y" then f_drawQuickSpr(TbuttonY, posXy+posXP2, posYy+posYP2, scaleX, scaleY, alphaSB, alphaDB) end
	if key1 == "^Z" then f_drawQuickSpr(TbuttonZ, posXz+posXP2, posYz+posYP2, scaleX, scaleY, alphaSB, alphaDB) end
	if key1 == "^L" then f_drawQuickSpr(TbuttonL, posXl+posXP2, posYl+posYP2, scaleX, scaleY, alphaSB, alphaDB) end
	if key1 == "^R" then f_drawQuickSpr(TbuttonR, posXr+posXP2, posYr+posYP2, scaleX, scaleY, alphaSB, alphaDB) end
	if key1 == "^S" then f_drawQuickSpr(TbuttonS, posXs+posXP2, posYs+posYP2, scaleX, scaleY, alphaSB, alphaDB) end
end

--Input Hints Tables uses Input Display Guide assets to display
t_tutoInput1 = {
	btn = "_F", --What button will be displayed
	time = 500, --For what ticks will be displayed
}

t_tutorialDiag = {
{btntonext = true, txt = "WELCOME TO THE TUTORIAL MODE!                THIS IS A DIALOGUE TEST.                 WHEN THE [DOWN] ARROW APPEARS, PLEASE USE [SELECT] BUTTON TO GO TO THE NEXT TEXT..."},
{btntonext = true, txt = "DURING THIS TUTORIAL, ALL MOVES ARE EXPLAINED CONSIDERING THAT YOUR CHARACTER IS ON LEFT SIDE FACING TO THE OPPONENT ON THE RIGHT SIDE."},
{btntonext = true, txt = "OK, LET'S TRY SOME MOVES."},
{condition = "f_tutoCheck1", inputhint = t_tutoInput1, btntonext = false, txt = "GO FORDWARD USING [RIGHT] BUTTON AND COME TO ME."},
{condition = "f_tutoCheck2", btntonext = false, txt = "NICE. NOW GO BACK USING [LEFT] BUTTON."},
{condition = "f_tutoCheck3", btntonext = false, txt = "GOOD. NOW CROUCH WITH [DOWN] BUTTON."},
{condition = "f_tutoCheck4", btntonext = false, txt = "YEP. JUMP WITH [UP] BUTTON."},
{condition = "f_tutoCheck5", btntonext = false, txt = "HMM. TAP 2 TIMES [LEFT] BUTTON"},
{condition = "f_tutoCheck6", btntonext = false, txt = "NOW! TAP 2 TIMES [RIGHT] BUTTON"},
{condition = "f_tutoCheck7", btntonext = false, txt = "LET'S TRY THOSE FIST.                      PRESS [X], [Y] AND [Z] BUTTONS TO ATTACK ME."},
{condition = "f_tutoCheck8", btntonext = false, txt = "LET'S TRY THOSE KICKS.                     PRESS [A], [B] AND [C] BUTTONS TO KICK ME."},
{btntonext = true, txt = "EACH BUTTON HAVE DIFFERENT DAMAGE PROPERTIES."},
{btntonext = true, txt = "LOW ATTACKS LP/LK[X/A] ARE FASTER."},
{btntonext = true, txt = "MEDIUM ATTACKS MP/MK[Y/B] STUN THE OPPONENT FOR A SHORT TIME."},
{btntonext = true, txt = "HEAVY ATTACKS HP/HK[Z/C] ARE SLOWER BUT IN ADDITION TO DOING MORE DAMAGE, IT STUN FOR LONGER TIME THAN MEDIUM ATTACKS."},
{condition = "f_tutoCheck9", btntonext = false, txt = "COOL. NOW TRY ALL PREVIOUS ATTACKS DURING JUMP (PRESS [A], [B], [C], [X], [Y] AND [Z] BUTTONS ON AIR)."},
{condition = "f_tutoCheck10", btntonext = false, txt = "GREAT! LIKE JUMPING, YOU CAN ALSO ATTACK DURING CROUCH.(PRESS [A], [B], [C], [X], [Y] AND [Z] BUTTONS WHEN CROUCH)."},
{condition = "f_tutoCheck11", btntonext = false, txt = "MARVELOUS! YOU CAN GRAB THE OPPONENT BY PRESSING [B] AND [Y] BUTTON AT THE SAME TIME WITH [RIGHT] OR [LEFT] BUTTONS."},
{condition = "f_tutoCheck12", btntonext = false, txt = "WONDERFUL! YOU CAN STOP AND PUSH YOUR OPPONENT WHILE HE IS ATTACKING OR NOT BY PRESSING [C] AND [Z] BUTTONS AT THE SAME TIME."},
{btntonext = true, txt = "FANTASTIC! NOW... SPECIAL MOVES ARE BUTTON COMBINATIONS THAT ALLOW YOU TO DEAL MORE DAMAGE THAN NORMAL HITS."},
{btntonext = true, txt = "KUNG FU GIRL HAS 3 SPECIAL MOVES."},
{condition = "f_tutoCheck13", btntonext = false, txt = 'THE FIRST ONE IS A "KUNG FU PALM".       YOU CAN EXECUTE IT BY PRESSING [DOWN]+[RIGHT]+[X/Y/Z]. TRY IT!'},
{condition = "f_tutoCheck14", btntonext = false, txt = "THE SECOND ONE IS A KICK COMBINATION.    YOU CAN EXECUTE IT BY PRESSING [DOWN]+[LEFT]+[A/B/C]. TRY IT!"},
{condition = "f_tutoCheck15", btntonext = false, txt = "THIS ONE CAN BE FOLLOWED BY MASHING ANY KICK BUTTON. TRY IT!"},
{condition = "f_tutoCheck16", btntonext = false, txt = "THE LAST ONE IS A DIVE KICK. TO DO IT, PRESS [RIGHT]+[DOWN]+[RIGHT]+[B/C (2 TIMES)]."},
{btntonext = true, txt = "AWESOME!                                  NOW LET'S TALK ABOUT THE EX MOVES."},
{btntonext = true, txt = "THE EX MOVES ARE IMPROVEMENTS FOR SPECIAL MOVES. TO EXECUTE IT, YOU NEED AT LEAST 1 POWER BAR AND PRESS AT THE SAME TIME 2 BUTTONS THAT EXECUTE THE MOVE."},
{condition = "f_tutoCheck17", btntonext = false, txt = "DO EX VERSION FOR ALL SPECIAL MOVES!"},
{btntonext = true, txt = "PERFECT! NOW TEST YOUR MIGHT DEFEATING ME. AND.. THIS IS OPTIONAL BUT WITH WHAT YOU HAVE LEARNED:                                           TRY TO MAKE A COMBO OF MORE THAN 10 HITS!"},
{hidediag = true, infight = true},
}
if data.debugLog then f_printTable(t_tutorialDiag, "save/debug/t_tutorialDiag.txt") end

--Checks functions uses the CNS triggers and KFG char as base example
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