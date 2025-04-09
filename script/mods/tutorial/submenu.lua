--;===========================================================
--; TUTORIAL MENU SCREENPACK DEFINITION
--;===========================================================
table.insert(t_practiceMenu,#t_practiceMenu,{id = textImgNew(), text = "TUTORIAL", gotomenu = "f_tutorial()"}) --Insert new item to t_practiceMenu table loaded by screenpack.lua
sprTutorial = sffNew("script/mods/tutorial/tutorial.sff") --Load tutorial sprites
sndTutorial = sndNew("script/mods/tutorial/tutorial.snd") --Load tutorial sfx
bgmTutorial = "script/mods/tutorial/Tutorial.mp3" --set Tutorial Mode BGM
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
	setRoundsToWin(1) --rounds to win
	setRoundTime(-1) --round time disabled
	data.versusScreen = false --versus screen disabled
	data.victoryscreen = false --victory screen disabled
	data.stage = "stages/Others/Training Room.def" --predefined custom stage
	data.zoomStage = {zoom = data.zoomActive, zoomOut = data.zoomMin, zoomIn = 0.8, zoomSpeed = data.zoomSpeed} --custom zoom values for this match
	data.bgm = bgmTutorial --predefined custom song route
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

--Steps BG
tutorialStepBG = animNew(sprTutorial, [[
3,0, 0,0, -1
]])
animSetAlpha(tutorialStepBG, 255, 22)
animUpdate(tutorialStepBG)

--Clear Message
tutorialClear = animNew(sprTutorial, [[
10,0, 0,0, -1
]])

--Inputs Info Window BG
tutorialInputWindowBG = animNew(sprTutorial, [[
3,0, 0,0, -1
]])
animSetScale(tutorialInputWindowBG, 1, 0.41)
animSetAlpha(tutorialInputWindowBG, 155, 22)
animSetPos(tutorialInputWindowBG, 224, 106)
animUpdate(tutorialInputWindowBG)

function drawTutorialInputHints()
	local inputHintYPos = 109
	local hintFont = font2
	local hintFontYPos = 123
	--animDraw(tutorialInputWindowBG)
	drawInGameInputHintsP1("e","350,85")
	--f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Next Step", 251, hintFontYPos)
end

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

local currentItem = 1
local currentInputTick = 0

function f_tutoInputDisplay(t)
	local t_inputs = t
	local alphaS = 20
	local alphaD = 100
	local alphaSB = 255
	local alphaDB = 0
	local scaleX = 0.25
	local scaleY = 0.25
--Button Pos X
	local posXup = 16
	local posXdo = 16
	local posXle = 0
	local posXri = 31
	
	local posXa = 55
	local posXb = 75
	local posXc = 95
	
	local posXx = 62
	local posXy = 80
	local posXz = 100
	
	local posXl = 120
	local posXr = 115
	
	local posXs = 135
--Button Pos Y
	local posYup = 193
	local posYdo = 225
	local posYle = 210
	local posYri = 210
	
	local posYa = 220
	local posYb = 215
	local posYc = 215
	
	local posYx = 203
	local posYy = 197
	local posYz = 197
	
	local posYl = 197
	local posYr = 215
	
	local posYs = 209
--Player 2/Hints Assets Pos X and Y Distance
	local posXP2 = 170
	local posYP2 = 0
--Display Logic
	local spritesToDraw = {}  --Crear una tabla para almacenar los sprites a dibujar
	if currentItem > #t_inputs then currentItem = 1 end --restart hints (loop)
--Get Current Button and Display Time	
	local currentInput = t_inputs[currentItem]
	local button = currentInput.btn
	local displayTime = currentInput.time
	local hold = currentInput.hold
--If the time has been reached, move on to the next
	if currentInputTick < displayTime then
		currentInputTick = currentInputTick + 1
	else
		currentItem = currentItem + 1
		currentInputTick = 0
	end
--Always draw current button
	if button then
		table.insert(spritesToDraw, button)
	end
--If any button have "hold=true", keep previous sprite
	for i=1, currentItem-1 do
		local pastInput = t_inputs[i]
		local pastButton = pastInput.btn
		if pastInput.hold then
			table.insert(spritesToDraw, pastButton)
		end
	end
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
	for _, button in ipairs(spritesToDraw) do
		if button == "_U" then f_drawQuickSpr(TbuttonUp, posXup+posXP2, posYup+posYP2, scaleX, scaleY, alphaSB, alphaDB) end
		if button == "_D" then f_drawQuickSpr(TbuttonDown, posXdo+posXP2, posYdo+posYP2, scaleX, scaleY, alphaSB, alphaDB) end
		if button == "_B" then f_drawQuickSpr(TbuttonLeft, posXle+posXP2, posYle+posYP2, scaleX, scaleY, alphaSB, alphaDB) end
		if button == "_F" then f_drawQuickSpr(TbuttonRight, posXri+posXP2, posYri+posYP2, scaleX, scaleY, alphaSB, alphaDB) end
		if button == "^A" then f_drawQuickSpr(TbuttonA, posXa+posXP2, posYa+posYP2, scaleX, scaleY, alphaSB, alphaDB) end
		if button == "^B" then f_drawQuickSpr(TbuttonB, posXb+posXP2, posYb+posYP2, scaleX, scaleY, alphaSB, alphaDB) end
		if button == "^C" then f_drawQuickSpr(TbuttonC, posXc+posXP2, posYc+posYP2, scaleX, scaleY, alphaSB, alphaDB) end
		if button == "^X" then f_drawQuickSpr(TbuttonX, posXx+posXP2, posYx+posYP2, scaleX, scaleY, alphaSB, alphaDB) end
		if button == "^Y" then f_drawQuickSpr(TbuttonY, posXy+posXP2, posYy+posYP2, scaleX, scaleY, alphaSB, alphaDB) end
		if button == "^Z" then f_drawQuickSpr(TbuttonZ, posXz+posXP2, posYz+posYP2, scaleX, scaleY, alphaSB, alphaDB) end
		if button == "^L" then f_drawQuickSpr(TbuttonL, posXl+posXP2, posYl+posYP2, scaleX, scaleY, alphaSB, alphaDB) end
		if button == "^R" then f_drawQuickSpr(TbuttonR, posXr+posXP2, posYr+posYP2, scaleX, scaleY, alphaSB, alphaDB) end
		if button == "^S" then f_drawQuickSpr(TbuttonS, posXs+posXP2, posYs+posYP2, scaleX, scaleY, alphaSB, alphaDB) end
	end
end

--Input Hints Tables uses Input Display Guide assets to display
t_tutoInput1 = {
--Step 1
	{
		btn = "_F", --What button will be displayed
		time = 0, --For how many ticks will be displayed
	},
}

t_tutoInput2 = {
	{
		btn = "_B",
		time = 0,
	},
}

t_tutoInput3 = {
	{
		btn = "_D",
		time = 0,
	},
}

t_tutoInput4 = {
	{
		btn = "_U",
		time = 0,
	},
}

t_tutoInput5 = {
--Step 1
	{
		btn = "_B",
		time = 10,
	},
--Step 2
	{
		btn = "",
		time = 5,
	},
}

t_tutoInput6 = {
	{
		btn = "_F",
		time = 10,
	},
	{
		btn = "",
		time = 5,
	},
}

t_tutoInput7 = {
	{
		btn = "^X",
		time = 25,
	},
	{
		btn = "^Y",
		time = 25,
	},
	{
		btn = "^Z",
		time = 25,
	},
}

t_tutoInput8 = {
	{
		btn = "^A",
		time = 25,
	},
	{
		btn = "^B",
		time = 25,
	},
	{
		btn = "^C",
		time = 25,
	},
}

t_tutoInput9 = {
	{
		btn = "_U",
		hold = true,
		time = 0,
	},
	{
		btn = "^A",
		time = 25,
	},
	{
		btn = "^X",
		time = 25,
	},
	{
		btn = "^B",
		time = 25,
	},
	{
		btn = "^Y",
		time = 25,
	},
	{
		btn = "^C",
		time = 25,
	},
	{
		btn = "^Z",
		time = 25,
	},
}

t_tutoInput10 = {
	{
		btn = "_D",
		hold = true,
		time = 0,
	},
	{
		btn = "^A",
		time = 25,
	},
	{
		btn = "^X",
		time = 25,
	},
	{
		btn = "^B",
		time = 25,
	},
	{
		btn = "^Y",
		time = 25,
	},
	{
		btn = "^C",
		time = 25,
	},
	{
		btn = "^Z",
		time = 25,
	},
}

t_tutoInput11 = {
	{
		btn = "^Y",
		hold = true,
		time = 0,
	},
	{
		btn = "^B",
		hold = true,
		time = 0,
	},
	{
		btn = "_F",
		time = 40,
	},
	{
		btn = "_B",
		time = 40,
	},
}

t_tutoInput12 = {
	{
		btn = "^Z",
		hold = true,
		time = 0,
	},
	{
		btn = "^C",
		hold = true,
		time = 0,
	},
	{
		btn = "",
		time = 40,
	},
}

t_tutoInput13 = {
	{
		btn = "_D",
		time = 10,
	},
	{
		btn = "_F",
		time = 10,
	},
	{
		btn = "^X",
		time = 10,
	},
	{
		btn = "",
		time = 60,
	},
}

t_tutoInput14 = {
	{
		btn = "_D",
		time = 10,
	},
	{
		btn = "_B",
		time = 10,
	},
	{
		btn = "^A",
		time = 10,
	},
	{
		btn = "",
		time = 60,
	},
}

t_tutoInput15 = {
	{
		btn = "_D",
		time = 10,
	},
	{
		btn = "_B",
		time = 10,
	},
	{
		btn = "^A",
		time = 10,
	},
	{
		btn = "",
		time = 10,
	},
	{
		btn = "^A",
		time = 10,
	},
	{
		btn = "",
		time = 10,
	},
	{
		btn = "^A",
		time = 10,
	},
	{
		btn = "",
		time = 60,
	},
}

t_tutoInput16 = {
	{
		btn = "_F",
		time = 10,
	},
	{
		btn = "_D",
		time = 10,
	},
	{
		btn = "_F",
		time = 10,
	},
	{
		btn = "^B",
		time = 10,
	},
	{
		btn = "",
		time = 10,
	},
	{
		btn = "^B",
		time = 10,
	},
	{
		btn = "",
		time = 60,
	},	
}

t_tutorialDiag = {
{btntonext = true, txt = "WELCOME TO THE TUTORIAL MODE!                THIS IS A DIALOGUE TEST.                 WHEN THE [DOWN] ARROW APPEARS, PLEASE USE [SELECT] BUTTON TO GO TO THE NEXT TEXT..."},
{btntonext = true, txt = "DURING THIS TUTORIAL, ALL MOVES ARE EXPLAINED CONSIDERING THAT YOUR CHARACTER IS ON LEFT SIDE FACING TO THE OPPONENT ON THE RIGHT SIDE."},
{btntonext = true, txt = "OK, LET'S TRY SOME MOVES."},
{condition = "f_tutoCheck1", inputhint = t_tutoInput1, txt = "GO FORDWARD USING [RIGHT] BUTTON AND COME TO ME."},
{condition = "f_tutoCheck2", inputhint = t_tutoInput2, txt = "NICE. NOW GO BACK USING [LEFT] BUTTON."},
{condition = "f_tutoCheck3", inputhint = t_tutoInput3, txt = "GOOD. YOU CAN CROUCH WITH [DOWN] BUTTON."},
{condition = "f_tutoCheck4", inputhint = t_tutoInput4, txt = "EXCELLENT. JUMP WITH [UP] BUTTON."},
{condition = "f_tutoCheck5", inputhint = t_tutoInput5, txt = "HMM. TAP 2 TIMES [LEFT] BUTTON TO RUN BACKWARD."},
{condition = "f_tutoCheck6", inputhint = t_tutoInput6, txt = "NOW! TAP 2 TIMES [RIGHT] BUTTON TO RUN FORDWARD."},
{condition = "f_tutoCheck7", inputhint = t_tutoInput7, txt = "LET'S TRY THOSE FIST.                      PRESS [X], [Y] AND [Z] BUTTONS TO ATTACK ME."},
{condition = "f_tutoCheck8", inputhint = t_tutoInput8, txt = "LET'S TRY THOSE KICKS.                     PRESS [A], [B] AND [C] BUTTONS TO KICK ME."},
{btntonext = true, txt = "EACH BUTTON HAVE DIFFERENT DAMAGE PROPERTIES."},
{btntonext = true, txt = "LOW ATTACKS LP/LK[X/A] ARE FASTER."},
{btntonext = true, txt = "MEDIUM ATTACKS MP/MK[Y/B] STUN THE OPPONENT FOR A SHORT TIME."},
{btntonext = true, txt = "HEAVY ATTACKS HP/HK[Z/C] ARE SLOWER BUT IN ADDITION TO DOING MORE DAMAGE, IT STUN FOR LONGER TIME THAN MEDIUM ATTACKS."},
{condition = "f_tutoCheck9", inputhint = t_tutoInput9, txt = "COOL. NOW TRY ALL PREVIOUS ATTACKS DURING JUMP (PRESS [A], [B], [C], [X], [Y] AND [Z] BUTTONS ON AIR)."},
{condition = "f_tutoCheck10", inputhint = t_tutoInput10, txt = "GREAT! LIKE JUMPING, YOU CAN ALSO ATTACK DURING CROUCH.(PRESS [A], [B], [C], [X], [Y] AND [Z] BUTTONS WHEN CROUCH)."},
{condition = "f_tutoCheck11", inputhint = t_tutoInput11, txt = "MARVELOUS! YOU CAN GRAB AND THROW YOUR OPPONENT BY PRESSING [B] AND [Y] BUTTON AT THE SAME TIME WITH [RIGHT] OR [LEFT] BUTTONS."},
{condition = "f_tutoCheck12", inputhint = t_tutoInput12, txt = "WONDERFUL! YOU CAN STOP AND PUSH YOUR OPPONENT WHILE HE IS ATTACKING OR NOT BY PRESSING [C] AND [Z] BUTTONS AT THE SAME TIME."},
{btntonext = true, txt = "FANTASTIC! NOW... SPECIAL MOVES ARE BUTTON COMBINATIONS THAT ALLOW YOU TO DEAL MORE DAMAGE THAN NORMAL HITS."},
{btntonext = true, txt = "KUNG FU GIRL HAS 3 SPECIAL MOVES."},
{condition = "f_tutoCheck13", inputhint = t_tutoInput13, txt = 'THE FIRST ONE IS A "KUNG FU PALM".       YOU CAN EXECUTE IT BY PRESSING [DOWN]+[RIGHT]+[X/Y/Z]. TRY IT!'},
{condition = "f_tutoCheck14", inputhint = t_tutoInput14, txt = 'THE SECOND ONE IS A "KUNG FU SHUFFLE".    YOU CAN EXECUTE IT BY PRESSING [DOWN]+[LEFT]+[A/B/C]. TRY IT!'},
{condition = "f_tutoCheck15", inputhint = t_tutoInput15, txt = '"KUNG FU SHUFFLE" CAN BE FOLLOWED BY MASHING 2 TIMES ANY KICK BUTTON. TRY IT!'},
{condition = "f_tutoCheck16", inputhint = t_tutoInput16, txt = 'THE LAST ONE IS A "KUNG FU KNEE". TO DO IT,    PRESS [RIGHT]+[DOWN]+[RIGHT]+[B/C + B/C].'},
{btntonext = true, txt = "AWESOME!                                  NOW LET'S TALK ABOUT THE EX MOVES."},
{btntonext = true, txt = "EVERY TIME THAT YOU ATTACK OR CONNECT HITS, YOUR POWER BAR INCREASES."},
{btntonext = true, txt = "THE EX MOVES ARE IMPROVEMENTS FOR SPECIAL MOVES. TO EXECUTE IT, YOU NEED AT LEAST 1 POWER BAR AND PRESS AT THE SAME TIME 2 BUTTONS THAT EXECUTE THE MOVE."},
{condition = "f_tutoCheck17", txt = "DO EX VERSION FOR ALL SPECIAL MOVES!"},
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

function f_resetTutoVars()
tutoSuccess = false
tutoCheck1 = false
tutoCheck2 = false
tutoCheck3 = false
tutoCheck4 = false
tutoCheck5 = false
tutoCheck6 = false

tutoColor1 = 0
tutoColor2 = 0
tutoColor3 = 0
tutoColor4 = 0
tutoColor5 = 0
tutoColor6 = 0
end
f_resetTutoVars()

local tutoHintFont = font2
local tutoHintPosX = 2
local tutoHintPosY = 0

local tutoHintPunch = "Punch "
local tutoHintKick = "Kick "

local tutoHintLight = "Light "
local tutoHintMedium = "Medium "
local tutoHintStrong = "Strong "

local tutoHintStand = "Stand "
local tutoHintJump = "Jump "
local tutoHintCrouch = "Crouching "

function f_tutoCheck7()
	animPosDraw(tutorialStepBG, -2, 100)
	f_drawQuickText(txt_tutoHint, tutoHintFont, tutoColor1, 1, tutoHintStand..tutoHintLight..tutoHintPunch, tutoHintPosX, 110)
	f_drawQuickText(txt_tutoHint, tutoHintFont, tutoColor2, 1, tutoHintStand..tutoHintMedium..tutoHintPunch, tutoHintPosX, 130)
	f_drawQuickText(txt_tutoHint, tutoHintFont, tutoColor3, 1, tutoHintStand..tutoHintStrong..tutoHintPunch, tutoHintPosX, 150)
	if teamside() == 1 then
	--Check LP
		if anim() == 200 and hitcount() == 1 and not tutoCheck1 then
			tutoCheck1 = true
			tutoColor1 = 5
		end
	--Check MP
		if anim() == 210 and hitcount() == 1 and not tutoCheck2 then
			tutoCheck2 = true
			tutoColor2 = 5
		end
	--Check HP
		if (anim() == 220 or anim() == 221) and hitcount() == 1 and not tutoCheck3 then
			tutoCheck3 = true
			tutoColor3 = 5
		end
	end
	if tutoCheck1 and tutoCheck2 and tutoCheck3 then
		return true
	end
end

function f_tutoCheck8()
	animPosDraw(tutorialStepBG, -2, 100)
	f_drawQuickText(txt_tutoHint, tutoHintFont, tutoColor1, 1, tutoHintStand..tutoHintLight..tutoHintKick, tutoHintPosX, 110)
	f_drawQuickText(txt_tutoHint, tutoHintFont, tutoColor2, 1, tutoHintStand..tutoHintMedium..tutoHintKick, tutoHintPosX, 130)
	f_drawQuickText(txt_tutoHint, tutoHintFont, tutoColor3, 1, tutoHintStand..tutoHintStrong..tutoHintKick, tutoHintPosX, 150)
	if teamside() == 1 then
	--Check LK
		if (anim() == 230 or anim() == 231) and hitcount() == 1 and not tutoCheck1 then
			tutoCheck1 = true
			tutoColor1 = 5
		end
	--Check MK
		if anim() == 240 and hitcount() == 1 and not tutoCheck2 then
			tutoCheck2 = true
			tutoColor2 = 5
		end
	--Check HK
		if (anim() == 250 or anim() == 251) and hitcount() == 1 and not tutoCheck3 then
			tutoCheck3 = true
			tutoColor3 = 5
		end
	end
	if tutoCheck1 and tutoCheck2 and tutoCheck3 then
		return true
	end
end

function f_tutoCheck9()
	animSetScale(tutorialStepBG, 1, 1.76)
	animPosDraw(tutorialStepBG, -2, 83)
	
	f_drawQuickText(txt_tutoHint, tutoHintFont, tutoColor1, 1, tutoHintJump..tutoHintLight..tutoHintPunch, tutoHintPosX, 90)
	f_drawQuickText(txt_tutoHint, tutoHintFont, tutoColor2, 1, tutoHintJump..tutoHintMedium..tutoHintPunch, tutoHintPosX, 110)
	f_drawQuickText(txt_tutoHint, tutoHintFont, tutoColor3, 1, tutoHintJump..tutoHintStrong..tutoHintPunch, tutoHintPosX, 130)
	
	f_drawQuickText(txt_tutoHint, tutoHintFont, tutoColor4, 1, tutoHintJump..tutoHintLight..tutoHintKick, tutoHintPosX, 150)
	f_drawQuickText(txt_tutoHint, tutoHintFont, tutoColor5, 1, tutoHintJump..tutoHintMedium..tutoHintKick, tutoHintPosX, 170)
	f_drawQuickText(txt_tutoHint, tutoHintFont, tutoColor6, 1, tutoHintJump..tutoHintStrong..tutoHintKick, tutoHintPosX, 190)
	if teamside() == 1 then
	--Check AIR LP
		if anim() == 600 and hitcount() == 1 and not tutoCheck1 then
			tutoCheck1 = true
			tutoColor1 = 5
		end
	--Check AIR MP
		if anim() == 610 and hitcount() == 1 and not tutoCheck2 then
			tutoCheck2 = true
			tutoColor2 = 5
		end
	--Check AIR HP
		if anim() == 620 and hitcount() == 1 and not tutoCheck3 then
			tutoCheck3 = true
			tutoColor3 = 5
		end	
	--Check AIR LK
		if anim() == 630 and hitcount() == 1 and not tutoCheck4 then
			tutoCheck4 = true
			tutoColor4 = 5
		end
	--Check AIR MK
		if anim() == 640 and hitcount() == 1 and not tutoCheck5 then
			tutoCheck5 = true
			tutoColor5 = 5
		end
	--Check AIR HK
		if anim() == 650 and hitcount() == 1 and not tutoCheck6 then
			tutoCheck6 = true
			tutoColor6 = 5
		end
	end
	if tutoCheck1 and tutoCheck2 and tutoCheck3 and tutoCheck4 and tutoCheck5 and tutoCheck6 then
		return true
	end
end

function f_tutoCheck10()
	animPosDraw(tutorialStepBG, -2, 83)
	
	f_drawQuickText(txt_tutoHint, tutoHintFont, tutoColor1, 1, tutoHintCrouch..tutoHintLight..tutoHintPunch, tutoHintPosX, 90)
	f_drawQuickText(txt_tutoHint, tutoHintFont, tutoColor2, 1, tutoHintCrouch..tutoHintMedium..tutoHintPunch, tutoHintPosX, 110)
	f_drawQuickText(txt_tutoHint, tutoHintFont, tutoColor3, 1, tutoHintCrouch..tutoHintStrong..tutoHintPunch, tutoHintPosX, 130)
	
	f_drawQuickText(txt_tutoHint, tutoHintFont, tutoColor4, 1, tutoHintCrouch..tutoHintLight..tutoHintKick, tutoHintPosX, 150)
	f_drawQuickText(txt_tutoHint, tutoHintFont, tutoColor5, 1, tutoHintCrouch..tutoHintMedium..tutoHintKick, tutoHintPosX, 170)
	f_drawQuickText(txt_tutoHint, tutoHintFont, tutoColor6, 1, tutoHintCrouch..tutoHintStrong..tutoHintKick, tutoHintPosX, 190)
	if teamside() == 1 then
	--Check DOWN LP
		if anim() == 400 and hitcount() == 1 and not tutoCheck1 then
			tutoCheck1 = true
			tutoColor1 = 5
		end
	--Check DOWN MP
		if anim() == 410 and hitcount() == 1 and not tutoCheck2 then
			tutoCheck2 = true
			tutoColor2 = 5
		end
	--Check DOWN HP
		if anim() == 420 and hitcount() == 1 and not tutoCheck3 then
			tutoCheck3 = true
			tutoColor3 = 5
		end	
	--Check DOWN LK
		if anim() == 430 and hitcount() == 1 and not tutoCheck4 then
			tutoCheck4 = true
			tutoColor4 = 5
		end
	--Check DOWN MK
		if anim() == 440 and hitcount() == 1 and not tutoCheck5 then
			tutoCheck5 = true
			tutoColor5 = 5
		end
	--Check DOWN HK
		if anim() == 450 and hitcount() == 1 and not tutoCheck6 then
			tutoCheck6 = true
			tutoColor6 = 5
		end
	end
	if tutoCheck1 and tutoCheck2 and tutoCheck3 and tutoCheck4 and tutoCheck5 and tutoCheck6 then
		return true
	end
end

function f_tutoCheck11()
	animSetScale(tutorialStepBG, 1, 1)
	animPosDraw(tutorialStepBG, -2, 100)
	f_drawQuickText(txt_tutoHint, tutoHintFont, tutoColor1, 1, "Forward Throw", tutoHintPosX, 110)
	f_drawQuickText(txt_tutoHint, tutoHintFont, tutoColor2, 1, "Back Throw", tutoHintPosX, 130)
	if teamside() == 1 then
	--Check Throw to Right
		if anim() == 810 and not tutoCheck1 then
			tutoCheck1 = true
			tutoColor1 = 5
		end
	--Check Grab to Left
		if anim() == 850 and not tutoCheck2 then
			tutoCheck2 = true
			tutoColor2 = 5
		end
	end
	if tutoCheck1 and tutoCheck2 then
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
	animPosDraw(tutorialStepBG, -2, 100)
	f_drawQuickText(txt_tutoHint, tutoHintFont, tutoColor1, 1, "EX Kung Fu Palm", tutoHintPosX, 110)
	f_drawQuickText(txt_tutoHint, tutoHintFont, tutoColor2, 1, "EX Kung Fu Knee", tutoHintPosX, 130)
	f_drawQuickText(txt_tutoHint, tutoHintFont, tutoColor3, 1, "EX Kung Fu Shuffle", tutoHintPosX, 150)
	if teamside() == 1 then
	--Check EX KUNG FU PALM
		if anim() == 1030 and not tutoCheck1 then
			tutoCheck1 = true
			tutoColor1 = 5
		end
	--Check EX KUNG FU KNEE
		if anim() == 1135 and not tutoCheck2 then
			tutoCheck2 = true
			tutoColor2 = 5
		end
	--Check EX KUNG FU SHUFFLE
		if anim() == 1332 and not tutoCheck3 then
			tutoCheck3 = true
			tutoColor3 = 5
		end
	end
	if tutoCheck1 and tutoCheck2 and tutoCheck3 then
		return true
	end
end