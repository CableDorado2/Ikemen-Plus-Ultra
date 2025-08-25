--[[=============================================================================
This Lua Module has been specifically designed for I.K.E.M.E.N. PLUS ULTRA Engine.
		Therefore, it may NOT be compatible with I.K.E.M.E.N. GO Engine.
=================================================================================]]
local excludeLuaMatch = true --This module will not load during a match (for optimization purposes)
eventDef = "script/mods/events/events.def" --Events Data (Events definition filename)
eventSpr = sffNew("script/mods/events/events.sff") --Load Events Sprites
--;===========================================================
--; EVENTS MENU SCREENPACK DEFINITION
--;===========================================================
table.insert(t_extrasMenu,5,{text = "EVENTS", gotomenu = "f_eventMenu()", id = textImgNew()}) --Insert new item to t_extrasMenu table loaded by screenpack.lua
txt_eventMenu = createTextImg(jgFnt, 0, -1, "EVENT SELECT:", 195, 10)
txt_eventProgress = createTextImg(jgFnt, 2, 1, "", 202, 10)
txt_lockedinfoTitle = createTextImg(font5, 0, 0, "INFORMATION", 156.5, 103)
txt_lockedInfo = createTextImg(jgFnt, 0, 0, "EVENT NOT AVAILABLE, TRY LATER", 159, 120, 0.6,0.6)
txt_eventCancel = "EVENT TIME UNAVAILABLE"

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
animSetScale(infoEventWindowBG, 1, 1)
animUpdate(infoEventWindowBG)

--Menu Arrows
function f_resetEventArrowsPos()
animSetPos(menuArrowLeft, 0, 123)
animSetPos(menuArrowRight, 312, 123)
end

