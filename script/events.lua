
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
100,1, 0,0, -1
]])
animSetTile(eventBG1, 1, 1)
animSetAlpha(eventBG1, 20, 100)
animUpdate(eventBG1)

--Below Transparent background
eventBG2 = animNew(sysSff, [[
100,1, 0,0, -1
]])
animSetTile(eventBG2, 1, 1)
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

function f_drawEvent1() --Draw Event 1 Preview
	if sysTime >= 20 and sysTime <= 23 then
		event1Status = true
		event1 = animNew(eventSff, [[
		0,0, 0,0,
		]])
		animSetPos(event1, 5, 54)
		animUpdate(event1)
		animDraw(event1)
	else --Event Unavailable...
		event1Status = false
		event1L = animNew(eventSff, [[
		0,1, 0,0,
		]])
		animSetPos(event1L, 5, 54)
		animUpdate(event1L)
		animDraw(event1L)
	end
end

function f_drawEvent2() --Draw Event 2 Preview
	event2 = animNew(eventSff, [[
	1,0, 0,0,
	]])
	animSetPos(event2, 110, 54)
	animUpdate(event2)
	animDraw(event2)
end

function f_drawEvent3() --Draw Event 3 Preview
	event3 = animNew(eventSff, [[
	2,0, 0,0,
	]])
	animSetPos(event3, 215, 54)
	animUpdate(event3)
	animDraw(event3)
end

--;===========================================================
--; EVENTS MENU
--;===========================================================
t_eventMenu = {
	{id = '', text = '', varID = textImgNew(), varText = event1Progress},
	{id = '', text = '', varID = textImgNew(), varText = 'UNDEFINED'},
	{id = '', text = '', varID = textImgNew(), varText = 'UNDEFINED'},
	{id = '', text = '', varID = textImgNew(), varText = 'UNDEFINED'},
	{id = '', text = '', varID = textImgNew(), varText = 'UNDEFINED'},
	{id = '', text = '', varID = textImgNew(), varText = 'UNDEFINED'},
}

--function countdown(t) --TODO make a Countdown for the sysTime Event
  --local d = math.floor(t / 86400)
  --local h = math.floor((t % 86400) / 3600)
  --local m = math.floor((t % 3600) / 60)
  --local s = math.floor((t % 60))
  --return string.format("%d:%02d:%02d:%02d", d, h, m, s)
--end

t_tInfo = {
	{id = '1', text = 'WILL BE AVAILABLE FROM 8PM/20:00 TO 11PM/23:00'},
	{id = '2', text = 'POST YOUR SCHEDULE HERE                  '},
	{id = '3', text = 'POST YOUR SCHEDULE HERE                  '},
	{id = '4', text = 'POST YOUR SCHEDULE HERE                  '},
	{id = '5', text = 'POST YOUR SCHEDULE HERE                  '},
	{id = '6', text = 'POST YOUR SCHEDULE HERE                  '},
}
for i=1, #t_tInfo do
	t_tInfo[i].id = createTextImg(font11, 0, -1, t_tInfo[i].text, 313, 37)
end

t_mInfo = {
	{id = '1', text = "Play as Master Kung Fu Girl!     "},
	{id = '2', text = "PROGRAM YOUR EVENT HERE        "},
	{id = '3', text = "PROGRAM YOUR EVENT HERE        "},
	{id = '4', text = "PROGRAM YOUR EVENT HERE        "},
	{id = '5', text = "PROGRAM YOUR EVENT HERE        "},
	{id = '6', text = "PROGRAM YOUR EVENT HERE        "},
}
for i=1, #t_mInfo do
	t_mInfo[i].id = createTextImg(font11, 0, -1, t_mInfo[i].text, 300, 37)
end

function f_eventMenu()
	cmdInput()
	playBGM(bgmEvents)
	local eventMenu = 1
	local cursorPosX = 1
	local moveTxt = 0
	local eventSelect = true
	data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
	while true do
	--Event Progress Logic
	if data.event1Status == 100 then event1Progress = 'COMPLETED' elseif data.event1Status == 0 then event1Progress = 'INCOMPLETE' end
	data.eventsProgress = (math.floor(((data.event1Status) * 100 / 100) + 0.5)) --The number (100) is the summation of all data.eventStatus values in parentheses
	txt_eventMenu = createTextImg(jgFnt, 0, 0, 'EVENT SELECT [' .. data.eventsProgress .. '%]', 159, 10) --needs to be inside of event Menu function, to load event data %
	txt_selEvent = createTextImg(jgFnt, 0, 0, 'BACK TO MAIN MENU', 160, 238)
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
						f_eventLocked()
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
		if cursorPosX == 3 then
			moveTxt = (eventMenu - 3) * 105 --Set how many space will move Event Status text
		elseif cursorPosX == 1 then
			moveTxt = (eventMenu - 1) * 105
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
		animSetWindow(eventBG1, 0,21, 320,25)
		animDraw(f_animVelocity(eventBG1, -1, -1))
		textImgDraw(txt_eventMenu)
		--Draw Content Transparent BG
		animSetWindow(eventBG2, 0,54, 320,150)
		animDraw(f_animVelocity(eventBG2, -1, -1))
		f_drawEvent1()
		f_drawEvent2()
		f_drawEvent3()
		--Draw Event Cursor
		animSetWindow(cursorBox, -100+cursorPosX*104.5,54, 100,150) --As eventMenu is the first value for cursorBox; it will move on X position (x, y) = (-100+cursorPosX*104.5, 60)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
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
		--Set event status
		t_eventMenu[1].varText = event1Progress
		--Draw Text for Event Status
		for i=1, maxEvents do
			if i > eventMenu - cursorPosX then
				if t_eventMenu[i].varID ~= nil then
					textImgDraw(f_updateTextImg(t_eventMenu[i].varID, jgFnt, 0, -1, t_eventMenu[i].varText, -16+i*105-moveTxt, 214)) -- [*] value needs to be equal to: moveTxt = (eventMenu - ) [*] value to keep static in each press
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
			textImgSetBank(txt_selEvent, 0)
			textImgDraw(txt_selEvent)
		else
			textImgSetBank(txt_selEvent, 5)
			textImgDraw(txt_selEvent)
		end
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
--; EVENT LOCKED INFO LOOP
--;===========================================================
function f_eventLocked()
	local i = 0
	txt = 'THIS EVENT IS UNAVAILABLE ON THIS HOUR. TRY LATER...'
	cmdInput()
	while true do
		if esc() or btnPalNo(p1Cmd) > 0 then
			cmdInput()
			sndPlay(sysSnd, 100, 2)
			data.fadeTitle = f_fadeAnim(50, 'fadein', 'black', fadeSff)
			break
		end
        i = i + 1
        f_textRender(txt_msgMenu, txt, i, 20, 178, 15, 1.8, 35)
        animDraw(data.fadeTitle)
        animUpdate(data.fadeTitle)
		cmdInput()
        refresh()
    end
end

--;===========================================================
--; EVENT INFO LOOP
--;===========================================================
function f_eventWarning()
	local i = 0
	txt = 'FOR A BETTER EXPERIENCE, SET A 4:3 GAME RESOLUTION TO PLAY THIS EVENT.'
	cmdInput()
	while true do
		if btnPalNo(p1Cmd) > 0 then
			cmdInput()
			sndPlay(sysSnd, 100, 1)
			data.fadeTitle = f_fadeAnim(50, 'fadein', 'black', fadeSff)
			break
		end
        i = i + 1
        f_textRender(txt_msgMenu, txt, i, 20, 178, 15, 1, 35)
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
