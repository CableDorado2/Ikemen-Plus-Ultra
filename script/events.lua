
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
txt_lockedinfoTitle = createTextImg(font5, 0, 0, 'INFORMATION', 156.5, 111)

--Info Window BG
infoEventWindowBG = animNew(sysSff, [[
230,1, 0,0,
]])
animSetPos(infoEventWindowBG, 83.5, 97)
animUpdate(infoEventWindowBG)
animSetScale(infoEventWindowBG, 1, 1)

t_lockedinfoMenu = {
	{id = textImgNew(), text = 'OK'},
}

function f_lockedInfo()
	cmdInput()
	--Draw Fade BG
	animDraw(fadeWindowBG)
	--Draw Menu BG
	animDraw(infoEventWindowBG)
	animUpdate(infoEventWindowBG)
	--Draw Title
	if eventInfo == true then
		txt_lockedInfo = createTextImg(jgFnt, 0, 0, 'EVENT NOT AVAILABLE, TRY LATER', 160, 130,0.6,0.6)
	end
	textImgDraw(txt_lockedInfo)
	--Draw Table Text
	for i=1, #t_lockedinfoMenu do
		textImgDraw(f_updateTextImg(t_lockedinfoMenu[i].id, jgFnt, 5, 0, t_lockedinfoMenu[i].text, 159, 135+i*13))
	end
	--Draw Cursor
	animSetWindow(cursorBox, 87,138, 144,13)
	f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
	animDraw(f_animVelocity(cursorBox, -1, -1))
	--Draw Info Title Text
	textImgDraw(txt_lockedinfoTitle)
	--Actions
	if esc() or btnPalNo(p1Cmd) > 0 then
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
--Event 1 Unlocked Preview
event1 = animNew(eventSff, [[
0,0, 0,0,
]])
animSetPos(event1, 5, 54)
animUpdate(event1)

--Event 1 Locked Preview
event1L = animNew(eventSff, [[
0,1, 0,0,
]])
animSetPos(event1L, 5, 54)
animUpdate(event1L)

--Event 2 Unlocked Preview
event2 = animNew(eventSff, [[
1,0, 0,0,
]])
animSetPos(event2, 110, 54)
animUpdate(event2)

--Event 3 Unlocked Preview
event3 = animNew(eventSff, [[
2,0, 0,0,
]])
animSetPos(event3, 215, 54)
animUpdate(event3)

--;===========================================================
--; EVENTS MENU
--;===========================================================
--function countdown(t) --TODO make a Countdown for the sysTime Event
  --local d = math.floor(t / 86400)
  --local h = math.floor((t % 86400) / 3600)
  --local m = math.floor((t % 3600) / 60)
  --local s = math.floor((t % 60))
  --return string.format("%d:%02d:%02d:%02d", d, h, m, s)
--end

t_tInfo = {
	{id = '1', text = 'WILL BE AVAILABLE FROM 1PM/13:00 TO 11PM/23:00'},
	{id = '2', text = 'POST YOUR SCHEDULE HERE'},
	{id = '3', text = 'POST YOUR SCHEDULE HERE'},
	{id = '4', text = 'POST YOUR SCHEDULE HERE'},
	{id = '5', text = 'POST YOUR SCHEDULE HERE'},
	{id = '6', text = 'POST YOUR SCHEDULE HERE'},
}
for i=1, #t_tInfo do
	t_tInfo[i].id = createTextImg(font11, 0, 0, t_tInfo[i].text, 160, 37)
end

t_mInfo = {
	{id = '1', text = "Play as Master Kung Fu Girl!"},
	{id = '2', text = "PROGRAM YOUR EVENT HERE"},
	{id = '3', text = "PROGRAM YOUR EVENT HERE"},
	{id = '4', text = "PROGRAM YOUR EVENT HERE"},
	{id = '5', text = "PROGRAM YOUR EVENT HERE"},
	{id = '6', text = "PROGRAM YOUR EVENT HERE"},
}
for i=1, #t_mInfo do
	t_mInfo[i].id = createTextImg(font11, 0, 0, t_mInfo[i].text, 160, 37)
end

t_eventMenu = {
	{id = '', text = '', varID = textImgNew(), varText = event1Progress},
	{id = '', text = '', varID = textImgNew(), varText = 'UNDEFINED'},
	{id = '', text = '', varID = textImgNew(), varText = 'UNDEFINED'},
	{id = '', text = '', varID = textImgNew(), varText = 'UNDEFINED'},
	{id = '', text = '', varID = textImgNew(), varText = 'UNDEFINED'},
	{id = '', text = '', varID = textImgNew(), varText = 'UNDEFINED'},
}

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
	f_lockedInfoReset()
	--data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
	while true do
