
module(..., package.seeall)

--;===========================================================
--; EVENTS MENU LOOP
--;===========================================================
t_eventMenu = {
	{id = '', text = '', varID = textImgNew(), varText = event1Progress},
	{id = '', text = '', varID = textImgNew(), varText = event2Progress},
	{id = '', text = '', varID = textImgNew(), varText = event3Progress},
}
for i=1, #t_eventMenu do
	t_eventMenu[i].id = createTextImg(jgFnt, 0, 1, t_eventMenu[i].text, 44, 130+i*15)
end

--function countdown(t)
  --local d = math.floor(t / 86400)
  --local h = math.floor((t % 86400) / 3600)
  --local m = math.floor((t % 3600) / 60)
  --local s = math.floor((t % 60))
  --return string.format("%d:%02d:%02d:%02d", d, h, m, s)
--end

t_tInfo = {
	{id = '1', text = 'WILL BE AVAILABLE FROM 1AM/1:00 TO 1PM/13:00 '},
	{id = '2', text = 'WILL BE AVAILABLE FROM 1PM/13:00 TO 8PM/20:00'},
	{id = '3', text = 'WILL BE AVAILABLE FROM 8PM/20:00 TO 11PM/23:00'},
}
for i=1, #t_tInfo do
	t_tInfo[i].id = createTextImg(font11, 0, -1, t_tInfo[i].text, 313, 39)
end

t_mInfo = {
	{id = '1', text = "Find A Generator in an Unknown Zone  "},
	{id = '2', text = "Survive 40 Rounds in The Call of Zombies!"},
	{id = '3', text = "Play as Master Kung Fu Girl!     "},
}
for i=1, #t_mInfo do
	t_mInfo[i].id = createTextImg(font11, 0, -1, t_mInfo[i].text, 300, 39)
end

function f_drawEvent1() --Draw Event 1 Preview
	if sysTime >= 1 and sysTime <= 12 then --Event Available! FROM 1AM/1:00 TO 1PM/13:00
		event1Status = true
		event1 = animNew(eventSff, [[
		0,0, 0,0,
		]])
		animSetPos(event1, 5, 60)
		animUpdate(event1)
		animDraw(event1)
	else --Event Unavailable...
		event1Status = false
		event1L = animNew(eventSff, [[
		0,1, 0,0,
		]])
		animSetPos(event1L, 5, 60)
		animUpdate(event1L)
		animDraw(event1L)
	end
end

function f_drawEvent2() --Draw Event 2 Preview
	if sysTime >= 13 and sysTime <= 19 then --Event Available! FROM 1PM/13:00 TO 8PM/20:00
		event2Status = true
		event2 = animNew(eventSff, [[
		1,0, 0,0,
		]])
		animSetPos(event2, 110, 60)
		animUpdate(event2)
		animDraw(event2)
	else --Event Unavailable...
		event2Status = false
		event2L = animNew(eventSff, [[
		1,1, 0,0,
		]])
		animSetPos(event2L, 110, 60)
		animUpdate(event2L)
		animDraw(event2L)
	end
end

function f_drawEvent3() --Draw Event 3 Preview
	if sysTime >= 20 and sysTime <= 23 then --Event Available! FROM 8PM/20:00 TO 11PM/23:00
		event3Status = true
		event3 = animNew(eventSff, [[
		2,0, 0,0,
		]])
		animSetPos(event3, 215, 60)
		animUpdate(event3)
		animDraw(event3)
	else --Event Unavailable...
		event3Status = false
		event3L = animNew(eventSff, [[
		2,1, 0,0,
		]])
		animSetPos(event3L, 215, 60)
		animUpdate(event3L)
		animDraw(event3L)
	end
end

