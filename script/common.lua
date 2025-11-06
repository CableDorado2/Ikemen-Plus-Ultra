--[[
This script allow share vars, functions and data between main menu and match.

If there is something that ONLY will be used during match or main menu, don't add it here.
Add stuff that will be used in both places in order to avoid write it again.

NOTE: Currently, maybe due the use of assert(loadfile("script/common.lua"))() in match.lua script
Every time that a match start, all lua data is reseted, so this script is loaded there
like first time that you start the engine.

The only data that will not be reset is that stored using json or lua file writing method (save folder).
However, if a data table/file is created here, keep in mind that it will be regenerated with the default values.
Therefore, it is recommended to "encapsulate" that you only want to create when engine start in a function,
to call and write in them outside of the match, and then only read them inside the match.
]]
--return file content
function f_fileRead(path, mode)
	local file = io.open(path, mode or 'r')
	if file == nil then --File doesn't exist
		return
	end
	local str = file:read("*all")
	file:close()
	return str
end

--write to file
function f_fileWrite(path, str, mode)
	if str == nil then
		return
	end
	local file = io.open(path, mode or 'w+')
	if file == nil then --File doesn't exist
		return
	end
	file:write(str)
	file:close()
end
--;===========================================================
--; LIBRARY DEFINITION
--;===========================================================
--Configure search paths for shared libraries (c-extensions)
package.cpath = "./lib/lua/?.dll;" ..
				"./lib/lua/luasocket/?.dll;" ..
				"./lib/lua/luasocket/socket/?.dll;" ..
				"./lib/lua/luasocket/mime/?.dll;"

--Configure search paths for Lua libraries
package.path = "./?.lua;" ..
				"./lib/lua/?.lua;" ..
				"./lib/lua/cURL/?.lua;" ..
				"./lib/lua/htmlparser/?.lua;" ..
				"./lib/lua/luasocket/?.lua;"
				
--Load LuaSocket libraries
if getOS() ~= "windowsXP" then --Not supported in Windows XP
socket = require("socket")
http = require("socket.http")
end
ltn12 = require("ltn12")
htmlparser = require("htmlparser") --Load htmlparser library
curl = require("cURL") --Load Lua-cURL library (https requests are not supported yet in Windows XP)
lfs = require("lfs") --Load LuaFileSystem library
ffi = require("ffi") --Load Foreign Function Interface library
--Load JSON library
lpeg = require("lpeg")
json = require("dkjson")
if lpeg then json = json.use_lpeg() end --Change json to optimized mode using lpeg
--;===========================================================
--; DATA DEFINITION
--;===========================================================
data = require("save.data") --Create global space variable (accessing variables between modules)

--Set Save Path Variables
saveCoreCfgPath = "save/config.ssz"
saveNetCoreCfgPath = "save/configNet.ssz"
saveCfgPath = "save/data_sav.lua"
saveNetCfgPath = "save/data_netsav.lua"
saveHostRoomPath = "save/host_rooms.json"
saveTempPath = "save/temp_sav.lua"
saveTrainingPath = "save/training_sav.lua"
saveAchievementsPath = "save/achievements_sav.lua"
saveStatsPath = "save/stats_sav.json"
saveP1Path = "save/p1_sav.json"
saveP2Path = "save/p2_sav.json"
saveAbyssPath = "save/abyss_sav.json"
saveTourneyPath = "save/tourney_sav.lua"
--;===========================================================
--; DATA LOADING
--;===========================================================
--Load saved variables
assert(loadfile(saveCfgPath))() --assert loadfile, allows load the content stored in script said. The script must not have any module load.
assert(loadfile(saveTrainingPath))() --training data
assert(loadfile(saveTourneyPath))() --tournament data
assert(loadfile(saveTempPath))() --temp data

--Data loading from temp_sav.lua
local tempFile = io.open(saveTempPath,"r")
s_tempdataLUA = tempFile:read("*all")
tempFile:close()

--Data loading from tourney_sav.lua
local tourneyFile = io.open(saveTourneyPath,"r")
s_tourneydataLUA = tourneyFile:read("*all")
tourneyFile:close()

--Data loading from config.ssz
local file = io.open(saveCoreCfgPath,"r")
s_configSSZ = file:read("*all")
file:close()

--Data loading from config.json
--config = json.decode(f_fileRead(saveCfgPath))

--Data loading from host_rooms.json
host_rooms = json.decode(f_fileRead(saveHostRoomPath))

--Data loading from stats_sav.json
stats = json.decode(f_fileRead(saveStatsPath))

--Data loading from p1_sav.json and p2_sav.json
p1Dat = json.decode(f_fileRead(saveP1Path))
p2Dat = json.decode(f_fileRead(saveP2Path))

--Data loading from abyss_sav.json
abyssDat = json.decode(f_fileRead(saveAbyssPath))
--;===========================================================
--; COMMON FUNCTIONS DEFINITION
--;===========================================================
--Constants/Standards
gameTick = 20
gameTime = (os.clock()/1000)

--shortcut to play a video file with several parameters
function playVideo(file, audiotrack, volume)
	local file = file or ""
	local audiotrack = audiotrack or 1
	local volume = volume or getVideoVolume()
	loadVideo(file, screenshotPath, volume, audiotrack)
	commandBufReset(p1Cmd)
	commandBufReset(p2Cmd)
end

--shortcut for render new TTF text with several parameters (WIP)
function drawTextTTF(font, align, text, x, y, scaleX, scaleY, R, G, B, alpha)
	scaleX = scaleX or 1.0
	scaleY = scaleY or 1.0
	R = R or 255
	G = G or 255
	B = B or 255
	alpha = alpha or 255
	drawTTF(font, align, text, x, y, scaleX, scaleY, R, G, B, alpha)
end

--shortcut for creating new text with minimal parameters (for width calculation)
function createTextImgLite(font, text, scaleX, scaleY)
	local textName = textImgNew()
	textImgSetFont(textName, font)
	textImgSetText(textName, text)
	scaleX = scaleX or 1
	scaleY = scaleY or 1
	textImgSetScale(textName, scaleX, scaleY)
	return textName
end

--shortcut for creating new text with several parameters
function createTextImg(font, bank, aline, text, x, y, scaleX, scaleY, alphaS, alphaD)
	local textName = textImgNew()
	textImgSetFont(textName, font)
	textImgSetBank(textName, bank)
	textImgSetAlign(textName, aline)
	textImgSetText(textName, text)
	textImgSetPos(textName, x, y)
	scaleX = scaleX or 1
	scaleY = scaleY or 1
	textImgSetScale(textName, scaleX, scaleY)
	alphaS = alphaS or 255
	alphaD = alphaD or 0
	textImgSetAlpha(textName, alphaS, alphaD)
	return textName
end

--textImgDraw at specified coordinates
function textImgPosDraw(textName, x, y)
	textImgSetPos(textName, x, y)
	textImgDraw(textName)
end

--textImgDraw at specified coordinates + Scale
function textImgScalePosDraw(textName, x, y, scaleX, scaleY)
	textImgSetPos(textName, x, y)
	scaleX = scaleX or 1
	scaleY = scaleY or 1
	textImgSetScale(textName, scaleX, scaleY)
	textImgDraw(textName)
end

--shortcut for updating text with several parameters
function f_updateTextImg(textName, font, bank, aline, text, x, y, scaleX, scaleY, alphaS, alphaD)
	textImgSetFont(textName, font)
	textImgSetBank(textName, bank)
	textImgSetAlign(textName, aline)
	textImgSetText(textName, text)
	textImgSetPos(textName, x, y)
	scaleX = scaleX or 1
	scaleY = scaleY or 1
	textImgSetScale(textName, scaleX, scaleY)
	alphaS = alphaS or 255
	alphaD = alphaD or 0
	textImgSetAlpha(textName, alphaS, alphaD)
	return textName
end

--shortcut for updating text velocity
function f_textVelocity(textName, addX, addY)
	textImgAddPos(textName, addX, addY)
	textImgDraw(textName)
	return textName
end

--shortcut for draw new text with all parameters
function f_drawQuickText(textName, font, bank, aline, text, x, y, scaleX, scaleY, alphaS, alphaD)
	local textName = textImgNew()
	textImgSetFont(textName, font)
	textImgSetBank(textName, bank)
	textImgSetAlign(textName, aline)
	textImgSetText(textName, text)
	textImgSetPos(textName, x, y)
	scaleX = scaleX or 1
	scaleY = scaleY or 1
	textImgSetScale(textName, scaleX, scaleY)
	alphaS = alphaS or 255
	alphaD = alphaD or 0
	textImgSetAlpha(textName, alphaS, alphaD)
	textImgDraw(textName)
	return textName
end

--- Draw string letter by letter + wrap lines.
-- @textName: text data
-- @str: string (text you want to draw)
-- @counter: external counter (values should be increased each frame by 1 starting from 1)
-- @x: first line X position
-- @y: first line Y position
-- @spacing: spacing between lines (rendering Y position increasement for each line)
-- @delay (optional): ticks (frames) delay between each letter is rendered, defaults to 0 (all text rendered immediately)
-- @limit (optional): maximum line length (string wraps when reached), if omitted line wraps only if string contains '\n'
-- @maxLimit (optional): maximum number of lines allowed before truncating
function f_textRender(textName, str, counter, x, y, spacing, delay, limit, maxlimit)
	local delay = delay or 0
	local limit = limit or -1
	local maxLimit = maxlimit or 0 --0= No Max Limits
	str = tostring(str)
