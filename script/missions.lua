
module(..., package.seeall)

--;===========================================================
--; MISSIONS SCREENPACK
--;===========================================================
--Scrolling background
missionBG0 = animNew(sysSff, [[
100,0, 0,0, -1
]])
animAddPos(missionBG0, 160, 0)
animSetTile(missionBG0, 1, 1)
animSetColorKey(missionBG0, -1)

--Above Transparent background
missionBG1 = animNew(sysSff, [[
3,0, 0,0, -1
]])
animSetPos(missionBG1, 48, 19)
animSetAlpha(missionBG1, 20, 100)
animUpdate(missionBG1)

--Below Transparent background
missionBG2 = animNew(sysSff, [[
3,0, 0,0, -1
]])
animSetPos(missionBG2, 40, 140)
animSetAlpha(missionBG2, 20, 100)
animUpdate(missionBG2)

--Up Special Arrow
arrowsMSU = animNew(sysSff, [[
225,0, 0,0, 10
225,1, 0,0, 10
225,2, 0,0, 10
225,3, 0,0, 10
225,3, 0,0, 10
225,2, 0,0, 10
225,1, 0,0, 10
225,0, 0,0, 10
]])
animAddPos(arrowsMSU, 155, 131)
animUpdate(arrowsMSU)
animSetScale(arrowsMSU, 0.5, 0.5)

--Down Special Arrow
arrowsMSD = animNew(sysSff, [[
226,0, 0,0, 10
226,1, 0,0, 10
226,2, 0,0, 10
226,3, 0,0, 10
226,3, 0,0, 10
226,2, 0,0, 10
226,1, 0,0, 10
226,0, 0,0, 10
]])
animAddPos(arrowsMSD, 155, 231)
animUpdate(arrowsMSD)
animSetScale(arrowsMSD, 0.5, 0.5)

--Unknown Mission Preview
missionUnknown = animNew(sysSff, [[110,4, 0,0,]])

--Missions Preview
function f_missionPreview()
	missionPreview = ''
	missionPreview = '0,' .. missionList-1 .. ', 0,0, 0'
	missionPreview = animNew(missionSff, missionPreview)
	animSetScale(missionPreview, 0.4, 0.25)
	animSetPos(missionPreview, 50, 21)
	animUpdate(missionPreview)
	animDraw(missionPreview)
	return missionPreview
end

--;===========================================================
--; MISSIONS MENU
--;===========================================================
t_missionMenu = {
	{id = '', text = 'Warrior Clone',	    			varID = textImgNew(), varText = mission1Progress},
	{id = '', text = 'Target Confirmed',     			varID = textImgNew(), varText = mission2Progress},
	{id = '', text = 'True Kung Fu Spirit',  			varID = textImgNew(), varText = mission3Progress},
	{id = '', text = 'PROGRAM YOUR MISSION HERE',		varID = textImgNew(), varText = 'UNDEFINED'},
	{id = '', text = 'PROGRAM YOUR MISSION HERE',		varID = textImgNew(), varText = 'UNDEFINED'},
	{id = '', text = 'PROGRAM YOUR MISSION HERE',		varID = textImgNew(), varText = 'UNDEFINED'},
	{id = '', text = 'PROGRAM YOUR MISSION HERE',		varID = textImgNew(), varText = 'UNDEFINED'},
	{id = '', text = 'PROGRAM YOUR MISSION HERE',		varID = textImgNew(), varText = 'UNDEFINED'},
	{id = '', text = 'PROGRAM YOUR MISSION HERE',		varID = textImgNew(), varText = 'UNDEFINED'},
	{id = '', text = 'PROGRAM YOUR MISSION HERE',		varID = textImgNew(), varText = 'UNDEFINED'},
	{id = '', text = '                 BACK',			varID = textImgNew(), varText = ''},
}

t_mInfo = {
	{id = '1', text = "Another Kung Fu Man Clone appears!"},
	{id = '2', text = "Defeat Original Kung Fu Man!"},
	{id = '3', text = "Use the full power of Kung Fu Man!"},
	{id = '4', text = "???"},
	{id = '5', text = "???"},
	{id = '6', text = "???"},
	{id = '7', text = "???"},
	{id = '8', text = "???"},
	{id = '9', text = "???"},
	{id = '10', text = "???"},
}
for i=1, #t_mInfo do
	t_mInfo[i].id = createTextImg(font11, 0, 0, t_mInfo[i].text, 157, 13.5)
end

function f_missionMenu()
	cmdInput()
	local missionMenu = 1
	local cursorPosY = 1
	local moveTxt = 0
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	missionList = 0 --Important to avoid errors when read missionPreview
	data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
	while true do
