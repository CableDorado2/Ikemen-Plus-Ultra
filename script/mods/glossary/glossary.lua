--[[=============================================================================
This Lua Module has been specifically designed for I.K.E.M.E.N. PLUS ULTRA Engine.
		Therefore, it may NOT be compatible with I.K.E.M.E.N. GO Engine.
=================================================================================]]
local excludeLuaMatch = true --This module will not load during a match (for optimization purposes)
local glossaryDef = "script/mods/glossary/glossary.def" --Glossary Data (Glossary definition filename)
--local sprGlossary = sffNew("script/mods/glossary/glossary.sff") --Load glossary sprites
--;===========================================================
--; GLOSSARY MENU SCREENPACK DEFINITION
--;===========================================================
table.insert(t_watchMenu,5,{text = "GLOSSARY", gotomenu = "f_glossaryMenu()", id = textImgNew()}) --Insert new item to t_watchMenu table loaded by screenpack.lua
local txt_glossaryTitle = createTextImg(jgFnt, 0, 0, "GLOSSARY", 159, 13)
local txt_glossarySection = createTextImg(font2, 0, 0, "", 10, 30)
local txt_glossaryTitleText = createTextImg(font2, 0, 1, "", -50, 210)
local txt_glossaryText = createTextImg(font2, 0, 1, "", 0, 0)

--Background
local glossaryBG = animNew(sprIkemen, [[
0,0, 0,0, -1
]])
animAddPos(glossaryBG, 160, 0)
animSetTile(glossaryBG, 1, 1)
animSetColorKey(glossaryBG, -1)
animSetAlpha(glossaryBG, 150, 0)

--Left Page Arrow
local glossaryLeftArrow = animNew(sprIkemen, [[
223,0, 0,0, 10
223,1, 0,0, 10
223,2, 0,0, 10
223,3, 0,0, 10
223,3, 0,0, 10
223,2, 0,0, 10
223,1, 0,0, 10
223,0, 0,0, 10
]])
animAddPos(glossaryLeftArrow, 69, 21)
animSetScale(glossaryLeftArrow, 0.5, 0.5)
animUpdate(glossaryLeftArrow)

--Right Page Arrow
local glossaryRightArrow = animNew(sprIkemen, [[
224,0, 0,0, 10
224,1, 0,0, 10
224,2, 0,0, 10
224,3, 0,0, 10
224,3, 0,0, 10
224,2, 0,0, 10
224,1, 0,0, 10
224,0, 0,0, 10
]])
animAddPos(glossaryRightArrow, 242, 21)
animSetScale(glossaryRightArrow, 0.5, 0.5)
animUpdate(glossaryRightArrow)

--Title BG
local glossaryTitleBG = animNew(sprIkemen, [[
230,3, 0,0, -1
]])
animSetScale(glossaryTitleBG, 2.9, 0.30)
animSetAlpha(glossaryTitleBG, 155, 22)

--Input Hints BG
local gsInputsBG = animNew(sprIkemen, [[
230,3, 0,0, -1
]])
animSetScale(gsInputsBG, 2.9, 0.37)
animSetAlpha(gsInputsBG, 155, 22)

--Input Hints Panel
local function drawGlossaryInputHints()
	local inputHintYPos = 218
	local hintFont = font2
	local hintFontYPos = 232
	animPosDraw(gsInputsBG, -56, 217) --Draw Input Hints BG
	drawMenuInputHints("u","10,"..inputHintYPos,"d","30,"..inputHintYPos,"l","50,"..inputHintYPos,"r","70,"..inputHintYPos,"q","130,"..inputHintYPos,"s","195,"..inputHintYPos,"e","250,"..inputHintYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Select", 91, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Search", 151, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Read", 216, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Return", 271, hintFontYPos)
end

local function drawGlossaryInputHints2()
	local inputHintYPos = 218
	local hintFont = font2
	local hintFontYPos = 232
	animPosDraw(gsInputsBG, -56, 217)
	drawMenuInputHints("u","80,"..inputHintYPos,"d","100,"..inputHintYPos,"e","170,"..inputHintYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Scroll", 121, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Return", 191, hintFontYPos)
end
--;===========================================================
--; LOAD GLOSSARY.DEF DATA
--;===========================================================
local function f_glossaryLoad()
t_glossary = {}
local t = {}
local section = 0
local file = io.open(glossaryDef,"r")
local content = file:read("*all")
file:close()
content = content:gsub('([^\r\n]*)%s*;[^\r\n]*', '%1')
content = content:gsub('\n%s*\n', '\n')