--Events Input Hints Panel
function drawEventInputHints()
	local inputHintYPos = 219
	local hintFont = font2
	local hintFontYPos = 233
	animPosDraw(inputHintsBG, -56, 219)
	drawMenuInputHints("l","40,"..inputHintYPos,"r","60,"..inputHintYPos,"s","132,"..inputHintYPos,"e","210,"..inputHintYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Select", 81, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Confirm", 153, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Return", 231, hintFontYPos)
end

function drawInfoEventInputHints()
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
--; EVENTS MENU (complete customizable tasks at certain times)
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
	local previewTransS = nil
	local previewTransD = nil
	f_eventLockedReset()
	f_resetEventArrowsPos()
	f_unlock(false)
	f_updateUnlocks()
	f_netTimeInfoReset()
	f_resetNetTimeVars()
	netTimeInfoScreen = true
	data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', sprFade)
	while true do
	--Event Progress Logic
		stats.modes.event.clearall = (stats.modes.event.clear1 + stats.modes.event.clear2 + stats.modes.event.clear3)
		eventsData = (math.floor((stats.modes.event.clearall * 100 / 3) + 0.5)) --The number (3) is the amount of all data.eventStatus
		textImgSetText(txt_eventProgress,"["..eventsData.."%]")
		if not eventLocked and not netTimeInfoScreen then
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
			elseif btnPalNo(p1Cmd, true) > 0 or btnPalNo(p2Cmd, true) > 0 then
				sndPlay(sndSys, 100, 1)
			--EVENT AVAILABLE
				if t_unlockLua.modes[t_events[eventMenu].id] == nil and netTime ~= nil then --If the event is unlocked
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
				if t_unlockLua.modes[t_events[i].id] == nil and netTime ~= nil then --If the event is unlocked
					previewTransS = nil
					previewTransD = nil
				else
					previewTransS = 150 --Apply Transparent
					previewTransD = 0
				end
				f_drawEventPreview(
					t_events[i].previewspr[1], t_events[i].previewspr[2],
					t_events[i].previewpos[1]+i*105-moveTxt, t_events[i].previewpos[2],
					t_events[i].previewscale[1], t_events[i].previewscale[2],
					previewTransS, previewTransD
				)
			--Draw Event Slot Icon
				f_drawQuickSpr(eventSlot, eventSlotPosX+i*105-moveTxt, eventSlotPosY, eventSlotScaleX, eventSlotScaleY, previewTransS, previewTransD)
			--Draw Padlock Icon
				if t_unlockLua.modes[t_events[i].id] ~= nil or netTime == nil then
					animPosDraw(padlock, padlockEventPosX+i*105-moveTxt, padlockEventPosY)
				end
			end
		end
	--Draw Event Cursor
		if not eventLocked and not netTimeInfoScreen then
			animSetWindow(cursorBox, -100+cursorPosX*104.5,51, 100,150) --As eventMenu is the first value for cursorBox; it will move on X position (x, y) = (-100+cursorPosX*104.5, 60)
			f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
			animDraw(f_animVelocity(cursorBox, -1, -1))
		end
	--Draw Event Info
		if t_unlockLua.modes[t_events[eventMenu].id] == nil and netTime ~= nil then
			previewInfotxt = t_events[eventMenu].info
		else
		--Unable to connect to internet time. Close event
			if netTime == nil then
				if netTimeInfoScreen then previewInfotxt = "" else previewInfotxt = txt_eventCancel end
		--It's Not the time yet (Show countdown)
			else
				local t_timeDat = {
					time = t_events[eventMenu].time,
					year = t_events[eventMenu].yearstart,
					month = t_events[eventMenu].monthstart,
					day = t_events[eventMenu].daystart,
					hour = t_events[eventMenu].hourstart,
					min = t_events[eventMenu].minutestart,
					sec = t_events[eventMenu].secondstart,
				}
				previewInfotxt = f_timeCountdown(t_timeDat)
			end
		end
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
		elseif netTimeInfoScreen then f_netTimeInfo()
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

--Get Events Preview
function f_drawEventPreview(group, index, posX, posY, scaleX, scaleY, alphaS, alphaD)
	local scaleX = scaleX or 1
	local scaleY = scaleY or 1
	local alphaS = alphaS or 255
	local alphaD = alphaD or 0
	local anim = group..','..index..', 0,0, 0'
	anim = animNew(eventSpr, anim)
	animSetAlpha(anim, alphaS, alphaD)
	animSetScale(anim, scaleX, scaleY)
	animSetPos(anim, posX, posY)
	animUpdate(anim)
	animDraw(anim)
	--return anim
end

function f_netTimeInfo()
	cmdInput()
	local txt = ""
	local posX = 160
	local posY = 105
	local limit = 70
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
			txt = txt_noInternet.."\n"..netLog
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

function f_netTimeInfoReset()
	netTimeInfoScreen = false
	netTimeCount = 0
end

function f_eventLocked()
	cmdInput()
--Draw Fade BG
	animDraw(fadeWindowBG)
--Draw Menu BG
	animDraw(infoEventWindowBG)
--Draw Title
	textImgDraw(txt_lockedInfo)
--Draw Info Title Text
	textImgDraw(txt_lockedinfoTitle)
--Draw Input Hints Panel
	drawInfoEventInputHints()
--Actions
	if btnPalNo(p1Cmd, true) > 0 or btnPalNo(p2Cmd, true) > 0 then
		sndPlay(sndSys, 100, 2)
		f_eventLockedReset()
	end
end

function f_eventLockedReset()
	eventLocked = false
end

-- Función auxiliar para convertir mes en número
local monthMap = {
    Jan=1, Feb=2, Mar=3, Apr=4, May=5, Jun=6,
    Jul=7, Aug=8, Sep=9, Oct=10, Nov=11, Dec=12
}

local function monthToNumber(m)
    return monthMap[m] or 0
end

-- Función para comprobar si la fecha actual está en el rango y dar acceso al evento
function f_checkEvent(timeType, t_timeStart, t_timeDeadline)	
	-- Convertir los datos de inicio y deadline a timestamps
    local startTime = os.time({
        year = t_timeStart.year,
        month = monthToNumber(t_timeStart.month),
        day = t_timeStart.day,
        hour = t_timeStart.hour,
        min = t_timeStart.min,
        sec = t_timeStart.sec
    })

    local deadlineTime = os.time({
        year = t_timeDeadline.year,
        month = monthToNumber(t_timeDeadline.month),
        day = t_timeDeadline.day,
        hour = t_timeDeadline.hour,
        min = t_timeDeadline.min,
        sec = t_timeDeadline.sec
    })

    -- Obtener la hora actual en timestamps
    local now = nil
	if timeType == "net" then
		now = currentNetTime
	elseif timeType == "local" then
		now = os.time()
	end
	if now == nil then return false end
    -- Comprobar si la hora actual está dentro del rango
    if now >= startTime and now <= deadlineTime then
        return true
    else
        return false
    end
end

local t_timeDatStart = {
					year = t_events[eventMenu].yearstart,
					month = t_events[eventMenu].monthstart,
					day = t_events[eventMenu].daystart,
					hour = t_events[eventMenu].hourstart,
					min = t_events[eventMenu].minutestart,
					sec = t_events[eventMenu].secondstart,
				}
				
local t_timeDatDeadline = {
					year = t_events[eventMenu].yeardeadline,
					month = t_events[eventMenu].monthdeadline,
					day = t_events[eventMenu].daydeadline,
					hour = t_events[eventMenu].hourdeadline,
					min = t_events[eventMenu].minutedeadline,
					sec = t_events[eventMenu].seconddeadline,
				}				
				
f_checkEvent(t_events[eventMenu].time, t_timeDatStart, t_timeDatDeadline)
--Otra opción sería crear una variable dentro del countdown cuando está disponible o no, para usarla en lugar de hacer el chequeo repitiendo los datos


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
					yearstart = sysYear,
					yeardeadline = sysYear,
					monthstart = sysMonth,
					monthdeadline = sysMonth,
					daystart = sysDay,
					daydeadline = sysDay,
					hourstart = "01", --sysHour,
					hourdeadline = "24", --sysHour,
					minutestart = "00", --sysMinutes,
					minutedeadline = "59", --sysMinutes,
					secondstart = "0", --sysSeconds,
					seconddeadline = "59", --sysSeconds,
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
		for _, v in ipairs(t_events) do --Send Events Unlock Condition to t_unlockLua table
			t_unlockLua.modes[v.id] = v.unlock
		end
		if data.debugLog then f_printTable(t_events, "save/debug/t_events.log") end
		textImgSetText(txt_loading, "LOADING EVENTS...")
		textImgDraw(txt_loading)
		refresh()
	end
end
f_loadEvents()