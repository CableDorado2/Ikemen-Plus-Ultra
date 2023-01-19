
module(..., package.seeall)

--;===========================================================
--; EVENTS MENU LOOP
--;===========================================================
t_eventMenu = {
	{id = '', text = 'Legendary Warrior',    varID = textImgNew(), varText = mission1Progress},
	{id = '', text = 'Clone of The Past',    varID = textImgNew(), varText = mission2Progress},
	{id = '', text = 'Devil Blood',  	     varID = textImgNew(), varText = mission3Progress},
	{id = '', text = 'Power Instinct',       varID = textImgNew(), varText = mission4Progress},
	{id = '', text = 'True Kung Fu Spirit',  varID = textImgNew(), varText = mission5Progress},
	{id = '', text = 'Eternal Rivals',  	 varID = textImgNew(), varText = mission6Progress},
	{id = '', text = '                 BACK'},
}
for i=1, #t_eventMenu do
	t_eventMenu[i].id = createTextImg(font2, 0, 1, t_eventMenu[i].text, 44, 130+i*15)
end

t_mInfo = {
	{id = '1', text = "The ancient Dragon Claw is back!           "},
	{id = '2', text = "Defeat Kyo Kusanagi NESTS Clone          "},
	{id = '3', text = "Use the Orochi's Power to destroy everyone!      "},
	{id = '4', text = "Awaken the hidden power of Ryu            "},
	{id = '5', text = "Use the full power of Kung Fu Man!         "},
	{id = '6', text = "A classic versus.                "},
}
for i=1, #t_mInfo do
	t_mInfo[i].id = createTextImg(font2, 0, -1, t_mInfo[i].text, 300, 15)
end

function f_missionPreview() --Based on stage preview code
	missionPreview = ''
	missionPreview = '0,' .. missionList-1 .. ', 0,0, 0'
	missionPreview = animNew(missionSff, missionPreview)
	animSetScale(missionPreview, 0.4, 0.25)
	animSetPos(missionPreview, 50, 21)
	animUpdate(missionPreview)
	animDraw(missionPreview)
	return missionPreview
end

