--;===========================================================
--; LIBRARY AND DATA DEFINITION
--;===========================================================
lfs = require('lfs') --load lfs.dll
package.path = package.path..';./lib/ltn12.lua' --load ltn12 lua library
ltn12 = require('ltn12')
--package.path = package.path..';./lib/json.lua' --load json lua library
--json = require('json')
--package.path = package.path..';./lib/dkjson.lua' --load dkjson lua library
--dkjson = require('dkjson')
--package.path = package.path..';./lib/net/http.lua' --load http lua library
--http = require('http')
--package.path = package.path..';./lib/net/socket.lua' --load socket lua library
--socket = require('socket')
--package.path = package.path..';./lib/net/ftp.lua' --load ftp lua library
--ftp = require('ftp')
--package.path = package.path..';./lib/net/headers.lua' --load headers lua library
--headers = require('headers')
--package.path = package.path..';./lib/net/mbox.lua' --load mbox lua library
--mbox = require('mbox')
--package.path = package.path..';./lib/net/mime.lua' --load mime lua library
--mime = require('mime')
--package.path = package.path..';./lib/net/smtp.lua' --load smtp lua library
--smtp = require('smtp')
--package.path = package.path..';./lib/net/tp.lua' --load tp lua library
--tp = require('tp')
--package.path = package.path..';./lib/net/url.lua' --load url lua library
--url = require('url')

--Create global space (accessing variables between modules)
data = require('saved.data') --Require function, allows use the content inside in the script said. The begin of the script called need to have this: module(..., package.seeall)

--Load saved variables
assert(loadfile('saved/data_sav.lua'))() --assert loadfile, allows load the content stored in script said. The script must not have any module load.
assert(loadfile('saved/stats_sav.lua'))()

--;===========================================================
--; SCREENPACK DEFINITION
--;===========================================================
--SFF
fadeSff = sffNew('data/screenpack/fade.sff') --load fade sprites
eventSff = sffNew('data/screenpack/events.sff') --load events menu sprites
missionSff = sffNew('data/screenpack/missions.sff') --load missions menu sprites
gallerySff = sffNew('data/screenpack/gallery.sff') --load gallery sprites
stageSff = sffNew('data/screenpack/stages.sff') --load stages menu sprites (Resolution Recommended for images stored: 1280x720)
sysSff = sffNew('data/screenpack/winmugen/system.sff') --load screenpack/menu sprites
contSff = sffNew('data/screenpack/winmugen/continue.sff') --load continue sprites

--SND (Sound effects do not interrupt music/bgm)
sysSnd = sndNew('data/screenpack/winmugen/system.snd')
announcerSnd = sndNew('data/screenpack/winmugen/announcer.snd')
contSnd = sndNew('data/screenpack/winmugen/continue.snd')

--Fonts
padFnt = fontNew('font/f-pad.fnt')
survBarsFnt = fontNew('font/survival_bars.fnt')
survNumFnt = fontNew('font/survival_nums.fnt')
jgFnt = fontNew('font/JG.fnt')
opFnt = fontNew('font/Options.fnt')
font1 = fontNew('font/f-4x6.fnt')
font2 = fontNew('font/f-6x9.fnt')
font3 = fontNew('font/14x14.fnt')
font4 = fontNew('font/18x18.fnt')
font5 = fontNew('font/Qoh_small.fnt')
font6 = fontNew('font/QOH_BIG.fnt')
font7 = fontNew('font/f-6x8f.fnt')
font8 = fontNew('font/f-6x9f.fnt')
font9 = fontNew('font/font3.fnt')
font10 = fontNew('font/font4.fnt')
font11 = fontNew('font/font5.fnt')
font12 = fontNew('font/score1.fnt')
font13 = fontNew('font/kof99.fnt')
font14 = fontNew('font/MvcName.fnt')
font15 = fontNew('font/name1.fnt')
font16 = fontNew('font/num1.fnt')
font17 = fontNew('font/sf2_name.fnt')
font18 = fontNew('font/sf2_small.fnt')
font19 = fontNew('font/sf2_sys.fnt')
font20 = fontNew('font/sfz2a_system.fnt')
font21 = fontNew('font/ssf2x_10.fnt')
font22 = fontNew('font/ssf2x_s.fnt')
font23 = fontNew('font/ssf2x_sL.fnt')
font24 = fontNew('font/ssf2x_vL.fnt')

