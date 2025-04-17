local excludeLuaMatch = true --This module will not load during a match (for optimization purposes)
eventDef = "script/mods/events/events.def" --Events Data (Events definition filename)
--;===========================================================
--; EVENTS MENU SCREENPACK DEFINITION
--;===========================================================
table.insert(t_extrasMenu,5,{id = textImgNew(), text = "EVENTS", gotomenu = "f_eventMenu()"}) --Insert new item to t_extrasMenu table loaded by screenpack.lua
txt_eventMenu = createTextImg(jgFnt, 0, -1, "EVENT SELECT:", 195, 10)
txt_lockedInfo = createTextImg(jgFnt, 0, 0, "EVENT NOT AVAILABLE, TRY LATER", 160, 130,0.6,0.6)
txt_lockedinfoTitle = createTextImg(font5, 0, 0, "INFORMATION", 156.5, 111)
txt_lockedOk = createTextImg(jgFnt, 5, 0, "OK", 159, 151)
txt_eventProgress = createTextImg(jgFnt, 2, 1, "", 202, 10)
txt_eventIncomplete = "INCOMPLETE"
txt_eventClear = "COMPLETED"

padlockEventPosX = -83 --Padlock Position for Events Menu
padlockEventPosY = 86

eventCommonPosX = -95 --Allow set common pos for all previews
eventCommonPosY = 61

eventCommonScaleX = 1.1 --Allow set common scale for all previews
eventCommonScaleY = 1.1

--Above Transparent background
eventBG1 = animNew(sprIkemen, [[
3,0, 0,0, -1
]])
animSetPos(eventBG1, 0, 18)
animSetAlpha(eventBG1, 20, 100)
animUpdate(eventBG1)

--Below Transparent background
eventBG2 = animNew(sprIkemen, [[
3,0, 0,0, -1
]])
animSetPos(eventBG2, 3, 49)
animSetAlpha(eventBG2, 20, 100)
animUpdate(eventBG2)

--Event Slot
eventSlot = animNew(sprIkemen, [[
30,0, 0,0, -1
]])
eventSlotPosX = -100
eventSlotPosY = 51

eventSlotScaleX = 1
eventSlotScaleY = 1

--Info Window BG
infoEventWindowBG = animNew(sprIkemen, [[
230,1, 0,0, -1
]])
animSetPos(infoEventWindowBG, 83.5, 97)
animUpdate(infoEventWindowBG)
animSetScale(infoEventWindowBG, 1, 1)

function f_resetEventArrowsPos() --Used in Events Mode
animSetPos(menuArrowLeft, 0, 123)
animSetPos(menuArrowRight, 312, 123)
end

--Events Input Hints Panel
function drawEventInputHints()
	local inputHintYPos = 218
	local hintFont = font2
	local hintFontYPos = 232
	drawInputHintsP1("l","0,"..inputHintYPos,"r","20,"..inputHintYPos,"w","100,"..inputHintYPos,"e","170,"..inputHintYPos,"q","240,"..inputHintYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Select", 41, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Confirm", 121, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Return", 191, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Screenshot", 261, hintFontYPos)
end

function drawInfoEventInputHints()
	local inputHintYPos = 218
	local hintFont = font2
	local hintFontYPos = 232
	drawInputHintsP1("w","70,"..inputHintYPos,"q","190,"..inputHintYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Confirm", 91, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Screenshot", 211, hintFontYPos)
end

