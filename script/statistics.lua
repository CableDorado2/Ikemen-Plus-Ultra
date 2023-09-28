
module(..., package.seeall)

--;===========================================================
--; STATISTICS SCREENPACK
--;===========================================================
--Scrolling background
statsBG0 = animNew(sysSff, [[
100,0, 0,0, -1
]])
animAddPos(statsBG0, 160, 0)
animSetTile(statsBG0, 1, 1)
animSetColorKey(statsBG0, -1)

--Transparent background
statsBG1 = animNew(sysSff, [[
3,0, 0,0, -1
]])
animSetPos(statsBG1, 30, 20)
animSetAlpha(statsBG1, 20, 100)
animUpdate(statsBG1)

--Up Arrow
statsUpArrow = animNew(sysSff, [[
225,0, 0,0, 10
225,1, 0,0, 10
225,2, 0,0, 10
225,3, 0,0, 10
225,3, 0,0, 10
225,2, 0,0, 10
225,1, 0,0, 10
225,0, 0,0, 10
]])
animAddPos(statsUpArrow, 278, 11)
animUpdate(statsUpArrow)
animSetScale(statsUpArrow, 0.5, 0.5)

--Down Arrow
statsDownArrow = animNew(sysSff, [[
226,0, 0,0, 10
226,1, 0,0, 10
226,2, 0,0, 10
226,3, 0,0, 10
226,3, 0,0, 10
226,2, 0,0, 10
226,1, 0,0, 10
226,0, 0,0, 10
]])
animAddPos(statsDownArrow, 278, 231)
animUpdate(statsDownArrow)
animSetScale(statsDownArrow, 0.5, 0.5)

--;===========================================================
--; STATISTICS MENU
--;===========================================================
t_statsMenu = {
	{id = '', text = 'Play Time',	  				varID = textImgNew(), varText = ''},
	{id = '', text = 'Matchs Played',  				varID = textImgNew(), varText = ''},
	{id = '', text = 'Wins',	     				varID = textImgNew(), varText = ''},
	{id = '', text = 'Losses',	     				varID = textImgNew(), varText = ''},
	{id = '', text = 'Favorite Character',  		varID = textImgNew(), varText = ''},
	{id = '', text = 'Favorite Stage',				varID = textImgNew(), varText = ''},
	{id = '', text = 'Preferred Game Mode', 		varID = textImgNew(), varText = ''},
	{id = '', text = 'Collected Coins',    			varID = textImgNew(), varText = ''},
	{id = '', text = 'Arcade Status',     			varID = textImgNew(), varText = ''},
	{id = '', text = 'Survival Status',     		varID = textImgNew(), varText = ''},
	{id = '', text = 'Missions Completed',     		varID = textImgNew(), varText = ''},
	{id = '', text = 'Events Completed',     		varID = textImgNew(), varText = ''},
	{id = '', text = 'Boss Rush Record',     		varID = textImgNew(), varText = ''},
	{id = '', text = 'Sudden Death Record',    		varID = textImgNew(), varText = ''},
	{id = '', text = 'Endless Record',    			varID = textImgNew(), varText = ''},
	{id = '', text = 'Time Attack Record',    		varID = textImgNew(), varText = ''},
	{id = '', text = '                   BACK',    	varID = textImgNew(), varText = ''},
}

