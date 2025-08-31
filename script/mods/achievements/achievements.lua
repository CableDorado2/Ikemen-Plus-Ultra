--[[=============================================================================
This Lua Module has been specifically designed for I.K.E.M.E.N. PLUS ULTRA Engine.
		Therefore, it may NOT be compatible with I.K.E.M.E.N. GO Engine.
=================================================================================]]
sprAchievements = sffNew("script/mods/achievements/achievements.sff") --load achievements sprites
achievementDef = "script/mods/achievements/achievements.def" --Achievements list
--;===========================================================
--; ACHIEVEMENTS SCREENPACK DEFINITION
--;===========================================================
table.insert(t_profileMenu,#t_profileMenu,{text = "ACHIEVEMENTS", gotomenu = "f_achievementsMenu()", id = textImgNew()}) --Insert new item to t_profileMenu table loaded by screenpack.lua
txt_achievementsTitle = createTextImg(jgFnt, 0, -1, "ACHIEVEMENT PROGRESS:", 218, 11)
txt_achievementsProgress = createTextImg(jgFnt, 2, 1, "", 223.5, 11)
txt_achievementInfo = createTextImg(font2, 0, 1, "", 0, 0)

achievementCommonPosX = 1.5 --Allow set common pos for all previews
achievementCommonPosY = 72.5

achievementCommonScaleX = 0.71 --Allow set common scale for all previews
achievementCommonScaleY = 0.675

achievementSpacing = 70

--Achievement Slot
achievementSlot = animNew(sprIkemen, [[
240,0, 0,0, -1
]])
animSetScale(achievementSlot, 0.5, 0.5)
animUpdate(achievementSlot)

--Achievement Complete Slot Icon
achievementSlotDone = animNew(sprIkemen, [[
241,0, 0,0, -1
]])
animSetScale(achievementSlotDone, 0.5, 0.5)
animUpdate(achievementSlotDone)

--Achievement Locked Icon
achievementLocked = animNew(sprIkemen, [[
108,0, 0,0, -1
]])
animSetScale(achievementLocked, 0.08, 0.08)
animUpdate(achievementLocked)

--Achievement Transparent 
achievementTBG = animNew(sprIkemen, [[
3,0, 0,0, -1
]])
animSetPos(achievementTBG, 0, 20)
animSetAlpha(achievementTBG, 20, 100)
animUpdate(achievementTBG)

function f_achievementSlot(posX, posY, itemNo)
	local NewPosX = posX or 0
	local NewPosY = posY or 0
	local itemNo = itemNo
	local sprGroup = 0
	local sprIndex = 0
	local unlocked = false
	local txtRewardColor = 0
	local infoSpacing = 10
	local infoLimit = 55
	if stats.trophies[t_achievements[itemNo].id].rewardclaimed then txtRewardColor = 2 end
--Draw Achievement Slot
	animSetScale(achievementTBG, 280, 38)
	animPosDraw(achievementTBG, 40+NewPosX, 76+NewPosY)
	animPosDraw(achievementSlot, 0+NewPosX, 70+NewPosY)
--If the achievement is unlocked
	if t_unlockLua.achievements[t_achievements[itemNo].id] == nil then
		unlocked = true
		sprGroup = t_achievements[itemNo].previewspr[1] --Get Sprites
		sprIndex = t_achievements[itemNo].previewspr[2]
	end
--Draw Achievement Icon
	f_drawSprPreview(sprAchievements,
		sprGroup, sprIndex,
		t_achievements[itemNo].previewpos[1]+NewPosX, t_achievements[itemNo].previewpos[2]+NewPosY,
		t_achievements[itemNo].previewscale[1], t_achievements[itemNo].previewscale[2]
	)
--Draw Done Achievement Icon
	if unlocked then
		animPosDraw(achievementSlotDone, 0+NewPosX, 70+NewPosY)
--Draw Locked Icon
	else
		--animPosDraw(achievementLocked, 11+NewPosX, 78+NewPosY)
	end
--Draw Info Text
	f_textRender(txt_achievementInfo, t_achievements[itemNo].info, 0, 50+NewPosX, 87+NewPosY, infoSpacing, 0, infoLimit)
	f_drawQuickText(txt_achievementReward, jgFnt, txtRewardColor, 1, t_achievements[itemNo].reward.." IKC", 1+NewPosX, 126+NewPosY)
end

--Menu Arrows
function f_resetAchievementsArrowsPos()
animSetPos(menuArrowUp, 305, 14)
animSetPos(menuArrowDown, 305, 220)
end

--Achievements Input Hints Panel
function drawAchievementInputHints()
	local inputHintYPos = 219
	local hintFont = font2
	local hintFontYPos = 233
	animPosDraw(inputHintsBG, -56, 219)
	drawMenuInputHints("u","40,"..inputHintYPos,"d","60,"..inputHintYPos,"s","127,"..inputHintYPos,"e","225,"..inputHintYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Select", 81, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Claim Reward", 148, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Return", 246, hintFontYPos)
end

--Achievement Display BG
achievementInfoBG = animNew(sprIkemen, [[
3,0, 0,0, -1
]])
animSetScale(achievementInfoBG, 170, 55)
animSetAlpha(achievementInfoBG, 0, 50)
animUpdate(achievementInfoBG)

t_pendingTrophy = {}
function achievementDisplayReset()
trophyPosX = 0
trophyPosY = 0
trophyTime = 0
currentTrophyID = nil
trophyReady = false
table.remove(t_pendingTrophy, #t_pendingTrophy)
if data.debugLog then f_printTable(t_pendingTrophy, "save/debug/t_pendingTrophy.log") end
end
achievementDisplayReset()

function achievementDisplay(id)
	local id = id
	local infoSpacing = 10
	local infoLimit = 35
--Default Pos
	local trophyBGX = -2
	local trophyBGY = 280
	
	local trophyTitleX = 2
	local trophyTitleY = 290
	
	local trophyNameX = 35
	local trophyNameY = 301
	
	local trophyInfoX = 35
	local trophyInfoY = 312
	
	local trophyIconX = 0
	local trophyIconY = 294
--New Pos Target
	local trophyTargetPosX = 0
	local trophyTargetPosY = -100
--Scroll Logic to Show
	if trophyPosY > trophyTargetPosY and trophyTime < 100 then
		trophyPosY = trophyPosY - 5
	end
--Wait before Hide again
	if trophyTime < 150 and trophyPosY <= trophyTargetPosY then
		--if trophyPosY > trophyTargetPosY then trophyPosY = trophyTargetPosY end --fix pos
		trophyTime = trophyTime + 1
	end
--Scroll Logic to Hide
	if trophyTime >= 150 and trophyPosY < 0 then
		trophyPosY = trophyPosY + 2
		if trophyPosY > 0 then trophyPosY = 0 end --fix pos
	end
	if data.debugMode then
		f_drawQuickText(txt_debug1, jgFnt, 0, 1, "TrophyPosY:"..trophyPosY, 150, 50)
		f_drawQuickText(txt_debug2, jgFnt, 0, 1, "TrophyTimer:"..trophyTime, 150, 70)
	end
--Draw Achievement Icon
	animPosDraw(achievementInfoBG, trophyBGX+trophyPosX, trophyBGY+trophyPosY)
	f_drawSprPreview(sprAchievements,
		t_achievements[id].previewspr[1], t_achievements[id].previewspr[2],
		trophyIconX+trophyPosX, trophyIconY+trophyPosY,
		0.51, 0.475
	)
--Draw Info Text
	f_drawQuickText(txt_TrophyTitleFight, jgFnt, 0, 1, "ACHIEVEMENT UNLOCKED!", trophyTitleX+trophyPosX, trophyTitleY+trophyPosY)
	f_drawQuickText(txt_TrophyNameFight, font2, 5, 1, t_achievements[id].name, trophyNameX+trophyPosX, trophyNameY+trophyPosY)
	f_textRender(txt_TrophyInfoFight, t_achievements[id].info, 0, trophyInfoX+trophyPosX, trophyInfoY+trophyPosY, infoSpacing, 0, infoLimit, 3)
--Allow Display Next Achievement
	if trophyPosY == 0 then
		stats.trophies[t_achievements[id].id].displayed = true
		f_saveStats()
		achievementDisplayReset()
	end
end

function achievements()
	if trophyReady and currentTrophyID then
		achievementDisplay(currentTrophyID)
	end
	if #t_pendingTrophy ~= 0 then
		if currentTrophyID == nil then
			currentTrophyID = t_pendingTrophy[#t_pendingTrophy].trophyID
			trophyReady = true
		end
	end
end
--;===========================================================
--; LOAD ACHIEVEMENTS.DEF DATA
--;===========================================================
function f_loadAchievements()
t_achievements = {}
local file = io.open(achievementDef, "r")
	if file ~= nil then
		local section = 0
		local row = 0
		local content = file:read("*all")
		file:close()
		content = content:gsub('([^\r\n]*)%s*;[^\r\n]*', '%1')
		content = content:gsub('\n%s*\n', '\n')
		for line in content:gmatch('[^\r\n]+') do
			local lineLower = line:lower()
		--[Achievement No]
			if lineLower:match('^%s*%[%s*achievement%s+%d+%s*%]') then
				section = 1
				row = #t_achievements + 1
			--Set Default Values
				t_achievements[row] = {
					previewspr = {0, 0},
					previewpos = {achievementCommonPosX, achievementCommonPosY},
					previewscale = {achievementCommonScaleX, achievementCommonScaleY},
					subcount = "1/1",
					reward = 0,
					txtID = textImgNew(),
					name = "???",
					info = "",
					unlock = "false"
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
						t_achievements[row][param] = tbl
					else
						t_achievements[row][param] = value:match('^%s*(.-)%s*$') --Store value as string
					end
				end
			end
		end
	--Send Achievements Unlock Condition to t_unlockLua table
		for _, v in ipairs(t_achievements) do
			t_unlockLua.achievements[v.id] = v.unlock
		end
		f_updateUnlocks()
		if data.debugLog then f_printTable(t_achievements, "save/debug/t_achievements.log") end
	--[[
		textImgSetText(txt_loading, "LOADING ACHIEVEMENTS...")
		textImgDraw(txt_loading)
		refresh()
	]]
	end
	f_setAchievement()
end
f_loadAchievements()
--;===========================================================
--; ACHIEVEMENTS MENU (collect a customizable list of milestones to claim rewards)
--;===========================================================
function f_achievementsMenu()
	if data.debugMode then f_loadAchievements() end --Load in real-time only if dev/debug mode is enabled
	if #t_achievements == 0 then
		achievementInfo = true
		infoScreen = true
		return
	end
	cmdInput()
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	local itemSel = 1
	local cursorPosY = 1
	local moveSlot = 0
	local maxItems = 3
	local t_data = t_achievements
	claimRewardScreen = false
	f_resetAchievementsArrowsPos()
	f_unlock(false)
	f_updateUnlocks()
	data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', sprFade)
	while true do
		if not claimRewardScreen then
		--Close Menu
			if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
				sndPlay(sndSys, 100, 2)
				data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', sprFade)
				break
			end
		--Scroll Logic
			if commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30) then
				sndPlay(sndSys, 100, 0)
				itemSel = itemSel - 1
			elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30) then
				sndPlay(sndSys, 100, 0)
				itemSel = itemSel + 1
		--Slot Select
			elseif (btnPalNo(p1Cmd, true) > 0 or btnPalNo(p2Cmd, true) > 0) then
			--NO REWARD TO CLAIM
				if t_unlockLua.achievements[t_achievements[itemSel].id] ~= nil or stats.trophies[t_achievements[itemSel].id].rewardclaimed then
					sndPlay(sndSys, 100, 5)
			--REWARD TO CLAIM
				else
					sndPlay(sndSys, 201, 2)
					stats.trophies[t_achievements[itemSel].id].rewardclaimed = true
					stats.money = stats.money + t_achievements[itemSel].reward
					f_saveStats()
					--claimRewardScreen = true
				end
			end
			if itemSel < 1 then
				itemSel = #t_data
				if #t_data > maxItems then
					cursorPosY = maxItems
				else
					cursorPosY = #t_data
				end
			elseif itemSel > #t_data then
				itemSel = 1
				cursorPosY = 1
			elseif ((commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u')) or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30)) and cursorPosY > 1 then
				cursorPosY = cursorPosY - 1
			elseif ((commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd')) or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30)) and cursorPosY < maxItems then
				cursorPosY = cursorPosY + 1
			end
			if cursorPosY == maxItems then
				moveSlot = (itemSel - maxItems) * achievementSpacing
			elseif cursorPosY == 1 then
				moveSlot = (itemSel - 1) * achievementSpacing
			end	
			if #t_data <= maxItems then
				maxitemSel = #t_data
			elseif itemSel - cursorPosY > 0 then
				maxitemSel = itemSel + maxItems - cursorPosY
			else
				maxitemSel = maxItems
			end
		end
	--Draw BG
		animDraw(f_animVelocity(commonBG0, -1, -1))
	--Draw Title
		textImgDraw(txt_achievementsTitle)
		textImgSetText(txt_achievementsProgress, "[".. 28 .."%]")
		textImgDraw(txt_achievementsProgress)
		for i=1, maxitemSel do
			local nameColor = 0
			local drawCursor = false
		--Draw Slot Content
			if i > itemSel - cursorPosY then
				f_achievementSlot(0, -118+i*achievementSpacing-moveSlot, i)
			end
		--Draw Cursor Logic
			if i == itemSel then
				nameColor = 5
				drawCursor = true
			end
			f_drawQuickText(txt_achievementName, jgFnt, nameColor, 1, t_achievements[i].name, 50, 75+(-118+i*achievementSpacing-moveSlot))
			if drawCursor then
				animSetWindow(cursorBox, 48,76+(-118+i*achievementSpacing-moveSlot), 272,38)
				f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
				animDraw(f_animVelocity(cursorBox, -1, -1))
			end
		end
		if claimRewardScreen then f_claimReward(itemSel) else drawAchievementInputHints() end
		if maxitemSel > maxItems then
			animDraw(menuArrowUp)
			animUpdate(menuArrowUp)
		end
		if #t_data > maxItems and maxitemSel < #t_data then
			animDraw(menuArrowDown)
			animUpdate(menuArrowDown)
		end
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
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		cmdInput()
		refresh()
	end
end

--Achievement Reward Screen
function f_claimReward()
	
end