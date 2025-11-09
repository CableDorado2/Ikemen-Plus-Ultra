local loadLuaModule = true
--[[=============================================================================
This Lua Module has been specifically designed for I.K.E.M.E.N. PLUS ULTRA Engine.
		Therefore, it may NOT be compatible with I.K.E.M.E.N. GO Engine.
=================================================================================]]
local missionDef = "script/mods/missions/missions.def" --Missions Data (Missions definition filename)
local missionSpr = sffNew("script/mods/missions/missions.sff") --Load Mission Sprites
--;===========================================================
--; MISSIONS MENU SCREENPACK DEFINITION
--;===========================================================
table.insert(t_challengeMenu,1,{text = "MISSIONS", gotomenu = "f_missionMenu()", id = textImgNew()}) --Insert new item to t_challengeMenu table loaded by screenpack.lua
local txt_missionMenu = createTextImg(jgFnt, 0, -1, "MISSION SELECT:", 195, 125)
local txt_missionProgress = createTextImg(jgFnt, 2, 1, "", 202, 125)
local txt_missionIncomplete = "INCOMPLETE"
local txt_missionClear = "COMPLETED"
local txt_missionStatsData = "Missions Completed"

local padlockMissionPosX = 125 --Padlock Position for Missions Menu
local padlockMissionPosY = 25

local missionCommonPosX = 50 --Allow set common pos for all previews
local missionCommonPosY = 21

local missionCommonScaleX = 0.168 --Allow set common scale for all previews
local missionCommonScaleY = 0.125

--Above Transparent background
local missionBG1 = animNew(sprIkemen, [[
3,0, 0,0, -1
]])
animSetPos(missionBG1, 48, 19)
animSetAlpha(missionBG1, 20, 100)
animUpdate(missionBG1)

--Below Transparent background
local missionBG2 = animNew(sprIkemen, [[
3,0, 0,0, -1
]])
animSetPos(missionBG2, 40, 130)
animSetAlpha(missionBG2, 20, 100)
animUpdate(missionBG2)

