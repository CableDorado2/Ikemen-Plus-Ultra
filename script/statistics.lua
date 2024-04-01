
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
	{varID = textImgNew(), text = "Play Time",	  				varText = ""},
	{varID = textImgNew(), text = "Matchs Played",  			varText = ""},
	{varID = textImgNew(), text = "Wins",	     				varText = ""},
	{varID = textImgNew(), text = "Losses",	     				varText = ""},
	{varID = textImgNew(), text = "Favorite Character",  		varText = ""},
	{varID = textImgNew(), text = "Favorite Stage",				varText = ""},
	{varID = textImgNew(), text = "Preferred Game Mode", 		varText = ""},
	{varID = textImgNew(), text = "Training Time",  			varText = ""},
	{varID = textImgNew(), text = "Collected Coins",    		varText = ""},
	{varID = textImgNew(), text = "Arcade Status",     			varText = ""},
	{varID = textImgNew(), text = "Survival Status",     		varText = ""},
	{varID = textImgNew(), text = "Stories Completed",     		varText = ""},
	{varID = textImgNew(), text = "Missions Completed",     	varText = ""},
	{varID = textImgNew(), text = "Events Completed",     		varText = ""},
	{varID = textImgNew(), text = "Boss Rush Record",     		varText = ""},
	{varID = textImgNew(), text = "Sudden Death Record",    	varText = ""},
	{varID = textImgNew(), text = "Endless Record",    			varText = ""},
	{varID = textImgNew(), text = "Time Attack Record",    		varText = ""},
	{varID = textImgNew(), text = "Score Attack Record",    	varText = ""},
	{varID = textImgNew(), text = "                   BACK",    varText = ""},
}

function f_getStats()
--Progress Logic
	f_gameState() --Read from main.lua
	txt_statsMenu = createTextImg(jgFnt, 0, -1, "" .. data.userName .. " PROGRESS:", 202, 13)
	txt_statsProgress = createTextImg(jgFnt, 2, 1, "["..gameData.."%]", 208, 13) --needs to be inside of statistics Menu function, to load a updated data