function f_eventTime()
	sysTime = tonumber(os.date("%H")) --Assigns the current hour to a variable based on the system clock. Used for day/night features.
	sysTime2 = tonumber(os.date("%d")) --Assigns the current day to a variable based on date. Used for daily events features.
	--sysTime3 = tonumber(os.date("%m"))
	--Clock
	if data.clock == "Standard" then
		txt_titleClock = createTextImg(font12, 0, -1, (os.date("%I:%M%p")), 314, 8)
	elseif data.clock == "Full Standard" then
		txt_titleClock = createTextImg(font12, 0, -1, (os.date("%I:%M%p:%S")), 314, 8)
	elseif data.clock == "Military" then
		txt_titleClock = createTextImg(font12, 0, -1, (os.date("%H:%M")), 314, 8)
	elseif data.clock == "Full Military" then
		txt_titleClock = createTextImg(font12, 0, -1, (os.date("%X")), 314, 8)
	end
	--Date
	if data.date == "Type A" then
		txt_titleDate = createTextImg(font12, 0, 1, (os.date("%m-%d-%y")), 8, 8)
	elseif data.date == "Type B" then
		txt_titleDate = createTextImg(font12, 0, 1, (os.date("%d-%m-%Y")), 8, 8)
	elseif data.date == "Type C" then
		txt_titleDate = createTextImg(font12, 0, 1, (os.date("%a %d.%b.%Y")), 8, 8)
	elseif data.date == "Type D" then
		txt_titleDate = createTextImg(font12, 0, 1, (os.date("%A")), 8, 8)
	elseif data.date == "Type E" then
		txt_titleDate = createTextImg(font12, 0, 1, (os.date("%B.%Y")), 8, 8)
	end
	textImgDraw(txt_titleClock) --Draw Clock
	textImgDraw(txt_titleDate) --Draw Date
