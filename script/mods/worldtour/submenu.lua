bgmAdventure = "sound/System/Adventure.mp3" --load bgm
--;===========================================================
--; WORLD TOUR MENU SCREENPACK DEFINITION
--;===========================================================
table.insert(t_extrasMenu,1,{id = textImgNew(), text = "WORLD TOUR", gotomenu = "f_worldtourMenu()"}) --Insert new item to t_extrasMenu table loaded by screenpack.lua
t_worldtourMenu = {
	{id = textImgNew(), text = "START", gotomenu = "f_storyMenu()"},
	{id = textImgNew(), text = "SAVE", gotomenu = "f_vnMenu()"},
	--{id = textImgNew(), text = "LOAD", gotomenu = "f_quizMenu()"},
}
--;===========================================================
--; WORLD TOUR MENU (play special story game modes)
--;===========================================================	
function f_worldtourMenu()
	cmdInput()
	local cursorPosY = 0
	local moveTxt = 0
	local worldtourMenu = 1
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	f_sideReset()
	f_infoReset()
	while true do
		if not sideScreen and not infoScreen then
			if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
				sndPlay(sndSys, 100, 2)
				break
			elseif commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30) then
				sndPlay(sndSys, 100, 0)
				worldtourMenu = worldtourMenu - 1
			elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30) then
				sndPlay(sndSys, 100, 0)
				worldtourMenu = worldtourMenu + 1
			end
			if worldtourMenu < 1 then
				worldtourMenu = #t_worldtourMenu
				if #t_worldtourMenu > 5 then
					cursorPosY = 5
				else
					cursorPosY = #t_worldtourMenu-1
				end
			elseif worldtourMenu > #t_worldtourMenu then
				worldtourMenu = 1
				cursorPosY = 0
			elseif ((commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u')) or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30)) and cursorPosY > 0 then
				cursorPosY = cursorPosY - 1
			elseif ((commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd')) or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30)) and cursorPosY < 5 then
				cursorPosY = cursorPosY + 1
			end
			if cursorPosY == 5 then
				moveTxt = (worldtourMenu - 6) * 13
			elseif cursorPosY == 0 then
				moveTxt = (worldtourMenu - 1) * 13
			end
			if #t_worldtourMenu <= 5 then
				maxworldtourMenu = #t_worldtourMenu
			elseif worldtourMenu - cursorPosY > 0 then
				maxworldtourMenu = worldtourMenu + 5 - cursorPosY
			else
				maxworldtourMenu = 5
			end
		--Enter Actions
			if btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then
				sndPlay(sndSys, 100, 1)
				f_gotoFunction(t_worldtourMenu[worldtourMenu])
			end
		end
		drawBottomMenuSP()
		for i=1, #t_worldtourMenu do
			if i == worldtourMenu then
				bank = 2
			else
				bank = 0
			end
			textImgDraw(f_updateTextImg(t_worldtourMenu[i].id, jgFnt, bank, 0, t_worldtourMenu[i].text, 159, 122+i*13-moveTxt))
		end
		if not sideScreen and not infoScreen then
			animSetWindow(cursorBox, 0,125+cursorPosY*13, 316,13)
			f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
			animDraw(f_animVelocity(cursorBox, -1, -1))
		end
		drawMiddleMenuSP()
		textImgDraw(txt_gameFt)
		textImgDraw(txt_version)
		f_sysTime()
		if maxworldtourMenu > 6 then
			animDraw(menuArrowUp)
			animUpdate(menuArrowUp)
		end
		if #t_worldtourMenu > 6 and maxworldtourMenu < #t_worldtourMenu then
			animDraw(menuArrowDown)
			animUpdate(menuArrowDown)
		end
		if not infoScreen and not sideScreen then drawMenuInputHints() end
		if sideScreen then f_sideSelect() end
		if infoScreen then f_infoMenu() end
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