module(..., package.seeall)
--[[
module(..., package.seeall) causes that the only way to access to function and vars defined in this script
is using script.pause.varname if don't use: module(..., package.seeall) everything will be accessible globally
without use script.pause.varname
]]
--;===========================================================
--; DATA DEFINITION
--;===========================================================
--Save Data to config.ssz
function f_saveSettings()
	s_configSSZ = s_configSSZ:gsub('const float GlVol%s*=%s*%d%.*%d*', 'const float GlVol = ' .. gl_vol / 100)
	s_configSSZ = s_configSSZ:gsub('const float SEVol%s*=%s*%d%.*%d*', 'const float SEVol = ' .. se_vol / 100)
	s_configSSZ = s_configSSZ:gsub('const float BGMVol%s*=%s*%d%.*%d*', 'const float BGMVol = ' .. bgm_vol / 100)
	s_configSSZ = s_configSSZ:gsub('const float PanStr%s*=%s*%d%.*%d*', 'const float PanStr = ' .. pan_str / 100)
	local file = io.open(saveCoreCfgPath,"w+")
	file:write(s_configSSZ)
	file:close()
	modified = false
	--configModified('true')
end

--Load training_sav.lua data
local file = io.open(saveTrainingPath,"r")
s_trainLUA = file:read("*all")
file:close()

--Variable setting based on loaded data
data.pbkRecSlot = f_minMax(data.pbkRecSlot, 1, 5)
data.pbkPlaySlot = f_minMax(data.pbkPlaySlot, 1, 8)
if (f_boolToNum(data.pbkSlot1) + f_boolToNum(data.pbkSlot2) + f_boolToNum(data.pbkSlot3) + f_boolToNum(data.pbkSlot4) + f_boolToNum(data.pbkSlot5)) == 0 then
	data.pbkSlot1 = true
end

function f_TrainingVars()
--Life Gauge
	setLifeStateP1(data.LifeStateP1)
	setLifeStateP2(data.LifeStateP2)
--Power Gauge
	setPowerStateP1(data.PowerStateP1)
	setPowerStateP2(data.PowerStateP2)
--Auto Guard
	setAutoguard(1, data.autoguardP1)
	setAutoguard(2, data.autoguardP2)
--Dummy Mode
	if data.dummyMode == 1 then
		setCom(2, data.AIlevel)
	elseif data.dummyMode == 2 then
		playDummyRecord(sndIkemen)
	elseif data.dummyMode == 3 then
		setCom(2, 0)
		remapInput(2, 1)
	end
--Playback
	setPlaybackCfg(
		data.pbkRecSlot,
		data.pbkPlaySlot,
		data.pbkPlayLoop,
		data.pbkSlot1,
		data.pbkSlot2,
		data.pbkSlot3,
		data.pbkSlot4,
		data.pbkSlot5
	)
--Characters Settings
	setSuaveMode(data.suavemode)
end

--Load Training Settings Saved from training_sav.lua
if getGameMode() == "practice" then
--Screen Info
	setDamageDisplay(data.damageDisplay)
	setInputDisplay(data.inputDisplay)
	if data.hitbox then toggleClsnDraw() end
	if data.debugInfo then toggleDebugDraw() end
	f_TrainingVars()
end

function f_resetTrainingCfg() --Reset when you exit from Training Mode or Replay Mode
	if not data.hudDisplay then setHUD(true) end
	if data.hitbox then toggleClsnDraw() end
	if data.debugInfo then toggleDebugDraw() end
	setDamageDisplay(0)
	setInputDisplay(0)
--[[	
	setLifeStateP1(-1)
	setLifeStateP2(-1)
]]
	setPowerStateP1(-1)
	setPowerStateP2(-1)
end

--Save Data to training_sav.lua and Apply Settings
function f_saveTrgCfg()
	f_TrainingVars()
	local t_training = {
	--Practice Settings
		['data.damageDisplay'] = data.damageDisplay,
		['data.inputDisplay'] = data.inputDisplay,
		['data.hitbox'] = data.hitbox,
		['data.debugInfo'] = data.debugInfo,
		['data.dummyMode'] = data.dummyMode,
		['data.AIlevel'] = data.AIlevel,
		['data.LifeStateP1'] = data.LifeStateP1,
		['data.LifeStateP2'] = data.LifeStateP2,
		['data.PowerStateP1'] = data.PowerStateP1,
		['data.PowerStateP2'] = data.PowerStateP2,
		['data.autoguardP1'] = data.autoguardP1,
		['data.autoguardP2'] = data.autoguardP2,
	--Playback Settings
		['data.pbkRecSlot'] = data.pbkRecSlot,
		['data.pbkPlaySlot'] = data.pbkPlaySlot,
		['data.pbkPlayLoop'] = data.pbkPlayLoop,
		['data.pbkSlot1'] = data.pbkSlot1,
		['data.pbkSlot2'] = data.pbkSlot2,
		['data.pbkSlot3'] = data.pbkSlot3,
		['data.pbkSlot4'] = data.pbkSlot4,
		['data.pbkSlot5'] = data.pbkSlot5,
	--Characters Settings
		['data.suavemode'] = data.suavemode
	}
	s_trainLUA = f_strSub(s_trainLUA, t_training)
	local file = io.open(saveTrainingPath,"w+")
	file:write(s_trainLUA)
	file:close()
	modified = false
end

--;===========================================================
--; PAUSE MENU SCREENPACK
--;===========================================================
--Transparent background
pauseBG1 = animNew(sprIkemen, [[
3,0, 0,0, -1
]])
animSetPos(pauseBG1, 20, 70)
animSetAlpha(pauseBG1, 20, 100)
animUpdate(pauseBG1)

--Pause Fade BG
fadeWindowBG = animNew(sprIkemen, [[
3,0, 0,0, -1, 0, AS256D102
]])
animSetPos(fadeWindowBG, -54, 0)
animSetScale(fadeWindowBG, 427, 240)
animUpdate(fadeWindowBG)

--Cursor Box
cursorBox = animNew(sprSys, [[
100,1, 0,0, -1
]])
animSetTile(cursorBox, 1, 1)

--Optimized Cursor Box
--cursorBox = animNew(sprIkemen, [[
--2,0, 0,0, -1
--]])
--animSetPos(cursorBox, 80, 20)
--animSetAlpha(cursorBox, 20, 100)
--animUpdate(cursorBox)

--Up Arrow
pauseUpArrow = animNew(sprIkemen, [[
225,0, 0,0, 10
225,1, 0,0, 10
225,2, 0,0, 10
225,3, 0,0, 10
225,3, 0,0, 10
225,2, 0,0, 10
225,1, 0,0, 10
225,0, 0,0, 10
]])
animAddPos(pauseUpArrow, 228, 61)
animSetScale(pauseUpArrow, 0.5, 0.5)

--Down Arrow
pauseDownArrow = animNew(sprIkemen, [[
226,0, 0,0, 10
226,1, 0,0, 10
226,2, 0,0, 10
226,3, 0,0, 10
226,3, 0,0, 10
226,2, 0,0, 10
226,1, 0,0, 10
226,0, 0,0, 10
]])
animAddPos(pauseDownArrow, 228, 176)
animSetScale(pauseDownArrow, 0.5, 0.5)

--Left Page Arrow
pauseLeftArrow = animNew(sprIkemen, [[
223,0, 0,0, 10
223,1, 0,0, 10
223,2, 0,0, 10
223,3, 0,0, 10
223,3, 0,0, 10
223,2, 0,0, 10
223,1, 0,0, 10
223,0, 0,0, 10
]])
animAddPos(pauseLeftArrow, 69, 72)
animSetScale(pauseLeftArrow, 0.5, 0.5)
animUpdate(pauseLeftArrow)

--Right Page Arrow
pauseRightArrow = animNew(sprIkemen, [[
224,0, 0,0, 10
224,1, 0,0, 10
224,2, 0,0, 10
224,3, 0,0, 10
224,3, 0,0, 10
224,2, 0,0, 10
224,1, 0,0, 10
224,0, 0,0, 10
]])
animAddPos(pauseRightArrow, 242, 72)
animSetScale(pauseRightArrow, 0.5, 0.5)
animUpdate(pauseRightArrow)

