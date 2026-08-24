local loadLuaModule = true
--[[=============================================================================
This Lua Module has been specifically designed for I.K.E.M.E.N. PLUS ULTRA Engine.
		Therefore, it may NOT be compatible with I.K.E.M.E.N. GO Engine.
=================================================================================]]
lifebarSpr = sffNew("script/mods/customize/lifebars.sff") --Load lifebar Sprites
--;===========================================================
--; BATTLE HUD SETTINGS SCREENPACK DEFINITION
--;===========================================================
local txt_lifebarMenu = createTextImg(jgFnt, 0, 0, "BATTLE HUD SELECT", 160, 15)
local txt_lifebarInfo = createTextImg(font5, 0, 0, "", 159.5, 181)
local txt_lifebarAuthor = createTextImg(font5, 0, 1, "", 0, 193)
local txt_lifebarPath = createTextImg(font5, 0, 1, "", 0, 205)
local txt_lifebarLock = createTextImg(font5, 0, 1, "", 0, 217)
local txt_NoDataFound = "BATTLE HUD NOT FOUND."
local p1Face = "Kung Fu Man" --Use this character portrait (loaded in select.def) for battle hud p1 side
local p2Face = "Suave Dude"

local padlocklifebarPosX = 125 --Padlock Position for lifebars Menu
local padlocklifebarPosY = 55

local lifebarCommonPosX = 60 --Allow set common pos for all previews
local lifebarCommonPosY = 25

local lifebarCommonScaleX = 0.2 --Allow set common scale for all previews
local lifebarCommonScaleY = 0.2

--Above Transparent background
local lifebarBG1 = animNew(sprIkemen, [[
3,0, 0,0, -1
]])
animSetPos(lifebarBG1, 48, 19)
animSetAlpha(lifebarBG1, 20, 100)
animUpdate(lifebarBG1)

--Below Transparent background
local lifebarBG2 = animNew(sprIkemen, [[
3,0, 0,0, -1
]])
animSetPos(lifebarBG2, 40, 130)
animSetAlpha(lifebarBG2, 20, 100)
animUpdate(lifebarBG2)

--Common Menu Left Arrows
local lifebarArrowLeft = animNew(sprIkemen, [[
223,0, 0,0, 10
223,1, 0,0, 10
223,2, 0,0, 10
223,3, 0,0, 10
223,3, 0,0, 10
223,2, 0,0, 10
223,1, 0,0, 10
223,0, 0,0, 10
]])
animSetPos(lifebarArrowLeft, 32, 82)

--Common Menu Right Arrows
local lifebarArrowRight = animNew(sprIkemen, [[
224,0, 0,0, 10
224,1, 0,0, 10
224,2, 0,0, 10
224,3, 0,0, 10
224,3, 0,0, 10
224,2, 0,0, 10
224,1, 0,0, 10
224,0, 0,0, 10
]])
animSetPos(lifebarArrowRight, 262, 82)

--Lifebar Edit Sample Backgrounds
local sampleBG1 = animNew(lifebarSpr, [[
1,1, 0,0, -1
]])
animSetPos(sampleBG1, -53, 0)
animSetScale(sampleBG1, 0.335, 0.335)
animUpdate(sampleBG1)

local sampleBG2 = animNew(lifebarSpr, [[
1,2, 0,0, -1
]])
animSetPos(sampleBG2, -53, 0)
animSetScale(sampleBG2, 0.335, 0.335)
animUpdate(sampleBG2)

--Lifebar Edit Input Hints Window BG
local inputEditBG = animNew(sprIkemen, [[
230,3, 0,0, -1
]])
animSetScale(inputEditBG, 0.55, 2.0)
animSetAlpha(inputEditBG, 155, 22)

--lifebars Input Hints Panel
local function drawlifebarInputHints(itemPath)
	local inputHintYPos = 219
	local hintFont = font2
	local hintFontYPos = 233
	local hudState = nil
	if data.lifebar == itemPath then hudState = ":Edit" else hudState = ":Install" end
	animPosDraw(inputHintsBG, -56, 219)
	drawMenuInputHints("l","40,"..inputHintYPos,"r","60,"..inputHintYPos,"s","132,"..inputHintYPos,"e","210,"..inputHintYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Select", 81, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, hudState, 153, hintFontYPos)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Return", 231, hintFontYPos)
end

--lifebars edit Input Hints Panel
local function drawlifebarEditInputHints(editing)
	local hudState = nil
	if editing then hudState = ":Move" else hudState = ":Select" end
	local inputHintXPos = 120
	local hintFontXPos = inputHintXPos + 21
	local hintFont = font2
	animPosDraw(inputEditBG, inputHintXPos - 2, 85)
	drawMenuInputHints(
		"u",inputHintXPos..",87","d",inputHintXPos + 20 ..",87",
		"s",inputHintXPos..",107",
		"e",inputHintXPos..",127",
		"q",inputHintXPos..",147",
		"w",inputHintXPos..",167",
		"a",inputHintXPos..",187"
	)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, hudState, inputHintXPos + 41, 100)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Confirm", hintFontXPos, 120)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Return", hintFontXPos, 140)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Default", hintFontXPos, 160)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Stage", hintFontXPos, 180)
	f_drawQuickText(txt_btnHint, hintFont, 0, 1, ":Team Mode", hintFontXPos, 200)
end
--;===========================================================
--; LOAD LIFEBAR.DEF DATA
--;===========================================================
local function f_loadlifebars()
t_lifebars = {}
t_lifebarDef = {}
local file = io.open(fightDef, "r")
	if file ~= nil then
		local section = 0
		local row = 0
		local content = file:read("*all")
		file:close()
		content = content:gsub('([^\r\n]*)%s*;[^\r\n]*', '%1')
		content = content:gsub('\n%s*\n', '\n')
		for line in content:gmatch('[^\r\n]+') do
			local lineLower = line:lower()
		--[Lifebar No]
			if lineLower:match('^%s*%[%s*lifebar%s+%d+%s*%]') then
				section = 1
				row = #t_lifebars + 1
			--Set Default Values
				t_lifebars[row] = {
					previewspr = {0, 0},
					previewpos = {lifebarCommonPosX, lifebarCommonPosY},
					previewscale = {lifebarCommonScaleX, lifebarCommonScaleY},
					txtID = textImgNew(),
					author = "???",
					info = "",
					infolock = "???",
					unlock = "true"
				}
		--Extra section
			elseif lineLower:match('^%s*%[%s*%w+%s*%]') then
				section = -1
			elseif section == 1 then
			--Detect paramvalues
				local param, value = line:match('^%s*(.-)%s*=%s*(.-)%s*$')
				if param ~= nil and value ~= nil then
					param = param:lower()
					value = value:match('^%s*(.-)%s*$') --remove spaces
				--Paramvalues that will be stored as tables
					local isTableParam = (param == "previewspr" or param == "previewpos" or param == "previewscale")
				--Only convert to a table if the parameter is of type "list" and contains a comma
					if isTableParam and value:match(',') then
						local tbl = {}
						for num in value:gmatch('([^,]+)') do
							table.insert(tbl, num:match('^%s*(.-)%s*$'))
						end
						t_lifebars[row][param] = tbl
				--Store value as string
					else
						t_lifebars[row][param] = value
					end
				end
			end
		--Create lifebar ids reference table for shop use
			if t_lifebars[row].id then
				t_lifebarDef[t_lifebars[row].id] = row
			end
		end
		if data.debugLog then
			f_printTable(t_lifebars, "save/debug/t_lifebars.log")
			f_printTable(t_lifebarDef, "save/debug/t_lifebarDef.log")
		end
		for _, v in ipairs(t_lifebars) do --Send lifebars Unlock Condition to t_unlockLua table
			t_unlockLua.modes[v.id] = v.unlock
		end
		f_updateUnlocks()
		textImgSetText(txt_loading, "LOADING LIFEBARS...")
		textImgDraw(txt_loading)
		refresh()
	end
end
f_loadlifebars() --Loads when engine starts

local function f_saveLifebar()
local datasavFile = nil
local lifebarDef = nil
--;===========================================================
--; DATA_SAV.LUA
--;===========================================================
--Data loading from data_sav.lua
	local file = io.open(saveCfgPath, "r")
	datasavFile = file:read("*all")
	file:close()
	local t_saves = {
		['data.lifebar'] = data.lifebar
	}
--Save Data to data_sav.lua
	datasavFile = f_strSub(datasavFile, t_saves)
	local file_sav = io.open(saveCfgPath, "w+")
	file_sav:write(datasavFile)
	file_sav:close()
--;===========================================================
--; FIGHT.DEF
--;===========================================================
--Data loading from data.lifebar
	local fileDef = io.open(data.lifebar, "r")
	lifebarDef = fileDef:read("*all")
	fileDef:close()
--Apply settings from data.lifebar
	--data.roundsNum = tonumber(lifebarDef:match('match.wins%s*=%s*(%d+)'))
	drawNum = tonumber(lifebarDef:match('match.maxdrawgames%s*=%s*(%d+)'))
--Lifebar Settings
	--lifebarDef = lifebarDef:gsub('match.wins%s*=%s*%d+', 'match.wins = ' .. data.roundsNum)
	lifebarDef = lifebarDef:gsub('match.maxdrawgames%s*=%s*%d+', 'match.maxdrawgames = ' .. drawNum)
--Save Data to lifebar selected
	local filedefSav = io.open(data.lifebar, "w+")
	filedefSav:write(lifebarDef)
	filedefSav:close()
--;===========================================================
--; HUDCFG.INI
--;===========================================================
--Extract the directory path of the current lifebar
	local dir = data.lifebar:match("(.-)[^/]*$")
	local hudCfgPath = dir .. "hudCfg.ini"
