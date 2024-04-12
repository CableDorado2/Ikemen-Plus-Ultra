module(..., package.seeall)

--;===========================================================
--; DATA DEFINITION
--;===========================================================
--Data loading from config.ssz
local file = io.open("save/config.ssz","r")
s_configSSZ = file:read("*all")
file:close()

gl_vol = math.floor(tonumber(s_configSSZ:match('const float GlVol%s*=%s*(%d%.*%d*)') * 100))
se_vol = math.floor(tonumber(s_configSSZ:match('const float SEVol%s*=%s*(%d%.*%d*)') * 100))
bgm_vol = math.floor(tonumber(s_configSSZ:match('const float BGMVol%s*=%s*(%d%.*%d*)') * 100))
pan_str = math.floor(tonumber(s_configSSZ:match('const float PanStr%s*=%s*(%d%.*%d*)') * 100))
resolutionWidth = tonumber(s_configSSZ:match('const int Width%s*=%s*(%d+)'))
resolutionHeight = tonumber(s_configSSZ:match('const int Height%s*=%s*(%d+)'))

--Data saving to config.ssz
function f_saveSettings()
	s_configSSZ = s_configSSZ:gsub('const float GlVol%s*=%s*%d%.*%d*', 'const float GlVol = ' .. gl_vol / 100)
	s_configSSZ = s_configSSZ:gsub('const float SEVol%s*=%s*%d%.*%d*', 'const float SEVol = ' .. se_vol / 100)
	s_configSSZ = s_configSSZ:gsub('const float BGMVol%s*=%s*%d%.*%d*', 'const float BGMVol = ' .. bgm_vol / 100)
	s_configSSZ = s_configSSZ:gsub('const float PanStr%s*=%s*%d%.*%d*', 'const float PanStr = ' .. pan_str / 100)
	local file = io.open("save/config.ssz","w+")
	file:write(s_configSSZ)
	file:close()
	modified = false
	--configModified('true')
end

function f_sysTimeP()
	if (resolutionHeight / 3 * 4) == resolutionWidth then
		--Clock
		if data.clock == "Standard" then
			txt_titleClock = createTextImg(font12, 0, -1, (os.date("%I:%M%p")), 314, 229)
		elseif data.clock == "Full Standard" then
			txt_titleClock = createTextImg(font12, 0, -1, (os.date("%I:%M%p:%S")), 314, 229)
		elseif data.clock == "Military" then
			txt_titleClock = createTextImg(font12, 0, -1, (os.date("%H:%M")), 314, 229)
		elseif data.clock == "Full Military" then
			txt_titleClock = createTextImg(font12, 0, -1, (os.date("%X")), 314, 229)
		end
		--Date
		if data.date == "Type A" then
			txt_titleDate = createTextImg(font12, 0, -1, (os.date("%m-%d-%y")), 314, 239)
		elseif data.date == "Type B" then
			txt_titleDate = createTextImg(font12, 0, -1, (os.date("%d-%m-%Y")), 314, 239)
		elseif data.date == "Type C" then
			txt_titleDate = createTextImg(font12, 0, -1, (os.date("%a %d.%b.%Y")), 314, 239)
		elseif data.date == "Type D" then
			txt_titleDate = createTextImg(font12, 0, -1, (os.date("%A")), 314, 239)
		elseif data.date == "Type E" then
			txt_titleDate = createTextImg(font12, 0, -1, (os.date("%B.%Y")), 314, 239)
		end
	elseif (resolutionHeight / 10 * 16) == resolutionWidth then
		if data.clock == "Standard" then
			txt_titleClock = createTextImg(font12, 0, -1, (os.date("%I:%M%p")), 345, 229)
		elseif data.clock == "Full Standard" then
			txt_titleClock = createTextImg(font12, 0, -1, (os.date("%I:%M%p:%S")), 345, 229)
		elseif data.clock == "Military" then
			txt_titleClock = createTextImg(font12, 0, -1, (os.date("%H:%M")), 345, 229)
		elseif data.clock == "Full Military" then
			txt_titleClock = createTextImg(font12, 0, -1, (os.date("%X")), 345, 229)
		end
		if data.date == "Type A" then
			txt_titleDate = createTextImg(font12, 0, -1, (os.date("%m-%d-%y")), 345, 239)
		elseif data.date == "Type B" then
			txt_titleDate = createTextImg(font12, 0, -1, (os.date("%d-%m-%Y")), 345, 239)
		elseif data.date == "Type C" then
			txt_titleDate = createTextImg(font12, 0, -1, (os.date("%a %d.%b.%Y")), 345, 239)
		elseif data.date == "Type D" then
			txt_titleDate = createTextImg(font12, 0, -1, (os.date("%A")), 345, 239)
		elseif data.date == "Type E" then
			txt_titleDate = createTextImg(font12, 0, -1, (os.date("%B.%Y")), 345, 239)
		end
	elseif (math.floor((resolutionHeight / 9 * 16) + 0.5)) == resolutionWidth then
		if data.clock == "Standard" then
			txt_titleClock = createTextImg(font12, 0, -1, (os.date("%I:%M%p")), 365, 229)
		elseif data.clock == "Full Standard" then
			txt_titleClock = createTextImg(font12, 0, -1, (os.date("%I:%M%p:%S")), 365, 229)
		elseif data.clock == "Military" then
			txt_titleClock = createTextImg(font12, 0, -1, (os.date("%H:%M")), 365, 229)
		elseif data.clock == "Full Military" then
			txt_titleClock = createTextImg(font12, 0, -1, (os.date("%X")), 365, 229)
		end
		if data.date == "Type A" then
			txt_titleDate = createTextImg(font12, 0, -1, (os.date("%m-%d-%y")), 365, 239)
		elseif data.date == "Type B" then
			txt_titleDate = createTextImg(font12, 0, -1, (os.date("%d-%m-%Y")), 365, 239)
		elseif data.date == "Type C" then
			txt_titleDate = createTextImg(font12, 0, -1, (os.date("%a %d.%b.%Y")), 365, 239)
		elseif data.date == "Type D" then
			txt_titleDate = createTextImg(font12, 0, -1, (os.date("%A")), 365, 239)
		elseif data.date == "Type E" then
			txt_titleDate = createTextImg(font12, 0, -1, (os.date("%B.%Y")), 365, 239)
		end
	else
		if data.clock == "Standard" then
			txt_titleClock = createTextImg(font12, 0, -1, (os.date("%I:%M%p")), 345, 229)
		elseif data.clock == "Full Standard" then
			txt_titleClock = createTextImg(font12, 0, -1, (os.date("%I:%M%p:%S")), 345, 229)
		elseif data.clock == "Military" then
			txt_titleClock = createTextImg(font12, 0, -1, (os.date("%H:%M")), 345, 229)
		elseif data.clock == "Full Military" then
			txt_titleClock = createTextImg(font12, 0, -1, (os.date("%X")), 345, 229)
		end
		if data.date == "Type A" then
			txt_titleDate = createTextImg(font12, 0, -1, (os.date("%m-%d-%y")), 345, 239)
		elseif data.date == "Type B" then
			txt_titleDate = createTextImg(font12, 0, -1, (os.date("%d-%m-%Y")), 345, 239)
		elseif data.date == "Type C" then
			txt_titleDate = createTextImg(font12, 0, -1, (os.date("%a %d.%b.%Y")), 345, 239)
		elseif data.date == "Type D" then
			txt_titleDate = createTextImg(font12, 0, -1, (os.date("%A")), 345, 239)
		elseif data.date == "Type E" then
			txt_titleDate = createTextImg(font12, 0, -1, (os.date("%B.%Y")), 345, 239)
		end
	end
	textImgDraw(txt_titleClock) --Draw Clock
	textImgDraw(txt_titleDate) --Draw Date
end

gl_vol = f_minMax(gl_vol,0,100)
se_vol = f_minMax(se_vol,0,100)
bgm_vol = f_minMax(bgm_vol,0,100)

if pan_str < 20 then
	pan_str = 0
elseif pan_str >= 20 and pan_str < 60 then
	pan_str = 40
elseif pan_str >= 60 and pan_str < 100 then
	pan_str = 80
elseif pan_str >= 100 and pan_str < 140 then
	pan_str = 120
elseif pan_str >= 140 then
	pan_str = 160
end
t_panStr = {"None", "Narrow", "Medium", "Wide", "Full"}

--;===========================================================
--; PAUSE MENU SCREENPACK
--;===========================================================
txt_attractCredits = createTextImg(font1, 0, -1, "Credits: "..data.attractCoins.."", 181.5, 235)

--Scrolling background
pauseBG0 = animNew(sysSff, [[
100,0, 0,0, -1
]])
animAddPos(pauseBG0, 160, 0)
animSetTile(pauseBG0, 1, 1)
animSetColorKey(pauseBG0, -1)

--Transparent Background Instantaneous (fade in)
darkenIn = animNew(sysSff, [[300,1, 0,0, -1, 0, AS256D102]])
animSetPos(darkenIn, -54, 0)
animSetScale(darkenIn, 427, 240)

--Transparent Background Instantaneous (fade out)
darkenOut = animNew(sysSff, [[300,1, 0,0, -1, 0, AS256D256]])
animSetPos(darkenOut, -54, 0)
animSetScale(darkenOut, 427, 240)

--Transparent Background Full Animation (fade in)
darkenInAnim = animNew(sysSff, [[
300,1, 0,0, 1, 0, AS256D240
300,1, 0,0, 1, 0, AS256D225
300,1, 0,0, 1, 0, AS256D209
300,1, 0,0, 1, 0, AS256D194
300,1, 0,0, 1, 0, AS256D179
300,1, 0,0, 1, 0, AS256D163
300,1, 0,0, 1, 0, AS256D148
300,1, 0,0, 1, 0, AS256D132
300,1, 0,0, 1, 0, AS256D117
300,1, 0,0, -1, 0, AS256D102
]])
animSetPos(darkenInAnim, -54, 0)
animSetScale(darkenInAnim, 427, 240)

