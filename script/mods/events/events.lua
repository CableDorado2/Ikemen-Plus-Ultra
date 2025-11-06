local loadLuaModule = true
--[[=============================================================================
This Lua Module has been specifically designed for I.K.E.M.E.N. PLUS ULTRA Engine.
		Therefore, it may NOT be compatible with I.K.E.M.E.N. GO Engine.
=================================================================================]]
local eventDef = "script/mods/events/events.def" --Events Data (Events definition filename)
local eventSpr = sffNew("script/mods/events/events.sff") --Load Events Sprites
--;===========================================================
--; EVENTS MENU SCREENPACK DEFINITION
--;===========================================================
table.insert(t_extrasMenu,5,{text = "EVENTS", gotomenu = "f_eventMenu()", id = textImgNew()}) --Insert new item to t_extrasMenu table loaded by screenpack.lua
local txt_localTime = createTextImg(jgFnt, 0, -1, "", 318, 9)
local txt_internetTime = createTextImg(jgFnt, 0, -1, "", 318, 20)

local txt_eventMenu = createTextImg(jgFnt, 0, -1, "EVENT SELECT:", 195, 51)
local txt_eventProgress = createTextImg(jgFnt, 2, 1, "", 202, 51)

local txt_lockedinfoTitle = createTextImg(font5, 0, 0, "INFORMATION", 156.5, 103)
local txt_lockedInfo = createTextImg(jgFnt, 0, 0, "", 159, 117, 0.6,0.6)
local txt_eventNoInternet = createTextImg(jgFnt, 5, 0, txt_noInternet, 160, 105, 0.7, 0.7)

local txt_eventCancel = "EVENT TIME UNAVAILABLE"
local txt_eventStatsData = "Events Completed"

local txt_eventIncomplete = "INCOMPLETE"
local txt_eventClear = "COMPLETED"

local padlockEventPosX = -83 --Padlock Position for Events Menu
local padlockEventPosY = 90

local eventCommonPosX = -95 --Allow set common pos for all previews
local eventCommonPosY = 64

local eventCommonScaleX = 1.1 --Allow set common scale for all previews
local eventCommonScaleY = 1.1

--Above Transparent background
local eventBG1 = animNew(sprIkemen, [[
3,0, 0,0, -1
]])
animSetPos(eventBG1, 0, 18)
animSetAlpha(eventBG1, 20, 100)
animUpdate(eventBG1)

--Below Transparent background
local eventBG2 = animNew(sprIkemen, [[
3,0, 0,0, -1
]])
animSetPos(eventBG2, 3, 53)
animSetAlpha(eventBG2, 20, 100)
animUpdate(eventBG2)

--Event Slot
local eventSlot = animNew(sprIkemen, [[
30,0, 0,0, -1
]])
eventSlotPosX = -100
eventSlotPosY = 54

eventSlotScaleX = 1
eventSlotScaleY = 1

--Info Window BG
local infoEventWindowBG = animNew(sprIkemen, [[
230,1, 0,0, -1
]])
animSetPos(infoEventWindowBG, 83.5, 97)
animSetScale(infoEventWindowBG, 1, 1)
animUpdate(infoEventWindowBG)

--Menu Arrows
local function f_resetEventArrowsPos()
animSetPos(menuArrowLeft, 0, 123)
animSetPos(menuArrowRight, 312, 123)
end