--Missions Input Hints Panel
local function drawMissionInputHints()
	local inputHintYPos = 219
	local hintFont = font2
	local hintFontYPos = 233
	animPosDraw(inputHintsBG, -56, 219)
	drawMenuInputHints("u","40,"..inputHintYPos,"d","60,"..inputHintYPos,"s","132,"..inputHintYPos,"e","210,"..inputHintYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Select", 81, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Confirm", 153, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Return", 231, hintFontYPos)
end
--;===========================================================
--; LOAD MISSIONS.DEF DATA
--;===========================================================
local function f_createMissionDat()
	if stats.modes.mission == nil then
		stats.modes.mission = {}
		stats.modes.mission.playtime = 0
		--stats.modes.mission.clearall = 0
		modified = true
	end
	for i=1, #t_missions do
		local modified = false
		if stats.modes.mission[t_missions[i].id] == nil then
			stats.modes.mission[t_missions[i].id] = {}
			modified = true
		end
		if stats.modes.mission[t_missions[i].id].clear == nil then
			stats.modes.mission[t_missions[i].id].clear = false
			modified = true
		end
	end
	if modified then f_saveStats() end
end

local function f_loadMissions()
t_missions = {}
local file = io.open(missionDef, "r")
	if file ~= nil then
		local section = 0
		local row = 0
		local content = file:read("*all")
		file:close()
		content = content:gsub('([^\r\n]*)%s*;[^\r\n]*', '%1')
		content = content:gsub('\n%s*\n', '\n')
		for line in content:gmatch('[^\r\n]+') do
			local lineLower = line:lower()
		--[Mission No]
			if lineLower:match('^%s*%[%s*mission%s+%d+%s*%]') then
				section = 1
				row = #t_missions + 1
			--Set Default Values
				t_missions[row] = {
					previewspr = {0, 0},
					previewpos = {missionCommonPosX, missionCommonPosY},
					previewscale = {missionCommonScaleX, missionCommonScaleY},
					status = txt_missionIncomplete,
					txtID = textImgNew(),
					name = "???",
					info = "",
					infolock = "???",
					unlock = "true"
				}
		--Extra section
			elseif lineLower:match('^%s*%[%s*%w+%s*%]') then
				section = -1
			elseif section == 1 then
			--Detect paramvalues
				local param, value = line:match('^%s*(.-)%s*=%s*(.-)%s*$')
				if param ~= nil and value ~= nil then
					param = param:lower()
				--If the value is a comma-separated list, convert to table
					if value:match(',') then
						local tbl = {}
						for num in value:gmatch('([^,]+)') do
							table.insert(tbl, num:match('^%s*(.-)%s*$')) --remove spaces
						end
						t_missions[row][param] = tbl
					else
						t_missions[row][param] = value:match('^%s*(.-)%s*$') --Store value as string
					end
				end
			end
		end
		if data.debugLog then f_printTable(t_missions, "save/debug/t_missions.log") end
		f_createMissionDat()
		for _, v in ipairs(t_missions) do --Send Missions Unlock Condition to t_unlockLua table
			t_unlockLua.modes[v.id] = v.unlock
		end
		f_updateUnlocks()
		textImgSetText(txt_loading, "LOADING MISSIONS...")
		textImgDraw(txt_loading)
		refresh()
	end
end
f_loadMissions() --Loads when engine starts
--;===========================================================
--; MISSION SAVE DATA
--;===========================================================
local function f_missionStatus()
	stats.modes.mission[t_missions[data.missionNo].id].clear = true
	f_saveStats()
end
function f_getMissionStats()
	if #t_missions == 0 then
		return ""
	else
		return f_getProgress(stats.modes.mission, t_missions, "clearcount").."/"..#t_missions
	end
end
table.insert(t_statsMenu,#t_statsMenu,{text = txt_missionStatsData, varText = f_getMissionStats(), varID = textImgNew()}) --Insert new item to t_statsMenu table loaded by screenpack.lua
--Insert new item to t_statsGameModes table loaded by main.lua
table.insert(t_statsGameModes,1,
	{
		displayname = "Missions", --Text to Display in Stats Menu
		id = "mission", --id to compare with data.rosterMode var
		playtime = function() return stats.modes.mission.playtime end,
		setplaytime = function(newtime) stats.modes.mission.playtime = newtime end
	}
)

function f_refreshMissionStats()
	for i=1, #t_statsMenu do
		if t_statsMenu[i].text == txt_missionStatsData then
			t_statsMenu[i].varText = f_getMissionStats()
		end
	end
end
--;===========================================================
--; MISSIONS MENU (complete customizable tasks)
--;===========================================================
function f_missionMenu()
	if data.debugMode then f_loadMissions() end --Load in real-time only if dev/debug mode is enabled
	if #t_missions == 0 then
		missionInfo = true
		infoScreen = true
		return
	end
	f_discordUpdate({details = "Missions"})
	cmdInput()
	local missionMenu = 1
	local cursorPosY = 1
	local moveTxt = 0
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	local previewInfotxt = nil
	local missionNametxt = nil
	local previewTransS = nil
	local previewTransD = nil
	animSetPos(menuArrowUp, 280, 130)
	animSetPos(menuArrowDown, 280, 195)
	f_unlock(false)
	f_updateUnlocks()
	data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', sprFade)
	while true do
		if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
			f_discordMainMenu()
			f_saveStats()
		--To refresh stats
			f_getStats(f_refreshMissionStats())
			data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', sprFade)
			sndPlay(sndSys, 100, 2)
			f_resetMenuArrowsPos()
			break
		elseif commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30) then
			sndPlay(sndSys, 100, 0)
			missionMenu = missionMenu - 1
		elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30) then
			sndPlay(sndSys, 100, 0)
			missionMenu = missionMenu + 1
	--START MISSION
		elseif btnPalNo(p1Cmd, true) > 0 or btnPalNo(p2Cmd, true) > 0 then
		--MISSION AVAILABLE
			if t_unlockLua.modes[t_missions[missionMenu].id] == nil then --If the mission is unlocked
				f_default()
				data.missionNo = missionMenu --with this data.missionNo is sync with menu item selected
				data.rosterMode = "mission"
				setGameMode('mission')
				textImgSetText(txt_mainSelect, "MISSION "..data.missionNo.." [" .. t_missions[data.missionNo].status .. "]")
				data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', sprFade)
				sndPlay(sndSys, 100, 1)
				if t_missions[data.missionNo].path ~= nil then --Detects if lua file is defined
					assert(loadfile(t_missions[data.missionNo].path))()
				end
				if winner == 1 then f_missionStatus() end --Save progress only if you win
				f_unlock(false)
				f_updateUnlocks()
		--MISSION UNAVAILABLE
			else
				sndPlay(sndIkemen, 200, 0)
			end
		end
	--Cursor position calculation
		if missionMenu < 1 then
			missionMenu = #t_missions
			if #t_missions > 5 then
				cursorPosY = 5
			else
				cursorPosY = #t_missions
			end
		elseif missionMenu > #t_missions then
			missionMenu = 1
			cursorPosY = 1
		elseif ((commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u')) or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30)) and cursorPosY > 1 then
			cursorPosY = cursorPosY - 1
		elseif ((commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd')) or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30)) and cursorPosY < 5 then
			cursorPosY = cursorPosY + 1
		end
		if cursorPosY == 5 then
			moveTxt = (missionMenu - 5) * 15
		elseif cursorPosY == 1 then
			moveTxt = (missionMenu - 1) * 15
		end
		if #t_missions <= 5 then
			maxMissions = #t_missions
		elseif missionMenu - cursorPosY > 0 then
			maxMissions = missionMenu + 5 - cursorPosY
		else
			maxMissions = 5
		end
		animDraw(f_animVelocity(commonBG0, -1, -1))
	--Draw Above Transparent BG
		animSetScale(missionBG1, 219.5, 94)
		animSetWindow(missionBG1, 0,5, 320,110)
		animDraw(missionBG1)
	--Draw Title Menu
		textImgDraw(txt_missionMenu)
		textImgSetText(txt_missionProgress,"["..f_getProgress(stats.modes.mission, t_missions, "percentage").."%]")
		textImgDraw(txt_missionProgress)
	--Draw Below Transparent Table BG
		animSetScale(missionBG2, 240, maxMissions*15)
		animSetWindow(missionBG2, 10,10, 269,195)
		animDraw(missionBG2)
	--Draw Below Table Cursor
		animSetWindow(cursorBox, 40,115+cursorPosY*15, 239,15)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
	--Draw Mission Image Preview
		if t_unlockLua.modes[t_missions[missionMenu].id] == nil then --If the mission is unlocked
			previewTransS = nil
			previewTransD = nil
		else
			previewTransS = 150 --Apply Transparent
			previewTransD = 0
		end
		f_drawSprPreview(missionSpr,
			t_missions[missionMenu].previewspr[1], t_missions[missionMenu].previewspr[2],
			t_missions[missionMenu].previewpos[1], t_missions[missionMenu].previewpos[2],
			t_missions[missionMenu].previewscale[1], t_missions[missionMenu].previewscale[2],
			previewTransS, previewTransD
		)
	--Draw Mission Info
		if t_unlockLua.modes[t_missions[missionMenu].id] == nil then
			previewInfotxt = t_missions[missionMenu].info
		else
			animPosDraw(padlock, padlockMissionPosX, padlockMissionPosY) --Draw Padlock Icon
			previewInfotxt = t_missions[missionMenu].infolock
		end
		textImgDraw(f_updateTextImg(t_missions[missionMenu].txtID, font11, 0, 0, previewInfotxt, 157, 13.5))
	--Draw Text for Below Table
		for i=1, maxMissions do
		--Set mission status
			if stats.modes.mission[t_missions[i].id].clear then
				t_missions[i].status = txt_missionClear
			end
			if t_unlockLua.modes[t_missions[i].id] == nil then
				missionNametxt = t_missions[i].name
			else
				missionNametxt = "???"
			end
			if i > missionMenu - cursorPosY then
				if t_missions[i].txtID ~= nil then
					textImgDraw(f_updateTextImg(t_missions[i].txtID, font2, 0, 1, missionNametxt, 45, 125+i*15-moveTxt))
					textImgDraw(f_updateTextImg(t_missions[i].txtID, font2, 0, -1, t_missions[i].status, 275, 125+i*15-moveTxt))
				end
			end
		end
	--Draw Up Animated Cursor
		if maxMissions > 5 then
			animDraw(menuArrowUp)
			animUpdate(menuArrowUp)
		end
	--Draw Down Animated Cursor
		if #t_missions > 5 and maxMissions < #t_missions then
			animDraw(menuArrowDown)
			animUpdate(menuArrowDown)
		end
	--Draw Input Hints Panel
		drawMissionInputHints()
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		if commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu') then
			bufd = 0
			bufu = bufu + 1
		elseif commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd') then
			bufu = 0
			bufd = bufd + 1
		else
			bufu = 0
			bufd = 0
		end
		cmdInput()
		refresh()
	end
end