end
--;===========================================================
--; EVENTS MENU (complete customizable tasks at certain hours, days, weeks, months or years)
--;===========================================================
function f_eventMenu()
	if data.debugMode then f_loadEvents() end
	if #t_events == 0 then
		eventInfo = true
		infoScreen = true
		return
	end
	cmdInput()
	local eventMenu = 1
	local cursorPosX = 1
	local moveTxt = 0
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
	f_lockedInfoReset()
	f_resetEventArrowsPos()
	data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', sprFade)
	f_unlock(false)
	f_updateUnlocks()
	while true do
	--Event Progress Logic
		stats.modes.event.clearall = (stats.modes.event.clear1 + stats.modes.event.clear2 + stats.modes.event.clear3)
		eventsData = (math.floor((stats.modes.event.clearall * 100 / 3) + 0.5)) --The number (3) is the amount of all data.eventStatus
		textImgSetText(txt_eventProgress,"["..eventsData.."%]")
		if not lockedScreen then
			if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
				f_saveStats()
				data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', sprFade)
				sndPlay(sndSys, 100, 2)
				break
			elseif commandGetState(p1Cmd, 'l') or commandGetState(p2Cmd, 'l') or ((commandGetState(p1Cmd, 'holdl') or commandGetState(p2Cmd, 'holdl')) and bufl >= 30) then
				sndPlay(sndSys, 100, 0)
				eventMenu = eventMenu - 1
			elseif commandGetState(p1Cmd, 'r') or commandGetState(p2Cmd, 'r') or ((commandGetState(p1Cmd, 'holdr') or commandGetState(p2Cmd, 'holdr')) and bufr >= 30) then
				sndPlay(sndSys, 100, 0)
				eventMenu = eventMenu + 1
			elseif btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then
				sndPlay(sndSys, 100, 1)
				--EVENT AVAILABLE
				if t_unlockLua.modes[t_events[eventMenu].id] == nil then --If the event is unlocked
					data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', sprFade)
					f_default()
					data.rosterMode = "event"
					setGameMode('event')
					data.eventNo = eventMenu --with this data.eventNo is sync with menu item selected
					if t_events[eventMenu].path ~= nil then --Detects if lua file is defined
						assert(loadfile(t_events[eventMenu].path))()
					end
					if winner == 1 then f_eventStatus() end --Save progress only if you win
					f_unlock(false)
					f_updateUnlocks()
				--EVENT UNAVAILABLE
				else
					noeventInfo = true
					lockedScreen = true
				end
			end
		--Cursor position calculation
			if eventMenu < 1 then
				eventMenu = #t_events
				if #t_events > 3 then
					cursorPosX = 3
				else
					cursorPosX = #t_events
				end
			elseif eventMenu > #t_events then
				eventMenu = 1
				cursorPosX = 1
			elseif ((commandGetState(p1Cmd, 'l') or commandGetState(p2Cmd, 'l')) or ((commandGetState(p1Cmd, 'holdl') or commandGetState(p2Cmd, 'holdl')) and bufl >= 30)) and cursorPosX > 1 then
				cursorPosX = cursorPosX - 1
			elseif ((commandGetState(p1Cmd, 'r') or commandGetState(p2Cmd, 'r')) or ((commandGetState(p1Cmd, 'holdr') or commandGetState(p2Cmd, 'holdr')) and bufr >= 30)) and cursorPosX < 3 then
				cursorPosX = cursorPosX + 1
			end
		end
		if cursorPosX == 3 then
			moveTxt = (eventMenu - 3) * 105 --Set how many space will move Event Status text
			moveImg = (eventMenu - 3) * 160 --Set how many space will move Event Preview image
		elseif cursorPosX == 1 then
			moveTxt = (eventMenu - 1) * 105
			moveImg = (eventMenu - 1) * 160
		end
		if #t_events <= 3 then
			maxEvents = #t_events
		elseif eventMenu - cursorPosX > 0 then
			maxEvents = eventMenu + 3 - cursorPosX
		else
			maxEvents = 3
		end
		animDraw(f_animVelocity(commonBG0, -1, -1))
	--Draw Event Title Transparent BG
		animSetScale(eventBG1, 319.5, 94)
		animSetWindow(eventBG1, 0,21, 320,22)
		animDraw(eventBG1)
	--Draw Title Menu
		textImgDraw(txt_eventMenu)
		textImgDraw(txt_eventProgress)
	--Draw Content Transparent BG
		animSetScale(eventBG2, 318, 154)
		animSetWindow(eventBG2, 3,49, 314,154)
		animDraw(eventBG2)
	--Set Event Progress
		if stats.modes.event.clear1 == 1 then t_events[1].status = txt_eventClear end
		if stats.modes.event.clear2 == 1 then t_events[2].status = txt_eventClear end
		if stats.modes.event.clear3 == 1 then t_events[3].status = txt_eventClear end
	--Set Scroll Logic
		for i=1, maxEvents do
			if i > eventMenu - cursorPosX then
				if i == eventMenu then
					bank = 5
				else
					bank = 0
				end
			--Draw Text for Event Status
				if t_events[i].txtID ~= nil then
					textImgDraw(f_updateTextImg(t_events[i].txtID, jgFnt, bank, 0, t_events[i].status, -50.5+i*105-moveTxt, 213)) -- [*] value needs to be equal to: moveTxt = (eventMenu - ) [*] value to keep static in each press
				end
			--Draw Event Preview Image
				if t_events[i].sprPosX ~= nil then previewPosX = t_events[i].sprPosX --Use position stored in events.def file
				else previewPosX = eventCommonPosX --Use common position loaded in screenpack.lua
				end
				if t_events[i].sprPosY ~= nil then previewPosY = t_events[i].sprPosY
				else previewPosY = eventCommonPosY
				end
				if t_events[i].sprScaleX ~= nil then previewScaleX = t_events[i].sprScaleX --Use scale stored in events.def file
				else previewScaleX = eventCommonScaleX --Use common scale loaded in screenpack.lua
				end
				if t_events[i].sprScaleY ~= nil then previewScaleY = t_events[i].sprScaleY
				else previewScaleY = eventCommonScaleY
				end
				--
				if t_unlockLua.modes[t_events[i].id] == nil then --If the event is unlocked
					previewTransS = nil
					previewTransD = nil
				else
					previewTransS = 150 --Apply Transparent
					previewTransD = 0
				end
				f_drawEventPreview(t_events[i].sprGroup, t_events[i].sprIndex, previewPosX+i*105-moveTxt, previewPosY, previewScaleX, previewScaleY, previewTransS, previewTransD)
			--Draw Event Slot Icon
				f_drawQuickSpr(eventSlot, eventSlotPosX+i*105-moveTxt, eventSlotPosY, eventSlotScaleX, eventSlotScaleY, previewTransS, previewTransD)
			--Draw Padlock Icon
				if t_unlockLua.modes[t_events[i].id] ~= nil then
					animPosDraw(padlock, padlockEventPosX+i*105-moveTxt, padlockEventPosY)
				end
			end
		end
	--Draw Event Cursor
		if not lockedScreen then
			animSetWindow(cursorBox, -100+cursorPosX*104.5,51, 100,150) --As eventMenu is the first value for cursorBox; it will move on X position (x, y) = (-100+cursorPosX*104.5, 60)
			f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
			animDraw(f_animVelocity(cursorBox, -1, -1))
		end
	--Draw Event Info
		if t_unlockLua.modes[t_events[eventMenu].id] == nil then
			previewInfotxt = t_events[eventMenu].infounlock
		else
			previewInfotxt = t_events[eventMenu].infolock
		end
		textImgDraw(f_updateTextImg(t_events[eventMenu].txtID, font11, 0, 0, previewInfotxt, 160, 34))
		f_eventTime() --Draw Date and Time
	--Draw Left Animated Cursor
		if maxEvents > 3 then
			animDraw(menuArrowLeft)
			animUpdate(menuArrowLeft)
		end
	--Draw Right Animated Cursor
		if #t_events > 3 and maxEvents < #t_events then
			animDraw(menuArrowRight)
			animUpdate(menuArrowRight)
		end
		if lockedScreen then f_lockedInfo() else drawEventInputHints() end --Show Locked Event Info Message
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
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
		cmdInput()
		refresh()
	end
