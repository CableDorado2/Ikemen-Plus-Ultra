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
padFnt = fontNew('data/font/f-pad.fnt')
survBarsFnt = fontNew('data/font/survival_bars.fnt')
survNumFnt = fontNew('data/font/survival_nums.fnt')
jgFnt = fontNew('data/font/JG.fnt')
font1 = fontNew('data/font/f-4x6.fnt')
font2 = fontNew('data/font/f-6x9.fnt')
font3 = fontNew('data/font/14x14.fnt')
font4 = fontNew('data/font/18x18.fnt')
font5 = fontNew('data/font/Qoh_small.fnt')
font6 = fontNew('data/font/QOH_BIG.fnt')
font7 = fontNew('data/font/f-6x8f.fnt')
font8 = fontNew('data/font/f-6x9f.fnt')
font9 = fontNew('data/font/font3.fnt')
font10 = fontNew('data/font/font4.fnt')
font11 = fontNew('data/font/font5.fnt')
font12 = fontNew('data/font/score1.fnt')
font13 = fontNew('data/font/kof99.fnt')
font14 = fontNew('data/font/MvcName.fnt')
font15 = fontNew('data/font/name1.fnt')
font16 = fontNew('data/font/num1.fnt')
font17 = fontNew('data/font/sf2_name.fnt')
font18 = fontNew('data/font/sf2_small.fnt')
font19 = fontNew('data/font/sf2_sys.fnt')
font20 = fontNew('data/font/sfz2a_system.fnt')
font21 = fontNew('data/font/ssf2x_10.fnt')
font22 = fontNew('data/font/ssf2x_s.fnt')
font23 = fontNew('data/font/ssf2x_sL.fnt')
font24 = fontNew('data/font/ssf2x_vL.fnt')

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

