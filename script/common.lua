--;===========================================================
--; LIBRARY DEFINITION
--;===========================================================
lfs = require("lfs") --load lfs.dll
package.path = package.path..";./lib/ltn12.lua" --load ltn12 lua library
ltn12 = require("ltn12")
package.path = package.path..";./lib/dkjson.lua" --load dkjson lua library
dkjson = require("dkjson")
json = (loadfile "lib/dkjson.lua")() --One-time load of the json routines
--[[
package.path = package.path..";./lib/net/http.lua"
http = require("http")
package.path = package.path..";./lib/net/socket.lua"
socket = require("socket")
package.path = package.path..";./lib/net/ftp.lua"
ftp = require("ftp")
package.path = package.path..";./lib/net/headers.lua"
headers = require("headers")
package.path = package.path..";./lib/net/mbox.lua"
mbox = require("mbox")
package.path = package.path..";./lib/net/mime.lua"
mime = require("mime")
package.path = package.path..";./lib/net/smtp.lua"
smtp = require("smtp")
package.path = package.path..";./lib/net/tp.lua"
tp = require("tp")
package.path = package.path..";./lib/net/url.lua"
url = require("url")
]]
--;===========================================================
--; DATA DEFINITION
--;===========================================================
data = require("save.data") --Create global space variable (accessing variables between modules)
vn = require("save.vn") --Create global space variable (accessing variables between visual novel modules)

--[[Require function, allows use the content inside in the script said.
The begin of the script called need to have this:

module(..., package.seeall)
]]

--Set Save Path Variables
saveCoreCfgPath = "save/config.ssz"
saveNetCoreCfgPath = "save/configNet.ssz"
saveCfgPath = "save/data_sav.lua"
saveNetCfgPath = "save/data_netsav.lua"
saveHostRoomPath = "save/host_rooms.json"
saveTempPath = "save/temp_sav.lua"
saveTrainingPath = "save/training_sav.lua"
saveStatsPath = "save/stats_sav.json"
saveTourneyPath = "save/tourney_sav.lua"
saveVNPath = "save/vn_sav.lua"

--;===========================================================
--; COMMON FUNCTIONS DEFINITION
--;===========================================================
--Constants/Standards
gameTick = 20

--shortcut for creating new text with minimal parameters (for width calculation)
function createTextImgLite(font, text, scaleX, scaleY)
	local ti = textImgNew()
	textImgSetFont(ti, font)
	textImgSetText(ti, text)
	scaleX = scaleX or 1
	scaleY = scaleY or 1
	textImgSetScale(ti, scaleX, scaleY)
	return ti
end

--shortcut for creating new text with several parameters
function createTextImg(font, bank, aline, text, x, y, scaleX, scaleY, alphaS, alphaD)
	local ti = textImgNew()
	textImgSetFont(ti, font)
	textImgSetBank(ti, bank)
	textImgSetAlign(ti, aline)
	textImgSetText(ti, text)
	textImgSetPos(ti, x, y)
	scaleX = scaleX or 1
	scaleY = scaleY or 1
	textImgSetScale(ti, scaleX, scaleY)
	alphaS = alphaS or 255
	alphaD = alphaD or 0
	textImgSetAlpha(ti, alphaS, alphaD)
	return ti
end

--textImgDraw at specified coordinates
function textImgPosDraw(ti, x, y)
	textImgSetPos(ti, x, y)
	textImgDraw(ti)
end

--textImgDraw at specified coordinates + Scale
function textImgScalePosDraw(ti, x, y, scaleX, scaleY)
	textImgSetPos(ti, x, y)
	scaleX = scaleX or 1
	scaleY = scaleY or 1
	textImgSetScale(ti, scaleX, scaleY)
	textImgDraw(ti)
end

--shortcut for updating text with several parameters
function f_updateTextImg(animName, font, bank, aline, text, x, y, scaleX, scaleY, alphaS, alphaD)
	textImgSetFont(animName, font)
	textImgSetBank(animName, bank)
	textImgSetAlign(animName, aline)
	textImgSetText(animName, text)
	textImgSetPos(animName, x, y)
	scaleX = scaleX or 1
	scaleY = scaleY or 1
	textImgSetScale(animName, scaleX, scaleY)
	alphaS = alphaS or 255
	alphaD = alphaD or 0
	textImgSetAlpha(animName, alphaS, alphaD)
	return animName
end

--shortcut for updating text velocity
function f_textVelocity(animName, addX, addY)
	textImgAddPos(animName, addX, addY)
	textImgDraw(animName)
	return animName
end

--shortcut for draw new text with all parameters
function f_drawQuickText(id, font, bank, aline, text, x, y, scaleX, scaleY, alphaS, alphaD)
	local id = textImgNew()
	textImgSetFont(id, font)
	textImgSetBank(id, bank)
	textImgSetAlign(id, aline)
	textImgSetText(id, text)
	textImgSetPos(id, x, y)
	scaleX = scaleX or 1
	scaleY = scaleY or 1
	textImgSetScale(id, scaleX, scaleY)
	alphaS = alphaS or 255
	alphaD = alphaD or 0
	textImgSetAlpha(id, alphaS, alphaD)
	textImgDraw(id)
	return id
end