--Events Input Hints Panel
local function drawEventInputHints()
	local inputHintYPos = 219
	local hintFont = font2
	local hintFontYPos = 233
	animPosDraw(inputHintsBG, -56, 219)
	drawMenuInputHints("l","40,"..inputHintYPos,"r","60,"..inputHintYPos,"s","132,"..inputHintYPos,"e","210,"..inputHintYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Select", 81, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Confirm", 153, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Return", 231, hintFontYPos)
end

local function drawInfoEventInputHints()
	local inputHintYPos = 134
	local hintFont = font2
	local hintFontYPos = 148
--Draw Cursor
	animSetWindow(cursorBox, 87,134, 144.5,20)
	f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
	animDraw(f_animVelocity(cursorBox, -1, -1))
--Draw Inputs
	drawMenuInputHints("s","137,"..inputHintYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Accept", 158, hintFontYPos)
end
--;===========================================================
--; EVENT INFO SCREEN
--;===========================================================
local function f_eventLockedReset()
	eventLocked = false
end
local function f_eventLocked()
	cmdInput()
--Draw Fade BG
	animDraw(fadeWindowBG)
--Draw Menu BG
	animDraw(infoEventWindowBG)
--Draw Title
	textImgDraw(txt_lockedinfoTitle)
--Draw Info
	f_textRender(txt_lockedInfo, "EVENT NOT AVAILABLE\nTRY LATER", 0, 159, 117, 10, 0, 50)
--Draw Input Hints Panel
	drawInfoEventInputHints()
--Actions
	if btnPalNo(p1Cmd, true) > 0 or btnPalNo(p2Cmd, true) > 0 then
		sndPlay(sndSys, 100, 2)
		f_eventLockedReset()
	end
end
--;===========================================================
--; EVENT TIME CHECKS FUNCTIONS
--;===========================================================
--Connecting to Internet Time Screen
local function f_netTimeInfoReset()
	netTimeInfoScreen = false
	netTimeCount = 0
end
local function f_netTimeInfo()
	cmdInput()
	local txt = ""
	local posX = 160
	local posY = 108
	local limit = 40
--Draw Fade BG
	animDraw(fadeWindowBG)
--Draw Menu BG
	animDraw(infoWindowBG)
--Draw Info Title Text
	textImgDraw(txt_infoTitle)
--Connect to Internet Time
	if netTimeCount > 30 then
		if netTimeCount < 32 then loadNetTime() end
	--Unable to Connect
		if netTime == nil then
			textImgDraw(txt_eventNoInternet)
			txt = netLog
			posY = posY + 10
		--Draw Input Hints Panel
			drawInfoInputHints()
		--Accept Button
			if btnPalNo(p1Cmd, true) > 0 or btnPalNo(p2Cmd, true) > 0 then
				sndPlay(sndSys, 100, 2)
				f_netTimeInfoReset()
			end
		else
			f_netTimeInfoReset()
		end
--Waiting to Connect
	else
		txt = txt_connectingNet
		netTimeCount = netTimeCount + 1
	end
--Draw Info Text
	f_textRender(txt_info, txt, 0, posX, posY, 10, 0, limit)
end

--Function to check if the current date is in range and give access to the event
local function f_checkEvent(timeType, t_timeStart, t_timeDeadline)
--Convert start and deadline data to timestamps
	local startTime = os.time({
		year = t_timeStart.year,
		month = f_monthToNumber(t_timeStart.month),
		day = t_timeStart.day,
		hour = t_timeStart.hour,
		min = t_timeStart.min,
		sec = t_timeStart.sec
	})
	local deadlineTime = os.time({
		year = t_timeDeadline.year,
		month = f_monthToNumber(t_timeDeadline.month),
		day = t_timeDeadline.day,
		hour = t_timeDeadline.hour,
		min = t_timeDeadline.min,
		sec = t_timeDeadline.sec
	})
--Get current hour in timestamps
	local now = nil
	if timeType == "net" then
		now = currentNetTime
	elseif timeType == "local" then
		now = os.time()
	end
	if now == nil then return false end
--Check if the current time is within range
	if now >= startTime and now <= deadlineTime then
		return true
	else
		return false
	end
end

local function f_getTimeDat(moment, id)
	local t = {}
	if moment == "start" then
		t = {
			year = t_events[id].yearstart,
			month = t_events[id].monthstart,
			day = t_events[id].daystart,
			hour = t_events[id].hourstart,
			min = t_events[id].minutestart,
			sec = t_events[id].secondstart,
		}
	elseif moment == "deadline" then
		t = {
			year = t_events[id].yeardeadline,
			month = t_events[id].monthdeadline,
			day = t_events[id].daydeadline,
			hour = t_events[id].hourdeadline,
			min = t_events[id].minutedeadline,
			sec = t_events[id].seconddeadline,
		}
	end
	return t
end
--;===========================================================
--; LOAD EVENTS.DEF DATA
--;===========================================================
local function f_createEventDat()
	if stats.modes.event == nil then
		stats.modes.event = {}
		stats.modes.event.playtime = 0
		--stats.modes.event.clearall = 0
		modified = true
	end
	for i=1, #t_events do
		local modified = false
		if stats.modes.event[t_events[i].id] == nil then
			stats.modes.event[t_events[i].id] = {}
			modified = true
		end
		if stats.modes.event[t_events[i].id].clear == nil then
			stats.modes.event[t_events[i].id].clear = false
			modified = true
		end
	end
	if modified then f_saveStats() end
end

local function f_loadEvents()
textImgSetText(txt_loading, "LOADING EVENTS...")
textImgDraw(txt_loading)
refresh()
f_resetNetTimeVars()
loadNetTime() --Required to set netYear, netMonth and netDay vars
	t_events = {}
	local file = io.open(eventDef, "r")
	if file ~= nil then
		local section = 0
		local row = 0
		local content = file:read("*all")
		file:close()
		content = content:gsub('([^\r\n]*)%s*;[^\r\n]*', '%1')
		content = content:gsub('\n%s*\n', '\n')
		for line in content:gmatch('[^\r\n]+') do
			local lineLower = line:lower()
		--[Event No]
			if lineLower:match('^%s*%[%s*event%s+%d+%s*%]') then
				section = 1
				row = #t_events + 1
			--Set Default Values
				t_events[row] = {
					previewspr = {0, 0},
					previewpos = {eventCommonPosX, eventCommonPosY},
					previewscale = {eventCommonScaleX, eventCommonScaleY},
					status = txt_eventIncomplete,
					txtID = textImgNew(),
					info = "???",
					time = "local", --use local time if is not defined
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
						t_events[row][param] = tbl
					else
						t_events[row][param] = value:match('^%s*(.-)%s*$') --Store value as string
					end
				end
			end
		end
	--Set Date/Clock values
		for _, event in ipairs(t_events) do
		--Use local time by default
			local yearIni = sysYear
			local yearEnd = sysYear --sysYear+1
			local monthIni = sysMonth
			local monthEnd = sysMonth --Dec
			local dayIni = sysDay
			local dayEnd = sysDay --30
			local hourIni = "01" --sysHour
			local hourEnd = "24"
			local minuteIni = "00" --sysMinutes
			local minuteEnd = "59"
			local secondIni = "0" --sysSeconds
			local secondEnd = "59"
		--Update all previous var using internet time ONLY if event "time" is set as "net"
			if event.time:lower() == "net" then
			--If can't connect to internet then use local "sys" values to avoid issues with f_checkEvent() function
				yearIni = netYear or sysYear
				yearEnd = netYear or sysYear
				monthIni = netMonth or sysMonth
				monthEnd = netMonth or sysMonth
				dayIni = netDay or sysDay
				dayEnd = netDay or sysDay
				hourIni = "01"
				hourEnd = "24"
				minuteIni = "00"
				minuteEnd = "59"
				secondIni = "0"
				secondEnd = "59"
			end
		--Update fields that was not found in events.def file
			event.yearstart = event.yearstart or yearIni
			event.yeardeadline = event.yeardeadline or yearEnd
			
			event.monthstart = event.monthstart or monthIni
			event.monthdeadline = event.monthdeadline or monthEnd
			
			event.daystart = event.daystart or dayIni
			event.daydeadline = event.daydeadline or dayEnd
			
			event.hourstart = event.hourstart or hourIni
			event.hourdeadline = event.hourdeadline or hourEnd
			
			event.minutestart = event.minutestart or minuteIni
			event.minutedeadline = event.minutedeadline or minuteEnd
			
			event.secondstart = event.secondstart or secondIni
			event.seconddeadline = event.seconddeadline or secondEnd
		--Send Events Unlock Condition to t_unlockLua table
			t_unlockLua.modes[event.id] = event.unlock
		end
		f_createEventDat()
		f_updateUnlocks()
		if data.debugLog then f_printTable(t_events, "save/debug/t_events.log") end
	end
end
f_loadEvents() --Loads when engine starts
--;===========================================================
--; EVENT SAVE DATA
--;===========================================================
local function f_eventStatus()
	stats.modes.event[t_events[data.eventNo].id].clear = true
	f_saveStats()
end
function f_getEventStats()
	if #t_events == 0 then
		return ""
	else
		return f_getProgress(stats.modes.event, t_events, "clearcount").."/"..#t_events
	end
end
table.insert(t_statsMenu,#t_statsMenu,{text = txt_eventStatsData, varText = f_getEventStats(), varID = textImgNew()}) --Insert new item to t_statsMenu table loaded by screenpack.lua
--Insert new item to t_statsGameModes table loaded by main.lua
table.insert(t_statsGameModes,1,
	{
		displayname = "Events", --Text to Display in Stats Menu
		id = "event", --id to compare with data.rosterMode var
		playtime = function() return stats.modes.event.playtime end,
		setplaytime = function(newtime) stats.modes.event.playtime = newtime end
	}
)

function f_refreshEventStats()
	for i=1, #t_statsMenu do
		if t_statsMenu[i].text == txt_eventStatsData then
			t_statsMenu[i].varText = f_getEventStats()
		end
	end
end
--;===========================================================
--; EVENTS MENU (complete customizable tasks at certain times)
--;===========================================================
function f_eventMenu()
	if data.debugMode then f_loadEvents() end
	if #t_events == 0 then
		eventInfo = true
		infoScreen = true
		return
	end
	f_discordUpdate({details = "Events"})
	cmdInput()
	local eventMenu = 1
	local cursorPosX = 1
	local moveTxt = 0
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	local previewInfotxt = nil
	local previewTransS = nil
	local previewTransD = nil
	local netInfoTimeTxt = nil
	f_eventLockedReset()
	f_resetEventArrowsPos()
	f_unlock(false)
	f_updateUnlocks()
	f_netTimeInfoReset()
	f_resetNetTimeVars()
	netTimeInfoScreen = true
	data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', sprFade)
	while true do
		if not eventLocked and not netTimeInfoScreen then
			if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
				f_discordMainMenu()
				f_saveStats()
				f_getStats(f_refreshEventStats()) --To refresh stats
				data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', sprFade)
				sndPlay(sndSys, 100, 2)
				break
			elseif commandGetState(p1Cmd, 'l') or commandGetState(p2Cmd, 'l') or ((commandGetState(p1Cmd, 'holdl') or commandGetState(p2Cmd, 'holdl')) and bufl >= 30) then
				sndPlay(sndSys, 100, 0)
				eventMenu = eventMenu - 1
			elseif commandGetState(p1Cmd, 'r') or commandGetState(p2Cmd, 'r') or ((commandGetState(p1Cmd, 'holdr') or commandGetState(p2Cmd, 'holdr')) and bufr >= 30) then
				sndPlay(sndSys, 100, 0)
				eventMenu = eventMenu + 1
			elseif btnPalNo(p1Cmd, true) > 0 or btnPalNo(p2Cmd, true) > 0 then
				sndPlay(sndSys, 100, 1)
			--EVENT AVAILABLE
				if f_checkEvent(t_events[eventMenu].time, f_getTimeDat("start", eventMenu), f_getTimeDat("deadline", eventMenu)) and t_unlockLua.modes[t_events[eventMenu].id] == nil then --If the event is unlocked
					f_default()
					data.rosterMode = "event"
					setGameMode('event')
					data.eventNo = eventMenu --with this data.eventNo is sync with menu item selected
					data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', sprFade)
					if t_events[eventMenu].path ~= nil then --Detects if lua file is defined
						assert(loadfile(t_events[eventMenu].path))()
					end
					if winner == 1 then f_eventStatus() end --Save progress only if you win
					f_unlock(false)
					f_updateUnlocks()
			--EVENT UNAVAILABLE
				else
					eventLocked = true
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
		animSetWindow(eventBG1, 0,22, 320,20)
		animDraw(eventBG1)
	--Draw Title Menu
		textImgDraw(txt_eventMenu)
		textImgSetText(txt_eventProgress,"["..f_getProgress(stats.modes.event, t_events, "percentage").."%]")
		textImgDraw(txt_eventProgress)
		textImgSetText(txt_localTime, "LOCAL TIME: "..os.date(t_dateFormats[data.dateFormat]).."/"..os.date(t_clockFormats[data.clock].locale))
		textImgDraw(txt_localTime)
		if currentNetTime ~= nil then
			netInfoTimeTxt = netDate.."/"..netTime
		else
			netInfoTimeTxt = "UNAVAILABLE"
		end
		textImgSetText(txt_internetTime, "SERVER TIME: "..netInfoTimeTxt)
		textImgDraw(txt_internetTime)
	--Draw Content Transparent BG
		animSetScale(eventBG2, 318, 154)
		animSetWindow(eventBG2, 3,51, 314,154)
		animDraw(eventBG2)
	--Set Scroll Logic
		for i=1, maxEvents do
		--Set Event Progress
			if stats.modes.event[t_events[i].id].clear then
				t_events[i].status = txt_eventClear
			end
			if i > eventMenu - cursorPosX then
				if i == eventMenu then
					bank = 5
				else
					bank = 0
				end
			--Draw Text for Event Status
				if t_events[i].txtID ~= nil then
					textImgDraw(f_updateTextImg(t_events[i].txtID, jgFnt, bank, 0, t_events[i].status, -50.5+i*105-moveTxt, 215)) -- [*] value needs to be equal to: moveTxt = (eventMenu - ) [*] value to keep static in each press
				end
			--Draw Event Preview Image
				if f_checkEvent(t_events[i].time, f_getTimeDat("start", i), f_getTimeDat("deadline", i)) and t_unlockLua.modes[t_events[i].id] == nil then --If the event is unlocked
					previewTransS = nil
					previewTransD = nil
				else
					previewTransS = 150 --Apply Transparent
					previewTransD = 0
				end
				f_drawSprPreview(eventSpr,
					t_events[i].previewspr[1], t_events[i].previewspr[2],
					t_events[i].previewpos[1]+i*105-moveTxt, t_events[i].previewpos[2],
					t_events[i].previewscale[1], t_events[i].previewscale[2],
					previewTransS, previewTransD
				)
			--Draw Event Slot Icon
				f_drawQuickSpr(eventSlot, eventSlotPosX+i*105-moveTxt, eventSlotPosY, eventSlotScaleX, eventSlotScaleY, previewTransS, previewTransD)
			--Draw Padlock Icon
				if not f_checkEvent(t_events[i].time, f_getTimeDat("start", i), f_getTimeDat("deadline", i)) or t_unlockLua.modes[t_events[i].id] ~= nil then
					animPosDraw(padlock, padlockEventPosX+i*105-moveTxt, padlockEventPosY)
				end
			end
		end
	--Draw Event Cursor
		if not eventLocked and not netTimeInfoScreen then
			animSetWindow(cursorBox, -100+cursorPosX*104.5,54, 100,150) --As eventMenu is the first value for cursorBox; it will move on X position (x, y) = (-100+cursorPosX*104.5, 60)
			f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
			animDraw(f_animVelocity(cursorBox, -1, -1))
		end
	--Draw Event Info
		if f_checkEvent(t_events[eventMenu].time, f_getTimeDat("start", eventMenu), f_getTimeDat("deadline", eventMenu)) and t_unlockLua.modes[t_events[eventMenu].id] == nil then
			previewInfotxt = t_events[eventMenu].info --Event Available
		else
		--An Unlock Condition is required to play the event
			if t_unlockLua.modes[t_events[eventMenu].id] ~= nil then
				previewInfotxt = "AN UNLOCK CONDITION IS REQUIRED TO PLAY THIS EVENT"
		--It's Not the Start Time yet
			else
			--Show Start Time Countdown --Falta hacer lo mismo con la Deadline date
				local t_startTime = {
					time = t_events[eventMenu].time,
					year = t_events[eventMenu].yearstart,
					month = t_events[eventMenu].monthstart,
					day = t_events[eventMenu].daystart,
					hour = t_events[eventMenu].hourstart,
					min = t_events[eventMenu].minutestart,
					sec = t_events[eventMenu].secondstart,
				}
				previewInfotxt = f_timeCountdown(t_startTime)
			--Unable to check internet time, close event
				if t_events[eventMenu].time == "net" and netTime == nil then
					previewInfotxt = txt_eventCancel
				end
			end
		end
		if netTimeInfoScreen then previewInfotxt = "" end
		textImgDraw(f_updateTextImg(t_events[eventMenu].txtID, font11, 0, 0, previewInfotxt, 160, 34))
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
		if eventLocked then f_eventLocked() --Show Locked Event Info Message
		elseif netTimeInfoScreen then f_netTimeInfo() --Show Connecting to Internet Time Info Message
		else drawEventInputHints()
		end
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