--Transparent Background (fade out)
darkenOutAnim = animNew(sysSff, [[
300,1, 0,0, 1, 0, AS256D117
300,1, 0,0, 1, 0, AS256D132
300,1, 0,0, 1, 0, AS256D148
300,1, 0,0, 1, 0, AS256D163
300,1, 0,0, 1, 0, AS256D179
300,1, 0,0, 1, 0, AS256D194
300,1, 0,0, 1, 0, AS256D209
300,1, 0,0, 1, 0, AS256D225
300,1, 0,0, 1, 0, AS256D240
300,1, 0,0, -1, 0, AS256D256
]])
animSetPos(darkenOutAnim, -54, 0)
animSetScale(darkenOutAnim, 427, 240)

--Transparent background
pauseBG1 = animNew(sysSff, [[
3,0, 0,0, -1
]])
animSetPos(pauseBG1, 20, 70)
animSetAlpha(pauseBG1, 20, 100)

--Message Fade BG
fadeWindowBG = animNew(sysSff, [[
3,0, 0,0, -1, 0, AS256D102
]])
animSetPos(fadeWindowBG, -54, 0)
animSetScale(fadeWindowBG, 427, 240)
animUpdate(fadeWindowBG)

--Cursor Box
cursorBox = animNew(sysSff, [[
100,1, 0,0, -1
]])
animSetTile(cursorBox, 1, 1)

--Optimized Cursor Box
--cursorBox = animNew(sysSff, [[
--3,1, 0,0, -1
--]])
--animSetPos(cursorBox, 80, 20)
--animSetAlpha(cursorBox, 20, 100)
--animUpdate(cursorBox)