--Music
bgmNothing = 'Nothing.mp3'
bgmTitle = 'sound/Title.mp3'
bgmSelect = 'sound/Select.mp3'
bgmSelectChallenger = 'sound/The Challenger.mp3'
bgmSelectBoss = 'sound/Select Boss.mp3'
--bgmSelectOrder = 'sound/Order Select.mp3'
bgmSelectOrderFinal = 'sound/Order Select Final.mp3'
bgmVS = 'sound/VS.mp3'
bgmVSFinal = 'sound/VS Final.mp3'
bgmVictory = 'sound/Victory.mp3'
bgmResults = 'sound/Results.mp3'
bgmService = 'sound/Service.mp3'
bgmContinue = 'sound/Continue.mp3'
bgmGameOver = 'sound/Game Over.mp3'
bgmEvents = 'sound/Events.mp3'

--Simple Random Select for Main Menu Song
function f_bgmrandomMenu()
	local randomTrack = {"sound/Menu 1.mp3", "sound/Menu 2.mp3", "sound/Menu 3.ogg"}
	playBGM(randomTrack[math.random(1, #randomTrack)])
end

--Select Main Menu Song
function f_menuMusic()
	if data.menuSong == 'Theme 1' then
		bgmMenu = 'sound/Menu 1.mp3'
		playBGM(bgmMenu)
	elseif data.menuSong == 'Theme 2' then
		bgmMenu = 'sound/Menu 2.mp3'
		playBGM(bgmMenu)
	elseif data.menuSong == 'Theme 3' then
		bgmMenu = 'sound/Menu 3.ogg'
		playBGM(bgmMenu)	
	elseif data.menuSong == 'Random' then
		f_bgmrandomMenu()
	end
end

--Select Challenger Menu Song
function f_challengerMusic()
	if data.challengerSong == 'Fixed' then
		bgmChallenger = bgmSelectChallenger
		playBGM(bgmChallenger)
	elseif data.challengerSong == 'Original' then
		bgmChallenger = bgmSelect
		playBGM(bgmChallenger)
	elseif data.challengerSong == 'Boss' then
		bgmChallenger = bgmSelectBoss
		playBGM(bgmChallenger)	
	elseif data.challengerSong == 'Random' then
		f_bgmrandomChallenger()
	end
end

--Simple Random Select for Challenger Menu Song
function f_bgmrandomChallenger()
	local randomTrack = {bgmSelectChallenger, bgmSelect, bgmSelectBoss}
	playBGM(randomTrack[math.random(1, #randomTrack)])
end

--Advanced Random Select for Quick Versus Song
function f_bgmrandomVS()
	t_randomsongList = {}
	for file in lfs.dir[[.\\sound\\Quick Versus Songs\\]] do --Read "Sound/Quick Versus Songs" Song Dir (Only Supports MP3 and OGG)
		if file:match('^.*(%.)mp3$') then --Filter Files .mp3
			row = #t_randomsongList+1
			t_randomsongList[row] = {}
			t_randomsongList[row]['id'] = ''
			t_randomsongList[row]['playlist'] = file:gsub('^(.*)[%.]mp3$', '%1')
		elseif file:match('^.*(%.)ogg$') then --Filter Files .ogg
			row = #t_randomsongList+1
			t_randomsongList[row] = {}
			t_randomsongList[row]['id'] = ''
			t_randomsongList[row]['playlist'] = file:gsub('^(.*)[%.]ogg$', '%1')
		end
	end
	t_randomsongList[#t_randomsongList+1] = {
		id = '', playlist = ' '
	}
	playBGM('sound/Quick Versus Songs/' .. t_randomsongList[math.random(1, #t_randomsongList)].playlist .. '.mp3')
	playBGM('sound/Quick Versus Songs/' .. t_randomsongList[math.random(1, #t_randomsongList)].playlist .. '.ogg')
end

--Video
--videoHowToPlay = "data/movie/How To Play.wmv"

--;===========================================================
--; COMMON SECTION
--;===========================================================

--input stuff
inputdia = inputDialogNew()
data.p1In = 1
data.p2In = 1

function setCommand(c)
	commandAdd(c, 'u', '$U')
	commandAdd(c, 'd', '$D')
	commandAdd(c, 'l', '$B')
	commandAdd(c, 'r', '$F')
	commandAdd(c, 'holdu', '/U') --bufu
	commandAdd(c, 'holdd', '/D') --bufd
	commandAdd(c, 'holdl', '/B') --bufl
	commandAdd(c, 'holdr', '/F') --bufr
	commandAdd(c, 'relu', '~U')
	commandAdd(c, 'reld', '~D')
	commandAdd(c, 'rell', '~B')
	commandAdd(c, 'relr', '~F')	
	commandAdd(c, 'a', 'a')
	commandAdd(c, 'b', 'b')
	commandAdd(c, 'c', 'c')
	commandAdd(c, 'x', 'x')
	commandAdd(c, 'y', 'y')
	commandAdd(c, 'z', 'z')
	commandAdd(c, 's', 's') --Return/Enter Button
	commandAdd(c, 'v', 'v') --For Left Tag
	commandAdd(c, 'w', 'w') --For Right Tag
	commandAdd(c, 'holds', '/s')
	commandAdd(c, 'su', '/s, U')
	commandAdd(c, 'sd', '/s, D')
end

p1Cmd = commandNew()
setCommand(p1Cmd)

p2Cmd = commandNew()
setCommand(p2Cmd)

function cmdInput()
	commandInput(p1Cmd, data.p1In)
	commandInput(p2Cmd, data.p2In)
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
	if commandGetState(cmd, 's') then return 1 + s end --Start button
	if commandGetState(cmd, 'v') then return 1 + s end
	if commandGetState(cmd, 'w') then return 2 + s end
	return 0
end

--animDraw at specified coordinates
function animPosDraw(a, x, y)
	animSetPos(a, x, y)
	animUpdate(a)
	animDraw(a)
end

--textImgDraw at specified coordinates
function textImgPosDraw(ti, x, y)
	textImgSetPos(ti, x, y)
	textImgDraw(ti)
end

--shortcut for creating new text with several parameters
function createTextImg(font, bank, aline, text, x, y, scaleX, scaleY)
	local ti = textImgNew()
	textImgSetFont(ti, font)
	textImgSetBank(ti, bank)
	textImgSetAlign(ti, aline)
	textImgSetText(ti, text)
	textImgSetPos(ti, x, y)
	scaleX = scaleX or 1
	scaleY = scaleY or 1
	textImgSetScale(ti, scaleX, scaleY)
	return ti
end

--shortcut for updating text with several parameters
function f_updateTextImg(animName, font, bank, aline, text, x, y, scaleX, scaleY)
	textImgSetFont(animName, font)
	textImgSetBank(animName, bank)
	textImgSetAlign(animName, aline)
	textImgSetText(animName, text)
	textImgSetPos(animName, x, y)
	scaleX = scaleX or 1
	scaleY = scaleY or 1
	textImgSetScale(animName, scaleX, scaleY)
	return animName
end

--shortcut for updating velocity
function f_animVelocity(animName, addX, addY)
	animAddPos(animName, addX, addY)
	animUpdate(animName)
	return animName
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
	local toFile = toFile or 'saved/debug/table_print.txt'
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
	local toFile = toFile or 'saved/debug/var_print.txt'
	local file = io.open(toFile,"w+")
	file:write(v)
	file:close()
end

--generate anim from table
function f_animFromTable(t, sff, x, y, scaleX, scaleY, facing, infFrame)
	infFrame = infFrame or 1
	scaleX = scaleX or 1
	scaleY = scaleY or 1
	facing = facing or 0
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

--remove duplicated string pattern
function f_uniq(str, pattern, subpattern)
	local out = {}
	for s in str:gmatch(pattern) do
		local s2 = s:match(subpattern)
		if not f_contains(out, s2) then out[#out+1] = s end
	end
	return table.concat(out)
end

function f_contains(t, val)
	for k,v in pairs(t) do
		--if v == val then
		if v:match(val) then
			return true
		end
	end
	return false
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

--Read/Writte Lua Data
function f_strSub(str, t)
	local txt = ''
	for row, val in pairs(t) do
		if type(val) == 'string' then
			val = "'" .. tostring(val) .. "'"
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
	--f_printTable(t, 'saved/debug/t_' .. fileName)
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
		tOut.scenes[i]['fadeinData'] = f_fadeAnim(tOut.scenes[i].fadeinTime, 'fadein', tOut.scenes[i].fadeinCol, fadeSff)
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
		tOut.scenes[i]['fadeoutData'] = f_fadeAnim(tOut.scenes[i].fadeoutTime, 'fadeout', tOut.scenes[i].fadeoutCol, fadeSff)
		--clearcolor = r, g, b (int, int, int) --currently only black when average of RGB <= 128 and white if >128, can't generate a color not from sprite
		if tIn.scenes[i]['clearcolor'] ~= nil then
			local tmp1, tmp2, tmp3 = tIn.scenes[i]['clearcolor']:match('([0-9]+)%s*,%s*([0-9]+)%s*,%s*([0-9]+)')
			if (tmp1+tmp2+tmp3)/3 > 128 then
				tOut.scenes[i]['clearcolor'] = 'white' --for debugging only
				tOut.scenes[i]['clearcolorData'] = animNew(fadeSff, '0,1, 0,0, -1')
				animUpdate(tOut.scenes[i]['clearcolorData'])
			else
				tOut.scenes[i]['clearcolor'] = 'black' --for debugging only
				tOut.scenes[i]['clearcolorData'] = animNew(fadeSff, '0,0, 0,0, -1')
				animUpdate(tOut.scenes[i]['clearcolorData'])
			end
		elseif i > 1 then
			tOut.scenes[i]['clearcolor'] = tOut.scenes[i-1].clearcolor --for debugging only
			tOut.scenes[i]['clearcolorData'] = tOut.scenes[i-1].clearcolorData
		else
			tOut.scenes[i]['clearcolor'] = 'black' --for debugging only
			tOut.scenes[i]['clearcolorData'] = animNew(fadeSff, '0,0, 0,0, -1')
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
			]]--
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
	f_printTable(tOut, 'saved/debug/t_storyboard.txt')
	local velX = 0
	local velY = 0
	for i=tOut.startscene, #tOut.scenes do
		for j=0, tOut.scenes[i].endTime do
			if esc() or btnPalNo(p1Cmd) > 0 then
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
--; RANDOMTEST DEFINITION
--;===========================================================
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

tuyoiBorder = 0
juuni = 12
moudeta = {}
rank = 0
saikyou = false
roster = {}
debugText = ''
numChars = 0
nextChar = 1

function addMoudeta(rank)
  moudeta[#moudeta + 1] = rank
  local max =
    math.floor(
      numChars / (math.min(numChars / (juuni*10) + 3, juuni)*juuni))
  while #moudeta > max do
    table.remove(moudeta, 1)
  end
end

function randRank()
  local r = 0
  while true do
    r = math.random(1, tuyoiBorder + juuni - 2);
    local notbroken = true
    for i = 1, #moudeta do
      if math.abs(moudeta[i] - r) <= math.floor(juuni/3) then
        notbroken = false
        break
      end
    end
    if notbroken then
      break
    end
  end
  return r
end

function eachAllChars(f)
  for cel = 1, #t_randomChars do
    f(cel-1)
  end
end

function rakuBenry()
  local alf = 'saved/debug/autolevel.txt'
  local veljnz = {}
  local winct = {}
  local buf = '\239\187\191'
  local fp = io.open(alf, 'r')
  if fp then
    for line in fp:lines() do
      local tmp = strsplit(',', line)
      if #tmp >= 2 then
        for i = 1, 4 do
          if i == 4 then
            tmp[1] = string.sub(tmp[1], 4)
          else
            if string.byte(tmp[1], i) ~= string.byte(buf, i) then break end
          end
        end
        winct[tmp[1]] = map(tonumber, strsplit(' ', strtrim(tmp[2])))
      end
    end
    io.close(fp)
  end
  numChars = 0
  eachAllChars(function(cel)
    numChars = numChars + 1
  end)
  local tuyoninzu = math.floor(numChars / (juuni*10))
  if tuyoninzu < juuni - 1 then
    tuyoiBorder =  math.floor(numChars / (tuyoninzu + 1))
    tuyoninzu = juuni - 1
  else
    tuyoiBorder = math.floor(numChars / juuni)
  end
  local total = 0
  local zero ={}
  local tsuyoshi = {}
  local rand = {}
  local kai = {}
  local bimyou = {}
  local tuyocnt = 0
  local ran = randRank()
  eachAllChars(function(cel)
    if #veljnz < cel*12 then
      for i = #veljnz + 1, cel*12 do
        veljnz[i] = 0
      end
    end
    local wins = winct[getCharFileName(cel)]
    local tmp = 0
    for j = 1, 12 do
      if wins and j <= #wins then
        total = total + wins[j]
        veljnz[cel*12 + j] = wins[j]
        tmp = tmp + wins[j]
      else
        veljnz[cel*12 + j] = 0
      end
    end
    if tmp >= tuyoiBorder then tuyocnt = tuyocnt + 1 end
    if tmp >= tuyoiBorder - juuni then table.insert(tsuyoshi, cel) end
    if tmp >= 1 and tmp <= juuni then table.insert(bimyou, cel) end
    if tmp > ran-juuni and tmp <= ran then table.insert(rand, cel) end
    if tmp == 0 then table.insert(zero, cel) end
    if tmp < 0 then table.insert(kai, cel) end
  end)
  function charAdd(cList, numAdd)
    if numAdd <= 0 then return end
    for i = 1, numAdd do
      if #cList == 0 then break end
      local cidx = math.random(1, #cList)
      table.insert(roster, cList[cidx])
      table.remove(cList, cidx)
    end
  end
  roster = {}
  nextChar = 1
  debugText = ''
  local numZero = #zero
  if numZero > 0 then
    charAdd(zero, numZero)
    charAdd(kai, tuyoninzu - numZero)
    rank = 0
  elseif #bimyou >= math.max(tuyoninzu*20, math.floor((numChars*3)/20)) then
    charAdd(bimyou, #bimyou)
    rank = juuni
  else
    for n = 1, 3 do
      if #rand >= tuyoninzu then break end
      rand = {}
      ran = randRank()
      eachAllChars(function(cel)
        local tmp = 0
        for j = 1, 12 do
          tmp = tmp + veljnz[cel*12 + j]
        end
        if tmp > ran-juuni and tmp <= ran then table.insert(rand, cel) end
      end)
    end
    debugText = ran .. ' ' .. #rand
    if #rand >= tuyoninzu then
      charAdd(rand, #rand)
      rank = ran
      addMoudeta(rank)
    elseif tuyocnt >= tuyoninzu then
      charAdd(tsuyoshi, #tsuyoshi)
      rank = tuyoiBorder+juuni-1
    else
      addMoudeta(tuyoiBorder + (juuni-2) - math.floor(juuni/3))
      charAdd(kai, #kai)
      rank = -1
    end
  end
  if numZero == 0 then
    while total ~= 0 do
      local i = math.random(1, #veljnz)
      if total > 0 then
        veljnz[i] = veljnz[i] - 1
        total = total - 1
      else
        veljnz[i] = veljnz[i] + 1
        total = total + 1
      end
    end
  end
  eachAllChars(function(cel)
    buf = buf .. getCharFileName(cel) .. ','
    for j = 1, 12 do
      buf = buf .. ' ' .. veljnz[cel*12 + j]
    end
    buf = buf .. '\r\n'
  end)
  local alv = io.open(alf, 'wb')
  alv:write(buf)
  io.close(alv)
end

function randSel(pno, winner)
  if winner > 0 and (pno == winner) == not saikyou then return end
  local team
  if rank == 0 or rank == 12 or saikyou then
    team = 0
  elseif rank < 0 then
    team = math.random(0, 2)
  else
    team = math.random(0, 1)*2
  end
  setTeamMode(pno, team, math.random(1, 4))
  local tmp = 0
  while tmp < 2 do
    tmp = selectChar(pno, roster[nextChar], math.random(1, 12))
    nextChar = nextChar + 1
    if nextChar > #roster then nextChar = 1 end
  end
end

function rosterTxt()
  local str = "Rank: " .. rank .. ' ' .. debugText
  for i = 1, #roster do
    str = str .. '\n' .. getCharFileName(roster[i])
  end
  dscr = io.open('saved/debug/randomtest.txt', 'w')
  dscr:write(str)
  io.close(dscr)
end


function init()
  for i = 1, 8 do
    setCom(i, 8)
  end
  setAutoLevel(true)
  setMatchNo(1)
  selectStage(0)
  rakuBenry()
  winner = 0
  wins = 0
  rosterTxt()
  nextChar = 1
  saikyou = rank == tuyoiBorder+juuni-1
end

function initSingle()
  setCom(1, 0)
  setAutoLevel(true)
  setMatchNo(1)
  selectStage(0)
  rakuBenry()
  winner = 0
  wins = 0
  rosterTxt()
  nextChar = 1
  saikyou = rank == tuyoiBorder+juuni-1
end

function initMulti()
  setCom(1, 0)
  setCom(2, 0)
  setAutoLevel(true)
  setMatchNo(1)
  selectStage(0)
  rakuBenry()
  winner = 0
  wins = 0
  rosterTxt()
  nextChar = 1
  saikyou = rank == tuyoiBorder+juuni-1
end

function initCoop()
  --setHomeTeam(1)
  setCom(1, 0)
  setCom(2, 2)
  --setCom(3, 0)
  setAutoLevel(true)
  setMatchNo(1)
  selectStage(0)
  rakuBenry()
  winner = 0
  wins = 0
  rosterTxt()
  nextChar = 1
  saikyou = rank == tuyoiBorder+juuni-1
end

function runDemo()
  init()
  refresh()
  while not esc() do
    randSel(1, winner)
    randSel(2, winner)
    loadStart()
    local oldwinner = winner
    winner = game()
    if winner < 0 or esc() then break end
    oldwins = wins
    wins = wins + 1
    if winner ~= oldwinner then
      wins = 1
      setHomeTeam(winner == 1 and 2 or 1)
    end
    setMatchNo(wins)
    if winner <= 0 or wins >= 20 or wins == oldwins then
      init()
    end
    refresh()
  end
  f_mainTitle()
end

function randomsingleVS()
  f_bgmrandomVS()
  initSingle()
  refresh()
  while not esc() do
    randSel(1, winner)
    randSel(2, winner)
    loadStart()
    local oldwinner = winner
    winner = game()
    if winner < 0 or esc() then break end
    oldwins = wins
    wins = wins + 1
    if winner ~= oldwinner then
      wins = 1
      setHomeTeam(winner == 1 and 2 or 1)
    end
    setMatchNo(wins)
    if winner <= 0 or wins >= 20 or wins == oldwins then
      init()
    end
	refresh()
  end
  f_menuMusic()
end

function randommultiVS()
  f_bgmrandomVS()
  initMulti()
  refresh()
  while not esc() do
    randSel(1, winner)
    randSel(2, winner)
    loadStart()
    local oldwinner = winner
    winner = game()
    if winner < 0 or esc() then break end
    oldwins = wins
    wins = wins + 1
    if winner ~= oldwinner then
      wins = 1
      setHomeTeam(winner == 1 and 2 or 1)
    end
    setMatchNo(wins)
    if winner <= 0 or wins >= 20 or wins == oldwins then
      init()
    end
    refresh()
  end
  f_menuMusic()
end

function randomcoopVS()
  f_bgmrandomVS()
  initCoop()
  refresh()
  while not esc() do
    randSel(1, winner)
    randSel(2, winner)
    loadStart()
    local oldwinner = winner
    winner = game()
    if winner < 0 or esc() then break end
    oldwins = wins
    wins = wins + 1
    if winner ~= oldwinner then
      wins = 1
      setHomeTeam(winner == 1 and 2 or 1)
    end
    setMatchNo(wins)
    if winner <= 0 or wins >= 20 or wins == oldwins then
      init()
    end
    refresh()
  end
  f_menuMusic()
end

--;===========================================================
--; PAUSE MENU BACKGROUND DEFINITION
--;===========================================================
--Menu Background
--menuBG = animNew(sysSff, [[
--300,1, 0,0, -1
--]])
--animSetPos(menuBG, 40, 30)
--animSetAlpha(menuBG, 20, 50)
--animUpdate(menuBG)

--Scrollbar (for below function)
--menuScrollbar = animNew(sysSff, [[
--1002,0, 0,0, -1
--]])

--Dynamically draw menu window based on given parameters
--function f_drawBorder(x1, y1, x2, y2, pn, i, duration, sb, sbSize, sbLimit, sbCurPos)
	--x2 = x2 or 320-x1
	--y2 = y2 or 240-y1
	--duration = duration or 10
	--sb = sb or false
	--if pn == 2 then
		--menuCorner = animNew(sysSff, [[
		--1001,0, 0,0, -1
		--]])
		--menuHEdge = animNew(sysSff, [[
		--1001,1, 0,0, -1
		--]])
		--menuVEdge = animNew(sysSff, [[
		--1001,2, 0,0, -1
		--]])
		--menuCorner2 = animNew(sysSff, [[
		--1000,0, 0,0, -1
		--]])
		--menuHEdge2 = animNew(sysSff, [[
		--1000,1, 0,0, -1
		--]])
		--menuVEdge2 = animNew(sysSff, [[
		--1000,2, 0,0, -1
		--]])
	--else
		--menuCorner = animNew(sysSff, [[
		--1000,0, 0,0, -1
		--]])
		--menuHEdge = animNew(sysSff, [[
		--1000,1, 0,0, -1
		--]])
		--menuVEdge = animNew(sysSff, [[
		--1000,2, 0,0, -1
		--]])
		--menuCorner2 = animNew(sysSff, [[
		--1001,0, 0,0, -1
		--]])
		--menuHEdge2 = animNew(sysSff, [[
		--1001,1, 0,0, -1
		--]])
		--menuVEdge2 = animNew(sysSff, [[
		--1001,2, 0,0, -1
		--]])
	--end
	--animFullDraw(menuBG, x1, ((y1 + y2) / 2) - ((((y2 - y1) / duration) * math.abs(i))/2), x2 - x1, ((y2 - y1) / duration) * math.abs(i), x1-3, y1-3, (x2+3)-(x1-3), (y2+3)-(y1-3))
	--animFullDraw(menuHEdge, x1, ((y1 + y2) / 2) - ((((y2 - y1) / duration) * math.abs(i))/2), x2 - x1, 0.5, x1-3, y1-3, (x2+3)-(x1-3), (y2+3)-(y1-3))
	--animFullDraw(menuVEdge, x1, ((y1 + y2) / 2) - ((((y2 - y1) / duration) * math.abs(i))/2), 0.5, ((y2 - y1) / duration) * math.abs(i), x1-3, y1-3, (x2+3)-(x1-3), (y2+3)-(y1-3))
	--animFullDraw(menuHEdge, x1, ((y1 + y2) / 2) + ((((y2 - y1) / duration) * math.abs(i))/2), x2 - x1, -0.5, x1-3, y1-3, (x2+3)-(x1-3), (y2+3)-(y1-3))
	--animFullDraw(menuVEdge, x2, ((y1 + y2) / 2) - ((((y2 - y1) / duration) * math.abs(i))/2), -0.5, ((y2 - y1) / duration) * math.abs(i), x1-3, y1-3, (x2+3)-(x1-3), (y2+3)-(y1-3))
	--animFullDraw(menuCorner, x1, ((y1 + y2) / 2) - ((((y2 - y1) / duration) * math.abs(i))/2), 0.5, 0.5, x1-3, y1-3, (x2+3)-(x1-3), (y2+3)-(y1-3)) --TL
	--animFullDraw(menuCorner, x2, ((y1 + y2) / 2) - ((((y2 - y1) / duration) * math.abs(i))/2), -0.5, 0.5, x1-3, y1-3, (x2+3)-(x1-3), (y2+3)-(y1-3)) --TR
	--animFullDraw(menuCorner, x1, ((y1 + y2) / 2) + ((((y2 - y1) / duration) * math.abs(i))/2), 0.5, -0.5, x1-3, y1-3, (x2+3)-(x1-3), (y2+3)-(y1-3)) --BL
	--animFullDraw(menuCorner, x2, ((y1 + y2) / 2) + ((((y2 - y1) / duration) * math.abs(i))/2), -0.5, -0.5, x1-3, y1-3, (x2+3)-(x1-3), (y2+3)-(y1-3)) --BR
	--if sb then
		--animFullDraw(menuBG, x2+9, ((y1 + y2) / 2) - (((((y2+3) - (y1-3)) / duration) * math.abs(i))/2), (x2+13) - (x2+9), (((y2+3) - (y1-3)) / duration) * math.abs(i), x2+6, y1-3, (x2+16)-(x2+6), (y2+3)-(y1-3))
		--animFullDraw(menuScrollbar, x2+9, ((y1 + y2) / 2) - (((((y2+3) - (y1-3)) / duration) * math.abs(i))/2), (x2+13) - (x2+9), 1, x2+6, ((y1 + y2) / 2) - (((((y2+3) - (y1-3)) / duration) * math.abs(i))/2), (x2+16)-(x2+6), (y2+3)-(y1-3))
		--animFullDraw(menuScrollbar, x2+8, ((y1 + y2) / 2) - (((((y2+3) - (y1-3)) / duration) * math.abs(i))/2), 1, (((y2+3) - (y1-3)) / duration) * math.abs(i), x2+8, y1-3, (x2+14)-(x2+8), (y2+3)-(y1-3))
		--animFullDraw(menuScrollbar, x2+9, ((y1 + y2) / 2) + (((((y2+3) - (y1-3)) / duration) * math.abs(i))/2), (x2+13) - (x2+9), -1, x2+6, ((y1 + y2) / 2) - (((((y2+3) - (y1-3)) / duration) * math.abs(i))/2), (x2+16)-(x2+6), (y2+3)-(y1-3))
		--animFullDraw(menuScrollbar, x2+14, ((y1 + y2) / 2) - (((((y2+3) - (y1-3)) / duration) * math.abs(i))/2), -1, (((y2+3) - (y1-3)) / duration) * math.abs(i), x2+8, y1-3, (x2+14)-(x2+8), (y2+3)-(y1-3))
		--if i >= duration then
			--animFullDraw(menuScrollbar, x2+8, (y1-2) + (((y2+2)-(y1-2)) - (((y2+2)-(y1-2)) / ((sbSize+1) - sbLimit) * ((sbSize+1) - sbCurPos))), 6, ((y2+2)-(y1-2)) / ((sbSize+1) - sbLimit), x2+6, ((y1 + y2) / 2) - (((((y2+3) - (y1-3)) / duration) * math.abs(i))/2), (x2+16)-(x2+6), (y2+3)-(y1-3))
		--end
	--end
--end

--;===========================================================
--; MAIN MENU STUFF
--;===========================================================
function f_default()
	setAutoLevel(false) --generate autolevel.txt in debug dir
	setHomeTeam(2) --P2 side considered the home team: http://mugenguild.com/forum/topics/ishometeam-triggers-169132.0.html
	resetRemapInput()
	--settings adjustable via options
	setAutoguard(1, data.autoguard)
	setAutoguard(2, data.autoguard)
	setRoundTime(data.roundTime * 60)
	setLifeMul(data.lifeMul / 100)
	setTeam1VS2Life(data.team1VS2Life / 100)
	setTurnsRecoveryRate(1.0 / data.turnsRecoveryRate)
	setSharedLife(data.teamLifeShare)
	--default values for all modes
	data.p1Char = nil --no predefined P1 character (assigned via table: {X, Y, (...)})
	data.p2Char = nil --no predefined P2 character (assigned via table: {X, Y, (...)})
	data.p1TeamMenu = nil --no predefined P1 team mode (assigned via table: {mode = X, chars = Y})
	data.p2TeamMenu = nil --no predefined P2 team mode (assigned via table: {mode = X, chars = Y})
	data.aiFight = false --AI = data.difficulty for all characters disabled
	data.stageMenu = false --stage selection disabled
	data.p2Faces = false --additional window with P2 select screen small portraits (faces) disabled
	data.coop = false --P2 fighting on P1 side disabled
	data.p2SelectMenu = true --P2 character selection enabled
	data.orderSelect = true --order select screen enabled
	data.versusScreen = true --versus screen enabled
	data.victoryscreen = true --victory screen enabled
	data.serviceScreen = false --service screen disabled
	data.challengerScreen = true --Here comes a New Challenger screen enabled
	data.p1In = 1 --P1 controls P1 side of the select screen
	data.p2In = 0 --P2 controls in the select screen disabled
	data.gameMode = '' --additional variable used to distinguish modes in select screen
	data.rosterMode = '' --additional variable used to identify special modes in select screen
	data.rosterAdvance = false --additional variable used to identify advanced games in select screen
	data.missionNo = '' --additional variable used to identify missions in select screen
	data.eventNo = '' --additional variable used to identify events in select screen
	setHUD(true) --just enable or disable hud elements in game (added via system-script.ssz)
	setServiceType(0) --don't touch
	setGameType(0) --set game type to identify in minus.cns (0:No Special Match, 1:Demo Match, 2:Training Match, 3:Bonus Match, 4:Input Test Match)
end

sysTime = tonumber(os.date("%H")) --Assigns the current hour to a variable based on the system clock. Used for day/night features.
sysTime2 = tonumber(os.date("%d")) --Assigns the current day to a variable based on date. Used for daily events features.
--sysTime3 = tonumber(os.date("%m"))

--;===========================================================
--; LOAD STATISTICS CONTENT
--;===========================================================
--Data loading from stats_sav.lua
local file = io.open("saved/stats_sav.lua","r")
s_dataLUA = file:read("*all")
file:close()

function f_saveProgress()
	--Data saving to stats_sav.lua
	local t_progress = {
		['data.arcadeUnlocks'] = data.arcadeUnlocks,
		['data.survivalUnlocks'] = data.survivalUnlocks,
		['data.coins'] = data.coins,
		['data.playTime'] = data.playTime,
		['data.favoriteChar'] = data.favoriteChar,
		['data.favoriteStage'] = data.favoriteStage,
		['data.victories'] = data.victories,
		['data.defeats'] = data.defeats,
		['data.preferredMode'] = data.preferredMode,
		['data.arcademodeCnt'] = data.arcademodeCnt,
		['data.vsmodeCnt'] = data.vsmodeCnt,
		['data.survivalmodeCnt'] = data.survivalmodeCnt,
		['data.bossrushmodeCnt'] = data.bossrushmodeCnt,
		['data.bonusrushmodeCnt'] = data.bonusrushmodeCnt,
		['data.timeattackmodeCnt'] = data.timeattackmodeCnt,
		['data.suddendeathmodeCnt'] = data.suddendeathmodeCnt,
		['data.cpumatchmodeCnt'] = data.cpumatchmodeCnt,
		['data.eventsmodeCnt'] = data.eventsmodeCnt,
		['data.missionsmodeCnt'] = data.missionsmodeCnt,
		['data.endlessmodeCnt'] = data.endlessmodeCnt,
		['data.timetrialsmodeCnt'] = data.timetrialsmodeCnt,
		['data.storymodeCnt'] = data.storymodeCnt,
		['data.tourneymodeCnt'] = data.tourneymodeCnt,
		['data.event1Status'] = data.event1Status,
		['data.event2Status'] = data.event2Status,
		['data.event3Status'] = data.event3Status,
		['data.mission1Status'] = data.mission1Status,
		['data.mission2Status'] = data.mission2Status,
		['data.mission3Status'] = data.mission3Status,
		['data.mission4Status'] = data.mission4Status,
		['data.mission5Status'] = data.mission5Status,
		['data.mission6Status'] = data.mission6Status
	}
	s_dataLUA = f_strSub(s_dataLUA, t_progress)
	local file = io.open("saved/stats_sav.lua","w+")
	file:write(s_dataLUA)
	file:close()
end