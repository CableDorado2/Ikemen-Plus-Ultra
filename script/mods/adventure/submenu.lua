local loadLuaModule = true
--[[=============================================================================
This Lua Module has been specifically designed for I.K.E.M.E.N. PLUS ULTRA Engine.
		Therefore, it may NOT be compatible with I.K.E.M.E.N. GO Engine.
=================================================================================]]
local bgmAdventure = "script/mods/adventure/Adventure.mp3" --load bgm
--;===========================================================
--; ADVENTURE MENU SCREENPACK DEFINITION
--;===========================================================
table.insert(t_extrasMenu,1,{text = "ADVENTURE", gotomenu = "f_comingSoon()", id = textImgNew()}) --Insert new item to t_extrasMenu table loaded by screenpack.lua
local t_adventureMenu = {
	{text = "START", gotomenu = ""},
	{text = "SAVE",  gotomenu = ""},
	--{text = "LOAD",  gotomenu = ""},
}
for i=1, #t_adventureMenu do
	t_adventureMenu[i]['id'] = textImgNew()
end

--[[
if stats.modes.adventure == nil then
	stats.modes.adventure = {}
	stats.modes.adventure.playtime = 0
	f_saveStats()
end

table.insert(t_statsGameModes,1,{name = "Adventure", playtime = function() return stats.modes.adventure.playtime end}) --Insert new item to t_statsGameModes table loaded by main.lua
]]
--;===========================================================
--; ADVENTURE MENU (Description)
--;===========================================================	
function f_adventureMenu()
	cmdInput()
	local cursorPosY = 0
	local moveTxt = 0
	local adventureMenu = 1
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
				adventureMenu = adventureMenu - 1
			elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30) then
				sndPlay(sndSys, 100, 0)
				adventureMenu = adventureMenu + 1
			end
			if adventureMenu < 1 then
				adventureMenu = #t_adventureMenu
				if #t_adventureMenu > 5 then
					cursorPosY = 5
				else
					cursorPosY = #t_adventureMenu-1
				end
			elseif adventureMenu > #t_adventureMenu then
				adventureMenu = 1
				cursorPosY = 0
			elseif ((commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u')) or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30)) and cursorPosY > 0 then
				cursorPosY = cursorPosY - 1
			elseif ((commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd')) or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30)) and cursorPosY < 5 then
				cursorPosY = cursorPosY + 1
			end
			if cursorPosY == 5 then
				moveTxt = (adventureMenu - 6) * 13
			elseif cursorPosY == 0 then
				moveTxt = (adventureMenu - 1) * 13
			end
			if #t_adventureMenu <= 5 then
				maxadventureMenu = #t_adventureMenu
			elseif adventureMenu - cursorPosY > 0 then
				maxadventureMenu = adventureMenu + 5 - cursorPosY
			else
				maxadventureMenu = 5
			end
		--Enter Actions
			if btnPalNo(p1Cmd, true) > 0 or btnPalNo(p2Cmd, true) > 0 then
				sndPlay(sndSys, 100, 1)
				f_gotoFunction(t_adventureMenu[adventureMenu])
			end
		end
		drawBottomMenuSP()
		for i=1, #t_adventureMenu do
			if i == adventureMenu then
				bank = 2
			else
				bank = 0
			end
			textImgDraw(f_updateTextImg(t_adventureMenu[i].id, jgFnt, bank, 0, t_adventureMenu[i].text, 159, 122+i*13-moveTxt))
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
		if maxadventureMenu > 6 then
			animDraw(menuArrowUp)
			animUpdate(menuArrowUp)
		end
		if #t_adventureMenu > 6 and maxadventureMenu < #t_adventureMenu then
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