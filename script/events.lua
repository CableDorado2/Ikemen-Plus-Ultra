
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
	{id = '1', text = "The ancient Dragon Claw is back!     "},
	{id = '2', text = "Defeat Kyo Kusanagi NESTS Clone "},
	{id = '3', text = "Use the Orochi's Power to destroy everyone!"},
}
for i=1, #t_mInfo do
	t_mInfo[i].id = createTextImg(font11, 0, -1, t_mInfo[i].text, 300, 34)
end

function f_event1Preview() --Based on stage preview code
	event1Preview = ''
	event1Preview = '0,' .. eventList-1 .. ', 0,0, 0'
	event1Preview = animNew(eventSff, event1Preview)
	animSetPos(event1Preview, 5,60)
	animUpdate(event1Preview)
	animDraw(event1Preview)
	return event1Preview
end

function f_event2Preview() --Based on stage preview code
	event2Preview = ''
	event2Preview = '0,' .. eventList-1 .. ', 0,0, 0'
	event2Preview = animNew(eventSff, event2Preview)
	animSetPos(event2Preview, 110,60)
	animUpdate(event2Preview)
	animDraw(event2Preview)
	return event2Preview
end

function f_event3Preview() --Based on stage preview code
	event3Preview = ''
	event3Preview = '0,' .. eventList-1 .. ', 0,0, 0'
	event3Preview = animNew(eventSff, event3Preview)
	animSetPos(event3Preview, 215,60)
	animUpdate(event3Preview)
	animDraw(event3Preview)
	return event3Preview
end

--Event 1 Preview
event1 = animNew(eventSff, [[
0,0, 0,0,
]])
animSetPos(event1, 20, 60)
animUpdate(event1)

--Event 1 LOCKED Preview
event1L = animNew(eventSff, [[
0,1, 0,0,
]])
animSetPos(event1L, 20, 60)
animUpdate(event1L)

--Event 2 Preview
event2 = animNew(eventSff, [[
1,0, 0,0,
]])
animSetPos(event2, 20, 60)
animUpdate(event2)

--Event 2 LOCKED Preview
event2L = animNew(eventSff, [[
1,1, 0,0,
]])
animSetPos(event2L, 20, 60)
animUpdate(event2L)

--Event 3 Preview
event3 = animNew(eventSff, [[
2,0, 0,0,
]])
animSetPos(event3, 20, 60)
animUpdate(event3)

--Event 3 LOCKED Preview
event3L = animNew(eventSff, [[
3,1, 0,0,
]])
animSetPos(event3L, 20, 60)
animUpdate(event3L)

function f_eventMenu()
	cmdInput()
	local eventMenu = 1	
	local cursorPosX = 0
	local moveTxt = 0
	eventList = 0 --Important to avoid errors when read eventPreview
	data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
	while true do
	--Missions Status Logic
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
			--DRAGON CLAW
			if eventMenu == 1 then
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 1)
				setRoundTime(-1)
				data.p2In = 0
				data.p1TeamMenu = {mode = 0, chars = 1}				
				data.p2TeamMenu = {mode = 0, chars = 1}
				data.p1Char = {t_charAdd['dragon claw']}
				data.p2Char = {t_charAdd['kung fu man/master/master kung fu man.def']}
				--data.stage = {t_stageDef['training room']}
				data.stageMenu = true
				data.versusScreen = true
				data.rosterMode = 'mission'
				data.missionNo = 'mission 1'
				textImgSetText(txt_mainSelect, 'MISSION 1 [' .. mission1Progress .. ']')
				script.select.f_selectSimple()
			--EX KYO
			elseif eventMenu == 2 then
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 1)
				setRoundTime(-1)
				data.p2In = 0
				data.p1TeamMenu = {mode = 0, chars = 1}				
				data.p2TeamMenu = {mode = 0, chars = 1}
				data.p1Char = {t_charAdd['kyo kusanagi/ex/ex kyo.def']}
				data.p2Char = {t_charAdd['kyo kusanagi']}
				data.stageMenu = false
				data.versusScreen = true
				data.rosterMode = 'mission'
				data.missionNo = 'mission 2'
				textImgSetText(txt_mainSelect, 'MISSION 2 [' .. mission2Progress .. ']')
				script.select.f_selectSimple()
			--OMEGA RUGAL
			elseif eventMenu == 3 then
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 1)
				setRoundTime(-1)
				data.p2In = 1
	            data.p2SelectMenu = false
				data.p1TeamMenu = {mode = 0, chars = 1}				
				--data.p2TeamMenu = {mode = 2, chars = 4}
				data.p1Char = {t_charAdd['rugal bernstein/omega/omega rugal.def']}
				data.versusScreen = true
				data.gameMode = 'survival'
				data.missionNo = 'mission 3'
				textImgSetText(txt_mainSelect, 'MISSION 3 [' .. mission3Progress .. ']')
				script.select.f_selectAdvance()
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
		--Draw Below Table
		animSetWindow(optionsBG1, 40,135, 240,#t_eventMenu*15)
		animDraw(f_animVelocity(optionsBG1, -1, -1))
		--Draw Above Table
		animSetWindow(missionBG1, 0,18, 320,25)
		animDraw(f_animVelocity(missionBG1, -1, -1))
		textImgDraw(txt_eventMenu)
		eventList = eventMenu --Uses menu position to show image in these order
		f_event1Preview() --Show event image preview
		f_event2Preview()
		f_event3Preview()
		--animUpdate(event1)
		--animDraw(event1)
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
				textImgDraw(f_updateTextImg(t_eventMenu[i].varID, jgFnt, 0, -1, t_eventMenu[i].varText, 275, 130+i*15))
			end
		end
		animSetWindow(cursorBox, -100+eventMenu*104.5,60, 100,150) --As eventMenu is the first value for cursorBox; it will move on X position (x, y) = (-91+eventMenu*100, 60)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		cmdInput()
		refresh()
	end
end