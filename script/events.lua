
module(..., package.seeall)

--;===========================================================
--; EVENTS SCREENPACK
--;===========================================================
--Scrolling background
eventBG0 = animNew(sysSff, [[
100,0, 0,0, -1
]])
animAddPos(eventBG0, 160, 0)
animSetTile(eventBG0, 1, 1)
animSetColorKey(eventBG0, -1)

--Above Transparent background
eventBG1 = animNew(sysSff, [[
3,0, 0,0, -1
]])
animSetPos(eventBG1, 0, 21)
animSetAlpha(eventBG1, 20, 100)
animUpdate(eventBG1)

--Below Transparent background
eventBG2 = animNew(sysSff, [[
3,0, 0,0, -1
]])
animSetPos(eventBG2, 3, 52)
animSetAlpha(eventBG2, 20, 100)
animUpdate(eventBG2)

--Right Menu Arrow
arrowsER = animNew(sysSff, [[
221,0, 0,0, 10
221,1, 0,0, 10
221,2, 0,0, 10
221,3, 0,0, 10
221,4, 0,0, 10
221,3, 0,0, 10
221,2, 0,0, 10
221,1, 0,0, 10
221,0, 0,0, 10
]])
animAddPos(arrowsER, 303, 123)
animUpdate(arrowsER)
animSetScale(arrowsER, 1.7, 1.7)

--Left Menu Arrow
arrowsEL = animNew(sysSff, [[
221,5, 0,0, 10
221,6, 0,0, 10
221,7, 0,0, 10
221,8, 0,0, 10
221,9, 0,0, 10
221,8, 0,0, 10
221,7, 0,0, 10
221,6, 0,0, 10
221,5, 0,0, 10
]])
animAddPos(arrowsEL, 0, 123)
animUpdate(arrowsEL)
animSetScale(arrowsEL, 1.7, 1.7)

--;===========================================================
--; EVENT LOCKED INFO SCREEN
--;===========================================================
txt_lockedinfoTitle = createTextImg(font5, 0, 0, "INFORMATION", 156.5, 111)
txt_lockedOk = createTextImg(jgFnt, 5, 0, "OK", 159, 151)

--Info Window BG
infoEventWindowBG = animNew(sysSff, [[
230,1, 0,0,
]])
animSetPos(infoEventWindowBG, 83.5, 97)
animUpdate(infoEventWindowBG)
animSetScale(infoEventWindowBG, 1, 1)

function f_lockedInfo()
	cmdInput()
	--Draw Fade BG
	animDraw(fadeWindowBG)
	--Draw Menu BG
	animDraw(infoEventWindowBG)
	animUpdate(infoEventWindowBG)
	--Draw Title
	if eventInfo == true then
		txt_lockedInfo = createTextImg(jgFnt, 0, 0, "EVENT NOT AVAILABLE, TRY LATER", 160, 130,0.6,0.6)
	end
	textImgDraw(txt_lockedInfo)
	--Draw Ok Text
	textImgDraw(txt_lockedOk)
	--Draw Cursor
	animSetWindow(cursorBox, 87,141, 144,13)
	f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
	animDraw(f_animVelocity(cursorBox, -1, -1))
	--Draw Info Title Text
	textImgDraw(txt_lockedinfoTitle)
	--Actions
	if btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then
		sndPlay(sysSnd, 100, 2)
		f_lockedInfoReset()
	end
	cmdInput()
end

function f_lockedInfoReset()
	lockedScreen = false
	eventInfo = false
end

--;===========================================================
--; EVENTS IMAGES
--;===========================================================
--Unknown Event Unlocked Preview
eventUnknown = animNew(eventSff, [[1,0, 0,0,]])

--Event 1 Unlocked Preview
event1 = animNew(eventSff, [[0,0, 0,0,]])

--Event 1 Locked Preview
event1L = animNew(eventSff, [[0,1, 0,0,]])

--;===========================================================
--; EVENTS MENU
--;===========================================================
t_eventMenu = {
	{varID = textImgNew(), info = "PROGRAM YOUR EVENT HERE", preview = eventUnknown, status = "INCOMPLETE"}, --Add Event Slot
	{varID = textImgNew(), info = "PROGRAM YOUR EVENT HERE", preview = eventUnknown, status = "INCOMPLETE"},
	{varID = textImgNew(), info = "PROGRAM YOUR EVENT HERE", preview = eventUnknown, status = "INCOMPLETE"},
	{varID = textImgNew(), info = "PROGRAM YOUR EVENT HERE", preview = eventUnknown, status = ""},
	{varID = textImgNew(), info = "PROGRAM YOUR EVENT HERE", preview = eventUnknown, status = ""},
	{varID = textImgNew(), info = "PROGRAM YOUR EVENT HERE", preview = eventUnknown, status = ""},
}

--[[
function countdown(t) --TODO make a Countdown for the sysTime Event
	local d = math.floor(t / 86400)
	local h = math.floor((t % 86400) / 3600)
	local m = math.floor((t % 3600) / 60)
	local s = math.floor((t % 60))
	return string.format("%d:%02d:%02d:%02d", d, h, m, s)
end
]]