--Get Stats Info
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
	t_statsMenu[5].varText = "WIP"--data.favoriteChar
	t_statsMenu[6].varText = "WIP"--data.favoriteStage
	t_statsMenu[7].varText = "None" --If all Preferred Mode are equal
	--Preferred Mode Logic
	if (data.storyTime > data.arcadeTime) and
	   (data.storyTime > data.vsTime) and
	   (data.storyTime > data.survivalTime) and
	   (data.storyTime > data.bossTime) and
	   (data.storyTime > data.bonusTime) and
	   (data.storyTime > data.timeattackTime) and
	   (data.storyTime > data.suddendeathTime) and
	   (data.storyTime > data.cpumatchTime) and
	   (data.storyTime > data.eventsTime) and
	   (data.storyTime > data.missionsTime) and
	   (data.storyTime > data.endlessTime) and
	   (data.storyTime > data.legionTime) and
	   (data.storyTime > data.towerTime) and
	   (data.storyTime > data.tourneyTime) and
	   (data.storyTime > data.adventureTime) then
		t_statsMenu[7].varText = "Story"
	end
	if (data.arcadeTime > data.vsTime) and
	   (data.arcadeTime > data.survivalTime) and
	   (data.arcadeTime > data.bossTime) and
	   (data.arcadeTime > data.bonusTime) and
	   (data.arcadeTime > data.timeattackTime) and
	   (data.arcadeTime > data.suddendeathTime) and
	   (data.arcadeTime > data.cpumatchTime) and
	   (data.arcadeTime > data.eventsTime) and
	   (data.arcadeTime > data.missionsTime) and
	   (data.arcadeTime > data.endlessTime) and
	   (data.arcadeTime > data.legionTime) and
	   (data.arcadeTime > data.towerTime) and
	   (data.arcadeTime > data.storyTime) and
	   (data.arcadeTime > data.tourneyTime) and
	   (data.arcadeTime > data.adventureTime) then
		t_statsMenu[7].varText = "Arcade"
	end
	if (data.vsTime > data.arcadeTime) and
	   (data.vsTime > data.survivalTime) and
	   (data.vsTime > data.bossTime) and
	   (data.vsTime > data.bonusTime) and
	   (data.vsTime > data.timeattackTime) and
	   (data.vsTime > data.suddendeathTime) and
	   (data.vsTime > data.cpumatchTime) and
	   (data.vsTime > data.eventsTime) and
	   (data.vsTime > data.missionsTime) and
	   (data.vsTime > data.endlessTime) and
	   (data.vsTime > data.legionTime) and
	   (data.vsTime > data.towerTime) and
	   (data.vsTime > data.storyTime) and
	   (data.vsTime > data.tourneyTime) and
	   (data.vsTime > data.adventureTime) then
		t_statsMenu[7].varText = "Versus"
	end
	if (data.cpumatchTime > data.arcadeTime) and
	   (data.cpumatchTime > data.vsTime) and
	   (data.cpumatchTime > data.survivalTime) and
	   (data.cpumatchTime > data.bossTime) and
	   (data.cpumatchTime > data.bonusTime) and
	   (data.cpumatchTime > data.timeattackTime) and
	   (data.cpumatchTime > data.suddendeathTime) and
	   (data.cpumatchTime > data.eventsTime) and
	   (data.cpumatchTime > data.missionsTime) and
	   (data.cpumatchTime > data.endlessTime) and
	   (data.cpumatchTime > data.legionTime) and
	   (data.cpumatchTime > data.towerTime) and
	   (data.cpumatchTime > data.storyTime) and
	   (data.cpumatchTime > data.tourneyTime) and
	   (data.cpumatchTime > data.adventureTime) then
		t_statsMenu[7].varText = "CPU Match"
	end
	if (data.survivalTime > data.arcadeTime) and
	   (data.survivalTime > data.vsTime) and
	   (data.survivalTime > data.bossTime) and
	   (data.survivalTime > data.bonusTime) and
	   (data.survivalTime > data.timeattackTime) and
	   (data.survivalTime > data.suddendeathTime) and
	   (data.survivalTime > data.cpumatchTime) and
	   (data.survivalTime > data.eventsTime) and
	   (data.survivalTime > data.missionsTime) and
	   (data.survivalTime > data.endlessTime) and
	   (data.survivalTime > data.legionTime) and
	   (data.survivalTime > data.towerTime) and
	   (data.survivalTime > data.storyTime) and
	   (data.survivalTime > data.tourneyTime) and
	   (data.survivalTime > data.adventureTime) then
		t_statsMenu[7].varText = "Survival"
	end
	if (data.bossTime > data.arcadeTime) and
	   (data.bossTime > data.vsTime) and
	   (data.bossTime > data.survivalTime) and
	   (data.bossTime > data.bonusTime) and
	   (data.bossTime > data.timeattackTime) and
	   (data.bossTime > data.suddendeathTime) and
	   (data.bossTime > data.cpumatchTime) and
	   (data.bossTime > data.eventsTime) and
	   (data.bossTime > data.missionsTime) and
	   (data.bossTime > data.endlessTime) and
	   (data.bossTime > data.legionTime) and
	   (data.bossTime > data.towerTime) and
	   (data.bossTime > data.storyTime) and
	   (data.bossTime > data.tourneyTime) and
	   (data.bossTime > data.adventureTime) then
		t_statsMenu[7].varText = "Boss Fight"
	end
	if (data.bonusTime > data.arcadeTime) and
	   (data.bonusTime > data.vsTime) and
	   (data.bonusTime > data.survivalTime) and
	   (data.bonusTime > data.bossTime) and
	   (data.bonusTime > data.timeattackTime) and
	   (data.bonusTime > data.suddendeathTime) and
	   (data.bonusTime > data.cpumatchTime) and
	   (data.bonusTime > data.eventsTime) and
	   (data.bonusTime > data.missionsTime) and
	   (data.bonusTime > data.endlessTime) and
	   (data.bonusTime > data.legionTime) and
	   (data.bonusTime > data.towerTime) and
	   (data.bonusTime > data.storyTime) and
	   (data.bonusTime > data.tourneyTime) and
	   (data.bonusTime > data.adventureTime) then
		t_statsMenu[7].varText = "Bonus Games"
	end
	if (data.timeattackTime > data.arcadeTime) and
	   (data.timeattackTime > data.vsTime) and
	   (data.timeattackTime > data.survivalTime) and
	   (data.timeattackTime > data.bossTime) and
	   (data.timeattackTime > data.bonusTime) and
	   (data.timeattackTime > data.suddendeathTime) and
	   (data.timeattackTime > data.cpumatchTime) and
	   (data.timeattackTime > data.eventsTime) and
	   (data.timeattackTime > data.missionsTime) and
	   (data.timeattackTime > data.endlessTime) and
	   (data.timeattackTime > data.legionTime) and
	   (data.timeattackTime > data.towerTime) and
	   (data.timeattackTime > data.storyTime) and
	   (data.timeattackTime > data.tourneyTime) and
	   (data.timeattackTime > data.adventureTime) then
		t_statsMenu[7].varText = "Time Attack"
	end
	if (data.suddendeathTime > data.arcadeTime) and
	   (data.suddendeathTime > data.vsTime) and
	   (data.suddendeathTime > data.survivalTime) and
	   (data.suddendeathTime > data.bossTime) and
	   (data.suddendeathTime > data.bonusTime) and
	   (data.suddendeathTime > data.timeattackTime) and
	   (data.suddendeathTime > data.cpumatchTime) and
	   (data.suddendeathTime > data.eventsTime) and
	   (data.suddendeathTime > data.missionsTime) and
	   (data.suddendeathTime > data.endlessTime) and
	   (data.suddendeathTime > data.legionTime) and
	   (data.suddendeathTime > data.towerTime) and
	   (data.suddendeathTime > data.storyTime) and
	   (data.suddendeathTime > data.tourneyTime) and
	   (data.suddendeathTime > data.adventureTime) then
		t_statsMenu[7].varText = "Sudden Death"
	end
	if (data.eventsTime > data.arcadeTime) and
	   (data.eventsTime > data.vsTime) and
	   (data.eventsTime > data.survivalTime) and
	   (data.eventsTime > data.bossTime) and
	   (data.eventsTime > data.bonusTime) and
	   (data.eventsTime > data.timeattackTime) and
	   (data.eventsTime > data.suddendeathTime) and
	   (data.eventsTime > data.cpumatchTime) and
	   (data.eventsTime > data.missionsTime) and
	   (data.eventsTime > data.endlessTime) and
	   (data.eventsTime > data.legionTime) and
	   (data.eventsTime > data.towerTime) and
	   (data.eventsTime > data.storyTime) and
	   (data.eventsTime > data.tourneyTime) and
	   (data.eventsTime > data.adventureTime) then
		t_statsMenu[7].varText = "Events"
	end
	if (data.missionsTime > data.arcadeTime) and
	   (data.missionsTime > data.vsTime) and
	   (data.missionsTime > data.survivalTime) and
	   (data.missionsTime > data.bossTime) and
	   (data.missionsTime > data.bonusTime) and
	   (data.missionsTime > data.timeattackTime) and
	   (data.missionsTime > data.suddendeathTime) and
	   (data.missionsTime > data.cpumatchTime) and
	   (data.missionsTime > data.eventsTime) and
	   (data.missionsTime > data.endlessTime) and
	   (data.missionsTime > data.legionTime) and
	   (data.missionsTime > data.towerTime) and
	   (data.missionsTime > data.storyTime) and
	   (data.missionsTime > data.tourneyTime) and
	   (data.missionsTime > data.adventureTime) then
		t_statsMenu[7].varText = "Missions"
	end
	if (data.endlessTime > data.arcadeTime) and
	   (data.endlessTime > data.vsTime) and
	   (data.endlessTime > data.survivalTime) and
	   (data.endlessTime > data.bossTime) and
	   (data.endlessTime > data.bonusTime) and
	   (data.endlessTime > data.timeattackTime) and
	   (data.endlessTime > data.suddendeathTime) and
	   (data.endlessTime > data.cpumatchTime) and
	   (data.endlessTime > data.eventsTime) and
	   (data.endlessTime > data.missionsTime) and
	   (data.endlessTime > data.legionTime) and
	   (data.endlessTime > data.towerTime) and
	   (data.endlessTime > data.storyTime) and
	   (data.endlessTime > data.tourneyTime) and
	   (data.endlessTime > data.adventureTime) then
		t_statsMenu[7].varText = "Endless"
	end
	if (data.towerTime > data.arcadeTime) and
	   (data.towerTime > data.vsTime) and
	   (data.towerTime > data.survivalTime) and
	   (data.towerTime > data.bossTime) and
	   (data.towerTime > data.bonusTime) and
	   (data.towerTime > data.timeattackTime) and
	   (data.towerTime > data.suddendeathTime) and
	   (data.towerTime > data.cpumatchTime) and
	   (data.towerTime > data.eventsTime) and
	   (data.towerTime > data.missionsTime) and
	   (data.towerTime > data.endlessTime) and
	   (data.towerTime > data.legionTime) and
	   (data.towerTime > data.storyTime) and
	   (data.towerTime > data.tourneyTime) and
	   (data.towerTime > data.adventureTime) then
		t_statsMenu[7].varText = "Tower"
	end
	if (data.legionTime > data.arcadeTime) and
	   (data.legionTime > data.vsTime) and
	   (data.legionTime > data.survivalTime) and
	   (data.legionTime > data.bossTime) and
	   (data.legionTime > data.bonusTime) and
	   (data.legionTime > data.timeattackTime) and
	   (data.legionTime > data.suddendeathTime) and
	   (data.legionTime > data.cpumatchTime) and
	   (data.legionTime > data.eventsTime) and
	   (data.legionTime > data.missionsTime) and
	   (data.legionTime > data.endlessTime) and
	   (data.legionTime > data.towerTime) and
	   (data.legionTime > data.storyTime) and
	   (data.legionTime > data.tourneyTime) and
	   (data.legionTime > data.adventureTime) then
		t_statsMenu[7].varText = "Legion"
	end
	if (data.tourneyTime > data.arcadeTime) and
	   (data.tourneyTime > data.vsTime) and
	   (data.tourneyTime > data.survivalTime) and
	   (data.tourneyTime > data.bossTime) and
	   (data.tourneyTime > data.bonusTime) and
	   (data.tourneyTime > data.timeattackTime) and
	   (data.tourneyTime > data.suddendeathTime) and
	   (data.tourneyTime > data.cpumatchTime) and
	   (data.tourneyTime > data.eventsTime) and
	   (data.tourneyTime > data.missionsTime) and
	   (data.tourneyTime > data.endlessTime) and
	   (data.tourneyTime > data.legionTime) and
	   (data.tourneyTime > data.towerTime) and
	   (data.tourneyTime > data.storyTime) and
	   (data.tourneyTime > data.adventureTime) then
		t_statsMenu[7].varText = "Tourney"
	end
	if (data.adventureTime > data.arcadeTime) and
	   (data.adventureTime > data.vsTime) and
	   (data.adventureTime > data.survivalTime) and
	   (data.adventureTime > data.bossTime) and
	   (data.adventureTime > data.bonusTime) and
	   (data.adventureTime > data.timeattackTime) and
	   (data.adventureTime > data.suddendeathTime) and
	   (data.adventureTime > data.cpumatchTime) and
	   (data.adventureTime > data.eventsTime) and
	   (data.adventureTime > data.missionsTime) and
	   (data.adventureTime > data.endlessTime) and
	   (data.adventureTime > data.legionTime) and
	   (data.adventureTime > data.towerTime) and
	   (data.adventureTime > data.storyTime) and
	   (data.adventureTime > data.tourneyTime) then
		t_statsMenu[7].varText = "Adventure"
	end
	ts = math.floor((data.trainingTime%60))
	tm = math.floor((data.trainingTime%3600)/60)
	th = math.floor((data.trainingTime%86400)/3600)
	td = math.floor(data.trainingTime/86400)
	--practiceTime = string.format("%d:Days %02d:Hours %02d:Minutes %02d:Seconds", td, th, tm, ts)
	practiceTime = string.format("%d:Days %02d:Hours %02d:Minutes", td, th, tm)
	t_statsMenu[8].varText = practiceTime
	t_statsMenu[9].varText = data.coins
	if data.arcadeClear == false then t_statsMenu[10].varText = "INCOMPLETE" elseif data.arcadeClear == true then t_statsMenu[10].varText = "COMPLETED" end
	if data.survivalClear == false then t_statsMenu[11].varText = "INCOMPLETE" elseif data.survivalClear == true then t_statsMenu[11].varText = "COMPLETED" end
	t_statsMenu[12].varText = math.floor(data.storiesProgress/100).."/3"
	t_statsMenu[13].varText = data.missionsProgress.."/3"
	t_statsMenu[14].varText = data.eventsProgress.."/3"
	t_statsMenu[15].varText = data.bossrecord.." Wins"
	t_statsMenu[16].varText = data.suddenrecord.." Wins"
	t_statsMenu[17].varText = data.endlessrecord.." Wins"
	t_statsMenu[18].varText = "WIP"--data.timerecord..""
	t_statsMenu[19].varText = "WIP"--data.scorerecord..""
end

function f_statsMenu()
	cmdInput()
	local cursorPosY = 1
	local moveTxt = 0
	local statsMenu = 1
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	f_getStats() --Load Stats
	data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
	while true do
		--f_playTime() --Test Played Time on live...
		if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
			data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
			sndPlay(sysSnd, 100, 2)
			break
		elseif commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30) then
			sndPlay(sysSnd, 100, 0)
			statsMenu = statsMenu - 1
		elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30) then
			sndPlay(sysSnd, 100, 0)
			statsMenu = statsMenu + 1
		--BACK
		elseif (btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0) and statsMenu == #t_statsMenu then
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
		elseif ((commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u')) or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30)) and cursorPosY > 1 then
			cursorPosY = cursorPosY - 1
		elseif ((commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd')) or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30)) and cursorPosY < 14 then
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
		--Draw Stats Text for Table
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