--Missions Progress Logic
	if data.mission1Status == 1 then mission1Progress = 'COMPLETED' elseif data.mission1Status == 0 then mission1Progress = 'INCOMPLETE' end
	if data.mission2Status == 1 then mission2Progress = 'COMPLETED' elseif data.mission2Status == 0 then mission2Progress = 'INCOMPLETE' end
	if data.mission3Status == 1 then mission3Progress = 'COMPLETED' elseif data.mission3Status == 0 then mission3Progress = 'INCOMPLETE' end
	data.missionsProgress = data.mission1Status + data.mission2Status + data.mission3Status
	missionsData = (math.floor((data.missionsProgress * 100 / 3) + 0.5)) --The number (3) is the amount of all data.missionStatus
	txt_missionMenu = createTextImg(jgFnt, 0, -1, 'MISSION SELECT:', 195, 128)
	txt_missionProgress = createTextImg(jgFnt, 2, 1, '['..missionsData..'%]', 202, 128) --needs to be inside of mission Menu function, to load mission data %
		if esc() or commandGetState(p1Cmd, 'e') then
			f_saveProgress()
			data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') or (commandGetState(p1Cmd, 'holdu') and bufu >= 30) then
			sndPlay(sysSnd, 100, 0)
			missionMenu = missionMenu - 1
		elseif commandGetState(p1Cmd, 'd') or (commandGetState(p1Cmd, 'holdd') and bufd >= 30) then
			sndPlay(sysSnd, 100, 0)
			missionMenu = missionMenu + 1
		elseif btnPalNo(p1Cmd) > 0 then
			f_default()
			data.rosterMode = 'mission'
			setGameMode('mission')
		--EX KUNG FU MAN
			if missionMenu == 1 then
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 1)
				setRoundTime(-1)
				setRoundsToWin(1)
				data.p1TeamMenu = {mode = 0, chars = 1}
				data.p1Char = {t_charAdd['kung fu man/ex/ex kung fu man.def']}
				data.p2TeamMenu = {mode = 0, chars = 1}
				data.p2Char = {t_charAdd['kung fu man/master/master kung fu man.def']}
				data.stage = {t_stageDef["stages/mountainside temple/dark corridor.def"]}
				data.missionNo = '1'
				textImgSetText(txt_mainSelect, 'MISSION 1 [' .. mission1Progress .. ']')
				script.select.f_selectSimple()
				if script.select.winner == 1 then f_missionStatus() end --Save progress only if you win
		--EVIL KUNG FU MAN
			elseif missionMenu == 2 then
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 1)
				setRoundTime(-1)
				setRoundsToWin(1)
				data.p1TeamMenu = {mode = 0, chars = 1}
				data.p1Char = {t_charAdd['kung fu man/evil/evil kung fu man.def']}
				data.p1Pal = 1
				data.p2TeamMenu = {mode = 0, chars = 1}
				data.p2Char = {t_charAdd['kung fu man']}
				data.p2Pal = 1
				data.stageMenu = true
				data.versusScreen = false
				data.missionNo = '2'
				textImgSetText(txt_mainSelect, 'MISSION 2 [' .. mission2Progress .. ']')
				script.select.f_selectSimple()
				if script.select.winner == 1 then f_missionStatus() end
		--MASTER KUNG FU MAN
			elseif missionMenu == 3 then
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 1)
				setRoundTime(-1)
				data.p2In = 1
				data.p1TeamMenu = {mode = 0, chars = 1}
				data.p1Char = {t_charAdd['kung fu man/master/master kung fu man.def']}
				data.p1Pal = 1
				data.challengerScreen = false
				data.gameMode = 'arcade'
				data.missionNo = '3'
				script.select.f_selectAdvance()
				if script.select.winner == 1 then f_missionStatus() end
		--MISSION 4
			elseif missionMenu == 4 then
				--data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 1)
		--MISSION 5
			elseif missionMenu == 5 then
				--data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 1)
		--MISSION 6
			elseif missionMenu == 6 then
				--data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 1)
		--MISSION 7
			elseif missionMenu == 7 then
				--data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 1)
		--MISSION 8
			elseif missionMenu == 8 then
				--data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 1)
		--MISSION 9
			elseif missionMenu == 9 then
				--data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 1)
		--MISSION 10
			elseif missionMenu == 10 then
				--data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 1)
		--BACK
			else
				f_saveProgress()
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 2)
				break
			end			
		end
	--Cursor position calculation
		if missionMenu < 1 then
			missionMenu = #t_missionMenu
			if #t_missionMenu > 6 then
				cursorPosY = 6
			else
				cursorPosY = #t_missionMenu
			end
		elseif missionMenu > #t_missionMenu then
			missionMenu = 1
			cursorPosY = 1
		elseif (commandGetState(p1Cmd, 'u') or (commandGetState(p1Cmd, 'holdu') and bufu >= 30)) and cursorPosY > 1 then
			cursorPosY = cursorPosY - 1
		elseif (commandGetState(p1Cmd, 'd') or (commandGetState(p1Cmd, 'holdd') and bufd >= 30)) and cursorPosY < 6 then
			cursorPosY = cursorPosY + 1
		end
		if cursorPosY == 6 then
			moveTxt = (missionMenu - 6) * 15
		elseif cursorPosY == 1 then
			moveTxt = (missionMenu - 1) * 15
		end
		if #t_missionMenu <= 6 then
			maxMissions = #t_missionMenu
		elseif missionMenu - cursorPosY > 0 then
			maxMissions = missionMenu + 6 - cursorPosY
		else
			maxMissions = 6
		end
		animDraw(f_animVelocity(missionBG0, -1, -1))
		if missionMenu == #t_missionMenu then --If you are in the last item from table
		--Dont Draw Above Transparent BG
		else
		--Draw Above Transparent BG
			animSetScale(missionBG1, 219.5, 94)
			animSetWindow(missionBG1, 0,5, 320,110)
			animDraw(missionBG1)
		--Draw Empty Mission Icon
			animSetPos(missionUnknown, 50, 21)
			animSetScale(missionUnknown, 0.168, 0.18)
			animUpdate(missionUnknown)
			animDraw(missionUnknown)
		end
	--Draw Title Menu
		textImgDraw(txt_missionMenu)
		textImgDraw(txt_missionProgress)
	--Draw Below Transparent Table BG
		animSetScale(missionBG2, 240, maxMissions*15)
		animSetWindow(missionBG2, 10,20, 269,210)
		animDraw(missionBG2)
	--Draw Below Table Cursor
		animSetWindow(cursorBox, 40,125+cursorPosY*15, 239,15)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		missionList = missionMenu --Uses menu position to show image in these order
		f_missionPreview() --Show mission image preview
	--Draw Mission Info
		if missionMenu == 1 then
			for i=1, #t_mInfo do
				textImgDraw(t_mInfo[1].id)
			end
		elseif missionMenu == 2 then
			for i=1, #t_mInfo do
				textImgDraw(t_mInfo[2].id)
			end
		elseif missionMenu == 3 then
			for i=1, #t_mInfo do
				textImgDraw(t_mInfo[3].id)
			end
		elseif missionMenu == 4 then
			for i=1, #t_mInfo do
				textImgDraw(t_mInfo[4].id)
			end
		elseif missionMenu == 5 then
			for i=1, #t_mInfo do
				textImgDraw(t_mInfo[5].id)
			end
		elseif missionMenu == 6 then
			for i=1, #t_mInfo do
				textImgDraw(t_mInfo[6].id)
			end
		elseif missionMenu == 7 then
			for i=1, #t_mInfo do
				textImgDraw(t_mInfo[7].id)
			end
		elseif missionMenu == 8 then
			for i=1, #t_mInfo do
				textImgDraw(t_mInfo[8].id)
			end
		elseif missionMenu == 9 then
			for i=1, #t_mInfo do
				textImgDraw(t_mInfo[9].id)
			end
		elseif missionMenu == 10 then
			for i=1, #t_mInfo do
				textImgDraw(t_mInfo[10].id)
			end
		end
	--Set mission status
		t_missionMenu[1].varText = mission1Progress
		t_missionMenu[2].varText = mission2Progress
		t_missionMenu[3].varText = mission3Progress
	--Draw Text for Below Table
		for i=1, maxMissions do
			if i > missionMenu - cursorPosY then
				if t_missionMenu[i].varID ~= nil then
					textImgDraw(f_updateTextImg(t_missionMenu[i].varID, font2, 0, 1, t_missionMenu[i].text, 45, 135+i*15-moveTxt))
					textImgDraw(f_updateTextImg(t_missionMenu[i].varID, font2, 0, -1, t_missionMenu[i].varText, 275, 135+i*15-moveTxt))
				end
			end
		end
	--Draw Up Animated Cursor
		if maxMissions > 6 then
			animDraw(arrowsMSU)
			animUpdate(arrowsMSU)
		end
	--Draw Down Animated Cursor
		if #t_missionMenu > 6 and maxMissions < #t_missionMenu then
			animDraw(arrowsMSD)
			animUpdate(arrowsMSD)
		end
		if commandGetState(p1Cmd, 'holdu') then
			bufd = 0
			bufu = bufu + 1
		elseif commandGetState(p1Cmd, 'holdd') then
			bufu = 0
			bufd = bufd + 1
		else
			bufu = 0
			bufd = 0
		end
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; MISSION SAVE DATA
--;===========================================================
function f_missionStatus()
	if data.missionNo == '1' then data.mission1Status = 1
	elseif data.missionNo == '2' then data.mission2Status = 1
	elseif data.missionNo == '3' then data.mission3Status = 1
	end
	f_saveProgress()
	assert(loadfile('save/stats_sav.lua'))()
end