function f_eventMenu()
	cmdInput()
	playBGM(bgmEvents)
	local eventMenu = 1
	local cursorPosX = 1
	local moveTxt = 0
	local eventSelect = true
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	local eventExit = false
	f_lockedInfoReset()
	data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
	while true do
	--Event Progress Logic
		data.eventsProgress = (data.event1Status + data.event2Status + data.event3Status)
		eventsData = (math.floor((data.eventsProgress * 100 / 3) + 0.5)) --The number (3) is the amount of all data.eventStatus
		txt_eventMenu = createTextImg(jgFnt, 0, -1, "EVENT SELECT:", 195, 10)
		txt_eventProgress = createTextImg(jgFnt, 2, 1, "["..eventsData.."%]", 202, 10) --needs to be inside of event Menu function, to load event data %
		txt_selEvent = createTextImg(jgFnt, 0, 0, "BACK TO MAIN MENU", 160, 238)
		if lockedScreen == false then
			if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') or eventExit then
				f_saveProgress()
				f_menuMusic()
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 2)
				break
			elseif commandGetState(p1Cmd, 'l') or commandGetState(p2Cmd, 'l') or ((commandGetState(p1Cmd, 'holdl') or commandGetState(p2Cmd, 'holdl')) and bufl >= 30) then
				if eventSelect == true then
					sndPlay(sysSnd, 100, 0)
					eventMenu = eventMenu - 1
				end
			elseif commandGetState(p1Cmd, 'r') or commandGetState(p2Cmd, 'r') or ((commandGetState(p1Cmd, 'holdr') or commandGetState(p2Cmd, 'holdr')) and bufr >= 30) then
				if eventSelect == true then
					sndPlay(sysSnd, 100, 0)
					eventMenu = eventMenu + 1
				end
			elseif commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30) then
				sndPlay(sysSnd, 100, 0)
				if eventSelect == true then
					eventSelect = false
				elseif eventSelect == false then
					eventSelect = true
				end
			elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30) then
				sndPlay(sysSnd, 100, 0)
				if eventSelect == true then
					eventSelect = false
				elseif eventSelect == false then
					eventSelect = true
				end
			elseif btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then
				if eventSelect == true then
					f_default()
					data.rosterMode = "event"
					setGameMode('event')
					data.eventNo = eventMenu --with this data.eventNo is sync with menu item selected
					data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
					sndPlay(sysSnd, 100, 1)
				--EVENT 1
					if eventMenu == 1 then
						if event1Status == true then
							setRoundTime(-1)
							setRoundsToWin(1)
							data.p2In = 1
							data.p2SelectMenu = false
							data.p1TeamMenu = {mode = 0, chars = 1}
							data.p1Char = {t_charAdd["kung fu girl/master/master kung fu girl.def"]}
							data.gameMode = "survival"
							script.select.f_selectAdvance()
							if script.select.winner == 1 then f_eventStatus() end --Save progress only if you win
						elseif event1Status == false then
							eventInfo = true
							lockedScreen = true
						end
				--EVENT 2
					elseif eventMenu == 2 then
						f_eventStatus()
				--EVENT 3
					elseif eventMenu == 3 then
						f_eventStatus()
					end
			--BACK
				else
					eventExit = true
				end
			end
		--Cursor position calculation
			if eventMenu < 1 then
				eventMenu = #t_eventMenu
				if #t_eventMenu > 3 then
					cursorPosX = 3
				else
					cursorPosX = #t_eventMenu
				end
			elseif eventMenu > #t_eventMenu then
				eventMenu = 1
				cursorPosX = 1
			elseif ((commandGetState(p1Cmd, 'l') or commandGetState(p2Cmd, 'l')) or ((commandGetState(p1Cmd, 'holdl') or commandGetState(p2Cmd, 'holdl')) and bufl >= 30)) and cursorPosX > 1 then
				if eventSelect == true then
					cursorPosX = cursorPosX - 1
				end
			elseif ((commandGetState(p1Cmd, 'r') or commandGetState(p2Cmd, 'r')) or ((commandGetState(p1Cmd, 'holdr') or commandGetState(p2Cmd, 'holdr')) and bufr >= 30)) and cursorPosX < 3 then
				if eventSelect == true then
					cursorPosX = cursorPosX + 1
				end
			end
		end
		if cursorPosX == 3 then
			moveTxt = (eventMenu - 3) * 105 --Set how many space will move Event Status text
			moveImg = (eventMenu - 3) * 160 --Set how many space will move Event Preview image
		elseif cursorPosX == 1 then
			moveTxt = (eventMenu - 1) * 105
			moveImg = (eventMenu - 1) * 160
		end
		if #t_eventMenu <= 3 then
			maxEvents = #t_eventMenu
		elseif eventMenu - cursorPosX > 0 then
			maxEvents = eventMenu + 3 - cursorPosX
		else
			maxEvents = 3
		end
		animDraw(f_animVelocity(eventBG0, -1, -1))
	--Draw Event Title Transparent BG
		animSetScale(eventBG1, 319.5, 94)
		animSetWindow(eventBG1, 0,21, 320,25)
		animDraw(eventBG1)
	--Draw Title Menu
		textImgDraw(txt_eventMenu)
		textImgDraw(txt_eventProgress)
	--Draw Content Transparent BG
		animSetScale(eventBG2, 318, 154)
		animSetWindow(eventBG2, 3,52, 314,154)
		animDraw(eventBG2)
	--Set Event Info, Preview and Progress
	--Event 1
		if sysTime >= 13 and sysTime <= 23 then --Event Available at this Time!
			event1Status = true
			t_eventMenu[1].info = "Play as Master Kung Fu Girl!"
			t_eventMenu[1].preview = event1
		else --Event Unavailable...
			event1Status = false
			t_eventMenu[1].info = "WILL BE AVAILABLE FROM 1PM/13:00 TO 11PM/23:00"
			t_eventMenu[1].preview = event1L
		end
		if data.event1Status == 1 then t_eventMenu[1].status = "COMPLETED" end
	--Event 2
		--[[
		if sysTime >= ??? and sysTime <= ??? then
			event2Status = true
			t_eventMenu[2].info = "???"
			t_eventMenu[2].preview = event2
		else --Event Unavailable...
			event2Status = false
			t_eventMenu[2].info = "WILL BE AVAILABLE FROM ??? TO ???"
			t_eventMenu[2].preview = event2L
		end
		]]
		if data.event2Status == 1 then t_eventMenu[2].status = "COMPLETED" end
	--Event 3
		--[[
		if sysTime >= ??? and sysTime <= ??? then
			event3Status = true
			t_eventMenu[3].info = "???"
			t_eventMenu[3].preview = event3
		else --Event Unavailable...
			event3Status = false
			t_eventMenu[3].info = "WILL BE AVAILABLE FROM ??? TO ???"
			t_eventMenu[3].preview = event3L
		end
		]]
		if data.event3Status == 1 then t_eventMenu[3].status = "COMPLETED" end
	--Set Scroll Logic
		for i=1, maxEvents do
			if i > eventMenu - cursorPosX then
				if i == eventMenu and eventSelect == true then
					bank = 5
				elseif eventSelect == false then
					bank = 0
				else
					bank = 0
				end
			--Draw Text for Event Status
				if t_eventMenu[i].varID ~= nil then
					textImgDraw(f_updateTextImg(t_eventMenu[i].varID, jgFnt, bank, 0, t_eventMenu[i].status, -50.5+i*105-moveTxt, 218)) -- [*] value needs to be equal to: moveTxt = (eventMenu - ) [*] value to keep static in each press
				end
			--Draw Event Preview Image
				animSetPos(t_eventMenu[i].preview, -100+i*105-moveTxt, 54)
				animUpdate(t_eventMenu[i].preview)
				animDraw(t_eventMenu[i].preview)
			end
		end
		if eventSelect == true then
		--Draw Event Cursor
			if lockedScreen == false then
				animSetWindow(cursorBox, -100+cursorPosX*104.5,54, 100,150) --As eventMenu is the first value for cursorBox; it will move on X position (x, y) = (-100+cursorPosX*104.5, 60)
				f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
				animDraw(f_animVelocity(cursorBox, -1, -1))
			end
		--Draw Event Info
			textImgDraw(f_updateTextImg(t_eventMenu[eventMenu].varID, font11, 0, 0, t_eventMenu[eventMenu].info, 160, 37))
		end
		f_sysTime() --Draw Date and Time from main.lua
	--Draw Left Animated Cursor
		if maxEvents > 3 then
			animDraw(arrowsEL)
			animUpdate(arrowsEL)
		end
	--Draw Right Animated Cursor
		if #t_eventMenu > 3 and maxEvents < #t_eventMenu then
			animDraw(arrowsER)
			animUpdate(arrowsER)
		end
		if eventSelect == true then
			--Set Back Text Color to Shadow
			textImgSetBank(txt_selEvent, 7)
			textImgDraw(txt_selEvent)
		else
			--Set Back Text Color to Yellow
			textImgSetBank(txt_selEvent, 5)
			textImgDraw(txt_selEvent)
			--Show a Cursor in Back Text
			animSetWindow(cursorBox, -56, 228, 432, 13)
			f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
			animDraw(f_animVelocity(cursorBox, -1, -1))
		end
		if lockedScreen == true then f_lockedInfo() end --Show Locked Event Info Message
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

--;===========================================================
--; EVENT SAVE DATA
--;===========================================================
function f_eventStatus()
	if data.eventNo == 1 then data.event1Status = 1
	elseif data.eventNo == 2 then data.event2Status = 1
	elseif data.eventNo == 3 then data.event3Status = 1
	end
	f_saveProgress()
	assert(loadfile("save/stats_sav.lua"))()
end