function f_statsMenu()
	cmdInput()
	local cursorPosY = 1
	local moveTxt = 0
	local statsMenu = 1
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	local arcadeWins = false
	local vsWins = false
	local survivalWins = false
	local bossWins = false
	--local bonusWins = false
	--local timeWins = false
	--local suddenWins = false
	--local cpuWins = false
	--local eventWins = false
	--local missionWins = false
	--local endlessWins = false
	--local legionWins = false
	--local towerWins = false
	--local storyWins = false
	--local tourneyWins = false
	--local adventureWins = false
	data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
	while true do
		--f_playTime() --Test Played Time on live...
		--Progress Logic
		if data.arcadeUnlocks == true then arcadeProgress = 1 elseif data.arcadeUnlocks == false then arcadeProgress = 0 end
		if data.survivalUnlocks == true then survivalProgress = 1 elseif data.survivalUnlocks == false then survivalProgress = 0 end
		gameProgress = (arcadeProgress + survivalProgress + data.missionsProgress + data.eventsProgress)
		gameData = (math.floor((gameProgress * 100 / 6) + 0.5)) --The number (6) is the sumation of true amount of all gameProgress values (arcadeProgress = 1 + survivalProgress = 1 + missionsProgress = 3 + eventsProgress = 1)
		txt_statsMenu = createTextImg(jgFnt, 0, -1, '' .. data.userName .. ' PROGRESS:', 202, 13)
		txt_statsProgress = createTextImg(jgFnt, 2, 1, '['..gameData..'%]', 208, 13) --needs to be inside of statistics Menu function, to load a updated data
		if esc() then
			data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') or (commandGetState(p1Cmd, 'holdu') and bufu >= 30) then
			sndPlay(sysSnd, 100, 0)
			statsMenu = statsMenu - 1
		elseif commandGetState(p1Cmd, 'd') or (commandGetState(p1Cmd, 'holdd') and bufd >= 30) then
			sndPlay(sysSnd, 100, 0)
			statsMenu = statsMenu + 1
		--BACK
		elseif btnPalNo(p1Cmd) > 0 and statsMenu == #t_statsMenu then
			data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
			sndPlay(sysSnd, 100, 2)
			break
		end
		--Cursor position calculation
		if statsMenu < 1 then
			statsMenu = #t_statsMenu
			if #t_statsMenu > 14 then
				cursorPosY = 14
			else
				cursorPosY = #t_statsMenu
			end
		elseif statsMenu > #t_statsMenu then
			statsMenu = 1
			cursorPosY = 1
		elseif (commandGetState(p1Cmd, 'u') or (commandGetState(p1Cmd, 'holdu') and bufu >= 30)) and cursorPosY > 1 then
			cursorPosY = cursorPosY - 1
		elseif (commandGetState(p1Cmd, 'd') or (commandGetState(p1Cmd, 'holdd') and bufd >= 30)) and cursorPosY < 14 then
			cursorPosY = cursorPosY + 1
		end
		if cursorPosY == 14 then
			moveTxt = (statsMenu - 14) * 15
		elseif cursorPosY == 1 then
			moveTxt = (statsMenu - 1) * 15
		end	
		if #t_statsMenu <= 14 then
			maxStats = #t_statsMenu
		elseif statsMenu - cursorPosY > 0 then
			maxStats = statsMenu + 14 - cursorPosY
		else
			maxStats = 14
		end
		animDraw(f_animVelocity(statsBG0, -1, -1))
		--Draw Transparent Table BG
		animSetScale(statsBG1, 280, maxStats*15)
		animSetWindow(statsBG1, 30,20, 260,210)
		animDraw(statsBG1)
		--Draw Title Menu
		textImgDraw(txt_statsMenu)
		textImgDraw(txt_statsProgress)
		--Draw Stats Table Cursor
		animSetWindow(cursorBox, 30,5+cursorPosY*15, 260,15)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		--Draw Stats Info
		s = math.floor((data.playTime%60))
		m = math.floor((data.playTime%3600)/60)
		h = math.floor((data.playTime%86400)/3600)
		d = math.floor(data.playTime/86400)
		--timePlayed = string.format("%d:Days %02d:Hours %02d:Minutes %02d:Seconds", d, h, m, s)
		timePlayed = string.format("%d:Days %02d:Hours %02d:Minutes", d, h, m)
		t_statsMenu[1].varText = timePlayed
		t_statsMenu[2].varText = (data.victories+data.defeats)
		t_statsMenu[3].varText = data.victories
		t_statsMenu[4].varText = data.defeats
		t_statsMenu[5].varText = data.favoriteChar
		t_statsMenu[6].varText = data.favoriteStage
		--Preferred Mode Logic
		if data.arcademodeCnt > data.vsmodeCnt and data.vsmodeCnt < data.arcademodeCnt then arcadeWins = true
		elseif data.arcademodeCnt < data.vsmodeCnt and data.vsmodeCnt > data.arcademodeCnt then arcadeWins = false
		elseif data.arcademodeCnt > data.survivalmodeCnt and data.survivalmodeCnt < data.arcademodeCnt then arcadeWins = true
		elseif data.arcademodeCnt < data.survivalmodeCnt and data.survivalmodeCnt > data.arcademodeCnt then arcadeWins = false
		elseif data.arcademodeCnt > data.bossrushmodeCnt and data.bossrushmodeCnt < data.arcademodeCnt then arcadeWins = true
		elseif data.arcademodeCnt < data.bossrushmodeCnt and data.bossrushmodeCnt > data.arcademodeCnt then arcadeWins = false
		end
		--
		if data.vsmodeCnt > data.arcademodeCnt and data.arcademodeCnt < data.vsmodeCnt then vsWins = true
		elseif data.vsmodeCnt < data.arcademodeCnt and data.arcademodeCnt > data.vsmodeCnt then vsWins = false
		elseif data.vsmodeCnt > data.survivalmodeCnt and data.survivalmodeCnt < data.vsmodeCnt then vsWins = true
		elseif data.vsmodeCnt < data.survivalmodeCnt and data.survivalmodeCnt > data.vsmodeCnt then vsWins = false
		elseif data.vsmodeCnt > data.bossrushmodeCnt and data.bossrushmodeCnt < data.vsmodeCnt then vsWins = true
		elseif data.vsmodeCnt < data.bossrushmodeCnt and data.bossrushmodeCnt > data.vsmodeCnt then vsWins = false
		end
		--
		if data.survivalmodeCnt > data.arcademodeCnt and data.arcademodeCnt < data.survivalmodeCnt then survivalWins = true
		elseif data.survivalmodeCnt < data.arcademodeCnt and data.arcademodeCnt > data.survivalmodeCnt then survivalWins = false
		elseif data.survivalmodeCnt > data.vsmodeCnt and data.vsmodeCnt < data.survivalmodeCnt then survivalWins = true
		elseif data.survivalmodeCnt < data.vsmodeCnt and data.vsmodeCnt > data.survivalmodeCnt then survivalWins = false
		elseif data.survivalmodeCnt > data.bossrushmodeCnt and data.bossrushmodeCnt < data.survivalmodeCnt then survivalWins = true
		elseif data.survivalmodeCnt < data.bossrushmodeCnt and data.bossrushmodeCnt > data.survivalmodeCnt then survivalWins = false
		end
		--
		if data.bossrushmodeCnt > data.arcademodeCnt and data.arcademodeCnt < data.bossrushmodeCnt then bossWins = true
		elseif data.bossrushmodeCnt < data.arcademodeCnt and data.arcademodeCnt > data.bossrushmodeCnt then bossWins = false
		elseif data.bossrushmodeCnt > data.vsmodeCnt and data.vsmodeCnt < data.bossrushmodeCnt then bossWins = true
		elseif data.bossrushmodeCnt < data.vsmodeCnt and data.vsmodeCnt > data.bossrushmodeCnt then bossWins = false
		elseif data.bossrushmodeCnt > data.survivalmodeCnt and data.survivalmodeCnt < data.bossrushmodeCnt then bossWins = true
		elseif data.bossrushmodeCnt < data.survivalmodeCnt and data.survivalmodeCnt > data.bossrushmodeCnt then bossWins = false
		end
		--AAAAAAAAAAAAAAAAAAAAAAAAA
		if arcadeWins == true then t_statsMenu[7].varText = 'Arcade'
		elseif vsWins == true then t_statsMenu[7].varText = 'Versus'
		elseif survivalWins == true then t_statsMenu[7].varText = 'Survival'
		elseif bossWins == true then t_statsMenu[7].varText = 'Boss Rush'
		--elseif bonusWins == true then t_statsMenu[7].varText = 'Bonus Rush'
		--elseif timeWins == true then t_statsMenu[7].varText = 'Time Attack'
		--elseif suddenWins == true then t_statsMenu[7].varText = 'Sudden Death'
		--elseif cpuWins == true then t_statsMenu[7].varText = 'CPU Match'
		--elseif eventWins == true then t_statsMenu[7].varText = 'Events'
		--elseif missionWins == true then t_statsMenu[7].varText = 'Missions'
		--elseif endlessWins == true then t_statsMenu[7].varText = 'Endless'
		--elseif legionWins == true then t_statsMenu[7].varText = 'Legion'
		--elseif towerWins == true then t_statsMenu[7].varText = 'Tower'
		--elseif storyWins == true then t_statsMenu[7].varText = 'Story'
		--elseif tourneyWins == true then t_statsMenu[7].varText = 'Tourney'
		--elseif adventureWins == true then t_statsMenu[7].varText = 'Adventure'
		--else t_statsMenu[6].varText = 'None'
		end
		t_statsMenu[7].varText = 'WIP'
		t_statsMenu[8].varText = data.coins
		if data.arcadeUnlocks == false then t_statsMenu[9].varText = 'INCOMPLETE' elseif data.arcadeUnlocks == true then t_statsMenu[9].varText = 'COMPLETED' end
		if data.survivalUnlocks == false then t_statsMenu[10].varText = 'INCOMPLETE' elseif data.survivalUnlocks == true then t_statsMenu[10].varText = 'COMPLETED' end
		t_statsMenu[11].varText = data.missionsProgress..'/3'
		t_statsMenu[12].varText = data.eventsProgress..'/1'
		t_statsMenu[13].varText = data.bossrecord..' Wins'
		t_statsMenu[14].varText = data.suddenrecord..' Wins'
		t_statsMenu[15].varText = data.endlessrecord..' Wins'
		t_statsMenu[16].varText = 'WIP'--timerecord..''
		--Draw Text for Table
		for i=1, maxStats do
			if i > statsMenu - cursorPosY then
				if t_statsMenu[i].varID ~= nil then
					textImgDraw(f_updateTextImg(t_statsMenu[i].varID, font2, 0, 1, t_statsMenu[i].text, 35, 15+i*15-moveTxt))
					textImgDraw(f_updateTextImg(t_statsMenu[i].varID, font2, 0, -1, t_statsMenu[i].varText, 286, 15+i*15-moveTxt))
				end
			end
		end
		--Draw Up Animated Cursor
		if maxStats > 14 then
			animDraw(statsUpArrow)
			animUpdate(statsUpArrow)
		end
		--Draw Down Animated Cursor
		if #t_statsMenu > 14 and maxStats < #t_statsMenu then
			animDraw(statsDownArrow)
			animUpdate(statsDownArrow)
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