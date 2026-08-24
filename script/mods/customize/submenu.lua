local loadLuaModule = true
--[[=============================================================================
This Lua Module has been specifically designed for I.K.E.M.E.N. PLUS ULTRA Engine.
		Therefore, it may NOT be compatible with I.K.E.M.E.N. GO Engine.
=================================================================================]]

--;===========================================================
--; CUSTOMIZE MENU SCREENPACK DEFINITION
--;===========================================================
--Insert new item to t_mainMenu table loaded by screenpack.lua
table.insert(t_mainMenu, 6, {
text = "CUSTOMIZE",
info = [[
Purchase Content to Unlock.
Edit Battle HUD, Player Card
Team Presets and character
colors!
]],
gotomenu = "f_customizeMenu()",
unlock = "true"
})

t_customizeMenu = {
	{
		text = "BATTLE HUD",
		info = [[
		Change the look of the Fight
		Interface and set the position
		of the in-game HUD!
		]],
		gotomenu = "f_lifebarCfg()"
	},
	{
		text = "TEAM ENTRY",
		info = [[
		Save or Edit Characters Teams!
		
		(Saved Teams are only available
		for Non-Single Modes)
		]],
		gotomenu = "f_comingSoon()" --Team Presets
	},
	{
		text = "PLAYER CARD",
		info = [[
		Set the information and items
		to display in your Profile!
		]],
		gotomenu = "f_comingSoon()" --Titles
	},
	{
		text = "COLOR EDIT",
		info = [[
		Change the default character
		colors or Create colors to
		your liking!
		]],
		gotomenu = "f_comingSoon()"
	},
	menuName = "CUSTOMIZE MODES",
}
for i=1, #t_customizeMenu do
	if t_customizeMenu[i].unlock == nil then t_customizeMenu[i].unlock = "true" end
end
f_checkMenuUnlocks(t_customizeMenu)
--;===========================================================
--; CUSTOMIZE MENU
--;===========================================================	
function f_customizeMenu()
	cmdInput()
	local cursorPosY = 0
	local moveTxt = 0
	local customizeMenu = 1
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
				customizeMenu = customizeMenu - 1
			elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30) then
				sndPlay(sndSys, 100, 0)
				customizeMenu = customizeMenu + 1
			end
			if customizeMenu < 1 then
				customizeMenu = #t_customizeMenu
				if #t_customizeMenu > maxItems then
					cursorPosY = maxItems
				else
					cursorPosY = #t_customizeMenu - 1
				end
			elseif customizeMenu > #t_customizeMenu then
				customizeMenu = 1
				cursorPosY = 0
			elseif ((commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u')) or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30)) and cursorPosY > 0 then
				cursorPosY = cursorPosY - 1
			elseif ((commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd')) or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30)) and cursorPosY < maxItems then
				cursorPosY = cursorPosY + 1
			end
			if cursorPosY == maxItems then
				moveTxt = (customizeMenu - (maxItems + 1)) * 13
			elseif cursorPosY == 0 then
				moveTxt = (customizeMenu - 1) * 13
			end
			if #t_customizeMenu <= maxItems then
				maxcustomizeMenu = #t_customizeMenu
			elseif customizeMenu - cursorPosY > 0 then
				maxcustomizeMenu = customizeMenu + maxItems - cursorPosY
			else
				maxcustomizeMenu = maxItems
			end
			if btnPalNo(p1Cmd, true) > 0 or btnPalNo(p2Cmd, true) > 0 then
				f_gotoFunction(t_customizeMenu[customizeMenu])
			end
		end
		drawBottomMenuSP()
		for i=1, #t_customizeMenu do
			if i == customizeMenu then
				bank = 5
				itemSign = commonMenuItemSign
			else
				bank = 0
				itemSign = ""
			end
			if t_unlockLua.modes[t_customizeMenu[i].gotomenu] == nil then --If the menu item is unlocked
				itemText = t_customizeMenu[i].text
			else
				itemText = "???"
			end
			textImgDraw(f_updateTextImg(txt_mainMenuDat, jgFnt, bank, 1, itemSign..itemText, 5, 94 + i * 13 - moveTxt))
		end
		if not sideScreen and not infoScreen then
			animSetWindow(cursorBox, 0,97 + cursorPosY * 13, 320,13)
			f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
			animDraw(f_animVelocity(cursorBox, -1, -1))
		end
		drawMiddleMenuSP()
		drawMenuInfo(t_customizeMenu[customizeMenu])
		textImgDraw(txt_gameFt)
		textImgSetText(txt_gameFt, t_customizeMenu.menuName)
		textImgDraw(txt_version)
		f_sysTime()
		if maxcustomizeMenu > maxItems + 1 then
			animDraw(menuArrowUp)
			animUpdate(menuArrowUp)
		end
		if #t_customizeMenu > maxItems + 1 and maxcustomizeMenu < #t_customizeMenu then
			animDraw(menuArrowDown)
			animUpdate(menuArrowDown)
		end
		if not infoScreen and not sideScreen then drawMainMenuInputHints(t_customizeMenu[customizeMenu]) end
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