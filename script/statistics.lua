
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
	{id = '', text = 'Collected Coins',    			varID = textImgNew(), varText = data.coins},
	{id = '', text = 'Time Played',  				varID = textImgNew(), varText = data.playTime},
	{id = '', text = 'Favorite Character',  		varID = textImgNew(), varText = data.favoriteChar},
	{id = '', text = 'Favorite Stage',				varID = textImgNew(), varText = data.favoriteStage},
	{id = '', text = 'Preferred Game Mode', 		varID = textImgNew(), varText = data.preferredMode},
	{id = '', text = 'Victories',     				varID = textImgNew(), varText = data.victories},
	{id = '', text = 'Defeats',     				varID = textImgNew(), varText = data.defeats},
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
		data.gameProgress = (math.floor(((data.missionsProgress + data.eventsProgress) * 100 / 200) + 0.5)) --The number (200) is the summation of all data.gameProgress values in parentheses
		txt_statsMenu = createTextImg(jgFnt, 0, 0, '' .. data.userName .. ' PROGRESS: [' .. data.gameProgress .. '%]', 160.5, 13) --needs to be inside of statistics Menu function, to load a updated data
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
		elseif btnPalNo(p1Cmd) > 0 then --To see more statistics details, currently is not necessary
			--Collected Coins
			if statsMenu == 1 then
				--sndPlay(sysSnd, 100, 1)	
			--Time Played
			elseif statsMenu == 2 then
				--sndPlay(sysSnd, 100, 1)
			--Favorite Character
			elseif statsMenu == 3 then
				--sndPlay(sysSnd, 100, 1)
			--Favorite Stage
			elseif statsMenu == 4 then
				--sndPlay(sysSnd, 100, 1)
			--Preferred Game Mode
			elseif statsMenu == 5 then
				--sndPlay(sysSnd, 100, 1)
			--Victories
			elseif statsMenu == 6 then
				--sndPlay(sysSnd, 100, 1)
			--Defeats
			elseif statsMenu == 7 then
				--sndPlay(sysSnd, 100, 1)
			--Back
			else
				data.fadeTitle = f_fadeAnim(10, 'fadein', 'black', fadeSff)
				sndPlay(sysSnd, 100, 2)
				break
			end			
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
		--Draw Stats Table Cursor
		animSetWindow(cursorBox, 30,5+cursorPosY*15, 260,15)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
		--Draw Stats Info
		t_statsMenu[1].varText = data.coins
		t_statsMenu[2].varText = ''.. data.playTime .. ' Seconds' --TODO: Should be shown in hours:minutes format
		t_statsMenu[3].varText = data.favoriteChar
		t_statsMenu[4].varText = data.favoriteStage
		t_statsMenu[5].varText = data.preferredMode
		t_statsMenu[6].varText = data.victories
		t_statsMenu[7].varText = data.defeats
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
