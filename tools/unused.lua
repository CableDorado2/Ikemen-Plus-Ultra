
t_orderTowerChars = {}
--Tower Order for loader.lua
if t_selChars[row].ordertower ~= nil then --Only add to t_orderTowerChars chars that have an ordertower paramvalue
	if t_orderTowerChars[t_selChars[row].ordertower] == nil then
		t_orderTowerChars[t_selChars[row].ordertower] = {}
	end
	t_orderTowerChars[t_selChars[row].ordertower][#t_orderTowerChars[t_selChars[row].ordertower]+1] = row-1
end

if section == 4 then --[TowerMode]
	if line:match('^%s*difficulty%s*=') then
		row = #t_selTower+1
		t_selTower[row] = {}
		local data = line:gsub('%s*;.*$', '')
		if not data:match('=%s*$') then
			t_selTower[row]['difficulty'] = data:gsub('^%s*difficulty%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
			t_selTower[row]['ID'] = textImgNew()
			t_selTower[row]['maxmatches'] = {}
			t_selTower[row]['chars'] = t_orderTowerChars
		end
	end
	if line:match('^%s*maxmatches%s*=') then
		for i, c in ipairs(strsplit(',', line:gsub('%s*(.-)%s*', '%1'))) do
			t_selTower[row].maxmatches[#t_selTower[row].maxmatches+1] = tonumber(c)
			--t_selTower[row].maxmatches[i-1] = tonumber(c) --This also works
		end
	end
end

--f_makeRoster() Tower
if data.gameMode == "tower" then
	if (data.p1In == 2 and data.p2In == 2) then --Player 1 in player 2 (right) side
		if p1teamMode == 0 then --Single
			t = t_selTower[destinySelect].maxmatches
		--else --Team
			--t = t_selTower[destinySelect].teammaxmatches
		end
	else
		if p2teamMode == 0 then --Single
			t = t_selTower[destinySelect].maxmatches
		--else --Team
			--t = t_selTower[destinySelect].teammaxmatches
		end
	end
	for i=1, #t do --for each order number
		if (data.p1In == 2 and data.p2In == 2) then --Player 1 in player 2 (right) side
			cnt = t[i] * p1numChars --set amount of matches to get from the table
		else
			cnt = t[i] * p2numChars --set amount of matches to get from the table
		end
		if cnt > 0 and t_orderTowerChars[i] ~= nil then --if it's more than 0 and there are characters with such order
			while cnt > 0 do --do the following until amount of matches for particular order is reached
				f_shuffleTable(t_orderTowerChars[i]) --randomize characters table
				for j=1, #t_orderTowerChars[i] do --loop through chars associated with that particular order
					t_roster[#t_roster+1] = t_orderTowerChars[i][j] --and add such character into new table
					cnt = cnt - 1
					if cnt == 0 then --but only if amount of matches for particular order has not been reached yet
						break
					end
				end
			end
		end
	end
end

--;===========================================================
--; GALLERY MENU
--;===========================================================
t_gallery = {}
local section = 0
local file = io.open(galleryDef,"r")
local content = file:read("*all")
file:close()
content = content:gsub('([^\r\n]*)%s*;[^\r\n]*', '%1')
content = content:gsub('\n%s*\n', '\n')
for line in content:gmatch('[^\r\n]+') do
	if line:match('^%s*%[%s*[Aa][Rr][Tt][Ww][Oo][Rr][Kk][Ss]%s*%]') then
		section = 1
		row = #t_gallery+1
		t_gallery[row] = {}
	elseif line:match('^%s*%[%s*[Ss][Tt][Oo][Rr][Yy][Bb][Oo][Aa][Rr][Dd][Ss]%s*%]') then
		section = 2
		row = #t_gallery+1
		t_gallery[row] = {}
	elseif line:match('^%s*%[%s*[Mm][Oo][Vv][Ii][Ee][Ss]%s*%]') then
		section = 3
		row = #t_gallery+1
		t_gallery[row] = {}
	elseif section == 1 then --[Artworks]
		--displayname = string
		if line:match('^%s*displayname%s*=') then
			local data = line:gsub('%s*;.*$', '')
			if not data:match('=%s*$') then
				t_gallery[row]['displayname'] = data:gsub('^%s*displayname%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
				t_gallery[row]['txtID'] = textImgNew()
			end
		end
		--preview.file = filename (string)
		if line:match('^%s*preview.file%s*=') then
			local data = line:gsub('%s*;.*$', '')
			if not data:match('=%s*$') then
				--Store sff data to be used in gallery previews
				t_gallery[row]['sffData'] = sffNew(data:gsub('^%s*preview.file%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1'))
			end
		end
		--preview.common.pos = posX, posY (int, int)
		if line:match('^%s*preview.common.pos%s*=') then
			local data = line:gsub('%s*;.*$', '')
			if not data:match('=%s*$') then
				local sprData = data:gsub('^%s*preview.common.pos%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
				t_gallery[row]['commonSprPosX'], t_gallery[row]['commonSprPosY'] = sprData:match('^([^,]-)%s*,%s*(.-)$')
			end
		end
		--preview.common.scale = scaleX, scaleY (int, int)
		if line:match('^%s*preview.common.scale%s*=') then
			local data = line:gsub('%s*;.*$', '')
			if not data:match('=%s*$') then
				local sprData = data:gsub('^%s*preview.common.scale%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
				t_gallery[row]['commonSprScaleX'], t_gallery[row]['commonSprScaleY'] = sprData:match('^([^,]-)%s*,%s*(.-)$')
			end
		end
		if line:match('^%s*%[%s*[Aa][Rr][Tt]%s+[0-9]+$*%]') then --[Art No]
			t_gallery[row][#t_gallery[row]+1] = {}
			t_gallery[row][#t_gallery[row]]['id'] = #t_gallery[row]
			t_gallery[row][#t_gallery[row]]['infounlock'] = ""
			t_gallery[row][#t_gallery[row]]['infolock'] = "???"
			t_gallery[row][#t_gallery[row]]['unlock'] = "true"
		end
		--preview.spr = groupNo, indexNo (int, int)
		if line:match('^%s*preview.spr%s*=') then
			local data = line:gsub('%s*;.*$', '')
			if not data:match('=%s*$') then
				local sprData = data:gsub('^%s*preview.spr%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1') --Prepare data to separate numbers below
				t_gallery[row][#t_gallery[row]]['sprGroup'], t_gallery[row][#t_gallery[row]]['sprIndex'] = sprData:match('^([^,]-)%s*,%s*(.-)$') --Remove "" from values ​​store in the table
			end
		end
		--preview.pos = posX, posY (int, int)
		if line:match('^%s*preview.pos%s*=') then
			local data = line:gsub('%s*;.*$', '')
			if not data:match('=%s*$') then
				local sprData = data:gsub('^%s*preview.pos%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
				t_gallery[row][#t_gallery[row]]['sprPosX'], t_gallery[row][#t_gallery[row]]['sprPosY'] = sprData:match('^([^,]-)%s*,%s*(.-)$')
			end
		end
		--preview.scale = scaleX, scaleY (int, int)
		if line:match('^%s*preview.scale%s*=') then
			local data = line:gsub('%s*;.*$', '')
			if not data:match('=%s*$') then
				local sprData = data:gsub('^%s*preview.scale%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
				t_gallery[row][#t_gallery[row]]['sprScaleX'], t_gallery[row][#t_gallery[row]]['sprScaleY'] = sprData:match('^([^,]-)%s*,%s*(.-)$')
			end
		end
		--info = string
		if line:match('^%s*info%s*=') then
			local data = line:gsub('%s*;.*$', '')
			if not data:match('=%s*$') then
				t_gallery[row][#t_gallery[row]]['infounlock'] = data:gsub('^%s*info%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
			end
		end
		--info.locked = string
		if line:match('^%s*info.locked%s*=') then
			local data = line:gsub('%s*;.*$', '')
			if not data:match('=%s*$') then
				t_gallery[row][#t_gallery[row]]['infolock'] = data:gsub('^%s*info.locked%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
			end
		end
		--unlock = lua condition
		if line:match('^%s*unlock%s*=') then
			local data = line:gsub('%s*;.*$', '')
			if not data:match('=%s*$') then
				t_gallery[row][#t_gallery[row]]['unlock'] = data:gsub('^%s*unlock%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
			end
		end
	elseif section == 2 then --[Storyboards]
		if line:match('^%s*displayname%s*=') then
			local data = line:gsub('%s*;.*$', '')
			if not data:match('=%s*$') then
				t_gallery[row]['displayname'] = data:gsub('^%s*displayname%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
				t_gallery[row]['txtID'] = textImgNew()
			end
		end
		if line:match('^%s*preview.file%s*=') then
			local data = line:gsub('%s*;.*$', '')
			if not data:match('=%s*$') then
				t_gallery[row]['sffData'] = sffNew(data:gsub('^%s*preview.file%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1'))
			end
		end
		if line:match('^%s*preview.common.pos%s*=') then
			local data = line:gsub('%s*;.*$', '')
			if not data:match('=%s*$') then
				local sprData = data:gsub('^%s*preview.common.pos%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
				t_gallery[row]['commonSprPosX'], t_gallery[row]['commonSprPosY'] = sprData:match('^([^,]-)%s*,%s*(.-)$')
			end
		end
		if line:match('^%s*preview.common.scale%s*=') then
			local data = line:gsub('%s*;.*$', '')
			if not data:match('=%s*$') then
				local sprData = data:gsub('^%s*preview.common.scale%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
				t_gallery[row]['commonSprScaleX'], t_gallery[row]['commonSprScaleY'] = sprData:match('^([^,]-)%s*,%s*(.-)$')
			end
		end
		if line:match('^%s*%[%s*[Cc][Uu][Tt][Ss][Cc][Ee][Nn][Ee]%s+[0-9]+$*%]') then --[Cutscene No]
			t_gallery[row][#t_gallery[row]+1] = {}
			t_gallery[row][#t_gallery[row]]['id'] = #t_gallery[row]
			t_gallery[row][#t_gallery[row]]['infounlock'] = ""
			t_gallery[row][#t_gallery[row]]['infolock'] = "???"
			t_gallery[row][#t_gallery[row]]['unlock'] = "true"
		end
		if line:match('^%s*preview.spr%s*=') then
			local data = line:gsub('%s*;.*$', '')
			if not data:match('=%s*$') then
				local sprData = data:gsub('^%s*preview.spr%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
				t_gallery[row][#t_gallery[row]]['sprGroup'], t_gallery[row][#t_gallery[row]]['sprIndex'] = sprData:match('^([^,]-)%s*,%s*(.-)$')
			end
		end
		if line:match('^%s*preview.pos%s*=') then
			local data = line:gsub('%s*;.*$', '')
			if not data:match('=%s*$') then
				local sprData = data:gsub('^%s*preview.pos%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
				t_gallery[row][#t_gallery[row]]['sprPosX'], t_gallery[row][#t_gallery[row]]['sprPosY'] = sprData:match('^([^,]-)%s*,%s*(.-)$')
			end
		end
		if line:match('^%s*preview.scale%s*=') then
			local data = line:gsub('%s*;.*$', '')
			if not data:match('=%s*$') then
				local sprData = data:gsub('^%s*preview.scale%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
				t_gallery[row][#t_gallery[row]]['sprScaleX'], t_gallery[row][#t_gallery[row]]['sprScaleY'] = sprData:match('^([^,]-)%s*,%s*(.-)$')
			end
		end
		--file = filename (string)
		if line:match('^%s*file%s*=') then
			local data = line:gsub('%s*;.*$', '')
			if not data:match('=%s*$') then
				t_gallery[row][#t_gallery[row]]['file'] = data:gsub('^%s*file%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
			end
		end
		if line:match('^%s*info%s*=') then
			local data = line:gsub('%s*;.*$', '')
			if not data:match('=%s*$') then
				t_gallery[row][#t_gallery[row]]['infounlock'] = data:gsub('^%s*info%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
			end
		end
		if line:match('^%s*info.locked%s*=') then
			local data = line:gsub('%s*;.*$', '')
			if not data:match('=%s*$') then
				t_gallery[row][#t_gallery[row]]['infolock'] = data:gsub('^%s*info.locked%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
			end
		end
		if line:match('^%s*unlock%s*=') then
			local data = line:gsub('%s*;.*$', '')
			if not data:match('=%s*$') then
				t_gallery[row][#t_gallery[row]]['unlock'] = data:gsub('^%s*unlock%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
			end
		end
	elseif section == 3 then --[Movies]
		if line:match('^%s*displayname%s*=') then
			local data = line:gsub('%s*;.*$', '')
			if not data:match('=%s*$') then
				t_gallery[row]['displayname'] = data:gsub('^%s*displayname%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
				t_gallery[row]['txtID'] = textImgNew()
			end
		end
		if line:match('^%s*preview.file%s*=') then
			local data = line:gsub('%s*;.*$', '')
			if not data:match('=%s*$') then
				t_gallery[row]['sffData'] = sffNew(data:gsub('^%s*preview.file%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1'))
			end
		end
		if line:match('^%s*preview.common.pos%s*=') then
			local data = line:gsub('%s*;.*$', '')
			if not data:match('=%s*$') then
				local sprData = data:gsub('^%s*preview.common.pos%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
				t_gallery[row]['commonSprPosX'], t_gallery[row]['commonSprPosY'] = sprData:match('^([^,]-)%s*,%s*(.-)$')
			end
		end
		if line:match('^%s*preview.common.scale%s*=') then
			local data = line:gsub('%s*;.*$', '')
			if not data:match('=%s*$') then
				local sprData = data:gsub('^%s*preview.common.scale%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
				t_gallery[row]['commonSprScaleX'], t_gallery[row]['commonSprScaleY'] = sprData:match('^([^,]-)%s*,%s*(.-)$')
			end
		end
		if line:match('^%s*%[%s*[Vv][Ii][Dd][Ee][Oo]%s+[0-9]+$*%]') then --[Video No]
			t_gallery[row][#t_gallery[row]+1] = {}
			t_gallery[row][#t_gallery[row]]['id'] = #t_gallery[row]
			t_gallery[row][#t_gallery[row]]['infounlock'] = ""
			t_gallery[row][#t_gallery[row]]['infolock'] = "???"
			t_gallery[row][#t_gallery[row]]['unlock'] = "true"
		end
		if line:match('^%s*preview.spr%s*=') then
			local data = line:gsub('%s*;.*$', '')
			if not data:match('=%s*$') then
				local sprData = data:gsub('^%s*preview.spr%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
				t_gallery[row][#t_gallery[row]]['sprGroup'], t_gallery[row][#t_gallery[row]]['sprIndex'] = sprData:match('^([^,]-)%s*,%s*(.-)$')
			end
		end
		if line:match('^%s*preview.pos%s*=') then
			local data = line:gsub('%s*;.*$', '')
			if not data:match('=%s*$') then
				local sprData = data:gsub('^%s*preview.pos%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
				t_gallery[row][#t_gallery[row]]['sprPosX'], t_gallery[row][#t_gallery[row]]['sprPosY'] = sprData:match('^([^,]-)%s*,%s*(.-)$')
			end
		end
		if line:match('^%s*preview.scale%s*=') then
			local data = line:gsub('%s*;.*$', '')
			if not data:match('=%s*$') then
				local sprData = data:gsub('^%s*preview.scale%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
				t_gallery[row][#t_gallery[row]]['sprScaleX'], t_gallery[row][#t_gallery[row]]['sprScaleY'] = sprData:match('^([^,]-)%s*,%s*(.-)$')
			end
		end
		if line:match('^%s*file%s*=') then
			local data = line:gsub('%s*;.*$', '')
			if not data:match('=%s*$') then
				t_gallery[row][#t_gallery[row]]['file'] = data:gsub('^%s*file%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
			end
		end
		if line:match('^%s*info%s*=') then
			local data = line:gsub('%s*;.*$', '')
			if not data:match('=%s*$') then
				t_gallery[row][#t_gallery[row]]['infounlock'] = data:gsub('^%s*info%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
			end
		end
		if line:match('^%s*info.locked%s*=') then
			local data = line:gsub('%s*;.*$', '')
			if not data:match('=%s*$') then
				t_gallery[row][#t_gallery[row]]['infolock'] = data:gsub('^%s*info.locked%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
			end
		end
		if line:match('^%s*unlock%s*=') then
			local data = line:gsub('%s*;.*$', '')
			if not data:match('=%s*$') then
				t_gallery[row][#t_gallery[row]]['unlock'] = data:gsub('^%s*unlock%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
			end
		end
	end
	if data.debugLog then f_printTable(t_gallery, "save/debug/t_gallery.txt") end
	--[[
	textImgSetText(txt_loading, "LOADING GALLERY...")
	textImgDraw(txt_loading)
	refresh()
	]]
end
for i=1, #t_gallery do
	local section = nil
	if i == 1 then section = "artworks"
	elseif i == 2 then section = "storyboards"
	elseif i == 3 then section = "videos"
	end
	for k, v in ipairs(t_gallery[i]) do --Send Gallery Unlocks Condition to t_unlockLua table
		t_unlockLua[section][v.id] = v.unlock
	end
end

function f_galleryMenu()
	cmdInput()
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	local previewInfotxt = nil
	local previewPosX = nil
	local previewPosY = nil
	local previewScaleX = nil
	local previewScaleY = nil
	local previewTransS = nil
	local previewTransD = nil
	--Section Vars
	galleryMenu = 1
	local cursorSectionPosX = 1
	local moveSectionTxt = 0
	local maxSectionItems = 3
	f_updateGallery()
	data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', sprFade)
	f_resetGalleryArrowsPos()
	f_unlock(false)
	f_updateUnlocks()
	while true do
	--BACK BUTTON
		if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
			data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', sprFade)
			sndPlay(sndSys, 100, 2)
			break
	--PREVIOUS SECTION
		elseif commandGetState(p1Cmd, 'y') or commandGetState(p2Cmd, 'y') or ((commandGetState(p1Cmd, 'holdy') or commandGetState(p2Cmd, 'holdy')) and bufy >= 30) then
			if galleryMenu > 1 then
				sndPlay(sndSys, 100, 0)
				galleryMenu = galleryMenu - 1
				f_updateGallery()
			end
	--NEXT SECTION
		elseif commandGetState(p1Cmd, 'z') or commandGetState(p2Cmd, 'z') or ((commandGetState(p1Cmd, 'holdz') or commandGetState(p2Cmd, 'holdz')) and bufz >= 30) then
			if galleryMenu < #t_gallery then
				sndPlay(sndSys, 100, 0)
				galleryMenu = galleryMenu + 1
				f_updateGallery()
			end
		end
	--SCROLL UP
		if commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30) then
			if galleryCell > galleryMenuSizeX then
				sndPlay(sndSys, 100, 0)
				galleryCell = galleryCell - galleryMenuSizeX
				galleryYpos = galleryYpos - 1
			end
	--SCROLL DOWN
		elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30) then
			if galleryCell <= galleryMaxLimit - galleryMenuSizeX then
				if galleryCell < galleryMaxLimit then
					sndPlay(sndSys, 100, 0)
					galleryCell = galleryCell + galleryMenuSizeX
					galleryYpos = galleryYpos + 1
				end
			end
	--SCROLL LEFT
		elseif commandGetState(p1Cmd, 'l') or commandGetState(p2Cmd, 'l') or ((commandGetState(p1Cmd, 'holdl') or commandGetState(p2Cmd, 'holdl')) and bufl >= 30) then
			if galleryXpos > 1 then
				sndPlay(sndSys, 100, 0)
				galleryCell = galleryCell - 1
				galleryXpos = galleryXpos - 1
			end
	--SCROLL RIGHT
		elseif commandGetState(p1Cmd, 'r') or commandGetState(p2Cmd, 'r') or ((commandGetState(p1Cmd, 'holdr') or commandGetState(p2Cmd, 'holdr')) and bufr >= 30) then
			if galleryXpos < galleryMenuSizeX then
				if galleryCell < galleryMaxLimit then
					sndPlay(sndSys, 100, 0)
					galleryCell = galleryCell + 1
					galleryXpos = galleryXpos + 1
				end
			end
		end
	--ENTER BUTTON
		if commandGetState(p1Cmd, 'w') or commandGetState(p2Cmd, 'w') then
			--ARTWORK (watch pictures)
			if galleryMenu == 1 then
				if t_unlockLua.artworks[galleryCell] == nil then --If the artwork is unlocked
					sndPlay(sndSys, 100, 1)
					f_artMenu(galleryCell, galleryMaxLimit)
				else
					sndPlay(sndSys, 100, 5)
				end
			--STORYBOARDS (watch storyboards)
			elseif galleryMenu == 2 and t_gallery[galleryMenu][galleryCell].file ~= nil then
				if t_unlockLua.storyboards[galleryCell] == nil then --If the storyboard is unlocked
					sndPlay(sndSys, 100, 1)
				--Play Storyboard
					cmdInput()
					f_storyboard(t_gallery[galleryMenu][galleryCell].file) --Start Storyboard
				--When Storyboard Ends:
					data.fadeTitle = f_fadeAnim(50, 'fadein', 'black', sprFade)
					f_menuMusic()
				else
					sndPlay(sndSys, 100, 5)
				end
			--CUTSCENES (watch video cutscenes)
			elseif galleryMenu == 3 and t_gallery[galleryMenu][galleryCell].file ~= nil then
				if t_unlockLua.videos[galleryCell] == nil then --If the video is unlocked
					sndPlay(sndSys, 100, 1)
					playVideo(t_gallery[galleryMenu][galleryCell].file)
				--When Video Ends:
					data.fadeTitle = f_fadeAnim(50, 'fadein', 'black', sprFade)
					f_menuMusic()
				else
					sndPlay(sndSys, 100, 5)
				end
			--SCREENSHOTS (view your screenshots collection)
			--elseif galleryMenu == 4 then
				
			end
		end
	--Section Cursor position calculation
		if galleryMenu < 1 then
			galleryMenu = #t_gallery
			if #t_gallery > maxSectionItems then
				cursorSectionPosX = maxSectionItems
			else
				cursorSectionPosX = #t_gallery
			end
		elseif galleryMenu > #t_gallery then
			galleryMenu = 1
			cursorSectionPosX = 1
		elseif ((commandGetState(p1Cmd, 'y') or commandGetState(p2Cmd, 'y')) or ((commandGetState(p1Cmd, 'holdy') or commandGetState(p2Cmd, 'holdy')) and bufy >= 30)) and cursorSectionPosX > 1 then
			cursorSectionPosX = cursorSectionPosX - 1
		elseif ((commandGetState(p1Cmd, 'z') or commandGetState(p2Cmd, 'z')) or ((commandGetState(p1Cmd, 'holdz') or commandGetState(p2Cmd, 'holdz')) and bufz >= 30)) and cursorSectionPosX < maxSectionItems then
			cursorSectionPosX = cursorSectionPosX + 1
		end
		if cursorSectionPosX == maxSectionItems then
			moveSectionTxt = (galleryMenu - maxSectionItems) * 15
		elseif cursorSectionPosX == 1 then
			moveSectionTxt = (galleryMenu - 1) * 15
		end	
		if #t_gallery <= maxSectionItems then
			maxSection = #t_gallery
		elseif galleryMenu - cursorSectionPosX > 0 then
			maxSection = galleryMenu + maxSectionItems - cursorSectionPosX
		else
			maxSection = maxSectionItems
		end
	--Draw BG
		animDraw(f_animVelocity(commonBG0, -1, -1))
	--Draw Title Menu
		textImgDraw(txt_galleryTitle)
	--Draw Items Text for Gallery Section Table
		for i=1, maxSection do
			if i > galleryMenu - cursorSectionPosX then
				if i == galleryMenu then
					bank = 5
				else
					bank = 0
				end
				if t_gallery[i].displayname ~= nil then
					textImgDraw(f_updateTextImg(t_gallery[i].txtID, jgFnt, bank, 0, t_gallery[i].displayname, -70+i*115-moveSectionTxt, 39))
				end
			end
		end
	--Draw Up Animated Cursor
		if maxSection > maxSectionItems then
			animDraw(menuArrowLeft)
			animUpdate(menuArrowLeft)
		end
	--Draw Down Animated Cursor
		if #t_gallery > maxSectionItems and maxSection < #t_gallery then
			animDraw(menuArrowRight)
			animUpdate(menuArrowRight)
		end
	--Gallery Cell Cursor position calculation
		if galleryYpos > galleryMenuSizeY then
			galleryYpos = galleryMenuSizeY
			galleryMove = galleryMove + 1
		elseif galleryYpos < 1 then
			galleryYpos = 1
			galleryMove = galleryMove - 1
		end
	--Draw Gallery Preview Content
		for i=1, galleryMaxLimit do
			if t_galleryCellX ~= nil then
				--[[ CUSTOM POSITION NO IMPLEMENTED
				if t_gallery[galleryMenu][galleryCell].sprPosX ~= nil then previewPosX = t_gallery[galleryMenu][galleryCell].sprPosX --Use position stored in events.def file
				else previewPosX = CommonPosX --Use common position loaded in screenpack.lua
				end
				if t_gallery[galleryMenu][galleryCell].sprPosY ~= nil then previewPosY = t_gallery[galleryMenu][galleryCell].sprPosY
				else previewPosY = galleryCommonPosY
				end
			]]
				if t_gallery[galleryMenu][i].sprScaleX ~= nil then previewScaleX = t_gallery[galleryMenu][i].sprScaleX --Use scale stored in events.def file
				else previewScaleX = t_gallery[galleryMenu].commonSprScaleX --Use common scale loaded in gallery.def
				end
				if t_gallery[galleryMenu][i].sprScaleY ~= nil then previewScaleY = t_gallery[galleryMenu][i].sprScaleY
				else previewScaleY = t_gallery[galleryMenu].commonSprScaleY
				end
				--If the item is unlocked
				if (galleryMenu == 1 and t_unlockLua.artworks[i] == nil) or (galleryMenu == 2 and t_unlockLua.storyboards[i] == nil) or (galleryMenu == 3 and t_unlockLua.videos[i] == nil) then
					previewTransS = nil
					previewTransD = nil
				else
					previewTransS = 150
					previewTransD = 0
				end
				if t_gallery[galleryMenu].sffData ~= nil and t_gallery[galleryMenu][galleryCell].sprGroup ~= nil and t_gallery[galleryMenu][galleryCell].sprIndex ~= nil then
					f_drawGalleryPreview(t_gallery[galleryMenu][i].sprGroup, t_gallery[galleryMenu][i].sprIndex, (galleryCellPosX*2) + t_galleryCellX[i]*(galleryCellSpacingX*2), (galleryCellPosY*2) + t_galleryCellY[i]*(galleryCellSpacingY*2) - (galleryMove*galleryCellSpacingY*2), previewScaleX, previewScaleY, previewTransS, previewTransD)
					--testperfomance = f_drawGalleryPreview( )
					--animDraw(testperfomance)
				else --Draw Unknown Sprite
					
				end
			--Draw Padlock Icon
				if (galleryMenu == 1 and t_unlockLua.artworks[galleryCell] == nil) or (galleryMenu == 2 and t_unlockLua.storyboards[galleryCell] == nil) or (galleryMenu == 3 and t_unlockLua.videos[galleryCell] == nil) then
					--animPosDraw(padlock, (galleryCellPosX*2) + t_galleryCellX[i]*(galleryCellSpacingX*2), (galleryCellPosY*2) + t_galleryCellY[i]*(galleryCellSpacingY*2) - (galleryMove*galleryCellSpacingY*2), previewScaleX, previewScaleY)
				end
			end
		end
	--Draw Gallery Cell Cursor
		animPosDraw(galleryCursor, galleryCursorPosX+galleryXpos*galleryCursorSpacingX, galleryCursorPosY+galleryYpos*galleryCursorSpacingY)
	--Draw Item Text Info
		if (galleryMenu == 1 and t_unlockLua.artworks[galleryCell] == nil) or (galleryMenu == 2 and t_unlockLua.storyboards[galleryCell] == nil) or (galleryMenu == 3 and t_unlockLua.videos[galleryCell] == nil) then
			previewInfotxt = t_gallery[galleryMenu][galleryCell].infounlock
		else
			previewInfotxt = t_gallery[galleryMenu][galleryCell].infolock
		end
		animPosDraw(galleryInfoBG, -56, 185) --Draw Info Text BG
		textImgSetText(txt_galleryInfo, previewInfotxt)
		textImgDraw(txt_galleryInfo)
	--Draw Input Hints Panel
		drawGalleryInputHints()
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
	--GALLERY MENU BUF KEY CONTROL
		if commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu') then
			bufd = 0
			bufu = bufu + 1
		elseif commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd') then
			bufu = 0
			bufd = bufd + 1
		elseif commandGetState(p1Cmd, 'holdr') or commandGetState(p2Cmd, 'holdr') then
			bufl = 0
			bufr = bufr + 1
		elseif commandGetState(p1Cmd, 'holdl') or commandGetState(p2Cmd, 'holdl') then
			bufr = 0
			bufl = bufl + 1
		else
			bufr = 0
			bufl = 0
			bufu = 0
			bufd = 0
		end
	--LATERAL ITEMS BUF KEY CONTROL
		if commandGetState(p1Cmd, 'holdz') or commandGetState(p2Cmd, 'holdz') then
			bufy = 0
			bufz = bufz + 1
		elseif commandGetState(p1Cmd, 'holdy') or commandGetState(p2Cmd, 'holdy') then
			bufz = 0
			bufy = bufy + 1
		else
			bufz = 0
			bufy = 0
		end
		cmdInput()
		refresh()
	end
end

function f_updateGallery()
	galleryXpos = 1
	galleryYpos = 1
	galleryMove = 0
	galleryMenuSizeX = 4
	galleryMenuSizeY = 3
	galleryMaxLimit = #t_gallery[galleryMenu]
	galleryCell = 1
	t_galleryCellX = {}
	t_galleryCellY = {}
	f_galleryCellDraw(galleryMenuSizeX, galleryMaxLimit)
end

function f_galleryCellDraw(galleryMenuSizeX, galleryMaxLimit)
	local i = 0
	local counter = 0
	local posX = 0
	local posY = 0
	local galleryCellDraw = 0
	while true do
		if galleryCellDraw == galleryMaxLimit then
			break
		end
		i = i + 1
		counter = counter + 1
		if i > galleryMenuSizeX then
			i = 1
			posY = posY + 1
		end
		posX = i
		t_galleryCellX[#t_galleryCellX + 1] = posX
		t_galleryCellY[#t_galleryCellY + 1] = posY
		galleryCellDraw = counter
	end
end

function f_drawGalleryPreview(group, index, posX, posY, scaleX, scaleY, alphaS, alphaD)
	local scaleX = scaleX or 1
	local scaleY = scaleY or 1
	local alphaS = alphaS or 255
	local alphaD = alphaD or 0
	local anim = group..','..index..', 0,0, 0'
	anim = animNew(t_gallery[galleryMenu].sffData, anim)
	animSetAlpha(anim, alphaS, alphaD)
	animSetScale(anim, scaleX, scaleY)
	animSetPos(anim, posX, posY)
	animSetWindow(anim, 0, 42, 320, 145) --This will enclose the items in a window
	animUpdate(anim)
	animDraw(anim)
	--return anim
end

--;===========================================================
--; ARTWORK MENU
--;===========================================================
function f_artMenu(artNo, artLimit)
	data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', sprFade)
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	local bufc = 0
	local bufb = 0
	local bufz = 0
	local bufy = 0
	local moveArt = artNo --Start in image
	local maxArt = artLimit
	local hideMenu = false
	f_resetArtPos()
	artList = nil --Important to avoid errors when read
	f_resetArtworkArrowsPos()
	cmdInput()
	while true do
		--RETURN
		if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
			data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', sprFade)
			sndPlay(sndSys, 100, 2)
			break
		--NEXT ART PAGE
		elseif ((commandGetState(p1Cmd, 'c') or commandGetState(p2Cmd, 'c')) or 
		((commandGetState(p1Cmd, 'holdc') or commandGetState(p2Cmd, 'holdc')) and bufc >= 30)) then
			data.fadeTitle = f_fadeAnim(50, 'fadein', 'black', sprFade)
			sndPlay(sndSys, 100, 3)
			f_resetArtPos()
			if moveArt >= maxArt then --Go to first art
				moveArt = 1
			else
				moveArt = moveArt + 1
				if t_unlockLua.artworks[moveArt] ~= nil then --If the artwork is locked
					if moveArt >= maxArt then
						moveArt = 1
					else
						moveArt = moveArt + 1 --skip to an art unlocked
					end
				end
			end
		--PREVIOUS ART PAGE
		elseif ((commandGetState(p1Cmd, 'b') or commandGetState(p2Cmd, 'b')) or 
		((commandGetState(p1Cmd, 'holdb') or commandGetState(p2Cmd, 'holdb')) and bufb >= 30)) then
			data.fadeTitle = f_fadeAnim(50, 'fadein', 'black', sprFade)
			sndPlay(sndSys, 100, 3)
			f_resetArtPos()
			if moveArt <= 1 then --Go to last art
				moveArt = maxArt
			else --Keep in image 0,0 when press previous key until finish
				moveArt = moveArt - 1
			end
		--RESET ART POSITION
		elseif commandGetState(p1Cmd, 'w') or commandGetState(p2Cmd, 'w') then
			f_resetArtPos()
		--HIDE MENU
		elseif commandGetState(p1Cmd, 's') or commandGetState(p2Cmd, 's') then
			if not hideMenu then hideMenu = true else hideMenu = false end
		end
		--MOVE UP ART
		if ((commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u')) or 
		((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 5)) then
			artPosY = artPosY - 1
		--MOVE DOWN ART
		elseif ((commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd')) or 
		((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 5)) then
			artPosY = artPosY + 1
		end
		--MOVE LEFT ART
		if ((commandGetState(p1Cmd, 'l') or commandGetState(p2Cmd, 'l')) or 
		((commandGetState(p1Cmd, 'holdl') or commandGetState(p2Cmd, 'holdl')) and bufl >= 5)) then
			artPosX = artPosX - 1
		--MOVE RIGHT ART
		elseif ((commandGetState(p1Cmd, 'r') or commandGetState(p2Cmd, 'r')) or 
		((commandGetState(p1Cmd, 'holdr') or commandGetState(p2Cmd, 'holdr')) and bufr >= 5)) then
			artPosX = artPosX + 1
		end
		--ZOOM IN ART
		if ((commandGetState(p1Cmd, 'z') or commandGetState(p2Cmd, 'z')) or 
		((commandGetState(p1Cmd, 'holdz') or commandGetState(p2Cmd, 'holdz')) and bufz >= 10)) and artScale <= 10 then
			artScale = artScale + 0.01
		--ZOOM OUT ART
		elseif ((commandGetState(p1Cmd, 'y') or commandGetState(p2Cmd, 'y')) or 
		((commandGetState(p1Cmd, 'holdy') or commandGetState(p2Cmd, 'holdy')) and bufy >= 10)) and artScale >= 0.01 then
			artScale = artScale - 0.01
		end
		artList = moveArt --Use menu position to show image in these order
		f_drawGalleryArt()
		--Draw HUD Assets
		if not hideMenu then
			f_drawQuickText(txt_artNumber, font14, 0, 0, artList.."/"..maxArt, 292, 15) --draw pictures limit numbers text
			if moveArt > 1 then
				animDraw(menuArrowLeft)
				animUpdate(menuArrowLeft)
			end
			if moveArt < maxArt then
				animDraw(menuArrowRight)
				animUpdate(menuArrowRight)
			end
		end
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		if not hideMenu then drawArtInputHints() end --Draw Input Hints Panel
		--ART PAGE BUF KEY CONTROL
		if commandGetState(p1Cmd, 'holdc') or commandGetState(p2Cmd, 'holdc') then
			bufb = 0
			bufc = bufc + 1
		elseif commandGetState(p1Cmd, 'holdb') or commandGetState(p2Cmd, 'holdb') then
			bufc = 0
			bufb = bufb + 1
		else
			bufb = 0
			bufc = 0
		end
		--VERTICAL BUF KEY CONTROL
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
		--LATERAL BUF KEY CONTROL
		if commandGetState(p1Cmd, 'holdr') or commandGetState(p2Cmd, 'holdr') then
			bufl = 0
			bufr = bufr + 1
		elseif commandGetState(p1Cmd, 'holdl') or commandGetState(p2Cmd, 'holdl') then
			bufr = 0
			bufl = bufl + 1
		else
			bufr = 0
			bufl = 0
		end
		--ZOOM BUF KEY CONTROL
		if commandGetState(p1Cmd, 'holdz') or commandGetState(p2Cmd, 'holdz') then
			bufy = 0
			bufz = bufz + 1
		elseif commandGetState(p1Cmd, 'holdy') or commandGetState(p2Cmd, 'holdy') then
			bufz = 0
			bufy = bufy + 1
		else
			bufz = 0
			bufy = 0
		end
		cmdInput()
		refresh()
	end
end

function f_resetArtPos()
artPosX = 160
artPosY = 120
artScale = 0.30 --0.305
end

function f_drawGalleryArt()
local sffData = t_gallery[1].sffData --Reuse Artworks Preview File
local art = '0,' .. artList-1 .. ', 0,0, 0'
artPic = animNew(sffData, art)
animSetScale(artPic, artScale, artScale)
animSetPos(artPic, artPosX, artPosY)
animUpdate(artPic)
animDraw(artPic)
end

--Almacenar automaticamente todos los parametros definidos dentro del .def
local t_vnTest = {}
local file = io.open("data/visualnovel/arc1.def", "r")
if file then
    local chapterFound = false
    for line in file:lines() do
        if line:match("%[Chapter 1%]") then
            chapterFound = true
        elseif chapterFound then
            --Search "=" in line and store the info in t_vnTest
            local key, value = line:match("(%w+)%s*=%s*(.*)")
            if key and value then
                t_vnTest[key] = value
            end
        end
    end
    file:close()
end
f_printTable(t_vnTest, "save/debug/TEST.txt")

function f_txtLoad(path)
t_txtBoxText = {}
local file = io.open(path,"r")
local content = file:read("*all")
file:close()
content = content:gsub('([^\r\n]*)%s*;[^\r\n]*', '%1')
content = content:gsub('\n%s*\n', '\n')
for line in content:gmatch('[^\r\n]+') do
	row = #t_txtBoxText+1
	t_txtBoxText[row] = {}
	t_txtBoxText[row]['text'] = line
end
if data.debugLog then f_printTable(t_txtBoxText, "save/debug/t_txtBoxText.txt") end
end

function f_txtLoad2(path)
local file = io.open(path,"r") --Open .txt file refer in path var in reading mode
local t = {} --Create a table to store the file information
for i in file:lines() do --Read file content line by line
	table.insert(t, i) --Save each line as a table element
end
file:close() --Close .txt file
if data.debugLog then f_printTable(t, "save/debug/t_txtBoxText.txt") end
end

--Move to common.lua --> f_soundtrack()
t_file = {}
folder = #t_file+1
t_file[folder] = {} --Add 1st folder
function f_loadDir(path)
	for item in lfs.dir(path) do --For each item readed in path
		if item ~= "." and item ~= ".." and item ~= ".keep" then --exclude items
			local details = path.."/"..item --Get path and file name
			local attribute = lfs.attributes(details) --Get atributes from items readed
			assert(type(attribute) == "table")
			f_loadDir(details)
			if attribute.mode == "directory" then --If the item have "folder/dir" attribute
				folder = #t_file+1
				t_file[folder] = {} --Add new folder
			elseif attribute.mode == "file" then --If the item have "file" attribute
				if item:match('^.*(%.)[Mm][Pp][3]$') then
					t_file[folder][#t_file[folder]+1] = {}
					t_file[folder][#t_file[folder]]['id'] = ""
					t_file[folder][#t_file[folder]]['folder'] = "TODO"
					t_file[folder][#t_file[folder]]['path'] = details --Add item to table
					t_file[folder][#t_file[folder]]['name'] = item:gsub('^(.*)[%.][Mm][Pp][3]$', '%1')
				end
				--f_printTable(t_file, 'save/debug/Test.txt')
			end
		end
	end
	f_printTable(t_file, 'save/debug/Test.txt')
end
f_loadDir("sound")

function f_soundtrack()
t_songList = {} --Create Table
--;=================================================================
--;	FOLDER 1
--;=================================================================
folder = #t_songList+1 --Set "Folder 1" row for the table
t_songList[folder] = {} --Add 1st Folder
for file in lfs.dir[[.\\sound\\]] do --Read Dir
	if file:match('^.*(%.)[Mm][Pp][3]$') then --Filter Files .mp3			
		t_songList[folder][#t_songList[folder]+1] = {} --Add songs filtered to the end of the "folder" sub-table
		t_songList[folder][#t_songList[folder]]['id'] = '' --Reserve id to create text
		t_songList[folder][#t_songList[folder]]['folder'] = 'GLOBAL' --Folder name where is located the song
		t_songList[folder][#t_songList[folder]]['name'] = file:gsub('^(.*)[%.][Mm][Pp][3]$', '%1') --Get song name without extension
		t_songList[folder][#t_songList[folder]]['path'] = 'sound/'..file --Get song file path
	elseif file:match('^.*(%.)[Oo][Gg][Gg]$') then --Filter Files .ogg
		t_songList[folder][#t_songList[folder]+1] = {}
		t_songList[folder][#t_songList[folder]]['id'] = ''
		t_songList[folder][#t_songList[folder]]['folder'] = 'GLOBAL'
		t_songList[folder][#t_songList[folder]]['name'] = file:gsub('^(.*)[%.][Oo][Gg][Gg]$', '%1')
		t_songList[folder][#t_songList[folder]]['path'] = 'sound/'..file
	end
end
--Add extra items to the end of "Folder" sub-row Created
t_songList[folder][#t_songList[folder]+1] = {id = '', folder = 'GLOBAL', name = 'RANDOM SELECT', path = 'Random'}
t_songList[folder][#t_songList[folder]+1] = {id = '', folder = 'GLOBAL', name = '          BACK', path = ''}
--;=================================================================
--;	FOLDER 2
--;=================================================================
folder = #t_songList+1 --Set "Folder 2" row for the table
t_songList[folder] = {} --Add 2nd Folder
for file in lfs.dir[[.\\sound\system\\]] do
	if file:match('^.*(%.)[Mm][Pp][3]$') then
		t_songList[folder][#t_songList[folder]+1] = {}
		t_songList[folder][#t_songList[folder]]['id'] = ''
		t_songList[folder][#t_songList[folder]]['folder'] = 'SYSTEM'
		t_songList[folder][#t_songList[folder]]['name'] = file:gsub('^(.*)[%.][Mm][Pp][3]$', '%1')
		t_songList[folder][#t_songList[folder]]['path'] = 'sound/system/'..file
	elseif file:match('^.*(%.)[Oo][Gg][Gg]$') then
		t_songList[folder][#t_songList[folder]+1] = {}
		t_songList[folder][#t_songList[folder]]['id'] = ''
		t_songList[folder][#t_songList[folder]]['folder'] = 'SYSTEM'
		t_songList[folder][#t_songList[folder]]['name'] = file:gsub('^(.*)[%.][Oo][Gg][Gg]$', '%1')
		t_songList[folder][#t_songList[folder]]['path'] = 'sound/system/'..file
	end
end
t_songList[folder][#t_songList[folder]+1] = {id = '', folder = 'SYSTEM', name = 'RANDOM SELECT', path = 'Random'}
t_songList[folder][#t_songList[folder]+1] = {id = '', folder = 'SYSTEM', name = '          BACK', path = ''}
--;=================================================================
--;	FOLDER 3
--;=================================================================
folder = #t_songList+1
t_songList[folder] = {}
for file in lfs.dir[[.\\sound\system\menu\\]] do
	if file:match('^.*(%.)[Mm][Pp][3]$') then
		t_songList[folder][#t_songList[folder]+1] = {}
		t_songList[folder][#t_songList[folder]]['id'] = ''
		t_songList[folder][#t_songList[folder]]['folder'] = 'MENU'
		t_songList[folder][#t_songList[folder]]['name'] = file:gsub('^(.*)[%.][Mm][Pp][3]$', '%1')
		t_songList[folder][#t_songList[folder]]['path'] = 'sound/system/menu/'..file
	elseif file:match('^.*(%.)[Oo][Gg][Gg]$') then
		t_songList[folder][#t_songList[folder]+1] = {}
		t_songList[folder][#t_songList[folder]]['id'] = ''
		t_songList[folder][#t_songList[folder]]['folder'] = 'MENU'
		t_songList[folder][#t_songList[folder]]['name'] = file:gsub('^(.*)[%.][Oo][Gg][Gg]$', '%1')
		t_songList[folder][#t_songList[folder]]['path'] = 'sound/system/menu/'..file
	end
end
t_songList[folder][#t_songList[folder]+1] = {id = '', folder = 'MENU', name = 'RANDOM SELECT', path = 'Random'}
t_songList[folder][#t_songList[folder]+1] = {id = '', folder = 'MENU', name = '          BACK', path = ''}
--;=================================================================
--;	FOLDER 4
--;=================================================================
folder = #t_songList+1
t_songList[folder] = {}
for file in lfs.dir[[.\\sound\system\select\\]] do
	if file:match('^.*(%.)[Mm][Pp][3]$') then
		t_songList[folder][#t_songList[folder]+1] = {}
		t_songList[folder][#t_songList[folder]]['id'] = ''
		t_songList[folder][#t_songList[folder]]['folder'] = 'CHARACTER SELECT'
		t_songList[folder][#t_songList[folder]]['name'] = file:gsub('^(.*)[%.][Mm][Pp][3]$', '%1')
		t_songList[folder][#t_songList[folder]]['path'] = 'sound/system/select/'..file
	elseif file:match('^.*(%.)[Oo][Gg][Gg]$') then
		t_songList[folder][#t_songList[folder]+1] = {}
		t_songList[folder][#t_songList[folder]]['id'] = ''
		t_songList[folder][#t_songList[folder]]['folder'] = 'CHARACTER SELECT'
		t_songList[folder][#t_songList[folder]]['name'] = file:gsub('^(.*)[%.][Oo][Gg][Gg]$', '%1')
		t_songList[folder][#t_songList[folder]]['path'] = 'sound/system/select/'..file
	end
end
t_songList[folder][#t_songList[folder]+1] = {id = '', folder = 'CHARACTER SELECT', name = 'RANDOM SELECT', path = 'Random'}
t_songList[folder][#t_songList[folder]+1] = {id = '', folder = 'CHARACTER SELECT', name = '          BACK', path = ''}
--;=================================================================
--;	SET YOUR FOLDER BELOW
--;=================================================================

--Save Log
if data.debugLog then f_printTable(t_songList, "save/debug/t_songList.txt") end
end

--Glossary Menu Table First Design
t_glossary = {
	{
		title = "section 1",
		icon = "1,0",
		[1] = {
			name = "name 1", content = "description"
		},
		[2] = {
			name = "name 2", content = "description"
		},
		[3] = {
			name = "name 3", content = "description"
		},
	},
	{
		title = "section 2",
		icon = "1,1",
		[1] = {
			name = "name 1", content = "description"
		},
		[2] = {
			name = "name 2", content = "description"
		},
	},
}
if data.debugLog then f_printTable(t_glossary, "save/debug/t_glossary.txt") end

--;===========================================================
--; OLD COMMON SUB-MENUS SCREENPACK DEFINITION
--;===========================================================
t_commonSubMenu = {
	{id = textImgNew(), text = "P1 VS CPU"},
	{id = textImgNew(), text = "P2 VS CPU"},
	{id = textImgNew(), text = "CPU VS P1"},
	{id = textImgNew(), text = "CPU VS P2"},
	{id = textImgNew(), text = "P1&P2 VS CPU"},
	--{id = textImgNew(), text = "CPU VS P1&P2"},
	{id = textImgNew(), text = "CPU VS CPU"},
}

t_commonSubMenu2 = {
	{id = textImgNew(), text = "P1 VS CPU"},
	{id = textImgNew(), text = "P2 VS CPU"},
	{id = textImgNew(), text = "CPU VS P1"},
	{id = textImgNew(), text = "CPU VS P2"},
	{id = textImgNew(), text = "P1 VS P2"},
	{id = textImgNew(), text = "P2 VS P1"},
	{id = textImgNew(), text = "CPU VS CPU"},
	--{id = textImgNew(), text = "P1&P2 VS CPU"},
	--{id = textImgNew(), text = "CPU VS P1&P2"},
	--{id = textImgNew(), text = "P1&P3 VS P2&P4"},
}

t_bonusrushMenu = {
	{id = textImgNew(), text = "P1 VS CPU"},
	{id = textImgNew(), text = "P2 VS CPU"},
	{id = textImgNew(), text = "CPU VS P1"},
	{id = textImgNew(), text = "CPU VS P2"},
	{id = textImgNew(), text = "P1&P2 VS CPU"},
	--{id = textImgNew(), text = "CPU VS P1&P2"},
}

local function f_countdown(targetTimeStr)
    --currentHour: number, current time in 24h format (example: 20)
    --targetTimeStr: string, target time in "HH:MM" format
	local currentYear = sysYear
	local currentMounth = sysMounth
	local currentDay = sysDay
	local currentHour = sysHour
	local currentMinutes = sysMinutes
	local currentSeconds = sysSeconds
--Parse the target time
    local targetHour, targetMinute = targetTimeStr:match("(%d+):(%d+)")
    targetHour = tonumber(targetHour)
    targetMinute = tonumber(targetMinute)
--Convert current and destination hours to total minutes since midnight
    local currentTotalMinutes = currentHour * 60
    local targetTotalMinutes = targetHour * 60 + targetMinute
--Calculate difference in minutes
    local diffMinutes = targetTotalMinutes - currentTotalMinutes
--If the countdown has already passed, add 24 hours (to consider the next day)
    if diffMinutes < 0 then
        diffMinutes = diffMinutes + 24 * 60
    end
--Convert difference in hours, minutes and seconds
    local d = math.floor(diffMinutes / 1440)
    local remainingMinutes = diffMinutes % 1440
    local h = math.floor(remainingMinutes / 60)
    local m = remainingMinutes % 60
    local s = 0
    return string.format("%d days, %02d:%02d:%02d", d, h, m, s)
end

function f_timeCountdown(args)
--[["args" argument is a table that can have keys: year, month, day, hour, min, sec
Example:
t_deadline = {year="2025", month="Dec", day="31", hour = "23", min = "59", sec = "59"}
f_timeCountdown(t_deadline)
]]
--Get the current date and time
	local now = nil
	if args.time == "net" then
		now = currentNetTime
	elseif args.time == "local" then
		now = os.time()
	end
	if now == nil then return false end
--Convert date inputs into a table to create the target timestamp
	local targetDate = {
		year = tonumber(args.year),
		month = nil,
		day = nil,
		hour = tonumber(args.hour) or 0,
		min = tonumber(args.min) or 0,
		sec = tonumber(args.sec) or 0
	}
--Convert month to number if it is string
	if type(args.month) == "string" then
		targetDate.month = f_monthToNumber(args.month) --targetMonth[]
	elseif args.month then
		targetDate.month = tonumber(args.month)
	end
--If the day is missing, day 1 is assumed
	targetDate.day = tonumber(args.day) or 1
--Create the destination timestamp
    local targetTimestamp = os.time(targetDate)
--Calculate difference in seconds
	local diffSeconds = targetTimestamp - now
	if diffSeconds < 0 then
		diffSeconds = 0 --The date has already passed
	end
--Component calculation
	local seconds_in_minute = 60
	local seconds_in_hour = 3600
	local seconds_in_day = 86400
	local seconds_in_week = 7 * seconds_in_day
	local seconds_in_month = 30 * seconds_in_day --approximate
	local seconds_in_year = 365 * seconds_in_day --approximate
	
	local years = math.floor(diffSeconds / seconds_in_year)
	diffSeconds = diffSeconds % seconds_in_year
	
	local months = math.floor(diffSeconds / seconds_in_month)
	diffSeconds = diffSeconds % seconds_in_month
	
	local weeks = math.floor(diffSeconds / seconds_in_week)
	diffSeconds = diffSeconds % seconds_in_week
	
	local days = math.floor(diffSeconds / seconds_in_day)
	diffSeconds = diffSeconds % seconds_in_day
	
	local hours = math.floor(diffSeconds / seconds_in_hour)
	diffSeconds = diffSeconds % seconds_in_hour
	
	local minutes = math.floor(diffSeconds / seconds_in_minute)
	local seconds = diffSeconds % seconds_in_minute
--Build the string according arguments added, omitting any 0 values
	local parts = {}
--Count how many arguments were added
	local present_args = 0
	for k,v in pairs(args) do
		present_args = present_args + 1
	end
--Function to add only if that argument was passed
	local function addPart(name, value)
		if args[name] ~= nil then
			table.insert(parts, value)
		end
	end
--Only if there is a single argument, return only that value
	if present_args == 1 then
		for k,v in pairs(args) do
			if k == "year" then
				addPart(k, years .. " years")
			elseif k == "month" then
				addPart(k, months .. " months")
			elseif k == "day" then
				addPart(k, days .. " days")
			elseif k == "hour" then
				addPart(k, hours .. "h")
			elseif k == "min" then
				addPart(k, minutes .. "m")
			elseif k == "sec" then
				addPart(k, seconds .. "s")
			end
		end
	--If for some reason it does not match, return "0" or similar
		if #parts == 0 then
			return "0"
		else
			return parts[1]
		end
	else
--[[OLD below logic
	--If there are several values or none, show all that apply
		if args.year ~= nil and years > 0 then
			table.insert(parts, years .. " years")
		end
		if args.month ~= nil and months > 0 then
			table.insert(parts, months .. " months")
		end
		if args.day ~= nil and days > 0 then
			table.insert(parts, days .. " days")
		end
		if args.hour ~= nil and hours > 0 then
			table.insert(parts, hours .. "hours")
		end
		if args.min ~= nil and minutes > 0 then
			table.insert(parts, minutes .. "min")
		end
		if args.sec ~= nil and seconds > 0 then
			table.insert(parts, seconds .. "s")
		end
	--If none pass, show all
		if #parts == 0 then
		--Show Full Countdown
			if years > 0 then table.insert(parts, years .. " years") end
			if months > 0 then table.insert(parts, months .. " months") end
			if weeks > 0 then table.insert(parts, weeks .. " weeks") end
			if days > 0 then table.insert(parts, days .. " days") end
			if hours > 0 then table.insert(parts, hours .. "h") end
			if minutes > 0 then table.insert(parts, minutes .. "m") end
			if seconds > 0 or #parts == 0 then table.insert(parts, seconds .. "s") end
		end
		return table.concat(parts, ", ") --Return the damn countdown
]]
		local has_large_unit = years > 0 or months > 0 or weeks > 0 or days > 0
	--More than 1 day left
		if has_large_unit then
			if years > 0 then table.insert(parts, years .. " years") end
			if months > 0 then table.insert(parts, months .. " months") end
			if weeks > 0 then table.insert(parts, weeks .. " weeks") end
			if days > 0 then table.insert(parts, days .. " days") end
			if hours > 0 then table.insert(parts, hours .. "h") end
			if minutes > 0 then table.insert(parts, minutes .. "m") end
			if diffSeconds > 0 or #parts == 0 then table.insert(parts, seconds .. "s") end
	--Less than 1 day left
		else
			if hours > 0 then table.insert(parts, hours .. "h") end
			if minutes > 0 then table.insert(parts, minutes .. "m") end
			if diffSeconds > 0 or #parts == 0 then table.insert(parts, seconds .. "s") end
		end
		if #parts == 0 then
			return "DEADLINE REACHED"
		else
			return table.concat(parts, ", ") --Return the damn countdown
		end
	end
end

function f_loadEvents2()
t_events = {}
local file = io.open(eventDef,"r")
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
					t_events['sffData'] = sffNew(data:gsub('^%s*preview.file%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')) --Store sff data to be used in mission previews
				end
		--preview.common.pos = posX, posY (int, int)
			elseif line:match('^%s*preview.common.pos%s*=') then
				local data = line:gsub('%s*;.*$', '')
				if not data:match('=%s*$') then
					local sprData = data:gsub('^%s*preview.common.pos%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1') --Prepare data to separate numbers below
					t_events['commonSprPosX'], t_events['commonSprPosY'] = sprData:match('^([^,]-)%s*,%s*(.-)$') --Remove "" from values ​​store in the table
				end
		--preview.common.scale = scaleX, scaleY (int, int)
			elseif line:match('^%s*preview.common.scale%s*=') then
				local data = line:gsub('%s*;.*$', '')
				if not data:match('=%s*$') then
					local sprData = data:gsub('^%s*preview.common.scale%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
					t_events['commonSprScaleX'], t_events['commonSprScaleY'] = sprData:match('^([^,]-)%s*,%s*(.-)$')
				end
			elseif line:match('^%s*%[%s*[Ee][Vv][Ee][Nn][Tt]%s+[0-9]+$*%]') then
				section = 1
				row = #t_events+1
				t_events[row] = {}
		--[Event No]
			elseif section == 1 then
			--id = string
				if line:match('^%s*id%s*=') then
					local data = line:gsub('%s*;.*$', '')
					if not data:match('=%s*$') then
						t_events[row]['id'] = data:gsub('^%s*id%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
						t_events[row]['status'] = txt_eventIncomplete
						t_events[row]['txtID'] = textImgNew()
						t_events[row]['unlock'] = "true"
						t_events[row]['infounlock'] = ""
					end
				end
			--info = string
				if line:match('^%s*info%s*=') then
					local data = line:gsub('%s*;.*$', '')
					if not data:match('=%s*$') then
						t_events[row]['infounlock'] = data:gsub('^%s*info%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
					end
				end
			--info.locked = string
				if line:match('^%s*info.locked%s*=') then
					local data = line:gsub('%s*;.*$', '')
					if not data:match('=%s*$') then
						t_events[row]['infolock'] = data:gsub('^%s*info.locked%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
					end
				end
			--preview.spr = groupNo, indexNo (int, int)
				if line:match('^%s*preview.spr%s*=') then
					local data = line:gsub('%s*;.*$', '')
					if not data:match('=%s*$') then
						local sprData = data:gsub('^%s*preview.spr%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
						t_events[row]['sprGroup'], t_events[row]['sprIndex'] = sprData:match('^([^,]-)%s*,%s*(.-)$') --Remove "" from values ​​store in the table
					end
				end
			--preview.pos = posX, posY (int, int)
				if line:match('^%s*preview.pos%s*=') then
					local data = line:gsub('%s*;.*$', '')
					if not data:match('=%s*$') then
						local sprData = data:gsub('^%s*preview.pos%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
						t_events[row]['sprPosX'], t_events[row]['sprPosY'] = sprData:match('^([^,]-)%s*,%s*(.-)$')
					end
				end
			--preview.scale = scaleX, scaleY (int, int)
				if line:match('^%s*preview.scale%s*=') then
					local data = line:gsub('%s*;.*$', '')
					if not data:match('=%s*$') then
						local sprData = data:gsub('^%s*preview.scale%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
						t_events[row]['sprScaleX'], t_events[row]['sprScaleY'] = sprData:match('^([^,]-)%s*,%s*(.-)$')
					end
				end
			--path = string
				if line:match('^%s*path%s*=') then
					local data = line:gsub('%s*;.*$', '')
					if not data:match('=%s*$') then
						t_events[row]['path'] = data:gsub('^%s*path%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
					end
				end
			--unlock = lua condition
				if line:match('^%s*unlock%s*=') then
					local data = line:gsub('%s*;.*$', '')
					if not data:match('=%s*$') then
						t_events[row]['unlock'] = data:gsub('^%s*unlock%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
					end
				end
			end
		end
		for k, v in ipairs(t_events) do --Send Events Unlock Condition to t_unlockLua table
			t_unlockLua.modes[v.id] = v.unlock
		end
	end
	if data.debugLog then f_printTable(t_events, "save/debug/t_events.log") end
	textImgSetText(txt_loading, "LOADING EVENTS...")
	textImgDraw(txt_loading)
	refresh()
end

function f_setAchievement()
local modified = false
	if stats.trophies == nil then stats.trophies = {} end --Create space to achievements reward
	for i=1, #t_achievements do
		if stats.trophies[t_achievements[i].id] == nil then
			stats.trophies[t_achievements[i].id] = {}
		end
		if stats.trophies[t_achievements[i].id].rewardclaimed == nil then
			stats.trophies[t_achievements[i].id].rewardclaimed = false
			--modified = true
		end
		if stats.trophies[t_achievements[i].id].clear == nil then
			stats.trophies[t_achievements[i].id].clear = false
			--modified = true
		end
		if stats.trophies[t_achievements[i].id].displayed == nil then
			stats.trophies[t_achievements[i].id].displayed = false
			--modified = true
		end
	end
	f_saveStats()
end