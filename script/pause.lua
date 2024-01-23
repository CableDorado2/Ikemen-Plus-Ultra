module(..., package.seeall)

--;===========================================================
--; LOAD DATA
--;===========================================================
--Data loading from config.ssz
local file = io.open("ssz/config.ssz","r")
s_configSSZ = file:read("*all")
file:close()
gl_vol = math.floor(tonumber(s_configSSZ:match('const float GlVol%s*=%s*(%d%.*%d*)') * 100))
se_vol = math.floor(tonumber(s_configSSZ:match('const float SEVol%s*=%s*(%d%.*%d*)') * 100))
bgm_vol = math.floor(tonumber(s_configSSZ:match('const float BGMVol%s*=%s*(%d%.*%d*)') * 100))
pan_str = math.floor(tonumber(s_configSSZ:match('const float PanStr%s*=%s*(%d%.*%d*)') * 100))
resolutionWidth = tonumber(s_configSSZ:match('const int Width%s*=%s*(%d+)'))
resolutionHeight = tonumber(s_configSSZ:match('const int Height%s*=%s*(%d+)'))

function f_sysTimeP()
	if (resolutionHeight / 3 * 4) == resolutionWidth then
		--Clock
		if data.clock == 'Standard' then
			txt_titleClock = createTextImg(font12, 0, -1, (os.date("%I:%M%p")), 314, 229)
		elseif data.clock == 'Full Standard' then
			txt_titleClock = createTextImg(font12, 0, -1, (os.date("%I:%M%p:%S")), 314, 229)
		elseif data.clock == 'Military' then
			txt_titleClock = createTextImg(font12, 0, -1, (os.date("%H:%M")), 314, 229)
		elseif data.clock == 'Full Military' then
			txt_titleClock = createTextImg(font12, 0, -1, (os.date("%X")), 314, 229)
		end
		--Date
		if data.date == 'Type A' then
			txt_titleDate = createTextImg(font12, 0, -1, (os.date("%m-%d-%y")), 314, 239)
		elseif data.date == 'Type B' then
			txt_titleDate = createTextImg(font12, 0, -1, (os.date("%d-%m-%Y")), 314, 239)
		elseif data.date == 'Type C' then
			txt_titleDate = createTextImg(font12, 0, -1, (os.date("%a %d.%b.%Y")), 314, 239)
		elseif data.date == 'Type D' then
			txt_titleDate = createTextImg(font12, 0, -1, (os.date("%A")), 314, 239)
		elseif data.date == 'Type E' then
			txt_titleDate = createTextImg(font12, 0, -1, (os.date("%B.%Y")), 314, 239)
		end
	elseif (resolutionHeight / 10 * 16) == resolutionWidth then
		if data.clock == 'Standard' then
			txt_titleClock = createTextImg(font12, 0, -1, (os.date("%I:%M%p")), 345, 229)
		elseif data.clock == 'Full Standard' then
			txt_titleClock = createTextImg(font12, 0, -1, (os.date("%I:%M%p:%S")), 345, 229)
		elseif data.clock == 'Military' then
			txt_titleClock = createTextImg(font12, 0, -1, (os.date("%H:%M")), 345, 229)
		elseif data.clock == 'Full Military' then
			txt_titleClock = createTextImg(font12, 0, -1, (os.date("%X")), 345, 229)
		end
		if data.date == 'Type A' then
			txt_titleDate = createTextImg(font12, 0, -1, (os.date("%m-%d-%y")), 345, 239)
		elseif data.date == 'Type B' then
			txt_titleDate = createTextImg(font12, 0, -1, (os.date("%d-%m-%Y")), 345, 239)
		elseif data.date == 'Type C' then
			txt_titleDate = createTextImg(font12, 0, -1, (os.date("%a %d.%b.%Y")), 345, 239)
		elseif data.date == 'Type D' then
			txt_titleDate = createTextImg(font12, 0, -1, (os.date("%A")), 345, 239)
		elseif data.date == 'Type E' then
			txt_titleDate = createTextImg(font12, 0, -1, (os.date("%B.%Y")), 345, 239)
		end
	elseif (math.floor((resolutionHeight / 9 * 16) + 0.5)) == resolutionWidth then
		if data.clock == 'Standard' then
			txt_titleClock = createTextImg(font12, 0, -1, (os.date("%I:%M%p")), 365, 229)
		elseif data.clock == 'Full Standard' then
			txt_titleClock = createTextImg(font12, 0, -1, (os.date("%I:%M%p:%S")), 365, 229)
		elseif data.clock == 'Military' then
			txt_titleClock = createTextImg(font12, 0, -1, (os.date("%H:%M")), 365, 229)
		elseif data.clock == 'Full Military' then
			txt_titleClock = createTextImg(font12, 0, -1, (os.date("%X")), 365, 229)
		end
		if data.date == 'Type A' then
			txt_titleDate = createTextImg(font12, 0, -1, (os.date("%m-%d-%y")), 365, 239)
		elseif data.date == 'Type B' then
			txt_titleDate = createTextImg(font12, 0, -1, (os.date("%d-%m-%Y")), 365, 239)
		elseif data.date == 'Type C' then
			txt_titleDate = createTextImg(font12, 0, -1, (os.date("%a %d.%b.%Y")), 365, 239)
		elseif data.date == 'Type D' then
			txt_titleDate = createTextImg(font12, 0, -1, (os.date("%A")), 365, 239)
		elseif data.date == 'Type E' then
			txt_titleDate = createTextImg(font12, 0, -1, (os.date("%B.%Y")), 365, 239)
		end
	else
		if data.clock == 'Standard' then
			txt_titleClock = createTextImg(font12, 0, -1, (os.date("%I:%M%p")), 345, 229)
		elseif data.clock == 'Full Standard' then
			txt_titleClock = createTextImg(font12, 0, -1, (os.date("%I:%M%p:%S")), 345, 229)
		elseif data.clock == 'Military' then
			txt_titleClock = createTextImg(font12, 0, -1, (os.date("%H:%M")), 345, 229)
		elseif data.clock == 'Full Military' then
			txt_titleClock = createTextImg(font12, 0, -1, (os.date("%X")), 345, 229)
		end
		if data.date == 'Type A' then
			txt_titleDate = createTextImg(font12, 0, -1, (os.date("%m-%d-%y")), 345, 239)
		elseif data.date == 'Type B' then
			txt_titleDate = createTextImg(font12, 0, -1, (os.date("%d-%m-%Y")), 345, 239)
		elseif data.date == 'Type C' then
			txt_titleDate = createTextImg(font12, 0, -1, (os.date("%a %d.%b.%Y")), 345, 239)
		elseif data.date == 'Type D' then
			txt_titleDate = createTextImg(font12, 0, -1, (os.date("%A")), 345, 239)
		elseif data.date == 'Type E' then
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
t_panStr = {'None', 'Narrow', 'Medium', 'Wide', 'Full'}

