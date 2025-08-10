local excludeLuaMatch = true --This module will not load during a match (for optimization purposes)
missionDef = "script/mods/missions/missions.def" --Missions Data (Missions definition filename)
--;===========================================================
--; MISSIONS MENU SCREENPACK DEFINITION
--;===========================================================
table.insert(t_challengeMenu,1,{text = "MISSIONS", gotomenu = "f_missionMenu()", id = textImgNew()}) --Insert new item to t_challengeMenu table loaded by screenpack.lua
txt_missionMenu = createTextImg(jgFnt, 0, -1, "MISSION SELECT:", 195, 125)
txt_missionProgress = createTextImg(jgFnt, 2, 1, "", 202, 125)
txt_missionIncomplete = "INCOMPLETE"
txt_missionClear = "COMPLETED"

padlockMissionPosX = 125 --Padlock Position for Missions Menu
padlockMissionPosY = 25

missionCommonPosX = 50 --Allow set common pos for all previews
missionCommonPosY = 21

missionCommonScaleX = 0.168 --Allow set common scale for all previews
missionCommonScaleY = 0.125

--Above Transparent background
missionBG1 = animNew(sprIkemen, [[
3,0, 0,0, -1
]])
animSetPos(missionBG1, 48, 19)
animSetAlpha(missionBG1, 20, 100)
animUpdate(missionBG1)

--Below Transparent background
missionBG2 = animNew(sprIkemen, [[
3,0, 0,0, -1
]])
animSetPos(missionBG2, 40, 130)
animSetAlpha(missionBG2, 20, 100)
animUpdate(missionBG2)

--Missions Input Hints Panel
function drawMissionInputHints()
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
--; MISSIONS MENU (complete customizable tasks)
--;===========================================================
function f_missionMenu()
	if data.debugMode then f_loadMissions() end --Load in real-time only if dev/debug mode is enabled
	if #t_missions == 0 then
		missionInfo = true
		infoScreen = true
		return
	end
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
	local previewPosX = nil
	local previewPosY = nil
	local previewScaleX = nil
	local previewScaleY = nil
	local previewTransS = nil
	local previewTransD = nil
	animSetPos(menuArrowUp, 280, 130)
	animSetPos(menuArrowDown, 280, 195)
	f_unlock(false)
	f_updateUnlocks()
	data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', sprFade)
	while true do
	--Missions Progress Logic
		stats.modes.mission.clearall = stats.modes.mission.clear1 + stats.modes.mission.clear2 + stats.modes.mission.clear3
		missionsData = (math.floor((stats.modes.mission.clearall * 100 / 3) + 0.5)) --The number (3) is the amount of all data.missionStatus
		textImgSetText(txt_missionProgress,"["..missionsData.."%]")
		if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
			f_saveStats()
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
				sndPlay(sndSys, 100, 5)
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
		if t_missions[missionMenu].sprPosX ~= nil then previewPosX = t_missions[missionMenu].sprPosX --Use position stored in events.def file
		else previewPosX = missionCommonPosX --Use common position loaded in screenpack.lua
		end
		if t_missions[missionMenu].sprPosY ~= nil then previewPosY = t_missions[missionMenu].sprPosY
		else previewPosY = missionCommonPosY
		end
		if t_missions[missionMenu].sprScaleX ~= nil then previewScaleX = t_missions[missionMenu].sprScaleX --Use scale stored in events.def file
		else previewScaleX = missionCommonScaleX --Use common scale loaded in screenpack.lua
		end
		if t_missions[missionMenu].sprScaleY ~= nil then previewScaleY = t_missions[missionMenu].sprScaleY
		else previewScaleY = missionCommonScaleY
		end
		--
		if t_unlockLua.modes[t_missions[missionMenu].id] == nil then --If the mission is unlocked
			previewTransS = nil
			previewTransD = nil
		else
			previewTransS = 150 --Apply Transparent
			previewTransD = 0
		end
		f_drawMissionPreview(t_missions[missionMenu].sprGroup, t_missions[missionMenu].sprIndex, previewPosX, previewPosY, previewScaleX, previewScaleY, previewTransS, previewTransD)
	--Draw Mission Info
		if t_unlockLua.modes[t_missions[missionMenu].id] == nil then
			previewInfotxt = t_missions[missionMenu].infounlock
		else
			animPosDraw(padlock, padlockMissionPosX, padlockMissionPosY) --Draw Padlock Icon
			previewInfotxt = t_missions[missionMenu].infolock
		end
		textImgDraw(f_updateTextImg(t_missions[missionMenu].txtID, font11, 0, 0, previewInfotxt, 157, 13.5))
	--Set mission status
		if stats.modes.mission.clear1 == 1 then t_missions[1].status = txt_missionClear end
		if stats.modes.mission.clear2 == 1 then t_missions[2].status = txt_missionClear end
		if stats.modes.mission.clear3 == 1 then t_missions[3].status = txt_missionClear end
	--Draw Text for Below Table
		for i=1, maxMissions do
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

--Get Missions Preview
function f_drawMissionPreview(group, index, posX, posY, scaleX, scaleY, alphaS, alphaD)
	local scaleX = scaleX or 1
	local scaleY = scaleY or 1
	local alphaS = alphaS or 255
	local alphaD = alphaD or 0
	local anim = group..','..index..', 0,0, 0'
	anim = animNew(t_missions.sffData, anim)
	animSetAlpha(anim, alphaS, alphaD)
	animSetScale(anim, scaleX, scaleY)
	animSetPos(anim, posX, posY)
	animUpdate(anim)
	animDraw(anim)
	--return anim
end