--- Draw string letter by letter + wrap lines.
-- @data: text data
-- @str: string (text you want to draw)
-- @counter: external counter (values should be increased each frame by 1 starting from 1)
-- @x: first line X position
-- @y: first line Y position
-- @spacing: spacing between lines (rendering Y position increasement for each line)
-- @delay (optional): ticks (frames) delay between each letter is rendered, defaults to 0 (all text rendered immediately)
-- @limit (optional): maximum line length (string wraps when reached), if omitted line wraps only if string contains '\n'
function f_textRender(data, str, counter, x, y, spacing, delay, limit)
	local delay = delay or 0
	local limit = limit or -1
	str = tostring(str)
	if limit == -1 then
		str = str:gsub('\\n', '\n')
	else
		str = str:gsub('%s*\\n%s*', ' ')
		if math.floor(#str / limit) + 1 > 1 then
			str = f_wrap(str, limit, indent, indent1)
		end
	end
	local subEnd = math.floor(#str - (#str - counter/delay))
	local t = {}
	for line in str:gmatch('([^\r\n]*)[\r\n]?') do
		t[#t+1] = line
	end
	t[#t] = nil --get rid of the last blank line
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
		textImgSetText(data, t[i])
		textImgSetPos(data, x, y + spacing * (i - 1))
		textImgDraw(data)
	end
	return lengthCnt --We gonna use this in Visual Novel Features
end

--shortcut for draw text for character select
function f_drawSelectName(id, t, x, y, scaleX, scaleY, color)
	scaleX = scaleX or 0.8
	scaleY = scaleY or 0.8
	color = color or 5
	textImgSetText(id, f_getName(t.cel))
	textImgSetPos(id, x, y)
	textImgSetScale(id, scaleX, scaleY)
	textImgSetBank(id, color)
	textImgDraw(id)
	x = x
	y = y
	return x, y
end

--shortcut for draw player name texts for character select functions in list format
function f_drawNameList(id, bank, t, x, y, spacingX, spacingY, rowUnique, bankUnique, scaleX, scaleY)
	for i=1, #t do
		textImgSetText(id, f_getName(t[i].cel)) --t[i].cel get all names of table inserted
		textImgSetPos(id, x, y)
		scaleX = scaleX or 0.8
		scaleY = scaleY or 0.8
		textImgSetScale(id, scaleX, scaleY)
		if rowUnique ~= nil then
			if i == rowUnique then
				textImgSetBank(id, bank) --Color when cursor is over text
			else
				textImgSetBank(id, bankUnique) --Color of text when cursor is not over text
			end
		else
			textImgSetBank(id, bank)
		end
		textImgDraw(id)
		x = x + spacingX
		y = y + spacingY
	end
	return x, y
end

--animDraw at specified coordinates
function animPosDraw(a, x, y)
	animSetPos(a, x, y)
	animUpdate(a)
	animDraw(a)
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
function f_drawQuickSpr(data, x, y, scaleX, scaleY, alphaS, alphaD)
	if data ~= nil then
		scaleX = scaleX or 1
		scaleY = scaleY or 1
		alphaS = alphaS or 255
		alphaD = alphaD or 0
		animSetScale(data, scaleX, scaleY)
		animSetAlpha(data, alphaS, alphaD)
		animSetPos(data, x, y)
		animUpdate(data)
		animDraw(data)
		return true
	end
	return false
end

--shortcut for draw sprites with trans values quickly
function f_quickAlpha(data, alphaS, alphaD)
	if data ~= nil then
		alphaS = alphaS or 255
		alphaD = alphaD or 0
		animSetAlpha(data, alphaS, alphaD)
		animUpdate(data)
		animDraw(data)
		return true
	end
	return false
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
	local toFile = toFile or 'save/debug/table_print.txt'
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
	local toFile = toFile or 'save/debug/var_print.txt'
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

--;===========================================================
--; DATA LOADING
--;===========================================================
--Load saved variables
assert(loadfile(saveCfgPath))() --assert loadfile, allows load the content stored in script said. The script must not have any module load.
assert(loadfile(saveTrainingPath))() --training data
assert(loadfile(saveTourneyPath))() --tournament data
assert(loadfile(saveVNPath))() --visual novel data
assert(loadfile(saveTempPath))() --temp data

--Data loading from host_rooms.json
local file = io.open(saveHostRoomPath,"r")
host_rooms = json.decode(file:read("*all"))
file:close()

--Data loading from vn_sav.lua
local vnFile = io.open(saveVNPath,"r")
s_vndataLUA = vnFile:read("*all")
vnFile:close()

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

--Data loading from stats.json
stats = json.decode(f_fileRead(saveStatsPath))

--;===========================================================
--; DISCORD RICH PRESENCE DEFINITION
--;===========================================================
discordGameID = "1200228516554346567" --Discord AppID
discordGameState = "In Logos" --Game State
discordGameDetails = "Create Advanced MUGENS or your own Fighting Game!" --Game State Details
discordGameBigImg = "gameicon" --Discord App Game Icon
discordGameAbout = "Game Name" --Game Description
discordGameMiniIcon = "charactericon" --Discord App Mini Icon
discordGameMiniTxt = "character name" --Mini Icon Description
discordPublicRoomID = "party1234" --Public Room ID
discordPrivateRoomID = "xyzzy" --Private Room ID
discordPrivateJoin = "join" --
discordPrivateWatch = "look" --
discordRoomMax = 2 --Room Max Capacity
discordRoomSize = 0 --Room Capacity. Add 1 when online mode with rich presence works
discordGameInstance = 0 --???

--[[
discordInit(discordGameID) --Start Discord Rich Presence
discordUpdate() --Update Discord Rich Presence
discordEnd() --End Discord Rich Presence
setDiscordState(discordGameState)
setDiscordDetails(discordGameDetails)
setDiscordBigImg(discordGameBigImg)
setDiscordBigTxt(discordGameAbout)
setDiscordMiniImg(discordGameMiniIcon)
setDiscordMiniTxt(discordGameMiniTxt)
setDiscordPartyID(discordPublicRoomID)
setDiscordSecretID(discordPrivateRoomID)
setDiscordSecretJoin(discordPrivateJoin)
setDiscordSecretWatch(discordPrivateWatch)
setDiscordPartyMax(discordRoomMax)
setDiscordPartySize(discordRoomSize)
setDiscordInstance(discordGameInstance)
]]

--;===========================================================
--; INPUT STUFF
--;===========================================================
inputdia = inputDialogNew()
data.p1In = 1
data.p2In = 2 --Activate Player 2 Control in Menus

function setCommand(c)
	commandAdd(c, 'u', '$U')
	commandAdd(c, 'd', '$D')
	commandAdd(c, 'l', '$B')
	commandAdd(c, 'r', '$F')
	commandAdd(c, 'a', 'a')
	commandAdd(c, 'b', 'b')
	commandAdd(c, 'c', 'c')
	commandAdd(c, 'x', 'x')
	commandAdd(c, 'y', 'y')
	commandAdd(c, 'z', 'z')
	commandAdd(c, 'q', 'q') --LT/SCREENSHOT
	commandAdd(c, 'w', 'w') --RT/CONFIRM
	commandAdd(c, 'e', 'e') --SELECT/RETURN
	commandAdd(c, 's', 's') --START/PAUSE
	commandAdd(c, 'holdu', '/U') --bufu
	commandAdd(c, 'holdd', '/D') --bufd
	commandAdd(c, 'holdl', '/B') --bufl
	commandAdd(c, 'holdr', '/F') --bufr
	commandAdd(c, 'holda', '/a') --bufa
	commandAdd(c, 'holdb', '/b') --bufb
	commandAdd(c, 'holdc', '/c') --bufc
	commandAdd(c, 'holdx', '/x') --bufx
	commandAdd(c, 'holdy', '/y') --bufy
	commandAdd(c, 'holdz', '/z') --bufz
	commandAdd(c, 'holdq', '/q') --bufq
	commandAdd(c, 'holdw', '/w') --bufw
	commandAdd(c, 'holde', '/e') --bufe
	commandAdd(c, 'holds', '/s') --bufs
	commandAdd(c, 'relu', '~U')
	commandAdd(c, 'reld', '~D')
	commandAdd(c, 'rell', '~B')
	commandAdd(c, 'relr', '~F')
	commandAdd(c, 'rela', '~a')
	commandAdd(c, 'relb', '~b')
	commandAdd(c, 'relc', '~c')
	commandAdd(c, 'relx', '~x')
	commandAdd(c, 'rely', '~y')
	commandAdd(c, 'relz', '~z')
	commandAdd(c, 'relq', '~q')
	commandAdd(c, 'relw', '~w')
	commandAdd(c, 'rele', '~e')
	commandAdd(c, 'rels', '~s')
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

function cmdInput()
	commandInput(p1Cmd, data.p1In)
	commandInput(p2Cmd, data.p2In)
	if f5Key() and data.debugMode then assert(loadfile("script/screenpack.lua"))() end --Refresh Screenpack file in Real Time
	if commandGetState(p1Cmd, 'q') or commandGetState(p2Cmd, 'q') then f_screenShot() end --Take Screenshot in any menu (if you have control)
end

--returns value depending on button pressed (a = 1; a + start = 7 etc.)
function btnPalNo(cmd)
	local s = 0
	if commandGetState(cmd, 'holds') then s = 6 end
	if commandGetState(cmd, 'a') then return 1 + s end
	if commandGetState(cmd, 'b') then return 2 + s end
	if commandGetState(cmd, 'c') then return 3 + s end
	if commandGetState(cmd, 'x') then return 4 + s end
	if commandGetState(cmd, 'y') then return 5 + s end
	if commandGetState(cmd, 'z') then return 6 + s end
	if commandGetState(cmd, 'w') then return 1 + s end --It is not in the correct place, this is just to don't rewrite it in each menu
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

--Keyboard conversion table (Currently Unused)
t_inputConvert = {
	{num = '4', text = 'A'},
	{num = '5', text = 'B'},
	{num = '6', text = 'C'},
	{num = '7', text = 'D'},
	{num = '8', text = 'E'},
	{num = '9', text = 'F'},
	{num = '10', text = 'G'},
	{num = '11', text = 'H'},
	{num = '12', text = 'I'},
	{num = '13', text = 'J'},
	{num = '14', text = 'K'},
	{num = '15', text = 'L'},
	{num = '16', text = 'M'},
	{num = '17', text = 'N'},
	{num = '18', text = 'O'},
	{num = '19', text = 'P'},
	{num = '20', text = 'Q'},
	{num = '21', text = 'R'},
	{num = '22', text = 'S'},
	{num = '23', text = 'T'},
	{num = '24', text = 'U'},
	{num = '25', text = 'V'},
	{num = '26', text = 'W'},
	{num = '27', text = 'X'},
	{num = '28', text = 'Y'},
	{num = '29', text = 'Z'},
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
}

--Converts inputs between ID and text.
function f_inputConvert(input, swapTo)
	output = nil
	if (swapTo == 'num' and tonumber(input) ~= nil) or (swapTo == 'text' and tonumber(input) == nil) then
		output = input
	else
		for i=1, #t_inputConvert do
			if swapTo == 'text' and input == t_inputConvert[i].num then --Number to text
				output = t_inputConvert[i].text
			elseif swapTo == 'num' and input == t_inputConvert[i].text then --Text to number
				output = t_inputConvert[i].num
			end
			if output ~= nil then i = #t_inputConvert end
		end
	end
	return output
end

--;===========================================================
--; OPTIONS VARIABLES
--;===========================================================
resolutionWidth = tonumber(s_configSSZ:match('const int Width%s*=%s*(%d+)'))
resolutionHeight = tonumber(s_configSSZ:match('const int Height%s*=%s*(%d+)'))
data.p1Gamepad = tonumber(s_configSSZ:match('in%.new%[2%]%.set%(\n%s*(%-*%d+)'))
data.p2Gamepad = tonumber(s_configSSZ:match('in%.new%[3%]%.set%(\n%s*(%-*%d+)'))

gl_vol = math.floor(tonumber(s_configSSZ:match('const float GlVol%s*=%s*(%d%.*%d*)') * 100))
se_vol = math.floor(tonumber(s_configSSZ:match('const float SEVol%s*=%s*(%d%.*%d*)') * 100))
bgm_vol = math.floor(tonumber(s_configSSZ:match('const float BGMVol%s*=%s*(%d%.*%d*)') * 100))
pan_str = math.floor(tonumber(s_configSSZ:match('const float PanStr%s*=%s*(%d%.*%d*)') * 100))

gl_vol = f_minMax(gl_vol,0,100)
se_vol = f_minMax(se_vol,0,100)
bgm_vol = f_minMax(bgm_vol,0,100)

if pan_str < 20 then
	pan_str = 0
elseif pan_str >= 20 and pan_str < 60 then
	pan_str = 40
elseif pan_str >= 60 and pan_str < 100 then
	pan_str = 80
elseif pan_str >= 100 and pan_str < 140 then
	pan_str = 120
elseif pan_str >= 140 then
	pan_str = 160
end

--Move options script vars here

--;===========================================================
--; LOAD SCREENPACK ASSETS
--;===========================================================
require("script.screenpack")

--;===========================================================
--; STORYBOARD DEFINITION
--;===========================================================
t_data = {} --stores all SFF, SND, FNT data structures

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
	if data.debugLog then f_printTable(t, 'save/debug/storyboard/t_' .. fileName) end
	f_storyboardPlay(t)
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
		if t_data[tOut.sff] == nil then
			t_data[tOut.sff] = sffNew(tOut.sff)
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
		if t_data[tOut.snd] == nil then
			t_data[tOut.snd] = sndNew(tOut.snd)
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
			if t_data[tOut.fnt[i_s]] == nil then
				t_data[tOut.fnt[i_s]] = fontNew(tOut.fnt[i_s])
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
				posOut['animData'] = animNew(t_data[tOut.sff], anim)
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
			--IKEMEN feature: additional optional parameters:
			-- spacing: spacing between lines (rendering Y position increasement for each line), defaults to 20
			-- limit: maximum line length (string wraps when reached), if omitted line wraps only if string contains '\n'
			-- scaleX: X scale factor, defaults to 1.0
			-- scaleY: Y scale factor, defaults to 1.0
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
				textImgSetFont(posOut['fontData'], t_data[tOut.fnt[font]])
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
				posOut['bgData'] = animNew(t_data[tOut.sff], anim)
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
	if data.debugLog then f_printTable(tOut, 'save/debug/t_storyboard.txt') end
	local velX = 0
	local velY = 0
	for i=tOut.startscene, #tOut.scenes do
		for j=0, tOut.scenes[i].endTime do
			if esc() or commandGetState(p1Cmd, 'w') or commandGetState(p2Cmd, 'w') then --Skip Button
				cmdInput()
				refresh()
				return
			end
			if j == 0 and tOut.scenes[i].bgm ~= nil then
				playBGM(tOut.scenes[i].bgm)
			end
			for k=1, #tOut.scenes[i].sounds do
				if j == tOut.scenes[i].sounds[k].starttime then
					sndPlay(t_data[tOut.snd], tOut.scenes[i].sounds[k].group, tOut.scenes[i].sounds[k].sound)
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
--; LOAD VISUAL NOVEL DATA
--;===========================================================
function f_vnLoad(path)
t_vnBoxText = {}
local t = {}
local section = 0
local file = io.open(path,"r")
local content = file:read("*all")
file:close()
content = content:gsub('([^\r\n]*)%s*;[^\r\n]*', '%1')
content = content:gsub('\n%s*\n', '\n')

--[[
function f_newVNBox()
chapt = #t_vnBoxText+1 --Add chapter to the table
t_vnBoxText[chapt] = {} --Create sub-table to store content from this chapter
end
]]

for line in content:gmatch('[^\r\n]+') do
	--storyname = string
	if line:match('^%s*storyname%s*=') then
		section = 1
		local data = line:gsub('%s*;.*$', '')
		if not data:match('=%s*$') then
			t_vnBoxText['storyname'] = data:gsub('^%s*storyname%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
		end
	elseif line:match('^%s*%[%s*[Cc][Hh][Aa][Pp][Tt][Ee][Rr]%s+[0-9]+$*%]') then
		section = 2
		chapt = #t_vnBoxText+1 --Add chapter to the table
		t_vnBoxText[chapt] = {} --Create sub-table to store content from this chapter
		t_vnBoxText[chapt]["data"] = {}
	elseif section == 2 then --[Chapter No]
		--id = chapterID (string)
		if line:match('^%s*id%s*=') then
			local data = line:gsub('%s*;.*$', '')
			--if not data:match('=%s*$') then
				t_vnBoxText[chapt]["data"]['id'] = data:gsub('^%s*id%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
			--end
		end
		--name = chaptername (string)
		if line:match('^%s*name%s*=') then
			local data = line:gsub('%s*;.*$', '')
			--if not data:match('=%s*$') then
				t_vnBoxText[chapt]["data"]['name'] = data:gsub('^%s*name%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
			--end
		end
		--author = chapterauthor (string)
		if line:match('^%s*author%s*=') then
			local data = line:gsub('%s*;.*$', '')
			--if not data:match('=%s*$') then
				t_vnBoxText[chapt]["data"]['author'] = data:gsub('^%s*author%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
			--end
		end
		--date = chapterdate (string)
		if line:match('^%s*date%s*=') then
			local data = line:gsub('%s*;.*$', '')
			--if not data:match('=%s*$') then
				t_vnBoxText[chapt]["data"]['date'] = data:gsub('^%s*date%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
			--end
		end
		--info = chapterdescription (string)
		if line:match('^%s*info%s*=') then
			local data = line:gsub('%s*;.*$', '')
			--if not data:match('=%s*$') then
				t_vnBoxText[chapt]["data"]['description'] = data:gsub('^%s*info%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
			--end
		end
		--snd = filename (string)
		if line:match('^%s*snd%s*=') then
			local data = line:gsub('%s*;.*$', '')
			--if not data:match('=%s*$') then
				t_vnBoxText[chapt]["data"]['snd'] = data:gsub('^%s*snd%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
			--end
		end
		--draw lua path = filename (string)
		if line:match('^%s*drawpath%s*=') then
			local data = line:gsub('%s*;.*$', '')
			--if not data:match('=%s*$') then
				t_vnBoxText[chapt]["data"]['drawPath'] = data:gsub('^%s*drawpath%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
			--end
		end
		--character = string
		if line:match('^%s*character%s*=') then
			local data = line:gsub('%s*;.*$', '')
			--if not data:match('=%s*$') then
				t_vnBoxText[chapt][#t_vnBoxText[chapt]+1] = {} --Add content filtered to the end of the "chapter" sub-table
				t_vnBoxText[chapt][#t_vnBoxText[chapt]]['character'] = data:gsub('^%s*character%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
			--end
		--video = filename (string)
		elseif line:match('^%s*video%s*=') then
			local data = line:gsub('%s*;.*$', '')
			--if not data:match('=%s*$') then
				t_vnBoxText[chapt][#t_vnBoxText[chapt]+1] = {}
				t_vnBoxText[chapt][#t_vnBoxText[chapt]]['video'] = data:gsub('^%s*video%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
			--end
		--cut = number
		elseif line:match('^%s*cut%s*=') then
			--local data = line:gsub('%s*;.*$', '')
			local num = line:match('%s([0-9]+)$')
			--if not data:match('=%s*$') then
				t_vnBoxText[chapt][#t_vnBoxText[chapt]+1] = {}
				t_vnBoxText[chapt][#t_vnBoxText[chapt]]['cut'] = tonumber(num) --data:gsub('^%s*cut%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
			--end
		--end = number
		elseif line:match('^%s*end%s*=') then
			--local data = line:gsub('%s*;.*$', '')
			local num = line:match('%s([0-9]+)$')
			--if not data:match('=%s*$') then
				t_vnBoxText[chapt][#t_vnBoxText[chapt]+1] = {}
				t_vnBoxText[chapt][#t_vnBoxText[chapt]]['ending'] = tonumber(num) --data:gsub('^%s*end%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
			--end
		end
		--side = number
		if line:match('^%s*side%s*=') then
			local num = line:match('%s([0-9]+)$')
			local data = line:gsub('%s*;.*$', '')
			if not data:match('=%s*$') then
				t_vnBoxText[chapt][#t_vnBoxText[chapt]]['side'] = tonumber(num) --data:gsub('^%s*side%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
			end
		end
		--sfx.clean = number
		if line:match('^%s*sfx.clean%s*=') then
			local num = line:match('%s([0-9]+)$')
			local data = line:gsub('%s*;.*$', '')
			if not data:match('=%s*$') then
				t_vnBoxText[chapt][#t_vnBoxText[chapt]]['sfxclean'] = tonumber(num)
			end
		end
		--sfx = group_no, index_no (int, int)
		if line:match('^%s*sfx%s*=') then
			local data = line:gsub('%s*;.*$', '')
			if not data:match('=%s*$') then
				t_vnBoxText[chapt][#t_vnBoxText[chapt]]['sfxplay'] = data:gsub('^%s*sfx%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
			end
		end
		--bgm = filename (string)
		if line:match('^%s*bgm%s*=') then
			local data = line:gsub('%s*;.*$', '')
			if not data:match('=%s*$') then
				t_vnBoxText[chapt][#t_vnBoxText[chapt]]['bgm'] = data:gsub('^%s*bgm%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
			end
		end
		--fadein = number
		if line:match('^%s*fadein%s*=') then
			local data = line:gsub('%s*;.*$', '')
			local num = line:match('%s([0-9]+)$')
			if not data:match('=%s*$') then
				t_vnBoxText[chapt][#t_vnBoxText[chapt]]['fadein'] = tonumber(num) --data:gsub('^%s*fadein%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
			end
		end
		--fadeout = number
		if line:match('^%s*fadeout%s*=') then
			local data = line:gsub('%s*;.*$', '')
			local num = line:match('%s([0-9]+)$')
			if not data:match('=%s*$') then
				t_vnBoxText[chapt][#t_vnBoxText[chapt]]['fadeout'] = tonumber(num) --data:gsub('^%s*fadeout%s*=%s*["]*%s*(.-)%s*["]*%s*$', '%1')
			end
		end
		--text: string
		if line:match('text:$') then
			t_vnBoxText[chapt][#t_vnBoxText[chapt]]['text'] = ""
		end
		if t_vnBoxText[chapt][1] then --This just avoid read [data] in the table to avoid issues with below logic
			if type(t_vnBoxText[chapt][#t_vnBoxText[chapt]].text) == 'string' then
				if t_vnBoxText[chapt][#t_vnBoxText[chapt]].text == '' then
					t_vnBoxText[chapt][#t_vnBoxText[chapt]].text = " " --line  --line get "text:" and we don't need that
				else
					t_vnBoxText[chapt][#t_vnBoxText[chapt]].text = t_vnBoxText[chapt][#t_vnBoxText[chapt]].text .. '\n' .. line
				end
			end
		end
	end
	--textImgDraw(txt_loading)
	--refresh()
end
if data.debugLog then f_printTable(t_vnBoxText, "save/debug/t_vnBoxText.txt") end
end

--;===========================================================
--; VISUAL NOVEL DEFINITION
--;===========================================================
--Common Textbox Settings
function f_resetFullVN()
VNautoSkipTime = 5 --Set Time to auto skip text (in seconds)
VNautoTxt = 0
VNtxtActive = 1
VNscroll = 0
VNnodelay = 0
VNdelay = data.VNdelay
VNskip = false
VNhide = false
VNendActive = false
VNtxtReady = false
VNtxtEnd = false
--Multimedia Control
VNbgmActive = false
VNbgmNew = false
--VNbgm = ""
VNvideoNew = false
VNvideoActive = false
--Fade Control
vnFadeInTime = 40
vnFadeOutTime = 40
vnFadeIn = false
vnFadeOut = false
vnFadeInC = 0
vnFadeOutC = 0
--Narrative Text Config
VNtxtSpacing = 9 --spacing between lines (rendering Y position increasement for each line)
VNtxtPosX = 2
VNtxtPosY = 184 --194
VNtxtBank = 0
VNtxtAlphaS = 255
VNtxtAlphaD = 0
f_vnPauseMenuReset()
f_questionResetVN()
end

function f_resetSimpleVN()
vnFadeIn = false
vnFadeOut = false
vnFadeInC = 0
vnFadeOutC = 0
f_fadeData()
--Reset Text Box
VNtxtReady = false
VNtxtActive = 1
VNscroll = 0
VNdelay = data.VNdelay
VNautoTxt = 0
end

function f_fadeData()
data.fadeIn = f_fadeAnim(vnFadeInTime, 'fadein', 'black', sprFade)
data.fadeOut = f_fadeAnim(vnFadeOutTime, 'fadeout', 'black', sprFade)
end

function f_playVNsfx()
local data = t_vnBoxText[vnChapter][VNtxt].sfxplay
local sfxGroup, sfxIndex = data:match('^([^,]-)%s*,%s*(.-)$') --Remove "" from values ​​store in the table
sndPlay(VNsfxData, sfxGroup, sfxIndex) --Play SFX
end

function f_playVNbgm()
playBGM(t_vnBoxText[vnChapter][VNtxt].bgm) --Play BGM
t_currentVNbgm = t_vnBoxText[vnChapter][VNtxt].bgm --Backup the current BGM to decide after if it will change
end

--;===========================================================
--; VISUAL NOVEL INTRO SCREEN
--;===========================================================
function f_drawVNIntro()
	playBGM("sound/System/Ranking.mp3")
	local endIntro = false
	local t = 0
	local endTime = 422
	local fadeOutTime = 50
	--Display Data
	local vnName = ""
	local chapterID = vnChapter --Use f_vnScene chaptNo
	local chapterName = ""
	local chapterAuthor = ""
	local chapterDate = ""
	local chapterDescription = ""
	if t_vnBoxText.storyname ~= nil then vnName = t_vnBoxText.storyname end
	if t_vnBoxText[vnChapter].data.id ~= nil then chapterID = t_vnBoxText[vnChapter].data.id end --Replace Chapter ID by the one detected in .def file
	if t_vnBoxText[vnChapter].data.name ~= nil then chapterName = t_vnBoxText[vnChapter].data.name end
	if t_vnBoxText[vnChapter].data.author ~= nil then chapterAuthor = t_vnBoxText[vnChapter].data.author end
	if t_vnBoxText[vnChapter].data.date ~= nil then chapterDate = t_vnBoxText[vnChapter].data.date end
	if t_vnBoxText[vnChapter].data.description ~= nil then chapterDescription = t_vnBoxText[vnChapter].data.description end
	cmdInput()
	while true do
		if (btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0) or endIntro then
			f_fadeData()
			break
		end
		if t == endTime then endIntro = true end
		textImgSetText(txt_VNarc, vnName.." Story")
		textImgSetText(txt_VNchapter, "Chapter "..chapterID)
		textImgSetText(txt_VNchapterName, chapterName)
		textImgSetText(txt_VNchapterAuthor, "Written By "..chapterAuthor)
		textImgSetText(txt_VNchapterDate, chapterDate)
		textImgSetText(txt_VNchapterInfo, chapterDescription)
		textImgDraw(txt_VNarc)
		textImgDraw(txt_VNchapter)
		textImgDraw(txt_VNchapterName)
		textImgDraw(txt_VNchapterAuthor)
		textImgDraw(txt_VNchapterDate)
		textImgDraw(txt_VNchapterInfo)
		animDraw(data.fadeIn)
		animUpdate(data.fadeIn)
		if t > endTime - fadeOutTime then
			animDraw(data.fadeOut)
			animUpdate(data.fadeOut)
		end
		t = t + 1
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; VISUAL NOVEL MAIN GAME LOGIC
--;===========================================================
function f_vnMain(vnFile, chapterNo, dialogueNo) --TODO Routes/Decisions System
	f_vnLoad(vnFile) --Load VN file
	local currentChapter = chapterNo or 1 --Set current Chapter
	local dialogueNo = dialogueNo or 1 --Set current Dialogue
	for i=currentChapter, #t_vnBoxText do --For each Chapter loaded in vnFile do
		f_vnScene(vnFile,currentChapter,dialogueNo) --Start Visual Novel Scene
		currentChapter = currentChapter + 1 --prepare next chapter
		dialogueNo = 1 --prepare dialogue number for next scene
		if data.VNbreak then f_VNback() return end --Back to main menu
	end
	if vn.credits then f_playCredits() end
	vn.credits = false
end

function f_VNback()
	data.VNbreak = false --Reset visual novel back to main menu
	--f_saveTemp()
	f_menuMusic()
	data.fadeTitle = f_fadeAnim(40, 'fadein', 'black', sprFade)
end

function f_vnProgress()
data.VNarc = vnArc
data.VNchapter = vnChapter
data.VNdialogue = VNtxt
f_saveVN()
assert(loadfile(saveVNPath))()
end

--;===========================================================
--; VISUAL NOVEL IN-GAME SCREEN
--;===========================================================
function f_vnScene(arcPath, chaptNo, dialogueNo)
	f_vnLoad(arcPath) --What Visual Novel File will load?
	--Actions when visual novel chapters are loaded
	f_resetFullVN()
	f_fadeData()
	vnArc = arcPath
	vnChapter = chaptNo --What chapter number does it start in?
	VNtxt = dialogueNo --What dialogue number does it start in?
	if data.songSelect then playBGM("") end --Keep Fight BGM (WIP)
	if dialogueNo == 1 then
		f_drawVNIntro() --Show Chapter Intro
	end
	if t_vnBoxText[vnChapter].data.snd ~= nil then --Detects if snd file is defined
		VNsfxData = sndNew(t_vnBoxText[vnChapter].data.snd) --Load snd file
	end
	cmdInput()
	while true do
		--Actions when the chapter has started
		if t_vnBoxText[vnChapter][VNtxt].cut ~= nil or VNtxtEnd then
			sndStop()
			break
		end
		if not vnPauseScreen then
			if commandGetState(p1Cmd, 's') or commandGetState(p2Cmd, 's') then
				if not VNendActive then
					vnPauseScreen = true
					sndPlay(sndSys, 100, 3)
				end
			elseif (btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0) or commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') or commandGetState(p1Cmd, 'r') or commandGetState(p2Cmd, 'r') then 
				VNdelay = VNnodelay
				if VNtxtActive == 0 then VNtxtReady = true end
			end
			if commandGetState(p1Cmd, 'holde') or commandGetState(p2Cmd, 'holde') then --Hide HUD
				VNhide = true
			else
				VNhide = false
			end
			--Auto Skip Text
			if data.VNautoSkip and VNtxtActive == 0 and VNautoTxt == VNautoSkipTime*60 then
				VNtxtReady = true
			end
		end
		--Start fade out only if is loaded by dialogue, when that dialogue is drawed and fadeOut count is reseted
		if t_vnBoxText[vnChapter][VNtxt].fadeout ~= nil and VNtxtReady and vnFadeOutC == 0 then
			vnFadeOut = true
		end
		if not vnFadeOut then
			--Load New Txt
			if VNtxt < #t_vnBoxText[vnChapter] then --Only show new text if is store in the table
				if VNtxtReady then --When text is fully drawed
					VNtxt = VNtxt + 1
					f_resetSimpleVN()
				end
			--Last Txt
			elseif VNtxt == #t_vnBoxText[vnChapter] then
				if VNtxtReady then
					VNtxtEnd = true
				end
			end
		end
		--SFX STOP
		if t_vnBoxText[vnChapter][VNtxt].sfxclean ~= nil then
			sndStop()
			t_vnBoxText[vnChapter][VNtxt].sfxclean = nil --Delete paramvalue from table after to stop to avoid cicle
		end
		--SFX PLAY
		if t_vnBoxText[vnChapter].data.snd ~= nil then --If there is a snd file defined for this chapter
			if t_vnBoxText[vnChapter][VNtxt].sfxplay ~= nil then
				f_playVNsfx()
				t_vnBoxText[vnChapter][VNtxt].sfxplay = nil --Delete paramvalue from table after to play to avoid cicle
			end
		end
		--BGM PLAY
		if not VNbgmActive then
			if t_vnBoxText[vnChapter][VNtxt].bgm ~= nil then
				f_playVNbgm()
				VNbgmActive = true
			end
		else--if VNbgmActive is true
			if t_vnBoxText[vnChapter][VNtxt].bgm ~= t_currentVNbgm and t_vnBoxText[vnChapter][VNtxt].bgm ~= nil then --If a new song is detected
				VNbgmNew = true
			end
		end
		if VNbgmNew then
			f_playVNbgm()
			VNbgmNew = false
		end
		--VIDEO PLAY
		if not VNvideoActive then
			if t_vnBoxText[vnChapter][VNtxt].video ~= nil then
				playVideo(t_vnBoxText[vnChapter][VNtxt].video)
				VNtxt = VNtxt + 1
				f_resetSimpleVN()
			end
		end
		if t_vnBoxText[vnChapter][VNtxt].video == nil then f_drawVN() end --Draw Sprites only if there is no video playing
		if not VNhide and not vnFadeIn then
			animSetAlpha(vnTxtBG, data.VNtxtBGTransS, data.VNtxtBGTransD) --Set BG Transparency
			animDraw(vnTxtBG) --Draw Text BG
			if VNtxtActive == 0 then
				animDraw(vnNext) --Draw Next Text Arrow
				animUpdate(vnNext)
			end
			--Text to Show
			if t_vnBoxText[vnChapter][VNtxt].side == 2 then
				textImgSetPos(txt_nameCfg, 320, 175) --Show Text in Right Side
				textImgSetAlign(txt_nameCfg, -1)
				textImgSetBank(txt_nameCfg, 1)
			else --Show Text in Left Side
				textImgSetPos(txt_nameCfg, 2, 175)
				textImgSetAlign(txt_nameCfg, 1)
				textImgSetBank(txt_nameCfg, 0)
			end
			if t_vnBoxText[vnChapter][VNtxt].character ~= nil then
				textImgSetText(txt_nameCfg, t_vnBoxText[vnChapter][VNtxt].character) --Set Name Text
			else
				textImgSetText(txt_nameCfg, "") --Set Empty Name Text
			end
			if data.VNdisplayName then textImgDraw(txt_nameCfg) end --Draw Name Text
			if t_vnBoxText[vnChapter][VNtxt].text ~= nil then
				VNtextData = t_vnBoxText[vnChapter][VNtxt].text --Set Narrative Text
			else
				VNtextData = "" --Set Empty Narrative Text
			end
			VNtxtActive = f_textRender(txt_boxCfg, VNtextData, VNscroll, VNtxtPosX, VNtxtPosY, VNtxtSpacing, VNdelay, -1) --Draw Narrative Text
			if data.debugMode then
				f_drawQuickText(txt_activeVar, font3, 0, 0, VNtxtActive, 163.5, 168) --For Debug Purposes
				f_drawQuickText(txt_autoVar, font3, 0, 0, string.format("%.0f",(VNautoTxt/60)), 163.5, 148) --For Debug Purposes
			end
		end
		if t_vnBoxText[vnChapter][VNtxt].ending ~= nil then
			VNendActive = true
			f_drawVNEnding() --Draw Ending Screen
		end
		if vnPauseScreen then f_vnPauseMenu() end
		if t_vnBoxText[vnChapter][VNtxt].fadein ~= nil then
			vnFadeIn = true
		end
		if vnFadeIn then
			animDraw(data.fadeIn)
			animUpdate(data.fadeIn)
			vnFadeInC = vnFadeInC + 1
			if vnFadeInC > vnFadeInTime then --Time to show dialogues when use fadein
				vnFadeIn = false
			end
		end
		if vnFadeOut then
			animDraw(data.fadeOut)
			animUpdate(data.fadeOut)
			vnFadeOutC = vnFadeOutC + 1
			if vnFadeOutC > vnFadeOutTime then
				vnFadeOut = false
			end
		end
		if not vnFadeIn then
			VNscroll = VNscroll + 1
			if data.VNautoSkip and not vnPauseScreen and VNtxtActive == 0 then VNautoTxt = VNautoTxt + 1 end
		end
		cmdInput()
		refresh()
	end
end

--;===========================================================
--; VISUAL NOVEL ASSETS DRAW LOGIC
--;===========================================================	
function f_drawVN()
	vn.vnChapter = vnChapter --to recognize chapter number in below lua module
	vn.VNtxt = VNtxt --to recognize dialogue number in below lua module
	vn.vnFadeIn = vnFadeIn
	if t_vnBoxText[vnChapter].data.drawPath ~= nil then --Detects if lua file is defined
		assert(loadfile(t_vnBoxText[vnChapter].data.drawPath))()
	end
end

--;===========================================================
--; VISUAL NOVEL ENDING SCREEN
--;===========================================================
function f_drawVNEnding()
	if t_vnBoxText[vnChapter][VNtxt].ending == 1 then animDraw(vnEnd1) --True End
	elseif t_vnBoxText[vnChapter][VNtxt].ending == 2 then animDraw(vnEnd2) --Ending
	elseif t_vnBoxText[vnChapter][VNtxt].ending == 3 then animDraw(vnEnd3) --Try Again
	end
	vn.credits = true
end

--;===========================================================
--; VISUAL NOVEL PAUSE MENU
--;===========================================================
function f_vnPauseMenu()
	if not audioCfgVNActive then
		if not questionScreenVN then
			cmdInput()
			--Cursor Position
			if commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufuVNP >= 30) then
				sndPlay(sndSys, 100, 0)
				vnPauseMenu = vnPauseMenu - 1
				if buflVNP then buflVNP = 0 end
				if bufrVNP then bufrVNP = 0 end
				VNsaveData = false
			elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufdVNP >= 30) then
				sndPlay(sndSys, 100, 0)
				vnPauseMenu = vnPauseMenu + 1
				if buflVNP then buflVNP = 0 end
				if bufrVNP then bufrVNP = 0 end
				VNsaveData = false
			end
			if vnPauseMenu < 1 then
				vnPauseMenu = #t_vnPauseMenu
				if #t_vnPauseMenu > 10 then
					cursorPosYVNP = 10
				else
					cursorPosYVNP = #t_vnPauseMenu
				end
			elseif vnPauseMenu > #t_vnPauseMenu then
				vnPauseMenu = 1
				cursorPosYVNP = 1
			elseif ((commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u')) or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufuVNP >= 30)) and cursorPosYVNP > 1 then
				cursorPosYVNP = cursorPosYVNP - 1
			elseif ((commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd')) or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufdVNP >= 30)) and cursorPosYVNP < 10 then
				cursorPosYVNP = cursorPosYVNP + 1
			end
			if cursorPosYVNP == 10 then
				moveTxtVNP = (vnPauseMenu - 10) * 15
			elseif cursorPosYVNP == 1 then
				moveTxtVNP = (vnPauseMenu - 1) * 15
			end
			if #t_vnPauseMenu <= 10 then
				maxVNP = #t_vnPauseMenu
			elseif vnPauseMenu - cursorPosYVNP > 0 then
				maxVNP = vnPauseMenu + 10 - cursorPosYVNP
			else
				maxVNP = 10
			end
			--Actions
			if esc() or vnPauseMenuBack or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') or commandGetState(p1Cmd, 's') or commandGetState(p2Cmd, 's') then
				sndPlay(sndSys, 100, 2)
				f_vnPauseMenuReset()
			elseif btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then
				if vnPauseMenu > 4 and vnPauseMenu < #t_vnPauseMenu then sndPlay(sndSys, 100, 1) end
				--Sound Settings
				if vnPauseMenu == 5 then
					cursorPosYAVN = 1
					moveTxtAVN = 0
					audioCfgVN = 1
					bufu = 0
					bufd = 0
					bufr = 0
					bufl = 0
					audioCfgVNActive = true
				--Restore Settings
				elseif vnPauseMenu == 6 then
					questionScreenVN = true
					defaultVN = true
				--Save Progress
				elseif vnPauseMenu == 7 then
					if data.engineMode == "VN" then
						f_vnProgress()
						VNsaveData = true
					else
						sndPlay(sndSys, 100, 5)
					end
				--Skip Scene
				elseif vnPauseMenu == 8 then
					VNtxtEnd = true
				--Back to Main Menu
				elseif vnPauseMenu == 9 then
					questionScreenVN = true
					exitVN = true
				--Resume
				elseif vnPauseMenu == #t_vnPauseMenu then
					vnPauseMenuBack = true
				end
			end
			--Text Speed
			if vnPauseMenu == 1 then
				if commandGetState(p1Cmd, 'r') then
					if data.VNdelay > 0 then
						sndPlay(sndSys, 100, 0)
						data.VNdelay = data.VNdelay - 1
					end
					hasChangedVN = true
				elseif commandGetState(p1Cmd, 'l') then
					if data.VNdelay < 3 then
						sndPlay(sndSys, 100, 0)
						data.VNdelay = data.VNdelay + 1
					end
					hasChangedVN = true
				end
			--Text BG Transparency
			elseif vnPauseMenu == 2 then
				if commandGetState(p1Cmd, 'r') or (commandGetState(p1Cmd, 'holdr') and bufrVNP >= 30) then
					if data.VNtxtBGTransD < 255 then
						data.VNtxtBGTransD = data.VNtxtBGTransD + 1
						data.VNtxtBGTransS = data.VNtxtBGTransS - 1
					else
						data.VNtxtBGTransD = 0
						data.VNtxtBGTransS = 255
					end
					if commandGetState(p1Cmd, 'r') then sndPlay(sndSys, 100, 0) end
						hasChangedVN = true
				elseif commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and buflVNP >= 30) then
					if data.VNtxtBGTransD > 0 then
						data.VNtxtBGTransD = data.VNtxtBGTransD - 1
						data.VNtxtBGTransS = data.VNtxtBGTransS + 1
					else
						data.VNtxtBGTransD = 255
						data.VNtxtBGTransS = 0
					end
					if commandGetState(p1Cmd, 'l') then sndPlay(sndSys, 100, 0) end
					hasChangedVN = true
				end
			--Auto Skip Text
			elseif vnPauseMenu == 3 and (btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 or commandGetState(p1Cmd, 'r') or commandGetState(p2Cmd, 'r') or commandGetState(p1Cmd, 'l') or commandGetState(p2Cmd, 'l')) then
				sndPlay(sndSys, 100, 1)
				if data.VNautoSkip then data.VNautoSkip = false else data.VNautoSkip = true end
				hasChangedVN = true
			--Display Character Name
			elseif vnPauseMenu == 4 and (btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 or commandGetState(p1Cmd, 'r') or commandGetState(p2Cmd, 'r') or commandGetState(p1Cmd, 'l') or commandGetState(p2Cmd, 'l')) then
				sndPlay(sndSys, 100, 1)
				if data.VNdisplayName then data.VNdisplayName = false else data.VNdisplayName = true end
				hasChangedVN = true
			end
		end
		--Draw Pause Menu BG
		animSetScale(vnPauseBG, 1.28, maxVNP*0.25)
		animSetWindow(vnPauseBG, 63,20, 200, 150)
		animSetAlpha(vnPauseBG, 255, 22)
		animPosDraw(vnPauseBG, 63, 20)
		--Draw Title
		textImgDraw(txt_vnPTitle)
		--Set Table Text
		if hasChangedVN then
			f_saveVN()
			f_vnCfgdisplayTxt()
			t_vnPauseMenu[2].varText = (math.floor((data.VNtxtBGTransD * 100 / 255) + 0.5)).."%"
			hasChangedVN = false
		end
		--Draw Table Text
		for i=1, maxVNP do
			if i > vnPauseMenu - cursorPosYVNP then
				if t_vnPauseMenu[i].varID ~= nil then
					textImgDraw(f_updateTextImg(t_vnPauseMenu[i].varID, font2, 0, 1, t_vnPauseMenu[i].text, 68, 15+i*15-moveTxtVNP))
					textImgDraw(f_updateTextImg(t_vnPauseMenu[i].varID, font2, 0, -1, t_vnPauseMenu[i].varText, 252, 15+i*15-moveTxtVNP))
				end
			end
		end
		--Draw Cursor
		if not questionScreenVN then
			animSetWindow(cursorBox, 64,5+cursorPosYVNP*15, 192,15)
			f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
			animDraw(f_animVelocity(cursorBox, -1, -1))
		end
		if questionScreenVN then f_questionMenuVN() else drawVNInputHints() end
		if VNsaveData then textImgDraw(txt_vnPSaved) end
		if commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu') then
			bufdVNP = 0
			bufuVNP = bufuVNP + 1
		elseif commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd') then
			bufuVNP = 0
			bufdVNP = bufdVNP + 1
		else
			bufuVNP = 0
			bufdVNP = 0
		end
		if commandGetState(p1Cmd, 'holdr') or commandGetState(p2Cmd, 'holdr') then
			buflVNP = 0
			bufrVNP = bufrVNP + 1
		elseif commandGetState(p1Cmd, 'holdl') or commandGetState(p2Cmd, 'holdl') then
			bufrVNP = 0
			buflVNP = buflVNP + 1
		else
			bufrVNP = 0
			buflVNP = 0
		end
	else
		f_audioCfgVN()
	end
end

function f_vnPauseMenuReset()
	VNsaveData = false
	hasChangedVN = false
	vnPauseMenuBack = false
	vnPauseScreen = false
	cursorPosYVNP = 1
	moveTxtVNP = 0
	vnPauseMenu = 1
	bufuVNP = 0
	bufdVNP = 0
	bufrVNP = 0
	buflVNP = 0
end

function f_restoreVNcfg()
	data.VNdelay = 3
	data.VNtxtBGTransD = 0
	data.VNtxtBGTransS = 255
	data.VNdisplayName = true
	data.VNautoSkip = false
end

--Logic to Display Text instead Int/Boolean Values
function f_vnCfgdisplayTxt()
if data.VNdelay == 3 then t_vnPauseMenu[1].varText = "Slow"
elseif data.VNdelay == 2 then t_vnPauseMenu[1].varText = "Normal"
elseif data.VNdelay == 1 then t_vnPauseMenu[1].varText = "Fast"
elseif data.VNdelay == 0 then t_vnPauseMenu[1].varText = "Instant"
end

if data.VNautoSkip then t_vnPauseMenu[3].varText = "Yes" else t_vnPauseMenu[3].varText = "No" end
if data.VNdisplayName then t_vnPauseMenu[4].varText = "Yes" else t_vnPauseMenu[4].varText = "No" end
end

f_vnCfgdisplayTxt() --Load Display Text

--;===========================================================
--; VISUAL NOVEL AUDIO SETTINGS
--;===========================================================
function f_audioCfgVN()
	if not questionScreenVN then
		cmdInput()
		if modifiedVN then f_saveSettingsVN() end
		if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
			sndPlay(sndSys, 100, 2)
			audioCfgVNActive = false
		elseif commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30) then
			sndPlay(sndSys, 100, 0)
			audioCfgVN = audioCfgVN - 1
			if bufl then bufl = 0 end
			if bufr then bufr = 0 end
		elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30) then
			sndPlay(sndSys, 100, 0)
			audioCfgVN = audioCfgVN + 1
			if bufl then bufl = 0 end
			if bufr then bufr = 0 end			
		--Master Volume
		elseif audioCfgVN == 1 then
			if commandGetState(p1Cmd, 'r') or (commandGetState(p1Cmd, 'holdr') and bufr >= 30) then
				if gl_vol < 100 then
					gl_vol = gl_vol + 1
				else
					gl_vol = 0
				end
				if commandGetState(p1Cmd, 'r') then sndPlay(sndSys, 100, 0) end
				modifiedVN = true
			elseif commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and bufl >= 30) then
				if gl_vol > 0 then
					gl_vol = gl_vol - 1
				else
					gl_vol = 100
				end
				if commandGetState(p1Cmd, 'l') then sndPlay(sndSys, 100, 0) end
				modifiedVN = true
			end
			if commandGetState(p1Cmd, 'holdr') then
				bufl = 0
				bufr = bufr + 1
			elseif commandGetState(p1Cmd, 'holdl') then
				bufr = 0
				bufl = bufl + 1
			else
				bufr = 0
				bufl = 0
			end
		--SFX Volume
		elseif audioCfgVN == 2 then
			if commandGetState(p1Cmd, 'r') or (commandGetState(p1Cmd, 'holdr') and bufr >= 30) then
				if se_vol < 100 then
					se_vol = se_vol + 1
				else
					se_vol = 0
				end
				if commandGetState(p1Cmd, 'r') then sndPlay(sndSys, 100, 0) end
				modifiedVN = true
			elseif commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and bufl >= 30) then
				if se_vol > 0 then
					se_vol = se_vol - 1
				else
					se_vol = 100
				end
				if commandGetState(p1Cmd, 'l') then sndPlay(sndSys, 100, 0) end
				modifiedVN = true
			end
			if commandGetState(p1Cmd, 'holdr') then
				bufl = 0
				bufr = bufr + 1
			elseif commandGetState(p1Cmd, 'holdl') then
				bufr = 0
				bufl = bufl + 1
			else
				bufr = 0
				bufl = 0
			end
		--BGM Volume
		elseif audioCfgVN == 3 then
			if commandGetState(p1Cmd, 'r') or (commandGetState(p1Cmd, 'holdr') and bufr >= 30) then
				if bgm_vol < 100 then
					bgm_vol = bgm_vol + 1
				else
					bgm_vol = 0
				end
				if commandGetState(p1Cmd, 'r') then sndPlay(sndSys, 100, 0) end
				modifiedVN = true
			elseif commandGetState(p1Cmd, 'l') or (commandGetState(p1Cmd, 'holdl') and bufl >= 30) then
				if bgm_vol > 0 then
					bgm_vol = bgm_vol - 1
				else
					bgm_vol = 100
				end
				if commandGetState(p1Cmd, 'l') then sndPlay(sndSys, 100, 0) end
				modifiedVN = true
			end
			if commandGetState(p1Cmd, 'holdr') then
				bufl = 0
				bufr = bufr + 1
			elseif commandGetState(p1Cmd, 'holdl') then
				bufr = 0
				bufl = bufl + 1
			else
				bufr = 0
				bufl = 0
			end
		--Audio Panning
		elseif audioCfgVN == 4 then
			if commandGetState(p1Cmd, 'r') and pan_str < 160 then
				sndPlay(sndSys, 100, 0)
				pan_str = pan_str + 40
				modifiedVN = true
			elseif commandGetState(p1Cmd, 'l') and pan_str > 0 then
				sndPlay(sndSys, 100, 0)
				pan_str = pan_str - 40
				modifiedVN = true
			end
			setPanStr(pan_str / 100)
		--Default Values
		elseif audioCfgVN == 5 and (btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0) then
			sndPlay(sndSys, 100, 1)
			questionScreenVN = true
			defaultAudioVN = true
		--BACK
		elseif audioCfgVN == #t_audioCfg and (btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0) then
			audioCfgVNActive = false
			sndPlay(sndSys, 100, 2)
		end
		if audioCfgVN < 1 then
			audioCfgVN = #t_audioCfg
			if #t_audioCfg > 14 then
				cursorPosYAVN = 14
			else
				cursorPosYAVN = #t_audioCfg
			end
		elseif audioCfgVN > #t_audioCfg then
			audioCfgVN = 1
			cursorPosYAVN = 1
		elseif ((commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u')) or ((commandGetState(p1Cmd, 'holdu') or commandGetState(p2Cmd, 'holdu')) and bufu >= 30)) and cursorPosYAVN > 1 then
			cursorPosYAVN = cursorPosYAVN - 1
		elseif ((commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd')) or ((commandGetState(p1Cmd, 'holdd') or commandGetState(p2Cmd, 'holdd')) and bufd >= 30)) and cursorPosYAVN < 14 then
			cursorPosYAVN = cursorPosYAVN + 1
		end
		if cursorPosYAVN == 14 then
			moveTxtAVN = (audioCfgVN - 14) * 15
		elseif cursorPosYAVN == 1 then
			moveTxtAVN = (audioCfgVN - 1) * 15
		end
		if #t_audioCfg <= 14 then
			maxAudioCfgVN = #t_audioCfg
		elseif audioCfgVN - cursorPosYAVN > 0 then
			maxAudioCfgVN = audioCfgVN + 14 - cursorPosYAVN
		else
			maxAudioCfgVN = 14
		end
	end
	animSetScale(vnPauseBG, 1.28, maxAudioCfgVN*0.25)
	animSetWindow(vnPauseBG, 63,20, 200, 150)
	animSetAlpha(vnPauseBG, 255, 22)
	animPosDraw(vnPauseBG, 63, 20)
	textImgDraw(txt_audioCfg)
	if not questionScreenVN then
		animSetWindow(cursorBox, 64,5+cursorPosYAVN*15, 192,15)
		f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
		animDraw(f_animVelocity(cursorBox, -1, -1))
	end	
	t_audioCfg[1].varText = gl_vol.."%"
	t_audioCfg[2].varText = se_vol.."%"
	t_audioCfg[3].varText = bgm_vol.."%"
	t_audioCfg[4].varText = t_panStr[math.ceil((pan_str + 1) * 0.025)]
	setVolume(gl_vol / 100, se_vol / 100, bgm_vol / 100)		
	setPanStr(pan_str / 100)
	for i=1, maxAudioCfgVN do
		if i > audioCfgVN - cursorPosYAVN then
			if t_audioCfg[i].varID ~= nil then
				textImgDraw(f_updateTextImg(t_audioCfg[i].varID, font2, 0, 1, t_audioCfg[i].text, 85, 15+i*15-moveTxtAVN))
				textImgDraw(f_updateTextImg(t_audioCfg[i].varID, font2, 0, -1, t_audioCfg[i].varText, 235, 15+i*15-moveTxtAVN))
			end
		end
	end
	if questionScreenVN then f_questionMenuVN() else drawVNInputHints2() end
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
end

--Data saving to config.ssz
function f_saveSettingsVN()
	s_configSSZ = s_configSSZ:gsub('const float GlVol%s*=%s*%d%.*%d*', 'const float GlVol = ' .. gl_vol / 100)
	s_configSSZ = s_configSSZ:gsub('const float SEVol%s*=%s*%d%.*%d*', 'const float SEVol = ' .. se_vol / 100)
	s_configSSZ = s_configSSZ:gsub('const float BGMVol%s*=%s*%d%.*%d*', 'const float BGMVol = ' .. bgm_vol / 100)
	s_configSSZ = s_configSSZ:gsub('const float PanStr%s*=%s*%d%.*%d*', 'const float PanStr = ' .. pan_str / 100)
	local file = io.open(saveCoreCfgPath,"w+")
	file:write(s_configSSZ)
	file:close()
	modifiedVN = false
end

--;===============================================================
--; VISUAL NOVEL EXIT/DEFAULT VALUES MESSAGE
--;===============================================================
function f_questionMenuVN()
	cmdInput()
	--Cursor Position
	if commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u') then
		sndPlay(sndSys, 100, 0)
		questionMenuVN = questionMenuVN - 1
	elseif commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd') then
		sndPlay(sndSys, 100, 0)
		questionMenuVN = questionMenuVN + 1
	end
	if questionMenuVN < 1 then
		questionMenuVN = #t_questionMenuVN
		if #t_questionMenuVN > 4 then
			cursorPosYQuestionVN = 4
		else
			cursorPosYQuestionVN = #t_questionMenuVN-1
		end
	elseif questionMenuVN > #t_questionMenuVN then
		questionMenuVN = 1
		cursorPosYQuestionVN = 0
	elseif (commandGetState(p1Cmd, 'u') or commandGetState(p2Cmd, 'u')) and cursorPosYQuestionVN > 0 then
		cursorPosYQuestionVN = cursorPosYQuestionVN - 1
	elseif (commandGetState(p1Cmd, 'd') or commandGetState(p2Cmd, 'd')) and cursorPosYQuestionVN < 4 then
		cursorPosYQuestionVN = cursorPosYQuestionVN + 1
	end
	if cursorPosYQuestionVN == 4 then
		moveTxtQuestionVN = (questionMenuVN - 5) * 13
	elseif cursorPosYQuestionVN == 0 then
		moveTxtQuestionVN = (questionMenuVN - 1) * 13
	end
	--Draw Fade BG
	animDraw(fadeWindowBG)
	--Draw Menu BG
	animDraw(questionWindowBGVN)
	animUpdate(questionWindowBGVN)
	--Draw Title
	if exitVN then
		textImgSetText(txt_questionVN, "UNSAVED DATA WILL BE LOST!")
		t_questionMenuVN[1].text = "OK"
		t_questionMenuVN[2].text = "CANCEL"
	else
		textImgSetText(txt_questionVN, "LOAD DEFAULT SETTINGS?")
		t_questionMenuVN[1].text = "YES"
		t_questionMenuVN[2].text = "NO"
	end
	textImgDraw(txt_questionVN)
	--Draw Table Text
	for i=1, #t_questionMenuVN do
		if i == questionMenuVN then
			bank = 5
		else
			bank = 0
		end
		textImgDraw(f_updateTextImg(t_questionMenuVN[i].id, jgFnt, bank, 0, t_questionMenuVN[i].text, 159, 120+i*13-moveTxtQuestionVN))
	end
	--Draw Cursor
	animSetWindow(cursorBox, 87,123+cursorPosYQuestionVN*13, 144,13)
	f_dynamicAlpha(cursorBox, 20,100,5, 255,255,0)
	animDraw(f_animVelocity(cursorBox, -1, -1))
	--Draw Input Hints Panel
	drawVNInputHints3()	
	--Actions
	if esc() or commandGetState(p1Cmd, 'e') or commandGetState(p2Cmd, 'e') then
		sndPlay(sndSys, 100, 2)
		f_questionResetVN()
	elseif btnPalNo(p1Cmd) > 0 or btnPalNo(p2Cmd) > 0 then
		--YES
		if questionMenuVN == 1 then
			sndPlay(sndSys, 100, 1)
			--Reset Visual Novel Settings
			if defaultVN == true then
				f_restoreVNcfg()
				hasChangedVN = true
				--modifiedVN = true
			--Reset Sound Settings
			elseif defaultAudioVN == true then
				gl_vol = 80
				se_vol = 80
				bgm_vol = 50
				setVolume(gl_vol / 100, se_vol / 100, bgm_vol / 100)
				pan_str = 80
				setPanStr(pan_str / 100)
				modifiedVN = true
			--Exit from Visual Novel
			elseif exitVN == true then
				sndStop()
				data.VNbreak = true
				f_saveTemp()
				VNtxtEnd = true
			end
		--NO
		else
			sndPlay(sndSys, 100, 2)
		end
		f_questionResetVN()
	end
end

function f_questionResetVN()
	moveTxtQuestionVN = 0
	--Cursor pos in NO
	cursorPosYQuestionVN = 1
	questionMenuVN = 2
	--Reset
	questionScreenVN = false
	defaultVN = false
	defaultAudioVN = false
	exitVN = false
end

--;===========================================================
--; MAIN MENU STUFF
--;===========================================================
function f_default() --Reset Game Modes Configuration
	resetRemapInput()
	--settings adjustable via options
	setAutoguard(1, data.autoguard)
	setAutoguard(2, data.autoguard)
	setRoundTime(data.roundTime * 60)
	setRoundsToWin(data.roundsNum)
	setLifeMul(data.lifeMul / 100)
	setTeam1VS2Life(data.team1VS2Life / 100)
	setTurnsRecoveryRate(1.0 / data.turnsRecoveryRate)
	setSharedLife(data.teamLifeShare)
	--values adjustable via lua scripts
	data.p1Char = nil --no predefined P1 character (assigned via table: {X, Y, (...)})
	data.p2Char = nil --no predefined P2 character (assigned via table: {X, Y, (...)})
	data.p1Pal = nil --no predefined P1 character palette
	data.p2Pal = nil --no predefined P2 character palette
	data.p1TeamMenu = nil --no predefined P1 team mode (assigned via table: {mode = X, chars = Y})
	data.p2TeamMenu = nil --no predefined P2 team mode (assigned via table: {mode = X, chars = Y})
	data.p1In = 1 --P1 controls P1 side of the select screen
	data.p2In = 0 --P2 controls in the select screen disabled
	data.coop = false --P2 fighting on P1 side disabled
	data.p2Faces = false --additional window with P2 select screen small portraits (faces) disabled
	data.p1SelectMenu = true --P1 character selection enabled
	data.p2SelectMenu = true --P2 character selection enabled
	data.aiFight = false --AI = data.difficulty for all characters disabled
	data.stageMenu = false --stage selection disabled
	data.stage = nil --no predefined custom stage
	data.bgm = nil --no predefined custom song route
	data.songSelect = true --enable assign music for stage (this exists to avoid f_assignMusic() in story mode custom fights)
	data.arcadeIntro = false --character arcade intro disabled
	data.arcadeEnding = false --character arcade ending disabled
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
	setAutoLevel(false) --generate autolevel.txt in debug dir
	setHUD(true) --just enable or disable hud elements in game
	setHomeTeam(2) --P2 side considered the home team: http://mugenguild.com/forum/topics/ishometeam-triggers-169132.0.html
	setFTNo(1) --Set Matchs To Wins/FT (To show in lifebar of Tournament Mode)
	setP1matchWins(0) --Set Match Wins Count for Player 1 (To show in lifebar of Tournament Mode)
	setP2matchWins(0) --Set Match Wins Count for Player 1 (To show in lifebar of Tournament Mode)
	setPlayerSide("") --set player side variable to adjust internal settings.
	setGameMode("") --set local GameMode variable (it can be recognized in cns and lua).
	setService("") --set different fight services for players (service examples are available in match.cns)
	setPauseVar("") --set pause menu extra variable to adjust internal settings.
	setTourneyState("") --set tournament state to show in tourney mode lifebar.
	--setOnlineMode("") --set online GameMode variable (it just a copy of gamemode to use online features without without interfering with local gamemode).
	--setReplayMode("") --set replay mode (online or local) to prepare replay functions to detects the gamemode variables.
end

--Take Screenshots
function f_screenShot()
	sndPlay(sndSys, 22, 0) --sndPlay(sndSys, 22, 1)
	takeScreenShot("screenshots/ " .. os.date("IKEMEN %Y-%m-%d %I-%M%p-%S") .. ".png")
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
	if data.debugLog then f_printTable(t_randomsongList, "save/debug/t_randomsongList.txt") end
end

--Load Songs from Folders
function f_loadMusic(path)
	for item in lfs.dir(path) do --For each item readed in path
		if item ~= "." and item ~= ".." and item ~= ".keep" then --exclude items
			local details = path.."/"..item --Get path and file name
			local attribute = lfs.attributes(details) --Get atributes from items readed
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
				elseif item:match('^.*(%.)[Oo][Gg][Gg]$') then
					row = #t_songFile+1
					t_songFile[row] = {}
					t_songFile[row]['id'] = ""
					t_songFile[row]['folder'] = path
					t_songFile[row]['path'] = details
					t_songFile[row]['name'] = item:gsub('^(.*)[%.][Oo][Gg][Gg]$', '%1')
				end
			elseif attribute.mode == "directory" then --If the item have "folder/dir" attribute
				rowFolder = #t_songList+1
				t_songList[rowFolder] = {}
				t_songList[rowFolder]['folder'] = details
			end
		end
	end
	f_printTable(t_songFile, 'save/debug/t_songFile.txt')
	f_printTable(t_songList, 'save/debug/t_songList.txt')
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
t_songList[folder][row+1] = {id = '', name = '          BACK', path = ''}
end
f_printTable(t_songList, 'save/debug/t_songList.txt')
end

--;===========================================================
--; CLOCK AND DATE PANEL
--;===========================================================
sysTime = tonumber(os.date("%H")) --Assigns the current hour to a variable based on the system clock. Used for day/night features.
sysTime2 = tonumber(os.date("%d")) --Assigns the current day to a variable based on date. Used for daily events features.
--sysTime3 = tonumber(os.date("%m"))

function f_sysTime()
	--local http = require("socket.http") -- import the socket.http module
	--local body, httpcode, headers = http.request("http://www.google.com") --("time.windows.com")
	--local date = headers.date -- LuaSocket makes all header names lowercase
	--print(date) --> "Mon, 18 Feb 2013 09:03:13 GMT"
	local clockPosX = 0
	local clockPosY = 8
	local clockStandard = (os.date("%I:%M%p"))
	local clockFullStandard = (os.date("%I:%M%p:%S"))
	local clockMilitary = (os.date("%H:%M"))
	local clockFullMilitary = (os.date("%X"))
	--
	local datePosX = 0
	local datePosY = 8
	local dateTypeA = (os.date("%m-%d-%y"))
	local dateTypeB = (os.date("%d-%m-%Y"))
	local dateTypeC = (os.date("%a %d.%b.%Y"))
	local dateTypeD = (os.date("%A"))
	local dateTypeE = (os.date("%B.%Y"))
	--4:3 Resolution
	if (resolutionHeight / 3 * 4) == resolutionWidth then
		clockPosX = 314
		--clockPosY = 8
		datePosX = 8
		--datePosY = 8
	--16:10 Resolution
	elseif (resolutionHeight / 10 * 16) == resolutionWidth then
		clockPosX = 345
		--clockPosY = 8
		datePosX = -25
		--datePosY = 8
	--16:9 Resolution
	elseif (math.floor((resolutionHeight / 9 * 16) + 0.5)) == resolutionWidth then
		clockPosX = 365
		--clockPosY = 8
		datePosX = -45
		--datePosY = 8
	--Extra Resolution
	else
		clockPosX = 345
		--clockPosY = 8
		datePosX = -25
		--datePosY = 8
	end
	--Set Clock
	if data.clock == "Standard" then
		textImgSetText(txt_titleClock, clockStandard)
		textImgSetPos(txt_titleClock, clockPosX, clockPosY)
	elseif data.clock == "Full Standard" then
		textImgSetText(txt_titleClock, clockFullStandard)
		textImgSetPos(txt_titleClock, clockPosX, clockPosY)
	elseif data.clock == "Military" then
		textImgSetText(txt_titleClock, clockMilitary)
		textImgSetPos(txt_titleClock, clockPosX, clockPosY)
	elseif data.clock == "Full Military" then
		textImgSetText(txt_titleClock, clockFullMilitary)
		textImgSetPos(txt_titleClock, clockPosX, clockPosY)
	end
	--Set Date
	if data.date == "Type A" then
		textImgSetText(txt_titleDate, dateTypeA)
		textImgSetPos(txt_titleDate, datePosX, datePosY)
	elseif data.date == "Type B" then
		textImgSetText(txt_titleDate, dateTypeB)
		textImgSetPos(txt_titleDate, datePosX, datePosY)
	elseif data.date == "Type C" then
		textImgSetText(txt_titleDate, dateTypeC)
		textImgSetPos(txt_titleDate, datePosX, datePosY)
	elseif data.date == "Type D" then
		textImgSetText(txt_titleDate, dateTypeD)
		textImgSetPos(txt_titleDate, datePosX, datePosY)
	elseif data.date == "Type E" then
		textImgSetText(txt_titleDate, dateTypeE)
		textImgSetPos(txt_titleDate, datePosX, datePosY)
	end
	textImgDraw(txt_titleClock) --Draw Clock
	textImgDraw(txt_titleDate) --Draw Date
	if data.debugMode then
		f_drawQuickText(txt_testDpad, font6, 0, 0, "PAD 1: "..getInputID(data.p1Gamepad), 109, 8) --Gamepad Repose Test
		f_drawQuickText(txt_testDpad, font6, 0, 0, "PAD 2: "..getInputID(data.p2Gamepad), 199, 8)
	end
end

--;===========================================================
--; MENU CONTROLS DEFINITION (Here because we gonna re-use t_keyMenuCfg for inputs hints)
--;===========================================================
t_keyMenuCfg = {
	{varID = textImgNew(), text = "UP",    					varText = "", cmd = "u"}, --cmd is the same command registered for commandGetState(p1Cmd, 'cmd')
	{varID = textImgNew(), text = "DOWN",  					varText = "", cmd = "d"},
	{varID = textImgNew(), text = "LEFT",  					varText = "", cmd = "l"},
	{varID = textImgNew(), text = "RIGHT", 					varText = "", cmd = "r"},
	{varID = textImgNew(), text = "A",     					varText = "", cmd = "a"},
	{varID = textImgNew(), text = "B",     					varText = "", cmd = "b"},
	{varID = textImgNew(), text = "C",     					varText = "", cmd = "c"},
	{varID = textImgNew(), text = "X",     					varText = "", cmd = "x"},
	{varID = textImgNew(), text = "Y",     					varText = "", cmd = "y"},
	{varID = textImgNew(), text = "Z",     					varText = "", cmd = "z"},
	{varID = textImgNew(), text = "SCREENSHOT",				varText = "", cmd = "q"},
	{varID = textImgNew(), text = "CONFIRM",				varText = "", cmd = "w"},
	{varID = textImgNew(), text = "RETURN",					varText = "", cmd = "e"},
	{varID = textImgNew(), text = "MENU",		 			varText = "", cmd = "s"}, --PAUSE GAME
	{varID = textImgNew(), text = "Default Config (F1)",	varText = ""},
	{varID = textImgNew(), text = "Confirm Config (ESC)",	varText = ""},
}

t_keyMenuCfg2 = {}
for i=1,#t_keyMenuCfg do --Make a copy of all items from t_keyMenuCfg table
	t_keyMenuCfg2[i] = {}
	t_keyMenuCfg2[i]['varID'] = t_keyMenuCfg[i].varID
	if i == 15 then
		t_keyMenuCfg2[i]['text'] = "Default Config (F2)"
	else
		t_keyMenuCfg2[i]['text'] = t_keyMenuCfg[i].text
	end
	t_keyMenuCfg2[i]['varText'] = ""
	t_keyMenuCfg2[i]['cmd'] = t_keyMenuCfg[i].cmd
end

function f_inputMenuRead(playerNo, controller)
	local tmp = nil
	tmp = s_configSSZ:match('in.new%[' .. playerNo+10 .. '%]%.set%(\n*%s*' .. controller .. ',\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^,%s]*%s*,\n*%s*%(int%)k_t::[^%)%s]*%s*%);')
	--Keyboard Read
	if tmp ~= nil and tmp ~= '' then
		tmp = tmp:gsub('in.new%[' .. playerNo+10 .. '%]%.set%(\n*%s*' .. controller .. ',\n*%s*', '')
		tmp = tmp:gsub('%(int%)k_t::([^,%s]*)%s*(,)\n*%s*', '%1%2')
		tmp = tmp:gsub('%(int%)k_t::([^%)%s]*)%s*%);', '%1')
	--Gamepad Read
	else
		tmp = s_configSSZ:match('in.new%[' .. playerNo+10 .. '%]%.set%(\n*%s*' .. controller .. ',\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^,%s]*%s*,\n*%s*[^%)%s]*%s*%);')
		tmp = tmp:gsub('in.new%[' .. playerNo+10 .. '%]%.set%(\n*%s*' .. controller .. ',\n*%s*', '')
		tmp = tmp:gsub('([^,%s]*)%s*(,)\n*%s*', '%1%2')
		tmp = tmp:gsub('([^%)%s]*)%s*%);', '%1')
	end
	for i, c
		in ipairs(strsplit(',', tmp))
	do
		if controller == -1 then --Load Keyboard Controls
			if playerNo == 0 then
				t_keyMenuCfg[i].varText = c
			else
				t_keyMenuCfg2[i].varText = c
			end
		else --Load Gamepad Controls
			if playerNo == 2 then
				t_keyMenuCfg[i].varText = c
			else
				t_keyMenuCfg2[i].varText = c
			end
		end
	end
end

f_inputMenuRead(0, -1) -- 0=P1, -1=Keyboard
f_inputMenuRead(1, -1) -- 1=P2

if data.debugLog then
	f_printTable(t_keyMenuCfg, "save/debug/menuInputsP1.txt")
	f_printTable(t_keyMenuCfg2, "save/debug/menuInputsP2.txt")
end

--Associate Button Key to Button Sprites
t_btnHint = {
	{keyTxt = "_0",				keySpr = btn0},
	{keyTxt = "_1", 			keySpr = btn1},
	{keyTxt = "_2", 			keySpr = btn2},
	{keyTxt = "_3", 			keySpr = btn3},
	{keyTxt = "_4", 			keySpr = btn4},
	{keyTxt = "_5", 			keySpr = btn5},
	{keyTxt = "_6", 			keySpr = btn6},
	{keyTxt = "_7", 			keySpr = btn7},
	{keyTxt = "_8", 			keySpr = btn8},
	{keyTxt = "_9", 			keySpr = btn9},
	{keyTxt = "a", 				keySpr = btnA},
	{keyTxt = "b", 				keySpr = btnB},
	{keyTxt = "c", 				keySpr = btnC},
	{keyTxt = "d", 				keySpr = btnD},
	{keyTxt = "e", 				keySpr = btnE},
	{keyTxt = "f", 				keySpr = btnF},
	{keyTxt = "g", 				keySpr = btnG},
	{keyTxt = "h", 				keySpr = btnH},
	{keyTxt = "i", 				keySpr = btnI},
	{keyTxt = "j", 				keySpr = btnJ},
	{keyTxt = "k", 				keySpr = btnK},
	{keyTxt = "l",				keySpr = btnL},
	{keyTxt = "m", 				keySpr = btnM},
	{keyTxt = "n", 				keySpr = btnN},
	{keyTxt = "o", 				keySpr = btnO},
	{keyTxt = "p", 				keySpr = btnP},
	{keyTxt = "q", 				keySpr = btnQ},
	{keyTxt = "r", 				keySpr = btnR},
	{keyTxt = "s", 				keySpr = btnS},
	{keyTxt = "t", 				keySpr = btnT},
	{keyTxt = "u", 				keySpr = btnU},
	{keyTxt = "v", 				keySpr = btnV},
	{keyTxt = "w", 				keySpr = btnW},
	{keyTxt = "x", 				keySpr = btnX},
	{keyTxt = "y", 				keySpr = btnY},
	{keyTxt = "z", 				keySpr = btnZ},
	{keyTxt = "PERIOD", 		keySpr = btnPERIOD},
	{keyTxt = "COMMA", 			keySpr = btnCOMMA},
	{keyTxt = "MINUS", 			keySpr = btnMINUS},
	{keyTxt = "LEFTBRACKET", 	keySpr = btnLEFTBRACKET},
	{keyTxt = "RIGHTBRACKET", 	keySpr = btnRIGHTBRACKET},
	{keyTxt = "BACKSLASH", 		keySpr = btnBACKSLASH},
	{keyTxt = "LSHIFT", 		keySpr = btnLSHIFT},
	{keyTxt = "RSHIFT", 		keySpr = btnRSHIFT},
	{keyTxt = "TAB", 			keySpr = btnTAB},
	{keyTxt = "SPACE", 			keySpr = btnSPACE},
	{keyTxt = "RETURN", 		keySpr = btnRETURN},
	{keyTxt = "BACKSPACE", 		keySpr = btnBACKSPACE},
	{keyTxt = "HOME", 			keySpr = btnHOME},
	{keyTxt = "END", 			keySpr = btnEND},
	{keyTxt = "PAGEUP", 		keySpr = btnPAGEUP},
	{keyTxt = "PAGEDOWN", 		keySpr = btnPAGEDOWN},
	{keyTxt = "UP", 			keySpr = btnUP},
	{keyTxt = "DOWN", 			keySpr = btnDOWN},
	{keyTxt = "LEFT", 			keySpr = btnLEFT},
	{keyTxt = "RIGHT", 			keySpr = btnRIGHT},
	{keyTxt = "KP_0", 			keySpr = btnKP_0},
	{keyTxt = "KP_1", 			keySpr = btnKP_1},
	{keyTxt = "KP_2", 			keySpr = btnKP_2},
	{keyTxt = "KP_3",			keySpr = btnKP_3},
	{keyTxt = "KP_4", 			keySpr = btnKP_4},
	{keyTxt = "KP_5", 			keySpr = btnKP_5},
	{keyTxt = "KP_6", 			keySpr = btnKP_6},
	{keyTxt = "KP_7", 			keySpr = btnKP_7},
	{keyTxt = "KP_8", 			keySpr = btnKP_8},
	{keyTxt = "KP_9", 			keySpr = btnKP_9},
	{keyTxt = "KP_PERIOD", 		keySpr = btnKP_PERIOD},
	{keyTxt = "KP_DIVIDE", 		keySpr = btnKP_DIVIDE},
	{keyTxt = "KP_MULTIPLY", 	keySpr = btnKP_MULTIPLY},
	{keyTxt = "KP_MINUS", 		keySpr = btnKP_MINUS},
	{keyTxt = "KP_PLUS", 		keySpr = btnKP_PLUS},
	{keyTxt = "KP_ENTER", 		keySpr = btnKP_ENTER},
	{keyTxt = "NIL", 			keySpr = btnNIL},
}

function f_searchCmd(input)
	for i, v in ipairs(t_keyMenuCfg) do --For each item in table
		if v.cmd == input then --if table cmd item is equal to input entered
			return i --Returns the position of the item in the table
		end
	end
	return nil --Returns nil if the item is not found in the table
end

function f_searchButton(inputkey) --Based on previous function
	for i, v in ipairs(t_btnHint) do
		if v.keyTxt == inputkey then
			return i
		end
	end
	return #t_btnHint --return lastest table value that is an empty spr
end

function drawInputHintsP1(...) --(...) Manage unlimited arguments
	local t_args = {...} --Store all arguments taken in a table
	for i=1, #t_args, 2 do --For each argument stored in table
		local cmd = t_args[i] --Set first argument (key name) to cmd var
		local cmdPos = t_args[i+1] --Set second argument (keyX,keyY) to cmdPos var
		local nameKey = f_searchCmd(cmd) --get table pos from button name configured based on cmd entry name
		if nameKey ~= nil then
			local btn = f_searchButton(t_keyMenuCfg[nameKey].varText) --Get button name configured
			local key = t_btnHint[btn].keySpr --Get button sprite
			--local posKey = cmdPos --Get button "X,Y" positions
			local posKeyX, posKeyY = cmdPos:match('^([^,]-)%s*,%s*(.-)$') --Separate positions in vars
			animSetPos(key, posKeyX, posKeyY)
			animSetScale(key, 0.7, 0.7)
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
	--if #t_secretEntry > #t_secretCode then --If entries exceed t_secretCode table limit
		--t_secretEntry = {} --Reset Table to try again.
	--end
	for i = 1, #t_secretEntry do
		if t_secretEntry[i] ~= t_secretCode[i] then --Check if the user key entry is equal to secret code position
			t_secretEntry = {} --Reset Table to try again.
		end
	end
	--Compare User Entries Table with Secret Code Table
	if table.concat(t_secretEntry) == table.concat(t_secretCode) then --If table are equals
		sndPlay(sndSys, 200, 2)
		--stats.unlocks.chars.reika = true
		--f_saveStats()
		cmdReward = true
	else--If table are not equals
		cmdReward = false
	end
	if data.debugLog then
		f_printTable(t_secretEntry, "save/debug/t_secretEntry.txt")
		f_printTable(t_secretCode, "save/debug/t_secretCode.txt")
	end
end

--;===========================================================
--; UNLOCKS CHECKING
--;===========================================================
t_unlockLua = { --Create table to manage unlock conditions in real-time
chars = {}, stages = {}, modes = {}
}

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
				elseif group == 'modes' then
					--already handled via t_del cleaning
				end
				]]
				if bool and (permanent or group == 'chars' or group == 'stages' or group == 'modes') then
					table.insert(t_del, k)
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
		['data.VNbreaker'] = data.VNbreaker,
		['data.p1Lose'] = data.p1Lose,
		['data.p2Lose'] = data.p2Lose,
		['data.AIskip'] = data.AIskip
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
	data.VNbreaker = false
	data.p1Lose = false
	data.p2Lose = false
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

--Data saving to vn_sav.lua
function f_saveVN()
	local t_vn = {
		--Dialogue Settings
		['data.VNdelay'] = data.VNdelay,
		['data.VNtxtBGTransS'] = data.VNtxtBGTransS,
		['data.VNtxtBGTransD'] = data.VNtxtBGTransD,
		['data.VNdisplayName'] = data.VNdisplayName,
		['data.VNautoSkip'] = data.VNautoSkip,
		--Progress Data
		['data.VNarc'] = data.VNarc,
		['data.VNchapter'] = data.VNchapter,
		['data.VNdialogue'] = data.VNdialogue
	}
	s_vndataLUA = f_strSub(s_vndataLUA, t_vn)
	local vnFile = io.open(saveVNPath,"w+")
	vnFile:write(s_vndataLUA)
	vnFile:close()
end

--Data saving to stats.json
function f_saveStats()
	--if data.debugLog then f_printTable(stats, 'save/debug/t_stats.txt') end
	f_fileWrite(saveStatsPath, json.encode(stats, {indent = 2}))
end

--General Sections
function init_generalStats()
if stats.firstRun == nil or data.erase then stats.firstRun = true end
if stats.playtime == nil or data.erase then stats.playtime = 0 end
if stats.coins == nil or data.erase then stats.coins = 0 end
if stats.attractCoins == nil then stats.attractCoins = 0 end
if stats.continueCount == nil or data.erase then stats.continueCount = 0 end
if stats.wins == nil or data.erase then stats.wins = 0 end
if stats.losses == nil or data.erase then stats.losses = 0 end
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
	
	stats.modes.bossrush = {}
	stats.modes.bossrush.playtime = 0
	stats.modes.bossrush.clear = 0
	stats.modes.bossrush.ranking = {}
	
	stats.modes.bonusrush = {}
	stats.modes.bonusrush.playtime = 0
	stats.modes.bonusrush.clear = 0
	stats.modes.bonusrush.ranking = {}
	
	stats.modes.timeattack = {}
	stats.modes.timeattack.playtime = 0
	stats.modes.timeattack.clear = 0
	stats.modes.timeattack.ranking = {}
	
	stats.modes.scoreattack = {}
	stats.modes.scoreattack.playtime = 0
	stats.modes.scoreattack.clear = 0
	stats.modes.scoreattack.ranking = {}
	
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
	
	stats.modes.training = {}
	stats.modes.training.playtime = 0
	
	stats.modes.versus = {}
	stats.modes.versus.playtime = 0
	
	stats.modes.watch = {}
	stats.modes.watch.playtime = 0
	
	stats.modes.boss = {}
	stats.modes.boss.playtime = 0
	
	stats.modes.bonus = {}
	stats.modes.bonus.playtime = 0
	
	stats.modes.timerush = {}
	stats.modes.timerush.playtime = 0
	
	stats.modes.story = {}
	stats.modes.story.playtime = 0
	
	stats.modes.adventure = {}
	stats.modes.adventure.playtime = 0
	
	stats.modes.mission = {}
	stats.modes.mission.playtime = 0
	stats.modes.mission.clearall = 0
	stats.modes.mission.clear1 = 0
	stats.modes.mission.clear2 = 0
	stats.modes.mission.clear3 = 0
	
	stats.modes.event = {}
	stats.modes.event.playtime = 0
	stats.modes.event.clearall = 0
	stats.modes.event.clear1 = 0
	stats.modes.event.clear2 = 0
	stats.modes.event.clear3 = 0
end
if stats.characters == nil or data.erase then stats.characters = {} end --To store times used for favorite chars stats
if stats.stages == nil or data.erase then stats.stages = {} end --To store times used for favorite stages stats
if stats.vault == nil then stats.vault = "Ultra" end
end

--Story Mode Data
data.storiesProgress = 300
--Arc 1 Data
data.story1_0Status = 1
data.story1_1Status = 1
data.story1_2Status = 1
data.story1_3AStatus = 1
data.story1_3BStatus = 1
data.story1_4AStatus = 1
data.story1_4BStatus = 1
data.story1_4CStatus = 1
data.story1_4DStatus = 1
--Arc 2 Data
data.story2_0Status = 1
data.story2_1Status = 1
data.story2_2Status = 1
--Arc 3 Data
data.story3_0Status = 1
data.story3_1Status = 1
--Story Mode - Arc 1 Chapters Unlocks
data.story1_1Unlock = true
data.story1_2Unlock = true
data.story1_3AUnlock = true
data.story1_3BUnlock = true
data.story1_4AUnlock = true
data.story1_4BUnlock = true
data.story1_4CUnlock = true
data.story1_4DUnlock = true
--Story Mode - Arc 2 Chapters Unlocks
data.story2_1Unlock = true
data.story2_2Unlock = true
--Story Mode - Arc 3 Chapters Unlocks
data.story3_1Unlock = true

--Unlocks Section
function init_unlocksStats()
if stats.unlocks == nil or data.erase then --If unlocks section does not exists
	stats.unlocks = {} --Create global space
	stats.unlocks.chars = {} --Create space for characters
	stats.unlocks.stages = {} --Create space for stages
	stats.unlocks.modes = {} --Create space for game modes
	stats.unlocks.gallery = {} --Create space for gallery items
end
--If Character Unlock Data does not exists, create it:
if stats.unlocks.chars.reika == nil or data.erase then stats.unlocks.chars.reika = false end
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
init_generalStats() --Create general stats data (first run)
init_unlocksStats()
f_saveStats()

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