--Event Progress Logic
	if data.event1Status == 1 then event1Progress = 'COMPLETED' elseif data.event1Status == 0 then event1Progress = 'INCOMPLETE' end
	data.eventsProgress = (data.event1Status)-- + data.event2Status + data.event3Status)
	eventsData = (math.floor((data.eventsProgress * 100 / 1) + 0.5)) --The number (1) is the amount of all data.eventStatus
	txt_eventMenu = createTextImg(jgFnt, 0, 0, 'EVENT SELECT [' .. eventsData .. '%]', 159, 10) --needs to be inside of event Menu function, to load event data %
	txt_selEvent = createTextImg(jgFnt, 0, 0, 'BACK TO MAIN MENU', 160, 238)
		if lockedScreen == false then
			if esc() then
				f_saveProgress()
				f_menuMusic()
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 2)
				break
			elseif commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and bufl >= 30) then
				if eventSelect == true then
					sndPlay(sysSnd, 100, 0)
					eventMenu = eventMenu - 1
				end
			elseif commandGetState(p1Cmd, 'r') or (commandGetState(p1Cmd, 'holdr') and bufr >= 30) then
				if eventSelect == true then
					sndPlay(sysSnd, 100, 0)
					eventMenu = eventMenu + 1
				end
			elseif commandGetState(p1Cmd, 'u') or (commandGetState(p1Cmd, 'holdu') and bufu >= 30) then
				sndPlay(sysSnd, 100, 0)
				if eventSelect == true then
					eventSelect = false
				elseif eventSelect == false then
					eventSelect = true
				end
			elseif commandGetState(p1Cmd, 'd') or (commandGetState(p1Cmd, 'holdd') and bufd >= 30) then
				sndPlay(sysSnd, 100, 0)
				if eventSelect == true then
					eventSelect = false
				elseif eventSelect == false then
					eventSelect = true
				end
			elseif btnPalNo(p1Cmd) > 0 then
				if eventSelect == true then
					f_default()
				--Master Kung Fu Girl
					if eventMenu == 1 then
						if event1Status == true then
							data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
							sndPlay(sysSnd, 100, 1)
							setRoundTime(-1)
							data.p2In = 1
							data.p2SelectMenu = false
							data.p1TeamMenu = {mode = 0, chars = 1}				
							--data.p2TeamMenu = {mode = 2, chars = 4}
							data.p1Char = {t_charAdd['kung fu girl/master/master kung fu girl.def']}
							data.versusScreen = true
							data.gameMode = 'survival'
							data.rosterMode = 'event'
							data.eventNo = 'event 1'
							script.select.f_selectAdvance()
						elseif event1Status == false then
							sndPlay(sysSnd, 100, 1)
							eventInfo = true
							lockedScreen = true
						end
				--EVENT 2
					elseif eventMenu == 2 then
						--data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
						sndPlay(sysSnd, 100, 1)
				--EVENT 3
					elseif eventMenu == 3 then
						--data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
						sndPlay(sysSnd, 100, 1)
				--EVENT 4
					elseif eventMenu == 4 then
						--data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
						sndPlay(sysSnd, 100, 1)
				--EVENT 5
					elseif eventMenu == 5 then
						--data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
						sndPlay(sysSnd, 100, 1)
				--EVENT 6
					elseif eventMenu == 6 then
						--data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
						sndPlay(sysSnd, 100, 1)
					end
			--BACK
				else
					f_saveProgress()
					f_menuMusic()
					data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
					sndPlay(sysSnd, 100, 2)
					break
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
			elseif (commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and bufl >= 30)) and cursorPosX > 1 then
				if eventSelect == true then
					cursorPosX = cursorPosX - 1
				end
			elseif (commandGetState(p1Cmd, 'r') or (commandGetState(p1Cmd, 'holdr') and bufr >= 30)) and cursorPosX < 3 then
				if eventSelect == true then
					cursorPosX = cursorPosX + 1
				end
			end
		end
		if cursorPosX == 3 then
			moveTxt = (eventMenu - 3) * 105 --Set how many space will move Event Status text
			moveImg = (eventMenu - 3) * 160 --Set how many space will move Event Preview image
			moveImg2 = (eventMenu - 3) * 105
			moveImg3 = (eventMenu - 3) * 60
		elseif cursorPosX == 1 then
			moveTxt = (eventMenu - 1) * 105
			moveImg = (eventMenu - 1) * 160
			moveImg2 = (eventMenu - 1) * 105
			moveImg3 = (eventMenu - 1) * 60
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
	--Draw Content Transparent BG
		animSetScale(eventBG2, 318, 154)
		animSetWindow(eventBG2, 3,52, 314,154)
		animDraw(eventBG2)
	--Draw Event 1
		if sysTime >= 13 and sysTime <= 23 then --Event Available at this Time!
			event1Status = true
		--Draw and Move Event Available Image
			animPosDraw(event1, 5-moveImg, 54)
			animUpdate(event1)
		else --Event Unavailable...
			event1Status = false
			--Draw and Move Event Locked Image
			animPosDraw(event1L, 5-moveImg, 54)
			animUpdate(event1L)
		end
	--Draw Event 2
		animPosDraw(event2, 5*24-moveImg2, 54)
		animUpdate(event2)
	--Draw Event 3
		animPosDraw(event3, 8*34-moveImg3, 54)
		animUpdate(event3)
		if eventSelect == true then
		--Draw Event Cursor
			if lockedScreen == false then
				animSetWindow(cursorBox, -100+cursorPosX*104.5,54, 100,150) --As eventMenu is the first value for cursorBox; it will move on X position (x, y) = (-100+cursorPosX*104.5, 60)
				f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
				animDraw(f_animVelocity(cursorBox, -1, -1))
			end
		--Draw Event Info
			if eventMenu == 1 then
				if event1Status == true then
					for i=1, #t_mInfo do
						textImgDraw(t_mInfo[1].id) --Draw Event Info
					end
				elseif 	event1Status == false then
					for i=1, #t_tInfo do
						textImgDraw(t_tInfo[1].id) --Draw Time to start Info
					end
				end
			elseif eventMenu == 2 then
				for i=1, #t_mInfo do
					textImgDraw(t_mInfo[2].id)
				end
			elseif eventMenu == 3 then
				for i=1, #t_mInfo do
					textImgDraw(t_mInfo[3].id)
				end
			elseif eventMenu == 4 then
				for i=1, #t_mInfo do
					textImgDraw(t_mInfo[4].id)
				end
			elseif eventMenu == 5 then
				for i=1, #t_mInfo do
					textImgDraw(t_mInfo[5].id)
				end
			elseif eventMenu == 6 then
				for i=1, #t_mInfo do
					textImgDraw(t_mInfo[6].id)
				end
			end
		end
	--Set event status
		t_eventMenu[1].varText = event1Progress
	--Draw Text for Event Status
		for i=1, maxEvents do
			if i > eventMenu - cursorPosX then
				if i == eventMenu and eventSelect == true then
					bank = 5
				elseif eventSelect == false then
					bank = 0
				else
					bank = 0
				end
				if t_eventMenu[i].varID ~= nil then
					textImgDraw(f_updateTextImg(t_eventMenu[i].varID, jgFnt, bank, -1, t_eventMenu[i].varText, -16+i*105-moveTxt, 218)) -- [*] value needs to be equal to: moveTxt = (eventMenu - ) [*] value to keep static in each press
				end
			end
		end
		f_sysTime()
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
			--Set Back Text Color to White
			textImgSetBank(txt_selEvent, 0)
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
		if commandGetState(p1Cmd, 'holdr') then
			bufl = 0
			bufr = bufr + 1
		elseif commandGetState(p1Cmd, 'holdl') then
			bufr = 0
			bufl = bufl + 1
		else
			bufr = 0
			bufl = 0
		end
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; FORCE TO PLAY X ROUNDS
--;===========================================================
function f_forceRounds()
--Data loading from lifebar
	local file = io.open(data.lifebar,"r")
	s_lifebarDEF = file:read("*all")
	file:close()
	roundsNum = tonumber(s_lifebarDEF:match('match.wins%s*=%s*(%d+)'))
	--drawNum = tonumber(s_lifebarDEF:match('match.maxdrawgames%s*=%s*(%d+)'))
--Rounds Number to Force
	roundsNum = 2
--Data saving to lifebar
	s_lifebarDEF = s_lifebarDEF:gsub('match.wins%s*=%s*%d+', 'match.wins = ' .. roundsNum)
	--s_lifebarDEF = s_lifebarDEF:gsub('match.maxdrawgames%s*=%s*%d+', 'match.maxdrawgames = ' .. drawNum)
	local file = io.open(data.lifebar,"w+")
	file:write(s_lifebarDEF)
	file:close()
--Reload lifebar
	loadLifebar(data.lifebar)
end