--;===========================================================
--; MISSION SAVE DATA
--;===========================================================
function f_missionStatus()
	if data.missionNo == 1 then stats.modes.mission.clear1 = 1
	elseif data.missionNo == 2 then stats.modes.mission.clear2 = 1
	elseif data.missionNo == 3 then stats.modes.mission.clear3 = 1
	end
	f_saveStats()
end

--;===========================================================
--; LOAD MISSIONS.DEF DATA
--;===========================================================
function f_loadMissions()
t_missions = {}
local file = io.open(missionDef,"r")
	if file ~= nil then
		local section = 0
		local content = file:read("*all")
		file:close()
		content = content:gsub('([^\r\n]*)%s*;[^\r\n]*', '%1')
		content = content:gsub('\n%s*\n', '\n')
		for line in content:gmatch('[^\r\n]+') do
		--preview.file = filename (string)
			if line:match('^%s*preview.file%s*=') then
				local data = line:gsub('%s*;.*$', '')
				if not data:match('=%s*$') then
					t_missions['sffData'] = sffNew(data:gsub('^%s*preview.file%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')) --Store sff data to be used in mission previews
				end
		--preview.common.pos = posX, posY (int, int)
			elseif line:match('^%s*preview.common.pos%s*=') then
				local data = line:gsub('%s*;.*$', '')
				if not data:match('=%s*$') then
					local sprData = data:gsub('^%s*preview.common.pos%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1') --Prepare data to separate numbers below
					t_missions['commonSprPosX'], t_missions['commonSprPosY'] = sprData:match('^([^,]-)%s*,%s*(.-)$') --Remove "" from values ​​store in the table
				end
		--preview.common.scale = scaleX, scaleY (int, int)
			elseif line:match('^%s*preview.common.scale%s*=') then
				local data = line:gsub('%s*;.*$', '')
				if not data:match('=%s*$') then
					local sprData = data:gsub('^%s*preview.common.scale%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
					t_missions['commonSprScaleX'], t_missions['commonSprScaleY'] = sprData:match('^([^,]-)%s*,%s*(.-)$')
				end
			elseif line:match('^%s*%[%s*[Mm][Ii][Ss][Ss][Ii][Oo][Nn]%s+[0-9]+$*%]') then
				section = 1
				row = #t_missions+1
				t_missions[row] = {}
		--[Mission No]
			elseif section == 1 then
			--id = string
				if line:match('^%s*id%s*=') then
					local data = line:gsub('%s*;.*$', '')
					if not data:match('=%s*$') then
						t_missions[row]['id'] = data:gsub('^%s*id%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
						t_missions[row]['status'] = txt_missionIncomplete
						t_missions[row]['txtID'] = textImgNew()
						t_missions[row]['unlock'] = "true"
						t_missions[row]['name'] = ""
						t_missions[row]['infounlock'] = ""
					end
				end
			--displayname = string
				if line:match('^%s*name%s*=') then
					local data = line:gsub('%s*;.*$', '')
					if not data:match('=%s*$') then
						t_missions[row]['name'] = data:gsub('^%s*name%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
					end
				end
			--info = string
				if line:match('^%s*info%s*=') then
					local data = line:gsub('%s*;.*$', '')
					if not data:match('=%s*$') then
						t_missions[row]['infounlock'] = data:gsub('^%s*info%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
					end
				end
			--info.locked = string
				if line:match('^%s*info.locked%s*=') then
					local data = line:gsub('%s*;.*$', '')
					if not data:match('=%s*$') then
						t_missions[row]['infolock'] = data:gsub('^%s*info.locked%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
					end
				end
			--preview.spr = groupNo, indexNo (int, int)
				if line:match('^%s*preview.spr%s*=') then
					local data = line:gsub('%s*;.*$', '')
					if not data:match('=%s*$') then
						local sprData = data:gsub('^%s*preview.spr%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
						t_missions[row]['sprGroup'], t_missions[row]['sprIndex'] = sprData:match('^([^,]-)%s*,%s*(.-)$') --Remove "" from values ​​store in the table
					end
				end
			--preview.pos = posX, posY (int, int)
				if line:match('^%s*preview.pos%s*=') then
					local data = line:gsub('%s*;.*$', '')
					if not data:match('=%s*$') then
						local sprData = data:gsub('^%s*preview.pos%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
						t_missions[row]['sprPosX'], t_missions[row]['sprPosY'] = sprData:match('^([^,]-)%s*,%s*(.-)$')
					end
				end
			--preview.scale = scaleX, scaleY (int, int)
				if line:match('^%s*preview.scale%s*=') then
					local data = line:gsub('%s*;.*$', '')
					if not data:match('=%s*$') then
						local sprData = data:gsub('^%s*preview.scale%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
						t_missions[row]['sprScaleX'], t_missions[row]['sprScaleY'] = sprData:match('^([^,]-)%s*,%s*(.-)$')
					end
				end
			--path = string
				if line:match('^%s*path%s*=') then
					local data = line:gsub('%s*;.*$', '')
					if not data:match('=%s*$') then
						t_missions[row]['path'] = data:gsub('^%s*path%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
					end
				end
			--unlock = lua condition
				if line:match('^%s*unlock%s*=') then
					local data = line:gsub('%s*;.*$', '')
					if not data:match('=%s*$') then
						t_missions[row]['unlock'] = data:gsub('^%s*unlock%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
					end
				end
			end
		end
		for k, v in ipairs(t_missions) do --Send Missions Unlock Condition to t_unlockLua table
			t_unlockLua.modes[v.id] = v.unlock
		end
	end
	if data.debugLog then f_printTable(t_missions, "save/debug/t_missions.log") end
	textImgSetText(txt_loading, "LOADING MISSIONS...")
	textImgDraw(txt_loading)
	refresh()
end
f_loadMissions()