--Data saving to config.ssz
function f_saveCfg()
	s_configSSZ = s_configSSZ:gsub('const float GlVol%s*=%s*%d%.*%d*', 'const float GlVol = ' .. gl_vol / 100)
	s_configSSZ = s_configSSZ:gsub('const float SEVol%s*=%s*%d%.*%d*', 'const float SEVol = ' .. se_vol / 100)
	s_configSSZ = s_configSSZ:gsub('const float BGMVol%s*=%s*%d%.*%d*', 'const float BGMVol = ' .. bgm_vol / 100)
	s_configSSZ = s_configSSZ:gsub('const float PanStr%s*=%s*%d%.*%d*', 'const float PanStr = ' .. pan_str / 100)
	local file = io.open("ssz/config.ssz","w+")
	file:write(s_configSSZ)
	file:close()
	modified = false
	configModified('true')
end

--;===========================================================
--; LOAD TEMP DATA (JUST WHILE FOUND A BETTER WAY TO BACK)
--;===========================================================
local tempFile = io.open("save/temp_sav.lua","r")
s_tempdataLUA = tempFile:read("*all")
tempFile:close()

function f_saveTemp()
	local t_temp = {['data.tempBack'] = data.tempBack,['data.replayDone'] = data.replayDone}
	s_tempdataLUA = f_strSub(s_tempdataLUA, t_temp)
	local tempFile = io.open("save/temp_sav.lua","w+")
	tempFile:write(s_tempdataLUA)
	tempFile:close()
end

--;===========================================================
--; PAUSE MENU SCREENPACK
--;===========================================================
txt_attractCredits = createTextImg(font1, 0, -1, 'Credits: '..data.attractCoins..'', 181.5, 235)

--Scrolling background
pauseBG0 = animNew(sysSff, [[
100,0, 0,0, -1
]])
animAddPos(pauseBG0, 160, 0)
animSetTile(pauseBG0, 1, 1)
animSetColorKey(pauseBG0, -1)