--Up Arrow
pauseUpArrow = animNew(sysSff, [[
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
pauseDownArrow = animNew(sysSff, [[
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
pauseLeftArrow = animNew(sysSff, [[
223,0, 0,0, 10
223,1, 0,0, 10
223,2, 0,0, 10
223,3, 0,0, 10
223,3, 0,0, 10
223,2, 0,0, 10
223,1, 0,0, 10
223,0, 0,0, 10
]])
animAddPos(pauseLeftArrow, 69, 112)
animUpdate(pauseLeftArrow)
animSetScale(pauseLeftArrow, 0.5, 0.5)

--Right Page Arrow
pauseRightArrow = animNew(sysSff, [[
224,0, 0,0, 10
224,1, 0,0, 10
224,2, 0,0, 10
224,3, 0,0, 10
224,3, 0,0, 10
224,2, 0,0, 10
224,1, 0,0, 10
224,0, 0,0, 10
]])
animAddPos(pauseRightArrow, 242, 112)
animUpdate(pauseRightArrow)
animSetScale(pauseRightArrow, 0.5, 0.5)

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

function f_resetTrainingCfg()
	if not data.hudDisplay then setHUD(true) end
	if data.hitbox then toggleClsnDraw() end
	if data.debugInfo then toggleDebugDraw() end
	setDamageDisplay(0)
	setInputDisplay(0)
end

--Restore Training Settings Saved (WIP)
if getGameMode() == "practice" then
	--Screen Info
	if not data.damageDisplay then
		setDamageDisplay(0)
	else
		setDamageDisplay(1)
	end
	if not data.inputDisplay then
		setInputDisplay(0)
	else
		setInputDisplay(1)
	end
	data.hitbox = false
	data.debugInfo = false
	--Power Gauge
	data.PowerStateP1 = "Max at Start"
	setPowerStateP1(11)
	data.PowerStateP2 = "Max at Start"
	setPowerStateP2(11)
	--Life Gauge
	data.LifeStateP1 = "100%"
	setLifeStateP1(100)
	data.LifeStateP2 = "100%"
	setLifeStateP2(100)
	--Dummy
	data.dummyMode = "Manual"
	--Playback
	data.pbkRecSlot = f_minMax(data.pbkRecSlot,1,5)
	data.pbkPlaySlot = f_minMax(data.pbkPlaySlot,1,8)
	if (f_boolToNum(data.pbkSlot1)+f_boolToNum(data.pbkSlot2)+f_boolToNum(data.pbkSlot3)+f_boolToNum(data.pbkSlot4)+f_boolToNum(data.pbkSlot5)) == 0 then
		data.pbkSlot1 = true
	end
	--Apply settings from training_sav.lua
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
end

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
	trainingModified = false
	trainingCfg = 1
	cursorPosY = 1
	moveTxt = 0
	mainGoTo = "Training"
	delayMenu = -2
end

function f_trainingCfgMenuReset2()
	trainingModified = false
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
--; PAUSE MENU
--;===========================================================
t_pauseMain = {
	{id = '', text = "CONTINUE"},
	{id = '', text = "MOVELIST"},
	{id = '', text = "SETTINGS"},
	{id = '', text = "HIDE MENU"},
	{id = '', text = "GIVE UP"},
	{id = '', text = "MAIN MENU"}
}
if getGameMode() == "practice" or getGameMode() == "vs" or getGameMode() == "story" or getGameMode() == "storyRoster" then
	t_pauseMain[5].text = "CHARACTER SELECT"
	if getGameMode() == "practice" then
		table.insert(t_pauseMain,7,{id = '', text = "TRAINING MENU"})
	elseif getGameMode() == "story" or getGameMode() == "storyRoster" then
		t_pauseMain[6].text = "STORY SELECT"
	end
elseif getGameMode() == "stageviewer" then t_pauseMain[5].text = "STAGE SELECT"
elseif getGameMode() == "mission" then t_pauseMain[6].text = "MISSION SELECT"
elseif getGameMode() == "event" then t_pauseMain[6].text = "EVENT SELECT"
elseif getGameMode() == "random" then table.remove(t_pauseMain,6)
end

--Pause Menu for Replays
if getGameMode() == "replay" or getGameMode() == "randomtest" then
t_pauseMain = nil
t_pauseMain = {
	{id = '', text = "CONTINUE"},
	{id = '', text = "SETTINGS"},
	{id = '', text = "HIDE MENU"},
	{id = '', text = "BATTLE INFO"},
	{id = '', text = "EXIT"}
}
end

if getPlayerSide() == "p1right" then --Pause Controls if P1 is in Right Side
	data.p1In = 2
	data.p2In = 1
else --Pause Controls if P1 is in Left Side
	setCom(2, 0) --Enable player 2 pause when cpu have control (this disable AI when you press SHITF+F4)
	data.p2In = 2
end

function f_pauseMain(p, st, esc)
	pn = p
	escape = esc
	start = st
	if data.pauseMode == "No" or getGameMode() == "demo" then --Mugen Exit Type
		if getGameMode() == "replay" or getGameMode() == "demo" then
			data.replayDone = true
			data.tempBack = true
			f_saveTemp()
		end
		exitMatch()
	end
	if start and getGameMode() == "arcade" then --Detects when you press start button
		if pn == 2 and (getPlayerSide() == "p1left" or getPlayerSide() == "p1right") then --Player 2 in any side is the challenger
			challengerActive = true
		elseif pn == 1 and (getPlayerSide() == "p2left" or getPlayerSide() == "p2right") then --Player 1 in any side is the challenger
			challengerActive = true
		end
	end
	if challengerActive == true and screenTime < 200 then --Here Comes a New Challenger!
		if screenTime == 0 then
			playBGM(bgmNothing) --Stop Stage Song
			sndPlay(sysSnd, 200, 1)
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
	if pauseMenuActive == false and delayMenu == -1 then --Start Pause Menu
		animReset(darkenIn)
		animUpdate(darkenIn)
		pauseMenuActive = true
		if not challengerActive then sndPlay(sysSnd, 100, 1) end
		delayMenu = 0
	end
	if (escape or start) and pbrecActive then --Stop playback recording when you open pause menu
		endDummyPlayback(sysSnd)
		pbrecActive = false
		pauseMenuActive = false
	end
	cmdInput()
	if pauseMode == "" or mainGoTo ~= "" then
		if challengerActive == false then
			if pn == 1 then txt_pause = createTextImg(jgFnt, 5, 0, "PAUSE [P1]", 159, 63)
			elseif pn == 2 then txt_pause = createTextImg(jgFnt, 1, 0, "PAUSE [P2]", 159, 63)
			end
			--HIDE MENU
			if getGameMode() == "replay" or getGameMode() == "randomtest" then
				if ((pn == 1 and btnPalNo(p1Cmd) > 0) or (pn == 2 and btnPalNo(p2Cmd) > 0)) and pauseMenu == 3 then hide = true end
			else
				if ((pn == 1 and btnPalNo(p1Cmd) > 0) or (pn == 2 and btnPalNo(p2Cmd) > 0)) and pauseMenu == 4 then hide = true end
			end
			--RESUME GAME
			if (escape or start or (((pn == 1 and btnPalNo(p1Cmd) > 0) or (pn == 2 and btnPalNo(p2Cmd) > 0)) and (pauseMenu == 1 or hide))) and delayMenu == 2 then
				sndPlay(sysSnd, 100, 2)
				animReset(darkenOut)
				animUpdate(darkenOut)
				pauseMenuActive = false
			end
			if pauseMenuActive == true and delayMenu < 2 then --To delay Menu Fade In
				delayMenu = delayMenu + 1
				animUpdate(darkenIn)
			elseif pauseMenuActive == false and delayMenu > 0 then --To delay Menu Fade Out
				delayMenu = delayMenu - 1
				animUpdate(darkenOut)
			end
			if pauseMenuActive == false and delayMenu == 0 then
				togglePauseMenu(0)
				if hide then
					togglePause()
					f_screenShot()
					hide = false
				end
				setSysCtrl(0)
				delayMenu = -1
				return
			end
			if pauseMenuActive then
				animDraw(darkenIn)
			else
				animDraw(darkenOut)
			end
			if delayMenu == -1 and mainGoTo ~= "" then
				delayMenu = 0
				pauseMode = mainGoTo
				mainGoTo = ""
			end
			if delayMenu == 2 then
				setSysCtrl(10)
				if (pn == 1 and commandGetState(p1Cmd, 'u')) or (pn == 1 and (commandGetState(p1Cmd, 'holdu') and Pbufu >= 18)) or (pn == 2 and commandGetState(p2Cmd, 'u')) or (pn == 2 and (commandGetState(p2Cmd, 'holdu') and P2bufu >= 18)) then
					sndPlay(sysSnd, 100, 0)
					pauseMenu = pauseMenu - 1
				elseif (pn == 1 and commandGetState(p1Cmd, 'd')) or (pn == 1 and (commandGetState(p1Cmd, 'holdd') and Pbufd >= 18)) or (pn == 2 and commandGetState(p2Cmd, 'd')) or (pn == 2 and (commandGetState(p2Cmd, 'holdd') and P2bufd >= 18)) then
					sndPlay(sysSnd, 100, 0)
					pauseMenu = pauseMenu + 1
				end
				if data.pauseMode == "Yes" then
					--Actions in Demo or Replay Modes
					if getGameMode() == "replay" or getGameMode() == "randomtest" then
						if (pn == 1 and btnPalNo(p1Cmd) > 0) or (pn == 2 and btnPalNo(p2Cmd) > 0) then
							--SETTINGS
							if pauseMenu == 2 then
								sndPlay(sysSnd, 100, 1)
								f_gameCfgMenuReset()
							--BATTLE INFO
							elseif pauseMenu == 4 then
								sndPlay(sysSnd, 100, 1)
								f_trainingCfgMenuReset()
							--EXIT
							elseif pauseMenu == 5 then
								sndPlay(sysSnd, 100, 1)
								f_confirmReset()
								mainGoTo = "Confirm"
								if getGameMode() == "replay" then
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
								sndPlay(sysSnd, 100, 5)
							--SETTINGS
							elseif pauseMenu == 3 then
								sndPlay(sysSnd, 100, 1)
								f_gameCfgMenuReset()
							--BACK TO CHARACTER SELECT
							elseif pauseMenu == 5 then
								if getGameMode() == "story" then
									sndPlay(sysSnd, 100, 5)
								elseif getGameMode() == "random" then --Back to Main Menu for Quick Match Mode
									sndPlay(sysSnd, 100, 1)
									f_confirmReset()
									mainGoTo = "Confirm"
									mainMenuBack = true
									delayMenu = -2
								else
									sndPlay(sysSnd, 100, 1)
									f_confirmReset()
									mainGoTo = "Confirm"
									delayMenu = -2
								end
							--EXIT TO MAIN MENU
							elseif pauseMenu == 6 then
								sndPlay(sysSnd, 100, 1)
								f_confirmReset()
								mainGoTo = "Confirm"
								mainMenuBack = true
								delayMenu = -2
							--TRAINING SETTINGS
							elseif pauseMenu == 7 then
								sndPlay(sysSnd, 100, 1)
								f_trainingCfgMenuReset()
							end
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
				--Draw BG
				--animDraw(f_animVelocity(pauseBG0, -1, -1))
				--Draw Transparent Table BG
				animSetScale(pauseBG1, 220, maxPause*15)
				animSetWindow(pauseBG1, 80,70, 160,105)
				animDraw(pauseBG1)
				animUpdate(pauseBG1)
				--Draw Title Menu
				textImgDraw(txt_pause)
				--Draw Cursor
				animSetWindow(cursorBox, 80,55+PcursorPosY*15, 160,15)
				f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
				animDraw(f_animVelocity(cursorBox, -1, -1))
				--Draw Text for Table
				for i=1, maxPause do	
					if i > pauseMenu - PcursorPosY then
						t_pauseMain[i].id = createTextImg(font14, 0, 0, t_pauseMain[i].text, 158.5, 65+i*15-PmoveTxt,0.85,0.85)
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
				f_sysTimeP()
				if data.attractMode == true then textImgDraw(txt_attractCredits) end --Draw Attract Credits
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
	elseif pauseMode == "Training" or pauseMode == "Playback" then
		f_pauseTraining()
	elseif pauseMode == "Confirm" then
		f_pauseConfirm()
	end
end

--;===========================================================
--; PAUSE CONFIRM MESSAGE
--;===========================================================
txt_pauseQuestion = createTextImg(font14, 0, 0, "", 160, 70,0.7,0.7)
txt_pauseConfirm = createTextImg(jgFnt, 1, 0, "ARE YOU SURE?", 160, 90)

--Confirm Window BG
confirmPauseBG = animNew(sysSff, [[
230,1, 0,0,
]])
animSetPos(confirmPauseBG, 83.5, 77)
animUpdate(confirmPauseBG)
animSetScale(confirmPauseBG, 1, 1)

t_confirmPause = {
	{id = textImgNew(), text = "YES"},
	{id = textImgNew(), text = "NO"},
}

function f_pauseConfirm()
	--MESSAGES FOR BACK TO A MAIN MENU
	if mainMenuBack == true then
		if pn == 1 then
			if getGameMode() == "mission" then textImgSetText(txt_pauseQuestion, "[PLAYER 1] WILL BACK TO MISSION SELECT")
			elseif getGameMode() == "event" then textImgSetText(txt_pauseQuestion, "[PLAYER 1] WILL BACK TO EVENT SELECT")
			elseif getGameMode() == "replay" then textImgSetText(txt_pauseQuestion, "[PLAYER 1] WILL BACK TO REPLAY SELECT")
			elseif getGameMode() == "story" or getGameMode() == "storyRoster" then textImgSetText(txt_pauseQuestion, "[PLAYER 1] WILL BACK TO STORY SELECT")
			else textImgSetText(txt_pauseQuestion, "[PLAYER 1] WILL BACK TO MAIN MENU")
			end
		elseif pn == 2 then
			if getGameMode() == "mission" then textImgSetText(txt_pauseQuestion, "[PLAYER 2] WILL BACK TO MISSION SELECT")
			elseif getGameMode() == "event" then textImgSetText(txt_pauseQuestion, "[PLAYER 2] WILL BACK TO EVENT SELECT")
			elseif getGameMode() == "replay" then textImgSetText(txt_pauseQuestion, "[PLAYER 2] WILL BACK TO REPLAY SELECT")
			elseif getGameMode() == "story" or getGameMode() == "storyRoster" then textImgSetText(txt_pauseQuestion, "[PLAYER 2] WILL BACK TO STORY SELECT")
			else textImgSetText(txt_pauseQuestion, "[PLAYER 2] WILL BACK TO MAIN MENU")
			end
		end
	--MESSAGES FOR BACK TO A CHARACTER SELECT
	elseif mainMenuBack == false then
		if pn == 1 then
			if getGameMode() == "vs" or getGameMode() == "practice" or getGameMode() == "storyRoster" then textImgSetText(txt_pauseQuestion, "[PLAYER 1] WILL BACK TO CHARACTER SELECT")
			elseif getGameMode() == "stageviewer" then textImgSetText(txt_pauseQuestion, "[PLAYER 1] WILL BACK TO STAGE SELECT")
			elseif getGameMode() == "replay" then textImgSetText(txt_pauseQuestion, "[PLAYER 1] WILL BACK TO REPLAY SELECT")
			elseif getGameMode() == "random" or getGameMode() == "randomtest" then textImgSetText(txt_pauseQuestion, "[PLAYER 1] WILL BACK TO MAIN MENU")
			else textImgSetText(txt_pauseQuestion, "[PLAYER 1] WILL LEAVE THIS MATCH")
			end
		elseif pn == 2 then
			if getGameMode() == "vs" or getGameMode() == "practice" or getGameMode() == "storyRoster" then textImgSetText(txt_pauseQuestion, "[PLAYER 2] WILL BACK TO CHARACTER SELECT")
			elseif getGameMode() == "stageviewer" then textImgSetText(txt_pauseQuestion, "[PLAYER 2] WILL BACK TO STAGE SELECT")
			elseif getGameMode() == "replay" then textImgSetText(txt_pauseQuestion, "[PLAYER 2] WILL BACK TO REPLAY SELECT")
			elseif getGameMode() == "random" or getGameMode() == "randomtest" then textImgSetText(txt_pauseQuestion, "[PLAYER 2] WILL BACK TO MAIN MENU")
			else textImgSetText(txt_pauseQuestion, "[PLAYER 2] WILL LEAVE THIS MATCH")
			end
		end
	end
	if pauseMode == "Confirm" or okGoTo ~= "" then
		if delayMenu == 2 then
			if start then
				sndPlay(sysSnd, 100, 2)
				animReset(darkenOut)
				animUpdate(darkenOut)
				pauseMenuActive = false
				bufl = 0
				bufr = 0
			--BACK/NO ACTION
			elseif escape or (((pn == 1 and btnPalNo(p1Cmd) > 0) or (pn == 2 and btnPalNo(p2Cmd) > 0)) and confirmPause == #t_confirmPause) then
				sndPlay(sysSnd, 100, 2)
				delayMenu = -2
				bufl = 0
				bufr = 0
			end
		end
		if pauseMenuActive == true and delayMenu < 2 then
			delayMenu = delayMenu + 1
		elseif pauseMenuActive == false and delayMenu > 0 then
			delayMenu = delayMenu - 1
			--animUpdate(darkenOut)
		end
		if pauseMenuActive == false and delayMenu == 0 then
			f_pauseMenuReset()
			return
		end
		if pauseMenuActive then
			animDraw(darkenIn)
		else
			animDraw(darkenOut)
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
				sndPlay(sysSnd, 100, 0)
				confirmPause = confirmPause - 1
			elseif (pn == 1 and commandGetState(p1Cmd, 'd')) or (pn == 2 and commandGetState(p2Cmd, 'd')) then
				sndPlay(sysSnd, 100, 0)
				confirmPause = confirmPause + 1
			end
			if confirmPause < 1 then
				confirmPause = #t_confirmPause
				if #t_confirmPause > 4 then
					cursorPosYConfirm = 4
				else
					cursorPosYConfirm = #t_confirmPause-1
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
			animUpdate(confirmPauseBG)
			textImgDraw(txt_pauseConfirm)
			textImgDraw(txt_pauseQuestion)
			for i=1, #t_confirmPause do
				if i == confirmPause then
					bank = 5
				else
					bank = 0
				end
				textImgDraw(f_updateTextImg(t_confirmPause[i].id, jgFnt, bank, 0, t_confirmPause[i].text, 159, 100+i*13-moveTxtConfirm))
			end
			animSetWindow(cursorBox, 87,103+cursorPosYConfirm*13, 144,13)
			f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
			animDraw(f_animVelocity(cursorBox, -1, -1))
			f_sysTimeP()
			if data.attractMode == true then textImgDraw(txt_attractCredits) end
			--BACK TO MAIN MENU (TEMP)
			if mainMenuBack == true then
				if ((pn == 1 and btnPalNo(p1Cmd) > 0) or (pn == 2 and btnPalNo(p2Cmd) > 0)) and confirmPause == 1 then
					sndPlay(sysSnd, 100, 1)
					f_resetTrainingCfg() --To clean training cfg
					data.tempBack = true
					f_saveTemp()
					exitMatch()
				end
			--BACK TO CHARACTER SELECT
			elseif mainMenuBack == false then
				if ((pn == 1 and btnPalNo(p1Cmd) > 0) or (pn == 2 and btnPalNo(p2Cmd) > 0)) and confirmPause == 1 then
					sndPlay(sysSnd, 100, 1)
					f_resetTrainingCfg()
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
t_gameCfg = {
	{varID = textImgNew(), text = "Audio Settings",   		varText = ""},
	{varID = textImgNew(), text = "Input Settings",   		varText = ""},
	{varID = textImgNew(), text = "HUD Display",			varText = ""},
	{varID = textImgNew(), text = "Open Screenshots",		varText = ""},
	{varID = textImgNew(), text = "Change Stage Song",		varText = ""},
	{varID = textImgNew(), text = "              BACK",   	varText = ""},
}

if getGameMode() ~= "practice" and getGameMode() ~= "replay" and getGameMode() ~= "randomtest" then table.remove(t_gameCfg,5) end

--Logic to Display Text instead Boolean Values
function f_gameCfgdisplayTxt()
if data.hudDisplay then t_gameCfg[3].varText = "Yes" else t_gameCfg[3].varText = "No" end
end

f_gameCfgdisplayTxt() --Load Display Text

function f_pauseSettings()
	local hasChanged = false
	if pn == 1 then txt_gameCfg = createTextImg(jgFnt, 5, 0, "GAME SETTINGS [P1]", 159, 63)
	elseif pn == 2 then txt_gameCfg = createTextImg(jgFnt, 1, 0, "GAME SETTINGS [P2]", 159, 63)
	end
	if pauseMode == "Settings" or cfgGoTo ~= "" then
		if delayMenu == 2 then
			if start then
				sndPlay(sysSnd, 100, 2)
				animReset(darkenOut)
				animUpdate(darkenOut)
				pauseMenuActive = false
				bufl = 0
				bufr = 0
			--BACK
			elseif escape or (((pn == 1 and btnPalNo(p1Cmd) > 0) or (pn == 2 and btnPalNo(p2Cmd) > 0)) and gameCfg == #t_gameCfg) then
				sndPlay(sysSnd, 100, 2)
				delayMenu = -2
				bufl = 0
				bufr = 0
			end
		end
		if pauseMenuActive == true and delayMenu < 2 then
			delayMenu = delayMenu + 1
			--animUpdate(darkenIn)
		elseif pauseMenuActive == false and delayMenu > 0 then
			delayMenu = delayMenu - 1
			--animUpdate(darkenOut)
		end
		if pauseMenuActive == false and delayMenu == 0 then
			f_pauseMenuReset()
			return
		end
		if pauseMenuActive then
			animDraw(darkenIn)
		else
			animDraw(darkenOut)
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
				sndPlay(sysSnd, 100, 0)
				gameCfg = gameCfg - 1
				if bufl then bufl = 0 end
				if bufr then bufr = 0 end
			elseif (pn == 1 and commandGetState(p1Cmd, 'd')) or (pn == 1 and (commandGetState(p1Cmd, 'holdd') and Pbufd >= 18)) or (pn == 2 and commandGetState(p2Cmd, 'd')) or (pn == 2 and (commandGetState(p2Cmd, 'holdd') and P2bufd >= 18)) then
				sndPlay(sysSnd, 100, 0)
				gameCfg = gameCfg + 1
				if bufl then bufl = 0 end
				if bufr then bufr = 0 end
			end
			if (pn == 1 and btnPalNo(p1Cmd) > 0) or (pn == 2 and btnPalNo(p2Cmd) > 0) then
				--Audio Settings
				if gameCfg == 1 then
					sndPlay(sysSnd, 100, 1)
					cfgGoTo = "Audio"
					audioCfg = 1
					cursorPosY = 1
					moveTxt = 0
					delayMenu = -2
				--Input Settings
				elseif gameCfg == 2 then
					sndPlay(sysSnd, 100, 5)
				--Open Screenshots Folder
				elseif gameCfg == 4 then
					sndPlay(sysSnd, 100, 1)
					sszOpen("screenshots", "")
				--Play/Change Song
				elseif gameCfg == 5 then
					sndPlay(sysSnd, 100, 1)
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
					sndPlay(sysSnd, 100, 1)
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
			--animDraw(f_animVelocity(pauseBG0, -1, -1))
			animSetScale(pauseBG1, 220, maxgameCfg*15)
			animSetWindow(pauseBG1, 80,70, 160,105)
			animDraw(pauseBG1)
			--animUpdate(pauseBG1)
			textImgDraw(txt_gameCfg)
			animSetWindow(cursorBox, 80,55+cursorPosY*15, 160,15)
			f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
			animDraw(f_animVelocity(cursorBox, -1, -1))
			for i=1, maxgameCfg do
				if i > gameCfg - cursorPosY then
					if t_gameCfg[i].varID ~= nil then
						textImgDraw(f_updateTextImg(t_gameCfg[i].varID, font14, 0, 1, t_gameCfg[i].text, 85, 65+i*15-moveTxt,0.85,0.85))
						textImgDraw(f_updateTextImg(t_gameCfg[i].varID, font14, 0, -1, t_gameCfg[i].varText, 235, 65+i*15-moveTxt,0.85,0.85))
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
			f_sysTimeP()
			if data.attractMode == true then textImgDraw(txt_attractCredits) end
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
t_audioCfg = {
	{varID = textImgNew(), text = "Master Volume",   		varText = gl_vol},
	{varID = textImgNew(), text = "SFX Volume",       		varText = se_vol},
	{varID = textImgNew(), text = "BGM Volume",      		varText = bgm_vol},
	{varID = textImgNew(), text = "Audio Panning",   		varText = t_panStr[math.ceil((pan_str + 1) * 0.025)]},
	{varID = textImgNew(), text = "              BACK",  	varText = ""},
}

function f_pauseAudio()
	local hasChanged = false
	if pn == 1 then txt_audioCfg = createTextImg(jgFnt, 5, 0, "AUDIO SETTINGS [P1]", 159, 63)
	elseif pn == 2 then txt_audioCfg = createTextImg(jgFnt, 1, 0, "AUDIO SETTINGS [P2]", 159, 63)
	end
	if delayMenu == 2 then
		if start then
			sndPlay(sysSnd, 100, 2)
			animReset(darkenOut)
			animUpdate(darkenOut)
			pauseMenuActive = false
			bufl = 0
			bufr = 0
			if modified then f_saveSettings() end
		elseif escape or (((pn == 1 and btnPalNo(p1Cmd) > 0) or (pn == 2 and btnPalNo(p2Cmd) > 0)) and audioCfg == #t_audioCfg) then
			sndPlay(sysSnd, 100, 2)
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
		--animUpdate(darkenOut)
	end
	if pauseMenuActive == false and delayMenu == 0 then
		f_pauseMenuReset()
		return
	end
	if pauseMenuActive then
		animDraw(darkenIn)
	else
		animDraw(darkenOut)
	end
	if delayMenu == -1 then f_gameCfgMenuReset2() end
	if delayMenu == 2 then
		if (pn == 1 and commandGetState(p1Cmd, 'u')) or (pn == 1 and (commandGetState(p1Cmd, 'holdu') and Pbufu >= 18)) or (pn == 2 and commandGetState(p2Cmd, 'u')) or (pn == 2 and (commandGetState(p2Cmd, 'holdu') and P2bufu >= 18)) then
			sndPlay(sysSnd, 100, 0)
			audioCfg = audioCfg - 1
			if bufl then bufl = 0 end
			if bufr then bufr = 0 end
		elseif (pn == 1 and commandGetState(p1Cmd, 'd')) or (pn == 1 and (commandGetState(p1Cmd, 'holdd') and Pbufd >= 18)) or (pn == 2 and commandGetState(p2Cmd, 'd')) or (pn == 2 and (commandGetState(p2Cmd, 'holdd') and P2bufd >= 18)) then
			sndPlay(sysSnd, 100, 0)
			audioCfg = audioCfg + 1
			if bufl then bufl = 0 end
			if bufr then bufr = 0 end
		end
		--Master volume
		if audioCfg == 1 then
			if ((pn == 1 and commandGetState(p1Cmd, 'r')) or (pn == 2 and commandGetState(p2Cmd, 'r'))) or (((pn == 1 and commandGetState(p1Cmd, 'holdr')) or (pn == 2 and commandGetState(p2Cmd, 'holdr'))) and bufr >= 20 and gl_vol < 100) then
				if gl_vol < 100 then gl_vol = gl_vol + 1 else gl_vol = 0 end
				if (pn == 1 and commandGetState(p1Cmd, 'r')) or (pn == 2 and commandGetState(p2Cmd, 'r')) then sndPlay(sysSnd, 100, 0) end
				hasChanged = true
			elseif ((pn == 1 and commandGetState(p1Cmd, 'l')) or (pn == 2 and commandGetState(p2Cmd, 'l'))) or (((pn == 1 and commandGetState(p1Cmd, 'holdl')) or (pn == 2 and commandGetState(p2Cmd, 'holdl'))) and bufl >= 20 and gl_vol > 0) then
				if gl_vol > 0 then gl_vol = gl_vol - 1 else gl_vol = 100 end
				if (pn == 1 and commandGetState(p1Cmd, 'l')) or (pn == 2 and commandGetState(p2Cmd, 'l')) then sndPlay(sysSnd, 100, 0) end
				hasChanged = true
			end
		--SFX volume
		elseif audioCfg == 2 then
			if ((pn == 1 and commandGetState(p1Cmd, 'r')) or (pn == 2 and commandGetState(p2Cmd, 'r'))) or (((pn == 1 and commandGetState(p1Cmd, 'holdr')) or (pn == 2 and commandGetState(p2Cmd, 'holdr'))) and bufr >= 20 and se_vol < 100) then
				if se_vol < 100 then se_vol = se_vol + 1 else se_vol = 0 end
				if (pn == 1 and commandGetState(p1Cmd, 'r')) or (pn == 2 and commandGetState(p2Cmd, 'r')) then sndPlay(sysSnd, 100, 0) end
				hasChanged = true
			elseif ((pn == 1 and commandGetState(p1Cmd, 'l')) or (pn == 2 and commandGetState(p2Cmd, 'l'))) or (((pn == 1 and commandGetState(p1Cmd, 'holdl')) or (pn == 2 and commandGetState(p2Cmd, 'holdl'))) and bufl >= 20 and se_vol > 0) then
				if se_vol > 0 then se_vol = se_vol - 1 else se_vol = 100 end
				if (pn == 1 and commandGetState(p1Cmd, 'l')) or (pn == 2 and commandGetState(p2Cmd, 'l')) then sndPlay(sysSnd, 100, 0) end
				hasChanged = true
			end
		--BGM volume
		elseif audioCfg == 3 then
			if ((pn == 1 and commandGetState(p1Cmd, 'r')) or (pn == 2 and commandGetState(p2Cmd, 'r'))) or (((pn == 1 and commandGetState(p1Cmd, 'holdr')) or (pn == 2 and commandGetState(p2Cmd, 'holdr'))) and bufr >= 20 and bgm_vol < 100) then
				if bgm_vol < 100 then bgm_vol = bgm_vol + 1 else bgm_vol = 0 end
				if (pn == 1 and commandGetState(p1Cmd, 'r')) or (pn == 2 and commandGetState(p2Cmd, 'r')) then sndPlay(sysSnd, 100, 0) end
				hasChanged = true
			elseif ((pn == 1 and commandGetState(p1Cmd, 'l')) or (pn == 2 and commandGetState(p2Cmd, 'l'))) or (((pn == 1 and commandGetState(p1Cmd, 'holdl')) or (pn == 2 and commandGetState(p2Cmd, 'holdl'))) and bufl >= 20 and bgm_vol > 0) then
				if bgm_vol > 0 then bgm_vol = bgm_vol - 1 else bgm_vol = 100 end
				if (pn == 1 and commandGetState(p1Cmd, 'l')) or (pn == 2 and commandGetState(p2Cmd, 'l')) then sndPlay(sysSnd, 100, 0) end
				hasChanged = true
			end
		--Audio Panning
		elseif audioCfg == 4 then
			if commandGetState(p1Cmd, 'r') then
				sndPlay(sysSnd, 100, 0)
				if pan_str < 160 then pan_str = pan_str + 40 else pan_str = 0 end
				hasChanged = true
			elseif commandGetState(p1Cmd, 'l') then
				sndPlay(sysSnd, 100, 0)
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
		if hasChanged then
			if not modified then modified = true end
			t_audioCfg[1].varText = gl_vol
			t_audioCfg[2].varText = se_vol    
			t_audioCfg[3].varText = bgm_vol
			t_audioCfg[4].varText = t_panStr[math.ceil((pan_str + 1) * 0.025)]
			setVolume(gl_vol / 100, se_vol / 100, bgm_vol / 100)
			setPanStr(pan_str / 100)
			hasChanged = false
		end
		--animDraw(f_animVelocity(pauseBG0, -1, -1))
		animSetScale(pauseBG1, 220, maxAudioCfg*15)
		animSetWindow(pauseBG1, 80,70, 160,105)
		animDraw(pauseBG1)
		--animUpdate(pauseBG1)
		textImgDraw(txt_audioCfg)
		animSetWindow(cursorBox, 80,55+cursorPosY*15, 160,15)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		for i=1, maxAudioCfg do
			if i > audioCfg - cursorPosY then
				if t_audioCfg[i].varID ~= nil then
					textImgDraw(f_updateTextImg(t_audioCfg[i].varID, font14, 0, 1, t_audioCfg[i].text, 85, 65+i*15-moveTxt,0.85,0.85))
					textImgDraw(f_updateTextImg(t_audioCfg[i].varID, font14, 0, -1, t_audioCfg[i].varText, 235, 65+i*15-moveTxt,0.85,0.85))
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
		f_sysTimeP()
		if data.attractMode == true then textImgDraw(txt_attractCredits) end
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
function f_pauseSongs()
	if pn == 1 then
		txt_songMenu = createTextImg(jgFnt, 5, 0, "SONG SELECT [P1]", 159, 54)
		txt_song = createTextImg(jgFnt, 0, 0, "FOLDER ".."["..t_songList[songFolder][songMenu].folder.."]", 159, 66)
	elseif pn == 2 then
		txt_songMenu = createTextImg(jgFnt, 1, 0, "SONG SELECT [P2]", 159, 54)
		txt_song = createTextImg(jgFnt, 0, 0, "FOLDER ".."["..t_songList[songFolder][songMenu].folder.."]", 159, 66)
	end
	if delayMenu == 2 then
		if start then
			sndPlay(sysSnd, 100, 2)
			animReset(darkenOut)
			animUpdate(darkenOut)
			pauseMenuActive = false
			bufl = 0
			bufr = 0
		--BACK
		elseif escape or (((pn == 1 and btnPalNo(p1Cmd) > 0) or (pn == 2 and btnPalNo(p2Cmd) > 0)) and songMenu == #t_songList[songFolder]) then
			sndPlay(sysSnd, 100, 2)
			delayMenu = -2
			bufl = 0
			bufr = 0
		end
	end
	if pauseMenuActive == true and delayMenu < 2 then
		delayMenu = delayMenu + 1
	elseif pauseMenuActive == false and delayMenu > 0 then
		delayMenu = delayMenu - 1
		--animUpdate(darkenOut)
	end
	if pauseMenuActive == false and delayMenu == 0 then
		f_pauseMenuReset()
		return
	end
	if pauseMenuActive then
		animDraw(darkenIn)
	else
		animDraw(darkenOut)
	end
	if delayMenu == -1 then f_gameCfgMenuReset2() end
	if delayMenu == 2 then
		if (pn == 1 and commandGetState(p1Cmd, 'u')) or (pn == 1 and (commandGetState(p1Cmd, 'holdu') and Pbufu >= 18)) or (pn == 2 and commandGetState(p2Cmd, 'u')) or (pn == 2 and (commandGetState(p2Cmd, 'holdu') and P2bufu >= 18)) then
			sndPlay(sysSnd, 100, 0)
			songMenu = songMenu - 1
			if bufl then bufl = 0 end
			if bufr then bufr = 0 end
		elseif (pn == 1 and commandGetState(p1Cmd, 'd')) or (pn == 1 and (commandGetState(p1Cmd, 'holdd') and Pbufd >= 18)) or (pn == 2 and commandGetState(p2Cmd, 'd')) or (pn == 2 and (commandGetState(p2Cmd, 'holdd') and P2bufd >= 18)) then
			sndPlay(sysSnd, 100, 0)
			songMenu = songMenu + 1
			if bufl then bufl = 0 end
			if bufr then bufr = 0 end
		elseif (pn == 1 and commandGetState(p1Cmd, 'l')) or (pn == 1 and (commandGetState(p1Cmd, 'holdl') and Pbufl >= 18)) or (pn == 2 and commandGetState(p2Cmd, 'l')) or (pn == 2 and (commandGetState(p2Cmd, 'holdl') and P2bufl >= 18)) then
			sndPlay(sysSnd, 100, 0)
			songFolder = songFolder - 1
			songMenu = 1 --Restart Cursor Values to prevent nil values issues
			cursorPosY = 1
		elseif (pn == 1 and commandGetState(p1Cmd, 'r')) or (pn == 1 and (commandGetState(p1Cmd, 'holdr') and Pbufr >= 18)) or (pn == 2 and commandGetState(p2Cmd, 'r')) or (pn == 2 and (commandGetState(p2Cmd, 'holdr') and P2bufr >= 18)) then
			sndPlay(sysSnd, 100, 0)
			songFolder = songFolder + 1
			songMenu = 1
			cursorPosY = 1
		end
		if (pn == 1 and btnPalNo(p1Cmd) > 0) or (pn == 2 and btnPalNo(p2Cmd) > 0) then
			if songMenu == #t_songList[songFolder]-1 then --Play Random Song from Folder Selected
				randomSongSel = math.random(1, #t_songList[songFolder]-2) --Get random song (-2 excludes back and random select items)
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
		--animDraw(f_animVelocity(pauseBG0, -1, -1))
		animSetScale(pauseBG1, 220, maxSongs*15)
		animSetWindow(pauseBG1, 80,70, 160,105)
		animDraw(pauseBG1)
		--animUpdate(pauseBG1)
		textImgDraw(txt_songMenu)
		textImgDraw(txt_song)
		animSetWindow(cursorBox, 80,55+cursorPosY*15, 160,15)
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
				t_songList[songFolder][i].id = createTextImg(font14, 0, 1, songText, 85, 65+i*15-moveTxt,0.85,0.85)
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
		f_sysTimeP()
		if data.attractMode == true then textImgDraw(txt_attractCredits) end
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
t_trainingCfg = {
	{varID = textImgNew(), text = "Damage Display", 			varText = ""},
	{varID = textImgNew(), text = "Input Display",				varText = ""},
	{varID = textImgNew(), text = "Hitbox Display", 			varText = ""},
	{varID = textImgNew(), text = "Debug Info",					varText = ""},
	{varID = textImgNew(), text = "Lifebar P1",					varText = data.LifeStateP1},
	{varID = textImgNew(), text = "Lifebar P2",					varText = data.LifeStateP2},
	{varID = textImgNew(), text = "Power Gauge P1",				varText = data.PowerStateP1},
	{varID = textImgNew(), text = "Power Gauge P2",				varText = data.PowerStateP2},
	--{varID = textImgNew(), text = "Distance", 				varText = ""},
	--{varID = textImgNew(), text = "Guard Mode", 				varText = ""},
	--{varID = textImgNew(), text = "Tech Recovery", 			varText = ""},
	--{varID = textImgNew(), text = "Tech Direction", 			varText = ""},
	--{varID = textImgNew(), text = "Counter Hit", 				varText = ""},
	{varID = textImgNew(), text = "Playback Settings",			varText = ""},
	{varID = textImgNew(), text = "Dummy Recording Start",		varText = ""},
	{varID = textImgNew(), text = "Dummy Control", 				varText = data.dummyMode},
	{varID = textImgNew(), text = "                   BACK",   	varText = ""},
}

--Battle Info for Replays
if getGameMode() ~= "practice" then --if getGameMode() == "replay" or getGameMode() == "randomtest" then
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
if data.damageDisplay then t_trainingCfg[1].varText = "Yes" else t_trainingCfg[1].varText = "No" end
if data.inputDisplay then t_trainingCfg[2].varText = "Yes" else t_trainingCfg[2].varText = "No" end
if data.hitbox then t_trainingCfg[3].varText = "Yes" else t_trainingCfg[3].varText = "No" end
if data.debugInfo then t_trainingCfg[4].varText = "Yes" else t_trainingCfg[4].varText = "No" end
end

f_trainingCfgdisplayTxt() --Load Display Text

--Training Settings Up Arrow
pauseTUpArrow = animNew(sysSff, [[
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
pauseTDownArrow = animNew(sysSff, [[
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
	if pn == 1 then
		if getGameMode() == "practice" then txt_trainingCfg = createTextImg(jgFnt, 5, 0, "TRAINING SETTINGS [P1]", 159, 63)
		else txt_trainingCfg = createTextImg(jgFnt, 5, 0, "BATTLE INFO [P1]", 159, 63)
		end
	elseif pn == 2 then
		if getGameMode() == "practice" then txt_trainingCfg = createTextImg(jgFnt, 1, 0, "TRAINING SETTINGS [P2]", 159, 63)
		else txt_trainingCfg = createTextImg(jgFnt, 1, 0, "BATTLE INFO [P2]", 159, 63)
		end
	end
	if pauseMode == "Training" or trainingGoTo ~= "" then
		if delayMenu == 2 then
			if start then
				sndPlay(sysSnd, 100, 2)
				animReset(darkenOut)
				animUpdate(darkenOut)
				pauseMenuActive = false
				bufl = 0
				bufr = 0
				if trainingModified then f_saveTraining() end
			--BACK
			elseif escape or (((pn == 1 and btnPalNo(p1Cmd) > 0) or (pn == 2 and btnPalNo(p2Cmd) > 0)) and trainingCfg == #t_trainingCfg) then
				sndPlay(sysSnd, 100, 2)
				delayMenu = -2
				bufl = 0
				bufr = 0
				if trainingModified then f_saveTraining() end
			end
		end
		if pauseMenuActive == true and delayMenu < 2 then
			delayMenu = delayMenu + 1
		elseif pauseMenuActive == false and delayMenu > 0 then
			delayMenu = delayMenu - 1
			--animUpdate(darkenOut)
		end
		if pauseMenuActive == false and delayMenu == 0 then
			f_pauseMenuReset()
			return
		end
		if pauseMenuActive then
			animDraw(darkenIn)
		else
			animDraw(darkenOut)
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
				sndPlay(sysSnd, 100, 0)
				trainingCfg = trainingCfg - 1
				if bufl then bufl = 0 end
				if bufr then bufr = 0 end
				recWarning = false
			elseif (pn == 1 and commandGetState(p1Cmd, 'd')) or (pn == 1 and (commandGetState(p1Cmd, 'holdd') and Pbufd >= 18)) or (pn == 2 and commandGetState(p2Cmd, 'd')) or (pn == 2 and (commandGetState(p2Cmd, 'holdd') and P2bufd >= 18)) then
				sndPlay(sysSnd, 100, 0)
				trainingCfg = trainingCfg + 1
				if bufl then bufl = 0 end
				if bufr then bufr = 0 end
				recWarning = false
			end
			if (pn == 1 and btnPalNo(p1Cmd) > 0) or (pn == 2 and btnPalNo(p2Cmd) > 0) then
				--Start Dummy Recording
				if trainingCfg == 10 then
					if data.dummyMode == "Playback" or data.dummyMode == "CPU" then
						sndPlay(sysSnd, 100, 5)
						recWarning = true
					else
						startDummyRecord(sysSnd)
						pbrecActive = true
						animReset(darkenOut)
						animUpdate(darkenOut)
						pauseMenuActive = false
						bufl = 0
						bufr = 0
						if trainingModified then f_saveTraining() end
					end
				--Playback Settings
				elseif trainingCfg == 9 then
					sndPlay(sysSnd, 100, 1)
					trainingGoTo = "Playback"
					playbackCfg = 1
					cursorPosY = 1
					moveTxt = 0
					delayMenu = -2
				end
			end
			--Common Button Logic
			if trainingCfg >= 1 and trainingCfg < 5 then
				if (pn == 1 and btnPalNo(p1Cmd) > 0) or (pn == 2 and btnPalNo(p2Cmd) > 0) or (pn == 1 and commandGetState(p1Cmd, 'l')) or (pn == 2 and commandGetState(p2Cmd, 'l')) or (pn == 1 and commandGetState(p1Cmd, 'r')) or (pn == 2 and commandGetState(p2Cmd, 'r')) then
					sndPlay(sysSnd, 100, 1)
					--Info Display
					if trainingCfg == 1 then
						if not data.damageDisplay then
							sndPlay(sysSnd, 100, 5)
							--[[
							data.damageDisplay = true
							setDamageDisplay(1)
							]]
						--else
							--[[
							data.damageDisplay = false
							setDamageDisplay(0)
							]]
						end
					--Input Display
					elseif trainingCfg == 2 then
						if not data.inputDisplay then
							data.inputDisplay = true
							setInputDisplay(1)
						else
							data.inputDisplay = false
							setInputDisplay(0)
						end
					--Hitbox Display
					elseif trainingCfg == 3 then
						if not data.hitbox then
							toggleClsnDraw()
							data.hitbox = true
						else
							toggleClsnDraw()
							data.hitbox = false
						end
					--Debug Info Display
					elseif trainingCfg == 4 then
						if not data.debugInfo then
							toggleDebugDraw()
							data.debugInfo = true
						else
							toggleDebugDraw()
							data.debugInfo = false
						end
					end
					hasChanged = true
				end
			--Left Side Life Gauge Setup
			elseif trainingCfg == 5 and getGameMode() == "practice" then
				if ((pn == 1 and commandGetState(p1Cmd, 'r')) or (pn == 2 and commandGetState(p2Cmd, 'l'))) then
					if data.LifeStateP1 == "No Regenerate" then
						sndPlay(sysSnd, 100, 1)
						data.LifeStateP1 = "25%"
						setLifeStateP1(25)
					elseif data.LifeStateP1 == "25%" then
						sndPlay(sysSnd, 100, 1)
						data.LifeStateP1 = "50%"
						setLifeStateP1(50)
					elseif data.LifeStateP1 == "50%" then
						sndPlay(sysSnd, 100, 1)
						data.LifeStateP1 = "75%"
						setLifeStateP1(75)
					elseif data.LifeStateP1 == "75%" then
						sndPlay(sysSnd, 100, 1)
						data.LifeStateP1 = "100%"
						setLifeStateP1(100)
					end
					hasChanged = true
				elseif ((pn == 1 and commandGetState(p1Cmd, 'l')) or (pn == 2 and commandGetState(p2Cmd, 'r'))) then
					if data.LifeStateP1 == "100%" then
						sndPlay(sysSnd, 100, 1)
						data.LifeStateP1 = "75%"
						setLifeStateP1(75)
					elseif data.LifeStateP1 == "75%" then
						sndPlay(sysSnd, 100, 1)
						data.LifeStateP1 = "50%"
						setLifeStateP1(50)
					elseif data.LifeStateP1 == "50%" then
						sndPlay(sysSnd, 100, 1)
						data.LifeStateP1 = "25%"
						setLifeStateP1(25)
					elseif data.LifeStateP1 == "25%" then
						sndPlay(sysSnd, 100, 1)
						data.LifeStateP1 = "No Regenerate"
						setLifeStateP1(0)
					end
					hasChanged = true
				end
			--Right Side Life Gauge Setup
			elseif trainingCfg == 6 then
				if ((pn == 1 and commandGetState(p1Cmd, 'r')) or (pn == 2 and commandGetState(p2Cmd, 'r'))) then
					if data.LifeStateP2 == "No Regenerate" then
						sndPlay(sysSnd, 100, 1)
						data.LifeStateP2 = "25%"
						setLifeStateP2(25)
					elseif data.LifeStateP2 == "25%" then
						sndPlay(sysSnd, 100, 1)
						data.LifeStateP2 = "50%"
						setLifeStateP2(50)
					elseif data.LifeStateP2 == "50%" then
						sndPlay(sysSnd, 100, 1)
						data.LifeStateP2 = "75%"
						setLifeStateP2(75)
					elseif data.LifeStateP2 == "75%" then
						sndPlay(sysSnd, 100, 1)
						data.LifeStateP2 = "100%"
						setLifeStateP2(100)
					end
					hasChanged = true
				elseif ((pn == 1 and commandGetState(p1Cmd, 'l')) or (pn == 2 and commandGetState(p2Cmd, 'l'))) then
					if data.LifeStateP2 == "100%" then
						sndPlay(sysSnd, 100, 1)
						data.LifeStateP2 = "75%"
						setLifeStateP2(75)
					elseif data.LifeStateP2 == "75%" then
						sndPlay(sysSnd, 100, 1)
						data.LifeStateP2 = "50%"
						setLifeStateP2(50)
					elseif data.LifeStateP2 == "50%" then
						sndPlay(sysSnd, 100, 1)
						data.LifeStateP2 = "25%"
						setLifeStateP2(25)
					elseif data.LifeStateP2 == "25%" then
						sndPlay(sysSnd, 100, 1)
						data.LifeStateP2 = "No Regenerate"
						setLifeStateP2(0)
					end
					hasChanged = true
				end
			--Left Side Power Gauge Setup
			elseif trainingCfg == 7 then
				if ((pn == 1 and commandGetState(p1Cmd, 'r')) or (pn == 2 and commandGetState(p2Cmd, 'r'))) then
					if data.PowerStateP1 == "Max at Start" then
						sndPlay(sysSnd, 100, 1)
						setPowerStateP1(10)
						data.PowerStateP1 = "Recovery"
					elseif data.PowerStateP1 == "Recovery" then
						sndPlay(sysSnd, 100, 1)
						setPowerStateP1(0)
						data.PowerStateP1 = "No Recovery"
					elseif data.PowerStateP1 == "No Recovery" then
						sndPlay(sysSnd, 100, 1)
						setPowerStateP1(1)
						data.PowerStateP1 = "Level 1"
					elseif data.PowerStateP1 == "Level 1" then
						sndPlay(sysSnd, 100, 1)
						setPowerStateP1(2)
						data.PowerStateP1 = "Level 2"
					elseif data.PowerStateP1 == "Level 2" then
						sndPlay(sysSnd, 100, 1)
						setPowerStateP1(3)
						data.PowerStateP1 = "Level 3"
					elseif data.PowerStateP1 == "Level 3" then
						sndPlay(sysSnd, 100, 1)
						setPowerStateP1(666)
						data.PowerStateP1 = "Unlimited"
					end
					hasChanged = true
				elseif ((pn == 1 and commandGetState(p1Cmd, 'l')) or (pn == 2 and commandGetState(p2Cmd, 'l'))) then
					if data.PowerStateP1 == "Recovery" then
						sndPlay(sysSnd, 100, 1)
						setPowerStateP1(11)
						data.PowerStateP1 = "Max at Start"
					elseif data.PowerStateP1 == "No Recovery" then
						sndPlay(sysSnd, 100, 1)
						setPowerStateP1(10)
						data.PowerStateP1 = "Recovery"
					elseif data.PowerStateP1 == "Level 1" then
						sndPlay(sysSnd, 100, 1)
						setPowerStateP1(0)
						data.PowerStateP1 = "No Recovery"
					elseif data.PowerStateP1 == "Level 2" then
						sndPlay(sysSnd, 100, 1)
						setPowerStateP1(1)
						data.PowerStateP1 = "Level 1"
					elseif data.PowerStateP1 == "Level 3" then
						sndPlay(sysSnd, 100, 1)
						setPowerStateP1(2)
						data.PowerStateP1 = "Level 2"
					elseif data.PowerStateP1 == "Unlimited" then
						sndPlay(sysSnd, 100, 1)
						setPowerStateP1(3)
						data.PowerStateP1 = "Level 3"
					end
					hasChanged = true
				end
			--Right Side Power Gauge Setup
			elseif trainingCfg == 8 then
				if ((pn == 1 and commandGetState(p1Cmd, 'r')) or (pn == 2 and commandGetState(p2Cmd, 'r'))) then
					if data.PowerStateP2 == "Max at Start" then
						sndPlay(sysSnd, 100, 1)
						setPowerStateP2(10)
						data.PowerStateP2 = "Recovery"
					elseif data.PowerStateP2 == "Recovery" then
						sndPlay(sysSnd, 100, 1)
						setPowerStateP2(0)
						data.PowerStateP2 = "No Recovery"
					elseif data.PowerStateP2 == "No Recovery" then
						sndPlay(sysSnd, 100, 1)
						setPowerStateP2(1)
						data.PowerStateP2 = "Level 1"
					elseif data.PowerStateP2 == "Level 1" then
						sndPlay(sysSnd, 100, 1)
						setPowerStateP2(2)
						data.PowerStateP2 = "Level 2"
					elseif data.PowerStateP2 == "Level 2" then
						sndPlay(sysSnd, 100, 1)
						setPowerStateP2(3)
						data.PowerStateP2 = "Level 3"
					elseif data.PowerStateP2 == "Level 3" then
						sndPlay(sysSnd, 100, 1)
						setPowerStateP2(666)
						data.PowerStateP2 = "Unlimited"
					end
					hasChanged = true
				elseif ((pn == 1 and commandGetState(p1Cmd, 'l')) or (pn == 2 and commandGetState(p2Cmd, 'l'))) then
					if data.PowerStateP2 == "Recovery" then
						sndPlay(sysSnd, 100, 1)
						setPowerStateP2(11)
						data.PowerStateP2 = "Max at Start"
					elseif data.PowerStateP2 == "No Recovery" then
						sndPlay(sysSnd, 100, 1)
						setPowerStateP2(10)
						data.PowerStateP2 = "Recovery"
					elseif data.PowerStateP2 == "Level 1" then
						sndPlay(sysSnd, 100, 1)
						setPowerStateP2(0)
						data.PowerStateP2 = "No Recovery"
					elseif data.PowerStateP2 == "Level 2" then
						sndPlay(sysSnd, 100, 1)
						setPowerStateP2(1)
						data.PowerStateP2 = "Level 1"
					elseif data.PowerStateP2 == "Level 3" then
						sndPlay(sysSnd, 100, 1)
						setPowerStateP2(2)
						data.PowerStateP2 = "Level 2"
					elseif data.PowerStateP2 == "Unlimited" then
						sndPlay(sysSnd, 100, 1)
						setPowerStateP2(3)
						data.PowerStateP2 = "Level 3"
					end
					hasChanged = true
				end
			--[[
			--Dummy Distance
			elseif trainingCfg == ??? then
				
			--Dummy Guard
			elseif trainingCfg == ??? then
				
			--Dummy Tech
			elseif trainingCfg == ??? then
				
			--Dummy Tech Direction
			elseif trainingCfg == ??? then
				
			--Dummy Counter Hit
			elseif trainingCfg == ??? then
				
			]]
			--Dummy Control
			elseif trainingCfg == 11 then
				if ((pn == 1 and commandGetState(p1Cmd, 'r')) or (pn == 2 and commandGetState(p2Cmd, 'r'))) then
					if data.dummyMode == "CPU" then
						sndPlay(sysSnd, 100, 1)
						toggleAI(2)
						data.dummyMode = "Manual"
					elseif data.dummyMode == "Manual" then
						--sndPlay(sysSnd, 100, 1)
						data.dummyMode = "Playback"
						playDummyRecord(sysSnd)
					end
				elseif ((pn == 1 and commandGetState(p1Cmd, 'l')) or (pn == 2 and commandGetState(p2Cmd, 'l'))) then
					if data.dummyMode == "Playback" then
						--sndPlay(sysSnd, 100, 1)
						data.dummyMode = "Manual"
						endDummyPlayback(sysSnd)
					elseif data.dummyMode == "Manual" then
						sndPlay(sysSnd, 100, 1)
						toggleAI(2)
						data.dummyMode = "CPU"
					end
				end
				hasChanged = true
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
				if not trainingModified then trainingModified = true end
				f_trainingCfgdisplayTxt()
				if getGameMode() == "practice" then t_trainingCfg[5].varText = data.LifeStateP1 end --To don't display in battle info menu
				t_trainingCfg[6].varText = data.LifeStateP2
				t_trainingCfg[7].varText = data.PowerStateP1
				t_trainingCfg[8].varText = data.PowerStateP2
				t_trainingCfg[11].varText = data.dummyMode
				hasChanged = false
			end
			--animDraw(f_animVelocity(pauseBG0, -1, -1))
			animSetScale(pauseBG1, 240, maxtrainingCfg*15)
			animSetWindow(pauseBG1, 55,70, 240,105)
			animDraw(pauseBG1)
			--animUpdate(pauseBG1)
			textImgDraw(txt_trainingCfg)
			if recWarning then
				textImgSetText(txt_playbackInfo, 'Set Dummy Control as "Manual" to Record Actions.')
				textImgDraw(txt_playbackInfo)
			end
			animSetWindow(cursorBox, 55,55+cursorPosY*15, 205,15)
			f_dynamicAlpha(cursorBox, 60,100,5, 255,255,0)
			animDraw(f_animVelocity(cursorBox, -1, -1))
			for i=1, maxtrainingCfg do
				if i > trainingCfg - cursorPosY then
					if t_trainingCfg[i].varID ~= nil then
						textImgDraw(f_updateTextImg(t_trainingCfg[i].varID, font14, 0, 1, t_trainingCfg[i].text, 60, 65+i*15-moveTxt,0.85,0.85))
						textImgDraw(f_updateTextImg(t_trainingCfg[i].varID, font14, 0, -1, t_trainingCfg[i].varText, 257, 65+i*15-moveTxt,0.85,0.85))
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
			f_sysTimeP()
			if data.attractMode == true then textImgDraw(txt_attractCredits) end
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
	elseif pauseMode == "Playback" then
		f_pausePlayback()
	end
end

--;===========================================================
--; PLAYBACK SETTINGS
--;===========================================================
txt_playbackInfo = createTextImg(jgFnt, 5, 0, "", 159, 210, 0.7, 0.7)
txt_pbRecord = "Select Slot to Record Dummy Actions."
txt_pbPlay = "Select Slot to Playback Recorded Dummy Actions."
txt_pbSlots = "Toggle inclusion in Random, All, and Random All."
txt_pbWarning = "At least one slot has to be included."
txt_pbIncludeSlot = "Include"
txt_pbExcludeSlot = "Exclude"

t_playbackCfg = {
	{varID = textImgNew(), text = "Recording Slot",   		 varText = data.pbkRecSlot},
	{varID = textImgNew(), text = "Playback Slot",      	 varText = ""},
	--{varID = textImgNew(), text = "Playback Type",      	 varText = ""},
	{varID = textImgNew(), text = "Slot 1",   				 varText = ""},
	{varID = textImgNew(), text = "Slot 2",   				 varText = ""},
	{varID = textImgNew(), text = "Slot 3",   				 varText = ""},
	{varID = textImgNew(), text = "Slot 4",   				 varText = ""},
	{varID = textImgNew(), text = "Slot 5",   				 varText = ""},
	{varID = textImgNew(), text = "                   BACK", varText = ""},
}

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
		sndPlay(sysSnd, 100, 5)
	else
		pbWarning = false
	end
end

function f_pausePlayback()
	local hasChanged = false
	if pn == 1 then txt_playbackCfg = createTextImg(jgFnt, 5, 0, "PLAYBACK SETTINGS [P1]", 159, 63)
	elseif pn == 2 then txt_playbackCfg = createTextImg(jgFnt, 1, 0, "PLAYBACK SETTINGS [P2]", 159, 63)
	end
	if delayMenu == 2 then
		if start then
			sndPlay(sysSnd, 100, 2)
			animReset(darkenOut)
			animUpdate(darkenOut)
			pauseMenuActive = false
			bufl = 0
			bufr = 0
			if modified then f_saveTraining() end
		--BACK
		elseif escape or (((pn == 1 and btnPalNo(p1Cmd) > 0) or (pn == 2 and btnPalNo(p2Cmd) > 0)) and playbackCfg == #t_playbackCfg) then
			sndPlay(sysSnd, 100, 2)
			delayMenu = -2
			if modified then f_saveTraining() end
			bufl = 0
			bufr = 0
		end
	end
	if pauseMenuActive == true and delayMenu < 2 then
		delayMenu = delayMenu + 1
	elseif pauseMenuActive == false and delayMenu > 0 then
		delayMenu = delayMenu - 1
		--animUpdate(darkenOut)
	end
	if pauseMenuActive == false and delayMenu == 0 then
		f_pauseMenuReset()
		return
	end
	if pauseMenuActive then
		animDraw(darkenIn)
	else
		animDraw(darkenOut)
	end
	if delayMenu == -1 then f_trainingCfgMenuReset2() end
	if delayMenu == 2 then
		if (pn == 1 and commandGetState(p1Cmd, 'u')) or (pn == 1 and (commandGetState(p1Cmd, 'holdu') and Pbufu >= 18)) or (pn == 2 and commandGetState(p2Cmd, 'u')) or (pn == 2 and (commandGetState(p2Cmd, 'holdu') and P2bufu >= 18)) then
			sndPlay(sysSnd, 100, 0)
			playbackCfg = playbackCfg - 1
			if bufl then bufl = 0 end
			if bufr then bufr = 0 end
			pbWarning = false
		elseif (pn == 1 and commandGetState(p1Cmd, 'd')) or (pn == 1 and (commandGetState(p1Cmd, 'holdd') and Pbufd >= 18)) or (pn == 2 and commandGetState(p2Cmd, 'd')) or (pn == 2 and (commandGetState(p2Cmd, 'holdd') and P2bufd >= 18)) then
			sndPlay(sysSnd, 100, 0)
			playbackCfg = playbackCfg + 1
			if bufl then bufl = 0 end
			if bufr then bufr = 0 end
			pbWarning = false
		end
		--Recording Slot
		if playbackCfg == 1 then
			if ((pn == 1 and commandGetState(p1Cmd, 'l')) or (pn == 2 and commandGetState(p2Cmd, 'l'))) then
				if data.pbkRecSlot > 1 then
					sndPlay(sysSnd, 100, 1)
					data.pbkRecSlot = data.pbkRecSlot - 1
					hasChanged = true
				end
			elseif ((pn == 1 and commandGetState(p1Cmd, 'r')) or (pn == 2 and commandGetState(p2Cmd, 'r'))) then
				if data.pbkRecSlot < 5 then
					sndPlay(sysSnd, 100, 1)
					data.pbkRecSlot = data.pbkRecSlot + 1
					hasChanged = true
				end
			end
		--Playback Slot
		elseif playbackCfg == 2 then
			if ((pn == 1 and commandGetState(p1Cmd, 'l')) or (pn == 2 and commandGetState(p2Cmd, 'l'))) then
				if data.pbkPlaySlot > 1 then
					sndPlay(sysSnd, 100, 1)
					data.pbkPlaySlot = data.pbkPlaySlot - 1
					hasChanged = true
				end
			elseif ((pn == 1 and commandGetState(p1Cmd, 'r')) or (pn == 2 and commandGetState(p2Cmd, 'r'))) then
				if data.pbkPlaySlot < 8 then
					sndPlay(sysSnd, 100, 1)
					data.pbkPlaySlot = data.pbkPlaySlot + 1
					hasChanged = true
				end
			end
		--Common Button Logic
		elseif playbackCfg >= 3 and playbackCfg < 8 then
			if (pn == 1 and btnPalNo(p1Cmd) > 0) or (pn == 2 and btnPalNo(p2Cmd) > 0) or (pn == 1 and commandGetState(p1Cmd, 'l')) or (pn == 2 and commandGetState(p2Cmd, 'l')) or (pn == 1 and commandGetState(p1Cmd, 'r')) or (pn == 2 and commandGetState(p2Cmd, 'r')) then
				sndPlay(sysSnd, 100, 1)
				--Playback Type
				--if playbackCfg == 3 then
					--if data.pbkPlayLoop then data.pbkPlayLoop = false else data.pbkPlayLoop = true end
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
		--animDraw(f_animVelocity(pauseBG0, -1, -1))
		animSetScale(pauseBG1, 240, maxPlaybackCfg*15)
		animSetWindow(pauseBG1, 55,70, 240,105)
		animDraw(pauseBG1)
		--animUpdate(pauseBG1)
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
		animSetWindow(cursorBox, 55,55+cursorPosY*15, 205,15)
		f_dynamicAlpha(cursorBox, 60,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		if hasChanged then
			if not modified then modified = true end
			t_playbackCfg[1].varText = data.pbkRecSlot
			f_pbkdisplayTxt()
			hasChanged = false
		end
		for i=1, maxPlaybackCfg do
			if i > playbackCfg - cursorPosY then
				if t_playbackCfg[i].varID ~= nil then
					textImgDraw(f_updateTextImg(t_playbackCfg[i].varID, font14, 0, 1, t_playbackCfg[i].text, 60, 65+i*15-moveTxt,0.85,0.85))
					textImgDraw(f_updateTextImg(t_playbackCfg[i].varID, font14, 0, -1, t_playbackCfg[i].varText, 257, 65+i*15-moveTxt,0.85,0.85))
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
		f_sysTimeP()
		if data.attractMode == true then textImgDraw(txt_attractCredits) end
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