--Random Versus Music
function f_bgmrandomVS()
	local randomTrack = {"sound/Random 1.mp3", "sound/Random 2.mp3"}
	playBGM(randomTrack[math.random(1, #randomTrack)])
end

--Random Menu Music
function f_bgmrandomMenu()
	local randomTrack = {"sound/Menu 1.mp3", "sound/Menu 2.mp3", "sound/Menu 3.ogg"}
	playBGM(randomTrack[math.random(1, #randomTrack)])
end

--Random Select Challenger Menu Music
function f_bgmrandomChallenger()
	local randomTrack = {bgmSelectChallenger, bgmSelect, bgmSelectBoss}
	playBGM(randomTrack[math.random(1, #randomTrack)])
end

--Menu Music
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

--Select Challenger Menu Music
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

--Menu Background
menuBG = animNew(sysSff, [[
300,1, 0,0, -1
]])
animSetPos(menuBG, 40, 30)
animSetAlpha(menuBG, 20, 50)
animUpdate(menuBG)

--Scrollbar (for below function)
menuScrollbar = animNew(sysSff, [[
1002,0, 0,0, -1
]])

--Dynamically draw menu window based on given parameters
function f_drawBorder(x1, y1, x2, y2, pn, i, duration, sb, sbSize, sbLimit, sbCurPos)
	x2 = x2 or 320-x1
	y2 = y2 or 240-y1
	duration = duration or 10
	sb = sb or false
	if pn == 2 then
		menuCorner = animNew(sysSff, [[
		1001,0, 0,0, -1
		]])
		menuHEdge = animNew(sysSff, [[
		1001,1, 0,0, -1
		]])
		menuVEdge = animNew(sysSff, [[
		1001,2, 0,0, -1
		]])
		menuCorner2 = animNew(sysSff, [[
		1000,0, 0,0, -1
		]])
		menuHEdge2 = animNew(sysSff, [[
		1000,1, 0,0, -1
		]])
		menuVEdge2 = animNew(sysSff, [[
		1000,2, 0,0, -1
		]])
	else
		menuCorner = animNew(sysSff, [[
		1000,0, 0,0, -1
		]])
		menuHEdge = animNew(sysSff, [[
		1000,1, 0,0, -1
		]])
		menuVEdge = animNew(sysSff, [[
		1000,2, 0,0, -1
		]])
		menuCorner2 = animNew(sysSff, [[
		1001,0, 0,0, -1
		]])
		menuHEdge2 = animNew(sysSff, [[
		1001,1, 0,0, -1
		]])
		menuVEdge2 = animNew(sysSff, [[
		1001,2, 0,0, -1
		]])
	end
	animFullDraw(menuBG, x1, ((y1 + y2) / 2) - ((((y2 - y1) / duration) * math.abs(i))/2), x2 - x1, ((y2 - y1) / duration) * math.abs(i), x1-3, y1-3, (x2+3)-(x1-3), (y2+3)-(y1-3))
	animFullDraw(menuHEdge, x1, ((y1 + y2) / 2) - ((((y2 - y1) / duration) * math.abs(i))/2), x2 - x1, 0.5, x1-3, y1-3, (x2+3)-(x1-3), (y2+3)-(y1-3))
	animFullDraw(menuVEdge, x1, ((y1 + y2) / 2) - ((((y2 - y1) / duration) * math.abs(i))/2), 0.5, ((y2 - y1) / duration) * math.abs(i), x1-3, y1-3, (x2+3)-(x1-3), (y2+3)-(y1-3))
	animFullDraw(menuHEdge, x1, ((y1 + y2) / 2) + ((((y2 - y1) / duration) * math.abs(i))/2), x2 - x1, -0.5, x1-3, y1-3, (x2+3)-(x1-3), (y2+3)-(y1-3))
	animFullDraw(menuVEdge, x2, ((y1 + y2) / 2) - ((((y2 - y1) / duration) * math.abs(i))/2), -0.5, ((y2 - y1) / duration) * math.abs(i), x1-3, y1-3, (x2+3)-(x1-3), (y2+3)-(y1-3))
	animFullDraw(menuCorner, x1, ((y1 + y2) / 2) - ((((y2 - y1) / duration) * math.abs(i))/2), 0.5, 0.5, x1-3, y1-3, (x2+3)-(x1-3), (y2+3)-(y1-3)) --TL
	animFullDraw(menuCorner, x2, ((y1 + y2) / 2) - ((((y2 - y1) / duration) * math.abs(i))/2), -0.5, 0.5, x1-3, y1-3, (x2+3)-(x1-3), (y2+3)-(y1-3)) --TR
	animFullDraw(menuCorner, x1, ((y1 + y2) / 2) + ((((y2 - y1) / duration) * math.abs(i))/2), 0.5, -0.5, x1-3, y1-3, (x2+3)-(x1-3), (y2+3)-(y1-3)) --BL
	animFullDraw(menuCorner, x2, ((y1 + y2) / 2) + ((((y2 - y1) / duration) * math.abs(i))/2), -0.5, -0.5, x1-3, y1-3, (x2+3)-(x1-3), (y2+3)-(y1-3)) --BR
	if sb then
		animFullDraw(menuBG, x2+9, ((y1 + y2) / 2) - (((((y2+3) - (y1-3)) / duration) * math.abs(i))/2), (x2+13) - (x2+9), (((y2+3) - (y1-3)) / duration) * math.abs(i), x2+6, y1-3, (x2+16)-(x2+6), (y2+3)-(y1-3))
		animFullDraw(menuScrollbar, x2+9, ((y1 + y2) / 2) - (((((y2+3) - (y1-3)) / duration) * math.abs(i))/2), (x2+13) - (x2+9), 1, x2+6, ((y1 + y2) / 2) - (((((y2+3) - (y1-3)) / duration) * math.abs(i))/2), (x2+16)-(x2+6), (y2+3)-(y1-3))
		animFullDraw(menuScrollbar, x2+8, ((y1 + y2) / 2) - (((((y2+3) - (y1-3)) / duration) * math.abs(i))/2), 1, (((y2+3) - (y1-3)) / duration) * math.abs(i), x2+8, y1-3, (x2+14)-(x2+8), (y2+3)-(y1-3))
		animFullDraw(menuScrollbar, x2+9, ((y1 + y2) / 2) + (((((y2+3) - (y1-3)) / duration) * math.abs(i))/2), (x2+13) - (x2+9), -1, x2+6, ((y1 + y2) / 2) - (((((y2+3) - (y1-3)) / duration) * math.abs(i))/2), (x2+16)-(x2+6), (y2+3)-(y1-3))
		animFullDraw(menuScrollbar, x2+14, ((y1 + y2) / 2) - (((((y2+3) - (y1-3)) / duration) * math.abs(i))/2), -1, (((y2+3) - (y1-3)) / duration) * math.abs(i), x2+8, y1-3, (x2+14)-(x2+8), (y2+3)-(y1-3))
		if i >= duration then
			animFullDraw(menuScrollbar, x2+8, (y1-2) + (((y2+2)-(y1-2)) - (((y2+2)-(y1-2)) / ((sbSize+1) - sbLimit) * ((sbSize+1) - sbCurPos))), 6, ((y2+2)-(y1-2)) / ((sbSize+1) - sbLimit), x2+6, ((y1 + y2) / 2) - (((((y2+3) - (y1-3)) / duration) * math.abs(i))/2), (x2+16)-(x2+6), (y2+3)-(y1-3))
		end
	end
end

sysTime = tonumber(os.date("%H")) --Assigns the current hour to a variable based on the system clock. Used for day/night features.
sysTime2 = tonumber(os.date("%d")) --Assigns the current day to a variable based on date. Used for daily events features.
--sysTime3 = tonumber(os.date("%m"))

--;===========================================================
--; LOAD ADDITIONAL SCRIPTS
--;===========================================================
require('script.randomtest')
require('script.storyboard')