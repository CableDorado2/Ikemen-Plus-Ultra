local loadLuaModule = true
--[[=============================================================================
This Lua Module has been specifically designed for I.K.E.M.E.N. PLUS ULTRA Engine.
		Therefore, it may NOT be compatible with I.K.E.M.E.N. GO Engine.
=================================================================================]]

--;===========================================================
--; CHRONICLES MENU SCREENPACK DEFINITION
--;===========================================================
--Insert new item to t_extrasMenu table loaded by screenpack.lua
table.insert(t_extrasMenu, 1, {
id = textImgNew(),
text = "CHRONICLES",
info = [[
Play a collection of Game modes
focused on Characters Stories!
]],
gotomenu = "f_chroniclesMenu()"
})

t_chroniclesMenu = {
	{
		text = "STORY",
		info = [[
		
		]],
		gotomenu = "f_storyMenu()"
	},
	{
		text = "???",
		gotomenu = "f_comingSoon()" --quiz
	},
}
for i=1, #t_chroniclesMenu do
	t_chroniclesMenu[i]['id'] = textImgNew()
	if t_chroniclesMenu[i].unlock == nil then t_chroniclesMenu[i].unlock = "true" end
end
f_checkMenuUnlocks(t_chroniclesMenu)
--;===========================================================
--; CHRONICLES MENU
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
	local itemText = nil
	local maxItems = 7
	local itemSign = ""
	f_sideReset()
	f_infoReset()
	f_unlock(false)
	f_updateUnlocks()
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
				if #t_chroniclesMenu > maxItems then
					cursorPosY = maxItems
				else
					cursorPosY = #t_chroniclesMenu - 1
				end
			elseif chroniclesMenu > #t_chroniclesMenu then
				chroniclesMenu = 1
				cursorPosY = 0
			elseif ((commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u')) or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30)) and cursorPosY > 0 then
				cursorPosY = cursorPosY - 1
			elseif ((commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd')) or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30)) and cursorPosY < maxItems then
				cursorPosY = cursorPosY + 1
			end
			if cursorPosY == maxItems then
				moveTxt = (chroniclesMenu - (maxItems + 1)) * 13
			elseif cursorPosY == 0 then
				moveTxt = (chroniclesMenu - 1) * 13
			end
			if #t_chroniclesMenu <= maxItems then
				maxchroniclesMenu = #t_chroniclesMenu
			elseif chroniclesMenu - cursorPosY > 0 then
				maxchroniclesMenu = chroniclesMenu + maxItems - cursorPosY
			else
				maxchroniclesMenu = maxItems
			end
			if btnPalNo(p1Cmd, true) > 0 or btnPalNo(p2Cmd, true) > 0 then
				f_gotoFunction(t_chroniclesMenu[chroniclesMenu])
			end
		end
		drawBottomMenuSP()
		for i=1, #t_chroniclesMenu do
			if i == chroniclesMenu then
				bank = 5
				itemSign = commonMenuItemSign
			else
				bank = 0
				itemSign = ""
			end
			if t_unlockLua.modes[t_chroniclesMenu[i].gotomenu] == nil then --If the menu item is unlocked
				itemText = t_chroniclesMenu[i].text
			else
				itemText = "???"
			end
			textImgDraw(f_updateTextImg(t_chroniclesMenu[i].id, jgFnt, bank, 1, itemSign..itemText, 5, 94 + i * 13 - moveTxt))
		end
		if not sideScreen and not infoScreen then
			animSetWindow(cursorBox, 0,97 + cursorPosY * 13, 316,13)
			f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
			animDraw(f_animVelocity(cursorBox, -1, -1))
		end
		drawMiddleMenuSP()
		drawMenuInfo(t_chroniclesMenu[chroniclesMenu])
		textImgDraw(txt_gameFt)
		textImgSetText(txt_gameFt, "LORE MODES")
		textImgDraw(txt_version)
		f_sysTime()
		if maxchroniclesMenu > maxItems + 1 then
			animDraw(menuArrowUp)
			animUpdate(menuArrowUp)
		end
		if #t_chroniclesMenu > maxItems + 1 and maxchroniclesMenu < #t_chroniclesMenu then
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