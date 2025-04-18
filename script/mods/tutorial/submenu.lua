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
--; TUTORIAL SCREENPACK DEFINITION
--;===========================================================
txt_tutoDiag = createTextImg(jgFnt, 0, 1, "", 0, 0) --Text message

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