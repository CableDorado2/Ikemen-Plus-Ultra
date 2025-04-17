local excludeLuaMatch = true --This module will not load during a match (for optimization purposes)
--;===========================================================
--; CHRONICLES MENU SCREENPACK DEFINITION
--;===========================================================
table.insert(t_extrasMenu,1,{id = textImgNew(), text = "CHRONICLES", gotomenu = "f_chroniclesMenu()"}) --Insert new item to t_extrasMenu table loaded by screenpack.lua
t_chroniclesMenu = {
	{text = "STORY MODE", gotomenu = "f_storyMenu()"},
	{text = "VISUAL NOVEL", gotomenu = "f_vnMenu()"},
	--{text = "QUIZ MODE", gotomenu = "f_quizMenu()"},
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
			if btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then
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

--;===========================================================
--; VISUAL NOVEL SELECT MENU (play through customizable narrative and interactive storytellings)
--;===========================================================
--(start a new customizable narrative and interactive storytelling)
function f_vnNewGame()
--Check Content
	if #t_selVN == 1 and vnNoSel then --1 story detected in select.def so don't show select menu
		f_vnMain(t_selVN[1].path) --Start Unique Visual Novel
	--When End
		data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', sprFade)
		f_menuMusic()
	else
		vnNoSel = false --More than 1 stories detected in select.def
		f_vnMenu() --Start Visual Novel Select
	end
end

--(continue the story from where you left off)
function f_vnLoadGame()
	assert(loadfile(saveVNPath))()
	if data.VNarc == "" and data.VNchapter == 0 and data.VNdialogue == 0 then
		sndPlay(sndSys, 100, 5) --No Data
		vnDataInfo = true
		infoScreen = true
	else --Load Data
		playBGM("")
		f_vnMain(data.VNarc, data.VNchapter, data.VNdialogue)
		data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', sprFade)
		f_menuMusic()
	end
end

function f_vnMenu()
	if #t_selVN == 0 then
		vnInfo = true
		infoScreen = true
		return
	end
	local cursorPosY = 1
	local moveTxt = 0
	local vnMenu = 1
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	local maxItems = 12
	data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', sprFade)
	f_resetListArrowsPos()
	cmdInput()
	while true do
	--Select Menu Actions
		if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
			data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', sprFade)
			sndPlay(sndSys, 100, 2)
			f_resetMenuArrowsPos()
			break
		elseif commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30) then
			sndPlay(sndSys, 100, 0)
			vnMenu = vnMenu - 1
		elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30) then
			sndPlay(sndSys, 100, 0)
			vnMenu = vnMenu + 1
	--Start Visual Novel Selected
		elseif btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then
			f_vnMain(t_selVN[vnMenu].path)
		--When Ends
			data.fadeTitle = f_fadeAnim(50, 'fadein', 'black', sprFade)
			f_menuMusic()
		end
	--Menu Scroll Logic
		if vnMenu < 1 then
			vnMenu = #t_selVN
			if #t_selVN > maxItems then
				cursorPosY = maxItems
			else
				cursorPosY = #t_selVN
			end
		elseif vnMenu > #t_selVN then
			vnMenu = 1
			cursorPosY = 1
		elseif ((commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u')) or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30)) and cursorPosY > 1 then
			cursorPosY = cursorPosY - 1
		elseif ((commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd')) or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30)) and cursorPosY < maxItems then
			cursorPosY = cursorPosY + 1
		end
		if cursorPosY == maxItems then
			moveTxt = (vnMenu - maxItems) * 15
		elseif cursorPosY == 1 then
			moveTxt = (vnMenu - 1) * 15
		end	
		if #t_selVN <= maxItems then
			maxVN = #t_selVN
		elseif vnMenu - cursorPosY > 0 then
			maxVN = vnMenu + maxItems - cursorPosY
		else
			maxVN = maxItems
		end
	--Draw Menu Assets
		animDraw(f_animVelocity(commonBG0, -1, -1))
		animSetScale(commonTBG, 240, maxVN*15)
		animSetWindow(commonTBG, 80,20, 160,180)
		animDraw(commonTBG)
		textImgDraw(txt_vnSelect)
		animSetWindow(cursorBox, 80,5+cursorPosY*15, 160,15)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))		
		for i=1, maxVN do
			if t_selVN[i].displayname:len() > 28 then
				visualnovelSelText = string.sub(t_selVN[i].displayname, 1, 24)
				visualnovelSelText = tostring(visualnovelSelText .. "...")
			else
				visualnovelSelText = t_selVN[i].displayname
			end
			if i > vnMenu - cursorPosY then
				t_selVN[i].id = createTextImg(font2, 0, 1, visualnovelSelText, 85, 15+i*15-moveTxt)
				textImgDraw(t_selVN[i].id)
			end
		end
		if maxVN > maxItems then
			animDraw(menuArrowUp)
			animUpdate(menuArrowUp)
		end
		if #t_selVN > maxItems and maxVN < #t_selVN then
			animDraw(menuArrowDown)
			animUpdate(menuArrowDown)
		end
		drawListInputHints()
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