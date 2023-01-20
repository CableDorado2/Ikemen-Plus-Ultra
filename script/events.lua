
module(..., package.seeall)

--;===========================================================
--; EVENTS MENU LOOP
--;===========================================================
t_eventMenu = {
	{id = '', text = '', varID = textImgNew(), varText = mission1Progress},
	{id = '', text = '', varID = textImgNew(), varText = mission2Progress},
	{id = '', text = '', varID = textImgNew(), varText = mission3Progress},
}
for i=1, #t_eventMenu do
	t_eventMenu[i].id = createTextImg(font2, 0, 1, t_eventMenu[i].text, 44, 130+i*15)
end

t_mInfo = {
	{id = '1', text = "Survive 40 Rounds in The Call of Zombies!"},
	{id = '2', text = "Play as Master Kung Fu Girl!"},
	{id = '3', text = "Fight agains Suave's Dude Minion!"},
}
for i=1, #t_mInfo do
	t_mInfo[i].id = createTextImg(font11, 0, -1, t_mInfo[i].text, 300, 39)
end

function f_drawEvent1() --Draw Event 1 Preview
	if data.sysTime >= 0 and data.sysTime <= 12 then --Event Available! From 1am until afternoon
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
	if data.sysTime >= 13 and data.sysTime <= 19 then --Event Available! From 1pm until night
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
	if data.sysTime >= 20 and data.sysTime <= 24 then --Event Available! From 8pm until 12am
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
	local eventMenu = 1	
	local cursorPosX = 0
	local moveTxt = 0
	data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
	while true do
	--Event Status Logic
	data.missionsStatus = (math.floor(((data.mission1Status + data.mission2Status + data.mission3Status + data.mission4Status + data.mission5Status + data.mission6Status) * 100 / 600) + 0.5)) --The number (600) is the summation of all data.missionStatus values in parentheses
	if data.mission1Status == 100 then mission1Progress = 'COMPLETED' elseif data.mission1Status == 0 then mission1Progress = 'INCOMPLETE' end
	if data.mission2Status == 100 then mission2Progress = 'COMPLETED' elseif data.mission2Status == 0 then mission2Progress = 'INCOMPLETE' end
	if data.mission3Status == 100 then mission3Progress = 'COMPLETED' elseif data.mission3Status == 0 then mission3Progress = 'INCOMPLETE' end
	txt_eventMenu = createTextImg(jgFnt, 0, 0, 'EVENT SELECT [' .. data.missionsStatus .. '%]', 159, 12) --needs to be inside of event Menu function, to load event data %
		if esc() then
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
						cursorPosX = 4
					else
						cursorPosX = #t_eventMenu-1
					end
				elseif eventMenu > #t_eventMenu then
					eventMenu = 1
					cursorPosX = 0
				elseif commandGetState(p1Cmd, 'l') and cursorPosX > 0 then
					cursorPosX = cursorPosX - 1
				elseif commandGetState(p1Cmd, 'r') and cursorPosX < 4 then
					cursorPosX = cursorPosX + 1
				end
				if cursorPosX == 4 then
					moveTxt = (eventMenu - 5) * 13
				elseif cursorPosX == 0 then
					moveTxt = (eventMenu - 1) * 13
				end
		elseif btnPalNo(p1Cmd) > 0 then
			f_default()
			--CALL OF ZOMBIES
			if eventMenu == 1 then
				if event1Status == true then
					data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
					sndPlay(sysSnd, 100, 1)
					setRoundTime(-1)
					data.p2In = 0
					data.p1TeamMenu = {mode = 0, chars = 1}				
					data.p2TeamMenu = {mode = 0, chars = 1}
					--data.p1Char = {t_charAdd['dragon claw']}
					data.p2Char = {t_charAdd['call of zombies']}
					data.stageMenu = false
					data.versusScreen = false
					--data.rosterMode = 'mission'
					--data.missionNo = 'mission 1'
					--textImgSetText(txt_mainSelect, 'MISSION 1 [' .. mission1Progress .. ']')
					script.select.f_selectSimple()
				elseif event1Status == false then
					sndPlay(sysSnd, 100, 1)
					f_eventLocked()
				end
			--Master Kung Fu Girl
			elseif eventMenu == 2 then
				if event2Status == true then
					data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
					sndPlay(sysSnd, 100, 1)
					setRoundTime(-1)
				
				elseif event2Status == false then
					sndPlay(sysSnd, 100, 1)
					f_eventLocked()
				end
			--VS Suave's Dude Minion
			elseif eventMenu == 3 then
				if event3Status == true then
					data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
					sndPlay(sysSnd, 100, 1)
					setRoundTime(-1)
					data.p2In = 0
					data.p1TeamMenu = {mode = 0, chars = 1}				
					data.p2TeamMenu = {mode = 0, chars = 1}
					data.p1Char = {t_charAdd['kung fu man']}
					data.p2Char = {t_charAdd['suave dude/minion/minion.def']}
					data.stageMenu = false
					data.versusScreen = true
					script.select.f_selectSimple()
				elseif event3Status == false then
					sndPlay(sysSnd, 100, 1)
					f_eventLocked()
				end
			end			
		end
		--if cursorPosX == 4 then
			--moveTxt = (eventMenu - 4) * 15
		--elseif cursorPosX == 1 then
			--moveTxt = (eventMenu - 1) * 15
		--end	
		--if #t_eventMenu <= 4 then
			--maxMissions = #t_eventMenu
		--elseif eventMenu - cursorPosX > 0 then
			--maxMissions = eventMenu + 14 - cursorPosX
		--else
			--maxMissions = 4
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
			for i=1, #t_mInfo do
				textImgDraw(t_mInfo[1].id)
			end
		elseif eventMenu == 2 then
			for i=1, #t_mInfo do
				textImgDraw(t_mInfo[2].id)
			end
		elseif eventMenu == 3 then
			for i=1, #t_mInfo do
				textImgDraw(t_mInfo[3].id)
			end
		end	
		t_eventMenu[1].varText = mission1Progress
		t_eventMenu[2].varText = mission2Progress
		t_eventMenu[3].varText = mission3Progress
		for i=1, #t_eventMenu do
			textImgDraw(t_eventMenu[i].id)
			if t_eventMenu[i].varID ~= nil then
				textImgDraw(f_updateTextImg(t_eventMenu[i].varID, jgFnt, 0, -1, t_eventMenu[i].varText, -10+i*104, 230))
			end
		end
		animSetWindow(cursorBox, -100+eventMenu*104.5,60, 100,150) --As eventMenu is the first value for cursorBox; it will move on X position (x, y) = (-100+eventMenu*104.5, 60)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
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