--Read the current configuration from config.ssz
	local fileSSZ = io.open(saveCoreCfgPath, "r")
	local lf_configSSZ = fileSSZ:read("*all")
	fileSSZ:close()
	local upperHudPosX = tonumber(lf_configSSZ:match('const int LifebarUpperHudX%s*=%s*(%-?%d+)')) or 0
	local upperHudPosY = tonumber(lf_configSSZ:match('const int LifebarUpperHudY%s*=%s*(%-?%d+)')) or 0
	local lowerHudPosX = tonumber(lf_configSSZ:match('const int LifebarLowerHudX%s*=%s*(%-?%d+)')) or 0
	local lowerHudPosY = tonumber(lf_configSSZ:match('const int LifebarLowerHudY%s*=%s*(%-?%d+)')) or 0
--Check if hudCfg.ini exists in the lifebar's directory
	if not f_fileExists(hudCfgPath) then
	--If it doesn't exist, create it and save the current coordinates from config.ssz
		local fileIni = io.open(hudCfgPath, "w+")
		if fileIni then
			fileIni:write("[Battle HUD]\n")
			fileIni:write("LifebarUpperHudX = " .. 0 .. "\n")
			fileIni:write("LifebarUpperHudY = " .. 0 .. "\n")
			fileIni:write("LifebarLowerHudX = " .. 0 .. "\n")
			fileIni:write("LifebarLowerHudY = " .. 0 .. "\n")
			fileIni:close()
		end
	else
	--If exist, read the values and apply them to config.ssz
		local t_hud = f_loadDef(hudCfgPath)
		if t_hud and t_hud["battle hud"] then
			local newUpperHudPosX = t_hud["battle hud"]["lifebarupperhudx"] or upperHudPosX
			local newUpperHudPosY = t_hud["battle hud"]["lifebarupperhudy"] or upperHudPosY
			local newLowerHudPosX = t_hud["battle hud"]["lifebarlowerhudx"] or lowerHudPosX
			local newLowerHudPosY = t_hud["battle hud"]["lifebarlowerhudy"] or lowerHudPosY
		--Update config.ssz string
			lf_configSSZ = lf_configSSZ:gsub('const int LifebarUpperHudX%s*=%s*%-?%d+', 'const int LifebarUpperHudX = ' .. newUpperHudPosX)
			lf_configSSZ = lf_configSSZ:gsub('const int LifebarUpperHudY%s*=%s*%-?%d+', 'const int LifebarUpperHudY = ' .. newUpperHudPosY)
			lf_configSSZ = lf_configSSZ:gsub('const int LifebarLowerHudX%s*=%s*%-?%d+', 'const int LifebarLowerHudX = ' .. newLowerHudPosX)
			lf_configSSZ = lf_configSSZ:gsub('const int LifebarLowerHudY%s*=%s*%-?%d+', 'const int LifebarLowerHudY = ' .. newLowerHudPosY)
		--Save changes to config.ssz
			local fileSSZ = io.open(saveCoreCfgPath, "w+")
			if fileSSZ then
				fileSSZ:write(lf_configSSZ)
				fileSSZ:close()
			end
		end
	end
	loadLifebar(data.lifebar) --Reload lifebar with new settings
end
--;===========================================================
--; BATTLE HUD SETTINGS
--;===========================================================
function f_lifebarCfg()
	if data.debugMode then f_loadlifebars() end --Load in real-time only if dev/debug mode is enabled
	if #t_lifebars == 0 then
		t_infoWindowMsg.text = txt_NoDataFound
		infoScreen = true
		return
	end
	f_discordUpdate({details = "Editing Battle HUD"})
	cmdInput()
	lifebarMenu = 1
	local cursorPosX = 1
	local moveTxt = 0
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	local previewTransS = nil
	local previewTransD = nil
	f_unlock(false)
	f_updateUnlocks()
	f_infoReset()
	data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', sprFade)
	while true do
		if not infoScreen then
			if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
				f_discordMainMenu()
				data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', sprFade)
				sndPlay(sndSys, 100, 2)
				f_resetMenuArrowsPos()
				break
			elseif commandGetState(p1Cmd, 'l') or commandGetState(p2Cmd, 'l') or ((commandGetState(p1Cmd, 'holdl') or commandGetState(p2Cmd, 'holdl')) and bufl >= 30) then
				sndPlay(sndSys, 100, 0)
				lifebarMenu = lifebarMenu - 1
			elseif commandGetState(p1Cmd, 'r') or commandGetState(p2Cmd, 'r') or ((commandGetState(p1Cmd, 'holdr') or commandGetState(p2Cmd, 'holdr')) and bufr >= 30) then
				sndPlay(sndSys, 100, 0)
				lifebarMenu = lifebarMenu + 1
		--Edit Lifebar
			elseif btnPalNo(p1Cmd, true) > 0 or btnPalNo(p2Cmd, true) > 0 then
			--LIFEBAR AVAILABLE
				if f_fileExists(t_lifebars[lifebarMenu].path) and t_unlockLua.modes[t_lifebars[lifebarMenu].id] == nil then --If the lifebar is unlocked
					sndPlay(sndSys, 100, 1)
				--Install New Lifebar
					if data.lifebar ~= t_lifebars[lifebarMenu].path then
						data.lifebar = t_lifebars[lifebarMenu].path
				--Edit Lifebar
					else
						f_lifebarEdit(data.lifebar)
					end
					f_saveLifebar()
			--LIFEBAR UNAVAILABLE / DOES NOT EXIST
				else
					sndPlay(sndIkemen, 200, 0)
					if not f_fileExists(t_lifebars[lifebarMenu].path) then
						t_infoWindowMsg.text = txt_NoDataFound
						infoScreen = true
					end
				end
			end
		--Cursor position calculation
			if lifebarMenu < 1 then
				lifebarMenu = #t_lifebars
				if #t_lifebars > 5 then
					cursorPosX = 5
				else
					cursorPosX = #t_lifebars
				end
			elseif lifebarMenu > #t_lifebars then
				lifebarMenu = 1
				cursorPosX = 1
			elseif ((commandGetState(p1Cmd, 'l') or commandGetState(p2Cmd, 'l')) or ((commandGetState(p1Cmd, 'holdl') or commandGetState(p2Cmd, 'holdl')) and bufl >= 30)) and cursorPosX > 1 then
				cursorPosX = cursorPosX - 1
			elseif ((commandGetState(p1Cmd, 'r') or commandGetState(p2Cmd, 'r')) or ((commandGetState(p1Cmd, 'holdr') or commandGetState(p2Cmd, 'holdr')) and bufr >= 30)) and cursorPosX < 5 then
				cursorPosX = cursorPosX + 1
			end
			if cursorPosX == 5 then
				moveTxt = (lifebarMenu - 5) * 15
			elseif cursorPosX == 1 then
				moveTxt = (lifebarMenu - 1) * 15
			end
			if #t_lifebars <= 5 then
				maxlifebars = #t_lifebars
			elseif lifebarMenu - cursorPosX > 0 then
				maxlifebars = lifebarMenu + 5 - cursorPosX
			else
				maxlifebars = 5
			end
		end
		animDraw(f_animVelocity(commonBG0, -1, -1))
	--Draw Transparent BG
		animSetScale(lifebarBG1, 206, 152)
		animSetWindow(lifebarBG1, 58,22, 222,160)
		animDraw(lifebarBG1)
	--Draw Title Menu
		textImgDraw(txt_lifebarMenu)
	--Draw lifebar Image Preview
		if t_unlockLua.modes[t_lifebars[lifebarMenu].id] == nil then --If the lifebar is unlocked
			previewTransS = nil
			previewTransD = nil
		else
			previewTransS = 150 --Apply Transparent
			previewTransD = 0
		end
		f_drawSprPreview(lifebarSpr,
			t_lifebars[lifebarMenu].previewspr[1], t_lifebars[lifebarMenu].previewspr[2],
			t_lifebars[lifebarMenu].previewpos[1], t_lifebars[lifebarMenu].previewpos[2],
			t_lifebars[lifebarMenu].previewscale[1], t_lifebars[lifebarMenu].previewscale[2],
			previewTransS, previewTransD
		)
	--Draw Active Cursor
		animSetWindow(cursorBox, 60,25, 192,144)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
	--Draw lifebar Info text
		textImgSetText(txt_lifebarInfo, t_lifebars[lifebarMenu].info)
		textImgDraw(txt_lifebarInfo)
		textImgSetText(txt_lifebarAuthor, "AUTHOR: "..t_lifebars[lifebarMenu].author)
		textImgDraw(txt_lifebarAuthor)
		textImgSetText(txt_lifebarPath, "PATH: "..t_lifebars[lifebarMenu].path)
		textImgDraw(txt_lifebarPath)
	--Item Locked
		if t_unlockLua.modes[t_lifebars[lifebarMenu].id] ~= nil then
			animPosDraw(padlock, padlocklifebarPosX, padlocklifebarPosY) --Draw Padlock Icon
			textImgSetText(txt_lifebarLock, "UNLOCK CONDITION: "..t_lifebars[lifebarMenu].infolock)
			textImgDraw(txt_lifebarLock)
		end
	--Draw Left Animated Cursor
		animDraw(lifebarArrowLeft)
		animUpdate(lifebarArrowLeft)
	--Draw Down Animated Cursor
		animDraw(lifebarArrowRight)
		animUpdate(lifebarArrowRight)
	--Draw Input Hints Panel
		drawlifebarInputHints(t_lifebars[lifebarMenu].path)
		if infoScreen then f_infoMenu() end
		animDraw(data.fadeTitle)
		animUpdate(data.fadeTitle)
		if commandGetState(p1Cmd, 'holdl') or commandGetState(p2Cmd, 'holdl') then
			bufr = 0
			bufl = bufl + 1
		elseif commandGetState(p1Cmd, 'holdr') or commandGetState(p2Cmd, 'holdr') then
			bufl = 0
			bufr = bufr + 1
		else
			bufl = 0
			bufr = 0
		end
		cmdInput()
		refresh()
	end