--Input Hints Panel
function drawPauseInputHints()
	local inputHintYPos = 220
	local hintFont = font2
	local hintFontYPos = 234
	animPosDraw(inputHintsBG, -56, 219)
	drawMenuInputHints("u","30,"..inputHintYPos,"d","50,"..inputHintYPos,"l","70,"..inputHintYPos,"r","90,"..inputHintYPos,"a","150,"..inputHintYPos,"e","215,"..inputHintYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Select", 111, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Confirm", 171, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Return", 236, hintFontYPos)
end

function drawPauseInputHints2()
	local inputHintYPos = 219
	local hintFont = font2
	local hintFontYPos = 233
	animPosDraw(inputHintsBG, -56, 219)
	drawMenuInputHints("u","40,"..inputHintYPos,"d","60,"..inputHintYPos,"a","132,"..inputHintYPos,"e","210,"..inputHintYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Select", 81, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Confirm", 153, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Return", 231, hintFontYPos)
end

--;===========================================================
--; PAUSE MENU RESET
--;===========================================================
pauseMenuActive = false
mainMenuBack = false
delayMenu = -1
pauseMode = ""
PcursorPosY = 1
PmoveTxt = 0
pauseMenu = 1
Pbufu = 0
P2bufu = 0
Pbufd = 0
P2bufd = 0
Pbufr = 0
P2bufr = 0
Pbufl = 0
P2bufl = 0

challengerActive = false
screenTime = 0

pbrecActive = false
recWarning = false

data.hudDisplay = true
hide = false

function f_pauseMenuReset()
	togglePauseMenu(0)
	setSysCtrl(0)
	delayMenu = -1
	pauseMode = ""
	bufl = 0
	bufr = 0
end

function f_gameCfgMenuReset()
	gameCfg = 1
	cursorPosY = 1
	moveTxt = 0
	mainGoTo = "Settings"
	delayMenu = -2
end

function f_gameCfgMenuReset2()
	pauseMode = "Settings"
	gameCfg = 1
	cursorPosY = 1
	moveTxt = 0
	delayMenu = 0
end

function f_trainingCfgMenuReset()
	--modified = false
	trainingCfg = 1
	cursorPosY = 1
	moveTxt = 0
	mainGoTo = "Training"
	delayMenu = -2
end

function f_trainingCfgMenuReset2()
	--modified = false
	pauseMode = "Training"
	trainingCfg = 1
	cursorPosY = 1
	moveTxt = 0
	delayMenu = 0
end

function f_confirmReset()
	mainMenuBack = false
	confirmScreen = false
	moveTxtConfirm = 0
--Cursor pos in NO
	cursorPosYConfirm = 1
	confirmPause = 2
end

--;===========================================================
--; PAUSE MENU ITEMS FUNCTIONS (NOT IMPLEMENTED YET)
--;===========================================================
--[[
--RESUME GAME
local function f_resumePause()
	
end

--MOVELIST
local function f_movelistPause()
	sndPlay(sndIkemen, 200, 0)
end

--SETTINGS
local function f_settingsPause()
	sndPlay(sndSys, 100, 1)
	f_gameCfgMenuReset()
end

--HIDE MENU
local function f_hidePause()
	hide = true
end

--BACK TO CHARACTER SELECT
local function f_exitPause()
	if getGameMode() == "story" then
		sndPlay(sndIkemen, 200, 0)
	elseif getGameMode() == "abyss" or getGameMode() == "abysscoop" or getGameMode() == "abysscpu" then --Display Characters Stats
		sndPlay(sndSys, 100, 1)
		--abyssStats = 1
		--cursorPosY = 1
		--moveTxt = 0
		mainGoTo = "AbyssStats"
		delayMenu = -2
	elseif getGameMode() == "random" or getGameMode() == "intermission" or getPauseVar() == "nogiveup" then --Back to Main Menu for Quick Match Mode and intermission Fights
		sndPlay(sndSys, 100, 1)
		f_confirmReset()
		mainGoTo = "Confirm"
		mainMenuBack = true
		delayMenu = -2
	else
		sndPlay(sndSys, 100, 1)
		f_confirmReset()
		mainGoTo = "Confirm"
		delayMenu = -2
	end
end

--EXIT TO MAIN MENU
local function f_mainmenuPause()	
	sndPlay(sndSys, 100, 1)
	f_confirmReset()
	mainGoTo = "Confirm"
	mainMenuBack = true
	if replay() then
		data.replayDone = true
	end
	delayMenu = -2
end

--TRAINING SETTINGS
local function f_practicePause()
	sndPlay(sndSys, 100, 1)
	f_trainingCfgMenuReset()
end

--BATTLE INFO
local function f_infoPause()
	sndPlay(sndSys, 100, 1)
	f_trainingCfgMenuReset()
end
]]
--;===========================================================
--; PAUSE MENU
--;===========================================================
txt_pause = createTextImg(jgFnt, 0, 0, "", 159, 63)

t_pauseMain = {
	{text = "Continue",  gotomenu = "f_resumePause()"}, --maybe gotomenu is not working like in other scripts, due the use of: module(..., package.seeall)
	{text = "Movelist",  gotomenu = "f_movelistPause()"},
	{text = "Settings",  gotomenu = "f_settingsPause()"},
	{text = "Hide Menu", gotomenu = "f_hidePause()"},
	{text = "Give Up", 	 gotomenu = "f_exitPause()"},
	{text = "Main Menu", gotomenu = "f_mainmenuPause()"}
}
if getGameMode() == "practice" or getGameMode() == "vs" or getGameMode() == "story" or getGameMode() == "storyRoster" then
	t_pauseMain[5].text = "Character Select"
	if getGameMode() == "practice" then
		table.insert(t_pauseMain, 7, {text = "Training Menu", gotomenu = "f_practicePause()"})
	elseif getGameMode() == "story" or getGameMode() == "storyRoster" then
		if getPauseVar() == "giveup" then
			t_pauseMain[6].text = "Give Up"
		else
			t_pauseMain[6].text = "Story Select"
		end
	end
elseif getGameMode() == "stageviewer" then t_pauseMain[5].text = "Stage Select"
elseif getGameMode() == "mission" then t_pauseMain[6].text = "Mission Select"
elseif getGameMode() == "event" then t_pauseMain[6].text = "Event Select"
elseif getGameMode() == "random" then table.remove(t_pauseMain,6)
elseif getGameMode() == "tutorial" then table.remove(t_pauseMain,5)
elseif getGameMode() == "intermission" then table.remove(t_pauseMain,6)
elseif getGameMode() == "tourneyAI" then t_pauseMain[5].text = "Skip Match"
elseif getGameMode() == "abyss" or getGameMode() == "abysscoop" or getGameMode() == "abysscpu" then t_pauseMain[5].text = "Characters Stats"
end
if getPauseVar() == "nogiveup" then table.remove(t_pauseMain,5) end

--Pause Menu for Replays
if replay() or getGameMode() == "randomtest" then
t_pauseMain = nil
t_pauseMain = {
	{text = "Continue",    gotomenu = "f_resumePause()"},
	{text = "Settings",    gotomenu = "f_settingsPause()"},
	{text = "Hide Menu",   gotomenu = "f_hidePause()"},
	{text = "Battle Info", gotomenu = "f_infoPause()"},
	{text = "Exit", 	   gotomenu = "f_mainmenuPause()"}
}
end

--Set ID to all final items
for i=1, #t_pauseMain do
	t_pauseMain[i]['id'] = ""
end
if data.debugLog then f_printTable(t_pauseMain, "save/debug/t_pauseMain.log") end

if getPlayerSide() == "p1right" then --Pause Controls if P1 is in Right Side
	data.p1In = 2
	data.p2In = 1
else --Pause Controls if P1 is in Left Side
	if getGameMode() == "arcade" then
		--setCom(2, 0) --Enable player 2 pause when cpu have control (this need to be reworked, because disable AI when you press SHITF+F4)
	end
	data.p2In = 2
end

function f_pauseMain(p, st, esc)
	cmdInput()
	pn = p
	escape = esc
	start = st
	if start and getGameMode() == "arcade" then --Detects when you press start button in arcade mode
		if pn == 2 and (getPlayerSide() == "p1left" or getPlayerSide() == "p1right") then --Player 2 in any side is the challenger
			challengerActive = true
		elseif pn == 1 and (getPlayerSide() == "p2left" or getPlayerSide() == "p2right") then --Player 1 in any side is the challenger
			challengerActive = true
		end
	end
--Draw BG
	if not hide then
		--animDraw(f_animVelocity(commonBG0, -1, -1))
		animDraw(fadeWindowBG)
		f_sysTime()
		drawPauseInputHints()
	else --When Hide is active
		if (escape or start or (pn == 1 and commandGetState(p1Cmd, 'e')) or (pn == 2 and commandGetState(p2Cmd, 'e')) or (((pn == 1 and btnPalNo(p1Cmd) > 0) or (pn == 2 and btnPalNo(p2Cmd) > 0)))) and delayMenu == 2 then
			hide = false
			commandBufReset(p1Cmd)
			commandBufReset(p2Cmd)
		end
	end
--Here Comes a New Challenger!
	if challengerActive == true and screenTime < 200 then
		if screenTime == 0 then
			sndPlay(sndIkemen, 500, 0)
			playBGM(bgmNothing) --Stop Stage Song
		end
		screenTime = screenTime + 1
		animDraw(f_animVelocity(challengerWindow, 0, 1.5)) --Draw from common.lua
		animDraw(challengerText)
		animUpdate(challengerText)
		if screenTime == 200 then
			data.challengerMode = true
			f_saveTemp()
			exitMatch()
		end
	end
--Start Pause Menu
	if pauseMenuActive == false and delayMenu == -1 then
		pauseMenuActive = true
		if not challengerActive and not pbrecActive then sndPlay(sndSys, 100, 1) end --Play Pause SFX
		delayMenu = 0
	end
--Stop playback recording when you open pause menu
	if (escape or start) and pbrecActive then
		endDummyPlayback(sndIkemen)
		pbrecActive = false
		pauseMenuActive = false
	end
--Pause Logic
	if pauseMode == "" or mainGoTo ~= "" then
		if not challengerActive and not hide then
			if pn == 1 then textImgSetBank(txt_pause, 5) --Set color depending player id
			elseif pn == 2 then textImgSetBank(txt_pause, 1)
			end
			textImgSetText(txt_pause, "PAUSE [P"..pn.."]")
		--HIDE MENU
			if replay() or getGameMode() == "randomtest" then
				if ((pn == 1 and btnPalNo(p1Cmd) > 0) or (pn == 2 and btnPalNo(p2Cmd) > 0)) and pauseMenu == 3 then hide = true end
			else
				if ((pn == 1 and btnPalNo(p1Cmd) > 0) or (pn == 2 and btnPalNo(p2Cmd) > 0)) and pauseMenu == 4 then hide = true end
			end
		--RESUME GAME
			if (escape or start or (pn == 1 and commandGetState(p1Cmd, 'e')) or (pn == 2 and commandGetState(p2Cmd, 'e')) or (((pn == 1 and btnPalNo(p1Cmd) > 0) or (pn == 2 and btnPalNo(p2Cmd) > 0)) and pauseMenu == 1)) and delayMenu == 2 and not hide then
				sndPlay(sndSys, 100, 2)
				pauseMenuActive = false
			end
			if pauseMenuActive == true and delayMenu < 2 then --To delay Menu Fade In
				delayMenu = delayMenu + 1
			elseif pauseMenuActive == false and delayMenu > 0 then --To delay Menu Fade Out
				delayMenu = delayMenu - 1
			end
			if pauseMenuActive == false and delayMenu == 0 then
				togglePauseMenu(0)
				setSysCtrl(0)
				delayMenu = -1
				return
			end
			if delayMenu == -1 and mainGoTo ~= "" then
				delayMenu = 0
				pauseMode = mainGoTo
				mainGoTo = ""
			end
			if delayMenu == 2 then
				setSysCtrl(10)
				if (pn == 1 and commandGetState(p1Cmd, 'u')) or (pn == 1 and (commandGetState(p1Cmd, 'holdu') and Pbufu >= 18)) or (pn == 2 and commandGetState(p2Cmd, 'u')) or (pn == 2 and (commandGetState(p2Cmd, 'holdu') and P2bufu >= 18)) then
					sndPlay(sndSys, 100, 0)
					pauseMenu = pauseMenu - 1
				elseif (pn == 1 and commandGetState(p1Cmd, 'd')) or (pn == 1 and (commandGetState(p1Cmd, 'holdd') and Pbufd >= 18)) or (pn == 2 and commandGetState(p2Cmd, 'd')) or (pn == 2 and (commandGetState(p2Cmd, 'holdd') and P2bufd >= 18)) then
					sndPlay(sndSys, 100, 0)
					pauseMenu = pauseMenu + 1
				end
		--[[
			--Actions are called from functions stored in t_pauseMain table
				if (pn == 1 and btnPalNo(p1Cmd) > 0) or (pn == 2 and btnPalNo(p2Cmd) > 0) then
					f_gotoFunction(t_pauseMain[pauseMenu])
				end
		]]
			--Actions in Randomtest or Replay Modes
				if replay() or getGameMode() == "randomtest" then
					if (pn == 1 and btnPalNo(p1Cmd) > 0) or (pn == 2 and btnPalNo(p2Cmd) > 0) then
					--SETTINGS
						if pauseMenu == 2 then
							sndPlay(sndSys, 100, 1)
							f_gameCfgMenuReset()
					--BATTLE INFO
						elseif pauseMenu == 4 then
							sndPlay(sndSys, 100, 1)
							f_trainingCfgMenuReset()
					--EXIT
						elseif pauseMenu == 5 then
							sndPlay(sndSys, 100, 1)
							f_confirmReset()
							mainGoTo = "Confirm"
							if replay() then
								mainMenuBack = true
								data.replayDone = true
							end
							delayMenu = -2
						end
					end
			--Actions in rest of Game Modes
				else
					if (pn == 1 and btnPalNo(p1Cmd) > 0) or (pn == 2 and btnPalNo(p2Cmd) > 0) then
					--MOVELIST
						if pauseMenu == 2 then
							sndPlay(sndIkemen, 200, 0)
					--SETTINGS
						elseif pauseMenu == 3 then
							sndPlay(sndSys, 100, 1)
							f_gameCfgMenuReset()
					--BACK TO CHARACTER SELECT
						elseif pauseMenu == 5 then
							if getGameMode() == "story" then
								sndPlay(sndIkemen, 200, 0)
							elseif getGameMode() == "abyss" or getGameMode() == "abysscoop" or getGameMode() == "abysscpu" then --Display Characters Stats
								sndPlay(sndSys, 100, 1)
							
								--abyssStats = 1
								--cursorPosY = 1
								--moveTxt = 0
							
								mainGoTo = "AbyssStats"
								delayMenu = -2
							elseif getGameMode() == "random" or getGameMode() == "intermission" or getPauseVar() == "nogiveup" then --Back to Main Menu for Quick Match Mode and intermission Fights
								sndPlay(sndSys, 100, 1)
								f_confirmReset()
								mainGoTo = "Confirm"
								mainMenuBack = true
								delayMenu = -2
							else
								sndPlay(sndSys, 100, 1)
								f_confirmReset()
								mainGoTo = "Confirm"
								delayMenu = -2
							end
					--EXIT TO MAIN MENU
						elseif pauseMenu == 6 then
							sndPlay(sndSys, 100, 1)
							f_confirmReset()
							mainGoTo = "Confirm"
							mainMenuBack = true
							delayMenu = -2
					--TRAINING SETTINGS
						elseif pauseMenu == 7 then
							sndPlay(sndSys, 100, 1)
							f_trainingCfgMenuReset()
						end
					end
				end
			--Cursor position calculation
				if pauseMenu < 1 then
					pauseMenu = #t_pauseMain
					if #t_pauseMain > 7 then
						PcursorPosY = 7
					else
						PcursorPosY = #t_pauseMain
					end
				elseif pauseMenu > #t_pauseMain then
					pauseMenu = 1
					PcursorPosY = 1
				elseif ((pn == 1 and commandGetState(p1Cmd, 'u')) or (pn == 1 and (commandGetState(p1Cmd, 'holdu') and Pbufu >= 18))) and PcursorPosY > 1 then
					PcursorPosY = PcursorPosY - 1
				elseif ((pn == 1 and commandGetState(p1Cmd, 'd')) or (pn == 1 and (commandGetState(p1Cmd, 'holdd') and Pbufd >= 18))) and PcursorPosY < 7 then
					PcursorPosY = PcursorPosY + 1
				elseif ((pn == 2 and commandGetState(p2Cmd, 'u')) or (pn == 2 and (commandGetState(p2Cmd, 'holdu') and P2bufu >= 18))) and PcursorPosY > 1 then
					PcursorPosY = PcursorPosY - 1
				elseif ((pn == 2 and commandGetState(p2Cmd, 'd')) or (pn == 2 and (commandGetState(p2Cmd, 'holdd') and P2bufd >= 18))) and PcursorPosY < 7 then
					PcursorPosY = PcursorPosY + 1
				end
				if PcursorPosY == 7 then
					PmoveTxt = (pauseMenu - 7) * 15
				elseif PcursorPosY == 1 then
					PmoveTxt = (pauseMenu - 1) * 15
				end
				if #t_pauseMain <= 7 then
					maxPause = #t_pauseMain
				elseif pauseMenu - PcursorPosY > 0 then
					maxPause = pauseMenu + 7 - PcursorPosY
				else
					maxPause = 7
				end
			--Draw Transparent Table BG
				animSetScale(pauseBG1, 220, maxPause * 15)
				animSetWindow(pauseBG1, 80,70, 160,105)
				animUpdate(pauseBG1)
				animDraw(pauseBG1)
			--Draw Title Menu
				textImgDraw(txt_pause)
			--Draw Cursor
				animSetWindow(cursorBox, 80,55 + PcursorPosY * 15, 160,15)
				f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
				animDraw(f_animVelocity(cursorBox, -1, -1))
			--Draw Text for Table
				for i=1, maxPause do	
					if i > pauseMenu - PcursorPosY then
						t_pauseMain[i].id = createTextImg(jgFnt, 0, 0, t_pauseMain[i].text:upper(), 158.5, 65 + i * 15 - PmoveTxt, 0.85, 0.85)
						textImgDraw(t_pauseMain[i].id)
					end
				end
			--Draw Up Animated Cursor
				if maxPause > 7 then
					animDraw(pauseUpArrow)
					animUpdate(pauseUpArrow)
				end
			--Draw Down Animated Cursor
				if #t_pauseMain > 7 and maxPause < #t_pauseMain then
					animDraw(pauseDownArrow)
					animUpdate(pauseDownArrow)
				end
				if commandGetState(p1Cmd, 'holdu') then
					Pbufd = 0
					Pbufu = Pbufu + 1
				elseif commandGetState(p2Cmd, 'holdu') then
					P2bufd = 0
					P2bufu = P2bufu + 1
				elseif commandGetState(p1Cmd, 'holdd') then
					Pbufu = 0
					Pbufd = Pbufd + 1
				elseif commandGetState(p2Cmd, 'holdd') then
					P2bufu = 0
					P2bufd = P2bufd + 1
				else
					Pbufu = 0
					Pbufd = 0
					P2bufu = 0
					P2bufd = 0
				end
			end
		end
	elseif pauseMode == "Settings" or pauseMode == "Audio" or pauseMode == "Songs" then
		f_pauseSettings()
	elseif pauseMode == "Training" or pauseMode == "CharacterCfg" or pauseMode == "Playback" then
		f_pauseTraining()
	elseif pauseMode == "AbyssStats" then
		f_pauseAbyssStats()
	elseif pauseMode == "Confirm" then
		f_pauseConfirm()
	end
end

--;===========================================================
--; PAUSE CONFIRM MESSAGE
--;===========================================================
txt_pauseInfo = createTextImg(jgFnt, 0, 0, "", 160, 70,0.7,0.7)
txt_pauseConfirm = createTextImg(jgFnt, 0, 0, "ARE YOU SURE?", 160, 90)
txt_playerID = "[PLAYER "
txt_backStorySel = "] WILL BACK TO STORY SELECT"
txt_backMissionSel = "] WILL BACK TO MISSION SELECT"
txt_backEventSel = "] WILL BACK TO EVENT SELECT"
txt_replaySelBack = "] WILL BACK TO REPLAY SELECT"
txt_backCharSel = "] WILL BACK TO CHARACTER SELECT"
txt_backStgSel = "] WILL BACK TO STAGE SELECT"
txt_leaveMatch = "] WILL LEAVE THIS MATCH"
txt_mainmenuBack = "] WILL BACK TO MAIN MENU"

--Confirm Window BG
confirmPauseBG = animNew(sprIkemen, [[
230,1, 0,0, -1
]])
animSetPos(confirmPauseBG, 83.5, 77)
animUpdate(confirmPauseBG)

t_confirmPause = {
	{id = textImgNew(), text = "YES"},
	{id = textImgNew(), text = "NO"},
}

function f_pauseConfirm()
	if pn == 1 then textImgSetBank(txt_pauseInfo, 5)
	elseif pn == 2 then textImgSetBank(txt_pauseInfo, 1)
	end
--MESSAGES FOR BACK TO A MAIN MENU
	if mainMenuBack == true then
		if replay() then textImgSetText(txt_pauseInfo, txt_playerID..pn..txt_replaySelBack)
		else
			if getGameMode() == "mission" then textImgSetText(txt_pauseInfo, txt_playerID..pn..txt_backMissionSel)
			elseif getGameMode() == "event" then textImgSetText(txt_pauseInfo, txt_playerID..pn..txt_backEventSel)
			elseif getGameMode() == "intermission" then textImgSetText(txt_pauseInfo, txt_playerID..pn..txt_leaveMatch)
			elseif getGameMode() == "story" or getGameMode() == "storyRoster" then
				if getPauseVar() == "giveup" then textImgSetText(txt_pauseInfo, txt_playerID..pn..txt_leaveMatch)
				else textImgSetText(txt_pauseInfo, txt_playerID..pn..txt_backStorySel)
				end
			else textImgSetText(txt_pauseInfo, txt_playerID..pn..txt_mainmenuBack)
			end
		end
--MESSAGES FOR BACK TO A CHARACTER SELECT
	elseif mainMenuBack == false then
		if replay() then textImgSetText(txt_pauseInfo, txt_playerID..pn..txt_replaySelBack)
		else
			if getGameMode() == "vs" or getGameMode() == "practice" or getGameMode() == "storyRoster" then textImgSetText(txt_pauseInfo, txt_playerID..pn..txt_backCharSel)
			elseif getGameMode() == "stageviewer" then textImgSetText(txt_pauseInfo, txt_playerID..pn..txt_backStgSel)
			elseif getGameMode() == "random" or getGameMode() == "randomtest" then textImgSetText(txt_pauseInfo, txt_playerID..pn..txt_mainmenuBack)
			else textImgSetText(txt_pauseInfo, txt_playerID..pn..txt_leaveMatch)
			end
		end
	end
	if pauseMode == "Confirm" or okGoTo ~= "" then
		if delayMenu == 2 then
			if start then
				sndPlay(sndSys, 100, 2)
				pauseMenuActive = false
				bufl = 0
				bufr = 0
		--BACK/NO ACTION
			elseif escape or (pn == 1 and commandGetState(p1Cmd, 'e')) or (pn == 2 and commandGetState(p2Cmd, 'e')) or (((pn == 1 and btnPalNo(p1Cmd) > 0) or (pn == 2 and btnPalNo(p2Cmd) > 0)) and confirmPause == #t_confirmPause) then
				sndPlay(sndSys, 100, 2)
				delayMenu = -2
				bufl = 0
				bufr = 0
			end
		end
		if pauseMenuActive == true and delayMenu < 2 then
			delayMenu = delayMenu + 1
		elseif pauseMenuActive == false and delayMenu > 0 then
			delayMenu = delayMenu - 1
		end
		if pauseMenuActive == false and delayMenu == 0 then
			f_pauseMenuReset()
			return
		end
		if delayMenu == -1 then
			if okGoTo == nil or okGoTo == "" then
				pauseMode = ""
			else
				pauseMode = okGoTo
				okGoTo = ""
			end
			delayMenu = 0
		end
		if delayMenu == 2 then
			if (pn == 1 and commandGetState(p1Cmd, 'u')) or (pn == 2 and commandGetState(p2Cmd, 'u')) then
				sndPlay(sndSys, 100, 0)
				confirmPause = confirmPause - 1
			elseif (pn == 1 and commandGetState(p1Cmd, 'd')) or (pn == 2 and commandGetState(p2Cmd, 'd')) then
				sndPlay(sndSys, 100, 0)
				confirmPause = confirmPause + 1
			end
			if confirmPause < 1 then
				confirmPause = #t_confirmPause
				if #t_confirmPause > 4 then
					cursorPosYConfirm = 4
				else
					cursorPosYConfirm = #t_confirmPause - 1
				end
			elseif confirmPause > #t_confirmPause then
				confirmPause = 1
				cursorPosYConfirm = 0
			elseif (pn == 1 and commandGetState(p1Cmd, 'u')) or (pn == 2 and commandGetState(p2Cmd, 'u')) and cursorPosYConfirm > 0 then
				cursorPosYConfirm = cursorPosYConfirm - 1
			elseif (pn == 1 and commandGetState(p1Cmd, 'd')) or (pn == 2 and commandGetState(p2Cmd, 'd')) and cursorPosYConfirm < 4 then
				cursorPosYConfirm = cursorPosYConfirm + 1
			end
			if cursorPosYConfirm == 4 then
				moveTxtConfirm = (confirmPause - 5) * 13
			elseif cursorPosYConfirm == 0 then
				moveTxtConfirm = (confirmPause - 1) * 13
			end
			animDraw(confirmPauseBG)
			textImgDraw(txt_pauseConfirm)
			textImgDraw(txt_pauseInfo)
			for i=1, #t_confirmPause do
				if i == confirmPause then
					bank = 5
				else
					bank = 0
				end
				textImgDraw(f_updateTextImg(t_confirmPause[i].id, jgFnt, bank, 0, t_confirmPause[i].text:upper(), 159, 100 + i * 13 - moveTxtConfirm))
			end
			animSetWindow(cursorBox, 87,103 + cursorPosYConfirm * 13, 144,13)
			f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
			animDraw(f_animVelocity(cursorBox, -1, -1))
			f_sysTime()
			drawPauseInputHints2()
		--BACK TO MAIN MENU
			if mainMenuBack == true then
				if ((pn == 1 and btnPalNo(p1Cmd) > 0) or (pn == 2 and btnPalNo(p2Cmd) > 0)) and confirmPause == 1 then
					sndPlay(sndSys, 100, 1)
					f_resetTrainingCfg() --To clean training cfg
					data.tempBack = true
					f_saveTemp()
					exitMatch()
				end
		--BACK TO CHARACTER SELECT
			elseif mainMenuBack == false then
				if ((pn == 1 and btnPalNo(p1Cmd) > 0) or (pn == 2 and btnPalNo(p2Cmd) > 0)) and confirmPause == 1 then
					sndPlay(sndSys, 100, 1)
					f_resetTrainingCfg()
					if getGameMode() == "tourney" then
						if getPlayerSide() == "p1right" then
							if pn == 2 then data.p1Lose = true
							elseif pn == 1 then data.p2Lose = true
							end
						else --P1 in left side
							if pn == 1 then data.p1Lose = true
							elseif pn == 2 then data.p2Lose = true
							end
						end
					elseif getGameMode() == "tourneyAI" then
						data.AIskip = true
					end
					f_saveTemp()
					exitMatch()
				end
			end
		end
	--elseif pauseMode == "Save" then
		--f_pauseSave()
	end
end

--;===========================================================
--; GAME SETTINGS
--;===========================================================
txt_PgameCfg = createTextImg(jgFnt, 0, 0, "", 159, 63)

t_gameCfg = {
	{text = "Audio Settings"},
	{text = "Input Settings"},
	{text = "HUD Display"},
	{text = "Open Screenshots"},
	{text = "Change Stage BGM"},
	{text = "BACK"},
}
for i=1, #t_gameCfg do
	t_gameCfg[i]['varID'] = textImgNew()
	t_gameCfg[i]['varText'] = ""
end
if not replay() and getGameMode() ~= "practice" and getGameMode() ~= "randomtest" then table.remove(t_gameCfg,5) end

--Logic to Display Text instead Boolean Values
function f_gameCfgdisplayTxt()
if data.hudDisplay then t_gameCfg[3].varText = "Yes" else t_gameCfg[3].varText = "No" end
end
f_gameCfgdisplayTxt() --Load Display Text

function f_pauseSettings()
	local hasChanged = false
	if pn == 1 then textImgSetBank(txt_PgameCfg, 5)
	elseif pn == 2 then textImgSetBank(txt_PgameCfg, 1)
	end
	textImgSetText(txt_PgameCfg, "GAME SETTINGS [P"..pn.."]")
	if pauseMode == "Settings" or cfgGoTo ~= "" then
		if delayMenu == 2 then
			if start then
				sndPlay(sndSys, 100, 2)
				pauseMenuActive = false
				bufl = 0
				bufr = 0
		--BACK
			elseif escape or (pn == 1 and commandGetState(p1Cmd, 'e')) or (pn == 2 and commandGetState(p2Cmd, 'e')) or (((pn == 1 and btnPalNo(p1Cmd) > 0) or (pn == 2 and btnPalNo(p2Cmd) > 0)) and gameCfg == #t_gameCfg) then
				sndPlay(sndSys, 100, 2)
				delayMenu = -2
				bufl = 0
				bufr = 0
			end
		end
		if pauseMenuActive == true and delayMenu < 2 then
			delayMenu = delayMenu + 1
		elseif pauseMenuActive == false and delayMenu > 0 then
			delayMenu = delayMenu - 1
		end
		if pauseMenuActive == false and delayMenu == 0 then
			f_pauseMenuReset()
			return
		end
		if delayMenu == -1 then
			if cfgGoTo == nil or cfgGoTo == "" then
				pauseMode = ""
			else
				pauseMode = cfgGoTo
				cfgGoTo = ""
			end
			delayMenu = 0
		end
		if delayMenu == 2 then
			if (pn == 1 and commandGetState(p1Cmd, 'u')) or (pn == 1 and (commandGetState(p1Cmd, 'holdu') and Pbufu >= 18)) or (pn == 2 and commandGetState(p2Cmd, 'u')) or (pn == 2 and (commandGetState(p2Cmd, 'holdu') and P2bufu >= 18)) then
				sndPlay(sndSys, 100, 0)
				gameCfg = gameCfg - 1
				if bufl then bufl = 0 end
				if bufr then bufr = 0 end
			elseif (pn == 1 and commandGetState(p1Cmd, 'd')) or (pn == 1 and (commandGetState(p1Cmd, 'holdd') and Pbufd >= 18)) or (pn == 2 and commandGetState(p2Cmd, 'd')) or (pn == 2 and (commandGetState(p2Cmd, 'holdd') and P2bufd >= 18)) then
				sndPlay(sndSys, 100, 0)
				gameCfg = gameCfg + 1
				if bufl then bufl = 0 end
				if bufr then bufr = 0 end
			end
			if (pn == 1 and btnPalNo(p1Cmd) > 0) or (pn == 2 and btnPalNo(p2Cmd) > 0) then
			--Audio Settings
				if gameCfg == 1 then
					sndPlay(sndSys, 100, 1)
					cfgGoTo = "Audio"
					audioCfg = 1
					cursorPosY = 1
					moveTxt = 0
					delayMenu = -2
			--Input Settings
				elseif gameCfg == 2 then
					sndPlay(sndIkemen, 200, 0)
			--Open Screenshots Folder
				elseif gameCfg == 4 then
					sndPlay(sndSys, 100, 1)
					sszOpen("screenshots", "")
			--Play/Change Song
				elseif gameCfg == 5 then
					sndPlay(sndSys, 100, 1)
					cfgGoTo = "Songs"
					songMenu = 1
					songFolder = 1
					cursorPosY = 1
					moveTxt = 0
					f_soundtrack() --Load from common.lua
					delayMenu = -2
				end
			end
		--HUD Status
			if gameCfg == 3 then
				if (pn == 1 and btnPalNo(p1Cmd) > 0) or ((pn == 1 and commandGetState(p1Cmd, 'r')) or (pn == 2 and commandGetState(p2Cmd, 'r'))) or ((pn == 1 and commandGetState(p1Cmd, 'l')) or (pn == 2 and commandGetState(p2Cmd, 'l'))) then
					sndPlay(sndSys, 100, 1)
					if not data.hudDisplay then
						setHUD(true)
						data.hudDisplay = true
					else
						setHUD(false)
						data.hudDisplay = false
					end
					hasChanged = true
				end
			end
			if gameCfg < 1 then
				gameCfg = #t_gameCfg
				if #t_gameCfg > 7 then
					cursorPosY = 7
				else
					cursorPosY = #t_gameCfg
				end
			elseif gameCfg > #t_gameCfg then
				gameCfg = 1
				cursorPosY = 1
			elseif ((pn == 1 and commandGetState(p1Cmd, 'u')) or (pn == 1 and (commandGetState(p1Cmd, 'holdu') and Pbufu >= 18))) and cursorPosY > 1 then
				cursorPosY = cursorPosY - 1
			elseif ((pn == 1 and commandGetState(p1Cmd, 'd')) or (pn == 1 and (commandGetState(p1Cmd, 'holdd') and Pbufd >= 18))) and cursorPosY < 7 then
				cursorPosY = cursorPosY + 1
			elseif ((pn == 2 and commandGetState(p2Cmd, 'u')) or (pn == 2 and (commandGetState(p2Cmd, 'holdu') and P2bufu >= 18))) and cursorPosY > 1 then
				cursorPosY = cursorPosY - 1
			elseif ((pn == 2 and commandGetState(p2Cmd, 'd')) or (pn == 2 and (commandGetState(p2Cmd, 'holdd') and P2bufd >= 18))) and cursorPosY < 7 then
				cursorPosY = cursorPosY + 1
			end
			if cursorPosY == 7 then
				moveTxt = (gameCfg - 7) * 15
			elseif cursorPosY == 1 then
				moveTxt = (gameCfg - 1) * 15
			end	
			if #t_gameCfg <= 7 then
				maxgameCfg = #t_gameCfg
			elseif gameCfg - cursorPosY > 0 then
				maxgameCfg = gameCfg + 7 - cursorPosY
			else
				maxgameCfg = 7
			end
			if gameCfg < 4 then
				if (pn == 1 and commandGetState(p1Cmd, 'holdr')) or (pn == 2 and commandGetState(p2Cmd, 'holdr')) then
					bufl = 0
					bufr = bufr + 1
				elseif (pn == 1 and commandGetState(p1Cmd, 'holdl')) or (pn == 2 and commandGetState(p2Cmd, 'holdl')) then
					bufr = 0
					bufl = bufl + 1
				else
					bufr = 0
					bufl = 0
				end
			end
			if hasChanged then
				if not modified then modified = true end
				f_gameCfgdisplayTxt()
				hasChanged = false
			end
			animSetScale(pauseBG1, 220, maxgameCfg * 15)
			animSetWindow(pauseBG1, 80,70, 160,105)
			animUpdate(pauseBG1)
			animDraw(pauseBG1)
			textImgDraw(txt_PgameCfg)
			animSetWindow(cursorBox, 80,55 + cursorPosY * 15, 160,15)
			f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
			animDraw(f_animVelocity(cursorBox, -1, -1))
			for i=1, maxgameCfg do
				if i > gameCfg - cursorPosY then
					local align = 1
					local posX = 85
				--Custom Pos for Last items
					if i == #t_gameCfg then
						align = 0
						posX = 160
					end
					if t_gameCfg[i].varID ~= nil then
						textImgDraw(f_updateTextImg(t_gameCfg[i].varID, jgFnt, 0, align, t_gameCfg[i].text:upper(), posX, 65 + i * 15 - moveTxt, 0.85, 0.85))
						textImgDraw(f_updateTextImg(t_gameCfg[i].varID, jgFnt, 0, -1, t_gameCfg[i].varText:upper(), 235, 65 + i * 15 - moveTxt, 0.85, 0.85))
					end
				end
			end
			if maxgameCfg > 7 then
				animDraw(pauseUpArrow)
				animUpdate(pauseUpArrow)
			end
			if #t_gameCfg > 7 and maxgameCfg < #t_gameCfg then
				animDraw(pauseDownArrow)
				animUpdate(pauseDownArrow)
			end
			if commandGetState(p1Cmd, 'holdu') then
				Pbufd = 0
				Pbufu = Pbufu + 1
			elseif commandGetState(p2Cmd, 'holdu') then
				P2bufd = 0
				P2bufu = P2bufu + 1
			elseif commandGetState(p1Cmd, 'holdd') then
				Pbufu = 0
				Pbufd = Pbufd + 1
			elseif commandGetState(p2Cmd, 'holdd') then
				P2bufu = 0
				P2bufd = P2bufd + 1
			else
				Pbufu = 0
				Pbufd = 0
				P2bufu = 0
				P2bufd = 0
			end
		end
	elseif pauseMode == "Audio" then
		f_pauseAudio()
	elseif pauseMode == "Songs" then
		f_pauseSongs()
	end
end

--;===========================================================
--; AUDIO SETTINGS
--;===========================================================
txt_PaudioCfg = createTextImg(jgFnt, 0, 0, "", 159, 63)

t_audioCfg = {
	{text = "Master Volume",  varText = ""},
	{text = "BGM Volume",     varText = ""},
	{text = "SFX Volume",     varText = ""},
	{text = "Audio Panning",  varText = ""},
	{text = "BACK",  		  varText = ""},
}
for i=1, #t_audioCfg do
	t_audioCfg[i]['varID'] = textImgNew()
end

function f_pauseAudio()
	local hasChanged = false
	if pn == 1 then textImgSetBank(txt_PaudioCfg, 5)
	elseif pn == 2 then textImgSetBank(txt_PaudioCfg, 1)
	end
	textImgSetText(txt_PaudioCfg, "AUDIO SETTINGS [P"..pn.."]")
	if delayMenu == 2 then
		if start then
			sndPlay(sndSys, 100, 2)
			pauseMenuActive = false
			bufl = 0
			bufr = 0
			if modified then f_saveSettings() end
		elseif escape or (pn == 1 and commandGetState(p1Cmd, 'e')) or (pn == 2 and commandGetState(p2Cmd, 'e')) or (((pn == 1 and btnPalNo(p1Cmd) > 0) or (pn == 2 and btnPalNo(p2Cmd) > 0)) and audioCfg == #t_audioCfg) then
			sndPlay(sndSys, 100, 2)
			delayMenu = -2
			bufl = 0
			bufr = 0
			if modified then f_saveSettings() end
		end
	end
	if pauseMenuActive == true and delayMenu < 2 then
		delayMenu = delayMenu + 1
	elseif pauseMenuActive == false and delayMenu > 0 then
		delayMenu = delayMenu - 1
	end
	if pauseMenuActive == false and delayMenu == 0 then
		f_pauseMenuReset()
		return
	end
	if delayMenu == -1 then f_gameCfgMenuReset2() end
	if delayMenu == 2 then
		if (pn == 1 and commandGetState(p1Cmd, 'u')) or (pn == 1 and (commandGetState(p1Cmd, 'holdu') and Pbufu >= 18)) or (pn == 2 and commandGetState(p2Cmd, 'u')) or (pn == 2 and (commandGetState(p2Cmd, 'holdu') and P2bufu >= 18)) then
			sndPlay(sndSys, 100, 0)
			audioCfg = audioCfg - 1
			if bufl then bufl = 0 end
			if bufr then bufr = 0 end
		elseif (pn == 1 and commandGetState(p1Cmd, 'd')) or (pn == 1 and (commandGetState(p1Cmd, 'holdd') and Pbufd >= 18)) or (pn == 2 and commandGetState(p2Cmd, 'd')) or (pn == 2 and (commandGetState(p2Cmd, 'holdd') and P2bufd >= 18)) then
			sndPlay(sndSys, 100, 0)
			audioCfg = audioCfg + 1
			if bufl then bufl = 0 end
			if bufr then bufr = 0 end
		end
	--Master volume
		if audioCfg == 1 then
			if ((pn == 1 and commandGetState(p1Cmd, 'r')) or (pn == 2 and commandGetState(p2Cmd, 'r'))) or (((pn == 1 and commandGetState(p1Cmd, 'holdr')) or (pn == 2 and commandGetState(p2Cmd, 'holdr'))) and bufr >= 20 and gl_vol < 100) then
				if gl_vol < 100 then gl_vol = gl_vol + 1 else gl_vol = 0 end
				if (pn == 1 and commandGetState(p1Cmd, 'r')) or (pn == 2 and commandGetState(p2Cmd, 'r')) then sndPlay(sndSys, 100, 0) end
				hasChanged = true
			elseif ((pn == 1 and commandGetState(p1Cmd, 'l')) or (pn == 2 and commandGetState(p2Cmd, 'l'))) or (((pn == 1 and commandGetState(p1Cmd, 'holdl')) or (pn == 2 and commandGetState(p2Cmd, 'holdl'))) and bufl >= 20 and gl_vol > 0) then
				if gl_vol > 0 then gl_vol = gl_vol - 1 else gl_vol = 100 end
				if (pn == 1 and commandGetState(p1Cmd, 'l')) or (pn == 2 and commandGetState(p2Cmd, 'l')) then sndPlay(sndSys, 100, 0) end
				hasChanged = true
			end
	--BGM volume
		elseif audioCfg == 2 then
			if ((pn == 1 and commandGetState(p1Cmd, 'r')) or (pn == 2 and commandGetState(p2Cmd, 'r'))) or (((pn == 1 and commandGetState(p1Cmd, 'holdr')) or (pn == 2 and commandGetState(p2Cmd, 'holdr'))) and bufr >= 20 and bgm_vol < 100) then
				if bgm_vol < 100 then bgm_vol = bgm_vol + 1 else bgm_vol = 0 end
				if (pn == 1 and commandGetState(p1Cmd, 'r')) or (pn == 2 and commandGetState(p2Cmd, 'r')) then sndPlay(sndSys, 100, 0) end
				hasChanged = true
			elseif ((pn == 1 and commandGetState(p1Cmd, 'l')) or (pn == 2 and commandGetState(p2Cmd, 'l'))) or (((pn == 1 and commandGetState(p1Cmd, 'holdl')) or (pn == 2 and commandGetState(p2Cmd, 'holdl'))) and bufl >= 20 and bgm_vol > 0) then
				if bgm_vol > 0 then bgm_vol = bgm_vol - 1 else bgm_vol = 100 end
				if (pn == 1 and commandGetState(p1Cmd, 'l')) or (pn == 2 and commandGetState(p2Cmd, 'l')) then sndPlay(sndSys, 100, 0) end
				hasChanged = true
			end
	--SFX volume
		elseif audioCfg == 3 then
			if ((pn == 1 and commandGetState(p1Cmd, 'r')) or (pn == 2 and commandGetState(p2Cmd, 'r'))) or (((pn == 1 and commandGetState(p1Cmd, 'holdr')) or (pn == 2 and commandGetState(p2Cmd, 'holdr'))) and bufr >= 20 and se_vol < 100) then
				if se_vol < 100 then se_vol = se_vol + 1 else se_vol = 0 end
				if (pn == 1 and commandGetState(p1Cmd, 'r')) or (pn == 2 and commandGetState(p2Cmd, 'r')) then sndPlay(sndSys, 100, 0) end
				hasChanged = true
			elseif ((pn == 1 and commandGetState(p1Cmd, 'l')) or (pn == 2 and commandGetState(p2Cmd, 'l'))) or (((pn == 1 and commandGetState(p1Cmd, 'holdl')) or (pn == 2 and commandGetState(p2Cmd, 'holdl'))) and bufl >= 20 and se_vol > 0) then
				if se_vol > 0 then se_vol = se_vol - 1 else se_vol = 100 end
				if (pn == 1 and commandGetState(p1Cmd, 'l')) or (pn == 2 and commandGetState(p2Cmd, 'l')) then sndPlay(sndSys, 100, 0) end
				hasChanged = true
			end
	--Audio Panning
		elseif audioCfg == 4 then
			if commandGetState(p1Cmd, 'r') then
				sndPlay(sndSys, 100, 0)
				if pan_str < 160 then pan_str = pan_str + 40 else pan_str = 0 end
				hasChanged = true
			elseif commandGetState(p1Cmd, 'l') then
				sndPlay(sndSys, 100, 0)
				if pan_str > 0 then pan_str = pan_str - 40 else pan_str = 160 end
				hasChanged = true
			end 
		end
		if audioCfg < 1 then
			audioCfg = #t_audioCfg
			if #t_audioCfg > 7 then
				cursorPosY = 7
			else
				cursorPosY = #t_audioCfg
			end
		elseif audioCfg > #t_audioCfg then
			audioCfg = 1
			cursorPosY = 1
		elseif ((pn == 1 and commandGetState(p1Cmd, 'u')) or (pn == 1 and (commandGetState(p1Cmd, 'holdu') and Pbufu >= 18))) and cursorPosY > 1 then
			cursorPosY = cursorPosY - 1
		elseif ((pn == 1 and commandGetState(p1Cmd, 'd')) or (pn == 1 and (commandGetState(p1Cmd, 'holdd') and Pbufd >= 18))) and cursorPosY < 7 then
			cursorPosY = cursorPosY + 1
		elseif ((pn == 2 and commandGetState(p2Cmd, 'u')) or (pn == 2 and (commandGetState(p2Cmd, 'holdu') and P2bufu >= 18))) and cursorPosY > 1 then
			cursorPosY = cursorPosY - 1
		elseif ((pn == 2 and commandGetState(p2Cmd, 'd')) or (pn == 2 and (commandGetState(p2Cmd, 'holdd') and P2bufd >= 18))) and cursorPosY < 7 then
			cursorPosY = cursorPosY + 1
		end
		if cursorPosY == 7 then
			moveTxt = (audioCfg - 7) * 15
		elseif cursorPosY == 1 then
			moveTxt = (audioCfg - 1) * 15
		end	
		if #t_audioCfg <= 7 then
			maxAudioCfg = #t_audioCfg
		elseif audioCfg - cursorPosY > 0 then
			maxAudioCfg = audioCfg + 7 - cursorPosY
		else
			maxAudioCfg = 7
		end
		if audioCfg < 4 then
			if (pn == 1 and commandGetState(p1Cmd, 'holdr')) or (pn == 2 and commandGetState(p2Cmd, 'holdr')) then
				bufl = 0
				bufr = bufr + 1
			elseif (pn == 1 and commandGetState(p1Cmd, 'holdl')) or (pn == 2 and commandGetState(p2Cmd, 'holdl')) then
				bufr = 0
				bufl = bufl + 1
			else
				bufr = 0
				bufl = 0
			end
		end
		t_audioCfg[1].varText = gl_vol
		t_audioCfg[2].varText = bgm_vol
		t_audioCfg[3].varText = se_vol
		t_audioCfg[4].varText = t_panStr[math.ceil((pan_str + 1) * 0.025)]
		if hasChanged then
			if not modified then modified = true end
			setVolume(gl_vol / 100, se_vol / 100, bgm_vol / 100)
			setPanStr(pan_str / 100)
			hasChanged = false
		end
		animSetScale(pauseBG1, 220, maxAudioCfg * 15)
		animSetWindow(pauseBG1, 80,70, 160,105)
		animUpdate(pauseBG1)
		animDraw(pauseBG1)
		textImgDraw(txt_PaudioCfg)
		animSetWindow(cursorBox, 80,55 + cursorPosY * 15, 160,15)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		for i=1, maxAudioCfg do
			if i > audioCfg - cursorPosY then
				local align = 1
				local posX = 85
			--Custom Pos for Last items
				if i == #t_audioCfg then
					align = 0
					posX = 160
				end
				if t_audioCfg[i].varID ~= nil then
					textImgDraw(f_updateTextImg(t_audioCfg[i].varID, jgFnt, 0, align, t_audioCfg[i].text:upper(), posX, 65 + i * 15 - moveTxt, 0.85, 0.85))
					textImgDraw(f_updateTextImg(t_audioCfg[i].varID, jgFnt, 0, -1, t_audioCfg[i].varText, 235, 65 + i * 15 - moveTxt, 0.85, 0.85))
				end
			end
		end
		if maxAudioCfg > 7 then
			animDraw(pauseUpArrow)
			animUpdate(pauseUpArrow)
		end
		if #t_audioCfg > 7 and maxAudioCfg < #t_audioCfg then
			animDraw(pauseDownArrow)
			animUpdate(pauseDownArrow)
		end
		if commandGetState(p1Cmd, 'holdu') then
			Pbufd = 0
			Pbufu = Pbufu + 1
		elseif commandGetState(p2Cmd, 'holdu') then
			P2bufd = 0
			P2bufu = P2bufu + 1
		elseif commandGetState(p1Cmd, 'holdd') then
			Pbufu = 0
			Pbufd = Pbufd + 1
		elseif commandGetState(p2Cmd, 'holdd') then
			P2bufu = 0
			P2bufd = P2bufd + 1
		else
			Pbufu = 0
			Pbufd = 0
			P2bufu = 0
			P2bufd = 0
		end
	end
end

--;===========================================================
--; PLAY SONG
--;===========================================================
txt_PsongMenu = createTextImg(jgFnt, 0, 0, "", 159, 54)
txt_Psong = createTextImg(jgFnt, 0, 0, "", 159, 66)

function f_pauseSongs()
	if pn == 1 then textImgSetBank(txt_PsongMenu, 5)
	elseif pn == 2 then textImgSetBank(txt_PsongMenu, 1)
	end
	textImgSetText(txt_PsongMenu, "SONG SELECT [P"..pn.."]")
	textImgSetText(txt_Psong, "["..t_songList[songFolder].folder:upper().."]")
	if delayMenu == 2 then
		if start then
			sndPlay(sndSys, 100, 2)
			pauseMenuActive = false
			bufl = 0
			bufr = 0
	--BACK
		elseif escape or (pn == 1 and commandGetState(p1Cmd, 'e')) or (pn == 2 and commandGetState(p2Cmd, 'e')) or (((pn == 1 and btnPalNo(p1Cmd) > 0) or (pn == 2 and btnPalNo(p2Cmd) > 0)) and songMenu == #t_songList[songFolder]) then
			sndPlay(sndSys, 100, 2)
			delayMenu = -2
			bufl = 0
			bufr = 0
		end
	end
	if pauseMenuActive == true and delayMenu < 2 then
		delayMenu = delayMenu + 1
	elseif pauseMenuActive == false and delayMenu > 0 then
		delayMenu = delayMenu - 1
	end
	if pauseMenuActive == false and delayMenu == 0 then
		f_pauseMenuReset()
		return
	end
	if delayMenu == -1 then f_gameCfgMenuReset2() end
	if delayMenu == 2 then
		if (pn == 1 and commandGetState(p1Cmd, 'u')) or (pn == 1 and (commandGetState(p1Cmd, 'holdu') and Pbufu >= 18)) or (pn == 2 and commandGetState(p2Cmd, 'u')) or (pn == 2 and (commandGetState(p2Cmd, 'holdu') and P2bufu >= 18)) then
			sndPlay(sndSys, 100, 0)
			songMenu = songMenu - 1
			if bufl then bufl = 0 end
			if bufr then bufr = 0 end
		elseif (pn == 1 and commandGetState(p1Cmd, 'd')) or (pn == 1 and (commandGetState(p1Cmd, 'holdd') and Pbufd >= 18)) or (pn == 2 and commandGetState(p2Cmd, 'd')) or (pn == 2 and (commandGetState(p2Cmd, 'holdd') and P2bufd >= 18)) then
			sndPlay(sndSys, 100, 0)
			songMenu = songMenu + 1
			if bufl then bufl = 0 end
			if bufr then bufr = 0 end
		elseif (pn == 1 and commandGetState(p1Cmd, 'l')) or (pn == 1 and (commandGetState(p1Cmd, 'holdl') and Pbufl >= 18)) or (pn == 2 and commandGetState(p2Cmd, 'l')) or (pn == 2 and (commandGetState(p2Cmd, 'holdl') and P2bufl >= 18)) then
			sndPlay(sndSys, 100, 0)
			songFolder = songFolder - 1
			songMenu = 1 --Restart Cursor Values to prevent nil values issues
			cursorPosY = 1
		elseif (pn == 1 and commandGetState(p1Cmd, 'r')) or (pn == 1 and (commandGetState(p1Cmd, 'holdr') and Pbufr >= 18)) or (pn == 2 and commandGetState(p2Cmd, 'r')) or (pn == 2 and (commandGetState(p2Cmd, 'holdr') and P2bufr >= 18)) then
			sndPlay(sndSys, 100, 0)
			songFolder = songFolder + 1
			songMenu = 1
			cursorPosY = 1
		end
		if (pn == 1 and btnPalNo(p1Cmd) > 0) or (pn == 2 and btnPalNo(p2Cmd) > 0) then
			if songMenu == #t_songList[songFolder] - 1 then --Play Random Song from Folder Selected
				randomSongSel = math.random(1, #t_songList[songFolder] - 2) --Get random song (-2 excludes back and random select items)
				selectedSong = t_songList[songFolder][randomSongSel].path --Use random song obtained to get his path
				--selectedSongName = t_songList[songFolder][randomSongSel].name
				playBGM(selectedSong)
			else --Play Loaded Songs
				playBGM(t_songList[songFolder][songMenu].path)
			end
		end
		if songFolder < 1 then
			songFolder = #t_songList
		elseif songFolder > #t_songList then
			songFolder = 1
		end
		if songMenu < 1 then
			songMenu = #t_songList[songFolder]
			if #t_songList[songFolder] > 7 then
				cursorPosY = 7
			else
				cursorPosY = #t_songList[songFolder]
			end
		elseif songMenu > #t_songList[songFolder] then
			songMenu = 1
			cursorPosY = 1
		elseif ((pn == 1 and commandGetState(p1Cmd, 'u')) or (pn == 1 and (commandGetState(p1Cmd, 'holdu') and Pbufu >= 18))) and cursorPosY > 1 then
			cursorPosY = cursorPosY - 1
		elseif ((pn == 1 and commandGetState(p1Cmd, 'd')) or (pn == 1 and (commandGetState(p1Cmd, 'holdd') and Pbufd >= 18))) and cursorPosY < 7 then
			cursorPosY = cursorPosY + 1
		elseif ((pn == 2 and commandGetState(p2Cmd, 'u')) or (pn == 2 and (commandGetState(p2Cmd, 'holdu') and P2bufu >= 18))) and cursorPosY > 1 then
			cursorPosY = cursorPosY - 1
		elseif ((pn == 2 and commandGetState(p2Cmd, 'd')) or (pn == 2 and (commandGetState(p2Cmd, 'holdd') and P2bufd >= 18))) and cursorPosY < 7 then
			cursorPosY = cursorPosY + 1
		end
		if cursorPosY == 7 then
			moveTxt = (songMenu - 7) * 15
		elseif cursorPosY == 1 then
			moveTxt = (songMenu - 1) * 15
		end	
		if #t_songList[songFolder] <= 7 then
			maxSongs = #t_songList[songFolder]
		elseif songMenu - cursorPosY > 0 then
			maxSongs = songMenu + 7 - cursorPosY
		else
			maxSongs = 7
		end
		if songMenu < 4 then
			if (pn == 1 and commandGetState(p1Cmd, 'holdr')) or (pn == 2 and commandGetState(p2Cmd, 'holdr')) then
				bufl = 0
				bufr = bufr + 1
			elseif (pn == 1 and commandGetState(p1Cmd, 'holdl')) or (pn == 2 and commandGetState(p2Cmd, 'holdl')) then
				bufr = 0
				bufl = bufl + 1
			else
				bufr = 0
				bufl = 0
			end
		end
		animSetScale(pauseBG1, 220, maxSongs * 15)
		animSetWindow(pauseBG1, 80,70, 160,105)
		animUpdate(pauseBG1)
		animDraw(pauseBG1)
		textImgDraw(txt_PsongMenu)
		textImgDraw(txt_Psong)
		animSetWindow(cursorBox, 80,55 + cursorPosY * 15, 160,15)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		for i=1, maxSongs do
			if t_songList[songFolder][i].name:len() > 26 then
				songText = string.sub(t_songList[songFolder][i].name, 1, 24)
				songText = tostring(songText .. '...')
			else
				songText = t_songList[songFolder][i].name
			end
			if i > songMenu - cursorPosY then
				local align = 1
				local posX = 85
			--Custom Pos for Last items
				if i == #t_songList[songFolder] or i == #t_songList[songFolder] - 1 then
					align = 0
					posX = 160
				end
				t_songList[songFolder][i].id = createTextImg(jgFnt, 0, align, songText:upper(), posX, 65 + i * 15 - moveTxt, 0.85, 0.85)
				textImgDraw(t_songList[songFolder][i].id)
			end
		end
		if maxSongs > 7 then
			animDraw(pauseUpArrow)
			animUpdate(pauseUpArrow)
		end
		if #t_songList[songFolder] > 7 and maxSongs < #t_songList[songFolder] then
			animDraw(pauseDownArrow)
			animUpdate(pauseDownArrow)
		end
		if songFolder > 1 then
			animDraw(pauseLeftArrow)
			animUpdate(pauseLeftArrow)
		end
		if songFolder < #t_songList then
			animDraw(pauseRightArrow)
			animUpdate(pauseRightArrow)
		end
		if commandGetState(p1Cmd, 'holdu') then
			Pbufd = 0
			Pbufu = Pbufu + 1
		elseif commandGetState(p2Cmd, 'holdu') then
			P2bufd = 0
			P2bufu = P2bufu + 1
		elseif commandGetState(p1Cmd, 'holdd') then
			Pbufu = 0
			Pbufd = Pbufd + 1
		elseif commandGetState(p2Cmd, 'holdd') then
			P2bufu = 0
			P2bufd = P2bufd + 1
		else
			Pbufu = 0
			Pbufd = 0
			P2bufu = 0
			P2bufd = 0
		end
	end
end

--;===========================================================
--; TRAINING SETTINGS/BATTLE INFO
--;===========================================================
txt_PtrainingCfg = createTextImg(jgFnt, 0, 0, "", 159, 63)

t_trainingCfg = {
	{text = "Damage Display"},
	{text = "Input Display"},
	{text = "Hitbox Display"},
	{text = "Debug Info"},
	{text = "Lifebar P1"},
	{text = "Lifebar P2"},
	{text = "Power Gauge P1"},
	{text = "Power Gauge P2"},
	{text = "Auto Guard P1"},
	{text = "Auto Guard P2"},
	--{text = "Distance"},
	--{text = "Tech Recovery"},
	--{text = "Counter Hit"},
	{text = "AI Level"},
	{text = "Character Settings"},
	{text = "Playback Settings"},
	{text = "Dummy Recording Start"},
	{text = "Dummy Control"},
	{text = "BACK"},
}
for i=1, #t_trainingCfg do
	t_trainingCfg[i]['varID'] = textImgNew()
	t_trainingCfg[i]['varText'] = ""
end

--Battle Info for Replays
if getGameMode() ~= "practice" then --if replay() or getGameMode() == "randomtest" then
	table.remove(t_trainingCfg,15)
	table.remove(t_trainingCfg,14)
	table.remove(t_trainingCfg,13)
	table.remove(t_trainingCfg,12)
	table.remove(t_trainingCfg,11)
	table.remove(t_trainingCfg,10)
	table.remove(t_trainingCfg,9)
	table.remove(t_trainingCfg,8)
	table.remove(t_trainingCfg,7)
	table.remove(t_trainingCfg,6)
	table.remove(t_trainingCfg,5)
end

--Logic to Display Text instead Boolean Values
function f_trainingCfgdisplayTxt()

if data.damageDisplay == 0 then t_trainingCfg[1].varText = "No"
elseif data.damageDisplay == 1 then t_trainingCfg[1].varText = "Yes"
end

if data.inputDisplay == 0 then t_trainingCfg[2].varText = "No"
elseif data.inputDisplay == 1 then t_trainingCfg[2].varText = "Yes"
end

if data.hitbox then t_trainingCfg[3].varText = "Yes" else t_trainingCfg[3].varText = "No" end
if data.debugInfo then t_trainingCfg[4].varText = "Yes" else t_trainingCfg[4].varText = "No" end

if getGameMode() == "practice" then --To don't display in battle info menu
--Lifebar P1
	if data.LifeStateP1 == 0 then t_trainingCfg[5].varText = "No Regenerate"
	else t_trainingCfg[5].varText = data.LifeStateP1.."%"
	end
--Lifebar P2
	if data.LifeStateP2 == 0 then t_trainingCfg[6].varText = "No Regenerate"
	else t_trainingCfg[6].varText = data.LifeStateP2.."%"
	end
--Power Gauge P1
	if data.PowerStateP1 == 0 then t_trainingCfg[7].varText = "No Recovery"
	elseif data.PowerStateP1 == 10 then t_trainingCfg[7].varText = "Recovery"
	elseif data.PowerStateP1 == 11 then t_trainingCfg[7].varText = "Max at Start"
	elseif data.PowerStateP1 == 666 then t_trainingCfg[7].varText = "Unlimited"
	else t_trainingCfg[7].varText = "Level "..data.PowerStateP1
	end
--Power Gauge P2
	if data.PowerStateP2 == 0 then t_trainingCfg[8].varText = "No Recovery"
	elseif data.PowerStateP2 == 10 then t_trainingCfg[8].varText = "Recovery"
	elseif data.PowerStateP2 == 11 then t_trainingCfg[8].varText = "Max at Start"
	elseif data.PowerStateP2 == 666 then t_trainingCfg[8].varText = "Unlimited"
	else t_trainingCfg[8].varText = "Level "..data.PowerStateP2
	end
--Auto Guard Mode
	if data.autoguardP1 then t_trainingCfg[9].varText = "Yes" else t_trainingCfg[9].varText = "No" end
	if data.autoguardP2 then t_trainingCfg[10].varText = "Yes" else t_trainingCfg[10].varText = "No" end
--AI Level
	t_trainingCfg[11].varText = data.AIlevel
--Dummy Mode
	if data.dummyMode == 0 then t_trainingCfg[15].varText = "Manual"
	elseif data.dummyMode == 1 then t_trainingCfg[15].varText = "CPU"
	elseif data.dummyMode == 2 then t_trainingCfg[15].varText = "Playback"
	elseif data.dummyMode == 3 then t_trainingCfg[15].varText = "Mirror"
	end
end

end

f_trainingCfgdisplayTxt() --Load Display Text

--Training Settings Up Arrow
pauseTUpArrow = animNew(sprIkemen, [[
225,0, 0,0, 10
225,1, 0,0, 10
225,2, 0,0, 10
225,3, 0,0, 10
225,3, 0,0, 10
225,2, 0,0, 10
225,1, 0,0, 10
225,0, 0,0, 10
]])
animAddPos(pauseTUpArrow, 250, 61)
animSetScale(pauseTUpArrow, 0.5, 0.5)

--Training Settings Down Arrow
pauseTDownArrow = animNew(sprIkemen, [[
226,0, 0,0, 10
226,1, 0,0, 10
226,2, 0,0, 10
226,3, 0,0, 10
226,3, 0,0, 10
226,2, 0,0, 10
226,1, 0,0, 10
226,0, 0,0, 10
]])
animAddPos(pauseTDownArrow, 250, 176)
animSetScale(pauseTDownArrow, 0.5, 0.5)

function f_pauseTraining()
	local hasChanged = false
	if getGameMode() == "practice" then txt_PtsTitle = "TRAINING SETTINGS [P" else txt_PtsTitle = "BATTLE INFO [P" end
	if pn == 1 then textImgSetBank(txt_PtrainingCfg, 5)
	elseif pn == 2 then textImgSetBank(txt_PtrainingCfg, 1)
	end
	textImgSetText(txt_PtrainingCfg, txt_PtsTitle..pn.."]")
	if pauseMode == "Training" or trainingGoTo ~= "" then
		if delayMenu == 2 then
			if start then
				sndPlay(sndSys, 100, 2)
				pauseMenuActive = false
				bufl = 0
				bufr = 0
				if modified then f_saveTrgCfg() end
		--BACK
			elseif escape or (pn == 1 and commandGetState(p1Cmd, 'e')) or (pn == 2 and commandGetState(p2Cmd, 'e')) or (((pn == 1 and btnPalNo(p1Cmd) > 0) or (pn == 2 and btnPalNo(p2Cmd) > 0)) and trainingCfg == #t_trainingCfg) then
				sndPlay(sndSys, 100, 2)
				delayMenu = -2
				bufl = 0
				bufr = 0
				if modified then f_saveTrgCfg() end
			end
		end
		if pauseMenuActive == true and delayMenu < 2 then
			delayMenu = delayMenu + 1
		elseif pauseMenuActive == false and delayMenu > 0 then
			delayMenu = delayMenu - 1
		end
		if pauseMenuActive == false and delayMenu == 0 then
			f_pauseMenuReset()
			return
		end
		if delayMenu == -1 then
			if trainingGoTo == nil or trainingGoTo == "" then
				pauseMode = ""
			else
				pauseMode = trainingGoTo
				trainingGoTo = ""
			end
			delayMenu = 0
		end
		if delayMenu == 2 then
			if (pn == 1 and commandGetState(p1Cmd, 'u')) or (pn == 1 and (commandGetState(p1Cmd, 'holdu') and Pbufu >= 18)) or (pn == 2 and commandGetState(p2Cmd, 'u')) or (pn == 2 and (commandGetState(p2Cmd, 'holdu') and P2bufu >= 18)) then
				sndPlay(sndSys, 100, 0)
				trainingCfg = trainingCfg - 1
				if bufl then bufl = 0 end
				if bufr then bufr = 0 end
				recWarning = false
			elseif (pn == 1 and commandGetState(p1Cmd, 'd')) or (pn == 1 and (commandGetState(p1Cmd, 'holdd') and Pbufd >= 18)) or (pn == 2 and commandGetState(p2Cmd, 'd')) or (pn == 2 and (commandGetState(p2Cmd, 'holdd') and P2bufd >= 18)) then
				sndPlay(sndSys, 100, 0)
				trainingCfg = trainingCfg + 1
				if bufl then bufl = 0 end
				if bufr then bufr = 0 end
				recWarning = false
			end
		--Actions
			if (pn == 1 and btnPalNo(p1Cmd) > 0) or (pn == 2 and btnPalNo(p2Cmd) > 0) then
			--Character Settings
				if trainingCfg == 12 then
					sndPlay(sndSys, 100, 1)
					trainingGoTo = "CharacterCfg"
					charCfg = 1
					cursorPosY = 1
					moveTxt = 0
					delayMenu = -2
			--Playback Settings
				elseif trainingCfg == 13 then
					sndPlay(sndSys, 100, 1)
					trainingGoTo = "Playback"
					playbackCfg = 1
					cursorPosY = 1
					moveTxt = 0
					delayMenu = -2
			--Start Dummy Recording
				elseif trainingCfg == 14 then
					if data.dummyMode == 3 or data.dummyMode == 2 or data.dummyMode == 1 then
						sndPlay(sndIkemen, 200, 0)
						recWarning = true
					else
						startDummyRecord(sndIkemen)
						pbrecActive = true
						pauseMenuActive = false
						bufl = 0
						bufr = 0
						if modified then f_saveTrgCfg() end
					end
				end
			end
		--Common Button Logic
			if (trainingCfg >= 3 and trainingCfg < 5) or trainingCfg == 9 or trainingCfg == 10 then
				if (pn == 1 and btnPalNo(p1Cmd) > 0) or (pn == 2 and btnPalNo(p2Cmd) > 0) or (pn == 1 and commandGetState(p1Cmd, 'l')) or (pn == 2 and commandGetState(p2Cmd, 'l')) or (pn == 1 and commandGetState(p1Cmd, 'r')) or (pn == 2 and commandGetState(p2Cmd, 'r')) then
					sndPlay(sndSys, 100, 1)
				--Hitbox Display
					if trainingCfg == 3 then
						if not data.hitbox then
							data.hitbox = true
						else
							data.hitbox = false
						end
						toggleClsnDraw()
				--Debug Info Display
					elseif trainingCfg == 4 then
						if not data.debugInfo then
							data.debugInfo = true
						else
							data.debugInfo = false
						end
						toggleDebugDraw()
				--Auto Guard P1
					elseif trainingCfg == 9 then
						if not data.autoguardP1 then
							data.autoguardP1 = true
						else
							data.autoguardP1 = false
						end
				--Auto Guard P2
					elseif trainingCfg == 10 then
						if not data.autoguardP2 then
							data.autoguardP2 = true
						else
							data.autoguardP2 = false
						end
					end
					hasChanged = true
				end
		--Info Display
			elseif trainingCfg == 1 then
				if ((pn == 1 and commandGetState(p1Cmd, 'l')) or (pn == 2 and commandGetState(p2Cmd, 'l'))) then
				--[[
					if data.damageDisplay > 0 then
						sndPlay(sndSys, 100, 1)
						data.damageDisplay = data.damageDisplay - 1
					end
					hasChanged = true
				]]
				elseif ((pn == 1 and commandGetState(p1Cmd, 'r')) or (pn == 2 and commandGetState(p2Cmd, 'r'))) then
					sndPlay(sndIkemen, 200, 0)
				--[[
					if data.damageDisplay < 1 then
						sndPlay(sndSys, 100, 1)
						data.damageDisplay = data.damageDisplay + 1
					end
					hasChanged = true
				]]
				end
		--Input Display
			elseif trainingCfg == 2 then
				if ((pn == 1 and commandGetState(p1Cmd, 'l')) or (pn == 2 and commandGetState(p2Cmd, 'l'))) then
					if data.inputDisplay > 0 then
						sndPlay(sndSys, 100, 1)
						data.inputDisplay = data.inputDisplay - 1
					end
					hasChanged = true
				elseif ((pn == 1 and commandGetState(p1Cmd, 'r')) or (pn == 2 and commandGetState(p2Cmd, 'r'))) then
					if data.inputDisplay < 1 then
						sndPlay(sndSys, 100, 1)
						data.inputDisplay = data.inputDisplay + 1
					end
					hasChanged = true
				end
		--Left Side Life Gauge Setup
			elseif trainingCfg == 5 and getGameMode() == "practice" then
				if ((pn == 1 and commandGetState(p1Cmd, 'r')) or (pn == 2 and commandGetState(p2Cmd, 'l'))) then
					if data.LifeStateP1 == 0 then
						sndPlay(sndSys, 100, 1)
						data.LifeStateP1 = 25
					elseif data.LifeStateP1 == 25 then
						sndPlay(sndSys, 100, 1)
						data.LifeStateP1 = 50
					elseif data.LifeStateP1 == 50 then
						sndPlay(sndSys, 100, 1)
						data.LifeStateP1 = 75
					elseif data.LifeStateP1 == 75 then
						sndPlay(sndSys, 100, 1)
						data.LifeStateP1 = 100
					end
					hasChanged = true
				elseif ((pn == 1 and commandGetState(p1Cmd, 'l')) or (pn == 2 and commandGetState(p2Cmd, 'r'))) then
					if data.LifeStateP1 == 100 then
						sndPlay(sndSys, 100, 1)
						data.LifeStateP1 = 75
					elseif data.LifeStateP1 == 75 then
						sndPlay(sndSys, 100, 1)
						data.LifeStateP1 = 50
					elseif data.LifeStateP1 == 50 then
						sndPlay(sndSys, 100, 1)
						data.LifeStateP1 = 25
					elseif data.LifeStateP1 == 25 then
						sndPlay(sndSys, 100, 1)
						data.LifeStateP1 = 0
					end
					hasChanged = true
				end
		--Right Side Life Gauge Setup
			elseif trainingCfg == 6 then
				if ((pn == 1 and commandGetState(p1Cmd, 'r')) or (pn == 2 and commandGetState(p2Cmd, 'r'))) then
					if data.LifeStateP2 == 0 then
						sndPlay(sndSys, 100, 1)
						data.LifeStateP2 = 25
					elseif data.LifeStateP2 == 25 then
						sndPlay(sndSys, 100, 1)
						data.LifeStateP2 = 50
					elseif data.LifeStateP2 == 50 then
						sndPlay(sndSys, 100, 1)
						data.LifeStateP2 = 75
					elseif data.LifeStateP2 == 75 then
						sndPlay(sndSys, 100, 1)
						data.LifeStateP2 = 100
					end
					hasChanged = true
				elseif ((pn == 1 and commandGetState(p1Cmd, 'l')) or (pn == 2 and commandGetState(p2Cmd, 'l'))) then
					if data.LifeStateP2 == 100 then
						sndPlay(sndSys, 100, 1)
						data.LifeStateP2 = 75
					elseif data.LifeStateP2 == 75 then
						sndPlay(sndSys, 100, 1)
						data.LifeStateP2 = 50
					elseif data.LifeStateP2 == 50 then
						sndPlay(sndSys, 100, 1)
						data.LifeStateP2 = 25
					elseif data.LifeStateP2 == 25 then
						sndPlay(sndSys, 100, 1)
						data.LifeStateP2 = 0
					end
					hasChanged = true
				end
		--Left Side Power Gauge Setup
			elseif trainingCfg == 7 then
				if ((pn == 1 and commandGetState(p1Cmd, 'r')) or (pn == 2 and commandGetState(p2Cmd, 'r'))) then
					if data.PowerStateP1 == 11 then
						sndPlay(sndSys, 100, 1)
						data.PowerStateP1 = 10
					elseif data.PowerStateP1 == 10 then
						sndPlay(sndSys, 100, 1)
						data.PowerStateP1 = 0
					elseif data.PowerStateP1 == 0 then
						sndPlay(sndSys, 100, 1)
						data.PowerStateP1 = 1
					elseif data.PowerStateP1 == 1 then
						sndPlay(sndSys, 100, 1)
						data.PowerStateP1 = 2
					elseif data.PowerStateP1 == 2 then
						sndPlay(sndSys, 100, 1)
						data.PowerStateP1 = 3
					elseif data.PowerStateP1 == 3 then
						sndPlay(sndSys, 100, 1)
						data.PowerStateP1 = 666
					end
					hasChanged = true
				elseif ((pn == 1 and commandGetState(p1Cmd, 'l')) or (pn == 2 and commandGetState(p2Cmd, 'l'))) then
					if data.PowerStateP1 == 666 then
						sndPlay(sndSys, 100, 1)
						data.PowerStateP1 = 3
					elseif data.PowerStateP1 == 3 then
						sndPlay(sndSys, 100, 1)
						data.PowerStateP1 = 2
					elseif data.PowerStateP1 == 2 then
						sndPlay(sndSys, 100, 1)
						data.PowerStateP1 = 1
					elseif data.PowerStateP1 == 1 then
						sndPlay(sndSys, 100, 1)
						data.PowerStateP1 = 0
					elseif data.PowerStateP1 == 0 then
						sndPlay(sndSys, 100, 1)
						data.PowerStateP1 = 10
					elseif data.PowerStateP1 == 10 then
						sndPlay(sndSys, 100, 1)
						data.PowerStateP1 = 11
					end
					hasChanged = true
				end
		--Right Side Power Gauge Setup
			elseif trainingCfg == 8 then
				if ((pn == 1 and commandGetState(p1Cmd, 'r')) or (pn == 2 and commandGetState(p2Cmd, 'r'))) then
					if data.PowerStateP2 == 11 then
						sndPlay(sndSys, 100, 1)
						data.PowerStateP2 = 10
					elseif data.PowerStateP2 == 10 then
						sndPlay(sndSys, 100, 1)
						data.PowerStateP2 = 0
					elseif data.PowerStateP2 == 0 then
						sndPlay(sndSys, 100, 1)
						data.PowerStateP2 = 1
					elseif data.PowerStateP2 == 1 then
						sndPlay(sndSys, 100, 1)
						data.PowerStateP2 = 2
					elseif data.PowerStateP2 == 2 then
						sndPlay(sndSys, 100, 1)
						data.PowerStateP2 = 3
					elseif data.PowerStateP2 == 3 then
						sndPlay(sndSys, 100, 1)
						data.PowerStateP2 = 666
					end
					hasChanged = true
				elseif ((pn == 1 and commandGetState(p1Cmd, 'l')) or (pn == 2 and commandGetState(p2Cmd, 'l'))) then
					if data.PowerStateP2 == 666 then
						sndPlay(sndSys, 100, 1)
						data.PowerStateP2 = 3
					elseif data.PowerStateP2 == 3 then
						sndPlay(sndSys, 100, 1)
						data.PowerStateP2 = 2
					elseif data.PowerStateP2 == 2 then
						sndPlay(sndSys, 100, 1)
						data.PowerStateP2 = 1
					elseif data.PowerStateP2 == 1 then
						sndPlay(sndSys, 100, 1)
						data.PowerStateP2 = 0
					elseif data.PowerStateP2 == 0 then
						sndPlay(sndSys, 100, 1)
						data.PowerStateP2 = 10
					elseif data.PowerStateP2 == 10 then
						sndPlay(sndSys, 100, 1)
						data.PowerStateP2 = 11
					end
					hasChanged = true
				end
	--[[
		--Distance
			elseif trainingCfg == ??? then
				
		--Tech
			elseif trainingCfg == ??? then
				
		--Counter Hit
			elseif trainingCfg == ??? then
				
	]]
		--AI Level
			elseif trainingCfg == 11 then
				if ((pn == 1 and commandGetState(p1Cmd, 'l')) or (pn == 2 and commandGetState(p2Cmd, 'l'))) then
					if data.AIlevel > 1 then
						sndPlay(sndSys, 100, 1)
						data.AIlevel = data.AIlevel - 1
					end
					hasChanged = true
				elseif ((pn == 1 and commandGetState(p1Cmd, 'r')) or (pn == 2 and commandGetState(p2Cmd, 'r'))) then
					if data.AIlevel < 8 then
						sndPlay(sndSys, 100, 1)
						data.AIlevel = data.AIlevel + 1
					end
					hasChanged = true
				end
		--Dummy Control
			elseif trainingCfg == 15 then
				if ((pn == 1 and commandGetState(p1Cmd, 'r')) or (pn == 2 and commandGetState(p2Cmd, 'r'))) then
				--Set CPU Controls
					if data.dummyMode == 3 then
						sndPlay(sndSys, 100, 1)
						data.dummyMode = 1
						--setCom(2, data.AIlevel)
						remapInput(2, 2)
						toggleAI(2)
				--Set Manual Controls
					elseif data.dummyMode == 1 then
						sndPlay(sndSys, 100, 1)
						data.dummyMode = 0
						toggleAI(2)
				--Set Playback Controls
					elseif data.dummyMode == 0 then
						sndPlay(sndSys, 100, 1)
						data.dummyMode = 2
						--playDummyRecord(sndIkemen)
					end
					hasChanged = true
				elseif ((pn == 1 and commandGetState(p1Cmd, 'l')) or (pn == 2 and commandGetState(p2Cmd, 'l'))) then
				--Set Manual Controls
					if data.dummyMode == 2 then
						--sndPlay(sndSys, 100, 1)
						data.dummyMode = 0
						endDummyPlayback(sndIkemen)
				--Set CPU Controls
					elseif data.dummyMode == 0 then
						sndPlay(sndSys, 100, 1)
						data.dummyMode = 1
						toggleAI(2)
				--Set Mirror Controls
					elseif data.dummyMode == 1 then
						sndPlay(sndSys, 100, 1)
						data.dummyMode = 3
						toggleAI(2)
						--setCom(2, 0)
						remapInput(2, 1)
					end
					hasChanged = true
				end
			end
			if trainingCfg < 1 then
				trainingCfg = #t_trainingCfg
				if #t_trainingCfg > 7 then
					cursorPosY = 7
				else
					cursorPosY = #t_trainingCfg
				end
			elseif trainingCfg > #t_trainingCfg then
				trainingCfg = 1
				cursorPosY = 1
			elseif ((pn == 1 and commandGetState(p1Cmd, 'u')) or (pn == 1 and (commandGetState(p1Cmd, 'holdu') and Pbufu >= 18))) and cursorPosY > 1 then
				cursorPosY = cursorPosY - 1
			elseif ((pn == 1 and commandGetState(p1Cmd, 'd')) or (pn == 1 and (commandGetState(p1Cmd, 'holdd') and Pbufd >= 18))) and cursorPosY < 7 then
				cursorPosY = cursorPosY + 1
			elseif ((pn == 2 and commandGetState(p2Cmd, 'u')) or (pn == 2 and (commandGetState(p2Cmd, 'holdu') and P2bufu >= 18))) and cursorPosY > 1 then
				cursorPosY = cursorPosY - 1
			elseif ((pn == 2 and commandGetState(p2Cmd, 'd')) or (pn == 2 and (commandGetState(p2Cmd, 'holdd') and P2bufd >= 18))) and cursorPosY < 7 then
				cursorPosY = cursorPosY + 1
			end
			if cursorPosY == 7 then
				moveTxt = (trainingCfg - 7) * 15
			elseif cursorPosY == 1 then
				moveTxt = (trainingCfg - 1) * 15
			end	
			if #t_trainingCfg <= 7 then
				maxtrainingCfg = #t_trainingCfg
			elseif trainingCfg - cursorPosY > 0 then
				maxtrainingCfg = trainingCfg + 7 - cursorPosY
			else
				maxtrainingCfg = 7
			end
			if trainingCfg < 4 then
				if (pn == 1 and commandGetState(p1Cmd, 'holdr')) or (pn == 2 and commandGetState(p2Cmd, 'holdr')) then
					bufl = 0
					bufr = bufr + 1
				elseif (pn == 1 and commandGetState(p1Cmd, 'holdl')) or (pn == 2 and commandGetState(p2Cmd, 'holdl')) then
					bufr = 0
					bufl = bufl + 1
				else
					bufr = 0
					bufl = 0
				end
			end
			if hasChanged then
				if not modified then modified = true end
				f_trainingCfgdisplayTxt()
				setDamageDisplay(data.damageDisplay)
				setInputDisplay(data.inputDisplay)
				hasChanged = false
			end
			animSetScale(pauseBG1, 240, maxtrainingCfg * 15)
			animSetWindow(pauseBG1, 55,70, 240,105)
			animUpdate(pauseBG1)
			animDraw(pauseBG1)
			textImgDraw(txt_PtrainingCfg)
			if recWarning then
				textImgSetText(txt_playbackInfo, 'Set Dummy Control as "Manual" to Record Actions.')
				textImgDraw(txt_playbackInfo)
			end
			animSetWindow(cursorBox, 55,55 + cursorPosY * 15, 205,15)
			f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
			animDraw(f_animVelocity(cursorBox, -1, -1))
			for i=1, maxtrainingCfg do
				if i > trainingCfg - cursorPosY then
					local align = 1
					local posX = 60
				--Custom Pos for Last items
					if i == #t_trainingCfg then
						align = 0
						posX = 160
					end
					if t_trainingCfg[i].varID ~= nil then
						textImgDraw(f_updateTextImg(t_trainingCfg[i].varID, jgFnt, 0, align, t_trainingCfg[i].text:upper(), posX, 65 + i * 15 - moveTxt, 0.85, 0.85))
						textImgDraw(f_updateTextImg(t_trainingCfg[i].varID, jgFnt, 0, -1, t_trainingCfg[i].varText, 257, 65 + i * 15 - moveTxt, 0.85, 0.85))
					end
				end
			end
			if maxtrainingCfg > 7 then
				animDraw(pauseTUpArrow)
				animUpdate(pauseTUpArrow)
			end
			if #t_trainingCfg > 7 and maxtrainingCfg < #t_trainingCfg then
				animDraw(pauseTDownArrow)
				animUpdate(pauseTDownArrow)
			end
			if commandGetState(p1Cmd, 'holdu') then
				Pbufd = 0
				Pbufu = Pbufu + 1
			elseif commandGetState(p2Cmd, 'holdu') then
				P2bufd = 0
				P2bufu = P2bufu + 1
			elseif commandGetState(p1Cmd, 'holdd') then
				Pbufu = 0
				Pbufd = Pbufd + 1
			elseif commandGetState(p2Cmd, 'holdd') then
				P2bufu = 0
				P2bufd = P2bufd + 1
			else
				Pbufu = 0
				Pbufd = 0
				P2bufu = 0
				P2bufd = 0
			end
		end
	elseif pauseMode == "CharacterCfg" then
		f_pauseCharCfg()
	elseif pauseMode == "Playback" then
		f_pausePlayback()
	end
end

--;===========================================================
--; PLAYBACK SETTINGS
--;===========================================================
txt_playbackCfg = createTextImg(jgFnt, 0, 0, "", 159, 63)

txt_playbackInfo = createTextImg(jgFnt, 5, 0, "", 159, 210, 0.7, 0.7)
txt_pbRecord = "Select Slot to Record Dummy Actions."
txt_pbPlay = "Select Slot to Playback Recorded Dummy Actions."
txt_pbSlots = "Toggle inclusion in Random, All, and Random All."
txt_pbWarning = "At least one slot has to be included."
txt_pbIncludeSlot = "Include"
txt_pbExcludeSlot = "Exclude"

t_playbackCfg = {
	{text = "Recording Slot",   varText = data.pbkRecSlot},
	{text = "Playback Slot",    varText = ""},
	--{text = "Playback Type",  varText = ""},
	{text = "Slot 1",   		varText = ""},
	{text = "Slot 2",   		varText = ""},
	{text = "Slot 3",   		varText = ""},
	{text = "Slot 4",   		varText = ""},
	{text = "Slot 5",   		varText = ""},
	{text = "BACK", 			varText = ""},
}
for i=1, #t_playbackCfg do
	t_playbackCfg[i]['varID'] = textImgNew()
end

--Logic to Display Text instead Number Values
function f_pbkdisplayTxt()

if data.pbkPlaySlot == 6 then t_playbackCfg[2].varText = "Random"
elseif data.pbkPlaySlot == 7 then t_playbackCfg[2].varText = "All"
elseif data.pbkPlaySlot == 8 then t_playbackCfg[2].varText = "Random All"
else t_playbackCfg[2].varText = data.pbkPlaySlot --Display Number Value
end

--if not data.pbkPlayLoop then t_playbackCfg[3].varText = "Once" else t_playbackCfg[3].varText = "Loop" end
if not data.pbkSlot1 then t_playbackCfg[3].varText = txt_pbExcludeSlot else t_playbackCfg[3].varText = txt_pbIncludeSlot end
if not data.pbkSlot2 then t_playbackCfg[4].varText = txt_pbExcludeSlot else t_playbackCfg[4].varText = txt_pbIncludeSlot end
if not data.pbkSlot3 then t_playbackCfg[5].varText = txt_pbExcludeSlot else t_playbackCfg[5].varText = txt_pbIncludeSlot end
if not data.pbkSlot4 then t_playbackCfg[6].varText = txt_pbExcludeSlot else t_playbackCfg[6].varText = txt_pbIncludeSlot end
if not data.pbkSlot5 then t_playbackCfg[7].varText = txt_pbExcludeSlot else t_playbackCfg[7].varText = txt_pbIncludeSlot end
end

f_pbkdisplayTxt() --Load Display Text

pbWarning = false
function checkPBSlots() --Check that at least 1 slot is included
	if not data.pbkSlot1 and not data.pbkSlot2 and not data.pbkSlot3 and not data.pbkSlot4 and not data.pbkSlot5 then
		pbWarning = true
		sndPlay(sndIkemen, 200, 0)
	else
		pbWarning = false
	end
end

function f_pausePlayback()
	local hasChanged = false
	if pn == 1 then textImgSetBank(txt_playbackCfg, 5)
	elseif pn == 2 then textImgSetBank(txt_playbackCfg, 1)
	end
	textImgSetText(txt_playbackCfg, "PLAYBACK SETTINGS [P"..pn.."]")
	if delayMenu == 2 then
		if start then
			sndPlay(sndSys, 100, 2)
			pauseMenuActive = false
			bufl = 0
			bufr = 0
			if modified then f_saveTrgCfg() end
	--BACK
		elseif escape or (pn == 1 and commandGetState(p1Cmd, 'e')) or (pn == 2 and commandGetState(p2Cmd, 'e')) or (((pn == 1 and btnPalNo(p1Cmd) > 0) or (pn == 2 and btnPalNo(p2Cmd) > 0)) and playbackCfg == #t_playbackCfg) then
			sndPlay(sndSys, 100, 2)
			delayMenu = -2
			if modified then f_saveTrgCfg() end
			bufl = 0
			bufr = 0
		end
	end
	if pauseMenuActive == true and delayMenu < 2 then
		delayMenu = delayMenu + 1
	elseif pauseMenuActive == false and delayMenu > 0 then
		delayMenu = delayMenu - 1
	end
	if pauseMenuActive == false and delayMenu == 0 then
		f_pauseMenuReset()
		return
	end
	if delayMenu == -1 then f_trainingCfgMenuReset2() end
	if delayMenu == 2 then
		if (pn == 1 and commandGetState(p1Cmd, 'u')) or (pn == 1 and (commandGetState(p1Cmd, 'holdu') and Pbufu >= 18)) or (pn == 2 and commandGetState(p2Cmd, 'u')) or (pn == 2 and (commandGetState(p2Cmd, 'holdu') and P2bufu >= 18)) then
			sndPlay(sndSys, 100, 0)
			playbackCfg = playbackCfg - 1
			if bufl then bufl = 0 end
			if bufr then bufr = 0 end
			pbWarning = false
		elseif (pn == 1 and commandGetState(p1Cmd, 'd')) or (pn == 1 and (commandGetState(p1Cmd, 'holdd') and Pbufd >= 18)) or (pn == 2 and commandGetState(p2Cmd, 'd')) or (pn == 2 and (commandGetState(p2Cmd, 'holdd') and P2bufd >= 18)) then
			sndPlay(sndSys, 100, 0)
			playbackCfg = playbackCfg + 1
			if bufl then bufl = 0 end
			if bufr then bufr = 0 end
			pbWarning = false
		end
	--Recording Slot
		if playbackCfg == 1 then
			if ((pn == 1 and commandGetState(p1Cmd, 'l')) or (pn == 2 and commandGetState(p2Cmd, 'l'))) then
				if data.pbkRecSlot > 1 then
					sndPlay(sndSys, 100, 1)
					data.pbkRecSlot = data.pbkRecSlot - 1
					hasChanged = true
				end
			elseif ((pn == 1 and commandGetState(p1Cmd, 'r')) or (pn == 2 and commandGetState(p2Cmd, 'r'))) then
				if data.pbkRecSlot < 5 then
					sndPlay(sndSys, 100, 1)
					data.pbkRecSlot = data.pbkRecSlot + 1
					hasChanged = true
				end
			end
	--Playback Slot
		elseif playbackCfg == 2 then
			if ((pn == 1 and commandGetState(p1Cmd, 'l')) or (pn == 2 and commandGetState(p2Cmd, 'l'))) then
				if data.pbkPlaySlot > 1 then
					sndPlay(sndSys, 100, 1)
					data.pbkPlaySlot = data.pbkPlaySlot - 1
					hasChanged = true
				end
			elseif ((pn == 1 and commandGetState(p1Cmd, 'r')) or (pn == 2 and commandGetState(p2Cmd, 'r'))) then
				if data.pbkPlaySlot < 8 then
					sndPlay(sndSys, 100, 1)
					data.pbkPlaySlot = data.pbkPlaySlot + 1
					hasChanged = true
				end
			end
	--Common Button Logic
		elseif playbackCfg >= 3 and playbackCfg < 8 then
			if (pn == 1 and btnPalNo(p1Cmd) > 0) or (pn == 2 and btnPalNo(p2Cmd) > 0) or (pn == 1 and commandGetState(p1Cmd, 'l')) or (pn == 2 and commandGetState(p2Cmd, 'l')) or (pn == 1 and commandGetState(p1Cmd, 'r')) or (pn == 2 and commandGetState(p2Cmd, 'r')) then
				sndPlay(sndSys, 100, 1)
			--Playback Type
			--[[
				if playbackCfg == 3 then
					if data.pbkPlayLoop then data.pbkPlayLoop = false else data.pbkPlayLoop = true end
			]]
			--Slot 1
				if playbackCfg == 3 then
					if data.pbkSlot1 then data.pbkSlot1 = false else data.pbkSlot1 = true end
					checkPBSlots()
					if pbWarning then data.pbkSlot1 = true end
			--Slot 2
				elseif playbackCfg == 4 then
					if data.pbkSlot2 then data.pbkSlot2 = false else data.pbkSlot2 = true end
					checkPBSlots()
					if pbWarning then data.pbkSlot2 = true end
			--Slot 3
				elseif playbackCfg == 5 then
					if data.pbkSlot3 then data.pbkSlot3 = false else data.pbkSlot3 = true end
					checkPBSlots()
					if pbWarning then data.pbkSlot3 = true end
			--Slot 4
				elseif playbackCfg == 6 then
					if data.pbkSlot4 then data.pbkSlot4 = false else data.pbkSlot4 = true end
					checkPBSlots()
					if pbWarning then data.pbkSlot4 = true end
			--Slot 5
				elseif playbackCfg == 7 then
					if data.pbkSlot5 then data.pbkSlot5 = false else data.pbkSlot5 = true end
					checkPBSlots()
					if pbWarning then data.pbkSlot5 = true end
				end
				hasChanged = true
			end
		end
		if playbackCfg < 1 then
			playbackCfg = #t_playbackCfg
			if #t_playbackCfg > 7 then
				cursorPosY = 7
			else
				cursorPosY = #t_playbackCfg
			end
		elseif playbackCfg > #t_playbackCfg then
			playbackCfg = 1
			cursorPosY = 1
		elseif ((pn == 1 and commandGetState(p1Cmd, 'u')) or (pn == 1 and (commandGetState(p1Cmd, 'holdu') and Pbufu >= 18))) and cursorPosY > 1 then
			cursorPosY = cursorPosY - 1
		elseif ((pn == 1 and commandGetState(p1Cmd, 'd')) or (pn == 1 and (commandGetState(p1Cmd, 'holdd') and Pbufd >= 18))) and cursorPosY < 7 then
			cursorPosY = cursorPosY + 1
		elseif ((pn == 2 and commandGetState(p2Cmd, 'u')) or (pn == 2 and (commandGetState(p2Cmd, 'holdu') and P2bufu >= 18))) and cursorPosY > 1 then
			cursorPosY = cursorPosY - 1
		elseif ((pn == 2 and commandGetState(p2Cmd, 'd')) or (pn == 2 and (commandGetState(p2Cmd, 'holdd') and P2bufd >= 18))) and cursorPosY < 7 then
			cursorPosY = cursorPosY + 1
		end
		if cursorPosY == 7 then
			moveTxt = (playbackCfg - 7) * 15
		elseif cursorPosY == 1 then
			moveTxt = (playbackCfg - 1) * 15
		end
		if #t_playbackCfg <= 7 then
			maxPlaybackCfg = #t_playbackCfg
		elseif playbackCfg - cursorPosY > 0 then
			maxPlaybackCfg = playbackCfg + 7 - cursorPosY
		else
			maxPlaybackCfg = 7
		end
		animSetScale(pauseBG1, 240, maxPlaybackCfg * 15)
		animSetWindow(pauseBG1, 55,70, 240,105)
		animUpdate(pauseBG1)
		animDraw(pauseBG1)
		textImgDraw(txt_playbackCfg)
		if playbackCfg >=1 and playbackCfg < 8 then
			if playbackCfg == 1 then textImgSetText(txt_playbackInfo, txt_pbRecord)
			elseif playbackCfg == 2 then textImgSetText(txt_playbackInfo, txt_pbPlay)
			elseif playbackCfg >= 3 and playbackCfg < 8 then
				if not pbWarning then
					textImgSetText(txt_playbackInfo, txt_pbSlots)
				else
					textImgSetText(txt_playbackInfo, txt_pbWarning)
				end
			end
			textImgDraw(txt_playbackInfo)
		end
		animSetWindow(cursorBox, 55,55 + cursorPosY * 15, 205,15)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		if hasChanged then
			if not modified then modified = true end
			t_playbackCfg[1].varText = data.pbkRecSlot
			f_pbkdisplayTxt()
			hasChanged = false
		end
		for i=1, maxPlaybackCfg do
			if i > playbackCfg - cursorPosY then
				local align = 1
				local posX = 60
			--Custom Pos for Last items
				if i == #t_playbackCfg then
					align = 0
					posX = 160
				end
				if t_playbackCfg[i].varID ~= nil then
					textImgDraw(f_updateTextImg(t_playbackCfg[i].varID, jgFnt, 0, align, t_playbackCfg[i].text:upper(), posX, 65 + i * 15 - moveTxt, 0.85, 0.85))
					textImgDraw(f_updateTextImg(t_playbackCfg[i].varID, jgFnt, 0, -1, t_playbackCfg[i].varText, 257, 65 + i * 15 - moveTxt, 0.85, 0.85))
				end
			end
		end
		if maxPlaybackCfg > 7 then
			animDraw(pauseTUpArrow)
			animUpdate(pauseTUpArrow)
		end
		if #t_playbackCfg > 7 and maxPlaybackCfg < #t_playbackCfg then
			animDraw(pauseTDownArrow)
			animUpdate(pauseTDownArrow)
		end
		if commandGetState(p1Cmd, 'holdu') then
			Pbufd = 0
			Pbufu = Pbufu + 1
		elseif commandGetState(p2Cmd, 'holdu') then
			P2bufd = 0
			P2bufu = P2bufu + 1
		elseif commandGetState(p1Cmd, 'holdd') then
			Pbufu = 0
			Pbufd = Pbufd + 1
		elseif commandGetState(p2Cmd, 'holdd') then
			P2bufu = 0
			P2bufd = P2bufd + 1
		else
			Pbufu = 0
			Pbufd = 0
			P2bufu = 0
			P2bufd = 0
		end
	end
end

--;===========================================================
--; ABYSS CHARACTER STATS
--;===========================================================
txt_PabyssStats = createTextImg(jgFnt, 0, 0, "", 159, 30)

function f_pauseAbyssStats()
	if pn == 1 then textImgSetBank(txt_PabyssStats, 5)
	elseif pn == 2 then textImgSetBank(txt_PabyssStats, 1)
	end
	textImgSetText(txt_PabyssStats, "CHARACTER STATS [P"..pn.."]")
	if pauseMode == "AbyssStats" or cfgGoTo ~= "" then
		if delayMenu == 2 then
			if start then
				sndPlay(sndSys, 100, 2)
				pauseMenuActive = false
				bufl = 0
				bufr = 0
		--BACK
			elseif escape or (pn == 1 and commandGetState(p1Cmd, 'e')) or (pn == 2 and commandGetState(p2Cmd, 'e')) or (((pn == 1 and btnPalNo(p1Cmd) > 0) or (pn == 2 and btnPalNo(p2Cmd) > 0)) ) then
				sndPlay(sndSys, 100, 2)
				delayMenu = -2
				bufl = 0
				bufr = 0
			end
		end
		if pauseMenuActive == true and delayMenu < 2 then
			delayMenu = delayMenu + 1
		elseif pauseMenuActive == false and delayMenu > 0 then
			delayMenu = delayMenu - 1
		end
		if pauseMenuActive == false and delayMenu == 0 then
			f_pauseMenuReset()
			return
		end
		if delayMenu == -1 then
			if cfgGoTo == nil or cfgGoTo == "" then
				pauseMode = ""
			else
				pauseMode = cfgGoTo
				cfgGoTo = ""
			end
			delayMenu = 0
		end
		if delayMenu == 2 then
			textImgDraw(txt_PabyssStats)
			f_abyssProfile(true, false, -165, 24)
			f_abyssProfileCPU()
		end
--[[
	elseif pauseMode == "???" then
		f_pause1()
	elseif pauseMode == "???" then
		f_pause2()
]]
	end
end

--;===========================================================
--; CHARACTERS SETTINGS
--;===========================================================
txt_charCfg = createTextImg(jgFnt, 0, 0, "", 159, 63)

t_charCfg = {
	{text = "Suave Dude Mode"},
	{text = "BACK"},
}
for i=1, #t_charCfg do
	t_charCfg[i]['varID'] = textImgNew()
	t_charCfg[i]['varText'] = ""
end

--Logic to Display Text instead Number Values
function f_charCfgdisplayTxt()
	if data.suavemode == 0 then t_charCfg[1].varText = "Normal"
	elseif data.suavemode == 1 then t_charCfg[1].varText = "Awaken"
	end
end

f_charCfgdisplayTxt() --Load Display Text

function f_pauseCharCfg()
	local hasChanged = false
	if pn == 1 then textImgSetBank(txt_charCfg, 5)
	elseif pn == 2 then textImgSetBank(txt_charCfg, 1)
	end
	textImgSetText(txt_charCfg, "CHARACTERS SETTINGS [P"..pn.."]")
	if delayMenu == 2 then
		if start then
			sndPlay(sndSys, 100, 2)
			pauseMenuActive = false
			bufl = 0
			bufr = 0
			if modified then f_saveTrgCfg() end
	--BACK
		elseif escape or (pn == 1 and commandGetState(p1Cmd, 'e')) or (pn == 2 and commandGetState(p2Cmd, 'e')) or (((pn == 1 and btnPalNo(p1Cmd) > 0) or (pn == 2 and btnPalNo(p2Cmd) > 0)) and charCfg == #t_charCfg) then
			sndPlay(sndSys, 100, 2)
			delayMenu = -2
			if modified then f_saveTrgCfg() end
			bufl = 0
			bufr = 0
		end
	end
	if pauseMenuActive == true and delayMenu < 2 then
		delayMenu = delayMenu + 1
	elseif pauseMenuActive == false and delayMenu > 0 then
		delayMenu = delayMenu - 1
	end
	if pauseMenuActive == false and delayMenu == 0 then
		f_pauseMenuReset()
		return
	end
	if delayMenu == -1 then f_trainingCfgMenuReset2() end
	if delayMenu == 2 then
		if (pn == 1 and commandGetState(p1Cmd, 'u')) or (pn == 1 and (commandGetState(p1Cmd, 'holdu') and Pbufu >= 18)) or (pn == 2 and commandGetState(p2Cmd, 'u')) or (pn == 2 and (commandGetState(p2Cmd, 'holdu') and P2bufu >= 18)) then
			sndPlay(sndSys, 100, 0)
			charCfg = charCfg - 1
			if bufl then bufl = 0 end
			if bufr then bufr = 0 end
		elseif (pn == 1 and commandGetState(p1Cmd, 'd')) or (pn == 1 and (commandGetState(p1Cmd, 'holdd') and Pbufd >= 18)) or (pn == 2 and commandGetState(p2Cmd, 'd')) or (pn == 2 and (commandGetState(p2Cmd, 'holdd') and P2bufd >= 18)) then
			sndPlay(sndSys, 100, 0)
			charCfg = charCfg + 1
			if bufl then bufl = 0 end
			if bufr then bufr = 0 end
		end
	--Suave Dude Mode
		if charCfg == 1 then
			if ((pn == 1 and commandGetState(p1Cmd, 'l')) or (pn == 2 and commandGetState(p2Cmd, 'l'))) then
				if data.suavemode > 0 then
					sndPlay(sndSys, 100, 1)
					data.suavemode = data.suavemode - 1
					hasChanged = true
				end
			elseif ((pn == 1 and commandGetState(p1Cmd, 'r')) or (pn == 2 and commandGetState(p2Cmd, 'r'))) then
				if data.suavemode < 1 then
					sndPlay(sndSys, 100, 1)
					data.suavemode = data.suavemode + 1
					hasChanged = true
				end
			end
		end
		if charCfg < 1 then
			charCfg = #t_charCfg
			if #t_charCfg > 7 then
				cursorPosY = 7
			else
				cursorPosY = #t_charCfg
			end
		elseif charCfg > #t_charCfg then
			charCfg = 1
			cursorPosY = 1
		elseif ((pn == 1 and commandGetState(p1Cmd, 'u')) or (pn == 1 and (commandGetState(p1Cmd, 'holdu') and Pbufu >= 18))) and cursorPosY > 1 then
			cursorPosY = cursorPosY - 1
		elseif ((pn == 1 and commandGetState(p1Cmd, 'd')) or (pn == 1 and (commandGetState(p1Cmd, 'holdd') and Pbufd >= 18))) and cursorPosY < 7 then
			cursorPosY = cursorPosY + 1
		elseif ((pn == 2 and commandGetState(p2Cmd, 'u')) or (pn == 2 and (commandGetState(p2Cmd, 'holdu') and P2bufu >= 18))) and cursorPosY > 1 then
			cursorPosY = cursorPosY - 1
		elseif ((pn == 2 and commandGetState(p2Cmd, 'd')) or (pn == 2 and (commandGetState(p2Cmd, 'holdd') and P2bufd >= 18))) and cursorPosY < 7 then
			cursorPosY = cursorPosY + 1
		end
		if cursorPosY == 7 then
			moveTxt = (charCfg - 7) * 15
		elseif cursorPosY == 1 then
			moveTxt = (charCfg - 1) * 15
		end
		if #t_charCfg <= 7 then
			maxcharCfg = #t_charCfg
		elseif charCfg - cursorPosY > 0 then
			maxcharCfg = charCfg + 7 - cursorPosY
		else
			maxcharCfg = 7
		end
		animSetScale(pauseBG1, 240, maxcharCfg * 15)
		animSetWindow(pauseBG1, 55,70, 240,105)
		animUpdate(pauseBG1)
		animDraw(pauseBG1)
		textImgDraw(txt_charCfg)
		animSetWindow(cursorBox, 55,55 + cursorPosY * 15, 205,15)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		if hasChanged then
			if not modified then modified = true end
			f_charCfgdisplayTxt()
			hasChanged = false
		end
		for i=1, maxcharCfg do
			if i > charCfg - cursorPosY then
				local align = 1
				local posX = 60
			--Custom Pos for Last items
				if i == #t_charCfg then
					align = 0
					posX = 160
				end
				if t_charCfg[i].varID ~= nil then
					textImgDraw(f_updateTextImg(t_charCfg[i].varID, jgFnt, 0, align, t_charCfg[i].text:upper(), posX, 65 + i * 15 - moveTxt, 0.85, 0.85))
					textImgDraw(f_updateTextImg(t_charCfg[i].varID, jgFnt, 0, -1, t_charCfg[i].varText:upper(), 257, 65 + i * 15 - moveTxt, 0.85, 0.85))
				end
			end
		end
		if maxcharCfg > 7 then
			animDraw(pauseTUpArrow)
			animUpdate(pauseTUpArrow)
		end
		if #t_charCfg > 7 and maxcharCfg < #t_charCfg then
			animDraw(pauseTDownArrow)
			animUpdate(pauseTDownArrow)
		end
		if commandGetState(p1Cmd, 'holdu') then
			Pbufd = 0
			Pbufu = Pbufu + 1
		elseif commandGetState(p2Cmd, 'holdu') then
			P2bufd = 0
			P2bufu = P2bufu + 1
		elseif commandGetState(p1Cmd, 'holdd') then
			Pbufu = 0
			Pbufd = Pbufd + 1
		elseif commandGetState(p2Cmd, 'holdd') then
			P2bufu = 0
			P2bufd = P2bufd + 1
		else
			Pbufu = 0
			Pbufd = 0
			P2bufu = 0
			P2bufd = 0
		end
	end
end