function f_eventMenu()
	cmdInput()
	playBGM(bgmEvents)
	local eventMenu = 1	
	local cursorPosY = 0
	local moveTxt = 0
	data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
	while true do
	--Event Status Logic
	data.eventsStatus = (math.floor(((data.event1Status + data.event2Status + data.event3Status) * 100 / 300) + 0.5)) --The number (300) is the summation of all data.eventsStatus values in parentheses
	if data.event1Status == 100 then event1Progress = 'COMPLETED' elseif data.event1Status == 0 then event1Progress = 'INCOMPLETE' end
	if data.event2Status == 100 then event2Progress = 'COMPLETED' elseif data.event2Status == 0 then event2Progress = 'INCOMPLETE' end
	if data.event3Status == 100 then event3Progress = 'COMPLETED' elseif data.event3Status == 0 then event3Progress = 'INCOMPLETE' end
	txt_eventMenu = createTextImg(jgFnt, 0, 0, 'EVENT SELECT [' .. data.eventsStatus .. '%]', 159, 12) --needs to be inside of event Menu function, to load event data %
		if esc() then
			f_menuMusic()
			data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'l') then
			sndPlay(sysSnd, 100, 0)
			eventMenu = eventMenu - 1
			if eventMenu < 1 then eventMenu = #t_eventMenu end		
		elseif commandGetState(p1Cmd, 'r') then
			sndPlay(sysSnd, 100, 0)
			eventMenu = eventMenu + 1
			if eventMenu > #t_eventMenu then eventMenu = 1 end
				if eventMenu < 1 then
					eventMenu = #t_eventMenu
					if #t_eventMenu > 4 then
						cursorPosY = 4
					else
						cursorPosY = #t_eventMenu-1
					end
				elseif eventMenu > #t_eventMenu then
					eventMenu = 1
					cursorPosY = 0
				elseif commandGetState(p1Cmd, 'l') and cursorPosY > 0 then
					cursorPosY = cursorPosY - 1
				elseif commandGetState(p1Cmd, 'r') and cursorPosY < 4 then
					cursorPosY = cursorPosY + 1
				end
				if cursorPosY == 4 then
					moveTxt = (eventMenu - 5) * 13
				elseif cursorPosY == 0 then
					moveTxt = (eventMenu - 1) * 13
				end
		elseif btnPalNo(p1Cmd) > 0 then
			f_default()
			--UNKNOW ZONE
			if eventMenu == 1 then
				if event1Status == true then
					data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
					sndPlay(sysSnd, 100, 1)
					setRoundTime(-1)
					data.p2In = 0
					data.p1TeamMenu = {mode = 0, chars = 1}				
					data.p2TeamMenu = {mode = 0, chars = 1}
					data.p2Char = {t_charAdd['unknown zone']}
					data.stageMenu = false
					data.versusScreen = false
					data.rosterMode = 'event'
					data.eventNo = 'event 1'
					textImgSetText(txt_mainSelect, 'CHARACTER SELECT')
					script.select.f_selectSimple()
				elseif event1Status == false then
					sndPlay(sysSnd, 100, 1)
					f_eventLocked()
				end
			--CALL OF ZOMBIES
			elseif eventMenu == 2 then
				if event2Status == true then
					data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
					sndPlay(sysSnd, 100, 1)
					setRoundTime(-1)
					data.p2In = 0
					data.p1TeamMenu = {mode = 0, chars = 1}				
					data.p2TeamMenu = {mode = 0, chars = 1}
					data.p2Char = {t_charAdd['call of zombies']}
					data.stageMenu = false
					data.versusScreen = false
					data.rosterMode = 'event'
					data.eventNo = 'event 2'
					textImgSetText(txt_mainSelect, 'CHARACTER SELECT')
					script.select.f_selectSimple()
				elseif event2Status == false then
					sndPlay(sysSnd, 100, 1)
					f_eventLocked()
				end
			--Master Kung Fu Girl
			elseif eventMenu == 3 then
				if event3Status == true then
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
					data.eventNo = 'event 3'
					script.select.f_selectAdvance()
				elseif event3Status == false then
					sndPlay(sysSnd, 100, 1)
					f_eventLocked()
				end
			end			
		end
		--if cursorPosY == 4 then
			--moveTxt = (eventMenu - 4) * 15
		--elseif cursorPosY == 1 then
			--moveTxt = (eventMenu - 1) * 15
		--end	
		--if #t_eventMenu <= 4 then
			--maxEvents = #t_eventMenu
		--elseif eventMenu - cursorPosY > 0 then
			--maxEvents = eventMenu + 14 - cursorPosY
		--else
			--maxEvents = 4
		--end		
		animDraw(f_animVelocity(optionsBG0, -1, -1))
		--Draw Event Title Table
		animSetWindow(missionBG1, 0,23, 320,25)
		animDraw(f_animVelocity(missionBG1, -1, -1))
		textImgDraw(txt_eventMenu)
		--Draw Content Table
		animSetWindow(optionsBG1, 0,60, 320,150)
		animDraw(f_animVelocity(optionsBG1, -1, -1))
		f_drawEvent1()
		f_drawEvent2()
		f_drawEvent3()
		if eventMenu == 1 then
			if event1Status == true then
				for i=1, #t_mInfo do
					textImgDraw(t_mInfo[1].id)
				end
			elseif 	event1Status == false then
				for i=1, #t_tInfo do
					textImgDraw(t_tInfo[1].id)
				end
			end
		elseif eventMenu == 2 then
			if event2Status == true then
				for i=1, #t_mInfo do
					textImgDraw(t_mInfo[2].id)
				end
			elseif event2Status == false then
				for i=1, #t_tInfo do
					textImgDraw(t_tInfo[2].id)
				end
			end
		elseif eventMenu == 3 then
			if event3Status == true then
				for i=1, #t_mInfo do
					textImgDraw(t_mInfo[3].id)
				end
			elseif event3Status == false then
				for i=1, #t_tInfo do
					textImgDraw(t_tInfo[3].id)
				end
			end
		end	
		t_eventMenu[1].varText = event1Progress
		t_eventMenu[2].varText = event2Progress
		t_eventMenu[3].varText = event3Progress
		for i=1, #t_eventMenu do
			textImgDraw(t_eventMenu[i].id)
			if t_eventMenu[i].varID ~= nil then
				textImgDraw(f_updateTextImg(t_eventMenu[i].varID, jgFnt, 0, -1, t_eventMenu[i].varText, -10+i*104, 230))
			end
		end
		animSetWindow(cursorBox, -100+eventMenu*104.5,60, 100,150) --As eventMenu is the first value for cursorBox; it will move on X position (x, y) = (-100+eventMenu*104.5, 60)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		f_sysTime()
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