end

local t_lifebarFonts = {}
local function f_loadLifebarFonts(t, dir)
	t_lifebarFonts = {}
	for key, value in pairs(t) do
	--Check Fonts in File Section
		if key:match("^font%d+$") then
			local fontPath = value
		--Check that font exist in the exact path stored in files section of t_hudCfg
			if not f_fileExists(fontPath) then
			--If font is not found, then use lifebar path defined in lifebars.def file like lifebarSffDat
				local localPath = dir..value
				if f_fileExists(localPath) then fontPath = localPath end
				--if data.debugLog then f_printTable(localPath, "script/test.log") end
			end
			t_lifebarFonts[key] = fontNew(fontPath) --Generate a table with lifebars fonts data
		end
	end
	if data.debugLog then f_printTable(t_lifebarFonts, "save/debug/t_lifebarFonts.log") end
end

local t_lifebarAnims = {}
local function f_loadLifebarAnims(t, sffDat)
	t_lifebarAnims = {}
	for section, actionsTable in pairs(t) do
		local actionID = section:match("^begin%s+action%s+(%d+)$")
		if actionID then t_lifebarAnims[tonumber(actionID)] = f_animFromTable(actionsTable, sffDat) end
	end
	if data.debugLog then f_printTable(t_lifebarAnims, "save/debug/t_lifebarAnims.log") end
end

--Function to safe convert any string to a number.
local function f_cleanTonumber(val)
	if not val then return 0 end
--If it is already a number, return it directly.
	if type(val) == "number" then return val end
--Extract number
	local numStr = tostring(val):match("%-?%d+%.?%d*")
	return tonumber(numStr) or 0
end

function f_lifebarEdit(path)
	cmdInput()
--Load Battle HUD Data
	local t_hudCfg = nil
	t_hudCfg = f_loadDef(path)
	if data.debugLog then f_printTable(t_hudCfg, "save/debug/t_hudCfg.log") end
	if t_hudCfg == nil or t_hudCfg == 0 then return end
	local dir = path:match("(.-)[^/]*$")
	local lifebarSffDat = sffNew(dir..t_hudCfg.files.sff)
	f_loadLifebarFonts(t_hudCfg.files, dir)
	f_loadLifebarAnims(t_hudCfg, lifebarSffDat)
--Load custom positions from hudCfg.ini file
	local hudCfgPath = dir.."hudCfg.ini"
	if f_fileExists(hudCfgPath) then
		local t_hud = f_loadDef(hudCfgPath)
		if t_hud and t_hud["battle hud"] then
			upperHudPosX = tonumber(t_hud["battle hud"]["lifebarupperhudx"]) or upperHudPosX
			upperHudPosY = tonumber(t_hud["battle hud"]["lifebarupperhudy"]) or upperHudPosY
			lowerHudPosX = tonumber(t_hud["battle hud"]["lifebarlowerhudx"]) or lowerHudPosX
			lowerHudPosY = tonumber(t_hud["battle hud"]["lifebarlowerhudy"]) or lowerHudPosY
		end
	end
--Load Portraits
	local p1ID = p1Face:lower()
	local p2ID = p2Face:lower()
	local pID = nil
	if t_charDef[p1ID] ~= nil then --If this char has been registered, use his id
		p1ID = t_charDef[p1ID]
	else
		p1ID = 0
	end
	if t_charDef[p2ID] ~= nil then
		p2ID = t_charDef[p2ID]
	else
		p2ID = 0
	end
