--[[=============================================================================
This Lua Module has been specifically designed for I.K.E.M.E.N. PLUS ULTRA Engine.
		Therefore, it may NOT be compatible with I.K.E.M.E.N. GO Engine.
=================================================================================]]
local excludeLuaMatch = true --This module will not load during a match (for optimization purposes)
--;===========================================================
--; CHRONICLES MENU SCREENPACK DEFINITION
--;===========================================================
table.insert(t_extrasMenu,1,{text = "CHRONICLES", gotomenu = "f_chroniclesMenu()", id = textImgNew()}) --Insert new item to t_extrasMenu table loaded by screenpack.lua
t_chroniclesMenu = {
	{text = "STORY",	 	gotomenu = "f_storyMenu()"},
	{text = "VISUAL NOVEL", gotomenu = "f_vnMenu()"},
	{text = "QUIZ", 		gotomenu = "f_comingSoon()"},
}
for i=1, #t_chroniclesMenu do
	t_chroniclesMenu[i]['id'] = textImgNew()
end
--;===========================================================
--; CHRONICLES MENU (play special story game modes)
--;===========================================================	
function f_chroniclesMenu()
	cmdInput()
	local cursorPosY = 0
	local moveTxt = 0
	local chroniclesMenu = 1
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
				chroniclesMenu = chroniclesMenu - 1
			elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30) then
				sndPlay(sndSys, 100, 0)
				chroniclesMenu = chroniclesMenu + 1
			end
			if chroniclesMenu < 1 then
				chroniclesMenu = #t_chroniclesMenu
				if #t_chroniclesMenu > 5 then
					cursorPosY = 5
				else
					cursorPosY = #t_chroniclesMenu-1
				end
			elseif chroniclesMenu > #t_chroniclesMenu then
				chroniclesMenu = 1
				cursorPosY = 0
			elseif ((commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u')) or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30)) and cursorPosY > 0 then
				cursorPosY = cursorPosY - 1
			elseif ((commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd')) or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30)) and cursorPosY < 5 then
				cursorPosY = cursorPosY + 1
			end
			if cursorPosY == 5 then
				moveTxt = (chroniclesMenu - 6) * 13
			elseif cursorPosY == 0 then
				moveTxt = (chroniclesMenu - 1) * 13
			end
			if #t_chroniclesMenu <= 5 then
				maxchroniclesMenu = #t_chroniclesMenu
			elseif chroniclesMenu - cursorPosY > 0 then
				maxchroniclesMenu = chroniclesMenu + 5 - cursorPosY
			else
				maxchroniclesMenu = 5
			end
		--Enter Actions
			if btnPalNo(p1Cmd, true) > 0 or btnPalNo(p2Cmd, true) > 0 then
				sndPlay(sndSys, 100, 1)
				f_gotoFunction(t_chroniclesMenu[chroniclesMenu])
			end
		end
		drawBottomMenuSP()
		for i=1, #t_chroniclesMenu do
			if i == chroniclesMenu then
				bank = 2
			else
				bank = 0
			end
			textImgDraw(f_updateTextImg(t_chroniclesMenu[i].id, jgFnt, bank, 0, t_chroniclesMenu[i].text, 159, 122+i*13-moveTxt))
		end
		if not sideScreen and not infoScreen then
			animSetWindow(cursorBox, 0,125+cursorPosY*13, 316,13)
			f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
			animDraw(f_animVelocity(cursorBox, -1, -1))
		end
		drawMiddleMenuSP()
		textImgDraw(txt_gameFt)
		textImgSetText(txt_gameFt, "LORE MODES")
		textImgDraw(txt_version)
		f_sysTime()
		if maxchroniclesMenu > 6 then
			animDraw(menuArrowUp)
			animUpdate(menuArrowUp)
		end
		if #t_chroniclesMenu > 6 and maxchroniclesMenu < #t_chroniclesMenu then
			animDraw(menuArrowDown)
			animUpdate(menuArrowDown)
		end
		if not infoScreen and not sideScreen then drawMainMenuInputHints() end
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