for line in content:gmatch('[^\r\n]+') do
	if line:match('^%s*%[%s*[Ss][Ee][Cc][Tt][Ii][Oo][Nn]%s+[0-9]+$*%]') then
		section = 1
		row = #t_glossary+1
		t_glossary[row] = {}
--[Section No]
	elseif section == 1 then
	--displaytitle = section name (string)
		if line:match('^%s*displaytitle%s*=') then
			local data = line:gsub('%s*;.*$', '')
			t_glossary[row]['title'] = data:gsub('^%s*displaytitle%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
		end
	--icon = group_no, index_no (int, int)
		if line:match('^%s*icon%s*=') then
			local data = line:gsub('%s*;.*$', '')
			t_glossary[row]['icon'] = data:gsub('^%s*icon%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
		end
	--displayname = string
		if line:match('^%s*displayname%s*=') then
			local data = line:gsub('%s*;.*$', '')
			t_glossary[row][#t_glossary[row]+1] = {}
			t_glossary[row][#t_glossary[row]]['name'] = data:gsub('^%s*displayname%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
		end
	--id = item ID (string) UNUSED
		if line:match('^%s*id%s*=') then
			local data = line:gsub('%s*;.*$', '')
			t_glossary[row][#t_glossary[row]]['id'] = data:gsub('^%s*id%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
		end
	--text: string
		if line:match('text:$') then
			t_glossary[row][#t_glossary[row]]['content'] = ""
		end
		if t_glossary[row][1] then --This just avoid read [title] and [icon] in the table to avoid issues with below logic
			if type(t_glossary[row][#t_glossary[row]].content) == 'string' then
				if t_glossary[row][#t_glossary[row]].content == '' then
					t_glossary[row][#t_glossary[row]].content = " " --line  --line get "text:" and we don't need that
				else
					t_glossary[row][#t_glossary[row]].content = t_glossary[row][#t_glossary[row]].content .. '\n' .. line
				end
			end
		end
	end
--[[
	textImgSetText(txt_loading, "LOADING GLOSSARY...")
	textImgDraw(txt_loading)
	refresh()
	]]
end
if data.debugLog then f_printTable(t_glossary, "save/debug/t_glossary.log") end
end
--;===========================================================
--; GLOSSARY MENU (explain all terminology that shows up in the game)
--;===========================================================
function f_glossaryMenu()
	f_glossaryLoad() --Load Glossary Data from .def file
	cmdInput()
	local cursorPosX = 1
	local cursorPosY = 1
	local moveTxt = 0
	local glossaryMenu = 1
	local glossaryText = 1
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	local maxItems = 1
	local reading = false
	--
	local txtPosX = 88
	local function f_resetYPos() txtPosY = 45 end
	f_resetYPos()
	local txtSpacing = 12
	data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', sprFade)
	while true do
		if not reading then --When have Menu Controls
		--BACK
			if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
				data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', sprFade)
				sndPlay(sndSys, 100, 2)
				break
		--START READING
			elseif btnPalNo(p1Cmd, true) > 0 or btnPalNo(p2Cmd, true) > 0 then
				sndPlay(sndSys, 100, 1)
				reading = true
		--PREVIOUS SECTION
			elseif commandGetState(p1Cmd, 'l') or commandGetState(p2Cmd, 'l') or ((commandGetState(p1Cmd, 'holdl') or commandGetState(p2Cmd, 'holdl')) and bufl >= 30) then
				sndPlay(sndSys, 100, 0)
				glossaryMenu = glossaryMenu - 1
				f_resetYPos()
		--NEXT SECTION
			elseif commandGetState(p1Cmd, 'r') or commandGetState(p2Cmd, 'r') or ((commandGetState(p1Cmd, 'holdr') or commandGetState(p2Cmd, 'holdr')) and bufr >= 30) then
				sndPlay(sndSys, 100, 0)
				glossaryMenu = glossaryMenu + 1
				f_resetYPos()
		--PREVIOUS CONTENT
			elseif ((commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u')) or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30)) then
				sndPlay(sndSys, 100, 0)
				glossaryText = glossaryText - 1
				f_resetYPos()
		--NEXT CONTENT
			elseif ((commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd')) or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30)) then
				sndPlay(sndSys, 100, 0)
				glossaryText = glossaryText + 1
				f_resetYPos()
			end
		else --When have text controls
		--READING DONE
			if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
				sndPlay(sndSys, 100, 2)
				reading = false
		--MOVE UP TXT
			elseif ((commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u')) or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 5)) and txtPosY < 45 then
				txtPosY = txtPosY + 1
		--MOVE DOWN TXT
			elseif ((commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd')) or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 5)) then
				txtPosY = txtPosY - 1
			end
		end
	--Section Scroll Logic
		if glossaryMenu < 1 then
			glossaryMenu = #t_glossary
			if #t_glossary > maxItems then
				cursorPosX = maxItems
			else
				cursorPosX = #t_glossary
			end
		elseif glossaryMenu > #t_glossary then
			glossaryMenu = 1
			cursorPosX = 1
		elseif ((commandGetState(p1Cmd, 'l') or commandGetState(p2Cmd, 'l')) or ((commandGetState(p1Cmd, 'holdl') or commandGetState(p2Cmd, 'holdl')) and bufl >= 30)) and cursorPosX > 1 then
			cursorPosX = cursorPosX - 1
		elseif ((commandGetState(p1Cmd, 'r') or commandGetState(p2Cmd, 'r')) or ((commandGetState(p1Cmd, 'holdr') or commandGetState(p2Cmd, 'holdr')) and bufr >= 30)) and cursorPosX < maxItems then
			cursorPosX = cursorPosX + 1
		end
		if cursorPosX == maxItems then
			moveTxt = (glossaryMenu - maxItems) * 15
		elseif cursorPosX == 1 then
			moveTxt = (glossaryMenu - 1) * 15
		end
		if #t_glossary <= maxItems then
			maxSection = #t_glossary
		elseif glossaryMenu - cursorPosX > 0 then
			maxSection = glossaryMenu + maxItems - cursorPosX
		else
			maxSection = maxItems
		end
	--Content Scroll Logic
		if glossaryText < 1 then
			glossaryText = #t_glossary[glossaryMenu]
			if #t_glossary[glossaryMenu] > maxItems then
				cursorPosY = maxItems
			else
				cursorPosY = #t_glossary[glossaryMenu]
			end
		elseif glossaryText > #t_glossary[glossaryMenu] then
			glossaryText = 1
			cursorPosY = 1
		elseif ((commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u')) or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30)) and cursorPosY > 1 then
			cursorPosY = cursorPosY - 1
		elseif ((commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd')) or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30)) and cursorPosY < maxItems then
			cursorPosY = cursorPosY + 1
		end
		if cursorPosY == maxItems then
			moveTxt = (glossaryText - maxItems) * 15
		elseif cursorPosY == 1 then
			moveTxt = (glossaryText - 1) * 15
		end
		if #t_glossary[glossaryMenu] <= maxItems then
			maxName = #t_glossary[glossaryMenu]
		elseif glossaryText - cursorPosY > 0 then
			maxName = glossaryText + maxItems - cursorPosY
		else
			maxName = maxItems
		end
	--Draw BG
		animDraw(f_animVelocity(glossaryBG, -0.1, -0.1))
	--Draw Section Text
		textImgSetText(txt_glossarySection, t_glossary[glossaryMenu].title)
		textImgDraw(txt_glossarySection)
	--Draw Content Title Text
		textImgSetText(txt_glossaryTitleText, t_glossary[glossaryMenu][glossaryText].name)
		textImgDraw(txt_glossaryTitleText)
	--Draw Content Preview
		--f_drawCharAnim(t_selChars[p1Cell+1], 'p1AnimStand', 30, 158, true, 1, 1)
	--Draw Content Text
		f_textRender(txt_glossaryText, t_glossary[glossaryMenu][glossaryText].content, 0, txtPosX, txtPosY, txtSpacing, 0, -1) --Draw Text
		animPosDraw(glossaryTitleBG, -56, 0) --Draw Title BG
		textImgDraw(txt_glossaryTitle) --Draw Menu Title
		if not reading then drawGlossaryInputHints() else drawGlossaryInputHints2() end
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
		if commandGetState(p1Cmd, 'holdr') or commandGetState(p2Cmd, 'holdr') then
			bufl = 0
			bufr = bufr + 1
		elseif commandGetState(p1Cmd, 'holdl') or commandGetState(p2Cmd, 'holdl') then
			bufr = 0
			bufl = bufl + 1
		else
			bufr = 0
			bufl = 0
		end
		cmdInput()
		refresh()
	end
end