--Editor Screen vars
	local upperHudTransS = nil
	local upperHudTransD = nil
	local lowerHudTransS = nil
	local lowerHudTransD = nil
	local editActive = false
	local editHUD = 1 --1= Upper Hud (Lifebars, Faces, Round Time), 2=Lower Hud (Powerbars)
	local teamModeHUD = 1 --1= Single, 2=Simul, 3=Turns
	local drawLimit = nil
	local lifebarSection = nil
	local faceSection = nil
	local nameSection = nil
	local teamID = nil
	local sampleID = 1
	local bufu = 0
	local bufd = 0
	local bufr = 0
	local bufl = 0
	data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', sprFade)
	while true do
		if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
		--Save and Back
			if not editActive then
				data.fadeTitle = f_fadeAnim(MainFadeInTime, 'fadein', 'black', sprFade)
				sndPlay(sndSys, 100, 2)
			--Save Battle HUD Settings in custom HudCfg.ini
				local file = io.open(hudCfgPath, "w+")
				if file then
					file:write("[Battle HUD]\n")
					file:write("LifebarUpperHudX = " .. upperHudPosX .. "\n")
					file:write("LifebarUpperHudY = " .. upperHudPosY .. "\n")
					file:write("LifebarLowerHudX = " .. lowerHudPosX .. "\n")
					file:write("LifebarLowerHudY = " .. lowerHudPosY .. "\n")
					file:close()
				end
				break
		--Back without Save
			else
				sndPlay(sndSys, 100, 2)
				editActive = false
			end
	--Section Select (Lifebars/Powerbars)
		elseif commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30) then
			if editActive then
			--Edit Upper HUD
				if editHUD == 1 then
					upperHudPosY = upperHudPosY - 1
			--Edit Lower HUD
				elseif editHUD == 2 then
					lowerHudPosY = lowerHudPosY - 1
				end
			else
				sndPlay(sndSys, 100, 0)
				editHUD = editHUD - 1
				if editHUD == 0 then editHUD = 2 end
			end
		elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30) then
			if editActive then
			--Edit Upper HUD
				if editHUD == 1 then
					upperHudPosY = upperHudPosY + 1
			--Edit Lower HUD
				elseif editHUD == 2 then
					lowerHudPosY = lowerHudPosY + 1
				end
			else
				sndPlay(sndSys, 100, 0)
				editHUD = editHUD + 1
				if editHUD > 2 then editHUD = 1 end
			end
	--Restore Default Values
		elseif commandGetState(p1Cmd, 'q') or commandGetState(p2Cmd, 'q') then
			sndPlay(sndSys, 100, 2)
			if editActive then
			--Restore Upper HUD
				if editHUD == 1 then
					upperHudPosY = 0
			--Restore Lower HUD
				elseif editHUD == 2 then
					lowerHudPosY = 0
				end
		--Restore All
			else
				upperHudPosY = 0
				lowerHudPosY = 0
			end
	--Change Background/Stage
		elseif commandGetState(p1Cmd, 'w') or commandGetState(p2Cmd, 'w') then
			sndPlay(sndIkemen, 200, 2)
			if sampleID == 1 then sampleID = 2 else sampleID = 1 end
	--Change Team Mode
		elseif commandGetState(p1Cmd, 'a') or commandGetState(p2Cmd, 'a') then
			sndPlay(sndIkemen, 200, 2)
			if teamModeHUD < 3 then teamModeHUD = teamModeHUD + 1 else teamModeHUD = 1 end 
	--Start Editing
		elseif commandGetState(p1Cmd, 's') or commandGetState(p2Cmd, 's') then
			sndPlay(sndSys, 100, 1)
			if editActive then editActive = false else editActive = true end
		end
	--Transparency HUD Status
		if editHUD == 1 then
			upperHudTransS = 255
			upperHudTransD = 0
			lowerHudTransS = 150
			lowerHudTransD = 0
		elseif editHUD == 2 then
			lowerHudTransS = 255
			lowerHudTransD = 0
			upperHudTransS = 150
			upperHudTransD = 0
		end
	--Single
		if teamModeHUD == 1 then
			drawLimit = 2
			lifebarSection = "lifebar"
			faceSection = "face"
			nameSection = "name"
			teamID = "Single"
	--Simul
		elseif teamModeHUD == 2 then
			drawLimit = 8
			lifebarSection = "simul lifebar"
			faceSection = "simul face"
			nameSection = "simul name"
			teamID = "Simul"
	--Turns
		elseif teamModeHUD == 3 then
			drawLimit = 2
			lifebarSection = "turns lifebar"
			faceSection = "turns face"
			nameSection = "turns name"
			teamID = "Turns"
		end
	--Sample BG
		if sampleID == 1 then animDraw(sampleBG1) else animDraw(sampleBG2) end
		for i=1, drawLimit do
	--LIFEBARS
		--Check Positions
			local lfPos = t_hudCfg[lifebarSection]["p"..i..".pos"]
			local lfPosX = 0
			local lfPosY = 0
			if lfPos and lfPos ~= "" then
				lfPosX = f_cleanTonumber(lfPos[1])
				lfPosY = f_cleanTonumber(lfPos[2])
			end
	--BG0
		--Check Sprites
			local lfBG0Spr = t_hudCfg[lifebarSection]["p"..i..".bg0.spr"] or t_hudCfg[lifebarSection]["p"..i..".bg.spr"]
			local lfBG0SprGroup = -1
			local lfBG0SprIndex = -1
			if lfBG0Spr and lfBG0Spr ~= "" then
				lfBG0SprGroup = f_cleanTonumber(lfBG0Spr[1])
				lfBG0SprIndex = f_cleanTonumber(lfBG0Spr[2])
			end
		--Check Scale
			local lfBG0Scale = t_hudCfg[lifebarSection]["p"..i..".bg0.scale"] or t_hudCfg[lifebarSection]["p"..i..".bg.scale"]
			local lfBG0ScaleX = 1.0
			local lfBG0ScaleY = 1.0
			if lfBG0Scale and lfBG0Scale ~= "" then
				lfBG0ScaleX = lfBG0Scale[1]
				lfBG0ScaleY = lfBG0Scale[2]
			end
		--Check Facing and Vertical Facing
			if t_hudCfg[lifebarSection]["p"..i..".bg0.facing"] == -1 or t_hudCfg[lifebarSection]["p"..i..".bg.facing"] == -1 then lfBG0ScaleX = -lfBG0ScaleX end
			if t_hudCfg[lifebarSection]["p"..i..".bg0.vfacing"] == -1 or t_hudCfg[lifebarSection]["p"..i..".bg.vfacing"] == -1 then lfBG0ScaleY = -lfBG0ScaleY end
		--Draw BG0
			local lfBG0Anim = t_hudCfg[lifebarSection]["p"..i..".bg0.anim"] or t_hudCfg[lifebarSection]["p"..i..".bg.anim"]
			if lfBG0Anim and t_lifebarAnims[tonumber(lfBG0Anim)] then
				local animDat = t_lifebarAnims[tonumber(lfBG0Anim)]
				animSetPos(animDat, upperHudPosX + lfPosX, upperHudPosY + lfPosY)
				animSetScale(animDat, lfBG0ScaleX, lfBG0ScaleY)
				animSetAlpha(animDat, upperHudTransS, upperHudTransD)
				animUpdate(animDat)
				animDraw(animDat)
			else
				f_drawSprPreview(lifebarSffDat,
					lfBG0SprGroup, lfBG0SprIndex,
					upperHudPosX + lfPosX,
					upperHudPosY + lfPosY,
					lfBG0ScaleX, lfBG0ScaleY,
					upperHudTransS, upperHudTransD
				)
			end
	--BG1
		--Check Sprites
			local lfBG1Spr = t_hudCfg[lifebarSection]["p"..i..".bg1.spr"]
			local lfBG1SprGroup = -1
			local lfBG1SprIndex = -1
			if lfBG1Spr and lfBG1Spr ~= "" then
				lfBG1SprGroup = f_cleanTonumber(lfBG1Spr[1])
				lfBG1SprIndex = f_cleanTonumber(lfBG1Spr[2])
			end
		--Check Scale
			local lfBG1Scale = t_hudCfg[lifebarSection]["p"..i..".bg1.scale"]
			local lfBG1ScaleX = 1.0
			local lfBG1ScaleY = 1.0
			if lfBG1Scale and lfBG1Scale ~= "" then
				lfBG1ScaleX = lfBG1Scale[1]
				lfBG1ScaleY = lfBG1Scale[2]
			end
		--Check Facing and Vertical Facing
			if t_hudCfg[lifebarSection]["p"..i..".bg1.facing"] == -1 then lfBG1ScaleX = -lfBG1ScaleX end
			if t_hudCfg[lifebarSection]["p"..i..".bg1.vfacing"] == -1 then lfBG1ScaleY = -lfBG1ScaleY end
		--Draw BG1
			local lfBG1Anim = t_hudCfg[lifebarSection]["p"..i..".bg1.anim"]
			if lfBG1Anim and t_lifebarAnims[tonumber(lfBG1Anim)] then
				local animDat = t_lifebarAnims[tonumber(lfBG1Anim)]
				animSetPos(animDat, upperHudPosX + lfPosX, upperHudPosY + lfPosY)
				animSetScale(animDat, lfBG1ScaleX, lfBG1ScaleY)
				animSetAlpha(animDat, upperHudTransS, upperHudTransD)
				animUpdate(animDat)
				animDraw(animDat)
			else
				f_drawSprPreview(lifebarSffDat,
					lfBG1SprGroup, lfBG1SprIndex,
					upperHudPosX + lfPosX,
					upperHudPosY + lfPosY,
					lfBG1ScaleX, lfBG1ScaleY,
					upperHudTransS, upperHudTransD
				)
			end
	--BG2
		--Check Sprites
			local lfBG2Spr = t_hudCfg[lifebarSection]["p"..i..".bg2.spr"]
			local lfBG2SprGroup = -1
			local lfBG2SprIndex = -1
			if lfBG2Spr and lfBG2Spr ~= "" then
				lfBG2SprGroup = f_cleanTonumber(lfBG2Spr[1])
				lfBG2SprIndex = f_cleanTonumber(lfBG2Spr[2])
			end
		--Check Scale
			local lfBG2Scale = t_hudCfg[lifebarSection]["p"..i..".bg2.scale"]
			local lfBG2ScaleX = 1.0
			local lfBG2ScaleY = 1.0
			if lfBG2Scale and lfBG2Scale ~= "" then
				lfBG2ScaleX = lfBG2Scale[1]
				lfBG2ScaleY = lfBG2Scale[2]
			end
		--Check Facing and Vertical Facing
			if t_hudCfg[lifebarSection]["p"..i..".bg2.facing"] == -1 then lfBG2ScaleX = -lfBG2ScaleX end
			if t_hudCfg[lifebarSection]["p"..i..".bg2.vfacing"] == -1 then lfBG2ScaleY = -lfBG2ScaleY end
		--Draw BG2
			local lfBG2Anim = t_hudCfg[lifebarSection]["p"..i..".bg2.anim"]
			if lfBG2Anim and t_lifebarAnims[tonumber(lfBG2Anim)] then
				local animDat = t_lifebarAnims[tonumber(lfBG2Anim)]
				animSetPos(animDat, upperHudPosX + lfPosX, upperHudPosY + lfPosY)
				animSetScale(animDat, lfBG2ScaleX, lfBG2ScaleY)
				animSetAlpha(animDat, upperHudTransS, upperHudTransD)
				animUpdate(animDat)
				animDraw(animDat)
			else
				f_drawSprPreview(lifebarSffDat,
					lfBG2SprGroup, lfBG2SprIndex,
					upperHudPosX + lfPosX,
					upperHudPosY + lfPosY,
					lfBG2ScaleX, lfBG2ScaleY,
					upperHudTransS, upperHudTransD
				)
			end
	--Mid
		--Check Sprites
			local lfMidSpr = t_hudCfg[lifebarSection]["p"..i..".mid.spr"]
			local lfMidSprGroup = -1
			local lfMidSprIndex = -1
			if lfMidSpr and lfMidSpr ~= "" then
				lfMidSprGroup = f_cleanTonumber(lfMidSpr[1])
				lfMidSprIndex = f_cleanTonumber(lfMidSpr[2])
			end
		--Check Offset
			local lfMidOffset = t_hudCfg[lifebarSection]["p"..i..".mid.offset"]
			local lfMidOffsetX = 0
			local lfMidOffsetY = 0
			if lfMidOffset and lfMidOffset ~= "" then
				lfMidOffsetX = f_cleanTonumber(lfMidOffset[1])
				lfMidOffsetY = f_cleanTonumber(lfMidOffset[2])
			end
		--Check Scale
			local lfMidScale = t_hudCfg[lifebarSection]["p"..i..".mid.scale"]
			local lfMidScaleX = 1.0
			local lfMidScaleY = 1.0
			if lfMidScale and lfMidScale ~= "" then
				lfMidScaleX = lfMidScale[1]
				lfMidScaleY = lfMidScale[2]
			end
		--Check Facing and Vertical Facing
			if t_hudCfg[lifebarSection]["p"..i..".mid.facing"] == -1 then lfMidScaleX = -lfMidScaleX end
			if t_hudCfg[lifebarSection]["p"..i..".mid.vfacing"] == -1 then lfMidScaleY = -lfMidScaleY end
		--Draw Mid
			local lfMidAnim = t_hudCfg[lifebarSection]["p"..i..".mid.anim"]
			if lfMidAnim and t_lifebarAnims[tonumber(lfMidAnim)] then
				local animDat = t_lifebarAnims[tonumber(lfMidAnim)]
				animSetPos(animDat, upperHudPosX + lfPosX + lfMidOffsetX, upperHudPosY + lfPosY + lfMidOffsetY)
				animSetScale(animDat, lfMidScaleX, lfMidScaleY)
				animSetAlpha(animDat, upperHudTransS, upperHudTransD)
				animUpdate(animDat)
				animDraw(animDat)
			else
				f_drawSprPreview(lifebarSffDat,
					lfMidSprGroup, lfMidSprIndex,
					upperHudPosX + lfPosX + lfMidOffsetX,
					upperHudPosY + lfPosY + lfMidOffsetY,
					lfMidScaleX, lfMidScaleY,
					upperHudTransS, upperHudTransD
				)
			end
	--Front
		--Check Sprites
			local lfFrontSpr = t_hudCfg[lifebarSection]["p"..i..".front.spr"]
			local lfFrontSprGroup = -1
			local lfFrontSprIndex = -1
			if lfFrontSpr and lfFrontSpr ~= "" then
				lfFrontSprGroup = f_cleanTonumber(lfFrontSpr[1])
				lfFrontSprIndex = f_cleanTonumber(lfFrontSpr[2])
			end
		--Check Offset
			local lfFrontOffset = t_hudCfg[lifebarSection]["p"..i..".front.offset"]
			local lfFrontOffsetX = 0
			local lfFrontOffsetY = 0
			if lfFrontOffset and lfFrontOffset ~= "" then
				lfFrontOffsetX = f_cleanTonumber(lfFrontOffset[1])
				lfFrontOffsetY = f_cleanTonumber(lfFrontOffset[2])
			end
		--Check Scale
			local lfFrontScale = t_hudCfg[lifebarSection]["p"..i..".front.scale"]
			local lfFrontScaleX = 1.0
			local lfFrontScaleY = 1.0
			if lfFrontScale and lfFrontScale ~= "" then
				lfFrontScaleX = lfFrontScale[1]
				lfFrontScaleY = lfFrontScale[2]
			end
		--Check Facing and Vertical Facing
			if t_hudCfg[lifebarSection]["p"..i..".front.facing"] == -1 then lfFrontScaleX = -lfFrontScaleX end
			if t_hudCfg[lifebarSection]["p"..i..".front.vfacing"] == -1 then lfFrontScaleY = -lfFrontScaleY end
		--Draw Front
			local lfFrontAnim = t_hudCfg[lifebarSection]["p"..i..".front.anim"]
			if lfFrontAnim and t_lifebarAnims[tonumber(lfFrontAnim)] then
				local animDat = t_lifebarAnims[tonumber(lfFrontAnim)]
				animSetPos(animDat, upperHudPosX + lfPosX + lfFrontOffsetX, upperHudPosY + lfPosY + lfFrontOffsetY)
				animSetScale(animDat, lfFrontScaleX, lfFrontScaleY)
				animSetAlpha(animDat, upperHudTransS, upperHudTransD)
				animUpdate(animDat)
				animDraw(animDat)
			else
				f_drawSprPreview(lifebarSffDat,
					lfFrontSprGroup, lfFrontSprIndex,
					upperHudPosX + lfPosX + lfFrontOffsetX,
					upperHudPosY + lfPosY + lfFrontOffsetY,
					lfFrontScaleX, lfFrontScaleY,
					upperHudTransS, upperHudTransD
				)
			end
	--CHARACTERS FACES
		--Check Positions
			local facePos = t_hudCfg[faceSection]["p"..i..".pos"]
			local facePosX = 0
			local facePosY = 0
			if facePos and facePos ~= "" then
				facePosX = f_cleanTonumber(facePos[1])
				facePosY = f_cleanTonumber(facePos[2])
			end
	--BG0
		--Check Sprites
			local faceBG0Spr = t_hudCfg[faceSection]["p"..i..".bg.spr"] or t_hudCfg[faceSection]["p"..i..".bg0.spr"]
			local faceBG0SprGroup = -1
			local faceBG0SprIndex = -1
			if faceBG0Spr and faceBG0Spr ~= "" then
				faceBG0SprGroup = f_cleanTonumber(faceBG0Spr[1])
				faceBG0SprIndex = f_cleanTonumber(faceBG0Spr[2])
			end
		--Check Scale
			local faceBG0Scale = t_hudCfg[faceSection]["p"..i..".bg.scale"] or t_hudCfg[faceSection]["p"..i..".bg0.scale"]
			local faceBG0ScaleX = 1.0
			local faceBG0ScaleY = 1.0
			if faceBG0Scale and faceBG0Scale ~= "" then
				faceBG0ScaleX = faceBG0Scale[1]
				faceBG0ScaleY = faceBG0Scale[2]
			end
		--Check Facing and Vertical Facing
			if t_hudCfg[faceSection]["p"..i..".bg.facing"] == -1 or t_hudCfg[faceSection]["p"..i..".bg0.facing"] == -1 then faceBG0ScaleX = -faceBG0ScaleX end
			if t_hudCfg[faceSection]["p"..i..".bg.vfacing"] == -1 or t_hudCfg[faceSection]["p"..i..".bg0.vfacing"] == -1 then faceBG0ScaleY = -faceBG0ScaleY end
		--Draw BG0
			local faceBG0Anim = t_hudCfg[faceSection]["p"..i..".bg.anim"] or t_hudCfg[faceSection]["p"..i..".bg0.anim"]
			if faceBG0Anim and t_lifebarAnims[tonumber(faceBG0Anim)] then
				local animDat = t_lifebarAnims[tonumber(faceBG0Anim)]
				animSetPos(animDat, upperHudPosX + facePosX, upperHudPosY + facePosY)
				animSetScale(animDat, faceBG0ScaleX, faceBG0ScaleY)
				animSetAlpha(animDat, upperHudTransS, upperHudTransD)
				animUpdate(animDat)
				animDraw(animDat)
			else
				f_drawSprPreview(lifebarSffDat,
					faceBG0SprGroup, faceBG0SprIndex,
					upperHudPosX + facePosX,
					upperHudPosY + facePosY,
					faceBG0ScaleX, faceBG0ScaleY,
					upperHudTransS, upperHudTransD
				)
			end
	--BG1
		--Check Sprites
			local faceBG1Spr = t_hudCfg[faceSection]["p"..i..".bg1.spr"]
			local faceBG1SprGroup = -1
			local faceBG1SprIndex = -1
			if faceBG1Spr and faceBG1Spr ~= "" then
				faceBG1SprGroup = f_cleanTonumber(faceBG1Spr[1])
				faceBG1SprIndex = f_cleanTonumber(faceBG1Spr[2])
			end
		--Check Scale
			local faceBG1Scale = t_hudCfg[faceSection]["p"..i..".bg1.scale"]
			local faceBG1ScaleX = 1.0
			local faceBG1ScaleY = 1.0
			if faceBG1Scale and faceBG1Scale ~= "" then
				faceBG1ScaleX = faceBG1Scale[1]
				faceBG1ScaleY = faceBG1Scale[2]
			end
		--Check Facing and Vertical Facing
			if t_hudCfg[faceSection]["p"..i..".bg1.facing"] == -1 then faceBG1ScaleX = -faceBG1ScaleX end
			if t_hudCfg[faceSection]["p"..i..".bg1.vfacing"] == -1 then faceBG1ScaleY = -faceBG1ScaleY end
		--Draw BG1
			local faceBG1Anim = t_hudCfg[faceSection]["p"..i..".bg1.anim"]
			if faceBG1Anim and t_lifebarAnims[tonumber(faceBG1Anim)] then
				local animDat = t_lifebarAnims[tonumber(faceBG1Anim)]
				animSetPos(animDat, upperHudPosX + facePosX, upperHudPosY + facePosY)
				animSetScale(animDat, faceBG1ScaleX, faceBG1ScaleY)
				animSetAlpha(animDat, upperHudTransS, upperHudTransD)
				animUpdate(animDat)
				animDraw(animDat)
			else
				f_drawSprPreview(lifebarSffDat,
					faceBG1SprGroup, faceBG1SprIndex,
					upperHudPosX + facePosX,
					upperHudPosY + facePosY,
					faceBG1ScaleX, faceBG1ScaleY,
					upperHudTransS, upperHudTransD
				)
			end
	--BG2
		--Check Sprites
			local faceBG2Spr = t_hudCfg[faceSection]["p"..i..".bg2.spr"]
			local faceBG2SprGroup = -1
			local faceBG2SprIndex = -1
			if faceBG2Spr and faceBG2Spr ~= "" then
				faceBG2SprGroup = f_cleanTonumber(faceBG2Spr[1])
				faceBG2SprIndex = f_cleanTonumber(faceBG2Spr[2])
			end
		--Check Scale
			local faceBG2Scale = t_hudCfg[faceSection]["p"..i..".bg2.scale"]
			local faceBG2ScaleX = 1.0
			local faceBG2ScaleY = 1.0
			if faceBG2Scale and faceBG2Scale ~= "" then
				faceBG2ScaleX = faceBG2Scale[1]
				faceBG2ScaleY = faceBG2Scale[2]
			end
		--Check Facing and Vertical Facing
			if t_hudCfg[faceSection]["p"..i..".bg2.facing"] == -1 then faceBG2ScaleX = -faceBG2ScaleX end
			if t_hudCfg[faceSection]["p"..i..".bg2.vfacing"] == -1 then faceBG2ScaleY = -faceBG2ScaleY end
		--Draw BG2
			local faceBG2Anim = t_hudCfg[faceSection]["p"..i..".bg2.anim"]
			if faceBG2Anim and t_lifebarAnims[tonumber(faceBG2Anim)] then
				local animDat = t_lifebarAnims[tonumber(faceBG2Anim)]
				animSetPos(animDat, upperHudPosX + facePosX, upperHudPosY + facePosY)
				animSetScale(animDat, faceBG2ScaleX, faceBG2ScaleY)
				animSetAlpha(animDat, upperHudTransS, upperHudTransD)
				animUpdate(animDat)
				animDraw(animDat)
			else
				f_drawSprPreview(lifebarSffDat,
					faceBG2SprGroup, faceBG2SprIndex,
					upperHudPosX + facePosX,
					upperHudPosY + facePosY,
					faceBG2ScaleX, faceBG2ScaleY,
					upperHudTransS, upperHudTransD
				)
			end
	--Face
		--Check Sprites
			local faceSpr = t_hudCfg[faceSection]["p"..i..".face.spr"]
			local faceSprGroup = -1
			local faceSprIndex = -1
			if faceSpr and faceSpr ~= "" then
				faceSprGroup = f_cleanTonumber(faceSpr[1])
				faceSprIndex = f_cleanTonumber(faceSpr[2])
			end
		--Check Offset
			local faceOffset = t_hudCfg[faceSection]["p"..i..".face.offset"]
			local faceOffsetX = 0
			local faceOffsetY = 0
			if faceOffset and faceOffset ~= "" then
				faceOffsetX = f_cleanTonumber(faceOffset[1])
				faceOffsetY = f_cleanTonumber(faceOffset[2])
			end
		--Check Scale
			local faceScale = t_hudCfg[faceSection]["p"..i..".face.scale"]
			local faceScaleX = 1.0
			local faceScaleY = 1.0
			if faceScale and faceScale ~= "" then
				faceScaleX = faceScale[1]
				faceScaleY = faceScale[2]
			end
		--Check Facing and Vertical Facing
			if t_hudCfg[faceSection]["p"..i..".face.facing"] == -1 then faceScaleX = -faceScaleX end
			if t_hudCfg[faceSection]["p"..i..".face.vfacing"] == -1 then faceScaleY = -faceScaleY end
		--Draw Face
			if t_hudCfg[faceSection] and (t_hudCfg[faceSection]["p"..i..".pos"] or t_hudCfg[faceSection]["p"..i..".face.spr"]) then --Fix Extra Simul Portrait
				if i % 2 == 0 then pID = p2ID else pID = p1ID end
				drawFacePortrait(pID, --Char ID
					--faceSprGroup, faceSprIndex,
					upperHudPosX + facePosX + faceOffsetX,
					upperHudPosY + facePosY + faceOffsetY,
					faceScaleX, faceScaleY,
					upperHudTransS, upperHudTransD
				)
			end
	--TEAM MATE (Turns Mode)
			if teamModeHUD == 3 then
			--Check Positions
				local memPos = t_hudCfg[faceSection]["p"..i..".teammate.pos"]
				local memPosX = 0
				local memPosY = 0
				if memPos and memPos ~= "" then
					memPosX = f_cleanTonumber(memPos[1])
					memPosY = f_cleanTonumber(memPos[2])
				end
			--Check Spacing
				local memSpacing = t_hudCfg[faceSection]["p"..i..".teammate.spacing"]
				local memSpacingX = 0
				local memSpacingsY = 0
				if memSpacing and memSpacing ~= "" then
					memSpacingX = f_cleanTonumber(memSpacing[1])
					memSpacingY = f_cleanTonumber(memSpacing[2])
				end
		--Team Mate BG
			--Check Sprites
				local memBGSpr = t_hudCfg[faceSection]["p"..i..".teammate.bg.spr"]
				local memBGSprGroup = -1
				local memBGSprIndex = -1
				if memBGSpr and memBGSpr ~= "" then
					memBGSprGroup = f_cleanTonumber(memBGSpr[1])
					memBGSprIndex = f_cleanTonumber(memBGSpr[2])
				end
			--Check Offset
				local memBGOffset = t_hudCfg[faceSection]["p"..i..".teammate.bg.offset"]
				local memBGOffsetX = 0
				local memBGOffsetY = 0
				if memBGOffset and memBGOffset ~= "" then
					memBGOffsetX = f_cleanTonumber(memBGOffset[1])
					memBGOffsetY = f_cleanTonumber(memBGOffset[2])
				end
			--Check Scale
				local memBGScale = t_hudCfg[faceSection]["p"..i..".teammate.bg.scale"]
				local memBGScaleX = 1.0
				local memBGScaleY = 1.0
				if memBGScale and memBGScale ~= "" then
					memBGScaleX = memBGScale[1]
					memBGScaleY = memBGScale[2]
				end
			--Check Facing and Vertical Facing
				if t_hudCfg[faceSection]["p"..i..".teammate.bg.facing"] == -1 then memBGScaleX = -memBGScaleX end
				if t_hudCfg[faceSection]["p"..i..".teammate.bg.vfacing"] == -1 then memBGScaleY = -memBGScaleY end
			--Draw Team Mate BG
				local memBGAnim = t_hudCfg[faceSection]["p"..i..".teammate.bg.anim"]
				for mem=1, 3 do
					if memBGAnim and t_lifebarAnims[tonumber(memBGAnim)] then
						local animDat = t_lifebarAnims[tonumber(memBGAnim)]
						animSetPos(animDat, upperHudPosX + memPosX + memBGOffsetX + memSpacingX * (mem - 1), upperHudPosY + memPosY + memBGOffsetY + memSpacingY * (mem - 1))
						animSetScale(animDat, memBGScaleX, memBGScaleY)
						animSetAlpha(animDat, upperHudTransS, upperHudTransD)
						animUpdate(animDat)
						animDraw(animDat)
					else
						f_drawSprPreview(lifebarSffDat,
							memBGSprGroup, memBGSprIndex,
							upperHudPosX + memPosX + memBGOffsetX + memSpacingX * (mem - 1),
							upperHudPosY + memPosY + memBGOffsetY + memSpacingY * (mem - 1),
							memBGScaleX, memBGScaleY,
							upperHudTransS, upperHudTransD
						)
					end
				end
		--Team Mate Faces
			--Check Sprites
				local memFaceSpr = t_hudCfg[faceSection]["p"..i..".teammate.face.spr"]
				local memFaceSprGroup = -1
				local memFaceSprIndex = -1
				if memFaceSpr and memFaceSpr ~= "" then
					memFaceSprGroup = f_cleanTonumber(memFaceSpr[1])
					memFaceSprIndex = f_cleanTonumber(memFaceSpr[2])
				end
			--Check Offset
				local memFaceOffset = t_hudCfg[faceSection]["p"..i..".teammate.face.offset"]
				local memFaceOffsetX = 0
				local memFaceOffsetY = 0
				if memFaceOffset and memFaceOffset ~= "" then
					memFaceOffsetX = f_cleanTonumber(memFaceOffset[1])
					memFaceOffsetY = f_cleanTonumber(memFaceOffset[2])
				end
			--Check Scale
				local memFaceScale = t_hudCfg[faceSection]["p"..i..".teammate.face.scale"]
				local memFaceScaleX = 1.0
				local memFaceScaleY = 1.0
				if memFaceScale and memFaceScale ~= "" then
					memFaceScaleX = memFaceScale[1]
					memFaceScaleY = memFaceScale[2]
				end
			--Check Facing and Vertical Facing
				if t_hudCfg[faceSection]["p"..i..".teammate.face.facing"] == -1 then memFaceScaleX = -memFaceScaleX end
				if t_hudCfg[faceSection]["p"..i..".teammate.face.vfacing"] == -1 then memFaceScaleY = -memFaceScaleY end
			--Draw Team Mate Faces
				for mem=1, 3 do
					drawFacePortrait(pID, --Char ID
						--memFaceSprGroup, memFaceSprIndex,
						upperHudPosX + memPosX + memFaceOffsetX + memSpacingX * (mem - 1),
						upperHudPosY + memPosY + memFaceOffsetY + memSpacingY * (mem - 1),
						memFaceScaleX, memFaceScaleY,
						upperHudTransS, upperHudTransD
					)
				end
		--Team Mate KO
			--Check Sprites
				local memKOSpr = t_hudCfg[faceSection]["p"..i..".teammate.ko.spr"]
				local memKOSprGroup = -1
				local memKOSprIndex = -1
				if memKOSpr and memKOSpr ~= "" then
					memKOSprGroup = f_cleanTonumber(memKOSpr[1])
					memKOSprIndex = f_cleanTonumber(memKOSpr[2])
				end
			--Check Offset
				local memKOOffset = t_hudCfg[faceSection]["p"..i..".teammate.ko.offset"]
				local memKOOffsetX = 0
				local memKOOffsetY = 0
				if memKOOffset and memKOOffset ~= "" then
					memKOOffsetX = f_cleanTonumber(memKOOffset[1])
					memKOOffsetY = f_cleanTonumber(memKOOffset[2])
				end
			--Check Scale
				local memKOScale = t_hudCfg[faceSection]["p"..i..".teammate.ko.scale"]
				local memKOScaleX = 1.0
				local memKOScaleY = 1.0
				if memKOScale and memKOScale ~= "" then
					memKOScaleX = memKOScale[1]
					memKOScaleY = memKOScale[2]
				end
			--Check Facing and Vertical Facing
				if t_hudCfg[faceSection]["p"..i..".teammate.ko.facing"] == -1 then memKOScaleX = -memKOScaleX end
				if t_hudCfg[faceSection]["p"..i..".teammate.ko.vfacing"] == -1 then memKOScaleY = -memKOScaleY end
			--Draw Team Mate KO
				local memKOAnim = t_hudCfg[faceSection]["p"..i..".teammate.ko.anim"]
				for mem=2, 3 do
					if memKOAnim and t_lifebarAnims[tonumber(memKOAnim)] then
						local animDat = t_lifebarAnims[tonumber(memKOAnim)]
						animSetPos(animDat, upperHudPosX + memPosX + memKOOffsetX + memSpacingX * (mem - 1), upperHudPosY + memPosY + memKOOffsetY + memSpacingY * (mem - 1))
						animSetScale(animDat, memKOScaleX, memKOScaleY)
						animSetAlpha(animDat, upperHudTransS, upperHudTransD)
						animUpdate(animDat)
						animDraw(animDat)
					else
						f_drawSprPreview(lifebarSffDat,
							memKOSprGroup, memKOSprIndex,
							upperHudPosX + memPosX + memKOOffsetX + memSpacingX * (mem - 1),
							upperHudPosY + memPosY + memKOOffsetY + memSpacingY * (mem - 1),
							memKOScaleX, memKOScaleY,
							upperHudTransS, upperHudTransD
						)
					end
				end
			end
	--DISPLAY NAMES
		--Check Positions
			local namePos = t_hudCfg[nameSection]["p"..i..".pos"]
			local namePosX = 0
			local namePosY = 0
			if namePos and namePos ~= "" then
				namePosX = f_cleanTonumber(namePos[1])
				namePosY = f_cleanTonumber(namePos[2])
			end
	--BG
		--Check Sprites
			local nameSpr = t_hudCfg[nameSection]["p"..i..".bg.spr"]
			local nameSprGroup = -1
			local nameSprIndex = -1
			if nameSpr and nameSpr ~= "" then
				nameSprGroup = f_cleanTonumber(nameSpr[1])
				nameSprIndex = f_cleanTonumber(nameSpr[2])
			end
		--Draw BG
			local nameAnim = t_hudCfg[nameSection]["p"..i..".bg.anim"]
			if nameAnim and t_lifebarAnims[tonumber(nameAnim)] then
				local animDat = t_lifebarAnims[tonumber(nameAnim)]
				animSetPos(animDat, lowerHudPosX + namePosX, lowerHudPosY + namePosY)
				--animSetScale(animDat, 1.0, 1.0)
				animSetAlpha(animDat, lowerHudTransS, lowerHudTransD)
				animUpdate(animDat)
				animDraw(animDat)
			else
				f_drawSprPreview(lifebarSffDat,
					nameSprGroup, nameSprIndex,
					lowerHudPosX + namePosX,
					lowerHudPosY + namePosY,
					1.0, 1.0,
					lowerHudTransS, lowerHudTransD
				)
			end
	--Text
		--Check Font
			local nameFont = t_hudCfg[nameSection]["p"..i..".name.font"]
		--Check Scale
			local nameScale = t_hudCfg[nameSection]["p"..i..".name.scale"]
			local nameScaleX = 1.0
			local nameScaleY = 1.0
			if nameScale and nameScale ~= "" then
				nameScaleX = nameScale[1]
				nameScaleY = nameScale[2]
			end
		--Draw Display Names
			if nameFont then
				f_drawQuickText(
					txt_lfDisplayName,
					t_lifebarFonts["font"..t_hudCfg[nameSection]["p"..i..".name.font"][1]],
					t_hudCfg[nameSection]["p"..i..".name.font"][2],
					t_hudCfg[nameSection]["p"..i..".name.font"][3] or 1,
					"NAME",
					upperHudPosX + namePosX,
					upperHudPosY + namePosY,
					nameScaleX, nameScaleY,
					upperHudTransS, upperHudTransD
				)
			end
	--POWERBARS
			if i <= 2 then
			--Check Positions
				local powerPos = t_hudCfg.powerbar["p"..i..".pos"]
				local powerPosX = 0
				local powerPosY = 0
				if powerPos and powerPos ~= "" then
					powerPosX = f_cleanTonumber(powerPos[1])
					powerPosY = f_cleanTonumber(powerPos[2])
				end
		--BG0
			--Check Sprites
				local pwBG0Spr = t_hudCfg.powerbar["p"..i..".bg0.spr"] or t_hudCfg.powerbar["p"..i..".bg.spr"]
				local pwBG0SprGroup = -1
				local pwBG0SprIndex = -1
				if pwBG0Spr and pwBG0Spr ~= "" then
					pwBG0SprGroup = f_cleanTonumber(pwBG0Spr[1])
					pwBG0SprIndex = f_cleanTonumber(pwBG0Spr[2])
				end
			--Check Scale
				local pwBG0Scale = t_hudCfg.powerbar["p"..i..".bg0.scale"] or t_hudCfg.powerbar["p"..i..".bg.scale"]
				local pwBG0ScaleX = 1.0
				local pwBG0ScaleY = 1.0
				if pwBG0Scale and pwBG0Scale ~= "" then
					pwBG0ScaleX = pwBG0Scale[1]
					pwBG0ScaleY = pwBG0Scale[2]
				end
			--Check Facing and Vertical Facing
				if t_hudCfg.powerbar["p"..i..".bg0.facing"] == -1 or t_hudCfg.powerbar["p"..i..".bg.facing"] == -1 then pwBG0ScaleX = -pwBG0ScaleX end
				if t_hudCfg.powerbar["p"..i..".bg0.vfacing"] == -1 or t_hudCfg.powerbar["p"..i..".bg.vfacing"] == -1 then pwBG0ScaleY = -pwBG0ScaleY end
			--Draw BG0
				local pwBG0Anim = t_hudCfg.powerbar["p"..i..".bg0.anim"] or t_hudCfg.powerbar["p"..i..".bg.anim"]
				if pwBG0Anim and t_lifebarAnims[tonumber(pwBG0Anim)] then
					local animDat = t_lifebarAnims[tonumber(pwBG0Anim)]
					animSetPos(animDat, lowerHudPosX + powerPosX, lowerHudPosY + powerPosY)
					animSetScale(animDat, pwBG0ScaleX, pwBG0ScaleY)
					animSetAlpha(animDat, lowerHudTransS, lowerHudTransD)
					animUpdate(animDat)
					animDraw(animDat)
				else
					f_drawSprPreview(lifebarSffDat,
						pwBG0SprGroup, pwBG0SprIndex,
						lowerHudPosX + powerPosX,
						lowerHudPosY + powerPosY,
						pwBG0ScaleX, pwBG0ScaleY,
						lowerHudTransS, lowerHudTransD
					)
				end
		--BG1
			--Check Sprites
				local pwBG1Spr = t_hudCfg.powerbar["p"..i..".bg1.spr"]
				local pwBG1SprGroup = -1
				local pwBG1SprIndex = -1
				if pwBG1Spr and pwBG1Spr ~= "" then
					pwBG1SprGroup = f_cleanTonumber(pwBG1Spr[1])
					pwBG1SprIndex = f_cleanTonumber(pwBG1Spr[2])
				end
			--Check Scale
				local pwBG1Scale = t_hudCfg.powerbar["p"..i..".bg1.scale"]
				local pwBG1ScaleX = 1.0
				local pwBG1ScaleY = 1.0
				if pwBG1Scale and pwBG1Scale ~= "" then
					pwBG1ScaleX = pwBG1Scale[1]
					pwBG1ScaleY = pwBG1Scale[2]
				end
			--Check Facing and Vertical Facing
				if t_hudCfg.powerbar["p"..i..".bg1.facing"] == -1 then pwBG1ScaleX = -pwBG1ScaleX end
				if t_hudCfg.powerbar["p"..i..".bg1.vfacing"] == -1 then pwBG1ScaleY = -pwBG1ScaleY end
			--Draw BG1
				local pwBG1Anim = t_hudCfg.powerbar["p"..i..".bg1.anim"]
				if pwBG1Anim and t_lifebarAnims[tonumber(pwBG1Anim)] then
					local animDat = t_lifebarAnims[tonumber(pwBG1Anim)]
					animSetPos(animDat, lowerHudPosX + powerPosX, lowerHudPosY + powerPosY)
					animSetScale(animDat, pwBG1ScaleX, pwBG1ScaleY)
					animSetAlpha(animDat, lowerHudTransS, lowerHudTransD)
					animUpdate(animDat)
					animDraw(animDat)
				else
					f_drawSprPreview(lifebarSffDat,
						pwBG1SprGroup, pwBG1SprIndex,
						lowerHudPosX + powerPosX,
						lowerHudPosY + powerPosY,
						pwBG1ScaleX, pwBG1ScaleY,
						lowerHudTransS, lowerHudTransD
					)
				end
		--BG2
			--Check Sprites
				local pwBG2Spr = t_hudCfg.powerbar["p"..i..".bg2.spr"]
				local pwBG2SprGroup = -1
				local pwBG2SprIndex = -1
				if pwBG2Spr and pwBG2Spr ~= "" then
					pwBG2SprGroup = f_cleanTonumber(pwBG2Spr[1])
					pwBG2SprIndex = f_cleanTonumber(pwBG2Spr[2])
				end
			--Check Scale
				local pwBG2Scale = t_hudCfg.powerbar["p"..i..".bg2.scale"]
				local pwBG2ScaleX = 1.0
				local pwBG2ScaleY = 1.0
				if pwBG2Scale and pwBG2Scale ~= "" then
					pwBG2ScaleX = pwBG2Scale[1]
					pwBG2ScaleY = pwBG2Scale[2]
				end
			--Check Facing and Vertical Facing
				if t_hudCfg.powerbar["p"..i..".bg2.facing"] == -1 then pwBG2ScaleX = -pwBG2ScaleX end
				if t_hudCfg.powerbar["p"..i..".bg2.vfacing"] == -1 then pwBG2ScaleY = -pwBG2ScaleY end
			--Draw BG2
				local pwBG2Anim = t_hudCfg.powerbar["p"..i..".bg2.anim"]
				if pwBG2Anim and t_lifebarAnims[tonumber(pwBG2Anim)] then
					local animDat = t_lifebarAnims[tonumber(pwBG2Anim)]
					animSetPos(animDat, lowerHudPosX + powerPosX, lowerHudPosY + powerPosY)
					animSetScale(animDat, pwBG2ScaleX, pwBG2ScaleY)
					animSetAlpha(animDat, lowerHudTransS, lowerHudTransD)
					animUpdate(animDat)
					animDraw(animDat)
				else
					f_drawSprPreview(lifebarSffDat,
						pwBG2SprGroup, pwBG2SprIndex,
						lowerHudPosX + powerPosX,
						lowerHudPosY + powerPosY,
						pwBG2ScaleX, pwBG2ScaleY,
						lowerHudTransS, lowerHudTransD
					)
				end
		--Mid
			--Check Sprites
				local pwMidSpr = t_hudCfg.powerbar["p"..i..".mid.spr"]
				local pwMidSprGroup = -1
				local pwMidSprIndex = -1
				if pwMidSpr and pwMidSpr ~= "" then
					pwMidSprGroup = f_cleanTonumber(pwMidSpr[1])
					pwMidSprIndex = f_cleanTonumber(pwMidSpr[2])
				end
			--Check Offset
				local pwMidOffset = t_hudCfg.powerbar["p"..i..".mid.offset"]
				local pwMidOffsetX = 0
				local pwMidOffsetY = 0
				if pwMidOffset and pwMidOffset ~= "" then
					pwMidOffsetX = f_cleanTonumber(pwMidOffset[1])
					pwMidOffsetY = f_cleanTonumber(pwMidOffset[2])
				end
			--Check Scale
				local pwMidScale = t_hudCfg.powerbar["p"..i..".mid.scale"]
				local pwMidScaleX = 1.0
				local pwMidScaleY = 1.0
				if pwMidScale and pwMidScale ~= "" then
					pwMidScaleX = pwMidScale[1]
					pwMidScaleY = pwMidScale[2]
				end
			--Check Facing and Vertical Facing
				if t_hudCfg.powerbar["p"..i..".mid.facing"] == -1 then pwMidScaleX = -pwMidScaleX end
				if t_hudCfg.powerbar["p"..i..".mid.vfacing"] == -1 then pwMidScaleY = -pwMidScaleY end
			--Draw Mid
				local pwMidAnim = t_hudCfg.powerbar["p"..i..".mid.anim"]
				if pwMidAnim and t_lifebarAnims[tonumber(pwMidAnim)] then
					local animDat = t_lifebarAnims[tonumber(pwMidAnim)]
					animSetPos(animDat, lowerHudPosX + powerPosX + pwMidOffsetX, lowerHudPosY + powerPosY + pwMidOffsetY)
					animSetScale(animDat, pwMidScaleX, pwMidScaleY)
					animSetAlpha(animDat, lowerHudTransS, lowerHudTransD)
					animUpdate(animDat)
					animDraw(animDat)
				else
					f_drawSprPreview(lifebarSffDat,
						pwMidSprGroup, pwMidSprIndex,
						lowerHudPosX + powerPosX + pwMidOffsetX,
						lowerHudPosY + powerPosY + pwMidOffsetY,
						pwMidScaleX, pwMidScaleY,
						lowerHudTransS, lowerHudTransD
					)
				end
		--Front
			--Check Sprites
				local pwFrontSpr = t_hudCfg.powerbar["p"..i..".front.spr"]
				local pwFrontSprGroup = -1
				local pwFrontSprIndex = -1
				if pwFrontSpr and pwFrontSpr ~= "" then
					pwFrontSprGroup = f_cleanTonumber(pwFrontSpr[1])
					pwFrontSprIndex = f_cleanTonumber(pwFrontSpr[2])
				end
			--Check Offset
				local pwFrontOffset = t_hudCfg.powerbar["p"..i..".front.offset"]
				local pwFrontOffsetX = 0
				local pwFrontOffsetY = 0
				if pwFrontOffset and pwFrontOffset ~= "" then
					pwFrontOffsetX = f_cleanTonumber(pwFrontOffset[1])
					pwFrontOffsetY = f_cleanTonumber(pwFrontOffset[2])
				end
			--Check Scale
				local pwFrontScale = t_hudCfg.powerbar["p"..i..".front.scale"]
				local pwFrontScaleX = 1.0
				local pwFrontScaleY = 1.0
				if pwFrontScale and pwFrontScale ~= "" then
					pwFrontScaleX = pwFrontScale[1]
					pwFrontScaleY = pwFrontScale[2]
				end
			--Check Facing and Vertical Facing
				if t_hudCfg.powerbar["p"..i..".front.facing"] == -1 then pwFrontScaleX = -pwFrontScaleX end
				if t_hudCfg.powerbar["p"..i..".front.vfacing"] == -1 then pwFrontScaleY = -pwFrontScaleY end
			--Draw Front
				local pwFrontAnim = t_hudCfg.powerbar["p"..i..".front.anim"]
				if pwFrontAnim and t_lifebarAnims[tonumber(pwFrontAnim)] then
					local animDat = t_lifebarAnims[tonumber(pwFrontAnim)]
					animSetPos(animDat, lowerHudPosX + powerPosX + pwFrontOffsetX, lowerHudPosY + powerPosY + pwFrontOffsetY)
					animSetScale(animDat, pwFrontScaleX, pwFrontScaleY)
					animSetAlpha(animDat, lowerHudTransS, lowerHudTransD)
					animUpdate(animDat)
					animDraw(animDat)
				else
					f_drawSprPreview(lifebarSffDat,
						pwFrontSprGroup, pwFrontSprIndex,
						lowerHudPosX + powerPosX + pwFrontOffsetX,
						lowerHudPosY + powerPosY + pwFrontOffsetY,
						pwFrontScaleX, pwFrontScaleY,
						lowerHudTransS, lowerHudTransD
					)
				end
		--Power Level Counter
			--Check Font
				local pwCntFont = t_hudCfg.powerbar["p"..i..".counter.font"]
			--Check Offset
				local pwCntOffset = t_hudCfg.powerbar["p"..i..".counter.offset"]
				local pwCntOffsetX = 0
				local pwCntOffsetY = 0
				if pwCntOffset and pwCntOffset ~= "" then
					pwCntOffsetX = f_cleanTonumber(pwCntOffset[1])
					pwCntOffsetY = f_cleanTonumber(pwCntOffset[2])
				end
			--Check Scale
				local pwCntScale = t_hudCfg.powerbar["p"..i..".counter.scale"]
				local pwCntScaleX = 1.0
				local pwCntScaleY = 1.0
				if pwCntScale and pwCntScale ~= "" then
					pwCntScaleX = pwCntScale[1]
					pwCntScaleY = pwCntScale[2]
				end
			--Draw Power Level Counter
				if pwCntFont then
					f_drawQuickText(
						txt_pwCnt,
						t_lifebarFonts["font"..t_hudCfg.powerbar["p"..i..".counter.font"][1]],
						t_hudCfg.powerbar["p"..i..".counter.font"][2],
						t_hudCfg.powerbar["p"..i..".counter.font"][3] or 1,
						"3",
						lowerHudPosX + powerPosX + pwCntOffsetX,
						lowerHudPosY + powerPosY + pwCntOffsetY,
						pwCntScaleX, pwCntScaleY,
						lowerHudTransS, lowerHudTransD
					)
				end
			end
		end