function f_eventMenu()
	cmdInput()
	local eventMenu = 1	
	local cursorPosY = 0
	local moveTxt = 0
	missionList = 0 --Important to avoid errors when read missionPreview
	data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
	while true do
	--Missions Status Logic
	data.missionsStatus = (math.floor(((data.mission1Status + data.mission2Status + data.mission3Status + data.mission4Status + data.mission5Status + data.mission6Status) * 100 / 600) + 0.5)) --The number (600) is the summation of all data.missionStatus values in parentheses
	if data.mission1Status == 100 then mission1Progress = 'COMPLETED' elseif data.mission1Status == 0 then mission1Progress = 'INCOMPLETE' end
	if data.mission2Status == 100 then mission2Progress = 'COMPLETED' elseif data.mission2Status == 0 then mission2Progress = 'INCOMPLETE' end
	if data.mission3Status == 100 then mission3Progress = 'COMPLETED' elseif data.mission3Status == 0 then mission3Progress = 'INCOMPLETE' end
	if data.mission4Status == 100 then mission4Progress = 'COMPLETED' elseif data.mission4Status == 0 then mission4Progress = 'INCOMPLETE' end
	if data.mission5Status == 100 then mission5Progress = 'COMPLETED' elseif data.mission5Status == 0 then mission5Progress = 'INCOMPLETE' end
	if data.mission6Status == 100 then mission6Progress = 'COMPLETED' elseif data.mission6Status == 0 then mission6Progress = 'INCOMPLETE' end
	txt_eventMenu = createTextImg(jgFnt, 0, 0, 'MISSION SELECT [' .. data.missionsStatus .. '%]', 159, 128) --needs to be inside of mission Menu function, to load mission data %
		if esc() then
			data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') then
			sndPlay(sysSnd, 100, 0)
			eventMenu = eventMenu - 1
			if eventMenu < 1 then eventMenu = #t_eventMenu end		
		elseif commandGetState(p1Cmd, 'd') then
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
				elseif commandGetState(p1Cmd, 'u') and cursorPosY > 0 then
					cursorPosY = cursorPosY - 1
				elseif commandGetState(p1Cmd, 'd') and cursorPosY < 4 then
					cursorPosY = cursorPosY + 1
				end
				if cursorPosY == 4 then
					moveTxt = (eventMenu - 5) * 13
				elseif cursorPosY == 0 then
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
			--EVIL RYU
			elseif eventMenu == 4 then
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 1)
				setRoundTime(-1)
				data.p2In = 0
				data.p1TeamMenu = {mode = 0, chars = 1}				
				data.p2TeamMenu = {mode = 0, chars = 1}
				data.p1Char = {t_charAdd['ryu/master ryu.def']}
				data.p2Char = {t_charAdd['ryu/evil ryu.def']}
				setLifeMul(4)
				data.stageMenu = false
				data.versusScreen = false
				data.rosterMode = 'mission'
				data.missionNo = 'mission 4'
				textImgSetText(txt_mainSelect, 'MISSION 4 [' .. mission4Progress .. ']')
				script.select.f_selectSimple()
			--MASTER KUNG FU MAN
			elseif eventMenu == 5 then
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 1)
				setRoundTime(-1)
				data.p2In = 1
				data.p1TeamMenu = {mode = 0, chars = 1}
				data.p1Char = {t_charAdd['kung fu man/master/master kung fu man.def']}
				data.versusScreen = true
				data.gameMode = 'arcade'
				data.rosterMode = 'mission'
				data.missionNo = 'mission 5'
				textImgSetText(txt_mainSelect, 'MISSION 5 [' .. mission5Progress .. ']')
				script.select.f_selectAdvance()
			--EX KYO VS IORI
			elseif eventMenu == 6 then
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 1)
				setRoundTime(-1)
				data.p2In = 0
				data.p1TeamMenu = {mode = 0, chars = 1}				
				data.p2TeamMenu = {mode = 0, chars = 1}
				data.p1Char = {t_charAdd['kyo kusanagi/ex/ex kyo.def']}
				data.p2Char = {t_charAdd['iori yagami']}
				data.stageMenu = false
				data.versusScreen = true
				data.rosterMode = 'mission'
				data.missionNo = 'mission 6'
				textImgSetText(txt_mainSelect, 'MISSION 6 [' .. mission6Progress .. ']')
				script.select.f_selectSimple()
			--Back
			else
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 2)
				break
			end			
		end
		--if cursorPosY == 4 then
			--moveTxt = (eventMenu - 4) * 15
		--elseif cursorPosY == 1 then
			--moveTxt = (eventMenu - 1) * 15
		--end	
		--if #t_eventMenu <= 4 then
			--maxMissions = #t_eventMenu
		--elseif eventMenu - cursorPosY > 0 then
			--maxMissions = eventMenu + 14 - cursorPosY
		--else
			--maxMissions = 4
		--end		
		animDraw(f_animVelocity(optionsBG0, -1, -1))
		--Draw Below Table
		animSetWindow(optionsBG1, 40,135, 240,#t_eventMenu*15)
		animDraw(f_animVelocity(optionsBG1, -1, -1))
		--Draw Above Table
		animSetWindow(missionBG1, 0,5, 320,110)
		animDraw(f_animVelocity(missionBG1, -1, -1))
		textImgDraw(txt_eventMenu)
		missionList = eventMenu --Uses menu position to show image in these order
		f_missionPreview() --Show mission image preview
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
		t_eventMenu[1].varText = mission1Progress
		t_eventMenu[2].varText = mission2Progress
		t_eventMenu[3].varText = mission3Progress
		t_eventMenu[4].varText = mission4Progress
		t_eventMenu[5].varText = mission5Progress
		t_eventMenu[6].varText = mission6Progress
		for i=1, #t_eventMenu do
			textImgDraw(t_eventMenu[i].id)
			if t_eventMenu[i].varID ~= nil then
				textImgDraw(f_updateTextImg(t_eventMenu[i].varID, font2, 0, -1, t_eventMenu[i].varText, 275, 130+i*15))
			end
		end
		animSetWindow(cursorBox, 40,120+eventMenu*15, 240,15)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		cmdInput()
		refresh()
	end
end