end

--Get Events Preview
function f_drawEventPreview(group, index, posX, posY, scaleX, scaleY, alphaS, alphaD)
	local scaleX = scaleX or 1
	local scaleY = scaleY or 1
	local alphaS = alphaS or 255
	local alphaD = alphaD or 0
	local anim = group..','..index..', 0,0, 0'
	anim = animNew(t_events.sffData, anim)
	animSetAlpha(anim, alphaS, alphaD)
	animSetScale(anim, scaleX, scaleY)
	animSetPos(anim, posX, posY)
	animUpdate(anim)
	animDraw(anim)
	--return anim
end

--[[
function countdown(t) --TODO make a Countdown for the sysTime Event
	local d = math.floor(t / 86400)
	local h = math.floor((t % 86400) / 3600)
	local m = math.floor((t % 3600) / 60)
	local s = math.floor((t % 60))
	return string.format("%d:%02d:%02d:%02d", d, h, m, s)
end
]]

function f_lockedInfo()
	cmdInput()
	--Draw Fade BG
	animDraw(fadeWindowBG)
	--Draw Menu BG
	animDraw(infoEventWindowBG)
	animUpdate(infoEventWindowBG)
	--Draw Title
	if noeventInfo then
		textImgDraw(txt_lockedInfo)
	end
	--Draw Ok Text
	textImgDraw(txt_lockedOk)
	--Draw Cursor
	animSetWindow(cursorBox, 87,141, 144,13)
	f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
	animDraw(f_animVelocity(cursorBox, -1, -1))
	--Draw Info Title Text
	textImgDraw(txt_lockedinfoTitle)
	--Draw Input Hints Panel
	drawInfoEventInputHints()
	--Actions
	if btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then
		sndPlay(sndSys, 100, 2)
		f_lockedInfoReset()
	end
	cmdInput()
end

function f_lockedInfoReset()
	lockedScreen = false
	noeventInfo = false
end

--;===========================================================
--; EVENT SAVE DATA
--;===========================================================
function f_eventStatus()
	if data.eventNo == 1 then stats.modes.event.clear1 = 1
	elseif data.eventNo == 2 then stats.modes.event.clear2 = 1
	elseif data.eventNo == 3 then stats.modes.event.clear3 = 1
	end
	f_saveStats()
end

--;===========================================================
--; LOAD EVENTS.DEF DATA
--;===========================================================
function f_loadEvents()
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
	if data.debugLog then f_printTable(t_events, "save/debug/t_events.txt") end
	textImgSetText(txt_loading, "LOADING EVENTS...")
	textImgDraw(txt_loading)
	refresh()
end
f_loadEvents()