
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
	{id = '', text = 'Training Time',  				varID = textImgNew(), varText = ''},
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
	data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
	while true do
		--f_playTime() --Test Played Time on live...
		--Progress Logic
		if data.arcadeClear == true then arcadeProgress = 1 elseif data.arcadeClear == false then arcadeProgress = 0 end
		if data.survivalClear == true then survivalProgress = 1 elseif data.survivalClear == false then survivalProgress = 0 end
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
		--If all Preferred Mode are equal
		t_statsMenu[7].varText = 'None'
		--Preferred Mode Logic
		if (data.arcademodeCnt > data.vsmodeCnt) and
		   (data.arcademodeCnt > data.survivalmodeCnt) and
		   (data.arcademodeCnt > data.bossrushmodeCnt) and
		   (data.arcademodeCnt > data.bonusrushmodeCnt) and
		   (data.arcademodeCnt > data.timeattackmodeCnt) and
		   (data.arcademodeCnt > data.suddendeathmodeCnt) and
		   (data.arcademodeCnt > data.cpumatchmodeCnt) and
		   (data.arcademodeCnt > data.eventsmodeCnt) and
		   (data.arcademodeCnt > data.missionsmodeCnt) and
		   (data.arcademodeCnt > data.endlessmodeCnt) and
		   (data.arcademodeCnt > data.legionmodeCnt) and
		   (data.arcademodeCnt > data.towermodeCnt) and
		   (data.arcademodeCnt > data.storymodeCnt) and
		   (data.arcademodeCnt > data.tourneymodeCnt) and
		   (data.arcademodeCnt > data.adventuremodeCnt) then
			t_statsMenu[7].varText = 'Arcade'
		end
		if (data.vsmodeCnt > data.arcademodeCnt) and
		   (data.vsmodeCnt > data.survivalmodeCnt) and
		   (data.vsmodeCnt > data.bossrushmodeCnt) and
		   (data.vsmodeCnt > data.bonusrushmodeCnt) and
		   (data.vsmodeCnt > data.timeattackmodeCnt) and
		   (data.vsmodeCnt > data.suddendeathmodeCnt) and
		   (data.vsmodeCnt > data.cpumatchmodeCnt) and
		   (data.vsmodeCnt > data.eventsmodeCnt) and
		   (data.vsmodeCnt > data.missionsmodeCnt) and
		   (data.vsmodeCnt > data.endlessmodeCnt) and
		   (data.vsmodeCnt > data.legionmodeCnt) and
		   (data.vsmodeCnt > data.towermodeCnt) and
		   (data.vsmodeCnt > data.storymodeCnt) and
		   (data.vsmodeCnt > data.tourneymodeCnt) and
		   (data.vsmodeCnt > data.adventuremodeCnt) then
			t_statsMenu[7].varText = 'Versus'
		end
		if (data.survivalmodeCnt > data.arcademodeCnt) and
		   (data.survivalmodeCnt > data.vsmodeCnt) and
		   (data.survivalmodeCnt > data.bossrushmodeCnt) and
		   (data.survivalmodeCnt > data.bonusrushmodeCnt) and
		   (data.survivalmodeCnt > data.timeattackmodeCnt) and
		   (data.survivalmodeCnt > data.suddendeathmodeCnt) and
		   (data.survivalmodeCnt > data.cpumatchmodeCnt) and
		   (data.survivalmodeCnt > data.eventsmodeCnt) and
		   (data.survivalmodeCnt > data.missionsmodeCnt) and
		   (data.survivalmodeCnt > data.endlessmodeCnt) and
		   (data.survivalmodeCnt > data.legionmodeCnt) and
		   (data.survivalmodeCnt > data.towermodeCnt) and
		   (data.survivalmodeCnt > data.storymodeCnt) and
		   (data.survivalmodeCnt > data.tourneymodeCnt) and
		   (data.survivalmodeCnt > data.adventuremodeCnt) then
			t_statsMenu[7].varText = 'Survival'
		end
		if (data.bossrushmodeCnt > data.arcademodeCnt) and
		   (data.bossrushmodeCnt > data.vsmodeCnt) and
		   (data.bossrushmodeCnt > data.survivalmodeCnt) and
		   (data.bossrushmodeCnt > data.bonusrushmodeCnt) and
		   (data.bossrushmodeCnt > data.timeattackmodeCnt) and
		   (data.bossrushmodeCnt > data.suddendeathmodeCnt) and
		   (data.bossrushmodeCnt > data.cpumatchmodeCnt) and
		   (data.bossrushmodeCnt > data.eventsmodeCnt) and
		   (data.bossrushmodeCnt > data.missionsmodeCnt) and
		   (data.bossrushmodeCnt > data.endlessmodeCnt) and
		   (data.bossrushmodeCnt > data.legionmodeCnt) and
		   (data.bossrushmodeCnt > data.towermodeCnt) and
		   (data.bossrushmodeCnt > data.storymodeCnt) and
		   (data.bossrushmodeCnt > data.tourneymodeCnt) and
		   (data.bossrushmodeCnt > data.adventuremodeCnt) then
			t_statsMenu[7].varText = 'Boss Fight'
		end
		if (data.bonusrushmodeCnt > data.arcademodeCnt) and
		   (data.bonusrushmodeCnt > data.vsmodeCnt) and
		   (data.bonusrushmodeCnt > data.survivalmodeCnt) and
		   (data.bonusrushmodeCnt > data.bossrushmodeCnt) and
		   (data.bonusrushmodeCnt > data.timeattackmodeCnt) and
		   (data.bonusrushmodeCnt > data.suddendeathmodeCnt) and
		   (data.bonusrushmodeCnt > data.cpumatchmodeCnt) and
		   (data.bonusrushmodeCnt > data.eventsmodeCnt) and
		   (data.bonusrushmodeCnt > data.missionsmodeCnt) and
		   (data.bonusrushmodeCnt > data.endlessmodeCnt) and
		   (data.bonusrushmodeCnt > data.legionmodeCnt) and
		   (data.bonusrushmodeCnt > data.towermodeCnt) and
		   (data.bonusrushmodeCnt > data.storymodeCnt) and
		   (data.bonusrushmodeCnt > data.tourneymodeCnt) and
		   (data.bonusrushmodeCnt > data.adventuremodeCnt) then
			t_statsMenu[7].varText = 'Bonus Games'
		end
		if (data.timeattackmodeCnt > data.arcademodeCnt) and
		   (data.timeattackmodeCnt > data.vsmodeCnt) and
		   (data.timeattackmodeCnt > data.survivalmodeCnt) and
		   (data.timeattackmodeCnt > data.bossrushmodeCnt) and
		   (data.timeattackmodeCnt > data.bonusrushmodeCnt) and
		   (data.timeattackmodeCnt > data.suddendeathmodeCnt) and
		   (data.timeattackmodeCnt > data.cpumatchmodeCnt) and
		   (data.timeattackmodeCnt > data.eventsmodeCnt) and
		   (data.timeattackmodeCnt > data.missionsmodeCnt) and
		   (data.timeattackmodeCnt > data.endlessmodeCnt) and
		   (data.timeattackmodeCnt > data.legionmodeCnt) and
		   (data.timeattackmodeCnt > data.towermodeCnt) and
		   (data.timeattackmodeCnt > data.storymodeCnt) and
		   (data.timeattackmodeCnt > data.tourneymodeCnt) and
		   (data.timeattackmodeCnt > data.adventuremodeCnt) then
			t_statsMenu[7].varText = 'Time Attack'
		end
		if (data.suddendeathmodeCnt > data.arcademodeCnt) and
		   (data.suddendeathmodeCnt > data.vsmodeCnt) and
		   (data.suddendeathmodeCnt > data.survivalmodeCnt) and
		   (data.suddendeathmodeCnt > data.bossrushmodeCnt) and
		   (data.suddendeathmodeCnt > data.bonusrushmodeCnt) and
		   (data.suddendeathmodeCnt > data.timeattackmodeCnt) and
		   (data.suddendeathmodeCnt > data.cpumatchmodeCnt) and
		   (data.suddendeathmodeCnt > data.eventsmodeCnt) and
		   (data.suddendeathmodeCnt > data.missionsmodeCnt) and
		   (data.suddendeathmodeCnt > data.endlessmodeCnt) and
		   (data.suddendeathmodeCnt > data.legionmodeCnt) and
		   (data.suddendeathmodeCnt > data.towermodeCnt) and
		   (data.suddendeathmodeCnt > data.storymodeCnt) and
		   (data.suddendeathmodeCnt > data.tourneymodeCnt) and
		   (data.suddendeathmodeCnt > data.adventuremodeCnt) then
			t_statsMenu[7].varText = 'Sudden Death'
		end
		if (data.cpumatchmodeCnt > data.arcademodeCnt) and
		   (data.cpumatchmodeCnt > data.vsmodeCnt) and
		   (data.cpumatchmodeCnt > data.survivalmodeCnt) and
		   (data.cpumatchmodeCnt > data.bossrushmodeCnt) and
		   (data.cpumatchmodeCnt > data.bonusrushmodeCnt) and
		   (data.cpumatchmodeCnt > data.timeattackmodeCnt) and
		   (data.cpumatchmodeCnt > data.suddendeathmodeCnt) and
		   (data.cpumatchmodeCnt > data.eventsmodeCnt) and
		   (data.cpumatchmodeCnt > data.missionsmodeCnt) and
		   (data.cpumatchmodeCnt > data.endlessmodeCnt) and
		   (data.cpumatchmodeCnt > data.legionmodeCnt) and
		   (data.cpumatchmodeCnt > data.towermodeCnt) and
		   (data.cpumatchmodeCnt > data.storymodeCnt) and
		   (data.cpumatchmodeCnt > data.tourneymodeCnt) and
		   (data.cpumatchmodeCnt > data.adventuremodeCnt) then
			t_statsMenu[7].varText = 'CPU Match'
		end
		if (data.eventsmodeCnt > data.arcademodeCnt) and
		   (data.eventsmodeCnt > data.vsmodeCnt) and
		   (data.eventsmodeCnt > data.survivalmodeCnt) and
		   (data.eventsmodeCnt > data.bossrushmodeCnt) and
		   (data.eventsmodeCnt > data.bonusrushmodeCnt) and
		   (data.eventsmodeCnt > data.timeattackmodeCnt) and
		   (data.eventsmodeCnt > data.suddendeathmodeCnt) and
		   (data.eventsmodeCnt > data.cpumatchmodeCnt) and
		   (data.eventsmodeCnt > data.missionsmodeCnt) and
		   (data.eventsmodeCnt > data.endlessmodeCnt) and
		   (data.eventsmodeCnt > data.legionmodeCnt) and
		   (data.eventsmodeCnt > data.towermodeCnt) and
		   (data.eventsmodeCnt > data.storymodeCnt) and
		   (data.eventsmodeCnt > data.tourneymodeCnt) and
		   (data.eventsmodeCnt > data.adventuremodeCnt) then
			t_statsMenu[7].varText = 'Events'
		end
		if (data.missionsmodeCnt > data.arcademodeCnt) and
		   (data.missionsmodeCnt > data.vsmodeCnt) and
		   (data.missionsmodeCnt > data.survivalmodeCnt) and
		   (data.missionsmodeCnt > data.bossrushmodeCnt) and
		   (data.missionsmodeCnt > data.bonusrushmodeCnt) and
		   (data.missionsmodeCnt > data.timeattackmodeCnt) and
		   (data.missionsmodeCnt > data.suddendeathmodeCnt) and
		   (data.missionsmodeCnt > data.cpumatchmodeCnt) and
		   (data.missionsmodeCnt > data.eventsmodeCnt) and
		   (data.missionsmodeCnt > data.endlessmodeCnt) and
		   (data.missionsmodeCnt > data.legionmodeCnt) and
		   (data.missionsmodeCnt > data.towermodeCnt) and
		   (data.missionsmodeCnt > data.storymodeCnt) and
		   (data.missionsmodeCnt > data.tourneymodeCnt) and
		   (data.missionsmodeCnt > data.adventuremodeCnt) then
			t_statsMenu[7].varText = 'Missions'
		end
		if (data.endlessmodeCnt > data.arcademodeCnt) and
		   (data.endlessmodeCnt > data.vsmodeCnt) and
		   (data.endlessmodeCnt > data.survivalmodeCnt) and
		   (data.endlessmodeCnt > data.bossrushmodeCnt) and
		   (data.endlessmodeCnt > data.bonusrushmodeCnt) and
		   (data.endlessmodeCnt > data.timeattackmodeCnt) and
		   (data.endlessmodeCnt > data.suddendeathmodeCnt) and
		   (data.endlessmodeCnt > data.cpumatchmodeCnt) and
		   (data.endlessmodeCnt > data.eventsmodeCnt) and
		   (data.endlessmodeCnt > data.missionsmodeCnt) and
		   (data.endlessmodeCnt > data.legionmodeCnt) and
		   (data.endlessmodeCnt > data.towermodeCnt) and
		   (data.endlessmodeCnt > data.storymodeCnt) and
		   (data.endlessmodeCnt > data.tourneymodeCnt) and
		   (data.endlessmodeCnt > data.adventuremodeCnt) then
			t_statsMenu[7].varText = 'Endless'
		end
		if (data.legionmodeCnt > data.arcademodeCnt) and
		   (data.legionmodeCnt > data.vsmodeCnt) and
		   (data.legionmodeCnt > data.survivalmodeCnt) and
		   (data.legionmodeCnt > data.bossrushmodeCnt) and
		   (data.legionmodeCnt > data.bonusrushmodeCnt) and
		   (data.legionmodeCnt > data.timeattackmodeCnt) and
		   (data.legionmodeCnt > data.suddendeathmodeCnt) and
		   (data.legionmodeCnt > data.cpumatchmodeCnt) and
		   (data.legionmodeCnt > data.eventsmodeCnt) and
		   (data.legionmodeCnt > data.missionsmodeCnt) and
		   (data.legionmodeCnt > data.endlessmodeCnt) and
		   (data.legionmodeCnt > data.towermodeCnt) and
		   (data.legionmodeCnt > data.storymodeCnt) and
		   (data.legionmodeCnt > data.tourneymodeCnt) and
		   (data.legionmodeCnt > data.adventuremodeCnt) then
			t_statsMenu[7].varText = 'Legion'
		end
		if (data.towermodeCnt > data.arcademodeCnt) and
		   (data.towermodeCnt > data.vsmodeCnt) and
		   (data.towermodeCnt > data.survivalmodeCnt) and
		   (data.towermodeCnt > data.bossrushmodeCnt) and
		   (data.towermodeCnt > data.bonusrushmodeCnt) and
		   (data.towermodeCnt > data.timeattackmodeCnt) and
		   (data.towermodeCnt > data.suddendeathmodeCnt) and
		   (data.towermodeCnt > data.cpumatchmodeCnt) and
		   (data.towermodeCnt > data.eventsmodeCnt) and
		   (data.towermodeCnt > data.missionsmodeCnt) and
		   (data.towermodeCnt > data.endlessmodeCnt) and
		   (data.towermodeCnt > data.legionmodeCnt) and
		   (data.towermodeCnt > data.storymodeCnt) and
		   (data.towermodeCnt > data.tourneymodeCnt) and
		   (data.towermodeCnt > data.adventuremodeCnt) then
			t_statsMenu[7].varText = 'Tower'
		end
		if (data.storymodeCnt > data.arcademodeCnt) and
		   (data.storymodeCnt > data.vsmodeCnt) and
		   (data.storymodeCnt > data.survivalmodeCnt) and
		   (data.storymodeCnt > data.bossrushmodeCnt) and
		   (data.storymodeCnt > data.bonusrushmodeCnt) and
		   (data.storymodeCnt > data.timeattackmodeCnt) and
		   (data.storymodeCnt > data.suddendeathmodeCnt) and
		   (data.storymodeCnt > data.cpumatchmodeCnt) and
		   (data.storymodeCnt > data.eventsmodeCnt) and
		   (data.storymodeCnt > data.missionsmodeCnt) and
		   (data.storymodeCnt > data.endlessmodeCnt) and
		   (data.storymodeCnt > data.legionmodeCnt) and
		   (data.storymodeCnt > data.towermodeCnt) and
		   (data.storymodeCnt > data.tourneymodeCnt) and
		   (data.storymodeCnt > data.adventuremodeCnt) then
			t_statsMenu[7].varText = 'Story'
		end
		if (data.tourneymodeCnt > data.arcademodeCnt) and
		   (data.tourneymodeCnt > data.vsmodeCnt) and
		   (data.tourneymodeCnt > data.survivalmodeCnt) and
		   (data.tourneymodeCnt > data.bossrushmodeCnt) and
		   (data.tourneymodeCnt > data.bonusrushmodeCnt) and
		   (data.tourneymodeCnt > data.timeattackmodeCnt) and
		   (data.tourneymodeCnt > data.suddendeathmodeCnt) and
		   (data.tourneymodeCnt > data.cpumatchmodeCnt) and
		   (data.tourneymodeCnt > data.eventsmodeCnt) and
		   (data.tourneymodeCnt > data.missionsmodeCnt) and
		   (data.tourneymodeCnt > data.endlessmodeCnt) and
		   (data.tourneymodeCnt > data.legionmodeCnt) and
		   (data.tourneymodeCnt > data.towermodeCnt) and
		   (data.tourneymodeCnt > data.storymodeCnt) and
		   (data.tourneymodeCnt > data.adventuremodeCnt) then
			t_statsMenu[7].varText = 'Tourney'
		end
		if (data.adventuremodeCnt > data.arcademodeCnt) and
		   (data.adventuremodeCnt > data.vsmodeCnt) and
		   (data.adventuremodeCnt > data.survivalmodeCnt) and
		   (data.adventuremodeCnt > data.bossrushmodeCnt) and
		   (data.adventuremodeCnt > data.bonusrushmodeCnt) and
		   (data.adventuremodeCnt > data.timeattackmodeCnt) and
		   (data.adventuremodeCnt > data.suddendeathmodeCnt) and
		   (data.adventuremodeCnt > data.cpumatchmodeCnt) and
		   (data.adventuremodeCnt > data.eventsmodeCnt) and
		   (data.adventuremodeCnt > data.missionsmodeCnt) and
		   (data.adventuremodeCnt > data.endlessmodeCnt) and
		   (data.adventuremodeCnt > data.legionmodeCnt) and
		   (data.adventuremodeCnt > data.towermodeCnt) and
		   (data.adventuremodeCnt > data.storymodeCnt) and
		   (data.adventuremodeCnt > data.tourneymodeCnt) then
			t_statsMenu[7].varText = 'Adventure'
		end
		ts = math.floor((data.trainingTime%60))
		tm = math.floor((data.trainingTime%3600)/60)
		th = math.floor((data.trainingTime%86400)/3600)
		td = math.floor(data.trainingTime/86400)
		--practiceTime = string.format("%d:Days %02d:Hours %02d:Minutes %02d:Seconds", td, th, tm, ts)
		practiceTime = string.format("%d:Days %02d:Hours %02d:Minutes", td, th, tm)
		t_statsMenu[8].varText = practiceTime
		t_statsMenu[9].varText = data.coins
		if data.arcadeClear == false then t_statsMenu[10].varText = 'INCOMPLETE' elseif data.arcadeClear == true then t_statsMenu[10].varText = 'COMPLETED' end
		if data.survivalClear == false then t_statsMenu[11].varText = 'INCOMPLETE' elseif data.survivalClear == true then t_statsMenu[11].varText = 'COMPLETED' end
		t_statsMenu[12].varText = data.missionsProgress..'/3'
		t_statsMenu[13].varText = data.eventsProgress..'/1'
		t_statsMenu[14].varText = data.bossrecord..' Wins'
		t_statsMenu[15].varText = data.suddenrecord..' Wins'
		t_statsMenu[16].varText = data.endlessrecord..' Wins'
		t_statsMenu[17].varText = 'WIP'--timerecord..''
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