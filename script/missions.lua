
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
	animSetScale(missionPreview, 0.168, 0.125)
	animSetPos(missionPreview, 50, 21)
	animUpdate(missionPreview)
	animDraw(missionPreview)
	return missionPreview
end

--;===========================================================
--; MISSIONS MENU
--;===========================================================
t_missionMenu = {
	{varID = textImgNew(), name = "Target Confirmed", 		   info = "Defeat Original Kung Fu Man!", 	  		status = "INCOMPLETE"}, --Add Mission Slot
	{varID = textImgNew(), name = "True Kung Fu Spirit",  	   info = "Use the full power of Kung Fu Man!", 	status = "INCOMPLETE"},
	{varID = textImgNew(), name = "Unlimited Power",		   info = "Kung Fu Girl's power is out of control, defeat everyone!", 	status = "INCOMPLETE"},
	{varID = textImgNew(), name = "PROGRAM YOUR MISSION HERE", info = "???", 								  	status = ""},
	{varID = textImgNew(), name = "PROGRAM YOUR MISSION HERE", info = "???", 								 	status = ""},
	{varID = textImgNew(), name = "PROGRAM YOUR MISSION HERE", info = "???", 								  	status = ""},
	{varID = textImgNew(), name = "PROGRAM YOUR MISSION HERE", info = "???", 								 	status = ""},
	{varID = textImgNew(), name = "PROGRAM YOUR MISSION HERE", info = "???", 								  	status = ""},
	{varID = textImgNew(), name = "PROGRAM YOUR MISSION HERE", info = "???", 								  	status = ""},
	{varID = textImgNew(), name = "PROGRAM YOUR MISSION HERE", info = "???", 								  	status = ""},
}

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
		data.missionsProgress = data.mission1Status + data.mission2Status + data.mission3Status
		missionsData = (math.floor((data.missionsProgress * 100 / 3) + 0.5)) --The number (3) is the amount of all data.missionStatus
		txt_missionMenu = createTextImg(jgFnt, 0, -1, "MISSION SELECT:", 195, 128)
		txt_missionProgress = createTextImg(jgFnt, 2, 1, "["..missionsData.."%]", 202, 128) --needs to be inside of mission Menu function, to load mission data %
		if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
			f_saveProgress()
			data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30) then
			sndPlay(sysSnd, 100, 0)
			missionMenu = missionMenu - 1
		elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30) then
			sndPlay(sysSnd, 100, 0)
			missionMenu = missionMenu + 1
		elseif btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then
			f_default()
			data.missionNo = missionMenu --with this data.missionNo is sync with menu item selected
			data.rosterMode = "mission"
			setGameMode('mission')
			data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
			sndPlay(sysSnd, 100, 1)
		--MISSION 1
			if missionMenu == 1 then
				playVideo("movie/The Lost Chapter.wmv")
				setRoundTime(-1)
				setRoundsToWin(1)
				data.p1TeamMenu = {mode = 0, chars = 1}
				data.p1Char = {t_charAdd["kung fu man/evil/evil kung fu man.def"]}
				data.p1Pal = 1
				data.p2TeamMenu = {mode = 0, chars = 1}
				data.p2Char = {t_charAdd["kung fu man"]}
				data.p2Pal = 1
				data.stage = {t_stageDef["stages/mountainside temple/dark corridor.def"]} --Because there's not char or stage select, if you select give up option in pause menu, you will get an error.
				data.versusScreen = false
				textImgSetText(txt_mainSelect, "MISSION "..data.missionNo.." [" .. t_missionMenu[data.missionNo].status .. "]")
				script.select.f_selectSimple()
				if script.select.winner == 1 then f_missionStatus() end --Save progress only if you win
		--MISSION 2
			elseif missionMenu == 2 then
				setRoundTime(-1)
				data.p1TeamMenu = {mode = 0, chars = 1}
				data.p1Char = {t_charAdd["kung fu man/master/master kung fu man.def"]}
				data.p1Pal = 1
				data.p2SelectMenu = false
				data.challengerScreen = false
				data.gameMode = "arcade"
				script.select.f_selectAdvance()
				if script.select.winner == 1 then f_missionStatus() end
		--MISSION 3
			elseif missionMenu == 3 then
				setRoundTime(-1)
				setRoundsToWin(1)
				data.p1TeamMenu = {mode = 0, chars = 1}
				data.p1Char = {t_charAdd['kung fu girl/master/master kung fu girl.def']}
				data.p1Pal = 1
				--data.p2TeamMenu = {mode = 2, chars = 4}
				data.p2SelectMenu = false
				data.stageMenu = true
				data.versusScreen = false
				data.gameMode = "survival"
				script.select.f_selectAdvance()
				if script.select.winner == 1 then f_missionStatus() end 
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
		elseif ((commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u')) or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30)) and cursorPosY > 1 then
			cursorPosY = cursorPosY - 1
		elseif ((commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd')) or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30)) and cursorPosY < 6 then
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
	--Draw Above Transparent BG
		animSetScale(missionBG1, 219.5, 94)
		animSetWindow(missionBG1, 0,5, 320,110)
		animDraw(missionBG1)
	--Draw Empty Mission Icon
		animSetPos(missionUnknown, 50, 21)
		animSetScale(missionUnknown, 0.168, 0.18)
		animUpdate(missionUnknown)
		animDraw(missionUnknown)
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
		textImgDraw(f_updateTextImg(t_missionMenu[missionMenu].varID, font11, 0, 0, t_missionMenu[missionMenu].info, 157, 13.5))
	--Set mission status
		if data.mission1Status == 1 then t_missionMenu[1].status = "COMPLETED" end
		if data.mission2Status == 1 then t_missionMenu[2].status = "COMPLETED" end
		if data.mission3Status == 1 then t_missionMenu[3].status = "COMPLETED" end
	--Draw Text for Below Table
		for i=1, maxMissions do
			if i > missionMenu - cursorPosY then
				if t_missionMenu[i].varID ~= nil then
					textImgDraw(f_updateTextImg(t_missionMenu[i].varID, font2, 0, 1, t_missionMenu[i].name, 45, 135+i*15-moveTxt))
					textImgDraw(f_updateTextImg(t_missionMenu[i].varID, font2, 0, -1, t_missionMenu[i].status, 275, 135+i*15-moveTxt))
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
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		if commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu') then
			bufd = 0
			bufu = bufu + 1
		elseif commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd') then
			bufu = 0
			bufd = bufd + 1
		else
			bufu = 0
			bufd = 0
		end
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; MISSION SAVE DATA
--;===========================================================
function f_missionStatus()
	if data.missionNo == 1 then data.mission1Status = 1
	elseif data.missionNo == 2 then data.mission2Status = 1
	elseif data.missionNo == 3 then data.mission3Status = 1
	end
	f_saveProgress()
	assert(loadfile("save/stats_sav.lua"))()
end