--Process line breaks and wrapping if necessary
	if limit == -1 then
		str = str:gsub('\\n', '\n')
	else
		str = str:gsub('%s*\\n%s*', ' ')
		if math.floor(#str / limit) + 1 > 1 then
			str = f_wrap(str, limit, indent, indent1)
		end
	end
--Determine how much text to display
	local subEnd = math.floor(#str - (#str - counter/delay))
	local t = {}
	for line in str:gmatch('([^\r\n]*)[\r\n]?') do
		t[#t+1] = line
	end
	t[#t] = nil --get rid of the last blank line
--If maxLimit > 0 and we have exceeded that limit, replace the last line with "..."
	if maxLimit > 0 and #t > maxLimit then
		for i=1, maxLimit - 1 do
		--draw the first lines normally
			local line = t[i]
			if subEnd < #str then
				local length = #line
				local totalLength = 0
				for j=1, i-1 do
					totalLength = totalLength + #t[j] + 1
				end
				if subEnd < totalLength + length then
					line = line:sub(1, subEnd - totalLength)
				end
			end
			textImgSetText(textName, line)
			textImgSetPos(textName, x, y + spacing * (i - 1))
			textImgDraw(textName)
		end
	--replace the last allowed line with "..."
		textImgSetText(textName, "...")
		textImgSetPos(textName, x, y + spacing * (maxLimit - 1))
		textImgDraw(textName)
		--return lengthCnt
	else
		local lengthCnt = 0
		for i=1, #t do
			if subEnd < #str then
				local length = #t[i]
				if i > 1 and i <= #t then
					length = length + 1
				end
				lengthCnt = lengthCnt + length
				if subEnd < lengthCnt then
					t[i] = t[i]:sub(0, subEnd - lengthCnt)
				end
			end
			textImgSetText(textName, t[i])
			textImgSetPos(textName, x, y + spacing * (i - 1))
			textImgDraw(textName)
		end
		return lengthCnt --Usefull for Visual Novel Feature
	end
end

--shortcut for draw text for character select
function f_drawSelectName(textName, t, x, y, scaleX, scaleY, color)
	scaleX = scaleX or 0.8
	scaleY = scaleY or 0.8
	color = color or 5
	textImgSetText(textName, f_getName(t.cel))
	textImgSetPos(textName, x, y)
	textImgSetScale(textName, scaleX, scaleY)
	textImgSetBank(textName, color)
	textImgDraw(textName)
	x = x
	y = y
	return x, y
end

--shortcut for draw player name texts for character select functions in list format
function f_drawNameList(textName, bank, t, x, y, spacingX, spacingY, rowUnique, bankUnique, scaleX, scaleY)
	for i=1, #t do
		textImgSetText(textName, f_getName(t[i].cel)) --t[i].cel get all names of table inserted
		textImgSetPos(textName, x, y)
		scaleX = scaleX or 0.8
		scaleY = scaleY or 0.8
		textImgSetScale(textName, scaleX, scaleY)
		if rowUnique ~= nil then
			if i == rowUnique then
				textImgSetBank(textName, bank) --Color when cursor is over text
			else
				textImgSetBank(textName, bankUnique) --Color of text when cursor is not over text
			end
		else
			textImgSetBank(textName, bank)
		end
		textImgDraw(textName)
		x = x + spacingX
		y = y + spacingY
	end
	return x, y
end

--Get the correct index in the circular list
function getItemIndex(t, itemNo, offset)
	local index = itemNo + offset
	local total = #t
	if index < 1 then
		index = total + index
	elseif index > total then
		index = index - total
	end
	return index
end

--Draw an item based on its offset from itemNo of table
function drawMenuItem(t, itemNo, offset, font, bank, align, x, y)
	local index = getItemIndex(t, itemNo, offset)
	local item = t[index]
	local xOffset = x
	local yOffset = y
	textImgDraw(f_updateTextImg(item.id, font, bank, align, item.text, xOffset, yOffset))
end

--animDraw at specified coordinates
function animPosDraw(animName, x, y)
	animSetPos(animName, x, y)
	animUpdate(animName)
	animDraw(animName)
end

--[[shortcut for updating scale
function animScaleDraw(animName, x, y)
	animSetScale(animName, x, y)
	animUpdate(animName)
	animDraw(animName)
end
]]

--shortcut for updating anim velocity
function f_animVelocity(animName, addX, addY)
	animAddPos(animName, addX, addY)
	animUpdate(animName)
	return animName
end

--shortcut for draw sprites quickly
function f_drawQuickSpr(animName, x, y, scaleX, scaleY, alphaS, alphaD)
	if animName ~= nil then
		scaleX = scaleX or 1
		scaleY = scaleY or 1
		alphaS = alphaS or 255
		alphaD = alphaD or 0
		animSetScale(animName, scaleX, scaleY)
		animSetAlpha(animName, alphaS, alphaD)
		animSetPos(animName, x, y)
		animUpdate(animName)
		animDraw(animName)
		return true
	end
	return false
end

--shortcut for draw sprites with trans values quickly
function f_quickAlpha(animName, alphaS, alphaD)
	if animName ~= nil then
		alphaS = alphaS or 255
		alphaD = alphaD or 0
		animSetAlpha(animName, alphaS, alphaD)
		animUpdate(animName)
		animDraw(animName)
		return true
	end
	return false
end

--shortcut for draw sprites preview in menus
function f_drawSprPreview(sffDat, group, index, posX, posY, scaleX, scaleY, alphaS, alphaD)
	if sffDat ~= nil then
		local scaleX = scaleX or 1
		local scaleY = scaleY or 1
		local alphaS = alphaS or 255
		local alphaD = alphaD or 0
		local anim = group..','..index..', 0,0, 0'
		anim = animNew(sffDat, anim)
		animSetAlpha(anim, alphaS, alphaD)
		animSetScale(anim, scaleX, scaleY)
		animSetPos(anim, posX, posY)
		animUpdate(anim)
		animDraw(anim)
		return true
	else
		return false
	end
end

--shortcut for draw character animations
function f_drawCharAnim(t, data, x, y, update, scaleX, scaleY, alphaS, alphaD)
	if t ~= nil and t[data] ~= nil then
		scaleX = scaleX or 1
		scaleX = t.xscale*scaleX --Because some characters have different scales
		scaleY = scaleY or 1
		scaleY = t.yscale*scaleY
		alphaS = alphaS or 255
		alphaD = alphaD or 0
		animSetScale(t[data], scaleX, scaleY)
		animSetAlpha(t[data], alphaS, alphaD)
		animSetPos(t[data], x, y)
		animDraw(t[data])
		if update then
			animUpdate(t[data])
		end
		return true
	end
	return false
end

--generate anim from table
function f_animFromTable(t, sff, x, y, scaleX, scaleY, facing, infFrame, alphaS, alphaD)
	infFrame = infFrame or 1
	scaleX = scaleX or 1
	scaleY = scaleY or 1
	facing = facing or 0
	alphaS = alphaS or 255
	alphaD = alphaD or 0
	local anim = ''
	local length = 0
	for i=1, #t do
		anim = anim .. t[i] .. ', ' .. facing .. '\n'
		if not t[i]:match('loopstart') then
			local tmp = t[i]:gsub('^.-([^,%s]+)$','%1')
			if tonumber(tmp) == -1 then
				tmp = infFrame
			end
			length = length + tmp
		end
	end
	local id = animNew(sff, anim)
	animAddPos(id, x, y)
	animSetScale(id, scaleX, scaleY)
	animSetAlpha(id, alphaS, alphaD)
	animUpdate(id)
	return id, tonumber(length)
end

--generate fading animation
function f_fadeAnim(ticks, fadeType, color, sff)
	local anim = ''
	if color == 'white' then
		if fadeType == 'fadeout' then
			for i=1, ticks do
				anim = anim .. '0,1, 0,0, 1, 0, AS' .. math.floor(256/ticks*i) .. 'D256\n'
			end
			anim = anim .. '0,1, 0,0, -1, 0, AS256D256'
		else --fadein
			for i=ticks, 1, -1 do
				anim = anim .. '0,1, 0,0, 1, 0, AS' .. math.floor(256/ticks*i) .. 'D256\n'
			end
			anim = anim .. '0,1, 0,0, -1, 0, AS0D256'
		end
	else --black
		if fadeType == 'fadeout' then
			for i=ticks, 1, -1 do
				anim = anim .. '0,0, 0,0, 1, 0, AS256D' .. math.floor(256/ticks*i) .. '\n'
			end
			anim = anim .. '0,0, 0,0, -1, 0, AS256D0'
		else --fadein
			for i=1, ticks do
				anim = anim .. '0,0, 0,0, 1, 0, AS256D' .. math.floor(256/ticks*i) .. '\n'
			end
			anim = anim .. '0,0, 0,0, -1, 0, AS256D256'
		end
	end
	anim = animNew(sff, anim)
	animUpdate(anim)
	return anim, ticks
end

--dynamically adjusts alpha blending each time called based on specified values
alpha1cur = 0
alpha2cur = 0
alpha1add = true
alpha2add = true
function f_dynamicAlpha(animName, r1min, r1max, r1step, r2min, r2max, r2step)
	if r1step == 0 then alpha1cur = r1max end
	if alpha1cur < r1max and alpha1add then
		alpha1cur = alpha1cur + r1step
		if alpha1cur >= r1max then
			alpha1add = false
		end
	elseif alpha1cur > r1min and not alpha1add then
		alpha1cur = alpha1cur - r1step
		if alpha1cur <= r1min then
			alpha1add = true
		end
	end
	if r2step == 0 then alpha2cur = r2max end
	if alpha2cur < r2max and alpha2add then
		alpha2cur = alpha2cur + r2step
		if alpha2cur >= r2max then
			alpha2add = false
		end
	elseif alpha2cur > r2min and not alpha2add then
		alpha2cur = alpha2cur - r2step
		if alpha2cur <= r2min then
			alpha2add = true
		end
	end
	animSetAlpha(animName, alpha1cur, alpha2cur)
end

--Convert number to name and get rid of the ""
function f_getName(cel)
	local tmp = getCharName(cel)
	tmp = tmp:gsub('^["%s]*(.-)["%s]*$', '%1')
	return tmp
end

--randomizes table content
function f_shuffleTable(t)
    local rand = math.random 
    assert(t, "f_shuffleTable() expected a table, got nil")
    local iterations = #t
    local j
    for i = iterations, 2, -1 do
        j = rand(i)
        t[i], t[j] = t[j], t[i]
    end
end

--prints "t" table content into "toFile" file
function f_printTable(t, toFile)
	local toFile = toFile or 'save/debug/table_print.log'
	local txt = ''
	local print_t_cache = {}
	local function sub_print_t(t, indent)
		if print_t_cache[tostring(t)] then
			txt = txt .. indent .. '*' .. tostring(t) .. '\n'
		else
			print_t_cache[tostring(t)] = true
			if type(t) == 'table' then
				for pos, val in pairs(t) do
					if type(val) == 'table' then
						txt = txt .. indent .. '[' .. pos .. '] => ' .. tostring(t) .. ' {' .. '\n'
						sub_print_t(val, indent .. string.rep(' ', string.len(pos)+8))
						txt = txt .. indent .. string.rep(' ', string.len(pos)+6) .. '}' .. '\n'
					elseif type(val) == 'string' then
						txt = txt .. indent .. '[' .. pos .. '] => "' .. val .. '"' .. '\n'
					else
						txt = txt .. indent .. '[' .. pos .. '] => ' .. tostring(val) ..'\n'
					end
				end
			else
				txt = txt .. indent .. tostring(t) .. '\n'
			end
		end
	end
	if type(t) == 'table' then
		txt = txt .. tostring(t) .. ' {' .. '\n'
		sub_print_t(t, '  ')
		txt = txt .. '}' .. '\n'
	else
		sub_print_t(t, '  ')
	end
	local file = io.open(toFile,"w+")
	if file == nil then return end
	file:write(txt)
	file:close()
end

--prints "v" variable into "toFile" file
function f_printVar(v, toFile)
	local toFile = toFile or 'save/debug/var_print.log'
	local file = io.open(toFile,"w+")
	file:write(v)
	file:close()
end

--remove duplicated string pattern
function f_uniq(str, pattern, subpattern)
	local out = {}
	for s in str:gmatch(pattern) do
		local s2 = s:match(subpattern)
		if not f_contains(out, s2) then out[#out+1] = s end
	end
	return table.concat(out)
end

--checks if a value "val" is present in a table "t"
function f_contains(t, val) --This is for strings
	for k,v in pairs(t) do
		--if v == val then
		if v:match(val) then
			return true
		end
	end
	return false
end

function f_tableContains(t, val) --This is for general purposes
	for k,v in ipairs(t) do
		if v == val then
			return true
		end
	end
	return false
end

function f_delRepeated(t)
	local t_new = {}
	local t_checked = {}
	for k, v in ipairs(t) do
		if not t_checked[v] then
			table.insert(t_new, v)
				t_checked[v] = true
			end
		end
	return t_new --get new table without repeated items
end

function f_indexOf(t, item)
	for index, val in ipairs(t) do
		if val == item then
			return index
		end
	end
	return nil
end

--- Wrap a long string.
-- source: http://lua-users.org/wiki/StringRecipes
-- @str: string to wrap
-- @limit: maximum line length
-- @indent: regular indentation
-- @indent1: indentation of first line
function f_wrap(str, limit, indent, indent1)
	indent = indent or ''
	indent1 = indent1 or indent
	limit = limit or 72
	local here = 1-#indent1
	return indent1 .. str:gsub("(%s+)()(%S+)()",
	function(sp, st, word, fi)
		if fi - here > limit then
			here = st - #indent
			return '\n' .. indent .. word
		end
	end)
end

--return sorted and capped table
function f_formattedTable(t, append, f, size)
	local t = t or {}
	local size = size or -1
	local t_tmp = {}
	local tmp = 0
	table.insert(t, append)
	for _, v in main.f_sortKeys(t, f) do
		tmp = tmp + 1
		table.insert(t_tmp, v)
		if tmp == size then
			break
		end
	end
	return t_tmp
end

--Convert DEF string to table (each line = next item; %i, %s swapped with variable values)
function f_extractText(txt, v1, v2, v3, v4)
	local t = {v1 or '', v2 or '', v3 or '', v4 or ''}
	local tmp = ''
	txt = txt:gsub('%%[is]', '%%')
	for i, c in ipairs(strsplit('%%', txt)) do --split string using "%" delimiter
		if t[i] == '' then
			c = c:gsub('%s$', '')
		end
		tmp = tmp .. c .. t[i]
	end
--store each line in different row
	t = {}
	for i, c in ipairs(strsplit('\n', tmp)) do --split string using "\n" delimiter
		t[i] = c
	end
	if #t == 0 then
		t[1] = tmp
	end
	return t
end

--Convert TXT file to table
function f_txtLoad(path)
	if path ~= nil then
		local file = io.open(path,"r") --Open .txt file refer in path var in reading mode
		local t = {} --Create a table to store .txt file information
		local content = file:read("*all") --Read file content line by line
		file:close() --Close .txt file
		t = f_extractText(content) --Extract Text stored in the file
		return t --return a table with text extracted
	else
		return nil
	end
end

--Read/Writte Lua Data
function f_strSub(str, t)
	local txt = ''
	for row, val in pairs(t) do
		if type(val) == 'string' then
			val = '"' .. tostring(val) .. '"' --OLD: val = "'" .. tostring(val) .. "'"
		elseif type(var) == 'number' then
			val = var
		else
			val = tostring(val)
		end
		str = str:gsub(row .. '%s*=%s*[^\n]+', row .. ' = ' .. val)
		txt = txt .. row .. ' = ' .. val .. '\n'
	end
	return str, txt
end

--Convert table to Lua string
function tableToString(tbl, indent)
	indent = indent or ""
	local s = "{\n"
	local indent2 = indent .. "  "
	for k, v in pairs(tbl) do
		local keyStr
		if type(k) == "string" then
			keyStr = "[" .. string.format("%q", k) .. "]"
		else
			keyStr = "[" .. k .. "]"
		end
		local valueStr
		if type(v) == "table" then
			valueStr = tableToString(v, indent2)
		elseif type(v) == "string" then
			valueStr = string.format("%q", v)
		else
			valueStr = tostring(v)
		end
		s = s .. indent2 .. keyStr .. " = " .. valueStr .. ",\n"
	end
	s = s .. indent .. "}"
	return s
end

--delete a directory
function deldir(dir)
	for file in lfs.dir(dir) do
		if file ~= "." and file ~= ".." then
			local file_path = dir..'/'..file --Create the full path of the file or folder.
			local mode = lfs.attributes(file_path, 'mode') --Gets the mode of the file (whether it is a file or a directory).
			if mode ~= nil then
			--If mode is 'file', the file is deleted.
				if mode == 'file' then
					os.remove(file_path)
			--If mode is 'directory', deldir function is called recursively to remove its contents.
				elseif mode == 'directory' then
					deldir(file_path)
				end
			end
		end
	end
--Once all files and subdirectories have been deleted, the directory itself is deleted.
	lfs.rmdir(dir)
end

function strsplit(delimiter, text)
	local list = {}
	local pos = 1
	if string.find('', delimiter, 1) then
		if string.len(text) == 0 then
			table.insert(list, text)
		else
			for i = 1, string.len(text) do
				table.insert(list, string.sub(text, i, i))
			end
		end
	else
		while true do
			local first, last = string.find(text, delimiter, pos)
			if first then
				table.insert(list, string.sub(text, pos, first-1))
				pos = last+1
			else
				table.insert(list, string.sub(text, pos))
				break
			end
		end
	end
	return list
end

function strtrim(s)
	return string.match(s,'^()%s*$') and '' or string.match(s,'^%s*(.*%S)')
end

function map(func, table)
	local dest = {}
	for k, v in pairs(table) do
		dest[k] = func(v)
	end
	return dest
end

function f_boolToNum(value)
	return value and 1 or 0
end

function f_minMax(v,mn,mx)
	return math.max(mn,math.min(mx,v))
end

--Function to copy a table recursively
function f_deepcopy(orig)
	local orig_type = type(orig)
	local copy
--For table type data
	if orig_type == 'table' then
		copy = {}
		for key, value in pairs(orig) do
			copy[key] = f_deepcopy(value)
		end
	else
--For data of primitive types (numbers, strings, booleans, etc.)
		copy = orig
	end
	return copy
end

--Function that receives an input table and copies it to another table
--Use this function to copy data without shared references between Source File and Target File (This is to avoid that when updates the target data, source data also get that update)
function f_transferData(sourceTable, targetTable)
--Clean the destination table if necessary
	for k in pairs(targetTable) do
		targetTable[k] = nil
	end
--Copy Data
	for key, value in pairs(sourceTable) do
		targetTable[key] = f_deepcopy(value)
	end
end

--Start functions stored in strings
function f_gotoFunction(func)
	if not func or not func.gotomenu then return end --Return in case func does not exist or does not have "gotomenu"
	local f, err = load(func.gotomenu)
	if f then
		f() --Call the function
	else
		return --Error when loading function
	end
end

--;===========================================================
--; INPUT STUFF
--;===========================================================
inputdia = inputDialogNew()
data.p1In = 1
data.p2In = 2 --Activate Player 2 Control in Menus

function setCommand(c)
--Neutral/One Touch
	commandAdd(c, 'u', '$U') --UP
	commandAdd(c, 'd', '$D') --DOWN
	commandAdd(c, 'l', '$B') --LEFT
	commandAdd(c, 'r', '$F') --RIGHT
	commandAdd(c, 'a', 'a') --A
	commandAdd(c, 'b', 'b') --B
	commandAdd(c, 'c', 'c') --C
	commandAdd(c, 'x', 'x') --X
	commandAdd(c, 'y', 'y') --Y
	commandAdd(c, 'z', 'z') --Z
	commandAdd(c, 'q', 'q') --LT/FUNCTION 1
	commandAdd(c, 'w', 'w') --RT/FUNCTION 2
	commandAdd(c, 'e', 'e') --SELECT/RETURN
	commandAdd(c, 's', 's') --START/CONFIRM
	commandAdd(c, 'ul', '$UB') --UP+LEFT
	commandAdd(c, 'ur', '$UF') --UP+RIGHT
	commandAdd(c, 'dl', '$DB') --DOWN+LEFT
	commandAdd(c, 'dr', '$DF') --DOWN+RIGHT
--Holds
	commandAdd(c, 'holdu', '/U') --Hold UP
	commandAdd(c, 'holdd', '/D') --Hold DOWN
	commandAdd(c, 'holdl', '/B') --Hold LEFT
	commandAdd(c, 'holdr', '/F') --Hold RIGHT
	commandAdd(c, 'holda', '/a') --Hold A
	commandAdd(c, 'holdb', '/b') --Hold B
	commandAdd(c, 'holdc', '/c') --Hold C
	commandAdd(c, 'holdx', '/x') --Hold X
	commandAdd(c, 'holdy', '/y') --Hold Y
	commandAdd(c, 'holdz', '/z') --Hold Z
	commandAdd(c, 'holdq', '/q') --Hold LT
	commandAdd(c, 'holdw', '/w') --Hold RT
	commandAdd(c, 'holde', '/e') --Hold SELECT
	commandAdd(c, 'holds', '/s') --Hold START
	commandAdd(c, 'holdul', '/UB') --Hold UP+LEFT
	commandAdd(c, 'holdur', '/UF') --Hold UP+RIGHT
	commandAdd(c, 'holddl', '/DB') --Hold DOWN+LEFT
	commandAdd(c, 'holddr', '/DF') --Hold DOWN+RIGHT
--Releases
	commandAdd(c, 'relu', '~U') --Release UP
	commandAdd(c, 'reld', '~D') --Release DOWN
	commandAdd(c, 'rell', '~B') --Release LEFT
	commandAdd(c, 'relr', '~F') --Release RIGHT
	commandAdd(c, 'rela', '~a') --Release A
	commandAdd(c, 'relb', '~b') --Release B
	commandAdd(c, 'relc', '~c') --Release C
	commandAdd(c, 'relx', '~x') --Release X
	commandAdd(c, 'rely', '~y') --Release Y
	commandAdd(c, 'relz', '~z') --Release Z
	commandAdd(c, 'relq', '~q') --Release LT
	commandAdd(c, 'relw', '~w') --Release RT
	commandAdd(c, 'rele', '~e') --Release SELECT
	commandAdd(c, 'rels', '~s') --Release START
	commandAdd(c, 'relul', '~UB') --Release UP+LEFT
	commandAdd(c, 'relur', '~UF') --Release UP+RIGHT
	commandAdd(c, 'reldl', '~DB') --Release DOWN+LEFT
	commandAdd(c, 'reldr', '~DF') --Release DOWN+RIGHT
--Mixs
	commandAdd(c, 'su', '/s, U')
	commandAdd(c, 'sd', '/s, D')
end

p1Cmd = commandNew()
setCommand(p1Cmd)

p2Cmd = commandNew()
setCommand(p2Cmd)

setSysCtrl(10) --Load Menu Controls from config.ssz

--Reset Menu Controls
function f_resetMenuInputs()
resetRemapInput()
data.p1In = 1
data.p2In = 2
end

inConfig = false
function cmdInput()
	--f_discordRealTimeUpdate()
	commandInput(p1Cmd, data.p1In)
	commandInput(p2Cmd, data.p2In)
--Refresh/Reload Screenpack file in Real Time
	if f5Key() and data.debugMode then
		assert(loadfile("script/screenpack.lua"))()
		f_loadLuaMods() --Reload External Lua Modules
		commandBufReset(p1Cmd)
		commandBufReset(p2Cmd)
	end
--Take Screenshot in any menu (if you have control)
	if printscreenKey() and not inMatch then
		f_screenShot()
		commandBufReset(p1Cmd)
		commandBufReset(p2Cmd)
	end
	if data.attractMode and not inMatch and not netplay() then --In-Match Keys are managed via match.lua hotkeys
	--ATTRACT TEST MENU/CONFIGURATION
		if nineKey() and not inConfig then
			f_attractCfgMenu()
	--RESET ENGINE
		elseif zeroKey() then
			commandBufReset(p1Cmd)
			commandBufReset(p2Cmd)
			f_resetEngine()
	--INSERT COIN
		elseif (oneKey() or twoKey()) and not inConfig then
			f_addCoin()
			commandBufReset(p1Cmd)
			commandBufReset(p2Cmd)
		end
	end
end

--returns value depending on button pressed (a = 1; hold start + a = 7 etc.)
function btnPalNo(cmd, start)
	local s = 0
	local start = start or false --Allow Start Button confirm in menus like pal buttons
	if commandGetState(cmd, 'holds') then s = 6 end
	if commandGetState(cmd, 'a') or (commandGetState(cmd, 's') and start) then return 1 + s end
	if commandGetState(cmd, 'b') then return 2 + s end
	if commandGetState(cmd, 'c') then return 3 + s end
	if commandGetState(cmd, 'x') then return 4 + s end
	if commandGetState(cmd, 'y') then return 5 + s end
	if commandGetState(cmd, 'z') then return 6 + s end
	return 0
end

--returns string depending on button pressed
function getButton(cmd)
	if commandGetState(cmd, 'u') then return "U" end
	if commandGetState(cmd, 'd') then return "D" end
	if commandGetState(cmd, 'l') then return "L" end
	if commandGetState(cmd, 'r') then return "R" end
	if commandGetState(cmd, 'a') then return "A" end
	if commandGetState(cmd, 'b') then return "B" end
	if commandGetState(cmd, 'c') then return "C" end
	if commandGetState(cmd, 'x') then return "X" end
	if commandGetState(cmd, 'y') then return "Y" end
	if commandGetState(cmd, 'z') then return "Z" end
	if commandGetState(cmd, 's') then return "S" end
	if commandGetState(cmd, 'q') then return "LT" end
	if commandGetState(cmd, 'w') then return "RT" end
	if commandGetState(cmd, 'e') then return "SELECT" end
	return ""
end

--SDLKey Keyboard conversion table
t_sdlInputConvert = {
	{num = '4', text = 'a'},
	{num = '5', text = 'b'},
	{num = '6', text = 'c'},
	{num = '7', text = 'd'},
	{num = '8', text = 'e'},
	{num = '9', text = 'f'},
	{num = '10', text = 'g'},
	{num = '11', text = 'h'},
	{num = '12', text = 'i'},
	{num = '13', text = 'j'},
	{num = '14', text = 'k'},
	{num = '15', text = 'l'},
	{num = '16', text = 'm'},
	{num = '17', text = 'n'},
	{num = '18', text = 'o'},
	{num = '19', text = 'p'},
	{num = '20', text = 'q'},
	{num = '21', text = 'r'},
	{num = '22', text = 's'},
	{num = '23', text = 't'},
	{num = '24', text = 'u'},
	{num = '25', text = 'v'},
	{num = '26', text = 'w'},
	{num = '27', text = 'x'},
	{num = '28', text = 'y'},
	{num = '29', text = 'z'},
	{num = '30', text = '_1'},
	{num = '31', text = '_2'},
	{num = '32', text = '_3'},
	{num = '33', text = '_4'},
	{num = '34', text = '_5'},
	{num = '35', text = '_6'},
	{num = '36', text = '_7'},
	{num = '37', text = '_8'},
	{num = '38', text = '_9'},
	{num = '39', text = '_0'},
	{num = '40', text = 'RETURN'},
	{num = '41', text = 'ESCAPE'},
	{num = '42', text = 'BACKSPACE'},
	{num = '43', text = 'TAB'},
	{num = '44', text = 'SPACE'},
	{num = '45', text = 'MINUS'},
	{num = '46', text = 'EQUALS'},
	{num = '47', text = 'LEFTBRACKET'},
	{num = '48', text = 'RIGHTBRACKET'},
	{num = '49', text = 'BACKSLASH'},
	{num = '50', text = 'NONUSHASH'},
	{num = '51', text = 'SEMICOLON'},
	{num = '52', text = 'APOSTROPHE'},
	{num = '53', text = 'GRAVE'},
	{num = '54', text = 'COMMA'},
	{num = '55', text = 'PERIOD'},
	{num = '56', text = 'SLASH'},
	{num = '57', text = 'CAPSLOCK'},
	{num = '58', text = 'F1'},
	{num = '59', text = 'F2'},
	{num = '60', text = 'F3'},
	{num = '61', text = 'F4'},
	{num = '62', text = 'F5'},
	{num = '63', text = 'F6'},
	{num = '64', text = 'F7'},
	{num = '65', text = 'F8'},
	{num = '66', text = 'F9'},
	{num = '67', text = 'F10'},
	{num = '68', text = 'F11'},
	{num = '69', text = 'F12'},
	{num = '70', text = 'PRINTSCREEN'},
	{num = '71', text = 'SCROLLLOCK'},
	{num = '72', text = 'PAUSE'},
	{num = '73', text = 'INSERT'},
	{num = '74', text = 'HOME'},
	{num = '75', text = 'PAGEUP'},
	{num = '76', text = 'DELETE'},
	{num = '77', text = 'END'},
	{num = '78', text = 'PAGEDOWN'},
	{num = '79', text = 'RIGHT'},
	{num = '80', text = 'LEFT'},
	{num = '81', text = 'DOWN'},
	{num = '82', text = 'UP'},
	{num = '83', text = 'NUMLOCKCLEAR'},
	{num = '84', text = 'KP_DIVIDE'},
	{num = '85', text = 'KP_MULTIPLY'},
	{num = '86', text = 'KP_MINUS'},
	{num = '87', text = 'KP_PLUS'},
	{num = '88', text = 'KP_ENTER'},
	{num = '89', text = 'KP_1'},
	{num = '90', text = 'KP_2'},
	{num = '91', text = 'KP_3'},
	{num = '92', text = 'KP_4'},
	{num = '93', text = 'KP_5'},
	{num = '94', text = 'KP_6'},
	{num = '95', text = 'KP_7'},
	{num = '96', text = 'KP_8'},
	{num = '97', text = 'KP_9'},
	{num = '98', text = 'KP_0'},
	{num = '99', text = 'KP_PERIOD'},
	{num = '100', text = 'NONUSBACKSLASH'},
	{num = '101', text = 'APPLICATION'},
	{num = '102', text = 'POWER'},
	{num = '103', text = 'KP_EQUALS'},
	{num = '104', text = 'F13'},
	{num = '105', text = 'F14'},
	{num = '106', text = 'F15'},
	{num = '107', text = 'F16'},
	{num = '108', text = 'F17'},
	{num = '109', text = 'F18'},
	{num = '110', text = 'F19'},
	{num = '111', text = 'F20'},
	{num = '112', text = 'F21'},
	{num = '113', text = 'F22'},
	{num = '114', text = 'F23'},
	{num = '115', text = 'F24'},
	{num = '116', text = 'EXECUTE'},
	{num = '117', text = 'HELP'},
	{num = '118', text = 'MENU'},
	{num = '119', text = 'SELECT'},
	{num = '120', text = 'STOP'},
	{num = '121', text = 'AGAIN'},
	{num = '122', text = 'UNDO'},
	{num = '123', text = 'CUT'},
	{num = '124', text = 'COPY'},
	{num = '125', text = 'PASTE'},
	{num = '126', text = 'FIND'},
	{num = '127', text = 'MUTE'},
	{num = '128', text = 'VOLUMEUP'},
	{num = '129', text = 'VOLUMEDOWN'},
	{num = '133', text = 'KP_COMMA'},
	{num = '134', text = 'KP_EQUALSAS400'},
	{num = '135', text = 'INTERNATIONAL1'},
	{num = '136', text = 'INTERNATIONAL2'},
	{num = '137', text = 'INTERNATIONAL3'},
	{num = '138', text = 'INTERNATIONAL4'},
	{num = '139', text = 'INTERNATIONAL5'},
	{num = '140', text = 'INTERNATIONAL6'},
	{num = '141', text = 'INTERNATIONAL7'},
	{num = '142', text = 'INTERNATIONAL8'},
	{num = '143', text = 'INTERNATIONAL9'},
	{num = '144', text = 'LANG1'},
	{num = '145', text = 'LANG2'},
	{num = '146', text = 'LANG3'},
	{num = '147', text = 'LANG4'},
	{num = '148', text = 'LANG5'},
	{num = '149', text = 'LANG6'},
	{num = '150', text = 'LANG7'},
	{num = '151', text = 'LANG8'},
	{num = '152', text = 'LANG9'},
	{num = '153', text = 'ALTERASE'},
	{num = '154', text = 'SYSREQ'},
	{num = '155', text = 'CANCEL'},
	{num = '156', text = 'CLEAR'},
	{num = '157', text = 'PRIOR'},
	{num = '158', text = 'RETURN2'},
	{num = '159', text = 'SEPARATOR'},
	{num = '160', text = 'OUT'},
	{num = '161', text = 'OPER'},
	{num = '162', text = 'CLEARAGAIN'},
	{num = '163', text = 'CRSEL'},
	{num = '164', text = 'EXSEL'},
	{num = '176', text = 'KP_00'},
	{num = '177', text = 'KP_000'},
	{num = '178', text = 'THOUSANDSSEPARATOR'},
	{num = '179', text = 'DECIMALSEPARATOR'},
	{num = '180', text = 'CURRENCYUNIT'},
	{num = '181', text = 'CURRENCYSUBUNIT'},
	{num = '182', text = 'KP_LEFTPAREN'},
	{num = '183', text = 'KP_RIGHTPAREN'},
	{num = '184', text = 'KP_LEFTBRACE'},
	{num = '185', text = 'KP_RIGHTBRACE'},
	{num = '186', text = 'KP_TAB'},
	{num = '187', text = 'KP_BACKSPACE'},
	{num = '188', text = 'KP_A'},
	{num = '189', text = 'KP_B'},
	{num = '190', text = 'KP_C'},
	{num = '191', text = 'KP_D'},
	{num = '192', text = 'KP_E'},
	{num = '193', text = 'KP_F'},
	{num = '194', text = 'KP_XOR'},
	{num = '195', text = 'KP_POWER'},
	{num = '196', text = 'KP_PERCENT'},
	{num = '197', text = 'KP_LESS'},
	{num = '198', text = 'KP_GREATER'},
	{num = '199', text = 'KP_AMPERSAND'},
	{num = '200', text = 'KP_DBLAMPERSAND'},
	{num = '201', text = 'KP_VERTICALBAR'},
	{num = '202', text = 'KP_DBLVERTICALBAR'},
	{num = '203', text = 'KP_COLON'},
	{num = '204', text = 'KP_HASH'},
	{num = '205', text = 'KP_SPACE'},
	{num = '206', text = 'KP_AT'},
	{num = '207', text = 'KP_EXCLAM'},
	{num = '208', text = 'KP_MEMSTORE'},
	{num = '209', text = 'KP_MEMRECALL'},
	{num = '210', text = 'KP_MEMCLEAR'},
	{num = '211', text = 'KP_MEMADD'},
	{num = '212', text = 'KP_MEMSUBTRACT'},
	{num = '213', text = 'KP_MEMMULTIPLY'},
	{num = '214', text = 'KP_MEMDIVIDE'},
	{num = '215', text = 'KP_PLUSMINUS'},
	{num = '216', text = 'KP_CLEAR'},
	{num = '217', text = 'KP_CLEARENTRY'},
	{num = '218', text = 'KP_BINARY'},
	{num = '219', text = 'KP_OCTAL'},
	{num = '220', text = 'KP_DECIMAL'},
	{num = '221', text = 'KP_HEXADECIMAL'},
	{num = '224', text = 'LCTRL'},
	{num = '225', text = 'LSHIFT'},
	{num = '226', text = 'LALT'},
	{num = '227', text = 'LGUI'},
	{num = '228', text = 'RCTRL'},
	{num = '229', text = 'RSHIFT'},
	{num = '230', text = 'RALT'},
	{num = '231', text = 'RGUI'},
	{num = '257', text = 'MODE'},
	{num = '258', text = 'AUDIONEXT'},
	{num = '259', text = 'AUDIOPREV'},
	{num = '260', text = 'AUDIOSTOP'},
	{num = '261', text = 'AUDIOPLAY'},
	{num = '262', text = 'AUDIOMUTE'},
	{num = '263', text = 'MEDIASELECT'},
	{num = '264', text = 'WWW'},
	{num = '265', text = 'MAIL'},
	{num = '266', text = 'CALCULATOR'},
	{num = '267', text = 'COMPUTER'},
	{num = '268', text = 'AC_SEARCH'},
	{num = '269', text = 'AC_HOME'},
	{num = '270', text = 'AC_BACK'},
	{num = '271', text = 'AC_FORWARD'},
	{num = '272', text = 'AC_STOP'},
	{num = '273', text = 'AC_REFRESH'},
	{num = '274', text = 'AC_BOOKMARKS'},
	{num = '275', text = 'BRIGHTNESSDOWN'},
	{num = '276', text = 'BRIGHTNESSUP'},
	{num = '277', text = 'DISPLAYSWITCH'},
	{num = '278', text = 'KBDILLUMTOGGLE'},
	{num = '279', text = 'KBDILLUMDOWN'},
	{num = '280', text = 'KBDILLUMUP'},
	{num = '281', text = 'EJECT'},
	{num = '282', text = 'SLEEP'},
	{num = '283', text = 'APP1'},
	{num = '284', text = 'APP2'},
	{num = '0', text = 'NIL'}, --{num = '0', text = 'UNKNOWN'},
}

--Converts inputs between ID and text.
function f_inputConvert(input, swapTo)
	output = nil
	if (swapTo == 'num' and tonumber(input) ~= nil) or (swapTo == 'text' and tonumber(input) == nil) then
		output = input
	else
		for i=1, #t_sdlInputConvert do
			if swapTo == 'text' and input == t_sdlInputConvert[i].num then --Number to text
				output = t_sdlInputConvert[i].text
			elseif swapTo == 'num' and input == t_sdlInputConvert[i].text then --Text to number
				output = t_sdlInputConvert[i].num
			end
			if output ~= nil then i = #t_sdlInputConvert end
		end
	end
	return output
end
--;===========================================================
--; MENU CONTROLS DEFINITION (Here because we gonna re-use t_keyMenuCfg for inputs hints)
--;===========================================================
t_keyMenuCfg = {
	{text = "UP",    				cmd = "u"}, --cmd is the same command registered for commandGetState(p1Cmd, 'cmd')
	{text = "DOWN",  				cmd = "d"},
	{text = "LEFT",  				cmd = "l"},
	{text = "RIGHT", 				cmd = "r"},
	{text = "A",     				cmd = "a"},
	{text = "B",     				cmd = "b"},
	{text = "C",     				cmd = "c"},
	{text = "X",     				cmd = "x"},
	{text = "Y",     				cmd = "y"},
	{text = "Z",     				cmd = "z"},
	{text = "FUNCTION 1",			cmd = "q"},
	{text = "FUNCTION 2",			cmd = "w"},
	{text = "RETURN",				cmd = "e"},
	{text = "CONFIRM",	 			cmd = "s"}, --PAUSE BUTTON
	{text = "Default Config (F1)"},
	{text = "Confirm Config (ESC)"},
}
t_keyMenuCfg2 = {}
for i=1, #t_keyMenuCfg do
	t_keyMenuCfg[i]['varID'] = textImgNew()
	t_keyMenuCfg[i]['keyboard'] = "" --To store keyboard inputs id
	t_keyMenuCfg[i]['gamepad'] = "" --To store gamepad inputs id
--Make a copy of all items from t_keyMenuCfg table to t_keyMenuCfg2 (Player 2 Inputs)
	t_keyMenuCfg2[i] = {}
	t_keyMenuCfg2[i]['varID'] = t_keyMenuCfg[i].varID
	if i == 15 then
		t_keyMenuCfg2[i]['text'] = "Default Config (F2)"
	else
		t_keyMenuCfg2[i]['text'] = t_keyMenuCfg[i].text
	end
	t_keyMenuCfg2[i]['keyboard'] = t_keyMenuCfg[i].keyboard
	t_keyMenuCfg2[i]['gamepad'] = t_keyMenuCfg[i].gamepad
	t_keyMenuCfg2[i]['cmd'] = t_keyMenuCfg[i].cmd
end

--;===========================================================
--; BATTLE CONTROLS DEFINITION (Here because we gonna re-use t_keyBattleCfg for inputs hints)
--;===========================================================
t_keyBattleCfg = {
	{text = "JUMP",   				cmd = "u"},
	{text = "CROUCH", 				cmd = "d"},
	{text = "BACK",  				cmd = "l"},
	{text = "FORWARD",				cmd = "r"},
	{text = "A",     				cmd = "a"},
	{text = "B",     				cmd = "b"},
	{text = "C",     				cmd = "c"},
	{text = "X",     				cmd = "x"},
	{text = "Y",     				cmd = "y"},
	{text = "Z",     				cmd = "z"},
	{text = "L", 					cmd = "q"},
	{text = "R", 					cmd = "w"},
	{text = "SELECT",				cmd = "e"},
	{text = "START", 				cmd = "s"},
	{text = "Default Config (F1)"},
	{text = "Confirm Config (ESC)"},
}
t_keyBattleCfg2 = {}
for i=1, #t_keyBattleCfg do
	t_keyBattleCfg[i]['varID'] = textImgNew()
	t_keyBattleCfg[i]['keyboard'] = ""
	t_keyBattleCfg[i]['gamepad'] = ""

	t_keyBattleCfg2[i] = {}
	t_keyBattleCfg2[i]['varID'] = t_keyBattleCfg[i].varID
	if i == 15 then
		t_keyBattleCfg2[i]['text'] = "Default Config (F2)"
	else
		t_keyBattleCfg2[i]['text'] = t_keyBattleCfg[i].text
	end
	t_keyBattleCfg2[i]['keyboard'] = t_keyBattleCfg[i].keyboard
	t_keyBattleCfg2[i]['gamepad'] = t_keyBattleCfg[i].gamepad
	t_keyBattleCfg2[i]['cmd'] = t_keyBattleCfg[i].cmd
end

--;===========================================================
--; INPUT HINTS DEFINITION
--;===========================================================
function f_searchCmd(input, btntype)
	for i, v in ipairs(btntype) do --For each item in table
		if v.cmd == input then --if table cmd item is equal to input entered
			return i --Returns the position of the item in the table
		end
	end
	return nil --Returns nil if the item is not found in the table
end

function f_searchButton(inputkey) --Based on previous function
	for i, v in ipairs(t_sdlInputConvert) do
		if v.text == inputkey then
			return i
		end
	end
	return #t_sdlInputConvert --return lastest table value that is an empty spr
end

inputHintsCnt = 0
function drawMenuInputHints(...) --(...) Manage unlimited arguments
	local controller = 0 --To use as group var (0=Keyboard, 1=XBOX Gamepad, 2=PS3 Gamepad)
	local t_control = nil
	if onlinegame then
		t_control = t_keyMenuCfg --Show only P1 Keys
	else
		if inputHintsCnt < 500 then
			t_control = t_keyMenuCfg
		else--if inputHintsCnt > 500 then
			t_control = t_keyMenuCfg2
		end
		if inputHintsCnt > 1000 then inputHintsCnt = 0 end --Reset
	end
	local t_args = {...} --Store all arguments taken in a table
	for i=1, #t_args, 2 do --For each argument stored in table
		local cmd = t_args[i] --Set first argument (key name) to cmd var
		local cmdPos = t_args[i+1] --Set second argument (keyX,keyY) to cmdPos var
		local nameKey = f_searchCmd(cmd, t_control) --get table pos from button name configured based on cmd entry name
		if nameKey ~= nil then
			local btn = f_searchButton(t_control[nameKey].keyboard) --Get button name configured
			local keyID = tonumber(t_sdlInputConvert[btn].num) --Reuse t_sdlInputConvert keyboard IDs table
			local key = controller..','..keyID..',0,0,-1' --Get button sprite
			key = animNew(sprInputHints, key) --Create sprite anim
			--local posKey = cmdPos --Get button "X,Y" positions
			local posKeyX, posKeyY = cmdPos:match('^([^,]-)%s*,%s*(.-)$') --Separate positions in vars
			animSetPos(key, posKeyX, posKeyY)
			animSetScale(key, keyboardInputHintsScaleX, keyboardInputHintsScaleY)
			animUpdate(key)
			animDraw(key)
		end
	end
	if not onlinegame then
		inputHintsCnt = inputHintsCnt + 1
	end
end

function drawBattleInputHints(...)
	local controller = 0
	local t_control = nil
	if onlinegame then
		t_control = t_keyBattleCfg
	else
		if inputHintsCnt < 500 then
			t_control = t_keyBattleCfg
		else
			t_control = t_keyBattleCfg2
		end
		if inputHintsCnt > 1000 then inputHintsCnt = 0 end
	end
	local t_args = {...}
	for i=1, #t_args, 2 do
		local cmd = t_args[i]
		local cmdPos = t_args[i+1]
		local nameKey = f_searchCmd(cmd, t_control)
		if nameKey ~= nil then
			local btn = f_searchButton(t_control[nameKey].keyboard)
			local keyID = tonumber(t_sdlInputConvert[btn].num)
			local key = controller..','..keyID..',0,0,-1'
			key = animNew(sprInputHints, key)
			--local posKey = cmdPos
			local posKeyX, posKeyY = cmdPos:match('^([^,]-)%s*,%s*(.-)$')
			animSetPos(key, posKeyX, posKeyY)
			animSetScale(key, keyboardInputHintsScaleX, keyboardInputHintsScaleY)
			animUpdate(key)
			animDraw(key)
		end
	end
	if not onlinegame then
		inputHintsCnt = inputHintsCnt + 1
	end
end

function drawMenuInputHintsP1(...)
	local controller = 0
	local t_args = {...}
	for i=1, #t_args, 2 do
		local cmd = t_args[i]
		local cmdPos = t_args[i+1]
		local nameKey = f_searchCmd(cmd, t_keyMenuCfg)
		if nameKey ~= nil then
			local btn = f_searchButton(t_keyMenuCfg[nameKey].keyboard)
			local keyID = tonumber(t_sdlInputConvert[btn].num)
			local key = controller..','..keyID..',0,0,-1'
			key = animNew(sprInputHints, key)
			--local posKey = cmdPos
			local posKeyX, posKeyY = cmdPos:match('^([^,]-)%s*,%s*(.-)$')
			animSetPos(key, posKeyX, posKeyY)
			animSetScale(key, keyboardInputHintsScaleX, keyboardInputHintsScaleY)
			animUpdate(key)
			animDraw(key)
		end
	end
end

function drawMenuInputHintsP2(...)
	local controller = 0
	local t_args = {...}
	for i=1, #t_args, 2 do
		local cmd = t_args[i]
		local cmdPos = t_args[i+1]
		local nameKey = f_searchCmd(cmd, t_keyMenuCfg2)
		if nameKey ~= nil then
			local btn = f_searchButton(t_keyMenuCfg2[nameKey].keyboard)
			local keyID = tonumber(t_sdlInputConvert[btn].num)
			local key = controller..','..keyID..',0,0,-1'
			key = animNew(sprInputHints, key)
			--local posKey = cmdPos
			local posKeyX, posKeyY = cmdPos:match('^([^,]-)%s*,%s*(.-)$')
			animSetPos(key, posKeyX, posKeyY)
			animSetScale(key, keyboardInputHintsScaleX, keyboardInputHintsScaleY)
			animUpdate(key)
			animDraw(key)
		end
	end
end

function drawBattleInputHintsP1(...)
	local controller = 0
	local t_args = {...}
	for i=1, #t_args, 2 do
		local cmd = t_args[i]
		local cmdPos = t_args[i+1]
		local nameKey = f_searchCmd(cmd, t_keyBattleCfg)
		if nameKey ~= nil then
			local btn = f_searchButton(t_keyBattleCfg[nameKey].keyboard)
			local keyID = tonumber(t_sdlInputConvert[btn].num)
			local key = controller..','..keyID..',0,0,-1'
			key = animNew(sprInputHints, key)
			--local posKey = cmdPos
			local posKeyX, posKeyY = cmdPos:match('^([^,]-)%s*,%s*(.-)$')
			animSetPos(key, posKeyX, posKeyY)
			animSetScale(key, keyboardInputHintsScaleX, keyboardInputHintsScaleY)
			animUpdate(key)
			animDraw(key)
		end
	end
end

function drawBattleInputHintsP2(...)
	local controller = 0
	local t_args = {...}
	for i=1, #t_args, 2 do
		local cmd = t_args[i]
		local cmdPos = t_args[i+1]
		local nameKey = f_searchCmd(cmd, t_keyBattleCfg2)
		if nameKey ~= nil then
			local btn = f_searchButton(t_keyBattleCfg2[nameKey].keyboard)
			local keyID = tonumber(t_sdlInputConvert[btn].num)
			local key = controller..','..keyID..',0,0,-1'
			key = animNew(sprInputHints, key)
			--local posKey = cmdPos
			local posKeyX, posKeyY = cmdPos:match('^([^,]-)%s*,%s*(.-)$')
			animSetPos(key, posKeyX, posKeyY)
			animSetScale(key, keyboardInputHintsScaleX, keyboardInputHintsScaleY)
			animUpdate(key)
			animDraw(key)
		end
	end
end

--;===========================================================
--; BUTTON SECRET CODES DEFINITION
--;===========================================================
--"U,U,D,D,L,R,L,R,B,A,S" --Konami Code Example
t_secretCode = {"U","U","D","D","L","R","L","R","B","A","S"}
t_secretEntry = {}

txt_secretBox = [[

KONAMI CODE DETECTED!

]]

function f_cmdCodeReset()
	cmdCode = false
	cmdReward = false
	newcmdCode = false
end

function f_cmdCode()
	local secretTxt = f_extractText(txt_secretBox)
--Actions
	if getButton(p1Cmd) ~= "" then
		codeEntry = getButton(p1Cmd)
		newcmdCode = true
	elseif getButton(p2Cmd) ~= "" then
		codeEntry = getButton(p2Cmd)
		newcmdCode = true
	end
--Check Entries
	if newcmdCode then
		f_secretCode(codeEntry)
		newcmdCode = false
	end
	--f_drawQuickText(txtCmd, font6, 0, 0, codeEntry, 159, 120)
	if cmdReward then
		for i=1, #secretTxt do
			textImgDraw(f_updateTextImg(textImgNew(), jgFnt, 0, 0, secretTxt[i], 159, 110 + 15 * (i - 1)))
		end
	end
end

--User Entries
function f_secretCode(key)
	table.insert(t_secretEntry, key) --Insert key/entry received to t_secretEntry table
--[[
	if #t_secretEntry > #t_secretCode then --If entries exceed t_secretCode table limit
		t_secretEntry = {} --Reset Table to try again.
	end
]]
	for i = 1, #t_secretEntry do
		if t_secretEntry[i] ~= t_secretCode[i] then --Check if the user key entry is equal to secret code position
			t_secretEntry = {} --Reset Table to try again.
		end
	end
--Compare User Entries Table with Secret Code Table
	if table.concat(t_secretEntry) == table.concat(t_secretCode) then --If table are equals
		sndPlay(sndIkemen, 800, 0)
		--stats.unlocks.chars.charname = true --Character Unlock
		--f_saveStats()
		cmdReward = true
	else--If table are not equals
		cmdReward = false
	end
	if data.debugLog then
		f_printTable(t_secretEntry, "save/debug/t_secretEntry.log")
		f_printTable(t_secretCode, "save/debug/t_secretCode.log")
	end
end

--;===========================================================
--; STORYBOARD DEFINITION
--;===========================================================
t_storyboardData = {} --stores all SFF, SND, FNT data structures
function f_storyboard(path)
	local file = io.open(path, 'r')
	local all = file:read("*all")
	all = all:lower()
	local file = io.open(path, 'r')
	local fileDir, fileName = path:match('^(.-)([^/\\]+)$')
	local t = {}
	t['fileDir'] = fileDir
	t['fileName'] = fileName
	t['scenes'] = {}
	t['anim'] = {}
	t['ctrldef'] = {}
	local pos = t
	local row = ''
	local bg = ''
	local ctrl = ''
	for line in file:lines() do
		line = line:gsub('%s*;.*$', '')
		line = line:gsub('%s+', ' ')
		local part1, part2, part3 = line:match('^([^"]*"?)([^"]*)("?[^"]*)$')
		line = part1:lower() .. part2 .. part3:lower()
		row = line:match('^%s*%[%s*([^%]]+)%s*%]%s*$')
		if row then
			if row:match('^scene%s+[0-9]+$') then
				row = #t.scenes + 1
				t.scenes[row] = {}
				pos = t.scenes[row]
			elseif row:match('^begin%s+action%s+[0-9]+$') then
				row = row:match('^begin%s+action%s+([0-9]+)$') + 1
				t.anim[row] = {}
				pos = t.anim[row]
			elseif row:match('[^%s]ctrldef') then
				ctrl = row:match('^(.-ctrl)def')
				row = #t.ctrldef+1
				t.ctrldef[row] = {}
				t.ctrldef[row]['ctrl'] = {}
				pos = t.ctrldef[row]
			elseif ctrl ~= '' and row:match('^' .. ctrl) then
				row = #t.ctrldef[#t.ctrldef]['ctrl']+1
				t.ctrldef[#t.ctrldef]['ctrl'][row] = {}
				pos = t.ctrldef[#t.ctrldef]['ctrl'][row]
			elseif row:match('[^%s]def') and all:match('%s*bg%.name%s*=%s*' .. row:match('^(.-)def$')) then
				ctrl = ''
				bg = tostring(row:match('^(.-)def'))
				t[bg] = {}
			elseif bg ~= '' and row:match('^' .. bg) then
				ctrl = ''
				row = #t[bg] + 1
				t[bg][row] = {}
				pos = t[bg][row]
			else
				ctrl = ''
				bg = ''
				t[row] = t[row] or {}
				pos = t[row]
			end
		else
			local param, value = line:match('^%s*([^=]-)%s*=%s*(.-)%s*$')
			if param and value ~= nil then
				if tonumber(param) then
					param = tonumber(param)
				end
				if tonumber(value) then
					value = tonumber(value)
				elseif value == 'true' then
					value = true
				elseif value == 'false' then
					value = false
				end
				pos[param] = value
			else
				local value = line:match('^%s*([0-9%-]+%s*,%s*[0-9%-]+%s*,%s*[0-9%-]+%s*,%s*[0-9%-]+%s*,%s*[0-9%-]+.-)[,%s]*$') or line:match('^%s*loopstart')
				if value ~= nil then
					pos[#pos+1] = value
				end
			end
		end
	end
	file:close()
	if data.debugLog then f_printTable(t, 'save/debug/storyboard/t_'..fileName..'.log') end
	f_storyboardPlay(t)
	sndStop()
	return
end

function f_storyboardPlay(tIn)
--Info Optional Parameters:
--localcoord = width, height (int, int)
	local tOut = {}
	if tIn.info ~= nil and tIn.info.localcoord ~= nil then
		tOut['xScale'], tOut['yScale'] = tIn.info.localcoord:match('^([^,]-)%s*,%s*(.-)$')
		tOut['xScale'] = 320 / tOut['xScale']
		tOut['yScale'] = 240 / tOut['yScale']
	else
		tOut['xScale'] = 1
		tOut['yScale'] = 1
	end
--SceneDef Required Parameters:
--spr = filename (string)
	if tIn.scenedef.spr ~= nil then
		if tIn.scenedef.spr:match('[/\\]') then
			tOut['sff'] = tIn.scenedef.spr
		else
			tOut['sff'] = tIn.fileDir .. tIn.scenedef.spr
		end
		if t_storyboardData[tOut.sff] == nil then
			t_storyboardData[tOut.sff] = sffNew(tOut.sff)
		end
	end
--SceneDef Optional Parameters:
--snd = filename (string)
	if tIn.scenedef.snd ~= nil then
		if tIn.scenedef.snd:match('[/\\]') then
			tOut['snd'] = tIn.scenedef.snd
		else
			tOut['snd'] = tIn.fileDir .. tIn.scenedef.snd
		end
		if t_storyboardData[tOut.snd] == nil then
			t_storyboardData[tOut.snd] = sndNew(tOut.snd)
		end
	end
--fontX = filename (string)
	tOut['fnt'] = {}
	for i=0, 9 do
		if tIn.scenedef['font' .. i] ~= nil then
			local i_s = tostring(i)
			if tIn.scenedef['font' .. i]:match('[/\\]') then
				tOut['fnt'][i_s] = tIn.scenedef['font' .. i]
			else
				tOut['fnt'][i_s] = tIn.fileDir .. tIn.scenedef['font' .. i]
				--tOut['fnt'][i_s] = 'font/' .. tIn.scenedef['font' .. i]
			end
			if t_storyboardData[tOut.fnt[i_s]] == nil then
				t_storyboardData[tOut.fnt[i_s]] = fontNew(tOut.fnt[i_s])
			end
		end
	end
--startscene = scene_number (int)
	if tIn.scenedef.startscene ~= nil then
		tOut['startscene'] = tIn.scenedef.startscene + 1
	else
		tOut['startscene'] = 1
	end
--Scene Parameters:
	tOut['scenes'] = {}
	for i=1, #tIn.scenes do
		tOut.scenes[i] = {}
	--Required parameters:
	--end.time = t (int)
		if tIn.scenes[i]['end.time'] ~= nil then
			tOut.scenes[i]['endTime'] = tIn.scenes[i]['end.time']
		else
			tOut.scenes[i]['endTime'] = 0
		end
	--Optional parameters:
	--fadein.time = duration (int)
		if tIn.scenes[i]['fadein.time'] ~= nil then
			tOut.scenes[i]['fadeinTime'] = tIn.scenes[i]['fadein.time']
		else
			tOut.scenes[i]['fadeinTime'] = 0
		end
	--fadein.col = r, g, b (int, int, int)
		if tIn.scenes[i]['fadein.col'] ~= nil and tIn.scenes[i]['fadein.col']:match('255%s*,%s*255,%s*255') then
			tOut.scenes[i]['fadeinCol'] = 'white'
		else
			tOut.scenes[i]['fadeinCol'] = 'black'
		end
	--fadein (anim data)
		tOut.scenes[i]['fadeinData'] = f_fadeAnim(tOut.scenes[i].fadeinTime, 'fadein', tOut.scenes[i].fadeinCol, sprFade)
	--fadeout.time = duration (int)
		if tIn.scenes[i]['fadeout.time'] ~= nil then
			tOut.scenes[i]['fadeoutTime'] = tIn.scenes[i]['fadeout.time']
		else
			tOut.scenes[i]['fadeoutTime'] = 0
		end
	--fadeout.col = r, g, b (int, int, int)
		if tIn.scenes[i]['fadeout.col'] ~= nil and tIn.scenes[i]['fadeout.col']:match('255%s*,%s*255,%s*255') then
			tOut.scenes[i]['fadeoutCol'] = 'white'
		else
			tOut.scenes[i]['fadeoutCol'] = 'black'
		end
	--fadeout (anim data)
		tOut.scenes[i]['fadeoutData'] = f_fadeAnim(tOut.scenes[i].fadeoutTime, 'fadeout', tOut.scenes[i].fadeoutCol, sprFade)
	--clearcolor = r, g, b (int, int, int) --currently only black when average of RGB <= 128 and white if >128, can't generate a color not from sprite
		if tIn.scenes[i]['clearcolor'] ~= nil then
			local tmp1, tmp2, tmp3 = tIn.scenes[i]['clearcolor']:match('([0-9]+)%s*,%s*([0-9]+)%s*,%s*([0-9]+)')
			if (tmp1+tmp2+tmp3)/3 > 128 then
				tOut.scenes[i]['clearcolor'] = 'white' --for debugging only
				tOut.scenes[i]['clearcolorData'] = animNew(sprFade, '0,1, 0,0, -1')
				animUpdate(tOut.scenes[i]['clearcolorData'])
			else
				tOut.scenes[i]['clearcolor'] = 'black' --for debugging only
				tOut.scenes[i]['clearcolorData'] = animNew(sprFade, '0,0, 0,0, -1')
				animUpdate(tOut.scenes[i]['clearcolorData'])
			end
		elseif i > 1 then
			tOut.scenes[i]['clearcolor'] = tOut.scenes[i-1].clearcolor --for debugging only
			tOut.scenes[i]['clearcolorData'] = tOut.scenes[i-1].clearcolorData
		else
			tOut.scenes[i]['clearcolor'] = 'black' --for debugging only
			tOut.scenes[i]['clearcolorData'] = animNew(sprFade, '0,0, 0,0, -1')
			animUpdate(tOut.scenes[i]['clearcolorData'])
		end
	--layerall.pos = x, y (int, int)
		if tIn.scenes[i]['layerall.pos'] ~= nil then
			tOut.scenes[i]['layerallPosX'], tOut.scenes[i]['layerallPosY'] = tIn.scenes[i]['layerall.pos']:match('^([^,]-)%s*,%s*(.-)$')
		elseif i > 1 then
			tOut.scenes[i]['layerallPosX'] = tOut.scenes[i-1].layerallPosX
			tOut.scenes[i]['layerallPosY'] = tOut.scenes[i-1].layerallPosY
		else
			tOut.scenes[i]['layerallPosX'] = 0
			tOut.scenes[i]['layerallPosY'] = 0
		end
	--window = x1, y1, x2, y2 (int, int, int, int)
		if tIn.scenes[i]['window'] ~= nil then
			tOut.scenes[i]['windowX1'], tOut.scenes[i]['windowY1'], tOut.scenes[i]['windowX2'], tOut.scenes[i]['windowY2'] = tIn.scenes[i]['window']:match('([0-9]+)%s*,%s*([0-9]+)%s*,%s*([0-9]+)%s*,%s*([0-9]+)')
			tOut.scenes[i]['windowX2'] = tOut.scenes[i]['windowX2'] - tOut.scenes[i]['windowX1']
			tOut.scenes[i]['windowY2'] = tOut.scenes[i]['windowY2'] - tOut.scenes[i]['windowY1']
		else
			tOut.scenes[i]['windowX1'] = 0
			tOut.scenes[i]['windowY1'] = 0
			tOut.scenes[i]['windowX2'] = 320
			tOut.scenes[i]['windowY2'] = 240
		end
	--layerX
		tOut.scenes[i]['layers'] = {}
		for j=0, 9 do
			tOut.scenes[i].layers[j+1] = {}
			local posOut = tOut.scenes[i].layers[j+1]
			local layerX = 'layer' .. j
		--layerX.offset = offx, offy (int, int)
			if tIn.scenes[i][layerX .. '.offset'] ~= nil then
				posOut['offsetX'], posOut['offsetY'] = tIn.scenes[i][layerX .. '.offset']:match('^([^,]-)%s*,%s*(.-)$')
			else
				posOut['offsetX'] = 0
				posOut['offsetY'] = 0
			end
		--layerX.anim = actionno (int)
			if tIn.scenes[i][layerX .. '.anim'] ~= nil then
				posOut['anim'] = tIn.anim[tIn.scenes[i][layerX .. '.anim']+1] --for debugging only
				posOut['animNumber'] = tIn.scenes[i][layerX .. '.anim'] --for debugging only
				local anim = ''
				for k=1, #tIn.anim[tIn.scenes[i][layerX .. '.anim']+1] do
					anim = anim .. tIn.anim[tIn.scenes[i][layerX .. '.anim']+1][k] .. '\n'
				end
				anim = anim:gsub('add1', 'a1')
				anim = anim:gsub('add', 'a')
				anim = anim:gsub('sub', 's')
				posOut['animData'] = animNew(t_storyboardData[tOut.sff], anim)
				animAddPos(posOut['animData'], tOut.scenes[i].layerallPosX+posOut.offsetX, tOut.scenes[i].layerallPosY+posOut.offsetY)
				animSetScale(posOut['animData'], tOut.xScale, tOut.yScale)
				animSetWindow(posOut['animData'], tOut.scenes[i]['windowX1'], tOut.scenes[i]['windowY1'], tOut.scenes[i]['windowX2'], tOut.scenes[i]['windowY2'])
				animUpdate(posOut['animData'])
			end
			if tIn.scenes[i][layerX .. '.text'] ~= nil then
				posOut['text'] = tostring(tIn.scenes[i][layerX .. '.text'])
			end
		--layerX.text = text (string)
			if tIn.scenes[i][layerX .. '.text'] ~= nil then
				posOut['text'] = tIn.scenes[i][layerX .. '.text']:match('^"?(.-)"?$')
			end
		--layerX.font = font_no, bank, align, r, g, b (int, int, int, int, int, int) --r, g, b parameters currently unsupported
		--[[IKEMEN feature: additional optional parameters:
			spacing: spacing between lines (rendering Y position increasement for each line), defaults to 20
			limit: maximum line length (string wraps when reached), if omitted line wraps only if string contains '\n'
			scaleX: X scale factor, defaults to 1.0
			scaleY: Y scale factor, defaults to 1.0
		]]
			if tIn.scenes[i][layerX .. '.font'] ~= nil then
				posOut['font'] = tIn.scenes[i][layerX .. '.font'] --for debugging only
				posOut['fontData'] = textImgNew()
				local font, bank, aline, r, g, b, spacing, limit, scaleX, scaleY = posOut['font']:match('^([^,]*)%s*,?%s*([^,]*)%s*,?%s*([^,]*)%s*,?%s*([^,]*)%s*,?%s*([^,]*)%s*,?%s*([^,]*)%s*,?%s*([^,]*)%s*,?%s*([^,]*)%s*,?%s*([^,]*)%s*,?%s*([^,]*)$')
				if bank == '' then
					bank = 0
				end
				if aline == '' then
					aline = 0
				end
				if r == '' then
					r = 0
				end
				if g == '' then
					g = 0
				end
				if b == '' then
					b = 0
				end
				if spacing == '' then
					spacing = 20
				end
				if limit == '' then
					limit = -1
				end
				if scaleX == '' then
					scaleX = 1
				end
				if scaleY == '' then
					scaleY = 1
				end
				textImgSetFont(posOut['fontData'], t_storyboardData[tOut.fnt[font]])
				textImgSetBank(posOut['fontData'], bank)
				textImgSetAlign(posOut['fontData'], aline)
				--textImgSetPos(posOut['fontData'], tOut.scenes[i].layerallPosX+posOut.offsetX, tOut.scenes[i].layerallPosY+posOut.offsetY)
				textImgSetScale(posOut['fontData'], scaleX, scaleY)
				textImgSetText(posOut['fontData'], '')
				posOut['spacing'] = spacing
				posOut['limit'] = limit
				posOut['counter'] = 0
			end
		--layerX.textdelay = delay (int)
			if tIn.scenes[i][layerX .. '.textdelay'] ~= nil then
				posOut['textdelay'] = tIn.scenes[i][layerX .. '.textdelay']
			else
				posOut['textdelay'] = 0
			end
		--layerX.starttime = t (int, int)
			if tIn.scenes[i][layerX .. '.starttime'] ~= nil then
				posOut['starttime'] = tIn.scenes[i][layerX .. '.starttime']
			else
				posOut['starttime'] = 0
			end
		--layerX.endtime = t (int, int)
			if tIn.scenes[i][layerX .. '.endtime'] ~= nil then
				posOut['endtime'] = tIn.scenes[i][layerX .. '.endtime']
			else
				posOut['endtime'] = tOut.scenes[i].endTime
			end
		end
	--soundX
		tOut.scenes[i]['sounds'] = {}
		for j=0, 99 do
			local soundX = 'sound' .. j
			if tIn.scenes[i][soundX .. '.value'] ~= nil then
				tOut.scenes[i].sounds[#tOut.scenes[i].sounds+1] = {}
				local posOut = tOut.scenes[i].sounds[#tOut.scenes[i].sounds]
			--soundX.value = group_no, sound_no (int, int)
				posOut['group'], posOut['sound'] = tIn.scenes[i][soundX .. '.value']:match('^([^,]-)%s*,%s*(.-)$')
			--soundX.starttime = t (int)
				if tIn.scenes[i][soundX .. '.starttime'] ~= nil then
					posOut['starttime'] = tIn.scenes[i][soundX .. '.starttime']
				else
					posOut['starttime'] = 0
				end
			--soundX.volumescale = volume_scale (double) --currently unsupported
				if tIn.scenes[i][soundX .. '.volumescale'] ~= nil then
					posOut['volumescale'] = tIn.scenes[i][soundX .. '.volumescale']
				end
			--soundX.pan = p (int) --currently unsupported
				if tIn.scenes[i][soundX .. '.pan'] ~= nil then
					posOut['pan'] = tIn.scenes[i][soundX .. '.pan']
				end
			end
		end
	--bgm = filename (string)
		if tIn.scenes[i]['bgm'] ~= nil then
			if tIn.scenes[i]['bgm']:match('[/\\]') then
				tOut.scenes[i]['bgm'] = tIn.scenes[i]['bgm']
			else
				tOut.scenes[i]['bgm'] = tIn.fileDir .. tIn.scenes[i]['bgm']
			end
		end
	--bgm.loop = loop (boolean) --currently unsupported
		if tIn.scenes[i]['bgm.loop'] ~= nil then
			tOut.scenes[i]['bgmLoop'] = tIn.scenes[i]['bgm.loop']
		end
	--bg.name = bgname (string)
		if tIn.scenes[i]['bg.name'] ~= nil then
		--Background element parameters:
			tOut.scenes[i]['backgrounds'] = {}
			for j=1, #tIn[tIn.scenes[i]['bg.name']] do
				local posIn = tIn[tIn.scenes[i]['bg.name']][j]
				tOut.scenes[i]['backgrounds'][j] = {}
				local posOut = tOut.scenes[i]['backgrounds'][j]
			--type = normal (string)
				if posIn['type'] ~= nil then
					posOut['type'] = posIn['type']
				else
					posOut['type'] = ''
				end
				posOut['type'] = bgType
			--layer
				if posIn['layer'] ~= nil then
					posOut['layer'] = posIn['layer']
				else
					posOut['layer'] = 0
				end
			--id
				if posIn['id'] ~= nil then
					posOut['id'] = posIn['id']
				else
					posOut['id'] = 0
				end
			--spriteno = groupno, imageno (int, int)
				if posIn['spriteno'] ~= nil then
					posOut['group'], posOut['sprite'] = posIn['spriteno']:match('^([^,]-)%s*,%s*(.-)$')
				else
					posOut['group'] = '-1'
					posOut['sprite'] = '-1'
				end
			--start = x,y (float, float)
				if posIn['start'] ~= nil then
					if type(posIn['start']) ~= 'string' then
						posOut['startX'] = posIn['start']
						posOut['startY'] = 0
					else
						posOut['startX'], posOut['startY'] = posIn['start']:match('^([^,]-)%s*,%s*(.-)$')
					end
				else
					posOut['startX'] = 0
					posOut['startY'] = 0
				end
			--velocity = vel_x, vel_y (float, float)
				if posIn['velocity'] ~= nil then
					if type(posIn['velocity']) ~= 'string' then
						posOut['velocityX'] = posIn['velocity']
						posOut['velocityY'] = 0
					else
						posOut['velocityX'], posOut['velocityY'] = posIn['velocity']:match('^([^,]-)%s*,%s*(.-)$')
					end
				else
					posOut['velocityX'] = 0
					posOut['velocityY'] = 0
				end
			--tile = x_tile,y_tile (int, int)
				if posIn['tile'] ~= nil then
					if type(posIn['tile']) ~= 'string' then
						posOut['tileX'] = posIn['tile']
						posOut['tileY'] = 0
					else
						posOut['tileX'], posOut['tileY'] = posIn['tile']:match('^([^,]-)%s*,%s*(.-)$')
					end
				else
					posOut['tileX'] = 0
					posOut['tileY'] = 0
				end
			--tilespacing = x_spacing,y_spacing (int, int) --currently unsupported
				if posIn['tilespacing'] ~= nil then
					if type(posIn['tilespacing']) ~= 'string' then
						posOut['tilespacingX'] = posIn['tilespacing']
						posOut['tilespacingY'] = 0
					else
						posOut['tilespacingX'], posOut['tilespacingY'] = posIn['tilespacing']:match('^([^,]-)%s*,%s*(.-)$')
					end
				else
					posOut['tilespacingX'] = 0
					posOut['tilespacingY'] = 0
				end
			--trans = trans (string)
				if posIn['trans'] ~= nil then
					if posIn['trans'] == 'add' then
						posOut['trans'] = 'a'
					elseif posIn['trans'] == 'add1' then
						posOut['trans'] = 'a1'
					elseif posIn['trans'] == 'sub' then
						posOut['trans'] = 's'
					else --ASxxxDxxx
						posOut['trans'] = posIn['trans']
					end
				else
					posOut['trans'] = ''
				end
			--window = x1,y1,x2,y2 ; (int, int, int, int)
				if posIn['window'] ~= nil then
					posOut['windowX1'], posOut['windowY1'], posOut['windowX2'], posOut['windowY2'] = posIn['window']:match('([0-9]+)%s*,%s*([0-9]+)%s*,%s*([0-9]+)%s*,%s*([0-9]+)')
					posOut['windowX2'] = posOut['windowX2'] - posOut['windowX1']
					posOut['windowY2'] = posOut['windowY2'] - posOut['windowY1']
				else
					posOut['windowX1'] = 0
					posOut['windowY1'] = 0
					posOut['windowX2'] = 320
					posOut['windowY2'] = 240
				end
				local anim = posOut.group .. ',' .. posOut.sprite .. ', ' .. posOut.startX .. ',' .. posOut.startY .. ', ' .. tOut.scenes[i]['endTime']
				if posOut['trans'] ~= '' then
					anim = anim .. ', , ' .. posOut['trans']
				end
				posOut['anim'] = anim --for debugging only
				posOut['bgData'] = animNew(t_storyboardData[tOut.sff], anim)
				animAddPos(posOut['bgData'], 160, 0) --background objects are rendered at center in mugen
				animSetWindow(posOut['bgData'], posOut['windowX1'], posOut['windowY1'], posOut['windowX2'], posOut['windowY2'])
				animSetTile(posOut['bgData'], posOut['tileX'], posOut['tileY'])
				animUpdate(posOut['bgData'])
			end
		end
	end
--Background controller parameters:
	local tPos = ''
	for i=1, #tIn.ctrldef do
		for j=1, #tIn.ctrldef[i].ctrl do
			tPos = tIn.ctrldef[i].ctrl[j]
		--time = START_TIME, END_TIME, LOOPTIME
		--code reference for future use
		--[[
			if tPos['time'] ~= nil then
				for k, c in ipairs(strsplit(',', tPos.time)) do
					if k == 1 then
						tPos['time'] = tonumber(c)
					elseif k == 2 then
						tPos['timeEnd'] = tonumber(c)
					elseif k == 3 then
						tPos['timeLoop'] = tonumber(c)
					end
				end
			end
			if tPos['time'] == nil then
				tPos['time'] = -1
			end
			if tPos['timeEnd'] == nil then
				tPos['timeEnd'] = -1
			end
			if tPos['timeLoop'] == nil then
				tPos['timeLoop'] = -1
			end
		]]
			if tPos['time'] ~= nil then
				if type(tPos['time']) ~= 'string' then
					tPos['timeEnd'] = -1
					tPos['timeLoop'] = -1
				else
					tPos['timeEnd'], tPos['timeLoop'] = tPos['time']:match('^[0-9-]-%s*,%s*[0-9-]-%s*,?%s*([0-9-]*)$')
					if tPos['timeLoop'] == nil then
						tPos['timeLoop'] = -1
					end
				end
			else
				tPos['time'] = -1
				tPos['timeEnd'] = -1
				tPos['timeLoop'] = -1
			end
		end
	end
	tOut['ctrldef'] = {}
	tOut.ctrldef = tIn.ctrldef
--Actual storyboard loop
	if data.debugLog then f_printTable(tOut, 'save/debug/t_storyboard.log') end
	local velX = 0
	local velY = 0
	for i=tOut.startscene, #tOut.scenes do
		for j=0, tOut.scenes[i].endTime do
		--Skip
			if (tIn.scenedef.skipbutton == nil or tIn.scenedef.skipbutton == 1) and (not data.attractMode and (esc() or commandGetState(p1Cmd, 's') or commandGetState(p2Cmd, 's'))) or
			data.attractMode and (getCredits() > 0 and tIn.scenedef.attractstate == 1) or
			(tIn.scenedef.attractstate == nil or tIn.scenedef.attractstate == 0) and (esc() or commandGetState(p1Cmd, 's') or commandGetState(p2Cmd, 's')) then
				cmdInput()
				refresh()
				return
			end
			if j == 0 and tOut.scenes[i].bgm ~= nil then
				playBGM(tOut.scenes[i].bgm)
			end
			for k=1, #tOut.scenes[i].sounds do
				if j == tOut.scenes[i].sounds[k].starttime then
					sndPlay(t_storyboardData[tOut.snd], tOut.scenes[i].sounds[k].group, tOut.scenes[i].sounds[k].sound)
				end
			end
			animDraw(tOut.scenes[i].clearcolorData)
			if tOut.scenes[i].backgrounds ~= nil then
				for k=1, #tOut.scenes[i].backgrounds do
					if tOut.scenes[i].backgrounds[k].layer == 0 and tOut.scenes[i].backgrounds[k].id ~= nil then
						velX, velY = f_ctrlCheck(tOut.scenes[i].backgrounds[k].id, tOut.ctrldef, j)
						animDraw(tOut.scenes[i].backgrounds[k].bgData)
						animAddPos(tOut.scenes[i].backgrounds[k].bgData, tOut.scenes[i].backgrounds[k].velocityX+velX, tOut.scenes[i].backgrounds[k].velocityY+velY)
						animUpdate(tOut.scenes[i].backgrounds[k].bgData)
					end
				end
			end
			for k=1, 10 do
				local tPos = tOut.scenes[i].layers[k]
				if tPos ~= nil and j >= tPos.starttime and j <= tPos.endtime then
					if tPos.animData ~= nil then
						animDraw(tPos.animData)
						animUpdate(tPos.animData)
					end
					if tPos.fontData ~= nil then
						tPos.counter = tPos.counter + 1
						f_textRender(tPos.fontData, tPos.text, tPos.counter, tOut.scenes[i].layerallPosX+tPos.offsetX, tOut.scenes[i].layerallPosY+tPos.offsetY, tPos.spacing, tPos.textdelay, tPos.limit)
					end
				end
			end
			if tOut.scenes[i].backgrounds ~= nil then
				for k=1, #tOut.scenes[i].backgrounds do
					if tOut.scenes[i].backgrounds[k].layer > 0 and tOut.scenes[i].backgrounds[k].id ~= nil then
						velX, velY = f_ctrlCheck(tOut.scenes[i].backgrounds[k].id, tOut.ctrldef, j)
						animDraw(tOut.scenes[i].backgrounds[k].bgData)
						animAddPos(tOut.scenes[i].backgrounds[k].bgData, tOut.scenes[i].backgrounds[k].velocityX+velX, tOut.scenes[i].backgrounds[k].velocityY+velY)
						animUpdate(tOut.scenes[i].backgrounds[k].bgData)
					end
				end
			end
			if j <= tOut.scenes[i].fadeinTime then
				animDraw(tOut.scenes[i].fadeinData)
				animUpdate(tOut.scenes[i].fadeinData)
			end
			if j >= tOut.scenes[i].endTime - tOut.scenes[i].fadeoutTime then
				animDraw(tOut.scenes[i].fadeoutData)
				animUpdate(tOut.scenes[i].fadeoutData)
			end
		--Draw Insert Coin Stuff (Only when Attract Mode is Enabled and Storyboard Contains "attractstate = 1" paramvalue, under [Info] section)
			if data.attractMode and tIn.scenedef.attractstate == 1 then
				drawAttractStatus()
			end
			cmdInput()
			refresh()
		end
	end
	playBGM('')
end

function f_ctrlCheck(id, t, timer)
	local x = 0
	local y = 0
	for i=1, #t do
		if id == t[i].ctrlid then
			local defLooptime = t[i].looptime
			for j=1, #t[i].ctrl do
				local start_time = t[i].ctrl[j].time
				local end_time = t[i].ctrl[j].timeEnd
				local looptime = t[i].ctrl[j].timeLoop
				if timer >= start_time and (end_time == -1 or timer < end_time) then
					local ctrlType = t[i].ctrl[j].type
					if ctrlType == 'velset' or ctrlType == 'veladd' then
						if t[i].ctrl[j].y ~= nil then
							y = t[i].ctrl[j].y
						else
							y = 0
						end
						if t[i].ctrl[j].x ~= nil then
							x = t[i].ctrl[j].x
						else
							x = 0
						end
					end
				end
			end
		end
	end
	return x, y
end

--;===========================================================
--; MAIN MENU STUFF
--;===========================================================
function f_default() --Reset Game Modes Configuration
	resetRemapInput()
--settings adjustable via options
	setRoundTime(data.roundTime * 60)
	setRoundsToWin(data.roundsNum)
	setLifeMul(data.lifeMul / 100)
	setPowerMul(0)
	setTeam1VS2Life(data.team1VS2Life / 100)
	setTurnsRecoveryRate(1.0 / data.turnsRecoveryRate)
	setSharedLife(data.teamLifeShare)
	setPowerShare(1, data.teamPowerShare) --Team Power Share for Left Side
	setPowerShare(2, data.teamPowerShare) --Team Power Share for Right Side
--Auto-Guard for Left Side
	setAutoguard(1, false)
	setAutoguard(3, false)
	setAutoguard(5, false)
	setAutoguard(7, false)
--Auto-Guard for Right Side
	setAutoguard(2, false)
	setAutoguard(4, false)
	setAutoguard(6, false)
	setAutoguard(8, false)
--values adjustable via lua scripts
	data.p1Char = nil --no predefined P1 character (assigned via table: {X, Y, (...)})
	data.p2Char = nil --no predefined P2 character (assigned via table: {X, Y, (...)})
	data.p1Pal = nil --no predefined P1 character palette
	data.p2Pal = nil --no predefined P2 character palette
	data.p1TeamMenu = nil --no predefined P1 team mode (assigned via table: {mode = X, chars = Y} )
	data.p2TeamMenu = nil --no predefined P2 team mode (assigned via table: {mode = X, chars = Y} )
	data.p1In = 1 --P1 controls P1 side of the select screen
	data.p2In = 0 --P2 controls in the select screen disabled
	data.coop = false --P2 fighting on P1 side disabled
	data.p2Faces = false --additional window with P2 select screen small portraits (faces) disabled
	data.p1SelectMenu = true --P1 character selection enabled
	data.p2SelectMenu = true --P2 character selection enabled
	data.aiFight = false --AI = data.difficulty for all characters disabled
	data.stageMenu = false --stage selection disabled
	data.stage = nil --no predefined custom stage
	data.zoomStage = {zoom = data.zoomActive, zoomOut = data.zoomMin, zoomIn = data.zoomMax, zoomSpeed = data.zoomSpeed} --predefined custom Zoom Stage values (assigned via table: {zoom = false, zoomOut = 0.5, zoomIn = 1, zoomSpeed = 1} )
	data.bgm = nil --no predefined custom song route
	data.songSelect = true --enable assign music for stage (this exists to avoid f_assignMusic() in story mode custom fights)
	data.arcadeIntro = false --character arcade intro disabled
	data.arcadeEnding = false --character arcade ending disabled
	data.arcadeTravel = false --arcade travel (next match screen disabled)
	data.orderSelect = true --order select screen enabled
	data.versusScreen = true --versus screen enabled
	data.victoryscreen = true --victory screen enabled
	data.serviceScreen = false --service screen disabled
	data.challengerScreen = true --Here comes a New Challenger screen enabled
	data.intermission = false --Manage access to secret battles
	data.gameMode = "" --additional variable used to distinguish modes in select screen
	data.rosterMode = "" --additional variable used to identify game modes in select screen to record stats and setup special stuff
	data.rosterAdvanced = false --additional variable used to identify advanced roster (like arcade, survival or tower) in select screen
	data.missionNo = nil --additional variable used to identify missions in select screen
	data.eventNo = nil --additional variable used to identify events in select screen
	data.storyNo = nil --additional variable used to identify stories in select screen
--Match Settings
	setAutoLevel(false) --generate autolevel.log in debug dir
	setHUD(true) --just enable or disable hud elements in game
	setHomeTeam(2) --P2 side considered the home team: http://mugenguild.com/forum/topics/ishometeam-triggers-169132.0.html
	setP1matchWins(0) --Set Match Wins Count for Player 1
	setP2matchWins(0) --Set Match Wins Count for Player 2
	setLastMatch(-1) --Set Last Match Stage
	setScore(0) --Reset Player Score
	setPlayerSide("") --set player side variable to adjust internal settings.
	setGameMode("") --set local GameMode variable (it can be recognized in cns and lua).
	setService("") --set different fight services for players (service examples are available in match.cns)
	setPauseVar("") --set pause menu extra variable to adjust internal settings.
--Tournament Stuff
	setFTNo(1) --Set Matchs To Wins/FT (To show in lifebar of Tournament Mode)
	setTourneyState("") --set tournament state to show in tourney mode lifebar.
--Abyss Stuff
	setAbyssLife(0) --set life points to show during abyss mode profile and which be apply to the player.
	setAbyssPower(0) --set power points to show during abyss mode profile and which be apply to the player.
	setAbyssAttack(0) --set attack points to show during abyss mode profile and which be apply to the player.
	setAbyssDefence(0) --set defence points to show during abyss mode profile and which be apply to the player.
	
	setAbyssReward(0) --set reward to show during abyss mode match lifebar.
	setAbyssDepth(1) --set depth level to show during abyss mode match lifebar.
	setAbyssFinalDepth(0) --set last abyss depth match.
	setAbyssDepthBoss(0) --set next abyss NORMAL boss depth.
	setAbyssDepthBossSpecial(0) --set next abyss SPECIAL boss depth.
	abyssBossMatch = getAbyssDepthBoss()
	abyssSpecialBossCnt = 1 --Start count for Abyss Special Boss Matchs
	abyssNextCheckPoint = abyssCheckpointNo --Start count for Abyss Map Checkpoints
	--setAbyssBossFight(0) --Set when player is inside abyss boss fight
	setLifePersistence(0) --To store last life bar value when life is maintained after match
--To save Special Items during Abyss Boss Reward Menu
	setAbyssSP1("")
	setAbyssSP2("")
	setAbyssSP3("")
	setAbyssSP4("")
end

function f_setAbyssItems()
	setAbyssSP1(abyssDat.nosave.itemslot[1])
	setAbyssSP2(abyssDat.nosave.itemslot[2])
	setAbyssSP3(abyssDat.nosave.itemslot[3])
	setAbyssSP4(abyssDat.nosave.itemslot[4])
end

--Take Screenshots
function f_screenShot()
	sndPlay(sndIkemen, 300, 0)
	takeScreenShot(screenshotPath.."/"..os.date(getWindowTitle().." %Y-%m-%d %I-%M%p-%S")..".png")
end

--Insert Coins During Attract Mode
attractDemoTimer = 0
attractContinueTimer = 0
attractSeconds = data.attractTime
attractTimer = attractSeconds*gameTick --Set time for Attract Title Screen
function f_addCoin()
	sndPlay(sndIkemen, 400, 0)
	attractDemoTimer = 0
	attractContinueTimer = 0
	attractTimer = attractSeconds*gameTick --Reset Attract Title Timer
	setCredits(getCredits() + 1)
end

--Reset Engine
function f_resetEngine()
	f_playTime()
	sszReload() --Native Reboot, added via ikemen.ssz
	os.exit()
end

--Configuration Menu Access for Attract Mode
function f_attractCfgMenu()
	inConfig = true
	--onlinegame = false
	assert(loadfile(saveCfgPath))()
	playBGM(bgmNothing)
	f_mainCfg()
	f_resetEngine()
end

function f_resetFadeBGM()
fadeInBGMstart = 0 --To start BGM Volume in 0
fadeOutBGMstart = bgm_vol
setVolume(gl_vol / 100, se_vol / 100, bgm_vol / 100) --Restore BGM Volume
end

function f_fadeInBGM(fadeSeconds)
	local originalVol = bgm_vol --Get current bgm volume
	local fadeStep = originalVol / (fadeSeconds * 60) --Calculate the increment for each step based on the desired fade duration
	local timer = 0
	if timer < fadeSeconds * 60 then
		if fadeInBGMstart < originalVol then
			fadeInBGMstart = fadeInBGMstart + fadeStep --Increment BGM Volume
			setVolume(gl_vol / 100, se_vol / 100, fadeInBGMstart / 100)
			timer = timer + 1
		end
	end
	if data.debugMode then
		f_drawQuickText(txt_testfadeinBGM, font6, 0, 0, originalVol, 109, 28)
		f_drawQuickText(txt_testfadeinBGM, font6, 0, 0, fadeInBGMstart, 109, 48)
		f_drawQuickText(txt_testfadeinBGM, font6, 0, 0, fadeStep, 109, 68)
		f_drawQuickText(txt_testfadeinBGM, font6, 0, 0, fadeSeconds, 109, 88)
	end
end

function f_fadeOutBGM(fadeSeconds)
	local originalVol = bgm_vol
	local fadeStep = originalVol / (fadeSeconds * 60)
	local timer = 0
	if timer < fadeSeconds * 60 then
		if fadeOutBGMstart > 0 then
			fadeOutBGMstart = fadeOutBGMstart - fadeStep
			setVolume(gl_vol / 100, se_vol / 100, fadeOutBGMstart / 100)
			timer = timer + 1
		end
	end
	if data.debugMode then
		f_drawQuickText(txt_testfadeOutBGM, font6, 0, 0, "fadeostart:"..fadeOutBGMstart, 109, 48)
		f_drawQuickText(txt_testfadeOutBGM, font6, 0, 0, "fadestep:"..fadeStep, 109, 68)
		f_drawQuickText(txt_testfadeOutBGM, font6, 0, 0, "fadeseconds:"..fadeSeconds, 109, 88)
	end
end

--Select Main Menu Song
function f_menuMusic()
	if data.menuSong == "Random" then
		if #t_songList[data.menuSongFolder]-2 ~= 0 then --If there's songs loaded
			f_bgmrandomMenu()
		else --If There's no songs loaded
			playBGM(bgmNothing)
		end
	else
		playBGM(data.menuSong)
	end
end

--Random Select for Main Menu Song
function f_bgmrandomMenu()
	local randomTrack = math.random(1, #t_songList[data.menuSongFolder]-2) --Get random song using folder reference saved (-2 excludes back and random select items)
	local randomSong = t_songList[data.menuSongFolder][randomTrack].path --Use random song obtained to get his path
	playBGM(randomSong)
end

--Select Character Select Song
function f_selectMusic()
	if data.selectSong == "Random" then
		if #t_songList[data.selectSongFolder]-2 ~= 0 then --If there's songs loaded
			f_bgmrandomSelect()
		else --If There's no songs loaded
			playBGM(bgmNothing)
		end
	else
		playBGM(data.selectSong)
	end
end

--Random Select for Character Select Song
function f_bgmrandomSelect()
	local randomTrack = math.random(1, #t_songList[data.selectSongFolder]-2)
	local randomSong = t_songList[data.selectSongFolder][randomTrack].path
	playBGM(randomSong)
end

--Select Character Select (New Challenger Mode) Song
function f_challengerMusic()
	if data.challengerSong == "Random" then
		if #t_songList[data.challengerSongFolder]-2 ~= 0 then --If there's songs loaded
			f_bgmrandomChallenger()
		else --If There's no songs loaded
			playBGM(bgmNothing)
		end
	else
		playBGM(data.challengerSong)
	end
end

--Random Select for Character Select Song
function f_bgmrandomChallenger()
	local randomTrack = math.random(1, #t_songList[data.challengerSongFolder]-2)
	local randomSong = t_songList[data.challengerSongFolder][randomTrack].path
	playBGM(randomSong)
end

--Random Select Song for Quick Versus Mode (Unused)
function f_bgmrandomVS()
	randomBGMPath = "sound"
	t_randomsongList = {}
	for file in lfs.dir(randomBGMPath) do
		if file:match('^.*(%.)[Mm][Pp][3]$') then
			row = #t_randomsongList+1
			t_randomsongList[row] = {}
			t_randomsongList[row]['id'] = ''
			t_randomsongList[row]['name'] = file:gsub('^(.*)[%.][Mm][Pp][3]$', '%1')
			t_randomsongList[row]['path'] = randomBGMPath.."/"..file
		elseif file:match('^.*(%.)[Oo][Gg][Gg]$') then
			row = #t_randomsongList+1
			t_randomsongList[row] = {}
			t_randomsongList[row]['id'] = ''
			t_randomsongList[row]['name'] = file:gsub('^(.*)[%.][Oo][Gg][Gg]$', '%1')
			t_randomsongList[row]['path'] = randomBGMPath.."/"..file
		end
	end
	playBGM(t_randomsongList[math.random(1, #t_randomsongList)].path)
	if data.debugLog then f_printTable(t_randomsongList, "save/debug/t_randomsongList.log") end
end

--Load Songs from Folders
function f_loadMusic(path)
	for item in lfs.dir(path) do --For each item readed in path
		if item ~= "." and item ~= ".." and item ~= ".keep" then --exclude items
			local details = path.."/"..item --Get path and file name
			local attribute = lfs.attributes(details) --Get atributes from items readed
			if attribute ~= nil then
				assert(type(attribute) == "table")
				f_loadMusic(details)
				if attribute.mode == "file" then --If the item have "file" attribute
					if item:match('^.*(%.)[Mm][Pp][3]$') then
						row = #t_songFile+1
						t_songFile[row] = {}
						t_songFile[row]['id'] = ""
						t_songFile[row]['folder'] = path
						t_songFile[row]['path'] = details
						t_songFile[row]['name'] = item:gsub('^(.*)[%.][Mm][Pp][3]$', '%1')
						t_songFile[row]['fullname'] = item
					elseif item:match('^.*(%.)[Oo][Gg][Gg]$') then
						row = #t_songFile+1
						t_songFile[row] = {}
						t_songFile[row]['id'] = ""
						t_songFile[row]['folder'] = path
						t_songFile[row]['path'] = details
						t_songFile[row]['name'] = item:gsub('^(.*)[%.][Oo][Gg][Gg]$', '%1')
						t_songFile[row]['fullname'] = item
					end
				elseif attribute.mode == "directory" then --If the item have "folder/dir" attribute
					rowFolder = #t_songList+1
					t_songList[rowFolder] = {}
					t_songList[rowFolder]['folder'] = details
				end
			end
		end
	end
	if data.debugLog then f_printTable(t_songFile, 'save/debug/t_songFile.log') end
	if data.debugLog then f_printTable(t_songList, 'save/debug/t_songList.log') end
end

function f_soundtrack()
	t_songFile = {}
	t_songList = { [1] = {folder = musicPath } } --Create folder table with main music dir as 1st item
	f_loadMusic(musicPath)
--Loop through t_songFile table
	for i, songFile in ipairs(t_songFile) do
	--Loop through t_songList table
		for k, songFolder in ipairs(t_songList) do
		--Associate songs paths
			if songFile.folder == songFolder.folder then
			--Send each file from t_songFile corresponding to his folder in t_songList
				table.insert(t_songList[k], songFile)
				break --Exit inner loop once a match file is found
			end
		end
	end
--Add extra items to the end of "Folder" sub-row Created
	for folder=1, #t_songList do
		local row = #t_songList[folder]+1
		t_songList[folder][row] = {id = '', name = 'RANDOM SELECT', path = 'Random'}
		t_songList[folder][row+1] = {id = '', name = 'BACK', path = ''}
	end
	if data.debugLog then f_printTable(t_songList, 'save/debug/t_songList.log') end
end

--;===========================================================
--; DATE AND CLOCK DATA
--;===========================================================
--Assigns Date components to a variable based on the system clock
sysYear = tonumber(os.date("%Y")) --Current Year
sysMonth = os.date("%b") --Current Month
sysDay = tonumber(os.date("%d")) --Current Day
sysHour = tonumber(os.date("%H")) --Current Hour (Useful for day/night features).
sysMinutes = tonumber(os.date("%M")) --Current Minute
sysSeconds = tonumber(os.date("%S")) --Current Second

--Convert Month abbreviation to Number
t_monthMap = {Jan=1, Feb=2, Mar=3, Apr=4, May=5, Jun=6, Jul=7, Aug=8, Sep=9, Oct=10, Nov=11, Dec=12}
function f_monthToNumber(m)
	return t_monthMap[m] or 0
end

t_dateFormats = {
	"%Y-%m-%d", --ISO
	"%d.%m.%Y", --European
	"%m-%d-%Y", --US
	"%A, %d %B %Y", --Full
	"%a %d %b %Y", --Abbreviated
	"%m-%d-%y", --ShortMonth-Day-Year
	"%A", --FullDayName
	"%B %Y", --FullMonthYear
}

t_clockFormats = {
--Standard
	{
		locale = "%I:%M%p",
		utc = "!%I:%M%p",
	},
--Full Standard
	{
		locale = "%I:%M:%S%p",
		utc = "!%I:%M:%S%p",
	},
--Military
	{
		locale = "%H:%M",
		utc = "!%H:%M",
	},
--Full Military
	{
		locale = "%X",
		utc = "!%X",
	},
}

netLastUpdate = 0
netUpdateInterval = 60 --Seconds between each net API request
function f_resetNetTimeVars()
netTime = nil
netDate = nil
netLog = ""
currentNetTime = nil
netYear = nil
netMonth = nil
netDay = nil
netHour = nil
netMinutes = nil
netSeconds = nil
end
f_resetNetTimeVars()

function f_loadNetTimeLuaSocket()
	local response_body = {}
	local reques, code, response_headers = http.request{
		url = "http://worldclockapi.com/api/json/utc/now",
		--url = "http://worldtimeapi.org/api/timezone/Etc/UTC", --Alternative
		sink = ltn12.sink.table(response_body)
	}
--Success HTTP Request
	if reques == 1 and code == 200 then
		local response_str = table.concat(response_body)
		local decoded = json.decode(response_str)
	--Decode JSON
		if decoded and decoded.currentDateTime then
		--if decoded and decoded.datetime then --Alternative
		--Get Date and Time
			local datetime_str = decoded.currentDateTime --Example: "2025-10-09T14:23Z"
			--local datetime_str = decoded.datetime --Alternative
		--Separate Date and Time
			local date_part, time_part = datetime_str:match("^(%d+-%d+-%d+)T(%d+:%d+)")
			--netTime = time_part
			--netDate = date_part
		--Convert time_part to hour in UTC format
			local h, m, s = time_part:match("^(%d+):(%d+):?(%d*)")
			s = s ~= "" and tonumber(s) or 0
			h = tonumber(h)
			m = tonumber(m)
		--Create timestamp in UTC
			local utc_timestamp = os.time{
				year = tonumber(date_part:sub(1,4)),
				month = tonumber(date_part:sub(6,7)),
				day = tonumber(date_part:sub(9,10)),
				hour = h,
				min = m,
				sec = s
			}
			currentNetTime = utc_timestamp
		--To keep UTC format use "!" at the beginning: os.date("!%I:%M%p", currentNetTime)
			netYear = tonumber(os.date("%Y", currentNetTime))
			netMonth = os.date("%b", currentNetTime)
			netDay = tonumber(os.date("%d", currentNetTime))
			netHour = tonumber(os.date("%H", currentNetTime))
			netMinutes = tonumber(os.date("%M", currentNetTime))
			netSeconds = tonumber(os.date("%S", currentNetTime))
			netTime = os.date(t_clockFormats[data.clock].locale, currentNetTime)
			netDate = os.date(t_dateFormats[data.dateFormat], currentNetTime)
			return true
	--Can't decode JSON
		else
			currentNetTime = nil
			netTime = nil
			netDate = netTime
			netLog = 'JSON does not contains "currentDateTime".'
			--netLog = 'JSON does not contains "datetime".' --Alternative
			return false --Unable to connect
		end
--Failed HTTP Request
	else
		currentNetTime = nil
		netTime = nil
		netDate = netTime
		netLog = "Error requesting HTTP: Code "..tostring(code).."."
		return false --Unable to connect
	end
end

--[[
local easy = curl.easy()
local url = "http://example.com"
easy:setopt(curl.OPT_URL, url)
easy:setopt(curl.OPT_CONNECTTIMEOUT, 10) 
local res = easy:perform()
if res then
	local httpCode = easy:getinfo(curl.INFO_RESPONSE_CODE)
	--print("Success.")
	--print("URL: " .. url)
	--print("Code HTTP: " .. tostring(httpCode))
else
	local err_code = easy:getinfo(curl.EASY_RESULT) or -1 
	--print("Failed.")
	--print("Error Code: " .. tostring(err_code))
	--print("Error Msg: " .. curl.strerror(err_code))
end
easy:close()
--]]

function f_loadNetTimeLuaCurl()
	local response_body = {}
	local url = "http://worldclockapi.com/api/json/utc/now"
	local easy = curl.easy()
	easy:setopt(curl.OPT_URL, url)
	easy:setopt(curl.OPT_CONNECTTIMEOUT, 10) --Set wait time for connection
	local ok, err_code, err_msg = easy:perform({
		writefunction = function(str)
			table.insert(response_body, str)
			return #str
		end,
	--We can add headerfunction to see headers if need
	--headerfunction = function(str) print("HEADER:", str) end
	})
--Success HTTP Request
	if ok then
		local http_code = easy:getinfo(curl.INFO_RESPONSE_CODE)
		if http_code == 200 then
			local response_str = table.concat(response_body)
			local decoded = json.decode(response_str)
		--Decode JSON
			if decoded and decoded.currentDateTime then
			--Get Date and Time
				local datetime_str = decoded.currentDateTime --Example: "2025-10-09T14:23Z"
			--Separate Date and Time
				local date_part, time_part = datetime_str:match("^(%d+-%d+-%d+)T(%d+:%d+)")
				--netTime = time_part
				--netDate = date_part
			--Convert time_part to hour in UTC format
				local h, m, s = time_part:match("^(%d+):(%d+):?(%d*)")
				s = s ~= "" and tonumber(s) or 0
				h = tonumber(h)
				m = tonumber(m)
			--Create timestamp in UTC
				local utc_timestamp = os.time{
					year = tonumber(date_part:sub(1,4)),
					month = tonumber(date_part:sub(6,7)),
					day = tonumber(date_part:sub(9,10)),
					hour = h,
					min = m,
					sec = s
				}
				currentNetTime = utc_timestamp
			--To keep UTC format use "!" at the beginning: os.date("!%I:%M%p", currentNetTime)
				netYear = tonumber(os.date("%Y", currentNetTime))
				netMonth = os.date("%b", currentNetTime)
				netDay = tonumber(os.date("%d", currentNetTime))
				netHour = tonumber(os.date("%H", currentNetTime))
				netMinutes = tonumber(os.date("%M", currentNetTime))
				netSeconds = tonumber(os.date("%S", currentNetTime))
				netTime = os.date(t_clockFormats[data.clock].locale, currentNetTime)
				netDate = os.date(t_dateFormats[data.dateFormat], currentNetTime)
				easy:close()
				return true
		--Can't Decode JSON
			else
				currentNetTime = nil
				netTime = nil
				netDate = netTime
				netLog = 'JSON does not contains "currentDateTime".'
				easy:close()
				return false --Unable to connect
			end
	--HTTP Error (404, 500)
		else
			currentNetTime = nil
			netTime = nil
			netDate = netTime
			netLog = "Error requesting HTTP: Code "..tostring(http_code).."."
			easy:close()
			return false
		end
--cURL Failed (timeout, error DNS, etc.)
	else
		currentNetTime = nil
		netTime = nil
		netDate = netTime
		netLog = "cURL Error: "..tostring(err_msg).." ("..tostring(err_code)..")"
		easy:close()
		return false --Unable to connect
	end
end

function loadNetTime() --One-time Load
	if getOS() ~= "windowsXP" then --LuaSocket used is not supported in Windows XP
		f_loadNetTimeLuaSocket()
	else --Use Lua-cURL which is supported in Windows XP
		f_loadNetTimeLuaCurl()
	end
end

function updateNetTime() --To use inside loops
	local netCurrentTime = os.time()
--Update every netUpdateInterval seconds
	if netCurrentTime - netLastUpdate >= netUpdateInterval then
		if loadNetTime() then
			netLastUpdate = netCurrentTime
		end
	end
end

function f_sysTime()
	local datePosX = 0
	local datePosY = 8
	local clockPosX = 0
	local clockPosY = 8
--4:3 Resolution
	if (resolutionHeight / 3 * 4) == resolutionWidth then
		datePosX = 8
		--datePosY = 8
		clockPosX = 314
		--clockPosY = 8
--16:10 Resolution
	elseif (resolutionHeight / 10 * 16) == resolutionWidth then
		datePosX = -25
		--datePosY = 8
		clockPosX = 345
		--clockPosY = 8
--16:9 Resolution
	elseif (math.floor((resolutionHeight / 9 * 16) + 0.5)) == resolutionWidth then
		datePosX = -45
		--datePosY = 8
		clockPosX = 365
		--clockPosY = 8
--Extra Resolution
	else
		datePosX = -25
		--datePosY = 8
		clockPosX = 345
		--clockPosY = 8
	end
--Set Date
	textImgSetText(txt_titleDate, os.date(t_dateFormats[data.dateFormat]))
	textImgSetPos(txt_titleDate, datePosX, datePosY)
	textImgDraw(txt_titleDate) --Draw Date
--Set Clock
	textImgSetText(txt_titleClock, os.date(t_clockFormats[data.clock].locale))
	textImgSetPos(txt_titleClock, clockPosX, clockPosY)
	textImgDraw(txt_titleClock) --Draw Clock
	if data.debugMode then
		f_drawQuickText(txt_testDpad, font6, 0, 0, "PAD 1: "..getInputID(data.p1Gamepad), 109, 8) --Gamepad Repose Test
		f_drawQuickText(txt_testDpad, font6, 0, 0, "PAD 2: "..getInputID(data.p2Gamepad), 199, 8)
		--f_drawQuickText(txt_testW, font6, 0, 0, "BGM: "..bgm_vol, 109, 38)
	--[[
		f_drawQuickText(txt_testW, font6, 0, 0, "MONITOR WIDTH: "..getWidth(), 109, 38)
		f_drawQuickText(txt_testH, font6, 0, 0, "MONITOR HEIGHT: "..getHeight(), 199, 38)
	]]
	end
end

function f_timeCountdown(args)
--[["args" argument is a table that can have keys: year, month, day, hour, min, sec
Example:
t_deadline = {year="2025", month="Dec", day="31", hour = "23", min = "59", sec = "59"}
f_timeCountdown(t_deadline)
]]
--Get the current date and time
	local now = nil
	if args.time == "net" then
		now = currentNetTime
	elseif args.time == "local" then
		now = os.time()
	end
	if now == nil then return false end
--Convert date inputs into a table to create the target timestamp
	local targetDate = {
		year = tonumber(args.year),
		month = nil,
		day = nil,
		hour = tonumber(args.hour) or 0,
		min = tonumber(args.min) or 0,
		sec = tonumber(args.sec) or 0
	}
--Convert month to number if it is string
	if type(args.month) == "string" then
		targetDate.month = f_monthToNumber(args.month) --targetMonth[]
	elseif args.month then
		targetDate.month = tonumber(args.month)
	end
--If the day is missing, day 1 is assumed
	targetDate.day = tonumber(args.day) or 1
--Create the destination timestamp
    local targetTimestamp = os.time(targetDate)
--Calculate difference in seconds
	local diffSeconds = targetTimestamp - now
	if diffSeconds < 0 then
		diffSeconds = 0 --The date has already passed
	end
--Component calculation
	local seconds_in_minute = 60
	local seconds_in_hour = 3600
	local seconds_in_day = 86400
	local seconds_in_week = 7 * seconds_in_day
	local seconds_in_month = 30 * seconds_in_day --approximate
	local seconds_in_year = 365 * seconds_in_day --approximate
	
	local years = math.floor(diffSeconds / seconds_in_year)
	diffSeconds = diffSeconds % seconds_in_year
	
	local months = math.floor(diffSeconds / seconds_in_month)
	diffSeconds = diffSeconds % seconds_in_month
	
	local weeks = math.floor(diffSeconds / seconds_in_week)
	diffSeconds = diffSeconds % seconds_in_week
	
	local days = math.floor(diffSeconds / seconds_in_day)
	diffSeconds = diffSeconds % seconds_in_day
	
	local hours = math.floor(diffSeconds / seconds_in_hour)
	diffSeconds = diffSeconds % seconds_in_hour
	
	local minutes = math.floor(diffSeconds / seconds_in_minute)
	local seconds = diffSeconds % seconds_in_minute
--Build the string according arguments added, omitting any 0 values
	local parts = {}
--Count how many arguments were added
	local present_args = 0
	for k,v in pairs(args) do
		present_args = present_args + 1
	end
--Function to add only if that argument was passed
	local function addPart(name, value)
		if args[name] ~= nil then
			table.insert(parts, value)
		end
	end
--Only if there is a single argument, return only that value
	if present_args == 1 then
		for k,v in pairs(args) do
			if k == "year" then
				addPart(k, years .. " years")
			elseif k == "month" then
				addPart(k, months .. " months")
			elseif k == "day" then
				addPart(k, days .. " days")
			elseif k == "hour" then
				addPart(k, hours .. "h")
			elseif k == "min" then
				addPart(k, minutes .. "m")
			elseif k == "sec" then
				addPart(k, seconds .. "s")
			end
		end
	--If for some reason it does not match, return "0" or similar
		if #parts == 0 then
			return "0"
		else
			return parts[1]
		end
	else
	--If there are several values or none, show all that apply
		if args.year ~= nil and years > 0 then
			table.insert(parts, years .. " years")
		end
		if args.month ~= nil and months > 0 then
			table.insert(parts, months .. " months")
		end
		if args.day ~= nil and days > 0 then
			table.insert(parts, days .. " days")
		end
		if args.hour ~= nil and hours > 0 then
			table.insert(parts, hours .. "hours")
		end
		if args.min ~= nil and minutes > 0 then
			table.insert(parts, minutes .. "min")
		end
		if args.sec ~= nil and seconds > 0 then
			table.insert(parts, seconds .. "s")
		end
	--If none pass, show all
		if #parts == 0 then
		--Show Full Countdown
			if years > 0 then table.insert(parts, years .. " years") end
			if months > 0 then table.insert(parts, months .. " months") end
			if weeks > 0 then table.insert(parts, weeks .. " weeks") end
			if days > 0 then table.insert(parts, days .. " days") end
			if hours > 0 then table.insert(parts, hours .. "h") end
			if minutes > 0 then table.insert(parts, minutes .. "m") end
			if seconds > 0 or #parts == 0 then table.insert(parts, seconds .. "s") end
		end
		return table.concat(parts, ", ") --Return the damn countdown
	end
end
--;===========================================================
--; UNLOCKS CHECKING
--;===========================================================
function f_updateUnlocks() --To refresh unlocks data
if data.debugLog then f_printTable(t_unlockLua, "save/debug/t_unlockLua.log") end
end

t_unlockLua = { --Create table to manage unlock conditions in real-time
chars = {}, stages = {}, modes = {},
artworks = {}, storyboards = {}, videos = {},
palettes = {}, shop = {}, abyss = {},
achievements = {}
}

function f_generateUnlocks()
--Send Characters Unlock Condition to t_unlockLua table
	for k, v in ipairs(t_selChars) do
		t_unlockLua.chars[v.char] = v.unlock
	end
--Send Stages Unlock Condition to t_unlockLua table
	for k, v in ipairs(t_selStages) do
		t_unlockLua.stages[v.stage] = v.unlock
	end
--Send Abyss Unlock Items Condition to t_unlockLua table
	for k, v in ipairs(t_abyssShop) do
		t_unlockLua.abyss[v.text] = v.unlock
	end
	f_updateUnlocks()
end
--asserts content unlock conditions
function f_unlock(permanent)
	for group, t in pairs(t_unlockLua) do
		local t_del = {}
		for k, v in pairs(t) do
			local bool = assert(loadstring('return ' .. v))()
			if type(bool) == 'boolean' then
			--[[
				if group == 'chars' then
					f_unlockChar(k, bool, false)
				elseif group == 'stages' then
					f_unlockStage(k, bool)
				end
			]]
				if bool and (permanent or 
				group == 'chars' or group == 'stages' or group == 'modes' or 
				group == 'artworks' or group == 'storyboards' or group == 'videos' or
				group == 'palettes' or group == 'abyss' or group == 'shop' or
				group == 'achievements') then
					table.insert(t_del, k)
					if group == 'achievements' then
						for i=1, #t_achievements do
						--Send achievement ID first time that is unlocked to t_pendingTrophy to display them
							if t_achievements[i].id == k and not data.trophies[k].displayed then
								table.insert(t_pendingTrophy, 1, {trophyID = i})
							end
						end
						if data.debugLog then f_printTable(t_pendingTrophy, "save/debug/t_pendingTrophy.log") end
					end
				end
			else
				--Error: Lua code does not return boolean value
			end
		end
	--clean lua code that already returned true
		for k, v in ipairs(t_del) do
			t[v] = nil
		end
	end
end
--;===========================================================
--; SAVE DATA DEFINITION
--;===========================================================
function f_playTime()
	gTime = os.clock() - gameTime
	stats.playtime = (stats.playtime + gTime)
	f_saveStats()
end

--Data saving to temp_sav.lua
function f_saveTemp()
	local t_temp = {
		['data.tempBack'] = data.tempBack,
		['data.replayDone'] = data.replayDone,
		['data.challengerMode'] = data.challengerMode,
		['data.challengerAbyss'] = data.challengerAbyss,
		['data.saveAbyss'] = data.saveAbyss,
		['data.VNbreaker'] = data.VNbreaker,
		['data.p1Lose'] = data.p1Lose,
		['data.p2Lose'] = data.p2Lose,
		['data.AIskip'] = data.AIskip,
		['data.stgBGM'] = data.stgBGM,
	}
	s_tempdataLUA = f_strSub(s_tempdataLUA, t_temp)
	local tempFile = io.open(saveTempPath,"w+")
	tempFile:write(s_tempdataLUA)
	tempFile:close()
end

function f_resetTemp() --Reset Temp Default Values to Prevent Issues
	data.tempBack = false
	data.replayDone = false
	data.challengerMode = false
	data.challengerAbyss = false
	data.saveAbyss = false
	data.VNbreaker = false
	data.p1Lose = false
	data.p2Lose = false
	data.AIskip = false
	data.stgBGM = ""
	f_saveTemp()
end

function f_setStgBGM(name)
	local name = name or ""
	local cleanName = name:match("([^/]+)%.[^.]+$") --Extract Song Name
	data.stgBGM = cleanName
	f_saveTemp()
end

--Data saving to tourney_sav.lua
function f_saveTourney()
	local t_tourney = {
		['data.tourneySize'] = data.tourneySize,
		['data.tourneyType'] = data.tourneyType,
		['data.tourneyTeam'] = data.tourneyTeam,
		['data.tourneyCharSel'] = data.tourneyCharSel,
		['data.tourneyStgSel'] = data.tourneyStgSel,
		['data.tourneyRoundTime'] = data.tourneyRoundTime,
		['data.tourneyRoundsNum'] = data.tourneyRoundsNum,
		['data.tourneyMatchsNum'] = data.tourneyMatchsNum,
		['data.tourney3rdPlace'] = data.tourney3rdPlace,
	}
	s_tourneydataLUA = f_strSub(s_tourneydataLUA, t_tourney)
	local tourneyFile = io.open(saveTourneyPath,"w+")
	tourneyFile:write(s_tourneydataLUA)
	tourneyFile:close()
end

--Data saving to stats.json
function f_saveStats()
	--if data.debugLog then f_printTable(stats, 'save/debug/t_stats.log') end
	f_fileWrite(saveStatsPath, json.encode(stats, {indent = 2}))
end

--Data saving to host_rooms.json
function f_saveOnlineRooms()
	--if data.debugLog then f_printTable(host_rooms, 'save/debug/t_hostRooms.log') end
	f_fileWrite(saveHostRoomPath, json.encode(host_rooms, {indent = 2}))
end

--Data saving to abyss_save.json
function f_saveAbyss()
	--if data.debugLog then f_printTable(abyssDat, 'save/debug/t_abyssSave.log') end
	f_fileWrite(saveAbyssPath, json.encode(abyssDat, {indent = 2}))
end

--Data saving to p1_sav.json and p2_sav.json
function f_savePlayerDat()
	f_fileWrite(saveP1Path, json.encode(p1Dat, {indent = 2}))
	f_fileWrite(saveP2Path, json.encode(p2Dat, {indent = 2}))
end

--General Sections
function init_generalStats()
if stats.firstRun == nil or data.erase then stats.firstRun = true end
if stats.playtime == nil or data.erase then stats.playtime = 0 end
if stats.money == nil or data.erase then stats.money = 0 end
if stats.continueCount == nil or data.erase then stats.continueCount = 0 end
if stats.wins == nil or data.erase then stats.wins = 0 end
if stats.losses == nil or data.erase then stats.losses = 0 end
if stats.characters == nil or data.erase then stats.characters = {} end --To store times used for favorite chars stats
if stats.stages == nil or data.erase then stats.stages = {} end --To store times used for favorite stages stats
if stats.modes == nil or data.erase then
	stats.modes = {}
	
	stats.modes.arcade = {}
	stats.modes.arcade.playtime = 0
	stats.modes.arcade.clear = 0
	stats.modes.arcade.ranking = {}
	
	stats.modes.tower = {}
	stats.modes.tower.playtime = 0
	stats.modes.tower.clear = 0
	stats.modes.tower.ranking = {}

	stats.modes.survival = {}
	stats.modes.survival.playtime = 0
	stats.modes.survival.clear = 0
	stats.modes.survival.ranking = {}
	
	stats.modes.abyss = {}
	stats.modes.abyss.playtime = 0
	stats.modes.abyss.clear = 0
	stats.modes.abyss.maxdepth = 0
	stats.modes.abyss.ranking = {}
	
	stats.modes.legion = {}
	stats.modes.legion.playtime = 0
	stats.modes.legion.clear = 0
	stats.modes.legion.ranking = {}
	
	stats.modes.bossrush = {}
	stats.modes.bossrush.playtime = 0
	stats.modes.bossrush.clear = 0
	stats.modes.bossrush.ranking = {}
	
	stats.modes.bonusrush = {}
	stats.modes.bonusrush.playtime = 0
	stats.modes.bonusrush.clear = 0
	stats.modes.bonusrush.ranking = {}
	
	stats.modes.scoreattack = {}
	stats.modes.scoreattack.playtime = 0
	stats.modes.scoreattack.clear = 0
	stats.modes.scoreattack.ranking = {}
	
	stats.modes.timeattack = {}
	stats.modes.timeattack.playtime = 0
	stats.modes.timeattack.clear = 0
	stats.modes.timeattack.ranking = {}
	
	stats.modes.timerush = {}
	stats.modes.timerush.playtime = 0
	stats.modes.timerush.clear = 0
	stats.modes.timerush.ranking = {}
	
	stats.modes.vskumite = {}
	stats.modes.vskumite.playtime = 0
	stats.modes.vskumite.clear = 0
	stats.modes.vskumite.ranking = {}
	
	stats.modes.suddendeath = {}
	stats.modes.suddendeath.playtime = 0
	stats.modes.suddendeath.clear = 0
	stats.modes.suddendeath.ranking = {}
	
	stats.modes.endless = {}
	stats.modes.endless.playtime = 0
	stats.modes.endless.clear = 0
	stats.modes.endless.ranking = {}
	
	stats.modes.tourney = {}
	stats.modes.tourney.playtime = 0
	stats.modes.tourney.clear = 0
	stats.modes.tourney.ranking = {}
	
	stats.modes.trials = {}
	stats.modes.trials.playtime = 0
	stats.modes.trials.clear = 0
	
	stats.modes.tutorial = {}
	stats.modes.tutorial.playtime = 0
	stats.modes.tutorial.clear = 0
	
	stats.modes.boss = {}
	stats.modes.boss.playtime = 0
	stats.modes.boss.clear = 0
	
	stats.modes.bonus = {}
	stats.modes.bonus.playtime = 0
	stats.modes.bonus.clear = 0
	
	stats.modes.training = {}
	stats.modes.training.playtime = 0
	
	stats.modes.versus = {}
	stats.modes.versus.playtime = 0
	
	stats.modes.watch = {}
	stats.modes.watch.playtime = 0
end
if stats.vault == nil or data.erase then stats.vault = "Ultra" end
end

abyssDat.default = { --For some reason cannot re-use t_abyssDefaultSave table because nosave data is copy to abyssDat.default when delete data...
	life = 0,
	power = 0,
	attack = 0,
	defence = 0,
	reward = 0,
	expense = 0,
	sideselect = "",
	lifebarstate = 0,
	abysslv = 0,
	depth = 0,
	nextcheckpoint = 0,
	nextboss = 0,
	nextspecialboss = 0,
	specialbosscnt = 0,
	winsCnt = 0,
	stage = "",
	itemslot = {[1] = "", [2] = "", [3] = "", [4] = ""},
}

function init_abyssStats()
--Abyss Mode Characters Stats Section
local t_abyssDefaultSave = {
	life = 0,
	power = 0,
	attack = 0,
	defence = 0,
	reward = 0,
	expense = 0,
	sideselect = "",
	lifebarstate = 0,
	abysslv = 0,
	depth = 0,
	nextcheckpoint = 0,
	nextboss = 0,
	nextspecialboss = 0,
	specialbosscnt = 0,
	winsCnt = 0,
	stage = "",
	itemslot = {[1] = "", [2] = "", [3] = "", [4] = ""},
}
abyssDat.nosave = {} --Reset data
abyssDat.nosave = t_abyssDefaultSave
	if abyssDat.save == nil or data.erase then
		abyssDat.save = {}
		for slot=1, 5 do
			abyssDat.save[slot] = t_abyssDefaultSave
		end
	end
end

--Unlocks Section
function init_unlocksStats()
if stats.unlocks == nil or data.erase then --If unlocks section does not exists
	stats.unlocks = {} --Create global space
	stats.unlocks.chars = {} --Create space for characters
	stats.unlocks.stages = {} --Create space for stages
	stats.unlocks.modes = {} --Create space for game modes
	stats.unlocks.gallery = {} --Create space for gallery items
	stats.unlocks.abyss = {} --Create space for abyss shop items
end
--If Character Unlock Data does not exists, create it:
if stats.unlocks.chars.gouki == nil or data.erase then stats.unlocks.chars.gouki = false end
--if stats.unlocks.chars.charname == nil then stats.unlocks.chars.charname = false end

--If Stage Unlock Data does not exists, create it:
if stats.unlocks.stages.trainingroom2 == nil or data.erase then stats.unlocks.stages.trainingroom2 = false end
--if stats.unlocks.stages.stagename == nil or data.erase then stats.unlocks.stages.stagename = false end

--If Story Chapter Unlock Data does not exists, create it:
if stats.unlocks.modes.story == nil or data.erase then stats.unlocks.modes.story = {} end --Create space for story chapters
if stats.unlocks.modes.story.arc2 == nil or data.erase then stats.unlocks.modes.story.arc2 = false end
--if stats.unlocks.modes.story.arcname == nil or data.erase then stats.unlocks.modes.story.arcname = false end
end
init_generalStats() --Create general stats data
init_unlocksStats() --Create Unlocks data
f_saveStats()

if host_rooms.IP == nil then
	host_rooms["IP"] = {
		["HELLO WORLD"] = "01000011.01000100.00110010.00100000.01110111.01100001.01110011.00100000.01101000.01100101.01110010.01100101",
		["LOCAL HOST"] = "localhost"
	}
	f_saveOnlineRooms()
end

function f_getProgress(dat, items, class)
	local t_data = dat
	local t_items = items
	local class = class
	--local total = 0
	local clearCount = 0
	local percentage = 0
	for key, value in pairs(t_data) do
		--total = total + 1
		if type(value) == "boolean" then
			--if value.clearall then clearCount = clearCount + 1 end
		elseif type(value) == "table" then
			if value.clear then clearCount = clearCount + 1 end
		end
	end
	percentage = math.floor((clearCount * 100 / #t_items) + 0.5)
	--if total > 0 then
		--percentage = math.floor((clearCount * 100 / total) + 0.5)
	--end
	if class == "percentage" then
		return percentage
	elseif class == "clearcount" then
		return clearCount
	end
end

--[[stats data
function f_storeStats()
	local cleared = false
	if t_clearCondition[gamemode()] ~= nil then
		cleared = t_clearCondition[gamemode()]()
	end
	if stats.modes == nil then
		stats.modes = {}
	end
--play time
	stats.playtime = f_round((stats.playtime or 0) + t_savedData.time.total / 60, 2)
--mode play time
	if stats.modes[gamemode()] == nil then
		stats.modes[gamemode()] = {}
	end
	local t = stats.modes[gamemode()]
	t.playtime = f_round((t.playtime or 0) + t_savedData.time.total / 60, 2)
	if t_sortRanking[gamemode()] == nil or t_hiscoreData[gamemode()] == nil then
		return cleared, -1 --mode can't be cleared
	end
--number times cleared
	if cleared then
		t.clear = (t.clear or 0) + 1
	elseif t.clear == nil then
		t.clear = 0
	end
--team leader mode cleared count
	if t.clearcount == nil then
		t.clearcount = {}
	end
	if cleared then
		local leader = f_getCharData(p[1].t_selected[1].ref).char:lower()
		t.clearcount[leader] = (t.clearcount[leader] or 0) + 1
	end
--ranking data exceptions
	if t_hiscoreData[gamemode()].data == 'score' and t_savedData.score.total[1] == 0 then
		return cleared, -1
	end
	if t_hiscoreData[gamemode()].data == 'win' and t_savedData.win[1] == 0 then
		return cleared, -1
	end
	if not cleared and rankingCondition then
		return cleared, -1 --only winning produces ranking data
	end
	if t_savedData.debugflag[1] then
		return cleared, -1 --using debug keys disables high score table registering
	end
--rankings
	t.ranking = f_formattedTable(
		t.ranking,
		{
			score = t_savedData.score.total[1],
			time = f_round(t_savedData.time.total / 60, 2),
			name = t_savedData.name or '',
			chars = f_listCharRefs(p[1].t_selected),
			tmode = p[1].teamMode,
			ailevel = config.Difficulty,
			win = t_savedData.win[1],
			lose = t_savedData.lose[1],
			consecutive = t_savedData.consecutive[1],
			flag = true,
		},
		t_sortRanking[gamemode()],
		rankingvisibleitems
	)
	local place = 0
	for k, v in ipairs(t.ranking) do
		if v.flag then
			place = k
			v.flag = nil
			break
		end
	end
	return cleared, place
end
]]
--;===========================================================
--; EXTERNAL LUA CODE
--;===========================================================
function f_loadLuaMods(bool)
	local t_luaExternalMods = {}
	local matchload = bool or false
	local excludeFile = false
	function f_loadExternalModules(path)
		if path == nil or path == "" then return end
		for item in lfs.dir(path) do --For each item readed in path
			if item ~= "." and item ~= ".." and item ~= ".keep" then --exclude items
				local details = path.."/"..item --Get path and file name
				local attribute = lfs.attributes(details) --Get atributes from items readed
				if attribute ~= nil then
					assert(type(attribute) == "table")
					f_loadExternalModules(details)
					if attribute.mode == "file" then --If the item have "file" attribute
						if item:match('^.*(%.)[Ll][Uu][Aa]$') then
						--Check if the file contains a specific line to load a module
							local file = io.open(details, "r")
							excludeFile = true
							if file then
								for line in file:lines() do
									if (matchload and line:find("local includeLuaMatch = true")) or (not matchload and line:find("local loadLuaModule = true")) then
										excludeFile = false
										break
									end
								end
								file:close()
							end
						--Only add the module if contains "loadlua" line and if contain the "include" line when enter in a match
							if not excludeFile then
								row = #t_luaExternalMods+1
								t_luaExternalMods[row] = {}
								t_luaExternalMods[row]['folder'] = path
								t_luaExternalMods[row]['path'] = details
								t_luaExternalMods[row]['name'] = item:gsub('^(.*)[%.][Ll][Uu][Aa]$', '%1')
							end
						end
					end
				end
			end
		end
		if data.debugLog then f_printTable(t_luaExternalMods, 'save/debug/t_luaExternalMods.log') end
	end
--Loads modules from the paths specified in luaModulesPath screenpack.lua
	for mods=1, #luaModulesPath do
		f_loadExternalModules(luaModulesPath[mods])
	end
--Run the modules that were loaded
	for _, v in ipairs(t_luaExternalMods) do
		--require(v.path:gsub('[/\\]+', '.'))
		assert(loadfile(v.path))()
	end
end
require("script.screenpack") --Load screenpack assets
require("script.options") --Load options script
--;===========================================================
--; DISCORD RICH PRESENCE API
--;===========================================================
discordRPC = require("discordRPC") --Load LUA Wrapper Module for Discord Rich Presence API
discordGameID = "1200228516554346567" --Discord App ID
discordLargeImageReset = "gameicon"
discordLargeImageTextReset = "Suehiro's IKEMEN S-SIZE Engine"
discordSmallImageReset = "" --nil
discordSmallImageTextReset = "" --nil
discordDetailsReset = ""
discordStateReset = "Single Player"
discordPartySizeReset = 1
discordPartyMaxReset = 0
discord = {
--Name of the uploaded image for the big profile artwork (max text length: 31)
	largeImageKey = discordLargeImageReset,
		
--Tooltip for largeImageKey (max text length: 127)
	largeImageText = discordLargeImageTextReset,
		
--Name of the uploaded image for the mini profile artwork (max text length: 31)
	--smallImageKey = discordSmallImageReset,
		
--Tooltip for smallImageKey (max text length: 127)
	--smallImageText = discordSmallImageTextReset,
		
--What the player is currently doing (max text length: 127)
	details = "Making the 2D Fighting Game of my Dreams!",
		
--Current Match Elapsed Time from Start
	--startTimestamp = os.time(os.date("*t")),
		
--Current Match Remaining Time to End
	--endTimestamp = 99,
		
--Current Netplay Status (max text length: 127)
	state = discordStateReset,
		
--Current Players in Netplay Lobby
	partySize = discordPartySizeReset,
		
--Lobby Max Capacity
	partyMax = discordPartyMaxReset,
		
--Public Lobby ID (max text length: 127)
	--partyId = "ikemen1234",
		
--Private Lobby ID (max text length: 127)
	--matchSecret = "xyzzy",
		
--Unique hashed string for chat invitations and Ask to Join Button (max text length: 127)
	--joinSecret = "join",
		
--Spectate Button (max text length: 127)
	--spectateSecret = "spectate",
		
--Notify Button
	--instance = 0,
}
function f_discordInit()
	discordRPC.initialize(discordGameID, true) --Initialize Discord Rich Presence Using App ID
	nextDiscordUpdate = 0
	discordRPC.updatePresence(discord)
	discordRPC.runCallbacks()
	if not data.discordPresence then discordRPC.clearPresence() end
end

function f_discordUpdate(t_changes)
--Check that argument is a table
	if type(t_changes) ~= "table" or not data.discordPresence then return end
	for key, value in pairs(t_changes) do --Each argument need to match with original discord table values to update
		discord[key] = value --Overwrite discord table
	end
	if data.debugLog then f_printTable(discord, 'save/debug/t_discordRichPresence.log') end
	discordRPC.updatePresence(discord)
	discordRPC.runCallbacks()
	--nextDiscordUpdate = os.clock() + 2.0 --Reset real-time update
end

function f_discordRealTimeUpdate() --Update Discord Rich Presence each 2.0 seconds
	if data.discordPresence then
		if os.clock() > nextDiscordUpdate then
			discordRPC.updatePresence(discord)
			nextDiscordUpdate = os.clock() + 2.0
		end
		discordRPC.runCallbacks()
	end
end

function f_discordMainMenu()
f_discordUpdate({
		details = "Main Menu", state = discordStateReset,
		largeImageKey = discordLargeImageReset, largeImageText = discordLargeImageTextReset,
		smallImageKey = discordSmallImageReset, smallImageText = discordSmallImageTextReset,
		partySize = discordPartySizeReset, partyMax = discordPartyMaxReset
	})
end