--ROUND TIME
	--Check Positions
		local rTimePos = t_hudCfg.time.pos
		local rTimePosX = 0
		local rTimePosY = 0
		if rTimePos and rTimePos ~= "" then
			rTimePosX = f_cleanTonumber(rTimePos[1])
			rTimePosY = f_cleanTonumber(rTimePos[2])
		end
--BG
	--Check Sprites
		local rTimeSpr = t_hudCfg.time["bg.spr"]
		local rTimeSprGroup = -1
		local rTimeSprIndex = -1
		if rTimeSpr and rTimeSpr ~= "" then
			rTimeSprGroup = f_cleanTonumber(rTimeSpr[1])
			rTimeSprIndex = f_cleanTonumber(rTimeSpr[2])
		end
	--Draw BG
		local rTimeAnim = t_hudCfg.time["bg.anim"]
		if rTimeAnim and t_lifebarAnims[tonumber(rTimeAnim)] then
			local animDat = t_lifebarAnims[tonumber(rTimeAnim)]
			animSetPos(animDat, lowerHudPosX + rTimePosX, lowerHudPosY + rTimePosY)
			--animSetScale(animDat, 1.0, 1.0)
			animSetAlpha(animDat, lowerHudTransS, lowerHudTransD)
			animUpdate(animDat)
			animDraw(animDat)
		else
			f_drawSprPreview(lifebarSffDat,
				rTimeSprGroup, rTimeSprIndex,
				lowerHudPosX + rTimePosX,
				lowerHudPosY + rTimePosY,
				1.0, 1.0,
				lowerHudTransS, lowerHudTransD
			)
		end