--Transparent Background (fade in)
darkenIn = animNew(sysSff, [[
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
animSetPos(darkenIn, -54, 0)
animSetScale(darkenIn, 427, 240)

--Transparent Background (fade out)
darkenOut = animNew(sysSff, [[
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
animSetPos(darkenOut, -54, 0)
animSetScale(darkenOut, 427, 240)

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

--;===========================================================
--; PAUSE MENU
--;===========================================================
t_pauseMain = {
	{id = '', text = 'CONTINUE'},
	{id = '', text = 'MOVELIST'},
	{id = '', text = 'SETTINGS'},
	{id = '', text = 'HIDE MENU'},
	{id = '', text = 'GIVE UP'},
	{id = '', text = 'MAIN MENU'}
}
if getGameMode() == "practice" or getGameMode() == "vs" or getGameMode() == "story" or getGameMode() == "storyRoster" then
	t_pauseMain[5].text = 'CHARACTER SELECT'
	if getGameMode() == "practice" then
		table.insert(t_pauseMain,7,{id = '', text = 'TRAINING MENU'})
	elseif getGameMode() == "story" or getGameMode() == "storyRoster" then
		t_pauseMain[6].text = 'STORY SELECT'
	end
elseif getGameMode() == "stageviewer" then t_pauseMain[5].text = 'STAGE SELECT'
elseif getGameMode() == "mission" then t_pauseMain[6].text = 'MISSION SELECT'
elseif getGameMode() == "event" then t_pauseMain[6].text = 'EVENT SELECT'
elseif getGameMode() == "random" then table.remove(t_pauseMain,6)
elseif getGameMode() == "replay" or getGameMode() == "demo" then
	table.remove(t_pauseMain,6)
	table.remove(t_pauseMain,2)
	t_pauseMain[4].text = 'EXIT'
end

pauseMenuActive = false
mainMenuBack = false
rectScale = -1
pauseMode = ''
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
data.p2In = 2 --Player 2 Can Control
hudStatus = 'Yes'
hitboxStatus = 'No'
debugStatus = 'No'
dummyMode = 'AI'

function f_pauseMenuReset()
	togglePauseMenu(0)
	setSysCtrl(0)
	rectScale = -1
	pauseMode = ''
	bufl = 0
	bufr = 0
end

function f_gameCfgMenuReset()
	gameCfg = 1
	cursorPosY = 1
	moveTxt = 0
	mainGoTo = 'Settings'
	rectScale = -10
end

function f_gameCfgMenuReset2()
	pauseMode = 'Settings'
	gameCfg = 1
	cursorPosY = 1
	moveTxt = 0
	rectScale = 0
end

function f_confirmReset()
	mainMenuBack = false
	confirmScreen = false
	moveTxtConfirm = 0
	--Cursor pos in NO
	cursorPosYConfirm = 1
	confirmPause = 2
end

function f_pauseMain(p, st, esc)
	pn = p
	escape = esc
	start = st
	if data.pauseMode == 'No' then --Mugen Exit Type
		if getGameMode() == "replay" then
			data.replayDone = true
			data.tempBack = true
			f_saveTemp()
		end
		exitMatch()
	end
	if pauseMenuActive == false and rectScale == -1 then
		animReset(darkenIn)
		animUpdate(darkenIn)
		pauseMenuActive = true
		sndPlay(sysSnd, 100, 1)
		rectScale = 0
	end
	cmdInput()
	if pauseMode == '' or mainGoTo ~= '' then
		if pn == 1 then txt_pause = createTextImg(jgFnt, 5, 0, 'PAUSE [P1]', 159, 63)
		elseif pn == 2 then txt_pause = createTextImg(jgFnt, 1, 0, 'PAUSE [P2]', 159, 63)
		end
		--HIDE MENU
		if getGameMode() == "replay" or getGameMode() == "demo" then
			if ((pn == 1 and btnPalNo(p1Cmd) > 0) or (pn == 2 and btnPalNo(p2Cmd) > 0)) and pauseMenu == 3 then hide = true end
		else
			if ((pn == 1 and btnPalNo(p1Cmd) > 0) or (pn == 2 and btnPalNo(p2Cmd) > 0)) and pauseMenu == 4 then hide = true end
		end
		--RESUME GAME
		if (escape or start or (((pn == 1 and btnPalNo(p1Cmd) > 0) or (pn == 2 and btnPalNo(p2Cmd) > 0)) and (pauseMenu == 1 or hide))) and rectScale == 10 then
			sndPlay(sysSnd, 100, 2)
			animReset(darkenOut)
			animUpdate(darkenOut)
			pauseMenuActive = false
		end
		if pauseMenuActive == true and rectScale < 10 then
			rectScale = rectScale + 1
			animUpdate(darkenIn)
		elseif pauseMenuActive == false and rectScale > 0 then
			rectScale = rectScale - 1
			animUpdate(darkenOut)
		end
		if pauseMenuActive == false and rectScale == 0 then
			togglePauseMenu(0)
			if hide then
				togglePause()
				hide = false
			end
			setSysCtrl(0)
			rectScale = -1
			return
		end
		if pauseMenuActive then
			animDraw(darkenIn)
		else
			animDraw(darkenOut)
		end
		if rectScale == -1 and mainGoTo ~= '' then
			rectScale = 0
			pauseMode = mainGoTo
			mainGoTo = ''
		end
		if rectScale == 10 then
			setSysCtrl(10)
			if (pn == 1 and commandGetState(p1Cmd, 'u')) or (pn == 1 and (commandGetState(p1Cmd, 'holdu') and Pbufu >= 18)) or (pn == 2 and commandGetState(p2Cmd, 'u')) or (pn == 2 and (commandGetState(p2Cmd, 'holdu') and P2bufu >= 18)) then
				sndPlay(sysSnd, 100, 0)
				pauseMenu = pauseMenu - 1
			elseif (pn == 1 and commandGetState(p1Cmd, 'd')) or (pn == 1 and (commandGetState(p1Cmd, 'holdd') and Pbufd >= 18)) or (pn == 2 and commandGetState(p2Cmd, 'd')) or (pn == 2 and (commandGetState(p2Cmd, 'holdd') and P2bufd >= 18)) then
				sndPlay(sysSnd, 100, 0)
				pauseMenu = pauseMenu + 1
			end
			if data.pauseMode == 'Yes' then
				--Actions in Demo or Replay Modes
				if getGameMode() == "replay" or getGameMode() == "demo" then
					if (pn == 1 and btnPalNo(p1Cmd) > 0) or (pn == 2 and btnPalNo(p2Cmd) > 0) then
						--SETTINGS
						if pauseMenu == 2 then
							sndPlay(sysSnd, 100, 1)
							f_gameCfgMenuReset()
						--EXIT
						elseif pauseMenu == 4 then
							sndPlay(sysSnd, 100, 1)
							f_confirmReset()
							mainGoTo = 'Confirm'
							if getGameMode() == "replay" then
								mainMenuBack = true
								data.replayDone = true
							end
							rectScale = -10
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
							else
								sndPlay(sysSnd, 100, 1)
								f_confirmReset()
								mainGoTo = 'Confirm'
								rectScale = -10
							end
						--EXIT TO MAIN MENU
						elseif pauseMenu == 6 then
							sndPlay(sysSnd, 100, 1)
							f_confirmReset()
							mainGoTo = 'Confirm'
							mainMenuBack = true
							rectScale = -10
						--TRAINING SETTINGS
						elseif pauseMenu == 7 then
							sndPlay(sysSnd, 100, 1)
							trainingCfg = 1
							cursorPosY = 1
							moveTxt = 0
							mainGoTo = 'Training'
							rectScale = -10
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
	elseif pauseMode == 'Settings' or pauseMode == 'Audio' or pauseMode == 'Songs' then
		f_pauseSettings()
	elseif pauseMode == 'Training' then
		f_pauseTraining()
	elseif pauseMode == 'Confirm' then
		f_pauseConfirm()
	end
end

--;===========================================================
--; PAUSE CONFIRM MESSAGE
--;===========================================================
txt_pauseQuestion = createTextImg(font14, 0, 0, '', 160, 70,0.7,0.7)
txt_pauseConfirm = createTextImg(jgFnt, 1, 0, 'ARE YOU SURE?', 160, 90)

--Confirm Window BG
confirmPauseBG = animNew(sysSff, [[
230,1, 0,0,
]])
animSetPos(confirmPauseBG, 83.5, 77)
animUpdate(confirmPauseBG)
animSetScale(confirmPauseBG, 1, 1)

t_confirmPause = {
	{id = textImgNew(), text = 'YES'},
	{id = textImgNew(), text = 'NO'},
}

function f_pauseConfirm()
	--MESSAGES FOR BACK TO A MAIN MENU
	if mainMenuBack == true then
		if pn == 1 then
			if getGameMode() == "mission" then textImgSetText(txt_pauseQuestion, '[PLAYER 1] WILL BACK TO MISSION SELECT')
			elseif getGameMode() == "event" then textImgSetText(txt_pauseQuestion, '[PLAYER 1] WILL BACK TO EVENT SELECT')
			elseif getGameMode() == "replay" then textImgSetText(txt_pauseQuestion, '[PLAYER 1] WILL BACK TO REPLAY SELECT')
			elseif getGameMode() == "story" or getGameMode() == "storyRoster" then textImgSetText(txt_pauseQuestion, '[PLAYER 1] WILL BACK TO STORY SELECT')
			else textImgSetText(txt_pauseQuestion, '[PLAYER 1] WILL BACK TO MAIN MENU')
			end
		elseif pn == 2 then
			if getGameMode() == "mission" then textImgSetText(txt_pauseQuestion, '[PLAYER 2] WILL BACK TO MISSION SELECT')
			elseif getGameMode() == "event" then textImgSetText(txt_pauseQuestion, '[PLAYER 2] WILL BACK TO EVENT SELECT')
			elseif getGameMode() == "replay" then textImgSetText(txt_pauseQuestion, '[PLAYER 2] WILL BACK TO REPLAY SELECT')
			elseif getGameMode() == "story" or getGameMode() == "storyRoster" then textImgSetText(txt_pauseQuestion, '[PLAYER 2] WILL BACK TO STORY SELECT')
			else textImgSetText(txt_pauseQuestion, '[PLAYER 2] WILL BACK TO MAIN MENU')
			end
		end
	--MESSAGES FOR BACK TO A CHARACTER SELECT
	elseif mainMenuBack == false then
		if pn == 1 then
			if getGameMode() == "vs" or getGameMode() == "practice" or getGameMode() == "storyRoster" then textImgSetText(txt_pauseQuestion, '[PLAYER 1] WILL BACK TO CHARACTER SELECT')
			elseif getGameMode() == "stageviewer" then textImgSetText(txt_pauseQuestion, '[PLAYER 1] WILL BACK TO STAGE SELECT')
			elseif getGameMode() == "replay" then textImgSetText(txt_pauseQuestion, '[PLAYER 1] WILL BACK TO REPLAY SELECT')
			elseif getGameMode() == "demo" or getGameMode() == "random" then textImgSetText(txt_pauseQuestion, '[PLAYER 1] WILL BACK TO MAIN MENU')
			else textImgSetText(txt_pauseQuestion, '[PLAYER 1] WILL LEAVE THIS MATCH')
			end
		elseif pn == 2 then
			if getGameMode() == "vs" or getGameMode() == "practice" or getGameMode() == "storyRoster" then textImgSetText(txt_pauseQuestion, '[PLAYER 2] WILL BACK TO CHARACTER SELECT')
			elseif getGameMode() == "stageviewer" then textImgSetText(txt_pauseQuestion, '[PLAYER 2] WILL BACK TO STAGE SELECT')
			elseif getGameMode() == "replay" then textImgSetText(txt_pauseQuestion, '[PLAYER 2] WILL BACK TO REPLAY SELECT')
			elseif getGameMode() == "demo" or getGameMode() == "random" then textImgSetText(txt_pauseQuestion, '[PLAYER 2] WILL BACK TO MAIN MENU')
			else textImgSetText(txt_pauseQuestion, '[PLAYER 2] WILL LEAVE THIS MATCH')
			end
		end
	end
	if pauseMode == 'Confirm' or okGoTo ~= '' then
		if rectScale == 10 then
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
				rectScale = -10
				bufl = 0
				bufr = 0
			end
		end
		if pauseMenuActive == true and rectScale < 10 then
			rectScale = rectScale + 1
		elseif pauseMenuActive == false and rectScale > 0 then
			rectScale = rectScale - 1
			animUpdate(darkenOut)
		end
		if pauseMenuActive == false and rectScale == 0 then
			f_pauseMenuReset()
			return
		end
		if pauseMenuActive then
			animDraw(darkenIn)
		else
			animDraw(darkenOut)
		end
		if rectScale == -1 then
			if okGoTo == nil or okGoTo == '' then
				pauseMode = ''
			else
				pauseMode = okGoTo
				okGoTo = ''
			end
			rectScale = 0
		end
		if rectScale == 10 then
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
					if hudStatus == 'No' then toggleStatusDraw() end
					if hitboxStatus == 'Yes' then toggleClsnDraw() end
					if debugStatus == 'Yes' then toggleDebugDraw() end
					data.tempBack = true
					f_saveTemp()
					exitMatch()
				end
			--BACK TO CHARACTER SELECT
			elseif mainMenuBack == false then
				if ((pn == 1 and btnPalNo(p1Cmd) > 0) or (pn == 2 and btnPalNo(p2Cmd) > 0)) and confirmPause == 1 then
					sndPlay(sysSnd, 100, 1)
					if hudStatus == 'No' then toggleStatusDraw() end
					if hitboxStatus == 'Yes' then toggleClsnDraw() end
					if debugStatus == 'Yes' then toggleDebugDraw() end
					exitMatch()
				end
			end
		end
	--elseif pauseMode == 'Save' then
		--f_pauseSave()
	end
end

--;===========================================================
--; GAME SETTINGS
--;===========================================================
t_gameCfg = {
	{id = '', text = 'Audio Settings',   		varID = textImgNew(), varText = ''},
	{id = '', text = 'Input Settings',   		varID = textImgNew(), varText = ''},
	{id = '', text = 'Show HUD', 				varID = textImgNew(), varText = ''},
	{id = '', text = 'Change Stage Song',		varID = textImgNew(), varText = ''},
	{id = '', text = '              BACK',   	varID = textImgNew(), varText = ''},
}

if getGameMode() ~= "practice" and getGameMode() ~= "vs" and getGameMode() ~= "replay" and getGameMode() ~= "demo" then table.remove(t_gameCfg,4) end

function f_pauseSettings()
	if pn == 1 then txt_gameCfg = createTextImg(jgFnt, 5, 0, 'GAME SETTINGS [P1]', 159, 63)
	elseif pn == 2 then txt_gameCfg = createTextImg(jgFnt, 1, 0, 'GAME SETTINGS [P2]', 159, 63)
	end
	if pauseMode == 'Settings' or cfgGoTo ~= '' then
		if rectScale == 10 then
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
				rectScale = -10
				bufl = 0
				bufr = 0
			end
		end
		if pauseMenuActive == true and rectScale < 10 then
			rectScale = rectScale + 1
		elseif pauseMenuActive == false and rectScale > 0 then
			rectScale = rectScale - 1
			animUpdate(darkenOut)
		end
		if pauseMenuActive == false and rectScale == 0 then
			f_pauseMenuReset()
			return
		end
		if pauseMenuActive then
			animDraw(darkenIn)
		else
			animDraw(darkenOut)
		end
		if rectScale == -1 then
			if cfgGoTo == nil or cfgGoTo == '' then
				pauseMode = ''
			else
				pauseMode = cfgGoTo
				cfgGoTo = ''
			end
			rectScale = 0
		end
		if rectScale == 10 then
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
					cfgGoTo = 'Audio'
					audioCfg = 1
					cursorPosY = 1
					moveTxt = 0
					rectScale = -10
				--Input Settings
				elseif gameCfg == 2 then
					sndPlay(sysSnd, 100, 5)
				--Play/Change Song
				elseif gameCfg == 4 then
					sndPlay(sysSnd, 100, 1)
					cfgGoTo = 'Songs'
					songMenu = 1
					cursorPosY = 1
					moveTxt = 0
					f_soundPage1()
					rectScale = -10
				end
			end
			--HUD Status
			if gameCfg == 3 then
				if ((pn == 1 and commandGetState(p1Cmd, 'r')) or (pn == 2 and commandGetState(p2Cmd, 'r'))) and hudStatus == 'No' then
					sndPlay(sysSnd, 100, 1)
					toggleStatusDraw()
					hudStatus = 'Yes'
				elseif ((pn == 1 and commandGetState(p1Cmd, 'l')) or (pn == 2 and commandGetState(p2Cmd, 'l'))) and hudStatus == 'Yes' then
					sndPlay(sysSnd, 100, 1)
					toggleStatusDraw()
					hudStatus = 'No'
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
			t_gameCfg[3].varText = hudStatus
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
	elseif pauseMode == 'Audio' then
		f_pauseAudio()
	elseif pauseMode == 'Songs' then
		f_pauseSongs()
	end
end

--;===========================================================
--; AUDIO SETTINGS
--;===========================================================
t_audioCfg = {
	{id = '', text = 'Master Volume',   	varID = textImgNew(), varText = gl_vol},
	{id = '', text = 'SFX Volume',       	varID = textImgNew(), varText = se_vol},
	{id = '', text = 'BGM Volume',      	varID = textImgNew(), varText = bgm_vol},
	{id = '', text = 'Audio Panning',   	varID = textImgNew(), varText = t_panStr[math.ceil((pan_str + 1) * 0.025)]},
	{id = '', text = '              BACK',  varID = textImgNew(), varText = ''},
}

function f_pauseAudio()
	local hasChanged = false
	if pn == 1 then txt_audioCfg = createTextImg(jgFnt, 5, 0, 'AUDIO SETTINGS [P1]', 159, 63)
	elseif pn == 2 then txt_audioCfg = createTextImg(jgFnt, 1, 0, 'AUDIO SETTINGS [P2]', 159, 63)
	end
	if rectScale == 10 then
		if start then
			sndPlay(sysSnd, 100, 2)
			animReset(darkenOut)
			animUpdate(darkenOut)
			pauseMenuActive = false
			bufl = 0
			bufr = 0
			if modified then f_saveCfg() end
		elseif escape or (((pn == 1 and btnPalNo(p1Cmd) > 0) or (pn == 2 and btnPalNo(p2Cmd) > 0)) and audioCfg == #t_audioCfg) then
			sndPlay(sysSnd, 100, 2)
			rectScale = -10
			bufl = 0
			bufr = 0
		if modified then f_saveCfg() end
		end
	end
	if pauseMenuActive == true and rectScale < 10 then
		rectScale = rectScale + 1
	elseif pauseMenuActive == false and rectScale > 0 then
		rectScale = rectScale - 1
		animUpdate(darkenOut)
	end
	if pauseMenuActive == false and rectScale == 0 then
		f_pauseMenuReset()
		return
	end
	if pauseMenuActive then
		animDraw(darkenIn)
	else
		animDraw(darkenOut)
	end
	if rectScale == -1 then f_gameCfgMenuReset2() end
	if rectScale == 10 then
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
function f_soundPage1()
	t_songList = {}
	for file in lfs.dir[[.\\sound\\]] do
		if file:match('^.*(%.)mp3$') then
			row = #t_songList+1
			t_songList[row] = {}
			t_songList[row]['id'] = ''
			t_songList[row]['playlist'] = file:gsub('^(.*)[%.]mp3$', '%1')
		elseif file:match('^.*(%.)MP3$') then
			row = #t_songList+1
			t_songList[row] = {}
			t_songList[row]['id'] = ''
			t_songList[row]['playlist'] = file:gsub('^(.*)[%.]MP3$', '%1')
		elseif file:match('^.*(%.)ogg$') then
			row = #t_songList+1
			t_songList[row] = {}
			t_songList[row]['id'] = ''
			t_songList[row]['playlist'] = file:gsub('^(.*)[%.]ogg$', '%1')
		elseif file:match('^.*(%.)OGG$') then
			row = #t_songList+1
			t_songList[row] = {}
			t_songList[row]['id'] = ''
			t_songList[row]['playlist'] = file:gsub('^(.*)[%.]OGG$', '%1')
		end
	end
	t_songList[#t_songList+1] = {id = '', playlist = '              BACK'}
end

function f_pauseSongs()
	if pn == 1 then txt_songMenu = createTextImg(jgFnt, 5, 0, 'SONG SELECT [P1]', 159, 63)
	elseif pn == 2 then txt_songMenu = createTextImg(jgFnt, 1, 0, 'SONG SELECT [P2]', 159, 63)
	end
	if rectScale == 10 then
		if start then
			sndPlay(sysSnd, 100, 2)
			animReset(darkenOut)
			animUpdate(darkenOut)
			pauseMenuActive = false
			bufl = 0
			bufr = 0
		--BACK
		elseif escape or (((pn == 1 and btnPalNo(p1Cmd) > 0) or (pn == 2 and btnPalNo(p2Cmd) > 0)) and songMenu == #t_songList) then
			sndPlay(sysSnd, 100, 2)
			rectScale = -10
			bufl = 0
			bufr = 0
		end
	end
	if pauseMenuActive == true and rectScale < 10 then
		rectScale = rectScale + 1
	elseif pauseMenuActive == false and rectScale > 0 then
		rectScale = rectScale - 1
		animUpdate(darkenOut)
	end
	if pauseMenuActive == false and rectScale == 0 then
		f_pauseMenuReset()
		return
	end
	if pauseMenuActive then
		animDraw(darkenIn)
	else
		animDraw(darkenOut)
	end
	if rectScale == -1 then f_gameCfgMenuReset2() end
	if rectScale == 10 then
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
		end
		--Play Song
		if (pn == 1 and btnPalNo(p1Cmd) > 0) or (pn == 2 and btnPalNo(p2Cmd) > 0) then
			playBGM('sound/' .. t_songList[songMenu].playlist .. '.mp3')
			playBGM('sound/' .. t_songList[songMenu].playlist .. '.ogg')
		end
		if songMenu < 1 then
			songMenu = #t_songList
			if #t_songList > 7 then
				cursorPosY = 7
			else
				cursorPosY = #t_songList
			end
		elseif songMenu > #t_songList then
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
		if #t_songList <= 7 then
			maxSongs = #t_songList
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
		animSetWindow(cursorBox, 80,55+cursorPosY*15, 160,15)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		for i=1, maxSongs do
			if t_songList[i].playlist:len() > 26 then
				songText = string.sub(t_songList[i].playlist, 1, 24)
				songText = tostring(songText .. '...')
			else
				songText = t_songList[i].playlist
			end
			if i > songMenu - cursorPosY then
				t_songList[i].id = createTextImg(font14, 0, 1, songText, 85, 65+i*15-moveTxt,0.85,0.85)
				textImgDraw(t_songList[i].id)
			end
		end
		if maxSongs > 7 then
			animDraw(pauseUpArrow)
			animUpdate(pauseUpArrow)
		end
		if #t_songList > 7 and maxSongs < #t_songList then
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
--; TRAINING SETTINGS
--;===========================================================
t_trainingCfg = {
	--{id = '', text = '???',   						varID = textImgNew(), varText = ''},
	{id = '', text = 'Dummy Control', 				varID = textImgNew(), varText = ''},
	{id = '', text = 'Show Hitbox', 				varID = textImgNew(), varText = ''},
	{id = '', text = 'Show Debug Info',				varID = textImgNew(), varText = ''},
	{id = '', text = '              BACK',   		varID = textImgNew(), varText = ''},
}

function f_pauseTraining()
	if pn == 1 then txt_trainingCfg = createTextImg(jgFnt, 5, 0, 'TRAINING SETTINGS [P1]', 159, 63)
	elseif pn == 2 then txt_trainingCfg = createTextImg(jgFnt, 1, 0, 'TRAINING SETTINGS [P2]', 159, 63)
	end
	if pauseMode == 'Training' or trainingGoTo ~= '' then
		if rectScale == 10 then
			if start then
				sndPlay(sysSnd, 100, 2)
				animReset(darkenOut)
				animUpdate(darkenOut)
				pauseMenuActive = false
				bufl = 0
				bufr = 0
			--BACK
			elseif escape or (((pn == 1 and btnPalNo(p1Cmd) > 0) or (pn == 2 and btnPalNo(p2Cmd) > 0)) and trainingCfg == #t_trainingCfg) then
				sndPlay(sysSnd, 100, 2)
				rectScale = -10
				bufl = 0
				bufr = 0
			end
		end
		if pauseMenuActive == true and rectScale < 10 then
			rectScale = rectScale + 1
		elseif pauseMenuActive == false and rectScale > 0 then
			rectScale = rectScale - 1
			animUpdate(darkenOut)
		end
		if pauseMenuActive == false and rectScale == 0 then
			f_pauseMenuReset()
			return
		end
		if pauseMenuActive then
			animDraw(darkenIn)
		else
			animDraw(darkenOut)
		end
		if rectScale == -1 then
			if trainingGoTo == nil or trainingGoTo == '' then
				pauseMode = ''
			else
				pauseMode = trainingGoTo
				trainingGoTo = ''
			end
			rectScale = 0
		end
		if rectScale == 10 then
			if (pn == 1 and commandGetState(p1Cmd, 'u')) or (pn == 1 and (commandGetState(p1Cmd, 'holdu') and Pbufu >= 18)) or (pn == 2 and commandGetState(p2Cmd, 'u')) or (pn == 2 and (commandGetState(p2Cmd, 'holdu') and P2bufu >= 18)) then
				sndPlay(sysSnd, 100, 0)
				trainingCfg = trainingCfg - 1
				if bufl then bufl = 0 end
				if bufr then bufr = 0 end
			elseif (pn == 1 and commandGetState(p1Cmd, 'd')) or (pn == 1 and (commandGetState(p1Cmd, 'holdd') and Pbufd >= 18)) or (pn == 2 and commandGetState(p2Cmd, 'd')) or (pn == 2 and (commandGetState(p2Cmd, 'holdd') and P2bufd >= 18)) then
				sndPlay(sysSnd, 100, 0)
				trainingCfg = trainingCfg + 1
				if bufl then bufl = 0 end
				if bufr then bufr = 0 end
			end
			--if (pn == 1 and btnPalNo(p1Cmd) > 0) or (pn == 2 and btnPalNo(p2Cmd) > 0) then
				--??? Settings
				--if trainingCfg == 1 then
					--sndPlay(sysSnd, 100, 1)
					--trainingGoTo = '???'
				--end
			--end
			--Dummy Control
			if trainingCfg == 1 then
				if ((pn == 1 and commandGetState(p1Cmd, 'r')) or (pn == 2 and commandGetState(p2Cmd, 'r'))) and dummyMode == 'AI' then
					sndPlay(sysSnd, 100, 1)
					toggleAI(2)
					dummyMode = 'Manual'
				elseif ((pn == 1 and commandGetState(p1Cmd, 'l')) or (pn == 2 and commandGetState(p2Cmd, 'l'))) and dummyMode == 'Manual' then
					sndPlay(sysSnd, 100, 1)
					toggleAI(2)
					dummyMode = 'AI'
				end
			--Hitbox Status
			elseif trainingCfg == 2 then
				if ((pn == 1 and commandGetState(p1Cmd, 'r')) or (pn == 2 and commandGetState(p2Cmd, 'r'))) and hitboxStatus == 'No' then
					sndPlay(sysSnd, 100, 1)
					toggleClsnDraw()
					hitboxStatus = 'Yes'
				elseif ((pn == 1 and commandGetState(p1Cmd, 'l')) or (pn == 2 and commandGetState(p2Cmd, 'l'))) and hitboxStatus == 'Yes' then
					sndPlay(sysSnd, 100, 1)
					toggleClsnDraw()
					hitboxStatus = 'No'
				end
			--Debug Info Status
			elseif trainingCfg == 3 then
				if ((pn == 1 and commandGetState(p1Cmd, 'r')) or (pn == 2 and commandGetState(p2Cmd, 'r'))) and debugStatus == 'No' then
					sndPlay(sysSnd, 100, 1)
					toggleDebugDraw()
					debugStatus = 'Yes'
				elseif ((pn == 1 and commandGetState(p1Cmd, 'l')) or (pn == 2 and commandGetState(p2Cmd, 'l'))) and debugStatus == 'Yes' then
					sndPlay(sysSnd, 100, 1)
					toggleDebugDraw()
					debugStatus = 'No'
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
			t_trainingCfg[1].varText = dummyMode
			t_trainingCfg[2].varText = hitboxStatus
			t_trainingCfg[3].varText = debugStatus
			--animDraw(f_animVelocity(pauseBG0, -1, -1))
			animSetScale(pauseBG1, 220, maxtrainingCfg*15)
			animSetWindow(pauseBG1, 80,70, 160,105)
			animDraw(pauseBG1)
			--animUpdate(pauseBG1)
			textImgDraw(txt_trainingCfg)
			animSetWindow(cursorBox, 80,55+cursorPosY*15, 160,15)
			f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
			animDraw(f_animVelocity(cursorBox, -1, -1))
			for i=1, maxtrainingCfg do
				if i > trainingCfg - cursorPosY then
					if t_trainingCfg[i].varID ~= nil then
						textImgDraw(f_updateTextImg(t_trainingCfg[i].varID, font14, 0, 1, t_trainingCfg[i].text, 85, 65+i*15-moveTxt,0.85,0.85))
						textImgDraw(f_updateTextImg(t_trainingCfg[i].varID, font14, 0, -1, t_trainingCfg[i].varText, 235, 65+i*15-moveTxt,0.85,0.85))
					end
				end
			end
			if maxtrainingCfg > 7 then
				animDraw(pauseUpArrow)
				animUpdate(pauseUpArrow)
			end
			if #t_trainingCfg > 7 and maxtrainingCfg < #t_trainingCfg then
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
	--elseif pauseMode == '???' then
		--f_pause???()
	end
end