--Text
	--Check Font
		local rTimeFont = t_hudCfg.time["counter.font"]
	--Check Offset
		local rTimeOffset = t_hudCfg.time["counter.offset"]
		local rTimeOffsetX = 0
		local rTimeOffsetY = 0
		if rTimeOffset and rTimeOffset ~= "" then
			rTimeOffsetX = f_cleanTonumber(rTimeOffset[1])
			rTimeOffsetY = f_cleanTonumber(rTimeOffset[2])
		end
	--Check Scale
		local rTimeScale = t_hudCfg.time["counter.scale"]
		local rTimeScaleX = 1.0
		local rTimeScaleY = 1.0
		if rTimeScale and rTimeScale ~= "" then
			rTimeScaleX = rTimeScale[1]
			rTimeScaleY = rTimeScale[2]
		end
	--Draw Round Time
		if rTimeFont then
			f_drawQuickText(
				txt_roundTime,
				t_lifebarFonts["font"..t_hudCfg.time["counter.font"][1]],
				t_hudCfg.time["counter.font"][2],
				t_hudCfg.time["counter.font"][3] or 1,
				"99",
				upperHudPosX + rTimePosX + rTimeOffsetX,
				upperHudPosY + rTimePosY + rTimeOffsetY,
				rTimeScaleX, rTimeScaleY,
				upperHudTransS, upperHudTransD
			)
		end
	--Debug
		f_drawQuickText(txt_editSel, font2, 0, 1, "Edit HUD: "..editHUD, 121, 50)
		f_drawQuickText(txt_editSel, font2, 0, 1, "Team Mode: "..teamID, 121, 60)
		f_drawQuickText(txt_editUp, font2, 0, 1, "Upper HUD PosY: "..upperHudPosY, 121, 70)
		f_drawQuickText(txt_editDown, font2, 0, 1, "Lower HUD PosY: "..lowerHudPosY, 121, 80)
	--Draw Input Hints Panel
		drawlifebarEditInputHints(editActive)
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